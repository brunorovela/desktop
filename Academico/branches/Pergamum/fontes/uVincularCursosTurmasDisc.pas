unit uVincularCursosTurmasDisc;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Grids, DBGrids, ExtCtrls, ImgList, ComCtrls, ToolWin, DB, DBTables,
  ZAbstractRODataset, ZDataset, UZDataset, ZAbstractDataset;

type
  Tf_vincular_cursos_turmas_disc = class(TForm)
    Panel3: TPanel;
    gridVinculados: TDBGrid;
    toolPessoa: TToolBar;
    btnAddTurma: TToolButton;
    btnAddCurso: TToolButton;
    btnFechar: TToolButton;
    ImageList1: TImageList;
    btnAddDisciplina: TToolButton;
    ToolButton1: TToolButton;
    ToolButton2: TToolButton;
    ToolButton3: TToolButton;
    dsPrazosTurmas: TDataSource;
    qyPrazosTurmas: TUMZReadOnlyQuery;
    qyPrazosTurmasNR_ANOSEMESTRE: TIntegerField;
    qyPrazosTurmasCD_CURSO: TStringField;
    qyPrazosTurmasCD_TURMA: TStringField;
    qyPrazosTurmasNM_PRAZO: TStringField;
    qyPrazosTurmasDS_TIPO_PRAZO: TStringField;
    qyVerificaVincularCurso: TUMZReadOnlyQuery;
    qyVincularCurso: TUMZQuery;
    qyVerificaVincularTurma: TUMZReadOnlyQuery;
    qyVincularTurma: TUMZQuery;
    qyVerificaVincularDisciplina: TUMZReadOnlyQuery;
    qyVincularDisciplina: TUMZQuery;
    qyDeletarVinculo: TUMZQuery;
    qyPrazosTurmasDS_DISCIPLINA: TStringField;
    qyPrazosTurmasCD_TIPO_PRAZO: TIntegerField;
    qyPrazosTurmasCD_PRAZO: TIntegerField;
    qyPrazosTurmasCD_DISCIPLINA: TIntegerField;
    Panel7: TPanel;
    ToolButton4: TToolButton;
    btnAddDepartamento: TToolButton;
    qyVerificaDepartamentos: TUMZQuery;
    qyVerificaDepartamentosCD_CURSO: TStringField;
    procedure btnAddDepartamentoClick(Sender: TObject);
    procedure ToolButton4Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure ToolButton2Click(Sender: TObject);
    procedure btnFecharClick(Sender: TObject);
    procedure btnAddDisciplinaClick(Sender: TObject);
    procedure btnAddTurmaClick(Sender: TObject);
    procedure btnAddCursoClick(Sender: TObject);
    procedure Filtrar(CdPrazo : Integer);
  private
    { Private declarations }

    procedure VincularCurso(CdCurso : String; CdAnoSemestre : Integer; CdDepto: Integer = 0);
    procedure VincularTurma(CdTurma : String; CdCurso : String; CdAnoSemestre : Integer);
    procedure VincularDisciplina(CdDisciplina : Integer; CdTurma : String; CdAnoSemestre : Integer);
    procedure VincularDepartamento(CdDepto : String; NrAnosem: Integer);
  public
    { Public declarations }
  end;

var
  f_vincular_cursos_turmas_disc: Tf_vincular_cursos_turmas_disc;

implementation

{$R *.dfm}

uses uDM, uDiario_Prazos_Novo, uFSelecionarTurma, uFSelecionarCurso, uFSelecionarDisciplina, General, uFSelecionarDepartamento;

procedure Tf_vincular_cursos_turmas_disc.btnAddCursoClick(Sender: TObject);
var
   resultado_filtro : TResultadoFiltroCurso;
begin
   // Adicionar todas as disciplinas do cursos que será selecionado

   // Realize o filtro de curso com o anosemestre bloqueado
   resultado_filtro := TfrmSelecionarCurso.Filtrar([bfcAnosemestre], -1, -1, StrToInt(fDiario_Prazos_Novo.txtAnoSemestre.Text));

   if resultado_filtro.filtrado then
   begin
      VincularCurso(resultado_filtro.cd_curso, resultado_filtro.nr_anosemestre);
   end;
end;

