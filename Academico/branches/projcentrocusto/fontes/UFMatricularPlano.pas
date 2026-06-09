unit UFMatricularPlano;

interface

uses
   Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms, 
   Dialogs, DB, ZAbstractRODataset, UZDataset, ExtCtrls, StdCtrls, DBCtrls,
   ComCtrls, DBClient, Grids, DBGrids, Buttons, DateUtils, Spin, Math, Mask;

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
      cdsParcelasDS_TIPO_TITULO: TStringField;
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
      sbVerDescProg: TSpeedButton;
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
    procedure rbVenctoEstudanteClick(Sender: TObject);
      procedure cbUtilizarDescProgramadoClick(Sender: TObject);
      procedure cdsParcelasDT_VENCTOSetText(Sender: TField; const Text: string);
      procedure cbDiaUtilSelect(Sender: TObject);
      procedure sbVerDescProgClick(Sender: TObject);
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
      function GetCodigoRespFinan: Integer;
      function GetNomeRespFinan: string;
      procedure AplicaDescontoProg;
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

implementation

uses
   UFMatricular, uDM, General, UFMatricularDivisaoParcelas,
   UFMatricularDivisaoTitulos, UFMatricularPlanoDesconto,
   UFMatricularDescontoProg, uUsuario;

{$R *.dfm}

procedure TfMatricularPlano.AplicaDescontoProg;
const
   SFiltroParcs = 'NR_PARCELA >= %d AND NR_PARCELA <= %d';
var
   ValorDesconto, Indice, ValorTotal: Currency;
