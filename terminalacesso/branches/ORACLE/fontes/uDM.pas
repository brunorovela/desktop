{
#TIT= Módulo de Dados
#OBJ= Reunir todas as tabelas principais e funções/procedures que envolvam acesso a dados
#AUT= Jonathan
#DAT= 18/08/2004
#MOD= ...
#DES=
}
unit uDM;

interface

uses
  Windows, Forms, Db, ZConnection, Classes, Sysutils, Controls,
  General, ZAbstractRODataset, ZAbstractDataset, ZDataset, UZDataset,
  Dialogs, Menus, DBCtrls, StdCtrls,
  DBTables, ZAbstractTable, IniFiles, UZStartConnection, ZSqlMonitor,
  uIUMDataModule, ImgList, uSimpleCache, uGeneral;

const
   DB_PROTOCOLO_MYSQL = 'mysql-5';
   DB_PROTOCOLO_ORACLE = 'oracle';

type
   TDataModule = class(AUMDataModule)
   end;

  TDM = class(TDataModule)
    qyUsuariosNome: TUMZQuery;
    tbModulos: TZTable;
    tbModulosCodigo: TSmallintField;
    qyUsuarios: TUMZQuery;
    qyUsuariosCodigo: TIntegerField;
    qyUsuariosNome2: TStringField;
    qyUsuariosSenha: TStringField;
    qyUsuariosOnLine: TStringField;
    qyAux: TUMZQuery;
    qyMax: TUMZQuery;
    qyFeriados: TUMZQuery;
    qyFeriadosDataFeriado: TDateTimeField;
    qyFeriadosFeriado: TStringField;
    qyLogs: TUMZQuery;
    qyLogsAcessos: TUMZQuery;
    qyLogscd_modulo: TIntegerField;
    qyLogscd_usuario: TIntegerField;
    qyLogscd_titulo: TIntegerField;
    qyLogscd_caixa: TIntegerField;
    qyLogsdt_movimento: TDateTimeField;
    qyLogsnr_sequencia: TIntegerField;
    qyLogsAcessoscd_modulo: TIntegerField;
    qyLogsAcessoscd_usuario: TIntegerField;
    qyLogsAcessossn_acessou: TStringField;
    qyLogsAcessossn_incluiu: TStringField;
    qyLogsAcessossn_alterou: TStringField;
    qyLogsAcessossn_excluiu: TStringField;
    qyLogsAcessosdt_log: TDateTimeField;
    qyLogsAcessoshr_log: TTimeField;
    qyLogsdt_log: TDateTimeField;
    qyLogshr_log: TTimeField;
    qyTerminal1: TUMZQuery;
    qyTerminal: TUMZQuery;
    qyTerminal2: TUMZQuery;
    qyRecalculoFreq: TUMZQuery;
    qyAux2: TUMZQuery;
    db: TZConnection;
    qyVerEnvioOc: TUMZQuery;
    qyUsuariosNomeCODIGO: TLargeintField;
    qyUsuariosNomeSN_ONLINE: TStringField;
    qyUsuariosNomeONLINE: TStringField;
    qyUsuariosNomeNOME: TStringField;
    qyUsuariosNomeSENHA: TStringField;
    qyUsuariosNomeCD_PESSOA: TIntegerField;
    qyPermissoes: TUMZQuery;
    qyPermissoesCD_GRUPO: TIntegerField;
    qyPermissoesDS_NOME_GRUPO: TStringField;
    qyPermissoesCD_COLIGADA: TIntegerField;
    qyPermissoesDS_LOGIN: TStringField;
    qyPermissoesDS_SENHA: TStringField;
    qyPermissoesCD_PESSOA: TIntegerField;
    qyPermissoesNR_PERMISSAO: TIntegerField;
    qyPermissoesDS_CHAVE_ACAO: TStringField;
    qyPermissoesDS_NOME_ACAO: TStringField;
    qyPermissoesDS_NOME_MODULO: TStringField;
    qyPermissoesDS_CHAVE_MODULO: TStringField;
    qryPermissoes: TUMZReadOnlyQuery;
    qryPermissoesCD_GRUPO: TIntegerField;
    qryPermissoesDS_NOME_GRUPO: TStringField;
    qryPermissoesCD_COLIGADA: TIntegerField;
    qryPermissoesDS_LOGIN: TStringField;
    qryPermissoesDS_SENHA: TStringField;
    qryPermissoesCD_PESSOA: TIntegerField;
    qryPermissoesNR_PERMISSAO: TIntegerField;
    qryPermissoesDS_NOME_ACAO: TStringField;
    qryPermissoesDS_NOME_MODULO: TStringField;
    qryPermissoesDS_CHAVE_ACAO: TStringField;
    qryPermissoesDS_CHAVE_MODULO: TStringField;
    qryNow: TUMZReadOnlyQuery;
    qryNowNOW: TDateTimeField;
    startConn: TUMZStartConnection;
    sqlMonitor: TZSQLMonitor;
    ImageListCadastro: TImageList;
    procedure sqlMonitorLogTrace(Sender: TObject; Event: TZLoggingEvent);
    procedure startConnDefaultConnection(Sender: TObject);
    procedure DataModuleDestroy(Sender: TObject);
    procedure DataModuleCreate(Sender: TObject);
    procedure qyLogsAfterInsert(DataSet: TDataSet);
    procedure qyLogsAcessosAfterInsert(DataSet: TDataSet);
  private
    { Private declarations }
      FColigadaSelecionada: Integer;
      FListaColigadas : TStringList;
      FDLLHandle: THandle;
      FDLLProc: procedure(Event: Pointer); stdcall;
      function IsDebugging: Boolean;
      function TryLoadDebugger: Boolean;
  public
    { Public declarations }

    flg: boolean;
    iCdPessoaLogado: Integer;

    Parametros : TSimpleCache;

    // CriarConsulta
    procedure CriarConsulta( var DataSet: TUMZQuery ); overload;
    procedure CriarConsulta( var DataSet: TUMZReadOnlyQuery ); overload;
    // Função para descobrir o valor do parâmetro tabelado
    function variavel_parametro(variavel : string) : string;
    // Funcão para setar o valor da variável
    procedure set_variavel_parametro(variavel : string; valor : string);

    // Procedure para descobrir quantidade de registros do DataSet passado
    // Para TUMZQuery
    procedure quantidade_registros(DataSet: TUMZQuery; Popup: TPopupMenu);

    // Procedure para descobrir quantidade de registros do DataSet passado
    // Para TZTable
    procedure quantidade_registros_table(DataSet: TZTable; Popup: TPopupMenu);

    function isTrue(valor : String) : Boolean;
    function FindUser(strUsu:String):Boolean;
    function FindUserCodigo(lng:Longint):Boolean;
    function FindDate(dat:TDateTime):Boolean;

    // Verificar se existe algum registro do código no valor informado
    function ExisteRegistro(tabela: string; campo: string; valor: string):Boolean;
      // Retorna True se existir e False se não.

    // Procedure que verifica o parâmetro sn_todas_maiusculas
    procedure TodasMaiusculas(Formulario: TForm);

    // Procedure que verifica o parâmetro sn_todas_maiusculas
    procedure TodasMaiusculasFrame(Frame: TFrame);

    // Procedure para gravar LOGS
    Procedure gerar_log(cd_modulo,cd_titulo,cd_caixa,nr_sequencia: integer; dt_movimento: TDateTime);

    // Procedure para gravar LOGS de acessos
    Procedure gerar_log_acesso(cd_modulo: integer; sn_acessou,sn_incluiu,sn_alterou,sn_excluiu:string);

    // Procedure para mostrar o Log num Popup
    procedure MostraLog(cd_modulo,cd_titulo,cd_caixa,nr_sequencia: integer; dt_movimento: TDateTime; Popup: TPopupMenu);
    // Procedure para setar os parâmetros do usuário
    procedure Set_Parametros_usuario(Formulario: TForm);

    // Procedure para ler os parâmetros do usuário
    procedure Parametros_usuario(Formulario: TForm);
    function GetAnoSemestreAsStr(const ADtDataAtual: TDateTime): string;
    Function DataAtual(): TDateTime;
    function NowFromDB: TDateTime;
    function DateFromDB: TDate;
    function TimeFromDB: TTime;
    procedure CarregaParametros();
    function getParametro(sNome: string): string;
    procedure RecalcularFrequencia(bForcar: Boolean = False; sFiltro: string = '');
    function UtilizaEnvioOcorrencias: boolean;

    function GetDB() : TZConnection; override;

    property ColigadaSelecionada: Integer read FColigadaSelecionada write FColigadaSelecionada default 0;
    property ListaColigadas: TStringList read FListaColigadas write FListaColigadas default nil;
  end;

