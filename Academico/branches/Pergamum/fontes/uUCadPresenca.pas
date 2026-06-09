unit uUCadPresenca;

interface

uses
   Classes,  StdCtrls, SysUtils, uDisciplina, UMRadioButton, uAExecucao, DB,
   UZDataSet, uListaExecucao, uDMDiario, Forms;

type
   TDiarioAula = class
      private
         FDiarioAula : Integer;
         FQtdAulas : Integer;
         FFrequencia : String;
      public
         constructor Create(const cd_diario_aula: Integer);

         procedure AddFreq(const f: String);
         procedure AddAula();

         function Valida(): Boolean;

         property DiarioAula: Integer read FDiarioAula;
         property QtdAulas : Integer read FQtdAulas;
         property Frequencia : String read FFrequencia;
   end;

   TListaDiarioAulas = array of TDiarioAula;

   TListaAulas = class
      private
         FListaDiarioAulas : TListaDiarioAulas;
      public
         constructor Create();

         procedure AddDiarioAula(cd_diario_aula : Integer);
         function GetDiarioAula(const cd_diario_aula: Integer): TDiarioAula;

         function RegistrosValidos(): Boolean;

         property ListaDiarioAulas : TListaDiarioAulas read FListaDiarioAulas;
   end;

   TRadioButtonHorarioDisciplina = class(TUMRadioButton)
      strict private
         FHorario, FDiarioAula, FNroAula, FTurmaHorario: Integer;
         FDisciplina : TDisciplina;
         FFreq, FCharPadrao, FTurma : String;

      public
         LabelAdicional : TLabel;

         constructor Create(AOwner: TComponent; const LDisciplina: TDisciplina; const cd_horario,
            nr_aula, cd_turma_horario: Integer; const LCharPadrao, cd_turma: String); overload;

         destructor Destroy();

         property Horario : Integer read FHorario;
         property Disciplina : TDisciplina read FDisciplina;
         property DiarioAula : Integer read FDiarioAula;
         property NroAula : Integer read FNroAula;
         property Freq : String read FFreq;
         property FreqPadrao : String read FCharPadrao;
         property TurmaHorario : Integer read FTurmaHorario;
         property Turma : String read FTurma;
   end;

   TExecucaoInclusaoAula = class(AExecucao)
      strict protected
         FTurma, FFreq: String;
         FAnoSemestre, FDisciplina, FEtapa, FPessoa, FNroAula, FProfessor: Integer;
         FTurmaHorario : array of Integer;
         FData: TDateTime;

         function GetSQL(): String; override; final;
         procedure PrepareParams(var Parametros: TParams); override; final;

         function OnAfterSQLExecuteWithLastInsert(const last_insert_id: Integer; var qyExecucao: TUMZQuery): Boolean;

      public
         constructor Create(const cd_turma: String; const nr_anosemestre, cd_disciplina, nr_etapa, cd_turma_horario: Integer; data: TDateTime; const ds_freq: String; const cd_pessoa: Integer);

         function AddFreq(const ds_freq: String): TExecucaoInclusaoAula;
         function AddTurmaHorario(const cd_turma_horario: Integer): TExecucaoInclusaoAula;

         function Equals(const cd_turma: String; const nr_anosemestre, cd_disciplina, nr_etapa, 
                           cd_pessoa: Integer; dt_aula: TDateTime): Boolean;
   end;

   TAlterarFrequenciaAula = class(AExecucao)
      strict protected
         FFreq: String;
         FDiarioAula, FPessoa: Integer;

         function GetSQL(): String; override; final;
         procedure PrepareParams(var Parametros: TParams); override; final;

         function OnAfterSQLExecuteWithLastInsert(const last_insert_id: Integer; var qyExecucao: TUMZQuery): Boolean;
      public
         constructor Create(const cd_diario_aula: Integer; const ds_freq: String; const cd_pessoa: Integer);
   end;

   TListaExecucaoAulas = class(TListaExecucao)
      public
         function GetAulaExistente(const cd_turma: String; const nr_anosemestre, cd_disciplina, nr_etapa, cd_pessoa: Integer; dt_aula: TDateTime): TExecucaoInclusaoAula;
   end;

implementation

uses uLoginManager;

{ TRadioButtonHorarioDisciplina }

