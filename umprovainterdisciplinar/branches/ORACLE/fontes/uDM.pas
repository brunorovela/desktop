unit uDM;

interface

uses
  Forms, Db, ZConnection, Classes, Sysutils, Controls, General, IniFiles,
  ZAbstractRODataset, ZAbstractDataset, ZDataset, UZDataset, Menus, DBCtrls,
  StdCtrls, DateUtils, Mask, DBGrids, uMLogZeos, UMQuery, DBTables, ZAbstractTable,
  UZStartConnection, ZSqlMonitor, uIUMDataModule;

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
    procedure tblMensalidadesPostError(DataSet: TDataSet;
      E: EDatabaseError; var Action: TDataAction);
    procedure tblFichaIndividualFalta1GetText(Sender: TField;
      var Text: String; DisplayText: Boolean);
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
      Function BuscaDisciplinasSemPI(CodigoAluno : Integer; TurmaMatricula : String; AnoSemestre :Integer) : string;
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

    lst_situacao_fin_desc : array of String[20];
    lst_situacao_fin_sigla : array of String[20];

    flg : Boolean;
    indIndice : Array[0..255] of Single;

    // Função para descobrir o valor do parâmetro tabelado

    Function NomeDoBoleto( iDepto : Integer; sTurma : String; iAnoSemestre : Integer; Caixa : String = '') : String;

    function variavel_parametro(variavel : string) : string;
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
    function FindDate(dat:TDateTime):Boolean;
    function NovoNumero(iDepto:Integer; sTurma:String; iAnoSemestre : Integer; Tentativas : integer = 0; iConta : Integer = 0; iColigada : Integer = 0; CodigoAluno : Integer = 0) : String;
    function GetContaBoleto(iDepto:Integer; sTurma:String; iAnoSemestre : Integer) : Integer;
    function ContaBoletoPadrao(iDepto:Integer; sTurma:String; iAnoSemestre : Integer) : String;
    function NovoCodMatricula(CodigoAluno : Integer; Curso : String; AnoSem : Integer; AnoSemAtual : Integer) : String;
    function NovoAluno : Longint;
    function Converter_para_ponto(Valor : Double) : String;
    function condicao_com_arredondamento(calculo_notas,  formula, arredonda : string) : string;
    function getSituacao(situacao, modulo: integer): String;

    procedure salvaHistoricoCheques(iCodCheque: Integer; iCodCaixa: Integer; iCodCaixaAntigo: Integer; iCodSituacao: Integer; iCodSituacaoAntigo: Integer );



    function ProfessoresTurma( intAnoSemestre : Integer;
      strTurma : String; iDisciplina : Integer ) : String;


    function FindDepto(xTurma:String; xAnoSemestre: Integer):Integer;

    function  FindDisciplina(aTurma, aSigla:String; aAnoSemestre:Integer):String;

    function disciplinaAlocada(iCodigo: Integer; sCurso: String): boolean;

    { Public declarations }

    Function incrementar_ano_semestre( valor : String ) : String;

    Function decrementar_ano_semestre( valor : String ) : String;

    Procedure recalcular_creditos_financeiros( intCodigoAluno : Integer; strTurmaMatricula : String; intAnoSemestre : Integer; intCreditos : Currency; avisar : boolean = true );

    procedure Gerar_Series_Conclusao(intCodigoAluno : integer; strCurso : String; intAnosemestre : integer);

    procedure gerar_log( tipo : integer; msg : string; usuario: integer; chaves : string );

    // Procedure para gravar LOGS de acessos
    procedure CriarConsulta( var DataSet : TUMZQuery ); overload;
    procedure CriarConsulta( var DataSet : TUMZReadOnlyQuery ); overload;

    // Procedure que verifica o parâmetro sn_todas_maiusculas
    procedure TodasMaiusculas(Formulario: TForm);

    // Procedure que verifica o parâmetro sn_todas_maiusculas
    procedure TodasMaiusculasFrame(Frame: TFrame);

    //seta uma preferencia do usuário
    procedure Set_Parametro_usuario(componente: TComponent;nomeFormulario:string);

    procedure Set_Parametro_usuario_valor(nomeParametro: String; valorParametro : String ;nomeFormulario:string);

    // Procedure para setar os parâmetros do usuário
    procedure Set_Parametros_usuario(Formulario: TForm);

    // Procedure para ler os parâmetros do usuário
    procedure Parametros_usuario(Formulario: TForm);

    // Procedure para remover um parametro do usuario
    procedure Delete_Parametro_Usuario(componente : TComponent;nomeFormulario:string);

    //Pega uma preferencia do usuário em relação a um campo
    function Get_Parametro_usuario(componente: TComponent;nomeFormulario:string):Boolean;

    function Get_Parametro_usuario_valor(nomeParametro: String; nomeFormulario:string):String;

    // Função para verificar se o indivíduo tem livros em atraso na biblioteca
    Function TemLivrosAtrasados( cd_pessoa: integer ): boolean;

    Function DataAtual(): TDateTime;

    // Função que retorna a quantidade de dias úteis num intervalo de datas para um setor informado
    // Setores possíveis: biblioteca, financeiro, secretaria
    Function DiasUteis(setor: string; dt_inicial,dt_final: TDateTime): integer;

    Function ProximoId(campo, tabela: string): integer;

    function ExisteRegistro(tabela: string; campo: ARRAY of string; valor: ARRAY of string):Boolean;

    function BuscarCodigoAcaoPadrao(CodPadrao: Integer): Integer;

    function CabecalhoCampos(iCodCabecalho: LongInt): string;

    function CabecalhoParamFixos(): TStringList;

    // Procedure que registra observações no campo informado
    Procedure RegistraObservacoes(campo: TField; Observacao: String);

    // Procedure para mostrar o Log num Popup
    procedure MostraLog(cd_modulo,cd_titulo,cd_caixa,nr_sequencia: integer; dt_movimento: TDateTime; Popup: TPopupMenu);

    // Função para retornar o próximo ID a ser utilizado (considerando relacionamento entre tabelas)
    Function ProximoId2(campo1, campo2, tabela: string; filtro: integer): integer;

    //remessa
    function FazAcaoRemessa(Acao: TAcaoRemessa; iCodMensalidade: LongInt): Boolean;

    function DefineNumeroMatricula(sTurma: string; iAnoSem: Integer): LongInt;

    Function DefinirHistoricoCaixa(iCodigoMensalidade : Integer; sParametroHistorico : String) : string;

    //Faz todo o Recalculo de faltas dos registros em diario_lista_presenca que estao marcados como N em sn_imp_diario

    function CarregaSituacoes(var slDados: TStringList; iModulo: Integer; sitMostra: TStrSituacoes): Boolean;

    Function ConverterNullEmZero( sFormula : string ) : String;

    function getEtapaAtual(iPadrao: Integer = 1): Integer;

    Procedure MontarPlanilha(Grade : TDBGrid; Campos : String);

//    procedure setLog(cd_modulo: integer; operacao: TTipoOperacao; ds_observacoes: string = ''); overload;
    procedure setLog(cd_modulo: integer; operacao: string; chave : string = ''; coligada : integer = 0; ds_observacoes: string = ''); overload;

    function ConverteCambio(iMoedaBase, iMoedaCambio : integer; dCambio : TDateTime; cValor : Currency; ParaMoedaBase : Boolean = false) : Currency;

    procedure atualizaResponsavelFinanc(iCodAluno: Integer; iCodResponsavel: Integer; iCodResponsavelOld: Integer = -1);

    Function DataBloqueioFinanceiro() : TDateTime;

    Function EstaBloqueado(DataTitulo : TDateTime; EmitirAviso : Boolean = false) : boolean;

    Function EhFeriado(Data : TDateTime; Modulo : byte) : Boolean;

    function GetAnoSemestreAtual: integer;
    procedure DefineRateioApropriacaoPorMatriculas(const AICodApropriacao, AIAnoSemestre: integer);
  end;

var
  DM: TDM;
  slPFixos: TStringList;

implementation