var
  DM: TDM;

implementation

uses Main, Math, uFreq;

{$R *.dfm}

function TDM.variavel_parametro(variavel: string): string;
begin
    qyAux.Close;
    qyAux.SQL.Clear();
    qyAux.SQL.Add('SELECT ds_valor FROM parametros WHERE ds_variavel = :variavel');
    qyAux.ParambyName('variavel').AsString:= variavel;
    qyAux.Open;
    if not (qyAux.IsEmpty) then
    begin
      Result := qyAux.FieldByName('ds_valor').AsString;
      Exit;
    end;

    Result := '';

end;

procedure TDM.set_variavel_parametro(variavel, valor: string);
begin

    Dm.qyAux.Close;
    Dm.qyAux.SQL.Clear;
    Dm.qyAux.SQL.Text := 'UPDATE parametros SET ds_valor = :valor WHERE ds_variavel = :variavel ';
    Dm.qyAux.ParamByName('valor').AsString := valor;
    Dm.qyAux.ParamByName('variavel').AsString := variavel;
    Dm.qyAux.ExecSQL;

end;

procedure TDM.sqlMonitorLogTrace(Sender: TObject; Event: TZLoggingEvent);
begin
   FDllProc(Pointer(Event));

   if TGeneral.IsDebugging then
      OutputDebugString(PAnsiChar(Event.Message));
