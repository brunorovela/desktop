unit uOpcoesItens;

interface

Type
   TOpcoesItens= class(TObject)

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

constructor TOpcoesItens.Create( codigo: string; descricao: string);
begin
   Self.setCodigo(codigo);
   Self.setDescricao(descricao);
end;

procedure TOpcoesItens.setCodigo(sValor: string);
begin
   sCodigo := sValor;
end;

function TOpcoesItens.getCodigo: string;
begin
   Result := sCodigo;
end;

function TOpcoesItens.getDescricao: string;
begin
   Result := sDescricao;
end;

procedure TOpcoesItens.setDescricao(sValor: string);
begin
   sDescricao := sValor;
end;

destructor TOpcoesItens.Destroy;
begin
  inherited;
end;

end.
