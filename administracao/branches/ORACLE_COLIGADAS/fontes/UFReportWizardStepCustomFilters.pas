unit UFReportWizardStepCustomFilters;

interface

uses
   Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
   Dialogs, UFReportWizardStepBase, DB, ZAbstractRODataset, UZDataset, DBCtrls,
   StdCtrls, Buttons, CheckLst, ExtCtrls, ZAbstractDataset, DBClient, Provider,
   ToolWin, ComCtrls, ImgList, Grids, DBGrids, Mask, uLkJSON, ZDbcIntfs,
   UZDbcFuncs;

type
   TfrmReportWizardStepCustomFilters = class(TfrmReportWizardStepBase)
      btnCancel: TToolButton;
      btnDelete: TToolButton;
      btnEdit: TToolButton;
      btnNew: TToolButton;
      btnSave: TToolButton;
      btnSep1: TToolButton;
      bvlSep1: TBevel;
      cdsFilters: TClientDataSet;
      cdsFiltersCD_FILTRO: TLargeintField;
      cdsFiltersCD_RELATORIO: TLargeintField;
      cdsFiltersCD_SQL: TLargeintField;
      cdsFiltersME_CONFIG: TMemoField;
      cdsFiltersNM_CAMPO: TStringField;
      cdsFiltersNM_CHAVE: TStringField;
      cdsFiltersNM_FILTRO: TStringField;
      cdsFiltersNM_SQL: TStringField;
      cdsFiltersNM_TITULO: TStringField;
      cdsFiltersNM_VALOR: TStringField;
      cdsFiltersNR_CLASSE: TSmallintField;
      cdsFiltersNR_ORDEM: TSmallintField;
      cdsFiltersSN_ATIVO: TSmallintField;
      cdsFiltersSN_OBRIGATORIO: TSmallintField;
      cdsSQL: TClientDataSet;
      cdsSQLCD_SQL: TLargeintField;
      cdsSQLME_CONFIG: TMemoField;
      cdsSQLNM_SQL: TStringField;
      clbButtons: TCoolBar;
      dbcbDescs: TDBComboBox;
      dbcbFields: TDBComboBox;
      dbcbKeys: TDBComboBox;
      dbchEnabled: TDBCheckBox;
      dbchRequired: TDBCheckBox;
      dbeName: TDBEdit;
      dbeTitle: TDBEdit;
      dbgFilters: TDBGrid;
      dblcSQL: TDBLookupComboBox;
      dbrgClass: TDBRadioGroup;
      dsFilters: TDataSource;
      dspFilters: TDataSetProvider;
      dspSQL: TDataSetProvider;
      ilButtons: TImageList;
      lblDesc: TLabel;
      lblField: TLabel;
      lblKey: TLabel;
      lblName: TLabel;
      lblSQL: TLabel;
      lblTitle: TLabel;
      pnlData: TPanel;
      pnlFields: TPanel;
      pnlFilters: TPanel;
      qryFilters: TUMZQuery;
      qryFiltersCD_FILTRO: TLargeintField;
      qryFiltersCD_RELATORIO: TLargeintField;
      qryFiltersCD_SQL: TLargeintField;
      qryFiltersME_CONFIG: TMemoField;
      qryFiltersNM_FILTRO: TStringField;
      qryFiltersNR_CLASSE: TSmallintField;
      qryFiltersNR_ORDEM: TSmallintField;
      qryFiltersSN_ATIVO: TSmallintField;
      qryFiltersSN_OBRIGATORIO: TSmallintField;
      qrySQL: TUMZReadOnlyQuery;
      qrySQLCD_SQL: TLargeintField;
      qrySQLME_CONFIG: TMemoField;
      qrySQLNM_SQL: TStringField;
      sbAdd: TSpeedButton;
      sbEdit: TSpeedButton;
      sbMoveDown: TSpeedButton;
      sbMoveUp: TSpeedButton;
      tlbButtons: TToolBar;
      procedure btnCancelClick(Sender: TObject);
      procedure btnDeleteClick(Sender: TObject);
      procedure btnEditClick(Sender: TObject);
      procedure btnNewClick(Sender: TObject);
      procedure btnSaveClick(Sender: TObject);
      procedure cdsFiltersBeforePost(DataSet: TDataSet);
      procedure cdsFiltersCalcFields(DataSet: TDataSet);
      procedure cdsFiltersCD_SQLChange(Sender: TField);
      procedure cdsFiltersNewRecord(DataSet: TDataSet);
      procedure dbgFiltersCellClick(Column: TColumn);
      procedure dbgFiltersDrawColumnCell(Sender: TObject; const Rect: TRect; DataCol: Integer; Column: TColumn; State: TGridDrawState);
      procedure dsFiltersDataChange(Sender: TObject; Field: TField);
      procedure dsFiltersStateChange(Sender: TObject);
      procedure sbAddClick(Sender: TObject);
      procedure sbEditClick(Sender: TObject);
      procedure sbMoveDownClick(Sender: TObject);
      procedure sbMoveUpClick(Sender: TObject);
   public
      function CanMoveBack: Boolean; override;
      function CanMoveFoward: Boolean; override;
      procedure LoadSQLFields;
      procedure ParseSettings;
      procedure SaveSettings;
      procedure Setup(const AState: TStepState); override;
   end;

