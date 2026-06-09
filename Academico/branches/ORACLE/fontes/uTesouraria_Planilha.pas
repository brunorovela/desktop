unit uTesouraria_Planilha;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Menus, DB, ZConnection, ImgList, ComCtrls, ToolWin, DBCtrls,
  StdCtrls, Mask, Grids, DBGrids, ExtCtrls, General, ZAbstractRODataset, ZAbstractDataset, ZDataset, UZDataset, Buttons, uClassMovimento, Contnrs,
  ClassRegistros, UMDateTimePicker;
type
  rMovimento = record
     Valor   : Currency;
     Cheque  : Currency;
     Dinheiro : Currency;
  end;

  // Fila com saldos
  PSaldo = record
     Registro : TBookmark;
     Saldo : Currency;
     Prox : Pointer;
  end;

  Tfrm_Tesouraria_Planilha = class(TForm)
    pnTitulo: TPanel;
    Panel4: TPanel;
    srcTesouraria: TDataSource;
    pnRodape: TPanel;
    sbReceber: TSpeedButton;
    sbFechar: TSpeedButton;
    pmFiltros: TPopupMenu;
    odos1: TMenuItem;
    Selecionar1: TMenuItem;
    pmLog: TPopupMenu;
    sbPagar: TSpeedButton;
    bv1: TBevel;
    grd: TDBGrid;
    qyOrigens: TUMZQuery;
    pnSaldos: TPanel;
    Bevel1: TBevel;
    Label3: TLabel;
    Label4: TLabel;
    lbEntradas: TLabel;
    lbSaidas: TLabel;
    btnEstornar: TSpeedButton;
    pnData: TPanel;
    Bevel4: TBevel;
    pnBanco: TPanel;
    lbData: TLabel;
    pnCaixa: TPanel;
    lbCaixa: TLabel;
    pnSaldo: TPanel;
    qyTotais: TUMZQuery;
    Label1: TLabel;
    Label2: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    lblEntradasDinheiro: TLabel;
    lblSaidasDinheiro: TLabel;
    lblSaidasCheques: TLabel;
    lblEntradasCheque: TLabel;
    Bevel2: TBevel;
    btnCompensar: TSpeedButton;
    btnDescompensar: TSpeedButton;
    sbSelecionarColuna: TSpeedButton;
    btnAlterar: TSpeedButton;
    sbAtualizar: TSpeedButton;
    btnImprimir: TSpeedButton;
    FBnFiltra: TSpeedButton;
    FBnLimpaFiltros: TSpeedButton;
    FLbFiltro: TLabel;
    qryTesouraria: TUMZQuery;
    qryTesourariaDS_MOEDA: TStringField;
    qryTesourariaDS_SIGLA: TStringField;
    qryTesourariaCD_MOVIMENTO_TE: TLargeintField;
    qryTesourariaCD_COLIGADA: TIntegerField;
    qryTesourariaCD_ABERTURA_CAIXA: TIntegerField;
    qryTesourariaDT_MOVIMENTO: TDateTimeField;
    qryTesourariaCD_ACAO: TIntegerField;
    qryTesourariaNR_DOCUMENTO: TStringField;
    qryTesourariaDS_MOVIMENTO: TStringField;
    qryTesourariaDT_LIBERACAO: TDateTimeField;
    qryTesourariaCD_ORIGEM: TSmallintField;
    qryTesourariaTP_ENTRADA_SAIDA: TSmallintField;
    qryTesourariaVL_MOVIMENTO: TFloatField;
    qryTesourariaCD_MOEDA: TLargeintField;
    qryTesourariaVL_MOEDA: TFloatField;
    qryTesourariaVL_SALDO: TFloatField;
    qryTesourariaVL_DINHEIRO: TFloatField;
    qryTesourariaVL_CHEQUE: TFloatField;
    qryTesourariaCD_MENSALIDADE: TLargeintField;
    qryTesourariaCD_USUARIO: TLargeintField;
    qryTesourariaSN_COMPENSADO: TSmallintField;
    qryTesourariaDT_COMPENSACAO: TDateTimeField;
    qryTesourariaCD_FORMA_PGTO: TLargeintField;
    qryTesourariaDT_REGISTRO: TDateTimeField;
    qryTesourariaNR_CHEQUE: TIntegerField;
    qryTesourariaVL_SALDO_COMPENSADO: TFloatField;
    qryTesourariaCD_TITULO: TLargeintField;
    qryTesourariaNR_ESTORNO: TLargeintField;
    qryTesourariaCD_TRANSFERE: TLargeintField;
    qryTesourariaCD_CHEQUE: TLargeintField;
    qryTesourariaDS_OBSERVACAO: TMemoField;
    qryTesourariaDS_OBSERVACAO_1: TMemoField;
    qryTesourariaDESORIGEM: TStringField;
    qryTesourariaVALMOVIMENTO: TFloatField;
    qryTesourariaDESES: TStringField;
    qryTesourariaDESDINCH: TStringField;
    qryTesourariaDESCH: TStringField;
    qryTesourariaDESCHSIT: TStringField;
    qryTesourariaDESCHSITSIGLA: TStringField;
    qryTesourariaDESCHCAIXA: TStringField;
    qrySelectSaldo: TUMZReadOnlyQuery;
    qrySelectSaldoComp: TUMZReadOnlyQuery;
    qrySelectSaldoSALDO: TFloatField;
    qrySelectSaldoCompSALDO: TFloatField;
    qryTesourariaValSaidasBanco: TFloatField;
    qryTesourariaValEntradas: TStringField;
    qryTesourariaValSaidas: TStringField;
    qryTesourariaValEntradasBanco: TFloatField;
    Label7: TLabel;
    qryTesourariaCD_CAIXA: TIntegerField;
    qryTesourariaVLSALDO: TFloatField;
    qryTesourariaVLSALDOCOMP: TFloatField;
    qryTesourariaNM_FORNECEDOR: TStringField;
    qryTesourariaNM_USUARIO: TStringField;
    qyCalcCC: TUMZQuery;
    qyCalcCCCD_CONTA: TStringField;
    qyCalcCCDS_CENTRO: TStringField;
    qyCalcCCCD_CENTRO: TIntegerField;
    qryTesourariaCentroCusto: TStringField;
    qryTesourariaPlanoContas: TStringField;
    qryTesourariaContasCod: TStringField;
    qryTesourariaCentrosCod: TStringField;
    qyCalcCCDS_CONTA: TStringField;
    umdtDataInicial: TUMDateTimePicker;
    umdtDataFinal: TUMDateTimePicker;
    Bevel3: TBevel;
    Label8: TLabel;
    lbTotal: TLabel;
    Label9: TLabel;
    Label10: TLabel;
    lbTotalDinheiro: TLabel;
    lbTotalCheque: TLabel;
    procedure umdtDataFinalChangeDate(Sender: TObject);
    procedure grdDblClick(Sender: TObject);
    procedure dtpDataInicioChange(Sender: TObject);
    procedure btnImprimirClick(Sender: TObject);
    procedure sbAtualizarClick(Sender: TObject);
    procedure qryTesourariaAfterOpen(DataSet: TDataSet);
    procedure grdKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure btnAlterarClick(Sender: TObject);
    procedure sbSelecionarColunaClick(Sender: TObject);
    procedure grdTitleClick(Column: TColumn);
    procedure qryTesourariasn_compensadoGetText(Sender: TField; var Text: string;
      DisplayText: Boolean);
    procedure btnCompensarClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure btnSairClick(Sender: TObject);
    procedure qryTesourariaCalcFields(DataSet: TDataSet);
    procedure sbFecharClick(Sender: TObject);
    procedure sbReceberClick(Sender: TObject);
    procedure dtpDataInicialChange(Sender: TObject);
    procedure sbPagarClick(Sender: TObject);
    procedure btnEstornarClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure filtra(Sender: TObject); overload;
    procedure limpaFiltros(Sender: TObject);
    procedure ExecutaFiltro();
  private
    { Private declarations }

    sOrdem : string;
    sSQLFiltro : string;

    FListaSaldos: TStringList;
    FListaSaldosOrdem: TStringList;
    FListaSaldosComp: TStringList;
    FListaSaldosCompOrdem: TStringList;


    procedure atualizar_totais;

    function RetornarCodigoEstorno ( CodAcao : Integer; Var tpEntradaSaida : Word ) : Integer;
  public
    { Public declarations }
    intCodAbertura      : Integer;
    intCodCaixa         : Integer;
    cd_coligada_caixa   : Integer;
    sOrdenacao          : string;
    bEstornar           : boolean;

    Procedure Filtra; overload;
    Procedure MontaComboCaixa;
    procedure filtraSelecionada(cd_caixa, cd_abertura_caixa, cd_coligada, cd_movimento_te: Integer);
  end;

