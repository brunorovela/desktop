unit UFFinCreditosCPVisualizar;

interface

uses
   Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
   Dialogs, ExtCtrls, DB, ZAbstractRODataset, ZAbstractDataset, ZDataset,
   Provider, DBClient, Grids, DBGrids, UDBGrids, ToolWin, ComCtrls, ImgList,
   StdCtrls, Mask, DBCtrls, Buttons, UMEditMonetario, ZDbcIntfs, UZDbcFuncs,General;

type
   TfrmFinCreditosCPVisualizar = class(TForm)
      btnDevolver: TToolButton;
      btnExcluir: TToolButton;
      btnFechar: TToolButton;
      btnSep2: TToolButton;
      bvlSep1: TBevel;
      bvlSep2: TBevel;
      bvlSep3: TBevel;
      bvlSep4: TBevel;
      bvlSep5: TBevel;
      cdsCreditos: TClientDataSet;
      cdsCreditosSUM_CREDITO: TAggregateField;
      cdsCreditosSUM_DEVOLVIDO: TAggregateField;
      cdsCreditosSUM_DISPONIVEL: TAggregateField;
      cdsCreditosSUM_USADO: TAggregateField;
      dbeTotalCredito: TDBEdit;
      dbeTotalDevolucao: TDBEdit;
      dbeTotalDisponivel: TDBEdit;
      dbeTotalUsado: TDBEdit;
      dbgCreditos: TSortedDBGrid;
      dblcConta: TDBLookupComboBox;
      dsContas: TDataSource;
      dsCreditos: TDataSource;
      dspCreditos: TDataSetProvider;
      edtDevolucaoCentroCodigo: TEdit;
      edtDevolucaoCentroNome: TEdit;
      edtDevolucaoPlanoCodigo: TEdit;
      edtDevolucaoPlanoNome: TEdit;
      edtDevolucaoValor: TUMEditMonetario;
      ilAcoes: TImageList;
      lblDevolucaoCentro: TLabel;
      lblDevolucaoConta: TLabel;
      lblDevolucaoHistorico: TLabel;
      lblDevolucaoPlano: TLabel;
      lblDevolucaoValor: TLabel;
      lblTotais: TLabel;
      lblTotalCredito: TLabel;
      lblTotalDevolucao: TLabel;
      lblTotalDisponivel: TLabel;
      lblTotalUsado: TLabel;
      mmDevolucaoHistorico: TMemo;
      pnlCreditos: TPanel;
      pnlDevolucao: TPanel;
      pnlDevolucaoTitulo: TPanel;
      pnlResumo: TPanel;
      pnlTitulo: TPanel;
      qryContas: TZReadOnlyQuery;
      qryContasCD_CAIXA: TIntegerField;
      qryContasCD_COLIGADA: TIntegerField;
      qryContasDS_CAIXA: TStringField;
      qryCreditos: TZReadOnlyQuery;
      sbDevolucaoCentro: TSpeedButton;
      sbDevolucaoPlano: TSpeedButton;
      tlbAcoes: TToolBar;
    qryCreditosCD_CREDITO: TLargeintField;
    qryCreditosCD_TITULO: TLargeintField;
    qryCreditosVL_CREDITO: TFloatField;
    qryCreditosDS_MOTIVO: TStringField;
    qryCreditosDT_REGISTRO: TDateTimeField;
    qryCreditosDT_ALTERACAO: TDateTimeField;
    qryCreditosCD_USUARIO: TIntegerField;
    qryCreditosVL_USADO: TFloatField;
    qryCreditosVL_DEVOLUCAO: TFloatField;
    cdsCreditosCD_CREDITO: TLargeintField;
    cdsCreditosCD_TITULO: TLargeintField;
    cdsCreditosVL_CREDITO: TFloatField;
    cdsCreditosDS_MOTIVO: TStringField;
    cdsCreditosDT_REGISTRO: TDateTimeField;
    cdsCreditosDT_ALTERACAO: TDateTimeField;
    cdsCreditosCD_USUARIO: TIntegerField;
    cdsCreditosVL_USADO: TFloatField;
    cdsCreditosVL_DEVOLUCAO: TFloatField;
    cdsCreditosVL_DISPONIVEL: TFloatField;
      procedure btnDevolverClick(Sender: TObject);
      procedure btnExcluirClick(Sender: TObject);
      procedure btnFecharClick(Sender: TObject);
      procedure cdsCreditosCalcFields(DataSet: TDataSet);
      procedure dsContasDataChange(Sender: TObject; Field: TField);
      procedure dsCreditosDataChange(Sender: TObject; Field: TField);
      procedure edtDevolucaoCentroCodigoChange(Sender: TObject);
      procedure edtDevolucaoCentroCodigoExit(Sender: TObject);
      procedure edtDevolucaoCentroCodigoKeyPress(Sender: TObject; var Key: Char);
      procedure edtDevolucaoPlanoCodigoChange(Sender: TObject);
      procedure edtDevolucaoPlanoCodigoExit(Sender: TObject);
      procedure edtDevolucaoPlanoCodigoKeyPress(Sender: TObject; var Key: Char);
      procedure edtDevolucaoValorChange(Sender: TObject);
      procedure edtDevolucaoValorExit(Sender: TObject);
      procedure FormClose(Sender: TObject; var Action: TCloseAction);
      procedure FormDestroy(Sender: TObject);
      procedure FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
      procedure FormShow(Sender: TObject);
      procedure mmDevolucaoHistoricoChange(Sender: TObject);
      procedure sbDevolucaoCentroClick(Sender: TObject);
      procedure sbDevolucaoPlanoClick(Sender: TObject);
   private
      FPessoaId: Cardinal;
      FPessoaNome: AnsiString;
      procedure CarregaDados;
      procedure DevolveCreditos;
      procedure ExcluiCredito;
      procedure LimpaFormulario;
      procedure UpdateButtons;
   public
      class procedure VisualizaCreditos(const PessoaId: Cardinal;
         const PessoaNome: AnsiString);
   end;

