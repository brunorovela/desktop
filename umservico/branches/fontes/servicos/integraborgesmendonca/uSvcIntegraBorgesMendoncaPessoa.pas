{ Nesta Unit estão programadas as rotinas para integração das informações de
  pessoas entre as bases de dados do COC, Decisão e Borges de Mendonça.
  A finalidade é manter a base de dados do Borges de Mendonça sempre atualizada
  com os dados de pessoas das bases de dados do COC e Decisão.
  Além das informações cadastrais da pessoa, são integradas também os contatos
  da pessoa a os vínculos com os grupos de usuário.
}
unit uSvcIntegraBorgesMendoncaPessoa;

interface

uses
   Classes, uSvcClasses, uDMConexao, uIntegraBase, uSvcIntegraBorgesMendonca,
   ZAbstractRODataset, SysUtils, ZStoredProcedure, UZDataSet;

type
   { Esta enumeração lista as origens válidas dos dados a serem integrados.
     boCOC: os dados a serem integrados são provenientes da base de dados do COC
     boDecisao: os dados a serem integrados são provenientes da base de dados do Decisão
   }
   TUMBaseOrigem = (boCOC, boDecisao);

   { Esta enumeração lista os tipos de ação para a integração de pessoas. Uma
     integração de pessoa pode ser do tipos:
     apInserir: inserção de uma nova pessoa no sistema
     apAlterar: alteração dos dados cadastrais de uma pessoa já existente no sistema
   }
   TUMAcaoPessoa = (apInserir, apAlterar);

   { A classe TUMPessoa possui todas as infomações cadastrais de pessoas definidas
     na tabelas de pessoas do Unimestre, além das informações de contatos e grupos
     de usuários da pessoa.
   }
   TUMPessoa = class(TObject)
   strict private
      FSlDados: TStringList;
      FSlGrupos: TStringList;
      FSlContatos: TStringList;
      function getCodigo: string;
      function getDado(const ASChave: string): string;
      function getGruposCount: integer;
      function getContatosCount: integer;
      function getGrupo(const i: integer): string;
      function getContato(const i: integer): string;
      function getCodGrupo(const i: integer): string;
      function getTipoContato(const i: integer): string;
   private
      constructor Create(const ASCodPessoa: string);
      destructor Destroy;
      procedure adicionaGrupo(const ASGrupo, ASCodigo: string);
      procedure adicionaContato(const ASTipo, ASContato: string);
      procedure carregaDadosFromQuery(AQyPessoa: TUMZReadOnlyQuery);
      property Codigo: string read getCodigo;
      property GruposCount: integer read getGruposCount;
      property ContatosCount: integer read getContatosCount;
      property Dados[const s: string]: string read getDado;
      property Grupos[const i: integer]: string read getGrupo;
      property Contatos[const i: integer]: string read getContato;
      property CodigosGrupos[const i: integer]: string read getCodGrupo;
      property TiposContatos[const i: integer]: string read getTipoContato;
   end;

   { A classe TUMSvcIntegraBorgesMendoncaPessoa implementa a interface IUMIntegraRegistros.
     Esta classe é responsável por efetuar a integração dos dados de pessoa do
     Unimestre entre as bases de dados do COC, Decisão e Borges de Mendonça.
     A integração dos dados é em direção ao Borges de Mendonça, ou seja, os dados
     serão lidos das bases do COC e Decisão e sincronizadas na base do Borges de
     Mendonça.
   }
   TUMSvcIntegraBorgesMendoncaPessoa = class(TInterfacedObject, IUMIntegraRegistros)
   strict private
      FUMIntegraBorges: TUMSvcIntegraBorgesMendonca; // referência para o objeto de serviço
      FQyPessoasCOC: TUMZReadOnlyQuery;     // query para efetuar a busca dos dados de pessoa no COC
      FQyPessoasDecisao: TUMZReadOnlyQuery; // query para efetuar a busca dos dados de pessoa no Decisão
      FQyPessoasBorges: TUMZQuery;          // query para efetuar a integração de pessoas no Borges
      FQyContatosCOC: TUMZReadOnlyQuery;    // query para efetuar a busca dos dados de contatos no COC
      FQyContatosDecisao: TUMZReadOnlyQuery;// query para efetuar a busca dos dados de contatos no Decisão 
      FQyContatosBorges: TUMZQuery;         // query para efetuar a integração de contatos de pessoa no Borges
      FQyGruposCOC: TUMZReadOnlyQuery;      // query para efetuar a busca dos dados de grupos no COC
      FQyGruposDecisao: TUMZReadOnlyQuery;  // query para efetuar a busca dos dados de grupos no Decisão 
      FQyGruposBorges: TUMZQuery;           // query para efetuar a integração dos dados de grupos de usuários no Borges
      function getDadosPessoaCOC(AUMPessoa: TUMPessoa): boolean;
      function getDadosPessoaDecisao(AUMPessoa: TUMPessoa): boolean;
      function getContatosPessoaCOC(AUMPessoa: TUMPessoa): boolean;
      function getContatosPessoaDecisao(AUMPessoa: TUMPessoa): boolean;
      function getGruposPessoaCOC(AUMPessoa: TUMPessoa): boolean;
      function getGruposPessoaDecisao(AUMPessoa: TUMPessoa): boolean;
      procedure integraPessoaBorges(AUMPessoa: TUMPessoa; const AUMAcaoPessoa: TUMAcaoPessoa);
      procedure adicionaPessoaBorges(AUMPessoa: TUMPessoa);
      procedure adicionaContatosPessoaBorges(AUMPessoa: TUMPessoa);
      procedure adicionaGruposPessoaBorges(AUMPessoa: TUMPessoa; const AUMBaseOrigem: TUMBaseOrigem);
      procedure alteraPessoaBorges(AUMPessoa: TUMPessoa);
      procedure alteraContatosPessoaBorges(AUMPessoa: TUMPessoa);
      procedure alteraGruposPessoaBorges(AUMPessoa: TUMPessoa; const AUMBaseOrigem: TUMBaseOrigem);
   public
      constructor Create(AUMIntegraBorges: TUMSvcIntegraBorgesMendonca);
      destructor Destroy; override;
      function IntegraRegistro(var AUMIntegraBase: TUMIntegraBase;
         const AICodIntegracao, AICodParceiro: integer; ACAcao: Char;
         const ASChave, ASExtra: string; var ASErro: string;
         const ADtRegistro: TDateTime): TIntegraRegistroRet;
   end;

