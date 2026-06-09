unit uIncluirTurmasDisciplinasMoodle;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, uDM, StdCtrls, Buttons, ExtCtrls, DB, ZAbstractRODataset, UZDataset,
  ZAbstractDataset, ComCtrls, Mask, Grids, DBGrids, ZSqlUpdate, General;

type
  TfrmIncluirTurmasDisciplinaMoodle = class(TForm)
    Panel1: TPanel;
    Panel2: TPanel;
    gridTurmasDiscInserir: TDBGrid;
    Panel3: TPanel;
    btnIncluir: TBitBtn;
    btnFechar: TBitBtn;
    qyFiltrar: TUMZQuery;
    dtcFiltrar: TDataSource;
    qyFiltraranosemestre: TIntegerField;
    qyFiltrarcurso: TStringField;
    qyFiltrarcd_turma: TStringField;
    qyFiltrardisciplina: TStringField;
    qyFiltrarid_disciplina: TLargeintField;
    GroupBox1: TGroupBox;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    btnFiltroDisciplina: TSpeedButton;
    btnFiltroTurma: TSpeedButton;
    btnFiltroCurso: TSpeedButton;
    txtCurso: TEdit;
    txtDisciplina: TEdit;
    txtTurma: TEdit;
    btnFiltrarTurmasDiscMoodle: TBitBtn;
    btnLimparFiltros: TBitBtn;
    txtAnoSemestreFiltro: TMaskEdit;
    UpDown2: TUpDown;
    qyFiltrarcd_curso: TStringField;
    procedure btnIncluirClick(Sender: TObject);
    procedure btnFiltrarTurmasDiscMoodleClick(Sender: TObject);
    procedure btnFecharClick(Sender: TObject);
    procedure btnFiltroTurmaClick(Sender: TObject);
    procedure btnLimparFiltrosClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure btnFiltroCursoClick(Sender: TObject);
    procedure UpDown2Click(Sender: TObject; Button: TUDBtnType);
    procedure btnFiltroDisciplinaClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmIncluirTurmasDisciplinaMoodle: TfrmIncluirTurmasDisciplinaMoodle;

implementation

uses
   uFSelecionarCurso, uFSelecionarTurma, uFSelecionarDisciplina, uCursosMoodle,
   ZDbcIntfs;

{$R *.dfm}

procedure TfrmIncluirTurmasDisciplinaMoodle.btnFecharClick(Sender: TObject);
begin
   ModalResult := mrOK;
   Close();
end;

procedure TfrmIncluirTurmasDisciplinaMoodle.btnFiltrarTurmasDiscMoodleClick(
  Sender: TObject);
var
   filtro_anosemestre, filtro_curso,filtro_turma, filtro_disciplina,
   filtro_etapa , sAux : String;
begin
   filtro_anosemestre := txtAnoSemestreFiltro.Text;
   filtro_disciplina  := txtDisciplina.Text;
   filtro_curso       := txtCurso.Text;
   filtro_turma       := txtTurma.Text;

   with qyFiltrar do
   Begin
      Close();
      SQL.Clear();

      SQL.Add(''                                                  +
      'SELECT '                                                   +
      '	t.anosemestre anosemestre, '                             +
      '	cm.ds_curso curso, '                                     +
      '  t.codigo turma, '                                        +
      '  d.descricao disciplina, '                                +
      '  d.id_disciplina id_disciplina, '                         +
      '	t.serie etapa, '                                         +
      '	cm.cd_curso cd_curso '                                   +
      ' FROM '                                                    +
      '  disciplinas d '                                          +
      ' INNER JOIN grades_disciplinas g ON ('                     +
      ' g.CD_DISCIPLINA = d.codigo AND g.CD_CURSO = d.curso ) '   +
      ' INNER JOIN turmas t ON ( '                                +
      '      t.cd_grade = g.cd_grade AND '                        +
      '      t.curso = g.cd_curso AND  '                          +
      '      t.serie = g.nr_serie ) '                             +
      ' INNER JOIN coligadas c on ( '                             +
      '      t.cd_coligada = c.cd_coligada ) '                    +
      ' LEFT JOIN cursos_mestre cm ON (d.curso = cm.cd_curso) ');

       sAux := ' WHERE ';

      if (Trim(filtro_anosemestre) <> '') then
      begin
        SQL.Add(sAux);
        SQL.Add(' t.anosemestre = ' + filtro_anosemestre);
        sAux := ' AND ';
      end;

      if (Trim(filtro_disciplina) <> '') then
      begin
        SQL.Add(sAux);
        SQL.Add(' d.descricao LIKE  "%' + filtro_disciplina + '%" ');
        sAux := ' AND ';
      end;

      if (Trim(filtro_curso) <> '') then
      begin
        SQL.Add(sAux);
        SQL.Add(' cm.cd_curso LIKE "%' + filtro_curso +'%" ');
        sAux := ' AND ';
      end;

      if (Trim(filtro_turma) <> '') then
      begin
        SQL.Add(sAux);
        SQL.Add(' t.descricao  LIKE "%' + filtro_turma +'%" ');
        sAux := ' AND ';
      end;

      if (Trim(filtro_etapa) <> '') then
      begin
        SQL.Add(sAux);
        SQL.Add(' t.serie LIKE "%' + filtro_etapa +'%" ');
        sAux := ' AND ';
      end;

      if (Trim(sAux) <> 'WHERE') then
      begin
        SQL.Add(sAux);
        SQL.Add('1 = 1');
      end;
      Open();
   End;
