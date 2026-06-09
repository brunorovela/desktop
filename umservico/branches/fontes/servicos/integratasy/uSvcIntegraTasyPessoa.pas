{*******************************************************************************

  Contém as classes e tipos usados na integração TASY - UNIMESTRE para pessoas

  Usa o padrão JavaDoc e pode ser obtido mais informações em:
  http://java.sun.com/j2se/javadoc/writingdoccomments/index.html

  Uninformare Informática
  http://www.uninformare.com.br/

  @author Uninformare Informática
  @version 28/04/2008
  
*******************************************************************************}
unit uSvcIntegraTasyPessoa;

interface

uses
   SysUtils, Variants, Classes, uSvcClasses, uDMConexao, uIntegraBase,
   uSvcIntegraTasy, ZAbstractRODataset, UZDataset;

const
   //constantes de erro
   MSG_ERRO_EXCLUSAO = 'Não foi possível efetuar exclusão de pessoa, pois existem informações na tabela de pessoas.';
   MSG_ERRO_INCLUSAO = 'Não foi possível efetuar inclusão de pessoa, pois não existem informações na tabela de pessoas.';
   MSG_ERRO_ALTERACAO = 'Não foi possível efetuar alteração de pessoa, pois não existem informações na tabela de pessoas.';

type
   TUMSvcIntegraTasyPessoa = class(TInterfacedObject, IUMIntegraRegistros)
   private
      AIntegraTasy: TUMSvcIntegraTasy;    //referência para TUMSvcIntegraTasy
      AQyPessoasUm: TUMZReadOnlyQuery;      //select de pessoas
      AQyPessoasTasy: TUMZQuery;            //Executa a procedure do Tasy
      AQyErroProcedure: TUMZReadOnlyQuery;  //select do erro na procedure do Tasy
      ASProcedureTasy: string;            //procedure do Tasy
      ASQueryPessoas: string;             //select na tabela de pessoas
   public
      constructor Create(FIntegraTasy: TUMSvcIntegraTasy); //construtor
      function IntegraRegistro(var AUMIntegraBase: TUMIntegraBase;
         const AICodIntegracao, AICodParceiro: integer; ACAcao: Char;
         const ASChave, ASExtra: string; var ASErro: string;
         const ADtRegistro: TDateTime): TIntegraRegistroRet;
   end;

implementation

uses DB;

{ TUMSvcIntegraTasyPessoa }

{**
   Construtor.
   Inicializa os atributos da classe.
}
constructor TUMSvcIntegraTasyPessoa.Create(FIntegraTasy: TUMSvcIntegraTasy);
begin
   //Inicializa os objetos locais
   AIntegraTasy := FIntegraTasy;
   AQyPessoasUm := AIntegraTasy.ConnUnimestre.newROQuery;
   AQyPessoasTasy := AIntegraTasy.ConnTasy.newQuery;
   AQyErroProcedure := AIntegraTasy.ConnTasy.newROQuery;
   //pega o retorno da procedure do Oracle
   AQyErroProcedure.SQL.Text := 'SELECT @retorno';
   //Procedure para executar no Oracle
   ASProcedureTasy :=
   'CALL UNIMESTRE_PF('+
   '":cd_pessoa",":acao",":cd_pai",":cd_mae",":nm_pessoa",":dt_nascimento",":ds_cidade_nascimento",'+
   '":ds_estado_nascimento",":ds_pais_nascimento",":ds_logradouro",":ds_logradouro_nro",'+
   '":ds_complemento",":ds_cep",":ds_bairro",":ds_cidade",":ds_estado",":ds_pais",":ds_sexo",'+
   '":ds_nacionalidade",":ds_identidade",":ds_identidade_orgao_exp",":dt_identidade_expedicao",'+
   '":ds_cpf",":nm_pai",":nm_mae",":cd_estado_civil",":nm_conjuge",@retorno)';
   //Select para trazer as informações de pessoa
   ASQueryPessoas :=
   'SELECT '+
   'p1.cd_pai,'+
   'p1.cd_mae,'+
   'p1.nm_pessoa,'+
   'DATE_FORMAT(p1.dt_nascimento, "%Y-%m-%d") dt_nascimento,'+
   'CASE WHEN p1.ds_cidade_nascimento IS NULL THEN m1.ds_municipio ELSE p1.ds_cidade_nascimento END AS ds_cidade_nascimento,'+
   'p1.ds_estado_nascimento,'+
   'CASE WHEN p1.ds_pais_nascimento IS NULL THEN a1.ds_pais ELSE p1.ds_pais_nascimento END AS ds_pais_nascimento,'+
   'p1.ds_logradouro,'+
   'p1.ds_logradouro_nro,'+
   'p1.ds_complemento,'+
   'p1.ds_cep,'+
   'p1.ds_bairro,'+
   'CASE WHEN p1.ds_cidade IS NULL THEN m2.ds_municipio ELSE p1.ds_cidade END AS ds_cidade,'+
   'p1.ds_estado,'+
   'CASE WHEN p1.ds_pais IS NULL THEN a2.ds_pais ELSE p1.ds_pais END AS ds_pais,'+
   'p1.ds_sexo,'+
   'p1.ds_nacionalidade,'+
   'p1.ds_identidade,'+
   'p1.ds_identidade_orgao_exp,'+
   'DATE_FORMAT(p1.dt_identidade_expedicao, "%Y-%m-%d") dt_identidade_expedicao,'+
   'CASE WHEN p1.ds_cpf = ''00000000000'' THEN NULL ELSE p1.ds_cpf END AS ds_cpf,'+
   'p2.nm_pessoa nm_pai,'+
   'p3.nm_pessoa nm_mae,'+
   'p1.cd_estado_civil,'+
   'p1.nm_conjuge '+
   'FROM '+
   'pessoas p1 '+
   'LEFT JOIN pessoas p2 ON(p1.cd_pai = p2.cd_pessoa) '+
   'LEFT JOIN pessoas p3 ON(p1.cd_mae = p2.cd_pessoa) '+
   'LEFT JOIN municipios m1 ON(m1.cd_municipio = p1.cd_municipio_nasc) '+
   'LEFT JOIN municipios m2 ON(m2.cd_municipio = p1.cd_municipio) '+
   'LEFT JOIN paises a1 ON(a1.cd_pais = p1.cd_pais) '+
   'LEFT JOIN paises a2 ON(a2.cd_pais = p1.cd_pais) '+
   'WHERE '+
   'p1.cd_pessoa = :iCodPessoa;';
