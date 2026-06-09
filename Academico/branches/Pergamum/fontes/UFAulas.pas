unit UFAulas;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms, 
  Dialogs, ExtCtrls, StdCtrls, Buttons, ComCtrls, Spin, DB, ZAbstractRODataset,
  UZDataset, ToolWin, ImgList, Grids, DBGrids, UZSortedGrid, DBCGrids;

type
  TfrmAulas = class(TFrame)
    pnlFiltros: TPanel;
    pnlFiltrosLocal: TPanel;
    pnlFiltrosAula: TPanel;
    lbleEstado: TLabeledEdit;
    lbleMunicipios: TLabeledEdit;
    sbBuscarEstado: TSpeedButton;
    sbBuscarMunicipio: TSpeedButton;
    lbleUnidade: TLabeledEdit;
    sbBuscarUnidade: TSpeedButton;
    lbleCurso: TLabeledEdit;
    edtCurso: TEdit;
    lbleTurma: TLabeledEdit;
    lbleProfessor: TLabeledEdit;
    lbleDisciplina: TLabeledEdit;
    lbleGrupo: TLabeledEdit;
    sbBuscarCurso: TSpeedButton;
    sbBuscarTurma: TSpeedButton;
    edtProfessor: TEdit;
    edtDisciplina: TEdit;
    edtGrupo: TEdit;
    sbBuscarProfessor: TSpeedButton;
    sbBuscarDisciplina: TSpeedButton;
    sbBuscarGrupo: TSpeedButton;
    lblDataInicio: TLabel;
    dtpDataInicio: TDateTimePicker;
    lblDataFim: TLabel;
    dtpDataFim: TDateTimePicker;
    chkPeriodo: TCheckBox;
    chkEtapa: TCheckBox;
    spePeriodo: TSpinEdit;
    speEtapa: TSpinEdit;
    qryAulas: TUMZReadOnlyQuery;
    qryAulasCD_DIARIO_AULA: TLargeintField;
    qryAulasCD_TURMA: TStringField;
    qryAulasNR_ANOSEMESTRE: TSmallintField;
    qryAulasDS_DISCIPLINA: TStringField;
    qryAulasDS_SIGLA_DISCIPLINA: TStringField;
    qryAulasCD_DISCIPLINA: TIntegerField;
    qryAulasCD_CURSO: TStringField;
    qryAulasNR_BIMESTRE: TSmallintField;
    qryAulasDT_AULA: TDateTimeField;
    qryAulasSN_BLOQUEADO: TIntegerField;
    qryAulasNR_AULA: TSmallintField;
    qryAulasQTD_AULAS: TSmallintField;
    qryAulasCD_PROFESSOR: TIntegerField;
    qryAulasTX_CONTEUDO: TMemoField;
    qryAulasCD_COLIGADA: TIntegerField;
    qryAulasNM_COLIGADA: TStringField;
    qryAulasCD_AULA_TIPO: TIntegerField;
    bvlSep1: TBevel;
    tlbAcoes: TToolBar;
    ilAcoes: TImageList;
    btnSep1: TToolButton;
    btnColunas: TToolButton;
    btnSep2: TToolButton;
    btnIncluir: TToolButton;
    btnAlterar: TToolButton;
    btnExcluir: TToolButton;
    btnSep3: TToolButton;
    btnCopiar: TToolButton;
    btnFrequencia: TToolButton;
    btnSep4: TToolButton;
    btnFechar: TToolButton;
    btnSep5: TToolButton;
    bvlSep2: TBevel;
    dbgAulas: TZSortedGrid;
    dsAulas: TDataSource;
    bbtnFiltrar: TBitBtn;
    bbtnLimpar: TBitBtn;
    qryAulasSN_AULA_COMPARTILHADA: TSmallintField;
    qrySituacao: TUMZReadOnlyQuery;
    qrySituacaoCD_SITUACAO: TIntegerField;
    qrySituacaoDS_VALOR: TStringField;
    qryAulasCD_SITUACAO: TLargeintField;
    qryProfessoresFiltro: TUMZReadOnlyQuery;
    qryProfessoresFiltroCD_PESSOA: TIntegerField;
    qryProfessoresFiltroNM_PESSOA: TStringField;
    qryAulasDS_AULA_TIPO: TStringField;
    qryAulasNM_PROFESSOR: TStringField;
    qryAulasDS_SITUACAO: TStringField;
    qryAulasDS_ICONES: TStringField;
    procedure dbgAulasDrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumn; State: TGridDrawState);
    procedure btnColunasClick(Sender: TObject);
    procedure lbleProfessorExit(Sender: TObject);
    procedure lbleProfessorKeyPress(Sender: TObject; var Key: Char);
    procedure bbtnLimparClick(Sender: TObject);
    procedure bbtnFiltrarClick(Sender: TObject);
    procedure sbBuscarProfessorClick(Sender: TObject);
    procedure sbBuscarGrupoClick(Sender: TObject);
    procedure sbBuscarDisciplinaClick(Sender: TObject);
    procedure sbBuscarTurmaClick(Sender: TObject);
    procedure sbBuscarCursoClick(Sender: TObject);
    procedure sbBuscarUnidadeClick(Sender: TObject);
    procedure sbBuscarMunicipioClick(Sender: TObject);
    procedure sbBuscarEstadoClick(Sender: TObject);
  private
    { Private declarations }
      FParams: TParams;
      FFilters: TStrings;
      procedure AddFilter(const Expr: AnsiString; const Values: array of TVarRec); overload;
      procedure AddFilter(const Expr, ParamName: AnsiString; const Value: Variant); overload;
  public
    { Public declarations }
      constructor Create(AOwner: TComponent); override;
  end;

