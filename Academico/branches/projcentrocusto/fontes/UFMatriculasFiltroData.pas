unit UFMatriculasFiltroData;

interface

uses
   Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
   Dialogs, ComCtrls, StdCtrls, Buttons;

type
   TfMatriculasFiltroData = class(TForm)
      lblDataDe: TLabel;
      dtpInicio: TDateTimePicker;
      lblDataAte: TLabel;
      dtpFim: TDateTimePicker;
      bbtnFiltrar: TBitBtn;
      Limpar: TBitBtn;
    bbtnCancelar: TBitBtn;
      procedure dtpFimChange(Sender: TObject);
      procedure dtpInicioChange(Sender: TObject);
      procedure FormCreate(Sender: TObject);
   end;

var
   fMatriculasFiltroData: TfMatriculasFiltroData;

implementation

{$R *.dfm}

procedure TfMatriculasFiltroData.dtpFimChange(Sender: TObject);
begin
   if dtpFim.Date < dtpInicio.Date then
   begin
      dtpFim.Date := dtpInicio.Date;
   end;
end;

procedure TfMatriculasFiltroData.dtpInicioChange(Sender: TObject);
begin
   if dtpInicio.Date > dtpFim.Date then
   begin
      dtpFim.Date := dtpInicio.Date;
   end;
end;

procedure TfMatriculasFiltroData.FormCreate(Sender: TObject);
begin
   dtpInicio.Date := Date;
   dtpFim.Date := Date;
end;

end.
