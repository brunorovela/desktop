unit ClassPessoa;

interface

uses
   SysUtils, Classes, UZDataSet, jpeg;

type
   TClassePessoa = class(TObject)
      private
         // Dados da pessoa
         cd_pessoa: Integer;
         cd_pai: Integer;
         cd_mae: Integer;
         cd_resp_acad: Integer;
         cd_resp_finan: Integer;
         nr_idade: Integer;
         dt_nascimento : String;
         nm_pessoa: String;
         ds_cnpj: String;
         im_pessoa: TJPEGImage;
         hasFoto: boolean;
         ds_login: String;
         ds_senha: String;
         objPai: TClassePessoa;
         objMae: TClassePessoa;
         objRespAcad: TClassePessoa;
         objRespFinan: TClassePessoa;

         listaContatos: TStringList;
         listaNecessidadesEspeciais: TStringList;
         listaNecessidadesEspeciaisCompleta: TStringList;

         { Carrega a lista de contatos }
         procedure LoadContatos();

         { Carrega a lista de necessidades especiais }
         procedure LoadNecessidadesEspeciais();
         procedure LoadNecessidadesEspeciaisCompleta();

         function GetContatosExtenso: String;
         function GetNecessidadesEspeciaisExtenso: String;
         function GetNecessidadesEspeciaisCompleta(const cd_campo: Integer): String;
         function GetMae: TClassePessoa;
         function GetRespAcad: TClassePessoa;
         function GetRespFinan: TClassePessoa;
         function GetPai: TClassePessoa;
      public
         constructor Create( const filtro_cd_pessoa: Integer; const CarregarPessoa: Boolean = True );
         destructor Destroy;

         { Carrega as informações da pessoa na classe }
         procedure LoadPessoa();

         { Recarrega as necessidades especiais }
         procedure ReloadNecessidadesEspeciaisCompleta();

         procedure setLogin( login: String );
         procedure setSenha( senha: String);

         class function getCodigoPessoa(const ds_login: String): Integer;

         { Propertys }
         property Codigo: Integer read cd_pessoa;
         property Idade: Integer read nr_idade;
         property Data_nascimento : String read dt_nascimento;
         property Nome: String read nm_pessoa;
         property Foto: TJPEGImage read im_pessoa;
         property TemFoto: Boolean read hasFoto;
         property Login: String read ds_login;
         property Senha: String read ds_senha;
         property CNPJ: String read ds_cnpj;
         property Pai: TClassePessoa read GetPai;
         property Mae: TClassePessoa read GetMae;
         property RespAcad: TClassePessoa read GetRespAcad;
         property RespFinan: TClassePessoa read GetRespFinan;
         property ContatosExtenso: String read GetContatosExtenso;
         property NecessidadesEspeciaisExtenso: String read GetNecessidadesEspeciaisExtenso;
         property NecessidadesEspeciaisCompleta[ const cd_campo: Integer ]: String read GetNecessidadesEspeciaisCompleta; 
   end;

implementation

uses uDM, DB, ZAbstractRODataset, uItemCombo;

{ TClassePessoa }

constructor TClassePessoa.Create(const filtro_cd_pessoa: Integer;
   const CarregarPessoa: Boolean);
begin
   cd_pessoa := filtro_cd_pessoa;

   if ( CarregarPessoa ) then
      LoadPessoa();
end;

destructor TClassePessoa.Destroy;
begin
   FreeAndNil( im_pessoa );
end;

class function TClassePessoa.getCodigoPessoa(const ds_login: String): Integer;
const
   SQL_GET_CODIGO_PESSOA =
      ' SELECT cd_pessoa FROM pessoas WHERE ds_login = :ds_login OR cd_pessoa = :ds_login ';
var
   qyGetCodigoPessoa: TUMZReadOnlyQuery;
begin
   DM.CriarConsulta( qyGetCodigoPessoa );

   qyGetCodigoPessoa.SQL.Text := SQL_GET_CODIGO_PESSOA;
   qyGetCodigoPessoa.ParamByName('ds_login').AsString := ds_login;

   qyGetCodigoPessoa.Open();

   Result := -1;
   if ( qyGetCodigoPessoa.RecordCount = 1 ) then
      Result := qyGetCodigoPessoa.FieldByName('cd_pessoa').AsInteger;

   FreeAndNil(qyGetCodigoPessoa);