end;

procedure TDM.startConnDefaultConnection(Sender: TObject);
var
   ConnIni: TIniFile;
begin
   ConnIni := TIniFile.Create(ExtractFilePath(ParamStr(0)) + '\unimestre.ini');
   try
      try
         db.HostName := ConnIni.ReadString('Conexao', 'Servidor', 'localhost');
         db.Database := ConnIni.ReadString('Conexao', 'Banco', 'unimestre');
         db.User := ConnIni.ReadString('Conexao', 'Usuario', 'academico');
         db.Password := UMCrypt(ConnIni.ReadString('Conexao', 'Senha', 'C946E11A2BA225D2095C9F5683EF5590BF'), ctDecode);
         db.Port := ConnIni.ReadInteger('Conexao', 'Porta', 3306);
         db.Protocol := ConnIni.ReadString('Conexao', 'Protocolo', 'mysql-5');

         if not db.Connected then
            db.Connect;
      except
         Mensagem('Não foi possível conectar com o banco de dados. Consulte o suporte do sistema.', 'Erro de Conexão', MB_OK + MB_ICONERROR);
         Application.Terminate;
         Application.ProcessMessages;
      end;
   finally
      ConnIni.Free;
   end;
end;

// Função para descobrir quantidade de registros do DataSet passado
// Para TUMZQuery
procedure TDM.quantidade_registros(DataSet: TUMZQuery; Popup: TPopupMenu);
var
  Item: TMenuItem;
