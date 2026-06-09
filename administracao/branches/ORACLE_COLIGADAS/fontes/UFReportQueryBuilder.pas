unit UFReportQueryBuilder;

interface

uses
   Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
   Dialogs, ExtCtrls, ComCtrls, Tabs, SynEdit, SynEditHighlighter, ZDbcIntfs,
   SynHighlighterSQL, DB, ZAbstractRODataset, UZDataset, Grids, DBGrids,
   UZSortedGrid, Menus, StdCtrls, StrUtils, Buttons, ZAbstractDataset, uLkJSON,
   ImgList, DBClient, Mask, DBCtrls;

type
   TfrmReportQueryBuilder = class(TForm)
      bbtnCancelar: TBitBtn;
      bbtnSalvar: TBitBtn;
      bvlSep1: TBevel;
      bvlSep2: TBevel;
      bvlSep3: TBevel;
      bvlSep4: TBevel;
      dbgSQL: TZSortedGrid;
      dsSQL: TDataSource;
      edtAuthor: TEdit;
      edtName: TEdit;
      edtSearch: TEdit;
      edtWindowTitle: TEdit;
      imgSQL: TImage;
      lblAuthor: TLabel;
      lblInfo: TLabel;
      lblName: TLabel;
      lblSearch: TLabel;
      lblTitle: TLabel;
      lblWindowTitle: TLabel;
      miColulmnFilterEqual: TMenuItem;
      miColumnFilter: TMenuItem;
      miColumnFilterLike: TMenuItem;
      miColumnFilterNone: TMenuItem;
      miColumnTitle: TMenuItem;
      miSep1: TMenuItem;
      pgcSteps: TPageControl;
      pmColumnOptions: TPopupMenu;
      pnlButtons: TPanel;
      pnlData: TPanel;
      pnlInfo: TPanel;
      pnlSearch: TPanel;
      pnlSettings: TPanel;
      qrySettings: TUMZQuery;
      qrySettingsCD_SQL: TLargeintField;
      qrySettingsDT_ALTERACAO: TDateTimeField;
      qrySettingsDT_INCLUSAO: TDateTimeField;
      qrySettingsME_CONFIG: TMemoField;
      qrySettingsNM_AUTOR: TStringField;
      qrySettingsNM_SQL: TStringField;
      qrySQL: TUMZReadOnlyQuery;
      sedtSQL: TSynEdit;
      shltMySQL: TSynSQLSyn;
      tbsSettings: TTabSheet;
      tbsSQL: TTabSheet;
      tsEtapas: TTabSet;
      procedure edtAuthorChange(Sender: TObject);
      procedure edtNameChange(Sender: TObject);
      procedure edtSearchChange(Sender: TObject);
      procedure edtWindowTitleChange(Sender: TObject);
      procedure FormClose(Sender: TObject; var Action: TCloseAction);
      procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
      procedure FormCreate(Sender: TObject);
      procedure miColulmnFilterEqualClick(Sender: TObject);
      procedure miColumnFilterLikeClick(Sender: TObject);
      procedure miColumnFilterNoneClick(Sender: TObject);
      procedure miColumnTitleClick(Sender: TObject);
      procedure pmColumnOptionsPopup(Sender: TObject);
      procedure sedtSQLChange(Sender: TObject);
      procedure tbsSettingsEnter(Sender: TObject);
      procedure tsEtapasChange(Sender: TObject; NewTab: Integer;
         var AllowChange: Boolean);
   private
      FId: Cardinal;
      FSelectedColumn: TColumn;
      FFilterSettings: TStrings;
      function BuildFilter: AnsiString;
      function GetFilterType: AnsiString;
      function GetSettings: AnsiString;
      procedure ApplyFilter;
      procedure ForEachColumn(ElName: string; Elem: TlkJSONbase; data: pointer;
         var Continue: Boolean);
      procedure ForEachSearchField(ElName: string; Elem: TlkJSONbase;
         data: pointer; var Continue: Boolean);
      procedure ForEachSortedField(ElName: string; Elem: TlkJSONbase;
         data: pointer; var Continue: Boolean);
      procedure Load;
      procedure RebuildFields;
      procedure Save;
      procedure SetFilterType(const Value: AnsiString);
      procedure UpdateButtonStatus;
   public
      class function Edit(const Id: Cardinal): Boolean;
      class function New: Cardinal;
   end;

implementation

{$R *.dfm}

