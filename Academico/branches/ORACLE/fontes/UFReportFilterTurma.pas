unit UFReportFilterTurma;

interface

uses
   Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
   Dialogs, UFReportFilterList, StdCtrls, UStdCtrls, Buttons, ExtCtrls;

type
   TfrmReportFilterTurma = class(TfrmReportFilterList)
   private
      procedure AddItem; override;
   end;

implementation

uses
   UReportClasses, UFReportFilterComponent, UFReportFilterAnoSemestre,
   uFSelecionarTurma, uDM;

{$R *.dfm}

{ TfrmReportFilterTurma }

procedure TfrmReportFilterTurma.AddItem;
const
   SIntToStrFmt = '%d';
var
   FrameAnoSemestre: TfrmReportFilterAnoSemestre;
   FrameColigada, FrameDepto, FrameCurso: TfrmReportFilterList;
   Filtro: TResultadoFiltroTurma;
   AnoSemestre, ColigadaId, DeptoId: Integer;
   CursoId: AnsiString;
   Item: TItem;
begin
   AnoSemestre := DM.GetAnoSemestreAtual;

   FrameAnoSemestre := TfrmReportFilterAnoSemestre(
      TReportFilterFactory.Instance.Find('AnoSemestre'));

   if FrameAnoSemestre <> nil then
   begin
      AnoSemestre := FrameAnoSemestre.Value;
   end;

   ColigadaId := -2;

   FrameColigada := TfrmReportFilterList(
      TReportFilterFactory.Instance.Find('Coligada'));

   if (FrameColigada <> nil) and (FrameColigada.Count = 1) then
   begin
      ColigadaId := StrToIntDef(FrameColigada.First.ID, -2);
   end;

   DeptoId := -2;

   FrameDepto := TfrmReportFilterList(
      TReportFilterFactory.Instance.Find('Depto'));

   if (FrameDepto <> nil) and (FrameDepto.Count = 1) then
   begin
      DeptoId := StrToIntDef(FrameDepto.First.ID, -2);
   end;

   CursoId := '-2';

   FrameCurso := TfrmReportFilterList(
      TReportFilterFactory.Instance.Find('Curso'));

   if (FrameCurso <> nil) and (FrameCurso.Count = 1) then
   begin
      CursoId := FrameCurso.First.ID;
   end;

   Filtro := TfrmSelecionarTurma.Filtrar([], AnoSemestre, ColigadaId, DeptoId,
      CursoId);

   if Filtro.filtrado then
   begin

      if FrameColigada <> nil then
      begin
         Item := TItem.Create(Filtro.cd_coligada, Filtro.nm_coligada);
         FrameColigada.Add(Item);
      end;

      if FrameDepto <> nil then
      begin
         Item := TItem.Create(Filtro.cd_departamento, Filtro.NomeDepto);
         FrameDepto.Add(Item);
      end;

      if FrameCurso <> nil then
      begin
         Item := TItem.Create(Filtro.cd_curso, Filtro.ds_curso);
         FrameCurso.Add(Item);
      end;

      if FrameAnoSemestre <> nil then
      begin
         FrameAnoSemestre.Value := Filtro.nr_anosemestre
      end;

      Item := TItem.Create(Filtro.cd_turma, Filtro.cd_turma);
      Add(Item);
   end;
end;

initialization
   RegisterClass(TfrmReportFilterTurma);

finalization
   UnRegisterClass(TfrmReportFilterTurma);

end.
