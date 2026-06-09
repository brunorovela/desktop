unit UFReportFilterEtapa;

interface

uses
   Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
   Dialogs, UFReportFilterComponent, StdCtrls, ExtCtrls, Spin, Buttons;

type
   TfrmReportFilterEtapa = class(TfrmReportFilterComponent)
      pnlFilter: TPanel;
      sbClear: TSpeedButton;
      spePeriodo: TSpinEdit;
      procedure sbClearClick(Sender: TObject);
   private
      function GetAsCrExpression: AnsiString; override;
      function GetAsCrExpressionByIndex(const Index: Integer): AnsiString; override;
      function GetAsHumanExpression: AnsiString; override;
      function GetAsSQLExpression: AnsiString; override;
      function GetFirstItemAsCrExpression: AnsiString; override;
      function Validate: Boolean; override;
      procedure Clear; override;
   end;

implementation

{$R *.dfm}

{ TfrmReportFilterPeriodo }

procedure TfrmReportFilterEtapa.Clear;
begin
   spePeriodo.Clear;
end;

function TfrmReportFilterEtapa.GetAsCrExpression: AnsiString;
const
   SFilterFmt = '%d';
begin
   Result := '';

   if spePeriodo.Text <> '' then
   begin
      Result := Format(SFilterFmt, [spePeriodo.Value]);
   end;
end;

function TfrmReportFilterEtapa.GetAsCrExpressionByIndex(
  const Index: Integer): AnsiString;
begin
   Result := AsCrExpression;
end;

function TfrmReportFilterEtapa.GetAsHumanExpression: AnsiString;
begin
   Result := GetAsCrExpression;
end;

function TfrmReportFilterEtapa.GetAsSQLExpression: AnsiString;
begin
   Result := GetAsCrExpression;
end;

function TfrmReportFilterEtapa.GetFirstItemAsCrExpression: AnsiString;
begin
   Result := AsCrExpression;
end;

procedure TfrmReportFilterEtapa.sbClearClick(Sender: TObject);
begin
   Clear;
end;

function TfrmReportFilterEtapa.Validate: Boolean;
begin
   Result := (not Required) or (Trim(spePeriodo.Text) <> '');
end;

initialization
   RegisterClass(TfrmReportFilterEtapa);

finalization
   UnRegisterClass(TfrmReportFilterEtapa);

end.
