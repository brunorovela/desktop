unit uItemComboMensalidadeCaixa;

interface

Type
   TItemComboMCaixa = class(TObject)

   private
      sCodigo      : string;
      sDescricao   : string;
      sSnPadrao    : string;
      iCdColigada  : integer;
   protected

   public
      constructor Create( codigo: string; descricao: string; padrao: string; coligada: integer);
      destructor Destroy; override;
      function getCodigo(): string;
      procedure setCodigo(sValor: string);
      function getDescricao(): string;
      procedure setDescricao(sValor: string);
      function getSnPadrao(): string;
      procedure setSnPadrao(sValor: string);
      function getCdColigada(): integer;
      procedure setCdColigada(sValor: integer);

      property codigo: string read getCodigo write setCodigo;
      property descricao: string read getDescricao write setDescricao;
      property padrao: string read getSnPadrao write setSnPadrao;
      property coligada: integer read getCdColigada write setCdColigada;
end;

implementation

{ TItem }

constructor TItemComboMCaixa.Create( codigo: string; descricao: string; padrao: string; coligada: integer);
begin
   Self.setCodigo(codigo);
   Self.setDescricao(descricao);
   Self.setSnPadrao(padrao);
   Self.setCdColigada(coligada);
end;

procedure TItemComboMCaixa.setCdColigada(sValor: integer);
begin
   Self.iCdColigada := sValor;
end;

procedure TItemComboMCaixa.setCodigo(sValor: string);
begin
   sCodigo := sValor;
end;

function TItemComboMCaixa.getCdColigada: integer;
begin
   Result := Self.iCdColigada;
end;

function TItemComboMCaixa.getCodigo: string;
begin
   Result := sCodigo;
end;

function TItemComboMCaixa.getDescricao: string;
begin
   Result := sDescricao;
end;

function TItemComboMCaixa.getSnPadrao: string;
begin
   Result := sSnPadrao;
end;

procedure TItemComboMCaixa.setDescricao(sValor: string);
begin
   sDescricao := sValor;
end;

procedure TItemComboMCaixa.setSnPadrao(sValor: string);
begin
   sSnPadrao := sValor;
end;

destructor TItemComboMCaixa.Destroy;
begin
  inherited;
end;

end.
