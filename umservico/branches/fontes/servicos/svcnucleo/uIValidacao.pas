unit uIValidacao;

interface

uses
   uDMConexao, uPessoaIntegra;

type

   IValidacao = interface

      { Propriedades necessárias }
      
      procedure SetConexao( const Value: TUMConexao );
      procedure SetPessoa( const Value: TPessoaIntegra );

      function GetConexao(): TUMConexao;
      function GetPessoa(): TPessoaIntegra;

      property Conexao: TUMConexao read GetConexao write SetConexao;
      property Pessoa: TPessoaIntegra read GetPessoa write SetPessoa;

      { Propriedades necessárias }

      { Função para validar o usuário. Esta função foi definida em interface
        pois cada tipo de integração pode validar a pessoa diferente. }

      function PreparaPessoa(var PessoaIntegracao : TPessoaIntegra): Boolean;
   end;

implementation

end.
