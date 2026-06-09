unit uDM;

interface

uses
  Windows, Forms, Db, DBTables, Classes, Sysutils, Controls, IniFiles, General,
  Dialogs, Menus, DBCtrls, StdCtrls, ZConnection, ZAbstractTable, ZDataset,
  UZDataset, ZAbstractRODataset, ZAbstractDataset, StrUtils, UZStartConnection,
  ZSqlMonitor, uIUMDataModule, uUsuario, uMLogZeos;

type
      
  TDM = class(TDataModule, IUMDataModule)
    srcTipoPessoa: TDataSource;
    db: TZConnection;
    qyAux1: TUMZQuery;
    qyAux2: TUMZQuery;
    qyRS_VAR: TUMZQuery;
    qyMax: TUMZQuery;
    qyFeriados: TUMZQuery;
    qyLogs: TUMZQuery;
    qyLogsAcessos: TUMZQuery;
    qyPessoas: TUMZQuery;
    qyAtividades: TUMZQuery;
    qyPlanosDescontos: TUMZQuery;
    qyAtividadesValores: TUMZQuery;
    qyAux: TUMZQuery;
    qryAux: TUMZQuery;
    qyAtividadesValoresvl_atividade: TFloatField;
    qyPlanosDescontosnr_anosemestre: TIntegerField;
    qyPlanosDescontosqt_atividades: TIntegerField;
    qyPlanosDescontosvl_percentual: TFloatField;
    qyPlanosDescontosvl_desconto: TFloatField;
    qyPlanosDescontosvl_desconto_fixo: TFloatField;
    qyPlanosDescontoscd_tipo_pessoa: TIntegerField;
    qyAtividadescd_atividade: TIntegerField;
    qyAtividadesnr_anosemestre: TIntegerField;
    qyAtividadescd_professor: TIntegerField;
    qyAtividadescd_tipo_titulo: TIntegerField;
    qyAtividadescd_centro: TLargeintField;
    qyAtividadescd_coligada: TIntegerField;
    qyAtividadesds_atividade: TStringField;
    qyAtividadesds_observacao: TMemoField;
    qyAtividadesds_sigla: TStringField;
    qyPessoascd_pessoa: TIntegerField;
    qyPessoasnm_pessoa: TStringField;
    qyLogsAcessoscd_modulo: TIntegerField;
    qyLogsAcessosdt_log: TDateTimeField;
    qyLogsAcessoshr_log: TTimeField;
    qyLogsAcessoscd_usuario: TIntegerField;
    qyLogsAcessossn_acessou: TStringField;
    qyLogsAcessossn_incluiu: TStringField;
    qyLogsAcessossn_alterou: TStringField;
    qyLogsAcessossn_excluiu: TStringField;
    qyFeriadosdataferiado: TDateTimeField;
    qyFeriadosferiado: TStringField;
    qyParametrosUsuarios: TUMZQuery;
    qryLogon: TUMZReadOnlyQuery;
    qryLogonCD_PESSOA: TIntegerField;
    qryLogonDS_LOGIN: TStringField;
    qryLogonDS_SENHA: TStringField;
    qryResgataPgtos: TUMZReadOnlyQuery;
    qryResgataPgtosNR_ANOSEMESTRE: TIntegerField;
    qryResgataPgtosCD_PESSOA: TIntegerField;
    qryResgataPgtosNR_MES: TIntegerField;
    qryResgataPgtosDT_PAGAMENTO: TDateTimeField;
    qryResgataPgtosVL_PAGO: TFloatField;
    qryExtraMatriculas: TUMZQuery;
    qryExtraMatriculasCD_PESSOA: TIntegerField;
    qryExtraMatriculasNR_ANOSEMESTRE: TIntegerField;
    qryExtraMatriculasNR_MES: TIntegerField;
    qryExtraMatriculasDT_PAGAMENTO: TDateTimeField;
    qryNNTurma: TUMZReadOnlyQuery;
    qryNNTurmaDS_NN_PREFIXO: TStringField;
    qryNNTurmaNR_NN_ULTIMO: TIntegerField;
    qryNNDepto: TUMZReadOnlyQuery;
    qryNNDeptoDS_NN_PREFIXO: TStringField;
    qryNNDeptoNR_NN_ULTIMO: TIntegerField;
    qryNNUpd: TUMZQuery;
    qryUpdNN: TUMZQuery;
    qryExtraMatriculasVL_PAGO: TFloatField;
    startConn: TUMZStartConnection;
    sqlMonitor: TZSQLMonitor;
    procedure DataModuleDestroy(Sender: TObject);
    procedure sqlMonitorLogTrace(Sender: TObject; Event: TZLoggingEvent);
    procedure startConnDefaultConnection(Sender: TObject);
    procedure dbBeforeDisconnect(Sender: TObject);
    procedure DataModuleCreate(Sender: TObject);
    procedure qyLogsAfterInsert(DataSet: TDataSet);
    procedure qyLogsAcessosAfterInsert(DataSet: TDataSet);
    function GetDB(): TZConnection;
  private
      FDLLHandle: THandle;
      FDLLProc: procedure(Event: Pointer); stdcall;
      function IsDebugging: Boolean;
      function TryLoadDebugger: Boolean;
  public
    { Public declarations }

    flg: boolean;
    iColigadaSelecionada : Integer;
    UsuarioLogado : TUsuario;
    Function BuscarValorDesconto( iAnoSemestre, iQtdAtividades, iTipoPessoa : integer; iValorTotal : Currency): Currency;
    Function BuscarDescontoExtra( iAnoSemestre, iQtdAtividades, iTipoPessoa : integer ): Currency;
    Function BuscarNroAtividades ( iAnoSemestre, iCodPessoa, iMes : Integer ) : Integer;
    Function BuscarValorBruto ( iAnoSemestre, iCodPessoa, iMes, iTipoPessoa : Integer ) : Currency;

    function BuscarCodigoAcaoPadrao(CodPadrao: Integer): Integer;
    procedure CriarConsulta( var DataSet : TUMZQuery );overload;
    procedure CriarConsulta( var DataSet : TUMZReadOnlyQuery );overload;

    procedure SetUsuarioLogado( UsuarioLogado : TUsuario );
    procedure SetLog(cd_modulo: integer; operacao: string; chave : string = ''; coligada : integer = 0; ds_observacoes: string = ''); overload;

    function GetUsuarioLogado: TUsuario;

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

    //  recupera o ultimo id inserido em base de dados
    function LastInsert: Integer;

      ///   <summary>Calcula e retorna o valor do Nosso Número de acordo com as
      ///   configurações do cadastro de contas da turma e/ou departamento
      ///   </summary>
      ///
      ///   <param name="Turma">Código da turma para a qual consultar-se-á o
      ///   cadastro de contas para realizar o cálculo do Nosso Número</param>
      ///   <param name="Depto">Código do departamento para o qual o método irá
      ///   consultar o cadastro de contas para calcular o Nosso Número</param>
      ///   <param name="AnoSemestre">Ano/semestre usado para calcular o Nosso
      ///   Número com base no cadastro de conta da turma</param>
      ///
      ///   <returns>Retorna o Nosso Número calculado</returns>
      function CreateNossoNumero(const Turma: string;
            const Depto, AnoSemestre, Aluno: Integer): string;

      ///   <summary>Realiza a leitura do arquivo de inicialização unimestre.ini
      ///   no diretório onde está localizado o executável do aplicativo para
      ///   obter as informações necessárias para realizar a conexão com o banco
      ///   de dados do Unimestre</summary>
      ///
      ///   <returns>Retorna valor lógico <c>True</c> indicando que a conexão
      ///   com o banco de dados foi realizada com sucesso ou <c>False</c> caso
      ///   a conexão não tenha sido efetuada.</returns>
      function Connect: Boolean;

      ///   <summary>Tenta realizar a autenticação do usuário e senha informados
      ///   no banco de dados do Unimestre</summary>
      ///
      ///   <param name="User">Nome de <c>login</c> ou código do usuário
      ///   cadastrado na base de dados do Unimestre para o qual deseja-se
      ///   efetuar o login</param>
      ///   <param name="Pass">Senha para acesso ao sistema do usuário
      ///   informado</param>
      ///
      ///   <returns>Retorna o valor lógico <c>True</c> se a autenticação do
      ///   usuário for bem sucedida e <c>False</c> caso contrário.</returns>
      function Logon(const User, Pass: string): Boolean;

      ///   <summary>Consulta o banco de dados para verificar se o usuário
      ///   atualmente autenticado no sistema possui a permissão requisitada
      ///   para acessar a funcionalidade solicitada.</summary>
      ///
      ///   <param name="Key">Chave da permissão da funcionalidade que o usuário
      ///   solicitou o acesso</param>
      ///   <param name="Level">Nível de permissão de acesso necessário para
      ///   acessar a funcionalidade requisitada. Os níveis de permissão são
      ///   definidos na enumeração <c>TPermissionLevel</c> e os seguintes
      ///   valores são válidos: <c>plAccess</c>, <c>plInsert</c>,
      ///   <c>plEdit</c>, <c>plDelete</c> e <c>plSpecial</c></param>
      ///   <param name="Alert">Indica se deseja exibir um alerta para o usuário
      ///   que não possua o nível de permissão solicitado para a
      ///   funcionalidade. São permitidos os valores <c>True</c> e <c>False</c>
      ///   </param>
      ///   <param name="AHandle">Âncora para a janela da qual foi acionado este
      ///   método</param>
      ///
      ///   <returns>Retorna valor lógico indicando se o usuário possui a
      ///   permissão solicitada. Se possuir a permissão retorna <c>True</c>,
      ///   caso contrário, <c>False</c></returns>
      function RequestPermission(const Key: string;
            const Level: TUMNivelPermissao; const Alert: Boolean;
            const AHandle: HWND): Boolean;

      procedure ResgataPagamentos;
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
   FDLLProc(Pointer(Event));
