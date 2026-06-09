unit uFTrocaDeTurma;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, DB, ZAbstractRODataset, ZAbstractDataset, UZDataset, StdCtrls,
  CheckLst, Buttons, ExtCtrls, ComCtrls, ToolWin, ImgList, Mask, General,
  ZDbcIntfs, UZDbcFuncs, uMensagem, ZSqlProcessor, Provider, DBClient, Grids,
  DBGrids, UDBGrids;

type
  TformTransferenciaDeTurma = class(TForm)
    pnMatricula: TPanel;
    pnMatriculaTitulo: TPanel;
    gbOrigem: TGroupBox;
    lbOTTurma: TLabel;
    lbOTurma: TLabel;
    lbOTCurso: TLabel;
    lbOCurso: TLabel;
    lbOAnoSem: TLabel;
    lbOTAnoSem: TLabel;
    Panel1: TPanel;
    Panel3: TPanel;
    pnListaAlunos: TPanel;
    Panel2: TPanel;
    gbDestino: TGroupBox;
    bnSelTurma: TSpeedButton;
    bnSelCurso: TSpeedButton;
    lbDTCurso: TLabel;
    lbDTTurma: TLabel;
    lbDTAnoSem: TLabel;
    edDCurso: TEdit;
    edDTurma: TEdit;
    meAnoSem: TMaskEdit;
    udDAnoSem: TUpDown;
    ImageList3: TImageList;
    ToolBar1: TToolBar;
    ToolButton5: TToolButton;
    ToolButton6: TToolButton;
    ToolButton1: TToolButton;
    ToolButton2: TToolButton;
    ToolButton3: TToolButton;
    pnRodape: TPanel;
    btnCancelar: TBitBtn;
    btnConfirmar: TBitBtn;
    qryAtual: TUMZQuery;
    qryNova: TUMZQuery;
    qryAlterarTurma: TUMZQuery;
    qyGruposAtividadesAluno: TUMZQuery;
    qyInativarAluno: TUMZQuery;
    Bevel9: TBevel;
    qryTransfereFreqs: TUMZQuery;
    qryTransfereNotas: TUMZQuery;
    pnTipo: TPanel;
    Panel7: TPanel;
    btTrocaTurma: TBitBtn;
    btTransfInt: TBitBtn;
    pnTitulo: TPanel;
    qryPlanoPagamentoTurma: TUMZQuery;
    qryPlanoPagamentoTurmacd_tipo_plano: TIntegerField;
    qryPlanoPagamentoParcela: TUMZQuery;
    qryPlanoPagamentoPlanoPadrao: TUMZQuery;
    qryAtualizaMatricula: TUMZQuery;
    qryAtualizaMensalidade: TUMZQuery;
    qyTurmasSituacoesFI: TUMZQuery;
    qryAtualizaFicha: TUMZQuery;
    qryInsertMatricula: TUMZQuery;
    qryUpdateNotas: TUMZQuery;
    qyDisciplinasMatriculadas: TUMZQuery;
    qryPlanoPagamentoTurmaparcelas: TIntegerField;
    qryBuscaDadosMatricula: TUMZQuery;
    qryTransfereDiscFicha: TUMZQuery;
    qyAlteraSituacaoTransInterna: TUMZQuery;
    qyGetTurnoAltera: TUMZQuery;
    pnMsg: TPanel;
    lbMsg1: TLabel;
    lbMsg2: TLabel;
    lbMsg3: TLabel;
    lbMsg4: TLabel;
    pnReq: TPanel;
    cbPreReq: TCheckBox;
    sqlScriptAtualizaPED: TZSQLProcessor;
    sqlScriptTrocaTurmaPED: TZSQLProcessor;
    qryAlunos: TUMZReadOnlyQuery;
    dspAlunos: TDataSetProvider;
    dsAlunos: TDataSource;
    cdsAlunos: TClientDataSet;
    qryAlunosCD_PESSOA: TIntegerField;
    qryAlunosNM_PESSOA: TStringField;
    qryAlunosNR_DISCIPLINAS_FORA: TLargeintField;
    cdsAlunosCD_PESSOA: TIntegerField;
    cdsAlunosNM_PESSOA: TStringField;
    cdsAlunosNR_DISCIPLINAS_FORA: TLargeintField;
    cdsAlunosSN_SELECAO: TBooleanField;
    dbgAlunos: TSortedDBGrid;
    cdsAlunosDS_OUTRA_TURMA: TStringField;
    pnlInfo: TPanel;
    Panel4: TPanel;
    cbTurmaDisciplinaMatricula: TCheckBox;
    qryMensalidadesNFE: TUMZQuery;
    procedure dbgAlunosDblClick(Sender: TObject);
    procedure cdsAlunosCalcFields(DataSet: TDataSet);
    procedure dbgAlunosCellClick(Column: TColumn);
    procedure dbgAlunosDrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumn; State: TGridDrawState);
    procedure btTransfIntClick(Sender: TObject);
    procedure btTrocaTurmaClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure btnConfirmarClick(Sender: TObject);
    procedure btnCancelarClick(Sender: TObject);
    procedure udDAnoSemClick(Sender: TObject; Button: TUDBtnType);
    procedure bnSelTurmaClick(Sender: TObject);
    procedure ToolButton6Click(Sender: TObject);
    procedure ToolButton5Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
  private
      FPermiteTrocaCurso: Boolean;
      FOrigemTurma: AnsiString;
      FOrigemCurso: AnsiString;
      FOrigemAnoSem: AnsiString;
    dataMatricula, cd_turnoAtual : String;
    strNova,strTurmaAntiga: String;
    strNovoAnoSem,iAnoSemAntigo,novaSerie,planoPagamento : Integer;
    snReclassifica: Boolean;
    procedure carregaAlunos(cd_turma,cd_curso,nr_anosemestre: String;cd_pessoa:integer;cd_turma_destino: String = '');
    procedure percorreListaPessoas(checar:boolean);
    procedure alterarTurnoMatricula( codigoAluno : String);
    procedure efetuaTrocaDeTurma();
    procedure efetuaTransfInterna(matriculaDisciplinas:Boolean);
    function verificaSelecionados(): boolean;
    function transfPlanoPagamento(codigoAluno:String; var planoPgtPadraoPorCre: Integer): String;
    procedure TrocarCursoVestibular( anosemestre : Integer; codigoAluno : Integer; CursoAtual : String; CursoNovo : String);
    function verificaTurmaMesmaEtapa(): Boolean;
    procedure TransfereDisciplinasOutrasTurmas(const PessoaId, Situacao: Cardinal);
    { Private declarations }
  public
    procedure carregaDados(
      cd_turma,
      cd_curso,
      nr_anosemestre: String;
      cd_pessoa:integer;
      dt_matricula:String;
      cd_turno:String
    );
    { Public declarations }
  end;

var
  formTransferenciaDeTurma: TformTransferenciaDeTurma;

implementation

uses
   uDM,uFSelecionarCurso, uFSelecionarTurma, UFObservacoes, uMatriculas,
   ClassPlanosPagamento, UFTrocaTurmaDetalhesAluno;

{$R *.dfm}

procedure TformTransferenciaDeTurma.btTrocaTurmaClick(Sender: TObject);
var
   PermiteTrocar: Boolean;
begin
   lbMsg1.Caption := 'Ao realizar o processo de Troca de turma o sistema troca as disciplinas para a nova turma e todas as parcelas pagas vencidas';
   lbMsg2.Caption := 'ou pendentes para nova turma e nova unidade. Esse procedimento deve ser utilizado antes do aluno iniciar  as aulas.';
   lbMsg3.Caption := '';
   lbMsg4.Caption := '';
   pnTitulo.Caption := 'TROCA DE TURMA';
   btTrocaTurma.Enabled := false;
   btTransfInt.Enabled := true;
   btnConfirmar.Enabled := true;
   btnCancelar.Enabled := true;
   pnMsg.Height := 35;
   pnMsg.Visible := true;
   formTransferenciaDeTurma.ClientHeight := 611;
   cbPreReq.Checked := false;
   cbPreReq.Enabled := false;
   cbTurmaDisciplinaMatricula.Enabled := False;
   cbTurmaDisciplinaMatricula.Checked := False;


   PermiteTrocar :=
      FPermiteTrocaCurso or
      (
         (meAnoSem.Text = FOrigemAnoSem) and
         (edDCurso.Text = FOrigemCurso)
      );

   if not PermiteTrocar then
   begin
      meAnoSem.Text := FOrigemAnoSem;
      edDCurso.Text := FOrigemCurso;
      edDTurma.Clear;
   end;
end;

procedure TformTransferenciaDeTurma.btTransfIntClick(Sender: TObject);
var
   PermiteTrocar: Boolean;
begin
   lbMsg1.Caption := 'Na transferência interna, o sistema copia as informações do aluno da turma antiga e a situação fica como Transf. Interna,';
   lbMsg2.Caption := 'carregando as informações para a nova turma e deixando a situação como Cursando. O padrão do Financeiro é deixar as parcelas';
   lbMsg3.Caption := 'vencidas e pagas na turma antiga e as parcelas pendentes na nova turma. Essa informação poderá ser alterada através de ';
   lbMsg4.Caption := 'parâmetro solicitando para nossa equipe.';
   pnTitulo.Caption := 'TRANSFERÊNCIA INTERNA';
   btTrocaTurma.Enabled := true;
   btTransfInt.Enabled := false;
   btnConfirmar.Enabled := true;
   btnCancelar.Enabled := true;
   pnMsg.Visible := true;
   pnMsg.Height := 67;
   formTransferenciaDeTurma.ClientHeight := 644;
   cbPreReq.Checked := false;
   cbPreReq.Enabled := true;
   cbTurmaDisciplinaMatricula.Enabled := True;
   cbTurmaDisciplinaMatricula.Checked := False;

   PermiteTrocar :=
      (meAnoSem.Text = FOrigemAnoSem) and
      (edDCurso.Text = FOrigemCurso);

   if not PermiteTrocar then
   begin
      meAnoSem.Text := FOrigemAnoSem;
      edDCurso.Text := FOrigemCurso;
      edDTurma.Clear;
   end;
end;

procedure TformTransferenciaDeTurma.alterarTurnoMatricula( codigoAluno : String );
begin
   qyGetTurnoAltera.Close;
   qyGetTurnoAltera.ParamByName('nr_anosemestre').AsInteger := StrToInt(meAnoSem.Text);
   qyGetTurnoAltera.ParamByName('cd_turma').AsString :=  edDTurma.Text;
   qyGetTurnoAltera.ParamByName('cd_curso').AsString := edDCurso.Text;

   qyGetTurnoAltera.Open;

   if ( cd_turnoAtual = qyGetTurnoAltera.FieldByName('cd_turno').AsString ) then
   begin
      Exit;
   end;

   qryAlterarTurma.SQL.Clear;
   qryAlterarTurma.SQL.Add(
        ' UPDATE '
      + '    matriculas_curso '
      + ' SET '
      + '    cd_turno = '
      + QuotedStr(qyGetTurnoAltera.FieldByName('cd_turno').AsString)
      + ' WHERE '
      + '    cd_pessoa = :codigoaluno '
      + ' AND cd_curso = :curso '
   );

   qryAlterarTurma.ParamByName('codigoaluno').AsString := codigoAluno;
   qryAlterarTurma.ParamByName('curso').AsString := lbOCurso.Caption;

   qryAlterarTurma.ExecSQL;
