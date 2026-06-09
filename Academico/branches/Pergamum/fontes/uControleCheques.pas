unit uControleCheques;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Grids, DBGrids, ImgList, DBCtrls, ComCtrls, ToolWin, ExtCtrls, DB,
  ZConnection, Menus, StdCtrls, Buttons, ZAbstractRODataset, ZAbstractDataset,
  ZDataset, UZDataset;

type
  TfControleCheques = class(TForm)
    Bevel4: TBevel;
    pnRemessaTit: TPanel;
    toolPessoa: TToolBar;
    ToolButton6: TToolButton;
    ToolButton1: TToolButton;
    btIncluir: TToolButton;
    btAlterar: TToolButton;
    btExcluir: TToolButton;
    ToolButton3: TToolButton;
    ToolButton4: TToolButton;
    btFechar: TToolButton;
    ToolButton2: TToolButton;
    ImageList2: TImageList;
    bgCheques: TDBGrid;
    Bevel1: TBevel;
    ToolButton5: TToolButton;
    qyChequesAct: TUMZQuery;
    dtcCheques: TDataSource;
    ToolButton7: TToolButton;
    qyChequesActds_cheque: TStringField;
    qyChequesActds_conta: TStringField;
    qyChequesActds_banco: TStringField;
    qyChequesActds_agencia: TStringField;
    qyChequesActdt_compensacao: TDateField;
    qyChequesActnr_valor: TFloatField;
    btMensalidades: TToolButton;
    ToolButton9: TToolButton;
    pmMensalidades: TPopupMenu;
    qyChequesActds_observacao: TMemoField;
    qyChequesMensalidades: TUMZQuery;
    btnTransferir: TToolButton;
    ToolButton10: TToolButton;
    sbSelecionarColuna: TSpeedButton;
    ToolButton8: TToolButton;
    Panel1: TPanel;
    qyChequesActdt_emissao: TDateTimeField;
    btnDesmarcar: TSpeedButton;
    btnMarcar: TSpeedButton;
    qyChequesActcd_cheque: TIntegerField;
    qyChequesActcd_situacao: TLargeintField;
    qyChequesActcd_caixa: TLargeintField;
    qryCheques: TUMZReadOnlyQuery;
    qryChequesCD_CHEQUE: TIntegerField;
    qryChequesDS_CHEQUE: TStringField;
    qryChequesDS_CONTA: TStringField;
    qryChequesDS_BANCO: TStringField;
    qryChequesDS_AGENCIA: TStringField;
    qryChequesDT_COMPENSACAO: TDateTimeField;
    qryChequesCD_SITUACAO: TLargeintField;
    qryChequesNR_VALOR: TFloatField;
    qryChequesCD_ORIGEM: TSmallintField;
    qryChequesCD_CAIXA: TLargeintField;
    qryChequesDT_EMISSAO: TDateTimeField;
    qryChequesCD_MENSALIDADE: TStringField;
    qryChequesCODIGOALUNO: TStringField;
    qryChequesPARCELA: TStringField;
    qryChequesTURMA: TStringField;
    qryChequesNM_PESSOA: TStringField;
    qryChequesSITUACAO: TStringField;
    qryChequesDS_CAIXA: TStringField;
    qryChequesSELECAO: TBooleanField;
    qryGetObsCheque: TUMZReadOnlyQuery;
    qryGetObsChequeDS_OBSERVACAO: TMemoField;
    qryGetAlunoCheque: TUMZReadOnlyQuery;
    qryChequesQTDMENSALIDADES: TLargeintField;
    qryChequesQTDALUNOS: TLargeintField;
    qryChequesnm_titular: TStringField;
    qyChequesActnm_titular: TStringField;
    qryGetValorTotalMensa: TUMZQuery;
    procedure qryChequesAfterOpen(DataSet: TDataSet);
    procedure qryChequesBeforeClose(DataSet: TDataSet);
    procedure btnDesmarcarClick(Sender: TObject);
    procedure btnMarcarClick(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure bgChequesDblClick(Sender: TObject);
    procedure sbSelecionarColunaClick(Sender: TObject);
    procedure btnTransferirClick(Sender: TObject);
    procedure bgChequesTitleClick(Column: TColumn);
    procedure pmMensalidadesPopup(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure btExcluirClick(Sender: TObject);
    procedure btIncluirClick(Sender: TObject);
    procedure btAlterarClick(Sender: TObject);
    procedure btFecharClick(Sender: TObject);
    procedure ToolButton7Click(Sender: TObject);
    procedure ToolButton5Click(Sender: TObject);
    procedure bgChequesDrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumn; State: TGridDrawState);
    procedure FormCreate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure cbGridClick(Sender: TObject);
    procedure bgChequesCellClick(Column: TColumn);
  private
    { Private declarations }
    sFAluno: string;
    sFNumero: string;
    sFAgencia: string;
    sFBanco: string;
    sFConta: string;
    sFValorMenor: string;
    sFValorMaior: string;
    sFDtInicio: TDateTime;
    sFDtFim: TDateTime;
    sFDtEmissaoInicio: TDateTime;
    sFDtEmissaoFim: TDateTime;
    sFSituacao: string;
    sFAnoSem: string;
    sFCaixa: string;
    sFTitular: string;
    sOrdem : String;
    sUnidades : String;
    FMostraCaixasInativos : Boolean;
    FColigadas: TStrings;
    FSSQLOriginal: string;
    ASelList: TStringList;
    Procedure AlteraMensalidade(Sender :TObject);
    procedure salvaChequesMensalidades();
    Procedure GerarTitulo(intCheque : Integer);
  public
    bk: Pointer;
    { Public declarations }
    procedure Filtra();

  end;

var
  fControleCheques: TfControleCheques;

implementation

{$R *.dfm}

uses
   Main, uDM, General, uProcuraCheque, uUsuario, uTransferenciaCheques,
   uCamposPlanilhas, uHistoricoCheque;

{ TfControleCheques }

procedure TfControleCheques.Filtra;
const
   S_OP = ' AND ';
   S_FIL_CHEQUE = 'C.DS_CHEQUE LIKE :DS_CHEQUE';
   S_FIL_ALUNO = 'M.CODIGOALUNO = :CODIGOALUNO';
   S_FIL_TITULAR = 'C.NM_TITULAR = :NM_TITULAR';
   S_FIL_ANOSEM = 'M.ANOSEMESTRE = :ANOSEMESTRE';
   S_FIL_AGENCIA = 'C.DS_AGENCIA LIKE :DS_AGENCIA';
   S_FIL_BANCO = 'C.DS_BANCO LIKE :DS_BANCO';
   S_FIL_CONTA = 'C.DS_CONTA LIKE :DS_CONTA';
   S_FIL_SITUACAO = 'C.CD_SITUACAO = :CD_SITUACAO';
   S_FIL_CAIXA = 'C.CD_CAIXA = :CD_CAIXA';
   S_FIL_DTCOMP = 'C.DT_COMPENSACAO BETWEEN :DT_COMP_INI AND :DT_COMP_FIM';
   S_FIL_DTEMI = 'C.DT_EMISSAO BETWEEN :DT_EMI_INI AND :DT_EMI_FIM';
   S_FIL_VALOR_MAIOR_QUE = 'C.NR_VALOR >= :NR_VALOR_MENOR';
   S_FIL_VALOR_MENOR_QUE = 'C.NR_VALOR <= :NR_VALOR_MAIOR';
   S_FIL_VALOR_ENTRE = 'C.NR_VALOR BETWEEN :NR_VALOR_MENOR AND :NR_VALOR_MAIOR';
   S_FIL_NUNIDADE_NINATIVO = 'CC.SN_ATIVA = ''S'' AND CC.SN_TODAS_COLIGADAS = 1';
   S_FIL_SUNIDADE_NINATIVO = 'CC.SN_ATIVA = ''S''';
   S_FIL_COLIGADAS = '(CC.CD_COLIGADA IN (%s) OR CC.SN_TODAS_COLIGADAS = 1)';
   S_FIL_SCAIXA = '(CC.SN_ATIVA = ''N'' OR CC.CD_CAIXA IS NULL)';
   S_FIL_SCAIXA_ADCIONAL = '((%s) OR ((%s) AND ' + S_FIL_SCAIXA + '))';
var
   I: integer;
   LSFiltro: string;
   LParams: TParams;
begin
   LSFiltro := EmptyStr;
   ASelList.Clear;
   LParams := TParams.Create;
   try
      if Trim(sFNumero) <> '' then
      begin
         if LSFiltro <> EmptyStr then
            LSFiltro := LSFiltro + S_OP;
         LSFiltro := LSFiltro + S_FIL_CHEQUE;
         LParams.CreateParam(ftUnknown, 'DS_CHEQUE', ptUnknown).AsString := '%' + sFNumero + '%';
      end;
      if Trim(sFAluno) <> '' then
      begin
         if LSFiltro <> EmptyStr then
            LSFiltro := LSFiltro + S_OP;
         LSFiltro := LSFiltro + S_FIL_ALUNO;
         LParams.CreateParam(ftUnknown, 'CODIGOALUNO', ptUnknown).AsString := sFAluno;
      end;
      if Trim(sFTitular) <> '' then
      begin
         if LSFiltro <> EmptyStr then
            LSFiltro := LSFiltro + S_OP;
         LSFiltro := LSFiltro + S_FIL_TITULAR;
         LParams.CreateParam(ftUnknown, 'NM_TITULAR', ptUnknown).AsString := sFTitular;
      end;
      if Trim(sFAnoSem) <> '' then
      begin
         if LSFiltro <> EmptyStr then
            LSFiltro := LSFiltro + S_OP;
         LSFiltro := LSFiltro + S_FIL_ANOSEM;
         LParams.CreateParam(ftUnknown, 'ANOSEMESTRE', ptUnknown).AsString := sFAnoSem;
      end;
      if Trim(sFAgencia) <> '' then
      begin
         if LSFiltro <> EmptyStr then
            LSFiltro := LSFiltro + S_OP;
         LSFiltro := LSFiltro + S_FIL_AGENCIA;
         LParams.CreateParam(ftUnknown, 'DS_AGENCIA', ptUnknown).AsString := '%' + sFAgencia + '%';
      end;
      if Trim(sFBanco) <> '' then
      begin
         if LSFiltro <> EmptyStr then
            LSFiltro := LSFiltro + S_OP;
         LSFiltro := LSFiltro + S_FIL_BANCO;
         LParams.CreateParam(ftUnknown, 'DS_BANCO', ptUnknown).AsString := '%' + sFBanco + '%';
      end;
      if Trim(sFConta) <> '' then
      begin
         if LSFiltro <> EmptyStr then
            LSFiltro := LSFiltro + S_OP;
         LSFiltro := LSFiltro + S_FIL_CONTA;
         LParams.CreateParam(ftUnknown, 'DS_CONTA', ptUnknown).AsString := '%' + sFConta + '%';
      end;
      if Trim(sFSituacao) <> '' then
      begin
         if LSFiltro <> EmptyStr then
            LSFiltro := LSFiltro + S_OP;
         LSFiltro := LSFiltro + S_FIL_SITUACAO;
         LParams.CreateParam(ftUnknown, 'CD_SITUACAO', ptUnknown).AsString := sFSituacao;
      end;
      if Trim(sFCaixa) <> '' then
      begin
         if LSFiltro <> EmptyStr then
            LSFiltro := LSFiltro + S_OP;
         LSFiltro := LSFiltro + S_FIL_CAIXA;
         LParams.CreateParam(ftUnknown, 'CD_CAIXA', ptUnknown).AsString := sFCaixa;
      end;
      if (sFDtInicio > 0) and (sFDtFim > 0) then
      begin
         if LSFiltro <> EmptyStr then
            LSFiltro := LSFiltro + S_OP;
         LSFiltro := LSFiltro + S_FIL_DTCOMP;
         LParams.CreateParam(ftUnknown, 'DT_COMP_INI', ptUnknown).AsString := FormatDateTime('yyyy-mm-dd', sFDtInicio);
         LParams.CreateParam(ftUnknown, 'DT_COMP_FIM', ptUnknown).AsString := FormatDateTime('yyyy-mm-dd', sFDtFim);
      end;
      if (sFDtEmissaoInicio > 0) and (sFDtEmissaoFim > 0) then
      begin
         if LSFiltro <> EmptyStr then
            LSFiltro := LSFiltro + S_OP;
         LSFiltro := LSFiltro + S_FIL_DTEMI;
         LParams.CreateParam(ftUnknown, 'DT_EMI_INI', ptUnknown).AsString := FormatDateTime('yyyy-mm-dd 00:00:01', sFDtEmissaoInicio);
         LParams.CreateParam(ftUnknown, 'DT_EMI_FIM', ptUnknown).AsString := FormatDateTime('yyyy-mm-dd 23:59:59', sFDtEmissaoFim);
      end;
      if (sFValorMenor <> '') and (sFValorMaior <> '') then
      begin
         if LSFiltro <> EmptyStr then
            LSFiltro := LSFiltro + S_OP;
         LSFiltro := LSFiltro + S_FIL_VALOR_ENTRE;
         LParams.CreateParam(ftUnknown, 'NR_VALOR_MENOR', ptUnknown).AsString := sFValorMenor;
         LParams.CreateParam(ftUnknown, 'NR_VALOR_MAIOR', ptUnknown).AsString := sFValorMaior;
      end
      else if sFValorMenor <> '' then
      begin
         if LSFiltro <> EmptyStr then
            LSFiltro := LSFiltro + S_OP;
         LSFiltro := LSFiltro + S_FIL_VALOR_MAIOR_QUE;
         LParams.CreateParam(ftUnknown, 'NR_VALOR_MENOR', ptUnknown).AsString := sFValorMenor;
      end
      else if sFValorMaior <> '' then
      begin
         if LSFiltro <> EmptyStr then
            LSFiltro := LSFiltro + S_OP;
         LSFiltro := LSFiltro + S_FIL_VALOR_MENOR_QUE;
         LParams.CreateParam(ftUnknown, 'NR_VALOR_MAIOR', ptUnknown).AsString := sFValorMaior;
      end;

      if FColigadas.Count > 0 then
      begin
         if LSFiltro <> EmptyStr then
            LSFiltro := LSFiltro + S_OP;
         LSFiltro := LSFiltro + Format(S_FIL_COLIGADAS, [FColigadas.DelimitedText]);
      end;

      if FMostraCaixasInativos then
         if LSFiltro = EmptyStr then
            LSFiltro := S_OP + S_FIL_SCAIXA
         else
            LSFiltro := S_OP + Format(S_FIL_SCAIXA_ADCIONAL, [LSFiltro, LSFiltro])
      else if LSFiltro <> EmptyStr then
         LSFiltro := S_OP + LSFiltro;

      if sOrdem = '' then
         sOrdem := 'C.DT_COMPENSACAO, C.CD_SITUACAO';
      qryCheques.Close;
      qryCheques.SQLList.Values[DM.db.Protocol] := Format(FSSQLOriginal, [LSFiltro, sOrdem]);

      for I := 0 to LParams.Count - 1 do
         qryCheques.ParamByName(LParams.Items[I].Name).AsString := LParams.ParamValues[LParams.Items[I].Name];

      qryCheques.Open;
   finally
      LParams.Free;
   end;
end;

procedure TfControleCheques.ToolButton5Click(Sender: TObject);
begin
   if not PrincipalForm.ProcuraForm( TForm(frmProcuraCheque) ) then begin
      Application.CreateForm( TfrmProcuraCheque, frmProcuraCheque )
   end;

   frmProcuraCheque.setTab(frmProcuraCheque.tsBuscarAvancado);
   frmProcuraCheque.txtAluno.Text := sFAluno;
   frmProcuraCheque.edAAgencia.Text := sFAgencia;
   frmProcuraCheque.edABanco.Text := sFBanco;
   frmProcuraCheque.edACCorrente.Text := sFConta;
   frmProcuraCheque.edACheque.Text := sFNumero;
   frmProcuraCheque.mskAnoSem.Text := sFAnoSem;
   frmProcuraCheque.chkMostrarCaixasInativos.Checked := FMostraCaixasInativos;
   frmProcuraCheque.Coligadas.Assign(FColigadas);
   //datas

   if ((sFDtInicio > 0) and (sFDtFim > 0)) then begin
      frmProcuraCheque.ckbData.Checked := True;
      frmProcuraCheque.umdtVencInicial.Date := sFDtInicio;
      frmProcuraCheque.umdtVencFinal.Date := sFDtFim;
   end
   else begin
      frmProcuraCheque.ckbData.Checked := False;
      frmProcuraCheque.umdtVencInicial.Date := Now();
      frmProcuraCheque.umdtVencFinal.Date := Now();
   end;

   if ((sFDtEmissaoInicio > 0) and (sFDtEmissaoFim > 0)) then
   begin
      frmProcuraCheque.ckbEmissao.Checked := True;
      frmProcuraCheque.umdtEmissaoDe.Date := sFDtEmissaoInicio;
      frmProcuraCheque.umdtEmissaoAte.Date := sFDtEmissaoFim;
   end
   else
   begin
      frmProcuraCheque.ckbEmissao.Checked := False;
      frmProcuraCheque.umdtEmissaoDe.Date := Now();
      frmProcuraCheque.umdtEmissaoAte.Date := Now();
   end;


   //define situacao
   if sFSituacao = '' then
      frmProcuraCheque.cbListaSituacao.ItemIndex := 0
   else
      frmProcuraCheque.cbListaSituacao.ItemIndex := frmProcuraCheque.slSituacoes.IndexOfName(sFSituacao);

   frmProcuraCheque.ShowModal();

   if not frmProcuraCheque.flagCancel then begin
      btnDesmarcarClick(nil);
      sFAluno := frmProcuraCheque.txtAluno.Text;
      sFAgencia := frmProcuraCheque.edAAgencia.Text;
      sFBanco := frmProcuraCheque.edABanco.Text;
      sFConta := frmProcuraCheque.edACCorrente.Text;
      sFNumero := frmProcuraCheque.edACheque.Text;
      sFAnoSem := frmProcuraCheque.mskAnoSem.Text;
      FColigadas.Assign(frmProcuraCheque.Coligadas);
      FMostraCaixasInativos := frmProcuraCheque.chkMostrarCaixasInativos.Checked;

      // Verifica se deseja efetuar filtro por valor
      if frmProcuraCheque.FCbVlMaiorIgual.Checked then
      begin
         Self.sFValorMenor := frmProcuraCheque.FEdVlMaiorIgual.Text;
      end else
      begin
         Self.sFValorMenor := '';
      end;
      if frmProcuraCheque.FCbVlMenorIgual.Checked then
      begin
         Self.sFValorMaior := frmProcuraCheque.FEdVlMenorIgual.Text;
      end else
      begin
         Self.sFValorMaior := '';
      end;

      if frmProcuraCheque.ckbData.Checked then begin
         sFDtInicio := frmProcuraCheque.umdtVencInicial.Date;
         sFDtFim := frmProcuraCheque.umdtVencFinal.Date;
      end
      else begin
         sFDtInicio := 0;
         sFDtFim := 0;
      end;

      if frmProcuraCheque.ckbEmissao.Checked then begin
         sFDtEmissaoInicio := frmProcuraCheque.umdtEmissaoDe.Date;
         sFDtEmissaoFim := frmProcuraCheque.umdtEmissaoAte.Date;
      end
      else begin
         sFDtEmissaoInicio := 0;
         sFDtEmissaoFim := 0;
      end;

      if frmProcuraCheque.cbListaSituacao.ItemIndex = 0 then
         sFSituacao:= ''
      else
         sFSituacao := frmProcuraCheque.slSituacoes.Names[frmProcuraCheque.cbListaSituacao.ItemIndex-1];


      if frmProcuraCheque.cbListaConta.ItemIndex = 0 then
         sFCaixa:= ''
      else
         sFCaixa    := IntToStr(frmProcuraCheque.ListaContas[frmProcuraCheque.cbListaConta.ItemIndex-1]);

      sFTitular := frmProcuraCheque.txtnm_titular.Text;

      Filtra();
   end;
end;

procedure TfControleCheques.ToolButton7Click(Sender: TObject);
begin
   sFAluno := '';
   sFAgencia := '';
   sFBanco := '';
   sFConta := '';
   sFNumero := '';
   sFAnoSem := '';
   sFDtInicio := 0;
   sFDtFim := 0;
   sFSituacao := '';
   FMostraCaixasInativos := True;
   Filtra();
end;

procedure TfControleCheques.btnTransferirClick(Sender: TObject);
const
   S_MSG_SEM_SELECAO = 'É necessário selecionar pelo menos um cheque para efetuar a transferência.';
   MSG_QTD_CHEQUES = 'Quantidade de Cheques Transferidos:';

   SQL_PERMISSAO_CAIXA = '' +
   'SELECT                             ' +
   '  *                                ' +
   'FROM                               ' +
   '  fin_contas_usuarios              ' +
   'WHERE                              ' +
   '  cd_caixa = :cd_caixa             ' +
   '  AND cd_coligada IN (%s)   ' +
   '  AND cd_usuario = :cd_usuario     ';
var
  i: Integer;
  iCodMensalidade, iCodCheque: Integer;
  iChequeAnterior, iQtdCheques: Integer;
  cTotalCheques : Currency;
  sCodigosCheques : String;
  qyPermissaoCaixa: TUMZQuery;
  msgSemPerm: String;
  marcadoValido, Found: Boolean;
begin
   // Criar a Permissao
   if not DM.UsuarioLogado.TemPermissao( 2050, npIncluir, True ) then Exit;

   Found := False;

   for I := 0 to ASelList.Count - 1 do
      if ASelList.ValueFromIndex[I] = '1' then
      begin
         Found := True;
         Break;
      end;

   if not Found then
   begin
      MessageDlg(S_MSG_SEM_SELECAO, mtInformation, [mbOK], 0);
      Exit;
   end;

   DM.CriarConsulta(qyPermissaoCaixa);
   msgSemPerm := '';

   marcadoValido := False;

   for i := 0 to ASelList.Count - 1 do
   begin

      if (ASelList.ValueFromIndex[i] = '1') then
      begin
         iCodCheque := StrToInt(ASelList.Names[i]);

         if (qryCheques.Locate('cd_cheque', icodcheque, [])) then
         begin

            if qryChequesCD_CAIXA.IsNull then
            begin
               marcadoValido := True;
            end
            else
            begin
               qyPermissaoCaixa.SQL.Text := Format(SQL_PERMISSAO_CAIXA, [DM.UsuarioLogado.GetColigadasFilhaSelecionada()]);

               qyPermissaoCaixa.ParamByName('cd_caixa').asInteger := qryChequesCD_CAIXA.AsInteger;
               qyPermissaoCaixa.ParamByName('cd_usuario').asInteger := DM.UsuarioLogado.Pessoa.Codigo;

               qyPermissaoCaixa.Open;

               if qyPermissaoCaixa.RecordCount < 1 then
               begin
                  ASelList.ValueFromIndex[i] := '0';
                  msgSemPerm :=
                     msgSemPerm + #13 +
                     'Seu usuário não tem permissão de acesso a conta '+ qryChequesDS_CAIXA.AsString +
                     ' do cheque ' + qryChequesDS_CHEQUE.AsString +
                     '. Esta transferencia somente poderá ser feita por um usuário que tenha permissão nesta conta.' + #13;
               end
               else
               begin
                  marcadoValido := True;
               end;
            end;
         end;
      end;
   end;

   if msgSemPerm <> '' then
   begin
      Mensagem(msgSemPerm, 'Atenção', MB_OK);

      //Se não ficou nenhum cheque valido marcado, sai do método
      //e não abre a tela de transferência.
      if marcadoValido = False then
      begin
         Exit;
      end;

   end;

   if not PrincipalForm.ProcuraForm( TForm(TfTransferenciaCheques) ) then begin
      Application.CreateForm( TfTransferenciaCheques, fTransferenciaCheques )
   end;

   //Somar o Valor Total dos cheques;

   sCodigosCheques := '(-1';
   iQtdCheques := 0;

   i := 0;
   for i := 0 to ASelList.Count - 1 do
   begin
      if (ASelList.ValueFromIndex[i] = '1') then
      begin
         sCodigosCheques := sCodigosCheques + ',' + (ASelList.Names[i]);
         inc(iQtdCheques);         
      end;

   end;

   fTransferenciaCheques.lbMsg.Caption := MSG_QTD_CHEQUES+' '+IntToStr(iQtdCheques);

   sCodigosCheques := sCodigosCheques + ')';

   DM.qAux2.Close();
   DM.qAux2.SQL.Text :=
     ' SELECT SUM(nr_valor) as total FROM fin_cheques ' +
     '  WHERE cd_cheque in ' + sCodigosCheques;
   DM.qAux2.Open();

   fTransferenciaCheques.edValorTotal.Text := FloatToStrF(DM.qAux2.FieldByNaMe('total').AsCurrency,ffNumber, 12, 2 );

   DM.qAux2.Close();
   DM.qAux2.SQL.Text :=
     ' SELECT count(cd_mensalidade) as nrCheque FROM mensalidades    ' +
     '  WHERE cd_cheque_devolvido in ' + sCodigosCheques;
   DM.qAux2.Open();

   fTransferenciaCheques.ckbAtivaDebito.Enabled := not(DM.qAux2.FieldByName('nrCheque').AsInteger > 0);
   DM.qAux2.Close();

   if fTransferenciaCheques.ShowModal() = mrOk then begin
      iChequeAnterior:=0;


      for i := 0 to ASelList.Count - 1 do begin
         if (ASelList.ValueFromIndex[i] = '1') then begin
            iCodCheque := StrToInt(ASelList.Names[i]);

            DM.transfereCheque(
               fTransferenciaCheques.iCodCaixa,
               iCodCheque,
               fTransferenciaCheques.iCodSituacao,
               fTransferenciaCheques.umdtTransferencia.date,
               fTransferenciaCheques.iCodColigada
            );

            // Verificar se foi ativado a opção para gerar um título
            if fTransferenciaCheques.ckbAtivaDebito.Checked then
            begin
               GerarTitulo(iCodCheque);
            end;

         end;
      end;
      Filtra();
   end;

end;

procedure TfControleCheques.btFecharClick(Sender: TObject);
begin
   Self.Close();
end;

procedure TfControleCheques.btAlterarClick(Sender: TObject);
begin
   if not DM.UsuarioLogado.TemPermissao( 2050, npAlterar, True ) then Exit;

   if not PrincipalForm.ProcuraForm( TForm(frmProcuraCheque) ) then begin
      Application.CreateForm( TfrmProcuraCheque, frmProcuraCheque )
   end;

   if qryCheques.IsEmpty then begin
      Mensagem('Selecione um Cheque para alterar');
      Exit;
   end;

   qyChequesAct.Close();
   qyChequesAct.ParamByName('cd_cheque').AsInteger := qryChequescd_cheque.AsInteger;
   qyChequesAct.Open();

   frmProcuraCheque.iCheque:= qryChequescd_cheque.AsInteger;
   frmProcuraCheque.carregaContas(qyChequesAct.FieldByName('cd_caixa').AsInteger);
   frmProcuraCheque.clbParcelas.Clear();

   if qryChequesqtdAlunos.AsInteger >= 1 then begin
      frmProcuraCheque.edAluno.Text:= qryChequescodigoaluno.AsString;
      frmProcuraCheque.lbNome.Caption := qryChequesnm_pessoa.AsString;
      if qryChequesqtdMensalidades.AsInteger <> 1 then begin
         if qryChequesqtdAlunos.AsInteger <> 1 then begin
            if qryChequesqtdMensalidades.AsInteger <> 0 then begin
               frmProcuraCheque.bloquearCampos(true);
            end;
         end
         else begin
            frmProcuraCheque.lngAluno:=qryChequescodigoaluno.AsInteger;
            frmProcuraCheque.listaParcelas();
         end;
      end else begin
         frmProcuraCheque.lngAluno:=qryChequescodigoaluno.AsInteger;
         frmProcuraCheque.listaParcelas();
      end;

   end else begin
      frmProcuraCheque.edAluno.Text:= '';
      frmProcuraCheque.lbNome.Caption := '';
   end;

   frmProcuraCheque.cbContas.Enabled := (DM.variavel_parametro('financeiro_transfere_cheques') <> 'S') OR (DM.variavel_parametro('financeiro_cheques_altera_conta') = 'S') ;

   if qyChequesAct.IsEmpty then begin
      Mensagem('Registro Inválido!!');
      Exit;
   end;   

   frmProcuraCheque.setTab(frmProcuraCheque.tsIncAlt);
   frmProcuraCheque.edIAgencia.Text := qryChequesds_agencia.AsString;
   frmProcuraCheque.edIBanco.Text := qryChequesds_banco.AsString;
   frmProcuraCheque.edIConta.Text := qryChequesds_conta.AsString;
   frmProcuraCheque.edINumero.Text := qryChequesds_cheque.AsString;
   frmProcuraCheque.edIValor.Text := FloatToStr(qryChequesnr_valor.AsFloat);
   frmProcuraCheque.Ednm_titular.Text := qryChequesnm_titular.AsString;
   frmProcuraCheque.mmObservacoes.Lines.Add(qryGetObsChequeDS_OBSERVACAO.AsString);

   //datas
   if ((qryChequesdt_compensacao.AsDateTime > 0)) then begin
      frmProcuraCheque.umdtCompensacao.Date := qryChequesdt_compensacao.AsDateTime;
   end
   else begin
      frmProcuraCheque.umdtCompensacao.Date := Now();
   end;

   //define situacao
   frmProcuraCheque.cbISituacao.ItemIndex := frmProcuraCheque.slSituacoes.IndexOfName(qryChequescd_situacao.AsString);

   frmProcuraCheque.ShowModal();
   if not frmProcuraCheque.flagCancel then begin
      qyChequesAct.Edit();

      qyChequesActds_agencia.AsString := frmProcuraCheque.edIAgencia.Text;
      qyChequesActds_banco.AsString := frmProcuraCheque.edIBanco.Text;
      qyChequesActds_conta.AsString := frmProcuraCheque.edIConta.Text;
      qyChequesActds_cheque.AsString := frmProcuraCheque.edINumero.Text;
      qyChequesActnr_valor.AsFloat := StrToFloat(Trim(frmProcuraCheque.edIValor.Text));
      qyChequesActdt_compensacao.AsDateTime := frmProcuraCheque.umdtCompensacao.Date;
      qyChequesActcd_situacao.AsString := frmProcuraCheque.slSituacoes.Names[frmProcuraCheque.cbISituacao.ItemIndex];
      qyChequesActds_observacao.AsString := frmProcuraCheque.mmObservacoes.Lines.Text;
      qyChequesActcd_caixa.AsInteger := frmProcuraCheque.ListaContas[frmProcuraCheque.cbContas.ItemIndex];
      qyChequesActnm_titular.AsString := frmProcuraCheque.Ednm_titular.Text;
      qyChequesAct.Post();
      if frmProcuraCheque.bAlterou then
         salvaChequesMensalidades();
      qryCheques.Close();
      qryCheques.Open();

   end;
end;

procedure TfControleCheques.btIncluirClick(Sender: TObject);
begin
   if not DM.UsuarioLogado.TemPermissao( 2050, npIncluir, True ) then Exit;

   if not PrincipalForm.ProcuraForm( TForm(frmProcuraCheque) ) then begin
      Application.CreateForm( TfrmProcuraCheque, frmProcuraCheque )
   end;

//   if qyCheques.IsEmpty then begin
//      Mensagem('Selecione um Cheque para alterar');
//      Exit;
//   end;

   qyChequesAct.Close();
   qyChequesAct.ParamByName('cd_cheque').AsInteger := 0;
   qyChequesAct.Open();

   frmProcuraCheque.setTab(frmProcuraCheque.tsIncAlt);
   frmProcuraCheque.iCheque           := 0;
   frmProcuraCheque.edIAgencia.Text   := '';
   frmProcuraCheque.edIBanco.Text     := '';
   frmProcuraCheque.edIconta.Text     := '';
   frmProcuraCheque.edINumero.Text    := '';
   frmProcuraCheque.edIValor.Text     := '0';
   frmProcuraCheque.Ednm_titular.Text := ''; 
   frmProcuraCheque.clbParcelas.Clear();
   frmProcuraCheque.carregaContas(0);

   //datas
   frmProcuraCheque.umdtCompensacao.Date := Now();

   //define situacao
   frmProcuraCheque.cbListaSituacao.ItemIndex := 0;

   frmProcuraCheque.ShowModal();

   if not frmProcuraCheque.flagCancel then begin
      qyChequesAct.Insert();

      qyChequesActds_agencia.AsString       := frmProcuraCheque.edIAgencia.Text;
      qyChequesActds_banco.AsString         := frmProcuraCheque.edIBanco.Text;
      qyChequesActds_conta.AsString         := frmProcuraCheque.edIConta.Text;
      qyChequesActds_cheque.AsString        := frmProcuraCheque.edINumero.Text;
      qyChequesActnr_valor.AsFloat          := StrToFloat(Trim(frmProcuraCheque.edIValor.Text));
      qyChequesActdt_compensacao.AsDateTime := frmProcuraCheque.umdtCompensacao.Date;
      qyChequesActcd_situacao.AsString      := frmProcuraCheque.slSituacoes.Names[frmProcuraCheque.cbISituacao.ItemIndex];
      qyChequesActds_observacao.AsString    := frmProcuraCheque.mmObservacoes.Lines.Text;
      qyChequesActcd_caixa.AsInteger        := frmProcuraCheque.ListaContas[frmProcuraCheque.cbContas.ItemIndex];
      qyChequesActdt_emissao.AsDateTime     := DM.DataAtual();
      qyChequesActnm_titular.AsString       := frmProcuraCheque.Ednm_titular.Text;

      qyChequesAct.Post();
      salvaChequesMensalidades();

      qryCheques.Close();
      qryCheques.Open();
      
      qryCheques.Refresh;
      bgCheques.Refresh;
      
   end;
end;

procedure TfControleCheques.cbGridClick(Sender: TObject);
begin
   if (ASelList.Values[ qryChequescd_cheque.AsString ] = '1') then begin
      ASelList.Values[ qryChequescd_cheque.AsString ] := '0';
   end
   else begin
      ASelList.Values[ qryChequescd_cheque.AsString ] := '1';
   end;
end;

procedure TfControleCheques.btExcluirClick(Sender: TObject);
begin
  if not DM.UsuarioLogado.TemPermissao( 2050, npExcluir, True ) then Exit;

  if Mensagem('Tem certeza que deseja excluir o cheque selecionado?', 'Confirmação', MB_YESNOCANCEL + MB_ICONQUESTION ) <> mrYes then Exit;

   qyChequesAct.Close();
   qyChequesAct.ParamByName('cd_cheque').AsInteger := qryChequescd_cheque.AsInteger;
   qyChequesAct.Open();

   if qyChequesAct.IsEmpty then begin
      Mensagem('Registro Inválido!!');
      Exit;
   end;

   DM.qyAux1.Close;
   DM.qyAux1.SQL.Clear;
   DM.qyAux1.SQL.Text := 'DELETE FROM fin_cheques_mensalidades WHERE cd_cheque = ' + qryChequescd_cheque.AsString;
   DM.qyAux1.ExecSQL;

   qyChequesAct.Delete();
   qyChequesAct.Close();

   qryCheques.Prior();

   qryCheques.Close();
   qryCheques.Open();

end;

procedure TfControleCheques.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
   Action := caFree;
end;

procedure TfControleCheques.FormCreate(Sender: TObject);
begin
   ASelList := TStringList.Create();
   DM.MontarPlanilha(bgCheques, 'planilha_cheques_campos');
   FSSQLOriginal := qryCheques.SQLList.Values[DM.db.Protocol];
   sFAluno := '';
   sFAgencia := '';
   sFBanco := '';
   sFConta := '';
   sFNumero := '';
   sFAnoSem := '';
   sFDtInicio := 0;
   sFDtFim := 0;
   sFSituacao := '';
   FMostraCaixasInativos := True;
   FColigadas := TStringList.Create;
   FColigadas.Delimiter := ',';
   FColigadas.StrictDelimiter := True;
   FColigadas.DelimitedText := DM.GetUsuarioLogado.GetColigadasFilhaSelecionada;
end;

procedure TfControleCheques.FormDestroy(Sender: TObject);
begin
   FreeAndNil(ASelList);
end;

procedure TfControleCheques.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  case Key of
    VK_F2 : if btIncluir.Enabled then btIncluirClick( nil );
    VK_F3 : if btAlterar.Enabled then btAlterarClick( nil );
    VK_F9 : if btExcluir.Enabled then btExcluirClick( nil );
    VK_F12 : btFecharClick( nil );
  end;

end;

procedure TfControleCheques.FormShow(Sender: TObject);
begin

   sFSituacao := '0';
   sOrdem := 'dt_compensacao';
   Filtra();
   btnTransferir.Enabled:= DM.variavel_parametro('financeiro_transfere_cheques') = 'S'; 

   if DM.lite then
   begin
     btnTransferir.Enabled := false;
   end;

end;

procedure TfControleCheques.GerarTitulo(intCheque : Integer);
Var
   qyTitulo : TUMZQuery;
   sTipoTitulo,historico : String;
   iParcela , iConta, codigoAlunoAtual : Integer;
   dVencimento : TDateTime;
   valorMensalidadeAtual,valorCheque, valorMensaAnterior, somaMensalidades : Currency;
   mensalidadeUnica : Boolean;
begin
   // Gerar título na planilha de recebimentos do aluno;
   Dm.CriarConsulta(qyTitulo);
   valorMensalidadeAtual := 0.00;
   valorCheque := 0.00;
   iParcela := 1;
   iConta := 0;
   somaMensalidades := 0.00;
   valorMensaAnterior := 0.00;
   historico := '';

   // 1. Carregar as informações do título de título
   sTipoTitulo := DM.Variavel_parametro('financeiro_tipo_titulo_cheque_devolvido');
   if sTipoTitulo <> '' then begin
      qyTitulo.Close();
      qyTitulo.SQL.Text :=
         'SELECT nr_parcela  '+
         '     , cd_conta    '+
         '  FROM fin_tipos_titulo ' +
         ' WHERE cd_tipo_titulo = ' + sTipoTitulo;
      qyTitulo.Open();

      iParcela := qyTitulo.FieldByName('nr_parcela').AsInteger;
      iConta   := qyTitulo.FieldByName('cd_conta').AsInteger;
   end else begin
      sTipoTitulo := '0';
   end;

   qyTitulo.Close();

   // 2. Divide os os valores do chque entre os alunos, com base na porcentagem que cada mensalidade representa do total

   //Busca valor total das mensalidades envolvidas
   qryGetValorTotalMensa.Close;
   qryGetValorTotalMensa.ParamByName('CD_CHEQUE').AsInteger := intCheque;
   qryGetValorTotalMensa.Open;
   if not qryGetValorTotalMensa.IsEmpty then
   begin
      mensalidadeUnica := ((qryGetValorTotalMensa.FieldByName('nrAlunos').AsInteger = 1) OR (qryGetValorTotalMensa.FieldByName('nrMensalidades').AsInteger = 1));
   end;

   //Dados das mensalidades do cheque
   qryGetAlunoCheque.Close;
   qryGetAlunoCheque.ParamByName('CD_CHEQUE').AsInteger := intCheque;
   qryGetAlunoCheque.Open;

   if qryGetAlunoCheque.IsEmpty then begin
      // Nenhuma mensalidade ligada ao Cheque, não é possível gerar o título
      Mensagem('Nenhuma pessoa está vinculada ao cheque. Não será possível gerar um novo título.', 'UNIMESTRE', MB_OK + MB_ICONWARNING);
      FreeAndNil(qryGetAlunoCheque);
      Exit;
   end;

   while not qryGetAlunoCheque.eof do
   begin
      valorCheque := qryGetAlunoCheque.FieldByName('nr_valor').AsCurrency;
      historico := qryGetAlunoCheque.FieldByName('historico').AsString;
      dVencimento := qryGetAlunoCheque.FieldByName('dt_compensacao').AsDateTime;

      if DM.EstaBloqueado(dVencimento, false) then begin
         dVencimento := DM.DataBloqueioFinanceiro(dVencimento) + 1;
      end;

      if not mensalidadeUnica then
      begin
         //Define o valor desta mensalidade do total, usando como base o valor pago desta mensalidade com cheque
         //Soma o valor da mensalidade anterior em casos de mensalidades do msm aluno
         valorMensalidadeAtual := qryGetAlunoCheque.FieldByName('vl_cheque').AsCurrency + valorMensaAnterior;

         //Altera o histórico para este tipo de parcela
         historico := ReplaceStr(historico,'Cheque','Cheque PARCIAL');
         historico := historico + ' / Valor Total: R$ ' + CurrToStr(valorCheque);
      end;

      //Verifica se a proxima mensalidade a ser criada pertence ao mesmo aluno para juntar numa parcela
      if not (mensalidadeUnica) and not(qryGetAlunoCheque.RecordCount = qryGetAlunoCheque.RecNo) then
      begin
         codigoAlunoAtual := qryGetAlunoCheque.FieldByName('codigoaluno').AsInteger;
         qryGetAlunoCheque.Next;

         if(qryGetAlunoCheque.FieldByName('codigoaluno').AsInteger = codigoAlunoAtual) then
         begin
            valorMensaAnterior := valorMensalidadeAtual;
            continue;
         end;
         qryGetAlunoCheque.Prior;
      end;
      valorMensaAnterior := 0;

      if (mensalidadeUnica) then
      begin
         //Se for a ultima parcela ou parcela unica deve garantir que todo o valor do cheque foi gerado nas mensalidades
         valorMensalidadeAtual := (valorCheque);
      end;

      DM.GerarMensalidade
         ( qryGetAlunoCheque.FieldByName('codigoaluno').AsInteger
         , iParcela
         , qryGetAlunoCheque.FieldByName('turma').AsString
         , valorMensalidadeAtual
         , 0
         , qryGetAlunoCheque.FieldByName('anosemestre').AsInteger
         , dVencimento
         , Dm.DataAtual
         , 2
         , qryGetAlunoCheque.FieldByName('curso').AsString
         , qryGetAlunoCheque.FieldByName('depto').AsInteger
         , 0
         , -1
         , 0
         , 0
         , historico
         , StrToInt(sTipoTitulo)
         , iConta
         , qryGetAlunoCheque.FieldByName('cd_centro_custo').AsInteger
         , 0
         , 0
         , 'N'
         , 0
         , 0
         , 10
         , intCheque
         , 0
         , qryGetAlunoCheque.FieldByName('cd_coligada').AsInteger
         );

      //Ja gerou a mensalidade unica, sai
      if mensalidadeUnica then
      begin
         break;
      end;

      qryGetAlunoCheque.Next;
   end;
   qryGetAlunoCheque.Close;
   FreeAndNil(qyTitulo);

end;

procedure TfControleCheques.qryChequesAfterOpen(DataSet: TDataSet);
begin
   try
   if (bk <> nil) AND ( qryCheques.BookmarkValid(bk) )then begin
      qryCheques.GotoBookmark(bk);
      bk := nil;
   end;
  except
  end;
  qryGetObsCheque.Close;
  qryGetObsCheque.Open;
end;

procedure TfControleCheques.qryChequesBeforeClose(DataSet: TDataSet);
begin
   bk := qryCheques.GetBookmark();
end;

procedure TfControleCheques.salvaChequesMensalidades;
var
   iCont, iUltimo : Integer;
begin
   //
   if frmProcuraCheque.iCheque <> 0 then begin
      qyChequesMensalidades.Close();
      qyChequesMensalidades.SQL.Clear();
      qyChequesMensalidades.SQL.Text:='DELETE FROM fin_cheques_mensalidades WHERE cd_cheque= '+IntToStr(frmProcuraCheque.iCheque);
      qyChequesMensalidades.ExecSQL();
   end;

   iCont:= 0;
   qyChequesMensalidades.Close();
   qyChequesMensalidades.SQL.Clear();
   qyChequesMensalidades.SQL.Text:='SELECT LAST_INSERT_ID() as ultimo ';
   if DM.db.Protocol = DB_PROTOCOL_ORACLE then
      qyChequesMensalidades.SQL.Add('FROM dual');
   qyChequesMensalidades.Open();

   // Codigo do cheque
   if frmProcuraCheque.iCheque = 0 then
      iUltimo := qyChequesMensalidades.FieldByName('ultimo').AsInteger
   else
      iUltimo := qryChequescd_cheque.AsInteger;

   // Percorre as parcelas e insere as checadas
   while (iCont < frmProcuraCheque.clbParcelas.Count) do begin
      if frmProcuraCheque.clbParcelas.checked[iCont] then begin
         qyChequesMensalidades.Close();
         qyChequesMensalidades.SQL.Clear();
         qyChequesMensalidades.SQL.Text:='INSERT INTO fin_cheques_mensalidades (cd_cheque,cd_mensalidade) VALUES ('+IntToStr(iUltimo)+','+IntToStr(frmProcuraCheque.aListaMensalidades[iCont])+')';
         qyChequesMensalidades.ExecSQL();
      end;
      iCont := iCont+1;
   end;
end;

procedure TfControleCheques.sbSelecionarColunaClick(Sender: TObject);
begin
   Application.CreateForm(TfrmSelColunas, frmSelColunas);
   frmSelColunas.SelecionaColunas(bgCheques, 'planilha_cheques_campos');

end;

procedure TfControleCheques.btnDesmarcarClick(Sender: TObject);
Var
   lugar : TBookmark;
begin

   lugar := qryCheques.GetBookmark();
   qryCheques.DisableControls();
   qryCheques.First();

   While not qryCheques.Eof do begin

      if ASelList.Values[ qryChequescd_cheque.AsString ] = '1' then begin

         ASelList.Values[ qryChequescd_cheque.AsString ] := '0';

      end;
     qryCheques.Next;

   end;
   bgCheques.Repaint();
   qryCheques.EnableControls();
//   qyCheques.GotoBookmark(lugar);
end;

procedure TfControleCheques.btnMarcarClick(Sender: TObject);
begin

   qryCheques.DisableControls();
   qryCheques.First();

   While not qryCheques.Eof do begin

      ASelList.Values[ qryChequescd_cheque.AsString ] := '1';

      qryCheques.Next;
   end;
   bgCheques.Repaint();
   qryCheques.EnableControls();
end;

procedure TfControleCheques.pmMensalidadesPopup(Sender: TObject);
var
  miMenu : TMenuItem;
begin
     
   pmMensalidades.Items.Clear;

   miMenu := TMenuItem.Create(pmMensalidades);
   miMenu.Tag := -1;

   miMenu.Caption := '&Adicionar Mensalidades';
   
   miMenu.OnClick := AlteraMensalidade;

   pmMensalidades.Items.Add(miMenu);

   DM.qyAux2.Close;
   DM.qyAux2.SQL.Clear;
   DM.qyAux2.SQL.Add(
      ' SELECT DISTINCT cm.cd_mensalidade  ' +
      ' FROM fin_cheques_mensalidades cm '+
      ' WHERE cm.cd_cheque = :CdCheque ' +
      ' ORDER BY cm.cd_mensalidade '
   );

   DM.qyAux2.ParamByName('CdCheque').AsInteger := qryChequescd_cheque.AsInteger;

   Dm.qyAux2.Open;

   while not DM.qyAux2.EOF do begin

      miMenu := TMenuItem.Create(pmMensalidades);

      miMenu.Caption := DM.qyAux2.FieldByName('cd_mensalidade').AsString;
      miMenu.Checked := True;
      miMenu.Tag := DM.qyAux2.FieldByName('cd_mensalidade').AsInteger;
      miMenu.OnClick := AlteraMensalidade;

      pmMensalidades.Items.Add(miMenu);

      DM.qyAux2.Next;

   end;
end;

procedure TfControleCheques.AlteraMensalidade(Sender: TObject);
Var
   sNovaMensa : String;
begin
  if TMenuItem(Sender).Tag = -1 then begin // Incluir a Mensalidade

     if not DM.UsuarioLogado.TemPermissao( 2050, npIncluir, True ) then Exit;

     if not InputQuery('Inserir Mensalidade', 'Digite o código da mensalidade para vincular ao cheque: ',sNovaMensa) then exit;

     DM.qyAux2.Close;
     DM.qyAux2.SQL.Clear;
     DM.qyAux2.SQL.Add(
         ' INSERT INTO fin_cheques_mensalidades (cd_cheque_mensalidade, cd_cheque, cd_mensalidade) ' +
         ' VALUES (NULL, :CdCheque, :CdMensalidade) '
     );
     DM.qyAux2.ParamByName('CdCheque').AsInteger := qryChequescd_cheque.AsInteger;
     DM.qyAux2.ParamByName('CdMensalidade').AsInteger := StrToInt(sNovaMensa);

     DM.qyAux2.ExecSQL;

     filtra();

   end  // Excluir a Mensalidade
  else begin

      if not DM.UsuarioLogado.TemPermissao( 2050, npExcluir, True ) then Exit;

      IF Mensagem('Deseja desvincular a mensalidade do cheque?', 'Atenção', MB_YESNOCANCEL + MB_ICONQUESTION) <> mrYes then Exit;

      DM.qyAux2.Close;
      DM.qyAux2.SQL.Clear;
      DM.qyAux2.SQL.Add(
         ' DELETE FROM fin_cheques_mensalidades ' +
         ' WHERE cd_cheque = :CdCheque AND cd_mensalidade = :CdMensalidade '
      );
      DM.qyAux2.ParamByName('CdCheque').AsInteger := qryChequescd_cheque.AsInteger;
      DM.qyAux2.ParamByName('CdMensalidade').AsInteger := TMenuItem(Sender).Tag;

      DM.qyAux2.ExecSQL;

      Filtra()

  end;
end;

procedure TfControleCheques.bgChequesCellClick(Column: TColumn);
var
   PG: TPoint;
   GC: TGridCoord;
begin
   PG := bgCheques.ScreenToClient(Mouse.CursorPos);
   GC := bgCheques.MouseCoord( PG.X, PG.Y ) ;

   //1 coluna
   if GC.X = 1 then begin
      if ASelList.Values [ qryChequescd_cheque.AsString ] = '1' then begin
         ASelList.Values [ qryChequescd_cheque.AsString ] := '0';
      end
      else begin
         ASelList.Values [ qryChequescd_cheque.AsString ] := '1';
      end;
      bgCheques.Repaint();
   end;
end;

procedure TfControleCheques.bgChequesDblClick(Sender: TObject);
begin
   if not DM.UsuarioLogado.TemPermissao( 2050, npIncluir, True ) then Exit;

   if not PrincipalForm.ProcuraForm( TForm(fHistoricoCheque) ) then begin
      Application.CreateForm( TfHistoricoCheque, fHistoricoCheque );
   end;
   fHistoricoCheque.iCodCheque:= qryChequescd_cheque.AsInteger; 
   fHistoricoCheque.ShowModal();
end;

procedure TfControleCheques.bgChequesDrawColumnCell(Sender: TObject;
  const Rect: TRect; DataCol: Integer; Column: TColumn; State: TGridDrawState);
const IsChecked : array[Boolean] of Integer = 
      (DFCS_BUTTONCHECK, DFCS_BUTTONCHECK or DFCS_CHECKED);
var
  DrawRect: TRect;
begin
    if Column.FieldName = 'SELECAO' then begin
       bgCheques.Canvas.FillRect(Rect);
       if (gdFocused in State) then begin
              DrawRect.Left := Rect.Left + 1;
       end
       else begin
          DrawRect.Left := Rect.Left + 2;
       end;

       DrawRect.Right := Rect.Right - 2;
       DrawRect.Top := Rect.Top + 2;
       DrawRect.Bottom := Rect.Bottom - 2;
       DrawFrameControl(bgCheques.Canvas.Handle,
            DrawRect,
            DFC_BUTTON,
            ISChecked[ ASelList.Values[ qryChequescd_cheque.AsString ] = '1' ]
       );

    end;
end;

procedure TfControleCheques.bgChequesTitleClick(Column: TColumn);
var
   n : smallint;
begin
  // Clique no título da grade... ordenar pela coluna clicada

  if bgCheques.DataSource.DataSet.FieldByName(Column.FieldName).FieldKind <> fkData Then
     Exit;

  For n:= 0 to bgCheques.Columns.Count - 1 do begin
       bgCheques.Columns[n].Title.Font.Style := [];
  end;

  if sOrdem = Column.FieldName then
     sOrdem := Column.FieldName + ' DESC '
  else
     sOrdem := Column.FieldName;

  Column.Title.Font.Style := [fsUnderline];

  Filtra();

end;

end.