implementation

uses DB;

const
   // busca os dados cadastrais da pessoa
   SQL_GET_PESSOA =
      'SELECT '+
         'cd_pessoa, cd_resp_finan, cd_resp_acad, cd_mae, cd_pai, nm_pessoa,'+
         'nm_contato, DATE_FORMAT(dt_nascimento, ''%Y-%m-%d %T'') dt_nascimento,'+
         'ds_cidade_nascimento, cd_municipio, ds_estado_nascimento, ds_pais_nascimento,'+
         'cd_pais, cd_pais_nascimento, cd_logradouro, ds_logradouro, ds_logradouro_nro,'+
         'ds_complemento, ds_cep, ds_bairro, ds_cidade, ds_estado, ds_pais, ds_sexo,'+
         'ds_nacionalidade, ds_identidade, cd_orgao_emissor, ds_identidade_orgao_exp,'+
         'DATE_FORMAT(dt_identidade_expedicao, ''%Y-%m-%d %T'') dt_identidade_expedicao,'+
         'ds_cpf, ds_rm_corporacao, nr_dia_vencimento, sn_nao_bloquear_financeiro,'+
         'ds_rm_org_numero, DATE_FORMAT(dt_rm_exp, ''%Y-%m-%d %T'') dt_rm_exp,'+
         'ds_rm_doc_numero, ds_rm_orgao, ds_rm_doc_tipo, ds_titulo_numero, ds_titulo_secao,'+
         'ds_titulo_zona, DATE_FORMAT(dt_titulo_emissao, ''%Y-%m-%d %T'') dt_titulo_emissao,'+
         'nm_pai, nm_mae, cd_estado_civil, ds_estado_civil, nm_conjuge, cd_usuario,'+
         'DATE_FORMAT(dt_revisao, ''%Y-%m-%d %T'') dt_revisao,'+
         'DATE_FORMAT(dt_cadastro, ''%Y-%m-%d %T'') dt_cadastro, nm_sem_acento,'+
         'ds_arquivo_documento, cd_empresa, ds_cargo, ds_observacao, ds_login, ds_senha,'+
         'ds_senha_md4, sn_senha_provisoria, sn_bloqueto_empresa, im_pessoa, sn_foto_publica,'+
         'sn_pai, sn_mae, tp_pessoa, ds_cnpj, ds_inscri_estadual, tp_cert, nr_cert_termo,'+
         'ds_cert_folha, ds_cert_livro, DATE_FORMAT(dt_cert, ''%Y-%m-%d %T'') dt_cert,'+
         'ds_cert_uf, ds_cert_orgao, cd_municipio_nasc, nr_praca, cd_estado_nascimento,'+
         'cd_estado, cd_convenio, cd_cert_uf, cd_localidade, cd_localidade_nasc,'+
         'sn_pais_como_resp, sn_obito, sn_requerimentos_email '+
      'FROM '+
         'pessoas '+
      'WHERE '+
      	'cd_pessoa = :cd_pessoa';

   // busca as informações de grupos de usuário vinculados à pessoa
   SQL_GET_GRUPOS =
      'SELECT '+
         'gp.cd_grupo,'+
         'g.ds_nome_grupo '+
      'FROM '+
         'nu_grupos g '+
            'JOIN nu_grupos_pessoas gp USING(cd_grupo) '+
      'WHERE '+
         'gp.cd_pessoa = :cd_pessoa';

   // busca as informações de contatos da pessoa
   SQL_GET_CONTATOS =
      'SELECT '+
         'cp.cd_pessoa,'+
         'ct.ds_contato ds_tipo_contato,'+
         'cp.ds_contato ds_contato_pessoa '+
      'FROM '+
         'contatos_tipos ct '+
            'JOIN contatos_pessoas cp USING(cd_contato) '+
      'WHERE '+
         'cd_pessoa = :cd_pessoa';

   // Chama a função da base de dados que efetua a inserção/alteração de dados
   // de pessoa. Para efetuar inserção, o valor do parâmetro tipo_acao deve
   // ser 0. Para efetuar atualização dos dados de uma pessoa já existente,
   // o valor do parâmetro tipo_acao deve ser 1.
   SQL_INTEGRA_PESSOA =
      'SELECT FMD_PESSOAS( '+
         ':cd_pessoa, :cd_resp_finan, :cd_resp_acad, :cd_mae, :cd_pai, :nm_pessoa,'+
         ':nm_contato, :dt_nascimento, :ds_cidade_nascimento, :cd_municipio, '+
         ':ds_estado_nascimento, :ds_pais_nascimento, :cd_pais, :cd_pais_nascimento,'+
         ':cd_logradouro, :ds_logradouro, :ds_logradouro_nro, :ds_complemento,'+
         ':ds_cep, :ds_bairro, :ds_cidade, :ds_estado, :ds_pais, :ds_sexo,'+
         ':ds_nacionalidade, :ds_identidade, :cd_orgao_emissor, :ds_identidade_orgao_exp,'+
         ':dt_identidade_expedicao, :ds_cpf, :ds_rm_corporacao, :nr_dia_vencimento,'+
         ':sn_nao_bloquear_financeiro, :ds_rm_org_numero, :dt_rm_exp, :ds_rm_doc_numero,'+
         ':ds_rm_orgao, :ds_rm_doc_tipo, :ds_titulo_numero, :ds_titulo_secao, :ds_titulo_zona,'+
         ':dt_titulo_emissao, :nm_pai, :nm_mae, :cd_estado_civil, :ds_estado_civil, :nm_conjuge,'+
         ':cd_usuario, :dt_revisao, :dt_cadastro, :nm_sem_acento, :ds_arquivo_documento,'+
         ':cd_empresa, :ds_cargo, :ds_observacao, :ds_login, :ds_senha, :ds_senha_md4,'+
         ':sn_senha_provisoria, :sn_bloqueto_empresa, :im_pessoa, :sn_foto_publica,'+
         ':sn_pai, :sn_mae, :tp_pessoa, :ds_cnpj, :ds_inscri_estadual, :tp_cert,'+
         ':nr_cert_termo, :ds_cert_folha, :ds_cert_livro, :dt_cert, :ds_cert_uf,'+
         ':ds_cert_orgao, :cd_municipio_nasc, :nr_praca, :cd_estado_nascimento,'+
         ':cd_estado, :cd_convenio, :cd_cert_uf, :cd_localidade, :cd_localidade_nasc,'+
         ':sn_pais_como_resp, :sn_obito, :sn_requerimentos_email, :tipo_acao) AS cd_pessoa';

   // Este comando SQL efetua a chamada da PROCEDURE SPM_ADICIONA_CONTATO_PESSOA,
   // responsável por efetuar a inserção das informações de contatos da pessoa.
   // Esta PROCEDURE recebe três parâmetros: código da pessoa, tipo do contato e
   // o valor do próprio contato.
   // O procedimento verifica se o tipo de contato já está cadastrado na base de
   // dados na tabela contatos_tipos. Se não encontrar o tipo de contato insere
   // como um novo tipo de contato e depois pega o código do tipo de contato.
   // Utiliza o código do tipo de contato para efetuar a inserção na tabela
   // contatos_pessoas.
   SQL_INTEGRA_CONTATO =
      'CALL SPM_ADICIONA_CONTATO_PESSOA(:cd_pessoa, :ds_tipo_contato, :ds_contato)';

   // Este comando SQL efetua a chamada a PROCEDURE SPM_ADICIONA_GRUPO_PESSOA.
   // Esta PROCEDURE efetua a inserção de um vínculo de pessoa com grupo de
   // usuário.
   // O procedimento verifica se o grupo já existe. Se não existir insere.
   // Depois utiliza o código do grupo para efetuar a inserção do vínculo
   // de pessoa com grupo de usuários na tabela nu_grupos_pessoas.
   SQL_INTEGRA_GRUPO =
      'CALL SPM_ADICIONA_GRUPO_PESSOA(:cd_pessoa, :cd_grupo, :nm_grupo_novo)';

   // Exclui todos os vínculos da pessoa com grupos de usuário na base de dados.
   SQL_EXC_GRUPOS =
      'DELETE FROM nu_grupos_pessoas '+
      'WHERE cd_pessoa = :cd_pessoa';

   // Exclui todos os contatos da pessoa na base de dados.
   SQL_EXC_CONTATOS =
      'DELETE FROM contatos_pessoas '+
      'WHERE cd_pessoa = :cd_pessoa';

   LOG_LINHA_NOVA = #13 + #9;

   LOG_ERRO = LOG_LINHA_NOVA + '[ERRO: $erro$]';

   LOG_ERRO_INTEGRA_PESSOA =
      '[Ocorreu um erro ao tentar integrar o cadastro da pessoa]' + LOG_LINHA_NOVA +
      'Pessoa: $cd_pessoa$' + LOG_LINHA_NOVA +
      'Ação: $ds_acao$' + LOG_ERRO;

   LOG_ERRO_INTEGRA_CONTATO =
      '[Ocorreu um erro ao tentar integrar o registro de contato]' + LOG_LINHA_NOVA +
      'Pessoa: $cd_pessoa$' + LOG_LINHA_NOVA +
      'Tipo: $ds_tipo$' + LOG_LINHA_NOVA +
      'Contato: $ds_contato$' + LOG_ERRO;

   LOG_ERRO_INTEGRA_GRUPO =
      '[Ocorreu um erro ao tentar integrar o registro de grupo]' + LOG_LINHA_NOVA +
      'Pessoa: $cd_pessoa$' + LOG_LINHA_NOVA +
      'Grupo: $ds_grupo$' + LOG_ERRO;

   LOG_ERRO_EXC_GRUPOS =
      '[Ocorreu um erro ao tentar excluir os registros de grupos da pessoa]' + LOG_LINHA_NOVA +
      'Pessoa: $cd_pessoa$' + LOG_ERRO;

   LOG_ERRO_EXC_CONTATOS =
      '[Ocorreu um erro ao tentar excluir os registro de contatos da pessoa]' + LOG_LINHA_NOVA +
      'Pessoa: $cd_pessoa$' + LOG_ERRO;

   LOG_ERRO_GET_CONTATOS =
      '[Não foi possível resgatar as informações de contatos da pessoa]' + LOG_LINHA_NOVA +
      'Pessoa: $cd_pessoa$' + LOG_LINHA_NOVA +
      'Origem: $origem$' + LOG_ERRO;

   LOG_ERRO_GET_PESSOA =
      '[Não foi possível resgatar as informações de pessoa]' + LOG_LINHA_NOVA +
      'Pessoa: $cd_pessoa$' + LOG_LINHA_NOVA +
      'Origem: $origem$' + LOG_ERRO;

   LOG_ERRO_GET_GRUPOS =
      '[Não foi possível resgatar as informações de grupos de pessoa]' + LOG_LINHA_NOVA +
      'Pessoa: $cd_pessoa$' + LOG_LINHA_NOVA +
      'Origem: $origem$' + LOG_ERRO;

   LOG_SEM_DADOS_PESSOA =
      '[Não foram encontradas as informações cadastrais da pessoa]' + LOG_LINHA_NOVA +
      'Pessoa: $cd_pessoa$' + LOG_LINHA_NOVA +
      'Origem: $origem$';

