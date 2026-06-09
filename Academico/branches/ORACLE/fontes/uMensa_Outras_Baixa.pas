unit uMensa_Outras_Baixa;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, StdCtrls, DB, ZConnection, DBCtrls, Buttons, ComCtrls,
  General, ZAbstractRODataset, ZAbstractDataset, ZDataset, UZDataset;

type
  TBaixa = (Desconto, Cancelamento);

  TOrigemCalculo = (ValorPago, ValorMulta, ValorJuros, Inicial);

  Tfrm_Mensa_Outras_Baixas = class(TForm)
    pnTitulo: TPanel;
    qyDesconto: TUMZQuery;
    btnConfirmar: TBitBtn;
    BitBtn2: TBitBtn;
    qyAcao: TUMZQuery;
    srcAcao: TDataSource;
    pnCompromisso: TPanel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Label9: TLabel;
    Label11: TLabel;
    lbCodigo: TLabel;
    lbTurma: TLabel;
    lbDataVencimento: TLabel;
    lbParcela: TLabel;
    lbValorPendente: TLabel;
    PageControl1: TPageControl;
    tsDesconto: TTabSheet;
    tsCancelamento: TTabSheet;
    rbDescontoExtra: TRadioButton;
    rbDescontoEmDia: TRadioButton;
    cbAcaoMovimento: TComboBox;
    Label15: TLabel;
    edParcelaFinal: TEdit;
    edParcelaInicio: TEdit;
    Label6: TLabel;
    Label1: TLabel;
    edDescontoPerc: TEdit;
    edValorDesconto: TEdit;
    Label2: TLabel;
    Label7: TLabel;
    edObservacao: TEdit;
    Label8: TLabel;
    edValorCancelar: TEdit;
    Label10: TLabel;
    edParcelaInicioCancelar: TEdit;
    edParcelaFimCancelar: TEdit;
    cbAcaoMovimentoCancelar: TComboBox;
    Label12: TLabel;
    Label13: TLabel;
    Label14: TLabel;
    edObservacaoCancelar: TEdit;
    Label16: TLabel;
    Bevel1: TBevel;
    qyAplica: TUMZQuery;
    ckbDescCondi: TCheckBox;
    qyPlanoDesconto: TUMZQuery;
    qyPlanoDescontovalordesconto: TFloatField;
    qyPlanoDescontopercentualdesconto: TFloatField;
    qyPlanoDescontosn_condicional: TSmallintField;
    rbDesconto100: TRadioButton;
    edAcaoDesconto100: TEdit;
    sbCadeado: TSpeedButton;
    procedure rbDesconto100Click(Sender: TObject);
    procedure cbAcaoMovimentoSelect(Sender: TObject);
    procedure rbDescontoEmDiaClick(Sender: TObject);
    procedure edObservacaoKeyPress(Sender: TObject; var Key: Char);
    procedure edDescontoPercKeyPress(Sender: TObject; var Key: Char);
    procedure edValorDescontoExit(Sender: TObject);
    procedure edDescontoPercExit(Sender: TObject);
    procedure edValorDescontoEnter(Sender: TObject);
    procedure edDescontoPercEnter(Sender: TObject);
    procedure rbDescontoExtraClick(Sender: TObject);
    procedure edParcelaInicioKeyPress(Sender: TObject; var Key: Char);
    procedure FormShow(Sender: TObject);
    procedure edCaixaKeyPress(Sender: TObject; var Key: Char);
    procedure edValorDescontoKeyPress(Sender: TObject; var Key: Char);
    procedure BitBtn2Click(Sender: TObject);
    procedure btnConfirmarClick(Sender: TObject);
    procedure cbAcaoMovimentoKeyPress(Sender: TObject; var Key: Char);
  private
    { Private declarations }

    ListaAcao : Array of Integer;

    Procedure CalculaValor;
    Procedure MontaComboAcao;
    Procedure ConfirmarDesconto;
    Procedure ConfirmarCancelamento;
    Procedure ConfirmarDesconto100;

  public
    { Public declarations }

    iCodigoMensalidade : Integer;
    tipoBaixa : TBaixa;
  end;

var
  frm_Mensa_Outras_Baixas: Tfrm_Mensa_Outras_Baixas;

implementation

uses uClassMovimento, uDM, uUsuario, uRemessaClass;

{$R *.dfm}

