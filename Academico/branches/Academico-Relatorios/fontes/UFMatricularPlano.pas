unit UFMatricularPlano;

interface

uses
   Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms, 
   Dialogs, DB, ZAbstractRODataset, UZDataset, ExtCtrls, StdCtrls, DBCtrls,
   ComCtrls, DBClient, Grids, DBGrids, Buttons, DateUtils, Spin, Math, Mask,
   UZDbcFuncs, ZDbcIntfs;

const
   DESCONTO_CONDICIONAL = 1;
   DESCONTO_FIXO = 2;

   TIPO_DESCONTO_SOMA = 0;
   TIPO_DESCONTO_PROPORCIONAl = 1;
   TIPO_DESCONTO_SOBREPOR = 2;

type
   TfMatricularPlano = class(TFrame)
      qryPlanoPgto: TUMZReadOnlyQuery;
      qryPlanoPgtoCD_PLANO: TIntegerField;
      qryPlanoPgtoCD_COLIGADA: TIntegerField;
      qryPlanoPgtoCD_TIPO_PLANO: TIntegerField;
      qryPlanoPgtoDS_PLANO: TStringField;
      qryPlanoPgtoNR_ANOSEMESTRE: TSmallintField;
      qryPlanoPgtoNR_PARCELAS: TSmallintField;
      qryPlanoPgtoVL_COBRADO: TFloatField;
      qryPlanoPgtoVL_CONTRATO: TFloatField;
      qryPlanoPgtoVL_TAXAMATERIAL: TFloatField;
      qryPlanoPgtoVL_TAXAAPOSTILA: TFloatField;
      qryPlanoPgtoVL_DESCONTO: TFloatField;
      qryPlanoPgtoVL_MATRICULA: TFloatField;
      qryPlanoPgtoDT_APARTIR: TDateTimeField;
      qryPlanoPgtoNR_TAXASMATERIAL: TSmallintField;
      qryPlanoPgtoNR_DIAS_PARCELA_ZERO: TSmallintField;
      qryPlanoPgtoSN_DIAS_UTEIS: TSmallintField;
      qryPlanoPgtoSN_CREDITOS: TSmallintField;
      qryPlanoPgtoNR_CREDITOS_BASE: TFloatField;
      qryPlanoPgtoNR_MAX_DISCIPLINAS: TLargeintField;
      qryPlanoPgtoDS_DIAS_VENCTO: TStringField;
      qryPlanoPgtoSN_PULAR_SABADOS: TSmallintField;
      qryPlanoPgtoSN_PULAR_DOMINGOS: TSmallintField;
      qryPlanoPgtoSN_PULAR_FERIADOS: TSmallintField;
      dsPlanoPgto: TDataSource;
      pnlOpcoes: TPanel;
      dblcPlanoPgto: TDBLookupComboBox;
      lblPlanoPgto: TLabel;
      gbVencto: TGroupBox;
      rbVenctoPlano: TRadioButton;
      rbVenctoDiaUtil: TRadioButton;
      lblVenctoSempre: TLabel;
      dtpVenctoDiaUtil: TDateTimePicker;
      cbDiaVencto: TComboBox;
      qryItensPlano: TUMZReadOnlyQuery;
      qryItensPlanoCD_PLANO_ITEM: TIntegerField;
      qryItensPlanoCD_PLANO: TIntegerField;
      qryItensPlanoNR_PARCELA: TSmallintField;
      qryItensPlanoVL_BRUTO: TFloatField;
      qryItensPlanoVL_DESCONTO: TFloatField;
      qryItensPlanoVL_EXTRA: TFloatField;
      qryItensPlanoVL_DESCONTO_EXTRA: TFloatField;
      qryItensPlanoVL_TOTAL: TFloatField;
      qryItensPlanoNR_DIA: TSmallintField;
      qryItensPlanoNR_MES: TIntegerField;
      qryItensPlanoNR_ANO: TIntegerField;
      qryItensPlanoNR_CREDITOS_MINIMOS: TFloatField;
      qryItensPlanoSN_CREDITO_PARCELA: TSmallintField;
      qryItensPlanoCD_TIPO_PARCELA: TIntegerField;
      qryItensPlanoSN_DIVISIVEL: TSmallintField;
      cdsParcelas: TClientDataSet;
      cdsParcelasCD_TIPO_TITULO: TIntegerField;
      cdsParcelasNR_PARCELA: TIntegerField;
      cdsParcelasDT_VENCTO: TDateField;
      cdsParcelasVL_BRUTO: TCurrencyField;
      cdsParcelasVL_DESCONTO: TCurrencyField;
      cdsParcelasVL_EXTRA: TCurrencyField;
      cdsParcelasCD_RESPONSAVEL: TIntegerField;
      cdsParcelasNM_RESPONSAVEL: TStringField;
      dsParcelas: TDataSource;
      bvlSep1: TBevel;
      dbgParcelas: TDBGrid;
      cdsParcelasVL_DESC_EXTRA: TCurrencyField;
      qryResponsavel: TUMZReadOnlyQuery;
      qryResponsavelCD_PESSOA: TIntegerField;
      qryResponsavelNM_PESSOA: TStringField;
      qryResponsavelCD_RESP_FINAN: TIntegerField;
      qryResponsavelNM_RESP_FINAN: TStringField;
      cdsParcelasPtrItemPlano: TIntegerField;
      qryItensPlanoDS_TIPO_TITULO: TStringField;
      sbCalcVencto: TSpeedButton;
      rbVenctoSempre: TRadioButton;
      lblVenctoDiaUtil: TLabel;
      dtpVenctoSempre: TDateTimePicker;
      lblVenctoOpcs: TLabel;
      sbRestaurar: TSpeedButton;
      sbDividirTitulos: TSpeedButton;
      cdsParcelasSN_DIVISIVEL: TBooleanField;
      sbDividirResp: TSpeedButton;
      sbPlanoDesconto: TSpeedButton;
      lblDescontoProg: TLabel;
      imgPlanoDesconto: TImage;
      imgNumParcelas: TImage;
      imgDivisao: TImage;
      cdsParcelasSN_RECIBO_IMP: TBooleanField;
      cdsParcelasSN_GERAR: TBooleanField;
      cdsParcelasSN_PERDOAR: TBooleanField;
      cdsParcelasNR_CREDITOS: TFloatField;
      cdsParcelasCD_CONTA: TIntegerField;
      qryItensPlanoCD_CONTA: TLargeintField;
      cbDiaUtil: TComboBox;
      cdsParcelasCD_ACAO_MOVIMENTO: TLargeintField;
      cbUtilizarDescProgramado: TCheckBox;
      cdsParcelasCD_DESC_CONDICIONAL: TLargeintField;
      rbVenctoEstudante: TRadioButton;
      lbDiaVencEstudante: TLabel;
      qryDtVencPessoa: TUMZReadOnlyQuery;
      qryDtVencPessoaNR_DIA_VENCIMENTO: TLargeintField;
      cdsParcelasVENC_ATUAL: TBooleanField;
      cdsParcelasSN_DIVIDIDO: TBooleanField;
      cdsParcelasVL_CREDITO: TCurrencyField;
      cdsDescontos: TClientDataSet;
      cdsDescontosVL_DESCONTO: TCurrencyField;
      cdsDescontosCD_ACAO_MOVIMENTO: TIntegerField;
      cdsDescontosDS_OBSERVACAO: TStringField;
      cdsDescontosCD_TIPO_DESCONTO: TIntegerField;
      cdsDescontosCD_TIPO_COMPORTAMENTO: TIntegerField;
      qryPlanoPgtocd_acao_movimento_desc_cond: TLargeintField;
      qryPlanoPgtocd_acao_movimento_desc_fixo: TLargeintField;
      cdsDescontosIDX_PARCELA: TIntegerField;
      qryDescontoProgFixo: TUMZReadOnlyQuery;
      qryDescontoProgCondicional: TUMZReadOnlyQuery;
      cdsDescontosSN_DESCONTO_PLANO: TIntegerField;
    cdsParcelasIDX_PARCELA: TIntegerField;
    cdsParcelasVL_PERCENTUAL_DIVISAO: TCurrencyField;
    cdsParcelasVL_LIQUIDO: TCurrencyField;
    qryItensPlanoSN_MANTER_NUMERO_PARCELA: TSmallintField;
    cdsParcelasSN_MANTER_NUMERO_PARCELA: TBooleanField;
    cdsParcelasDS_TIPO_TITULO: TStringField;
    qryItensPlanoSN_BLOQUEADO: TSmallintField;
    qryPlanoPgtoNR_TIPO_VENCTO: TSmallintField;
    cdsParcelasNR_TIPO_VENCTO: TIntegerField;
    cdsParcelasDS_FORMULA_VENCTO: TStringField;
    cdsParcelasSN_BLOQUEADO: TBooleanField;
    qryPlanoPgtoNR_FORMULA_VENCTO: TSmallintField;
    qryPlanoPgtoNR_FORMULA_OPERADOR: TSmallintField;
    qryPlanoPgtoNR_FORMULA_DIAS: TIntegerField;
    qryItensPlanoNR_FORMULA_VENCTO: TSmallintField;
    qryItensPlanoNR_FORMULA_OPERADOR: TSmallintField;
    qryItensPlanoNR_FORMULA_DIAS: TIntegerField;
    procedure dblcPlanoPgtoClick(Sender: TObject);
    procedure dsParcelasDataChange(Sender: TObject; Field: TField);
    procedure cdsParcelasCalcFields(DataSet: TDataSet);
      procedure rbVenctoEstudanteClick(Sender: TObject);
      procedure cbUtilizarDescProgramadoClick(Sender: TObject);
      procedure cdsParcelasDT_VENCTOSetText(Sender: TField; const Text: string);
      procedure cbDiaUtilSelect(Sender: TObject);
      procedure sbPlanoDescontoClick(Sender: TObject);
      procedure sbDividirRespClick(Sender: TObject);
      procedure dbgParcelasDrawColumnCell(Sender: TObject; const Rect: TRect;
         DataCol: Integer; Column: TColumn; State: TGridDrawState);
      procedure sbDividirTitulosClick(Sender: TObject);
      procedure sbRestaurarClick(Sender: TObject);
      procedure dtpVenctoSempreChange(Sender: TObject);
      procedure cbDiaVenctoSelect(Sender: TObject);
      procedure dtpVenctoDiaUtilChange(Sender: TObject);
      procedure rbVenctoSempreClick(Sender: TObject);
      procedure rbVenctoDiaUtilClick(Sender: TObject);
      procedure rbVenctoPlanoClick(Sender: TObject);
      procedure sbCalcVenctoClick(Sender: TObject);
      procedure dsPlanoPgtoDataChange(Sender: TObject; Field: TField);
   private
      bHabilitadaProgramacaoDesconto, bPermissaoAplicarPlanoDesconto,
      bPermissaoAlterarQuantidadeParcelas, bPermissaoDividirTitulos,
      bUsouPlanoDesconto, bUsouAlterarQuantidadeParcelas, bUsouDividirTitulos: Boolean;
      nrIdxProxParcela: Integer;
      procedure gerarAcoesMovimentoPlanoDesconto(idxParcela: Integer);
      procedure habilitaOpcoesParcela;
      procedure habilitaProgramacaoDescontoEstudante;
      procedure RecalcularDescontoCondicionalPlanoPagamento(idxParcela: Integer);
      function GetDescontoCondicionalPlanoPagamento(idxParcela: Integer): Currency;
      function GetCodigoRespFinan: Integer;
      function GetNomeRespFinan: string;
      function GetNrIdxProxParcela(): Integer;
      function GetValorCreditoTurma(const AnoSemestre: Integer;
         const TurmaId: AnsiString; const nrParcelasPlanoSelecionado: Integer): Double;
      function GetValorDescontoTurma(const AnoSemestre: Integer;
         const TurmaId: AnsiString; const nrParcelasPlanoSelecionado: Integer): Double;
      function GetValorDescontoExtraTurma(const AnoSemestre: Integer;
         const TurmaId: AnsiString; const nrParcelasPlanoSelecionado: Integer): Double;
      procedure AplicaDescontoFixoProgramado;
      procedure AplicaDescontoCondicionalProgramado;
      procedure AplicaPlanoPgto;
      procedure CarregaParcelasDivisao;
      procedure CarregaTitulosDivisao;
      procedure CarregaTitulosDivididos;
      procedure CalculaVencimentos;
   public
      procedure Inicializa;
      procedure Finaliza;
      procedure GeraMensalidades;
      procedure CarregaTitulosDesconto;
   end;

var
   vencimento_definido: TDateTime;

implementation

uses
   UFMatricular, uDM, General, UFMatricularDivisaoParcelas,
   UFMatricularDivisaoTitulos, UFMatricularPlanoDesconto,
   uUsuario;

{$R *.dfm}

procedure TfMatricularPlano.AplicaDescontoCondicionalProgramado;
var
   valorDescontoCondicional, idxPercentualPlano,
   diffDesconto, valorTotal: Currency;
   Posicao: Pointer;
begin

   {
     APLICA O DESCONTO CONDICIONAL SOBRE A MENSALIDADE DO ALUNO

     Se o desconto foi informado como percentual (%), o percentual é convertido em base numérica, ou seja,
     converte o valor percentual em um valor real cálculado (R$)
   }

   // Busca os descontos programados CONDICIONAL do estudante
   qryDescontoProgCondicional.Close;
   qryDescontoProgCondicional.ParamByName('cd_curso').AsString := fMatricular.qryTurmaCD_CURSO.AsString;
   qryDescontoProgCondicional.ParamByName('cd_pessoa').AsInteger := fMatricular.Pessoa;
   qryDescontoProgCondicional.ParamByName('cd_depto').AsInteger := fMatricular.qryTurmaCD_DEPTO.AsInteger;
   qryDescontoProgCondicional.ParamByName('nr_parcela').AsInteger := qryItensPlano.FieldByName('nr_parcela').AsInteger;
   qryDescontoProgCondicional.ParamByName('cd_tipo_parcela').AsInteger := qryItensPlano.FieldByName('cd_tipo_parcela').AsInteger;
   if qryPlanoPgto.FieldByName('cd_coligada').AsInteger > 0 then
   begin
      qryDescontoProgCondicional.ParamByName('cd_coligada').AsInteger := qryPlanoPgto.FieldByName('cd_coligada').AsInteger;
   end else begin
      qryDescontoProgCondicional.ParamByName('cd_coligada').Clear;
   end;
   qryDescontoProgCondicional.Open;

   // Verifica se o aluno possui desconto programado
   if (not bHabilitadaProgramacaoDesconto) and
      (qryDescontoProgCondicional.RecordCount > 0) then
   begin
      habilitaProgramacaoDescontoEstudante();
   end;

   // Se não está habilitado para utilizar o desconto programado então não executa o procedimento de desconto programado
   if not cbUtilizarDescProgramado.Checked then
   begin
      Exit;
   end;

   //cdsParcelas.Last;
   cdsParcelas.Edit;      
      
   // Armazena todas as ações de movimento de desconto fixo
   qryDescontoProgCondicional.First;
   while not qryDescontoProgCondicional.Eof do
   begin
      valorDescontoCondicional := 0;

      // Verifica se existe um percentual de desconto informado específicamente para a pessoa (desconto especial)
      if ( qryDescontoProgCondicional.FieldByName('vl_percentual').AsFloat > 0 ) then
      begin
         valorDescontoCondicional := (cdsParcelasVL_BRUTO.AsCurrency - cdsParcelasVL_DESC_EXTRA.AsCurrency) * (qryDescontoProgCondicional.FieldByName('vl_percentual').AsCurrency / 100)

      end
      else if qryDescontoProgCondicional.FieldByName('VL_FIXO').AsFloat > 0 then
      begin
         valorDescontoCondicional := qryDescontoProgCondicional.FieldByName('VL_FIXO').AsFloat

      // Caso não existe um desconto especial para a pessoa, utiliza o desconto do plano de descontos se houver
      end else if ( qryDescontoProgCondicional.FieldByName('cd_desconto').AsFloat > 0 ) then
      begin
      
         // Verifica se o desconto do plano de descontos é percentual (%)
         if ( qryDescontoProgCondicional.FieldByName('percentualdesconto').AsFloat > 0 ) then
         begin
            valorDescontoCondicional := (cdsParcelasVL_BRUTO.AsCurrency - cdsParcelasVL_DESC_EXTRA.AsCurrency) * (qryDescontoProgCondicional.FieldByName('percentualdesconto').AsCurrency / 100);

         // Verifica se o desconto do plano de descontos é em R$
         end else if ( qryDescontoProgCondicional.FieldByName('valordesconto').AsFloat > 0 ) then
         begin
            valorDescontoCondicional := qryDescontoProgCondicional.FieldByName('valordesconto').AsCurrency;
         end;
      end;

      valorDescontoCondicional := RoundFloat(valorDescontoCondicional, 2);

      // Verifica se existe algum valor de desconto
      if ( valorDescontoCondicional > 0 ) then
      begin
               
         //SOMA
         if ( qryDescontoProgCondicional.FieldByName('cd_tipo_desconto').AsInteger = TIPO_DESCONTO_SOMA ) then
         begin
            cdsParcelasVL_DESCONTO.AsCurrency := cdsParcelasVL_DESCONTO.AsCurrency + valorDescontoCondicional;

         //PROPORCIONAL
         end else if ( qryDescontoProgCondicional.FieldByName('cd_tipo_desconto').AsInteger = TIPO_DESCONTO_PROPORCIONAl ) then
         begin
            idxPercentualPlano := (cdsParcelasVL_DESCONTO.AsCurrency / (cdsParcelasVL_BRUTO.AsCurrency-cdsParcelasVL_DESC_EXTRA.AsCurrency));
            cdsParcelasVL_DESCONTO.AsCurrency := (((cdsParcelasVL_BRUTO.AsCurrency - cdsParcelasVL_DESC_EXTRA.AsCurrency) - valorDescontoCondicional) * idxPercentualPlano) + valorDescontoCondicional;

         //SOBREPOR
         end else begin
            cdsParcelasVL_DESCONTO.AsCurrency := valorDescontoCondicional;
         end;

         cdsParcelasVL_DESCONTO.AsCurrency := RoundFloat(cdsParcelasVL_DESCONTO.AsCurrency, 2); 

         // Verifica se os descontos não são maiores
         valorTotal := (cdsParcelasVL_BRUTO.AsCurrency + cdsParcelasVL_EXTRA.AsCurrency);
         diffDesconto := (valorTotal - cdsParcelasVL_DESC_EXTRA.AsCurrency);

         // Se o desconto fixo for menor que zero significa que o valor do desconto é maior que a mensalidade
         if ( diffDesconto < 0 ) then
         begin
            diffDesconto := 0;
         end;

         if ( cdsParcelasVL_DESCONTO.AsCurrency > diffDesconto ) then
         begin
            cdsParcelasVL_DESCONTO.AsCurrency := diffDesconto;
         end;

         cdsParcelasCD_DESC_CONDICIONAL.AsInteger := qryDescontoProgCondicional.FieldByName('cd_acao_movimento').AsInteger;

         //Cria a acao de movimento
         if ( cdsParcelasVL_DESCONTO.AsCurrency > 0 ) then
         begin
            cdsDescontos.Insert;
            cdsDescontosIDX_PARCELA.AsInteger := cdsParcelasIDX_PARCELA.AsInteger;
            cdsDescontosVL_DESCONTO.AsCurrency := valorDescontoCondicional;
            cdsDescontosCD_ACAO_MOVIMENTO.AsInteger := qryDescontoProgCondicional.FieldByName('cd_acao_movimento').AsInteger;
            cdsDescontosCD_TIPO_DESCONTO.AsInteger := DESCONTO_CONDICIONAL;
            cdsDescontosDS_OBSERVACAO.AsString := qryDescontoProgCondicional.FieldByName('ds_historico').AsString;
            cdsDescontosCD_TIPO_COMPORTAMENTO.AsInteger := qryDescontoProgCondicional.FieldByName('cd_tipo_desconto').AsInteger;
            cdsDescontosSN_DESCONTO_PLANO.AsInteger := 0;
            cdsDescontos.Post;
         end;

      end;

      qryDescontoProgCondicional.Next;
   end;

   cdsParcelas.Post;

   Posicao := cdsParcelas.GetBookmark();

   cdsParcelas.Filtered := False;
   cdsParcelas.GotoBookmark(Posicao);
   cdsParcelas.EnableControls;