{ TUMPessoa }

{ Adiciona um contato ao cadastro da pessoa.
}
procedure TUMPessoa.adicionaContato(const ASTipo, ASContato: string);
begin
   Self.FSlContatos.Values[ASTipo] := ASContato;
end;

{ Adiciona um víncula de pessoa com grupo de usuários ao cadastro da pessoa.
}
procedure TUMPessoa.adicionaGrupo(const ASGrupo, ASCodigo: string);
begin
   Self.FSlGrupos.Values[ASCodigo] := ASGrupo;
end;

{ Este procedimento recebe uma Query que deverá conter todos os dados cadastrais
  da pessoa. A Query será consultadas para definir os valores dos atributos do
  objeto.
}
procedure TUMPessoa.carregaDadosFromQuery(AQyPessoa: TUMZReadOnlyQuery);
var
   i: integer;
begin
   for i := 0 to AQyPessoa.FieldCount - 1 do
      Self.FSlDados.Values[AQyPessoa.Fields[i].FieldName] := AQyPessoa.Fields[i].AsString;
end;

{ Contrutor.
}
constructor TUMPessoa.Create(const ASCodPessoa: string);
begin
   Self.FSlDados := TStringList.Create;
   Self.FSlGrupos := TStringList.Create;
   Self.FSlContatos := TStringList.Create;
   Self.FSlDados.Values['cd_pessoa'] := ASCodPessoa;