end;

procedure TDM.startConnDefaultConnection(Sender: TObject);
begin
   Connect;
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

procedure TDM.SetUsuarioLogado(UsuarioLogado: TUsuario);
begin
   Self.UsuarioLogado := UsuarioLogado;
end;

procedure TDM.Set_Parametros_usuario(Formulario: TForm);
var
  n : LongInt ;
begin

  for n := 0 to ( Formulario.ComponentCount - 1 ) do
  begin
    if ( Formulario.components[n].ClassType = TEdit ) then
    begin

      DM.qyParametrosUsuarios.ParamByName('cd_usuario').AsInteger := qryLogonCD_PESSOA.AsInteger;
      DM.qyParametrosUsuarios.ParamByName('ds_parametro').AsString := Formulario.Name+'.'+TEdit(Formulario.components[n]).Name;
      DM.qyParametrosUsuarios.ParamByName('ds_valor').AsString := TEdit(Formulario.components[n]).Text;

      Dm.qyParametrosUsuarios.ExecSQL;

    end
    else if ( Formulario.components[n].ClassType = TComboBox ) then
    begin

      DM.qyParametrosUsuarios.ParamByName('cd_usuario').AsInteger := qryLogonCD_PESSOA.AsInteger;
      DM.qyParametrosUsuarios.ParamByName('ds_parametro').AsString := Formulario.Name+'.'+TComboBox(Formulario.components[n]).Name;
      DM.qyParametrosUsuarios.ParamByName('ds_valor').AsString := TComboBox(Formulario.components[n]).Text;

      Dm.qyParametrosUsuarios.ExecSQL;

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
  DM.qyAux1.ParamByName('cd_usuario').AsInteger := qryLogonCD_PESSOA.AsInteger;

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