begin
  Popup.Items.Clear;
  Item := TMenuItem.Create(self);

  if DataSet.RecordCount = -1 then
    Item.Caption := 'Total de registros: ' + IntToStr(Dataset.RowsAffected)
  else
    Item.Caption := 'Total de registros: ' + IntToStr(DataSet.RecordCount);

  Popup.Items.Add(Item);
end;

// Função para descobrir quantidade de registros do DataSet passado
// Para TZTable
procedure TDM.quantidade_registros_table(DataSet: TZTable; Popup: TPopupMenu);
var
  Item: TMenuItem;
begin
  Popup.Items.Clear;
  Item := TMenuItem.Create(self);
  Item.Caption := 'Total de registros: ' + IntToStr(DataSet.RecordCount);
  Popup.Items.Add(Item);
end;

function TDM.isTrue(valor: String): Boolean;
begin
  if valor = 'S' Then result := True
  else result := False;
end;

function TDM.FindDate(dat:TDateTime):Boolean;
begin
  DM.qyFeriados.Close;
  DM.qyFeriados.ParamByName('Data').AsString := FormatDateTime('yyyy-mm-dd',dat);
  DM.qyFeriados.Open;

  Result := (DM.qyFeriados.FieldByName('DataFeriado').AsDateTime <> 0);
end;

function TDM.FindUser(strUsu:String):Boolean;
begin
  DM.qyUsuariosNome.Close;
  DM.qyUsuariosNome.ParamByName('Nome').AsString := strUsu;
  DM.qyUsuariosNome.Open;

  Result := (DM.qyUsuariosNome.FieldByName('Nome').AsString <> '');
end;

function TDM.FindUserCodigo(lng:Longint):Boolean;
begin
  DM.qyUsuarios.Close;
  DM.qyUsuarios.ParamByName('Codigo').AsInteger := lng;
  DM.qyUsuarios.Open;

  Result := (DM.qyUsuarios.FieldByName('Codigo').AsInteger <> 0);
end;

function TDM.TimeFromDB: TTime;
begin
   Result := TTime(NowFromDB);
end;

procedure TDM.TodasMaiusculas(Formulario: TForm);
var
  n : LongInt ;
begin

  for n := 0 to ( Formulario.ComponentCount - 1 ) do
  begin
    if ( Formulario.components[n].ClassType = TDBEdit ) then
    begin
      if variavel_parametro('sn_todas_maiusculas') = 'S' then
        TDBEdit(Formulario.components[n]).CharCase := ecUpperCase
      else
        TDBEdit(Formulario.components[n]).CharCase := ecNormal;
    end
    else if ( Formulario.components[n].ClassType = TEdit ) then
    begin
      if variavel_parametro('sn_todas_maiusculas') = 'S' then
        TEdit(Formulario.components[n]).CharCase := ecUpperCase
      else
        TEdit(Formulario.components[n]).CharCase := ecNormal;
    end
    else if ( Formulario.components[n].ClassType = TComboBox ) then
    begin
      if variavel_parametro('sn_todas_maiusculas') = 'S' then
        TComboBox(Formulario.components[n]).CharCase := ecUpperCase
      else
        TComboBox(Formulario.components[n]).CharCase := ecNormal;
    end;
  end ;

end;

procedure TDM.TodasMaiusculasFrame(Frame: TFrame);
var
  n : LongInt ;
begin

  for n := 0 to ( Frame.ComponentCount - 1 ) do
  begin
    if ( Frame.components[n].ClassType = TDBEdit ) then
    begin
      if variavel_parametro('sn_todas_maiusculas') = 'S' then
        TDBEdit(Frame.components[n]).CharCase := ecUpperCase
      else
        TDBEdit(Frame.components[n]).CharCase := ecNormal;
    end
    else if ( Frame.components[n].ClassType = TEdit ) then
    begin
      if variavel_parametro('sn_todas_maiusculas') = 'S' then
        TEdit(Frame.components[n]).CharCase := ecUpperCase
      else
        TEdit(Frame.components[n]).CharCase := ecNormal;
    end
    else if ( Frame.components[n].ClassType = TComboBox ) then
    begin
      if variavel_parametro('sn_todas_maiusculas') = 'S' then
        TComboBox(Frame.components[n]).CharCase := ecUpperCase
      else
        TComboBox(Frame.components[n]).CharCase := ecNormal;
    end;
  end ;

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

