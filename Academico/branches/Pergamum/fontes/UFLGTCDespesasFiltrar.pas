unit UFLGTCDespesasFiltrar;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ExtCtrls, Buttons, ComCtrls, ToolWin, ImgList, DB,
  ZAbstractRODataset, UZDataset, DBCtrls, Spin, ZDbcIntfs;

const
   SSQLFiltroCurso = 'U.CURSO = :CD_CURSO';
   SSQLFiltroProfessor = 'R.CD_PESSOA = :CD_PROFESSOR';
   SSQLFiltroTurma = 'U.CODIGO = :CD_TURMA';
   SSQLFiltroAnoSemestre = 'A.ANOSEMESTRE = :NR_ANOSEMESTRE';
   SSQLFiltroDisciplina = 'A.DISCIPLINA = :CD_DISCIPLINA';
   SSQLFiltroGrupo = 'A.CD_GRUPO = :CD_GRUPO';
   SSQLFiltroDataInicio = 'A.`DATA` >= :DT_INICIO';
   SSQLFiltroDataFim = 'A.`DATA` <= :DT_FIM';
   SSQLFiltroNumero = 'A.`NRO_AULA` = :NR_AULA';
   SSQLFiltroEstado = 'O.DS_ESTADO IN (%s)';
   SSQLFiltroMunicipio = 'O.CD_MUNICIPIO IN (%s)';
   SSQLFiltroUnidade = 'U.CD_COLIGADA = :CD_COLIGADA';
   SSQLFiltroCodigo = 'D.`CD_DESPESA` = :CD_DESPESA';
   SSQLFiltroFornecedor = 'D.`CD_FORNECEDOR` = :CD_FORNECEDOR';
   SSQLFiltroTipo = 'D.`CD_TIPO_DESPESA` = :CD_TIPO_DESPESA';
   SSQLFiltroSituacao = 'D.`CD_SITUACAO` = :CD_SITUACAO';

