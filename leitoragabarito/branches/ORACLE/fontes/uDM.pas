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
  General, ZAbstractRODataset, ZAbstractDataset, ZDataset, UZDataset, Dialogs,
  Menus, DBCtrls, StdCtrls, Mask,
  ZAbstractTable, IniFiles, UZStartConnection, ZSqlMonitor,
  uIUMDataModule, uUsuario, md5, uLKJson, ZDbcIntfs, ZCompatibility, Variants;

type
   TTipoLog = (tlAcesso = 1, tlInclusao, tlAlteracao, tlExclusao, tlBaixa, tlEstorno);

   TNota = record
      vl_nota: Double;
      IsNull: Boolean;
   end;  

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
    qyAux2: TUMZQuery;
    qyAux3: TUMZQuery;
    qyAux4: TUMZQuery;
    qyAux5: TUMZQuery;
    qyAlunosRespostasSituacoes: TUMZQuery;
    qyAlunosRespostasSituacoescd_situacao: TSmallintField;
    qyAlunosRespostasSituacoesds_situacao: TStringField;
    qyLastInsert: TUMZQuery;
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
    startConn: TUMZStartConnection;
    sqlMonitor: TZSQLMonitor;
    qryInsertAlunoProva: TUMZQuery;
    procedure sqlMonitorLogTrace(Sender: TObject; Event: TZLoggingEvent);
    procedure startConnDefaultConnection(Sender: TObject);
    procedure DataModuleDestroy(Sender: TObject);
    procedure DataModuleCreate(Sender: TObject);
    procedure qyLogsAfterInsert(DataSet: TDataSet);
    procedure qyLogsAcessosAfterInsert(DataSet: TDataSet);
    function GetDB() : TZConnection; override;
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
    UsuarioLogado : TUsuario;
    flg: boolean;
    iGabaritoAtual : integer;

    // Parâmetros da leitora(para não precisar ficar capturando da base cada vez que for necessário)
    iClocksIdenti : integer;

    aClocksIdentiOpcoesAltern : array of string;
    aClocksIdentiOpcoesQuanti : array of integer;

    iClocksResposQuanti : integer;
    iClocksResposGrupo : integer;

    aClocksResposConfigInicio : array of integer;
    aClocksResposConfigQuanti : array of integer;

    sUltimoCodigo : string;
    sUltimoCodigoTeste : string;

    sRelatoriosGabaritos : string;

    sProgramaLeitora : string;
    sProgramaLeitoraArquivo : string;
    iProgramaLeitoraBits : integer;
    aArquivoLayout : array of string;

    bSomatoriasParciais : Boolean;
    sSomatoriasParciaisTipo : String;

    sSomatoriasFormula : String;
    sSomatoriasCondicaoZero : String;

    { Calculo de Média Automático, pega o parâmetro de avaliação da turma passada por parâmetro,
        e verifica se deve ser calculado a média }
      procedure CalcularMediaAutomaticamente( const nr_anosemestre: Integer;
         const cd_turma: String; const cd_disciplina, nr_etapa, cd_grupo, cd_pessoa: Integer );

    // Função para descobrir o valor do parâmetro tabelado
    function variavel_parametro(variavel : string; cd_coligada: Integer = -1) : string;
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

    // Função para retornar o próximo ID a ser utilizado
    Function incrementar_ano_semestre( valor : String ) : String;

    Function decrementar_ano_semestre( valor : String ) : String;

    // Cria UMZQuery
    Procedure CriarConsulta( var query: TUMZQuery ); overload;
    Procedure CriarConsulta( var query: TUMZReadOnlyQuery ); overload;

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

    // Função que retorna um código equivalente para o aluno
    Function getCodigoEquivalente(): string;

    procedure ConfiguraParametros();

    function VerificaNumero(sResposta: string): Boolean;
    function VerificaString(sResposta: string): Boolean;
    Function ValidaResposta( sResposta : string ): boolean;

    function CabecalhoCampos(iCodCabecalho: LongInt): string;

    function CabecalhoParamFixos(): TStringList;

    function DecompoeNumero(iResposta:integer):string;

    function VerificaeNumero(sValor:string):boolean;

    function GeraLeitoraDisciplinas(cd_prova: integer; cd_prova_aluno: integer): Boolean;

    function GetParametroAvaliacao( const nr_anosemestre: Integer;
            const cd_turma: String; const cd_disciplina: String; const campo: String; const condicao_in: Boolean = False ): String;
    function GetInformacaoDiarioTurma( const nr_anosemestre: Integer; const cd_turma: String;
            const cd_disciplina, nr_etapa: Integer; const campo: String ): String;

    procedure inserirAlunosDisciplina(iAnosemestre: Integer; sTurma: string; iDisciplina, iBimestre: Integer);

    procedure atribuiNotaProvaDisciplinaFrente(iAnosemestre: Integer; sTurma: string; iDisciplina, iBimestre, iCdAvaliacaoTipo,
            iCdPessoa: Integer; rNota: TNota);

    function getSomaNotasProvasMesmoTipo(iAnosemestre: Integer; sTurma: string; iDisciplina, iBimestre, iCdAvaliacaoTipo, iCdPessoa: Integer): TNota;

    function getDisciplinasFazemFrente(iAnosemestre: Integer; sTurma: string; iDisciplina: Integer): TStringList;
    function getTipoAvaliacao(iAnosemestre: Integer; sTurma: string; iDisciplina, iBimestre, iNrProva: Integer): Integer;

    function getDisciplinaFrente(iDisciplina, iAnosemestre: Integer; sTurma: string): Integer;

      ///   <summary>Transforma o conjunto de dados recebido como parâmetro
      ///   em um vetor de objetos JSON, cada objeto representando um registro
      ///   do conjunto de dados.
      ///   </summary>
      ///
      ///   <param name="DataSet">Objeto do tipo <c>TDataSet</c> contendo o
      ///   conjunto de dados que será convertido para o formato JSON.
      ///   </param>
      ///
      ///   <returns>Retorna um objeto do tipo <c>TlkJSONlist</c> que representa
      ///   um vetor de objetos JSON, cada objeto representando um registro do
      ///   conjunto de dados.
      ///   </returns>
      function DataSetToJSON(DataSet: TDataSet): TlkJSONlist; overload;

      ///   <summary>Transforma o conjunto de dados recebido como parâmetro
      ///   em um vetor de objetos JSON, cada objeto representando um registro
      ///   do conjunto de dados.
      ///   </summary>
      ///
      ///   <param name="ResultSet">Objeto do tipo <c>IZResultSet</c> contendo
      ///   o conjunto de dados que será convertido para o formato JSON.
      ///   </param>
      ///
      ///   <returns>Retorna um objeto do tipo <c>TlkJSONlist</c> que representa
      ///   um vetor de objetos JSON, cada objeto representando um registro do
      ///   conjunto de dados.
      ///   </returns>
      function DataSetToJSON(ResultSet: IZResultSet): TlkJSONlist; overload;

      ///   <summary>Transforma o registro do ponteiro corrente de um conjunto
      ///   de dados em um objeto JSON, cada campo do registro sendo
      ///   representado por um atributo desse objeto.
      ///   </summary>
      ///
      ///   <param name="DataSet">Objeto do tipo <c>TDataSet</c> apontando para
      ///   o registro que deseja-se transformar em um objeto JSON.
      ///   </param>
      ///
      ///   <returns>Retorna um objeto do tipo <c>TlkJSONobject</c>, uma
      ///   representação JSON do registro corrente do conjunto de dados
      ///   recebido como parâmetro pelo método.
      ///   </returns>
      function RecordToJSON(DataSet: TDataSet): TlkJSONobject; overload;

      ///   <summary>Transforma o regitrso do ponteito corrente de um conjunto
      ///   de dados em um objeto JSON, cada campo do registro sendo
      ///   representado por um atributo desse objeto.
      ///   </summary>
      ///
      ///   <param name="ResultSet">Objeto do tipo <c>IZResultSet</c>
      ///   apontando para o registro atual que deseja-se transformar em um
      ///   objeto JSON.
      ///   </param>
      ///
      ///   <returns>Retorna um objeto do tipo <c>TlkJSONobject</c>, uma
      ///   representação JSON do registro corrente do conjunto de dados
      ///   recebido como parâmetro pelo método.
      ///   </returns>
      function RecordToJSON(ResultSet: IZResultSet): TlkJSONobject; overload;

      ///   <summary>Tranforma o registro do ponteiro corrente de um conjunto
      ///   de dados em um objeto JSON, usando os valores anteriores do
      ///   registro. Cada campo do registro é representado por um
      ///   atributo no objeto JSON.
      ///   </summary>
      ///
      ///   <param name="DataSet">Objeto do tipo <c>TDataSet</c> apontando para
      ///   o registro atual que deseja-se tranformar em um objeto JSON.
      ///   </param>
      ///
      ///   <returns>Retorna um objeto do tipo <c>TlkJSONobject</c>, uma
      ///   representação JSON dos valores anteriores do registro corrente do
      ///   conjunto de dados recebido como parâmetro.
      ///   </returns>
      function OldRecordToJSON(DataSet: TDataSet): TlkJSONobject;

      ///   <summary>Registro um <i>log</i> de operação na tabela
      ///   <c>log_geral</c> do banco de dados do Unimestre.
      ///   </summary>
      ///
      ///   <param name="ModuloID">Código de identificação do módulo no qual o
      ///   usuário está realizando a operação.
      ///   </param>
      ///   <param name="Chave">Chave de identificação do registro em questão.
      ///   </param>
      ///   <param name="Obs">Dados do registro no banco de dados que está
      ///   sofrendo ação do usuário.
      ///   </param>
      ///   <param name="TipoLog">Tipo da operação realizada pelo usuário.
      ///   </param>
      procedure Log(const ModuloID: Integer; const Chave, Obs: AnsiString;
         const TipoLog: TTipoLog);

    property ColigadaSelecionada: Integer read FColigadaSelecionada write FColigadaSelecionada default 0;
    property ListaColigadas: TStringList read FListaColigadas write FListaColigadas default nil;

  end;

