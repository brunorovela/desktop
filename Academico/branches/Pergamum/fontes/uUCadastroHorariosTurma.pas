unit uUCadastroHorariosTurma;

interface

uses
   SysUtils, Classes, Forms, Menus, Contnrs, Grids, Controls, Windows,
   uHorario, uListaDisciplinas, uDisciplina, uSubject, uObserver,
   uAExecucao, uListaExecucao, DB, UZDataset, uSala;

type
   TSituacaoGrid = (sgVazio, sgNormal, sgEditando);
   TModoGrid = (mgInsert, mgEdit, mgNone);
   TTipoExecucao = (teInsert, teDelete, teUpdate);
   TTipoExecucaoAula = (teaDelete, teaDeleteAulasAlunos, teaUpdate, teaUpdateExtra);

   TExecucaoHorarioTurma = class(AExecucao)
      strict private
         FTipoExecucao: TTipoExecucao;
         FDisciplina  : TDisciplina;
         FAnosemestre, FHorario, FDiaSemana, FtipoDeAlteracao : Integer;
         FLegenda, FCategoria: String;
         FDataInicio, FDataFim : TDate;
         FSala: TSala;

      strict protected
         function GetSQL(): String; override; final;
         procedure PrepareParams(var Parametros: TParams); override; final;

         procedure LogarExecucao();

      public
         constructor Create(const LTipoExecucao: TTipoExecucao;
            const LDisciplina: TDisciplina; const nr_anosemestre, cd_horario, nr_dia_semana: Integer;
            const ds_legenda: String = ''; const sala: TSala = nil; ds_categoria : String = ''; tipoDeAlteracao : Integer = 1);

         procedure SetDataInicio(LDataInicio: TDate);
         function getDataInicio():TDate;
         procedure SetDataFim(LDataFim: TDate);
         function getDataFim():TDate;

         property TipoExecucao: TTipoExecucao read FTipoExecucao;
         property Disciplina : TDisciplina read FDisciplina;
         property DiaSemana : Integer read FDiaSemana;
         property Horario : Integer read FHorario;
         property Categoria : String read FCategoria;
         property tipoDeAlteracao : Integer read FtipoDeAlteracao;
   end;

   TExecucaoAulaParametroLogs = class
      public
         nro_aula, nr_anosemestre, nr_etapa,
         cd_turma, nm_professor, ds_disciplina,
         data, horario_antigo, horario_novo : String;
   end;

   TExecucaoAula = class(AExecucao)
      strict private
         FTipoExecucao: TTipoExecucaoAula;
         FDataAula  : TDateTime;
         FDiarioAula, FTurmaHorario : Integer;
         FLogs : TExecucaoAulaParametroLogs;

      strict protected
         function GetSQL(): String; override; final;
         procedure PrepareParams(var Parametros: TParams); override; final;

         procedure LogarExecucao();
         procedure BeforeSQLExecute(var qyExecucao: TUMZQuery);

      public
         constructor Create(const LTipoExecucaoAula: TTipoExecucaoAula; const logs: TExecucaoAulaParametroLogs; const cd_diario_aula: Integer; const dt_aula: TDateTime = 0; const cd_turma_horario: Integer = -1);

         property TipoExecucao: TTipoExecucaoAula read FTipoExecucao;
   end;

   TExecucaoVinculoAula = class(AExecucao)
      strict private
         FDiarioAula, FTurmaHorario: Integer;

         function GetSQL(): String; override; final;
         procedure PrepareParams(var Parametros: TParams); override; final;

      public
         constructor Create(const cd_diario_aula, cd_turma_horario: Integer);
   end;

   TExecucaoHorarioAula = class(AExecucao)
      strict private
         Fcd_turma_horario: Integer;

         function GetSQL(): String; override; final;
         procedure PrepareParams(var Parametros: TParams); override; final;

      public
         constructor Create(cd_turma_horario: Integer);
   end;

   THorarioDiaSemana = class(THorario)
      strict private
         FDiasSemanaDisciplinas : Array[1..7] of TListaDisciplinas;

      public
         constructor Create(const cd_horario: Integer; const ds_horario, hr_inicio, ds_categoria: String); overload;

         procedure AdicionarDisciplina(const dia_semana: Integer; disciplina : TDisciplina);
         procedure LimparDisciplinas(const dia_semana: Integer);

         procedure DefinirLegenda(const dia_semana: Integer; ds_legenda: String);
         procedure DefinirSala(const dia_semana: Integer; sala: TSala);

         function GetLegenda(const dia_semana: Integer): String;
         function GetSala(const dia_semana: Integer): TSala;

         function GetDisciplinasDiaSemana(const dia_semana: Integer): TListaDisciplinas;
   end;

   TMenuItemDisciplina = class(TMenuItem)
      strict private
         FDisciplina : TDisciplina;
      public
         constructor Create(AOwner: TComponent; disciplina : TDisciplina); overload;

         property Disciplina : TDisciplina read FDisciplina;
   end;

   THorariosTurma = class(TObject)
      strict protected
         FListaHorarios : TObjectList;
         procedure SetListaHorarios(Lista: TObjectList);

      public
         constructor Create();

         procedure Clear(); virtual;
         procedure AddHorario(Horario : THorarioDiaSemana); virtual;

         function GetListaHorarios: TObjectList;
         function FindHorarioDiaSemana(const cd_horario: Integer): THorarioDiaSemana;
         function FindHorarioLinhaGrid(const nr_linha: Integer): THorarioDiaSemana;
         function HorarioExiste(const cd_horario: Integer): Boolean;
   end;

   THorariosTurmaGrid = class(THorariosTurma)
      strict private
         FSituacao : TSituacaoGrid;
         FModo : TModoGrid;

         Grid : TStringGrid;
         FSubject : TSubject;

         FListaHorarioBkp : THorariosTurma;

         procedure InternalDraw();
         function FindHorarioLinhaGrid(const nr_linha: Integer): THorarioDiaSemana;
         function GetListaDisciplinas(const nr_linha, nr_coluna: Integer): TListaDisciplinas;

         procedure SetSituacao(LSituacao: TSituacaoGrid);
         procedure SetModo(LModo: TModoGrid);

      public
         constructor Create(var Grid: TStringGrid);
         procedure Draw();
         procedure LimparDisciplinas(const nr_linha, nr_coluna: Integer);
         procedure LimparDisciplinasGrade(const nr_linha, nr_coluna: Integer);

         procedure AddHorario(Horario : THorarioDiaSemana); override;

         procedure AdicionarDisciplina(const cd_horario, dia_semana : Integer; const disciplina : TDisciplina);
         procedure AdicionarDisciplinaGrid(const nr_linha, nr_coluna: Integer; const disciplina : TDisciplina);

         procedure DefinirLegenda(const cd_horario, dia_semana : Integer; const ds_legenda : String);
         procedure DefinirLegendaGrid(const nr_linha, nr_coluna: Integer; const ds_legenda : String);
         procedure DefinirSala(const cd_horario, dia_semana : Integer; const sala : TSala);
         procedure DefinirSalaGrid(const nr_linha, nr_coluna: Integer; const sala : TSala);

         function GetLegendaGrid(const nr_linha, nr_coluna: Integer): String;
         function GetSalaGrid(const nr_linha, nr_coluna: Integer): TSala;
         function GetQtdDisciplinasGrid(const nr_linha, nr_coluna: Integer): Integer;

         function TemDisciplinaGrid(const nr_linha, nr_coluna: Integer; const disciplina: TDisciplina): Boolean;
         function GetListaHorariosDasDisciplinas(): TStringList;
         function GetListaDisciplinasHorarios(): TStringList;

         function GetListaExecucao( const nr_anosemestre: Integer; tipo_alteracao: Integer = -1 ): TListaExecucao;

         procedure Edit();
         procedure Revert();
         procedure Clear(); override;

         property Subject : TSubject read FSubject;
         property Situacao : TSituacaoGrid read FSituacao;
         property Modo : TModoGrid read FModo;
   end;

   TComponentHorariosTurmasObserver = class(TObserver)
      strict private
         FComponente : TControl;
         FGridHorariosTurmas : THorariosTurmaGrid;
         FOnEditEnabled : Boolean;
      public
         constructor Create(Componente : TControl; GridHorariosTurmas: THorariosTurmaGrid; OnEditEnabled : Boolean);

         procedure Update; override;
   end;

