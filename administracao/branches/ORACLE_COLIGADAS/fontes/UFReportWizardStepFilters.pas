unit UFReportWizardStepFilters;

interface

uses
   Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
   Dialogs, UFReportWizardStepBase, StdCtrls, CheckLst, Buttons, DB, DBClient,
   ExtCtrls, Grids, DBGrids, uLkJSON, Menus, ImgList, ZDbcIntfs, UZDbcFuncs;

type
   TfrmReportWizardStepFilters = class(TfrmReportWizardStepBase)
      cdsFilters: TClientDataSet;
      cdsFiltersKind: TStringField;
      cdsFiltersName: TStringField;
      cdsFiltersPosition: TSmallintField;
      cdsFiltersRequired: TBooleanField;
      cdsFiltersTitle: TStringField;
      cdsFiltersVisible: TBooleanField;
      dbgFilters: TDBGrid;
      dsFilters: TDataSource;
      ilPopup: TImageList;
      miRequiredAll: TMenuItem;
      miRequiredNone: TMenuItem;
      miVisibleAll: TMenuItem;
      miVisibleNone: TMenuItem;
      pmRequired: TPopupMenu;
      pmVisible: TPopupMenu;
      sbMoveDown: TSpeedButton;
      sbMoveUp: TSpeedButton;
      procedure dbgFiltersCellClick(Column: TColumn);
      procedure dbgFiltersColEnter(Sender: TObject);
      procedure dbgFiltersDrawColumnCell(Sender: TObject; const Rect: TRect;
         DataCol: Integer; Column: TColumn; State: TGridDrawState);
      procedure dsFiltersDataChange(Sender: TObject; Field: TField);
      procedure miRequiredAllClick(Sender: TObject);
      procedure miRequiredNoneClick(Sender: TObject);
      procedure miVisibleAllClick(Sender: TObject);
      procedure miVisibleNoneClick(Sender: TObject);
      procedure sbMoveDownClick(Sender: TObject);
      procedure sbMoveUpClick(Sender: TObject);
   private
      FCounter: Integer;
      FSelectedRowIndex: Integer;
      function CanMoveBack: Boolean; override;
      function CanMoveFoward: Boolean; override;
      procedure Save; override;
      procedure Setup(const AState: TStepState); override;
   end;

implementation

{$R *.dfm}

{ TfrmReportWizardStepFilters }

function TfrmReportWizardStepFilters.CanMoveBack: Boolean;
begin
   Result := True;
end;

function TfrmReportWizardStepFilters.CanMoveFoward: Boolean;
begin
   Result := True;
end;

procedure TfrmReportWizardStepFilters.dbgFiltersCellClick(Column: TColumn);
begin
   if (Column.Field <> nil) and (Column.Field.DataType = ftBoolean) then
   begin
      Column.Field.DataSet.Edit;
      Column.Field.AsBoolean := not Column.Field.AsBoolean;
      Column.Field.DataSet.Post;
   end;
end;

procedure TfrmReportWizardStepFilters.dbgFiltersColEnter(Sender: TObject);
var
   DBGrid: TDBGrid;
begin
   DBGrid := TDBGrid(Sender);
   DBGrid.Options := DBGrid.Options + [dgEditing];

   if (DBGrid.SelectedField = nil) or
      (DBGrid.SelectedField.DataType = ftBoolean) then
   begin
      DBGrid.Options := DBGrid.Options - [dgEditing];
   end;
end;

procedure TfrmReportWizardStepFilters.dbgFiltersDrawColumnCell(Sender: TObject;
  const Rect: TRect; DataCol: Integer; Column: TColumn; State: TGridDrawState);
const
   IsChecked: array[Boolean] of Integer = (DFCS_BUTTONCHECK, DFCS_BUTTONCHECK or DFCS_CHECKED);
var
   DrawRect: TRect;
   DBGrid: TDBGrid;
