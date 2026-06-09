unit uFNFSeTitulos;

interface

uses
   Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
   Dialogs, ExtCtrls, ComCtrls, ToolWin, ImgList, StdCtrls, Buttons, Grids,
   DBGrids, DB, ZConnection, General, ZAbstractRODataset, ZAbstractDataset,
   ZDataset, UZDataset;

type
   TfNFSeTitulos = class(TForm)
      bvlSep1: TBevel;
      pnlTitulo: TPanel;
      bvlSep2: TBevel;
      tlbOpcoes: TToolBar;
      btnSep1: TToolButton;
      btnFechar: TToolButton;
      btnSep2: TToolButton;
      ilImagens: TImageList;
      bvlSep3: TBevel;
      pnlFiltros: TPanel;
      rgSituacao: TRadioGroup;
      lblTurma: TLabel;
      cbTurma: TComboBox;
      ledAluno: TLabeledEdit;
      sbSelecionarAluno: TSpeedButton;
      bvlSep4: TBevel;
      dbgTitulos: TDBGrid;
      qryTitulos: TUMZQuery;
      qryTituloscd_mensalidade: TIntegerField;
      qryTituloscodigoaluno: TIntegerField;
      qryTitulosparcela: TSmallintField;
      qryTitulosdatavencimento: TDateTimeField;
      qryTitulosdt_competencia: TDateTimeField;
      qryTitulosturma: TStringField;
      qryTitulosdataemissao: TDateTimeField;
      qryTitulosnossonumero: TStringField;
      qryTitulosvalorbruto: TFloatField;
      qryTitulosvalordesconto: TFloatField;
      qryTitulosdescontoextra: TFloatField;
      qryTitulosvalorextra: TFloatField;
      qryTitulosvalortotal: TFloatField;
      qryTitulosvalorjuros: TFloatField;
      qryTitulosvalorjuros_fixo: TFloatField;
      qryTitulosvalorpago: TFloatField;
      qryTitulosdatapagamento: TDateTimeField;
      qryTitulosdt_credito: TDateTimeField;
      qryTitulossituacao: TSmallintField;
      qryTitulosusuario: TStringField;
      qryTitulosbloqueto: TStringField;
      qryTitulosanosemestre: TSmallintField;
      qryTituloscurso: TStringField;
      qryTitulostipoparcela: TSmallintField;
      qryTitulossn_credito_parcela: TStringField;
      qryTitulosnr_creditos: TFloatField;
      qryTituloscd_coligada: TIntegerField;
      qryTituloscd_centro_custo: TLargeintField;
      qryTituloscd_plano_conta: TLargeintField;
      qryTitulosds_historico: TStringField;
      qryTitulossn_liberar_juros: TSmallintField;
      qryTitulossn_liberar_descontos: TSmallintField;
      qryTituloscd_boleto: TLargeintField;
      qryTituloscd_caixa: TIntegerField;
      qryTitulosvl_pago_moeda: TFloatField;
      qryTituloscd_moeda: TLargeintField;
      qryTituloscd_moeda_pgto: TLargeintField;
      qryTituloscd_bolsa: TIntegerField;
      qryTitulosvl_credito: TFloatField;
      qryTituloscd_recibo: TIntegerField;
      qryTituloscd_cheque_devolvido: TLargeintField;
      qryTitulosds_deposito: TStringField;
      qryTitulosds_obs: TStringField;
      qryTitulosNomeAluno: TStringField;
      qryTitulosNomeResponsavel: TStringField;
      qryTitulosds_tipo_titulo: TStringField;
      qryTitulosds_conta: TStringField;
      qryTitulosds_centro: TStringField;
      qryTitulosds_bolsa: TStringField;
      qryTitulosds_sigla: TStringField;
      qryTitulosMoedaPgto: TStringField;
      qryTitulossn_protesto: TSmallintField;
      qryTitulosds_acao: TStringField;
      qryTitulosjuros_calc: TFloatField;
      qryTitulosdesconto_calc: TFloatField;
      qryTitulosds_caixa: TStringField;
      qryTitulossn_cobranca: TLargeintField;
      qryTitulosds_cor_cobranca: TStringField;
      qryTitulosds_situacao_cobranca: TStringField;
    dsTitulos: TDataSource;
      qryTitulosvalorjuroscalc: TCurrencyField;
      qryTitulosvalordescontocalc: TCurrencyField;
      qryTitulospercdescextra: TCurrencyField;
      qryTitulospercdesccond: TCurrencyField;
    qryTitulosbloquetoimpresso: TStringField;
      qryTitulosdescricaosituacao: TStringField;
      qryTitulosvalortotalcalc: TCurrencyField;
    btnColunas: TToolButton;
    btnSep3: TToolButton;
    qryTurmas: TUMZQuery;
      qryTurmasturma: TStringField;
    qryTituloscd_desc_condicional: TLargeintField;
    qryTituloscd_tipo_titulo: TSmallintField;
    qryTitulosds_obs_desc: TMemoField;
    qryTitulosvl_faturamento: TFloatField;
    qryTituloscd_usuario: TLargeintField;
    qryTitulosdatabasecorrecao: TDateTimeField;
    qryTitulosindicecorrecao: TFloatField;
    qryTitulosdepto: TSmallintField;
    qryTitulosocorrencia_remessa: TSmallintField;
    qryTitulosocorrencia_retorno: TIntegerField;
    qryTituloscd_mensalidade_origem: TIntegerField;
    qryTituloscodigocarta: TLargeintField;
    qryTituloscd_item_plano: TLargeintField;
      procedure FormCreate(Sender: TObject);
      procedure ledAlunoKeyPress(Sender: TObject; var Key: Char);
      procedure FormClose(Sender: TObject; var Action: TCloseAction);
      procedure btnFecharClick(Sender: TObject);
      procedure FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
      procedure rgSituacaoClick(Sender: TObject);
      procedure sbSelecionarAlunoClick(Sender: TObject);
      procedure cbTurmaSelect(Sender: TObject);
      procedure btnColunasClick(Sender: TObject);
      procedure qryTitulosCalcFields(DataSet: TDataSet);
   private
      FICodigoNf: integer;
      procedure Filtra;
      procedure CarregaTurmas;
   public
      class procedure MostraTitulos(AOwner: TComponent; const AICodigoNf: integer);
   end;