implementation

uses uGeneral, uDM, General, uItemCombo;

{ TMenuItemDisciplina }

constructor TMenuItemDisciplina.Create(AOwner: TComponent; disciplina : TDisciplina);
begin
   inherited Create(AOwner);
   Self.FDisciplina := disciplina;
end;

{ THorariosTurma }

procedure THorariosTurma.AddHorario(Horario: THorarioDiaSemana);
begin
   FListaHorarios.Add(Horario);
end;

procedure THorariosTurma.Clear;
begin
   FListaHorarios.Clear();
end;

constructor THorariosTurma.Create();
begin
   FListaHorarios := TObjectList.Create;
end;

function THorariosTurma.FindHorarioDiaSemana(
  const cd_horario: Integer): THorarioDiaSemana;
var
   I : Integer;
begin
   Result := nil;
   for I := 0 to FListaHorarios.Count - 1 do
   begin
      if THorarioDiaSemana(FListaHorarios[I]).Codigo = cd_horario then
      begin
         Result := THorarioDiaSemana(FListaHorarios[I]);
         Break;
      end;
   end;
end;

function THorariosTurma.FindHorarioLinhaGrid(
  const nr_linha: Integer): THorarioDiaSemana;
begin
   Result := nil;

   if (nr_linha >= 0) AND (nr_linha < FListaHorarios.Count) then
   begin
      Result := THorarioDiaSemana(FListaHorarios[nr_linha]);
   end;
end;

function THorariosTurma.GetListaHorarios: TObjectList;
begin
   Result := Self.FListaHorarios;
end;

function THorariosTurma.HorarioExiste(const cd_horario: Integer): Boolean;
begin
   Result := FindHorarioDiaSemana(cd_horario) is THorarioDiaSemana;
end;

procedure THorariosTurma.SetListaHorarios(Lista: TObjectList);
begin
   Self.FListaHorarios := Lista;
end;

{ THorarioDiaSemana }

procedure THorarioDiaSemana.AdicionarDisciplina(const dia_semana: Integer;
  disciplina: TDisciplina);
begin
   if ( dia_semana < 1 ) OR ( dia_semana > 7 ) then
   begin
      raise Exception.Create('O dia da semana deve ser entre 1 e 7');
      Exit;
   end;

   FDiasSemanaDisciplinas[dia_semana].Add(disciplina);
end;

constructor THorarioDiaSemana.Create(const cd_horario: Integer;
  const ds_horario, hr_inicio, ds_categoria: String);
var
   I : Integer;
