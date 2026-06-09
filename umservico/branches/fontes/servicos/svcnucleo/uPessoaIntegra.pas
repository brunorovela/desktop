unit uPessoaIntegra;

interface

uses
   Classes, uUteis, SysUtils;

type

   TPessoaIntegra = class

      strict private
         FGrupos: TStringList;
         FChaveGruposDestino: String;
         FContatos: TStringList;
         FDadosPessoais: TStringList;
         FMetodoInsercao: TMetodoInsercao;
         FCodigo: Integer;
         FChaveNovoCodigo: String;
         FCPF: String;

         function CarregaDadosPessoa(const FDados: TDadosPessoa) : boolean;

         { Getters and Setters }
         function GetGrupos: TStringList;
         procedure SetGrupos( FGrupos: TStringList );

         function GetChaveGruposDestino: String;
         procedure SetChaveGruposDestino(const Value: String);

         function GetContatos: TStringList;
         procedure SetContatos(const Value: TStringList);

         function GetDadosPessoais: TStringList;
         procedure SetDadosPessoais(const Value: TStringList);

         function GetMetodoInsercao: TMetodoInsercao;
         procedure SetMetodoInsercao(const Value: TMetodoInsercao);

         function GetCodigo(): Integer;
         procedure SetCodigo(const Value: Integer);

         function GetCPF(): String;
         procedure SetCPF(const Value: String);

         function GetChaveNovoCodigo(): String;
         procedure SetChaveNovoCodigo(const Value: String);


      public
         constructor Create(const FDados: TDadosPessoa);

         property Grupos: TStringList read GetGrupos write SetGrupos;
         property ChaveGruposDestino: String read GetChaveGruposDestino write SetChaveGruposDestino;
         property Contatos: TStringList read GetContatos write SetContatos;
         property DadosPessoais: TStringList read GetDadosPessoais write SetDadosPessoais;
         property MetodoInsercao: TMetodoInsercao read GetMetodoInsercao write SetMetodoInsercao;
         property Codigo: Integer read GetCodigo write SetCodigo;
         property CPF: String read GetCPF write SetCPF;
         property ChaveNovoCodigo: String read GetChaveNovoCodigo write SetChaveNovoCodigo;
   end;

implementation

{ TPessoaIntegra }

function TPessoaIntegra.CarregaDadosPessoa(const FDados: TDadosPessoa): boolean;
begin
   { Grupos da pessoa }   
   Self.Grupos := FDados.Grupos;

   { Chave usada para definir QUAIS grupos destino da pessoa }
   Self.ChaveGruposDestino := FDados.ChaveGrupo;

   { Chave usada para usar na busca de um novo codigo }
   Self.ChaveNovoCodigo := FDados.ChaveNovoCodigo;

   { Contatos da pessoa }
   Self.Contatos := FDados.Contatos;

   { Dados da pessoa }
   Self.DadosPessoais := FDados.Dados;
end;

constructor TPessoaIntegra.Create(const FDados: TDadosPessoa);
begin
   Self.CarregaDadosPessoa(FDados);
end;

function TPessoaIntegra.GetChaveGruposDestino: String;
begin
   Result := Self.FChaveGruposDestino;
end;

function TPessoaIntegra.GetChaveNovoCodigo: String;
begin
   Result := Self.FChaveNovoCodigo;
end;

function TPessoaIntegra.GetCodigo: Integer;
begin
   Result := StrToInt(Self.FDadosPessoais.Values['cd_pessoa']);
end;

function TPessoaIntegra.GetContatos: TStringList;
begin
   Result := Self.FContatos;
end;

function TPessoaIntegra.GetCPF: String;
begin
   Result := Self.DadosPessoais.Values['ds_cpf'];
end;

function TPessoaIntegra.GetDadosPessoais: TStringList;
begin
   Result := Self.FDadosPessoais;
end;

function TPessoaIntegra.GetGrupos: TStringList;
begin
   Result := Self.FGrupos;
end;

function TPessoaIntegra.GetMetodoInsercao: TMetodoInsercao;
begin
   Result := Self.FMetodoInsercao;
end;

procedure TPessoaIntegra.SetChaveGruposDestino(const Value: String);
begin
   Self.FChaveGruposDestino := Value;
end;

procedure TPessoaIntegra.SetChaveNovoCodigo(const Value: String);
begin
   Self.FChaveNovoCodigo := Value;
end;

procedure TPessoaIntegra.SetCodigo(const Value: Integer);
begin
  Self.FDadosPessoais.Values['cd_pessoa'] := IntToStr(Value);
end;

procedure TPessoaIntegra.SetContatos(const Value: TStringList);
begin
   Self.FContatos := Value;
end;

procedure TPessoaIntegra.SetCPF(const Value: String);
begin
  Self.FDadosPessoais.Values['ds_cpf'] := Value;
end;

procedure TPessoaIntegra.SetDadosPessoais(const Value: TStringList);
begin
   Self.FDadosPessoais := Value;
end;

procedure TPessoaIntegra.SetGrupos(FGrupos: TStringList);
begin
   Self.FGrupos := FGrupos;
end;

procedure TPessoaIntegra.SetMetodoInsercao(const Value: TMetodoInsercao);
begin
   Self.FMetodoInsercao := Value;
end;

end.