end;

{**
   Executa a procedure na base de dados do TASY.
   @return  TIntegraRegistroRet
}
function TUMSvcIntegraTasyPessoa.IntegraRegistro(
   var AUMIntegraBase: TUMIntegraBase; const AICodIntegracao,
   AICodParceiro: integer; ACAcao: Char; const ASChave, ASExtra: string;
   var ASErro: string; const ADtRegistro: TDateTime): TIntegraRegistroRet;
var
   i: integer;
   sNomeField: string;
begin
   //reinicia as variáveis
   AQyPessoasUm.SQL.Text := ASQueryPessoas;
   AQyPessoasTasy.SQL.Text := ASProcedureTasy;
   AQyPessoasUm.Close;
   AQyPessoasTasy.Close;
   AQyErroProcedure.Close;
   //pega as informações de pessoas UNIMESTRE
   AQyPessoasUm.ParamByName('iCodPessoa').AsString := ASChave;
   try//tenta resgatar as informações de pessoa no Unimestre
      AQyPessoasUm.Open;
   except
      on E: Exception do begin
         AIntegraTasy.Log.log('Erro: '+E.Message, True);//guarda log de erro se houver
         Result := irrError;
         Exit;
      end;
   end;
   //verifica se há alguma inconsistência na relação OPERAÇÃOxAÇÃO
   if not AQyPessoasUm.IsEmpty then begin//não há registros
      if ACAcao = 'R' then begin//ação de exclusão
         Result := irrFailed;
         ASErro := MSG_ERRO_EXCLUSAO;
         Exit;
      end;
   end
   else begin//há registros
      if ACAcao = 'I' then begin//ação de inclusão
         Result := irrFailed;
         ASErro := MSG_ERRO_INCLUSAO;
         Exit;
      end
      else if ACAcao = 'A' then begin//ação de alteração
         Result := irrFailed;
         ASErro := MSG_ERRO_ALTERACAO;
         Exit;
      end;
   end;
   //substituí as variáveis para montar o procedimento de execução
   AQyPessoasTasy.SQL.Text := StringReplace(AQyPessoasTasy.SQL.Text, ':cd_pessoa', ASChave, [rfReplaceAll,rfIgnoreCase]);
   AQyPessoasTasy.SQL.Text := StringReplace(AQyPessoasTasy.SQL.Text, ':acao', ACAcao, [rfReplaceAll,rfIgnoreCase]);
   for i := 0 to AQyPessoasUm.Fields.Count - 1 do begin
      sNomeField := AQyPessoasUm.FieldList[i].FieldName;
      if sNomeField <> '' then
         AQyPessoasTasy.SQL.Text := StringReplace(AQyPessoasTasy.SQL.Text, '":'+sNomeField+'"', '"'+AQyPessoasUm.FieldByName(sNomeField).AsString+'"', [rfReplaceAll,rfIgnoreCase]);
   end;
   //executa a procedure no banco de dados Oracle
   AQyPessoasTasy.Close;
   try//tenta efetuar a integração com o Tasy
      AQyPessoasTasy.ExecSQL;
   except
      on E: Exception do begin
         AIntegraTasy.Log.log('Erro: '+E.Message, True);//houve erro. guarda o log
         Result := irrError;
         Exit;
      end;
   end;
   //pega o retorno da procedure no Oracle
   AQyErroProcedure.Close;
   try//tenta resgatar a mensagem de retorno na procedure
      AQyErroProcedure.Open;
   except
      on E: Exception do begin
         AIntegraTasy.Log.log('Erro: '+E.Message, True);//guarda log de erro
         Result := irrError;
         Exit;
      end;
   end;
   ASErro := AQyErroProcedure.FieldByName('@retorno').AsString;
   //Se não houve retorno a procedure foi executada com sucesso
   if ASErro = '' then begin
      Result := irrSuccess;
   end
   //retornou algum erro
   else begin
      Result := irrFailed;
   end;
   //fechando as querys
   AQyPessoasUm.Close;
   AQyPessoasTasy.Close;
   AQyErroProcedure.Close;
end;

end.
