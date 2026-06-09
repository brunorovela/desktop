unit uDM;

interface

uses
  SysUtils, Classes, DB, ZConnection, Windows, FileCtrl, ShellApi, Messages,
  Variants, Graphics, Controls, Forms, Dialogs, StdCtrls, general,
  ZAbstractRODataset, ZAbstractDataset, ZDataset, UZDataset, IniFiles,
  UZStartConnection, ZSqlMonitor;

type
  TDM = class(TDataModule)
    db: TZConnection;
    tblOnlineParam: TUMZQuery;
    dsOnlineParam: TDataSource;
    tblUsuariosNome: TUMZQuery;
    tblUsuariosNomecodigo: TIntegerField;
    tblUsuariosNomenome: TStringField;
    tblUsuariosNomesenha: TStringField;
    tblUsuariosNomeonline: TStringField;
    tblModulosUsuarios: TUMZQuery;
    tblModulosUsuarioscodigousuario: TIntegerField;
    tblModulosUsuarioscodigomodulo: TSmallintField;
    tblModulosUsuariosincluir: TStringField;
    tblModulosUsuariosalterar: TStringField;
    tblModulosUsuariosdeletar: TStringField;
    tblModulosUsuariosacessar: TStringField;
    tblModulosUsuariosespecial: TStringField;
    tblOnlineParamRest: TUMZQuery;
    dsOnlineParamRest: TDataSource;
    tblOnlineParamds_variavel: TStringField;
    tblOnlineParamds_valor: TStringField;
    tblOnlineParamRestds_variavel: TStringField;
    tblOnlineParamRestds_valor: TStringField;
    tblUsuarios: TUMZQuery;
    tblUsuarioscodigo: TIntegerField;
    tblUsuariosnome2: TStringField;
    tblUsuariossenha: TStringField;
    tblUsuariosonline: TStringField;
    dsParamRest: TDataSource;
    tblParamRest: TUMZQuery;
    StringField1: TStringField;
    StringField2: TStringField;
    tblCenso_Cursos: TUMZQuery;
    tblCenso_Resultado: TUMZQuery;
    tblCenso_Quadros: TUMZQuery;
    tblCenso_Campos: TUMZQuery;
    dsCenso_Campos: TDataSource;
    dsCenso_Quadros: TDataSource;
    dsCenso_Cursos: TDataSource;
    dsCenso_Resultado: TDataSource;
    tblCenso_Quadroscd_quadro: TSmallintField;
    tblCenso_Quadrosds_quadro: TMemoField;
    tblCenso_Quadrossn_instituicao: TStringField;
    tblCenso_Quadrossn_curso: TStringField;
    tblCenso_Quadrossn_habilitacao: TStringField;
    tblCenso_Quadrossn_grau: TStringField;
    tblCenso_Camposcd_campo: TStringField;
    tblCenso_Camposcd_quadro: TSmallintField;
    tblCenso_Camposds_sql: TMemoField;
    tblCenso_Camposnr_semestre: TSmallintField;
    tblCenso_Camposds_campo: TStringField;
    tblCenso_Campossn_num_registros: TStringField;
    qyAux: TUMZQuery;
    startConn: TUMZStartConnection;
    sqlMonitor: TZSQLMonitor;
    procedure DataModuleDestroy(Sender: TObject);
    procedure sqlMonitorLogTrace(Sender: TObject; Event: TZLoggingEvent);
    procedure startConnDefaultConnection(Sender: TObject);
    procedure DataModuleCreate(Sender: TObject);
    procedure tblCenso_CamposNewRecord(DataSet: TDataSet);
  private
    { Private declarations }
      FDLLHandle: THandle;
      FDLLProc: procedure(Event: Pointer); stdcall;
      function IsDebugging: Boolean;
      function TryLoadDebugger: Boolean;
  public
    { Public declarations }
    NomeEmpresa : String;   { Parametro }

    procedure CreateQuery(var qry: TUMZQuery);

    function isTrue(valor : String) : Boolean;
    function FindUser(strUsu:String):Boolean;
    function FindUserCodigo(lng:Longint):Boolean;

    // Função para descobrir o valor do parâmetro tabelado
    function variavel_parametro(variavel : string) : string;
    // Funcão para setar o valor da variável
    procedure set_variavel_parametro(variavel : string; valor : string);

    function TamArquivo(const FileName: String): LongInt;
    procedure Executa (Programa: string);
    function GetShortFileName (const Arquivo : String) : String;
    function incrementar_ano_semestre(valor: String): String;
    function decrementar_ano_semestre(valor: String): String;

    function getDataHoraAtual():TDateTime;
    function getDataAtual: String;

  end;

