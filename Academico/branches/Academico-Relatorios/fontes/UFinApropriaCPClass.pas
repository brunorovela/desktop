unit UFinApropriaCPClass;

{Classe para manipulação de dados na tabela fin_apropria_cp}

interface

uses
   Classes, udm, UZDataset, SysUtils, General, ZAbstractRODataset;

Type
  TFinApropriaCP = class(TObject)

  private
    Campos  : TStringList;

  protected

  public
    constructor Create();
    destructor Destroy; override;

    procedure defineCampos();
    procedure setValorCampo( ds_campo: string; ds_valor: string );
    procedure inserir();
    procedure atualizar();
    function retorna_campos() : string;
    function retorna_valores() : string;
    function getValorCampo( ds_campo: string) : string;
end;

implementation

{ TFinApropriaCP }

procedure TFinApropriaCP.atualizar;
var
   qyFinApropriaCP  : TUMZQuery;
   ds_campos         : string;
   ds_valores        : string;
begin
   ds_campos   := Self.retorna_campos();
   ds_valores  := Self.retorna_valores();

   try
      DM.CriarConsulta( qyFinApropriaCP );
      qyFinApropriaCP.Close();
      qyFinApropriaCP.SQL.Clear();
      qyFinApropriaCP.SQL.Add( 'REPLACE INTO fin_apropria_cp ' );
      qyFinApropriaCP.SQL.Add( ds_campos );
      qyFinApropriaCP.SQL.Add( ' VALUES ' );
      qyFinApropriaCP.SQL.Add( ds_valores );
      qyFinApropriaCP.ExecSQL();
   except on E: EZDatabaseError do
      TrataErroBanco( qyFinApropriaCP, E );
   end;

   FreeAndNil( qyFinApropriaCP );
end;

constructor TFinApropriaCP.Create;
begin
   //define os campos da tabela
   defineCampos();
end;

procedure TFinApropriaCP.defineCampos;
begin
   Campos := TStringList.Create();

   Campos.Values['cd_titulo']       := '';
   Campos.Values['cd_coligada']     := '';
   Campos.Values['cd_conta']        := '';
   Campos.Values['cd_centro']       := '';
   Campos.Values['vl_movimento']    := '';
end;

destructor TFinApropriaCP.Destroy;
begin
  inherited;
  Campos.Free;
end;

function TFinApropriaCP.getValorCampo(ds_campo: string): string;
begin
   Result := Campos.Values[ds_campo];
end;

procedure TFinApropriaCP.inserir;
var
   qyFinApropriaCP   : TUMZQuery;
   ds_campos         : string;
   ds_valores        : string;
begin
   ds_campos   := Self.retorna_campos();
   ds_valores  := Self.retorna_valores();

   try
      DM.CriarConsulta( qyFinApropriaCP );
      qyFinApropriaCP.Close();
      qyFinApropriaCP.SQL.Clear();
      qyFinApropriaCP.SQL.Add( 'INSERT INTO fin_apropria_cp ' );
      qyFinApropriaCP.SQL.Add( ds_campos );
      qyFinApropriaCP.SQL.Add( ' VALUES ' );
      qyFinApropriaCP.SQL.Add( ds_valores );
      qyFinApropriaCP.ExecSQL();
   except on E: EZDatabaseError do
      TrataErroBanco( qyFinApropriaCP, E );
   end;

   FreeAndNil( qyFinApropriaCP );
end;

function TFinApropriaCP.retorna_campos: string;
var
   i           : integer;
   ds_campos   : string;
begin
   ds_campos   := '( ';

   for i := 0 to Campos.Count - 1 do
   begin
      ds_campos := ds_campos + Campos.Names[i];

      if i <> Campos.Count - 1 then
      begin
         ds_campos := ds_campos + ', ';
      end;
   end;
   ds_campos := ds_campos + ' )';

   Result := ds_campos;
end;

function TFinApropriaCP.retorna_valores: string;
var
   i           : integer;
   ds_valores  : string;
begin
   ds_valores  := '( ''';

   for i := 0 to Campos.Count - 1 do
   begin
      ds_valores := ds_valores + Campos.ValueFromIndex[i];

      if i <> Campos.Count - 1 then
      begin
         ds_valores := ds_valores + ''', ''';
      end;
   end;
   ds_valores := ds_valores + ''' )';

   Result := ds_valores;
end;

procedure TFinApropriaCP.setValorCampo(ds_campo, ds_valor: string);
begin
   Campos.Values[ds_campo] := ds_valor;
end;

end.
