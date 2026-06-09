unit UFReportFilterProfessor;

interface

uses
   Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
   Dialogs, UFReportFilterPessoa, StdCtrls, UStdCtrls, Buttons, ExtCtrls;

type
   TfrmReportFilterProfessor = class(TfrmReportFilterPessoa)
   private
      procedure AddItem; override;
   end;

implementation

uses
   UReportClasses, UFReportFilterComponent, UFReportFilterList,
   UFReportFilterAnoSemestre, uFSelecionarPessoa;

{$R *.dfm}

{ TfrmReportFilterProfessor }

procedure TfrmReportFilterProfessor.AddItem;
const
   SIntToStrFmt = '%d';
var
   FrameAnoSemestre: TfrmReportFilterAnoSemestre;
   FrameCurso, FrameTurma: TfrmReportFilterList;
   Filtro: TResultadoFiltroPessoa;
   Item: TItem;
begin
   Filtro := TfrmSelecionarPessoa.Filtrar([], afpProfessor);

   if Filtro.filtrado then
   begin
      FrameAnoSemestre := TfrmReportFilterAnoSemestre(
         TReportFilterFactory.Instance.Find('AnoSemestre'));

      if FrameAnoSemestre <> nil then
      begin
         FrameAnoSemestre.Value := FrameAnoSemestre.Value;
      end;

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

      Item := TItem.Create(Filtro.cd_pessoa, Filtro.nm_pessoa);
      Add(Item);
   end;
   
end;

initialization
   RegisterClass(TfrmReportFilterProfessor);

finalization
   UnRegisterClass(TfrmReportFilterProfessor);

end.
