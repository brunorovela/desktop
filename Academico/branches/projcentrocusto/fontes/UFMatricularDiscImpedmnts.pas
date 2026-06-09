unit UFMatricularDiscImpedmnts;

interface

uses
   uDM, Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
   Dialogs, DB, ZAbstractRODataset, UZDataset, ImgList, DBClient, Grids, DBGrids,
   UZDbcFuncs, ZDbcIntfs, ComCtrls, ExtCtrls, StdCtrls, Buttons;

type
   TfMatricularDiscImpedmnts = class(TForm)
      qryPreRequisitos: TUMZReadOnlyQuery;
      qryPreRequisitosCD_CURSO: TStringField;
      qryPreRequisitosCD_DISCIPLI_PRE: TIntegerField;
      qryPreRequisitosNM_DISCIPLINA: TStringField;
      qryPreReqEspecial: TUMZReadOnlyQuery;
      qryPreReqEspecialDS_TIPO_REQ: TStringField;
      qryPreReqEspecialME_TIPO_SQL: TMemoField;
      qryConflitoHorars: TUMZReadOnlyQuery;
      qryConflitoHorarsCD_HORARIO: TSmallintField;
      qryConflitoHorarsDIA_SEMANA: TSmallintField;
      qryConflitoHorarsCD_DISCIPLINA: TIntegerField;
      qryConflitoHorarsNM_DISCIPLINA: TStringField;
      qryConflitoHorarsHR_INICIO: TTimeField;
      qryConflitoHorarsHR_FIM: TTimeField;
      qryMatriculasDisc: TUMZReadOnlyQuery;
      qryMatriculasDiscNR_MATRICULAS: TLargeintField;
      ilRestricoes: TImageList;
      cdsRestricoes: TClientDataSet;
      cdsRestricoesDS_OBSERVACAO: TStringField;
      dbgRestricoes: TDBGrid;
      dsRestricoes: TDataSource;
      cdsRestricoesNR_TIPO: TIntegerField;
      pnlBotoes: TPanel;
      bbtnFechar: TBitBtn;
      qryConflitoHorariosDisciplinasSel: TUMZReadOnlyQuery;
      qryConflitoHorariosDisciplinasSelDISCIPLINA: TStringField;
      qryConflitoHorariosDisciplinasSelTURMA: TStringField;
      qryConflitoHorariosDisciplinasSelDIA_SEMANA: TIntegerField;
      qryConflitoHorariosDisciplinasSelHR_INICIO: TTimeField;
      qryConflitoHorariosDisciplinasSelHR_FIM: TTimeField;
      procedure FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
      procedure FormDestroy(Sender: TObject);
      procedure dbgRestricoesDrawColumnCell(Sender: TObject; const Rect: TRect;
         DataCol: Integer; Column: TColumn; State: TGridDrawState);
      procedure FormClose(Sender: TObject; var Action: TCloseAction);
   private
      FPessoa: Integer;
      FDisciplina: Integer;
      FEtapa: Integer;
      FGrade: Integer;
      FAnoSemestre: Integer;
      FRestricao: Integer;
      FVagas: Integer;
      FBloqueiaVagas: Boolean;
      FCurso: string;
      FTurma: string;
      function GetAnoSemestre: Integer;
      function GetCurso: string;
      function GetDisciplina: Integer;
      function GetEtapa: Integer;
      function GetGrade: Integer;
      function GetPessoa: Integer;
      function GetRestricao: Integer;
      function GetTurma: string;
      function GetVagas: Integer;
      function IsBloqueiaVagas: Boolean;
      procedure SetAnoSemestre(const Value: Integer);
      procedure SetBloqueiaVagas(const Value: Boolean);
      procedure SetCurso(const Value: string);
      procedure SetDisciplina(const Value: Integer);
      procedure SetEtapa(const Value: Integer);
      procedure SetGrade(const Value: Integer);
      procedure SetPessoa(const Value: Integer);
      procedure SetRestricao(const Value: Integer);
      procedure SetTurma(const Value: string);
      procedure SetVagas(const Value: Integer);
      function CursouDisciplina(const DisciplinaPreReq: Integer): Boolean;
      procedure LoadPreRequisitos;
      procedure LoadPreRequisitosEspeciais;
      procedure LoadConflitoHorarios;
      procedure LoadConflitoHorariosDiscSelecionadas;
      procedure LoadVagasExcedidas;
   public
      procedure LoadImpedimentos;
      property Pessoa: Integer read GetPessoa write SetPessoa;
      property Disciplina: Integer read GetDisciplina write SetDisciplina;
      property Etapa: Integer read GetEtapa write SetEtapa;
      property Grade: Integer read GetGrade write SetGrade;
      property AnoSemestre: Integer read GetAnoSemestre write SetAnoSemestre;
      property Restricao: Integer read GetRestricao write SetRestricao;
      property Vagas: Integer read GetVagas write SetVagas;
      property BloqueiaVagas: Boolean read IsBloqueiaVagas write SetBloqueiaVagas;
      property Curso: string read GetCurso write SetCurso;
      property Turma: string read GetTurma write SetTurma;
   end;