implementation

uses
   uDM, uFSelEstados, uFSelCidades, uFSelecionarColigada, uFSelecionarCurso,
   uFSelecionarTurma, uFSelecionarDisciplina, uFSelecionarGrupo,
   uFSelecionarPessoa, uCamposPlanilhas, uAulasProvasAcoes;

const
   SSQLFiltroEstados = 'C.`DS_ESTADO` IN (%s)';
   SSQLFiltroMunicipios = 'C.`CD_MUNICIPIO IN (%s)`';
   SSQLFiltroUnidade = 'T.`CD_COLIGADA` = :CD_COLIGADA';
   SSQLFiltroCurso = 'T.`CURSO` = :CD_CURSO';
   SSQLFiltroAnoSemestre = 'A.`ANOSEMESTRE` = :NR_ANOSEMESTRE';
   SSQLFiltroTurma = 'A.`TURMA` = :CD_TURMA';
   SSQLFiltroDisciplina = 'A.`DISCIPLINA` = :CD_DISCIPLINA';
   SSQLFiltroGrupo = 'A.`CD_GRUPO` = :CD_GRUPO';
   SSQLFiltroProfessor = 'A.`CD_PROFESSOR` = :CD_PROFESSOR';
   SSQLFiltroDataInicio = 'A.`DATA` >= :DT_INICIO';
   SSQLFiltroDataFim = 'A.`DATA` <= :DT_FIM';
   SSQLFiltroPeriodo = 'A.`BIMESTRE` = :NR_PERIODO';
   SSQLFiltroEtapa = 'T.`SERIE` = :NR_ETAPA';

{$R *.dfm}

{ TfrmAulas }

procedure TfrmAulas.AddFilter(const Expr: AnsiString;
  const Values: array of TVarRec);
begin
   FFilters.Values[Expr] := Format(Expr, Values);
end;

procedure TfrmAulas.AddFilter(const Expr, ParamName: AnsiString;
  const Value: Variant);
var
   I: Integer;
   Param: TParam;
begin
   I := FFilters.IndexOf(Expr);

   if I = -1 then
      FFilters.Values[Expr] := Expr;

   Param := FParams.FindParam(ParamName);

   if Param = nil then
      Param := FParams.CreateParam(ftUnknown, ParamName, ptUnknown);

   Param.Value := Value;
end;

