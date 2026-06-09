unit UFReportFilterComponent;

interface

uses
   Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms, 
   Dialogs, ExtCtrls, StdCtrls, Contnrs, uLkJSON;

type
   TfrmReportFilterComponent = class(TFrame)
      lblLabel: TLabel;
      pnlContent: TPanel;
      pnlLabel: TPanel;
   private
      FFilterName: AnsiString;
      FCustom: Boolean;
      FRequired: Boolean;
      FTitle: AnsiString;
      function GetLabelWidth: Integer;
   protected
      function GetAsCrExpression: AnsiString; virtual; abstract;
      function GetAsCrExpressionByIndex(const Index: Integer): AnsiString; virtual; abstract;
      function GetAsHumanExpression: AnsiString; virtual;
      function GetAsSQLExpression: AnsiString; virtual;
      function GetCrOperator: AnsiString; virtual; abstract;
      function GetFirstItemAsCrExpression: AnsiString; virtual; abstract;
      procedure Clear; virtual; abstract;
      procedure ResizeLabel(const MaxWidth: Integer); virtual;
      procedure Setup; virtual;
      property Custom: Boolean read FCustom write FCustom;
      property FilterName: AnsiString read FFilterName write FFilterName;
      property LabelWitdh: Integer read GetLabelWidth;
      property Required: Boolean read FRequired;
      property Title: AnsiString read FTitle;
   public
      constructor Create(AOwner: TComponent; AParent: TWinControl;
         ARequired: Boolean; ATitle: AnsiString);
      function Validate: Boolean; virtual; abstract;
      property AsCrExpression: AnsiString read GetAsCrExpression;
      property AsCrExpressionByIndex[const Index: Integer]: AnsiString read GetAsCrExpressionByIndex;
      property AsSQLExpression: AnsiString read GetAsSQLExpression;
      property AsHumanExpression: AnsiString read GetAsHumanExpression;
      property CrOperator: AnsiString read GetCrOperator;
      property FirstItemAsCrExpression: AnsiString read GetFirstItemAsCrExpression;
   end;

   TReportFilterFactory = class
   private
      FSelection: TStrings;
      FOwner: TComponent;
      FParent: TWinControl;
      FFilters: TComponentList;
      FSettings: TlkJSONobject;
      constructor Create;
      function FindFilterClass(const Name: AnsiString): TPersistentClass;
      function GetCrExprByName(const Name: AnsiString): AnsiString;
      function GetCrExprByIndex(const Name: AnsiString; const Index: Integer): AnsiString;
      function GetFirstCrExprByName(const Name: AnsiString): AnsiString;
      function GetHumanExprByName(const Name: AnsiString): AnsiString;
      function GetSQLExpr: AnsiString;
      function GetSQLExprByName(const Name: AnsiString): AnsiString;
      function GetMaxLabelWidth: Integer;
      procedure CreateFilter(const Name, Title: AnsiString;
         const Required: Boolean);
      procedure DestroyAll;
      procedure ForEachFilter(ElName: string; Elem: TlkJSONbase; data: pointer;
         var Continue: Boolean);
      procedure ForEachSelection(ElName: string; Elem: TlkJSONbase; data: pointer;
         var Continue: Boolean);
      procedure ResizeLabels;
      class var FInstance: TReportFilterFactory;
      class function GetInstance: TReportFilterFactory; static;
   public
      destructor Destroy; override;
      function BuildCrExpression(const Settings: TlkJSONobject): AnsiString;
      function Find(const Name: AnsiString): TfrmReportFilterComponent;
      function Validate: Boolean;
      procedure Clear;
      procedure CreateCustomFilter(Owner: TComponent; Parent: TWinControl;
         Name, Settings, SQLSettings: AnsiString; Required: Boolean);
      procedure CreateFilters(Owner: TComponent; Parent: TWinControl;
         Settings: AnsiString);
      procedure Reset;
      procedure Show;
      property MaxLabelWidth: Integer read GetMaxLabelWidth;
      property CrExprByName[const Name: AnsiString]: AnsiString read GetCrExprByName;
      property CrExprByIndex[const Name: AnsiString; const Index: Integer]: AnsiString read GetCrExprByIndex;
      property SQLExpr: AnsiString read GetSQLExpr;
      property SQLExprByName[const Name: AnsiString]: AnsiString read GetSQLExprByName;
      property HumanExprByName[const Name: AnsiString]: AnsiString read GetHumanExprByName;
      property FirstCrExprByName[const Name: AnsiString]: AnsiString read GetFirstCrExprByName;
      class property Instance: TReportFilterFactory read GetInstance;
   end;

   TReportFormulaFactory = class
   private
      FOwner: TComponent;
      FParent: TWinControl;
      FFormulas: TComponentList;
      constructor Create;
      function GetMaxLabelWidth: Integer;
      function GetValueByName(const Name: AnsiString): AnsiString;
      procedure DestroyAll;
      procedure ForEachFormula(ElName: string; Elem: TlkJSONbase; data: pointer;
         var Continue: Boolean);
      class function GetInstance: TReportFormulaFactory; static;
      class var FInstance: TReportFormulaFactory;
   public
      destructor Destroy; override;
      procedure Clear;
      procedure CreateFormulas(Owner: TComponent; Parent: TWinControl;
         JSON: AnsiString);
      procedure ResizeLabel(const MaxWidth: Integer);
      procedure Show;
      property MaxLabelWidth: Integer read GetMaxLabelWidth;
      property ValueByName[const Name: AnsiString]: AnsiString read GetValueByName;
      class property Instance: TReportFormulaFactory read GetInstance;
   end;

