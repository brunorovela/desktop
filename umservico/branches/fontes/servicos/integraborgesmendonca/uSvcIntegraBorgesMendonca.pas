unit uSvcIntegraBorgesMendonca;

interface

uses
   uSvcClasses, IniFiles, uDMConexao, SysUtils, uIntegraBase, Classes;

const
   INTEGRA_BM_PESSOAS_COC = 3;
   INTEGRA_BM_PESSOAS_DECISAO = 4;
   INTEGRA_BM_BIB_MULTAS = 5;

type
   { Classe TUMSvcIntegraBorgesMendonca.
     Esta classe implementa a classe padrão de serviços para executar os serviços
     de integraçao do Borges de Mendonça.
   }
   TUMSvcIntegraBorgesMendonca = class(TUMServiceDefault)
   strict private
      FConnBM: TUMConexao;      // Conexão com Borges de Mendonça
      FConnCOC: TUMConexao;     // Conexão com COC
      FConnDecisao: TUMConexao; // Conexão com Decisão
      procedure processaIntegracaoMulta;
      procedure processaIntegracaoMultaCOC;
      procedure processaIntegracaoMultaDecisao;
      procedure processaIntegracaoPessoa;
      procedure processaIntegracaoPessoaCOC;
      procedure processaIntegracaoPessoaDecisao;
   public
      constructor Create;
      function processa: IUMServiceAppRet; override;
      procedure onLoadServico; override;
      procedure onUnloadServico; override;
      procedure stopProcessamento; override;
      property ConnBM: TUMConexao read FConnBM;
      property ConnCOC: TUMConexao read FConnCOC;
      property ConnDecisao: TUMConexao read FConnDecisao;
   end;

implementation

uses
   uSvcIntegraBorgesMendoncaPessoa, uSvcIntegraBorgesMendoncaMultas;

{ TUMSvcIntegraBorgesMendonca }

constructor TUMSvcIntegraBorgesMendonca.Create;
begin
   inherited;
end;

{ Este procedimento é executado quando o serviço é carregado pelo sistema, para
  inicializar as configurações e estabelecer conexão com os bancos de dados.
}
procedure TUMSvcIntegraBorgesMendonca.onLoadServico;
begin
   Self.FConnCOC := TUMConexao.Create;
   Self.FConnDecisao := TUMConexao.Create;
   // Tenta estabelecer conexão com a base de dados do Borges de Mendonça
   Self.FConnBM := TUMConexao.Create;
   if not Self.FConnBM.Conectar(Self.Config, 'Conexao.Borges', false) then
   begin
      Self.Log.log('[Não foi possível estabelecer conexão com o Borges de Mendonça]');
      Self.Log.log('Erro: ' + Self.FConnBM.LastErro);
   end
   // Se possui conexão com o Borges de Mendonça, verifica se possui conexão
   // com o COC ou Decisão. Se conseguir efetuar conexão com pelo menos uma das
   // bases, COC ou Decisão, o serviço pode prosseguir, pois a integração é em
   // direção ao Borges de Mendonça. Se não conseguir estabelecer conexão com
   // nenhum deles, então o serviço terá de ser finalizado, pois não haverá o
   // que integrar.
   else
   begin
      // Tenta estabelecer conexão com o COC
      if not Self.FConnCOC.Conectar(Self.Config, 'Conexao.COC', false) then
      begin
         Self.Log.log('[Não foi possível estabelecer conexão com o COC]');
         Self.Log.log('Erro: ' + Self.FConnCOC.LastErro);
      end;
      // Tenta estabelecer conexão com o Decisão
      if not Self.FConnDecisao.Conectar(Self.Config, 'Conexao.Decisao', false) then
      begin
         Self.Log.log('[Não foi possível estabelecer conexão com o Decisão]');
         Self.Log.log('Erro: ' + Self.FConnDecisao.LastErro);
      end;
   end;
end;

{ Descarrega o serviço da memória. }
procedure TUMSvcIntegraBorgesMendonca.onUnloadServico;
begin
   // Verifica se há conexão com as bases de dados do Borges de Mendonça, COC e
   // Decisão para efetuar a disconexão.
   if Self.FConnBM.Conn.Connected then
      Self.FConnBM.Conn.Disconnect;
   if Self.FConnCOC.Conn.Connected then
      Self.FConnCOC.Conn.Disconnect;
   if Self.FConnDecisao.Conn.Connected then
      Self.FConnDecisao.Conn.Disconnect;
   // Após desconectar, libera os objetos da memória ...
   Self.FConnBM.Free;
   Self.FConnCOC.Free;
   Self.FConnDecisao.Free;   