type
   TfrmLGTCDespesasFiltrar = class(TForm)
      btnCancelar: TToolButton;
      btnFiltrar: TToolButton;
      btnLimpar: TToolButton;
      btnSep1: TToolButton;
      btnSep2: TToolButton;
      bvSep1: TBevel;
      dblcSituacoes: TDBLookupComboBox;
      dblcTiposDespesa: TDBLookupComboBox;
      dsSituacoes: TDataSource;
      dsTiposDespesa: TDataSource;
      dtpDataFim: TDateTimePicker;
      dtpDataInicio: TDateTimePicker;
      ilAcoes: TImageList;
      lblDataFim: TLabel;
      lblDataInicio: TLabel;
      lbleCodigo: TLabeledEdit;
      lbleCurso: TLabeledEdit;
      lbleDisciplina: TLabeledEdit;
      lbleEstado: TLabeledEdit;
      lbleFornecedor: TLabeledEdit;
      lbleGrupo: TLabeledEdit;
      lbleMunicipio: TLabeledEdit;
      lbleProfessor: TLabeledEdit;
      lbleTurma: TLabeledEdit;
      lbleUnidade: TLabeledEdit;
      lblNumero: TLabel;
      lblSituacao: TLabel;
      lblTipo: TLabel;
      qrySituacoes: TUMZReadOnlyQuery;
      qrySituacoesCD_SITUACAO: TLargeintField;
      qrySituacoesDS_SITUACAO: TStringField;
      qryTiposDespesa: TUMZReadOnlyQuery;
      qryTiposDespesaCD_TIPO_DESPESA: TLargeintField;
      qryTiposDespesaDS_TIPO_DESPESA: TStringField;
      sbBuscarCurso: TSpeedButton;
      sbBuscarDisciplina: TSpeedButton;
      sbBuscarEstado: TSpeedButton;
      sbBuscarFornecedor: TSpeedButton;
      sbBuscarGrupo: TSpeedButton;
      sbBuscarMunicipio: TSpeedButton;
      sbBuscarProfessor: TSpeedButton;
      sbBuscarTurma: TSpeedButton;
      sbBuscarUnidade: TSpeedButton;
      sbLimparCidade: TSpeedButton;
      sbLimparCodigo: TSpeedButton;
      sbLimparCurso: TSpeedButton;
      sbLimparDisciplina: TSpeedButton;
      sbLimparEstado: TSpeedButton;
      sbLimparFornecedor: TSpeedButton;
      sbLimparGrupo: TSpeedButton;
      sbLimparNumero: TSpeedButton;
      sbLimparProfessor: TSpeedButton;
      sbLimparSituacao: TSpeedButton;
      sbLimparTipo: TSpeedButton;
      sbLimparTurma: TSpeedButton;
      sbLimparUnidade: TSpeedButton;
      speNumero: TSpinEdit;
      tlbAcoes: TToolBar;
      procedure btnCancelarClick(Sender: TObject);
      procedure btnFiltrarClick(Sender: TObject);
      procedure btnLimparClick(Sender: TObject);
      procedure dtpDataFimChange(Sender: TObject);
      procedure dtpDataInicioChange(Sender: TObject);
      procedure FormClose(Sender: TObject; var Action: TCloseAction);
      procedure FormCreate(Sender: TObject);
      procedure FormShow(Sender: TObject);
      procedure lbleCodigoChange(Sender: TObject);
      procedure lbleCodigoKeyPress(Sender: TObject; var Key: Char);
      procedure qrySituacoesAfterScroll(DataSet: TDataSet);
      procedure qryTiposDespesaAfterScroll(DataSet: TDataSet);
      procedure sbBuscarCursoClick(Sender: TObject);
      procedure sbBuscarDisciplinaClick(Sender: TObject);
      procedure sbBuscarEstadoClick(Sender: TObject);
      procedure sbBuscarFornecedorClick(Sender: TObject);
      procedure sbBuscarGrupoClick(Sender: TObject);
      procedure sbBuscarMunicipioClick(Sender: TObject);
      procedure sbBuscarProfessorClick(Sender: TObject);
      procedure sbBuscarTurmaClick(Sender: TObject);
      procedure sbBuscarUnidadeClick(Sender: TObject);
      procedure sbLimparCidadeClick(Sender: TObject);
      procedure sbLimparCodigoClick(Sender: TObject);
      procedure sbLimparCursoClick(Sender: TObject);
      procedure sbLimparDisciplinaClick(Sender: TObject);
      procedure sbLimparEstadoClick(Sender: TObject);
      procedure sbLimparFornecedorClick(Sender: TObject);
      procedure sbLimparGrupoClick(Sender: TObject);
      procedure sbLimparNumeroClick(Sender: TObject);
      procedure sbLimparProfessorClick(Sender: TObject);
      procedure sbLimparSituacaoClick(Sender: TObject);
      procedure sbLimparTipoClick(Sender: TObject);
      procedure sbLimparTurmaClick(Sender: TObject);
      procedure sbLimparUnidadeClick(Sender: TObject);
      procedure speNumeroChange(Sender: TObject);
   private
      FParams: TParams;
      FFilters: TStrings;
      function GetSQLExpression: AnsiString;
   public
      procedure AddFilter(const Expr, Value: AnsiString); overload;
      procedure AddFilter(const Expr, ParamName: AnsiString; const Value: Variant); overload;
      procedure DeleteFilter(const Expr: AnsiString); overload;
      procedure DeleteFilter(const Expr, ParamName: AnsiString); overload;
      procedure CleanFilters;
      property SQLExpression: AnsiString read GetSQLExpression;
      property Params: TParams read FParams;
   end;

var
   frmLGTCDespesasFiltrar: TfrmLGTCDespesasFiltrar;

implementation

uses
   uDM, uFSelEstados, uFSelCidades, uFSelecionarColigada, uFSelecionarCurso,
   uFSelecionarTurma, uFSelecionarDisciplina, uFSelecionarGrupo,
   uFSelecionarPessoa;

{$R *.dfm}

procedure TfrmLGTCDespesasFiltrar.AddFilter(const Expr, Value: AnsiString);
var
   I: Integer;
begin
   I := FFilters.IndexOf(Expr);

   if I = -1 then
      FFilters.Values[Expr] := Value
   else
      FFilters.ValueFromIndex[I] := Value;
end;

procedure TfrmLGTCDespesasFiltrar.AddFilter(const Expr, ParamName: AnsiString;
  const Value: Variant);
var
   Param: TParam;
