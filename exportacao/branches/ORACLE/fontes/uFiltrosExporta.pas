unit uFiltrosExporta;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ComCtrls, Buttons;

type
  TfFiltroExporta = class(TForm)
    lbFiltro: TLabel;
    edString: TEdit;
    edInteger: TEdit;
    dtpData: TDateTimePicker;
    btnOk: TBitBtn;
    btnCancel: TBitBtn;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  fFiltroExporta: TfFiltroExporta;

implementation

{$R *.dfm}

end.