end;

function TClassePessoa.GetContatosExtenso: String;
var
   I: Integer;
   Separador: String;
begin
   LoadContatos();
   if ( listaContatos = nil ) then Exit;

   Result := '';
   Separador := '';

   for I := 0 to listaContatos.Count - 1 do
   begin
      Result := Result + Separador +
                TItemCombo( listaContatos.Objects[I] ).getDescricao + ': ' +
                TItemCombo( listaContatos.Objects[I] ).getVariavel;
      Separador := ', ';
   end;      
end;

function TClassePessoa.GetNecessidadesEspeciaisCompleta(
  const cd_campo: Integer): String;
var
   I: Integer;
begin
   if ( listaNecessidadesEspeciaisCompleta = nil ) then Exit;

   Result := '';

   I := listaNecessidadesEspeciaisCompleta.IndexOf( IntToStr(cd_campo) );
   if ( I <> -1 ) then
      Result := TItemCombo( listaNecessidadesEspeciaisCompleta.Objects[ I ] ).getDescricao;   
end;

function TClassePessoa.GetNecessidadesEspeciaisExtenso: String;
var
   I: Integer;
   Separador: String;
begin
   LoadNecessidadesEspeciais();
   if ( listaNecessidadesEspeciais = nil ) then Exit;

   Result := '';
   Separador := '';

   for I := 0 to listaNecessidadesEspeciais.Count - 1 do
   begin
      Result := Result + Separador +
                TItemCombo( listaNecessidadesEspeciais.Objects[I] ).getDescricao;
      Separador := ', ';
   end;
end;

function TClassePessoa.GetMae: TClassePessoa;
begin
   if ( objMae = nil ) then
   begin
      objMae := TClassePessoa.Create( cd_mae );
   end;

   Result := objMae;
end;

function TClassePessoa.GetPai: TClassePessoa;
begin
   if ( objPai = nil ) then
   begin
      objPai := TClassePessoa.Create( cd_pai );
   end;

   Result := objPai;
end;

function TClassePessoa.GetRespAcad: TClassePessoa;
begin
   if ( objRespAcad = nil ) then
   begin
      objRespAcad := TClassePessoa.Create( cd_resp_acad );
   end;

   Result := objRespAcad;
end;

function TClassePessoa.GetRespFinan: TClassePessoa;
begin
   if ( objRespFinan = nil ) then
   begin
      objRespFinan := TClassePessoa.Create( cd_resp_finan );
   end;

   Result := objRespFinan;   
end;

procedure TClassePessoa.LoadContatos;
const
   SQL_LOAD_CONTATOS =
      ' SELECT ct.cd_contato, cp.ds_contato, ct.ds_contato AS ds_contato_nome ' +
      ' FROM contatos_pessoas cp ' +
      '      INNER JOIN contatos_tipos ct ON ( ct.cd_contato = cp.cd_contato ) ' +
      ' WHERE cp.cd_pessoa = :cd_pessoa AND ' +
      '       LENGTH( TRIM( cp.ds_contato ) ) > 0 AND ' +
      '       ct.sn_padrao = ''S'' AND ct.cd_contato IN ( 1, 2, 3, 7 ) ';
var
   qyLoadContatos: TUMZQuery;
begin
   DM.CriarConsulta( qyLoadContatos );
   listaContatos.Clear;

   qyLoadContatos.SQL.Text := SQL_LOAD_CONTATOS;
   qyLoadContatos.ParamByName('cd_pessoa').AsInteger := cd_pessoa;
   qyLoadContatos.Open();

   while not qyLoadContatos.Eof do
   begin
      listaContatos.AddObject(
         qyLoadContatos.FieldByName('cd_contato').AsString,
         TItemCombo.Create( qyLoadContatos.FieldByName('cd_contato').AsString,
                            qyLoadContatos.FieldByName('ds_contato_nome').AsString,
                            qyLoadContatos.FieldByName('ds_contato').AsString ) );

      qyLoadContatos.Next;
   end;
