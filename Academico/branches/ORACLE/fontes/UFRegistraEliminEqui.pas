unit UFRegistraEliminEqui;

interface

uses
   Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
   Dialogs, DB, ZAbstractRODataset, UZDataset, ZAbstractDataset, ExtCtrls,
   DBCtrls, StdCtrls, Mask, ToolWin, ComCtrls, ImgList, ZSqlUpdate, ZDataset,
   ZDbcIntfs, UZDbcFuncs, General, uUMNucleo;

type
   TfRegistraEliminEqui = class(TForm)
      qryLogEquivalencias: TUMZQuery;
      qrySituacoes: TUMZReadOnlyQuery;
      qrySituacoesCODIGO: TLargeintField;
      qrySituacoesCD_MODULO: TLargeintField;
      qrySituacoesCD_SITUACAO: TIntegerField;
      qrySituacoesDS_VALOR: TStringField;
      qrySituacoesDS_SIGLA: TStringField;
      qryLogEquivalenciasDS_SITUACAO: TStringField;
      pnlTitulo: TPanel;
      bvlSep1: TBevel;
      qryLogEquivalenciasCD_EQUIVALENCIA_LOG: TLargeintField;
      qryLogEquivalenciasCD_USUARIO: TIntegerField;
      qryLogEquivalenciasDT_LOG: TDateTimeField;
      qryLogEquivalenciasCD_SITUACAO: TIntegerField;
      qryLogEquivalenciasCD_ALUNO: TIntegerField;
      qryLogEquivalenciasCD_DISCIPLINA: TIntegerField;
      qryLogEquivalenciasCD_CURSO: TStringField;
      qryLogEquivalenciasCD_PROFESSOR_EQ: TLargeintField;
      qryLogEquivalenciasNM_INSTITUICAO_EQ: TStringField;
      qryLogEquivalenciasNM_CURSO_EQ: TStringField;
      qryLogEquivalenciasNR_ANOSEMESTRE_EQ: TIntegerField;
      qryLogEquivalenciasVL_CARGA_HORARIA_EQ: TFloatField;
      qryLogEquivalenciasVL_NOTA_EQ: TFloatField;
      qryLogEquivalenciasVL_FREQUENCIA_EQ: TFloatField;
      qryLogEquivalenciasVL_CONTEUDO_EQ: TFloatField;
      qryLogEquivalenciasDS_CONCEITO_EQ: TStringField;
      qryLogEquivalenciasTP_ACAO: TStringField;
      qryLogEquivalenciasTX_MOTIVO: TMemoField;
      pnlDados: TPanel;
      qryUsuario: TUMZReadOnlyQuery;
      dsLogEquivalencias: TDataSource;
      qryUsuarioNM_PESSOA: TStringField;
      dsUsuario: TDataSource;
      qryAluno: TUMZReadOnlyQuery;
      qryAlunoNM_PESSOA: TStringField;
      dsAluno: TDataSource;
      qryDisciplina: TUMZReadOnlyQuery;
      qryDisciplinaCD_DISCIPLINA_PAI: TStringField;
      qryDisciplinaCODIGO: TIntegerField;
      qryDisciplinaCURSO: TStringField;
      qryDisciplinaSIGLA: TStringField;
      qryDisciplinaDESCRICAO: TStringField;
      dsDisciplina: TDataSource;
      qryCurso: TUMZReadOnlyQuery;
      qryCursoCD_CURSO: TStringField;
      qryCursoDS_CURSO: TStringField;
      dsCurso: TDataSource;
      qryProfessor: TUMZReadOnlyQuery;
      qryProfessorNM_PESSOA: TStringField;
      dsProfessor: TDataSource;
      lblAluno: TLabel;
      dbeAluno: TDBEdit;
      lblDisciplina: TLabel;
      dbeDisciplina: TDBEdit;
      lblCurso: TLabel;
      dbeCurso: TDBEdit;
      rgEquivalencia: TGroupBox;
      lblProfessor: TLabel;
      dbeProfessor: TDBEdit;
      lblInstituicaoEq: TLabel;
      dbeInstituicaoEq: TDBEdit;
      lblCursoEq: TLabel;
      dbeCursoEq: TDBEdit;
      lblDisciplinaEq: TLabel;
      dbeDisciplinaEq: TDBEdit;
      lblAnoSemestreEq: TLabel;
      dbeAnoSemestreEq: TDBEdit;
      lblCargaHorariaEq: TLabel;
      dbeCargaHorariaEq: TDBEdit;
      lblNotaEq: TLabel;
      dbeNotaEq: TDBEdit;
      lblFrequenciaEq: TLabel;
      dbeFrequenciaEq: TDBEdit;
      lblConteudoEq: TLabel;
      dbeConteudoEq: TDBEdit;
      lblConceitoEq: TLabel;
      dbeConceitoEq: TDBEdit;
      lblSituacao: TLabel;
      dblcSituacao: TDBLookupComboBox;
      stbOpcoes: TToolBar;
      btnSep1: TToolButton;
      btnConfirmar: TToolButton;
      btnSep2: TToolButton;
      ilOpcoes: TImageList;
      bvlSep3: TBevel;
      lblMotivo: TLabel;
      dbmMotivo: TDBMemo;
      updLogEquivalencias: TZUpdateSQL;
      qryEquivalencia: TUMZReadOnlyQuery;
      qryEquivalenciaCODIGOEQUIVALENCIAS: TIntegerField;
      qryEquivalenciaCODIGOALUNO: TIntegerField;
      qryEquivalenciaDISCIPLINA: TIntegerField;
      qryEquivalenciaCURSO: TStringField;
      qryEquivalenciaEQ_INSTITUICAO: TStringField;
      qryEquivalenciaEQ_CURSO: TStringField;
      qryEquivalenciaEQ_ANOSEMESTRE: TSmallintField;
      qryEquivalenciaEQ_CH: TFloatField;
      qryEquivalenciaEQ_NOTA: TFloatField;
      qryEquivalenciaCD_PROFESSOR: TIntegerField;
      qryEquivalenciaDS_CONCEITO: TStringField;
      qryEquivalenciaEQ_FREQUENCIA: TFloatField;
      qryEquivalenciaEQ_EQUIVALENCIA: TFloatField;
    btncancelar: TToolButton;
    qEliminaDisc: TUMZQuery;
    qEliminaEquiv: TUMZQuery;
    qryAlunoCD_PESSOA: TIntegerField;
    qExluiFichaIndividual: TUMZQuery;
    qryLogEquivalenciasNR_FICHA_EXCLUIDA: TStringField;
    qryEquivalenciaeq_disciplina: TMemoField;
    qryLogEquivalenciasnm_disciplina_eq: TMemoField;
    procedure qryLogEquivalenciasnm_disciplina_eqGetText(Sender: TField;
      var Text: string; DisplayText: Boolean);
    procedure qryEquivalenciaeq_disciplinaGetText(Sender: TField;
      var Text: string; DisplayText: Boolean);
    procedure btncancelarClick(Sender: TObject);
      procedure qryProfessorAfterOpen(DataSet: TDataSet);
      procedure FormClose(Sender: TObject; var Action: TCloseAction);
      procedure btnConfirmarClick(Sender: TObject);
   private
      FEquiDisciplina: Integer;
      FEquivalencia: Integer;
      FTurmaMatricula : String;
      FCurso: String;
      FAnoSemestre: Integer;
      function GetAnoSemestre: Integer;
      function GetTurmaMatricula: String;
      function GetEquivalencia: Integer;
      procedure SetEquivalencia(const Value: Integer);
      function GetEquiDisciplina: Integer;
   public
      procedure SetAnoSemestre(const Value: Integer);
      procedure SetTurmaMatricula(const Value: String);
      procedure SetEquiDisciplina(value: Integer);
      procedure SetCurso(const Value: String);
      function CarregaEquivalencia: Boolean;
      property Equivalencia: Integer read GetEquivalencia write SetEquivalencia;
      property TurmaMatricula : String read GetTurmaMatricula write SetTurmaMatricula;
      property AnoSemestre : Integer read GetAnoSemestre write SetAnoSemestre;
   end;

