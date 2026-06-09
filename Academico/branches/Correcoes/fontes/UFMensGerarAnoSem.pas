unit UFMensGerarAnoSem;

interface

uses
   Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
   Dialogs, ComCtrls, StdCtrls, Mask;

type
   TfMensGerarAnoSem = class(TFrame)
      lblAnoSem: TLabel;
      meAnoSem: TMaskEdit;
      udAnoSem: TUpDown;
      procedure udAnoSemClick(Sender: TObject; Button: TUDBtnType);
   end;

implementation

uses
   uDM, UFMensalidadeGerar;

{$R *.dfm}

procedure TfMensGerarAnoSem.udAnoSemClick(Sender: TObject; Button: TUDBtnType);
begin
   if Button = btNext then
      meAnoSem.Text := DM.incrementar_ano_semestre(meAnoSem.Text)
   else if Button = btPrev then
      meAnoSem.Text := DM.decrementar_ano_semestre(meAnoSem.Text);
      
   fMensalidadeGerar.DoFiltro;
end;

end.
