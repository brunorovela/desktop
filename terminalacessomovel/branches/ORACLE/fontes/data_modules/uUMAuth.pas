unit uUMAuth;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Contnrs, IniFiles,
  DB, UZDataset, ZDataset, ZConnection;

type
  TUMAuth = class;
  TUMAuthCryptography = class;
  TUMAuthInfo = class(TObject)
  private
    AHost: string;
    ABase: string;
    ALogin: string;
    APassword: string;
    AProtocol: string;
    APort: Integer;
    AApplication: string;
  public
    property Host: string read AHost write AHost;
    property Base: string read ABase write ABase;
    property Login: string read ALogin write ALogin;
    property Password: string read APassword write APassword;
    property Protocol: string read AProtocol write AProtocol;
    property Port: Integer read APort write APort;
    property Application: string read AApplication write AApplication;

    procedure loadFromIni(Ini: TIniFile; Section: string = 'Conexao');
    procedure loadFromODBC(sNome: string);
    procedure loadFromString(slDados: TStringList);
    procedure loadFromConnection(Conn: TZConnection);
    constructor Create();
  end;
  TUMAuthQuery = class(TObject)
  private
    AAuth: TUMAuth;
  protected
    function getAuth(): TUMAuth;
    function getInfo(): TUMAuthInfo;
  public
    procedure setAuth(Auth: TUMAuth);
    function load(): Boolean; virtual; abstract;
    function store(): Boolean; virtual; abstract;
    function reset(): Boolean; virtual; abstract;
  end;
  TUMAuth = class(TObject)
  private
    AQueryList: TList;
    AQueryStore: TUMAuthQuery;
    ALoaded: Integer;
    AAuthInfo: TUMAuthInfo;
    AAdminUser: string;
    ARelUser: string;
    ASysUser: string;

    //guarda as senhas
    ARelPassword: string;
    ASysPassword: string;
    AAdminPassword: string;

    function getDecoded(AStr: string): string;
    function getRelPassword(): string;
    function getSysPassword(): string;
    function getAdminPassword(): string;
    procedure loadAuthorization();
    procedure loadDefaultQueries();
  protected
    procedure setRelPassword(ARel: string);
    procedure setSysPassword(ASys: string);
    procedure setAdminPassword(AAdmin: string);
  public
    property RelUser: string read ARelUser;
    property SysUser: string read ASysUser;
    property AdminUser: string read AAdminUser;
    property RelPassword: string read getRelPassword;
    property SysPassword: string read getSysPassword;
    property AdminPassword: string read getAdminPassword;
    function getAuthInfo(): TUMAuthInfo;
    procedure setAuthInfo(AuthInfo: TUMAuthInfo);
    procedure ResetStore();
    procedure addQuery(AuthQuery: TUMAuthQuery);
    procedure clearQueries();
    procedure setQueryStore(AuthQuery: TUMAuthQuery);
    function isLoaded(): Boolean;
    procedure unload();
    property AuthInfo: TUMAuthInfo read getAuthInfo write setAuthInfo;
    constructor Create(); overload;
    constructor Create(AuthInfo: TUMAuthInfo); overload;
    constructor Create(AuthInfo: TUMAuthInfo; AuthQuery: array of TUMAuthQuery); overload;
    constructor Create(AuthInfo: TUMAuthInfo; AuthDefs: array of TClass); overload;
    destructor Destroy; override;
  end;
  TUMAuthQueryIni = class(TUMAuthQuery)
  private
    AFile: TIniFile;
    function getAppKey(): string;
    function loadDataFromKey(sKey: string): Boolean;
    function saveDataToKey(sKey: string): Boolean;
  protected
    procedure openFile();
    procedure closeFile();
  public
    function load(): Boolean; override;
    function store(): Boolean; override;
    function reset(): Boolean; override;    
  end;
  TUMAuthQueryDB = class(TUMAuthQuery)
  private
    procedure openConnection();
    procedure closeConnection();
    function loadQuery(): TStrings;
    function loadDataFromQuery(): Boolean;
  protected
    AQuery: TUMZReadOnlyQuery;
    ADBConn: TZConnection;
  public
    function load(): Boolean; override;
    function store(): Boolean; override;
    function reset(): Boolean; override;       
    constructor Create();
    destructor Destroy(); override;
  end;
  TUMAuthCryptographyTypes = (actEncode, actDecode);
  TUMAuthCryptography = class
  public
    class function crypt(sText: string; Action: TUMAuthCryptographyTypes = actEncode; Key: string = ''): string;

    class function encode(ADecoded: string): string;
    class function decode(AEncoded: string): string;

    class function findKey(AString: string; AList: TStrings): string;
    class function findEncoded(AString: string; AList: TStrings): string;
  end;
  TUMAuthUtil = class
  public
    class function readFromODBC(sChave: string; var Dados: TStringList): Boolean;
  end;

