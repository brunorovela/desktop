unit USvcSecullum;

interface

uses
   SysUtils, Classes, DBTables, DB, ZDbcIntfs, uDMConexao, uSvcClasses, uUMAuth;

type
   TUMSvcSecullum = class(TUMServiceDefault)
   strict private
      FConnUnimestre: TUMConexao;
      FConnSecullum: TDatabase;
      FMessageLine1: AnsiString;
      FMessageLine2: AnsiString;
      function Execute: Boolean;
   public
      constructor Create;
      function processa: IUMServiceAppRet; override;
      procedure onLoadServico; override;
      procedure onUnloadServico; override;
      procedure stopProcessamento; override;
   end;

implementation

uses ZConnection, BDE;

{ TUMSvcSecullum }

constructor TUMSvcSecullum.Create;
begin
   inherited;
end;

function TUMSvcSecullum.Execute: Boolean;
const
   SErrorCallProcSecullumFmt = '[Erro] Erro ao tentar efetuar a integração do aluno %d: %s';
   SErrorCallProcUnimestreFmt = '[Erro] Erro ao tentar executar a função de seleção de alunos no banco de dados Unimestre: %s';
   SErrorSelectPessoasFmt = '[Erro] Erro ao tentar selecionar os alunos no banco de dados do Unimestre: %s';
   SSQLSelectPessoas = 'SELECT i.CD_PESSOA, p.nm_pessoa, i.NR_ESTADO, i.DT_INICIO, i.DT_FIM, i.DS_CLASSIFICACAO, i.SN_EXCLUIR FROM UNIM_INTEGRACAO_SECULLUM i JOIN pessoas p ON (i.CD_PESSOA = p.cd_pessoa) WHERE i.SN_ATUALIZAR = 1';
   SSQLUpdatePessoas = 'UPDATE unim_integracao_secullum SET SN_ATUALIZAR = 0 WHERE SN_ATUALIZAR = 1';
   SSQLCallProcSecullum = 'EXEC dbo.spo_unimestre_importar :ID, :NOME, :ESTADO, :INICIO, :FIM, :EXCLUIR, :MENSAGEM_LINHA1, :MENSAGEM_LINHA2, :CLASSIFICACAO';   
   SSQLCallProcUnimestre = 'CALL SPX_INTEGRACAO_SECULLUM()';
var
   Stmt: IZStatement;
   Rs: IZResultSet;
   Proc: TQuery;
begin
   try
      Result := FConnUnimestre.Conn.ExecuteDirect(SSQLCallProcUnimestre);
      Stmt := FConnUnimestre.Conn.DbcConnection.CreateStatement;
      try
         Stmt.SetResultSetConcurrency(rcUpdatable);
         try
            Rs := Stmt.ExecuteQuery(SSQLSelectPessoas);

            Proc := TQuery.Create(nil);
            try
               Proc.DatabaseName := FConnSecullum.DatabaseName;
               Proc.SQL.Text := SSQLCallProcSecullum;

               while Rs.Next do
               begin
               
                  Proc.ParamByName('ID').AsString := Rs.GetStringByName('CD_PESSOA');
                  Proc.ParamByName('NOME').AsString := Rs.GetStringByName('NM_PESSOA');
                  Proc.ParamByName('ESTADO').AsInteger := Rs.GetIntByName('NR_ESTADO');
                  Proc.ParamByName('INICIO').AsString := Rs.GetStringByName('DT_INICIO');
                  Proc.ParamByName('FIM').AsString := Rs.GetStringByName('DT_FIM');
                  Proc.ParamByName('EXCLUIR').AsBoolean := Rs.GetIntByName('SN_EXCLUIR') = 1;
                  Proc.ParamByName('CLASSIFICACAO').AsString := Rs.GetStringByName('DS_CLASSIFICACAO');
                  Proc.ParamByName('MENSAGEM_LINHA1').AsString := FMessageLine1;
                  Proc.ParamByName('MENSAGEM_LINHA2').AsString := FMessageLine2;
                     
                  try
                     Proc.ExecSQL;
                  except
                     on E: Exception do
                     begin
                        Log.log(Format(SErrorCallProcSecullumFmt, [Rs.GetInt(1), E.Message]));
                        Result := False;
                     end;
                  end;

               end;

               FConnUnimestre.Conn.ExecuteDirect(SSQLUpdatePessoas);
               
            finally
               Proc.Free;
               Proc := nil;
            end;
         except

            on E: Exception do
            begin
               Log.log(Format(SErrorSelectPessoasFmt, [E.Message]));
               Result := False;
            end;
            
         end;
         
      finally
         Stmt.Close;
         Stmt := nil;
      end;
      
   except
   
      on E: Exception do
      begin
         Result := False;
         Log.log(Format(SErrorCallProcUnimestreFmt, [Rs.GetInt(1), E.Message]));
      end;
   end;
end;

