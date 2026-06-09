unit uBuscarVariosCaixas;

interface

uses
   Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
   Dialogs, StdCtrls, ComCtrls, DBCtrls, Buttons, uDM, ZConnection, UZDataset,
   DB, DBGrids, CheckLst, ZAbstractRODataset, ZAbstractDataset, General;

const
   SQL_FIN_MOV =
      'SELECT DISTINCT '+
         'T.CD_MOVIMENTO_TE,'+
         'M.DS_MOEDA,'+
         'M.DS_SIGLA,'+
         'T.CD_COLIGADA,'+
         'T.CD_CAIXA,'+
         'T.CD_ABERTURA_CAIXA,'+
         'T.DT_MOVIMENTO,'+
         'T.CD_ACAO,'+
         'T.NR_DOCUMENTO,'+
         'T.DS_MOVIMENTO,'+
         'T.DT_LIBERACAO,'+
         'T.CD_ORIGEM,'+
         'T.TP_ENTRADA_SAIDA,'+
         'T.VL_MOVIMENTO,'+
         'T.CD_MOEDA,'+
         'T.VL_MOEDA,'+
         'T.VL_SALDO,'+
         'T.VL_DINHEIRO,'+
         'T.VL_CHEQUE,'+
         'T.CD_MENSALIDADE,'+
         'T.CD_USUARIO,'+
         'T.SN_COMPENSADO,'+
         'T.DT_COMPENSACAO,'+
         'T.CD_FORMA_PGTO,'+
         'T.DT_REGISTRO,'+
         'T.NR_CHEQUE,'+
         'T.VL_SALDO_COMPENSADO,'+
         'T.CD_TITULO,'+
         'T.NR_ESTORNO,'+
         'T.CD_TRANSFERE,'+
         'T.CD_CHEQUE,'+
         'T.DS_OBSERVACAO,'+
         'T.DS_OBSERVACAO,'+
         'PE.NM_PESSOA nm_fornecedor, ' +
         'CASE '+
            'WHEN T.CD_ORIGEM = 1 THEN ''CR'' '+
            'WHEN T.CD_ORIGEM = 2 THEN ''CP'' '+
            'WHEN T.CD_ORIGEM = 3 THEN ''TE'' '+
            'WHEN T.CD_ORIGEM = 4 THEN ''CE'' '+
            'ELSE '''' '+
         'END desOrigem,'+
         'CASE '+
            'WHEN T.TP_ENTRADA_SAIDA = 1 THEN T.VL_MOVIMENTO '+
            'ELSE -T.VL_MOVIMENTO '+
         'END ValMovimento,'+
         'CASE '+
            'WHEN T.TP_ENTRADA_SAIDA = 1 THEN T.VL_MOVIMENTO '+
            'ELSE 0.0 '+
         'END ValEntradasBanco,'+
         'CASE '+
            'WHEN T.TP_ENTRADA_SAIDA = 2 THEN T.VL_MOVIMENTO '+
            'ELSE 0.0 '+
         'END ValSaidasBanco,'+
         'CASE '+
            'WHEN T.TP_ENTRADA_SAIDA = 1 THEN ''E'' '+
            'ELSE ''S'' '+
         'END desES,'+
         'CASE '+
            'WHEN T.VL_DINHEIRO <= 0 THEN ''C'' '+
            'WHEN T.VL_CHEQUE > 0 THEN ''A'' '+
            'ELSE ''D'' '+
         'END desDinCh,'+
         'CASE '+
            'WHEN TRIM(C.DS_CHEQUE) <> '''' THEN C.DS_CHEQUE '+
            'WHEN T.VL_DINHEIRO > 0 THEN '''' '+
            'ELSE ''-'' '+
         'END desCh,'+
         'CASE '+
            'WHEN TRIM(C.DS_CHEQUE) <> '''' THEN S.DS_VALOR '+
            'WHEN T.VL_DINHEIRO > 0 THEN '''' '+
            'ELSE ''-'' '+
         'END desChSit,'+
         'CASE '+
            'WHEN TRIM(C.DS_CHEQUE) <> '''' THEN S.DS_SIGLA '+
            'WHEN T.VL_DINHEIRO > 0 THEN '''' '+
            'ELSE ''-'' '+
         'END desChSitSigla,'+
         'CASE '+
            'WHEN TRIM(C.DS_CHEQUE) <> '''' THEN CC.DS_CAIXA '+
            'WHEN T.VL_DINHEIRO > 0 THEN '''' '+
            'ELSE ''-'' '+
         'END desChCaixa '+
         ', US.NM_PESSOA nm_usuario ' + 
      'FROM '+
         'FIN_MOV_TESOURARIA T '+
            'LEFT JOIN MENSALIDADES ME ON '+
               '(T.CD_MENSALIDADE = ME.CD_MENSALIDADE) '+
            'LEFT JOIN USUARIOS U ON '+
               '(T.CD_USUARIO = U.CODIGO)'+
            'LEFT JOIN FIN_APROPRIA_TE A ON '+
               '(T.CD_MOVIMENTO_TE = A.CD_MOVIMENTO_TE) '+
            'LEFT JOIN FIN_PLANO_CONTAS PC ON ' +
               '(A.CD_CONTA = PC.CD_CONTA AND A.CD_COLIGADA = PC.CD_COLIGADA) '+               
            'LEFT JOIN FIN_CENTRO_CUSTOS CE ON '+
               '(A.CD_CENTRO = CE.CD_CENTRO AND A.CD_COLIGADA = CE.CD_COLIGADA) '+
            'LEFT JOIN FIN_MOEDAS M ON '+
               '(T.CD_MOEDA = M.CD_MOEDA) '+
            'LEFT JOIN FIN_CHEQUES C ON '+
               '(T.CD_CHEQUE = C.CD_CHEQUE) '+
               'LEFT JOIN FIN_CADASTRO_CONTAS CC ON '+
                  '(C.CD_CAIXA = CC.CD_CAIXA) '+
               'LEFT JOIN SITUACOES S ON '+
                  '(C.CD_SITUACAO = S.CD_SITUACAO) AND '+
                  '(S.CD_MODULO = 2050) '+
               'LEFT JOIN FIN_CONTAS_PAGAR CP ON ' +
               '(CP.CD_TITULO = T.CD_TITULO AND CP.CD_COLIGADA = T.CD_COLIGADA) '+
               'LEFT JOIN PESSOAS PE ON (PE.CD_PESSOA = CP.CD_PESSOA) '+
               'LEFT JOIN PESSOAS US ON (US.CD_PESSOA = T.CD_USUARIO) '+
      'WHERE '+
         'T.CD_COLIGADA = :CD_COLIGADA '+
         '%s';

      SQL_FIN_MOV_ORACLE =
      'SELECT '+
         'T.CD_MOVIMENTO_TE,'+
         'M.DS_MOEDA,'+
         'M.DS_SIGLA,'+
         'T.CD_COLIGADA,'+
         'T.CD_CAIXA,'+
         'T.CD_ABERTURA_CAIXA,'+
         'T.DT_MOVIMENTO,'+
         'T.CD_ACAO,'+
         'T.NR_DOCUMENTO,'+
         'T.DS_MOVIMENTO,'+
         'T.DT_LIBERACAO,'+
         'T.CD_ORIGEM,'+
         'T.TP_ENTRADA_SAIDA,'+
         'T.VL_MOVIMENTO,'+
         'T.CD_MOEDA,'+
         'T.VL_MOEDA,'+
         'T.VL_SALDO,'+
         'T.VL_DINHEIRO,'+
         'T.VL_CHEQUE,'+
         'T.CD_MENSALIDADE,'+
         'T.CD_USUARIO,'+
         'T.SN_COMPENSADO,'+
         'T.DT_COMPENSACAO,'+
         'T.CD_FORMA_PGTO,'+
         'T.DT_REGISTRO,'+
         'T.NR_CHEQUE,'+
         'T.VL_SALDO_COMPENSADO,'+
         'T.CD_TITULO,'+
         'T.NR_ESTORNO,'+
         'T.CD_TRANSFERE,'+
         'T.CD_CHEQUE,'+
         'T.DS_OBSERVACAO,'+
         'T.DS_OBSERVACAO,'+
         'CASE '+
            'WHEN T.CD_ORIGEM = 1 THEN ''CR'' '+
            'WHEN T.CD_ORIGEM = 2 THEN ''CP'' '+
            'WHEN T.CD_ORIGEM = 3 THEN ''TE'' '+
            'WHEN T.CD_ORIGEM = 4 THEN ''CE'' '+
            'ELSE '''' '+
         'END desOrigem,'+
         'CASE '+
            'WHEN T.TP_ENTRADA_SAIDA = 1 THEN T.VL_MOVIMENTO '+
            'ELSE -T.VL_MOVIMENTO '+
         'END ValMovimento,'+
         'CASE '+
            'WHEN T.TP_ENTRADA_SAIDA = 1 THEN T.VL_MOVIMENTO '+
            'ELSE NULL '+
         'END ValEntradasBanco,'+
         'CASE '+
            'WHEN T.TP_ENTRADA_SAIDA = 2 THEN T.VL_MOVIMENTO '+
            'ELSE NULL '+
         'END ValSaidasBanco,'+
         'CASE '+
            'WHEN T.TP_ENTRADA_SAIDA = 1 THEN ''E'' '+
            'ELSE ''S'' '+
         'END desES,'+
         'CASE '+
            'WHEN T.VL_DINHEIRO <= 0 THEN ''C'' '+
            'WHEN T.VL_CHEQUE > 0 THEN ''A'' '+
            'ELSE ''D'' '+
         'END desDinCh,'+
         'CASE '+
            'WHEN TRIM(C.DS_CHEQUE) <> '''' THEN C.DS_CHEQUE '+
            'WHEN T.VL_DINHEIRO > 0 THEN '''' '+
            'ELSE ''-'' '+
         'END desCh,'+
         'CASE '+
            'WHEN TRIM(C.DS_CHEQUE) <> '''' THEN S.DS_VALOR '+
            'WHEN T.VL_DINHEIRO > 0 THEN '''' '+
            'ELSE ''-'' '+
         'END desChSit,'+
         'CASE '+
            'WHEN TRIM(C.DS_CHEQUE) <> '''' THEN S.DS_SIGLA '+
            'WHEN T.VL_DINHEIRO > 0 THEN '''' '+
            'ELSE ''-'' '+
         'END desChSitSigla,'+
         'CASE '+
            'WHEN TRIM(C.DS_CHEQUE) <> '''' THEN CC.DS_CAIXA '+
            'WHEN T.VL_DINHEIRO > 0 THEN '''' '+
            'ELSE ''-'' '+
         'END desChCaixa '+
      'FROM '+
         'FIN_MOV_TESOURARIA T '+
            'LEFT JOIN MENSALIDADES ME ON '+
               '(T.CD_MENSALIDADE = ME.CD_MENSALIDADE) '+
            'LEFT JOIN USUARIOS U ON '+
               '(T.CD_USUARIO = U.CODIGO)'+
            'LEFT JOIN FIN_APROPRIA_TE A ON '+
               '(T.CD_MOVIMENTO_TE = A.CD_MOVIMENTO_TE) '+
            'LEFT JOIN FIN_PLANO_CONTAS PC ON ' +
               '(A.CD_CONTA = PC.CD_CONTA AND A.CD_COLIGADA = PC.CD_COLIGADA) '+               
            'LEFT JOIN FIN_CENTRO_CUSTOS CE ON '+
               '(A.CD_CENTRO = CE.CD_CENTRO AND A.CD_COLIGADA = CE.CD_COLIGADA) '+
            'LEFT JOIN FIN_MOEDAS M ON '+
               '(T.CD_MOEDA = M.CD_MOEDA) '+
            'LEFT JOIN FIN_CHEQUES C ON '+
               '(T.CD_CHEQUE = C.CD_CHEQUE) '+
               'LEFT JOIN FIN_CADASTRO_CONTAS CC ON '+
                  '(C.CD_CAIXA = CC.CD_CAIXA) '+
               'LEFT JOIN SITUACOES S ON '+
                  '(C.CD_SITUACAO = S.CD_SITUACAO) AND '+
                  '(S.CD_MODULO = 2050) '+
      'WHERE '+
         'T.CD_CAIXA = :CD_CAIXA AND '+
         'T.CD_COLIGADA = :CD_COLIGADA AND '+
         'T.CD_ABERTURA_CAIXA = :CD_ABERTURA_CAIXA'+
         '%s';