var
  DM: TDM;
  slPFixos: TStringList;

implementation

uses Main, Math, uRegExpr;

{$R *.dfm}

function TDM.variavel_parametro(variavel: string; cd_coligada: Integer = -1): string;
const
   SQL_GET_PARAMETRO = ' SELECT CASE WHEN COUNT(ds_valor) = 1 THEN ' +
                       '           ds_valor ' +
                       '        ELSE ' +
                       '           (SELECT ds_valor FROM parametros WHERE ds_variavel = :variavel AND cd_coligada = 0) ' +
                       '        END AS ds_valor ' +
                       ' FROM parametros ' +
                       ' WHERE ds_variavel = :variavel AND ' +
                       '       cd_coligada = :cd_coligada ';
var
   qyAuxParametro: TUMZQuery;
begin
   DM.CriarConsulta(qyAuxParametro);

   qyAuxParametro.Close;
   qyAuxParametro.SQL.Text := SQL_GET_PARAMETRO;

   qyAuxParametro.ParambyName('variavel').AsString:= variavel;
   if (cd_coligada <> -1) then
      qyAuxParametro.ParamByName('cd_coligada').AsInteger := cd_coligada
   else
       qyAuxParametro.ParamByName('cd_coligada').AsInteger := ColigadaSelecionada;

   qyAuxParametro.Open;

   if not (qyAuxParametro.IsEmpty) then
   begin
     Result := qyAuxParametro.FieldByName('ds_valor').AsString;
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

procedure TDM.sqlMonitorLogTrace(Sender: TObject; Event: TZLoggingEvent);
begin
   FDllProc(Pointer(Event));
end;

procedure TDM.startConnDefaultConnection(Sender: TObject);
var
   IniPath: TFileName;
   ConnIni: TIniFile;
begin
   IniPath := Format('%s%sunimestre.ini', [ExtractFilePath(ParamStr(0)), PathDelim]);
   
   ConnIni := TIniFile.Create(IniPath);
   try
      db.HostName := ConnIni.ReadString('Conexao', 'Servidor', 'localhost');
      db.Database := ConnIni.ReadString('Conexao', 'Banco', 'unimestre');
      db.User := ConnIni.ReadString('Conexao', 'Usuario', 'academico');
      db.Password := UMCrypt(ConnIni.ReadString('Conexao', 'Senha', 'C946E11A2BA225D2095C9F5683EF5590BF'), ctDecode);
      db.Port := ConnIni.ReadInteger('Conexao', 'Porta', 3306);
      db.Protocol := ConnIni.ReadString('Conexao', 'Protocolo', 'mysql-5');
      
      try
         if not db.Connected then db.Connect;
      except
         on E: EZDatabaseError do
         begin
            MessageDlg('Não foi possível conectar com o banco de dados. Consulte o suporte do sistema.', mtError, [mbOK], 0);
            Application.Terminate;
            Application.ProcessMessages;
         end;
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

procedure TDM.Log(const ModuloID: Integer; const Chave, Obs: AnsiString;
  const TipoLog: TTipoLog);
const
   SSQLInsertLog = 'INSERT INTO `LOG_GERAL` (`CD_PESSOA`, `DT_LOG`, `CD_MODULO`, `CD_CHAVE`, `CD_OPERACAO`, `CD_COLIGADA`, `DS_OBSERVACOES`) VALUES (?, CURRENT_TIMESTAMP, ?, ?, ?, ?, ?)';