var
   fRegistraEliminEqui: TfRegistraEliminEqui;

implementation

uses
   uDM;

{$R *.dfm}

{ TfRegistraEliminEqui }

procedure TfRegistraEliminEqui.btncancelarClick(Sender: TObject);
begin
   close;
end;

procedure TfRegistraEliminEqui.btnConfirmarClick(Sender: TObject);
const
   SSemMotivo = 'É necessário informar um motivo para realizar a eliminação da equivalência.';
   SConfirmaExclusaoFicha = 'Deseja realmente excluir os dados da ficha individual do aluno? '#13'Ao aceitar todos os dados desta ficha serão perdidos permanentemente.';
   MsgFlags = MB_ICONQUESTION or MB_YESNO or MB_DEFBUTTON2;
   STituloExclusao = 'Confirmação';
   
   SSQLDeleteFichaIndividual =
      'DELETE                                 '+
      '   f.*                                 '+
      'FROM                                   '+
      '   fichaindividual f                   '+
      'WHERE f.codigoaluno = :codigoAluno     '+
      'AND f.turma = ''HISTORICO''            '+
      'AND f.turmamatricula = :turmaMatricula '+
      'AND f.disciplina = :disciplina         '+
      'AND f.curso = :curso                   ';
var
   qryDeletarFichaIndividual: TUMZQuery;