end;

procedure TfMatricularPlano.AplicaDescontoFixoProgramado;
var
   valorDescontoFixo, valorDescontoAcumulado, idxPercentualPlano,
   valorTotal, diffDesconto: Currency;
   posicaoDesconto: Pointer;

   descontosCobremValorTitulo: Boolean;
begin

   {
     APLICA O DESCONTO FIXO SOBRE A MENSALIDADE DO ALUNO

     Se o desconto foi informado como percentual (%), o percentual é convertido em base numérica, ou seja,
     converte o valor percentual em um valor real cálculado (R$)
   }

   // Busca os descontos programados FIXOS do estudante
   qryDescontoProgFixo.Close;
   qryDescontoProgFixo.ParamByName('cd_curso').AsString := fMatricular.qryTurmaCD_CURSO.AsString;
   qryDescontoProgFixo.ParamByName('cd_pessoa').AsInteger := fMatricular.Pessoa;
   qryDescontoProgFixo.ParamByName('cd_depto').AsInteger := fMatricular.qryTurmaCD_DEPTO.AsInteger;
   qryDescontoProgFixo.ParamByName('nr_parcela').AsInteger := qryItensPlano.FieldByName('nr_parcela').AsInteger;
   qryDescontoProgFixo.ParamByName('cd_tipo_parcela').AsInteger := qryItensPlano.FieldByName('cd_tipo_parcela').AsInteger;
   if qryPlanoPgto.FieldByName('cd_coligada').AsInteger > 0 then
   begin
      qryDescontoProgFixo.ParamByName('cd_coligada').AsInteger := qryPlanoPgto.FieldByName('cd_coligada').AsInteger;
   end else begin
      qryDescontoProgFixo.ParamByName('cd_coligada').Clear;
   end;
   qryDescontoProgFixo.Open;

   // Verifica se o aluno possui desconto programado
   if (not bHabilitadaProgramacaoDesconto) and
      (qryDescontoProgFixo.RecordCount > 0) then
   begin
      habilitaProgramacaoDescontoEstudante();
   end;

   // Se não está habilitado para utilizar o desconto programado então não executa o procedimento de desconto programado
   if not cbUtilizarDescProgramado.Checked then
   begin
      Exit;
   end;

//   cdsParcelas.Last;
   cdsParcelas.Edit;

   // Flag que irá ser setada se os valores dos descontos aplicados passarão o valor do titulo que o aluno deverá pagar
   descontosCobremValorTitulo := False;

   // Varre os descontos FIXOS programados do aluno
   qryDescontoProgFixo.First;
   while not qryDescontoProgFixo.Eof do
   begin
      valorDescontoFixo := 0;

      // Verifica se existe um percentual de desconto informado específicamente para a pessoa (desconto especial)
      if ( qryDescontoProgFixo.FieldByName('vl_percentual').AsFloat > 0 ) then
      begin

         // Caso PERCENTUAL então cálcula o valor do desconto que será aplicado
         valorDescontoFixo := (cdsParcelasVL_BRUTO.AsCurrency - cdsParcelasVL_DESC_EXTRA.AsCurrency) * (qryDescontoProgFixo.FieldByName('vl_percentual').AsCurrency / 100);
      end
      else if qryDescontoProgFixo.FieldByName('VL_FIXO').AsFloat > 0 then
      begin
         valorDescontoFixo := qryDescontoProgFixo.FieldByName('VL_FIXO').AsFloat

      // Caso não existe um desconto especial para a pessoa, utiliza o desconto do plano de descontos se houver
      end else if ( qryDescontoProgFixo.FieldByName('cd_desconto').AsInteger > 0 ) then
      begin

         // Verifica se o desconto do plano de descontos é percentual (%)
         if ( qryDescontoProgFixo.FieldByName('percentualdesconto').AsFloat > 0 ) then
         begin
            valorDescontoFixo := (cdsParcelasVL_BRUTO.AsCurrency - cdsParcelasVL_DESC_EXTRA.AsCurrency) * (qryDescontoProgFixo.FieldByName('percentualdesconto').AsCurrency / 100);

         // Verifica se o desconto do plano de descontos é em R$
         end else if ( qryDescontoProgFixo.FieldByName('valordesconto').AsCurrency > 0 ) then
         begin
            valorDescontoFixo := qryDescontoProgFixo.FieldByName('valordesconto').AsCurrency;
         end;
      end;

      // Arredonda o desconto fixo
      valorDescontoFixo := RoundFloat(valorDescontoFixo, 2);

      // Verifica se existe algum valor de desconto
      if ( valorDescontoFixo > 0 ) then
      begin

         // Soma o desconto fixo
         valorDescontoAcumulado := cdsParcelasVL_DESC_EXTRA.AsCurrency + valorDescontoFixo;

         //SOMA
         if ( qryDescontoProgFixo.FieldByName('cd_tipo_desconto').AsInteger = TIPO_DESCONTO_SOMA ) then
         begin
            // Não faz NADA (não mexe) no desconto condicional

         //PROPORCIONAL
         end else if ( qryDescontoProgFixo.FieldByName('cd_tipo_desconto').AsInteger = TIPO_DESCONTO_PROPORCIONAl ) then
         begin
            // Faz o desconto proporcional do desconto condicional
            idxPercentualPlano := (cdsParcelasVL_DESCONTO.AsCurrency / (cdsParcelasVL_BRUTO.AsCurrency-cdsParcelasVL_DESC_EXTRA.AsCurrency));
            cdsParcelasVL_DESCONTO.AsCurrency := (cdsParcelasVL_BRUTO.AsCurrency - valorDescontoAcumulado) * idxPercentualPlano;

         // SOBREPOR
         end else begin
            // Zera o desconto condicional
            cdsParcelasVL_DESCONTO.AsCurrency := 0;
         end;

         cdsParcelasVL_DESCONTO.AsCurrency := RoundFloat(cdsParcelasVL_DESCONTO.AsCurrency, 2);

         cdsParcelasVL_DESC_EXTRA.AsCurrency := valorDescontoAcumulado;

         // Cálcula o valor total (valor bruto + valor extra)
         valorTotal := cdsParcelasVL_BRUTO.AsCurrency + cdsParcelasVL_EXTRA.AsCurrency;

         // Verifica se os descontos não são maiores
         diffDesconto := valorTotal - cdsParcelasVL_DESC_EXTRA.AsCurrency;
            
         // Se o desconto fixo for menor que zero significa que o valor do desconto é maior que a mensalidade
         if ( diffDesconto <= 0 ) then
         begin
            // Informa que não deve mais considerar os próximos descontos fixos pois o valor do título ja foi pago com os descontos
            descontosCobremValorTitulo := true;

            // Desconto Extra (fixo) será o valor da mensalidade (pois não se pode descontar mais que o total da mensalidade)
            cdsParcelasVL_DESC_EXTRA.AsCurrency := valorTotal;

            // Se o último desconto aplicado é maior que o necessário para pagar o título
            // ajusta o desconto para ser exatamente o valor que falta para pagar do título
            if (diffDesconto < 0) then
            begin
               // Subtrai a diferença do valor do desconto (deixa o desconto com o valor que falta para completar o título)
               valorDescontoFixo := valorDescontoFixo - Abs(diffDesconto);
            end;
            
         end;

         //Cria a acao de movimento
         if ( cdsParcelasVL_DESC_EXTRA.AsCurrency > 0 ) then
         begin
            cdsDescontos.Insert;
            cdsDescontosIDX_PARCELA.AsInteger := cdsParcelasIDX_PARCELA.AsInteger;
            cdsDescontosVL_DESCONTO.AsCurrency := valorDescontoFixo;
            cdsDescontosCD_ACAO_MOVIMENTO.AsInteger := qryDescontoProgFixo.FieldByName('cd_acao_movimento').AsInteger;
            cdsDescontosCD_TIPO_DESCONTO.AsInteger := DESCONTO_FIXO;
            cdsDescontosDS_OBSERVACAO.AsString := qryDescontoProgFixo.FieldByName('ds_historico').AsString;
            cdsDescontosCD_TIPO_COMPORTAMENTO.AsInteger := qryDescontoProgFixo.FieldByName('cd_tipo_desconto').AsInteger;
            cdsDescontosSN_DESCONTO_PLANO.AsInteger := 0;
            cdsDescontos.Post;
         end;

         // Se os descontos 
         if (descontosCobremValorTitulo) then
         begin
            break;
         end;

      end;

      qryDescontoProgFixo.Next;
   end;

   cdsParcelas.Post;
   posicaoDesconto:= cdsParcelas.GetBookmark();
   cdsParcelas.Filtered := False;
   cdsParcelas.GotoBookmark(posicaoDesconto);
   cdsParcelas.EnableControls;
end;

function TfMatricularPlano.GetValorCreditoTurma(const AnoSemestre: Integer;
  const TurmaId: AnsiString; const nrParcelasPlanoSelecionado: Integer): Double;
const
   SSQLSelectValorCreditoPlanoPadrao = ''
      + 'SELECT '
      + '	p.VL_COBRADO / COALESCE(p.NR_CREDITOS_BASE, 1) VL_CREDITO, '
      + '	p.NR_PARCELAS '
      + 'FROM '
      + '	turmas t '
      + '		JOIN fin_planos p ON '
      + '			(t.CD_PLANO_PADRAO = p.CD_PLANO) '
      + 'WHERE '
      + '	t.codigo = ? AND '
      + '	t.anosemestre = ? AND '
      + '	( '
      + '		p.sn_vigencia = 0 OR '
      + '		CURRENT_DATE BETWEEN DATE(p.dt_vigencia_inicio) AND DATE(p.dt_vigencia_fim) '
      + '	) '
      + 'ORDER BY '
      + '	ABS(p.NR_PARCELAS - ?) ASC, p.nr_parcelas ASC '
      + 'LIMIT 1 ';

   SSQLSelectValorCreditoTurma = ''
      + 'SELECT '
      + '	p.VL_COBRADO / COALESCE(p.NR_CREDITOS_BASE, 1) VL_CREDITO, '
      + '	p.NR_PARCELAS '
      + 'FROM '
      + '	fin_planos_turmas pt '
      + '		JOIN fin_planos p ON '
      + '			(pt.CD_PLANO = p.CD_PLANO) '
      + 'WHERE '
      + '	pt.CD_TURMA = ? AND '
      + '	p.NR_ANOSEMESTRE = ? AND '
      + '	( '
      + '		p.sn_vigencia = 0 OR '
      + '		CURRENT_DATE BETWEEN DATE(p.dt_vigencia_inicio) AND DATE(p.dt_vigencia_fim) '
      + '	) '
      + 'ORDER BY '
      + '	ABS(p.NR_PARCELAS - ?) ASC, p.nr_parcelas ASC '
      + 'LIMIT 1 ';
var
   Stmt: IZPreparedStatement;
   Rs: IZResultSet;
begin
   Result := 0;

   if not fMatricular.UsarValorCreditoDisc then Exit;

   if TurmaId = fMatricular.qryMatriculaCD_TURMA.AsString then Exit;

   Stmt := PrepareStatement(SSQLSelectValorCreditoPlanoPadrao);
   try
      Stmt.SetString(1, TurmaId);
      Stmt.SetInt(2, AnoSemestre);
      Stmt.SetInt(3, nrParcelasPlanoSelecionado);
      Rs := Stmt.ExecuteQueryPrepared;
      try
         if Rs.Next then
         begin
            Result := Rs.GetDoubleByName('VL_CREDITO');

            { Se o número de parcelas do plano selecionado for diferente do
              número de parcelas do plano da turma da disciplina (cursada fora
              da turma), então aplica uma proporcionalidade para que o valor do
              crédito do plano da disciplina fique equivalente ao mesmo numero
              de parcelas do plano selecionado.
              Fórmula exemplificada abaixo
            }
            if nrParcelasPlanoSelecionado <> Rs.GetDoubleByName('NR_PARCELAS') then
            begin
              { Valor do crédito do plano da disciplina * o número de parcelas desse plano
                dividido pelo número de parcelas do plano selecionado
                Exemplo: O plano selecionado é 4 parcelas o valor do crédito é 150,00
                se uma disciplina só possui planos de 6 parcelas com o crédito de 100,00
                Devemos pegar o valor do crédito da disciplina e multiplicar pelo número
                de parcelas 100,00 * 6 = 600,00 dessa forma temos o valor
                em de créditos em 1x, então dividimos pela mesma quantidade de
                parcelas do plano selecionado
              }
              Result := (Rs.GetDoubleByName('VL_CREDITO')*Rs.GetIntByName('NR_PARCELAS'))
                / nrParcelasPlanoSelecionado;
            end;
         end;
      finally
         Rs.Close;
      end;
   finally
      Stmt.Close;
      Stmt := nil;
   end;

   Stmt := PrepareStatement(SSQLSelectValorCreditoTurma);
   try
      Stmt.SetString(1, TurmaId);
      Stmt.SetInt(2, AnoSemestre);
      Stmt.SetInt(3, nrParcelasPlanoSelecionado);
      Rs := Stmt.ExecuteQueryPrepared;
      try
         if Rs.Next then
         begin
            Result := Rs.GetDoubleByName('VL_CREDITO');

            { Se o número de parcelas do plano selecionado for diferente do
              número de parcelas do plano da turma da disciplina (cursada fora
              da turma), então aplica uma proporcionalidade para que o valor do
              crédito do plano da disciplina fique equivalente ao mesmo numero
              de parcelas do plano selecionado.
              Fórmula exemplificada abaixo
            }
            if nrParcelasPlanoSelecionado <> Rs.GetDoubleByName('NR_PARCELAS') then
            begin
              { Valor do crédito do plano da disciplina * o número de parcelas desse plano
                dividido pelo número de parcelas do plano selecionado
                Exemplo: O plano selecionado é 4 parcelas o valor do crédito é 150,00
                se uma disciplina só possui planos de 6 parcelas com o crédito de 100,00
                Devemos pegar o valor do crédito da disciplina e multiplicar pelo número
                de parcelas 100,00 * 6 = 600,00 dessa forma temos o valor
                em de créditos em 1x, então dividimos pela mesma quantidade de
                parcelas do plano selecionado
              }
              Result := (Rs.GetDoubleByName('VL_CREDITO')*Rs.GetIntByName('NR_PARCELAS'))
                / nrParcelasPlanoSelecionado;
            end;
         end;
      finally
         Rs.Close;
      end;
   finally
      Stmt.Close;
      Stmt := nil;
   end;
end;

function TfMatricularPlano.GetValorDescontoTurma(const AnoSemestre: Integer;
  const TurmaId: AnsiString; const nrParcelasPlanoSelecionado: Integer): Double;
const
   SSQLSelectValorCreditoPlanoPadrao = ''
      + 'SELECT '
      + '	pi.VL_DESCONTO / COALESCE(p.NR_CREDITOS_BASE, 1) VL_DESCONTO, '
      + '	p.NR_PARCELAS '
      + 'FROM '
      + '	turmas t '
      + '		JOIN fin_planos p ON '
      + '			(t.CD_PLANO_PADRAO = p.CD_PLANO) '
      + ' INNER JOIN fin_planos_itens pi ON (pi.cd_plano = p.cd_plano) '
      + 'WHERE '
      + '	t.codigo = ? AND '
      + '	t.anosemestre = ? AND '
      + '	( '
      + '		p.sn_vigencia = 0 OR '
      + '		CURRENT_DATE BETWEEN DATE(p.dt_vigencia_inicio) AND DATE(p.dt_vigencia_fim) '
      + '	) '
      + 'ORDER BY '
      + '	ABS(p.NR_PARCELAS - ?) ASC, p.nr_parcelas ASC '
      + 'LIMIT 1 ';

   SSQLSelectValorCreditoTurma = ''
      + 'SELECT '
      + '	pi.VL_DESCONTO / COALESCE(p.NR_CREDITOS_BASE, 1) VL_DESCONTO, '
      + '	p.NR_PARCELAS '
      + 'FROM '
      + '	fin_planos_turmas pt '
      + '		JOIN fin_planos p ON '
      + '			(pt.CD_PLANO = p.CD_PLANO) '
      + ' INNER JOIN fin_planos_itens pi ON (pi.cd_plano = p.cd_plano) '
      + 'WHERE '
      + '	pt.CD_TURMA = ? AND '
      + '	p.NR_ANOSEMESTRE = ? AND '
      + '	( '
      + '		p.sn_vigencia = 0 OR '
      + '		CURRENT_DATE BETWEEN DATE(p.dt_vigencia_inicio) AND DATE(p.dt_vigencia_fim) '
      + '	) '
      + 'ORDER BY '
      + '	ABS(p.NR_PARCELAS - ?) ASC, p.nr_parcelas ASC '
      + 'LIMIT 1 ';
var
   Stmt: IZPreparedStatement;
   Rs: IZResultSet;
begin
   Result := 0;

   if not fMatricular.UsarValorCreditoDisc then Exit;

   if TurmaId = fMatricular.qryMatriculaCD_TURMA.AsString then Exit;

   Stmt := PrepareStatement(SSQLSelectValorCreditoPlanoPadrao);
   try
      Stmt.SetString(1, TurmaId);
      Stmt.SetInt(2, AnoSemestre);
      Stmt.SetInt(3, nrParcelasPlanoSelecionado);
      Rs := Stmt.ExecuteQueryPrepared;
      try
         if Rs.Next then
         begin
            Result := Rs.GetDoubleByName('VL_DESCONTO');

            { Se o número de parcelas do plano selecionado for diferente do
              número de parcelas do plano da turma da disciplina (cursada fora
              da turma), então aplica uma proporcionalidade para que o valor do
              crédito do plano da disciplina fique equivalente ao mesmo numero
              de parcelas do plano selecionado.
              Fórmula exemplificada abaixo
            }
            if nrParcelasPlanoSelecionado <> Rs.GetDoubleByName('NR_PARCELAS') then
            begin
              { Valor do crédito do plano da disciplina * o número de parcelas desse plano
                dividido pelo número de parcelas do plano selecionado
                Exemplo: O plano selecionado é 4 parcelas o valor do crédito é 150,00
                se uma disciplina só possui planos de 6 parcelas com o crédito de 100,00
                Devemos pegar o valor do crédito da disciplina e multiplicar pelo número
                de parcelas 100,00 * 6 = 600,00 dessa forma temos o valor
                em de créditos em 1x, então dividimos pela mesma quantidade de
                parcelas do plano selecionado
              }
              Result := (Rs.GetDoubleByName('VL_DESCONTO')*Rs.GetIntByName('NR_PARCELAS'))
                / nrParcelasPlanoSelecionado;
            end;
         end;
      finally
         Rs.Close;
      end;
   finally
      Stmt.Close;
      Stmt := nil;
   end;

   Stmt := PrepareStatement(SSQLSelectValorCreditoTurma);
   try
      Stmt.SetString(1, TurmaId);
      Stmt.SetInt(2, AnoSemestre);
      Stmt.SetInt(3, nrParcelasPlanoSelecionado);
      Rs := Stmt.ExecuteQueryPrepared;
      try
         if Rs.Next then
         begin
            Result := Rs.GetDoubleByName('VL_DESCONTO');

            { Se o número de parcelas do plano selecionado for diferente do
              número de parcelas do plano da turma da disciplina (cursada fora
              da turma), então aplica uma proporcionalidade para que o valor do
              crédito do plano da disciplina fique equivalente ao mesmo numero
              de parcelas do plano selecionado.
              Fórmula exemplificada abaixo
            }
            if nrParcelasPlanoSelecionado <> Rs.GetDoubleByName('NR_PARCELAS') then
            begin
              { Valor do crédito do plano da disciplina * o número de parcelas desse plano
                dividido pelo número de parcelas do plano selecionado
                Exemplo: O plano selecionado é 4 parcelas o valor do crédito é 150,00
                se uma disciplina só possui planos de 6 parcelas com o crédito de 100,00
                Devemos pegar o valor do crédito da disciplina e multiplicar pelo número
                de parcelas 100,00 * 6 = 600,00 dessa forma temos o valor
                em de créditos em 1x, então dividimos pela mesma quantidade de
                parcelas do plano selecionado
              }
              Result := (Rs.GetDoubleByName('VL_DESCONTO')*Rs.GetIntByName('NR_PARCELAS'))
                / nrParcelasPlanoSelecionado;
            end;
         end;
      finally
         Rs.Close;
      end;
   finally
      Stmt.Close;
      Stmt := nil;
   end;
