unit UDM;

interface

uses
   SysUtils, Classes, ZConnection, DB, ZAbstractRODataset, UZDataset, IniFiles,
   UUtils, Windows, UZDbcFuncs, ZDbcIntfs, StrUtils, ZAbstractDataset,
  UZStartConnection, ZSqlMonitor, uUsuario, uIUMDataModule, uMLogZeos;

type
   TPermissionLevel = (plAccess = 1, plInsert, plEdit = 4, plDelete = 8,
      plSpecial = 16);

   TDM = class(TDataModule, IUMDataModule)
      conn: TZConnection;
      qryUsuario: TUMZReadOnlyQuery;
      qryLogon: TUMZReadOnlyQuery;
      qryLogonCD_PESSOA: TIntegerField;
      qryUsuarioCD_PESSOA: TIntegerField;
      qryUsuarioNM_PESSOA: TStringField;
      qryUsuarioDS_LOGIN: TStringField;
      qryUsuarioNR_PERMISSAO: TIntegerField;
      qryUsuarioDS_CHAVE_ACAO: TStringField;
      qryUsuarioDS_CHAVE_MODULO: TStringField;
      startConn: TUMZStartConnection;
      sqlMonitor: TZSQLMonitor;
      procedure sqlMonitorLogTrace(Sender: TObject; Event: TZLoggingEvent);
      procedure startConnDefaultConnection(Sender: TObject);
      procedure DataModuleDestroy(Sender: TObject);
      procedure DataModuleCreate(Sender: TObject);
      function GetDB(): TZConnection;
   private
      FCachedParams: TStringList;
      FLoggedUnit: Integer;
      FDLLHandle: THandle;
      FDLLProc: procedure(Event: Pointer); stdcall;
      function GetLoggedUnit: Integer;
      function GetCurrYearSemester: Integer;
      function GetDateTimeFromDB: TDateTime;
      function GetLoggedUser: Integer;
      procedure SetLoggedUnit(const Value: Integer);
      function GetParamCached(const Name: string): string;
      function IsParamCached(const Name: string): Boolean;
      function RetrieveParamValue(const Name, Default: string): string;
      function IsDebugging: Boolean;
      function TryLoadDebugger: Boolean;
      procedure ClearConnection;
      procedure Connect(const HostName, Database, Protocol, UserName,
         Password: string; const Port: Integer);
      procedure LoadDataConnection;
      procedure ShowAccessDeniedWnd(const ModuleKey, ActionKey: string;
         const Level: TPermissionLevel);
      procedure StoreParam(const Name, Value: string);
   public
      UsuarioLogado : TUsuario;
      { Calculo de Média Automático, pega o parâmetro de avaliação da turma passada por parâmetro,
        e verifica se deve ser calculado a média }
      procedure CalcularMediaAutomaticamente( const nr_anosemestre: Integer;
         const cd_turma: String; const nr_etapa, cd_disciplina, cd_pessoa: Integer );

      function GetParametroAvaliacao( const nr_anosemestre: Integer;
            const cd_turma: String; const cd_disciplina: String; const campo: String; const condicao_in: Boolean = False ): String;
      function GetInformacaoDiarioTurma( const nr_anosemestre: Integer; const cd_turma: String;
            const cd_disciplina, nr_etapa: Integer; const campo: String ): String;

      procedure CriarConsulta( var DataSet: TUMZReadOnlyQuery ); overload;
      procedure CriarConsulta( var DataSet: TUMZQuery ); overload;
      procedure SetUsuarioLogado( UsuarioLogado : TUsuario );
      procedure SetLog(cd_modulo: integer; operacao: string; chave : string = ''; coligada : integer = 0; ds_observacoes: string = ''); overload;
      function DecYearSemester(const Input: Integer): Integer;
      function FindUser(const User: string): Boolean;
      function GetParamValue(const Name, Default: string): string;
      function IncYearSemester(const Input: Integer): Integer;
      function Logon(const User, Pass: string): Boolean;
      function GetUsuarioLogado: TUsuario;
      property CurrYearSemester: Integer read GetCurrYearSemester;
      property DateTimeFromDB: TDateTime read GetDateTimeFromDB;
      property LoggedUnit: Integer read GetLoggedUnit write SetLoggedUnit;
      property LoggedUser: Integer read GetLoggedUser;
   end;

