unit UFReportFilterCentroCusto;

interface

uses
   Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
   Dialogs, UFReportFilterList, StdCtrls, UStdCtrls, Buttons, ExtCtrls;

type
   TfrmReportFilterCentroCusto = class(TfrmReportFilterList)
   private
      procedure AddItem; override;
   end;

implementation

uses
   UReportClasses, uSelCentro, DB;

{$R *.dfm}

{ TfrmReportFilterCentroCusto }

procedure TfrmReportFilterCentroCusto.AddItem;
var
   Item: TItem;
   ID: Integer;
   Name: AnsiString;
begin
   frm_SelCentro.ShowModal;

   if frm_SelCentro.flgSearch then
   begin
      ID := frm_SelCentro.qyCentrosCD_CENTRO.AsLargeInt;
      Name := frm_SelCentro.qyCentrosDS_CENTRO.AsString;
      Item := TItem.Create(ID, Name);
      Add(Item);
   end;
end;

initialization
   RegisterClass(TfrmReportFilterCentroCusto);

finalization
   UnRegisterClass(TfrmReportFilterCentroCusto);

end.