begin
   inherited Create(cd_horario, ds_horario, hr_inicio, ds_categoria);

   for I := 1 to 7 do
   begin
      FDiasSemanaDisciplinas[I] := TListaDisciplinas.Create();
   end;
end;

procedure THorarioDiaSemana.DefinirLegenda(const dia_semana: Integer;
  ds_legenda: String);
begin
   if ( dia_semana < 1 ) OR ( dia_semana > 7 ) then
   begin
      raise Exception.Create('O dia da semana deve ser entre 1 e 7');
      Exit;
   end;

   FDiasSemanaDisciplinas[dia_semana].adicionais.ds_legenda := ds_legenda;
end;

procedure THorarioDiaSemana.DefinirSala(const dia_semana: Integer; sala: TSala);
begin
   if ( dia_semana < 1 ) OR ( dia_semana > 7 ) then
   begin
      raise Exception.Create('O dia da semana deve ser entre 1 e 7');
      Exit;
   end;

   FDiasSemanaDisciplinas[dia_semana].adicionais.sala := sala;
end;

function THorarioDiaSemana.GetDisciplinasDiaSemana(
  const dia_semana: Integer): TListaDisciplinas;
begin
   Result := FDiasSemanaDisciplinas[dia_semana];
end;

function THorarioDiaSemana.GetLegenda(const dia_semana: Integer): String;
begin
   Result := FDiasSemanaDisciplinas[dia_semana].adicionais.ds_legenda;
end;

function THorarioDiaSemana.GetSala(const dia_semana: Integer): TSala;
begin
   Result := FDiasSemanaDisciplinas[dia_semana].adicionais.sala;
end;

procedure THorarioDiaSemana.LimparDisciplinas(const dia_semana: Integer);
begin
   FDiasSemanaDisciplinas[dia_semana].Clear();
end;

{ THorariosTurmaGrid }

procedure THorariosTurmaGrid.AddHorario(Horario: THorarioDiaSemana);
var
   New : THorarioDiaSemana;
begin
   SetModo(mgInsert);
   inherited AddHorario(Horario);

   New := THorarioDiaSemana.Create(Horario.Codigo, Horario.Descricao, Horario.HoraInicio, Horario.Categoria);
   FListaHorarioBkp.AddHorario(New);
end;

procedure THorariosTurmaGrid.AdicionarDisciplina(const cd_horario,
  dia_semana: Integer; const disciplina: TDisciplina);
begin
   SetModo(mgEdit);
   FindHorarioDiaSemana(cd_horario).AdicionarDisciplina( dia_semana, disciplina );
   FListaHorarioBkp.FindHorarioDiaSemana(cd_horario).AdicionarDisciplina( dia_semana, disciplina.Clone() );
end;

procedure THorariosTurmaGrid.AdicionarDisciplinaGrid(const nr_linha,
  nr_coluna: Integer; const disciplina: TDisciplina);
begin
   SetSituacao(sgEditando);
   FindHorarioLinhaGrid(nr_linha).AdicionarDisciplina(nr_coluna-1, disciplina.Clone);
   InternalDraw();
end;

procedure THorariosTurmaGrid.Clear;
begin
   inherited Clear();
   FListaHorarioBkp.Clear();
end;

constructor THorariosTurmaGrid.Create(var Grid: TStringGrid);
var
   I : Integer;
begin
   inherited Create();
   FListaHorarioBkp := THorariosTurma.Create;

   Self.Grid := Grid;
   FSubject := TSubject.Create();

   // Define a primeira coluna com tamanho 210px
   Self.Grid.ColWidths[0] := 210;

   for I := 1 to 7 do
   begin
      Self.Grid.Cells[I+1,0] := TGeneral.GetDescricaoDiaSemana(I);
   end;

   SetSituacao(sgVazio);
   SetModo(mgNone);
end;

procedure THorariosTurmaGrid.DefinirLegenda(const cd_horario,
  dia_semana: Integer; const ds_legenda: String);
begin
   SetModo(mgEdit);
   FindHorarioDiaSemana(cd_horario).DefinirLegenda(dia_semana, ds_legenda);
   FListaHorarioBkp.FindHorarioDiaSemana(cd_horario).DefinirLegenda( dia_semana, ds_legenda );
end;

procedure THorariosTurmaGrid.DefinirLegendaGrid(const nr_linha,
  nr_coluna: Integer; const ds_legenda: String);
begin
   SetSituacao(sgEditando);
   FindHorarioLinhaGrid(nr_linha).DefinirLegenda(nr_coluna-1, ds_legenda);
end;

procedure THorariosTurmaGrid.DefinirSala(const cd_horario, dia_semana: Integer;
  const sala: TSala);
begin
   SetModo(mgEdit);
   FindHorarioDiaSemana(cd_horario).DefinirSala(dia_semana, sala);
   FListaHorarioBkp.FindHorarioDiaSemana(cd_horario).DefinirSala( dia_semana, sala );
end;

procedure THorariosTurmaGrid.DefinirSalaGrid(const nr_linha, nr_coluna: Integer;
  const sala: TSala);
begin
   SetSituacao(sgEditando);
   FindHorarioLinhaGrid(nr_linha).DefinirSala(nr_coluna-1, sala);
end;

procedure THorariosTurmaGrid.Draw;
begin
   InternalDraw();
   SetSituacao(sgNormal);
end;

procedure THorariosTurmaGrid.Edit;
begin
   Self.SetSituacao(sgEditando);
end;

function THorariosTurmaGrid.FindHorarioLinhaGrid(
  const nr_linha: Integer): THorarioDiaSemana;
