unit uFDefinicaoPrimeiroHorario;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, ExtCtrls, UMDateTimePicker, uDM;

type
  TfrmDefinicaoPrimeiroHorario = class(TForm)
    Panel3: TPanel;
    Label3: TLabel;
    Button1: TBitBtn;
    Button2: TBitBtn;
    umdtData: TUMDateTimePicker;
    procedure FormShow(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
  private
    dataInicioHorario : TDatetime;
    { Private declarations }
  public
    procedure setDataInicioHorario(data:TDatetime);
    function getDataInicioHorario():TDateTime;
    { Public declarations }
  end;

var
  frmDefinicaoPrimeiroHorario: TfrmDefinicaoPrimeiroHorario;

implementation

{$R *.dfm}

{ TfrmDefinicaoPrimeiroHorario }

procedure TfrmDefinicaoPrimeiroHorario.Button1Click(Sender: TObject);
begin
   CloseModal;
end;

procedure TfrmDefinicaoPrimeiroHorario.Button2Click(Sender: TObject);
begin
   setDataInicioHorario(umdtData.Date);
   CloseModal;
end;

procedure TfrmDefinicaoPrimeiroHorario.FormShow(Sender: TObject);
begin
   umdtData.setDate(self.getDataInicioHorario);
end;

function TfrmDefinicaoPrimeiroHorario.getDataInicioHorario(): TDateTime;
begin
   result := self.dataInicioHorario;
end;

procedure TfrmDefinicaoPrimeiroHorario.setDataInicioHorario(data: TDatetime);
begin
   self.dataInicioHorario := data;
end;

end.