end;

procedure TClassePessoa.LoadNecessidadesEspeciais;
const
   SQL_LOAD_NECESSIDADES_ESPECIAIS =
      ' SELECT si.cd_situacao, si.ds_valor, CASE WHEN pd.cd_deficiencia is null THEN ''0'' ELSE ''1''  end sn_portador ' +
      ' FROM situacoes si ' +
      '      LEFT JOIN pessoas_deficiencias  pd ON (pd.cd_deficiencia = si.cd_situacao AND cd_pessoa = :cd_pessoa) ' +
      ' WHERE si.cd_modulo = 1056 ' +
      ' ORDER BY si.ds_valor ';
var
   qyLoadNecessidadesEspeciais: TUMZQuery;
begin
   DM.CriarConsulta( qyLoadNecessidadesEspeciais );

   listaNecessidadesEspeciais.Clear;

   qyLoadNecessidadesEspeciais.SQL.Text := SQL_LOAD_NECESSIDADES_ESPECIAIS;
   qyLoadNecessidadesEspeciais.ParamByName('cd_pessoa').AsInteger := cd_pessoa;
   qyLoadNecessidadesEspeciais.Open();

   while not qyLoadNecessidadesEspeciais.Eof do
   begin
      if ( qyLoadNecessidadesEspeciais.FieldByName('sn_portador').AsInteger = 1 ) then
      begin
         listaNecessidadesEspeciais.AddObject(
            qyLoadNecessidadesEspeciais.FieldByName('cd_situacao').AsString,
            TItemCombo.Create( qyLoadNecessidadesEspeciais.FieldByName('cd_situacao').AsString,
                               qyLoadNecessidadesEspeciais.FieldByName('ds_valor').AsString ) );
      end;

      qyLoadNecessidadesEspeciais.Next;
   end;
end;

procedure TClassePessoa.LoadNecessidadesEspeciaisCompleta;
const
   SQL_LOAD_NECESSIDADES_ESPECIAIS_COMPLETA =
      ' SELECT pdc.ME_VALOR, COALESCE( pca.ds_campo, pca.ds_campo_descricao ) AS DS_CAMPO, pca.CD_CAMPO ' +
      ' FROM pessoas_deficiencias_completo pdc ' +
      '      INNER JOIN pessoas_campos_adicionais pca ON ( pca.CD_CAMPO = pdc.cd_campo ) ' +
      ' WHERE pdc.cd_pessoa = :cd_pessoa ';
var
   qyLoadNecessidadesEspeciaisCompleta: TUMZQuery;
begin
   DM.CriarConsulta( qyLoadNecessidadesEspeciaisCompleta );

   listaNecessidadesEspeciaisCompleta.Clear;

   qyLoadNecessidadesEspeciaisCompleta.SQL.Text := SQL_LOAD_NECESSIDADES_ESPECIAIS_COMPLETA;
   qyLoadNecessidadesEspeciaisCompleta.ParamByName('cd_pessoa').AsInteger := cd_pessoa;
   qyLoadNecessidadesEspeciaisCompleta.Open();

   while not qyLoadNecessidadesEspeciaisCompleta.Eof do
   begin
      listaNecessidadesEspeciaisCompleta.AddObject(
         qyLoadNecessidadesEspeciaisCompleta.FieldByName('CD_CAMPO').AsString,
         TItemCombo.Create( qyLoadNecessidadesEspeciaisCompleta.FieldByName('CD_CAMPO').AsString,
                            qyLoadNecessidadesEspeciaisCompleta.FieldByName('ME_VALOR').AsString ) );

      qyLoadNecessidadesEspeciaisCompleta.Next;
   end;
end;

procedure TClassePessoa.LoadPessoa;
const
   SQL_LOAD_PESSOA =
      ' SELECT '
      +' nm_pessoa,'
      +' cd_pai, '
      +' cd_mae, '
      +' cd_resp_acad, '
      +' cd_resp_finan, '
      +' im_pessoa, '
      +' ds_login, '
      +' ds_senha, '
      +' ds_cnpj, '
      +' DATE_FORMAT( dt_nascimento, "%d/%m/%Y" ) dt_nascimento, '
      +' YEAR(CURDATE()) - YEAR(dt_nascimento) - ( DATE_FORMAT(CURDATE(), "%m%d") < DATE_FORMAT(dt_nascimento, "%m%d")) AS idade '
      + ' FROM pessoas '
      +' WHERE '
      + '   cd_pessoa = :cd_pessoa ';
