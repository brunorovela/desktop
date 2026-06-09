unit uSvcIntegraIdeauPessoa;

interface

uses
   uSvcClasses, uDMConexao, uIntegraBase, uSvcIntegraIdeau, ZAbstractRODataset,
   Classes, SysUtils, UZDataSet;

type
   TResultadoBusca = (rbCodigo, rbCPF, rbNotFound);
   {**
      Esta classe implementa uma interface de integração de registros para
      integrar as pessoas da base de dados Idesc na base de dados Ideau. A
      classe encapsula métodos que são responsáveis por resgatar as informações
      de pessoa na base de dados Ideau e inserí-las ou alterá-las na base de
      dados Ideau.
   }
   TUMSvcIntegraIdeauPessoa = class(TInterfacedObject, IUMIntegraRegistros)
   strict private
      FUMSvcIntegraIdeau: TUMSvcIntegraIdeau;
      FQyPessoasIdescSelect: TUMZReadOnlyQuery;
      FQyPessoasIdeauSelect: TUMZReadOnlyQuery;
      FQyGruposIdeauSelect: TUMZReadOnlyQuery;
      FQyGruposIdescSelect: TUMZReadOnlyQuery;
      FQyContatosIdeauSelect: TUMZReadOnlyQuery;
      FQyContatosPessoaIdescSelect: TUMZReadOnlyQuery;
      FQyPessoasIdeauInsert: TUMZQuery;
      FQyPessoasIdeauUpdate: TUMZQuery;
      FQyGrupoPessoaIdeauInsert: TUMZQuery;
      FQyGrupoPessoaIdeauDelete: TUMZQuery;
      FQyContatosIdeauInsert: TUMZQuery;
      FQyContatosPessoaIdeauDelete: TUMZQuery;
      FQyContatosPessoaIdeauInsert: TUMZQuery;
      function GetDadosPessoaIdesc(const ASCodPessoa: string): TStringList;
      function MontaQueryInsert(const ASlDadosPessoa: TStringList): string;
      function MontaQueryUpdate(const ASlDadosPessoa: TStringList): string;
      function IncluiPessoaIdeau(const ASSQLInsert, ASCodPessoa: string): boolean;
      function AtualizaPessoaIdeau(const ASSQLUpdate, ASCodPessoa: string): boolean;
      function IsPessoaExistente(const ASCodPessoa: string; const ASCPF: string): TResultadoBusca;
      function SetGrupoPessoa(const ASCodPessoa: string;
         const AICodGrupo: integer): boolean;
      function SetContatoPessoa(const ASCodPessoa, ASContato, ASNomeContato,
         ASPadrao, ASTipoOriginal: string;
         const AICodContato: integer): boolean;
      function AtualizaGruposPessoaIdeau(const ASCodPessoa: string): boolean;
      function AtualizaContatosPessoaIdeau(const ASCodPessoa: string): boolean;
      procedure AtualizaGruposBiblioteca;
      procedure BuscaGruposIdeau;
      procedure BuscaContatosIdeau;
   public
      constructor Create(AUMSvcIntegraIdeau: TUMSvcIntegraIdeau);
      function IntegraRegistro(var AUMIntegraBase: TUMIntegraBase;
         const AICodIntegracao, AICodParceiro: integer; ACAcao: Char;
         const ASChave, ASExtra: string; var ASErro: string;
         const ADtRegistro: TDateTime): TIntegraRegistroRet;
   end;

implementation

uses DB;