end;

function TfMatricularPlano.GetValorDescontoExtraTurma(const AnoSemestre: Integer;
  const TurmaId: AnsiString; const nrParcelasPlanoSelecionado: Integer): Double;
const
   SSQLSelectValorCreditoPlanoPadrao = ''
      + 'SELECT '
      + '	pi.VL_DESCONTO_EXTRA / COALESCE(p.NR_CREDITOS_BASE, 1) VL_DESCONTO_EXTRA, '
      + '	p.NR_PARCELAS '
      + 'FROM '
      + '	turmas t '
      + '		JOIN fin_planos p ON '
      + '			(t.CD_PLANO_PADRAO = p.CD_PLANO) '
      + ' INNER JOIN fin_planos_itens pi ON (pi.cd_plano = p.cd_plano) '
      + 'WHERE '
      + '	t.codigo = ? AND '
      + '	t.anosemestre = ? AND '
      + '	( '
      + '		p.sn_vigencia = 0 OR '
      + '		CURRENT_DATE BETWEEN DATE(p.dt_vigencia_inicio) AND DATE(p.dt_vigencia_fim) '
      + '	) '
      + 'ORDER BY '
      + '	ABS(p.NR_PARCELAS - ?) ASC, p.nr_parcelas ASC '
      + 'LIMIT 1 ';

   SSQLSelectValorCreditoTurma = ''
      + 'SELECT '
      + '	pi.VL_DESCONTO_EXTRA / COALESCE(p.NR_CREDITOS_BASE, 1) VL_DESCONTO_EXTRA, '
      + '	p.NR_PARCELAS '
      + 'FROM '
      + '	fin_planos_turmas pt '
      + '		JOIN fin_planos p ON '
      + '			(pt.CD_PLANO = p.CD_PLANO) '
      + ' INNER JOIN fin_planos_itens pi ON (pi.cd_plano = p.cd_plano) '
      + 'WHERE '
      + '	pt.CD_TURMA = ? AND '
      + '	p.NR_ANOSEMESTRE = ? AND '
      + '	( '
      + '		p.sn_vigencia = 0 OR '
      + '		CURRENT_DATE BETWEEN DATE(p.dt_vigencia_inicio) AND DATE(p.dt_vigencia_fim) '
      + '	) '
      + 'ORDER BY '
      + '	ABS(p.NR_PARCELAS - ?) ASC, p.nr_parcelas ASC '
      + 'LIMIT 1 ';
var
   Stmt: IZPreparedStatement;
   Rs: IZResultSet;
begin
   Result := 0;

   if not fMatricular.UsarValorCreditoDisc then Exit;

   if TurmaId = fMatricular.qryMatriculaCD_TURMA.AsString then Exit;

   Stmt := PrepareStatement(SSQLSelectValorCreditoPlanoPadrao);
   try
      Stmt.SetString(1, TurmaId);
      Stmt.SetInt(2, AnoSemestre);
      Stmt.SetInt(3, nrParcelasPlanoSelecionado);
      Rs := Stmt.ExecuteQueryPrepared;
      try
         if Rs.Next then
         begin
            Result := Rs.GetDoubleByName('VL_DESCONTO_EXTRA');

            { Se o número de parcelas do plano selecionado for diferente do
              número de parcelas do plano da turma da disciplina (cursada fora
              da turma), então aplica uma proporcionalidade para que o valor do
              crédito do plano da disciplina fique equivalente ao mesmo numero
              de parcelas do plano selecionado.
              Fórmula exemplificada abaixo
            }
            if nrParcelasPlanoSelecionado <> Rs.GetDoubleByName('NR_PARCELAS') then
            begin
              { Valor do crédito do plano da disciplina * o número de parcelas desse plano
                dividido pelo número de parcelas do plano selecionado
                Exemplo: O plano selecionado é 4 parcelas o valor do crédito é 150,00
                se uma disciplina só possui planos de 6 parcelas com o crédito de 100,00
                Devemos pegar o valor do crédito da disciplina e multiplicar pelo número
                de parcelas 100,00 * 6 = 600,00 dessa forma temos o valor
                em de créditos em 1x, então dividimos pela mesma quantidade de
                parcelas do plano selecionado
              }
              Result := (Rs.GetDoubleByName('VL_DESCONTO_EXTRA')*Rs.GetIntByName('NR_PARCELAS'))
                / nrParcelasPlanoSelecionado;
            end;
         end;
      finally
         Rs.Close;
      end;
   finally
      Stmt.Close;
      Stmt := nil;
   end;

   Stmt := PrepareStatement(SSQLSelectValorCreditoTurma);
   try
      Stmt.SetString(1, TurmaId);
      Stmt.SetInt(2, AnoSemestre);
      Stmt.SetInt(3, nrParcelasPlanoSelecionado);
      Rs := Stmt.ExecuteQueryPrepared;
      try
         if Rs.Next then
         begin
            Result := Rs.GetDoubleByName('VL_DESCONTO_EXTRA');

            { Se o número de parcelas do plano selecionado for diferente do
              número de parcelas do plano da turma da disciplina (cursada fora
              da turma), então aplica uma proporcionalidade para que o valor do
              crédito do plano da disciplina fique equivalente ao mesmo numero
              de parcelas do plano selecionado.
              Fórmula exemplificada abaixo
            }
            if nrParcelasPlanoSelecionado <> Rs.GetDoubleByName('NR_PARCELAS') then
            begin
              { Valor do crédito do plano da disciplina * o número de parcelas desse plano
                dividido pelo número de parcelas do plano selecionado
                Exemplo: O plano selecionado é 4 parcelas o valor do crédito é 150,00
                se uma disciplina só possui planos de 6 parcelas com o crédito de 100,00
                Devemos pegar o valor do crédito da disciplina e multiplicar pelo número
                de parcelas 100,00 * 6 = 600,00 dessa forma temos o valor
                em de créditos em 1x, então dividimos pela mesma quantidade de
                parcelas do plano selecionado
              }
              Result := (Rs.GetDoubleByName('VL_DESCONTO_EXTRA')*Rs.GetIntByName('NR_PARCELAS'))
                / nrParcelasPlanoSelecionado;
            end;
         end;
      finally
         Rs.Close;
      end;
   finally
      Stmt.Close;
      Stmt := nil;
   end;
end;

procedure TfMatricularPlano.AplicaPlanoPgto;

   function CalcValorCredito(
      const Value: Double;
      const nrParcelasPlano: Integer): Double;
   var
      ValorTotal, TotalCreditos: Double;
      ValorCreditos: Currency;
   begin
      Result := Value;

      if not fMatricular.UsarValorCreditoDisc then
      begin
         Exit;
      end;

      TotalCreditos := 0;
      ValorTotal := 0;
      fMatricular.cdsDisciplinas.DisableControls;
      fMatricular.cdsDisciplinas.First;

      while not fMatricular.cdsDisciplinas.Eof do
      begin

         if fMatricular.cdsDisciplinasSN_SELECIONADA.AsBoolean then
         begin

            TotalCreditos :=
               TotalCreditos + fMatricular.cdsDisciplinasNR_CREDITOS.AsFloat;

            if not fMatricular.cdsDisciplinasSN_TURMA_DIFERENTE.AsBoolean then
            begin
               ValorTotal := ValorTotal +
                  (Value * fMatricular.cdsDisciplinasNR_CREDITOS.AsFloat);
            end;

            if fMatricular.cdsDisciplinasSN_TURMA_DIFERENTE.AsBoolean then
            begin

               ValorCreditos := GetValorCreditoTurma(
                  fMatricular.qryMatriculaNR_ANOSEMESTRE.AsInteger,
                  fMatricular.cdsDisciplinasCD_TURMA.AsString,
                  nrParcelasPlano
               );

               if ValorCreditos = 0 then
               begin
                  ValorTotal := ValorTotal +
                     (Value * fMatricular.cdsDisciplinasNR_CREDITOS.AsFloat);
               end;

               if ValorCreditos <> 0 then
               begin
                  ValorTotal :=
                     ValorTotal +
                        (
                           ValorCreditos *
                           fMatricular.cdsDisciplinasNR_CREDITOS.AsFloat
                        )
               end;
                  
            end;

         end;

         fMatricular.cdsDisciplinas.Next;
      end;

      fMatricular.cdsDisciplinas.EnableControls;
      Result := ValorTotal / TotalCreditos;
   end;

   function CalcValorDesconto(
      const Value: Double;
      const nrParcelasPlano: Integer): Double;
   var
      ValorTotal: Double;
      ValorDesconto: Currency;
   begin
      Result := Value;

      if not fMatricular.UsarValorCreditoDisc then
      begin
         Result := qryItensPlanoVL_DESCONTO.AsCurrency /
            qryItensPlanoVL_BRUTO.AsCurrency *
            cdsParcelasVL_BRUTO.AsCurrency;
         Exit;
      end;

      ValorTotal := 0;
      fMatricular.cdsDisciplinas.DisableControls;
      fMatricular.cdsDisciplinas.First;

      while not fMatricular.cdsDisciplinas.Eof do
      begin

         if fMatricular.cdsDisciplinasSN_SELECIONADA.AsBoolean then
         begin

            if not fMatricular.cdsDisciplinasSN_TURMA_DIFERENTE.AsBoolean then
            begin
               ValorTotal := ValorTotal +
                  (Value * fMatricular.cdsDisciplinasNR_CREDITOS.AsFloat);
            end;

            if fMatricular.cdsDisciplinasSN_TURMA_DIFERENTE.AsBoolean then
            begin

               ValorDesconto := GetValorDescontoTurma(
                  fMatricular.qryMatriculaNR_ANOSEMESTRE.AsInteger,
                  fMatricular.cdsDisciplinasCD_TURMA.AsString,
                  nrParcelasPlano
               );

               if ValorDesconto = 0 then
               begin
                  ValorTotal := ValorTotal +
                     (Value * fMatricular.cdsDisciplinasNR_CREDITOS.AsFloat);
               end;

               if ValorDesconto <> 0 then
               begin
                  ValorTotal :=
                     ValorTotal +
                        (
                           ValorDesconto *
                           fMatricular.cdsDisciplinasNR_CREDITOS.AsFloat
                        )
               end;
                  
            end;

         end;

         fMatricular.cdsDisciplinas.Next;
      end;

      fMatricular.cdsDisciplinas.EnableControls;
      Result := ValorTotal;
   end;

   function CalcValorDescontoExtra(
      const Value: Double;
      const nrParcelasPlano: Integer): Double;
   var
      ValorTotal: Double;
      ValorDescontoExtra: Currency;
   begin
      Result := Value;

      if not fMatricular.UsarValorCreditoDisc then
      begin
         Result := qryItensPlanoVL_DESCONTO_EXTRA.AsCurrency /
            qryItensPlanoVL_BRUTO.AsCurrency *
            cdsParcelasVL_BRUTO.AsCurrency;
         Exit;
      end;

      ValorTotal := 0;
      fMatricular.cdsDisciplinas.DisableControls;
      fMatricular.cdsDisciplinas.First;

      while not fMatricular.cdsDisciplinas.Eof do
      begin

         if fMatricular.cdsDisciplinasSN_SELECIONADA.AsBoolean then
         begin

            if not fMatricular.cdsDisciplinasSN_TURMA_DIFERENTE.AsBoolean then
            begin
               ValorTotal := ValorTotal +
                  (Value * fMatricular.cdsDisciplinasNR_CREDITOS.AsFloat);
            end;

            if fMatricular.cdsDisciplinasSN_TURMA_DIFERENTE.AsBoolean then
            begin

               ValorDescontoExtra := GetValorDescontoExtraTurma(
                  fMatricular.qryMatriculaNR_ANOSEMESTRE.AsInteger,
                  fMatricular.cdsDisciplinasCD_TURMA.AsString,
                  nrParcelasPlano
               );

               if ValorDescontoExtra = 0 then
               begin
                  ValorTotal := ValorTotal +
                     (Value * fMatricular.cdsDisciplinasNR_CREDITOS.AsFloat);
               end;

               if ValorDescontoExtra <> 0 then
               begin
                  ValorTotal :=
                     ValorTotal +
                        (
                           ValorDescontoExtra *
                           fMatricular.cdsDisciplinasNR_CREDITOS.AsFloat
                        )
               end;
                  
            end;

         end;

         fMatricular.cdsDisciplinas.Next;
      end;

      fMatricular.cdsDisciplinas.EnableControls;
      Result := ValorTotal;
   end;

var
   NumParcelas, numParcelasCredito, AcaoDescontoPadrao,
   AcaoDescontoCondicionalPadrao, AcaoDesconto, nrIdxParcela,
   Dia, Mes, Ano: Integer;
   TotalCreditos, CreditosRestantes, ValorCredito,
   ValorDesconto, ValorDescontoExra: Double;
   valorDescontoExtraPlano, valorDescontoCondicionalPlano: Currency;
   Vencto: TDateTime;
begin
   cdsParcelas.EmptyDataSet;
   cdsDescontos.EmptyDataSet;
   TotalCreditos := fMatricular.cdsDisciplinasNR_TOTAL_CREDITOS.Value;
   NumParcelas := qryPlanoPgtoNR_PARCELAS.AsInteger;

   //Se usar crédito verifica o numero das parcelsa que usam por crédito, evitando erros que aconteciam ao
   //considerar apenas o campo nr_parcela (menos parcelas que o preenhcido)
   if qryPlanoPgtoSN_CREDITOS.AsInteger = 1 then
   begin
      numParcelasCredito := 0;
      qryItensPlano.First;
      while not qryItensPlano.Eof do
      begin
         if qryItensPlanoSN_CREDITO_PARCELA.AsInteger in [1, 2] then
         begin
            inc(numParcelasCredito);
         end;

         qryItensPlano.Next;
      end;

      if numParcelasCredito > 0 then
      begin
         NumParcelas := numParcelasCredito;
      end;
   end;

   CreditosRestantes := TotalCreditos * NumParcelas;

   // Busca as ações automáticas de desconto fixo e condicional
   AcaoDescontoPadrao := DM.BuscarCodigoAcaoPadrao(11);
   AcaoDescontoCondicionalPadrao := DM.BuscarCodigoAcaoPadrao(24);

   // Desabilita o uso de programação de desconto (será habilitado se tiver alguma programação de desconto ativa)
   bHabilitadaProgramacaoDesconto := False;

   qryItensPlano.First;
   while not qryItensPlano.Eof do
   begin   
      cdsParcelas.Insert;
      cdsParcelasPtrItemPlano.AsInteger := Integer(qryItensPlano.GetBookmark);
      cdsParcelasIDX_PARCELA.AsInteger := GetNrIdxProxParcela;
      cdsParcelasCD_TIPO_TITULO.AsInteger := qryItensPlanoCD_TIPO_PARCELA.AsInteger;
      cdsParcelasDS_TIPO_TITULO.AsString := qryItensPlanoDS_TIPO_TITULO.AsString;
      cdsParcelasNR_PARCELA.AsInteger := qryItensPlanoNR_PARCELA.AsInteger;
      cdsParcelasCD_RESPONSAVEL.AsInteger := GetCodigoRespFinan;
      cdsParcelasNM_RESPONSAVEL.AsString := GetNomeRespFinan;
      cdsParcelasSN_DIVISIVEL.AsBoolean := qryItensPlanoSN_DIVISIVEL.AsInteger = 1;
      cdsParcelasSN_RECIBO_IMP.AsBoolean := False;
      cdsParcelasSN_GERAR.AsBoolean := True;
      cdsParcelasSN_PERDOAR.AsBoolean := False;
      cdsParcelasCD_CONTA.AsInteger := qryItensPlanoCD_CONTA.AsInteger;
      cdsParcelasSN_MANTER_NUMERO_PARCELA.AsBoolean := qryItensPlanoSN_MANTER_NUMERO_PARCELA.AsInteger = 1;
      cdsParcelasSN_BLOQUEADO.AsBoolean := qryItensPlanoSN_BLOQUEADO.AsInteger = 1;

      if qryPlanoPgtoNR_TIPO_VENCTO.AsInteger = 0 then
      begin
      
         if (qryItensPlanoNR_DIA.AsInteger = 0) and
            (qryItensPlanoNR_MES.AsInteger = 0) and
            (qryItensPlanoNR_ANO.AsInteger = 0) then
         begin
            cdsParcelasVENC_ATUAL.AsBoolean := True;
            Vencto := Now;
         end
         else
         begin
            Dia := qryItensPlanoNR_DIA.AsInteger;
            Mes := qryItensPlanoNR_MES.AsInteger;
            Ano := qryItensPlanoNR_ANO.AsInteger;

            while (not TryEncodeDate(Ano, Mes, Dia, Vencto)) and (Dia > 1) do Dec(Dia);
         end;

         cdsParcelasDT_VENCTO.AsDateTime := TDate(Vencto);
         cdsParcelasNR_TIPO_VENCTO.AsInteger := 0;
      end;

      if (qryPlanoPgtoSN_CREDITOS.AsInteger = 1) and
         (qryItensPlanoSN_CREDITO_PARCELA.AsInteger in [1, 2]) then
      begin
         ValorCredito := qryItensPlanoVL_BRUTO.AsCurrency / qryPlanoPgtoNR_CREDITOS_BASE.AsFloat;
         cdsParcelasVL_CREDITO.AsCurrency := ValorCredito;
         ValorCredito := CalcValorCredito(ValorCredito, qryPlanoPgtoNR_PARCELAS.AsInteger);
         if qryItensPlanoNR_CREDITOS_MINIMOS.AsInteger = 0 then
         begin
            cdsParcelasNR_CREDITOS.AsFloat := CreditosRestantes / NumParcelas;
            cdsParcelasVL_BRUTO.AsCurrency :=
               ValorCredito *
               CreditosRestantes /
               NumParcelas;
            CreditosRestantes :=
               CreditosRestantes - CreditosRestantes / NumParcelas;
         end
         else
         begin
            if qryItensPlanoSN_CREDITO_PARCELA.AsInteger = 1 then
            begin
               if TotalCreditos < qryItensPlanoNR_CREDITOS_MINIMOS.AsInteger then
               begin
                  cdsParcelasNR_CREDITOS.AsFloat :=
                     qryItensPlanoNR_CREDITOS_MINIMOS.AsFloat;
                  cdsParcelasVL_BRUTO.AsCurrency :=
                     ValorCredito *
                     qryItensPlanoNR_CREDITOS_MINIMOS.AsFloat;
               end
               else
               begin
                  cdsParcelasNR_CREDITOS.AsFloat := TotalCreditos;
                  cdsParcelasVL_BRUTO.AsCurrency :=
                     ValorCredito *
                     TotalCreditos;
               end;
               CreditosRestantes := CreditosRestantes - TotalCreditos;
            end
            else
            begin
               cdsParcelasNR_CREDITOS.AsFloat :=
                     qryItensPlanoNR_CREDITOS_MINIMOS.AsFloat;
               cdsParcelasVL_BRUTO.AsCurrency :=
                  ValorCredito *
                  qryItensPlanoNR_CREDITOS_MINIMOS.AsFloat;
               CreditosRestantes :=
                  CreditosRestantes - qryItensPlanoNR_CREDITOS_MINIMOS.AsFloat;
            end;
         end;

         ValorDesconto := qryItensPlanoVL_DESCONTO.AsCurrency / qryPlanoPgtoNR_CREDITOS_BASE.AsFloat;
         cdsParcelasVL_DESCONTO.AsCurrency := CalcValorDesconto(ValorDesconto, qryPlanoPgtoNR_PARCELAS.AsInteger);

         ValorDescontoExra := qryItensPlanoVL_DESCONTO_EXTRA.AsCurrency / qryPlanoPgtoNR_CREDITOS_BASE.AsFloat;
         cdsParcelasVL_DESC_EXTRA.AsCurrency := CalcValorDescontoExtra(ValorDescontoExra, qryPlanoPgtoNR_PARCELAS.AsInteger);

         cdsParcelasVL_EXTRA.AsCurrency := qryItensPlanoVL_EXTRA.AsCurrency;

         Dec(NumParcelas);
      end
      else
      begin
         cdsParcelasNR_CREDITOS.AsFloat := 0;
         cdsParcelasVL_BRUTO.AsCurrency := qryItensPlanoVL_BRUTO.AsCurrency;
         cdsParcelasVL_DESCONTO.AsCurrency := qryItensPlanoVL_DESCONTO.AsCurrency;
         cdsParcelasVL_DESC_EXTRA.AsCurrency := qryItensPlanoVL_DESCONTO_EXTRA.AsCurrency;
         cdsParcelasVL_EXTRA.AsCurrency := qryItensPlanoVL_EXTRA.AsCurrency;
         cdsParcelasVL_CREDITO.AsCurrency := 0;
      end;

      // Arredonda os valores da parcela
      cdsParcelasVL_BRUTO.AsCurrency := RoundFloat(cdsParcelasVL_BRUTO.AsCurrency, 2);
      cdsParcelasVL_DESCONTO.AsCurrency := RoundFloat(cdsParcelasVL_DESCONTO.AsCurrency, 2);
      cdsParcelasVL_DESC_EXTRA.AsCurrency := RoundFloat(cdsParcelasVL_DESC_EXTRA.AsCurrency, 2);
      cdsParcelasVL_EXTRA.AsCurrency := RoundFloat(cdsParcelasVL_EXTRA.AsCurrency, 2);

      // Salva os dados da parcela
      cdsParcelas.Post;

      // Grava os dados da parcela criada original (antes da programação de desconto)
      valorDescontoExtraPlano := cdsParcelasVL_DESC_EXTRA.AsCurrency;
      nrIdxParcela := cdsParcelasIDX_PARCELA.AsInteger;

      // Aplica os descontos fixos programados
      AplicaDescontoFixoProgramado;

      // Aplica os descontos condicionais programados
      AplicaDescontoCondicionalProgramado;

      {
         Grava os descontos do plano de pagamento APÓS os descontos programados,
         isso porque o desconto condicional do plano de pagamento sofre influência
         conforme os tipos de descontos programados (soma, sobrepor, proporcional)
      }

      // Grava o desconto FIXO do plano de pagamento (na lista de descontos)
      if valorDescontoExtraPlano > 0 then
      begin
         if (not qryPlanoPgtocd_acao_movimento_desc_fixo.IsNull) AND
            (qryPlanoPgtocd_acao_movimento_desc_fixo.AsInteger > 0) then
         begin
            AcaoDesconto := qryPlanoPgtocd_acao_movimento_desc_fixo.AsInteger;
         end else begin
            AcaoDesconto := AcaoDescontoPadrao;
         end;

         cdsDescontos.Insert;
         cdsDescontosIDX_PARCELA.AsInteger := nrIdxParcela;
         cdsDescontosVL_DESCONTO.AsCurrency := valorDescontoExtraPlano;
         cdsDescontosCD_ACAO_MOVIMENTO.AsInteger := AcaoDesconto;
         cdsDescontosCD_TIPO_DESCONTO.AsInteger := DESCONTO_FIXO;
         cdsDescontosDS_OBSERVACAO.AsString := cdsParcelasDS_TIPO_TITULO.AsString + ' (desconto do plano de pagamento)';
         cdsDescontosSN_DESCONTO_PLANO.AsInteger := 1;
         cdsDescontosCD_TIPO_COMPORTAMENTO.Clear;
         cdsDescontos.Post;
      end;

      // Grava o desconto CONDICIONAL do plano de pagamento (na lista de descontos)
      if cdsParcelasVL_DESCONTO.AsCurrency > 0 then
      begin
         if (not qryPlanoPgtocd_acao_movimento_desc_cond.IsNull) AND
            (qryPlanoPgtocd_acao_movimento_desc_cond.AsInteger > 0) then
         begin
            AcaoDesconto := qryPlanoPgtocd_acao_movimento_desc_cond.AsInteger;
         end else begin
            AcaoDesconto := AcaoDescontoCondicionalPadrao;
         end;

         // Posiciona na última parcela criada para cálcular o desconto condicional do plano
         cdsParcelas.Last;
         valorDescontoCondicionalPlano := GetDescontoCondicionalPlanoPagamento(nrIdxParcela);

         // Verifica se possui valor do desconto condicional do plano de pagamento
         if valorDescontoCondicionalPlano > 0 then
         begin
            cdsDescontos.Insert;
            cdsDescontosIDX_PARCELA.AsInteger := nrIdxParcela;
            cdsDescontosVL_DESCONTO.AsCurrency := valorDescontoCondicionalPlano;
            cdsDescontosCD_ACAO_MOVIMENTO.AsInteger := AcaoDesconto;
            cdsDescontosCD_TIPO_DESCONTO.AsInteger := DESCONTO_CONDICIONAL;
            cdsDescontosDS_OBSERVACAO.AsString := cdsParcelasDS_TIPO_TITULO.AsString + ' (desconto do plano de pagamento)';
            cdsDescontosSN_DESCONTO_PLANO.AsInteger := 1;         
            cdsDescontosCD_TIPO_COMPORTAMENTO.Clear;
            cdsDescontos.Post;
         end;
      end;

      qryItensPlano.Next;
   end;
   sbDividirTitulos.Enabled := qryItensPlano.Locate('SN_DIVISIVEL', 1, []);