var
   frmFinCreditosCPVisualizar: TfrmFinCreditosCPVisualizar;

implementation

uses
   uDM, uUsuario, uSelConta, uBuscaCentro, uClassMovimento,
   uFinApropriaTesouraria;

{$R *.dfm}

{ TfrmFinCreditosVisualizar }

procedure TfrmFinCreditosCPVisualizar.btnDevolverClick(Sender: TObject);
begin
   DevolveCreditos;
end;

procedure TfrmFinCreditosCPVisualizar.btnExcluirClick(Sender: TObject);
begin
   ExcluiCredito;
end;

procedure TfrmFinCreditosCPVisualizar.btnFecharClick(Sender: TObject);
begin
   Close;
end;

procedure TfrmFinCreditosCPVisualizar.CarregaDados;
const
   SSQLSelectContasFmt = ''
      + 'SELECT '
      + '  CC.CD_CAIXA, '
      + '  CC.CD_COLIGADA, '
      + '  CC.DS_CAIXA '
      + 'FROM '
      + '  FIN_CADASTRO_CONTAS CC '
      + '    JOIN FIN_CONTAS_USUARIOS CU ON '
      + '      (CC.CD_CAIXA = CU.CD_CAIXA) AND '
      + '      (CC.CD_COLIGADA = CU.CD_COLIGADA) '
      + '    JOIN COLIGADAS C ON '
      + '      (CC.CD_COLIGADA = C.CD_COLIGADA) '
      + 'WHERE '
      + '  CC.SN_ATIVA = ''S'' AND '
      + '  CU.CD_USUARIO = :CD_USUARIO AND '
      + '  C.CD_COLIGADA_MATRIZ = :CD_COLIGADA_MATRIZ AND '
      + '  ( '
      + '    CC.CD_COLIGADA IN (%s) OR '
      + '    CC.SN_TODAS_COLIGADAS = 1 '
      + '  ) ';

begin
   if cdsCreditos.Active then
      cdsCreditos.Refresh;

   if not cdsCreditos.Active then
   begin
      cdsCreditos.Params.ParamByName('CD_PESSOA').AsInteger := FPessoaId;
      cdsCreditos.Open;
   end;

   if qryContas.Active then
      qryContas.Close;
   
      qryContas.SQL.Text := Format(SSQLSelectContasFmt,
      [DM.UsuarioLogado.GetColigadasFilhaSelecionada]);
      qryContas.ParamByName('CD_USUARIO').AsInteger := DM.iCdPessoaLogado;
      qryContas.ParamByName('CD_COLIGADA_MATRIZ').AsInteger :=
      DM.UsuarioLogado.ColigadaLogada;
      qryContas.Open;

      LimpaFormulario;
end;

