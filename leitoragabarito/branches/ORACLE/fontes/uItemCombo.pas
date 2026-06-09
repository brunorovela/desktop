unit uItemCombo;

interface

Type
   TItemCombo = class(TObject)

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

constructor TItemCombo.Create( codigo: string; descricao: string);
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

procedure TItemCombo.setDescricao(sValor: string);
begin
   sDescricao := sValor;
end;

destructor TItemCombo.Destroy;
begin
  inherited;
end;

end.