implementation

uses
   UFReportFilterCustom, UFReportFormula;

{$R *.dfm}

{ TfrmReportFilterComponent }

constructor TfrmReportFilterComponent.Create(AOwner: TComponent;
  AParent: TWinControl; ARequired: Boolean; ATitle: AnsiString);
begin
   inherited Create(AOwner);
   FCustom := False;
   Parent := AParent;
   FRequired := ARequired;
   FTitle := ATitle;
   Setup;
end;


function TfrmReportFilterComponent.GetAsHumanExpression: AnsiString;
begin
   Result := '';
end;

function TfrmReportFilterComponent.GetAsSQLExpression: AnsiString;
begin
   Result := '';
end;

function TfrmReportFilterComponent.GetLabelWidth: Integer;
begin
   Result := pnlLabel.Width;
end;

procedure TfrmReportFilterComponent.ResizeLabel(const MaxWidth: Integer);
begin
   if pnlLabel.Width < MaxWidth then
   begin
      pnlLabel.Width := MaxWidth;
   end;
end;

procedure TfrmReportFilterComponent.Setup;
const
   SLabelRequiredFmt = '%s*';
var
   S: AnsiString;
begin
   S := lblLabel.Caption;

   if Title <> '' then
   begin
      S := Title;
   end;

   if Required then
   begin
      S := Format(SLabelRequiredFmt, [S]);
   end;

   lblLabel.Caption := S;
   pnlLabel.AutoSize := True;
   pnlLabel.AutoSize := False;
end;

{ TReportFilterFactory }

function TReportFilterFactory.BuildCrExpression(
  const Settings: TlkJSONobject): AnsiString;
const
   SFilterConcatAndFmt = '%s and ';
   SFilterConcatFmt = '%s%s';
   SFilterFmt = '(%s)';
var
   Selection: TlkJSONlist;
   UserData: Pointer;
   I: Integer;
   S: AnsiString;
   CrSelection: TStrings;
begin
   Result := '';
   
   FSelection := TStringList.Create;
   CrSelection := TStringList.Create;
   try
      Selection := Settings.Field['selection'] as TlkJSONlist;
      Selection.ForEach(ForEachSelection, UserData);

      for I := 0 to FSelection.Count - 1 do
      begin
         S := Format(SFilterFmt, [FSelection.ValueFromIndex[I]]);
         CrSelection.Add(S);
      end;

      for I := 0 to FFilters.Count - 1 do
      begin
         if FFilters[I] is TfrmReportFilterCustom then
         begin
            S := TfrmReportFilterCustom(FFilters[I]).AsCrExpression;
            if S <> '' then
               CrSelection.Add(S);
         end;
      end;

      for I := 0 to CrSelection.Count - 1 do
      begin
         if Result <> '' then
            Result := Format(SFilterConcatAndFmt, [Result]);
         Result := Format(SFilterConcatFmt, [Result, CrSelection[I]]);
      end;

   finally
      FSelection.Free;
      CrSelection.Free;
   end;
end;

procedure TReportFilterFactory.Clear;
var
   I: Integer;
begin
   for I := 0 to FFilters.Count - 1 do
   begin
      TfrmReportFilterComponent(FFilters[I]).Clear;
   end;
end;

constructor TReportFilterFactory.Create;
begin
   inherited;
   FFilters := TComponentList.Create;
end;

procedure TReportFilterFactory.CreateCustomFilter(Owner: TComponent;
  Parent: TWinControl; Name, Settings, SQLSettings: AnsiString;
  Required: Boolean);