const
  UM_DATABASE_INFO: string = 'unimestre_info';

implementation

uses
  uMSistema, Registry;
{ TUMAuth }

constructor TUMAuth.Create(AuthInfo: TUMAuthInfo);
begin
  inherited Create();
  AAuthInfo := AuthInfo;
  AQueryList := TList.Create();
  ALoaded := 0;
  ARelUser := TUMAuthCryptography.decode('BE6D8F53F453');
  ASysUser :=  TUMAuthCryptography.decode('37F536F83E83');
  AAdminUser :=  TUMAuthCryptography.decode('B473B546E666FC20');
end;

constructor TUMAuth.Create(AuthInfo: TUMAuthInfo;
  AuthQuery: array of TUMAuthQuery);
var
  i: Integer;
begin
  Create(AuthInfo);
  for i := 0 to Length(AuthQuery) - 1 do begin
    addQuery(AuthQuery[i]);
  end;
end;

procedure TUMAuth.clearQueries;
begin
  AQueryList.Clear();
end;

constructor TUMAuth.Create(AuthInfo: TUMAuthInfo; AuthDefs: array of TClass);
var
  i: Integer;
begin
  Create(AuthInfo);
  for i := 0 to Length(AuthDefs) - 1 do begin
    addQuery(TUMAuthQuery(AuthDefs[i].NewInstance));
  end;
end;

constructor TUMAuth.Create;
begin
  AAuthInfo := TUMAuthInfo.Create();
  Create(AuthInfo);
  loadDefaultQueries();
end;

destructor TUMAuth.Destroy;
var
  i: Integer;
  Obj: TObject;
begin
  for i := 0 to AQueryList.Count - 1 do begin
    Obj := TObject(AQueryList[i]);
    FreeAndNil(Obj);
  end;
  FreeAndNil(AQueryList);
  inherited;
end;

procedure TUMAuth.addQuery(AuthQuery: TUMAuthQuery);
var
  AuthQ: Pointer;
begin
  AuthQ := Pointer(AuthQuery);
  if (AQueryList.IndexOf(AuthQ) = -1) then begin
    AQueryList.Add(AuthQ);
  end;
end;

function TUMAuth.getAdminPassword: string;
begin
  loadAuthorization();
  Result := getDecoded(AAdminPassword);
end;

function TUMAuth.getAuthInfo: TUMAuthInfo;
begin
  if (Self.AAuthInfo = nil) then begin
    Raise Exception.Create('AuthInfo is not initialized correctly');
  end;
  Result := AAuthInfo;
end;

function TUMAuth.getDecoded(AStr: string): string;
begin
  Result := TUMAuthCryptography.decode(AStr);
end;

function TUMAuth.getRelPassword: string;
begin
  loadAuthorization();
  Result := getDecoded(ARelPassword);
end;

function TUMAuth.getSysPassword: string;
begin
  loadAuthorization();
  Result := getDecoded(ASysPassword);
end;

function TUMAuth.isLoaded: Boolean;
begin
  Result := ALoaded = 1;
end;

procedure TUMAuth.loadAuthorization;
var
  i: Integer;
  AuthQuery: TUMAuthQuery;