function TDM.BuscarCodigoAcaoPadrao(CodPadrao: Integer): Integer;

begin

   qryAux.SQL.Clear;
   qryAux.SQL.Add(
   ' SELECT                              ' +
   '   *                                 ' +
   ' FROM                                ' +
   '    fin_acoes_movimento              ' +
   ' WHERE                               ' +
   '    cd_acao_automatica = ' + IntToStr(CodPadrao) );

   qryAux.Open;

   if qryAux.Eof then begin
      Result := -1;
   end
   else begin
      Result := qryAux.FieldByName('cd_acao').AsInteger;
   end;

end;

function TDM.BuscarDescontoExtra(iAnoSemestre, iQtdAtividades,
  iTipoPessoa: integer): Currency;
Var
   qAcoes: TUMZQuery;
begin

   qAcoes := TUMZQuery.Create(Self);
   qAcoes.Connection := dm.db;


   with qAcoes do begin
      Close;
      SQL.Text := ' ' +
         ' SELECT                                           ' +
         '    *                                             ' +
         ' FROM                                             ' +
         '   extra_plano_descontos                          ' +
         ' WHERE                                            ' +
         '   nr_anosemestre = :nr_anosemestre AND           ' +
         '   qt_atividades >= :qt_atividades AND             ' +
         '   cd_tipo_pessoa = :cd_tipo_pessoa                ';

      ParamByName('nr_anosemestre').AsInteger := iAnoSemestre;
      ParamByName('qt_atividades').AsInteger  := iQtdAtividades;
      ParamByName('cd_tipo_pessoa').AsInteger := iTipoPessoa;
      Open;

      if not EOF then
         result := FieldByName('vl_desconto_fixo').AsCurrency
      else
         result := 0;

   end;

   FreeAndNil(qAcoes);

