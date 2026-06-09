unit UFReportFilterCustomSearch;

interface

uses
   Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
   Dialogs, UFReportFilterCustom, StdCtrls, ExtCtrls, UStdCtrls, Buttons, DB,
   UReportClasses, UFReportSearchWindow;

type
   TfrmReportFilterCustomSearch = class(TfrmReportFilterCustom)
      lbItems: TAutoSizeListBox;
      sbAdd: TSpeedButton;
      sbClear: TSpeedButton;
      sbDel: TSpeedButton;
      procedure sbAddClick(Sender: TObject);
      procedure sbClearClick(Sender: TObject);
      procedure sbDelClick(Sender: TObject);
   private
      FSearchWindow: TfrmReportSearchWindow;
      function GetAsCrExpression: AnsiString; override;
      function GetAsHumanExpression: AnsiString; override;
      function GetAsSQLExpression: AnsiString; override;
      function GetFirstItemAsCrExpression: AnsiString; override;
      function Validate: Boolean; override;
      function KeyFieldIsString: Boolean; override;
      procedure Add(const Item: TItem);
      procedure Clear; override;
      procedure ResizeLabel(const MaxWidth: Integer); override;
      procedure Setup; override;
      procedure UpdateRect;
   end;

implementation

uses
   Contnrs, UFReportFilterComponent;

const
   FieldStringTypes = [ftString, ftMemo, ftFixedChar, ftWideString, ftAdt,
      ftFixedWideChar, ftWideMemo];

{$R *.dfm}

{ TfrmReportFilterCustomSearch }

procedure TfrmReportFilterCustomSearch.Add(const Item: TItem);
var
   I: Integer;
   Found: Boolean;
begin
   Found := False;

   for I := 0 to lbItems.Count - 1 do
   begin
      if TItem(lbItems.Items.Objects[I]).Equal(Item) then
      begin
         Found := True;
         Break;
      end;
   end;

   if not Found then
      lbItems.AddItem(Item.Name, Item);
end;

procedure TfrmReportFilterCustomSearch.Clear;
begin
   lbItems.Items.BeginUpdate;
   lbItems.Clear;
   lbItems.Items.EndUpdate;
   UpdateRect;
end;

function TfrmReportFilterCustomSearch.GetAsCrExpression: AnsiString;
const
   SFilterFmt = '%s in [%s]';
var
   Item: TItem;
   Items: TStrings;
   I: Integer;
   FieldName, Value, S: AnsiString;
begin
   Value := '';
   Result := '';

   if lbItems.Count > 0 then
   begin

      Items := TStringList.Create;
      try
      
         Items.Delimiter := ',';
         Items.StrictDelimiter := True;
                  
         for I := 0 to lbItems.Count - 1 do
         begin
            Item := TItem(lbItems.Items.Objects[I]);
            S := Item.ID;

            if KeyFieldIsString then
            begin
               S := QuotedStr(S);
            end;
            
            Items.Add(S);
         end;
                  
         Value := Format(SFilterFmt, [Items.DelimitedText]);
         
      finally
         Items.Free;
      end;
      
   end;

   if Value <> '' then
   begin
      FieldName := Settings.getString('field');
      Result := Format(SFilterFmt, [FieldName, Value]);
   end;
end;

function TfrmReportFilterCustomSearch.GetAsHumanExpression: AnsiString;
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
         Item := TItem(lbItems.Items.Objects[I]);
         S := AnsiQuotedStr(Item.Name, #34);
         if Result <> '' then
            Result := Format(SItemPlusFmt, [Result]);
         Result := Format(SItemConcatFmt, [Result, S]);
      end;
   end;
end;

function TfrmReportFilterCustomSearch.GetAsSQLExpression: AnsiString;
const
   SFilterFmt = '(%s)';
var
   Item: TItem;
   Items: TStrings;
   I: Integer;
   FieldName, KeyField, S: AnsiString;
   FieldType: TFieldType;
   IsStringType: Boolean;
begin
   Result := '';

   if lbItems.Count > 0 then
   begin

      KeyField := Settings.getString('key');
      FieldType := FSearchWindow.FieldType[KeyField];
      IsStringType := FieldType in FieldStringTypes;
      
      Items := TStringList.Create;
      try
         Items.Delimiter := ',';
         Items.StrictDelimiter := True;
         
         for I := 0 to lbItems.Count - 1 do
         begin
            Item := TItem(lbItems.Items.Objects[I]);
            S := Item.ID;
            
            if IsStringType then
            begin
               S := QuotedStr(S);
            end;
            
            Items.Add(S);
         end;
         
         Result := Format(SFilterFmt, [Items.DelimitedText]);
         
      finally
         Items.Free;
      end;
   end;
end;

function TfrmReportFilterCustomSearch.GetFirstItemAsCrExpression: AnsiString;
begin
   Result := '';
end;

function TfrmReportFilterCustomSearch.KeyFieldIsString: Boolean;
var
   KeyField: AnsiString;
   FieldType: TFieldType;
begin
   KeyField := Settings.getString('key');
   FieldType := FSearchWindow.FieldType[KeyField];
   Result := FieldType in FieldStringTypes;
end;

procedure TfrmReportFilterCustomSearch.ResizeLabel(const MaxWidth: Integer);
begin
   inherited;
   lbItems.Left := pnlLabel.Left + pnlLabel.Width + 3;
   sbAdd.Left := lbItems.Left + lbItems.Width + 3;
   sbDel.Left := sbAdd.Left + sbAdd.Width;
   sbClear.Left := sbDel.Left + sbDel.Width;
end;

procedure TfrmReportFilterCustomSearch.sbAddClick(Sender: TObject);
var
   KeyField, ValueField: AnsiString;
   FoundItems: TObjectList;
   I: Integer;
begin
   KeyField := Settings.getString('key');
   ValueField := Settings.getString('value');

   FoundItems := FSearchWindow.Search(KeyField, ValueField);
   try
   
      lbItems.Items.BeginUpdate;
      for I := 0 to FoundItems.Count - 1 do
      begin
         Add(TItem(FoundItems[I]));
      end;
      lbItems.Items.EndUpdate;
      
   finally
      FoundItems := nil;
   end;
end;

procedure TfrmReportFilterCustomSearch.sbClearClick(Sender: TObject);
begin
   Clear;
end;

procedure TfrmReportFilterCustomSearch.sbDelClick(Sender: TObject);
begin
   lbItems.Items.BeginUpdate;
   lbItems.DeleteSelected;
   lbItems.Items.EndUpdate;
   UpdateRect;
end;

procedure TfrmReportFilterCustomSearch.Setup;
begin
   inherited;
   FSearchWindow := TfrmReportSearchWindow.Create(Owner, SQLSettings, True);
end;

procedure TfrmReportFilterCustomSearch.UpdateRect;
begin
   Perform(WM_SETREDRAW, WPARAM(False), 0);
   pnlContent.AutoSize := False;
   AutoSize := False;
   pnlContent.Height := 27;
   Height := 27;
   AutoSize := True;
   pnlContent.AutoSize := True;
   Perform(WM_SETREDRAW, WPARAM(True), 0);
   RedrawWindow(Handle, nil, 0, RDW_ERASE or RDW_INVALIDATE or RDW_ALLCHILDREN);
end;

function TfrmReportFilterCustomSearch.Validate: Boolean;
begin
   Result := (not Required) or (lbItems.Count > 0);
end;

initialization
   RegisterClass(TfrmReportFilterCustomSearch);

finalization
   UnRegisterClass(TfrmReportFilterCustomSearch);

end.