procedure Tf_vincular_cursos_turmas_disc.btnAddTurmaClick(Sender: TObject);
var
   resultado_filtro_turma : TResultadoFiltroTurma;
begin
   // Seta como ano/semestre dos cursos o ano/semestre da regra de prazo que está cadastrado
   resultado_filtro_turma := TfrmSelecionarTurma.Filtrar([bftAnosemestre], StrToInt(fDiario_Prazos_Novo.txtAnoSemestre.Text));

   if resultado_filtro_turma.filtrado then
   begin
      VincularTurma(resultado_filtro_turma.cd_turma, resultado_filtro_turma.cd_curso,
                    resultado_filtro_turma.nr_anosemestre);
   end;
end;

procedure Tf_vincular_cursos_turmas_disc.btnFecharClick(Sender: TObject);
begin
   qyVincularCurso.Close;
   qyVincularTurma.Close;
   qyVincularDisciplina.Close;
   qyPrazosTurmas.Close;
   Close;
end;

procedure Tf_vincular_cursos_turmas_disc.btnAddDisciplinaClick(Sender: TObject);
var
   resultado_filtro_curso : TResultadoFiltroCurso;
   resultado_filtro_disciplina : TResultadoFiltroDisciplina;
begin
   // Adicionar a disciplina que será selecionada

   // Seta como ano/semestre dos cursos o ano/semestre da regra de prazo que está cadastrado
   resultado_filtro_curso := TfrmSelecionarCurso.Filtrar([], -1, -1, StrToInt(fDiario_Prazos_Novo.txtAnoSemestre.Text));

   if not resultado_filtro_curso.filtrado then Exit;

   resultado_filtro_disciplina := TfrmSelecionarDisciplina.Filtrar([bfdMostraTurma], resultado_filtro_curso.cd_curso, resultado_filtro_curso.nr_anosemestre);

   if not resultado_filtro_disciplina.filtrado then Exit;

   { Se ele Filtrou os dois campos, Vinculamos a disciplina }
   VincularDisciplina(resultado_filtro_disciplina.cd_disciplina,
                      resultado_filtro_disciplina.cd_turma,
                      resultado_filtro_curso.nr_anosemestre );
end;

procedure Tf_vincular_cursos_turmas_disc.Filtrar(CdPrazo : Integer);
begin
   qyPrazosTurmas.Close;
   qyPrazosTurmas.ParamByName('cd_prazo').AsInteger := CdPrazo;
   qyPrazosTurmas.Open;
end;

procedure Tf_vincular_cursos_turmas_disc.FormShow(Sender: TObject);
var
   CdPrazo : Integer;
begin
   // Filtra os cursos/turmas/disciplinas pelos selecionados na tela anterior
   CdPrazo := fDiario_Prazos_Novo.qyPrazos.FieldByName('CD_PRAZO').AsInteger;
   Filtrar(CdPrazo);
end;

procedure Tf_vincular_cursos_turmas_disc.ToolButton2Click(Sender: TObject);
var
   i, CdPrazo : Integer;
begin
  CdPrazo := fDiario_Prazos_Novo.qyPrazos.FieldByName('CD_PRAZO').AsInteger;

  // Seleciona automaticamente o primeiro registro da Grid
  gridVinculados.SelectedRows.CurrentRowSelected := True;

  for i := gridVinculados.SelectedRows.Count - 1 downto 0 do
  begin
     qyPrazosTurmas.GotoBookmark(pointer(gridVinculados.SelectedRows.Items[I]));
     qyDeletarVinculo.ParamByName('nr_anosemestre').AsInteger := qyPrazosTurmas.FieldByName('nr_anosemestre').AsInteger;
     qyDeletarVinculo.ParamByName('cd_curso').AsString := qyPrazosTurmas.FieldByName('cd_curso').AsString;
     qyDeletarVinculo.ParamByName('cd_turma').AsString := qyPrazosTurmas.FieldByName('cd_turma').AsString;
     qyDeletarVinculo.ParamByName('cd_disciplina').AsInteger := qyPrazosTurmas.FieldByName('cd_disciplina').AsInteger;
     qyDeletarVinculo.ParamByName('cd_tipo_prazo').AsInteger := qyPrazosTurmas.FieldByName('cd_tipo_prazo').AsInteger;
     qyDeletarVinculo.ExecSQL;
  end;

  qyDeletarVinculo.Close;

  Filtrar(CdPrazo);

