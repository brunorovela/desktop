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
    qyMovimentocd_acao_automatica: TIntegerField;
    lbDescCondicionalAceito: TLabel;
    lbDescCondicionalPerdido: TLabel;
    Bevel1: TBevel;
    qyMovimentovl_desconto_obs: TStringField;
    qyMovimentods_observacao_condicional: TStringField;
    qyMovimentosn_desc_condicional: TSmallintField;
    qyMovimentosituacao: TIntegerField;
    lbDescontoPrevisto: TLabel;
    qyMovimentovl_condicional_previsto: TFloatField;
    qyMovimentocd_mensalidade_origem: TIntegerField;
    qyMovimentodatavencimento: TDateTimeField;
    qyMovimentodatapagamento: TDateTimeField;
    qyMovimentoparcela: TSmallintField;
    procedure qyMultaBibtx_motivo_isencaoGetText(Sender: TField;
      var Text: string; DisplayText: Boolean);
    procedure btnCancelarClick(Sender: TObject);
    procedure qyMovimentoCalcFields(DataSet: TDataSet);
    procedure FormShow(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    procedure verificaPossuiAcaoMovimentoCondicional;
    procedure ajusteAcaoMensalidadeOrigem;
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
var
   qyAjustarOrigemMovimentacao: TUMZQuery;
begin
   // Atualiza o código da mensalidade de origem caso o mesmo for NULL
   ajusteAcaoMensalidadeOrigem();

   // Verifica se possui desconto condicional, sem ação de movimento vinculada,
   // Nesse caso cria uma ação automática de desconto condicional
   verificaPossuiAcaoMovimentoCondicional();

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

procedure TfrmMensaInformacoes.ajusteAcaoMensalidadeOrigem();
var
   qyAjustarOrigemMovimentacao: TUMZQUery;
begin
   DM.CriarConsulta(qyAjustarOrigemMovimentacao);

   // Verifica se a ação de movimento possui código de mensalidade origem
   qyAjustarOrigemMovimentacao.Close;
   qyAjustarOrigemMovimentacao.SQL.Text := 'UPDATE fin_mov_cr SET cd_mensalidade_origem = cd_mensalidade WHERE cd_mensalidade_origem IS NULL AND cd_mensalidade = :cd_mensalidade';
   qyAjustarOrigemMovimentacao.ParamByName('cd_mensalidade').AsInteger := frmMensalidades.tblMensalidadescd_mensalidade.AsInteger;
   qyAjustarOrigemMovimentacao.ExecSQL;

end;

procedure TfrmMensaInformacoes.verificaPossuiAcaoMovimentoCondicional();
var
   qyChecaAcaoMovimento: TUMZQUery;
begin
   DM.CriarConsulta(qyChecaAcaoMovimento);

   // Verifica se a mensalidade possui desconto condicional mas não possui ações de movimento condicionais
   qyChecaAcaoMovimento.Close;
   qyChecaAcaoMovimento.SQL.Text := ''+
   ' SELECT '+
   '     m.valordesconto vl_desconto, '+
   '     COALESCE(SUM(cr.vl_desconto), 0) vl_desconto_acoes, '+
   '     CASE WHEN m.situacao IN (2,10) THEN 1 ELSE 0 END sn_pendente '+
   ' FROM '+
   '  	mensalidades m '+
   '     LEFT JOIN fin_mov_cr cr ON (cr.cd_mensalidade_origem = m.cd_mensalidade AND cr.sn_desc_condicional = 1) '+
   ' WHERE '+
	'     m.cd_mensalidade = :cd_mensalidade '+
	' GROUP BY '+
   '     m.cd_mensalidade                    ';

   qyChecaAcaoMovimento.ParamByName('cd_mensalidade').AsInteger := frmMensalidades.tblMensalidadescd_mensalidade.AsInteger;
   qyChecaAcaoMovimento.Open;

   // Se a mensalidade possui desconto condicional e não possui ação de movimento para ele,
   // cria a ação de movimento de desconto condicional
   if (qyChecaAcaoMovimento.FieldByName('vl_desconto_acoes').AsCurrency = 0) and
      (qyChecaAcaoMovimento.FieldByName('vl_desconto').AsCurrency > 0) then
   begin
      // Criar ação de movimento condicional
      DM.criarAcaoAutomaticaDescontoCondicional(frmMensalidades.tblMensalidadescd_mensalidade.AsInteger, qyChecaAcaoMovimento.FieldByName('vl_desconto').AsCurrency);
   end;

   // Aplica a ação de desconto condicional se a situação da mensalidade for baixa ou baixa parcial
   if (qyChecaAcaoMovimento.FieldByName('sn_pendente').AsCurrency = 0) then
   begin
      DM.aplicaAcoesMovimentoDescontosCondicionais(frmMensalidades.tblMensalidadescd_mensalidade.AsInteger);
   end;

end;

procedure TfrmMensaInformacoes.qyMovimentoCalcFields(DataSet: TDataSet);
begin
   qyMovimentomulta_juros.AsCurrency := qyMovimentovl_multa.AsCurrency +
                                        qyMovimentovl_juros.AsCurrency;

   // Verifica se possui apenas o desconto previsto
   if (qyMovimentovl_condicional_previsto.AsCurrency > 0) and
      not (qyMovimentovl_desconto.AsCurrency > 0) then
   begin
      qyMovimentovl_desconto_obs.AsString := FormatFloat('###,###,#0.00', qyMovimentovl_condicional_previsto.AsCurrency) + ' ' +
                                             qyMovimentods_observacao_condicional.AsString;

   // Verifica se possui desconto condicional informado
   end else if qyMovimentovl_desconto.AsCurrency > 0 then
   begin
      qyMovimentovl_desconto_obs.AsString := FormatFloat('###,###,#0.00', qyMovimentovl_desconto.AsCurrency) + ' ' +
                                             qyMovimentods_observacao_condicional.AsString;
   end;
   
end;

procedure TfrmMensaInformacoes.qyMultaBibtx_motivo_isencaoGetText(
  Sender: TField; var Text: string; DisplayText: Boolean);
begin
   Text := Copy(qyMultaBibtx_motivo_isencao.AsString, 1, 75);
end;

procedure TfrmMensaInformacoes.btnCancelarClick(Sender: TObject);
var
   cValorSaida, cValorDesconto, cIndicePerc: Currency;
   qyAcao, qyAtualizarCondicional : TUMZQuery;
   NovoDesconto : double;
   sChave, log: String;
begin
   // Pegar os valores do Movimento;

   if not DM.UsuarioLogado.TemPermissao(2047, npAcesso, True ) then Exit;

   cValorSaida := qyMovimentovl_saida.AsCurrency;
   cValorDesconto := qyMovimentovl_desconto.AsCurrency;

   // Testar Bloqueio

   if DM.EstaBloqueado(qyMovimentodatavencimento.AsDateTime, true) then Exit;

   if NOT (qyMovimentoSituacao.AsInteger in [2,10]) then begin
      if DM.EstaBloqueado(qyMovimentoDataPagamento.AsDateTime, true) then Exit;
   end;

   Dm.CriarConsulta(qyAcao);
   DM.CriarConsulta(qyAtualizarCondicional);   

   // verifica se o usuário está removendo um desconto condicional e a mensalidade não esta pendente
   if (qyMovimentosn_desc_condicional.AsInteger = 1) and
      not (qyMovimentoSituacao.AsInteger in [2,10]) then
   begin
      Mensagem('Não é possível remover um desconto condicional de uma mensalidade que não está pendente.', 'Atenção', MB_OK);
      Exit;
   end;

   if qyMovimentoSituacao.AsInteger in [0,1] then begin
      Mensagem('Para cancelar um título pago, utilize a opção ESTORNAR.', 'Atenção', MB_OK + MB_ICONWARNING);
      Exit;
   end;

   if qyMovimentocd_tipo_acao.AsInteger = 1 then
   begin
      Mensagem('Para cancelar um pagamento, utilize a opção ESTORNAR.', 'Atenção', MB_OK + MB_ICONWARNING);
      Exit;
   end;

   if qyMovimentocd_tipo_acao.AsInteger = 2 then // Baixa Por Cancelamento ou Desconto
   begin
      // Baixa por negociação deve ser utilizada a opção correta.
      if qyMovimentocd_acao_automatica.AsInteger = 12 then begin
           Mensagem('Para desfazer uma negociação, acesse o botão Negociar e depois vá em Negociações Anteriores.', 'Atenção', MB_OK + MB_ICONWARNING);
           Exit;
        end;

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

        qyAcao.ParamByName('CdMensalidade').AsInteger := qyMovimentocd_mensalidade.AsInteger;
        qyAcao.ExecSQL();

        sChave := qyMovimentocd_mensalidade.AsString;

        Dm.setLog(2014, 'Exclusao', sChave, qyMovimentocd_coligada.AsInteger, 'Estorno do Cancelamento');
   end;

   // Baixa Por Desconto (FIXO)
   if (qyMovimentocd_tipo_acao.AsInteger = 3) and
      (qyMovimentosn_desc_condicional.AsInteger = 0) then
   begin
      if Mensagem('Esta ação irá colocar a parcela como Pendente e estornará o desconto concedido. Tem certeza que deseja continuar?', 'Atenção', MB_YESNOCANCEL + MB_ICONQUESTION) <> mrYES then begin
         Exit;
      end;

      // Pegar o Valor para atual na tabela de movimentações...

      qyAcao.Close;
      qyAcao.SQL.Clear;
      qyAcao.SQL.Add(
         ' SELECT SUM(m.vl_saida) ValSaida, me.valordesconto, me.descontoextra, (me.valorbruto + me.valorextra) valorbruto FROM fin_mov_cr m, fin_acoes_movimento a, mensalidades me ' +
         ' WHERE m.cd_acao = a.cd_acao AND  me.cd_mensalidade = m.cd_mensalidade_origem AND ' +
         '    m.cd_mensalidade_origem = :CdMensalidade AND a.cd_tipo_acao = 3 ' +
         ' GROUP BY me.cd_mensalidade '
      );

      qyAcao.ParamByName('CdMensalidade').AsInteger := qyMovimentocd_mensalidade.AsInteger;
      qyAcao.Open;

      log := 'Cancelamento do desconto fixo '+qyMovimentods_acao.AsString+' no valor de R$'+qyMovimentovl_saida.AsString; 

      cValorSaida := qyAcao.FieldByName('ValSaida').AsCurrency - cValorSaida;

      if qyAcao.FieldByName('valordesconto').AsCurrency > 0 then
      begin

         if Mensagem('Atenção:' + CHR(13) + CHR(13) +
                    'O estudante possui um desconto condicional para este título.' + CHR(13) +
                    'Você deseja aumentar este desconto proporcionalmente após a retirada do desconto fixo?',
                    'UNIMESTRE', MB_YESNO + MB_ICONWARNING) = MrYes
         then begin
            cIndicePerc := qyAcao.FieldByName('valordesconto').AsCurrency  / (qyAcao.FieldByName('valorbruto').AsCurrency - qyAcao.FieldByName('descontoextra').AsCurrency);

            NovoDesconto := RoundFloat(cIndicePerc * (qyAcao.FieldByName('valorbruto').AsCurrency - (qyAcao.FieldByName('descontoextra').AsCurrency - qyMovimentovl_saida.AsCurrency)), 2);

            // Recalcular o desconto condicional das ações de movimento da parcela
            DM.recalcularDescCondicionalAcoesMovimento(
               qyMovimentocd_mensalidade.AsInteger,
               qyAcao.FieldByName('valordesconto').AsCurrency,
               NovoDesconto
            );
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

      qyAcao.SQL.Add(' WHERE cd_mensalidade = :CdMensalidade ');

      qyAcao.ParamByName('CdMensalidade').AsInteger := qyMovimentocd_mensalidade.AsInteger;
      qyAcao.ParamByName('VlDesconto').AsCurrency := cValorSaida;
      qyAcao.ExecSQL();

      sChave := qyMovimentocd_mensalidade.AsString;
      DM.setLog(2014, 'Exclusao', sChave, qyMovimentocd_coligada.AsInteger, 'Alterado parcela '+IntToStr(qyMovimentoParcela.AsInteger)+'.'+chr(13)+log);
   end;

   // Baixa Por Desconto (CONDICIONAL)
   if (qyMovimentocd_tipo_acao.AsInteger = 3) and
      (qyMovimentosn_desc_condicional.AsInteger = 1) then
   begin
      if Mensagem('Esta ação irá colocar a parcela como Pendente e estornará o desconto concedido. Tem certeza que deseja continuar?', 'Atenção', MB_YESNOCANCEL + MB_ICONQUESTION) <> mrYES then begin
         Exit;
      end;

      // Pegar o Valor para atual na tabela de movimentações...

      qyAcao.Close;
      qyAcao.SQL.Clear;
      qyAcao.SQL.Add(
         ' SELECT SUM(m.vl_desconto) ValDesconto, me.valordesconto, me.descontoextra, me.valorbruto FROM fin_mov_cr m, fin_acoes_movimento a, mensalidades me ' +
         ' WHERE m.cd_acao = a.cd_acao AND  me.cd_mensalidade = m.cd_mensalidade_origem AND ' +
         '    m.cd_mensalidade_origem = :CdMensalidade AND a.cd_tipo_acao = 3 ' +
         ' GROUP BY me.cd_mensalidade '
      );

      qyAcao.ParamByName('CdMensalidade').AsInteger := qyMovimentocd_mensalidade.AsInteger;
      qyAcao.Open;

      log := 'Cancelamento do desconto condicional '+qyMovimentods_acao.AsString+' no valor de R$'+qyMovimentovl_desconto.AsString; 

      cValorDesconto := qyAcao.FieldByName('ValDesconto').AsCurrency - cValorDesconto;

      qyAcao.Close;
      qyAcao.SQL.Clear;
      qyAcao.SQL.Add(
         ' UPDATE Mensalidades     '  +
         ' SET ' +
         '  valordesconto = :VlDesconto                                ');

      qyAcao.SQL.Add(' WHERE cd_mensalidade = :CdMensalidade ');

      qyAcao.ParamByName('CdMensalidade').AsInteger := qyMovimentocd_mensalidade.AsInteger;
      qyAcao.ParamByName('VlDesconto').AsCurrency := cValorDesconto;
      qyAcao.ExecSQL();

      sChave := qyMovimentocd_mensalidade.AsString;
      DM.setLog(2014, 'Exclusao', sChave, qyMovimentocd_coligada.AsInteger, 'Alterado parcela '+IntToStr(qyMovimentoParcela.AsInteger)+'.'+chr(13)+log);
   end;   

   if (qyMovimentocd_tipo_acao.AsInteger <> 1) and
      (qyMovimentocd_tipo_acao.AsInteger <> 2) and
      (qyMovimentocd_tipo_acao.AsInteger <> 3) then
   begin
      Mensagem('Este movimento só pode ser cancelado com a Exclusão do título.', 'Atenção', MB_OK);
      Exit;
   end;

   qyAcao.Close;
   qyAcao.SQL.Clear;
   qyAcao.SQL.Add(
     ' DELETE FROM fin_mov_cr '  +
     '  WHERE cd_mensalidade = :CdMensalidade ' +
     '    AND cd_mensalidade_origem = :cd_mensalidade_origem ' +
     '    AND nr_sequencia = :NrSequencia ' +
     '    AND cd_coligada = :CdColigada '
   );
   qyAcao.ParamByName('CdMensalidade').AsInteger := qyMovimentocd_mensalidade_origem.AsInteger;
   qyAcao.ParamByName('NrSequencia').AsInteger := qyMovimentonr_sequencia.AsInteger;
   qyAcao.ParamByName('CdColigada').AsInteger := qyMovimentocd_coligada.AsInteger;
   qyAcao.ParamByName('cd_mensalidade_origem').AsInteger := qyMovimentocd_mensalidade.AsInteger;   
   qyAcao.ExecSQL();

   {
      Atualiza o desconto condicional se a mensalidade não estava pendente, ou seja,
      a mensalidade saiu de baixa por desconto para pendente, nesse caso atualiza o desconto condicional
      com base nas ações de movimento (se houverem)
   }
   if not (qyMovimento.FieldByName('situacao').AsInteger in [2, 10]) then
   begin
      qyAcao.Close;
      qyAcao.SQL.Clear;
      qyAcao.SQL.Add(
        ' SELECT SUM(vl_desconto) vl_soma_condicional FROM fin_mov_cr '  +
        '  WHERE cd_mensalidade = :cd_mensalidade ' +
        '    AND sn_desc_condicional = 1 '
      );
      qyAcao.ParamByName('cd_mensalidade').AsInteger := qyMovimento.FieldByName('cd_mensalidade').AsInteger;
      qyAcao.Open();

      if qyAcao.FieldByName('vl_soma_condicional').AsCurrency > 0 then
      begin
         qyAtualizarCondicional.Close;
         qyAtualizarCondicional.SQL.Clear;
         qyAtualizarCondicional.SQL.Add(
           ' UPDATE mensalidades SET valordesconto = :valordesconto '  +
           ' WHERE cd_mensalidade = :cd_mensalidade '
         );
         qyAtualizarCondicional.ParamByName('valordesconto').AsCurrency := qyAcao.FieldByName('vl_soma_condicional').AsCurrency;
         qyAtualizarCondicional.ParamByName('cd_mensalidade').AsInteger := qyMovimento.FieldByName('cd_mensalidade').AsInteger;
         qyAtualizarCondicional.ExecSQL();
      end;      
   end;

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

