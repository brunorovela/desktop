unit UFReportFilterCustomSelect;

interface

uses
   Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
   Dialogs, UFReportFilterCustom, StdCtrls, ExtCtrls, CheckLst, Buttons, DB,
   ZAbstractRODataset, UZDataset, ZDbcIntfs, UZDbcFuncs;

type
   TfrmReportFilterCustomSelect = class(TfrmReportFilterCustom)
      clbItems: TCheckListBox;
      sbCheckAll: TSpeedButton;
      sbUncheckAll: TSpeedButton;
      procedure sbCheckAllClick(Sender: TObject);
      procedure sbUncheckAllClick(Sender: TObject);
   private
      FKeyFieldType: TZSQLType;
      function GetAsCrExpression: AnsiString; override;
      function GetAsHumanExpression: AnsiString; override;
      function GetAsSQLExpression: AnsiString; override;
      function GetFirstItemAsCrExpression: AnsiString; override;
      function KeyFieldIsString: Boolean; override;
      procedure Clear; override;
      procedure Setup; override;
      procedure ResizeLabel(const MaxWidth: Integer); override;
      function Validate: Boolean; override;
   end;

implementation

uses
   UReportClasses, UFReportFilterComponent;

const
   FieldStringTypes = [stString, stUnicodeString, stAsciiStream, stUnicodeStream];

{$R *.dfm}

{ TfrmReportFilterCustomSelect }

procedure TfrmReportFilterCustomSelect.Clear;
var
   I: Integer;
begin
   clbItems.Items.BeginUpdate;
   for I := 0 to clbItems.Count - 1 do
   begin
      clbItems.Checked[I] := False;
   end;
   clbItems.Items.EndUpdate;
end;

function TfrmReportFilterCustomSelect.GetAsCrExpression: AnsiString;
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

   if clbItems.Count > 0 then
   begin

      Items := TStringList.Create;
      try

         Items.Delimiter := ',';
         Items.StrictDelimiter := True;
         
         for I := 0 to clbItems.Count - 1 do
         begin
            if clbItems.Checked[I] then
            begin
               Item := TItem(clbItems.Items.Objects[I]);
               S := Item.ID;
               
               if KeyFieldIsString then
               begin
                  S := QuotedStr(S);
               end;

               Items.Add(S);
            end;
         end;
         
         Value := Items.DelimitedText;
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

function TfrmReportFilterCustomSelect.GetAsHumanExpression: AnsiString;
const
   SItemPlusFmt = '%s + ';
   SItemConcatFmt = '%schr(13) + chr(9) + %s';
var
   CheckedItems: array of Integer;
   I, L, H, Index, CheckedCount: Integer;
   Item: TItem;
   S: AnsiString;
begin
   Result := '';
   CheckedCount := 0;

   for I := 0 to clbItems.Count - 1 do
   begin
      if clbItems.Checked[I] then
      begin
         Inc(CheckedCount);
      end;
   end;

   Index := 0;
   SetLength(CheckedItems, CheckedCount);

   for I := 0 to clbItems.Count - 1 do
   begin
      if clbItems.Checked[I] then
      begin
         CheckedItems[Index] := I;
         Inc(Index);
      end;
   end;

   L := Low(CheckedItems);
   H := High(CheckedItems);

   if CheckedCount = 1 then
   begin
      Index := CheckedItems[L];
      Result := AnsiQuotedStr(TItem(clbItems.Items.Objects[Index]).Name, #34);
   end;

   if CheckedCount > 1 then
   begin
      for I := L to H do
      begin
         Item := TItem(clbItems.Items.Objects[I]);
         S := AnsiQuotedStr(Item.Name, #34);
         if Result <> '' then
            Result := Format(SItemPlusFmt, [Result]);
         Result := Format(SItemConcatFmt, [Result, S]);
      end;
   end;

   SetLength(CheckedItems, 0);
end;

function TfrmReportFilterCustomSelect.GetAsSQLExpression: AnsiString;
const
   SFilterFmt = '(%s)';
var
   Item: TItem;
   Items: TStrings;
   I: Integer;
   FieldName, S: AnsiString;
   IsStringType: Boolean;
begin
   Result := '';

   if clbItems.Count > 0 then
   begin

      IsStringType := FKeyFieldType in FieldStringTypes;

      Items := TStringList.Create;
      
      try
         Items.Delimiter := ',';
         Items.StrictDelimiter := True;
         
         for I := 0 to clbItems.Count - 1 do
         begin
            Item := TItem(clbItems.Items.Objects[I]);
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

function TfrmReportFilterCustomSelect.GetFirstItemAsCrExpression: AnsiString;
begin
   Result := '';
end;

function TfrmReportFilterCustomSelect.KeyFieldIsString: Boolean;
begin
   Result := FKeyFieldType in FieldStringTypes;
end;

procedure TfrmReportFilterCustomSelect.ResizeLabel(const MaxWidth: Integer);
begin
   inherited;
   clbItems.Left := pnlLabel.Left + pnlLabel.Width + 3;
   sbCheckAll.Left := clbItems.Left + clbItems.Width + 3;
   sbUncheckAll.Left := sbCheckAll.Left;
end;

procedure TfrmReportFilterCustomSelect.sbCheckAllClick(Sender: TObject);
var
   I: Integer;
begin
   clbItems.Items.BeginUpdate;
   for I := 0 to clbItems.Count - 1 do
   begin
      clbItems.Checked[I] := True;
   end;
   clbItems.Items.EndUpdate;
end;

procedure TfrmReportFilterCustomSelect.sbUncheckAllClick(Sender: TObject);
begin
   Clear;
end;

procedure TfrmReportFilterCustomSelect.Setup;
var
   Rs: IZResultSet;
   Item: TItem;
   KeyField, ValueField: AnsiString;
   I: Integer;
begin
   inherited;

   KeyField := Settings.getString('key');
   ValueField := Settings.getString('value');

   Rs := ExecuteQuery(SQLSettings.getString('sql'));
   try

      I := Rs.FindColumn(KeyField);

      FKeyFieldType := stUnknown;

      if I <> -1 then
      begin
         FKeyFieldType := Rs.GetMetadata.GetColumnType(I);
      end;

      clbItems.Items.BeginUpdate;
      while Rs.Next do
      begin
         Item := TItem.Create(
            Rs.GetStringByName(KeyField),
            Rs.GetStringByName(ValueField));
         clbItems.AddItem(Item.Name, Item);
      end;
      clbItems.Items.EndUpdate;
      
   finally
      Rs.Close;
   end;
end;

function TfrmReportFilterCustomSelect.Validate: Boolean;
begin
   Result := (not Required) or (clbItems.Count > 0);
end;

initialization
   RegisterClass(TfrmReportFilterCustomSelect);

finalization
   UnRegisterClass(TfrmReportFilterCustomSelect);

end.