begin
   if (nr_linha < 1) OR ( nr_linha > FListaHorarios.Count ) then
   begin
      raise Exception.Create('Número de linha inválida.');
   end;

   Result := THorarioDiaSemana(FListaHorarios[nr_linha-1]); 
end;

function THorariosTurmaGrid.GetLegendaGrid(const nr_linha,
  nr_coluna: Integer): String;
begin
   Result := FindHorarioLinhaGrid(nr_linha).GetLegenda(nr_coluna-1);
end;

{
   Retorna um objeto disciplina que está na grade, de acordo com
   a linha e a coluna
}
function THorariosTurmaGrid.GetListaDisciplinas(const nr_linha,
  nr_coluna: Integer): TListaDisciplinas;
begin
   Result := FindHorarioLinhaGrid(nr_linha).GetDisciplinasDiaSemana(nr_coluna-1);
end;

function THorariosTurmaGrid.GetListaDisciplinasHorarios: TStringList;
var
   I, J, K : Integer;
   HorarioDiaSemana : THorarioDiaSemana;
   ListaDisciplinas : TListaDisciplinas;
   aa : TItemCombo;
   resultado : TStringList;
begin
   resultado := TStringList.Create;

   for I := 0 to FListaHorarios.Count - 1 do
   begin
      HorarioDiaSemana := THorarioDiaSemana(FListaHorarios[I]);

      for J := 1 to 7 do
      begin
         ListaDisciplinas := HorarioDiaSemana.GetDisciplinasDiaSemana(J);

         for K := 0 to ListaDisciplinas.Count - 1 do
         begin
            //Codigo Horario - Dia Semana - Desc Disc
            resultado.Add(inttostr(HorarioDiaSemana.Codigo) + '|' + inttostr(J)+ '|' + ListaDisciplinas.Items[K].Descricao );
         end;
      end;
   end;

   result := resultado;
end;

function THorariosTurmaGrid.GetListaExecucao( const nr_anosemestre: Integer; tipo_alteracao: Integer ): TListaExecucao;
var
   KHorario, KDiaSemana, K : Integer;
   LListaDisciplinas, LListaDisciplinasBkp : TListaDisciplinas;

   HorarioDiaSemana, HorarioDiaSemanaBkp: THorarioDiaSemana;
begin
   Result := TListaExecucao.Create();

   for KHorario := 0 to FListaHorarios.Count - 1 do
   begin
      HorarioDiaSemana := THorarioDiaSemana(Self.GetListaHorarios[KHorario]);
      HorarioDiaSemanaBkp := THorarioDiaSemana(FListaHorarioBkp.GetListaHorarios[KHorario]);

      for KDiaSemana := 1 to 7 do
      begin
         LListaDisciplinas := HorarioDiaSemana.GetDisciplinasDiaSemana(KDiaSemana);
         LListaDisciplinasBkp := HorarioDiaSemanaBkp.GetDisciplinasDiaSemana(KDiaSemana);

         for K := 0 to LListaDisciplinasBkp.Count - 1 do
         begin
            if LListaDisciplinas.IndexOf(LListaDisciplinasBkp.Items[K]) = -1 then
            begin
               Result.Add(TExecucaoHorarioTurma.Create( teDelete, LListaDisciplinasBkp.Items[K], nr_anosemestre, HorarioDiaSemana.Codigo, KDiaSemana, '', nil, HorarioDiaSemana.Categoria, tipo_alteracao ));
            end;
         end;

         for K := 0 to LListaDisciplinas.Count - 1 do
         begin
            if LListaDisciplinasBkp.IndexOf(LListaDisciplinas.Items[K]) = -1 then
            begin
               // Foi inserido
               Result.Add(TExecucaoHorarioTurma.Create( teInsert, LListaDisciplinas.Items[K], nr_anosemestre, HorarioDiaSemana.Codigo, KDiaSemana, LListaDisciplinas.adicionais.ds_legenda, LListaDisciplinas.adicionais.sala, '', tipo_alteracao ));
            end else begin
               // Não teve mudança de disciplina, porém, a legenda pode ter sido mudada
               if ( LListaDisciplinas.adicionais.ds_legenda <> LListaDisciplinasBkp.adicionais.ds_legenda ) then
               begin
                  Result.Add(TExecucaoHorarioTurma.Create( teUpdate, LListaDisciplinas.Items[K], nr_anosemestre, HorarioDiaSemana.Codigo, KDiaSemana, LListaDisciplinas.adicionais.ds_legenda, LListaDisciplinas.adicionais.sala, '', tipo_alteracao ));
               end;

               if ( LListaDisciplinas.adicionais.sala <> LListaDisciplinasBkp.adicionais.sala ) then
               begin
                  Result.Add(TExecucaoHorarioTurma.Create( teUpdate, LListaDisciplinas.Items[K], nr_anosemestre, HorarioDiaSemana.Codigo, KDiaSemana, LListaDisciplinas.adicionais.ds_legenda, LListaDisciplinas.adicionais.sala, '', tipo_alteracao ));
               end;
            end;
         end;
      end;
   end;
end;

function THorariosTurmaGrid.GetListaHorariosDasDisciplinas(): TStringList;
var
   I, J, K : Integer;
   HorarioDiaSemana : THorarioDiaSemana;
   ListaDisciplinas : TListaDisciplinas;
   aa : TItemCombo;