procedure TfrmAulas.bbtnFiltrarClick(Sender: TObject);
const
   SSQLSelectAulas =
      'SELECT ' +
         'A.`CD_DIARIO_AULA`,' +
         'A.`TURMA` `CD_TURMA`,' +
         'A.`ANOSEMESTRE` `NR_ANOSEMESTRE`,' +
         'D.`DESCRICAO` `DS_DISCIPLINA`,' +
         'D.`SIGLA` `DS_SIGLA_DISCIPLINA`,' +
         'A.`DISCIPLINA` `CD_DISCIPLINA`,' +
         'T.`CURSO` `CD_CURSO`,' +
         'A.`BIMESTRE` `NR_BIMESTRE`,' +
         'A.`DATA` `DT_AULA`,' +
         'A.`SN_BLOQUEADO`,' +
         'A.`NRO_AULA` `NR_AULA`,' +
         'A.`QTD_AULAS`,' +
         'A.`CD_PROFESSOR`,' +
         'A.`CONTEUDO` `TX_CONTEUDO`,' +
         'C.`CD_COLIGADA`,' +
         'C.`NM_COLIGADA`,' +
         'A.`CD_AULA_TIPO`,' +
         'A.`SN_AULA_COMPARTILHADA`,' +
         'A.`CD_SITUACAO`,' +
         'I.`DS_AULA_TIPO`,' +
         'P.`NM_PESSOA` `NM_PROFESSOR`,' +
         'S.`DS_VALOR` `DS_SITUACAO` ' +
      'FROM ' +
         '`DIARIO_AULAS` A ' +
            'JOIN `TURMAS` T ON ' +
               '(A.`ANOSEMESTRE` = T.`ANOSEMESTRE`) AND ' +
               '(A.`TURMA` = T.`CODIGO`) ' +
            'JOIN `DISCIPLINAS` D ON ' +
               '(A.`DISCIPLINA` = D.`CODIGO`) AND ' +
               '(T.`CURSO` = D.`CURSO`) ' +
            'JOIN `COLIGADAS` C ON ' +
               '(T.`CD_COLIGADA` = C.`CD_COLIGADA`) ' +
            'LEFT JOIN `PESSOAS` P ON ' +
               '(A.`CD_PROFESSOR` = P.`CD_PESSOA`) ' +
            'LEFT JOIN `AULAS_TIPOS` I ON ' +
               '(A.`CD_AULA_TIPO` = I.`CD_AULA_TIPO`) ' +
            'LEFT JOIN `SITUACOES` S ON ' +
               '(A.`CD_SITUACAO` = S.`CD_SITUACAO`) AND ' +
               '(S.`CD_MODULO` = 1029) ' +
      'WHERE %s';
var
   S, SQL: AnsiString;
   I: Integer;
begin
   if dtpDataInicio.Checked then
      AddFilter(SSQLFiltroDataInicio, 'DT_INICIO', dtpDataInicio.DateTime);

   if dtpDataFim.Checked then
      AddFilter(SSQLFiltroDataFim, 'DT_FIM', dtpDataFim.DateTime);

   if chkPeriodo.Checked then
      AddFilter(SSQLFiltroPeriodo, 'NR_PERIODO', spePeriodo.Value);

   if chkEtapa.Checked then
      AddFilter(SSQLFiltroEtapa, 'NR_ETAPA', speEtapa.Value);

   S := EmptyStr;

   for I := 0 to FFilters.Count - 1 do
   begin
      if S <> EmptyStr then
         S := Format('%s AND ', [S]);

      S := Format('%s%s', [S, FFilters.ValueFromIndex[I]]);
   end;

   SQL := Format(SSQLSelectAulas, [S]);

   qryAulas.Close;
   qryAulas.SQL.Text := SQL;

   for I := 0 to FParams.Count - 1 do
      qryAulas.ParamByName(FParams[I].Name).Value := FParams[I].Value;

   qryAulas.Open;
end;

procedure TfrmAulas.bbtnLimparClick(Sender: TObject);
begin
   lbleEstado.Clear;
   lbleMunicipios.Clear;
   lbleUnidade.Clear;
   lbleCurso.Clear;
   edtCurso.Clear;
   lbleTurma.Clear;
   lbleDisciplina.Clear;
   edtDisciplina.Clear;
   lbleGrupo.Clear;
   edtGrupo.Clear;
   lbleProfessor.Clear;
   edtProfessor.Clear;
   dtpDataInicio.Date := Date;
   dtpDataInicio.Checked := False;
   dtpDataFim.Date := Date;
   dtpDataFim.Checked := False;
   chkPeriodo.Checked := True;
   chkEtapa.Checked := False;
   spePeriodo.Value := 1;
   speEtapa.Value := 1;
   FParams.Clear;
   FFilters.Clear;
