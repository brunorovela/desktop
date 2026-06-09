unit UReportClasses;

interface

uses
   Classes, SysUtils, Variants, Forms, Windows, UCrpe32, uLkJSON, UZDbcFuncs,
   StrUtils;

type
   TFilterKind = (fkCommon, fkSearch, fkMultiSearch, fkSelect, fkMultiSelect);

   TItem = class
   private
      FVarType: TVarType;
      FID: AnsiString;
      FName: AnsiString;
      function GetFormattedId: AnsiString;
   public
      constructor Create(const AID, AName: AnsiString); overload;
      constructor Create(const AID: Integer; AName: AnsiString); overload;
      function Empty: Boolean;
      function Equal(const AID: AnsiString): Boolean; overload;
      function Equal(const AID: Integer): Boolean; overload;
      function Equal(const Item: TItem): Boolean; overload;
      property FormattedId: AnsiString read GetFormattedId;
      property ID: AnsiString read FID;
      property Name: AnsiString read FName;
   end;

   TReport = class
   strict private
      FCrpe: TCrpe;
      FName: AnsiString;
      FDescFilters: TStrings;
      FFilePath: AnsiString;
      FSelection: AnsiString;
      FSettings: TlkJSONobject;
      FSQLParams: array of TVarRec;
  private
      function GetName: AnsiString;
      procedure Connect;
      procedure ForEachDescFilter(ElName: string; Elem: TlkJSONbase;
         data: pointer; var Continue: Boolean);
      procedure ForEachFormula(ElName: string; Elem: TlkJSONbase; data: pointer;
         var Continue: Boolean);
      procedure ForEachParams(ElName: string; Elem: TlkJSONbase; data: pointer;
         var Continue: Boolean);
      procedure ForEachSortField(ElName: string; Elem: TlkJSONbase;
         data: pointer; var Continue: Boolean);
      procedure ForEachSQLAfter(ElName: string; Elem: TlkJSONbase;
         data: pointer; var Continue: Boolean);
      procedure ForEachSQLBefore(ElName: string; Elem: TlkJSONbase;
         data: pointer; var Continue: Boolean);
      procedure ForEachSQLExpression(ElName: string; Elem: TlkJSONbase;
         data: pointer; var Continue: Boolean);
      procedure ForEachSQLParam(ElName: string; Elem: TlkJSONbase;
         data: pointer; var Continue: Boolean);
      procedure OnWindowPrintClose(WindowHandle: HWND; var Cancel: Boolean);
      procedure SetName(const Value: AnsiString);
      procedure SetupDescFilters;
      procedure SetupFormulas;
      procedure SetupGroupSelection;
      procedure SetupParamFields;
      procedure SetupReport;
      procedure SetupSelection;
      procedure SetupSortFields;
      procedure SetupSQLAfter;
      procedure SetupSQLBefore;
      procedure SetupSQLExpressions;
   public
      constructor Create;
      destructor Destroy; override;
      function Execute: Boolean;
      procedure Setup(const FilePath, Settings, Selection: AnsiString);
      property Crpe: TCrpe read FCrpe;
      property Name: AnsiString read GetName write SetName;
   end;

implementation

uses
   uDM, UFReportFilterComponent;

const
   SIntToStrFmt = '%d';

{ TReport }

procedure TReport.Connect;
begin
   FCrpe.Connect.Clear;
   FCrpe.Connect.ServerName := DM.db.Database;
   FCrpe.Connect.UserID := DM.db.User;
   FCrpe.Connect.Password := DM.db.Password;
   FCrpe.Connect.DatabaseName := DM.db.Database;
end;

constructor TReport.Create;
begin
   FCrpe := TCrpe.Create(Application);
   FCrpe.WindowEvents := True;
   FCrpe.wOnCloseWindow := OnWindowPrintClose;
   FDescFilters := TStringList.Create;
end;

destructor TReport.Destroy;
begin
   FCrpe.Free;
   FSettings.Free;
   FDescFilters.Free;
   inherited;
end;

