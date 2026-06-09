unit UFReportFilterList;

interface

uses
   Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
   Dialogs, UFReportFilterComponent, StdCtrls, ExtCtrls, UStdCtrls, Buttons,
   UReportClasses;

type
   TfrmReportFilterList = class(TfrmReportFilterComponent)
      lbItems: TAutoSizeListBox;
      sbAdd: TSpeedButton;
      sbClear: TSpeedButton;
      sbDel: TSpeedButton;
      procedure sbAddClick(Sender: TObject);
      procedure sbClearClick(Sender: TObject);
      procedure sbDelClick(Sender: TObject);
   private
      function GetAsCrExpression: AnsiString; override;
      function GetAsCrExpressionByIndex(const Index: Integer): AnsiString; override;
      function GetAsHumanExpression: AnsiString; override;
      function GetAsSQLExpression: AnsiString; override;
      function GetCrOperator: AnsiString; override;
      function GetFirstItemAsCrExpression: AnsiString; override;
      function GetCount: Integer;
      function GetFirst: TItem;
      function GetItem(Index: Integer): TItem;
      function Validate: Boolean; override;
      procedure ResizeLabel(const MaxWidth: Integer); override;
   protected
      procedure AddItem; virtual;
      procedure Clear; override;
      procedure DeleteSelected; virtual;
   public
      procedure Add(const Item: TItem); virtual;
      property Count: Integer read GetCount;
      property Items[Index: Integer]: TItem read GetItem;
      property First: TItem read GetFirst;
   end;

implementation

{$R *.dfm}

procedure TfrmReportFilterList.Add(const Item: TItem);
var
   I: Integer;
   Found: Boolean;
begin
   if not Item.Empty then
   begin
      Found := False;

      for I := 0 to lbItems.Count - 1 do
         if TItem(lbItems.Items.Objects[I]).Equal(Item) then
         begin
            Found := True;
            Break;
         end;

      if not Found then
         lbItems.AddItem(Item.Name, Item);
   end;
end;

procedure TfrmReportFilterList.AddItem;
begin
   //
end;

procedure TfrmReportFilterList.Clear;
begin
   Perform(WM_SETREDRAW, WPARAM(False), 0);
   lbItems.Clear;
   pnlContent.AutoSize := False;
   AutoSize := False;
   pnlContent.Height := 27;
   Height := 27;
   AutoSize := True;
   pnlContent.AutoSize := True;
   Perform(WM_SETREDRAW, WPARAM(True), 0);
   RedrawWindow(Handle, nil, 0, RDW_ERASE or RDW_INVALIDATE or RDW_ALLCHILDREN);
end;

procedure TfrmReportFilterList.DeleteSelected;
begin
   Perform(WM_SETREDRAW, WPARAM(False), 0);
   lbItems.DeleteSelected;
   pnlContent.AutoSize := False;
   AutoSize := False;
   pnlContent.Height := 27;
   Height := 27;
   AutoSize := True;
   pnlContent.AutoSize := True;
   Perform(WM_SETREDRAW, WPARAM(True), 0);
   RedrawWindow(Handle, nil, 0, RDW_ERASE or RDW_INVALIDATE or RDW_ALLCHILDREN);
end;

function TfrmReportFilterList.GetAsCrExpression: AnsiString;
const
   SFilterFmt = '[%s]';
var
   Item: TItem;
   Items: TStrings;
   I: Integer;
begin
   if lbItems.Count = 0 then
   begin
      Result := '';
   end;

   if lbItems.Count > 0 then
   begin
      Items := TStringList.Create;
      try
         Items.Delimiter := ',';
         Items.StrictDelimiter := True;
         for I := 0 to lbItems.Count - 1 do
         begin
            Item := TItem(lbItems.Items.Objects[I]);
            Items.Add(Item.FormattedId);
         end;
         Result := Format(SFilterFmt, [Items.DelimitedText]);
      finally
         Items.Free;
      end;
   end;
end;

function TfrmReportFilterList.GetAsCrExpressionByIndex(
  const Index: Integer): AnsiString;