function TDM.UtilizaEnvioOcorrencias: boolean;
begin
   try
      qyVerEnvioOc.Open;
      Result := not qyVerEnvioOc.IsEmpty;
   finally
      qyVerEnvioOc.Close; 
   end;
end;

procedure TDM.DataModuleCreate(Sender: TObject);
var
   IniPath: TFileName;
   ConnIni: TIniFile;
begin
   Parametros := TSimpleCache.Create();

   sqlMonitor.Active := IsDebugging and TryLoadDebugger;

   IniPath := Format('%s%sunimestre.ini', [ExtractFilePath(ParamStr(0)), PathDelim]);
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

function TDM.ExisteRegistro(tabela: string; campo: string; valor: string):Boolean;
begin

  if valor = '' then
    valor := '0';

  DM.qyAux.Close;
  DM.qyAux.SQL.Clear;
  DM.qyAux.SQL.Add('SELECT COUNT(*) as qtde FROM '+tabela+' WHERE '+campo+' = '+valor);
  DM.qyAux.Open;

  if DM.qyAux.FieldByName('qtde').AsInteger > 0 then
    Result := True
   else
    Result := False;

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

Procedure TDM.gerar_log(cd_modulo,cd_titulo,cd_caixa,nr_sequencia: integer; dt_movimento: TDateTime);
Begin

  qyLogs.Close;
  qyLogs.ParamByName('cd_usuario').AsInteger := 0;
  qyLogs.Open;
  qyLogs.Insert;
  qyLogs.FieldByName('cd_modulo').AsInteger := cd_modulo;
  qyLogs.FieldByName('cd_titulo').AsInteger := cd_titulo;
  qyLogs.FieldByName('cd_caixa').AsInteger := cd_caixa;
  qyLogs.FieldByName('nr_sequencia').AsInteger := nr_sequencia;
  qyLogs.FieldByName('dt_movimento').AsDateTime := dt_movimento;
  qyLogs.Post;
  qyLogs.Close;

End;

Procedure TDM.gerar_log_acesso(cd_modulo: integer; sn_acessou,sn_incluiu,sn_alterou,sn_excluiu: string);
Begin

  qyLogsAcessos.Close;
  qyLogsAcessos.ParamByName('cd_usuario').AsInteger := 0;
  qyLogsAcessos.Open;
  qyLogsAcessos.Insert;
  qyLogsAcessos.FieldByName('cd_modulo').AsInteger := cd_modulo;
  qyLogsAcessos.FieldByName('sn_acessou').AsString := sn_acessou;
  qyLogsAcessos.FieldByName('sn_incluiu').AsString := sn_incluiu;
  qyLogsAcessos.FieldByName('sn_alterou').AsString := sn_alterou;
  qyLogsAcessos.FieldByName('sn_excluiu').AsString := sn_excluiu;
  qyLogsAcessos.Post;
  qyLogsAcessos.Close;

End;

function TDM.GetAnoSemestreAsStr(const ADtDataAtual: TDateTime): string;
var
   LWAno, LWMes, LWDia: Word;
begin
   DecodeDate(ADtDataAtual, LWAno, LWMes, LWDia);
   if ano_semestre_incremento = 1 then
   begin
      if LWMes > 6 then
         Result := Format('%d%d', [LWAno, 2])
      else
         Result := Format('%d%d', [LWAno, 1]);
   end
   else
      Result := Format('%d%d', [LWAno, 1]);
end;

function TDM.GetDB: TZConnection;
begin
   Result := Self.db;