var
  frm_Tesouraria_Planilha: Tfrm_Tesouraria_Planilha;
  filtro, filtro2, caixa: integer;
CONST
  iModuloPadrao = 2009;

implementation

uses
   Main, uDM, Math, uTesouraria_gerar, uUsuario, uCamposPlanilhas,
   uBuscaCaixaPlanilha, uTesouraria_compensar, uEstornoObs;


{$R *.dfm}

procedure Tfrm_Tesouraria_Planilha.Filtra(Sender: TObject);
var
   sSQL: string;
begin

   sSQL := TfBuscaCaixaPlanilha.getFiltro(Self.intCodCaixa, Self.intCodAbertura, Self.cd_coligada_caixa);

   if sSQL <> '' then
   begin
      // Grava o SQL a ser executado para filtrar
      sSQLFiltro := sSQL;

      ExecutaFiltro();
   end;
end;

procedure Tfrm_Tesouraria_Planilha.ExecutaFiltro();
var
   I: integer;
begin
   if sSQLFiltro <> '' then
   begin
      Self.qryTesouraria.AutoCalcFields := false;
      Self.qryTesouraria.Close;
      Self.qryTesouraria.SQL.Text := sSQLFiltro;
      for I := 0 to qryTesouraria.Params.Count - 1 do
         try
            qryTesouraria.Params[I].Value :=
               fBuscaCaixaPlanilha.Params.ParamByName(qryTesouraria.Params[I].Name).Value;
         except

         end;
      Self.qryTesouraria.Open;
      Self.FBnLimpaFiltros.Enabled := True;
      Self.FLbFiltro.Visible := True;
      //fBuscaCaixaPlanilha.Free;
   end;
end;

procedure Tfrm_Tesouraria_Planilha.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
   Action := caFree;

end;

procedure Tfrm_Tesouraria_Planilha.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin

  case Key of
    VK_F5 : Filtra();
    VK_F12 : btnSairClick( nil );
  end;

end;

procedure Tfrm_Tesouraria_Planilha.btnSairClick(Sender: TObject);
begin
  Close();
end;

procedure Tfrm_Tesouraria_Planilha.qryTesourariaAfterOpen(DataSet: TDataSet);
begin
   atualizar_totais();
end;

procedure Tfrm_Tesouraria_Planilha.qryTesourariaCalcFields(
  DataSet: TDataSet);
Var
  sCentro : String;
  sConta : String;
  sOp, sOp2 : String;
  sContasCod : String;
  sCEntroCod : String;
begin
    // Apresentar o saldo que foi guardado na stringlist;
    if( FListaSaldosOrdem.Values[qryTesourariacd_movimento_te.AsString] <> '' ) then
       qryTesourariaVLSALDO.AsFloat :=   StrToFloat(FListaSaldosOrdem.Values[qryTesourariacd_movimento_te.AsString]);
    if( FListaSaldosCompOrdem.Values[qryTesourariacd_movimento_te.AsString] <> '' ) then
       qryTesourariaVLSALDOCOMP.AsFloat :=  StrToFloat(FListaSaldosCompOrdem.Values[qryTesourariacd_movimento_te.AsString]);

    if qryTesourariaValEntradasBanco.AsFloat = 0.0 then
      qryTesourariaValEntradas.AsString := ''
    else
      qryTesourariaValEntradas.AsString := FormatCurr('###,###,##0.00',qryTesourariaValEntradasBanco.AsCurrency);

    if qryTesourariaValSaidasBanco.AsFloat = 0.0 then
      qryTesourariaValSaidas.AsString := ''
    else
      qryTesourariaValSaidas.AsString := FormatCurr('###,###,##0.00',qryTesourariaValSaidasBanco.AsCurrency);

     qyCalcCC.Close();
     qyCalcCC.ParamByName('CD_MOVIMENTO_TE').AsInteger := qryTesourariaCD_MOVIMENTO_TE.AsInteger;
     qyCalcCC.Open();

     sCentro := '';
     sOp := '';

     sContasCod := '';
     sCEntroCod := '';

      sOp2 := '';

     while not qyCalcCC.Eof do
     begin
         sCentro := sCentro + sOp + qyCalcCC.FieldByName('ds_centro').AsString;
         
         if Pos(qyCalcCC.FieldByName('cd_conta').AsString, sContasCod) <= 0 then
         begin
            sContasCod := sContasCod + sOp2 + qyCalcCC.FieldByName('cd_conta').AsString;
         end;

         sCentroCod := sCentroCod + sOp2 + qyCalcCC.FieldByName('cd_centro').AsString;

          if (Pos(qyCalcCC.FieldByName('ds_conta').AsString, sCentro) <= 0)
            and(Pos(qyCalcCC.FieldByName('ds_conta').AsString, sConta) <= 0) then
         begin
            sConta := sConta + sOp + qyCalcCC.FieldByName('ds_conta').AsString;
         end;

         sOp := ' / ';
         sOp2 := ',';
         qyCalcCC.Next();
     end;

     qryTesourariaCentroCusto.AsString := sCentro;

     qryTesourariaContasCod.AsString := sContasCod;
     qryTesourariaCentrosCod.AsString := sCEntroCod;

     qryTesourariaPlanoContas.AsString := sConta;

end;

procedure Tfrm_Tesouraria_Planilha.sbAtualizarClick(Sender: TObject);
begin
   Filtra();
end;

procedure Tfrm_Tesouraria_Planilha.sbFecharClick(Sender: TObject);
begin
   // Fechar o formulário 
   qryTesouraria.Close();
   Close();
end;