end;

procedure Tf_vincular_cursos_turmas_disc.ToolButton4Click(Sender: TObject);
begin
   //Limpa linhas selecinadas da grid de vinculados
   gridVinculados.SelectedRows.Clear;

   //Utilizada o "DataSet" (conjunto de dados da grid)
   with gridVinculados.DataSource.DataSet do
   begin
     //Desativa os controles
     DisableControls;
     //Seleciona o primeiro registro
     First;
     try
       //Enquanto tiver registros
       while not EOF do
       begin
         //Seleciona o registro atual (que está varrendo)
         gridVinculados.SelectedRows.CurrentRowSelected := true;
         //Passa para o próximo
         Next;
       end;
     finally
       //Ativa os controles
       EnableControls;
     end;
   end;
end;

procedure Tf_vincular_cursos_turmas_disc.btnAddDepartamentoClick(Sender: TObject);
var
   resultado_filtro : TResultadoFiltroDepartamento;
begin
   // Adicionar todos os cursos ao departamento selcionado

   // Seta como ano/semestre dos departamentos o ano/semestre da regra de prazo que está cadastrado
   resultado_filtro := TfrmSelecionarDepartamento.Filtrar([]);

   if resultado_filtro.filtrado then
   begin
      if MessageDlg('Você está prestes a vincular todos os cursos, turmas e disciplinas do departamento '+IntToStr(resultado_filtro.cd_departamento)+' a este prazo. Tem certeza que deseja continuar?',mtConfirmation, [mbYes, mbNo], 0, mbNo) = mrYes then
         VincularDepartamento(IntToStr(resultado_filtro.cd_departamento),
            StrToInt(fDiario_Prazos_Novo.txtAnoSemestre.Text));
   end;

end;

procedure Tf_vincular_cursos_turmas_disc.VincularCurso(CdCurso: String; CdAnoSemestre: Integer; CdDepto: Integer = 0);
var
   CdPrazo, CdTipoPrazo : Integer;
   sIgnorar: String;
const
   sSqlVincularCursotemp =
   'INSERT INTO dia_prazos_turmas                                                                              '+
   '  (nr_anosemestre, cd_curso, cd_turma, cd_disciplina, cd_tipo_prazo, cd_prazo)                             '+
   '  SELECT DISTINCT                                                                                          '+
	'     t.anosemestre nr_anosemestre,                                                                         '+
	'     d.curso cd_curso,                                                                                     '+
	'     t.codigo cd_turma,                                                                                    '+
	'     d.codigo cd_disciplina,                                                                               '+
   '     :cd_tipo_prazo cd_tipo_prazo,                                                                         '+
   '     :cd_prazo cd_prazo                                                                                    '+
   'FROM                                                                                                       '+
	'  turmas t                                                                                                 '+
	'  INNER JOIN grades_disciplinas gd ON (                                                                    '+
   '  gd.CD_GRADE = t.cd_grade AND gd.CD_CURSO = t.curso AND gd.NR_SERIE = t.serie                             '+
   '  )                                                                                                        '+
	'  INNER JOIN disciplinas d ON (d.codigo = gd.CD_DISCIPLINA AND d.curso = gd.CD_CURSO)                      '+
   '  INNER JOIN cursos_coligadas cc ON (t.cd_coligada = cc.CD_COLIGADA AND t.curso = cc.CD_CURSO)             '+
   'WHERE                                                                                                      '+
	'  t.curso LIKE :cd_curso AND                                                                               '+
	'  t.anosemestre = :nr_anosemestre                                                                          ';