end;

procedure TformTransferenciaDeTurma.bnSelTurmaClick(Sender: TObject);
var
   resultado_filtro : TResultadoFiltroTurma;
   curso: String;
   msgAlerta: String;
   AnoSemestre: Integer;
   BloqueioFiltro: TBloqueioFiltroTurma;
begin
   { Pesquisar Turmas }
   curso := lbOCurso.Caption;
   if(edDCurso.Text <> '') then
   begin
      curso := edDCurso.Text;
   end;

   AnoSemestre := StrToIntDef(meAnoSem.Text, DM.GetAnoSemestreAtual);

   if not btTrocaTurma.Enabled then
   begin

      BloqueioFiltro := [bftMostraReclassificacao];

      if not FPermiteTrocaCurso then
      begin
         AnoSemestre := StrToIntDef(FOrigemAnoSem, DM.GetAnoSemestreAtual);
         Include(BloqueioFiltro, bftAnosemestre);
         Include(BloqueioFiltro, bftCurso);
      end;
      
      resultado_filtro := TfrmSelecionarTurma.Filtrar(BloqueioFiltro, AnoSemestre, -1, -1, curso);
   end;

   if not btTransfInt.Enabled then
   begin
      resultado_filtro := TfrmSelecionarTurma.Filtrar([bftMostraReclassificacao, bftCurso], AnoSemestre, -1, -1, curso);
   end;

   msgAlerta:= 'Você está tentando alterar a matricula para um Ano/Semestre ou curso diferente do atual.'+#13+#13+
               'Do Anosemestre '+lbOAnoSem.Caption+', Curso '+lbOCurso.Caption+', Turma '+lbOTurma.Caption+#13+
               'para Anosemestre '+inttostr(resultado_filtro.nr_anosemestre)+', Curso '+ resultado_filtro.cd_curso+', Turma '+resultado_filtro.cd_turma+#13+#13+
               'O aconselhável seria realizar uma nova matrícula para o aluno e inativar a atual.'+#13+'Deseja confirmar a troca ?';


   if resultado_filtro.filtrado then
   begin
      { Verificar se é no mesmo anosemestre }
      if ((meAnoSem.Text <> inttostr(resultado_filtro.nr_anosemestre)) or (edDCurso.Text <> resultado_filtro.cd_curso)) Then
      Begin
        if Mensagem(msgAlerta, 'Confirmação', MB_YESNOCANCEL + MB_ICONQUESTION) <> mrYes then
        begin
          exit;
        end;
      End;

      meAnoSem.Text := inttostr(resultado_filtro.nr_anosemestre);
      edDCurso.Text := resultado_filtro.cd_curso;
      edDTurma.Text := resultado_filtro.cd_turma;
      snReclassifica := resultado_filtro.sn_reclassificacao;
      novaSerie := resultado_filtro.nr_serie;

      carregaAlunos(
        cdsAlunos.Params.ParamByName('CD_TURMA').AsString,
        cdsAlunos.Params.ParamByName('CD_CURSO').AsString,
        cdsAlunos.Params.ParamByName('NR_ANOSEMESTRE').AsString,
        -1,
        resultado_filtro.cd_turma
      );
      
   end;
end;

procedure TformTransferenciaDeTurma.btnCancelarClick(Sender: TObject);
begin
   self.Close;
end;

procedure TformTransferenciaDeTurma.btnConfirmarClick(Sender: TObject);
var
   matriculaDisciplinas: Boolean;
begin
   if (edDTurma.Text = '') then
   begin
      Mensagem( 'Você deve selecionar uma turma para prosseguir.', Application.Title, MB_OK + MB_ICONSTOP );
      exit;
   end;

   if (verificaSelecionados() = false) then
   begin
      Mensagem( 'Você deve selecionar pelo menos um aluno para prosseguir.', Application.Title, MB_OK + MB_ICONSTOP );
      exit;
   end;

   if ((edDTurma.Text = lbOTurma.Caption) AND (meAnoSem.Text = lbOAnoSem.Caption)) then
   begin
      Mensagem( 'Você deve selecionar uma turma diferente da atual para prosseguir.', Application.Title, MB_OK + MB_ICONSTOP );
      exit;
   end;

   if(btTransfInt.Enabled = false) then
   begin
      matriculaDisciplinas := (
         Mensagem(
            'Matricular as disciplinas da nova turma para os alunos?',
            'Confirmação',
            MB_YESNO + MB_ICONQUESTION
         ) = mrYes
      );

      TfrmTrocaTurmaDetalhesAluno.PreparaFichaIndividual(
         StrToInt(FOrigemAnoSem),
         FOrigemCurso,
         FOrigemTurma,
         edDTurma.Text
      );

      efetuaTransfInterna(matriculaDisciplinas);
   end else begin
      //Verifica etapa
      if not (verificaTurmaMesmaEtapa()) then
      begin
         Mensagem( 'Não é possivel realizar a troca de turmas entre etapas diferentes.', Application.Title, MB_OK + MB_ICONSTOP );
         exit;
      end;


      //Troca de Turma
      efetuaTrocaDeTurma();
   end;

   self.Close;
end;

procedure TformTransferenciaDeTurma.carregaAlunos(cd_turma,cd_curso,nr_anosemestre: String;cd_pessoa:integer;cd_turma_destino: String='');
var
   i: Integer;
   arrAlunosSelecionados: TStringList;
begin

   cdsAlunos.Filter := 'SN_SELECAO';
   cdsAlunos.Filtered := True;

   arrAlunosSelecionados := TStringList.Create;
   while not cdsAlunos.Eof do
   begin
      arrAlunosSelecionados.Add(cdsAlunosCD_PESSOA.AsString);
      
      cdsAlunos.Next;
   end;

   cdsAlunos.Filter := '';
   cdsAlunos.Filtered := False;

   if cdsAlunos.Active then
      cdsAlunos.Close;

   cdsAlunos.Params.ParamByName('NR_ANOSEMESTRE').AsString := nr_anosemestre;
   cdsAlunos.Params.ParamByName('CD_CURSO').AsString := cd_curso;
   cdsAlunos.Params.ParamByName('CD_TURMA').AsString := cd_turma;
   cdsAlunos.Params.ParamByName('CD_TURMA_DESTINO').AsString := cd_turma_destino;
   cdsAlunos.Open;

   if cdsAlunos.Locate('CD_PESSOA', cd_pessoa, []) then
   begin
      cdsAlunos.Edit;
      cdsAlunosSN_SELECAO.AsBoolean := True;
      cdsAlunos.Post;
   end;

   for i := 0 to arrAlunosSelecionados.Count - 1 do
   begin
      if cdsAlunos.Locate('CD_PESSOA', arrAlunosSelecionados[i], []) then
      begin
         cdsAlunos.Edit;
         cdsAlunosSN_SELECAO.AsBoolean := True;
         cdsAlunos.Post;
      end;
   end;
end;

procedure TformTransferenciaDeTurma.carregaDados(cd_turma,cd_curso,nr_anosemestre: String;cd_pessoa:integer;dt_matricula:String;cd_turno:String);
var
   S: AnsiString;
begin
   S := DM.variavel_parametro('Matriculas.TrocaTurma.TrocaCurso');

   FPermiteTrocaCurso := S = 'S';

   FOrigemTurma := cd_turma;
   FOrigemCurso := cd_curso;
   FOrigemAnoSem := nr_anosemestre;

   //Origem
   lbOAnoSem.Caption := nr_anosemestre;
   lbOCurso.Caption := cd_curso;
   lbOTurma.Caption := cd_turma;
   cd_turnoAtual := cd_turno;

   //Destino - padrão
   meAnoSem.Text := nr_anosemestre;
   edDCurso.Text := cd_curso;
   edDTurma.Text := '';

   dataMatricula := dt_matricula;

   carregaAlunos(cd_turma,cd_curso,nr_anosemestre,cd_pessoa);
end;

procedure TformTransferenciaDeTurma.cdsAlunosCalcFields(DataSet: TDataSet);
begin
   if DataSet.State = dsInternalCalc then
   begin
      DataSet.FieldByName('DS_OUTRA_TURMA').AsString := '';
      
      if DataSet.FieldByName('NR_DISCIPLINAS_FORA').AsInteger > 0 then
         DataSet.FieldByName('DS_OUTRA_TURMA').AsString := '*';
   end;
end;

procedure TformTransferenciaDeTurma.dbgAlunosCellClick(Column: TColumn);
begin
   if Column.Field.DataType = ftBoolean then
   begin
      Column.Field.DataSet.Edit;
      Column.Field.AsBoolean := not Column.Field.AsBoolean;
      Column.Field.DataSet.Post;
   end;
end;

procedure TformTransferenciaDeTurma.dbgAlunosDblClick(Sender: TObject);
begin
   if (cdsAlunosNR_DISCIPLINAS_FORA.AsInteger > 0) and
      (not btTransfInt.Enabled) and
      (Length(edDTurma.Text) > 0) then
      TfrmTrocaTurmaDetalhesAluno.ShowFichaIndividual(
         StrToInt(FOrigemAnoSem),
         FOrigemCurso,
         FOrigemTurma,
         edDTurma.Text,
         cdsAlunosCD_PESSOA.AsInteger);
end;

procedure TformTransferenciaDeTurma.dbgAlunosDrawColumnCell(Sender: TObject;
  const Rect: TRect; DataCol: Integer; Column: TColumn; State: TGridDrawState);
const
   IsChecked: array[Boolean] of Integer = (DFCS_BUTTONCHECK, DFCS_BUTTONCHECK or DFCS_CHECKED);
var
   DrawRect: TRect;
begin
   if Column.Field.DataType = ftBoolean then
   begin
      DrawRect := Rect;
      InflateRect(DrawRect, -2, -2);
      TDBGrid(Sender).Canvas.FillRect(Rect);
      DrawFrameControl(TDBGrid(Sender).Canvas.Handle, DrawRect, DFC_BUTTON,
         IsChecked[Column.Field.AsBoolean]);
   end;
end;

