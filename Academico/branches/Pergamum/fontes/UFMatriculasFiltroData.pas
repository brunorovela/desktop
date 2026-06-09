unit UFMatriculasFiltroData;

interface

uses
   Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
   Dialogs, ComCtrls, StdCtrls, Buttons, ExtCtrls, UMDateTimePicker;

type
   TfMatriculasFiltroData = class(TForm)
      lblDataDe: TLabel;
      lblDataAte: TLabel;
      bbtnFiltrar: TBitBtn;
      Limpar: TBitBtn;
    bbtnCancelar: TBitBtn;
    umdtInicio: TUMDateTimePicker;
    umdtFim: TUMDateTimePicker;
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
   umdtInicio.setDate(Date);
   umdtFim.setDate(Date);
end;

procedure TfMatriculasFiltroData.umdtFimChangeDate(Sender: TObject);
begin
   if umdtFim.getDate < umdtInicio.getDate then
   begin
      umdtFim.setDate(umdtInicio.getDate);
   end;
end;

procedure TfMatriculasFiltroData.umdtInicioChangeDate(Sender: TObject);
begin
   if umdtInicio.getDate > umdtFim.getDate then
   begin
      umdtFim.setDate(umdtInicio.getDate);
   end;
end;

end.
