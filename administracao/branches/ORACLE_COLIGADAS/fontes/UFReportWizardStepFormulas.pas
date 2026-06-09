unit UFReportWizardStepFormulas;

interface

uses
   Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
   Dialogs, UFReportWizardStepBase, DB, DBClient, Grids, DBGrids, uLkJSON;

type
  TfrmReportWizardStepFormulas = class(TfrmReportWizardStepBase)
    dsFormulas: TDataSource;
    cdsFormulas: TClientDataSet;
    cdsFormulasName: TStringField;
    cdsFormulasProperty: TStringField;
    cdsProperties: TClientDataSet;
    cdsPropertiesName: TStringField;
    cdsPropertiesKind: TStringField;
    cdsFormulasPropertyName: TStringField;
    dbgFormulas: TDBGrid;
    cdsNamesFormulas: TClientDataSet;
    cdsNamesFormulasName: TStringField;
    cdsFormulasFormulaName: TStringField;
  private
    { Private declarations }
      
  public
    { Public declarations }
  end;

implementation

{$R *.dfm}

end.