procedure Tfrm_Mensa_Outras_Baixas.FormShow(Sender: TObject);
begin

   // TRazer Cabeçalho
   with qyDesconto do begin
      Close;
      SQL.Clear;

      //Verifica se a conexão é Oracle ou MySQL
      if Connection.Protocol = 'oracle' then //Oracle
      begin
         SQL.Add(
         'SELECT '+
         '    M.CD_MENSALIDADE_ORIGEM, '+
         '    FIRST_OCCURRENCE(M.TIPOPARCELA) TIPOPARCELA, '+
         '    FIRST_OCCURRENCE(M.CD_MENSALIDADE) CD_MENSALIDADE, '+
         '    FIRST_OCCURRENCE(M.CODIGOALUNO) CODIGOALUNO, '+
         '    FIRST_OCCURRENCE(P.NM_PESSOA) NM_PESSOA, '+
         '    FIRST_OCCURRENCE(M.TURMA) TURMA, '+
         '    FIRST_OCCURRENCE(M.ANOSEMESTRE) ANOSEMESTRE, '+
         '    FIRST_OCCURRENCE(M.DATAVENCIMENTO) DATAVENCIMENTO, '+
         '    FIRST_OCCURRENCE(M.PARCELA) PARCELA, '+
         '    FIRST_OCCURRENCE(M.VALORBRUTO) VALORBRUTO, '+
         '    FIRST_OCCURRENCE(M.VALORJUROS) VALORJUROS, '+
         '    FIRST_OCCURRENCE(M.DT_COMPETENCIA) DT_COMPETENCIA, '+
         '    (SUM(COALESCE(F.VL_ENTRADA, 0))- SUM(COALESCE(F.VL_SAIDA, 0))- FIRST_OCCURRENCE(COALESCE(M .VALOREXTRA, 0))) PENDENTE '+
         'FROM                                      '+
         '    MENSALIDADES M INNER JOIN PESSOAS P '+
         '    ON ( M.CODIGOALUNO = P.CD_PESSOA ) '+
         '    LEFT JOIN FIN_MOV_CR F '+
         '    ON ( M.CD_MENSALIDADE_ORIGEM = F.CD_MENSALIDADE ) '+
         'WHERE '+
         '    M.CD_MENSALIDADE = :CdMensalidade '+
         'GROUP BY                    ' +
         '    M.CD_MENSALIDADE_ORIGEM ');

      end else begin
         SQL.Add(
         ' SELECT                                                    ' +
         '   m.cd_mensalidade_origem,  m.tipoparcela, m.cd_mensalidade, m.codigoaluno, p.nm_pessoa, m.turma,  ' +
         '   m.anosemestre, m.datavencimento, m.parcela, m.valorbruto, m.valorjuros, m.dt_competencia, ' +
         '   (SUM(f.vl_entrada) - Sum(f.vl_saida)-m.valorextra) Pendente          ' +
         ' FROM                                                      ' +
         '   mensalidades m INNER JOIN pessoas p                     ' +
         '   ON ( m.codigoaluno = p.cd_pessoa )                      ' +
         '   LEFT JOIN fin_mov_cr f                                  ' +
         '   ON ( m.cd_mensalidade_origem = f.cd_mensalidade )       ' +
         ' WHERE                                                     ' +
         '    m.cd_mensalidade = :CdMensalidade                      ' +
         ' GROUP BY                                                  ' +
         '     m.cd_mensalidade_origem                               '
         );
      end;

      ParamByName('CdMensalidade').AsInteger := iCodigoMensalidade;
      Open;

      lbCodigo.Caption := FieldByName('codigoaluno').AsString + ' - ' + FieldByName('nm_pessoa').AsString;
      lbTurma.Caption := FieldByName('turma').AsString + ' - ' + FieldByName('anosemestre').AsString;
      lbParcela.Caption := FieldByName('parcela').AsString;
      lbDataVencimento.Caption := FormatDateTime('dd/mm/yyyy', FieldByName('datavencimento').AsDateTime);
      lbValorPendente.Caption := FloatToStrF(FieldByName('pendente').AsCurrency, ffFixed, 12, 2);

      // Verificar permissão para aplicação do desconto de 100 condicional
      if DM.UsuarioLogado.TemPermissao(2070, npAcesso, false ) then begin
         rbDesconto100.Visible := true;
      end else begin
         rbDesconto100.Visible := false;
      end;                             

   end;

   { Alterar títulos do formulário }

   qyAcao.Close;
   qyAcao.SQL.Clear;
   sbCadeado.Visible := False;

   case tipoBaixa of
      Desconto : begin
                     PageControl1.ActivePageIndex := 0;
                     Self.Caption     := 'Aplicar desconto a mensalidade';
                     pnTitulo.Caption := 'Aplicar desconto a mensalidade';


                     PageControl1.Pages[0].TabVisible := True;
                     PageControl1.Pages[1].TabVisible := False;

                     cbAcaoMovimento.Enabled := True;

                     cbAcaoMovimento.SetFocus;

                     edParcelaInicio.Text := qyDesconto.FieldByName('parcela').AsString;
                     edParcelaFinal.Text := qyDesconto.FieldByName('parcela').AsString;

                     qyAcao.SQL.Add('SELECT * FROM fin_acoes_movimento where cd_tipo_acao = 3 and cd_origem = 1 and sn_ativo=''S'' ORDER by ds_acao');

                     if (qyDesconto.FieldByName('tipoparcela').AsInteger IN [1,4]) AND (DM.variavel_parametro('financeiro_bloquear_competencia') = 'S') then begin
                         rbDescontoExtra.Enabled := false;
                         rbDescontoEmDia.Checked := true;
                         sbCadeado.Visible := True;
                         sbCadeado.Hint := 'Não é possível aplicar desconto fixo em parcelas parciais ou negociadas.';
                     end else begin
                         rbDescontoExtra.Enabled := true;
                         sbCadeado.Visible := False;
                         sbCadeado.Hint := 'Efetua a baixa do valor do desconto aplicado, de forma incondicional.  Utilizado para controle de Bolsas Fixas.';
                     end;

                  end;
      Cancelamento : begin
                     PageControl1.ActivePageIndex := 1;
                     Self.Caption     := 'Cancelar mensalidade';
                     pnTitulo.Caption := 'Cancelar mensalidade';

                     PageControl1.Pages[0].TabVisible := False;
                     PageControl1.Pages[1].TabVisible := True;

                     cbAcaoMovimentoCancelar.SetFocus;

                     edParcelaInicioCancelar.Text := qyDesconto.FieldByName('parcela').AsString;
                     edParcelaFimCancelar.Text := qyDesconto.FieldByName('parcela').AsString;

                     qyAcao.SQL.Add('SELECT * FROM fin_acoes_movimento where cd_tipo_acao = 2 and cd_origem = 1 and sn_ativo=''S'' ORDER by ds_acao');

                     // Não tem mais valor bruto para baixar
                     if qyDesconto.FieldByName('pendente').AsCurrency = 0 then begin

                        lbValorPendente.Caption := FloatToStrF(qyDesconto.FieldByName('valorjuros').AsCurrency, ffFixed, 12, 2) + ' (Juros)';
                        edParcelaFinal.Enabled := False;

                        edValorCancelar.Text := FloatToStrF(qyDesconto.FieldByName('valorjuros').AsCurrency, ffFixed, 12, 2);

                     end
                     else begin
                        edValorCancelar.Text := FloatToStrF(qyDesconto.FieldByName('pendente').AsCurrency, ffFixed, 12, 2);
                     end;
                     
                     edValorCancelar.Enabled := False;

                  end;
   end;

   qyAcao.Open;
   MontaComboAcao;
   cbAcaoMovimento.ItemIndex := -1;
end;

procedure Tfrm_Mensa_Outras_Baixas.edCaixaKeyPress(Sender: TObject;
  var Key: Char);