constructor TRadioButtonHorarioDisciplina.Create(AOwner: TComponent;
  const LDisciplina: TDisciplina; const cd_horario, nr_aula, cd_turma_horario: Integer; const LCharPadrao, cd_turma: String);
begin
   inherited Create(AOwner);

   LabelAdicional := nil;

   Self.FDisciplina := LDisciplina;
   Self.FHorario := cd_horario;
   Self.FDiarioAula := LDisciplina.adicionais.cd_diario_aula;
   Self.FNroAula := nr_aula;
   Self.FTurmaHorario := cd_turma_horario;
   Self.FTurma := cd_turma;

   if LDisciplina.adicionais.ds_freq = '' then
      LDisciplina.adicionais.ds_freq := ' ';

   Self.FFreq := Copy(LDisciplina.adicionais.ds_freq, nr_aula, 1);
   Self.FCharPadrao := LCharPadrao;

   Self.Checked := (FFreq = FCharPadrao);
end;

destructor TRadioButtonHorarioDisciplina.Destroy;
begin
   if LabelAdicional <> nil then
      FreeAndNil(LabelAdicional);

   inherited Destroy;
end;

{ TListaAulas }

procedure TListaAulas.AddDiarioAula(cd_diario_aula : Integer);
var
   tamanho: Integer;
begin
   if Self.GetDiarioAula(cd_diario_aula) = nil then
   begin
      tamanho := Length(FListaDiarioAulas);
      SetLength(FListaDiarioAulas, tamanho + 1);

      FListaDiarioAulas[tamanho] := TDiarioAula.Create(cd_diario_aula);
   end;

   Self.GetDiarioAula(cd_diario_aula).AddAula();
end;

constructor TListaAulas.Create();
begin
   inherited;
   SetLength(FListaDiarioAulas, 0);
end;

function TListaAulas.GetDiarioAula(const cd_diario_aula: Integer): TDiarioAula;
var
   I : Integer;
begin
   Result := nil;

   for I := 0 to Length(FListaDiarioAulas) - 1 do
   begin
      if FListaDiarioAulas[I].DiarioAula = cd_diario_aula then
      begin
         Result := FListaDiarioAulas[I];
         Exit;
      end;
   end;
end;

function TListaAulas.RegistrosValidos: Boolean;
var
   I : Integer;
begin
   Result := True;

   for I := 0 to Length(FListaDiarioAulas)-1 do
   begin
      if NOT(FListaDiarioAulas[I].Valida()) then
      begin
         Result := False;
         Exit;
      end;
   end;
end;

{ TDiarioAula }

procedure TDiarioAula.AddAula;
begin
   Inc(FQtdAulas);
end;

procedure TDiarioAula.AddFreq(const f: String);
begin
   Self.FFrequencia := Self.FFrequencia + f;
end;

constructor TDiarioAula.Create(const cd_diario_aula: Integer);
begin
   Self.FDiarioAula := cd_diario_aula;
   Self.FQtdAulas := 0;
   Self.FFrequencia := '';
end;

function TDiarioAula.Valida: Boolean;
begin
   Result := (
      ( ( Self.FDiarioAula = 0 ) AND ( Length(FFrequencia) = 1 ) AND ( FQtdAulas = 1 ) ) OR
      ( (FQtdAulas = Length(FFrequencia)) AND (Pos(' ', FFrequencia) = 0) )
   );
end;

{ TExecucaoInclusaoAula }

function TExecucaoInclusaoAula.AddFreq(const ds_freq: String): TExecucaoInclusaoAula;
begin
   Self.FFreq := Self.FFreq + ds_freq;
   Result := Self;
end;

function TExecucaoInclusaoAula.AddTurmaHorario(
  const cd_turma_horario: Integer): TExecucaoInclusaoAula;
var
   I : Integer;
begin
   I := Length(FTurmaHorario);

   SetLength(FTurmaHorario, I+1);
   FTurmaHorario[I] := cd_turma_horario;

   Result := Self;
end;

constructor TExecucaoInclusaoAula.Create(const cd_turma: String;
  const nr_anosemestre, cd_disciplina, nr_etapa, cd_turma_horario: Integer;
  data: TDateTime; const ds_freq: String; const cd_pessoa: Integer);