end;

procedure TfMatricularPlano.RecalcularDescontoCondicionalPlanoPagamento(idxParcela: Integer);
var
   valorDescontoCondicionalPlano: Currency;
begin

   // Cálcula o valor do desconto condicional do plano
   valorDescontoCondicionalPlano := GetDescontoCondicionalPlanoPagamento(idxParcela);

   {
      Busca qual o desconto condicional do plano de pagamento que foi gerado,
      atualiza o valor desse desconto para o novo valor cálculado
   }

   cdsDescontos.Open;

   cdsDescontos.DisableControls;

   // Filtra apenas os descontos CONDICIONAIS (CD_TIPO_DESCONTO = 1) da parcela e que é do plano de pagamento
   cdsDescontos.Filter := 'IDX_PARCELA = '+IntToStr(idxParcela)+' AND CD_TIPO_DESCONTO = 1 AND SN_DESCONTO_PLANO = 1';
   cdsDescontos.Filtered := true;
   cdsDescontos.First;

   if not cdsDescontos.Eof then
   begin
      cdsDescontos.Edit;
      cdsDescontosVL_DESCONTO.AsCurrency := valorDescontoCondicionalPlano;
      cdsDescontos.Post;
   end;

   cdsDescontos.Close;
   cdsDescontos.Open;

end;

function TfMatricularPlano.GetDescontoCondicionalPlanoPagamento(idxParcela: Integer): Currency;
var
   descontosCondicionaisAplicados: Currency;
begin

   {
      No campo cdsParcelasVL_DESCONTO.AsCurrency teremos o valor total dos descontos condicionais (que será gravado na tabela de mensalidades.valordesconto)
      A geração da ação de movimento (fin_mov_cr) do desconto condicional do plano de pagamento,
      deve ser o valor total dos descontos condicionais menos os valores dos descontos condicionais aplicados ao longo do processo.
      Exemplo:
      O total de descontos condicionais (plano + aplicados separadamente) é no valor de R$ 50,00
      O desconto condicional do plano que ficará para o plano é o que queremos descobrir, sendo que
      foi aplicado 2 descontos condicionais separadamente:
      1) R$ 10,00
      2) R$ 15,00
      Então o desconto condicional do plano de pagamento é 50,00 - 10,00 - 15,00 = R$ 25,00
   }

   cdsDescontos.Open;

   cdsDescontos.DisableControls;

   // Filtra apenas os descontos CONDICIONAIS (CD_TIPO_DESCONTO = 1) da parcela repassada e que não são do plano de pagamento
   cdsDescontos.Filter := 'IDX_PARCELA = '+IntToStr(idxParcela)+' AND CD_TIPO_DESCONTO = 1 AND SN_DESCONTO_PLANO = 0';
   cdsDescontos.Filtered := true;
   cdsDescontos.First;

   descontosCondicionaisAplicados := 0;
   
   while not cdsDescontos.Eof do
   begin
      descontosCondicionaisAplicados := descontosCondicionaisAplicados + RoundFloat(cdsDescontosVL_DESCONTO.AsCurrency, 2);

      cdsDescontos.Next;
   end;

   cdsDescontos.Close;
   cdsDescontos.Open;

   Result := (cdsParcelasVL_DESCONTO.AsCurrency - descontosCondicionaisAplicados);

end;

procedure TfMatricularPlano.CalculaVencimentos;
const
   SSQLSelectInicioTurma = 'SELECT DATAINICIO FROM TURMAS WHERE CODIGO = ? AND ANOSEMESTRE = ?';
var
   Vencto, Temp, Hoje: TDateTime;
   I, J, NumParcela: Integer;
   Dia, Mes, Ano: Word;
   PulaSabado, PulaDomingo, PulaFeriado, DiaValido, UsarFormula: Boolean;
   ParcelasVencidas: string;
   iContadorDiasP0: Integer;
   DataInicioTurma, DataMatricula, PrimeiroVencto, venctoOriginal: TDateTime;
   parcelaDataAtual: Boolean;
   Stmt: IZPreparedStatement;
   Rs: IZResultSet;
   PrimeiroVenctoDefinido: boolean;
   today,vencimento_grid,parcela_0 : String;

   procedure AtualizaParcelaVencida;
   begin
      cdsParcelas.Edit;
      if ParcelasVencidas = '[VENCIMENTO=PLANO]' then
      begin
         if Vencto >= 1 then
            cdsParcelasDT_VENCTO.AsDateTime := Vencto
         else
            cdsParcelasDT_VENCTO.AsDateTime := DM.DataAtual;

         cdsParcelasSN_GERAR.AsBoolean := True;
      end
      else if ParcelasVencidas = '[PERDOAR]' then
      begin
         cdsParcelasDT_VENCTO.AsDateTime := Hoje;
         cdsParcelasSN_RECIBO_IMP.AsBoolean := True;
         cdsParcelasSN_PERDOAR.AsBoolean := True;
         cdsParcelasSN_GERAR.AsBoolean := True;
      end
      else if ParcelasVencidas = '[NAO_GERAR]' then
      begin
         if Vencto >= 1 then
            cdsParcelasDT_VENCTO.AsDateTime := Vencto
         else
            cdsParcelasDT_VENCTO.AsDateTime := Hoje;

         cdsParcelasSN_GERAR.AsBoolean := False;
         cdsParcelasSN_RECIBO_IMP.AsBoolean := True;
      end
      else if ParcelasVencidas = '[NAO_GERAR_MES_ANTERIOR]' then
      begin
         if Vencto >= 1 then
         begin
            cdsParcelasDT_VENCTO.AsDateTime := Vencto
         end
         else
         begin
            cdsParcelasDT_VENCTO.AsDateTime := Hoje;
         end;

         if MonthOf(cdsParcelasDT_VENCTO.AsDateTime) = MonthOf(Hoje) then
         begin
            cdsParcelasSN_GERAR.AsBoolean := True;
            cdsParcelasSN_RECIBO_IMP.AsBoolean := True;
         end
         else
         begin
            cdsParcelasSN_GERAR.AsBoolean := False;
            cdsParcelasSN_RECIBO_IMP.AsBoolean := True;            
         end;
      end
      else if ParcelasVencidas = '[VENCIMENTO=AMANHA]' then
      begin
         Vencto := IncDay(Hoje, 1);
         cdsParcelasDT_VENCTO.AsDateTime := Vencto;
         cdsParcelasSN_GERAR.AsBoolean := True;
      end
      else
      begin
         cdsParcelasDT_VENCTO.AsDateTime := Hoje;
         cdsParcelasSN_GERAR.AsBoolean := True;
      end;
      cdsParcelas.Post;
   end;

   function CalcVencimentoFormula: TDate;
   var
      BaseData, Temp: TDate;
      Day, OriginalMonth, OriginalYear, CalcMonth, CalcYear: Word;
      Days: Integer;
      ValidDay, GoBackMonth: Boolean;
   begin
      case qryItensPlanoNR_FORMULA_VENCTO.AsInteger of
         0:
            BaseData := DataInicioTurma;
         1:
            BaseData := DataMatricula;
         2:
            BaseData := PrimeiroVencto;
      end;

      Days := qryItensPlanoNR_FORMULA_DIAS.AsInteger;

      if qryItensPlanoNR_FORMULA_OPERADOR.AsInteger = 0 then
         Days := Days * -1;

      Result := IncDay(BaseData, Days);

      {
			  SE NA CONFIGURACAO DO PLANO A SOMA DOS DIAS EH DIVISIVEL POR 30 DIAS
			  A INTENÇÃO EH QUE ESSA PARCELA SEJA NO PROXIMO MES OU MES ANTERIOR
        NESSES CASOS O INCREMENTO SERA EM MESES, CASO CONTRARIO CONSIDERA O
        INCREMENTO EM DIAS CALCULADO ANTERIORMENTE
			}
      if (Days mod 30) = 0 then
      begin
        Result := IncMonth(BaseData, Round(Days/30));
      end;

      if qryPlanoPgtoSN_DIAS_UTEIS.AsInteger = 1 then
      begin
         Temp := EncodeDate(YearOf(Result), MonthOf(Result), 1);
         Day := DayOf(Result);

         while Day > 0 do
         begin
            if (not DM.getFeriado(Temp)) and
               (not (DayOfWeek(Temp) in [1, 7])) then
            begin
               Dec(Day);
            end;

            if Day > 0 then
            begin
               Temp := IncDay(Temp);
            end;
         end;

         Result := Temp;
      end;

      if qryPlanoPgtoSN_DIAS_UTEIS.AsInteger = 0 then
      begin
         Day := DayOf(Result);
         OriginalMonth := MonthOf(Result);
         OriginalYear := YearOf(Result);

         Temp := Result;

         if Day > DaysInMonth(Result) then
         begin
            Temp := EndOfTheMonth(Result);
         end;

         ValidDay :=
            (
               (not PulaFeriado) or
               (not DM.getFeriado(Temp))
            )
            and
            (
               (not PulaSabado) or
               (DayOfWeek(Temp) <> 7)
            )
            and
            (
               (not PulaDomingo) or
               (DayOfWeek(Temp) <> 1)
            );

         while not ValidDay do
         begin
            Temp := IncDay(Temp);
            CalcMonth := MonthOf(Temp);
            CalcYear := YearOf(Temp);

            if (CalcMonth <> OriginalMonth) or
               (CalcYear <> OriginalYear) then
               Break;

            ValidDay :=
               (
                  (not PulaFeriado) or
                  (not DM.getFeriado(Temp))
               )
               and
               (
                  (not PulaSabado) or
                  (DayOfWeek(Temp) <> 7)
               )
               and
               (
                  (not PulaDomingo) or
                  (DayOfWeek(Temp) <> 1)
               );
         end;

         CalcMonth := MonthOf(Temp);
         CalcYear := YearOf(Temp);

         GoBackMonth :=
            (CalcMonth > OriginalMonth) or
            (CalcYear > OriginalYear);

         while (CalcMonth > OriginalMonth) or (CalcYear > OriginalYear) do
         begin
            Temp := IncDay(Temp, -1);
            CalcMonth := MonthOf(Temp);
            CalcYear := YearOf(Temp);
         end;

         if GoBackMonth then
         begin
            repeat
               ValidDay := True;

               ValidDay :=
                  (
                     (not PulaFeriado) or
                     (not DM.getFeriado(Temp))
                  )
                  and
                  (
                     (not PulaSabado) or
                     (DayOfWeek(Temp) <> 7)
                  )
                  and
                  (
                     (not PulaDomingo) or
                     (DayOfWeek(Temp) <> 1)
                  );

               if not ValidDay then
                  Temp := IncDay(Temp, -1);

            until (ValidDay);
         end;

         Result := Temp;
      end;
   end;

begin
   Vencto := 0;
   Hoje := DM.DataAtual;
   ParcelasVencidas := DM.variavel_parametro('financeiro_parcelas_anteriores');
   ParcelasVencidas := AnsiUpperCase(ParcelasVencidas);
   PulaSabado := qryPlanoPgtoSN_PULAR_SABADOS.AsInteger = 1;
   PulaDomingo := qryPlanoPgtoSN_PULAR_DOMINGOS.AsInteger = 1;
   PulaFeriado := qryPlanoPgtoSN_PULAR_FERIADOS.AsInteger = 1;
   UsarFormula := qryPlanoPgtoNR_TIPO_VENCTO.AsInteger = 1;

   cdsParcelas.DisableControls;
   cdsParcelas.Filtered := False;
   cdsParcelas.First;

   iContadorDiasP0 := 1;

   if rbVenctoPlano.Checked then
   begin

      Stmt := PrepareStatement(SSQLSelectInicioTurma);
      try
         Stmt.SetString(1, fMatricular.qryMatriculaCD_TURMA.AsString);
         Stmt.SetInt(2, fMatricular.qryMatriculaNR_ANOSEMESTRE.AsInteger);

         Rs := Stmt.ExecuteQueryPrepared;
         try
            if Rs.Next then
               DataInicioTurma := Rs.GetDate(1);
         finally
            Rs.Close;
            Rs := nil;
         end;
      finally
         Stmt.Close;
         Stmt := nil;
      end;

      DataMatricula := DM.CurrDateFromDatabase;

      PrimeiroVenctoDefinido := false; 

      while not cdsParcelas.Eof do
      begin

         if cdsParcelasSN_DIVIDIDO.AsBoolean then
         begin
            cdsParcelas.Next;
            Continue;
         end;

         parcelaDataAtual := False;
         if qryItensPlano.BookmarkValid(Pointer(cdsParcelasPtrItemPlano.AsInteger)) then
         begin
            qryItensPlano.GotoBookmark(Pointer(cdsParcelasPtrItemPlano.AsInteger));

            if UsarFormula then
            begin
               Vencto := TDate(CalcVencimentoFormula);
            end;

            if not UsarFormula then
            begin
               Dia := qryItensPlanoNR_DIA.AsInteger;
               Mes := qryItensPlanoNR_MES.AsInteger;
               Ano := qryItensPlanoNR_ANO.AsInteger;
               while (not TryEncodeDate(Ano, Mes, Dia, Vencto)) and (Dia > 1) do Dec(Dia);

               // Se a parcela tiver dia, mes, ano = 0 deve usar a data atual
               // da matrícula
               if (qryItensPlanoNR_DIA.AsInteger = 0)
                  and (qryItensPlanoNR_MES.AsInteger = 0)
                  and (qryItensPlanoNR_ANO.AsInteger = 0) then
               begin
                  parcelaDataAtual := True;
               end;
            end;

            // Fiz essa variavel de controle pois em alguns clientes pode ser a parcela 1 e em outros a 0
            if not PrimeiroVenctoDefinido then
            begin
               PrimeiroVencto := Vencto;
               PrimeiroVenctoDefinido := true;
            end;

         end
         else
         begin
           Vencto := IncMonth(Vencto, j);
         end;
                
