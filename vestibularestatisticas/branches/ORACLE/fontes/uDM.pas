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
  Windows, Forms, Db, DBTables, Classes, Sysutils, Controls, General, Dialogs,
  Menus, DBCtrls, StdCtrls,IniFiles, ZConnection, UZDataset, ZDataset,
  ZAbstractTable, ZAbstractRODataset, ZAbstractDataset, UZStartConnection,
  ZSqlMonitor, uIUMDataModule;

const
   DB_PROTOCOL_ORACLE = 'oracle';
   DB_PROTOCOL_MYSQL = 'mysql-5';

type
   TDataModule = class(AUMDataModule)
   end;

  TDM = class(TDataModule)
    db: TZConnection;
    qyUsuariosNome: TUMZQuery;
    qyUsuariosNomeCodigo: TIntegerField;
    qyUsuariosNomeNome: TStringField;
    qyUsuariosNomeSenha: TStringField;
    qyUsuariosNomeOnLine: TStringField;
    tbModulos: TZTable;
    tbModulosCodigo: TSmallintField;
    qyUsuarios: TUMZQuery;
    qyUsuariosCodigo: TIntegerField;
    qyUsuariosNome2: TStringField;
    qyUsuariosSenha: TStringField;
    qyUsuariosOnLine: TStringField;
    qyAux1: TUMZQuery;
    qyAux2: TUMZQuery;
    qyRS_VAR: TUMZQuery;
    qyMax: TUMZQuery;
    qyFeriados: TUMZQuery;
    qyFeriadosDataFeriado: TDateTimeField;
    qyFeriadosFeriado: TStringField;
    qyModulosUsuarios: TUMZQuery;
    qyModulosUsuarioscodigousuario: TIntegerField;
    qyModulosUsuarioscodigomodulo: TSmallintField;
    qyModulosUsuariosincluir: TStringField;
    qyModulosUsuariosalterar: TStringField;
    qyModulosUsuariosdeletar: TStringField;
    qyModulosUsuariosacessar: TStringField;
    qyModulosUsuariosespecial: TStringField;
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
    qyPessoas: TUMZQuery;
    qyPessoascd_pessoa: TIntegerField;
    qyPessoasnm_pessoa: TStringField;
    qyTiposPessoa: TUMZQuery;
    qyTiposPessoacd_tipo_pessoa: TIntegerField;
    qyTiposPessoads_tipo_pessoa: TStringField;
    qyTiposPessoads_observacao: TMemoField;
    srcTipoPessoa: TDataSource;
    qyAtividades: TUMZQuery;
    qyAtividadescd_atividade: TIntegerField;
    qyAtividadesnr_anosemestre: TIntegerField;
    qyAtividadescd_professor: TIntegerField;
    qyAtividadesds_atividade: TStringField;
    qyAtividadesds_observacao: TMemoField;
    qyPlanosDescontos: TUMZQuery;
    qyPlanosDescontosnr_anosemestre: TIntegerField;
    qyPlanosDescontosqt_atividades: TIntegerField;
    qyPlanosDescontosvl_percentual: TFloatField;
    qyPlanosDescontosvl_desconto: TFloatField;
    qyAtividadesValores: TUMZQuery;
    qyAtividadesValoresvl_atividade: TFloatField;
    qyAux3: TUMZQuery;
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
    procedure qyLogsAfterInsert(DataSet: TDataSet);
    procedure qyLogsAcessosAfterInsert(DataSet: TDataSet);
    function GetDB(): TZConnection; override;
  private
    { Private declarations }
      FDLLHandle: THandle;
      FDLLProc: procedure(Event: Pointer); stdcall;
      function IsDebugging: Boolean;
      function TryLoadDebugger: Boolean;
  public
    { Public declarations }

    flg: boolean;

    // Código da pessoa logada
    iCdPessoaLogado: Integer;
    strReports : String;

    // Função para descobrir o valor do parâmetro tabelado
    function variavel_parametro(variavel : string) : string;
    // Funcão para setar o valor da variável
    procedure set_variavel_parametro(variavel : string; valor : string);

    // Procedure para descobrir quantidade de registros do DataSet passado
    // Para TUMZQuery
    procedure quantidade_registros(DataSet: TUMZQuery; Popup: TPopupMenu);

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

    // Procedure para setar os parâmetros do usuário
    procedure Set_Parametros_usuario(Formulario: TForm);

    // Procedure para ler os parâmetros do usuário
    procedure Parametros_usuario(Formulario: TForm);

    // Função para retornar o próximo ID a ser utilizado
    Function ProximoId(campo, tabela: string): integer;

    // Função para retornar o próximo ID a ser utilizado (considerando relacionamento entre tabelas)
    Function ProximoId2(campo1, campo2, tabela: string; filtro: integer): integer;

    // Função para retornar o próximo ID a ser utilizado (Tendo uma chave de tres campos em que um deve variar)
    Function ProximoId3(campo, campo1, campo2, tabela, filtro1, filtro2: string): integer;

    Function incrementar_ano_semestre( valor : String ) : String;

    Function decrementar_ano_semestre( valor : String ) : String;

    // Procedure que atualiza o saldo do caixa informado na data informada
    Procedure AtualizaSaldo(caixa: integer; data: TDateTime; valor: Real);

    // Procedure que registra observações no campo informado
    Procedure RegistraObservacoes(campo: TField; Observacao: String);

    // Procedure para gravar LOGS
    Procedure gerar_log(cd_modulo,cd_titulo,cd_caixa,nr_sequencia: integer; dt_movimento: TDateTime);

    // Procedure para gravar LOGS de acessos
    Procedure gerar_log_acesso(cd_modulo: integer; sn_acessou,sn_incluiu,sn_alterou,sn_excluiu:string);

    // Procedure para mostrar o Log num Popup
    procedure MostraLog(cd_modulo,cd_titulo,cd_caixa,nr_sequencia: integer; dt_movimento: TDateTime; Popup: TPopupMenu);

    function NovoNumero(ADepto:Integer) : String;

    Function DataAtual(): TDateTime;

  end;

