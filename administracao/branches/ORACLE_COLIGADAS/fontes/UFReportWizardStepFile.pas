unit UFReportWizardStepFile;

interface

uses
   Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
   Dialogs, UFReportWizardStepBase, Buttons, StdCtrls, DB, ZAbstractRODataset,
   UZDataset, ExtCtrls, Grids, DBGrids, UZSortedGrid, Provider, DBClient,
   UDBGrids, md5;

type
   TfrmReportWizardStepFile = class(TfrmReportWizardStepBase)
      bvlSep1: TBevel;
      cdsFiles: TClientDataSet;
      cdsFilesCD_ARQUIVO: TLargeintField;
      cdsFilesDS_CHAVE: TStringField;
      cdsFilesDS_MD5: TStringField;
      cdsFilesME_ARQUIVO: TBlobField;
      cdsFilesNM_ARQUIVO: TStringField;
      cdsFilesSelected: TBooleanField;
      dbgFiles: TSortedDBGrid;
      dsFiles: TDataSource;
      dspFiles: TDataSetProvider;
      edtFileKey: TEdit;
      edtFilePath: TEdit;
      edtFileSearch: TEdit;
      lblDuplicateFile: TLabel;
      lblDuplicateKey: TLabel;
      lblFileKey: TLabel;
      lblFilePath: TLabel;
      lblFileSearch: TLabel;
      odlgReportFile: TOpenDialog;
      pnlFiles: TPanel;
      pnlNew: TPanel;
      pnlRecords: TPanel;
      pnlSearchOptions: TPanel;
      qryFiles: TUMZReadOnlyQuery;
      qryFilesCD_ARQUIVO: TLargeintField;
      qryFilesDS_CHAVE: TStringField;
      qryFilesDS_MD5: TStringField;
      qryFilesME_ARQUIVO: TBlobField;
      qryFilesNM_ARQUIVO: TStringField;
      rbChooseFile: TRadioButton;
      rbNew: TRadioButton;
      sbDownloadFile: TSpeedButton;
      sbFileClear: TSpeedButton;
      sbFileSelect: TSpeedButton;
      sdlgReportFile: TSaveDialog;
      procedure dbgFilesCellClick(Column: TColumn);
      procedure dbgFilesDrawColumnCell(Sender: TObject; const Rect: TRect;
         DataCol: Integer; Column: TColumn; State: TGridDrawState);
      procedure dsFilesDataChange(Sender: TObject; Field: TField);
      procedure edtFileKeyChange(Sender: TObject);
      procedure edtFilePathChange(Sender: TObject);
      procedure edtFileSearchChange(Sender: TObject);
      procedure rbChooseFileClick(Sender: TObject);
      procedure rbNewClick(Sender: TObject);
      procedure sbDownloadFileClick(Sender: TObject);
      procedure sbFileClearClick(Sender: TObject);
      procedure sbFileSelectClick(Sender: TObject);
   public
      FSelectedRowIndex: Integer;
      function CanMoveFoward: Boolean; override;
      function CanMoveBack: Boolean; override;
      function FindFile(const FilePath: AnsiString): Boolean;
      function FindKey(const Key: AnsiString): Boolean;
      procedure ApplyFilter;
      procedure Save; override;
      procedure Setup(const AState: TStepState); override;
   end;

implementation

{$R *.dfm}

procedure TfrmReportWizardStepFile.ApplyFilter;
const
   SFilterFmt = 'NM_ARQUIVO LIKE ''*%s*''';
var
   S: AnsiString;
begin
   S := Trim(edtFileSearch.Text);

   if S <> '' then
   begin
      cdsFiles.Filter := Format(SFilterFmt, [S]);
      cdsFiles.Filtered := True;
   end;

   if S = '' then
      cdsFiles.Filtered := False;
end;

function TfrmReportWizardStepFile.CanMoveBack: Boolean;
begin
   Result := False;
end;

function TfrmReportWizardStepFile.CanMoveFoward: Boolean;
var
   KeyFound, FileFound: Boolean;
begin
   if rbNew.Checked then
   begin
      KeyFound := FindKey(edtFileKey.Text);
      FileFound := FindFile(edtFilePath.Text);
      lblDuplicateKey.Visible := KeyFound;
      lblDuplicateFile.Visible := FileFound;
      
      Result :=
         (edtFilePath.Text <> '') and
         (edtFileKey.Text <> '') and
         (not KeyFound) and
         (not FileFound);
   end;

   if rbChooseFile.Checked then
   begin
      cdsFiles.DisableControls;
      cdsFiles.Filter := 'Selected';
      cdsFiles.Filtered := True;
      Result := not cdsFiles.IsEmpty;
      ApplyFilter;
      cdsFiles.EnableControls;
   end;
end;

procedure TfrmReportWizardStepFile.dbgFilesCellClick(Column: TColumn);
var
   Bookmark: TBookmark;
   DataSet: TDataSet;