var
   fMatricularDiscImpedmnts: TfMatricularDiscImpedmnts;

implementation

uses UFMatricular;

{$R *.dfm}

{ TfMatricularDiscImpedmnts }

function TfMatricularDiscImpedmnts.CursouDisciplina(
  const DisciplinaPreReq: Integer): Boolean;
const
   SSQLCursou =
      'SELECT ' +
         'CASE ' +
            'WHEN F2.CODIGOALUNO IS NULL THEN ' +
               'CASE ' +
                  'WHEN COUNT(FI.CODIGOALUNO) < COUNT(D.CODIGO) THEN FALSE ' +
                  'ELSE TRUE ' +
               'END ' +
            'ELSE TRUE ' +
         'END SN_CURSADA ' +
      'FROM ' +
         'DISCIPLINAS D ' +
            'LEFT JOIN DISCIPLINAS_EQUIV_INTERNA EQ ON ' +
               '(D.CODIGO = EQ.CD_DISCIPLINA) AND ' +
               '(D.CURSO = EQ.CD_CURSO) ' +
            'LEFT JOIN DISCIPLINAS_EQUIV_GRUPOS GR ON ' +
               '(EQ.CD_GRUPO = GR.CD_GRUPO1) ' +
               'LEFT JOIN DISCIPLINAS_EQUIV_INTERNA EQ2 ON ' +
                  '(EQ2.CD_GRUPO = GR.CD_GRUPO2) ' +
                     'LEFT JOIN FICHAINDIVIDUAL FI ON ' +
                        '(EQ2.CD_CURSO = FI.CURSO) AND ' +
                        '(EQ2.CD_DISCIPLINA = FI.DISCIPLINA) AND ' +
                        '(FI.CODIGOALUNO = ?) AND ' +
                        '(FI.SITUACAO IN (SELECT CD_SITUACAO FROM SITUACAO WHERE CD_SITUACAO_PAI IN(0, 12))) ' +
         'LEFT JOIN FICHAINDIVIDUAL F2 ON ' +
            '(F2.DISCIPLINA = ?) AND ' +
            '(F2.CURSO = ?) AND ' +
            '(F2.CODIGOALUNO = ?) AND ' +
            '((F2.GRAU NOT IN (1, 2)) OR (F2.SERIE = ?)) AND ' +
            '(F2.SITUACAO IN (SELECT CD_SITUACAO FROM SITUACAO WHERE CD_SITUACAO_PAI IN(0, 12))) ' +
      'WHERE ' +
         'D.CODIGO = ? AND ' +
         'D.CURSO = ? ' +
      'GROUP BY ' +
         'EQ.CD_GRUPO';
var
   Stmt: IZPreparedStatement;
   ResultSet: IZResultSet;
