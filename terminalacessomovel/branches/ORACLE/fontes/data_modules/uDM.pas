{
  Este arquivo é similar ao ConexaoUM, ele faz a conexão com a base de dados
  através de um arquivo .ini, no caso unimestre.uni, é nele que temos o data
  módule para trabalhar com as querys do Terminal De Acessos

  Autor : Daniel Severo Estrázulas
}
unit uDM;

interface

uses
  Forms, Db, DBTables, Classes, Sysutils, Controls,
  General, Menus, DBCtrls, StdCtrls, DateUtils, Mask, DBGrids, uMLog,ZDataSet,
  UZDataset, ZAbstractDataset,uDMConexao,IniFiles,SysConst, ZConnection,uUMAuth,
  ZAbstractRODataset, uIUMDataModule, UZStartConnection;

type
   TAcaoRemessa = (arBaixa, arCancelar, arDesconto, arProtestar, arEstornar, arAltMensalidade, arNegociar, arProrrogar, arImpBoleto, arGerarMensalidade);
   TStrSituacoes = (sitDescricao, sitSigla, sitCodigo, sitTexto);

   TDataModule = class(AUMDataModule)
   end;

   TDM = class(TDataModule)
      tblUsuarios: TUMZQuery;
      tblParametros: TUMZQuery;
      tblUsuariosPorNome: TUMZQuery;
      ZConnTAM: TZConnection;
      tblParametrosds_valor: TMemoField;
      tblUsuarioscodigo: TIntegerField;
      tblUsuariosnome: TStringField;
      tblUsuariossenha: TStringField;
      tblUsuarioscd_pessoa: TIntegerField;
      tblUsuariosonline: TLargeintField;
      qryPermAcesso: TUMZQuery;
      qryPermAcessonr_permissao: TIntegerField;
      tblUsuariosPorNomecodigo: TIntegerField;
      tblUsuariosPorNomenome: TStringField;
      tblUsuariosPorNomesenha: TStringField;
      tblUsuariosPorNomeonline: TLargeintField;
      tblUsuariosPorNomecd_pessoa: TIntegerField;
    startConn: TUMZStartConnection;
    procedure FormCreate(Sender: TObject);
      procedure DMCreate(Sender: TObject);
      function GetDB(): TZConnection; override;
   private
      conexao:TUMConexao;
      AslConnInfo: TStringList;
      ALastErro: string;
      AAuth: TUMAuth;
   public
      property Auth: TUMAuth read AAUth;
      property LastErro: string read ALastErro;
      function isTrue(valor : String) : Boolean;
      function FindUser(strUsu:String):Boolean;
      function FindUserCodigo(lng:Longint):Boolean;
      function variavel_parametro(variavel : string) : string;
      function getConexao:TZConnection;
      function Conectar(Ini: TIniFile; sChave: string;  bUsaSenhaPadrao: Boolean): Boolean;  overload;
      function Conectar(slParams: TStringList; bUsaSenhaPadrao: Boolean): Boolean; overload;
      function Conectar(sServidor, sBanco, sPorta,sDriver: string; bSenhaCriptografada: Boolean; bUsaSenhaPadrao: Boolean; sUser: string; sPassword: string): Boolean;overload;
      function newQuery: TUMZQuery;
      function newROQuery: TUMZReadOnlyQuery;
   end;
  
//constantes do arquivo ini
const
   CONN_DRIVER: string = 'Protocol';
   CONN_SERVIDOR: string = 'Servidor';
   CONN_BANCO: string = 'Banco';
   CONN_PORTA: string = 'Porta';
   CONN_PASSWORD: string = 'Senha';
   CONN_USER: string = 'Usuario';

var
  DM: TDM;
  arConexao:TIniFile;

implementation

uses Main, Math, 
  Windows, Dialogs, uRegExpr;

{$R *.DFM}