//
         today := FormatDateTime('dd/mm/yyyy', Now);
         vencimento_grid := dbgParcelas.Fields[2].AsString;
         parcela_0 := dbgParcelas.Fields[1].AsString;

         if (parcelaDataAtual) and (qryItensPlanoNR_PARCELA.AsInteger <> 0) then
         begin
            cdsParcelas.Edit;
            cdsParcelasDT_VENCTO.AsDateTime := TDate(Hoje);
            cdsParcelas.Post;
         end
         else if  (  ( TDate(Vencto) > TDate(Hoje) )  OR ((vencimento_grid = today) and (parcela_0 <> '0')) )  then
         begin
            if TDate(Vencto) = 0 then begin
               cdsParcelas.Edit;
               cdsParcelasDT_VENCTO.AsDateTime := TDate(Hoje);
               cdsParcelas.Post;
            end else begin
               cdsParcelas.Edit;
               cdsParcelasDT_VENCTO.AsDateTime := TDate(Vencto);
               cdsParcelasSN_GERAR.AsBoolean := True;
               cdsParcelas.Post;
            end
         end
         else
         if cdsParcelasNR_PARCELA.AsInteger = 0 then
         begin
            cdsParcelas.Edit;
            cdsParcelasDT_VENCTO.AsDateTime := TDate(Hoje);
            while iContadorDiasP0 <= qryPlanoPgtoNR_DIAS_PARCELA_ZERO.AsInteger do
            begin
               cdsParcelasDT_VENCTO.AsDateTime := IncDay(cdsParcelasDT_VENCTO.AsDateTime);
               Inc(iContadorDiasP0);
            end;

            // Garantir que a data da parcela  0 não irá zerada
            if (cdsParcelasDT_VENCTO.AsDateTime < TDate(Hoje)) then
            begin
               cdsParcelasDT_VENCTO.AsDateTime := TDate(Hoje);
            end; 

            iContadorDiasP0 := 1;
            cdsParcelasSN_GERAR.AsBoolean := True;
            cdsParcelas.Post;
         end
         else
         begin
            AtualizaParcelaVencida;
         end;
         cdsParcelas.Next;
      end;
   end
   else if rbVenctoDiaUtil.Checked then
   begin
      Temp := dtpVenctoDiaUtil.Date;
      Temp := EncodeDate(YearOf(Temp), MonthOf(Temp), 1);

      while not cdsParcelas.Eof do
      begin

         if cdsParcelasSN_BLOQUEADO.AsBoolean then
         begin
            cdsParcelas.Next;
            continue;
         end;

         {
         if cdsParcelasSN_DIVIDIDO.AsBoolean then
         begin
            cdsParcelas.Next;
            Continue;
         end;
         }

         I := cbDiaUtil.ItemIndex + 1;
         Vencto := Temp;

         while I > 0 do
         begin
            DiaValido := not (
               (DayOfWeek(Vencto) = 7) or
               (DayOfWeek(Vencto) = 1) or
               (DM.FindDate(Vencto, qryPlanoPgtoCD_COLIGADA.AsInteger))
            );

            if DiaValido then
            begin
               Dec(I);
            end;

            if I > 0 then
            begin
               Vencto := IncDay(Vencto);
            end;
         end;

         parcelaDataAtual := false;

         if qryItensPlano.BookmarkValid(Pointer(cdsParcelasPtrItemPlano.AsInteger)) then
         begin
            qryItensPlano.GotoBookmark(Pointer(cdsParcelasPtrItemPlano.AsInteger));
            
            // Se a parcela tiver dia, mes, ano = 0 deve usar a data atual
            // da matrícula
            if (qryItensPlanoNR_DIA.AsInteger = 0)
               and (qryItensPlanoNR_MES.AsInteger = 0)
               and (qryItensPlanoNR_ANO.AsInteger = 0) then
            begin
               parcelaDataAtual := True;   
            end;
         end;

         if parcelaDataAtual then
         begin
            cdsParcelas.Edit;
            cdsParcelasDT_VENCTO.AsDateTime := TDate(Hoje);

            if cdsParcelasNR_PARCELA.AsInteger = 0 then
            begin
              while iContadorDiasP0 <= qryPlanoPgtoNR_DIAS_PARCELA_ZERO.AsInteger do
              begin
                 cdsParcelasDT_VENCTO.AsDateTime:= IncDay(cdsParcelasDT_VENCTO.AsDateTime);
                 Inc(iContadorDiasP0);
              end;
              iContadorDiasP0 := 1;
            end;

            cdsParcelas.Post;
            cdsParcelas.Next;

            continue;
         end
         else
         begin
            if cdsParcelasNR_PARCELA.AsInteger = 0 then
            begin
              cdsParcelas.Edit;
              cdsParcelasDT_VENCTO.AsDateTime := TDate(Hoje);

              while iContadorDiasP0 <= qryPlanoPgtoNR_DIAS_PARCELA_ZERO.AsInteger do
              begin
                 cdsParcelasDT_VENCTO.AsDateTime:= IncDay(cdsParcelasDT_VENCTO.AsDateTime);
                 Inc(iContadorDiasP0);
              end;

              cdsParcelasSN_GERAR.AsBoolean := True;
              iContadorDiasP0 := 1;

              cdsParcelas.Post;

              NumParcela := cdsParcelasNR_PARCELA.AsInteger;
              cdsParcelas.Next;

              continue;
           end
           else
           if TDate(Vencto) >= TDate(Hoje) then
           begin
              cdsParcelas.Edit;
              cdsParcelasDT_VENCTO.AsDateTime := TDate(Vencto);
              cdsParcelasSN_GERAR.AsBoolean := True;
              cdsParcelas.Post;
           end
           else
           begin
              AtualizaParcelaVencida;
           end;
         end;

         NumParcela := cdsParcelasNR_PARCELA.AsInteger;
         cdsParcelas.Next;
         
         if cdsParcelasNR_PARCELA.AsInteger <> NumParcela then
         begin
            Temp := IncMonth(Temp);
         end;
      end;
   end
   else if rbVenctoSempre.Checked then
   begin
      Temp := dtpVenctoSempre.Date;
      venctoOriginal := Temp;
      j:=0;

      if TryStrToInt(cbDiaVencto.Text, I) and (I > 0) and (I < 32) then
      begin

         Ano := YearOf(Temp);
         Mes := MonthOf(Temp);
         Dia := Min(I, DaysInAMonth(Ano, Mes));
         Vencto := EncodeDate(Ano, Mes, Dia);
         vencimento_definido := vencto;
         Temp := Vencto;
         venctoOriginal := temp;

         while not cdsParcelas.Eof do
         begin

            if cdsParcelasSN_BLOQUEADO.AsBoolean then
            begin
              cdsParcelas.Next;
              continue;
            end;

            DiaValido := not (
               (PulaSabado and (DayOfWeek(Vencto) = 7)) or
               (PulaDomingo and (DayOfWeek(Vencto) = 1)) or
               (PulaFeriado and DM.FindDate(Vencto, qryPlanoPgtoCD_COLIGADA.AsInteger))
            );

            while not DiaValido do
            begin
            
               if Dia > 29 then
                  Vencto := IncDay(Vencto, -1)
               else
                  Vencto := IncDay(Vencto);
                  
               DiaValido := not (
                  (PulaSabado and (DayOfWeek(Vencto) = 7)) or
                  (PulaDomingo and (DayOfWeek(Vencto) = 1)) or
                  (PulaFeriado and DM.FindDate(Vencto, qryPlanoPgtoCD_COLIGADA.AsInteger))
               );
            end;

            parcelaDataAtual := false;

            if qryItensPlano.BookmarkValid(Pointer(cdsParcelasPtrItemPlano.AsInteger)) then
            begin
               qryItensPlano.GotoBookmark(Pointer(cdsParcelasPtrItemPlano.AsInteger));

               // Se a parcela tiver dia, mes, ano = 0 deve usar a data atual
               // da matrícula
               if (qryItensPlanoNR_DIA.AsInteger = 0)
                  and (qryItensPlanoNR_MES.AsInteger = 0)
                  and (qryItensPlanoNR_ANO.AsInteger = 0) then
               begin
                  parcelaDataAtual := True;
               end;
            end;

            if parcelaDataAtual then
            begin
               cdsParcelas.Edit;
               cdsParcelasDT_VENCTO.AsDateTime := TDate(Hoje);
               if cdsParcelasNR_PARCELA.AsInteger = 0 then
               begin

                 while iContadorDiasP0 <= qryPlanoPgtoNR_DIAS_PARCELA_ZERO.AsInteger do
                 begin
                    cdsParcelasDT_VENCTO.AsDateTime:= IncDay(cdsParcelasDT_VENCTO.AsDateTime);
                    Inc(iContadorDiasP0);
                 end;
                 iContadorDiasP0 := 1;

               end;
               
               cdsParcelas.Post;
               cdsParcelas.Next;

               continue;
            end
            else
            begin
              if cdsParcelasNR_PARCELA.AsInteger = 0 then
              begin
                 cdsParcelas.Edit;
                 cdsParcelasDT_VENCTO.AsDateTime := TDate(Hoje);

                 while iContadorDiasP0 <= qryPlanoPgtoNR_DIAS_PARCELA_ZERO.AsInteger do
                 begin
                    cdsParcelasDT_VENCTO.AsDateTime:= IncDay(cdsParcelasDT_VENCTO.AsDateTime);
                    Inc(iContadorDiasP0);
                 end;
                 iContadorDiasP0 := 1;

                 cdsParcelasSN_GERAR.AsBoolean := True;
                 cdsParcelas.Post;
                 NumParcela := cdsParcelasNR_PARCELA.AsInteger;
                 cdsParcelas.Next;

                 continue;
              end
              else
              if TDate(Vencto) >= TDate(Hoje) then
              begin
                 cdsParcelas.Edit;
                 cdsParcelasDT_VENCTO.AsDateTime := TDate(Vencto);
                 cdsParcelasSN_GERAR.AsBoolean := True;
                 cdsParcelas.Post;
              end
              else
              begin
                 AtualizaParcelaVencida;
              end;
            end;

            NumParcela := cdsParcelasNR_PARCELA.AsInteger;
            cdsParcelas.Next;

            if cdsParcelasNR_PARCELA.AsInteger <> NumParcela then
            begin
               Inc(J);
               Temp:= venctoOriginal;
               Temp := IncMonth(Temp, j);
            end;

            Vencto := Temp;
         end;
      end;
   end
   else if rbVenctoEstudante.Checked then
   begin
      if TryStrToInt(qryDtVencPessoa.FieldByName('NR_DIA_VENCIMENTO').AsString, I) and (I > 0) and (I < 32) then
      begin
         Stmt := PrepareStatement(SSQLSelectInicioTurma);
         try
            Stmt.SetString(1, fMatricular.qryMatriculaCD_TURMA.AsString);
            Stmt.SetInt(2, fMatricular.qryMatriculaNR_ANOSEMESTRE.AsInteger);

            Rs := Stmt.ExecuteQueryPrepared;
            try
               if Rs.Next then
                  DataInicioTurma := Rs.GetDate(1);
            finally
               Rs.Close;
               Rs := nil;
            end;
         finally
            Stmt.Close;
            Stmt := nil;
         end;

         DataMatricula := DM.CurrDateFromDatabase;

         while not cdsParcelas.Eof do
         begin

            qryItensPlano.GotoBookmark(Pointer(cdsParcelasPtrItemPlano.AsInteger));
            Ano := qryItensPlanoNR_ANO.AsInteger;
            Mes := qryItensPlanoNR_MES.AsInteger;
            Dia := Min(I, DaysInAMonth(Ano, Mes));

            //Titulo dividido, ou seja, não existe os dados no plano
            if(cdsParcelasPtrItemPlano.AsInteger = 0) AND (cdsParcelasSN_DIVIDIDO.AsBoolean) then
            begin
               Dia := DayOf(cdsParcelasDT_VENCTO.AsDateTime);
               Mes := MonthOf(cdsParcelasDT_VENCTO.AsDateTime);
               Ano := YearOf(cdsParcelasDT_VENCTO.AsDateTime);
            end;


            while (not TryEncodeDate(Ano, Mes, Dia, Vencto)) and (Dia > 1) do Dec(Dia);

            DiaValido := not (
               (PulaSabado and (DayOfWeek(Vencto) = 7)) or
               (PulaDomingo and (DayOfWeek(Vencto) = 1)) or
               (PulaFeriado and DM.FindDate(Vencto, qryPlanoPgtoCD_COLIGADA.AsInteger))
            );

            while not DiaValido do
            begin
               Vencto := IncDay(Vencto);
               DiaValido := not (
                  (PulaSabado and (DayOfWeek(Vencto) = 7)) or
                  (PulaDomingo and (DayOfWeek(Vencto) = 1)) or
                  (PulaFeriado and DM.FindDate(Vencto, qryPlanoPgtoCD_COLIGADA.AsInteger))
               );
            end;

            parcelaDataAtual := False;

            if qryItensPlano.BookmarkValid(Pointer(cdsParcelasPtrItemPlano.AsInteger)) then
            begin
               qryItensPlano.GotoBookmark(Pointer(cdsParcelasPtrItemPlano.AsInteger));

               if UsarFormula then
               begin
                  Vencto := TDate(CalcVencimentoFormula);

                  Dia := qryDtVencPessoa.FieldByName('NR_DIA_VENCIMENTO').AsInteger;
                  Mes := MonthOf(Vencto);
                  Ano := YearOf(Vencto);

                  while (not TryEncodeDate(Ano, Mes, Dia, Vencto)) and (Dia > 1) do Dec(Dia);
               end;

               if not UsarFormula then
               begin
                  // Se a parcela tiver dia, mes, ano = 0 deve usar a data atual
                  // da matrícula
                  if (qryItensPlanoNR_DIA.AsInteger = 0)
                     and (qryItensPlanoNR_MES.AsInteger = 0)
                     and (qryItensPlanoNR_ANO.AsInteger = 0) then
                  begin
                     parcelaDataAtual := True;
                  end;
               end;

               // Fiz essa variavel de controle pois em alguns clientes pode ser a parcela 1 e em outros a 0
               if not PrimeiroVenctoDefinido then
               begin
                  PrimeiroVencto := Vencto;
                  PrimeiroVenctoDefinido := true;
               end;

            end;

            if parcelaDataAtual then
            begin
               cdsParcelas.Edit;
               cdsParcelasDT_VENCTO.AsDateTime := TDate(Hoje);
               cdsParcelas.Post;

               cdsParcelas.Next;

               continue;
            end
            else
            begin
              if TDate(Vencto) >= TDate(Hoje) then
              begin
                 cdsParcelas.Edit;
                 cdsParcelasDT_VENCTO.AsDateTime := TDate(Vencto);
                 cdsParcelasSN_GERAR.AsBoolean := True;
                 cdsParcelas.Post;
              end
              else
              if cdsParcelasNR_PARCELA.AsInteger = 0 then
              begin
                 cdsParcelas.Edit;
                 cdsParcelasDT_VENCTO.AsDateTime := TDate(Hoje);

                 while iContadorDiasP0 <= qryPlanoPgtoNR_DIAS_PARCELA_ZERO.AsInteger do
                 begin
                    cdsParcelasDT_VENCTO.AsDateTime:= IncDay(cdsParcelasDT_VENCTO.AsDateTime);
                    Inc(iContadorDiasP0);
                 end;
                 iContadorDiasP0 := 1;
               
                 cdsParcelasSN_GERAR.AsBoolean := True;
                 cdsParcelas.Post;
              end
              else
              begin
                 AtualizaParcelaVencida;
              end;
            end;

            cdsParcelas.Next;            
         end;

      end;
      
   end;
   cdsParcelas.EnableControls;
end;

procedure TfMatricularPlano.CarregaParcelasDivisao;
var
   strVenc: String;
   dtVenc: TDateTime;
begin
   with fMatricularDivisaoParcelas do
   begin
      cdsParcelasDivididas.DisableControls;
      cdsParcelasDivididas.EmptyDataSet;

      cdsDescontosDivididos.DisableControls;
      cdsDescontosDivididos.EmptyDataSet;

      cdsParcelasDivisao.DisableControls;
      cdsParcelasDivisao.EmptyDataSet;

      cdsDescontosDivisao.DisableControls;
      cdsDescontosDivisao.EmptyDataSet;

      cdsParcelas.DisableControls;
      cdsParcelas.Filter := 'SN_GERAR AND NOT SN_PERDOAR';
      cdsParcelas.Filtered := True;
      cdsParcelas.First;

      while not cdsParcelas.Eof do
      begin
         if cdsParcelasSN_DIVISIVEL.AsBoolean then
         begin
            if not cdsParcelasDivisao.Locate('CD_TIPO_TITULO',
               cdsParcelasCD_TIPO_TITULO.AsInteger, []) then
            begin
               cdsParcelasDivisao.Insert;
               cdsParcelasDivisaoCD_TIPO_TITULO.AsInteger :=
                  cdsParcelasCD_TIPO_TITULO.AsInteger;
               cdsParcelasDivisaoDS_TIPO_TITULO.AsString :=
                  cdsParcelasDS_TIPO_TITULO.AsString;
               cdsParcelasDivisaoVL_BRUTO_TOTAL.AsCurrency :=
                  cdsParcelasVL_BRUTO.AsCurrency;
               cdsParcelasDivisaoVL_DESCONTO_TOTAL.AsCurrency :=
                  cdsParcelasVL_DESCONTO.AsCurrency;
               cdsParcelasDivisaoVL_BOLSA_TOTAL.AsCurrency :=
                  cdsParcelasVL_DESC_EXTRA.AsCurrency;
               cdsParcelasDivisaoVL_EXTRA_TOTAL.AsCurrency :=
                  cdsParcelasVL_EXTRA.AsCurrency;
               cdsParcelasDivisaoNR_PARCELAS.AsInteger := 1;
               cdsParcelasDivisaoCD_CONTA.AsInteger :=
                  cdsParcelasCD_CONTA.AsInteger;
               cdsParcelasDivisaoNR_PARCELA_INICIO.AsInteger :=
                  cdsParcelasNR_PARCELA.AsInteger;
               cdsParcelasDivisaoVL_CREDITO.AsCurrency :=
                  cdsParcelasVL_CREDITO.AsCurrency;
               cdsParcelasDivisaoSN_MANTER_NUMERO_PARCELA.AsBoolean :=
                  cdsParcelasSN_MANTER_NUMERO_PARCELA.AsBoolean;
               if vencimento_definido <> 0 then
                  cdsParcelasDivisaoDT_VENCTO.AsDateTime := vencimento_definido
               else
                  cdsParcelasDivisaoDT_VENCTO.AsDateTime := cdsParcelasDT_VENCTO.AsDateTime;
            end
            else
            begin
               cdsParcelasDivisao.Edit;
               cdsParcelasDivisaoVL_BRUTO_TOTAL.AsCurrency :=
                  cdsParcelasDivisaoVL_BRUTO_TOTAL.AsCurrency +
                  cdsParcelasVL_BRUTO.AsCurrency;
               cdsParcelasDivisaoVL_DESCONTO_TOTAL.AsCurrency :=
                  cdsParcelasDivisaoVL_DESCONTO_TOTAL.AsCurrency +
                  cdsParcelasVL_DESCONTO.AsCurrency;
               cdsParcelasDivisaoVL_BOLSA_TOTAL.AsCurrency :=
                  cdsParcelasDivisaoVL_BOLSA_TOTAL.AsCurrency +
                  cdsParcelasVL_DESC_EXTRA.AsCurrency;
               cdsParcelasDivisaoVL_EXTRA_TOTAL.AsCurrency :=
                  cdsParcelasDivisaoVL_EXTRA_TOTAL.AsCurrency +
                  cdsParcelasVL_EXTRA.AsCurrency;
               cdsParcelasDivisaoNR_PARCELAS.AsInteger :=
                  cdsParcelasDivisaoNR_PARCELAS.AsInteger + 1;
               cdsParcelasDivisaoVL_CREDITO.AsCurrency :=
                  cdsParcelasDivisaoVL_CREDITO.AsCurrency + cdsParcelasVL_CREDITO.AsCurrency;
               if vencimento_definido <> 0 then
                  cdsParcelasDivisaoDT_VENCTO.AsDateTime := vencimento_definido
               else
                  cdsParcelasDivisaoDT_VENCTO.AsDateTime := cdsParcelasDT_VENCTO.AsDateTime;
            end;
            cdsParcelasDivisao.Post;
         end;

         // Repassa os descontos aplicados em cada parcela divisivel e
         // passa para a tela que efetuará a divisão para serem divididos também
         cdsDescontos.Open;
         cdsDescontos.Filter := 'IDX_PARCELA = '+cdsParcelasIDX_PARCELA.AsString;
         cdsDescontos.Filtered := true;
         cdsDescontos.First;
         while not cdsDescontos.Eof do
         begin
            if not cdsDescontosDivisao.Locate('CD_TIPO_TITULO;CD_ACAO_MOVIMENTO;CD_TIPO_DESCONTO;DS_OBSERVACAO',
               VarArrayOf([cdsParcelasCD_TIPO_TITULO.AsInteger, cdsDescontosCD_ACAO_MOVIMENTO.AsInteger,cdsDescontosCD_TIPO_DESCONTO.AsInteger,cdsDescontosDS_OBSERVACAO.AsString]), []) then
            begin
               cdsDescontosDivisao.Insert;
               cdsDescontosDivisaoVL_DESCONTO.AsCurrency := cdsDescontosVL_DESCONTO.AsCurrency;
               cdsDescontosDivisaoCD_ACAO_MOVIMENTO.AsInteger := cdsDescontosCD_ACAO_MOVIMENTO.AsInteger;
               cdsDescontosDivisaoCD_TIPO_DESCONTO.AsInteger := cdsDescontosCD_TIPO_DESCONTO.AsInteger;
               cdsDescontosDivisaoCD_TIPO_COMPORTAMENTO.AsInteger := cdsDescontosCD_TIPO_COMPORTAMENTO.AsInteger;
               cdsDescontosDivisaoDS_OBSERVACAO.AsString := cdsDescontosDS_OBSERVACAO.AsString;
               cdsDescontosDivisaoSN_DESCONTO_PLANO.AsInteger := cdsDescontosSN_DESCONTO_PLANO.AsInteger;
               cdsDescontosDivisaoCD_TIPO_TITULO.AsInteger := cdsParcelasCD_TIPO_TITULO.AsInteger;
               cdsDescontosDivisao.Post;
            end else begin
               cdsDescontosDivisao.Edit;
               cdsDescontosDivisaoVL_DESCONTO.AsCurrency := cdsDescontosDivisaoVL_DESCONTO.AsCurrency + cdsDescontosVL_DESCONTO.AsCurrency;
               cdsDescontosDivisao.Post;
            end;

            cdsDescontos.Next;
         end;

         cdsParcelas.Next;
      end;
      cdsParcelas.Filtered := False;
      cdsParcelas.EnableControls;
      cdsParcelasDivisao.EnableControls;
      cdsParcelasDivididas.EnableControls;
   end;