type
   TfrmReportFilterCustomClass = class of TfrmReportFilterCustom;
var
   ClassRef: TPersistentClass;
   Frame: TfrmReportFilterCustom;
begin
   ClassRef := FindFilterClass(Name);

   if Assigned(ClassRef) then
   begin
      Frame := TfrmReportFilterCustomClass(ClassRef).Create(Owner, Parent,
         Required, Settings, SQLSettings);
      Frame.Name := '';
      FFilters.Add(Frame);
   end;
   
end;

procedure TReportFilterFactory.CreateFilter(const Name, Title: AnsiString;
  const Required: Boolean);
type
   TfrmReportFilterComponentClass = class of TfrmReportFilterComponent;
var
   ClassRef: TPersistentClass;
   Frame: TfrmReportFilterComponent;
begin
   ClassRef := FindFilterClass(Name);

   if Assigned(ClassRef) then
   begin
      Frame := Find(Name);

      if Frame = nil then
      begin
         Frame := TfrmReportFilterComponentClass(ClassRef).Create(FOwner,
            FParent, Required, Title);
         Frame.Name := '';
         FFilters.Add(Frame);
      end;
      
   end;
end;

procedure TReportFilterFactory.CreateFilters(Owner: TComponent;
  Parent: TWinControl; Settings: AnsiString);
var
   Filters: TlkJSONlist;
   UserData: Pointer;
begin
   FOwner := Owner;
   FParent := Parent;
   FSettings := TlkJSON.ParseText(UTF8Encode(Settings)) as TlkJSONobject;
   Filters := FSettings.Field['filters'] as TlkJSONlist;
   Filters.ForEach(ForEachFilter, UserData);
   TReportFormulaFactory.Instance.CreateFormulas(Owner, Parent, Settings);
end;

destructor TReportFilterFactory.Destroy;
begin
   DestroyAll;
   FFilters.Free;
   FInstance := nil;
   inherited;
end;

procedure TReportFilterFactory.DestroyAll;
var
   I: Integer;
begin
   for I := FFilters.Count - 1 downto 0 do
   begin
      TfrmReportFilterComponent(FFilters.Extract(FFilters[I])).Free;
   end;
end;

function TReportFilterFactory.Find(
  const Name: AnsiString): TfrmReportFilterComponent;
var
   ClassRef: TPersistentClass;
   I: Integer;
begin
   ClassRef := FindFilterClass(Name);
   Result := nil;

   if Assigned(ClassRef) then
   begin
      for I := 0 to FFilters.Count - 1 do
      begin
         if FFilters[I] is ClassRef then
         begin
            Result := TfrmReportFilterComponent(FFilters[I]);
            Break;
         end;
      end;
   end;
end;

function TReportFilterFactory.FindFilterClass(
  const Name: AnsiString): TPersistentClass;
const
   SClassNameFmt = 'TfrmReportFilter%s';
var
   ComponentName: AnsiString;
begin
   ComponentName := Format(SClassNameFmt, [Name]);
   Result := FindClass(ComponentName);
end;

procedure TReportFilterFactory.ForEachFilter(ElName: string; Elem: TlkJSONbase;
  data: pointer; var Continue: Boolean);
var
   JSONObject: TlkJSONobject;
   Kind, Title: AnsiString;
   Required: Boolean;
begin
   JSONObject := Elem as TlkJSONobject;

   if JSONObject.getBoolean('visible') then
   begin
   
      Kind := JSONObject.getString('kind');
      Required := JSONObject.getBoolean('required');
      Title := '';

      if JSONObject.Field['title'] is TlkJSONstring then
      begin
         Title := JSONObject.getString('title');
      end;

      CreateFilter(Kind, Title, Required);
   end;
end;

procedure TReportFilterFactory.ForEachSelection(ElName: string;
  Elem: TlkJSONbase; data: pointer; var Continue: Boolean);
const
   SFilterFmt = '%s %s %s';
   SFilterConcatAndFmt = '%s and ';
   SFilterConcatOrFmt = '%s or ';
   SFilterConcatFmt = '%s%s';
var
   JSONItem: TlkJSONobject;
   OpAttr, DefaultAttr: TlkJSONbase;
   FieldName, OpSymbol, PropName, Value, Filter, S: AnsiString;
   Frame: TfrmReportFilterComponent;