Procedure Tfrm_Tesouraria_Planilha.Filtra();
const
   SQL_FIL_DT_MOV = 'T.DT_MOVIMENTO >= :DT_MOVIMENTO AND T.DT_MOVIMENTO <= :DT_MOVIMENTO_FIM';
   SQL_FIL_DT_MOV_ORACLE = 'T.DT_MOVIMENTO >= TO_DATE(:DT_MOVIMENTO, ''YYYY-MM-DD'') AND T.DT_MOVIMENTO <= TO_DATE(:DT_MOVIMENTO_FIM, ''YYYY-MM-DD'')';
   SQL_FIL_ABERTURA = 'T.CD_ABERTURA_CAIXA = :CD_ABERTURA_CAIXA';
   SQL_PADRAO =
      'SELECT '+
         'M.DS_MOEDA,'+
         'M.DS_SIGLA,'+
         'T.CD_MOVIMENTO_TE,'+
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
         'CP.CD_TITULO_PRINCIPAL,'+
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
         'END desChCaixa, '+
         'US.NM_PESSOA nm_usuario ' +
      'FROM '+
         'FIN_MOV_TESOURARIA T '+
            'LEFT JOIN FIN_MOEDAS M ON '+
               '(T.CD_MOEDA = M.CD_MOEDA) '+
            'LEFT JOIN FIN_CHEQUES C ON '+
               '(T.CD_CHEQUE = C.CD_CHEQUE) '+
               'LEFT JOIN FIN_CADASTRO_CONTAS CC ON '+
                  '(C.CD_CAIXA = CC.CD_CAIXA) AND ' +
                  ' (T.CD_COLIGADA = CC.CD_COLIGADA) ' +
               'LEFT JOIN SITUACOES S ON '+
                  '(C.CD_SITUACAO = S.CD_SITUACAO) AND '+
                  '(S.CD_MODULO = 2050) '+
               'LEFT JOIN FIN_CONTAS_PAGAR CP ON ' +
                  '(CP.CD_TITULO = T.CD_TITULO AND CP.CD_COLIGADA = T.CD_COLIGADA) '+
               'LEFT JOIN PESSOAS PE ON (PE.CD_PESSOA = CP.CD_PESSOA) '+
               'LEFT JOIN PESSOAS US ON (US.CD_PESSOA = T.CD_USUARIO) '+
      'WHERE '+
         'T.CD_CAIXA = :CD_CAIXA AND ' +
         'T.CD_COLIGADA = :CD_COLIGADA AND '+
         '%s ';
var
   LSFiltro: string;
   posicao : TBookmark;
begin
   FreeAndNil(FListaSaldos);
   FreeAndNil(FListaSaldosComp);

   FListaSaldos := TStringList.Create();
   FListaSaldosComp := TStringList.Create();
   FListaSaldosOrdem := TStringList.Create();
   FListaSaldosCompOrdem := TStringList.Create();

   if intCodAbertura = 0 then // Conta Banco
   begin
      pnBanco.Visible := True;
      pnCaixa.Visible := False;
   end
   else
   begin
      pnBanco.Visible := False;
      pnCaixa.Visible := True;
   end;

   posicao := nil;
   if qryTesouraria.Active then
   begin
      posicao := qryTesouraria.GetBookmark();
   end;

   qryTesouraria.AutoCalcFields := false;
   qryTesouraria.Close;
   
   if intCodAbertura > 0 then
      LSFiltro := SQL_FIL_ABERTURA
   else begin
      if ( DM.db.Protocol = DB_PROTOCOL_ORACLE ) then
         LSFiltro := SQL_FIL_DT_MOV_ORACLE
      else
         LSFiltro := SQL_FIL_DT_MOV;
   end;
   qryTesouraria.SQL.Text := Format(SQL_PADRAO, [LSFiltro]);
   qryTesouraria.ParamByName('CD_CAIXA').AsInteger := intCodCaixa;
   qryTesouraria.ParamByName('CD_COLIGADA').AsInteger := Self.cd_coligada_caixa;

   if qryTesouraria.Params.FindParam('CD_ABERTURA_CAIXA') <> nil then
      qryTesouraria.ParamByName('CD_ABERTURA_CAIXA').AsInteger := intCodAbertura
   else begin
      qryTesouraria.ParamByName('DT_MOVIMENTO').AsString := DateToStr(umdtDataInicial.Date, DM.fsDateTimeFormatPadrao);
      qryTesouraria.ParamByName('DT_MOVIMENTO_FIM').AsString := DateToStr(umdtDataFinal.Date, DM.fsDateTimeFormatPadrao);
   end;
   qryTesouraria.Open;

  if (posicao <> nil) and (qryTesouraria.BookmarkValid(posicao)) then
  begin
     qryTesouraria.GotoBookmark(posicao);
  end;

End;

procedure Tfrm_Tesouraria_Planilha.filtraSelecionada(cd_caixa,
  cd_abertura_caixa, cd_coligada, cd_movimento_te: Integer);
const
     SQL_TESOURARIA_PADRAO = '  '+
      'SELECT '+
         'M.DS_MOEDA,'+
         'M.DS_SIGLA,'+
         'T.CD_MOVIMENTO_TE,'+
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
         'CP.CD_TITULO_PRINCIPAL,'+
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
         'END desChCaixa, '+
         'US.NM_PESSOA nm_usuario ' +
      'FROM '+
         'FIN_MOV_TESOURARIA T '+
            'LEFT JOIN FIN_MOEDAS M ON '+
               '(T.CD_MOEDA = M.CD_MOEDA) '+
            'LEFT JOIN FIN_CHEQUES C ON '+
               '(T.CD_CHEQUE = C.CD_CHEQUE) '+
               'LEFT JOIN FIN_CADASTRO_CONTAS CC ON '+
                  '(C.CD_CAIXA = CC.CD_CAIXA) AND ' +
                  ' (T.CD_COLIGADA = CC.CD_COLIGADA) ' +
               'LEFT JOIN SITUACOES S ON '+
                  '(C.CD_SITUACAO = S.CD_SITUACAO) AND '+
                  '(S.CD_MODULO = 2050) '+
               'LEFT JOIN FIN_CONTAS_PAGAR CP ON ' +
                  '(CP.CD_TITULO = T.CD_TITULO AND CP.CD_COLIGADA = T.CD_COLIGADA) '+
               'LEFT JOIN PESSOAS PE ON (PE.CD_PESSOA = CP.CD_PESSOA) '+
               'LEFT JOIN PESSOAS US ON (US.CD_PESSOA = T.CD_USUARIO) '+
      'WHERE '+
         'T.CD_CAIXA = :CD_CAIXA AND ' +
         'T.CD_MOVIMENTO_TE = :CD_MOVIMENTO_TE';
begin

   qryTesouraria.Close;

   qryTesouraria.SQL.Text := SQL_TESOURARIA_PADRAO;

   qryTesouraria.ParamByName('cd_caixa').asInteger := cd_caixa;
   qryTesouraria.ParamByName('cd_movimento_te').asInteger := cd_movimento_te;

   qryTesouraria.Open;
   
end;

procedure Tfrm_Tesouraria_Planilha.sbReceberClick(Sender: TObject);
begin
  // Receber / Crédito

  if not DM.UsuarioLogado.TemPermissao( iModuloPadrao, npIncluir, True ) then Exit;

  Application.CreateForm( Tfrm_Tesouraria_Gerar, frm_Tesouraria_Gerar );

  frm_Tesouraria_Gerar.recebendo := true;

  frm_Tesouraria_gerar.qyPlano_Contas.Close();
  frm_Tesouraria_gerar.qyPlano_Contas.SQL.Text:=
  'SELECT                        '+
  '   *                          '+
  'FROM                          '+
  '   fin_config_plano_contas           '+
  'WHERE                         '+
  '   tp_conta = 1 AND           '+
  '   cd_coligada_matriz = :cd_coligada_matriz '+
  '   AND sn_ativo = 1           '+
  '   AND tp_entrada_saida IN (0,1)'+
  'ORDER BY                      '+
  '   ds_conta                   ';

  frm_Tesouraria_gerar.qyPlano_Contas.Open();

  frm_Tesouraria_gerar.cd_coligada_selecionada := Self.cd_coligada_caixa;

  frm_Tesouraria_gerar.apresentarConfirmarIncluir := True;

  frm_tesouraria_gerar.GeraMovimentacao(1, intCodCaixa , 3, frm_Tesouraria_gerar.cd_coligada_selecionada);
  filtra();
end;

procedure Tfrm_Tesouraria_Planilha.dtpDataInicialChange(Sender: TObject);
begin
  Filtra();
end;

procedure Tfrm_Tesouraria_Planilha.dtpDataInicioChange(Sender: TObject);
Var
   DataFim : TDateTime;
   dia, mes, ano : Word;
   diaf, mesf, anof : Word;