end;

procedure TDM.qyLogsAfterInsert(DataSet: TDataSet);
begin
   qyLogs.FieldByName('dt_log').AsDateTime := DataHoje;
   qyLogs.FieldByName('hr_log').AsDateTime := DM.TimeFromDB;
   qyLogs.FieldByName('cd_usuario').AsInteger := qyUsuariosNome.FieldByName('Codigo').AsInteger;
end;

procedure TDM.qyLogsAcessosAfterInsert(DataSet: TDataSet);
begin

  qyLogsAcessos.FieldByName('dt_log').AsDateTime := DataHoje;
  qyLogsAcessos.FieldByName('hr_log').AsDateTime := DM.TimeFromDB;
  qyLogsAcessos.FieldByName('cd_usuario').AsInteger := qyUsuariosNome.FieldByName('Codigo').AsInteger;

end;

procedure TDM.MostraLog(cd_modulo,cd_titulo,cd_caixa,nr_sequencia: integer; dt_movimento: TDateTime; Popup: TPopupMenu);
var
  Item: TMenuItem;
begin
  Popup.Items.Clear;

  DM.qyAux.Close;
  DM.qyAux.SQL.Clear;
  DM.qyAux.SQL.Add('SELECT                                 ');
  DM.qyAux.SQL.Add('	u.nome,                               ');
  DM.qyAux.SQL.Add('	l.dt_log,                             ');
  DM.qyAux.SQL.Add('	l.hr_log                              ');
  DM.qyAux.SQL.Add('FROM                                   ');
  DM.qyAux.SQL.Add('	logs_financeiro l,                    ');
  DM.qyAux.SQL.Add('	usuarios u                            ');
  DM.qyAux.SQL.Add('WHERE                                  ');
  DM.qyAux.SQL.Add('	(u.codigo = l.cd_usuario) AND (       ');
  DM.qyAux.SQL.Add('	(l.cd_modulo = :cd_modulo) AND (      ');
  DM.qyAux.SQL.Add('	(                                     ');
  DM.qyAux.SQL.Add('	l.cd_caixa = :cd_caixa AND            ');
  DM.qyAux.SQL.Add('	l.dt_movimento = :dt_movimento AND    ');
  DM.qyAux.SQL.Add('	l.nr_sequencia = :nr_sequencia        ');
  DM.qyAux.SQL.Add('	) OR (                                ');
  DM.qyAux.SQL.Add('	l.cd_titulo = :cd_titulo AND          ');
  DM.qyAux.SQL.Add('	l.nr_sequencia = :nr_sequencia        ');
  DM.qyAux.SQL.Add('	)))                                   ');
  DM.qyAux.ParamByName('cd_modulo').AsInteger := cd_modulo;
  DM.qyAux.ParamByName('cd_titulo').AsInteger := cd_titulo;
  DM.qyAux.ParamByName('cd_caixa').AsInteger := cd_caixa;
  DM.qyAux.ParamByName('nr_sequencia').AsInteger := nr_sequencia;
  DM.qyAux.ParamByName('dt_movimento').AsString := FormatDateTime('yyyy-mm-dd', dt_movimento);
  DM.qyAux.Open;

  if not DM.qyAux.eof then
  begin
    Item := TMenuItem.Create(self);
    Item.Caption := 'Usuário: ' + DM.qyAux.FieldByName('nome').AsString;
    Popup.Items.Add(Item);
    Item := TMenuItem.Create(self);
    Item.Caption := 'Data: ' + DM.qyAux.FieldByName('dt_log').AsString;
    Popup.Items.Add(Item);
    Item := TMenuItem.Create(self);
    Item.Caption := 'Hora: ' + DM.qyAux.FieldByName('hr_log').AsString;
    Popup.Items.Add(Item);
  end;

end;


function TDM.NowFromDB: TDateTime;
begin
   qryNow.Close;
   qryNow.Open;
   Result := qryNowNOW.AsDateTime;