procedure TformTransferenciaDeTurma.efetuaTransfInterna(matriculaDisciplinas:Boolean);

   procedure UpdateTurmaMatricula(const AlunoID, AnoSemestre: Cardinal;
      const TurmaAntigaID, TurmaNovaID: AnsiString);
   const
      SSQLUpdateFicha = ''
         + 'UPDATE '
         + '	fichaindividual f '
         + '	INNER JOIN turmas t ON ( '
         + '    t.anosemestre = f.anosemestre AND '
         + '    t.codigo = f.turma '
         + '  ) '
         + 'SET '
         + '	f.turmamatricula = ? '
         + 'WHERE '
         + '	f.codigoaluno = ? AND '
         + '	((f.turma = ?)) AND '
         + '	f.turmamatricula = ? AND '
         + '	f.anosemestre = ? AND '
         + '	EXISTS ( '
         + '		SELECT '
         + '			s.cd_situacao '
         + '		FROM '
         + '			situacao s '
         + '		WHERE '
         + '			f.situacao = s.cd_situacao AND '
         + '			s.cd_situacao_pai IN (1,10) '
         + '	) ';
   var
      Stmt: IZPreparedStatement;
   begin
      Stmt := PrepareStatement(SSQLUpdateFicha);
      try
         Stmt.SetString(1, TurmaNovaID);
         Stmt.SetInt(2, AlunoID);
         Stmt.SetString(3, TurmaNovaID);
         Stmt.SetString(4, TurmaAntigaID);
         Stmt.SetInt(5, AnoSemestre);
         Stmt.ExecutePrepared;
      finally
         Stmt.Close;
      end;
   end;


   procedure TransfereDisciplinasAprovadas(const AlunoID, AnoSemestre: Cardinal;
      const TurmaAntigaID, TurmaNovaID: AnsiString);
   const
      SSQLUpdateFicha = ''
         + 'UPDATE '
         + '	fichaindividual f '
         + '	INNER JOIN turmas t ON ( '
         + '    t.anosemestre = f.anosemestre AND '
         + '    t.codigo = f.turma '
         + '  ) '
         + 'SET '
         + '	f.turmamatricula = ? '
         + 'WHERE '
         + '	f.codigoaluno = ? AND '
         + '	f.turmamatricula = ? AND '
         + '	f.anosemestre = ? AND '
         + '	EXISTS ( '
         + '		SELECT '
         + '			s.cd_situacao '
         + '		FROM '
         + '			situacao s '
         + '		WHERE '
         + '			f.situacao = s.cd_situacao AND '
         + '			s.cd_situacao_pai IN (0) '
         + '	) ';
   var
      Stmt: IZPreparedStatement;
   begin
      Stmt := PrepareStatement(SSQLUpdateFicha);
      try
         Stmt.SetString(1, TurmaNovaID);
         Stmt.SetInt(2, AlunoID);
         Stmt.SetString(3, TurmaAntigaID);
         Stmt.SetInt(4, AnoSemestre);
         Stmt.ExecutePrepared;
      finally
         Stmt.Close;
      end;
   end;

const
   LOG_TRANSFERENCIA_INTERNA =
      '[Transferência INTERNA]' + #13 + #13 +
      #9 + 'Informações da Matrícula Anterior:' + #13 +
      #9 + #9 + 'CODIGOALUNO: %d' + #13 +
      #9 + #9 + 'ANOSEMESTRE: %d' + #13 +
      #9 + #9 + 'CURSO: %s' + #13 +
      #9 + #9 + 'TURMA: %s' + #13 + #13 +
      #9 + 'Informações da Matrícula Nova:' + #13 +
      #9 + #9 + 'CODIGOALUNO: %d' + #13 +
      #9 + #9 + 'ANOSEMESTRE: %d' + #13 +
      #9 + #9 + 'CURSO: %s' + #13 +
      #9 + #9 + 'TURMA: %s' + #13 + #13 +
      #9 + 'Disciplinas Matriculadas:' + #13 +
      #9 + #9 + '%s';
var
   Observacao,
   chaves,
   cursoAtual,
   codigoAluno,
   sCodigosTitulosJaCancelados,
   mensagemErro,
   erroAtual,
   sSituacaoAtt,
   nomeAluno : String;

   quantPlanoPgtNovo,
   iSituacao,
   iReclassificacao,
   planoPgtPadraoPorCre,
   i,
   codigoPlanoTurma : Integer;

   vl_credito_from_plano: Double;

   iNum: LongInt;

   qyAux,
   qyAlteraMonografia,
   qryRealizaConsulta: TUMZQuery;

   parametros: TParamsIni;

   situacaoParcelas,
   sqlOriginal : String;
