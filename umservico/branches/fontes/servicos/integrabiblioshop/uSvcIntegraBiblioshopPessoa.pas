unit uSvcIntegraBiblioshopPessoa;

interface

uses
   SysUtils, Variants, Classes, uSvcClasses, uDMConexao, uIntegraBase, uSvcIntegraBiblioshop,
   ZAbstractRODataset, UZDataSet;

const
   //mensagem de erro
   MSG_ERRO_SELECT_PESSOA = 'Não foi possível resgatar informações para o usuário :cd_pessoa';
   MSG_ERRO_PESSOA_INVALIDA = 'O usuário :cd_pessoa não possui tipo válido para cadastro no BiblioShop';
   //tipos de pessoa do Biblioshop
   TIPO_USUARIO_PROFESSOR = '04';
   TIPO_USUARIO_FACULDADE = '02';
   TIPO_USUARIO_COLEGIO   = '01';
   TIPO_USUARIO_FUNCIONARIO = '03';

{**
 * Classe TUMSvcIntegraBiblioshopPessoa
 * Implementa a interface IUMIntegraRegistros
 *
 * Responsável por efetuar a comunicação com a base de dados Firebird e a
 * integração UNIMESTRE x BIBLIOSHOP.
 * Busca as informações relevantes na base de dados do UNIMESTRE (MySQL),
 * e efetua a chamada a PROCEDURE do BIBLIOSHOP (Firebird), enviando como
 * parâmetro as informações solicitadas. 
 *}
type
   TUMSvcIntegraBiblioshopPessoa = class(TInterfacedObject, IUMIntegraRegistros)
   private
      //SQL Query para resgatar informações de pessoa no Unimestre
      FSQueryPessoasUM: string;
      //SQL Query para executar a procedure no Biblioshop para inclusão ou alteração de pessoa
      FSProcBiblioPessoasIA: string;
      //SQL Query para executar a procedure no Biblioshop para exclusão de pessoa
      FSProcBiblioPessoasE: string;
      //Componente para execução da Query ASQueryPessoasUM
      FQyPessoasUM: TUMZReadOnlyQuery;
      //Componente para execução das Querys ASProcBiblioPessoasIA e ASProcBiblioPessoasE
      FQyPessoasBiblio: TUMZQuery;
      //Guarda o SQL para firebird que faz o cast de Strnig para Data
      FSSQLDataFirebird: string;

      FBiblioShop: TUMSvcIntegraBiblioshop;
   public
      //construtor
      constructor Create(AIntegraBiblioshop: TUMSvcIntegraBiblioshop);
      //Integração dos registros
      function IntegraRegistro(var AUMIntegraBase: TUMIntegraBase;
         const AICodIntegracao, AICodParceiro: integer; ACAcao: Char;
         const ASChave, ASExtra: string; var ASErro: string;
         const ADtRegistro: TDateTime): TIntegraRegistroRet;
   end;

implementation

uses DB;

{**
 * Faz a inicialização dos atributos da classe.
 *}