begin
  // Ao mudar a data inicial, configurar de forma automática a data final para o
  // último dia do mês da data inicial
  DecodeDate(umdtDataInicial.Date, ano, mes, dia);
  DecodeDate(umdtDataFinal.Date, anof, mesf, diaf);

  // Somente se mudar o mês, senão, manter a data final filtrada como está
  if (anof <> ano) OR (mesf <> mes) then begin
      DataFim := DataValida(ano, mes, 31);
      umdtDataFinal.Date := DataFim;
  end else begin
      if umdtDataInicial.Date > umdtDataFinal.Date then begin
         umdtDataFinal.Date := umdtDataInicial.Date;
      end;

  end;
  
end;

procedure Tfrm_Tesouraria_Planilha.sbPagarClick(Sender: TObject);
begin
  // Pagar / Débito
  
  if not DM.UsuarioLogado.TemPermissao(iModuloPadrao, npIncluir, True ) then Exit;

  Application.CreateForm( Tfrm_Tesouraria_Gerar, frm_Tesouraria_Gerar );

  frm_Tesouraria_Gerar.recebendo := false;

  frm_Tesouraria_gerar.qyPlano_Contas.Close();
  frm_Tesouraria_gerar.qyPlano_Contas.SQL.Text:=
  'SELECT                        '+
  '   *                          '+
  'FROM                          '+
  '   fin_config_plano_contas           '+
  'WHERE                         '+
  '   tp_conta = 1 AND           '+
  '   cd_coligada_matriz = :cd_coligada_matriz '+
  '   AND sn_ativo = 1           '+
  '   AND tp_entrada_saida IN (0,2) '+
  'ORDER BY                      '+
  '   ds_conta                   ';

  frm_Tesouraria_gerar.qyPlano_Contas.Open();

  frm_Tesouraria_gerar.cd_coligada_selecionada := Self.cd_coligada_caixa;

  frm_Tesouraria_gerar.apresentarConfirmarIncluir := True;

  frm_tesouraria_gerar.GeraMovimentacao(2, intCodCaixa , 3, frm_Tesouraria_gerar.cd_coligada_selecionada);

  filtra();
end;

procedure Tfrm_Tesouraria_Planilha.atualizar_totais;
const
   SQL_FIL_ABERTURA = 'CD_ABERTURA_CAIXA = :CD_ABERTURA_CAIXA';
   SQL_FIL_DT_MOV = 'DT_MOVIMENTO >= :DT_MOVIMENTO AND DT_MOVIMENTO <= :DT_MOVIMENTO_FIM';
   SQL_SELECT_TOTAIS =
      'SELECT '+
         'TP_ENTRADA_SAIDA,'+
         'SUM(VL_MOVIMENTO) SOMA,'+
         'SUM(VL_DINHEIRO) DINHEIRO,'+
         'SUM(VL_CHEQUE) CHEQUE '+
      'FROM '+
         'FIN_MOV_TESOURARIA '+
      'WHERE '+
         'CD_CAIXA = :CD_CAIXA AND '+
         'CD_COLIGADA = :CD_COLIGADA AND '+
         '%s '+
      'GROUP BY '+
         'TP_ENTRADA_SAIDA '+
      'ORDER BY '+
         'TP_ENTRADA_SAIDA';
var
   LSFiltro: string;
  movimento : Array [1..2] of rMovimento;
  SaldoAcumulado : Double;
  SaldoCompensa  : Double;
begin

   if intCodAbertura = 0 then
   begin
      qrySelectSaldo.Close;
      qrySelectSaldo.ParamByName('CD_CAIXA').AsInteger := intCodCaixa;
      qrySelectSaldo.ParamByName('CD_COLIGADA').AsInteger := Self.cd_coligada_caixa;
      qrySelectSaldo.ParamByName('DT_BASE').AsDate := umdtDataInicial.Date;
      qrySelectSaldo.Open;
      SaldoAcumulado := qrySelectSaldoSALDO.AsFloat;
      qrySelectSaldo.Close;

      qrySelectSaldoComp.Close;
      qrySelectSaldoComp.ParamByName('CD_CAIXA').AsInteger := intCodCaixa;
      qrySelectSaldoComp.ParamByName('CD_COLIGADA').AsInteger := Self.cd_coligada_caixa;
      qrySelectSaldoComp.ParamByName('DT_BASE').AsDate := umdtDataInicial.Date;
      qrySelectSaldoComp.Open;
      SaldoCompensa := qrySelectSaldoCompSALDO.AsFloat;

   end else // Conta Caixa
   begin

     qyTotais.Close();
     qyTotais.SQL.Text :=
       ' SELECT co.vl_saldo_abertura  ' +
       '   FROM fin_controle_caixa co ' +
       '  WHERE co.cd_abertura_caixa = ' + IntToStr(intCodAbertura);
     qyTotais.Open();

     SaldoAcumulado := qyTotais.FieldByName('vl_saldo_abertura').AsFloat;
     SaldoCompensa := qyTotais.FieldByName('vl_saldo_abertura').AsFloat;

   end;

   // Apresentar o Saldo Anterior
   pnSaldo.Caption := 'Saldo Anterior:  ' + FloatToStrF(SaldoAcumulado, ffNumber, 12, 2) + ' | Compensado: ' + FloatToStrF(SaldoCompensa, ffNumber, 12, 2);

   qryTesouraria.DisableControls();
   qryTesouraria.First();
   qryTesouraria.FetchAll();

   FListaSaldos.Clear();
   FListaSaldos.Clear();

   while not qryTesouraria.EOF do begin

      if qryTesourariatp_entrada_saida.AsInteger = 1 then begin
         SaldoAcumulado := SaldoAcumulado + qryTesourariavl_movimento.AsCurrency;
      end else begin
         SaldoAcumulado := SaldoAcumulado - qryTesourariavl_movimento.AsCurrency;
      end;

      if qryTesourariasn_compensado.AsInteger = 1 then begin

        if qryTesourariatp_entrada_saida.AsInteger = 1 then begin
           SaldoCompensa := SaldoCompensa + qryTesourariavl_movimento.AsCurrency;
        end else begin
           SaldoCompensa := SaldoCompensa - qryTesourariavl_movimento.AsCurrency;
        end;
        FListaSaldosCompOrdem.Add(qryTesourariacd_movimento_te.AsString + '=' + FloatToStr(SaldoCompensa));
        FListaSaldosComp.Add(qryTesourariacd_movimento_te.AsString + '=' + FloatToStrF(SaldoCompensa, ffNumber, 15, 2));

      end else begin
        FListaSaldosCompOrdem.Add(qryTesourariacd_movimento_te.AsString + '=');
        FListaSaldosComp.Add(qryTesourariacd_movimento_te.AsString + '= ');

      end;
      FListaSaldosOrdem.Add( qryTesourariacd_movimento_te.AsString + '=' +FloatToStr(SaldoAcumulado)  );
      FListaSaldos.Add(qryTesourariacd_movimento_te.AsString + '=' + FloatToStrF(SaldoAcumulado, ffNumber, 15, 2));

      qryTesouraria.Next();
   end;

   qryTesouraria.EnableControls();