uses
   Main, Math, uSplash, Windows, Dialogs, uRegExpr, Spin, ExtCtrls;

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

  { Armazenar as Situações Financeiras no Vetor }

  try
     DM.qAux1.Close;
     DM.qAux1.SQL.Text := 'SELECT * FROM SITUACOES_FINANCEIRAS ORDER BY CD_SITUACAO';
     DM.qAux1.Open;

     SetLength( lst_situacao_fin_desc, DM.qAux1.RecordCount );
     SetLength( lst_situacao_fin_sigla, DM.qAux1.RecordCount );

     While not DM.qAux1.Eof do
     Begin
     	 lst_situacao_fin_desc[DM.qAux1.FieldByName('CD_SITUACAO').AsInteger] := DM.qAux1.FieldByName('ds_situacao').AsString;
     	 lst_situacao_fin_sigla[DM.qAux1.FieldByName('CD_SITUACAO').AsInteger] := DM.qAux1.FieldByName('ds_sigla_situacao').AsString;
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

procedure TDM.salvaHistoricoCheques(iCodCheque: Integer; iCodCaixa: Integer; iCodCaixaAntigo: Integer; iCodSituacao: Integer; iCodSituacaoAntigo: Integer);
var
   qyHistorico : TUMZQuery;
begin
   CriarConsulta(qyHistorico);
   qyHistorico.close();
   qyHistorico.SQL.Clear();

   qyHistorico.SQL.Text:=
                        'INSERT INTO                                                             '+
                           'fin_cheques_historicos                                               '+
                           '  (cd_caixa, cd_cheque,                                              '+
                           '  cd_situacao, dt_movimentacao, cd_caixa_antigo, cd_situacao_antigo) '+
                        'VALUES                                                                  '+
                           '  ('+IntToStr(iCodCaixa)+', '+IntToStr(iCodCheque)+',                '+
                           '   '+IntToStr(iCodSituacao)+', NOW(),'+IntToStr(iCodCaixaAntigo)+',  '+
                           '   '+IntToStr(iCodSituacaoAntigo)+')                                           ';
   qyHistorico.ExecSQL();
end;

procedure TDM.tblMensalidadesPostError(DataSet: TDataSet;
  E: EDatabaseError; var Action: TDataAction);
begin
  TrataErroBanco( DataSet, E );
end;

function TDM.NovoAluno : Longint;
var
  strAux : String;
  lngAux, lngCodigo : Longint;
begin
  lngCodigo := StrToInt(DM.variavel_parametro('pessoa_ultimo_codigo'));
  DM.set_variavel_parametro('pessoa_ultimo_codigo', IntToStr( lngCodigo + 1 ));

  strAux := IntToStr( lngCodigo );
  lngAux := StrToInt( strAux + DV440( strAux ) );
  Result := lngAux;
end;

function TDM.NovoCodMatricula(CodigoAluno: Integer; Curso: String; AnoSem : Integer; AnoSemAtual : Integer): String;
Var
   NovoCod : String;
   Cod : Integer;
   qyCod : TUMZQuery;
   mascara : String;
begin
   {
   parametro = ds_mascara_matricula - tabela de departamentos
   [AS] Ano/Semestre inicial de ingresso na Instituição
   [as] Ano/Semestre inicial de ingresso no Curso
   [curso]  = Código do Curso
   [turma] = Código da Turma
   [qqq] = Sequencial. Quantidade de Alunos + 1
   [cd_pessoa] = Código Pessoal de Aluno

   Exemplo: [AS][curso][qqq]
   }
   if AnoSemAtual = 0 then AnoSemAtual := AnoSem;

   // Selecionar a Máscara para o código do aluno

   CriarConsulta(qyCod);

   qyCod.Close();
   qyCod.SQL.Text :=
      ' SELECT d.ds_mascara_matricula FROM cursos c ' +
      ' INNER JOIN departamentos d ON (c.depto = d.codigo) ' +
      ' WHERE c.codigo = "' + Curso + '" AND c.anosemestre = ' + IntToStr(AnoSem);

   try
      qyCod.Open();
      mascara := qyCod.FieldByName('ds_mascara_matricula').AsString;
   except
      mascara := '[cd_pessoa]';
   end;

   if mascara = '' then mascara := '[cd_pessoa]';

   NovoCod := mascara;

   NovoCod := ReplaceStr(NovoCod, '[as]', Copy(IntToStr(AnoSem), 4, 2));
   NovoCod := ReplaceStr(NovoCod, '[AS]', Copy(IntToStr(AnoSemAtual), 4, 2));
   NovoCod := ReplaceSTR(NovoCod, '[curso]', FillString(Curso, alRight, '0', 2, true));

   NovoCod := ReplaceStr(NovoCod, '[cd_pessoa]', IntToStr(CodigoAluno));

   NovoCod := ReplaceSTR(NovoCod, '[qqq]', '%');


   qyCod.Close();
   qyCod.SQL.Text :=
       ' Select nr_matricula from matriculas_curso ' +
       ' WHERE nr_matricula like "' + NovoCod + '" ' +
       ' ORDER BY nr_matricula DESC LIMIT 1';
   qyCod.Open();

   if qyCod.Eof then begin
      NovoCod := ReplaceStr(NovoCod, '%', FillString('1', alRight, '0', 3, false));
   end
   else begin
      Cod := StrToInt( Copy(qyCod.FieldByName('nr_matricula').AsString, Length(qyCod.FieldByName('nr_matricula').AsString)-2,3 ) );
      Inc(Cod);
      NovoCod := ReplaceStr(NovoCod, '%', FillString( IntToStr(Cod), alRight, '0', 3, false ));
   end;

   if mascara <> '[cd_pessoa]' then begin
   
      with qyCod do begin
        Close();
        SQL.Text := 'UPDATE pessoas SET ds_login = "' + NovoCod + '" WHERE cd_pessoa = ' + IntToStr(CodigoAluno) + ' AND ds_login is NULL ';
        ExecSQL();
      end;

   end;   

   FreeAndNil(qyCod);
   Result := novoCod;

end;

function TDM.ProfessoresTurma( intAnoSemestre : Integer;
  strTurma : String; iDisciplina : Integer ) : String;
var
  strAux : String;
  tblProfessoresTurma : TUMZQuery;
begin
  CriarConsulta(tblProfessoresTurma);

  tblProfessoresTurma.Close;
  tblProfessoresTurma.SQL.Text :=
    ' SELECT DISTINCTROW Professores.nm_apelido as Apelido          ' +
    ' FROM (TurmasProfessores INNER JOIN Disciplinas ON             ' +
    '  (TurmasProfessores.Disciplina = Disciplinas.Codigo) AND       ' +
    '  (TurmasProfessores.Curso = Disciplinas.Curso)) INNER JOIN     ' +
    '   Professores ON TurmasProfessores.Professor = Professores.cd_pessoa  ' +
    ' WHERE TurmasProfessores.AnoSemestre = :AnoSemestre and        ' +
    '   TurmasProfessores.Turma = :Turma and                        ' +
    '   Disciplinas.Codigo = :Disciplina                            ';

  tblProfessoresTurma.ParamByName('AnoSemestre').AsInteger := intAnoSemestre;
  tblProfessoresTurma.ParamByName('Turma').AsString := strTurma;
  tblProfessoresTurma.ParamByName('Disciplina').AsInteger := iDisciplina;
  tblProfessoresTurma.Open;

  strAux := '';

  while not tblProfessoresTurma.Eof do
  begin
    if strAux <> '' then
      strAux := strAux + ' / ';

    strAux := strAux + tblProfessoresTurma.FieldByName('Apelido').AsString;
    tblProfessoresTurma.Next;
  end;

  FreeAndNil(tblProfessoresTurma);

  Result := strAux;

end;

function TDM.FindUser(strUsu:String):Boolean;
begin
  DM.tblUsuariosNome.Close;
  DM.tblUsuariosNome.ParamByName('NOME').AsString := strUsu;
  DM.tblUsuariosNome.Open;

  Result := (DM.tblUsuariosNomeNome.AsString <> '');
end;

function TDM.FindDate(dat:TDateTime):Boolean;
Var
  dia, mes, ano :Word;
begin

  DecodeDate(dat, ano, mes, dia);

  DM.tblFeriados.Close;
  DM.tblFeriados.ParamByName('dia').AsInteger := dia;
  DM.tblFeriados.ParamByName('mes').AsInteger := mes;
  DM.tblFeriados.ParamByName('ano').AsInteger := ano;
  DM.tblFeriados.Open;

  Result := (NOT DM.tblFeriados.EOF);
