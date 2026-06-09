unit UFGerarMens;

interface

uses
   Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
   Dialogs, DB, ZAbstractRODataset, ZAbstractDataset, UZDataset, StdCtrls,
   ExtCtrls, ComCtrls, ImgList, ToolWin;

type
   TfGerarMens = class(TForm)
      qryMensalidades: TUMZQuery;
      qryMensalidadesCD_MENSALIDADE: TIntegerField;
      qryMensalidadesCODIGOALUNO: TIntegerField;
      qryMensalidadesPARCELA: TIntegerField;
      qryMensalidadesDATAVENCIMENTO: TDateTimeField;
      qryMensalidadesDT_COMPETENCIA: TDateTimeField;
      qryMensalidadesTURMA: TStringField;
      qryMensalidadesDATAEMISSAO: TDateTimeField;
      qryMensalidadesNOSSONUMERO: TStringField;
      qryMensalidadesVALORBRUTO: TFloatField;
      qryMensalidadesCD_TIPO_TITULO: TIntegerField;
      qryMensalidadesVALORDESCONTO: TFloatField;
      qryMensalidadesDESCONTOEXTRA: TFloatField;
      qryMensalidadesVALOREXTRA: TFloatField;
      qryMensalidadesVALORTOTAL: TFloatField;
      qryMensalidadesVALORJUROS: TFloatField;
      qryMensalidadesVALORPAGO: TFloatField;
      qryMensalidadesDATAPAGAMENTO: TDateTimeField;
      qryMensalidadesSITUACAO: TIntegerField;
      qryMensalidadesUSUARIO: TStringField;
      qryMensalidadesCD_USUARIO: TLargeintField;
      qryMensalidadesBLOQUETO: TStringField;
      qryMensalidadesANOSEMESTRE: TIntegerField;
      qryMensalidadesDATABASECORRECAO: TDateTimeField;
      qryMensalidadesINDICECORRECAO: TFloatField;
      qryMensalidadesCURSO: TStringField;
      qryMensalidadesDEPTO: TIntegerField;
      qryMensalidadesTIPOPARCELA: TIntegerField;
      qryMensalidadesSN_CREDITO_PARCELA: TStringField;
      qryMensalidadesCD_MENSALIDADE_ORIGEM: TIntegerField;
      qryMensalidadesCD_COLIGADA: TIntegerField;
      qryMensalidadesCD_CENTRO_CUSTO: TLargeintField;
      qryMensalidadesCD_PLANO_CONTA: TLargeintField;
      qryMensalidadesDS_HISTORICO: TStringField;
      qryMensalidadesCD_RESP: TIntegerField;
      lblSelecionar: TLabel;
      bvlSep1: TBevel;
      mcalDataVencto: TMonthCalendar;
      bvlSep2: TBevel;
      tlbOpcoes: TToolBar;
      ilOpcoes: TImageList;
      btnSep1: TToolButton;
      btnConfirmar: TToolButton;
      btnSep2: TToolButton;
      btnCancelar: TToolButton;
      btnSep3: TToolButton;
      bvlSep3: TBevel;
      bvlSep4: TBevel;
      pnlProgresso: TPanel;
      qryMensExcluir: TUMZQuery;
      qryMensIncluir: TUMZReadOnlyQuery;
      qryMensIncluirCD_TIPO_TITULO: TIntegerField;
      qryMensIncluirCD_CENTRO: TLargeintField;
      qryMensIncluirCD_COLIGADA: TIntegerField;
      qryMensIncluirNR_PARCELA: TIntegerField;
      qryMensIncluirCD_CONTA: TLargeintField;
      qryMensIncluirVL_BRUTO: TFloatField;
      qryMensAlterar: TUMZReadOnlyQuery;
      qryMensAlterarCD_TIPO_TITULO: TIntegerField;
      qryMensAlterarCD_CENTRO: TLargeintField;
      qryMensAlterarCD_COLIGADA: TIntegerField;
      qryMensAlterarNR_PARCELA: TIntegerField;
      qryMensAlterarCD_CONTA: TLargeintField;
      qryMensAlterarCD_MENSALIDADE: TIntegerField;
      qryMensAlterarVL_BRUTO: TFloatField;
      qryPlanosDescontos: TUMZReadOnlyQuery;
      qryPlanosDescontosQT_ATIVIDADES: TIntegerField;
      qryPlanosDescontosVL_PERCENTUAL: TFloatField;
      qryPlanosDescontosVL_DESCONTO: TFloatField;
      qryPlanosDescontosVL_DESCONTO_FIXO: TFloatField;
      qryRespFinan: TUMZReadOnlyQuery;
      qryVinculaMens: TUMZQuery;
      qryCriaMovCR: TUMZQuery;
      qryMensExcluirCD_MENSALIDADE: TIntegerField;
      qryMensExcluirCODIGOALUNO: TIntegerField;
      qryMensExcluirANOSEMESTRE: TIntegerField;
      qryMensExcluirTURMA: TStringField;
      qryMensExcluirPARCELA: TIntegerField;
      qryMensExcluirDATAVENCIMENTO: TDateTimeField;
      qryMensExcluirCD_COLIGADA: TIntegerField;
      qryMensExcluirNOSSONUMERO: TStringField;
      qryGeraLog: TUMZQuery;
      qryGeraLogGeral: TUMZQuery;
      qryMovCRExcluir: TUMZQuery;
      qryMovCRExcluirCD_MENSALIDADE: TIntegerField;
      qryMovCRExcluirCD_COLIGADA: TIntegerField;
      qryMovCRExcluirNR_SEQUENCIA: TIntegerField;
      qryVinculaInscricao: TUMZQuery;
      aniCarregnd: TAnimate;
      qryRespFinanCD_RESP_FINAN: TIntegerField;
      qryRespFinanCD_PESSOA: TIntegerField;
      qryRespFinanCD_RESP: TIntegerField;
    qryMensAlterards_tipo_titulo: TStringField;
    qryMensIncluirds_tipo_titulo: TStringField;
      procedure qryRespFinanCalcFields(DataSet: TDataSet);
      procedure FormCreate(Sender: TObject);
      procedure FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
      procedure btnConfirmarClick(Sender: TObject);
      procedure btnCancelarClick(Sender: TObject);
   private
      procedure GeraFinanceiro;
   end;

