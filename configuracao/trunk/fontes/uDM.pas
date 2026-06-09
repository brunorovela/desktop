unit uDM;

interface

uses
  SysUtils, Classes, DB, DBTables, Windows, FileCtrl, ShellApi, Messages,
  Variants, Graphics, Controls, Forms, Dialogs, StdCtrls, general;

type
  TDM = class(TDataModule)
    db: TDatabase;
    tblOnlineParam: TQuery;
    dsOnlineParam: TDataSource;
    tblUsuariosNome: TQuery;
    tblUsuariosNomecodigo: TIntegerField;
    tblUsuariosNomenome: TStringField;
    tblUsuariosNomesenha: TStringField;
    tblUsuariosNomeonline: TStringField;
    tblModulosUsuarios: TQuery;
    tblModulosUsuarioscodigousuario: TIntegerField;
    tblModulosUsuarioscodigomodulo: TSmallintField;
    tblModulosUsuariosincluir: TStringField;
    tblModulosUsuariosalterar: TStringField;
    tblModulosUsuariosdeletar: TStringField;
    tblModulosUsuariosacessar: TStringField;
    tblModulosUsuariosespecial: TStringField;
    tblOnlineParamRest: TQuery;
    dsOnlineParamRest: TDataSource;
    tblOnlineParamds_variavel: TStringField;
    tblOnlineParamds_valor: TStringField;
    tblOnlineParamRestds_variavel: TStringField;
    tblOnlineParamRestds_valor: TStringField;
    tblUsuarios: TQuery;
    tblUsuarioscodigo: TIntegerField;
    tblUsuariosnome2: TStringField;
    tblUsuariossenha: TStringField;
    tblUsuariosonline: TStringField;
    dsParamRest: TDataSource;
    tblParamRest: TQuery;
    StringField1: TStringField;
    StringField2: TStringField;
    tblCenso_Cursos: TQuery;
    tblCenso_Resultado: TQuery;
    tblCenso_Quadros: TQuery;
    tblCenso_Campos: TQuery;
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
    qyAux: TQuery;
    procedure DataModuleCreate(Sender: TObject);
    procedure tblCenso_CamposNewRecord(DataSet: TDataSet);
  private
    { Private declarations }
  public
    { Public declarations }
    NomeEmpresa : String;   { Parametro }

    procedure CreateQuery(var qry: TQuery);

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
  if not DM.tblUsuariosNome.Prepared then DM.tblUsuariosNome.Prepare;
  DM.tblUsuariosNome.Open;

  Result := (DM.tblUsuariosNomeNome.AsString <> '');
end;

function TDM.FindUserCodigo(lng: Integer): Boolean;
begin
  DM.tblUsuarios.Close;
  DM.tblUsuarios.ParamByName('codigo').AsInteger := lng;
  if not DM.tblUsuarios.Prepared then DM.tblUsuarios.Prepare;
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
  sPrivateDir: string;
  sUsuario, sSenha : String;
begin
  try
     sUsuario := UMCrypt(iniWMestre.ReadString( 'Configuracoes', 'BancoUsuario', UsuarioBD ), ctDecode);
     sSenha   := UMCrypt(iniWMestre.ReadString( 'Configuracoes', 'BancoSenha', SenhaBD), ctDecode);

     db.Params.Clear();
     db.Params.Add('USER NAME=' + sUsuario);
     db.Params.Add('PASSWORD=' + sSenha);

     if not db.Connected then db.Open;
  except
      Mensagem('Não foi possível conectar com o banco de dados. Consulte o suporte do sistema.', 'Erro de Conexão', MB_OK + MB_ICONERROR);
      Application.Terminate;
      Exit;
  end;

  { Pegar os Parametros do Sistema }
  NomeEmpresa := DM.variavel_parametro('cliente_nome_fantasia');
  { Fim dos Parâmetros}
end;

procedure TDM.set_variavel_parametro(variavel, valor: string);
Var
   RS_VAR : TQuery;
begin

    CreateQuery(RS_VAR);

    RS_VAR.SQL.Text := 'UPDATE parametros SET ds_valor = :valor WHERE ds_variavel=:variavel';
    RS_VAR.ParamByName('valor').AsString := valor;
    RS_VAR.ParamByName('variavel').AsString := variavel;
    RS_VAR.ExecSQL;
end;

function TDM.variavel_parametro(variavel: string): string;
Var
   RS_VAR : TQuery;
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

procedure TDM.CreateQuery(var qry: TQuery);
begin
  qry := TQuery.Create(nil);
  qry.Name := 'Query';
  qry.DatabaseName := 'unimestre';
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
