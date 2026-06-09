unit uMensalidadesDivisao;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, StdCtrls, Grids, DBGrids, DB, ZConnection, Buttons, General, ZAbstractRODataset, ZAbstractDataset, ZDataset, UZDataset, uClassMovimento,
  Mask, Spin;

type
  TfrmMensalidadesDivisao = class(TForm)
    pnTitulo: TPanel;
    pnCompromisso: TPanel;
    Label3: TLabel;
    lbCodigo: TLabel;
    Bevel1: TBevel;
    Bevel4: TBevel;
    Bevel5: TBevel;
    tblMensalidades: TUMZQuery;
    tblMensalidadesCodigoAluno: TIntegerField;
    tblMensalidadesParcela: TSmallintField;
    tblMensalidadesDataVencimento: TDateTimeField;
    tblMensalidadesTurma: TStringField;
    tblMensalidadesDataEmissao: TDateTimeField;
    tblMensalidadesNossoNumero: TStringField;
    tblMensalidadesValorBruto: TFloatField;
    tblMensalidadesDescontoExtra: TFloatField;
    tblMensalidadesValorExtra: TFloatField;
    tblMensalidadesValorTotal: TFloatField;
    tblMensalidadesValorJuros: TFloatField;
    tblMensalidadesValorPago: TFloatField;
    tblMensalidadesDataPagamento: TDateTimeField;
    tblMensalidadesSituacao: TSmallintField;
    tblMensalidadesUsuario: TStringField;
    tblMensalidadesValorDesconto: TFloatField;
    tblMensalidadesAnoSemestre: TSmallintField;
    tblMensalidadesDataBaseCorrecao: TDateTimeField;
    tblMensalidadesIndiceCorrecao: TFloatField;
    tblMensalidadesDescricaoSituacao: TStringField;
    tblMensalidadesValorTotalCalc: TFloatField;
    tblMensalidadesBloquetoImpresso: TStringField;
    tblMensalidadesNomeAluno: TStringField;
    tblMensalidadesDepto: TSmallintField;
    tblMensalidadesValorJurosCalc: TFloatField;
    tblMensalidadesBloqueto: TStringField;
    tblMensalidadesocorrencia_remessa: TSmallintField;
    tblMensalidadesocorrencia_retorno: TSmallintField;
    tblMensalidadessn_credito_parcela: TStringField;
    tblMensalidadesnr_creditos: TFloatField;
    tblMensalidadescd_mensalidade: TIntegerField;
    tblMensalidadestipoparcela: TSmallintField;
    tblMensalidadescd_mensalidade_origem: TIntegerField;
    tblMensalidadescurso: TStringField;
    tblMensalidadescd_coligada: TSmallintField;
    tblMensalidadesNomeResponsavel: TStringField;
    tblMensalidadesds_tipo_titulo: TStringField;
    tblMensalidadesdt_competencia: TDateTimeField;
    tblMensalidadesds_historico: TStringField;
    tblMensalidadesds_conta: TStringField;
    tblMensalidadesds_centro: TStringField;
    tblMensalidadescd_caixa: TIntegerField;
    tblMensalidadescd_bolsa: TIntegerField;
    tblMensalidadesds_bolsa: TStringField;
    tblMensalidadesds_sigla: TStringField;
    tblMensalidadesMoedaPgto: TStringField;
    tblMensalidadesvl_pago_moeda: TFloatField;
    tblMensalidadescd_tipo_titulo: TSmallintField;
    tblMensalidadesPercDescExtra: TCurrencyField;
    tblMensalidadesPercDescCond: TCurrencyField;
    tblMensalidadescd_resp_finan: TStringField;
    tblMensalidadesdt_credito: TDateTimeField;
    tblMensalidadescd_recibo: TIntegerField;
    tblMensalidadessn_protesto: TSmallintField;
    tblMensalidadesds_acao: TStringField;
    tblMensalidadesds_obs_desc: TMemoField;
    tblMensalidadesds_obs: TStringField;
    tblMensalidadessn_liberar_juros: TIntegerField;
    tblMensalidadessn_liberar_descontos: TIntegerField;
    dtcMensalidades: TDataSource;
    grd: TDBGrid;
    Panel1: TPanel;
    Label1: TLabel;
    Panel2: TPanel;
    Label2: TLabel;
    Label4: TLabel;
    edPercentual: TEdit;
    edResponsavel: TEdit;
    btnCodigoAluno: TSpeedButton;
    btnConfirmar: TBitBtn;
    BitBtn2: TBitBtn;
    edCodigoResp: TEdit;
    sbMarcarNovas: TSpeedButton;
    sbDesmarcarNovas: TSpeedButton;
    tblMensalidadesvl_credito: TFloatField;
    tblMensalidadescd_centro_custo: TLargeintField;
    tblMensalidadescd_plano_conta: TLargeintField;
    tblMensalidadescd_resp: TIntegerField;
    tblMensalidadescd_desc_condicional: TLargeintField;
    tblMensalidadescd_moeda: TLargeintField;
    tblMensalidadescd_moeda_pgto: TLargeintField;
    tblMensalidadescd_item_plano: TLargeintField;
    tblMensalidadesnr_nf: TLargeintField;
    cbManter: TCheckBox;
    rbAplicaBruto: TRadioButton;
    rbAplicaLiquido: TRadioButton;
    qryAcoesMovimentoFixo: TUMZQuery;
    qryAcoesMovimentoCondicional: TUMZQuery;
    tblMensalidadesValorBrutoCalc: TCurrencyField;
    tblMensalidadesValorLiquidoCalc: TCurrencyField;
    qryDescontosPlano: TUMZQuery;
    chkDescontoCond: TCheckBox;
    tblMensalidadescd_resp_nfse: TIntegerField;
    chkRenumerar: TCheckBox;
    speParcela: TSpinEdit;
    procedure chkRenumerarClick(Sender: TObject);
    procedure rbAplicaLiquidoClick(Sender: TObject);
    procedure rbAplicaBrutoClick(Sender: TObject);
    procedure tblMensalidadesCalcFields(DataSet: TDataSet);
    procedure cbManterClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure edResponsavelKeyPress(Sender: TObject; var Key: Char);
    procedure btnConfirmarClick(Sender: TObject);
    procedure BitBtn2Click(Sender: TObject);
    procedure sbDesmarcarNovasClick(Sender: TObject);
    procedure sbMarcarNovasClick(Sender: TObject);
    procedure edPercentualKeyPress(Sender: TObject; var Key: Char);
    procedure btnCodigoAlunoClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
  strict private
      SQL_PADRAO_TBL_MENSALIDADES : String;
  private
    procedure RemoverParcelaOriginal(codigoMensalidade: Integer);
    procedure InserirParcelaAluno(indicePercentual: Currency);
    procedure DividirAcoesMovimentoFixo(codigoMensalidade, codigoMensalidadeDividida: Integer; indicePercentual, descontoFixo: Currency; bManterDescontoAluno, bParcelaAluno: Boolean);
    procedure DividirAcoesMovimentoCondicional(codigoMensalidade, codigoMensalidadeDividida: Integer; indicePercentual, descontoCondicional: Currency; bManterDescontoAluno, bParcelaAluno: Boolean);
    procedure InserirParcelaResponsavel(indicePercentual: Currency);
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmMensalidadesDivisao: TfrmMensalidadesDivisao;