end;


function TDM.BuscarNroAtividades(iAnoSemestre, iCodPessoa,
  iMes: Integer): Integer;
var
  qAcoes : TUMZQuery;

begin
   // Busca a Quantidade de Disciplinas do aluno dentro do Mês

   qAcoes := TUMZQuery.Create(Self);
   qAcoes.Connection := db;


   with qAcoes do begin
      Close;
      SQL.Text := ' ' +
         ' SELECT                                     ' +
         '    COUNT(*) AS qtd                         ' +
         ' FROM                                       ' +
         '    extra_matriculas_atividades             ' +
         ' WHERE                                      ' +
         '    nr_anosemestre = :nr_anosemestre AND    ' +
         '    nr_mes = :nr_mes AND                    ' +
         '    cd_pessoa = :cd_pessoa                  ';

      ParamByName('nr_anosemestre').AsInteger := iAnoSemestre;
      ParamByName('cd_pessoa').AsInteger := iCodPessoa;
      ParamByName('nr_mes').AsInteger := iMes;
      Open;

      result := FieldByName('qtd').AsInteger;

   end;

   FreeAndNil(qAcoes);

end;


function TDM.BuscarValorBruto(iAnoSemestre, iCodPessoa, iMes,
  iTipoPessoa: Integer): Currency;
Var
  qAcoes : TUMZQuery;
begin
   // Retorna o Valor Bruto do Aluno com base nas atividades selecionadas

   qAcoes := TUMZQuery.Create(Self);
   qAcoes.Connection := db;

   with qAcoes do begin
      Close;
      SQL.Text := ' ' +
         ' SELECT                                           ' +
         '     SUM(EVP.vl_atividade) ValorBruto             ' +
         ' FROM                                             ' +
         '     extra_valores_pessoas EVP,                   ' +
         '     extra_matriculas_atividades EMA              ' +
         ' WHERE                                            ' +
         '     EVP.nr_anosemestre = EMA.nr_anosemestre AND  ' +
         '     EVP.cd_atividade = EMA.cd_atividade AND      ' +
         '     EVP.nr_anosemestre = :NrAnoSem AND           ' +
         '     EVP.cd_tipo_pessoa = :TpPessoa AND           ' +
         '     EMA.cd_pessoa = :CdPessoa AND                ' +
         '     EMA.nr_mes = :NrMes AND                      ' +
         '     EMA.sn_paga = 1                              '; 

      ParamByName('NrAnoSem').AsInteger := iAnoSemestre;
      ParamByName('CdPessoa').AsInteger := iCodPessoa;
      ParamByName('TpPessoa').AsInteger := iTipoPessoa;
      ParamByName('NrMes').AsInteger := iMes;

      Open;

      result := FieldByName('ValorBruto').AsCurrency;

   end;

   FreeAndNil(qAcoes);
end;

function TDM.BuscarValorDesconto(iAnoSemestre, iQtdAtividades,
  iTipoPessoa: integer; iValorTotal: Currency): Currency;
Var
  qAcoes : TUMZQuery;
Begin

   qAcoes := TUMZQuery.Create(Self);
   qAcoes.Connection := db;

   with qAcoes do begin
      Close;
      SQL.Text := ' ' +
         ' SELECT                                           ' +
         '    *                                             ' +
         ' FROM                                             ' +
         '   extra_plano_descontos                          ' +
         ' WHERE                                            ' +
         '   nr_anosemestre = :nr_anosemestre AND           ' +
         '   qt_atividades = :qt_atividades AND             ' +
         '   cd_tipo_pessoa = :cd_tipo_pessoa                ';

      ParamByName('nr_anosemestre').AsInteger := iAnoSemestre;
      ParamByName('qt_atividades').AsInteger  := iQtdAtividades;
      ParamByName('cd_tipo_pessoa').AsInteger := iTipoPessoa;
      Open;

   if not Eof then begin
      Result := ((iValorTotal/100)*FieldByName('vl_percentual').AsCurrency)+FieldByName('vl_desconto').AsCurrency;
   end
   else begin
      Result := 0;
   end;

  end;

  FreeAndNil(qAcoes);

End;

function TDM.Connect: Boolean;
var
   ExeDir, IniPath: string;
   ConnIni: TIniFile;
