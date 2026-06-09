unit ClassRegistros;

interface

uses SysUtils, Classes, UZDataset, DB, Dialogs, DBClient, Variants;

type
   TValores = array  of Variant;

   TSalvaValor = class(TObject)
      protected
         aux: TValores;
      public
         constructor Create(Value: TValores); overload;
         property Value: TValores read aux;
   end;

   ClasseRegistros = class(TObject)
      private
         arrDados: TStringList;
         arrCampos: TStringList;
         linhaAtual, ultimoCampo: Integer;

         procedure SetLinhaAtual(const Value: Integer);
         procedure SetValorFromCampo(campo: String; const Value: Variant);
         function GetValorFromCampo(campo: String): Variant;
         function GetValorFromCampoInt(campo: String): Integer;
         function GetValorFromCampoDouble(campo: String): Double;

         // Verificações 
         function IsNull( const valor: Variant ): Boolean;

         procedure CarregarCampos( var query: TUMZQuery ); overload;
         procedure CarregarCampos( var query: TClientDataSet ); overload;
         procedure CarregarRegistros( var query: TUMZQuery ); overload;
         procedure CarregarRegistros( var query: TClientDataSet ); overload;

         // Função responsável por retornar o arrDados.Count
         function GetQtdRegistros: Integer;

      public
         // Inicia/Zera a classe de registros
         constructor Create(); overload;

         // Função que retorna se está no fim dos registros
         function IsFim(): Boolean;
         procedure Primeiro();
         procedure Proximo();

         // Carrega uma query na classe
         procedure CarregarQuery( var query: TUMZQuery ); overload;
         procedure CarregarQuery( var query: TClientDataSet ); overload;

         // Retorna tipos
         function IsBooleano( const valor: Variant ): Boolean;

         property QtdRegistros: Integer read GetQtdRegistros;
         property Campo[campo: String]: Variant read GetValorFromCampo write SetValorFromCampo;
         property CampoInt[campo: String]: Integer read GetValorFromCampoInt;
         property CampoDouble[campo: String]: Double read GetValorFromCampoDouble;
         property RecNo: Integer read linhaAtual write SetLinhaAtual;
   end;

implementation

{ ClasseRegistros }

procedure ClasseRegistros.CarregarCampos(var query: TUMZQuery);
var
   I: Integer;
begin
   arrCampos.Clear();

   for I := 0 to query.FieldCount - 1 do
      arrCampos.Values[query.Fields.Fields[I].FieldName] := IntToStr(I);

   ultimoCampo := query.FieldCount-1;
end;

procedure ClasseRegistros.CarregarQuery(var query: TUMZQuery);
begin
   // Carrega os campos na classe
   Self.CarregarCampos(query);

   // Carrega os trgistros na classe
   Self.CarregarRegistros(query);

   if ( arrDados.Count > 0 ) then
      linhaAtual := 1;     
end;

procedure ClasseRegistros.CarregarCampos(var query: TClientDataSet);
var
   I: Integer;
begin
   arrCampos.Clear();

   for I := 0 to query.FieldCount - 1 do
      arrCampos.Values[query.Fields.Fields[I].FieldName] := IntToStr(I);

   ultimoCampo := query.FieldCount-1;
end;

procedure ClasseRegistros.CarregarQuery(var query: TClientDataSet);
begin
   // Carrega os campos na classe
   Self.CarregarCampos(query);

   // Carrega os trgistros na classe
   Self.CarregarRegistros(query);

   if ( arrDados.Count > 0 ) then
      linhaAtual := 1;
end;

procedure ClasseRegistros.CarregarRegistros(var query: TClientDataSet);
var
   registro: TValores;
   nomeCampo: string;
   I: Integer;
begin
   arrDados.Clear();

   query.DisableControls;
   query.First();
   while not query.Eof do
   begin
      SetLength( registro, arrCampos.Count );

      for I := 0 to arrCampos.Count - 1 do
      begin
         nomeCampo := query.Fields.Fields[I].FieldName;

         registro[StrToInt(arrCampos.Values[nomeCampo])] := query.FieldByName(nomeCampo).AsVariant;
      end;

      arrDados.AddObject(IntToStr(query.RecNo), TSalvaValor.Create(registro) );

      query.Next();
   end;
   query.EnableControls;
