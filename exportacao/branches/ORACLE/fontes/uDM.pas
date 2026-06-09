unit uDM;

interface

uses
  Windows, Forms, DB, ZAbstractRODataset, ZAbstractDataset, ZDataset, DBTables, Classes, Sysutils, Controls,
  uMGerais, Dialogs, Menus, DBCtrls, StdCtrls, ZConnection, IniFiles, UZDataset,
  UZStartConnection, ZSqlMonitor, uIUMDataModule;

type
   TDataModule = class(AUMDataModule)
   end;

  TDM = class(TDataModule)
    ZConn: TZConnection;
    qyQuantidade: TUMZQuery;
    qyLastInsert: TUMZQuery;
    qyModulosUsuarios: TUMZQuery;
    qyUsuarios: TUMZQuery;
    qyAux: TUMZQuery;
    qyUsuariosNome: TUMZQuery;
    qyModulosUsuarioscodigousuario: TIntegerField;
    qyModulosUsuarioscodigomodulo: TSmallintField;
    qyModulosUsuariosincluir: TStringField;
    qyModulosUsuariosalterar: TStringField;
    qyModulosUsuariosdeletar: TStringField;
    qyModulosUsuariosacessar: TStringField;
    qyModulosUsuariosespecial: TStringField;
    qyUsuarioscodigo: TIntegerField;
    qyUsuariosnome2: TStringField;
    qyUsuariossenha: TStringField;
    qyUsuariosonline: TStringField;
    qyRAux: TUMZQuery;
    qyRAux2: TUMZQuery;
    qyUsuariosNomenome: TStringField;
    qyUsuariosNomesenha: TStringField;
    qyUsuariosNomeonline: TStringField;
    qyUsuariosNomecodigo: TIntegerField;
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
    startConn: TUMZStartConnection;
    sqlMonitor: TZSQLMonitor;
    procedure DataModuleDestroy(Sender: TObject);
    procedure sqlMonitorLogTrace(Sender: TObject; Event: TZLoggingEvent);
    procedure startConnDefaultConnection(Sender: TObject);
    procedure DataModuleCreate(Sender: TObject);
    function GetDB(): TZConnection; override;
  private
    { Private declarations }
      FDLLHandle: THandle;
      FDLLProc: procedure(Event: Pointer); stdcall;
      function IsDebugging: Boolean;
      function TryLoadDebugger: Boolean;
  public
    usuario_logado: String;

    // Código da pessoa logada
    iCdPessoaLogado: Integer;

    { Public declarations }
    function getContaRegistros(sTabela: string; sCondicao: string = ''): Integer;
    function apagaRegistros(sTabela: string; sCondicao: string = ''): Integer;
    function LastInsert(): Integer;
    function GetMax(sTabela, sCampo: string; sCondicao: string = ''): Integer;
    function getNextID(sTabela: string; sCampo: string): Integer;
    procedure ConectaBD();
    procedure Desconecta();
    function EstaConectado(): Boolean;
    function isTrue(valor: String): Boolean;
    // Função para descobrir o valor do parâmetro tabelado
    function variavel_parametro(variavel : string) : string;
    // Funcão para setar o valor da variável
    procedure set_variavel_parametro(variavel : string; valor : string);
    function FindUser(strUsu:String):Boolean;
    function FindUserCodigo(lng:Longint):Boolean;
    procedure AtualizaCampos(sTabela: string);
    procedure AtualizaTabelas();
    procedure AtualizaDatabase();

//    function geraInsertDDL(sTabela: string; slCamposValores: TStringList): string;
//    function substDDLString(sTexto: string): string;
//    function geraDDLFromQuery(sTabela: string; sCodigo: string; qyConsulta: TUMZQuery): TStringList;
  end;

var
  DM: TDM;

implementation

{$R *.dfm}
uses
   uMain, uMStrings;


function TDM.isTrue(valor: String): Boolean;
begin
  if valor = 'S' Then result := True
  else result := False;
end;

function TDM.apagaRegistros(sTabela, sCondicao: string): Integer;
var
   iRet: Integer;
begin
   with DM.qyQuantidade do begin
      Close();
      Params.Clear();
      SQL.Clear();
      SQL.Add('DELETE FROM');
      SQL.Add(' ' + sTabela + ' ');
      if (sCondicao <> '') then begin
         SQL.Add(' WHERE ' + sCondicao);
      end;
      try
         ExecSQL();
         iRet := RowsAffected;
      except
         iRet := -1;
      end;
      Close();
   end;
   Result := iRet;