var
   Item: TItem;
begin
   Result := '';
   
   if Index in [0..lbItems.Count] then
   begin
      Item := TItem(lbItems.Items.Objects[Index]);
      Result := Item.FormattedId;
   end;
end;

function TfrmReportFilterList.GetAsHumanExpression: AnsiString;
const
   SItemPlusFmt = '%s + ';
   SItemConcatFmt = '%schr(13) + chr(9) + %s';
var
   I: Integer;
   Item: TItem;
   S: AnsiString;
begin
   Result := '';
   
   if lbItems.Count = 1 then
   begin
      Result := AnsiQuotedStr(TItem(lbItems.Items.Objects[0]).Name, #34);
   end;

   if lbItems.Count > 1 then
   begin
      for I := 0 to lbItems.Count - 1 do
      begin
         if Result <> '' then
            Result := Format(SItemPlusFmt, [Result]);
         
         Item := TItem(lbItems.Items.Objects[I]);
         S := AnsiQuotedStr(Item.Name, #34);
         Result := Format(SItemConcatFmt, [Result, S]);
      end;
   end;
   
end;

function TfrmReportFilterList.GetAsSQLExpression: AnsiString;
const
   SFilterFmt = '(%s)';
var
   Item: TItem;
   Items: TStrings;
   I: Integer;
begin
   if lbItems.Count = 0 then
   begin
      Result := '';
   end;

   if lbItems.Count > 0 then
   begin
      Items := TStringList.Create;
      try
         Items.Delimiter := ',';
         Items.StrictDelimiter := True;
         for I := 0 to lbItems.Count - 1 do
         begin
            Item := TItem(lbItems.Items.Objects[I]);
            Items.Add(Item.FormattedId);
         end;
         Result := Format(SFilterFmt, [Items.DelimitedText]);
      finally
         Items.Free;
      end;
   end;
end;

function TfrmReportFilterList.GetCount: Integer;
begin
   Result := lbItems.Count;
end;

function TfrmReportFilterList.GetCrOperator: AnsiString;
begin
   Result := 'in';
end;

function TfrmReportFilterList.GetFirst: TItem;
begin
   Result := nil;
   
   if lbItems.Count > 0 then
   begin
      Result := Items[0];
   end;
end;

function TfrmReportFilterList.GetFirstItemAsCrExpression: AnsiString;
var
   Item: TItem;
begin
   if lbItems.Count = 0 then
   begin
      Result := '';
   end;

   if lbItems.Count > 0 then
   begin
      Item := TItem(lbItems.Items.Objects[0]);
      Result := Item.FormattedId;
   end;
end;

function TfrmReportFilterList.GetItem(Index: Integer): TItem;
begin
   Result := nil;
   
   if lbItems.Count > Index then
   begin
      Result := TItem(lbItems.Items.Objects[Index]);
   end;
end;

procedure TfrmReportFilterList.ResizeLabel(const MaxWidth: Integer);
begin
   inherited;
   lbItems.Left := pnlLabel.Left + pnlLabel.Width + 3;
   sbAdd.Left := lbItems.Left + lbItems.Width + 3;
   sbDel.Left := sbAdd.Left + sbAdd.Width;
   sbClear.Left := sbDel.Left + sbDel.Width;
end;

procedure TfrmReportFilterList.sbAddClick(Sender: TObject);
begin
   lbItems.Items.BeginUpdate;
   AddItem;
   lbItems.Items.EndUpdate;
end;

procedure TfrmReportFilterList.sbClearClick(Sender: TObject);
begin
   lbItems.Items.BeginUpdate;
   Clear;
   lbItems.Items.EndUpdate;
end;

procedure TfrmReportFilterList.sbDelClick(Sender: TObject);
begin
   lbItems.Items.BeginUpdate;
   DeleteSelected;
   lbItems.Items.EndUpdate;
end;

function TfrmReportFilterList.Validate: Boolean;
begin
   Result := (not Required) or (lbItems.Count > 0);
end;

end.