implementation

uses uMensalidades, uFSelecionarPessoa, uDM;

{$R *.dfm}

procedure TfrmMensalidadesDivisao.BitBtn2Click(Sender: TObject);
begin
  tblMensalidades.Close();
  Close();
end;

procedure TfrmMensalidadesDivisao.btnCodigoAlunoClick(Sender: TObject);
var
   resultado_filtro : TResultadoFiltroPessoa;
begin
   { Pesquisar Aluno }
   resultado_filtro := TfrmSelecionarPessoa.Filtrar([]);

   if resultado_filtro.filtrado then
   Begin
      if resultado_filtro.cd_pessoa = tblMensalidadesCodigoAluno.AsInteger then
      begin
         Mensagem('Você deve selecionar um responsável diferente para efetuar a divisão dos títulos.', 'UNIMESTRE', MB_OK + MB_ICONWARNING);

         resultado_filtro := TfrmSelecionarPessoa.Filtrar([]);

      end else begin
         edResponsavel.Text := resultado_filtro.nm_pessoa;
         edCodigoResp.Text := IntToStr(resultado_filtro.cd_pessoa);
      end;
   end
   else Exit;
end;

procedure TfrmMensalidadesDivisao.DividirAcoesMovimentoFixo(codigoMensalidade, codigoMensalidadeDividida: Integer; indicePercentual, descontoFixo: Currency; bManterDescontoAluno, bParcelaAluno: Boolean);
var
   movimento: TMovimento;
   somaDescontos, valorDesconto: Currency;
   bDescontoPlano: Boolean;   