begin
   cdsParcelas.DisableControls;
   cdsParcelas.Filter := Format(SFiltroParcs, [
      fMatricularDescontoProg.qryDescontoProgNR_PARC_INICIO.AsInteger,
      fMatricularDescontoProg.qryDescontoProgNR_PARC_FIM.AsInteger]
   );
   cdsParcelas.Filtered := True;
   cdsParcelas.First;

   while not cdsParcelas.Eof do
   begin

      // Verifica se a programação de desconto está configurada para ser
      // aplicada sobre o tipo de título da parcela

      if fMatricularDescontoProg.qryTiposTituloDesc.Locate('CD_TIPO_TITULO',
         cdsParcelasCD_TIPO_TITULO.AsInteger, []) then
      begin

         cdsParcelas.Edit;

         // Verifica se o desconto é valor REAL ou um PERCENTUAL
         if not fMatricularDescontoProg.qryDescontoProgVL_PERCENTUAL.IsNull then
         begin
            // Caso PERCENTUAL então cálcula o valor do desconto que será aplicado
            ValorDesconto := (
               cdsParcelasVL_BRUTO.AsCurrency -
               cdsParcelasVL_DESC_EXTRA.AsCurrency) *
               fMatricularDescontoProg.qryDescontoProgVL_PERCENTUAL.AsCurrency / 100;
         end
         else
         begin
            // Caso REAL somente atribui armazena o valor do desconto
            ValorDesconto :=
               fMatricularDescontoProg.qryDescontoProgVL_DESCONTO.AsCurrency;
         end;

         // Verifica se o desconto é FIXO ou CONDICIONAL:

         // CONDICIONAL - coluna VALORDESCONTO na tabela de MENSALIDADES
         if fMatricularDescontoProg.rbDescontoCondicional.Checked then
         begin

            // Grava o código da ação de movimento para desconto condicional
            cdsParcelasCD_DESC_CONDICIONAL.AsInteger := fMatricularDescontoProg.qryDescontoProgCD_ACAO_MOVIMENTO.AsInteger;

            // Verifica o tipo de desconto a ser utilizado:
            // 0 - Soma
            // 1 - Proporcional
            // 2 - Sobrepor
            case fMatricularDescontoProg.qryDescontoProgCD_TIPO_DESCONTO.AsInteger of

               0:
                  // Aplica o desconto condicional programado utilizando a
                  // forma de aplicação do tipo soma, ou seja, mantém o
                  // desconto condicional pré-definido no plano de pagamento
                  // e adiciona o desconto condicional programado para esta
                  // pessoa

                     cdsParcelasVL_DESCONTO.AsCurrency :=
                        cdsParcelasVL_DESCONTO.AsCurrency + ValorDesconto;
               1:
                  // Aplica o desconto condicional de forma proporcional ao
                  // desconto condicional aplicado à parcela conforme o plano
                  // de pagamento selecionado

                  begin
                     Indice :=
                        cdsParcelasVL_DESCONTO.AsCurrency /
                        cdsParcelasVL_BRUTO.AsCurrency;

                     ValorDesconto :=
                        (cdsParcelasVL_BRUTO.AsCurrency - ValorDesconto) *
                           Indice + ValorDesconto;

                     cdsParcelasVL_DESCONTO.AsCurrency := ValorDesconto;
                  end;

               2:
                  // Aplica o desconto condicional programado na forma de
                  // sobreposição ao desconto condicional cadastrado no
                  // plano de pagamento selecionado no processo de
                  // matrícula da pessoa

                  cdsParcelasVL_DESCONTO.AsCurrency := ValorDesconto;
            end;

            // Verifica se os descontos ultrapassam o valor da parcela
            if (cdsParcelasVL_BRUTO.AsCurrency +
                cdsParcelasVL_EXTRA.AsCurrency -
                cdsParcelasVL_DESC_EXTRA.AsCurrency) < ValorDesconto then
            begin
               // Se os descontos ultrapassarem o valor da parcela ajusta
               // para que o desconto condicional somente complete o valor da parcela 
               cdsParcelasVL_DESCONTO.AsCurrency :=
                  cdsParcelasVL_BRUTO.AsCurrency +
                  cdsParcelasVL_EXTRA.AsCurrency -
                  cdsParcelasVL_DESC_EXTRA.AsCurrency
            end;
         end
         else
         // FIXO - coluna DESCONTOEXTRA na tabela de MENSALIDADES
         if fMatricularDescontoProg.rbDescontoFixo.Checked then
         begin

            // Grava o código da ação de movimento para desconto fixo
            cdsParcelasCD_ACAO_MOVIMENTO.AsInteger := fMatricularDescontoProg.qryDescontoProgCD_ACAO_MOVIMENTO.AsInteger;

            // O desconto fixo sempre é somado ao desconto que já existe
            cdsParcelasVL_DESC_EXTRA.AsCurrency :=
               cdsParcelasVL_DESC_EXTRA.AsCurrency +
               ValorDesconto;

            // Verifica o tipo de desconto a ser utilizado, esses tipos de desconto
            // influenciam somente no desconto condicional (e não no fixo):
            // 0 - Soma (Não modifica o desconto condicional)
            // 1 - Proporcional (Reajusta o valor do desconto condicional de forma proporcional)
            // 2 - Sobrepor (Zera o desconto condicional)
            case fMatricularDescontoProg.qryDescontoProgCD_TIPO_DESCONTO.AsInteger of
               0: ; // Não modifica o desconto condicional
               1:
                  // Reajusta o valor do desconto condicional (proporcionalmente)
                  begin
                     Indice :=
                        cdsParcelasVL_DESCONTO.AsCurrency /
                        cdsParcelasVL_BRUTO.AsCurrency;

                     ValorDesconto := (
                        cdsParcelasVL_BRUTO.AsCurrency -
                        cdsParcelasVL_DESC_EXTRA.AsCurrency) * Indice;

                     cdsParcelasVL_DESCONTO.AsCurrency := ValorDesconto;
                  end; 
               2:
                  // Remove o desconto condicional
                  cdsParcelasVL_DESCONTO.AsCurrency := 0;
            end;

            //////////////////////////////////////////
            // TRATAMENTO PARA QUANDO OS DESCONTOS
            // ULTRAPASSAM O VALOR DA PARCELA
            //////////////////////////////////////////

            // Cálcula o valor total da parcela
            ValorTotal :=
               cdsParcelasVL_BRUTO.AsCurrency +
               cdsParcelasVL_EXTRA.AsCurrency;

            // Verifica se o valor de desconto FIXO é maior que o valor total da parcela
            if ValorTotal < cdsParcelasVL_DESC_EXTRA.AsCurrency then
            begin
               // Se desconto FIXO é maior que valor da parcela, altera o valor de desconto FIXO para ser igual o valor da parcela
               cdsParcelasVL_DESC_EXTRA.AsCurrency :=
                  cdsParcelasVL_BRUTO.AsCurrency +
                  cdsParcelasVL_EXTRA.AsCurrency;
               // Zera o desconto CONDICIONAL   
               cdsParcelasVL_DESCONTO.AsCurrency := 0;
            end
            else

            // Verifica se o valor de desconto CONDICIONAL é maior do que ainda
            // se precisa pagar na parcela (valor da PARCELA - desconto FIXO)
            if (ValorTotal - cdsParcelasVL_DESC_EXTRA.AsCurrency) <
               cdsParcelasVL_DESCONTO.AsCurrency then
            begin
               // Se for maior então ajusta o desconto CONDICIONAL para cobrir
               // o restante que falta pagar 
               cdsParcelasVL_DESCONTO.AsCurrency :=
                  ValorTotal - cdsParcelasVL_DESC_EXTRA.AsCurrency;
            end;
         
         end;
         cdsParcelas.Post;
      end;
      cdsParcelas.Next;
   end;
   cdsParcelas.Filtered := False;
   cdsParcelas.EnableControls;
