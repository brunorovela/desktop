unit UFProcessing;

interface

uses
   Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
   Dialogs, StdCtrls;

type
   TfProcessing = class(TForm)
      lblProcessing: TLabel;
      procedure FormCreate(Sender: TObject);
      procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
      procedure FormClose(Sender: TObject; var Action: TCloseAction);
   public
      FCanClose: Boolean;
   end;

var
   fProcessing: TfProcessing;

implementation

{$R *.dfm}

procedure TfProcessing.FormClose(Sender: TObject; var Action: TCloseAction);
begin
   Action := caFree;
end;

procedure TfProcessing.FormCloseQuery(Sender: TObject; var CanClose: Boolean);
begin
   CanClose := FCanClose;
end;

procedure TfProcessing.FormCreate(Sender: TObject);
begin
   FCanClose := False;
end;

end.