begin
   JSONItem := Elem as TlkJSONobject;
   FieldName := JSONItem.getString('field');

   S := '';
   PropName := 'Default';

   if JSONItem.Field['property'] is TlkJSONstring then
   begin
      PropName := JSONItem.getString('property');
      Frame := Find(PropName);
      if Frame <> nil then
      begin
         OpSymbol := Frame.CrOperator;
         Value := Frame.AsCrExpression;
         if Value <> '' then
         begin
            S := Format(SFilterFmt, [FieldName, OpSymbol, Value]);
         end;
      end;
   end;

   if S = '' then
   begin
      OpAttr := JSONItem.Field['operator'];
      DefaultAttr := JSONItem.Field['default'];
      
      if (OpAttr is TlkJSONstring) and (DefaultAttr is TlkJSONstring) then
      begin
         Value := JSONItem.getString('default');
         OpSymbol := JSONItem.getString('operator');
         
         if Value <> '' then
         begin
            S := Format(SFilterFmt, [FieldName, OpSymbol, Value]);
         end;
      end;
   end;

   if S <> '' then
   begin
      Filter := FSelection.Values[PropName];

      if Filter <> '' then
      begin
         if PropName = 'Default' then
            Filter := Format(SFilterConcatAndFmt, [Filter]);

         if PropName <> 'Default' then
            Filter := Format(SFilterConcatOrFmt, [Filter]);
      end;

      Filter := Format(SFilterConcatFmt, [Filter, S]);
      FSelection.Values[PropName] := Filter;
   end;

end;

function TReportFilterFactory.GetCrExprByIndex(const Name: AnsiString;
  const Index: Integer): AnsiString;
var
   Frame: TfrmReportFilterComponent;
begin
   Result := '';
   Frame := Find(Name);

   if Assigned(Frame) then
   begin
      Result := Frame.AsCrExpressionByIndex[Index];
   end;
end;

function TReportFilterFactory.GetCrExprByName(
  const Name: AnsiString): AnsiString;
var
   Frame: TfrmReportFilterComponent;
begin
   Result := '';
   Frame := Find(Name);

   if Assigned(Frame) then
   begin
      Result := Frame.AsCrExpression;
   end;
end;

function TReportFilterFactory.GetFirstCrExprByName(
  const Name: AnsiString): AnsiString;
var
   Frame: TfrmReportFilterComponent;
begin
   Result := '';
   Frame := Find(Name);

   if Assigned(Frame) then
   begin
      Result := Frame.FirstItemAsCrExpression;
   end;
end;

function TReportFilterFactory.GetHumanExprByName(
  const Name: AnsiString): AnsiString;
var
   Frame: TfrmReportFilterComponent;
begin
   Result := '';
   Frame := Find(Name);
   
   if Assigned(Frame) then
   begin
      Result := Frame.AsHumanExpression;
   end;
end;

class function TReportFilterFactory.GetInstance: TReportFilterFactory;
begin
   if not Assigned(FInstance) then
   begin
      FInstance := TReportFilterFactory.Create;
   end;

   Result := FInstance;
end;

function TReportFilterFactory.GetMaxLabelWidth: Integer;
var
   I, Width: Integer;
begin
   Result := 0;
   
   for I := 0 to FFilters.Count - 1 do
   begin
      Width := TfrmReportFilterComponent(FFilters[I]).pnlLabel.Width;
      if Width > Result then
      begin
         Result := Width;
      end;
   end;
end;

function TReportFilterFactory.GetSQLExpr: AnsiString;
var
   I: Integer;
   Frame: TfrmReportFilterComponent;
begin
   Result := '';

   for I := 0 to FFilters.Count - 1 do
   begin
      if Result <> '' then
         Result := Result + ' AND ';
      Frame := TfrmReportFilterComponent(FFilters[I]);
      Result := Result + SQLExprByName[Frame.FilterName];
   end;
end;

function TReportFilterFactory.GetSQLExprByName(
  const Name: AnsiString): AnsiString;
var
   Frame: TfrmReportFilterComponent;
begin
   Result := '';
   Frame := Find(Name);

   if Assigned(Frame) then
   begin
      Result := Frame.AsSQLExpression;
   end;
end;

procedure TReportFilterFactory.Reset;
begin
   DestroyAll;
   FreeAndNil(FFilters);
   FreeAndNil(FSettings);
   FFilters := TComponentList.Create;
end;

procedure TReportFilterFactory.ResizeLabels;
var
   MaxWidth, MaxFormulaWidth, I: Integer;
begin
   MaxWidth := MaxLabelWidth;
   MaxFormulaWidth := TReportFormulaFactory.Instance.MaxLabelWidth;

   if MaxFormulaWidth > MaxWidth then
   begin
      MaxWidth := MaxFormulaWidth;
   end;

   for I := 0 to FFilters.Count - 1 do
   begin
      TfrmReportFilterComponent(FFilters[I]).ResizeLabel(MaxWidth);
   end;

   TReportFormulaFactory.Instance.ResizeLabel(MaxWidth);