begin
  if (ALoaded = 1) then Exit;
  if (ALoaded = -1) then Raise Exception.Create('Auth is not initialized correctly');

  //tenta carregar do store
  if (AQueryStore <> nil) then begin
    AQueryStore.setAuth(Self);
    if (AQueryStore.load()) then begin
      ALoaded := 1;
      Exit;
    end;
  end;
  for i := 0 to AQueryList.Count - 1 do begin
    AuthQuery := TUMAuthQuery(AQueryList.Items[i]);
    AuthQuery.setAuth(Self);
    if (AuthQuery.load()) then begin
      ALoaded := 1;
      //salva
      if (AQueryStore <> nil) then begin
        AQueryStore.setAuth(Self);
        AQueryStore.store();
      end;
      Exit;
    end;
  end;
  if (ALoaded <> 1) then begin
    ALoaded := -1;
  end;
end;

procedure TUMAuth.unload;
begin
  ALoaded := 0;
end;

procedure TUMAuth.ResetStore;
begin
  if (AQueryStore <> nil) then begin
    AQueryStore.reset();
  end;
  unload();
end;

procedure TUMAuth.setAdminPassword(AAdmin: string);
begin
  AAdminPassword := AAdmin;
end;

procedure TUMAuth.setAuthInfo(AuthInfo: TUMAuthInfo);
begin
  Self.AAuthInfo := AuthInfo;
end;

procedure TUMAuth.setQueryStore(AuthQuery: TUMAuthQuery);
begin
  AQueryStore := AuthQuery;
end;

procedure TUMAuth.setRelPassword(ARel: string);
begin
  ARelPassword := ARel;
end;

procedure TUMAuth.setSysPassword(ASys: string);
begin
  ASysPassword := ASys;
end;

{ TUMAuthCryptography }
   class function TUMAuthCryptography.crypt(sText: string; Action: TUMAuthCryptographyTypes = actEncode; Key: string = ''): string;
   var
     Dest: String;
     KeyLen,KeyPos,OffSet,SrcPos: Integer;
     TmpSrcAsc,Range,SrcAsc: Integer;
   begin
     if Key = '' then
       Key := 'YUQL23KL23DF90WI5E1JAS467NMCXXL6JAOAUWWMCL0AOMM4A4VZYW9KHJUI2347EJHJKDF3424SKLK3LAKDJSL9RTIKJ';

     Dest := '';
     KeyLen := Length(Key);
     KeyPos := 0;
     Range := 256;
     if (Length(sText) <= 0) Then
     begin
       Dest := '';
     end
     else if Action = actEncode then
     begin
       Randomize;
       OffSet := Random(Range);
       Dest := Format('%1.2x',[OffSet]);
       for SrcPos := 1 to Length(sText) do
       begin
         SrcAsc := (Ord(sText[SrcPos]) + OffSet) Mod 255;
         if KeyPos < KeyLen then KeyPos := KeyPos + 1 else KeyPos := 1;
         SrcAsc := SrcAsc Xor Ord(Key[KeyPos]);
         Dest := Dest + Format('%1.2x',[SrcAsc]);
         OffSet := SrcAsc;
       end;
     end
     else if Action = actDecode then
     begin
       OffSet := StrToInt('$'+ Copy(sText,1,2));
       SrcPos := 3;
       repeat
         SrcAsc := StrToInt('$'+ Copy(sText,SrcPos,2));
         if (KeyPos < KeyLen) Then KeyPos := KeyPos + 1 else KeyPos := 1;
         TmpSrcAsc := SrcAsc Xor Ord(Key[KeyPos]);
         if TmpSrcAsc <= OffSet then TmpSrcAsc := 255 + TmpSrcAsc - OffSet
         else TmpSrcAsc := TmpSrcAsc - OffSet;
         Dest := Dest + Chr(TmpSrcAsc);
         OffSet := SrcAsc;
         SrcPos := SrcPos + 2;
       until (SrcPos >= Length(sText));
     end;
     Result:= Dest;
   end; //FUNÇÃO Crypt


class function TUMAuthCryptography.decode(AEncoded: string): string;
begin
  Result := TUMAuthCryptography.Crypt(AEncoded, actDecode);
end;

