unit UFReportFilterClassePlanoConta;

interface

uses
   Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
   Dialogs, UFReportFilterList, StdCtrls, UStdCtrls, Buttons, ExtCtrls;

type
   TfrmReportFilterClassePlanoConta = class(TfrmReportFilterList)
   private
      procedure AddItem; override;
   end;

implementation

uses
   DBGrids, DB, UReportClasses, uSelConta;

{$R *.dfm}

{ TfrmReportFilterList5 }

procedure TfrmReportFilterClassePlanoConta.AddItem;
var
   Item: TItem;
   S: AnsiString;
   I: Integer;
   Bookmark: TBookmark;
begin
   frm_SelConta.grd.Options := frm_SelConta.grd.Options + [dgMultiSelect];
   frm_SelConta.ShowModal;

   if frm_SelConta.flgSearch then
      for I := 0 to frm_SelConta.grd.SelectedRows.Count - 1 do
      begin
         Bookmark := TBookmark(frm_SelConta.grd.SelectedRows[I]);
         frm_SelConta.qyPlanosContas.GotoBookmark(Bookmark);
         S := frm_SelConta.qyPlanosContasCD_CLASSIFICACAO.AsString;
         Item := TItem.Create(S, S);
         Add(Item);
      end;
end;

initialization
   RegisterClass(TfrmReportFilterClassePlanoConta);

finalization
   UnRegisterClass(TfrmReportFilterClassePlanoConta);

end.
