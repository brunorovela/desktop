unit UFMensGerarTurma;

interface

uses
   Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms, 
   Dialogs, StdCtrls, Mask, ComCtrls, Buttons;

type
   TfMensGerarTurma = class(TFrame)
      lblTurmaAnoSem: TLabel;
      meTurmaAnoSem: TMaskEdit;
      udTurmaAnoSem: TUpDown;
      lblTurmaCurso: TLabel;
      edtTurmaCurso: TEdit;
      sbSelCurso: TSpeedButton;
      edtTurma: TEdit;
      lblTurma: TLabel;
      sbSelTurma: TSpeedButton;
      procedure sbSelTurmaClick(Sender: TObject);
      procedure sbSelCursoClick(Sender: TObject);
      procedure udTurmaAnoSemClick(Sender: TObject; Button: TUDBtnType);
   end;

implementation

uses
   uDM, uFSelecionarCurso, uFSelecionarTurma, UFMensalidadeGerar;

{$R *.dfm}

procedure TfMensGerarTurma.sbSelCursoClick(Sender: TObject);
var
   resultado_filtro : TResultadoFiltroCurso;
begin
   resultado_filtro := TfrmSelecionarCurso.Filtrar([]);

   if resultado_filtro.filtrado then
   begin
      meTurmaAnoSem.Text := IntToStr( resultado_filtro.nr_anosemestre );
      edtTurmaCurso.Text := resultado_filtro.cd_curso;
      edtTurma.Clear;
      fMensalidadeGerar.DoFiltro;
   end;
end;

procedure TfMensGerarTurma.sbSelTurmaClick(Sender: TObject);
var
   resultado_filtro : TResultadoFiltroTurma;
begin
   resultado_filtro := TfrmSelecionarTurma.Filtrar([]);

   if resultado_filtro.filtrado then
   begin
      meTurmaAnoSem.Text := IntToStr( resultado_filtro.nr_anosemestre );
      edtTurmaCurso.Text := resultado_filtro.cd_curso;
      edtTurma.Text := resultado_filtro.cd_turma;

      fMensalidadeGerar.DoFiltro;
   end;
end;

procedure TfMensGerarTurma.udTurmaAnoSemClick(Sender: TObject;
  Button: TUDBtnType);
begin
   if Button = btNext then
      meTurmaAnoSem.Text := DM.incrementar_ano_semestre(meTurmaAnoSem.Text)
   else if Button = btPrev then
      meTurmaAnoSem.Text := DM.decrementar_ano_semestre(meTurmaAnoSem.Text);
   fMensalidadeGerar.DoFiltro;
end;

end.
