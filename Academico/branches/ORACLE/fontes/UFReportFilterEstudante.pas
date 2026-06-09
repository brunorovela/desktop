unit UFReportFilterEstudante;

interface

uses
   Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
   Dialogs, UFReportFilterPessoa, StdCtrls, UStdCtrls, Buttons, ExtCtrls;

type
   TfrmReportFilterEstudante = class(TfrmReportFilterPessoa)
   private
      procedure AddItem; override;
   end;

implementation

uses
   UReportClasses, UFReportFilterComponent, UFReportFilterList,
   UFReportFilterAnoSemestre, uFSelecionarPessoa, uDM;

{$R *.dfm}

{ TfrmReportFilterEstudante }

procedure TfrmReportFilterEstudante.AddItem;
var
   FrameAnoSemestre: TfrmReportFilterAnoSemestre;
   FrameTurma, FrameCurso: TfrmReportFilterList;
   AnoSemestre: Integer;
   Filtro: TResultadoFiltroPessoa;
   Item: TItem;
begin
   FrameAnoSemestre := TfrmReportFilterAnoSemestre(
      TReportFilterFactory.Instance.Find('AnoSemestre'));

   AnoSemestre := DM.GetAnoSemestreAtual;

   if FrameAnoSemestre <> nil then
   begin
      AnoSemestre := FrameAnoSemestre.Value;
   end;

   Filtro := TfrmSelecionarPessoa.Filtrar([], afpEstudante, AnoSemestre);

   if Filtro.filtrado then
   begin
      FrameCurso := TfrmReportFilterList(
         TReportFilterFactory.Instance.Find('Curso'));

      if FrameCurso <> nil then
      begin
         Item := TItem.Create(Filtro.cd_curso, Filtro.CursoNome);
         FrameCurso.Add(Item);
      end;

      FrameTurma := TfrmReportFilterList(
         TReportFilterFactory.Instance.Find('Turma'));

      if FrameTurma <> nil then
      begin
         Item := TItem.Create(Filtro.cd_turma, Filtro.cd_turma);
         FrameTurma.Add(Item);
      end;

      if FrameAnoSemestre <> nil then
      begin
         FrameAnoSemestre.Value := Filtro.nr_anosemestre;
      end;

      Item := TItem.Create(Filtro.cd_pessoa, Filtro.nm_pessoa);
      Add(Item);
   end;
end;

initialization
   RegisterClass(TfrmReportFilterEstudante);

finalization
   UnRegisterClass(TfrmReportFilterEstudante);

end.