begin
   Result := False;
   ExeDir := ExtractFilePath(ParamStr(0));
   IniPath := ExeDir + 'unimestre.ini';

   ConnIni := TIniFile.Create(IniPath);
   try
      if db.Connected then db.Disconnect;

      db.HostName := ConnIni.ReadString('Conexao', 'Servidor', 'localhost');
      db.Database := ConnIni.ReadString('Conexao', 'Banco', 'unimestre');
      db.User := ConnIni.ReadString('Conexao', 'Usuario', 'academico');
      db.Password := Decrypt(ConnIni.ReadString('Conexao', 'Senha',
            '1430CB64FD51F727D5096A984E983EE707'));
      db.Port := ConnIni.ReadInteger('Conexao', 'Porta', 3306);
      db.Protocol := ConnIni.ReadString('Conexao', 'Protocolo', 'mysql-5');

      try
         db.Connect;
         Result := db.Connected;
      except
         on E: EZDatabaseError do
            { TODO 5 -oJosimar Zimermann -cImplementação : Disparar exceção informando erro de conexão }
      end;
   finally
      ConnIni.Free;
   end;
end;

function TDM.CreateNossoNumero(const Turma: string; const Depto,
  AnoSemestre, Aluno: Integer): string;
var
   Prefx, S: string;
   Ultimo, TamUltimo, I: Integer;
   Achou: Boolean;