begin
   dbeAluno.SetFocus;
   if Trim(qryLogEquivalenciasTX_MOTIVO.AsString) = '' then
   begin
      MessageDlg(SSemMotivo, mtInformation, [mbOK], -1);
   end
   else
   begin
      if Mensagem(SConfirmaExclusaoFicha, '', MB_YESNO + MB_ICONQUESTION, Handle) = IDYES then
      begin
         dm.CriarConsulta(qryDeletarFichaIndividual);
         qryDeletarFichaIndividual.SQL.Text := (SSQLDeleteFichaIndividual);

         //Caso a instituição use ano semestre é adicionado a condição ao SQL.
         if (TUMNucleo.GetParametroUsaAnosemestre) then
         begin
            qryDeletarFichaIndividual.SQL.Add('AND anosemestre = :anosemestre');
         end;

         try
            qryDeletarFichaIndividual.ParamByName('codigoAluno').AsInteger :=
               qryAlunoCD_PESSOA.AsInteger;
            qryDeletarFichaIndividual.ParamByName('turmaMatricula').AsString :=
               GetTurmaMatricula;
            qryDeletarFichaIndividual.ParamByName('disciplina').AsInteger :=
               GetEquiDisciplina;
            qryDeletarFichaIndividual.ParamByName('curso').AsString :=
               FCurso;

            //Caso use ano semestre é passado o parametro para o SQL.
            if (TUMNucleo.GetParametroUsaAnosemestre) then
            begin
               qryDeletarFichaIndividual.ParamByName('anosemestre').AsInteger :=
                  GetAnoSemestre;
            end;

            qryDeletarFichaIndividual.ExecSQL;

            if (qryDeletarFichaIndividual.RowsAffected > 0) then
            begin
               qryLogEquivalenciasNR_FICHA_EXCLUIDA.AsString := 'S'
            end else
            begin
               qryLogEquivalenciasNR_FICHA_EXCLUIDA.AsString := 'N';
            end;

            qryLogEquivalencias.Post;

         finally
            qryDeletarFichaIndividual.Close;
         end;
      end
      else
      begin
         qryLogEquivalenciasNR_FICHA_EXCLUIDA.AsString := 'N';
         qryLogEquivalencias.Post;
      end;
      { Elimina a equivalência em outras instituições/cursos }
      qEliminaDisc.ParamByName('CODIGOALUNO').AsInteger := qryAlunoCD_PESSOA.AsInteger;
      qEliminaDisc.ParamByName('DISCIPLINA').AsInteger := GetEquiDisciplina;
      qEliminaDisc.ParamByName('CURSO').AsString := FCurso;
      qEliminaDisc.ExecSQL;

      { Elimina a diciplina da instituição correspondente }
      qEliminaEquiv.ParamByName('CODIGOALUNO').AsInteger := qryAlunoCD_PESSOA.AsInteger;
      qEliminaEquiv.ParamByName('DISCIPLINA').AsInteger := GetEquiDisciplina;
      qEliminaEquiv.ParamByName('CURSO').AsString := FCurso;
      qEliminaEquiv.ExecSQL;
      
      Close;
   end;
end;