const
   SQL_SELECT_PESSOA_IDESC =
      'SELECT           '+
      '   cd_pessoa,     ' +
      '   cd_resp_finan, ' +
      '   cd_resp_acad,  ' +
      '   cd_mae,        ' +
      '   cd_pai,               ' +
      '   nm_pessoa,            ' +
      '   nm_contato,           ' +
      '   dt_nascimento,        ' +
      '   ds_cidade_nascimento, ' +
      '   cd_municipio,         ' +
      '   ds_estado_nascimento, ' +
      '   ds_pais_nascimento,   ' +
      '   cd_pais,            ' +
      '   cd_pais_nascimento, ' +
      '   cd_logradouro,      ' +
      '   ds_logradouro,      ' +
      '   ds_logradouro_nro,  ' +
      '   ds_complemento,     ' +
      '   ds_cep,             ' +
      '   ds_bairro,          ' +
      '   ds_cidade,          ' +
      '   ds_estado,          ' +
      '   ds_pais,            ' +
      '   ds_sexo,            ' +
      '   ds_nacionalidade,   ' +
      '   ds_identidade,      ' +
      '   cd_orgao_emissor,   ' +
      '   ds_identidade_orgao_exp, ' +
      '   dt_identidade_expedicao, ' +
      '   ds_cpf,                  ' +
      '   ds_rm_corporacao,        ' +
      '   nr_dia_vencimento,           ' +
      '   sn_nao_bloquear_financeiro,  ' +
      '   ds_rm_org_numero,            ' +
      '   dt_rm_exp,                   ' +
      '   ds_rm_doc_numero,            ' +
      '   ds_rm_orgao,                 ' +
      '   ds_rm_doc_tipo,              ' +
      '   ds_titulo_numero,            ' +
      '   ds_titulo_secao,             ' +
      '   ds_titulo_zona,              ' +
      '   dt_titulo_emissao,           ' +
      '   nm_pai,                      ' +
      '   nm_mae,                      ' +
      '   cd_estado_civil,             ' +
      '   ds_estado_civil,             ' +
      '   nm_conjuge,                  ' +
      '   cd_usuario,                  ' +
      '   dt_revisao,                  ' +
      '   cd_pessoa_alteracao,         ' +
      '   dt_cadastro,                 ' +
      '   nm_sem_acento,               ' +
      '   ds_arquivo_documento,        ' +
      '   cd_empresa,                  ' +
      '   ds_cargo,                    ' +
      '   ds_observacao,               ' +
      '   ds_senha,                    ' +
      '   ds_senha_md4,                ' +
      '   sn_senha_provisoria,         ' +
      '   sn_bloqueto_empresa,         ' +
      '   im_pessoa,                   ' +
      '   sn_foto_publica,             ' +
      '   sn_pai,                      ' +
      '   sn_mae,                      ' +
      '   tp_pessoa,                   ' +
      '   ds_cnpj,                     ' +
      '   ds_inscri_estadual,          ' +
      '   tp_cert,                     ' +
      '   nr_cert_termo,               ' +
      '   ds_cert_folha,               ' +
      '   ds_cert_livro,               ' +
      '   dt_cert,                     ' +
      '   ds_cert_uf,                  ' +
      '   ds_cert_orgao,               ' +
      '   cd_municipio_nasc,           ' +
      '   nr_praca,                    ' +
      '   cd_estado_nascimento,        ' +
      '   cd_estado,                   ' +
      '   cd_convenio,                 ' +
      '   sn_pai_resp,                 ' +
      '   sn_mae_resp,                 ' +
      '   cd_cert_uf,                  ' +
      '   cd_localidade,               ' +
      '   cd_localidade_nasc,          ' +
      '   sn_pais_como_resp,           ' +
      '   sn_obito,                    ' +
      '   sn_requerimentos_email,      ' +
      '   cd_instituicao_ensino,       ' +
      '   cd_raca,                     ' +
      '   cd_mec,                      ' +
      '   sn_foto,                     ' +
      '   sn_bloqueado,                ' +
      '   ds_inscri_municipal,         ' +
      '   cd_bairro,                   ' +
      '   cd_usuario_pessoa,           ' +
      '   HEX(im_pessoa) foto         ' +
      'FROM                           ' +
      '   pessoas                     ' +
      'WHERE                          ' +
      '   cd_pessoa = :cd_pessoa      ';

   SQL_SELECT_GRUPOS_PESSOA_IDESC =
      'SELECT g.ds_nome_grupo, g.ds_papel FROM nu_grupos g JOIN nu_grupos_pessoas gp USING (cd_grupo) WHERE gp.cd_pessoa = :cd_pessoa';

   SQL_SELECT_PESSOA_IDEAU =
      'SELECT cd_pessoa FROM pessoas WHERE cd_pessoa = :cd_pessoa OR (ds_cpf = :ds_cpf AND ds_cpf != ''00000000000'')';

   SQL_UPDATE_PESSOA_IDEAU =
      'UPDATE pessoas SET %s WHERE cd_pessoa = :cd_pessoa';

   SQL_INSERT_PESSOA_IDEAU =
      'INSERT INTO pessoas (%s) VALUES (%s)';

   SQL_DELETE_PESSOA_GRUPO_IDEAU =
      'DELETE FROM nu_grupos_pessoas WHERE cd_pessoa = :cd_pessoa';

   SQL_SELECT_GRUPOS_IDEAU =
      'SELECT cd_grupo, ds_nome_grupo, ds_papel FROM nu_grupos WHERE ds_nome_grupo LIKE ''% Idesc''';

   SQL_INSERT_PESSOA_GRUPO_IDEAU =
      'REPLACE INTO nu_grupos_pessoas (cd_grupo, cd_pessoa, cd_coligada) VALUES (:cd_grupo, :cd_pessoa, 1)';

   SQL_SELECT_CONTATOS_PESSOA_IDESC =
      'SELECT ct.cd_contato, ct.ds_contato nm_contato, ct.ds_tipo_original, ct.sn_padrao, cp.ds_contato FROM contatos_tipos ct JOIN contatos_pessoas cp USING (cd_contato) WHERE cp.cd_pessoa = :cd_pessoa';

   SQL_INSERT_CONTATOS_PESSOA_IDEAU =
      'INSERT INTO contatos_pessoas (cd_pessoa, cd_contato, ds_contato) VALUES (:cd_pessoa, :cd_contato, :ds_contato)';

   SQL_SELECT_CONTATOS_IDEAU =
      'SELECT cd_contato, ds_contato FROM contatos_tipos';

   SQL_INSERT_CONTATO_IDEAU =
      'INSERT INTO contatos_tipos (ds_contato, sn_padrao, ds_tipo_original) VALUES (:ds_contato, :sn_padrao, :ds_tipo_original)';

   SQL_DELETE_CONTATOS_PESSOA_IDEAU =
      'DELETE FROM contatos_pessoas WHERE cd_pessoa = :cd_pessoa';

   SQL_ATUALIZA_HIERARQUIAS_GRUPO =
      'INSERT INTO NU_GRUPOS_HIERARQUIA (CD_GRUPO, CD_GRUPO_LIBERADO) ' +
      'SELECT A.CD_GRUPO, G.CD_GRUPO ' +
      'FROM NU_GRUPOS A, NU_GRUPOS G ' +
      'WHERE A.CD_GRUPO = 9 AND G.DS_NOME_GRUPO LIKE ''% Idesc'' AND NOT EXISTS ' +
      '(SELECT H.CD_GRUPO_ALTERNAR ' +
      'FROM NU_GRUPOS_HIERARQUIA H ' +
      'WHERE A.CD_GRUPO = H.CD_GRUPO AND G.CD_GRUPO = H.CD_GRUPO_LIBERADO)';

   SQL_ATUALIZA_GRUPOS_BIBLIOTECA =
      'INSERT INTO BIB_GRUPOS (CD_GRUPO, NR_ORDEM_IMPORTANCIA, NR_EMPRESTIMOS_SIMULTANEOS, SN_FINANCEIRO_REMOTO) ' +
      'SELECT G.CD_GRUPO, 999, 999, 0 FROM NU_GRUPOS G ' +
      'WHERE NOT EXISTS (SELECT B.CD_BIB_GRUPO FROM BIB_GRUPOS B WHERE G.CD_GRUPO = B.CD_GRUPO)';

   SQL_ATUALIZA_MODALIDADES_GRUPO =
      'INSERT INTO BIB_MODALIDADES_MOVIMENTO_GRP (CD_MODALIDADE, CD_BIB_GRUPO) ' +
      'SELECT M.CD_MODALIDADE, G.CD_BIB_GRUPO FROM ' +
      'BIB_GRUPOS G, BIB_MODALIDADES_MOVIMENTO M WHERE NOT EXISTS ' +
      '(SELECT MG.CD_MODALIDADE_GRUPO FROM BIB_MODALIDADES_MOVIMENTO_GRP MG ' +
      'WHERE G.CD_BIB_GRUPO = MG.CD_BIB_GRUPO AND M.CD_MODALIDADE = MG.CD_MODALIDADE)';

   C_ENTER = #13;

   C_TAB = #9;

   C_QUEBRA_TABULA = C_ENTER + C_TAB;

   ERRO_UPDATE_PESSOA_IDEAU = '[ERRO] Ocorreu um erro ao tentar atualizar a pessoa [%s] na IDEAU:' + C_QUEBRA_TABULA + '%s';

   ERRO_INSERT_PESSOA_IDEAU = '[ERRO] Ocorreu um erro ao tentar inserir a pessoa [%s] na IDEAU:' + C_QUEBRA_TABULA + '%s';

   ERRO_SELECT_PESSOA_IDEAU = '[ERRO] Ocorreu um erro ao tentar buscar a pessoa [%s] na IDEAU:' + C_QUEBRA_TABULA + '%s';

   ERRO_INSERT_PESSOA_GRUPO_IDEAU = '[ERRO] Ocorreu um erro ao tentar incluir a pessoa [%s] no grupo de pessoas na IDEAU:' + C_QUEBRA_TABULA + '%s';

   ERRO_SELECT_GRUPOS_IDEAU = '[ERRO] Ocorreu um erro ao tentar buscar os grupos de pessoas IDESC na IDEAU:' + C_QUEBRA_TABULA + '%s';

   ERRO_SELECT_GRUPOS_IDESC = '[ERRO] Ocorreu um erro ao tentar buscar os grupos da pessoa [%s] na base IDESC:' + C_QUEBRA_TABULA + '%s';

   ERRO_DELETE_PESSOA_GRUPO_IDEUA = '[ERRO] Ocorreu um erro ao tentar excluir os vínculdos da pessoa [%s] com os grupos de usuário na IDEAU:' + C_QUEBRA_TABULA + '%s';

   ERRO_SELECT_CONTATOS_IDEAU = '[ERRO] Ocorreu um erro ao tentar buscar os tipos de contatos na IDEAU:' + C_QUEBRA_TABULA + '%s';

   ERRO_DELETE_CONTATOS_PESSOA_IDEAU = '[ERRO] Ocorreu um erro ao tentar excluir os contatos da pessoa [%s] na IDEAU:' + C_QUEBRA_TABULA + '%s';

   ERRO_INSERT_CONTATO_PESSOA_IDEAU = '[ERRO] Ocorreu um erro ao tentar inserir o contato da pessoa [%s] na IDEAU:' + C_QUEBRA_TABULA + '%s';

   ERRO_SELECT_CONTATOS_PESSOA_IDESC = '[ERRO] Ocorreu um erro ao tentar buscar os contatos da pessoa [%s] na IDESC:' + C_QUEBRA_TABULA + '%s';

   ERRO_INSERT_CONTATO_IDEAU = '[ERRO] Ocorreu um erro na tentativa de inserir um novo contato na IDEAU:' + C_QUEBRA_TABULA + '%s';

   C_UNHEX = 'UNHEX(%s)';