begin
  mensagemErro := '';
  qryNova.Close;
  qryAtual.Close;
  qryAlterarTurma.Close;
  dm.CriarConsulta(qryRealizaConsulta);

  strNova := edDTurma.Text;
  strTurmaAntiga := lbOTurma.Caption;
  strNovoAnoSem := strtoint(meAnoSem.Text);
  iAnoSemAntigo := strtoint(lbOAnoSem.Caption);
  cursoAtual := lbOCurso.Caption;

  { Verificar se é uma troca de turma ou transferencia interna }
  qryNova.ParamByName('AnoSemestre').AsInteger := strNovoAnoSem;
  qryNova.ParamByName('Turma').AsString := strNova;
  qryNova.Open;

  qryAtual.ParamByName('AnoSemestre').AsInteger := iAnoSemAntigo;
  qryAtual.ParamByName('Turma').AsString := strTurmaAntiga;
  qryAtual.Open;

  sqlOriginal := qryAtualizaMensalidade.SQL.Text;
  //Verifica quais parcelas deve levar para a nova turma
  IF (DM.variavel_parametro('financeiro_parcelas') = '[PAGAS]') then
  begin
      //Apenas pagas
      qryAtualizaMensalidade.SQL.Add(' AND situacao in (0,3,5)');
  end
  else IF (DM.variavel_parametro('financeiro_parcelas') = '[TODAS]') then
  begin
      //TODAS AS SITUACOES
  end else begin
      //Apenas pendentes, vem por ultimo pois é o padrão
      qryAtualizaMensalidade.SQL.Add(' AND situacao = 2 and date(datavencimento) >= date(NOW())');
  end;

  { Apenas troca de Turma }
  Screen.Cursor := crHourGlass;
  try
   cdsAlunos.DisableControls;
   cdsAlunos.Filter := 'SN_SELECAO';
   cdsAlunos.Filtered := True;
   cdsAlunos.First;
   while not cdsAlunos.Eof do
   begin
      codigoAluno := cdsAlunosCD_PESSOA.AsString;
      nomeAluno := cdsAlunosNM_PESSOA.AsString;

      qryBuscaDadosMatricula.Close;
      qryBuscaDadosMatricula.ParamByName('codigoAluno').AsString := codigoAluno;
      qryBuscaDadosMatricula.ParamByName('turma').AsString := strTurmaAntiga;
      qryBuscaDadosMatricula.ParamByName('anosemestre').AsInteger := iAnoSemAntigo;
      qryBuscaDadosMatricula.Open;

      planoPagamento := qryBuscaDadosMatricula.FieldByName('planopagamento').AsInteger;

      { Verifica se o plano de pagamento do aluno é por crédito, se for checa se existe }
      { um plano que possa ser utulizado na turma de destino sem causar erros no financeiro }
      planoPgtPadraoPorCre := 0;

      erroAtual := self.transfPlanoPagamento(codigoAluno, planoPgtPadraoPorCre);
      { Método responsavel por verificar o Plano de Pagamento}
      if ( erroAtual <> '' ) then
      begin
         //Aconteceu algum erro com o plano do aluno, adiciona a mensagem e pula
         erroAtual := 'Aluno: ' + nomeAluno +#13 + 'Situação: ' + erroAtual + #13;
         mensagemErro := mensagemErro + erroAtual + #13;
         cdsAlunos.Next;
         continue;
      end;

      { Alteração na Tabela de Matriculas }
      qryAlterarTurma.SQL.Clear;

      // caso a check reclassificação esteja habilitada a situação fica com recalssificação
      iReclassificacao := 8;
      if snReclassifica then
      begin
         iReclassificacao := 15
      end;

      qryAtualizaMatricula.Close;
      qryAtualizaMatricula.ParamByName('situacao').AsInteger := iReclassificacao;
      qryAtualizaMatricula.ParamByName('usuario').AsString := DM.sLogin;
      qryAtualizaMatricula.ParamByName('CodigoAluno').AsString := codigoAluno;
      qryAtualizaMatricula.ParamByName('Turma').AsString := strTurmaAntiga;
      qryAtualizaMatricula.ParamByName('AnoSemestre').AsInteger := iAnoSemAntigo;
      qryAtualizaMatricula.ParamByName('Data').AsString := FormatDateTime('yyyy-mm-dd',DM.DataAtual());
      qryAtualizaMatricula.ExecSQL;

      sCodigosTitulosJaCancelados := ClassePlanosPagamento.getDistratoTitulosCancelados(
               iAnoSemAntigo, cursoAtual, strTurmaAntiga, strtoint(codigoAluno)
      );

      if ClassePlanosPagamento.hasDistratoContratual(
               iAnoSemAntigo, cursoAtual, strTurmaAntiga, strtoint(codigoAluno), iReclassificacao ) then
      begin
         ClassePlanosPagamento.GeraMensalidadeDistratoContratual(
               iAnoSemAntigo, cursoAtual, strTurmaAntiga, strtoint(codigoAluno), sCodigosTitulosJaCancelados
         );
      end;

      codigoPlanoTurma := planoPgtPadraoPorCre;
      // Quando o plano de pagamento não for por crédito
      if planoPgtPadraoPorCre = 0 then
      begin
         codigoPlanoTurma := planoPagamento;
      end;

      vl_credito_from_plano := ClassePlanosPagamento.getPlanoFromTurma(
         strNovoAnoSem, qryNova.fieldByName('cd_coligada').AsInteger, codigoPlanoTurma,
         qryNova.fieldByName('curso').AsString, strNova
      );

      // Houve algum problema no cálculo do valor de credito (não deve ser zero)
      if vl_credito_from_plano = 0 then
      begin
         { A mensagem informa que não foi possível determinar o novo valor  financeiro,
           nesse caso a transferência interna será realizada, no entanto,
           o valor financeiro do aluno não foi alterado mantendo os valores que o aluno já possuía. }
         if ( erroAtual = '' ) then
         begin
            erroAtual := 'Aluno: ' + nomeAluno + #13;
         end;
         erroAtual := erroAtual + 'Situação: Não foi possível determinar o novo valor  financeiro, nesse caso a transferência interna será realizada, no entanto, o valor financeiro do aluno não foi alterado mantendo os valores que o aluno já possuía.' + #13;
      end;

      { Alteração na Tabela de Mensalidades }
      qryAtualizaMensalidade.Close;
      qryAtualizaMensalidade.ParamByName('vl_credito').AsFloat := vl_credito_from_plano;
      qryAtualizaMensalidade.ParamByName('CodigoAluno').AsString := codigoAluno;
      qryAtualizaMensalidade.ParamByName('Turma').AsString := strTurmaAntiga;
      qryAtualizaMensalidade.ParamByName('AnoSemestre').AsInteger := iAnoSemAntigo;
      qryAtualizaMensalidade.ParamByName('NovoCurso').AsString := qryNova.fieldByName('curso').AsString;
      qryAtualizaMensalidade.ParamByName('NovoDepto').AsInteger := qryNova.fieldByName('cd_depto').AsInteger;
      qryAtualizaMensalidade.ParamByName('NovaTurma').AsString := strNova;
      qryAtualizaMensalidade.ParamByName('NovoAnoSem').AsInteger := strNovoAnoSem;
      qryAtualizaMensalidade.ParamByName('NovaColigada').AsInteger := qryNova.fieldByName('cd_coligada').AsInteger;
      qryAtualizaMensalidade.ExecSQL;


      // Alguma mensalidade do aluno já foi gerada uma NFE
      qryMensalidadesNFE.Close;
      qryMensalidadesNFE.ParamByName('CodigoAluno').AsString := codigoAluno;
      qryMensalidadesNFE.ParamByName('Turma').AsString := strTurmaAntiga;
      qryMensalidadesNFE.ParamByName('AnoSemestre').AsInteger := iAnoSemAntigo;
      qryMensalidadesNFE.ParamByName('NovaColigada').AsInteger := qryNova.fieldByName('cd_coligada').AsInteger;
      qryMensalidadesNFE.Open;

      if not qryMensalidadesNFE.Eof then
      begin
         // Avisa o usuário que os títulos ficarão na turma antiga.
         if ( erroAtual = '' ) then
         begin
            erroAtual := 'Aluno: ' + nomeAluno + #13;
         end;
         erroAtual := erroAtual + 'Situação: O aluno possui títulos com nota fiscal já emitida em outra unidade. Esses títulos não foram levados a nova turma.' + #13;
      end;

      { Alteração na Tabela de FichaIndividual }
      qryAtualizaFicha.Close;
      qryAtualizaFicha.ParamByName('RECLASSIFICA').AsInteger := iReclassificacao;
      qryAtualizaFicha.ParamByName('CODIGOALUNO').AsString := codigoAluno;
      qryAtualizaFicha.ParamByName('TURMA').AsString := strTurmaAntiga;
      qryAtualizaFicha.ParamByName('TURMA_NOVA').AsString := strNova;
      qryAtualizaFicha.ParamByName('ANOSEMESTRE').AsInteger := iAnoSemAntigo;
      qryAtualizaFicha.ExecSQL;

      UpdateTurmaMatricula(
         cdsAlunosCD_PESSOA.AsInteger,
         iAnoSemAntigo,
         strTurmaAntiga,
         strNova
      );

      if ( cbTurmaDisciplinaMatricula.Checked ) then
      begin
         TransfereDisciplinasAprovadas(
            cdsAlunosCD_PESSOA.AsInteger,
            iAnoSemAntigo,
            strTurmaAntiga,
            strNova
         );
      end;

      { Atualização das tabelas do pedagógico }
      sqlScriptAtualizaPED.ParamByName('CD_TURMA_NOVA').AsString := strNova;
      sqlScriptAtualizaPED.ParamByName('CD_PESSOA').AsString := codigoAluno;
      sqlScriptAtualizaPED.ParamByName('CD_TURMA').AsString := strTurmaAntiga;
      sqlScriptAtualizaPED.ParamByName('NR_ANOSEMESTRE').AsInteger := iAnoSemAntigo;
      sqlScriptAtualizaPED.Execute;

      {Verifica se o aluno possui alguma monografia cadastrada e
      altera a tabela de monografias caso o aluno possua algum registro}
      qryRealizaConsulta.SQL.Clear;
      qryRealizaConsulta.SQL.Add(' SELECT count(cd_pessoa) as qtd FROM monografias ');
      qryRealizaConsulta.SQL.Add(' where cd_pessoa = :CodigoAluno ');

      qryRealizaConsulta.ParamByName('CodigoAluno').AsString := codigoAluno;
      qryRealizaConsulta.Open;

      if (qryRealizaConsulta.FieldByName('qtd').AsInteger > 0) then
      begin
         DM.CriarConsulta(qyAlteraMonografia);

         {Altera tabela de monografia do aluno}
         while not(qryRealizaConsulta.eof) do
         begin
            qyAlteraMonografia.SQL.Text :=
               'UPDATE monografias set cd_turma = :NovaTurma,  ' +
               '   cd_curso = :NovoCurso,                      ' +
               '   nr_anosemestre = :NovoAnoSem                ' +
               'WHERE cd_pessoa = :CodigoAluno                 ' +
               '   AND cd_turma = :Turma                       ' +
               '   AND nr_anosemestre = :AnoSem                ';

            qyAlteraMonografia.ParamByName('CodigoAluno').AsString := codigoAluno;
            qyAlteraMonografia.ParamByName('Turma').AsString := strTurmaAntiga;
            qyAlteraMonografia.ParamByName('AnoSem').AsInteger := iAnoSemAntigo;
            qyAlteraMonografia.ParamByName('NovoCurso').AsString := qryNova.fieldByName('curso').AsString;
            qyAlteraMonografia.ParamByName('NovaTurma').AsString := strNova;
            qyAlteraMonografia.ParamByName('NovoAnoSem').AsInteger := strNovoAnoSem;
            qyAlteraMonografia.ExecSQL;

            qryRealizaConsulta.Next;
         end;
      end;
      
      { Criar nova Matrícula para o aluno }
      iNum := 0;
      // Pegar o Número do Aluno na turma
      if (DM.variavel_parametro('matriculas_apresentar_nro_aluno') = 'S') then begin
         iNum := DM.DefineNumeroMatricula(strNova, iAnoSemAntigo)
      end;

      qryInsertMatricula.Close;
      qryInsertMatricula.ParamByName('CODIGOALUNO').AsString := codigoAluno;
      qryInsertMatricula.ParamByName('TURMA').AsString := strNova;
      qryInsertMatricula.ParamByName('ANOSEMESTRE').AsInteger := strNovoAnoSem;
      qryInsertMatricula.ParamByName('CURSO').AsString := qryNova.FieldByName('curso').AsString;
      qryInsertMatricula.ParamByName('DATAEMISSAO').AsDate := Dm.DataAtual;
      qryInsertMatricula.ParamByName('USUARIO').AsString := DM.sLogin;
      qryInsertMatricula.ParamByName('SITUACAO').AsInteger := qryBuscaDadosMatricula.FieldByName('situacao').AsInteger;
      qryInsertMatricula.ParamByName('PLANODESCONTO').AsInteger := qryBuscaDadosMatricula.FieldByName('planodesconto').AsInteger;
      qryInsertMatricula.ParamByName('CD_INGRESSO').AsInteger := qryBuscaDadosMatricula.FieldByName('cd_ingresso').AsInteger;
      qryInsertMatricula.ParamByName('CD_INSTITUICAO_ORIGEM').AsInteger := qryBuscaDadosMatricula.FieldByName('cd_instituicao_origem').AsInteger;
      qryInsertMatricula.ParamByName('NR_ALUNO').AsInteger := iNum;
      qryInsertMatricula.ParamByName('CD_MATRICULA_CURSO').AsInteger := qryBuscaDadosMatricula.FieldByName('cd_matricula_curso').AsInteger;
      qryInsertMatricula.ParamByName('CD_MATRICULA').AsString := qryBuscaDadosMatricula.FieldByName('nr_matricula').AsString;
      qryInsertMatricula.ParamByName('CD_TURMA_ANTERIOR').AsString := strTurmaAntiga;

      { Caso nas verificações do plano de pagamento for verificado que a turma de destino possui mais de 1 plano e tinha um padrao, passa a utilizar este para o aluno }
      qryInsertMatricula.ParamByName('PLANOPAGAMENTO').AsInteger := planoPagamento;
      if planoPgtPadraoPorCre <> 0 then
      begin
         qryInsertMatricula.ParamByName('PLANOPAGAMENTO').AsInteger := planoPgtPadraoPorCre;
      end;
      qryInsertMatricula.ExecSQL;

      {
         Altera o turno na tabela matricula curso caso o turno da nova
         turma for diferente do turno atual do aluno
      }
      alterarTurnoMatricula( codigoAluno );

      { Tentar alterar a tabela de Vestibular }
      TrocarCursoVestibular( iAnoSemAntigo ,strtoint(codigoAluno), cursoAtual, qryNova.FieldByName('curso').AsString );

      { Registrar em observações }
      Observacao := 'TRANSFERIDO DA TURMA: ' + strTurmaAntiga  +', ANO/SEMESTRE: ' +  INTTOSTR(iAnoSemAntigo) +
                        '  PARA A TURMA: ' + strNova + ', ANO/SEMESTRE: ' + INTTOSTR(strNovoAnoSem);
      TfObservacoes.RegisterObservation(strtoint(codigoAluno), okMatriculation, Observacao);

      // Transferir as disciplinas matriculadas em turmas diferentes da turma de matrícula do aluno

      TransfereDisciplinasOutrasTurmas(cdsAlunosCD_PESSOA.AsInteger, iReclassificacao);

      qryTransfereDiscFicha.Close;
      qryTransfereDiscFicha.ParamByName('novaturma').AsString := strNova;
      qryTransfereDiscFicha.ParamByName('anosemnovo').AsInteger := strNovoAnoSem;
      qryTransfereDiscFicha.ParamByName('anosemAntigo').AsInteger := iAnoSemAntigo;
      qryTransfereDiscFicha.ParamByName('turmamat').AsString := strTurmaAntiga;
      qryTransfereDiscFicha.ParamByName('codigoaluno').AsString := codigoAluno;
      qryTransfereDiscFicha.ExecSQL;

      if matriculaDisciplinas then
      begin
         DM.MatricularGrade(strtoint(codigoAluno), strNova, strNovoAnoSem,
            qryNova.FieldByName('cd_grade').AsString, cbPreReq.Checked, True);

         qyTurmasSituacoesFI.Close;
         qyTurmasSituacoesFI.ParamByName('CodigoAluno').AsString := codigoAluno;
         qyTurmasSituacoesFI.ParamByName('Turma').AsString := strTurmaAntiga;
         qyTurmasSituacoesFI.ParamByName('AnoSemestre').AsInteger := iAnoSemAntigo;
         qyTurmasSituacoesFI.Open;
         qyTurmasSituacoesFI.First;

         { Alteração na Tabela de FichaIndividual }
         while not qyTurmasSituacoesFI.Eof do
         begin
            qryRealizaConsulta.SQL.Clear;

            sSituacaoAtt := qyTurmasSituacoesFI.FieldByName('situacao').AsString;

            qryRealizaConsulta.SQL.Add('update FichaIndividual set Situacao = ' + sSituacaoAtt + ', ' ); // Passa a situação anterior.
            qryRealizaConsulta.SQL.Add('dt_saida = :data_saida ');
            qryRealizaConsulta.SQL.Add('where CodigoAluno = :CodigoAluno AND TurmaMatricula = :Turma AND AnoSemestre = :AnoSemestre ');
            qryRealizaConsulta.SQL.Add('AND disciplina = :disciplina AND curso = :curso');

            qryRealizaConsulta.ParamByName('CodigoAluno').AsInteger := qyTurmasSituacoesFI.FieldByName('CodigoAluno').AsInteger;
            qryRealizaConsulta.ParamByName('Turma').AsString := strNova;
            qryRealizaConsulta.ParamByName('AnoSemestre').AsInteger := qyTurmasSituacoesFI.FieldByName('AnoSemestre').AsInteger;
            qryRealizaConsulta.ParamByName('disciplina').AsInteger := qyTurmasSituacoesFI.FieldByName('disciplina').AsInteger;
            qryRealizaConsulta.ParamByName('curso').asString := qyTurmasSituacoesFI.FieldByName('curso').asString;

            qryRealizaConsulta.ParamByName('data_saida').Clear;

            if (qyTurmasSituacoesFI.FieldByName('dt_saida').AsDateTime) <> 0 then
            begin
               qryRealizaConsulta.ParamByName('data_saida').AsDateTime :=  qyTurmasSituacoesFI.FieldByName('dt_saida').AsDateTime;
            end;
            
            qryRealizaConsulta.ExecSQL;

            qyTurmasSituacoesFI.Next;
         end;

         qyAlteraSituacaoTransInterna.ParamByName('CODIGOALUNO').AsString := codigoAluno;
         qyAlteraSituacaoTransInterna.ParamByName('TURMA').AsString := strNova;
         qyAlteraSituacaoTransInterna.ParamByName('ANOSEMESTRE').AsInteger := strNovoAnoSem;
         qyAlteraSituacaoTransInterna.ExecSQL;

         { Tranferência de Notas /Bloquear as Notas ja digitadas }
         qryUpdateNotas.ParamByName('SITUACAO').AsInteger := iReclassificacao;
         qryUpdateNotas.ParamByName('CODIGOALUNO').AsString := codigoAluno;
         qryUpdateNotas.ParamByName('ANOSEMESTRE').AsInteger := iAnoSemAntigo;
         qryUpdateNotas.ParamByName('TURMA_DESTINO').AsString := strNova;
         qryUpdateNotas.ParamByName('TURMA_ORIGEM').AsString := strTurmaAntiga;
         qryUpdateNotas.ExecSQL;

         // Transferir as notas parciais
         if Dm.variavel_parametro('TransferenciaLevarNotasParciais') = 'S' then begin
            qryTransfereFreqs.ParamByName('CD_PESSOA').AsString := codigoAluno;
            qryTransfereFreqs.ParamByName('CD_TURMA').AsString := strTurmaAntiga;
            qryTransfereFreqs.ParamByName('NR_ANOSEM').AsInteger := iAnoSemAntigo;
            qryTransfereFreqs.ParamByName('CD_TURMA_NOVA').AsString := strNova;
            qryTransfereFreqs.ParamByName('NR_ANOSEM_NOVO').AsInteger := strNovoAnoSem;
            qryTransfereFreqs.ExecSQL;

            qryTransfereNotas.ParamByName('CD_PESSOA').AsString := codigoAluno;
            qryTransfereNotas.ParamByName('CD_TURMA').AsString := strTurmaAntiga;
            qryTransfereNotas.ParamByName('NR_ANOSEM').AsInteger := iAnoSemAntigo;
            qryTransfereNotas.ParamByName('CD_TURMA_NOVA').AsString := strNova;
            qryTransfereNotas.ParamByName('NR_ANOSEM_NOVO').AsInteger := strNovoAnoSem;
            qryTransfereNotas.ExecSQL;
         end;

         if vl_credito_from_plano > 0 then
         begin
            DM.recalcular_creditos_financeiros( strtoint(codigoAluno), strNova, strNovoAnoSem, true );
         end;

         qyDisciplinasMatriculadas.Close;
         qyDisciplinasMatriculadas.ParamByName('anosem').AsInteger := strNovoAnoSem;
         qyDisciplinasMatriculadas.ParamByName('turma').AsString := strNova;
         qyDisciplinasMatriculadas.ParamByName('codigoAluno').AsInteger := strtoint(codigoAluno);
         qyDisciplinasMatriculadas.Open();

         { *************************************** }
         DM.setLog(
            1018,
            'Alteracao',
            codigoAluno+';'+IntToStr(strNovoAnoSem)+';'+strTurmaAntiga+';'+strNova,
            DM.getColigadaByTurma(strNova,strNovoAnoSem),
            Format(LOG_TRANSFERENCIA_INTERNA,
                  [strtoint(codigoAluno),
                   strNovoAnoSem,
                   cursoAtual,
                   strTurmaAntiga,
                   strtoint(codigoAluno),
                   strNovoAnoSem,
                   qryNova.fieldByName('curso').AsString,
                   strNova ,
                   qyDisciplinasMatriculadas.FieldByName('msg').AsString
                  ]
            )
         );

         // Verifica se a matrícula do aluno está vinculado em disciplinas com grupos de atividades criados
         qyGruposAtividadesAluno.Close;
         qyGruposAtividadesAluno.ParamByName('nr_anosemestre').AsInteger := iAnoSemAntigo;
         qyGruposAtividadesAluno.ParamByName('cd_curso').AsString := cursoAtual;
         qyGruposAtividadesAluno.ParamByName('cd_turma').AsString := strTurmaAntiga;
         qyGruposAtividadesAluno.ParamByName('cd_pessoa').AsString := codigoAluno;
         qyGruposAtividadesAluno.Open;

         // Aluno vinculado a grupos de atividades (nessa matrícula)
         if not qyGruposAtividadesAluno.Eof then
         begin
            // Avisa o usuário que ele está transferindo a matrícula de um aluno que possui vinculos em disciplinas com grupos de atividades
            if ( erroAtual = '' ) then
            begin
               erroAtual := 'Aluno: ' + nomeAluno + #13;
            end;
            erroAtual := erroAtual + 'Situação: Você transferiu um aluno que possui disciplinas com grupos de atividades, o aluno foi inativado nesses grupos.' + #13;

            // Varre os grupos de atividade que o aluno será desativado
            while not qyGruposAtividadesAluno.Eof do
            begin
               // Inativa o aluno no grupo de atividade que ele estiver relacionado
               qyInativarAluno.Close;
               qyInativarAluno.ParamByName('cd_pessoa').AsInteger := qyGruposAtividadesAluno.FieldByName('cd_pessoa').AsInteger;
               qyInativarAluno.ParamByName('cd_grupo').AsInteger := qyGruposAtividadesAluno.FieldByName('cd_grupo').AsInteger;

               // Verifica se foi informada uma data de saída do aluno
               qyInativarAluno.ParamByName('dt_saida').AsDateTime := DM.DataAtual;
               if not DM.tblMatriculasDataSaida.IsNull then
               begin
                  qyInativarAluno.ParamByName('dt_saida').AsDateTime := DM.tblMatriculasDataSaida.AsDateTime;
               end;

               qyInativarAluno.ExecSQL;

               // Guardar log de inativação do aluno no grupo (tabela: log_geral) Chave: CD_PESSOA;CD_GRUPO
               chaves := FillString(qyGruposAtividadesAluno.FieldByName('cd_pessoa').AsString, alRight, '0', 10, true ) + ';' + qyGruposAtividadesAluno.FieldByName('cd_grupo').AsString;

               observacao := 'Transferência interna do estudante '+qyGruposAtividadesAluno.FieldByName('cd_pessoa').AsString+' - "'+qyGruposAtividadesAluno.FieldByName('nm_pessoa').AsString+'", portanto o estudante foi inativado no grupo '+
                             qyGruposAtividadesAluno.FieldByName('cd_grupo').AsString+' - "'+qyGruposAtividadesAluno.FieldByName('nm_grupo').AsString+'" [disciplina: '+qyGruposAtividadesAluno.FieldByName('nm_disciplina').AsString+'] '+
                             'na data informada pelo usuário de '+FormatDateTime('dd/mm/yyyy', qyInativarAluno.ParamByName('dt_saida').AsDateTime);

               DM.setLog(
                  1018,
                  'Alteracao',
                  chaves,
                  dm.getColigadaByTurma(strTurmaAntiga, iAnoSemAntigo),
                  observacao
               );

               qyGruposAtividadesAluno.Next;
            end;

         end;
      end else begin
         DM.setLog(
            1018,
            'Alteracao',
            codigoAluno+';'+IntToStr(strNovoAnoSem)+';'+strTurmaAntiga+';'+strNova,
            DM.getColigadaByTurma(strNova,strNovoAnoSem),
            Format(LOG_TRANSFERENCIA_INTERNA,
                  [strtoint(codigoAluno),
                   strNovoAnoSem,
                   cursoAtual,
                   strTurmaAntiga,
                   strtoint(codigoAluno),
                   strNovoAnoSem,
                   qryNova.fieldByName('curso').AsString,
                   strNova ,
                   'O usuário escolheu não matricular as disciplinas'
                  ]
            )
         );
      end;

      if(erroAtual <> '') then
      begin
         mensagemErro := mensagemErro + erroAtual + #13;
      end;

      cdsAlunos.Next;
   end;

   cdsAlunos.Filtered := False;
   cdsAlunos.EnableControls;
   
   { Terminar aqui a troca de turmas }
  Except on E:Exception do
  begin
      Screen.Cursor := crDefault;
      Mensagem( 'Não foi possível efetuar a transferencia interna.', Application.Title ,MB_OK + MB_ICONSTOP );
      Screen.Cursor := crDefault;
      Exit;
      end;
  End;
  
  Screen.Cursor := crDefault;
  qryAtualizaMensalidade.SQL.Text :=  sqlOriginal;

  //Se deu erro em algum aluno mostra ao usuario
  if(mensagemErro <> '') then
  begin
      parametros.titulo := 'Atenção';
      parametros.opcoes := (BT_OK + ICO_ERROR);
      parametros.mensagens.msgPrincipal := mensagemErro;
      parametros.mensagens.msgTopo := 'Aconteceram os seguintes itens durante a transferência dos alunos:';
      parametros.mensagens.msgRodape := '';
      parametros.dimensao.altura := 350;
      parametros.dimensao.largura := 600;
      TfrmMensagem.create(Self, parametros).ShowModal;
  end else begin
      Mensagem( 'Operação realizada com sucesso.', Application.Title, MB_OK + MB_ICONINFORMATION );
  end;
