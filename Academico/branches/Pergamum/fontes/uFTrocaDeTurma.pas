unit uFTrocaDeTurma;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, DB, ZAbstractRODataset, ZAbstractDataset, UZDataset, StdCtrls,
  CheckLst, Buttons, ExtCtrls, ComCtrls, ToolWin, ImgList, Mask, General, ZDbcIntfs, UZDbcFuncs, uMensagem;

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
    lstAlunos: TCheckListBox;
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
    Label1: TLabel;
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
    dataMatricula, cd_turnoAtual : String;
    strNova,strTurmaAntiga: String;
    strNovoAnoSem,iAnoSemAntigo,novaSerie,planoPagamento : Integer;
    snReclassifica: Boolean;
    procedure carregaAlunos(cd_turma,cd_curso,nr_anosemestre: String;cd_pessoa:integer);
    procedure percorreListaPessoas(checar:boolean);
    procedure alterarTurnoMatricula( codigoAluno : String);
    procedure efetuaTrocaDeTurma();
    procedure efetuaTransfInterna(matriculaDisciplinas:Boolean);
    function verificaSelecionados(): boolean;
    function transfPlanoPagamento(codigoAluno:String; var planoPgtPadraoPorCre: Integer): String;
    procedure TrocarCursoVestibular( anosemestre : Integer; codigoAluno : Integer; CursoAtual : String; CursoNovo : String);
    function verificaTurmaMesmaEtapa(): Boolean;
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

uses uDM,uFSelecionarCurso, uFSelecionarTurma, UFObservacoes, uMatriculas, ClassPlanosPagamento;

{$R *.dfm}

procedure TformTransferenciaDeTurma.btTrocaTurmaClick(Sender: TObject);
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
end;

procedure TformTransferenciaDeTurma.btTransfIntClick(Sender: TObject);
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
begin
   { Pesquisar Turmas }
   curso := lbOCurso.Caption;
   if(edDCurso.Text <> '') then
   begin
      curso := edDCurso.Text;
   end;

   if btTrocaTurma.Enabled = false then
   begin
      resultado_filtro := TfrmSelecionarTurma.Filtrar([bftMostraReclassificacao],strtoint(meAnoSem.Text),-1,-1,curso);
   end
   else
   begin
      resultado_filtro := TfrmSelecionarTurma.Filtrar([bftMostraReclassificacao, bftCurso],strtoint(meAnoSem.Text),-1,-1,curso);
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
      matriculaDisciplinas := (Mensagem('Matricular as disciplinas da nova turma para os alunos?', 'Confirmação', MB_YESNO + MB_ICONQUESTION) = mrYes);
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

procedure TformTransferenciaDeTurma.carregaAlunos(cd_turma,cd_curso,nr_anosemestre: String;cd_pessoa:integer);
const
   SQL_CURSOS =
   'SELECT'+
   '  p.cd_pessoa, p.nm_pessoa '+
   'FROM matriculas m '+
   'INNER JOIN pessoas p ON (p.cd_pessoa = m.codigoaluno) '+
   'WHERE'+
	'  m.anosemestre = :anosemestre AND '+
   '  m.curso = :curso AND '+
	'  m.turma = :turma AND '+
	'  m.situacao NOT IN (0,2,4,5,6,7,8,9) '+
   'GROUP BY  '+
   ' m.codigoaluno '+
   'ORDER BY p.nm_pessoa';
var
  qryCarregaAlunos : TUMZQuery;
  lista : TStringList;
begin
   DM.CriarConsulta(qryCarregaAlunos);
   lstAlunos.Items.Clear;

   With qryCarregaAlunos do
   begin

      Close;
      SQL.Text := SQL_CURSOS;
      ParamByName('anosemestre').AsString := nr_anosemestre;
      ParamByName('curso').AsString := cd_curso;
      ParamByName('turma').AsString := cd_turma;
      Open;

      while not Eof do
      begin
         lista := TStringList.Create();
         lista.Add(FieldByName('cd_pessoa').AsString);

         lstAlunos.Items.AddObject(FieldByName('nm_pessoa').AsString,lista);

         if(FieldByName('cd_pessoa').AsInteger = cd_pessoa) then
         begin
            lstAlunos.checked[lstAlunos.Count -1] := true;
         end;

         Next;
      end;
   end;
end;

procedure TformTransferenciaDeTurma.carregaDados(cd_turma,cd_curso,nr_anosemestre: String;cd_pessoa:integer;dt_matricula:String;cd_turno:String);
begin
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