begin

   qryAcoesMovimentoFixo.Close;
   qryAcoesMovimentoFixo.ParamByName('cd_mensalidade_origem').AsInteger := codigoMensalidade;
   qryAcoesMovimentoFixo.Open;

   somaDescontos := 0;

   while not qryAcoesMovimentoFixo.Eof do
   begin

      // Verifica se o desconto fixo é do plano de pagamento (esse desconto sempre divide)
      bDescontoPlano := (qryAcoesMovimentoFixo.FieldByName('sn_desc_plano_pagamento').AsInteger = 1);

      // Se não for um desconto do plano de pagamento e
      // Deve-se manter o desconto na parcela do aluno
      // E está dividindo uma parcela do responsável (não aluno)
      if (not bDescontoPlano) and bManterDescontoAluno and (not bParcelaAluno) then
      begin
         // Não insere o desconto para o responsável nesse caso
         qryAcoesMovimentoFixo.Next;
         // Avança para o próximo desconto
         continue;
      end;

      Movimento := TMovimento.create;

      try
         Movimento.Observacao := qryAcoesMovimentoFixo.FieldByName('ds_observacao').AsString;
         Movimento.TipoDeAcao := BaixarporDesconto;
         Movimento.CodigoTitulo := codigoMensalidadeDividida;
         Movimento.CodAcao := qryAcoesMovimentoFixo.FieldByName('cd_acao').AsInteger;

         // Cálcula o valor do desconto da ação de movimento
         valorDesconto := RoundFloat(qryAcoesMovimentoFixo.FieldByName('vl_saida').AsCurrency*indicePercentual, 2);

         // Se não for um desconto do plano de pagamento e
         // Deve-se manter o desconto na parcela do aluno
         // E está dividindo uma parcela do aluno
         if (not bDescontoPlano) and bManterDescontoAluno and bParcelaAluno then
         begin
            // Mantém o desconto integral para o aluno (sem dividir ele)
            valorDesconto := qryAcoesMovimentoFixo.FieldByName('vl_saida').AsCurrency;
         end;

         // Se for o último desconto que estiver sendo varrido cálcula o valor da ação pela diferença
         if qryAcoesMovimentoFixo.RecNo = qryAcoesMovimentoFixo.RecordCount then
         begin
            valorDesconto := descontoFixo - somaDescontos;
         end;

         somaDescontos := somaDescontos + valorDesconto;

         Movimento.ValorMovimento := valorDesconto;
         Movimento.DescontoPlano := qryAcoesMovimentoFixo.FieldByName('sn_desc_plano_pagamento').AsInteger;         
         Movimento.Coligada := qryAcoesMovimentoFixo.FieldByName('cd_coligada').AsInteger;
         Movimento.RegistrarMovimentacaoCR(0);
      finally
         Movimento.Free;
      end;

      qryAcoesMovimentoFixo.Next;
   end;
      
end;

procedure TfrmMensalidadesDivisao.DividirAcoesMovimentoCondicional(codigoMensalidade, codigoMensalidadeDividida: Integer; indicePercentual, descontoCondicional: Currency; bManterDescontoAluno, bParcelaAluno: Boolean);
var
   movimento: TMovimento;
   somaDescontos, valorDesconto: Currency;
   bDescontoPlano: Boolean;   
begin

   qryAcoesMovimentoCondicional.Close;
   qryAcoesMovimentoCondicional.ParamByName('cd_mensalidade_origem').AsInteger := codigoMensalidade;
   qryAcoesMovimentoCondicional.Open;

   somaDescontos := 0;

   while not qryAcoesMovimentoCondicional.Eof do
   begin

      // Verifica se o desconto condicional é do plano de pagamento (esse desconto sempre divide)
      bDescontoPlano := (qryAcoesMovimentoCondicional.FieldByName('sn_desc_plano_pagamento').AsInteger = 1);

      // Se não for um desconto do plano de pagamento e
      // Deve-se manter o desconto na parcela do aluno
      // E está dividindo uma parcela do responsável (não aluno)
      if (not bDescontoPlano) and bManterDescontoAluno and (not bParcelaAluno) then
      begin
         // Não insere o desconto para o responsável nesse caso
         qryAcoesMovimentoCondicional.Next;
         // Avança para o próximo desconto
         continue;
      end;

      Movimento := TMovimento.create;

      try
         Movimento.Observacao := qryAcoesMovimentoCondicional.FieldByName('ds_observacao').AsString;
         Movimento.TipoDeAcao := BaixarporDesconto;
         Movimento.CodigoTitulo := codigoMensalidadeDividida;
         Movimento.CodAcao := qryAcoesMovimentoCondicional.FieldByName('cd_acao').AsInteger;

         // Cálcula o valor do desconto da ação de movimento
         valorDesconto := RoundFloat(qryAcoesMovimentoCondicional.FieldByName('vl_desconto').AsCurrency*indicePercentual, 2);

         // Se não for um desconto do plano de pagamento e
         // Deve-se manter o desconto na parcela do aluno
         // E está dividindo uma parcela do aluno
         if (not bDescontoPlano) and bManterDescontoAluno and bParcelaAluno then
         begin
            // Mantém o desconto integral para o aluno (sem dividir ele)
            valorDesconto := qryAcoesMovimentoCondicional.FieldByName('vl_desconto').AsCurrency;
         end;

         // Se for o último desconto que estiver sendo varrido cálcula o valor da ação pela diferença
         if qryAcoesMovimentoCondicional.RecNo = qryAcoesMovimentoCondicional.RecordCount then
         begin
            valorDesconto := descontoCondicional - somaDescontos;
         end;

         somaDescontos := somaDescontos + valorDesconto;

         Movimento.ValorDesconto := valorDesconto;
         Movimento.DescontoPlano := qryAcoesMovimentoCondicional.FieldByName('sn_desc_plano_pagamento').AsInteger;         
         Movimento.Coligada := qryAcoesMovimentoCondicional.FieldByName('cd_coligada').AsInteger;
         Movimento.DescCondicional := 1;
         Movimento.RegistrarMovimentacaoCR(0);
      finally
         Movimento.Free;
      end;

      qryAcoesMovimentoCondicional.Next;
   end;
      
