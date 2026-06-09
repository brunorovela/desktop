unit uAlterarTaxa;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Buttons, StdCtrls, Mask, UMComboBox, Grids, ExtCtrls, DB,
  ZAbstractRODataset, ZAbstractDataset, UZDataset, uDM, OleServer, ExcelXP,
  UMEditMonetario, General, UMAjuda, StrUtils, RegExpr;

type
   TTipoAlteracao = (taPorncetagem, taValor);

  TfrmAlterarTaxa = class(TForm)
    Panel1: TPanel;
    pnRemessaTit: TPanel;
    sgTotais: TStringGrid;
    Panel2: TPanel;
    btnLiquidar: TSpeedButton;
    btnCancelar: TSpeedButton;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    edDataVencimento: TMaskEdit;
    mObservacao: TMemo;
    Label4: TLabel;
    edValorTaxaPerc: TEdit;
    edValorTaxa: TEdit;
    UMAjuda2: TUMAjuda;
    procedure edDataVencimentoExit(Sender: TObject);
    procedure btnLiquidarClick(Sender: TObject);
    procedure edValorTaxaKeyPress(Sender: TObject; var Key: Char);
    procedure edValorTaxaPercKeyPress(Sender: TObject; var Key: Char);
    procedure edValorTaxaPercChange(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure edValorTaxaChange(Sender: TObject);
    procedure btnCancelarClick(Sender: TObject);
  private
    retorno: Boolean;

    valorTotal,
    valorTaxa,
    valorLiquido: Double;
    
    procedure limpaGrid;
    procedure carregaValores();
    procedure alteraValorPorcentagem(tipo: TTipoAlteracao);
    procedure alteraTaxa();

    function isValidForm(): Boolean;
  public
    codParcelaAlterar: Integer;
    possuiParcelaLiquidada: Boolean;

    function alterarTaxa(): Boolean;
  end;

var
  frmAlterarTaxa: TfrmAlterarTaxa;

implementation

{$R *.dfm}

{ TfrmAlterarTaxa }

function TfrmAlterarTaxa.alterarTaxa: Boolean;
begin
   retorno := True;

   Self.ShowModal;

   Result := retorno;
end;

procedure TfrmAlterarTaxa.alteraTaxa;
const
   SQL_ALTERA =
      ' UPDATE fin_cartao_parcelas AS fcp '+
      '  INNER JOIN fin_cartao_operacao AS fco ON ( '+
      '     fco.cd_operacao = fcp.cd_operacao '+
      '  ) '+
      '  SET '+
      '     fcp.dt_vencimento 	= :dt_vencimento, '+
      '     fcp.ds_observacoes 	= :ds_observacoes '+
      '     %s '+
      '  WHERE '+
      '     fcp.cd_parcela = :cd_parcela ';
var
   qyAltera: TUMZQuery;   
begin
   DM.CriarConsulta(qyAltera);

   qyAltera.SQL.Text := Format(SQL_ALTERA, [', fco.nr_taxa = :nr_taxa']);

   if  possuiParcelaLiquidada then
   begin
      qyAltera.SQL.Text := Format(SQL_ALTERA, ['']);
   end;

   qyAltera.ParamByName('dt_vencimento').AsDate := StrToDate(edDataVencimento.Text);
   qyAltera.ParamByName('ds_observacoes').AsString := mObservacao.Text;

   if not(possuiParcelaLiquidada) then
   begin
      qyAltera.ParamByName('nr_taxa').AsFloat := StrToFloat(edValorTaxaPerc.Text);      
   end;

   qyAltera.ParamByName('cd_parcela').AsInteger := codParcelaAlterar;

   qyAltera.ExecSQL;

   DM.setLog(
      123654,
      'Alteracao',
      'Alteração de parcela',
      DM.GetUsuarioLogado.ColigadaLogada,
      '{"cd_parcela": "' + IntToStr(codParcelaAlterar) + '",' +
      '"dt_vencimento": "' + edDataVencimento.Text + '", ' +
      '"ds_observacoes": "' + mObservacao.Text + '", '+
      '"nr_taxa": "' + edValorTaxaPerc.Text + '"}'
   );
end;

procedure TfrmAlterarTaxa.alteraValorPorcentagem(tipo: TTipoAlteracao);
var
   percTaxa,
   ValorTaxaed: Double;
   
begin
   if tipo = taPorncetagem then
   begin
      percTaxa := StrToFloatDef(edValorTaxaPerc.text, 0);

      valorTaxa := RoundFloat(valorTotal * (percTaxa / 100), 2);
      valorLiquido := RoundFloat(valorTotal - valorTaxa, 2);
      
      sgTotais.Cols[1][1] := 'R$ ' + FloatToStr(valorTaxa);
      sgTotais.Cols[2][1] := FloatToStr(percTaxa) + ' %';
      sgTotais.Cols[3][1] := 'R$ ' + FloatToStr(valorLiquido);

      edValorTaxa.OnChange := nil;
      edValorTaxa.Text := FloatToStr(valorTaxa);
      edValorTaxa.OnChange := edValorTaxaChange;
   end;
   
   if tipo = taValor then
   begin
      valorTaxaed := StrToFloatDef(edValorTaxa.Text, 0);

      percTaxa := RoundFloat((ValorTaxaed * 100) / valorTotal, 5);

      valorLiquido := RoundFloat(valorTotal - ValorTaxaed, 2);

      sgTotais.Cols[1][1] := 'R$ ' + FloatToStr(ValorTaxaed);
      sgTotais.Cols[2][1] := FloatToStr(percTaxa) + ' %';
      sgTotais.Cols[3][1] := 'R$ ' + FloatToStr(valorLiquido);

      edValorTaxaPerc.OnChange := nil;
      edValorTaxaPerc.Text := FloatToStr(percTaxa);
      edValorTaxaPerc.OnChange := edValorTaxaPercChange;
   end;
end;

procedure TfrmAlterarTaxa.btnCancelarClick(Sender: TObject);
begin
   retorno := False;

   Self.Close;
end;

procedure TfrmAlterarTaxa.btnLiquidarClick(Sender: TObject);
begin
   if isValidForm() then
   begin
      alteraTaxa();
      
      Self.Close;
   end;
end;

procedure TfrmAlterarTaxa.carregaValores;
const
   SQL_TOTAIS =
      '  SELECT '+
      '     SUM(fcp.vl_valor_parcela) AS valor, '+
      '     SUM(ROUND(fcp.vl_valor_parcela * (fco.nr_taxa / 100), 2)) AS valor_taxa, '+
      '     ROUND(SUM(fcp.vl_valor_parcela) - SUM(ROUND(fcp.vl_valor_parcela * (fco.nr_taxa / 100), 2)), 2) AS valor_liquido, '+
      '     fco.nr_taxa, '+
      '     DATE_FORMAT(fcp.dt_vencimento, ''%d/%m/%Y'') AS dt_vencimento, '+
      '     fcp.ds_observacoes '+
      '  FROM '+
      '     fin_cartao_parcelas fcp '+
      '  INNER JOIN fin_cartao_operacao fco ON ( '+
      '     fco.cd_operacao = fcp.cd_operacao '+
      '  ) '+
      '  WHERE '+
      '     fcp.cd_parcela = :cd_parcela ';
var
   qyTotais: TUMZReadOnlyQuery;
begin
   DM.CriarConsulta(qyTotais);

   qyTotais.SQL.Text := SQL_TOTAIS;
   qyTotais.ParamByName('cd_parcela').AsInteger := codParcelaAlterar;
   qyTotais.Open;

   valorTotal     := qyTotais.FieldByName('valor').AsFloat;
   valorTaxa      := qyTotais.FieldByName('valor_taxa').AsFloat;
   valorLiquido   := qyTotais.FieldByName('valor_liquido').AsFloat;

   edValorTaxaPerc.Text := qyTotais.FieldByName('nr_taxa').AsString;
   edValorTaxa.Text := qyTotais.FieldByName('valor_taxa').AsString;

   edDataVencimento.Text := qyTotais.FieldByName('dt_vencimento').AsString;
   mObservacao.Text := qyTotais.FieldByName('ds_observacoes').AsString;

   sgTotais.Cols[0][1] := 'R$ ' + qyTotais.FieldByName('valor').AsString;
   sgTotais.Cols[1][1] := 'R$ ' + qyTotais.FieldByName('valor_taxa').AsString;
   sgTotais.Cols[2][1] := qyTotais.FieldByName('nr_taxa').AsString + ' %';
   sgTotais.Cols[3][1] := 'R$ ' + qyTotais.FieldByName('valor_liquido').AsString;

   edValorTaxaPerc.Enabled := not(possuiParcelaLiquidada);
   edValorTaxa.Enabled := not(possuiParcelaLiquidada);
end;

procedure TfrmAlterarTaxa.edValorTaxaPercKeyPress(Sender: TObject; var Key: Char);
const
   SExpr = '\d+(,\d{0,5})?';
var
   Edit: TCustomEdit;
   S, FutureText: AnsiString;
   StrLen: Integer;
   RegExpr: TRegExpr;
   Matched: Boolean;
begin
   if Key = #8 then Exit;

   Edit := TCustomEdit(Sender);
   S := Edit.Text;
   StrLen := Length(S);
   FutureText :=
      AnsiLeftStr(S, Edit.SelStart) + Key +
      AnsiRightStr(S, StrLen - (Edit.SelStart + Edit.SelLength));

   RegExpr := TRegExpr.Create;
   try
      RegExpr.Expression := SExpr;
      Matched := RegExpr.Exec(FutureText);

      if Matched then
      begin
         if RegExpr.Match[0] <> FutureText then
            Key := #0;
      end;

      if not Matched then
         Key := #0;
         
   finally
      FreeAndNil(RegExpr);
   end;
end;

procedure TfrmAlterarTaxa.edDataVencimentoExit(Sender: TObject);
begin
   edDataVencimento.Text := DateToStr(StrToDateDef(edDataVencimento.Text, Date));
end;

procedure TfrmAlterarTaxa.edValorTaxaChange(Sender: TObject);
begin
   Self.alteraValorPorcentagem(taValor);
end;

procedure TfrmAlterarTaxa.edValorTaxaKeyPress(Sender: TObject; var Key: Char);
const
   SExpr = '\d+(,\d{0,2})?';
var
   Edit: TCustomEdit;
   S, FutureText: AnsiString;
   StrLen: Integer;
   RegExpr: TRegExpr;
   Matched: Boolean;
begin
   if Key = #8 then Exit;

   Edit := TCustomEdit(Sender);
   S := Edit.Text;
   StrLen := Length(S);
   FutureText :=
      AnsiLeftStr(S, Edit.SelStart) + Key +
      AnsiRightStr(S, StrLen - (Edit.SelStart + Edit.SelLength));

   RegExpr := TRegExpr.Create;
   try
      RegExpr.Expression := SExpr;
      Matched := RegExpr.Exec(FutureText);

      if Matched then
      begin
         if RegExpr.Match[0] <> FutureText then
            Key := #0;
      end;

      if not Matched then
         Key := #0;
         
   finally
      FreeAndNil(RegExpr);
   end;
end;

procedure TfrmAlterarTaxa.edValorTaxaPercChange(Sender: TObject);
begin
   Self.alteraValorPorcentagem(taPorncetagem);
end;

procedure TfrmAlterarTaxa.FormShow(Sender: TObject);
begin
   limpaGrid;
   carregaValores;
end;

function TfrmAlterarTaxa.isValidForm: Boolean;
var
   dataCorreta: TDate;
begin
   Result := True;

   // Retirada a verificação. Tem que deixar ajustar a data se tiver errada, pois essa data é conciliada com a empresa de cartões.
   {
   if StrToDate(edDataVencimento.Text) < Date then
   begin
      Mensagem(
         'Data de vencimento não pode ser menor que a data atual.',
         'Aviso',
         MB_OK + MB_ICONWARNING
      );

      Result := False;

      Exit;
   end;
   }

   if mObservacao.Text = '' then
   begin
      Mensagem(
         'O campo de observação não pode estar em branco.',
         'Aviso',
         MB_OK + MB_ICONWARNING
      );

      Result := False;

      Exit;
   end;
end;

procedure TfrmAlterarTaxa.limpaGrid;
begin
   sgTotais.ColWidths[0] := 90;
   sgTotais.ColWidths[1] := 90;
   sgTotais.ColWidths[2] := 90;
   sgTotais.ColWidths[3] := 90;

   sgTotais.Cols[0][0] := 'Valor Atual';
   sgTotais.Cols[1][0] := 'Valor Taxa';
   sgTotais.Cols[2][0] := 'Taxa';
   sgTotais.Cols[3][0] := 'Valor líquido';


   sgTotais.Cols[0][1] := '';
   sgTotais.Cols[1][1] := '';
   sgTotais.Cols[2][1] := '';
   sgTotais.Cols[3][1] := '';

   mObservacao.Text := '';
end;

end.
