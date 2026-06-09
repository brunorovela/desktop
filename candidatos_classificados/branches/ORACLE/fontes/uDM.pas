unit uDM;

interface

uses
  Forms, Db, ZConnection, Classes, Sysutils, Controls, General, IniFiles,
  ZAbstractRODataset, ZAbstractDataset, ZDataset, UZDataset, Menus, DBCtrls,
  StdCtrls, DateUtils, Mask, DBGrids, uMLogZeos, UMQuery, DBTables, ZAbstractTable,
  UZStartConnection, ZSqlMonitor, uIUMDataModule, uUMNucleo;

type
  TAcaoRemessa = (arBaixa, arCancelar, arDesconto, arProtestar, arEstornar, arAltMensalidade, arNegociar, arProrrogar, arImpBoleto, arGerarMensalidade);
  TStrSituacoes = (sitDescricao, sitSigla, sitCodigo, sitTexto);

  TDataModule = class(AUMDataModule)
  end;

  TDM = class(TDataModule)
    db: TZConnection;
    tblTurmas: TUMZQuery;
    tblTurmasCodigo: TStringField;
    tblTurmasAnoSemestre: TSmallintField;
    tblTurmasSerie: TSmallintField;
    tblTurmasCurso: TStringField;
    tblTurmasTurno: TStringField;
    tblTurmasDescricao: TStringField;
    tblTurmasContrato: TStringField;
    tblTurmasVagas: TSmallintField;
    tblTurmasHoraInicio: TDateTimeField;
    tblTurmasHoraFim: TDateTimeField;
    tblTurmasDataInicio: TDateTimeField;
    tblTurmasDataFim: TDateTimeField;
    tblTurmasIdadeConclusao: TSmallintField;
    tblTurmasDataConclusao: TDateTimeField;
    tblTurmasDiasSemanaisLetivos: TStringField;
    tblTurmasHorarioLetivo: TStringField;
    tblTurmasHorasAula: TStringField;
    tblCursos: TUMZQuery;
    tblCursosCodigo: TStringField;
    tblCursosAnoSemestre: TSmallintField;
    tblCursosDescricao: TStringField;
    qryUpdate: TUMZQuery;
    tblUsuariosNome: TUMZQuery;
    tblFeriados: TUMZQuery;
    tblCursosDepto: TSmallintField;
    RS_VAR: TUMZQuery;
    qAux1: TUMZQuery;
    qAux2: TUMZQuery;
    tblParametros: TUMZQuery;
    qryInsert: TUMZQuery;
    qyAux: TUMZQuery;
    qyAux1: TUMZQuery;
    qyAux2: TUMZQuery;
    qyUsuariosParametros: TUMZQuery;
    tblUsuariosNomeCODIGO: TIntegerField;
    tblUsuariosNomeSN_ONLINE: TStringField;
    tblUsuariosNomeONLINE: TStringField;
    tblUsuariosNomeNOME: TStringField;
    tblUsuariosNomeSENHA: TStringField;
    tblUsuariosNomeCD_PESSOA: TIntegerField;
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
    procedure DMCreate(Sender: TObject);


    function GetDB(): TZConnection; override;
   private
      strMotivos : String;
      dblParcial : Double;
      // Variaveis criada para efetuar confirmacao de matricula
      ArrayValores : Array[0..20] of Single;
      ArrayDescontos : Array[0..20] of Single;
      ArrayDescontosExtra : Array[0..20] of Single;
      ArrayDatas : Array[0..20] of TDateTime;
      ArrayParcelas : Array[0..20] of Integer;
      ArrayValorExtra : Array[0..20] of Single;
      FDLLHandle: THandle;
      FDLLProc: procedure(Event: Pointer); stdcall;

      {**
         Esta função consulta a tabela diário de provas para verificar quais são
         as provas cadastradas para uma determinada turma e disciplina na etapa
         do ano/semestre, exceto as provas marcadas como sn_compoe igual a 0.
         A função retorna uma string com o conjunto de notas que serão usadas
         para calcular a média do aluno.
      }
      function ConectaUnimestre: boolean;

      function IsDebugging: Boolean;
      function TryLoadDebugger: Boolean;

  public

    { Lista de Situações que será resgatada da tabela }
    strReports : String;
    iColigadaSelecionada : Smallint;
    sColigadaSelecionada : String;
    sColigadaSelecionadaRazao : String;

    iCdPessoaLogado: Integer;

    lst_situacao_desc : array  of String[20];
    lst_situacao_sigla : array  of String[20];


    flg : Boolean;
    indIndice : Array[0..255] of Single;

    // Função para descobrir o valor do parâmetro tabelado

    Function NomeDoBoleto( iDepto : Integer; sTurma : String; iAnoSemestre : Integer; Caixa : String = '') : String;

    function variavel_parametro(variavel : string; const parametro_geral: Boolean = True) : string;
    // Funcão para setar o valor da variável
    procedure set_variavel_parametro(variavel : string; valor : string);

    // Procedure para descobrir quantidade de registros do DataSet passado
    // Para TUMZQuery
    procedure quantidade_registros(DataSet: TUMZQuery; Popup: TPopupMenu);

    // Procedure para descobrir quantidade de registros do DataSet passado
    // Para TZTable
    procedure quantidade_registros_table(DataSet: TZTable; Popup: TPopupMenu);


    function NovoNumero(iDepto:Integer; sTurma:String; iAnoSemestre : Integer; Tentativas : integer = 0; iConta : Integer = 0; iColigada : Integer = 0; CodigoAluno : Integer = 0) : String;

    function ContaBoletoPadrao(iDepto:Integer; sTurma:String; iAnoSemestre : Integer) : String;


    function Converter_para_ponto(Valor : Double) : String;
    function condicao_com_arredondamento(calculo_notas,  formula, arredonda : string) : string;
    function getSituacao(situacao, modulo: integer): String;



    { Public declarations }

    Function incrementar_ano_semestre( valor : String ) : String;







    procedure gerar_log( tipo : integer; msg : string; usuario: integer; chaves : string );

    // Procedure para gravar LOGS de acessos
    procedure CriarConsulta( var DataSet : TUMZQuery ); overload;
    procedure CriarConsulta( var DataSet : TUMZReadOnlyQuery ); overload;

    // Procedure que verifica o parâmetro sn_todas_maiusculas


    // Procedure que verifica o parâmetro sn_todas_maiusculas
    procedure TodasMaiusculasFrame(Frame: TFrame);

    //seta uma preferencia do usuário
    procedure Set_Parametro_usuario(componente: TComponent;nomeFormulario:string);

    procedure Set_Parametro_usuario_valor(nomeParametro: String; valorParametro : String ;nomeFormulario:string);

    // Procedure para setar os parâmetros do usuário
    procedure Set_Parametros_usuario(Formulario: TForm);

    // Procedure para ler os parâmetros do usuário


    // Procedure para remover um parametro do usuario
    procedure Delete_Parametro_Usuario(componente : TComponent;nomeFormulario:string);

    //Pega uma preferencia do usuário em relação a um campo


    function Get_Parametro_usuario_valor(nomeParametro: String; nomeFormulario:string):String;

    // Função para verificar se o indivíduo tem livros em atraso na biblioteca


    Function DataAtual(): TDateTime;

    // Função que retorna a quantidade de dias úteis num intervalo de datas para um setor informado
    // Setores possíveis: biblioteca, financeiro, secretaria
    Function DiasUteis(setor: string; dt_inicial,dt_final: TDateTime): integer;

    Function ProximoId(campo, tabela: string): integer;

    function ExisteRegistro(tabela: string; campo: ARRAY of string; valor: ARRAY of string):Boolean;



    function CabecalhoCampos(iCodCabecalho: LongInt): string;

    function CabecalhoParamFixos(): TStringList;

    // Procedure que registra observações no campo informado
    Procedure RegistraObservacoes(campo: TField; Observacao: String);

    // Procedure para mostrar o Log num Popup
    procedure MostraLog(cd_modulo,cd_titulo,cd_caixa,nr_sequencia: integer; dt_movimento: TDateTime; Popup: TPopupMenu);

    // Função para retornar o próximo ID a ser utilizado (considerando relacionamento entre tabelas)
    Function ProximoId2(campo1, campo2, tabela: string; filtro: integer): integer;

    //remessa


    function DefineNumeroMatricula(sTurma: string; iAnoSem: Integer): LongInt;

    Function DefinirHistoricoCaixa(iCodigoMensalidade : Integer; sParametroHistorico : String) : string;

    //Faz todo o Recalculo de faltas dos registros em diario_lista_presenca que estao marcados como N em sn_imp_diario

    function CarregaSituacoes(var slDados: TStringList; iModulo: Integer; sitMostra: TStrSituacoes): Boolean;

    Function ConverterNullEmZero( sFormula : string ) : String;

    function getEtapaAtual(iPadrao: Integer = 1): Integer;

    Procedure montarPlanilha(Grade : TDBGrid; dsChave: String);

    procedure setLog(cd_modulo: integer; operacao: string; chave : string = ''; coligada : integer = 0; ds_observacoes: string = ''); overload;

    function ConverteCambio(iMoedaBase, iMoedaCambio : integer; dCambio : TDateTime; cValor : Currency; ParaMoedaBase : Boolean = false) : Currency;

    Function EhFeriado(Data : TDateTime; Modulo : byte) : Boolean;

    function GetAnoSemestreAtual: integer;
    procedure DefineRateioApropriacaoPorMatriculas(const AICodApropriacao, AIAnoSemestre: integer);

    // executa uma procedure no banco
    function callProcedure(
      const SQL: String;
      const sn_exibi_erro: Boolean
    ): Boolean;
  end;