procedure TfrmFinCreditosCPVisualizar.cdsCreditosCalcFields(DataSet: TDataSet);
begin
   if DataSet.State = dsInternalCalc then
      Exit;

   DataSet.FieldByName('VL_DISPONIVEL').AsFloat :=
      DataSet.FieldByName('VL_CREDITO').AsFloat -
      DataSet.FieldByName('VL_DEVOLUCAO').AsFloat -
      DataSet.FieldByName('VL_USADO').AsFloat;
end;

procedure TfrmFinCreditosCPVisualizar.DevolveCreditos;
const
   SCaptionConfirma = 'Confirmação';
   SCaptionInfo = 'Informação';
   SMsgConfirma = ''
      + 'Deseja realmente confirmar a devolução dos créditos?'#13
      + 'Esta operação não poderá ser revertida. Deseja realmente continuar?';
   SMsgSucesso = 'Créditos devolvidos com sucesso.';

   SSQLSelectCreditos = ''
      + 'SELECT '
      + '	C.CD_CREDITO, '
      + '	C.CD_TITULO, '
      + '	C.VL_CREDITO - SUM(COALESCE(F.VL_SAIDA, 0)) - SUM(COALESCE(D.VL_DEVOLVIDO, 0)) VL_DISPONIVEL '
      + 'FROM '
      + '	FIN_CREDITO_CP C '
      + '		JOIN FIN_CONTAS_PAGAR M ON '
      + '			(C.CD_TITULO = M.CD_TITULO) '
      + '		LEFT JOIN FIN_MOV_CP F ON '
      + '			(C.CD_TITULO = F.CD_TITULO_CREDITO) '
      + '		LEFT JOIN FIN_CREDITO_CP_DEVOLUCAO D ON '
      + '			(C.CD_CREDITO = D.CD_CREDITO) '
      + 'WHERE '
      + '	M.CD_PESSOA = ? '
      + 'GROUP BY '
      + '	C.CD_CREDITO '
      + 'HAVING '
      + '	VL_DISPONIVEL > 0 '
      + 'ORDER BY '
      + '	C.CD_CREDITO ASC ';

   SSQLInsertDevolucao = ''
      + 'INSERT INTO FIN_CREDITO_CP_DEVOLUCAO ( '
      + '	CD_MOVIMENTO_TE, '
      + '	CD_CREDITO, '
      + '	VL_DEVOLVIDO, '
      + '	DT_INCLUSAO '
      + ') VALUES (?, ?, ?, CURRENT_TIMESTAMP) ';

   SIntToStrFmt = '%d';
var
   UserChoice, MovId: Integer;
   Mov: TMovimento;
   ApropriaTe: TFinApropriaTesouraria;
   Stmt, StmtInsert: IZPreparedStatement;
   ResultSet: IZResultSet;
   ValorDevolver, ValorMovimento: Double;
begin
   UserChoice := MessageBox(Handle, SMsgConfirma, SCaptionConfirma,
      MB_ICONQUESTION or MB_YESNO or MB_DEFBUTTON2);

   if UserChoice <> ID_YES then
      Exit;

   ValorDevolver := edtDevolucaoValor.getValorDouble;

   Mov := TMovimento.create;
   ApropriaTe := TFinApropriaTesouraria.Create;
   Stmt := PrepareStatement(SSQLSelectCreditos);
   StmtInsert := PrepareStatement(SSQLInsertDevolucao);
   try
      Stmt.SetInt(1, FPessoaId);
      ResultSet := Stmt.ExecuteQueryPrepared;
      try
         while ResultSet.Next and (ValorDevolver > 0) do
         begin
            ValorMovimento := ResultSet.GetDoubleByName('VL_DISPONIVEL');

            if ValorMovimento > ValorDevolver then
               ValorMovimento := ValorDevolver;

            ValorDevolver := ValorDevolver - ValorMovimento;

            Mov.DataMovimento := Now;
            Mov.DataLiberacao := Now;
            Mov.EntradaSaida := 1;
            Mov.CodAcao := DM.BuscarCodigoAcaoPadrao(30);
            Mov.Coligada := qryContasCD_COLIGADA.AsInteger;
            Mov.Historico := mmDevolucaoHistorico.Text;
            Mov.ValorEmDinheiro := ValorMovimento;
            Mov.Mensalidade := 0;
            MovId := Mov.RegistrarMovimentacaoTe(qryContasCD_CAIXA.AsInteger);

            if MovId > 0 then
            begin
               ApropriaTe.setValorCampo('cd_movimento_te', Format(SIntToStrFmt, [MovId]));
               ApropriaTe.setValorCampo('cd_conta', edtDevolucaoPlanoCodigo.Text);
               ApropriaTe.setValorCampo('cd_coligada', qryContasCD_COLIGADA.AsString);
               ApropriaTe.setValorCampo('cd_centro', edtDevolucaoCentroCodigo.Text);
               ApropriaTe.setValorCampo('vl_movimento', FormatFloat('0.####', ValorMovimento));
               ApropriaTe.atualizar;

               StmtInsert.ClearParameters;
               StmtInsert.SetInt(1, MovId);
               StmtInsert.SetInt(2, ResultSet.GetIntByName('CD_CREDITO'));
               StmtInsert.SetDouble(3, ValorMovimento);
               StmtInsert.ExecutePrepared;
            end;
         end;
      finally
         ResultSet.Close;
         ResultSet := nil;
      end;
      
   finally
      FreeAndNil(Mov);
      Stmt.Close;
      Stmt := nil;
      StmtInsert.Close;
      StmtInsert := nil;
   end;

   MessageBox(Handle, SMsgSucesso, SCaptionInfo, MB_ICONINFORMATION or MB_OK);
   CarregaDados;
