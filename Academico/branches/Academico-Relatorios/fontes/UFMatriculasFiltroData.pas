unit UFMatriculasFiltroData;

interface

uses
   Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
   Dialogs, ComCtrls, StdCtrls, Buttons, ExtCtrls, Mask, UDateTimePicker;

type
   TfMatriculasFiltroData = class(TForm)
      lblDataDe: TLabel;
      lblDataAte: TLabel;
      bbtnFiltrar: TBitBtn;
      Limpar: TBitBtn;
    bbtnCancelar: TBitBtn;
    dtpInicio: TDatePickerEx;
    dtpFim: TDatePickerEx;
    procedure umdtFimChangeDate(Sender: TObject);
    procedure umdtInicioChangeDate(Sender: TObject);
      procedure FormCreate(Sender: TObject);
   end;

var
   fMatriculasFiltroData: TfMatriculasFiltroData;

implementation

{$R *.dfm}

procedure TfMatriculasFiltroData.FormCreate(Sender: TObject);
begin
   dtpInicio.SelectedDate := Date;
   dtpFim.SelectedDate := Date;
end;

procedure TfMatriculasFiltroData.umdtFimChangeDate(Sender: TObject);
begin
   if dtpFim.SelectedDate < dtpInicio.SelectedDate then
   begin
      dtpFim.SelectedDate := dtpInicio.SelectedDate;
   end;
end;

procedure TfMatriculasFiltroData.umdtInicioChangeDate(Sender: TObject);
begin
   if dtpInicio.SelectedDate > dtpFim.SelectedDate then
   begin
      dtpInicio.SelectedDate := dtpFim.SelectedDate;
   end;
end;

end.