end;

procedure TDM.CriarConsulta(var DataSet: TUMZQuery);
begin
   DataSet := TUMZQuery.Create(Self);
   DataSet.Connection := db;
   DataSet.UpdateMode := umUpdateChanged;
end;

procedure TDM.CriarConsulta(var DataSet: TUMZReadOnlyQuery);
begin
   DataSet := TUMZReadOnlyQuery.Create(Self);
   DataSet.Connection := db;
end;

Function TDM.DataAtual(): TDateTime;
Begin
  qyAux.Close;
  qyAux.SQL.Clear;
  qyAux.SQL.Add('SELECT NOW() AS data FROM dual');
  qyAux.Open;

  Result := qyAux.FieldByName( 'data' ).AsDateTime;
  qyAux.Close();
End;

procedure TDM.Set_Parametros_usuario(Formulario: TForm);
var
  n : LongInt ;
begin

  for n := 0 to ( Formulario.ComponentCount - 1 ) do
  begin
    if ( Formulario.components[n].ClassType = TEdit ) then
    begin

      Dm.qyAux.Close;
      Dm.qyAux.SQL.Clear;
      Dm.qyAux.SQLList.Values[ DB_PROTOCOLO_MYSQL ] := ' ' +
         ' REPLACE INTO usuarios_parametros(cd_usuario,ds_parametro,ds_valor) ' +
         ' VALUES(:cd_usuario,:ds_parametro,:ds_valor)';
      Dm.qyAux.SQLList.Values[ DB_PROTOCOLO_ORACLE ] := ' ' +
         ' MERGE INTO usuarios_parametros up USING ' +
         '    (SELECT :cd_usuario AS cd_usuario, ' +
         '            :ds_parametro AS ds_parametro, ' +
         '            :ds_valor AS ds_valor FROM dual) up2 ON ' +
         '       ( up.cd_usuario = up2.cd_usuario AND up.ds_parametro = up2.ds_parametro ) ' +
         ' WHEN MATCHED THEN ' +
         '    UPDATE SET up.ds_valor = up2.ds_valor ' +
         ' WHEN NOT MATCHED THEN ' +
         '    INSERT ( up.cd_usuario, up.ds_parametro, up.ds_valor ) ' +
         '    VALUES ( up2.cd_usuario, up2.ds_parametro, up2.ds_valor ) ';

      Dm.qyAux.ParamByName('cd_usuario').AsInteger := qyUsuariosNome.FieldByName('Codigo').AsInteger;
      Dm.qyAux.ParamByName('ds_parametro').AsString := Formulario.Name+'.'+TEdit(Formulario.components[n]).Name;
      Dm.qyAux.ParamByName('ds_valor').AsString := TEdit(Formulario.components[n]).Text;
      Dm.qyAux.ExecSQL;

    end
    else if ( Formulario.components[n].ClassType = TComboBox ) then
    begin

      Dm.qyAux.Close;
      Dm.qyAux.SQL.Clear;
      Dm.qyAux.SQLList.Values[ DB_PROTOCOLO_MYSQL ] := ' ' +
         ' REPLACE INTO usuarios_parametros(cd_usuario,ds_parametro,ds_valor) ' +
         ' VALUES(:cd_usuario,:ds_parametro,:ds_valor)';
      Dm.qyAux.SQLList.Values[ DB_PROTOCOLO_ORACLE ] := ' ' +
         ' MERGE INTO usuarios_parametros up USING ' +
         '    (SELECT :cd_usuario AS cd_usuario, ' +
         '            :ds_parametro AS ds_parametro, ' +
         '            :ds_valor AS ds_valor FROM dual) up2 ON ' +
         '       ( up.cd_usuario = up2.cd_usuario AND up.ds_parametro = up2.ds_parametro ) ' +
         ' WHEN MATCHED THEN ' +
         '    UPDATE SET up.ds_valor = up2.ds_valor ' +
         ' WHEN NOT MATCHED THEN ' +
         '    INSERT ( up.cd_usuario, up.ds_parametro, up.ds_valor ) ' +
         '    VALUES ( up2.cd_usuario, up2.ds_parametro, up2.ds_valor ) ';

      Dm.qyAux.ParamByName('cd_usuario').AsInteger := qyUsuariosNome.FieldByName('Codigo').AsInteger;
      Dm.qyAux.ParamByName('ds_parametro').AsString := Formulario.Name+'.'+TComboBox(Formulario.components[n]).Name;
      Dm.qyAux.ParamByName('ds_valor').AsString := TComboBox(Formulario.components[n]).Text;

      Dm.qyAux.ExecSQL;

    end;
  end ;