end;

{ Destrutor.
}
destructor TUMPessoa.Destroy;
begin
   Self.FSlContatos.Clear;
   Self.FSlGrupos.Clear;
   Self.FSlDados.Clear;
end;

{ Retorna o tipo de contato na posíção apontada pelo parâmetro i na lista de
  contatos da pessoa.
}
function TUMPessoa.getTipoContato(const i: integer): string;
begin
   Result := Self.FSlContatos.Names[i];
end;

{ Retorna o código do grupo ao qual a pessoa está vinculada na posição apontada
  pelo parêmtro i na lista de grupos da pessoa.
}
function TUMPessoa.getCodGrupo(const i: integer): string;
begin
   Result := Self.FSlGrupos.Names[i];
end;

function TUMPessoa.getCodigo: string;
begin
   Result := Self.FSlDados.Values['cd_pessoa'];
end;

{ Retorna um contato da pessoa na posição i da lista de contatos. 
}
function TUMPessoa.getContato(const i: integer): string;
begin
   Result := Self.FSlContatos.ValueFromIndex[i];
end;

{ Retorna a quantidade total de contatos cadastrados para a pessoa.
}
function TUMPessoa.getContatosCount: integer;
begin
   Result := Self.FSlContatos.Count;
end;

function TUMPessoa.getDado(const ASChave: string): string;
begin
   Result := Self.FSlDados.Values[ASChave];
end;

{ Retorna o nome do grupo de usuários vinculado à pessoa na posição apontada pelo
  parâmetro i na lista de grupos.
}
function TUMPessoa.getGrupo(const i: integer): string;
begin
   Result := Self.FSlGrupos.ValueFromIndex[i];
end;

{ Retorna total de grupo de usuários vinculados à pessoa.
}
function TUMPessoa.getGruposCount: integer;
begin
   Result := Self.FSlGrupos.Count;
end;

{ TUMSvcIntegraBorgesMendoncaPessoa }

{ Adiciona todos os contatos da pessoa na base de dados do Borges de Mendonça.
}
procedure TUMSvcIntegraBorgesMendoncaPessoa.adicionaContatosPessoaBorges(
  AUMPessoa: TUMPessoa);
var
   i: integer;
   sLog: string;
begin
   Self.FQyContatosBorges.SQL.Text := SQL_INTEGRA_CONTATO;
   // percorre a lista de contatos da pessoa
   for i := 0 to AUMPessoa.ContatosCount - 1 do
   begin
      Self.FQyContatosBorges.ParamByName('cd_pessoa').AsString := AUMPessoa.Codigo;
      Self.FQyContatosBorges.ParamByName('ds_contato').AsString := AUMPessoa.Contatos[i];
      Self.FQyContatosBorges.ParamByName('ds_tipo_contato').AsString := AUMPessoa.TiposContatos[i];
      try
         // tenta efetuar a inserção
         Self.FQyContatosBorges.ExecSQL;
      except
         on E: Exception do
         begin
            sLog := StringReplace(LOG_ERRO_INTEGRA_CONTATO, '$cd_pessoa$', AUMPessoa.Codigo, []);
            sLog := StringReplace(sLog, '$ds_tipo$', AUMPessoa.TiposContatos[i], []);
            sLog := StringReplace(sLog, '$ds_contato$', AUMPessoa.Contatos[i], []);
            sLog := StringReplace(sLog, '$erro$', E.Message, []);
            Self.FUMIntegraBorges.Log.log(sLog);
         end;
      end;
   end;
end;

