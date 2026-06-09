unit uGruposAtividades;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, ComCtrls, StdCtrls, Buttons, ToolWin, ImgList, Grids,
  DBGrids, DB, ZAbstractRODataset, ZAbstractDataset, UZDataset;

type
  TfrmGruposAtividades = class(TForm)
    pnTitulo: TPanel;
    pnGrupos: TPanel;
    pnFiltro: TPanel;
    sbBuscaCurso: TSpeedButton;
    lbCurso: TLabel;
    lbTurma: TLabel;
    lbDisciplina: TLabel;
    lbProfessor: TLabel;
    sbBuscaProfessor: TSpeedButton;
    sbBuscaTurma: TSpeedButton;
    sbBuscaDisciplina: TSpeedButton;
    edCodCurso: TEdit;
    btGruposFiltrar: TBitBtn;
    btLimpar: TBitBtn;
    edDescCurso: TEdit;
    edNomeProfessor: TEdit;
    edDescDisciplina: TEdit;
    edCodTurma: TEdit;
    edCodDisciplina: TEdit;
    lbGrupo: TLabel;
    edCodGrupo: TEdit;
    edNomeGrupo: TEdit;
    sbBuscaGrupo: TSpeedButton;
    lbEstudante: TLabel;
    edCodEstudante: TEdit;
    edNomeEstudante: TEdit;
    sbBuscaEstudante: TSpeedButton;
    lbAtivo: TLabel;
    cbAtivo: TComboBox;
    edCodProfessor: TEdit;
    tbCadGrupos: TToolBar;
    sbOlho: TSpeedButton;
    separador1: TToolButton;
    btIncluirGrupo: TToolButton;
    btAlterarGrupo: TToolButton;
    btExcluirGrupo: TToolButton;
    separador2: TToolButton;
    ilAcoes: TImageList;
    btFecharCadGrupo: TToolButton;
    dbgGrupos: TDBGrid;
    qyGrupos: TUMZQuery;
    dsGrupos: TDataSource;
    qyGruposcd_grupo: TIntegerField;
    qyGruposnm_grupo: TStringField;
    qyGruposcd_curso: TStringField;
    qyGruposcd_turma: TStringField;
    qyGruposnr_alunos_grupo: TStringField;
    qyGrupossn_ativo: TStringField;
    qyGruposnm_professor: TStringField;
    qyVerificaExcluirGrupo: TUMZQuery;
    qyVerificaExcluirGrupoalunos_aulas: TLargeintField;
    qyVerificaExcluirGrupoalunos_provas: TLargeintField;
    qyVerificaExcluirGrupoalunos_atividades: TLargeintField;
    qyGruposnome_alunos: TStringField;
    procedure FormCreate(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure btFecharCadGrupoClick(Sender: TObject);
    procedure btExcluirGrupoClick(Sender: TObject);
    procedure btAlterarGrupoClick(Sender: TObject);
    procedure btIncluirGrupoClick(Sender: TObject);
    procedure sbOlhoClick(Sender: TObject);
    procedure btGruposFiltrarClick(Sender: TObject);
    procedure btLimparClick(Sender: TObject);
    procedure sbBuscaEstudanteClick(Sender: TObject);
    procedure sbBuscaProfessorClick(Sender: TObject);
    procedure sbBuscaDisciplinaClick(Sender: TObject);
    procedure sbBuscaTurmaClick(Sender: TObject);
    procedure sbBuscaCursoClick(Sender: TObject);
    procedure sbBuscaGrupoClick(Sender: TObject);
  private
    { Private declarations }
    iAnoSemestre: Integer;
    procedure Filtrar;
  public
    { Public declarations }
  end;

var
  frmGruposAtividades: TfrmGruposAtividades;

implementation

{$R *.dfm}

uses
   Main, uFSelecionarGrupo, uFSelecionarCurso, uFSelecionarTurma, uFSelecionarDisciplina, uFSelecionarPessoa,
   uCamposPlanilhas, General, uDM, uUsuario, uCadGruposAtividades;

procedure TfrmGruposAtividades.btAlterarGrupoClick(Sender: TObject);
var
   frmCadGruposAtividades: TfrmCadGruposAtividades;
begin
   if not DM.UsuarioLogado.TemPermissao( DM.iCdPessoaLogado, 'Academico.GruposAtividadesPraticas', npAlterar, True ) then Exit;

   if qyGrupos.FieldByName('cd_grupo').AsInteger > 0 then
   begin
      Application.CreateForm(TfrmCadGruposAtividades, frmCadGruposAtividades);

      // Verifica informações de Anosemestre/Curso/Turma/Disciplina/Professor a serem repassadas para o cadastro
      frmCadGruposAtividades.setGrupo(qyGrupos.FieldByName('cd_grupo').AsInteger);

      // Abre o cadastro de novos grupos
      if frmCadGruposAtividades.ShowModal() = mrOk then
      begin
         Filtrar();
      end;

      FreeAndNil(frmCadGruposAtividades);
   end;
end;

procedure TfrmGruposAtividades.btExcluirGrupoClick(Sender: TObject);
const
   SQL_EXCLUIR_ALUNOS_GRUPO = 'DELETE FROM diario_grupos_pessoas WHERE cd_grupo = :cd_grupo';
   SQL_EXCLUIR_GRUPO = 'DELETE FROM diario_grupos WHERE cd_grupo = :cd_grupo';
var
   qyExcluir: TUMZQuery;
   chaveLog, msgLog: String;
begin
   if not DM.UsuarioLogado.TemPermissao( DM.iCdPessoaLogado, 'Academico.GruposAtividadesPraticas', npExcluir, True ) then Exit;

   if qyGrupos.FieldByName('cd_grupo').AsInteger > 0 then
   begin

      DM.CriarConsulta(qyExcluir);

      qyVerificaExcluirGrupo.Close;
      qyVerificaExcluirGrupo.ParamByName('cd_grupo').AsInteger := qyGrupos.FieldByName('cd_grupo').AsInteger;
      qyVerificaExcluirGrupo.Open;

      if qyVerificaExcluirGrupo.FieldByName('qtd_aulas').AsInteger > 0 then
      begin
         Mensagem('Não é possível excluir o grupo, pois existem aulas vinculadas ao mesmo!', 'Atenção', MB_OK);
         Exit;
      end else if qyVerificaExcluirGrupo.FieldByName('qtd_provas').AsInteger > 0 then
      begin
         Mensagem('Não é possível excluir o grupo, pois existem provas vinculadas ao mesmo!', 'Atenção', MB_OK);
         Exit;
      end else if qyVerificaExcluirGrupo.FieldByName('qtd_atividades').AsInteger > 0 then
      begin
         Mensagem('Não é possível excluir o grupo, pois existem atividades vinculadas ao mesmo!', 'Atenção', MB_OK);
         Exit;
      end;

      if Mensagem('Você tem certeza que deseja excluir este grupo e todos alunos vinculados a ele?', 'Atenção', MB_ICONQUESTION + MB_YESNO) = ID_YES then
      begin
         // Grava log da exclusão de grupos de atividades
         chaveLog := qyGrupos.FieldByName('cd_grupo').AsString;

         // Cria a mensagem do LOG
         msgLog := '[Cadastros > Grupos de Atividades Práticas]' +CHR(13)+
                   'Removido o grupo de atividade [cd_grupo="'+ qyGrupos.FieldByName('cd_grupo').AsString +'", nm_grupo="'+ qyGrupos.FieldByName('nm_grupo').AsString +'"]' +CHR(13)+
                   'Alunos que estavam vinculados ao grupo: '+qyGrupos.FieldByName('nome_alunos').AsString;

         // Registro o log
         // Operações possíveis = [Acesso, Inclusao, Alteracao, Exclusao, ...] (log_operacoes)
         DM.setLog( 1, 'Exclusao', chaveLog, DM.iColigadaMatriz, msgLog );
      

         // Primeiro excluir os alunos do grupo
         qyExcluir.Close;
         qyExcluir.SQL.Text := SQL_EXCLUIR_ALUNOS_GRUPO;
         qyExcluir.ParamByName('cd_grupo').AsInteger := qyGrupos.FieldByName('cd_grupo').AsInteger;
         qyExcluir.ExecSQL;

         // Exclui o grupo
         qyExcluir.Close;
         qyExcluir.SQL.Text := SQL_EXCLUIR_GRUPO;
         qyExcluir.ParamByName('cd_grupo').AsInteger := qyGrupos.FieldByName('cd_grupo').AsInteger;
         qyExcluir.ExecSQL;

         Filtrar();
      end;

   end;
end;

procedure TfrmGruposAtividades.btFecharCadGrupoClick(Sender: TObject);
begin
   Close();
end;

procedure TfrmGruposAtividades.btIncluirGrupoClick(Sender: TObject);
var
   frmCadGruposAtividades: TfrmCadGruposAtividades;
begin
   // Verifica permissão
   if not DM.UsuarioLogado.TemPermissao( DM.iCdPessoaLogado, 'Academico.GruposAtividadesPraticas', npIncluir, True ) then Exit;

   Application.CreateForm(TfrmCadGruposAtividades, frmCadGruposAtividades);

   // Verifica informações de Anosemestre/Curso/Turma/Disciplina/Professor a serem repassadas para o cadastro
   if iAnoSemestre > 0 then
   begin
      frmCadGruposAtividades.setAnoSemestre(iAnoSemestre);
   end;

   if Length(Trim(edCodCurso.Text)) > 0 then
   begin
      frmCadGruposAtividades.setCurso(edCodCurso.Text);
   end;

   if (Length(Trim(edCodCurso.Text)) > 0) and
      (Length(Trim(edCodTurma.Text)) > 0) then
   begin
      frmCadGruposAtividades.setTurma(edCodTurma.Text);
   end;

   if (Length(Trim(edCodCurso.Text)) > 0) and
      (Length(Trim(edCodTurma.Text)) > 0) and
      (Length(Trim(edCodDisciplina.Text)) > 0) then
   begin
      frmCadGruposAtividades.setDisciplina(edCodDisciplina.Text);
      frmCadGruposAtividades.setDisciplinaDesc(edDescDisciplina.Text);
   end;

   if Length(Trim(edCodProfessor.Text)) > 0 then
   begin
      frmCadGruposAtividades.setProfessor(edCodProfessor.Text);
   end;

   // Tenta carregar os estudantes
   frmCadGruposAtividades.carregarEstudantes();

   // Abre o cadastro de novos grupos
   if frmCadGruposAtividades.ShowModal() = mrOk then
   begin
      Filtrar();
   end;
   FreeAndNil(frmCadGruposAtividades);
end;

procedure TfrmGruposAtividades.Filtrar();
var
   sSQLFiltro: String;
begin
   qyGrupos.Close;

   qyGrupos.SQL.Text := ' SELECT '+
	                     '   dg.cd_grupo, '+
                        '   dg.nm_grupo, '+
                        '   dg.cd_curso, '+
                        '   dg.cd_turma, '+
                        '   prof.nm_pessoa nm_professor, '+
                        '   (SELECT CONCAT(COALESCE(SUM(CASE WHEN dgpc.cd_pessoa IS NOT NULL AND dgpc.dt_saida IS NULL THEN 1 ELSE 0 END), "0"),"/",dg.nr_max_alunos) FROM diario_grupos_pessoas dgpc WHERE  dgpc.dt_saida IS NULL AND dgpc.cd_grupo = dg.cd_grupo) nr_alunos_grupo, '+
                        '   CASE WHEN dg.sn_ativo = 1 THEN "Sim" ELSE "Não" END sn_ativo, '+
                        '   LEFT((SELECT GROUP_CONCAT(alu.nm_pessoa SEPARATOR ", ") FROM diario_grupos_pessoas dgpc INNER JOIN pessoas alu ON (dgpc.cd_pessoa = alu.cd_pessoa AND dgpc.dt_saida IS NULL) WHERE dgpc.cd_grupo = dg.cd_grupo), 255) nome_alunos '+
                        ' FROM '+    
                        '   diario_grupos dg '+
                        '   INNER JOIN pessoas prof ON (prof.cd_pessoa = dg.cd_professor) '+
                        '   LEFT JOIN diario_grupos_pessoas dgp ON (dgp.cd_grupo = dg.cd_grupo AND dgp.dt_saida IS NULL) '+
                        '   LEFT JOIN pessoas alu ON (alu.cd_pessoa = dgp.cd_pessoa) '+
                        ' WHERE ';

   { Adiciona os filtros dos campos }
   if Length(Trim(edCodGrupo.Text)) > 0 then
   begin
      qyGrupos.SQL.Add('    dg.cd_grupo = '+QuotedStr(edCodGrupo.Text)+' AND ');
   end;

   if iAnoSemestre > 0 then
   begin
      qyGrupos.SQL.Add('    dg.nr_anosemestre = '+IntToStr(iAnoSemestre)+' AND ');
   end;

   if Length(Trim(edCodCurso.Text)) > 0 then
   begin
      qyGrupos.SQL.Add('    dg.cd_curso LIKE '+QuotedStr(edCodCurso.Text)+' AND ');
   end;

   if Length(Trim(edCodTurma.Text)) > 0 then
   begin
      qyGrupos.SQL.Add('    dg.cd_turma LIKE '+QuotedStr(edCodTurma.Text)+' AND ');
   end;

   if Length(Trim(edCodDisciplina.Text)) > 0 then
   begin
      qyGrupos.SQL.Add('    dg.cd_disciplina = '+edCodDisciplina.Text+' AND ');
   end;

   if Length(Trim(edCodProfessor.Text)) > 0 then
   begin
      qyGrupos.SQL.Add('    dg.cd_professor = '+edCodProfessor.Text+' AND ');
   end;

   if Length(Trim(edCodEstudante.Text)) > 0 then
   begin
      qyGrupos.SQL.Add('    dgp.cd_pessoa = '+edCodEstudante.Text+' AND ');
   end;

   if cbAtivo.ItemIndex = 2 then
   begin
      qyGrupos.SQL.Add('    dg.sn_ativo IN (0, 1)');
   end else begin
      qyGrupos.SQL.Add('    dg.sn_ativo = '+IntToStr(cbAtivo.ItemIndex));
   end;

   qyGrupos.SQL.Add(' GROUP BY ');
   qyGrupos.SQL.Add('   dg.cd_grupo ');

   qyGrupos.Open;
end;

procedure TfrmGruposAtividades.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
   Action := caFree;
end;

procedure TfrmGruposAtividades.FormCreate(Sender: TObject);
begin
   DM.MontarPlanilha(dbgGrupos, 'planilha_cad_grupos');
end;

procedure TfrmGruposAtividades.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
   case key of
      VK_F1 : PrincipalForm.confSobreClick( nil );
      VK_F2 : if btIncluirGrupo.Enabled then btIncluirGrupoClick( nil );
      VK_F3 : if btAlterarGrupo.Enabled then btAlterarGrupoClick( nil );
      VK_F9 : if btExcluirGrupo.Enabled then btExcluirGrupoClick( nil );
      VK_F12 : if btFecharCadGrupo.Enabled then btFecharCadGrupoClick( nil );
   end;
end;

procedure TfrmGruposAtividades.FormShow(Sender: TObject);
begin
   Filtrar();
end;

procedure TfrmGruposAtividades.btGruposFiltrarClick(Sender: TObject);
begin
   Filtrar();
end;

procedure TfrmGruposAtividades.btLimparClick(Sender: TObject);
begin
   iAnoSemestre := 0;

   edCodGrupo.Text  := '';
   edNomeGrupo.Text := '';

   edCodCurso.Text  := '';
   edDescCurso.Text := '';

   edCodTurma.Text := '';

   edCodDisciplina.Text  := '';
   edDescDisciplina.Text := '';

   edCodProfessor.Text  := '';
   edNomeProfessor.Text := '';

   edCodEstudante.Text  := '';
   edNomeEstudante.Text := '';

   cbAtivo.ItemIndex  := 2;

   Filtrar();
end;

procedure TfrmGruposAtividades.sbBuscaCursoClick(Sender: TObject);
var
   resultado_filtro : TResultadoFiltroCurso;
begin
   { Pesquisar Cursos }
   resultado_filtro := TfrmSelecionarCurso.Filtrar([]);

   if not resultado_filtro.filtrado then Exit;

   edCodCurso.Text  := resultado_filtro.cd_curso;
   edDescCurso.Text := resultado_filtro.ds_curso;
   iAnoSemestre     := resultado_filtro.nr_anosemestre;

   Filtrar();
end;

procedure TfrmGruposAtividades.sbBuscaDisciplinaClick(Sender: TObject);
var
   resultado_filtro : TResultadoFiltroDisciplina;
begin
   { Pesquisar Disciplina }
   if ( Length(edCodCurso.Text) = 0 ) then
   begin
      Mensagem('Você precisa selecionar um curso antes de selecionar uma disciplina', 'Atenção!!', MB_OK);
      Exit;
   end;

   resultado_filtro := TfrmSelecionarDisciplina.Filtrar([bfdCurso], edCodCurso.Text, iAnoSemestre);

   if not resultado_filtro.filtrado then Exit;

   edCodDisciplina.Text  := IntToStr( resultado_filtro.cd_disciplina );
   edDescDisciplina.Text := resultado_filtro.ds_disciplina;

   Filtrar();   
end;

procedure TfrmGruposAtividades.sbBuscaEstudanteClick(Sender: TObject);
var
   resultado_filtro : TResultadoFiltroPessoa;
begin
   {Pesquisar Estudante}
   resultado_filtro := TfrmSelecionarPessoa.Filtrar([], afpEstudante);

   if not resultado_filtro.filtrado then Exit;

   edCodEstudante.Text  := IntToStr( resultado_filtro.cd_pessoa );
   edNomeEstudante.Text := resultado_filtro.nm_pessoa;

   Filtrar();   
end;

procedure TfrmGruposAtividades.sbBuscaGrupoClick(Sender: TObject);
var
   resultado_filtro : TResultadoFiltroGrupo;
begin
   { Pesquisar Grupo }
   resultado_filtro := TfrmSelecionarGrupo.Filtrar([]);

   if not resultado_filtro.filtrado then Exit;

   edCodGrupo.Text  := IntToStr(resultado_filtro.cd_grupo);
   edNomeGrupo.Text := resultado_filtro.nm_grupo;

   Filtrar();
end;

procedure TfrmGruposAtividades.sbBuscaProfessorClick(Sender: TObject);
var
   resultado_filtro : TResultadoFiltroPessoa;
begin
   {Pesquisar Professor}
   resultado_filtro := TfrmSelecionarPessoa.Filtrar([], afpProfessor);

   if not resultado_filtro.filtrado then Exit;

   edCodProfessor.Text  := IntToStr( resultado_filtro.cd_pessoa );
   edNomeProfessor.Text := resultado_filtro.nm_pessoa;

   Filtrar();   
end;

procedure TfrmGruposAtividades.sbBuscaTurmaClick(Sender: TObject);
var
   resultado_filtro : TResultadoFiltroTurma;
begin
   { Pesquisar Turmas }
   resultado_filtro := TfrmSelecionarTurma.Filtrar([], iAnoSemestre, -1, -1, edCodCurso.Text);

   if not resultado_filtro.filtrado then Exit;

   edCodTurma.Text  := resultado_filtro.cd_turma;
   iAnoSemestre     := resultado_filtro.nr_anosemestre;
   
   edCodCurso.Text  := resultado_filtro.cd_curso;
   edDescCurso.Text := resultado_filtro.ds_curso;

   Filtrar();   
end;

procedure TfrmGruposAtividades.sbOlhoClick(Sender: TObject);
begin
   Application.CreateForm(TfrmSelColunas, frmSelColunas);

   frmSelColunas.SelecionaColunas(dbgGrupos, 'planilha_cad_grupos');
end;

end.