end;

procedure TfrmAulas.btnColunasClick(Sender: TObject);
begin
   Application.CreateForm(TfrmSelColunas, frmSelColunas);
   frmSelColunas.SelecionaColunas(TDBGrid(TCustomDBGrid(dbgAulas)), 'planilha_cad_aulas');
end;

constructor TfrmAulas.Create(AOwner: TComponent);
begin
   inherited;
   dtpDataInicio.Date := Date;
   dtpDataInicio.Checked := False;
   dtpDataFim.Date := Date;
   dtpDataFim.Checked := False;
   FFilters := TStringList.Create;
   FFilters.NameValueSeparator := '$';
   FParams := TParams.Create;
end;

procedure TfrmAulas.dbgAulasDrawColumnCell(Sender: TObject; const Rect: TRect;
  DataCol: Integer; Column: TColumn; State: TGridDrawState);
var
   Canvas: TCanvas;
   SaveFont: TFont;
begin
   if Column.FieldName = 'DS_ICONES' then
   begin
      Canvas := dbgAulas.Canvas;

      SaveFont := TFont.Create;
      SaveFont.Assign(Canvas.Font);

      Canvas.Font.Color := clGreen;
      Canvas.Font.Name := 'Untitled1';
      Canvas.Font.Size := 14;
      Canvas.TextOut(2 + Rect.Left, Rect.Top, 'A');

      Canvas.Font.Color := clRed;
      Canvas.TextOut(2 + Rect.Left + Canvas.TextWidth('A'), Rect.Top + 2, 'B');

      Canvas.Font.Color := clBlue;
      Canvas.TextOut(2 + Rect.Left + Canvas.TextWidth('A') + Canvas.TextWidth('B'), Rect.Top + 2, 'C');

      Canvas.Font.Assign(SaveFont);
   end;
end;

procedure TfrmAulas.lbleProfessorExit(Sender: TObject);
var
   S: AnsiString;
begin
   S := Trim(lbleProfessor.Text);

   if S <> EmptyStr then
   begin
      qryProfessoresFiltro.Close;
      qryProfessoresFiltro.ParamByName('CD_PESSOA').AsString := S;
      qryProfessoresFiltro.Open;

      if qryProfessoresFiltro.IsEmpty then
      begin
         lbleProfessor.Clear;
         edtProfessor.Clear;
      end;

      if not qryProfessoresFiltro.IsEmpty then
         edtProfessor.Text := qryProfessoresFiltroNM_PESSOA.AsString;

      qryProfessoresFiltro.Close;
   end;
end;

procedure TfrmAulas.lbleProfessorKeyPress(Sender: TObject; var Key: Char);
var
   I: Integer;