begin
   SetLength(FTurmaHorario, 0);
   Self.FOnAfterSQLExecuteWithLastInsert := OnAfterSQLExecuteWithLastInsert;

   Self.FTurma := cd_turma;
   Self.FAnoSemestre := nr_anosemestre;
   Self.FDisciplina := cd_disciplina;
   Self.FEtapa := nr_etapa;
   AddTurmaHorario(cd_turma_horario);
   Self.FData := data;
   Self.FFreq := ds_freq;
   Self.FPessoa := cd_pessoa;
   Self.FNroAula := -1;
end;

function TExecucaoInclusaoAula.Equals(const cd_turma: String;
  const nr_anosemestre, cd_disciplina, nr_etapa, 
  cd_pessoa: Integer; dt_aula: TDateTime): Boolean;
begin
   Result := (Self.FTurma = cd_turma) AND
             (Self.FAnoSemestre = nr_anosemestre) AND
             (Self.FEtapa = nr_etapa) AND
             (Self.FDisciplina = cd_disciplina) AND
             (Self.FPessoa = cd_pessoa) AND
             (Self.FData = dt_aula);
end;

function TExecucaoInclusaoAula.GetSQL: String;
begin
   Result := 'INSERT INTO diario_aulas ( ' +
             '   turma, anosemestre, disciplina, bimestre, nro_aula, data, ' +
             '   qtd_aulas, dt_envio, cd_professor ' +
             ') VALUES (' +
             '   :turma, :anosemestre, :disciplina, :bimestre, :nro_aula, :data, ' +
             '   :qtd_aulas, NOW(), :cd_professor ' +
             ')';
end;

function TExecucaoInclusaoAula.OnAfterSQLExecuteWithLastInsert(
  const last_insert_id: Integer; var qyExecucao: TUMZQuery): Boolean;
var
   I : Integer;
   logDesc : String;
begin
   Result := False;
   if Self.FNroAula < 1 then Exit;

   if DMDiario = nil then
   begin
      Application.CreateForm(TDMDiario, DMDiario);
      { Insere log de acesso ao diário }
      DMDiario.inserirLogAcesso;
   end;

   // Inserir log de alteração de aulas
   logDesc := '';
   logDesc := logDesc + 'Nro. Aula: '+IntToStr(Self.FNroAula)+', ';
   logDesc := logDesc + 'Data: '+FormatDateTime('dd-mm-yyyy', Self.FData)+', ';
   logDesc := logDesc + 'Qtd. Aulas: '+IntToStr(Length(Self.FFreq))+', ';
   logDesc := logDesc + 'Conteúdo: , ';
   logDesc := logDesc + 'Anosemestre: '+IntToStr(Self.FAnoSemestre)+', ';
   logDesc := logDesc + 'Turma: '+Self.FTurma+', ';
   logDesc := logDesc + 'Disciplina: '+IntToStr(Self.FDisciplina)+', ';
   logDesc := logDesc + 'Etapa: '+IntToStr(Self.FEtapa)+', aula criada através da "Digitação de Freq./Faltas por aluno" [Acadêmico]';

   // Insere log de inserção de aulas
   DMDiario.inserirLog(uDMDiario.ACAO_INCLUSAO, uDMDiario.ATIVIDADE_AULA, logDesc, Self.FProfessor);


   qyExecucao.SQL.Text := ' INSERT INTO diario_aulas_turmas_horarios( cd_diario_aula, cd_turma_horario ) VALUES ( :cd_diario_aula, :cd_turma_horario ) ';
   qyExecucao.ParamByName('cd_diario_aula').AsInteger := last_insert_id;

   for I := 0 to Length(FTurmaHorario) - 1 do
   begin
      qyExecucao.ParamByName('cd_turma_horario').AsInteger := Self.FTurmaHorario[I];
      qyExecucao.ExecSQL;
   end;

   qyExecucao.SQL.Clear();
   qyExecucao.Params.Clear();

   qyExecucao.SQL.Text := ' REPLACE INTO diario_aulas_alunos ( ' +
               '    cd_pessoa, cd_turma, nr_anosem, cd_disciplina, cd_bimestre, nr_aula, ds_freq ' +
               ' ) VALUES (' +
               '    :cd_pessoa, :cd_turma, :nr_anosem, :cd_disciplina, :cd_bimestre, :nr_aula, :ds_freq ' +
               ' ) ';

   qyExecucao.ParamByName('cd_pessoa').AsInteger := Self.FPessoa;
   qyExecucao.ParamByName('cd_turma').AsString := Self.FTurma;
   qyExecucao.ParamByName('nr_anosem').AsInteger := Self.FAnoSemestre;
   qyExecucao.ParamByName('cd_disciplina').AsInteger := Self.FDisciplina;
   qyExecucao.ParamByName('cd_bimestre').AsInteger := Self.FEtapa;
   qyExecucao.ParamByName('nr_aula').AsInteger := Self.FNroAula;
   qyExecucao.ParamByName('ds_freq').AsString := Self.FFreq;

   logDesc := '';
   logDesc := logDesc + 'Aluno: '+IntToStr(Self.FPessoa)+', ';
   logDesc := logDesc + 'Aula: '+IntToStr(Self.FNroAula)+', ';
   logDesc := logDesc + 'Frequência: '+Self.FFreq+', ';
   logDesc := logDesc + 'Anosemestre: '+IntToStr(Self.FAnoSemestre)+', ';
   logDesc := logDesc + 'Turma: '+Self.FTurma+', ';
   logDesc := logDesc + 'Disciplina: '+IntToStr(Self.FDisciplina)+', ';
   logDesc := logDesc + 'Etapa: '+IntToStr(Self.FEtapa)+' [Acadêmico]';

   // Insere log de alteração de frequencias
   DMDiario.inserirLog(uDMDiario.ACAO_ALTERACAO, uDMDiario.ATIVIDADE_FREQUENCIA, logDesc, Self.FProfessor);

   Result := True;
