unit uFMatriculaCursoTurma;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, DBCtrls, UMLookupComboBox, StdCtrls, DB,
  ZAbstractRODataset, ZAbstractDataset, UZDataset, Mask, Buttons, ComCtrls,
  ToolWin, CheckLst, UMAjuda, UMDateTimePicker, Udm, UMComboBox, uItemCombo,General;

type
  TformMatriculaCursoTurma = class(TForm)
    pnTitulo: TPanel;
    pnMatricula: TPanel;
    pnMatriculaTitulo: TPanel;
    gbOrigem: TGroupBox;
    lbOTTurma: TLabel;
    lbOTCurso: TLabel;
    lbOTAnoSem: TLabel;
    Label10: TLabel;
    Label1: TLabel;
    Label12: TLabel;
    pnListaAlunos: TPanel;
    Label2: TLabel;
    Panel2: TPanel;
    lstAlunos: TCheckListBox;
    qyCursosColigadas: TUMZQuery;
    qyCursosColigadasCD_GRADE: TLargeintField;
    qyCursosColigadasds_grade: TStringField;
    ToolBar1: TToolBar;
    ToolButton3: TToolButton;
    ToolButton5: TToolButton;
    ToolButton1: TToolButton;
    ToolButton6: TToolButton;
    ToolButton2: TToolButton;
    Panel4: TPanel;
    btnCancelar: TBitBtn;
    btnConfirmar: TBitBtn;
    Label3: TLabel;
    lbOAnoSem: TLabel;
    ck_sn_grade: TCheckBox;
    ck_sn_situacao: TCheckBox;
    ck_sn_ano_sem: TCheckBox;
    ck_sn_conclusao: TCheckBox;
    ck_sn_colacao: TCheckBox;
    ck_sn_diploma: TCheckBox;
    umGrade: TUMAjuda;
    umSit: TUMAjuda;
    umAnoConc: TUMAjuda;
    umDtConc: TUMAjuda;
    umDtCol: TUMAjuda;
    umDtExp: TUMAjuda;
    dtConc: TUMDateTimePicker;
    dtColacao: TUMDateTimePicker;
    dtDiploma: TUMDateTimePicker;
    udDAnoSem: TUpDown;
    edanosem: TDBEdit;
    qySituacoes: TUMZQuery;
    qySituacoescd_situacao: TIntegerField;
    qySituacoesds_valor: TStringField;
    cbgrade: TUMComboBox;
    cbsituacao: TUMComboBox;
    procedure btnCancelarClick(Sender: TObject);
    procedure btnConfirmarClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure ck_sn_diplomaClick(Sender: TObject);
    procedure dtColacaoClick(Sender: TObject);
    procedure dtConcClick(Sender: TObject);
    procedure ck_sn_ano_semClick(Sender: TObject);
    procedure ck_sn_situacaoClick(Sender: TObject);
    procedure ck_sn_gradeClick(Sender: TObject);
    procedure udDAnoSemClick(Sender: TObject; Button: TUDBtnType);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure ToolButton6Click(Sender: TObject);
    procedure ToolButton5Click(Sender: TObject);
  private
    procedure carregaCombos();
    procedure percorreListaPessoas(checar:boolean);
    procedure efetuaAlteracao();
    function verificaSelecionados(): boolean;
    { Private declarations }
  public
    turma: String;
    anoSemestre: String;
    curso: String;
    cdPessoa: String;
    procedure carregaAlunosTurma();
    { Public declarations }
  end;

var
  formMatriculaCursoTurma: TformMatriculaCursoTurma;

implementation

uses uMatriculas;

{$R *.dfm}

{ TformMatriculaCursoTurma }

procedure TformMatriculaCursoTurma.btnCancelarClick(Sender: TObject);
begin
   self.Close;
end;

procedure TformMatriculaCursoTurma.btnConfirmarClick(Sender: TObject);
begin
   if(not(ck_sn_grade.Checked) AND not(ck_sn_situacao.Checked) AND not(ck_sn_ano_sem.Checked) AND not(ck_sn_conclusao.Checked)
      AND not(ck_sn_colacao.Checked) AND not(ck_sn_diploma.Checked)) then
   begin
      Mensagem( 'Você deve selecionar uma opção para prosseguir.', Application.Title, MB_OK + MB_ICONSTOP );
      exit;
   end;

   efetuaAlteracao();

   Mensagem( 'Operação realizada com sucesso.', Application.Title, MB_OK + MB_ICONINFORMATION );

   self.Close;