var
   qyLoadPessoa: TUMZQuery;
   BS: TStream;
begin
   DM.CriarConsulta( qyLoadPessoa );

   qyLoadPessoa.SQL.Text := SQL_LOAD_PESSOA;
   qyLoadPessoa.ParamByName('cd_pessoa').AsInteger := cd_pessoa;
   qyLoadPessoa.Open();

   { Deixa os objetos de responsáveis como vazios, pois são necessários somente se chamados }
   objPai := nil;
   objMae := nil;
   objRespAcad := nil;
   objRespFinan := nil;
   listaContatos := TStringList.Create;
   listaNecessidadesEspeciais := TStringList.Create;
   listaNecessidadesEspeciaisCompleta := TStringList.Create;

   {nm_pessoa}
   nm_pessoa := qyLoadPessoa.FieldByName('nm_pessoa').AsString;
   {im_pessoa}
   hasFoto := qyLoadPessoa.FieldByName('im_pessoa').AsString <> '';
   im_pessoa := TJPEGImage.Create;
   if ( hasFoto ) then
   begin
      BS := qyLoadPessoa.CreateBlobStream( qyLoadPessoa.FieldByName('im_pessoa'), bmRead );
      im_pessoa.LoadFromStream( BS );
   end;
   { idade }
   nr_idade := qyLoadPessoa.FieldByName('idade').AsInteger;
   { dt_nascimento }
   dt_nascimento := qyLoadPessoa.FieldByName('dt_nascimento').AsString;
   { Pai }
   cd_pai := qyLoadPessoa.FieldByName('cd_pai').AsInteger;
   { Mae }
   cd_mae := qyLoadPessoa.FieldByName('cd_mae').AsInteger;
   { RespAcad }
   cd_resp_acad := qyLoadPessoa.FieldByName('cd_resp_acad').AsInteger;
   { RespFinan }
   cd_resp_finan := qyLoadPessoa.FieldByName('cd_resp_finan').AsInteger;
   { login }
   ds_login := qyLoadPessoa.FieldByName('ds_login').AsString;
   { senha }
   ds_senha := qyLoadPessoa.FieldByName('ds_senha').AsString;
   { cnpj }
   ds_cnpj := qyLoadPessoa.FieldByName('ds_cnpj').AsString;

   FreeAndNil(qyLoadPessoa);
end;

procedure TClassePessoa.ReloadNecessidadesEspeciaisCompleta;
begin
   LoadNecessidadesEspeciaisCompleta();
end;

procedure TClassePessoa.setLogin(login: String);
const
   SQL_INSERT_LOGIN = 'UPDATE pessoas SET ds_login = :login WHERE cd_pessoa = :cd_pessoa';
var
   qySetLogin: TUMZQuery;
begin
   DM.CriarConsulta(qySetLogin);
   qySetLogin.SQL.Text := SQL_INSERT_LOGIN;
   qySetLogin.ParamByName('login').AsString := login;
   qySetLogin.ParamByName('cd_pessoa').AsInteger := cd_pessoa;
   qySetLogin.ExecSQL;

   FreeAndNil(qySetLogin);
end;

procedure TClassePessoa.setSenha(senha: String);
const
   SQL_INSERT_SENHA = 'UPDATE pessoas SET ds_senha = md5(:senha), sn_senha_provisoria = ''S'' WHERE cd_pessoa = :cd_pessoa';
var
   qySetSenha: TUMZQuery;
begin
   DM.CriarConsulta(qySetSenha);
   qySetSenha.SQL.Text := SQL_INSERT_SENHA;
   qySetSenha.ParamByName('senha').AsString := senha;
   qySetSenha.ParamByName('cd_pessoa').AsInteger := cd_pessoa;
   qySetSenha.ExecSQL;

   FreeAndNil(qySetSenha);
end;

end.