end;

procedure TfMatricularPlano.AplicaPlanoPgto;
var
   NumParcelas, Dia, Mes, Ano: Integer;
   TotalCreditos, CreditosRestantes, IndiceDesc: Double;
   Vencto: TDateTime;
begin
   cdsParcelas.EmptyDataSet;
   TotalCreditos := fMatricular.cdsDisciplinasNR_TOTAL_CREDITOS.Value;
   CreditosRestantes := TotalCreditos * qryPlanoPgtoNR_PARCELAS.AsInteger;
   NumParcelas := qryPlanoPgtoNR_PARCELAS.AsInteger;

   qryItensPlano.First;
   while not qryItensPlano.Eof do
   begin
      cdsParcelas.Insert;
      cdsParcelasPtrItemPlano.AsInteger := Integer(qryItensPlano.GetBookmark);
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


      if (qryItensPlanoNR_DIA.AsInteger = 0) and
         (qryItensPlanoNR_MES.AsInteger = 0) and
         (qryItensPlanoNR_ANO.AsInteger = 0) then
      begin
         cdsParcelasVENC_ATUAL.AsBoolean := True;         
      end;

      Dia := qryItensPlanoNR_DIA.AsInteger;
      Mes := qryItensPlanoNR_MES.AsInteger;
      Ano := qryItensPlanoNR_ANO.AsInteger;
      while (not TryEncodeDate(Ano, Mes, Dia, Vencto)) and (Dia > 1) do
         Dec(Dia);

      cdsParcelasDT_VENCTO.AsDateTime := TDate(Vencto);

      if qryItensPlanoVL_BRUTO.AsCurrency > 0 then
      begin
         IndiceDesc :=
            qryItensPlanoVL_DESCONTO.AsCurrency /
            qryItensPlanoVL_BRUTO.AsCurrency;
      end
      else
      begin
         IndiceDesc := 0;
      end;

      if (qryPlanoPgtoSN_CREDITOS.AsInteger = 1) and
         (qryItensPlanoSN_CREDITO_PARCELA.AsInteger in [1, 2]) then
      begin
         if qryItensPlanoNR_CREDITOS_MINIMOS.AsInteger = 0 then
         begin
            cdsParcelasNR_CREDITOS.AsFloat := CreditosRestantes / NumParcelas;
            cdsParcelasVL_BRUTO.AsCurrency :=
               qryItensPlanoVL_BRUTO.AsCurrency /
               qryPlanoPgtoNR_CREDITOS_BASE.AsFloat *
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
                     qryItensPlanoVL_BRUTO.AsCurrency /
                     qryPlanoPgtoNR_CREDITOS_BASE.AsFloat *
                     qryItensPlanoNR_CREDITOS_MINIMOS.AsFloat;
               end
               else
               begin
                  cdsParcelasNR_CREDITOS.AsFloat := TotalCreditos;
                  cdsParcelasVL_BRUTO.AsCurrency :=
                     qryItensPlanoVL_BRUTO.AsCurrency /
                     qryPlanoPgtoNR_CREDITOS_BASE.AsInteger *
                     TotalCreditos;
               end;
               CreditosRestantes := CreditosRestantes - TotalCreditos;
            end
            else
            begin
               cdsParcelasNR_CREDITOS.AsFloat :=
                     qryItensPlanoNR_CREDITOS_MINIMOS.AsFloat;
               cdsParcelasVL_BRUTO.AsCurrency :=
                  qryItensPlanoVL_BRUTO.AsCurrency /
                  qryPlanoPgtoNR_CREDITOS_BASE.AsFloat *
                  qryItensPlanoNR_CREDITOS_MINIMOS.AsFloat;
               CreditosRestantes :=
                  CreditosRestantes - qryItensPlanoNR_CREDITOS_MINIMOS.AsFloat;
            end;
         end;

         cdsParcelasVL_DESCONTO.AsCurrency :=
            cdsParcelasVL_BRUTO.AsCurrency * IndiceDesc;
         cdsParcelasVL_DESC_EXTRA.AsCurrency :=
            qryItensPlanoVL_DESCONTO_EXTRA.AsCurrency /
            qryItensPlanoVL_BRUTO.AsCurrency *
            cdsParcelasVL_BRUTO.AsCurrency;
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
      end;

      cdsParcelas.Post;
      qryItensPlano.Next;
   end;
   sbDividirTitulos.Enabled := qryItensPlano.Locate('SN_DIVISIVEL', 1, []);

   if not fMatricularDescontoProg.qryDescontoProg.IsEmpty and cbUtilizarDescProgramado.Checked then
   begin
      AplicaDescontoProg;
   end;