end;

function TDM.getContaRegistros(sTabela, sCondicao: string): Integer;
var
   iRet: Integer;
begin
   iRet := -1;
   with DM.qyQuantidade do begin
      Close();
      Params.Clear();
      SQL.Clear();
      SQL.Add('SELECT COUNT(*) as conta FROM');
      SQL.Add(' ' + sTabela + ' ');
      if (sCondicao <> '') then begin
         SQL.Add(' WHERE ' + sCondicao);
      end;
      try
         Open();
         if not IsEmpty then begin
            iRet := FieldByName('conta').AsInteger;
         end;
      except
         iRet := -1;
      end;
      Close();
   end;
   Result := iRet;
end;

function TDM.LastInsert: Integer;
var
   iRet: Integer;
begin
   iRet := -1;
   with DM.qyLastInsert do begin
      Close();
      Params.Clear();
      SQL.Clear();
      SQL.Add('SELECT LAST_INSERT_ID() as conta');
      try
         Open();
         if not IsEmpty then begin
            iRet := FieldByName('conta').AsInteger;
         end;
      except
         iRet := -1;
      end;
      Close();
   end;
   Result := iRet;
end;

function TDM.getNextID(sTabela: string; sCampo: string): Integer;
var
   iRet: Integer;
begin
   iRet := -1;
   with DM.qyLastInsert do begin
      Close();
      Params.Clear();
      SQL.Clear();
      SQL.Add('SELECT MAX('+sCampo+') as conta FROM ' + sTabela);
      try
         Open();
         if not IsEmpty then begin
            iRet := FieldByName('conta').AsInteger;
         end;
      except
         iRet := -1;
      end;
      Close();
   end;
   Result := iRet;
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

procedure TDM.ConectaBD;
var
   i: Integer;
   AHide: Boolean;
begin
   ZConn.Connected := False;
   AHide := False;
   for i := 1 to ParamCount do begin
      if (Trim(ParamStr(i)) = '-s') then begin
         AHide := True;
      end;
   end;
   //set the preferencias

   if not ZConn.Connected then begin
      ZConn.Database := Pref.ReadString('Conexao', 'Banco', 'fdafdfa');
      ZConn.HostName := Pref.ReadString('Conexao', 'Servidor', 'localhost');
      Zconn.User := Pref.ReadString('Conexao', 'Usuario', 'academico');
      ZConn.Password := Crypt(Pref.ReadString('Conexao', 'Senha', Crypt('UniMestreProSurf', ctEncode)), ctDecode);
      ZConn.Port := Pref.ReadInteger('Conexao', 'Porta', 3306);
      ZConn.Properties.Clear();
      ZConn.Properties.Add('Database='+Pref.ReadString('Conexao', 'Banco', 'fdafdfa'));
      ZConn.Protocol := Pref.ReadString('Conexao', 'Protocolo', 'mysql-5');
      try
         ZConn.Connect();
         if not ZConn.Connected then
         begin
            Application.Terminate();
            Application.ProcessMessages;
         end;
      except
         if not AHide then begin
            Mensagem('Não foi possível conectar com o banco de dados. Consulte o suporte do sistema.', 'Atenção', MB_ICONERROR + MB_OK);
         end;
      end;
   end;
end;


function TDM.EstaConectado: Boolean;
begin
   Result := ZConn.Connected;
end;

procedure TDM.Desconecta;
begin
   if ZConn.Connected then begin
      ZConn.Disconnect();
   end;
end;

procedure TDM.DataModuleCreate(Sender: TObject);
var
   IniPath: TFileName;
begin
   sqlMonitor.Active := IsDebugging and TryLoadDebugger;

   IniPath := ExtractFilePath(Application.ExeName) + 'unimestre.ini';
   Pref := TIniFile.Create(IniPath);
   
   try
      startConn.IniPath := IniPath;
      startConn.Active := Pref.ReadBool('Conexao', 'Usa.Start', False);

      if startConn.Active then
      begin
         startConn.UnimestreUser := 'umsistema';
      end;

      startConn.ConnectUnimestre;
   except
      raise;
   end;
end;

procedure TDM.DataModuleDestroy(Sender: TObject);
begin
   @FDLLProc := nil;
   FreeLibrary(FDLLHandle);
end;