var
   fNFSeTitulos: TfNFSeTitulos;

implementation

{$R *.dfm}

uses
   uDM, uCamposPlanilhas, uFSelecionarPessoa;

procedure TfNFSeTitulos.btnColunasClick(Sender: TObject);
begin
   Application.CreateForm(TfrmSelColunas, frmSelColunas);
   frmSelColunas.SelecionaColunas(dbgTitulos, 'planilha_titulos_nfse');
end;

procedure TfNFSeTitulos.btnFecharClick(Sender: TObject);
begin
   Close;
end;

procedure TfNFSeTitulos.CarregaTurmas;
begin
   cbTurma.Clear;
   cbTurma.ItemIndex := -1;
   qryTurmas.Close;
   qryTurmas.ParamByName('nr_nf').AsInteger := FICodigoNf;
   qryTurmas.Open;
   cbTurma.AddItem('(TODOS)', nil);
   while not qryTurmas.Eof do
   begin
      cbTurma.AddItem(qryTurmasturma.AsString, qryTurmas.GetBookmark);
      qryTurmas.Next;
   end;
end;

procedure TfNFSeTitulos.cbTurmaSelect(Sender: TObject);
begin
   if cbTurma.ItemIndex > -1 then
   begin
      if cbTurma.ItemIndex > 0 then
         qryTurmas.GotoBookmark(Pointer(cbTurma.Items.Objects[cbTurma.ItemIndex]));
      Filtra;
   end;
end;