var
   DM: TDM;

implementation

{$R *.dfm}

{ TDM }

procedure TDM.CalcularMediaAutomaticamente(const nr_anosemestre: Integer; const cd_turma: String;
   const nr_etapa, cd_disciplina, cd_pessoa: Integer);

   function ExecutarCalculoMedia: Boolean;
   var
      sn_calculo_media_automatico: String;
   begin
      Result := False;
      sn_calculo_media_automatico := GetParametroAvaliacao( nr_anosemestre, cd_turma,
                                                     IntToStr(cd_disciplina), 'sn_calculo_media_automatico' );

      if ( StrToIntDef( sn_calculo_media_automatico, 0 ) = 1 ) then
      begin
         Result := True;
      end;
   end;

   function CalcularNotaDisciplina(anosemestre: Integer; turma: String;
         disciplina, bimestre, pessoa: Integer; formula: String): Boolean;
   var
      qyExecutaMediaDisciplina: TUMZQuery;
   begin
      DM.CriarConsulta(qyExecutaMediaDisciplina);
      qyExecutaMediaDisciplina.SQL.Text := ' CALL DIA_CALCULO_MEDIA_DISCIPLINA( :nr_anosemestre, :cd_turma, ' +
                                           '    :cd_disciplina, :nr_etapa, :cd_pessoa, :ds_formula, NULL, :cd_pessoa_logada ) ';

      qyExecutaMediaDisciplina.ParamByName('nr_anosemestre').AsInteger := anosemestre;
      qyExecutaMediaDisciplina.ParamByName('cd_turma').AsString := turma;
      qyExecutaMediaDisciplina.ParamByName('cd_disciplina').AsInteger := disciplina;
      qyExecutaMediaDisciplina.ParamByName('nr_etapa').AsInteger := bimestre;
      qyExecutaMediaDisciplina.ParamByName('cd_pessoa').AsInteger := pessoa;
      qyExecutaMediaDisciplina.ParamByName('ds_formula').AsString := formula;
      qyExecutaMediaDisciplina.ParamByName('cd_pessoa_logada').AsInteger := LoggedUser;

      try
         try
            qyExecutaMediaDisciplina.ExecSQL();
         except
         end;
      finally
         FreeAndNil(qyExecutaMediaDisciplina);
      end;

   end;

var
   ds_formula: String;
begin
   if ExecutarCalculoMedia then
   begin
      ds_formula := GetInformacaoDiarioTurma( nr_anosemestre, cd_turma, cd_disciplina, nr_etapa, 'formula_media' );
      if Length( Trim( ds_formula ) ) = 0 then
      begin
         ds_formula := GetParametroAvaliacao( nr_anosemestre, cd_turma,
                                                     IntToStr(cd_disciplina), 'ds_formula_padrao' );

         if ( Length( Trim( ds_formula ) ) = 0 ) then
         begin
            ds_formula := 'ARITMETICA';
         end;                                   
      end;

      CalcularNotaDisciplina( nr_anosemestre, cd_turma, cd_disciplina, nr_etapa, cd_pessoa, ds_formula );
   end;   
end;

procedure TDM.ClearConnection;
begin
   if conn.Connected then conn.Disconnect;
   conn.HostName := EmptyStr;
   conn.Database := EmptyStr;
   conn.Protocol := EmptyStr;
   conn.User := EmptyStr;
   conn.Password := EmptyStr;
   conn.Port := 0;
end;

procedure TDM.Connect(const HostName, Database, Protocol, UserName,
  Password: string; const Port: Integer);
