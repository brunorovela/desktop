unit UFReportWizardFile;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms, 
  Dialogs, StdCtrls, Buttons;

type
  TfrmReportWizardFile = class(TFrame)
    lblArquivo: TLabel;
    edtArquivo: TEdit;
    sbArquivo: TSpeedButton;
    odlgArquivo: TOpenDialog;
    procedure sbArquivoClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

implementation

{$R *.dfm}

procedure TfrmReportWizardFile.sbArquivoClick(Sender: TObject);
begin
   if odlgArquivo.Execute then
   begin
      edtArquivo.Text := odlgArquivo.FileName;
   end;
end;

end.
