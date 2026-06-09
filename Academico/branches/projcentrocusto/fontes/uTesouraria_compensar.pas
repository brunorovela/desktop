unit uTesouraria_compensar;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, ComCtrls, StdCtrls, Buttons;

type
  TfrmTesourariaCompensar = class(TForm)
    Label1: TLabel;
    dtpCompensar: TDateTimePicker;
    Panel3: TPanel;
    Bevel4: TBevel;
    Label2: TLabel;
    edCodMov: TEdit;
    Label3: TLabel;
    edNumDoc: TEdit;
    Label4: TLabel;
    edNumChe: TEdit;
    BitBtn2: TBitBtn;
    BitBtn1: TBitBtn;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmTesourariaCompensar: TfrmTesourariaCompensar;

implementation

{$R *.dfm}

end.