begin
   Stmt := PrepareStatement(SSQLCursou);
   try
      Stmt.SetInt(1, Pessoa);
      Stmt.SetInt(2, DisciplinaPreReq);
      Stmt.SetString(3, Curso);
      Stmt.SetInt(4, Pessoa);
      Stmt.SetInt(5, Etapa);
      Stmt.SetInt(6, DisciplinaPreReq);
      Stmt.SetString(7, Curso);

      ResultSet := Stmt.ExecuteQueryPrepared;
      try
         if ResultSet.Next then
            Result := ResultSet.GetInt(1) = 1
         else
            Result := False;
      finally
         ResultSet.Close;
      end;
      
   finally
      Stmt.Close;
   end;
end;

procedure TfMatricularDiscImpedmnts.dbgRestricoesDrawColumnCell(Sender: TObject;
  const Rect: TRect; DataCol: Integer; Column: TColumn; State: TGridDrawState);
var
   Bitmap: TBitmap;
   X, Y: Integer;
   FixRect: TRect;
begin
   if dbgRestricoes.SelectedRows.CurrentRowSelected then
   begin
      dbgRestricoes.Canvas.Font.Color := clWhite;
      dbgRestricoes.Canvas.Brush.Color := clNavy;
      dbgRestricoes.DefaultDrawColumnCell(Rect, DataCol, Column, State);
   end
   else if DataCol = 0 then
   begin
      Bitmap := TBitmap.Create;
      try
         ilRestricoes.GetBitmap(cdsRestricoesNR_TIPO.AsInteger, Bitmap);
         X := Rect.Left + (((Rect.Right - Rect.Left) - Bitmap.Width) div 2);
         Y := Rect.Top + (((Rect.Bottom - Rect.Top) - Bitmap.Height) div 2);
         FixRect := Rect;
         FixRect.Right := FixRect.Right + 1;
         FixRect.Bottom := FixRect.Bottom + 1;
         dbgRestricoes.Canvas.Font.Color := clLtGray;
         dbgRestricoes.Canvas.Brush.Color := clWhite;
         dbgRestricoes.Canvas.Pen.Style := psClear;
         dbgRestricoes.Canvas.Rectangle(FixRect);
         dbgRestricoes.Canvas.Draw(X, Y, Bitmap);
         dbgRestricoes.Canvas.Pen.Style := psSolid;
      finally
         Bitmap.Free;
      end;
   end
   else
   begin
      dbgRestricoes.DefaultDrawColumnCell(Rect, DataCol, Column, State);
   end;
end;

procedure TfMatricularDiscImpedmnts.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
   Action := caHide;
end;

procedure TfMatricularDiscImpedmnts.FormDestroy(Sender: TObject);
begin
   cdsRestricoes.Close;
   cdsRestricoes.Data := Null;
end;

procedure TfMatricularDiscImpedmnts.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
   if Key = VK_ESCAPE then Close;
end;

function TfMatricularDiscImpedmnts.GetAnoSemestre: Integer;
begin
   Result := FAnoSemestre;
end;

function TfMatricularDiscImpedmnts.GetCurso: string;
begin
   Result := FCurso;
end;

function TfMatricularDiscImpedmnts.GetDisciplina: Integer;
begin
   Result := FDisciplina;
end;

function TfMatricularDiscImpedmnts.GetEtapa: Integer;
begin
   Result := FEtapa;
end;

function TfMatricularDiscImpedmnts.GetGrade: Integer;
begin
   Result := FGrade;
end;

function TfMatricularDiscImpedmnts.GetPessoa: Integer;
begin
   Result := FPessoa;
end;

function TfMatricularDiscImpedmnts.GetRestricao: Integer;
begin
   Result := FRestricao;
end;

function TfMatricularDiscImpedmnts.GetTurma: string;
begin
   Result := FTurma;
end;

function TfMatricularDiscImpedmnts.GetVagas: Integer;
begin
   Result := FVagas;
end;

function TfMatricularDiscImpedmnts.IsBloqueiaVagas: Boolean;
begin
   Result := FBloqueiaVagas;
end;

procedure TfMatricularDiscImpedmnts.LoadConflitoHorarios;
const
   SObsMask = '[%d] %s: %s, %s às %s';
var
   S: string;