end;

procedure TfrmMensalidadesDivisao.InserirParcelaResponsavel(indicePercentual: Currency);
var
   percentualDivisao, valorBruto,
   descontoCondicional, descontoFixo,
   valorCreditos, valorExtra, valorJuros: Currency;
   iCodigoResponsavel, iNovaMensalidade: Integer;
   bManterDescontoAluno, bParcelaAluno: Boolean;
   N: Integer;
begin

   // Define o percentual de divisão do responsável
   percentualDivisao := indicePercentual*100;

   // Define o novo responsável
   iCodigoResponsavel := StrToInt(edCodigoResp.Text);

   {
      Verifica se NÃO deve manter o desconto fixo na parcela do responsavel
      Nesse caso divide o desconto fixo entre o aluno e responsável
   }
   if not cbManter.Checked then
   begin
      // Divide o valor do desconto condicional
      descontoCondicional := RoundFloat(tblMensalidadesValorDesconto.AsCurrency * indicePercentual, 2);
      // Divide o valor do desconto fixo
      descontoFixo := RoundFloat(tblMensalidadesDescontoExtra.AsCurrency * indicePercentual, 2);
      // Divide o valor do desconto bruto
      valorBruto := RoundFloat(tblMensalidadesValorBruto.AsCurrency * indicePercentual, 2);
   end;

   {
      Verifica se deve manter o desconto fixo na parcela do aluno
      Nesse caso existem duas opções de cálculo, sendo:
      - aplicação do desconto fixo sobre o valor bruto
      - aplicação do desconto fixo sobre o valor liquido
   }
   if cbManter.Checked then
   begin

      {
         Aplicando o fixo sobre o valor liquido
         Cálculo novo bruto responsavel = Bruto * indice
      }
      if rbAplicaBruto.Checked then
      begin
         valorBruto := RoundFloat(tblMensalidadesValorBruto.AsCurrency*indicePercentual, 2);
      end;

      {
         Aplicando o fixo sobre o valor liquido
         Cálculo novo bruto responsavel = ((Bruto - Fixo) * indice)
      }
      if rbAplicaLiquido.Checked then
      begin

         if not chkDescontoCond.Checked then
         begin
            valorBruto :=
               RoundFloat(((
                  tblMensalidadesValorBruto.AsCurrency -
                  tblMensalidadesDescontoExtra.AsCurrency) * indicePercentual), 2);
         end;

         if chkDescontoCond.Checked then
         begin
            valorBruto :=
               RoundFloat(((
                  tblMensalidadesValorBruto.AsCurrency -
                  tblMensalidadesDescontoExtra.AsCurrency -
                  tblMensalidadesValorDesconto.AsCurrency) *
                  indicePercentual), 2);
         end;
      end;

      //Os desconto devem ser mantidos na parcela do aluno
      descontoFixo := 0;
      descontoCondicional:= 0;
   end;

   // Divide o valor dos créditos
   valorCreditos := tblMensalidadesvl_credito.AsCurrency * indicePercentual;
   // Divide o valor extra
   valorExtra := RoundFloat(tblMensalidadesValorExtra.AsCurrency * indicePercentual, 2);
   // Divide o valor juros
   valorJuros := RoundFloat(tblMensalidadesValorJuros.AsCurrency * indicePercentual, 2);

   {
      Verifica se o valor da bolsa é maior que o valor da parcela do responsável
      Nesse caso ajusta o valor da bolsa para o valor da parcela
      Zera o desconto condicional da parcela
   }
   if descontoFixo >= (valorBruto+valorExtra) then
   begin
      descontoFixo := (valorBruto+valorExtra);
      descontoCondicional := 0;
   end;

   N := tblMensalidadesParcela.AsInteger;

   if chkRenumerar.Checked then
      N := speParcela.Value;

   // Criar a parcela do responsável
   iNovaMensalidade := Dm.GerarMensalidade(
      tblMensalidadesCodigoAluno.AsInteger
      , N
      , tblMensalidadesTurma.AsString
      , valorBruto
      , valorJuros
      , tblMensalidadesAnoSemestre.AsInteger
      , tblMensalidadesDataVencimento.AsDateTime
      , tblMensalidadesdt_competencia.AsDateTime
      , tblMensalidadesSituacao.AsInteger
      , tblMensalidadescurso.AsString
      , tblMensalidadesDepto.AsInteger
      , 0
      , -3 // Forcar a data de competencia
      , descontoCondicional
      , tblMensalidadesnr_creditos.AsCurrency
      , tblMensalidadesds_historico.AsString
      , tblMensalidadescd_tipo_titulo.AsInteger
      , tblMensalidadescd_plano_conta.AsInteger
      , tblMensalidadescd_centro_custo.AsInteger
      , descontoFixo
      , valorExtra
      , tblMensalidadessn_credito_parcela.AsString[1]
      , valorCreditos
      , tblMensalidadescd_item_plano.AsInteger
      , 29
      , 0
      , iCodigoResponsavel
      , tblMensalidadescd_coligada.AsInteger
      , tblMensalidadesnr_nf.AsInteger
      , percentualDivisao
      , tblMensalidadescd_desc_condicional.AsInteger
      , tblMensalidadesds_obs_desc.AsString
      , tblMensalidadesDataEmissao.AsDateTime
      , false
      , false
      , tblMensalidadescd_resp_nfse.AsInteger
   );

   {
      Criar as ações de movimento do titulo dividido com base no título selecionado
      As ações criadas são de desconto fixo e desconto condicional
   }
   bManterDescontoAluno := cbManter.Checked;
   bParcelaAluno := False;

   {
      Criar as ações de movimento do titulo dividido com base no título selecionado
      As ações criadas são de desconto fixo e desconto condicional
   }
   if descontoFixo > 0 then
   begin
      DividirAcoesMovimentoFixo(tblMensalidadescd_mensalidade.AsInteger, iNovaMensalidade, indicePercentual, descontoFixo, bManterDescontoAluno, bParcelaAluno);
   end;

   if descontoCondicional > 0 then
   begin
      DividirAcoesMovimentoCondicional(tblMensalidadescd_mensalidade.AsInteger, iNovaMensalidade, indicePercentual, descontoCondicional, bManterDescontoAluno, bParcelaAluno);
   end;