end;

procedure TfrmIncluirTurmasDisciplinaMoodle.btnFiltroCursoClick(
  Sender: TObject);
var
   resultado_filtro : TResultadoFiltroCurso;
begin
   // Pesquisar Cursos
   resultado_filtro := TfrmSelecionarCurso.Filtrar(
      [],
      -1,
      -1,
      StrToInt(txtAnoSemestreFiltro.text)
   );
   
   txtCurso.Text := resultado_filtro.cd_curso;
   if resultado_filtro.nr_anosemestre <> -1 then
   begin
     txtAnoSemestreFiltro.Text := IntToStr(resultado_filtro.nr_anosemestre);
   end
   else
   begin
      txtAnoSemestreFiltro.Text := txtAnoSemestreFiltro.Text;
   end;
   btnFiltroTurma.Down := false;
end;

procedure TfrmIncluirTurmasDisciplinaMoodle.btnFiltroDisciplinaClick(
  Sender: TObject);
var
   resultado_filtro : TResultadoFiltroDisciplina;
begin
   { Pesquisar Disciplina }

   resultado_filtro := TfrmSelecionarDisciplina.Filtrar(
      [],
      txtCurso.Text,
      StrToInt(txtAnoSemestreFiltro.Text)
   );
   
   txtDisciplina.Text := resultado_filtro.ds_disciplina;
   if resultado_filtro.nr_anosemestre <> -1 then
   begin
     txtAnoSemestreFiltro.Text := IntToStr(resultado_filtro.nr_anosemestre);
   end
   else
   begin
      txtAnoSemestreFiltro.Text := txtAnoSemestreFiltro.Text;
   end;
   btnFiltroTurma.Down := false;
end;

procedure TfrmIncluirTurmasDisciplinaMoodle.btnFiltroTurmaClick(
  Sender: TObject);
var
   resultado_filtro : TResultadoFiltroTurma;
begin
   { Pesquisar Turmas }
   resultado_filtro := TfrmSelecionarTurma.Filtrar(
      [],
      StrToInt(txtAnoSemestreFiltro.text),
      -1,
      -1,
      txtCurso.Text
   );
   
   txtTurma.Text := resultado_filtro.ds_turma;
   if resultado_filtro.nr_anosemestre <> -1 then
   begin
     txtAnoSemestreFiltro.Text := IntToStr(resultado_filtro.nr_anosemestre);
   end
   else
   begin
      txtAnoSemestreFiltro.Text := txtAnoSemestreFiltro.Text;
   end;
   btnFiltroTurma.Down := false;
end;

procedure TfrmIncluirTurmasDisciplinaMoodle.btnIncluirClick(Sender: TObject);
const
   S_SQL_INSERT = 'INSERT INTO unim_moodle_cursos_disciplinas (cd_moodle_curso, nr_anosemestre, cd_curso, cd_turma, id_disciplina) VALUES (?, ?, ?, ?, ?)';
   S_LOG = '{"cd_moodle_curso": "%d", "nr_anosemestre": "%d", "cd_turma": "%s", "cd_curso": "%s", "id_disciplina": "%d"}';
   S_LOG_OPERACAO = 'Inclusão';
   S_LOG_CHAVE = 'Incluir vínculo de turmas e disciplinas - Moodle';
