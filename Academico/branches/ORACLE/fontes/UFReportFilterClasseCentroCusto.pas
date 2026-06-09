unit UFReportFilterClasseCentroCusto;

interface

uses
   Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
   Dialogs, UFReportFilterList, StdCtrls, UStdCtrls, Buttons, ExtCtrls;

type
   TfrmReportFilterClasseCentroCusto = class(TfrmReportFilterList)
   private
      procedure AddItem; override;
   end;

implementation

uses
   UReportClasses, uSelCentro;

{$R *.dfm}

{ TfrmReportFilterClasseCentroCusto }

procedure TfrmReportFilterClasseCentroCusto.AddItem;
var
   Item: TItem;
   S: AnsiString;
begin
   frm_SelCentro.ShowModal;
   
   if frm_SelCentro.flgSearch then
   begin
      S := frm_SelCentro.qyCentrosCD_CLASSIFICACAO.AsString;
      Item := TItem.Create(S, S);
      Add(Item);
   end;
end;

initialization
   RegisterClass(TfrmReportFilterClasseCentroCusto);

finalization
   UnRegisterClass(TfrmReportFilterClasseCentroCusto);

end.
