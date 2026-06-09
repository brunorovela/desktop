unit uControleCartao;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, Grids, DBGrids, ComCtrls, ToolWin, ImgList, DB,
  ZAbstractRODataset, ZAbstractDataset, UZDataset, uDM, Buttons,
  uCamposPlanilhas, uAlterarTaxa, DBClient, Provider, uLiquidaCartao,
  General, uFiltroControleCartao, uEstornarCartao, uCancelarOperacao, RegExpr;

type

  TEstornarParcelas = record
    estornar: Boolean;
    strParcelas: String;
    parcelasEstornadas: TStringList;
  end;

  TAlterarParcela = record
    cdParcela: Integer;
    alterar: Boolean;
    cdOperacao: Integer;
    isLiquidada: Boolean;
  end;

  TfrmControleCartao = class(TForm)
    Panel1: TPanel;
    Panel2: TPanel;
    bgControleCartao: TDBGrid;
    qyControleCartao: TUMZQuery;
    dsControleCartao: TDataSource;
    qyControleCartaods_nome: TStringField;
    qyControleCartaotipo_operacao: TStringField;
    qyControleCartaonr_parcela: TIntegerField;
    qyControleCartaosituacao: TStringField;
    qyControleCartaovl_parcela: TFloatField;
    qyControleCartaonr_taxa: TFloatField;
    qyControleCartaotarifa: TFloatField;
    qyControleCartaovalor_liquido: TFloatField;
    qyControleCartaods_caixa: TStringField;
    qyControleCartaocd_operacao: TIntegerField;
    qyControleCartaoSELECAO: TBooleanField;
    pnRemessaTit: TPanel;
    qyControleCartaocd_parcela: TIntegerField;
    toolPessoa: TToolBar;
    ToolButton6: TToolButton;
    btnMarcar: TSpeedButton;
    btnDesmarcar: TSpeedButton;
    ToolButton8: TToolButton;
    sbSelecionarColuna: TSpeedButton;
    ToolButton10: TToolButton;
    btFiltrar: TToolButton;
    ToolButton1: TToolButton;
    btLiquidar: TToolButton;
    btAlterar: TToolButton;
    ToolButton9: TToolButton;
    btEstornar: TToolButton;
    ToolButton3: TToolButton;
    ToolButton4: TToolButton;
    qyControleCartaocd_admin_cartao: TIntegerField;
    qyControleCartaosn_credito: TSmallintField;
    cdsControleCartao: TClientDataSet;
    dspControleCartao: TDataSetProvider;
    cdsControleCartaods_nome: TStringField;
    cdsControleCartaotipo_operacao: TStringField;
    cdsControleCartaonr_parcela: TIntegerField;
    cdsControleCartaosituacao: TStringField;
    cdsControleCartaovl_parcela: TFloatField;
    cdsControleCartaonr_taxa: TFloatField;
    cdsControleCartaotarifa: TFloatField;
    cdsControleCartaovalor_liquido: TFloatField;
    cdsControleCartaods_caixa: TStringField;
    cdsControleCartaocd_operacao: TIntegerField;
    cdsControleCartaoSELECAO: TBooleanField;
    cdsControleCartaocd_parcela: TIntegerField;
    cdsControleCartaocd_admin_cartao: TIntegerField;
    cdsControleCartaosn_credito: TSmallintField;
    qyControleCartaosn_liquidado: TSmallintField;
    cdsControleCartaosn_liquidado: TSmallintField;
    btFechar: TToolButton;
    pnSeteDias: TPanel;
    qyControleCartaodt_vencimento: TDateField;
    cdsControleCartaodt_vencimento: TDateField;
    btnCancelarOperacao: TToolButton;
    ToolButton5: TToolButton;
    qyControleCartaonm_pessoa: TMemoField;
    qyControleCartaods_tid_cartao: TStringField;
    cdsControleCartaods_tid_cartao: TStringField;
    btn_imprimir: TToolButton;
    ilBotoes: TImageList;
    procedure btn_imprimirClick(Sender: TObject);
    procedure qyControleCartaonm_pessoaGetText(Sender: TField; var Text: string;
      DisplayText: Boolean);
    procedure btnCancelarOperacaoClick(Sender: TObject);
    procedure bgControleCartaoTitleClick(Column: TColumn);
    procedure btFecharClick(Sender: TObject);
    procedure btEstornarClick(Sender: TObject);
    procedure btLiquidarClick(Sender: TObject);
    procedure btFiltrarClick(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure btAlterarClick(Sender: TObject);
    procedure btnDesmarcarClick(Sender: TObject);
    procedure btnMarcarClick(Sender: TObject);
    procedure qyControleCartaoAfterOpen(DataSet: TDataSet);
    procedure bgControleCartaoCellClick(Column: TColumn);
    procedure bgControleCartaoDrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumn; State: TGridDrawState);
    procedure sbSelecionarColunaClick(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    slSelectedReg: TStringList;
    slColoridos: TStringList;
    fieldOrdem,
    sqlFiltrado: String;

    procedure colorirGrid(cdParcela, cdAdministradora, snCredito: Integer);
    procedure desmarcarGrid();
    procedure recarregaParcelas;

    function validaSelecao(cdParcela, cdAdministradora, snCredito: Integer): Boolean;
    function isAlteravel(): TAlterarParcela;
    function isEstornavel(): TEstornarParcelas;
    function validaCancelarOperacao(cd_operacao: Integer): Boolean;
    function get_filtro_relatorio( ds_sql : String ) : String;
    function SQLToCrystalExpressionReplaceExAlias(ARegExpr : TRegExpr): string;
    function SQLToCrystalExpressionReplaceColumnsToInt(ARegExpr : TRegExpr): string;
      procedure PrintReport;
  public
    { Public declarations }
  end;

var
  frmControleCartao: TfrmControleCartao;

implementation

uses
   Main, ClassRegistros, uGeneral, UReportClasses, UReportDataModule;

{$R *.dfm}

procedure TfrmControleCartao.bgControleCartaoCellClick(Column: TColumn);
var
   PG: TPoint;
   GC: TGridCoord;
   podeSelecionar: Boolean;
begin
   if not(qyControleCartao.RecordCount > 0) then
   begin
      Exit;
   end;

   PG := bgControleCartao.ScreenToClient(Mouse.CursorPos);
   GC := bgControleCartao.MouseCoord( PG.X, PG.Y ) ;

   podeSelecionar :=
      validaSelecao(
         qyControleCartaocd_parcela.AsInteger,
         qyControleCartaocd_admin_cartao.AsInteger,
         qyControleCartaosn_credito.AsInteger
      );

   if GC.X = 1 then
   begin
      if (slSelectedReg.Values[qyControleCartaocd_parcela.AsString] = '0') and
         (podeSelecionar) then
      begin
         slSelectedReg.Values[qyControleCartaocd_parcela.AsString] := '1';
         colorirGrid(
            qyControleCartaocd_parcela.AsInteger,
            qyControleCartaocd_admin_cartao.AsInteger,
            qyControleCartaosn_credito.AsInteger
         );    
      end
      else
      begin
         slSelectedReg.Values[qyControleCartaocd_parcela.AsString] := '0';
         desmarcarGrid;
      end;

      bgControleCartao.Repaint();
   end;
end;

procedure TfrmControleCartao.bgControleCartaoDrawColumnCell(Sender: TObject;
  const Rect: TRect; DataCol: Integer; Column: TColumn; State: TGridDrawState);
const IsChecked : array[Boolean] of Integer = 
      (DFCS_BUTTONCHECK, DFCS_BUTTONCHECK or DFCS_CHECKED);  
var
  DrawRect: TRect;
  cor: Integer;
begin
   if (Column.FieldName = 'SELECAO') and (qyControleCartao.RecordCount > 0) then
   begin
      bgControleCartao.Canvas.FillRect(Rect);
      
      if (gdFocused in State) then
      begin
         DrawRect.Left := Rect.Left + 1;
      end
      else
      begin
         DrawRect.Left := Rect.Left + 2;
      end;

      DrawRect.Right := Rect.Right - 2;
      DrawRect.Top := Rect.Top + 2;
      DrawRect.Bottom := Rect.Bottom - 2;

      DrawFrameControl(
         bgControleCartao.Canvas.Handle,
         DrawRect,
         DFC_BUTTON,
         ISChecked[slSelectedReg.values[qyControleCartaocd_parcela.AsString] = '1']
      );
   end;

   if slColoridos.Values[qyControleCartaocd_parcela.AsString] = '1' then
   begin
      bgControleCartao.Canvas.Font.Color := clGrayText;

      Canvas.FillRect(Rect);
      bgControleCartao.DefaultDrawColumnCell(Rect,DataCol,Column,State);
   end;
end;

procedure TfrmControleCartao.bgControleCartaoTitleClick(Column: TColumn);
var
   n : Integer;
begin
   if bgControleCartao.DataSource.DataSet.FieldByName(Column.FieldName).FieldKind <> fkData Then
   begin
      exit;
   end;

   for n:= 0 to bgControleCartao.Columns.Count - 1 do
   begin
      bgControleCartao.Columns[n].Title.Font.Style := [];
   end;

   if (fieldOrdem = Column.FieldName) then
   begin
      fieldOrdem := Column.FieldName + ' DESC ';
   end
   else
   begin
      fieldOrdem := Column.FieldName;
   end;

   Column.Title.Font.Style := [fsUnderline];

   recarregaParcelas;
end;

procedure TfrmControleCartao.btAlterarClick(Sender: TObject);
var
   alterarParcela: TAlterarParcela;
begin
   alterarParcela := isAlteravel;

   if not(alterarParcela.alterar) then Exit;

   Application.CreateForm(TfrmAlterarTaxa, frmAlterarTaxa);

   frmAlterarTaxa.codParcelaAlterar :=
      alterarParcela.cdParcela;

   frmAlterarTaxa.possuiParcelaLiquidada := alterarParcela.isLiquidada;

   if frmAlterarTaxa.alterarTaxa then
   begin
      recarregaParcelas;
   end;

   FreeAndNil(frmAlterarTaxa);
end;

procedure TfrmControleCartao.btEstornarClick(Sender: TObject);
var
   estornarParcelas: TEstornarParcelas;
begin
   estornarParcelas := isEstornavel;

   if not(estornarParcelas.estornar) then Exit;

   Application.CreateForm(TfrmEstornarOperacao, frmEstornarOperacao);

   frmEstornarOperacao.strParcelas := estornarParcelas.strParcelas;
   frmEstornarOperacao.parcelasEstornadas := estornarParcelas.parcelasEstornadas;

   if frmEstornarOperacao.estornarCartao then
   begin
      recarregaParcelas;
   end;

   FreeAndNil(frmEstornarOperacao);
end;

procedure TfrmControleCartao.btFiltrarClick(Sender: TObject);
begin
   if frmFiltroControleCartao = nil then
   begin
      Application.CreateForm(TfrmFiltroControleCartao, frmFiltroControleCartao);
   end;

   if frmFiltroControleCartao.filtraParcelas then
   begin
      sqlFiltrado := frmFiltroControleCartao.SQLFiltro;
      qyControleCartao.DisableControls;
      recarregaParcelas;
      qyControleCartao.EnableControls;
      qyControleCartao.First;
      pnSeteDias.Visible := False;
   end;
end;

function TfrmControleCartao.SQLToCrystalExpressionReplaceExAlias(
  ARegExpr: TRegExpr): string;
var
   alias : TStringList;
begin
   alias := TStringList.Create();
   alias.Values['FCP']  := 'fin_cartao_parcelas';
   alias.Values['FCC']  := 'fin_cadastro_contas';
   alias.Values['M']    := 'mensalidades';
   alias.Values['FCAC'] := 'fin_cadastro_admin_cartao';
   alias.Values['FCM']  := 'fin_cartao_mensalidades';
   alias.Values['P']    := 'pessoas';
   alias.Values['FCO']  := 'fin_cartao_operacao';


   Result := Concat('{', alias.Values[UpperCase(ARegExpr.Match[1])], '.', LowerCase(ARegExpr.Match[2]), '}');
end;

procedure TfrmControleCartao.btLiquidarClick(Sender: TObject);
var
   strParcelas,
   separador,strOperacoes: String;

   cdAdminCartao,
   regSelecionado: Integer;

   abrirTela,
   snCredito,
   sairLoop: Boolean;

   nrParcelas: Integer;

   stParcelas: TStringList;
begin
   abrirTela := False;
   sairLoop := False;
   cdAdminCartao := 0;
   separador := '';
   strParcelas := '';
   nrParcelas := 0;
   strOperacoes := '';

   cdsControleCartao.First;

   stParcelas := TStringList.Create;

   while (not cdsControleCartao.Eof) and not(sairLoop) do
   begin
      if slSelectedReg.Values[cdsControleCartaocd_parcela.AsString] = '1' then
      begin
         if cdsControleCartaosn_liquidado.AsInteger = 1 then
         begin
            sairLoop := True;
         end;

         abrirTela := True;

         strParcelas :=
            strParcelas +
            separador +
            cdsControleCartaocd_parcela.AsString;

         stParcelas.Add(cdsControleCartaocd_parcela.AsString);

         strOperacoes := strOperacoes  + separador + cdsControleCartaocd_operacao.AsString;

         separador := ', ';
         
         inc(nrParcelas);

         cdAdminCartao  := cdsControleCartaocd_admin_cartao.AsInteger;
         snCredito      := cdsControleCartaosn_credito.AsInteger = 1;
      end;

      cdsControleCartao.Next;
   end;

   if sairLoop then
   begin
      Mensagem(
         'Você não pode liquidar parcelas liquidadas.',
         'Aviso',
         MB_OK + MB_ICONWARNING
      );

      Exit;      
   end;

   if not(abrirTela) then
   begin
      Mensagem(
         'Não há nenhuma parcela selecionada.',
         'Aviso',
         MB_OK + MB_ICONWARNING
      );

      Exit;
   end;

   Application.CreateForm(TfrmLiquidar, frmLiquidar);

   frmLiquidar.strParcelas := strParcelas;
   frmLiquidar.qtdParcelas := nrParcelas;
   frmLiquidar.cdAdminCartao := cdAdminCartao;
   frmLiquidar.snCredito := snCredito;
   frmLiquidar.strOperacoes := strOperacoes;
   frmLiquidar.parcelasLiquidadas := stParcelas;

   if frmLiquidar.liquidarTaxas then
   begin
      recarregaParcelas;
   end;

   FreeAndNil(frmLiquidar);
end;

procedure TfrmControleCartao.btnCancelarOperacaoClick(Sender: TObject);
begin
   if not(validaCancelarOperacao(qyControleCartaocd_operacao.AsInteger)) then Exit;

   Application.CreateForm(TfrmCancelarOperacao, frmCancelarOperacao);

   if frmCancelarOperacao.cancelarOperacao(qyControleCartaocd_operacao.AsInteger) then
   begin
      qyControleCartao.Close;
      qyControleCartao.Open;
   end;

   FreeAndNil(frmAlterarTaxa);
end;

procedure TfrmControleCartao.btnDesmarcarClick(Sender: TObject);
var
   cd_parcela: Integer;
begin
   qyControleCartao.DisableControls();

   cd_parcela := qyControleCartaocd_parcela.AsInteger;

   qyControleCartao.First();

   While not qyControleCartao.Eof do
   begin
      slSelectedReg.Values[ qyControleCartaocd_parcela.AsString ] := '0';

      qyControleCartao.Next;
   end;

   bgControleCartao.Repaint();

   qyControleCartao.Locate('cd_parcela', cd_parcela, []);

   desmarcarGrid();
   
   qyControleCartao.EnableControls();
end;

procedure TfrmControleCartao.btFecharClick(Sender: TObject);
begin
   Self.Close;
end;

procedure TfrmControleCartao.btnMarcarClick(Sender: TObject);
begin
   cdsControleCartao.First();

   While not cdsControleCartao.Eof do
   begin
      if (qyControleCartaocd_admin_cartao.AsInteger = cdsControleCartaocd_admin_cartao.AsInteger) and
         (qyControleCartaosn_credito.AsInteger =  cdsControleCartaosn_credito.AsInteger) then
      begin
         slSelectedReg.Values[ cdsControleCartaocd_parcela.AsString ] := '1';
      end;

      cdsControleCartao.Next;
   end;

   colorirGrid(
      qyControleCartaocd_parcela.AsInteger,
      qyControleCartaocd_admin_cartao.AsInteger,
      qyControleCartaosn_credito.AsInteger
   );

   bgControleCartao.Repaint();
end;

function TfrmControleCartao.SQLToCrystalExpressionReplaceColumnsToInt(
  ARegExpr: TRegExpr): string;
var
   campo: String;
   valor: Integer;
   listaCampos: TStringList;
begin
   campo := ARegExpr.Match[1];

   listaCampos := TStringList.Create();
   listaCampos.Add('{fin_cadastro_admin_cartao.cd_admin_cartao}');
   listaCampos.Add('{mensalidades.codigoaluno}');
   listaCampos.Add('{fin_cartao_operacao.cd_caixa}');

   if listaCampos.IndexOf(ARegExpr.Match[1]) <> -1 then
   begin
      if (Trim(ARegExpr.Match[3]) <> '') AND TryStrToInt(ARegExpr.Match[3], valor) then
      begin
         Result := Concat(ARegExpr.Match[1], ARegExpr.Match[2], Trim(ARegExpr.Match[3]));
      end else begin
         Result := Concat(ARegExpr.Match[1], ARegExpr.Match[2], '0');
      end;
   end else begin
      Result := Concat(ARegExpr.Match[1], ARegExpr.Match[2], QuotedStr(ARegExpr.Match[3]));
   end;
end;

procedure TfrmControleCartao.btn_imprimirClick(Sender: TObject);
var
   sNomeRelatorio: String;
   PodeExportar: Boolean;
   infoRelatorio: ClasseRegistros;
   condicaoRelatorio : String;
begin
   if EnableNewReportMenu then
   begin
      PrintReport;
      Exit;
   end;

   infoRelatorio := PrincipalForm.GetInfoRpt('repFin_ControleCartoes');
   sNomeRelatorio := 'repFin_ControleCartoes.rpt';

   condicaoRelatorio := get_filtro_relatorio( sqlFiltrado );
   PodeExportar := True;

   PrincipalForm.ImprimeRpt(
      Self,
      sNomeRelatorio,
      -1,
      condicaoRelatorio,
      '',
      nil,
      nil,
      nil,
      nil,
      True,
      False,
      nil,
      PodeExportar
   );

end;

procedure TfrmControleCartao.colorirGrid(cdParcela, cdAdministradora, snCredito: Integer);
begin
   cdsControleCartao.DisableControls;

   cdsControleCartao.First;

   while not cdsControleCartao.Eof do
   begin
      slColoridos.Values[cdsControleCartaocd_parcela.AsString] := '0';

      if (cdsControleCartaocd_admin_cartao.AsInteger <> cdAdministradora) or
         (cdsControleCartaosn_credito.AsInteger <> snCredito) then
      begin
         slColoridos.Values[cdsControleCartaocd_parcela.AsString] := '1';
      end;

      cdsControleCartao.Next;
   end;

   cdsControleCartao.EnableControls;
end;

procedure TfrmControleCartao.desmarcarGrid;
var
   i: Integer;
   algumRegistroSelecionado: Boolean;
begin
   cdsControleCartao.First;

   algumRegistroSelecionado := False;

   for I := 0 to slSelectedReg.Count - 1 do
   begin
      if slSelectedReg.ValueFromIndex[i] = '1' then
      begin
         algumRegistroSelecionado := True;         
      end;
   end;

   if not(algumRegistroSelecionado) then
   begin
      for I := 0 to slSelectedReg.Count - 1 do
      begin
         slColoridos.ValueFromIndex[i] := '0';
      end;
   end;
end;

procedure TfrmControleCartao.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
   Action := caFree;
end;

procedure TfrmControleCartao.FormDestroy(Sender: TObject);
begin
   frmControleCartao := nil;
end;

procedure TfrmControleCartao.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
   case Key of
      VK_F1:  btFiltrarClick(nil);
      VK_F2:  btLiquidarClick(nil);
      VK_F3:  btAlterarClick(nil);
      VK_F4:  btEstornarClick(nil);
      VK_F6:  btnCancelarOperacaoClick(nil);
      VK_F7:  btn_imprimirClick(nil);
      VK_F12: btFecharClick(nil);
   end;
end;

procedure TfrmControleCartao.FormShow(Sender: TObject);
begin
   slSelectedReg := TStringList.Create;
   slColoridos := TStringList.Create;

   qyControleCartao.Close;
   qyControleCartao.ParamByName('param_coligadas').AsString := DM.GetColigadas();
   qyControleCartao.Open;

   DM.montarPlanilha(bgControleCartao, 'controle_cartao');
end;

function TfrmControleCartao.get_filtro_relatorio(ds_sql: String): String;
var
   regExpr: TRegExpr;
   consultaCondicao : String;
   myYear, myMonth, myDay : Word;
   dia, mes, ano: String;
begin
   regExpr := TRegExpr.Create();
   regExpr.Expression := 'WHERE\s*(.*)\s*GROUP';
   regExpr.ModifierG := True;

   if ( ds_sql = '' ) then
   begin
       ds_sql := qyControleCartao.SQL.Text;
   end;

   regExpr.Exec( ds_sql );
   consultaCondicao := Trim(regExpr.Match[1]);

   if(Pos('CurrentDate',consultaCondicao) <= 0) then
   begin
      // Formata o valor do campo data DE
      try
         DecodeDate(
            frmFiltroControleCartao.dtpDePrevisao.DateTime,
            myYear,
            myMonth,
            myDay
         );

         dia := IntToStr(myDay);
         if Length(dia) = 1 then
         begin
            dia := '0' + dia;
         end;

         mes := IntToStr(myMonth);
         if Length(mes) = 1 then
         begin
            mes := '0' + mes;
         end;

         ano := IntToStr(myYear);
         consultaCondicao := StringReplace(
            consultaCondicao,
            Chr(39) + ano + '-' + mes + '-' + dia + Chr(39),
            ' Date('+ ano + ', ' + mes + ', '+dia+')',
            [rfReplaceAll, rfIgnoreCase]
         );
      except
      //
      end;

      // Formata o valor do campo data ATE
      try
         DecodeDate(
            frmFiltroControleCartao.dtpAtePrevisao.DateTime,
            myYear,
            myMonth,
            myDay
         );

         dia := IntToStr(myDay);
         if Length(dia) = 1 then
         begin
            dia := '0' + dia;
         end;

         mes := IntToStr(myMonth);
         if Length(mes) = 1 then
         begin
            mes := '0' + mes;
         end;

         ano := IntToStr(myYear);
         consultaCondicao := StringReplace(
            consultaCondicao,
            Chr(39) + ano + '-' + mes + '-' + dia + Chr(39),
            ' Date('+ ano + ', ' + mes + ', '+dia+')',
            [rfReplaceAll, rfIgnoreCase]
         );
      except
      //
      end;
   end;

   // Passas as coligadas para o filtro do relatorio
   if(Pos(':param_coligadas',consultaCondicao) > 0) then
   begin
      consultaCondicao := StringReplace(
         consultaCondicao,
         ':param_coligadas',
         DM.GetColigadas,
         [rfReplaceAll, rfIgnoreCase]
      );
   end;

    // Formatando para sintaxe do CRYSTAL REPORTS
   consultaCondicao := StringReplace(
       consultaCondicao,
       'DATE_ADD(CURRENT_DATE, INTERVAL 7 DAY)',
       'DATEADD("d", 7, CurrentDate)',
       [rfReplaceAll, rfIgnoreCase]
    );

   // Converte a sintaxe da função para sintaxe do CRYSTAL Report
   consultaCondicao := StringReplace(
      consultaCondicao,
      'CURRENT_DATE',
      ' CurrentDate',
      [rfReplaceAll, rfIgnoreCase]
   );

   // Formatando para sintaxe do CRYSTAL REPORTS
   consultaCondicao := TGeneral.SQLToCrystalExpression(
      consultaCondicao,
      SQLToCrystalExpressionReplaceExAlias,
      SQLToCrystalExpressionReplaceColumnsToInt
   );
   
   result := consultaCondicao;
end;

function TfrmControleCartao.isAlteravel: TAlterarParcela;
var
   selecionou,
   sairLoop,
   possuiAlgumaParcOperacaoBaixada: Boolean;

   regSelecionado: Integer;
begin
   Result.alterar := True;

   {VALIDA SELECIONOU MAIS DE UM REGISTRO}
   selecionou := False;
   sairLoop := False;
   
   cdsControleCartao.First;

   while not cdsControleCartao.Eof do
   begin
      if (slSelectedReg.Values[cdsControleCartaocd_parcela.AsString] = '1') and not(selecionou) then
      begin
         regSelecionado := cdsControleCartaocd_parcela.AsInteger;
         
         Result.cdParcela := cdsControleCartaocd_parcela.AsInteger;
         Result.cdOperacao := cdsControleCartaocd_operacao.AsInteger;
         
         selecionou := True;
      end;

      if (slSelectedReg.Values[cdsControleCartaocd_parcela.AsString] = '1') and
         (cdsControleCartaocd_parcela.AsInteger <> regSelecionado) then
      begin
         Mensagem(
            'Voce não pode alterar mais de um registro.',
            'Aviso',
            MB_OK  + MB_ICONWARNING
         );

         Result.alterar := False;
         Exit;
      end;

      cdsControleCartao.Next;
   end;

   if not(selecionou) then
   begin
      Mensagem(
         'Voce deve selecionar ao menos um registro.',
         'Aviso',
         MB_OK  + MB_ICONWARNING
      );

      Result.alterar := False;
      Exit;
   end;
   {VALIDA SELECIONOU MAIS DE UM REGISTRO}

   {VALIDA SELECIONOU UM REGISTRO LIQUIDADO OU ALGUM REGISTRO DE UMA OPERACAO QUE JA FOI LIQUIDADA}
   sairLoop := False;

   Result.isLiquidada := False;
   possuiAlgumaParcOperacaoBaixada := False;

   cdsControleCartao.First;

   while not cdsControleCartao.Eof and not(sairLoop) do
   begin
      if (cdsControleCartaosn_liquidado.AsInteger = 1) and
         (slSelectedReg.Values[cdsControleCartaocd_parcela.AsString] = '1') then
      begin
         sairLoop := True;
      end;
      
      cdsControleCartao.Next;
   end;

   cdsControleCartao.First;

   while not cdsControleCartao.Eof and not(sairLoop) do
   begin
      if (cdsControleCartaosn_liquidado.AsInteger = 1) and
         (cdsControleCartaocd_operacao.AsInteger = Result.cdOperacao) then
      begin
         sairLoop := True;
         possuiAlgumaParcOperacaoBaixada := True;
      end;

      cdsControleCartao.Next;
   end;

   if sairLoop then
   begin

      if not(possuiAlgumaParcOperacaoBaixada) then
      begin
         Mensagem(
            'Você não pode alterar uma parcela liquidada.',
            'Aviso',
            MB_OK  + MB_ICONWARNING
         );
      end;

      if possuiAlgumaParcOperacaoBaixada then
      begin
         Mensagem(
            'Identificamos que houve a liquidação de alguma parcela envolvida nesta operação. '+
            'Com isso, somente será possível alterar a data de vencimento e acrescentar observações sobre esta operação.',
            'Aviso',
            MB_OK  + MB_ICONWARNING
         );
      end;

      Result.alterar := possuiAlgumaParcOperacaoBaixada;
      Result.isLiquidada := possuiAlgumaParcOperacaoBaixada;
      
      Exit;
   end;
   {VALIDA SELECIONOU UM REGISTRO LIQUIDADO OU ALGUM REGISTRO DE UMA OPERACAO QUE JA FOI LIQUIDADA}
end;

function TfrmControleCartao.isEstornavel: TEstornarParcelas;
var
   separador: String;
   sairLoop: Boolean;
   selecionouAlguma: Boolean;
begin
   Result.estornar := True;

   separador := '';
   Result.strParcelas := '';

   sairLoop := False;
   selecionouAlguma := False;

   cdsControleCartao.First;

   Result.parcelasEstornadas := TStringList.Create;

   while not cdsControleCartao.Eof and not(sairLoop) do
   begin
      if (slSelectedReg.Values[cdsControleCartaocd_parcela.AsString] = '1') and
         (cdsControleCartaosn_liquidado.AsInteger = 1) then
      begin
         Result.strParcelas :=
            Result.strParcelas +
            separador +
            cdsControleCartaocd_parcela.AsString;

         separador := ', ';

         Result.parcelasEstornadas.Add(cdsControleCartaocd_parcela.AsString);

         selecionouAlguma := True;
      end;

      if (slSelectedReg.Values[cdsControleCartaocd_parcela.AsString] = '1') and
         (cdsControleCartaosn_liquidado.AsInteger = 0) then
      begin
         Mensagem(
            'Você não pode estornar uma parcela que ainda não foi liquidada.',
            'Aviso',
            MB_OK + MB_ICONWARNING
         );

         Result.estornar := False;
         Exit;
      end;

      cdsControleCartao.Next;
   end;

   if not(selecionouAlguma) then
   begin
      Mensagem(
         'Não há nenhuma parcela selecionada.',
         'Aviso',
         MB_OK + MB_ICONWARNING
      );

      Result.estornar := False;
      Exit;
   end;
end;

procedure TfrmControleCartao.PrintReport;
const
   SSettings = ''
      + '{'
      + '    "can_export": true,'
      + '    "group_selection": null,'
      + '    "extra_filter": null,'
      + '    "filters": null,'
      + '    "desc": null,'
      + '    "formulas": null,'
      + '    "parameters": null,'
      + '    "selection": null,'
      + '    "sort_fields": null,'
      + '    "sql_after": null,'
      + '    "sql_before": null,'
      + '    "sql_expressions": null'
      + '}';
   SMessageReportNotFound = 'Arquivo de relatório não encontrado.';
   SCaptionError = 'Erro';
var
   Report: TReport;
   Module: TReportDataModule;
   Found: Boolean;
   FilePath, Settings, Selection: AnsiString;
begin
   Module := TReportDataModule.Create(nil);
   try
      Found := Module.LocateReportByKey('repFin_ControleCartoes');

      if Found then
      begin
         Report := TReport.Create;
         try

            FilePath := Module.GetReportFilePath;
            Selection := get_filtro_relatorio(sqlFiltrado);
            Report.Setup(FilePath, SSettings, Selection);
            Report.Execute;
            
         finally
            Report.Free;
         end;
         
      end;

      if not Found then
      begin
         MessageBox(Handle, SMessageReportNotFound, SCaptionError,
            MB_ICONERROR or MB_OK);
      end;
   finally
      Module.Free;
   end;
end;

procedure TfrmControleCartao.qyControleCartaoAfterOpen(DataSet: TDataSet);
begin
   while not qyControleCartao.Eof do
   begin
      slSelectedReg.Values[qyControleCartaocd_parcela.AsString] := '0';
      slColoridos.Values[qyControleCartaocd_parcela.AsString] := '0';
      
      qyControleCartao.Next;
   end;

   qyControleCartao.First;

   if not cdsControleCartao.Active then
      cdsControleCartao.Open;
            
   cdsControleCartao.Refresh;
end;

procedure TfrmControleCartao.qyControleCartaonm_pessoaGetText(Sender: TField;
  var Text: string; DisplayText: Boolean);
begin
   Text :=  sender.AsString;
end;

procedure TfrmControleCartao.recarregaParcelas;
{Foi utilizado distinct nesta situação pois quando várias mensalidades eram pagas em várias parcelas o sistema listava o mesmo registro várias vezes}
const
   SQL_PARCELAS =
      '   SELECT '+
	   '    * '+
      '   FROM '+
	   '   (  '+
      '  SELECT '+
      '     fcac.ds_nome, '+
      '     IF(fco.sn_credito = 1, ''Crédito'', ''Débito'') AS tipo_operacao, '+
      '     fcp.nr_parcela, '+
      '     fcp.dt_vencimento, '+
      '     IF(fcp.sn_liquidado = 1, ''Recebido'', ''Aguardando Recebimento'') AS situacao, '+
      '     fcp.vl_valor_parcela AS vl_parcela, '+
      '     fco.nr_taxa, '+
      '     ROUND((ROUND((fco.nr_taxa * fcp.vl_valor_parcela), 2) / 100), 2) AS tarifa, '+
      '     ROUND(fcp.vl_valor_parcela - ROUND((ROUND((fco.nr_taxa * fcp.vl_valor_parcela), 2) / 100), 2),2) AS valor_liquido, '+
      '     fcc.ds_caixa, '+
      '     fco.cd_operacao, '+
      '     fcp.cd_parcela, '+
      '     fcac.cd_admin_cartao, '+
      '     fco.ds_tid_cartao as ds_tid_cartao, '+
      '     fco.sn_credito, '+
      '     fcp.sn_liquidado, '+
      '     GROUP_CONCAT(DISTINCT p.nm_pessoa SEPARATOR ", ") as nm_pessoa '+
      '  FROM '+
      '     fin_cartao_parcelas fcp '+
      '  INNER JOIN fin_cartao_operacao fco ON ( '+
      '     fco.cd_operacao = fcp.cd_operacao '+
      '  ) '+
      '  INNER JOIN fin_cadastro_contas fcc ON ( '+
      '     fcc.cd_caixa = fcp.cd_caixa_atual '+
      '  ) '+
      '  INNER JOIN fin_cadastro_admin_cartao fcac ON ( '+
      '    fcac.cd_admin_cartao = fco.cd_admin_cartao '+
      '  ) '+
      '  INNER JOIN fin_cartao_mensalidades fcm ON ( '+
	   '     fcm.cd_operacao = fco.cd_operacao '+
      '  ) '+
      '  INNER JOIN mensalidades m ON ( '+
	   '     m.cd_mensalidade = fcm.cd_mensalidade '+
      '  ) '+
      '  INNER JOIN pessoas p ON (p.cd_pessoa = m.codigoaluno) '+
      '  WHERE '+
      '     fcp.dt_vencimento >= DATE_FORMAT(NOW(), ''%Y-%m-%d'') '+
      '     AND fcp.dt_vencimento <= DATE_FORMAT(DATE_ADD(NOW(),INTERVAL 7 day), ''%Y-%m-%d'')'+
      '  GROUP BY '+
      '     fcp.cd_parcela ' +
      '  ) AS parcelas ';
var
   regSelecionado: Integer;
   I: Integer;
begin
   slSelectedReg.BeginUpdate;

   for I := 0 to slSelectedReg.Count - 1 do
      slSelectedReg.ValueFromIndex[I] := '0';

   slSelectedReg.EndUpdate;

   slColoridos.BeginUpdate;

   for I := 0 to slColoridos.Count - 1 do
      slColoridos.ValueFromIndex[I] := '0';

   slColoridos.EndUpdate;

   regSelecionado := qyControleCartaocd_parcela.AsInteger;

   cdsControleCartao.Close;
   qyControleCartao.Close;

   if sqlFiltrado <> '' then
   begin
      qyControleCartao.SQL.Text := sqlFiltrado;
   end
   else
   begin
      qyControleCartao.SQL.Text := SQL_PARCELAS;
   end;

   qyControleCartao.SQL.Add(' GROUP BY cd_parcela ');

   if fieldOrdem = '' then
   begin
      qyControleCartao.SQL.Add(' ORDER BY ds_nome ');
   end
   else
   begin
      qyControleCartao.SQL.Add(' ORDER BY ' + fieldOrdem);
   end;
   
   qyControleCartao.Open;

   qyControleCartao.Locate('cd_parcela', regSelecionado, []);
end;

procedure TfrmControleCartao.sbSelecionarColunaClick(Sender: TObject);
begin
   Application.CreateForm(TfrmSelColunas, frmSelColunas);
   frmSelColunas.SelecionaColunas(bgControleCartao, 'controle_cartao');
end;

function TfrmControleCartao.validaCancelarOperacao(cd_operacao: Integer): Boolean;
const
   SQL_VALIDA_CANCELAR_OPERACAO =
      '  SELECT '+
	   '    COUNT(*) qtd '+
      '  FROM '+
	   '     fin_cartao_parcelas fcp '+
      '  WHERE '+
	   '     fcp.cd_operacao = :cd_operacao '+
      '     AND fcp.sn_liquidado = 1';
var
   qyValidaCancelarOperacao: TUMZQuery;
begin
   Result := True;

   DM.CriarConsulta(qyValidaCancelarOperacao);

   qyValidaCancelarOperacao.SQL.Text := SQL_VALIDA_CANCELAR_OPERACAO;
   qyValidaCancelarOperacao.ParamByName('cd_operacao').AsInteger := cd_operacao;
   qyValidaCancelarOperacao.Open;

   if qyValidaCancelarOperacao.FieldByName('qtd').AsInteger > 0 then
   begin
      Mensagem(
         'Não é possível cancelar esta movimentação de cartão pois uma das parcelas envolvidas já foi liquidada.',
         'Aviso',
         MB_ICONWARNING + MB_OK,
         Handle
      );
      Result := False;
   end;
end;

function TfrmControleCartao.validaSelecao(cdParcela, cdAdministradora, snCredito: Integer): Boolean;
begin
   Result := True;

   cdsControleCartao.DisableControls;

   cdsControleCartao.First;

   while not cdsControleCartao.Eof do
   begin
      if (slSelectedReg.Values[cdsControleCartaocd_parcela.AsString] = '1') and
         (cdParcela <> cdsControleCartaocd_parcela.AsInteger) then
      begin
         if (cdAdministradora <> cdsControleCartaocd_admin_cartao.AsInteger) or
            (snCredito <> cdsControleCartaosn_credito.AsInteger) then
         begin
            Result := False;
            Exit;
         end;
      end;

      cdsControleCartao.Next;
   end;

   cdsControleCartao.EnableControls;
end;

end.