end;

procedure TformMatriculaCursoTurma.carregaAlunosTurma;
const
   SQL_CURSOS =
   'SELECT'+
   '  m.cd_matricula_curso, p.cd_pessoa, p.nm_pessoa, mc.cd_grade, mc.dt_conclusao, mc.dt_colacao, mc.dt_exp_diploma, mc.cd_situacao, mc.nr_anosem_conclusao '+
   'FROM matriculas m '+
   'INNER JOIN pessoas p ON (p.cd_pessoa = m.codigoaluno) '+
   'INNER JOIN matriculas_curso mc ON (mc.cd_matricula_curso = m.cd_matricula_curso)'+
   'INNER JOIN situacao s on (m.situacao = s.cd_situacao)'+
   'WHERE'+
	'  m.anosemestre = :anosemestre AND '+
   '  m.curso = :curso AND '+
	'  m.turma = :turma AND '+
	'  NOT(s.cd_situacao_pai IN (3,4,5,6))'+
   'GROUP BY  '+
   ' m.codigoaluno '+
   'ORDER BY p.nm_pessoa';
var
  qryCarregaAlunos : TUMZQuery;
  lista : TStringList;
  grade, dtConc, dtCola, dtExp, cdSit, anoCoc : String;
begin
   DM.CriarConsulta(qryCarregaAlunos);
   lstAlunos.Items.Clear;

   With qryCarregaAlunos do
   begin

      Close;
      SQL.Text := SQL_CURSOS;
      ParamByName('anosemestre').AsString := anoSemestre;
      ParamByName('curso').AsString := curso;
      ParamByName('turma').AsString := turma;
      Open;

      while not Eof do
      begin
         lista := TStringList.Create();
         lista.Add(FieldByName('cd_matricula_curso').AsString);
         lista.Add(FieldByName('cd_grade').AsString);
         lista.Add(FieldByName('dt_conclusao').AsString);
         lista.Add(FieldByName('dt_colacao').AsString);
         lista.Add(FieldByName('dt_exp_diploma').AsString);
         lista.Add(FieldByName('cd_situacao').AsString);
         lista.Add(FieldByName('nr_anosem_conclusao').AsString);
         lista.Add(FieldByName('cd_pessoa').AsString);

         lstAlunos.Items.AddObject(FieldByName('nm_pessoa').AsString,lista);

         if(FieldByName('cd_pessoa').AsString = cdPessoa) then
         begin
            lstAlunos.checked[lstAlunos.Count -1] := true;
         end;

         if(FieldByName('cd_grade').AsString = cdPessoa) then
         begin
            lstAlunos.checked[lstAlunos.Count -1] := true;
         end;

         //Verica diferença entre os alunos para mostrar ou não o alerta
         if(qryCarregaAlunos.RecNo = 1 ) then
         begin
            grade := FieldByName('cd_grade').AsString;
            dtConc := FieldByName('dt_conclusao').AsString;
            dtCola := FieldByName('dt_colacao').AsString;
            dtExp := FieldByName('dt_exp_diploma').AsString;
            cdSit := FieldByName('cd_situacao').AsString;
            anoCoc := FieldByName('nr_anosem_conclusao').AsString;
         end;

         if(grade <> FieldByName('cd_grade').AsString) then
         begin
            umGrade.Visible := true;
         end;

         if(dtConc <> FieldByName('dt_conclusao').AsString) then
         begin
            umDtConc.Visible := true;
         end;

         if(dtCola <> FieldByName('dt_colacao').AsString) then
         begin
            umDtCol.Visible := true;
         end;

         if(dtExp <> FieldByName('dt_exp_diploma').AsString) then
         begin
            umDtExp.Visible := true;
         end;

         if(cdSit <> FieldByName('cd_situacao').AsString) then
         begin
            umSit.Visible := true;
         end;

         if(anoCoc <> FieldByName('nr_anosem_conclusao').AsString) then
         begin
            umAnoConc.Visible := true;
         end;

         Next;
      end;
   end;
end;

