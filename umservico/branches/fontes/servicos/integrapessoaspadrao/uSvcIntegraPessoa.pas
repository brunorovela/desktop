unit uSvcIntegraPessoa;

interface

uses
   uSvcClasses, uDMConexao, uIntegraBase, uSvcIntegraPessoasPadrao, ZAbstractRODataset,
   Classes, SysUtils, UZDataSet;

type

   {Esse enumerador representa o estado em que se encontra a pessoa na base
   DESTINO

   rbCodigo = Pessoa com mesmo código na base destino (ja está importada)
   rbCPF = Ja existe uma pessoa com mesmo CPF na base destino (
      Cadastrada manualmente, por isso CPF bate mas código não)
   rbNotFound = Pessoa não existente no banco de dados destino, nem CPF nem Codigo.
   rbCPFInvalido = Situação quando existe uma pessoa que possui com mesmo CPF na
      base destino, mas os mesmos são inválidos, por ex: 00000000000
      (nesses casos não se deve realizar nenhuma alteração, simplesmente ignora
      a pessoa, pois podem não ser as mesmas nas duas bases)  

   }
   TResultadoBusca = (rbCodigo, rbCPF, rbNotFound, rbCPFInvalido);
   {**
      Esta classe implementa uma interface de integração de registros para
      integrar as pessoas da base de dados ORIGEM na base de dados DESTINO. A
      classe encapsula métodos que são responsáveis por resgatar as informações
      de pessoa na base de dados ORIGEM e inserí-las ou alterá-las na base de
      dados DESTINO.

      Nota: Neste caso DESTINO refere-se ao banco de dados ao qual as pessoas
      serão integradas e ORIGEM refere-se ao banco de dados ao qual as pessoas
      estão inseridas atualmente.
   }
   TUMSvcIntegraPessoa = class(TInterfacedObject, IUMIntegraRegistros)
   strict private
      FUMSvcIntegra: TUMSvcIntegraPessoasPadrao;
      FQyPessoasOrigemSelect: TUMZReadOnlyQuery;
      FQyPessoasDestinoSelect: TUMZReadOnlyQuery;
      FQyGruposDestinoSelect: TUMZReadOnlyQuery;
      FQyGruposOrigemSelect: TUMZReadOnlyQuery;
      FQyContatosDestinoSelect: TUMZReadOnlyQuery;
      FQyContatosPessoaOrigemSelect: TUMZReadOnlyQuery;
      FQyPessoasDestinoInsert: TUMZQuery;
      FQyPessoasDestinoUpdate: TUMZQuery;
      FQyGrupoPessoaDestinoInsert: TUMZQuery;
      FQyGrupoPessoaDestinoDelete: TUMZQuery;
      FQyContatosDestinoInsert: TUMZQuery;
      FQyContatosPessoaDestinoDelete: TUMZQuery;
      FQyContatosPessoaDestinoInsert: TUMZQuery;
      qyVerificaGrupo: TUMZReadOnlyQuery;
       
      FChaveGrupo: String;

      {Retorna informações relacionadas a pessoa de origem}
      function GetDadosPessoaOrigem(const ASCodPessoa: string): TStringList;

      {Monta query para inserir uma nova pessoa}
      function MontaQueryInsert(const ASlDadosPessoa: TStringList): string;

      {Monnta query para atualizar informações de uma pessoa}
      function MontaQueryUpdate(const ASlDadosPessoa: TStringList): string;

      {Monnta query para atualizar informações de uma pessoa se baseando no seu CPF}
      function MontaQueryUpdatePorCPF(const ASlDadosPessoa: TStringList): string;

      {Inclui uma pessoa com o SQL gerado por MontaQueryInsert}
      function IncluiPessoaDestino(const ASSQLInsert, ASCodPessoa: string): boolean;

      {Atualiza os dados de uma pessoa com base no SQL gerado por
      MontaQueryUpdate}
      function AtualizaPessoaDestino(const ASSQLUpdate, ASCodPessoa: string): boolean;

      {Atualiza os dados de uma pessoa com base no SQL gerado por
         MontaQueryUpdate (Esta função é utilizada quando o código da pessoa
         não bate mas o CPF é igual ou seja a MESMA pessoa com código
         diferente entre as duas bases)}
      function AtualizaPessoaDestinoPorCPF(const ASSQLUpdate, sCPF: String): boolean;

      {Verifica se existe uma pessoa com mesmo CPF na base destino}
      function IsPessoaExistente(const ASCodPessoa: string; const ASCPF: string): TResultadoBusca;

      {Inclui uma pessoa em um grupo na base destino}
      function SetGrupoPessoa(const ASCodPessoa: string;
         const AICodGrupo: integer): boolean;

      {Inclui um contato de uma pessoa na base destino}   
      function SetContatoPessoa(const ASCodPessoa, ASContato, ASNomeContato,
         ASPadrao, ASTipoOriginal: string;
         const AICodContato: integer): boolean;

      {Atualiza os grupos da pessoa na base destino com base nos grupos da base
      origem}
      function AtualizaGruposPessoaDestino(const ASCodPessoa: string): Boolean;

      {Atualiza os grupos da pessoa base destino com nos grupos da base origem}
      function AtualizaGruposPessoaDestinoPorCPF(const sCPF: string; sCodigoOrigem: String): Boolean;

      {Atualiza os contatos da pessoa na base destino com base nos contatos da
      base origem}
      function AtualizaContatosPessoaDestino(const ASCodPessoa: string): Boolean;

      {Atualiza os contatos da pessoa na base destino com base nos contatos da
      base origem usando o CPF da pessoa como forma de busca}
      function AtualizaContatosPessoaDestinoPorCPF(const sCPF: string; sCodigoOrigem: String): Boolean;

      {Busca o código de uma pessoa baseado}
      function BuscaCodigoPorCPF(const sCPF: String): Integer;

      {Função para validar o CPF da pessoa}
      function ValidaCPF(sCPF: String): Boolean;

      {Atualiza os grupos da biblioteca}
      procedure AtualizaGruposBiblioteca;

      {Busca os grupos disponíveis da base destino}
      procedure BuscaGruposDestino;

      {Busca os tipos de contatos disponíveis da base destino}
      procedure BuscaContatosDestino;
   public
      constructor Create(
         AUMSvcIntegra: TUMSvcIntegraPessoasPadrao;
         const ChaveGrupo: String;
         const FColigadaDestino: Integer);

      {Realiza o processo de integração}
      function IntegraRegistro(var AUMIntegraBase: TUMIntegraBase;
         const AICodIntegracao, AICodParceiro: integer; ACAcao: Char;
         const ASChave, ASExtra: string; var ASErro: string;
         const ADtRegistro: TDateTime): TIntegraRegistroRet;
   end;