function TReport.Execute: Boolean;
const
   SMsgQuestion = 'Deseja visualizar o relatório antes de imprimir?';
   SCaption = 'Confirmação';
var
   UserChoice: Integer;
begin
   Result := False;

   SetupReport;

   UserChoice := MessageBox(0, SMsgQuestion, SCaption,
      MB_ICONQUESTION or MB_YESNOCANCEL);

   if UserChoice = ID_YES then
   begin
      FCrpe.Output := toWindow;
   end;

   if UserChoice = ID_NO then
   begin
      FCrpe.Output := toPrinter;
   end;

   if UserChoice <> ID_CANCEL then
   begin
      SetupFormulas;
      SetupDescFilters;
      SetupGroupSelection;
      SetupParamFields;
      SetupSelection;
      SetupSortFields;
      SetupSQLExpressions;
      SetupSQLBefore;
      Result := FCrpe.Execute;
   end;
end;

procedure TReport.ForEachDescFilter(ElName: string; Elem: TlkJSONbase;
  data: pointer; var Continue: Boolean);
const
   SDescFmt = '"%s = " + %s';
var
   DescFilter: TlkJSONobject;
   Title, PropName, Value, S: AnsiString;
begin
   DescFilter := Elem as TlkJSONobject;
   Title := DescFilter.getString('title');
   PropName := DescFilter.getString('property');
   Value := TReportFilterFactory.Instance.HumanExprByName[PropName];

   if Value <> '' then
   begin
      S := Format(SDescFmt, [Title, Value]);
      FDescFilters.Add(S);
   end;
end;

procedure TReport.ForEachFormula(ElName: string; Elem: TlkJSONbase;
  data: pointer; var Continue: Boolean);
var
   Index, Default: TlkJSONbase;
   Formula: TlkJSONobject;
   Name, PropName, Value: AnsiString;
   I: Integer;
begin
   Formula := Elem as TlkJSONobject;
   Name := Formula.getString('name');
   Default := Formula.Field['value'];

   if Default is TlkJSONstring then
   begin
      Value := Formula.getString('value');
   end;

   if (Default = nil) or (Default is TlkJSONnull) then
   begin

      if Formula.Field['property'] is TlkJSONstring then
      begin
         Index := Formula.Field['index'];
         PropName := Formula.getString('property');

         Value := TReportFilterFactory.Instance.FirstCrExprByName[PropName];

         if Index is TlkJSONnumber then
         begin
            Value := TReportFilterFactory.Instance.CrExprByIndex[PropName, Index.Value];
         end;
      end;

      if Formula.getBoolean('visible') then
      begin
         Value := TReportFormulaFactory.Instance.ValueByName[Name];
      end;
      
   end;

   I := FCrpe.Formulas.IndexOf(Name);
   
   if I <> -1 then
   begin
      FCrpe.Formulas[I].Formula.Text := Value;
   end;
end;

procedure TReport.ForEachParams(ElName: string; Elem: TlkJSONbase;
  data: pointer; var Continue: Boolean);
var
   Param: TlkJSONobject;
   Index: TlkJSONbase;
   Name, PropName, Value, S: AnsiString;
   I: Integer;
begin
   Param := Elem as TlkJSONobject;
   Name := Param.getString('name');
   PropName := Param.getString('property');
   Index := Param.Field['index'];
   
   Value := TReportFilterFactory.Instance.FirstCrExprByName[PropName];

   if Index is TlkJSONnumber then
   begin
      Value := TReportFilterFactory.Instance.CrExprByIndex[PropName, Index.Value];
   end;

   for I := 0 to FCrpe.ParamFields.Count - 1 do
   begin
      S := FCrpe.ParamFields[I].Name;

      if S = Name then
      begin
         FCrpe.ParamFields[I].CurrentValue := Value;
         FCrpe.ParamFields[I].ShowDialog := False;
         Break;
      end;      
   end;
end;

procedure TReport.ForEachSortField(ElName: string; Elem: TlkJSONbase;
  data: pointer; var Continue: Boolean);