procedure TformMatriculaCursoTurma.carregaCombos;
begin

   qyCursosColigadas.Close;
   qyCursosColigadas.ParamByName('cd_curso').AsString := curso;
   qyCursosColigadas.Open;
   qySituacoes.Close;
   qySituacoes.Open;
   while not qyCursosColigadas.Eof do
   begin
      cbgrade.addItem(
               qyCursosColigadasds_grade.asString,
               TItemCombo.create(
                  qyCursosColigadasCD_GRADE.asString, ''
               )
            );
      qyCursosColigadas.Next;
   end;

   while not qySituacoes.Eof do
   begin
      cbsituacao.addItem(
               qySituacoesds_valor.asString,
               TItemCombo.create(
                  qySituacoescd_situacao.asString, ''
               )
            );
      qySituacoes.Next;
   end;
end;

procedure TformMatriculaCursoTurma.ck_sn_ano_semClick(Sender: TObject);
begin
   udDAnoSem.Enabled := TCheckBox(Sender).Checked;
   edanosem.Enabled := TCheckBox(Sender).Checked;
end;

procedure TformMatriculaCursoTurma.ck_sn_diplomaClick(Sender: TObject);
begin
   dtDiploma.Enabled := TCheckBox(Sender).Checked;
end;

procedure TformMatriculaCursoTurma.ck_sn_gradeClick(Sender: TObject);
begin
   cbgrade.Enabled := TCheckBox(Sender).Checked;
end;

procedure TformMatriculaCursoTurma.ck_sn_situacaoClick(Sender: TObject);
begin
   cbsituacao.Enabled := TCheckBox(Sender).Checked;
end;

procedure TformMatriculaCursoTurma.dtColacaoClick(Sender: TObject);
begin
   dtColacao.Enabled := TCheckBox(Sender).Checked;
end;

procedure TformMatriculaCursoTurma.dtConcClick(Sender: TObject);
begin
   dtConc.Enabled := TCheckBox(Sender).Checked;
end;

procedure TformMatriculaCursoTurma.efetuaAlteracao;
const
   LOG_ALTERA_INI =
      '[Alteração de Matrícula em massa]' + #13 + #13 +
      #9 + 'Informações Anteriores da Matrícula:' + #13;
   LOG_ALTERA_FIM =
      #9 + 'Informações Novas da Matrícula :' + #13;
   SQL_ALTERA_MAT =
      'UPDATE matriculas_curso SET cd_pessoa = cd_pessoa ';
   SQL_ALTERA_FIM =
      'WHERE cd_matricula_curso = :cd_matricula_curso';
var
   listaAtual : TStringList;
   matriculaCurso,grade,dtConclusao,dataColacao,dtExp,situacao,anosemConc,codigoAluno: String;
   strLogInicial,strLogFinal,strLog: String;
   sqlAltera: String;
   qryUpdate: TUMZQuery;
   i:integer;