end;

procedure TfMatricularPlano.CalculaVencimentos;
var
   Vencto, Temp, Hoje: TDateTime;
   I, J, NumParcela: Integer;
   Dia, Mes, Ano: Word;
   PulaSabado, PulaDomingo, PulaFeriado, DiaValido: Boolean;
   ParcelasVencidas: string;
   iContadorDiasP0: Integer;
   venctoOriginal: TDateTime;
   parcelaDataAtual: Boolean;

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

begin
   Hoje := DM.DataAtual;
   ParcelasVencidas := DM.variavel_parametro('financeiro_parcelas_anteriores');
   ParcelasVencidas := AnsiUpperCase(ParcelasVencidas);
   PulaSabado := qryPlanoPgtoSN_PULAR_SABADOS.AsInteger = 1;
   PulaDomingo := qryPlanoPgtoSN_PULAR_DOMINGOS.AsInteger = 1;
   PulaFeriado := qryPlanoPgtoSN_PULAR_FERIADOS.AsInteger = 1;

   cdsParcelas.DisableControls;
   cdsParcelas.Filtered := False;
   cdsParcelas.First;

   iContadorDiasP0 := 1;

   if rbVenctoPlano.Checked then
   begin
      while not cdsParcelas.Eof do
      begin
      
         if cdsParcelasSN_DIVIDIDO.AsBoolean then
         begin
            cdsParcelas.Next;
            Continue;
         end;
         
         if qryItensPlano.BookmarkValid(Pointer(cdsParcelasPtrItemPlano.AsInteger)) then
         begin
            qryItensPlano.GotoBookmark(Pointer(cdsParcelasPtrItemPlano.AsInteger));
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
         end
         else
         begin
           Vencto := IncMonth(Vencto, j);
         end;

         if (parcelaDataAtual) and (qryItensPlanoNR_PARCELA.AsInteger <> 0) then
         begin
            cdsParcelas.Edit;
            cdsParcelasDT_VENCTO.AsDateTime := TDate(Hoje);
            cdsParcelas.Post;
         end
         else if TDate(Vencto) >= TDate(Hoje) then
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
         cdsParcelas.Next;
         parcelaDataAtual := False;
      end;
   end
   else if rbVenctoDiaUtil.Checked then
   begin
      Temp := dtpVenctoDiaUtil.Date;
      Temp := EncodeDate(YearOf(Temp), MonthOf(Temp), 1);

      while not cdsParcelas.Eof do
      begin

         if cdsParcelasSN_DIVIDIDO.AsBoolean then
         begin
            cdsParcelas.Next;
            Continue;
         end;

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
         Temp := Vencto;
         venctoOriginal := temp;

         while not cdsParcelas.Eof do
         begin

            if cdsParcelasSN_DIVIDIDO.AsBoolean then
            begin
               cdsParcelas.Next;
               Continue;
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

            Inc(J);
            if cdsParcelasNR_PARCELA.AsInteger <> NumParcela then
            begin
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

         while not cdsParcelas.Eof do
         begin

            if cdsParcelasSN_DIVIDIDO.AsBoolean then
            begin
               cdsParcelas.Next;
               Continue;
            end;

            qryItensPlano.GotoBookmark(Pointer(cdsParcelasPtrItemPlano.AsInteger));

            Dia := Min(I, DaysInAMonth(Ano, Mes));
            Mes := qryItensPlanoNR_MES.AsInteger;
            Ano := qryItensPlanoNR_ANO.AsInteger;
            
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
begin
   with fMatricularDivisaoParcelas do
   begin
      cdsParcelasDivididas.DisableControls;
      cdsParcelasDivididas.EmptyDataSet;

      cdsParcelasDivisao.DisableControls;
      cdsParcelasDivisao.EmptyDataSet;

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
               cdsParcelasDivisaoDT_VENCTO.AsDateTime :=
                  cdsParcelasDT_VENCTO.AsDateTime;
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
               cdsParcelasDivisaoDT_VENCTO.AsDateTime :=
                  cdsParcelasDT_VENCTO.AsDateTime;
            end;
            cdsParcelasDivisao.Post;
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
      cdsParcelasOrigem.DisableControls;
      cdsParcelasOrigem.EmptyDataSet;

      cdsParcelas.DisableControls;
      cdsParcelas.Filter := 'SN_GERAR';
      cdsParcelas.Filtered := True;
      cdsParcelas.First;

      while not cdsParcelas.Eof do
      begin
         cdsParcelasOrigem.Insert;
         cdsParcelasOrigemCD_TIPO_TITULO.AsInteger :=
            cdsParcelasCD_TIPO_TITULO.AsInteger;
         cdsParcelasOrigemDS_TIPO_TITULO.AsString :=
            cdsParcelasDS_TIPO_TITULO.AsString;
         cdsParcelasOrigemNR_PARCELA.AsInteger :=
            cdsParcelasNR_PARCELA.AsInteger;
         cdsParcelasOrigemDT_VENCTO.AsDateTime :=
            cdsParcelasDT_VENCTO.AsDateTime;
         cdsParcelasOrigemVL_BRUTO.AsCurrency :=
            cdsParcelasVL_BRUTO.AsCurrency;
         cdsParcelasOrigemVL_DESCONTO.AsCurrency :=
            cdsParcelasVL_DESCONTO.AsCurrency;
         cdsParcelasOrigemVL_BOLSA.AsCurrency :=
            cdsParcelasVL_DESC_EXTRA.AsCurrency;
         cdsParcelasOrigemVL_EXTRA.AsCurrency :=
            cdsParcelasVL_EXTRA.AsCurrency;
         cdsParcelasOrigemVL_DESC_EXTRA.AsCurrency :=
            cdsParcelasVL_DESC_EXTRA.AsCurrency;
         cdsParcelasOrigemCD_RESPONSAVEL.AsInteger :=
            cdsParcelasCD_RESPONSAVEL.AsInteger;
         cdsParcelasOrigemNM_RESPONSAVEL.AsString :=
            cdsParcelasNM_RESPONSAVEL.AsString;
         cdsParcelasOrigemSN_DIVISIVEL.AsBoolean :=
            cdsParcelasSN_DIVISIVEL.AsBoolean;
         cdsParcelasOrigemPtrItemPlano.AsInteger :=
            cdsParcelasPtrItemPlano.AsInteger;
         cdsParcelasOrigemSN_SELECIONADA.AsBoolean := True;
         cdsParcelasOrigemSN_SIMULADO.AsBoolean := False;
         cdsParcelasOrigemCD_CONTA.AsInteger := cdsParcelasCD_CONTA.AsInteger;
         cdsParcelas.Next;
      end;

      if cdsParcelasOrigem.State = dsInsert then
      begin
         cdsParcelasOrigem.Post;
      end;
      cdsParcelas.Filtered := False;
      cdsParcelas.EnableControls;
      cdsParcelasOrigem.EnableControls;
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

         if qryItensPlano.BookmarkValid(
               Pointer(cdsParcelasPtrItemPlano.AsInteger)
            ) then
         begin
            qryItensPlano.GotoBookmark(
               Pointer(cdsParcelasPtrItemPlano.AsInteger)
            );
            cdsParcelasSN_DIVISIVEL.AsBoolean :=
               qryItensPlanoSN_DIVISIVEL.AsInteger = 1;
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
      sbDividirTitulos.Enabled := False;
      sbPlanoDesconto.Enabled := False;
      sbDividirResp.Enabled := False;
      imgDivisao.Visible := True;
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
         cdsParcelasOrigemCD_TIPO_TITULO.AsInteger :=
            cdsParcelasCD_TIPO_TITULO.AsInteger;
         cdsParcelasOrigemDS_TIPO_TITULO.AsString :=
            cdsParcelasDS_TIPO_TITULO.AsString;
         cdsParcelasOrigemNR_PARCELA.AsInteger :=
            cdsParcelasNR_PARCELA.AsInteger;
         cdsParcelasOrigemDT_VENCTO.AsDateTime :=
            cdsParcelasDT_VENCTO.AsDateTime;
         cdsParcelasOrigemVL_BRUTO.AsCurrency := cdsParcelasVL_BRUTO.AsCurrency;
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
   sbPlanoDesconto.Enabled := not lblDescontoProg.Visible;
   sbDividirTitulos.Enabled := True;
   sbDividirResp.Enabled := True;
   imgPlanoDesconto.Visible := False;
   imgNumParcelas.Visible := False;
   imgDivisao.Visible := False;
   AplicaPlanoPgto;
   CalculaVencimentos;
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
   if not cdsParcelasSN_GERAR.AsBoolean then
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
   I: Integer;
   PulaSabado, PulaDomingo, PulaFeriado: Boolean;