var
  DM: TDM;

Const
  SenhaBD = 'B251EA051EB116C178EF73A1579339FC2A';
  UsuarioBD = '1FD96898B024A247E664';

implementation

uses uParametros, uBackup, uPrincipal;

{$R *.dfm}

{ TDM }

function TDM.incrementar_ano_semestre(valor: String): String;
var
  intAno, intSemestre : Integer;
begin
  intAno := StrToInt(Copy(valor,1,4));
  intSemestre := StrToInt(Copy(valor,5,1));

  if ano_semestre_incremento = 1 then
  Begin
      Inc( intSemestre );
      if intSemestre >= 3 then
      begin
        Inc( intAno );
        intSemestre := 1;
      end;
  end
  else
  Begin
     Inc( intAno );
  end;

  result := IntToStr( intAno ) + IntToStr( intSemestre );

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

function TDM.decrementar_ano_semestre(valor: String): String;
var
  intAno, intSemestre : Integer;
begin

  intAno := StrToInt(Copy(valor,1,4));
  intSemestre := StrToInt(Copy(valor,5,1));

  if ano_semestre_incremento = 1 then
  Begin
      Dec( intSemestre );
      if intSemestre <= 0 then
      begin
        Dec( intAno );
        intSemestre := 2;
      end;
  end
  else
  Begin
     dec( intAno );
  end;

  result := IntToStr( intAno ) + IntToStr( intSemestre );

end;

function TDM.FindUser(strUsu: String): Boolean;
begin
  DM.tblUsuariosNome.Close;
  DM.tblUsuariosNome.ParamByName('Nome').AsString := strUsu;
  DM.tblUsuariosNome.Open;

  Result := (DM.tblUsuariosNomeNome.AsString <> '');
end;

function TDM.FindUserCodigo(lng: Integer): Boolean;
begin
  DM.tblUsuarios.Close;
  DM.tblUsuarios.ParamByName('codigo').AsInteger := lng;
  DM.tblUsuarios.Open;

  Result := (DM.tblUsuariosCodigo.AsInteger <> 0);
end;

function TDM.isTrue(valor: String): Boolean;
begin
  if valor = 'S' then result := True
  else result := False;
end;

procedure TDM.DataModuleCreate(Sender: TObject);
var
   IniPath: TFileName;
   ConnIni: TIniFile;
begin
   sqlMonitor.Active := IsDebugging and TryLoadDebugger;

   IniPath := Format('%sunimestre.ini', [ExtractFilePath(ParamStr(0))]);
   ConnIni := TIniFile.Create(IniPath);
   try
      try
         startConn.IniPath := IniPath;
         startConn.Active := ConnIni.ReadBool('Conexao', 'Usa.Start', False);
         startConn.ConnectUnimestre;
      except
         raise;
      end;
   finally
      ConnIni.Free;
   end;
   NomeEmpresa := DM.variavel_parametro('cliente_nome_fantasia');
end;

procedure TDM.DataModuleDestroy(Sender: TObject);
begin
   @FDLLProc := nil;
   FreeLibrary(FDLLHandle);
end;

procedure TDM.set_variavel_parametro(variavel, valor: string);
Var
   RS_VAR : TUMZQuery;
begin

    CreateQuery(RS_VAR);

    RS_VAR.SQL.Text := 'UPDATE parametros SET ds_valor = :valor WHERE ds_variavel=:variavel';
    RS_VAR.ParamByName('valor').AsString := valor;
    RS_VAR.ParamByName('variavel').AsString := variavel;
    RS_VAR.ExecSQL;
end;

procedure TDM.sqlMonitorLogTrace(Sender: TObject; Event: TZLoggingEvent);
begin
   FDllProc(Pointer(Event));
end;

procedure TDM.startConnDefaultConnection(Sender: TObject);
var
   ConnIni: TIniFile;