{Retorna a instancia de conexão}
function TDM.getConexao: TZConnection;
begin
   Result := DM.ZConnTAM;
   exit;
end;

function TDM.GetDB: TZConnection;
begin
   Result := Self.ZConnTAM;
end;

{Conexão onde os parametros vem de um stringlist}
function TDM.Conectar(slParams: TStringList; bUsaSenhaPadrao: Boolean): Boolean;
begin
   Result := Conectar(slParams.Values[CONN_SERVIDOR], slParams.Values[CONN_BANCO],
      slParams.Values[CONN_PORTA], slParams.Values[CONN_DRIVER],
      True, bUsaSenhaPadrao, slParams.Values[CONN_USER], slParams.Values[CONN_PASSWORD]);
end;

{Conexão por informações do servidor}
function TDM.Conectar(sServidor, sBanco, sPorta,
  sDriver: string; bSenhaCriptografada: Boolean; bUsaSenhaPadrao: Boolean; sUser: string; sPassword: string): Boolean;
var
  bRetry: Boolean;
begin
   if ((Length(sServidor) = 0) or (Length(sDriver) = 0) or (Length(sBanco) = 0)
      or (Length(sPorta) = 0) or (Length(sDriver) = 0)) then begin
      raise Exception.Create('Parametros de conexão inexistentes!!');
      Exit;
   end;
   DM.ZConnTAM.Protocol := sDriver;
   DM.ZConnTAM.HostName := sServidor;
   DM.ZConnTAM.Database := sBanco;
   try
      DM.ZConnTAM.Port := StrToInt(sPorta);
   except
      DM.ZConnTAM.Port := 3306;
   end;
   DM.ZConnTAM.Properties.Clear();
   DM.ZConnTAM.Properties.Add('Database='+sBanco);

   //@TODO: Embutir Senhas
   if not (bUsaSenhaPadrao) then begin
      DM.ZConnTAM.User := sUser;
      if (bSenhaCriptografada) then begin
          DM.ZConnTAM.Password := TUMAuthCryptography.crypt(sPassword, actDecode);
      end
      else begin
         DM.ZConnTAM.Password := sPassword;
      end;
      try
         DM.ZConnTAM.Connect();
      except
         on E:Exception do begin
            Result := False;
            ALastErro := E.Message;
           Exit;
         end;

      end;
   end
   else begin
     Auth.unload();
     Auth.AuthInfo.Application := Application.ExeName;
     Auth.AuthInfo.loadFromConnection(DM.ZConnTAM);

     try
        DM.ZConnTAM.Password := Auth.SysPassword;
        DM.ZConnTAM.User := Auth.SysUser;
     except
        Result := False;
        Exit;
     end;

     //1 tentativa
     try
          DM.ZConnTAM.Connect();
          bRetry := not DM.ZConnTAM.Connected;
     except
        bRetry := False;
     end;
     if (bRetry) then begin
        //2 tentativa
        Auth.ResetStore();
        try
          DM.ZConnTAM.Password := Auth.SysPassword;
          DM.ZConnTAM.User := Auth.SysUser;
        except
          Result := False;
          Exit;
        end;
        try
          DM.ZConnTAM.Connect();
        except
        // Mensagem('Não foi possível conectar com o banco de dados. Consulte o suporte do sistema.', 'Atenção', MB_ICONERROR + MB_OK);
          Result := False;
          Exit;
        end;
     end;
   end;
   if DM.ZConnTAM.Connected then begin
      AslConnInfo.Clear();
      with AslConnInfo do begin
         Add('Driver='+sDriver);
         Add('Servidor='+sServidor);
         Add('Banco='+sBanco);
         Add('Porta='+sPorta);
      end;
   end;
   Result := DM.ZConnTAM.Connected;
end;

{Conexão por arquivo ini geralmente unimestre.ini}
function TDM.Conectar(Ini: TIniFile; sChave: string;  bUsaSenhaPadrao: Boolean): Boolean;
var
  slParams: TStringList;