var
  DM: TDM;
  slPFixos: TStringList;

implementation

uses
   Main, Math, uSplash, Windows, Dialogs, uRegExpr, Spin, ExtCtrls, ZDbcIntfs;

{$R *.DFM}

procedure TDM.DMCreate(Sender: TObject);
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
         on E: Exception do raise;
      end;
   finally
      ConnIni.Free;
   end;
   
   flg := False;

  try
     DM.qAux1.Close;
     DM.qAux1.SQL.Text := 'SELECT * FROM SITUACAO ORDER BY CD_SITUACAO';
     DM.qAux1.Open;

     SetLength( lst_situacao_desc, DM.qAux1.RecordCount );
     SetLength( lst_situacao_sigla, DM.qAux1.RecordCount );

     While not DM.qAux1.Eof do
     Begin
     	 lst_situacao_desc[DM.qAux1.FieldByName('cd_situacao').AsInteger] := DM.qAux1.FieldByName('ds_situacao').AsString;
     	 lst_situacao_sigla[DM.qAux1.FieldByName('cd_situacao').AsInteger] := DM.qAux1.FieldByName('ds_sigla_situacao').AsString;
    	 DM.qAux1.Next;
     End;
  except
      Mensagem('Não foi possível importar todas as situações de matrículas. Por favor, contate o suporte técnico', 'Erro', MB_OK + MB_ICONERROR);
  End;

end;

function TDM.NovoNumero(iDepto:Integer; sTurma:String; iAnoSemestre : Integer; Tentativas : integer = 0; iConta : Integer = 0; iColigada : Integer = 0; CodigoAluno : Integer = 0) : String;
var
  lngAux : Longint;
  strAux : String;
  qyNN : TUMZQuery;
  AlteraNN : Boolean;
  sAluno : String;
  iTamanho : Integer;
  iTamNN : Integer;
begin
    Dm.CriarConsulta(qyNN);
    qyNN.Close();

    AlteraNN := false;

    if iConta <> 0 then begin
       qyNN.SQL.Text :=
       ' SELECT fcc.ds_nn_prefixo, fcc.nr_nn_ultimo, fcc.nr_nn_tamanho FROM fin_cadastro_contas fcc ' +
       ' WHERE fcc.cd_caixa = ' + IntToStr(iConta) + ' AND fcc.cd_coligada = ' + IntToStr(iColigada);
       qyNN.Open();
       strAux := qyNN.FieldByName('ds_nn_prefixo').AsString;
       lngAux := qyNN.FieldByName('nr_nn_ultimo').AsInteger;
       iTamNN := qyNN.FieldByName('nr_nn_tamanho').AsInteger;
       AlteraNN := True;

    end else begin

        // Pesquisar o NN a partir do cd_caixa no cadastro de turmas
        qyNN.SQL.Text :=
          ' SELECT fcc.ds_nn_prefixo, fcc.nr_nn_ultimo, fcc.nr_nn_tamanho FROM fin_cadastro_contas fcc ' +
          ' INNER JOIN turmas t ON (fcc.cd_caixa = t.cd_caixa AND fcc.cd_coligada = t.cd_coligada) ' +
          ' WHERE t.codigo = "' + sTurma + '" AND t.anosemestre = ' + IntToStr(iAnoSemestre);
        qyNN.Open();

        if not qyNN.Eof then begin
           strAux := qyNN.FieldByName('ds_nn_prefixo').AsString;
           lngAux := qyNN.FieldByName('nr_nn_ultimo').AsInteger;
           iTamNN := qyNN.FieldByName('nr_nn_tamanho').AsInteger;
           AlteraNN := True;
        end else
        begin  // Pesquisar o NN a partir do cd_bloqueto_padrao nos departamentos
           qyNN.Close();
           qyNN.SQL.Text :=
             ' SELECT fcc.ds_nn_prefixo, fcc.nr_nn_ultimo, fcc.nr_nn_tamanho FROM fin_cadastro_contas fcc ' +
             ' INNER JOIN departamentos d ON (fcc.cd_caixa = d.cd_boleto_padrao AND fcc.cd_coligada = d.cd_coligada) ' +
             ' WHERE d.codigo = ' + IntToStr(iDepto);
           qyNN.Open();

           if not qyNN.Eof then begin
              strAux := qyNN.FieldByName('ds_nn_prefixo').AsString;
              lngAux := qyNN.FieldByName('nr_nn_ultimo').AsInteger;
              iTamNN := qyNN.FieldByName('nr_nn_tamanho').AsInteger;
              AlteraNN := True;
           end else begin
              try
                 strAux := DM.variavel_parametro('nosso_numero_prefixo');
                 lngAux := StrToInt(DM.variavel_parametro('nosso_numero_ultimo'));
                 DM.set_variavel_parametro('nosso_numero_ultimo', IntToStr(lngAux + 1 ));
                 iTamNN := 8;
              except
                 Result := '';
              end
           end

        end
    end;

    if AlteraNN then begin
       qyNN.Close;
       qyNN.SQL.Text :=
       ' UPDATE fin_cadastro_contas SET nr_nn_ultimo = :ultimo ' +
       ' WHERE ds_nn_prefixo = :prefixo AND nr_nn_ultimo = ' +  IntToStr(lngAux);
       qyNN.ParamByName('ultimo').AsInteger := lngAux + 1;
       qyNN.ParamByName('prefixo').AsString := strAux;
       qyNN.ExecSQL();
    end;

    // Alterar o prefixo do NN

    if Pos('[ALUNO:', strAux) > 0 then begin

       // 0000[ALUNO:8]00
       sAluno := Copy(strAux, Pos('[',strAux), Pos(']', strAux) - Pos('[',strAux)+1);
       iTamanho := StrToInt(Copy(sAluno, Pos(':', sAluno) + 1, 1));
       strAux := ReplaceStr(strAux, sAluno, FillString(IntToStr(Codigoaluno), alRight, '0', iTamanho, true ));

    end;

    if iTamNN = 8 then iTamNN := 8;

    strAux := strAux + Format('%.' + IntToStr(iTamNN) + 'd', [lngAux]);

    // Procurar o nossonúmero na planilha de mensalidades // Não pode existir dois números iguais

    if strAux <> '' then begin

       qyNN.Close();
       qyNN.SQL.Text :=
          ' SELECT nossonumero FROM mensalidades ' +
          ' WHERE nossonumero = "' + strAux + '"';
       qyNN.Open();

       if not qyNN.Eof then begin
          // O nossonúmero ja existe, tentar outro

          if Tentativas >= 200 then
             exit
          else
             strAux := NovoNumero(iDepto, sTurma, iAnoSemestre, Tentativas + 1, iConta, iColigada, CodigoAluno);

       end;

    end;

    FreeAndNil(qyNN);

    Result := strAux;