//   qryTesouraria.OnCalcFields := qryTesourariaCalcFields;
   qryTesouraria.AutoCalcFields := true;
   qryTesouraria.First();

   // Fim do carrega saldos.

   // Atualizar Totais
   
   // zerar variáveis
   movimento[1].Valor := 0;
   movimento[1].Dinheiro := 0;
   movimento[1].Cheque := 0;
   movimento[2].Valor := 0;
   movimento[2].Dinheiro := 0;
   movimento[2].Cheque := 0;

   // buscar totais que estão aparecendo na planilha
   qyTotais.Close;
   if intCodAbertura > 0 then
      LSFiltro := SQL_FIL_ABERTURA
   else
      LSFiltro := SQL_FIL_DT_MOV;
   qyTotais.SQL.Text := Format(SQL_SELECT_TOTAIS, [LSFiltro]);
   qyTotais.ParamByName('CD_CAIXA').AsInteger := intCodCaixa;
   qyTotais.ParamByName('CD_COLIGADA').AsInteger := Self.cd_coligada_caixa;
   if qyTotais.Params.FindParam('CD_ABERTURA_CAIXA') <> nil then
      qyTotais.ParamByName('CD_ABERTURA_CAIXA').AsInteger := intCodAbertura
   else begin
      qyTotais.ParamByName('DT_MOVIMENTO').AsDate := umdtDataInicial.Date;
      qyTotais.ParamByName('DT_MOVIMENTO_FIM').AsDate := umdtDataFinal.Date;
   end;

   qyTotais.Open;

   while not qyTotais.Eof do
   begin
       movimento[qyTotais.FieldByName('tp_entrada_saida').AsInteger].Valor  := qyTotais.FieldByName('soma').AsCurrency;
       movimento[qyTotais.FieldByName('tp_entrada_saida').AsInteger].Cheque   := qyTotais.FieldByName('cheque').AsCurrency;
       movimento[qyTotais.FieldByName('tp_entrada_saida').AsInteger].Dinheiro := qyTotais.FieldByName('dinheiro').AsCurrency;
       qyTotais.Next();
   end;

   lbEntradas.Caption := FloatToStrF(movimento[1].Valor, ffNumber, 12, 2);
   lblEntradasDinheiro.Caption := FloatToStrF(movimento[1].Dinheiro, ffNumber, 12, 2);
   lblEntradasCheque.Caption := FloatToStrF(movimento[1].Cheque, ffNumber, 12, 2);

   lbSaidas.Caption := FloatToStrF(movimento[2].Valor, ffNumber, 12, 2);
   lblSaidasDinheiro.Caption := FloatToStrF(movimento[2].Dinheiro, ffNumber, 12, 2);
   lblSaidasCheques.Caption := FloatToStrF(movimento[2].Cheque, ffNumber, 12, 2);

   // Total
   lbTotal.Caption := FloatToStrF(movimento[1].Valor - movimento[2].Valor, ffNumber, 12, 2);
   lbTotalDinheiro.Caption := FloatToStrF(movimento[1].Dinheiro - movimento[2].Dinheiro, ffNumber, 12, 2);
   lbTotalCheque.Caption := FloatToStrF(movimento[1].Cheque - movimento[2].Cheque, ffNumber, 12, 2);

end;

procedure Tfrm_Tesouraria_Planilha.btnEstornarClick(Sender: TObject);
var
   tpEntradaSaida : Word;
   CodEstorno : Integer;
begin
  if not DM.UsuarioLogado.TemPermissao( iModuloPadrao, npAlterar, True ) then Exit;

  // é uma mensalidade, deve ser estorna pela Plan. Mensalidades
  if qryTesourariacd_mensalidade.AsInteger > 0 then begin
     Mensagem('Esta mensalidade deve ser estornada pela Planilha de Mensalidades.', 'Atenção', MB_OK + MB_ICONWARNING);
     exit;
  end;

  if qryTesourariacd_titulo.AsInteger > 0 then begin
     Mensagem('Este título deve ser estornado pela Planilha de Compromissos.', 'Atenção', MB_OK + MB_ICONWARNING);
     Exit;
  end;

  // Verificar se veio da preparação

  // Bloqueio de Data;
  if DM.EstaBloqueado(qryTesourariadt_movimento.AsDateTime, true) then Exit;


  DM.qyAux2.Close();
  DM.qyAux2.SQL.Text := ' SELECT Count(*) resultado FROM fin_cp_preparacao ' +
   ' WHERE cd_movimento_te = ' + qryTesourariacd_movimento_te.AsString +
   '   AND cd_coligada = ' + qryTesourariacd_coligada.AsString;
  DM.qyAux2.Open();

  if DM.qyAux2.FieldByName('resultado').AsInteger > 0 then begin
     Mensagem('Este título deve ser estornado pela tela de Pagamentos Preparados.', 'Atenção', MB_OK + MB_ICONWARNING);  
  end;



  // Verificar se a ação permite um estorno
  CodEstorno := RetornarCodigoEstorno(qryTesouraria.FieldByName('cd_acao').AsInteger, tpEntradaSaida );

  if CodEstorno < 0 then begin
     Mensagem('Não é possível estornar este movimento. Nenhuma ação de estorno configurada.', 'Atenção', MB_OK + MB_ICONWARNING);
     Exit;
  end;

  if qryTesourarianr_estorno.AsInteger > 0 then begin
     Mensagem('Este movimento ja foi estornado.', 'Atenção', MB_OK + MB_ICONWARNING);
     Exit;
  end;

  Application.CreateForm( Tfrm_Tesouraria_Gerar, frm_Tesouraria_Gerar );

  frm_tesouraria_gerar.tipoEstado := Estornar;
  frm_tesouraria_gerar.CodigoAcao := CodEstorno;
  frm_tesouraria_gerar.Historico := 'ESTORNO ' + qryTesourariads_movimento.AsString;
  frm_tesouraria_gerar.NroDocumento := qryTesourarianr_documento.AsString;
  frm_tesouraria_gerar.NumeroCheque := qryTesourarianr_cheque.AsString;
  frm_tesouraria_gerar.ValorDinheiro := qryTesourariavl_dinheiro.AsCurrency;
  frm_tesouraria_gerar.ValorCheque   := qryTesourariavl_cheque.AsCurrency;
  frm_tesouraria_gerar.DataLiberacao := qryTesourariadt_liberacao.AsDateTime;
  frm_tesouraria_gerar.CodigoMovimento:= qryTesourariacd_movimento_te.AsInteger;
  frm_tesouraria_gerar.DataLancamento := qryTesourariadt_movimento.AsDateTime;
  frm_Tesouraria_gerar.cd_coligada_selecionada := qryTesourariaCD_COLIGADA.AsInteger;
  frm_Tesouraria_gerar.bloqueia_coligadas := true;

  frm_tesouraria_gerar.GeraMovimentacao(tpEntradaSaida, intCodCaixa , 3, qryTesourariaCD_COLIGADA.AsInteger);

  filtra();

end;

procedure Tfrm_Tesouraria_Planilha.btnImprimirClick(Sender: TObject);
var
  sFiltro : string;
  sFiltroShow : String;
  slFormulas: TStringList;
  sNomeRelatorio: String;
   PodeExportar: Boolean;
   infoRelatorio: ClasseRegistros;
begin
   // 
   sFiltro := '{fin_mov_tesouraria.cd_movimento_te} = ' + qryTesourariacd_movimento_te.AsString;

   sFiltroShow := sFiltroShow + '"CÓD. MOVIMENTO = ' + qryTesourariacd_movimento_te.AsString + '" ';

   slFormulas := TStringList.Create();
   slFormulas.Add('ds_filtro=' + sFiltroShow);

   infoRelatorio := PrincipalForm.GetInfoRpt('repReciboTesouraria');

   sNomeRelatorio := infoRelatorio.Campo['nm_arquivo']+'.rpt';

   PodeExportar := True;
   if infoRelatorio.Campo['sn_pode_exportar'] = 0 then
      PodeExportar := False;
      
   PrincipalForm.ImprimeRpt(Self, sNomeRelatorio, -1, sFiltro, '', slFormulas, nil, nil, nil, True, False, nil, PodeExportar);
end;