procedure TformTransferenciaDeTurma.efetuaTransfInterna(matriculaDisciplinas:Boolean);
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
   for I := 0 to lstAlunos.Items.Count - 1 do
   begin
      if(lstAlunos.Checked[i] = false) then
      begin
         continue;
      end;

      codigoAluno := StringReplace(TStringList(lstAlunos.Items.Objects[i]).GetText,#$D#$A,'',[rfReplaceAll]);
      nomeAluno := lstAlunos.Items[i];

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

      { Alteração na Tabela de FichaIndividual }
      qryAtualizaFicha.Close;
      qryAtualizaFicha.ParamByName('reclassifica').AsInteger := iReclassificacao;
      qryAtualizaFicha.ParamByName('CodigoAluno').AsString := codigoAluno;
      qryAtualizaFicha.ParamByName('Turma').AsString := strTurmaAntiga;
      qryAtualizaFicha.ParamByName('AnoSemestre').AsInteger := iAnoSemAntigo;
      qryAtualizaFicha.ExecSQL;

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
      qryTransfereDiscFicha.Close;
      qryTransfereDiscFicha.ParamByName('novaturma').AsString := strNova;
      qryTransfereDiscFicha.ParamByName('anosemnovo').AsInteger := strNovoAnoSem;
      qryTransfereDiscFicha.ParamByName('anosemAntigo').AsInteger := iAnoSemAntigo;
      qryTransfereDiscFicha.ParamByName('turmamat').AsString := strTurmaAntiga;
      qryTransfereDiscFicha.ParamByName('codigoaluno').AsString := codigoAluno;
      qryTransfereDiscFicha.ExecSQL;

      if matriculaDisciplinas then
      begin
         DM.MatricularGrade(strtoint(codigoAluno), strNova, strNovoAnoSem, qryNova.FieldByName('cd_grade').AsString, cbPreReq.Checked);

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

         qyAlteraSituacaoTransInterna.ParamByName('codigoaluno').AsString := codigoAluno;
         qyAlteraSituacaoTransInterna.ParamByName('Turma').AsString := strNova;
         qyAlteraSituacaoTransInterna.ParamByName('AnoSemestre').AsInteger := strNovoAnoSem;
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
      end;

      if(erroAtual <> '') then
      begin
         mensagemErro := mensagemErro + erroAtual + #13;
      end;
   end;
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
begin
   qryNova.Close;
   qryAtual.Close;
   qryAlterarTurma.Close;
   
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

      for I := 0 to lstAlunos.Items.Count - 1 do
      begin
         if(lstAlunos.Checked[i] = false) then
         begin
            continue;
         end;

         codigoAluno := StringReplace(TStringList(lstAlunos.Items.Objects[i]).GetText,#$D#$A,'',[rfReplaceAll]);

         { Alteração de turma }

         With qryAlterarTurma do
         begin
            // Alteração na Tabela de Matriculas

            SQL.Clear;
            SQL.Add('UPDATE matriculas SET turma = :nova_turma, nr_aluno = :nr_aluno, anosemestre = :novoAnoSem ');
            SQL.Add('WHERE codigoaluno = :codigoaluno AND turma = :turma AND anosemestre = :anosemestre');

            ParamByName('codigoaluno').AsString := codigoAluno;
            ParamByName('turma').AsString := strTurmaAntiga;
            ParamByName('anosemestre').AsInteger := iAnoSemAntigo;
            ParamByName('nova_turma').AsString := strNova;
            ParamByName('novoAnoSem').AsInteger := strNovoAnoSem;

            // Pegar o Número do Aluno na turma
            if (DM.variavel_parametro('matriculas_apresentar_nro_aluno') = 'S') then begin
               ParamByName('nr_aluno').AsInteger := DM.DefineNumeroMatricula(strNova, iAnoSemAntigo)
            end else
            begin
               ParamByName('nr_aluno').AsInteger := 0;
            end;

            ExecSQL;

            {
               Altera o turno na tabela matricula curso caso o turno da nova
               turma for diferente do turno atual do aluno
            }
            alterarTurnoMatricula( codigoAluno );

            { Alteração na Tabela de Mensalidades }
            SQL.Clear;
            SQL.Add(' UPDATE mensalidades SET turma = :nova_turma, cd_coligada = :nova_coligada, depto = :novo_depto, anosemestre = :novoAnoSem ');
            SQL.Add(' WHERE codigoaluno = :codigoaluno AND turma = :turma AND anosemestre = :anosemestre');

            ParamByName('codigoaluno').AsString := codigoAluno;
            ParamByName('turma').AsString := strTurmaAntiga;
            ParamByName('anosemestre').AsInteger := iAnoSemAntigo;
            ParamByName('nova_turma').AsString := strNova;
            ParamByName('nova_coligada').AsInteger := qryNova.fieldByName('cd_coligada').AsInteger;
            ParamByName('novo_depto').AsInteger := qryNova.fieldByName('cd_depto').AsInteger;
            ParamByName('novoAnoSem').AsInteger := strNovoAnoSem;
            ExecSQL;

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
            SQL.Add(' UPDATE fichaindividual SET turma = :nova_turma, ');
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
            ExecSQL;

            { Modifica as turmamatriculas de fichaindividual do aluno onde a turma matricula for igual a turma de origem }
            SQL.Clear;
            SQL.Add('UPDATE fichaindividual SET turmamatricula = :nova_turma ');
            SQL.Add('WHERE codigoaluno = :codigoaluno AND turmamatricula = :turma AND anosemestre = :anosemestre');

            ParamByName('codigoaluno').AsString := codigoAluno;
            ParamByName('turma').AsString := strTurmaAntiga;
            ParamByName('anosemestre').AsInteger := iAnoSemAntigo;
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
      end;

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
var
   i : integer;
begin
   for i := 0 to lstAlunos.Items.Count - 1 do
   begin
      lstAlunos.Checked[i] := checar;
   end;
end;

procedure TformTransferenciaDeTurma.ToolButton5Click(Sender: TObject);
begin
   percorreListaPessoas(true);
end;

procedure TformTransferenciaDeTurma.ToolButton6Click(Sender: TObject);
begin
   percorreListaPessoas(false);
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
var
   i : integer;
begin
   for i := 0 to lstAlunos.Items.Count - 1 do
   begin
      if (lstAlunos.Checked[i] = true) then
      begin
         result := true;
         exit;
      end;
   end;
   result := false;
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