end;

procedure TfrmFinCreditosCPVisualizar.dsContasDataChange(Sender: TObject;
  Field: TField);
begin
   UpdateButtons;
end;

procedure TfrmFinCreditosCPVisualizar.dsCreditosDataChange(Sender: TObject;
  Field: TField);
begin
   UpdateButtons;
end;

procedure TfrmFinCreditosCPVisualizar.edtDevolucaoCentroCodigoChange(
  Sender: TObject);
begin
   UpdateButtons;
end;

procedure TfrmFinCreditosCPVisualizar.edtDevolucaoCentroCodigoExit(
  Sender: TObject);
const
   SSQLSelectCentro = ''
      + 'SELECT '
      + '  DS_CENTRO '
      + 'FROM '
      + '  FIN_CONFIG_CENTRO_CUSTOS '
      + 'WHERE '
      + '  CD_CENTRO = ? ';
var
   Stmt: IZPreparedStatement;
   ResultSet: IZResultSet;
   Found: Boolean;
begin
   edtDevolucaoCentroNome.Clear;

   if edtDevolucaoCentroCodigo.Text = '' then
      Exit;

   Stmt := PrepareStatement(SSQLSelectCentro);
   try
      Stmt.SetString(1, edtDevolucaoCentroCodigo.Text);
      ResultSet := Stmt.ExecuteQueryPrepared;
      try
         Found := ResultSet.Next;

         if Found then
            edtDevolucaoCentroNome.Text := ResultSet.GetString(1);

         if not Found then
         begin
            edtDevolucaoCentroCodigo.Clear;
            edtDevolucaoCentroCodigo.SetFocus;
         end;
      finally
         ResultSet.Close;
         ResultSet := nil;
      end;
   finally
      Stmt.Close;
      Stmt := nil;
   end;
end;

procedure TfrmFinCreditosCPVisualizar.edtDevolucaoCentroCodigoKeyPress(
  Sender: TObject; var Key: Char);
