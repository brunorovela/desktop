unit uIntegracao;

interface

uses
   Classes, uDMConexao, uRegistraIntegracao, uPessoaIntegra, UZDataset, uIValidacao;

type

   TIntegracao = class
      strict private
         FConexao: TUMConexao;
         FValidacao: IValidacao;

         { Esta função vai percorrer todas pessoas, chamar validação
           relacionada a elas e após isso irá realizar o ato da
           integração no banco de dados }
         function ProcessaPessoas(): Boolean;

         { Getters and Setters }
         function GetPessoas(): TList;
         procedure SetPessoas( FPessoas: TList );

         function GetValidacao: IValidacao;
         procedure SetValidacao(const Value: IValidacao);
         { Getters and Setters }
      protected
         FPessoas: TList;

         { Inicia o processo de integração }
         procedure IniciaProcessoIntegracao(const FValidacao: IValidacao);

         property Pessoas: TList read GetPessoas write SetPessoas;
         property Validacao: IValidacao read GetValidacao write SetValidacao;

         { Getters and Setters }
         function GetConexao(): TUMConexao;
         procedure SetConexao( FConexao: TUMConexao );

      public
   end;

implementation

{ TIntegracao }

function TIntegracao.GetConexao: TUMConexao;
begin
   Result := Self.FConexao;
end;

function TIntegracao.GetPessoas: TList;
begin
   Result := Self.FPessoas;
end;

function TIntegracao.GetValidacao: IValidacao;
begin
   Result := Self.FValidacao;
end;

procedure TIntegracao.IniciaProcessoIntegracao(const FValidacao: IValidacao);
begin
   Self.Validacao := FValidacao;

   Self.ProcessaPessoas();
end;

function TIntegracao.ProcessaPessoas: Boolean;
var
   RegistraIntegracao: TRegistraIntegracao;
   i: Integer;
   PessoaAtual: TPessoaIntegra;
begin
   RegistraIntegracao := TRegistraIntegracao.Create(Self.GetConexao);

   for i := 0 to Self.GetPessoas.Count - 1 do
   begin
      PessoaAtual := TPessoaIntegra(Self.GetPessoas.Items[i]);

      if Self.GetValidacao.PreparaPessoa(PessoaAtual) then
      begin
         RegistraIntegracao.IntegrarPessoa(PessoaAtual);
      end;
   end;
end;

procedure TIntegracao.SetConexao(FConexao: TUMConexao);
begin
   Self.FConexao := FConexao;
end;

procedure TIntegracao.SetPessoas(FPessoas: TList);
begin
   Self.FPessoas := FPessoas;
end;

procedure TIntegracao.SetValidacao(const Value: IValidacao);
begin
   Self.FValidacao := Value;
end;

end.