{ Adiciona todos os vínculos de grupos de usuário da pessoa na base de dados do
  Borges de Mendonça.
}
procedure TUMSvcIntegraBorgesMendoncaPessoa.adicionaGruposPessoaBorges(
  AUMPessoa: TUMPessoa; const AUMBaseOrigem: TUMBaseOrigem);
var
   i: integer;
   sSufixoGrp, sLog: string;
begin
   Self.FQyGruposBorges.SQL.Text := SQL_INTEGRA_GRUPO;
   // Verifica a origem dos dados para definir o sufixo do nome do grupo.
   // O nome do grupo será usado para fazer distinção entre as pessoas que foram
   // importadas da base de dados do Decisão das pessoas que foram importadas da
   // base de dados do COC.
   case AUMBaseOrigem of
      boCOC: sSufixoGrp := ' COC';
      boDecisao: sSufixoGrp := ' Decisao';
   end;
   // percorre a lista de grupos vinculados à pessoa
   for i := 0 to AUMPessoa.GruposCount - 1 do
   begin
      Self.FQyGruposBorges.ParamByName('cd_pessoa').AsString := AUMPessoa.Codigo;
     Self.FQyGruposBorges.ParamByName('cd_grupo').AsString := AUMPessoa.CodigosGrupos[i];
      Self.FQyGruposBorges.ParamByName('nm_grupo_novo').AsString := AUMPessoa.Grupos[i] + sSufixoGrp;
      try
         Self.FQyGruposBorges.ExecSQL;
      except
         on E: Exception do
         begin
            sLog := StringReplace(LOG_ERRO_INTEGRA_GRUPO, '$cd_pessoa$', AUMPessoa.Codigo, []);
            sLog := StringReplace(sLog, '$ds_grupo$', AUMPessoa.CodigosGrupos[i] + sSufixoGrp, []);
            sLog := StringReplace(sLog, '$erro$', E.Message, []);
            Self.FUMIntegraBorges.Log.log(sLog);
         end;
      end;
   end;
end;

{ Efetua a inserção dos dados cadastrais da pessoa na base de dados do Borges.
}
procedure TUMSvcIntegraBorgesMendoncaPessoa.adicionaPessoaBorges(
  AUMPessoa: TUMPessoa);
begin
   Self.integraPessoaBorges(AUMPessoa, apInserir);
end;

{ Efetua a atualização dos dados de contatos da pessoa na base de dados do Borges.
}
procedure TUMSvcIntegraBorgesMendoncaPessoa.alteraContatosPessoaBorges(
  AUMPessoa: TUMPessoa);
var
   bErro: boolean;
   sLog: string;
begin
   bErro := False;
   // primeiro efetua a exclusão dos atuais dados de contatos da pessoa na base
   // de dados do Borges de Mendonça...
   Self.FQyContatosBorges.SQL.Text := SQL_EXC_CONTATOS;
   Self.FQyContatosBorges.ParamByName('cd_pessoa').AsString := AUMPessoa.Codigo;
   try
      Self.FQyContatosBorges.ExecSQL;
   except
      on E: Exception do
      begin
         sLog := StringReplace(LOG_ERRO_EXC_CONTATOS, '$cd_pessoa$', AUMPessoa.Codigo, []);
         sLog := StringReplace(sLog, '$erro$', E.Message, []);
         bErro := True;
         Self.FUMIntegraBorges.Log.log(sLog);
      end;
   end;
   // se conseguiu efetuar a exclusão dos dados de contatos,
   // então efetua a integração dos novos dados.
   if not bErro then
   begin
      Self.adicionaContatosPessoaBorges(AUMPessoa);
   end;
end;

{ Efetua a atualização dos dados de vínculo de grupos de usuários com pessoas.
}
procedure TUMSvcIntegraBorgesMendoncaPessoa.alteraGruposPessoaBorges(
  AUMPessoa: TUMPessoa; const AUMBaseOrigem: TUMBaseOrigem);
var
   bErro: boolean;
   sLog: string;
begin
   bErro := False;
   // primeiro efetua a exclusão de todas as informações de grupos de usuários
   // vinculados à pessoa na base de dados do Borges de Mendonça ...
   Self.FQyContatosBorges.SQL.Text := SQL_EXC_CONTATOS;
   Self.FQyContatosBorges.ParamByName('cd_pessoa').AsString := AUMPessoa.Codigo;
   try
      Self.FQyContatosBorges.ExecSQL;
   except
      on E: Exception do
      begin
         sLog := StringReplace(LOG_ERRO_EXC_GRUPOS, '$cd_pessoa$', AUMPessoa.Codigo, []);
         sLog := StringReplace(sLog, '$erro$', E.Message, []);
         bErro := True;
         Self.FUMIntegraBorges.Log.log(sLog);
      end;
   end;
   // se não ocorreu erro na exclusão dos dados de grupos/pessoa,
   // então efetua atualização dos dados... 
   if not bErro then
   begin
      Self.adicionaGruposPessoaBorges(AUMPessoa, AUMBaseOrigem);
   end;
end;

{ Efetua a atualização do cadastro de pessoa na base de dados do Borges de
  Mendonça.
}
procedure TUMSvcIntegraBorgesMendoncaPessoa.alteraPessoaBorges(
  AUMPessoa: TUMPessoa);
begin
   Self.integraPessoaBorges(AUMPessoa, apAlterar);
end;

{ Construtor. Inicializa todas as querys.
}
constructor TUMSvcIntegraBorgesMendoncaPessoa.Create(
  AUMIntegraBorges: TUMSvcIntegraBorgesMendonca);