begin
   if Key = #13 then
      SelectNext(edtDevolucaoCentroCodigo, True, True);

   if not (Key in [#8, #9, #48..#57, #127]) then
      Key := #0;
end;

procedure TfrmFinCreditosCPVisualizar.edtDevolucaoPlanoCodigoChange(
  Sender: TObject);
begin
   UpdateButtons;
end;

procedure TfrmFinCreditosCPVisualizar.edtDevolucaoPlanoCodigoExit(
  Sender: TObject);
const
   SSQLSelectPlano = ''
      + 'SELECT '
      + '  DS_CONTA '
      + 'FROM '
      + '  FIN_CONFIG_PLANO_CONTAS '
      + 'WHERE '
      + '  CD_CONTA = ? AND '
      + '  CD_COLIGADA_MATRIZ = ? ';
var
   Stmt: IZPreparedStatement;
   ResultSet: IZResultSet;
   Found: Boolean;
begin
   edtDevolucaoPlanoNome.Clear;

   if edtDevolucaoPlanoCodigo.Text = '' then
      Exit;

   Stmt := PrepareStatement(SSQLSelectPlano);
   try
      Stmt.SetString(1, edtDevolucaoPlanoCodigo.Text);
      Stmt.SetInt(2, DM.UsuarioLogado.ColigadaLogada);
      ResultSet := Stmt.ExecuteQueryPrepared;
      try
         Found := ResultSet.Next;
         if Found then
            edtDevolucaoPlanoNome.Text := ResultSet.GetString(1);

         if not Found then
         begin
            edtDevolucaoPlanoCodigo.Clear;
            edtDevolucaoPlanoCodigo.SetFocus;
         end;
      finally
         ResultSet.Close;
         ResultSet := nil;
      end;
   finally
      Stmt.Close;
      Stmt := nil;
   end;
end;

procedure TfrmFinCreditosCPVisualizar.edtDevolucaoPlanoCodigoKeyPress(
  Sender: TObject; var Key: Char);
begin
   if Key = #13 then
      SelectNext(edtDevolucaoPlanoCodigo, True, True);

   if not (Key in [#8, #9, #48..#57, #127]) then
      Key := #0;   
end;

procedure TfrmFinCreditosCPVisualizar.edtDevolucaoValorChange(Sender: TObject);
begin
   UpdateButtons;
end;

procedure TfrmFinCreditosCPVisualizar.edtDevolucaoValorExit(Sender: TObject);
const
   SCaptionWarn = 'Atenção';
   SMsgValorInvalido = ''
      + 'O valor para devolução não pode ser superior ao valor disponível.';
begin
   if edtDevolucaoValor.getValorDouble > cdsCreditosSUM_DISPONIVEL.Value then
   begin
      MessageBox(Handle, SMsgValorInvalido, SCaptionWarn,
         MB_ICONWARNING or MB_OK);
      edtDevolucaoValor.SetFocus;
      edtDevolucaoValor.SelectAll;
   end;
end;

procedure TfrmFinCreditosCPVisualizar.ExcluiCredito;
const
   SChaveAcao = 'UMFinanceiro.Mensalidades.UtilizarCreditosDisponiveis';
   SCaptionQuest = 'Confirmação';
   SMsgConfirma = ''
      + 'Deseja realmente efetuar a exclusão do registro de crédito '
      + 'selecionado?'#13'Esta operação não poderá ser revertida. Deseja '
      + 'realmente continuar?';
   SSQLDeleteCredito = ''
      + 'DELETE '
      + '	C '
      + 'FROM '
      + '	FIN_CREDITO_CP C '
      + 'WHERE '
      + '	C.CD_CREDITO = ? ';
   SLogFmt = ''
      + '{'#13
      + #9'"tabela": "fin_credito_cp",'#13
      + #9'"colunas": {'#13
      + #9#9'"cd_credito": %d'#13
      + #9#9'"cd_titulo": %d'#13
      + #9#9'"vl_credito": %.2f'#13
      + #9#9'"ds_motivo": "%s"'#13
      + #9#9'"dt_registro": "%s"'#13
      + #9#9'"dt_alteracao": "%s"'#13
      + #9#9'"cd_usuario": %d'#13
      + #9'}'#13
      + '}';
   SDateTimeToIso = 'yyyy-mm-dd hh:nn:ss';
var
   LogObs, LogChave: AnsiString;
   UserChoice: Integer;
   Stmt: IZPreparedStatement;
begin
   if not DM.UsuarioLogado.TemPermissao(0, SChaveAcao, npExcluir, True) then
      Exit;

   UserChoice := MessageBox(Handle, SMsgConfirma, SCaptionQuest,
      MB_ICONQUESTION or MB_YESNO or MB_DEFBUTTON2);

   if UserChoice <> ID_YES then
      Exit;

   Stmt := PrepareStatement(SSQLDeleteCredito);
   try
      Stmt.SetInt(1, cdsCreditosCD_CREDITO.AsLargeInt);
      Stmt.ExecutePrepared;
   finally
      Stmt.Close;
      Stmt := nil;
   end;

   LogObs := Format(SLogFmt, [
      cdsCreditosCD_CREDITO.AsInteger,
      cdsCreditosCD_TITULO.AsInteger,
      cdsCreditosVL_CREDITO.AsFloat,
      cdsCreditosDS_MOTIVO.AsString,
      FormatDateTime(SDateTimeToIso, cdsCreditosDT_REGISTRO.AsDateTime),
      FormatDateTime(SDateTimeToIso, cdsCreditosDT_ALTERACAO.AsDateTime),
      cdsCreditosCD_USUARIO.AsInteger
   ]);
   LogChave := cdsCreditosCD_titulo.AsString;

   DM.setLog(2020, 'Exclusao', LogChave, DM.UsuarioLogado.ColigadaLogada, LogObs);

   CarregaDados;
end;

procedure TfrmFinCreditosCPVisualizar.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
   Action := caFree;
end;

procedure TfrmFinCreditosCPVisualizar.FormDestroy(Sender: TObject);
begin
   frmFinCreditoscpVisualizar := nil;
end;

procedure TfrmFinCreditosCPVisualizar.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
   case Key of
      VK_F9:
         if btnDevolver.Enabled then
            btnDevolver.Click;
      VK_F6:
         if btnExcluir.Enabled then
            btnExcluir.Click;
      VK_F12:
         if btnFechar.Enabled then
            btnFechar.Click;
   end;
end;

procedure TfrmFinCreditosCPVisualizar.FormShow(Sender: TObject);
begin
   CarregaDados;
end;

procedure TfrmFinCreditosCPVisualizar.LimpaFormulario;
const
   SHistoricoFmt = 'Devolução do pagamento para para %s';
begin
   dblcConta.KeyValue := Null;
   edtDevolucaoPlanoCodigo.Clear;
   edtDevolucaoPlanoNome.Clear;
   edtDevolucaoCentroCodigo.Clear;
   edtDevolucaoCentroNome.Clear;
   edtDevolucaoValor.Clear;
   mmDevolucaoHistorico.Text := Format(SHistoricoFmt, [FPessoaNome]);
end;

procedure TfrmFinCreditosCPVisualizar.mmDevolucaoHistoricoChange(Sender: TObject);
begin
   UpdateButtons;
end;

procedure TfrmFinCreditosCPVisualizar.sbDevolucaoCentroClick(Sender: TObject);
const
   SIntToStrFmt = '%d';
var
   Filtro: TResultadoBuscaCentro;
begin
   Filtro := TfrmBuscaCentro.getInstancia.ShowModal(False, tcAnalitico, True);
   if Filtro.objCentro = nil then
      Exit;
   edtDevolucaoCentroCodigo.Text :=
      Format(SIntToStrFmt, [Filtro.objCentro.Centro]);
   edtDevolucaoCentroNome.Text := Filtro.objCentro.Descricao;
end;

procedure TfrmFinCreditosCPVisualizar.sbDevolucaoPlanoClick(Sender: TObject);
begin
   frm_SelConta.filtroContas := tpcTodas;
   frm_SelConta.ShowModal;
   if not frm_SelConta.flgSearch then
      Exit;
   edtDevolucaoPlanoCodigo.Text := frm_SelConta.qyPlanosContasCD_CONTA.AsString;
   edtDevolucaoPlanoNome.Text := frm_SelConta.qyPlanosContasDS_CONTA.AsString;
end;

procedure TfrmFinCreditosCPVisualizar.UpdateButtons;
begin
   btnDevolver.Enabled :=
      (dblcConta.KeyValue <> Null) and
      (edtDevolucaoPlanoCodigo.Text <> '') and
      (edtDevolucaoCentroCodigo.Text <> '') and
      (edtDevolucaoValor.getValorDouble > 0) and
      (edtDevolucaoValor.getValorDouble <= cdsCreditosSUM_DISPONIVEL.Value) and
      (Trim(mmDevolucaoHistorico.Lines.Text) <> '');
   btnExcluir.Enabled :=
      (cdsCreditosVL_USADO.AsFloat = 0) and
      (cdsCreditosVL_DEVOLUCAO.AsFloat = 0);
end;

class procedure TfrmFinCreditosCPVisualizar.VisualizaCreditos(
  const PessoaId: Cardinal; const PessoaNome: AnsiString);
begin
   if frmFinCreditosCPVisualizar = nil then
      Application.CreateForm(TfrmFinCreditosCPVisualizar, frmFinCreditosCPVisualizar);
   frmFinCreditosCPVisualizar.FPessoaId := PessoaId;
   frmFinCreditosCPVisualizar.FPessoaNome := PessoaNome;
   frmFinCreditosCPVisualizar.pnlTitulo.Caption := PessoaNome;
   frmFinCreditosCPVisualizar.ShowModal;
end;

end.