begin
   DM.CriarConsulta(qryUpdate);
   for I := 0 to lstAlunos.Items.Count - 1 do
   begin
      if(lstAlunos.Checked[i] = false) then
      begin
         continue;
      end;

      //Reseta log/sql
      sqlAltera := SQL_ALTERA_MAT;
      strLogInicial := LOG_ALTERA_INI;
      strLogFinal := LOG_ALTERA_FIM;

      //Dados Atuais
      listaAtual := TStringList(lstAlunos.Items.Objects[i]);
      matriculaCurso := listaAtual.Strings[0];
      grade := listaAtual.Strings[1];
      dtConclusao := listaAtual.Strings[2];
      dataColacao := listaAtual.Strings[3];
      dtExp := listaAtual.Strings[4];
      situacao := listaAtual.Strings[5];
      anosemConc := listaAtual.Strings[6];
      codigoAluno := listaAtual.Strings[7];

      //Inicio - Log
      strLogInicial := strLogInicial + #9 + #9 + 'CODIGOALUNO: ' + codigoAluno + #13;
      strLogFinal := strLogFinal + #9 + #9 + 'CODIGOALUNO: ' + codigoAluno + #13;

      if(ck_sn_grade.Checked) then
      begin
         sqlAltera := sqlAltera + ' ,cd_grade = '+ TItemCombo(cbgrade.Items.Objects[cbgrade.ItemIndex]).getCodigo();
         strLogInicial := strLogInicial + #9 + #9 + 'GRADE: ' + grade + #13;
         strLogFinal := strLogFinal + #9 + #9 + 'GRADE: ' + TItemCombo(cbgrade.Items.Objects[cbgrade.ItemIndex]).getCodigo() + #13;
      end;

      if(ck_sn_situacao.Checked) then
      begin
         sqlAltera := sqlAltera + ' ,cd_situacao = '+ TItemCombo(cbsituacao.Items.Objects[cbsituacao.ItemIndex]).getCodigo();
         strLogInicial := strLogInicial + #9 + #9 + 'SITUAÇÃO: ' + situacao + #13;
         strLogFinal := strLogFinal + #9 + #9 + 'SITUAÇÃO: ' + TItemCombo(cbsituacao.Items.Objects[cbsituacao.ItemIndex]).getCodigo() + #13;
      end;

      if(ck_sn_ano_sem.Checked) then
      begin
         sqlAltera := sqlAltera + ' ,nr_anosem_conclusao = '+ edanosem.EditText;
         strLogInicial := strLogInicial + #9 + #9 + 'nranosem_conclusao: ' + anosemConc + #13;
         strLogFinal := strLogFinal + #9 + #9 + 'nranosem_conclusao: ' + edanosem.EditText + #13;
      end;

      if(ck_sn_conclusao.Checked) then
      begin
         sqlAltera := sqlAltera + ' ,dt_conclusao = ''' + FormatDateTime('yyyy-mm-dd',dtConc.getDate) + '''';
         strLogInicial := strLogInicial + #9 + #9 + 'DATA CONCLUSÃO: ' + dtConclusao + #13;
         strLogFinal := strLogFinal + #9 + #9 + 'DATA CONCLUSÃO: ' + FormatDateTime('dd/mm/yyyy',dtConc.getDate) + #13;
      end;

      if(ck_sn_colacao.Checked) then
      begin
         sqlAltera := sqlAltera + ' ,dt_colacao = ''' + FormatDateTime('yyyy-mm-dd',dtColacao.getDate) + '''';
         strLogInicial := strLogInicial + #9 + #9 + 'DATA COLAÇÃO: ' + dataColacao + #13;
         strLogFinal := strLogFinal + #9 + #9 + 'DATA COLAÇÃO: ' + FormatDateTime('dd/mm/yyyy',dtColacao.getDate) + #13;
      end;

      if(ck_sn_diploma.Checked) then
      begin
         sqlAltera := sqlAltera + '  ,dt_exp_diploma = '''+ FormatDateTime('yyyy-mm-dd',dtDiploma.getDate) + '''';
         strLogInicial := strLogInicial + #9 + #9 + 'DATA EXPEDIÇÃO DIPLOMA: ' + dtExp + #13;
         strLogFinal := strLogFinal + #9 + #9 + 'DATA EXPEDIÇÃO DIPLOMA: ' + FormatDateTime('dd/mm/yyyy',dtDiploma.getDate) + #13;
      end;

      sqlAltera := sqlAltera + ' WHERE cd_matricula_curso = ' + matriculaCurso;

      //Update
      qryUpdate.Close;
      qryUpdate.SQL.Clear;
      qryUpdate.SQL.Add(sqlAltera);
      qryUpdate.ExecSQL;

      //Log
      DM.setLog(
            1018,
            'Alteracao',
            codigoAluno,
            DM.getColigadaByTurma(turma,strtoint(anoSemestre)),
            strLogInicial + strLogFinal
         );

   end;

end;

procedure TformMatriculaCursoTurma.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  frmMatriculas.tblMatriculas.Close;
  frmMatriculas.tblMatriculas.Open;
end;

procedure TformMatriculaCursoTurma.FormShow(Sender: TObject);
begin
   lbOAnoSem.Caption := turma + ' - ' + anoSemestre;
   edanosem.Text := anoSemestre;

   self.carregaCombos();
end;

procedure TformMatriculaCursoTurma.percorreListaPessoas(checar: boolean);
var
   i : integer;
begin
   for i := 0 to lstAlunos.Items.Count - 1 do
   begin
      lstAlunos.Checked[i] := checar;
   end;
end;

procedure TformMatriculaCursoTurma.ToolButton5Click(Sender: TObject);
begin
   percorreListaPessoas(true);
end;

procedure TformMatriculaCursoTurma.ToolButton6Click(Sender: TObject);
begin
   percorreListaPessoas(false);
end;

procedure TformMatriculaCursoTurma.udDAnoSemClick(Sender: TObject;
  Button: TUDBtnType);
begin
   case Button of
      btNext:
      begin
         Self.edanosem.Text := DM.incrementar_ano_semestre(Self.edanosem.Text);
      end;
      btPrev:
         Self.edanosem.Text := DM.decrementar_ano_semestre(Self.edanosem.Text);
   end;
end;

function TformMatriculaCursoTurma.verificaSelecionados: boolean;
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

end.
