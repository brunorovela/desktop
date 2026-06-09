unit uFCancelTaxasRecorrencia;

interface

uses
   Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
   Dialogs, ExtCtrls, DB, ZConnection, StdCtrls, DBCtrls, ComCtrls, ToolWin,
   ImgList, uDM, uClassMovimento, General, ZAbstractRODataset, ZAbstractDataset, ZDataset, UZDataset, Contnrs, uRemessaClass;

type
   TfCancelTaxasRecorrencia = class(TForm)
      pnlTitulo: TPanel;
      bvlSep1: TBevel;
      qryAcoesMovimento: TUMZQuery;
      dsAcoesMovimento: TDataSource;
      lblAcaoMovimento: TLabel;
      lblObservacoes: TLabel;
      memObservacoes: TMemo;
      ilImagens: TImageList;
      tlbAcoes: TToolBar;
      btnSep1: TToolButton;
      btnConfirmar: TToolButton;
      btnSep2: TToolButton;
      btnSair: TToolButton;
      btnSep3: TToolButton;
      bvlSep2: TBevel;
      lblStatus: TLabel;
      prbStatus: TProgressBar;
      qrySelectParcelas: TUMZQuery;
      qryAcoesMovimentods_acao: TStringField;
      qryAcoesMovimentocd_tipo_acao: TSmallintField;
      qryAcoesMovimentosn_ativo: TStringField;
      qryAcoesMovimentocd_origem: TSmallintField;
      qryAcoesMovimentotp_entrada_saida: TSmallintField;
      cbAcoesMovimento: TComboBox;
      qrySelectParcelasnm_pessoa: TStringField;
      qrySelectParcelasturma: TStringField;
      qrySelectParcelasanosemestre: TSmallintField;
      qrySelectParcelasdatavencimento: TDateTimeField;
      qrySelectParcelasparcela: TSmallintField;
      qrySelectParcelasvalorbruto: TFloatField;
      qrySelectParcelasvalorjuros: TFloatField;
      qrySelectParcelasdt_competencia: TDateTimeField;
      qrySelectParcelasvl_pendente: TFloatField;
      qrySelectParcelascd_coligada: TSmallintField;
      qryCancelaParcelas: TUMZQuery;
    qrySelectParcelasturmamatricula: TStringField;
    qryAcoesMovimentocd_acao: TLargeintField;
    qryAcoesMovimentocd_movimento_caixa: TLargeintField;
    qryAcoesMovimentocd_movimento_estorno: TLargeintField;
    qryAcoesMovimentocd_acao_automatica: TIntegerField;
    qryAcoesMovimentocd_plano_conta: TLargeintField;
    qrySelectParcelascd_mensalidade_origem: TIntegerField;
    qrySelectParcelascd_mensalidade: TIntegerField;
    qrySelectParcelascodigoaluno: TIntegerField;
    qryCancelaParcelas2: TUMZQuery;
    qrySelectParcelasnossonumero: TStringField;
      procedure FormCreate(Sender: TObject);
      procedure FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
      procedure btnSairClick(Sender: TObject);
      procedure FormClose(Sender: TObject; var Action: TCloseAction);
      procedure cbAcoesMovimentoSelect(Sender: TObject);
      procedure qryAcoesMovimentoAfterOpen(DataSet: TDataSet);
      procedure btnConfirmarClick(Sender: TObject);
   strict private
      FMovimento: TMovimento;
      procedure CancelaTaxasExameRecorrencia;
      procedure RegistraMovimentoCR(const AICodTitulo, AIColigada,
         AICodMovimento, AICodAcao: integer; const ACValorMovimento,
         ACValorJuros: Currency; const ASObservacao: string);
      procedure RegistraMotivo(const AICodAluno, AIParcela,
         AICodUsuario: integer; const ASCodTurma, ASMotivo: string;
         const ADtMotivo: TDateTime);
   end;

var
  fCancelTaxasRecorrencia: TfCancelTaxasRecorrencia;

implementation

{$R *.dfm}

{ TfCancelTaxasRecorrencia }

