unit UFReportSearchWindow;

interface

uses
   Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
   Dialogs, ExtCtrls, ComCtrls, StdCtrls, Grids, DBGrids, UDBGrids, ToolWin,
   ImgList, DB, ZAbstractRODataset, UZDataset, DBClient, Provider, uLkJSON,
   Contnrs, StrUtils;

type
   TfrmReportSearchWindow = class(TForm)
      btnCancelar: TToolButton;
      btnConfirmar: TToolButton;
      btnDesmarcarTodos: TToolButton;
      btnMarcarTodos: TToolButton;
      btnSep1: TToolButton;
      bvlSep1: TBevel;
      bvlSep2: TBevel;
      bvlSep3: TBevel;
      bvlSep4: TBevel;
      cdsSearch: TClientDataSet;
      dbgDataSet: TSortedDBGrid;
      dspSearch: TDataSetProvider;
      dsSearch: TDataSource;
      edtPesquisar: TEdit;
      ilOpcoes: TImageList;
      lblPesquisar: TLabel;
      pnlFiltro: TPanel;
      pnlTitulo: TPanel;
      qrySearch: TUMZReadOnlyQuery;
      stbStatus: TStatusBar;
      tlbOpcoes: TToolBar;
      procedure btnCancelarClick(Sender: TObject);
      procedure btnConfirmarClick(Sender: TObject);
      procedure btnDesmarcarTodosClick(Sender: TObject);
      procedure btnMarcarTodosClick(Sender: TObject);
      procedure cdsSearchAfterOpen(DataSet: TDataSet);
      procedure cdsSearchCalcFields(DataSet: TDataSet);
      procedure dbgDataSetCellClick(Column: TColumn);
      procedure dbgDataSetDrawColumnCell(Sender: TObject; const Rect: TRect;
         DataCol: Integer; Column: TColumn; State: TGridDrawState);
      procedure edtPesquisarChange(Sender: TObject);
      procedure FormDblClick(Sender: TObject);
   private
      FMultiple: Boolean;
      FSettings: TlkJSONobject;
      function GetFieldType(const FieldName: AnsiString): TFieldType;
      procedure ApplySearch;
      procedure CreateSelectField;
      procedure Setup;
      procedure UpdateStatusBar;
      procedure ForEachColumn(ElName: string; Elem: TlkJSONbase; data: pointer;
         var Continue: Boolean);
      procedure ForEachSort(ElName: string; Elem: TlkJSONbase; data: pointer;
         var Continue: Boolean);
   public
      destructor Destroy; override;
      constructor Create(const AOwner: TComponent;
         const ASettings: TlkJSONobject; const Multiple: Boolean);
      function Search(const KeyField, ValueField: AnsiString): TObjectList;
      property FieldType[const FieldName: AnsiString]: TFieldType read GetFieldType;
   end;

implementation

uses
   UReportClasses;

{$R *.dfm}

procedure TfrmReportSearchWindow.ApplySearch;
const
   IntegerTypes = [ftSmallint, ftInteger, ftWord, ftLargeint];
   StringTypes = [ftString, ftMemo, ftFixedChar, ftWideString, ftFixedWideChar, ftWideMemo];
   SEqualExprFmt = '%s = %s';
   SLikeExprFmt = '%s LIKE %s';
   SLikeTermFmt = '%%%s%%';
   SConcatORFmt = '%s OR';
   SConcatExprFmt = '%s %s';
var
   Term, Expression, S: AnsiString;
   Grid: TSortedDBGrid;
   Expressions: TStrings;
   I, V: Integer;