end;

procedure TfMatricularPlano.CarregaTitulosDesconto;
begin
    with fMatricularPlanoDesconto do
   begin
      cdsParcelasPlanoDesconto.DisableControls;
      cdsParcelasPlanoDesconto.EmptyDataSet;

      if cdsDescontosPlanoDesconto.State = dsInactive then
      begin
         cdsDescontosPlanoDesconto.Open;
      end;
      
      cdsDescontosPlanoDesconto.DisableControls;
      cdsDescontosPlanoDesconto.EmptyDataSet;

      cdsDescontosAplicados.EmptyDataSet;

      cdsParcelas.DisableControls;
      cdsParcelas.Filter := 'SN_GERAR';
      cdsParcelas.Filtered := True;
      cdsParcelas.First;

      while not cdsParcelas.Eof do
      begin
         cdsParcelasPlanoDesconto.Insert;
         cdsParcelasPlanoDescontoPtrItemPlano.AsInteger :=
            cdsParcelasPtrItemPlano.AsInteger;
         cdsParcelasPlanoDescontoIDX_PARCELA.AsInteger :=
            cdsParcelasIDX_PARCELA.AsInteger;
         cdsParcelasPlanoDescontoCD_TIPO_TITULO.AsInteger :=
            cdsParcelasCD_TIPO_TITULO.AsInteger;
         cdsParcelasPlanoDescontoDS_TIPO_TITULO.AsString :=
            cdsParcelasDS_TIPO_TITULO.AsString;
         cdsParcelasPlanoDescontoNR_PARCELA.AsInteger :=
            cdsParcelasNR_PARCELA.AsInteger;
         cdsParcelasPlanoDescontoDT_VENCTO.AsDateTime :=
            cdsParcelasDT_VENCTO.AsDateTime;
         cdsParcelasPlanoDescontoVL_BRUTO.AsCurrency :=
            cdsParcelasVL_BRUTO.AsCurrency;
         cdsParcelasPlanoDescontoVL_DESCONTO.AsCurrency :=
            cdsParcelasVL_DESCONTO.AsCurrency;
         cdsParcelasPlanoDescontoVL_DESC_EXTRA.AsCurrency :=
            cdsParcelasVL_DESC_EXTRA.AsCurrency;
         cdsParcelasPlanoDescontoVL_EXTRA.AsCurrency :=
            cdsParcelasVL_EXTRA.AsCurrency;
         cdsParcelasPlanoDescontoVL_DESC_EXTRA.AsCurrency :=
            cdsParcelasVL_DESC_EXTRA.AsCurrency;
         cdsParcelasPlanoDescontoVL_CREDITO.AsCurrency :=
            cdsParcelasVL_CREDITO.AsCurrency;
         cdsParcelasPlanoDescontoCD_RESPONSAVEL.AsInteger :=
            cdsParcelasCD_RESPONSAVEL.AsInteger;
         cdsParcelasPlanoDescontoNM_RESPONSAVEL.AsString :=
            cdsParcelasNM_RESPONSAVEL.AsString;
         cdsParcelasPlanoDescontoSN_DIVISIVEL.AsBoolean :=
            cdsParcelasSN_DIVISIVEL.AsBoolean;
         cdsParcelasPlanoDescontoSN_SELECIONADA.AsBoolean := True;
         cdsParcelasPlanoDescontoSN_SIMULADO.AsBoolean := False;
         cdsParcelasPlanoDescontoCD_CONTA.AsInteger :=
            cdsParcelasCD_CONTA.AsInteger;
         cdsParcelasPlanoDescontoNR_CREDITOS.AsFloat :=
            cdsParcelasNR_CREDITOS.AsFloat;
         cdsParcelas.Next;
      end;

      if cdsParcelasPlanoDesconto.State = dsInsert then
      begin
         cdsParcelasPlanoDesconto.Post;
      end;
      cdsParcelas.Filtered := False;
      cdsParcelas.EnableControls;
      cdsParcelasPlanoDesconto.EnableControls;
      salvaDescontosAtuais;
      salvaMovimentacaoAtual;
   end;
end;

procedure TfMatricularPlano.CarregaTitulosDivididos;
begin
   with fMatricularDivisaoTitulos do
   begin
      cdsParcelas.DisableControls;
      cdsParcelas.Filter := 'SN_GERAR AND NOT SN_PERDOAR';
      cdsParcelas.Filtered := True;
      cdsParcelas.First;
      while not cdsParcelas.IsEmpty do cdsParcelas.Delete;
      cdsParcelas.Filtered := False;

      cdsParcelasDivididas.DisableControls;
      cdsParcelasDivididas.First;

      while not cdsParcelasDivididas.Eof do
      begin
         cdsParcelas.Insert;  
         cdsParcelasIDX_PARCELA.AsInteger :=
            cdsParcelasDivididasIDX_PARCELA.AsInteger;
         cdsParcelasCD_TIPO_TITULO.AsInteger :=
            cdsParcelasDivididasCD_TIPO_TITULO.AsInteger;
         cdsParcelasDS_TIPO_TITULO.AsString :=
            cdsParcelasDivididasDS_TIPO_TITULO.AsString;
         cdsParcelasNR_PARCELA.AsInteger :=
            cdsParcelasDivididasNR_PARCELA.AsInteger;
         cdsParcelasDT_VENCTO.AsDateTime :=
            cdsParcelasDivididasDT_VENCTO.AsDateTime;
         cdsParcelasVL_BRUTO.AsCurrency :=
            cdsParcelasDivididasVL_BRUTO.AsCurrency;
         cdsParcelasVL_DESCONTO.AsCurrency :=
            cdsParcelasDivididasVL_DESCONTO.AsCurrency;
         cdsParcelasVL_EXTRA.AsCurrency :=
            cdsParcelasDivididasVL_EXTRA.AsCurrency;
         cdsParcelasCD_RESPONSAVEL.AsInteger :=
            cdsParcelasDivididasCD_RESPONSAVEL.AsInteger;
         cdsParcelasNM_RESPONSAVEL.AsString :=
            cdsParcelasDivididasNM_RESPONSAVEL.AsString;
         cdsParcelasVL_DESC_EXTRA.AsCurrency :=
            cdsParcelasDivididasVL_BOLSA.AsCurrency;
         cdsParcelasCD_CONTA.AsInteger :=
            cdsParcelasDivididasCD_CONTA.AsInteger;
         cdsParcelasPtrItemPlano.AsInteger :=
            cdsParcelasDivididasPtrItemPlano.AsInteger;
         cdsParcelasVL_CREDITO.AsCurrency :=
            cdsParcelasDivididasVL_CREDITO.AsCurrency;
         cdsParcelasVL_PERCENTUAL_DIVISAO.AsCurrency :=
            cdsParcelasDivididasVL_PERCENTUAL_DIVISAO.AsCurrency;

         if qryItensPlano.BookmarkValid(
               Pointer(cdsParcelasPtrItemPlano.AsInteger)
            ) then
         begin
            qryItensPlano.GotoBookmark(
               Pointer(cdsParcelasPtrItemPlano.AsInteger)
            );
            cdsParcelasSN_DIVISIVEL.AsBoolean :=
               qryItensPlanoSN_DIVISIVEL.AsInteger = 1;
            cdsParcelasSN_BLOQUEADO.AsBoolean :=
               qryItensPlanoSN_BLOQUEADO.AsInteger = 1;

            if (qryPlanoPgtoSN_CREDITOS.AsInteger = 1) and
               (qryItensPlanoSN_CREDITO_PARCELA.AsInteger in [1, 2]) then
            begin
               cdsParcelasNR_CREDITOS.AsFloat :=
                  fMatricular.cdsDisciplinasNR_TOTAL_CREDITOS.Value;
               if cdsParcelasNR_CREDITOS.AsFloat <
                  qryItensPlanoNR_CREDITOS_MINIMOS.AsFloat then
                  cdsParcelasNR_CREDITOS.AsFloat :=
                     qryItensPlanoNR_CREDITOS_MINIMOS.AsFloat;
            end;
         end
         else
         begin
            cdsParcelasSN_DIVISIVEL.AsBoolean := False;
         end;

         cdsParcelasSN_RECIBO_IMP.AsBoolean := False;
         cdsParcelasSN_GERAR.AsBoolean := True;
         cdsParcelasSN_PERDOAR.AsBoolean := False;
         cdsParcelasDivididas.Next;
      end;

      if cdsParcelas.State = dsInsert then
      begin
         cdsParcelas.Post;
      end;

      cdsParcelas.EnableControls;
      cdsParcelasDivididas.EnableControls;

      // Carrega os descontos atualizados (divididos)
      Self.cdsDescontos.Data := cdsDescontosDivididos.Data;

      // Indica que foi utilizada a opção de dividir títulos
      bUsouDividirTitulos := True;

      // Habilita/Desabilita as opções conforme regras da tela
      habilitaOpcoesParcela();
   end;
end;

procedure TfMatricularPlano.CarregaTitulosDivisao;
begin
   with fMatricularDivisaoTitulos do
   begin
      cdsParcelasOrigem.DisableControls;
      cdsParcelasOrigem.EmptyDataSet;
      
      cdsParcelas.DisableControls;
      cdsParcelas.Filter := 'SN_GERAR AND NOT SN_PERDOAR';
      cdsParcelas.Filtered := True;
      cdsParcelas.First;

      while not cdsParcelas.Eof do
      begin
         cdsParcelasOrigem.Insert;
         cdsParcelasOrigemIDX_PARCELA.AsInteger :=
            cdsParcelasIDX_PARCELA.AsInteger;
         cdsParcelasOrigemCD_TIPO_TITULO.AsInteger :=
            cdsParcelasCD_TIPO_TITULO.AsInteger;
         cdsParcelasOrigemDS_TIPO_TITULO.AsString :=
            cdsParcelasDS_TIPO_TITULO.AsString;
         cdsParcelasOrigemNR_PARCELA.AsInteger :=
            cdsParcelasNR_PARCELA.AsInteger;
         cdsParcelasOrigemDT_VENCTO.AsDateTime :=
            cdsParcelasDT_VENCTO.AsDateTime;
         cdsParcelasOrigemVL_BRUTO.AsCurrency := cdsParcelasVL_BRUTO.AsCurrency;
         cdsParcelasOrigemvl_credito.AsCurrency := cdsParcelasVL_CREDITO.AsCurrency;
         cdsParcelasOrigemVL_DESCONTO.AsCurrency :=
            cdsParcelasVL_DESCONTO.AsCurrency;
         cdsParcelasOrigemVL_BOLSA.AsCurrency :=
            cdsParcelasVL_DESC_EXTRA.AsCurrency;
         cdsParcelasOrigemVL_EXTRA.AsCurrency := cdsParcelasVL_EXTRA.AsCurrency;
         cdsParcelasOrigemCD_RESPONSAVEL.AsInteger :=
            cdsParcelasCD_RESPONSAVEL.AsInteger;
         cdsParcelasOrigemNM_RESPONSAVEL.AsString :=
            cdsParcelasNM_RESPONSAVEL.AsString;
         cdsParcelasOrigemPtrItemPlano.AsInteger :=
            cdsParcelasPtrItemPlano.AsInteger;
         cdsParcelasOrigemSN_SELECIONADA.AsBoolean := False;
         cdsParcelasOrigemCD_CONTA.AsInteger := cdsParcelasCD_CONTA.AsInteger;
         
         cdsParcelas.Next;
      end;

      if (cdsParcelasOrigem.State = dsInsert) then
      begin
         cdsParcelasOrigem.Post;
      end;
      cdsParcelasOrigem.EnableControls;
      cdsParcelas.Filtered := False;
      cdsParcelas.EnableControls;

      // Copia os descontos das parcelas
      cdsDescontos.Data := Self.cdsDescontos.Data;
   end;
end;

procedure TfMatricularPlano.cbDiaUtilSelect(Sender: TObject);
begin
   sbCalcVencto.Enabled := rbVenctoDiaUtil.Checked;
end;

procedure TfMatricularPlano.cbDiaVenctoSelect(Sender: TObject);
begin
   sbCalcVencto.Enabled := rbVenctoSempre.Checked;
end;

procedure TfMatricularPlano.cbUtilizarDescProgramadoClick(Sender: TObject);
begin
   // Verifica se o estudante possui dia de vencimento definido
   if (not qryDtVencPessoa.Eof) and (qryDtVencPessoa.FieldByName('NR_DIA_VENCIMENTO').AsInteger > 0) then
   begin
      rbVenctoEstudante.Checked := true;
   end
   // Caso não possua desabilita a opção
   else
   begin
      rbVenctoPlano.Checked := True;
   end;

   sbCalcVencto.Enabled := False;

   // Reseta as opções como se não tivessem sido utilizadas
   bUsouPlanoDesconto := False;
   bUsouAlterarQuantidadeParcelas := False;
   bUsouDividirTitulos := False;

   // Habilita/Desabilita as opções conforme regras da tela
   habilitaOpcoesParcela();
   
   AplicaPlanoPgto;
   CalculaVencimentos;

   if cbUtilizarDescProgramado.Checked then
   begin
      with fMatricularDivisaoTitulos do
      begin
         if not qryDivisaoProgramada.IsEmpty then
         begin
            cbManterDesc.Checked := (qryDivisaoProgramadasn_manter_desconto_fixo.AsInteger = 1);
            rbAplicaBruto.Checked := (qryDivisaoProgramadanr_forma_aplicar_divisao.AsInteger = 1);
            rbAplicaLiquido.Checked := (qryDivisaoProgramadanr_forma_aplicar_divisao.AsInteger = 2);

            cbManterDesc.Enabled := False;
            rbAplicaBruto.Enabled := False;
            rbAplicaLiquido.Enabled := False;

            qryTiposTituloDivisao.Open;
            CarregaTitulosDivisao;
            AplicaDivisaoProgramada;
            cdsParcelasOrigem.ReadOnly := True;
            cdsParcelasDivididas.ReadOnly := True;
            sbAplicar.Enabled := False;
            sbSelResp.Enabled := False;
            bbtnConfirmar.Enabled := True;
            bbtnCancelar.Enabled := False;
            lblDivisaoProgramada.Visible := True;
            fMatricularDivisaoTitulos.ShowModal;
            CarregaTitulosDivididos;

            cdsParcelasOrigem.ReadOnly := False;
            cdsParcelasDivididas.ReadOnly := False;
            lblDivisaoProgramada.Visible := False;
            sbAplicar.Enabled := True;
            sbSelResp.Enabled := True;
            bbtnConfirmar.Enabled := True;
            bbtnCancelar.Enabled := True;
         end;
      end;
   end;
end;

procedure TfMatricularPlano.cdsParcelasCalcFields(DataSet: TDataSet);
begin
   cdsParcelasVL_LIQUIDO.AsCurrency := (
      (cdsParcelasVL_BRUTO.AsCurrency + cdsParcelasVL_EXTRA.AsCurrency) -
      cdsParcelasVL_DESCONTO.AsCurrency - cdsParcelasVL_DESC_EXTRA.AsCurrency
   );
end;

procedure TfMatricularPlano.cdsParcelasDT_VENCTOSetText(Sender: TField;
  const Text: string);
const
   SMsgDataInvalida = 'A data de vencimento informada é inválida: %s';
var
   Value: TDateTime;
begin
   if not TryStrToDate(Text, Value) then
   begin
      MessageDlg(Format(SMsgDataInvalida, [Text]), mtError, [mbOK], -1)
   end
   else
      Sender.AsDateTime := Value;
end;

procedure TfMatricularPlano.dbgParcelasDrawColumnCell(Sender: TObject;
  const Rect: TRect; DataCol: Integer; Column: TColumn; State: TGridDrawState);
begin
   if (not cdsParcelasSN_GERAR.AsBoolean) or cdsParcelasSN_BLOQUEADO.AsBoolean then
   begin
      dbgParcelas.Canvas.Font.Color := clGrayText;
      dbgParcelas.Canvas.Brush.Color := clBtnFace;
      dbgParcelas.DefaultDrawColumnCell(Rect, DataCol, Column, State);
   end
   else if cdsParcelasSN_DIVISIVEL.AsBoolean then
   begin
      dbgParcelas.Canvas.Font.Color := clWindowText;
      dbgParcelas.Canvas.Brush.Color := clInfoBk;
      dbgParcelas.DefaultDrawColumnCell(Rect, DataCol, Column, State);
   end
   else
   begin
      dbgParcelas.DefaultDrawColumnCell(Rect, DataCol, Column, State);
   end;
end;

procedure TfMatricularPlano.dblcPlanoPgtoClick(Sender: TObject);
begin
   dsPlanoPgtoDataChange(nil, nil);
end;

procedure TfMatricularPlano.dsParcelasDataChange(Sender: TObject;
  Field: TField);
begin
   dbgParcelas.ReadOnly := cdsParcelasSN_BLOQUEADO.AsBoolean;
end;

procedure TfMatricularPlano.dsPlanoPgtoDataChange(Sender: TObject;
  Field: TField);