procedure TfrmReportQueryBuilder.ApplyFilter;
var
   S, Term: AnsiString;
begin
   Term := edtSearch.Text;
   Term := Trim(Term);

   if Term <> '' then
   begin
      S := BuildFilter;
      S := AnsiReplaceStr(S, '%s', Term);
      qrySQL.Filter := S;
      qrySQL.Filtered := True;
   end;

   if Term = '' then
      qrySQL.Filtered := False;
end;

function TfrmReportQueryBuilder.BuildFilter: AnsiString;
const
   SFilterEqualsFmt = '(%s = ''%%s'')';
   SFilterLikeFmt = '(%s like ''*%%s*'')';
   SFilterConcatOrFmt = '%s or ';
   SFilterConcatFmt = '%s%s';
var
   I: Integer;
   S: AnsiString;
begin
   Result := '';

   for I := 0 to FFilterSettings.Count - 1 do
   begin
      if FFilterSettings.ValueFromIndex[I] = '' then
         Continue;
   
      if FFilterSettings.ValueFromIndex[I] = '=' then
         S := Format(SFilterEqualsFmt, [FFilterSettings.Names[I]]);

      if FFilterSettings.ValueFromIndex[I] = 'like' then
         S := Format(SFilterLikeFmt, [FFilterSettings.Names[I]]);

      if Result <> '' then
         Result := Format(SFilterConcatOrFmt, [Result]);

      Result := Format(SFilterConcatFmt, [Result, S]);
   end;
end;

class function TfrmReportQueryBuilder.Edit(const Id: Cardinal): Boolean;
var
   Form: TfrmReportQueryBuilder;
begin
   Application.CreateForm(TfrmReportQueryBuilder, Form);
   Form.FId := Id;
   Form.Load;
   Form.qrySQL.Open;
   Result := Form.ShowModal = mrOk;
end;

procedure TfrmReportQueryBuilder.edtAuthorChange(Sender: TObject);
begin
   UpdateButtonStatus;
end;

procedure TfrmReportQueryBuilder.edtNameChange(Sender: TObject);
begin
   UpdateButtonStatus;
end;

procedure TfrmReportQueryBuilder.edtSearchChange(Sender: TObject);
begin
   ApplyFilter;
end;

procedure TfrmReportQueryBuilder.edtWindowTitleChange(Sender: TObject);
begin
   UpdateButtonStatus;
end;

procedure TfrmReportQueryBuilder.ForEachColumn(ElName: string;
  Elem: TlkJSONbase; data: pointer; var Continue: Boolean);
var
   ColSettings: TlkJSONobject;
   Column: TColumn;
begin
   ColSettings := Elem as TlkJSONobject;
   Column := dbgSQL.Columns.Add;
   Column.FieldName := ColSettings.getString('field');
   Column.Title.Caption := ColSettings.getString('title');
   Column.Width := ColSettings.getInt('width');
   Column.PopupMenu := pmColumnOptions;
end;

procedure TfrmReportQueryBuilder.ForEachSearchField(ElName: string;
  Elem: TlkJSONbase; data: pointer; var Continue: Boolean);
var
   FieldSettings: TlkJSONobject;
   FieldName, FilterMode: AnsiString;
begin
   FieldSettings := Elem as TlkJSONobject;
   FieldName := FieldSettings.getString('field');
   FilterMode := FieldSettings.getString('mode');
   FFilterSettings.Values[FieldName] := FilterMode;
end;

procedure TfrmReportQueryBuilder.ForEachSortedField(ElName: string;
  Elem: TlkJSONbase; data: pointer; var Continue: Boolean);
const
   SSortExprFmt = '%s %s';
   SSortExprConcatFmt = '%s;%s';
var
   SortSettings: TlkJSONobject;
   FieldName, SortKind, SortExpr, S: AnsiString;
begin
   SortSettings := Elem as TlkJSONobject;
   FieldName := SortSettings.getString('field');
   SortKind := SortSettings.getString('kind');
   S := Format(SSortExprFmt, [FieldName, SortKind]);
   SortExpr := qrySQL.IndexFieldNames;

   if SortExpr <> '' then
      S := Format(SSortExprConcatFmt, [SortExpr, S]);

   qrySQL.IndexFieldNames := S;
end;

procedure TfrmReportQueryBuilder.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
   FFilterSettings.Free;
   Action := caFree;
end;

procedure TfrmReportQueryBuilder.FormCloseQuery(Sender: TObject;
  var CanClose: Boolean);
