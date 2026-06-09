unit uMensalidadesBaixarParcelaClass;

interface

uses
   Classes;

Type
  TMBParcela = class(TObject)

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


{ TMBParcela }

constructor TMBParcela.Create;
begin
   //define os campos da tabela
   defineCampos();
end;

procedure TMBParcela.defineCampos;
begin
   Campos := TStringList.Create();
   Campos.Values['sn_ativo']        := '';
   Campos.Values['parcela']         := '';
   Campos.Values['datavencimento']  := '';
   Campos.Values['ds_tipo_titulo']  := '';
   Campos.Values['cd_tipo_titulo']  := '';
   Campos.Values['valorbruto']      := '';
   Campos.Values['valordesconto']   := '';
   Campos.Values['desconto_calc']   := '';
   Campos.Values['valorjuros']      := '';
   Campos.Values['juros_calc']      := '';
   Campos.Values['valortotal']      := '';
   Campos.Values['valorpago']       := '';
   Campos.Values['datapagamento']   := '';
   Campos.Values['cd_mensalidade']  := '';
   Campos.Values['situacao']        := '';
   Campos.Values['anosemestre']     := '';
   Campos.Values['depto']           := '';
   Campos.Values['cd_coligada']     := '';
   Campos.Values['cd_centro_custo'] := '';
   Campos.Values['cd_plano_conta']  := '';
   Campos.Values['cd_caixa']        := '';
   Campos.Values['cd_resp']         := '';
   Campos.Values['usuario']         := '';
   Campos.Values['nossonumero']     := '';
   Campos.Values['valorextra']      := '';
   Campos.Values['descontoextra']   := '';
   Campos.Values['turma']           := '';
   Campos.Values['codigoaluno']     := '';
   Campos.Values['valorjuros_fixo'] := '';
   Campos.Values['hr_atual']        := '';
   Campos.Values['resp_mensalidade']:= '';
   Campos.Values['alterou_juros']   := '0'; // Flag para cada parcela
end;

destructor TMBParcela.Destroy;
begin
  inherited;
  Campos.Free;
end;

function TMBParcela.getValorCampo(ds_campo: string): string;
begin
   Result := Campos.Values[ds_campo];
end;

procedure TMBParcela.setValorCampo(ds_campo, ds_valor: string);
begin
   Campos.Values[ds_campo] := ds_valor;
end;

end.