const
   SCondVenctoSDF = '(exceto sábados, domingos e feriados)';
   SCondVenctoSD = '(exceto sábados e domingos)';
   SCondVenctoSF = '(exceto sábados e ferados)';
   SCondVenctoDF = '(exceto domingos e feriados)';
   SCondVenctoS = '(exceto sábados)';
   SCondVenctoD = '(exceto domingos)';
   SCondVenctoF = '(exceto feriados)';
var
   S: string;
   I, j: Integer;
   PulaSabado, PulaDomingo, PulaFeriado: Boolean;
   diaAtual : String;
   Year, Month, Day : Word;
begin
   // Não executar se o DataChange estiver no mesmo plano selecionado

   S := qryPlanoPgtoDS_DIAS_VENCTO.AsString;

   cbDiaVencto.Items.BeginUpdate;
   cbDiaVencto.Items.Clear;

   diaAtual := FormatDateTime('dd',now());


   // Se nao tem plano de pagamento selecionado
   if ( Length(S) < 1 ) then
   begin
      cbDiaVencto.Items.Add('01');
      cbDiaVencto.Items.Add('02');
      cbDiaVencto.Items.Add('03');
      cbDiaVencto.Items.Add('04');
      cbDiaVencto.Items.Add('05');
      cbDiaVencto.Items.Add('06');
      cbDiaVencto.Items.Add('07');
      cbDiaVencto.Items.Add('08');
      cbDiaVencto.Items.Add('09');
      cbDiaVencto.Items.Add('10');
      cbDiaVencto.Items.Add('11');
      cbDiaVencto.Items.Add('12');
      cbDiaVencto.Items.Add('13');
      cbDiaVencto.Items.Add('14');
      cbDiaVencto.Items.Add('15');
      cbDiaVencto.Items.Add('16');
      cbDiaVencto.Items.Add('17');
      cbDiaVencto.Items.Add('18');
      cbDiaVencto.Items.Add('19');
      cbDiaVencto.Items.Add('20');
      cbDiaVencto.Items.Add('21');
      cbDiaVencto.Items.Add('22');
      cbDiaVencto.Items.Add('23');
   end
   else begin
      for I := 1 to Length(S) do
      begin
         if S[I] = '1' then
         begin
            cbDiaVencto.Items.Add(Format('%d', [I]));
         end;
      end;
   end;

   for j := 0 to cbDiaVencto.Items.Count - 1 do
   begin
      if ( diaAtual = cbDiaVencto.Items[j] )  then
      begin
         cbDiaVencto.ItemIndex := j;
      end;
   end;

   cbDiaVencto.Items.EndUpdate;

   if ( (qryPlanoPgtoDT_APARTIR.AsString <> '') and (qryPlanoPgtoNR_TIPO_VENCTO.AsInteger = 0) )  then
   begin
      dtpVenctoDiaUtil.Date := qryPlanoPgtoDT_APARTIR.AsDateTime;
   end else
   begin
      DecodeDate(Date, Year, Month, Day);
      dtpVenctoDiaUtil.Date := EncodeDate(Year, Month, 1);
   end;

   if ( (qryPlanoPgtoDT_APARTIR.AsString <> '') and (qryPlanoPgtoNR_TIPO_VENCTO.AsInteger = 0) )  then
   begin
      dtpVenctoSempre.Date := qryPlanoPgtoDT_APARTIR.AsDateTime;
   end else
   begin
      DecodeDate(Date, Year, Month, Day);
      dtpVenctoSempre.Date := EncodeDate(Year, Month, 1);
   end;

   PulaSabado := qryPlanoPgtoSN_PULAR_SABADOS.AsInteger = 1;
   PulaDomingo := qryPlanoPgtoSN_PULAR_DOMINGOS.AsInteger = 1;
   PulaFeriado := qryPlanoPgtoSN_PULAR_FERIADOS.AsInteger = 1;

   if PulaSabado and PulaSabado and PulaFeriado then
   begin
      lblVenctoOpcs.Caption := SCondVenctoSDF;
   end
   else if PulaSabado and PulaDomingo then
   begin
      lblPlanoPgto.Caption := SCondVenctoSD;
   end
   else if PulaSabado and PulaFeriado then
   begin
      lblPlanoPgto.Caption := SCondVenctoSF;
   end
   else if PulaDomingo and PulaFeriado then
   begin
      lblVenctoOpcs.Caption := SCondVenctoDF;
   end
   else if PulaSabado then
   begin
      lblVenctoOpcs.Caption := SCondVenctoS;
   end
   else if PulaDomingo then
   begin
      lblVenctoOpcs.Caption := SCondVenctoD;
   end
   else if PulaFeriado then
   begin
      lblVenctoOpcs.Caption := SCondVenctoF;
   end
   else
   begin
      lblVenctoOpcs.Caption := '';
   end;

   // Verifica se o estudante possui dia de vencimento definido
   if (not qryDtVencPessoa.Eof) and (qryDtVencPessoa.FieldByName('NR_DIA_VENCIMENTO').AsInteger > 0) then
   begin
      rbVenctoEstudante.Checked := true;
   end
   // Caso não possua desabilita a opção
   else
   begin
      rbVenctoPlano.Checked := True;
   end;
   
   sbCalcVencto.Enabled := False;

   // Reseta as opções como se não tivessem sido utilizadas
   bUsouPlanoDesconto := False;
   bUsouAlterarQuantidadeParcelas := False;
   bUsouDividirTitulos := False;

   // Habilita/Desabilita as opções conforme regras da tela
   habilitaOpcoesParcela();
   
   AplicaPlanoPgto;
   CalculaVencimentos;
end;

procedure TfMatricularPlano.dtpVenctoDiaUtilChange(Sender: TObject);
begin
   sbCalcVencto.Enabled := rbVenctoDiaUtil.Checked;
end;

procedure TfMatricularPlano.dtpVenctoSempreChange(Sender: TObject);
begin
   sbCalcVencto.Enabled := rbVenctoSempre.Checked;
end;

procedure TfMatricularPlano.Finaliza;
var
   I: Integer;
begin
   if fMatricularDivisaoTitulos <> nil then
   begin
      fMatricularDivisaoTitulos.Free;
      fMatricularDivisaoTitulos := nil;
   end;

   if fMatricularDivisaoParcelas <> nil then
   begin
      fMatricularDivisaoParcelas.Free;
      fMatricularDivisaoParcelas := nil;
   end;

   // Verifica se o estudante possui dia de vencimento definido
   if (not qryDtVencPessoa.Eof) and (qryDtVencPessoa.FieldByName('NR_DIA_VENCIMENTO').AsInteger > 0) then
   begin
      rbVenctoEstudante.Checked := true;
   end
   // Caso não possua desabilita a opção
   else
   begin
      rbVenctoPlano.Checked := True;
   end;

   for I := ComponentCount - 1 downto 0 do
   begin
      if Components[I] is TClientDataSet then
      begin
         if TClientDataSet(Components[I]).Active then
         begin
            TClientDataSet(Components[I]).EmptyDataSet;
            TClientDataSet(Components[I]).Close;
         end;
      end;
   end;

   dblcPlanoPgto.KeyValue := Null;
   qryPlanoPgto.DisableControls;
   qryResponsavel.Close;
   qryItensPlano.Close;
   qryPlanoPgto.Close;
   FreeAndNil(fMatricularPlanoDesconto);
end;

procedure TfMatricularPlano.GeraMensalidades;
const
   IntToSNF: array [0..2] of Char = ('N', 'S', 'F'); 
begin
   fMatricular.cdsMensalidades.DisableControls;

   if fMatricular.cdsMensalidades.Active then
   begin
      fMatricular.cdsMensalidades.EmptyDataSet;
   end;

   cdsParcelas.DisableControls;
   cdsParcelas.Filter := 'SN_GERAR';
   cdsParcelas.Filtered := True;
   cdsParcelas.First;

   while not cdsParcelas.Eof do
   begin
      if qryItensPlano.BookmarkValid(Pointer(cdsParcelasPtrItemPlano.AsInteger)) then
      begin
         qryItensPlano.GotoBookmark(Pointer(cdsParcelasPtrItemPlano.AsInteger));
      end;

      fMatricular.cdsMensalidades.Insert;
      fMatricular.cdsMensalidadesCD_TIPO_TITULO.AsInteger :=
         cdsParcelasCD_TIPO_TITULO.AsInteger;
      fMatricular.cdsMensalidadesDS_TIPO_TITULO.AsString :=
         cdsParcelasDS_TIPO_TITULO.AsString;
      fMatricular.cdsMensalidadesNR_PARCELA.AsInteger :=
         cdsParcelasNR_PARCELA.AsInteger;
      fMatricular.cdsMensalidadesNR_CREDITOS.AsFloat :=
         cdsParcelasNR_CREDITOS.AsFloat;
      fMatricular.cdsMensalidadesDT_VENCTO.AsDateTime :=
         cdsParcelasDT_VENCTO.AsDateTime;
      fMatricular.cdsMensalidadesVL_BRUTO.AsCurrency :=
         cdsParcelasVL_BRUTO.AsCurrency;
      fMatricular.cdsMensalidadesVL_DESCONTO.AsCurrency :=
         cdsParcelasVL_DESCONTO.AsCurrency;
      fMatricular.cdsMensalidadesVL_BOLSA.AsCurrency :=
         cdsParcelasVL_DESC_EXTRA.AsCurrency;
      fMatricular.cdsMensalidadesVL_EXTRA.AsCurrency :=
         cdsParcelasVL_EXTRA.AsCurrency;
      fMatricular.cdsMensalidadesCD_RESPONSAVEL.AsInteger :=
         cdsParcelasCD_RESPONSAVEL.AsInteger;
      fMatricular.cdsMensalidadesNM_RESPONSAVEL.AsString :=
         cdsParcelasNM_RESPONSAVEL.AsString;
      fMatricular.cdsMensalidadesSN_CREDITO.AsString :=
         IntToSNF[qryItensPlanoSN_CREDITO_PARCELA.AsInteger];
      fMatricular.cdsMensalidadesDS_HISTORICO.AsString :=
         cdsParcelasDS_TIPO_TITULO.AsString;
      fMatricular.cdsMensalidadesCD_ITEM_PLANO.AsInteger :=
         qryItensPlanoCD_PLANO_ITEM.AsInteger;
      fMatricular.cdsMensalidadesCD_ACAO_MOVIMENTO.AsInteger :=
         cdsParcelasCD_ACAO_MOVIMENTO.AsInteger;
      fMatricular.cdsMensalidadesCD_DESC_CONDICIONAL.AsInteger :=
         cdsParcelasCD_DESC_CONDICIONAL.AsInteger;

      fMatricular.cdsMensalidadesVL_PERCENTUAL_DIVISAO.AsCurrency := 100;
      if cdsParcelasVL_PERCENTUAL_DIVISAO.AsCurrency > 0 then
      begin
         fMatricular.cdsMensalidadesVL_PERCENTUAL_DIVISAO.AsCurrency :=
            cdsParcelasVL_PERCENTUAL_DIVISAO.AsCurrency;
      end;

      if qryPlanoPgtoSN_CREDITOS.AsInteger = 1 then
      begin
         // fMatricular.cdsMensalidadesVL_CREDITO.AsFloat := qryItensPlanoVL_BRUTO.AsFloat / qryPlanoPgtoNR_CREDITOS_BASE.AsInteger;
         fMatricular.cdsMensalidadesVL_CREDITO.AsFloat := cdsParcelasVL_CREDITO.AsCurrency
      end else begin
         fMatricular.cdsMensalidadesVL_CREDITO.AsFloat := 0;
      end;

      fMatricular.cdsMensalidadesSN_PERDOAR.AsBoolean :=
         cdsParcelasSN_PERDOAR.AsBoolean;
      fMatricular.cdsMensalidadesSN_RECIBO_IMP.AsBoolean :=
         cdsParcelasSN_RECIBO_IMP.AsBoolean;
      fMatricular.cdsMensalidadesCD_CONTA.AsInteger :=
         cdsParcelasCD_CONTA.AsInteger;

      fMatricular.cdsMensalidadesIDX_PARCELA.AsInteger := cdsParcelasIDX_PARCELA.AsInteger;

      cdsParcelas.Next;
   end;

   if fMatricular.cdsMensalidades.State = dsInsert then
   begin
      fMatricular.cdsMensalidades.Post;
   end;

   // Copia os descontos gerados para gerar as ações de movimento
   fMatricular.cdsDescontos.Data := cdsDescontos.Data;

   fMatricular.cdsMensalidades.EnableControls;
   cdsParcelas.Filtered := False;
   cdsParcelas.EnableControls;
end;

function TfMatricularPlano.GetCodigoRespFinan: Integer;
begin
   if qryResponsavelCD_RESP_FINAN.AsInteger = 0 then
   begin
      Result := qryResponsavelCD_PESSOA.AsInteger;
   end
   else
      Result := qryResponsavelCD_RESP_FINAN.AsInteger;
end;

function TfMatricularPlano.GetNomeRespFinan: string;
begin
   if qryResponsavelNM_RESP_FINAN.AsString = '' then
   begin
      Result := qryResponsavelNM_PESSOA.AsString
   end
   else
      Result := qryResponsavelNM_RESP_FINAN.AsString;
end;

function TfMatricularPlano.GetNrIdxProxParcela(): Integer;
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

procedure TfMatricularPlano.Inicializa;
begin
   // Dia de vencimento definido para o estudante
   qryDtVencPessoa.Close;
   qryDtVencPessoa.ParamByName('CD_PESSOA').AsInteger := fMatricular.Pessoa;
   qryDtVencPessoa.Open;

   qryResponsavel.Close;
   qryResponsavel.ParamByName('CD_PESSOA').AsInteger := fMatricular.Pessoa;
   qryResponsavel.Open;

   // Verifica se o estudante possui dia de vencimento definido
   if (not qryDtVencPessoa.Eof) and (qryDtVencPessoa.FieldByName('NR_DIA_VENCIMENTO').AsInteger > 0) then
   begin
      lbDiaVencEstudante.Caption := '(Dia ' + qryDtVencPessoa.FieldByName('NR_DIA_VENCIMENTO').AsString + ')';
      rbVenctoEstudante.Checked := true;
   end
   // Caso não possua desabilita a opção
   else
   begin
      lbDiaVencEstudante.Caption := '';
      rbVenctoEstudante.Checked := false;
      rbVenctoEstudante.Enabled := false;
   end;

   cdsDescontos.Open;
   cdsParcelas.Open;
   if not qryPlanoPgto.ControlsDisabled then
   begin
      qryPlanoPgto.DisableControls;
   end;
   qryPlanoPgto.Open;
   qryItensPlano.Open;
   qryResponsavel.Open;
   qryPlanoPgto.EnableControls;
   qryPlanoPgto.Locate('CD_PLANO', fMatricular.qryTurmaCD_PLANO_PADRAO.AsInteger, []);
   dblcPlanoPgto.KeyValue := qryPlanoPgtoCD_PLANO.AsInteger;
   
   dsPlanoPgtoDataChange(nil, nil);
   {
      Inicializa o número de indice da próxima parcela como sendo 1
      Esse nrIdxProxParcela é um número que será utilizado para linkar a parcela gerada no clientDataSet cdsParcelas
      com todos os descontos aplicados a essa parcela (que gerarão fin_mov_cr) que estão no clientDataSet cdsDescontos
      A variável é incrementada sempre que seu valor atual é pego
   }
   nrIdxProxParcela := 1;

   // Verifica se o usuário tem permissão para aplicar o plano de desconto
   bPermissaoAplicarPlanoDesconto := DM.UsuarioLogado.TemPermissao(DM.iCdPessoaLogado, 'UMFinanceiro.Alunos.Matricula.Matricular.PlanoDesconto', npAcesso, False);
   bPermissaoAlterarQuantidadeParcelas := DM.UsuarioLogado.TemPermissao(DM.iCdPessoaLogado, 'UMFinanceiro.Matricular.PlanoPgto.AlterarNumeroParcelas', npAcesso, False);
   bPermissaoDividirTitulos := DM.UsuarioLogado.TemPermissao(DM.iCdPessoaLogado, 'UMFinanceiro.Mensalidades.DividirTitulos', npAcesso, False);

   // Reseta as opções como se não tivessem sido utilizadas
   bUsouPlanoDesconto := False;
   bUsouAlterarQuantidadeParcelas := False;
   bUsouDividirTitulos := False;

   // Habilita/Desabilita as opções conforme regras da tela
   habilitaOpcoesParcela();

   sbCalcVencto.Enabled := DM.UsuarioLogado.TemPermissao(DM.iCdPessoaLogado,
      'UMFinanceiro.Matricular.PlanoPgto.AlterarDataVencimento', npAcesso,
      False);
   rbVenctoDiaUtil.Enabled := sbCalcVencto.Enabled;
   rbVenctoSempre.Enabled := sbCalcVencto.Enabled;
   dblcPlanoPgto.Enabled := DM.UsuarioLogado.TemPermissao(DM.iCdPessoaLogado,
      'UMFinanceiro.Alunos.Matricula.Matricular.PlanoPgto', npAlterar, False);
   sbRestaurar.Enabled := dblcPlanoPgto.Enabled;

   dbgParcelas.Columns.Items[2].ReadOnly := not sbCalcVencto.Enabled;

   if fMatricularDivisaoTitulos = nil then
   begin
      Application.CreateForm(
         TfMatricularDivisaoTitulos,
         fMatricularDivisaoTitulos
      );
   end;

   with fMatricularDivisaoTitulos do
   begin
      if qryDivisaoProgramada.Active then
      begin
         qryDivisaoProgramada.Close;
      end;
      qryDivisaoProgramada.ParamByName('CD_PESSOA').AsInteger := fMatricular.Pessoa;
      qryDivisaoProgramada.ParamByName('CD_DEPTO').AsInteger := fMatricular.qryTurmaCD_DEPTO.AsInteger;
      qryDivisaoProgramada.Open;

      cbManterDesc.Enabled := True;
      rbAplicaBruto.Enabled := True;
      rbAplicaLiquido.Enabled := True;
      if not qryDivisaoProgramada.IsEmpty then
      begin
         cbManterDesc.Checked := (qryDivisaoProgramadasn_manter_desconto_fixo.AsInteger = 1);
         rbAplicaBruto.Checked := (qryDivisaoProgramadanr_forma_aplicar_divisao.AsInteger = 1);
         rbAplicaLiquido.Checked := (qryDivisaoProgramadanr_forma_aplicar_divisao.AsInteger = 2);

         cbManterDesc.Enabled := False;
         rbAplicaBruto.Enabled := False;
         rbAplicaLiquido.Enabled := False;

         qryTiposTituloDivisao.Open;
         CarregaTitulosDivisao;
         AplicaDivisaoProgramada;
         cdsParcelasOrigem.ReadOnly := True;
         cdsParcelasDivididas.ReadOnly := True;
         sbAplicar.Enabled := False;
         sbSelResp.Enabled := False;
         bbtnConfirmar.Enabled := True;
         bbtnCancelar.Enabled := False;
         lblDivisaoProgramada.Visible := True;
         fMatricularDivisaoTitulos.ShowModal;
         CarregaTitulosDivididos;

         cdsParcelasOrigem.ReadOnly := False;
         cdsParcelasDivididas.ReadOnly := False;
         lblDivisaoProgramada.Visible := False;
         sbAplicar.Enabled := True;
         sbSelResp.Enabled := True;
         bbtnConfirmar.Enabled := True;
         bbtnCancelar.Enabled := True;
      end;
   end;

end;

procedure TfMatricularPlano.rbVenctoDiaUtilClick(Sender: TObject);
begin
   sbCalcVencto.Enabled := True;
   cbDiaUtil.Visible := True;
   lblVenctoDiaUtil.Visible := True;
   dtpVenctoDiaUtil.Visible := True;
   cbDiaVencto.Visible := False;
   lblVenctoSempre.Visible := False;
   dtpVenctoSempre.Visible := False;
   lblVenctoOpcs.Visible := False;
