unit UFReportWizard;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, Contnrs, UFReportWizardStepBase, UCrpeClasses, UCrpe32,
  StdCtrls;

type
  TfrmReportWizard = class(TForm)
    pnlInfo: TPanel;
    pnlData: TPanel;
    pnlSteps: TPanel;
    pnlStep: TPanel;
    pnlButtons: TPanel;
    bvlSep1: TBevel;
    bvlSep2: TBevel;
    bvlSep3: TBevel;
    Crpe: TCrpe;
    btnPrevious: TButton;
    btnNext: TButton;
    btnCancel: TButton;
    btnEditQuery: TButton;
    btnNewQuery: TButton;
    procedure btnNewQueryClick(Sender: TObject);
    procedure btnEditQueryClick(Sender: TObject);
    procedure btnNextClick(Sender: TObject);
    procedure btnPreviousClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
      FStepIndex: Integer;
      FSteps: TComponentList;
      function GetCurrentStep: TfrmReportWizardStepBase;
      procedure GoBack;
      procedure GoFoward;
      procedure LoadFrames;
      procedure OnUpdateStatus(Sender: TObject);
      procedure ShowStep;
    { Private declarations }
  public
    { Public declarations }
  end;

var
   frmReportWizard: TfrmReportWizard;

implementation

uses
   UFReportQueryBuilder;

{$R *.dfm}

procedure TfrmReportWizard.btnNextClick(Sender: TObject);
begin
   GoFoward;
end;

procedure TfrmReportWizard.btnEditQueryClick(Sender: TObject);
begin
   TfrmReportQueryBuilder.Edit(1);
end;

procedure TfrmReportWizard.btnNewQueryClick(Sender: TObject);
begin
   TfrmReportQueryBuilder.New;
end;

procedure TfrmReportWizard.btnPreviousClick(Sender: TObject);
begin
   GoBack;
end;

procedure TfrmReportWizard.FormClose(Sender: TObject; var Action: TCloseAction);
begin
   frmReportWizard := nil;
   FSteps.Free;
   Action := caFree;
end;

procedure TfrmReportWizard.FormCreate(Sender: TObject);
begin
   FStepIndex := 0;
   FSteps := TComponentList.Create;
   LoadFrames;
   ShowStep;
end;

function TfrmReportWizard.GetCurrentStep: TfrmReportWizardStepBase;
begin
   Result := TfrmReportWizardStepBase(FSteps[FStepIndex]);
end;

procedure TfrmReportWizard.GoBack;
begin
   Dec(FStepIndex);
   ShowStep;
   OnUpdateStatus(nil);
end;

procedure TfrmReportWizard.GoFoward;
begin
   Inc(FStepIndex);
   ShowStep;
   OnUpdateStatus(nil);
end;

procedure TfrmReportWizard.LoadFrames;
type
   TfrmReportWizardStepBaseClass = class of TfrmReportWizardStepBase;
const
   ClassNames: array[0..3] of AnsiString = (
      'TfrmReportWizardStepFile',
      'TfrmReportWizardStepFilters',
      'TfrmReportWizardStepCustomFilters',
      'TfrmReportWizardStepSelection');
var
   Frame: TfrmReportWizardStepBase;
   ClassRef: TPersistentClass;
   I, H, L: Integer;
begin
   L := Low(ClassNames);
   H := High(ClassNames);

   for I := L to H do
   begin
      ClassRef := FindClass(ClassNames[I]);

      if Assigned(ClassRef) then
      begin
         Frame := TfrmReportWizardStepBaseClass(ClassRef).Create(Self);
         Frame.Name := '';
         Frame.Parent := pnlStep;
         Frame.Crpe := Crpe;
         Frame.OnUpdateStatus := OnUpdateStatus;
         FSteps.Add(Frame);
      end;
   end;
end;

procedure TfrmReportWizard.OnUpdateStatus(Sender: TObject);
begin
   btnPrevious.Enabled := GetCurrentStep.CanMoveBack;
   btnNext.Enabled := GetCurrentStep.CanMoveFoward;
end;

procedure TfrmReportWizard.ShowStep;
var
   I: Integer;
   Frame: TfrmReportWizardStepBase;
begin
   for I := 0 to FSteps.Count - 1 do
   begin
      if I <> FStepIndex then
      begin
         Frame := TfrmReportWizardStepBase(FSteps[I]);
         
         if Frame.Visible then
         begin
            Frame.Hide;
         end;
      end;
   end;

   Frame := TfrmReportWizardStepBase(FSteps[FStepIndex]);
   Frame.Setup(ssInsert);
   Frame.Show;
end;

end.
