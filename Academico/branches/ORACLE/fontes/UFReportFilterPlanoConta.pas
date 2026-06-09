unit UFReportFilterPlanoConta;

interface

uses
   Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
   Dialogs, UFReportFilterList, StdCtrls, UStdCtrls, Buttons, ExtCtrls;

type
   TfrmReportFilterPlanoConta = class(TfrmReportFilterList)
   private
      procedure AddItem; override;
   end;

implementation

uses
   DB, DBGrids, UReportClasses, uSelConta;

{$R *.dfm}

{ TfrmReportFilterPlanoConta }

procedure TfrmReportFilterPlanoConta.AddItem;
var
   Bookmark: TBookmark;
   I, Id: Integer;
   Name: AnsiString;
   Item: TItem;
begin
   frm_SelConta.grd.Options := frm_SelConta.grd.Options + [dgMultiSelect];
   frm_SelConta.buscaTudo := True;
   frm_SelConta.ShowModal;

   if frm_SelConta.flgSearch then
   begin
      for I := 0 to frm_SelConta.grd.SelectedRows.Count - 1 do
      begin
         Bookmark := TBookmark(frm_SelConta.grd.SelectedRows.Items[I]);
         frm_SelConta.qyPlanosContas.GotoBookmark(Bookmark);
         Id := frm_SelConta.qyPlanosContasCD_CONTA.AsInteger;
         Name := frm_SelConta.qyPlanosContasDS_CONTA.AsString;
         Item := TItem.Create(Id, Name);
         Add(Item);
      end;
   end;
end;

initialization
   RegisterClass(TfrmReportFilterPlanoConta);

finalization
   UnRegisterClass(TfrmReportFilterPlanoConta);

end.
