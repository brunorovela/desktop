unit uItemCompromisso;

interface

Type
   TItemCompromisso = class(TObject)

   private
      sCodigo      : string;
      sDescricao   : string;
   protected

   public
      constructor Create( codigo: string; descricao: string);
      destructor Destroy; override;
      function getCodigo(): string;
      procedure setCodigo(sValor: string);
      function getDescricao(): string;
      procedure setDescricao(sValor: string);

      property codigo: string read getCodigo write setCodigo;
      property descricao: string read getDescricao write setDescricao;
end;

implementation

{ TItem }

constructor TItemCompromisso.Create( codigo: string; descricao: string);
begin
   Self.setCodigo(codigo);
   Self.setDescricao(descricao);
end;

procedure TItemCompromisso.setCodigo(sValor: string);
begin
   sCodigo := sValor;
end;

function TItemCompromisso.getCodigo: string;
begin
   Result := sCodigo;
end;

function TItemCompromisso.getDescricao: string;
begin
   Result := sDescricao;
end;

procedure TItemCompromisso.setDescricao(sValor: string);
begin
   sDescricao := sValor;
end;

destructor TItemCompromisso.Destroy;
begin
  inherited;
end;

end.
