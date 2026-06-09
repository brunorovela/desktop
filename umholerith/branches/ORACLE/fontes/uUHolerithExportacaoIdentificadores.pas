unit uUHolerithExportacaoIdentificadores;

interface

uses uPessoa;

type
   IRequerPessoa = interface['{532617F7-0C19-415B-91F4-C259E7906A97}']
      function GetPessoa(): TPessoa; overload;
   end;

   TIdentificadorPessoa = class(TInterfacedObject, IRequerPessoa)
      strict private
         cd_pessoa : Integer;

      public
         constructor Create(const cd_pessoa : Integer);

         function GetPessoa(): TPessoa; overload;
   end;

   TIdentificadorCPF = class(TInterfacedObject, IRequerPessoa)
      strict private
         ds_cpf : String;

      public
         constructor Create(const ds_cpf : String);

         function GetPessoa(): TPessoa; overload;
   end;

   TIdentificadorExterno = class(TInterfacedObject, IRequerPessoa)
      strict private
         cd_pessoa_externa : Integer;
         ds_chave_sistema : String;

      public
         constructor Create(const cd_pessoa_externa : Integer; const ds_chave_sistema: String);

         function GetPessoa(): TPessoa; overload;
   end;

implementation

uses uLoginManager, UZDataset, SysUtils, DB;

{ TIdentificadorPessoa }

constructor TIdentificadorPessoa.Create(const cd_pessoa: Integer);
begin
   Self.cd_pessoa := cd_pessoa;
end;

function TIdentificadorPessoa.GetPessoa: TPessoa;
begin
   Result := TPessoa.Create(Self.cd_pessoa);
end;

{ TIdentificadorCPF }

constructor TIdentificadorCPF.Create(const ds_cpf: String);
begin
   Self.ds_cpf := ds_cpf;
end;

function TIdentificadorCPF.GetPessoa: TPessoa;
const
   SQL_GET_CODIGO_PESSOA = 'SELECT cd_pessoa FROM pessoas WHERE ds_cpf = :ds_cpf AND REPLACE(ds_cpf, ''0'', '''') <> ''''';
var
   qyGetCodigoPessoa : TUMZReadOnlyQuery;
   cd_pessoa : Integer;
begin
   TLoginManager.GetInstancia().GetDM.CriarConsulta(qyGetCodigoPessoa);
   qyGetCodigoPessoa.SQL.Text := SQL_GET_CODIGO_PESSOA;

   cd_pessoa := -1;
   qyGetCodigoPessoa.ParamByName('ds_cpf').AsString := Self.ds_cpf;
   qyGetCodigoPessoa.Open();

   if qyGetCodigoPessoa.RecordCount = 1 then
   begin
      cd_pessoa := qyGetCodigoPessoa.FieldByName('cd_pessoa').AsInteger;
   end;

   FreeAndNil(qyGetCodigoPessoa);

   Result := TPessoa.Create(cd_pessoa);
end;

{ TIdentificadorExterno }

constructor TIdentificadorExterno.Create(const cd_pessoa_externa: Integer;
  const ds_chave_sistema: String);
begin
   Self.cd_pessoa_externa := cd_pessoa_externa;
   Self.ds_chave_sistema := ds_chave_sistema;
end;

function TIdentificadorExterno.GetPessoa: TPessoa;
const
   SQL_GET_CODIGO_PESSOA =
      ' SELECT pie.cd_pessoa ' +
      ' FROM pessoas_integracao_externa pie ' +
      '      INNER JOIN nu_integracao_externa nie ON (nie.cd_sistema = pie.cd_sistema) ' +
      ' WHERE pie.cd_pessoa_externa = :cd_pessoa_externa AND nie.ds_chave = :ds_chave ';
var
   qyGetCodigoPessoa : TUMZReadOnlyQuery;
   cd_pessoa : Integer;
begin
   TLoginManager.GetInstancia().GetDM.CriarConsulta(qyGetCodigoPessoa);
   qyGetCodigoPessoa.SQL.Text := SQL_GET_CODIGO_PESSOA;

   cd_pessoa := -1;
   qyGetCodigoPessoa.ParamByName('cd_pessoa_externa').AsInteger := Self.cd_pessoa_externa;
   qyGetCodigoPessoa.ParamByName('ds_chave').AsString := Self.ds_chave_sistema;
   qyGetCodigoPessoa.Open();

   if qyGetCodigoPessoa.RecordCount = 1 then
   begin
      cd_pessoa := qyGetCodigoPessoa.FieldByName('cd_pessoa').AsInteger;
   end;

   FreeAndNil(qyGetCodigoPessoa);

   Result := TPessoa.Create(cd_pessoa);
end;

end.