end;

function TDM.getSituacao(situacao,modulo:integer):String;
var
   qyAux : TUMZQuery;
begin
   CriarConsulta(qyAux);

   qyAux.Close();
   qyAux.SQL.Text:=
   ' SELECT ds_valor FROM situacoes WHERE cd_modulo='+IntToStr(modulo)+' AND cd_situacao='+IntToStr(situacao);

   qyAux.Open();
   qyAux.First();

   result := qyAux.FieldByName('ds_valor').AsString;
end;

function TDM.variavel_parametro(variavel: string; const parametro_geral: Boolean): string;
begin
   Result := TUMNucleo.GetParametro(variavel, parametro_geral);
end;

procedure TDM.set_variavel_parametro(variavel, valor: string);
begin

    DM.qAux1.Close;
    DM.qAux1.SQL.Clear;
    DM.qAux1.SQL.Text := 'UPDATE parametros SET ds_valor = ''' + valor + ''' WHERE ds_variavel=''' +  variavel + '''';
    DM.qAux1.ExecSQL;

end;

procedure TDM.sqlMonitorLogTrace(Sender: TObject; Event: TZLoggingEvent);
begin
   FDllProc(Pointer(Event));
end;

procedure TDM.startConnDefaultConnection(Sender: TObject);
begin
   ConectaUnimestre;
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

function TDM.Converter_para_ponto(Valor: Double): String;
var text: string;
begin
   text := Trim(FloatToStrF(valor,  ffFixed, 6, 10));
   text := copy(text, 1, Pos(',', text)-1) + '.' + copy(text, pos(',',text)+1,5);

   Result := Trim(text);

end;

function TDM.condicao_com_arredondamento(calculo_notas, formula,
  arredonda: string): string;
var
   text : string;
   velho: string;
begin

   velho := lowercase(formula);
   text := ReplaceStr(velho, 'mediafinal', '(' + calculo_notas + ' + ' + arredonda + ')');

   result := text;

end;


function TDM.GetAnoSemestreAtual: integer;
var
   LSAnoSemestre: string;
   LWAno, LWMes, LWDia: Word;
begin
   DecodeDate(Now, LWAno, LWMes, LWDia);
   if (LWMes > 6) and (ano_semestre_incremento = 1) then
   begin
      LSAnoSemestre := Format('%d%d', [LWAno, 2]);
   end
   else
   begin
      LSAnoSemestre := Format('%d%d', [LWAno, 1]);
   end;
   Result := StrToInt(LSAnoSemestre);
end;


function TDM.GetDB: TZConnection;
begin
   Result := db;
end;

procedure TDM.gerar_log(tipo: integer; msg: string; usuario: integer; chaves : string);
Var
   qyLog : TUMZQuery;
begin
{
Função para Gerar um registro de Log
tipo =
1 - Alteração de Créditos de Mensalidades;
2 - Exclusão de mensalidade;
3 - Exclusão de matrícula;

}

   try
      DM.CriarConsulta(qyLog);

      qyLog.Close;
      qyLog.SQL.Clear;
      qyLog.SQL.Add('INSERT INTO LOGS (cd_tipo, dt_log, ds_log, cd_usuario, cd_chave) ');
      qyLog.SQL.Add('VALUES (:tipo, NOW(), :msg, :cd_usuario, :cd_chave)');

      qyLog.ParamByName('tipo').AsInteger := tipo;
      qyLog.ParamByName('msg').AsString := msg;
      qyLog.ParamByName('cd_usuario').AsInteger := usuario;
      qyLog.ParamByName('cd_chave').AsString := chaves;
      qyLog.execsql;
   finally
      qyLog.Free;
   end;
end;

procedure TDM.CriarConsulta(var DataSet: TUMZQuery);
  {
  FDES= Criar uma instancia do objeto Query e define os parametros necessários para
        o  UNIMESTRE
  FPAR= DataSet -> Variável do tipo TUMZQuery
  FAUT= Claudionor
  FMOD= 08/07/2004
  }
begin
   DataSet := TUMZQuery.Create(Self);
   DataSet.Connection := db;
   // DataSet.DatabaseName := 'WMestre12';
   // DataSet.SessionName := Dm.Session1.SessionName;
   DataSet.UpdateMode := umUpdateChanged;
end;

procedure TDM.CriarConsulta(var DataSet: TUMZReadOnlyQuery);
begin
   DataSet := TUMZReadOnlyQuery.Create(Self);
   DataSet.Connection := db;
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

//Esta função fará a atualização de um campo previamente selecionado pelo usuário
//Obs Já foi testado para : TComboBox , favor quem testar outros tipos de campos adicionar aqui no comentário
procedure TDM.Set_Parametro_usuario(componente : TComponent;nomeFormulario:string);
var
   cd_usuario : integer;
   ds_parametro, ds_valor : string;
   executar : boolean;
begin

executar := false;

 if ( componente.ClassType = TEdit )  then
 begin

   cd_usuario := tblUsuariosNome.FieldByName('Codigo').AsInteger;
   ds_parametro := nomeFormulario+'.'+TEdit(componente).Name;
   ds_valor := TEdit(componente).Text;
   executar := true;

 end
 else if ( componente.ClassType = TMaskEdit )  then
 begin

   cd_usuario := tblUsuariosNome.FieldByName('Codigo').AsInteger;
   ds_parametro := nomeFormulario+'.'+TMaskEdit(componente).Name;
   ds_valor := TMaskEdit(componente).Text;
   executar := true;

 end
 else if ( componente.ClassType = TComboBox ) then
 begin

   cd_usuario := tblUsuariosNome.FieldByName('Codigo').AsInteger;
   ds_parametro := nomeFormulario+'.'+TComboBox(componente).Name;
   ds_valor := TComboBox(componente).Text;
   executar := true;

 end
 else if ( componente.ClassType = TCheckBox ) then
 begin

   if TCheckBox(componente).checked then begin
      cd_usuario := tblUsuariosNome.FieldByName('Codigo').AsInteger;
      ds_parametro := nomeFormulario+'.'+TCheckBox(componente).Name;
      ds_valor := 'S';
   end else begin
      cd_usuario := tblUsuariosNome.FieldByName('Codigo').AsInteger;
      ds_parametro := nomeFormulario+'.'+TCheckBox(componente).Name;
      ds_valor := 'N';
   end;

   executar := true;

 end
 else if ( componente.ClassType = TRadioButton ) then
 begin
    cd_usuario := tblUsuariosNome.FieldByName('Codigo').AsInteger;
    ds_parametro := nomeFormulario+'.'+TRadioButton(componente).Name;

    if TRadioButton(componente).checked then
    begin
      ds_valor := 'S';
    end
    else
    begin
      ds_valor := 'N';
    end;

    executar := true;
 end
 else if ( componente.ClassType = TSpinEdit ) then
 begin
    cd_usuario := tblUsuariosNome.FieldByName('Codigo').AsInteger;
    ds_parametro := nomeFormulario+'.'+TSpinEdit(componente).Name;
    ds_valor := Format('%d', [TSpinEdit(componente).Value]);
    executar := true;
 end
 else if componente.ClassType = TRadioGroup then
 begin
    cd_usuario := tblUsuariosNomeCodigo.AsInteger;
    ds_parametro := nomeFormulario + '.' + componente.Name;
    ds_valor := Format('%d', [TRadioGroup(componente).ItemIndex]);
    executar := true;
 end;

 if executar then
 begin
   qyUsuariosParametros.ParamByName('cd_usuario').AsInteger := cd_usuario;
   qyUsuariosParametros.ParamByName('ds_parametro').AsString := ds_parametro;
   qyUsuariosParametros.ParamByName('ds_valor').AsString := ds_valor;

   qyUsuariosParametros.ExecSQL;
 end;

end;

procedure TDM.Set_Parametro_usuario_valor(nomeParametro: String; valorParametro : String ;nomeFormulario:string);
var
   cd_usuario : integer;
   ds_parametro, ds_valor : string;
begin

   cd_usuario := tblUsuariosNome.FieldByName('Codigo').AsInteger;
   ds_parametro := nomeFormulario+'.'+nomeParametro;
   ds_valor := valorParametro;

   qyUsuariosParametros.ParamByName('cd_usuario').AsInteger := cd_usuario;
   qyUsuariosParametros.ParamByName('ds_parametro').AsString := ds_parametro;
   qyUsuariosParametros.ParamByName('ds_valor').AsString := ds_valor;

   qyUsuariosParametros.ExecSQL;

end;

function TDM.Get_Parametro_usuario_valor(nomeParametro,
  nomeFormulario: string): String;
begin

  DM.qAux1.Close;
  DM.qAux1.SQL.Clear;
  DM.qAux1.SQL.Text := 'SELECT ds_valor FROM usuarios_parametros WHERE cd_usuario = :cd_usuario AND ds_parametro = :ds_parametro';
  DM.qAux1.ParamByName('cd_usuario').AsInteger := tblUsuariosNome.FieldByName('Codigo').AsInteger;
  DM.qAux1.ParamByName('ds_parametro').AsString := nomeFormulario+'.'+nomeParametro;

  DM.qAux1.Open();

  result :=  DM.qAux1.fieldByName('ds_valor').asString;


end;

//Esta função serve para remover um parametro de usuário
//Obs Já foi testado para : TComboBox ,TRadioButton favor quem testar outros tipos de campos adicionar aqui no comentário
procedure TDM.Delete_Parametro_Usuario(componente : TComponent;nomeFormulario:string);
begin
//Delete
if ( componente.ClassType = TEdit )  then
 begin

   DM.qAux2.Close;
   DM.qAux2.SQL.Clear;

   DM.qAux2.SQL.Text := 'DELETE FROM usuarios_parametros WHERE cd_usuario=:cd_usuario AND ds_parametro=:ds_parametro';
   DM.qAux2.ParamByName('cd_usuario').AsInteger  := tblUsuariosNome.FieldByName('Codigo').AsInteger;
   DM.qAux2.ParamByName('ds_parametro').AsString := TEdit(componente).Name;

   DM.qAux2.ExecSQL;

 end
 else if ( componente.ClassType = TMaskEdit )  then
 begin

   DM.qAux2.Close;
   DM.qAux2.SQL.Clear;

   DM.qAux2.SQL.Text := 'DELETE FROM usuarios_parametros WHERE cd_usuario=:cd_usuario AND ds_parametro=:ds_parametro';
   DM.qAux2.ParamByName('cd_usuario').AsInteger  := tblUsuariosNome.FieldByName('Codigo').AsInteger;
   DM.qAux2.ParamByName('ds_parametro').AsString := TMaskEdit(componente).Name;


   DM.qAux2.ExecSQL;

 end
 else if ( componente.ClassType = TComboBox ) then
 begin

   DM.qAux2.Close;
   DM.qAux2.SQL.Clear;

   DM.qAux2.SQL.Text := 'DELETE FROM usuarios_parametros WHERE cd_usuario=:cd_usuario AND ds_parametro=:ds_parametro';
   DM.qAux2.ParamByName('cd_usuario').AsInteger := tblUsuariosNome.FieldByName('Codigo').AsInteger;
   DM.qAux2.ParamByName('ds_parametro').AsString := nomeFormulario+'.'+TComboBox(componente).Name;

   DM.qAux2.ExecSQL;

 end
 else if ( componente.ClassType = TCheckBox ) then
 begin

   DM.qAux2.Close;
   DM.qAux2.SQL.Clear;


   DM.qAux2.SQL.Text := 'DELETE FROM usuarios_parametros WHERE cd_usuario=:cd_usuario AND ds_parametro=:ds_parametro';
   DM.qAux2.ParamByName('cd_usuario').AsInteger := tblUsuariosNome.FieldByName('Codigo').AsInteger;
   DM.qAux2.ParamByName('ds_parametro').AsString := nomeFormulario+'.'+TCheckBox(componente).Name;

 
   DM.qAux2.ExecSQL;
 end;

end;





procedure TDM.Set_Parametros_usuario(Formulario: TForm);
var
  n : LongInt ;
begin

  for n := 0 to ( Formulario.ComponentCount - 1 ) do
  begin
    if ( Formulario.components[n].ClassType = TEdit )  then
    begin

      DM.qAux2.Close;
      DM.qAux2.SQL.Clear;

      DM.qAux2.SQL.Text := 'REPLACE INTO usuarios_parametros(cd_usuario,ds_parametro,ds_valor) VALUES('+tblUsuariosNome.FieldByName('Codigo').AsString+','''+Formulario.Name+'.'+TEdit(Formulario.components[n]).Name+''','''+TEdit(Formulario.components[n]).Text+''')';
      DM.qAux2.ExecSQL;

    end
    else if ( Formulario.components[n].ClassType = TMaskEdit )  then
    begin

      DM.qAux2.Close;
      DM.qAux2.SQL.Clear;

      DM.qAux2.SQL.Text := 'REPLACE INTO usuarios_parametros(cd_usuario,ds_parametro,ds_valor) VALUES('+tblUsuariosNome.FieldByName('Codigo').AsString+','''+Formulario.Name+'.'+TMaskEdit(Formulario.components[n]).Name+''','''+TMaskEdit(Formulario.components[n]).Text+''')';
      DM.qAux2.ExecSQL;

    end
    else if ( Formulario.components[n].ClassType = TComboBox ) then
    begin

      DM.qAux2.Close;
      DM.qAux2.SQL.Clear;

      DM.qAux2.SQL.Text := 'REPLACE INTO usuarios_parametros(cd_usuario,ds_parametro,ds_valor) VALUES('+tblUsuariosNome.FieldByName('Codigo').AsString+','''+Formulario.Name+'.'+TComboBox(Formulario.components[n]).Name+''','''+TComboBox(Formulario.components[n]).Text+''')';
      DM.qAux2.ExecSQL;

    end
    else if ( Formulario.components[n].ClassType = TCheckBox ) then
    begin

      DM.qAux2.Close;
      DM.qAux2.SQL.Clear;
      if TCheckBox(Formulario.components[n]).checked then
         DM.qAux2.SQL.Text := 'REPLACE INTO usuarios_parametros(cd_usuario,ds_parametro,ds_valor) VALUES('+tblUsuariosNome.FieldByName('Codigo').AsString+','''+Formulario.Name+'.'+TCheckBox(Formulario.components[n]).Name+''',''S'')'
      else
        DM.qAux2.SQL.Text := 'REPLACE INTO usuarios_parametros(cd_usuario,ds_parametro,ds_valor) VALUES('+tblUsuariosNome.FieldByName('Codigo').AsString+','''+Formulario.Name+'.'+TCheckBox(Formulario.components[n]).Name+''',''N'')';

      DM.qAux2.ExecSQL;

    end;

  end ;

end;



Function TDM.DataAtual(): TDateTime;
Begin
  qAux1.Close;
  qAux1.SQL.Clear;
  qAux1.SQL.Add('SELECT NOW() AS data FROM dual');
  qAux1.Open;

  Result := qAux1.FieldByName( 'data' ).AsDateTime;
End;


procedure TDM.DataModuleDestroy(Sender: TObject);
begin
   @FDLLProc := nil;
   FreeLibrary(FDLLHandle);
end;

Function TDM.DiasUteis(setor: string; dt_inicial,dt_final:TDateTime): integer;
var
  data: TDateTime;
  dias: integer;
begin

  data := dt_inicial;
  dias := 0;

  while data <= dt_final do
  begin

    DM.qAux1.Close;
    DM.qAux1.SQL.Clear;
    DM.qAux1.SQL.Add('SELECT * FROM calendario WHERE nr_dia = :dia AND nr_mes = :mes AND nr_ano = :ano AND sn_'+setor+' = ''N''');
    DM.qAux1.ParamByName('dia').AsString := FormatDateTime('dd', data);
    DM.qAux1.ParamByName('mes').AsString := FormatDateTime('mm', data);
    DM.qAux1.ParamByName('ano').AsString := FormatDateTime('yyyy', data);
    DM.qAux1.Open;

    if DM.qAux1.Eof then
      Inc(dias);

    data := IncDay(data, 1);

  end;

  Result := dias;