procedure Tfrm_Tesouraria_Planilha.FormCreate(Sender: TObject);
begin
   umdtDataInicial.Date := Date;
   umdtDataFinal.Date := Date;

   sOrdem := 't.dt_movimento, t.tp_entrada_saida';

   DM.MontarPlanilha(grd, 'planilha_tesouraria_campos');

end;

procedure Tfrm_Tesouraria_Planilha.MontaComboCaixa;
begin
end;

function Tfrm_Tesouraria_Planilha.RetornarCodigoEstorno( CodAcao : Integer;
     Var tpEntradaSaida : Word ) : Integer;
var
   qyEstorno : TUMZQuery;
   CodRetorno : Integer;
begin

   DM.CriarConsulta(qyEstorno);

   qyEstorno.SQL.Clear();
   qyEstorno.SQL.Add(
   ' SELECT                                        ' +
   '    cd_movimento_estorno, tp_entrada_saida     ' +
   ' FROM                                          ' +
   '    fin_acoes_movimento                        ' +
   ' WHERE                                         ' +
   '    cd_acao = ' +  IntToStr(CodAcao)           );

   qyEstorno.Open();

   if qyEstorno.Eof then begin
      tpEntradaSaida := 0;
      result := -1;
   end
   else begin
      CodRetorno := qyEstorno.FieldByName('cd_movimento_estorno').AsInteger;

      // Pegar o Tipo, Entrada/Saida do Retorno
      qyEstorno.Close;
      qyEstorno.SQL.Clear;
      qyEstorno.SQL.Add(
      ' SELECT                                        ' +
      '    cd_movimento_estorno, tp_entrada_saida     ' +
      ' FROM                                          ' +
      '    fin_acoes_movimento                        ' +
      ' WHERE                                         ' +
      '    cd_acao = ' +  IntToStr(CodRetorno)        );

      qyEstorno.Open();

      tpEntradaSaida := qyEstorno.FieldByName('tp_entrada_saida').AsInteger;
      result := CodRetorno;
   end;

   FreeAndNil(qyEstorno);

   Exit;

end;

procedure Tfrm_Tesouraria_Planilha.btnCompensarClick(Sender: TObject);
var
   qyCompensar : TUMZQuery;
   n : integer;
   DataAtualizaSaldo : TDateTime;
   sChave : String;
begin

   // Compensação manual dos lançamentos

   Application.CreateForm(TfrmTesourariaCompensar, frmTesourariaCompensar);

   DataAtualizaSaldo := DataHoje;

   for n := 0 to grd.SelectedRows.Count - 1 do begin

      grd.DataSource.DataSet.GotoBookmark(Pointer(grd.SelectedRows.Items[n]));

      if TSpeedButton(Sender).Tag = 1 then begin // Está querendo compensar

         if (qryTesourariasn_compensado.AsInteger = 1) AND (grd.SelectedRows.Count = 1 ) then begin // Ja está compensado?
            Mensagem('O movimento selecionado ja está compensado.', 'Atenção', MB_OK + MB_ICONWARNING);
            Exit;
         end

      end
      else begin // Está querendo cancelar a compensação

         if (qryTesourariasn_compensado.AsInteger = 0) AND (grd.SelectedRows.Count = 1 ) then begin // Ja está compensado?
            Mensagem('O movimento selecionado não está compensado.', 'Atenção', MB_OK + MB_ICONWARNING);
            Exit;
         end
         else begin
            if Mensagem('Deseja cancelar a compensação do Código Movimento '+ qryTesourariacd_movimento_te.AsString + '?', 'Confirmação', MB_YESNO + MB_ICONQUESTION) <> mrYes then
               Exit;
         end;

      end;

      // Executar o cancelamento ou compensação da movimentação
      try
         DM.CriarConsulta(qyCompensar);

         qyCompensar.SQL.Text :=
            ' UPDATE fin_mov_tesouraria SET sn_compensado = ' + IntToStr(TSpeedButton(Sender).Tag) +
            ' , dt_compensacao = :DtCompensa, vl_saldo_compensado = :vlSaldo ' +
            ' WHERE cd_movimento_te = ' + qryTesourariacd_movimento_te.AsString + ' AND cd_coligada = ' + qryTesourariacd_coligada.AsString;

         sChave := qryTesourariacd_movimento_te.AsString + ';';
         sChave := sChave + qryTesourariacd_coligada.AsString + ';';
         sChave := sChave + qryTesourariacd_caixa.AsString;

         if TSpeedButton(Sender).Tag = 1 then begin
            // Compensar

            frmTesourariaCompensar.edCodMov.Text := qryTesourariacd_movimento_te.AsString;
            frmTesourariaCompensar.edNumDoc.Text := qryTesourarianr_documento.AsString;
            frmTesourariaCompensar.edNumChe.Text := qryTesourarianr_cheque.AsString;

            if n <= 0 then
               frmTesourariaCompensar.umdtCompensar.Date := DM.DataAtual;

            if frmTesourariaCompensar.ShowModal = mrOk then begin

               if frmTesourariaCompensar.umdtCompensar.Date <= DataAtualizaSaldo then
                  DataAtualizaSaldo := frmTesourariaCompensar.umdtCompensar.Date;

               qyCompensar.ParamByName('DtCompensa').AsDate := frmTesourariaCompensar.umdtCompensar.Date;
               qyCompensar.ParamByName('vlSaldo').Clear;

               qyCompensar.ExecSQL();

               // Gravar Log

               DM.setLog(iModuloPadrao, 'Alteracao', sChave, Self.cd_coligada_caixa, 'Compensou o movimento "' + qryTesourariacd_movimento_te.AsString + '" da conta "' + qryTesourariacd_caixa.AsString + '"' );

            end;

         end
         else begin
            // Descompensou
            if qryTesourariadt_compensacao.AsDateTime <= DataAtualizaSaldo then
               DataAtualizaSaldo := qryTesourariadt_compensacao.AsDateTime;

            qyCompensar.ParamByName('DtCompensa').Clear;
            qyCompensar.ParamByName('vlSaldo').Clear;
            qyCompensar.ExecSQL();

            DM.setLog(iModuloPadrao, 'Alteracao', sChave, Self.cd_coligada_caixa, 'Estornou a compensação o movimento "' + qryTesourariacd_movimento_te.AsString + '" da conta "' + qryTesourariacd_caixa.AsString + '"' );
         end;

      finally
         FreeAndNil(qyCompensar);
      end;
   end;

   // Corrigir os Saldos

   FreeAndNil(frmTesourariaCompensar);

   Filtra();

end;

procedure Tfrm_Tesouraria_Planilha.qryTesourariasn_compensadoGetText(
  Sender: TField; var Text: string; DisplayText: Boolean);
begin

   if Sender.AsInteger = 1 then begin
      Text := 'X'
   end
   else begin
     Text := ' ';
   end;

end;

procedure Tfrm_Tesouraria_Planilha.grdDblClick(Sender: TObject);
begin
   if ( frmTesourariaEstorno =  nil) then
   begin
     Application.CreateForm(TfrmTesourariaEstorno, frmTesourariaEstorno);
   end;
   frmTesourariaEstorno.qryEstorno.Close;
   frmTesourariaEstorno.qryEstorno.ParamByName('cd_movimento_te').AsInteger := qryTesourariaCD_MOVIMENTO_TE.AsInteger;
   frmTesourariaEstorno.qryEstorno.open;
   if( frmTesourariaEstorno.qryEstorno.RecordCount <> 0 ) then
   begin

     frmTesourariaEstorno.Show;
   end;
end;

procedure Tfrm_Tesouraria_Planilha.grdKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
var
  qyEstorno : TUMZQuery;
  sAux : String;
  bPodeEstornar : Boolean;
  mv : TMovimento;
  tpConta : Word;
  iAbertura : Integer;