var
  DM: TDM;

implementation

uses Main, Math;

{$R *.dfm}

function TDM.variavel_parametro(variavel: string): string;
begin
    qyRS_VAR.close;
    qyRS_VAR.ParambyName('variavel').AsString:= variavel;
    qyRS_VAR.Open;

    if not qyRS_VAR.Eof Then
       result := qyRS_VAR.FieldByName('ds_valor').AsString
    else
       result := '';
end;

procedure TDM.set_variavel_parametro(variavel, valor: string);
begin

    Dm.qyAux1.Close;
    Dm.qyAux1.SQL.Clear;
    Dm.qyAux1.SQL.Text := 'UPDATE parametros SET ds_valor = ''' + valor + ''' WHERE ds_variavel=''' +  variavel + '''';
    Dm.qyAux1.ExecSQL;

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
      strPrograma := ConnIni.ReadString('Configuracoes', 'Programa', ExtractFilePath(ParamStr(0)));

      db.Protocol := ConnIni.ReadString('Conexao', 'Protocolo', 'mysql-5');
      db.Port := ConnIni.ReadInteger('Conexao', 'Porta', 3306);
      db.Database := ConnIni.ReadString('Conexao', 'Banco', 'unimestre');
      db.HostName := ConnIni.ReadString('Conexao', 'Servidor', 'localhost');
      db.User := ConnIni.ReadString('Conexao', 'Usuario', 'academico');
      db.Password := UMCrypt(ConnIni.ReadString('Conexao', 'Senha', 'C946E11A2BA225D2095C9F5683EF5590BF'), ctDecode);

      if db.Connected then
         db.Disconnect;

      try
         db.Connect;
      except
         raise;
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

procedure TDM.Set_Parametros_usuario(Formulario: TForm);
var
  n : LongInt ;
begin

  for n := 0 to ( Formulario.ComponentCount - 1 ) do
  begin
    if ( Formulario.components[n].ClassType = TEdit ) then
    begin

      Dm.qyAux1.Close;
      Dm.qyAux1.SQL.Clear;

      Dm.qyAux1.SQL.Text := 'REPLACE INTO usuarios_parametros(cd_usuario,ds_parametro,ds_valor) VALUES('+
         IntToStr(DM.GetUsuarioLogado.Pessoa.Codigo)+','''+
         Formulario.Name+
         '.'+
         TEdit(Formulario.components[n]).Name+
         ''','''+
         TEdit(Formulario.components[n]).Text+
         ''')';
         
      Dm.qyAux1.ExecSQL;

    end
    else if ( Formulario.components[n].ClassType = TComboBox ) then
    begin

      Dm.qyAux1.Close;
      Dm.qyAux1.SQL.Clear;

      Dm.qyAux1.SQL.Text := 'REPLACE INTO usuarios_parametros(cd_usuario,ds_parametro,ds_valor) VALUES('+
         IntToStr(DM.GetUsuarioLogado.Pessoa.Codigo)+
         ','''+
         Formulario.Name+
         '.'+
         TComboBox(Formulario.components[n]).Name+
         ''','''+
         TComboBox(Formulario.components[n]).Text+
         ''')';
         
      Dm.qyAux1.ExecSQL;

    end;
  end ;

end;

procedure TDM.Parametros_usuario(Formulario: TForm);
var
  n : LongInt ;
begin

  Dm.qyAux1.Close;
  Dm.qyAux1.SQL.Clear;
  Dm.qyAux1.SQL.Text := 'SELECT ds_valor FROM usuarios_parametros WHERE cd_usuario = :cd_usuario AND ds_parametro = :ds_parametro';
  DM.qyAux1.ParamByName('cd_usuario').AsInteger := qyUsuariosNome.FieldByName('Codigo').AsInteger;

  for n := 0 to ( Formulario.ComponentCount - 1 ) do
  begin

    if ( Formulario.components[n].ClassType = TEdit ) then
    begin
      DM.qyAux1.ParamByName('ds_parametro').AsString := Formulario.Name+'.'+TEdit(Formulario.components[n]).Name;
      Dm.qyAux1.Open;

      if not DM.qyAux1.Eof then
        TEdit(Formulario.components[n]).Text := DM.qyAux1.FieldByName('ds_valor').AsString;
    end
    else if ( Formulario.components[n].ClassType = TComboBox ) then
    begin
      DM.qyAux1.ParamByName('ds_parametro').AsString := Formulario.Name+'.'+TComboBox(Formulario.components[n]).Name;
      Dm.qyAux1.Open;

      if not DM.qyAux1.Eof then
        TComboBox(Formulario.components[n]).Text := DM.qyAux1.FieldByName('ds_valor').AsString;
    end;
  DM.qyAux1.Close;
  end ;

end;

procedure TDM.DataModuleCreate(Sender: TObject);
const
   SDefRepPath = 'C:' + PathDelim + 'unimestre' + PathDelim + 'relatorios' + PathDelim;
var
   IniPath: TFileName;
   ConnIni: TIniFile;
begin
   sqlMonitor.Active := IsDebugging and TryLoadDebugger;
   IniPath := Format('%sunimestre.ini', [ExtractFilePath(ParamStr(0))]);
   ConnIni := TIniFile.Create(IniPath);
   strReports := ConnIni.ReadString('Configuracoes', 'Relatorios', SDefRepPath);
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
         raise;
      end;
   finally
      ConnIni.Free;
   end;
   flg := False;
end;

procedure TDM.DataModuleDestroy(Sender: TObject);
begin
   @FDLLProc := nil;
   FreeLibrary(FDLLHandle);
end;

function TDM.ExisteRegistro(tabela: string; campo: string; valor: string):Boolean;
begin

  if valor = '' then
    valor := '0';

  DM.qyAux1.Close;
  DM.qyAux1.SQL.Clear;
  DM.qyAux1.SQL.Add('SELECT COUNT(*) as qtde FROM '+tabela+' WHERE '+campo+' = '+valor);
  DM.qyAux1.Open;

  if DM.qyAux1.FieldByName('qtde').AsInteger > 0 then
    Result := True
   else
    Result := False;

end;

Function TDM.ProximoId(campo, tabela: string): integer;
begin

  qyAux1.Close;
  qyAux1.SQL.Clear;
  qyAux1.SQL.Add('SELECT MAX('+campo+') AS id FROM '+tabela);
  qyAux1.Open;

  Result := qyAux1.FieldByName('id').AsInteger + 1;

  qyAux1.Close;

end;

Function TDM.ProximoId2(campo1, campo2, tabela: string; filtro: integer): integer;
begin

  qyAux1.Close;
  qyAux1.SQL.Clear;
  qyAux1.SQL.Add('SELECT MAX('+campo1+') AS id FROM '+tabela+' WHERE '+campo2+' = '+IntToStr(filtro));
  qyAux1.Open;

  Result := qyAux1.FieldByName('id').AsInteger + 1;

  qyAux1.Close;

end;

Function TDM.ProximoId3(campo, campo1, campo2, tabela, filtro1, filtro2: string): integer;
begin

  qyAux1.Close;
  qyAux1.SQL.Clear;
  qyAux1.SQL.Add('SELECT MAX('+campo+') AS id FROM '+tabela+' WHERE '+campo1+' = :filtro1 AND '+campo2+' = :filtro2');
  qyAux1.ParamByName('filtro1').AsString := filtro1;
  qyAux1.ParamByName('filtro2').AsString := filtro2;
  qyAux1.Open;

  Result := qyAux1.FieldByName('id').AsInteger + 1;

  qyAux1.Close;

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



Procedure TDM.AtualizaSaldo(caixa: integer; data: TDateTime; valor: Real);
begin

  DM.qyAux1.Close;
  DM.qyAux1.SQL.Clear;
  DM.qyAux1.SQL.Add('SELECT vl_saldo, dt_saldo FROM saldos_contas WHERE cd_caixa = :cd_caixa ORDER BY dt_saldo DESC');
  DM.qyAux1.ParamByName('cd_caixa').AsInteger := caixa;
  DM.qyAux1.Open;

  if FormatDateTime('yyyy-mm-dd', DM.qyAux1.FieldByName('dt_saldo').AsDateTime) <> FormatDateTime('yyyy-mm-dd', DataHoje) then
  begin
    DM.qyAux2.Close;
    DM.qyAux2.SQL.Clear;
    DM.qyAux2.SQL.Add('INSERT INTO saldos_contas VALUES(:cd_caixa,:dt_saldo,:vl_saldo)');
    DM.qyAux2.ParamByName('cd_caixa').AsInteger := caixa;
    DM.qyAux2.ParamByName('dt_saldo').AsString := FormatDateTime('yyyy-MM-dd',data);
    DM.qyAux2.ParamByName('vl_saldo').AsFloat := DM.qyAux1.FieldByName('vl_saldo').AsFloat - valor;
    DM.qyAux2.ExecSQL;
  end
  else
  begin
    DM.qyAux2.Close;
    DM.qyAux2.SQL.Clear;
    DM.qyAux2.SQL.Add('UPDATE saldos_contas SET vl_saldo = :vl_saldo WHERE cd_caixa = :cd_caixa AND dt_saldo = :dt_saldo');
    DM.qyAux2.ParamByName('cd_caixa').AsInteger := caixa;
    DM.qyAux2.ParamByName('dt_saldo').AsString := FormatDateTime('yyyy-MM-dd',data);
    DM.qyAux2.ParamByName('vl_saldo').AsFloat := DM.qyAux1.FieldByName('vl_saldo').AsFloat - valor;
    DM.qyAux2.ExecSQL;
  end;

end;

Procedure TDM.RegistraObservacoes(campo: TField; Observacao: String);
begin

  campo.AsString := campo.AsString + CHR(13) + '==============================================' + CHR(13) + Observacao + CHR(13) + '--------------------------------------------------------' + CHR(13) + 'DATA: ' + DateTimeToStr(DataHoje) + '  USUÁRIO: ' + DM.qyUsuariosNome.FieldByName('Nome').AsString;

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

function TDM.GetDB: TZConnection;
begin
   Result := Self.db;
end;

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

  DM.qyAux1.Close;
  DM.qyAux1.SQL.Clear;
  DM.qyAux1.SQL.Add('SELECT                                 ');
  DM.qyAux1.SQL.Add('	u.nome,                               ');
  DM.qyAux1.SQL.Add('	l.dt_log,                             ');
  DM.qyAux1.SQL.Add('	l.hr_log                              ');
  DM.qyAux1.SQL.Add('FROM                                   ');
  DM.qyAux1.SQL.Add('	logs_financeiro l,                    ');
  DM.qyAux1.SQL.Add('	usuarios u                            ');
  DM.qyAux1.SQL.Add('WHERE                                  ');
  DM.qyAux1.SQL.Add('	(u.codigo = l.cd_usuario) AND (       ');
  DM.qyAux1.SQL.Add('	(l.cd_modulo = :cd_modulo) AND (      ');
  DM.qyAux1.SQL.Add('	(                                     ');
  DM.qyAux1.SQL.Add('	l.cd_caixa = :cd_caixa AND            ');
  DM.qyAux1.SQL.Add('	l.dt_movimento = :dt_movimento AND    ');
  DM.qyAux1.SQL.Add('	l.nr_sequencia = :nr_sequencia        ');
  DM.qyAux1.SQL.Add('	) OR (                                ');
  DM.qyAux1.SQL.Add('	l.cd_titulo = :cd_titulo AND          ');
  DM.qyAux1.SQL.Add('	l.nr_sequencia = :nr_sequencia        ');
  DM.qyAux1.SQL.Add('	)))                                   ');
  DM.qyAux1.ParamByName('cd_modulo').AsInteger := cd_modulo;
  DM.qyAux1.ParamByName('cd_titulo').AsInteger := cd_titulo;
  DM.qyAux1.ParamByName('cd_caixa').AsInteger := cd_caixa;
  DM.qyAux1.ParamByName('nr_sequencia').AsInteger := nr_sequencia;
  DM.qyAux1.ParamByName('dt_movimento').AsString := FormatDateTime('yyyy-mm-dd', dt_movimento);
  DM.qyAux1.Open;

  if not DM.qyAux1.eof then
  begin
    Item := TMenuItem.Create(self);
    Item.Caption := 'Usuário: ' + DM.qyAux1.FieldByName('nome').AsString;
    Popup.Items.Add(Item);
    Item := TMenuItem.Create(self);
    Item.Caption := 'Data: ' + DM.qyAux1.FieldByName('dt_log').AsString;
    Popup.Items.Add(Item);
    Item := TMenuItem.Create(self);
    Item.Caption := 'Hora: ' + DM.qyAux1.FieldByName('hr_log').AsString;
    Popup.Items.Add(Item);
  end;

end;

function TDM.NovoNumero(ADepto:Integer) : String;
var
  lngAux : Longint;
  strAux : String;
begin
    lngAux := StrToInt(DM.variavel_parametro('nosso_numero_ultimo'));
    Dm.set_variavel_parametro('nosso_numero_ultimo', IntToStr(lngAux + 1 ));

{    strAux := Format( '%.7d', [ StrToInt( DM.variavel_parametro('nosso_numero_prefixo') + IntToStr(lngAux) )] );

    strAux := strAux + DV11(strAux, 'NN', '291');

    }

    strAux := DM.variavel_parametro('nosso_numero_prefixo') + Format('%.8d', [lngAux]);

    Result := strAux;
end;

Function TDM.DataAtual(): TDateTime;
Begin
  qyAux1.Close;
  qyAux1.SQL.Clear;
  qyAux1.SQL.Add('SELECT NOW() AS data');
  qyAux1.Open;

  Result := qyAux1.FieldByName( 'data' ).AsDateTime;
End;

end.
