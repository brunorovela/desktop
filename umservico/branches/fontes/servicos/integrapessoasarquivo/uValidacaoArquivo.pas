unit uValidacaoArquivo;

interface

uses
   Windows, uPessoaIntegra, uUteis, UZDataSet, SysUtils, uCFuncString,
   uDMConexao, uIValidacao;

const

   SQL_BUSCA_PESSOA_EXISTENTE_CODIGO = 'SELECT cd_pessoa FROM pessoas WHERE cd_pessoa = :cd_pessoa';
   SQL_BUSCA_PESSOA_EXISTENTE_CPF    = 'SELECT cd_pessoa FROM pessoas WHERE ds_cpf = :ds_cpf';

   SQL_BUSCA_CODIGO_POR_CPF = 'SELECT cd_pessoa FROM pessoas WHERE ds_cpf = :ds_cpf';

type

   TValidacaoArquivo = class(TInterfacedObject, IValidacao)
      strict private
         FPessoa: TPessoaIntegra;
         FConexao: TUMConexao;

         { Busca um código para a nova pessoa }
         function GetProximoCodigoPessoa(FChave: String): Integer;

         { Verifica se a pessoa existe na base destino }
         function VerificaPessoaExistente(): TTipoPessoaIntegracao;

         { Função usada para quando usuário vai realizar uma
           integração com base no CPF }
         function BuscaCodigoPessoa(FCPF: String): Integer;

      protected
         function PreparaPessoa(var PessoaIntegracao : TPessoaIntegra): Boolean;

         procedure SetConexao( const Value: TUMConexao );
         procedure SetPessoa( const Value: TPessoaIntegra );

         function GetPessoa(): TPessoaIntegra;
         function GetConexao(): TUMConexao;

      public
         constructor Create( FConexao: TUMConexao );
         
         property Pessoa: TPessoaIntegra read GetPessoa write SetPessoa;
         property Conexao: TUMConexao read GetConexao write SetConexao;
   end;

implementation

{ TValidaIntegracao }

function TValidacaoArquivo.BuscaCodigoPessoa(FCPF: String): Integer;
var
   qryBuscaCodigoPessoa: TUMZQuery;
begin
   qryBuscaCodigoPessoa := Self.GetConexao.newQuery;

   qryBuscaCodigoPessoa.SQL.Text := SQL_BUSCA_CODIGO_POR_CPF;

   qryBuscaCodigoPessoa.ParamByName('ds_cpf').AsString := FCPF;

   qryBuscaCodigoPessoa.Open;

   Result := qryBuscaCodigoPessoa.FieldByName('cd_pessoa').AsInteger;
end;

constructor TValidacaoArquivo.Create(FConexao: TUMConexao);
begin
   Self.SetConexao(FConexao);
end;

function TValidacaoArquivo.GetConexao: TUMConexao;
begin
   Result := Self.FConexao;
end;

function TValidacaoArquivo.GetPessoa: TPessoaIntegra;
begin
   Result := Self.FPessoa;
end;

function TValidacaoArquivo.GetProximoCodigoPessoa(FChave: String): Integer;
const
   SQL_GET_NOVO_CODIGO_PESSOA =
      ' SELECT GET_NOVO_CD_PESSOA( :chave_local_chamada ) AS cd_pessoa_novo ';
var
   qryGetNovoCodigoPessoa: TUMZQuery;
begin
   qryGetNovoCodigoPessoa := Self.GetConexao.newQuery;

   qryGetNovoCodigoPessoa.SQL.Text := SQL_GET_NOVO_CODIGO_PESSOA;

   try
      qryGetNovoCodigoPessoa.ParamByName( 'chave_local_chamada' ).AsString := FChave;

      qryGetNovoCodigoPessoa.Open;
      
      Result := qryGetNovoCodigoPessoa.FieldByName('cd_pessoa_novo').AsInteger;
   finally
      FreeAndNil( qryGetNovoCodigoPessoa );
   end;
end;

function TValidacaoArquivo.PreparaPessoa(var PessoaIntegracao : TPessoaIntegra): Boolean;
var
   TipoPessoaIntegracao: TTipoPessoaIntegracao;
   FCodigo: Integer;
begin
   Result := True;

   Self.SetPessoa(PessoaIntegracao);

   TipoPessoaIntegracao := VerificaPessoaExistente();
   
   if TipoPessoaIntegracao = tpiCodigo then
   begin
      Self.GetPessoa.MetodoInsercao := miAlterar;
   end;

   if TipoPessoaIntegracao = tpiCPF then
   begin
      Self.GetPessoa.Codigo :=
         BuscaCodigoPessoa(Self.GetPessoa.CPF);

      Self.GetPessoa.MetodoInsercao := miAlterar;
   end;

   if TipoPessoaIntegracao = tpiNaoExistente then
   begin
      FCodigo := GetProximoCodigoPessoa(Self.GetPessoa.ChaveNovoCodigo);

      Self.GetPessoa.Codigo := FCodigo;

      Self.GetPessoa.MetodoInsercao := miInserir;
   end;

   { Caso exista uma pessoa com o mesmo CPF na base destino quando o CPF for
     inválido. Ex: 000.000.000.00 }
   if TipoPessoaIntegracao = tpiCPFInvalido then
   begin
      Result := False;
   end;
end;

procedure TValidacaoArquivo.SetConexao( const Value: TUMConexao );
begin
   Self.FConexao := Value;
end;

procedure TValidacaoArquivo.SetPessoa( const Value: TPessoaIntegra );
begin
   Self.FPessoa := Value;
end;

function TValidacaoArquivo.VerificaPessoaExistente: TTipoPessoaIntegracao;
var
   qryVerificaPessoaExistente: TUMZQuery;
begin

   Result := tpiNaoExistente;
   
   qryVerificaPessoaExistente := Self.GetConexao.newQuery;

   qryVerificaPessoaExistente.SQL.Text := SQL_BUSCA_PESSOA_EXISTENTE_CODIGO;

   qryVerificaPessoaExistente.ParamByName('cd_pessoa').AsInteger :=
      StrToIntDef(Self.GetPessoa.DadosPessoais.Values['cd_pessoa'], 0);

   qryVerificaPessoaExistente.Open;

   if (qryVerificaPessoaExistente.RecordCount > 0) and
      (Self.GetPessoa.DadosPessoais.Values['cd_pessoa'] <> '0') then
   begin
      Result := tpiCodigo;
      Exit;
   end;

   qryVerificaPessoaExistente.Close;

   qryVerificaPessoaExistente.Params.Clear;

   qryVerificaPessoaExistente.SQL.Text := SQL_BUSCA_PESSOA_EXISTENTE_CPF;

   qryVerificaPessoaExistente.ParamByName('ds_cpf').AsString :=
      Self.GetPessoa.DadosPessoais.Values['ds_cpf'];

   qryVerificaPessoaExistente.Open;

   if (TFuncString.ValidaCPF(Self.GetPessoa.DadosPessoais.Values['ds_cpf'])) and
      (qryVerificaPessoaExistente.RecordCount > 0) then
   begin
      Result := tpiCPF;
      Exit;
   end;

   if not(TFuncString.ValidaCPF(Self.GetPessoa.DadosPessoais.Values['ds_cpf'])) and
      not(qryVerificaPessoaExistente.IsEmpty) then
   begin
      Result := tpiCPFInvalido;
      Exit;
   end;
end;

end.