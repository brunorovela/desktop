unit UFReportWizardStepBase;

interface

uses
   Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms, 
   Dialogs, UCrpe32, uLkJSON;

type
   TUpdateStatusEvent = procedure (Sender: TObject) of object;

   TStepState = (ssNone, ssInsert, ssEdit);

   TfrmReportWizardStepBase = class(TFrame)
   private
      FInitialized: Boolean;
      FCrpe: TCrpe;
      FCRFields: TStrings;
      FCRFormulas: TStrings;
      FCRParameters: TStrings;
      FSettings: TlkJSONobject;
      FState: TStepState;
      FReportId: Cardinal;
      FOnUpdateStatus: TUpdateStatusEvent;
      function GetCRFields: TStrings;
      function GetCRFormulas: TStrings;
      function GetCRParameters: TStrings;
      procedure SetCRFields(const Value: TStrings);
      procedure SetCRFormulas(const Value: TStrings);
      procedure SetCRParameters(const Value: TStrings);
   protected
      procedure UpdateStatus; virtual;
      property Initialized: Boolean read FInitialized write FInitialized;
      property State: TStepState read FState;
   public
      function CanMoveBack: Boolean; virtual; abstract;
      function CanMoveFoward: Boolean; virtual; abstract;
      procedure AfterConstruction; override;
      procedure Save; virtual; abstract;
      procedure Setup(const AState: TStepState); virtual;
      property CRFields: TStrings read GetCRFields write SetCRFields;
      property CRFormulas: TStrings read GetCRFormulas write SetCRFormulas;
      property CRParameters: TStrings read GetCRParameters write SetCRParameters;
      property Crpe: TCrpe read FCrpe write FCrpe;
      property OnUpdateStatus: TUpdateStatusEvent read FOnUpdateStatus write FOnUpdateStatus;
      property ReportId: Cardinal read FReportId write FReportId;
      property Settings: TlkJSONobject read FSettings write FSettings;
   end;

implementation

{$R *.dfm}

{ TfrmReportWizardStepBase }

procedure TfrmReportWizardStepBase.AfterConstruction;
begin
   FInitialized := False;
   FCrpe := nil;
   FCRFields := TStringList.Create;
   FCRFormulas := TStringList.Create;
   FCRParameters := TStringList.Create;
   FSettings := nil;
   FState := ssNone;
   FReportId := 0;
   FOnUpdateStatus := nil;
end;

function TfrmReportWizardStepBase.GetCRFields: TStrings;
begin
   Result := TStringList.Create;
   Result.Assign(FCRFields);
end;

function TfrmReportWizardStepBase.GetCRFormulas: TStrings;
begin
   Result := TStringList.Create;
   Result.Assign(FCRFormulas);
end;

function TfrmReportWizardStepBase.GetCRParameters: TStrings;
begin
   Result := TStringList.Create;
   Result.Assign(FCRParameters);
end;

procedure TfrmReportWizardStepBase.SetCRFields(const Value: TStrings);
begin
   FCRFields.Assign(Value);
end;

procedure TfrmReportWizardStepBase.SetCRFormulas(const Value: TStrings);
begin
   FCRFormulas.Assign(Value);
end;

procedure TfrmReportWizardStepBase.SetCRParameters(const Value: TStrings);
begin
   FCRParameters.Assign(Value);
end;

procedure TfrmReportWizardStepBase.Setup(const AState: TStepState);
begin
   if not FInitialized then
   begin
      FState := AState;
   end;
end;

procedure TfrmReportWizardStepBase.UpdateStatus;
begin
   if Assigned(FOnUpdateStatus) then
   begin
      FOnUpdateStatus(Self);
   end;
end;

end.
