unit uConfiguraRetorno;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, StdCtrls, UMEditMonetario, Buttons, DB, ZAbstractRODataset,
  ZAbstractDataset, UZDataset, uDM;

type
  TfrmConfiguraRetorno = class(TForm)
    Panel1: TPanel;
    Panel2: TPanel;
    pnValorDivergente: TPanel;
    pnTarifas: TPanel;
    GroupBox1: TGroupBox;
    cbTarifaAutomatica: TCheckBox;
    RadioGroup1: TRadioGroup;
    cbLimitador: TCheckBox;
    umedJuros: TUMEditMonetario;
    umedDesconto: TUMEditMonetario;
    cbRetiraDesconto: TCheckBox;
    cbBaixaParcial: TCheckBox;
    Edit1: TEdit;
    Edit2: TEdit;
    Edit3: TEdit;
    Edit4: TEdit;
    btnConfirmar: TBitBtn;
    btnCancelar: TBitBtn;
    procedure cbLimitadorClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure btnConfirmarClick(Sender: TObject);
    procedure btnCancelarClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    strParametrosAnteriores: String;

    procedure salvarParametros();
  public
    { Public declarations }
  end;

var
  frmConfiguraRetorno: TfrmConfiguraRetorno;

implementation

{$R *.dfm}

procedure TfrmConfiguraRetorno.btnCancelarClick(Sender: TObject);
begin
   Self.Close;
end;

procedure TfrmConfiguraRetorno.btnConfirmarClick(Sender: TObject);
begin
   SalvarParametros();
   
   Self.Close;
end;

procedure TfrmConfiguraRetorno.cbLimitadorClick(Sender: TObject);
begin
   umedJuros.Enabled := TCheckBox(Sender).Checked;
   umedDesconto.Enabled := TCheckBox(Sender).Checked;

   if not TCheckBox(Sender).Checked then
   begin
      umedJuros.setValorDouble('0');
      umedDesconto.setValorDouble('0');
   end;
end;

procedure TfrmConfiguraRetorno.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
   Action := caFree;
end;

procedure TfrmConfiguraRetorno.FormShow(Sender: TObject);
var
   lim_juros,
   lim_desc,
   retira_desconto,
   baixa_parcial,
   tarifa_automatica: String;
begin
   lim_juros := DM.variavel_parametro('financeiro_retorno_limite_ajuste_juros');
   lim_desc  := DM.variavel_parametro('financeiro_retorno_limite_ajuste_desconto');

   umedJuros.setValorString(lim_juros);
   umedDesconto.setValorString(lim_desc);

   cbLimitador.Checked := ((lim_juros <> '') and (lim_juros <> '0')) or
                          ((lim_desc <> '') and (lim_desc <> '0'));

   umedJuros.Enabled := cbLimitador.Checked;
   umedDesconto.Enabled := cbLimitador.Checked;                          

   retira_desconto   := DM.variavel_parametro('financeiro_retorno_retirar_desconto_se_pago_maior');
   baixa_parcial     := DM.variavel_parametro('financeiro_retorno_baixar_parcial_pgto_menor');
   tarifa_automatica := DM.variavel_parametro('financeiro_retorno_lancar_tarifa_automatica');

   cbRetiraDesconto.Checked := retira_desconto = 'S';
   cbBaixaParcial.Checked := baixa_parcial = 'S';
   cbTarifaAutomatica.Checked := tarifa_automatica = 'S';

   strParametrosAnteriores :=
      'limite juros: ' +
      lim_juros +
      ', limite desconto: ' +
      lim_desc +
      ', retira desconto: ' +
      retira_desconto +
      ', baixa parcial: ' +
      baixa_parcial +
      ', tarifa automatica: ' +
      tarifa_automatica;
end;

procedure TfrmConfiguraRetorno.salvarParametros;
const
   SQL_UPDATE_PARAMETRO =
      ' UPDATE '+
      ' 	parametros '+
      ' SET '+
      ' 	ds_valor = :ds_valor '+
      ' WHERE '+
      ' 	ds_variavel = :parametro ';
var
   qyUpdateParametro: TUMZQuery;

   strChecked,
   obsParametros: String;
begin
   DM.CriarConsulta(qyUpdateParametro);

   strParametrosAnteriores := strParametrosAnteriores + ' / Alterou para: ';

   strChecked := '';

   if cbRetiraDesconto.Checked then
   begin
      strChecked := 'S';
   end
   else
   begin
      strChecked := 'N';
   end;

   qyUpdateParametro.SQL.Text := SQL_UPDATE_PARAMETRO;
   qyUpdateParametro.ParamByName('ds_valor').AsString := strChecked;
   qyUpdateParametro.ParamByName('parametro').AsString := 'financeiro_retorno_retirar_desconto_se_pago_maior';
   qyUpdateParametro.ExecSQL;

   strParametrosAnteriores := strParametrosAnteriores + 'retira desconto:' + strChecked + ', ';

   if cbBaixaParcial.Checked then
   begin
      strChecked := 'S';
   end
   else
   begin
      strChecked := 'N';
   end;

   qyUpdateParametro.ParamByName('ds_valor').AsString := strChecked;
   qyUpdateParametro.ParamByName('parametro').AsString := 'financeiro_retorno_baixar_parcial_pgto_menor';
   qyUpdateParametro.ExecSQL;

   strParametrosAnteriores := strParametrosAnteriores + 'baixa parcial:' + strChecked + ', ';

   if cbTarifaAutomatica.Checked then
   begin
      strChecked := 'S';
   end
   else
   begin
      strChecked := 'N';
   end;

   qyUpdateParametro.ParamByName('ds_valor').AsString := strChecked;
   qyUpdateParametro.ParamByName('parametro').AsString := 'financeiro_retorno_lancar_tarifa_automatica';
   qyUpdateParametro.ExecSQL;

   strParametrosAnteriores := strParametrosAnteriores + 'tarifa automatica: ' + strChecked + ', ';

   qyUpdateParametro.ParamByName('ds_valor').AsString := CurrToStr(umedDesconto.getValor);
   qyUpdateParametro.ParamByName('parametro').AsString := 'financeiro_retorno_limite_ajuste_desconto';
   qyUpdateParametro.ExecSQL;

   qyUpdateParametro.ParamByName('ds_valor').AsString := CurrToStr(umedJuros.getValor);
   qyUpdateParametro.ParamByName('parametro').AsString := 'financeiro_retorno_limite_ajuste_juros';
   qyUpdateParametro.ExecSQL;

   strParametrosAnteriores :=
      strParametrosAnteriores +
      'limite juros: ' +
      umedJuros.getValorString +
      ', limite desconto: ' +
      umedDesconto.getValorString;

   DM.setLog(2999, 'Alteracao', 'alteracao_configura_retorno', 0, strParametrosAnteriores);
end;

end.
