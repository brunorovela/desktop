unit uRegistraIntegracao;

interface

uses
   uDMConexao, uPessoaIntegra, Classes, uUteis, UZDataset, SysUtils, Windows;

const

   SQL_ALTERA_PESSOA = 'UPDATE pessoas SET %s';
   SQL_INSERE_PESSOA = 'INSERT INTO pessoas (%s) VALUES (%s)';

   SQL_INSERE_CONTATOS = 'INSERT INTO contatos_pessoas (cd_pessoa, cd_contato, ds_contato) VALUES (:cd_pessoa, :cd_contato, :ds_contato)';
   SQL_EXCLUI_CONTATOS = 'DELETE FROM contatos_pessoas WHERE cd_pessoa = :cd_pessoa AND cd_contato = :cd_contato';

   SQL_INSERE_GRUPOS = 'INSERT INTO nu_grupos_pessoas (cd_grupo, cd_pessoa, cd_coligada) VALUES (:cd_grupo, :cd_pessoa, :cd_coligada)';
   SQL_EXCLUI_GRUPOS = 'DELETE FROM nu_grupos_pessoas WHERE cd_pessoa = :cd_pessoa';

   SQL_BUSCA_GRUPO_DESTINO = 'SELECT cd_grupo FROM nu_grupos WHERE ds_nome_grupo = :nome_grupo';

type

   TRegistraIntegracao = class
      strict private

         FConexao: TUMConexao;
         FPessoa: TPessoaIntegra;

         { Funções de registrar no banco }

         procedure RegistraPessoa();
         procedure RegistraGruposPessoa();
         procedure RegistraContatosPessoas();

         { Deleta contatos da pessoa no banco de dados}
         procedure DeleteContatos( FTipoContato: Integer; FCodigoPessoa: Integer );

         { Delete os grupos da pessoa no banco de dados}
         procedure DeleteGruposPessoa( FCodigoPessoa: Integer );

         { Altera pessoa no banco de dados}
         procedure AlteraPessoa();

         { Insere pessoa no banco de dados }
         procedure InserePessoa();

         { Funções de registrar no banco de dados }


         function GetGrupoDestino(FGrupo : String; FChaveGrupo : String): Integer;


         {Getters and Setters}

         function GetConexao: TUMConexao;
         procedure SetConexao(const Value: TUMConexao);

         function GetPessoa: TPessoaIntegra;
         procedure SetPessoa(const Value: TPessoaIntegra);

         {Getters and Setters}

      public

         constructor Create( const Value: TUMConexao );

         { Função que inicia a integracao da pessoa no banco da dados }
         procedure IntegrarPessoa( FPessoaIntegra : TPessoaIntegra );

         property Conexao: TUMConexao read GetConexao write SetConexao;
         property Pessoa: TPessoaIntegra read GetPessoa write SetPessoa;

   end;


implementation

uses DB;

{ TRegistraIntegracao }

procedure TRegistraIntegracao.AlteraPessoa;
var
   i: Integer;
   qryAltera: TUMZQuery;
   Campos, Separador: String;
begin
   qryAltera := Self.Conexao.newQuery;

   for i := 0 to Self.GetPessoa.DadosPessoais.Count - 1 do
   begin
      Campos := Campos + Separador + Self.GetPessoa.DadosPessoais.Names[i] + ' = ' +
            QuotedStr(Self.GetPessoa.DadosPessoais.Values[Self.GetPessoa.DadosPessoais.Names[i]]);

      Separador := ', ';
   end;

   qryAltera.SQL.Text := Format(SQL_ALTERA_PESSOA, [Campos]);

   qryAltera.SQL.Add(' WHERE cd_pessoa = :cd_pessoa ');

   qryAltera.ParamByName('cd_pessoa').AsInteger := Self.GetPessoa.Codigo;

   qryAltera.ExecSQL;
end;

constructor TRegistraIntegracao.Create(const Value: TUMConexao);
begin
   Self.SetConexao(Value);
end;

procedure TRegistraIntegracao.DeleteContatos( FTipoContato: Integer; FCodigoPessoa: Integer );
var
   qryDeleteContatos: TUMZQuery;
begin
   qryDeleteContatos := Self.GetConexao.newQuery;

   qryDeleteContatos.SQL.Text := SQL_EXCLUI_CONTATOS;

   qryDeleteContatos.ParamByName('cd_pessoa').AsInteger := FCodigoPessoa;
   qryDeleteContatos.ParamByName('cd_contato').AsInteger := FTipoContato;

   qryDeleteContatos.ExecSQL;
end;

procedure TRegistraIntegracao.DeleteGruposPessoa(FCodigoPessoa: Integer);
var
   qryDeleteGrupos: TUMZQuery;