end;

procedure TReportFilterFactory.Show;
var
   I: Integer;
begin
   ResizeLabels;

   TReportFormulaFactory.Instance.Show;

   for I := FFilters.Count - 1 downto 0 do
   begin
      TFrame(FFilters[I]).Show;
   end;
end;

function TReportFilterFactory.Validate: Boolean;
var
   I: Integer;
begin
   Result := True;
   
   for I := 0 to FFilters.Count - 1 do
   begin
      if not TfrmReportFilterComponent(FFilters[I]).Validate then
      begin
         Result := False;
         Break;
      end;
   end;
end;

{ TReportFormulaFactory }

procedure TReportFormulaFactory.Clear;
var
   I: Integer;
begin
   for I := 0 to FFormulas.Count - 1 do
   begin
      TfrmReportFormula(FFormulas[I]).Clear;
   end;
end;

constructor TReportFormulaFactory.Create;
begin
   inherited;
   FFormulas := TComponentList.Create;
end;

procedure TReportFormulaFactory.CreateFormulas(Owner: TComponent;
  Parent: TWinControl; JSON: AnsiString);
var
   Settings: TlkJSONobject;
   Formulas: TlkJSONlist;
   UserData: Pointer;
begin
   FOwner := Owner;
   FParent := Parent;

   Settings := TlkJSON.ParseText(JSON) as TlkJSONobject;
   try
      if Settings.Field['formulas'] is TlkJSONlist then
      begin
         Formulas := TlkJSONlist(Settings.Field['formulas']);
         Formulas.ForEach(ForEachFormula, UserData);
      end;
   finally
      Settings.Free;
   end;
end;

destructor TReportFormulaFactory.Destroy;
begin
   DestroyAll;
   FFormulas.Free;
   FInstance := nil;
   inherited;
end;

procedure TReportFormulaFactory.DestroyAll;
var
   I: Integer;
begin
   for I := FFormulas.Count - 1 downto 0 do
   begin
      TfrmReportFormula(FFormulas[I]).Free;
   end;
end;

procedure TReportFormulaFactory.ForEachFormula(ElName: string;
  Elem: TlkJSONbase; data: pointer; var Continue: Boolean);
var
   Formula: TlkJSONobject;
   Frame: TfrmReportFormula;
begin
   Formula := Elem as TlkJSONobject;

   if Formula.getBoolean('visible') then
   begin
      Frame := TfrmReportFormula.Create(FOwner);
      Frame.Name := '';
      Frame.Parent := FParent;
      
      Frame.FormulaName := Formula.getString('name');
      Frame.FormulaLabel := Frame.FormulaName;

      if Formula.Field['title'] is TlkJSONstring then
      begin
         Frame.FormulaLabel := Formula.getString('title');
      end;

      if Formula.Field['value'] is TlkJSONstring then
      begin
         Frame.FormulaValue := Formula.getString('value');
      end;
      
      FFormulas.Add(Frame);
   end;
end;

class function TReportFormulaFactory.GetInstance: TReportFormulaFactory;
begin
   if not Assigned(FInstance) then
   begin
      FInstance := TReportFormulaFactory.Create;
   end;

   Result := FInstance;
end;

function TReportFormulaFactory.GetMaxLabelWidth: Integer;
var
   I, Width: Integer;
begin
   Result := 0;

   for I := 0 to FFormulas.Count - 1 do
   begin
      Width := TfrmReportFormula(FFormulas[I]).pnlLabel.Width;
      if Width > Result then
      begin
         Result := Width;
      end;
   end;
end;

function TReportFormulaFactory.GetValueByName(
  const Name: AnsiString): AnsiString;
var
   I: Integer;
   Frame: TfrmReportFormula;
begin
   for I := 0 to FFormulas.Count - 1 do
   begin
      Frame := TfrmReportFormula(FFormulas[I]);
      
      if Frame.FormulaName = Name then
      begin
         Result := Frame.FormulaValue;
         Break;
      end;
   end;
end;

procedure TReportFormulaFactory.ResizeLabel(const MaxWidth: Integer);
var
   I: Integer;
begin
   for I := 0 to FFormulas.Count - 1 do
   begin
      TfrmReportFormula(FFormulas[I]).ResizeLabel(MaxWidth);
   end;
end;

procedure TReportFormulaFactory.Show;
var
   I: Integer;
begin
   for I := FFormulas.Count - 1 downto 0 do
   begin
      TFrame(FFormulas[I]).Show;
   end;
end;

end.