begin
   DBGrid := TDBGrid(Sender);

   if (Column.Field <> nil) and (Column.Field.DataType = ftBoolean) then
   begin
      DrawRect := Rect;
      InflateRect(DrawRect, -2, -2);
      DBGrid.Canvas.FillRect(Rect);
      DrawFrameControl(DBGrid.Canvas.Handle, DrawRect, DFC_BUTTON,
         IsChecked[Column.Field.AsBoolean]);
   end;

   if (DataCol = 4) and
      (DBGrid.DataSource.DataSet.RecNo = FSelectedRowIndex) then
   begin
      DrawRect := Rect;
      
      if sbMoveUp.Parent <> DBGrid then
      begin
         sbMoveUp.Parent := DBGrid;      
      end;

      if sbMoveDown.Parent <> DBGrid then
      begin
         sbMoveDown.Parent := DBGrid;
      end;

      if sbMoveUp.Left <> DrawRect.Left then
      begin
         sbMoveUp.Left := DrawRect.Left;
         sbMoveDown.Left := DrawRect.Left + sbMoveUp.Width;
      end;

      if sbMoveUp.Top <> DrawRect.Top then
      begin
         sbMoveUp.Top := DrawRect.Top;
      end;

      if sbMoveDown.Top <> DrawRect.Top then
      begin
         sbMoveDown.Top := DrawRect.Top;
      end;

      sbMoveUp.Enabled := cdsFiltersPosition.AsInteger > 1;
      sbMoveDown.Enabled := cdsFiltersPosition.AsInteger < cdsFilters.RecordCount;

      sbMoveUp.Show;
      sbMoveDown.Show;
   end;
end;

procedure TfrmReportWizardStepFilters.dsFiltersDataChange(Sender: TObject;
  Field: TField);
begin
   FSelectedRowIndex := cdsFilters.RecNo;
end;

procedure TfrmReportWizardStepFilters.miRequiredAllClick(Sender: TObject);
begin
   cdsFilters.DisableControls;
   cdsFilters.First;

   while not cdsFilters.Eof do
   begin
      cdsFilters.Edit;
      cdsFiltersRequired.AsBoolean := True;
      cdsFilters.Next;
   end;

   cdsFilters.EnableControls;
end;

procedure TfrmReportWizardStepFilters.miRequiredNoneClick(Sender: TObject);
begin
   cdsFilters.DisableControls;
   cdsFilters.First;

   while not cdsFilters.Eof do
   begin
      cdsFilters.Edit;
      cdsFiltersRequired.AsBoolean := False;
      cdsFilters.Next;
   end;

   cdsFilters.EnableControls;
end;

procedure TfrmReportWizardStepFilters.miVisibleAllClick(Sender: TObject);
begin
   cdsFilters.DisableControls;
   cdsFilters.First;

   while not cdsFilters.Eof do
   begin
      cdsFilters.Edit;
      cdsFiltersVisible.AsBoolean := True;
      cdsFilters.Next;
   end;

   cdsFilters.EnableControls;
end;

procedure TfrmReportWizardStepFilters.miVisibleNoneClick(Sender: TObject);
begin
   cdsFilters.DisableControls;
   cdsFilters.First;

   while not cdsFilters.Eof do
   begin
      cdsFilters.Edit;
      cdsFiltersVisible.AsBoolean := False;
      cdsFilters.Next;
   end;

   cdsFilters.EnableControls;
end;

procedure TfrmReportWizardStepFilters.Save;
begin
   //
end;

procedure TfrmReportWizardStepFilters.sbMoveDownClick(Sender: TObject);
var
   CurrPos: Integer;
   Found: Boolean;
   Bookmark: TBookmark;
begin
   Bookmark := cdsFilters.GetBookmark;
   CurrPos := cdsFiltersPosition.AsInteger;
   Found := cdsFilters.Locate('Position', CurrPos + 1, []);
   
   if Found then
   begin
      cdsFilters.Edit;
      cdsFiltersPosition.AsInteger := CurrPos;
      cdsFilters.Post;

      cdsFilters.GotoBookmark(Bookmark);
      cdsFilters.Edit;
      cdsFiltersPosition.AsInteger := CurrPos + 1;
      cdsFilters.Post;
   end;
end;

procedure TfrmReportWizardStepFilters.sbMoveUpClick(Sender: TObject);
var
   CurrPos: Integer;
   Found: Boolean;
   Bookmark: TBookmark;
begin
   Bookmark := cdsFilters.GetBookmark;
   CurrPos := cdsFiltersPosition.AsInteger;
   Found := cdsFilters.Locate('Position', CurrPos - 1, []);
   
   if Found then
   begin
      cdsFilters.Edit;
      cdsFiltersPosition.AsInteger := CurrPos;
      cdsFilters.Post;

      cdsFilters.GotoBookmark(Bookmark);
      cdsFilters.Edit;
      cdsFiltersPosition.AsInteger := CurrPos - 1;
      cdsFilters.Post;
   end;
end;

procedure TfrmReportWizardStepFilters.Setup(const AState: TStepState);
begin
   inherited;
   Initialized := True;
end;

initialization
   RegisterClass(TfrmReportWizardStepFilters);

finalization
   UnRegisterClass(TfrmReportWizardStepFilters);

end.
