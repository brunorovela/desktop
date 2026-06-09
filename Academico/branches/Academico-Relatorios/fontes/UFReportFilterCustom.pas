unit UFReportFilterCustom;

interface

uses
   Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
   Dialogs, UFReportFilterComponent, StdCtrls, ExtCtrls, uLkJSON;

type
   TfrmReportFilterCustom = class(TfrmReportFilterComponent)
   private
      FSettings: TlkJSONobject;
      FSQLSettings: TlkJSONobject;
   protected
      function KeyFieldIsString: Boolean; virtual; abstract;
      property Settings: TlkJSONobject read FSettings;
      property SQLSettings: TlkJSONobject read FSQLSettings;
   public
      constructor Create(AOwner: TComponent; AParent: TWinControl;
         ARequired: Boolean; ASettings, ASQLSettings: AnsiString);
      destructor Destroy; override;
   end;

implementation

{$R *.dfm}

{ TfrmReportFilterCustom }

constructor TfrmReportFilterCustom.Create(AOwner: TComponent;
  AParent: TWinControl; ARequired: Boolean; ASettings,
  ASQLSettings: AnsiString);
begin
   FSettings := TlkJSON.ParseText(UTF8Encode(ASettings)) as TlkJSONobject;
   FSQLSettings := TlkJSON.ParseText(UTF8Encode(ASQLSettings)) as TlkJSONobject;
   inherited Create(AOwner, AParent, ARequired, FSettings.getString('label'));
   Custom := True;
end;

destructor TfrmReportFilterCustom.Destroy;
begin
   FSettings.Free;
   FSQLSettings.Free;
   inherited;
end;

initialization
   RegisterClass(TfrmReportFilterCustom);

finalization
   UnRegisterClass(TfrmReportFilterCustom);

end.
