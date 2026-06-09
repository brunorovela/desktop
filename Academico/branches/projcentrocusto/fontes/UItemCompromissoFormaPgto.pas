unit UItemCompromissoFormaPgto;

interface

Type
   TItemCompromissoFormaPgto = class(TObject)

   private
      sCodigo      : string;
      sDescricao   : string;
      sChave       : string;
   protected

   public
      constructor Create( codigo: string; descricao: string; chave: string);
      destructor Destroy; override;
      function getCodigo(): string;
      procedure setCodigo(sValor: string);
      function getDescricao(): string;
      procedure setDescricao(sValor: string);
      function getChave(): string;
      procedure setChave(sValor: string);

      property codigo: string read getCodigo write setCodigo;
      property descricao: string read getDescricao write setDescricao;
      property chave: string read getChave write setChave;
end;

implementation

{ TItemCompromissoFormaPgto }

constructor TItemCompromissoFormaPgto.Create(codigo, descricao: string; chave: string);
begin
   Self.setCodigo(codigo);
   Self.setDescricao(descricao);
   Self.setChave(chave);
end;

destructor TItemCompromissoFormaPgto.Destroy;
begin
  inherited;
end;

function TItemCompromissoFormaPgto.getChave: string;
begin
   Result := Self.sChave;
end;

function TItemCompromissoFormaPgto.getCodigo: string;
begin
   Result := Self.sCodigo;
end;

function TItemCompromissoFormaPgto.getDescricao: string;
begin
   Result := Self.sDescricao;
end;

procedure TItemCompromissoFormaPgto.setChave(sValor: string);
begin
   sChave := sValor;
end;

procedure TItemCompromissoFormaPgto.setCodigo(sValor: string);
begin
   sCodigo := sValor;
end;

procedure TItemCompromissoFormaPgto.setDescricao(sValor: string);
begin
   sDescricao := sValor;
end;

end.