begin
   ConnIni := TIniFile.Create(ExtractFilePath(ParamStr(0)) + 'unimestre.ini');
   try
      db.HostName := ConnIni.ReadString('Conexao', 'Servidor', 'localhost');
      db.Database := ConnIni.ReadString('Conexao', 'Banco', 'unimestre');
      db.User := ConnIni.ReadString('Conexao', 'Usuario', 'academico');
      db.Password := UMCrypt(ConnIni.ReadString('Conexao', 'Senha', 'C946E11A2BA225D2095C9F5683EF5590BF'), ctDecode);
      db.Port := ConnIni.ReadInteger('Conexao', 'Porta', 3306);
      db.Protocol := ConnIni.ReadString('Conexao', 'Protocolo', 'mysql-5');

      if db.Connected then
         db.Disconnect;
      db.Connect;

   finally
      ConnIni.Free;
   end;
end;

function TDM.variavel_parametro(variavel: string): string;
Var
   RS_VAR : TUMZQuery;
begin

    CreateQuery(RS_VAR);

    RS_VAR.SQL.Text := 'SELECT ds_valor FROM parametros WHERE ds_variavel=''' +  variavel + '''';
    RS_VAR.Open;

    if not RS_VAR.Eof Then
      begin
       result := RS_VAR.FieldByName('ds_valor').AsString;
      end
    else
      begin
       result := '';
      end;
end;

procedure TDM.CreateQuery(var qry: TUMZQuery);
begin
  qry := TUMZQuery.Create(nil);
  qry.Name := 'Query';
  qry.Connection := db;
end;

function TDM.TamArquivo(const FileName: String): LongInt;
var
  SearchRec : TSearchRec;
begin { !Win32! -> GetFileSize }
  if FindFirst(FileName,faAnyFile,SearchRec)=0 then
    begin
      Result := SearchRec.Size;
    end
  else
    begin
      Result := 0;
    end;
end;

procedure TDM.Executa(Programa: string);
// Execute the Windows Calculator and pop up
// a message when the Calc is terminated.
var
  SEInfo: TShellExecuteInfo;
  ExitCode: DWORD;
  ExecuteFile, ParamString, StartInString: string;
begin
  ExecuteFile:=Programa;

  FillChar(SEInfo, SizeOf(SEInfo), 0);
  SEInfo.cbSize := SizeOf(TShellExecuteInfo);
  with SEInfo do begin
    fMask := SEE_MASK_NOCLOSEPROCESS;
    Wnd := Application.Handle;
    lpFile := PChar(ExecuteFile);
  {
  ParamString can contain the
  application parameters.
  }
  // lpParameters := PChar(ParamString);
  {
  StartInString specifies the
  name of the working directory.
  If ommited, the current directory is used.
  }
  //  lpDirectory := PChar(StartInString);
    //nShow := SW_SHOWNORMAL;
    nShow := SW_HIDE;
  end;
  if ShellExecuteEx(@SEInfo) then begin
    repeat
      Application.ProcessMessages;
      GetExitCodeProcess(SEInfo.hProcess, ExitCode);
    until (ExitCode <> STILL_ACTIVE) or
	   Application.Terminated;
  end
  else
    begin
      frmBackup.ZerarCampos(nil);
      ShowMessage('Erro no processo de backup!');
    end;
end;

function TDM.GetShortFileName(const Arquivo: String): String;
var 
  aTmp : array [0..255] of char;
begin
  if GetShortPathName (PChar (Arquivo), aTmp, sizeof (aTmp) - 1) = 0 then
      begin
        Result := Arquivo;
      end
    else
      begin
        Result := StrPas (aTmp);
      end;
end;

procedure TDM.tblCenso_CamposNewRecord(DataSet: TDataSet);
begin
   tblCenso_Camposcd_quadro.AsInteger :=   tblCenso_Quadroscd_quadro.AsInteger;
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

function TDM.getDataHoraAtual: TDateTime;
begin
  with qyAux do begin
    Close();
    SQL.Text := 'SELECT NOW() AS DATA_HORA';
    Open;
    Result := FieldByName('DATA_HORA').AsDateTime;
  end;
end;

function TDM.getDataAtual: String;
begin
  with qyAux do begin
    Close();
    SQL.Text := 'SELECT SUBSTRING(NOW(),1,10) AS DATA';
    Open;
    Result := FieldByName('DATA').AsString;
  end;
end;

end.