constructor TUMSvcIntegraBiblioshopPessoa.Create(AIntegraBiblioshop: TUMSvcIntegraBiblioshop);
begin
   FBiblioShop := AIntegraBiblioshop;

   FQyPessoasUM := AIntegraBiblioshop.ConnUnimestre.newROQuery;
   FQyPessoasBiblio := AIntegraBiblioshop.ConnBiblioshop.newQuery;
   FSSQLDataFirebird := '(Select Cast('':dt_nascimento'' as Date) From rdb$database)';
   FSProcBiblioPessoasE := 'EXECUTE PROCEDURE BS_ATUALIZA_SITUACAO_USUARIO(:cd_pessoa,"I")';
   FSProcBiblioPessoasIA :=
   'EXECUTE PROCEDURE BS_INSERE_ATUALIZA_USUARIO('+
   ''':cd_pessoa'', '':nm_pessoa'', '':cd_tipo'', '':ds_identidade'', '':ds_cpf'','+
   ':dt_nascimento,'+
   ''':ds_logradouro'', '':ds_bairro'', '':ds_cidade'', '':ds_estado'','+
   ''':ds_cep'', '':ds_fone_residencial'', '':ds_endereco_com'', '':ds_bairro_com'','+
   ''':ds_cidade_com'', '':ds_estado_com'', '':ds_cep_com'', '':ds_fone_comercial'','+
   ''':ds_fone_celular'', '':ds_email'', '':curso'', '':turma'', '':nm_responsavel'','''','+
   ''':ds_nacionalidade'', '':ds_parentesco_resp'')';
   FSQueryPessoasUM :=
   'SELECT '+
   'MAX(m.anosemestre) anosemestre,'+
   'p1.cd_pessoa,'+
   'SUBSTRING(p1.nm_pessoa,1,50) nm_pessoa,'+
   'CASE WHEN r.sn_professor = "S" THEN "S" ELSE "N" END AS sn_professor,'+
   'CASE WHEN r.sn_funcionario = "S" THEN "S" ELSE "N" END AS sn_funcionario,'+
   'CASE WHEN c.grau = 3 THEN "S" ELSE "N" END AS sn_aluno_graduacao,'+
   'CASE WHEN c.grau = 2 THEN "S" ELSE "N" END AS sn_aluno_colegio,'+
   'SUBSTRING(p1.ds_identidade,1,14) ds_identidade,'+
   'CASE WHEN p1.ds_cpf = "00000000000" THEN NULL ELSE p1.ds_cpf END AS ds_cpf,'+
   'DATE_FORMAT(p1.dt_nascimento, "%m/%d/%Y") dt_nascimento,'+
   'p1.ds_logradouro,'+
   'p1.ds_logradouro_nro,'+
   'p1.ds_complemento,'+
   'SUBSTRING(p1.ds_bairro,1,22) ds_bairro,'+
   'SUBSTRING(IF(ISNULL(p1.ds_cidade), mu.ds_municipio, p1.ds_cidade),1,22) ds_cidade,'+
   'p1.ds_estado,'+
   'p1.ds_cep,'+
   'SUBSTRING(t1.ds_contato,1,30) ds_fone_residencial,'+
   'SUBSTRING(e.ds_endereco,1,43) ds_endereco_com,'+
   'SUBSTRING(e.ds_complemento,1,43) ds_complemento_com,'+
   'SUBSTRING(e.ds_bairro,1,22) ds_bairro_com,'+
   'SUBSTRING(e.ds_cidade,1,22) ds_cidade_com,'+
   'e.ds_estado ds_estado_com,'+
   'e.ds_cep ds_cep_com,'+
   'SUBSTRING( CASE WHEN t2.ds_contato IS NULL THEN e.ds_telefone1 ELSE t2.ds_contato END,1,15) ds_fone_comercial,'+
   'SUBSTRING(t3.ds_contato,1,15) ds_fone_celular,'+
   'SUBSTRING(t4.ds_contato,1,50) ds_email,'+
   'm.curso,'+
   'm.turma,'+
   'p1.ds_nacionalidade,'+
   'IF(p1.cd_mae <> 0 AND p1.cd_mae = p1.cd_resp_finan AND NOT ISNULL(p1.cd_mae), "MÃE",(IF(p1.cd_pai <> 0 AND p1.cd_pai = p1.cd_resp_finan AND NOT ISNULL(p1.cd_pai),"PAI",""))) ds_parentesco_resp_acad,'+
   'IF(p1.cd_mae <> 0 AND p1.cd_mae = p1.cd_resp_finan AND NOT ISNULL(p1.cd_mae), "MÃE",(IF(p1.cd_pai <> 0 AND p1.cd_pai = p1.cd_resp_finan AND NOT ISNULL(p1.cd_pai),"PAI",""))) ds_parentesco_resp_finan,'+
   'SUBSTRING(p2.nm_pessoa,1,50) nm_reponsavel_acad,'+
   'SUBSTRING(p3.nm_pessoa,1,50) nm_reponsavel_finan '+
   'FROM '+
   'pessoas p1 '+
   'LEFT JOIN pessoas p2 ON(p1.cd_resp_acad = p2.cd_pessoa) '+
   'LEFT JOIN pessoas p3 ON(p1.cd_resp_finan = p3.cd_pessoa) '+
   'LEFT JOIN professores r ON(r.cd_pessoa = p1.cd_pessoa) '+
   'LEFT JOIN matriculas m ON(m.codigoaluno = p1.cd_pessoa) '+
   'LEFT JOIN cursos c ON(c.codigo = m.curso AND c.anosemestre = m.anosemestre) '+
   'LEFT JOIN municipios mu ON(mu.cd_municipio = p1.cd_municipio) '+
   'LEFT JOIN contatos_pessoas t1 ON(t1.cd_pessoa = p1.cd_pessoa AND t1.cd_contato = 1) '+
   'LEFT JOIN contatos_pessoas t2 ON(t2.cd_pessoa = p1.cd_pessoa AND t2.cd_contato = 2) '+
   'LEFT JOIN contatos_pessoas t3 ON(t3.cd_pessoa = p1.cd_pessoa AND t3.cd_contato = 3) '+
   'LEFT JOIN contatos_pessoas t4 ON(t4.cd_pessoa = p1.cd_pessoa AND t4.cd_contato = 4) '+
   'LEFT JOIN empresas e ON(e.cd_empresa = p1.cd_empresa) '+
   'WHERE '+
   'p1.cd_pessoa = :iCodPessoa '+
   'GROUP BY p1.cd_pessoa';
end;

{**
 * Efetua a integração UNIMESTRE x BIBLIOSHOP
 *
 * @param   IntegraBase    Referência para o objeto TUMIntegraBase
 * @param   iCodIntegracao Identificador único da tabela nu_integracao
 * @param   iCodParceiro   Código do parceiro na integração
 * @param   sAcao          Ação a ser executada como o registro
 * @param   sChave         Chave única de identificação de registro no UNIMESTRE
 * @param   dRegistro      Data de inserção do registro na tabela nu_integracao
 * @param   sExtra         Mensagem extra da tabela nu_integracao
 * @param   sErro          Erro na integração
 * @return  TIntegraRegistroRet
 *}
function TUMSvcIntegraBiblioshopPessoa.IntegraRegistro(
   var AUMIntegraBase: TUMIntegraBase; const AICodIntegracao,
   AICodParceiro: integer; ACAcao: Char; const ASChave, ASExtra: string;
   var ASErro: string; const ADtRegistro: TDateTime): TIntegraRegistroRet;
var
   i: integer;
   sNomeCampo, sTipoUsuario, sParentescoResp, sNomeResponsavel, sEnderecoCom, sEnderecoRes: string;
begin
   //inicialização das variáveis
   sNomeCampo := '';
   sTipoUsuario := '';
   sEnderecoCom := '';
   sEnderecoRes := '';
   sParentescoResp := '';
   sNomeResponsavel := '';
   FQyPessoasUM.Close;
   FQyPessoasBiblio.Close;
   FQyPessoasUM.SQL.Text := FSQueryPessoasUM;
   //é uma operação de exclusão de usuário
   if ACAcao = 'R' then begin
      FQyPessoasBiblio.SQL.Text := FSProcBiblioPessoasE;
      FQyPessoasBiblio.SQL.Text := StringReplace(  FQyPessoasBiblio.SQL.Text,
                                                   ':cd_pessoa', ASChave, [rfReplaceAll,rfIgnoreCase]);
      try
         FQyPessoasBiblio.ExecSQL;
      except on E: Exception do begin
            FBiblioShop.Log.log('Erro: SQL(Firebird): '+FQyPessoasBiblio.SQL.Text+' -- Mensagem: '+E.Message, true);
            Result := irrError;
            Exit;
         end;
      end;
      Result := irrSuccess;
      Exit;
   end;
   //NÃO é uma operação de EXCLUSÃO, é uma operação de INCLUSÃO ou ALTERAÇÃO
   FQyPessoasBiblio.Close;
   FQyPessoasBiblio.SQL.Text := FSProcBiblioPessoasIA;
   FQyPessoasUM.ParamByName('iCodPessoa').AsString := ASChave;
   FQyPessoasBiblio.SQL.Text := StringReplace(  FQyPessoasBiblio.SQL.Text,
                                                ':cd_pessoa', ASChave, [rfReplaceAll, rfIgnoreCase]);
   //busca as informações do usuário na base de dados do UNIMESTRE
   try
      FQyPessoasUM.Open;
   except on E: Exception do begin
         FBiblioShop.Log.log('Erro: '+E.Message, true);
         Result := irrError;
         Exit;
      end;
   end;
   //não encontrou informações para a pessoa na base de dados do UNIMESTRE
   //resulta em uma falha
   if FQyPessoasUM.IsEmpty then begin
      ASErro := StringReplace(MSG_ERRO_SELECT_PESSOA, ':cd_pessoa', ASChave, [rfReplaceAll, rfIgnoreCase]);
      Result := irrFailed;
      Exit;
   end;
   //verifica o tipo de pessoa
   if FQyPessoasUM.FieldByName('sn_professor').AsString = 'S' then sTipoUsuario := TIPO_USUARIO_PROFESSOR
   else if FQyPessoasUM.FieldByName('sn_aluno_graduacao').AsString = 'S' then sTipoUsuario := TIPO_USUARIO_FACULDADE
   else if FQyPessoasUM.FieldByName('sn_aluno_colegio').AsString = 'S' then sTipoUsuario := TIPO_USUARIO_COLEGIO
   else if FQyPessoasUM.FieldByName('sn_funcionario').AsString = 'S' then sTipoUsuario := TIPO_USUARIO_FUNCIONARIO;
   if sTipoUsuario = '' then begin
      ASErro := StringReplace(MSG_ERRO_PESSOA_INVALIDA, ':cd_pessoa', ASChave, [rfReplaceAll, rfIgnoreCase]);
      Result := irrFailed;
      Exit;
   end;
   FQyPessoasBiblio.SQL.Text := StringReplace(  FQyPessoasBiblio.SQL.Text,
                                                ':cd_tipo', sTipoUsuario, [rfReplaceAll, rfIgnoreCase]);
   //verifica se possui responsável acadêmico ou financeiro e o seu parentesco
   if FQyPessoasUM.FieldByName('ds_parentesco_resp_acad').AsString <> '' then begin
      sParentescoResp := FQyPessoasUM.FieldByName('ds_parentesco_resp_acad').AsString;
      sNomeResponsavel := FQyPessoasUM.FieldByName('nm_reponsavel_acad').AsString;
   end
   else if FQyPessoasUM.FieldByName('ds_parentesco_resp_finan').AsString <> '' then begin
      sParentescoResp := FQyPessoasUM.FieldByName('ds_parentesco_resp_finan').AsString;
      sNomeResponsavel := FQyPessoasUM.FieldByName('nm_reponsavel_finan').AsString;
   end;
   FQyPessoasBiblio.SQL.Text := StringReplace(  FQyPessoasBiblio.SQL.Text,
                                                ':nm_responsavel', sNomeResponsavel,
                                                [rfReplaceAll, rfIgnoreCase]);
   FQyPessoasBiblio.SQL.Text := StringReplace(  FQyPessoasBiblio.SQL.Text,
                                                ':ds_parentesco_resp', sParentescoResp,
                                                [rfReplaceAll, rfIgnoreCase]);
   //monta o endereço residencial
   sEnderecoRes := FQyPessoasUM.FieldByName('ds_logradouro').AsString;
   if FQyPessoasUM.FieldByName('ds_logradouro_nro').AsString <> '' then
      sEnderecoRes := sEnderecoRes+','+FQyPessoasUM.FieldByName('ds_logradouro_nro').AsString;
   if FQyPessoasUM.FieldByName('ds_complemento').AsString <> '' then
      sEnderecoRes := sEnderecoRes+','+FQyPessoasUM.FieldByName('ds_complemento').AsString;
   if Length(sEnderecoRes) > 43 then
      sEnderecoRes := Copy(sEnderecoRes,0,43);
   FQyPessoasBiblio.SQL.Text := StringReplace(  FQyPessoasBiblio.SQL.Text,
                                                ':ds_logradouro', sEnderecoRes, [rfReplaceAll, rfIgnoreCase]);
   //monta o endereço comercial
   sEnderecoCom := FQyPessoasUM.FieldByName('ds_endereco_com').AsString;
   if FQyPessoasUM.FieldByName('ds_complemento_com').AsString <> '' then
      sEnderecoCom := sEnderecoCom+','+FQyPessoasUM.FieldByName('ds_complemento_com').AsString;
   if Length(sEnderecoCom) > 43 then
      sEnderecoCom := Copy(sEnderecoCom,0,43);
   FQyPessoasBiblio.SQL.Text := StringReplace(  FQyPessoasBiblio.SQL.Text,
                                                ':ds_endereco_com', sEnderecoCom, [rfReplaceAll, rfIgnoreCase]);

   //verifica se a data de nascimento é válida
   if (FQyPessoasUM.FieldByName('dt_nascimento').IsNull) or (FQyPessoasUM.FieldByName('dt_nascimento').AsString = '') then begin
      FQyPessoasBiblio.SQL.Text := StringReplace(FQyPessoasBiblio.SQL.Text, ':dt_nascimento', 'NULL', [rfReplaceAll, rfIgnoreCase]);
   end
   else begin
      FQyPessoasBiblio.SQL.Text := StringReplace(FQyPessoasBiblio.SQL.Text, ':dt_nascimento', StringReplace(FSSQLDataFirebird, ':dt_nascimento', FQyPessoasUM.FieldByName('dt_nascimento').AsString, [rfReplaceAll, rfIgnoreCase]), [rfReplaceAll, rfIgnoreCase]);
   end;


   //substituí as variáveis por seus respectivos valores   
   for i := 0 to FQyPessoasUM.Fields.Count - 1 do begin
      sNomeCampo := FQyPessoasUM.FieldList[i].FieldName;
      if sNomeCampo <> '' then begin
         FQyPessoasBiblio.SQL.Text := StringReplace(  FQyPessoasBiblio.SQL.Text,
                                                      ''':'+sNomeCampo+'''',
                                                      ''''+FQyPessoasUM.FieldByName(sNomeCampo).AsString+'''',
                                                      [rfReplaceAll,rfIgnoreCase]);
      end;
   end;
   //executa o procedimento no Firebird
   try
      FBiblioShop.Log.log(FQyPessoasBiblio.SQL.Text);
      FQyPessoasBiblio.ExecSQL;
      FQyPessoasBiblio.ApplyUpdates;
   except on E: Exception do begin
         FBiblioShop.Log.log('Error : '+E.Message, true);
         Result := irrError;
         Exit;
      end;
   end;
   //fechando as querys
   FQyPessoasUM.Close;
   FQyPessoasBiblio.Close;
   Result := irrSuccess;//sucesso na operação
end;

end.
