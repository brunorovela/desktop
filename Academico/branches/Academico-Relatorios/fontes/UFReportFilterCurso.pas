unit UFReportFilterCurso;

interface

uses
   Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
   Dialogs, UFReportFilterList, StdCtrls, UStdCtrls, Buttons, ExtCtrls;

type
   TfrmReportFilterCurso = class(TfrmReportFilterList)
   private
      procedure AddItem; override;
   end;

implementation

uses
   UReportClasses, UFReportFilterComponent, UFReportFilterAnoSemestre,
   uFSelecionarCurso, uDM;

{$R *.dfm}

{ TfrmReportFilterCurso }

procedure TfrmReportFilterCurso.AddItem;
var
   FrameAnoSemestre: TfrmReportFilterAnoSemestre;
   FrameColigada, FrameDepto: TfrmReportFilterList;
   Item: TItem;
   Filtro: TResultadoFiltroCurso;
   ColigadaId, DeptoId, AnoSemestre: Integer;
begin
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

   AnoSemestre := DM.GetAnoSemestreAtual;

   FrameAnoSemestre := TfrmReportFilterAnoSemestre(
      TReportFilterFactory.Instance.Find('AnoSemestre'));

   if FrameAnoSemestre <> nil then
   begin
      AnoSemestre := FrameAnoSemestre.Value;
   end;

   Filtro := TfrmSelecionarCurso.Filtrar([], ColigadaId, DeptoId, AnoSemestre);

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

      if FrameAnoSemestre <> nil then
      begin
         FrameAnoSemestre.Value := Filtro.nr_anosemestre;
      end;

      Item := TItem.Create(Filtro.cd_curso, Filtro.ds_curso);
      Add(Item);
   end;
   
end;

initialization
   RegisterClass(TfrmReportFilterCurso);

finalization
   UnRegisterClass(TfrmReportFilterCurso);

end.