end;

procedure TDM.Parametros_usuario(Formulario: TForm);
var
  n : LongInt ;
begin

  Dm.qyAux.Close;
  Dm.qyAux.SQL.Clear;
  Dm.qyAux.SQL.Text := 'SELECT ds_valor FROM usuarios_parametros WHERE cd_usuario = :cd_usuario AND ds_parametro = :ds_parametro';
  DM.qyAux.ParamByName('cd_usuario').AsInteger := qyUsuariosNome.FieldByName('Codigo').AsInteger;

  for n := 0 to ( Formulario.ComponentCount - 1 ) do
  begin

    if ( Formulario.components[n].ClassType = TEdit ) then
    begin
      DM.qyAux.ParamByName('ds_parametro').AsString := Formulario.Name+'.'+TEdit(Formulario.components[n]).Name;
      Dm.qyAux.Open;

      if not DM.qyAux.Eof then
        TEdit(Formulario.components[n]).Text := DM.qyAux.FieldByName('ds_valor').AsString;
    end
    else if ( Formulario.components[n].ClassType = TComboBox ) then
    begin
      DM.qyAux.ParamByName('ds_parametro').AsString := Formulario.Name+'.'+TComboBox(Formulario.components[n]).Name;
      Dm.qyAux.Open;

      if not DM.qyAux.Eof then
        TComboBox(Formulario.components[n]).Text := DM.qyAux.FieldByName('ds_valor').AsString;
    end;
  DM.qyAux.Close;
  end ;

end;

procedure TDM.DataModuleDestroy(Sender: TObject);
begin
   @FDLLProc := nil;
   FreeLibrary(FDLLHandle);
end;

function TDM.DateFromDB: TDate;
begin
   Result := TDate(NowFromDB);
end;

function TDM.getParametro(sNome: string): string;
begin
   if ( Parametros.Existe(sNome) ) then
   begin
      Result := Parametros.GetCache(sNome);
   end;
end;

procedure TDM.CarregaParametros();
begin
   with DM.qyAux do
   begin
      Close();
      SQL.Clear();
      SQL.Add(
         'SELECT                     '+
         '   ds_variavel, ds_valor   '+
         'FROM                       '+
         '   parametros              '+
         'WHERE                      '+
         '   cd_categoria = 12       '
      );

      if ( db.Protocol = DB_PROTOCOLO_ORACLE ) then
         SQL.Add( ' AND ROWNUM >= 1 AND ROWNUM <= 100 ' )
      else
         SQL.Add( ' LIMIT 100 ' );

      Open();

      if not IsEmpty then
      begin
         First();
         while not DM.qyAux.Eof do
         begin
            Parametros.SetCache(FieldByName('ds_variavel').AsString, FieldByName('ds_valor').AsString);
            Next();
         end;
      end;
      Close();
   end;
end;

procedure TDM.RecalcularFrequencia(bForcar: Boolean; sFiltro: string);
var
   Freq: TRecFreq;
begin
   Freq := TRecFreq.Create();
   Freq.AjustarFrequencia(bForcar, sFiltro);
   FreeAndNil(Freq);
end;

end.