end;

procedure ClasseRegistros.CarregarRegistros(var query: TUMZQuery);
var
   registro: TValores;
   nomeCampo: string;
   I: Integer;
begin
   arrDados.Clear();

   query.DisableControls;
   query.First();
   while not query.Eof do
   begin
      SetLength( registro, arrCampos.Count );

      for I := 0 to arrCampos.Count - 1 do
      begin
         nomeCampo := query.Fields.Fields[I].FieldName;

         registro[StrToInt(arrCampos.Values[nomeCampo])] := query.FieldByName(nomeCampo).AsVariant;
      end;

      arrDados.AddObject(IntToStr(query.RecNo), TSalvaValor.Create(registro) );

      query.Next();
   end;
   query.EnableControls;
end;

constructor ClasseRegistros.Create;
begin
   inherited Create;

   arrCampos := TStringList.Create();
   arrDados := TStringList.Create();
   linhaAtual := 0;
end;

function ClasseRegistros.GetQtdRegistros: Integer;
begin
   Result := arrDados.Count;
end;

function ClasseRegistros.GetValorFromCampoInt(campo: String): Integer;
begin
   Result := StrToInt( VarToStr( GetValorFromCampo( campo ) ) )
end;

function ClasseRegistros.GetValorFromCampoDouble(campo: String): Double;
begin
   Result := StrToFloat( VarToStr( GetValorFromCampo( campo ) ) );
end;

function ClasseRegistros.GetValorFromCampo(campo: String): Variant;
var
   registro: TValores;
   val: Variant;
begin
   if ( linhaAtual = 0 ) then
      Exit;

   registro := TSalvaValor(arrDados.Objects[linhaAtual-1]).aux;

   val := registro[StrToInt(arrCampos.Values[campo])];

   if ( IsNull( val ) ) then
      val := '';   

   Result := val;
end;

function ClasseRegistros.IsBooleano(const valor: Variant): Boolean;
begin
   Result := ( valor = '1' ) OR ( valor = 'S' );
end;

function ClasseRegistros.IsFim: Boolean;
begin
   Result := ( linhaAtual = 0 ) OR ( linhaAtual > QtdRegistros );
end;

function ClasseRegistros.IsNull(const valor: Variant): Boolean;
begin
   Result := ( VarIsNull( valor ) );
end;

procedure ClasseRegistros.Primeiro;
begin
   if ( QtdRegistros > 0 ) then
      linhaAtual := 1
   else
      linhaAtual := 0;     
end;

procedure ClasseRegistros.Proximo;
begin
   if ( linhaAtual = 0 ) OR ( linhaAtual = QtdRegistros+1 ) then
      Exit;

   Inc(linhaAtual);         
end;

procedure ClasseRegistros.SetLinhaAtual(const Value: Integer);
begin
   Self.linhaAtual := Value;
end;

procedure ClasseRegistros.SetValorFromCampo(campo: String;
  const Value: Variant);
var
   registro: TValores;
   nro_campo: Integer;
begin
   if ( linhaAtual = 0 ) then
      Exit;

   registro := TSalvaValor(arrDados.Objects[linhaAtual-1]).aux;

   if ( not TryStrToInt( arrCampos.Values[campo], nro_campo ) ) then
   begin
      Inc(ultimoCampo);
      arrCampos.Values[campo] := IntToStr(ultimoCampo);
      SetLength( registro, arrCampos.Count );
   end;

   registro[StrToInt(arrCampos.Values[campo])] := Value;

   TSalvaValor(arrDados.Objects[linhaAtual-1]).aux := registro;
end;

{ TSalvaValor }

constructor TSalvaValor.Create(Value: TValores);
begin
   Self.aux := Value;
end;

end.