{ TUMSvcIntegraIdeauPessoa }

function TUMSvcIntegraIdeauPessoa.AtualizaContatosPessoaIdeau(
  const ASCodPessoa: string): boolean;
begin
   Result := true;
   FQyContatosPessoaIdeauDelete.ParamByName('cd_pessoa').AsString := ASCodPessoa;
   try
      FQyContatosPessoaIdeauDelete.ExecSQL;
   except
      on E: Exception do
      begin
         FUMSvcIntegraIdeau.Log.log(Format(ERRO_DELETE_CONTATOS_PESSOA_IDEAU, [ASCodPessoa, E.Message]));
         Result := false;
      end;
   end;
   if Result then
   begin
      FQyContatosPessoaIdescSelect.ParamByName('cd_pessoa').AsString := ASCodPessoa;
      try
         try
            FQyContatosPessoaIdescSelect.Open;
            while not FQyContatosPessoaIdescSelect.Eof do
            begin
               SetContatoPessoa(
                  ASCodPessoa,
                  FQyContatosPessoaIdescSelect.FieldByName('ds_contato').AsString,
                  FQyContatosPessoaIdescSelect.FieldByName('nm_contato').AsString,
                  FQyContatosPessoaIdescSelect.FieldByName('sn_padrao').AsString,
                  FQyContatosPessoaIdescSelect.FieldByName('ds_tipo_original').AsString,
                  FQyContatosPessoaIdescSelect.FieldByName('cd_contato').AsInteger);
               FQyContatosPessoaIdescSelect.Next;
            end;
         except
            on E: Exception do
            begin
               FUMSvcIntegraIdeau.Log.log(Format(ERRO_SELECT_CONTATOS_PESSOA_IDESC, [ASCodPessoa, E.Message]));
               Result := false;
            end;
         end;
      finally
         FQyContatosPessoaIdescSelect.Close;
      end;
   end;
