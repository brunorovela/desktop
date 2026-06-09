unit UFReportFilterFormaPgto;

interface

uses
   Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
   Dialogs, UFReportFilterList, StdCtrls, UStdCtrls, Buttons, ExtCtrls;

type
   TfrmReportFilterFormaPgto = class(TfrmReportFilterList)
   private
      procedure AddItem; override;
   end;

implementation

uses
   UReportClasses, uSelFormaPgto, DB;

{$R *.dfm}

{ TfrmReportFilterFormaPgto }

procedure TfrmReportFilterFormaPgto.AddItem;
var
   Item: TItem;
   Id: Integer;
   Name: AnsiString;
begin
   if frmSelFormaPgto = nil then
   begin
      Application.CreateForm(TfrmSelFormaPgto, frmSelFormaPgto);
   end;

   frmSelFormaPgto.ShowModal;

   if frmSelFormaPgto.flgSearch then
   begin
      Id := frmSelFormaPgto.qyFormaPgtocd_forma_pgto.AsInteger;
      Name := frmSelFormaPgto.qyFormaPgtods_forma_pgto.AsString;

      Item := TItem.Create(Id, Name);
      Add(Item);
   end;
end;

initialization
   RegisterClass(TfrmReportFilterFormaPgto);

finalization
   UnRegisterClass(TfrmReportFilterFormaPgto);

end.