end;

procedure TfrmMensalidadesDivisao.rbAplicaBrutoClick(Sender: TObject);
begin
   chkDescontoCond.Enabled := rbAplicaLiquido.Enabled and rbAplicaLiquido.Checked;
end;

procedure TfrmMensalidadesDivisao.rbAplicaLiquidoClick(Sender: TObject);
begin
   chkDescontoCond.Enabled := rbAplicaLiquido.Enabled and rbAplicaLiquido.Checked;
end;

procedure TfrmMensalidadesDivisao.InserirParcelaAluno(indicePercentual: Currency);
var
   percentualDivisao, valorBruto,
   descontoCondicional, descontoFixo,
   valorCreditos, valorExtra, valorJuros: Currency;
   iNovaMensalidade: Integer;
   bManterDescontoAluno, bParcelaAluno: Boolean;
   percentualCondicional: Currency;
begin

   // Define o percentual de divisão do responsável
   percentualDivisao := indicePercentual*100;

   //Cálcula o indice percentual do responsável novamente
   indicePercentual := (1 - indicePercentual);

   {
      Verifica se NÃO deve manter o desconto fixo na parcela do aluno
      Nesse caso divide o desconto fixo entre o aluno e responsável
   }
   if not cbManter.Checked then
   begin
      // Divide o desconto condicional
      descontoCondicional := tblMensalidadesValorDesconto.AsCurrency - RoundFloat(tblMensalidadesValorDesconto.AsCurrency * indicePercentual, 2);
      // Divide o valor do desconto fixo
      descontoFixo := tblMensalidadesDescontoExtra.AsCurrency - RoundFloat(tblMensalidadesDescontoExtra.AsCurrency * indicePercentual, 2);
      // Divide o valor do desconto bruto
      valorBruto := tblMensalidadesValorBruto.AsCurrency - RoundFloat(tblMensalidadesValorBruto.AsCurrency * indicePercentual, 2);
   end;

   {
      Verifica se deve manter o desconto fixo na parcela do aluno
      Nesse caso existem duas opções de cálculo, sendo:
      - aplicação do desconto fixo sobre o valor bruto
      - aplicação do desconto fixo sobre o valor liquido
   }
   if cbManter.Checked then
   begin

      {
         Aplicando o fixo sobre o valor liquido
         Cálculo novo bruto aluno = Bruto - (Bruto * indice_responsavel)
      }
      if rbAplicaBruto.Checked then
      begin
         valorBruto := tblMensalidadesValorBruto.AsCurrency - RoundFloat(tblMensalidadesValorBruto.AsCurrency*indicePercentual, 2);
      end;

      {
         Aplicando o fixo sobre o valor liquido
         Cálculo novo bruto aluno = Bruto - ((Bruto - Fixo) * indice_responsavel)
      }
      if rbAplicaLiquido.Checked then
      begin
         if not chkDescontoCond.Checked then
         begin
            valorBruto :=
               tblMensalidadesValorBruto.AsCurrency -
               RoundFloat(((
                  tblMensalidadesValorBruto.AsCurrency -
                  tblMensalidadesDescontoExtra.AsCurrency) *
                  indicePercentual), 2);
         end;

         if chkDescontoCond.Checked then
         begin
            valorBruto :=
               tblMensalidadesValorBruto.AsCurrency -
               RoundFloat(((
                  tblMensalidadesValorBruto.AsCurrency -
                  tblMensalidadesDescontoExtra.AsCurrency-
                  tblMensalidadesValorDesconto.AsCurrency) *
                  indicePercentual), 2);
         end;
      end;

      // Busca os descontos do plano de pagamento da parcela
      qryDescontosPlano.Close;
      qryDescontosPlano.ParamByName('cd_mensalidade_origem').AsInteger := tblMensalidadescd_mensalidade.AsInteger;
      qryDescontosPlano.Open;

      //Mantem os descontos totais na parcela do aluno nesta opção
      descontoFixo := tblMensalidadesDescontoExtra.AsCurrency;
      descontoCondicional := tblMensalidadesValorDesconto.AsCurrency;

      //Valida para os descontos somados não passarem do valor da parcela
      if(descontoFixo + descontoCondicional) > valorBruto then
      begin

         //Percentual do condicional no bruto
         percentualCondicional := ((100 * descontoCondicional) / valorBruto);

         if(percentualCondicional > 100) then
         begin
            percentualCondicional := 100;
         end;

         //Calculo do novo condicional
         descontoCondicional := ((valorBruto - descontoFixo) * (percentualCondicional/100));
      end;
   end;

   // Divide o valor dos créditos
   valorCreditos := tblMensalidadesvl_credito.AsCurrency - (tblMensalidadesvl_credito.AsCurrency * indicePercentual);
   // Divide o valor extra
   valorExtra := tblMensalidadesValorExtra.AsCurrency - RoundFloat(tblMensalidadesValorExtra.AsCurrency * indicePercentual, 2);
   // Divide o valor juros
   valorJuros := tblMensalidadesValorJuros.AsCurrency - RoundFloat(tblMensalidadesValorJuros.AsCurrency * indicePercentual, 2);

   {
      Verifica se o valor da bolsa é maior que o valor da parcela do responsável
      Nesse caso ajusta o valor da bolsa para o valor da parcela
      Zera o desconto condicional da parcela
   }
   if descontoFixo >= (valorBruto+valorExtra) then
   begin
      descontoFixo := (valorBruto+valorExtra);
      descontoCondicional := 0;
   end;

   // Criar a parcela do aluno
   iNovaMensalidade := Dm.GerarMensalidade(
      tblMensalidadesCodigoAluno.AsInteger
      , tblMensalidadesParcela.AsInteger
      , tblMensalidadesTurma.AsString
      , valorBruto
      , valorJuros
      , tblMensalidadesAnoSemestre.AsInteger
      , tblMensalidadesDataVencimento.AsDateTime
      , tblMensalidadesdt_competencia.AsDateTime
      , tblMensalidadesSituacao.AsInteger
      , tblMensalidadescurso.AsString
      , tblMensalidadesDepto.AsInteger
      , 0
      , -3 // Forcar a data de competencia
      , descontoCondicional
      , tblMensalidadesnr_creditos.AsCurrency
      , tblMensalidadesds_historico.AsString
      , tblMensalidadescd_tipo_titulo.AsInteger
      , tblMensalidadescd_plano_conta.AsInteger
      , tblMensalidadescd_centro_custo.AsInteger
      , descontoFixo
      , valorExtra
      , tblMensalidadessn_credito_parcela.AsString[1]
      , valorCreditos
      , tblMensalidadescd_item_plano.AsInteger
      , 10
      , 0
      , tblMensalidadescd_resp.AsInteger
      , tblMensalidadescd_coligada.AsInteger
      , tblMensalidadesnr_nf.AsInteger
      , percentualDivisao
      , tblMensalidadescd_desc_condicional.AsInteger
      , tblMensalidadesds_obs_desc.AsString
      , tblMensalidadesDataEmissao.AsDateTime
      , false
      , false
      , tblMensalidadescd_resp_nfse.AsInteger
   );

   {
      Criar as ações de movimento do titulo dividido com base no título selecionado
      As ações criadas são de desconto fixo e desconto condicional
   }
   bManterDescontoAluno := cbManter.Checked;
   bParcelaAluno := True;
      
   if descontoFixo > 0 then
   begin
      DividirAcoesMovimentoFixo(tblMensalidadescd_mensalidade.AsInteger, iNovaMensalidade, indicePercentual, descontoFixo, bManterDescontoAluno, bParcelaAluno);
   end;

   if descontoCondicional > 0 then
   begin
      DividirAcoesMovimentoCondicional(tblMensalidadescd_mensalidade.AsInteger, iNovaMensalidade, indicePercentual, descontoCondicional, bManterDescontoAluno, bParcelaAluno);
   end;