begin
   Result := TStringList.Create;

   for I := 0 to FListaHorarios.Count - 1 do
   begin
      HorarioDiaSemana := THorarioDiaSemana(FListaHorarios[I]);

      for J := 1 to 7 do
      begin
         ListaDisciplinas := HorarioDiaSemana.GetDisciplinasDiaSemana(J);

         for K := 0 to ListaDisciplinas.Count - 1 do
         begin
            if Result.IndexOf(IntToStr(ListaDisciplinas.Items[K].Codigo)) = -1 then
            begin
               Result.Objects[Result.Add(IntToStr(ListaDisciplinas.Items[K].Codigo))] := TStringList.Create;
            end;

            TStringList(Result.Objects[Result.IndexOf(IntToStr(ListaDisciplinas.Items[K].Codigo))]).AddObject(
               TGeneral.GetDescricaoDiaSemana(J) + ' - ' + HorarioDiaSemana.Descricao,
               TItemCombo.Create(
                  IntToStr(HorarioDiaSemana.Codigo),
                  TGeneral.GetDescricaoDiaSemana(J) + ' - ' + HorarioDiaSemana.Descricao,
                  -1,
                  J
               )
            );
         end;
      end; 
   end;
end;

function THorariosTurmaGrid.GetQtdDisciplinasGrid(const nr_linha,
  nr_coluna: Integer): Integer;
begin
   Result := GetListaDisciplinas(nr_linha, nr_coluna).Count;
end;

function THorariosTurmaGrid.GetSalaGrid(const nr_linha,
  nr_coluna: Integer): TSala;
begin
   Result := FindHorarioLinhaGrid(nr_linha).GetSala(nr_coluna-1);
end;

procedure THorariosTurmaGrid.InternalDraw;
var
   I, J, K : Integer;
   Horario : THorarioDiaSemana;
   ColaSiglas : String;
begin
   Self.Grid.RowCount := FListaHorarios.Count + 1;

   for I := 1 to Self.Grid.RowCount - 1 do
   begin
      Horario := THorarioDiaSemana(FListaHorarios[I-1]);
      Grid.Cells[0,I] := Horario.Descricao;
      Grid.Cells[1,I] := System.Copy(Horario.HoraInicio, 1, 5);

      for J := 1 to 7 do
      begin
         ColaSiglas := '';
         Grid.Cells[J+1, I] := '';

         for K := 0 to Horario.GetDisciplinasDiaSemana(J).Count - 1 do
         begin

            Grid.Cells[J+1, I] := Grid.Cells[J+1, I] + ColaSiglas +
              Horario.GetDisciplinasDiaSemana(J).Items[K].Sigla;

            if (Horario.GetDisciplinasDiaSemana(J).Items[K].adicionais.cd_professor = 0) then
              Grid.Cells[J+1, I] := Grid.Cells[J+1, I] + ' <sem professor>';


            if Horario.GetDisciplinasDiaSemana(J).Items[K].adicionais.cd_turma <>
               Horario.GetDisciplinasDiaSemana(J).Items[K].adicionais.cd_turma_base then
            begin
               Grid.Cells[J+1, I] := Grid.Cells[J+1, I] + ' (' + Horario.GetDisciplinasDiaSemana(J).Items[K].adicionais.cd_turma + ')';
            end;

            ColaSiglas := '/';
         end;
      end;

      Application.ProcessMessages;
   end;
end;

procedure THorariosTurmaGrid.LimparDisciplinas(const nr_linha,
  nr_coluna: Integer);
begin                                                                          
   SetSituacao(sgEditando);
   FindHorarioLinhaGrid(nr_linha).GetDisciplinasDiaSemana(nr_coluna-1).Clear();
   InternalDraw();
end;

procedure THorariosTurmaGrid.LimparDisciplinasGrade(const nr_linha,
  nr_coluna: Integer);
begin
   FindHorarioLinhaGrid(nr_linha).GetDisciplinasDiaSemana(nr_coluna-1).Clear();
   InternalDraw();
end;

procedure THorariosTurmaGrid.Revert;
var
   I, J, K : Integer;
   LListaDisciplinas : TListaDisciplinas;
begin
   for I := 0 to FListaHorarios.Count - 1 do
   begin
      for J := 1 to 7 do
      begin
         THorarioDiaSemana(FListaHorarios[I]).LimparDisciplinas(J);
         THorarioDiaSemana(FListaHorarios[I]).DefinirLegenda(J, THorarioDiaSemana(FListaHorarioBkp.GetListaHorarios[I]).GetLegenda(J));

         LListaDisciplinas := THorarioDiaSemana(FListaHorarioBkp.GetListaHorarios[I]).GetDisciplinasDiaSemana(J);
         for K := 0 to LListaDisciplinas.Count - 1 do
         begin
            THorarioDiaSemana(FListaHorarios[I]).AdicionarDisciplina(J, LListaDisciplinas.Items[K].Clone);
         end;
      end;
   end;
end;

procedure THorariosTurmaGrid.SetModo(LModo: TModoGrid);
begin
   Self.FModo := LModo;
end;

procedure THorariosTurmaGrid.SetSituacao(LSituacao: TSituacaoGrid);
begin
   Self.FSituacao := LSituacao;
   Self.Subject.NotifyAll();
end;

{ Esta função deve indicar se a disciplina enviada por parametro
   na linha e na coluna já existe,  o parametro se utilizado ira indicar se ela existe na grade }
function THorariosTurmaGrid.TemDisciplinaGrid(const nr_linha, nr_coluna: Integer;
   const disciplina: TDisciplina): Boolean;
begin
   Result := (GetListaDisciplinas(nr_linha, nr_coluna).IndexOf(disciplina) > -1);