procedure TUMSvcSecullum.onLoadServico;
const
   SSQLSelectParams =
      'SELECT ' +
         'p.ds_parametro,' +
         'p.ds_valor ' +
      'FROM ' +
         'nu_parametros p ' +
      'WHERE ' +
         'p.ds_parametro IN (''integracao.secullum.mensagem.linha1'', ''integracao.secullum.mensagem.linha2'') AND ' +
         'EXISTS (' +
            'SELECT ' +
               'm.cd_modulo ' +
            'FROM ' +
               'nu_modulos m ' +
            'WHERE ' +
               'p.cd_modulo = m.cd_modulo ' +
               'AND m.ds_chave = ''UMServico'')';
   
   SNoConnFmt = 'Não foi possível estabelecer conexão com o banco de dados do %s: abortando...';
   SPropUserFmt = 'USER NAME=%s';
   SPropPassFmt = 'PASSWORD=%s';
var
   SecullumDSN, SecullumUser, SecullumPass: AnsiString;
   Rs: IZResultSet;
begin
   FConnUnimestre := TUMConexao.Create(nil);
   FConnUnimestre.Conectar(Config, 'Conexao.Unimestre', False);

   if not FConnUnimestre.IsConectado(False) then
   begin
      Log.log(Format(SNoConnFmt, ['Unimestre']));
   end;

   if FConnUnimestre.IsConectado(False) then
   begin
      FMessageLine1 := 'Dirija-se à';
      FMessageLine2 := 'Recepção';

      Rs := FConnUnimestre.Conn.DbcConnection.CreateStatement.ExecuteQuery(SSQLSelectParams);
      try
         while Rs.Next do
         begin
            if Rs.GetString(1) = 'integracao.secullum.mensagem.linha1' then
               FMessageLine1 := Rs.GetString(2);

            if Rs.GetString(2) = 'integracao.secullum.mensagem.linha2' then
               FMessageLine2 := Rs.GetString(2);            
         end;
      finally
         Rs.Close;
         Rs := nil;
      end;

      SecullumDSN := Config.ReadString('Conexao.Secullum', 'Banco', 'SecullumAcessoNet');
      SecullumUser := Config.ReadString('Conexao.Secullum', 'Usuario', 'sa');
      SecullumPass := TUMAuthCryptography.decode(Config.ReadString('Conexao.Secullum', 'Senha', '15DB688AB22AAF50F941'));

      FConnSecullum := TDatabase.Create(nil);
      FConnSecullum.AliasName := SecullumDSN;
      FConnSecullum.DatabaseName := SecullumDSN;
      FConnSecullum.LoginPrompt := False;
      FConnSecullum.Params.Add(Format(SPropUserFmt, [SecullumUser]));
      FConnSecullum.Params.Add(Format(SPropPassFmt, [SecullumPass]));

      try
         FConnSecullum.Connected := True;
         
         if not FConnSecullum.Connected then
         begin
            Log.log(Format(SNoConnFmt, ['Secullum']));
         end;
         
      except
         on E: Exception do
         begin
            Log.log(Format(SNoConnFmt, ['Secullum']));
         end;
      end;
      
   end;
end;

procedure TUMSvcSecullum.onUnloadServico;
begin
   if FConnUnimestre.IsConectado(False) then
      FConnUnimestre.Desconectar;

   if FConnSecullum.Connected then
      FConnSecullum.Connected := False;

   FreeAndNil(FConnUnimestre);
   FreeAndNil(FConnSecullum);
end;

function TUMSvcSecullum.processa: IUMServiceAppRet;
const
   SConnErroFmt = '[Erro] Erro ao tentar estabelecer conexão com o banco de dados %s: %s';
   SNoConnFmt = 'Não foi possível estabelecer conexão com o banco de dados do %s: abortando...';
begin
   Result := srSuccess;

   try
      if not FConnUnimestre.IsConectado(True, True) then
         FConnUnimestre.Conectar(Config, 'Conexao.Unimestre', False);
   except
      on E: Exception do
      begin
         Log.log(Format(SConnErroFmt, ['Unimestre', E.Message]));
         Result := srError;
      end;
   end;

   if Result = srSuccess then
   begin

      try
         if not FConnSecullum.Connected then
            FConnSecullum.Connected := True;
      except
         on E: Exception do
         begin
            Log.log(Format(SConnErroFmt, ['Secullum', E.Message]));
            Result := srError;
         end;   
      end;

      if Result = srSuccess then
      begin

         if not FConnUnimestre.IsConectado(False, True) then
         begin
            Log.log(Format(SNoConnFmt, ['Unimestre']));
            Result := srError;
         end;

         if Result = srSuccess then
         begin
         
            if not FConnSecullum.Connected then
            begin
               Log.log(Format(SNoConnFmt, ['Secullum']));
               Result := srError;
            end;
            
         end;
      end;
   end;

   if Result = srSuccess then
   begin
   
      if Config.ReadBool('Servicos.Integrar', 'Pessoa', False) then
      begin
         Log.log('Integrando pessoas...');
         if not Execute then
            Result := srError;
      end;
      
   end;
end;

procedure TUMSvcSecullum.stopProcessamento;
begin
   inherited;
end;

initialization
   RegisterClass(TUMSvcSecullum);

finalization
   UnRegisterClass(TUMSvcSecullum);

end.
