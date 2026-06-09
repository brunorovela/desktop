unit UOpticalReader;

interface

uses
   Classes, StrUtils, SysUtils, UUtils;

type
   TResponse = class(TObject)
   strict private
      FId: Integer;
      FCharacter: Char;
      function GetId: Integer;
      function GetNumber: Integer;
   public
      constructor Create(const AId: Integer; const Character: Char);
      property Id: Integer read GetId;
      property Number: Integer read GetNumber;
   end;

   TResponseList = class(TList)
   protected
      function GetItem(Index: Integer): TResponse;
      procedure SetItem(Index: Integer; AObject: TResponse);
   public
      function Add(AObject: TResponse): Integer;
      function Extract(Item: TResponse): TResponse;
      function Remove(AObject: TResponse): Integer;
      function IndexOf(AObject: TResponse): Integer;
      procedure Insert(Index: Integer; AObject: TResponse);
      function First: TResponse;
      function Last: TResponse;
      property Items[Index: Integer]: TResponse read GetItem write SetItem; default;
   end;

   TTemplate = class(TObject)
   strict private
      FCustomId: Integer;
      FCardId: Integer;
      FResponses: TResponseList;
      function GetCustomId: Integer;
      function GetResponses: TResponseList;
   public
      constructor Create(const ACustomId, CardId: Integer);
      destructor Destroy; override;
      procedure AddResponse(const Id: Integer; const Character: Char); overload;
      procedure AddResponse(Response: TResponse); overload;
      property CustomId: Integer read GetCustomId;
      property Responses: TResponseList read GetResponses;
   end;

   TTemplateList = class(TList)
   protected
      function GetItem(Index: Integer): TTemplate;
      procedure SetItem(Index: Integer; AObject: TTemplate);
   public
      function Add(AObject: TTemplate): Integer;
      function Extract(Item: TTemplate): TTemplate;
      function Remove(AObject: TTemplate): Integer;
      function IndexOf(AObject: TTemplate): Integer;
      procedure Insert(Index: Integer; AObject: TTemplate);
      function First: TTemplate;
      function Last: TTemplate;
      property Items[Index: Integer]: TTemplate read GetItem write SetItem; default;
   end;

   IOpticalReader = interface(IUnknown)
      ['{2649BA40-C587-42EC-87ED-B83FC25CDC6B}']
      function GetModelName: string;
   end;

   TOpticalReaderLC2000 = class(TInterfacedObject, IOpticalReader)
   strict private
      FData: TStringList;
      FCustomIdLength: Integer;
      FCardIdLength: Integer;
      FTemplates: TTemplateList;
      function GetTemplates: TTemplateList;
      procedure LoadData;
   public
      constructor Create(const CustomIdLength, CardIdLength: Integer;
         const Data: TStringList);
      destructor Destroy; override;
      function GetModelName: string;
      property Templates: TTemplateList read GetTemplates;
   end;

implementation

{ TResponse }

constructor TResponse.Create(const AId: Integer; const Character: Char);
begin
   FId := AId;
   FCharacter := Character;
end;

function TResponse.GetId: Integer;
begin
   Result := FId;
end;

function TResponse.GetNumber: Integer;
begin
   Result := Ord(UpCase(FCharacter)) - 64;
end;

{ TResponseList }

function TResponseList.Add(AObject: TResponse): Integer;
begin
   Result := inherited Add(AObject);
end;

function TResponseList.Extract(Item: TResponse): TResponse;
begin
   Result := TResponse(inherited Extract(Item));
end;

function TResponseList.First: TResponse;
begin
   Result := TResponse(inherited First);
end;

function TResponseList.GetItem(Index: Integer): TResponse;
begin
   Result := TResponse(inherited Items[Index]);
end;

function TResponseList.IndexOf(AObject: TResponse): Integer;
begin
   Result := inherited IndexOf(AObject);
end;

procedure TResponseList.Insert(Index: Integer; AObject: TResponse);
begin
   inherited Insert(Index, AObject);
end;

function TResponseList.Last: TResponse;
begin
   Result := TResponse(inherited Last);