end;

{ TComponentHorariosTurmasObserver }

constructor TComponentHorariosTurmasObserver.Create(Componente : TControl;
   GridHorariosTurmas: THorariosTurmaGrid; OnEditEnabled : Boolean);
begin
   Self.FComponente := Componente;
   Self.FGridHorariosTurmas := GridHorariosTurmas;
   Self.FOnEditEnabled := OnEditEnabled;
end;

procedure TComponentHorariosTurmasObserver.Update;
begin
   if Self.FComponente.Visible then
   begin
      if Self.FGridHorariosTurmas.Situacao = sgEditando then
      begin
         Self.FComponente.Enabled := Self.FOnEditEnabled;
      end else begin
         Self.FComponente.Enabled := not Self.FOnEditEnabled;
      end;
   end;
end;

{ TExecucaoHorarioTurma }

constructor TExecucaoHorarioTurma.Create(const LTipoExecucao: TTipoExecucao;
  const LDisciplina: TDisciplina; const nr_anosemestre, cd_horario, nr_dia_semana: Integer;
  const ds_legenda: String; const sala: TSala; ds_categoria : String; tipoDeAlteracao : Integer);
begin
   Self.FOnAfterSQLExecute := Self.LogarExecucao;

   Self.FTipoExecucao := LTipoExecucao;
   Self.FDisciplina := LDisciplina;
   Self.FAnosemestre := nr_anosemestre;
   Self.FHorario := cd_horario;
   Self.FDiaSemana := nr_dia_semana;
   Self.FLegenda := ds_legenda;
   Self.FSala := sala;
   Self.FCategoria := ds_categoria;

   Self.FDataInicio := 0;
   Self.FDataFim := 0;
   Self.FtipoDeAlteracao := tipoDeAlteracao;
end;

function TExecucaoHorarioTurma.getDataFim: TDate;
begin
   result := self.FDataFim;
end;

function TExecucaoHorarioTurma.getDataInicio: TDate;
begin
   result := self.FDataInicio;
end;

function TExecucaoHorarioTurma.GetSQL: String;
begin
   if FTipoExecucao = teInsert then
   begin
      Result := ' INSERT INTO turmas_horarios_config ( ' +
                '    nr_anosemestre, cd_turma, cd_turma_base, cd_disciplina, ' +
                '    cd_horario, nr_dia_semana, ds_legenda, dt_inicial, dt_final, sn_ativo, cd_professor, cd_sala ' +
                ' ) VALUES ( ' +
                '    :nr_anosemestre, :cd_turma, :cd_turma_base, :cd_disciplina, ' +
                '    :cd_horario, :nr_dia_semana, :ds_legenda, :dt_inicial, NULL, 1, :cd_professor, :cd_sala ' +
                ' ) ON DUPLICATE KEY UPDATE ' +
                '        ds_legenda = values(ds_legenda), ' +
                '        cd_sala = values(cd_sala), ' +
                '        dt_inicial = values(dt_inicial), ' +
                '        dt_final = values(dt_final), ' +
                '        sn_ativo = values(sn_ativo)';
   end
   else if FTipoExecucao = teUpdate then
   begin
      Result := ' UPDATE turmas_horarios_config  ' +
                ' SET ds_legenda = :ds_legenda, cd_sala = :cd_sala ' +
                ' WHERE ' +
                '    nr_anosemestre = :nr_anosemestre AND cd_turma = :cd_turma AND ' +
                '    cd_turma_base = :cd_turma_base AND cd_disciplina = :cd_disciplina AND ' +
                '    cd_horario = :cd_horario AND nr_dia_semana = :nr_dia_semana ';
   end
   else if FTipoExecucao = teDelete then
   begin
      Result := ' UPDATE turmas_horarios_config  ' +
                ' SET sn_ativo = 0, dt_final = CASE WHEN :dt_final IS NULL THEN SUBDATE(NOW(), 1) ELSE :dt_final END' +
                ' WHERE ' +
                '    nr_anosemestre = :nr_anosemestre AND cd_turma = :cd_turma AND ' +
                '    cd_turma_base = :cd_turma_base AND cd_disciplina = :cd_disciplina AND ' +
                '    cd_horario = :cd_horario AND nr_dia_semana = :nr_dia_semana ';
   end;
end;

procedure TExecucaoHorarioTurma.LogarExecucao;
const
   OBS_INCLUSAO = 'Incluído nova disciplina para a turma "%s"%s, no horário "%d", no dia da semana "%s", disciplina "%s", professor "%d", data de inicio do horário "%s", data de fim do horário "%s", tipo de alteração: "%d"';
   OBS_EXCLUSAO = 'Exclusão da disciplina "%s" da turma "%s"%s, no horário "%d", no dia da semana "%s"';
   OBS_ALTERACAO = 'Alterada legenda do horário "%d", no dia da semana "%s", da turma "%s"%s, da disciplina "%s", professor "%d", data de inicio do horário "%s", data de fim do horário "%s", tipo de alteração: "%d". Para: "%s"';
   OBS_ALTERACAO_SALA = 'Alterada sala do horário "%d", no dia da semana "%s", da turma "%s"%s, da disciplina "%s". Para: "%s" (Código: %s)';
   FORMATO_CHAVE_LOG = '%s:%s:%d:%d:%d';
var
   Tipo, Obs, Turma, TurmaBase, DescTurmaBase: String;