begin
   Term := edtPesquisar.Text;
   Term := Trim(Term);

   if Term = '' then
   begin
      cdsSearch.Filtered := False;
   end;

   if Term <> '' then
   begin
      Expressions := TStringList.Create;
      try
         btnConfirmar.Enabled := False;
         Grid := dbgDataSet;

         for I := 0 to Grid.Columns.Count - 1 do
         begin
            if Grid.Columns[I].Field <> nil then
            begin
               if Grid.Columns[I].Field.DataType in IntegerTypes then
               begin
                  if TryStrToInt(Term, V) then
                  begin
                     S := Format(SEqualExprFmt, [Grid.Columns[I].FieldName, Term]);
                     Expressions.Add(S);
                  end;
               end;
               if Grid.Columns[I].Field.DataType in StringTypes then
               begin
                  S := Format(SLikeTermFmt, [Term]);
                  S := QuotedStr(S);
                  S := Format(SLikeExprFmt, [Grid.Columns[I].FieldName, S]);
                  Expressions.Add(S);
               end;
            end;
         end;

         Expression := '';

         for I := 0 to Expressions.Count - 1 do
         begin
            if Expression <> '' then
            begin
               Expression := Format(SConcatORFmt, [Expression]);
            end;

            Expression := Format(SConcatExprFmt, [Expression, Expressions[I]]);
         end;

         if Expression <> '' then
         begin
            cdsSearch.Filter := Expression;
            cdsSearch.Filtered := True;
         end;
         
      finally
         Expressions.Free;
      end;
   end;
end;

procedure TfrmReportSearchWindow.btnCancelarClick(Sender: TObject);
begin
   ModalResult := mrCancel;
   CloseModal;
end;

procedure TfrmReportSearchWindow.btnConfirmarClick(Sender: TObject);
begin
   ModalResult := mrOk;
   CloseModal;
end;

procedure TfrmReportSearchWindow.btnDesmarcarTodosClick(Sender: TObject);
var
   Bookmark: TBookmark;
begin
   Bookmark := cdsSearch.GetBookmark;
   cdsSearch.DisableControls;
   cdsSearch.First;
   while not cdsSearch.Eof do
   begin
      cdsSearch.Edit;
      cdsSearch.FieldByName('SN_SELECTED').AsBoolean := False;
      cdsSearch.Next;
   end;
   cdsSearch.GotoBookmark(Bookmark);
   cdsSearch.EnableControls;
   btnConfirmar.Enabled := False;
   UpdateStatusBar;
end;

procedure TfrmReportSearchWindow.btnMarcarTodosClick(Sender: TObject);
var
   Bookmark: TBookmark;
begin
   Bookmark := cdsSearch.GetBookmark;
   cdsSearch.DisableControls;
   cdsSearch.First;
   while not cdsSearch.Eof do
   begin
      cdsSearch.Edit;
      cdsSearch.FieldByName('SN_SELECTED').AsBoolean := True;
      cdsSearch.Next;
   end;
   cdsSearch.GotoBookmark(Bookmark);
   cdsSearch.EnableControls;
   btnConfirmar.Enabled := not cdsSearch.IsEmpty;
   UpdateStatusBar;
end;

procedure TfrmReportSearchWindow.cdsSearchAfterOpen(DataSet: TDataSet);
begin
   UpdateStatusBar;
end;

procedure TfrmReportSearchWindow.cdsSearchCalcFields(DataSet: TDataSet);
begin
   cdsSearch.FieldByName('NR_SELECTED').AsInteger := 0;

   if cdsSearch.FieldByName('SN_SELECTED').AsBoolean then
   begin
      cdsSearch.FieldByName('NR_SELECTED').AsInteger := 1;
   end;
end;

constructor TfrmReportSearchWindow.Create(const AOwner: TComponent;
  const ASettings: TlkJSONobject; const Multiple: Boolean);
begin
   inherited Create(AOwner);
   FSettings := ASettings;
   FMultiple := Multiple;
   Setup;
end;

procedure TfrmReportSearchWindow.CreateSelectField;
var
   Field: TField;
   Column: TColumn;