var
   SortField: TlkJSONobject;
   FieldName, Kind: AnsiString;
   Item: TCrpeSortFieldsItem;
   I: Integer;
begin
   SortField := Elem as TlkJSONobject;
   FieldName := SortField.getString('field');
   Kind := AnsiLowerCase(SortField.getString('kind'));

   I := FCrpe.SortFields.Add(FieldName);
   FCrpe.SortFields[I].Direction := sdAscending;
   
   if Kind = 'desc' then
   begin
      FCrpe.SortFields[I].Direction := sdDescending;
   end;
end;

procedure TReport.ForEachSQLAfter(ElName: string; Elem: TlkJSONbase;
  data: pointer; var Continue: Boolean);
var
   Temp: TlkJSONbase;
   SQLExpression: TlkJSONobject;
   SQLParams: TlkJSONlist;
   SQL, Name: AnsiString;
   UserData: Pointer;
   I: Integer;
begin
   SQLExpression := Elem as TlkJSONobject;
   SQL := SQLExpression.getString('sql');
   Temp := SQLExpression.Field['parameters'];

   if Temp is TlkJSONlist then
   begin
      SetLength(FSQLParams, 0);
      SQLParams := Temp as TlkJSONlist;
      SQLParams.ForEach(ForEachSQLParam, UserData);
   end;

   SQL := Format(SQL, FSQLParams);
   UZDbcFuncs.Execute(SQL);
end;

procedure TReport.ForEachSQLBefore(ElName: string; Elem: TlkJSONbase;
  data: pointer; var Continue: Boolean);
var
   Temp: TlkJSONbase;
   SQLExpression: TlkJSONobject;
   SQLParams: TlkJSONlist;
   SQL, Name: AnsiString;
   UserData: Pointer;
   I: Integer;
begin
   SQLExpression := Elem as TlkJSONobject;
   SQL := SQLExpression.getString('sql');
   Temp := SQLExpression.Field['parameters'];

   if Temp is TlkJSONlist then
   begin
      SetLength(FSQLParams, 0);
      SQLParams := Temp as TlkJSONlist;
      SQLParams.ForEach(ForEachSQLParam, UserData);
   end;

   SQL := Format(SQL, FSQLParams);
   UZDbcFuncs.Execute(SQL);
end;

procedure TReport.ForEachSQLExpression(ElName: string; Elem: TlkJSONbase;
  data: pointer; var Continue: Boolean);
var
   Temp: TlkJSONbase;
   SQLExpression: TlkJSONobject;
   SQLParams: TlkJSONlist;
   SQL, Name: AnsiString;
   UserData: Pointer;
   I: Integer;
   Item: TCrpeSQLExpressionsItem;
begin
   SQLExpression := Elem as TlkJSONobject;
   SQL := SQLExpression.getString('sql');
   Name := SQLExpression.getString('name');
   Temp := SQLExpression.Field['parameters'];

   if Temp is TlkJSONlist then
   begin
      SetLength(FSQLParams, 0);
      SQLParams := Temp as TlkJSONlist;
      SQLParams.ForEach(ForEachSQLParam, UserData);
   end;

   Item := FCrpe.SQLExpressions.ByName(Name);

   if Item <> nil then
   begin
      Item.Expression.Text := Format(SQL, [FSQLParams]);
   end;
end;

procedure TReport.ForEachSQLParam(ElName: string; Elem: TlkJSONbase;
  data: pointer; var Continue: Boolean);
var
   SQLParam: TlkJSONobject;
   PropName, Value: AnsiString;
   I: Integer;
begin
   SQLParam := Elem as TlkJSONobject;
   PropName := SQLParam.getString('property');

   if PropName = '@all' then
   begin
      Value := TReportFilterFactory.Instance.SQLExpr;
   end;

   if PropName = '@usuario_id' then
   begin
      Value := Format(SIntToStrFmt, [DM.GetUsuarioLogado.Pessoa.Codigo]);
   end;

   if PropName = '@coligada_nome' then
   begin
      Value := QuotedStr(DM.sColigadaSelecionada);
   end;

   if PropName = '@coligada_razao_social' then
   begin
      Value := QuotedStr(DM.sColigadaSelecionadaRazao);
   end;

   if not AnsiStartsStr('@', PropName) then
   begin
      Value := TReportFilterFactory.Instance.SQLExprByName[PropName];
   end;

   if Value <> '' then
   begin
      I := High(FSQLParams);
      if I = -1 then I := 0;
      SetLength(FSQLParams, I + 1);
      FSQLParams[I].VType := vtAnsiString;
      FSQLParams[I].VAnsiString := Pointer(Value);
   end;