begin

   if ( Key = VK_DELETE ) and ( Shift = [ssCtrl, ssShift] ) then Begin

      if not DM.UsuarioLogado.TemPermissao( 2059, npExcluir, True ) then Exit;

      // Bloqueio de Data;
      if DM.EstaBloqueado(qryTesourariadt_movimento.AsDateTime, true) then Exit;

      if (not bEstornar) then Exit;

      DM.CriarConsulta(qyEstorno);

      // Verificar se trata-se de baixa de mensalidade não estornadas

      if (qryTesourariacd_mensalidade.AsInteger > 0) AND (qryTesourarianr_estorno.AsInteger = 0) AND (qryTesourariacd_acao.AsInteger <> 18) then begin

         sAux := 'Atenção: ' + CHR(13) + CHR(13);
         sAux := sAux + 'Você está tentando excluir a entrada de um título do contas a receber.'+ CHR(13) + CHR(13);
         sAux := sAux + 'Você deve primeiro estornar o título pela Planilha de Recebimentos. ';

         Mensagem(sAux, 'UNIMESTRE', MB_OK + MB_ICONWARNING);
         Exit;
      end;

      // Verificar se trata-se de baixa de compromissos não estornadas

      if (qryTesourariacd_titulo.AsInteger > 0) AND (qryTesourarianr_estorno.AsInteger = 0) AND (qryTesourariacd_acao.AsInteger <> 18) then begin

         sAux := 'Atenção: ' + CHR(13) + CHR(13);
         sAux := sAux + 'Você está tentando excluir a saída de um título do contas a pagar.'+ CHR(13) + CHR(13);
         sAux := sAux + 'Você deve primeiro estornar o título pela Planilha de Compromissos. ';

         Mensagem(sAux, 'UNIMESTRE', MB_OK + MB_ICONWARNING);
         Exit;
      end;

      // Verificar se o movimento que está sendo excluido pode ser de preparação de compromisso.

      qyEstorno.Close();
      qyEstorno.SQL.Text :=
            ' SELECT COUNT(*) as resultado from fin_mov_cp ' +
            '  WHERE cd_movimento_te = ' + qryTesourariaCD_MOVIMENTO_TE.AsString;
      qyEstorno.Open();

      if (qyEstorno.FieldByName('resultado').AsInteger > 0) AND  (qryTesourariacd_titulo.AsInteger = 0) AND (qryTesourarianr_estorno.AsInteger = 0) AND (qryTesourariacd_acao.AsInteger <> 18) then begin

         sAux := 'Atenção: ' + CHR(13) + CHR(13);
         sAux := sAux + 'Você está tentando excluir a saída de um ou mais títulos do contas a pagar baixados por preparação.'+ CHR(13) + CHR(13);
         sAux := sAux + 'Você deve primeiro estornar a preparação pela Tela de Compromissos >> Pagamentos Preparados. ';

         Mensagem(sAux, 'UNIMESTRE', MB_OK + MB_ICONWARNING);
         Exit;
      end;     


      // Verificar se trata-se de estornos

      if (qryTesourarianr_estorno.AsInteger > 0) then begin

         sAux := 'Atenção: ' + CHR(13) + CHR(13);
         sAux := sAux + 'Você está tentando excluir um lançamento de estorno.'+ CHR(13) + CHR(13);
         sAux := sAux + 'O sistema irá excluir o lançamento origem e o seu estorno para manter a integridade. ';
         sAux := sAux + 'Deseja realmente continuar?';


         if Mensagem(sAux, 'UNIMESTRE', MB_YESNOCANCEL + MB_DEFBUTTON2 + MB_ICONQUESTION) <> mrYes then Exit;

         // Excluir os lançamentos estornados pelo código do estorno

          qyEstorno.Close();

          qyEstorno.SQL.Text:= 'DELETE FROM fin_mov_tesouraria ' +
                           'WHERE nr_estorno = ' + qryTesourarianr_estorno.AsString;
          qyEstorno.ExecSQL();
          FreeAndNil(qyEstorno);

          Dm.setLog(2059,'Exclusão',
                 ''+qryTesourariacd_caixa.AsString+';'+
                  qryTesourariacd_movimento_te.AsString+';'+
                 qryTesourariatp_entrada_saida.AsString+';'+
                 FormatDateTime('yyyy-mm-dd',qryTesourariadt_movimento.AsDateTime)+';',
                 Self.cd_coligada_caixa,
                 'Histórico: '+ qryTesourariads_movimento.AsString + CHR(13) +
                 'Valor: ' + qryTesourariavl_movimento.AsString + CHR(13) +
                 'Estorno: ' + qryTesourarianr_estorno.AsString
                 );
          qryTesouraria.Close();
          qryTesouraria.Open();

          //Já excluir, pode sair
          Exit;

      end;

      // Verificar se está excluindo uma transferencia
      if qryTesourariacd_transfere.AsInteger > 0 then begin

         // Buscar todas as transferencias do Banco

         qyEstorno.Close();
         qyEstorno.SQL.Text :=
            ' select cd_coligada, cd_caixa, cd_abertura_caixa from fin_mov_tesouraria ' +
            '  WHERE cd_transfere = ' + qryTesourariacd_transfere.AsString;
         qyEstorno.Open();

         bPodeEstornar := True;

         mv := TMovimento.create();

         while not qyEstorno.Eof do begin

             if mv.VerificaContaAtiva(qyEstorno.FieldByName('cd_caixa').AsInteger, tpConta, iAbertura, qyEstorno.FieldByName('cd_coligada').AsInteger )
             then begin
                // Verificar se está lançado no caixa aberto ou numa conta banco...
                if not ((tpConta <> 3) OR ( ( iAbertura > 0) AND (iAbertura = qyEstorno.FieldByName('cd_abertura_caixa').AsInteger)) ) then begin
                   bPodeEstornar := false;
                end;
             end;
             qyEstorno.Next();
         end;

         if not bPodeEstornar then begin

            sAux := 'Atenção: ' + CHR(13) + CHR(13);
            sAux := sAux + 'Não é possível excluir esse lançamento de transferência, pois o caixa já foi fechado.'+ CHR(13) + CHR(13);
            sAux := sAux + 'Você deve fazer uma nova transferência para corrigir este lançamento. ';

            Mensagem(sAux, 'UNIMESTRE', MB_OK + MB_ICONWARNING);
            FreeAndNil(qyEstorno);
            Exit;

         end;



         sAux := 'Atenção: ' + CHR(13) + CHR(13);
         sAux := sAux + 'Você está tentando excluir um lançamento de transferência.'+ CHR(13) + CHR(13);
         sAux := sAux + 'O sistema irá excluir o lançamento de Entrada e Saída de valores das contas envolvidas. ';
         sAux := sAux + 'Deseja realmente continuar?';


         if Mensagem(sAux, 'UNIMESTRE', MB_YESNOCANCEL + MB_DEFBUTTON2 + MB_ICONQUESTION) <> mrYes then Exit;

         // Excluir os lançamentos estornados pelo código do estorno

          qyEstorno.Close();

          qyEstorno.SQL.Text:= 'DELETE FROM fin_mov_tesouraria ' +
                           'WHERE cd_transfere = ' + qryTesourariacd_transfere.AsString;
          qyEstorno.ExecSQL();

          FreeAndNil(qyEstorno);

          Dm.setLog(2059,'Exclusão',
                 ''+qryTesourariacd_caixa.AsString+';'+
                  qryTesourariacd_movimento_te.AsString+';'+
                 qryTesourariatp_entrada_saida.AsString+';'+
                 FormatDateTime('yyyy-mm-dd',qryTesourariadt_movimento.AsDateTime)+';',
                 Self.cd_coligada_caixa,
                 'Histórico: '+ qryTesourariads_movimento.AsString + CHR(13) +
                 'Valor: ' + qryTesourariavl_movimento.AsString + CHR(13) +
                 'Transferencia: ' + qryTesourariacd_transfere.AsString
                 );
          qryTesouraria.Close();
          qryTesouraria.Open();

          //Já excluir, pode sair
          Exit;

      
      end;


      // Perguntar se deseja excluir

      sAux := 'Atenção: ' + CHR(13) + CHR(13);
      sAux := sAux + 'Este procedimento irá excluir definitivamente o lançamento selecionado.'+ CHR(13) + CHR(13);
      sAux := sAux + 'Tem certeza que deseja continuar? ';

      if Mensagem(sAux, 'UNIMESTRE', MB_YESNOCANCEL + MB_DEFBUTTON2 + MB_ICONQUESTION) <> mrYes then Exit;


      qyEstorno.Close();

      qyEstorno.SQL.Text:= 'DELETE '+
                           'FROM '+
                           'fin_apropria_te '+
                           'WHERE '+
                           'cd_movimento_te = '+qryTesourariacd_movimento_te.AsString;
      qyEstorno.ExecSQL();

      qyEstorno.Close();

      qyEstorno.SQL.Text:= 'DELETE '+
                           'FROM '+
                           'fin_mov_tesouraria '+
                           'WHERE '+
                           'cd_movimento_te = '+qryTesourariacd_movimento_te.AsString;
      qyEstorno.ExecSQL();

      FreeAndNil(qyEstorno);

      Dm.setLog(2059,'Exclusão',
                 ''+qryTesourariacd_caixa.AsString+';'+
                  qryTesourariacd_movimento_te.AsString+';'+
                 qryTesourariatp_entrada_saida.AsString+';'+
                 FormatDateTime('yyyy-mm-dd',qryTesourariadt_movimento.AsDateTime)+';',
                 Self.cd_coligada_caixa,
                 'Histórico: '+ qryTesourariads_movimento.AsString + CHR(13) +
                 'Valor: ' + qryTesourariavl_movimento.AsString
                 );
      qryTesouraria.Close();
      qryTesouraria.Open();
   end;