begin
   if FMultiple then
   begin
      Field := TBooleanField.Create(cdsSearch);
      Field.FieldKind := fkInternalCalc;
      Field.FieldName := 'SN_SELECTED';
      Field.DataSet := cdsSearch;
      cdsSearch.FieldDefs.Add('SN_SELECTED', ftBoolean);

      Column := dbgDataSet.Columns.Add;
      Column.Field := Field;
      Column.FieldName := 'SN_SELECTED';
      Column.Title.Caption := 'S';
      Column.Title.Alignment := taCenter;
      Column.Width := 24;

      Field := TIntegerField.Create(cdsSearch);
      Field.FieldKind := fkInternalCalc;
      Field.FieldName := 'NR_SELECTED';
      Field.DataSet := cdsSearch;
      cdsSearch.FieldDefs.Add('NR_SELECTED', ftInteger);

      Field := TAggregateField.Create(cdsSearch);
      (Field as TAggregateField).Expression := 'SUM(NR_SELECTED)';
      (Field as TAggregateField).Active := True;
      Field.FieldName := 'SUM_COUNT_SELECTED';
      Field.DataSet := cdsSearch;
      cdsSearch.FieldDefs.Add('SUM_COUNT_SELECTED', ftInteger);
   end;
end;

procedure TfrmReportSearchWindow.dbgDataSetCellClick(Column: TColumn);
begin
   if Column.Field.DataType = ftBoolean then
   begin
      Column.Field.DataSet.Edit;
      Column.Field.AsBoolean := not Column.Field.AsBoolean;
      Column.Field.DataSet.Post;
   end;

   if FMultiple then
   begin
      btnConfirmar.Enabled := cdsSearch.FieldByName('SUM_COUNT_SELECTED').Value > 0;
   end;

   if not FMultiple then
   begin
      btnConfirmar.Enabled := not cdsSearch.IsEmpty;
   end;

   UpdateStatusBar;
end;

procedure TfrmReportSearchWindow.dbgDataSetDrawColumnCell(Sender: TObject;
  const Rect: TRect; DataCol: Integer; Column: TColumn; State: TGridDrawState);
const
   IsChecked: array[Boolean] of Integer = (DFCS_BUTTONCHECK, DFCS_BUTTONCHECK or DFCS_CHECKED);
var
   DrawRect: TRect;
begin
   if Column.Field.DataType = ftBoolean then
   begin
      DrawRect := Rect;
      InflateRect(DrawRect, -2, -2);
      TDBGrid(Sender).Canvas.FillRect(Rect);
      DrawFrameControl(TDBGrid(Sender).Canvas.Handle, DrawRect, DFC_BUTTON,
         IsChecked[Column.Field.AsBoolean]);
   end;
end;

destructor TfrmReportSearchWindow.Destroy;
begin
   inherited;
end;

procedure TfrmReportSearchWindow.edtPesquisarChange(Sender: TObject);
begin
   ApplySearch;
   UpdateStatusBar;
end;

procedure TfrmReportSearchWindow.ForEachColumn(ElName: string; Elem: TlkJSONbase;
  data: pointer; var Continue: Boolean);
var
   ColSettings: TlkJSONobject;
   Column: TColumn;
begin
   ColSettings := Elem as TlkJSONobject;
   Column := dbgDataSet.Columns.Add;
   Column.FieldName := ColSettings.getString('field');
   Column.Title.Caption := ColSettings.getString('title');
   Column.Width := ColSettings.getInt('width');
end;

procedure TfrmReportSearchWindow.ForEachSort(ElName: string; Elem: TlkJSONbase;
  data: pointer; var Continue: Boolean);
var
   SortField: TlkJSONobject;
   FieldName, Kind: AnsiString;
begin
   SortField := Elem as TlkJSONobject;
   FieldName := SortField.getString('field');
   Kind := SortField.getString('kind');

   if Kind = 'asc' then
   begin
      dbgDataSet.SortedFields.Add(FieldName);
   end;

   if Kind = 'desc' then
   begin
      dbgDataSet.DescFields.Add(FieldName);
   end;

end;

procedure TfrmReportSearchWindow.FormDblClick(Sender: TObject);
begin
   if not cdsSearch.IsEmpty then
   begin
      if FMultiple then
      begin
         cdsSearch.Edit;
         cdsSearch.FieldByName('SN_SELECTED').AsBoolean := True;
         cdsSearch.Post;
      end;

      ModalResult := mrOk;
      CloseModal;
   end;
end;

function TfrmReportSearchWindow.GetFieldType(
  const FieldName: AnsiString): TFieldType;
var
   Field: TField;
begin
   Result := ftUnknown;

   Field := qrySearch.FindField(FieldName);

   if Field <> nil then
   begin
      Result := Field.DataType;
   end;