end;


Function TDM.ProximoId(campo, tabela: string): integer;
var
   qyAux1 : TUMZQuery;
begin

  CriarConsulta(qyAux1);
  qyAux1.SQL.Clear;
  qyAux1.SQL.Add('SELECT MAX('+campo+') AS id FROM '+tabela);
  qyAux1.Open;

  Result := qyAux1.FieldByName('id').AsInteger + 1;

  qyAux1.Close;

end;

function TDM.EhFeriado(Data: TDateTime; Modulo: byte): Boolean;
Var
   qFeriado : TUMZQuery;
   Dia, Mes, Ano : Word;
begin

   DecodeDate(Data, Ano, Mes, Dia);

   Dm.CriarConsulta(qFeriado);

   qFeriado.SQL.Text :=
     '  SELECT * FROM calendario ' +
     '  WHERE nr_dia = ' + IntToStr(Dia) +
     '    AND nr_mes = ' + IntToStr(Mes) +
     '    AND nr_ano = ' + IntToStr(Ano); 

   Case Modulo of
     1 : qFeriado.SQL.Add(' AND sn_secretaria = "N" ');

     2 : qFeriado.SQL.Add(' AND sn_financeiro = "N" ');

     4: qFeriado.SQL.Add(' AND sn_biblioteca = "N" ');

   end;

   qFeriado.Open();

   Result := not qFeriado.IsEmpty;

   FreeAndNil(qFeriado);