begin
   if (key = #13) then
   begin
      SelectNext(Sender As TWinControl, True, True);
      key := #0;
   end
   else
   if not (key in ['0'..'9',#8]) then
      key := #0;
end;

procedure Tfrm_Mensa_Outras_Baixas.edValorDescontoKeyPress(
  Sender: TObject; var Key: Char);
begin
   if(Key in['.']) then
   begin
      Key :=  ',';
   end;
   if (key = #13) then
   begin
      SelectNext(Sender As TWinControl, True, True);
      key := #0;
   end
   else
   if (key = ',') then
   begin
      if Pos(',', TEdit(Sender).Text) > 0 then
         key := #0;
   end
   else
   if not (key in ['0'..'9',#8]) then
      key := #0;
end;

procedure Tfrm_Mensa_Outras_Baixas.BitBtn2Click(Sender: TObject);
begin
   Self.ModalResult := mrCancel;
   CloseModal();
end;

procedure Tfrm_Mensa_Outras_Baixas.btnConfirmarClick(Sender: TObject);
begin

   if tipoBaixa = Desconto then begin

      if ((rbDescontoExtra.Checked = False) and
         (rbDescontoEmDia.Checked = False)  and
         (rbDesconto100.Checked = False))   then
      begin
         Mensagem('Você deve escolher um tipo de desconto!', 'Informação', MB_OK + MB_ICONINFORMATION, Handle);
         Abort;
      end;

      if rbDesconto100.Checked then begin
         ConfirmarDesconto100();
      end else begin
          if cbAcaoMovimento.ItemIndex <> -1 then
          begin
             ConfirmarDesconto
          end
          else
          begin
             Mensagem('Você deve escolher uma ação de baixa para continuar.', 'Informação', MB_OK + MB_ICONINFORMATION, Handle);
          end;
      end;
   end
   else begin
      if cbAcaoMovimentoCancelar.ItemIndex <> -1 then
      begin
         ConfirmarCancelamento;
      end
      else
      begin
         Mensagem('Você deve escolher uma ação de movimento para continuar.', 'Informação', MB_OK + MB_ICONINFORMATION, Handle);
      end;
   end;
end;

procedure Tfrm_Mensa_Outras_Baixas.MontaComboAcao;
var n : Word;
begin
    SetLength(ListaAcao, qyAcao.RecordCount);

    qyAcao.First;
    n := 0;

    cbAcaoMovimento.Items.Clear;
    cbAcaoMovimentoCancelar.Items.Clear;

    while not qyAcao.Eof do
    begin

        ListaAcao[n] := qyAcao.FieldByName('cd_acao').AsInteger;
        cbAcaoMovimento.Items.Add(qyAcao.FieldByName('ds_acao').AsString);
        cbAcaoMovimentoCancelar.Items.Add(qyAcao.FieldByName('ds_acao').AsString);

        INC(n);
        qyAcao.Next;
    end;

    cbAcaoMovimento.ItemIndex := 0;
    cbAcaoMovimentoCancelar.ItemIndex := 0;

    // Carregar descrição da ação de desconto financeiro 100%

    Dm.qyAux2.Close();
    Dm.qyAux2.SQL.Text :=
      ' select CD_ACAO, DS_ACAO from FIN_ACOES_MOVIMENTO where CD_ACAO_AUTOMATICA = 18 ';
    Dm.qyAux2.Open();

    if DM.qyAux2.Eof then begin
       // Se não tiver acao padrao = 18 cadastrada, não habilitará a função
       rbDesconto100.Visible := false;
    end else begin
       edAcaoDesconto100.text := Dm.qyAux2.FieldByName('DS_ACAO').AsString;
       edAcaoDesconto100.Tag := Dm.qyAux2.FieldByName('CD_ACAO').AsInteger;
    end;
    Dm.qyAux2.Close
    
end;

procedure Tfrm_Mensa_Outras_Baixas.cbAcaoMovimentoKeyPress(Sender: TObject;
  var Key: Char);
begin
   if key = #13 then
   begin
       SelectNext(Sender as TWinControl, True, True);
       key := #0;
   end;
end;

procedure Tfrm_Mensa_Outras_Baixas.cbAcaoMovimentoSelect(Sender: TObject);
var
   qryAcaoMovimento: TUMZReadOnlyQuery;
begin
   // Busca os valores dos planos de bolsa para essa ação
   qyPlanoDesconto.Close;
   qyPlanoDesconto.ParamByName('cd_acao_movimento').AsInteger := ListaAcao[cbAcaoMovimento.ItemIndex];
   qyPlanoDesconto.Open;

   if qyPlanoDesconto.RecordCount = 1 then
   begin
      edDescontoPerc.Text := qyPlanoDesconto.FieldByName('percentualdesconto').AsString;
      edValorDesconto.Text := qyPlanoDesconto.FieldByName('valordesconto').AsString;
      if qyPlanoDesconto.FieldByName('sn_condicional').AsInteger = 1 then
      begin
         ckbDescCondi.Checked := true;
      end
      else
      begin
         ckbDescCondi.Checked := false;
      end;
   end
   else
   begin
      DM.CriarConsulta(qryAcaoMovimento);
      qryAcaoMovimento.SQL.Text :=
         'SELECT '+
	      '  fam.vl_perc_desconto, '+
         '	fam.sn_altera_desconto '+
         'FROM '+
         '	fin_acoes_movimento AS fam '+
         'WHERE '+
         '	fam.cd_acao = :cd_acao';

      qryAcaoMovimento.ParamByName('cd_acao').AsInteger :=
         ListaAcao[cbAcaoMovimento.ItemIndex];

      qryAcaoMovimento.Open;

      if qryAcaoMovimento.FieldByName('vl_perc_desconto').AsFloat > 0 then
      begin
         edDescontoPerc.Text := qryAcaoMovimento.FieldByName('vl_perc_desconto').AsString;

         edValorDesconto.Text :=
            FloatToStr(
               (qryAcaoMovimento.FieldByName('vl_perc_desconto').AsFloat *
               qyDesconto.FieldByName('pendente').AsFloat) / 100 );

         edValorDesconto.Enabled := (qryAcaoMovimento.FieldByName('sn_altera_desconto').AsInteger = 1);
         edDescontoPerc.Enabled := (qryAcaoMovimento.FieldByName('sn_altera_desconto').AsInteger = 1);
      end
      else
      begin
         edDescontoPerc.Text := '';
         edValorDesconto.Text := '';
         edDescontoPerc.Enabled := True;
         edValorDesconto.Enabled := True;
      end;
   end;

   if (edDescontoPerc.Text <> '') then
   begin
      edDescontoPercExit(nil);
   end;
end;

procedure Tfrm_Mensa_Outras_Baixas.edParcelaInicioKeyPress(Sender: TObject;
  var Key: Char);
begin
   if key = #13 then begin
      key := #0;
      SelectNext(Sender as TWinControl, True, True);
   end
   else begin
     if not (key in ['0'..'9', #8]) then begin
        key := #0;
        exit;
     end;
   end;
end;

procedure Tfrm_Mensa_Outras_Baixas.rbDesconto100Click(Sender: TObject);
begin
   cbAcaoMovimento.Visible := false;
   edAcaoDesconto100.Visible := True;


   ckbDescCondi.Enabled := False;
   edDescontoPerc.Text := '100';
   edValorDesconto.Text := FloatToStrF(qyDesconto.FieldByName('pendente').AsFloat, ffFixed, 12, 2);

   edValorDesconto.Enabled := False;
   edDescontoPerc.Enabled := false;

end;

procedure Tfrm_Mensa_Outras_Baixas.rbDescontoEmDiaClick(Sender: TObject);
begin
   cbAcaoMovimento.Visible := true;
   edAcaoDesconto100.Visible := False;

   ckbDescCondi.Enabled := False;
   edValorDesconto.Enabled := true;
   edDescontoPerc.Enabled := true;
end;

procedure Tfrm_Mensa_Outras_Baixas.rbDescontoExtraClick(Sender: TObject);
begin
   cbAcaoMovimento.Visible := true;
   edAcaoDesconto100.Visible := False;

   cbAcaoMovimento.Enabled := True;
   cbAcaoMovimento.Color := clWindow;

   ckbDescCondi.Enabled := true;

   edValorDesconto.Enabled := true;
   edDescontoPerc.Enabled := true;   

end;

procedure Tfrm_Mensa_Outras_Baixas.CalculaValor;
var
  cPer, cValor : Currency;

  cValorBase : Currency;
begin
   // Calcular o Valor
   try

   cValorBase := qyDesconto.FieldByName('pendente').AsFloat;

   if (edDescontoPerc.color = clWindow) AND (edDescontoPerc.Text <> '') then begin
      // É desconto Percentual, então Bloquear a Digitação do Valor
      cPer := StrToCurr(edDescontoPerc.Text);
      cValor := (cPer * cValorBase) / 100;
      edValorDesconto.Text := FloatToStrF(cValor, ffFixed, 12, 2);
      edValorDesconto.Color := clBtnFace;
      edDescontoPerc.Color := clWindow;
   end
   // Não é desconto Percentual
   else begin
      if (edValorDesconto.Color = clWindow) AND (edValorDesconto.Text <> '') then begin
         // É desconto Percentual, então Bloquear a Digitação do Valor
         cValor := StrToCurr(edValorDesconto.Text);
         cPer := (cValor / cValorBase) * 100;
         edDescontoPerc.Text := FloatToStrF(cPer, ffFixed, 12, 2);
         edDescontoPerc.Color := clBtnFace;
         edValorDesconto.Color := clWindow;
      end;

   end;

   cValor := StrToCurr(edValorDesconto.Text);


   except
       Exit;
   end;

end;

procedure Tfrm_Mensa_Outras_Baixas.edDescontoPercEnter(Sender: TObject);
begin
   edDescontoPerc.Color := clWindow;
   edValorDesconto.Color := clBtnFace;
end;

procedure Tfrm_Mensa_Outras_Baixas.edValorDescontoEnter(Sender: TObject);
begin
   edValorDesconto.Color := clWindow;
   edDescontoPerc.Color := clBtnFace;
end;

procedure Tfrm_Mensa_Outras_Baixas.edDescontoPercExit(Sender: TObject);
begin
    CalculaValor;
end;

procedure Tfrm_Mensa_Outras_Baixas.edValorDescontoExit(Sender: TObject);
begin
   CalculaValor;
end;

procedure Tfrm_Mensa_Outras_Baixas.edDescontoPercKeyPress(Sender: TObject;
  var Key: Char);
begin
   //Se for . transforma para virgula
   if(Key in['.']) then
   begin
      Key :=  ',';
   end;
   
   if (key = #13) then
   begin
      edObservacao.SetFocus;
      key := #0;
   end
   else
   if (key = ',') then
   begin
      if Pos(',', TEdit(Sender).Text) > 0 then
         key := #0;
   end
   else
   if not (key in ['0'..'9',#8]) then
      key := #0;
end;

procedure Tfrm_Mensa_Outras_Baixas.edObservacaoKeyPress(Sender: TObject;
  var Key: Char);
begin
   if (key = #13) then
   begin
      btnConfirmar.SetFocus;
      key := #0;
   end

end;

procedure Tfrm_Mensa_Outras_Baixas.ConfirmarCancelamento;
Var
   Movimento : TMovimento;

   iParcelaInicial,
   iParcelaFinal : Integer;
   cValor : Currency;
   cValorAux : Currency;

   qyAlunos,qryDDA : TUMZQuery;
   bCancelarDDA : Boolean;
   iCancelamento : Integer;
   sChave : String;

   objRemessa: TRemessa;
   NovoProcessoRemessa: Boolean;
   S, NossoNumero: AnsiString;
begin

   try
      iParcelaInicial := StrToInt(edParcelaInicioCancelar.Text);
      iParcelaFinal := StrToInt(edParcelaFimCancelar.Text);
   except
      Mensagem('Digite um valor numérico para as parcelas.', 'Atenção', MB_OK + MB_ICONWARNING);
      edParcelaInicioCancelar.SetFocus;
      Exit;
   end;

   try
      cValor := StrToCurr(edValorCancelar.Text);
   except
      Mensagem('Digite um valor para cancelar.', 'Atenção', MB_OK + MB_ICONWARNING);
      edValorCancelar.SetFocus;
      Exit;
   end;

//   if Length(Trim(edObservacaoCancelar.Text)) = 0 then begin
//      Mensagem('É necessário colocar uma observação para especificar o motivo da alteração.', 'Atenção', MB_OK + MB_ICONWARNING);
//      exit;
//   end;

   Dm.CriarConsulta(qyAlunos);
   qyAlunos.Close;
   qyAlunos.SQL.Clear;

   { Se não tiver valor Pendente, então deverá somente trocar a situação }
   {
   if qyDesconto.FieldByName('pendente').AsCurrency = 0 then
   begin
   
      qyAlunos.SQL.Add(
         ' UPDATE mensalidades       ' +
         ' SET datapagamento = :DtPagamento, '+
         '     situacao = 5, valordesconto = 0, valortotal = 0 ' +
         ' WHERE cd_mensalidade = :CdMensalidade ');

      if ( (DM.DataAtual() < qyDesconto.FieldByName('datavencimento').AsDateTime) OR
           ( Dm.variavel_parametro('mensalidades_data_baixa') = '[VENCIMENTO]' ) ) AND
         ( Dm.variavel_parametro('mensalidades_data_baixa') <> '[BAIXA]' ) AND
         ( NOT DM.EstaBloqueado(qyDesconto.FieldByName('datavencimento').AsDateTime, false) ) AND
         ( NOT DM.EstaBloqueado(qyDesconto.FieldByName('dt_competencia').AsDateTime, false) )
      then
         qyAlunos.ParamByName('DtPagamento').AsString := FormatDateTime('yyyy-mm-dd',qyDesconto.FieldByName('datavencimento').AsDateTime)
      else
         qyAlunos.ParamByName('DtPagamento').AsString := FormatDateTime('yyyy-mm-dd',DM.DataAtual());

      qyAlunos.ParamByName('CdMensalidade').AsInteger := qyDesconto.FieldByName('cd_mensalidade').AsInteger;
      qyAlunos.ExecSQL();

      DM.FazAcaoRemessa(arCancelar, qyDesconto.FieldByName('cd_mensalidade').AsInteger);
      
      Self.ModalResult := mrOk;
      CloseModal();
      
      Exit;

   end;
   }

   //Verifica se a conexão é Oracle ou MySQL
   if qyAlunos.Connection.Protocol = 'oracle' then //Oracle
   begin
      qyAlunos.SQL.Add(
         ' SELECT                ' +
         '   m.cd_mensalidade_origem,                                ' +
         '   FIRST_OCCURRENCE(m.cd_mensalidade) cd_mensalidade, m.nossonumero, m.cd_coligada, FIRST_OCCURRENCE(m.valorjuros) valorjuros, ' +
         '   (SUM(f.vl_entrada) - Sum(f.vl_saida)) Pendente          ' +
         ' FROM                                                      ' +
         '   mensalidades m INNER JOIN pessoas p ON (m.codigoaluno = p.cd_pessoa)       ' +
         '   LEFT JOIN fin_mov_cr f ON (m.cd_mensalidade_origem = f.cd_mensalidade)     ' +
         ' WHERE                                                     ' +
         '    1 = 1   ');
   end else begin
      qyAlunos.SQL.Add(
         ' SELECT                ' +
         '   m.cd_mensalidade_origem,                                ' +
         '   m.cd_mensalidade, m.nossonumero, m.cd_coligada, m.valorjuros,          ' +
         '   (SUM(f.vl_entrada) - Sum(f.vl_saida)) Pendente          ' +
         ' FROM                                                      ' +
         '   mensalidades m INNER JOIN pessoas p ON (m.codigoaluno = p.cd_pessoa)       ' +
         '   LEFT JOIN fin_mov_cr f ON (m.cd_mensalidade_origem = f.cd_mensalidade)     ' +
         ' WHERE                                                     ' +
         '    1 = 1   ');
   end;

   if iParcelaInicial = iParcelaFinal then begin
       qyAlunos.SQL.Add(' AND m.cd_mensalidade = ' + qyDesconto.FieldByName('cd_mensalidade').AsString);
   End
   else begin
      qyAlunos.SQL.Add(
      ' AND m.codigoaluno = :Codigo                     ' +
      ' AND m.turma = :Turma                            ' +
      ' AND m.anosemestre = :AnoSemestre                ' +
      ' AND m.parcela >= :Parcela1 AND m.parcela <= :Parcela2 ' +
      ' AND m.situacao in (2,10) ');

     // Verificar se é permitido o cancelamento de títulos com data de competência/vencimento bloqueadas.
     // Como padrão o sistema deve deixar cancelar, visto que é normal cancelamentos após o faturamento
     // Sendo que a data do cancelamento é colocada como sendo a data atual.

      if DM.variavel_parametro('FinanceiroCancelaDataBloqueada') = 'N' then begin

         qyAlunos.SQL.Add(' AND m.datavencimento > :data_bloqueio1 ');
         qyAlunos.SQL.Add(' AND m.dt_competencia > :data_bloqueio2 ');

         qyAlunos.ParamByName('data_bloqueio1').AsDate := Dm.DataBloqueioFinanceiro(0);
         qyAlunos.ParamByName('data_bloqueio2').AsDate := Dm.DataBloqueioFinanceiro(0);

      end;

      qyAlunos.ParamByName('turma').AsString := qyDesconto.FieldByName('turma').AsString;
      qyAlunos.ParamByName('anosemestre').AsInteger := qyDesconto.FieldByName('anosemestre').AsInteger;
      qyAlunos.ParamByName('parcela1').AsInteger := iParcelaInicial;
      qyAlunos.ParamByName('parcela2').AsInteger := iParcelaFinal;
      qyAlunos.ParamByName('codigo').AsInteger := qyDesconto.FieldByName('codigoaluno').AsInteger;
   end;
   qyAlunos.SQL.Add(
      ' GROUP BY                                                  ' +
      '     m.cd_mensalidade_origem, m.cd_coligada                '
      );

   qyAlunos.Open;

   Movimento := TMovimento.Create;

   S := DM.variavel_parametro('sn_processo_remessa_novo');
   NovoProcessoRemessa := S = '1';

   objRemessa := TRemessa.Create;

   while not qyAlunos.Eof do begin

      bCancelarDDA := false;

      if NovoProcessoRemessa then
      begin
         NossoNumero := qyAlunos.FieldByName('nossonumero').AsString;
         bCancelarDDA := objRemessa.verificaAcaoEstaFila(NossoNumero, tarBaixarDDA);
      end;

      if not NovoProcessoRemessa then
      begin
         DM.CriarConsulta(qryDDA);
         qryDDA.Close;
         qryDDA.SQL.Text := ''+
         '  SELECT                         '+
         '   	rl.cd_origem,ro.cd_acao      '+
         '  FROM                           '+
         '  	rem_dados rd'+
         '	  INNER JOIN rem_layouts rl ON (rl.cd_layout = rd.cd_layout)'+
         '  	INNER JOIN rem_ocorrencias ro on (ro.cd_ocorrencia = rd.cd_ocorrencia)'+
         '  WHERE                                                       '+
         '	  rd.cd_mensalidade = :cd_mensalidade';
         qryDDA.ParamByName('cd_mensalidade').AsInteger := qyAlunos.FieldByName('cd_mensalidade').AsInteger;
         qryDDA.Open;

         while not qryDDA.Eof do
         begin
            if qryDDA.FieldByName('cd_origem').AsInteger = 3 then
              bCancelarDDA := true;
            if qryDDA.FieldByName('cd_origem').AsInteger = 101 then
              iCancelamento := iCancelamento +1;
            qryDDA.Next;
         end;
         if iCancelamento > 1 then
            bCancelarDDA := false;
      end;

      if ( bCancelarDDA = true ) then
      begin
        if ( Mensagem('Deseja cancelar o Débito Automático?', Application.Title, MB_YESNO) = mrYes ) then
        begin
            if NovoProcessoRemessa then
            begin
               objRemessa.CancelaDDA(NossoNumero);
            end;
            if not NovoProcessoRemessa then
            begin
               DM.FazAcaoRemessa(arCancelamentoDDA, qyAlunos.FieldByName('cd_mensalidade').AsInteger);
            end;
            Mensagem('Será necessário retransmitir o arquivo de remessa para que o cancelamento do DDA ocorra.', Application.Title, MB_OK, Handle);
        end
      else
         exit;
      end;
      if cValor > qyAlunos.FieldByName('pendente').AsCurrency then begin
         cValorAux := qyAlunos.FieldByName('pendente').AsCurrency
      end
      else begin
         cValorAux := cValor;
      end;

      Dm.qyAux.Close;
      DM.qyAux.SQL.Clear;
      DM.qyAux.SQL.Add(
         ' UPDATE mensalidades       ' +
         ' SET datapagamento = :DtPagamento, '+
         '     situacao = 5, valordesconto = 0, valortotal = 0 ' +
         ' WHERE cd_mensalidade = :CdMensalidade ');

      if ( (DM.DataAtual() < qyDesconto.FieldByName('datavencimento').AsDateTime) OR
         ( Dm.variavel_parametro('mensalidades_data_baixa') = '[VENCIMENTO]' ) ) AND
         ( (Dm.variavel_parametro('mensalidades_data_baixa') <> '[BAIXA]') AND
           (Dm.variavel_parametro('mensalidades_data_baixa') <> '[ATUAL]') ) AND
         ( NOT DM.EstaBloqueado(qyDesconto.FieldByName('datavencimento').AsDateTime, false) ) AND
         ( NOT DM.EstaBloqueado(qyDesconto.FieldByName('dt_competencia').AsDateTime, false) )
      then
         DM.qyAux.ParamByName('DtPagamento').AsString := FormatDateTime('yyyy-mm-dd',qyDesconto.FieldByName('datavencimento').AsDateTime)
      else
         DM.qyAux.ParamByName('DtPagamento').AsString := FormatDateTime('yyyy-mm-dd',DM.DataAtual());

      DM.qyAux.ParamByName('CdMensalidade').AsInteger := qyAlunos.FieldByName('cd_mensalidade').AsInteger;;
      DM.qyAux.ExecSQL();

      Movimento.TipoDeAcao := BaixarporCancelamento;
      Movimento.CodigoTitulo := qyAlunos.FieldByName('cd_mensalidade_origem').AsInteger;
      Movimento.Coligada := qyAlunos.FieldByName('cd_coligada').AsInteger;
      Movimento.CodigoMovimento := qyAlunos.FieldByName('cd_mensalidade').AsInteger; // Aqui é que tem q alterar na planilha de mensalidades
      Movimento.MensalidadeOrigem := qyAlunos.FieldByName('cd_mensalidade').AsInteger; 
      Movimento.CodAcao :=  ListaAcao[cbAcaoMovimentoCancelar.ItemIndex];
      Movimento.Observacao := edObservacaoCancelar.Text;
      Movimento.ValorMovimento := cValorAux;
      Movimento.ValorJuros := qyAlunos.FieldByName('valorjuros').AsCurrency;
      Movimento.RegistrarMovimentacaoCR(0);

      DM.FazAcaoRemessa(arCancelar, qyAlunos.FieldByName('cd_mensalidade').AsInteger);

      if NovoProcessoRemessa then
      begin
        // registra a nova ação de cancelamento no novo modelo de remessa
        objRemessa.registraAcaoCancelamento(qyAlunos.FieldByName('nossonumero').AsString);
      end;

      sChave := qyAlunos.FieldByName('cd_mensalidade').AsString + ';' +
                FormatDateTime('dd/mm/yyyy', Dm.DataAtual) + ';';

      Dm.setLog(2014, 'Inclusao', sChave, qyAlunos.FieldByName('cd_coligada').AsInteger, 'Titulo Cancelado no valor de: ' + FloatToStr(cValorAux));

      qyAlunos.Next;

   end;

   Movimento.Free;
   objRemessa.Free;
   objRemessa := nil;

   Self.ModalResult := mrOk;
   CloseModal();

end;

procedure Tfrm_Mensa_Outras_Baixas.ConfirmarDesconto;
Var
   Movimento : TMovimento;

   iParcelaInicial,
   iParcelaFinal : Integer;
   cPercDesconto,
   cValorDesconto : Currency;
   cValorAux : Currency;

   qyAlunos : TUMZQuery;

   dtBloqueio : TDateTime;
   sChave: string;
begin

   try
      iParcelaInicial := StrToInt(edParcelaInicio.Text);
      iParcelaFinal := StrToInt(edParcelaFinal.Text);
   except
      Mensagem('Digite um valor numérico para as parcelas.', 'Atenção', MB_OK + MB_ICONWARNING);
      edParcelaInicio.SetFocus();
      Exit;
   end;

   try
      cValorDesconto := StrToCurr(edValorDesconto.Text);
      cPercDesconto := 0;
   except
      Mensagem('Digite um valor numérico o desconto.', 'Atenção', MB_OK + MB_ICONWARNING);
      edDescontoPerc.SetFocus;
      Exit;
   end;

   try
      cPercDesconto := StrToCurr(edDescontoPerc.Text);
   except
      cPercDesconto := 0;
   end;

   if Length(Trim(edObservacao.Text)) = 0 then begin
      Mensagem('É necessário colocar uma observação para especificar o motivo da alteração.', 'Atenção', MB_OK + MB_ICONWARNING);
      exit;
   end;

   if rbDescontoEmDia.Checked then begin
      if Mensagem('Se você prosseguir sobrescreverá a ultima ação de desconto. Deseja prosseguir?', 'Atenção', MB_YESNO + MB_ICONQUESTION) = mrNo then begin
        Mensagem('Foi cancelada a aplicação de desconto', 'Atenção', MB_OK + MB_ICONWARNING);
        Exit;
      end;

      if cPercDesconto >= 100 then begin

         Mensagem('Informe um percentual de desconto menor que 100.', 'Atenção', MB_OK + MB_ICONWARNING, Handle);
         Exit;

      end;

   end;

   DM.CriarConsulta(qyAlunos);
   qyAlunos.Close;
   qyAlunos.SQL.Clear;
   //Verifica se a conexão é Oracle ou MySQL
   if qyAlunos.Connection.Protocol = 'oracle' then //Oracle
   begin
      qyAlunos.SQL.Add(
         ' SELECT                                     ' +
         '   M.cd_mensalidade_origem, ' +
         '   FIRST_OCCURRENCE(M .cd_coligada) cd_coligada, '+
      	'   FIRST_OCCURRENCE(M .datavencimento) datavencimento, '+
      	'   CAST(FIRST_OCCURRENCE(COALESCE(M.dt_competencia, datavencimento)) AS TIMESTAMP) AS dt_competencia, '+
      	'   FIRST_OCCURRENCE(M .cd_mensalidade) cd_mensalidade, '+
      	'   FIRST_OCCURRENCE(M .situacao) situacao, '+
      	'   FIRST_OCCURRENCE(M .valordesconto) valordesconto, '+
      	'   FIRST_OCCURRENCE(M .descontoextra) descontoextra, '+
      	'   FIRST_OCCURRENCE(M .valorbruto) valorbruto, '+
      	'   (SUM(f.vl_entrada)- SUM(f.vl_saida))Pendente '+
         ' FROM                                                      ' +
         '   mensalidades m INNER JOIN pessoas p                     ' +
         '   ON ( m.codigoaluno = p.cd_pessoa )                      ' +
         '   LEFT JOIN fin_mov_cr f                                  ' +
         '   ON m.cd_mensalidade_origem = f.cd_mensalidade           ' +
         ' WHERE                                                     ' +
         '    m.situacao in (2,10)                                   ');
   end else begin
      qyAlunos.SQL.Add(
         ' SELECT                                     ' +
         '   m.cd_mensalidade_origem, m.cd_coligada, m.datavencimento, '+
         '   IFNULL(m.dt_competencia, datavencimento) As dt_competencia,  ' +
         '   m.cd_mensalidade, m.situacao, ' +
         '   m.valordesconto, m.descontoextra, m.valorbruto,         ' +
         '   (SUM(f.vl_entrada) - Sum(f.vl_saida)) Pendente          ' +
         ' FROM                                                      ' +
         '   mensalidades m INNER JOIN pessoas p                     ' +
         '   ON ( m.codigoaluno = p.cd_pessoa )                      ' +
         '   LEFT JOIN fin_mov_cr f                                  ' +
         '   ON m.cd_mensalidade_origem = f.cd_mensalidade           ' +
         ' WHERE                                                     ' +
         '    m.situacao in (2,10)                                   ');
   end;

   if (DM.variavel_parametro('financeiro_bloquear_competencia') = 'S') AND rbDescontoExtra.Checked then begin
      qyAlunos.SQL.Add(' AND m.tipoparcela <> 4 ');
   end;

   if iParcelaInicial = iParcelaFinal then begin
       qyAlunos.SQL.Add(' AND m.cd_mensalidade = ' + qyDesconto.FieldByName('cd_mensalidade').AsString);
   End
   else begin
      qyAlunos.SQL.Add(
      ' AND m.codigoaluno = :Codigo                     ' +
      ' AND m.turma = :Turma                            ' +
      ' AND m.anosemestre = :AnoSemestre                ' +
      ' AND m.parcela >= :Parcela1 AND m.parcela <= :Parcela2 ' +
      ' AND m.tipoparcela <> 1 AND m.situacao <> 0 AND m.situacao <> 1 ');

      qyAlunos.ParamByName('turma').AsString := qyDesconto.FieldByName('turma').AsString;
      qyAlunos.ParamByName('anosemestre').AsInteger := qyDesconto.FieldByName('anosemestre').AsInteger;
      qyAlunos.ParamByName('parcela1').AsInteger := iParcelaInicial;
      qyAlunos.ParamByName('parcela2').AsInteger := iParcelaFinal;
      qyAlunos.ParamByName('codigo').AsInteger := qyDesconto.FieldByName('codigoaluno').AsInteger;
   end;

    // Conferir Bloqueio de Alterações por data
   dtBloqueio := DM.DataBloqueioFinanceiro(0);

//   if dtBloqueio <> 0 then begin
//      qyAlunos.SQL.Add(' AND (m.datavencimento > "' + FormatDateTime('yyyy-mm-dd', dtBloqueio) + '" )');
//   end;

   qyAlunos.SQL.Add(
      ' GROUP BY                                                  ' +
      '     m.cd_mensalidade_origem                               '
      );

   qyAlunos.Open;

   if rbDescontoEmDia.Checked then begin


      while not qyAlunos.Eof do begin

            with qyAplica do begin
               Close;
               SQL.Clear;
               SQL.Add( 'UPDATE mensalidades                           ' );
               SQL.Add(' SET valordesconto = :novovalor                ' );
               SQL.Add(' ,cd_desc_condicional = :cd_desc_condicional   ' );
               SQL.Add(' ,ds_obs_desc = :ds_obs_desc                   ' );
               SQL.Add(' WHERE cd_mensalidade = :CdMensalidade         ' );
               ParamByName('CdMensalidade').AsInteger := qyAlunos.FieldByName('cd_mensalidade').AsInteger;
               ParamByName('novovalor').AsFloat := cValorDesconto;
               ParamByName('cd_desc_condicional').AsInteger := ListaAcao[cbAcaoMovimento.ItemIndex];
               ParamByName('ds_obs_desc').AsString :=edObservacao.text;
               ExecSQL;
               DM.FazAcaoRemessa(arAltMensalidade, qyAlunos.FieldByName('cd_mensalidade').AsInteger);

            end;
            sChave := qyAlunos.FieldByName('cd_mensalidade').AsString + ';' +
                      FormatDateTime('dd/mm/yyyy', Dm.DataAtual) + ';' +
                      FloatToStr(cValorDesconto) + ';';

            Dm.setLog(2020, 'Inclusao', sChave, qyAlunos.FieldByName('cd_coligada').AsInteger, 'Desconto efetuado no valor de: ' + FloatToStr(cValorDesconto));

            qyAlunos.Next;
       end;

          Self.ModalResult := mrOk;
          CloseModal();
          Exit;

   end

   else begin
           // Desconto Extra;

          Movimento := TMovimento.Create;


          while not qyAlunos.Eof do begin
          
             if ( NOT DM.EstaBloqueado(qyAlunos.FieldByName('datavencimento').AsDatetime, True) ) AND
                ( NOT DM.EstaBloqueado(qyAlunos.FieldByName('dt_competencia').AsDatetime, True) )

             then begin


                 if cValorDesconto > qyAlunos.FieldByName('pendente').AsCurrency then begin
                    cValorAux := qyAlunos.FieldByName('pendente').AsCurrency
                 end
                 else begin
                    cValorAux := cValorDesconto;
                 end;

                 with qyAplica do begin

                   Close;
                   SQL.Clear;
                   SQL.Add( 'UPDATE mensalidades                           ' );
                   SQL.Add(' SET descontoextra = :novovalor ');

                   if ckbDescCondi.Checked then begin

                      SQL.Add(' , valordesconto = :NovoValDesc ');

                   end;

                   if (RoundFLoat(qyAlunos.FieldByName('pendente').AsCurrency - cValorAux,2) <=  0) AND
                      (qyAlunos.FieldByName('situacao').AsInteger IN [2,10] ) then
                   begin
                      SQL.Add(', datapagamento = :DtPagamento, valorjuros = 0 ');

                      if ( (DM.DataAtual() < qyAlunos.FieldByName('datavencimento').AsDateTime) OR
                         ( Dm.variavel_parametro('mensalidades_data_baixa') = '[VENCIMENTO]' ) ) AND
                         ( (Dm.variavel_parametro('mensalidades_data_baixa') <> '[BAIXA]') AND
                           (Dm.variavel_parametro('mensalidades_data_baixa') <> '[ATUAL]') )
                      then
                         ParamByName('DtPagamento').AsString := FormatDateTime('yyyy-mm-dd',qyAlunos.FieldByName('datavencimento').AsDateTime)
                      else
                         ParamByName('DtPagamento').AsString := FormatDateTime('yyyy-mm-dd',DM.DataAtual());
                   end;

                   SQL.Add(' WHERE cd_mensalidade = :CdMensalidade ' );

                   qyAcao.Close;
                   qyAcao.SQL.Clear;
                   qyAcao.SQL.Add(
                     ' SELECT SUM(m.vl_saida)-IFNULL((select sum(ifnull(descontoextra,0)) from mensalidades where cd_mensalidade_origem = :CdMensalidade and cd_mensalidade < :CdMensalidadeNova),0) ValSaida FROM fin_mov_cr m, fin_acoes_movimento a ' +
                     ' WHERE m.cd_acao = a.cd_acao AND  ' +
                     '    m.cd_mensalidade = :CdMensalidade AND a.cd_tipo_acao = 3 '
                   );

                   qyAcao.ParamByName('CdMensalidade').AsInteger := qyAlunos.FieldByName('cd_mensalidade_origem').AsInteger;
                   qyAcao.ParamByName('CdMensalidadeNova').AsInteger := qyAlunos.FieldByName('cd_mensalidade').AsInteger;
                   qyAcao.Open;

                   // Descobrir o valor atual dos descontos na movimentação...

                   ParamByName('CdMensalidade').AsInteger := qyAlunos.FieldByName('cd_mensalidade').AsInteger;
                   ParamByName('novovalor').AsFloat := qyAcao.FieldByName('ValSaida').AsCurrency + cValorAux;

                   if ckbDescCondi.Checked then begin

                      ParamByName('NovoValDesc').AsFloat :=
                         ( qyAlunos.FieldByName('valordesconto').AsCurrency / (qyAlunos.FieldByName('valorbruto').AsCurrency - qyAcao.FieldByName('ValSaida').AsCurrency) ) // Indice de desconto
                         *
                         (qyAlunos.FieldByName('valorbruto').AsCurrency -  (qyAcao.FieldByName('ValSaida').AsCurrency + cValorAux))
                   end;

                   ExecSQL;

                 end;

                 Movimento.TipoDeAcao := BaixarporDesconto;
                 Movimento.CodigoTitulo := qyAlunos.FieldByName('cd_mensalidade_origem').AsInteger;
                 Movimento.Coligada := qyAlunos.FieldByName('cd_coligada').AsInteger;
                 Movimento.CodigoMovimento := qyAlunos.FieldByName('cd_mensalidade').AsInteger;
                 Movimento.CodAcao :=  ListaAcao[cbAcaoMovimento.ItemIndex];
                 Movimento.Observacao := edObservacao.Text;
                 Movimento.ValorMovimento := cValorAux;

                 Movimento.RegistrarMovimentacaoCR(0);

                 DM.FazAcaoRemessa(arDesconto, qyAlunos.FieldByName('cd_mensalidade').AsInteger);

                 sChave := qyAlunos.FieldByName('cd_mensalidade').AsString + ';' +
                           FormatDateTime('dd/mm/yyyy', Dm.DataAtual) + ';' +
                           FloatToStr(cValorAux) + ';';

                 Dm.setLog(2020, 'Inclusao', sChave, qyAlunos.FieldByName('cd_coligada').AsInteger, 'Desconto Fixo no valor de: ' + FloatToStr(cValorAux));

             end;
             qyAlunos.Next();

          end;

          Movimento.Free();

          Self.ModalResult := mrOk;
          CloseModal();
          Exit;

   end;

   Self.ModalResult := mrOk;
   CloseModal();

end;

procedure Tfrm_Mensa_Outras_Baixas.ConfirmarDesconto100;
Var
   Movimento : TMovimento;

   iParcelaInicial,
   iParcelaFinal : Integer;
   cValor : Currency;
   cValorAux : Currency;

   qyAlunos : TUMZQuery;

   sChave : String;

   objRemessa: TRemessa;

begin

   try
      iParcelaInicial := StrToInt(edParcelaInicio.Text);
      iParcelaFinal := StrToInt(edParcelaFinal.Text);
   except
      Mensagem('Digite um valor numérico para as parcelas.', 'Atenção', MB_OK + MB_ICONWARNING);
      edParcelaInicio.SetFocus;
      Exit;
   end;

   try
      cValor := StrToCurr(edValorDesconto.Text);
   except
      Mensagem('Ocorreu um erro ao reconhecer o valor do cancelamento.', 'Atenção', MB_OK + MB_ICONWARNING);
      edValorDesconto.SetFocus;
      Exit;
   end;

   if Length(Trim(edObservacao.Text)) = 0 then begin
      Mensagem('É necessário colocar uma justificativa para a aplicação do desconto financeiro 100%.', 'Atenção', MB_OK + MB_ICONWARNING);
      exit;
   end;

   Dm.CriarConsulta(qyAlunos);
   qyAlunos.Close;
   qyAlunos.SQL.Clear;


   //Verifica se a conexão é Oracle ou MySQL
   if qyAlunos.Connection.Protocol = 'oracle' then //Oracle
   begin
      qyAlunos.SQL.Add(
         ' SELECT                ' +
         '   m.cd_mensalidade_origem,                                ' +
         '   FIRST_OCCURRENCE(m.cd_mensalidade) cd_mensalidade, m.nossonumero, m.cd_coligada, FIRST_OCCURRENCE(m.valorjuros) valorjuros, ' +
         '   (SUM(f.vl_entrada) - Sum(f.vl_saida)) Pendente          ' +
         ' FROM                                                      ' +
         '   mensalidades m INNER JOIN pessoas p ON (m.codigoaluno = p.cd_pessoa)       ' +
         '   LEFT JOIN fin_mov_cr f ON (m.cd_mensalidade_origem = f.cd_mensalidade)     ' +
         ' WHERE                                                     ' +
         '    1 = 1   ');
   end else begin
      qyAlunos.SQL.Add(
         ' SELECT                ' +
         '   m.cd_mensalidade_origem,                                ' +
         '   m.cd_mensalidade, m.nossonumero, m.cd_coligada, m.valorjuros,          ' +
         '   (SUM(f.vl_entrada) - Sum(f.vl_saida)) Pendente          ' +
         ' FROM                                                      ' +
         '   mensalidades m INNER JOIN pessoas p ON (m.codigoaluno = p.cd_pessoa)       ' +
         '   LEFT JOIN fin_mov_cr f ON (m.cd_mensalidade_origem = f.cd_mensalidade)     ' +
         ' WHERE                                                     ' +
         '    1 = 1   ');
   end;

   if iParcelaInicial = iParcelaFinal then begin
       qyAlunos.SQL.Add(' AND m.cd_mensalidade = ' + qyDesconto.FieldByName('cd_mensalidade').AsString);
   End
   else begin
      qyAlunos.SQL.Add(
      ' AND m.codigoaluno = :Codigo                     ' +
      ' AND m.turma = :Turma                            ' +
      ' AND m.anosemestre = :AnoSemestre                ' +
      ' AND m.parcela >= :Parcela1 AND m.parcela <= :Parcela2 ' +
      ' AND m.situacao in (2,10) ');

     // Verificar se é permitido o cancelamento de títulos com data de competência/vencimento bloqueadas.
     // Como padrão o sistema deve deixar cancelar, visto que é normal cancelamentos após o faturamento
     // Sendo que a data do cancelamento é colocada como sendo a data atual.

      if DM.variavel_parametro('FinanceiroCancelaDataBloqueada') = 'N' then begin

         qyAlunos.SQL.Add(' AND m.datavencimento > :data_bloqueio1 ');
         qyAlunos.SQL.Add(' AND m.dt_competencia > :data_bloqueio2 ');

         qyAlunos.ParamByName('data_bloqueio1').AsDate := Dm.DataBloqueioFinanceiro(0);
         qyAlunos.ParamByName('data_bloqueio2').AsDate := Dm.DataBloqueioFinanceiro(0);

      end;

      qyAlunos.ParamByName('turma').AsString := qyDesconto.FieldByName('turma').AsString;
      qyAlunos.ParamByName('anosemestre').AsInteger := qyDesconto.FieldByName('anosemestre').AsInteger;
      qyAlunos.ParamByName('parcela1').AsInteger := iParcelaInicial;
      qyAlunos.ParamByName('parcela2').AsInteger := iParcelaFinal;
      qyAlunos.ParamByName('codigo').AsInteger := qyDesconto.FieldByName('codigoaluno').AsInteger;
   end;
   qyAlunos.SQL.Add(
      ' GROUP BY                                                  ' +
      '     m.cd_mensalidade_origem, m.cd_coligada                '
      );

   qyAlunos.Open;

   Movimento := TMovimento.Create;

   while not qyAlunos.Eof do begin

      if cValor > qyAlunos.FieldByName('pendente').AsCurrency then begin
         cValorAux := qyAlunos.FieldByName('pendente').AsCurrency
      end
      else begin
         cValorAux := cValor;
      end;

      // Salva o valor desconto condicional existente hoje (para caso reverter o desconto 100%, possa ser revertido o desconto condicional também)
      Dm.qyAux.Close;
      DM.qyAux.SQL.Clear;
      DM.qyAux.SQL.Add(
         ' UPDATE mensalidades       ' +
         ' SET valordesconto_fixo = valordesconto ' +
         ' WHERE cd_mensalidade = :CdMensalidade ');
      DM.qyAux.ParamByName('CdMensalidade').AsInteger := qyAlunos.FieldByName('cd_mensalidade').AsInteger;;
      DM.qyAux.ExecSQL();
      

      Dm.qyAux.Close;
      DM.qyAux.SQL.Clear;
      DM.qyAux.SQL.Add(
         ' UPDATE mensalidades       ' +
         ' SET datapagamento = :DtPagamento, '+
         '     situacao = 7, valordesconto = valorbruto + COALESCE(valorextra,0) - COALESCE(descontoextra, 0), valortotal = 0 ' +
         ' WHERE cd_mensalidade = :CdMensalidade ');

      if ( (DM.DataAtual() < qyDesconto.FieldByName('datavencimento').AsDateTime) OR
         ( Dm.variavel_parametro('mensalidades_data_baixa') = '[VENCIMENTO]' ) ) AND
         ( (Dm.variavel_parametro('mensalidades_data_baixa') <> '[BAIXA]') AND
           (Dm.variavel_parametro('mensalidades_data_baixa') <> '[ATUAL]') ) AND
         ( NOT DM.EstaBloqueado(qyDesconto.FieldByName('datavencimento').AsDateTime, false) ) AND
         ( NOT DM.EstaBloqueado(qyDesconto.FieldByName('dt_competencia').AsDateTime, false) )
      then
         DM.qyAux.ParamByName('DtPagamento').AsString := FormatDateTime('yyyy-mm-dd',qyDesconto.FieldByName('datavencimento').AsDateTime)
      else
         DM.qyAux.ParamByName('DtPagamento').AsString := FormatDateTime('yyyy-mm-dd',DM.DataAtual());

      DM.qyAux.ParamByName('CdMensalidade').AsInteger := qyAlunos.FieldByName('cd_mensalidade').AsInteger;;
      DM.qyAux.ExecSQL();

      Movimento.TipoDeAcao := BaixarporCancelamento;
      Movimento.CodigoTitulo := qyAlunos.FieldByName('cd_mensalidade_origem').AsInteger;
      Movimento.Coligada := qyAlunos.FieldByName('cd_coligada').AsInteger;
      Movimento.CodigoMovimento := qyAlunos.FieldByName('cd_mensalidade').AsInteger; // Aqui é que tem q alterar na planilha de mensalidades
      Movimento.CodAcao :=  edAcaoDesconto100.Tag;
      Movimento.Observacao := edObservacao.Text;
      Movimento.ValorMovimento := cValorAux;
      Movimento.ValorJuros := qyAlunos.FieldByName('valorjuros').AsCurrency;
      Movimento.RegistrarMovimentacaoCR(0);

      DM.FazAcaoRemessa(arCancelar, qyAlunos.FieldByName('cd_mensalidade').AsInteger);

      if DM.variavel_parametro('sn_processo_remessa_novo') = '1' then
      begin
        // registra a nova ação de baixa no novo modelo de remessa
        objRemessa := TRemessa.Create;
        objRemessa.registraAcaoCancelamento(qyAlunos.FieldByName('nossonumero').AsString);
      end;

      sChave := qyAlunos.FieldByName('cd_mensalidade').AsString + ';' +
                FormatDateTime('dd/mm/yyyy', Dm.DataAtual) + ';';

      Dm.setLog(2070, 'Inclusao', sChave, qyAlunos.FieldByName('cd_coligada').AsInteger, 'Desconto Financeiro 100% no valor de: ' + FloatToStr(cValorAux));

      qyAlunos.Next;

   end;

   Movimento.Free;

   Self.ModalResult := mrOk;
   CloseModal();

end;
end.
