unit uUteis;

interface

uses
   Classes;

const
   MSG_CONEXAO_INVALIDA = 'Não foi possível conectar com o banco de dados: %s';

type

   TTipoPessoaIntegracao = (
      tpiCPF = 1,
      tpiCodigo = 2,
      tpiNaoExistente = 3,
      tpiCPFInvalido = 4
   );

   TMetodoInsercao = (
      miInserir = 1,
      miAlterar = 2
   );

   TDadosPessoa = record
      Grupos: TStringList;
      Contatos: TStringList;
      Dados: TStringList;
      ChaveGrupo: String;
      ChaveNovoCodigo: String;
   end;

implementation

end.