var
   Stmt: IZPreparedStatement;
begin
   Stmt := db.DbcConnection.PrepareStatement(SSQLInsertLog);
   try
      Stmt.SetInt(1, GetUsuarioLogado.Pessoa.Codigo);
      Stmt.SetInt(2, ModuloID);
      Stmt.SetString(3, Chave);
      Stmt.SetInt(4, Ord(TipoLog));
      Stmt.SetInt(5, GetUsuarioLogado.ColigadaLogada);
      Stmt.SetString(6, Obs);
      Stmt.ExecutePrepared;
   finally
      Stmt.Close;
   end;
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

procedure TDM.DataModuleCreate(Sender: TObject);
const
   SDefAppPath = 'C:' + PathDelim + 'unimestre' + PathDelim + 'programas' + PathDelim;
   SDefRepPath = 'C:' + PathDelim + 'unimestre' + PathDelim + 'relatorios' + PathDelim;
var
   IniPath: TFileName;
   ConnIni: TIniFile;
begin
   IniPath := Format('%s%sunimestre.ini', [ExtractFilePath(ParamStr(0)), PathDelim]);

   sqlMonitor.Active := IsDebugging and TryLoadDebugger;

   ConnIni := TIniFile.Create(IniPath);
   try
      startConn.IniPath := IniPath;
      startConn.Active := ConnIni.ReadBool('Conexao', 'Usa.Start', False);
      strPrograma := ConnIni.ReadString('Configuracoes', 'Programa', SDefAppPath);
      strReports := ConnIni.ReadString('Configuracoes', 'Relatorios', SDefRepPath);


      if startConn.Active then
      begin
         startConn.UnimestreUser := 'umsistema';
      end;

      try
         startConn.ConnectUnimestre;
      except
         on E: EUMZDatabaseError do raise;
      end;
   finally
      ConnIni.Free;
   end;
   
   // Pega o diretório dos programas do Unimestre e o diretório de
   // armazenamento dos relatórios configurados no arquivo wmestre.ini
   


   // Pega o diretório de instalação do sistema operacional
   
   pWindows := StrAlloc(144);
   GetWindowsDirectory(pWindows, 144);
   strWindows := StrPas(pWindows);
   StrDispose(pWindows);

   flg := False;
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
  qyLogs.FieldByName('cd_usuario').AsInteger := DM.GetUsuarioLogado.Pessoa.Codigo;

end;

function TDM.RecordToJSON(ResultSet: IZResultSet): TlkJSONobject;
var
   I, ColumnCount: Integer;
   Metadata: IZResultSetMetadata;
   ColumnType: TZSQLType;
   ColumnName, S: AnsiString;
   ByteArray: TByteDynArray;
   Stream: TStream;
   StringStream: TStringStream;
begin
   Result := TlkJSONobject.Create(False);
   Metadata := ResultSet.GetMetadata;
   try
      ColumnCount := Metadata.GetColumnCount;

      for I := 1 to ColumnCount do
      begin
         ColumnName := Metadata.GetColumnName(I);
         ColumnType := Metadata.GetColumnType(I);

         case ColumnType of
            stBoolean:
               Result.Add(ColumnName, ResultSet.GetBoolean(I));
            stByte:
               Result.Add(ColumnName, ResultSet.GetByte(I));
            stShort:
               Result.Add(ColumnName, ResultSet.GetShort(I));
            stInteger:
               Result.Add(ColumnName, ResultSet.GetInt(I));
            stLong:
               Result.Add(ColumnName, ResultSet.GetLong(I));
            stFloat:
               Result.Add(ColumnName, ResultSet.GetFloat(I));
            stDouble:
               Result.Add(ColumnName, ResultSet.GetDouble(I));
            stBigDecimal:
               Result.Add(ColumnName, ResultSet.GetBigDecimal(I));
            stString, stUnknown:
               Result.Add(ColumnName, ResultSet.GetString(I));
            stUnicodeString:
               Result.Add(ColumnName, ResultSet.GetUnicodeString(I));
            stBytes:
               begin
                  ByteArray := ResultSet.GetBytes(I);
                  SetString(S, PAnsiChar(@ByteArray[0]), Length(ByteArray));
                  Result.Add(ColumnName, MD5Print(MD5String(S)));
               end;
            stDate:
               Result.Add(ColumnName, ResultSet.GetDate(I));
            stTime:
               Result.Add(ColumnName, ResultSet.GetTime(I));
            stTimestamp:
               Result.Add(ColumnName, ResultSet.GetTimestamp(I));
            stAsciiStream, stUnicodeStream, stBinaryStream:
               begin
               
                  if ColumnType = stAsciiStream then
                     Stream := ResultSet.GetAsciiStream(I);

                  if ColumnType = stUnicodeStream then
                     Stream := ResultSet.GetUnicodeStream(I);

                  if ColumnType = stBinaryStream then
                     Stream := ResultSet.GetBinaryStream(I);
                     
                  try
                     StringStream := TStringStream.Create('');
                     try
                        StringStream.CopyFrom(Stream, Stream.Size);
                        S := StringStream.DataString;
                        Result.Add(ColumnName, MD5Print(MD5String(S)));
                     finally
                        StringStream.Free;
                        StringStream := nil;
                     end;
                  finally
                     Stream := nil;
                  end;
               end;
         end;
      end;
   finally
      Metadata := nil;
   end;
end;

function TDM.RecordToJSON(DataSet: TDataSet): TlkJSONobject;
var
   I: Integer;
   Field: TField;
begin
   Result := TlkJSONobject.Create(False);
   for I := 0 to DataSet.FieldCount - 1 do
   begin
      Field := DataSet.Fields[I];
      case Field.DataType of
         ftUnknown, ftString, ftDate, ftTime, ftDateTime, ftMemo,
         ftWideString, ftVariant, ftTimeStamp, ftFixedWideChar, ftWideMemo:
            Result.Add(Field.FieldName, Field.AsString);
         ftSmallint, ftInteger, ftWord, ftLargeint:
            Result.Add(Field.FieldName, Field.AsInteger);
         ftBoolean:
            Result.Add(Field.FieldName, Field.AsBoolean);
         ftFloat:
            Result.Add(Field.FieldName, Field.AsFloat);
         ftCurrency:
            Result.Add(Field.FieldName, Field.AsCurrency);
         ftBlob, ftOraBlob:
            Result.Add(Field.FieldName, MD5Print(MD5String(Field.AsString)));
      end;
   end;
end;