begin
   if conn.Connected then conn.Disconnect;
   conn.HostName := HostName;
   conn.Database := Database;
   conn.Protocol := Protocol;
   conn.User := UserName;
   conn.Password := Password;
   conn.Port := Port;
   try
      conn.Connect;
   except
      on E: EZDatabaseError do raise;
   end;
end;

procedure TDM.CriarConsulta(var DataSet: TUMZReadOnlyQuery);
begin
   DataSet := TUMZReadOnlyQuery.Create(Self);
   DataSet.Connection := conn;
end;

procedure TDM.CriarConsulta(var DataSet: TUMZQuery);
begin
   DataSet := TUMZQuery.Create(Self);
   DataSet.Connection := conn;
   DataSet.UpdateMode := umUpdateChanged;
end;

procedure TDM.DataModuleCreate(Sender: TObject);
begin
   sqlMonitor.Active := IsDebugging and TryLoadDebugger;
   ClearConnection;
   try
      LoadDataConnection;
      if conn.Connected then FCachedParams := TStringList.Create;
   except
      on E: Exception do raise;
   end;
end;

procedure TDM.DataModuleDestroy(Sender: TObject);
begin
   FCachedParams.Free;
   conn.Disconnect;
   @FDLLProc := nil;
   FreeLibrary(FDLLHandle);
end;

function TDM.DecYearSemester(const Input: Integer): Integer;
var
   S: string;
   Year, Semester: Integer;
begin
   S := Format('%d', [Input]);
   Result := Input;
   
   if TryStrToInt(LeftStr(S, Length(S) - 1), Year) then
      if TryStrToInt(RightStr(S, 1), Semester) then
      begin
         if GetParamValue('ano_semestre_incremento', '1') = '2' then
         begin
            Dec(Year);
            Semester := 1;
         end
         else if Semester = 2 then
            Semester := 1
         else
         begin
            Semester := 2;
            Dec(Year);
         end;

         if not TryStrToInt(Format('%d%d', [Year, Semester]), Result) then
            Result := Input;
      end;
end;

function TDM.FindUser(const User: string): Boolean;
begin
   if qryUsuario.Active then qryUsuario.Close;
   qryUsuario.ParamByName('DS_LOGIN').AsString := User;
   qryUsuario.Open;
   Result := not qryUsuario.IsEmpty;
end;

function TDM.GetCurrYearSemester: Integer;
const
   SSQLSelectYearSemester = 'SELECT FCD_GET_ANOSEMESTRE_CORRENTE(?) FROM DUAL';
var
   Statement: IZPreparedStatement;
   ResultSet: IZResultSet;
begin
   Statement := PrepareStatement(SSQLSelectYearSemester);
   try
      Statement.SetInt(1, LoggedUnit);
      ResultSet := Statement.ExecuteQueryPrepared;
      try
         if ResultSet.Next then Result := ResultSet.GetInt(1);
      finally
         ResultSet.Close;
      end;
   finally
      Statement.Close;
   end;
end;

function TDM.GetDateTimeFromDB: TDateTime;
const
   SSQLCurdate = 'SELECT NOW() FROM DUAL';
var
   ResultSet: IZResultSet;
begin
   ResultSet := ExecuteQuery(SSQLCurdate);
   try
      if ResultSet.Next then
         Result := ResultSet.GetDate(1)
      else
         Result := Now;
   finally
      ResultSet.Close;
   end;
end;

function TDM.GetDB: TZConnection;
begin
   Result := Self.conn;
end;

function TDM.GetInformacaoDiarioTurma(const nr_anosemestre: Integer; const cd_turma: String;
  const cd_disciplina, nr_etapa: Integer; const campo: String): String;
const
   SQL_GET_INFORMACAO_DIARIO_TURMA =
      ' SELECT %s AS valor FROM diario_turmas ' +
      ' WHERE turma = :cd_turma AND anosemestre = :nr_anosemestre AND ' +
      '       disciplina = :cd_disciplina AND bimestre = :nr_etapa ';
var
   qyGetInformacaoDiarioturma: TUMZReadOnlyQuery;
