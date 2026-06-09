unit uMensalidadesBaixarChequesClass;

interface

uses
   Classes, UZDataset, uDM, SysUtils;

Type
  TMBCheque = class(TObject)

  private
    Campos  : TStringList;

  protected

  public
    constructor Create();
    destructor Destroy; override;

    procedure defineCampos();
    procedure setValorCampo( ds_campo: string; ds_valor: string );
    function getValorCampo( ds_campo: string) : string;
    procedure apagarCheque();
end;

implementation


{ TMBPessoa }

procedure TMBCheque.apagarCheque;
var
   qyFinCheque : TUMZQuery;
begin
   DM.CriarConsulta( qyFinCheque );
   
   qyFinCheque.Close();
   qyFinCheque.SQL.Clear();
   qyFinCheque.SQL.Add('DELETE FROM fin_cheques WHERE cd_cheque = :cd_cheque');
   qyFinCheque.ParamByName('cd_cheque').AsString := Self.getValorCampo('cd_cheque');
   qyFinCheque.ExecSQL;

   FreeAndNil( qyFinCheque );
end;

constructor TMBCheque.Create;
begin
   //define os campos da tabela
   defineCampos();
end;

procedure TMBCheque.defineCampos;
begin
   Campos := TStringList.Create();
   Campos.Values['cd_cheque']       := '';
   Campos.Values['nr_cheque']       := '';
   Campos.Values['nr_banco']        := '';
   Campos.Values['nr_agencia']      := '';
   Campos.Values['nr_conta']        := '';
   Campos.Values['vl_cheque']       := '';
   Campos.Values['dt_compensacao']  := '';
   Campos.Values['nm_titular']      := '';
end;

destructor TMBCheque.Destroy;
begin
  inherited;
  Campos.Free;
end;

function TMBCheque.getValorCampo(ds_campo: string): string;
begin
   Result := Campos.Values[ds_campo];
end;

procedure TMBCheque.setValorCampo(ds_campo, ds_valor: string);
begin
   Campos.Values[ds_campo] := ds_valor;
end;

end.