begin
   Result := EmptyStr;
   Achou := False;
   Ultimo := 0;
   TamUltimo := 0;

   qryNNTurma.Close;
   qryNNTurma.ParamByName('CD_TURMA').AsString := Turma;
   qryNNTurma.ParamByName('NR_ANOSEMESTRE').AsInteger := AnoSemestre;
   qryNNTurma.Open;

   if qryNNTurma.IsEmpty then
   begin
      qryNNDepto.Close;
      qryNNDepto.ParamByName('CD_DEPTO').AsInteger := Depto;
      qryNNDepto.Open;

      if not qryNNDepto.IsEmpty then
      begin
         Achou := True;
         Prefx := qryNNDeptoDS_NN_PREFIXO.AsString;
         Ultimo := qryNNDeptoNR_NN_ULTIMO.AsInteger;
         TamUltimo := Length(qryNNDeptoNR_NN_ULTIMO.AsString);
      end;
   end
   else
   begin
      Achou := True;
      Prefx := qryNNTurmaDS_NN_PREFIXO.AsString;
      Ultimo := qryNNTurmaNR_NN_ULTIMO.AsInteger;
      TamUltimo := Length(qryNNTurmaNR_NN_ULTIMO.AsString);
   end;

   if Achou then
   begin
      qryUpdNN.ParamByName('NR_NN_ULTIMO').AsInteger := Ultimo + 1;
      qryUpdNN.ParamByName('DS_NN_PREFIXO').AsString := Prefx;
      qryUpdNN.ExecSQL;

      if AnsiStartsStr(#91#65#76#85#78#79#58, Prefx) then
      begin
         S := AnsiMidStr(Prefx, AnsiPos(#91, Prefx),
               AnsiPos(#93, Prefx) - AnsiPos(#91, Prefx) +1);
         TryStrToInt(AnsiMidStr(S, AnsiPos(#58, S) + 1, 1), I);
         Prefx := AnsiReplaceStr(Prefx, S, Format('%d%s',
               [Aluno, StringOfChar(#48, I)]));
      end;
      
      Result := Format('%s%s%.8d', [Prefx, StringOfChar(#48, 8 - TamUltimo),
            Ultimo]);
   end;
end;

procedure TDM.CriarConsulta(var DataSet: TUMZReadOnlyQuery);
begin
   DataSet := TUMZReadOnlyQuery.Create(Self);
   DataSet.Connection := db;
end;

procedure TDM.CriarConsulta(var DataSet: TUMZQuery);
begin
   DataSet := TUMZQuery.Create(Self);
   DataSet.Connection := db;
   DataSet.UpdateMode := umUpdateChanged;
end;

procedure TDM.DataModuleCreate(Sender: TObject);
var
   ExeDir, IniPath: string;
   ConnIni: TIniFile;
begin
   sqlMonitor.Active := IsDebugging and TryLoadDebugger;

   ExeDir := ExtractFilePath(ParamStr(0));
   IniPath := ExeDir + 'unimestre.ini';

   ConnIni := TIniFile.Create(IniPath);
   try
      startConn.IniPath := IniPath;
      startConn.Active := ConnIni.ReadBool('Conexao', 'Usa.Start', False);

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

procedure TDM.dbBeforeDisconnect(Sender: TObject);
begin
   qryLogon.Close;
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

  campo.AsString := campo.AsString + CHR(13) + '==============================================' + CHR(13) + Observacao + CHR(13) + '--------------------------------------------------------' + CHR(13) + 'DATA: ' + DateTimeToStr(DataHoje) + '  USUÁRIO: ' + DM.qryLogonDS_LOGIN.AsString;

end;

function TDM.RequestPermission(const Key: string; const Level: TUMNivelPermissao;
  const Alert: Boolean; const AHandle: HWND): Boolean;
begin
   Result := GetUsuarioLogado.TemPermissao(0, 'ExtraCurriculares.' + Key, Level, Alert);
end;

procedure TDM.ResgataPagamentos;
var
   S: string;
   I: Integer;
begin
   S := variavel_parametro('extra_mensalidades_depto');

   if TryStrToInt(S, I) then
   begin
      qryResgataPgtos.Close;
      qryResgataPgtos.ParamByName('CD_DEPTO').AsInteger := I;
      qryResgataPgtos.Open;

      while not qryResgataPgtos.Eof do
      begin
         qryExtraMatriculas.Close;
         qryExtraMatriculas.ParamByName('NR_ANOSEMESTRE').AsInteger :=
               qryResgataPgtosNR_ANOSEMESTRE.AsInteger;
         qryExtraMatriculas.ParamByName('CD_PESSOA').AsInteger :=
               qryResgataPgtosCD_PESSOA.AsInteger;
         qryExtraMatriculas.ParamByName('NR_MES').AsInteger :=
               qryResgataPgtosNR_MES.AsInteger;
         qryExtraMatriculas.Open;

         if not qryExtraMatriculas.IsEmpty then
         begin
            qryExtraMatriculas.Edit;
            qryExtraMatriculasVL_PAGO.AsFloat :=
                  qryResgataPgtosVL_PAGO.AsFloat;
            qryExtraMatriculasDT_PAGAMENTO.AsDateTime :=
                  qryResgataPgtosDT_PAGAMENTO.AsDateTime;
            qryExtraMatriculas.Post;
         end;

         qryResgataPgtos.Next;
      end;
      qryResgataPgtos.Close;
      qryExtraMatriculas.Close;
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

function TDM.GetDB: TZConnection;
begin
   Result := Self.db;
end;

function TDM.GetUsuarioLogado: TUsuario;
begin
   Result := Self.UsuarioLogado;
end;

procedure TDM.qyLogsAfterInsert(DataSet: TDataSet);
begin
  qyLogs.FieldByName('dt_log').AsDateTime := DataHoje;
  qyLogs.FieldByName('hr_log').AsDateTime := Time;
  qyLogs.FieldByName('cd_usuario').AsInteger := qryLogonCD_PESSOA.AsInteger;
end;

procedure TDM.qyLogsAcessosAfterInsert(DataSet: TDataSet);
begin

  qyLogsAcessos.FieldByName('dt_log').AsDateTime := DataHoje;
  qyLogsAcessos.FieldByName('hr_log').AsDateTime := Time;
  qyLogsAcessos.FieldByName('cd_usuario').AsInteger := qryLogonCD_PESSOA.AsInteger;

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

{
   Esta função recupera o ultimo id inserido em base de dados
}
function TDM.LastInsert: Integer;
const
   SQL_LAST_INSERT_ID =
      ' SELECT LAST_INSERT_ID() AS ultimo ';
var
   qyLastInsertID: TUMZQuery;
begin
   CriarConsulta( qyLastInsertID );

   qyLastInsertID.SQL.Text := SQL_LAST_INSERT_ID;
   qyLastInsertID.Open();

   if qyLastInsertID.Eof then
   begin
      Result := -1
   end else begin
      Result := qyLastInsertID.FieldByName('ultimo').AsInteger;
   end;
   
   FreeAndNil( qyLastInsertID );
end;

function TDM.Logon(const User, Pass: string): Boolean;
begin
   qryLogon.Close;
   qryLogon.ParamByName('DS_LOGIN').AsString := User;
   qryLogon.ParamByName('DS_SENHA').AsString := Pass;
   qryLogon.Open;
   Result := not qryLogon.IsEmpty;
end;

end.