var
   fGerarMens: TfGerarMens;

implementation

uses
   uInscricoesPlanilha, uDM, Main, uUsuario;

{$R *.dfm}

{ TfGerarMens }

procedure TfGerarMens.btnCancelarClick(Sender: TObject);
begin
   Close;
end;

procedure TfGerarMens.btnConfirmarClick(Sender: TObject);
const
   SConfirm =
         'Esta ação atualizará quaisquer informações existentes '#13 +
         'referentes a taxas de inscrição em atividades '#13 +
         'Extra Curriculares para os aluno selecionados.'#13#13 +
         'Deseja realmente continuar?';
   SCaption = 'Atenção';
begin
   if MessageBox(Handle, PChar(SConfirm), PChar(SCaption),
         MB_ICONQUESTION + MB_YESNO) = ID_YES then
   begin
      aniCarregnd.Active := True;
      aniCarregnd.Visible := True;
      btnCancelar.Enabled := False;
      btnConfirmar.Enabled := False;
      Application.ProcessMessages;
      GeraFinanceiro;
      aniCarregnd.Active := False;
      aniCarregnd.Visible := False;
      Application.ProcessMessages;
      MessageBox(Handle, PChar('Mensalidade(s) gerada(s) com sucesso!'),
            PChar('Informação'), MB_ICONINFORMATION + MB_OK);
      Close;
   end;
end;

procedure TfGerarMens.FormCreate(Sender: TObject);
var
   S: string;
begin
   aniCarregnd.ResName := 'LOADING';

   S := DM.variavel_parametro('agrupar_mensalidades_proximo_mes');

   if S = 'S' then
      mcalDataVencto.Enabled := DM.RequestPermission('1107', npAlterar, False,
            Handle);
   mcalDataVencto.Date := Date;
end;

procedure TfGerarMens.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
   case Key of
      VK_F5:
         btnConfirmar.Click;
      VK_F6:
         btnCancelar.Click;
   end;