begin
   DM.CriarConsulta(qyGetInformacaoDiarioturma);
   qyGetInformacaoDiarioturma.SQL.Text := Format( SQL_GET_INFORMACAO_DIARIO_TURMA, [ campo ] );

   qyGetInformacaoDiarioturma.ParamByName('cd_turma').AsString          := cd_turma;
   qyGetInformacaoDiarioturma.ParamByName('nr_anosemestre').AsInteger   := nr_anosemestre;
   qyGetInformacaoDiarioturma.ParamByName('cd_disciplina').AsInteger    := cd_disciplina;
   qyGetInformacaoDiarioturma.ParamByName('nr_etapa').AsInteger         := nr_etapa;

   Result := EmptyStr;

   try
      try
         qyGetInformacaoDiarioturma.Open();

         Result := qyGetInformacaoDiarioturma.FieldByName('valor').AsString;
      except
      end;
   finally
      FreeAndNil(qyGetInformacaoDiarioturma);
   end;
end;

function TDM.GetLoggedUnit: Integer;
begin
   Result := FLoggedUnit;
end;

function TDM.GetLoggedUser: Integer;
begin
   Result := DM.qryUsuarioCD_PESSOA.AsInteger;
end;

function TDM.GetParamCached(const Name: string): string;
begin
   Result := FCachedParams.Values[Name];
end;

function TDM.GetParametroAvaliacao(const nr_anosemestre: Integer; const cd_turma, cd_disciplina,
  campo: String; const condicao_in: Boolean): String;
const
   SQL_GET_PARAMETRO_AVALIACAO =
      ' SELECT DISTINCT ap.[campo] AS valor ' +
      ' FROM turmas t ' +
      ' 	    INNER JOIN grades_disciplinas gd ON ( ' +
		'         gd.cd_curso = t.curso ' +
		'         AND gd.nr_serie = t.serie ' +
		'         AND gd.cd_grade = t.cd_grade ' +
      '      ) '+
      '      INNER JOIN avaliacoes_parametros ap ON ( ap.cd_avaliacao = COALESCE( gd.cd_avaliacao, t.cd_avaliacao	) ) ' +
      ' WHERE t.anosemestre = :NR_ANOSEMESTRE ';
var
   qyGetParametroAvaliacao: TUMZQuery;
   separador : string;
begin
   DM.CriarConsulta(qyGetParametroAvaliacao);

   qyGetParametroAvaliacao.SQL.Text := StringReplace( SQL_GET_PARAMETRO_AVALIACAO, '[campo]', campo, [rfIgnoreCase] );

   if ( condicao_in ) then
      qyGetParametroAvaliacao.SQL.Add( ' AND t.codigo IN ( ' + cd_turma + ' ) ' )
   else begin
      qyGetParametroAvaliacao.SQL.Add( ' AND t.codigo = :CD_TURMA ' );
      qyGetParametroAvaliacao.ParamByName('CD_TURMA').AsString := cd_turma;
   end;

   if cd_disciplina <> '' then begin
      qyGetParametroAvaliacao.SQL.Add( ' AND gd.cd_disciplina = :CD_DISCIPLINA ' );
      qyGetParametroAvaliacao.ParamByName('CD_DISCIPLINA').AsString := cd_disciplina;
   end;

   qyGetParametroAvaliacao.ParamByName('NR_ANOSEMESTRE').AsInteger := nr_anosemestre;

   qyGetParametroAvaliacao.Open;

   separador := '';
   while not qyGetParametroAvaliacao.EOF do
   begin
      Result := Result + separador + qyGetParametroAvaliacao.FieldByName('valor').AsString;
      separador := ',';
      qyGetParametroAvaliacao.Next;
   end;

   FreeAndNil(qyGetParametroAvaliacao);
end;

function TDM.GetParamValue(const Name, Default: string): string;
begin
   if IsParamCached(Name) then Result := GetParamCached(Name)
   else
   begin
      Result := RetrieveParamValue(Name, Default);
      StoreParam(Name, Result);
   end;