end;

function TDM.FindDisciplina(aTurma, aSigla:String; aAnoSemestre:Integer):String;
var
  xCodigo: String;
begin
  xCodigo := '';

    DM.qAux1.Close;
    DM.qAux1.SQL.Clear;
    DM.qAux1.SQL.Add('select Disciplinas.Codigo from Disciplinas INNER JOIN Turmas ON' +
                   '(Turmas.Curso = Disciplinas.Curso)' +
                   'where Turmas.Codigo = :Turma and AnoSemestre = :AnoSemestre and ' +
                   'Disciplinas.Sigla = :Sigla');

    DM.qAux1.ParamByName('Turma').AsString := aTurma;
    DM.qAux1.ParamByName('AnoSemestre').AsInteger := aAnoSemestre;
    DM.qAux1.ParamByName('Sigla').AsString := aSigla;
    DM.qAux1.Open;

    xCodigo := DM.qAux1.FieldByName('Codigo').AsString;

  Result := xCodigo;

end;


function TDM.FindDepto(xTurma:String; xAnoSemestre: Integer):Integer;
begin
    DM.qAux1.Close;
    DM.qAux1.SQL.Clear;
    DM.qAux1.SQL.Add('SELECT DISTINCTROW Cursos.Depto' );
    DM.qAux1.SQL.Add('FROM Turmas INNER JOIN Cursos ON (Turmas.Curso = Cursos.Codigo)' );
    DM.qAux1.SQL.Add(' AND (Turmas.AnoSemestre = Cursos.AnoSemestre) where Turmas.Codigo = :Turma and' );
    DM.qAux1.SQL.Add('Turmas.AnoSemestre = :AnoSemestre' );
    DM.qAux1.ParamByName('Turma').AsString := xTurma;
    DM.qAux1.ParamByName('AnoSemestre').AsInteger := xAnoSemestre;
    DM.qAux1.Open;
    Result := DM.qAux1.Fields[0].AsInteger;
end;

function TDM.isTrue(valor: String): Boolean;
begin
  if valor = 'S' Then result := True
  else result := False;
end;

function TDM.variavel_parametro(variavel: string): string;
begin
    RS_VAR.close;
    RS_VAR.ParambyName('variavel').AsString:= variavel;
    RS_VAR.Open;

    if not RS_VAR.Eof Then
       result := RS_VAR.FieldByName('ds_valor').AsString
    else
       result := '';
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

procedure TDM.atualizaResponsavelFinanc(iCodAluno, iCodResponsavel,
  iCodResponsavelOld: Integer);
var
   qyAuxAtu: TUMZQuery;
begin
   if (iCodResponsavel <= 0) then begin
      Exit;
   end;
   if not (qyAux.Active) then begin
      qyAuxAtu := qyAux;
   end
   else if not (qyAux1.Active) then begin
      qyAuxAtu := qyAux1;
   end
   else if not (qyAux2.Active) then begin
      qyAuxAtu := qyAux2;
   end;
   if (iCodResponsavelOld <= 0) then begin
      qyAuxAtu.Close();
      qyAuxAtu.Params.Clear();
      qyAuxAtu.SQL.Text := 'SELECT cd_resp_finan FROM pessoas WHERE cd_pessoa = :codaluno';
      qyAuxAtu.ParamByName('codaluno').AsInteger := iCodAluno;
      qyAuxAtu.Open();
      if not (qyAux.IsEmpty()) then begin
         iCodResponsavelOld := qyAuxAtu.FieldByName('cd_resp_finan').AsInteger;
      end;
      qyAuxAtu.Close();
   end;

   if (iCodResponsavelOld <> iCodResponsavel) then begin
      qyAuxAtu.Close();
      qyAuxAtu.Params.Clear();
      qyAuxAtu.SQL.Text := '' +
      ' UPDATE mensalidades SET cd_resp = :newresp '+
      ' WHERE cd_resp = :oldresp AND codigoaluno = :codaluno '+
      ' AND situacao IN (2,10)  ';
      qyAuxAtu.ParamByName('newresp').AsInteger := iCodResponsavel;
      qyAuxAtu.ParamByName('oldresp').AsInteger := iCodResponsavelOld;
      qyAuxAtu.ParamByName('codaluno').AsInteger := iCodAluno;
      qyAuxAtu.ExecSQL();
      qyAuxAtu.Close();
      qyAuxAtu.Params.Clear();
   end;
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

procedure TDM.tblFichaIndividualFalta1GetText(Sender: TField;
  var Text: String; DisplayText: Boolean);
begin
   DisplayText := True;
   if Sender.AsInteger = 0 then
      Text := ''
   else
      Text := IntToStr(Sender.AsInteger);
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

procedure TDM.recalcular_creditos_financeiros( intCodigoAluno : Integer; strTurmaMatricula : String; intAnoSemestre : Integer; intCreditos : Currency; avisar : boolean = true );
Var
  VlAbatido,
  VlCompleto,
  QtdCreditos,
  VlFaltaPagar,
  VlPendente : Currency;

  NovoValor,
  NovoDesconto,
  NovoDescExtra,
  NovoCredito :  Currency;

  qSel, qAtualiza : TUMZQuery;

  bAjustou : Boolean;
  sFiltro1, sFiltro2,
  sLog : String;
  dtBloqueio : TDateTime;
begin
 // Essa função é disparada sempre que houve mudança na grade curricular do aluno - matríuclas em disciplinas

  bAjustou := false;

  CriarConsulta(qSel);

  sFiltro1 := ''; 

// Pegar o Valor que não deverá mais ser alterado pois a mensalidade foi
// PAGA ou já passou do vencimento
   
  with qSel do begin

    if DM.variavel_parametro('credito_calculo_semvencida') = 'S' then begin

      sFiltro1 := sFiltro1 + ' OR ( situacao in (2,10) AND datavencimento < CURDATE() ) ';

    end else begin

      sFiltro1 := '';
    end;

    // Incluir data de Bloqueio

    dtBloqueio := DM.DataBloqueioFinanceiro();

    if dtBloqueio <> 0 then begin

       sFiltro1 := sFiltro1 + ' OR ( situacao in (2,10) AND (datavencimento < "' + FormatDateTime('yyyy-mm-dd', dtBloqueio) + '" OR dt_competencia < "' + FormatDateTime('yyyy-mm-dd', dtBloqueio) + '" )) ';

    end;

    Close();
    SQL.Text := '' +
     ' SELECT SUM(valorbruto) VlAbatido FROM mensalidades ' +
     ' WHERE codigoaluno = ' + IntToStr(intCodigoAluno) +
     '   AND turma = "' + strTurmaMatricula + '" ' +
     '   AND anosemestre = ' + IntToStr(intAnoSemestre)  +
     '   AND sn_credito_parcela in ("S","F") '  +
     '   AND ( situacao not in (2,10) '  +
     sFiltro1 +
     '         OR ( sn_credito_parcela = "F" ) ' + 
     '       ) ';
    Open();

    VlAbatido := FieldByName('VlAbatido').AsCurrency;

  end;