implementation

uses DB;

const
   SQL_SELECT_PESSOA_ORIGEM =
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

   SQL_SELECT_GRUPOS_PESSOA_ORIGEM =
      'SELECT g.ds_nome_grupo, g.ds_papel FROM nu_grupos g JOIN nu_grupos_pessoas gp USING (cd_grupo) WHERE gp.cd_pessoa = :cd_pessoa';

   SQL_VERIFICA_GRUPO =
      'SELECT count(cd_grupo) AS qtd FROM nu_grupos_pessoas WHERE cd_pessoa = :cd_pessoa AND cd_grupo = :cd_grupo ';

   SQL_SELECT_PESSOA_DESTINO =
      'SELECT cd_pessoa FROM pessoas WHERE cd_pessoa = :cd_pessoa OR (ds_cpf = :ds_cpf AND ds_cpf != ''00000000000'')';

   SQL_UPDATE_PESSOA_DESTINO =
      'UPDATE pessoas SET %s WHERE cd_pessoa = :cd_pessoa';

   SQL_INSERT_PESSOA_DESTINO =
      'INSERT INTO pessoas (%s) VALUES (%s)';

   SQL_DELETE_PESSOA_GRUPO_DESTINO =
      'DELETE FROM nu_grupos_pessoas WHERE cd_pessoa = :cd_pessoa';

   SQL_SELECT_GRUPOS_DESTINO =
      'SELECT cd_grupo, ds_nome_grupo, ds_papel FROM nu_grupos WHERE ds_nome_grupo LIKE ''% %s''';

   SQL_INSERT_PESSOA_GRUPO_DESTINO =
      'REPLACE INTO nu_grupos_pessoas (cd_grupo, cd_pessoa, cd_coligada) VALUES (:cd_grupo, :cd_pessoa, :cd_coligada)';

   SQL_SELECT_CONTATOS_PESSOA_ORIGEM =
      'SELECT ct.cd_contato, ct.ds_contato nm_contato, ct.ds_tipo_original, ct.sn_padrao, cp.ds_contato FROM contatos_tipos ct JOIN contatos_pessoas cp USING (cd_contato) WHERE cp.cd_pessoa = :cd_pessoa';

   SQL_INSERT_CONTATOS_PESSOA_DESTINO =
      'INSERT INTO contatos_pessoas (cd_pessoa, cd_contato, ds_contato) VALUES (:cd_pessoa, :cd_contato, :ds_contato)';

   SQL_SELECT_CONTATOS_DESTINO =
      'SELECT cd_contato, ds_contato FROM contatos_tipos';

   SQL_INSERT_CONTATO_DESTINO =
      'INSERT INTO contatos_tipos (ds_contato, sn_padrao, ds_tipo_original) VALUES (:ds_contato, :sn_padrao, :ds_tipo_original)';

   SQL_DELETE_CONTATOS_PESSOA_DESTINO =
      'DELETE FROM contatos_pessoas WHERE cd_pessoa = :cd_pessoa';

   SQL_ATUALIZA_HIERARQUIAS_GRUPO =
      'INSERT INTO NU_GRUPOS_HIERARQUIA (CD_GRUPO, CD_GRUPO_LIBERADO) ' +
      'SELECT A.CD_GRUPO, G.CD_GRUPO ' +
      'FROM NU_GRUPOS A, NU_GRUPOS G ' +
      'WHERE A.CD_GRUPO = 9 AND G.DS_NOME_GRUPO LIKE ''% %s'' AND NOT EXISTS ' +
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

   ERRO_UPDATE_PESSOA_DESTINO = '[ERRO] Ocorreu um erro ao tentar atualizar a pessoa [%s] na base de dados Destino:' + C_QUEBRA_TABULA + '%s';

   ERRO_INSERT_PESSOA_DESTINO = '[ERRO] Ocorreu um erro ao tentar inserir a pessoa [%s] na base de dados Destino:' + C_QUEBRA_TABULA + '%s';

   ERRO_SELECT_PESSOA_DESTINO = '[ERRO] Ocorreu um erro ao tentar buscar a pessoa [%s] na base de dados Destino:' + C_QUEBRA_TABULA + '%s';

   ERRO_INSERT_PESSOA_GRUPO_DESTINO = '[ERRO] Ocorreu um erro ao tentar incluir a pessoa [%s] no grupo de pessoas na base de dados Destino:' + C_QUEBRA_TABULA + '%s';

   ERRO_SELECT_GRUPOS_DESTINO = '[ERRO] Ocorreu um erro ao tentar buscar os grupos de pessoas Origem na base de dados Destino:' + C_QUEBRA_TABULA + '%s';

   ERRO_SELECT_GRUPOS_ORIGEM = '[ERRO] Ocorreu um erro ao tentar buscar os grupos da pessoa [%s] na base de dados Origem:' + C_QUEBRA_TABULA + '%s';

   ERRO_DELETE_PESSOA_GRUPO_DESTINO = '[ERRO] Ocorreu um erro ao tentar excluir os vínculdos da pessoa [%s] com os grupos de usuário na base de dados Destino:' + C_QUEBRA_TABULA + '%s';

   ERRO_SELECT_CONTATOS_DESTINO = '[ERRO] Ocorreu um erro ao tentar buscar os tipos de contatos na base de dados Destino:' + C_QUEBRA_TABULA + '%s';

   ERRO_DELETE_CONTATOS_PESSOA_DESTINO = '[ERRO] Ocorreu um erro ao tentar excluir os contatos da pessoa [%s] na base de dados Destino:' + C_QUEBRA_TABULA + '%s';

   ERRO_INSERT_CONTATO_PESSOA_DESTINO = '[ERRO] Ocorreu um erro ao tentar inserir o contato da pessoa [%s] na base de dados Destino:' + C_QUEBRA_TABULA + '%s';

   ERRO_SELECT_CONTATOS_PESSOA_ORIGEM = '[ERRO] Ocorreu um erro ao tentar buscar os contatos da pessoa [%s] na base de dados Origem:' + C_QUEBRA_TABULA + '%s';

   ERRO_INSERT_CONTATO_DESTINO = '[ERRO] Ocorreu um erro na tentativa de inserir um novo contato na base de dados Destino:' + C_QUEBRA_TABULA + '%s';

   C_UNHEX = 'UNHEX(%s)';

