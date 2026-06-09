unit uProfessores;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Db, ZConnection, StdCtrls, Mask, DBCtrls, ExtCtrls, Buttons, 
  Grids, DBGrids, ComCtrls, General, ZAbstractRODataset, ZAbstractDataset,
  ZDataset, UZDataset, DBCGrids, ImgList, ToolWin, UMFiltroDataAnoSem,
  UMComboBox, uColigada, uUMNucleo, Menus;

type
   TDBGridObj = class(TDBGrid)
      public
         function CellRect(ACol,Arow : Longint): TRect; reintroduce;

         Property Row;
         Property Col;
   end;

  TfrmProfessores = class(TForm)
    tblProfessores: TUMZQuery;
    paCabecalho: TPanel;
    tblProfessoresDisciplinas: TUMZQuery;
    dtcProfessoresDisciplinas: TDataSource;
    tblProfessoresDisciplinasProfessor: TIntegerField;
    tblProfessoresDisciplinasSigla: TStringField;
    tblProfessoresDisciplinasDescricao: TStringField;
    tblDisciplinas: TUMZQuery;
    dtcDisciplinas: TDataSource;
    tblDisciplinasSigla: TStringField;
    tblDisciplinasDescricao: TStringField;
    pgProfessores: TPageControl;
    tabCadastro: TTabSheet;
    tabTurmas: TTabSheet;
    tblTurmasProfessores: TUMZQuery;
    tblTurmasProfessoresNomeDisciplina: TStringField;
    dsTurmasProfessores: TDataSource;
    tblGrade: TUMZQuery;
    dtcGrade: TDataSource;
    tblDisciplinasCurso: TStringField;
    tblProfessoresDisciplinasCurso: TStringField;
    tblGradeCurso: TStringField;
    tblGradeTurma: TStringField;
    tblGradeDisciplina: TIntegerField;
    tblGradeDescricao: TStringField;
    tblTurmasProfessoresCurso: TStringField;
    tblTurmasProfessoresTurma: TStringField;
    tblTurmasProfessoresProfessor: TIntegerField;
    tblTurmasProfessoresAnoSemestre: TSmallintField;
    DBGrid1: TDBGrid;
    Bevel3: TBevel;
    Bevel4: TBevel;
    Bevel5: TBevel;
    toolPessoa: TToolBar;
    ToolButton1: TToolButton;
    btnFechar: TToolButton;
    ToolButton2: TToolButton;
    ImageList1: TImageList;
    ImageList2: TImageList;
    ImageList3: TImageList;
    btnBuscarProfessor: TToolButton;
    ToolButton5: TToolButton;
    tblProfessorescd_pessoa: TIntegerField;
    tblProfessoresnm_pessoa: TStringField;
    tblProfessoresdt_nascimento: TDateTimeField;
    tblProfessoresnm_apelido: TStringField;
    tblProfessorescd_titulacao: TIntegerField;
    tblProfessorescd_area: TIntegerField;
    tblProfessoresdescTitulo: TStringField;
    tblProfessoresdescArea: TStringField;
    dsProfessores: TDataSource;
    Panel3: TPanel;
    Panel1: TPanel;
    Panel2: TPanel;
    Panel5: TPanel;
    grdDisciplinasProf: TDBGrid;
    Splitter1: TSplitter;
    Panel4: TPanel;
    grdTurmasProf: TDBGrid;
    Panel7: TPanel;
    tblObsProfessor: TUMZQuery;
    tblObsProfessorcd_pessoa: TIntegerField;
    tblObsProfessornm_apelido: TStringField;
    tblObsProfessorcd_titulacao: TIntegerField;
    tblObsProfessorcd_area: TIntegerField;
    tblObsProfessords_obs_sistema: TMemoField;
    ToolButton3: TToolButton;
    ToolButton4: TToolButton;
    dsObsProfessor: TDataSource;
    tblTurmasProfessorescd_categoria: TSmallintField;
    tblTurmasProfessoresdescCategoria: TStringField;
    tbTurmasProf: TToolBar;
    btnMostrarTurmas: TToolButton;
    ToolButton7: TToolButton;
    ToolButton8: TToolButton;
    ToolButton9: TToolButton;
    ToolBar1: TToolBar;
    ToolButton10: TToolButton;
    ToolButton11: TToolButton;
    ToolButton12: TToolButton;
    tblTurmasProfessoresds_sala: TStringField;
    tblProfessoresDisciplinasdisciplina: TIntegerField;
    tblDisciplinascodigo: TIntegerField;
    tblTurmasProfessoresdisciplina: TIntegerField;
    Panel6: TPanel;
    Bevel1: TBevel;
    Label23: TLabel;
    DBText1: TDBText;
    Panel8: TPanel;
    UMFiltroDataAnoSem: TUMFiltroDataAnoSem;
    qyVerificaUnicoProfessor: TUMZQuery;
    qyVerificaProfessorTurma: TUMZQuery;
    qyVerificaUnicoProfessorquantidade: TLargeintField;
    qyVerificaProfessorTurmaquantidade: TLargeintField;
    lbUnidadeEnsinoProfessor: TLabel;
    cbUnidadeEnsinoProfessor: TUMComboBox;
    tblProfessoreslista_coligadas_professor: TMemoField;
    pnFiltroUnidadeEnsino: TPanel;
    edColigada: TLabeledEdit;
    sbColigada: TSpeedButton;
    sbLimparColigada: TSpeedButton;
    Label1: TLabel;
    tblProfessorescoligadas: TStringField;
    tblTurmasProfessorescd_sala: TLargeintField;
    tblTurmasProfessorescd_turmaprofessor: TIntegerField;
    sbLimparSala: TSpeedButton;
    sbFiltrarSala: TSpeedButton;
    tblTurmasProfessoresds_status_aceite: TStringField;
    tblTurmasProfessoressn_aceitou: TIntegerField;
    tblTurmasProfessorescargaHoraria: TFloatField;
    tblTurmasProfessorescreditosFinanceiros: TFloatField;
    tblTurmasProfessorescreditosAcademicos: TLargeintField;
    qryVerificaPle: TUMZQuery;
    qryDeletaPlanoEnsino: TUMZQuery;
    ToolButton6: TToolButton;
    popOutrasAcoes: TPopupMenu;
    CadastrodeProfessorComplementares: TMenuItem;
    CadastrodeProfessor: TMenuItem;
    sbCargaHoraria: TSpeedButton;
    sbApagaCargaHoraria: TSpeedButton;
    tblTurmasProfessoresch_efetiva_teste: TFloatField;
    tblTurmasProfessoresnr_carga_horaria_efetiva: TFloatField;
    procedure grdTurmasProfKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure grdDisciplinasProfKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure sbApagaCargaHorariaClick(Sender: TObject);
    procedure sbCargaHorariaClick(Sender: TObject);
    procedure CadastrodeProfessorComplementaresClick(Sender: TObject);
    procedure CadastrodeProfessorClick(Sender: TObject);
    procedure sbFiltrarSalaClick(Sender: TObject);
    procedure grdTurmasProfDrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumn; State: TGridDrawState);
    procedure sbLimparSalaClick(Sender: TObject);
    procedure DBGrid1DblClick(Sender: TObject);
    procedure tblProfessoresCalcFields(DataSet: TDataSet);
    procedure cbUnidadeEnsinoProfessorChange(Sender: TObject);
    procedure sbLimparColigadaClick(Sender: TObject);
    procedure sbColigadaClick(Sender: TObject);
    procedure tblTurmasProfessoresBeforePost(DataSet: TDataSet);
    procedure UMFiltroDataAnoSemChangeAnoSemestre(Sender: TObject;
      var Valor: Integer; Direction: TUpDownDirection);
    procedure Panel6Resize(Sender: TObject);
    procedure UMFiltroDataAnoSemUMSubDateTimePickerdtpDataInicioChange(
      Sender: TObject);
    procedure UMFiltroDataAnoSemUMSubDateTimePickerdtpDataFimChange(
      Sender: TObject);
    procedure UMFiltroDataAnoSemUMSubCheckBoxckTurmaAtivaClick(Sender: TObject);
    procedure UMFiltroDataAnoSemUMSubCheckBoxckDataInicioClick(Sender: TObject);
    procedure UMFiltroDataAnoSemUMSubCheckBoxckDataFimClick(Sender: TObject);
    procedure UMFiltroDataAnoSemUMSubMaskEditmeAnoSemestreChange(
      Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure tblTurmasProfessoresBeforeClose(DataSet: TDataSet);
    procedure grdTurmasProfExit(Sender: TObject);
    procedure ToolButton8Click(Sender: TObject);
    procedure ToolButton11Click(Sender: TObject);
    procedure ToolButton10Click(Sender: TObject);
    procedure ToolButton7Click(Sender: TObject);
    procedure btnMostrarTurmasClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure sbSairClick(Sender: TObject);
    procedure tblProfessoresPostError(DataSet: TDataSet; E: EDatabaseError;
      var Action: TDataAction);
    procedure btnFecharClick(Sender: TObject);
    procedure FormPaint(Sender: TObject);
    procedure tblProfessoresDisciplinasBeforePost(DataSet: TDataSet);
    procedure tblProfessoresDisciplinasPostError(DataSet: TDataSet;
      E: EDatabaseError; var Action: TDataAction);
    procedure tblProfessoresDisciplinasCalcFields(DataSet: TDataSet);
    procedure DBNavigator971BeforeAction(Sender: TObject;
      Button: TNavigateBtn);
    procedure dbeNomeKeyPress(Sender: TObject; var Key: Char);
    procedure dbeNomeKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure dsProfessoresDataChange(Sender: TObject; Field: TField);
    procedure tblTurmasProfessoresCalcFields(DataSet: TDataSet);
    procedure tblProfessoresDisciplinasAfterPost(DataSet: TDataSet);
    procedure DBGrid1DragOver(Sender, Source: TObject; X, Y: Integer;
      State: TDragState; var Accept: Boolean);
    procedure DBGrid1DragDrop(Sender, Source: TObject; X, Y: Integer);
    procedure grdTurmasProfDragOver(Sender, Source: TObject; X, Y: Integer;
      State: TDragState; var Accept: Boolean);
    procedure grdTurmasProfDragDrop(Sender, Source: TObject; X, Y: Integer);
    procedure FormShow(Sender: TObject);
    procedure btnBuscarProfessorClick(Sender: TObject);
    procedure pgProfessoresChanging(Sender: TObject;
      var AllowChange: Boolean);
    procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure DBGrid1TitleClick(Column: TColumn);
    procedure tblTurmasProfessoresBeforeDelete(DataSet: TDataSet);
    procedure tblProfessoresDisciplinasBeforeDelete(DataSet: TDataSet);
    procedure ToolButton3Click(Sender: TObject);
    procedure tblTurmasProfessoresNewRecord(DataSet: TDataSet);
    procedure registraLogTrocarProfessorTurma(cd_professor_substituto,
      cd_professor_substituido, nr_anosemestre, cd_disciplina: Integer;
      nm_professor_substituto, nm_professor_substituido, cd_turma, cd_curso,
      nm_disciplina: String);
  strict private
      coligada_filtrada : TColigada;

      procedure setColigadaFiltrada(const Value: TColigada);

      property ColigadaFiltrada : TColigada read coligada_filtrada write setColigadaFiltrada;
  private
    procedure AtualizaProducaoAcademica(const AIAnoSemestre,
      AICodProfessorAtual, AICodProfessorNovo, AICodDisciplina: integer;
      const ASCodTurma: string);
      function getTxtAnoSemestre: TUMMaskEdit;
      procedure setTxtAnoSemestre(const Value: TUMMaskEdit);
      procedure AtualizaMaterialApoio(const AIAnoSemestre, AICodProfessorAtual,
         AICodProfessorNovo, AICodDisciplina: integer; const ASCodTurma: string);

      procedure CarregarUnidades();
      procedure CarregarUnidadesProfessor();
      procedure AbrirQueryProfessores();

      procedure AbrirQueryTurmasProfessores();
      procedure excluirProfessorHorarios(CdProfessor: Integer; Turma: String; AnoSemestre: Integer; Disciplina: Integer);

      function professorLecionaTurma: Boolean;
      function unicoProfessorTurmaDisciplina: Boolean;

      function getColigadas(CogidoProfessor: Integer): String;

  public
    procedure corrigeHorariosTurma(iAnoSemestre:Integer;iCodigoDisciplina:Integer;sCodigoTurma:String; iCodigoProfessor: Integer);
    function TrocarProfessorTurma(cd_professor_substituto,
      cd_professor_substituido, nr_anosemestre, cd_disciplina: Integer;
      nm_professor_substituto, nm_professor_substituido, cd_turma, cd_curso,
      nm_disciplina: String): Boolean;

    property txtAnoSemestre: TUMMaskEdit read getTxtAnoSemestre write setTxtAnoSemestre;
  end;
const
sqlGrades = 'SELECT                    '+
            '  t.Curso,                '+
            '  t.Codigo AS Turma,      '+
            '  d.Codigo AS Disciplina, '+
            '  d.Descricao,            '+
            '  pd.Professor,           '+
            '	t.ANOSEMESTRE           '+
            'FROM                      '+
            '  grades g                '+
            '	INNER JOIN grades_disciplinas gc ON (gc.CD_CURSO = g.CD_CURSO AND gc.CD_GRADE = g.CD_GRADE)'+
            '	INNER JOIN CURSOS_MESTRE cm ON (cm.CD_CURSO = gc.cd_curso AND cm.sn_ativo = ''S'')'+
            '	INNER JOIN CURSOS_COLIGADAS cc ON (cc.CD_CURSO = CM.CD_CURSO AND cc.SN_ATIVO = 1)'+
            '  INNER JOIN Turmas t ON (t.Serie = gc.nr_serie AND t.Curso = gc.cd_curso AND gc.cd_grade = t.cd_grade AND cc.cd_coligada = t.cd_coligada)'+
            '  INNER JOIN ProfessoresDisciplinas pd ON ( gc.cd_disciplina = pd.Disciplina AND gc.cd_curso = pd.Curso)'+
            '  INNER JOIN Disciplinas d ON (gc.cd_disciplina = d.Codigo AND gc.cd_curso = d.curso) '+
            'WHERE                                                                                 '+
            '  pd.Professor = :Professor AND                                                       '+
            '  t.AnoSemestre = :AnoSemestre AND                                                    '+
            '  t.cd_coligada in ';                                                                                                                                                                                      
sqlGradesOredenacao = 'ORDER BY                                                                    '+
                      '  t.Curso, t.Codigo, d.Descricao                                            ';

var
  frmProfessores: TfrmProfessores;

implementation

Uses uDM, Main, uTableFields, uFSelecionarPessoa, ZDbcIntfs, uGeneral, 
  uObservacoesProfessor, uItemCombo, uTrocarProfessorTurma, uUsuario, uFSelecionarColigada,
  uFSelecionarSala, Types, uSala, uTurma, uTurmaProfessorAceite, uProfessor, uProfessorAfrica,
  uPessoas;

{$R *.DFM}

procedure TfrmProfessores.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
   if frm_Professores_Obs <> nil then
   begin
      frm_Professores_Obs.Free;
      frm_Professores_Obs := nil;
   end;

   Action := caFree;
end;

procedure TfrmProfessores.FormCreate(Sender: TObject);
begin
   UMFiltroDataAnoSem.UsaAnoSemestre := DM.UsaAnosemestre;
   UMFiltroDataAnoSem.setAnosemestreInicial(ano_semestre);
   tblGrade.SQL.Text := sqlGrades +'('+DM.GetTodasColigadas+')'+ sqlGradesOredenacao;
   if not DM.UsaAnosemestre then   
      btnMostrarTurmas.Caption := 'Mostra Turmas ativas.'
   else
      btnMostrarTurmas.Caption := 'Mostrar Turmas do Ano/Sem.';
end;

procedure TfrmProfessores.sbApagaCargaHorariaClick(Sender: TObject);
const
   MSG_PERGUNTA_REMOVER = 'A Carga Horária será replicada para a Carga Horária Efetiva';
var
   qyAtualizachEfetiva: TUMZQuery;
begin
   if Mensagem(MSG_PERGUNTA_REMOVER, '', MB_YESNO + MB_ICONQUESTION, Handle) <> mrYes then Exit;

   DM.CriarConsulta(qyAtualizachEfetiva);

   qyAtualizachEfetiva.SQL.Text := '  '+
   'UPDATE                            '+
   '  turmasprofessores               '+
   'SET                               '+
   '  nr_carga_horaria_efetiva = NULL '+
   'WHERE                             '+
   '  cd_turmaprofessor = :codigo     ';

   qyAtualizachEfetiva.ParamByName('codigo').AsInteger := tblTurmasProfessorescd_turmaprofessor.AsInteger;

   qyAtualizachEfetiva.ExecSQL;

   tblTurmasProfessores.Refresh;
end;

procedure TfrmProfessores.sbCargaHorariaClick(Sender: TObject);
const
   MSG_PERGUNTA_REMOVER = 'Tem certeza que deseja alterar o valor de carga horária efetiva?';
var
   qyAtualizachEfetiva: TUMZQuery;
   cargaHorariaEfetiva: String;
   valorInformado: Boolean;
begin

   sbCargaHoraria.Down := False;

   valorInformado := False;

   while valorInformado = False do
   begin

      try
         InputQueryEvento('UNIMESTRE', 'Informe o valor de carga horária efetiva (apenas números):', cargaHorariaEfetiva);

         if (cargaHorariaEfetiva = '') then
         begin
            valorInformado := True;
            Exit;
         end;

         StrToFloat(cargaHorariaEfetiva);

         valorInformado := True;
      except
         //Erro na conversão de StrParaFloat, valor inválido!
         ShowMessage('O valor informado é inválido! Por favor informe apenas números!');
         valorInformado := False;
      end;

   end;

   DM.CriarConsulta(qyAtualizachEfetiva);

   qyAtualizachEfetiva.SQL.Text := '  '+
   'UPDATE                            '+
   '  turmasprofessores               '+
   'SET                               '+
   '  nr_carga_horaria_efetiva = :che '+
   'WHERE                             '+
   '  cd_turmaprofessor = :codigo     ';

   qyAtualizachEfetiva.ParamByName('che').AsFloat := StrToFloat(cargaHorariaEfetiva);
   qyAtualizachEfetiva.ParamByName('codigo').AsInteger := tblTurmasProfessorescd_turmaprofessor.AsInteger;
   qyAtualizachEfetiva.ExecSQL;

   tblTurmasProfessores.Refresh;
end;

procedure TfrmProfessores.sbColigadaClick(Sender: TObject);
begin
   if ( TfrmSelecionarColigada.ShowModal ) then
   begin
      ColigadaFiltrada := TfrmSelecionarColigada.getResultado()
   end;

   AbrirQueryProfessores;
end;

procedure TfrmProfessores.sbFiltrarSalaClick(Sender: TObject);
var
   resultadoSala : TResultadoFiltroSala;
   salaAntiga : TSala;
begin
   salaAntiga := nil;
   sbFiltrarSala.Down := False;
   Application.ProcessMessages;

   resultadoSala := TfrmSelecionarSala.Filtrar([]);

   if NOT(resultadoSala.filtrado) then Exit;

   if NOT(tblTurmasProfessores.State in [dsEdit]) then
      tblTurmasProfessores.Edit;

   if tblTurmasProfessorescd_sala.AsInteger <> resultadoSala.sala.Codigo then
   begin
      try
         salaAntiga := TSala.Create(
            tblTurmasProfessorescd_sala.AsInteger,
            tblTurmasProfessoresds_sala.AsString
         );
      except
      end;

      tblTurmasProfessorescd_sala.AsInteger := resultadoSala.sala.Codigo;
      tblTurmasProfessoresds_sala.AsString := resultadoSala.sala.Descricao;

      resultadoSala.sala.CorrigirSalasPadroes( salaAntiga,
         TTurma.Create(tblTurmasProfessoresTurma.AsString, tblTurmasProfessoresAnoSemestre.AsInteger),
         tblTurmasProfessoresdisciplina.AsInteger, tblTurmasProfessoresProfessor.AsInteger);
   end;

   tblTurmasProfessores.Post;
end;

procedure TfrmProfessores.sbLimparColigadaClick(Sender: TObject);
begin
   ColigadaFiltrada := nil;
   AbrirQueryProfessores;
end;

procedure TfrmProfessores.sbLimparSalaClick(Sender: TObject);
const
   MSG_PERGUNTA_REMOVER = 'Tem certeza que deseja limpar a sala?';
begin
   if Mensagem(MSG_PERGUNTA_REMOVER, '', MB_YESNO + MB_ICONQUESTION, Handle) <> mrYes then Exit;

   if NOT(tblTurmasProfessores.State in [dsEdit]) then
      tblTurmasProfessores.Edit;

   tblTurmasProfessorescd_sala.Clear;
   tblTurmasProfessoresds_sala.Clear;

   tblTurmasProfessores.Post;   
end;

procedure TfrmProfessores.sbSairClick(Sender: TObject);
begin
  Close;
end;

procedure TfrmProfessores.setColigadaFiltrada(const Value: TColigada);
begin
   coligada_filtrada := Value;

   if coligada_filtrada = nil then
      edColigada.Text := '- Todas Unidades de Ensino -'
   else
      edColigada.Text := coligada_filtrada.Nome;
end;

procedure TfrmProfessores.setTxtAnoSemestre(const Value: TUMMaskEdit);
begin
   UMFiltroDataAnoSem.FiltroAnosemestreMaskEdit := Value;
end;

procedure TfrmProfessores.tblProfessoresPostError(DataSet: TDataSet;
  E: EDatabaseError; var Action: TDataAction);
begin
  TrataErroBanco(DataSet,E);
end;

procedure TfrmProfessores.btnFecharClick(Sender: TObject);
begin
  { Botão Fechar }
  Close;
end;

procedure TfrmProfessores.cbUnidadeEnsinoProfessorChange(Sender: TObject);
begin
   AbrirQueryTurmasProfessores();
end;

procedure TfrmProfessores.corrigeHorariosTurma(iAnoSemestre,
  iCodigoDisciplina: Integer; sCodigoTurma:String; iCodigoProfessor: Integer);
const
   ORACLE_SQL_CORRIGE_HORARIOS = 'MERGE INTO turmas_horarios h1 USING '+
                                 '(SELECT '+
                                 '	  h.anosemestre as anosemestre, '+
                                 '		h.turma as turma, '+
                                 '		h.cd_horario as cd_horario, '+
                                 '		h.dia_semana as dia_semana, '+
                                 '		h.disciplina as disciplina, '+
                                 '		h.turma_base as turma_base, '+
                                 '		h.cd_professor as professor '+
                                 'FROM '+
                                 '    turmas_horarios_config h '+
                                 '    INNER JOIN turmasprofessores p ON ( '+
                                 '					h.anosemestre = p.anosemestre AND '+
                                 '					h.turma = p.turma AND '+
                                 '					h.disciplina = p.disciplina) '+
                                 'WHERE '+
                                 '	 h.cd_professor <> p.professor AND '+
                                 '	 h.anosemestre = :pAnoSemestre AND '+
                                 '	 h.turma = :pTurma AND '+
                                 '	 h.disciplina = :pDisciplina) h2 ON (h1.anosemestre = h2.anosemestre AND h1.turma = h2.turma AND h1.cd_horario = h2.cd_horario AND h1.dia_semana = h2.dia_semana AND h1.disciplina = h2.disciplina AND h1.turma_base = h2.turma_base) '+
                                 'WHEN MATCHED THEN '+
                                 '   UPDATE SET h1.cd_professor = h2.professor';

   MYSQL_SQL_CORRIGE_HORARIOS = 'UPDATE '+
                                '   turmas_horarios_config h '+
                                '   INNER JOIN turmasprofessores p ON (h.nr_anosemestre =p.anosemestre AND h.cd_turma = p.turma AND h.cd_disciplina = p.disciplina) '+
                                'SET '+
                                '  h.cd_professor = p.professor '+
                                'WHERE '+
                                '  h.cd_professor <> p.professor AND '+
                                '  h.cd_professor = 0 AND '+
                                '  h.nr_anosemestre = :pAnoSemestre AND '+
                                '  h.cd_turma = :pTurma AND '+
                                '  h.cd_disciplina = :pDisciplina AND '+
                                '  p.professor = :pProfessor AND '+
                                '  h.sn_ativo = 1';

var
   qryApagaProfessorTP, qryConsultaProfessores, qryCorrigeHorariosProfessor : TUMZQuery;
begin
   DM.CriarConsulta(qryCorrigeHorariosProfessor);

   if DM.db.Protocol = DB_PROTOCOL_ORACLE then
   begin
      qryCorrigeHorariosProfessor.SQLList.Values[qryCorrigeHorariosProfessor.Connection.Protocol] := ORACLE_SQL_CORRIGE_HORARIOS;
   end else if DM.db.Protocol = DB_PROTOCOL_MYSQL then
   begin
      qryCorrigeHorariosProfessor.SQLList.Values[qryCorrigeHorariosProfessor.Connection.Protocol] := MYSQL_SQL_CORRIGE_HORARIOS;
   end;

   if((iCodigoDisciplina=0) or (sCodigoTurma = '')) then
   begin
      exit;
   end;
   try
      //  Não pode ser executado pois um professor pode ter 2 disciplinas
      with qryCorrigeHorariosProfessor do
      begin
         ParamByName('pAnoSemestre').AsInteger:=iAnoSemestre;
         ParamByName('pTurma').AsString := sCodigoTurma;
         ParamByName('pDisciplina').AsInteger := iCodigoDisciplina;
         ParamByName('pProfessor').AsInteger := iCodigoProfessor;         
         ExecSQL;
      end;

   except on E: EDatabaseError do
           Mensagem( 'Ocorreu um erro ao tentar corrigir as turmas do professor.' + #13 +
               E.Message, Application.Title, MB_OK + MB_ICONSTOP );
   end;
end;

procedure TfrmProfessores.FormPaint(Sender: TObject);
begin
  PapelParede( Sender );
end;

procedure TfrmProfessores.tblProfessoresDisciplinasBeforeDelete(DataSet: TDataSet);
begin
   tblObsProfessor.Edit;

   if Trim(tblObsProfessords_obs_sistema.AsString) <> '' Then
      tblObsProfessords_obs_sistema.AsString := tblObsProfessords_obs_sistema.AsString + CHR(13) + CHR(13);

   tblObsProfessords_obs_sistema.AsString := tblObsProfessords_obs_sistema.AsString +
   '[Retirada a disciplina do professor]' + #13 +
	 'Sigla: ' + tblProfessoresDisciplinasSigla.AsString + #13 +
   'Disciplina: ' + tblProfessoresDisciplinasdisciplina.AsString + ' - ' + tblProfessoresDisciplinasDescricao.AsString + #13  +
   'Saída: ' + dateToStr(DataHoje) + #13  +
   'Usuário realizou operação: ' + IntToStr(DM.iCdPessoaLogado) + ' - ' + DM.sLogin;

   tblObsProfessor.Post;
end;

procedure TfrmProfessores.tblProfessoresDisciplinasBeforePost(
  DataSet: TDataSet);
begin
  tblProfessoresDisciplinasProfessor.AsInteger := tblProfessorescd_pessoa.AsInteger;
end;

procedure TfrmProfessores.tblProfessoresDisciplinasPostError(
  DataSet: TDataSet; E: EDatabaseError; var Action: TDataAction);
begin
  TrataErroBanco(DataSet,E);
end;

procedure TfrmProfessores.tblProfessoresDisciplinasCalcFields(
  DataSet: TDataSet);
begin
  DM.tblDisciplinas.Close;
  DM.tblDisciplinas.SQL.Clear;
  DM.tblDisciplinas.SQL.Add( 'select * from Disciplinas where Codigo = :Codigo' );
  DM.tblDisciplinas.SQL.Add( 'and curso = :curso');
  DM.tblDisciplinas.ParamByName('Codigo').AsInteger := tblProfessoresDisciplinasDisciplina.AsInteger;
  DM.tblDisciplinas.ParamByName('curso').AsString := tblProfessoresDisciplinasCurso.AsString;
  DM.tblDisciplinas.Open;
  tblProfessoresDisciplinasSigla.AsString := DM.tblDisciplinasSigla.AsString;
  tblProfessoresDisciplinasDescricao.AsString := DM.tblDisciplinasDescricao.AsString;
end;

procedure TfrmProfessores.DBNavigator971BeforeAction(Sender: TObject;
  Button: TNavigateBtn);
begin
  if Button = nbDelete then
  begin
    if Mensagem( 'Deseja excluir este registro?',
                 Application.Title, MB_YESNO + MB_ICONQUESTION ) = ID_NO then Abort;
  end;
end;

procedure TfrmProfessores.dbeNomeKeyPress(Sender: TObject; var Key: Char);
begin
  if Key = #13 then
  begin
    SelectNext(ActiveControl,True,True);
    Key := #0;
  end;
end;

procedure TfrmProfessores.dbeNomeKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  case Key of
    VK_DOWN : SelectNext(ActiveControl,True,True);
    VK_UP : SelectNext(ActiveControl,False,True);
  end;
end;

procedure TfrmProfessores.dsProfessoresDataChange(Sender: TObject;
  Field: TField);
var
   i: Integer;
   qyCargaHoraria: TUMZQuery;
begin
   tblTurmasProfessores.EnableControls;

   tblTurmasProfessores.Close;
   tblTurmasProfessores.SQL.Clear();

   tblTurmasProfessores.SQL.Add(' SELECT ');
   tblTurmasProfessores.SQL.Add(' IFNULL( '+
   '                                tp.nr_carga_horaria_efetiva, '+
   '                                (  '+
   '                                   SELECT '+
   '                                      gd.VL_VALOR '+
   '                                   FROM '+
   '                                      grades_disciplinas GD '+
   '                                   WHERE '+
   '                                      gd.CD_GRADE = t.cd_grade '+
   '                                      AND gd.CD_CURSO = t.curso '+
   '                                      AND gd.CD_DISCIPLINA = tp.disciplina '+
   '                                      AND gd.NR_SERIE = t.serie '+
   '                                ) '+
	'                              ) AS ch_efetiva_teste, ');
   tblTurmasProfessores.SQL.Add(' tp.*, (SELECT gd.VL_VALOR FROM grades_disciplinas GD WHERE gd.CD_GRADE = t.cd_grade AND gd.CD_CURSO = t.curso AND gd.CD_DISCIPLINA = tp.disciplina AND gd.NR_SERIE = t.serie) as cargaHoraria, ');
   tblTurmasProfessores.SQL.Add(' (SELECT nr_aulas FROM grades_disciplinas GD WHERE gd.CD_GRADE = t.cd_grade AND gd.CD_CURSO = t.curso AND gd.CD_DISCIPLINA = tp.disciplina AND gd.NR_SERIE = t.serie) as creditosFinanceiros, ');
   tblTurmasProfessores.SQL.Add(' (SELECT NR_CREDITOS_ACADEMICOS FROM grades_disciplinas GD WHERE gd.CD_GRADE = t.cd_grade AND gd.CD_CURSO = t.curso AND gd.CD_DISCIPLINA = tp.disciplina AND gd.NR_SERIE = t.serie) as creditosAcademicos ');

   tblTurmasProfessores.SQL.Add(' FROM TURMASPROFESSORES tp ');
   tblTurmasProfessores.SQL.Add('      INNER JOIN TURMAS t ON (t.codigo = tp.turma AND t.anosemestre = tp.anosemestre AND t.curso = tp.curso) ');
   tblTurmasProfessores.SQL.Add(' WHERE tp.professor = :cd_pessoa AND tp.anosemestre = :AnoSemestre');
   tblTurmasProfessores.SQL.Add(Format('AND t.cd_coligada IN (%s)', [DM.GetTodasColigadas]));

   if not UMFiltroDataAnoSem.UsaAnoSemestre then
   begin
      tblTurmasProfessores.SQL.Add(' AND t.sn_ativa = :sn_ativa');
      tblTurmasProfessores.ParamByName('sn_ativa').AsInteger := UMFiltroDataAnoSem.getTurmasAtivas();

      if ( UMFiltroDataAnoSem.FiltroDataCheckBoxDataInicio.Checked ) then
      begin
         tblTurmasProfessores.SQL.Add(' AND DATE_FORMAT(t.datainicio, :formato) >= :datainicio ');
         tblTurmasProfessores.ParamByName('datainicio').AsString := UMFiltroDataAnoSem.getDataInicio();
      end;

      if ( UMFiltroDataAnoSem.FiltroDataCheckBoxDataFim.Checked ) then
      begin
         tblTurmasProfessores.SQL.Add(' AND DATE_FORMAT(t.datafim, :formato) <= :datafim ');
         tblTurmasProfessores.ParamByName('datafim').AsString := UMFiltroDataAnoSem.getDataFim();
      end;

      if UMFiltroDataAnoSem.FiltroDataCheckBoxDataInicio.Checked OR
         UMFiltroDataAnoSem.FiltroDataCheckBoxDataFim.Checked then
         tblTurmasProfessores.ParamByName('formato').AsString := DATE_FORMAT_GERAL;
   end;

   tblTurmasProfessores.ParamByname('cd_pessoa').AsInteger := tblProfessorescd_pessoa.AsInteger;
   tblTurmasProfessores.ParamByName('AnoSemestre').AsInteger := StrToInt(txtAnoSemestre.Text);

   tblTurmasProfessores.Open;

   tblTurmasProfessores.FieldByName('nr_carga_horaria_efetiva').AsInteger;

   tblTurmasProfessores.EnableControls;

   tblObsProfessor.Close;
   tblObsProfessor.ParamByName('cd_pessoa').AsInteger := tblProfessorescd_pessoa.AsInteger;
   tblObsProfessor.Open;
end;

procedure TfrmProfessores.excluirProfessorHorarios(CdProfessor: Integer;
  Turma: String; AnoSemestre: Integer; Disciplina: Integer);
const
   SQL_UPDATE_TURMAS_HORARIOS_CONFIG =
      ' UPDATE turmas_horarios_config SET cd_professor = 0 ' +
      ' WHERE cd_professor = :cd_professor AND nr_anosemestre = :nr_anosemestre AND ' +
      '       cd_turma = :turma AND cd_disciplina = :disciplina ';
   SQL_SELECT_CD_TURMAS_HORARIOS = ' SELECT cd_turmas_horarios FROM turmas_horarios_config ' +
      ' WHERE cd_professor = :cd_professor AND nr_anosemestre = :nr_anosemestre AND ' +
      '       cd_turma = :turma AND cd_disciplina = :disciplina '; 
   SQL_DELETE_TURMAS_HORARIOS_CONFIG =
      ' DELETE FROM turmas_horarios_config ' +
      ' WHERE cd_professor = :cd_professor AND nr_anosemestre = :nr_anosemestre AND ' +
      '       cd_turma = :turma AND cd_disciplina = :disciplina ';
   SQL_DELETE_DIARIO_AULAS_TURMAS_HORARIOS = ''+
      ' DELETE FROM diario_aulas_turmas_horarios ' +
      ' WHERE cd_diario_aula_turma_horario = :cd_turmas_horarios';
var
   qyDesvinculaProfessorHorarios: TUMZQuery;
   qyApagaDiarioAulasTurmasHorarios: TUMZQuery;
begin
   DM.CriarConsulta(qyDesvinculaProfessorHorarios);

   qyDesvinculaProfessorHorarios.SQL.Text := SQL_UPDATE_TURMAS_HORARIOS_CONFIG;

   qyDesvinculaProfessorHorarios.ParamByName('cd_professor').AsInteger := CdProfessor;
   qyDesvinculaProfessorHorarios.ParamByName('nr_anosemestre').AsInteger := AnoSemestre;
   qyDesvinculaProfessorHorarios.ParamByName('turma').AsString := Turma;
   qyDesvinculaProfessorHorarios.ParamByName('disciplina').AsInteger := Disciplina;

   try
      qyDesvinculaProfessorHorarios.ExecSQL;
   except
      on E:EZSQLException do
      begin
         if Pos('duplicate entry', StrLower(PAnsiChar(E.Message))) > 0 then
         begin
            //Select para pegar os cd_turmas_horarios da tabela turmas_horarios_config
            qyDesvinculaProfessorHorarios.Close;
            qyDesvinculaProfessorHorarios.SQL.Text := SQL_SELECT_CD_TURMAS_HORARIOS;
            qyDesvinculaProfessorHorarios.ParamByName('cd_professor').AsInteger := CdProfessor;
            qyDesvinculaProfessorHorarios.ParamByName('nr_anosemestre').AsInteger := AnoSemestre;
            qyDesvinculaProfessorHorarios.ParamByName('turma').AsString := Turma;
            qyDesvinculaProfessorHorarios.ParamByName('disciplina').AsInteger := Disciplina;
            qyDesvinculaProfessorHorarios.Open;
            
            qyDesvinculaProfessorHorarios.First;

            DM.CriarConsulta(qyApagaDiarioAulasTurmasHorarios);
            while not qyDesvinculaProfessorHorarios.Eof do
            begin
              //Apaga os registro da tabela NxN diario_aulas_turmas_horarios
               qyApagaDiarioAulasTurmasHorarios.SQL.Text := SQL_DELETE_DIARIO_AULAS_TURMAS_HORARIOS;
               
               qyApagaDiarioAulasTurmasHorarios.ParamByName('cd_turmas_horarios').AsInteger :=
                  qyDesvinculaProfessorHorarios.FieldByName('cd_turmas_horarios').AsInteger;

               qyApagaDiarioAulasTurmasHorarios.ExecSQL;
               
               qyDesvinculaProfessorHorarios.Next;
            end;

            //Apaga registro de turmas_horarios_config
            qyDesvinculaProfessorHorarios.Close;
            qyDesvinculaProfessorHorarios.SQL.Text := SQL_DELETE_TURMAS_HORARIOS_CONFIG;
            qyDesvinculaProfessorHorarios.ParamByName('cd_professor').AsInteger := CdProfessor;
            qyDesvinculaProfessorHorarios.ParamByName('nr_anosemestre').AsInteger := AnoSemestre;
            qyDesvinculaProfessorHorarios.ParamByName('turma').AsString := Turma;
            qyDesvinculaProfessorHorarios.ParamByName('disciplina').AsInteger := Disciplina;
            qyDesvinculaProfessorHorarios.ExecSQL();
         end;
      end;
   end;

   FreeAndNil(qyDesvinculaProfessorHorarios);
end;

procedure TfrmProfessores.tblTurmasProfessoresCalcFields(DataSet: TDataSet);
var
   turmaProfessorAceite : TTurmaProfessorAceite;
begin
   DM.tblDisciplinas.Close;
   DM.tblDisciplinas.ParamByName('Codigo').AsInteger := tblTurmasProfessoresDisciplina.AsInteger;
   DM.tblDisciplinas.ParamByName('curso').AsString := tblTurmasProfessoresCurso.AsString;
   DM.tblDisciplinas.Open;

   tblTurmasProfessoresNomeDisciplina.AsString := DM.tblDisciplinasDescricao.AsString;
   DM.tblDisciplinas.Close;

   turmaProfessorAceite := TTurmaProfessorAceite.GetTurmaProfessorAceite(tblTurmasProfessorescd_turmaprofessor.AsInteger);
   if turmaProfessorAceite = nil then
   begin
      tblTurmasProfessoresds_status_aceite.AsString := '----';
      tblTurmasProfessoressn_aceitou.AsInteger := -1;
   end else begin
      tblTurmasProfessoresds_status_aceite.AsString := MsgStatusAceiteTurmaProfessor[turmaProfessorAceite.StatusAceite];
      tblTurmasProfessoressn_aceitou.AsInteger := turmaProfessorAceite.Aceitou;
   end;
end;


procedure TfrmProfessores.tblProfessoresCalcFields(DataSet: TDataSet);
begin
   tblProfessorescoligadas.AsString := getColigadas(tblProfessorescd_pessoa.AsInteger);
end;

procedure TfrmProfessores.tblProfessoresDisciplinasAfterPost(
  DataSet: TDataSet);
begin
   tblProfessoresDisciplinas.DisableControls;
   tblProfessoresDisciplinas.Close;
   tblProfessoresDisciplinas.Open;
   tblProfessoresDisciplinas.EnableControls;
end;

procedure TfrmProfessores.DBGrid1DragOver(Sender, Source: TObject; X,
  Y: Integer; State: TDragState; var Accept: Boolean);
begin
  Accept := (Source is TTreeView);
end;

procedure TfrmProfessores.DBGrid1DblClick(Sender: TObject);
var
   teste: Boolean;
begin
   pgProfessores.ActivePageIndex := 1;
   pgProfessoresChanging(nil, teste);
end;

procedure TfrmProfessores.DBGrid1DragDrop(Sender, Source: TObject; X,
  Y: Integer);
var
  MyTreeNode : TTreeNode;
  qyVerificaCursoDisciplinaDuplicado: TUMZQuery;
begin
  { Quando arrastar da Disciplina para a Grade }
  if Source is TTreeView then
  begin
    case frmTableFields.Tag of
      2 : Begin
            Mensagem( 'Arraste para a grade de Turmas.', Application.Title, MB_OK + MB_ICONSTOP );
            Exit;
          End;
    End;

    frmTableFields.tblDisciplinas.FilterOptions := [foNoPartialCompare];

    MyTreeNode := frmTableFields.Tree.Selected;
    if MyTreeNode.Parent = nil then begin
      frmTableFields.tblDisciplinas.Filter := 'Curso = '''+MyTreeNode.Text+'''';

      frmTableFields.tblDisciplinas.Filtered := True;
      frmTableFields.tblDisciplinas.First();
    end;
    
    try
    
      if MyTreeNode.Parent = nil then begin
        while not frmTableFields.tblDisciplinas.Eof do begin
          tblProfessoresDisciplinas.Append;
          tblProfessoresDisciplinas.FieldByName('Disciplina').AsInteger := frmTableFields.tblDisciplinas.FieldByName('Codigo').AsInteger;
          tblProfessoresDisciplinas.FieldByName('Curso').AsString := frmTableFields.tblDisciplinas.FieldByName('Curso').AsString;
          tblProfessoresDisciplinas.Post;

          frmTableFields.tblDisciplinas.Next();
        end;
      end
      else begin
      
         //Este SQL vai verificar se o professor já possui este Curso/Disciplina.
         DM.CriarConsulta(qyVerificaCursoDisciplinaDuplicado);
         qyVerificaCursoDisciplinaDuplicado.SQL.Text := '' +
            'SELECT Count(professor) as qtd ' +
            'FROM professoresdisciplinas  ' +
            'WHERE                        ' +
            '  professor = :professor     ' +
            '  AND disciplina = :disciplina   ' +
            '  AND curso = :curso             ';

         qyVerificaCursoDisciplinaDuplicado.ParamByName('professor').asString :=
            tblProfessoresDisciplinasProfessor.asString;

         qyVerificaCursoDisciplinaDuplicado.ParamByName('disciplina').AsInteger :=
            StrToInt(Copy(MyTreeNode.Text, 1, 11));

         qyVerificaCursoDisciplinaDuplicado.ParamByName('curso').AsString :=
            MyTreeNode.Parent.Text;
                                      
         qyVerificaCursoDisciplinaDuplicado.Open;

        if (qyVerificaCursoDisciplinaDuplicado.FieldByName('qtd').AsInteger > 0) then
        begin
           ShowMessage('O professor já possui este Curso/Disciplina!');
           Exit;
        end
        else
        begin
           tblProfessoresDisciplinas.Append;

           tblProfessoresDisciplinas.FieldByName('Disciplina').AsInteger := StrToInt(Copy(MyTreeNode.Text, 1, 11));
           tblProfessoresDisciplinas.FieldByName('Curso').AsString := MyTreeNode.Parent.Text;
           tblProfessoresDisciplinas.Post;
        end;
      end;

    except on E:Exception do
      begin
        Exit;
      end;
    end;

  end;

end;

procedure TfrmProfessores.grdTurmasProfDragOver(Sender, Source: TObject; X,
  Y: Integer; State: TDragState; var Accept: Boolean);
begin
  Accept := (Source is TTreeView);
end;

procedure TfrmProfessores.grdTurmasProfDrawColumnCell(Sender: TObject;
  const Rect: TRect; DataCol: Integer; Column: TColumn; State: TGridDrawState);
var
   DataRect : TRect;
begin
   if (Column.FieldName = 'ch_efetiva_teste') then
   begin

      if (tblTurmasProfessores.RecordCount > 0) AND (tblTurmasProfessores.RecNo > 0) then
      begin
         with TDBGridObj(grdTurmasProf) do
         begin
            DataRect := CellRect(Column.Index,Row);
         end;

         if sbCargaHoraria.Parent <> grdTurmasProf then
            sbCargaHoraria.Parent := grdTurmasProf;

         if sbApagaCargaHoraria.Parent <> grdTurmasProf then
            sbApagaCargaHoraria.Parent := grdTurmasProf;
            
         sbApagaCargaHoraria.Left := (DataRect.Right - sbApagaCargaHoraria.Width);
         sbCargaHoraria.Left := (DataRect.Right - sbCargaHoraria.Width - sbApagaCargaHoraria.Width);
         sbApagaCargaHoraria.Top := DataRect.Top;
         sbCargaHoraria.Top := DataRect.Top;

         sbApagaCargaHoraria.Height := (DataRect.Bottom-DataRect.Top);
         sbCargaHoraria.Height := (DataRect.Bottom-DataRect.Top);

         sbCargaHoraria.Visible := True;
         sbApagaCargaHoraria.Visible := True;


      end else begin
         sbCargaHoraria.Visible := False;
         sbApagaCargaHoraria.Visible := False;
      end;

   end
   else if (Column.FieldName = 'ds_sala') then
   begin
      if (tblTurmasProfessores.RecordCount > 0) AND (tblTurmasProfessores.RecNo > 0) then
      begin
         with TDBGridObj(grdTurmasProf) do
         begin
            DataRect := CellRect(Column.Index,Row);
         end;

         // Define o pai dos botões sendo a grid
         if sbFiltrarSala.Parent <> grdTurmasProf then
            sbFiltrarSala.Parent := grdTurmasProf;

         if sbLimparSala.Parent <> grdTurmasProf then
            sbLimparSala.Parent := grdTurmasProf;

         if sbCargaHoraria.Parent <> grdTurmasProf then
            sbCargaHoraria.Parent := grdTurmasProf;

         if sbApagaCargaHoraria.Parent <> grdTurmasProf then
            sbApagaCargaHoraria.Parent := grdTurmasProf;

         // Set the button's coordinates.
         // In this case, right justify the button.
         sbLimparSala.Left := (DataRect.Right - sbLimparSala.Width);
         sbFiltrarSala.Left := (DataRect.Right - sbFiltrarSala.Width - sbLimparSala.Width);
         sbLimparSala.Top := DataRect.Top;
         sbFiltrarSala.Top := DataRect.Top;

         sbLimparSala.Height := (DataRect.Bottom-DataRect.Top);
         sbFiltrarSala.Height := (DataRect.Bottom-DataRect.Top);

         sbFiltrarSala.Visible := True;
         sbLimparSala.Visible := True;
      end else begin
         sbFiltrarSala.Visible := False;
         sbLimparSala.Visible := False;
      end;
   end
   else if (Column.FieldName = 'ds_status_aceite') then
   begin
      TGeneral.AlterarCorFonteCelula(grdTurmasProf, Rect, DataCol, Column, State, clBlack);
      if tblTurmasProfessores.RecNo > 0 then
      begin
         case tblTurmasProfessoressn_aceitou.AsInteger of
            0: begin
               TGeneral.AlterarCorCelula(grdTurmasProf, Rect, DataCol, Column, State, 15066597); // Não aceitou
            end;
            1: begin
               TGeneral.AlterarCorCelula(grdTurmasProf, Rect, DataCol, Column, State, 14811106); // Aceitou
            end;
            else begin
               TGeneral.AlterarCorCelula(grdTurmasProf, Rect, DataCol, Column, State, clWhite); // Aguardando
            end;
         end;
      end else begin
         TGeneral.AlterarCorCelula(grdTurmasProf, Rect, DataCol, Column, State, clWhite); // Aguardando
      end;
   end;
end;

procedure TfrmProfessores.grdTurmasProfExit(Sender: TObject);
begin
   if tblTurmasProfessores.State IN [dsInsert, dsEdit] then begin
       tblTurmasProfessores.Post;
       { Estava sendo executado em um momento incorreto
       Self.corrigeHorariosTurma(
                        StrToInt(txtAnoSemestre.Text),
                        tblTurmasProfessores.FieldByName('Disciplina').AsInteger,
                        tblTurmasProfessores.FieldByName('Turma').AsString
                        );
                        }
   end;

end;

procedure TfrmProfessores.grdTurmasProfKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
   {
      DESABILITA O CTRL + DEL DA GRID -> ESTA COMBINAÇÃO APAGA O REGISTRO
      SELECIONADO NA GRID
   }
   if ( Key = VK_DELETE ) AND ( Shift = [ssCtrl] ) then
   begin
      Abort();
   end;
end;

procedure TfrmProfessores.Panel6Resize(Sender: TObject);
begin
   Bevel1.Width := Panel6.Width - 6;
end;

function TfrmProfessores.getColigadas(CogidoProfessor: Integer): String;
const
   SQL_BUSCA_COLIGADAS = ''+
      ' SELECT  '+
      '   CASE '+
      '     WHEN LENGTH(GROUP_CONCAT(c.nm_coligada SEPARATOR '' ; '')) > 97 THEN '+
      '       CONCAT(SUBSTRING(GROUP_CONCAT(c.nm_coligada SEPARATOR '' ; ''), 1, 97), ''...'') '+
      '     ELSE GROUP_CONCAT(c.nm_coligada SEPARATOR '' ; '') '+
      '   END AS coligadas '+
      ' FROM '+
      '   coligadas AS c '+
      ' INNER JOIN professores_unidades pu ON (pu.cd_coligada = c.cd_coligada) '+
      ' WHERE '+
      '   pu.cd_professor = :cd_professor AND pu.sn_professor = 1'+
      ' GROUP BY '+
      '   pu.cd_professor ';
var
   qyBuscaColigadas: TUMZQuery;      
begin

   DM.CriarConsulta(qyBuscaColigadas);

   with qyBuscaColigadas do
   begin
      SQL.Text := SQL_BUSCA_COLIGADAS;

      ParamByName('cd_professor').AsInteger := CogidoProfessor;

      Open;

      if FieldByName('coligadas').AsString <> '' then
      begin
         Result := FieldByName('coligadas').AsString;
      end
      else
      begin
         Result := '';
      end;
   end;

   FreeAndNil(qyBuscaColigadas);
end;

function TfrmProfessores.getTxtAnoSemestre: TUMMaskEdit;
begin
   Result := UMFiltroDataAnoSem.FiltroAnosemestreMaskEdit;
end;

procedure TfrmProfessores.grdDisciplinasProfKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
   {
      DESABILITA O CTRL + DEL DA GRID -> ESTA COMBINAÇÃO APAGA O REGISTRO
      SELECIONADO NA GRID
   }
   if ( Key = VK_DELETE ) AND ( Shift = [ssCtrl] ) then
   begin
      Abort();
   end;
end;

procedure TfrmProfessores.grdTurmasProfDragDrop(Sender, Source: TObject; X,
  Y: Integer);
var
  MyTreeNode : TTreeNode;
  iCodPessoa, iColigada: Integer;
begin
  { Quando arrastar da  Grade }
  try
     if Source is TTreeView then
     begin
       case frmTableFields.Tag of
         1 : Begin
               Mensagem( 'Arraste para a grade de Disciplinas.', Application.Title, MB_OK + MB_ICONSTOP );
               Exit;
             End;
       End;

       tblGrade.FilterOptions := [foNoPartialCompare];

       MyTreeNode := frmTableFields.Tree.Selected;
       if MyTreeNode.Parent = nil then begin
         tblGrade.Filter := 'Curso = '''+MyTreeNode.Text+'''';
       end
       else if MyTreeNode.HasChildren then begin
         tblGrade.Filter := 'Turma = '''+MyTreeNode.Text+''' AND Curso = '''+MyTreeNode.Parent.Text+'''';
       end
       else begin
         tblGrade.Filter := 'Disciplina = '+Copy(MyTreeNode.Text,1,Pos('-', MyTreeNode.Text)-1)+' AND Turma = '''+MyTreeNode.Parent.Text+''' AND Curso = '''+MyTreeNode.Parent.Parent.Text+'''';
       end;

       tblGrade.Filtered := True;
       tblGrade.First;

       //MyTreeNode := frmTableFields.Tree.Selected.GetPrev;
       //while (not MyTreeNode.HasChildren) do
       //begin
       //  Inc(int);
       //  if int > 100 then break;
       //  MyTreeNode := MyTreeNode.GetPrev;
       //end;

       tblTurmasProfessores.DisableControls;
       try
         DM.db.StartTransaction;

          while not tblGrade.Eof do begin

            tblTurmasProfessores.Append;
            tblTurmasProfessoresAnoSemestre.AsInteger := StrtoInt(txtAnoSemestre.Text);

            //tblTurmasProfessoresTurma.AsString := frmTableFields.Tree.Selected.Parent.Text; // 2o Níveo do Tree
            //tblTurmasProfessoresDisciplina.AsInteger := StrToInt(Copy(frmTableFields.Tree.Selected.Text,1,5)); // Tree Selecionado
            //tblTurmasProfessoresCurso.ASString := frmTableFields.Tree.Selected.Parent.Parent.Text;
            tblTurmasProfessoresTurma.AsString := tblGrade.FieldByName('Turma').AsString;
            tblTurmasProfessoresDisciplina.AsInteger := tblGrade.FieldByName('Disciplina').AsInteger;
            tblTurmasProfessoresCurso.ASString := tblGrade.FieldByName('Curso').AsString;

            tblTurmasProfessoresProfessor.AsInteger := tblProfessorescd_pessoa.AsInteger;
            // frmTableFields.Tree.TopItem.Text; // 1o Nível do Tree;
            tblTurmasProfessores.Post;
            Self.corrigeHorariosTurma(
                           StrToInt(txtAnoSemestre.Text),
                           tblTurmasProfessores.FieldByName('Disciplina').AsInteger,
                           tblTurmasProfessores.FieldByName('Turma').AsString,
                           tblProfessorescd_pessoa.AsInteger
                           );
            tblGrade.Next;
          end;

          tblTurmasProfessores.Close;
          tblTurmasProfessores.Open;

        DM.db.Commit;

        // Pega dados para colocar a pessoa no grupo
        iCodPessoa := tblTurmasProfessoresProfessor.AsInteger;
        iColigada := DM.getColigadaByTurma(
                        tblTurmasProfessoresTurma.AsString,
                        tblTurmasProfessoresAnoSemestre.AsInteger
                     );
        // Atualiza a pessoa no Grupo
        DM.atualizarGruposPessoa(iCodPessoa, iColigada);

        except on E:Exception do
          begin
             tblTurmasProfessores.Cancel;
             DM.db.Rollback;
             tblTurmasProfessores.EnableControls;
          end;
        end;
        tblTurmasProfessores.EnableControls;
        tblGrade.Filtered := False;
     end;
  except on E: Exception do
  end;
end;

procedure TfrmProfessores.FormShow(Sender: TObject);
begin
   UMFiltroDataAnoSem.UsaAnoSemestre := DM.UsaAnosemestre;
   UMFiltroDataAnoSem.setAnosemestreInicial(ano_semestre);
   UMFiltroDataAnoSem.FiltroDataDateTimePickerDataInicio.DateTime := TUMNucleo.GetDataAtual;
   UMFiltroDataAnoSem.FiltroDataDateTimePickerDataFim.DateTime := TUMNucleo.GetDataAtual;

   TGeneral.AlterarVisibilidadeColunaGrid(grdTurmasProf, 'ds_status_aceite', TTurmaProfessorAceite.UsaControleAceiteProfessor());

   CarregarUnidades();

  { Todas em maiúsculas }
   DM.TodasMaiusculas(TForm(Sender));

   txtAnoSemestre.text := IntToStr(ano_semestre);
   if not tblProfessores.Active Then
   Begin
      tblProfessores.DisableControls;
      AbrirQueryProfessores();
      tblProfessores.EnableControls;
   End;

  tblDisciplinas.Open;
  tblProfessoresDisciplinas.Open;

  pgProfessores.ActivePage := tabCadastro;
end;

procedure TfrmProfessores.AbrirQueryProfessores;
var
   I: Integer;
begin
   pgProfessores.ActivePage := tabCadastro;

   tblProfessores.Close;

   tblProfessores.SQL.Clear;
   tblProfessores.SQL.Add(' SELECT p.cd_pessoa, p.nm_pessoa, p.dt_nascimento, prof.nm_apelido, prof.cd_titulacao, prof.cd_area, ');
   tblProfessores.SQL.Add('       GROUP_CONCAT( pu.cd_coligada ) AS lista_coligadas_professor, ');
   tblProfessores.SQL.Add('       GROUP_CONCAT(C.nm_coligada SEPARATOR '' ; '') AS coligadas');
   tblProfessores.SQL.Add('FROM professores prof ');
   tblProfessores.SQL.Add('     INNER JOIN professores_unidades pu ON ( pu.cd_professor = prof.cd_pessoa ) ');
   tblProfessores.SQL.Add('     INNER JOIN coligadas c ON ( c.cd_coligada = pu.cd_coligada ) ');
   tblProfessores.SQL.Add('     INNER JOIN pessoas p ON ( p.cd_pessoa = prof.cd_pessoa ) ');
   tblProfessores.SQL.Add('WHERE pu.sn_professor = 1 AND c.cd_coligada_matriz = :cd_coligada_matriz');

   if ColigadaFiltrada <> nil then
   begin
      tblProfessores.SQL.Add('AND c.cd_coligada = :cd_coligada');
      tblProfessores.ParamByName('cd_coligada').AsInteger := ColigadaFiltrada.Codigo;
   end else begin
      tblProfessores.SQL.Add(Format('AND c.cd_coligada IN (%s)', [DM.UsuarioLogado.GetColigadasFilhaSelecionada()]));
   end;

   tblProfessores.SQL.Add('GROUP BY p.cd_pessoa');
   tblProfessores.SQL.Add('ORDER BY p.nm_pessoa');

   tblProfessores.ParamByName('cd_coligada_matriz').AsInteger := DM.UsuarioLogado.ColigadaLogada;

   tblProfessores.Open;

   AbrirQueryTurmasProfessores();
end;

procedure TfrmProfessores.AbrirQueryTurmasProfessores;
begin
   if NOT(tblProfessores.State in [dsBrowse]) then Exit;

   tblTurmasProfessores.Close;
   tblTurmasProfessores.SQL.Clear();

   tblTurmasProfessores.SQL.Add(' SELECT ');
   tblTurmasProfessores.SQL.Add(' IFNULL( '+
   '                                tp.nr_carga_horaria_efetiva, '+
   '                                (  '+
   '                                   SELECT '+
   '                                      gd.VL_VALOR '+
   '                                   FROM '+
   '                                      grades_disciplinas GD '+
   '                                   WHERE '+
   '                                      gd.CD_GRADE = t.cd_grade '+
   '                                      AND gd.CD_CURSO = t.curso '+
   '                                      AND gd.CD_DISCIPLINA = tp.disciplina '+
   '                                      AND gd.NR_SERIE = t.serie '+
   '                                ) '+
	'                              ) AS ch_efetiva_teste, ');
   tblTurmasProfessores.SQL.Add(' tp.*, (SELECT gd.VL_VALOR FROM grades_disciplinas GD WHERE gd.CD_GRADE = t.cd_grade AND gd.CD_CURSO = t.curso AND gd.CD_DISCIPLINA = tp.disciplina AND gd.NR_SERIE = t.serie) as cargaHoraria, ');
   tblTurmasProfessores.SQL.Add(' (SELECT nr_aulas FROM grades_disciplinas GD WHERE gd.CD_GRADE = t.cd_grade AND gd.CD_CURSO = t.curso AND gd.CD_DISCIPLINA = tp.disciplina AND gd.NR_SERIE = t.serie) as creditosFinanceiros, ');
   tblTurmasProfessores.SQL.Add(' (SELECT NR_CREDITOS_ACADEMICOS FROM grades_disciplinas GD WHERE gd.CD_GRADE = t.cd_grade AND gd.CD_CURSO = t.curso AND gd.CD_DISCIPLINA = tp.disciplina AND gd.NR_SERIE = t.serie) as creditosAcademicos ');
   tblTurmasProfessores.SQL.Add(' FROM TURMASPROFESSORES tp ');
   tblTurmasProfessores.SQL.Add('      INNER JOIN TURMAS t ON (t.codigo = tp.turma AND t.anosemestre = tp.anosemestre AND t.curso = tp.curso) ');
   tblTurmasProfessores.SQL.Add(' WHERE tp.professor = :cd_pessoa AND tp.anosemestre = :AnoSemestre');
   tblTurmasProfessores.SQL.Add(Format('AND t.cd_coligada IN (%s)', [DM.GetTodasColigadas]));

   if not UMFiltroDataAnoSem.UsaAnoSemestre then
   begin
      if UMFiltroDataAnoSem.getTurmasAtivas = 1 then
      begin
         tblTurmasProfessores.SQL.Add(' AND t.sn_ativa = :sn_ativa');
         tblTurmasProfessores.ParamByName('sn_ativa').AsInteger := UMFiltroDataAnoSem.getTurmasAtivas();
      end;

      if ( UMFiltroDataAnoSem.FiltroDataCheckBoxDataInicio.Checked ) then
      begin
         tblTurmasProfessores.SQL.Add(' AND DATE_FORMAT(t.datainicio, :formato) >= :datainicio ');
         tblTurmasProfessores.ParamByName('datainicio').AsString := UMFiltroDataAnoSem.getDataInicio();
      end;

      if ( UMFiltroDataAnoSem.FiltroDataCheckBoxDataFim.Checked ) then
      begin
         tblTurmasProfessores.SQL.Add(' AND DATE_FORMAT(t.datafim, :formato) <= :datafim ');
         tblTurmasProfessores.ParamByName('datafim').AsString := UMFiltroDataAnoSem.getDataFim();
      end;

      if UMFiltroDataAnoSem.FiltroDataCheckBoxDataInicio.Checked OR
         UMFiltroDataAnoSem.FiltroDataCheckBoxDataFim.Checked then
         tblTurmasProfessores.ParamByName('formato').AsString := DATE_FORMAT_GERAL;
   end;

   tblTurmasProfessores.ParamByname('cd_pessoa').AsInteger := tblProfessorescd_pessoa.AsInteger;
   tblTurmasProfessores.ParamByName('AnoSemestre').AsInteger := StrToInt(txtAnoSemestre.Text);

   tblTurmasProfessores.Open;

   tblTurmasProfessores.First;

   tblObsProfessor.Close;
   tblObsProfessor.ParamByName('cd_pessoa').AsInteger := tblProfessorescd_pessoa.AsInteger;
   tblObsProfessor.Open;
end;

procedure TfrmProfessores.AtualizaMaterialApoio(const AIAnoSemestre,
   AICodProfessorAtual, AICodProfessorNovo, AICodDisciplina: integer;
   const ASCodTurma: string);
var
   qyInsAnexo, qyAnexo, qyMatProfessor, qyInsMaterial, qyInsMatTurma: TUMZQuery;
begin
   dm.CriarConsulta(qyInsAnexo);
   dm.CriarConsulta(qyAnexo);
   dm.CriarConsulta(qyMatProfessor);
   dm.CriarConsulta(qyInsMaterial);
   dm.CriarConsulta(qyInsMatTurma);

   qyAnexo.SQL.Text := ' '+
   'INSERT INTO map_anexos (me_conteudo, cd_material, nr_tamanho) ' +
   'SELECT me_conteudo, :novo_cd_material, nr_tamanho             ' +
   ' FROM map_anexos                                              ' +
   ' WHERE cd_material = :cd_material                             ';
   
   qyInsAnexo.SQL.Text := ' '+
      'SELECT me_conteudo, cd_material, nr_tamanho ' +
      ' FROM map_anexos                            ' +
      ' WHERE cd_material = :cd_material           ';

   qyMatProfessor.SQL.Text := 'SELECT '+
                              '	om.codmaterial, '+
                              '	om.titulo, '+
                              '	om.descricao, '+
                              '	om.arquivo, '+
                              '	om.link, '+
                              '	om.nr_anosemestre, '+
                              '	om.nm_arquivo '+
                              'FROM '+
                              '	map_materialprofessor om '+
                              '		JOIN map_materialprofessor_turma omt ON '+
                              '			(om.codmaterial = omt.cd_material) '+
                              'WHERE '+
                              '	om.codprofessor = :codprofessor AND '+
                              '	omt.cd_turma = :cd_turma AND '+
                              '   omt.cd_disciplina = :cd_disciplina AND '+
                              '   om.nr_anosemestre = :nr_anosemestre AND '+
                              '   om.cd_professor_original <> :cd_professor_novo ';

   qyInsMaterial.SQL.Text := ' INSERT INTO map_materialprofessor '+
                             '   (codprofessor, titulo, descricao, arquivo, link, nr_anosemestre, nm_arquivo, cd_professor_original) '+
                             ' VALUES '+
                             '   (:codprofessor, :titulo, :descricao, :arquivo, :link, :nr_anosemestre, :nm_arquivo, :cd_professor_original) ';

   qyInsMatTurma.SQL.Text := ' INSERT INTO '+
                             '	map_materialprofessor_turma (cd_material, cd_turma, cd_disciplina, nr_anosemestre) '+
                             ' VALUES '+
                             '	(:cd_material, :cd_turma, :cd_disciplina, :nr_anosemestre) ';

   qyMatProfessor.Close;
   qyMatProfessor.ParamByName('codprofessor').AsInteger := AICodProfessorAtual;
   qyMatProfessor.ParamByName('cd_disciplina').AsInteger := AICodDisciplina;
   qyMatProfessor.ParamByName('nr_anosemestre').AsInteger := AIAnoSemestre;
   qyMatProfessor.ParamByName('cd_turma').AsString := ASCodTurma;
   qyMatProfessor.ParamByName('cd_professor_novo').AsInteger := AICodProfessorNovo;
   try
      qyMatProfessor.Open;
      while not qyMatProfessor.Eof do
      begin
         qyInsMaterial.ParamByName('codprofessor').AsInteger := AICodProfessorNovo;
         qyInsMaterial.ParamByName('titulo').AsString := qyMatProfessor.FieldByName('titulo').AsString;
         qyInsMaterial.ParamByName('descricao').AsString := qyMatProfessor.FieldByName('descricao').AsString;
         qyInsMaterial.ParamByName('arquivo').AsString := qyMatProfessor.FieldByName('arquivo').AsString;
         qyInsMaterial.ParamByName('link').AsString := qyMatProfessor.FieldByName('link').AsString;
         qyInsMaterial.ParamByName('nr_anosemestre').AsInteger := qyMatProfessor.FieldByName('nr_anosemestre').AsInteger;
         qyInsMaterial.ParamByName('nm_arquivo').AsString := qyMatProfessor.FieldByName('nm_arquivo').AsString;
         qyInsMaterial.ParamByName('cd_professor_original').AsInteger := AICodProfessorAtual;
         qyInsMaterial.ExecSQL;
         qyInsMatTurma.ParamByName('cd_material').AsInteger := DM.LastInsert;
         qyInsMatTurma.ParamByName('cd_disciplina').AsInteger := AICodDisciplina;
         qyInsMatTurma.ParamByName('cd_turma').AsString := ASCodTurma;
         qyInsMatTurma.ParamByName('nr_anosemestre').AsInteger := qyMatProfessor.FieldByName('nr_anosemestre').AsInteger;
         qyInsMatTurma.ExecSQL;

         //Transfere anexo para novo registro do material de apoio do novo professor.
         qyInsAnexo.Close;
         qyInsAnexo.ParamByName('cd_material').AsInteger := qyMatProfessor.FieldByName('codmaterial').AsInteger;
         qyInsAnexo.Open;

         if (qyInsAnexo.RecordCount > 0) then
         begin
            qyAnexo.ParamByName('cd_material').AsInteger := qyMatProfessor.FieldByName('codmaterial').AsInteger;
            qyAnexo.ParamByName('novo_cd_material').AsInteger := dm.LastInsert;
            qyAnexo.ExecSQL;          
         end;

         qyMatProfessor.Next;
      end;
   finally
      qyMatProfessor.Close;
   end;
end;

procedure TfrmProfessores.AtualizaProducaoAcademica(const AIAnoSemestre,
   AICodProfessorAtual, AICodProfessorNovo, AICodDisciplina: integer;
   const ASCodTurma: string);
const
   SQL_UPDATE_PROCESSO = ' UPDATE ' +
                         '    prod_processo p ' +
                         '	   INNER JOIN prod_turmasprocesso tp ON (tp.cd_processo = p.cd_processo) ' +
                         ' SET ' +
                         '    p.cd_professor = :cd_professor_novo ' +
                         ' WHERE ' +
                         '    p.cd_professor = :cd_professor_antigo ' +
                         '    AND tp.cd_disciplina = :cd_disciplina ' +
                         '    AND tp.cd_turma = :cd_turma ' +
                         '    AND tp.nr_anosemestre = :nr_anosemestre ';
var
   qyAtualizarProcesso: TUMZQuery;
begin
   dm.CriarConsulta(qyAtualizarProcesso);
   qyAtualizarProcesso.SQL.Text := SQL_UPDATE_PROCESSO;

   qyAtualizarProcesso.ParamByName('cd_professor_novo').AsInteger := AICodProfessorNovo;
   qyAtualizarProcesso.ParamByName('cd_professor_antigo').AsInteger := AICodProfessorAtual;
   qyAtualizarProcesso.ParamByName('cd_disciplina').AsInteger := AICodDisciplina;
   qyAtualizarProcesso.ParamByName('cd_turma').AsString := ASCodTurma;
   qyAtualizarProcesso.ParamByName('nr_anosemestre').AsInteger := AIAnoSemestre;

   qyAtualizarProcesso.ExecSQL;
end;

procedure TfrmProfessores.btnBuscarProfessorClick(Sender: TObject);
var
   resultado_filtro : TResultadoFiltroPessoa;
begin
   resultado_filtro := TfrmSelecionarPessoa.Filtrar([], afpProfessor);

  if not resultado_filtro.filtrado then Exit;

  { Botão Pesquisar }

  if not tblProfessores.Locate('cd_pessoa', resultado_filtro.cd_pessoa, []) AND 
      (ColigadaFiltrada <> nil) then
  begin
     ColigadaFiltrada := nil;
     AbrirQueryProfessores;

     tblProfessores.Locate('cd_pessoa', resultado_filtro.cd_pessoa, []);
  end;

//  frm_Sel_Pessoa.qryPessoa.Close;

end;

procedure TfrmProfessores.pgProfessoresChanging(Sender: TObject;
  var AllowChange: Boolean);
begin
   if (tblProfessores.IsEmpty) or ( not tblProfessores.Active ) Then
   Begin
      Mensagem('Selecione um professor.', 'Atenção', MB_OK + MB_ICONWARNING);
      AllowChange := False;
      Exit;
   End;

   CarregarUnidadesProfessor();
   AbrirQueryTurmasProfessores();
end;

procedure TfrmProfessores.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  case Key of
    VK_F1 : PrincipalForm.confSobreClick( nil );
    VK_F8 : if btnBuscarProfessor.Enabled then btnBuscarProfessorClick( nil );
    VK_F12: if btnFechar.Enabled then btnFecharClick( nil );
  end;
end;

procedure TfrmProfessores.DBGrid1TitleClick(Column: TColumn);
Var strAux : String;
begin
     Case Column.Index of
       0 : strAux := 'cd_pessoa';
       1 : strAux := 'nm_pessoa';
       2 : strAux := 'dt_nascimento';
       3 : strAux := 'nm_apelido';
       4 : strAux := 'cd_titulacao';
       5 : strAux := 'cd_area';
     End;

     tblProfessores.SortedFields := strAux;
end;

procedure TfrmProfessores.tblTurmasProfessoresBeforeClose(DataSet: TDataSet);
begin
   if tblTurmasProfessores.State IN [dsInsert, dsEdit] then begin
       tblTurmasProfessores.Post;
   end;
   {  Não deve executar neste local
   Self.corrigeHorariosTurma(
                        StrToInt(txtAnoSemestre.Text),
                        tblTurmasProfessores.FieldByName('Disciplina').AsInteger,
                        tblTurmasProfessores.FieldByName('Turma').AsString
                        );
                        }
end;

procedure TfrmProfessores.tblTurmasProfessoresBeforeDelete(
  DataSet: TDataSet);
begin
   { Registrar um histórico das turmas e disciplinas do professor }

   tblObsProfessor.Edit;

   if Trim(tblObsProfessords_obs_sistema.AsString) <> '' Then
      tblObsProfessords_obs_sistema.AsString := tblObsProfessords_obs_sistema.AsString + CHR(13) + CHR(13);

   tblObsProfessords_obs_sistema.AsString := tblObsProfessords_obs_sistema.AsString +
   '[Retirada turma do professor]' + #13 +
	 'Turma: ' + tblTurmasProfessoresTurma.AsString + #13 +
   'Disciplina: ' + tblTurmasProfessoresDisciplina.AsString + ' - ' + tblTurmasProfessoresNomeDisciplina.AsString + #13  +
	 'Ano/Sem: ' + tblTurmasProfessoresAnoSemestre.DisplayText + #13   +
   'Saída: ' + dateToStr(DataHoje) + #13  +
   'Usuário realizou operação: ' + IntToStr(DM.iCdPessoaLogado) + ' - ' + DM.sLogin;

   tblObsProfessor.Post;
   {  Não deve ter esta rotina aqui
   Self.corrigeHorariosTurma(
                        StrToInt(txtAnoSemestre.Text),
                        tblTurmasProfessores.FieldByName('Disciplina').AsInteger,
                        tblTurmasProfessores.FieldByName('Turma').AsString
                        );
   }

end;

procedure TfrmProfessores.tblTurmasProfessoresBeforePost(DataSet: TDataSet);
begin
   if tblTurmasProfessoresds_sala.AsString = '' then
      tblTurmasProfessoresds_sala.clear;
end;

procedure TfrmProfessores.ToolButton3Click(Sender: TObject);
begin
   tblObsProfessor.Edit;

   if frm_professores_obs = nil then
      Application.CreateForm(Tfrm_Professores_Obs, frm_Professores_Obs);

   frm_professores_obs.ShowModal;
end;

procedure TfrmProfessores.tblTurmasProfessoresNewRecord(DataSet: TDataSet);
begin
   { Iniciar sempre com a primeira categoria de professor }
   tblTurmasProfessorescd_categoria.AsInteger := 1;
end;

procedure TfrmProfessores.btnMostrarTurmasClick(Sender: TObject);
begin
   if DM.UsuarioLogado.TemPermissao(1117, npIncluir, true) then
   begin
     { Apresentar as Turmas cadastradas no Ano Semestre Selecionado
       Para então arrastar para o Professor }
     tblGrade.Close();
     tblGrade.ParamByName('Professor').AsInteger := tblProfessorescd_pessoa.AsInteger;
     tblGrade.ParamByName('AnoSemestre').AsInteger := StrToInt(txtAnoSemestre.Text);

     tblGrade.Open();
     tblGrade.FetchAll();

      if (frmTableFields = nil) then begin
         Application.CreateForm( TfrmTableFields, frmTableFields );
      end;
     frmTableFields.Left := 65;
     frmTableFields.Tag := 2; // Isso vai indicar que está aberto a janela de Grade
     frmTableFields.ConstroiTreeGradeProf;
     frmTableFields.Show;
   end;
end;

procedure TfrmProfessores.CadastrodeProfessorComplementaresClick(Sender: TObject);
begin
   if not DM.UsuarioLogado.TemPermissao( 1002, npAcesso, True ) then Exit;

   if (DM.variavel_parametro('sn_africa') = 'S') then begin
      if not PrincipalForm.ProcuraForm( TForm(fProfessoresAfrica) ) then
      begin
         Application.CreateForm( TfProfessoresAfrica, fProfessoresAfrica );
         fProfessoresAfrica.tblPessoa.Close;
         fProfessoresAfrica.tblPessoa.Sql.Text := 'SELECT * FROM pessoas WHERE cd_pessoa = ' + tblProfessorescd_pessoa.AsString;
         fProfessoresAfrica.tblPessoa.Open;
         fProfessoresAfrica.pgPessoa.activePage :=  fProfessoresAfrica.tsComplementares;
         fProfessoresAfrica.pgPessoaChange(Self);
      end
      else
      begin
         fProfessoresAfrica.Show;
         fProfessoresAfrica.tblPessoa.Close;
         fProfessoresAfrica.tblPessoa.Sql.Text := 'SELECT * FROM pessoas WHERE cd_pessoa = ' + tblProfessorescd_pessoa.AsString;
         fProfessoresAfrica.tblPessoa.Open;
         fProfessoresAfrica.pgPessoa.activePage := fProfessoresAfrica.tsComplementares;
         fProfessoresAfrica.pgPessoaChange(Self);
      end;

   end
   else begin
      if not PrincipalForm.ProcuraForm( TForm(frm_Professores) ) then
      begin
         Application.CreateForm( Tfrm_Professores, frm_Professores );
         frm_professores.tblPessoa.Close;
         frm_professores.tblPessoa.Sql.Text := 'SELECT * FROM pessoas WHERE cd_pessoa = ' + tblProfessorescd_pessoa.AsString;
         frm_professores.tblPessoa.Open;
         frm_professores.pgPessoa.activePage := frm_professores.tsComplementares;
         frm_professores.pgPessoaChange(Self);
      end
      else
      begin
         frm_Professores.Show;
         frm_professores.tblPessoa.Close;
         frm_professores.tblPessoa.Sql.Text := 'SELECT * FROM pessoas WHERE cd_pessoa = ' + tblProfessorescd_pessoa.AsString;
         frm_professores.tblPessoa.Open;
         frm_professores.pgPessoa.activePage := frm_professores.tsComplementares;
         frm_professores.pgPessoaChange(Self);
      end;
   end;
end;

procedure TfrmProfessores.CadastrodeProfessorClick(Sender: TObject);
begin
   if not DM.UsuarioLogado.TemPermissao( 1002, npAcesso, True ) then Exit;
   if (DM.variavel_parametro('sn_africa') = 'S') then begin
      if not PrincipalForm.ProcuraForm( TForm(fProfessoresAfrica) ) then
      begin
         Application.CreateForm( TfProfessoresAfrica, fProfessoresAfrica );
         fProfessoresAfrica.tblPessoa.Close();
         fProfessoresAfrica.tblPessoa.Sql.Text := 'SELECT * FROM pessoas WHERE cd_pessoa = ' + tblProfessorescd_pessoa.AsString;
         fProfessoresAfrica.tblPessoa.Open;
         fProfessoresAfrica.pgPessoa.activePage := fProfessoresAfrica.tsDadosPessoais;
         fProfessoresAfrica.pgPessoaChange(Self);
      end
      else
      begin
         fProfessoresAfrica.Show;
         fProfessoresAfrica.tblPessoa.Close;
         fProfessoresAfrica.tblPessoa.Sql.Text := 'SELECT * FROM pessoas WHERE cd_pessoa = ' + tblProfessorescd_pessoa.AsString;
         fProfessoresAfrica.tblPessoa.Open;
         fProfessoresAfrica.pgPessoa.activePage := frm_professores.tsDadosPessoais;
         fProfessoresAfrica.pgPessoaChange(Self);
      end;
   end
   else begin
      if not PrincipalForm.ProcuraForm( TForm(frm_Professores) ) then
      begin
         Application.CreateForm( Tfrm_Professores, frm_Professores );
         frm_professores.tblPessoa.Close;
         frm_professores.tblPessoa.Sql.Text := 'SELECT * FROM pessoas WHERE cd_pessoa = ' + tblProfessorescd_pessoa.AsString;
         frm_professores.tblPessoa.Open;
         frm_professores.pgPessoa.activePage := frm_professores.tsDadosPessoais;
         frm_professores.pgPessoaChange(Self);
      end
      else
      begin
         frm_Professores.Show;
         frm_professores.tblPessoa.Close;
         frm_professores.tblPessoa.Sql.Text := 'SELECT * FROM pessoas WHERE cd_pessoa = ' + tblProfessorescd_pessoa.AsString;
         frm_professores.tblPessoa.Open;
         frm_professores.pgPessoa.activePage := frm_professores.tsDadosPessoais;
         frm_professores.pgPessoaChange(Self);
      end;
   end;
end;

procedure TfrmProfessores.CarregarUnidades;
var
   I, QtdUnidades: Integer;
begin
   QtdUnidades := DM.UsuarioLogado.GetListaColigadasFilhaSelecionada().Count;
   pnFiltroUnidadeEnsino.Visible := ( QtdUnidades > 1 );

   ColigadaFiltrada := nil;
   if QtdUnidades = 1 then
   begin
      ColigadaFiltrada := TColigada(DM.UsuarioLogado.GetListaColigadasFilhaSelecionada.Items[0]);
      Exit;
   end;
end;

procedure TfrmProfessores.CarregarUnidadesProfessor;
var
   qyListaColigadasProfessor : TUMZReadOnlyQuery;
begin
   DM.CriarConsulta(qyListaColigadasProfessor);
   cbUnidadeEnsinoProfessor.Clear;

   qyListaColigadasProfessor.SQL.Text := ' SELECT cd_coligada, nm_coligada FROM coligadas WHERE cd_coligada IN (%s) ORDER BY nm_coligada ';
   qyListaColigadasProfessor.SQL.Text := Format(qyListaColigadasProfessor.SQL.Text, [tblProfessoreslista_coligadas_professor.AsString]);
   qyListaColigadasProfessor.Open;

   cbUnidadeEnsinoProfessor.AddItem('- Todas as Unidades -', nil);
   cbUnidadeEnsinoProfessor.ItemIndex := 0;
   while not qyListaColigadasProfessor.Eof do
   begin
      cbUnidadeEnsinoProfessor.AddItem(
         qyListaColigadasProfessor.FieldByName('nm_coligada').AsString,
         TColigada.Create(
            qyListaColigadasProfessor.FieldByName('cd_coligada').AsInteger,
            qyListaColigadasProfessor.FieldByName('nm_coligada').AsString
         )
      );

      if ( ColigadaFiltrada <> nil ) AND
         ( qyListaColigadasProfessor.FieldByName('cd_coligada').AsInteger = ColigadaFiltrada.Codigo ) then
      begin
         cbUnidadeEnsinoProfessor.ItemIndex := cbUnidadeEnsinoProfessor.Items.Count - 1;
      end;

      qyListaColigadasProfessor.Next;
   end;

   Panel3.Height := 65;
   cbUnidadeEnsinoProfessor.Visible := True;
   lbUnidadeEnsinoProfessor.Visible := True;

   cbUnidadeEnsinoProfessor.ItemIndex := 0;

   if qyListaColigadasProfessor.RecordCount = 1 then
   begin
      cbUnidadeEnsinoProfessor.ItemIndex := 1;
      Panel3.Height := 40;
      cbUnidadeEnsinoProfessor.Visible := False;
      lbUnidadeEnsinoProfessor.Visible := False;
   end;

   FreeAndNil(qyListaColigadasProfessor);
end;

function TfrmProfessores.unicoProfessorTurmaDisciplina(): Boolean;
begin
   qyVerificaUnicoProfessor.Close;

   qyVerificaUnicoProfessor.ParamByName('nr_anosemestre').AsInteger := tblTurmasProfessores.FieldByName('AnoSemestre').AsInteger;
   qyVerificaUnicoProfessor.ParamByName('cd_curso').AsString := tblTurmasProfessores.FieldByName('Curso').AsString;
   qyVerificaUnicoProfessor.ParamByName('cd_turma').AsString := tblTurmasProfessores.FieldByName('Turma').AsString;
   qyVerificaUnicoProfessor.ParamByName('cd_disciplina').AsInteger := tblTurmasProfessores.FieldByName('disciplina').AsInteger;
   qyVerificaUnicoProfessor.ParamByName('cd_professor').AsInteger := tblTurmasProfessores.FieldByName('Professor').AsInteger;

   qyVerificaUnicoProfessor.Open;

   // Verifica se existem mais professores na turma/disciplina
   if qyVerificaUnicoProfessor.FieldByName('quantidade').AsInteger > 0 then
      // Existe mais professores da turma então ele não é o único professor da turma/disciplina
      unicoProfessorTurmaDisciplina := false
   else
      // Somente esse professor está lecionando a turma/disciplina
      unicoProfessorTurmaDisciplina := true;
end;

procedure TfrmProfessores.ToolButton7Click(Sender: TObject);
var
   excluir, iCodPessoa, iColigada: Integer;
   msgAceiteExclusao : String;
begin
   if DM.UsuarioLogado.TemPermissao(1117, npExcluir, true) then
   begin
      msgAceiteExclusao := 'Caso queira apenas trocar o professor da turma nesta disciplina, não utilize esta opção, utilize o botão "Trocar Prof. da Turma".'+chr(13)+'Deseja realmente retirar esta turma deste professor ?';
      // Verifica se a turma/disciplina do professor que está sendo excluída é somente lecionada por ele ou por outro professor também
      if unicoProfessorTurmaDisciplina() then
      begin
         msgAceiteExclusao := 'Você está removendo o único professor desta turma, ao realizar esta ação você poderá perder todos os registros de diário de classe desta disciplina. '+chr(13)+'Deseja Prosseguir?';
      end;

      // Existe outro(s) professor(es) para a turma/disciplina então permite ele remover essa turma/disciplina do professor
      if Mensagem('ATENÇÃO !'+chr(13)+msgAceiteExclusao,Application.Title,MB_YESNO + MB_ICONQUESTION ) = ID_YES then
      begin
         //Verifica se existem dados de ple e se pode ser excluido
         qryVerificaPle.Close;
         qryVerificaPle.ParamByName('turmaprof').AsString := tblTurmasProfessorescd_turmaprofessor.AsString;
         qryVerificaPle.Open;

         if not qryVerificaPle.IsEmpty then
         begin
            if qryVerificaPle.FieldByName('cd_situacao').AsInteger <> 1 then
            begin
               Mensagem('ATENÇÃO !'+chr(13)+'Não será possível prosseguir com a operação pois existem registros do Plano de Ensino vinculados a este professor nesta turma.',Application.Title,MB_OK + MB_ICONWARNING );
               Exit;
            end else begin
               qryDeletaPlanoEnsino.Close;
               qryDeletaPlanoEnsino.ParamByName('turmaprof').AsString := tblTurmasProfessorescd_turmaprofessor.AsString;
               qryDeletaPlanoEnsino.ExecSQL;
            end;
         end;

         excluirProfessorHorarios(
            tblTurmasProfessoresProfessor.AsInteger,
            tblTurmasProfessoresTurma.AsString,
            tblTurmasProfessoresAnoSemestre.AsInteger,
            tblTurmasProfessoresdisciplina.AsInteger
         );

         // Pega dados para atualizar grupos
         iCodPessoa := tblTurmasProfessoresProfessor.AsInteger;
         iColigada := DM.getColigadaByTurma(
                     tblTurmasProfessoresTurma.AsString,
                     tblTurmasProfessoresAnoSemestre.AsInteger
                  );
         tblTurmasProfessores.Delete;

         // atualiza os grupos
         DM.atualizarGruposPessoa(iCodPessoa, iColigada);
      end;
   end;
end;

procedure TfrmProfessores.ToolButton10Click(Sender: TObject);
begin
   if DM.UsuarioLogado.TemPermissao(1117, npIncluir, true) then
   begin
      {if cbUnidadeEnsinoProfessor.ItemIndex < 1 then
      begin
         Mensagem('Selecione uma Unidade de Ensino.', '', MB_OK + MB_ICONINFORMATION, Handle);
         cbUnidadeEnsinoProfessor.SetFocus;
         Exit;
      end;}

     { Apresentar as Disciplinas }
      if (frmTableFields = nil) then begin
         Application.CreateForm( TfrmTableFields, frmTableFields );
      end;

      frmTableFields.Left := 525;
      frmTableFields.Tag := 1; // Isso vai indicar que está aberto a janela de Disciplinas

      frmTableFields.pnlFiltraDisc.Visible := True;

      frmTableFields.Show;
   end;
end;

function TfrmProfessores.professorLecionaTurma(): Boolean;
begin
   qyVerificaProfessorTurma.Close;

   qyVerificaProfessorTurma.ParamByName('cd_curso').AsString := tblProfessoresDisciplinas.FieldByName('Curso').AsString;
   qyVerificaProfessorTurma.ParamByName('cd_disciplina').AsInteger := tblProfessoresDisciplinas.FieldByName('disciplina').AsInteger;
   qyVerificaProfessorTurma.ParamByName('cd_professor').AsInteger := tblProfessoresDisciplinas.FieldByName('Professor').AsInteger;

   qyVerificaProfessorTurma.Open;

   // Verifica se o professor leciona em alguma turma da disciplina que está sendo retirada (em qualquer anosemestre)
   if qyVerificaProfessorTurma.FieldByName('quantidade').AsInteger > 0 then
      // Professor leciona em 1 ou mais turmas na disciplina (em qualquer anosemestre)
      professorLecionaTurma := true
   else
      // Professor não está lecionando em nenhuma turma dessa disciplina
      professorLecionaTurma := false;
end;

procedure TfrmProfessores.registraLogTrocarProfessorTurma(
  cd_professor_substituto, cd_professor_substituido, nr_anosemestre,
  cd_disciplina: Integer; nm_professor_substituto, nm_professor_substituido,
  cd_turma, cd_curso, nm_disciplina: String);
var
  novo_ds_obs_sistema, ds_obs_sistema: String;
  i, cd_professor : Integer;
  qrynome: TUMZQuery;
begin
   tblObsProfessor.Close();
   i:= 1;

   dm.CriarConsulta(qrynome);



   while i < 3 do
      Begin
         // Se o contador (i) for 1 cod_professor é igual ao codigo do professor substituido
         // caso contrario é igual ao codigo do professor substituto
         if ( i = 1 ) then
            begin
              cd_professor:= cd_professor_substituido;
            end
         else
            begin
              cd_professor:= cd_professor_substituto;
            end;

         tblObsProfessor.Close();

         tblObsProfessor.ParamByName('cd_pessoa').AsInteger := cd_professor;

         tblObsProfessor.Open();
         
         ds_obs_sistema := tblObsProfessor.FieldByName('ds_obs_sistema').AsString;

         tblObsProfessor.Close();
         
         novo_ds_obs_sistema := ds_obs_sistema + #13 + #13  +
         '[Troca Professor da Turma]' + #13 +
         'Professor(a) anterior: ' + nm_professor_substituido + #13 +
         'Professor(a) novo(a): ' + nm_professor_substituto + #13 +
         'Turma: ' + cd_turma + #13 +
         'Disciplina: ' + nm_disciplina + #13 +
         'Ano/Sem: ' + IntToStr(nr_anosemestre) + #13   +
         'Saída: ' + dateToStr(DataHoje) + #13  +
         'Usuário realizou operação: ' + IntToStr(DM.iCdPessoaLogado) + ' - ' + DM.sLogin;
         
         qrynome.SQL.Text := 'UPDATE ' +
         ' professores ' +
         'SET ' +
         ' ds_obs_sistema = :log_ds_obs_sistema ' +
         'WHERE ' +
         ' cd_pessoa = :cd_professor';

         qrynome.ParamByName('log_ds_obs_sistema').AsString := novo_ds_obs_sistema;

         qrynome.ParamByName('cd_professor').AsInteger := cd_professor;

         qrynome.ExecSQL();

         qrynome.Close();


         i:= i + 1;
      end;

   tblObsProfessor.Close();
end;

procedure TfrmProfessores.ToolButton11Click(Sender: TObject);
begin
   if DM.UsuarioLogado.TemPermissao(1117, npExcluir, true) then
   begin
      // Verifica se o professor leciona alguma turma para a disciplina que está sendo retirada
      if not professorLecionaTurma then
      begin
         // Pergunta se realmente deseja desvincular a disciplina do professor
         if Mensagem('Deseja confirmar a exclusão deste registro?',Application.Title,
            MB_YESNO + MB_ICONQUESTION ) = ID_YES then

            tblProfessoresDisciplinas.Delete;

            { removida esta programação deste local
            Self.corrigeHorariosTurma(
                  StrToInt(txtAnoSemestre.Text),
                  tblTurmasProfessores.FieldByName('Disciplina').AsInteger,
                  tblTurmasProfessores.FieldByName('Turma').AsString
            );
            }
      end else begin
         // Existem turmas lecionadas por esse professor com essa disciplina, então não é possível retirar a disciplina do professor
      if Mensagem('ATENÇÃO !'+chr(13)+' Você está removendo o único professor desta disciplina, ao realizar esta ação você poderá perder todos os registros de diário de classe desta disciplina. \n Deseja Prosseguir?".',Application.Title, MB_YESNO ) = ID_YES then
      begin
         tblProfessoresDisciplinas.Delete;
         {   removida esta programação deste local
            Self.corrigeHorariosTurma(
                  StrToInt(txtAnoSemestre.Text),
                  tblTurmasProfessores.FieldByName('Disciplina').AsInteger,
                  tblTurmasProfessores.FieldByName('Turma').AsString
            );
            }
      end;

      end;
   end;
end;

procedure TfrmProfessores.ToolButton8Click(Sender: TObject);
var
   cd_professor_substituto, cd_professor_substituido, nr_anosemestre, cd_disciplina: Integer;
   nm_professor_substituto, nm_professor_substituido, cd_turma, cd_curso, nm_disciplina: String;
   resultado_filtro : TResultadoFiltroPessoa;
   trocouProfessor: Boolean;
begin

   if DM.UsuarioLogado.TemPermissao(1117, npAlterar, true) then
   begin

      resultado_filtro := TfrmSelecionarPessoa.Filtrar([], afpProfessor);

      if not resultado_filtro.filtrado then Exit;

      if (resultado_filtro.Aba <> afpProfessor) and (resultado_filtro.Aba <> afpPessoa) then Exit;

      //se for o mesmo professor
     if (tblProfessorescd_pessoa.AsInteger = resultado_filtro.cd_pessoa) then Exit;

      cd_professor_substituto := resultado_filtro.cd_pessoa;
      cd_professor_substituido := tblTurmasProfessores.FieldByName('Professor').AsInteger;
      nr_anosemestre := tblTurmasProfessoresAnoSemestre.AsInteger;
      cd_disciplina := tblTurmasProfessores.FieldByName('Disciplina').AsInteger;

      nm_professor_substituto := resultado_filtro.nm_pessoa;
      nm_professor_substituido := tblProfessores.FieldByName('nm_pessoa').AsString;
      cd_turma := tblTurmasProfessores.FieldByName('Turma').AsString;
      cd_curso := tblTurmasProfessores.FieldByName('Curso').AsString;
      nm_disciplina := tblTurmasProfessores.FieldByName('NomeDisciplina').AsString;

      trocouProfessor := TrocarProfessorTurma(
         cd_professor_substituto,
         cd_professor_substituido,
         nr_anosemestre,
         cd_disciplina,
         nm_professor_substituto,
         nm_professor_substituido,
         cd_turma,
         cd_curso,
         nm_disciplina
      );

      if trocouProfessor then
      begin
         registraLogTrocarProfessorTurma(
            cd_professor_substituto,
            cd_professor_substituido,
            nr_anosemestre,
            cd_disciplina,
            nm_professor_substituto,
            nm_professor_substituido,
            cd_turma,
            cd_curso,
            nm_disciplina
         );
         if Mensagem( 'Troca de professor efetuada com sucesso !'+CHR(13)+CHR(13) +
                  'Deseja visualizar as turmas do professor '+ nm_professor_substituto + '?',
                  Application.Title, MB_YESNO + MB_ICONQUESTION + MB_DEFBUTTON2 ) = mrYes then
         begin
            tblProfessores.Locate('cd_pessoa', cd_professor_substituto, []);
         end else begin
            tblTurmasProfessores.Close;
            tblTurmasProfessores.ParamByname('cd_pessoa').AsInteger := cd_professor_substituido;
            tblTurmasProfessores.paramByName('AnoSemestre').AsInteger := nr_anosemestre;
            tblTurmasProfessores.Open;
         end;
      end;

   end;

end;

function TfrmProfessores.TrocarProfessorTurma(cd_professor_substituto, cd_professor_substituido, nr_anosemestre, cd_disciplina: Integer; nm_professor_substituto, nm_professor_substituido, cd_turma, cd_curso, nm_disciplina : String): Boolean;
var
   cd_turmaprofessor_inativo, cd_turmaprofessor_selecionado, iProfessorOrigem, iProfessorDestino, iColigada: integer;
begin
   Result := False;

   if DM.UsuarioLogado.TemPermissao(1117, npAlterar, true) then
   begin

      //se for o mesmo professor
     if (cd_professor_substituido = cd_professor_substituto) then Exit;

     // Abre a janela para trocar o professor da turma
     frmTrocarProfessorTurma := TfrmTrocarProfessorTurma.Create( self );
     frmTrocarProfessorTurma.setTurma(cd_turma);
     frmTrocarProfessorTurma.SetDisciplina(nm_disciplina);

     DM.tblAvaliacao.Close;
     DM.tblAvaliacao.ParamByName('AnoSemestre').AsInteger := nr_anosemestre;
     DM.tblAvaliacao.ParamByName('Turma').AsString := cd_turma;
     DM.tblAvaliacao.Open;

     frmTrocarProfessorTurma.SetTotalEtapas(DM.tblAvaliacaonr_avaliacoes.AsInteger);
     frmTrocarProfessorTurma.SetProfessorSubstituito(nm_professor_substituido);
     frmTrocarProfessorTurma.SetProfessorSubstituto(nm_professor_substituto);
     frmTrocarProfessorTurma.ShowModal();

     // captura o professor e a coligada em que será preciso realizar a execução da atualização de grupos
     iProfessorOrigem := cd_professor_substituido;
     iProfessorDestino := cd_professor_substituto;
     iColigada := DM.getColigadaByTurma(cd_turma, nr_anosemestre);

     // Verifica se deve trocar o professor da turma
     if not frmTrocarProfessorTurma.GetTrocarProfessor() then Exit;

     with DM.qyAux do begin

       // Verifica se deve manter o professor na AI (resultados e resolução)
       if frmTrocarProfessorTurma.ckManterProfessorAI.Checked then
       begin

         // Busca o cd_turmaprofessor do professor selecionado (cd_turmaprofessor que será atualizado na avaliação institucional)
         Close();
         SQL.Text := 'SELECT ' +
                     '  cd_turmaprofessor ' +
                     'FROM ' +
                     '  turmasprofessores ' +
                     'WHERE ' +
                     ' anosemestre = :nr_anosemestre AND ' +
                     ' curso = :cd_curso AND ' +
                     ' turma = :cd_turma AND ' +
                     ' disciplina = :cd_disciplina AND ' +
                     ' professor = :cd_professor ';

         ParamByName('nr_anosemestre').AsInteger := nr_anosemestre;
         ParamByName('cd_curso').AsString := cd_curso;
         ParamByName('cd_turma').AsString := cd_turma;
         ParamByName('cd_disciplina').AsInteger := cd_disciplina;
         ParamByName('cd_professor').AsInteger := cd_professor_substituido;
         Open();
         cd_turmaprofessor_selecionado := FieldByName('cd_turmaprofessor').AsInteger;


         // Busca o maior próximo codigo disponível em turmas professores
         Close();
         SQL.Text := 'SELECT MAX(cd_turmaprofessor) cd_turmaprofessor FROM turmasprofessores';
         Open();
         cd_turmaprofessor_inativo := FieldByName('cd_turmaprofessor').AsInteger;

         // Busca o maior próximo codigo disponível em turmas professores inativos
         Close();
         SQL.Text := 'SELECT CASE WHEN MAX(cd_turmaprofessor) IS NOT NULL THEN MAX(cd_turmaprofessor)+1 ELSE '+IntToStr(cd_turmaprofessor_inativo+1)+' END cd_turmaprofessor FROM uni_turmasprofessores_inativos WHERE cd_turmaprofessor > '+IntToStr(cd_turmaprofessor_inativo);
         Open();
         cd_turmaprofessor_inativo := FieldByName('cd_turmaprofessor').AsInteger;

         { Insere o professor substituido na tabela de turmas/professores inativos
           com o código de turma professor que está na sequencia }
         Close();
         SQL.Text := ' ' +
            'INSERT INTO uni_turmasprofessores_inativos ' +
            '     (cd_turmaprofessor, nr_anosemestre, cd_curso, cd_turma, cd_disciplina, cd_professor, nr_aulas,    cd_situacao, cd_categoria, ds_sala, cd_professor_substituto)' +
            ' SELECT ' +
            '    '+IntToStr(cd_turmaprofessor_inativo)+',  anosemestre,    curso,    turma,    disciplina,    professor,    numeroaulas, situacao,    cd_categoria, ds_sala, :cd_professor_substituto cd_professor_substituto ' +
            ' FROM ' +
            '     turmasprofessores ' +
            ' WHERE ' +
            '     anosemestre = :nr_anosemestre AND ' +
            '     curso = :cd_curso AND ' +
            '     turma = :cd_turma AND ' +
            '     disciplina = :cd_disciplina AND ' +
            '     professor = :cd_professor ';

         ParamByName('nr_anosemestre').AsInteger := nr_anosemestre;
         ParamByName('cd_curso').AsString := cd_curso;
         ParamByName('cd_turma').AsString := cd_turma;
         ParamByName('cd_disciplina').AsInteger := cd_disciplina;
         ParamByName('cd_professor').AsInteger := cd_professor_substituido;
         ParamByName('cd_professor_substituto').AsInteger := cd_professor_substituto;

         ExecSQL();

         { Adiciona um registro temporário na tabela de turmasprofessor e remove o mesmo na sequência
           Esse procedimento é realizado apenas para incrementar a chave da tabela de turmasprofessor,
           a fim de garantir que a mesma não caia com o mesmo codigo da tabela de uni_turmasprofessores_inativos }

         Close();
         SQL.Text := 'INSERT INTO turmasprofessores (anosemestre, curso, turma, disciplina, professor) VALUES (0, "temporario", "temporaria", 0, 0 )';
         ExecSQL();

         Close();
         SQL.Text := 'DELETE FROM turmasprofessores WHERE cd_turmaprofessor = LAST_INSERT_ID()';
         ExecSQL();

         { Ajuste do cd_turmaprofessor na tabela de respostas da avaliação institucional
           Objetivo é alterar as repostas que estão vinculadas ao novo professor e vincular as mesmas ao antigo professor }
         Close();
         SQL.Text := 'UPDATE avl_pesquisado_respostas SET cd_chave = :cd_turmaprofessor_inativo WHERE cd_chave = :cd_turmaprofessor_selecionado';
         ParamByName('cd_turmaprofessor_inativo').AsInteger := cd_turmaprofessor_inativo;
         ParamByName('cd_turmaprofessor_selecionado').AsInteger := cd_turmaprofessor_selecionado;
         ExecSQL();

         Close();
         SQL.Text := 'UPDATE avl_pesquisados SET cd_turmaprofessor = :cd_turmaprofessor_inativo WHERE cd_turmaprofessor = :cd_turmaprofessor_selecionado';
         ParamByName('cd_turmaprofessor_inativo').AsInteger := cd_turmaprofessor_inativo;
         ParamByName('cd_turmaprofessor_selecionado').AsInteger := cd_turmaprofessor_selecionado;
         ExecSQL();

       end;

       // Mudar o professor que foi substituido pelo professor substituto nos horários que o antigo professor lecionava
       Close();
       SQL.Text := 'UPDATE turmas_horarios_config SET cd_professor = :cd_professor_substituto ' +
                   'WHERE cd_professor = :cd_professor_substituido AND nr_anosemestre = :nr_anosemestre AND ' +
                   '      cd_turma = :cd_turma AND cd_disciplina = :cd_disciplina';
       ParamByName('cd_professor_substituto').AsInteger := cd_professor_substituto;
       ParamByName('cd_professor_substituido').AsInteger := cd_professor_substituido;
       ParamByName('nr_anosemestre').AsInteger := nr_anosemestre;
       ParamByName('cd_turma').AsString := cd_turma;
       ParamByName('cd_disciplina').AsInteger := cd_disciplina;
       ExecSQL();


       Close();
       SQL.Text := ' ' +
         'UPDATE ' +
         ' turmasprofessores ' +
         'SET ' +
         ' professor = :cd_novo_professor ' +
         'WHERE ' +
         ' anosemestre = :nr_anosemestre AND ' +
         ' curso = :cd_curso AND ' +
         ' turma = :cd_turma AND ' +
         ' disciplina = :cd_disciplina AND ' +
         ' professor = :cd_professor ';

       ParamByName('cd_novo_professor').AsInteger := cd_professor_substituto;

       ParamByName('nr_anosemestre').AsInteger := nr_anosemestre;
       ParamByName('cd_curso').AsString := cd_curso;
       ParamByName('cd_turma').AsString := cd_turma;
       ParamByName('cd_disciplina').AsInteger := cd_disciplina;
       ParamByName('cd_professor').AsInteger := cd_professor_substituido;

       ExecSQL();

       Close();
       SQL.Text := ' ' +
         'UPDATE ' +
         ' diario_turmas  ' +
         'SET ' +
         ' sn_manter_professor = 1 ' +
         'WHERE ' +
         ' anosemestre = :nr_anosemestre AND ' +
         ' curso = :cd_curso AND ' +
         ' turma = :cd_turma AND ' +
         ' disciplina = :cd_disciplina AND ' +
         ' professor = :cd_professor AND ' +
         ' bimestre < :bimestre';

       ParamByName('nr_anosemestre').AsInteger := nr_anosemestre;
       ParamByName('cd_curso').AsString := cd_curso;
       ParamByName('cd_turma').AsString := cd_turma;
       ParamByName('cd_disciplina').AsInteger := cd_disciplina;
       ParamByName('cd_professor').AsInteger := cd_professor_substituido;
       ParamByName('bimestre').AsInteger := (frmTrocarProfessorTurma.cbEtapa.ItemIndex+1);

       ExecSQL();

       Close();
       SQL.Text := ' ' +
         'UPDATE ' +
         ' diario_turmas  ' +
         'SET ' +
         ' professor = :cd_novo_professor ' +
         'WHERE ' +
         ' anosemestre = :nr_anosemestre AND ' +
         ' curso = :cd_curso AND ' +
         ' turma = :cd_turma AND ' +
         ' disciplina = :cd_disciplina AND ' +
         ' professor = :cd_professor AND ' +
         ' bimestre >= :bimestre';

       ParamByName('cd_novo_professor').AsInteger := cd_professor_substituto;

       ParamByName('nr_anosemestre').AsInteger := nr_anosemestre;
       ParamByName('cd_curso').AsString := cd_curso;
       ParamByName('cd_turma').AsString := cd_turma;
       ParamByName('cd_disciplina').AsInteger := cd_disciplina;
       ParamByName('cd_professor').AsInteger := cd_professor_substituido;
       ParamByName('bimestre').AsInteger := (frmTrocarProfessorTurma.cbEtapa.ItemIndex+1);

       ExecSQL();

       Close();

       if frmTrocarProfessorTurma.ckTransferirAulas.Checked then
       begin
          SQL.Text := ' ' +
            'UPDATE ' +
            ' diario_aulas ' +
            'SET ' +
            ' cd_professor = :cd_novo_professor ' +
            'WHERE ' +
            ' anosemestre = :nr_anosemestre AND ' +
            ' turma = :cd_turma AND ' +
            ' disciplina = :cd_disciplina AND ' +
            ' cd_professor = :cd_professor AND ' +
            ' bimestre >= :bimestre';

          ParamByName('cd_novo_professor').AsInteger := cd_professor_substituto;

          ParamByName('nr_anosemestre').AsInteger := nr_anosemestre;
          ParamByName('cd_turma').AsString := cd_turma;
          ParamByName('cd_disciplina').AsInteger := cd_disciplina;
          ParamByName('cd_professor').AsInteger := cd_professor_substituido;
          ParamByName('bimestre').AsInteger := (frmTrocarProfessorTurma.cbEtapa.ItemIndex+1);

          ExecSQL();
       end;

       if frmTrocarProfessorTurma.ckatribuircronogramas.Checked then
       begin
          SQL.Text := ' ' +
            'UPDATE ' +
            ' diario_cronogramas ' +
            'SET ' +
            ' cd_professor = :cd_novo_professor ' +
            'WHERE ' +
            ' anosemestre = :nr_anosemestre AND ' +
            ' turma = :cd_turma AND ' +
            ' disciplina = :cd_disciplina AND ' +
            ' cd_professor = :cd_professor ';

          ParamByName('cd_novo_professor').AsInteger := cd_professor_substituto;

          ParamByName('nr_anosemestre').AsInteger := nr_anosemestre;
          ParamByName('cd_turma').AsString := cd_turma;
          ParamByName('cd_disciplina').AsInteger := cd_disciplina;
          ParamByName('cd_professor').AsInteger := cd_professor_substituido;

          ExecSQL();
       end;

       if frmTrocarProfessorTurma.ckTransferirProvas.Checked then
       begin
          Close();
          SQL.Text := ' ' +
            'UPDATE ' +
            ' diario_provas ' +
            'SET ' +
            ' cd_professor = :cd_novo_professor ' +
            'WHERE ' +
            ' anosemestre = :nr_anosemestre AND ' +
            ' turma = :cd_turma AND ' +
            ' disciplina = :cd_disciplina AND ' +
            ' cd_professor = :cd_professor AND ' +
            ' bimestre >= :bimestre';

          ParamByName('cd_novo_professor').AsInteger := cd_professor_substituto;

          ParamByName('nr_anosemestre').AsInteger := nr_anosemestre;
          ParamByName('cd_turma').AsString := cd_turma;
          ParamByName('cd_disciplina').AsInteger := cd_disciplina;
          ParamByName('cd_professor').AsInteger := cd_professor_substituido;
          ParamByName('bimestre').AsInteger := (frmTrocarProfessorTurma.cbEtapa.ItemIndex+1);

          ExecSQL();
       end;

       Close();
       
       Self.corrigeHorariosTurma(
                           nr_anosemestre,
                           cd_disciplina,
                           cd_turma,
                           iProfessorDestino
                           );
                           
       Self.AtualizaMaterialApoio(
         nr_anosemestre,
         cd_professor_substituido,
         cd_professor_substituto,
         cd_disciplina,
         cd_turma);

       // Atualiza as produções acadêmicas, repassa para o novo professor da turma/disciplina
       Self.AtualizaProducaoAcademica(
         nr_anosemestre,
         cd_professor_substituido,
         cd_professor_substituto,
         cd_disciplina,
         cd_turma);

       // Adiciona a disciplina / curso que o professor leciona (caso já não estiver adicionada)
       Close();
       SQL.Text := 'INSERT IGNORE INTO professoresdisciplinas (professor,   disciplina,  curso) VALUES (:professor, :disciplina, :curso)';

       ParamByName('professor').AsInteger := cd_professor_substituto;
       ParamByName('disciplina').AsInteger := cd_disciplina;
       ParamByName('curso').AsString := cd_curso;

       ExecSQL();

     end;

     Result := True;

     // atualizar os grupos dos professores envolvidos
     DM.atualizarGruposPessoa(iProfessorOrigem, iColigada);
     DM.atualizarGruposPessoa(iProfessorDestino, iColigada);

   end;

end;

procedure TfrmProfessores.UMFiltroDataAnoSemChangeAnoSemestre(Sender: TObject;
  var Valor: Integer; Direction: TUpDownDirection);
begin
   DM.inc_dec_ano_semestre(valor, Direction);
end;

procedure TfrmProfessores.UMFiltroDataAnoSemUMSubCheckBoxckDataFimClick(
  Sender: TObject);
begin
   dsProfessoresDataChange(nil,nil);
end;

procedure TfrmProfessores.UMFiltroDataAnoSemUMSubCheckBoxckDataInicioClick(
  Sender: TObject);
begin
   dsProfessoresDataChange(nil,nil);
end;

procedure TfrmProfessores.UMFiltroDataAnoSemUMSubCheckBoxckTurmaAtivaClick(
  Sender: TObject);
begin
   dsProfessoresDataChange(nil,nil);
end;

procedure TfrmProfessores.UMFiltroDataAnoSemUMSubDateTimePickerdtpDataFimChange(
  Sender: TObject);
begin
   dsProfessoresDataChange(nil,nil);
end;

procedure TfrmProfessores.UMFiltroDataAnoSemUMSubDateTimePickerdtpDataInicioChange(
  Sender: TObject);
begin
   dsProfessoresDataChange(nil,nil);
end;

procedure TfrmProfessores.UMFiltroDataAnoSemUMSubMaskEditmeAnoSemestreChange(
  Sender: TObject);
begin
   dsProfessoresDataChange(nil,nil);
end;

{ TDBGridObj }

function TDBGridObj.CellRect(ACol, Arow: Integer): TRect;
begin
   Result := Inherited CellRect(ACol, ARow);
end;

end.