begin
   qryConflitoHorars.ParamByName('CD_PESSOA').AsInteger := Pessoa;
   qryConflitoHorars.ParamByName('NR_ANOSEMESTRE').AsInteger := AnoSemestre;
   qryConflitoHorars.ParamByName('CD_TURMA').AsString := Turma;
   qryConflitoHorars.ParamByName('CD_DISCIPLINA').AsInteger := Disciplina;
   qryConflitoHorars.Open;
   try
      while not qryConflitoHorars.Eof do
      begin
         S := Format(SObsMask, [
            qryConflitoHorarsCD_DISCIPLINA.AsInteger,
            qryConflitoHorarsNM_DISCIPLINA.AsString,
            LongDayNames[qryConflitoHorarsDIA_SEMANA.AsInteger],
            TimeToStr(qryConflitoHorarsHR_INICIO.AsDateTime),
            TimeToStr(qryConflitoHorarsHR_FIM.AsDateTime)]
         );
         cdsRestricoes.Insert;
         cdsRestricoesDS_OBSERVACAO.AsString := S;
         cdsRestricoesNR_TIPO.AsInteger := 3;
         qryConflitoHorars.Next;
      end;
   finally
      qryConflitoHorars.Close;
   end;
end;

procedure TfMatricularDiscImpedmnts.LoadConflitoHorariosDiscSelecionadas;
const
   mensagemMask = '%s [%s], %s - %s às %s';
var
   mensagem, condicao: string;
   listaCondicoesTurmasDiscSelecionadas: TStringList;
   qyChecarHorarios: TUMZQuery;
begin

   // Cria consulta para checar conflito de horarios
   DM.CriarConsulta( qyChecarHorarios );

   // Inicializa a lista de condição
   listaCondicoesTurmasDiscSelecionadas := TStringList.Create;

   // Varre a lista de disciplinas para pegar as selecionadas
   fMatricular.cdsDisciplinas.First;
   while not fMatricular.cdsDisciplinas.Eof do
   begin

     // Verifica se a disciplina não está selecionada
     if fMatricular.cdsDisciplinasSN_SELECIONADA.AsBoolean then
     begin
          // Define a condicao
       condicao := '('+IntToStr(AnoSemestre)+', "'+fMatricular.cdsDisciplinasCD_TURMA.AsString+'", '+fMatricular.cdsDisciplinasCD_DISCIPLINA.AsString+')';

       // Adiciona a condicao de turmas disciplinas que estão selecionadas
       listaCondicoesTurmasDiscSelecionadas.Add(condicao);

     end;

     fMatricular.cdsDisciplinas.Next;
   end;

   // Define o separador das condicoes na lista
   listaCondicoesTurmasDiscSelecionadas.Delimiter := ',';

   // Prepara o SQL que será executado
   qyChecarHorarios.SQL.Text := qryConflitoHorariosDisciplinasSel.SQL.Text;

   // Prepara SQL para checar se houve conflito de horário
   qyChecarHorarios.Close;

   // Seta as condicoes do SQL
   qyChecarHorarios.ParamByName('NR_ANOSEMESTRE').AsInteger := AnoSemestre;
   qyChecarHorarios.ParamByName('CD_TURMA').AsString := Turma;
   qyChecarHorarios.ParamByName('CD_DISCIPLINA').AsInteger := Disciplina;
   qyChecarHorarios.ParamByName('CD_CURSO').AsString := Curso;

   listaCondicoesTurmasDiscSelecionadas.QuoteChar := ' ';
   // Seta a condição da lista de disciplinas selecionadas
   qyChecarHorarios.SQL.Text := StringReplace(qyChecarHorarios.SQL.Text, ':TURMAS_DISC_SELECIONADAS', listaCondicoesTurmasDiscSelecionadas.DelimitedText, [rfReplaceAll, rfIgnoreCase]);

   // Busca se houve conflito em algum horário
   qyChecarHorarios.Open;

   // Lógica para apresentar as mensagens informando os conflitos de horario
   try
      while not qyChecarHorarios.Eof do
      begin

         mensagem := Format(mensagemMask, [
            qyChecarHorarios.FieldByName('DISCIPLINA').AsString,
            qyChecarHorarios.FieldByName('TURMA').AsString,
            LongDayNames[qyChecarHorarios.FieldByName('DIA_SEMANA').AsInteger],
            TimeToStr(qyChecarHorarios.FieldByName('HR_INICIO').AsDateTime),
            TimeToStr(qyChecarHorarios.FieldByName('HR_FIM').AsDateTime)]
         );
         cdsRestricoes.Insert;
         cdsRestricoesDS_OBSERVACAO.AsString := mensagem;
         cdsRestricoesNR_TIPO.AsInteger := 3;

         qyChecarHorarios.Next;
      end;
   finally
      qyChecarHorarios.Close;
   end;