end;

procedure TformTransferenciaDeTurma.efetuaTrocaDeTurma;
const
   LOG_TROCA_TURMA =
      '[Troca de Turma]' + #13 + #13 +
      #9 + 'Informações da Matrícula Anterior:' + #13 +
      #9 + #9 + 'CODIGOALUNO: %d' + #13 +
      #9 + #9 + 'ANOSEMESTRE: %d' + #13 +
      #9 + #9 + 'CURSO: %s' + #13 +
      #9 + #9 + 'TURMA: %s' + #13 + #13 +
      #9 + 'Informações da Matrícula Nova:' + #13 +
      #9 + #9 + 'CODIGOALUNO: %d' + #13 +
      #9 + #9 + 'ANOSEMESTRE: %d' + #13 +
      #9 + #9 + 'CURSO: %s' + #13 +
      #9 + #9 + 'TURMA: %s' + #13 + #13;
var
  qyAlteraMonografia: TUMZQuery;
  codigoAluno,Observacao,chaves: String;
  i : integer;
   DestinoCurso: AnsiString;
begin
   qryNova.Close;
   qryAtual.Close;
   qryAlterarTurma.Close;

   DestinoCurso := edDCurso.Text;   
   strNova := edDTurma.Text;
   strTurmaAntiga := lbOTurma.Caption;
   strNovoAnoSem := strtoint(meAnoSem.Text);
   iAnoSemAntigo := strtoint(lbOAnoSem.Caption);

   // Selecionar a nova turma
   qryNova.ParamByName('AnoSemestre').AsInteger := strNovoAnoSem;
   qryNova.ParamByName('Turma').AsString := strNova;
   qryNova.Open;

   // Selecionar a turma atual
   qryAtual.ParamByName('AnoSemestre').AsInteger := iAnoSemAntigo;
   qryAtual.ParamByName('Turma').AsString := strTurmaAntiga;
   qryAtual.Open;

   { Apenas troca de Turma }
   Screen.Cursor := crHourGlass;

   try

      cdsAlunos.DisableControls;
      cdsAlunos.Filter := 'SN_SELECAO';
      cdsAlunos.Filtered := True;
      cdsAlunos.First;

      while not cdsAlunos.Eof do
      begin
         codigoAluno := cdsAlunosCD_PESSOA.AsString;

         { Alteração de turma }

         With qryAlterarTurma do
         begin
            // Alteração na Tabela de Matriculas

            SQL.Clear;
            SQL.Add('UPDATE matriculas SET turma = :nova_turma, nr_aluno = :nr_aluno, anosemestre = :novoAnoSem, curso = :curso ');
            SQL.Add('WHERE codigoaluno = :codigoaluno AND turma = :turma AND anosemestre = :anosemestre');

            ParamByName('codigoaluno').AsString := codigoAluno;
            ParamByName('turma').AsString := strTurmaAntiga;
            ParamByName('anosemestre').AsInteger := iAnoSemAntigo;
            ParamByName('nova_turma').AsString := strNova;
            ParamByName('novoAnoSem').AsInteger := strNovoAnoSem;
            ParamByName('curso').AsString := DestinoCurso;

            // Pegar o Número do Aluno na turma
            if (DM.variavel_parametro('matriculas_apresentar_nro_aluno') = 'S') then begin
               ParamByName('nr_aluno').AsInteger := DM.DefineNumeroMatricula(strNova, iAnoSemAntigo)
            end else
            begin
               ParamByName('nr_aluno').AsInteger := 0;
            end;

            ExecSQL;

            { Atualiza as tabelas do pedagógico }
            sqlScriptTrocaTurmaPED.ParamByName('CD_TURMA_NOVA').AsString := strNova;
            sqlScriptTrocaTurmaPED.ParamByName('CD_PESSOA').AsString := codigoAluno;
            sqlScriptTrocaTurmaPED.ParamByName('CD_TURMA').AsString := strTurmaAntiga;
            sqlScriptTrocaTurmaPED.ParamByName('NR_ANOSEMESTRE').AsInteger := iAnoSemAntigo;
            sqlScriptTrocaTurmaPED.ParamByName('NR_ANOSEMESTRE_NOVO').AsInteger := strNovoAnoSem;
            sqlScriptTrocaTurmaPED.ParamByName('NR_ETAPA').AsInteger := qryNova.FieldByName('Serie').AsInteger;
            sqlScriptTrocaTurmaPED.Execute;

            {
               Altera o turno na tabela matricula curso caso o turno da nova
               turma for diferente do turno atual do aluno
            }
            alterarTurnoMatricula( codigoAluno );

            { Alteração na Tabela de Mensalidades }
            SQL.Clear;
            SQL.Add(' UPDATE mensalidades SET turma = :nova_turma, cd_coligada = :nova_coligada, depto = :novo_depto, anosemestre = :novoAnoSem, curso = :curso ');
            SQL.Add(' WHERE codigoaluno = :codigoaluno AND turma = :turma AND anosemestre = :anosemestre AND (sn_nfe_gerada = 0 OR cd_coligada = :nova_coligada)');

            ParamByName('codigoaluno').AsString := codigoAluno;
            ParamByName('turma').AsString := strTurmaAntiga;
            ParamByName('anosemestre').AsInteger := iAnoSemAntigo;
            ParamByName('nova_turma').AsString := strNova;
            ParamByName('nova_coligada').AsInteger := qryNova.fieldByName('cd_coligada').AsInteger;
            ParamByName('novo_depto').AsInteger := qryNova.fieldByName('cd_depto').AsInteger;
            ParamByName('novoAnoSem').AsInteger := strNovoAnoSem;
            ParamByName('curso').AsString := DestinoCurso;
            ExecSQL;

            { Avisa se um dos títulos não foi passado a outra turma devido a nfes em unidades diferentes }
            SQL.Clear;
            SQL.Add(' SELECT COUNT(*) qtd from Mensalidades ');
            SQL.Add(' WHERE codigoaluno = :codigoaluno AND turma = :turma AND anosemestre = :anosemestre AND sn_nfe_gerada = 1 AND cd_coligada <> :nova_coligada');

            ParamByName('codigoaluno').AsString := codigoAluno;
            ParamByName('turma').AsString := strTurmaAntiga;
            ParamByName('anosemestre').AsInteger := iAnoSemAntigo;
            ParamByName('nova_coligada').AsInteger := qryNova.fieldByName('cd_coligada').AsInteger;
            Open;

            if (FieldByName('qtd').AsInteger > 0) then
            begin
               // Avisa o usuário que ele está trocando a turma de um aluno que possui vinculos em disciplinas com grupos de atividades
               Mensagem('O aluno possui títulos com nota fiscal já emitida em outra unidade. Esses títulos não foram levados a nova turma.', 'Informação', MB_OK + MB_ICONINFORMATION );
            end;


            {Verifica se o aluno possui alguma monografia cadastrada e altera o CD_TURMA da tabela de monografias caso possua algum registro}
            SQL.Clear;
            SQL.Add(' SELECT COUNT(*) qtd FROM monografias WHERE cd_pessoa = :codigoaluno ');
            ParamByName('codigoaluno').AsString := codigoAluno;
            Open;

            DM.CriarConsulta(qyAlteraMonografia);

            if (FieldByName('qtd').AsInteger > 0) then
            begin
             qyAlteraMonografia.SQL.Text :=
                'UPDATE monografias SET cd_turma = :nova_turma, nr_anosemestre = :novoAnoSem    ' +
                'WHERE                                            ' +
                '    cd_pessoa = :codigoaluno                     ' +
                '    AND cd_turma = :turma                        ' +
                '    AND nr_anosemestre = :anosem                 ';

             qyAlteraMonografia.ParamByName('codigoaluno').AsString := codigoAluno;
             qyAlteraMonografia.ParamByName('turma').AsString := strTurmaAntiga;
             qyAlteraMonografia.ParamByName('anosem').AsInteger := iAnoSemAntigo;
             qyAlteraMonografia.ParamByName('nova_turma').AsString := strNova;
             qyAlteraMonografia.ParamByName('novoAnoSem').AsInteger := strNovoAnoSem;

             qyAlteraMonografia.ExecSQL;
            end;

            { Alteração na TurmaDisciplina da Tabela de Ficha }

            { Modifica as turmas do aluno onde a turma matricula e turma foram iguais a turma de origem
              Obs.: Somente troca a turma se ela for de mesma etapa da turma de origem }
            SQL.Clear;
            SQL.Add(' UPDATE fichaindividual SET turma = :nova_turma, curso = :curso, ');
            // Bloquear as médias ja calculadas
            SQL.Add(' sn_bloqueado1 = CASE WHEN nota_d1 IS NULL THEN 0 ELSE 1 END,      ');
            SQL.Add(' sn_bloqueado2 = CASE WHEN nota_d2 IS NULL THEN 0 ELSE 1 END,      ');
            SQL.Add(' sn_bloqueado3 = CASE WHEN nota_d3 IS NULL THEN 0 ELSE 1 END,      ');
            SQL.Add(' sn_bloqueado4 = CASE WHEN nota_d4 IS NULL THEN 0 ELSE 1 END,      ');
            SQL.Add(' sn_bloqueado5 = CASE WHEN nota_d5 IS NULL THEN 0 ELSE 1 END,      ');
            SQL.Add(' sn_bloqueado6 = CASE WHEN nota_d6 IS NULL THEN 0 ELSE 1 END,      ');
            SQL.Add(' sn_bloqueado7 = CASE WHEN nota_d7 IS NULL THEN 0 ELSE 1 END,      ');
            SQL.Add(' sn_bloqueado8 = CASE WHEN nota_d8 IS NULL THEN 0 ELSE 1 END,      ');
            SQL.Add(' sn_bloqueado9 = CASE WHEN nota_d9 IS NULL THEN 0 ELSE 1 END,      ');
            SQL.Add(' sn_bloqueado10 = CASE WHEN nota_d10 IS NULL THEN 0 ELSE 1 END,    ');
            SQL.Add(' aproveitamento = CASE WHEN mediafinal IS NULL THEN "N" ELSE "S" END, ');
            SQL.Add(' anosemestre = :novoAnoSem  ');
            SQL.Add('WHERE codigoaluno = :codigoaluno AND turmamatricula = :turma AND anosemestre = :anosemestre ');
            SQL.Add(' AND serie = :serie AND turma = :turma ');

            ParamByName('serie').AsInteger := qryNova.FieldByName('Serie').AsInteger;
            ParamByName('codigoaluno').AsString := codigoAluno;
            ParamByName('turma').AsString := strTurmaAntiga;
            ParamByName('anosemestre').AsInteger := iAnoSemAntigo;
            ParamByName('nova_turma').AsString := strNova;
            ParamByName('novoAnoSem').AsInteger := strNovoAnoSem;
            ParamByName('curso').AsString := DestinoCurso;
            ExecSQL;

            { Modifica as turmamatriculas de fichaindividual do aluno onde a turma matricula for igual a turma de origem }
            SQL.Clear;
            SQL.Add('UPDATE fichaindividual SET turmamatricula = :nova_turma ');
            SQL.Add('WHERE codigoaluno = :codigoaluno AND turmamatricula = :turma AND anosemestre = :anosemestre');

            ParamByName('codigoaluno').AsString := codigoAluno;
            ParamByName('turma').AsString := strTurmaAntiga;
            ParamByName('anosemestre').AsInteger := strNovoAnoSem;
            ParamByName('nova_turma').AsString := strNova;
            ExecSQL;

            { Modifica as turmamatriculas de fichaindividual_rematriculas do aluno onde a turma matricula for igual a turma de origem }
            SQL.Clear;
            SQL.Add('UPDATE fichaindividual_rematriculas SET turmamatricula = :nova_turma, anosemestre = :novoAnoSem ');
            SQL.Add('WHERE codigoaluno = :codigoaluno AND turmamatricula = :turma AND anosemestre = :anosemestre');

            ParamByName('codigoaluno').AsString := codigoAluno;
            ParamByName('turma').AsString := strTurmaAntiga;
            ParamByName('anosemestre').AsInteger := iAnoSemAntigo;
            ParamByName('nova_turma').AsString := strNova;
            ParamByName('novoAnoSem').AsInteger := strNovoAnoSem;
            ExecSQL;

            { Modifica as turmamatriculas de fichaindividual_rematriculas do aluno onde a turma matricula for igual a turma de origem }
            SQL.Clear;
            SQL.Add('UPDATE fichaindividual_rematriculas SET turma = :nova_turma ');
            SQL.Add('WHERE codigoaluno = :codigoaluno AND turma = :turma AND anosemestre = :anosemestre');

            ParamByName('codigoaluno').AsString := codigoAluno;
            ParamByName('turma').AsString := strTurmaAntiga;
            ParamByName('anosemestre').AsInteger := iAnoSemAntigo;
            ParamByName('nova_turma').AsString := strNova;
            ExecSQL;

            { Verificar Passagem de frequencias e notas parciais }
            if Dm.variavel_parametro('TransferenciaLevarNotasParciais') = 'S' then begin
               qryTransfereFreqs.Close;
               qryTransfereFreqs.ParamByName('CD_PESSOA').AsString := codigoAluno;
               qryTransfereFreqs.ParamByName('CD_TURMA').AsString := strTurmaAntiga;
               qryTransfereFreqs.ParamByName('NR_ANOSEM').AsInteger := iAnoSemAntigo;
               qryTransfereFreqs.ParamByName('CD_TURMA_NOVA').AsString := strNova;
               qryTransfereFreqs.ParamByName('NR_ANOSEM_NOVO').AsInteger := strNovoAnoSem;
               qryTransfereFreqs.ExecSQL;

               qryTransfereNotas.ParamByName('CD_PESSOA').AsString := codigoAluno;
               qryTransfereNotas.ParamByName('CD_TURMA').AsString := strTurmaAntiga;
               qryTransfereNotas.ParamByName('NR_ANOSEM').AsInteger := iAnoSemAntigo;
               qryTransfereNotas.ParamByName('CD_TURMA_NOVA').AsString := strNova;
               qryTransfereNotas.ParamByName('NR_ANOSEM_NOVO').AsInteger := strNovoAnoSem;
               qryTransfereNotas.ExecSQL;
            end;
         end;

         { Demais dados }

         { Registrar em observações }

         Observacao := 'TROCA DA TURMA: ' + strTurmaAntiga + ', ANO/SEMESTRE: ' +  INTTOSTR(iAnoSemAntigo) +
                        '  PARA A TURMA: ' + strNova + ', ANO/SEMESTRE: ' + INTTOSTR(strNovoAnoSem);

         TfObservacoes.RegisterObservation(strtoint(codigoAluno), okMatriculation, Observacao);

         DM.setLog(
            1018,
            'Alteracao',
            codigoAluno+';'+IntToStr(strNovoAnoSem)+';'+strNova+';'+strNova,
            DM.getColigadaByTurma(strNova,strNovoAnoSem),

            Format(LOG_TROCA_TURMA,
                     [strtoint(codigoAluno),
                      iAnoSemAntigo,
                      qryAtual.fieldByName('curso').AsString,
                      strTurmaAntiga,
                      strtoint(codigoAluno),
                      strNovoAnoSem,
                      qryNova.fieldByName('curso').AsString,
                      strNova]
            )
         );

         // Verifica se a matrícula do aluno está vinculado em disciplinas com grupos de atividades criados
         qyGruposAtividadesAluno.Close;
         qyGruposAtividadesAluno.ParamByName('nr_anosemestre').AsInteger := iAnoSemAntigo;
         qyGruposAtividadesAluno.ParamByName('cd_curso').AsString := qryAtual.fieldByName('curso').AsString;
         qyGruposAtividadesAluno.ParamByName('cd_turma').AsString := strTurmaAntiga;
         qyGruposAtividadesAluno.ParamByName('cd_pessoa').AsString := codigoAluno;
         qyGruposAtividadesAluno.Open;

         // Aluno vinculado a grupos de atividades (nessa matrícula)
         if not qyGruposAtividadesAluno.Eof then
         begin
            // Avisa o usuário que ele está trocando a turma de um aluno que possui vinculos em disciplinas com grupos de atividades
            Mensagem('Você trocou a turma de um aluno que possui disciplinas com grupos de atividades, o aluno foi inativado nesses grupos.', 'Informação', MB_OK + MB_ICONINFORMATION );

            // Varre os grupos de atividade que o aluno será desativado
            while not qyGruposAtividadesAluno.Eof do
            begin
               // Inativa o aluno no grupo de atividade que ele estiver relacionado
               qyInativarAluno.Close;
               qyInativarAluno.ParamByName('cd_pessoa').AsString := codigoAluno;
               qyInativarAluno.ParamByName('cd_grupo').AsInteger := qyGruposAtividadesAluno.FieldByName('cd_grupo').AsInteger;

               // Verifica se foi informada uma data de saída do aluno
               if not DM.tblMatriculasDataSaida.IsNull then
               begin
                  qyInativarAluno.ParamByName('dt_saida').AsString := dataMatricula;
               end else begin
                  qyInativarAluno.ParamByName('dt_saida').AsDateTime := DM.DataAtual;
               end;

               qyInativarAluno.ExecSQL;

               // Guardar log de inativação do aluno no grupo (tabela: log_geral)
               // Chave: CD_PESSOA;CD_GRUPO
               chaves := FillString(qyGruposAtividadesAluno.FieldByName('cd_pessoa').AsString, alRight, '0', 10, true ) + ';' + qyGruposAtividadesAluno.FieldByName('cd_grupo').AsString;

               observacao := 'Troca de turma do estudante '+qyGruposAtividadesAluno.FieldByName('cd_pessoa').AsString+' - "'+qyGruposAtividadesAluno.FieldByName('nm_pessoa').AsString+'", portanto o estudante foi inativado no grupo '+
                             qyGruposAtividadesAluno.FieldByName('cd_grupo').AsString+' - "'+qyGruposAtividadesAluno.FieldByName('nm_grupo').AsString+'" [disciplina: '+qyGruposAtividadesAluno.FieldByName('nm_disciplina').AsString+'] '+
                             'na data informada pelo usuário de '+FormatDateTime('dd/mm/yyyy', qyInativarAluno.ParamByName('dt_saida').AsDateTime);

               DM.setLog(
                  1018,
                  'Alteracao',
                  chaves,
                  dm.getColigadaByTurma(strTurmaAntiga, iAnoSemAntigo),
                  observacao
               );
         
               qyGruposAtividadesAluno.Next;
            end;
         end;
         cdsAlunos.Next;
      end;
      cdsAlunos.Filtered := False;
      cdsAlunos.EnableControls;
   Except on E:Exception do
      begin
         Screen.Cursor := crDefault;
         Mensagem( 'Não foi possível efetuar a troca de turmas.', Application.Title ,MB_OK + MB_ICONSTOP );
         Screen.Cursor := crDefault;
         Exit;
      end;
   end;

   Mensagem( 'Operação realizada com sucesso.', Application.Title, MB_OK + MB_ICONINFORMATION );

   Screen.Cursor := crDefault;
