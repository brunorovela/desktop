unit uFinChequesMensalidades;

interface

uses Classes, uDM, SysUtils, General, UZDataset, ZAbstractRODataset;

Type TMBFinCheques = class(TObject)
   private
      Campos  : TStringList;
   protected

   public
      constructor Create();
      destructor Destroy; override;
      procedure defineCampos();
      procedure setValorCampo( ds_campo: string; ds_valor: string );
      procedure inserir();
      function getValorCampo( ds_campo: string) : string;
end;
implementation

{ TFinChequesMensalidades }

constructor TMBFinCheques.Create;
begin
   Self.defineCampos();
end;

procedure TMBFinCheques.defineCampos;
begin
   Campos := TStringList.Create();
   Campos.Values['cd_cheque']       := '';
   Campos.Values['cd_mensalidade']  := '';
   Campos.Values['nr_cheque']       := '';
end;

destructor TMBFinCheques.Destroy;
begin
   inherited;
   Campos.Free;
end;

function TMBFinCheques.getValorCampo(ds_campo: string): string;
begin
   Result := Campos.Values[ds_campo];
end;

procedure TMBFinCheques.inserir;
var
   qyChequesMensalidades   : TUMZQuery;
begin

   try
      DM.CriarConsulta( qyChequesMensalidades );
      qyChequesMensalidades.Close();
      qyChequesMensalidades.SQL.Clear();
      qyChequesMensalidades.SQL.Add( 'INSERT IGNORE INTO fin_cheques_mensalidades ( cd_cheque, cd_mensalidade ) ' );
      qyChequesMensalidades.SQL.Add( 'VALUES ( ' );
      qyChequesMensalidades.SQL.Add( Concat( Self.getValorCampo('cd_cheque'), ', ' )  );
      qyChequesMensalidades.SQL.Add( Concat( Self.getValorCampo('cd_mensalidade'), ') ' ) );
      qyChequesMensalidades.ExecSQL();
   except on E: EZDatabaseError do
      TrataErroBanco( qyChequesMensalidades, E );
   end;

   FreeAndNil( qyChequesMensalidades );
end;

procedure TMBFinCheques.setValorCampo(ds_campo, ds_valor: string);
begin
   Campos.Values[ds_campo] := ds_valor;
end;

end.
