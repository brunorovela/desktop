{
#TIT= Splash
#OBJ= Mostrar que o sistema está sendo aberto e solicitar que aguarde a abertura.
#AUT= Jonathan
#DAT= 18/08/2004
#MOD= ...
#DES=
}
unit uSplash;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, ComCtrls, General, ZAbstractRODataset, ZAbstractDataset, ZDataset, UZDataset, ExtCtrls;

type
  TfrmSplash = class(TForm)
    lblAguarde: TLabel;
    Label1: TLabel;
    Bevel1: TBevel;
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



procedure TfrmSplash.FormPaint(Sender: TObject);
begin
  PapelParede( Sender );
end;


end.






