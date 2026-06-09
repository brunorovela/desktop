unit uFluxoCaixa;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, DB, ZConnection, uDM, Grids, DBGrids, StdCtrls, ComCtrls,
  Buttons, Main, uClassMovimento, ZAbstractRODataset, ZAbstractDataset,
  ZDataset, UZDataset, UMDateTimePicker;

type

  TRValores = record
      FData: TDateTime;
      FCpPrevisto: Double;
      FCpRealizado: Double;
      FCrPrevisto: Double;
      FCrRealizado: Double;
  end;

  Tfrm_fluxo_caixa = class(TForm)
    Bevel4: TBevel;
    pnTitulo: TPanel;
    qyFluxo: TUMZQuery;
    qyFluxodt_data: TDateTimeField;
    qyFluxovl_cp_previsto: TFloatField;
    qyFluxovl_cp_realizado: TFloatField;
    qyFluxovl_cr_previsto: TFloatField;
    qyFluxovl_cr_realizado: TFloatField;
    qyFluxovl_saldo: TFloatField;
    srcFluxo: TDataSource;
    Panel1: TPanel;
    Panel2: TPanel;
    DBGrid1: TDBGrid;
    Bevel1: TBevel;
    Bevel2: TBevel;
    Panel3: TPanel;
    Panel4: TPanel;
    DBGrid2: TDBGrid;
    Panel5: TPanel;
    Bevel3: TBevel;
    lbDataFinal: TLabel;
    lbDataInicial: TLabel;
    SpeedButton1: TSpeedButton;
    qyContas: TUMZQuery;
    srcContas: TDataSource;
    qyContascd_caixa: TIntegerField;
    qyContasds_caixa: TStringField;
    qyContasnm_banco: TStringField;
    qyContasnr_conta: TStringField;
    qyContasnr_float_bancario: TSmallintField;
    qyContasValSaldo: TCurrencyField;
    qyAux: TUMZQuery;
    qyValor: TUMZQuery;
    umdtInicial: TUMDateTimePicker;
    umdtFinal: TUMDateTimePicker;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure SpeedButton1Click(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure qyContasCalcFields(DataSet: TDataSet);
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
    aValores : Array of TRValores;
    Procedure MontarFluxo;
    Function ProcuraNoArray( Data: TDateTime ) : Integer;
  public
    { Public declarations }
  end;

var
  frm_fluxo_caixa: Tfrm_fluxo_caixa;
  MovimentoTmp : TMovimento;

implementation

{$R *.dfm}

procedure Tfrm_fluxo_caixa.FormShow(Sender: TObject);
begin
   umdtFinal.Date := DataHoje;
   umdtInicial.Date := DataHoje;

   MontarFluxo;
end;

procedure Tfrm_fluxo_caixa.MontarFluxo;
var
   DataTemp : TDateTime;
   iAux : Integer;

   ValSaldoInicial : Currency;
begin
   // Pegar Saldo Inicial;

   qyContas.Close;
   qyContas.Open;


   qyContas.First;
   ValSaldoInicial := 0;

   while not qyContas.EOF do begin
       ValSaldoInicial := ValSaldoInicial + qyContasValSaldo.AsCurrency;
       qyContas.Next;
   end;

   SetLength(aValores, 0);

   // Pegar Valor Previsto
   with qyValor do begin

      Close;
      SQL.Clear;

      SQL.Add(' SELECT datavencimento, SUM((valorbruto + valorjuros + valorextra - descontoextra)) ValPendente ' );
      SQL.Add(' FROM mensalidades                      ' );
      SQL.Add(' WHERE situacao = 2 AND datavencimento >= :DtVencimento1 AND datavencimento <= :DtVencimento2 ' );
      SQL.Add(' GROUP BY datavencimento ');

      ParamByName('DtVencimento1').AsString := FormatDateTime('yyyy-mm-dd',umdtInicial.Date);
      ParamByName('DtVencimento2').AsString := FormatDateTime('yyyy-mm-dd',umdtFinal.Date);

      Open;

   end;

   while not qyValor.Eof do begin
      iAux := ProcuraNoArray(Trunc(qyValor.FieldByName('datavencimento').AsDateTime));

      if iAux < 0 then begin
          SetLength(aValores, Length(aValores) + 1);
          iAux := Length(aValores) - 1;
          aValores[iAux].FData := Trunc(qyValor.FieldByName('datavencimento').AsDateTime);
      end;


      aValores[iAux].FCrPrevisto := qyValor.FieldByName('ValPendente').AsCurrency;

      qyValor.Next;
   end;

   // Pegar Compromissos Previstos
   with qyValor do begin

      Close;
      SQL.Clear;

      SQL.Add('SELECT                                                 ');
      SQL.Add('	cp.dt_provavel_pgto,                                ');
      SQL.Add('	SUM(m.vl_entrada) AS vl_entradas,                   ');
      SQL.Add('	SUM(m.vl_saida) AS vl_saidas                        ');
      SQL.Add('FROM                                                   ');
      SQL.Add('	fin_contas_pagar cp                                   ');
      SQL.Add('	LEFT JOIN fin_mov_cp m ON (m.cd_titulo = cp.cd_titulo) ');
      SQL.Add('WHERE                                                  ');
      SQL.Add('	    cp.dt_provavel_pgto >= :dt_inicial ');
      SQL.Add('	AND cp.dt_provavel_pgto <= :dt_final   ');
      SQL.Add('	AND cp.cd_situacao = 1 ');
      SQL.Add(' GROUP BY cp.dt_provavel_pgto ');

      ParamByName('dt_inicial').AsString := FormatDateTime('yyyy-mm-dd',umdtInicial.Date);
      ParamByName('dt_final').AsString := FormatDateTime('yyyy-mm-dd',umdtFinal.Date);

      Open;

   end;

   while not qyValor.Eof do begin
      iAux := ProcuraNoArray(Trunc(qyValor.FieldByName('dt_provavel_pgto').AsDateTime));

      if iAux < 0 then begin
          SetLength(aValores, Length(aValores) + 1);
          iAux := Length(aValores) - 1;
          aValores[iAux].FData := Trunc(qyValor.FieldByName('dt_provavel_pgto').AsDateTime);
      end;


      aValores[iAux].FCPPrevisto := qyValor.FieldByName('Vl_entradas').AsCurrency -
                                    qyValor.FieldByName('vl_saidas').AsCurrency;

      qyValor.Next;
   end;

   // Pegar Valor Realizado
   with qyValor do begin

      Close;
      SQL.Clear;

      SQL.Add(' SELECT datapagamento, SUM((valorpago)) ValPendente ' );
      SQL.Add(' FROM mensalidades                      ' );
      SQL.Add(' WHERE (situacao = 0 OR situacao = 1) AND datapagamento >= :DtVencimento1 AND datapagamento <= :DtVencimento2 ' );
      SQL.Add(' GROUP BY datapagamento ');

      ParamByName('DtVencimento1').AsString := FormatDateTime('yyyy-mm-dd',umdtInicial.Date);
      ParamByName('DtVencimento2').AsString := FormatDateTime('yyyy-mm-dd',umdtFinal.Date);

      Open;

   end;

   while not qyValor.Eof do begin
      iAux := ProcuraNoArray(Trunc(qyValor.FieldByName('datapagamento').AsDateTime));

      if iAux < 0 then begin
          SetLength(aValores, Length(aValores) + 1);
          iAux := Length(aValores) - 1;
          aValores[iAux].FData := Trunc(qyValor.FieldByName('datapagamento').AsDateTime);
      end;


      aValores[iAux].FCrRealizado := qyValor.FieldByName('ValPendente').AsCurrency;

      qyValor.Next;
   end;

   // Pegar Compromissos Previstos
   with qyValor do begin

      Close;
      SQL.Clear;

      SQL.Add('SELECT                                                 ');
      SQL.Add('	cp.dt_provavel_pgto,                                ');
      SQL.Add('	SUM(m.vl_entrada) AS vl_entradas,                   ');
      SQL.Add('	SUM(m.vl_saida) AS vl_saidas                        ');
      SQL.Add('FROM                                                   ');
      SQL.Add('	fin_contas_pagar cp                                   ');
      SQL.Add('	LEFT JOIN fin_mov_cp m ON (m.cd_titulo = cp.cd_titulo) ');
      SQL.Add('WHERE                                                  ');
      SQL.Add('	    cp.dt_provavel_pgto >= :dt_inicial ');
      SQL.Add('	AND cp.dt_provavel_pgto <= :dt_final   ');
      SQL.Add('	AND cp.cd_situacao = 2 ');
      SQL.Add(' GROUP BY cp.dt_provavel_pgto ');

      ParamByName('dt_inicial').AsString := FormatDateTime('yyyy-mm-dd',umdtInicial.Date);
      ParamByName('dt_final').AsString := FormatDateTime('yyyy-mm-dd',umdtFinal.Date);

      Open;

   end;

   while not qyValor.Eof do begin
      iAux := ProcuraNoArray(Trunc(qyValor.FieldByName('dt_provavel_pgto').AsDateTime));

      if iAux < 0 then begin
          SetLength(aValores, Length(aValores) + 1);
          iAux := Length(aValores) - 1;
          aValores[iAux].FData := Trunc(qyValor.FieldByName('dt_provavel_pgto').AsDateTime);
      end;


      aValores[iAux].FCPRealizado := qyValor.FieldByName('Vl_entradas').AsCurrency -
                                    qyValor.FieldByName('vl_saidas').AsCurrency;

      qyValor.Next;
   end;


   with qyAux do begin
      Close;
      SQL.Clear;
      SQL.Add(' DELETE FROM temp_fluxo_caixa  ');
      ExecSQL;

      Close;
      SQL.Clear;
      SQL.Add(
        ' INSERT INTO temp_fluxo_caixa  ' +
        '   (dt_data, vl_cp_previsto, vl_cp_realizado, vl_cr_previsto, vl_cr_realizado, vl_saldo) ' +
        ' VALUES                        ' +
        '   (:dt_data, :vl_cp_previsto, :vl_cp_realizado, :vl_cr_previsto, :vl_cr_realizado, :vl_saldo)  '
      );

   end;

   DataTemp := Trunc(umdtInicial.Date);

   while DataTemp <= Trunc(umdtFinal.Date) do begin

      iAux := ProcuraNoArray(DataTemp);

      if iAux < 0 then begin
         qyAux.ParamByName('dt_data').AsString := FormatDateTime('yyyy-mm-dd', DataTemp);
         qyAux.ParamByName('vl_cp_previsto').AsCurrency := 0;
         qyAux.ParamByName('vl_cp_realizado').AsCurrency := 0;
         qyAux.ParamByName('vl_cr_previsto').AsCurrency := 0;
         qyAux.ParamByName('vl_cr_realizado').AsCurrency := 0;

         qyAux.ParamByName('vl_saldo').AsCurrency := ValSaldoInicial;
      end
      else
      begin

         qyAux.ParamByName('dt_data').AsString := FormatDateTime('yyyy-mm-dd', DataTemp);
         qyAux.ParamByName('vl_cp_previsto').AsCurrency := aValores[iAux].FCPPrevisto;
         qyAux.ParamByName('vl_cp_realizado').AsCurrency := aValores[iAux].FCPRealizado;
         qyAux.ParamByName('vl_cr_previsto').AsCurrency := aValores[iAux].FCRPrevisto;
         qyAux.ParamByName('vl_cr_realizado').AsCurrency := aValores[iAux].FCRRealizado;
         ValSaldoInicial := ValSaldoInicial + aValores[iAux].FCRPrevisto - aValores[iAux].FCPPrevisto;

         qyAux.ParamByName('vl_saldo').AsCurrency := ValSaldoInicial;

      end;

      qyAux.ExecSQL;

      DataTemp := Trunc(DataTemp + 1);
   end;

   qyFluxo.Close;
   qyFluxo.Open;

   SetLength(aValores, 0);

end;

procedure Tfrm_fluxo_caixa.qyContasCalcFields(DataSet: TDataSet);
begin
    {MovimentoTmp.Coligada := DM.iColigadaSelecionada;
    qyContasValSaldo.AsCurrency := MovimentoTmp.NovoSaldo(qyContascd_caixa.AsInteger, False);}
end;

procedure Tfrm_fluxo_caixa.FormCreate(Sender: TObject);
begin
   MovimentoTmp := TMovimento.create;
end;

procedure Tfrm_fluxo_caixa.FormDestroy(Sender: TObject);
begin
   FreeAndNil(MovimentoTmp);
end;

procedure Tfrm_fluxo_caixa.SpeedButton1Click(Sender: TObject);
begin
   MontarFluxo;
end;

procedure Tfrm_fluxo_caixa.FormClose(Sender: TObject; var Action: TCloseAction);
begin
   Action := caFree;
end;

function Tfrm_fluxo_caixa.ProcuraNoArray(Data: TDateTime): Integer;
var
  n : Integer;
begin

  result := -1;
  
  For n := 0 to Length(aValores) - 1 do begin
     if aValores[n].FData = Data then begin
        Result := n;
        Exit;
     end
  end;

  
end;

end.