class function TUMAuthCryptography.encode(ADecoded: string): string;
begin
  Result := TUMAuthCryptography.Crypt(ADecoded, actEncode);
end;

class function TUMAuthCryptography.findKey(AString: string;
  AList: TStrings): string;
var
  i: Integer;
begin
  Result := '';
  for i := 0 to AList.Count - 1 do begin
    if (TUMAuthCryptography.decode(AList.Names[i]) = AString) then begin
      Result := AList.Names[i];
      Exit;
    end;
  end;
end;

class function TUMAuthCryptography.findEncoded(AString: string;
  AList: TStrings): string;
var
  i: Integer;
begin
  Result := '';
  for i := 0 to AList.Count - 1 do begin
    if (TUMAuthCryptography.decode(AList[i]) = AString) then begin
      Result := AList[i];
      Exit;
    end;
  end;
end;

{ TUMAuthQueryIni }

procedure TUMAuthQueryIni.closeFile;
begin
  if (AFile <> nil) then begin
    FreeAndNil(AFile);
  end;
end;

function TUMAuthQueryIni.getAppKey(): string;
var
  sApp: string;
begin
  sApp := LowerCase(ExtractFileName( getInfo().Application ));
  sApp := sApp + ':' + GetVersao( getInfo().Application );
  Result := sApp;

end;

function TUMAuthQueryIni.load(): Boolean;
var
  sAppKeyEncoded, sAppKey: string;
  ASecoes: TStrings;
begin
  Result := False;
  openFile();
  //checa sessao
  sAppKey := getAppKey();

  ASecoes := TStringList.Create();
  AFile.ReadSections(ASecoes);
  sAppKeyEncoded := TUMAuthCryptography.findEncoded(sAppKey, ASecoes );
  //checa chave
  if (sAppKeyEncoded <> '') then begin
    //carrega chave
    Result := loadDataFromKey(sAppKeyEncoded);
  end;
  closeFile();
end;

function TUMAuthQueryIni.loadDataFromKey(sKey: string): Boolean;
var
  sDataKey: string;
  sData: string;
  AList: TStrings;
begin
  AList := TStringList.Create();
  Result := True;
  AFile.ReadSection(sKey, AList);
  sDataKey := TUMAuthCryptography.findEncoded( 'umrel', AList );
  sData := AFile.ReadString(sKey, sDataKey, '');
  if (sData = '') then Result := False
  else getAuth().setRelPassword(sData);

  sDataKey := TUMAuthCryptography.findEncoded( 'umsys', AList );
  sData := AFile.ReadString(sKey, sDataKey, '');
  if (sData = '') then Result := False
  else getAuth().setSysPassword(sData);

  sDataKey := TUMAuthCryptography.findEncoded( 'umadmin', AList );
  sData := AFile.ReadString(sKey, sDataKey, '');
  if (sData = '') then Result := False
  else getAuth().setAdminPassword(sData);
end;

procedure TUMAuthQueryIni.openFile;
var
  sFileName: string;
begin
  if (AFile = nil) then begin
    sFileName := GetUserDirectoryAppData() + '\umauth.dat';
    AFile := TIniFile.Create( sFileName );
  end;
end;

function TUMAuthQueryIni.reset: Boolean;
var
  Sections: TStrings;
  i: Integer;
begin
  Sections := TStringList.Create();
  openFile();

  AFile.ReadSections(Sections);
  for i := 0 to Sections.Count - 1 do begin
    AFile.EraseSection(Sections[i]);
  end;
  closeFile();
  Result := True;
end;

function TUMAuthQueryIni.saveDataToKey(sKey: string): Boolean;
var
  sDataKey: string;
begin
  try
    AFile.EraseSection(sKey);
    sDataKey := TUMAuthCryptography.encode( 'umrel' );
    AFile.WriteString(sKey, sDataKey, TUMAuthCryptography.encode(getAuth().RelPassword));

    sDataKey := TUMAuthCryptography.encode( 'umsys' );
    AFile.WriteString(sKey, sDataKey, TUMAuthCryptography.encode(getAuth().SysPassword));

    sDataKey := TUMAuthCryptography.encode( 'umadmin' );
    AFile.WriteString(sKey, sDataKey, TUMAuthCryptography.encode(getAuth().AdminPassword));
    Result := True;
  except
    Result := False;
  end;