procedure TfNFSeTitulos.Filtra;
const
   S_FILTRO_ALUNO = ' codigoaluno = %s ';
   S_FILTRO_TURMA = ' turma = %s ';

   S_SITUACAO_TODOS = '';
   S_SITUACAO_PAGO = ' situacao = 0 OR situacao = 1 ';
   S_SITUACAO_CANC = ' situacao = 4 OR situacao = 5 OR situacao = 7 OR situacao = 8 ';
   S_SITUACAO_NEGC = ' situacao = 3 ';
   S_SITUACAO_PROT = ' sn_protesto = 1 ';
   S_SITUACAO_PARC = ' tipoparcela = 1 ';
   S_SITUACAO_PEND = ' situacao = 2 OR situacao = 10 OR sn_protesto = 1 ';
   S_SITUACAO_VENC = ' ((datavencimento < %s) AND (situacao = 2 OR situacao = 10 OR sn_protesto = 1)) ';

   S_OP = 'AND';
   
   FiltroSituacaoByItemIndex: array[0..7] of string =
      (S_SITUACAO_TODOS, S_SITUACAO_CANC, S_SITUACAO_PROT, S_SITUACAO_PEND,
       S_SITUACAO_PAGO, S_SITUACAO_NEGC, S_SITUACAO_PARC, S_SITUACAO_VENC);
var
   LSFiltro: string;
begin
   if cbTurma.ItemIndex > 0 then
      LSFiltro := Format(S_FILTRO_TURMA, [QuotedStr(qryTurmasturma.AsString)]);
   if ledAluno.Text <> '' then
   begin
      if LSFiltro <> '' then
         LSFiltro := LSFiltro + S_OP;
      LSFiltro := LSFiltro + Format(S_FILTRO_ALUNO, [ledAluno.Text]);
   end;
   if rgSituacao.ItemIndex > 0 then
   begin
      if LSFiltro <> '' then
         LSFiltro := LSFiltro + S_OP;
      LSFiltro := LSFiltro + FiltroSituacaoByItemIndex[rgSituacao.ItemIndex];
      if rgSituacao.ItemIndex = 7 then
         LSFiltro := Format(LSFiltro, [QuotedStr(FormatDateTime('yyyy-mm-dd', Now))]);
   end;
   if LSFiltro <> '' then
   begin
      qryTitulos.Filter := LSFiltro;
      qryTitulos.Filtered := true;
   end
   else
      qryTitulos.Filtered := false;
end;

procedure TfNFSeTitulos.FormClose(Sender: TObject; var Action: TCloseAction);
begin
   qryTitulos.Close;
   qryTurmas.Close;
   Action := caFree;
end;

procedure TfNFSeTitulos.FormCreate(Sender: TObject);
begin
   DM.MontarPlanilha(dbgTitulos, 'planilha_titulos_nfse');
end;

procedure TfNFSeTitulos.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
   if Key = VK_F12 then
      Close;
end;