begin
   Self.FUMIntegraBorges := AUMIntegraBorges;

   Self.FQyPessoasCOC := Self.FUMIntegraBorges.ConnCOC.newROQuery;
   Self.FQyContatosCOC := Self.FUMIntegraBorges.ConnCOC.newROQuery;
   Self.FQyGruposCOC := Self.FUMIntegraBorges.ConnCOC.newROQuery;

   Self.FQyPessoasDecisao := Self.FUMIntegraBorges.ConnDecisao.newROQuery;
   Self.FQyContatosDecisao := Self.FUMIntegraBorges.ConnDecisao.newROQuery;
   Self.FQyGruposDecisao := Self.FUMIntegraBorges.ConnDecisao.newROQuery;

   Self.FQyPessoasBorges := Self.FUMIntegraBorges.ConnBM.newQuery;
   Self.FQyContatosBorges := Self.FUMIntegraBorges.ConnBM.newQuery;
   Self.FQyGruposBorges := Self.FUMIntegraBorges.ConnBM.newQuery;

   Self.FQyPessoasCOC.ParamCheck := True;
   Self.FQyPessoasDecisao.ParamCheck := True;
   Self.FQyPessoasBorges.ParamCheck := True;
   Self.FQyContatosCOC.ParamCheck := True;
   Self.FQyContatosDecisao.ParamCheck := True;
   Self.FQyContatosBorges.ParamCheck := True;
   Self.FQyGruposCOC.ParamCheck := True;
   Self.FQyGruposDecisao.ParamCheck := True;
   Self.FQyGruposBorges.ParamCheck := True;

   Self.FQyPessoasBorges.SQL.Text := SQL_INTEGRA_PESSOA;
   Self.FQyContatosCOC.SQL.Text := SQL_GET_CONTATOS;
   Self.FQyContatosDecisao.SQL.Text := SQL_GET_CONTATOS;
   Self.FQyPessoasCOC.SQL.Text := SQL_GET_PESSOA;
   Self.FQyPessoasDecisao.SQL.Text := SQL_GET_PESSOA;
   Self.FQyGruposCOC.SQL.Text := SQL_GET_GRUPOS;
   Self.FQyGruposDecisao.SQL.Text := SQL_GET_GRUPOS;
end;

{ Destrutor. Destroi todas as querys.
}
destructor TUMSvcIntegraBorgesMendoncaPessoa.Destroy;
begin
   Self.FQyPessoasCOC.Free;
   Self.FQyPessoasDecisao.Free;
   Self.FQyPessoasBorges.Free;
   Self.FQyContatosCOC.Free;
   Self.FQyContatosDecisao.Free;
   Self.FQyContatosBorges.Free;
   Self.FQyGruposCOC.Free;
   Self.FQyGruposDecisao.Free;
   Self.FQyGruposBorges.Free;
   inherited;
end;

{ Efetua a busca dos dados de contatos da pessoa na base de dados do COC e
  armazena no objeto de pessoa.
}
function TUMSvcIntegraBorgesMendoncaPessoa.getContatosPessoaCOC(
  AUMPessoa: TUMPessoa): boolean;
var
   sLog: string;
begin
   Result := True;
   Self.FQyContatosCOC.ParamByName('cd_pessoa').AsString := AUMPessoa.Codigo;
   try
      Self.FQyContatosCOC.Open;
      try
         // verifica se há informações ...
         if not Self.FQyContatosCOC.IsEmpty then
         begin
            while not Self.FQyContatosCOC.Eof do
            begin
               AUMPessoa.adicionaContato(
                  Self.FQyContatosCOC.FieldByName('ds_tipo_contato').AsString,
                  Self.FQyContatosCOC.FieldByName('ds_contato_pessoa').AsString);
               Self.FQyContatosCOC.Next;
            end;
         end;
      finally
         Self.FQyContatosCOC.Close;
      end;
   except
      on E: Exception do
      begin
         sLog := StringReplace(LOG_ERRO_GET_CONTATOS, '$cd_pessoa$', AUMPessoa.Codigo, []);
         sLog := StringReplace(sLog, '$origem$', 'COC', []);
         sLog := StringReplace(sLog, '$erro$', E.Message, []);
         Self.FUMIntegraBorges.Log.log(sLog);
         Result := False;
      end;
   end;
end;

{ Efetua a busca dos dados de contatos da pessoa na base de dados do Decisão e
  guarda no objeto de pessoa.
}
function TUMSvcIntegraBorgesMendoncaPessoa.getContatosPessoaDecisao(
  AUMPessoa: TUMPessoa): boolean;
var
   sLog: string;
begin
   Result := True;
   Self.FQyContatosDecisao.ParamByName('cd_pessoa').AsString := AUMPessoa.Codigo;
   try
      Self.FQyContatosDecisao.Open;
      try
         // há registros ?
         if not Self.FQyContatosDecisao.IsEmpty then
         begin
            while not Self.FQyContatosDecisao.Eof do
            begin
               AUMPessoa.adicionaContato(
                  Self.FQyContatosDecisao.FieldByName('ds_tipo_contato').AsString,
                  Self.FQyContatosDecisao.FieldByName('ds_contato_pessoa').AsString);
               Self.FQyContatosDecisao.Next;
            end;
         end;
      finally
         Self.FQyContatosDecisao.Close;
      end;
   except
      on E: Exception do
      begin
         Result := False;
         sLog := StringReplace(LOG_ERRO_GET_CONTATOS, '$cd_pessoa$', AUMPessoa.Codigo, []);
         sLog := StringReplace(sLog, '$origem$', 'Decisão', []);
         Self.FUMIntegraBorges.Log.log(sLog);
      end;
   end;
end;

{ Busca todos os dados cadastrais da pessoa na base de dados do COC e armazena
  no objeto do tipo TUMPessoa recebido como parâmetro.
}
function TUMSvcIntegraBorgesMendoncaPessoa.getDadosPessoaCOC(
  AUMPessoa: TUMPessoa): boolean;
var
   sLog: string;