function TUMSvcIntegraPessoa.AtualizaContatosPessoaDestino(
  const ASCodPessoa: string): boolean;
begin
   Result := true;
   FQyContatosPessoaDestinoDelete.ParamByName('cd_pessoa').AsString := ASCodPessoa;
   try
      FQyContatosPessoaDestinoDelete.ExecSQL;
   except
      on E: Exception do
      begin
         FUMSvcIntegra.Log.log(Format(ERRO_DELETE_CONTATOS_PESSOA_DESTINO, [ASCodPessoa, E.Message]));
         Result := false;
      end;
   end;
   if Result then
   begin
      FQyContatosPessoaOrigemSelect.ParamByName('cd_pessoa').AsString := ASCodPessoa;
      try
         try
            FQyContatosPessoaOrigemSelect.Open;
            while not FQyContatosPessoaOrigemSelect.Eof do
            begin
               SetContatoPessoa(
                  ASCodPessoa,
                  FQyContatosPessoaOrigemSelect.FieldByName('ds_contato').AsString,
                  FQyContatosPessoaOrigemSelect.FieldByName('nm_contato').AsString,
                  FQyContatosPessoaOrigemSelect.FieldByName('sn_padrao').AsString,
                  FQyContatosPessoaOrigemSelect.FieldByName('ds_tipo_original').AsString,
                  FQyContatosPessoaOrigemSelect.FieldByName('cd_contato').AsInteger);
               FQyContatosPessoaOrigemSelect.Next;
            end;
         except
            on E: Exception do
            begin
               FUMSvcIntegra.Log.log(Format(ERRO_SELECT_CONTATOS_PESSOA_ORIGEM, [ASCodPessoa, E.Message]));
               Result := false;
            end;
         end;
      finally
         FQyContatosPessoaOrigemSelect.Close;
      end;
   end;
end;

function TUMSvcIntegraPessoa.AtualizaContatosPessoaDestinoPorCPF(
  const sCPF: string; sCodigoOrigem: String): Boolean;
var
   CodigoBaseDestino: String;  
begin
   Result := true;

   // Busca uma vez para não precisar executar várias vezes o mesmo SQL.
   CodigoBaseDestino := IntToStr(BuscaCodigoPorCPF(sCPF));

   FQyContatosPessoaDestinoDelete.ParamByName('cd_pessoa').AsString := CodigoBaseDestino;
   try
      FQyContatosPessoaDestinoDelete.ExecSQL;
   except
      on E: Exception do
      begin
         FUMSvcIntegra.Log.log(Format(ERRO_DELETE_CONTATOS_PESSOA_DESTINO, [CodigoBaseDestino, E.Message]));
         Result := false;
      end;
   end;
   if Result then
   begin
      FQyContatosPessoaOrigemSelect.ParamByName('cd_pessoa').AsString := sCodigoOrigem;
      try
         try
            FQyContatosPessoaOrigemSelect.Open;
            
            while not FQyContatosPessoaOrigemSelect.Eof do
            begin
               SetContatoPessoa(
                  CodigoBaseDestino,
                  FQyContatosPessoaOrigemSelect.FieldByName('ds_contato').AsString,
                  FQyContatosPessoaOrigemSelect.FieldByName('nm_contato').AsString,
                  FQyContatosPessoaOrigemSelect.FieldByName('sn_padrao').AsString,
                  FQyContatosPessoaOrigemSelect.FieldByName('ds_tipo_original').AsString,
                  FQyContatosPessoaOrigemSelect.FieldByName('cd_contato').AsInteger
               );
               
               FQyContatosPessoaOrigemSelect.Next;
            end;
         except
            on E: Exception do
            begin
               FUMSvcIntegra.Log.log(Format(ERRO_SELECT_CONTATOS_PESSOA_ORIGEM, [CodigoBaseDestino, E.Message]));
               Result := false;
            end;
         end;
      finally
         FQyContatosPessoaOrigemSelect.Close;
      end;
   end;