end;

function TReport.GetName: AnsiString;
begin
   Result := FName;
end;

procedure TReport.OnWindowPrintClose(WindowHandle: HWND; var Cancel: Boolean);
begin
   SetupSQLAfter;
end;

procedure TReport.SetName(const Value: AnsiString);
begin
   FName := Value;
end;

procedure TReport.Setup(const FilePath, Settings, Selection: AnsiString);
begin
   FFilePath := FilePath;
   FSettings := TlkJSON.ParseText(UTF8Encode(Settings)) as TlkJSONobject;
   FSelection := Selection;
end;

procedure TReport.SetupDescFilters;
const
   SItemPlusFmt = '%s + chr(13) + ';
   SConcatItemFmt = '%s%s';
var
   Temp: TlkJSONbase;
   DescItems: TlkJSONlist;
   UserData: Pointer;
   Formula: TCrpeFormulasItem;
   S: AnsiString;
   I: Integer; 
begin
   FDescFilters.Clear;
   I := FCrpe.Formulas.IndexOf('ds_filtro');
   if I <> -1 then
   begin
      Formula := FCrpe.Formulas[I];
      Temp := FSettings.Field['desc'];
      if Temp is TlkJSONlist then
      begin
         DescItems := Temp as TlkJSONlist;
         DescItems.ForEach(ForEachDescFilter, UserData);
      end;

      S := '';

      for I := 0 to FDescFilters.Count - 1 do
      begin
         if S <> '' then
            S := Format(SItemPlusFmt, [S]);
         S := Format(SConcatItemFmt, [S, FDescFilters[I]]);
      end;

      Formula.Formula.Text := S;
   end;
end;

procedure TReport.SetupFormulas;
var
   Temp: TlkJSONbase;
   Formulas: TlkJSONlist;
   UserData: Pointer;
   I: Integer;
begin
   Temp := FSettings.Field['formulas'];

   if Temp is TlkJSONlist then
   begin
      Formulas := Temp as TlkJSONlist;
      Formulas.ForEach(ForEachFormula, UserData);
   end;

   I := FCrpe.Formulas.IndexOf('nm_titulo');

   if I <> -1 then
   begin
      FCrpe.Formulas[I].Formula.Text := Name;
   end;
end;

procedure TReport.SetupGroupSelection;
var
   Temp: TlkJSONbase;
   GroupSelection: TlkJSONstring;
begin
   Temp := FSettings.Field['group_selection'];

   if Temp is TlkJSONstring then
   begin
      GroupSelection := Temp as TlkJSONstring;
      FCrpe.GroupSelection.Formula.Text := GroupSelection.Value;
   end;
end;

procedure TReport.SetupParamFields;
var
   Temp: TlkJSONbase;
   Params: TlkJSONlist;
   UserData: Pointer;
begin
   Temp := FSettings.Field['parameters'];

   if Temp is TlkJSONlist then
   begin
      Params := Temp as TlkJSONlist;
      Params.ForEach(ForEachParams, UserData);
   end;
end;

procedure TReport.SetupReport;
begin
   FCrpe.LoadEngine;
   FCrpe.Printer.GetCurrent(True);
   FCrpe.Printer.PreserveRptSettings := [prOrientation, prPaperSize];
   FCrpe.ReportName := FFilePath;
   FCrpe.WindowState := wsMaximized;
   FCrpe.WindowButtonBar.ExportBtn := FSettings.Field['can_export'].Value;

   if FCrpe.HasSavedData then
   begin
      FCrpe.DiscardSavedData;
   end;

   Connect;