begin
  Result := False;
  if (Assigned(Ini)) then begin
    slParams := TStringList.Create();
    slParams.Values[CONN_BANCO] := Ini.ReadString(sChave, 'Banco', 'fdafdfa');
    slParams.Values[CONN_SERVIDOR] := Ini.ReadString(sChave, 'Servidor', 'localhost');
    slParams.Values[CONN_PORTA] := Ini.ReadString(sChave, 'Porta', ' 3306');
    slParams.Values[CONN_DRIVER] := Ini.ReadString(sChave, 'Protocol', 'mysql-5');
    slParams.Values[CONN_PASSWORD] := Ini.ReadString(sChave, 'Senha', '');
    slParams.Values[CONN_USER] := Ini.ReadString(sChave, 'Usuario', '');
    Result := Conectar(slParams, bUsaSenhaPadrao);
    FreeAndNil(slParams);
  end;
end;


{Inicializar conexão ZEOS e o data module}
procedure TDM.DMCreate(Sender: TObject);
var
  n : Integer;
  sPrivateDir: string;
  sUsuario, sSenha : String;
  FConfig:TIniFile;
begin
  //le do arquivo de conexao
  FConfig := TIniFile.Create(ExtractFileDir(ParamStr(0))+'\unimestre.ini');
  
  AslConnInfo := TStringList.Create();

  AAuth := TUMAuth.Create();

  DM.Conectar(FConfig,'Conexao',false);
end;

{Pega valor da tabela de parametros}
function TDM.variavel_parametro(variavel: string): string;
begin
    tblParametros.close;
    {Atribui conexão correta}
    tblParametros.Connection := DM.ZConnTAM;
    tblParametros.ParambyName('variavel').AsString:= variavel;
    tblParametros.Open;

    if not tblParametros.Eof Then
       result := tblParametros.FieldByName('ds_valor').AsString
    else
       result := '';
end;



{Procura nome de usuário existente}
function TDM.FindUser(strUsu:String):Boolean;
begin
  tblUsuariosPorNome.Close;
  {Atribui conexão correta}
  tblUsuariosPorNome.Connection := DM.ZConnTAM;
  tblUsuariosPorNome.ParamByName('Nome').AsString := strUsu;
  tblUsuariosPorNome.Open;
  Result := (tblUsuariosPorNomeNome.AsString <> '');
end;

{Procura pelo código do usuario}
function TDM.FindUserCodigo(lng:Longint):Boolean;
begin

  tblUsuarios.Close;
  tblUsuarios.Connection := DM.ZConnTAM;
  tblUsuarios.ParamByName('Codigo').AsInteger := lng;
  tblUsuarios.Open;
  Result := (tblUsuariosCodigo.AsInteger <> 0);
end;

procedure TDM.FormCreate(Sender: TObject);
var
   FConfig: TIniFile;
begin
   FConfig := TIniFile.Create(ExtractFileDir(ParamStr(0))+'\unimestre.ini');

   startConn.Active := FConfig.ReadBool('Conexao', 'Usa.Start', False);
   startConn.IniPath := ExtractFileDir(ParamStr(0))+'\unimestre.ini';

   startConn.ConnectUnimestre;
end;

{Diz que S é true e N é false}
function TDM.isTrue(valor: String): Boolean;
begin
  if valor = 'S' Then result := True
  else result := False;
end;

{Cria uma query}
function TDM.newQuery: TUMZQuery;
begin
   Result := TUMZQuery.Create(DM.ZConnTAM);
   Result.Connection := DM.ZConnTAM;
end;

{Cria uma query somente de leitura}
function TDM.newROQuery: TUMZReadOnlyQuery;
begin
   Result := TUMZReadOnlyQuery.Create(DM.ZConnTAM);
   Result.Connection := DM.ZConnTAM;
end;

end.
