unit UFReportWizardStepSelection;

interface

uses
   Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
   Dialogs, UFReportWizardStepBase, DB, DBClient, ImgList, ComCtrls, ToolWin,
   ExtCtrls, Grids, DBGrids, DBCtrls, StdCtrls, Mask, uLkJSON, ZDbcIntfs,
   UZDbcFuncs;

type
   TfrmReportWizardStepSelection = class(TfrmReportWizardStepBase)
      cdsFields: TClientDataSet;
      cdsFieldsFieldName: TStringField;
      cdsProperties: TClientDataSet;
      cdsPropertiesKind: TStringField;
      cdsPropertiesName: TStringField;
      cdsSelection: TClientDataSet;
      cdsSelectionDefault: TStringField;
      cdsSelectionField: TStringField;
      cdsSelectionFieldName: TStringField;
      cdsSelectionProperty: TStringField;
      cdsSelectionPropertyName: TStringField;
      dbgRecords: TDBGrid;
      dsSelection: TDataSource;
      procedure btnCancelClick(Sender: TObject);
      procedure btnDeleteClick(Sender: TObject);
      procedure btnSaveClick(Sender: TObject);
   private
      function CanMoveFoward: Boolean; override;
      function CanMoveBack: Boolean; override;
      function GetSettings: TlkJSONobject;
      procedure ForEachSelection(ElName: string; Elem: TlkJSONbase;
         data: pointer; var Continue: Boolean);
      procedure LoadCRFields;
      procedure Setup(const AState: TStepState); override;
   end;

implementation

{$R *.dfm}

procedure TfrmReportWizardStepSelection.btnCancelClick(Sender: TObject);
begin
   cdsSelection.Cancel;
end;

procedure TfrmReportWizardStepSelection.btnDeleteClick(Sender: TObject);
const
   SCaption = 'Confirmação';
   SMessage = 'Deseja realmente realizar a exclusão do filtro selecionado?';
var
   UserChoice: Integer;
begin
   UserChoice := MessageBox(Handle, SMessage, SCaption, MB_ICONQUESTION or
      MB_YESNO or MB_DEFBUTTON2);
   if UserChoice = ID_YES then
   begin
      cdsSelection.Delete;
   end;
end;

procedure TfrmReportWizardStepSelection.btnSaveClick(Sender: TObject);
begin
   cdsSelection.Post;
end;

function TfrmReportWizardStepSelection.CanMoveBack: Boolean;
begin
   Result := True;
end;

function TfrmReportWizardStepSelection.CanMoveFoward: Boolean;
begin
   Result := True;
end;

procedure TfrmReportWizardStepSelection.ForEachSelection(ElName: string;
  Elem: TlkJSONbase; data: pointer; var Continue: Boolean);
var
   Selection: TlkJSONobject;
begin
   Selection := Elem as TlkJSONobject;
   
   cdsSelection.Insert;
   cdsSelectionField.AsString := Selection.getString('field');

   if Selection.Field['property'] is TlkJSONstring then
   begin
      cdsSelectionProperty.AsString := Selection.getString('property');
   end;

   if Selection.Field['default'] is TlkJSONstring then
   begin
      cdsSelectionDefault.AsString := Selection.getString('default');
   end;

   cdsSelection.Post;
end;

function TfrmReportWizardStepSelection.GetSettings: TlkJSONobject;
const
   SSQLSelectSettings = 'SELECT ME_CONFIG FROM UNI_RELATORIO WHERE CD_RELATORIO = ?';
var
   Stmt: IZPreparedStatement;
   Rs: IZResultSet;
   JSON: AnsiString;
begin
   Stmt := PrepareStatement(SSQLSelectSettings);
   try
      Stmt.SetInt(1, ReportId);
      Rs := Stmt.ExecuteQueryPrepared;
      try
         if Rs.Next then
            JSON := UTF8Encode(Rs.GetStringByName('ME_CONFIG'));
      finally
         Rs.Close;
      end;
   finally
      Stmt.Close;
   end;

   Result := TlkJSON.ParseText(JSON) as TlkJSONobject;
end;

procedure TfrmReportWizardStepSelection.LoadCRFields;
var
   I: Integer;
begin
   cdsFields.DisableControls;
   for I := 0 to CRFields.Count - 1 do
   begin
      cdsFields.Insert;
      cdsFieldsFieldName.AsString := CRFields[I];
      cdsFields.Post;
   end;
   cdsFields.EnableControls;
end;

procedure TfrmReportWizardStepSelection.Setup(const AState: TStepState);
begin
   inherited;
   if not Initialized then
   begin
      cdsFields.CreateDataSet;
      cdsFields.Open;
      LoadCRFields;
      cdsSelection.CreateDataSet;
      cdsSelection.Open;
      Initialized := True;
   end;
end;

initialization
   RegisterClass(TfrmReportWizardStepSelection);

finalization
   UnRegisterClass(TfrmReportWizardStepSelection);

end.