procedure TDM.qyLogsAcessosAfterInsert(DataSet: TDataSet);
begin

  qyLogsAcessos.FieldByName('dt_log').AsDateTime := DataHoje;
  qyLogsAcessos.FieldByName('hr_log').AsDateTime := Time;
  qyLogsAcessos.FieldByName('cd_usuario').AsInteger := DM.GetUsuarioLogado.Pessoa.Codigo;

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


function TDM.OldRecordToJSON(DataSet: TDataSet): TlkJSONobject;
var
   I, N: Integer;
   Field: TField;
   S: AnsiString;
   B: Boolean;
   D: Double;
   C: Currency;
begin
   Result := TlkJSONobject.Create(False);
   for I := 0 to DataSet.FieldCount - 1 do
   begin
      Field := DataSet.Fields[I];

      if Field.OldValue = Null then
      begin
         Result.Add(Field.FieldName, TlkJSONnull.Create);
      end;

      if Field.OldValue <> Null then
         case Field.DataType of
            ftUnknown, ftString, ftDate, ftTime, ftDateTime, ftMemo,
            ftWideString, ftVariant, ftTimeStamp, ftFixedWideChar, ftWideMemo:
               begin
                  S := Field.OldValue;
                  Result.Add(Field.FieldName, S);
               end;
            ftSmallint, ftInteger, ftWord, ftLargeint:
               begin
                  N := Field.OldValue;
                  Result.Add(Field.FieldName, N);
               end;
            ftBoolean:
               begin
                  B := Field.OldValue;
                  Result.Add(Field.FieldName, B);
               end;
            ftFloat:
               begin
                  D := Field.OldValue;
                  Result.Add(Field.FieldName, D);
               end;
            ftCurrency:
               begin
                  C := Field.OldValue;
                  Result.Add(Field.FieldName, C);
               end;
            ftBlob, ftOraBlob:
               begin
                  S := Field.OldValue;
                  Result.Add(Field.FieldName, MD5Print(MD5String(S)));
               end;
         end;
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

      Dm.qyAux.SQL.Text := 'REPLACE INTO usuarios_parametros(cd_usuario,ds_parametro,ds_valor) VALUES('+IntToStr(DM.GetUsuarioLogado.Pessoa.Codigo)+','''+Formulario.Name+'.'+TEdit(Formulario.components[n]).Name+''','''+TEdit(Formulario.components[n]).Text+''')';
      Dm.qyAux.ExecSQL;

    end
    else  if ( Formulario.components[n].ClassType = TMaskEdit ) then
    begin

      Dm.qyAux.Close;
      Dm.qyAux.SQL.Clear;

      Dm.qyAux.SQL.Text := 'REPLACE INTO usuarios_parametros(cd_usuario,ds_parametro,ds_valor) VALUES('+IntToStr(DM.GetUsuarioLogado.Pessoa.Codigo)+','''+Formulario.Name+'.'+TMaskEdit(Formulario.components[n]).Name+''','''+TMaskEdit(Formulario.components[n]).Text+''')';
      Dm.qyAux.ExecSQL;

    end
    else if ( Formulario.components[n].ClassType = TComboBox ) then
    begin

      Dm.qyAux.Close;
      Dm.qyAux.SQL.Clear;

      Dm.qyAux.SQL.Text := 'REPLACE INTO usuarios_parametros(cd_usuario,ds_parametro,ds_valor) VALUES('+IntToStr(DM.GetUsuarioLogado.Pessoa.Codigo)+','''+Formulario.Name+'.'+TComboBox(Formulario.components[n]).Name+''','''+TComboBox(Formulario.components[n]).Text+''')';
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
  DM.qyAux.ParamByName('cd_usuario').AsInteger := DM.GetUsuarioLogado.Pessoa.Codigo;

  for n := 0 to ( Formulario.ComponentCount - 1 ) do
  begin

    if ( Formulario.components[n].ClassType = TEdit ) then
    begin
      DM.qyAux.ParamByName('ds_parametro').AsString := Formulario.Name+'.'+TEdit(Formulario.components[n]).Name;
      Dm.qyAux.Open;

      if not DM.qyAux.Eof then
        TEdit(Formulario.components[n]).Text := DM.qyAux.FieldByName('ds_valor').AsString;
    end
    else  if ( Formulario.components[n].ClassType = TMaskEdit ) then
    begin
      DM.qyAux.ParamByName('ds_parametro').AsString := Formulario.Name+'.'+TMaskEdit(Formulario.components[n]).Name;
      Dm.qyAux.Open;

      if not DM.qyAux.Eof then
         if ( DM.qyAux.FieldByName('ds_valor').Value <> '0-' ) then
            TMaskEdit(Formulario.components[n]).Text := DM.qyAux.FieldByName('ds_valor').AsString;
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

Function TDM.getCodigoEquivalente(): string;
var
   iNumero1 : integer;
   iNumero2 : integer;
   iNumero3 : integer;
   iTemp1 : integer;
   iTemp2 : integer;
   aCodigoNumerico : array of string;
   sCodigo : string;
   sParametro : string;
   bSaiFor : boolean;
begin
   while true do
   begin

      sUltimoCodigo := variavel_parametro('lg_ultimo_codigo');
      if (sUltimoCodigo = '') OR (sUltimoCodigo = sUltimoCodigoTeste) then begin

         for iNumero1 := 1 to iClocksIdenti do begin
            SetLength(aCodigoNumerico, iNumero1);
            for iNumero2 := 1 to aClocksIdentiOpcoesQuanti[iNumero1-1] do begin
               if iNumero2 < 10 then begin
                  aCodigoNumerico[iNumero1-1] := aCodigoNumerico[iNumero1-1] + '0' + IntToStr(iNumero2);
               end
               else begin
                  aCodigoNumerico[iNumero1-1] := aCodigoNumerico[iNumero1-1] + IntToStr(iNumero2);
               end;
            end;
         end;

      end
      else begin

         for iNumero1 := 1 to iClocksIdenti do begin
            SetLength(aCodigoNumerico, iNumero1);
            aCodigoNumerico[iNumero1-1] := splitstr(sUltimoCodigo, ';', iNumero1);
         end;

         bSaiFor := False;
         for iNumero1 := iClocksIdenti downto 1 do begin
            for iNumero2 := aClocksIdentiOpcoesQuanti[iNumero1-1] downto 1 do begin
               iTemp1 := StrToInt(Copy(aCodigoNumerico[iNumero1-1], ((iNumero2*2)-1), 2));
               if iTemp1 = Length(aClocksIdentiOpcoesAltern[iNumero1-1]) then begin
                  iTemp2 := StrToInt(Copy(aCodigoNumerico[iNumero1-1], Length(aCodigoNumerico[iNumero1-1])-3, 2))+1;
                  if iTemp2 = Length(aClocksIdentiOpcoesAltern[iNumero1-1]) then begin
                     aCodigoNumerico[iNumero1-1] := '';
                     for iNumero3 := 1 to aClocksIdentiOpcoesQuanti[iNumero1-1] do begin
                        if iNumero3 < 10 then begin
                           aCodigoNumerico[iNumero1-1] := aCodigoNumerico[iNumero1-1] + '0' + IntToStr(iNumero3);
                        end
                        else begin
                           aCodigoNumerico[iNumero1-1] := aCodigoNumerico[iNumero1-1] + IntToStr(iNumero3);
                        end;
                     end;
                     Break;
                  end
                  else if iTemp2 < 10 then begin
                     aCodigoNumerico[iNumero1-1] := Copy(aCodigoNumerico[iNumero1-1], 1, Length(aCodigoNumerico[iNumero1-1])-4) + '0' + IntToStr(iTemp2);
                  end
                  else begin
                     aCodigoNumerico[iNumero1-1] := Copy(aCodigoNumerico[iNumero1-1], 1, Length(aCodigoNumerico[iNumero1-1])-4) + IntToStr(iTemp2);
                  end;

                  iTemp2 := iTemp2 + 1;
                  if iTemp2 < 10 then begin
                     aCodigoNumerico[iNumero1-1] := aCodigoNumerico[iNumero1-1] + '0' + IntToStr(iTemp2);
                  end
                  else begin
                     aCodigoNumerico[iNumero1-1] := aCodigoNumerico[iNumero1-1] + IntToStr(iTemp2);
                  end;
               end
               else begin
                  iTemp2 := iTemp1+1;
                  if iTemp2 < 10 then begin
                     aCodigoNumerico[iNumero1-1] := Copy(aCodigoNumerico[iNumero1-1], 1, Length(aCodigoNumerico[iNumero1-1])-2) + '0' + IntToStr(iTemp2);
                  end
                  else begin
                     aCodigoNumerico[iNumero1-1] := Copy(aCodigoNumerico[iNumero1-1], 1, Length(aCodigoNumerico[iNumero1-1])-2) + IntToStr(iTemp2);
                  end;
                  bSaiFor := True;
                  Break;
               end;
            end;
            if bSaiFor then begin
               Break;
            end;
         end;

      end;

      // Traduzindo o código numérico para um código equivalente
      //    De acordo com os parâmetros
      sParametro := '';
      for iNumero1 := 1 to iClocksIdenti do begin
         sParametro := sParametro + aCodigoNumerico[iNumero1-1] + ';';
         for iNumero2 := 1 to aClocksIdentiOpcoesQuanti[iNumero1-1] do begin
            iTemp1 := StrToInt(Copy(aCodigoNumerico[iNumero1-1], ((iNumero2*2)-1), 2));
            sCodigo := sCodigo + Copy(aClocksIdentiOpcoesAltern[iNumero1-1], iTemp1, 1);
         end;
      end;
      set_variavel_parametro('lg_ultimo_codigo', sParametro);

      with qyAux5 do
      begin
         Close;
         SQL.Clear;
         SQL.Text := 'SELECT cd_equivalente FROM leitora_provas_alunos_cartoes WHERE cd_equivalente = :cd_equivalente';
         ParamByName('cd_equivalente').AsString := sCodigo;
         Open;

         if RecordCount > 0 then
            sCodigo := ''
         else
            break;
      end;
   end; // Termina while true

   Result := sCodigo;
end;

function TDM.GetDB: TZConnection;
begin
   Result := db;
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
      '      INNER JOIN avaliacoes_parametros_matriz ap ON ( ap.cd_avaliacao = COALESCE( gd.cd_avaliacao, t.cd_avaliacao	) ) ' +
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

Procedure TDM.ConfiguraParametros();
var
   iNumero : integer;
   iNumero1 : integer;
   iNumero2 : integer;
   sTemp1 : string;
   sTemp2 : string;
begin
   iGabaritoAtual := 0;

   try
     // lg_clocks_identi
     iClocksIdenti := StrToInt( variavel_parametro('lg_clocks_identi') );

     // lg_clocks_identi_opcoes
     sTemp1 := variavel_parametro('lg_clocks_identi_opcoes');
     for iNumero := 1 to iClocksIdenti do begin
        SetLength(aClocksIdentiOpcoesAltern,iNumero);
        SetLength(aClocksIdentiOpcoesQuanti,iNumero);

        sTemp2 := splitstr(sTemp1,';',iNumero);
        aClocksIdentiOpcoesAltern[iNumero-1] := splitstr(sTemp2,':',1);
        aClocksIdentiOpcoesQuanti[iNumero-1] := StrToInt(splitstr(sTemp2,':',2));
     end;

     // lg_clocks_respos
     sTemp1 := variavel_parametro('lg_clocks_respos');
     iClocksResposQuanti := StrToInt(splitstr(sTemp1,':',1));
     iClocksResposGrupo := StrToInt(splitstr(sTemp1,':',2));

     // lg_clocks_respos_config
     sTemp1 := variavel_parametro('lg_clocks_respos_config');
     for iNumero := 1 to iClocksResposGrupo do begin
        SetLength(aClocksResposConfigInicio,iNumero);
        SetLength(aClocksResposConfigQuanti,iNumero);

        sTemp2 := splitstr(sTemp1,';',iNumero);
        aClocksResposConfigInicio[iNumero-1] := StrToInt(splitstr(sTemp2,':',1));
        aClocksResposConfigQuanti[iNumero-1] := StrToInt(splitstr(sTemp2,':',2));
     end;

     // lg_ultimo_codigo
     sUltimoCodigo := variavel_parametro('lg_ultimo_codigo');

     // lg_relatorio_gabaritos
     sRelatoriosGabaritos := variavel_parametro('lg_relatorio_gabaritos');

     // lg_programa_leitora
     sProgramaLeitora := variavel_parametro('lg_programa_leitora');

     // lg_programa_leitora_arquivo
     sProgramaLeitoraArquivo := variavel_parametro('lg_programa_leitora_arquivo');

     // lg_arquivo_layout
     SetLength(aArquivoLayout, 1);
     aArquivoLayout[0] := '';
     sTemp1 := variavel_parametro('lg_arquivo_layout');
     for iNumero := 1 to 255 do begin
        sTemp2 := splitstr(sTemp1,';',iNumero);
        if (sTemp2 <> aArquivoLayout[iNumero-1]) OR (sTemp2 = 'X') then begin
           SetLength(aArquivoLayout, iNumero+1);
           aArquivoLayout[iNumero] :=  sTemp2;
        end
        else begin
           Break;
        end;
     end;

     // lg_programa_leitora_bits
     iProgramaLeitoraBits := StrToInt(variavel_parametro('lg_programa_leitora_bits'));

     for iNumero1 := 1 to iClocksIdenti do begin
        for iNumero2 := 1 to aClocksIdentiOpcoesQuanti[iNumero1-1] do begin
           sUltimoCodigoTeste := sUltimoCodigoTeste + '09';
        end;
        sUltimoCodigoTeste := sUltimoCodigoTeste + ';';
     end;

     // lg_somatorias_parciais
     if variavel_parametro('lg_somatorias_parciais') = 'S' then begin
        bSomatoriasParciais := True;
     end
     else begin
        bSomatoriasParciais := False;
     end;

     // lg_somatorias_parciais_tipo
     sSomatoriasParciaisTipo := variavel_parametro('lg_somatorias_parciais_tipo');

     // lg_somatorias_parciais_formula
     sSomatoriasFormula := variavel_parametro('lg_somatorias_parciais_formula');

     // lg_somatorias_parciais_condicao_zera
     sSomatoriasCondicaoZero := variavel_parametro('lg_somatorias_parciais_condicao_zera');

   except
     Mensagem('Falha ao carregar os parâmetros do módulo !'+chr(13)+'Verifique se as atualizações da base de dados foram executadas.', Application.Title, MB_OK+MB_ICONWARNING);
   end;

end;

procedure TDM.CriarConsulta(var query: TUMZQuery);
begin
   query := TUMZQuery.Create(Self);
   query.Connection := db;
   query.Close;
   query.SQL.Clear;
end;

procedure TDM.CriarConsulta(var query: TUMZReadOnlyQuery);
begin
   query := TUMZReadOnlyQuery.Create(Self);
   query.Connection := db;
   query.Close;
   query.SQL.Clear;
end;

function TDM.VerificaNumero(sResposta: string): Boolean;
var
   sR: TRegExpr;
begin
   sR := TRegExpr.Create();
   sR.Expression := '([0-9])';

   Result := sR.Exec(sResposta);
end;

function TDM.VerificaString(sResposta: string): Boolean;
var
   sR: TRegExpr;
begin
   sR := TRegExpr.Create();
   sR.Expression := '([aZ])';

   Result := sR.Exec(sResposta);
end;

function TDM.ValidaResposta(sResposta: string): Boolean;
begin
   Result := False;

   if Length(sResposta) > 0 then
   begin
      if VerificaNumero(sResposta) then
      begin
         if Length(sResposta) <= 3 then
         begin
            Result := True;
         end;
      end
      else if VerificaString(sResposta) then
      begin
         if Length(sResposta) = 1 then
         begin
            Result := True;
         end;
      end;
   end;
end;


function TDM.CabecalhoCampos(iCodCabecalho: Integer): string;
begin
  Result := '';

  if (iCodCabecalho > - 1) then begin
    with qyAux do begin
      Close();
      SQL.Clear();
      SQL.Add('SELECT ds_campos FROM relatorios_cabecalhos WHERE cd_cabecalho = :cdcabecalho LIMIT 1');
      ParamByName('cdcabecalho').Value := iCodCabecalho;
      Open();

      if not IsEmpty then begin
        Result := FieldByName('ds_campos').AsString;
      end;

      Close();
    end;
  end;
end;

function TDM.CabecalhoParamFixos(): TStringList;
begin
  Result := nil;

  if slPFixos = nil then begin

    slPFixos := TStringList.Create();
    with qyAux do begin
      Close();
      SQL.Clear();
      SQL.Add('SELECT ds_variavel, ds_valor FROM relatorios WHERE cd_categoria = :cdcategoria ORDER BY ds_variavel');
      ParamByName('cdcategoria').Value := 3;
      Open();

      if not IsEmpty then begin
        First();
        while not Eof do begin
          slPFixos.Add(FieldByName('ds_variavel').AsString + '=' + FieldByName('ds_valor').AsString);
          Next();  
        end;
        Result := slPFixos;
      end;
      Close();
    end;
  end;

end;

procedure TDM.CalcularMediaAutomaticamente( const nr_anosemestre: Integer;
         const cd_turma: String; const cd_disciplina, nr_etapa, cd_grupo, cd_pessoa: Integer );

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

   procedure CalcularNotaDisciplina(anosemestre: Integer; turma: String;
         disciplina, bimestre, cd_grupo, pessoa: Integer; formula: String);
   var
      qyExecutaMediaDisciplina: TUMZQuery;
   begin
      DM.CriarConsulta(qyExecutaMediaDisciplina);
      qyExecutaMediaDisciplina.SQL.Text := ' CALL DIA_CALCULO_MEDIA_DISCIPLINA( :nr_anosemestre, :cd_turma, ' +
                                           '    :cd_disciplina, :nr_etapa, :cd_grupo, :cd_pessoa, :ds_formula, NULL, :cd_pessoa_logada ) ';

      qyExecutaMediaDisciplina.ParamByName('nr_anosemestre').AsInteger := anosemestre;
      qyExecutaMediaDisciplina.ParamByName('cd_turma').AsString := turma;
      qyExecutaMediaDisciplina.ParamByName('cd_disciplina').AsInteger := disciplina;
      qyExecutaMediaDisciplina.ParamByName('nr_etapa').AsInteger := bimestre;
      qyExecutaMediaDisciplina.ParamByName('cd_grupo').AsInteger := cd_grupo;
      qyExecutaMediaDisciplina.ParamByName('cd_pessoa').AsInteger := pessoa;
      qyExecutaMediaDisciplina.ParamByName('ds_formula').AsString := formula;
      qyExecutaMediaDisciplina.ParamByName('cd_pessoa_logada').AsInteger := DM.GetUsuarioLogado.Pessoa.Codigo;

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

      CalcularNotaDisciplina( nr_anosemestre, cd_turma, cd_disciplina, nr_etapa, cd_grupo, cd_pessoa, ds_formula );
   end;
end;

function TDM.DecompoeNumero(iResposta:integer):string;
var
   iNumero : integer;
   iAux : integer;
   sResultado : string;
begin
   iAux := iResposta;

   iNumero := 64;
   while iNumero >= 1 do begin
      if (iNumero <= iResposta) then begin
         if (iAux-iNumero) >= 0 then begin
            iAux := iAux-iNumero;
            if iNumero < 10 then begin
               sResultado := sResultado + '0' + IntToStr(iNumero) + ';';
            end
            else begin
               sResultado := sResultado + IntToStr(iNumero) + ';';
            end;
         end;
      end;

      if iNumero > 1 then begin
         iNumero := StrToInt(FloatToStr(iNumero / 2));
      end
      else begin
         iNumero := 0;
      end;
   end;

   Result := sResultado;

end;

function TDM.VerificaeNumero(sValor:string):boolean;
var
   sR: TRegExpr;
begin
   sR := TRegExpr.Create();
   sR.Expression := '([0-9])';

   Result := sR.Exec(sValor);
end;                       

procedure TDM.DataModuleDestroy(Sender: TObject);
begin
   @FDLLProc := nil;
   FreeLibrary(FDLLHandle);
end;

function TDM.DataSetToJSON(ResultSet: IZResultSet): TlkJSONlist;
begin
   Result := TlkJSONlist.Create;

   ResultSet.BeforeFirst;
   
   while ResultSet.Next do
      Result.Add(RecordToJSON(ResultSet));

   ResultSet.BeforeFirst;
end;

function TDM.DataSetToJSON(DataSet: TDataSet): TlkJSONlist;
var
   CanDisableControls: Boolean;
begin
   Result := TlkJSONlist.Create;

   CanDisableControls := not DataSet.ControlsDisabled;

   if CanDisableControls then
      DataSet.DisableControls;
      
   DataSet.First;
   while not DataSet.Eof do
   begin
      Result.Add(RecordToJSON(DataSet));
      DataSet.Next;
   end;
   DataSet.First;

   if CanDisableControls then
      DataSet.EnableControls;
end;

function TDM.GeraLeitoraDisciplinas(cd_prova: integer; cd_prova_aluno: integer): Boolean;
begin
   Result := False;

   with DM.qyAux4 do
   begin
      Close();
      SQL.Text := 'SELECT * FROM leitora_provas_disciplinas WHERE cd_prova = :cd_prova';
      ParamByName('cd_prova').AsInteger := cd_prova;
      Open();

      if Eof then
      begin
         Exit; // return false;
      end;

      while not Eof do
      begin
         with DM.qyAux5 do
         begin
            Close();
            SQL.Text := 'INSERT IGNORE INTO leitora_provas_alunos_dis(cd_prova_aluno, cd_prova_disciplina)VALUES(:cd_prova_aluno, :cd_prova_disciplina)';
            ParamByName('cd_prova_aluno').AsInteger := cd_prova_aluno;
            ParamByName('cd_prova_disciplina').AsInteger := DM.qyAux4.FieldByName('cd_prova_disciplina').AsInteger;
            ExecSQL();
         end;
         Next();
      end;
      Result := True;
   end;
end;

function TDM.getDisciplinaFrente(iDisciplina: Integer; iAnosemestre: Integer; sTurma: string): Integer;
var
   qyDisciplinaFrente: TUMZQuery;
begin
   DM.CriarConsulta(qyDisciplinaFrente);

   qyDisciplinaFrente.SQL.Text := ''+
   ' SELECT ' +
	'   GD.CD_DISCIPLINA_FRENTE ' +
   ' FROM ' +
	'   TURMAS T ' +
	'   INNER JOIN GRADES_DISCIPLINAS GD ON (T.CURSO = GD.CD_CURSO AND T.CD_GRADE = GD.CD_GRADE AND T.SERIE = GD.NR_SERIE) ' +
   ' WHERE ' +
	'   GD.CD_DISCIPLINA =  :CD_DISCIPLINA ' +
	'   AND T.CODIGO LIKE :CD_TURMA ' +
   '   AND T.ANOSEMESTRE = :NR_ANOSEMESTRE ' +
	'   AND GD.CD_DISCIPLINA_FRENTE IS NOT NULL ';

   qyDisciplinaFrente.ParamByName('CD_DISCIPLINA').AsInteger := iDisciplina;
   qyDisciplinaFrente.ParamByName('CD_TURMA').AsString := sTurma;
   qyDisciplinaFrente.ParamByName('NR_ANOSEMESTRE').AsInteger := iAnosemestre;

   qyDisciplinaFrente.Open();

   if qyDisciplinaFrente.RecordCount > 0 then
      getDisciplinaFrente := qyDisciplinaFrente.FieldByName('CD_DISCIPLINA_FRENTE').AsInteger
   else
      getDisciplinaFrente := -1;

   FreeAndNil(qyDisciplinaFrente);
end;

function TDM.getTipoAvaliacao(iAnosemestre: Integer; sTurma: string; iDisciplina: Integer; iBimestre: Integer; iNrProva: Integer) : Integer;
var
   qyTipoAvaliacao: TUMZQuery;
begin
   DM.CriarConsulta(qyTipoAvaliacao);

   // Busca o tipo de avaliação de uma prova
   qyTipoAvaliacao.Close;
   qyTipoAvaliacao.SQL.Text := ' ' +
   ' SELECT ' +
   '   cd_avaliacao_tipo ' +
   ' FROM ' +
   '   diario_provas ' +
   ' WHERE ' +
   '   anosemestre = :nr_anosemestre ' +
   '   AND turma = :cd_turma ' +
   '   AND disciplina = :cd_disciplina ' +
   '   AND bimestre = :nr_bimestre ' +
   '   AND nro_nota = :nr_prova ';

   qyTipoAvaliacao.ParamByName('nr_anosemestre').AsInteger := iAnosemestre;
   qyTipoAvaliacao.ParamByName('cd_turma').AsString := sTurma;
   qyTipoAvaliacao.ParamByName('cd_disciplina').AsInteger := iDisciplina;
   qyTipoAvaliacao.ParamByName('nr_bimestre').AsInteger := iBimestre;
   qyTipoAvaliacao.ParamByName('nr_prova').AsInteger := iNrProva;

   qyTipoAvaliacao.Open;

   getTipoAvaliacao := qyTipoAvaliacao.FieldByName('cd_avaliacao_tipo').AsInteger;
end;

function TDM.getDisciplinasFazemFrente(iAnosemestre: Integer; sTurma: string; iDisciplina: Integer) : TStringList;
var
   qyDisciplinasFazemFrente: TUMZQuery;
   arrDisciplinas: TStringList;
begin
   DM.CriarConsulta(qyDisciplinasFazemFrente);

   arrDisciplinas := TStringList.Create();
   arrDisciplinas.Clear;

   // Busca as disciplinas que fazem frente a disciplina frente passada como parametro
   qyDisciplinasFazemFrente.Close;
   qyDisciplinasFazemFrente.SQL.Text := ' ' +
   ' SELECT ' +
   '   gd.cd_disciplina ' +
   ' FROM ' +
   '   turmas t ' +
   '   INNER JOIN grades_disciplinas gd ON ( ' +
   '      gd.cd_grade = t.cd_grade AND ' +
   '      gd.cd_curso = t.curso AND ' +
   '      gd.nr_serie = t.serie ' +
   '   ) ' +
   ' WHERE ' +
   '   t.anosemestre = :nr_anosemestre ' +
   '   AND t.codigo = :cd_turma ' +
   '   AND gd.cd_disciplina_frente = :cd_disciplina ';

   qyDisciplinasFazemFrente.ParamByName('nr_anosemestre').AsInteger := iAnosemestre;
   qyDisciplinasFazemFrente.ParamByName('cd_turma').AsString := sTurma;
   qyDisciplinasFazemFrente.ParamByName('cd_disciplina').AsInteger := iDisciplina;

   qyDisciplinasFazemFrente.Open;

   while not qyDisciplinasFazemFrente.Eof do
   begin
      // Adiciona as disciplinas encontradas no array de disciplinas
      arrDisciplinas.Add(qyDisciplinasFazemFrente.FieldByName('cd_disciplina').AsString);

      qyDisciplinasFazemFrente.Next;
   end;

   getDisciplinasFazemFrente := arrDisciplinas;
end;

function TDM.getSomaNotasProvasMesmoTipo(iAnosemestre: Integer; sTurma: string; iDisciplina: Integer; iBimestre: Integer; iCdAvaliacaoTipo: Integer; iCdPessoa: Integer) : TNota;
var
   qySomaNotasMesmoTipo: TUMZQuery;
begin
   DM.CriarConsulta(qySomaNotasMesmoTipo);

   // Soma as notas das provas de mesmo tipo
   qySomaNotasMesmoTipo.Close;
   qySomaNotasMesmoTipo.SQL.Text := ' ' +
   ' SELECT ' +
   '   SUM(dpa.vl_nota) soma_notas ' +
   ' FROM ' +
   '   diario_provas dp ' +
	'   INNER JOIN diario_provas_alunos dpa ON ( ' +
	' 	   dp.anosemestre = dpa.nr_anosem ' +
	'	   AND dp.turma = dpa.cd_turma ' +
	'	   AND dp.disciplina = dpa.cd_disciplina ' +
	'     AND dp.bimestre = dpa.cd_bimestre ' +
	'     AND dp.nro_nota = dpa.nr_prova ' +
	'   ) ' +
   ' WHERE ' +
   '   dp.anosemestre = :nr_anosemestre ' +
   '   AND dp.turma LIKE :cd_turma ' +
   '   AND dp.disciplina = :cd_disciplina ' +
   '   AND dp.bimestre = :nr_bimestre ' +
   '   AND dp.cd_avaliacao_tipo = :cd_avaliacao_tipo ' +
   '   AND dpa.cd_pessoa = :cd_pessoa ';

   qySomaNotasMesmoTipo.ParamByName('nr_anosemestre').AsInteger := iAnosemestre;
   qySomaNotasMesmoTipo.ParamByName('cd_turma').AsString := sTurma;
   qySomaNotasMesmoTipo.ParamByName('cd_disciplina').AsInteger := iDisciplina;
   qySomaNotasMesmoTipo.ParamByName('nr_bimestre').AsInteger := iBimestre;
   qySomaNotasMesmoTipo.ParamByName('cd_avaliacao_tipo').AsInteger := iCdAvaliacaoTipo;
   qySomaNotasMesmoTipo.ParamByName('cd_pessoa').AsInteger := iCdPessoa;

   qySomaNotasMesmoTipo.Open;

   Result.vl_nota := qySomaNotasMesmoTipo.FieldByName('soma_notas').AsFloat;
   Result.IsNull := qySomaNotasMesmoTipo.FieldByName('soma_notas').IsNull;

   FreeAndNil(qySomaNotasMesmoTipo);
end;

procedure TDM.atribuiNotaProvaDisciplinaFrente(iAnosemestre: Integer; sTurma: string; iDisciplina: Integer; iBimestre: Integer; iCdAvaliacaoTipo: Integer; iCdPessoa: Integer; rNota: TNota);
var
   qyUpdateNotaDisciplinaFrente: TUMZQuery;
begin
   DM.CriarConsulta(qyUpdateNotaDisciplinaFrente);

   // Busca o tipo de avaliação de uma prova
   qyUpdateNotaDisciplinaFrente.Close;
   qyUpdateNotaDisciplinaFrente.SQL.Text := ' ' +
   ' UPDATE ' +
   '   diario_provas dp ' +
	'   INNER JOIN diario_provas_alunos dpa ON ( ' +
	' 	   dp.anosemestre = dpa.nr_anosem ' +
	'	   AND dp.turma = dpa.cd_turma ' +
	'	   AND dp.disciplina = dpa.cd_disciplina ' +
	'     AND dp.bimestre = dpa.cd_bimestre ' +
	'     AND dp.nro_nota = dpa.nr_prova ' +
	'   ) ' +
   ' SET ' +
   '   dpa.vl_nota = :vl_nota ' +
   ' WHERE ' +
   '   dp.anosemestre = :nr_anosemestre ' +
   '   AND dp.turma LIKE :cd_turma ' +
   '   AND dp.disciplina = :cd_disciplina ' +
   '   AND dp.bimestre = :nr_bimestre ' +
   '   AND dp.cd_avaliacao_tipo = :cd_avaliacao_tipo ' +
   '   AND dpa.cd_pessoa = :cd_pessoa ';

   qyUpdateNotaDisciplinaFrente.ParamByName('nr_anosemestre').AsInteger := iAnosemestre;
   qyUpdateNotaDisciplinaFrente.ParamByName('cd_turma').AsString := sTurma;
   qyUpdateNotaDisciplinaFrente.ParamByName('cd_disciplina').AsInteger := iDisciplina;
   qyUpdateNotaDisciplinaFrente.ParamByName('nr_bimestre').AsInteger := iBimestre;
   qyUpdateNotaDisciplinaFrente.ParamByName('cd_avaliacao_tipo').AsInteger := iCdAvaliacaoTipo;
   qyUpdateNotaDisciplinaFrente.ParamByName('cd_pessoa').AsInteger := iCdPessoa;
   if rNota.IsNull then
      qyUpdateNotaDisciplinaFrente.ParamByName('vl_nota').IsNull
   else
      qyUpdateNotaDisciplinaFrente.ParamByName('vl_nota').AsFloat := rNota.vl_nota;

   qyUpdateNotaDisciplinaFrente.ExecSQL;
end;

procedure TDM.inserirAlunosDisciplina(iAnosemestre: Integer; sTurma: string; iDisciplina: Integer; iBimestre: Integer);
begin
   // Inserir alunos na diario_provas_alunos da disciplina frente
   qryInsertAlunoProva.Close;
   qryInsertAlunoProva.ParamByName('turma').AsString       := sTurma;
   qryInsertAlunoProva.ParamByName('anosem').AsInteger     := iAnosemestre;
   qryInsertAlunoProva.ParamByName('disciplina').AsInteger := iDisciplina;
   qryInsertAlunoProva.ParamByName('bimestre').AsInteger   := iBimestre;
   qryInsertAlunoProva.ExecSQL;
end;

end.
