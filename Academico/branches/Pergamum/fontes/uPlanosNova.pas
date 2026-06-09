unit uPlanosNova;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, StdCtrls, Mask, ComCtrls, Grids, DBGrids, ImgList, ToolWin,
  DB, ZAbstractRODataset, ZAbstractDataset, UZDataset, DBCtrls, ZSqlUpdate,
  Buttons, CheckLst, DateUtils, Math, uChecarUsoColigada, uPlanoPagamento,uColigada;

type
  TfrmPlanosNova = class(TForm)
    pnTitulo: TPanel;
    pnCadastro: TPanel;
    Panel1: TPanel;
    Label1: TLabel;
    edAnosemestre: TMaskEdit;
    UpDown1: TUpDown;
    pnListagem: TPanel;
    Panel3: TPanel;
    grdPlanos: TDBGrid;
    toolPessoa: TToolBar;
    ToolButton1: TToolButton;
    btnInserir: TToolButton;
    btnAlterar: TToolButton;
    btnExcluir: TToolButton;
    ToolButton4: TToolButton;
    btnSalvar: TToolButton;
    btnCancelar: TToolButton;
    ToolButton8: TToolButton;
    btnFechar: TToolButton;
    ToolButton2: TToolButton;
    ImageList1: TImageList;
    qyPlanos: TUMZQuery;
    dsPlanos: TDataSource;
    qyPlanosCD_PLANO: TIntegerField;
    qyPlanosCD_COLIGADA: TIntegerField;
    qyPlanosCD_TIPO_PLANO: TIntegerField;
    qyPlanosDS_PLANO: TStringField;
    qyPlanosNR_ANOSEMESTRE: TSmallintField;
    qyPlanosNR_PARCELAS: TSmallintField;
    qyPlanosVL_COBRADO: TFloatField;
    qyPlanosVL_CONTRATO: TFloatField;
    qyPlanosVL_TAXAMATERIAL: TFloatField;
    qyPlanosVL_TAXAAPOSTILA: TFloatField;
    qyPlanosVL_DESCONTO: TFloatField;
    qyPlanosVL_MATRICULA: TFloatField;
    qyPlanosDT_APARTIR: TDateTimeField;
    qyPlanosNR_TAXASMATERIAL: TSmallintField;
    qyPlanosDS_PARAGRAFO3: TStringField;
    qyPlanosNR_DIAS_PARCELA_ZERO: TSmallintField;
    qyPlanosSN_DIAS_UTEIS: TSmallintField;
    qyPlanosSN_CREDITOS: TSmallintField;
    qyPlanosNR_CREDITOS_BASE: TFloatField;
    qyPlanosNR_MAX_DISCIPLINAS: TLargeintField;
    qyPlanosDS_TIPO_TITULO: TStringField;
    qyPlanosNR_TOTAL_TURMAS: TLargeintField;
    updPlanos: TZUpdateSQL;
    qyPlanosItens: TUMZQuery;
    qyPlanosItensCD_PLANO_ITEM: TIntegerField;
    qyPlanosItensCD_PLANO: TIntegerField;
    qyPlanosItensNR_PARCELA: TSmallintField;
    qyPlanosItensVL_BRUTO: TFloatField;
    qyPlanosItensVL_DESCONTO: TFloatField;
    qyPlanosItensVL_EXTRA: TFloatField;
    qyPlanosItensVL_DESCONTO_EXTRA: TFloatField;
    qyPlanosItensVL_TOTAL: TFloatField;
    qyPlanosItensNR_DIA: TSmallintField;
    qyPlanosItensNR_MES: TIntegerField;
    qyPlanosItensNR_ANO: TSmallintField;
    qyPlanosItensNR_CREDITOS_MINIMOS: TFloatField;
    qyPlanosItensSN_CREDITO_PARCELA: TSmallintField;
    qyPlanosItensCD_TIPO_PARCELA: TIntegerField;
    dsPlanosItens: TDataSource;
    updPlanosItens: TZUpdateSQL;
    qyTiposTitulo: TUMZReadOnlyQuery;
    qyTiposTitulocd_tipo_titulo: TIntegerField;
    qyTiposTitulods_tipo_titulo: TStringField;
    qyPlanosItensDS_TIPO_TITULO: TStringField;
    ImageList2: TImageList;
    qyPlanosTurmas: TUMZQuery;
    qyPlanosTurmasCD_CURSO: TStringField;
    qyPlanosTurmasCD_TURMA: TStringField;
    qyPlanosTurmasDS_TURMA: TStringField;
    dsPlanosTurmas: TDataSource;
    qyPlanosDistratos: TUMZQuery;
    qyPlanosDistratosCD_DISTRATO: TIntegerField;
    qyPlanosDistratosCD_PLANO: TIntegerField;
    qyPlanosDistratosVL_COBRANCA: TFloatField;
    qyPlanosDistratosSN_ATIVO: TSmallintField;
    qyPlanosDistratosCD_TIPO_VALOR: TSmallintField;
    qyPlanosDistratosNR_DIAS_VENCIMENTO: TSmallintField;
    qyPlanosDistratosCD_TIPO_TITULO: TIntegerField;
    dsPlanosDistratos: TDataSource;
    qyPlanosDistratosDS_TIPO_TITULO: TStringField;
    ScrollBox1: TScrollBox;
    Panel4: TPanel;
    Panel6: TPanel;
    pcInformacoes: TPageControl;
    tsParcelas: TTabSheet;
    Panel8: TPanel;
    btnCalcularParcelas: TSpeedButton;
    Panel9: TPanel;
    grdParcelas: TDBGrid;
    tsDistrato: TTabSheet;
    Panel2: TPanel;
    Label3: TLabel;
    Label4: TLabel;
    lbQtdCreditosBase: TLabel;
    Label5: TLabel;
    lbValorExtra: TLabel;
    Label7: TLabel;
    Label6: TLabel;
    Label8: TLabel;
    Label9: TLabel;
    Label10: TLabel;
    btnCopiarPlano: TSpeedButton;
    edDescricao: TDBEdit;
    edParcelas: TDBEdit;
    rgTipoPlano: TRadioGroup;
    edQtdCreditosBase: TDBEdit;
    edValor: TDBEdit;
    edValorExtra: TDBEdit;
    edDescCond: TDBEdit;
    edVlParcZero: TDBEdit;
    edDiasParcZero: TDBEdit;
    edAPartirDe: TDBEdit;
    edObservacoesEspeciais: TDBEdit;
    DBCheckBox1: TDBCheckBox;
    pnAlinhamentoCurso: TPanel;
    pnAlinhamentoTurma: TPanel;
    pnAlinhamentoBotoes: TPanel;
    btnLimpar: TButton;
    btnFiltrar: TButton;
    ScrollBox2: TScrollBox;
    Label13: TLabel;
    edValorCobranca: TDBEdit;
    rgTipoValor: TRadioGroup;
    Label15: TLabel;
    cbTipoTitulo: TDBLookupComboBox;
    Label16: TLabel;
    ckbSituacoesEstudante: TCheckListBox;
    lbContabilizarTiposTitulo: TLabel;
    ckbContabilizarTiposTitulo: TCheckListBox;
    edDiasVencimento: TDBEdit;
    Label14: TLabel;
    qyPlanosItensSN_DIVISIVEL: TSmallintField;
    qyPlanosItensDS_CREDITO_PARCELA: TStringField;
    qyPlanosItensDS_DIVISIVEL: TStringField;
    lblDiasVencto: TLabel;
    qyPlanosDS_DIAS_VENCTO: TStringField;
    qyPlanosDS_TIPO_PLANO: TStringField;
    qyPlanosSN_PULAR_SABADOS: TSmallintField;
    qyPlanosSN_PULAR_DOMINGOS: TSmallintField;
    qyPlanosSN_PULAR_FERIADOS: TSmallintField;
    dbchPularSabados: TDBCheckBox;
    dbchPularDomingos: TDBCheckBox;
    dbchPularFeriados: TDBCheckBox;
    rgTipoParcelas: TRadioGroup;
    qyPlanosDistratosSN_TIPO_PARCELA: TSmallintField;
    dblcTipoTitulo: TDBLookupComboBox;
    Label17: TLabel;
    sdfsad: TLabel;
    Label18: TLabel;
    Label2: TLabel;
    LblDtInicio: TLabel;
    LblDtFim: TLabel;
    DBEdit1: TDBEdit;
    DBEdit2: TDBEdit;
    qyPlanosDT_VIGENCIA_INICIO: TDateTimeField;
    qyPlanosDT_VIGENCIA_FIM: TDateTimeField;
    snVigencia: TDBCheckBox;
    qyPlanosSN_VIGENCIA: TSmallintField;
    tsTurmas: TTabSheet;
    ScrollBox3: TScrollBox;
    grdTurmas: TDBGrid;
    Panel10: TPanel;
    ToolBar1: TToolBar;
    btnAddCurso: TToolButton;
    btnAddTurma: TToolButton;
    ToolButton3: TToolButton;
    ToolButton5: TToolButton;
    ToolButton6: TToolButton;
    Panel11: TPanel;
    pnNaoPodeExcluirItens: TPanel;
    Label19: TLabel;
    edUnidadeEnsino: TEdit;
    sbSelecionaUnidadeEnsino: TSpeedButton;
    lbUnidadeEnsino: TLabel;
    Label11: TLabel;
    edCurso: TEdit;
    sbFiltroCurso: TSpeedButton;
    Label12: TLabel;
    edTurma: TEdit;
    sbFiltroTurma: TSpeedButton;
    edFiltroDesc: TEdit;
    Label20: TLabel;
    pnCalendario: TPanel;
    tspe: TSpeedButton;
    clbDiasVencto: TCheckListBox;
    sbSelDias: TSpeedButton;
    sbExpandeCalendario: TSpeedButton;
    DBLookupComboBox1: TDBLookupComboBox;
    DBLookupComboBox2: TDBLookupComboBox;
    Label21: TLabel;
    Label22: TLabel;
    qyAcoesDescontoCondicional: TUMZQuery;
    qyAcoesDescontoCondicionalcd_acao: TLargeintField;
    qyAcoesDescontoCondicionalds_acao: TStringField;
    qyAcoesDescontoFixo: TUMZQuery;
    LargeintField1: TLargeintField;
    StringField1: TStringField;
    qyPlanoscd_acao_movimento_desc_cond: TLargeintField;
    qyPlanoscd_acao_movimento_desc_fixo: TLargeintField;
    qyPlanosAcaoMovimentoDescCondicional: TStringField;
    qyPlanosAcaoMovimentoDescFixo: TStringField;
    procedure grdParcelasEnter(Sender: TObject);
    procedure grdPlanosDrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumn; State: TGridDrawState);
    procedure sbExpandeCalendarioClick(Sender: TObject);
    procedure sbSelecionaUnidadeEnsinoClick(Sender: TObject);
    procedure snVigenciaClick(Sender: TObject);
    procedure CheckBox1Click(Sender: TObject);
    procedure qyPlanosAfterPost(DataSet: TDataSet);
    procedure qyTiposTituloAfterOpen(DataSet: TDataSet);
    procedure grdParcelasKeyPress(Sender: TObject; var Key: Char);
    procedure grdParcelasColExit(Sender: TObject);
    procedure grdParcelasDrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumn; State: TGridDrawState);
    procedure rgTipoParcelasClick(Sender: TObject);
    procedure qyPlanosCalcFields(DataSet: TDataSet);
    procedure tspeClick(Sender: TObject);
    procedure sbSelDiasClick(Sender: TObject);
    procedure clbDiasVenctoClickCheck(Sender: TObject);
    procedure qyPlanosItensDS_DIVISIVELSetText(Sender: TField;
      const Text: string);
    procedure grdParcelasKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure dsPlanosStateChange(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure qyPlanosBeforePost(DataSet: TDataSet);
    procedure qyPlanosBeforeDelete(DataSet: TDataSet);
    procedure qyPlanosItensBeforeDelete(DataSet: TDataSet);
    procedure btnCopiarPlanoClick(Sender: TObject);
    procedure qyPlanosItensBeforePost(DataSet: TDataSet);
    procedure btnCalcularParcelasClick(Sender: TObject);
    procedure qyPlanosDistratosBeforePost(DataSet: TDataSet);
    procedure pcInformacoesChange(Sender: TObject);
    procedure pcInformacoesChanging(Sender: TObject; var AllowChange: Boolean);
    procedure ckbContabilizarTiposTituloClickCheck(Sender: TObject);
    procedure ckbSituacoesEstudanteClickCheck(Sender: TObject);
    procedure edValorCobrancaKeyUp(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure dsPlanosDistratosStateChange(Sender: TObject);
    procedure qyPlanosDistratosAfterOpen(DataSet: TDataSet);
    procedure rgTipoValorClick(Sender: TObject);
    procedure btnAddTurmaClick(Sender: TObject);
    procedure btnAddCursoClick(Sender: TObject);
    procedure ToolButton6Click(Sender: TObject);
    procedure ToolButton5Click(Sender: TObject);
    procedure btnFiltrarClick(Sender: TObject);
    procedure btnLimparClick(Sender: TObject);
    procedure sbFiltroTurmaClick(Sender: TObject);
    procedure sbFiltroCursoClick(Sender: TObject);
    procedure qyPlanosItensDS_CREDITO_PARCELASetText(Sender: TField;
      const Text: string);
    procedure qyPlanosNewRecord(DataSet: TDataSet);
    procedure rgTipoPlanoClick(Sender: TObject);
    procedure dsPlanosDataChange(Sender: TObject; Field: TField);
    procedure btnFecharClick(Sender: TObject);
    procedure btnCancelarClick(Sender: TObject);
    procedure btnSalvarClick(Sender: TObject);
    procedure btnExcluirClick(Sender: TObject);
    procedure btnAlterarClick(Sender: TObject);
    procedure btnInserirClick(Sender: TObject);
    procedure UpDown1Click(Sender: TObject; Button: TUDBtnType);
    procedure FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure FormDestroy(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormShow(Sender: TObject);
  private
    { Propertys }
    coligada_filtrada : TColigada;
    function verificaDescontoFixoDigitado: Boolean;
    function verificaDescontoCondicionalDigitado: Boolean;
    function verificaAcaoMovimentoDefinida: Boolean;
    function getCurso: String;
    function getTurma: String;
    function podeAlterarPlanosItens: Boolean;
    function hasDiaSelecionado(): Boolean;

    procedure setCurso(const Value: String);
    procedure setTurma(const Value: String);
    function getAnosemestre: Integer;
    procedure setAnosemestre(const Value: Integer);

    { Filtros }
    procedure FiltrarPlano( filtro_anosemestre: Integer = 0; filtro_curso: String = ''; filtro_turma: String = ''; cd_coligada : Integer = 0; desc_plano : String = '' );
    procedure FiltrarPlanosItens();
    procedure FiltrarPlanosTurmas();
    procedure FiltrarPlanosDistratos(abri_query: Boolean = True; ativar: Boolean = False);

    procedure FiltrarTiposTituloDistrato();
    procedure FiltrarSituacoesMatriculaDistrato();
    procedure FiltrarTiposTitulo();

    { Outros }
    procedure MostraEscondeCamposTipoTitulo();
    procedure MostraEscondeListaTiposTitulo();
    procedure VerificaBotoesAcoes();

    { Condicoes de Campos }
    procedure SomenteNumeros(Sender: TObject; var Key: Char);
    procedure SomenteNumerosEVirgula(Sender: TObject; var Key: Char);

    { Carrega informações }
    procedure CarregarTiposTitulo(carregar_banco: Boolean = True);
    procedure CarregarSituacoesMatriculas(carregar_banco: Boolean = True);

    { Adiciona/Remove Tipos Titulos e Situacoes Matriculas }
    procedure AdicionaTipoTitulo( cd_tipo_titulo: Integer );
    procedure AdicionaSituacaoMatricula( cd_situacao: Integer );

    procedure RemoveTipoTitulo( cd_tipo_titulo: Integer );
    procedure RemoveSituacaoMatricula( cd_situacao: Integer );

    { Private declarations }
    property nr_anosemestre: Integer read getAnosemestre write setAnosemestre;
    property cd_curso: String read getCurso write setCurso;
    property cd_turma: String read getTurma write setTurma;
  public
    { Public declarations }
  end;

var
  frmPlanosNova: TfrmPlanosNova;

implementation

uses uDM, Main, General, uFSelecionarCurso, uFSelecionarTurma, uItemCombo, uPlanosCopiar,
  ClassPlanosPagamento, Types, uFSelecionarColigada, uUsuario;

{$R *.dfm}

procedure TfrmPlanosNova.AdicionaSituacaoMatricula(cd_situacao: Integer);
var
   qyInsereSituacaoMatricula: TUMZQuery;
begin
   DM.CriarConsulta(qyInsereSituacaoMatricula);

   qyInsereSituacaoMatricula.SQL.Clear();
   qyInsereSituacaoMatricula.SQL.Add('INSERT INTO FIN_PLANOS_DISTRATOS_SIT_MATRI ( CD_DISTRATO, CD_SITUACAO )');
   qyInsereSituacaoMatricula.SQL.Add('VALUES ( :CD_DISTRATO, :CD_SITUACAO )');

   qyInsereSituacaoMatricula.ParamByName('CD_DISTRATO').AsInteger := qyPlanosDistratosCD_DISTRATO.AsInteger;
   qyInsereSituacaoMatricula.ParamByName('CD_SITUACAO').AsInteger := cd_situacao;

   qyInsereSituacaoMatricula.ExecSQL();
end;

procedure TfrmPlanosNova.AdicionaTipoTitulo(cd_tipo_titulo: Integer);
var
   qyInsereTipoTitulo: TUMZQuery;
begin
   DM.CriarConsulta(qyInsereTipoTitulo);

   qyInsereTipoTitulo.SQL.Clear();
   qyInsereTipoTitulo.SQL.Add('INSERT INTO FIN_PLANOS_DISTRATOS_TIPO_TITU ( CD_DISTRATO, CD_TIPO_TITULO )');
   qyInsereTipoTitulo.SQL.Add('VALUES ( :CD_DISTRATO, :CD_TIPO_TITULO )');

   qyInsereTipoTitulo.ParamByName('CD_DISTRATO').AsInteger := qyPlanosDistratosCD_DISTRATO.AsInteger;
   qyInsereTipoTitulo.ParamByName('CD_TIPO_TITULO').AsInteger := cd_tipo_titulo;

   qyInsereTipoTitulo.ExecSQL();
end;

procedure TfrmPlanosNova.btnAddCursoClick(Sender: TObject);
var
   qyInsertPlanosTurma: TUMZQuery;
   qryBuscaTurmas     : TUMZQuery;
   filtro_curso: String;
   P: Pointer;
   resultado_filtro : TResultadoFiltroCurso;
begin
   DM.CriarConsulta(qyInsertPlanosTurma);
   DM.CriarConsulta(qryBuscaTurmas);

   qyInsertPlanosTurma.SQL.Clear();
   qyInsertPlanosTurma.SQL.Add('INSERT INTO FIN_PLANOS_TURMAS ( CD_PLANO, CD_CURSO, CD_TURMA )');
   qyInsertPlanosTurma.SQL.Add('VALUES ( :CD_PLANO, :CD_CURSO, :CD_TURMA  )');


   qryBuscaTurmas.SQL.Add('   SELECT :CD_PLANO as CD_PLANO, CURSO, CODIGO FROM turmas');
   qryBuscaTurmas.SQL.Add('   WHERE curso = :CD_CURSO AND cd_coligada = :CD_COLIGADA AND anosemestre = :NR_ANOSEMESTRE');

   filtro_curso := '';

   { Pesquisar Cursos }
   resultado_filtro := TfrmSelecionarCurso.Filtrar([bfcAnosemestre], -1, -1, nr_anosemestre);

   if resultado_filtro.filtrado then
   Begin
      filtro_curso := resultado_filtro.cd_curso;

      qryBuscaTurmas.ParamByName('CD_PLANO').AsInteger := qyPlanosCD_PLANO.AsInteger;
      qryBuscaTurmas.ParamByName('CD_COLIGADA').AsInteger := resultado_filtro.cd_coligada;
      qryBuscaTurmas.ParamByName('NR_ANOSEMESTRE').AsInteger := qyPlanosNR_ANOSEMESTRE.AsInteger;
      qryBuscaTurmas.ParamByName('CD_CURSO').AsString := filtro_curso;

      qryBuscaTurmas.open;

      while not qryBuscaTurmas.Eof do
      begin
         qyInsertPlanosTurma.ParamByName('CD_PLANO').AsInteger := qryBuscaTurmas.FieldByName('CD_PLANO').AsInteger;
         qyInsertPlanosTurma.ParamByName('CD_CURSO').AsString  := qryBuscaTurmas.FieldByName('CURSO').AsString;
         qyInsertPlanosTurma.ParamByName('CD_TURMA').AsString  := qryBuscaTurmas.FieldByName('CODIGO').AsString;
         try
            qyInsertPlanosTurma.ExecSQL;            
         except on E: Exception do
         end;
         qryBuscaTurmas.Next;      
      end;
      

      P := qyPlanos.GetBookmark;
      try
         FiltrarPlano(nr_anosemestre, cd_curso, cd_turma);
         qyPlanos.GotoBookmark(P);
      except
      end;
      FiltrarPlanosTurmas();
      pcInformacoes.ActivePage := tsTurmas;
   end;
end;

procedure TfrmPlanosNova.btnAddTurmaClick(Sender: TObject);
var
   qyInsertPlanosTurma: TUMZQuery;
   filtro_curso, filtro_turma: String;
   P: Pointer;
   resultado_filtro : TResultadoFiltroTurma;
begin
   DM.CriarConsulta(qyInsertPlanosTurma);
   qyInsertPlanosTurma.SQL.Clear();
   qyInsertPlanosTurma.SQL.Add('INSERT INTO FIN_PLANOS_TURMAS ( CD_PLANO, CD_CURSO, CD_TURMA )');
   qyInsertPlanosTurma.SQL.Add('   SELECT :CD_PLANO, curso, codigo FROM turmas');
   qyInsertPlanosTurma.SQL.Add('   WHERE curso = :CD_CURSO AND codigo = :CD_TURMA AND cd_coligada = :CD_COLIGADA AND anosemestre = :NR_ANOSEMESTRE');

   filtro_curso := '';
   filtro_turma := '';

   resultado_filtro := TfrmSelecionarTurma.Filtrar([bftAnosemestre], nr_anosemestre, -1);

   { Pesquisar Cursos }

   if resultado_filtro.filtrado then
   Begin
      filtro_curso := resultado_filtro.cd_curso;
      filtro_turma := resultado_filtro.cd_turma;

      qyInsertPlanosTurma.ParamByName('CD_PLANO').AsInteger := qyPlanosCD_PLANO.AsInteger;
      qyInsertPlanosTurma.ParamByName('CD_COLIGADA').AsInteger := resultado_filtro.cd_coligada;
      qyInsertPlanosTurma.ParamByName('NR_ANOSEMESTRE').AsInteger := qyPlanosNR_ANOSEMESTRE.AsInteger;
      qyInsertPlanosTurma.ParamByName('CD_CURSO').AsString := filtro_curso;
      qyInsertPlanosTurma.ParamByName('CD_TURMA').AsString := filtro_turma;
      
      try
         qyInsertPlanosTurma.ExecSQL;
         if (qyInsertPlanosTurma.RowsAffected <> 1) then
         begin
            Mensagem('Não foi possível vincular a turma devido a mesma não pertencer a coligada do plano.', '', MB_OK+MB_ICONEXCLAMATION, Handle);
         end;
      except on E: Exception do
         if Pos('Duplicate entry', E.Message) > 0 then
         begin
            Mensagem('Esta turma já esta vinculada ao plano de pagamento selecionado','', MB_OK+MB_ICONEXCLAMATION, Handle)
         end;
      end;
     
      P := qyPlanos.GetBookmark;
      try
         FiltrarPlano(nr_anosemestre, cd_curso, cd_turma);
         qyPlanos.GotoBookmark(P);
      except
      end;
      FiltrarPlanosTurmas();
      pcInformacoes.ActivePage := tsTurmas;
   end;
end;

procedure TfrmPlanosNova.btnAlterarClick(Sender: TObject);
begin

   if TChecarUsoColigada.Create(TPlanoPagamento.Create(qyPlanosCD_PLANO.AsInteger)).NaoPossuiPermissao() then
   begin
      Exit;   
   end;

   if pcInformacoes.ActivePage = tsDistrato then
   begin
      qyPlanos.Edit();
      edDescricao.SetFocus();
      VerificaBotoesAcoes();

      qyPlanosDistratos.Edit;
      pcInformacoes.ActivePage := tsDistrato;

   end
   else
   begin
      qyPlanos.Edit();
      edDescricao.SetFocus();
      VerificaBotoesAcoes();
   end;
end;

procedure TfrmPlanosNova.btnCalcularParcelasClick(Sender: TObject);
var
   qyAux: TUMZReadOnlyQuery;
   TipoTitulo : Integer;
   S: string;
   UltimoDia, DiaValido: Boolean;
   I, ParcIni, NumParcelas, Dia: Integer;
   Vencto, APartirDe, Temp: TDate;
begin

   // Muda o foco para o campo valor, dessa forma irá salvar algum campo que o usuário digitou, mas não saiu do campo
   // para validar o mesmo (por exemplo digitou o desconto condicional, mas não saiu do campo)
   edValor.SetFocus;

   // Verifica se a ação de movimento foi selecionada antes de gerar as parcelas (se elas tiverem desconto)
   if not verificaAcaoMovimentoDefinida then
   begin
      Exit;
   end;

   if (btnCalcularParcelas.Tag = 0) and
      (Mensagem( 'Deseja calcular o valor das parcelas?', Application.Title, MB_YESNO + MB_ICONQUESTION ) = ID_NO ) then
      Exit;

   if (qyPlanos.State in dsEditModes) then
   begin
      if (snVigencia.Checked = false) then
      begin
         qyPlanosDT_VIGENCIA_INICIO.asString := '';
         qyPlanosDT_VIGENCIA_FIM.asString := '';
         qyPlanosSN_VIGENCIA.AsInteger := 0;
      end
      else
      begin
         qyPlanosSN_VIGENCIA.AsInteger := 1;
         if ((trim(DBEdit1.Text) = '/  /') OR
             (trim(DBEdit2.Text) = '/  /')) then
         begin
            Mensagem('Por favor informe as datas de início e fim da vigência');
            Exit;
         end;

         if (StrToDate(DBEdit1.Text) >= StrToDate(DBEdit2.Text)) then
         begin
            mensagem('A data fim de vigência deve ser maior ou igual que a data de início');
            exit;
         end;
      end;
      qyPlanos.Post;
   end;

   if qyPlanosItens.State in dsEditModes then
      qyPlanosItens.Post;

   btnCalcularParcelas.Tag := 0;

   DM.CriarConsulta(qyAux);
   
   // excluir itens de pagamento antes de calcular parcelas
   qyAux.SQL.Clear();
   qyAux.SQL.Add( 'DELETE FROM FIN_PLANOS_ITENS' );
   qyAux.SQL.Add( 'WHERE CD_PLANO = :CD_PLANO' );
   qyAux.ParamByName('CD_PLANO').AsInteger := qyPlanosCD_PLANO.AsInteger;
   qyAux.ExecSQL;
   // *****************************************************

   qyAux.Close();
   qyAux.SQL.Clear();
   qyAux.SQL.Add(' SELECT cd_tipo_titulo FROM fin_config_tipos_titulo ');
   qyAux.SQL.Add(' WHERE ct_tipo_titulo = 1 AND cd_coligada_matriz = :cd_coligada AND cd_padrao = 1 AND sn_ativo = 1 ');
   qyAux.ParamByName('cd_coligada').AsInteger := DM.GetUsuarioLogado.GetColigadaLogada.Codigo;
   qyAux.Open();
   qyAux.First;

   TipoTitulo := 0;
   if ( qyAux.RecordCount > 0 ) then
   begin
      TipoTitulo := qyAux.FieldByName('cd_tipo_titulo').AsInteger
   end;

   // Se não tiver um tipo de título padrão
   if TipoTitulo = 0  then
   begin
      Mensagem('Não é possível gerar as parcelas. Vá em Cadastro >> Tipo de Títulos e defina um padrão', 'Atenção', MB_OK + MB_ICONWARNING);
      Exit;
   end;

   Screen.Cursor := crHourGlass;

   qyPlanosItens.DisableControls;


   S := DM.variavel_parametro('mensalidade_numero_parc_zero');

   if TryStrToInt(S, ParcIni) then
   begin
      if ParcIni = 1 then
      begin
         ParcIni := 2;
         NumParcelas := qyPlanosNR_PARCELAS.AsInteger + 1;
      end
      else
      begin
         ParcIni := 1;
         NumParcelas := qyPlanosNR_PARCELAS.AsInteger;
      end;
   end
   else
   begin
      ParcIni := 1;
      NumParcelas := qyPlanosNR_PARCELAS.AsInteger;
   end;

   // Inserir a Parcela Zero nos Itens de Pagamento Também!

   if qyPlanosVL_MATRICULA.AsFloat > 0 then
   begin
      qyPlanosItens.Insert();
      qyPlanosItensNR_MES.AsInteger := 0;
      qyPlanosItensNR_DIA.AsInteger := 0;
      qyPlanosItensNR_ANO.AsInteger := 0;
      qyPlanosItensNR_PARCELA.AsInteger := ParcIni - 1;
      qyPlanosItensVL_BRUTO.AsFloat := qyPlanosVL_MATRICULA.AsFloat;
      qyPlanosItensVL_DESCONTO.AsFloat := 0;
      qyPlanosItensSN_CREDITO_PARCELA.AsInteger := 0;
      qyPlanosItensVL_DESCONTO_EXTRA.AsFloat := 0;
      qyPlanosItensCD_TIPO_PARCELA.AsInteger := TipoTitulo;
      qyPlanosItens.Post();     
   end;

   APartirDe := qyPlanosDT_APARTIR.AsDateTime;

   UltimoDia := DaysPerMonth[MonthOf(APartirDe)] = DayOf(APartirDe);
   Vencto := APartirDe;
   Temp := Vencto;

   for I := ParcIni to NumParcelas do
   begin
      if UltimoDia then
      begin
         Vencto := EndOfTheMonth(Vencto);
      end
      else
      begin
         if (qyPlanosSN_DIAS_UTEIS.AsInteger = 1) {or
            ((qyPlanosSN_PULAR_SABADOS.AsInteger = 1) and
             (qyPlanosSN_PULAR_DOMINGOS.AsInteger = 1) and
             (qyPlanosSN_PULAR_FERIADOS.AsInteger = 1))} then
         begin
            Temp := EncodeDate(YearOf(Vencto), MonthOf(Vencto), 1);
            Dia := DayOf(APartirDe);

            while Dia > 0 do
            begin
               { Caso não seja feriado E não seja final de semana, decrementa a variável DIA }
               if (not DM.getFeriado(Temp)) and (not (DayOfWeek(Temp) in [1, 7])) then
               begin
                  Dec(Dia);
               end;
               if Dia > 0 then
               begin
                  Temp := IncDay(Temp);
               end;
            end;

            Vencto := Temp;
         end
         else
         begin
            Dia := DayOf(APartirDe);
            
            if Dia > DaysInMonth(Vencto) then
            begin
               Temp := EndOfTheMonth(Vencto);
            end
            else
            begin
               Temp := EncodeDate(YearOf(Vencto), MonthOf(Vencto), Dia);
            end;

            {
            DiaValido :=
               ((qyPlanosSN_PULAR_FERIADOS.AsInteger = 0) or (not DM.FindDate(Temp))) and
               ((qyPlanosSN_PULAR_SABADOS.AsInteger = 0) or (DayOfWeek(Temp) <> 6)) and
               ((qyPlanosSN_PULAR_DOMINGOS.AsInteger = 0) or (DayOfWeek(Temp) <> 7));

            }
            DiaValido :=
               (qyPlanosSN_PULAR_FERIADOS.AsInteger = 0) or
               ((qyPlanosSN_PULAR_FERIADOS.AsInteger = 1) AND (not DM.getFeriado(Temp)));

            DiaValido := DiaValido AND ((qyPlanosSN_PULAR_SABADOS.AsInteger = 0) or
               ((qyPlanosSN_PULAR_SABADOS.AsInteger = 1) AND (DayOfWeek(Temp) <> 7)));

            DiaValido := DiaValido AND ((qyPlanosSN_PULAR_DOMINGOS.AsInteger = 0) or
               ((qyPlanosSN_PULAR_DOMINGOS.AsInteger = 1) AND (DayOfWeek(Temp) <> 1)));

            while not DiaValido do
            begin
               Temp := IncDay(Temp);

               DiaValido :=
                  (qyPlanosSN_PULAR_FERIADOS.AsInteger = 0) or
                  ((qyPlanosSN_PULAR_FERIADOS.AsInteger = 1) AND (not DM.getFeriado(Temp)));

               DiaValido := DiaValido AND ((qyPlanosSN_PULAR_SABADOS.AsInteger = 0) or
               ((qyPlanosSN_PULAR_SABADOS.AsInteger = 1) AND (DayOfWeek(Temp) <> 7)));

               DiaValido := DiaValido AND ((qyPlanosSN_PULAR_DOMINGOS.AsInteger = 0) or
               ((qyPlanosSN_PULAR_DOMINGOS.AsInteger = 1) AND (DayOfWeek(Temp) <> 1)));
            end;
            Vencto := Temp
         end;
      end;

      qyPlanosItens.Insert;
      qyPlanosItensNR_MES.AsInteger := MonthOf(Vencto);
      qyPlanosItensNR_DIA.AsInteger := DayOf(Vencto);
      qyPlanosItensNR_ANO.AsInteger := YearOf(Vencto);
      qyPlanosItensNR_PARCELA.AsInteger := I;
      qyPlanosItensVL_BRUTO.AsCurrency := qyPlanosVL_COBRADO.AsCurrency;
      qyPlanosItensVL_DESCONTO.AsCurrency := qyPlanosVL_DESCONTO.AsCurrency;
      qyPlanosItensSN_CREDITO_PARCELA.AsInteger := qyPlanosSN_CREDITOS.AsInteger;
      qyPlanosItensCD_TIPO_PARCELA.AsInteger := TipoTitulo;
      qyPlanosItensVL_DESCONTO_EXTRA.AsCurrency := 0;

      if qyPlanosVL_TAXAAPOSTILA.AsCurrency > 0 then
      begin
         qyPlanosItensVL_EXTRA.AsCurrency := qyPlanosVL_TAXAAPOSTILA.AsCurrency;
      end
      else
      begin
         qyPlanosItensVL_EXTRA.AsCurrency := 0;
      end;

      Vencto := IncMonth(Vencto);
   end;

   if qyPlanosItens.State = dsInsert then
   begin
      qyPlanosItens.Post;
   end;

   qyPlanosItens.EnableControls;
   Screen.Cursor := crDefault;

   FiltrarPlanosItens();

   grdPlanos.SetFocus;
end;

procedure TfrmPlanosNova.btnCancelarClick(Sender: TObject);
begin
   if ( qyPlanos.State IN [dsInsert, dsEdit] ) then
      qyPlanos.Cancel();

   if ( qyPlanosDistratos.State IN [dsEdit] ) then
      qyPlanosDistratos.Cancel();

   VerificaBotoesAcoes();
end;

procedure TfrmPlanosNova.btnCopiarPlanoClick(Sender: TObject);
var
   cd_plano_novo: Integer;
begin
   if ( btnCancelar.Enabled ) OR ( btnSalvar.Enabled ) then
   begin
      Mensagem('É necessário salvar ou cancelar as alterações antes de prosseguir.', Application.Title, MB_OK + MB_ICONINFORMATION, Handle);
      Exit;
   end;   

   Application.CreateForm(TfrmPlanosCopiar, frmPlanosCopiar);

   frmPlanosCopiar.lbNomePlano.Caption := qyPlanosDS_PLANO.AsString;
   frmPlanosCopiar.edAnosemestre.Text := qyPlanosNR_ANOSEMESTRE.AsString;
   frmPlanosCopiar.umdtApartirDe.Date := qyPlanosDT_APARTIR.AsDateTime;

   if ( frmPlanosCopiar.ShowModal <> mrAll ) then
      Exit;

   cd_plano_novo := ClassePlanosPagamento.CopiaPlanoPagamento(
      qyPlanosCD_PLANO.AsInteger, Dm.GetUsuarioLogado.GetColigadaLogada.Codigo,
      frmPlanosCopiar.nr_anosemestre, frmPlanosCopiar.umdtApartirDe.Date,
      frmPlanosCopiar.sn_copiar_turmas, frmPlanosCopiar.sn_calcular_parcelas,
      frmPlanosCopiar.sn_copiar_itens
   );

   DM.setLog( 2006, 'Inclusao',
            IntToStr(cd_plano_novo) + ';',
            Dm.UsuarioLogado.ColigadaLogada,
            'Plano: ' + qyPlanosDS_PLANO.AsString + CHR(13) +
           'A Partir: ' + FormatDateTime('dd/mm/yyyy', frmPlanosCopiar.umdtApartirDe.Date) );

   nr_anosemestre := frmPlanosCopiar.nr_anosemestre;
   FiltrarPlano( nr_anosemestre );

   qyPlanos.Locate('CD_PLANO', cd_plano_novo, [loCaseInsensitive]);

   if ( frmPlanosCopiar.sn_calcular_parcelas ) then
   begin
      btnCalcularParcelas.Tag := 1;
      btnCalcularParcelasClick(nil);
   end;
end;

procedure TfrmPlanosNova.btnExcluirClick(Sender: TObject);
begin

   if TChecarUsoColigada.Create(TPlanoPagamento.Create(qyPlanosCD_PLANO.AsInteger)).NaoPossuiPermissao() then
   begin
      exit;   
   end;

   if Mensagem( 'Deseja realmente excluir ?', Application.Title, MB_YESNO + MB_ICONQUESTION ) = ID_YES then
   begin
      qyPlanos.Delete();
   end;
end;

procedure TfrmPlanosNova.btnFecharClick(Sender: TObject);
begin
   Close();
end;

procedure TfrmPlanosNova.btnFiltrarClick(Sender: TObject);
begin
   if( coligada_filtrada <> nil) then
   begin
      FiltrarPlano(nr_anosemestre, cd_curso, cd_turma, coligada_filtrada.Codigo, edFiltroDesc.Text );
   end
   else
   begin
      FiltrarPlano(nr_anosemestre, cd_curso, cd_turma, 0, edFiltroDesc.Text );
   end;
end;

procedure TfrmPlanosNova.btnInserirClick(Sender: TObject);
begin
   qyPlanos.Insert();
   VerificaBotoesAcoes();
   edDescricao.SetFocus;
end;

procedure TfrmPlanosNova.btnLimparClick(Sender: TObject);
begin
   cd_curso := '';
   cd_turma := '';
   coligada_filtrada := nil;
   edFiltroDesc.Text := '';
   edUnidadeEnsino.Text := '';
end;

function TfrmPlanosNova.verificaDescontoCondicionalDigitado(): Boolean;
begin
   Result := False;

   // Verifica se existe desconto condicional informado no plano
   if qyPlanosVL_DESCONTO.AsFloat > 0 then
   begin
      Result := True;
      Exit;
   end;

   // Verifica se existe desconto condicional informado nos itens do plano
   qyPlanosItens.First;
   while not qyPlanosItens.Eof do
   begin
      if qyPlanosItensVL_DESCONTO.AsFloat > 0 then
      begin
         Result := True;
         Exit;
      end;

      qyPlanosItens.Next;
   end;

end;

function TfrmPlanosNova.verificaDescontoFixoDigitado(): Boolean;
begin
   Result := False;

   // Verifica se existe desconto fixo informado nos itens do plano
   qyPlanosItens.First;
   while not qyPlanosItens.Eof do
   begin
      if qyPlanosItensVL_DESCONTO_EXTRA.AsFloat > 0 then
      begin
         Result := True;
         Exit;
      end;

      qyPlanosItens.Next;
   end;

end;

function TfrmPlanosNova.verificaAcaoMovimentoDefinida(): Boolean;
var
   utilizaDescCondicional, utilizaDescFixo : Boolean;
begin

   Result := True;

   // Se existe desconto condicional informado, deve também estar informado a ação de movimento do mesmo
   if DBLookupComboBox2.Enabled and verificaDescontoCondicionalDigitado() and not (qyPlanoscd_acao_movimento_desc_cond.AsInteger > 0) then
   begin
      Mensagem('O campo Ação de Movimento para desconto condicional deve ser informado, quando possui desconto condicional.','', MB_OK+MB_ICONEXCLAMATION, Handle);
      Result := False;
      Exit;
   end;

   // Se existe desconto fixo informado, deve também estar informado a ação de movimento da mesma
   if DBLookupComboBox1.Enabled and verificaDescontoFixoDigitado() and not (qyPlanoscd_acao_movimento_desc_fixo.AsInteger > 0) then
   begin
      Mensagem('O campo Ação de Movimento para desconto fixo deve ser informado, quando possui desconto fixo.','', MB_OK+MB_ICONEXCLAMATION, Handle);
      Result := False;
   end;

end;

procedure TfrmPlanosNova.btnSalvarClick(Sender: TObject);
begin

   Panel2.SetFocus;

   if ((snVigencia.State = cbChecked) AND
      ((qyPlanosDT_VIGENCIA_INICIO.AsDateTime = 0) OR
      (qyPlanosDT_VIGENCIA_FIM.AsDateTime = 0))) then
   begin
      Mensagem('Por favor informe as datas de início e fim da vigência');
      Exit;
   end;

   if((qyPlanosCD_TIPO_PLANO.AsInteger = 2) and (qyPlanosNR_CREDITOS_BASE.AsFloat = 0)) then
   begin
      Mensagem('A quantidade base de créditos deve ser maior que zero.','', MB_OK+MB_ICONEXCLAMATION, Handle);
      exit;
   end;

   if ( qyPlanosItens.State IN [dsInsert, dsEdit] ) then
   begin
      qyPlanosItens.Post();
   end;

   if not verificaAcaoMovimentoDefinida then
   begin
      Exit;
   end;       

   if ( qyPlanos.State IN [dsInsert, dsEdit] ) then
   begin

      if qyPlanos.State = dsEdit then
      begin
         qyPlanos.Post();
         qyPlanos.Edit;
      end;

      if snVigencia.State = cbUnchecked then
      begin
         qyPlanosDT_VIGENCIA_INICIO.asString := '';
         qyPlanosDT_VIGENCIA_FIM.asString := '';
         qyPlanosSN_VIGENCIA.AsInteger := 0;
      end;
      
      if snVigencia.State = cbChecked then
      begin
         qyPlanosSN_VIGENCIA.AsInteger := 1;
      end;

      qyPlanos.Post();
   end;

   if ( qyPlanosDistratos.State in [dsEdit] ) then
   begin
      qyPlanosDistratosSN_TIPO_PARCELA.AsInteger := rgTipoParcelas.ItemIndex;
      qyPlanosDistratos.Post();
   end;

   VerificaBotoesAcoes();
   edDescricao.SetFocus;
end;

procedure TfrmPlanosNova.CarregarSituacoesMatriculas(carregar_banco: Boolean);
var
   qyListaSituacoesMatriculas: TUMZReadOnlyQuery;
   i: Integer;
begin
   if not carregar_banco then
   begin
      for I := 0 to ckbSituacoesEstudante.Items.Count - 1 do
         ckbSituacoesEstudante.Checked[I] := False;
      Exit;
   end;
   
   DM.CriarConsulta(qyListaSituacoesMatriculas);
   ckbSituacoesEstudante.Items.Clear();

   qyListaSituacoesMatriculas.SQL.Clear();
   qyListaSituacoesMatriculas.SQL.Add('SELECT cd_situacao, ds_valor FROM situacoes WHERE cd_modulo = 1019 ORDER BY ds_valor');
   qyListaSituacoesMatriculas.Open();

   while not qyListaSituacoesMatriculas.Eof do
   begin
      i := ckbSituacoesEstudante.Items.AddObject(
               qyListaSituacoesMatriculas.FieldByName('ds_valor').AsString,
               TItemCombo.Create(
                  qyListaSituacoesMatriculas.FieldByName('cd_situacao').AsString,
                  qyListaSituacoesMatriculas.FieldByName('ds_valor').AsString
               ) );
      ckbSituacoesEstudante.Checked[i] := False;

      qyListaSituacoesMatriculas.Next();
   end; 
end;

procedure TfrmPlanosNova.CarregarTiposTitulo(carregar_banco: Boolean);
var
   qyListaTiposTitulos: TUMZReadOnlyQuery;
   i: Integer;
begin
   if not carregar_banco then
   begin
      for I := 0 to ckbContabilizarTiposTitulo.Items.Count - 1 do
         ckbContabilizarTiposTitulo.Checked[I] := False;
      Exit;
   end;

   DM.CriarConsulta(qyListaTiposTitulos);
   ckbContabilizarTiposTitulo.Items.Clear();

   qyListaTiposTitulos.SQL.Clear();
   qyListaTiposTitulos.SQL.Add('SELECT  cd_tipo_titulo, ds_tipo_titulo FROM fin_config_tipos_titulo WHERE sn_ativo = 1 AND cd_coligada_matriz = :cd_coligada ORDER BY ds_tipo_titulo');
   qyListaTiposTitulos.ParamByName('cd_coligada').AsInteger := qyPlanosCD_COLIGADA.AsInteger;
   qyListaTiposTitulos.Open();

   while not qyListaTiposTitulos.Eof do
   begin
      i := ckbContabilizarTiposTitulo.Items.AddObject(
               qyListaTiposTitulos.FieldByName('ds_tipo_titulo').AsString,
               TItemCombo.Create(
                  qyListaTiposTitulos.FieldByName('cd_tipo_titulo').AsString,
                  qyListaTiposTitulos.FieldByName('ds_tipo_titulo').AsString
               ) );
      ckbContabilizarTiposTitulo.Checked[i] := False;

      qyListaTiposTitulos.Next();
   end;                             
end;

procedure TfrmPlanosNova.CheckBox1Click(Sender: TObject);
begin
   if snVigencia.Checked = True then
   begin
      LblDtInicio.Enabled := True;
      LblDtFim.Enabled := True;
      
      DBEdit1.Enabled := True;
      dbedit2.Enabled := True;
   end
   else
   begin
      LblDtInicio.Enabled := False;
      LblDtFim.Enabled := False;
      
      DBEdit1.Enabled := False;
      dbedit2.Enabled := False;
   end;
end;

procedure TfrmPlanosNova.ckbContabilizarTiposTituloClickCheck(Sender: TObject);
var
   cd_tipo_titulo, index: Integer;
begin
   index := TCheckListBox(Sender).ItemIndex;
   cd_tipo_titulo := StrToInt(TItemCombo(TCheckListBox(Sender).Items.Objects[index]).getCodigo());

   if ( TCheckListBox(Sender).Checked[index] ) then
      AdicionaTipoTitulo( cd_tipo_titulo )
   else
      RemoveTipoTitulo( cd_tipo_titulo );
end;

procedure TfrmPlanosNova.ckbSituacoesEstudanteClickCheck(Sender: TObject);
var
   cd_situacao, index: Integer;
begin
   index := TCheckListBox(Sender).ItemIndex;
   cd_situacao := StrToInt(TItemCombo(TCheckListBox(Sender).Items.Objects[index]).getCodigo());

   if ( TCheckListBox(Sender).Checked[index] ) then
      AdicionaSituacaoMatricula( cd_situacao )
   else
      RemoveSituacaoMatricula( cd_situacao );
end;

procedure TfrmPlanosNova.clbDiasVenctoClickCheck(Sender: TObject);
begin
   if not (qyPlanos.State in dsEditModes) then
   begin
      qyPlanos.Edit;
      clbDiasVencto.Checked[clbDiasVencto.ItemIndex] :=
         not clbDiasVencto.Checked[clbDiasVencto.ItemIndex];
   end;

   if hasDiaSelecionado then
   begin
      lblDiasVencto.Font.Style := [fsBold];   
   end
   else
   begin
      lblDiasVencto.Font.Style := [];
   end;
end;

procedure TfrmPlanosNova.dsPlanosDataChange(Sender: TObject; Field: TField);
var
   S: string;
   I: Integer;
   alteraItens: boolean;
begin
   { Seleciona o Tipo de Título do Plano }
   MostraEscondeCamposTipoTitulo();

   rgTipoPlano.OnClick := nil;

   try
      case qyPlanosCD_TIPO_PLANO.AsInteger of
         1: rgTipoPlano.ItemIndex := 0;
         2: rgTipoPlano.ItemIndex := 1;
         3: rgTipoPlano.ItemIndex := 2;
      end;
   finally
      rgTipoPlano.OnClick := rgTipoPlanoClick;
      FiltrarPlanosItens();
      pcInformacoes.ActivePage := tsParcelas;
   end;

   if dsPlanos.State <> dsInsert then
   begin
      S := qyPlanosDS_DIAS_VENCTO.AsString;
      if Length(S) = 31 then
      begin
         for I := 0 to clbDiasVencto.Count - 1 do
         begin
            clbDiasVencto.Checked[I] := S[I + 1] = '1';
         end;
      end;
   end;

   alteraItens := (podeAlterarPlanosItens) OR (qyPlanos.State in [dsInsert]);

   if alteraItens then
   begin
      pnNaoPodeExcluirItens.Visible := false;
      grdParcelas.ReadOnly := false;
      btnExcluir.Enabled := true;

      //Desbloquear campos
      rgTipoPlano.Enabled := True;

      Label4.enabled := True;
      edParcelas.Enabled := True;

      lbQtdCreditosBase.Enabled := True;
      edQtdCreditosBase.Enabled := True;

      Label5.Enabled := True;
      edValor.Enabled := True;

      lbValorExtra.Enabled := True;
      edValorExtra.Enabled := True;

      Label7.Enabled := True;
      edDescCond.Enabled := True;

      Label6.Enabled := True;
      edVlParcZero.Enabled := True;

      Label8.Enabled := True;
      edDiasParcZero.Enabled := True;

      Label9.Enabled := True;
      edAPartirDe.Enabled := True;

      Label21.Enabled := True;
      DBLookupComboBox1.Enabled := True;
      Label22.Enabled := True;
      DBLookupComboBox2.Enabled := True;

      DBCheckBox1.Enabled := True;
      dbchPularSabados.Enabled := True;
      dbchPularDomingos.Enabled := True;
      dbchPularFeriados.Enabled := True;

      Label10.Enabled := True;
      edObservacoesEspeciais.Enabled := True;
   end
   else
   begin
      pnNaoPodeExcluirItens.Visible := true;
      grdParcelas.ReadOnly := true;
      btnExcluir.Enabled := false;

      //Bloquear campos
      rgTipoPlano.Enabled := False;

      Label4.enabled := false;
      edParcelas.Enabled := False;

      lbQtdCreditosBase.Enabled := False;
      edQtdCreditosBase.Enabled := False;

      Label5.Enabled := False;
      edValor.Enabled := False;

      lbValorExtra.Enabled := False;
      edValorExtra.Enabled := False;

      Label7.Enabled := False;
      edDescCond.Enabled := False;

      Label6.Enabled := False;
      edVlParcZero.Enabled := False;

      Label8.Enabled := False;
      edDiasParcZero.Enabled := False;

      Label9.Enabled := False;
      edAPartirDe.Enabled := False;

      Label21.Enabled := False;
      DBLookupComboBox1.Enabled := False;
      Label22.Enabled := False;
      DBLookupComboBox2.Enabled := False;

      DBCheckBox1.Enabled := False;
      dbchPularSabados.Enabled := False;
      dbchPularDomingos.Enabled := False;
      dbchPularFeriados.Enabled := False;

      Label10.Enabled := False;
      edObservacoesEspeciais.Enabled := False;
   end;

   btnCalcularParcelas.Enabled := alteraItens;

   FiltrarTiposTitulo();
end;

procedure TfrmPlanosNova.dsPlanosDistratosStateChange(Sender: TObject);
begin
   FiltrarPlanosDistratos(False);
   VerificaBotoesAcoes();
end;

procedure TfrmPlanosNova.dsPlanosStateChange(Sender: TObject);
var
   I: Integer;
begin
   if qyPlanos.State = dsInsert then
   begin                                
      for I := 0 to clbDiasVencto.Count - 1 do
      begin
         clbDiasVencto.Checked[I] := False;
      end;
   end;
   VerificaBotoesAcoes();
end;

procedure TfrmPlanosNova.edValorCobrancaKeyUp(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
   if (Char(Key) in ['.'] ) then
   begin
      Key := word(DecimalSeparator);
   end;

   if not ( Char(Key) IN ['0'..'9', Chr(8), Chr(9), DecimalSeparator] ) AND
      not ( (Key >= 96) AND (Key <= 105) ) then Exit;

   if not ( qyPlanosDistratos.State IN [dsEdit] ) then
      qyPlanosDistratos.Edit();   

   if ( Length(edValorCobranca.Text) = 0 ) then
   begin
      qyPlanosDistratosVL_COBRANCA.AsVariant := Null;
      qyPlanosDistratosSN_ATIVO.AsInteger := 0;
      FiltrarPlanosDistratos(False);
   end else if ( Length(edValorCobranca.Text) >= 1 ) AND not rgTipoValor.Enabled then
   begin
      qyPlanosDistratosSN_ATIVO.AsInteger := 1;
      FiltrarPlanosDistratos(False, True);
   end;
end;

procedure TfrmPlanosNova.FiltrarPlano(filtro_anosemestre: Integer; filtro_curso, filtro_turma: String; cd_coligada : Integer; desc_plano : String );
const
   SQL_PADRAO = ' SELECT fp.*, CASE WHEN fp.CD_TIPO_PLANO = 1 THEN ''Valor Fixo'' ELSE ''Por Crédito'' END AS DS_TIPO_TITULO, ';
//                '        ( SELECT COUNT(*) FROM turmas t ' +
//                '          WHERE t.anosemestre = fp.NR_ANOSEMESTRE AND t.cd_coligada = fp.CD_COLIGADA AND ' +
//                '                ( t.curso, t.codigo ) IN ( SELECT fpt.CD_CURSO, fpt.CD_TURMA FROM FIN_PLANOS_TURMAS fpt WHERE fpt.CD_PLANO = fp.CD_PLANO ) ' +
//                '        ) AS NR_TOTAL_TURMAS ' +
// ATENÇÃO: PRESTAR ATENÇÃO QUE O SELECT ACIMA, TERMINA EM "," POIS O CAMPO DA CONSTANTE ABAIXO SERÁ ADICIONADO
   SQL_PADRAO_FROM_WHERE = ' FROM FIN_PLANOS fp [$filtro_tabela_curso_turma$] ' +
                           ' WHERE 1=1 ';
   SQL_PADRAO_CAMPO_NR_TOTAL_TURMAS = ' ( SELECT COUNT(*) FROM turmas t ' +
                                      '   WHERE t.anosemestre = fp.NR_ANOSEMESTRE AND ' +
                                      '         ( t.curso, t.codigo ) IN ( ' +
                                      '            SELECT fpt.CD_CURSO, fpt.CD_TURMA FROM FIN_PLANOS_TURMAS fpt ' +
                                      '            WHERE fpt.CD_PLANO = fp.CD_PLANO ' +
                                      '         ) ' +
                                      ' ) ';

   SQL_TABELA_CURSO_TURMA = ' INNER JOIN FIN_PLANOS_TURMAS fpt ON ( fpt.CD_PLANO = fp.CD_PLANO ) ';
   SQL_BRANCO = '';

   FILTRO_NR_ANOSEMESTRE = ' AND fp.NR_ANOSEMESTRE = :NR_ANOSEMESTRE ';
   FILTRO_CD_CURSO       = ' AND fpt.CD_CURSO = :CD_CURSO ';
   FILTRO_CD_TURMA       = ' AND fpt.CD_TURMA = :CD_TURMA ';
   FILTRO_DS_PLANO       = ' AND fp.DS_PLANO LIKE :DS_PLANO   ';
   FILTRO_CD_COLIGADA_MATRIZ  = ' AND ( SELECT cast(GROUP_CONCAT(DISTINCT t.cd_coligada SEPARATOR '','') as CHAR) FROM turmas t ' +
                                      '   WHERE t.anosemestre = fp.NR_ANOSEMESTRE AND ' +
                                      '         ( t.curso, t.codigo ) IN ( ' +
                                      '            SELECT fpt.CD_CURSO, fpt.CD_TURMA FROM FIN_PLANOS_TURMAS fpt ' +
                                      '            WHERE fpt.CD_PLANO = fp.CD_PLANO ' +
                                      '         ) ' +
                                      ' ) LIKE :CD_COLIGADA_MATRIZ ';
begin
   qyPlanos.Close();
   qyPlanos.SQL.Text := SQL_PADRAO;

   if DM.db.Protocol = DB_PROTOCOL_ORACLE then
      qyPlanos.SQL.Add( 'CAST (' + SQL_PADRAO_CAMPO_NR_TOTAL_TURMAS + ' AS NUMBER(19, 0) ) AS NR_TOTAL_TURMAS' )
   else
      qyPlanos.SQL.Add( SQL_PADRAO_CAMPO_NR_TOTAL_TURMAS + ' AS NR_TOTAL_TURMAS' );

   qyPlanos.SQL.Add( SQL_PADRAO_FROM_WHERE );

   { Se for filtro de CURSO ou TURMA, adiciona a tabela }
   if ( filtro_curso <> '' ) OR ( filtro_turma <> '' ) then
      qyPlanos.SQL.Text := StringReplace(qyPlanos.SQL.Text, '[$filtro_tabela_curso_turma$]', SQL_TABELA_CURSO_TURMA, [rfReplaceAll, rfIgnoreCase])
   else
      qyPlanos.SQL.Text := StringReplace(qyPlanos.SQL.Text, '[$filtro_tabela_curso_turma$]', SQL_BRANCO, [rfReplaceAll, rfIgnoreCase]);

   qyPlanos.SQL.Text := qyPlanos.SQL.Text + Format( ' AND fp.CD_COLIGADA = %d ', [DM.GetUsuarioLogado.GetColigadaLogada.Codigo] );

   { Filtro anosemestre }
   if ( filtro_anosemestre <> 0 ) then
   begin
      qyPlanos.SQL.Add(FILTRO_NR_ANOSEMESTRE);
      qyPlanos.ParamByName('NR_ANOSEMESTRE').AsInteger := filtro_anosemestre;
   end;

   { Filtro curso }
   if ( filtro_curso <> '' ) then
   begin
      qyPlanos.SQL.Add(FILTRO_CD_CURSO);
      qyPlanos.ParamByName('CD_CURSO').AsString := filtro_curso;
   end;

   { Filtro turma }
   if ( filtro_turma <> '' ) then
   begin
      qyPlanos.SQL.Add(FILTRO_CD_TURMA);
      qyPlanos.ParamByName('CD_TURMA').AsString := filtro_turma;
   end;

   if ( cd_coligada > 0 ) then
   begin
      qyPlanos.SQL.Add(FILTRO_CD_COLIGADA_MATRIZ);
      qyPlanos.ParamByName('CD_COLIGADA_MATRIZ').AsString := '%'+inttostr(cd_coligada)+'%';
   end;

   if ( desc_plano <> '' ) then
   begin
      qyPlanos.SQL.Add(FILTRO_DS_PLANO);
      qyPlanos.ParamByName('DS_PLANO').AsString := '%'+desc_plano+'%';
   end;


   { GROUP BY quando for filtro de CURSO ou TURMA }
   if ( filtro_curso <> '' ) OR ( filtro_turma <> '' ) then
   begin
      qyPlanos.SQL.Add( 'GROUP BY fp.CD_PLANO' );
   end;

   qyplanos.SQL.Add( 'ORDER BY fp.DS_PLANO' );

   qyPlanos.Open();
   qyPlanos.First();
end;

procedure TfrmPlanosNova.FiltrarPlanosDistratos(abri_query, ativar: Boolean);
var
   qyInsereDistratos: TUMZQuery;
begin
   if ( abri_query ) AND ( qyPlanosCD_PLANO.AsInteger > 0 ) then
   begin
      qyPlanosDistratos.Close();
      qyPlanosDistratos.ParamByName('CD_PLANO').AsInteger := qyPlanosCD_PLANO.AsInteger;
      qyPlanosDistratos.Open();

      if ( qyPlanosDistratos.RecordCount = 0 ) then
      begin
         DM.CriarConsulta(qyInsereDistratos);
         qyInsereDistratos.SQL.Clear();
         qyInsereDistratos.SQL.Add('INSERT INTO FIN_PLANOS_DISTRATOS (');
         qyInsereDistratos.SQL.Add('   CD_DISTRATO, CD_PLANO');
         qyInsereDistratos.SQL.Add(') VALUES ( NULL, :CD_PLANO )');
         qyInsereDistratos.ParamByName('CD_PLANO').AsInteger := qyPlanosCD_PLANO.AsInteger;
         qyInsereDistratos.ExecSQL;

         FiltrarPlanosDistratos();
      end;
   end;

   rgTipoValor.Enabled                 := (not qyPlanosDistratosVL_COBRANCA.IsNull) OR ativar;
   edDiasVencimento.Enabled            := rgTipoValor.Enabled;
   cbTipoTitulo.Enabled                := rgTipoValor.Enabled;
   ckbSituacoesEstudante.Enabled       := rgTipoValor.Enabled;
   ckbContabilizarTiposTitulo.Enabled  := rgTipoValor.Enabled;

   MostraEscondeListaTiposTitulo();
end;

procedure TfrmPlanosNova.FiltrarPlanosItens;
begin
   qyPlanosItens.Close();
   qyPlanosItens.ParamByName('CD_PLANO').AsInteger := qyPlanosCD_PLANO.AsInteger;
   qyPlanosItens.Open();
end;

procedure TfrmPlanosNova.FiltrarPlanosTurmas;
begin
   qyPlanosTurmas.Close();
   qyPlanosTurmas.SQL.Text := 'SELECT '+
      'fpt.CD_CURSO, fpt.CD_TURMA, t.descricao AS DS_TURMA '+
   'FROM '+
      'fin_planos fp '+
      'INNER JOIN fin_planos_turmas fpt ON ( fpt.CD_PLANO = fp.CD_PLANO ) '+
      'INNER JOIN turmas t ON ( t.codigo = fpt.CD_TURMA AND t.anosemestre = fp.NR_ANOSEMESTRE) '+
   'WHERE '+
      'fp.CD_PLANO = :CD_PLANO';

   qyPlanosTurmas.SQL.Add(Format(' AND t.cd_coligada IN (%s) '+
      'ORDER BY fpt.CD_CURSO, fpt.CD_TURMA', [DM.GetUsuarioLogado.GetColigadasFilhaSelecionada]));
      
   qyPlanosTurmas.ParamByName('CD_PLANO').AsInteger := qyPlanosCD_PLANO.AsInteger;
   qyPlanosTurmas.Open();
end;

procedure TfrmPlanosNova.FiltrarSituacoesMatriculaDistrato;
var
   qyListaSituacoesMatriculasDistrato: TUMZReadOnlyQuery;
   I: Integer;
begin
   DM.CriarConsulta(qyListaSituacoesMatriculasDistrato);

   qyListaSituacoesMatriculasDistrato.SQL.Clear();
   qyListaSituacoesMatriculasDistrato.SQL.Add('SELECT * FROM fin_planos_distratos_sit_matri');
   qyListaSituacoesMatriculasDistrato.SQL.Add('WHERE CD_DISTRATO = :CD_DISTRATO');

   qyListaSituacoesMatriculasDistrato.ParamByName('CD_DISTRATO').AsInteger := qyPlanosDistratosCD_DISTRATO.AsInteger;
   qyListaSituacoesMatriculasDistrato.Open();

   CarregarSituacoesMatriculas(False);

   while not qyListaSituacoesMatriculasDistrato.Eof do
   begin
      for I := 0 to ckbSituacoesEstudante.Items.Count - 1 do
      begin
         if ( TItemCombo(ckbSituacoesEstudante.Items.Objects[I]).getCodigo() = qyListaSituacoesMatriculasDistrato.FieldByName('CD_SITUACAO').AsString ) then
         begin
            ckbSituacoesEstudante.Checked[I] := True;
            break;
         end;         
      end;

      qyListaSituacoesMatriculasDistrato.Next();
   end;       
end;

procedure TfrmPlanosNova.FiltrarTiposTitulo;
begin
   qyTiposTitulo.Close();
   qyTiposTitulo.ParamByName('cd_coligada').AsInteger := qyPlanosCD_COLIGADA.AsInteger;
   qyTiposTitulo.Open();
end;

procedure TfrmPlanosNova.FiltrarTiposTituloDistrato;
var
   qyListaTiposTituloDistrato: TUMZReadOnlyQuery;
   I: Integer;
begin
   DM.CriarConsulta(qyListaTiposTituloDistrato);

   qyListaTiposTituloDistrato.SQL.Clear();
   qyListaTiposTituloDistrato.SQL.Add('SELECT * FROM fin_planos_distratos_tipo_titu');
   qyListaTiposTituloDistrato.SQL.Add('WHERE CD_DISTRATO = :CD_DISTRATO');

   qyListaTiposTituloDistrato.ParamByName('CD_DISTRATO').AsInteger := qyPlanosDistratosCD_DISTRATO.AsInteger;
   qyListaTiposTituloDistrato.Open();

   CarregarTiposTitulo(False);

   while not qyListaTiposTituloDistrato.Eof do
   begin
      for I := 0 to ckbContabilizarTiposTitulo.Items.Count - 1 do
      begin
         if ( TItemCombo(ckbContabilizarTiposTitulo.Items.Objects[I]).getCodigo() = qyListaTiposTituloDistrato.FieldByName('CD_TIPO_TITULO').AsString ) then
         begin
            ckbContabilizarTiposTitulo.Checked[I] := True;
            break;
         end;         
      end;

      qyListaTiposTituloDistrato.Next();
   end;
end;

procedure TfrmPlanosNova.FormClose(Sender: TObject; var Action: TCloseAction);
begin
   { Fecha a query Principal }
   qyPlanos.Close();

   Action := caFree;
end;

procedure TfrmPlanosNova.FormCreate(Sender: TObject);
begin
   if ( Screen.Height < 700 ) then
   begin
      Panel4.Align := alTop;
      btnCopiarPlano.Left := btnCopiarPlano.Left - 20;

      Panel3.Height := Panel3.Height + Panel3.Height + Panel3.Height;

      pnAlinhamentoCurso.Align := alTop;
      pnAlinhamentoCurso.Height := 31;
      pnAlinhamentoTurma.Align := alClient;
      pnAlinhamentoBotoes.Align := alBottom;
      pnAlinhamentoTurma.Height := 31;
   end;
end;

procedure TfrmPlanosNova.FormDestroy(Sender: TObject);
begin
   frmPlanosNova := nil;
end;

procedure TfrmPlanosNova.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  case Key of
    VK_F1 : PrincipalForm.confSobreClick( nil );
    VK_F2 : if btnInserir.Enabled then btnInserirClick( nil );
    VK_F3 : if btnAlterar.Enabled then btnAlterarClick( nil );
    VK_F5 : if btnSalvar.Enabled then btnSalvarClick( nil );
    VK_F9 : if btnExcluir.Enabled then btnExcluirClick( nil );
    VK_F6 : if btnCancelar.Enabled then btnCancelarClick( nil );
    VK_F10 : btnCopiarPlanoClick( nil );
    VK_F11 : if btnCalcularParcelas.Enabled then btnCalcularParcelasClick( nil );             
    VK_F12 : if btnFechar.Enabled then btnFecharClick( nil );
  end;
end;

procedure TfrmPlanosNova.FormShow(Sender: TObject);
var
   alteraItens: boolean;
begin
   Label1.Visible := DM.UsaAnosemestre;
   edAnosemestre.Visible := DM.UsaAnosemestre;
   UpDown1.Visible := DM.UsaAnosemestre;

   { Todas em maiúsculas }
   DM.TodasMaiusculas(TForm(Sender));
   btnCalcularParcelas.Tag := 0;

   grdPlanos.SetFocus();

   { Carregar as Situações de Matrículas }
   CarregarSituacoesMatriculas();

   { Bloqueia os campos para aceitarem somente Números }
   edAnosemestre.OnKeyPress := SomenteNumeros;
   edParcelas.OnKeyPress := SomenteNumeros;
   edQtdCreditosBase.OnKeyPress := SomenteNumeros;
   edDiasParcZero.OnKeyPress := SomenteNumeros;
   edDiasVencimento.OnKeyPress := SomenteNumeros;

   { Bloqueia os campos para aceitarem somente Números e Separador Decimal }
   edValor.OnKeyPress := SomenteNumerosEVirgula;
   edValorExtra.OnKeyPress := SomenteNumerosEVirgula;
   edDescCond.OnKeyPress := SomenteNumerosEVirgula;
   edVlParcZero.OnKeyPress := SomenteNumerosEVirgula;
   edValorCobranca.OnKeyPress := SomenteNumerosEVirgula;

   { Aba padrão de abertura }
   pcInformacoes.ActivePage := tsParcelas;

   { Anosemestre padrão }
   nr_anosemestre := ano_semestre;

   qyAcoesDescontoCondicional.Close;
   qyAcoesDescontoCondicional.Open;

   qyAcoesDescontoFixo.Close;
   qyAcoesDescontoFixo.Open;

   { Abre a query principal da Tela, qyPlanos }
   FiltrarPlano( nr_anosemestre );

   { Carregar os Tipos de Títulos na tela de Distrato }
   CarregarTiposTitulo();

   pnNaoPodeExcluirItens.Visible := false;

   Label19.Caption := 'Não é possível realizar alterações nas parcelas, pois foi detectado que as mesmas'+
      #13+' possuem vínculo com mensalidades já geradas.';
      
   if DM.lite then
   begin
      tsDistrato.TabVisible := false;   
   end;

   alteraItens := (podeAlterarPlanosItens) OR (qyPlanos.State in [dsInsert]);

   if alteraItens then
   begin
      pnNaoPodeExcluirItens.Visible := false;
      grdParcelas.ReadOnly := false;
      btnExcluir.Enabled := true;
   end
   else
   begin
      pnNaoPodeExcluirItens.Visible := true;
      grdParcelas.ReadOnly := true;
      btnExcluir.Enabled := false;
   end;

   sbExpandeCalendario.Down := True;

   if hasDiaSelecionado then
   begin
      lblDiasVencto.Font.Style := [fsBold];
   end
   else
   begin
      lblDiasVencto.Font.Style := [];
   end;

   sbExpandeCalendarioClick(nil);
end;

function TfrmPlanosNova.getAnosemestre: Integer;
begin
   Result := -1;
   try
      if trim( edAnosemestre.Text ) <> '' then
      begin
         Result := StrToInt( edAnosemestre.Text );
      end;
   except
   end;
end;

function TfrmPlanosNova.getCurso: String;
begin
   Result := edCurso.Text;
end;

function TfrmPlanosNova.getTurma: String;
begin
   Result := edTurma.Text;
end;

procedure TfrmPlanosNova.grdParcelasColExit(Sender: TObject);
begin
   if grdParcelas.SelectedField.FieldName = dblcTipoTitulo.DataField then
      dblcTipoTitulo.Visible := False;   
end;

procedure TfrmPlanosNova.grdParcelasDrawColumnCell(Sender: TObject;
  const Rect: TRect; DataCol: Integer; Column: TColumn; State: TGridDrawState);
begin
   if gdFocused in State then
      if Column.FieldName = dblcTipoTitulo.DataField then
         with dblcTipoTitulo do
         begin
            Left := Rect.Left + grdParcelas.Left + 2;
            Top := Rect.Top + grdParcelas.Top + 2;
            Width := Rect.Right - Rect.Left;
            Width := Rect.Right - Rect.Left;
            Height := Rect.Bottom - Rect.Top;
            Visible := True;
         end;
end;

procedure TfrmPlanosNova.grdParcelasEnter(Sender: TObject);
begin
   // Se usuário tentou digitar as parcelas e o plano não está salvo, salva o plano de pagamento então
   if qyPlanos.State in [dsEdit] then
   begin
      qyPlanos.Post;
   end;
end;

procedure TfrmPlanosNova.grdParcelasKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
   if ((Shift = [ssCtrl]) and (key = vk_delete)) THEN
   begin
      if podeAlterarPlanosItens then
      begin
         if Mensagem('Deseja remover o item do Plano de Pagamento?','Confirmação', MB_ICONQUESTION+MB_YESNO, Handle) = mrYes then
         begin
            qyPlanosItens.Delete;
         end;
         abort;
      end;
   end;
end;

procedure TfrmPlanosNova.grdParcelasKeyPress(Sender: TObject; var Key: Char);
begin
   //Se for . transforma para virgula
   if(Key in['.']) then
   begin
      Key :=  ',';
   end;
   
   if Key <> #9 then
      if grdPlanos.SelectedField.FieldName = dblcTipoTitulo.DataField then
         dblcTipoTitulo.SetFocus;

   // Verifica se está digitando o desconto condicional, então deve ter informada a ação de movimento
   if (grdParcelas.SelectedField.FieldName = 'VL_DESCONTO') and not (qyPlanoscd_acao_movimento_desc_cond.AsInteger > 0) then
   begin
      Mensagem('O campo Ação de Movimento para desconto condicional deve ser informado antes de digitar os valores de desconto condicional.','', MB_OK+MB_ICONEXCLAMATION, Handle);
      Abort;
   end;

   // Verifica se está digitando o desconto fixo, então deve ter informada a ação de movimento
   if (grdParcelas.SelectedField.FieldName = 'VL_DESCONTO_EXTRA') and not (qyPlanoscd_acao_movimento_desc_fixo.AsInteger > 0) then
   begin
      Mensagem('O campo Ação de Movimento para desconto fixo deve ser informado antes de digitar os valores de desconto fixo.','', MB_OK+MB_ICONEXCLAMATION, Handle);
      Abort;
   end;

end;

procedure TfrmPlanosNova.grdPlanosDrawColumnCell(Sender: TObject;
  const Rect: TRect; DataCol: Integer; Column: TColumn; State: TGridDrawState);
begin
   if gdSelected in State then
   begin
      grdPlanos.Canvas.Brush.Color := clBlue;
      grdPlanos.Canvas.Font.Color := clWhite;
   end;

   grdPlanos.Canvas.FillRect(Rect);
   grdPlanos.DefaultDrawColumnCell(Rect, DataCol, Column, State);
end;

function TfrmPlanosNova.hasDiaSelecionado: Boolean;
var
   i: Integer;
begin
   Result := False;

   for I := 0 to clbDiasVencto.Count - 1 do
   begin
      if clbDiasVencto.Checked[i] then
      begin
         Result := True;
         Exit;
      end;
   end;
end;

procedure TfrmPlanosNova.MostraEscondeCamposTipoTitulo;
begin
   lbQtdCreditosBase.Enabled  := (qyPlanosCD_TIPO_PLANO.AsInteger = 2) AND (qyPlanosSN_CREDITOS.AsInteger = 1);
   lbValorExtra.Enabled       := (qyPlanosCD_TIPO_PLANO.AsInteger = 1) AND (qyPlanosSN_CREDITOS.AsInteger = 0);

   edQtdCreditosBase.Enabled  := lbQtdCreditosBase.Enabled;
   edValorExtra.Enabled       := lbValorExtra.Enabled;
end;

procedure TfrmPlanosNova.MostraEscondeListaTiposTitulo;
begin
   lbContabilizarTiposTitulo.Enabled  := (qyPlanosDistratosCD_TIPO_VALOR.AsInteger = 2) AND (qyPlanosDistratosSN_ATIVO.AsInteger = 1);
   ckbContabilizarTiposTitulo.Enabled := lbContabilizarTiposTitulo.Enabled;
end;

procedure TfrmPlanosNova.pcInformacoesChange(Sender: TObject);
begin
   case pcInformacoes.ActivePageIndex of
      1: begin // Turmas
         FiltrarPlanosTurmas();
      end;
      2: begin // Distratos
         FiltrarPlanosDistratos();
         FiltrarTiposTitulo();
      end;      
   end;
end;

procedure TfrmPlanosNova.pcInformacoesChanging(Sender: TObject;
  var AllowChange: Boolean);
begin
   AllowChange := (TPageControl(Sender).Tag = 1);

   if not AllowChange then
   begin
      Mensagem('É necessário salvar ou cancelar as alterações antes de prosseguir.', Application.Title, MB_OK + MB_ICONINFORMATION, Handle);
   end;   
end;

{Realiza uma verificação nas mensalidades
se não existe nenhuma mensalidade vinculada.}
function TfrmPlanosNova.podeAlterarPlanosItens: Boolean;
var
   posicao: Pointer;
   condicao: String;
   qryVerificaMensalidades: TUMZQuery;
begin
   Result := true;

   qyPlanosItens.DisableControls;

   if qyPlanosItens.RecordCount > 0 then
   begin

      posicao := qyPlanosItens.GetBookmark;

      DM.CriarConsulta(qryVerificaMensalidades);

      with qryVerificaMensalidades do
      begin
         SQL.Text := ' SELECT '+
	            'count(cd_mensalidade) AS qtd '+
            'FROM '+
      	      'mensalidades '+
            'WHERE '+
	            'cd_item_plano IN ( '+
		            'SELECT '+
			            'CD_PLANO_ITEM '+
		            'FROM '+
			            'fin_planos_itens '+
		            'WHERE '+
			            'cd_plano = :cd_plano '+
            ' ) ';

         ParamByName('cd_plano').AsInteger := qyPlanosCD_PLANO.AsInteger;

         Open;

         if FieldByName('qtd').AsInteger > 0 then
         begin
            Result := false;
         end;
      end;

      if qyPlanosItens.BookmarkValid(posicao) then
         qyPlanosItens.GotoBookmark(posicao);
   end;

   qyPlanosItens.EnableControls;
end;

procedure TfrmPlanosNova.qyPlanosAfterPost(DataSet: TDataSet);
var
   sDescricao: String;
begin
   sDescricao := qyPlanosDS_PLANO.AsString;
   qyPlanos.Refresh;
   qyPlanos.Locate('ds_plano',sDescricao,[]);
end;
procedure TfrmPlanosNova.qyPlanosBeforeDelete(DataSet: TDataSet);
begin
   DM.setLog( 2006, 'Exclusao'
              , qyPlanosCD_PLANO.AsString + ';'
              , qyPlanosCD_COLIGADA.AsInteger
              , 'Plano: ' + qyPlanosDS_PLANO.AsString + CHR(13) +
                'A Partir: ' + FormatDateTime('dd/mm/yyyy', qyPlanosDT_APARTIR.AsDateTime) );
end;

procedure TfrmPlanosNova.qyPlanosBeforePost(DataSet: TDataSet);
var
   I: Integer;
   S: string;
begin
   S := '0000000000000000000000000000000';

   for I := 0 to clbDiasVencto.Count - 1 do
   begin
      if clbDiasVencto.Checked[I] then
      begin
         S[I + 1] := '1'
      end
      else
      begin
         S[I + 1] := '0';
      end;
   end;

   qyPlanosDS_DIAS_VENCTO.AsString := S;

   if qyPlanos.State = dsInsert then
   begin

     DM.setLog( 2006, 'Inclusao'
              , qyPlanosCD_PLANO.AsString + ';'
              , qyPlanosCD_COLIGADA.AsInteger
              , 'Plano: ' + qyPlanosDS_PLANO.AsString + CHR(13) +
                'A Partir: ' + FormatDateTime('dd/mm/yyyy', qyPlanosDT_APARTIR.AsDateTime) );

  end else begin

   DM.setLog( 2006, 'Alteracao'
              , qyPlanosCD_PLANO.AsString + ';'
              , qyPlanosCD_COLIGADA.AsInteger
              , 'Plano: ' + qyPlanosDS_PLANO.AsString + CHR(13) +
                'A Partir: ' + FormatDateTime('dd/mm/yyyy', qyPlanosDT_APARTIR.AsDateTime) );

  end;
end;

procedure TfrmPlanosNova.qyPlanosCalcFields(DataSet: TDataSet);
begin
   if qyPlanosSN_CREDITOS.AsInteger = 1 then
   begin
      qyPlanosDS_TIPO_PLANO.AsString := 'Por crédito';
   end
   else
   begin
      qyPlanosDS_TIPO_PLANO.AsString := 'Valor fixo';
   end;
end;

procedure TfrmPlanosNova.qyPlanosDistratosAfterOpen(DataSet: TDataSet);
begin
   rgTipoValor.OnClick := nil;

   try
      case qyPlanosDistratosCD_TIPO_VALOR.AsInteger of
         1: rgTipoValor.ItemIndex := 0;
         2: rgTipoValor.ItemIndex := 1;
      end;
   finally
      rgTipoValor.OnClick := rgTipoValorClick;
   end;
   rgTipoParcelas.ItemIndex := qyPlanosDistratosSN_TIPO_PARCELA.AsInteger;

   FiltrarTiposTituloDistrato();
   FiltrarSituacoesMatriculaDistrato();
end;

procedure TfrmPlanosNova.qyPlanosDistratosBeforePost(DataSet: TDataSet);
begin
   if ( qyPlanosDistratosCD_TIPO_TITULO.AsInteger < 1 ) then
   begin
      Mensagem( 'Você precisa selecionar um tipo de título para o Distrato.' );
      cbTipoTitulo.SetFocus();
      Abort();
   end;
end;

procedure TfrmPlanosNova.qyPlanosItensBeforeDelete(DataSet: TDataSet);
begin
   DM.setLog( 2006, 'Exclusao'
           , qyPlanosItensCD_PLANO.AsString + ';' +
             qyPlanosItensNR_PARCELA.AsString + ';' +
             qyPlanosItensNR_MES.AsString + ';' + qyPlanosItensNR_ANO.AsString + ';'
           , qyPlanosCD_COLIGADA.AsInteger
           , 'Plano: ' + qyPlanosDS_PLANO.AsString + CHR(13) +
             'Total: ' + FloatToStrF(qyPlanosItensVL_TOTAL.AsCurrency, ffNumber, 12, 2) + CHR(13) +
             'Cr.Min: ' + qyPlanosItensNR_CREDITOS_MINIMOS.AsString );
end;

procedure TfrmPlanosNova.qyPlanosItensBeforePost(DataSet: TDataSet);
begin
   qyPlanosItensCD_PLANO.AsInteger := qyPlanosCD_PLANO.AsInteger;

   qyPlanosItensVL_TOTAL.AsFloat := ( qyPlanosItensVL_BRUTO.AsFloat -
                                      qyPlanosItensVL_DESCONTO.AsFloat +
                                      qyPlanosItensVL_EXTRA.AsFloat -
                                      qyPlanosItensVL_DESCONTO_EXTRA.AsFloat );

  if qyPlanosItens.State = dsInsert then begin

     DM.setLog( 2006, 'Inclusao'
              , qyPlanosItensCD_PLANO.AsString + ';' + qyPlanosItensNR_PARCELA.AsString + ';' + qyPlanosItensNR_MES.AsString + ';' + qyPlanosItensNR_ANO.AsString + ';'
              , qyPlanosCD_COLIGADA.AsInteger
              , 'Plano: ' + qyPlanosDS_PLANO.AsString + CHR(13) +
                'Total: ' + FloatToStrF(qyPlanosItensVL_TOTAL.AsCurrency, ffNumber, 12, 2) + CHR(13) +
                'Cr.Min: ' + qyPlanosItensNR_CREDITOS_MINIMOS.AsString );

  end else begin

     DM.setLog( 2006, 'Alteracao'
              , qyPlanosItensCD_PLANO.AsString + ';' + qyPlanosItensNR_PARCELA.AsString + ';' + qyPlanosItensNR_MES.AsString + ';'+ qyPlanosItensNR_ANO.AsString + ';'
              , qyPlanosCD_COLIGADA.AsInteger
              , 'Plano: ' + qyPlanosDS_PLANO.AsString + CHR(13) +
                'Total: ' + FloatToStrF(qyPlanosItensVL_TOTAL.AsCurrency, ffNumber, 12, 2) + CHR(13) +
                'Cr.Min: ' + qyPlanosItensNR_CREDITOS_MINIMOS.AsString );

  end;
end;

procedure TfrmPlanosNova.qyPlanosItensDS_CREDITO_PARCELASetText(Sender: TField;
  const Text: string);
const
   SMsgValidacao = 'Os seguintes valores são permitidos:'#13#13'S: habilitar por crédito'#13'N: desabilitar por crédito'#13'F: valor fixo';
begin
   if qyPlanosItens.State in dsEditModes then
   begin
      qyPlanosItens.DisableControls;
      if AnsiUpperCase(Text) = 'S' then
      begin
         qyPlanosItensSN_CREDITO_PARCELA.AsInteger := 1;
         qyPlanosItensDS_CREDITO_PARCELA.AsString := AnsiUpperCase(Text);
      end
      else if AnsiUpperCase(Text) = 'N' then
      begin
         qyPlanosItensSN_CREDITO_PARCELA.AsInteger := 0;
         qyPlanosItensDS_CREDITO_PARCELA.AsString := AnsiUpperCase(Text);
      end
      else if AnsiUpperCase(Text) = 'F' then
      begin
         qyPlanosItensSN_CREDITO_PARCELA.AsInteger := 2;
         qyPlanosItensDS_CREDITO_PARCELA.AsString := AnsiUpperCase(Text);
      end
      else
      begin
         MessageDlg(SMsgValidacao, mtInformation, [mbOK], -1);
      end;
      qyPlanosItens.EnableControls;
   end;
end;

procedure TfrmPlanosNova.qyPlanosItensDS_DIVISIVELSetText(Sender: TField;
  const Text: string);
begin
   if qyPlanosItens.State in dsEditModes then
   begin
      qyPlanosItens.DisableControls;
      if AnsiUpperCase(Text) = 'S' then
      begin
         qyPlanosItensSN_DIVISIVEL.AsInteger := 1;
         qyPlanosItensDS_DIVISIVEL.AsString := AnsiUpperCase(Text);
      end
      else if AnsiUpperCase(Text) = 'N' then
      begin
         qyPlanosItensSN_DIVISIVEL.AsInteger := 0;
         qyPlanosItensDS_DIVISIVEL.AsString := AnsiUpperCase(Text);
      end
      else
      begin
         MessageDlg('Informe "S" para habilitar ou "N" para desabilitar', mtInformation, [mbOK], -1);
      end;
      qyPlanosItens.EnableControls;
   end;
end;

procedure TfrmPlanosNova.qyPlanosNewRecord(DataSet: TDataSet);
begin
   dsPlanos.OnDataChange := nil;

   try
      qyPlanosCD_TIPO_PLANO.AsInteger := 1;
      qyPlanosSN_CREDITOS.AsInteger := 0;
      qyPlanosNR_ANOSEMESTRE.AsInteger := nr_anosemestre;
      qyPlanosNR_MAX_DISCIPLINAS.AsInteger := 99;
      qyPlanosSN_DIAS_UTEIS.AsInteger := 0;
      qyPlanosSN_PULAR_SABADOS.AsInteger := 0;
      qyPlanosSN_PULAR_DOMINGOS.AsInteger := 0;
      qyPlanosSN_PULAR_FERIADOS.AsInteger := 0;
      qyPlanosCD_COLIGADA.AsInteger := DM.GetUsuarioLogado.GetColigadaLogada.Codigo;
   finally
      dsPlanos.OnDataChange := dsPlanosDataChange;
   end;

   rgTipoPlano.ItemIndex := 0;

   FiltrarPlanosItens();
   MostraEscondeCamposTipoTitulo();
end;

procedure TfrmPlanosNova.qyTiposTituloAfterOpen(DataSet: TDataSet);
var
   SavePoint: TBookmark;
   DropDownWidth, ItemWidth: Integer;
begin
   DropDownWidth := dblcTipoTitulo.Width;

   qyTiposTitulo.DisableControls;
   SavePoint := qyTiposTitulo.GetBookmark;

   qyTiposTitulo.First;
   while not qyTiposTitulo.Eof do
   begin
      ItemWidth := Canvas.TextWidth(qyTiposTitulods_tipo_titulo.AsString) + 22;
      DropDownWidth := Max(DropDownWidth, ItemWidth);
      qyTiposTitulo.Next;
   end;

   dblcTipoTitulo.DropDownWidth := DropDownWidth;

   qyTiposTitulo.GotoBookmark(SavePoint);
   qyTiposTitulo.EnableControls;
end;

procedure TfrmPlanosNova.RemoveSituacaoMatricula(cd_situacao: Integer);
var
   qyDeleteSituacaoMatricula: TUMZQuery;
begin
   DM.CriarConsulta(qyDeleteSituacaoMatricula);

   qyDeleteSituacaoMatricula.SQL.Clear();
   qyDeleteSituacaoMatricula.SQL.Add('DELETE FROM FIN_PLANOS_DISTRATOS_SIT_MATRI');
   qyDeleteSituacaoMatricula.SQL.Add('WHERE CD_DISTRATO = :CD_DISTRATO AND CD_SITUACAO = :CD_SITUACAO');

   qyDeleteSituacaoMatricula.ParamByName('CD_DISTRATO').AsInteger := qyPlanosDistratosCD_DISTRATO.AsInteger;
   qyDeleteSituacaoMatricula.ParamByName('CD_SITUACAO').AsInteger := cd_situacao;

   qyDeleteSituacaoMatricula.ExecSQL();
end;

procedure TfrmPlanosNova.RemoveTipoTitulo(cd_tipo_titulo: Integer);
var
   qyDeleteTipoTitulo: TUMZQuery;
begin
   DM.CriarConsulta(qyDeleteTipoTitulo);

   qyDeleteTipoTitulo.SQL.Clear();
   qyDeleteTipoTitulo.SQL.Add('DELETE FROM FIN_PLANOS_DISTRATOS_TIPO_TITU');
   qyDeleteTipoTitulo.SQL.Add('WHERE CD_DISTRATO = :CD_DISTRATO AND CD_TIPO_TITULO = :CD_TIPO_TITULO');

   qyDeleteTipoTitulo.ParamByName('CD_DISTRATO').AsInteger := qyPlanosDistratosCD_DISTRATO.AsInteger;   qyDeleteTipoTitulo.ParamByName('CD_TIPO_TITULO').AsInteger := cd_tipo_titulo;
   qyDeleteTipoTitulo.ParamByName('CD_TIPO_TITULO').AsInteger := cd_tipo_titulo;

   qyDeleteTipoTitulo.ExecSQL();
end;

procedure TfrmPlanosNova.rgTipoParcelasClick(Sender: TObject);
begin
   if not ( qyPlanosDistratos.State IN [dsEdit] ) then
      qyPlanosDistratos.Edit();

   if not rgTipoValor.Enabled then
   begin
      qyPlanosDistratosSN_ATIVO.AsInteger := 1;
      FiltrarPlanosDistratos(False, True);
   end;
end;

procedure TfrmPlanosNova.rgTipoPlanoClick(Sender: TObject);
begin
   if not ( qyPlanos.State IN [dsInsert, dsEdit] ) then
   begin

      rgTipoPlano.OnClick := nil;

      try
         if ( rgTipoPlano.ItemIndex = 0 ) then
            rgTipoPlano.ItemIndex := 1
         else
            rgTipoPlano.ItemIndex := 0;         
      finally
         rgTipoPlano.OnClick := rgTipoPlanoClick;
      end;

      Abort;
   end;

   case rgTipoPlano.ItemIndex of
      0: begin
         qyPlanosCD_TIPO_PLANO.AsInteger := 1;
         qyPlanosSN_CREDITOS.AsInteger := 0;
      end;
      1: begin
         qyPlanosCD_TIPO_PLANO.AsInteger := 2;
         qyPlanosSN_CREDITOS.AsInteger := 1;
      end;
      2: begin
         qyPlanosCD_TIPO_PLANO.AsInteger := 3;
         qyPlanosSN_CREDITOS.AsInteger := 0;
      end;
   end;

   MostraEscondeCamposTipoTitulo();  
end;

procedure TfrmPlanosNova.rgTipoValorClick(Sender: TObject);
begin
   if not ( qyPlanosDistratos.State IN [dsInsert, dsEdit] ) then
   begin

      rgTipoValor.OnClick := nil;

      try
         if ( rgTipoValor.ItemIndex = 0 ) then
         begin
            rgTipoValor.ItemIndex := 1;
         end
         else
         begin
            rgTipoValor.ItemIndex := 0;
         end;
      finally
         rgTipoValor.OnClick := rgTipoValorClick;
      end;

      Abort;
   end;

   case rgTipoValor.ItemIndex of
      0: begin
         qyPlanosDistratosCD_TIPO_VALOR.AsInteger := 1;
      end;
      1: begin
         qyPlanosDistratosCD_TIPO_VALOR.AsInteger := 2;
      end;
   end;

   MostraEscondeListaTiposTitulo();
end;

procedure TfrmPlanosNova.tspeClick(Sender: TObject);
var
   I: Integer;
begin
   if not (qyPlanos.State in dsEditModes) then
   begin
      qyPlanos.Edit;
   end;
   for I := 0 to clbDiasVencto.Count - 1 do
   begin
      clbDiasVencto.Checked[I] := False;
   end;
end;

procedure TfrmPlanosNova.sbExpandeCalendarioClick(Sender: TObject);
begin
   if pnCalendario.Tag = 1 then
   begin
      pnCalendario.Visible := True;
      Panel2.Height := 397;
      pnCalendario.Tag := 0;
   end
   else
   begin
      pnCalendario.Visible := False;
      Panel2.Height := 307;
      pnCalendario.Tag := 1;
   end;
end;

procedure TfrmPlanosNova.sbFiltroCursoClick(Sender: TObject);
var
   resultado_filtro : TResultadoFiltroCurso;
begin
   { Pesquisar Cursos }
   if coligada_filtrada <> nil then
   begin
      resultado_filtro := TfrmSelecionarCurso.Filtrar([],coligada_filtrada.Codigo);
   end else begin
      resultado_filtro := TfrmSelecionarCurso.Filtrar([]);
   end;

   if resultado_filtro.filtrado then
   begin
      cd_curso := resultado_filtro.cd_curso;

      if (resultado_filtro.nr_anosemestre <> StrToInt(edAnosemestre.text)) then
      begin
         nr_anosemestre := resultado_filtro.nr_anosemestre;
      end;

   end;
end;

procedure TfrmPlanosNova.sbFiltroTurmaClick(Sender: TObject);
var
   resultado_filtro : TResultadoFiltroTurma;
begin
   { Pesquisar Turmas }

   if coligada_filtrada <> nil then
   begin
      resultado_filtro := TfrmSelecionarTurma.Filtrar([],-1,coligada_filtrada.Codigo);
   end else begin
      resultado_filtro := TfrmSelecionarTurma.Filtrar([]);
   end;

   if not resultado_filtro.filtrado then  Exit;

   cd_curso := resultado_filtro.cd_curso;
   cd_turma := resultado_filtro.cd_turma;

   if (resultado_filtro.nr_anosemestre <> StrToInt(edAnosemestre.text)) then
   begin
      nr_anosemestre := resultado_filtro.nr_anosemestre;
   end;

end;

procedure TfrmPlanosNova.sbSelDiasClick(Sender: TObject);
var
   I: Integer;
begin
   if not (qyPlanos.State in dsEditModes) then
   begin
      qyPlanos.Edit;
   end;
   for I := 0 to clbDiasVencto.Count - 1 do
   begin
      clbDiasVencto.Checked[I] := True;
   end;
end;

procedure TfrmPlanosNova.sbSelecionaUnidadeEnsinoClick(Sender: TObject);
begin
   if TfrmSelecionarColigada.ShowModal() then
   begin
      coligada_filtrada := TfrmSelecionarColigada.getResultado();
      edUnidadeEnsino.Text := coligada_filtrada.Nome;
   end;
end;

procedure TfrmPlanosNova.setAnosemestre(const Value: Integer);
begin
   edAnosemestre.Text := IntToStr( Value );
end;

procedure TfrmPlanosNova.setCurso(const Value: String);
begin
   edCurso.Text := Value;
end;

procedure TfrmPlanosNova.setTurma(const Value: String);
begin
   edTurma.Text := Value;
end;

procedure TfrmPlanosNova.snVigenciaClick(Sender: TObject);
begin
   if snVigencia.State = cbGrayed then
   begin
      snvigencia.State := cbUnchecked;
   end;

   if snVigencia.Checked = True then
   begin
      LblDtInicio.Enabled := True;
      LblDtFim.Enabled := True;

      DBEdit1.Enabled := True;
      DBEdit2.Enabled := True;
   end
   else
   begin
      LblDtInicio.Enabled := False;
      LblDtFim.Enabled := False;

      DBEdit1.Enabled := False;
      DBEdit2.Enabled := False;
   end;
end;

procedure TfrmPlanosNova.SomenteNumeros(Sender: TObject; var Key: Char);
begin
   if not ( Key IN ['0'..'9', Chr(8), Chr(9)] ) then Key := #0;
end;

procedure TfrmPlanosNova.SomenteNumerosEVirgula(Sender: TObject; var Key: Char);
begin
   if (Char(Key) in ['.'] ) then
   begin
      Key := (DecimalSeparator);
   end;
   
   if not ( Key IN ['0'..'9', Chr(8), Chr(9), DecimalSeparator] ) then Key := #0;
end;

procedure TfrmPlanosNova.ToolButton5Click(Sender: TObject);
begin
   //Limpa linhas selecinadas da grid de vinculados
   grdTurmas.SelectedRows.Clear;

   //Utilizada o "DataSet" (conjunto de dados da grid)
   with qyPlanosTurmas do
   begin
      //Desativa os controles
      DisableControls;

      //Seleciona o primeiro registro
      First;

      try
         //Enquanto tiver registros
          while not EOF do
          begin
            //Seleciona o registro atual (que está varrendo)
            grdTurmas.SelectedRows.CurrentRowSelected := true;
            //Passa para o próximo
            Next;
          end;
      finally
         //Ativa os controles
         EnableControls;
      end;
   end;
end;

procedure TfrmPlanosNova.ToolButton6Click(Sender: TObject);
var
   qyDeletePlanosTurmas: TUMZQuery;
   i: Integer;
   P: Pointer;
begin
   DM.CriarConsulta(qyDeletePlanosTurmas);

   qyDeletePlanosTurmas.SQL.Clear();
   qyDeletePlanosTurmas.SQL.Add('DELETE FROM FIN_PLANOS_TURMAS');
   qyDeletePlanosTurmas.SQL.Add('WHERE CD_PLANO = :CD_PLANO AND CD_CURSO = :CD_CURSO AND CD_TURMA = :CD_TURMA');

   for I := 0 to grdTurmas.SelectedRows.Count - 1 do
   begin
      qyPlanosTurmas.GotoBookmark(pointer(grdTurmas.SelectedRows.Items[I]));

      qyDeletePlanosTurmas.ParamByName('CD_PLANO').AsInteger := qyPlanosCD_PLANO.AsInteger;
      qyDeletePlanosTurmas.ParamByName('CD_CURSO').AsString := qyPlanosTurmasCD_CURSO.AsString;
      qyDeletePlanosTurmas.ParamByName('CD_TURMA').AsString := qyPlanosTurmasCD_TURMA.AsString;

      qyDeletePlanosTurmas.ExecSQL;
   end;

   P := qyPlanos.GetBookmark;
   try
      FiltrarPlano(nr_anosemestre, cd_curso, cd_turma);
      qyPlanos.GotoBookmark(P);
   except
   end;
   FiltrarPlanosTurmas();
   pcInformacoes.ActivePage := tsTurmas;
end;

procedure TfrmPlanosNova.UpDown1Click(Sender: TObject; Button: TUDBtnType);
begin
   if qyPlanos.State in [dsInsert, dsEdit] then Exit;

   if Button = btNext then
   begin
      nr_anosemestre := StrToInt( DM.incrementar_ano_semestre( IntToStr( nr_anosemestre ) ) );
   end else begin
      nr_anosemestre := StrToInt( DM.decrementar_ano_semestre( IntToStr( nr_anosemestre ) ) );
   end;

   FiltrarPlano( nr_anosemestre );
   CarregarTiposTitulo();
end;

procedure TfrmPlanosNova.VerificaBotoesAcoes;
var
   alteraItens: Boolean;
begin
   btnInserir.Enabled := ( qyPlanos.State IN [dsBrowse] ) AND not ( qyPlanosDistratos.State IN [dsEdit] );
   btnAlterar.Enabled := ( qyPlanos.State IN [dsBrowse] ) AND not ( qyPlanosDistratos.State IN [dsEdit] );

   if qyPlanosItens.State <> dsInactive then
   begin
      alteraItens := (podeAlterarPlanosItens) OR (qyPlanos.State in [dsInsert]);
   end
   else
   begin
      alteraItens := True;
   end;

   if alteraItens then
   begin
      btnExcluir.Enabled := ( qyPlanos.State IN [dsBrowse] ) AND not ( qyPlanosDistratos.State IN [dsEdit] );
   end
   else
   begin
      btnExcluir.Enabled := false;
   end;

   if ( qyPlanos.State IN [dsInsert, dsEdit] ) then
   begin
      pcInformacoes.ActivePage := tsParcelas;
      pcInformacoes.Tag := 0;
   end
   else if ( qyPlanosDistratos.State IN [ dsInsert, dsEdit ] ) then
   begin
      pcInformacoes.ActivePage := tsDistrato;
      pcInformacoes.Tag := 0;
   end else begin
      pcInformacoes.Tag := 1;
   end;

   btnSalvar.Enabled := ( qyPlanos.State IN [dsInsert, dsEdit] ) OR ( qyPlanosDistratos.State IN [dsEdit] );
   btnCancelar.Enabled := ( qyPlanos.State IN [dsInsert, dsEdit] ) OR ( qyPlanosDistratos.State IN [dsEdit] );

   grdPlanos.DataSource := nil;
   grdPlanos.Enabled := not btnSalvar.Enabled;
   grdPlanos.DataSource := dsPlanos;
   grdPlanos.Repaint();

   edAnosemestre.Enabled := not ( qyPlanos.State IN [dsInsert, dsEdit] ) AND not ( qyPlanosDistratos.State IN [dsEdit] );
   UpDown1.Enabled := edAnosemestre.Enabled;
end;

end.