// Pegar a Quantidade de Créditos que o aluno tem matriculado

  with qSel do begin

    Close();
    SQL.Text := '' +
     ' SELECT SUM(g.numeroaulas) QtdCreditos  ' +
     ' FROM  fichaindividual f                ' +
     ' INNER JOIN gradecurricular g ON (f.anosemestre = g.anosemestre) ' +
     '        AND (f.disciplina = g.disciplina) AND (f.curso = g.curso) ' +
     '        AND (f.codigograde = g.codigo) ' +
     ' WHERE                                 ' +
     '    f.codigoaluno = ' + IntToStr(intCodigoAluno) +
     '    AND f.turmamatricula = "' + strTurmaMatricula + '" ' +
     '    AND f.anosemestre = ' + IntToStr(intAnoSemestre)  +
     '    AND f.situacao not in (3,4,5,6,7,8) ' +
     '    AND f.turma <> "HISTORICO" ' +
     ' GROUP BY f.codigoaluno  ' ;
    Open();

    QtdCreditos := FieldByName('QtdCreditos').AsCurrency;
  end;

  // Pegar o valor Total que o aluno deveria pagar pelo créditos contratados

  with qSel do begin

    Close();
    SQL.Text := '' +
      ' SELECT SUM(vl_credito * :Creditos ) VlCompleto ' +
      ' FROM mensalidades ' +
      ' WHERE codigoaluno = ' + IntToStr(intCodigoAluno) +
      '   AND turma = "' + strTurmaMatricula + '" ' +
      '   AND anosemestre = ' + IntToStr(intAnoSemestre)  +
      '   AND sn_credito_parcela in ("S","F")' ;
    ParamByName('Creditos').AsCurrency := QtdCreditos;
    Open();

    VlCompleto := FieldByName('VlCompleto').AsCurrency;
  end;

  // Calcular o valor que o aluno ainda tem que pagar

  VlFaltaPagar := vlCompleto - VlAbatido;

  // Valor das parcelas pendentes referente ao Total que
  // o aluno deveria pagar pelo créditos contratados

  with qSel do begin

    Close();
    SQL.Text := '' +
      ' SELECT SUM(vl_credito * :Creditos ) VlPendente ' +
      ' FROM mensalidades ' +
      ' WHERE codigoaluno = ' + IntToStr(intCodigoAluno) +
      '   AND turma = "' + strTurmaMatricula + '" ' +
      '   AND anosemestre = ' + IntToStr(intAnoSemestre)  +
      '   AND sn_credito_parcela in ("S","F") ' +
      '   AND NOT ( situacao not in (2,10) '  +
     sFiltro1 + 
     '         OR ( sn_credito_parcela = "F" ) ' + 
     '       ) ';
    ParamByName('Creditos').AsFloat := QtdCreditos;
    Open();

    VlPendente := FieldByName('VlPendente').AsCurrency;

  end;

  // Selecior todas as parcelas do aluno

  with qSel do begin

    if (DM.variavel_parametro('credito_calculo_devolucao')='S') then begin

       sFiltro2 := '1 = 1';

    end else begin

       sFiltro2 := '1 <> 1';

    end;
    
    Close();
    SQL.Text := '' +
     ' SELECT me.sn_credito_parcela, me.cd_mensalidade, me.Vl_Credito, me.valorbruto, me.valorextra, me.descontoextra, ' +
     ' (IF(IFNULL(ip.valorbruto,0) = 0, 0, (ip.valordesconto / ip.valorbruto))) as ind_desconto,  ' +  
     ' me.valordesconto, me.nr_creditos, (IFNULL(ip.nr_creditos_minimos,0) * me.vl_credito) ValorMinimo, ip.nr_creditos_minimos, ' +
     '   IF( (me.situacao not in (2,10) ' + sFiltro1 + '  OR ( me.sn_credito_parcela = "F" )), ' +
     '        me.valorbruto, ' +
	  '        IF(  ' + sFiltro2 + ', ' +
     '      	    ( :VlFaltaPagar1 * (me.Vl_Credito * :QtdCreditos1 )) / :VlPendente1, ' +
     ' 				 IF( ( :VlFaltaPagar2 * (me.Vl_Credito * :QtdCreditos2 )) / :VlPendente2 > (me.Vl_Credito * :QtdCreditos3 ), ' +
     '				     ( :VlFaltaPagar3 * (me.Vl_Credito * :QtdCreditos4 )) / :VlPendente3 , ' +
     '					  (me.Vl_Credito * :QtdCreditos5 ) ' +
	  '			    )      ' +
     '		  )           ' +
     '  ) NovoValor       ' +
     ' FROM mensalidades me ' +
     ' LEFT JOIN itensplanospagamento ip ON (me.cd_item_plano = ip.cd_item_plano) ' +
     ' WHERE me.codigoaluno = ' + IntToStr(intCodigoAluno) +
     '   AND me.turma = "' + strTurmaMatricula + '" ' +
     '   AND me.anosemestre = ' + IntToStr(intAnoSemestre)  +
     '   AND me.sn_credito_parcela in ("S","F")';

    ParamByName('VlFaltaPagar1').AsCurrency := VlFaltaPagar;
    ParamByName('VlFaltaPagar2').AsCurrency := VlFaltaPagar;
    ParamByName('VlFaltaPagar3').AsCurrency := VlFaltaPagar;
    ParamByName('QtdCreditos1').AsCurrency := QtdCreditos;
    ParamByName('QtdCreditos2').AsCurrency := QtdCreditos;
    ParamByName('QtdCreditos3').AsCurrency := QtdCreditos;
    ParamByName('QtdCreditos4').AsCurrency := QtdCreditos;
    ParamByName('QtdCreditos5').AsCurrency := QtdCreditos;
    ParamByName('VlPendente1').AsCurrency := VlPendente;
    ParamByName('VlPendente2').AsCurrency := VlPendente;
    ParamByName('VlPendente3').AsCurrency := VlPendente;

    Open();

    CriarConsulta(qAtualiza);

    while not EOF do begin

        if FieldByName('valorbruto').AsCurrency <> FieldByName('NovoValor').AsCurrency then begin

           qAtualiza.SQL.Text := '' +
            ' UPDATE mensalidades ' +
            '    SET valorbruto = :NovoValor, nr_creditos = :NovoCreditos, ' +
            '        valordesconto = :NovoDesconto, descontoextra = :NovoDescExtra ' +
            ' WHERE cd_mensalidade = ' + FieldByName('cd_mensalidade').AsString;

           if FieldByName('NovoValor').AsCurrency < FieldByName('ValorMinimo').AsCurrency then begin

              NovoValor := FieldByName('ValorMinimo').AsCurrency;
              NovoCredito := FieldByName('nr_creditos_minimos').AsCurrency;

           end else begin

              NovoValor := FieldByName('NovoValor').AsCurrency;
              NovoCredito := FieldByName('NovoValor').AsCurrency / FieldByName('Vl_Credito').AsCurrency;

           end;

           qAtualiza.ParamByName('NovoValor').AsCurrency := NovoValor;
           qAtualiza.ParamByName('NovoCreditos').AsCurrency := NovoCredito;

           // Tratar divisão por ZERO
           if FieldByName('valorbruto').AsCurrency > 0 then  begin

              NovoDesconto := RoundFloat((FieldByName('valordesconto').AsCurrency / FieldByName('valorbruto').AsCurrency)
                                                            * qAtualiza.ParamByName('NovoValor').AsCurrency, 2);

              NovoDescExtra := (FieldByName('descontoextra').AsCurrency / FieldByName('valorbruto').AsCurrency)
                                                            * qAtualiza.ParamByName('NovoValor').AsCurrency;
           end else begin

              if FieldByName('ind_desconto').AsCurrency > 0 then begin

                  NovoDesconto := RoundFloat( NovoValor * FieldByName('ind_desconto').AsFloat , 2);                 

              end else begin

                  NovoDesconto := 0;

              end;
              NovoDescExtra := 0;

           end;

           qAtualiza.ParamByName('NovoDesconto').AsCurrency := RoundFloat(NovoDesconto, 2);
           qAtualiza.ParamByName('NovoDescExtra').AsCurrency := NovoDescExtra;


           qAtualiza.ExecSQL();

           bAjustou := true;

           // Log de Alteração da Mensalidade;

           sLog := 'Alteração Créditos: [' + FloatToStr(FieldByName('nr_creditos').AsFloat) + '] ';
           sLog := sLog + '=> [' + FloatToStr(NovoCredito) + ']';

           sLog := sLog + ' Valor Bruto: ['+FloatToStr(FieldByName('valorbruto').AsCurrency)+'] => ['+FloatToStr(NovoValor)+']';

           if FieldByName('valordesconto').AsFloat > 0 then begin

              sLog := sLog + ' Desc. Cond.: ['+FloatToStr(FieldByName('valordesconto').AsCurrency)+'] => ['+FloatToStr(NovoDesconto)+']';

           end;

           if FieldByName('descontoextra').AsFloat > 0 then begin

              sLog := sLog + ' Desc. Fixo.: ['+FloatToStr(FieldByName('descontoextra').AsCurrency)+'] => ['+FloatToStr(NovoDescExtra)+']';

           end;            

           DM.gerar_log( 10, slog, DM.tblUsuariosNome.FieldByName('codigo').AsInteger, FieldByName('cd_mensalidade').AsString );

           // Atualizar o movimento de Entrada do título

           qAtualiza.Close();
           qAtualiza.SQL.Clear();
           qAtualiza.SQL.Text := '' +
             ' UPDATE fin_mov_cr f, fin_acoes_movimento a ' +
             ' SET f.vl_entrada = :NovoValor              ' +
             ' WHERE f.cd_acao = a.cd_acao AND            ' +
             '       f.cd_mensalidade = :CdMensalidade AND' +
             '       a.cd_tipo_acao = 4  AND f.nr_sequencia = 1 ';

           // Ação Tipo = 4 => Geração de Títulos;

           qAtualiza.ParamByName('CdMensalidade').AsInteger := FieldByName('cd_mensalidade').AsInteger;
           qAtualiza.ParamByName('NovoValor').AsCurrency    := FieldByName('NovoValor').AsCurrency + FieldByName('valorextra').AsCurrency;

           qAtualiza.ExecSQL();

           // Atualizar Movimento de Desconto Extra

           qAtualiza.Close();
           qAtualiza.SQL.Clear();
           qAtualiza.SQL.Text := '' +
             ' UPDATE fin_mov_cr f, fin_acoes_movimento a ' +
             ' SET f.vl_saida = round((f.vl_saida * :NovoDescExtra) / :descontoextra,2) ' +
             ' WHERE f.cd_acao = a.cd_acao AND            ' +
             '       f.cd_mensalidade = :CdMensalidade AND' +
             '       a.cd_tipo_acao = 3';

           // Ação Tipo = 3 => BAIXA POR DESCONTO;

           qAtualiza.ParamByName('CdMensalidade').AsInteger := FieldByName('cd_mensalidade').AsInteger;
           qAtualiza.ParamByName('NovoDescExtra').AsCurrency    := NovoDescExtra;
           qAtualiza.ParamByName('descontoextra').AsCurrency    := FieldByName('descontoextra').AsCurrency;

           qAtualiza.ExecSQL();
           

        end;

        Next();
    
    end;

  end;

  FreeAndNIl(qSel);
  FreeAndNil(qAtualiza);

  if bAjustou AND avisar then begin

     Mensagem('O procedimento executado efetuou alterações no financeiro do estudante.', 'Atenção', MB_OK + MB_ICONINFORMATION );

  end;

  


