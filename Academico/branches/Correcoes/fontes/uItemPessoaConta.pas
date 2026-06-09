unit uItemPessoaConta;

interface

Type
   TItemPessoaConta = class(TObject)

   private
      scd_pessoa        : string;
      snr_banco         : string;
      snr_agencia       : string;
      snr_dig_agencia   : string;
      snr_conta         : string;
      snr_dig_conta     : string;
      snr_dif_ag_conta  : string;
   protected

   public
      constructor Create( cd_pessoa: string; nr_banco: string; nr_agencia: string;
      nr_dig_agencia: string ; nr_conta: string; nr_dig_conta: string;
      nr_dif_agencia_conta: string );

      destructor Destroy; override;

      procedure setCdPessoa(sValor: string);
      procedure setNrBanco(sValor: string);
      procedure setNrAgencia(sValor: string);
      procedure setNrDigAgencia(sValor: string);
      procedure setNrConta(sValor: string);
      procedure setNrDigConta(sValor: string);
      procedure setNrDifAgenciaConta(sValor: string);

      function getCdPessoa(): string;
      function getNrBanco(): string;
      function getNrAgencia(): string;
      function getNrDigAgencia(): string;
      function getNrConta(): string;
      function getNrDigConta(): string;
      function getNrDifAgenciaConta(): string;

      property cd_pessoa:        string   read getCdPessoa          write setCdPessoa;
      property nr_banco:         string   read getNrBanco           write setNrBanco;
      property nr_agencia:       string   read getNrAgencia         write setNrAgencia;
      property nr_dig_agencia:   string   read getNrDigAgencia      write setNrDigAgencia;
      property nr_conta:         string   read getNrConta           write setNrConta;
      property nr_dig_conta:     string   read getNrDigConta        write setNrDigConta;
      property nr_dif_ag_conta:  string   read getNrDifAgenciaConta write setNrDifAgenciaConta;
end;

implementation

{ TItem }

constructor TItemPessoaConta.Create( cd_pessoa: string; nr_banco: string; nr_agencia: string;
      nr_dig_agencia: string ; nr_conta: string; nr_dig_conta: string;
      nr_dif_agencia_conta: string);
begin
   Self.setCdPessoa ( cd_pessoa );
   Self.setNrBanco ( nr_banco );
   Self.setNrAgencia ( nr_agencia );
   Self.setNrDigAgencia ( nr_dig_agencia );
   Self.setNrConta ( nr_conta );
   Self.setNrDigConta ( nr_dig_conta );
   Self.setNrDifAgenciaConta ( nr_dif_agencia_conta );
end;

destructor TItemPessoaConta.Destroy;
begin
  inherited;
end;

function TItemPessoaConta.getCdPessoa: string;
begin
   Result := Self.scd_pessoa;
end;

function TItemPessoaConta.getNrAgencia: string;
begin
   Result := Self.snr_agencia;
end;

function TItemPessoaConta.getNrBanco: string;
begin
   Result := Self.snr_banco;
end;

function TItemPessoaConta.getNrConta: string;
begin
   Result := Self.snr_conta;
end;

function TItemPessoaConta.getNrDigAgencia: string;
begin
   Result := Self.snr_dig_agencia;
end;

function TItemPessoaConta.getNrDifAgenciaConta: string;
begin
   Result := Self.snr_dif_ag_conta;
end;

function TItemPessoaConta.getNrDigConta: string;
begin
   Result := Self.snr_dig_conta;
end;

procedure TItemPessoaConta.setCdPessoa(sValor: string);
begin
   Self.scd_pessoa := sValor;
end;

procedure TItemPessoaConta.setNrAgencia(sValor: string);
begin
   Self.snr_agencia := sValor;
end;

procedure TItemPessoaConta.setNrBanco(sValor: string);
begin
   Self.snr_banco := sValor;
end;

procedure TItemPessoaConta.setNrConta(sValor: string);
begin
   Self.snr_conta := sValor;
end;

procedure TItemPessoaConta.setNrDigAgencia(sValor: string);
begin
   Self.snr_dig_agencia := sValor;
end;

procedure TItemPessoaConta.setNrDifAgenciaConta(sValor: string);
begin
   Self.snr_dif_ag_conta := sValor;
end;

procedure TItemPessoaConta.setNrDigConta(sValor: string);
begin
   Self.snr_dig_conta := sValor;
end;

end.