end;

procedure TUMSvcIntegraIdeauPessoa.AtualizaGruposBiblioteca;
begin
   FUMSvcIntegraIdeau.ConIdeau.getConexao.ExecuteDirect(SQL_ATUALIZA_HIERARQUIAS_GRUPO);
   FUMSvcIntegraIdeau.ConIdeau.getConexao.ExecuteDirect(SQL_ATUALIZA_GRUPOS_BIBLIOTECA);
   FUMSvcIntegraIdeau.ConIdeau.getConexao.ExecuteDirect(SQL_ATUALIZA_MODALIDADES_GRUPO);
end;

function TUMSvcIntegraIdeauPessoa.AtualizaGruposPessoaIdeau(
  const ASCodPessoa: string): boolean;
begin
   Result := true;
   FQyGrupoPessoaIdeauDelete.ParamByName('cd_pessoa').AsString := ASCodPessoa;
   try
      FQyGrupoPessoaIdeauDelete.ExecSQL;
   except
      on E: Exception do
      begin
         FUMSvcIntegraIdeau.Log.log(Format(ERRO_DELETE_PESSOA_GRUPO_IDEUA, [ASCodPessoa, E.Message]));
         Result := false;
      end;
   end;
   if Result then
   begin
      FQyGruposIdescSelect.ParamByName('cd_pessoa').AsString := ASCodPessoa;
      try
         try
            FQyGruposIdescSelect.Open;
            while not FQyGruposIdescSelect.Eof do
            begin
               if FQyGruposIdeauSelect.Locate('ds_nome_grupo', FQyGruposIdescSelect.FieldByName('ds_nome_grupo').AsString + ' Idesc', []) then
                  SetGrupoPessoa(ASCodPessoa, FQyGruposIdeauSelect.FieldByName('cd_grupo').AsInteger);
               FQyGruposIdescSelect.Next;
            end;
         except
            on E: Exception do
            begin
               FUMSvcIntegraIdeau.Log.log(Format(ERRO_SELECT_GRUPOS_IDESC, [ASCodPessoa, E.Message]));
               Result := false;
            end;
         end;
      finally
         FQyGruposIdescSelect.Close;
      end;
   end;