end;

procedure TUMSvcIntegraPessoa.AtualizaGruposBiblioteca;
begin
   FUMSvcIntegra.ConDestino.getConexao.ExecuteDirect(StringReplace(SQL_ATUALIZA_HIERARQUIAS_GRUPO, '%s', Self.FChaveGrupo, [rfReplaceAll, rfIgnoreCase]));
   FUMSvcIntegra.ConDestino.getConexao.ExecuteDirect(SQL_ATUALIZA_GRUPOS_BIBLIOTECA);
   FUMSvcIntegra.ConDestino.getConexao.ExecuteDirect(SQL_ATUALIZA_MODALIDADES_GRUPO);
end;

function TUMSvcIntegraPessoa.AtualizaGruposPessoaDestino(
  const ASCodPessoa: string): boolean;
begin
   Result := true;

   if Result then
   begin
      FQyGruposOrigemSelect.ParamByName('cd_pessoa').AsString := ASCodPessoa;
      try
         try
            FQyGruposOrigemSelect.Open;
            while not FQyGruposOrigemSelect.Eof do
            begin
               if FQyGruposDestinoSelect.Locate('ds_nome_grupo', FQyGruposOrigemSelect.FieldByName('ds_nome_grupo').AsString + ' ' + Self.FChaveGrupo, []) then
               begin
                  SetGrupoPessoa(ASCodPessoa, FQyGruposDestinoSelect.FieldByName('cd_grupo').AsInteger);
               end;
               FQyGruposOrigemSelect.Next;
            end;
         except
            on E: Exception do
            begin
               FUMSvcIntegra.Log.log(Format(ERRO_SELECT_GRUPOS_ORIGEM, [ASCodPessoa, E.Message]));
               Result := false;
            end;
         end;
      finally
         FQyGruposOrigemSelect.Close;
      end;
   end;
end;

function TUMSvcIntegraPessoa.AtualizaGruposPessoaDestinoPorCPF(
   const sCPF: string;
   sCodigoOrigem: String): boolean;
var
   CodigoBaseDestino: String;   
begin
   Result := true;

   CodigoBaseDestino := IntToStr(BuscaCodigoPorCPF(sCPF));
   
   if Result then
   begin
      FQyGruposOrigemSelect.ParamByName('cd_pessoa').AsString := sCodigoOrigem;
      try
         try
            FQyGruposOrigemSelect.Open;
            while not FQyGruposOrigemSelect.Eof do
            begin
               if FQyGruposDestinoSelect.Locate('ds_nome_grupo', FQyGruposOrigemSelect.FieldByName('ds_nome_grupo').AsString + ' ' + Self.FChaveGrupo , []) then
               begin
                  SetGrupoPessoa(CodigoBaseDestino, FQyGruposDestinoSelect.FieldByName('cd_grupo').AsInteger);
               end;
               FQyGruposOrigemSelect.Next;
            end;
         except
            on E: Exception do
            begin
               FUMSvcIntegra.Log.log(Format(ERRO_SELECT_GRUPOS_ORIGEM, [CodigoBaseDestino, E.Message]));
               Result := false;
            end;
         end;
      finally
         FQyGruposOrigemSelect.Close;
      end;
   end;
end;

{**
   Este método executa a atualização dos dados da pessoa na base de dados
   Destino. O método recebe como parâmetro um comando SQL do tipo Update que será
   executado na base de dados Destino. Em caso de erro o retorno da função é
   False. Em caso de sucesso o retorno é True.
}
function TUMSvcIntegraPessoa.AtualizaPessoaDestino(
  const ASSQLUpdate, ASCodPessoa: string): boolean;
begin
   Result := true;
   FQyPessoasDestinoUpdate.SQL.Text := ASSQLUpdate;
   FQyPessoasDestinoUpdate.ParamByName('cd_pessoa').AsString := ASCodPessoa;
   try
      FQyPessoasDestinoUpdate.ExecSQL;   
   except
      on E: Exception do
      begin
         FUMSvcIntegra.Log.log(Format(ERRO_UPDATE_PESSOA_DESTINO, [ASCodPessoa, E.Message]));
         Result := false;
      end;
   end;
end;

function TUMSvcIntegraPessoa.AtualizaPessoaDestinoPorCPF(const ASSQLUpdate,
  sCPF: String): boolean;
begin
   Result := AtualizaPessoaDestino(
      ASSQLUpdate,
      IntToStr(BuscaCodigoPorCPF(sCPF))
   );
end;

function TUMSvcIntegraPessoa.BuscaCodigoPorCPF(const sCPF: String): Integer;
const
   SQL_BUSCA_CODIGO = 'SELECT cd_pessoa FROM pessoas WHERE ds_cpf = :ds_cpf';
var
   qryBuscaCodigoDestino: TUMZReadOnlyQuery;   
begin
   qryBuscaCodigoDestino := FUMSvcIntegra.ConDestino.newROQuery;

   qryBuscaCodigoDestino.SQL.Text := SQL_BUSCA_CODIGO;
   qryBuscaCodigoDestino.ParamByName('ds_cpf').AsString := sCPF;
   qryBuscaCodigoDestino.Open;

   Result := qryBuscaCodigoDestino.FieldByName('cd_pessoa').AsInteger;
end;

