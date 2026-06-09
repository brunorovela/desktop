unit uMensalidadesDivisao;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, StdCtrls, Grids, DBGrids, DB, ZConnection, Buttons, General, ZAbstractRODataset, ZAbstractDataset, ZDataset, UZDataset, uClassMovimento,
  Mask;

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

procedure TfrmMensalidadesDivisao.btnConfirmarClick(Sender: TObject);
Var
   percResp : Currency;
   percAlun : Currency;
   n : Integer;
   chaves : String;

   iNovaMensalidade : Integer;
   mvDesc : TMovimento;
   qDesc : TUMZQuery;
begin
  // Confirmou a divisão dos títulos

  if Trim(edCodigoResp.Text) = '' then Begin

     Mensagem('Você precisa selecionar um responsável para este título.', 'UNIMESTRE', MB_OK + MB_ICONWARNING);

     Exit;

  end;


  try
     percResp := StrToCurr(edPercentual.Text);
     if ((percResp <= 0) OR (percResp > 100)) then begin

        Mensagem('Você precisa informar um percentual de 1 até 100 para dividir estes títulos.', 'UNIMESTRE', MB_OK + MB_ICONWARNING);
        edPercentual.SetFocus();

        Exit;


     end;

     percResp := percResp / 100;
     percAlun := 1 - percResp;
  except

     Mensagem('Você precisa informar um percentual válido para dividir estes títulos.', 'UNIMESTRE', MB_OK + MB_ICONWARNING);
     edPercentual.SetFocus();

     Exit;

  end;

  if grd.SelectedRows.Count <= 0  then Begin

     Mensagem('Você precisa selecionar ao menos um título.', 'UNIMESTRE', MB_OK + MB_ICONWARNING);

     Exit;

  end;  


  if Mensagem('Atenção'+ CHR(13) + CHR(13) +
           'Este procedimento irá excluir as parcelas selecionadas e criar duas novas parcelas, dividindo os valores conforme o percentual selecionado.' + CHR(13) + CHR(13) +
           'Tem certeza que deseja continuar? ' , 'UNIMESTRE', MB_YESNOCANCEL + MB_ICONWARNING) <> mrYEs
  then Exit;


  for n := 0 to grd.SelectedRows.Count - 1 do begin

     grd.DataSource.DataSet.GotoBookmark(Pointer(grd.SelectedRows.Items[n]));


     // Criar Parcela do Responsavel
     iNovaMensalidade := Dm.GerarMensalidade
         ( tblMensalidadesCodigoAluno.AsInteger
         , tblMensalidadesParcela.AsInteger
         , tblMensalidadesTurma.AsString
         , RoundFloat(tblMensalidadesValorBruto.AsCurrency * percResp, 2)
         , RoundFloat(tblMensalidadesValorJuros.AsCurrency * percResp, 2)
         , tblMensalidadesAnoSemestre.AsInteger
         , tblMensalidadesDataVencimento.AsDateTime
         , tblMensalidadesdt_competencia.AsDateTime
         , tblMensalidadesSituacao.AsInteger
         , tblMensalidadescurso.AsString
         , tblMensalidadesDepto.AsInteger
         , 0
         , -3 // Forcar a data de competencia
         , RoundFloat(tblMensalidadesValorDesconto.AsCurrency * percResp, 2)
         , tblMensalidadesnr_creditos.AsCurrency
         , tblMensalidadesds_historico.AsString
         , tblMensalidadescd_tipo_titulo.AsInteger
         , tblMensalidadescd_plano_conta.AsInteger
         , tblMensalidadescd_centro_custo.AsInteger
         , RoundFloat(tblMensalidadesDescontoExtra.AsCurrency * percResp, 2)
         , RoundFloat(tblMensalidadesValorExtra.AsCurrency * percResp, 2)
         , tblMensalidadessn_credito_parcela.AsString[1]
         , tblMensalidadesvl_credito.AsCurrency * percResp
         , tblMensalidadescd_item_plano.AsInteger
         , 10
         , 0
         , StrToInt(edCodigoResp.Text)
         , tblMensalidadescd_coligada.AsInteger
         , tblMensalidadesnr_nf.AsInteger
         , percResp * 100
         , tblMensalidadescd_desc_condicional.AsInteger
         , tblMensalidadesds_obs_desc.AsString
         , tblMensalidadesDataEmissao.AsDateTime
         );

     // verificar os desc. fixos - guardar a movimentação
     if tblMensalidadesDescontoExtra.AsCurrency > 0  then begin

        Dm.CriarConsulta(qDesc);

        qDesc.Close();
        qDesc.SQL.Text :=
          ' SELECT cr.cd_mensalidade, cr.cd_acao, cr.vl_saida, cr.cd_coligada  '+
          '   FROM fin_mov_cr as cr ' +
          '  INNER JOIN fin_acoes_movimento as am ON (cr.cd_acao = am.cd_acao) '+
          '  WHERE am.cd_tipo_acao = 3 AND am.cd_origem = 1 '+
          '    AND cr.cd_mensalidade = :cd_mensa ';
        qDesc.ParamByName('cd_mensa').AsInteger := tblMensalidadescd_mensalidade_origem.AsInteger;
        qDesc.Open();

        mvDesc := TMovimento.create();

        qDesc.First();

        while Not qDesc.Eof do begin

          mvDesc.TipoDeAcao      := BaixarporDesconto;
          mvDesc.CodigoTitulo    := iNovaMensalidade;
          mvDesc.Coligada        := qDesc.FieldByName('cd_coligada').AsInteger;
          mvDesc.CodAcao         := qDesc.FieldByName('cd_acao').AsInteger;
          mvDesc.ValorMovimento  := RoundFloat(qDesc.FieldByName('vl_saida').AsCurrency * percResp, 2);

          mvDesc.RegistrarMovimentacaoCR( 0 );

          qDesc.Next();

        end;


     end;

     // Criar parcela do Aluno

     if percAlun > 0 then begin


         iNovaMensalidade := Dm.GerarMensalidade
             ( tblMensalidadesCodigoAluno.AsInteger
             , tblMensalidadesParcela.AsInteger
             , tblMensalidadesTurma.AsString
             , tblMensalidadesValorBruto.AsFloat - RoundFloat(tblMensalidadesValorBruto.AsFloat * percResp, 2)
             , tblMensalidadesValorJuros.AsFloat - RoundFloat(tblMensalidadesValorJuros.AsFloat * percResp, 2)
             , tblMensalidadesAnoSemestre.AsInteger
             , tblMensalidadesDataVencimento.AsDateTime
             , tblMensalidadesdt_competencia.AsDateTime
             , tblMensalidadesSituacao.AsInteger
             , tblMensalidadescurso.AsString
             , tblMensalidadesDepto.AsInteger
             , 0
             , -3 // Forcar a data de competencia
             , tblMensalidadesValorDesconto.AsFloat - RoundFloat(tblMensalidadesValorDesconto.AsFloat * percResp, 2)
             , tblMensalidadesnr_creditos.AsCurrency
             , tblMensalidadesds_historico.AsString
             , tblMensalidadescd_tipo_titulo.AsInteger
             , tblMensalidadescd_plano_conta.AsInteger
             , tblMensalidadescd_centro_custo.AsInteger
             , tblMensalidadesDescontoExtra.AsFloat - RoundFloat(tblMensalidadesDescontoExtra.AsFloat * percResp, 2)
             , tblMensalidadesValorExtra.AsFloat - RoundFloat(tblMensalidadesValorExtra.AsFloat * percResp, 2)
             , tblMensalidadessn_credito_parcela.AsString[1]
             , tblMensalidadesvl_credito.AsCurrency * percAlun
             , tblMensalidadescd_item_plano.AsInteger
             , 10
             , 0
             , tblMensalidadescd_resp.AsInteger
             , tblMensalidadescd_coligada.AsInteger
             , tblMensalidadesnr_nf.AsInteger
             , percAlun * 100
             , tblMensalidadescd_desc_condicional.AsInteger
             , tblMensalidadesds_obs_desc.AsString
             , tblMensalidadesDataEmissao.AsDateTime
             );

         // verificar os desc. fixos - guardar a movimentação
         if tblMensalidadesDescontoExtra.AsCurrency > 0  then begin

            qDesc.First();

            while Not qDesc.Eof do begin

              mvDesc.TipoDeAcao      := BaixarporDesconto;
              mvDesc.CodigoTitulo    := iNovaMensalidade;
              mvDesc.Coligada        := qDesc.FieldByName('cd_coligada').AsInteger;
              mvDesc.CodAcao         := qDesc.FieldByName('cd_acao').AsInteger;
              mvDesc.ValorMovimento  := RoundFloat(qDesc.FieldByName('vl_saida').AsCurrency * percAlun, 2);

              mvDesc.RegistrarMovimentacaoCR( 0 );

              qDesc.Next();

            end;


         end;

     end;


     FreeAndNil(mvDesc);
     FreeAndNil(qDesc);


     // Apagar a parcela e movimentação CR do aluno;

     with frmMensalidades.qryDelete do begin
         Close;
         SQL.Clear;
         SQL.Add(
           ' DELETE from fin_mov_cr                 ' +
           ' WHERE cd_mensalidade = :CdMensalidade  ');
         ParamByName('CdMensalidade').AsInteger  := tblMensalidadescd_mensalidade.AsInteger;
         ExecSQL;
     end;

     with frmMensalidades.qryDelete do begin
          Close;
          SQL.Clear;
          SQL.Add( 'delete from Mensalidades where      ' );
          SQL.Add( 'cd_mensalidade = :CdMensalidade     ' );
          ParamByName('CdMensalidade').AsInteger := tblMensalidadescd_mensalidade.AsInteger;
          ExecSQL;

          chaves := FillString(IntToStr(tblMensalidadesCodigoAluno.AsInteger), alRight, '0', 10, true ) + ';' +
                    tblMensalidadesAnoSemestre.AsString + ';' + tblMensalidadesTurma.AsString + ';' +
                    tblMensalidadesParcela.AsString + ';' +
                    FormatDateTime('dd/mm/yyyy',tblMensalidadesDataVencimento.AsDateTime) + ';';

          DM.setLog(2013, 'Alteracao', chaves, Dm.getColigadaByTurma(tblMensalidadesTurma.AsString, tblMensalidadesAnoSemestre.AsInteger), 'Parcela Dividida. (NN = ' + tblMensalidadesNossoNumero.AsString +  ')');

    end;

  end;

  ModalResult := mrOk;
  CloseModal();


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

end.

//
