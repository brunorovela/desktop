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
  Windows, Forms, Db, DBTables, Classes, Sysutils, Controls,
  General, Dialogs, Menus, DBCtrls, StdCtrls;

type
  TDM = class(TDataModule)
    qyUsuariosNome: TQuery;
    qyUsuariosNomeCodigo: TIntegerField;
    qyUsuariosNomeNome: TStringField;
    qyUsuariosNomeSenha: TStringField;
    qyUsuariosNomeOnLine: TStringField;
    tbModulos: TTable;
    tbModulosCodigo: TSmallintField;
    qyUsuarios: TQuery;
    qyUsuariosCodigo: TIntegerField;
    qyUsuariosNome2: TStringField;
    qyUsuariosSenha: TStringField;
    qyUsuariosOnLine: TStringField;
    qyAux: TQuery;
    qyMax: TQuery;
    qyFeriados: TQuery;
    qyFeriadosDataFeriado: TDateTimeField;
    qyFeriadosFeriado: TStringField;
    qyModulosUsuarios: TQuery;
    qyModulosUsuarioscodigousuario: TIntegerField;
    qyModulosUsuarioscodigomodulo: TSmallintField;
    qyModulosUsuariosincluir: TStringField;
    qyModulosUsuariosalterar: TStringField;
    qyModulosUsuariosdeletar: TStringField;
    qyModulosUsuariosacessar: TStringField;
    qyModulosUsuariosespecial: TStringField;
    qyLogs: TQuery;
    qyLogsAcessos: TQuery;
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
    qyTerminal1: TQuery;
    qyTerminal: TQuery;
    qyTerminal2: TQuery;
    qyRecalculoFreq: TQuery;
    qyAux2: TQuery;
    db: TDatabase;
    Session1: TSession;
    procedure DataModuleDestroy(Sender: TObject);
    procedure DataModuleCreate(Sender: TObject);
    procedure qyLogsAfterInsert(DataSet: TDataSet);
    procedure qyLogsAcessosAfterInsert(DataSet: TDataSet);
  private
    { Private declarations }
  public
    { Public declarations }

    flg: boolean;

    // Função para descobrir o valor do parâmetro tabelado
    function variavel_parametro(variavel : string) : string;
    // Funcão para setar o valor da variável
    procedure set_variavel_parametro(variavel : string; valor : string);

    // Procedure para descobrir quantidade de registros do DataSet passado
    // Para TQuery
    procedure quantidade_registros(DataSet: TQuery; Popup: TPopupMenu);

    // Procedure para descobrir quantidade de registros do DataSet passado
    // Para TTable
    procedure quantidade_registros_table(DataSet: TTable; Popup: TPopupMenu);

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

    // Função para retornar o próximo ID a ser utilizado
    Function incrementar_ano_semestre( valor : String ) : String;

    Function decrementar_ano_semestre( valor : String ) : String;

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

    Function DataAtual(): TDateTime;
    procedure CarregaParametros();
    function getParametro(sNome: string): string;

    procedure RecalcularFrequencia(bForcar: Boolean = False; sFiltro: string = '');
  end;
  TParam = record
    sNome: string[50];
    sValor: string;
  end;

var
  DM: TDM;
  Parametros: array of TParam;

implementation