end;



function TDM.ExisteRegistro(tabela: string; campo: ARRAY of string; valor: ARRAY of string):Boolean;
var
   qyAux1 : TUMZQuery;
   sOp : String;

   i : SmallInt;
begin

  CriarConsulta(qyAux1);

  qyAux1.Close;
  qyAux1.SQL.Clear;
  qyAux1.SQL.Add('SELECT COUNT(*) as qtde FROM ' + tabela);

  sOp := ' WHERE ' ;

  For i := 0 to Length(campo) - 1 do begin
      qyAux1.SQL.Add( sOP + ' ' + campo[i] + ' = "' + valor[i] + '"' );
      sOp := ' AND '; 
  end;

  qyAux1.Open();

  if qyAux1.FieldByName('qtde').AsInteger > 0 then
    Result := True
   else
    Result := False;

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
      SQL.Add('SELECT ds_variavel, ds_valor FROM parametros WHERE cd_categoria = :cdcategoria ORDER BY ds_variavel');
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


Procedure TDM.RegistraObservacoes(campo: TField; Observacao: String);
begin

  campo.AsString := campo.AsString + CHR(13) + '==============================================' + CHR(13) + Observacao + CHR(13) + '--------------------------------------------------------' + CHR(13) + 'DATA: ' + DateTimeToStr(DataHoje) + '  USU�?RIO: ' + DM.tblUsuariosNome.FieldByName('Nome').AsString;

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

