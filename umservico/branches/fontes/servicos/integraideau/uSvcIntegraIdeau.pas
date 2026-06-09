unit uSvcIntegraIdeau;

interface

uses
   uSvcClasses, uDMConexao, uIntegraBase, IniFiles, SysUtils, Classes;

const
   INTEGRA_IDEAU_PESSOAS = 6;

type
   {**
      Esta classe implementa um serviço do Unimestre para efetuar a integração
      de dados entre as base de dados do cliente Ideau, envolvendo a base da
      Ideau (Graduação) e Idesc (Pós-Graduação) 
   }
   TUMSvcIntegraIdeau = class(TUMServiceDefault)
   strict private
      FUMConIdeau: TUMConexao; // Objeto de conexão com a base de dados Ideau
      FUMConIdesc: TUMConexao; // Objeto de conexão com a base de dados Idesc
      function ProcessaIntegracaoIdeauPessoa: boolean;
   public
      constructor Create;
      function processa: IUMServiceAppRet; override;
      procedure onLoadServico; override;
      procedure onUnloadServico; override;
      procedure stopProcessamento; override;
      property ConIdeau: TUMConexao read FUMConIdeau;
      property ConIdesc: TUMConexao read FUMConIdesc;
   end;

implementation

uses
   uSvcIntegraIdeauPessoa;

{ TUMSvcIntegraIdeau }

constructor TUMSvcIntegraIdeau.Create;
begin
   inherited;
end;

{**
   Executa a carga inicial do serviço. Tenta abrir conexão com as bases de dados
   envolvidas na integração. Se não houver conexão com uma das partes, o serviço
   será interrompido.
}
procedure TUMSvcIntegraIdeau.onLoadServico;
begin
   FUMConIdeau := TUMConexao.Create;
   FUMConIdesc := TUMConexao.Create;
   FUMConIdeau.Conectar(Config, 'Conexao.Ideau', false);
   if not FUMConIdeau.IsConectado(false, true) then
   begin
      Log.log('Não foi possível estabelecer conexão com a base de dados IDEAU: abortando...');
   end
   else
   begin
      FUMConIdesc.Conectar(Config, 'Conexao.Idesc', false);
      if not FUMConIdesc.IsConectado(false, true) then
         Log.log('Não foi possível estabelecer conexão com a base de dados IDESC: abortando...');
   end;
end;

{**
   Este método é executado quando o serviço é descarregado, ou seja, quando o
   serviço do Windows é parado pelo usuário. Desconecta-se das bases de dados
   e libera-se os objetos da memória.
}
procedure TUMSvcIntegraIdeau.onUnloadServico;
begin
   if FUMConIdeau.getConexao.Connected then
      FUMConIdeau.getConexao.Disconnect;
   if FUMConIdesc.getConexao.Connected then
      FUMConIdesc.getConexao.Disconnect;
   FreeAndNil(FUMConIdeau);
   FreeAndNil(FUMConIdesc);   
end;

{**
   Executa o processamento do serviço. Antes de iniciar o processamento dos
   serviço configurados, verifica-se se ainda há conexão com as bases de dados,
   tentando restabelecer a conexão quando não há conectividade. Se ainda assim
   não houver conexão, o serviço não será executado.
}
function TUMSvcIntegraIdeau.processa: IUMServiceAppRet;
begin
   Result := srSuccess;
   try
      if not FUMConIdeau.IsConectado(true, true) then
         FUMConIdeau.Conectar(Config, 'Conexao.Ideau', false);
   except
      on E: Exception do
         Log.log('[ERRO] Ao tentar estabelecer conexão com IDEAU: ' + E.Message);
   end;
   try
      if not FUMConIdesc.IsConectado(true, true) then
         FUMConIdesc.Conectar(Config, 'Conexao.Idesc', false);
   except
      on E: Exception do
         Log.log('[ERRO] Ao tentar estabelecer conexão com IDESC: ' + E.Message);
   end;
   if not FUMConIdeau.IsConectado(false, true) then
   begin
      Log.log('Não foi possível estabelecer conexão com a base de dados IDEAU: ' + FUMConIdeau.LastErro);
      Result := srError;
   end;
   if not FUMConIdesc.IsConectado(false, true) then
   begin
      Log.log('Não foi possível estabelecer conexão com a base de dados IDESC: ' + FUMConIdesc.LastErro);
      Result := srError;
   end;
   if Result <> srError then
   begin
      if Config.ReadString('Servicos.Integrar', 'Pessoa', '0') = '1' then
      begin
         Log.log('Integrando pessoas...');
         if not ProcessaIntegracaoIdeauPessoa then
            Result := srError;
      end;
   end;
end;

{**
   Executa a integração de pessoas entre as bases de dados Ideau e Idesc.
   Utiliza uma classe que é a implementação de uma interface de integração de
   registros, para efetuar a integração dos registros pendentes na Idesc na
   base de da Ideau.
}
function TUMSvcIntegraIdeau.ProcessaIntegracaoIdeauPessoa: boolean;
var
   LUMSvcIntegraIdeauPessoa: TUMSvcIntegraIdeauPessoa;
   LUMIntegraBase: TUMIntegraBase;
begin
   LUMIntegraBase := TUMIntegraBase.Create(FUMConIdesc, Config.ReadString('Configuracoes', 'NrRegistroIteracao', '500'));
   LUMIntegraBase.setLogger(Log);
   LUMSvcIntegraIdeauPessoa := TUMSvcIntegraIdeauPessoa.Create(Self);
   Result := LUMIntegraBase.IntegraPendentes(INTEGRA_IDEAU_PESSOAS, LUMSvcIntegraIdeauPessoa);
   if not Result then
      Log.log('[ERRO] Ao tentar integrar pessoas...');
end;

procedure TUMSvcIntegraIdeau.stopProcessamento;
begin
   inherited;
end;

initialization
   RegisterClass(TUMSvcIntegraIdeau);

finalization
   UnRegisterClass(TUMSvcIntegraIdeau);

end.