implementation

uses
   UCrpe32, UFReportQueryBuilder;

{$R *.dfm}

{ TfrmReportWizardStepCustomFilters }

procedure TfrmReportWizardStepCustomFilters.btnCancelClick(Sender: TObject);
begin
   cdsFilters.Cancel;
end;

procedure TfrmReportWizardStepCustomFilters.btnDeleteClick(Sender: TObject);
const
   SCaption = 'Confirmação';
   SMessage = 'Deseja realmente excluir o filtro selecionado?';
var
   UserChoice: Integer;
begin
   UserChoice := MessageBox(Handle, SMessage, SCaption, MB_ICONQUESTION or
      MB_YESNO or MB_DEFBUTTON2);
   if UserChoice = ID_YES then
   begin
      cdsFilters.Delete;
   end;
end;

procedure TfrmReportWizardStepCustomFilters.btnEditClick(Sender: TObject);
begin
   cdsFilters.Edit;
   dbeName.SetFocus;
end;

procedure TfrmReportWizardStepCustomFilters.btnNewClick(Sender: TObject);
begin
   cdsFilters.Insert;
   dbeName.SetFocus;
end;

procedure TfrmReportWizardStepCustomFilters.btnSaveClick(Sender: TObject);
begin
   cdsFilters.Post;
end;

function TfrmReportWizardStepCustomFilters.CanMoveBack: Boolean;
begin
   Result := True;
end;

function TfrmReportWizardStepCustomFilters.CanMoveFoward: Boolean;
begin
   Result := True;
end;

procedure TfrmReportWizardStepCustomFilters.cdsFiltersBeforePost(
  DataSet: TDataSet);
begin
   SaveSettings;
end;

procedure TfrmReportWizardStepCustomFilters.cdsFiltersCalcFields(
  DataSet: TDataSet);
begin
   if DataSet.State = dsCalcFields then
   begin
      ParseSettings;
   end;
end;

procedure TfrmReportWizardStepCustomFilters.cdsFiltersCD_SQLChange(
  Sender: TField);
begin
   LoadSQLFields;
   sbEdit.Enabled := not cdsFiltersCD_SQL.IsNull;
end;

procedure TfrmReportWizardStepCustomFilters.cdsFiltersNewRecord(
  DataSet: TDataSet);
begin
   cdsFiltersCD_RELATORIO.AsLargeInt := ReportId;
end;

procedure TfrmReportWizardStepCustomFilters.dbgFiltersCellClick(
  Column: TColumn);