begin
   //Verifica se está inserindo novo prazo ou se está alterando prazo existente
   if fDiario_Prazos_Novo.qyPrazos.State = dsInsert then
   begin
      //Insere o prazo caso ainda não tenha sido inserido
      fDiario_Prazos_Novo.InserirPrazo();

      //Seleciona o ultimo código do prazo inserido
      CdPrazo := DM.LastInsert;
   end else begin
      //Insere o prazo caso ainda não tenha sido inserido
      CdPrazo := fDiario_Prazos_Novo.qyPrazos.FieldByName('CD_PRAZO').AsInteger;
   end;
   CdTipoPrazo := fDiario_Prazos_Novo.qyPrazos.FieldByName('CD_TIPO_PRAZO').AsInteger;

   // Se vier um departamento
   if CdDepto > 0 then
   begin
      qyVincularCurso.SQL.Text:= sSqlVincularCursotemp;
      // adiciona filtro, com base no sql original
      qyVincularCurso.SQL.add(' AND cc.CD_DEPTO = '+IntToStr(CdDepto));
   end;

   //Insere os dados (cursos/turmas/disciplinas) na tabela de dia_prazos_turmas
   qyVincularCurso.ParamByName('nr_anosemestre').AsInteger := CdAnoSemestre;
   qyVincularCurso.ParamByName('cd_curso').AsString := CdCurso;
   qyVincularCurso.ParamByName('cd_tipo_prazo').AsInteger := CdTipoPrazo;
   qyVincularCurso.ParamByName('cd_prazo').AsInteger := CdPrazo;

   //Verifica antes de executar o insert se as disciplinas já estão vinculadas a outros prazos
   qyVerificaVincularCurso.ParamByName('nr_anosemestre').AsInteger := CdAnoSemestre;
   qyVerificaVincularCurso.ParamByName('cd_curso').AsString := CdCurso;
   qyVerificaVincularCurso.ParamByName('cd_tipo_prazo').AsInteger := CdTipoPrazo;
   qyVerificaVincularCurso.ParamByName('depto').AsInteger := CdDepto;

   qyVerificaVincularCurso.Open;

   if qyVerificaVincularCurso.IsEmpty then
   begin
      qyVincularCurso.ExecSQL();
   end else begin
      if Mensagem('Alguma(s) disciplina(s) já estão vinculada(s) a outro(s) prazo(s) na mesma etapa, não é possível vincular as mesmas em mais de um prazo na mesma etapa. Você deseja vincular elas a esse prazo?', 'Atenção', MB_ICONQUESTION + MB_YESNO, Handle) = ID_YES then
      begin
         qyVerificaVincularCurso.First();
         while not qyVerificaVincularCurso.Eof do
         begin
            qyDeletarVinculo.ParamByName('nr_anosemestre').AsInteger := qyVerificaVincularCurso.FieldByName('nr_anosemestre').AsInteger;
            qyDeletarVinculo.ParamByName('cd_curso').AsString := qyVerificaVincularCurso.FieldByName('cd_curso').AsString;
            qyDeletarVinculo.ParamByName('cd_turma').AsString := qyVerificaVincularCurso.FieldByName('cd_turma').AsString;
            qyDeletarVinculo.ParamByName('cd_disciplina').AsInteger := qyVerificaVincularCurso.FieldByName('cd_disciplina').AsInteger;
            qyDeletarVinculo.ParamByName('cd_tipo_prazo').AsInteger := qyVerificaVincularCurso.FieldByName('cd_tipo_prazo').AsInteger;
            qyDeletarVinculo.ExecSQL;
            qyVerificaVincularCurso.Next;
         end;

      end
      else begin
         qyVerificaVincularCurso.First();
         sIgnorar := '';

         while not qyVerificaVincularCurso.Eof do
         begin
            if sIgnorar <> '' then
            begin
               sIgnorar:= sIgnorar+',';
            end;
            sIgnorar:= sIgnorar + qyVerificaVincularCurso.FieldByName('cd_disciplina').AsString;
            qyVerificaVincularCurso.Next;
         end;
         qyVincularCurso.SQL.Add('AND d.codigo not in ( '+sIgnorar+' )');
      end;
      qyVincularCurso.ExecSQL();
   end;
   qyVerificaVincularCurso.Close;

   Filtrar(CdPrazo);
end;


procedure Tf_vincular_cursos_turmas_disc.VincularDepartamento(CdDepto: String; NrAnosem: Integer);
begin
   qyVerificaDepartamentos.Close;
   qyVerificaDepartamentos.ParamByName('cd_depto').AsString := CdDepto;
   qyVerificaDepartamentos.Open;

   while not qyVerificaDepartamentos.Eof do
   begin
      VincularCurso(qyVerificaDepartamentosCD_CURSO.AsString, NrAnosem, StrToInt(CdDepto));
      qyVerificaDepartamentos.Next;      
   end;