end;

procedure TExecucaoInclusaoAula.PrepareParams(var Parametros: TParams);
var
   qyGetNroAula : TUMZReadOnlyQuery;
   AProfessor : Integer;
begin
   TLoginManager.GetInstancia().GetDM.CriarConsulta(qyGetNroAula);
   qyGetNroAula.SQL.Text := 'SELECT COALESCE(MAX(nro_aula), 0)+1 AS nro_aula FROM diario_aulas WHERE turma = :turma AND ' +
             '           anosemestre = :anosemestre AND disciplina = :disciplina AND bimestre = :bimestre';
   qyGetNroAula.ParamByName('turma').AsString := Self.FTurma;
   qyGetNroAula.ParamByName('anosemestre').AsInteger := Self.FAnoSemestre;
   qyGetNroAula.ParamByName('disciplina').AsInteger := Self.FDisciplina;
   qyGetNroAula.ParamByName('bimestre').AsInteger := Self.FEtapa;
   qyGetNroAula.Open();

   Self.FNroAula := qyGetNroAula.FieldByName('nro_aula').AsInteger;

   qyGetNroAula.Close();
   qyGetNroAula.SQL.Text := 'SELECT professor FROM turmasprofessores WHERE turma = :turma AND anosemestre = :anosemestre AND disciplina = :disciplina LIMIT 1';
   qyGetNroAula.ParamByName('turma').AsString := FTurma;
   qyGetNroAula.ParamByName('anosemestre').AsInteger := FAnoSemestre;
   qyGetNroAula.ParamByName('disciplina').AsInteger := FDisciplina;
   qyGetNroAula.Open();

   AProfessor := 0;
   if qyGetNroAula.RecordCount = 1 then
   begin
      AProfessor := qyGetNroAula.FieldByName('professor').AsInteger;
      Self.FProfessor := AProfessor;
   end;

   FreeAndNil(qyGetNroAula);

   Parametros.ParamByName('turma').AsString := FTurma;
   Parametros.ParamByName('anosemestre').AsInteger := FAnoSemestre;
   Parametros.ParamByName('disciplina').AsInteger := FDisciplina;
   Parametros.ParamByName('bimestre').AsInteger := FEtapa;
   Parametros.ParamByName('nro_aula').AsInteger := Self.FNroAula;
   Parametros.ParamByName('data').AsDate := FData;
   Parametros.ParamByName('cd_professor').AsInteger := AProfessor;
   Parametros.ParamByName('qtd_aulas').AsInteger := Length(Self.FFreq);
end;

{ TAlterarFrequenciaAula }

constructor TAlterarFrequenciaAula.Create(const cd_diario_aula: Integer;
  const ds_freq: String; const cd_pessoa: Integer);
