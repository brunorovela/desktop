unit uBuscaCaixaPlanilha;

interface

uses
   Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
   Dialogs, StdCtrls, ComCtrls, DBCtrls, Buttons, uDM, ZConnection, UZDataset,
   DB, DBGrids, ExtCtrls, UMDateTimePicker;

const
   SQL_FIN_MOV =
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
         'T.CD_CAIXA = :CD_CAIXA AND '+
         'T.CD_COLIGADA = :CD_COLIGADA AND '+
         'T.CD_ABERTURA_CAIXA = :CD_ABERTURA_CAIXA'+
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
   TfBuscaCaixaPlanilha = class(TForm)
    txtPlanoConta: TEdit;
    btnPlanoContas: TSpeedButton;
    Label1: TLabel;
    edCodMov: TEdit;
    FDtDataMovIni: TUMDateTimePicker;
    FDtDataMovFim: TUMDateTimePicker;
    FDtDataRegFim: TUMDateTimePicker;
    FDtDataRegIni: TUMDateTimePicker;
    procedure btnPlanoContasClick(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
   private
      constructor Create(const AICodCaixa, AICodAbertura, AICodColigada: Integer);
   public
      class function getFiltro(const AICodCaixa, AICodAbertura, AICodColigada: Integer): string;
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
      FLbTDataMov: TLabel;
      FCbDataMov: TCheckBox;
      FLbDataMovAte: TLabel;
      FLbTDataReg: TLabel;
      FCbDataReg: TCheckBox;
      FLbDataRegAte: TLabel;
      FLbTUsuario: TLabel;
      FCbUsuarios: TComboBox;
      FLbTEntSaida: TLabel;
      FCbTpEntSaida: TComboBox;
      FLbTOrigem: TLabel;
      FCbOrigem: TComboBox;
      FLbTVlLancamento: TLabel;
      FCbVlMaiorIgual: TCheckBox;
      FCbVlMenorIgual: TCheckBox;
      FEdVlMaiorIgual: TEdit;
      FEdVlMenorIgual: TEdit;
      FLbTHist: TLabel;
      FMmHist: TMemo;
      FCbCentroCusto: TComboBox;
      FLbTCompensado: TLabel;
      FCbCompensado: TComboBox;
      FLbTPlanoContas: TLabel;
      FLbTCentroCusto: TLabel;
      FBnOK: TBitBtn;
      FBnCancelar: TBitBtn;
      procedure inicializaForm(Sender: TObject);
      procedure habilitaFiltroDataMovimento(Sender: TObject);
      procedure habilitaFiltroDataRegistro(Sender: TObject);
      procedure habilitaFiltroValorLancmt(Sender: TObject);
      procedure validaValor(Sender: TObject; var Key: Char);
      procedure fimDigitacaoValor(Sender: TObject);
      procedure filtra(Sender: TObject);
      procedure cancela(Sender: TObject);
      property SQL: string read FSSQLFinMov;
      property Params: TParams read FParams;
   end;

var
   fBuscaCaixaPlanilha: TfBuscaCaixaPlanilha;

implementation

uses uSelConta;

{$R *.dfm}

{ TfBuscaCaixaPlanilha }

procedure TfBuscaCaixaPlanilha.btnPlanoContasClick(Sender: TObject);
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


procedure TfBuscaCaixaPlanilha.cancela(Sender: TObject);
begin
   //
end;

{ Carrega todos os centro de custos na combo box.
}
procedure TfBuscaCaixaPlanilha.carregaCentrosCusto;
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


{ Carrega todos os usuários na combo box.
}
procedure TfBuscaCaixaPlanilha.carregaUsuarios;
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

constructor TfBuscaCaixaPlanilha.Create(const AICodCaixa, AICodAbertura,
  AICodColigada: Integer);
begin
   inherited Create(nil);
   Self.FICodCaixa := AICodCaixa;
   Self.FICodAbertura := AICodAbertura;
   Self.FICodColigada := AICodColigada;
end;

procedure TfBuscaCaixaPlanilha.filtra(Sender: TObject);
begin
   Self.FCbVlMaiorIgual.Checked := (Trim(Self.FEdVlMaiorIgual.Text) <> '') and Self.FCbVlMaiorIgual.Checked;
   Self.FCbVlMenorIgual.Checked := (Trim(Self.FEdVlMenorIgual.Text) <> '') and Self.FCbVlMenorIgual.Checked;
   
   if DM.db.Protocol = DB_PROTOCOL_ORACLE then
      FSSQLFinMov := SQL_FIN_MOV_ORACLE
   else
      FSSQLFinMov := SQL_FIN_MOV;

   Self.setFiltros;
   Self.FSSQLFinMov := Format(FSSQLFinMov, ['']);
end;

{ Ao finalizar a digitação de valores.
}
procedure TfBuscaCaixaPlanilha.fimDigitacaoValor(Sender: TObject);
begin
   if Trim(TEdit(Sender).Text) = '' then
   begin
      if Sender = Self.FEdVlMaiorIgual then
      begin
         Self.FCbVlMaiorIgual.Checked := False;
      end else
      begin
         Self.FCbVlMenorIgual.Checked := False;
      end;
   end
   else if AnsiPos(',', TEdit(Sender).Text) = 0 then
   begin
      TEdit(Sender).Text := TEdit(Sender).Text + ',00';
   end
   else if AnsiPos(',', TEdit(Sender).Text) = Length(TEdit(Sender).Text) then
   begin
      TEdit(Sender).Text := TEdit(Sender).Text + '00';
   end;        
end;

procedure TfBuscaCaixaPlanilha.FormDestroy(Sender: TObject);
begin
   FParams.Free;
end;

class function TfBuscaCaixaPlanilha.getFiltro(const AICodCaixa, AICodAbertura, AICodColigada: Integer): string;
begin
   fBuscaCaixaPlanilha := TfBuscaCaixaPlanilha.Create(AICodCaixa, AICodAbertura, AICodColigada);
   try
      fBuscaCaixaPlanilha.ShowModal;
      case fBuscaCaixaPlanilha.ModalResult of
         mrOk: Result := fBuscaCaixaPlanilha.SQL;
         mrCancel: Result := '';
      end;
   finally
      //fBuscaCaixaPlanilha.Free;
   end;
end;

{ Habilita/desabilita o uso do filtro por data de movimentação.
}
procedure TfBuscaCaixaPlanilha.habilitaFiltroDataMovimento(Sender: TObject);
begin
   Self.FDtDataMovIni.Enabled := TCheckBox(Sender).Checked;
   Self.FDtDataMovFim.Enabled := TCheckBox(Sender).Checked;
end;

{ Habilita/desabilita o uso do filtro por data de registro.
}
procedure TfBuscaCaixaPlanilha.habilitaFiltroDataRegistro(Sender: TObject);
begin
   Self.FDtDataRegIni.Enabled := TCheckBox(Sender).Checked;
   Self.FDtDataRegFim.Enabled := TCheckBox(Sender).Checked;
end;

{ Habilita/desabilita o uso do filtro por valor de lançamento.
}
procedure TfBuscaCaixaPlanilha.habilitaFiltroValorLancmt(Sender: TObject);
begin
   Self.FEdVlMaiorIgual.Enabled := Self.FCbVlMaiorIgual.Checked;
   Self.FEdVlMenorIgual.Enabled := Self.FCbVlMenorIgual.Checked;
end;

procedure TfBuscaCaixaPlanilha.inicializaForm(Sender: TObject);
var
   i: Byte;
begin
   for i := 0 to Self.ComponentCount - 1 do
   begin
      if (Self.Components[i] is TUMDateTimePicker) then
      begin
         TUMDateTimePicker(Self.Components[i]).setDate(Now);
      end;
   end;
   Self.carregaUsuarios;
   Self.carregaCentrosCusto;
   FParams := TParams.Create;
end;

function TfBuscaCaixaPlanilha.isVazio(const ASStr: string): boolean;
begin
   Result :=
      (UpperCase(ASStr) = 'TODOS') or (UpperCase(ASStr) = 'AMBOS') or (UpperCase(ASStr) = 'QUALQUER');
end;

procedure TfBuscaCaixaPlanilha.ligaTabelaApropria;
begin
   if AnsiPos('fin_apropria_te', Self.FSSQLFinMov) = 0 then
   begin
      Self.FSSQLFinMov :=
         StringReplace(Self.FSSQLFinMov, '$JOIN$', 'LEFT JOIN fin_apropria_te a ON(t.cd_movimento_te = a.cd_movimento_te AND t.cd_coligada = a.cd_coligada) $JOIN$ ', [rfReplaceAll, rfIgnoreCase]);
   end;
end;

{ Adiciona no SQL comando para efetuar filtro pela data de movimento.
}
procedure TfBuscaCaixaPlanilha.setDataMovimento;
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

{ Adiciona no SQL comando para efetuar filtro pela data de registro.
}
procedure TfBuscaCaixaPlanilha.setDataRegistro;
const
   SQL_FILTRO = ' AND DT_REGISTRO BETWEEN :DT_REG_INICIAL AND :DT_REG_FINAL %s';
begin
   if Self.FCbDataReg.Checked then
   begin
      FSSQLFinMov := Format(FSSQLFinMov, [SQL_FILTRO]);
      FParams.CreateParam(ftUnknown, 'DT_REG_INICIAL', ptUnknown);
      FParams.CreateParam(ftUnknown, 'DT_REG_FINAL', ptUnknown);
//      FParams.ParamByName('DT_REG_INICIAL').AsDate := FDtDataRegIni.Date;
//      FParams.ParamByName('DT_REG_FINAL').AsDate := FDtDataRegFim.Date;
      FParams.ParamByName('DT_REG_INICIAL').AsString := FormatDateTime('yyyy-mm-dd 00:00:01', FDtDataRegIni.Date);
      FParams.ParamByName('DT_REG_FINAL').AsString := FormatDateTime('yyyy-mm-dd 23:59:01', FDtDataRegFim.Date);

   end;
end;

{ Adiciona ao SQL o comando para efetuar o filtro pelo centro de custo.
}
procedure TfBuscaCaixaPlanilha.setFiltroCentroCusto;
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

{ Adiciona ao SQL o comando para efetuar o filtro pelo fato de estar ou não compensado.
}
procedure TfBuscaCaixaPlanilha.setFiltroCodMov;
const
   SQL_FILTRO = ' AND T.CD_MOVIMENTO_TE = :CodMov %s';
begin
   if not (Self.edCodMov.Text = '') then
   begin
      FSSQLFinMov := Format(FSSQLFinMov, [SQL_FILTRO]);
      FParams.CreateParam(ftUnknown, 'CodMov', ptUnknown);
      FParams.ParamByName('CodMov').AsInteger := StrToInt(edCodMov.Text);
   end;
end;

procedure TfBuscaCaixaPlanilha.setFiltroCompensado;
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

{ Adiciona ao SQL o comando para efetuar o filtro pelo tipo de entrada/saída ou abertura de caixa.
}
procedure TfBuscaCaixaPlanilha.setFiltroEntSaida;
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

{ Adiciona ao SQL o comando para efetuar o filtro pelo histórico.
}
procedure TfBuscaCaixaPlanilha.setFiltroHistorico;
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

{ Adiciona ao SQL o comando peara efetuar o filtro pela origem.
}
procedure TfBuscaCaixaPlanilha.setFiltroOrigem;
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

{ Efetua o filtro também pelo plano de contas.
}
procedure TfBuscaCaixaPlanilha.setFiltroPlanoContas;
const
   SQL_FILTRO = ' AND PC.CD_CONTA IN (:DS_CONTA) %s';
begin
   if trim(Self.txtPlanoConta.Text) <> '' then
   begin
      FSSQLFinMov := Format(FSSQLFinMov, [SQL_FILTRO]);
      FSSQLFinMov := StringReplace(FSSQLFinMov, ':DS_CONTA', Self.txtPlanoConta.Text, [rfReplaceAll] );
   end;
end;

procedure TfBuscaCaixaPlanilha.setFiltros;
begin
   FParams.CreateParam(ftUnknown, 'CD_CAIXA', ptUnknown);
   FParams.CreateParam(ftUnknown, 'CD_ABERTURA_CAIXA', ptUnknown);
   FParams.CreateParam(ftUnknown, 'CD_COLIGADA', ptUnknown);
   FParams.ParamByName('CD_CAIXA').AsInteger := FICodCaixa;
   FParams.ParamByName('CD_ABERTURA_CAIXA').AsInteger := FICodAbertura;
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
end;

{ Efetua o fitlro pelo usuário.
}
procedure TfBuscaCaixaPlanilha.setFiltroUsuario;
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

procedure TfBuscaCaixaPlanilha.setFiltroValor;
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

procedure TfBuscaCaixaPlanilha.setFiltroValorMax;
const
   SQL_FILTRO = ' AND T.VL_MOVIMENTO <= :VL_MOVIMENTO %s';
begin
   FSSQLFinMov := Format(FSSQLFinMov, [SQL_FILTRO]);
   FParams.CreateParam(ftUnknown, 'VL_MOVIMENTO', ptUnknown);
   FParams.ParamByName('VL_MOVIMENTO').AsFloat := StrToFloat(FEdVlMenorIgual.Text); 
end;

procedure TfBuscaCaixaPlanilha.setFiltroValorMin;
const
   SQL_FILTRO = ' AND T.VL_MOVIMENTO >= :VL_MOVIMENTO %s';
begin
   FSSQLFinMov := Format(FSSQLFinMov, [SQL_FILTRO]);
   FParams.CreateParam(ftUnknown, 'VL_MOVIMENTO', ptUnknown);
   FParams.ParamByName('VL_MOVIMENTO').AsFloat := StrToFloat(FEdVlMaiorIgual.Text);
end;

{ Efetua validação dos valores digitados nos edits de entradas de valores.
}
procedure TfBuscaCaixaPlanilha.validaValor(Sender: TObject; var Key: Char);
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
   else if not (Key in['0'..'9', #8]) then
   begin
      Key := #0;
   end;
end;

end.