end;

procedure TReport.SetupSelection;
const
   SConcatOpFmt = '%s and ';
   SConcatFilterFmt = '%s%s';
var
   Temp: TlkJSONbase;
   S: AnsiString;
begin
   S := FSelection;

   Temp := FSettings.Field['extra_filter'];

   if Temp is TlkJSONstring then
   begin
      if S <> '' then
         S := Format(SConcatOpFmt, [S]);
      S := Format(SConcatFilterFmt, [S, FSettings.getString('extra_filter')]);
   end;

   FCrpe.Selection.Formula.Text := S;
end;

procedure TReport.SetupSortFields;
var
   Temp: TlkJSONbase;
   SortFields: TlkJSONlist;
   UserData: Pointer;
begin
   Temp := FSettings.Field['sort_fields'];

   if Temp is TlkJSONlist then
   begin
      SortFields := Temp as TlkJSONlist;
      SortFields.ForEach(ForEachSortField, UserData);
   end;
end;

procedure TReport.SetupSQLAfter;
const
   SCaption = 'Confirmação';
var
   Temp: TlkJSONbase;
   SQLAfter: TlkJSONobject;
   SQLExpressions: TlkJSONlist;
   UserMessage: AnsiString;
   UserData: Pointer;
   UserChoice: Integer;
begin
   Temp := FSettings.Field['sql_after'];

   if Temp is TlkJSONobject then
   begin
      SQLAfter := Temp as TlkJSONobject;
      Temp := SQLAfter.Field['message'];
      
      UserMessage := '';

      if Temp is TlkJSONstring then
         UserMessage := SQLAfter.getString('message');

      UserChoice := ID_YES;

      if UserMessage <> '' then
      begin
         UserChoice := MessageBox(0, PChar(UserMessage), SCaption,
            MB_ICONQUESTION or MB_YESNO);
      end;

      if UserChoice = ID_YES then
      begin
      
         Temp := SQLAfter.Field['sql'];
         
         if Temp is TlkJSONlist then
         begin
            SQLExpressions := Temp as TlkJSONlist;
            SQLExpressions.ForEach(ForEachSQLAfter, UserData);
         end;
         
      end;
      
   end;
end;

procedure TReport.SetupSQLBefore;
var
   Temp: TlkJSONbase;
   SQLExpressions: TlkJSONlist;
   UserData: Pointer;
begin
   Temp := FSettings.Field['sql_before'];

   if Temp is TlkJSONlist then
   begin
      SQLExpressions := Temp as TlkJSONlist;
      SQLExpressions.ForEach(ForEachSQLBefore, UserData);
   end;
end;

procedure TReport.SetupSQLExpressions;
var
   Temp: TlkJSONbase;
   SQLExpressions: TlkJSONlist;
   UserData: Pointer;
begin
   Temp := FSettings.Field['sql_expressions'];

   if Temp is TlkJSONlist then
   begin
      SQLExpressions := Temp as TlkJSONlist;
      SQLExpressions.ForEach(ForEachSQLExpression, UserData);
   end;                       
end;

{ TItem }

constructor TItem.Create(const AID, AName: AnsiString);
begin
   FVarType := varString;
   FID := AID;
   FName := AName;
end;

constructor TItem.Create(const AID: Integer; AName: AnsiString);
begin
   Create(Format(SIntToStrFmt, [AID]), AName);
   FVarType := varInteger;
end;

function TItem.Equal(const AID: AnsiString): Boolean;
begin
   Result := FID = AID;
end;

function TItem.Equal(const AID: Integer): Boolean;
begin
   Result := Equal(Format(SIntToStrFmt, [AID]));
end;

function TItem.Empty: Boolean;
begin
   Result := FID = '';
end;

function TItem.Equal(const Item: TItem): Boolean;
begin
   Result := FID = Item.ID;
end;

function TItem.GetFormattedId: AnsiString;
begin
   Result := ID;
   
   if FVarType = varString then
   begin
      Result := QuotedStr(Result);
   end;
end;

end.
