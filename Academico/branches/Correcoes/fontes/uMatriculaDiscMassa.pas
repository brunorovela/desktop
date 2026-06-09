unit uMatriculaDiscMassa;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ComCtrls, Mask, Buttons, DBCtrls, ExtCtrls, DB,
  ZAbstractRODataset, ZAbstractDataset, UZDataset, Grids, DBGrids,
  ImgList, uDM, uFSelecionarTurma, uUsuario, General, UFMatricularDiscImpedmnts;

type
  TfrmMatriculaDiscMassa = class(TForm)
    pnTitulo: TPanel;
    Panel1: TPanel;
    lbDisciplina: TLabel;
    Panel3: TPanel;
    btnOk: TBitBtn;
    btnCancel: TBitBtn;
    dbgAlunos: TDBGrid;
    qyAlunos: TUMZQuery;
    dsAlunos: TDataSource;
    dsDisciplinas: TDataSource;
    qyDisciplinas: TUMZQuery;
    qyDisciplinasdisciplina: TStringField;
    qyDisciplinascd_disciplina: TIntegerField;
    qyDisciplinascd_turma: TStringField;
    qyDisciplinasnr_anosemestre: TSmallintField;
    qyAlunosnm_pessoa: TStringField;
    qyAlunoscd_pessoa: TIntegerField;
    cbDisciplinas: TComboBox;
    bbMarcarTodos: TBitBtn;
    bbDesmarcarTodos: TBitBtn;
    qyDisciplinascd_curso: TStringField;
    qyDisciplinasnr_serie: TSmallintField;
    qyDisciplinascd_grade: TLargeintField;
    ilDisciplinas: TImageList;
    qyDisciplinasnr_grau: TSmallintField;
    qyDisciplinasnr_creditos: TFloatField;
    lbTurma: TLabel;
    sbTurma: TSpeedButton;
    edTurma: TEdit;
    qyAlunossn_permite_selecionar: TBooleanField;
    qyAlunosnr_restricao_calc: TIntegerField;
    qyAlunosnr_restricao: TIntegerField;
    qyAlunosselecao: TLargeintField;
    qyAlunossn_aluno_fies: TBooleanField;
    qryVagas: TUMZQuery;
    qryVagasvagas: TSmallintField;
    qryVagassn_bloquear_vagas: TSmallintField;
    Panel7: TPanel;
    qyAlunosserie: TSmallintField;
    procedure btnOkClick(Sender: TObject);
    procedure dbgAlunosDblClick(Sender: TObject);
    procedure qyAlunosCalcFields(DataSet: TDataSet);
    procedure sbTurmaClick(Sender: TObject);
    procedure bbDesmarcarTodosClick(Sender: TObject);
    procedure bbMarcarTodosClick(Sender: TObject);
    procedure dbgAlunosCellClick(Column: TColumn);
    procedure dbgAlunosDrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumn; State: TGridDrawState);
    procedure cbDisciplinasChange(Sender: TObject);
    procedure FormShow(Sender: TObject);
  private
    slAlunos: TStringList;
    sTurmaOriginal: String;
    
    function getIndiceImagem(nro: Integer): Integer;
    procedure FiltrarDisciplinas;
    procedure FiltrarAlunos;
  public
    { Public declarations }
    iAnoSemestre: Integer;
    sMostraDisciplinasHorarios: String;
    
    procedure setTurma(sTurma: String);
    function getAlunosSelecionados: TStringList;
    function getTurmaSelecionada: String;    
    function getDisciplinaSelecionada: Integer;
    function getDescDisciplinaSelecionada: String;
    function getSerie: Integer;
    function getGrau: Integer;
    function getCurso: String;
    function getNrCreditos: Double;

    function getSerieAluno(curso: String; anosemestre: Integer; turma: String): Integer;
  end;

var
  frmMatriculaDiscMassa: TfrmMatriculaDiscMassa;

implementation

{$R *.dfm}

procedure TfrmMatriculaDiscMassa.bbDesmarcarTodosClick(Sender: TObject);
var
   lugar: Pointer;
