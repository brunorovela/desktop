unit uSvcIntegraPessoasPadrao;

interface

uses
   uSvcClasses, uDMConexao, uIntegraBase, IniFiles, SysUtils, Classes;

const
   INTEGRA_DESTINO_PESSOAS = 6;

type
   {**
      Esta classe implementa um serviço do Unimestre para efetuar a integração
      de dados entre as base de dados de qualquer cliente, onde haja necessidade
      de integração de pessoas
   }
   TUMSvcIntegraPessoasPadrao = class(TUMServiceDefault)
   strict private
      FUMConDestino: TUMConexao; // Objeto usado para realizar conexões nas bases destinos
      FUMConOrigem: TUMConexao; // Objeto usado para realizar conexões nas bases origens

      FConDestinoParceiro,
      FConDestinoColigada: Integer;
      
      function ProcessaIntegracaoPessoa(ChaveGrupo: String): boolean;
   public
      constructor Create;
      function processa: IUMServiceAppRet; override;
      procedure onLoadServico; override;
      procedure onUnloadServico; override;
      procedure stopProcessamento; override;
      property ConDestino: TUMConexao read FUMConDestino;
      property ConOrigem: TUMConexao read FUMConOrigem;
   end;

implementation

   uses uSvcIntegraPessoa;

{ TUMSvcIntegra }

constructor TUMSvcIntegraPessoasPadrao.Create;
begin
   inherited;
end;

{**
   Executa a carga inicial do serviço. Tenta abrir conexão com as bases de dados
   envolvidas na integração. Se não houver conexão com uma das partes, o serviço
   será interrompido.
}
procedure TUMSvcIntegraPessoasPadrao.onLoadServico;
begin
   FUMConDestino := TUMConexao.Create;
   FUMConOrigem := TUMConexao.Create;
end;

{**
   Este método é executado quando o serviço é descarregado, ou seja, quando o
   serviço do Windows é parado pelo usuário. Desconecta-se das bases de dados
   e libera-se os objetos da memória.
}
procedure TUMSvcIntegraPessoasPadrao.onUnloadServico;
begin
   if FUMConDestino.getConexao.Connected then
   begin
      FUMConDestino.getConexao.Disconnect;
   end;

   if FUMConOrigem.getConexao.Connected then
   begin
      FUMConOrigem.getConexao.Disconnect;
   end;
      
   FreeAndNil(FUMConDestino);
   FreeAndNil(FUMConOrigem);
end;

{**
   Executa o processamento do serviço. Antes de iniciar o processamento dos
   serviço configurados, verifica-se se ainda há conexão com as bases de dados,
   tentando restabelecer a conexão quando não há conectividade. Se ainda assim
   não houver conexão, o serviço não será executado.
}
function TUMSvcIntegraPessoasPadrao.processa: IUMServiceAppRet;
var
   conexoes: TStringList;
   i, j: Integer;
begin

   // Define por padrão que foi um sucesso
   Result := srSuccess;

   // Inicializa Lista de conexões disponíveis
   conexoes := TStringList.Create();
   Config.ReadSections(conexoes);

   // Percorre todas conexões disponíveis
   for i := 0 to conexoes.Count - 1 do
   begin

      // Procura por alguma conexão que seja destino
      if Pos('Conexao.Destino', conexoes[i]) > 0 then
      begin

         // Tenta conectar na base de dados Destino encontrada
         ConDestino.Conectar(config, conexoes[i], False);

         // Verifica se conexão efetuada com exito
         if not ConDestino.IsConectado(False, True) then
         begin
            Log.log('Não foi possível estabelecer conexão com a base de dados Destino: ' + conexoes[i]);
         end
         else
         begin
            // Guarda o código de coligada que o usuário deve ser inserido na base destino
            FConDestinoColigada := Config.ReadInteger(conexoes[i], 'Coligada', 1);

            // Para cada conexão destino procura em todas as conexões se há
            // alguma conexão origem para esta conexão destino
            for j := 0 to conexoes.Count - 1 do
            begin

               // Procura conexões origens
               if Pos('Conexao.Origem', conexoes[j]) > 0 then
               begin

                  // Verifica se a conexão origem encontrada é para a conexão
                  // destino encontrada acima
                  if ('Conexao.Destino.' + Config.ReadString(conexoes[j], 'Destino', '')) = conexoes[i] then
                  begin

                     //tenta conectar na base de dados origem
                     ConOrigem.Conectar(config, conexoes[j], False);

                     // Guarda o código do parceiro origem, pois podem haver uma origem para
                     // dois destinos diferentes.
                     FConDestinoParceiro := Config.ReadInteger(conexoes[j], 'Parceiro', 6);

                     // Verifica se obteve conexão com sucesso
                     if not ConOrigem.IsConectado(False, True) then
                     begin
                        Log.log('Não foi possível estabelecer conexão com a base de dados Origem: ' + conexoes[j]);
                     end
                     else
                     begin
                        // Verifica se é parar integrar as pessoas
                        if Config.ReadString('Servicos.Integrar', 'Pessoa', '0') = '1' then
                        begin

                           Log.log('Integrando pessoas...');

                           if not ProcessaIntegracaoPessoa(Config.ReadString(conexoes[j], 'Chave', '')) then
                           begin
                              Result := srError;
                           end;
                        end;
                     end;
                  end;
               end;
            end;
         end;
      end;
   end;
end;

{**
   Executa a integração de pessoas entre as bases de dados Ideau e Idesc.
   Utiliza uma classe que é a implementação de uma interface de integração de
   registros, para efetuar a integração dos registros pendentes na Idesc na
   base de da Ideau.
}
function TUMSvcIntegraPessoasPadrao.ProcessaIntegracaoPessoa(ChaveGrupo: String): boolean;
var
   LUMSvcIntegraPessoasPadrao: TUMSvcIntegraPessoa;
   LUMIntegraBase: TUMIntegraBase;
begin
   LUMIntegraBase := TUMIntegraBase.Create(ConOrigem, Config.ReadString('Configuracoes', 'NrRegistroIteracao', '500'));

   LUMIntegraBase.setLogger(Log);
   
   LUMSvcIntegraPessoasPadrao := TUMSvcIntegraPessoa.Create(Self, ChaveGrupo, FConDestinoColigada);
   
   Result := LUMIntegraBase.IntegraPendentes(FConDestinoParceiro, LUMSvcIntegraPessoasPadrao);

   if not Result then
      Log.log('[ERRO] Ao tentar integrar pessoas...');

   if ConDestino.IsConectado(False, True) then
   begin
      ConDestino.getConexao.Disconnect;
   end;

   if ConOrigem.IsConectado(False, True) then
   begin
      ConOrigem.getConexao.Disconnect;
   end;
end;

procedure TUMSvcIntegraPessoasPadrao.stopProcessamento;
begin
   inherited;
end;

initialization
   RegisterClass(TUMSvcIntegraPessoasPadrao);

finalization
   UnRegisterClass(TUMSvcIntegraPessoasPadrao);

end.