procedure TUMSvcIntegraPessoa.BuscaContatosDestino;
begin
   try
      FQyContatosDestinoSelect.Open;
   except
      on E: Exception do
         FUMSvcIntegra.Log.log(Format(ERRO_SELECT_CONTATOS_DESTINO, [E.Message]));
   end;
end;

procedure TUMSvcIntegraPessoa.BuscaGruposDestino;
begin
   try
      FQyGruposDestinoSelect.Open;
   except
      on E: Exception do
         FUMSvcIntegra.Log.log(Format(ERRO_SELECT_GRUPOS_DESTINO, [E.Message]));
   end;
end;

constructor TUMSvcIntegraPessoa.Create(
         AUMSvcIntegra: TUMSvcIntegraPessoasPadrao;
         const ChaveGrupo: String;
         const FColigadaDestino: Integer);
begin
   FUMSvcIntegra := AUMSvcIntegra;

   Self.FChaveGrupo := ChaveGrupo;

   FQyGruposDestinoSelect := FUMSvcIntegra.ConDestino.newROQuery;
   FQyGruposOrigemSelect := FUMSvcIntegra.ConOrigem.newROQuery;
   FQyGrupoPessoaDestinoInsert := FUMSvcIntegra.ConDestino.newQuery;
   FQyGrupoPessoaDestinoDelete := FUMSvcIntegra.ConDestino.newQuery;
   FQyPessoasOrigemSelect := FUMSvcIntegra.ConOrigem.newROQuery;
   FQyPessoasDestinoSelect := FUMSvcIntegra.ConDestino.newROQuery;
   FQyPessoasDestinoInsert := FUMSvcIntegra.ConDestino.newQuery;
   FQyPessoasDestinoUpdate := FUMSvcIntegra.ConDestino.newQuery;
   FQyContatosDestinoSelect := FUMSvcIntegra.ConDestino.newROQuery;
   FQyContatosPessoaOrigemSelect := FUMSvcIntegra.ConOrigem.newROQuery;
   FQyContatosDestinoInsert := FUMSvcIntegra.ConDestino.newQuery;
   FQyContatosPessoaDestinoDelete := FUMSvcIntegra.ConDestino.newQuery;
   FQyContatosPessoaDestinoInsert := FUMSvcIntegra.ConDestino.newQuery;
   qyVerificaGrupo := FUMSvcIntegra.ConDestino.newROQuery;

   FQyGruposDestinoSelect.SQL.Text := StringReplace(SQL_SELECT_GRUPOS_DESTINO, '%s', Self.FChaveGrupo, [rfReplaceAll]);
   FQyGruposOrigemSelect.SQL.Text := SQL_SELECT_GRUPOS_PESSOA_ORIGEM;
   FQyGrupoPessoaDestinoInsert.SQL.Text := SQL_INSERT_PESSOA_GRUPO_DESTINO;

   FQyGrupoPessoaDestinoInsert.ParamByName('cd_coligada').AsInteger :=
      FColigadaDestino;

   FQyGrupoPessoaDestinoDelete.SQL.Text := SQL_DELETE_PESSOA_GRUPO_DESTINO;
   FQyPessoasOrigemSelect.SQL.Text := SQL_SELECT_PESSOA_ORIGEM;
   FQyPessoasDestinoSelect.SQL.Text := SQL_SELECT_PESSOA_DESTINO;
   FQyContatosDestinoSelect.SQL.Text := SQL_SELECT_CONTATOS_DESTINO;
   FQyContatosPessoaOrigemSelect.SQL.Text := SQL_SELECT_CONTATOS_PESSOA_ORIGEM;
   FQyContatosPessoaDestinoInsert.SQL.Text := SQL_INSERT_CONTATOS_PESSOA_DESTINO;
   FQyContatosDestinoInsert.SQL.Text := SQL_INSERT_CONTATO_DESTINO;
   FQyContatosPessoaDestinoDelete.SQL.Text := SQL_DELETE_CONTATOS_PESSOA_DESTINO;
   qyVerificaGrupo.SQL.Text := SQL_VERIFICA_GRUPO;
   
   BuscaGruposDestino;
   BuscaContatosDestino;
end;

{**
   Este método busca todos os dados da pessoa a ser integrada na base de dados
   da Origem. O método retorno uma lista de Strings com todas as informações da
   pessoa que está sendo integrada. A chave de cada valor da lista de Strings
   é o nome do campo na tabela Pessoas, sendo o valor o próprio valor do campo.
}
function TUMSvcIntegraPessoa.GetDadosPessoaOrigem(
  const ASCodPessoa: string): TStringList;
var
   I: integer;
begin
   Result := TStringList.Create;

   FQyPessoasOrigemSelect.ParamByName('cd_pessoa').AsString := ASCodPessoa;
   
   try
      FQyPessoasOrigemSelect.Open;
      
      if not FQyPessoasOrigemSelect.IsEmpty then
      begin
         for I := 0 to FQyPessoasOrigemSelect.FieldCount - 1 do
         begin
            if FQyPessoasOrigemSelect.Fields[I].FieldName <> 'im_pessoa' then
            begin
               if FQyPessoasOrigemSelect.Fields[I].DataType in [ftDate, ftDateTime] then
               begin
                  Result.Values[FQyPessoasOrigemSelect.Fields[I].FieldName] :=
                     FormatDateTime('yyyy-mm-dd 00:00:00', FQyPessoasOrigemSelect.Fields[I].AsDateTime)
               end
               else
               begin
                  Result.Values[FQyPessoasOrigemSelect.Fields[I].FieldName] :=
                     FQyPessoasOrigemSelect.Fields[I].AsString;
               end;
            end;
         end;
      end;
   finally
      FQyPessoasOrigemSelect.Close;
   end;