uses Main, Math, uSplash, uFreq;

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
    Dm.qyAux.SQL.Text := 'UPDATE parametros SET ds_valor = ''' + valor + ''' WHERE ds_variavel=''' +  variavel + '''';
    Dm.qyAux.ExecSQL;

end;

// Função para descobrir quantidade de registros do DataSet passado
// Para TQuery
procedure TDM.quantidade_registros(DataSet: TQuery; Popup: TPopupMenu);
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
// Para TTable
procedure TDM.quantidade_registros_table(DataSet: TTable; Popup: TPopupMenu);
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
  if not DM.qyFeriados.Prepared then DM.qyFeriados.Prepare;
  DM.qyFeriados.Open;

  Result := (DM.qyFeriados.FieldByName('DataFeriado').AsDateTime <> 0);
end;

function TDM.FindUser(strUsu:String):Boolean;
begin
  DM.qyUsuariosNome.Close;
  DM.qyUsuariosNome.ParamByName('Nome').AsString := strUsu;
  if not DM.qyUsuariosNome.Prepared then DM.qyUsuariosNome.Prepare;
  DM.qyUsuariosNome.Open;

  Result := (DM.qyUsuariosNome.FieldByName('Nome').AsString <> '');
end;

function TDM.FindUserCodigo(lng:Longint):Boolean;
begin
  DM.qyUsuarios.Close;
  DM.qyUsuarios.ParamByName('Codigo').AsInteger := lng;
  if not DM.qyUsuarios.Prepared then DM.qyUsuarios.Prepare;
  DM.qyUsuarios.Open;

  Result := (DM.qyUsuarios.FieldByName('Codigo').AsInteger <> 0);
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


procedure TDM.DataModuleCreate(Sender: TObject);
var
  sPrivateDir: string;
begin
   sPrivateDir := ExtractTempDirectory();
   if not (DirectoryExists(sPrivateDir)) then begin
      sPrivateDir := strWindows;
   end;
  try
     Session1.Active := False;
     Session1.NetFileDir := ExtractFileDir(Application.ExeName);
     Session1.PrivateDir := sPrivateDir + FormatDateTime('yyyymmddhhnnss', Now);
     Session1.Active := True;

     if not db.Connected then db.Open;
  except
      Session1.Active := False;
      Mensagem('Não foi possível conectar com o banco de dados. Consulte o suporte do sistema.', 'Erro de Conexão', MB_OK + MB_ICONERROR);
      Application.Terminate;
      Exit;
  end;

  Screen.Cursor := crHourGlass;

  flg := False;

//  CalculoPoupanca;

  Screen.Cursor := crDefault;

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

procedure TDM.qyLogsAfterInsert(DataSet: TDataSet);
begin

  qyLogs.FieldByName('dt_log').AsDateTime := DataHoje;
  qyLogs.FieldByName('hr_log').AsDateTime := Time;
  qyLogs.FieldByName('cd_usuario').AsInteger := qyUsuariosNome.FieldByName('Codigo').AsInteger;

end;

procedure TDM.qyLogsAcessosAfterInsert(DataSet: TDataSet);
begin

  qyLogsAcessos.FieldByName('dt_log').AsDateTime := DataHoje;
  qyLogsAcessos.FieldByName('hr_log').AsDateTime := Time;
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


Function TDM.DataAtual(): TDateTime;
Begin
  qyAux.Close;
  qyAux.SQL.Clear;
  qyAux.SQL.Add('SELECT NOW() AS data');
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

      Dm.qyAux.SQL.Text := 'REPLACE INTO usuarios_parametros(cd_usuario,ds_parametro,ds_valor) VALUES('+qyUsuariosNome.FieldByName('Codigo').AsString+','''+Formulario.Name+'.'+TEdit(Formulario.components[n]).Name+''','''+TEdit(Formulario.components[n]).Text+''')';
      Dm.qyAux.ExecSQL;

    end
    else if ( Formulario.components[n].ClassType = TComboBox ) then
    begin

      Dm.qyAux.Close;
      Dm.qyAux.SQL.Clear;

      Dm.qyAux.SQL.Text := 'REPLACE INTO usuarios_parametros(cd_usuario,ds_parametro,ds_valor) VALUES('+qyUsuariosNome.FieldByName('Codigo').AsString+','''+Formulario.Name+'.'+TComboBox(Formulario.components[n]).Name+''','''+TComboBox(Formulario.components[n]).Text+''')';
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
//  db.Close();
//  Session1.Close();
//  Session.Close();
  //FreeAndNil(db);
  //FreeAndNil(Session1);
end;

function TDM.getParametro(sNome: string): string;
var
  i: Integer;
begin
  for i := Low(Parametros) to High(Parametros) do
  begin
    if Parametros[i].sNome = sNome then
    begin
      Result := Parametros[i].sValor;
      Exit;
    end;
  end;
end;

procedure TDM.CarregaParametros();
var
  i: Integer;
begin
  i := 0;

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
    '   cd_categoria = 12       '+
    'LIMIT 100                  '
    );
    Open();

    if not IsEmpty then
    begin
      First();
      while not DM.qyAux.Eof do
      begin
        SetLength(Parametros, i+1);
        Parametros[i].sNome := FieldByName('ds_variavel').AsString;
        Parametros[i].sValor := FieldByName('ds_valor').AsString;
        Inc(i);
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