begin
   S := qryPlanoPgtoDS_DIAS_VENCTO.AsString;

   cbDiaVencto.Items.BeginUpdate;
   cbDiaVencto.Items.Clear;
   for I := 1 to Length(S) do
   begin
      if S[I] = '1' then
      begin
         cbDiaVencto.Items.Add(Format('%d', [I]));
      end;
   end;
   cbDiaVencto.Items.EndUpdate;

   dtpVenctoDiaUtil.Date := qryPlanoPgtoDT_APARTIR.AsDateTime;
   dtpVenctoSempre.Date := qryPlanoPgtoDT_APARTIR.AsDateTime;

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
   sbPlanoDesconto.Enabled := not lblDescontoProg.Visible;
   sbDividirTitulos.Enabled := qryItensPlano.Locate('SN_DIVISIVEL', 1, []);
   sbDividirResp.Enabled := True;
   imgPlanoDesconto.Visible := False;
   imgNumParcelas.Visible := False;
   imgDivisao.Visible := False;
   
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

   dblcPlanoPgto.KeyValue := Null;
   qryPlanoPgto.DisableControls;
   cdsParcelas.DisableControls;
   cdsParcelas.EmptyDataSet;
   cdsParcelas.Close;
   qryResponsavel.Close;
   qryItensPlano.Close;
   qryPlanoPgto.Close;
   cdsParcelas.EnableControls;
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

      if qryPlanoPgtoSN_CREDITOS.AsInteger = 1 then
      begin
         fMatricular.cdsMensalidadesVL_CREDITO.AsFloat :=
            qryPlanoPgtoVL_COBRADO.AsCurrency / qryPlanoPgtoNR_CREDITOS_BASE.AsInteger;
      end else begin
         fMatricular.cdsMensalidadesVL_CREDITO.AsFloat := 0;
      end;

      fMatricular.cdsMensalidadesSN_PERDOAR.AsBoolean :=
         cdsParcelasSN_PERDOAR.AsBoolean;
      fMatricular.cdsMensalidadesSN_RECIBO_IMP.AsBoolean :=
         cdsParcelasSN_RECIBO_IMP.AsBoolean;
      fMatricular.cdsMensalidadesCD_CONTA.AsInteger :=
         cdsParcelasCD_CONTA.AsInteger;

      cdsParcelas.Next;
   end;

   if fMatricular.cdsMensalidades.State = dsInsert then
   begin
      fMatricular.cdsMensalidades.Post;
   end;

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