begin
   lugar := qyAlunos.GetBookmark;

   qyAlunos.First();
   While not qyAlunos.Eof do
   begin
      slAlunos.Values[ qyAlunoscd_pessoa.AsString ] := '0';
      qyAlunos.Next;
   end;
   dbgAlunos.Repaint();
   qyAlunos.GotoBookmark(lugar);
end;

procedure TfrmMatriculaDiscMassa.bbMarcarTodosClick(Sender: TObject);
var
   lugar: Pointer;
begin
   lugar := qyAlunos.GetBookmark;

   qyAlunos.First();
   While not qyAlunos.Eof do
   begin
      if qyAlunossn_permite_selecionar.AsBoolean and
         not qyAlunossn_aluno_fies.AsBoolean then
      begin
         slAlunos.Values[ qyAlunoscd_pessoa.AsString ] := '1';
      end;
      
      qyAlunos.Next;
   end;
   dbgAlunos.Repaint();
   qyAlunos.GotoBookmark(lugar);
end;

procedure TfrmMatriculaDiscMassa.btnOkClick(Sender: TObject);
var
   sMsg : string;
begin
   {
      Verifica se o aluno esta aprovado E SE o usuario possui permissao
      para Matricular Disciplinas que o aluno já foi Aprovado
   }
   if ((qyAlunosnr_restricao_calc.AsInteger and 32) = 32 ) AND
      (NOT DM.UsuarioLogado.TemPermissao(1998, npIncluir, false)) then
   begin
      sMsg := ' Você não tem permissão para matricular um aluno em uma disciplina que ele já esta aprovado. ';
      Mensagem(sMsg);
      ModalResult:= mrNone;
   end;
end;

procedure TfrmMatriculaDiscMassa.cbDisciplinasChange(Sender: TObject);
begin
   FiltrarAlunos;
end;

procedure TfrmMatriculaDiscMassa.FormShow(Sender: TObject);
begin
   cbDisciplinas.Perform(CB_SETDROPPEDWIDTH, 400, 0);

   slAlunos := TStringList.Create;

   sMostraDisciplinasHorarios := DM.variavel_parametro('sn_mostra_disciplinas_horarios');

   FiltrarDisciplinas;

   FiltrarAlunos;
end;

procedure TfrmMatriculaDiscMassa.FiltrarDisciplinas;
begin
   qyDisciplinas.Close;
   qyDisciplinas.ParamByName('nr_anosemestre').AsInteger := iAnoSemestre;
   qyDisciplinas.ParamByName('cd_turma').AsString := edTurma.Text;
   qyDisciplinas.Open;

   // preenche a combo box de disciplinas
   cbDisciplinas.Clear;
   while not qyDisciplinas.Eof do
   begin
      cbDisciplinas.AddItem(
         '('
         + qyDisciplinas.FieldByName('cd_disciplina').AsString
         + ') - '
         + qyDisciplinas.FieldByName('ds_disciplina').AsString,
         qyDisciplinas.GetBookmark
      );
      qyDisciplinas.Next;
   end;
   cbDisciplinas.ItemIndex := 0;
end;

procedure TfrmMatriculaDiscMassa.dbgAlunosCellClick(Column: TColumn);
const
   SMsgConfirm = 'Este aluno está cadastrado no financiamento estudantil FIES.'#13'Realizar alterações na matrícula do aluno implicará em ajustes nos créditos acadêmicos.'#13'Deseja realmente marcar esse aluno?';
var
   PG: TPoint;
   GC: TGridCoord;
begin
   PG := dbgAlunos.ScreenToClient(Mouse.CursorPos);
   GC := dbgAlunos.MouseCoord( PG.X, PG.Y ) ;

   if (GC.X = 2) and qyAlunossn_permite_selecionar.AsBoolean then
   begin
      if slAlunos.Values [ qyAlunoscd_pessoa.AsString ] = '1' then begin
         slAlunos.Values [ qyAlunoscd_pessoa.AsString ] := '0';
      end
      else begin
         if (qyAlunossn_aluno_fies.AsBoolean) and
            (MessageDlg(SMsgConfirm, mtConfirmation, [mbYes, mbNo], -1) = mrNo) then
         begin
            Exit;
         end;

         slAlunos.Values [ qyAlunoscd_pessoa.AsString ] := '1';
      end;
      dbgAlunos.Repaint();
   end;