end;

procedure TfGerarMens.GeraFinanceiro;
const
   SObsLog = 'Parcela Excluída (NN = %s)';
   SChaveLog = '%s;%d;%s;%d;%s;';
var
   DataVencto, DataBaseCorr: TDate;
   Y, M, D: Word;
   Descontos, Liquido: Currency;
   Depto, Curso, Turma, ObsLog, ChaveLog, S: string;
   I, Mnsaldade, cdUltimaPessoa: Integer;
begin

   // Armazena a data de vencimento selecionada pelo e calcula a data base de
   // correção sobre a data selecionada

   DataVencto := mcalDataVencto.Date;
   DecodeDate(DataVencto, Y, M, D);
   DataBaseCorr := EncodeDate(Y, M, 1);

   // Obtém do banco de dados os parâmetros para geração das taxas

   Curso := DM.variavel_parametro('extra_mensalidades_curso');
   Turma := DM.variavel_parametro('extra_mensalidades_turma');
   Depto := DM.variavel_parametro('extra_mensalidades_depto');

   // Percorre todos os registros de inscrição filtrados pelo usuário na
   // planilha de inscrições

   frm_Inscricoes_Planilha.qryInscricoes.First;

   while not frm_Inscricoes_Planilha.qryInscricoes.Eof do
   begin

      // Grava o código da última pessoa que estiver passando
      cdUltimaPessoa := frm_Inscricoes_Planilha.qryInscricoesCD_PESSOA.AsInteger;

      // Recupera e guarda as parcelas que serão excluídas

      qryMensExcluir.Close;
      qryMensExcluir.ParamByName('NR_ANOSEMESTRE').AsInteger :=
            frm_Inscricoes_Planilha.qryInscricoesNR_ANOSEMESTRE.AsInteger;
      qryMensExcluir.ParamByName('CD_PESSOA').AsInteger :=
            frm_Inscricoes_Planilha.qryInscricoesCD_PESSOA.AsInteger;
      qryMensExcluir.ParamByName('NR_MES').AsInteger :=
            frm_Inscricoes_Planilha.qryInscricoesNR_MES.AsInteger;
      qryMensExcluir.Open;

      // Guarda as movimentações do contas a receber que serão excluídas

      qryMovCRExcluir.Close;
      qryMovCRExcluir.ParamByName('NR_ANOSEMESTRE').AsInteger :=
            frm_Inscricoes_Planilha.qryInscricoesNR_ANOSEMESTRE.AsInteger;
      qryMovCRExcluir.ParamByName('CD_PESSOA').AsInteger :=
            frm_Inscricoes_Planilha.qryInscricoesCD_PESSOA.AsInteger;
      qryMovCRExcluir.ParamByName('NR_MES').AsInteger :=
            frm_Inscricoes_Planilha.qryInscricoesNR_MES.AsInteger;
      qryMovCRExcluir.Open;

      // Para atividades cujo configurações financeiras foram alteradas,
      // procura por taxa já existente com configurações compatíveis para
      // criar novo vínculo

      qryVinculaInscricao.ParamByName('NR_ANOSEMESTRE').AsInteger :=
            frm_Inscricoes_Planilha.qryInscricoesNR_ANOSEMESTRE.AsInteger;
      qryVinculaInscricao.ParamByName('CD_PESSOA').AsInteger :=
            frm_Inscricoes_Planilha.qryInscricoesCD_PESSOA.AsInteger;
      qryVinculaInscricao.ParamByName('NR_MES').AsInteger :=
            frm_Inscricoes_Planilha.qryInscricoesNR_MES.AsInteger;
      qryVinculaInscricao.ExecSQL;

      // Resgata as informações do plano de descontos

      qryPlanosDescontos.Close;
      qryPlanosDescontos.ParamByName('NR_ANOSEMESTRE').AsInteger :=
            frm_Inscricoes_Planilha.qryInscricoesNR_ANOSEMESTRE.AsInteger;
      qryPlanosDescontos.ParamByName('CD_TIPO_PESSOA').AsInteger :=
            frm_Inscricoes_Planilha.qryInscricoesCD_TIPO_PESSOA.AsInteger;
      qryPlanosDescontos.ParamByName('CD_PESSOA').AsInteger :=
            frm_Inscricoes_Planilha.qryInscricoesCD_PESSOA.AsInteger;
      qryPlanosDescontos.ParamByName('NR_MES').AsInteger :=
            frm_Inscricoes_Planilha.qryInscricoesNR_MES.AsInteger;
      qryPlanosDescontos.Open;

      // Calcula o valor líquido da inscrição para verificar se há necessidade
      // de criação da taxa de inscrição no financeiro

      Descontos :=
            frm_Inscricoes_Planilha.qryInscricoesVL_TOTAL.AsFloat / 100 *
            qryPlanosDescontosVL_PERCENTUAL.AsFloat +
            qryPlanosDescontosVL_DESCONTO_FIXO.AsFloat;
            
      Liquido := frm_Inscricoes_Planilha.qryInscricoesVL_TOTAL.AsFloat -
            Descontos;

      if Liquido > 0 then
      begin

         // Recupera o código do responsável financeiro

         qryRespFinan.Close;
         qryRespFinan.ParamByName('CD_PESSOA').AsInteger :=
               frm_Inscricoes_Planilha.qryInscricoesCD_PESSOA.AsInteger;
         qryRespFinan.Open;

         // Recuperar as parcelas de mensalidade que já possuem vinculo com o
         // sistema financeiro para realizar a atualização dos valores

         qryMensAlterar.Close;
         qryMensAlterar.ParamByName('NR_ANOSEMESTRE').AsInteger :=
               frm_Inscricoes_Planilha.qryInscricoesNR_ANOSEMESTRE.AsInteger;
         qryMensAlterar.ParamByName('CD_PESSOA').AsInteger :=
               frm_Inscricoes_Planilha.qryInscricoesCD_PESSOA.AsInteger;
         qryMensAlterar.ParamByName('NR_MES').AsInteger :=
               frm_Inscricoes_Planilha.qryInscricoesNR_MES.AsInteger;
         qryMensAlterar.Open;

         while not qryMensAlterar.Eof do
         begin

            // Calcula o valor de desconto e líquido da parcela do financeiro

            Descontos :=
                  qryMensAlterarVL_BRUTO.AsFloat / 100 * (
                  qryPlanosDescontosVL_PERCENTUAL.AsFloat + 100 *
                  qryPlanosDescontosVL_DESCONTO_FIXO.AsFloat /
                  frm_Inscricoes_Planilha.qryInscricoesVL_TOTAL.AsFloat
            );

            Liquido := qryMensAlterarVL_BRUTO.AsFloat - Descontos;

            qryMensalidades.Close;
            qryMensalidades.ParamByName('CD_MENSALIDADE').AsInteger :=
                  qryMensAlterarCD_MENSALIDADE.AsInteger;
            qryMensalidades.Open;
            qryMensalidades.Edit;

            if TryStrToInt(Depto, I) then
               qryMensalidadesDEPTO.AsInteger := I;

            qryMensalidadesCURSO.AsString := Curso;
            qryMensalidadesDATAEMISSAO.AsDateTime := DataHoje;
            qryMensalidadesDATAVENCIMENTO.AsDateTime := DataVencto;
            qryMensalidadesVALORBRUTO.AsFloat := qryMensAlterarVL_BRUTO.AsFloat;
            qryMensalidadesVALORDESCONTO.AsFloat := Descontos;
            qryMensalidadesDESCONTOEXTRA.AsFloat := 0;
            qryMensalidadesVALOREXTRA.AsFloat := 0;
            qryMensalidadesVALORTOTAL.AsFloat := Liquido;
            qryMensalidadesVALORJUROS.AsFloat := 0;
            qryMensalidadesSITUACAO.AsInteger := 2;
            qryMensalidadesUSUARIO.AsString := DM.qryLogonCD_PESSOA.AsString;
            qryMensalidadesBLOQUETO.AsString := 'N';
            qryMensalidadesANOSEMESTRE.AsInteger :=
                  frm_Inscricoes_Planilha.qryInscricoesNR_ANOSEMESTRE.AsInteger;
            qryMensalidadesTIPOPARCELA.AsInteger := 0;
            qryMensalidadesCD_RESP.AsInteger :=
                  qryRespFinanCD_RESP.AsInteger;
            qryMensalidadesINDICECORRECAO.AsFloat := 0;
            qryMensalidadesDATABASECORRECAO.AsDateTime := DataBaseCorr;
            qryMensalidadesSN_CREDITO_PARCELA.AsString := 'N';
            qryMensalidadesCD_TIPO_TITULO.AsInteger :=
                  qryMensAlterarCD_TIPO_TITULO.AsInteger;
            qryMensalidadesCD_CENTRO_CUSTO.AsInteger :=
                  qryMensAlterarCD_CENTRO.AsInteger;
            qryMensalidadesCD_COLIGADA.AsInteger :=
                  qryMensAlterarCD_COLIGADA.AsInteger;
            qryMensalidadesCD_PLANO_CONTA.AsInteger :=
                  qryMensAlterarCD_CONTA.AsInteger;

            if DataVencto < Date then
            begin
               qryMensalidadesDT_COMPETENCIA.AsDateTime := Date;
            end
            else
            begin
               qryMensalidadesDT_COMPETENCIA.AsDateTime := DataBaseCorr;
            end;

            if qryMensAlterards_tipo_titulo.IsNull then
            begin
               qryMensalidadesDS_HISTORICO.AsString := '';
            end else begin
               qryMensalidadesDS_HISTORICO.AsString :=
                  qryMensAlterards_tipo_titulo.AsString;
            end;

            qryMensalidades.Post;

            qryMensAlterar.Next;
         end;

         // Resgata informações das atividades matriculadas para o aluno para
         // as quais não foram geradas taxas financeiras ou as configurações
         // financeiras da atividades foram alteradas

         qryMensIncluir.Close;
         qryMensIncluir.ParamByName('NR_ANOSEMESTRE').AsInteger :=
               frm_Inscricoes_Planilha.qryInscricoesNR_ANOSEMESTRE.AsInteger;
         qryMensIncluir.ParamByName('CD_PESSOA').AsInteger :=
               frm_Inscricoes_Planilha.qryInscricoesCD_PESSOA.AsInteger;
         qryMensIncluir.ParamByName('NR_MES').AsInteger :=
               frm_Inscricoes_Planilha.qryInscricoesNR_MES.AsInteger;
         qryMensIncluir.Open;

         while not qryMensIncluir.Eof do
         begin

            // Calcula os descontos sobre o valor da parcela e verifica se há
            // necessidade de geração de parcela financeira

            Descontos :=
                  qryMensIncluirVL_BRUTO.AsFloat / 100 * (
                  qryPlanosDescontosVL_PERCENTUAL.AsFloat + 100 *
                  qryPlanosDescontosVL_DESCONTO_FIXO.AsFloat /
                  frm_Inscricoes_Planilha.qryInscricoesVL_TOTAL.AsFloat
            );
            Liquido := qryMensIncluirVL_BRUTO.AsFloat - Descontos;

            if Liquido > 0 then
            begin

               // Abre, se necessário, e coloca a query em modo de inserção
               // Preenche os registros com as informações referentes à taxa
               // de inscrição da atividade extra-curricular
            
               if not qryMensalidades.Active then
                  qryMensalidades.Open;

               qryMensalidades.Insert;

               qryMensalidadesTURMA.AsString := Turma;
               qryMensalidadesCURSO.AsString := Curso;

               // Verifica se é possível calcular o nosso número de acordo com o
               // departamento configurado para o financeiro do extra-curricular

               if TryStrToInt(Depto, I) then
               begin
                  qryMensalidadesDEPTO.AsInteger := I;
                  qryMensalidadesNOSSONUMERO.AsString := DM.CreateNossoNumero(
                     Turma, I,
                  frm_Inscricoes_Planilha.qryInscricoesNR_ANOSEMESTRE.AsInteger,
                  frm_Inscricoes_Planilha.qryInscricoesCD_PESSOA.AsInteger)
               end
               else
                  qryMensalidadesDEPTO.Clear;

               qryMensalidadesCODIGOALUNO.AsInteger :=
                     frm_Inscricoes_Planilha.qryInscricoesCD_PESSOA.AsInteger;
               qryMensalidadesPARCELA.AsInteger :=
                     qryMensIncluirNR_PARCELA.AsInteger;
               qryMensalidadesDATAEMISSAO.AsDateTime := DataHoje;
               qryMensalidadesVALORBRUTO.AsFloat :=
                     qryMensIncluirVL_BRUTO.AsFloat;
               qryMensalidadesVALORDESCONTO.AsFloat := Descontos;
               qryMensalidadesDESCONTOEXTRA.AsFloat := 0;
               qryMensalidadesVALOREXTRA.AsFloat := 0;
               qryMensalidadesVALORTOTAL.AsFloat := Liquido;
               qryMensalidadesVALORJUROS.AsFloat := 0;
               qryMensalidadesSITUACAO.AsInteger := 2;

               if DataVencto < Date then
               begin
                  qryMensalidadesDT_COMPETENCIA.AsDateTime := Date;
               end
               else
               begin
                  qryMensalidadesDT_COMPETENCIA.AsDateTime := DataBaseCorr;
               end;
               
               qryMensalidadesUSUARIO.AsString := DM.qryLogonCD_PESSOA.AsString;
               qryMensalidadesBLOQUETO.AsString := 'N';
               qryMensalidadesANOSEMESTRE.AsInteger :=
                  frm_Inscricoes_Planilha.qryInscricoesNR_ANOSEMESTRE.AsInteger;
               qryMensalidadesTIPOPARCELA.AsInteger := 0;
               qryMensalidadesCD_RESP.AsInteger :=
                     qryRespFinanCD_RESP.AsInteger;
               qryMensalidadesINDICECORRECAO.AsFloat := 0;
               qryMensalidadesDATAVENCIMENTO.AsDateTime := DataVencto;

               qryMensalidadesDATABASECORRECAO.AsDateTime := DataBaseCorr;
               qryMensalidadesSN_CREDITO_PARCELA.AsString := 'N';
               qryMensalidadesCD_MENSALIDADE_ORIGEM.AsInteger := -1;
               qryMensalidadesCD_TIPO_TITULO.AsInteger :=
                     qryMensIncluirCD_TIPO_TITULO.AsInteger;

               if ( qryMensIncluirds_tipo_titulo.IsNull ) then
                  qryMensalidadesDS_HISTORICO.AsString := ''
               else
                  qryMensalidadesDS_HISTORICO.AsString := qryMensIncluirds_tipo_titulo.AsString;

               qryMensalidadesCD_CENTRO_CUSTO.AsInteger :=
                     qryMensIncluirCD_CENTRO.AsInteger;
               qryMensalidadesCD_COLIGADA.AsInteger :=
                     qryMensIncluirCD_COLIGADA.AsInteger;
               qryMensalidadesCD_PLANO_CONTA.AsInteger :=
                     qryMensIncluirCD_CONTA.AsInteger;
               qryMensalidades.Post;

               Mnsaldade := DM.LastInsert;

               // Atualiza o vínculo das matrículas nas atividades
               // extra-curriculares com as parcelas geradas no financeiro

               qryVinculaMens.ParamByName('NR_ANOSEMESTRE').AsInteger :=
                  frm_Inscricoes_Planilha.qryInscricoesNR_ANOSEMESTRE.AsInteger;
               qryVinculaMens.ParamByName('CD_PESSOA').AsInteger :=
                     frm_Inscricoes_Planilha.qryInscricoesCD_PESSOA.AsInteger;
               qryVinculaMens.ParamByName('NR_MES').AsInteger :=
                     frm_Inscricoes_Planilha.qryInscricoesNR_MES.AsInteger;
               qryVinculaMens.ParamByName('CD_MENSALIDADE').AsInteger :=
                     Mnsaldade;
               qryVinculaMens.ExecSQL;

               // Corrige o código de mensalidade de origem

               qryMensalidades.Close;
               qryMensalidades.ParamByName('CD_MENSALIDADE').AsInteger :=
                     Mnsaldade;
               qryMensalidades.Open;
               qryMensalidades.Edit;
               qryMensalidadesCD_MENSALIDADE_ORIGEM.AsInteger := Mnsaldade;
               qryMensalidades.Post;

               // Gera movimentações do contas a receber

               qryCriaMovCR.ParamByName('CD_MENSALIDADE').AsInteger :=
                     Mnsaldade;
               qryCriaMovCR.ParamByName('CD_ACAO').AsInteger :=
                     DM.BuscarCodigoAcaoPadrao(10);
               qryCriaMovCR.ParamByName('VL_ENTRADA').AsFloat := Liquido;
               qryCriaMovCR.ParamByName('CD_USUARIO').AsInteger :=
                     DM.qryLogonCD_PESSOA.AsInteger;
               qryCriaMovCR.ExecSQL;

            end;
            qryMensIncluir.Next;
         end;

         // Exclui as movimentações no contas a receber para as parcelas
         // que serão excluídas

         qryMovCRExcluir.Last;

         while not qryMovCRExcluir.Bof do
            qryMovCRExcluir.Delete;

         // Realiza a exclusão das mensalidades que perderam vínculos com
         // incrições do extra-curriculares e registro log das ações

         qryMensExcluir.Last;

         while not qryMensExcluir.Bof do
         begin
            
            // Primeiramente realiza a exclusão da parcela de mensalidade

            qryMensExcluir.Delete;

            // Cria a observação e a chave para geração dos logs

            ObsLog := Format(SObsLog, [qryMensExcluirNOSSONUMERO.AsString]);

            I := Length(qryMensExcluirCODIGOALUNO.AsString);
            S := StringOfChar(#48, 10 - I);
            ChaveLog := Format(SChaveLog, [S,
                  qryMensExcluirANOSEMESTRE.AsInteger,
                  qryMensExcluirTURMA.AsString,
                  qryMensExcluirPARCELA.AsInteger,
                  DateToStr(qryMensExcluirDATAVENCIMENTO.AsDateTime)]);

            // Insere logs de exclusão no banco de dados

            qryGeraLog.ParamByName('CD_USUARIO').AsInteger :=
                  DM.qryLogonCD_PESSOA.AsInteger;
            qryGeraLog.ParamByName('DS_LOG').AsString := ObsLog;
            qryGeraLog.ParamByName('CD_CHAVE').AsString := ChaveLog;
            qryGeraLog.ExecSQL;

            qryGeraLogGeral.ParamByName('CD_USUARIO').AsInteger :=
                  DM.qryLogonCD_PESSOA.AsInteger;
            qryGeraLogGeral.ParamByName('CD_CHAVE').AsString := ChaveLog;
            qryGeraLogGeral.ParamByName('DS_OBSERVACOES').AsString := ChaveLog;
            qryGeraLogGeral.ParamByName('CD_COLIGADA').AsInteger :=
                  qryMensExcluirCD_COLIGADA.AsInteger;
            qryGeraLogGeral.ExecSQL;

         end;
      end;

      Application.ProcessMessages;
      frm_Inscricoes_Planilha.qryInscricoes.Next;

      // Se ainda é a mesma pessoa que está sendo varrida então incrementa o mes, senão reinicia o mês
      if cdUltimaPessoa = frm_Inscricoes_Planilha.qryInscricoesCD_PESSOA.AsInteger then
      begin
         DataVencto := IncMonth(DataVencto, 1);
         DecodeDate(DataVencto, Y, M, D);
         DataBaseCorr := EncodeDate(Y, M, 1);
      end else begin
         DataVencto := mcalDataVencto.Date;
         DecodeDate(DataVencto, Y, M, D);
         DataBaseCorr := EncodeDate(Y, M, 1);
      end;

   end;
end;

procedure TfGerarMens.qryRespFinanCalcFields(DataSet: TDataSet);
begin
   if qryRespFinanCD_RESP_FINAN.AsInteger <> 0 then
      qryRespFinanCD_RESP.AsInteger := qryRespFinanCD_RESP_FINAN.AsInteger
   else
      qryRespFinanCD_RESP.AsInteger := qryRespFinanCD_PESSOA.AsInteger;
end;

end.
