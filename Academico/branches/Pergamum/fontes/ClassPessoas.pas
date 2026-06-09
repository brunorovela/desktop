unit ClassPessoas;

interface

uses
   SysUtils, Classes, UZDataSet;

type
   TClassePessoas = class(TObject)
      public
         function GetNome( const cd_pessoa: Integer ): String;
         function IsPessoaJuridica( const cd_pessoa: Integer ): Boolean;
         function HasEmailDuplicado( const cd_pessoa: Integer; const ds_email: String ): Boolean;
         function HasMatriculaDuplicada( const cd_pessoa: Integer; const ds_matricula: String ): Boolean;
   end;

var
   ClassePessoas: TClassePessoas;

implementation

uses uDM, DB;

{ TClassePessoas }

{ TClassePessoas }

function TClassePessoas.GetNome(const cd_pessoa: Integer): String;
const
   SQL_GET_NOME = 'SELECT nm_pessoa FROM pessoas WHERE cd_pessoa = :cd_pessoa';
var
   qyGetNome: TUMZQuery;
begin
   DM.CriarConsulta(qyGetNome);
   qyGetNome.Close();
   qyGetNome.SQL.Text := SQL_GET_NOME;
   qyGetNome.ParamByName('cd_pessoa').AsInteger := cd_pessoa;
   qyGetNome.Open();

   Result := qyGetNome.FieldByName('nm_pessoa').AsString;

   FreeAndNil(qyGetNome);
end;

function TClassePessoas.HasEmailDuplicado(const cd_pessoa: Integer; const ds_email: String): Boolean;
const
   SQL_HAS_EMAIL_DUPLICADO =
      ' SELECT COUNT(*) AS registros FROM contatos_pessoas ' +
      ' WHERE cd_contato = 4 AND ds_contato = :ds_email AND cd_pessoa != :cd_pessoa ';
var
   qyHasEmailDuplicado : TUMZReadOnlyQuery;
begin
   DM.CriarConsulta(qyHasEmailDuplicado);

   qyHasEmailDuplicado.SQL.Text := SQL_HAS_EMAIL_DUPLICADO;
   qyHasEmailDuplicado.ParamByName('ds_email').AsString := ds_email;
   qyHasEmailDuplicado.ParamByName('cd_pessoa').AsInteger := cd_pessoa;
   qyHasEmailDuplicado.Open();

   Result := qyHasEmailDuplicado.FieldByName('registros').AsInteger > 0;
   FreeAndNil(qyHasEmailDuplicado);
end;

function TClassePessoas.HasMatriculaDuplicada(const cd_pessoa: Integer;
  const ds_matricula: String): Boolean;
const
   SQL_HAS_MATICULA_DUPLICADA =
      ' SELECT COUNT(*) AS registros FROM pessoas '+
      ' WHERE ds_matricula = :ds_matricula AND cd_pessoa != :cd_pessoa ';
var
   qyHasmatriculaDuplicada : TUMZReadOnlyQuery;
begin
   DM.CriarConsulta(qyHasmatriculaDuplicada);

   qyHasmatriculaDuplicada.SQL.Text := SQL_HAS_MATICULA_DUPLICADA;
   qyHasmatriculaDuplicada.ParamByName('ds_matricula').AsString := ds_matricula;
   qyHasmatriculaDuplicada.ParamByName('cd_pessoa').AsInteger := cd_pessoa;
   qyHasmatriculaDuplicada.Open();

   Result := qyHasmatriculaDuplicada.FieldByName('registros').AsInteger > 0;
   FreeAndNil(qyHasmatriculaDuplicada);
end;

function TClassePessoas.IsPessoaJuridica(const cd_pessoa: Integer): Boolean;
const
   SQL_IS_PESSOA_JURIDICA = ' SELECT COUNT(*) AS registros FROM pessoas ' +
                            ' WHERE cd_pessoa = :cd_pessoa AND tp_pessoa = ''S'' ';
var
   qyIsPessoaJuridica: TUMZQuery;
begin
   DM.CriarConsulta(qyIsPessoaJuridica);
   qyIsPessoaJuridica.Close();
   qyIsPessoaJuridica.SQL.Text := SQL_IS_PESSOA_JURIDICA;
   qyIsPessoaJuridica.ParamByName('cd_pessoa').AsInteger := cd_pessoa;
   qyIsPessoaJuridica.Open();

   Result := ( qyIsPessoaJuridica.FieldByName('registros').AsInteger = 1 );

   FreeAndNil(qyIsPessoaJuridica);
end;

end.