end;

function TDM.GetUsuarioLogado: TUsuario;
begin
   Result := Self.UsuarioLogado;
end;

function TDM.IncYearSemester(const Input: Integer): Integer;
var
   S: string;
   Year, Semester: Integer;
begin
   S := Format('%d', [Input]);
   Result := Input;
   
   if TryStrToInt(LeftStr(S, Length(S) - 1), Year) then
      if TryStrToInt(RightStr(S, 1), Semester) then
      begin
         if GetParamValue('ano_semestre_incremento', '1') = '2' then
         begin
            Inc(Year);
            Semester := 1;
         end
         else if Semester = 1 then
            Semester := 2
         else
         begin
            Semester := 1;
            Inc(Year);
         end;

         if not TryStrToInt(Format('%d%d', [Year, Semester]), Result) then
            Result := Input;
      end;
end;

function TDM.IsDebugging: Boolean;
var
   I: Integer;
begin
   Result := False;
   for I := 1 to ParamCount do
      if AnsiUpperCase(ParamStr(I)) = 'DEBUG' then
      begin
         Result := True;
         Break;
      end;
end;

function TDM.IsParamCached(const Name: string): Boolean;
begin
   Result := FCachedParams.IndexOfName(Name) <> -1;
end;

procedure TDM.LoadDataConnection;
var
   IniPath: TFileName;
   ConnIni: TIniFile;
begin
   IniPath := ExtractFilePath(ParamStr(0)) + 'unimestre.ini';
   ConnIni := TIniFile.Create(IniPath);
   try
      try
         startConn.IniPath := IniPath;
         startConn.Active := ConnIni.ReadBool('Conexao', 'Usa.Start', False);

         if startConn.Active then
         begin
            startConn.UnimestreUser := 'umsistema';
         end;

         startConn.ConnectUnimestre;
      except
         on E: EUMZDatabaseError do raise;
      end;
   finally
      ConnIni.Free;
   end;
end;

function TDM.Logon(const User, Pass: string): Boolean;
begin
   qryLogon.Close;
   qryLogon.ParamByName('DS_LOGIN').AsString := User;
   qryLogon.ParamByName('DS_SENHA').AsString := Pass;
   qryLogon.Open;
   Result := not qryLogon.IsEmpty;
   qryLogon.Close;
end;

function TDM.RetrieveParamValue(const Name, Default: string): string;
const
   SSQLSearchParam = 'SELECT DS_VALOR FROM PARAMETROS WHERE UPPER(DS_VARIAVEL) = ?';
var
   Statement: IZPreparedStatement;
   ResultSet: IZResultSet;
begin
   Statement := PrepareStatement(SSQLSearchParam);
   try
      Statement.SetString(1, AnsiUpperCase(Name));
      ResultSet := Statement.ExecuteQueryPrepared;
      try
         if ResultSet.Next then Result := Trim(ResultSet.GetString(1))
         else Result := '';
         if Result = '' then Result := Default;
      finally
         ResultSet.Close;
      end;
   finally
      Statement.Close;
   end;
end;

procedure TDM.SetLog(cd_modulo: integer; operacao, chave: string;
  coligada: integer; ds_observacoes: string);
var
   ALogBDE: TLogBDE;
   DB : TZConnection;
begin
   DB := Self.GetDB();
   ALogBDE := TLogBDE.getLogger(DB);
   ALogBDE.setLog(Self.UsuarioLogado.Pessoa.Codigo, cd_modulo, operacao, chave, coligada, ds_observacoes);
end;

procedure TDM.SetLoggedUnit(const Value: Integer);
begin
   FLoggedUnit := Value;
end;

procedure TDM.SetUsuarioLogado(UsuarioLogado: TUsuario);
begin
   Self.UsuarioLogado := UsuarioLogado;
end;

procedure TDM.ShowAccessDeniedWnd(const ModuleKey, ActionKey: string;
  const Level: TPermissionLevel);
