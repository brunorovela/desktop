unit wBackupDescomp;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls;

type
  TfwBackupDescomp = class(TForm)
    Panel1: TPanel;
    procedure FormDestroy(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  fwBackupDescomp: TfwBackupDescomp;

implementation

{$R *.dfm}

procedure TfwBackupDescomp.FormDestroy(Sender: TObject);
begin
   fwBackupDescomp := nil;
end;

end.