end;

function TResponseList.Remove(AObject: TResponse): Integer;
begin
   Result := inherited Remove(AObject);
end;

procedure TResponseList.SetItem(Index: Integer; AObject: TResponse);
begin
   inherited Items[Index] := AObject;
end;

{ TTemplate }

procedure TTemplate.AddResponse(Response: TResponse);
begin
   FResponses.Add(Response);
end;

constructor TTemplate.Create(const ACustomId, CardId: Integer);
begin
   FCustomId := ACustomId;
   FCardId := CardId;
   FResponses := TResponseList.Create;
end;

procedure TTemplate.AddResponse(const Id: Integer; const Character: Char);
begin
   AddResponse(TResponse.Create(Id, Character));
end;

destructor TTemplate.Destroy;
var
   I: Integer;
begin
   for I := FResponses.Count - 1 downto 0 do
   begin
      FResponses.Extract(FResponses.Items[I]).Free;
   end;
   FResponses.Clear;
   FResponses.Free;
   inherited;
end;

function TTemplate.GetCustomId: Integer;
begin
   Result := FCustomId;
end;

function TTemplate.GetResponses: TResponseList;
begin
   Result := FResponses;
end;

{ TTemplateList }

function TTemplateList.Add(AObject: TTemplate): Integer;
begin
   Result := inherited Add(AObject);
end;

function TTemplateList.Extract(Item: TTemplate): TTemplate;
begin
   Result := TTemplate(inherited Extract(Item));
end;

function TTemplateList.First: TTemplate;
begin
   Result := TTemplate(inherited First);
end;

function TTemplateList.GetItem(Index: Integer): TTemplate;
begin
   Result := TTemplate(inherited Items[Index]);
end;

function TTemplateList.IndexOf(AObject: TTemplate): Integer;
begin
   Result := inherited IndexOf(AObject);
end;

procedure TTemplateList.Insert(Index: Integer; AObject: TTemplate);
begin
   inherited Insert(Index, AObject);
end;

function TTemplateList.Last: TTemplate;
begin
   Result := TTemplate(inherited Last);
end;

function TTemplateList.Remove(AObject: TTemplate): Integer;
begin
   Result := inherited Remove(AObject);
end;

procedure TTemplateList.SetItem(Index: Integer; AObject: TTemplate);
begin
   inherited Items[Index] := AObject;
end;

{ TOpticalReaderLC2000 }

constructor TOpticalReaderLC2000.Create(const CustomIdLength,
  CardIdLength: Integer; const Data: TStringList);
begin
   FCustomIdLength := CustomIdLength;
   FCardIdLength := CardIdLength;
   FTemplates := TTemplateList.Create;
   FData := TStringList.Create;
   FData.Assign(Data);
   LoadData;
end;

destructor TOpticalReaderLC2000.Destroy;
var
   I: Integer;
begin
   for I := FTemplates.Count - 1 downto 0 do
   begin
      FTemplates.Extract(FTemplates.Items[I]).Free;
   end;
   FData.Free;
   inherited;
end;

function TOpticalReaderLC2000.GetModelName: string;
begin
   Result := 'LC2000';
end;

function TOpticalReaderLC2000.GetTemplates: TTemplateList;
begin
   Result := FTemplates;
end;

procedure TOpticalReaderLC2000.LoadData;
var
   I, J, CustomId, CardId: Integer;
   Line, Responses, S: string;
   Template: TTemplate;
begin
   for I := 0 to FData.Count - 1 do
   begin
      Line := FData.Strings[I];
      S := LeftStr(Line, FCustomIdLength);

      if TryStrToInt(S, CustomId) then
      begin
         S := Copy(Line, FCustomIdLength + 1, FCardIdLength);
         CardId := BinToDec(S);
         Template := TTemplate.Create(CustomId, CardId);

         Responses := RightStr(Line, Length(Line) - FCustomIdLength - FCardIdLength);

         for J := 1 to Length(Responses) do Template.AddResponse(J, Responses[J]);

         FTemplates.Add(Template);
      end;
   end;
end;

end.