end;

procedure TfrmMensalidadesDivisao.btnConfirmarClick(Sender: TObject);
var
   percResp: Currency;
   percAlun: Currency;
   n : Integer;
begin

   btnConfirmar.Enabled := False;
   {
      Efetua as verificações e validações dos campos informados
      Caso exista algum campo inválido o sistema apresenta mensagem e
      solicita ao usuário que informe corretamente o campo 
   }

   // Verifica se existe responsável selecionado 
   if Trim(edCodigoResp.Text) = '' then
   Begin
      Mensagem('Você precisa selecionar um responsável para este título.', 'UNIMESTRE', MB_OK + MB_ICONWARNING);
      btnConfirmar.Enabled := True;
      Exit;
   end;

   // Verifica se foi informado um percentual de desconto válido
   try
      percResp := StrToCurr(edPercentual.Text);

      if ((percResp <= 0) OR (percResp > 100)) then
      begin
         Mensagem('Você precisa informar um percentual de 1 até 100 para dividir estes títulos.', 'UNIMESTRE', MB_OK + MB_ICONWARNING);
         btnConfirmar.Enabled := True;
         edPercentual.SetFocus();
         Exit;
      end;

      // Cálcula o percentual do responsável e do aluno
      percResp := percResp / 100;
      percAlun := 1 - percResp;
   except
      Mensagem('Você precisa informar um percentual válido para dividir estes títulos.', 'UNIMESTRE', MB_OK + MB_ICONWARNING);
      btnConfirmar.Enabled := True;
      edPercentual.SetFocus();
      Exit;
   end;

   // Verifica se foi selecionado algum título
   if grd.SelectedRows.Count <= 0  then
   Begin
      Mensagem('Você precisa selecionar ao menos um título.', 'UNIMESTRE', MB_OK + MB_ICONWARNING);
      btnConfirmar.Enabled := True;
      Exit;
   end;

   // Exibe confirmação para o usuário se ele deseja mesmo efetuar a operação
   if Mensagem('Atenção'+ CHR(13) + CHR(13) +
           'Este procedimento irá dividir as parcelas, conforme o percentual indicado.' + CHR(13) + CHR(13) +
           'Tem certeza que deseja continuar? ' , 'UNIMESTRE', MB_YESNOCANCEL + MB_ICONWARNING) <> mrYEs
   then
   begin
      btnConfirmar.Enabled := True;
      Exit;
   end;

   {
      Procedimento abaixo varre os titulos selecionados
      e efetua a divisão desses títulos conforme as configurações selecionadas em tela
   }

   for n := 0 to grd.SelectedRows.Count - 1 do
   begin

      // Seleciona na query o titulo que está sendo varrido pelo usuário
      grd.DataSource.DataSet.GotoBookmark(Pointer(grd.SelectedRows.Items[n]));

      // Insere parcela do responsável
      InserirParcelaResponsavel(percResp);

      // Insere parcela do somente se o percentual do aluno é maior que 0
      if percAlun > 0 then
      begin
         InserirParcelaAluno(percAlun);
      end;

      // Apagar a parcela original juntamente com suas ações de movimento
      RemoverParcelaOriginal(tblMensalidadescd_mensalidade.AsInteger);

      if chkRenumerar.Checked then
      begin
         speParcela.Value := speParcela.Value + 1;
      end;
   end;

   ModalResult := mrOk;
   btnConfirmar.Enabled := True;
   CloseModal();
