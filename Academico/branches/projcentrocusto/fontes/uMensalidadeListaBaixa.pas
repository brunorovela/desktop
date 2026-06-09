unit uMensalidadeListaBaixa;

interface
   uses Classes;

Type
   TMBMensalidadeBaixa = class(TObject)

   private
      Campos  : TStringList;
   protected

   public
      constructor Create();
      destructor Destroy; override;
      procedure defineCampos();
      procedure setValorCampo( ds_campo: string; ds_valor: string );
      function getValorCampo( ds_campo: string) : string;
end;

implementation

{ TMBMensalidadeBaixa }

constructor TMBMensalidadeBaixa.Create();
begin
   //define os campos da tabela
   defineCampos();
end;

procedure TMBMensalidadeBaixa.defineCampos;
begin
   Campos := TStringList.Create();
   Campos.Values['cd_mensalidade']     := '';
   Campos.Values['cd_cheque']          := ''; // caso pgto com cheque armazena o número
   Campos.Values['vl_pago_cheque']     := ''; //valor pago com cheque
   Campos.Values['vl_pago_dinheiro']   := ''; //valor pago com dinheiro
   Campos.Values['valorjuros_fixo']    := '';
   Campos.Values['valorjuros']         := '';
   Campos.Values['datapagamento']      := '';
   Campos.Values['valordesconto']      := '';
   Campos.Values['valorpago']          := ''; // valor total a ser pago
   Campos.Values['parcela']            := '';
   Campos.Values['datavencimento']     := '';
   Campos.Values['alterou_juros']      := '0';
   Campos.Values['ds_deposito'] := '';
end;

destructor TMBMensalidadeBaixa.Destroy;
begin
  inherited;
  Campos.Free;
end;

function TMBMensalidadeBaixa.getValorCampo(ds_campo: string): string;
begin
   Result := Campos.Values[ds_campo];
end;

procedure TMBMensalidadeBaixa.setValorCampo(ds_campo, ds_valor: string);
begin
   Campos.Values[ds_campo] := ds_valor;
end;

end.