Function TDM.ProximoId2(campo1, campo2, tabela: string; filtro: integer): integer;
begin

  qyAux1.Close;
  qyAux1.SQL.Clear;
  qyAux1.SQL.Add('SELECT MAX('+campo1+') AS id FROM '+tabela+' WHERE '+campo2+' = '+IntToStr(filtro));
  qyAux1.Open;

  Result := qyAux1.FieldByName('id').AsInteger + 1;

  qyAux1.Close;

end;


function TDM.DefineNumeroMatricula(sTurma: string; iAnoSem: Integer): LongInt;
var
   iNum: LongInt;
begin
    iNum := 0;
    with qAux2 do begin
      Close;
      SQL.Clear;
      SQL.Add(' SELECT (MAX(nr_aluno)+1) as nro from matriculas ');
      SQL.Add(' WHERE turma = :CdTurma AND anosemestre = :NrAnoSem ');

      ParamByName('CdTurma').AsString := sTurma;
      ParamByName('NrAnoSem').AsInteger := iAnoSem;
      Open();

      if not IsEmpty then begin
         iNum := FieldByName('nro').AsInteger;
      end;
      Close();
    end;
    Result := iNum;
end;

{ **
   Calcula o rateio do critério de apropriação para os centros de custo com base
   na quantidade de matrículas por centro de custo.
}
procedure TDM.DefineRateioApropriacaoPorMatriculas(const AICodApropriacao,
  AIAnoSemestre: integer);
const
   // Agrupa o total de matrículas agrupados pelo centro de custo e coligada
   SQL_GET_MATRICULAS =
      'SELECT '+
         't.cd_centro,'+
         't.cd_coligada,'+
         'COUNT(*) total '+
      'FROM '+
         'matriculas m '+
            'JOIN turmas t ON '+
               '(m.anosemestre = t.anosemestre) AND '+
               '(m.turma = t.codigo) '+
            'JOIN situacao s ON '+
               '(m.situacao = s.cd_situacao)'+
      'WHERE '+
         'm.anosemestre = :nr_anosemestre AND '+
         'NOT t.cd_centro IS NULL AND '+
         's.cd_situacao_pai IN (1, 2) '+
      'GROUP BY '+
         't.cd_centro, t.cd_coligada';

   // Zera os valores dos critérios
   SQL_UPDATE_ZERA_PERCENTUAIS =
      'UPDATE fin_criterios_apropria_itens '+
      'SET vl_apropriacao = 0 '+
      'WHERE cd_apropriacao = :cd_apropriacao';

   // Atualizao rateio do critério para o centro de custo
   SQL_UPDATE_VLS_APROPRIA =
      'UPDATE fin_criterios_apropria_itens '+
      'SET vl_apropriacao = :vl_apropriacao '+
      'WHERE '+                                                              
         'cd_apropriacao = :cd_apropriacao AND '+
         'cd_centro = :cd_centro AND '+
         'cd_coligada = :cd_coligada';
var
   LQyGetMatriculas, LQyAtuVlsApropria: TUMZQuery;
   LITotalMatriculas: integer;
begin
   DM.CriarConsulta(LQyGetMatriculas);
   try
      // Pega as matrículas agrupadas pelo centro de custo
      LQyGetMatriculas.SQL.Text := SQL_GET_MATRICULAS;
      LQyGetMatriculas.ParamCheck := true;
      LQyGetMatriculas.ParamByName('nr_anosemestre').AsInteger := AIAnoSemestre;
      LQyGetMatriculas.Open;
      // Zera os percentuais atuais rateados para os centros
      DM.CriarConsulta(LQyAtuVlsApropria);
      try
         LQyAtuVlsApropria.SQL.Text := SQL_UPDATE_ZERA_PERCENTUAIS;
         LQyAtuVlsApropria.ParamCheck := true;
         LQyAtuVlsApropria.ParamByName('cd_apropriacao').AsInteger := AICodApropriacao;
         LQyAtuVlsApropria.ExecSQL;
         // Verifica se há registros
         if not LQyGetMatriculas.IsEmpty then
         begin
            // Inicializa SQL
            LQyAtuVlsApropria.SQL.Text := SQL_UPDATE_VLS_APROPRIA;
            LQyAtuVlsApropria.ParamByName('cd_apropriacao').AsInteger := AICodApropriacao;
            LITotalMatriculas := 0;
            // Cálcula o total de matrículas encontradas com centros de custo
            while not LQyGetMatriculas.Eof do
            begin
               Inc(LITotalMatriculas, LQyGetMatriculas.FieldByName('total').AsInteger);
               LQyGetMatriculas.Next;
            end;
            // Volta ao primeiro registro da Query
            LQyGetMatriculas.First;
            while not LQyGetMatriculas.Eof do
            begin
               // Para cada centro de custo, atualiza o valor percentual do rateio
               LQyAtuVlsApropria.ParamByName('cd_centro').AsInteger :=
                  LQyGetMatriculas.FieldByName('cd_centro').AsInteger;
               LQyAtuVlsApropria.ParamByName('cd_coligada').AsInteger :=
                  LQyGetMatriculas.FieldByName('cd_coligada').AsInteger;
               LQyAtuVlsApropria.ParamByName('vl_apropriacao').AsFloat :=
                  LQyGetMatriculas.FieldByName('total').AsFloat * 100 / LITotalMatriculas;
               LQyAtuVlsApropria.ExecSQL;
               LQyGetMatriculas.Next;
            end;
         end;
      finally
         FreeAndNil(LQyAtuVlsApropria);
      end;
   finally
      LQyGetMatriculas.Close;
      FreeAndNil(LQyGetMatriculas);
   end;
end;

function TDM.DefinirHistoricoCaixa(iCodigoMensalidade: Integer;
  sParametroHistorico: String): string;
var
  sDescricao : String;
  sDsParcela : String;
begin
   // Retorna a string para lançamento do caixa
   // [cd_pessoa], [nm_pessoa], [nm_responsavel], [nr_parcela], [dt_vencimento] e [ds_parcela]

   sDescricao := sParametroHistorico;

   qyAux2.Close;
   qyAux2.SQL.Clear;
   qyAux2.SQL.Add(
   ' SELECT                           ' +
   '    pe.cd_pessoa,                 ' +
   '    pe.nm_pessoa,                 ' +
   '    re.nm_pessoa nm_responsavel,  ' +
   '    me.parcela,                   ' +
   '    me.datavencimento,            ' +
   '    tp.ds_tipo_titulo             ' +
   ' FROM                             ' +
   '    mensalidades me               ' +
   '    INNER JOIN pessoas pe ON (me.codigoaluno = pe.cd_pessoa) ' +
   '    LEFT JOIN pessoas re ON (pe.cd_resp_finan = re.cd_pessoa) ' +
   '    INNER JOIN fin_tipos_titulo tp ON (me.cd_tipo_titulo = tp.cd_tipo_titulo) '+
   ' WHERE   ' +
   '    me.cd_mensalidade = :CdMensalidade ' +
   ' LIMIT 1 '
   );

   qyAux2.ParamByName('CdMensalidade').AsInteger := iCodigoMensalidade;

   qyAux2.Open();

   if qyAux2.Eof then begin
      sParametroHistorico := 'MENSALIDADE ' + IntToStr(iCodigoMensalidade);
   end
   else begin
      sDsParcela := qyAux2.FieldByName('ds_tipo_titulo').AsString;

      if sDsParcela = '' then
         sDsParcela := 'MENSALIDADE';

      sParametroHistorico := ReplaceStr(sParametroHistorico, '[cd_pessoa]',      qyAux2.FieldByName('cd_pessoa').AsString);
      sParametroHistorico := ReplaceStr(sParametroHistorico, '[nm_pessoa]',      qyAux2.FieldByName('nm_pessoa').AsString);
      sParametroHistorico := ReplaceStr(sParametroHistorico, '[nm_responsavel]', qyAux2.FieldByName('nm_responsavel').AsString);
      sParametroHistorico := ReplaceStr(sParametroHistorico, '[nr_parcela]',     qyAux2.FieldByName('parcela').AsString);
      sParametroHistorico := ReplaceStr(sParametroHistorico, '[dt_vencimento]',  qyAux2.FieldByName('datavencimento').AsString);
      sParametroHistorico := ReplaceStr(sParametroHistorico, '[ds_parcela]',     sDsParcela);
   end;

   Result := sParametroHistorico;

