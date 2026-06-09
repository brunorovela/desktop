unit UFReportFormula;

interface

uses
   Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms, 
   Dialogs, ExtCtrls, StdCtrls, UStdCtrls, Buttons;

type
   TfrmReportFormula = class(TFrame)
      lblLabel: TLabel;
      mmValue: TMemo;
      pnlContent: TPanel;
      pnlLabel: TPanel;
      pnlValue: TPanel;
      sbClear: TSpeedButton;
      procedure sbClearClick(Sender: TObject);
   private
      FFormulaName: AnsiString;
      function GetFormulaLabel: AnsiString;
      function GetFormulaName: AnsiString;
      function GetFormulaValue: AnsiString;
      procedure SetFormulaLabel(const Value: AnsiString);
      procedure SetFormulaName(const Value: AnsiString);
      procedure SetFormulaValue(const Value: AnsiString);
   public
      procedure Clear;
      procedure ResizeLabel(const MaxWidth: Integer);
      property FormulaLabel: AnsiString read GetFormulaLabel write SetFormulaLabel;
      property FormulaName: AnsiString read GetFormulaName write SetFormulaName;
      property FormulaValue: AnsiString read GetFormulaValue write SetFormulaValue;
   end;

implementation

{$R *.dfm}

procedure TfrmReportFormula.Clear;
begin
   mmValue.Clear;
end;

function TfrmReportFormula.GetFormulaLabel: AnsiString;
begin
   Result := lblLabel.Caption;
end;

function TfrmReportFormula.GetFormulaName: AnsiString;
begin
   Result := FFormulaName;
end;

function TfrmReportFormula.GetFormulaValue: AnsiString;
begin
   Result := StringReplace(mmValue.Text, #13#10, '<br/>', [rfReplaceAll]);
end;

procedure TfrmReportFormula.ResizeLabel(const MaxWidth: Integer);
begin
   if pnlLabel.Width < MaxWidth then
   begin
      pnlLabel.Width := MaxWidth;
   end;
end;

procedure TfrmReportFormula.sbClearClick(Sender: TObject);
begin
   Clear;
end;

procedure TfrmReportFormula.SetFormulaLabel(const Value: AnsiString);
begin
   lblLabel.Caption := Value;
end;

procedure TfrmReportFormula.SetFormulaName(const Value: AnsiString);
begin
   FFormulaName := Value;
end;

procedure TfrmReportFormula.SetFormulaValue(const Value: AnsiString);
begin
   mmValue.Text := Value;
end;

end.