end;

procedure TfMatricularDiscImpedmnts.LoadPreRequisitos;
const
   SObsMask = '[%d] %s';
begin
   qryPreRequisitos.ParamByName('CD_CURSO').AsString := Curso;
   qryPreRequisitos.ParamByName('CD_DISCIPLINA').AsInteger := Disciplina;
   qryPreRequisitos.ParamByName('CD_GRADE').AsInteger := Grade;
   qryPreRequisitos.Open;
   try
      while not qryPreRequisitos.Eof do
      begin
         if not CursouDisciplina(qryPreRequisitosCD_DISCIPLI_PRE.AsInteger) then
         begin
            cdsRestricoes.Insert;
            cdsRestricoesDS_OBSERVACAO.AsString :=
               Format(SObsMask, [
                  qryPreRequisitosCD_DISCIPLI_PRE.AsInteger,
                  qryPreRequisitosNM_DISCIPLINA.AsString]
               );
            cdsRestricoesNR_TIPO.AsInteger := 0;
         end;
         qryPreRequisitos.Next;
      end;
   finally
      qryPreRequisitos.Close;
   end;
end;

procedure TfMatricularDiscImpedmnts.LoadPreRequisitosEspeciais;
var
   qySQLDinamicoPreRequisitoEspecial: TUMZQuery;
   sSQL: String;
begin
   DM.CriarConsulta(qySQLDinamicoPreRequisitoEspecial);

   qryPreReqEspecial.ParamByName('CD_CURSO').AsString := Curso;
   qryPreReqEspecial.ParamByName('CD_GRADE').AsInteger := Grade;
   qryPreReqEspecial.ParamByName('CD_DISCIPLINA').AsInteger := Disciplina;
   qryPreReqEspecial.Open;
   while not qryPreReqEspecial.Eof do
   begin
      // Monta o SQL dinamico do pré-requisito especial
      sSQL := '';
      sSQL := qryPreReqEspecialME_TIPO_SQL.AsString;

      // Substitui algumas variáveis no SQL dinâmico que podem ser utilizadas
      sSQL := StringReplace(sSQL, '[$cd_curso$]', QuotedStr(Curso), [rfReplaceAll]);
      sSQL := StringReplace(sSQL, '[$cd_grade$]', Format('%d', [Grade]), [rfReplaceAll]);
      sSQL := StringReplace(sSQL, '[$cd_disciplina$]', Format('%d', [Disciplina]), [rfReplaceAll]);
      sSQL := StringReplace(sSQL, '[$cd_pessoa$]', Format('%d', [Pessoa]), [rfReplaceAll]);
      try
         // Prepara para executar o SQL dinâmico para verificar o pré-requisito especial
         qySQLDinamicoPreRequisitoEspecial.Close;
         qySQLDinamicoPreRequisitoEspecial.SQL.Clear;
         qySQLDinamicoPreRequisitoEspecial.SQL.Text := sSQL;

         // Executa o pré-requisito especial
         qySQLDinamicoPreRequisitoEspecial.Open;

         // Verifica se o aluno precisa do pré-requisito especial
         if (qySQLDinamicoPreRequisitoEspecial.RecordCount = 0) then
         begin
            // Essa disciplina necessita de pré-requisito especial
            cdsRestricoes.Insert;
            cdsRestricoesDS_OBSERVACAO.AsString := qryPreReqEspecialDS_TIPO_REQ.AsString;
            cdsRestricoesNR_TIPO.AsInteger := 1;
         end;
      except
         on E: EZSQLException do;
      end;
      qryPreReqEspecial.Next;
   end;
   qryPreReqEspecial.Close;
