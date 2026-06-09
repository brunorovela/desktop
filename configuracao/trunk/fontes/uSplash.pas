unit uSplash;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, ComCtrls, General, ExtCtrls;

type
  TfrmSplash = class(TForm)
    lblAguarde: TLabel;
    Label1: TLabel;
    Bevel1: TBevel;
    procedure FormDestroy(Sender: TObject);
    procedure FormPaint(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmSplash: TfrmSplash;

implementation

{$R *.DFM}



procedure TfrmSplash.FormDestroy(Sender: TObject);
begin
   frmSplash := nil;
end;

procedure TfrmSplash.FormPaint(Sender: TObject);
begin
  PapelParede( Sender );
end;


end.