const
   ValueInversion: array[0..1] of Byte = (1, 0);
begin
   if (Column.Field <> nil) and
      (
         (Column.FieldName = 'SN_ATIVO') or
         (Column.FieldName = 'SN_OBRIGATORIO')
      ) then
   begin
      Column.Field.DataSet.Edit;
      Column.Field.AsInteger := ValueInversion[Column.Field.AsInteger];  
      Column.Field.DataSet.Post;
   end;
end;

procedure TfrmReportWizardStepCustomFilters.dbgFiltersDrawColumnCell(
  Sender: TObject; const Rect: TRect; DataCol: Integer; Column: TColumn;
  State: TGridDrawState);
const
   IsChecked: array[0..1] of Integer = (DFCS_BUTTONCHECK, DFCS_BUTTONCHECK or DFCS_CHECKED);
var
   DrawRect: TRect;
   DBGrid: TDBGrid;
begin
   DBGrid := TDBGrid(Sender);

   if (Column.Field <> nil) and
      (
         (Column.FieldName = 'SN_ATIVO') or
         (Column.FieldName = 'SN_OBRIGATORIO')
      ) then
   begin
      DrawRect := Rect;
      InflateRect(DrawRect, -2, -2);
      DBGrid.Canvas.FillRect(Rect);
      DrawFrameControl(DBGrid.Canvas.Handle, DrawRect, DFC_BUTTON,
         IsChecked[Column.Field.AsInteger]);
   end;

   if (DataCol = 3) and (gdSelected in State) then
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

      sbMoveUp.Enabled := cdsFiltersNR_ORDEM.AsInteger > 1;
      sbMoveDown.Enabled := cdsFiltersNR_ORDEM.AsInteger < cdsFilters.RecordCount;

      sbMoveUp.Show;
      sbMoveDown.Show;
   end;
end;

procedure TfrmReportWizardStepCustomFilters.dsFiltersDataChange(Sender: TObject;
  Field: TField);
begin
   LoadSQLFields;
   sbEdit.Enabled := not cdsFiltersCD_SQL.IsNull;
end;

procedure TfrmReportWizardStepCustomFilters.dsFiltersStateChange(
  Sender: TObject);
begin
   btnNew.Enabled := cdsFilters.State = dsBrowse;
   btnEdit.Enabled := (cdsFilters.State = dsBrowse) and (not cdsFilters.IsEmpty);
   btnDelete.Enabled := (cdsFilters.State = dsBrowse) and (not cdsFilters.IsEmpty);
   btnSave.Enabled := cdsFilters.State in [dsInsert, dsEdit];
   btnCancel.Enabled := cdsFilters.State in [dsInsert, dsEdit];
end;

procedure TfrmReportWizardStepCustomFilters.LoadSQLFields;
var
   Settings: TlkJSONobject;
   JSON, SQL: AnsiString;
   Rs: IZResultSet;
   I: Integer;
   Fields: TStrings;
begin
   JSON := UTF8Encode(cdsSQLME_CONFIG.AsString);
   Settings := TlkJSON.ParseText(JSON) as TlkJSONobject;
   SQL := Settings.getString('sql');
   Rs := ExecuteQuery(SQL);
   try
      Fields := TStringList.Create;
      try
         Fields.BeginUpdate;
         for I := 1 to Rs.GetMetadata.GetColumnCount do
         begin
            Fields.Add(Rs.GetMetadata.GetColumnName(I));
         end;
         Fields.EndUpdate;
         dbcbKeys.Items.Assign(Fields);
         dbcbDescs.Items.Assign(Fields);
      finally
         Fields.Free;
      end;
   finally
      Rs.Close;
   end;
end;

procedure TfrmReportWizardStepCustomFilters.ParseSettings;
var
   Settings: TlkJSONobject;
   JSON: AnsiString;
