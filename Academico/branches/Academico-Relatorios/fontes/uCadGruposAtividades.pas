unit uCadGruposAtividades;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, ComCtrls, Buttons, StdCtrls, ToolWin, ImgList, DB,
  ZAbstractRODataset, ZAbstractDataset, UZDataset,uMensagem;

type
  TfrmCadGruposAtividades = class(TForm)
    blTop: TBevel;
    blLeft: TBevel;
    blRight: TBevel;
    pcCadGrupos: TPageControl;
    tsGrupoAtividade: TTabSheet;
    tsEstudantes: TTabSheet;
    lbCurso: TLabel;
    edCurso: TEdit;
    lbTurma: TLabel;
    edTurma: TEdit;
    sbBuscaTurma: TSpeedButton;
    lbDisciplina: TLabel;
    edDisciplina: TEdit;
    sbBuscaDisciplina: TSpeedButton;
    sbBuscaCurso: TSpeedButton;
    edNomeGrupo: TEdit;
    lbNomeGrupo: TLabel;
    lbProfessor: TLabel;
    edProfessor: TEdit;
    sbBuscaProfessor: TSpeedButton;
    lbMaxVagasGrupo: TLabel;
    edMaxVagasGrupo: TEdit;
    lbAtivo: TLabel;
    cbAtivo: TComboBox;
    tbAcoes: TToolBar;
    btSalvar: TToolButton;
    btSeparador: TToolButton;
    btCancelar: TToolButton;
    ilAcoes: TImageList;
    qySalvarGrupo: TUMZQuery;
    lbRelGrupo: TLabel;
    lbRelTurma: TLabel;
    lbRelCurso: TLabel;
    lbRelDisciplina: TLabel;
    lbAlunosGrupo: TLabel;
    lbAlunosTurma: TLabel;
    clbAlunosTurma: TListBox;
    clbAlunosGrupo: TListBox;
    btRemTodos: TButton;
    btAdd: TButton;
    btAddTodos: TButton;
    btRem: TButton;
    ToolBar1: TToolBar;
    ToolButton1: TToolButton;
    ToolButton2: TToolButton;
    ToolButton3: TToolButton;
    qyBuscarAlunos: TUMZQuery;
    qyBuscarAlunoscd_pessoa: TIntegerField;
    qyBuscarAlunosnm_pessoa: TStringField;
    edRelNomeGrupo: TEdit;
    edRelCodTurma: TEdit;
    edRelCodCurso: TEdit;
    edRelDescDisciplina: TEdit;
    qyBuscarAlunosselecionado: TIntegerField;
    qyVerificaRemoverAluno: TUMZQuery;
    qyVerificaRemoverAlunopossui_aula: TLargeintField;
    qyVerificaRemoverAlunopossui_provas: TLargeintField;
    qyVerificaRemoverAlunopossui_atividades: TLargeintField;
    qyBuscarGrupoAluno: TUMZQuery;
    qyBuscarGrupoAlunonm_grupo: TStringField;
    Button1: TButton;
    procedure Button1Click(Sender: TObject);
    procedure btAddTodosClick(Sender: TObject);
    procedure btRemTodosClick(Sender: TObject);
    procedure btRemClick(Sender: TObject);
    procedure btAddClick(Sender: TObject);
    procedure pcCadGruposChange(Sender: TObject);
    procedure pcCadGruposChanging(Sender: TObject; var AllowChange: Boolean);
    procedure FormCreate(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure btCancelarClick(Sender: TObject);
    procedure btSalvarClick(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure edMaxVagasGrupoKeyPress(Sender: TObject; var Key: Char);
    procedure sbBuscaProfessorClick(Sender: TObject);
    procedure sbBuscaDisciplinaClick(Sender: TObject);
    procedure sbBuscaTurmaClick(Sender: TObject);
    procedure sbBuscaCursoClick(Sender: TObject);
  private
    { Private declarations }
    iAnoSemestre: Integer;
    iCodGrupo: Integer;
    sDisciplina: String;

    slLogAlunos: TStringList;

    procedure relacionaAlunosGrupo(cd_grupo_inserido: Integer = -1);
    procedure inativaAlunosGrupo(cd_grupo: Integer);
    procedure gerarLog(cd_grupo_inserido: Integer = -1);
    procedure vincularProfessor();

    function podeRemoverAluno(cdPessoa: Integer): Boolean;
  public
    { Public declarations }
    procedure setAnoSemestre(nr_anosemestre: Integer);
    procedure setCurso(cd_curso: String);
    procedure setTurma(cd_turma: String);
    procedure setDisciplina(cd_disciplina: String);
    procedure setDisciplinaDesc(ds_disciplina: String);
    procedure setProfessor(cd_professor: String);
    procedure setGrupo(cd_grupo: Integer);
    procedure carregarEstudantes();
  end;

var
  frmCadGruposAtividades: TfrmCadGruposAtividades;

implementation

{$R *.dfm}

uses
   uFSelecionarCurso, uFSelecionarTurma, uFSelecionarDisciplina, uFSelecionarPessoa, General, uDM,
   uItemCombo, uFSelecionarGrupo;

procedure TfrmCadGruposAtividades.setAnoSemestre(nr_anosemestre: Integer);
begin
   iAnoSemestre := nr_anosemestre;
end;

procedure TfrmCadGruposAtividades.setCurso(cd_curso: String);
begin
   edCurso.Text := cd_curso;
end;

procedure TfrmCadGruposAtividades.setDisciplina(cd_disciplina: String);
begin
   edDisciplina.Text := cd_disciplina;
end;

procedure TfrmCadGruposAtividades.setDisciplinaDesc(ds_disciplina: String);
begin
   sDisciplina := ds_disciplina;
end;

procedure TfrmCadGruposAtividades.setGrupo(cd_grupo: Integer);
begin
   iCodGrupo := cd_grupo;
end;

procedure TfrmCadGruposAtividades.setProfessor(cd_professor: String);
begin
   edProfessor.Text := cd_professor;
end;

procedure TfrmCadGruposAtividades.setTurma(cd_turma: String);
begin
   edTurma.Text := cd_turma;
end;

function TfrmCadGruposAtividades.podeRemoverAluno(cdPessoa: Integer): Boolean;
begin
   Result := True;

   // Verifica se é edição de um grupo, caso não for permite a exclussão do aluno sem problemas
   if iCodGrupo > 0 then
   begin
      // SQL que verifica se o aluno possui impedimento de ser excluído do grupo (aula, prova, atividade)
      qyVerificaRemoverAluno.Close;
      qyVerificaRemoverAluno.ParamByName('cd_grupo').AsInteger := iCodGrupo;
      qyVerificaRemoverAluno.ParamByName('cd_pessoa').AsInteger := cdPessoa;
      qyVerificaRemoverAluno.Open;

      // Verifica se o aluno possui aulas, provas ou atividades
      if (qyVerificaRemoverAluno.FieldByName('possui_aula').AsInteger > 0) or
         (qyVerificaRemoverAluno.FieldByName('possui_provas').AsInteger > 0) or
         (qyVerificaRemoverAluno.FieldByName('possui_atividades').AsInteger > 0) then
      begin
         Result := False;
      end;

   end;
end;

procedure TfrmCadGruposAtividades.vincularProfessor;
const
   SQL_VINCULAR_PROF_DISCIPLINA = 'INSERT IGNORE INTO professoresdisciplinas (professor, disciplina, curso) VALUES (:professor, :disciplina, :curso)';
   SQL_VINCULAR_PROF_TURMA = 'INSERT IGNORE INTO turmasprofessores (anosemestre, curso, turma, disciplina, professor) VALUES (:anosemestre, :curso, :turma, :disciplina, :professor)';
   SQL_VINCULAR_PROF_COLIGADA = 'INSERT INTO professores_unidades(cd_professor, sn_funcionario, sn_professor, sn_orientador, cd_coligada) VALUES '+
                                ' (:cd_professor, :sn_funcionario, :sn_professor, :sn_orientador, (SELECT cd_coligada FROM turmas WHERE codigo LIKE :turma AND anosemestre = :anosemestre LIMIT 1)) ON DUPLICATE KEY UPDATE sn_professor=VALUES(sn_professor)';
   SQL_HABILITAR_PROFESSOR = 'UPDATE professores SET sn_professor = "S" WHERE cd_pessoa = :cd_pessoa';
var
   qyVincular: TUMZQuery;
begin
   DM.CriarConsulta(qyVincular);

   // Vincula professor a disciplina
   qyVincular.Close;
   qyVincular.SQL.Text := SQL_VINCULAR_PROF_DISCIPLINA;
   qyVincular.ParamByName('professor').AsInteger := StrToInt(edProfessor.Text);
   qyVincular.ParamByName('disciplina').AsInteger := StrToInt(edDisciplina.Text);
   qyVincular.ParamByName('curso').AsString := edCurso.Text;
   qyVincular.ExecSQL;

   // Vincula professor a turma
   qyVincular.Close;
   qyVincular.SQL.Text := SQL_VINCULAR_PROF_TURMA;
   qyVincular.ParamByName('anosemestre').AsInteger := iAnoSemestre;
   qyVincular.ParamByName('curso').AsString := edCurso.Text;
   qyVincular.ParamByName('turma').AsString := edTurma.Text;
   qyVincular.ParamByName('disciplina').AsInteger := StrToInt(edDisciplina.Text);
   qyVincular.ParamByName('professor').AsInteger := StrToInt(edProfessor.Text);
   qyVincular.ExecSQL;

   // Vincular professor a unidade (da turma)
   qyVincular.Close;
   qyVincular.SQL.Text := SQL_VINCULAR_PROF_COLIGADA;
   qyVincular.ParamByName('cd_professor').AsInteger := StrToInt(edProfessor.Text);
   qyVincular.ParamByName('sn_funcionario').AsInteger := 0;
   qyVincular.ParamByName('sn_professor').AsInteger := 1;
   qyVincular.ParamByName('sn_orientador').AsInteger := 0;
   qyVincular.ParamByName('turma').AsString := edTurma.Text;
   qyVincular.ParamByName('anosemestre').AsInteger := iAnoSemestre;
   qyVincular.ExecSQL;

   // Habilitar o professor
   qyVincular.Close;
   qyVincular.SQL.Text := SQL_HABILITAR_PROFESSOR;
   qyVincular.ParamByName('cd_pessoa').AsInteger := StrToInt(edProfessor.Text);
   qyVincular.ExecSQL;

   FreeAndNil(qyVincular);
end;

procedure TfrmCadGruposAtividades.relacionaAlunosGrupo(cd_grupo_inserido: Integer = -1);
const
   SQL_INSERIR_ALUNOS  = 'INSERT INTO diario_grupos_pessoas(cd_grupo, cd_pessoa, dt_entrada) VALUES ';

   SQL_INATIVAR_ALUNOS = ' UPDATE '+
                         '    diario_grupos_pessoas '+
                         ' SET '+
                         '    dt_saida = NOW() '+
                         ' WHERE '+
                         '    dt_saida IS NULL AND '+
                         '    cd_grupo = :cd_grupo AND '+
                         '    cd_pessoa IN ';

   SQL_VERIFICA_ALUNO = ' SELECT '+
                        '    COUNT(cd_pessoa) vinculado '+
                        ' FROM '+
                        '    diario_grupos_pessoas dgp '+
                        ' WHERE '+
                        '    dgp.cd_grupo = :cd_grupo AND '+
                        '    dgp.cd_pessoa = :cd_pessoa AND '+
                        '    dgp.dt_saida IS NULL ';
var
   qyVincular, qyVerificar: TUMZQuery;
   slRegistrosInserir: TStringList;
   i: Integer;
   registro, chaveLog, msgLog: String;
begin
   DM.CriarConsulta(qyVincular);
   DM.CriarConsulta(qyVerificar);

   // Verifica se é edição de um grupo
   if iCodGrupo > 0 then
   begin

      // Desativa os alunos que foram removidos do grupo
      slRegistrosInserir := TStringList.Create;
      slRegistrosInserir.Delimiter := ',';
      slRegistrosInserir.QuoteChar := ' ';
      for i := 0 to clbAlunosTurma.Count - 1 do
      begin
         slRegistrosInserir.Add(TItemCombo(clbAlunosTurma.Items.Objects[i]).getCodigo);

         // Armazena informações de log para edição de aluno (serão inseridas ao final do processo de edição do grupo)
         // Informações de alunos inativados
         slLogAlunos.Add(TItemCombo(clbAlunosTurma.Items.Objects[i]).getCodigo + ' - ' + TItemCombo(clbAlunosTurma.Items.Objects[i]).getDescricao + ' [Não Relacionado]');
      end;

      if slRegistrosInserir.Count > 0 then
      begin
         qyVincular.SQL.Text := SQL_INATIVAR_ALUNOS;
         qyVincular.SQL.Add('('+slRegistrosInserir.DelimitedText+')');
         qyVincular.ParamByName('cd_grupo').AsInteger := iCodGrupo;
         qyVincular.ExecSQL;
      end;

      // Inclui os alunos adicionados ao grupo
      // Varre os alunos
      for i := 0 to clbAlunosGrupo.Count - 1 do
      begin
         // SQL que verifica se eles já estão vinculados ao grupo (não vincula novamente)
         qyVerificar.Close;
         qyVerificar.SQL.Text := SQL_VERIFICA_ALUNO;
         qyVerificar.ParamByName('cd_pessoa').AsInteger := StrToInt(TItemCombo(clbAlunosGrupo.Items.Objects[i]).getCodigo);
         qyVerificar.ParamByName('cd_grupo').AsInteger := iCodGrupo;
         qyVerificar.Open;

         // Verifica se o aluno já está vinculado ao grupo
         if qyVerificar.FieldByName('vinculado').AsInteger = 0 then
         begin
            // Insere o aluno no grupo
            qyVincular.Close;
            qyVincular.SQL.Text := SQL_INSERIR_ALUNOS;
            qyVincular.SQL.Add('('+IntToStr(iCodGrupo)+', '+TItemCombo(clbAlunosGrupo.Items.Objects[i]).getCodigo+', NOW())');
            qyVincular.ExecSQL;

            // Armazena informações de log para edição de aluno (serão inseridas ao final do processo de edição do grupo)
            // Informações de alunos ativos
            slLogAlunos.Add(TItemCombo(clbAlunosGrupo.Items.Objects[i]).getCodigo + ' - ' + TItemCombo(clbAlunosGrupo.Items.Objects[i]).getDescricao + ' [Incluído]');
         end;
      end;

   // Inserção de um grupo
   end else begin

      slRegistrosInserir := TStringList.Create;
      slRegistrosInserir.Delimiter := ',';
      slRegistrosInserir.QuoteChar := ' ';
      for i := 0 to clbAlunosGrupo.Count - 1 do
      begin
         registro := '('+IntToStr(cd_grupo_inserido)+', '+TItemCombo(clbAlunosGrupo.Items.Objects[i]).getCodigo+', NOW())';
         slRegistrosInserir.Add(registro);

         // Armazena informações de log para inserção de aluno (serão inseridas ao final do processo de inserção do grupo)
         slLogAlunos.Add(TItemCombo(clbAlunosGrupo.Items.Objects[i]).getCodigo + ' - ' + TItemCombo(clbAlunosGrupo.Items.Objects[i]).getDescricao + ' [Incluído]');
      end;

      if slRegistrosInserir.Count > 0 then
      begin
         qyVincular.SQL.Text := SQL_INSERIR_ALUNOS;
         qyVincular.SQL.Add(slRegistrosInserir.DelimitedText);

         qyVincular.ExecSQL;
      end;
      
   end;

   FreeAndNil(qyVincular);
   FreeAndNil(qyVerificar);
   FreeAndNil(slRegistrosInserir);

end;

procedure TfrmCadGruposAtividades.btAddClick(Sender: TObject);
var
   iSelecionado: Integer;
   isAlunoOutroGrupo: Bool;
   cdPessoa, sAluno: String;
begin
   iSelecionado := clbAlunosTurma.ItemIndex;

   if (Length(Trim(edMaxVagasGrupo.Text)) = 0) then
   begin
      Mensagem('Número máximo de vagas do grupo não foi informado.', 'Atenção!', MB_ICONWARNING + MB_OK);
      Exit;
   end;

   if ( clbAlunosTurma.Count = 0 ) then
   begin
      Mensagem('Não existem alunos para serem adicionados.', 'Atenção!', MB_ICONWARNING + MB_OK);
      Exit;
   end;

   if iSelecionado = -1 then
   begin
      Mensagem('Necessário selecionar um aluno para adicionar.', 'Atenção!', MB_ICONWARNING + MB_OK);
      Exit;
   end;

   if clbAlunosGrupo.Count >= StrToInt(edMaxVagasGrupo.Text) then
   begin
      Mensagem('Não é possível adicionar mais alunos ao grupo, pois o máximo de vagas no grupo ('+edMaxVagasGrupo.Text+') já foi atingido.', 'Atenção!', MB_ICONWARNING + MB_OK);
      Exit;
   end;

   cdPessoa := TItemCombo(clbAlunosTurma.Items.Objects[clbAlunosTurma.ItemIndex]).getCodigo;
   sAluno := TItemCombo(clbAlunosTurma.Items.Objects[clbAlunosTurma.ItemIndex]).getDescricao;
   isAlunoOutroGrupo := TItemCombo(clbAlunosTurma.Items.Objects[clbAlunosTurma.ItemIndex]).getVariavel();

   // Não pode adicionar alunos que pertencem a outro grupo
   if isAlunoOutroGrupo then
   begin
      Mensagem('Não é possível adicionar um aluno que está em um grupo para a mesma Turma/Disciplina.', 'Atenção!', MB_ICONWARNING + MB_OK);
      Exit;
   end;

   // Adiciona o aluno na combo de alunos do grupo
   clbAlunosGrupo.AddItem(
      sAluno,
      TItemCombo.Create(
         cdPessoa,
         sAluno
      )
   );      

   // Remove aluno da combo de alunos da turma
   clbAlunosTurma.Items.Delete(iSelecionado);
end;

procedure TfrmCadGruposAtividades.btAddTodosClick(Sender: TObject);
var
   i, limite, qtdAlunosAdicionar: Integer;
   isAlunoOutroGrupo: Bool;
   cdPessoa, sAluno: String;
begin
   if (Length(Trim(edMaxVagasGrupo.Text)) = 0) then
   begin
      Mensagem('Número máximo de vagas do grupo não foi informado.', 'Atenção!', MB_ICONWARNING + MB_OK);
      Exit;
   end;

   if ( clbAlunosTurma.Count = 0 ) then
   begin
      Mensagem('Não existem alunos para serem adicionados.', 'Atenção!', MB_ICONWARNING + MB_OK);
      Exit;
   end;

   // Verifica se o grupo ainda possui vagas
   if clbAlunosGrupo.Count >= StrToInt(edMaxVagasGrupo.Text) then
   begin
      Mensagem('Não é possível adicionar mais alunos ao grupo, pois o máximo de vagas no grupo ('+edMaxVagasGrupo.Text+') já foi atingido.', 'Atenção!', MB_ICONWARNING + MB_OK);
      Exit;
   end;

   // Inicia a quantidade de alunos para adicionar com o que já está no grupo
   qtdAlunosAdicionar := clbAlunosGrupo.Count;
   for i := 0 to clbAlunosTurma.Count - 1 do
   begin
      isAlunoOutroGrupo := TItemCombo(clbAlunosTurma.Items.Objects[i]).getVariavel();
      // Contabiliza mais 1 apenas se o aluno não é de outro grupo
      if not isAlunoOutroGrupo then
      begin
         qtdAlunosAdicionar := qtdAlunosAdicionar + 1;
      end;
   end;

   // Verifica se ao adicionar todos alunos o limite de vagas do grupo é ultrapassado
   if qtdAlunosAdicionar >= StrToInt(edMaxVagasGrupo.Text) then
   begin
      if Mensagem('Você está tentanto enviar uma quantidade de alunos maior que o limite do grupo ('+edMaxVagasGrupo.Text+'). Deseja enviar os primeiros até o máximo de vagas do grupo?', 'Atenção!', MB_ICONQUESTION + MB_OKCANCEL) = mrCancel then
      begin
         Exit;
      end;
   end;

   // Adiciona os alunos até os mesmos acabarem OU o grupo for preenchido pela quantidade de vagas do grupo
   limite := 0;
   while (clbAlunosTurma.Count > limite) and
         (clbAlunosGrupo.Count < StrToInt(edMaxVagasGrupo.Text)) do
   begin
      cdPessoa := TItemCombo(clbAlunosTurma.Items.Objects[limite]).getCodigo;
      sAluno := TItemCombo(clbAlunosTurma.Items.Objects[limite]).getDescricao;
      isAlunoOutroGrupo := TItemCombo(clbAlunosTurma.Items.Objects[limite]).getVariavel();

      // Não pode adicionar alunos que pertencem a outro grupo
      if isAlunoOutroGrupo then
      begin
         limite := limite+1;
         Continue;
      end;

      // Adiciona o aluno na combo de alunos do grupo
      clbAlunosGrupo.AddItem(
         sAluno,
         TItemCombo.Create(
            cdPessoa,
            sAluno
         )
      );

      // Remove aluno da combo de alunos da turma
      clbAlunosTurma.Items.Delete(limite);
   end;

end;

procedure TfrmCadGruposAtividades.btCancelarClick(Sender: TObject);
begin
   Self.ModalResult := mrCancel;
   Self.CloseModal();
end;

procedure TfrmCadGruposAtividades.btRemClick(Sender: TObject);
var
   iSelecionado: Integer;
   cdPessoa, sAluno: String;
begin
   iSelecionado := clbAlunosGrupo.ItemIndex;

   if ( clbAlunosGrupo.Count = 0 ) then
   begin
      Mensagem('Não existem alunos para serem removidos.', 'Atenção!', MB_ICONWARNING + MB_OK);
      Exit;
   end;

   if iSelecionado = -1 then
   begin
      Mensagem('Necessário selecionar um aluno para remover.', 'Atenção!', MB_ICONWARNING + MB_OK);
      Exit;
   end;

   cdPessoa := TItemCombo(clbAlunosGrupo.Items.Objects[clbAlunosGrupo.ItemIndex]).getCodigo;
   sAluno := TItemCombo(clbAlunosGrupo.Items.Objects[clbAlunosGrupo.ItemIndex]).getDescricao;

   // Se não puder remover o aluno apresenta a mensagem avisando o usuário que ele será apenas desativado
   if not podeRemoverAluno(StrToInt(cdPessoa)) then
   begin
      if Mensagem('O aluno ['+sAluno+'] possui alguma frequência, nota ou registro de atividade nesse grupo. Deseja realmente remove-lo?', 'Atenção!', MB_ICONQUESTION + MB_YESNOCANCEL) <> mrYes then
      begin
         Exit;
      end;
   end;

   // Adiciona o aluno na combo de alunos da turma
   clbAlunosTurma.AddItem(
      sAluno,
      TItemCombo.Create(
         cdPessoa,
         sAluno,
         false
      )
   );

   // Remove aluno da combo de alunos do grupo
   clbAlunosGrupo.Items.Delete(iSelecionado);
end;

procedure TfrmCadGruposAtividades.btRemTodosClick(Sender: TObject);
var
   cdPessoa, sAluno: String;
   limite: Integer;
begin

   if ( clbAlunosGrupo.Count = 0 ) then
   begin
      Mensagem('Não existem alunos para serem removidos.', 'Atenção!', MB_ICONWARNING + MB_OK);
      Exit;
   end;

   limite := 0;
   while clbAlunosGrupo.Count > limite do
   begin
      cdPessoa := TItemCombo(clbAlunosGrupo.Items.Objects[limite]).getCodigo;
      sAluno := TItemCombo(clbAlunosGrupo.Items.Objects[limite]).getDescricao;

      // Se não puder remover o aluno apresenta a mensagem avisando o usuário que ele será apenas desativado
      if not podeRemoverAluno(StrToInt(cdPessoa)) then
      begin
         if Mensagem('O aluno ['+sAluno+'] possui alguma frequência, nota ou registro de atividade nesse grupo. Deseja realmente remove-lo?', 'Atenção!', MB_ICONQUESTION + MB_YESNOCANCEL) <> mrYes then
         begin
            limite := limite+1;
            Continue;
         end;
      end;

      // Adiciona o aluno na combo de alunos da turma
      clbAlunosTurma.AddItem(
         sAluno,
         TItemCombo.Create(
            cdPessoa,
            sAluno,
            false
         )
      );

      // Remove aluno da combo de alunos do grupo
      clbAlunosGrupo.Items.Delete(limite);
   end;

end;

procedure TfrmCadGruposAtividades.btSalvarClick(Sender: TObject);
var
   iCodGrupoInserido: Integer;
begin
   // Verifica se os dados informados estão corretos
   if Length(Trim(edNomeGrupo.Text)) = 0 then
   begin
      Mensagem('O nome do grupo precisa ser informado.', 'Atenção!', MB_ICONWARNING + MB_OK);
      Exit;
   end;

   if Length(Trim(edCurso.Text)) = 0 then
   begin
      Mensagem('Um curso precisa ser selecionado.', 'Atenção!', MB_ICONWARNING + MB_OK);
      Exit;
   end;

   if Length(Trim(edTurma.Text)) = 0 then
   begin
      Mensagem('Uma turma precisa ser selecionada.', 'Atenção!', MB_ICONWARNING + MB_OK);
      Exit;
   end;

   if Length(Trim(edDisciplina.Text)) = 0 then
   begin
      Mensagem('Uma disciplina precisa ser selecionada.', 'Atenção!', MB_ICONWARNING + MB_OK);
      Exit;
   end;

   if Length(Trim(edProfessor.Text)) = 0 then
   begin
      Mensagem('O professor precisa ser selecionado.', 'Atenção!', MB_ICONWARNING + MB_OK);
      Exit;
   end;

   if Length(Trim(edMaxVagasGrupo.Text)) = 0 then
   begin
      Mensagem('O máximo de vagas do grupo precisa ser informado.', 'Atenção!', MB_ICONWARNING + MB_OK);
      Exit;
   end;

   if StrToInt(edMaxVagasGrupo.Text) <= 0 then
   begin
      Mensagem('O máximo de vagas do grupo precisa ser maior que zero.', 'Atenção!', MB_ICONWARNING + MB_OK);
      Exit;
   end;

   if clbAlunosGrupo.Count > StrToInt(edMaxVagasGrupo.Text) then
   begin
      Mensagem('Foram selecionados mais alunos do que o máximo de vagas do grupo.', 'Atenção!', MB_ICONWARNING + MB_OK);
      Exit;
   end;

   // Salva informações do grupo de atividades
   qySalvarGrupo.Close;
   if iCodGrupo > 0 then
   begin
      qySalvarGrupo.ParamByName('cd_grupo').AsInteger := iCodGrupo;
   end else begin
      qySalvarGrupo.ParamByName('cd_grupo').Clear;
   end;
   qySalvarGrupo.ParamByName('nm_grupo').AsString := edNomeGrupo.Text;
   qySalvarGrupo.ParamByName('nr_anosemestre').AsInteger := iAnoSemestre;
   qySalvarGrupo.ParamByName('cd_curso').AsString := edCurso.Text;
   qySalvarGrupo.ParamByName('cd_turma').AsString := edTurma.Text;
   qySalvarGrupo.ParamByName('cd_disciplina').AsInteger := StrToInt(edDisciplina.Text);
   qySalvarGrupo.ParamByName('cd_professor').AsInteger := StrToInt(edProfessor.Text);
   qySalvarGrupo.ParamByName('nr_max_alunos').AsInteger := StrToInt(edMaxVagasGrupo.Text);
   qySalvarGrupo.ParamByName('sn_ativo').AsInteger := cbAtivo.ItemIndex;
   qySalvarGrupo.ExecSQL;

   iCodGrupoInserido := DM.LastInsert;

   if cbAtivo.ItemIndex = 1 then
   begin
      // Se o grupo estiver ativo, relaciona os alunos ao grupo
      relacionaAlunosGrupo(iCodGrupoInserido);

   end else begin
   
      // Se o grupo não estiver ativo, inativa os alunos
      // No caso de inserção de grupo inativo, nem vai ter alunos vinculados (porque só vincula a grupos ativos)
      inativaAlunosGrupo(iCodGrupo);
   end;

   // Vincular professor a disciplina (se não tiver vinculado)
   vincularProfessor();

   // Gerar log
   gerarLog(iCodGrupoInserido);

   Self.ModalResult := mrOk;
   Self.CloseModal();
end;

procedure TfrmCadGruposAtividades.Button1Click(Sender: TObject);
const
   SQL_SELECIONA_GRUPO = ' SELECT '+
                         '    dg.cd_pessoa, '+
                         '    p.nm_pessoa '+
                         ' FROM '+
                         '    diario_grupos_pessoas dg '+
                         ' INNER JOIN pessoas P ON (P.cd_pessoa = dg.cd_pessoa) '+
                         ' WHERE '+
                         '    dg.cd_grupo = :cd_grupo AND'+
                         '    dg.dt_saida IS NULL '+
                         ' ORDER BY p.nm_pessoa ';
var
   resultado_filtro : TResultadoFiltroGrupo;
   qyPessoasGrupo: TUMZQuery;
   I, contadorInseridos: Integer;
   msg : String;
   estudantesInseridos : TStringList;
   possuiAlunoFaltante,isAlunoOutroGrupo :Boolean;
   frmMensagem : TfrmMensagem;
   parametros: TParamsIni;
   cd_pessoa : String;
   totalAlunosTurma : Integer;
begin
   DM.CriarConsulta(qyPessoasGrupo);
   estudantesInseridos := TStringList.Create;
   contadorInseridos := 0;

   if clbAlunosTurma.Count = 0 then
   begin
      Mensagem('Devem existir alunos da turma filtrados para utilizar a cópia de outro grupo.', 'Atenção!', MB_ICONWARNING + MB_OK);
      Exit;
   end;

   { Pesquisar Grupo }
   resultado_filtro := TfrmSelecionarGrupo.Filtrar([]);

   if not resultado_filtro.filtrado then Exit;

   // Busca dados do grupo selecionado
   qyPessoasGrupo.Close;
   qyPessoasGrupo.SQL.Text := SQL_SELECIONA_GRUPO;
   qyPessoasGrupo.ParamByName('cd_grupo').AsInteger := resultado_filtro.cd_grupo;;
   qyPessoasGrupo.Open;
   totalAlunosTurma := clbAlunosTurma.Items.Count;

   // Verifica os alunos existentes na grid e se o grupo tem vagas
   for I := 0 to totalAlunosTurma - 1 do
   begin
      try
         cd_pessoa := TItemCombo(clbAlunosTurma.Items.Objects[I]).getCodigo;
      except
         break;
      end;

      if qyPessoasGrupo.Locate('cd_pessoa',cd_pessoa,[]) then
      begin
      
         isAlunoOutroGrupo := TItemCombo(clbAlunosTurma.Items.Objects[I]).getVariavel();
         // Não pode adicionar alunos que pertencem a outro grupo
         if isAlunoOutroGrupo then
         begin
            continue;
         end;

         estudantesInseridos.Values[cd_pessoa] := cd_pessoa;
         inc(contadorInseridos);

         // Adiciona o aluno na combo de alunos do grupo
         clbAlunosGrupo.AddItem(
            TItemCombo(clbAlunosTurma.Items.Objects[I]).getDescricao,
            TItemCombo.Create(
               cd_pessoa,
               TItemCombo(clbAlunosTurma.Items.Objects[I]).getDescricao
            )
         );

         // Remove aluno da combo de alunos da turma
         clbAlunosTurma.Items.Delete(i);
         totalAlunosTurma := totalAlunosTurma - 1;

         //Acaram as vagas
         if(contadorInseridos = strtoint(edMaxVagasGrupo.Text)) then
         begin
            break;
         end;
      end;
   end;

   // Monta a mensagem com os alunos que não puderam ser incluidos
   possuiAlunoFaltante := false;
   qyPessoasGrupo.First;
   while not qyPessoasGrupo.Eof do
   begin
      if estudantesInseridos.Values[qyPessoasGrupo.FieldByName('cd_pessoa').AsString] = '' then
      begin
         msg := msg + qyPessoasGrupo.FieldByName('cd_pessoa').AsString + ' - ' + qyPessoasGrupo.FieldByName('nm_pessoa').AsString +#13;
         possuiAlunoFaltante := true;
      end;

      qyPessoasGrupo.Next;
   end;

   if (possuiAlunoFaltante) then
   begin
      parametros.snErroBanco := false;
      parametros.titulo := 'Aviso';
      parametros.opcoes := (BT_OK + ICO_WARNING);
      parametros.mensagens.msgPrincipal := msg;
      parametros.mensagens.msgTopo := 'Os seguintes alunos não foram incluidos no novo grupo:' + #13;
      parametros.dimensao.altura := 300;
      parametros.dimensao.largura := 500;

      frmMensagem := TfrmMensagem.create(nil, parametros);
      frmMensagem.ShowModal;
   end;
   
end;

procedure TfrmCadGruposAtividades.carregarEstudantes;
var
   sNome: String;
   isAlunoOutroGrupo: Bool;
begin

   // Verifica se todas as informações de Curso/Turma/Disciplina foram selecionadas
   // Caso algumas delas não foi selecionada, não busca os alunos
   if (Length(Trim(edCurso.Text)) = 0) then Exit;
   if (Length(Trim(edTurma.Text)) = 0) then Exit;
   if (Length(Trim(edDisciplina.Text)) = 0) then Exit;

   // Limpa as combos (removendo alunos existentes)
   clbAlunosGrupo.Items.Clear;
   clbAlunosTurma.Items.Clear;

   // Busca os alunos com base na turma/curso/disciplina
   qyBuscarAlunos.Close;
   qyBuscarAlunos.ParamByName('cd_grupo').AsInteger := iCodGrupo;
   qyBuscarAlunos.ParamByName('nr_anosemestre').AsInteger := iAnoSemestre;
   qyBuscarAlunos.ParamByName('cd_curso').AsString := edCurso.Text;
   qyBuscarAlunos.ParamByName('cd_turma').AsString := edTurma.Text;
   qyBuscarAlunos.ParamByName('cd_disciplina').AsInteger := StrToInt(edDisciplina.Text);
   qyBuscarAlunos.Open;

   // Varre os alunos encontrados
   while not qyBuscarAlunos.Eof do
   begin

      // Verifica se o aluno está selecionado no grupo
      if qyBuscarAlunos.FieldByName('selecionado').AsInteger = 1 then
      begin

         // Adiciona o aluno na combo de selecionados
         clbAlunosGrupo.AddItem(
            qyBuscarAlunos.FieldByName('nm_pessoa').AsString,
            TItemCombo.Create(
               qyBuscarAlunos.FieldByName('cd_pessoa').AsString,
               qyBuscarAlunos.FieldByName('nm_pessoa').AsString
            )
         );

      // Aluno não está selecionado no grupo
      end else begin

         // Verifica se o aluno está vinculado a outro grupo
         qyBuscarGrupoAluno.Close;
         qyBuscarGrupoAluno.ParamByName('nr_anosemestre').AsInteger := iAnoSemestre;
         qyBuscarGrupoAluno.ParamByName('cd_curso').AsString := edCurso.Text;
         qyBuscarGrupoAluno.ParamByName('cd_turma').AsString := edTurma.Text;
         qyBuscarGrupoAluno.ParamByName('cd_disciplina').AsInteger := StrToInt(edDisciplina.Text);
         qyBuscarGrupoAluno.ParamByName('cd_pessoa').AsInteger := qyBuscarAlunos.FieldByName('cd_pessoa').AsInteger;
         qyBuscarGrupoAluno.Open;

         // Monta a string com o nome do aluno (caso pertença a outro grupo monta com o nome do outro grupo)
         if Length(qyBuscarGrupoAluno.FieldByName('nm_grupo').AsString) > 0 then
         begin
            sNome := qyBuscarAlunos.FieldByName('nm_pessoa').AsString + ' (' + qyBuscarGrupoAluno.FieldByName('nm_grupo').AsString + ')';
            isAlunoOutroGrupo := true;
         end else begin
            sNome := qyBuscarAlunos.FieldByName('nm_pessoa').AsString;
            isAlunoOutroGrupo := false;
         end;

         // Adiciona o aluno na combo de não selecionados
         clbAlunosTurma.AddItem(
            sNome,
            TItemCombo.Create(
               qyBuscarAlunos.FieldByName('cd_pessoa').AsString,
               sNome,
               isAlunoOutroGrupo   
            )
         );

      end;

      qyBuscarAlunos.Next;
   end;

   // Seleciona o primeiro elemento de cada combo
   if ( clbAlunosTurma.Count > 0 ) then clbAlunosTurma.ItemIndex := 0;
   if ( clbAlunosGrupo.Count > 0 ) then clbAlunosGrupo.ItemIndex := 0;

end;

procedure TfrmCadGruposAtividades.inativaAlunosGrupo(cd_grupo: Integer);
const
   SQL_INATIVA_ALUNOS = 'UPDATE diario_grupos_pessoas SET dt_saida = NOW() WHERE cd_grupo = :cd_grupo';
var
   qyInativaAlunos: TUMZQuery;
begin
   DM.CriarConsulta(qyInativaAlunos);

   qyInativaAlunos.Close;
   qyInativaAlunos.SQL.Text := SQL_INATIVA_ALUNOS;
   qyInativaAlunos.ParamByName('cd_grupo').AsInteger := cd_grupo;
   qyInativaAlunos.ExecSQL;

   slLogAlunos.Add('- Todos os alunos foram inativados, pois o grupo foi inativado');

   FreeAndNil(qyInativaAlunos);
end;

procedure TfrmCadGruposAtividades.edMaxVagasGrupoKeyPress(Sender: TObject;
  var Key: Char);
begin
   if not (Key in['0'..'9',Chr(8)]) then Key:= #0;
end;

procedure TfrmCadGruposAtividades.FormCreate(Sender: TObject);
begin
   iCodGrupo := -1;
   iAnoSemestre := -1;

   slLogAlunos := TStringList.Create;

   // Define qual aba deverá ser exibida por padrão 
   pcCadGrupos.TabIndex := 0;
end;

procedure TfrmCadGruposAtividades.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
   case key of
      VK_F5 : if btSalvar.Enabled then btSalvarClick( nil );
      VK_F6 : if btCancelar.Enabled then btCancelarClick( nil );
   end;
end;

procedure TfrmCadGruposAtividades.FormShow(Sender: TObject);
const
   SQL_SELECIONA_GRUPO = ' SELECT '+
                         '    dg.nm_grupo, '+
                         '    dg.nr_anosemestre, '+
                         '    dg.cd_curso, '+
                         '    dg.cd_turma, '+
                         '    dg.cd_disciplina, '+
                         '    d.descricao ds_disciplina, '+
                         '    dg.cd_professor, '+
                         '    dg.nr_max_alunos, '+
                         '    dg.sn_ativo '+
                         ' FROM '+
                         '    diario_grupos dg '+
                         '    INNER JOIN disciplinas d ON (d.codigo = dg.cd_disciplina AND d.curso = dg.cd_curso) '+
                         ' WHERE '+
                         '    cd_grupo = :cd_grupo';
var
   qySelecionaGrupo: TUMZQuery;
begin
   // Verifica se existe algum grupo selecionado
   if iCodGrupo > 0 then
   begin
      DM.CriarConsulta(qySelecionaGrupo);

      // Busca dados do grupo selecionado
      qySelecionaGrupo.Close;
      qySelecionaGrupo.SQL.Text := SQL_SELECIONA_GRUPO;
      qySelecionaGrupo.ParamByName('cd_grupo').AsInteger := iCodGrupo;
      qySelecionaGrupo.Open;

      // Preenche o formulário com os dados do grupo selecionado
      if qySelecionaGrupo.RecordCount > 0 then
      begin
         edNomeGrupo.Text := qySelecionaGrupo.FieldByName('nm_grupo').AsString;
         iAnoSemestre := qySelecionaGrupo.FieldByName('nr_anosemestre').AsInteger;
         edCurso.Text := qySelecionaGrupo.FieldByName('cd_curso').AsString;
         edTurma.Text := qySelecionaGrupo.FieldByName('cd_turma').AsString;
         edDisciplina.Text := qySelecionaGrupo.FieldByName('cd_disciplina').AsString;
         sDisciplina := qySelecionaGrupo.FieldByName('ds_disciplina').AsString;
         edProfessor.Text := qySelecionaGrupo.FieldByName('cd_professor').AsString;
         edMaxVagasGrupo.Text := qySelecionaGrupo.FieldByName('nr_max_alunos').AsString;
         cbAtivo.ItemIndex := qySelecionaGrupo.FieldByName('sn_ativo').AsInteger;

         // Como no caso é edição não permite a troca de curso/turma/disciplina
         edCurso.Enabled := False;
         sbBuscaCurso.Enabled := False;

         edTurma.Enabled := False;
         sbBuscaTurma.Enabled := False;

         edDisciplina.Enabled := False;
         sbBuscaDisciplina.Enabled := False;

         // Tenta carregar os estudantes do grupo que está sendo editado
         carregarEstudantes();
      end;

      FreeAndNil(qySelecionaGrupo);
   end;
end;

procedure TfrmCadGruposAtividades.gerarLog(cd_grupo_inserido: Integer = -1);
const
   SQL_SELECIONA_GRUPO = 'SELECT nm_grupo, cd_professor, nr_max_alunos, sn_ativo FROM diario_grupos WHERE cd_grupo = :cd_grupo';
var
   chaveLog, msgLog: String;
   qySelecionaGrupo: TUMZQuery;
begin

   // Prepara o StringList que contém o log de alunos
   slLogAlunos.Delimiter := CHR(13);
   slLogAlunos.QuoteChar := ' ';

   if iCodGrupo > 0 then
   begin

      DM.CriarConsulta(qySelecionaGrupo);

      // Busca dados do grupo selecionado
      qySelecionaGrupo.Close;
      qySelecionaGrupo.SQL.Text := SQL_SELECIONA_GRUPO;
      qySelecionaGrupo.ParamByName('cd_grupo').AsInteger := iCodGrupo;
      qySelecionaGrupo.Open;

      // Grava log da inclusão/alteração de grupos de atividades
      chaveLog := IntToStr(iCodGrupo);

      // Cria a mensagem do LOG
      msgLog := '[Cadastros > Grupos de Atividades Práticas > Alterar]' +CHR(13)+
                'Alterado um novo grupo de atividade [cd_grupo="'+ IntToStr(iCodGrupo) +'", nm_grupo="'+ edNomeGrupo.Text +'"]' +CHR(13)+
                'Nome do Grupo: "'+edNomeGrupo.Text +'"'+CHR(13)+
                'Professor: "'+edProfessor.Text +'"'+CHR(13)+
                'Máx. Vagas no Grupo: "'+edMaxVagasGrupo.Text +'"'+CHR(13)+
                'Ativo: "'+IntToStr(cbAtivo.ItemIndex) +'"'+CHR(13)+CHR(13)+
                '[Estudantes]'+CHR(13)+
                slLogAlunos.DelimitedText;

      // Registro o log
      // Operações possíveis = [Acesso, Inclusao, Alteracao, Exclusao, ...] (log_operacoes)
      DM.setLog( 1, 'Alteracao', chaveLog, DM.iColigadaMatriz, msgLog );

      FreeAndNil(qySelecionaGrupo);

   end else begin

      // Grava log da inclusão/alteração de grupos de atividades
      chaveLog := IntToStr(cd_grupo_inserido);

      // Cria a mensagem do LOG
      msgLog := '[Cadastros > Grupos de Atividades Práticas > Incluir]' +CHR(13)+
                'Incluído um novo grupo de atividade [cd_grupo="'+ IntToStr(cd_grupo_inserido) +'" nm_grupo="'+ edNomeGrupo.Text +'"]' +CHR(13)+
                'Anosemestre: "'+IntToStr(iAnoSemestre) +'"'+CHR(13)+
                'Curso: "'+edCurso.Text +'"'+CHR(13)+
                'Turma: "'+edTurma.Text +'"'+CHR(13)+
                'Disciplina: "'+edDisciplina.Text +'"'+CHR(13)+
                'Professor: "'+edProfessor.Text +'"'+CHR(13)+
                'Máx. Vagas no Grupo: "'+edMaxVagasGrupo.Text +'"'+CHR(13)+
                'Ativo: "'+IntToStr(cbAtivo.ItemIndex) +'"'+CHR(13)+CHR(13)+
                '[Estudantes]'+CHR(13)+
                slLogAlunos.DelimitedText;


      // Registro o log
      // Operações possíveis = [Acesso, Inclusao, Alteracao, Exclusao, ...] (log_operacoes)
      DM.setLog( 1, 'Inclusao', chaveLog, DM.iColigadaMatriz, msgLog );

   end;

end;

procedure TfrmCadGruposAtividades.pcCadGruposChange(Sender: TObject);
begin

   // Ao trocar para aba de Relacionar Estudantes o sistema seta as informações do grupo/curso/turma/disciplina
   if pcCadGrupos.ActivePage = tsEstudantes then
   begin
      edRelNomeGrupo.Text := edNomeGrupo.Text;
      edRelCodCurso.Text := edCurso.Text;
      edRelCodTurma.Text := edTurma.Text;
      edRelDescDisciplina.Text := sDisciplina;
   end;
end;

procedure TfrmCadGruposAtividades.pcCadGruposChanging(Sender: TObject;
  var AllowChange: Boolean);
begin
   if (Length(Trim(edCurso.Text)) = 0) or
      (Length(Trim(edTurma.Text)) = 0) or
      (Length(Trim(edDisciplina.Text)) = 0) then
   begin
      AllowChange := False;
      Mensagem('Necessário informar o curso, turma e a disciplina para relacionar alunos ao grupo.', 'Atenção!', MB_ICONWARNING + MB_OK);
   end;   
end;

procedure TfrmCadGruposAtividades.sbBuscaCursoClick(Sender: TObject);
var
   resultado_filtro : TResultadoFiltroCurso;
begin
   { Pesquisar Cursos }
   resultado_filtro := TfrmSelecionarCurso.Filtrar([]);

   if not resultado_filtro.filtrado then Exit;

   edCurso.Text := resultado_filtro.cd_curso;
   iAnoSemestre := resultado_filtro.nr_anosemestre;
   edTurma.Text := '';
   edDisciplina.Text := '';

   // Tenta carregar os estudantes
   carregarEstudantes();
end;

procedure TfrmCadGruposAtividades.sbBuscaDisciplinaClick(Sender: TObject);
var
   resultado_filtro : TResultadoFiltroDisciplina;
begin
   { Pesquisar Disciplina }
   if ( Length(edCurso.Text) = 0 ) then
   begin
      Mensagem('Você precisa selecionar um curso antes de selecionar uma disciplina', 'Atenção!!', MB_OK);
      Exit;
   end;

   if ( Length(edTurma.Text) = 0 ) then
   begin
      Mensagem('Você precisa selecionar uma turma antes de selecionar uma disciplina', 'Atenção!!', MB_OK);
      Exit;
   end;

   resultado_filtro := TfrmSelecionarDisciplina.Filtrar([bfdCurso], edCurso.Text, iAnoSemestre, edTurma.Text);

   if not resultado_filtro.filtrado then Exit;

   edDisciplina.Text  := IntToStr( resultado_filtro.cd_disciplina );
   sDisciplina := resultado_filtro.ds_disciplina;

   // Tenta carregar os estudantes
   carregarEstudantes();   
end;

procedure TfrmCadGruposAtividades.sbBuscaProfessorClick(Sender: TObject);
var
   resultado_filtro : TResultadoFiltroPessoa;
begin
   {Pesquisar Professor}
   resultado_filtro := TfrmSelecionarPessoa.Filtrar([], afpProfessor);

   if not resultado_filtro.filtrado then Exit;

   edProfessor.Text := IntToStr( resultado_filtro.cd_pessoa );
end;

procedure TfrmCadGruposAtividades.sbBuscaTurmaClick(Sender: TObject);
var
   resultado_filtro : TResultadoFiltroTurma;
begin
   { Pesquisar Turmas }
   resultado_filtro := TfrmSelecionarTurma.Filtrar([], iAnoSemestre, -1, -1, edCurso.Text);

   if not resultado_filtro.filtrado then Exit;

   edTurma.Text := resultado_filtro.cd_turma;
   iAnoSemestre := resultado_filtro.nr_anosemestre;
   edCurso.Text := resultado_filtro.cd_curso;
   edDisciplina.Text := '';

   // Tenta carregar os estudantes
   carregarEstudantes();
end;

end.