type
  TfrmBuscarVariosCaixas = class(TForm)
    FLbTDataMov: TLabel;
    FLbDataMovAte: TLabel;
    FLbTDataReg: TLabel;
    FLbDataRegAte: TLabel;
    FLbTUsuario: TLabel;
    FLbTEntSaida: TLabel;
    FLbTOrigem: TLabel;
    FLbTVlLancamento: TLabel;
    FLbTHist: TLabel;
    FLbTCompensado: TLabel;
    FLbTPlanoContas: TLabel;
    FLbTCentroCusto: TLabel;
    btnPlanoContas: TSpeedButton;
    FCbDataMov: TCheckBox;
    FDtDataMovIni: TDateTimePicker;
    FDtDataMovFim: TDateTimePicker;
    FCbDataReg: TCheckBox;
    FDtDataRegIni: TDateTimePicker;
    FDtDataRegFim: TDateTimePicker;
    FCbUsuarios: TComboBox;
    FCbTpEntSaida: TComboBox;
    FCbOrigem: TComboBox;
    FCbVlMaiorIgual: TCheckBox;
    FCbVlMenorIgual: TCheckBox;
    FEdVlMaiorIgual: TEdit;
    FEdVlMenorIgual: TEdit;
    FMmHist: TMemo;
    FCbCentroCusto: TComboBox;
    FCbCompensado: TComboBox;
    FBnOK: TBitBtn;
    FBnCancelar: TBitBtn;
    txtPlanoConta: TEdit;
    Label1: TLabel;
    edCodMov: TEdit;
    Label2: TLabel;
    clbCaixas: TCheckListBox;
    qyCaixas: TUMZQuery;
    qyCaixascd_caixa: TIntegerField;
    qyCaixascd_coligada: TIntegerField;
    qyCaixassn_todas_coligadas: TSmallintField;
    qyCaixasds_caixa: TStringField;
    qyCaixasds_observacao: TMemoField;
    qyCaixastp_conta: TSmallintField;
    qyCaixasnm_banco: TStringField;
    qyCaixasnr_banco: TStringField;
    qyCaixasnr_agencia: TStringField;
    qyCaixasnm_agencia: TStringField;
    qyCaixasnr_conta: TStringField;
    qyCaixasnr_float_bancario: TSmallintField;
    qyCaixasdt_criacao: TDateTimeField;
    qyCaixasvl_saldo_inicio: TFloatField;
    qyCaixassn_ativa: TStringField;
    qyCaixassn_conta_resultado: TSmallintField;
    qyCaixasnr_uso_banco: TStringField;
    qyCaixasds_mensagem_bloqueto: TMemoField;
    qyCaixassn_multa: TStringField;
    qyCaixassn_juros: TStringField;
    qyCaixassn_correcao: TStringField;
    qyCaixassn_juros_mensal: TStringField;
    qyCaixasvl_multa_percent: TFloatField;
    qyCaixasvl_juros_percent: TFloatField;
    qyCaixasvl_juros_mensal: TFloatField;
    qyCaixasnr_dias_acrescimo: TIntegerField;
    qyCaixasnr_dias_desconto: TIntegerField;
    qyCaixasvl_dias_desc_perc: TFloatField;
    qyCaixasnr_carteira: TStringField;
    qyCaixasnr_convenio: TStringField;
    qyCaixasnm_cedente: TStringField;
    qyCaixasds_cnpj_cedente: TStringField;
    qyCaixasnr_transacao: TStringField;
    qyCaixasds_identificacao_retorno: TStringField;
    qyCaixasnm_arquivo_bloqueto: TStringField;
    qyCaixasds_nn_prefixo: TStringField;
    qyCaixasnr_ultimo_cheque: TIntegerField;
    qyCaixasdt_saldo_base: TDateTimeField;
    qyCaixasnr_nn_ultimo: TIntegerField;
    qyCaixasnr_nn_tamanho: TLargeintField;
    qyCaixascd_boleto_online: TLargeintField;
    qyCaixascd_plano_conta: TLargeintField;
    qyCaixascd_conta_desconto: TLargeintField;
    qyCaixascd_conta_acrescimo: TLargeintField;
    qyCaixassn_saldo_disponivel: TSmallintField;
    qyCaixasds_categoria: TStringField;
    qyCaixascd_conta_tarifa: TLargeintField;
    qyCaixascd_centro_tarifa: TLargeintField;
    qyCaixasds_grupo_categoria: TStringField;
    qyCaixassn_transf_aberta: TSmallintField;
    qyCaixassn_ignorar_dda: TSmallintField;
    qyCaixascd_historico_baixa: TLargeintField;
    qyCaixasds_historico_baixa: TStringField;
    qyCaixascd_historico_desc: TLargeintField;
    qyCaixasds_historico_desc: TStringField;
    qyCaixascd_historico_juros: TLargeintField;
    qyCaixasds_historico_juros: TStringField;
    qyCaixascd_conta_desc_cp: TLargeintField;
    qyCaixascd_conta_multa_cp: TLargeintField;
    qyCaixascd_conta_juros_cp: TLargeintField;
    qyCaixasds_tipo: TStringField;
    sbMarcar: TSpeedButton;
    sbDesmarcar: TSpeedButton;
    procedure sbDesmarcarClick(Sender: TObject);
    procedure sbMarcarClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FBnOKClick(Sender: TObject);
    procedure FCbVlMenorIgualClick(Sender: TObject);
    procedure FCbVlMaiorIgualClick(Sender: TObject);
    procedure btnPlanoContasClick(Sender: TObject);
    procedure FCbDataRegClick(Sender: TObject);
    procedure FCbDataMovClick(Sender: TObject);
    procedure ValidaCampo(Sender: TObject; var Key: Char);
  private
      constructor Create(AICodColigada: Integer);
  public
      class function getFiltro(AICodColigada: Integer): string;
  strict private
     FICodCaixa: integer;
     FICodAbertura: integer;
     FICodColigada: integer;
     FSSQLFinMov: string;
     FParams: TParams;

     procedure ligaTabelaApropria;
     procedure carregaUsuarios;
     procedure carregaCentrosCusto;
     procedure setFiltros;
     procedure setDataMovimento;
     procedure setDataRegistro;
     procedure setFiltroUsuario;
     procedure setFiltroCdCaixa;
     procedure setFiltroEntSaida;
     procedure setFiltroCompensado;
     procedure setFiltroOrigem;
     procedure setFiltroCodMov;
     procedure setFiltroHistorico;
     procedure setFiltroPlanoContas;
     procedure setFiltroCentroCusto;
     procedure setFiltroValor;
     procedure setFiltroValorMin;
     procedure setFiltroValorMax;
     function isVazio(const ASStr: string): boolean;
   published
      property SQL: string read FSSQLFinMov;
      property Params: TParams read FParams;
   end;