begin
   JSON := UTF8Encode(cdsFiltersME_CONFIG.AsString);
   Settings := TlkJSON.ParseText(JSON) as TlkJSONobject;
   cdsFiltersNM_TITULO.AsString := Settings.getString('label');
   cdsFiltersNM_CHAVE.AsString := Settings.getString('key');
   cdsFiltersNM_VALOR.AsString := Settings.getString('value');
   cdsFiltersNM_CAMPO.AsString := Settings.getString('field');
end;

procedure TfrmReportWizardStepCustomFilters.SaveSettings;
var
   Settings: TlkJSONobject;
   JSON: AnsiString;
begin
   Settings := TlkJSONobject.Create(True);
   try
      Settings.Add('label', cdsFiltersNM_TITULO.AsString);
      Settings.Add('key', cdsFiltersNM_CHAVE.AsString);
      Settings.Add('value', cdsFiltersNM_VALOR.AsString);
      Settings.Add('field', cdsFiltersNM_CAMPO.AsString);
      JSON := UTF8Decode(TlkJSON.GenerateText(Settings));
   finally
      Settings.Free;
   end;

   cdsFiltersME_CONFIG.AsString := JSON;
end;

procedure TfrmReportWizardStepCustomFilters.sbAddClick(Sender: TObject);
var
   SQLId: Cardinal;
begin
   SQLId := TfrmReportQueryBuilder.New;
   if SQLId <> 0 then
   begin
      cdsSQL.Refresh;
      cdsFiltersCD_SQL.AsLargeInt := SQLId;
   end;
end;

procedure TfrmReportWizardStepCustomFilters.sbEditClick(Sender: TObject);
begin
   if TfrmReportQueryBuilder.Edit(cdsFiltersCD_SQL.AsLargeInt) then
   begin
      LoadSQLFields;
   end;
end;

procedure TfrmReportWizardStepCustomFilters.sbMoveDownClick(Sender: TObject);
var
   CurrPos: Integer;
   Found: Boolean;
   Bookmark: TBookmark;
begin
   Bookmark := cdsFilters.GetBookmark;
   CurrPos := cdsFiltersNR_ORDEM.AsInteger;
   Found := cdsFilters.Locate('NR_ORDEM', CurrPos + 1, []);

   if Found then
   begin
      cdsFilters.Edit;
      cdsFiltersNR_ORDEM.AsInteger := CurrPos;
      cdsFilters.Post;

      cdsFilters.GotoBookmark(Bookmark);
      cdsFilters.Edit;
      cdsFiltersNR_ORDEM.AsInteger := CurrPos + 1;
      cdsFilters.Post;
   end;
end;

procedure TfrmReportWizardStepCustomFilters.sbMoveUpClick(Sender: TObject);
var
   CurrPos: Integer;
   Found: Boolean;
   Bookmark: TBookmark;
begin
   Bookmark := cdsFilters.GetBookmark;
   CurrPos := cdsFiltersNR_ORDEM.AsInteger;
   Found := cdsFilters.Locate('NR_ORDEM', CurrPos - 1, []);

   if Found then
   begin
      cdsFilters.Edit;
      cdsFiltersNR_ORDEM.AsInteger := CurrPos;
      cdsFilters.Post;

      cdsFilters.GotoBookmark(Bookmark);
      cdsFilters.Edit;
      cdsFiltersNR_ORDEM.AsInteger := CurrPos - 1;
      cdsFilters.Post;
   end;
end;

procedure TfrmReportWizardStepCustomFilters.Setup(const AState: TStepState);
begin
   inherited;
   if not Initialized then
   begin
      cdsFilters.Open;
      cdsSQL.Open;
      dbcbFields.Items.Assign(CRFields);
      Initialized := True;
   end;
end;

initialization
   RegisterClass(TfrmReportWizardStepCustomFilters);

finalization
   UnRegisterClass(TfrmReportWizardStepCustomFilters);

end.