end;

procedure Tfrm_Tesouraria_Planilha.grdTitleClick(Column: TColumn);
var
  n : Integer;
  coluna : string;
begin

  // Clicou nos títulos... ordenar
   qryTesouraria.AutoCalcFields := False;
   for n := 0 to grd.Columns.Count - 1 do
   begin
      if Column.FieldName <>  grd.Columns[n].FieldName then
      begin
         grd.Columns[n].Title.Font.Style         := [];
      end;
   end;
   coluna := Column.FieldName;
   //campos calculados
   if coluna = 'ValSaidas' then
   begin
      coluna := 'ValSaidasBanco';
   end
   else if coluna = 'ValEntradas' then
   begin
      coluna := 'ValEntradasBanco';
   end;

   if (sOrdenacao <>  coluna+' ASC')  AND (sOrdenacao <>  coluna+' DESC') then
   begin
      Column.Title.Font.Style          := [fsUnderline];
      sOrdenacao                       := coluna+' ASC';
      qryTesouraria.SortedFields       := coluna+' ASC';
   end
   else if (sOrdenacao <>  coluna+' DESC') AND (sOrdenacao =  coluna+' ASC') then
   begin
      Column.Title.Font.Style          := [fsUnderline];
      sOrdenacao                       := coluna+' DESC';
      qryTesouraria.SortedFields       := coluna+' DESC';
   end
   else
   begin
      sOrdenacao                       := '';
      Column.Title.Font.Style          := [];
      qryTesouraria.SortedFields       := 'dt_movimento, tp_entrada_saida';
      Column.Title.Font.Color          := clWindowText;
   end;
   qryTesouraria.AutoCalcFields := True;

end;

procedure Tfrm_Tesouraria_Planilha.limpaFiltros(Sender: TObject);
begin
   Self.qryTesouraria.Close;
   Self.Filtra;
   Self.FBnLimpaFiltros.Enabled := False;
   Self.FLbFiltro.Visible := False;
end;

procedure Tfrm_Tesouraria_Planilha.sbSelecionarColunaClick(Sender: TObject);
begin
   // Selecionar as colunas
   Application.CreateForm(TfrmSelColunas, frmSelColunas);
   frmSelColunas.SelecionaColunas(grd, 'planilha_tesouraria_campos');
end;

procedure Tfrm_Tesouraria_Planilha.umdtDataFinalChangeDate(Sender: TObject);
begin
      if umdtDataInicial.Date > umdtDataFinal.Date then begin
         umdtDataInicial.Date := umdtDataFinal.Date;
      end;
end;

procedure Tfrm_Tesouraria_Planilha.btnAlterarClick(Sender: TObject);
const
   SMsgCompromisso = 'Esta movimentação possui vínculo com um compromisso. Para realizar alterações utilize a Planilha de Compromissos.';
begin
  if not DM.UsuarioLogado.TemPermissao( iModuloPadrao, npAlterar, True ) then Exit;

   if qryTesourariaCD_TITULO.AsInteger > 0 then
   begin
      Mensagem(SMsgCompromisso, 'Atenção', MB_OK, -1);
   end;

   if qryTesourariaCD_TITULO.AsInteger = 0 then
   begin

      Application.CreateForm( Tfrm_Tesouraria_Gerar, frm_Tesouraria_Gerar );

      // Bloqueio de Data;
      if DM.EstaBloqueado(qryTesourariadt_movimento.AsDateTime, true) then Exit;

      if (qryTesourariacd_acao.AsInteger = 18) OR
         (qryTesourarianr_estorno.AsInteger > 0)
      then
          frm_tesouraria_gerar.tipoEstado := AlterarTransferencia
      else
         if (qryTesourariacd_mensalidade.AsInteger > 0) OR
            (qryTesourariacd_titulo.AsInteger > 0 )
         then
            frm_tesouraria_gerar.tipoEstado := AlteracaoSimplificada
         else
            frm_tesouraria_gerar.tipoEstado := Alterar;



      frm_Tesouraria_gerar.CodigoAcao := qryTesourariacd_acao.AsInteger;
      frm_tesouraria_gerar.Historico := qryTesourariads_movimento.AsString;
      frm_tesouraria_gerar.NroDocumento := qryTesourarianr_documento.AsString;
      frm_tesouraria_gerar.NumeroCheque := qryTesourarianr_cheque.AsString;
      frm_tesouraria_gerar.ValorDinheiro := qryTesourariavl_dinheiro.AsCurrency;
      frm_tesouraria_gerar.ValorCheque   := qryTesourariavl_cheque.AsCurrency;
      frm_tesouraria_gerar.DataLiberacao := qryTesourariadt_liberacao.AsDateTime;
      frm_Tesouraria_gerar.DataLancamento := qryTesourariadt_movimento.AsDateTime;
      frm_tesouraria_gerar.CodigoMovimento := qryTesourariacd_movimento_te.AsInteger;
      frm_Tesouraria_gerar.cd_coligada_selecionada := Self.cd_coligada_caixa;
      frm_Tesouraria_gerar.CodigoMensalidade := qryTesourariacd_mensalidade.AsInteger;
      frm_Tesouraria_gerar.CodigoTransfere := qryTesourariacd_transfere.AsInteger;

      frm_tesouraria_gerar.GeraMovimentacao(qryTesourariatp_entrada_saida.AsInteger, intCodCaixa , 3, frm_Tesouraria_gerar.cd_coligada_selecionada);

      Filtra();
      ExecutaFiltro();
   end;
   
end;

end.