begin
   if Key = #13 then
   begin
      edtProfessor.SetFocus;
      Exit;
   end;

   if not (Key in [#8, #9, #48..#57, #127]) then
      Key := #0;
end;

procedure TfrmAulas.sbBuscarCursoClick(Sender: TObject);
var
   ResultadoFiltro: TResultadoFiltroCurso;
   Param: TParam;
   S: AnsiString;
   I: Integer;
begin
   Param := FParams.FindParam('CD_COLIGADA');

   if Param = nil then
      ResultadoFiltro := TfrmSelecionarCurso.Filtrar([])
   else
      ResultadoFiltro := TfrmSelecionarCurso.Filtrar([], Param.Value);

   if ResultadoFiltro.filtrado then
   begin
      S := ResultadoFiltro.cd_curso;
      lbleCurso.Text := S;
      edtCurso.Text := ResultadoFiltro.ds_curso;
      AddFilter(SSQLFiltroCurso, 'CD_CURSO', S);

      lbleUnidade.Text := ResultadoFiltro.nm_coligada;
      I := ResultadoFiltro.cd_coligada;
      AddFilter(SSQLFiltroUnidade, 'CD_COLIGADA', I);

      I := ResultadoFiltro.nr_anosemestre;
      AddFilter(SSQLFiltroAnoSemestre, 'NR_ANOSEMESTRE', I);
   end;
end;

procedure TfrmAulas.sbBuscarDisciplinaClick(Sender: TObject);
var
   ResultadoFiltro: TResultadoFiltroDisciplina;
   Param: TParam;
   S: AnsiString;
   I: Integer;
begin
   S := EmptyStr;
   Param := FParams.FindParam('CD_CURSO');

   if Param <> nil then
      S := Param.Value;

   ResultadoFiltro := TfrmSelecionarDisciplina.Filtrar([bfdCurso], S,
      DM.GetAnoSemestreAtual);

   if ResultadoFiltro.filtrado then
   begin
      I := ResultadoFiltro.cd_disciplina;
      lbleDisciplina.Text := Format('%d', [I]);
      edtDisciplina.Text := ResultadoFiltro.ds_disciplina;
      AddFilter(SSQLFiltroDisciplina, 'CD_DISCIPLINA', I);

      S := ResultadoFiltro.cd_curso;
      lbleCurso.Text := S;
      edtCurso.Text := ResultadoFiltro.ds_curso;
      AddFilter(SSQLFiltroCurso, 'CD_CURSO', S);

      I := ResultadoFiltro.nr_anosemestre;
      AddFilter(SSQLFiltroAnoSemestre, 'NR_ANOSEMESTRE', I);
   end;
end;

procedure TfrmAulas.sbBuscarEstadoClick(Sender: TObject);
var
   S: AnsiString;
begin
   Application.CreateForm(TfrmSelEstados, frmSelEstados);
   frmSelEstados.CarregaTelaFiltro(lbleEstado.Text, sceFromColigadas);

   if frmSelEstados.Filtrar then
   begin
      lbleEstado.Text := frmSelEstados.GetStrEstadosSelecionados(True);
      S := frmSelEstados.GetStrEstadosSelecionados(False);
      AddFilter(SSQLFiltroEstados, [S]);
   end;
end;

procedure TfrmAulas.sbBuscarGrupoClick(Sender: TObject);
const
   SMsgSelecionarCurso = 'É necessário selecionar um curso antes de selecionar um grupo.';
var
   ResultadoFiltro: TResultadoFiltroGrupo;
   Param: TParam;
   Curso, Turma, S: AnsiString;
   AnoSemestre, Disciplina, Professor, I: Integer;
begin
   Param := FParams.FindParam('CD_CURSO');

   if Param = nil then
   begin
      MessageDlg(SMsgSelecionarCurso, mtInformation, [mbOK], 0);
      Exit;
   end;

   AnoSemestre := -1;
   Disciplina := -1;
   Professor := -1;
   Curso := EmptyStr;
   Turma := EmptyStr;

   Param := FParams.FindParam('NR_ANOSEMESTRE');

   if Param <> nil then
      AnoSemestre := Param.Value;

   Param :=  FParams.FindParam('CD_DISCIPLINA');

   if Param <> nil then
      Disciplina := Param.Value;

   Param := FParams.FindParam('CD_PROFESSOR');

   if Param <> nil then
      Professor := Param.Value;

   Param := FParams.FindParam('CD_CURSO');

   if Param <> nil then
      Curso := Param.Value;

   Param := FParams.FindParam('CD_TURMA');

   if Param <> nil then
      Turma := Param.Value;

   ResultadoFiltro := TfrmSelecionarGrupo.Filtrar([], Curso, AnoSemestre,
      Turma, Disciplina, Professor);

   if ResultadoFiltro.filtrado then
   begin
      I := ResultadoFiltro.cd_grupo;
      lbleGrupo.Text := Format('%d', [I]);
      edtGrupo.Text := ResultadoFiltro.nm_grupo;
      AddFilter(SSQLFiltroGrupo, 'CD_GRUPO', I);

      S := ResultadoFiltro.cd_curso;
      lbleCurso.Text := S;
      edtCurso.Text := ResultadoFiltro.ds_curso;
      AddFilter(SSQLFiltroCurso, 'CD_CURSO', S);

      S := ResultadoFiltro.cd_turma;
      lbleTurma.Text := S;
      AddFilter(SSQLFiltroTurma, 'CD_TURMA', S);

      I := ResultadoFiltro.cd_disciplina;
      lbleDisciplina.Text := Format('%d', [I]);
      edtDisciplina.Text := ResultadoFiltro.ds_disciplina;
      AddFilter(SSQLFiltroDisciplina, 'CD_DISCIPLINA', I);

      I := ResultadoFiltro.cd_professor;
      lbleProfessor.Text := Format('%d', [I]);
      edtProfessor.Text := ResultadoFiltro.nm_professor;
      AddFilter(SSQLFiltroProfessor, 'CD_PROFESSOR', I);

      I := ResultadoFiltro.nr_anosemestre;
      AddFilter(SSQLFiltroAnoSemestre, 'NR_ANOSEMESTRE', I);
   end;
end;

procedure TfrmAulas.sbBuscarMunicipioClick(Sender: TObject);
var
   Estados, Municipios, S: AnsiString;
begin
   Application.CreateForm(TfrmSelCidades, frmSelCidades);

   Estados := FFilters.Values[SSQLFiltroEstados];
   Municipios := FFilters.Values[SSQLFiltroMunicipios];

   frmSelCidades.CarregaTelaFiltro(Estados, Municipios, sccFromColigadas);

   if frmSelCidades.Filtrar then
   begin
      lbleMunicipios.Text := frmSelCidades.GetStrCidadesSelecionadas(True);
      S := frmSelCidades.GetIntCidadesSelecionadas;
      AddFilter(SSQLFiltroMunicipios, [S]);
   end;
end;

procedure TfrmAulas.sbBuscarProfessorClick(Sender: TObject);
var
   ResultadoFiltro: TResultadoFiltroPessoa;
   I: Integer;
begin
   ResultadoFiltro := TfrmSelecionarPessoa.Filtrar([], afpProfessor);

   if ResultadoFiltro.filtrado then
   begin
      I := ResultadoFiltro.cd_pessoa;
      lbleProfessor.Text := Format('%d', [I]);
      edtProfessor.Text := ResultadoFiltro.nm_pessoa;
      AddFilter(SSQLFiltroProfessor, 'CD_PROFESSOR', I);

      I := ResultadoFiltro.nr_anosemestre;
      AddFilter(SSQLFiltroAnoSemestre, 'NR_ANOSEMESTRE', I);
   end;
end;

procedure TfrmAulas.sbBuscarTurmaClick(Sender: TObject);
var
   ResultadoFiltro: TResultadoFiltroTurma;
   Param: TParam;
   I: Integer;
   S: AnsiString;
begin
   I := -1;
   S := EmptyStr;

   Param := FParams.FindParam('CD_COLIGADA');

   if Param <> nil then
      I := Param.Value;

   Param := FParams.FindParam('CD_CURSO');

   if Param <> nil then
      S := Param.Value;

   ResultadoFiltro := TfrmSelecionarTurma.Filtrar([], DM.GetAnoSemestreAtual, I, -1, S);

   if ResultadoFiltro.filtrado then
   begin
      lbleUnidade.Text := ResultadoFiltro.nm_coligada;
      I := ResultadoFiltro.cd_coligada;
      AddFilter(SSQLFiltroUnidade, 'CD_COLIGADA', I);

      S := ResultadoFiltro.cd_curso;
      lbleCurso.Text := S;
      edtCurso.Text := ResultadoFiltro.ds_curso;
      AddFilter(SSQLFiltroCurso, 'CD_CURSO', S);

      lbleTurma.Text := ResultadoFiltro.cd_turma;
      S := ResultadoFiltro.cd_turma;
      AddFilter(SSQLFiltroTurma, 'CD_TURMA', S);
   end;
end;

procedure TfrmAulas.sbBuscarUnidadeClick(Sender: TObject);
var
   I: Integer;
begin
   if TfrmSelecionarColigada.ShowModal(lbleEstado.Text, lbleMunicipios.Text) then
   begin
      lbleUnidade.Text := TfrmSelecionarColigada.getResultado.Nome;
      I := TfrmSelecionarColigada.getResultado.Codigo;
      AddFilter(SSQLFiltroUnidade, 'CD_COLIGADA', I);
   end;
end;

end.