end;

procedure TfrmMatriculaDiscMassa.dbgAlunosDblClick(Sender: TObject);
begin
   if qyAlunosnr_restricao_calc.AsInteger > 0 then
   begin
      if fMatricularDiscImpedmnts = nil then
      begin
         Application.CreateForm(TfMatricularDiscImpedmnts, fMatricularDiscImpedmnts);
      end;
      
      // Recupera o total de vagas da turma e se tem bloqueio pela número de vagas
      qryVagas.Close;
      qryVagas.ParamByName('nr_anosemestre').AsInteger := iAnoSemestre;
      qryVagas.ParamByName('cd_turma').AsString := edTurma.Text;
      qryVagas.Open;

      fMatricularDiscImpedmnts.Pessoa := qyAlunoscd_pessoa.AsInteger;
      fMatricularDiscImpedmnts.Disciplina := qyDisciplinascd_disciplina.AsInteger;
      fMatricularDiscImpedmnts.Etapa := qyDisciplinasnr_serie.AsInteger;
      fMatricularDiscImpedmnts.Grade := qyDisciplinascd_grade.AsInteger;
      fMatricularDiscImpedmnts.AnoSemestre := iAnoSemestre;
      fMatricularDiscImpedmnts.Restricao := qyAlunosnr_restricao_calc.AsInteger;
      fMatricularDiscImpedmnts.Vagas := qryVagas.FieldByName('vagas').AsInteger;
      fMatricularDiscImpedmnts.BloqueiaVagas := qryVagas.FieldByName('sn_bloquear_vagas').AsInteger = 1;
      fMatricularDiscImpedmnts.Curso := qyDisciplinascd_curso.AsString;
      fMatricularDiscImpedmnts.Turma := edTurma.Text;
      fMatricularDiscImpedmnts.SerieAluno := qyAlunosserie.AsInteger;
      fMatricularDiscImpedmnts.porcentagemAluno:= DM.getPorcentagemReprovacaoAluno(qyAlunoscd_pessoa.AsInteger, qyDisciplinascd_curso.AsString);
      fMatricularDiscImpedmnts.LoadImpedimentos;

      fMatricularDiscImpedmnts.Left := frmMatriculaDiscMassa.ClientOrigin.X + Round((frmMatriculaDiscMassa.Width - fMatricularDiscImpedmnts.Width)/2); // Centraliza no frame de matricula disciplina em massa
      fMatricularDiscImpedmnts.Top := frmMatriculaDiscMassa.ClientOrigin.Y;
      fMatricularDiscImpedmnts.ShowModal;
   end;
end;

procedure TfrmMatriculaDiscMassa.dbgAlunosDrawColumnCell(Sender: TObject;
  const Rect: TRect; DataCol: Integer; Column: TColumn; State: TGridDrawState);
const IsChecked : array[Boolean] of Integer =
      (DFCS_BUTTONCHECK, DFCS_BUTTONCHECK or DFCS_CHECKED);
var
   oBitmap: TBitmap;
   DrawRect: TRect;
   bmpX, bmpY: Integer;
   fixRect : TRect;
