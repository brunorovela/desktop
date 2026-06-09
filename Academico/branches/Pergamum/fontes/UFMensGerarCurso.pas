unit UFMensGerarCurso;

interface

uses
   Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms, 
   Dialogs, Buttons, StdCtrls, ComCtrls, Mask;

type
   TfMensGerarCurso = class(TFrame)
      lblCursoAnoSem: TLabel;
      meCursoAnoSem: TMaskEdit;
      udCursoAnoSem: TUpDown;
      lblCurso: TLabel;
      edtCurso: TEdit;
      sbSelCurso: TSpeedButton;
      procedure udCursoAnoSemClick(Sender: TObject; Button: TUDBtnType);
      procedure sbSelCursoClick(Sender: TObject);
   end;

implementation

uses
   uDM, uFSelecionarCurso, UFMensalidadeGerar;

{$R *.dfm}

procedure TfMensGerarCurso.sbSelCursoClick(Sender: TObject);
var
   resultado_filtro : TResultadoFiltroCurso;
begin
   resultado_filtro := TfrmSelecionarCurso.Filtrar([]);

   if resultado_filtro.filtrado then
   begin
      meCursoAnoSem.Text := IntToStr( resultado_filtro.nr_anosemestre );
      edtCurso.Text := resultado_filtro.cd_curso;
      fMensalidadeGerar.DoFiltro;
   end;
end;

procedure TfMensGerarCurso.udCursoAnoSemClick(Sender: TObject; Button: TUDBtnType);
begin
   if Button = btNext then
      meCursoAnoSem.Text := DM.incrementar_ano_semestre(meCursoAnoSem.Text)
   else if Button = btPrev then
      meCursoAnoSem.Text := DM.decrementar_ano_semestre(meCursoAnoSem.Text);
   fMensalidadeGerar.DoFiltro;
end;

end.
