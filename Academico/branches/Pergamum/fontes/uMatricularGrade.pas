unit uMatricularGrade;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, Grids, Db, ZConnection, ExtCtrls, Buttons, General, ZAbstractRODataset, ZAbstractDataset, ZDataset, UZDataset, ComCtrls, Mask, DBCtrls,
  ImgList, ToolWin, DBGrids, Menus, Variants;

type
  TfrmMatricularGrade = class(TForm)
    paCabecalho: TPanel;
    tblGrade: TUMZQuery;
    dtcGrade: TDataSource;
    tblTurmas: TUMZQuery;
    dtcTurmas: TDataSource;
    tblTurmasAnoSemestre: TSmallintField;
    tblTurmasCodigo: TStringField;
    tblTurmasCurso: TStringField;
    tblTurmasSerie: TSmallintField;
    qryInsert: TUMZQuery;
    qryTurmas: TUMZQuery;
    tblTurmasTurno: TStringField;
    tblCursos: TUMZQuery;
    tblCursosAnoSemestre: TSmallintField;
    tblCursosCodigo: TStringField;
    tblCursosDescricao: TStringField;
    tblCursosGrau: TSmallintField;
    tblCursosParecerAutorizacao: TStringField;
    tblCursosDataCEE: TDateTimeField;
    tblCursosCargaHorariaTotal: TFloatField;
    tblCursosDiasLetivos: TFloatField;
    tblCursosSemanasLetivas: TFloatField;
    tblCursosDiasSemanasLetivas: TStringField;
    tblCursosHorarioLetivo: TStringField;
    tblCursosDuracaoHoraAula: TFloatField;
    tblCursosDiasLetivosSemanais: TFloatField;
    tblCursosNumerodeSeries: TSmallintField;
    tblCursosObservacoes: TMemoField;
    tblCursosContrato: TStringField;
    dtcCursos: TDataSource;
    tblGradeCodigo: TStringField;
    tblGradeDisciplina: TSmallintField;
    tblGradeCurso: TStringField;
    tblGradeSerie: TSmallintField;
    tblGradeGrau: TSmallintField;
    tblGradeSigla: TStringField;
    tblGradeTurno: TStringField;
    tblGradeDescricao: TStringField;
    toolPessoa: TToolBar;
    ToolButton1: TToolButton;
    btnMatricular: TToolButton;
    ToolButton4: TToolButton;
    btnFechar: TToolButton;
    ToolButton3: TToolButton;
    ImageList1: TImageList;
    pmQtdTurmas: TPopupMenu;
    pmQtdGrade: TPopupMenu;
    qryTurmasLotacaoVagas: TUMZQuery;
    qryTurmasLotacaoVagasnr_anosemestre: TSmallintField;
    qryTurmasLotacaoVagascd_turma: TStringField;
    qryTurmasLotacaoVagascd_disciplina: TIntegerField;
    qryTurmasLotacaoVagascd_curso: TStringField;
    qryTurmasLotacaoVagassn_bloquear_vagas: TSmallintField;
    qryTurmasLotacaoVagasnr_vagas: TSmallintField;
    qryTurmasLotacaoVagasds_disciplina: TStringField;
    qryTurmasLotacaoVagasnr_matriculados: TLargeintField;
    Panel1: TPanel;
    DBGrid1: TDBGrid;
    Label3: TLabel;
    Panel2: TPanel;
    Label1: TLabel;
    grdDisciplinas: TDBGrid;
    procedure SpeedButton1Click(Sender: TObject);
    procedure btnFecharClick(Sender: TObject);
    procedure FormPaint(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure btnMatricularClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure Filtra;
    procedure dtcTurmasDataChange(Sender: TObject; Field: TField);
    procedure pmQtdTurmasPopup(Sender: TObject);
    procedure pmQtdGradePopup(Sender: TObject);
  private
  public
    turmaFiltro,
    cursoFiltro,
    gradeFiltro: String;

    anoSemestre: Integer;
    
  end;

var
  frmMatricularGrade: TfrmMatricularGrade;

implementation

uses uDM, uProcessando, Main, uFSelecionarCurso, uMatriculas;

{$R *.DFM}

procedure TfrmMatricularGrade.btnFecharClick(Sender: TObject);
begin
  Close;
end;

procedure TfrmMatricularGrade.FormPaint(Sender: TObject);
begin
  PapelParede( Sender );
end;

procedure TfrmMatricularGrade.FormCreate(Sender: TObject);
begin
  tblTurmas.Open;
  tblGrade.Open;
end;

procedure TfrmMatricularGrade.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  case Key of
    VK_F12 : btnFecharClick(nil);
  end;
end;

procedure TfrmMatricularGrade.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  tblTurmas.Close;
  tblGrade.Close;
  Action := caFree;
end;


procedure TfrmMatricularGrade.btnMatricularClick(Sender: TObject);

   function VerificaVagas: boolean;
   const
      S_SQL_LOTACAO =
         'SELECT '+
            'fi.anosemestre nr_anosemestre,'+
            'fi.turma cd_turma,'+
            'fi.disciplina cd_disciplina,'+
            'fi.curso cd_curso,'+
            't.sn_bloquear_vagas,'+
            't.vagas nr_vagas,'+
            'd.descricao ds_disciplina,'+
            'COUNT(*) nr_matriculados '+
         'FROM '+
            'fichaindividual fi '+
               'JOIN situacao s ON '+
                  '(fi.situacao = s.cd_situacao) '+
               'JOIN turmas t ON '+
                  '(fi.turma = t.codigo) AND '+
                  '(fi.anosemestre = t.anosemestre) '+
               'JOIN disciplinas d ON '+
                  '(fi.disciplina = d.codigo) AND '+
                  '(fi.curso = d.curso) '+
         'WHERE '+
            's.cd_situacao_pai NOT IN (3, 4, 6, 7, 8) AND (%s) '+
         'GROUP BY '+
            'fi.turma,'+
            'fi.disciplina,'+
            'fi.anosemestre';

      S_FILTRO_DISCIPLINA =
         '(fi.turma = ''%s'' AND '+
          'fi.disciplina = %d AND '+
          'fi.curso = ''%s'' AND '+
          'fi.anosemestre = %d AND '+
          't.sn_bloquear_vagas = 1)';

      S_OP = ' OR ';
      
      S_MSG_DISCIPLINAS =
         'O aluno não pode ser matriculado nas seguintes turmas/disciplinas '+
         'pois todas as vagas estão preenchidas:' + #13 + #13 + '%s';
   var
      LSDisciplinas, LSFiltro: string;
   begin
      Result := true;
      LSFiltro := '';
      LSDisciplinas := '';

      tblGrade.First;
      while not tblGrade.Eof do
      begin
         if LSFiltro <> '' then
            LSFiltro := LSFiltro + S_OP;
         LSFiltro :=
            LSFiltro +
            Format(
               S_FILTRO_DISCIPLINA,
               [tblTurmasCodigo.AsString,
                tblGradeDisciplina.AsInteger,
                tblGradeCurso.AsString,
                tblTurmasAnoSemestre.AsInteger]);
         tblGrade.Next;
      end;

      qryTurmasLotacaoVagas.Close;

      qryTurmasLotacaoVagas.SQLList.Values['mysql-5'] := Format(S_SQL_LOTACAO, [LSFiltro]);

//      qryTurmasLotacaoVagas.SQL.Text := Format(S_SQL_LOTACAO, [LSFiltro]);
      qryTurmasLotacaoVagas.Open;
      if not qryTurmasLotacaoVagas.IsEmpty then
      begin
         tblGrade.First;
         while not tblGrade.Eof do
         begin
            if qryTurmasLotacaoVagas.Locate(
                  'cd_turma;cd_disciplina;cd_curso;nr_anosemestre',
                  VarArrayOf(
                     [tblTurmasCodigo.AsString,
                      tblGradeDisciplina.AsInteger,
                      tblGradeCurso.AsString,
                      tblTurmasAnoSemestre.AsInteger]),
                  [loCaseInsensitive]) then
            begin
               if qryTurmasLotacaoVagassn_bloquear_vagas.AsInteger = 1 then
               begin
                  if qryTurmasLotacaoVagasnr_matriculados.AsInteger >= qryTurmasLotacaoVagasnr_vagas.AsInteger then
                  begin
                     if LSDisciplinas <> '' then
                        LSDisciplinas := LSDisciplinas + #13;
                     LSDisciplinas := LSDisciplinas +
                        Format('%s/%s',
                           [qryTurmasLotacaoVagascd_turma.AsString,
                            qryTurmasLotacaoVagasds_disciplina.AsString]);
                  end;
               end;
            end;
            tblGrade.Next;
         end;
         if LSDisciplinas <> '' then
         begin
            Mensagem(Format(S_MSG_DISCIPLINAS, [LSDisciplinas]), 'Atenção', MB_ICONWARNING);
            Result := false;
         end;
      end;
   end;

var
  lngAux : Longint;
  sMsg : String;
  alunoSituacaoInvalida: Boolean;
begin

   frmMatriculas.tblMatriculas.First;

   alunoSituacaoInvalida := False;

   while not frmMatriculas.tblMatriculas.Eof do
   begin

      if (frmMatriculas.tblMatriculasSituacao.AsInteger in [1,10]) then
      begin
         alunoSituacaoInvalida := True;
      end;

      frmMatriculas.tblMatriculas.Next;

   end;


  sMsg := 'Atenção: ' + CHR(13) + CHR(13);
  
  sMsg := sMsg + 'Esse procedimento irá matricular TODAS as disciplinas da etapa' + CHR(13);
  sMsg := sMsg + 'para TODOS os estudantes da turma ' + tblTurmasCodigo.AsString + ' (' + tblTurmasAnoSemestre.AsString + ') ' + CHR(13) + CHR(13);

  if alunoSituacaoInvalida then
  begin
     sMsg := sMsg + 'Verificamos alunos em outras situações que não cursando. Para esses alunos as disciplinas não serão matriculadas.' + CHR(13) + CHR(13);
  end;

  sMsg := sMsg + 'Tem certeza que deseja continuar ?';

  if (Mensagem( sMsg, Application.title, MB_YESNO + MB_ICONQUESTION + MB_DEFBUTTON2 ) = ID_NO) or
     (not VerificaVagas) then Exit;

  try
     Screen.Cursor := crHourGlass;
    DM.db.StartTransaction;

    qryTurmas.Close;
    qryTurmas.ParamByName('AnoSemestre').AsInteger := tblTurmasAnoSemestre.AsInteger;
    qryTurmas.ParamByName('Turma').AsString := tblTurmasCodigo.AsString;
    qryTurmas.Open;
    qryTurmas.First;

    frmProcessando.Bar.Max := qryTurmas.RecordCount;
    frmProcessando.Show;
    lngAux := 0;

    while not qryTurmas.Eof do
    begin
      try
      DM.MatricularGrade(
                          qryTurmas.FieldByName('CodigoAluno').AsInteger,
                          qryTurmas.FieldByName('Turma').AsString,
                          qryTurmas.FieldByName('AnoSemestre').AsInteger,
                          gradeFiltro
                        );
      except
      end;

      Inc( lngAux );
      frmProcessando.lblRegistros.Caption := 'Registros: ' + IntToStr(lngAux) + ' de ' +
                                             IntToStr( frmProcessando.Bar.Max );
      frmProcessando.Bar.Position := lngAux;
      Application.ProcessMessages;
      qryTurmas.Next;

    end;

    DM.db.Commit;

    qryTurmas.Close;
    frmProcessando.Close;

    Mensagem( 'Grade matriculada com sucesso.',Application.Title, MB_OK + MB_ICONINFORMATION );

    Screen.Cursor := crDefault;

  except
    DM.db.Rollback;
    frmProcessando.Close;
    Mensagem( 'Ocorreu um erro inesperado ao efetuar esta operação.' + #13 +
              'Contate o administrador do sistema.', Application.Title,
              MB_OK + MB_ICONSTOP );
    Screen.Cursor := crDefault;
    Exit;
  end;
end;


procedure TfrmMatricularGrade.FormShow(Sender: TObject);
begin
  { Todas em maiúsculas }
  DM.TodasMaiusculas(TForm(Sender));

  Filtra;
end;

procedure TfrmMatricularGrade.Filtra;
begin
   tblTurmas.Close;
   tblTurmas.ParamByName('AnoSemestre').asInteger := anoSemestre;
   tblTurmas.ParamByName('Curso').AsString := cursoFiltro;
   tblTurmas.Open;

   if turmaFiltro <> '' then
   begin
      tblTurmas.Filter := 'codigo = ' + QuotedStr(turmaFiltro);
      tblTurmas.Filtered := True;
   end
   else
   begin
      tblTurmas.Filtered := False;
   end;

   turmaFiltro := '';

   DM.BloquearComponenteAnosemestre(DBGrid1, 'AnoSemestre');
end;

procedure TfrmMatricularGrade.dtcTurmasDataChange(Sender: TObject;
  Field: TField);
begin
   tblGrade.Close;
   tblGrade.ParamByName('AnoSemestre').AsInteger := tblTurmasAnoSemestre.ASInteger;
   tblGrade.ParamByName('Turma').AsString := tblTurmasCodigo.AsString;
   tblGrade.Open;
end;

procedure TfrmMatricularGrade.pmQtdTurmasPopup(Sender: TObject);
begin
   DM.quantidade_registros(tblTurmas, pmQtdTurmas);
end;

procedure TfrmMatricularGrade.SpeedButton1Click(Sender: TObject);
begin
   Filtra();
end;

procedure TfrmMatricularGrade.pmQtdGradePopup(Sender: TObject);
begin
   DM.quantidade_registros(tblGrade, pmQtdGrade);
end;

end.