end;

procedure TfMatricularPlano.rbVenctoEstudanteClick(Sender: TObject);
begin
   sbCalcVencto.Enabled := True;
   cbDiaUtil.Visible := False;
   lblVenctoDiaUtil.Visible := False;
   dtpVenctoDiaUtil.Visible := False;
   cbDiaVencto.Visible := False;
   lblVenctoSempre.Visible := False;
   dtpVenctoSempre.Visible := False;
   lblVenctoOpcs.Visible := False;
end;

procedure TfMatricularPlano.rbVenctoPlanoClick(Sender: TObject);
begin
   sbCalcVencto.Enabled := True;
   cbDiaUtil.Visible := False;
   lblVenctoDiaUtil.Visible := False;
   dtpVenctoDiaUtil.Visible := False;
   cbDiaVencto.Visible := False;
   lblVenctoSempre.Visible := False;
   dtpVenctoSempre.Visible := False;
   lblVenctoOpcs.Visible := False;
end;

procedure TfMatricularPlano.rbVenctoSempreClick(Sender: TObject);
begin
   sbCalcVencto.Enabled := True;
   cbDiaUtil.Visible := False;
   lblVenctoDiaUtil.Visible := False;
   dtpVenctoDiaUtil.Visible := False;
   cbDiaVencto.Visible := True;
   lblVenctoSempre.Visible := True;
   dtpVenctoSempre.Visible := True;
   lblVenctoOpcs.Visible := True;
end;

procedure TfMatricularPlano.sbCalcVenctoClick(Sender: TObject);
begin
   sbCalcVencto.Enabled := False;
   CalculaVencimentos;
end;

procedure TfMatricularPlano.sbDividirRespClick(Sender: TObject);
begin
   if fMatricularDivisaoTitulos = nil then
   begin
      Application.CreateForm(
         TfMatricularDivisaoTitulos,
         fMatricularDivisaoTitulos
      );
   end;
   CarregaTitulosDivisao;

   with fMatricularDivisaoTitulos do
   begin
      cdsParcelasDivididas.EmptyDataSet;
      cdsResponsavel.Insert;
      
      if (ShowModal = mrOk) and not cdsParcelasDivididas.IsEmpty then
      begin
         CarregaTitulosDivididos;
      end;
   end;
end;

procedure TfMatricularPlano.sbDividirTitulosClick(Sender: TObject);
begin
   if fMatricularDivisaoParcelas = nil then
   begin
      Application.CreateForm(
         TfMatricularDivisaoParcelas,
         fMatricularDivisaoParcelas
      );
   end;
   CarregaParcelasDivisao;

   with fMatricularDivisaoParcelas do
   begin
      if ShowModal.retornoValido  then
      begin

         cdsParcelasDivisao.DisableControls;
         cdsParcelasDivisao.Filter := 'NR_NOVAS_PARCELAS > 0';
         cdsParcelasDivisao.Filtered := True;
         cdsParcelasDivisao.First;

         cdsParcelas.DisableControls;
         cdsParcelasDivididas.DisableControls;

         while not cdsParcelasDivisao.Eof do
         begin
            cdsParcelas.Filter := Format(
               'SN_GERAR AND NOT SN_PERDOAR AND SN_DIVISIVEL AND CD_TIPO_TITULO = %d',
               [cdsParcelasDivisaoCD_TIPO_TITULO.AsInteger]
            );
            cdsParcelas.Filtered := True;

            while not cdsParcelas.IsEmpty do
            begin
               // Apaga os descontos das parcelas divididas
               cdsDescontos.Filter := 'IDX_PARCELA = '+cdsParcelasIDX_PARCELA.AsString;
               cdsDescontos.Filtered := true;
               cdsDescontos.First;
               
               while not cdsDescontos.IsEmpty do
               begin
                  cdsDescontos.Delete;
               end;

               // Apaga as parcelas divididas
               cdsParcelas.Delete;
            end;

            cdsParcelasDivididas.Filter := Format('CD_TIPO_TITULO = %d', [
               cdsParcelasDivisaoCD_TIPO_TITULO.AsInteger
            ]);
            cdsParcelasDivididas.Filtered := True;
            cdsParcelasDivididas.First;

            while not cdsParcelasDivididas.Eof do
            begin
               cdsParcelas.Insert;
               cdsParcelasCD_TIPO_TITULO.AsInteger :=
                  cdsParcelasDivididasCD_TIPO_TITULO.AsInteger;
               cdsParcelasDS_TIPO_TITULO.AsString :=
                  cdsParcelasDivididasDS_TIPO_TITULO.AsString;
               cdsParcelasNR_PARCELA.AsInteger :=
                  cdsParcelasDivididasNR_PARCELA.AsInteger;
               cdsParcelasVL_BRUTO.AsCurrency :=
                  cdsParcelasDivididasVL_BRUTO.AsCurrency;
               cdsParcelasVL_DESCONTO.AsCurrency :=
                  cdsParcelasDivididasVL_DESCONTO.AsCurrency;
               cdsParcelasVL_EXTRA.AsCurrency :=
                  cdsParcelasDivididasVL_EXTRA.AsCurrency;
               cdsParcelasVL_CREDITO.AsCurrency :=
                  cdsParcelasDivididasVL_CREDITO.AsCurrency;
               cdsParcelasVL_DESC_EXTRA.AsCurrency :=
                  cdsParcelasDivididasVL_DESC_EXTRA.AsCurrency;
               cdsParcelasCD_CONTA.AsInteger :=
                  cdsParcelasDivididasCD_CONTA.AsInteger;
               cdsParcelasSN_DIVISIVEL.AsBoolean := False;
               cdsParcelasCD_RESPONSAVEL.AsInteger := GetCodigoRespFinan;
               cdsParcelasNM_RESPONSAVEL.AsString := GetNomeRespFinan;
               cdsParcelasDT_VENCTO.AsDateTime :=
                  cdsParcelasDivididasDT_VENCTO.AsDateTime;
               cdsParcelasSN_DIVIDIDO.AsBoolean := True;

               cdsParcelasIDX_PARCELA.AsInteger := GetNrIdxProxParcela();

               if qryItensPlano.Locate('NR_PARCELA', cdsParcelasNR_PARCELA.AsInteger, []) then
               begin
                  cdsParcelasPtrItemPlano.AsInteger := Integer(qryItensPlano.GetBookmark);
                  cdsParcelasSN_DIVISIVEL.AsBoolean :=
                     qryItensPlanoSN_DIVISIVEL.AsInteger = 1;
                  cdsParcelasSN_BLOQUEADO.AsBoolean :=
                     qryItensPlanoSN_BLOQUEADO.AsInteger = 1;
               end else begin
                  cdsParcelasPtrItemPlano.AsInteger := Integer(Pointer(nil));
               end;

               cdsParcelasSN_RECIBO_IMP.AsBoolean := False;
               cdsParcelasSN_GERAR.AsBoolean := True;
               cdsParcelasSN_PERDOAR.AsBoolean := False;

               // Filtrar os descontos divididos que foram gerados da parcela
               cdsDescontosDivididos.Filter := 'IDX_PARCELA = '+cdsParcelasDivididasIDX_PARCELA.AsString;
               cdsDescontosDivididos.Filtered := true;
               cdsDescontosDivididos.First;
               
               // Gera os descontos das parcelas divididas
               while not cdsDescontosDivididos.Eof do
               begin
                  cdsDescontos.Insert;
                  cdsDescontosVL_DESCONTO.AsCurrency := cdsDescontosDivididosVL_DESCONTO.AsCurrency;
                  cdsDescontosCD_ACAO_MOVIMENTO.AsInteger := cdsDescontosDivididosCD_ACAO_MOVIMENTO.AsInteger;
                  cdsDescontosDS_OBSERVACAO.AsString := cdsDescontosDivididosDS_OBSERVACAO.AsString;
                  cdsDescontosCD_TIPO_DESCONTO.AsInteger := cdsDescontosDivididosCD_TIPO_DESCONTO.AsInteger;
                  cdsDescontosCD_TIPO_COMPORTAMENTO.AsInteger := cdsDescontosDivididosCD_TIPO_COMPORTAMENTO.AsInteger;
                  cdsDescontosSN_DESCONTO_PLANO.AsInteger := cdsDescontosDivididosSN_DESCONTO_PLANO.AsInteger;
                  cdsDescontosIDX_PARCELA.AsInteger := cdsParcelasIDX_PARCELA.AsInteger;
                  cdsDescontos.Post;
                  
                  cdsDescontosDivididos.Next;
               end;

               cdsParcelasDivididas.Next;
            end;
            
            cdsParcelas.Post;
            cdsParcelasDivisao.Next;
         end;
         cdsParcelasDivisao.EnableControls;
         cdsParcelasDivididas.EnableControls;
         cdsParcelas.Filtered := False;
         cdsParcelasDivisao.Filtered := False;
         cdsParcelas.EnableControls;
         sbCalcVencto.Enabled := True;
         sbCalcVencto.Click;

         // Informa que usou a opção de alteração de quantidade de parcelas
         bUsouAlterarQuantidadeParcelas := True;

         // Habilita/Desabilita as opções conforme regras da tela
         habilitaOpcoesParcela();
      end;
   end;
   CalculaVencimentos;
end;

procedure TfMatricularPlano.sbPlanoDescontoClick(Sender: TObject);
begin
   if fMatricularPlanoDesconto = nil then
   begin
      Application.CreateForm(
         TfMatricularPlanoDesconto,
         fMatricularPlanoDesconto
      );
   end;
   CarregaTitulosDesconto;
   with fMatricularPlanoDesconto do
   begin
      sbSimular.Down := False;

      if ShowModal = mrOk then
      begin
         cdsParcelasPlanoDesconto.DisableControls;
         cdsParcelasPlanoDesconto.First;

         cdsParcelas.DisableControls;
         cdsParcelas.Filter := 'SN_GERAR';
         cdsParcelas.Filtered := True;
         while not cdsParcelas.IsEmpty do cdsParcelas.Delete;

         while not cdsParcelasPlanoDesconto.Eof do
         begin
            cdsParcelas.Insert;
            cdsParcelasPtrItemPlano.AsInteger :=
               cdsParcelasPlanoDescontoPtrItemPlano.AsInteger;
            cdsParcelasIDX_PARCELA.AsInteger :=
               cdsParcelasPlanoDescontoIDX_PARCELA.AsInteger;
            cdsParcelasCD_TIPO_TITULO.AsInteger :=
               cdsParcelasPlanoDescontoCD_TIPO_TITULO.AsInteger;
            cdsParcelasDS_TIPO_TITULO.AsString :=
               cdsParcelasPlanoDescontoDS_TIPO_TITULO.AsString;
            cdsParcelasNR_PARCELA.AsInteger :=
               cdsParcelasPlanoDescontoNR_PARCELA.AsInteger;
            cdsParcelasDT_VENCTO.AsDateTime :=
               cdsParcelasPlanoDescontoDT_VENCTO.AsDateTime;
            cdsParcelasVL_BRUTO.AsCurrency :=
               cdsParcelasPlanoDescontoVL_BRUTO.AsCurrency;
            cdsParcelasVL_CREDITO.AsCurrency :=
               cdsParcelasPlanoDescontoVL_CREDITO.AsCurrency;
            cdsParcelasVL_DESCONTO.AsCurrency :=
               cdsParcelasPlanoDescontoVL_DESCONTO.AsCurrency;
            cdsParcelasVL_EXTRA.AsCurrency :=
               cdsParcelasPlanoDescontoVL_EXTRA.AsCurrency;
            cdsParcelasCD_RESPONSAVEL.AsInteger :=
               cdsParcelasPlanoDescontoCD_RESPONSAVEL.AsInteger;
            cdsParcelasNM_RESPONSAVEL.AsString :=
               cdsParcelasPlanoDescontoNM_RESPONSAVEL.AsString;
            cdsParcelasVL_DESC_EXTRA.AsCurrency :=
               cdsParcelasPlanoDescontoVL_DESC_EXTRA.AsCurrency;
            cdsParcelasSN_DIVISIVEL.AsBoolean :=
               cdsParcelasPlanoDescontoSN_DIVISIVEL.AsBoolean;
            cdsParcelasSN_RECIBO_IMP.AsBoolean := False;
            cdsParcelasSN_GERAR.AsBoolean := True;
            cdsParcelasSN_PERDOAR.AsBoolean := False;
            cdsParcelasCD_CONTA.AsInteger :=
               cdsParcelasPlanoDescontoCD_CONTA.AsInteger;
            cdsParcelasCD_ACAO_MOVIMENTO.AsInteger :=
               cdsParcelasPlanoDescontoCD_ACAO_MOVIMENTO.AsInteger;
            cdsParcelasCD_DESC_CONDICIONAL.AsInteger :=
               cdsParcelasPlanoDescontoCD_DESC_CONDICIONAL.AsInteger;
            cdsParcelasNR_CREDITOS.AsFloat :=
               cdsParcelasPlanoDescontoNR_CREDITOS.AsFloat;

            if qryItensPlano.BookmarkValid(Pointer(cdsParcelasPtrItemPlano.AsInteger)) then
            begin
               qryItensPlano.GotoBookmark(Pointer(cdsParcelasPtrItemPlano.AsInteger));
               cdsParcelasSN_DIVISIVEL.AsBoolean := qryItensPlanoSN_DIVISIVEL.AsInteger = 1;
               cdsParcelasSN_BLOQUEADO.AsBoolean := qryItensPlanoSN_BLOQUEADO.AsInteger = 1;
            end;

            {
              Gerar as ações de movimento do desconto do plano de desconto aplicado
              Adicionar os descontos no ClientDataSet de descontos (que gerarão futuramente a fin_mov_cr)
            }
            gerarAcoesMovimentoPlanoDesconto(cdsParcelasPlanoDescontoIDX_PARCELA.AsInteger);

            cdsParcelasPlanoDesconto.Next;
         end;

         if cdsParcelas.State = dsInsert then
         begin
            cdsParcelas.Post;
         end;
         cdsParcelas.Filtered := False;
         cdsParcelas.EnableControls;
         cdsParcelasPlanoDesconto.EnableControls;

         // Informa que usou a opção de plano de desconto
         bUsouPlanoDesconto := True;

         // Habilita/Desabilita as opções conforme regras da tela
         habilitaOpcoesParcela();
      end;
   end;
end;

procedure TfMatricularPlano.gerarAcoesMovimentoPlanoDesconto(idxParcela: Integer);
begin
   with fMatricularPlanoDesconto do
   begin

      cdsDescontosPlanoDesconto.Open;
      cdsDescontosPlanoDesconto.First;

      // Filtra a parcela que está sendo aplicado o desconto
      cdsDescontosPlanoDesconto.Filter := 'IDX_PARCELA = '+IntToStr(idxParcela);
      cdsDescontosPlanoDesconto.Filtered := true;

      // Repassa o desconto do plano de desconto para o desconto da parcela que será gerada
      while not cdsDescontosPlanoDesconto.Eof do
      begin

         cdsDescontos.Insert;
         cdsDescontosIDX_PARCELA.AsInteger := idxParcela;
         cdsDescontosVL_DESCONTO.AsCurrency := cdsDescontosPlanoDescontoVL_DESCONTO.AsCurrency;
         cdsDescontosCD_ACAO_MOVIMENTO.AsInteger := cdsDescontosPlanoDescontoCD_ACAO_MOVIMENTO.AsInteger;
         cdsDescontosCD_TIPO_DESCONTO.AsInteger := cdsDescontosPlanoDescontoCD_TIPO_DESCONTO.AsInteger;
         cdsDescontosDS_OBSERVACAO.AsString := cdsDescontosPlanoDescontoDS_OBSERVACAO.AsString;
         cdsDescontosCD_TIPO_COMPORTAMENTO.AsInteger := cdsDescontosPlanoDescontoCD_TIPO_COMPORTAMENTO.AsInteger;
         cdsDescontosSN_DESCONTO_PLANO.AsInteger := cdsDescontosPlanoDescontoSN_DESCONTO_PLANO.AsInteger;
         cdsDescontos.Post;

         cdsDescontosPlanoDesconto.Next;
      end;

      cdsDescontosPlanoDesconto.Close;
   end;

   // Recalcula o desconto condicional do plano de pagamento da parcela
   RecalcularDescontoCondicionalPlanoPagamento(idxParcela);
end;

procedure TfMatricularPlano.sbRestaurarClick(Sender: TObject);
begin
   // Verifica se o estudante possui dia de vencimento definido
   if (not qryDtVencPessoa.Eof) and (qryDtVencPessoa.FieldByName('NR_DIA_VENCIMENTO').AsInteger > 0) then
   begin
      rbVenctoEstudante.Checked := true;
   end
   // Caso não possua desabilita a opção
   else
   begin
      rbVenctoPlano.Checked := True;
   end;
   
   sbCalcVencto.Enabled := False;

   // Reseta as opções como se não tivessem sido utilizadas
   bUsouPlanoDesconto := False;
   bUsouAlterarQuantidadeParcelas := False;
   bUsouDividirTitulos := False;

   // Habilita/Desabilita as opções conforme regras da tela
   habilitaOpcoesParcela();

   AplicaPlanoPgto;
   CalculaVencimentos;
end;

procedure TfMatricularPlano.habilitaProgramacaoDescontoEstudante();
begin

   // Informa que a programação de desconto esta habilitada
   bHabilitadaProgramacaoDesconto := True;

   // Apresenta as opções em tela de programação de desconto
   lblDescontoProg.Visible := True;
   cbUtilizarDescProgramado.Visible := True;

end;

procedure TfMatricularPlano.habilitaOpcoesParcela();
begin

   {
     A ordem das operações DEVE ser a seguinte:
     - Aplicação de descontos programados (a ativação/desativação sempre vai estar disponivel mas essa ação restaura todas as parcelas para os valores originais)
     1) Plano de desconto, hoje permite uma única aplicação de plano de desconto
     2) Alterar quantidade de parcelas, se usada essa opção a opção anterior (plano de desconto) é bloqueada, mesmo o usuário tendo usado ou não, ou seja, se for usar plano de desconto deve usar antes dessa opção
     3) Dividir Títulos, se usada essa opção bloqueia as opções anteriores (plano de desconto e alterar quantidade de parcelas)

     Primeiro deve ser checada as permissões para se usar as opções sempre e depois as regras específicas de cada opção conforme acima
   }

   // Inicia todas as opções como desabilitadas
   sbPlanoDesconto.Enabled := False;
   sbDividirTitulos.Enabled := False;
   sbDividirResp.Enabled := False;

   imgPlanoDesconto.Visible := False;
   imgNumParcelas.Visible := False;
   imgDivisao.Visible := False;

   // Checa a opção de plano de desconto, se possui permissão e não usou nenhuma das opções disponíveis ainda
   if bPermissaoAplicarPlanoDesconto and
      not bUsouPlanoDesconto and
      not bUsouAlterarQuantidadeParcelas and
      not bUsouDividirTitulos then
   begin
      sbPlanoDesconto.Enabled := True;
   end;

   // Checa a opção de alterar a quantidade de parcelas, se possui permissão e não essa opção ou a de dividir títulos ainda
   if bPermissaoAlterarQuantidadeParcelas and
      not bUsouAlterarQuantidadeParcelas and
      not bUsouDividirTitulos then
   begin
      sbDividirTitulos.Enabled := True;
   end;

   // Checa a opção de dividir titulos, se possui permissão e não usou essa opção ainda
   if bPermissaoDividirTitulos and
      not bUsouDividirTitulos then
   begin
      sbDividirResp.Enabled := True;
   end;   

   // Verifica se deve apresentar a imagem indicando o uso da opção

   if bUsouPlanoDesconto then
   begin
      imgPlanoDesconto.Visible := True;
   end;

   if bUsouAlterarQuantidadeParcelas then
   begin
      imgNumParcelas.Visible := True;
   end;

   if bUsouDividirTitulos then
   begin
      imgDivisao.Visible := True;
   end;

end;

end.