end;

procedure TformTransferenciaDeTurma.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  frmMatriculas.tblMatriculas.Close;
  frmMatriculas.tblMatriculas.Open;
  FreeAndNil(frmTrocaTurmaDetalhesAluno);
  Action := caFree;
  formTransferenciaDeTurma := nil;
end;

procedure TformTransferenciaDeTurma.FormShow(Sender: TObject);
begin
   lbMsg1.Caption := '';
   lbMsg2.Caption := '';
   lbMsg3.Caption := '';
   lbMsg4.Caption := '';
   pnTitulo.Caption := 'TRANSFERÊNCIA DE TURMA';
   btTransfInt.Enabled := true;
   btTrocaTurma.Enabled := true;
   btnConfirmar.Enabled := false;
   btnCancelar.Enabled := false;
   btTrocaTurma.SetFocus;
   pnMsg.Height := 35;
   pnMsg.Visible := false;
   formTransferenciaDeTurma.ClientHeight := 594;
end;

procedure TformTransferenciaDeTurma.percorreListaPessoas(checar: boolean);
begin
   cdsAlunos.DisableControls;
   cdsAlunos.Filter := 'NOT SN_SELECAO';

   if not checar then
   begin
      cdsAlunos.Filter := 'SN_SELECAO';
   end;

   cdsAlunos.Filtered := True;
   
   while not cdsAlunos.IsEmpty do
   begin
      cdsAlunos.Edit;
      cdsAlunosSN_SELECAO.AsBoolean := checar;
      cdsAlunos.Post;
   end;

   cdsAlunos.Filtered := False;
   cdsAlunos.EnableControls;
