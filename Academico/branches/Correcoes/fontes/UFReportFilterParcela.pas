unit UFReportFilterParcela;

interface

uses
   Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
   Dialogs, UFReportFilterComponent, StdCtrls, ExtCtrls, Spin, Buttons;

type
   TfrmReportFilterParcelas = class(TfrmReportFilterComponent)
      lblTo: TLabel;
      pnlFilter: TPanel;
      sbClear: TSpeedButton;
      speParcelaFrom: TSpinEdit;
      speParcelaTo: TSpinEdit;
      procedure sbClearClick(Sender: TObject);
      procedure speParcelaFromChange(Sender: TObject);
      procedure speParcelaToChange(Sender: TObject);
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

procedure TfrmReportFilterParcelas.Clear;
begin
   speParcelaFrom.Clear;
   speParcelaTo.Clear;
end;

function TfrmReportFilterParcelas.GetAsCrExpression: AnsiString;
const
   SFilterFmt = '%d to %d';
begin
   Result := '';

   if (speParcelaFrom.Text <> '') and (speParcelaTo.Text <> '') then
   begin
      Result := Format(SFilterFmt, [speParcelaFrom.Value, speParcelaTo.Value]);
   end;
end;

function TfrmReportFilterParcelas.GetAsCrExpressionByIndex(
  const Index: Integer): AnsiString;
begin
   Result := '';

   if Index = 1 then
   begin
      if speParcelaTo.Text <> '' then
      begin
         Result := Format('%d', [speParcelaTo.Value]);
      end;
   end;

   if Index <> 1 then
   begin
      Result := FirstItemAsCrExpression;
   end;
end;

function TfrmReportFilterParcelas.GetAsHumanExpression: AnsiString;
const
   SDescFmt = 'DE %d ATÉ %d';
begin
   Result := '';

   if (speParcelaFrom.Text <> '') and (speParcelaTo.Text <> '') then
      Result := Format(SDescFmt, [speParcelaFrom.Value, speParcelaTo.Value]);
end;

function TfrmReportFilterParcelas.GetAsSQLExpression: AnsiString;
const
   SFilterFmt = '%d AND %d';
begin
   Result := '';

   if (speParcelaFrom.Text <> '') and (speParcelaTo.Text <> '') then
   begin
      Result := Format(SFilterFmt, [speParcelaFrom.Value, speParcelaTo.Value]);
   end;
end;

function TfrmReportFilterParcelas.GetCrOperator: AnsiString;
begin
   Result := 'in';
end;

function TfrmReportFilterParcelas.GetFirstItemAsCrExpression: AnsiString;
begin
   Result := '';

   if speParcelaFrom.Text <> '' then
   begin
      Result := Format('%d', [speParcelaFrom.Value]);
   end;
end;

procedure TfrmReportFilterParcelas.sbClearClick(Sender: TObject);
begin
   Clear;
end;

procedure TfrmReportFilterParcelas.Setup;
begin
   Clear;
end;

procedure TfrmReportFilterParcelas.speParcelaFromChange(Sender: TObject);
begin
   if speParcelaTo.Text = '' then
      speParcelaTo.Value := speParcelaFrom.Value;
end;

procedure TfrmReportFilterParcelas.speParcelaToChange(Sender: TObject);
begin
   if speParcelaFrom.Text = '' then
      speParcelaFrom.Value := speParcelaTo.Value;
end;

function TfrmReportFilterParcelas.Validate: Boolean;
begin
   Result := (not Required) or
      ((speParcelaFrom.Text <> '') and (speParcelaTo.Text <> ''));
end;

initialization
   RegisterClass(TfrmReportFilterParcelas);

finalization
   UnRegisterClass(TfrmReportFilterParcelas);

end.