end;

procedure Tf_vincular_cursos_turmas_disc.VincularDisciplina(CdDisciplina: Integer;
  CdTurma: String; CdAnoSemestre : Integer);
var
   CdPrazo, CdTipoPrazo : Integer;
begin
   //Verifica se está inserindo novo prazo ou se está alterando prazo existente
   if fDiario_Prazos_Novo.qyPrazos.State = dsInsert then
   begin
      //Insere o prazo caso ainda não tenha sido inserido
      fDiario_Prazos_Novo.InserirPrazo();

      //Seleciona o ultimo código do prazo inserido
      CdPrazo := DM.LastInsert;
   end else begin
      //Insere o prazo caso ainda não tenha sido inserido
      CdPrazo := fDiario_Prazos_Novo.qyPrazos.FieldByName('CD_PRAZO').AsInteger;
   end;
   CdTipoPrazo := fDiario_Prazos_Novo.qyPrazos.FieldByName('CD_TIPO_PRAZO').AsInteger;

   //Insere os dados (cursos/turmas/disciplinas) na tabela de dia_prazos_turmas
   qyVincularDisciplina.ParamByName('nr_anosemestre').AsInteger := CdAnoSemestre;
   qyVincularDisciplina.ParamByName('cd_disciplina').AsInteger := CdDisciplina;
   qyVincularDisciplina.ParamByName('cd_turma').AsString := CdTurma;
   qyVincularDisciplina.ParamByName('cd_tipo_prazo').AsInteger := CdTipoPrazo;
   qyVincularDisciplina.ParamByName('cd_prazo').AsInteger := CdPrazo;


   //Verifica antes de executar o insert se as disciplinas já estão vinculadas a outros prazos
   qyVerificaVincularDisciplina.ParamByName('nr_anosemestre').AsInteger := CdAnoSemestre;
   qyVerificaVincularDisciplina.ParamByName('cd_turma').AsString := CdTurma;
   qyVerificaVincularDisciplina.ParamByName('cd_disciplina').AsInteger := CdDisciplina;
   qyVerificaVincularDisciplina.ParamByName('cd_tipo_prazo').AsInteger := CdTipoPrazo;

   qyVerificaVincularDisciplina.Open;

   if qyVerificaVincularDisciplina.IsEmpty then
   begin
      qyVincularDisciplina.ExecSQL();
   end else begin
      if Mensagem('A disciplina já está vinculada a outro prazo na mesma etapa, não é possível vincular a mesma em mais de um prazo na mesma etapa. Você dejesa vincular ela a esse prazo?', 'Atenção', MB_ICONQUESTION + MB_YESNO) = ID_YES then
      begin
         while not qyVerificaVincularDisciplina.Eof do
         begin
            qyDeletarVinculo.ParamByName('nr_anosemestre').AsInteger := qyVerificaVincularDisciplina.FieldByName('nr_anosemestre').AsInteger;
            qyDeletarVinculo.ParamByName('cd_curso').AsString := qyVerificaVincularDisciplina.FieldByName('cd_curso').AsString;
            qyDeletarVinculo.ParamByName('cd_turma').AsString := qyVerificaVincularDisciplina.FieldByName('cd_turma').AsString;
            qyDeletarVinculo.ParamByName('cd_disciplina').AsInteger := qyVerificaVincularDisciplina.FieldByName('cd_disciplina').AsInteger;
            qyDeletarVinculo.ParamByName('cd_tipo_prazo').AsInteger := qyVerificaVincularDisciplina.FieldByName('cd_tipo_prazo').AsInteger;
            qyDeletarVinculo.ExecSQL;
            qyVerificaVincularDisciplina.Next;
         end;
         qyVincularDisciplina.ExecSQL();
      end;
   end;
   qyVerificaVincularDisciplina.Close;

   Filtrar(CdPrazo);
end;

procedure Tf_vincular_cursos_turmas_disc.VincularTurma(CdTurma: String; CdCurso: String;
  CdAnoSemestre: Integer);
var
   CdPrazo, CdTipoPrazo : Integer;
   bRemovePrazo: boolean;
   sIgnorar: String;
