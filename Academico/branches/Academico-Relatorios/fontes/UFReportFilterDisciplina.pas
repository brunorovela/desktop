unit UFReportFilterDisciplina;

interface

uses
   Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
   Dialogs, UFReportFilterList, StdCtrls, UStdCtrls, Buttons, ExtCtrls;

type
   TfrmReportFilterDisciplina = class(TfrmReportFilterList)
   private
      procedure AddItem; override;
   end;

implementation

uses
   UReportClasses, UFReportFilterComponent, UFReportFilterAnoSemestre,
   uFSelecionarDisciplina, uDM;

{$R *.dfm}

{ TfrmReportFilterDisciplina }

procedure TfrmReportFilterDisciplina.AddItem;
var
   FrameAnoSemestre: TfrmReportFilterAnoSemestre;
   FrameColigada, FrameDepto, FrameCurso, FrameTurma,
   FrameProfessor: TfrmReportFilterList;
   Filtro: TResultadoFiltroDisciplina;
   AnoSemestre, ProfessorId: Integer;
   CursoId, TurmaId: AnsiString;
   Item: TItem;
begin
   AnoSemestre := DM.GetAnoSemestreAtual;

   FrameAnoSemestre := TfrmReportFilterAnoSemestre(
      TReportFilterFactory.Instance.Find('AnoSemestre'));

   if FrameAnoSemestre <> nil then
   begin
      AnoSemestre := FrameAnoSemestre.Value;
   end;

   CursoId := '';

   FrameCurso := TfrmReportFilterList(
      TReportFilterFactory.Instance.Find('Curso'));

   if (FrameCurso <> nil) and (FrameCurso.Count = 1) then
   begin
      CursoId := FrameCurso.First.ID;
   end;

   TurmaId := '';

   FrameTurma := TfrmReportFilterList(
      TReportFilterFactory.Instance.Find('Turma'));

   if (FrameTurma <> nil) and (FrameTurma.Count = 1) then
   begin
      TurmaId := FrameTurma.First.ID;
   end;

   ProfessorId := -1;

   if (FrameProfessor <> nil) and (FrameProfessor.Count = 1) then
   begin
      ProfessorId := StrToIntDef(FrameProfessor.First.ID, -1);
   end;

   Filtro := TfrmSelecionarDisciplina.Filtrar([], CursoId, AnoSemestre, TurmaId,
      ProfessorId);

   if Filtro.filtrado then
   begin
      FrameColigada := TfrmReportFilterList(
         TReportFilterFactory.Instance.Find('Coligada'));

      if FrameColigada <> nil then
      begin
         Item := TItem.Create(Filtro.ColigadaId, Filtro.ColigadaNome);
         FrameColigada.Add(Item);
      end;

      FrameDepto := TfrmReportFilterList(
         TReportFilterFactory.Instance.Find('Depto'));

      if FrameDepto <> nil then
      begin
         Item := TItem.Create(Filtro.DeptoId, Filtro.DeptoNome);
         FrameDepto.Add(Item);
      end;

      if FrameCurso <> nil then
      begin
         Item := TItem.Create(Filtro.cd_curso, Filtro.ds_curso);
         FrameCurso.Add(Item);
      end;

      if FrameTurma <> nil then
      begin
         Item := TItem.Create(Filtro.cd_turma, Filtro.cd_turma);
         FrameTurma.Add(Item);
      end;

      Item := Item.Create(Filtro.cd_disciplina, Filtro.ds_disciplina);
      Add(Item);
   end;
end;

initialization
   RegisterClass(TfrmReportFilterDisciplina);

finalization
   UnRegisterClass(TfrmReportFilterDisciplina);

end.