procedure TfCancelTaxasRecorrencia.btnConfirmarClick(Sender: TObject);
const
   S_MSG_CONFIRMACAO =
      'Deseja realmente cancelar todas as parcelas referentes à '+ #13 +
      'taxa de exame de recorrência que estão pendentes?';
begin
   if Mensagem(S_MSG_CONFIRMACAO, 'Atenção', MB_ICONQUESTION + MB_YESNO + MB_DEFBUTTON2) = ID_YES then
   begin
      btnConfirmar.Enabled := false;
      memObservacoes.ReadOnly := true;
      CancelaTaxasExameRecorrencia;
   end;
end;

procedure TfCancelTaxasRecorrencia.btnSairClick(Sender: TObject);
begin
   Close;
end;

procedure TfCancelTaxasRecorrencia.CancelaTaxasExameRecorrencia;
const
   S_MSG_I_FINALIZADO = 'Cancelamento das parcelas finalizado.';
   S_LOG = 'Titulo Cancelado no valor de: %f';
var
   LSChave, LSMotivo: string;
   objRemessa: TRemessa;
begin
   qrySelectParcelas.Open;
   try
      prbStatus.Max := qrySelectParcelas.RecordCount + 1;
      lblStatus.Visible := true;
      prbStatus.Visible := true;
      Application.ProcessMessages;
      while not qrySelectParcelas.Eof do
      begin
         prbStatus.StepIt;
         { Registra movimento de cancelamento de parcelas na tesouraria
         }
         RegistraMovimentoCR(
            qrySelectParcelascd_mensalidade_origem.AsInteger,
            qrySelectParcelascd_coligada.AsInteger,
            qrySelectParcelascd_mensalidade.AsInteger,
            qryAcoesMovimentocd_acao.AsInteger,
            qrySelectParcelasvl_pendente.AsCurrency,
            qrySelectParcelasvalorjuros.AsCurrency,
            memObservacoes.Lines.Text);
         { Registra as informações para ação de remessa
         }
         DM.FazAcaoRemessa(arCancelar, qrySelectParcelascd_mensalidade.AsInteger);

         if DM.variavel_parametro('sn_processo_remessa_novo') = '1' then
         begin
           // registra a nova ação de cancelamento no novo modelo de remessa
           objRemessa := TRemessa.Create;
           objRemessa.registraAcaoCancelamento(qrySelectParcelasnossonumero.AsString);
         end;

         { Salva log da operação no banco de dados
         }
         LSChave :=
            qrySelectParcelascd_mensalidade.AsString + ';' +
            FormatDateTime('dd/mm/yyyy', Dm.DataAtual) + ';';
         DM.setLog(
            2065, 'Inclusao', LSChave, qrySelectParcelascd_coligada.AsInteger,
            Format(S_LOG, [qrySelectParcelasvl_pendente.AsCurrency]));
         { Registra o motivo do cancelamento da parcela
         }
         LSMotivo := Trim(DM.tblMotivosMotivo.AsString) + #13 +
                     memObservacoes.Lines.Text +
                     ' (' + DM.sLogin + ')';
         RegistraMotivo(
            qrySelectParcelascodigoaluno.AsInteger,
            qrySelectParcelasparcela.AsInteger,
            DM.iCdPessoaLogado,
            qrySelectParcelasturma.AsString,
            LSMotivo,
            qrySelectParcelasdatavencimento.AsDateTime);
         { Recalcula a média final do aluno
         }
         { OLIVER - CALCULO_MEDIA - OK - }
         DM.CalcularMediaFinal(
            qrySelectParcelascodigoaluno.AsInteger,
            qrySelectParcelasanosemestre.AsInteger,
            DM.getGrupoAtividade(qrySelectParcelas.FieldByName('anosemestre').AsInteger, qrySelectParcelas.FieldByName('curso').AsString, qrySelectParcelas.FieldByName('turma').AsString, qrySelectParcelas.FieldByName('disciplina').AsInteger, qrySelectParcelas.FieldByName('codigoaluno').AsInteger),
            qrySelectParcelasturma.AsString,
            qrySelectParcelasturmamatricula.AsString );
         { Define a situação final da matrícula do aluno
         }
         qrySelectParcelas.Next;
      end;
   finally
      qrySelectParcelas.Close;
   end;
   {qryCancelaParcelas2.ExecSQL;}
   if qryCancelaParcelas2.Connection.Protocol = 'oracle' then //Oracle
   begin
      qryCancelaParcelas2.ParamByName('cd_coligada').AsInteger := DM.GetUsuarioLogado.GetColigadaLogada.Codigo;
      qryCancelaParcelas2.ExecSQL;
   end;
   prbStatus.StepIt;