end;

function TDM.CarregaSituacoes(var slDados: TStringList; iModulo: Integer;
  sitMostra: TStrSituacoes): Boolean;
var
   sMostra: string;
begin
   //inicializa sldados
   if slDados = nil then begin
      slDados := TStringList.Create();
   end;

   //carrega a situacao
   case sitMostra of
      sitDescricao: sMostra := 'ds_valor';
      sitSigla: sMostra := 'ds_sigla';
      sitTexto: sMostra := 'me_descricao';
      sitCodigo: sMostra := 'cd_situacao';
      else sMostra := 'ds_valor';
   end;

   //carrega do sql
   with DM.qyAux1 do begin
      Close();
      SQL.Clear();
      Params.Clear();
      SQL.Add(''+
      '   SELECT                                   '+
      '      cd_situacao, '+sMostra+'              '+
      '   FROM                                     '+
      '      situacoes                             '+
      '   WHERE                                    '+
      '      cd_modulo = '+IntToStr(iModulo)+'     '+
      '');
      Open();

      if not IsEmpty then begin
         slDados.Clear();
         while not Eof do begin
            slDados.Add(FieldByName('cd_situacao').AsString + '='+FieldByName(sMostra).AsString);
            Next();
         end;
         Result := True;
      end
      else begin
         slDados.Clear();
         Result := False;
      end;

   end;
end;

function TDM.ConectaUnimestre: boolean;
const
   S_MSG_SEMCONEXAO = 'Ocorreu um erro na tentativa de efetuar conexão com o banco de dados do UNIMESTRE: %s';
var
   LConnIni: TIniFile;
begin
   LConnIni := TIniFile.Create(ExtractFilePath(ParamStr(0)) + '\unimestre.ini');
   try
      if db.Connected then
         db.Disconnect;
      db.HostName := LConnIni.ReadString('Conexao', 'Servidor', 'localhost');
      db.Database := LConnIni.ReadString('Conexao', 'Banco', 'unimestre');
      db.User := LConnIni.ReadString('Conexao', 'Usuario', 'academico');
      db.Password := UMCrypt(LConnIni.ReadString('Conexao', 'Senha', '0F3BD575F101'), ctDecode);
      db.Port := LConnIni.ReadInteger('Conexao', 'Porta', 3306);
      db.Protocol := LConnIni.ReadString('Conexao', 'Protocolo', 'mysql-5');
      try
         db.Connect;
      except
         on E: Exception do
            Mensagem(Format(S_MSG_SEMCONEXAO, [E.Message]), 'Erro', MB_ICONERROR);
      end;
      Result := db.Connected;
   finally
      FreeAndNil(LConnIni);
   end;
end;

function TDM.ContaBoletoPadrao(iDepto: Integer; sTurma: String; iAnoSemestre: Integer): String;
var
  qyNN : TUMZQuery;
begin

    CriarConsulta(qyNN);
    qyNN.Close();

    // Pesquisar o NN a partir do cd_caixa no cadastro de turmas
    qyNN.SQL.Text :=
      ' SELECT fcc.cd_caixa, fcc.cd_coligada FROM fin_cadastro_contas fcc ' +
      ' INNER JOIN turmas t ON (fcc.cd_caixa = t.cd_caixa AND fcc.cd_coligada = t.cd_coligada) ' +
      ' WHERE t.codigo = "' + sTurma + '" AND t.anosemestre = ' + IntToStr(iAnoSemestre);
    qyNN.Open();

    if not qyNN.Eof then begin
       result := qyNN.FieldByName('cd_caixa').AsString + '=' + qyNN.FieldByName('cd_coligada').AsString;
    end else
    begin  // Pesquisar o NN a partir do cd_bloqueto_padrao nos departamentos
       qyNN.Close();
       qyNN.SQL.Text :=
         ' SELECT fcc.cd_caixa, fcc.cd_coligada FROM fin_cadastro_contas fcc ' +
         ' INNER JOIN departamentos d ON (fcc.cd_caixa = d.cd_boleto_padrao AND fcc.cd_coligada = d.cd_coligada) ' +
         ' WHERE d.codigo = ' + IntToStr(iDepto);
       qyNN.Open();

       if not qyNN.Eof then begin
          result := qyNN.FieldByName('cd_caixa').AsString + '=' + qyNN.FieldByName('cd_coligada').AsString;
       end else begin
          Result := '';
       end

    end;

    FreeAndNil(qyNN);

end;

function TDM.ConverteCambio(iMoedaBase, iMoedaCambio : integer; dCambio : TDateTime; cValor : Currency; ParaMoedaBase : Boolean = false) : Currency;
var
   qyCambio : TUMZQuery;
   Valor : Currency;
begin

   CriarConsulta(qyCambio);

   // Tentar selecionar o cambio mais próximo - menor igual a data indicada

   qyCambio.SQL.Text :=
     ' SELECT * FROM fin_moedas_cotacoes ' +
     ' WHERE cd_moeda_base = ' + IntToStr(iMoedaBase) +
     '   AND cd_moeda_cota = ' + IntToStr(iMoedaCambio) +
     '   AND dt_cotacao <= "' + FormatDateTime('yyyy-mm-dd', dCambio) + '" '+
     ' ORDER BY dt_cotacao DESC ' +
     ' LIMIT 1 ';

   qyCambio.Open();

   if qyCambio.IsEmpty then begin

      Mensagem('Nenhum câmbio cadastrado para esta moeda', 'Anteção', MB_OK + MB_ICONWARNING);

      result := cValor;

      Exit

   end;

   if (qyCambio.FieldByName('dt_cotacao').AsDateTime <> dCambio) then begin

      Mensagem('Não existe câmbio para esta moeda em ' + FormatDateTime('dd/mm/yyyy', dCambio) + '.' +
      ' Será utilizado o cambio de ' + FormatDateTime('dd/mm/yyyy', qyCambio.FieldByName('dt_cotacao').AsDateTime),
      'Atenção', MB_OK + MB_ICONWARNING);

   end;

   if qyCambio.FieldByName('vl_moeda_cota').AsCurrency > 0 then begin

       if not ParaMoedaBase then begin

          Valor := cValor / qyCambio.FieldByName('vl_moeda_cota').AsCurrency;

       end else begin

          Valor := cValor * qyCambio.FieldByName('vl_moeda_cota').AsCurrency;

       end;

   end else begin

      Valor := 0;  

   end;


   result := Valor;


