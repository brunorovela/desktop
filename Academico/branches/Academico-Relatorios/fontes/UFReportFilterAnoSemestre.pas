unit UFReportFilterAnoSemestre;

interface

uses
   Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
   Dialogs, UFReportFilterComponent, StdCtrls, ExtCtrls, ComCtrls, Mask;

type
   TfrmReportFilterAnoSemestre = class(TfrmReportFilterComponent)
      meAnoSemestre: TMaskEdit;
      pnlFilter: TPanel;
      udAnoSemestre: TUpDown;
      procedure udAnoSemestreClick(Sender: TObject; Button: TUDBtnType);
   private
      function GetAsCrExpression: AnsiString; override;
      function GetAsCrExpressionByIndex(const Index: Integer): AnsiString; override;
      function GetAsHumanExpression: AnsiString; override;
      function GetAsSQLExpression: AnsiString; override;
      function GetCrOperator: AnsiString; override;
      function GetFirstItemAsCrExpression: AnsiString; override;
      function GetValue: Integer;
      function Validate: Boolean; override;
      procedure Clear; override;
      procedure Setup; override;
      procedure SetValue(const Value: Integer);
   public
      property Value: Integer read GetValue write SetValue;
   end;

implementation

uses
   Main, uDM;

const
   SIntToStrFmt = '%d';

{$R *.dfm}

procedure TfrmReportFilterAnoSemestre.Clear;
begin
   meAnoSemestre.Text := Format(SIntToStrFmt, [DM.GetAnoSemestreAtual]);
end;

function TfrmReportFilterAnoSemestre.GetAsCrExpression: AnsiString;
begin
   Result := meAnoSemestre.Text;
end;

function TfrmReportFilterAnoSemestre.GetAsCrExpressionByIndex(
  const Index: Integer): AnsiString;
begin
   Result := AsCrExpression;
end;

function TfrmReportFilterAnoSemestre.GetAsHumanExpression: AnsiString;
begin
   Result := '';

   if meAnoSemestre.Text <> '' then
   begin
      Result := AnsiQuotedStr(meAnoSemestre.EditText, #34);
   end;
end;

function TfrmReportFilterAnoSemestre.GetAsSQLExpression: AnsiString;
begin
   Result := meAnoSemestre.Text;
end;

function TfrmReportFilterAnoSemestre.GetCrOperator: AnsiString;
begin
   Result := '=';
end;

function TfrmReportFilterAnoSemestre.GetFirstItemAsCrExpression: AnsiString;
begin
   Result := AsCrExpression;
end;

function TfrmReportFilterAnoSemestre.GetValue: Integer;
begin
   Result := StrToIntDef(meAnoSemestre.Text, DM.GetAnoSemestreAtual);
end;

procedure TfrmReportFilterAnoSemestre.Setup;
begin
   inherited;
   meAnoSemestre.Text := Format(SIntToStrFmt, [DM.GetAnoSemestreAtual]);
end;

procedure TfrmReportFilterAnoSemestre.SetValue(const Value: Integer);
begin
   meAnoSemestre.Text := Format(SIntToStrFmt, [Value]);
end;

procedure TfrmReportFilterAnoSemestre.udAnoSemestreClick(Sender: TObject;
  Button: TUDBtnType);
var
   I, Remainder: Integer;
begin
   I := StrToIntDef(meAnoSemestre.Text, DM.GetAnoSemestreAtual);

   if Button = btNext then
   begin
      if ano_semestre_incremento = 1 then
      begin
         Remainder := I mod 2;
         if Remainder = 0 then Inc(I, 9);
         if Remainder <> 0 then Inc(I);
      end;

      if ano_semestre_incremento <> 1 then Inc(I, 10);
   end;

   if Button = btPrev then
   begin
      if ano_semestre_incremento = 1 then
      begin
         Remainder := I mod 2;
         if Remainder = 0 then Dec(I);
         if Remainder <> 0 then Dec(I, 9);
      end;

      if ano_semestre_incremento <> 1 then Dec(I, 10);
   end;

   meAnoSemestre.Text := Format(SIntToStrFmt, [I]);
end;

function TfrmReportFilterAnoSemestre.Validate: Boolean;
begin
   Result := (not Required) or (meAnoSemestre.Text <> '');
end;

initialization
   RegisterClass(TfrmReportFilterAnoSemestre);

finalization
   UnRegisterClass(TfrmReportFilterAnoSemestre);

end.