var
   Stmt: IZPreparedStatement;
   S: AnsiString;
   I: Integer;
   sn_encontrou : Boolean;
   sn_disciplina_inclusa : Boolean;
begin
   sn_encontrou := False;
   sn_disciplina_inclusa := False;
   if gridTurmasDiscInserir.SelectedRows.Count > 0 then
   begin
         Stmt := DM.db.DbcConnection.PrepareStatement(S_SQL_INSERT);
      try
         for I := 0 to gridTurmasDiscInserir.SelectedRows.Count - 1 do
         begin
            gridTurmasDiscInserir.DataSource.DataSet.GotoBookmark(
               Pointer(gridTurmasDiscInserir.SelectedRows.Items[I]));

            // Verifica se a turma/disciplina já está cadastrada para o
            // anosemestre e curso percorrido
            sn_encontrou :=
               frmCursosMoodle.qyMoodleTurmasDisc.Locate(
                  'nr_anosemestre;cd_curso;cd_turma;id_disciplina',
                  VarArrayOf([
                     qyFiltraranosemestre.AsInteger,
                     qyFiltrarcd_curso.AsString,
                     qyFiltrarcd_turma.AsString,
                     qyFiltrarid_disciplina.AsInteger
                  ]),
                  [loCaseInsensitive, loPartialKey]
               );

            // Se esta turma/disciplina Já existe na tabela no anosemestre e
            // curso informado, não registrar novamente
            if ( sn_encontrou ) then begin
               continue;
            end;

            sn_disciplina_inclusa := True;

            Stmt.SetInt(1, frmCursosMoodle.qyMoodleCursosCD_MOODLE_CURSO.AsInteger);
            Stmt.SetInt(2, qyFiltraranosemestre.AsInteger);
            Stmt.SetString(3, qyFiltrarcd_curso.AsString);
            Stmt.SetString(4, qyFiltrarcd_turma.AsString);
            Stmt.SetInt(5, qyFiltrarid_disciplina.AsInteger);
            Stmt.ExecutePrepared;

            S := Format(S_LOG, [
               frmCursosMoodle.qyMoodleCursosCD_MOODLE_CURSO.AsInteger,
               qyFiltraranosemestre.AsInteger,
               qyFiltrarcd_turma.AsString,
               qyFiltrarcurso.AsString,
               qyFiltrarid_disciplina.AsInteger]);

            DM.setLog(00000, S_LOG_OPERACAO, S_LOG_CHAVE, 0, S);
         end;
      finally
         Stmt.Close;
         frmCursosMoodle.qyMoodleTurmasDisc.Close();
         frmCursosMoodle.qyMoodleTurmasDisc.Open();
      end;      
   end;

   // FeedBack para o usuário
   if ( sn_disciplina_inclusa ) then begin
      Mensagem(
         'Disciplina(s) adicionadas com sucesso!',
         'Aviso',
         MB_OK + MB_ICONINFORMATION
      );
   end else begin
      Mensagem(
         'Disciplina(s) já estão incluídas!',
         'Aviso',
         MB_OK + MB_ICONINFORMATION
      );
   end;
end;

procedure TfrmIncluirTurmasDisciplinaMoodle.btnLimparFiltrosClick(
  Sender: TObject);
begin
   txtCurso.Clear;
   txtDisciplina.Clear;
   txtTurma.Clear;
end;

procedure TfrmIncluirTurmasDisciplinaMoodle.FormShow(Sender: TObject);
begin
   txtAnoSemestreFiltro.Text :=  IntToStr(DM.GetAnoSemestreAtual);
   txtCurso.Clear;
   txtDisciplina.Clear;
   txtTurma.Clear;
   qyFiltrar.Close();
end;

procedure TfrmIncluirTurmasDisciplinaMoodle.UpDown2Click(Sender: TObject;
  Button: TUDBtnType);
begin
 if Button = btNext then
  begin
     txtAnoSemestreFiltro.text := DM.incrementar_ano_semestre(txtAnoSemestreFiltro.Text);
  end
  else
  begin
    txtAnoSemestreFiltro.text := DM.decrementar_ano_semestre(txtAnoSemestreFiltro.Text);
  end;
end;

end.
