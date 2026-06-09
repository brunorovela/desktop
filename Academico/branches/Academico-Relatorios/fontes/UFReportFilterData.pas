unit UFReportFilterData;

interface

uses
   Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
   Dialogs, UFReportFilterComponent, StdCtrls, ExtCtrls, Mask, UDateTimePicker,
   Buttons;

type
   TfrmReportFilterData = class(TfrmReportFilterComponent)
      dtpData: TDatePickerEx;
      pnlFilter: TPanel;
      sbClear: TSpeedButton;
      procedure sbClearClick(Sender: TObject);
   private
      function GetAsCrExpression: AnsiString; override;
      function GetAsCrExpressionByIndex(const Index: Integer): AnsiString; override;
      function GetAsHumanExpression: AnsiString; override;
      function GetAsSQLExpression: AnsiString; override;
      function GetCrOperator: AnsiString; override;
      function GetFirstItemAsCrExpression: AnsiString; override;
      function Validate: Boolean; override;
      procedure Clear; override;
      procedure Setup; override;
   end;

implementation

{$R *.dfm}

{ TfrmReportFilterData }

procedure TfrmReportFilterData.Clear;
begin
   dtpData.Clear;
end;

function TfrmReportFilterData.GetAsCrExpression: AnsiString;
begin
   Result := '';

   if not dtpData.Empty then
   begin
      Result := FormatDateTime('Date(yyyy, m, d)', dtpData.SelectedDate);
   end;
end;

function TfrmReportFilterData.GetAsCrExpressionByIndex(
  const Index: Integer): AnsiString;
begin
   Result := AsCrExpression;
end;

function TfrmReportFilterData.GetAsHumanExpression: AnsiString;
begin
   Result := '';

   if not dtpData.Empty then
   begin
      Result := FormatDateTime('dd/mm/yyyy', dtpData.SelectedDate);
   end;
end;

function TfrmReportFilterData.GetAsSQLExpression: AnsiString;
begin
   Result := '';

   if not dtpData.Empty then
   begin
      Result := FormatDateTime('yyyy-mm-dd', dtpData.SelectedDate);
   end;
end;

function TfrmReportFilterData.GetCrOperator: AnsiString;
begin
   Result := '=';
end;

function TfrmReportFilterData.GetFirstItemAsCrExpression: AnsiString;
begin
   Result := AsCrExpression;
end;

procedure TfrmReportFilterData.sbClearClick(Sender: TObject);
begin
   Clear;
end;

procedure TfrmReportFilterData.Setup;
begin
   Clear;
end;

function TfrmReportFilterData.Validate: Boolean;
begin
   Result := (not Required) or (not dtpData.Empty);
end;

initialization
   RegisterClass(TfrmReportFilterData);

finalization
   UnRegisterClass(TfrmReportFilterData);

end.