begin
   //Verifica se está inserindo novo prazo ou se está alterando prazo existente
   if fDiario_Prazos_Novo.qyPrazos.State = dsInsert then
   begin
      //Insere o prazo caso ainda não tenha sido inserido
      fDiario_Prazos_Novo.InserirPrazo();

      //Seleciona o ultimo código do prazo inserido
      CdPrazo := DM.LastInsert;
   end else begin
      //Insere o prazo caso ainda não tenha sido inserido
      CdPrazo := fDiario_Prazos_Novo.qyPrazos.FieldByName('CD_PRAZO').AsInteger;
   end;
   CdTipoPrazo := fDiario_Prazos_Novo.qyPrazos.FieldByName('CD_TIPO_PRAZO').AsInteger;

   //Insere os dados (cursos/turmas/disciplinas) na tabela de dia_prazos_turmas
   qyVincularTurma.ParamByName('nr_anosemestre').AsInteger := CdAnoSemestre;
   qyVincularTurma.ParamByName('cd_turma').AsString := CdTurma;
   qyVincularTurma.ParamByName('cd_curso').AsString := CdCurso;
   qyVincularTurma.ParamByName('cd_tipo_prazo').AsInteger := CdTipoPrazo;
   qyVincularTurma.ParamByName('cd_prazo').AsInteger := CdPrazo;

   //Verifica antes de executar o insert se as disciplinas já estão vinculadas a outros prazos
   qyVerificaVincularTurma.ParamByName('nr_anosemestre').AsInteger := CdAnoSemestre;
   qyVerificaVincularTurma.ParamByName('cd_curso').AsString := CdCurso;
   qyVerificaVincularTurma.ParamByName('cd_turma').AsString := CdTurma;
   qyVerificaVincularTurma.ParamByName('cd_tipo_prazo').AsInteger := CdTipoPrazo;   
   
   qyVerificaVincularTurma.Open;

   if qyVerificaVincularTurma.IsEmpty then
   begin
      qyVincularTurma.ExecSQL();
   end else begin
      // verifica se é necessário remover prazo
      bRemovePrazo:= Mensagem('Alguma(s) disciplina(s) já estão vinculada(s) a outro(s) prazo(s) na mesma etapa, não é possível vincular as mesmas em mais de um prazo na mesma etapa. Você dejesa vincular elas a esse prazo?', 'Atenção', MB_ICONQUESTION + MB_YESNO) = ID_YES;
      sIgnorar := '';

      if bRemovePrazo  then
      begin
         qyVerificaVincularTurma.First();
         while not qyVerificaVincularTurma.Eof do
         begin
            qyDeletarVinculo.ParamByName('nr_anosemestre').AsInteger := qyVerificaVincularTurma.FieldByName('nr_anosemestre').AsInteger;
            qyDeletarVinculo.ParamByName('cd_curso').AsString := qyVerificaVincularTurma.FieldByName('cd_curso').AsString;
            qyDeletarVinculo.ParamByName('cd_turma').AsString := qyVerificaVincularTurma.FieldByName('cd_turma').AsString;
            qyDeletarVinculo.ParamByName('cd_disciplina').AsInteger := qyVerificaVincularTurma.FieldByName('cd_disciplina').AsInteger;
            qyDeletarVinculo.ParamByName('cd_tipo_prazo').AsInteger := qyVerificaVincularTurma.FieldByName('cd_tipo_prazo').AsInteger;
            qyDeletarVinculo.ExecSQL;
            qyVerificaVincularTurma.Next;
         end;

      end
      else begin
         qyVerificaVincularTurma.First();
         while not qyVerificaVincularTurma.Eof do begin
            if(sIgnorar <> '') then begin
               sIgnorar := sIgnorar+ ',';
            end;
            sIgnorar:= sIgnorar + qyVerificaVincularTurma.FieldByName('cd_disciplina').AsString;

            qyVerificaVincularTurma.Next;
         end;
         qyVincularTurma.SQL.add('AND d.codigo not in ( '+sIgnorar+' )');
      end;
      qyVincularTurma.ExecSQL();


   end;

   qyVerificaVincularTurma.Close;

   
   Filtrar(CdPrazo);         
end;

end.