begin
   Result := True;
   Self.FQyPessoasCOC.ParamByName('cd_pessoa').AsString := AUMPessoa.Codigo;
   try
      Self.FQyPessoasCOC.Open;
      try
         // encontrou a pessoa ??
         if Self.FQyPessoasCOC.IsEmpty then
         begin
            // se não há pessoa cadastrada, então grava log de erro
            Result := False;
            sLog := StringReplace(LOG_ERRO_GET_PESSOA, '$cd_pessoa$', AUMPessoa.Codigo, []);
            sLog := StringReplace(sLog, '$origem$', 'COC', []);
            Self.FUMIntegraBorges.Log.log(sLog);
         end
         else // carrega os dados da pessoa no objeto
            AUMPessoa.carregaDadosFromQuery(Self.FQyPessoasCOC);
      finally
         Self.FQyPessoasCOC.Close;
      end;
   except
      on E: Exception do
      begin
         Result := False;
         sLog := StringReplace(LOG_ERRO_GET_PESSOA, '$cd_pessoa$', AUMPessoa.Codigo, []);
         sLog := StringReplace(sLog, '$origem$', 'COC', []);
         sLog := StringReplace(sLog, '$erro$', E.Message, []);
         Self.FUMIntegraBorges.Log.log(sLog);
      end;
   end;
end;

{ Pega os dados cadastrais da pessoa na base de dados do decisão e armazena no
  objeto de pessoa.
}
function TUMSvcIntegraBorgesMendoncaPessoa.getDadosPessoaDecisao(
  AUMPessoa: TUMPessoa): boolean;
var
   sLog: string;
begin
   Result := True;
   Self.FQyPessoasDecisao.ParamByName('cd_pessoa').AsString := AUMPessoa.Codigo;
   try
      Self.FQyPessoasDecisao.Open;
      try
         // foi encontrada a pessoa ?
         if Self.FQyPessoasDecisao.IsEmpty then
         begin
            // pessoa não encontrada, grava log de erro
            Result := False;
            sLog := StringReplace(LOG_ERRO_GET_PESSOA, '$cd_pessoa$', AUMPessoa.Codigo, []);
            sLog := StringReplace(sLog, '$origem$', 'COC', []);
            Self.FUMIntegraBorges.Log.log(sLog);
         end
         else // carrega os dados no objeto
            AUMPessoa.carregaDadosFromQuery(Self.FQyPessoasDecisao);
      finally
         Self.FQyPessoasDecisao.Close;
      end;
   except
      on E: Exception do
      begin
         Result := False;
         sLog := StringReplace(LOG_ERRO_GET_PESSOA, '$cd_pessoa$', AUMPessoa.Codigo, []);
         sLog := StringReplace(sLog, '$origem$', 'COC', []);
         sLog := StringReplace(sLog, '$erro$', E.Message, []);
         Self.FUMIntegraBorges.Log.log(sLog);
      end;
   end;
end;

{ Pega as informações de vínculos da pessoa com grupos de usuário na base de
  dados do COC.
}
function TUMSvcIntegraBorgesMendoncaPessoa.getGruposPessoaCOC(
  AUMPessoa: TUMPessoa): boolean;
var
   sLog: string;
begin
   Result := True;
   Self.FQyGruposCOC.ParamByName('cd_pessoa').AsString := AUMPessoa.Codigo;
   try
      Self.FQyGruposCOC.Open;
      try
         // há registros ?
         if not Self.FQyGruposCOC.IsEmpty then
         begin
            while not Self.FQyGruposCOC.Eof do
            begin
               AUMPessoa.adicionaGrupo(
                  Self.FQyGruposCOC.FieldByName('ds_nome_grupo').AsString,
                  Self.FQyGruposCOC.FieldByName('cd_grupo').AsString);
               Self.FQyGruposCOC.Next;
            end;
         end;
      finally
         Self.FQyGruposCOC.Close;
      end;
   except
      on E: Exception do
      begin
         Result := False;
         sLog := StringReplace(LOG_ERRO_GET_GRUPOS, '$cd_pessoa$', AUMPessoa.Codigo, []);
         sLog := StringReplace(sLog, '$origem$', 'COC', []);
         sLog := StringReplace(sLog, '$erro$', E.Message, []);
         Self.FUMIntegraBorges.Log.log(sLog);
      end;
   end;
end;

{ Pega as informações de vínculos da pessoa com grupos de usuário na base de
  dados do Decisão.
}
function TUMSvcIntegraBorgesMendoncaPessoa.getGruposPessoaDecisao(
  AUMPessoa: TUMPessoa): boolean;
var
   sLog: string;
begin
   Result := True;
   Self.FQyGruposDecisao.ParamByName('cd_pessoa').AsString := AUMPessoa.Codigo;
   try
      Self.FQyGruposDecisao.Open;
      try
         // há registros ??
         if not Self.FQyGruposDecisao.IsEmpty then
         begin
            while not Self.FQyGruposDecisao.Eof do
            begin
               AUMPessoa.adicionaGrupo(
                  Self.FQyGruposDecisao.FieldByName('ds_nome_grupo').AsString,
                  Self.FQyGruposDecisao.FieldByName('cd_grupo').AsString);
               Self.FQyGruposDecisao.Next;
            end;
         end;
      finally
         Self.FQyGruposDecisao.Close;
      end;
   except
      on E: Exception do
      begin
         Result := False;
         sLog := StringReplace(LOG_ERRO_GET_GRUPOS, '$cd_pessoa$', AUMPessoa.Codigo, []);
         sLog := StringReplace(sLog, '$origem$', 'COC', []);
         sLog := StringReplace(sLog, '$erro$', E.Message, []);
         Self.FUMIntegraBorges.Log.log(sLog);
      end;
   end;