end;

{**
   Este método executa a atualização dos dados da pessoa na base de dados da
   Ideau. O método recebe como parâmetro um comando SQL do tipo Update que será
   executado na base de dados da Ideau. Em caso de erro o retorno da função é
   False. Em caso de sucesso o retorno é True.
}
function TUMSvcIntegraIdeauPessoa.AtualizaPessoaIdeau(
  const ASSQLUpdate, ASCodPessoa: string): boolean;
begin
   Result := true;
   FQyPessoasIdeauUpdate.SQL.Text := ASSQLUpdate;
   FQyPessoasIdeauUpdate.ParamByName('cd_pessoa').AsString := ASCodPessoa;
   try
      FQyPessoasIdeauUpdate.ExecSQL;   
   except
      on E: Exception do
      begin
         FUMSvcIntegraIdeau.Log.log(Format(ERRO_UPDATE_PESSOA_IDEAU, [ASCodPessoa, E.Message]));
         Result := false;
      end;
   end;
end;

procedure TUMSvcIntegraIdeauPessoa.BuscaContatosIdeau;
begin
   try
      FQyContatosIdeauSelect.Open;
   except
      on E: Exception do
         FUMSvcIntegraIdeau.Log.log(Format(ERRO_SELECT_CONTATOS_IDEAU, [E.Message]));
   end;
end;

procedure TUMSvcIntegraIdeauPessoa.BuscaGruposIdeau;
begin
   try
      FQyGruposIdeauSelect.Open;
   except
      on E: Exception do
         FUMSvcIntegraIdeau.Log.log(Format(ERRO_SELECT_GRUPOS_IDEAU, [E.Message]));
   end;
end;

constructor TUMSvcIntegraIdeauPessoa.Create(
  AUMSvcIntegraIdeau: TUMSvcIntegraIdeau);
begin
   FUMSvcIntegraIdeau := AUMSvcIntegraIdeau;
   FQyGruposIdeauSelect := FUMSvcIntegraIdeau.ConIdeau.newROQuery;
   FQyGruposIdescSelect := FUMSvcIntegraIdeau.ConIdesc.newROQuery;
   FQyGrupoPessoaIdeauInsert := FUMSvcIntegraIdeau.ConIdeau.newQuery;
   FQyGrupoPessoaIdeauDelete := FUMSvcIntegraIdeau.ConIdeau.newQuery;
   FQyPessoasIdescSelect := FUMSvcIntegraIdeau.ConIdesc.newROQuery;
   FQyPessoasIdeauSelect := FUMSvcIntegraIdeau.ConIdeau.newROQuery;
   FQyPessoasIdeauInsert := FUMSvcIntegraIdeau.ConIdeau.newQuery;
   FQyPessoasIdeauUpdate := FUMSvcIntegraIdeau.ConIdeau.newQuery;
   FQyContatosIdeauSelect := FUMSvcIntegraIdeau.ConIdeau.newROQuery;
   FQyContatosPessoaIdescSelect := FUMSvcIntegraIdeau.ConIdesc.newROQuery;
   FQyContatosIdeauInsert := FUMSvcIntegraIdeau.ConIdeau.newQuery;
   FQyContatosPessoaIdeauDelete := FUMSvcIntegraIdeau.ConIdeau.newQuery;
   FQyContatosPessoaIdeauInsert := FUMSvcIntegraIdeau.ConIdeau.newQuery;
   FQyGruposIdeauSelect.SQL.Text := SQL_SELECT_GRUPOS_IDEAU;
   FQyGruposIdescSelect.SQL.Text := SQL_SELECT_GRUPOS_PESSOA_IDESC;
   FQyGrupoPessoaIdeauInsert.SQL.Text := SQL_INSERT_PESSOA_GRUPO_IDEAU;
   FQyGrupoPessoaIdeauDelete.SQL.Text := SQL_DELETE_PESSOA_GRUPO_IDEAU;
   FQyPessoasIdescSelect.SQL.Text := SQL_SELECT_PESSOA_IDESC;
   FQyPessoasIdeauSelect.SQL.Text := SQL_SELECT_PESSOA_IDEAU;
   FQyContatosIdeauSelect.SQL.Text := SQL_SELECT_CONTATOS_IDEAU;
   FQyContatosPessoaIdescSelect.SQL.Text := SQL_SELECT_CONTATOS_PESSOA_IDESC;
   FQyContatosPessoaIdeauInsert.SQL.Text := SQL_INSERT_CONTATOS_PESSOA_IDEAU;
   FQyContatosIdeauInsert.SQL.Text := SQL_INSERT_CONTATO_IDEAU;
   FQyContatosPessoaIdeauDelete.SQL.Text := SQL_DELETE_CONTATOS_PESSOA_IDEAU;
   BuscaGruposIdeau;
   BuscaContatosIdeau;