end;

function TfrmReportSearchWindow.Search(const KeyField,
  ValueField: AnsiString): TObjectList;
const
   SSelectedFilter = '(%s) AND SN_SELECTED';
var
   SavedFilter, TempFilter, Key, Value: AnsiString;
   SavedFiltered: Boolean;
   Item: TItem;
begin
   Result := TObjectList.Create;

   if ShowModal = mrOk then
   begin
   
      if not FMultiple then
      begin
         Key := cdsSearch.FieldByName(KeyField).AsString;
         Value := cdsSearch.FieldByName(ValueField).AsString;
         Item := TItem.Create(Key, Value);
         Result.Add(Item);
      end;

      if FMultiple then
      begin
         cdsSearch.DisableControls;
         SavedFilter := cdsSearch.Filter;
         SavedFiltered := cdsSearch.Filtered;

         if SavedFiltered then
         begin
            TempFilter := Format(SSelectedFilter, [SavedFilter]);
            cdsSearch.Filter := TempFilter;
         end;

         if not SavedFiltered then
         begin
            cdsSearch.Filter := 'SN_SELECTED';
            cdsSearch.Filtered := True;
         end;

         if not cdsSearch.IsEmpty then
         begin
            cdsSearch.First;
            while not cdsSearch.Eof do
            begin
               Key := cdsSearch.FieldByName(KeyField).AsString;
               Value := cdsSearch.FieldByName(ValueField).AsString;
               Item := TItem.Create(Key, Value);
               Result.Add(Item);
               cdsSearch.Next;
            end;
         end;

         cdsSearch.Filtered := SavedFiltered;
         cdsSearch.Filter := SavedFilter;
         cdsSearch.EnableControls;
      end;
   end;
end;

procedure TfrmReportSearchWindow.Setup;
var
   SortFields, Columns: TlkJSONlist;
   Title: AnsiString;
   UserData: Pointer;
   I: Integer;
begin
   Title := FSettings.getString('title');
   Caption := Title;
   pnlTitulo.Caption := Title;

   btnMarcarTodos.Visible := FMultiple;
   btnDesmarcarTodos.Visible := FMultiple;
   btnSep1.Visible := FMultiple;

   qrySearch.SQL.Text := FSettings.getString('sql');
   qrySearch.FieldDefs.Update;

   for I := 0 to qrySearch.FieldDefs.Count - 1 do
   begin
      qrySearch.FieldDefs[I].CreateField(qrySearch);
   end;

   cdsSearch.FieldDefs.Update;
   cdsSearch.FetchParams;

   for I := 0 to cdsSearch.FieldDefs.Count - 1 do
   begin
      cdsSearch.FieldDefs[I].CreateField(cdsSearch);
   end;

   CreateSelectField;

   cdsSearch.Open;

   if FSettings.Field['sort'] is TlkJSONlist then
   begin
      SortFields := FSettings.Field['sort'] as TlkJSONlist;
      SortFields.ForEach(ForEachSort, UserData);
   end;

   if FSettings.Field['columns'] is TlkJSONlist then
   begin
      Columns := FSettings.Field['columns'] as TlkJSONlist;
      Columns.ForEach(ForEachColumn, UserData);
   end;

end;

procedure TfrmReportSearchWindow.UpdateStatusBar;
const
   SFoundRecordsFmt = '%d registro(s) encontrado(s)';
   SSelectedRecordsFmt = '%d registro(s) selecionado(s)';
var
   Count: Integer;
   Value: Variant;
begin
   stbStatus.Panels[0].Text := Format(SFoundRecordsFmt, [cdsSearch.RecordCount]);
   
   if FMultiple then
   begin
      Value := cdsSearch.FieldByName('SUM_COUNT_SELECTED').Value;

      if Value = Null then
         Count := 0;

      if Value <> Null then
         Count := cdsSearch.FieldByName('SUM_COUNT_SELECTED').Value;
         
      stbStatus.Panels[1].Text := Format(SSelectedRecordsFmt, [Count]);
   end;

   if not FMultiple then
   begin
      stbStatus.Panels[1].Text := '';
   end;
end;

end.