end;

procedure TfrmMensalidadesDivisao.RemoverParcelaOriginal(codigoMensalidade: Integer);
var
   chaves: String;
begin

   // Apaga as ações de movimento da mensalidade original
   with frmMensalidades.qryDelete do
   begin
      Close;
      SQL.Clear;
      SQL.Add(
         ' DELETE FROM fin_mov_cr                 ' +
         ' WHERE COALESCE(cd_mensalidade_origem, cd_mensalidade) = :cd_mensalidade ');
      ParamByName('cd_mensalidade').AsInteger  := codigoMensalidade;
      ExecSQL;
   end;

   // Apaga a mensalidade original
   with frmMensalidades.qryDelete do
   begin
      Close;
      SQL.Clear;
      SQL.Add( 'DELETE FROM mensalidades WHERE      ' );
      SQL.Add( 'cd_mensalidade = :cd_mensalidade    ' );
      ParamByName('cd_mensalidade').AsInteger := codigoMensalidade;
      ExecSQL;

      chaves := FillString(IntToStr(tblMensalidadesCodigoAluno.AsInteger), alRight, '0', 10, true ) + ';' +
         tblMensalidadesAnoSemestre.AsString + ';' + tblMensalidadesTurma.AsString + ';' +
         tblMensalidadesParcela.AsString + ';' +
         FormatDateTime('dd/mm/yyyy',tblMensalidadesDataVencimento.AsDateTime) + ';';

      DM.setLog(2013, 'Alteracao', chaves, Dm.getColigadaByTurma(tblMensalidadesTurma.AsString, tblMensalidadesAnoSemestre.AsInteger), 'Parcela Dividida. (NN = ' + tblMensalidadesNossoNumero.AsString +  ')');
   end;
   