end;

procedure TDM.Gerar_Series_Conclusao(intCodigoAluno : integer; strCurso : String; intAnosemestre : integer);
var
  i : word;
begin

  { Inserir as séries de Conclusão na Tabela de Histórico_escolas-series }


  { Verificar as séries concluidas nesta instituição }
  qAux1.Close;
  qAux1.SQL.Clear;
  qAux1.SQL.Text := '';
  qAux1.SQL.Add('select m.anosemestre, m.codigoaluno, t.serie, c.grau, i.nm_instituicao, i.ds_cidade, i.ds_estado');
  qAux1.SQL.Add('from matriculas m, turmas t, cursos c, instituicoes_ensino i');
  qAux1.SQL.Add('where m.turma = t.codigo and m.anosemestre = t.anosemestre ');
  qAux1.SQL.Add(' and t.curso = c.codigo and t.anosemestre = c.anosemestre ');

  try
     i := StrToInt(variavel_parametro('academico_historico_intituicao_codigo'))
  except
     i := 1;
  end;

  qAux1.SQL.Add(' and i.cd_instituicao = ' + IntToStr(i) );
  qAux1.SQL.Add(' and m.codigoaluno = ' + IntToStr(intCodigoAluno));
  qAux1.SQL.Add(' and m.curso = ''' + strCurso + '''');
  qAux1.SQL.Add(' and m.situacao = 0 '); // Somente Aprovado
  qAux1.SQL.Add(' and m.anosemestre = ' + IntToStr(intAnosemestre)); // Somente do Semestre atual (implementado na versão 2004.10.2.18 por Jonathan)
  qAux1.SQL.Add(' order by m.anosemestre desc ');
  qaux1.SQL.text;

  qAux1.Open;

  { Se houver alguma série concluida nesta instituição, então inserir no histórico }
  While not qAux1.Eof do
  Begin

       qAux2.Close;
       qAux2.SQL.Clear;
       qAux2.SQL.Add('replace into historico_escolas_series (codigoaluno, grau, serie, ano, ds_escola, ds_escola_cidade, ds_escola_estado)');
       qAux2.SQL.Add('values (:codigoaluno, :grau, :serie, :ano, :ds_escola, :ds_cidade, :ds_estado) ');

       qAux2.ParamByName('codigoaluno').AsInteger :=   intCodigoAluno;
       qAux2.ParamByName('grau').AsInteger        := qAux1.FieldByName('grau').AsInteger;
       qAux2.ParamByName('serie').AsInteger := qAux1.FieldByName('serie').AsInteger;

        if variavel_parametro('academico_historico_semestre') = 'N' then
          qAux2.ParamByName('ano').AsString := Copy(qAux1.FieldByName('anosemestre').AsString, 1,4)
        else
          qAux2.ParamByName('ano').AsString    := qAux1.FieldByName('anosemestre').AsString;

        qAux2.ParamByName('ds_escola').AsString := qAux1.FieldByName('nm_instituicao').AsString;
        qAux2.ParamByName('ds_cidade').AsString := qAux1.FieldbyName('ds_cidade').AsString;
        qAux2.ParamByName('ds_estado').AsString := qAux1.FieldbyName('ds_estado').AsString;
        qAux2.ExecSQL;
        
      qAux1.Next;
  End;

  { Verificar se deve ser inserida as outras séries }
  if variavel_parametro('academico_historico_series_inserir') = 'S' then
  Begin

     qAux2.Close;
     qAux2.SQL.Clear;
     qAux2.SQL.Add('insert into historico_escolas_series (codigoaluno, grau, serie, ano, ds_escola, ds_escola_cidade, ds_escola_estado)');
     qAux2.SQL.Add('values (:codigoaluno, :grau, :serie, :ano, :ds_escola, :ds_cidade, :ds_estado) ');

     qAux1.Close;
     qAux1.SQL.Clear;
     qAux1.SQL.Add('select m.anosemestre, m.codigoaluno, c.grau, c.numerodeseries etapas');
     qAux1.SQL.Add('from matriculas m, cursos c');
     qAux1.SQL.Add('where m.curso = c.codigo and m.anosemestre = c.anosemestre ');
     qAux1.SQL.Add(' and m.codigoaluno = ' + IntToStr(intCodigoAluno));
     qAux1.SQL.Add(' and m.curso = ''' + strCurso + '''');
     qAux1.SQL.Add(' order by m.anosemestre DESC LIMIT 1 ');

     qAux1.Open;

     if qAux1.Eof then Exit;

     for i := 1 to qAux1.FieldByName('etapas').AsInteger do
     Begin

        try

          qAux2.ParamByName('codigoaluno').AsInteger :=   intCodigoAluno;
          qAux2.ParamByName('grau').AsInteger        :=   qAux1.FieldByName('grau').AsInteger;
          qAux2.ParamByName('serie').AsInteger       :=   i;
          qAux2.ParamByName('ano').AsInteger         :=   0;
          qAux2.ParamByName('ds_escola').AsString := '';
          qAux2.ParamByName('ds_cidade').AsString := '';
          qAux2.ParamByName('ds_estado').AsString := '';

          qAux2.ExecSQL;

        except

        end;

     End;

   end;


End;

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

function TDM.GetContaBoleto(iDepto: Integer; sTurma: String;
  iAnoSemestre: Integer): Integer;
var
  lngAux : Longint;
  strAux : String;
  qyNN : TUMZQuery;
begin

    Dm.CriarConsulta(qyNN);
    qyNN.Close();

    // Pesquisar a conta a partir do cd_caixa no cadastro de turmas
    qyNN.SQL.Text :=
      ' SELECT fcc.cd_caixa, fcc.ds_nn_prefixo, fcc.nr_nn_ultimo FROM fin_cadastro_contas fcc ' +
      ' INNER JOIN turmas t ON (fcc.cd_caixa = t.cd_caixa AND fcc.cd_coligada = t.cd_coligada) ' +
      ' WHERE t.codigo = "' + sTurma + '" AND t.anosemestre = ' + IntToStr(iAnoSemestre);
    qyNN.Open();

    if not qyNN.Eof then begin

       result := qyNN.FieldByName('cd_caixa').AsInteger;
    
    end else begin  // Pesquisar a conta a partir do cd_bloqueto_padrao nos departamentos
       qyNN.Close();
       qyNN.SQL.Text :=
        ' SELECT fcc.cd_caixa, fcc.ds_nn_prefixo, fcc.nr_nn_ultimo FROM fin_cadastro_contas fcc ' +
        ' INNER JOIN departamentos d ON (fcc.cd_caixa = d.cd_boleto_padrao AND fcc.cd_coligada = d.cd_coligada) ' +
        ' WHERE d.codigo = ' + IntToStr(iDepto);
        qyNN.Open();

        if not qyNN.Eof then begin

           result := qyNN.FieldByName('cd_caixa').AsInteger;
    
        end else begin

           result := 0;

        end
    end;

    FreeAndNil(qyNN);

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

procedure TDM.TodasMaiusculas(Formulario: TForm);
var
  n : LongInt ;
begin

  if variavel_parametro('sn_todas_maiusculas') = 'S' then begin

     for n := 0 to ( Formulario.ComponentCount - 1 ) do
     begin
       if ( Formulario.components[n].ClassType = TDBEdit ) then
       begin
           TDBEdit(Formulario.components[n]).CharCase := ecUpperCase
       end
       else if ( Formulario.components[n].ClassType = TEdit ) then
       begin
          TEdit(Formulario.components[n]).CharCase := ecUpperCase
       end
       else if ( Formulario.components[n].ClassType = TComboBox ) then
       begin
          TComboBox(Formulario.components[n]).CharCase := ecUpperCase
       end;
       
     end ;

  end;
  
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

//Esta função retorna o valor de um campo digitado pelo usuário em um campo
//Obs Já foi testado para : TComboBox,TRadioButton , favor quem testar outros tipos de campos adicionar aqui no comentário
function TDM.Get_Parametro_usuario(componente: TComponent;nomeFormulario:string):Boolean;
var
  n : LongInt;
  i : LongInt;
begin
  DM.qAux1.Close;
  DM.qAux1.SQL.Clear;
  DM.qAux1.SQL.Text := 'SELECT ds_valor FROM usuarios_parametros WHERE cd_usuario = :cd_usuario AND ds_parametro = :ds_parametro';
  DM.qAux1.ParamByName('cd_usuario').AsInteger := tblUsuariosNome.FieldByName('Codigo').AsInteger;

 if ( componente.ClassType = TEdit ) then
 begin
   DM.qAux1.ParamByName('ds_parametro').AsString := nomeFormulario+'.'+TEdit(componente).Name;
   DM.qAux1.Open;

   if not DM.qAux1.Eof then
     TEdit(componente).Text := DM.qAux1.FieldByName('ds_valor').AsString;
 end
 else if ( componente.ClassType = TMaskEdit ) then
 begin
   DM.qAux1.ParamByName('ds_parametro').AsString := nomeFormulario+'.'+TMaskEdit(componente).Name;
   DM.qAux1.Open;

   if not DM.qAux1.Eof then
     TMaskEdit(componente).Text := DM.qAux1.FieldByName('ds_valor').AsString;
 end
 else if ( componente.ClassType = TRadioButton ) then
 begin
   DM.qAux1.ParamByName('ds_parametro').AsString := nomeFormulario+'.'+TRadioButton(componente).Name;
   DM.qAux1.Open;

   if not DM.qAux1.Eof then
   begin
      if(DM.qAux1.FieldByName('ds_valor').AsString ='S') then
      begin
         TRadioButton(componente).Checked := true;
      end
      else
      begin
         TRadioButton(componente).Checked := false;
      end;

   end;
 end
 else if ( componente.ClassType = TComboBox ) then
 begin
   DM.qAux1.ParamByName('ds_parametro').AsString := nomeFormulario+'.'+TComboBox(componente).Name;
   DM.qAux1.Open;

   if not DM.qAux1.Eof then
   begin
      //Tenta atualizar o combo com o indice que tiver o ds_valor do parametro
      for i:=0 to TComboBox(componente).Items.Count -1 do
      begin
         if((TComboBox(componente).Items.Strings[i]) = (DM.qAux1.FieldByName('ds_valor').AsString)) then
         begin
               TComboBox(componente).ItemIndex := i;
         end;
      end;
   end;
  
 end
 else if ( componente.ClassType = TCheckBox ) then
 begin
   DM.qAux1.ParamByName('ds_parametro').AsString := nomeFormulario+'.'+TCheckBox(componente).Name;
   DM.qAux1.Open;

   if not DM.qAux1.Eof then
     TCheckBox(componente).Checked := IsTrue(DM.qAux1.FieldByName('ds_valor').AsString);
 end
 else if componente.ClassType = TRadioGroup then
 begin
    DM.qAux1.ParamByName('ds_parametro').AsString := nomeFormulario + '.' + componente.Name;
    DM.qAux1.Open;
    if not DM.qAux1.IsEmpty then
      TRadioGroup(componente).ItemIndex := DM.qAux1.FieldByName('ds_valor').AsInteger;
 end;

 if not DM.qyAux1.Eof then
 begin
       Result:=false;
       DM.qAux1.Close;
       exit;
 end;
   Result:=true;
   DM.qAux1.Close;
   exit;
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

procedure TDM.Parametros_usuario(Formulario: TForm);
var
  n : LongInt ;
begin

  DM.qAux1.Close;
  DM.qAux1.SQL.Clear;
  DM.qAux1.SQL.Text := 'SELECT ds_valor FROM usuarios_parametros WHERE cd_usuario = :cd_usuario AND ds_parametro = :ds_parametro';
  DM.qAux1.ParamByName('cd_usuario').AsInteger := tblUsuariosNome.FieldByName('Codigo').AsInteger;

  for n := 0 to ( Formulario.ComponentCount - 1 ) do
  begin

    if ( Formulario.components[n].ClassType = TEdit ) then
    begin
      DM.qAux1.ParamByName('ds_parametro').AsString := Formulario.Name+'.'+TEdit(Formulario.components[n]).Name;
      DM.qAux1.Open;

      if not DM.qAux1.Eof then
        TEdit(Formulario.components[n]).Text := DM.qAux1.FieldByName('ds_valor').AsString;
    end
    else if ( Formulario.components[n].ClassType = TMaskEdit ) then
    begin
      DM.qAux1.ParamByName('ds_parametro').AsString := Formulario.Name+'.'+TMaskEdit(Formulario.components[n]).Name;
      DM.qAux1.Open;

      if not DM.qAux1.Eof then
        TMaskEdit(Formulario.components[n]).Text := DM.qAux1.FieldByName('ds_valor').AsString;
    end
    else if ( Formulario.components[n].ClassType = TComboBox ) then
    begin
      DM.qAux1.ParamByName('ds_parametro').AsString := Formulario.Name+'.'+TComboBox(Formulario.components[n]).Name;
      DM.qAux1.Open;

      if not DM.qAux1.Eof then
        TComboBox(Formulario.components[n]).Text := DM.qAux1.FieldByName('ds_valor').AsString;
    end
    else if ( Formulario.components[n].ClassType = TCheckBox ) then
    begin
      DM.qAux1.ParamByName('ds_parametro').AsString := Formulario.Name+'.'+TCheckBox(Formulario.components[n]).Name;
      DM.qAux1.Open;

      if not DM.qAux1.Eof then
        TCheckBox(Formulario.components[n]).Checked := IsTrue(DM.qAux1.FieldByName('ds_valor').AsString);

    end;
  DM.qAux1.Close;
  end ;

end;

Function TDM.TemLivrosAtrasados( cd_pessoa: integer ): boolean;
begin

  qAux1.Close;
  qAux1.SQL.Clear;
  qAux1.SQL.Add( 'SELECT                                                        ');
  qAux1.SQL.Add( '	COUNT(*) AS qtde                                            ');
  qAux1.SQL.Add( 'FROM                                                          ');
  qAux1.SQL.Add( '	bibliotecaemprestimos                                       ');
  qAux1.SQL.Add( 'WHERE                                                         ');
  qAux1.SQL.Add( '	codigopessoa = :cd_pessoa AND                               ');
  qAux1.SQL.Add( '	devolvido = ''N'' AND                                       ');
  qAux1.SQL.Add( '	datadevolucao < :dt_hoje                                    ');
  qAux1.ParamByName( 'cd_pessoa' ).AsInteger := cd_pessoa;
  qAux1.ParamByName( 'dt_hoje' ).AsString := FormatDateTime( 'yyyy-mm-dd 00:00:00', DataHoje );
  qAux1.Open;

  Result := ( qAux1.FieldByName( 'qtde' ).AsInteger > 0 );

  qAux1.Close;
  
end;

Function TDM.DataAtual(): TDateTime;
Begin
  qAux1.Close;
  qAux1.SQL.Clear;
  qAux1.SQL.Add('SELECT NOW() AS data FROM dual');
  qAux1.Open;

  Result := qAux1.FieldByName( 'data' ).AsDateTime;
End;

function TDM.DataBloqueioFinanceiro: TDateTime;
Var
  qyDatas : TUMZQuery;
begin

  CriarConsulta(qyDatas);
  qyDatas.SQL.Text := ''+
    ' SELECT sn_bloquear_financeiro, dt_bloqueio_financeiro FROM coligadas  ' +
    ' WHERE cd_coligada = ' + IntToStr(Dm.iColigadaSelecionada);
  qyDatas.Open();

  if (qyDatas.FieldByName('sn_bloquear_financeiro').AsInteger = 0) then begin
     Result := 0;
  end else begin
     Result := qyDatas.FieldByName('dt_bloqueio_financeiro').AsDateTime;
  end;

  FreeAndNil(qyDatas);

end;

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

function TDM.disciplinaAlocada(iCodigo: Integer; sCurso: String): boolean;
var
   qyAux1, qyAux2 : TUMZQuery;
begin
  CriarConsulta(qyAux1);
  qyAux1.SQL.Clear;
  qyAux1.SQL.Text:= 'SELECT count(*) as conta FROM turmasprofessores WHERE disciplina= '+IntToStr(iCodigo)+' AND curso="'+sCurso+'"';
  qyAux1.Open;

  Result:= true;

  if qyAux1.FieldByName('conta').AsInteger = 0 then begin
     CriarConsulta(qyAux2);
     qyAux2.SQL.Clear;
     qyAux2.SQL.Text:= 'SELECT count(*) as conta FROM fichaindividual WHERE disciplina= '+IntToStr(iCodigo)+' AND curso="'+sCurso+'"';
     qyAux2.Open;

     if qyAux2.FieldByName('conta').AsInteger = 0 then begin
        Result:= false;
     end;
  end;

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

function TDM.EstaBloqueado(DataTitulo: TDateTime;
  EmitirAviso: Boolean): boolean;
Var
   DtBloqueio : TDateTime;
begin

   // Pegar a Data do Bloqueio
   DtBloqueio := DataBloqueioFinanceiro();

   if DtBloqueio = 0 then begin

      // Bloqueio Desligado
      Result := false;

   end else begin

      if DataTitulo > DtBloqueio then begin

         // Bloqueio ligado, porém a data que está sendo alterada é maior
         Result := false;

      end else begin

         Result := true;

         if EmitirAviso then begin

            Mensagem('Você não pode efetuar alterações/inclusões de títulos com data inferior ou igual a ' + FormatDateTime('dd/mm/yyyy', DtBloqueio), 'Atenção', MB_OK + MB_ICONINFORMATION );
         
         end;

      end;


   end;


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

function TDM.BuscaDisciplinasSemPI(CodigoAluno: Integer; TurmaMatricula: String;
  AnoSemestre: Integer): string;
Var
   qBusca: TUMZQuery;
   sAux : String;
   sOP : String;

   usar_pi_novo : bool;
begin

    CriarConsulta(qBusca);

    qBusca.SQL.Text :=
      'SELECT ds_valor FROM parametros WHERE ds_variavel = "dol_calcular_pi_novo" ORDER BY ds_variavel';
    qBusca.Open();

    usar_pi_novo := false;

    if not qBusca.EOF then
    begin
      if qBusca.FieldByName('ds_valor').asString = '1' then
      begin
         usar_pi_novo := true
      end;
    end;
    qBusca.Close();

    CriarConsulta(qBusca);

    if usar_pi_novo = true then
    begin

     qBusca.SQL.Text :=
		 '	SELECT  ' +
		 '		uni_fi.turma, uni_fi.anosemestre, uni_fi.disciplina, uni_fi.curso,  ' +
		 '		pint_pt.cd_disciplina  ' +
		 '	FROM  ' +
		 '		fichaindividual as uni_fi  ' +
     '  ' +
		 '		LEFT JOIN pint_provas_turmas as pint_pt ON (  ' +
		 '			pint_pt.nr_anosemestre 	= uni_fi.anosemestre and  ' +
		 '			pint_pt.cd_curso 				= uni_fi.curso and  ' +
		 '			pint_pt.cd_turma 				= uni_fi.turma and  ' +
		 '			pint_pt.cd_disciplina   = uni_fi.disciplina  ' +
		 '		)  ' +
     '  ' +
		 '	WHERE  ' +
		 '		uni_fi.codigoaluno 	= "'+ IntToStr(CodigoAluno) +'" and  ' +
		 '		uni_fi.anosemestre	= "'+ IntToStr(AnoSemestre) +'"  and  ' +
		 '		pint_pt.cd_disciplina is  null  ';

    end
    else
    begin

      qBusca.SQL.Text :=
      ' SELECT fi.turma, fi.anosemestre, fi.disciplina, fi.curso  ' +
      ' FROM fichaindividual fi LEFT JOIN provas_turmas pt ' +
      '      ON (fi.turma = pt.cd_turma AND fi.disciplina = pt.cd_disciplina AND fi.anosemestre = pt.nr_anosemestre) ' +
      ' LEFT JOIN provas p ON (p.cd_prova = pt.cd_prova) ' +
      ' WHERE fi.codigoaluno = '+ IntToStr(CodigoAluno) +' AND fi.anosemestre = '+ IntToStr(AnoSemestre) +
      '   AND fi.turmamatricula = "' + TurmaMatricula + '" ' +
      '       AND pt.cd_provas_turmas is null ';

    end;


   qBusca.Open();

   sAux := '';
   sOp := '';

   while not qBusca.EOF do begin

       sAux := sAux + sOp + '(fichaindividual.disciplina=' + qBusca.FieldByName('disciplina').AsString;
       sAux := sAux + ' AND fichaindividual.curso = "' + qBusca.FieldByName('curso').AsString + '"';
       sAux := sAux + ') ';
       sOp := ' OR ';
       qBusca.Next();

   end;

   result := sAux;

   qBusca.close();

   FreeAndNil(qBusca);

end;

function TDM.BuscarCodigoAcaoPadrao(CodPadrao: Integer): Integer;
var
   qyAcao : TUMZQuery;
begin

   CriarConsulta(qyAcao);

   qyAcao.SQL.Clear;
   qyAcao.SQL.Add(
   ' SELECT                              ' +
   '   *                                 ' +
   ' FROM                                ' +
   '    fin_acoes_movimento              ' +
   ' WHERE                               ' +
   '    cd_acao_automatica = ' + IntToStr(CodPadrao) );

   qyAcao.Open;

   if qyAcao.Eof then begin
      Result := -1;
   end
   else begin
      Result := qyAcao.FieldByName('cd_acao').AsInteger;
   end;

   FreeAndNil(qyAcao);

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

function TDM.FazAcaoRemessa(Acao: TAcaoRemessa;
  iCodMensalidade: Integer): Boolean;
var
   iAcao: Integer;
   sAux: string;
   qyEx: TUMZQuery;
begin
   DM.CriarConsulta(qyEx);
   Result := False;

   case Acao of
       arBaixa: iAcao := 0;
       arCancelar: iAcao := 1;
       arDesconto: iAcao := 2;
       arProtestar: iAcao := 3;
       arEstornar: iAcao := 4;
       arAltMensalidade: iAcao := 5;
       arNegociar: iAcao := 6;
       arProrrogar: iAcao := 7;
       arImpBoleto: iAcao := 8;
       arGerarMensalidade: iAcao := 9;
   end;

   // Se não for Impressão de boletos ou Geração de Títulos, ou seja, é algum
   // tipo de alteração ou baixa, então, verificar se ja foi gerada a remessa
   // anteriormente de Geração ou impressão, pois não pode dar baixa se o
   // título não foi registrado.
   if not (Acao in [arGerarMensalidade, arImpBoleto]) then begin
      with qyEx do begin
         Close();
         Params.Clear();
         SQL.Clear();
         SQL.Add(''+
         '  SELECT                 '+
         '     rd.cd_layout, COUNT(*) as conta   '+
         '  FROM                   '+
         '     rem_dados rd        '+
         '     INNER JOIN rem_ocorrencias ro ON (rd.cd_ocorrencia = ro.cd_ocorrencia AND rd.cd_layout = ro.cd_layout)   '+
         '  WHERE                  '+
         '     rd.cd_mensalidade = ' + IntToStr(iCodMensalidade) + ' '+
         '     AND (ro.cd_acao = 9 OR ro.cd_acao = 8)        '+
         '  GROUP BY                                         '+
         '     rd.cd_layout                                  '+
         '');
         Open();
         sAux := ' AND rem_ocorrencias.cd_layout IN (-1';
         if not IsEmpty then begin
            while not Eof do begin

               if (FieldByName('conta').AsInteger > 0) then begin
                  sAux := sAux + ', ' + FieldByName('cd_layout').AsString;
               end;

               Next();
            end;
         end;
         sAux := sAux + ')';
         Close();
      end; //with
   end
   else begin
      // A Impressão ou geração envia o título para Remessa. Então, deve ser
      // verificado se o mesmo ja está registrado. Isso se faz comparando a
      // existencia do mesmo na REMESSA e também no RETORNO do título

      qyEx.Close();
      qyEx.SQL.Text :=
        ' SELECT ir.cd_mensalidade, rm.cd_remessa, oc.* ' +
        ' FROM itensretorno ir, rem_dados rm, banco_codigo_retorno oc, retorno rt, rem_layouts rl '+
        ' WHERE rt.codigo = ir.codigoretorno AND ir.cd_mensalidade = rm.cd_mensalidade AND ' +
        '       ir.cd_ocorrencia = oc.cd_retorno AND rt.cd_banco = oc.cd_banco AND ' +
        '       rm.cd_layout = rl.cd_layout AND rl.sn_sempre_reenviar = 0 AND oc.sn_aceito = 1 AND '  +
        '       ir.cd_mensalidade = ' + IntToStr(iCodMensalidade);
      qyEx.Open();

      if not qyEx.EOF then begin
         // TEM retorno aceito da remessa aterior.
         // Não deve reenviar.
         Result := false;
         Exit;
      end;

      sAux := '';
   end;

   // Se a ação for de baixa verificar se existe algum envio em aberto daquela mensalidade
   if Acao in [arBaixa] then begin
      with qyEx do begin
         Close();
         Params.Clear();
         SQL.Clear();
         SQL.Add(''+
         ' DELETE                  '+
         ' FROM                    '+
         ' 	rem_dados              '+
         ' USING                   '+
         ' 	rem_dados              '+
         ' 	INNER JOIN rem_ocorrencias ON (rem_dados.cd_ocorrencia = rem_ocorrencias.cd_ocorrencia AND rem_dados.cd_layout = rem_ocorrencias.cd_layout) '+
         ' WHERE                   '+
         ' 	rem_dados.cd_mensalidade = :mensalidade  '+
         ' 	AND rem_dados.sn_enviado = :enviado      '+
         ' 	AND rem_ocorrencias.cd_acao = :acao '+
         '');
         ParamByName('mensalidade').AsInteger := iCodMensalidade;
         ParamByName('acao').AsInteger := iAcao;
         ParamByName('enviado').AsInteger := 0;
         ExecSQL();
      end;
   end;

   with qyEx do begin
      qyEx.Close();
      qyEx.Params.Clear();
      qyEx.SQL.Clear();

      // Verificar se tem conta financeira padrão no cadastro de turmas
      qyEx.SQL.Add(
      ' SELECT          ' +
      '   me.cd_caixa as me_caixa, t.cd_caixa as tu_caixa' +
      ' FROM            ' +
      '   turmas t INNER JOIN mensalidades me  ' +
      '    ON (me.turma = t.codigo and me.anosemestre = t.anosemestre) ' +
      ' WHERE   ' +
      '    me.cd_mensalidade = ' + IntToStr(iCodMensalidade) +  ' AND ' +
      '   ((t.cd_caixa is not null AND t.cd_caixa > 0) OR me.cd_caixa is not null)' +
      '');

      qyEx.Open();

      if not EOF then begin

         sAux := sAux + ' AND rem_layouts.cd_caixa IN (-1';

         while not Eof do begin
               if not (qyEx.FieldByName('me_caixa').IsNull) then begin
                  sAux := sAux + ', ' + qyEx.FieldByName('me_caixa').AsString;
               end
               else begin
                  sAux := sAux + ', ' + qyEx.FieldByName('tu_caixa').AsString;
               end;
               qyEx.Next();
         end;

         sAux := sAux + ')';

      end;

      //LIMPA DADOS
      // ???????????????????????
      Close();
      Params.Clear();
      SQL.Clear();
      SQL.Add(''+
      ' DELETE FROM rem_dados ' +
      ' USING   ' +
      '   rem_dados  ' +
      '   INNER JOIN rem_ocorrencias '+
      '   INNER JOIN rem_layouts ON (rem_ocorrencias.cd_layout = rem_layouts.cd_layout) ' +
      ' WHERE                      ' +
      '    rem_dados.sn_enviado = 0   ' +
      '    AND rem_ocorrencias.sn_ativo = 1  ' +
      '    AND rem_ocorrencias.cd_acao = ' + IntToStr(iAcao) +
      '    AND rem_dados.cd_mensalidade = ' + IntToStr(iCodMensalidade) + 
      '  '+ sAux +
      '');
      try
         ExecSQL();
      except
      end;

      //INSERE
      Close();
      Params.Clear();
      SQL.Clear();

      SQL.Add(''+
      'INSERT IGNORE INTO rem_dados                                                        '+
      '	(cd_remessa, cd_layout, cd_ocorrencia, cd_mensalidade, dt_acao, sn_enviado) '+
      ' (SELECT         ' +
      '  NULL as cd_remessa, rem_ocorrencias.cd_layout, rem_ocorrencias.cd_ocorrencia, '+ IntToStr(iCodMensalidade) +', NOW() as dt_acao, 0 as sn_enviado ' +
      ' FROM   ' +
      '   rem_ocorrencias INNER JOIN rem_layouts ON (rem_ocorrencias.cd_layout = rem_layouts.cd_layout) ' +
      ' WHERE rem_ocorrencias.sn_ativo = 1 AND ' +
      '    rem_ocorrencias.cd_acao = ' + IntToStr(iAcao) +
      '  '+ sAux + ')                                                                '+
      '');
      Sql.ADD('');
      try
         ExecSQL();
         Result := True;
      except
         Result := False;
      end;
      Close();
      SQL.Clear();
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

procedure TDM.MontarPlanilha(Grade: TDBGrid; Campos: String);
var
   lstCampos : TStringList ;
   i : Integer;
begin

   lstCampos := TStringList.Create ;

   SplitString(campos, ';', lstCampos) ;

   // Se não tiver campos, manter o que foi configurado visualmente...
   if lstCampos.Count = 0 then Exit;

   Grade.Columns.Clear ;

   For i := 0 To lstCampos.Count -1 do begin

      Grade.Columns.Add;

      Grade.Columns[i].FieldName := lstCampos[i];

   End;


end;

{procedure TDM.setLog(cd_modulo: integer; operacao: TTipoOperacao;
  ds_observacoes: string = '');
var
   ALogBDE: TLogBDE;
begin
   ALogBDE := TLogBDE.Create();
   ALogBDE.setLog(tblUsuariosNome.FieldByName('codigo').AsInteger, cd_modulo, operacao, ds_observacoes);
end;
}

procedure TDM.setLog(cd_modulo: integer; operacao: string; chave : string = ''; coligada : integer = 0;ds_observacoes: string = '');
var
   ALogBDE: TLogBDE;
begin
   ALogBDE := TLogBDE.getLogger(DB);
   ALogBDE.setLog(tblUsuariosNome.FieldByName('codigo').AsInteger, cd_modulo, operacao, chave, coligada, ds_observacoes);
end;

end.