end;

procedure TfMatricularDiscImpedmnts.LoadVagasExcedidas;
const
   SObsMask = 'Limite de %d vagas na disciplina para a turma %s, matriculados: %d';
begin
   qryMatriculasDisc.ParamByName('CD_TURMA').AsString := Turma;
   qryMatriculasDisc.ParamByName('CD_DISCIPLINA').AsInteger := Disciplina;
   qryMatriculasDisc.ParamByName('NR_ANOSEMESTRE').AsInteger := AnoSemestre;
   qryMatriculasDisc.Open;
   try
      if qryMatriculasDiscNR_MATRICULAS.AsInteger >= Vagas then
      begin
         cdsRestricoes.Insert;
         cdsRestricoesDS_OBSERVACAO.AsString :=
            Format(SObsMask, [Vagas, Turma, qryMatriculasDiscNR_MATRICULAS.AsInteger]);
         cdsRestricoesNR_TIPO.AsInteger := 2;
      end;
   finally
      qryMatriculasDisc.Close;
   end;
end;

procedure TfMatricularDiscImpedmnts.SetAnoSemestre(const Value: Integer);
begin
   FAnoSemestre := Value;
end;

procedure TfMatricularDiscImpedmnts.SetBloqueiaVagas(const Value: Boolean);
begin
   FBloqueiaVagas := Value;
end;

procedure TfMatricularDiscImpedmnts.SetCurso(const Value: string);
begin
   FCurso := Value;
end;

procedure TfMatricularDiscImpedmnts.SetDisciplina(const Value: Integer);
begin
   FDisciplina := Value;
end;

procedure TfMatricularDiscImpedmnts.SetEtapa(const Value: Integer);
begin
   FEtapa := Value;
end;

procedure TfMatricularDiscImpedmnts.SetGrade(const Value: Integer);
begin
   FGrade := Value;
end;

procedure TfMatricularDiscImpedmnts.SetPessoa(const Value: Integer);
begin
   FPessoa := Value;
end;

procedure TfMatricularDiscImpedmnts.SetRestricao(const Value: Integer);
begin
   FRestricao := Value;
end;

procedure TfMatricularDiscImpedmnts.SetTurma(const Value: string);
begin
   FTurma := Value;
end;

procedure TfMatricularDiscImpedmnts.SetVagas(const Value: Integer);
begin
   FVagas := Value;
end;

procedure TfMatricularDiscImpedmnts.LoadImpedimentos;
begin
   cdsRestricoes.EmptyDataSet;
   cdsRestricoes.Open;

   if (Restricao and 32) = 32 then
   begin
      cdsRestricoes.Insert;
      cdsRestricoesDS_OBSERVACAO.AsString := 'Disciplina aprovada, aproveitamento ou equivalência.';
      cdsRestricoesNR_TIPO.AsInteger := 5;
   end;

   if (Restricao and 1) = 1 then
   begin
      LoadPreRequisitos;
   end;

   if (Restricao and 2) = 2 then
   begin
      LoadPreRequisitosEspeciais;
   end;

   if BloqueiaVagas and ((Restricao and 8) = 8) then
   begin
      LoadVagasExcedidas;
   end;

   if (Restricao and 4) = 4 then
   begin
      LoadConflitoHorarios;
   end;

   if (Restricao and 64) = 64 then
   begin
      // Apresenta o conflito de horários entre disciplinas que o usuário está selecionando na matrícula
      LoadConflitoHorariosDiscSelecionadas;
   end;   
   
   if (Restricao and 16) = 16 then
   begin
      cdsRestricoes.Insert;
      cdsRestricoesDS_OBSERVACAO.AsString := 'Disciplina não possui horário informado';
      cdsRestricoesNR_TIPO.AsInteger := 4;
   end;
   
   if cdsRestricoes.State = dsInsert then
   begin
      cdsRestricoes.Post;
   end;
end;

end.