end;

{**
   Este método efetua a inclusão de uma pessoa consultada na base de dados Origem
   na base de dados Destino. Caso a inclusão não possa ser executada, devido a
   erro, o retorno do método será False. Em caso de sucesso o retorno será True.
}
function TUMSvcIntegraPessoa.IncluiPessoaDestino(
   const ASSQLInsert, ASCodPessoa: string): boolean;
begin
   Result := true;
   try
      FQyPessoasDestinoInsert.SQL.Text := ASSQLInsert;
      FQyPessoasDestinoInsert.ExecSQL;
   except
      on E: Exception do
      begin
         FUMSvcIntegra.Log.log(Format(ERRO_INSERT_PESSOA_DESTINO, [ASCodPessoa, E.Message]));
         Result := false;
      end;
   end;
end;

{**
   Executa a integração de um registro pendente de pessoa na base de dados Origem
   na base de dados da Destino. As ações permitidas para integração de pessoas
   são "(I)nclusão" e "(A)lteração". Porém, antes de definir se será uma
   inclusão ou alteração, o sistema busca a pessoa na base de dados Destino, para
   definir que tipo de integração será executada: Inclusão ou Alteração.
}
function TUMSvcIntegraPessoa.IntegraRegistro(
   var AUMIntegraBase: TUMIntegraBase; const AICodIntegracao,
   AICodParceiro: integer; ACAcao: Char; const ASChave, ASExtra: string;
   var ASErro: string; const ADtRegistro: TDateTime): TIntegraRegistroRet;
var
   LSlDadosPessoa: TStringList;
   rbPessoa: TResultadoBusca;
begin
   Result := irrSuccess;
   try
      LSlDadosPessoa := GetDadosPessoaOrigem(ASChave);

      {Se existe ao menos UMA pessoa}
      if LSlDadosPessoa.Count > 0 then
      begin
      
         {Verifica se existe uma pessoa na base destino com mesmo CPF ou CÓDIGO}
         rbPessoa := IsPessoaExistente(ASChave, LSLDadosPessoa.Values['ds_cpf']);

         {Verifica se é parar inserir DADOS da pessoa}
         if ACAcao in['I', 'A'] then
         begin

            {Caso ja exista uma pessoa com o mesmo CÓDIGO atualiza seus dados}
            if (rbPessoa = rbCodigo) then
            begin

               {Atualiza dados da pessoa}
               if AtualizaPessoaDestino(MontaQueryUpdate(LSlDadosPessoa), ASChave) then
               begin
                  Result := irrSuccess
               end
               else
               begin
                  Result := irrFailed;
               end;
               
            end
            {Caso não exista insere a pessoa}
            else if rbPessoa = rbNotFound then
            begin

               if IncluiPessoaDestino(MontaQueryInsert(LSlDadosPessoa), ASChave) then
               begin
                  Result := irrSuccess
               end
               else
               begin
                  Result := irrFailed;
               end;
            end
            {Caso exista uma pessoa com CPF igual mas codigo diferentes}
            else if rbPessoa = rbCPF then
            begin
               {Atualiza dados da pessoa}
               if AtualizaPessoaDestinoPorCPF(
                     MontaQueryUpdatePorCPF(LSlDadosPessoa),
                     LSLDadosPessoa.Values['ds_cpf']
                  ) then
               begin
                  Result := irrSuccess
               end
               else
               begin
                  Result := irrFailed;
               end;
            end;

            {Caso ja existe uma pessoa com o mesmo código OU tenha sido
            inserida com sucesso} 
            if (rbPessoa = rbCodigo) and (Result = irrSuccess) then
            begin

               {Atualiza os grupos da mesma}
               if not AtualizaGruposPessoaDestino(ASChave) then
               begin
                  Result := irrFailed;
               end;
               
               {Atualiza os contatos da mesma}
               if AtualizaContatosPessoaDestino(ASChave) then
               begin
                  Result := irrFailed;
               end;
            end;

            {Caso ja existe uma pessoa com o mesmo CPF OU tenha sido
            inserida com sucesso}
            if (rbPessoa = rbCPF) and (Result = irrSuccess) then
            begin
            
               {Atualiza os grupos da mesma}
               if not AtualizaGruposPessoaDestinoPorCPF(LSLDadosPessoa.Values['ds_cpf'], ASChave) then
               begin
                  Result := irrFailed;
               end;
               
               {Atualiza os contatos da mesma}
               if AtualizaContatosPessoaDestinoPorCPF(LSLDadosPessoa.Values['ds_cpf'], ASChave) then
               begin
                  Result := irrFailed;
               end;
               
            end;

         end
         {Verifica se é para atualizar GRUPOS}
         else if ACAcao = 'G' then
         begin
            Result := irrSuccess;

            {Caso ainda não tenha sido inserida, insere}            
            if rbPessoa = rbNotFound then
            begin

               if IncluiPessoaDestino(MontaQueryInsert(LSlDadosPessoa), ASChave) then
               begin

                  {Caso foi inserida com sucesso, insere também os contatos da
                  pessoa}
                  AtualizaContatosPessoaDestino(ASChave);
                  Result := irrSuccess;
               end
               else
               begin
                  Result := irrFailed;
               end;
            end;

            {Caso pessoa tenha sido inserida com sucesso OU o código na base
            destino é igual, insere ela nos respectivos GRUPOS}
            if ((Result = irrSuccess) and (rbPessoa = rbNotFound)) OR (rbPessoa = rbCodigo) OR (rbPessoa = rbCPF) then
            begin

               {Atualiza GRUPOS da pessoa pelo CPF}
               if rbPessoa = rbCPF then
               begin

                  Result := irrFailed;

                  if AtualizaGruposPessoaDestinoPorCPF(LSLDadosPessoa.Values['ds_cpf'], ASChave) then
                  begin
                     Result := irrSuccess;
                  end;
               end;

               {Atualiza GRUPOS da pessoa pelo codigo}
               if rbPessoa = rbCodigo then
               begin

                  Result := irrFailed;

                  if AtualizaGruposPessoaDestino(ASChave) then
                  begin
                     Result := irrSuccess
                  end;
               end;
            end;
         end
         {Verifica se é para atualizar CONTATOS}
         else if ACAcao = 'C' then
         begin
            Result := irrSuccess;

            {Caso ainda não tenha sido inserida, insere}
            if rbPessoa = rbNotFound then
            begin

               if IncluiPessoaDestino(MontaQueryInsert(LSlDadosPessoa), ASChave) then
               begin
                  Result := irrSuccess
               end
               else
               begin
                  Result := irrFailed;
               end;
            end;

            {Caso pessoa tenha sido inserida com sucesso OU o código na base
            destino é igual, insere para ela os seus respectivos CONTATOS}      
            if ((Result = irrSuccess) and (rbPessoa = rbNotFound)) OR (rbPessoa = rbCodigo) OR (rbPessoa = rbCPF) then
            begin

               {Atualiza CONTATOS da pessoa pelo CPF}
               if rbPessoa = rbCPF then
               begin
                  AtualizaContatosPessoaDestinoPorCPF(LSLDadosPessoa.Values['ds_cpf'], ASChave);
               end;

               {Atualiza CONTATOS da pessoa pelo Código}
               if rbPessoa = rbCodigo then
               begin
                  if AtualizaContatosPessoaDestino(ASChave) then
                  begin
                     Result := irrSuccess
                  end
                  else
                  begin
                     Result := irrFailed;
                  end;
               end;
            end;
         end;
         
         AtualizaGruposBiblioteca;

      end;
   finally
      FreeAndNil(LSlDadosPessoa);
   end;