begin
   TurmaBase := FDisciplina.adicionais.cd_turma_base;
   Turma := FDisciplina.adicionais.cd_turma;
   DescTurmaBase := '';

   if Turma <> TurmaBase then
   begin
      DescTurmaBase := ' (Turma Base: ' + TurmaBase + ')';
   end;

   case FTipoExecucao of
      teInsert: begin
         Tipo := 'Inclusao';
         Obs := Format(OBS_INCLUSAO, [Turma, DescTurmaBase, FHorario, gaDiasSemana[FDiaSemana], FDisciplina.Descricao, FDisciplina.adicionais.cd_professor, DateTimeToStr(FDataInicio), DateTimeToStr(FDataFim), FtipoDeAlteracao]);
      end;
      teDelete: begin
         Tipo := 'Exclusao';
         Obs := Format(OBS_EXCLUSAO, [FDisciplina.Descricao, Turma, DescTurmaBase, FHorario, gaDiasSemana[FDiaSemana]]);
      end;
      teUpdate: begin
         Tipo := 'Alteracao';
         Obs := Format(OBS_ALTERACAO, [FHorario, gaDiasSemana[FDiaSemana], Turma, DescTurmaBase, FDisciplina.Descricao, FDisciplina.adicionais.cd_professor, DateTimeToStr(FDataInicio), DateTimeToStr(FDataFim), FtipoDeAlteracao, FLegenda]);

         if FSala <> nil then
         begin
            DM.setLog(30004, Tipo, Format( FORMATO_CHAVE_LOG, [Turma, TurmaBase, FDisciplina.Codigo, FHorario, FDiaSemana] ), 0,
               Format(OBS_ALTERACAO_SALA, [FHorario, gaDiasSemana[FDiaSemana], Turma, DescTurmaBase, FDisciplina.Descricao, FSala.Descricao, IntToStr(FSala.Codigo)]));
         end;
      end;
   end;

   DM.setLog(30004, Tipo, Format( FORMATO_CHAVE_LOG, [Turma, TurmaBase, FDisciplina.Codigo, FHorario, FDiaSemana] ), 0, Obs);
end;

procedure TExecucaoHorarioTurma.PrepareParams(var Parametros: TParams);
begin
   Parametros.ParamByName('nr_anosemestre').AsInteger := FAnosemestre;
   Parametros.ParamByName('cd_turma').AsString := FDisciplina.adicionais.cd_turma;
   Parametros.ParamByName('cd_turma_base').AsString := FDisciplina.adicionais.cd_turma_base;
   Parametros.ParamByName('cd_horario').AsInteger := FHorario;
   Parametros.ParamByName('nr_dia_semana').AsInteger := FDiaSemana;
   Parametros.ParamByName('cd_disciplina').AsInteger := FDisciplina.Codigo;

   if FTipoExecucao IN [ teInsert ] then
   begin
      Parametros.ParamByName('cd_professor').AsInteger := FDisciplina.adicionais.cd_professor;
   end;

   if Parametros.FindParam('dt_inicial') <> nil then
   begin
      if Self.FDataInicio = 0 then
      begin
         Parametros.ParamByName('dt_inicial').Clear();
      end else begin
         Parametros.ParamByName('dt_inicial').AsDate := Self.FDataInicio;
      end;
   end;

   if Parametros.FindParam('dt_final') <> nil then
   begin
      if Self.FDataFim = 0 then
      begin
         Parametros.ParamByName('dt_final').Clear();
      end else begin
         Parametros.ParamByName('dt_final').AsDate := Self.FDataFim;
      end;
   end;

   if FTipoExecucao IN [ teInsert, teUpdate ] then
   begin
      Parametros.ParamByName('ds_legenda').AsString := FLegenda;

      if FSala = nil then
      begin
         Parametros.ParamByName('cd_sala').Clear;
      end else begin
         Parametros.ParamByName('cd_sala').AsInteger := FSala.Codigo;
      end;
   end;
end;

procedure TExecucaoHorarioTurma.SetDataFim(LDataFim: TDate);
begin
   Self.FDataFim := LDataFim;
end;

procedure TExecucaoHorarioTurma.SetDataInicio(LDataInicio: TDate);
begin
   Self.FDataInicio := LDataInicio;
end;

{ TExecucaoAula }

constructor TExecucaoAula.Create(const LTipoExecucaoAula: TTipoExecucaoAula;
   const logs: TExecucaoAulaParametroLogs; const cd_diario_aula: Integer; const dt_aula: TDateTime;
   const cd_turma_horario: Integer);
begin
   Self.FOnAfterSQLExecute := Self.LogarExecucao;
   Self.FOnBeforeSQLExecute := Self.BeforeSQLExecute;

   Self.FTipoExecucao := LTipoExecucaoAula;
   Self.FDiarioAula := cd_diario_aula;
   Self.FDataAula := dt_aula;
   Self.FLogs := logs;
   Self.FTurmaHorario := cd_turma_horario;
end;

function TExecucaoAula.GetSQL: String;
const
   SQL_DELETE_DIARIO_AULAS =
      ' DELETE FROM diario_aulas WHERE cd_diario_aula = :cd_diario_aula ';
   SQL_DELETE_DIARIO_AULAS_ALUNOS =
      ' DELETE daa FROM ' +
      '    diario_aulas da ' +
      '    INNER JOIN diario_aulas_alunos daa ON ( ' +
      '       daa.cd_bimestre = da.bimestre AND daa.cd_disciplina = da.disciplina AND ' +
      '       daa.cd_turma = da.turma AND daa.nr_anosem = da.anosemestre AND ' +
      '       daa.nr_aula = da.nro_aula ' +
      '    ) ' +
      ' WHERE da.cd_diario_aula = :cd_diario_aula ';
   SQL_UPDATE_DATA_DIARIO_AULAS =
      ' UPDATE diario_aulas ' +
      ' SET `data` = :dt_aula WHERE cd_diario_aula = :cd_diario_aula ';
   SQL_UPDATE_HORARIO_DIARIO_AULAS =
      ' DELETE FROM diario_aulas_turmas_horarios WHERE cd_diario_aula = :cd_diario_aula ';
