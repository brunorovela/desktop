unit UFReportFilterConta;

interface

uses
   Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
   Dialogs, UFReportFilterList, StdCtrls, UStdCtrls, Buttons, ExtCtrls;

type
   TfrmReportFilterConta = class(TfrmReportFilterList)
   private
      procedure AddItem; override;
   end;

implementation

uses
   UReportClasses, uSelCaixa, DB;

{$R *.dfm}

{ TfrmReportFilterConta }

procedure TfrmReportFilterConta.AddItem;
var
   ID: Integer;
   Name: AnsiString;
   Item: TItem;
begin
   frm_SelCaixa.ShowModal;

   if frm_SelCaixa.flgSearch then
   begin
      ID := frm_SelCaixa.qyCaixacd_caixa.AsInteger;
      Name := frm_SelCaixa.qyCaixads_caixa.AsString;
      Item := TItem.Create(ID, Name);
      Add(Item);
   end;
end;

initialization
   RegisterClass(TfrmReportFilterConta);

finalization
   UnRegisterClass(TfrmReportFilterConta);

end.