function TfRegistraEliminEqui.CarregaEquivalencia: Boolean;
begin
   if qryEquivalencia.Active then
   begin
      qryEquivalencia.Close;
   end;

   qryEquivalencia.ParamByName('CD_EQUIVALENCIA').AsInteger := Equivalencia;
   qryEquivalencia.Open;

   if not qryEquivalencia.IsEmpty then
   begin
      Result := True;
      qryLogEquivalencias.Open;
      qryLogEquivalencias.Insert;
      qryLogEquivalenciasCD_USUARIO.AsInteger := DM.iCdPessoaLogado;
      qryLogEquivalenciasCD_ALUNO.AsInteger := qryEquivalenciaCODIGOALUNO.AsInteger;
      qryLogEquivalenciasCD_DISCIPLINA.AsInteger := qryEquivalenciaDISCIPLINA.AsInteger;
      qryLogEquivalenciasCD_CURSO.AsString := qryEquivalenciaCURSO.AsString;
      qryLogEquivalenciasCD_PROFESSOR_EQ.AsInteger := qryEquivalenciaCD_PROFESSOR.AsInteger;
      qryLogEquivalenciasNM_INSTITUICAO_EQ.AsString := qryEquivalenciaEQ_INSTITUICAO.AsString;
      qryLogEquivalenciasNM_CURSO_EQ.AsString := qryEquivalenciaEQ_CURSO.AsString;
      qryLogEquivalenciasNM_DISCIPLINA_EQ.AsString := qryEquivalenciaEQ_DISCIPLINA.AsString;
      qryLogEquivalenciasNR_ANOSEMESTRE_EQ.AsInteger := qryEquivalenciaEQ_ANOSEMESTRE.AsInteger;
      qryLogEquivalenciasVL_CARGA_HORARIA_EQ.AsFloat := qryEquivalenciaEQ_CH.AsFloat;
      qryLogEquivalenciasVL_NOTA_EQ.AsFloat := qryEquivalenciaEQ_NOTA.AsFloat;
      qryLogEquivalenciasVL_FREQUENCIA_EQ.AsFloat := qryEquivalenciaEQ_FREQUENCIA.AsFloat;
      qryLogEquivalenciasVL_CONTEUDO_EQ.AsFloat := qryEquivalenciaEQ_EQUIVALENCIA.AsFloat;
      qryLogEquivalenciasDS_CONCEITO_EQ.AsString := qryEquivalenciaDS_CONCEITO.AsString;
      qryLogEquivalenciasTP_ACAO.AsString := 'E';
      qryLogEquivalenciasCD_SITUACAO.AsInteger := 1;

      qrySituacoes.Open;
      qryUsuario.Open;
      qryAluno.Open;
      qryDisciplina.Open;
      qryCurso.Open;
      qryProfessor.Open;
   end
   else
   begin
      Result := False;
   end;
end;

procedure TfRegistraEliminEqui.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
   qryLogEquivalencias.Close;
   qrySituacoes.Close;
   qryUsuario.Close;
   qryAluno.Close;
   qryDisciplina.Close;
   qryCurso.Close;
   qryProfessor.Close;
   qryEquivalencia.Close;
   qExluiFichaIndividual.Close;
   Action := caFree;
end;


function TfRegistraEliminEqui.GetAnoSemestre: integer;
begin
   result := self.FAnoSemestre;
end;

function TfRegistraEliminEqui.GetEquiDisciplina: Integer;
begin
   result := Self.FEquiDisciplina;
end;

function TfRegistraEliminEqui.GetEquivalencia: Integer;
begin
   Result := FEquivalencia;
end;

function TfRegistraEliminEqui.GetTurmaMatricula: String;
begin
   result := FTurmaMatricula;
end;

procedure TfRegistraEliminEqui.qryEquivalenciaeq_disciplinaGetText(
  Sender: TField; var Text: string; DisplayText: Boolean);
begin
   Text := Copy(qryEquivalenciaeq_disciplina.AsString, 1, 1000);   
end;

procedure TfRegistraEliminEqui.qryLogEquivalenciasnm_disciplina_eqGetText(
  Sender: TField; var Text: string; DisplayText: Boolean);
begin
   Text := Copy(qryLogEquivalenciasnm_disciplina_eq.AsString, 1, 1000);
end;

procedure TfRegistraEliminEqui.qryProfessorAfterOpen(DataSet: TDataSet);
begin
   if qryProfessor.IsEmpty then
   begin
      qryLogEquivalenciasCD_PROFESSOR_EQ.Clear;
   end;
end;

procedure TfRegistraEliminEqui.SetAnoSemestre(const Value: Integer);
begin
   self.FAnoSemestre := Value;
end;

procedure TfRegistraEliminEqui.SetEquiDisciplina(value: Integer);
begin
   self.FEquiDisciplina := value;
end;

procedure TfRegistraEliminEqui.SetEquivalencia(const Value: Integer);
begin
   FEquivalencia := Value;
end;

procedure TfRegistraEliminEqui.SetTurmaMatricula(const Value: String);
begin
   FTurmaMatricula := Value;
end;

procedure TfRegistraEliminEqui.SetCurso(const Value: String);
begin
   FCurso := Value;
end;

end.