begin
   Self.FOnAfterSQLExecuteWithLastInsert := OnAfterSQLExecuteWithLastInsert;

   Self.FDiarioAula := cd_diario_aula;
   Self.FPessoa := cd_pessoa;
   Self.FFreq := ds_freq;
end;

function TAlterarFrequenciaAula.GetSQL: String;
begin
   Result := ' REPLACE INTO diario_aulas_alunos ( cd_pessoa, cd_turma, nr_anosem, cd_disciplina, cd_bimestre, nr_aula, ds_freq ) ' +
             ' SELECT :cd_pessoa, turma, anosemestre, disciplina, bimestre, nro_aula, :ds_freq FROM diario_aulas WHERE cd_diario_aula = :cd_diario_aula ';
end;
    
function TAlterarFrequenciaAula.OnAfterSQLExecuteWithLastInsert(
  const last_insert_id: Integer; var qyExecucao: TUMZQuery): Boolean;
var
   I : Integer;
   logDesc : String;
   qyGetDadosAula : TUMZReadOnlyQuery;
begin
   // Não é necessário inserir nada, apenas o log da frequência (por isso retorna false)
   Result := False;

   TLoginManager.GetInstancia().GetDM.CriarConsulta(qyGetDadosAula);

   qyGetDadosAula.Close();
   qyGetDadosAula.SQL.Text := 'SELECT anosemestre, turma, disciplina, bimestre, nro_aula, cd_professor FROM diario_aulas WHERE cd_diario_aula = :cd_diario_aula';
   qyGetDadosAula.ParamByName('cd_diario_aula').AsInteger := Self.FDiarioAula;
   qyGetDadosAula.Open();

   if qyGetDadosAula.RecordCount = 1 then
   begin
      if DMDiario = nil then
      begin
         Application.CreateForm(TDMDiario, DMDiario);
         { Insere log de acesso ao diário }
         DMDiario.inserirLogAcesso;
      end;

      logDesc := '';
      logDesc := logDesc + 'Aluno: '+IntToStr(Self.FPessoa)+', ';
      logDesc := logDesc + 'Aula: '+qyGetDadosAula.FieldByName('nro_aula').AsString+', ';
      logDesc := logDesc + 'Frequência: '+Self.FFreq+', ';
      logDesc := logDesc + 'Anosemestre: '+qyGetDadosAula.FieldByName('anosemestre').AsString+', ';
      logDesc := logDesc + 'Turma: '+qyGetDadosAula.FieldByName('turma').AsString+', ';
      logDesc := logDesc + 'Disciplina: '+qyGetDadosAula.FieldByName('disciplina').AsString+', ';
      logDesc := logDesc + 'Etapa: '+qyGetDadosAula.FieldByName('bimestre').AsString+' [Acadêmico]';

      // Insere log de alteração de frequencias
      DMDiario.inserirLog(uDMDiario.ACAO_ALTERACAO, uDMDiario.ATIVIDADE_FREQUENCIA, logDesc, qyGetDadosAula.FieldByName('cd_professor').AsInteger);
   end;

end;

procedure TAlterarFrequenciaAula.PrepareParams(var Parametros: TParams);
begin
   Parametros.ParamByName('cd_pessoa').AsInteger := Self.FPessoa;
   Parametros.ParamByName('ds_freq').AsString := Self.FFreq;
   Parametros.ParamByName('cd_diario_aula').AsInteger := Self.FDiarioAula;
end;

{ TListaExecucaoAulas }

function TListaExecucaoAulas.GetAulaExistente(const cd_turma: String;
  const nr_anosemestre, cd_disciplina, nr_etapa,
  cd_pessoa: Integer; dt_aula: TDateTime): TExecucaoInclusaoAula;
var
   I : Integer;
begin
   Result := nil;

   for I := 0 to Self.Count - 1 do
   begin
      if (Self.Item[I] is TExecucaoInclusaoAula) AND
         ( TExecucaoInclusaoAula(Self.Item[I]).Equals(cd_turma, nr_anosemestre, cd_disciplina, nr_etapa, 
  cd_pessoa, dt_aula) ) then
      begin
         Result := TExecucaoInclusaoAula(Self.Item[I]);
         Break;
      end;
   end;
end;

end.