//   qryLimpaFichaIndividual.ExecSQL;
//   prbStatus.StepIt;
   Mensagem(S_MSG_I_FINALIZADO, 'Informação', MB_ICONINFORMATION + MB_OK);
   lblStatus.Visible := false;
   prbStatus.Visible := false;
end;

procedure TfCancelTaxasRecorrencia.cbAcoesMovimentoSelect(Sender: TObject);
begin
   qryAcoesMovimento.GotoBookmark(
      Pointer(cbAcoesMovimento.Items.Objects[cbAcoesMovimento.ItemIndex]));
end;

procedure TfCancelTaxasRecorrencia.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
   FreeAndNil(FMovimento);
   Action := caFree;
end;

procedure TfCancelTaxasRecorrencia.FormCreate(Sender: TObject);
begin
   FMovimento := TMovimento.create;
   qryAcoesMovimento.Open;
end;

procedure TfCancelTaxasRecorrencia.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
   case Key of
      VK_F5:
         if btnConfirmar.Enabled then
            btnConfirmarClick(nil);
      VK_F12:
         Close;
   end;
end;

procedure TfCancelTaxasRecorrencia.qryAcoesMovimentoAfterOpen(
  DataSet: TDataSet);
begin
   qryAcoesMovimento.First;
   while not qryAcoesMovimento.Eof do
   begin
      cbAcoesMovimento.AddItem(
         qryAcoesMovimentods_acao.AsString,
         qryAcoesMovimento.GetBookmark);
      qryAcoesMovimento.Next;
   end;
   if qryAcoesMovimento.RecordCount > 0 then
   begin
      cbAcoesMovimento.ItemIndex := 0;
      btnConfirmar.Enabled := true;
   end;
end;

procedure TfCancelTaxasRecorrencia.RegistraMotivo(const AICodAluno, AIParcela,
  AICodUsuario: integer; const ASCodTurma, ASMotivo: string;
  const ADtMotivo: TDateTime);
begin
   if DM.FindMotivo(AICodAluno, AIParcela, ADtMotivo, ASCodTurma) then
      DM.tblMotivos.Edit
   else
      DM.tblMotivos.Insert;
   DM.tblMotivosCodigoAluno.AsInteger := AICodAluno;
   DM.tblMotivosParcela.AsInteger := AIParcela;
   DM.tblMotivosAutorizadoPor.AsInteger := AICodUsuario;
   DM.tblMotivosturma.AsString := ASCodTurma;
   DM.tblMotivosMotivo.AsString := ASMotivo;
   DM.tblMotivosDataMotivo.AsString := DateToStr(ADtMotivo);
   DM.tblMotivos.Post;
end;

procedure TfCancelTaxasRecorrencia.RegistraMovimentoCR(const AICodTitulo,
  AIColigada, AICodMovimento, AICodAcao: integer; const ACValorMovimento,
  ACValorJuros: Currency; const ASObservacao: string);
begin
   FMovimento.TipoDeAcao := BaixarporCancelamento;
   FMovimento.CodigoTitulo := AICodTitulo;
   FMovimento.Coligada := AIColigada;
   FMovimento.CodigoMovimento := AICodMovimento;
   FMovimento.CodAcao := AICodAcao;
   FMovimento.ValorMovimento := ACValorMovimento;
   FMovimento.ValorJuros := ACValorJuros;
   FMovimento.Observacao := ASObservacao;
   FMovimento.RegistrarMovimentacaoCR(0);
end;

end.