end;

procedure TformTransferenciaDeTurma.ToolButton5Click(Sender: TObject);
begin
   percorreListaPessoas(true);
end;

procedure TformTransferenciaDeTurma.ToolButton6Click(Sender: TObject);
begin
   percorreListaPessoas(false);
end;

procedure TformTransferenciaDeTurma.TransfereDisciplinasOutrasTurmas(
  const PessoaId, Situacao: Cardinal);
const
   SFilterAlunoFmt = 'CD_PESSOA = %d AND DS_ACAO = ''Matricular em uma nova turma'' AND CD_TURMA_NOVA <> ''''';
   SFilterAlunoMmt = 'CD_PESSOA = %d AND DS_ACAO <> ''Matricular em uma nova turma''';
   SSQLInsertFicha = 'INSERT INTO FICHAINDIVIDUAL (ANOSEMESTRE, TURMA, CODIGOALUNO, CURSO, DISCIPLINA, SERIE, TURMAMATRICULA, SITUACAO) VALUES (?, ?, ?, ?, ?, ?, ?, ?)';
   SSQLInsertOpt = 'INSERT INTO FICHAINDIVIDUAL_OPTATIVAS (ANOSEMESTRE,TURMA,CODIGOALUNO,DISCIPLINA,SERIE,CD_TURMA_GENERICA,CD_DISCIPLINA_GENERICA) '+
                    ' SELECT anosemestre, ? as turma, codigoaluno, disciplina, serie, ? as turma_nova, cd_disciplina_generica '+
                    ' FROM fichaindividual_optativas '+
                    ' WHERE                           '+
                    '   codigoaluno = ? AND disciplina = ? AND anosemestre = ? LIMIT 1 ';
                    
   SSQLUpdateFicha       = 'UPDATE FICHAINDIVIDUAL SET SITUACAO = ? WHERE ANOSEMESTRE = ? AND TURMA = ? AND CODIGOALUNO = ? AND DISCIPLINA = ? AND SERIE = ?';
   SSQLUpdateFichaManter = 'UPDATE FICHAINDIVIDUAL SET TURMAMATRICULA = ? WHERE ANOSEMESTRE = ? AND TURMA = ? AND CODIGOALUNO = ? AND DISCIPLINA = ? AND SERIE = ?';