end;

{**
   Este método busca todos os dados da pessoa a ser integrada na base de dados
   da Idesc. O método retorno uma lista de Strings com todas as informações da
   pessoa que está sendo integrada. A chave de cada valor da lista de Strings
   é o nome do campo na tabela Pessoas, sendo o valor o próprio valor do campo.
}
function TUMSvcIntegraIdeauPessoa.GetDadosPessoaIdesc(
  const ASCodPessoa: string): TStringList;
var
   I: integer;
begin
   Result := TStringList.Create;
   FQyPessoasIdescSelect.ParamByName('cd_pessoa').AsString := ASCodPessoa;
   try
      FQyPessoasIdescSelect.Open;
      if not FQyPessoasIdescSelect.IsEmpty then
      begin
         for I := 0 to FQyPessoasIdescSelect.FieldCount - 1 do
            if FQyPessoasIdescSelect.Fields[I].FieldName <> 'im_pessoa' then
               if FQyPessoasIdescSelect.Fields[I].DataType in [ftDate, ftDateTime] then
                  Result.Values[FQyPessoasIdescSelect.Fields[I].FieldName] :=
                     FormatDateTime('yyyy-mm-dd 00:00:00', FQyPessoasIdescSelect.Fields[I].AsDateTime)
               else
                  Result.Values[FQyPessoasIdescSelect.Fields[I].FieldName] :=
                     FQyPessoasIdescSelect.Fields[I].AsString;
      end;
   finally
      FQyPessoasIdescSelect.Close;
   end;
end;

{**
   Este método efetua a inclusão de uma pessoa consultada na base de dados Idesc
   na base de dados Ideau. Caso a inclusão não possa ser executada, devido a
   erro, o retorno do método será False. Em caso de sucesso o retorno será True.
}
function TUMSvcIntegraIdeauPessoa.IncluiPessoaIdeau(
   const ASSQLInsert, ASCodPessoa: string): boolean;
begin
   Result := true;
   try
      FQyPessoasIdeauInsert.SQL.Text := ASSQLInsert;
      FQyPessoasIdeauInsert.ExecSQL;
   except
      on E: Exception do
      begin
         FUMSvcIntegraIdeau.Log.log(Format(ERRO_INSERT_PESSOA_IDEAU, [ASCodPessoa, E.Message]));
         Result := false;
      end;
   end;
end;

{**
   Executa a integração de um registro pendente de pessoa na base de dados Idesc
   na base de dados da Ideau. As ações permitidas para integração de pessoas
   são "(I)nclusão" e "(A)lteração". Porém, antes de definir se será uma
   inclusão ou alteração, o sistema busca a pessoa na base de dados Ideau, para
   definir que tipo de integração será executada: Inclusão ou Alteração.
}
function TUMSvcIntegraIdeauPessoa.IntegraRegistro(
   var AUMIntegraBase: TUMIntegraBase; const AICodIntegracao,
   AICodParceiro: integer; ACAcao: Char; const ASChave, ASExtra: string;
   var ASErro: string; const ADtRegistro: TDateTime): TIntegraRegistroRet;
var
   LSlDadosPessoa: TStringList;
   rbPessoa: TResultadoBusca;