end;

{**
   Verifica se a pessoa que será integrada já está cadastrada na base de dados
   da Destino, para definir se a integração será do tipo inclusão ou alteração.
}
function TUMSvcIntegraPessoa.IsPessoaExistente(
  const ASCodPessoa: string; const ASCPF: string): TResultadoBusca;
begin
   Result := rbNotFound;
   FQyPessoasDestinoSelect.ParamByName('cd_pessoa').AsString := ASCodPessoa;
   FQyPessoasDestinoSelect.ParamByName('ds_cpf').AsString := ASCPF;
   
   try
      try
         FQyPessoasDestinoSelect.Open;

         if FQyPessoasDestinoSelect.IsEmpty then
         begin
            Result := rbNotFound
         end
         else
         begin
            if FQyPessoasDestinoSelect.FieldByName('cd_pessoa').AsString = ASCodPessoa then
            begin
               Result := rbCodigo
            end
            else
            begin

               if ValidaCPF( ASCPF ) then
               begin
                  Result := rbCPF;         
               end
               else
               begin
                  Result := rbCPFInvalido;
               end;
            end;
         end;
         
      except
         on E: Exception do
         begin
            FUMSvcIntegra.Log.log(Format(ERRO_SELECT_PESSOA_DESTINO, [ASCodPessoa, E.Message]));
         end;
      end;
   finally
      FQyPessoasDestinoSelect.Close;
   end;
end;