const
   SCaption = 'Confirmação';
   SMessageCancel = 'Deseja realmente cancelar a contrução da consulta SQL?';
   SMessageConfirm = 'Deseja realmente salvar as alterações da consulta SQL?';
var
   UserChoice: Integer;
   S: AnsiString;
begin
   S := SMessageCancel;

   if ModalResult = mrOk then
      S := SMessageConfirm;
   
   UserChoice := MessageBox(Handle, PChar(S), SCaption, MB_ICONQUESTION or
      MB_YESNO);

   CanClose := UserChoice = ID_YES;

   if CanClose and (ModalResult = mrOk) then
      Save;
end;

procedure TfrmReportQueryBuilder.FormCreate(Sender: TObject);
begin
   FFilterSettings := TStringList.Create;
end;

function TfrmReportQueryBuilder.GetFilterType: AnsiString;
begin
   Result := FFilterSettings.Values[FSelectedColumn.FieldName];
end;

function TfrmReportQueryBuilder.GetSettings: AnsiString;
var
   Settings, Item: TlkJSONobject;
   Items: TlkJSONlist;
   I: Integer;
   SortedFields: TStrings;
begin
   Settings := TlkJSONobject.Create(True);
   try
      Settings.Add('title', edtWindowTitle.Text);
      Settings.Add('sql', sedtSQL.Text);

      Items := TlkJSONlist.Create;

      for I := 0 to dbgSQL.Columns.Count - 1 do
      begin
         Item := TlkJSONobject.Create(True);
         Item.Add('field', dbgSQL.Columns[I].FieldName);
         Item.Add('title', dbgSQL.Columns[I].Title.Caption);
         Item.Add('width', dbgSQL.Columns[I].Width);
         Items.Add(Item);
      end;

      Settings.Add('columns', Items);

      Items := TlkJSONlist.Create;

      SortedFields := TStringList.Create;
      try
         SortedFields.Delimiter := ';';
         SortedFields.NameValueSeparator := ' ';
         SortedFields.StrictDelimiter := True;
         SortedFields.DelimitedText := qrySQL.IndexFieldNames;

         for I := 0 to SortedFields.Count - 1 do
         begin
            Item := TlkJSONobject.Create(True);
            Item.Add('field', SortedFields.Names[I]);
            Item.Add('kind', SortedFields.ValueFromIndex[I]);
            Items.Add(Item);
         end;
      finally
         SortedFields.Free;
      end;

      Settings.Add('sort', Items);

      Items := TlkJSONlist.Create;

      for I := 0 to FFilterSettings.Count - 1 do
      begin
         Item := TlkJSONobject.Create(True);
         Item.Add('field', FFilterSettings.Names[I]);
         Item.Add('mode', FFilterSettings.ValueFromIndex[I]);
         Items.Add(Item);
      end;

      Settings.Add('search', Items);

      Result := UTF8Decode(TlkJSON.GenerateText(Settings));

   finally
      Settings.Free;
   end;
end;

procedure TfrmReportQueryBuilder.Load;
var
   Settings: TlkJSONobject;
   Columns, SearchFields, SortedFields: TlkJSONlist;
   JSON: AnsiString;
   UserData: Pointer;
begin
   qrySettings.ParamByName('CD_SQL').AsInteger := FId;
   qrySettings.Open;

   if not qrySettings.IsEmpty then
   begin
      edtName.Text := qrySettingsNM_SQL.AsString;
      edtAuthor.Text := qrySettingsNM_AUTOR.AsString;

      JSON := qrySettingsME_CONFIG.AsString;
      JSON := UTF8Encode(JSON);

      Settings := TlkJSON.ParseText(JSON) as TlkJSONobject;
      try
         qrySQL.SQL.Text := Settings.getString('sql');
         sedtSQL.Text := Settings.getString('sql');
         edtWindowTitle.Text := Settings.getString('title');
      
         Columns := Settings.Field['columns'] as TlkJSONlist;
         SearchFields := Settings.Field['search'] as TlkJSONlist;
         SortedFields := Settings.Field['sort'] as TlkJSONlist;

         Columns.ForEach(ForEachColumn, UserData);
         SearchFields.ForEach(ForEachSearchField, UserData);
         SortedFields.ForEach(ForEachSortedField, UserData);
      finally
         Settings.Free;
      end;

   end;
end;

