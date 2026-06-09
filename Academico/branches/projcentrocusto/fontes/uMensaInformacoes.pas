unit uMensaInformacoes;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Mask, DBCtrls, Buttons, ExtCtrls, ComCtrls, Grids, DBGrids,
  DB, ZConnection, General, ZAbstractRODataset, ZAbstractDataset, ZDataset, UZDataset;

type
  TfrmMensaInformacoes = class(TForm)
    BitBtn1: TBitBtn;
    Panel3: TPanel;
    PageControl1: TPageControl;
    tsDetalhes: TTabSheet;
    tsMovimento: TTabSheet;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    Label8: TLabel;
    Label9: TLabel;
    Label10: TLabel;
    Label13: TLabel;
    Label14: TLabel;
    Label16: TLabel;
    Label20: TLabel;
    Label23: TLabel;
    Label24: TLabel;
    Label25: TLabel;
    Label27: TLabel;
    Label28: TLabel;
    Label30: TLabel;
    Label31: TLabel;
    DBText3: TDBText;
    DBText4: TDBText;
    DBText5: TDBText;
    DBText6: TDBText;
    DBText7: TDBText;
    DBText8: TDBText;
    DBText9: TDBText;
    DBText10: TDBText;
    DBText11: TDBText;
    DBText12: TDBText;
    DBText13: TDBText;
    DBText14: TDBText;
    DBText15: TDBText;
    DBText16: TDBText;
    DBText17: TDBText;
    DBText18: TDBText;
    DBText19: TDBText;
    DBText20: TDBText;
    DBText21: TDBText;
    DBText22: TDBText;
    Label11: TLabel;
    DBText30: TDBText;
    DBGrid1: TDBGrid;
    qyMovimento: TUMZQuery;
    qyMovimentods_acao: TStringField;
    qyMovimentocd_mensalidade: TIntegerField;
    qyMovimentonr_sequencia: TIntegerField;
    qyMovimentodt_movimento: TDateTimeField;
    qyMovimentovl_entrada: TFloatField;
    qyMovimentovl_saida: TFloatField;
    qyMovimentovl_multa: TFloatField;
    qyMovimentovl_juros: TFloatField;
    qyMovimentovl_desconto: TFloatField;
    qyMovimentovl_liquido: TFloatField;
    qyMovimentocd_movimento_te: TIntegerField;
    qyMovimentods_observacao: TMemoField;
    dsMovimento: TDataSource;
    qyMovimentomulta_juros: TCurrencyField;
    Panel1: TPanel;
    Label12: TLabel;
    DBMemo1: TDBMemo;
    btnCancelar: TSpeedButton;
    qyMovimentocd_tipo_acao: TSmallintField;
    sgCheques: TStringGrid;
    pnTitulo: TPanel;
    Label1: TLabel;
    DBText1: TDBText;
    DBText2: TDBText;
    Label15: TLabel;
    Label17: TLabel;
    DBText23: TDBText;
    DBText24: TDBText;
    qyMovimentocd_coligada: TSmallintField;
    qyMovimentocd_usuario: TIntegerField;
    qyMovimentoUSUARIO: TStringField;
    Label18: TLabel;
    DBText25: TDBText;
    Label19: TLabel;
    DBText26: TDBText;
    qyMovimentocd_acao: TLargeintField;
    tsEstorno: TTabSheet;
    Label21: TLabel;
    label22: TLabel;
    Label26: TLabel;
    Label29: TLabel;
    dbBaixa: TDBText;
    dbDtEstorno: TDBText;
    qryEstorno: TUMZQuery;
    dsEstorno: TDataSource;
    qryEstornonm_pessoa: TStringField;
    qryEstornodt_baixa: TDateTimeField;
    qryEstornodt_estorno: TDateTimeField;
    qryEstornods_estorno: TMemoField;
    qryEstornods_caixa: TStringField;
    lblUsuario: TLabel;
    dbUser: TDBText;
    lblCaixa: TLabel;
    lblDescricao: TLabel;
    TsBiblioteca: TTabSheet;
    qyMultaBib: TUMZQuery;
    dsBibMulta: TDataSource;
    DBGrid2: TDBGrid;
    qyMultaBibtx_motivo_isencao: TMemoField;
    qyMultaBibds_codigo_barras: TStringField;
    qyMultaBibds_titulo: TStringField;
    qyMultaBibds_situacao: TStringField;
    qyMultaBibdt_emprestimo: TDateTimeField;
    qyMultaBibdt_devolucao: TDateTimeField;
    qyMultaBibdt_entrega: TDateTimeField;
    procedure qyMultaBibtx_motivo_isencaoGetText(Sender: TField;
      var Text: string; DisplayText: Boolean);
    procedure btnCancelarClick(Sender: TObject);
    procedure qyMovimentoCalcFields(DataSet: TDataSet);
    procedure FormShow(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    { Private declarations }
    Procedure CarregarCheques;
  public
    { Public declarations }
  end;

var
  frmMensaInformacoes: TfrmMensaInformacoes;

implementation

uses uMensalidades, uUsuario, uDM;

{$R *.dfm}

procedure TfrmMensaInformacoes.BitBtn1Click(Sender: TObject);
begin
   close;
end;

procedure TfrmMensaInformacoes.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
   Action := caFree;
end;

procedure TfrmMensaInformacoes.FormShow(Sender: TObject);
begin

   TsBiblioteca.TabVisible := False;

   //Verifica se esta mensalidade esta vinculada a uma multa da biblioteca.
   try
      qyMultaBib.SQL.Text :=
         'SELECT bm.tx_motivo_isencao, bte.ds_codigo_barras, bt.ds_titulo,            ' +
         '   bs.ds_situacao, be.dt_emprestimo, be.dt_devolucao, be.dt_entrega         ' +
         'FROM bib_multas bm                                                          ' +
         'INNER JOIN bib_emprestimos be ON (be.cd_emprestimo = bm.cd_emprestimo)      ' +
         'INNER JOIN bib_titulos_exemplares bte ON (be.cd_exemplar = bte.cd_exemplar) ' +
         'INNER JOIN bib_titulos bt ON (bt.cd_titulo = bte.cd_titulo)                 ' +
         'INNER JOIN bib_situacoes bs ON (bs.cd_situacao = bm.cd_situacao)            ' +
         'WHERE bm.cd_mensalidade = :cd_mensalidade                                   ';
      
      qyMultaBib.ParamByName('cd_mensalidade').AsInteger :=
         frmMensalidades.tblMensalidades.FieldByName('cd_mensalidade').AsInteger;

      qyMultaBib.Open;

      if (qyMultaBib.RecordCount > 0) then
      begin
         TsBiblioteca.TabVisible := True;
      end;
      
   except
      //Cliente não possui biblioteca, não faz nada.
   end;

   PageControl1.ActivePageIndex := 0;

   with qyMovimento do begin
       Close();
       ParamByName('CdMensalidade').AsInteger := frmMensalidades.tblMensalidadescd_mensalidade_origem.AsInteger;
       Open();
   end;

   qryEstorno.Close;
   qryEstorno.ParamByName('cd_mensalidade').AsInteger := frmMensalidades.tblMensalidadescd_mensalidade.AsInteger;
   qryEstorno.Open;

   if qryEstorno.RecordCount = 0 then
   begin
     PageControl1.Pages[2].TabVisible    := false;
   end
   else
   begin
     lblCaixa.Caption     := qryEstornods_caixa.AsString;
     lblDescricao.Caption := qryEstornods_estorno.AsString;
   end;
   
   
   CarregarCheques;

end;

procedure TfrmMensaInformacoes.qyMovimentoCalcFields(DataSet: TDataSet);
begin
   qyMovimentomulta_juros.AsCurrency := qyMovimentovl_multa.AsCurrency +
                                        qyMovimentovl_juros.AsCurrency;
end;

procedure TfrmMensaInformacoes.qyMultaBibtx_motivo_isencaoGetText(
  Sender: TField; var Text: string; DisplayText: Boolean);
begin
   Text := Copy(qyMultaBibtx_motivo_isencao.AsString, 1, 75);
end;

procedure TfrmMensaInformacoes.btnCancelarClick(Sender: TObject);
var
   cValorSaida, cValorJuros : Currency;
   qyAcao : TUMZQuery;
   NovoDesconto : double;
   sChave, log: String;
begin
   // Pegar os valores do Movimento;

   if not DM.UsuarioLogado.TemPermissao(2047, npAcesso, True ) then Exit;

   cValorSaida := qyMovimentovl_saida.AsCurrency;
   cValorJuros := qyMovimentovl_juros.AsCurrency;

   // Testar Bloqueio

   if DM.EstaBloqueado(frmMensalidades.tblMensalidadesDataVencimento.AsDateTime, true) then Exit;

   if NOT (frmMensalidades.tblMensalidadesSituacao.AsInteger in [2,10]) then begin
      if DM.EstaBloqueado(frmMensalidades.tblMensalidadesDataPagamento.AsDateTime, true) then Exit;
   end;

   Dm.CriarConsulta(qyAcao);

   if frmMensalidades.tblMensalidadesSituacao.AsInteger in [0,1] then begin
      Mensagem('Para cancelar um título pago, utilize a opção ESTORNAR.', 'Atenção', MB_OK + MB_ICONWARNING);
      Exit;
   end;

   Case qyMovimentocd_tipo_acao.AsInteger of

      1 : begin
           Mensagem('Para cancelar um pagamento, utilize a opção ESTORNAR.', 'Atenção', MB_OK + MB_ICONWARNING);
           Exit;

      end;

      2 : begin  // Baixa Por Cancelamento ou Desconto

           if Mensagem('Esta ação irá colocar a parcela como Pendente. Tem certeza que deseja continuar?', 'Atenção', MB_YESNOCANCEL + MB_ICONQUESTION) <> mrYES then begin
              Exit;
           end;

           qyAcao.Close;
           qyAcao.SQL.Clear;
           qyAcao.SQL.Add(
             ' UPDATE Mensalidades     '  +
             ' SET situacao = 2,  valorpago = null, datapagamento = null, valordesconto = valordesconto_fixo' +
             ' WHERE cd_mensalidade = :CdMensalidade '
           );

           qyAcao.ParamByName('CdMensalidade').AsInteger := frmMensalidades.tblMensalidadescd_mensalidade.AsInteger;
           qyAcao.ExecSQL();

           sChave := frmMensalidades.tblMensalidadescd_mensalidade.AsString;

           Dm.setLog(2014, 'Exclusao', sChave, frmMensalidades.tblMensalidadescd_coligada.AsInteger, 'Estorno do Cancelamento');


      end;

      3 : begin  // Baixa Por Desconto

           if Mensagem('Esta ação irá colocar a parcela como Pendente e estornará o desconto concedido. Tem certeza que deseja continuar?', 'Atenção', MB_YESNOCANCEL + MB_ICONQUESTION) <> mrYES then begin
              Exit;
           end;

           // Pegar o Valor para atual na tabela de movimentações...

           qyAcao.Close;
           qyAcao.SQL.Clear;
           qyAcao.SQL.Add(
             ' SELECT SUM(m.vl_saida) ValSaida, me.valordesconto, me.descontoextra, me.valorbruto FROM fin_mov_cr m, fin_acoes_movimento a, mensalidades me ' +
             ' WHERE m.cd_acao = a.cd_acao AND  me.cd_mensalidade_origem = m.cd_mensalidade AND ' +
             '    m.cd_mensalidade = :CdMensalidade AND a.cd_tipo_acao = 3 ' +
             ' GROUP BY me.cd_mensalidade '
           );

           qyAcao.ParamByName('CdMensalidade').AsInteger := frmMensalidades.tblMensalidadescd_mensalidade_origem.AsInteger;
           qyAcao.Open;

           log := 'Cancelamento do desconto '+qyMovimentods_acao.AsString+' no valor de R$'+qyMovimentovl_saida.AsString; 

           cValorSaida := qyAcao.FieldByName('ValSaida').AsCurrency - cValorSaida;

           if qyAcao.FieldByName('valordesconto').AsCurrency > 0 then begin

              if Mensagem('Atenção:' + CHR(13) + CHR(13) +
                          'O estudante possui um desconto condicional para este título.' + CHR(13) + 
                          'Você deseja aumentar este desconto proporcionalmente após a retirada do desconto fixo?',
                          'UNIMESTRE', MB_YESNO + MB_ICONWARNING) = MrYes
              then begin
                 NovoDesconto := qyAcao.FieldByName('valordesconto').AsCurrency  / (qyAcao.FieldByName('valorbruto').AsCurrency - qyAcao.FieldByName('descontoextra').AsCurrency);

                 NovoDesconto := NovoDesconto * (qyAcao.FieldByName('valorbruto').AsCurrency - (qyAcao.FieldByName('descontoextra').AsCurrency - qyMovimentovl_saida.AsCurrency));
              end else begin

                 NovoDesconto := qyAcao.FieldByName('valordesconto').AsCurrency;

              end;



           end;


           qyAcao.Close;
           qyAcao.SQL.Clear;
           qyAcao.SQL.Add(
             ' UPDATE Mensalidades     '  +
             ' SET situacao = 2,  valorpago = null, datapagamento = null,  ' +
             '  descontoextra = :VlDesconto                                ');

           if NovoDesconto > 0 then begin

              qyAcao.SQL.Add( ', valordesconto = :NovoDesconto ');

              qyAcao.ParamByName('NovoDesconto').AsCurrency :=  NovoDesconto;

           end;

           qyAcao.SQL.Add(

             ' WHERE cd_mensalidade = :CdMensalidade                       '
           );


           qyAcao.ParamByName('CdMensalidade').AsInteger := frmMensalidades.tblMensalidadescd_mensalidade.AsInteger;
           qyAcao.ParamByName('VlDesconto').AsCurrency := cValorSaida;
           qyAcao.ExecSQL();

           sChave := frmMensalidades.tblMensalidadescd_mensalidade.AsString;

            DM.gerar_log( 10,
               'Alterado parcela '+IntToStr(frmMensalidades.tblMensalidadesParcela.AsInteger)+'.'+chr(13)+log,
               DM.iCdPessoaLogado,
                  frmMensalidades.tblMensalidades.FieldByName('cd_mensalidade').AsString
            );

      end


      Else begin

         Mensagem('Este movimento só pode ser cancelado com a Exclusão do título.', 'Atenção', MB_OK);
         Exit;

      end
   end;

   qyAcao.Close;
   qyAcao.SQL.Clear;
   qyAcao.SQL.Add(
     ' DELETE FROM fin_mov_cr '  +
     '  WHERE cd_mensalidade = :CdMensalidade ' +
     '    AND nr_sequencia = :NrSequencia ' +
     '    AND cd_coligada = :CdColigada '
   );
   qyAcao.ParamByName('CdMensalidade').AsInteger := qyMovimentocd_mensalidade.AsInteger;
   qyAcao.ParamByName('NrSequencia').AsInteger := qyMovimentonr_sequencia.AsInteger;
   qyAcao.ParamByName('CdColigada').AsInteger := qyMovimentocd_coligada.AsInteger;
   qyAcao.ExecSQL();

   qyMovimento.Close();
   qyMovimento.Open();

   frmMensalidades.Filtra;

end;

procedure TfrmMensaInformacoes.CarregarCheques;
begin
   // Selecionar os cheques e colocar no string grid;

   DM.qyAux2.Close;
   DM.qyAux2.SQL.Clear;
   DM.qyAux2.SQL.Add(
      ' SELECT c.*, s.ds_sigla  ' +
      ' FROM fin_cheques c, fin_cheques_mensalidades cm, situacoes s '+
      ' WHERE c.cd_cheque = cm.cd_cheque AND c.cd_situacao = s.cd_situacao ' +
      '  AND s.cd_modulo = 2050 AND cm.cd_mensalidade = :CdMensalidade '
   );

   DM.qyAux2.ParamByName('CdMensalidade').AsInteger := frmMensalidades.tblMensalidadescd_mensalidade.AsInteger;

   Dm.qyAux2.Open;

   sgCheques.RowCount := 7;
   sgCheques.ColCount := 1;

   sgCheques.Cells[0, 0] := 'CH Banco';
   sgCheques.Cells[0, 1] := 'CH Agência';
   sgCheques.Cells[0, 2] := 'CH CC';
   sgCheques.Cells[0, 3] := 'CH Nro';
   sgCheques.Cells[0, 4] := 'CH Valor';
   sgCheques.Cells[0, 5] := 'CH Data';
   sgCheques.Cells[0, 6] := 'CH Sit.';

   sgCheques.ColWidths[0] := 87;

   while not DM.qyAux2.Eof do begin
       sgCheques.ColCount := sgCheques.ColCount + 1;

       sgCheques.Cells[sgCheques.ColCount-1, 0] := DM.qyAux2.FieldByName('ds_banco').AsString;
       sgCheques.Cells[sgCheques.ColCount-1, 1] := DM.qyAux2.FieldByName('ds_agencia').AsString;
       sgCheques.Cells[sgCheques.ColCount-1, 2] := DM.qyAux2.FieldByName('ds_conta').AsString;
       sgCheques.Cells[sgCheques.ColCount-1, 3] := DM.qyAux2.FieldByName('ds_cheque').AsString;
       sgCheques.Cells[sgCheques.ColCount-1, 4] := FloatToStrF(DM.qyAux2.FieldByName('nr_valor').AsCurrency, ffNumber, 12, 2);
       sgCheques.Cells[sgCheques.ColCount-1, 5] := FormatDateTime('dd/mm/yyyy',DM.qyAux2.FieldByName('dt_compensacao').AsDateTime);
       sgCheques.Cells[sgCheques.ColCount-1, 6] := DM.qyAux2.FieldByName('ds_sigla').AsString;
       sgCheques.ColWidths[sgCheques.ColCount-1] := 65;

       DM.qyAux2.Next;
   end;

end;

end.

