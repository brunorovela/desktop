unit UFReportFilterTipoTitulo;

interface

uses
   Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
   Dialogs, UFReportFilterList, StdCtrls, UStdCtrls, Buttons, ExtCtrls;

type
   TfrmReportFilterTipoTitulo = class(TfrmReportFilterList)
   private
      procedure AddItem; override;
   end;

implementation

uses
   UReportClasses, uSelTipoTitulo;

{$R *.dfm}

{ TfrmReportFilterTipoTitulo }

procedure TfrmReportFilterTipoTitulo.AddItem;
var
   I, Id: Integer;
   Name: AnsiString;
   Item: TItem;
begin
   if frmSelTipoTitulo = nil then
   begin
      Application.CreateForm(TfrmSelTipoTitulo, frmSelTipoTitulo);
      frmSelTipoTitulo.slTitulos := TStringList.Create;
   end;

   if frmSelTipoTitulo.ShowModal = mrOk then
   begin
      for I := 0 to frmSelTipoTitulo.cklbTitulos.Count - 1 do
      begin
         if frmSelTipoTitulo.cklbTitulos.Checked[I] then
         begin
            Id := StrToIntDef(frmSelTipoTitulo.slTitulos.Strings[I], 0);
            Name := frmSelTipoTitulo.cklbTitulos.Items[I];
            Item := TItem.Create(Id, Name);
            Add(Item);
         end;
      end;
   end;
end;

initialization
   RegisterClass(TfrmReportFilterTipoTitulo);

finalization
   UnRegisterClass(TfrmReportFilterTipoTitulo);

end.