begin
   if (Column.Field <> nil) and (Column.Field.DataType = ftBoolean) then
   begin
      DataSet := Column.Field.DataSet;
      Bookmark := DataSet.GetBookmark;

      DataSet.DisableControls;
      DataSet.Filter := 'Selected';
      DataSet.Filtered := True;
      if not DataSet.IsEmpty then
      begin
         DataSet.Edit;
         DataSet.FieldByName('Selected').AsBoolean := False;
         DataSet.Post;
      end;
      ApplyFilter;
      DataSet.EnableControls;

      DataSet.GotoBookmark(Bookmark);
      Column.Field.DataSet.Edit;
      Column.Field.AsBoolean := not Column.Field.AsBoolean;
      Column.Field.DataSet.Post;
      
      UpdateStatus;
   end;
end;

procedure TfrmReportWizardStepFile.dbgFilesDrawColumnCell(Sender: TObject;
  const Rect: TRect; DataCol: Integer; Column: TColumn; State: TGridDrawState);
const
   IsChecked: array[Boolean] of Integer = (DFCS_BUTTONRADIO, DFCS_BUTTONRADIO or DFCS_CHECKED);
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

      if sbDownloadFile.Parent <> DBGrid then
         sbDownloadFile.Parent := DBGrid;

      if sbDownloadFile.Left <> DrawRect.Left then
         sbDownloadFile.Left := DrawRect.Left;

      if sbDownloadFile.Top <> DrawRect.Top then
         sbDownloadFile.Top := DrawRect.Top;

      sbDownloadFile.Show;
   end;
end;

procedure TfrmReportWizardStepFile.dsFilesDataChange(Sender: TObject;
  Field: TField);
begin
   FSelectedRowIndex := cdsFiles.RecNo;
end;

procedure TfrmReportWizardStepFile.edtFileKeyChange(Sender: TObject);
begin
   UpdateStatus;
end;

procedure TfrmReportWizardStepFile.edtFilePathChange(Sender: TObject);
begin
   UpdateStatus;
end;

procedure TfrmReportWizardStepFile.edtFileSearchChange(Sender: TObject);
begin
   cdsFiles.DisableControls;
   ApplyFilter;
   cdsFiles.EnableControls;
end;

function TfrmReportWizardStepFile.FindFile(const FilePath: AnsiString): Boolean;
const
   SFilterFmt = 'DS_MD5 = ''%s''';
var
   MD5: AnsiString;
begin
   MD5 := MD5Print(MD5File(FilePath));
   cdsFiles.DisableControls;
   cdsFiles.Filter := Format(SFilterFmt, [MD5]);
   cdsFiles.Filtered := True;
   Result := not cdsFiles.IsEmpty;
   ApplyFilter;
   cdsFiles.EnableControls;
end;

function TfrmReportWizardStepFile.FindKey(const Key: AnsiString): Boolean;
const
   SFilterFmt = 'DS_CHAVE = ''%s''';
begin
   cdsFiles.DisableControls;
   cdsFiles.Filter := Format(SFilterFmt, [Key]);
   cdsFiles.Filtered := True;
   Result := not cdsFiles.IsEmpty;
   ApplyFilter;
   cdsFiles.EnableControls;
end;

procedure TfrmReportWizardStepFile.rbChooseFileClick(Sender: TObject);
begin
   rbNew.Checked := False;
   lblFilePath.Enabled := False;
   edtFilePath.Enabled := False;
   lblFileKey.Enabled := False;
   edtFileKey.Enabled := False;
   sbFileSelect.Enabled := False;
   sbFileClear.Enabled := False;
   lblFileSearch.Enabled := True;
   edtFileSearch.Enabled := True;
   sbDownloadFile.Enabled := True;
   dbgFiles.Enabled := True;
   dbgFiles.Refresh;
   UpdateStatus;
end;

procedure TfrmReportWizardStepFile.rbNewClick(Sender: TObject);
begin
   rbChooseFile.Checked := False;
   lblFileSearch.Enabled := False;
   edtFileSearch.Enabled := False;
   sbDownloadFile.Enabled := False;
   dbgFiles.Enabled := False;
   lblFilePath.Enabled := True;
   edtFilePath.Enabled := True;
   lblFileKey.Enabled := True;
   edtFileKey.Enabled := True;
   sbFileSelect.Enabled := True;
   sbFileClear.Enabled := True;
   UpdateStatus;
end;

procedure TfrmReportWizardStepFile.Save;
begin
   //
end;

procedure TfrmReportWizardStepFile.sbFileSelectClick(Sender: TObject);
begin
   if odlgReportFile.Execute then
   begin
      edtFilePath.Text := odlgReportFile.FileName;
      Crpe.ReportName := odlgReportFile.FileName;
      UpdateStatus;
   end;
end;

procedure TfrmReportWizardStepFile.sbDownloadFileClick(Sender: TObject);
begin
   if sdlgReportFile.Execute then
   begin
      cdsFilesME_ARQUIVO.SaveToFile(sdlgReportFile.FileName);
   end;
end;

procedure TfrmReportWizardStepFile.sbFileClearClick(Sender: TObject);
begin
   edtFilePath.Clear;
end;

procedure TfrmReportWizardStepFile.Setup(const AState: TStepState);
begin
   inherited;
   if not Initialized then
   begin
      Initialized := True;
      cdsFiles.Open;
   end;
end;

initialization
   RegisterClass(TfrmReportWizardStepFile);

finalization
   UnRegisterClass(TfrmReportWizardStepFile);

end.
