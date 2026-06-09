unit UDM;

interface

uses
   SysUtils, Classes, Forms, ZConnection, ZAbstractRODataset, IniFiles, Windows,
   ZDbcIntfs, UFunctions, UZStartConnection, Dialogs;

type
   TDM = class(TDataModule)
      connUnimestre: TZConnection;
      startConn: TUMZStartConnection;
      connMySQL: TZConnection;
      startConnMy: TUMZStartConnection;
      procedure startConnDefaultConnection(Sender: TObject);
      procedure DataModuleDestroy(Sender: TObject);
      procedure DataModuleCreate(Sender: TObject);
   private
      FClientKey: string;
      FConfig: TIniFile;
      FConfirmConn: Boolean;
      FNotifyErrors: Boolean;
      FChangePwdStmt: IZPreparedStatement;
      FPwdResultSet: IZResultSet;
      function GetNowFromDatabase: TDateTime;
      function GetDatabaseAddress: string;
      function GetClientName: string;

      ///   <summary>Tenta estabelecer conexão com o banco de dados utilizando
      ///   as informações recebidas para realizar autenticação.</summary>
      ///
      ///   <param name="User">Nome do usuário para autenticação no sistema do
      ///   banco de dados</param>
      ///   <param name="Pass">Senha do usuário para autenticação no sistema do
      ///   banco de dados</param>
      ///   <param name="Database">Nome do banco de dados ou esquema no qual
      ///   deseja conectar-se</param>
      ///   <param name="Protocol">Protocolo que será utilizado para estabelecer
      ///   a conexão com o banco de dados</param>
      ///   <param name="Server">Endereço ou nome do servidor do banco de dados
      ///   </param>
      ///   <param name="Port">Porta para comunicação com o banco de dados
      ///   </param>
      ///
      ///   <returns>Retorna o valor lógio <c>True</c> indicando que a conexão
      ///   foi estabelecida com sucesso ou <c>False</c> caso contrário
      ///   </returns>
      function Connect(const User, Pass, Database, Protocol, Server: string;
            const Port: Integer): Boolean;

      function IsConfirmConn: Boolean;
      function IsNotifyErrors: Boolean;
      function GetDefaultDirectory: string;
      procedure RetrieveClientKey;
      procedure SetConfirmConn(const Value: Boolean);
      procedure SetNotifyErrors(const Value: Boolean);
   public
      function CanChangePassword: Boolean;
      function GetNativeConnection: IZConnection;
      function CreateStatement: IZStatement;
      function PrepareStatement(const SQL: string): IZPreparedStatement;
      function ExecuteQuery(const SQL: string): IZResultSet;
      function ChangePassword(const User, Pass, Key, ClientKey: string): Boolean;
      property ClientName: string read GetClientName;
      property ConfirmConn: Boolean read IsConfirmConn write SetConfirmConn;
      property DatabaseAddress: string read GetDatabaseAddress;
      property DefaultDirectory: string read GetDefaultDirectory;
      property NotifyErrors: Boolean read IsNotifyErrors write SetNotifyErrors;
      property NowFromDatabase: TDateTime read GetNowFromDatabase;
   end;

var
   DM: TDM;

implementation

uses
   UFLogin, UDMNotify;

{$R *.dfm}

{ TDM }

function TDM.CanChangePassword: Boolean;
begin
   Result := connMySQL.Connected;
end;

function TDM.ChangePassword(const User, Pass, Key, ClientKey: string): Boolean;
const
   SSQLChangePassNewVersions = 'UPDATE mysql.`user` SET `authentication_string` = PASSWORD(?) WHERE `User` = ?';
var
   Found, TryNewVersionSGBD: Boolean;
   DecryptedPass: string;