begin
   Param := FParams.FindParam(ParamName);
   
   if Param = nil then
   begin
      FFilters.Add(Expr);
      FParams.CreateParam(ftUnknown, ParamName, ptUnknown).Value := Value;
   end
   else
      Param.Value := Value;

   Param := nil;      
end;

procedure TfrmLGTCDespesasFiltrar.btnCancelarClick(Sender: TObject);
begin
   ModalResult := mrCancel;
   CloseModal;
end;

procedure TfrmLGTCDespesasFiltrar.btnFiltrarClick(Sender: TObject);
begin
   ModalResult := mrOk;
   CloseModal;
end;

procedure TfrmLGTCDespesasFiltrar.btnLimparClick(Sender: TObject);
begin
   CleanFilters;
end;

procedure TfrmLGTCDespesasFiltrar.CleanFilters;
begin
   FFilters.Clear;
   FParams.Clear;

   lbleEstado.Clear;
   lbleMunicipio.Clear;
   lbleUnidade.Clear;
   lbleCurso.Clear;
   lbleTurma.Clear;
   lbleDisciplina.Clear;
   lbleGrupo.Clear;
   lbleProfessor.Clear;
   dtpDataInicio.Date := Date;
   dtpDataInicio.Checked := False;
   dtpDataFim.Date := Date;
   dtpDataFim.Checked := False;
   speNumero.Value := 0;
   lbleCodigo.Clear;
   lbleFornecedor.Clear;
   qryTiposDespesa.First;
   qrySituacoes.First;
end;

procedure TfrmLGTCDespesasFiltrar.DeleteFilter(const Expr: AnsiString);
var
   I: Integer;
begin
   I := FFilters.IndexOf(Expr);
   if I <> -1 then
      FFilters.Delete(I);
end;

procedure TfrmLGTCDespesasFiltrar.DeleteFilter(const Expr,
  ParamName: AnsiString);
var
   I: Integer;
   Param: TParam;
begin
   DeleteFilter(Expr);

   Param := FParams.FindParam(ParamName);

   if Param <> nil then
   begin
      I := Param.Index;
      FParams.Delete(I);
   end;
end;

procedure TfrmLGTCDespesasFiltrar.dtpDataFimChange(Sender: TObject);
begin
   DeleteFilter(SSQLFiltroDataFim, 'DT_FIM');
   if dtpDataFim.Checked then
      AddFilter(SSQLFiltroDataFim, 'DT_FIM', dtpDataFim.DateTime);
end;

procedure TfrmLGTCDespesasFiltrar.dtpDataInicioChange(Sender: TObject);
begin
   DeleteFilter(SSQLFiltroDataInicio, 'DT_INICIO');
   if dtpDataInicio.Checked then
      AddFilter(SSQLFiltroDataInicio, 'DT_INICIO', dtpDataInicio.DateTime);
end;

procedure TfrmLGTCDespesasFiltrar.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
   Action := caHide;
end;

procedure TfrmLGTCDespesasFiltrar.FormCreate(Sender: TObject);
const
   SQLGruposDiario = 'SELECT COUNT(CD_GRUPO) FROM DIARIO_GRUPOS';
var
   Stmt: IZPreparedStatement;
   ResultSet: IZResultSet;
begin

   try
      Stmt := DM.db.DbcConnection.PrepareStatement(SQLGruposDiario);
      ResultSet := Stmt.ExecuteQueryPrepared;

      if (not ResultSet.Next) or (ResultSet.GetInt(1) = 0) then
      begin
         lbleGrupo.Enabled := False;
         sbBuscarGrupo.Enabled := False;
      end;

   finally
      ResultSet.Close;
      Stmt.Close;
   end;

   FParams := TParams.Create;
   FFilters := TStringList.Create;
   FFilters.StrictDelimiter := True;
   qryTiposDespesa.Open;
   qryTiposDespesa.First;
   qrySituacoes.Open;
   qrySituacoes.First;
   dtpDataInicio.Date := Date;
   dtpDataInicio.Checked := False;
   dtpDataFim.Date := Date;
   dtpDataFim.Checked := False;
end;

procedure TfrmLGTCDespesasFiltrar.FormShow(Sender: TObject);
begin
   lbleEstado.SetFocus;
end;

function TfrmLGTCDespesasFiltrar.GetSQLExpression: AnsiString;
var
   I: Integer;
   LParams: TParams;
   S: AnsiString;