begin
   fixRect := Rect;
   if ((Column.FieldName = '')) then
   begin
      oBitmap := TBitmap.Create;
      try
         // Utilizada mesma verificação da matrícula, onde, se dentro das restrições encontradas está a condição 1 (pré-requisito)
         ilDisciplinas.GetBitmap(getIndiceImagem(qyAlunosnr_restricao_calc.AsInteger), oBitmap);

         bmpX := (Rect.Left + (((Rect.Right - Rect.Left) - oBitmap.Width) div 2));
         bmpY := (Rect.Top + (((Rect.Bottom - Rect.Top) - oBitmap.Height) div 2));
         dbgAlunos.Canvas.Brush.Color := clWhite;
         dbgAlunos.Canvas.Pen.Style := psClear;
         fixRect.Right := fixRect.Right + 1;
         fixRect.Bottom := fixRect.Bottom + 1;
         dbgAlunos.Canvas.Rectangle(fixRect);
         dbgAlunos.Canvas.Draw(bmpX, bmpY, oBitmap);
      finally
         oBitmap.Free;
      end;
      fixRect := Rect;
   end;

   if (Column.FieldName = 'selecao') and not qyAlunossn_permite_selecionar.AsBoolean then
   begin
      oBitmap := TBitmap.Create;
      try
         bmpX := (Rect.Left + (((Rect.Right - Rect.Left) - oBitmap.Width) div 2));
         bmpY := (Rect.Top + (((Rect.Bottom - Rect.Top) - oBitmap.Height) div 2));
         dbgAlunos.Canvas.Brush.Color := clWhite;
         dbgAlunos.Canvas.Pen.Style := psClear;
         fixRect.Right := fixRect.Right + 1;
         fixRect.Bottom := fixRect.Bottom + 1;
         dbgAlunos.Canvas.Rectangle(fixRect);
         dbgAlunos.Canvas.Draw(bmpX, bmpY, oBitmap);
      finally
         oBitmap.Free;
      end;
      fixRect := Rect;
   end else if (Column.FieldName = 'selecao') and qyAlunossn_permite_selecionar.AsBoolean then
   begin
      dbgAlunos.Canvas.FillRect(Rect);
      if (gdFocused in State) then begin
         DrawRect.Left := Rect.Left + 1;
      end
      else begin
         DrawRect.Left := Rect.Left + 2;
      end;

      DrawRect.Right := Rect.Right - 2;
      DrawRect.Top := Rect.Top + 2;
      DrawRect.Bottom := Rect.Bottom - 2;
      DrawFrameControl(dbgAlunos.Canvas.Handle,
         DrawRect,
         DFC_BUTTON,
         ISChecked[ slAlunos.Values[ qyAlunoscd_pessoa.AsString ] = '1' ]
      );
   end;
end;

procedure TfrmMatriculaDiscMassa.FiltrarAlunos;
begin
   // Caso exista disciplinas
   if cbDisciplinas.Items.Count > 0 then
   begin
      // Busca os alunos da disciplina selecionada
      qyDisciplinas.GotoBookmark(Pointer(cbDisciplinas.Items.Objects[cbDisciplinas.ItemIndex]));
   end;

   qyAlunos.Close;
   qyAlunos.ParamByName('sn_mostra_disciplinas_horarios').AsString := sMostraDisciplinasHorarios;
   qyAlunos.ParamByName('cd_disciplina').AsInteger := qyDisciplinas.FieldByName('cd_disciplina').AsInteger;
   qyAlunos.ParamByName('cd_turma').AsString := sTurmaOriginal;
   qyAlunos.ParamByName('nr_anosemestre').AsInteger := iAnoSemestre;
   qyAlunos.Open;

   qyAlunos.First;
   while not qyAlunos.Eof do
   begin
      if qyAlunossn_permite_selecionar.AsBoolean and
         not qyAlunossn_aluno_fies.AsBoolean then
      begin
         slAlunos.Values[ qyAlunoscd_pessoa.AsString ] := '1';
      end else begin
         slAlunos.Values[ qyAlunoscd_pessoa.AsString ] := '0';
      end;
      qyAlunos.Next;
   end;

end;

function TfrmMatriculaDiscMassa.getAlunosSelecionados() : TStringList;
var
   slAlunosSelecionados : TStringList;
begin
   // Prepara o TStringList de retorno
   slAlunosSelecionados := TStringList.Create;

   // Varre a lista de alunos
   qyAlunos.First;
   
   while not qyAlunos.Eof do
   begin
      // Adiciona o aluno selecionado a lista de retorno
      if slAlunos.Values[ qyAlunoscd_pessoa.AsString ] = '1' then
      begin
         slAlunosSelecionados.Add(qyAlunoscd_pessoa.AsString);
      end;
      qyAlunos.Next;
   end;

   Result := slAlunosSelecionados;
end;

function TfrmMatriculaDiscMassa.getTurmaSelecionada() : String;
begin
   Result := edTurma.Text;
end;

