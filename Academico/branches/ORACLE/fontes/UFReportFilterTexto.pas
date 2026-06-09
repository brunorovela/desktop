unit UFReportFilterTexto;

interface

uses
   Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
   Dialogs, UFReportFilterComponent, StdCtrls, ExtCtrls, Buttons;

type
   TfrmReportFilterTexto = class(TfrmReportFilterComponent)
      edtText: TEdit;
      sbClear: TSpeedButton;
      pnlFilter: TPanel;
      procedure sbClearClick(Sender: TObject);
   private
      function GetAsCrExpression: AnsiString; override;
      function GetAsCrExpressionByIndex(const Index: Integer): AnsiString; override;
      function GetAsHumanExpression: AnsiString; override;
      function GetAsSQLExpression: AnsiString; override;
      function GetFirstItemAsCrExpression: AnsiString; override;
      function GetCrOperator: AnsiString; override;
      function Validate: Boolean; override;
      procedure Clear; override;
   end;

var
   frmReportFilterTexto: TfrmReportFilterTexto;

implementation

{$R *.dfm}

{ TfrmReportFilterTexto }

procedure TfrmReportFilterTexto.Clear;
begin
   edtText.Clear;
end;

function TfrmReportFilterTexto.GetAsCrExpression: AnsiString;
const
   SFilterFmt = '*%s*';
begin
   Result := '';

   if Trim(edtText.Text) <> '' then
   begin
      Result := Format(SFilterFmt, [edtText.Text]);
      Result := QuotedStr(Result);
   end;
end;

function TfrmReportFilterTexto.GetAsCrExpressionByIndex(
  const Index: Integer): AnsiString;
begin
   Result := AsCrExpression;
end;

function TfrmReportFilterTexto.GetAsHumanExpression: AnsiString;
begin
   Result := AsCrExpression;
end;

function TfrmReportFilterTexto.GetAsSQLExpression: AnsiString;
begin
   Result := AsCrExpression;
end;

function TfrmReportFilterTexto.GetCrOperator: AnsiString;
begin
   Result := 'like';
end;

function TfrmReportFilterTexto.GetFirstItemAsCrExpression: AnsiString;
begin
   Result := '';

   if Trim(edtText.Text) <> '' then
   begin
      Result := QuotedStr(edtText.Text);
   end;
end;

procedure TfrmReportFilterTexto.sbClearClick(Sender: TObject);
begin
   Clear;
end;

function TfrmReportFilterTexto.Validate: Boolean;
begin
   Result := (not Required) or (Trim(edtText.Text) <> '');
end;

initialization
   RegisterClass(TfrmReportFilterTexto);

finalization
   UnRegisterClass(TfrmReportFilterTexto);

end.