begin
   qryDeleteGrupos := Self.GetConexao.newQuery;

   qryDeleteGrupos.SQL.Text := SQL_EXCLUI_GRUPOS;

   qryDeleteGrupos.ParamByName('cd_pessoa').AsInteger :=
      FCodigoPessoa;

   qryDeleteGrupos.ExecSQL;
end;

function TRegistraIntegracao.GetConexao: TUMConexao;
begin
   Result := Self.FConexao;
end;

function TRegistraIntegracao.GetGrupoDestino(FGrupo,
  FChaveGrupo: String): Integer;
var
   qryGrupoDestino: TUMZQuery;
begin
   Result := 0;

   qryGrupoDestino := Self.GetConexao.newQuery;

   qryGrupoDestino.SQL.Text := SQL_BUSCA_GRUPO_DESTINO;

   qryGrupoDestino.ParamByName('nome_grupo').AsString :=
      FGrupo + ' ' + FChaveGrupo;

   qryGrupoDestino.Open;

   if not(qryGrupoDestino.IsEmpty) then
   begin
      Result := qryGrupoDestino.FieldByName('cd_grupo').AsInteger;
   end;
end;

function TRegistraIntegracao.GetPessoa: TPessoaIntegra;
begin
   Result := FPessoa;
end;

procedure TRegistraIntegracao.InserePessoa;
var
   i: Integer;
   qryInsere: TUMZQuery;
   Campos, Valores, Separador: String;
begin

   qryInsere := Self.Conexao.newQuery;

   for i := 0 to Self.GetPessoa.DadosPessoais.Count - 1 do
   begin
      Campos := Campos + Separador + Self.GetPessoa.DadosPessoais.Names[i];
      Valores := Valores + Separador + QuotedStr(Self.GetPessoa.DadosPessoais.Values[Self.GetPessoa.DadosPessoais.Names[i]]);

      Separador := ', ';
   end;

   qryInsere.SQL.Text := Format(SQL_INSERE_PESSOA, [Campos, Valores]);

   qryInsere.ExecSQL;
end;

procedure TRegistraIntegracao.IntegrarPessoa(FPessoaIntegra: TPessoaIntegra);
begin
   Self.FPessoa := FPessoaIntegra;
    
   Self.RegistraPessoa();
   Self.RegistraContatosPessoas();
   Self.RegistraGruposPessoa();
end;

procedure TRegistraIntegracao.RegistraContatosPessoas;
var
   i: Integer;
   qryContatos: TUMZQuery;
begin
   qryContatos := Self.GetConexao.newQuery;

   qryContatos.SQL.Text := SQL_INSERE_CONTATOS;

   for i := 0 to Self.GetPessoa.Contatos.Count - 1 do
   begin
      DeleteContatos(
         StrToInt(Self.GetPessoa.Contatos.Names[i]),
         Self.GetPessoa.Codigo
      );

      qryContatos.ParamByName('cd_pessoa').AsInteger   := Self.GetPessoa.Codigo;
      qryContatos.ParamByName('cd_contato').AsInteger  := StrToInt(Self.GetPessoa.Contatos.Names[i]);
      qryContatos.ParamByName('ds_contato').AsString   := Self.GetPessoa.Contatos.ValueFromIndex[i];

      qryContatos.ExecSQL;
   end;
end;

procedure TRegistraIntegracao.RegistraGruposPessoa;
var
   i, CodigoGrupo: Integer;
   qryGrupos: TUMZQuery;
begin

   qryGrupos := Self.GetConexao.newQuery;

   DeleteGruposPessoa(Self.GetPessoa.Codigo);

   for i := 0 to Self.GetPessoa.Grupos.Count - 1 do
   begin
      CodigoGrupo := GetGrupoDestino(
         Self.GetPessoa.Grupos.Strings[i],
         Self.GetPessoa.ChaveGruposDestino
      );

      if CodigoGrupo <> 0 then
      begin
         qryGrupos.SQL.Text := SQL_INSERE_GRUPOS;

         qryGrupos.ParamByName('cd_grupo').AsInteger := CodigoGrupo;
         qryGrupos.ParamByName('cd_pessoa').AsInteger := Self.GetPessoa.Codigo;
         qryGrupos.ParamByName('cd_coligada').AsInteger := 1;

         qryGrupos.ExecSQL;
      end;
   end;
end;

procedure TRegistraIntegracao.RegistraPessoa;
begin
   if Self.GetPessoa.MetodoInsercao = miInserir then
   begin
      InserePessoa;   
   end;

   if (Self.GetPessoa.MetodoInsercao = miAlterar) then
   begin
      AlteraPessoa;
   end;
end;

procedure TRegistraIntegracao.SetConexao(const Value: TUMConexao);
begin
   Self.FConexao := Value;
end;

procedure TRegistraIntegracao.SetPessoa(const Value: TPessoaIntegra);
begin
   Self.FPessoa := Value;
end;

end.