begin
   Found := False;
   Result := False;
   FPwdResultSet.BeforeFirst;

   // Percorre todos os usuários encontrados na tabela `CONEXOES` da base de
   // dados `umstart` para encontrar o usuário correspondente àquele que deseja-
   // se realizar a troca de senha
   
   while FPwdResultSet.Next do
   begin

      // Verifica se a chave do cliente e nome do usuário são compatíveis
      
      if (FPwdResultSet.GetStringByName('DS_CHAVE_CLIENTE') = ClientKey) and
         ((FPwdResultSet.GetStringByName('NM_USUARIO') = User) or
          (FPwdResultSet.GetStringByName('DS_LOGIN') = User)) then
      begin
         TryNewVersionSGBD := False;
         Found := True;
         DecryptedPass := Decrypt(Pass, Key);
         FChangePwdStmt.SetString(1, DecryptedPass);
         FChangePwdStmt.SetString(2, User);
         try
            // Realiza a troca da senha do usuário
            FChangePwdStmt.ExecutePrepared;

            // Atualiza as informações de troca de senha na tabela `CONEXOES`
            // do banco de dados `umstart`

            FPwdResultSet.UpdateStringByName('DS_SENHA', Pass);
            FPwdResultSet.UpdateStringByName('DS_CHAVE', Key);
            FPwdResultSet.UpdateStringByName('NR_MAC_ADDRESS', GetMacAddress(#42)); // *
            FPwdResultSet.UpdateTimestampByName('DT_ALTERACAO', NowFromDatabase);
            FPwdResultSet.UpdateIntByName('SN_AUTOMATICO', 1);
            try
               FPwdResultSet.UpdateRow;
            except

               // Em caso de erro na tentativa de atualizar as informações de
               // troca de senha na tabela `CONEXOES` da base `umstart`, então
               // escreve na notificação o erro

               on E: Exception do
               begin
                  ShowMessage('Atenção: Não foi possível atualizar as informações de segurança do sistema.'+#13#13+E.Message);
                  Result := False;
                  DMNotify.AppendChangePassFail(User, '&nbsp;', E.Message);
               end;
            end;

         except

            // Em caso de erro na tentativa de trocar a senha do usuário na
            // tabela `user` do banco de dados `mysql`, então escreve no email
            // de notificação o erro ocorrido neste processo

            on E: Exception do
            begin
               TryNewVersionSGBD := true;
            end;
         end;

         if TryNewVersionSGBD then
         begin

           FChangePwdStmt := startConnMy.Connection.DbcConnection.PrepareStatement(
                  SSQLChangePassNewVersions);

           FChangePwdStmt.SetString(1, DecryptedPass);
           FChangePwdStmt.SetString(2, User);

           // Realiza a troca da senha do usuário
           FChangePwdStmt.ExecutePrepared;

           // Atualiza as informações de troca de senha na tabela `CONEXOES`
           // do banco de dados `umstart`

           FPwdResultSet.UpdateStringByName('DS_SENHA', Pass);
           FPwdResultSet.UpdateStringByName('DS_CHAVE', Key);
           FPwdResultSet.UpdateStringByName('NR_MAC_ADDRESS', GetMacAddress(#42)); // *
           FPwdResultSet.UpdateTimestampByName('DT_ALTERACAO', NowFromDatabase);
           FPwdResultSet.UpdateIntByName('SN_AUTOMATICO', 1);
           try
              FPwdResultSet.UpdateRow;
           except

              // Em caso de erro na tentativa de atualizar as informações de
              // troca de senha na tabela `CONEXOES` da base `umstart`, então
              // escreve na notificação o erro
              on E: Exception do
              begin
                 ShowMessage('Atenção: Não foi possível atualizar as informações de segurança do sistema.'+#13#13+E.Message);
                 Result := False;
                 DMNotify.AppendChangePassFail(User, '&nbsp;', E.Message);
              end;
           end;
         end;

         Break;
      end;
   end;

   // Se não encontrou na tabela `CONEXAO` o usuário para o qual deseja realizar
   // a troca da senha, então inclui o usuário na tabela `CONEXAO` e executa
   // novamente a troca de senha
   
   if (not Found) and (ClientKey = FClientKey) then
   begin
      FPwdResultSet.MoveToInsertRow;
      FPwdResultSet.UpdateStringByName('NM_USUARIO', User);
      FPwdResultSet.UpdateStringByName('DS_SENHA', Pass);
      FPwdResultSet.UpdateStringByName('DS_CHAVE', Key);
      FPwdResultSet.UpdateStringByName('DS_CHAVE_CLIENTE', ClientKey);
      FPwdResultSet.UpdateStringByName('NR_MAC_ADDRESS', GetMacAddress(#42)); // *
      FPwdResultSet.UpdateTimestampByName('DT_ALTERACAO', NowFromDatabase);
      FPwdResultSet.UpdateIntByName('SN_AUTOMATICO', 1);
      try
         FPwdResultSet.InsertRow;
         ChangePassword(User, Pass, Key, ClientKey);
      except
         on E: Exception do
         begin
            ShowMessage('Atenção: Não foi possível atualizar as informações de segurança do sistema.'+#13#13+E.Message);
            Result := False;
            DMNotify.AppendChangePassFail(User, '&nbsp;', E.Message);
         end;
      end;
   end;
end;

function TDM.Connect(const User, Pass, Database, Protocol, Server: string;
  const Port: Integer): Boolean;
begin
   Result := False;
   if connUnimestre.Connected then connUnimestre.Disconnect;
   connUnimestre.User := User;
   connUnimestre.Password := Pass;
   connUnimestre.Database := Database;
   connUnimestre.Protocol := Protocol;
   connUnimestre.HostName := Server;
   connUnimestre.Port := Port;
   try
      connUnimestre.Connect;
      Result := connUnimestre.Connected;
   except
      on E: EZDatabaseError do raise;
   end;
end;

function TDM.CreateStatement: IZStatement;
begin
   Result := GetNativeConnection.CreateStatement;
end;

procedure TDM.DataModuleCreate(Sender: TObject);
const
   SSQLSelectPwds = 'SELECT NM_USUARIO, DS_SENHA, DS_CHAVE, DS_CHAVE_CLIENTE, DT_ALTERACAO, DS_LOGIN, SN_AUTOMATICO, NR_MAC_ADDRESS FROM CONEXOES';
   SSQLChangePassOldVersions = 'UPDATE mysql.`user` SET `Password` = PASSWORD(?) WHERE `User` = ?';

   SMsgSemConexaoMySQL = 'Favor verificar se o usuário atualizacao está com permissão para o banco de dados mysql,'+
      ' as atualizas de segurança do banco de dados NÃO serão aplicadas.'+#13#13+
      'As atualizações do unimestre serão executadas normalmente!';
   SWarnCaption = 'Atenção';
   SErrorCaption = 'Erro';
   SMsgWithOutIni = 'O arquivo de configuração [unimestre.ini] não foi localizado.'#13'Não é possível continuar. ';
   SMsgWithOutConn = 'Não foi possível estabelecer conexão com o banco de dados.';
   SMsgConnError = 'Ocorreu um erro na tentativa de estabelecer conexão com o banco de dados:'#13'%s'#13#13'Verifique as informações do arquivo [unimestre.ini].';
var
   Stmt: IZStatement;
   IniPath: TFileName;
begin
   IniPath := ExtractFilePath(ParamStr(0)) + 'unimestre.ini';
   
   if FileExists(IniPath) then
   begin
      FConfig := TIniFile.Create(IniPath);
      ConfirmConn := FConfig.ReadBool('Atualiza', 'Confirma.Conexao', False);
      NotifyErrors := FConfig.ReadBool('Atualiza', 'Notifica.Erros', True);

      try
         startConn.IniPath := IniPath;
         startConn.Active := FConfig.ReadBool('Conexao', 'Usa.Start', False);
         startConn.ConnectUnimestre;

         try
            startConnMy.IniPath := IniPath;
            startConnMy.ConnectUnimestre;

            if CanChangePassword then
            begin
               FChangePwdStmt := startConnMy.Connection.DbcConnection.PrepareStatement(
                  SSQLChangePassOldVersions);
            end;
         except
            on E: Exception do
            begin
               //
            end;
         end;

         if startConn.Active then
         begin
            RetrieveClientKey;
            Stmt := startConn.DbcConnection.CreateStatement;
            Stmt.SetResultSetConcurrency(rcUpdatable);
            FPwdResultSet := Stmt.ExecuteQuery(SSQLSelectPwds);
         end;
         
      except
         on E: Exception do
            Application.MessageBox(PChar(Format(SMsgConnError, [E.Message])),
               SErrorCaption, MB_ICONERROR or MB_OK);
      end;
   end
   else
      Application.MessageBox(SMsgWithOutIni, SWarnCaption,
         MB_ICONWARNING or MB_OK);
end;

procedure TDM.DataModuleDestroy(Sender: TObject);
begin
   FConfig.Free;
   if connUnimestre.Connected then connUnimestre.Disconnect;
   if connMySQL.Connected then connMySQL.Disconnect;

   if startConn.Connected then
   begin
      startConn.Disconnect;
      try
         FChangePwdStmt.Close;
      except
         on E: Exception do;
      end;
      FPwdResultSet.Close;
   end;
end;

function TDM.ExecuteQuery(const SQL: string): IZResultSet;
begin
   Result := CreateStatement.ExecuteQuery(SQL);
end;

function TDM.GetClientName: string;
var
   ResultSet: IZResultSet;
begin
   ResultSet := ExecuteQuery('SELECT DS_VALOR FROM PARAMETROS WHERE DS_VARIAVEL = ''cliente_nome_fantasia''');
   try
      if ResultSet.Next then
         Result := ResultSet.GetString(1)
      else
         Result := '';
   finally
      ResultSet.Close;
   end;
end;

function TDM.GetDatabaseAddress: string;
begin
   Result := Format('%s:%d/%s', [connUnimestre.HostName, connUnimestre.Port,
      connUnimestre.Database]);
end;

function TDM.GetDefaultDirectory: string;
begin
   Result := FConfig.ReadString('Atualiza', 'DirPadrao', #46#47);
   Result := StringReplace(Result, #46#47, ExtractFilePath(ParamStr(0)), []);
end;

function TDM.GetNativeConnection: IZConnection;
begin
   Result := connUnimestre.DbcConnection;
end;

function TDM.GetNowFromDatabase: TDateTime;
var
   ResultSet: IZResultSet;
begin
   ResultSet := ExecuteQuery('SELECT NOW() FROM DUAL');
   try
      if ResultSet.Next then
         Result := ResultSet.GetTimestamp(1)
      else
         Result := Now;
   finally
      ResultSet.Close;
   end;
end;

function TDM.IsConfirmConn: Boolean;
begin
   Result := FConfirmConn;
end;

function TDM.IsNotifyErrors: Boolean;
begin
   Result := FNotifyErrors;
end;

function TDM.PrepareStatement(const SQL: string): IZPreparedStatement;
begin
   Result := GetNativeConnection.PrepareStatement(SQL);
end;

procedure TDM.RetrieveClientKey;
const
   SSQLSelectClientKey = 'SELECT DISTINCT DS_CHAVE_CLIENTE FROM CONEXOES';
var
   Rs: IZResultSet;
begin
   Rs := startConn.DbcConnection.CreateStatement.ExecuteQuery(SSQLSelectClientKey);
   try
      if Rs.Next then
         FClientKey := Rs.GetString(1)
      else
         FClientKey := '';
   finally
      Rs.Close;
   end;
end;

procedure TDM.SetConfirmConn(const Value: Boolean);
begin
   FConfirmConn := Value;
end;

procedure TDM.SetNotifyErrors(const Value: Boolean);
begin
   FNotifyErrors := Value;
end;

procedure TDM.startConnDefaultConnection(Sender: TObject);
const
   SWarnCaption = 'Atenção';
   SErrorCaption = 'Erro';
   SMsgWithOutConn = 'Não foi possível estabelecer conexão com o banco de dados.';
   SMsgErrorConn = 'Ocorreu um erro na tentativa de estabelecer conexão com o banco de dados:'#13'%s'#13#13'Verifique as informações do arquivo [unimestre.ini].';
var
   User, Pass, Database, Protocol, Server, S: string;
   Port: Integer;
begin
   Database := FConfig.ReadString('Conexao', 'Banco', 'unimestre');
   Protocol := FConfig.ReadString('Conexao', 'Protocolo', 'mysql-5');
   Server := FConfig.ReadString('Conexao', 'Servidor', 'localhost');
   User := FConfig.ReadString('Atualiza', 'Usuario', '');
   Pass := FConfig.ReadString('Atualiza', 'Senha', '');
   Pass := Decrypt(Pass);
   Port := FConfig.ReadInteger('Conexao', 'Porta', 3306);
   
   try
      if not Connect(User, Pass, Database, Protocol, Server, Port) then
         Application.MessageBox(SMsgWithOutConn, SWarnCaption, MB_ICONWARNING or MB_OK)
   except
      on E: EZDatabaseError do
      begin
         S := Format(SMsgErrorConn, [E.Message]);
         Application.MessageBox(PChar(S), SErrorCaption, MB_ICONERROR or MB_OK);
      end;
   end;
end;

end.
