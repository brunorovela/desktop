unit uItemCombo;

interface

Type
   TItemCombo = class(TObject)

   private
      sCodigo      : string;
      sDescricao   : string;
      vVariavel    : Variant;
   protected

   public
      constructor Create( codigo: string; descricao: string);overload;
      constructor Create( codigo: string; descricao: string; variavel: Variant );overload;
      destructor Destroy; override;
      function getCodigo(): string;
      procedure setCodigo(sValor: string);
      function getDescricao(): string;
      procedure setDescricao(sValor: string);
      function getVariavel(): Variant;
      procedure setVariavel(vValor: Variant);

      property codigo: string read getCodigo write setCodigo;
      property descricao: string read getDescricao write setDescricao;
      property variavel: Variant read getVariavel write setVariavel;
end;

implementation

{ TItem }

constructor TItemCombo.Create( codigo: string; descricao: string );
begin
   Self.setCodigo(codigo);
   Self.setDescricao(descricao);
end;

procedure TItemCombo.setCodigo(sValor: string);
begin
   sCodigo := sValor;
end;

function TItemCombo.getCodigo: string;
begin
   Result := sCodigo;
end;

function TItemCombo.getDescricao: string;
begin
   Result := sDescricao;
end;

function TItemCombo.getVariavel: Variant;
begin
   Result := vVariavel;
end;

procedure TItemCombo.setDescricao(sValor: string);
begin
   sDescricao := sValor;
end;

procedure TItemCombo.setVariavel(vValor: Variant);
begin
   vVariavel := vValor;
end;

constructor TItemCombo.Create(codigo, descricao: string; variavel: Variant);
begin
   Self.Create(codigo, descricao);
   Self.setVariavel(variavel);
end;

destructor TItemCombo.Destroy;
begin
  inherited;
end;

end.