begin
   case FTipoExecucao of
      teaDelete: Result := SQL_DELETE_DIARIO_AULAS;
      teaDeleteAulasAlunos: Result := SQL_DELETE_DIARIO_AULAS_ALUNOS;
      teaUpdate: Result := SQL_UPDATE_DATA_DIARIO_AULAS;
      teaUpdateExtra: Result := SQL_UPDATE_HORARIO_DIARIO_AULAS;
   end;
end;

procedure TExecucaoAula.LogarExecucao;
const
   OBS_EXCLUSAO = 'Exclusão da aula: %s';
   OBS_EXCLUSAO_ALUNOS = 'Exclusão das frequências da aula: %s';
   OBS_ALTERACAO = 'Alterada aula %s - Nova data: %s; Novo Horário: %s';
   OBS_ALTERACAO_HORARIO = 'Alteração de vínculo da aula %s - Removido horário';
   FORMATO_CHAVE_LOG = '%s:%s:%s:%s:%s:%s:%s';
var
   Tipo, Obs, Infs: String;
begin
   Infs := Format('[Nro. Aula: %s; Ano/Semestre: %s; Etapa: %s; Turma: %s; Disciplina: %s; Professor: %s; Data: %s; Horário: %s]', [
      Self.FLogs.nro_aula, Self.FLogs.nr_anosemestre, Self.FLogs.nr_etapa,
      Self.FLogs.cd_turma, Self.FLogs.ds_disciplina, Self.FLogs.nm_professor,
      Self.FLogs.data, Self.FLogs.horario_antigo
   ]);

   case FTipoExecucao of
      teaDelete: begin
         Tipo := 'Exclusao';
         Obs := Format(OBS_EXCLUSAO,[Infs]);
      end;
      teaDeleteAulasAlunos: begin
         Tipo := 'Exclusao';
         Obs := Format(OBS_EXCLUSAO_ALUNOS,[Infs]);
      end;
      teaUpdate: begin
         Tipo := 'Alteracao';
         Obs := Format(OBS_ALTERACAO,[Infs, FormatDateTime('dd/mm/yyyy', Self.FDataAula), Self.FLogs.horario_novo]);
      end;
      teaUpdateExtra: begin
         Tipo := 'Alteracao';
         Obs := Format(OBS_ALTERACAO_HORARIO,[Infs]);
      end;
   end;

   DM.setLog(30004, Tipo, Format( FORMATO_CHAVE_LOG, [
      Self.FLogs.nro_aula, Self.FLogs.nr_anosemestre, Self.FLogs.nr_etapa,
      Self.FLogs.cd_turma, Self.FLogs.nm_professor, Self.FLogs.ds_disciplina,
      Self.FLogs.data
   ] ), 0, Obs);
end;

procedure TExecucaoAula.PrepareParams(var Parametros: TParams);
begin
   Parametros.ParamByName('cd_diario_aula').AsInteger := FDiarioAula;

   if FTipoExecucao = teaUpdate then
   begin
      Parametros.ParamByName('dt_aula').AsDateTime := FDataAula;
   end;
end;

procedure TExecucaoAula.BeforeSQLExecute(
  var qyExecucao: TUMZQuery);
begin
   if FTipoExecucao = teaUpdate then
   begin
      qyExecucao.SQL.Text := 'DELETE FROM diario_aulas_turmas_horarios WHERE cd_diario_aula = :cd_diario_aula';
      qyExecucao.ParamByName('cd_diario_aula').AsInteger := FDiarioAula;

      qyExecucao.ExecSQL();
   end;
end;

{ TExecucaoVinculoAula }

constructor TExecucaoVinculoAula.Create(const cd_diario_aula,
  cd_turma_horario: Integer);
begin
   Self.FDiarioAula := cd_diario_aula;
   Self.FTurmaHorario := cd_turma_horario;
end;

function TExecucaoVinculoAula.GetSQL: String;
begin
   Result := 'INSERT INTO diario_aulas_turmas_horarios (cd_diario_aula, cd_turma_horario) VALUES (:cd_diario_aula, :cd_turma_horario)';
end;

procedure TExecucaoVinculoAula.PrepareParams(var Parametros: TParams);
begin
   Parametros.ParamByName('cd_diario_aula').AsInteger := FDiarioAula;
   Parametros.ParamByName('cd_turma_horario').AsInteger := FTurmaHorario;
end;

{ TExecucaoHorarioAula }

constructor TExecucaoHorarioAula.Create(cd_turma_horario: Integer);
begin
   Self.Fcd_turma_horario := cd_turma_horario;
end;

function TExecucaoHorarioAula.GetSQL: String;
begin
   Result := 'DELETE FROM turmas_horarios_config WHERE cd_turmas_horarios = :cd_turma_horario';
end;

procedure TExecucaoHorarioAula.PrepareParams(var Parametros: TParams);
begin
   Parametros.ParamByName('cd_turma_horario').AsInteger := Fcd_turma_horario;
end;

end.