procedure TfrmMatriculaDiscMassa.qyAlunosCalcFields(DataSet: TDataSet);
var
   PreRequisitoEspecialList: TStringList;
begin
   // Define inicialmente como usuário podendo selecionar aluno
   qyAlunossn_permite_selecionar.AsBoolean := True;

   // Utilizada mesma verificação da matrícula, onde, se dentro das restrições encontradas está a condição 1 (pré-requisito)
   qyAlunosnr_restricao_calc.AsInteger := qyAlunosnr_restricao.AsInteger +
                                          DM.PreRequisitoEspecial(qyAlunos.FieldByName('cd_pessoa').AsInteger,
                                                                  qyDisciplinas.FieldByName('cd_curso').AsString,
                                                                  qyDisciplinas.FieldByName('cd_disciplina').AsInteger,
                                                                  qyDisciplinas.FieldByName('cd_grade').AsInteger,
                                                                  qyDisciplinas.FieldByName('nr_anosemestre').AsInteger,
                                                                  qyDisciplinas.FieldByName('nr_serie').AsInteger,
                                                                  PreRequisitoEspecialList,
                                                                  qyAlunosserie.AsInteger);

   // Verifica se usuário possui permissão para matricular alunos com restrições
   if (qyAlunosnr_restricao_calc.AsInteger > 0) and not(DM.UsuarioLogado.TemPermissao( 1019, npEspecial, false )) then
   begin
      qyAlunossn_permite_selecionar.AsBoolean := False;
   end;

   if ((qyAlunosnr_restricao_calc.AsInteger and 32) = 32 ) AND
      (NOT DM.UsuarioLogado.TemPermissao(1998, npIncluir, false)) then
   begin
      qyAlunossn_permite_selecionar.AsBoolean := False;
      ModalResult:= mrNone;
   end;

   // Verifica se o parâmetro de bloqueio de ajuste de créditos para alunos
   // cadastrados no programa bolsa FIES está habilitada.
   // Se estiver habilitado, verifica se o usuário possui permissão para
   // alterar os créditos mesmo com o bloqueio habilitado.
   qyAlunossn_aluno_fies.AsBoolean := False;
   
   if DM.IsAlunoFIES(qyAlunos.FieldByName('cd_pessoa').AsInteger) and
      (DM.variavel_parametro('BLOQUEAR.AJUSTE.CREDITO.FIES') = 'S') then
   begin
      qyAlunossn_aluno_fies.AsBoolean := True;
      if not DM.UsuarioLogado.TemPermissao(DM.iCdPessoaLogado, 'Academico.Matriculas.Ajustes.FIES', npAcesso, False) then
      begin
         qyAlunossn_permite_selecionar.AsBoolean := False;
      end;
   end;
end;

function TfrmMatriculaDiscMassa.getDisciplinaSelecionada() : Integer;
begin
   // Busca a disciplina selecionada
   if cbDisciplinas.Items.Count > 0 then
   begin
      // Busca os alunos da disciplina selecionada
      qyDisciplinas.GotoBookmark(Pointer(cbDisciplinas.Items.Objects[cbDisciplinas.ItemIndex]));
   end;

   Result := qyDisciplinas.FieldByName('cd_disciplina').AsInteger;
end;

function TfrmMatriculaDiscMassa.getDescDisciplinaSelecionada() : String;
begin
   // Busca a disciplina selecionada
   if cbDisciplinas.Items.Count > 0 then
   begin
      // Busca os alunos da disciplina selecionada
      qyDisciplinas.GotoBookmark(Pointer(cbDisciplinas.Items.Objects[cbDisciplinas.ItemIndex]));
   end;

   Result := qyDisciplinas.FieldByName('ds_disciplina').AsString;
end;

function TfrmMatriculaDiscMassa.getSerie() : Integer;
begin
   // Busca a disciplina selecionada
   if cbDisciplinas.Items.Count > 0 then
   begin
      // Busca os alunos da disciplina selecionada
      qyDisciplinas.GotoBookmark(Pointer(cbDisciplinas.Items.Objects[cbDisciplinas.ItemIndex]));
   end;

   Result := qyDisciplinas.FieldByName('nr_serie').AsInteger;