end;

{ Efetua a integração dos dados cadastrais da pessoa na base de dados do Borges.
}
procedure TUMSvcIntegraBorgesMendoncaPessoa.integraPessoaBorges(
  AUMPessoa: TUMPessoa; const AUMAcaoPessoa: TUMAcaoPessoa);
var
   i: integer;
   sLog, sAcao: string;
begin
   // substituí os parâmetros da Query pelos valores
   for i := 0 to Self.FQyPessoasBorges.Params.Count - 1 do
      Self.FQyPessoasBorges.Params[i].AsString := AUMPessoa.Dados[Self.FQyPessoasBorges.Params[i].Name];
   // verifica o tipo de ação a efetuar
   case AUMAcaoPessoa of
      // inserção
      apInserir:
      begin
         sAcao := 'Inserir';
         Self.FQyPessoasBorges.ParamByName('tipo_acao').AsInteger := 0;
      end;
      // alteração
      apAlterar:
      begin
         sAcao := 'Alterar';
         Self.FQyPessoasBorges.ParamByName('tipo_acao').AsInteger := 1;
      end;
   end;
   // tenta efetuar a integração
   try
      Self.FQyPessoasBorges.ExecSQL;
   except
      on E: Exception do
      begin
         sLog := StringReplace(LOG_ERRO_INTEGRA_PESSOA, '$cd_pessoa$', AUMPessoa.Codigo, []);
         sLog := StringReplace(sLog, '$ds_acao$', sAcao, []);
         Self.FUMIntegraBorges.Log.log(sLog);
      end;
   end;
end;

{ Efetua a integração de um registro.
}
function TUMSvcIntegraBorgesMendoncaPessoa.IntegraRegistro(
   var AUMIntegraBase: TUMIntegraBase; const AICodIntegracao,
   AICodParceiro: integer; ACAcao: Char; const ASChave, ASExtra: string;
   var ASErro: string; const ADtRegistro: TDateTime): TIntegraRegistroRet;
var
   BaseOrigem: TUMBaseOrigem;
   oPessoa: TUMPessoa;
begin
   Result := irrSuccess;
   // verifica qual a origem do registro
   case AICodParceiro of
      INTEGRA_BM_PESSOAS_COC: BaseOrigem := boCOC;
      INTEGRA_BM_PESSOAS_DECISAO: BaseOrigem := boDecisao;
   end;
   // cria o objeto de pessoa para efetuar a busca dos dados e integração
   oPessoa := TUMPessoa.Create(ASChave);
   try
      // verifica a ação a ser executada ...
      // I: inserção dos dados cadastrais da pessoa
      if ACAcao = 'I' then
      begin
         case BaseOrigem of
            boCOC:
            begin
               if Self.getDadosPessoaCOC(oPessoa) then // dados
               begin
                  Self.adicionaPessoaBorges(oPessoa);
                  if Self.getContatosPessoaCOC(oPessoa) then   // contatos
                  begin
                     Self.adicionaContatosPessoaBorges(oPessoa);
                     if Self.getGruposPessoaCOC(oPessoa) then // grupos
                        Self.adicionaGruposPessoaBorges(oPessoa, BaseOrigem)
                     else
                        Result := irrFailed;
                  end
                  else
                     Result := irrFailed;
               end
               else
                  Result := irrFailed;
            end;
            boDecisao:
            begin
               if Self.getDadosPessoaDecisao(oPessoa) then
               begin
                  Self.adicionaPessoaBorges(oPessoa);
                  if Self.getContatosPessoaDecisao(oPessoa) then
                  begin
                     Self.adicionaContatosPessoaBorges(oPessoa);
                     if Self.getGruposPessoaDecisao(oPessoa) then
                        Self.adicionaGruposPessoaBorges(oPessoa, BaseOrigem)
                     else
                        Result := irrFailed;
                  end
                  else
                     Result := irrFailed;
               end
               else
                  Result := irrFailed;
            end;
         end;
      end
      // A: alteração dos dados cadastrais
      else if ACAcao = 'A' then
      begin
         case BaseOrigem of
            boCOC:
            begin
               if Self.getDadosPessoaCOC(oPessoa) then
                  Self.alteraPessoaBorges(oPessoa)
               else
                  Result := irrFailed;
            end;
            boDecisao:
            begin
               if Self.getDadosPessoaDecisao(oPessoa) then
                  Self.alteraPessoaBorges(oPessoa)
               else
                  Result := irrFailed;
            end;
         end;
      end
      // C: alteração/inserção/exclusão dos dados de contatos
      else if ACAcao = 'C' then
      begin
         case BaseOrigem of
            boCOC:
            begin
               if Self.getContatosPessoaCOC(oPessoa) then
                  Self.alteraContatosPessoaBorges(oPessoa)
               else
                  Result := irrFailed;
            end;
            boDecisao:
            begin
               if Self.getContatosPessoaDecisao(oPessoa) then
                  Self.alteraContatosPessoaBorges(oPessoa)
               else
                  Result := irrFailed;
            end;
         end;
      end
      // G: alteração/inserção/exclusão dos dados de grupos de usuário
      else if ACAcao = 'G' then
      begin
         case BaseOrigem of
            boCOC:
            begin
               if Self.getGruposPessoaCOC(oPessoa) then
                  Self.alteraGruposPessoaBorges(oPessoa, BaseOrigem)
               else
                  Result := irrFailed;
            end;
            boDecisao:
            begin
               if Self.getGruposPessoaDecisao(oPessoa) then
                  Self.alteraGruposPessoaBorges(oPessoa, BaseOrigem)
               else
                  Result := irrFailed;
            end;
         end;
      end;
   finally
      oPessoa.Free;
   end;
end;

end.