end;

{ Este metódo efetua a chamada dos procedimentos responsáveis pelo processo de
  integração.
}
function TUMSvcIntegraBorgesMendonca.processa: IUMServiceAppRet;
begin
   Result := srSuccess;
   // Primeiro verifica se há conexão com as bases de dados está de pé, e tenta
   // reconectar se necessário.
   if not Self.FConnBM.Conn.Connected then
   begin
      if not Self.FConnBM.Conectar(Self.Config, 'Conexao.Borges', false) then
      begin
         Self.Log.log('[Erro durante o processamento: perdeu conexão com o Borges de Mendonça]');
         Self.Log.log('Erro: ' + Self.FConnBM.LastErro);
         // Define retorno como srError. Se não há conexão com o Borges de
         // Mendonça, então não há como prosseguir ...
         Result := srError;
      end;
   end;
   // Conexão com o Borges de Mendonça está de pé, prossegue com o processamento...
   if Result <> srError then
   begin
      // Verifica conexão com o COC
      if not Self.FConnCOC.Conn.Connected then
      begin
         if not Self.FConnCOC.Conectar(Self.Config, 'Conexao.COC', false) then
         begin
            Self.Log.log('[Erro durante o processamento: não há conexão com o COC]');
            Self.Log.log('Erro: ' + Self.FConnCOC.LastErro);
         end;
      end;
      // Verifica conexão com o Decisão
      if not Self.FConnDecisao.Conn.Connected then
      begin
         if not Self.FConnDecisao.Conectar(Self.Config, 'Conexao.Decisao', false) then
         begin
            Self.Log.log('[Erro durante o processamento: não há conexão com o Decisão]');
            Self.Log.log('Erro: ' + Self.FConnDecisao.LastErro);
         end;
      end;
      // Se não conseguiu estabelecer conexão com COC e Decisão, então não poderá
      // prosseguir com a integração e define o retorno com código de erro
      if (not Self.FConnCOC.Conn.Connected) and (not Self.FConnDecisao.Conn.Connected) then
      begin
         Result := srError;
      end;
      if Result <> srError then
      begin
         // Verifica se o arquivo de configuração está configurado para integrar
         // pessoas...
         if Self.Config.ReadString('Servicos.Integrar', 'Pessoa', '0') = '1' then
         begin
            Self.Log.log('[Integrando pessoas ...]');
            Self.processaIntegracaoPessoa;
         end;
         // Verifica se o aquivo de configuração está configurado para integrar
         // multas da biblioteca
         if Self.Config.ReadString('Servicos.Integrar', 'BibMultas', '0') = '1' then
         begin
            Self.Log.log('[Integrando multas da biblioteca ...]');
            Self.processaIntegracaoMulta;
         end;
      end;
   end;
end;

{ Processa a integração de multas da biblioteca do Borges de Mendonça com o COC
  e Decisão.
}
procedure TUMSvcIntegraBorgesMendonca.processaIntegracaoMulta;
var
   oObject: TUMSvcIntegraBorgesMendoncaMultas;
   oIntegraBase: TUMIntegraBase;
begin
   // primeiro efetua a leitura das multas da biblioteca no Borges de Mendonça
   // para efetuar a integração com COC e Decisão
   oIntegraBase := TUMIntegraBase.Create(Self.FConnBM, Self.Config.ReadString('Configuracoes', 'NrRegistroIteracao', '100'));
   oIntegraBase.setLogger(Self.Log);
   oObject := TUMSvcIntegraBorgesMendoncaMultas.Create(Self);
   try
      if not oIntegraBase.IntegraPendentes(INTEGRA_BM_BIB_MULTAS, oObject) then
         Self.Log.log('[Erro ao tentar integrar multas Borges de Mendonça ...]');
   finally
      //oIntegraBase.Free;
   end;
   // efetua a leitura das mensalidades que tiveram baixa no sistema financeiro
   // do COC e Decisão e efetua a integração na biblioteca do Borges de Mendonça
   if Self.FConnCOC.Conn.Connected then
      Self.processaIntegracaoMultaCOC;
   if Self.FConnDecisao.Conn.Connected then
      Self.processaIntegracaoMultaDecisao;
end;