var
   Stmt: IZPreparedStatement;
   StmtUpd: IZPreparedStatement;
   StmtOpt: IZPreparedStatement;
begin
   if frmTrocaTurmaDetalhesAluno <> nil then
   begin
      with frmTrocaTurmaDetalhesAluno do
      begin
         cdsFichaIndividual.Filter := Format(SFilterAlunoFmt, [PessoaId]);

         if not cdsFichaIndividual.IsEmpty then
         begin
            Stmt := PrepareStatement(SSQLInsertFicha);
            StmtUpd := PrepareStatement(SSQLUpdateFicha);
            try
               cdsFichaIndividual.First;
               while not cdsFichaIndividual.Eof do
               begin
                  StmtUpd.ClearParameters;
                  StmtUpd.SetInt(1, Situacao);
                  StmtUpd.SetInt(2, cdsFichaIndividualNR_ANOSEMESTRE.AsInteger);
                  StmtUpd.SetString(3, cdsFichaIndividualCD_TURMA.AsString);
                  StmtUpd.SetInt(4, PessoaId);
                  StmtUpd.SetInt(5, cdsFichaIndividualCD_DISCIPLINA.AsInteger);
                  StmtUpd.SetInt(6, cdsFichaIndividualNR_SERIE.AsInteger);
                  StmtUpd.ExecutePrepared;

                  Stmt.ClearParameters;
                  Stmt.SetInt(1, cdsFichaIndividualNR_ANOSEMESTRE.AsInteger);
                  Stmt.SetString(2, cdsFichaIndividualCD_TURMA_NOVA.AsString);
                  Stmt.SetInt(3, PessoaId);
                  Stmt.SetString(4, cdsFichaIndividualCD_CURSO.AsString);
                  Stmt.SetInt(5, cdsFichaIndividualCD_DISCIPLINA.AsInteger);
                  Stmt.SetInt(6, cdsFichaIndividualNR_SERIE.AsInteger);
                  Stmt.SetString(7, strNova);
                  Stmt.SetInt(8, cdsFichaIndividualCD_SITUACAO.AsInteger);
                  Stmt.ExecutePrepared;

                  if cdsFichaIndividualSN_OPTATIVA.asInteger = 1 then
                  begin
                     StmtOpt := PrepareStatement(SSQLInsertOpt);

                     StmtOpt.ClearParameters;
                     StmtOpt.SetString(1, cdsFichaIndividualCD_TURMA_NOVA.AsString);
                     StmtOpt.SetString(2, strNova);
                     StmtOpt.SetInt(3, PessoaId);
                     StmtOpt.SetInt(4, cdsFichaIndividualCD_DISCIPLINA.AsInteger);
                     StmtOpt.SetInt(5, cdsFichaIndividualNR_ANOSEMESTRE.AsInteger);
                     StmtOpt.ExecutePrepared;
                     
                     StmtOpt.Close;
                     StmtOpt := nil;
                  end;

                  cdsFichaIndividual.Next;
               end;
            finally
               Stmt.Close;
               StmtUpd.Close;
               Stmt := nil;
               StmtUpd := nil;

            end;
         end;

         // Para as optativas que foram definidas como manter
         cdsFichaIndividual.Filter := Format(SFilterAlunoMmt, [PessoaId]);
         if not cdsFichaIndividual.IsEmpty then
         begin
            try
               cdsFichaIndividual.First;
               while not cdsFichaIndividual.Eof do
               begin
                  StmtUpd := PrepareStatement(SSQLUpdateFichaManter);
                  StmtUpd.ClearParameters;
                  StmtUpd.SetString(1, strNova);
                  StmtUpd.SetInt(2, cdsFichaIndividualNR_ANOSEMESTRE.AsInteger);
                  StmtUpd.SetString(3, cdsFichaIndividualCD_TURMA.AsString);
                  StmtUpd.SetInt(4, PessoaId);
                  StmtUpd.SetInt(5, cdsFichaIndividualCD_DISCIPLINA.AsInteger);
                  StmtUpd.SetInt(6, cdsFichaIndividualNR_SERIE.AsInteger);
                  StmtUpd.ExecutePrepared;
                  cdsFichaIndividual.Next;
               end;
            finally
               StmtUpd.Close;
               StmtUpd := nil;
            end;
         end;
      end;
   end;
end;

function TformTransferenciaDeTurma.transfPlanoPagamento(codigoAluno:String;var planoPgtPadraoPorCre: Integer): String;
var
   nrParcelasPlanoPgtAntigo: Integer;
   planoValido: Boolean;
begin
   result := '';
   
   { Qual o tipo de plano do aluno }
   qryPlanoPagamentoTurma.Close;
   qryPlanoPagamentoTurma.ParamByName('anosemestre').AsInteger := iAnoSemAntigo;
   qryPlanoPagamentoTurma.ParamByName('turma').AsString := strTurmaAntiga;
   qryPlanoPagamentoTurma.ParamByName('aluno').AsString := codigoAluno;
   qryPlanoPagamentoTurma.Open;

   nrParcelasPlanoPgtAntigo := qryPlanoPagamentoTurma.FieldByName('parcelas').AsInteger;

   if (qryPlanoPagamentoTurma.FieldByName('cd_tipo_plano').AsInteger = 2) then
   begin

     { Checa quantos planos na turma destino tem o mesmo numero de parcelas que o aluno tinha na turma de origem }
     qryPlanoPagamentoParcela.Close;
     qryPlanoPagamentoParcela.ParamByName('anosemestre').AsInteger := strNovoAnoSem;
     qryPlanoPagamentoParcela.ParamByName('turma').AsString := strNova;
     qryPlanoPagamentoParcela.ParamByName('parcelas').AsInteger := nrParcelasPlanoPgtAntigo;
     qryPlanoPagamentoParcela.Open;
        
     if qryPlanoPagamentoParcela.RecordCount = 0 then
     begin
         result := 'Não será possível efetuar a transferência interna pois a turma destino não possui um plano de pagamento com o mesmo número de parcelas do plano de pagamento da turma de origem. ';
         Exit;
     end
     else if qryPlanoPagamentoParcela.RecordCount > 1 then
     begin
         planoValido := False;

         while not (qryPlanoPagamentoParcela.Eof) do
         begin
            if planoPagamento = qryPlanoPagamentoParcela.FieldByName('codigo').AsInteger then
            begin
               planoValido := True;
               break;
            end;

            qryPlanoPagamentoParcela.Next;
         end;

         if not(planoValido) then
         begin

            { Caso tenha mais de 1 verifica se a turma possui um padrão, se não possuir a transferência é interferida, caso possua guarda o plano para utilizar na hora de alterar a mensalidade do aluno }
            qryPlanoPagamentoPlanoPadrao.Close;
            qryPlanoPagamentoPlanoPadrao.ParamByName('anosemestre').AsInteger := strNovoAnoSem;
            qryPlanoPagamentoPlanoPadrao.ParamByName('turma').AsString := strNova;
            qryPlanoPagamentoPlanoPadrao.Open;

            if qryPlanoPagamentoPlanoPadrao.RecordCount = 0 then
            begin
               result := 'Não sera possível realizar a transferência interna, para efetua-la será necessario definir um plano de pagamento padrão na turma de destino do aluno. ';
               Exit;
            end
            else
            begin
               if qryPlanoPagamentoPlanoPadrao.FieldByName('parcelas').AsInteger = nrParcelasPlanoPgtAntigo  then
               begin
                  planoPgtPadraoPorCre := qryPlanoPagamentoPlanoPadrao.FieldByName('codigo').AsInteger;
               end else begin
                  result := 'Não sera possível realizar a transferência interna, pois o plano padrão da turma de destino possui o numero de parcelas diferente do da turma atual do aluno. ';
               end;
            end;
         end;
     end;
   end;
end;

procedure TformTransferenciaDeTurma.TrocarCursoVestibular(anosemestre : Integer; codigoAluno: Integer;
  CursoAtual, CursoNovo: String);
begin
   { Ao trocar a turma de matrícula, verificar se existe uma ligação na tabela de Vestibular }
   { Se não tiver registro, nada será alterado }
   Dm.qAux1.Close;
   Dm.qAux1.SQL.Text := 'UPDATE vestibular SET curso = :cursonovo';
   Dm.qAux1.SQL.Add(' WHERE codigoaluno = :codigoaluno AND anosemestre = :anosemestre and curso = :cursoatual ');

   Dm.qAux1.ParamByName('codigoaluno').AsInteger := codigoAluno;
   Dm.qAux1.ParamByName('cursonovo').AsString := CursoNovo;
   Dm.qAux1.ParamByName('cursoatual').AsString := CursoAtual;
   Dm.qAux1.ParamByName('anosemestre').AsInteger := anosemestre;

   Dm.qAux1.ExecSQL;
end;

procedure TformTransferenciaDeTurma.udDAnoSemClick(Sender: TObject;
  Button: TUDBtnType);
begin
   case Button of
      btNext:
      begin
         Self.meAnoSem.Text := DM.incrementar_ano_semestre(Self.meAnoSem.Text);
      end;
      btPrev:
         Self.meAnoSem.Text := DM.decrementar_ano_semestre(Self.meAnoSem.Text);
   end;
   edDCurso.Text := '';
   edDTurma.Text := '';
end;

function TformTransferenciaDeTurma.verificaSelecionados: boolean;
begin
   cdsAlunos.DisableControls;
   cdsAlunos.Filter := 'SN_SELECAO';
   cdsAlunos.Filtered := True;
   Result := not cdsAlunos.IsEmpty;
   cdsAlunos.Filtered := False;
   cdsAlunos.EnableControls;
end;

function TformTransferenciaDeTurma.verificaTurmaMesmaEtapa: Boolean;
const
   SQL_VERIFICA =
      ' SELECT serie FROM turmas WHERE codigo = :turma AND anosemestre = :anosemestre ';
var
   qryVerifica : TUMZQuery;
begin
   DM.CriarConsulta(qryVerifica);
   qryVerifica.SQL.Add(SQL_VERIFICA);
   qryVerifica.ParamByName('turma').AsString := lbOTurma.Caption;
   qryVerifica.ParamByName('anosemestre').AsInteger := StrToInt(lbOAnoSem.Caption);
   qryVerifica.Open;

   result := (qryVerifica.FieldByName('serie').AsInteger = novaSerie);
   FreeAndNil(qryVerifica);
end;

end.