procedure TfMatricularPlano.Inicializa;
begin
   if fMatricularDescontoProg = nil then
   begin
      Application.CreateForm(TfMatricularDescontoProg, fMatricularDescontoProg);
   end;

   // Dia de vencimento definido para o estudante
   qryDtVencPessoa.Close;
   qryDtVencPessoa.ParamByName('CD_PESSOA').AsInteger := fMatricular.Pessoa;
   qryDtVencPessoa.Open;

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

   with fMatricularDescontoProg do
   begin
      qryDescontoProg.Close;
      qryDescontoProg.ParamByName('CD_PESSOA').AsInteger := fMatricular.Pessoa;
      qryDescontoProg.ParamByName('CD_DEPTO').AsInteger := fMatricular.qryTurmaCD_DEPTO.AsInteger;
      qryDescontoProg.ParamByName('CD_CURSO').AsString := fMatricular.qryTurmaCD_CURSO.AsString;
      qryDescontoProg.Open;
      qryTiposTituloDesc.Open;

      fMatricular.qryMatriculaCD_PLANO_DESC.AsInteger :=
         qryDescontoProgCD_DESCONTO.AsInteger;

      if not qryDescontoProg.IsEmpty then
      begin
         sbPlanoDesconto.Visible := False;
         lblDescontoProg.Visible := True;
         sbVerDescProg.Visible := True;
         rbDescontoCondicional.Enabled := True;
         rbDescontoFixo.Enabled := True;
         // Verifica se no plano de bolsa o desconto é condicional ou extra (para marcar a opção padrão)
         if fMatricularDescontoProg.qryDescontoProgSN_CONDICIONAL.AsInteger > 0 then
         begin
            fMatricularDescontoProg.rbDescontoCondicional.Checked := True;
            fMatricularDescontoProg.rbDescontoFixo.Checked := False;
         end else begin
            fMatricularDescontoProg.rbDescontoCondicional.Checked := False;
            fMatricularDescontoProg.rbDescontoFixo.Checked := True;
         end;

         fMatricularDescontoProg.rbDescontoCondicional.Enabled := (DM.UsuarioLogado.TemPermissao( 0, 'Academico.Desconto.Troca', npEspecial, false ));
         fMatricularDescontoProg.rbDescontoFixo.Enabled := (DM.UsuarioLogado.TemPermissao( 0, 'Academico.Desconto.Troca', npEspecial, false ));

         cbUtilizarDescProgramado.Visible := True;
         ShowModal;
      end;
   end;

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

   sbPlanoDesconto.Enabled := DM.UsuarioLogado.TemPermissao(2020, npAcesso, False);
   sbDividirTitulos.Enabled := sbDividirTitulos.Enabled and
      DM.UsuarioLogado.TemPermissao(DM.iCdPessoaLogado,
      'UMFinanceiro.Matricular.PlanoPgto.AlterarNumeroParcelas', npAcesso, False);
   sbDividirResp.Enabled := DM.UsuarioLogado.TemPermissao(DM.iCdPessoaLogado,
      'UMFinanceiro.Mensalidades.DividirTitulos', npAcesso, False);
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

      if not qryDivisaoProgramada.IsEmpty then
      begin
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
      if ShowModal = mrOk then
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

               if qryItensPlano.Locate('NR_PARCELA',
                  cdsParcelasNR_PARCELA.AsInteger, []) then
               begin
                  cdsParcelasPtrItemPlano.AsInteger :=
                     Integer(qryItensPlano.GetBookmark);
               end
               else
               begin
                  cdsParcelasPtrItemPlano.AsInteger := Integer(Pointer(nil));
               end;

               cdsParcelasSN_RECIBO_IMP.AsBoolean := False;
               cdsParcelasSN_GERAR.AsBoolean := True;
               cdsParcelasSN_PERDOAR.AsBoolean := False;

               cdsParcelasDivididas.Next;
            end;
            cdsParcelas.Post;
            cdsParcelasDivisao.Next;
         end;
         cdsParcelasDivisao.EnableControls;
         cdsParcelasDivididas.EnableControls;
         cdsParcelas.Filtered := False;
         cdsParcelas.EnableControls;
         sbCalcVencto.Enabled := True;
         sbCalcVencto.Click;
         sbPlanoDesconto.Enabled := False;
         sbDividirTitulos.Enabled := False;
         imgNumParcelas.Visible := True;
      end;
   end;
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
         cdsParcelasOrigem.DisableControls;
         cdsParcelasOrigem.First;

         cdsParcelas.DisableControls;
         cdsParcelas.Filter := 'SN_GERAR';
         cdsParcelas.Filtered := True;
         while not cdsParcelas.IsEmpty do cdsParcelas.Delete;

         while not cdsParcelasOrigem.Eof do
         begin
            cdsParcelas.Insert;
            cdsParcelasCD_TIPO_TITULO.AsInteger :=
               cdsParcelasOrigemCD_TIPO_TITULO.AsInteger;
            cdsParcelasDS_TIPO_TITULO.AsString :=
               cdsParcelasOrigemDS_TIPO_TITULO.AsString;
            cdsParcelasNR_PARCELA.AsInteger :=
               cdsParcelasOrigemNR_PARCELA.AsInteger;
            cdsParcelasDT_VENCTO.AsDateTime :=
               cdsParcelasOrigemDT_VENCTO.AsDateTime;
            cdsParcelasVL_BRUTO.AsCurrency :=
               cdsParcelasOrigemVL_BRUTO.AsCurrency;
            cdsParcelasVL_DESCONTO.AsCurrency :=
               cdsParcelasOrigemVL_DESCONTO.AsCurrency;
            cdsParcelasVL_EXTRA.AsCurrency :=
               cdsParcelasOrigemVL_EXTRA.AsCurrency;
            cdsParcelasCD_RESPONSAVEL.AsInteger :=
               cdsParcelasOrigemCD_RESPONSAVEL.AsInteger;
            cdsParcelasNM_RESPONSAVEL.AsString :=
               cdsParcelasOrigemNM_RESPONSAVEL.AsString;
            cdsParcelasVL_DESC_EXTRA.AsCurrency :=
               cdsParcelasOrigemVL_BOLSA.AsCurrency;
            cdsParcelasPtrItemPlano.AsInteger :=
               cdsParcelasOrigemPtrItemPlano.AsInteger;
            cdsParcelasSN_DIVISIVEL.AsBoolean :=
               cdsParcelasOrigemSN_DIVISIVEL.AsBoolean;
            cdsParcelasSN_RECIBO_IMP.AsBoolean := False;
            cdsParcelasSN_GERAR.AsBoolean := True;
            cdsParcelasSN_PERDOAR.AsBoolean := False;
            cdsParcelasCD_CONTA.AsInteger :=
               cdsParcelasOrigemCD_CONTA.AsInteger;
            cdsParcelasCD_ACAO_MOVIMENTO.AsInteger :=
               cdsParcelasOrigemCD_ACAO_MOVIMENTO.AsInteger;
            cdsParcelasCD_DESC_CONDICIONAL.AsInteger :=
               cdsParcelasOrigemCD_DESC_CONDICIONAL.AsInteger;
            cdsParcelasOrigem.Next;
         end;

         if cdsParcelas.State = dsInsert then
         begin
            cdsParcelas.Post;
         end;
         cdsParcelas.Filtered := False;
         cdsParcelas.EnableControls;
         cdsParcelasOrigem.EnableControls;

         sbPlanoDesconto.Enabled := False;
         imgPlanoDesconto.Visible := True;
      end;
   end;
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
   sbPlanoDesconto.Enabled := not lblDescontoProg.Visible;
   sbDividirTitulos.Enabled := True;
   sbDividirResp.Enabled := True;
   imgPlanoDesconto.Visible := False;
   imgNumParcelas.Visible := False;
   imgDivisao.Visible := False;
   AplicaPlanoPgto;
   CalculaVencimentos;
end;

procedure TfMatricularPlano.sbVerDescProgClick(Sender: TObject);
begin
   fMatricularDescontoProg.rbDescontoCondicional.Enabled := False;
   fMatricularDescontoProg.rbDescontoFixo.Enabled := False;
   fMatricularDescontoProg.ShowModal;
end;

end.