procedure TfrmReportQueryBuilder.miColulmnFilterEqualClick(Sender: TObject);
begin
   SetFilterType('=');
end;

procedure TfrmReportQueryBuilder.miColumnFilterLikeClick(Sender: TObject);
begin
   SetFilterType('like');
end;

procedure TfrmReportQueryBuilder.miColumnFilterNoneClick(Sender: TObject);
begin
   SetFilterType('');
end;

procedure TfrmReportQueryBuilder.miColumnTitleClick(Sender: TObject);
const
   SCaption = 'Título';
   SPrompt = 'Informe o título da coluna';
var
   Value: AnsiString;
begin
   Value := FSelectedColumn.Title.Caption;

   if InputQuery(SCaption, SPrompt, Value) then
   begin
      FSelectedColumn.Title.Caption := Value;
   end;
end;

class function TfrmReportQueryBuilder.New: Cardinal;
var
   Form: TfrmReportQueryBuilder;
begin
   Application.CreateForm(TfrmReportQueryBuilder, Form);
   Form.FId := 0;
   Form.ShowModal;
   Result := Form.FId;
   Form.Free;   
end;

procedure TfrmReportQueryBuilder.pmColumnOptionsPopup(Sender: TObject);
var
   Popup: TPopupMenu;
   Grid: TZSortedGrid;
   GridCoord: TGridCoord;
   P: TPoint;
   S: AnsiString;
begin
   Popup := TPopupMenu(Sender);
   Grid := TZSortedGrid(Popup.PopupComponent);
   P := Grid.ScreenToClient(Point(Popup.PopupPoint.X, Popup.PopupPoint.Y));
   GridCoord := Grid.MouseCoord(P.X, P.Y);
   FSelectedColumn := Grid.Columns[GridCoord.X - 1];
   S := GetFilterType;

   if S = '' then
      miColumnFilterNone.Checked := True;

   if S = '=' then
      miColulmnFilterEqual.Checked := True;

   if S = 'like' then
      miColumnFilterLike.Checked := True;
end;

procedure TfrmReportQueryBuilder.RebuildFields;
var
   I: Integer;
begin
   qrySQL.SQL.Text := sedtSQL.Text;
   qrySQL.FieldDefs.Update;

   for I := 0 to qrySQL.FieldDefs.Count - 1 do
   begin
      qrySQL.FieldDefs[I].CreateField(qrySQL);
   end;

   dbgSQL.Columns.RebuildColumns;

   for I := 0 to dbgSQL.Columns.Count - 1 do
      dbgSQL.Columns[I].PopupMenu := pmColumnOptions;
end;

procedure TfrmReportQueryBuilder.Save;
begin
   if FId = 0 then
   begin
      qrySettings.ParamByName('CD_SQL').AsInteger := 0;
      qrySettings.Open;
      qrySettings.Insert;
   end;

   if FId <> 0 then
      qrySettings.Edit;

   qrySettingsME_CONFIG.AsString := GetSettings;
   qrySettingsNM_AUTOR.AsString := edtAuthor.Text;
   qrySettingsNM_SQL.AsString := edtName.Text;
   qrySettings.Post;

   if FId = 0 then
      FId := qrySettingsCD_SQL.AsLargeInt;
end;

procedure TfrmReportQueryBuilder.sedtSQLChange(Sender: TObject);
begin
   qrySQL.Close;
   UpdateButtonStatus;
end;

procedure TfrmReportQueryBuilder.SetFilterType(const Value: AnsiString);
begin
   FFilterSettings.Values[FSelectedColumn.FieldName] := Value;
end;

procedure TfrmReportQueryBuilder.tbsSettingsEnter(Sender: TObject);
begin
   if not qrySQL.Active then
   begin
      RebuildFields;
      qrySQL.Open;
   end;
end;

procedure TfrmReportQueryBuilder.tsEtapasChange(Sender: TObject;
  NewTab: Integer; var AllowChange: Boolean);
begin
   pgcSteps.ActivePageIndex := NewTab;
   if pgcSteps.ActivePageIndex = 1 then
      edtName.SetFocus;
end;

procedure TfrmReportQueryBuilder.UpdateButtonStatus;
begin
   bbtnSalvar.Enabled :=
      (Trim(sedtSQL.Text) <> '') and
      (Trim(edtName.Text) <> '') and
      (Trim(edtAuthor.Text) <> '') and
      (Trim(edtWindowTitle.Text) <> '');
end;

end.