procedure TDM.set_variavel_parametro(variavel, valor: string);
begin
    Dm.qyAux.Close;
    Dm.qyAux.SQL.Clear;
    Dm.qyAux.SQL.Text := 'UPDATE parametros SET ds_valor = ''' + valor + ''' WHERE ds_variavel=''' +  variavel + '''';
    Dm.qyAux.ExecSQL;
end;

procedure TDM.sqlMonitorLogTrace(Sender: TObject; Event: TZLoggingEvent);
begin
   FDllProc(Pointer(Event));
end;

procedure TDM.startConnDefaultConnection(Sender: TObject);
begin
   ConectaBD;
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

function TDM.variavel_parametro(variavel: string): string;
begin
    qyAux.Close;
    qyAux.SQL.Text := 'SELECT ds_valor FROM parametros WHERE ds_variavel = :variavel';
    qyAux.ParambyName('variavel').AsString:= variavel;
    qyAux.Open;
    if not (qyAux.IsEmpty) then
    begin
      Result := qyAux.FieldByName('ds_valor').AsString;
      Exit;
    end;

    Result := '';
end;

function TDM.FindUser(strUsu:String):Boolean;
begin
  DM.qyUsuariosNome.Close;
  DM.qyUsuariosNome.ParamByName('Nome').AsString := strUsu;
  DM.qyUsuariosNome.Open;

  Result := (DM.qyUsuariosNome.FieldByName('Nome').AsString <> '');
end;

function TDM.FindUserCodigo(lng: Integer): Boolean;
begin
  DM.qyUsuarios.Close;
  DM.qyUsuarios.ParamByName('Codigo').AsInteger := lng;
  DM.qyUsuarios.Open;

  Result := (DM.qyUsuarios.FieldByName('Codigo').AsInteger <> 0);
end;

function TDM.GetDB: TZConnection;
begin
   Result := Self.ZConn;
end;

function TDM.GetMax(sTabela, sCampo, sCondicao: string): Integer;
var
   iRet: Integer;
begin
   iRet := -1;
   with DM.qyAux do begin
      Close();
      Params.Clear();
      SQL.Clear();
      SQL.Add('SELECT MAX('+sCampo+') as conta FROM ' + sTabela + ' WHERE '+ sCondicao);
      try
         Open();
         if not IsEmpty then begin
            iRet := FieldByName('conta').AsInteger;
         end;
      except
         iRet := -1;
      end;
      Close();
   end;
   Result := iRet;
end;

procedure TDM.AtualizaDatabase;
begin
   //carrega tabelas no BD
   with qyRAux2 do begin
      Close();
      Params.Clear();
      SQL.Clear();
      SQL.Add('SHOW TABLES');
      Open();
      while not Eof do begin
         AtualizaCampos(Fields[0].AsString);
         Next();
      end;
   end;
end;

procedure TDM.AtualizaTabelas;
var
   slTabelas: TStringList;
   i, z: Integer;
begin
   slTabelas := TStringList.Create();
   try
      slTabelas.Clear();
      slTabelas.Duplicates := dupIgnore;

      //carrega tabelas no BD
      with qyRAux do begin
         Close();
         Params.Clear();
         SQL.Clear();
         SQL.Add('SHOW TABLES');
         Open();

         while not Eof do begin
            slTabelas.Add( Fields[0].AsString + '=1' );
            Next();
         end;
      end;

      //carrega dados de Expo
      with qyRAux do begin
         Close();
         Params.Clear();
         SQL.Clear();
         SQL.Add('SELECT nm_tabela, sn_apagada FROM expo_tabelas ORDER BY nm_tabela');
         Open();
         while not Eof do begin

            i := slTabelas.IndexOfName(Fields[0].AsString);
            if (i = -1) then begin
               slTabelas.Add(Fields[0].AsString + '=2');
               if Fields[1].AsInteger = 1 then begin
                  slTabelas.Values[Fields[0].AsString] := '5';
               end;
            end
            else begin
               slTabelas.Values[Fields[0].AsString] := '3';
               if Fields[1].AsInteger = 1 then begin
                  slTabelas.Values[Fields[0].AsString] := '4';
               end;
            end;
            Next();
         end;
      end;

      for i := 0 to slTabelas.Count-1 do begin

         //verifica se tem em tabelas
         z := StrToInt(slTabelas.ValueFromIndex[i]);
         if (z = 3) then begin
            //pula
         end
         else if (z = 2) then begin
             //tabela removida
             qyAux.Close();
             qyAux.Params.Clear();
             qyAux.ParamCheck := False;
             qyAux.SQL.Text := 'UPDATE expo_tabelas SET sn_apagada = 1 WHERE nm_tabela = "'+ slTabelas.Names[i] + '" LIMIT 1';
             qyAux.ExecSQL();
         end
         else if (z = 1) then begin
             //tabela a ser inserida
             qyAux.Close();
             qyAux.Params.Clear();
             qyAux.ParamCheck := False;
             qyAux.SQL.Text := 'INSERT INTO expo_tabelas (nm_tabela, sn_ativo, sn_apagada) VALUES ("'+ slTabelas.Names[i] + '", 1, 0)';
             qyAux.ExecSQL();
         end
         else if (z = 4) then begin
             //tabela a ser inserida
             qyAux.Close();
             qyAux.Params.Clear();
             qyAux.ParamCheck := False;
             qyAux.SQL.Text := 'UPDATE expo_tabelas SET sn_apagada = 0 WHERE nm_tabela = "'+ slTabelas.Names[i] + '" LIMIT 1';
             qyAux.ExecSQL();
         end;
      end;

   finally
      FreeAndNil(slTabelas);
   end;
end;

procedure TDM.AtualizaCampos(sTabela: string);
var
   slCampos: TStringList;
   i, z: Integer;
begin
   slCampos := TStringList.Create();
   try
      slCampos.Clear();
      slCampos.Duplicates := dupIgnore;

      //carrega tabelas no BD
      with qyRAux do begin
         Close();
         Params.Clear();
         SQL.Clear();
         SQL.Add('SHOW FIELDS FROM '+ sTabela);
         Open();

         while not Eof do
         begin
            slCampos.Add( Fields[0].AsString + '=1' );
            Next();
         end;
      end;

      //carrega dados de Expo
      with qyRAux do begin
         Close();
         Params.Clear();
         SQL.Clear();
         SQL.Add('SELECT nm_campo, sn_apagado');
         SQL.Add('FROM expo_campos');
         SQL.Add('WHERE nm_tabela = '''+sTabela+''' AND sn_calculado = 0 ORDER BY nm_campo');
         Open();
         while not Eof do begin

            i := slCampos.IndexOfName(Fields[0].AsString);
            if (i = -1) then begin
               slCampos.Add(Fields[0].AsString + '=2');
               if Fields[1].AsInteger = 1 then begin
                  slCampos.Values[Fields[0].AsString] := '5';
               end;
            end
            else begin
               slCampos.Values[Fields[0].AsString] := '3';
               if Fields[1].AsInteger = 1 then begin
                  slCampos.Values[Fields[0].AsString] := '4';
               end;
            end;
            Next();
         end;
      end;

      for i := 0 to slCampos.Count-1 do begin

         //verifica se tem em tabelas
         z := StrToInt(slCampos.ValueFromIndex[i]);
         if (z = 3) then begin
            //pula
         end
         else if (z = 2) then begin
             //tabela removida
             qyAux.Close();
             qyAux.Params.Clear();
             qyAux.ParamCheck := False;
             qyAux.SQL.Text := 'UPDATE expo_campos SET sn_apagado = 1 WHERE nm_campo = '''+ slCampos.Names[i] + ''' AND nm_tabela = '''+sTabela+''' LIMIT 1';
             qyAux.ExecSQL();
         end
         else if (z = 1) then begin
             //tabela a ser inserida
             qyAux.Close();
             qyAux.Params.Clear();
             qyAux.ParamCheck := False;
             qyAux.SQL.Text := 'INSERT INTO expo_campos (nm_tabela, nm_campo, ds_campo, sn_ativo, sn_apagado) VALUES ('''+sTabela+''', '''+slCampos.Names[i]+''', ''Descrição do campo '+slCampos.Names[i]+''', 1, 0)';
             qyAux.ExecSQL();
         end
         else if (z = 4) then begin
             //tabela a ser inserida
             qyAux.Close();
             qyAux.Params.Clear();
             qyAux.ParamCheck := False;
             qyAux.SQL.Text := 'UPDATE expo_campos SET sn_apagado = 0 WHERE nm_campo = '''+ slCampos.Names[i] + ''' AND nm_tabela = '''+sTabela+''' LIMIT 1';
             qyAux.ExecSQL();
         end;
      end;

   finally
      FreeAndNil(slCampos);
   end;
end;

end.