{ Efetua o processamento das mensalidades no COC que possuem vínculo com o
  sistema da biblioteca do Borges de Mendonça.
}
procedure TUMSvcIntegraBorgesMendonca.processaIntegracaoMultaCOC;
var
   oObject: TUMSvcIntegraMensalidade;
   oIntegraBase: TUMIntegraBase;
begin
   oIntegraBase := TUMIntegraBase.Create(Self.FConnCOC, Self.Config.ReadString('Configuracoes', 'NrRegistroIteracao', '100'));
   oIntegraBase.setLogger(Self.Log);
   oObject := TUMSvcIntegraMensalidade.Create(Self);
   try
      if not oIntegraBase.IntegraPendentes(INTEGRA_BM_BIB_MULTAS, oObject) then
         Self.Log.log('[Erro ao tentar integrar multas COC ...]');
   finally
//      oIntegraBase.Free;
   end;
end;

{ Processa a integração das mensalidades do sistema Financeiro do Decisão com o
  sistema da biblioteca do Borges de Mendonça.
}
procedure TUMSvcIntegraBorgesMendonca.processaIntegracaoMultaDecisao;
var
   oObject: TUMSvcIntegraMensalidade;
   oIntegraBase: TUMIntegraBase;
begin
   oIntegraBase := TUMIntegraBase.Create(Self.FConnDecisao, Self.Config.ReadString('Configuracoes', 'NrRegistroIteracao', '100'));
   oIntegraBase.setLogger(Self.Log);
   oObject := TUMSvcIntegraMensalidade.Create(Self);
   try
      if not oIntegraBase.IntegraPendentes(INTEGRA_BM_BIB_MULTAS, oObject) then
         Self.Log.log('[Erro ao tentar integrar multas Decisão ...]');
   finally
//      oIntegraBase.Free;
   end;
end;

{ Efetua a integração de pessoas. A integração será chamada apenas se houver
  conexão para tal.
}
procedure TUMSvcIntegraBorgesMendonca.processaIntegracaoPessoa;
begin
   if Self.FConnCOC.Conn.Connected then
      Self.processaIntegracaoPessoaCOC;
   if Self.FConnDecisao.Conn.Connected then
      Self.processaIntegracaoPessoaDecisao;
end;

{ Efetua a integração das informações de pessoas da base de dados COC com o
  Borges de Mendonça.
}
procedure TUMSvcIntegraBorgesMendonca.processaIntegracaoPessoaCOC;
var
   oObject: TUMSvcIntegraBorgesMendoncaPessoa;
   oIntegraBase: TUMIntegraBase;
begin
   oIntegraBase := TUMIntegraBase.Create(Self.FConnCOC, Self.Config.ReadString('Configuracoes', 'NrRegistroIteracao', '100'));
   oIntegraBase.setLogger(Self.Log);
   oObject := TUMSvcIntegraBorgesMendoncaPessoa.Create(Self);
   try
      if not oIntegraBase.IntegraPendentes(INTEGRA_BM_PESSOAS_COC, oObject) then
         Self.Log.log('[Erro ao tentar integrar pessoas COC ...]');
   finally
//      oIntegraBase.Free;
   end;
end;

{ Efetua a integração das informações de pessoas da base de dados do Decisão
  para o Borges de Mendonça.
}
procedure TUMSvcIntegraBorgesMendonca.processaIntegracaoPessoaDecisao;
var
   oObject: TUMSvcIntegraBorgesMendoncaPessoa;
   oIntegraBase: TUMIntegraBase;
begin
   oIntegraBase := TUMIntegraBase.Create(Self.FConnDecisao, Self.Config.ReadString('Configuracoes', 'NrRegistroIteracao', '100'));
   oIntegraBase.setLogger(Self.Log);
   oObject := TUMSvcIntegraBorgesMendoncaPessoa.Create(Self);
   try
      if not oIntegraBase.IntegraPendentes(INTEGRA_BM_PESSOAS_DECISAO, oObject) then
         Self.Log.log('[Erro ao tentar integrar pessoas Decisão ...]');
   finally
//      oIntegraBase.Free;
   end;
end;

procedure TUMSvcIntegraBorgesMendonca.stopProcessamento;
begin
   inherited;
end;

initialization
   RegisterClass(TUMSvcIntegraBorgesMendonca);

finalization
   UnRegisterClass(TUMSvcIntegraBorgesMendonca);

end.