begin
   Result := irrSuccess;
   try
      LSlDadosPessoa := GetDadosPessoaIdesc(ASChave);
      if LSlDadosPessoa.Count > 0 then
      begin
         rbPessoa := IsPessoaExistente(ASChave, LSLDadosPessoa.Values['ds_cpf']);
         if ACAcao in['I', 'A'] then
         begin
            if rbPessoa = rbCodigo then
            begin
               if AtualizaPessoaIdeau(MontaQueryUpdate(LSlDadosPessoa), ASChave) then
                  Result := irrSuccess
               else
                  Result := irrFailed;
            end
            else if rbPessoa = rbNotFound then
            begin
               if IncluiPessoaIdeau(MontaQueryInsert(LSlDadosPessoa), ASChave) then
                  Result := irrSuccess
               else
                  Result := irrFailed;
            end;
            if (rbPessoa = rbCodigo) and (Result = irrSuccess) then
            begin
               if not AtualizaGruposPessoaIdeau(ASChave) then
                  Result := irrFailed;
               if AtualizaContatosPessoaIdeau(ASChave) then
                  Result := irrFailed;
            end;
         end
         else if ACAcao = 'G' then
         begin
            Result := irrSuccess;
            if rbPessoa = rbNotFound then
               if IncluiPessoaIdeau(MontaQueryInsert(LSlDadosPessoa), ASChave) then
                  Result := irrSuccess
               else
                  Result := irrFailed;
            if (rbPessoa = rbCodigo) and (Result = irrSuccess) then
               if AtualizaGruposPessoaIdeau(ASChave) then
                  Result := irrSuccess
               else
                  Result := irrFailed;
         end
         else if ACAcao = 'C' then
         begin
            Result := irrSuccess;
            if (rbPessoa = rbCodigo) and (Result = irrSuccess) then
               if IncluiPessoaIdeau(MontaQueryInsert(LSlDadosPessoa), ASChave) then
                  Result := irrSuccess
               else
                  Result := irrFailed;
                  
            if (rbPessoa = rbCodigo) and (Result = irrSuccess) then
               if AtualizaContatosPessoaIdeau(ASChave) then
                  Result := irrSuccess
               else
                  Result := irrFailed;
         end;
         AtualizaGruposBiblioteca;
      end;
   finally
      FreeAndNil(LSlDadosPessoa);
   end;
end;

{**
   Verifica se a pessoa que será integrada já está cadastrada na base de dados
   da Ideau, para definir se a integração será do tipo inclusão ou alteração.
}
function TUMSvcIntegraIdeauPessoa.IsPessoaExistente(
  const ASCodPessoa: string; const ASCPF: string): TResultadoBusca;
begin
   Result := rbNotFound;
   FQyPessoasIdeauSelect.ParamByName('cd_pessoa').AsString := ASCodPessoa;
   FQyPessoasIdeauSelect.ParamByName('ds_cpf').AsString := ASCPF;
   try
      try
         FQyPessoasIdeauSelect.Open;
         if FQyPessoasIdeauSelect.IsEmpty then
         begin
            Result := rbNotFound
         end
         else
         begin
            if FQyPessoasIdeauSelect.FieldByName('cd_pessoa').AsString = ASCodPessoa then
            begin
               Result := rbCodigo
            end
            else
               Result := rbCPF;
         end;
      except
         on E: Exception do
         begin
            FUMSvcIntegraIdeau.Log.log(Format(ERRO_SELECT_PESSOA_IDEAU, [ASCodPessoa, E.Message]));
         end;
      end;
   finally
      FQyPessoasIdeauSelect.Close;
   end;
end;

{**
   Este método recebe como parâmetro uma lista de Strings que contém os dados da
   pessoa que será integrada, sendo a chave de cada valor o campo na tabela de
   pessoas. Com estas informações o método monta uma lista de campos (chave da
   String), separados por vírgula, e uma lista de valores separados por vírgula.
   Por fim, monta um comando SQL Insert e retorna-o. 
}
function TUMSvcIntegraIdeauPessoa.MontaQueryInsert(
  const ASlDadosPessoa: TStringList): string;
var
   LSCampos, LSValores: string;
   I: integer;
begin
   LSCampos := '';
   LSValores := '';
   for I := 0 to ASlDadosPessoa.Count - 1 do
   begin
      if LSCampos <> '' then
         LSCampos := LSCampos + ',';
      if LSValores <> '' then
         LSValores := LSValores + ',';
      if ASlDadosPessoa.Names[I] <> 'foto' then
      begin
         LSCampos := LSCampos + ASlDadosPessoa.Names[I];
         LSValores := LSValores + QuotedStr(ASlDadosPessoa.ValueFromIndex[I]);
      end
      else
      begin
         LSCampos := LSCampos + 'im_pessoa';
         LSValores := LSValores + Format(C_UNHEX, [QuotedStr(ASlDadosPessoa.ValueFromIndex[I])]);
      end;
   end;
   Result := Format(SQL_INSERT_PESSOA_IDEAU, [LSCampos, LSValores]);