begin
   Result := EmptyStr;

   LParams := TParams.Create;
   try
      for I := 0 to FFilters.Count - 1 do
      begin
         if Result <> EmptyStr then
            Result := Format('%s AND ', [Result]);

         LParams.ParseSQL(FFilters.Strings[I], True);

         if LParams.Count = 0 then
            S := Format(FFilters.Names[I], [FFilters.ValueFromIndex[I]]);

         if LParams.Count > 0 then
            S := FFilters.Strings[I];

         Result := Format('%s%s', [Result, S]);
      end;
   finally
      FreeAndNil(LParams);
   end;
end;

procedure TfrmLGTCDespesasFiltrar.lbleCodigoChange(Sender: TObject);
begin
   if lbleCodigo.Text = EmptyStr then
      DeleteFilter(SSQLFiltroCodigo, 'CD_DESPESA');

   if lbleCodigo.Text <> EmptyStr then
      AddFilter(SSQLFiltroCodigo, 'CD_DESPESA', lbleCodigo.Text);
end;

procedure TfrmLGTCDespesasFiltrar.lbleCodigoKeyPress(Sender: TObject;
  var Key: Char);
begin
   if not (Key in [#48..#57, #8, #9, #27, #127]) then
      Key := #0;
end;

procedure TfrmLGTCDespesasFiltrar.qrySituacoesAfterScroll(DataSet: TDataSet);
begin
   if qrySituacoesCD_SITUACAO.AsLargeInt <> 0 then
      AddFilter(SSQLFiltroSituacao, 'CD_SITUACAO', qrySituacoesCD_SITUACAO.AsLargeInt);
end;

procedure TfrmLGTCDespesasFiltrar.qryTiposDespesaAfterScroll(DataSet: TDataSet);
begin
   if qryTiposDespesaCD_TIPO_DESPESA.AsLargeInt <> 0 then
      AddFilter(SSQLFiltroTipo, 'CD_TIPO_DESPESA', qryTiposDespesaCD_TIPO_DESPESA.AsLargeInt);
end;

procedure TfrmLGTCDespesasFiltrar.sbBuscarCursoClick(Sender: TObject);
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
      ResultadoFiltro := TfrmSelecionarCurso.Filtrar([], Param.AsInteger);

   if ResultadoFiltro.filtrado then
   begin
      lbleCurso.Text := ResultadoFiltro.cd_curso;
      S := ResultadoFiltro.cd_curso;
      AddFilter(SSQLFiltroCurso, 'CD_CURSO', S);

      lbleUnidade.Text := ResultadoFiltro.nm_coligada;
      I := ResultadoFiltro.cd_coligada;
      AddFilter(SSQLFiltroUnidade, 'CD_COLIGADA', I);

      I := ResultadoFiltro.nr_anosemestre;
      AddFilter(SSQLFiltroAnoSemestre, 'NR_ANOSEMESTRE', I);
   end;
   
end;

procedure TfrmLGTCDespesasFiltrar.sbBuscarDisciplinaClick(Sender: TObject);
var
   ResultadoFiltro: TResultadoFiltroDisciplina;
   Param: TParam;
   S: AnsiString;
   I: Integer;
begin
   Param := FParams.FindParam('CD_CURSO');

   if Param <> nil then
      S := Param.AsString;

   ResultadoFiltro := TfrmSelecionarDisciplina.Filtrar([bfdCurso], S,
      DM.GetAnoSemestreAtual);

   if ResultadoFiltro.filtrado then
   begin
      lbleDisciplina.Text := ResultadoFiltro.ds_disciplina;
      I := ResultadoFiltro.cd_disciplina;
      AddFilter(SSQLFiltroDisciplina, 'CD_DISCIPLINA', I);
      
      lbleCurso.Text := ResultadoFiltro.cd_curso;
      S := ResultadoFiltro.cd_curso;
      AddFilter(SSQLFiltroCurso, 'CD_CURSO', S);

      I := ResultadoFiltro.nr_anosemestre;
      AddFilter(SSQLFiltroAnoSemestre, 'NR_ANOSEMESTRE', I);
   end;
end;

procedure TfrmLGTCDespesasFiltrar.sbBuscarEstadoClick(Sender: TObject);
var
   S: AnsiString;
begin
   Application.CreateForm(TfrmSelEstados, frmSelEstados);
   
   frmSelEstados.CarregaTelaFiltro(lbleEstado.Text, sceFromColigadas);

   if frmSelEstados.Filtrar then
   begin
      lbleEstado.Text := frmSelEstados.GetStrEstadosSelecionados(True);
      S := frmSelEstados.GetStrEstadosSelecionados(False);
      AddFilter(SSQLFiltroEstado, S);
   end;
   
end;

procedure TfrmLGTCDespesasFiltrar.sbBuscarFornecedorClick(Sender: TObject);
var
   ResultadoFiltro: TResultadoFiltroPessoa;
   I: Integer;
begin
   ResultadoFiltro := TfrmSelecionarPessoa.Filtrar([], afpFornecedor);
   if ResultadoFiltro.filtrado then
   begin
      lbleFornecedor.Text := ResultadoFiltro.nm_pessoa;
      I := ResultadoFiltro.cd_pessoa;
      AddFilter(SSQLFiltroFornecedor, 'CD_FORNECEDOR', I);
   end;
end;

procedure TfrmLGTCDespesasFiltrar.sbBuscarGrupoClick(Sender: TObject);
const
   MsgSelecionarCurso = 'É necessário selecionar um curso antes de selecionar um grupo.';
var
   ResultadoFiltro: TResultadoFiltroGrupo;
   Param: TParam;
   S, Curso, Turma: AnsiString;
   I, AnoSemestre, Disciplina, Professor: Integer;
begin
   Param := FParams.FindParam('CD_CURSO');

   if Param = nil then
   begin
      MessageDlg(MsgSelecionarCurso, mtWarning, [mbOK], 0);
      Exit;
   end;

   Curso := Param.AsString;

   Turma := EmptyStr;
   AnoSemestre := -1;
   Disciplina := -1;
   Professor := -1;

   Param := FParams.FindParam('CD_TURMA');

   if Param <> nil then
      Turma := Param.AsString;

   Param := FParams.FindParam('NR_ANOSEMESTRE');

   if Param <> nil then
      AnoSemestre := Param.AsInteger;

   Param := FParams.FindParam('CD_DISCIPLINA');

   if Param <> nil then
      Disciplina := Param.AsInteger;

   Param := FParams.FindParam('CD_PROFESSOR');

   if Param <> nil then
      Professor := Param.AsInteger;

   ResultadoFiltro := TfrmSelecionarGrupo.Filtrar([], Curso, AnoSemestre,
      Turma, Disciplina, Professor);

   if ResultadoFiltro.filtrado then
   begin
      lbleGrupo.Text := ResultadoFiltro.nm_grupo;
      I := ResultadoFiltro.cd_grupo;
      AddFilter(SSQLFiltroGrupo, 'CD_GRUPO', I);

      lbleCurso.Text := ResultadoFiltro.cd_curso;   
      S := ResultadoFiltro.cd_curso;
      AddFilter(SSQLFiltroCurso, 'CD_CURSO', S);

      lbleTurma.Text := ResultadoFiltro.cd_turma;      
      S := ResultadoFiltro.cd_turma;
      AddFilter(SSQLFiltroTurma, 'CD_TURMA', S);

      lbleDisciplina.Text := ResultadoFiltro.ds_disciplina;
      I := ResultadoFiltro.cd_disciplina;
      AddFilter(SSQLFiltroDisciplina, 'CD_DISCIPLINA', I);

      lbleProfessor.Text := ResultadoFiltro.nm_professor;
      I := ResultadoFiltro.cd_professor;
      AddFilter(SSQLFiltroProfessor, 'CD_PROFESSOR', I);
      
      I := ResultadoFiltro.nr_anosemestre;
      AddFilter(SSQLFiltroAnoSemestre, 'NR_ANOSEMESTRE', I);
   end;
end;

procedure TfrmLGTCDespesasFiltrar.sbBuscarMunicipioClick(Sender: TObject);
var
   S, Estados, Municipios: AnsiString;
begin
   Estados := FFilters.Values[SSQLFiltroEstado];
   Municipios := FFilters.Values[SSQLFiltroMunicipio];

   Application.CreateForm(TfrmSelCidades, frmSelCidades);
   frmSelCidades.CarregaTelaFiltro(Estados, Municipios, sccFromColigadas);

   if frmSelCidades.Filtrar then
   begin
      lbleMunicipio.Text := frmSelCidades.GetStrCidadesSelecionadas(True);
      S := frmSelCidades.GetIntCidadesSelecionadas;
      AddFilter(SSQLFiltroMunicipio, S);
   end;
   
end;

procedure TfrmLGTCDespesasFiltrar.sbBuscarProfessorClick(Sender: TObject);
var
   I: Integer;
   ResultadoFiltro: TResultadoFiltroPessoa;
begin
   ResultadoFiltro := TfrmSelecionarPessoa.Filtrar([], afpProfessor);

   if ResultadoFiltro.filtrado then
   begin
      lbleProfessor.Text := ResultadoFiltro.nm_pessoa;
      I := ResultadoFiltro.cd_pessoa;
      AddFilter(SSQLFiltroProfessor, 'CD_PROFESSOR', I);

      I := ResultadoFiltro.nr_anosemestre;
      AddFilter(SSQLFiltroAnoSemestre, 'NR_ANOSEMESTRE', I);
   end;
end;

procedure TfrmLGTCDespesasFiltrar.sbBuscarTurmaClick(Sender: TObject);
var
   ResultadoFiltro: TResultadoFiltroTurma;
   Param: TParam;
   S: AnsiString;
   I: Integer;
begin
   ResultadoFiltro.cd_coligada := -1;

   Param := FParams.FindParam('CD_COLIGADA');

   if Param <> nil then
      ResultadoFiltro.cd_coligada := Param.AsInteger;

   Param := FParams.FindParam('CD_CURSO');
   
   if Param <> nil then
      S := Param.AsString;

   ResultadoFiltro := TfrmSelecionarTurma.Filtrar([],
      DM.GetAnoSemestreAtual, ResultadoFiltro.cd_coligada, -1, S);

   if ResultadoFiltro.filtrado then
   begin
      lbleUnidade.Text := ResultadoFiltro.nm_coligada;
      I := ResultadoFiltro.cd_coligada;
      AddFilter(SSQLFiltroUnidade, 'CD_COLIGADA', I);
      
      lbleCurso.Text := ResultadoFiltro.cd_curso;
      S := ResultadoFiltro.cd_curso;
      AddFilter(SSQLFiltroCurso, 'CD_CURSO', S);
      
      lbleTurma.Text := ResultadoFiltro.cd_turma;
      S := ResultadoFiltro.cd_turma;
      AddFilter(SSQLFiltroTurma, 'CD_TURMA', S);

      I := ResultadoFiltro.nr_anosemestre;
      AddFilter(SSQLFiltroAnoSemestre, 'NR_ANOSEMESTRE', I);
   end;
end;

procedure TfrmLGTCDespesasFiltrar.sbBuscarUnidadeClick(Sender: TObject);
var
   I: Integer;
begin
   if TfrmSelecionarColigada.ShowModal(lbleEstado.Text, lbleMunicipio.Text) then
   begin
      lbleUnidade.Text := TfrmSelecionarColigada.getResultado.Nome;
      I := TfrmSelecionarColigada.getResultado.Codigo;
      AddFilter(SSQLFiltroUnidade, 'CD_COLIGADA', I);
   end;
end;

procedure TfrmLGTCDespesasFiltrar.sbLimparCidadeClick(Sender: TObject);
begin
   lbleMunicipio.Clear;
   DeleteFilter(SSQLFiltroMunicipio);
end;

procedure TfrmLGTCDespesasFiltrar.sbLimparCodigoClick(Sender: TObject);
begin
   lbleCodigo.Clear;
end;

procedure TfrmLGTCDespesasFiltrar.sbLimparCursoClick(Sender: TObject);
begin
   lbleCurso.Clear;

   if (lbleTurma.Text = '') and
      (lbleGrupo.Text = '') and
      (lbleDisciplina.Text = '') and
      (lbleProfessor.Text = '') then
   begin
      DeleteFilter(SSQLFiltroAnoSemestre, 'NR_ANOSEMESTRE');
      DeleteFilter(SSQLFiltroCurso, 'CD_CURSO');
   end;

   if (lbleTurma.Text = '') and (lbleUnidade.Text = '') then
   begin
      DeleteFilter(SSQLFiltroUnidade, 'CD_COLIGADA');
   end;
end;

procedure TfrmLGTCDespesasFiltrar.sbLimparDisciplinaClick(Sender: TObject);
begin
   lbleDisciplina.Clear;
   DeleteFilter(SSQLFiltroDisciplina, 'CD_DISCIPLINA');

   if (lbleTurma.Text = '') and
      (lbleGrupo.Text = '') and
      (lbleCurso.Text = '') and
      (lbleProfessor.Text = '') then
   begin
      DeleteFilter(SSQLFiltroAnoSemestre, 'NR_ANOSEMESTRE');
      DeleteFilter(SSQLFiltroCurso, 'CD_CURSO');
   end;
end;

procedure TfrmLGTCDespesasFiltrar.sbLimparEstadoClick(Sender: TObject);
begin
   lbleEstado.Clear;
   DeleteFilter(SSQLFiltroEstado);
end;

procedure TfrmLGTCDespesasFiltrar.sbLimparFornecedorClick(Sender: TObject);
begin
   lbleFornecedor.Clear;
   DeleteFilter(SSQLFiltroFornecedor, 'CD_FORNECEDOR');
end;

procedure TfrmLGTCDespesasFiltrar.sbLimparGrupoClick(Sender: TObject);
begin
   lbleGrupo.Clear;
   DeleteFilter(SSQLFiltroGrupo, 'CD_GRUPO');

   if (lbleTurma.Text = '') and
      (lbleCurso.Text = '') and
      (lbleDisciplina.Text = '') and
      (lbleProfessor.Text = '') then
   begin
      DeleteFilter(SSQLFiltroAnoSemestre, 'NR_ANOSEMESTRE');
      DeleteFilter(SSQLFiltroCurso, 'CD_CURSO');
   end;
end;

procedure TfrmLGTCDespesasFiltrar.sbLimparNumeroClick(Sender: TObject);
begin
   speNumero.Value := 0;
end;

procedure TfrmLGTCDespesasFiltrar.sbLimparProfessorClick(Sender: TObject);
begin
   lbleProfessor.Clear;
   DeleteFilter(SSQLFiltroProfessor, 'CD_PROFESSOR');

   if (lbleGrupo.Text = '') and
      (lbleCurso.Text = '') and
      (lbleDisciplina.Text = '') and
      (lbleTurma.Text = '') then
   begin
      DeleteFilter(SSQLFiltroAnoSemestre, 'NR_ANOSEMESTRE');
   end;
end;

procedure TfrmLGTCDespesasFiltrar.sbLimparSituacaoClick(Sender: TObject);
begin
   dblcSituacoes.KeyValue := Null;
   DeleteFilter(SSQLFiltroSituacao, 'CD_SITUACAO');
end;

procedure TfrmLGTCDespesasFiltrar.sbLimparTipoClick(Sender: TObject);
begin
   dblcTiposDespesa.KeyValue := Null;
   DeleteFilter(SSQLFiltroTipo, 'CD_TIPO_DESPESA');
end;

procedure TfrmLGTCDespesasFiltrar.sbLimparTurmaClick(Sender: TObject);
begin
   lbleTurma.Clear;
   DeleteFilter(SSQLFiltroTurma, 'CD_TURMA');

   if (lbleGrupo.Text = '') and
      (lbleCurso.Text = '') and
      (lbleDisciplina.Text = '') and
      (lbleProfessor.Text = '') then
   begin
      DeleteFilter(SSQLFiltroAnoSemestre, 'NR_ANOSEMESTRE');
      DeleteFilter(SSQLFiltroCurso, 'CD_CURSO');
   end;

   if (lbleUnidade.Text = '') and (lbleCurso.Text = '') then
   begin
      DeleteFilter(SSQLFiltroUnidade, 'CD_COLIGADA');
   end;
end;

procedure TfrmLGTCDespesasFiltrar.sbLimparUnidadeClick(Sender: TObject);
begin
   lbleUnidade.Clear;
   DeleteFilter(SSQLFiltroUnidade, 'CD_COLIGADA');
end;

procedure TfrmLGTCDespesasFiltrar.speNumeroChange(Sender: TObject);
begin
   DeleteFilter(SSQLFiltroNumero, 'NR_AULA');
   if speNumero.Value > 0 then
      AddFilter(SSQLFiltroNumero, 'NR_AULA', speNumero.Value);
end;

end.
