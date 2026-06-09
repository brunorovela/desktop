unit uFExportacaoDadosIncluirAlunos;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, StdCtrls, Buttons, ImgList, ComCtrls, ToolWin, UMComboBox,
  Grids, DB, DBTables, DBGrids, DBClient, DBCtrls, MidasLib, ZAbstractRODataset,
  ZAbstractDataset, UZDataset;

const
   SEPARADOR = '_UNI_';
   SEPARADOR_VALORES = '=';

   SITUACAO_NAO_EXPORTADO = 0;
   SITUACAO_EXPORTADO = 1;

type
   AcaoMarcaDesmarca = (amdMarcar, amdDesmarcar);

type
  TfExportacaoDadosIncluirAlunos = class(TForm)
    paCabecalho: TPanel;
    pnMarginLeft: TPanel;
    pnMarginRight: TPanel;
    ToolBar1: TToolBar;
    ToolButton1: TToolButton;
    btnSalvar: TToolButton;
    ToolButton2: TToolButton;
    btnFechar: TToolButton;
    ToolButton4: TToolButton;
    ilToolBar: TImageList;
    ToolButton3: TToolButton;
    btnMarcarTodos: TToolButton;
    btnDesmarcarTodos: TToolButton;
    Panel1: TPanel;
    pnFiltros: TPanel;
    lbCurso: TLabel;
    lbTurma: TLabel;
    lbAluno: TLabel;
    sbBuscaCurso: TSpeedButton;
    sbBuscaTurma: TSpeedButton;
    sbBuscaAluno: TSpeedButton;
    edCurso: TEdit;
    edTurma: TEdit;
    edAluno: TEdit;
    btnFiltrar: TBitBtn;
    btnLimpar: TBitBtn;
    Bevel2: TBevel;
    Panel2: TPanel;
    Label3: TLabel;
    Panel3: TPanel;
    dtpMatriculasAtivas: TDateTimePicker;
    ckbMatriculasAtivas: TCheckBox;
    sbSelecionarColuna: TSpeedButton;
    grAlunos: TDBGrid;
    dsAlunos: TDataSource;
    cdsAlunos: TClientDataSet;
    cdsAlunossn_selecionado: TIntegerField;
    cdsAlunoscd_pessoa: TIntegerField;
    cdsAlunosnm_pessoa: TStringField;
    cdsAlunoscd_turma: TStringField;
    cdsAlunoscd_curso: TStringField;
    cdsAlunosnr_anosemestre: TIntegerField;
    cdsAlunosds_situacao_curso: TStringField;
    lbSituacaoCurso: TLabel;
    cbSituacoesCurso: TUMComboBox;
    cdsAlunosnr_carga_horaria: TFloatField;
    qyAlunos: TUMZQuery;
    qyAlunoscd_pessoa: TIntegerField;
    qyAlunosnr_anosemestre: TSmallintField;
    qyAlunosnm_pessoa: TStringField;
    qyAlunoscd_turma: TStringField;
    qyAlunoscd_curso: TStringField;
    qyAlunosnr_carga_horaria: TFloatField;
    qyAlunoscd_situacao_curso: TLargeintField;
    qySituacoes: TUMZQuery;
    qySituacoescd_situacao: TIntegerField;
    qySituacoesds_valor: TStringField;
    qyAlunosds_situacao_curso: TStringField;
    qyAlunossn_selecionado: TLargeintField;
    qyAlunosselecionado: TStringField;
    cdsAlunosnr_anosemestre_formatado: TStringField;
    qyAlunosnr_anosemestre_formatado: TStringField;
    btnSituacoes: TButton;
    qyAlunosds_situacao: TStringField;
    cdsAlunosds_situacao: TStringField;
    procedure btnSituacoesClick(Sender: TObject);
    procedure qyAlunosCalcFields(DataSet: TDataSet);
    procedure FormShow(Sender: TObject);
    procedure sbBuscaAlunoClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure btnDesmarcarTodosClick(Sender: TObject);
    procedure btnMarcarTodosClick(Sender: TObject);
    procedure grAlunosKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure grAlunosCellClick(Column: TColumn);
    procedure grAlunosDrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumn; State: TGridDrawState);
    procedure FormCreate(Sender: TObject);
    procedure sbSelecionarColunaClick(Sender: TObject);
    procedure btnFiltrarClick(Sender: TObject);
    procedure btnSalvarClick(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure btnFecharClick(Sender: TObject);
    procedure ckbMatriculasAtivasClick(Sender: TObject);
    procedure sbBuscaTurmaClick(Sender: TObject);
    procedure sbBuscaCursoClick(Sender: TObject);
    procedure btnLimparClick(Sender: TObject);
  private
    { Private declarations }
    FArraySelecionados, FArraySituacoesMatriculas: TStringList;
    FProcesso, FAnosemestre: Integer;
    FIsProcessoENADE, FProcessoAnosemestre: Boolean;
    procedure setFiltroSituacoesMatriculas(const Value: TStringList);

    function getSituacaoCurso: Integer;
    procedure setSituacaoCurso(const Value: Integer);
    function IsSelecionado(Valor: Boolean): Integer;
    function getAluno: Integer;
    procedure setAluno(const Value: Integer);
    function getCurso: String;
    function getTurma: String;
    procedure setCurso(const Value: String);
    procedure setTurma(const Value: String);

    // Filtrar
    procedure Filtrar(const sn_filtrar: Boolean = True);
    // Zerar Filtros
    procedure ZerarFiltros();
    // Zerar Grid de Alunos
    procedure ZerarGridAlunos();

    // Carregar Grid de alunos();
    procedure CarregarGridAlunos(var lista_alunos: TUMZQuery);
    // Seleciona aluno
    procedure SelecionarAluno();

    // Salva os alunos no processo
    procedure SalvarAlunos();
    // Verifica se o aluno já está no Processo
    function JaEstaNoProcesso(const cd_turma: String; const nr_anosemestre, cd_pessoa: Integer): Boolean;
    // Altera o aluno no processo
    procedure AlterarPessoaProcesso(const cd_turma: String; const nr_anosemestre, cd_pessoa: Integer; const sn_selecionado: Boolean);
    // Inclui o aluno no processo
    procedure IncluirPessoaProcesso(const cd_turma: String; const nr_anosemestre, cd_pessoa: Integer; const sn_selecionado: Boolean); 

    // Marca/Desmarca alunos
    procedure MarcaDesmarcaAlunos( Acao: AcaoMarcaDesmarca );

    // Mostra/Esconde os campos de Carga horária
    procedure HideShowCH();

    // Função responsável por carregar a combo de Situações do aluno no Curso
    procedure CarregarSituacoesCurso();

    property Processo: Integer read FProcesso write FProcesso;
    property IsProcessoENADE: Boolean read FIsProcessoENADE write FIsProcessoENADE;
    property ProcessoUsaAnosemestre: Boolean read FProcessoAnosemestre write FProcessoAnosemestre;
    property Anosemestre: Integer read FAnosemestre write FAnosemestre;
    property Curso: String read getCurso write setCurso;
    property Turma: String read getTurma write setTurma;
    property Aluno: Integer read getAluno write setAluno;
    property SituacaoCurso: Integer read getSituacaoCurso write setSituacaoCurso;
    property FiltroSituacoesMatriculas: TStringList read FArraySituacoesMatriculas write setFiltroSituacoesMatriculas;

    property IS_SELECIONADO[Valor: Boolean]: Integer read IsSelecionado;
  public
    { Public declarations }
    procedure IncluirAlunosProcesso(const cd_processo, nr_anosemestre: Integer;
      const cd_curso, cd_turma: String; const cd_pessoa: Integer; const processoEnade, processoAnosemestre: Boolean);
    procedure RemoverAlunoProcesso(const cd_processo, nr_anosemestre: Integer;
      const cd_turma: String; const cd_pessoa: Integer);
  end;

var
  fExportacaoDadosIncluirAlunos: TfExportacaoDadosIncluirAlunos;

implementation

uses uFSelecionarCurso, General, uFSelecionarTurma, uDM, uCamposPlanilhas, Main, uFSelecionarPessoa,
  uItemCombo, uFFiltroSituacoesMatriculas;

{$R *.dfm}

{ TfExportacaoDadosIncluirAlunos }

procedure TfExportacaoDadosIncluirAlunos.AlterarPessoaProcesso(
  const cd_turma: String; const nr_anosemestre, cd_pessoa: Integer;
  const sn_selecionado: Boolean);
const
   SQL_ALTERAR_ALUNO = ' UPDATE expo_processo_pessoas ' +
                       ' SET sn_selecionado = :sn_selecionado, ' +
                       '     vl_ch = GET_PERCCH_CURSADA(cd_pessoa, cd_turma, nr_anosemestre), ' +
                       '     cd_situacao_curso = GET_SITUACAO_CURSO_ALUNO(cd_processo, cd_pessoa, cd_turma, nr_anosemestre) ' +
                       ' WHERE cd_processo = :cd_processo AND ' +
                       '       nr_anosemestre = :nr_anosemestre AND ' +
                       '       cd_turma = :cd_turma AND ' +
                       '       cd_pessoa = :cd_pessoa ';

   SQL_ALTERAR_ALUNO_SEM_CH = ' UPDATE expo_processo_pessoas ' +
                       ' SET sn_selecionado = :sn_selecionado, ' +
                       '     vl_ch = 0, ' +
                       '     cd_situacao_curso = 0 ' +
                       ' WHERE cd_processo = :cd_processo AND ' +
                       '       nr_anosemestre = :nr_anosemestre AND ' +
                       '       cd_turma = :cd_turma AND ' +
                       '       cd_pessoa = :cd_pessoa ';
var
   qyAlterarAlunoProcesso: TUMZQuery;
begin
   DM.CriarConsulta(qyAlterarAlunoProcesso);

   with qyAlterarAlunoProcesso do
   begin
      Close();
      SQL.Clear();

      if IsProcessoENADE then
         SQL.Add(SQL_ALTERAR_ALUNO)
      ELSE
         SQL.Add(SQL_ALTERAR_ALUNO_SEM_CH);


      // Campo a ser alterado
      ParamByName('sn_selecionado').AsInteger := IS_SELECIONADO[sn_selecionado];

      // Condições
      ParamByName('cd_processo').AsInteger := Processo;
      ParamByName('nr_anosemestre').AsInteger := nr_anosemestre;
      ParamByName('cd_turma').AsString := cd_turma;
      ParamByName('cd_pessoa').AsInteger := cd_pessoa;

      ExecSQL();
   end;
end;

procedure TfExportacaoDadosIncluirAlunos.btnDesmarcarTodosClick(
  Sender: TObject);
begin
   MarcaDesmarcaAlunos(amdDesmarcar);
end;

procedure TfExportacaoDadosIncluirAlunos.btnFecharClick(Sender: TObject);
begin
   Close();
end;

procedure TfExportacaoDadosIncluirAlunos.btnFiltrarClick(Sender: TObject);
const
   SQL_MENSAGEM_ATENCAO = 'Selecione pelo menos um filtro.';
begin
   // Se não for colocado nenhum filtro, mostra aviso para o usuário
   // informando de que o processo poderá demorar muitos minutos
   if (Curso = '') AND (Turma = '') AND (Aluno = 0) AND not (ckbMatriculasAtivas.Checked) then
   begin
      Mensagem(SQL_MENSAGEM_ATENCAO, 'Atenção', MB_OK + MB_ICONWARNING, Handle);
      Exit;
   end;      

   Filtrar(True);
end;

procedure TfExportacaoDadosIncluirAlunos.btnLimparClick(Sender: TObject);
begin
   ZerarFiltros();

   Filtrar(False);
end;

procedure TfExportacaoDadosIncluirAlunos.btnMarcarTodosClick(Sender: TObject);
begin
   MarcaDesmarcaAlunos(amdMarcar);
end;

procedure TfExportacaoDadosIncluirAlunos.btnSalvarClick(Sender: TObject);
begin
   SalvarAlunos();

   if (Mensagem('Continuar incluindo alunos?', 'Continuar..', MB_YESNO + MB_ICONQUESTION, Handle) <> mrYes) then
   begin
      btnFecharClick(nil);
      Exit;
   end;  

   Filtrar(true);
end;

procedure TfExportacaoDadosIncluirAlunos.btnSituacoesClick(Sender: TObject);
begin
   if frmFiltroSituacoesMatriculas = nil then
      Application.CreateForm(TfrmFiltroSituacoesMatriculas, frmFiltroSituacoesMatriculas);

   frmFiltroSituacoesMatriculas.SetSituacoesMatriculas(FiltroSituacoesMatriculas);
   frmFiltroSituacoesMatriculas.ShowModal();

   if frmFiltroSituacoesMatriculas.Filtrar then
   begin
      FiltroSituacoesMatriculas := frmFiltroSituacoesMatriculas.GetSituacoesMatriculas();
   end;   

   FreeAndNil(frmFiltroSituacoesMatriculas);
end;

procedure TfExportacaoDadosIncluirAlunos.CarregarGridAlunos(var lista_alunos: TUMZQuery);
var
   Campo: Integer;
   ChavePadrao: String;
begin
   lista_alunos.First();

   while not lista_alunos.Eof do
   begin
      cdsAlunos.Append;

      ChavePadrao := trim(lista_alunos.FieldByName('nr_anosemestre').AsString) + SEPARADOR +
                     trim(lista_alunos.FieldByName('cd_turma').AsString) + SEPARADOR +
                     trim(lista_alunos.FieldByName('cd_pessoa').AsString);

      FArraySelecionados.Values[ChavePadrao] := lista_alunos.FieldByName('selecionado').AsString;

      for Campo := 0 to cdsAlunos.FieldCount - 1 do
      begin
         cdsAlunos.FieldByName(cdsAlunos.Fields[Campo].FieldName).Value := lista_alunos.FieldByName(cdsAlunos.Fields[Campo].FieldName).Value;
      end;

      cdsAlunos.Post();
      lista_alunos.Next();
   end;

   cdsAlunos.First();   
end;

procedure TfExportacaoDadosIncluirAlunos.CarregarSituacoesCurso;
const
   SQL_SITUACOES_CURSO = 'SELECT cd_situacao, ds_valor FROM situacoes WHERE cd_modulo = 1081';
var
   qySituacoesCurso: TUMZQuery;
begin
   DM.CriarConsulta(qySituacoesCurso);

   cbSituacoesCurso.Items.Clear();

   with qySituacoesCurso do
   begin
      Close();
      SQL.Clear();

      SQL.Add( SQL_SITUACOES_CURSO );

      Open();

      while not Eof do
      begin
         cbSituacoesCurso.AddItem( FieldByName('ds_valor').AsString,
                              TItemCombo.Create( FieldByName('cd_situacao').AsString,
                                                 FieldByName('ds_valor').AsString ) );

         Next();
      end;
   end;
end;

procedure TfExportacaoDadosIncluirAlunos.ckbMatriculasAtivasClick(
  Sender: TObject);
begin
   dtpMatriculasAtivas.Enabled := ckbMatriculasAtivas.Checked;   
end;

procedure TfExportacaoDadosIncluirAlunos.Filtrar(const sn_filtrar: Boolean);
const
   SQL_FILTRO_ALUNOS =
      ' SELECT CAST(0 AS SIGNED) AS sn_selecionado, p.cd_pessoa, m.anosemestre AS nr_anosemestre, ' +
      '        p.nm_pessoa, m.turma AS cd_turma, m.curso AS cd_curso, s.ds_situacao, ' +
      '        GET_PERCCH_CURSADA(p.cd_pessoa, m.turma, m.anosemestre) AS nr_carga_horaria, ' +
      '        CAST(CASE WHEN epp.sn_selecionado = 0 THEN 0 ' +
      '             WHEN epp.sn_selecionado = 1 THEN 1 ' +
      '             ELSE -1 ' +
      '        END AS CHAR) AS selecionado, ' +
      '        CAST( GET_SITUACAO_CURSO_ALUNO(:cd_processo, m.codigoaluno, m.turma, m.anosemestre) AS UNSIGNED ) AS cd_situacao_curso ' +
      ' FROM matriculas m ' +
      '      INNER JOIN pessoas p ON (p.cd_pessoa = m.codigoaluno) ' +
      '      INNER JOIN situacao s ON (s.cd_situacao = m.situacao) ' +
      '      LEFT JOIN expo_processo_pessoas epp ON ( ' +
      '         epp.cd_turma = m.turma AND epp.cd_pessoa = p.cd_pessoa AND ' +
      '         epp.nr_anosemestre = m.anosemestre AND epp.cd_processo = :cd_processo ' +
      '      ) ' +
      ' WHERE 1=1 ';
   SQL_FILTRO_ALUNOS_SEM_CH =
      ' SELECT CAST(0 AS SIGNED) AS sn_selecionado, p.cd_pessoa, m.anosemestre AS nr_anosemestre, ' +
      '        p.nm_pessoa, m.turma AS cd_turma, m.curso AS cd_curso, s.ds_situacao, ' +
      '        CAST(CASE WHEN epp.sn_selecionado = 0 THEN 0 ' +
      '             WHEN epp.sn_selecionado = 1 THEN 1 ' +
      '             ELSE -1 ' +
      '        END AS CHAR) AS selecionado ' +
      ' FROM matriculas m ' +
      '      INNER JOIN pessoas p ON (p.cd_pessoa = m.codigoaluno) ' +
      '      INNER JOIN situacao s ON (s.cd_situacao = m.situacao) ' +
      '      LEFT JOIN expo_processo_pessoas epp ON ( ' +
      '         epp.cd_turma = m.turma AND epp.cd_pessoa = p.cd_pessoa AND ' +
      '         epp.nr_anosemestre = m.anosemestre AND epp.cd_processo = :cd_processo ' +
      '      ) ' +
      ' WHERE 1=1 ';
   SQL_FILTRO_ALUNOS_GRUPO =
      'GROUP BY m.codigoaluno, m.anosemestre, m.curso, m.turma';
   SQL_FILTRO_ALUNOS_ORDEM =
      'ORDER BY p.nm_pessoa, m.curso, m.turma';
var
   strAuxSituacoes, strAuxSeparador: String;
   I: Integer;
begin
   // Fechamos o ClientDataSet
   ZerarGridAlunos();

   // Se não vamos filtrar, então damos o Exit pois o DataSet já está sendo fechado acima por padrão.
   if not sn_filtrar then
   begin
      Exit;
   end;

//   DM.CriarConsulta(qyAlunos);


   with qyAlunos do
   begin
      Close();
      SQL.Clear();

      // SELECT Padrão
      if IsProcessoENADE then      
         SQL.Add(SQL_FILTRO_ALUNOS)
      else
         SQL.Add(SQL_FILTRO_ALUNOS_SEM_CH);

      { Filtros definidos pelo usuário na tela }

      // Filtro de Curso
      if (Curso <> '') AND (Anosemestre <> 0) then
      begin
         if ( ProcessoUsaAnosemestre ) then
            SQL.Add('AND m.anosemestre = :nr_anosemestre')
         else
            SQL.Add('AND LEFT(m.anosemestre, 4) = :nr_anosemestre');
         
         SQL.Add('AND m.curso = :cd_curso');

         ParamByName('nr_anosemestre').AsInteger := Anosemestre;
         ParamByName('cd_curso').AsString := Curso;
      end;

      // Filtro de Turma
      if (Turma <> '') then
      begin
         SQL.Add('AND m.turma = :cd_turma');
         ParamByName('cd_turma').AsString := Turma;
      end;

      // Filtro de Aluno
      if (Aluno <> 0) then
      begin
         SQL.Add('AND m.codigoaluno = :cd_pessoa');
         ParamByName('cd_pessoa').AsInteger := Aluno;
      end;

      // Filtro da Situação do Aluno no Curso
      if (SituacaoCurso > -1) then
      begin
         SQL.Add('AND GET_SITUACAO_CURSO_ALUNO(:cd_processo, m.codigoaluno, m.turma, m.anosemestre) = :cd_situacao_curso');
         ParamByName('cd_situacao_curso').AsInteger := SituacaoCurso;
      end;
      
      // Filtro de Data
      if (ckbMatriculasAtivas.Checked) then
      begin
         SQL.Add('AND m.dataemissao <= ' + QuotedStr(formatDateTime('yyyy-mm-dd', dtpMatriculasAtivas.DateTime)));
      end;

      if ( FiltroSituacoesMatriculas.Count > 0 ) then
      begin
         strAuxSeparador := '';

         for I := 0 to FiltroSituacoesMatriculas.Count - 1 do
         begin
            strAuxSituacoes := strAuxSituacoes + strAuxSeparador +
                   TItemCombo(FiltroSituacoesMatriculas.Objects[I]).getCodigo();
            strAuxSeparador := ', ';
         end;

         SQL.Add('AND m.situacao IN ( ' + strAuxSituacoes + ' )');
      end;

      // Filtro padrão
      ParamByName('cd_processo').AsInteger := Processo;

      // Grupo padrão
      SQL.Add(SQL_FILTRO_ALUNOS_GRUPO);

      // Ordem padrão
      SQL.Add(SQL_FILTRO_ALUNOS_ORDEM);

      Open();

      cdsAlunos.Open();
      CarregarGridAlunos(qyAlunos);
   end;
end;

procedure TfExportacaoDadosIncluirAlunos.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin             
   ZerarGridAlunos();
   ZerarFiltros();
end;

procedure TfExportacaoDadosIncluirAlunos.FormCreate(Sender: TObject);
begin
   // Criamos o DataSet no ClientDataSet
   cdsAlunos.CreateDataSet();
   FArraySituacoesMatriculas := TStringList.Create;
   CarregarSituacoesCurso();
end;

procedure TfExportacaoDadosIncluirAlunos.FormKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
   case Key of
      VK_F5: btnSalvarClick(nil);
      VK_F6: btnFecharClick(nil);
   end;
end;

procedure TfExportacaoDadosIncluirAlunos.FormShow(Sender: TObject);
begin
   dtpMatriculasAtivas.DateTime := Now;
   FiltroSituacoesMatriculas := TStringList.Create();
   HideShowCH();
end;

function TfExportacaoDadosIncluirAlunos.getAluno: Integer;
begin
   Result := 0;

   if trim(edAluno.Text) <> '' then
      Result := StrToInt(edAluno.Text);
end;

function TfExportacaoDadosIncluirAlunos.getCurso: String;
begin
   Result := edCurso.Text;
end;

function TfExportacaoDadosIncluirAlunos.getSituacaoCurso: Integer;
begin
   Result := -1;

   if cbSituacoesCurso.ItemIndex > -1 then
      Result := StrToInt(TItemCombo(cbSituacoesCurso.Items.Objects[cbSituacoesCurso.ItemIndex]).getCodigo());
end;

function TfExportacaoDadosIncluirAlunos.getTurma: String;
begin
   Result := edTurma.Text;
end;

procedure TfExportacaoDadosIncluirAlunos.grAlunosCellClick(Column: TColumn);
begin
   // Permitimos a seleção do aluno, somente quando clicado na coluna da checkbox
   if Column.FieldName = 'sn_selecionado' then
      SelecionarAluno();
end;

procedure TfExportacaoDadosIncluirAlunos.grAlunosDrawColumnCell(Sender: TObject;
  const Rect: TRect; DataCol: Integer; Column: TColumn; State: TGridDrawState);
var
   ChavePadrao: String;
   Checado: Integer;
   R: TRect;
begin
   if (Column.FieldName = 'sn_selecionado') then
   begin
      ChavePadrao := trim(IntToStr(cdsAlunosnr_anosemestre.Value)) + SEPARADOR +
                     trim(cdsAlunoscd_turma.Value) + SEPARADOR +
                     trim(IntToStr(cdsAlunoscd_pessoa.Value));

      if FArraySelecionados.Values[ChavePadrao] = '' then
         Exit;

      grAlunos.Canvas.FillRect(Rect);

      if (StrToInt(FArraySelecionados.Values[ChavePadrao]) = 1) then
         Checado := DFCS_CHECKED
      else if (StrToInt(FArraySelecionados.Values[ChavePadrao]) = 0) then
         Checado := 0
      else if (StrToInt(FArraySelecionados.Values[ChavePadrao]) = -1) then
         Checado := DFCS_INACTIVE
      else
         Checado := 0;

      R := Rect;

      InflateRect(R, -2, -2);
      DrawFrameControl(grAlunos.Canvas.Handle, R, DFC_BUTTON, DFCS_BUTTONCHECK or Checado);
   end;
end;

procedure TfExportacaoDadosIncluirAlunos.grAlunosKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
   case Key of
      VK_SPACE: SelecionarAluno();      
   end;
end;

procedure TfExportacaoDadosIncluirAlunos.HideShowCH;
var
   cdsAux: TClientDataSet;
   qyAux: TUMZQuery;
begin
   if not IsProcessoENADE then
   begin
      pnFiltros.Height := 32;
      btnFiltrar.Top := 6;
      btnLimpar.Top := 6; 
      btnFiltrar.Left := 634;
      btnLimpar.Left := 702;
      cdsAux := nil;
      qyAux := nil;
   end else begin
      pnFiltros.Height := 62;
      btnFiltrar.Top := 32;
      btnLimpar.Top := 32;
      btnFiltrar.Left := 548;
      btnLimpar.Left := 616;
      cdsAux := cdsAlunos;
      qyAux := qyAlunos;
   end;

   cdsAlunosds_situacao_curso.SetParentComponent(cdsAux);
   cdsAlunosnr_carga_horaria.SetParentComponent(cdsAux);

   qyAlunosnr_carga_horaria.SetParentComponent(qyAux);
   qyAlunoscd_situacao_curso.SetParentComponent(qyAux);
   qyAlunosds_situacao_curso.SetParentComponent(qyAux);

   ckbMatriculasAtivas.Visible := IsProcessoENADE;
   dtpMatriculasAtivas.Visible := IsProcessoENADE;
   cbSituacoesCurso.Visible := IsProcessoENADE;

   grAlunos.Columns[5].Visible := IsProcessoENADE;
   grAlunos.Columns[6].Visible := IsProcessoENADE;
end;

procedure TfExportacaoDadosIncluirAlunos.IncluirAlunosProcesso(
  const cd_processo, nr_anosemestre: Integer; const cd_curso, cd_turma: String;
  const cd_pessoa: Integer; const processoEnade, processoAnosemestre: Boolean);
begin
   Filtrar(False);
   Processo := cd_processo;
   Anosemestre := nr_anosemestre;
   Curso := cd_curso;
   Turma := cd_turma;
   Aluno := cd_pessoa;
   IsProcessoENADE := processoEnade;
   ProcessoUsaAnosemestre := processoAnosemestre;

   Self.ShowModal();
end;

procedure TfExportacaoDadosIncluirAlunos.IncluirPessoaProcesso(
  const cd_turma: String; const nr_anosemestre, cd_pessoa: Integer;
  const sn_selecionado: Boolean);
const
   SQL_INSERIR_ALUNO = ' INSERT INTO expo_processo_pessoas ' +
                       '    (cd_processo, cd_pessoa, cd_turma, nr_anosemestre, cd_situacao, sn_selecionado, cd_situacao_curso, vl_ch) ' +
                       ' VALUES ' +
                       '    (:cd_processo, :cd_pessoa, :cd_turma, :nr_anosemestre, :cd_situacao, :sn_selecionado, GET_SITUACAO_CURSO_ALUNO(:cd_processo, :cd_pessoa, :cd_turma, :nr_anosemestre), GET_PERCCH_CURSADA(:cd_pessoa, :cd_turma, :nr_anosemestre)) ';

   SQL_INSERIR_ALUNO_SEM_CH = ' INSERT INTO expo_processo_pessoas ' +
                       '    (cd_processo, cd_pessoa, cd_turma, nr_anosemestre, cd_situacao, sn_selecionado, cd_situacao_curso, vl_ch) ' +
                       ' VALUES ' +
                       '    (:cd_processo, :cd_pessoa, :cd_turma, :nr_anosemestre, :cd_situacao, :sn_selecionado, 0, 0) ';

var
   qyIncluirAlunoProcesso: TUMZQuery;
begin
   DM.CriarConsulta(qyIncluirAlunoProcesso);

   with qyIncluirAlunoProcesso do
   begin
      Close();
      SQL.Clear();

      if IsProcessoENADE then
         SQL.Add(SQL_INSERIR_ALUNO)
      ELSE
         SQL.Add(SQL_INSERIR_ALUNO_SEM_CH);

      ParamByName('cd_processo').AsInteger := Processo;
      ParamByName('cd_pessoa').AsInteger := cd_pessoa;
      ParamByName('cd_turma').AsString := cd_turma;
      ParamByName('nr_anosemestre').AsInteger := nr_anosemestre;
      ParamByName('cd_situacao').AsInteger := SITUACAO_NAO_EXPORTADO;
      ParamByName('sn_selecionado').AsInteger := IS_SELECIONADO[sn_selecionado];

      ExecSQL();
   end;
end;

function TfExportacaoDadosIncluirAlunos.IsSelecionado(Valor: Boolean): Integer;
begin
   if Valor then
      Result := 1
   else
      Result := 0;   
end;

function TfExportacaoDadosIncluirAlunos.JaEstaNoProcesso(const cd_turma: String;
  const nr_anosemestre, cd_pessoa: Integer): Boolean;
const
   SQL_ALUNO_NO_PROCESSO = ' SELECT COUNT(cd_processo) AS registros ' +
                           ' FROM expo_processo_pessoas ' +
                           ' WHERE cd_processo = :cd_processo AND ' +
                           '       nr_anosemestre = :nr_anosemestre AND ' +
                           '       cd_turma = :cd_turma AND ' +
                           '       cd_pessoa = :cd_pessoa ';
var
   qyVerificaAlunoNoProcesso: TUMZQuery;
begin
   DM.CriarConsulta(qyVerificaAlunoNoProcesso);

   with qyVerificaAlunoNoProcesso do
   begin
      Close();
      SQL.Clear();

      SQL.Add(SQL_ALUNO_NO_PROCESSO);

      ParamByName('cd_processo').AsInteger := Processo;
      ParamByName('nr_anosemestre').AsInteger := nr_anosemestre;
      ParamByName('cd_turma').AsString := cd_turma;
      ParamByName('cd_pessoa').AsInteger := cd_pessoa;

      Open();      
   end;

   if qyVerificaAlunoNoProcesso.FieldByName('registros').AsInteger = 1 then
   begin
      Result := True;
   end
   else
   begin
      Result := False;
   end;
end;

procedure TfExportacaoDadosIncluirAlunos.MarcaDesmarcaAlunos(
  Acao: AcaoMarcaDesmarca);
var
   I: Integer;
begin
   for I := 0 to FArraySelecionados.Count - 1 do
   begin
      if Acao = amdMarcar then
         FArraySelecionados.ValueFromIndex[I] := '1'
      else if Acao = amdDesmarcar then
         FArraySelecionados.ValueFromIndex[I] := '0';              
   end;

   grAlunos.Repaint;      
end;

procedure TfExportacaoDadosIncluirAlunos.qyAlunosCalcFields(DataSet: TDataSet);
begin
   qyAlunosnr_anosemestre_formatado.AsString :=
      Copy( qyAlunosnr_anosemestre.AsString, 1, 4 ) + '/' +
      Copy( qyAlunosnr_anosemestre.AsString, 5, Length(qyAlunosnr_anosemestre.AsString) );
end;

procedure TfExportacaoDadosIncluirAlunos.RemoverAlunoProcesso(const cd_processo,
  nr_anosemestre: Integer; const cd_turma: String; const cd_pessoa: Integer);
begin
   Processo := cd_processo;

   AlterarPessoaProcesso(cd_turma, nr_anosemestre, cd_pessoa, False);

   ZerarGridAlunos();
   ZerarFiltros();
end;

procedure TfExportacaoDadosIncluirAlunos.SalvarAlunos;
var
   I, CodigoAluno, AnosemestreAluno: Integer;
   TurmaAluno, aux: String;
   AlunoSelecionado: Boolean;
   ArrInformacoessAluno: TStringList;
begin
   ArrInformacoessAluno := TStringList.Create();

   for I := 0 to FArraySelecionados.Count - 1 do
   begin
      ArrInformacoessAluno.Clear();

      // Retorna:
      //    0: Anosemestre
      //    1: Turma
      //    2: CodigoAluno=Selecionado
      SplitString(FArraySelecionados[I], SEPARADOR, ArrInformacoessAluno);

      // Pegamos a turma do aluno, e o restante da string de valores
      AnosemestreAluno := StrToInt(ArrInformacoessAluno[0]);
      TurmaAluno := ArrInformacoessAluno[1];
      aux := ArrInformacoessAluno[2];

      ArrInformacoessAluno.Clear();

      // Retorna:
      //    0: CodigoAluno
      //    1: Selecionado
      SplitString(aux, SEPARADOR_VALORES, ArrInformacoessAluno);

      // Agora pegamos o Código do Aluno e se foi selecionado ou não
      CodigoAluno := StrToInt(ArrInformacoessAluno[0]);
      AlunoSelecionado := (StrToInt(ArrInformacoessAluno[1]) = 1);

      // Editamos o aluno no processo
      if JaEstaNoProcesso(TurmaAluno, AnosemestreAluno, CodigoAluno) then
      begin
         AlterarPessoaProcesso(TurmaAluno, AnosemestreAluno, CodigoAluno, AlunoSelecionado);
      end
      else
      begin
         IncluirPessoaProcesso(TurmaAluno, AnosemestreAluno, CodigoAluno, AlunoSelecionado);
      end;
   end;

   Mensagem('Alterações de Alunos no Processo concluída!', Application.Title, MB_OK + MB_ICONINFORMATION, Handle);     
end;

procedure TfExportacaoDadosIncluirAlunos.sbBuscaAlunoClick(Sender: TObject);
var
   resultado_filtro : TResultadoFiltroPessoa;
begin
   resultado_filtro := TfrmSelecionarPessoa.Filtrar([], afpEstudante);

   if resultado_filtro.filtrado then
   begin
       edAluno.Text := IntToStr(resultado_filtro.cd_pessoa);
   end;
end;

procedure TfExportacaoDadosIncluirAlunos.sbBuscaCursoClick(Sender: TObject);
var
   resultado_filtro : TResultadoFiltroCurso;
begin
   { Buscar Curso }
   if ProcessoUsaAnosemestre then
      resultado_filtro := TfrmSelecionarCurso.Filtrar([])
   else
      resultado_filtro := TfrmSelecionarCurso.Filtrar([bfcSomenteAno]);

   if resultado_filtro.filtrado then
   begin
      Anosemestre := resultado_filtro.nr_anosemestre;
      Curso := resultado_filtro.cd_curso;
   end;
end;

procedure TfExportacaoDadosIncluirAlunos.sbBuscaTurmaClick(Sender: TObject);
var
   resultado_filtro : TResultadoFiltroTurma;
   filtro_anosemestre : Integer;
begin
   if (Anosemestre > 0) then
      filtro_anosemestre := Anosemestre
   else
      filtro_anosemestre := ano_semestre;

   { Pesquisar Turma }
   if ProcessoUsaAnosemestre then
      resultado_filtro := TfrmSelecionarTurma.Filtrar([], filtro_anosemestre, -1, -1, Curso)
   else
      resultado_filtro := TfrmSelecionarTurma.Filtrar([bftSomenteAno], filtro_anosemestre, -1, -1, Curso);

   if not resultado_filtro.filtrado then Exit;

   Anosemestre := resultado_filtro.nr_anosemestre;
   Curso := resultado_filtro.cd_curso;
   Turma := resultado_filtro.cd_turma;
end;

procedure TfExportacaoDadosIncluirAlunos.sbSelecionarColunaClick(
  Sender: TObject);
begin
   Application.CreateForm(TfrmSelColunas, frmSelColunas);
   frmSelColunas.SelecionaColunas(grAlunos, 'planilha_alunos_exportacao_campos');
end;

procedure TfExportacaoDadosIncluirAlunos.SelecionarAluno;
var
   ChavePadrao: String;
begin
   if (cdsAlunoscd_turma.Value = '') AND (cdsAlunoscd_pessoa.Value = 0) then
      Exit;

    ChavePadrao := trim(IntToStr(cdsAlunosnr_anosemestre.Value)) + SEPARADOR +
                   trim(cdsAlunoscd_turma.Value) + SEPARADOR +
                   trim(IntToStr(cdsAlunoscd_pessoa.Value));

   if (StrToInt(FArraySelecionados.Values[ChavePadrao]) = -1) OR ((StrToInt(FArraySelecionados.Values[ChavePadrao]) = 0)) then
      FArraySelecionados.Values[ChavePadrao] := '1'
   else
      FArraySelecionados.Values[ChavePadrao] := '0';

   grAlunos.Repaint;
end;

procedure TfExportacaoDadosIncluirAlunos.setAluno(const Value: Integer);
begin
   if Value = 0 then
      edAluno.Text := ''
   else
      edAluno.Text := IntToStr(Value);
end;

procedure TfExportacaoDadosIncluirAlunos.setCurso(const Value: String);
begin
   edCurso.Text := Value;
end;

procedure TfExportacaoDadosIncluirAlunos.setFiltroSituacoesMatriculas(
  const Value: TStringList);
begin
   FArraySituacoesMatriculas := Value;
end;

procedure TfExportacaoDadosIncluirAlunos.setSituacaoCurso(const Value: Integer);
var
   I: Integer;
begin
   if Value > -1 then
   begin
      for I := 0 to cbSituacoesCurso.Items.Count - 1 do
      begin
         if StrToInt(TItemCombo(cbSituacoesCurso.Items.Objects[cbSituacoesCurso.ItemIndex]).getCodigo()) = Value then
         begin
            cbSituacoesCurso.ItemIndex := I;
            break;
         end;
      end;
   end
   else
      cbSituacoesCurso.ItemIndex := Value;
end;

procedure TfExportacaoDadosIncluirAlunos.setTurma(const Value: String);
begin
   edTurma.Text := Value;
end;

procedure TfExportacaoDadosIncluirAlunos.ZerarFiltros;
begin
   Anosemestre := 0;
   Curso := '';
   Turma := '';
   Aluno := 0;
   SituacaoCurso := -1;
   ckbMatriculasAtivas.Checked := False;

   FArraySituacoesMatriculas.Clear();
end;

procedure TfExportacaoDadosIncluirAlunos.ZerarGridAlunos;
begin
   if cdsAlunos.State in [dsBrowse] then
      cdsAlunos.EmptyDataSet;
   cdsAlunos.Close();

   if FArraySelecionados = nil then
      FArraySelecionados := TStringList.Create();   
   
   FArraySelecionados.Clear();
end;

end.