end;

function TUMAuthQueryIni.store(): Boolean;
var
  sAppKeyEncoded, sAppKey: string;
begin
  openFile();
  //checa sessao
  sAppKey := getAppKey();
  sAppKeyEncoded := TUMAuthCryptography.encode(sAppKey);

  Result := saveDataToKey(sAppKeyEncoded);
  closeFile();
end;

{ TUMAuthQuery }

function TUMAuthQuery.getAuth: TUMAuth;
begin
  Result := AAuth;
end;

function TUMAuthQuery.getInfo: TUMAuthInfo;
begin
  Result := getAuth().getAuthInfo();
end;

procedure TUMAuthQuery.setAuth(Auth: TUMAuth);
begin
  Self.AAuth := Auth;
end;

{ TUMAuthQueryDB }

procedure TUMAuthQueryDB.closeConnection;
begin
  if (AQuery <> nil) then begin
    AQuery.Close();
    FreeAndNil(AQuery);
  end;
  if (ADBConn <> nil) then begin
    if (ADBConn.Connected) then begin
      ADBConn.Disconnect;
      FreeAndNil(ADBConn);
    end;
  end;
end;

constructor TUMAuthQueryDB.Create;
begin
  inherited;
  AQuery := nil;
  ADBConn := nil;
end;

destructor TUMAuthQueryDB.Destroy;
begin
  closeConnection();
end;

function TUMAuthQueryDB.load: Boolean;
begin
  try
    openConnection();
    Result := loadDataFromQuery();
  finally
    closeConnection();
  end;
end;

function TUMAuthQueryDB.loadDataFromQuery: Boolean;
var
  ADados: TStrings;
  sDataKey: string;
begin
  Result := True;
  ADados := loadQuery();
  if ADados.Count = 0 then begin
    Result := False;
    Exit;
  end;
  //load each key
    sDataKey := TUMAuthCryptography.findKey( 'umrel', ADados );
    if (sDataKey <> '') then
      getAuth().setRelPassword(ADados.Values[sDataKey])
    else
      Result := False;

    sDataKey := TUMAuthCryptography.findKey( 'umsys', ADados );
    if (sDataKey <> '') then
      getAuth().setSysPassword(ADados.Values[sDataKey])
    else
      Result := False;

    sDataKey := TUMAuthCryptography.findKey( 'umadmin', ADados );
    if (sDataKey <> '') then
      getAuth().setAdminPassword(ADados.Values[sDataKey])
    else
      Result := False;
end;

function TUMAuthQueryDB.loadQuery(): TStrings;
var
  ADados: TStrings;
begin
  if (AQuery = nil) then begin
    AQuery := TUMZReadOnlyQuery.Create(ADBConn);
    AQuery.Connection := ADBConn;
  end;
  ADados := TStringList.Create();
  AQuery.SQL.Text := 'SELECT dados FROM info WHERE cd_info = 1';
  AQuery.Open();
  if not AQuery.IsEmpty then begin
    ADados.Delimiter := ';';
    ADados.DelimitedText := TUMAuthCryptography.decode(AQuery.FieldByName('dados').AsString);
  end;
  AQuery.Close();
  Result := ADados;
end;

procedure TUMAuthQueryDB.openConnection;
var
  Info: TUMAuthInfo;
begin
    Info := getInfo();
    if (ADBConn = nil)  then begin
      ADBConn := TZConnection.Create(nil);
      ADBConn.Protocol := Info.Protocol;
      ADBConn.HostName := Info.Host;
      ADBConn.Port := Info.Port;
      ADBConn.Database := UM_DATABASE_INFO;
      ADBConn.Properties.Add('Database='+ADBConn.Database);
      ADBConn.LoginPrompt := False;
      ADBConn.ReadOnly := True;
      ADBConn.User := TUMAuthCryptography.decode(Info.Login);
      ADBConn.Password := TUMAuthCryptography.decode(Info.Password);
    end;
    if not (ADBConn.Connected) then begin
    ADBConn.Connect();
    if not (ADBConn.Connected) then begin
      Raise Exception.Create('Impossible to connect to INFO database');
    end;
  end;