end;

procedure TfrmMensalidadesDivisao.cbManterClick(Sender: TObject);
begin
   if cbManter.Enabled then
   begin
      rbAplicaBruto.Enabled := cbManter.Checked;
      rbAplicaLiquido.Enabled := cbManter.Checked;
   end;

   chkDescontoCond.Enabled := rbAplicaLiquido.Enabled and rbAplicaLiquido.Checked;
end;

procedure TfrmMensalidadesDivisao.chkRenumerarClick(Sender: TObject);
var
   I, N: Integer;
begin
   N := 0;

   if chkRenumerar.Checked then
   begin
      for I := 0 to grd.SelectedRows.Count - 1 do
      begin
         grd.DataSource.DataSet.GotoBookmark(TBookmark(grd.SelectedRows[I]));

         if grd.DataSource.DataSet.FieldByName('parcela').AsInteger > N then
         begin
            N := grd.DataSource.DataSet.FieldByName('parcela').AsInteger;
         end;

      end;

      speParcela.Enabled := True;
      speParcela.Value := N + 1;
   end;

   if not chkRenumerar.Checked then
   begin
      speParcela.Text := '';
      speParcela.Enabled := False;
   end;
end;

procedure TfrmMensalidadesDivisao.edPercentualKeyPress(Sender: TObject;
  var Key: Char);
begin
   if (Key = '.') or (Key = ',') then
   begin
      if AnsiPos(',', Self.edPercentual.Text) > 0 then
      begin
         Key := #0;
      end else
      begin
         Key := ',';
      end;
   end
   else if Key = #13 then // Pressionou ENTER
   begin
      Self.edResponsavel.SetFocus;
      Key := #0;
   end
   else if not (Key in ['0'..'9', #8]) then // Não pressionou número
   begin
      Key := #0;
   end;
end;

procedure TfrmMensalidadesDivisao.edResponsavelKeyPress(Sender: TObject;
  var Key: Char);
begin
   Key := #0;
   if edCodigoResp.Text = '' then begin
      btnCodigoAluno.Click();
   end;

end;

procedure TfrmMensalidadesDivisao.FormCreate(Sender: TObject);
begin
   SQL_PADRAO_TBL_MENSALIDADES := tblMensalidades.SQL.Text;
   speParcela.Text := '';
end;

procedure TfrmMensalidadesDivisao.FormShow(Sender: TObject);
begin

   lbCodigo.Caption := frmMensalidades.tblMensalidadesCodigoAluno.AsString + ' - ' +
                       frmMensalidades.tblMensalidadesNomeAluno.AsString;

   tblMensalidades.Close();
   tblMensalidades.SQL.Text := Format( SQL_PADRAO_TBL_MENSALIDADES, [DM.UsuarioLogado.GetColigadasFilhaSelecionada()] );
   tblMensalidades.ParamByName('codigoaluno').AsInteger := frmMensalidades.tblMensalidadesCodigoAluno.AsInteger;
   tblMensalidades.Open();

   edPercentual.Clear;
   edResponsavel.Clear;
   edCodigoResp.Clear;

end;

procedure TfrmMensalidadesDivisao.sbDesmarcarNovasClick(Sender: TObject);
begin
  tblMensalidades.DisableControls();
  tblMensalidades.First;

  while not tblMensalidades.EOF do begin

     grd.SelectedRows.CurrentRowSelected := False;
     tblMensalidades.Next();

  end;

  tblMensalidades.First();
  tblMensalidades.EnableControls;
end;

procedure TfrmMensalidadesDivisao.sbMarcarNovasClick(Sender: TObject);
begin

  tblMensalidades.DisableControls();
  tblMensalidades.First;

  while not tblMensalidades.EOF do begin

     grd.SelectedRows.CurrentRowSelected := True;
     tblMensalidades.Next();

  end;

//  tblMensalidades.First();
  tblMensalidades.EnableControls;

end;

procedure TfrmMensalidadesDivisao.tblMensalidadesCalcFields(DataSet: TDataSet);
begin
   tblMensalidadesValorBrutoCalc.AsCurrency := tblMensalidadesValorBruto.AsCurrency + tblMensalidadesValorExtra.AsCurrency;
   tblMensalidadesValorLiquidoCalc.AsCurrency := tblMensalidadesValorBruto.AsCurrency + tblMensalidadesValorExtra.AsCurrency -
      tblMensalidadesDescontoExtra.AsCurrency - tblMensalidadesValorDesconto.AsCurrency;   
end;

end.