end;

{**
   Este método recebe como parâmetro uma lista de Strings que contém os dados da
   pessoa que será integrada, sendo a chave de cada valor o campo na tabela de
   pessoa. Com estas informações o método monta uma lista de campos que serão
   atualizados para a pessoa na base de dados Ideau e monta uma comando SQL
   Update que será o retorno do método.
}
function TUMSvcIntegraIdeauPessoa.MontaQueryUpdate(
  const ASlDadosPessoa: TStringList): string;
var
   LSCamposValores: string;
   I: integer;
begin
   LSCamposValores := '';
   for I := 0 to ASlDadosPessoa.Count - 1 do
   begin
      if LSCamposValores <> '' then
         LSCamposValores := LSCamposValores + ',';
      if ASlDadosPessoa.Names[I] <> 'foto' then
      begin
         LSCamposValores :=
            LSCamposValores + ASlDadosPessoa.Names[I] + ' = ' +
            QuotedStr(ASlDadosPessoa.ValueFromIndex[I]);
      end
      else
      begin
         LSCamposValores :=
            LSCamposValores + 'im_pessoa = ' +
            Format(C_UNHEX, [QuotedStr(ASlDadosPessoa.ValueFromIndex[I])]);
      end;
   end;
   Result := Format(SQL_UPDATE_PESSOA_IDEAU, [LSCamposValores]);
end;

function TUMSvcIntegraIdeauPessoa.SetContatoPessoa(const ASCodPessoa,
  ASContato, ASNomeContato, ASPadrao, ASTipoOriginal: string;
  const AICodContato: integer): boolean;

  function GetContatoTipo: integer;
   begin
      if FQyContatosIdeauSelect.Locate('ds_contato', ASNomeContato, [loCaseInsensitive]) then
         Result := FQyContatosIdeauSelect.FieldByName('cd_contato').AsInteger
      else
      begin
         FQyContatosIdeauInsert.ParamByName('ds_contato').AsString := ASNomeContato;
         FQyContatosIdeauInsert.ParamByName('sn_padrao').AsString := ASPadrao;
         FQyContatosIdeauInsert.ParamByName('ds_tipo_original').AsString := ASTipoOriginal;
         try
            FQyContatosIdeauInsert.ExecSQL;
         except
            on E: Exception do
               raise Exception.CreateFmt(ERRO_INSERT_CONTATO_IDEAU, [E.Message]);
         end;
         FQyContatosIdeauSelect.Close;
         try
            BuscaContatosIdeau;
            Result := GetContatoTipo;
         except
            on Exception do raise;
         end;
      end;
   end;

begin
   Result := true;
   try
      FQyContatosPessoaIdeauInsert.ParamByName('cd_pessoa').AsString := ASCodPessoa;
      FQyContatosPessoaIdeauInsert.ParamByName('ds_contato').AsString := ASContato;
      if AICodContato < 5 then
         FQyContatosPessoaIdeauInsert.ParamByName('cd_contato').AsInteger := AICodContato
      else
         FQyContatosPessoaIdeauInsert.ParamByName('cd_contato').AsInteger := GetContatoTipo;
      FQyContatosPessoaIdeauInsert.ExecSQL;      
   except
      on E: Exception do
      begin
         FUMSvcIntegraIdeau.Log.log(Format(ERRO_INSERT_CONTATO_PESSOA_IDEAU, [ASCodPessoa, E.Message]));
         Result := false;
      end;
   end;
end;

function TUMSvcIntegraIdeauPessoa.SetGrupoPessoa(const ASCodPessoa: string;
  const AICodGrupo: integer): boolean;
begin
   Result := true;
   try
      FQyGrupoPessoaIdeauInsert.ParamByName('cd_grupo').AsInteger := AICodGrupo;
      FQyGrupoPessoaIdeauInsert.ParamByName('cd_pessoa').AsString := ASCodPessoa;
      FQyGrupoPessoaIdeauInsert.ExecSQL;
   except
      on E: Exception do
      begin
         FUMSvcIntegraIdeau.Log.log(Format(ERRO_INSERT_PESSOA_GRUPO_IDEAU, [ASCodPessoa, E.Message]));
         Result := false;
      end;
   end;
end;

end.