{**
   Este método recebe como parâmetro uma lista de Strings que contém os dados da
   pessoa que será integrada, sendo a chave de cada valor o campo na tabela de
   pessoas. Com estas informações o método monta uma lista de campos (chave da
   String), separados por vírgula, e uma lista de valores separados por vírgula.
   Por fim, monta um comando SQL Insert e retorna-o. 
}
function TUMSvcIntegraPessoa.MontaQueryInsert(
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
   Result := Format(SQL_INSERT_PESSOA_DESTINO, [LSCampos, LSValores]);
end;

{**
   Este método recebe como parâmetro uma lista de Strings que contém os dados da
   pessoa que será integrada, sendo a chave de cada valor o campo na tabela de
   pessoa. Com estas informações o método monta uma lista de campos que serão
   atualizados para a pessoa na base de dados Destino e monta uma comando SQL
   Update que será o retorno do método.
}
function TUMSvcIntegraPessoa.MontaQueryUpdate(
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
   Result := Format(SQL_UPDATE_PESSOA_DESTINO, [LSCamposValores]);
end;

function TUMSvcIntegraPessoa.MontaQueryUpdatePorCPF(
  const ASlDadosPessoa: TStringList): string;
var
   LSCamposValores: string;
   I: integer;
begin
   LSCamposValores := '';
   
   for I := 0 to ASlDadosPessoa.Count - 1 do
   begin

      if Pos('cd_', ASlDadosPessoa.Names[i]) > 0 then
      begin
        Continue;
      end;

      if LSCamposValores <> '' then
      begin
         LSCamposValores := LSCamposValores + ',';
      end;
      
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
   
   Result := Format(SQL_UPDATE_PESSOA_DESTINO, [LSCamposValores]);
end;

function TUMSvcIntegraPessoa.SetContatoPessoa(const ASCodPessoa,
  ASContato, ASNomeContato, ASPadrao, ASTipoOriginal: string;
  const AICodContato: integer): boolean;

  function GetContatoTipo: integer;
   begin
      if FQyContatosDestinoSelect.Locate('ds_contato', ASNomeContato, [loCaseInsensitive]) then
         Result := FQyContatosDestinoSelect.FieldByName('cd_contato').AsInteger
      else
      begin
         FQyContatosDestinoInsert.ParamByName('ds_contato').AsString := ASNomeContato;
         FQyContatosDestinoInsert.ParamByName('sn_padrao').AsString := ASPadrao;
         FQyContatosDestinoInsert.ParamByName('ds_tipo_original').AsString := ASTipoOriginal;
         try
            FQyContatosDestinoInsert.ExecSQL;
         except
            on E: Exception do
               raise Exception.CreateFmt(ERRO_INSERT_CONTATO_DESTINO, [E.Message]);
         end;
         FQyContatosDestinoSelect.Close;
         try
            BuscaContatosDestino;
            Result := GetContatoTipo;
         except
            on Exception do raise;
         end;
      end;
   end;

begin
   Result := true;
   try
      FQyContatosPessoaDestinoInsert.ParamByName('cd_pessoa').AsString := ASCodPessoa;
      FQyContatosPessoaDestinoInsert.ParamByName('ds_contato').AsString := ASContato;
      if AICodContato < 5 then
         FQyContatosPessoaDestinoInsert.ParamByName('cd_contato').AsInteger := AICodContato
      else
         FQyContatosPessoaDestinoInsert.ParamByName('cd_contato').AsInteger := GetContatoTipo;
      FQyContatosPessoaDestinoInsert.ExecSQL;      
   except
      on E: Exception do
      begin
         FUMSvcIntegra.Log.log(Format(ERRO_INSERT_CONTATO_PESSOA_DESTINO, [ASCodPessoa, E.Message]));
         Result := false;
      end;
   end;
end;

function TUMSvcIntegraPessoa.SetGrupoPessoa(const ASCodPessoa: string;
  const AICodGrupo: integer): boolean;
begin
   Result := true;

   qyVerificaGrupo.Params.Clear;

   qyVerificaGrupo.SQL.Text := '';
   qyVerificaGrupo.SQL.Text := SQL_VERIFICA_GRUPO;

   qyVerificaGrupo.ParamByName('cd_pessoa').AsString := ASCodPessoa;
   qyVerificaGrupo.ParamByName('cd_grupo').AsInteger := AICodGrupo;

   qyVerificaGrupo.Open;

   if qyVerificaGrupo.FieldByName('qtd').AsInteger > 0 then
   begin
      Exit;   
   end;

   try
      FQyGrupoPessoaDestinoInsert.ParamByName('cd_grupo').AsInteger := AICodGrupo;
      FQyGrupoPessoaDestinoInsert.ParamByName('cd_pessoa').AsString := ASCodPessoa;
      FQyGrupoPessoaDestinoInsert.ExecSQL;
   except
      on E: Exception do
      begin
         FUMSvcIntegra.Log.log(Format(ERRO_INSERT_PESSOA_GRUPO_DESTINO, [ASCodPessoa, E.Message]));
         Result := false;
      end;
   end;
end;

function TUMSvcIntegraPessoa.ValidaCPF(sCPF: String): Boolean;
var
  strCPF1, strCPF2  : String;
  n : Byte;
  i: Integer;
  CPF: char;
  intSoma : Integer;
  flgDig1, flgDig2 : Boolean;
begin

   Result := False;
   
   try
      flgDig1 := False;
      flgDig2 := False;

      while Pos( ',', sCPF ) <> 0 do
      begin
         Delete( sCPF, Pos( ',', sCPF ), 1 );
      end;

      while Pos( '.', sCPF ) <> 0 do
      begin
         Delete( sCPF, Pos( '.', sCPF ), 1 );
      end;

      while Pos( '-', sCPF ) <> 0 do
      begin
         Delete( sCPF, Pos( '-', sCPF ), 1 );
      end;

      if Length( sCPF ) <> 11 then
      begin
         Exit;
      end;

      cpf := sCPF[1];

      {Verifica se nenhum carácter é repetido}
      for I := 2 to Length(sCPF)+1  do
      begin
         if (sCPF[i] <> cpf) then
         begin
            Break;
         end;

         if i = 11 then
         begin
            Result := false;
            Exit
         end;
     end;

      strCPF1 := Copy( sCPF, 1, 9 );
      strCPF2 := Copy( sCPF, 1, 10 );

      { TESTA DIGITO 1 }
      intSoma := 0;
      for n := 1 to Length( strCPF1 ) do
      begin
         intSoma := intSoma + ( StrToInt( strCPF1[n] ) * ( 10 - n + 1 ) );
      end;

      intSoma := intSoma - ( ( intSoma div 11 ) * 11 );

      if intSoma < 2 then
      begin
         intSoma := 0;
      end
      else
      begin
         intSoma := 11 - intSoma;
      end;

      if IntToStr( intSoma ) = Copy( sCPF, 10, 1 ) then
      begin
         flgDig1 := True;
      end;

     { TESTA DIGITO 2 }
      intSoma := 0;

      for n := 1 to Length( strCPF2 ) do
      begin
         intSoma := intSoma + ( StrToInt( strCPF2[n] ) * ( 11 - n + 1 ) );
      end;

      intSoma := intSoma - ( ( intSoma div 11 ) * 11 );

      if intSoma < 2 then
      begin
         intSoma := 0;
      end
      else
      begin
         intSoma := 11 - intSoma;
      end;

      if IntToStr( intSoma ) = Copy( sCPF, 11, 1 ) then
      begin
         flgDig2 := True;
      end;

   except
      Result := False;
   end;

   Result := flgDig1 and flgDig2;
end;

end.