end;

function TUMAuthQueryDB.reset: Boolean;
begin
  Raise Exception.Create('This funcionality is not avaliable for reset');
end;

function TUMAuthQueryDB.store: Boolean;
begin
  Raise Exception.Create('This funcionality is not avaliable for store');
end;

{ TUMAuthInfo }

constructor TUMAuthInfo.Create;
begin
  inherited;
  APort := 3306;
  ABase := 'unimestre';
  ALogin := 'A443E51EC015B7';
  APassword := 'CA76FC3F3D97F82C2CBCDC0470D33AFF70';
  AProtocol := 'mysql-5';
  AHost := 'localhost';
end;

procedure TUMAuthInfo.loadFromConnection(Conn: TZConnection);
begin
  Host := Conn.HostName;
  Base := Conn.Database;
  Port := Conn.Port;
  Protocol := Conn.Protocol;
end;

procedure TUMAuthInfo.loadFromIni(Ini: TIniFile; Section: string);
begin
  Host := Ini.ReadString(Section, 'Servidor', '');
  Base := Ini.ReadString(Section, 'Banco', 'unimestre');
  Port := Ini.ReadInteger(Section, 'Port', 3306);
  Protocol := Ini.ReadString(Section, 'Protocol', 'mysql-5');
end;

procedure TUMAuthInfo.loadFromODBC(sNome: string);
var
  slDados: TStringList;
begin
  slDados := TStringList.Create();
  TUMAuthUtil.readFromODBC(sNome, slDados);
  Host := slDados.Values['SERVER'];
  Base := slDados.Values['DATABASE'];
  Port := StrToInt(slDados.Values['PORT']);
end;

procedure TUMAuthInfo.loadFromString(slDados: TStringList);
begin
  Host := slDados.Values['Servidor'];
  Base := slDados.Values['Banco'];
  Port := StrToInt(slDados.Values['Porta']);
  Protocol := slDados.Values['Protocol'];
end;

procedure TUMAuth.loadDefaultQueries;
var
  QueryIni: TUMAuthQueryIni;
  QueryDB: TUMAuthQueryDB;
begin
  //adiciona as queries
  AQueryList.Clear();

  QueryIni := TUMAuthQueryIni.Create();
  QueryDB := TUMAuthQueryDB.Create();

  setQueryStore(QueryIni);
  addQuery(QueryDB);
end;

{ TUMAuthUtil }

class function TUMAuthUtil.readFromODBC(sChave: string; var Dados: TStringList): Boolean;
const
   PLACE_ODBC: string = 'Software\ODBC\ODBC.INI\';
var
    reg: TRegistry;
    sKey: string;
    bLoaded: Boolean;
    slNames: TStringList;
    i: Integer;
begin
    bLoaded := False;
    if (Dados = nil) then begin
      Dados := TStringList.Create();
    end;
    reg := TRegistry.Create();
    sKey := PLACE_ODBC + sChave;
    reg.RootKey := HKEY_CURRENT_USER;
    if (reg.KeyExists(sKey)) then begin
      reg.OpenKey(sKey, False);
      bLoaded := True;
    end
    else begin
      reg.RootKey := HKEY_LOCAL_MACHINE;
      if (reg.KeyExists(sKey)) then begin
        reg.OpenKey(sKey, False);
        bLoaded := True;
      end;
    end;
    //verifica se a chave tá aberta, se tiver le oconteudo
    if (bLoaded) then begin
        slNames := TStringList.Create();
        reg.GetKeyNames(slNames);
        for i := 0 to slNames.Count - 1 do begin
          if (reg.ValueExists(slNames[i])) then begin
            Dados.Add(UpperCase(slNames[i]) + '=' + reg.ReadString(slNames[i]));
          end;
        end;
        FreeAndNil(slNames);
    end;
    FreeAndNil(reg);
    Result := bLoaded;
end;

end.
