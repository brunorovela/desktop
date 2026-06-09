unit UFLGTCValorBase;

interface

uses
   Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
   Dialogs, DB, DBClient, uLkJSON;

type
   TfrmLGTCValorBase = class(TFrame)
      cdsValor: TClientDataSet;
      dsValor: TDataSource;
   private
      FValor: Currency;
   protected
      function GetValor: Currency; virtual; abstract;
      function ToJSON: AnsiString;
      procedure FromJSON(const JSON: AnsiString);
   public
      constructor Create(AOwner: TComponent); override;
      destructor Destroy; override;
      function CanSave: Boolean; virtual; abstract;
      procedure HighlightControls; virtual; abstract;
      procedure ForEachJSON(ElName: string; Elem: TlkJSONbase; data: pointer;
         var Continue: Boolean);
      procedure SetExtraValue(const Value: AnsiString); virtual; abstract;
      procedure SetField(const FieldName: AnsiString; const Value: Variant); virtual; abstract;
      property JSON: AnsiString read ToJSON write FromJSON;
      property Valor: Currency read GetValor;
   end;

implementation

{$R *.dfm}

{ TfrmLGTCValorBase }

constructor TfrmLGTCValorBase.Create(AOwner: TComponent);
begin
   inherited;
   cdsValor.CreateDataSet;
   cdsValor.Open;
   cdsValor.Insert;
end;

destructor TfrmLGTCValorBase.Destroy;
begin
   cdsValor.EmptyDataSet;
   cdsValor.Close;
   inherited;
end;

procedure TfrmLGTCValorBase.ForEachJSON(ElName: string; Elem: TlkJSONbase;
  data: pointer; var Continue: Boolean);
begin
   cdsValor.FieldByName(ElName).Value := Elem.Value;
end;

procedure TfrmLGTCValorBase.FromJSON(const JSON: AnsiString);
var
   I: Integer;
   JSONObject: TlkJSONobject;
   UserData: Pointer;
begin
   JSONObject := TlkJSONobject(TlkJSON.ParseText(JSON));
   try
      JSONObject.ForEach(ForEachJSON, UserData);
   finally
      FreeAndNil(JSONObject);
   end;
end;

function TfrmLGTCValorBase.ToJSON: AnsiString;
var
   I: Integer;
   Field: TField;
   JSONObject: TlkJSONobject;
begin
   JSONObject := TlkJSONobject.Create(False);   
   try
      for I := 0 to cdsValor.Fields.Count - 1 do
      begin
         Field := cdsValor.Fields[I];
         if Field.FieldKind = fkData then
         begin
            if Field.IsNull then
            begin
               JSONObject.Add(Field.FieldName, TlkJSONnull.Create);
               Continue;
            end;
            case Field.DataType of
               ftSmallint, ftInteger, ftLargeint, ftWord:
                  JSONObject.Add(Field.FieldName, Field.AsInteger);
               ftBoolean:
                  JSONObject.Add(Field.FieldName, Field.AsBoolean);
               ftFloat:
                  JSONObject.Add(Field.FieldName, Field.AsFloat);
               ftCurrency:
                  JSONObject.Add(Field.FieldName, Field.AsCurrency);
               else
                  JSONObject.Add(Field.FieldName, Field.AsString);
            end;
         end;
      end;
      Result := TlkJSON.GenerateText(JSONObject);
   finally
      FreeAndNil(JSONObject);
   end;
end;

end.
