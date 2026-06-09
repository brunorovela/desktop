unit UFReportFilterDataRange;

interface

uses
   Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
   Dialogs, UFReportFilterComponent, StdCtrls, ExtCtrls, Mask, UDateTimePicker,
   Buttons;

type
   TfrmReportFilterDataRange = class(TfrmReportFilterComponent)
      dtpFrom: TDatePickerEx;
      dtpTo: TDatePickerEx;
      lblTo: TLabel;
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

procedure TfrmReportFilterDataRange.Clear;
begin
   dtpFrom.Clear;
   dtpTo.Clear;
end;

function TfrmReportFilterDataRange.GetAsCrExpression: AnsiString;
const
   SFilterFmt = '%s to %s';
   SDateFuncFmt = 'Date(%s)';
var
   S1, S2: AnsiString;
begin
   Result := '';

   if (not dtpFrom.Empty) and (not dtpTo.Empty) then
   begin
      S1 := FormatDateTime('yyyy, m, d', dtpFrom.SelectedDate);
      S1 := Format(SDateFuncFmt, [S1]);
      
      S2 := FormatDateTime('yyyy, m, d', dtpTo.SelectedDate);
      S2 := Format(SDateFuncFmt, [S2]);
      
      Result := Format(SFilterFmt, [S1, S2]);
   end;
end;

function TfrmReportFilterDataRange.GetAsCrExpressionByIndex(
  const Index: Integer): AnsiString;
begin
   Result := '';
   
   if Index = 1 then
   begin
      if not dtpTo.Empty then
      begin
         Result := FormatDateTime('yyyy, m, d', dtpTo.SelectedDate);
         Result := Format('Date(%s)', [Result]);
      end;
   end;

   if Index <> 1 then
   begin
      Result := FirstItemAsCrExpression;
   end;
end;

function TfrmReportFilterDataRange.GetAsHumanExpression: AnsiString;
const
   SDescFmt = '"DE %s ATÉ %s"';
var
   S1, S2: AnsiString;
begin
   Result := '';

   if (not dtpFrom.Empty) and (not dtpTo.Empty) then
   begin
      S1 := FormatDateTime('dd/mm/yyyy', dtpFrom.SelectedDate);
      S2 := FormatDateTime('dd/mm/yyyy', dtpTo.SelectedDate);
      Result := Format(SDescFmt, [S1, S2]);
   end;
end;

function TfrmReportFilterDataRange.GetAsSQLExpression: AnsiString;
const
   SFilterFmt = '''%s'' AND ''%s''';
var
   S1, S2: AnsiString;
begin
   Result := '';

   if (not dtpFrom.Empty) and (not dtpTo.Empty) then
   begin
      S1 := FormatDateTime('yyyy-mm-dd', dtpFrom.SelectedDate);
      S2 := FormatDateTime('yyyy-mm-dd', dtpTo.SelectedDate);
      Result := Format(SFilterFmt, [S1, S2]);
   end;
end;

function TfrmReportFilterDataRange.GetCrOperator: AnsiString;
begin
   Result := 'in';
end;

function TfrmReportFilterDataRange.GetFirstItemAsCrExpression: AnsiString;
begin
   Result := '';

   if not dtpFrom.Empty then
   begin
      Result := FormatDateTime('yyyy, m, d', dtpFrom.SelectedDate);
      Result := Format('Date(%s)', [Result]);
   end;
end;

procedure TfrmReportFilterDataRange.sbClearClick(Sender: TObject);
begin
   Clear;
end;

procedure TfrmReportFilterDataRange.Setup;
begin
   Clear;
end;

function TfrmReportFilterDataRange.Validate: Boolean;
begin
   Result := (not Required) or ((not dtpFrom.Empty) and (not dtpTo.Empty));
end;

initialization
   RegisterClass(TfrmReportFilterDataRange);

finalization
   UnRegisterClass(TfrmReportFilterDataRange);

end.