const
   SCaption = 'Acesso negado';
   
   SAccessDeniedMsg =
      'Acesso negado.'#13#13'Módulo: %s'#13'Ação: %s'#13'Permissão: %s';

   SSQLSearchAction =
      'SELECT M.DS_NOME_MODULO, A.DS_NOME_ACAO FROM NU_MODULOS M JOIN ' +
      'NU_MODULOS_ACOES A ON (M.CD_MODULO = A.CD_MODULO) WHERE M.DS_CHAVE = ?' +
      ' AND A.DS_CHAVE = ?';
var
   Statement: IZPreparedStatement;
   ResultSet: IZResultSet;
   ModuleName, ActionName, PermissionName, Msg: string;
begin
   Statement := PrepareStatement(SSQLSearchAction);
   try
      Statement.SetString(1, ModuleKey);
      Statement.SetString(2, ActionKey);
      ResultSet := Statement.ExecuteQueryPrepared;
      try
         if ResultSet.Next then
         begin
            ModuleName := ResultSet.GetString(1);
            ActionName := ResultSet.GetString(2);
         end;
      finally
         ResultSet.Close;
      end;
   finally
      Statement.Close;
   end;

   case Level of
      plAccess:
         PermissionName := 'Acesso';
      plInsert:
         PermissionName := 'Inclusão';
      plEdit:
         PermissionName := 'Alteração';
      plDelete:
         PermissionName := 'Exclusão';
      plSpecial:
         PermissionName := 'Especial';
   end;

   Msg := Format(SAccessDeniedMsg, [ModuleName, ActionName, PermissionName]);
   MessageBox(GetForegroundWindow, PChar(Msg), PChar(SCaption), MB_ICONERROR or MB_OK);
end;

procedure TDM.sqlMonitorLogTrace(Sender: TObject; Event: TZLoggingEvent);
begin
   FDllProc(Pointer(Event));
end;

procedure TDM.startConnDefaultConnection(Sender: TObject);
const
   SErrorConfigFileNotFound = 'Não é possível estabelecer conexão com o banco de dados do Unimestre.'#13'O arquivo de configuração não foi encontrado.';
var
   IniPath: TFileName;
   ConnIni: TIniFile;
   Port: Integer;
   HostName, Database, Protocol, UserName, Password: string;
begin
   IniPath := ExtractFilePath(ParamStr(0)) + 'unimestre.ini';
   
   if FileExists(IniPath) then
   begin
      ConnIni := TIniFile.Create(IniPath);
      try
         HostName := ConnIni.ReadString('Conexao', 'Servidor', 'localhost');
         Database := ConnIni.ReadString('Conexao', 'Banco', 'unimestre');
         Protocol := ConnIni.ReadString('Conexao', 'Protocolo', 'mysql-5');
         UserName := ConnIni.ReadString('Conexao', 'Usuario', 'academico');
         Password := Decrypt(ConnIni.ReadString('Conexao', 'Senha', '46C2649CA5399F5F9D31B26196D076BF6F'));
         Port := ConnIni.ReadInteger('Conexao', 'Porta', 3306);
         try
            Connect(HostName, Database, Protocol, UserName, Password, Port);
         except
            on E: EZDatabaseError do raise;
         end;
      finally
         ConnIni.Free;
      end;
   end
   else
      raise Exception.Create(SErrorConfigFileNotFound);
end;

procedure TDM.StoreParam(const Name, Value: string);
begin
   FCachedParams.Values[AnsiUpperCase(Name)] := Value;
end;

function TDM.TryLoadDebugger: Boolean;
begin
   if FileExists('umSQLdebugger.dll') then
   begin
 
      FDLLHandle := LoadLibrary(PChar('umSQLdebugger.dll'));
 
      if FDLLHandle > 0 then
      begin
 
         @FDLLProc := GetProcAddress(FDLLHandle, PChar('LogEvent'));
         Result := Assigned(@FDLLProc);
      end
      else
         Result := False;
   end
   else
      Result := False;
end;

end.