var
  frmBuscarVariosCaixas: TfrmBuscarVariosCaixas;
  marcarDesmarcar: Boolean;

implementation

uses uSelConta;

{$R *.dfm}

procedure TfrmBuscarVariosCaixas.btnPlanoContasClick(Sender: TObject);
Var
   sFiltro,
   sOp : String;
   i : Integer;
begin
  // Seleção de Plano de Contas

  frm_SelConta.grd.Options := frm_SelConta.grd.Options + [dgMultiSelect];

  frm_SelConta.ShowModal;

  sFiltro := '';
  sOp := '';

  if frm_SelConta.flgSearch then begin

         for i := 0 to frm_SelConta.grd.SelectedRows.Count - 1 do begin
            frm_SelConta.grd.DataSource.DataSet.GotoBookmark(Pointer(frm_SelConta.grd.SelectedRows.Items[i]));

            sFiltro := sFiltro + sOp + frm_SelConta.qyPlanosContascd_conta.AsString;
            sOp := ', ';

         end;

     txtPlanoConta.Text := sFiltro;

  end;
  
end;

procedure TfrmBuscarVariosCaixas.ValidaCampo(Sender: TObject;
  var Key: Char);
begin
   if Key in[',', '.'] then
   begin
      if AnsiPos(',', TEdit(Sender).Text) > 0 then
      begin
         Key := #0;
      end else
      begin
         Key := ',';
      end;
   end
   else if Key = #13 then
   begin
      if Sender = Self.FEdVlMaiorIgual then
      begin
         Self.FCbVlMenorIgual.SetFocus;
      end else
      begin
         Self.FBnOK.SetFocus;
      end;
   end
   else if not (Key in['0'..'9', #8, ^V]) then
   begin
      Key := #0;
   end;
end;

procedure TfrmBuscarVariosCaixas.carregaCentrosCusto;
const
   SQL_CENTROS_CUSTO = 'SELECT cd_centro, ds_centro FROM fin_config_centro_custos '+
      ' WHERE cd_coligada_matriz = :cd_coligada_matriz ORDER BY ds_centro';
var
   qyCentrosCusto: TUMZQuery;
begin
   DM.CriarConsulta(qyCentrosCusto);
   try
      qyCentrosCusto.ParamCheck := True;
      qyCentrosCusto.SQL.Text := SQL_CENTROS_CUSTO;
      qyCentrosCusto.ParamByName('cd_coligada_matriz').AsInteger := DM.GetUsuarioLogado.GetColigadaLogada.Codigo;
      qyCentrosCusto.Open;
      Self.FCbCentroCusto.Items.Add('TODOS');
      while not qyCentrosCusto.Eof do
      begin
         Self.FCbCentroCusto.Items.Add(qyCentrosCusto.FieldByName('ds_centro').AsString);
         qyCentrosCusto.Next;
      end;
      Self.FCbCentroCusto.ItemIndex := 0;
   finally
      FreeAndNil(qyCentrosCusto);
   end;
end;

procedure TfrmBuscarVariosCaixas.carregaUsuarios;
const
   SQL_USUARIOS = 'SELECT nome FROM usuarios';
var
   qyUsuarios: TUMZQuery;
begin
   DM.CriarConsulta(qyUsuarios);
   try
      qyUsuarios.ParamCheck := True;
      qyUsuarios.SQL.Text := SQL_USUARIOS;
      qyUsuarios.Open;
      Self.FCbUsuarios.Items.Add('TODOS');
      while not qyUsuarios.Eof do
      begin
         Self.FCbUsuarios.Items.Add(qyUsuarios.FieldByName('nome').AsString);
         qyUsuarios.Next;
      end;
      Self.FCbUsuarios.ItemIndex := 0;
   finally
      FreeAndNil(qyUsuarios);
   end;
end;

constructor TfrmBuscarVariosCaixas.Create(AICodColigada: Integer);
var
   I: Integer;
begin
   inherited Create(nil);
   Self.FICodColigada := AICodColigada;

   qyCaixas.SQL.Text := '              '+
   '  SELECT                           '+
	'     c.*, t.ds_tipo                '+
   '  FROM                             '+
	'     fin_cadastro_contas c,        '+
	'     fin_cadastro_contas_tipos t   '+
   '  WHERE                            '+
	'     t.cd_tipo = c.tp_conta        '+
   '  ORDER BY                         '+
	'     c.sn_ativa = "S",             '+
	'     c.cd_caixa;                   ';

   qyCaixas.Open;

   qyCaixas.First;

   clbCaixas.Items.BeginUpdate;
   clbCaixas.Clear;

   while not qyCaixas.Eof do
   begin
      I := clbCaixas.Items.AddObject(
         qyCaixas.FieldByName('ds_caixa').AsString,
         qyCaixas.GetBookmark
      );

      clbCaixas.Checked[I] := False;

      qyCaixas.Next;
   end;

   clbCaixas.Items.EndUpdate;
end;

procedure TfrmBuscarVariosCaixas.FBnOKClick(Sender: TObject);
begin
   Self.FCbVlMaiorIgual.Checked := (Trim(Self.FEdVlMaiorIgual.Text) <> '') and Self.FCbVlMaiorIgual.Checked;
   Self.FCbVlMenorIgual.Checked := (Trim(Self.FEdVlMenorIgual.Text) <> '') and Self.FCbVlMenorIgual.Checked;
   
   if DM.db.Protocol = DB_PROTOCOL_ORACLE then
      FSSQLFinMov := SQL_FIN_MOV_ORACLE
   else
      FSSQLFinMov := SQL_FIN_MOV;

   Self.setFiltros;
   Self.FSSQLFinMov := Format(FSSQLFinMov, ['']);

   ModalResult := mrOk;
end;

procedure TfrmBuscarVariosCaixas.FCbDataMovClick(Sender: TObject);
begin
   Self.FDtDataMovIni.Enabled := TCheckBox(Sender).Checked;
   Self.FDtDataMovFim.Enabled := TCheckBox(Sender).Checked;
end;

procedure TfrmBuscarVariosCaixas.FCbDataRegClick(Sender: TObject);
begin
   Self.FDtDataRegIni.Enabled := TCheckBox(Sender).Checked;
   Self.FDtDataRegFim.Enabled := TCheckBox(Sender).Checked;
end;

procedure TfrmBuscarVariosCaixas.FCbVlMaiorIgualClick(Sender: TObject);
begin
   Self.FEdVlMaiorIgual.Enabled := Self.FCbVlMaiorIgual.Checked;
   Self.FEdVlMenorIgual.Enabled := Self.FCbVlMenorIgual.Checked;
end;

procedure TfrmBuscarVariosCaixas.FCbVlMenorIgualClick(Sender: TObject);
begin
   Self.FEdVlMaiorIgual.Enabled := Self.FCbVlMaiorIgual.Checked;
   Self.FEdVlMenorIgual.Enabled := Self.FCbVlMenorIgual.Checked;
end;

procedure TfrmBuscarVariosCaixas.FormCreate(Sender: TObject);
var
   i: Byte;
begin
   for i := 0 to Self.ComponentCount - 1 do
   begin
      if (Self.Components[i] is TDateTimePicker) then
      begin
         TDateTimePicker(Self.Components[i]).Date := Now;
      end;
   end;
   Self.carregaUsuarios;
   Self.carregaCentrosCusto;
   FParams := TParams.Create;
end;

procedure TfrmBuscarVariosCaixas.FormShow(Sender: TObject);
begin
   marcarDesmarcar := True;

   Left:=(Screen.Width-Width)  div 2;
   Top:=(Screen.Height-Height) div 2;
end;

class function TfrmBuscarVariosCaixas.getFiltro(AICodColigada: Integer): string;
begin
   frmBuscarVariosCaixas := TfrmBuscarVariosCaixas.Create(AICodColigada);
   try

      frmBuscarVariosCaixas.ShowModal;
      case frmBuscarVariosCaixas.ModalResult of
         mrOk: Result := frmBuscarVariosCaixas.SQL;
         mrCancel: Result := '';
      end;
   finally
      //fBuscaCaixaPlanilha.Free;
   end;
end;

function TfrmBuscarVariosCaixas.isVazio(const ASStr: string): boolean;
begin
   Result :=
      (UpperCase(ASStr) = 'TODOS') or (UpperCase(ASStr) = 'AMBOS') or (UpperCase(ASStr) = 'QUALQUER');
end;

procedure TfrmBuscarVariosCaixas.ligaTabelaApropria;
begin
   if AnsiPos('fin_apropria_te', Self.FSSQLFinMov) = 0 then
   begin
      Self.FSSQLFinMov :=
         StringReplace(Self.FSSQLFinMov, '$JOIN$', 'LEFT JOIN fin_apropria_te a ON(t.cd_movimento_te = a.cd_movimento_te AND t.cd_coligada = a.cd_coligada) $JOIN$ ', [rfReplaceAll, rfIgnoreCase]);
   end;
end;

procedure TfrmBuscarVariosCaixas.sbDesmarcarClick(Sender: TObject);
var
   i: Integer;
begin
   for i := 0 to clbCaixas.Items.Count -1 do
   begin
      clbCaixas.Checked[i] := False;
   end;
end;

procedure TfrmBuscarVariosCaixas.sbMarcarClick(Sender: TObject);
var
   i: Integer;
begin

   for i := 0 to clbCaixas.Items.Count -1 do
   begin
      clbCaixas.Checked[i] := True;
   end;

end;

procedure TfrmBuscarVariosCaixas.setDataMovimento;
const
   SQL_FILTRO = ' AND T.DT_MOVIMENTO BETWEEN :DT_MOV_INICIAL AND :DT_MOV_FINAL %s';
begin
   if Self.FCbDataMov.Checked then
   begin
      FSSQLFinMov := Format(FSSQLFinMov, [SQL_FILTRO]);
      FParams.CreateParam(ftUnknown, 'DT_MOV_INICIAL', ptUnknown);
      FParams.CreateParam(ftUnknown, 'DT_MOV_FINAL', ptUnknown);
      FParams.ParamByName('DT_MOV_INICIAL').AsDate := FDtDataMovIni.Date;
      FParams.ParamByName('DT_MOV_FINAL').AsDate := FDtDataMovFim.Date;
   end;
end;

procedure TfrmBuscarVariosCaixas.setDataRegistro;
const
   SQL_FILTRO = ' AND DT_REGISTRO BETWEEN :DT_REG_INICIAL AND :DT_REG_FINAL %s';
begin
   if Self.FCbDataReg.Checked then
   begin
      FSSQLFinMov := Format(FSSQLFinMov, [SQL_FILTRO]);
      FParams.CreateParam(ftUnknown, 'DT_REG_INICIAL', ptUnknown);
      FParams.CreateParam(ftUnknown, 'DT_REG_FINAL', ptUnknown);
      FParams.ParamByName('DT_REG_INICIAL').AsString := FormatDateTime('yyyy-mm-dd 00:00:01', FDtDataRegIni.Date);
      FParams.ParamByName('DT_REG_FINAL').AsString := FormatDateTime('yyyy-mm-dd 23:59:01', FDtDataRegFim.Date);
   end;
end;

procedure TfrmBuscarVariosCaixas.setFiltroCdCaixa;
const
   SQL_FILTRO = ' AND T.CD_CAIXA IN (:CD_CAIXAS) %s';
var
   i: Integer;
   cd_caixas: String;
begin
   qyCaixas.First;

   cd_caixas := '';

   for I := 0 to clbCaixas.Count - 1 do
   begin
      if clbCaixas.ItemEnabled[I] and clbCaixas.Checked[I] then
      begin

         if (cd_caixas = '') then
         begin
            qyCaixas.GotoBookmark(clbCaixas.Items.Objects[I]);
            cd_caixas := qyCaixas.FieldByName('cd_caixa').asString;
         end
         else
         begin
            qyCaixas.GotoBookmark(clbCaixas.Items.Objects[I]);
            cd_caixas := cd_caixas + ', ' + Trim(qyCaixas.FieldByName('cd_caixa').asString);
         end;

      end;
   end;

   if cd_caixas <> '' then
   begin

      FSSQLFinMov := Format(FSSQLFinMov, [SQL_FILTRO]);
      FParams.CreateParam(ftUnknown, 'CD_CAIXAS', ptUnknown);
      FParams.ParamByName('CD_CAIXAS').AsString := cd_caixas;

   end;
end;

procedure TfrmBuscarVariosCaixas.setFiltroCentroCusto;
const
   SQL_FILTRO = ' AND CE.DS_CENTRO LIKE :DS_CENTRO %s';
begin
   if not Self.isVazio(Self.FCbCentroCusto.Text) then
   begin
      FSSQLFinMov := Format(FSSQLFinMov, [SQL_FILTRO]);
      FParams.CreateParam(ftUnknown, 'DS_CENTRO', ptUnknown);
      FParams.ParamByName('DS_CENTRO').AsString := FCbCentroCusto.Text;
   end;
end;

procedure TfrmBuscarVariosCaixas.setFiltroCodMov;
const
   SQL_FILTRO = ' AND T.CD_MOVIMENTO_TE = :CodMov %s';
begin
   if (Trim(Self.edCodMov.Text) <> '') then
   begin
      FSSQLFinMov := Format(FSSQLFinMov, [SQL_FILTRO]);
      FParams.CreateParam(ftUnknown, 'CodMov', ptUnknown);
      FParams.ParamByName('CodMov').AsInteger := StrToInt(edCodMov.Text);
   end;
end;

procedure TfrmBuscarVariosCaixas.setFiltroCompensado;
const
   SQL_FILTRO = ' AND T.SN_COMPENSADO = :SN_COMPENSADO %s';
begin
   if not Self.isVazio(Self.FCbCompensado.Text) then
   begin
      FSSQLFinMov := Format(FSSQLFinMov, [SQL_FILTRO]);
      FParams.CreateParam(ftUnknown, 'SN_COMPENSADO', ptUnknown);
      FParams.ParamByName('SN_COMPENSADO').AsInteger := FCbCompensado.ItemIndex;
   end;
end;

procedure TfrmBuscarVariosCaixas.setFiltroEntSaida;
const
   SQL_FILTRO = ' AND T.TP_ENTRADA_SAIDA = :TP_ENTRADA_SAIDA %s';
begin
   if not Self.isVazio(Self.FCbTpEntSaida.Text) then
   begin
      FSSQLFinMov := Format(FSSQLFinMov, [SQL_FILTRO]);
      FParams.CreateParam(ftUnknown, 'TP_ENTRADA_SAIDA', ptUnknown);
      FParams.ParamByName('TP_ENTRADA_SAIDA').AsInteger := FCbTpEntSaida.ItemIndex;
   end;
end;

procedure TfrmBuscarVariosCaixas.setFiltroHistorico;
const
   SQL_FILTRO = ' AND T.DS_MOVIMENTO LIKE :DS_MOVIMENTO %s';
begin
   if Trim(Self.FMmHist.Lines.Text) <> '' then
   begin
      FSSQLFinMov := Format(FSSQLFinMov, [SQL_FILTRO]);
      FParams.CreateParam(ftUnknown, 'DS_MOVIMENTO', ptUnknown);
      FParams.ParamByName('DS_MOVIMENTO').AsString := '%' + FMmHist.Lines.Text + '%';
   end;
end;

procedure TfrmBuscarVariosCaixas.setFiltroOrigem;
const
   SQL_FILTRO = ' AND T.CD_ORIGEM = :CD_ORIGEM %s';
begin
   if not Self.isVazio(Self.FCbOrigem.Text) then
   begin
      FSSQLFinMov := Format(FSSQLFinMov, [SQL_FILTRO]);
      FParams.CreateParam(ftUnknown, 'CD_ORIGEM', ptUnknown);
      FParams.ParamByName('CD_ORIGEM').AsInteger := FCbOrigem.ItemIndex;
   end;
end;

procedure TfrmBuscarVariosCaixas.setFiltroPlanoContas;
const
   SQL_FILTRO = ' AND PC.CD_CONTA IN (:DS_CONTA) %s';
begin
   if trim(Self.txtPlanoConta.Text) <> '' then
   begin
      FSSQLFinMov := Format(FSSQLFinMov, [SQL_FILTRO]);
      FSSQLFinMov := StringReplace(FSSQLFinMov, ':DS_CONTA', Self.txtPlanoConta.Text, [rfReplaceAll] );
   end;
end;

procedure TfrmBuscarVariosCaixas.setFiltros;
begin

   //Adiciona filtro fixo de coligada.
   FParams.CreateParam(ftUnknown, 'CD_COLIGADA', ptUnknown);
   FParams.ParamByName('CD_COLIGADA').AsInteger := FICodColigada;

   Self.setDataMovimento;
   Self.setDataRegistro;
   Self.setFiltroUsuario;
   Self.setFiltroEntSaida;
   Self.setFiltroCompensado;
   Self.setFiltroOrigem;
   Self.setFiltroHistorico;
   Self.setFiltroPlanoContas;
   Self.setFiltroCentroCusto;
   Self.setFiltroValor;
   Self.setFiltroCodMov;
   Self.setFiltroCdCaixa
end;

procedure TfrmBuscarVariosCaixas.setFiltroUsuario;
const
   SQL_FILTRO = ' AND U.NOME LIKE :NM_USUARIO %s';
begin
   if not Self.isVazio(Self.FCbUsuarios.Text) then
   begin
      FSSQLFinMov := Format(FSSQLFinMov, [SQL_FILTRO]);
      FParams.CreateParam(ftUnknown, 'NM_USUARIO', ptUnknown);
      FParams.ParamByName('NM_USUARIO').AsString := FCbUsuarios.Text;
   end;
end;

procedure TfrmBuscarVariosCaixas.setFiltroValor;
const
   SQL_FILTRO = ' AND T.VL_MOVIMENTO BETWEEN :VL_MOV_MENOR AND :VL_MOV_MAIOR %s';
begin
   if Self.FCbVlMaiorIgual.Checked and Self.FCbVlMenorIgual.Checked then
   begin
      FSSQLFinMov := Format(FSSQLFinMov, [SQL_FILTRO]);
      FParams.CreateParam(ftUnknown, 'VL_MOV_MENOR', ptUnknown);
      FParams.CreateParam(ftUnknown, 'VL_MOV_MAIOR', ptUnknown);
      FParams.ParamByName('VL_MOV_MENOR').AsFloat := StrToFloat(FEdVlMaiorIgual.Text);
      FParams.ParamByName('VL_MOV_MAIOR').AsFloat := StrToFloat(FEdVlMenorIgual.Text);
   end
   else if Self.FCbVlMaiorIgual.Checked and (not Self.FCbVlMenorIgual.Checked) then
   begin
      Self.setFiltroValorMin;
   end
   else if (not Self.FCbVlMaiorIgual.Checked) and Self.FCbVlMenorIgual.Checked then
   begin
      Self.setFiltroValorMax;
   end;
end;

procedure TfrmBuscarVariosCaixas.setFiltroValorMax;
const
   SQL_FILTRO = ' AND T.VL_MOVIMENTO <= :VL_MOVIMENTO %s';
begin
   FSSQLFinMov := Format(FSSQLFinMov, [SQL_FILTRO]);
   FParams.CreateParam(ftUnknown, 'VL_MOVIMENTO', ptUnknown);
   FParams.ParamByName('VL_MOVIMENTO').AsFloat := StrToFloat(FEdVlMenorIgual.Text); 
end;

procedure TfrmBuscarVariosCaixas.setFiltroValorMin;
const
   SQL_FILTRO = ' AND T.VL_MOVIMENTO >= :VL_MOVIMENTO %s';
begin
   FSSQLFinMov := Format(FSSQLFinMov, [SQL_FILTRO]);
   FParams.CreateParam(ftUnknown, 'VL_MOVIMENTO', ptUnknown);
   FParams.ParamByName('VL_MOVIMENTO').AsFloat := StrToFloat(FEdVlMaiorIgual.Text);
end;

end.