end;

function TfrmMatriculaDiscMassa.getSerieAluno(curso: String; anosemestre: Integer;
  turma: String): Integer;
const
   SQL_BUSCA =
      ' SELECT '+
      '   serie '+
      ' FROM '+
      '   turmas '+
      ' WHERE '+
      '  curso = :cd_curso '+
      '  AND codigo = :codigo '+
      '  AND anosemestre = :anosemestre ';
var
   qybusca: TUMZReadOnlyQuery;
begin
   dm.CriarConsulta(qybusca);

   qybusca.SQL.Text := SQL_BUSCA;

   qybusca.ParamByName('cd_curso').AsString := curso;
   qybusca.ParamByName('codigo').AsString := turma;
   qybusca.ParamByName('anosemestre').AsInteger := anosemestre;

   qybusca.Open;

   Result := qybusca.FieldByName('serie').AsInteger;
end;

function TfrmMatriculaDiscMassa.getGrau() : Integer;
begin
   // Busca a disciplina selecionada
   if cbDisciplinas.Items.Count > 0 then
   begin
      // Busca os alunos da disciplina selecionada
      qyDisciplinas.GotoBookmark(Pointer(cbDisciplinas.Items.Objects[cbDisciplinas.ItemIndex]));
   end;

   Result := qyDisciplinas.FieldByName('nr_grau').AsInteger;
end;

function TfrmMatriculaDiscMassa.getCurso() : String;
begin
   // Busca a disciplina selecionada
   if cbDisciplinas.Items.Count > 0 then
   begin
      // Busca os alunos da disciplina selecionada
      qyDisciplinas.GotoBookmark(Pointer(cbDisciplinas.Items.Objects[cbDisciplinas.ItemIndex]));
   end;

   Result := qyDisciplinas.FieldByName('cd_curso').AsString;
end;

function TfrmMatriculaDiscMassa.getNrCreditos() : Double;
begin
   // Busca a disciplina selecionada
   if cbDisciplinas.Items.Count > 0 then
   begin
      // Busca os alunos da disciplina selecionada
      qyDisciplinas.GotoBookmark(Pointer(cbDisciplinas.Items.Objects[cbDisciplinas.ItemIndex]));
   end;

   Result := qyDisciplinas.FieldByName('nr_creditos').AsFloat;
end;

Function TfrmMatriculaDiscMassa.getIndiceImagem(nro: Integer): Integer;
begin
    if (nro and 32) = 32 then
      Result := 9
   else if (nro and 1) = 1 then
      Result := 4
   else if (nro and 2) = 2 then
      Result := 5
   else if (nro and 8) = 8 then
      Result := 6
   else if (nro and 4) = 4 then
      Result := 7
   else if (nro and 64) = 64 then
      Result := 7
   else if (nro and 16) = 16 then
      Result := 8
   else
      Result := 3;
end;

procedure TfrmMatriculaDiscMassa.sbTurmaClick(Sender: TObject);
var
   filtro_resultado : TResultadoFiltroTurma;
begin
   filtro_resultado := TfrmSelecionarTurma.Filtrar([bftAnosemestre], iAnoSemestre);

   if filtro_resultado.filtrado then
   begin
      if filtro_resultado.nr_anosemestre <> iAnoSemestre then
      begin
         Mensagem( 'O ano/semestre deve ser o mesmo da turma matrícula selecionada na planilha de matrículas.' , 'Atenção', MB_OK + MB_ICONWARNING );
         Exit;
      end;

      if filtro_resultado.nr_serie = -100 then
      begin
         Mensagem( 'Não é permitido o cadastro de uma disciplina optativa para vários alunos.'+#13+'Essa ação deve ser realizada por aluno.' , 'Atenção', MB_OK + MB_ICONWARNING );
         Exit;
      end;

      edTurma.Text := filtro_resultado.cd_turma;
      
      FiltrarDisciplinas;
      FiltrarAlunos;
  end;
end;

procedure TfrmMatriculaDiscMassa.setTurma(sTurma: String);
begin
   edTurma.Text := sTurma;
   sTurmaOriginal := sTurma;
end;

end.