end;

function TDM.ConverterNullEmZero(sFormula: string): String;
var
   sNovaFormula : String;
   i : word;
begin
   // Converter os campos da fórmula em ISNULL

   sNovaFormula := lowercase(sFormula);

   For i := 25 downto 1 do begin
      sNovaFormula := ReplaceStr(sNovaFormula, 'nota' + IntToStr(i), 'IFNULL(!nota!'+IntToStr(i)+',0)');
   end;
   sNovaFormula := ReplaceStr(sNovaFormula, '!nota!', 'nota');
   sNovaFormula := ReplaceStr(sNovaFormula, 'ajuste','IFNULL(ajuste,0)');

   result := sNovaFormula

end;

function TDM.NomeDoBoleto(iDepto: Integer; sTurma: String;
  iAnoSemestre: Integer; Caixa : String = ''): String;
Var
  strAux : String;
  qyNN : TUMZQuery;
begin

    CriarConsulta(qyNN);
    qyNN.Close();

    if Caixa <> '' then begin

       qyNN.SQL.Text :=
         ' SELECT fcc.nm_arquivo_bloqueto FROM fin_cadastro_contas fcc ' +
         ' WHERE fcc.cd_caixa = ' + Copy(Caixa, 1, Pos('=',Caixa)-1) +
         '   AND fcc.cd_coligada = ' + Copy(Caixa, Pos('=',Caixa)+1, length(Caixa));
       qyNN.Open();

       strAux := qyNN.FieldByName('nm_arquivo_bloqueto').AsString;

       strAux := strAux + '.rpt';

       Result := strAux;

       Exit; 

    end;

    // Pesquisar o NN a partir do cd_caixa no cadastro de turmas
    qyNN.SQL.Text :=
      ' SELECT fcc.nm_arquivo_bloqueto FROM fin_cadastro_contas fcc ' +
      ' INNER JOIN turmas t ON (fcc.cd_caixa = t.cd_caixa AND fcc.cd_coligada = t.cd_coligada) ' +
      ' WHERE t.codigo = "' + sTurma + '" AND t.anosemestre = ' + IntToStr(iAnoSemestre);
    qyNN.Open();

    if not qyNN.Eof then begin
       strAux := qyNN.FieldByName('nm_arquivo_bloqueto').AsString;
    end else
    begin
       qyNN.Close();
       qyNN.SQL.Text :=
         ' SELECT fcc.nm_arquivo_bloqueto FROM fin_cadastro_contas fcc ' +
         ' INNER JOIN departamentos d ON (fcc.cd_caixa = d.cd_boleto_padrao AND fcc.cd_coligada = d.cd_coligada) ' +
         ' WHERE d.codigo = ' + IntToStr(iDepto);
       qyNN.Open();

       if not qyNN.Eof then begin
          strAux := qyNN.FieldByName('nm_arquivo_bloqueto').AsString;
       end else begin
          strAux := 'repBloquetos';
       end

    end;


    strAux := strAux + '.rpt';

    Result := strAux;

end;

function TDM.getEtapaAtual(iPadrao: Integer = 1): Integer;
var
   iValor: Integer;
begin
   iValor := iPadrao;
   with Self.qyAux1 do begin
      try
         Close();
         SQL.Clear();
         Params.Clear();
         SQL.Text := 'SELECT nr_etapa as etapa FROM diario_prazos WHERE dt_envio_inicio < NOW() AND dt_envio_fim > NOW() AND cd_curso =  "" AND cd_turma = "" ORDER BY nr_anosemestre DESC';
         Open();

         if not IsEmpty then begin
            iValor := FieldByName('etapa').AsInteger;
         end;
         Close();

      except
         iValor := iPadrao;
         Close();
      end;
   end;
   Result := iValor;
end;

procedure TDM.montarPlanilha(Grade : TDBGrid; dsChave: String);
const
   SQL_SEL_PLANILHA = 'SELECT DS_COLUNA, NR_TAMANHO FROM NU_PLANILHAS WHERE CD_PESSOA = ? AND DS_CHAVE = ? ORDER BY NR_ORDEM ASC';
var
   Stmt: IZPreparedStatement;
   ResultSet: IZResultSet;
   Fields: TStrings;
   I: Integer;
begin
   try
      Stmt := db.DbcConnection.PrepareStatement(SQL_SEL_PLANILHA);
      try
         Stmt.SetInt(1, GetUsuarioLogado.Pessoa.Codigo);
         Stmt.SetString(2, dsChave);

         try
            ResultSet := Stmt.ExecuteQueryPrepared;
            try

               if not ResultSet.Next then
               begin

                  Fields := TStringList.Create;
                  try
                     Fields.Delimiter := ';';
                     Fields.StrictDelimiter := True;
                     Fields.DelimitedText := variavel_parametro(dsChave);

                     if Fields.Count > 0 then
                     begin
                        Grade.Columns.Clear;

                        for I := 0 to Fields.Count - 1 do
                        begin
                           Grade.Columns.Add.FieldName := Fields[I];
                        end;
                        
                     end;
                     
                  finally
                     FreeAndNil(Fields);
                  end;               
               end
               else
               begin

                  Grade.Columns.Clear;

                  repeat
                     with Grade.Columns.Add do
                     begin
                        FieldName := ResultSet.GetString(1);
                        Width := ResultSet.GetInt(2);
                     end;
                  until (not ResultSet.Next);
               end;
               
            finally
               ResultSet.Close;
            end;
         except on E: Exception do
            //
         end;

      finally
         Stmt.Close;
      end;

   except on E: Exception do
      //
   end;
end;

procedure TDM.setLog(cd_modulo: integer; operacao: string; chave : string = ''; coligada : integer = 0;ds_observacoes: string = '');
var
   ALogBDE: TLogBDE;
begin
   ALogBDE := TLogBDE.getLogger(DB);
   ALogBDE.setLog(tblUsuariosNome.FieldByName('codigo').AsInteger, cd_modulo, operacao, chave, coligada, ds_observacoes);
end;


{ esta funcao consegue executar uma procedure de banco }
function TDM.callProcedure(
   const SQL: String;
   const sn_exibi_erro: Boolean
): Boolean;
var
   qyStoredProc: TUMZQuery;
begin
   Result := False;

   try
      CriarConsulta(qyStoredProc);
      qyStoredProc.close;
      qyStoredProc.SQL.Text := PAnsiChar(SQL);
      qyStoredProc.ExecSQL;
      qyStoredProc.Close;
      Result := True;
   except on E:Exception do
      begin
         Result := False;

         if sn_exibi_erro then
         begin
            raise E;
         end;
      end;
   end;
end;


end.