procedure TfNFSeTitulos.ledAlunoKeyPress(Sender: TObject; var Key: Char);
begin
   if not (Key in['0'..'9', #8, #13]) then
      Key := #0;
   if Key = #13 then
      Filtra;
end;

class procedure TfNFSeTitulos.MostraTitulos(AOwner: TComponent;
  const AICodigoNf: integer);
begin
   if not Assigned(fNFSeTitulos) then
      fNFSeTitulos := TfNFSeTitulos.Create(AOwner);
   fNFSeTitulos.FICodigoNf := AICodigoNf;
   fNFSeTitulos.CarregaTurmas;
   fNFSeTitulos.qryTitulos.ParamByName('nr_nf').AsInteger := AICodigoNf;
   fNFSeTitulos.qryTitulos.Open;
   fNFSeTitulos.Filtra;
   fNFSeTitulos.ShowModal;
   fNFSeTitulos.Free;
   fNFSeTitulos := nil;
end;

procedure TfNFSeTitulos.qryTitulosCalcFields(DataSet: TDataSet);
var
   LDDesconto, LDJuros: Double;
begin
   if qryTitulosvalorbruto.AsCurrency > 0 then
      qryTitulospercdescextra.AsCurrency :=
         qryTitulosdescontoextra.AsCurrency / qryTitulosvalorbruto.AsCurrency * 100
   else
      qryTitulospercdescextra.AsString := '';

   if qryTitulosvalorbruto.AsCurrency - qryTitulosdescontoextra.AsCurrency > 0 then
      qryTitulospercdesccond.AsCurrency :=
         qryTitulosvalordesconto.AsCurrency /
         (qryTitulosvalorbruto.AsCurrency - qryTitulosdescontoextra.AsCurrency) * 100
   else
      qryTitulospercdesccond.AsString := '';

   if qryTitulosbloqueto.AsString = 'S' then
      qryTitulosbloquetoimpresso.AsString := 'X'
   else
      qryTitulosbloquetoimpresso.AsString := '';

   case qryTitulossituacao.AsInteger of
      0..1:
         qryTitulosdescricaosituacao.AsString :=
            DM.lst_situacao_fin_sigla[qryTitulosSituacao.AsInteger];
      2:
      begin
         if qryTitulosdatavencimento.AsDateTime < Now then
            qryTitulosdescricaosituacao.AsString := 'VENC'
         else
            qryTitulosdescricaosituacao.AsString := DM.lst_situacao_fin_sigla[2];
         end;
      else
         qryTitulosdescricaosituacao.AsString :=
            DM.lst_situacao_fin_sigla[qryTitulosSituacao.AsInteger];
   end;

   if qryTitulosSituacao.Value in[2, 10] then
   begin
      if qryTitulosParcela.AsInteger <> 0 then
      begin
         LDDesconto:= qryTitulosdesconto_calc.AsCurrency;
         LDJuros:= qryTitulosvalorjuros.Value + qryTitulosjuros_calc.AsCurrency;
         qryTitulosvalordescontocalc.Value := LDDesconto;
         qryTitulosvalortotalcalc.Value := RoundFloat(
            (qryTitulosvalorbruto.Value +
             qryTitulosvalorextra.Value -
             qryTitulosdescontoextra.Value -
             LDDesconto + LDJuros), 2);
         qryTitulosvalorjuroscalc.Value := RoundFloat(
            qryTitulosvalortotalcalc.Value -
            (qryTitulosvalorbruto.Value +
             qryTitulosvalorextra.Value -
             qryTitulosdescontoextra.Value -
             LDDesconto), 2);
      end
      else
      begin
         qryTitulosvalortotalcalc.Value := RoundFloat(
            qryTitulosvalorbruto.Value +
            qryTitulosvalorextra.Value -
            qryTitulosvalordesconto.Value -
            qryTitulosdescontoextra.Value +
            qryTitulosvalorjuros.Value, 2);
         qryTitulosvalorjuroscalc.Value :=
            RoundFloat(qryTitulosvalorjuros.Value, 2);
         qryTitulosvalordescontocalc.Value :=
            RoundFloat(qryTitulosvalordesconto.Value, 2);
      end;
   end
   else
   begin
      if qryTitulosSituacao.AsInteger in[0, 1, 3] then
         qryTitulosvalortotalcalc.Value := RoundFloat(qryTitulosvalortotal.Value, 2)
      else
      begin
         qryTitulosvalortotalcalc.Value := RoundFloat(
            qryTitulosvalorbruto.Value +
            qryTitulosvalorextra.Value -
            qryTitulosvalordesconto.Value -
            qryTitulosdescontoextra.Value +
            qryTitulosvalorjuros.Value, 2);
     end;
     qryTitulosvalordescontocalc.Value := qryTitulosdesconto_calc.AsCurrency;
     qryTitulosvalorjuroscalc.Value := RoundFloat(qryTitulosvalorjuros.Value, 2);
   end;
end;

procedure TfNFSeTitulos.rgSituacaoClick(Sender: TObject);
begin
   Filtra;
end;

procedure TfNFSeTitulos.sbSelecionarAlunoClick(Sender: TObject);
var
   resultado_filtro : TResultadoFiltroPessoa;
begin
   resultado_filtro := TfrmSelecionarPessoa.Filtrar([], afpEstudante);

   if resultado_filtro.filtrado then
   begin
      ledAluno.Text := IntToStr( resultado_filtro.cd_pessoa );
      Filtra;
   end;
end;

end.
