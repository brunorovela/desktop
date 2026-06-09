unit UFReportFilterOrientador;

interface

uses
   Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
   Dialogs, UFReportFilterPessoa, StdCtrls, UStdCtrls, Buttons, ExtCtrls;

type
   TfrmReportFilterOrientador = class(TfrmReportFilterPessoa)
   private
      procedure Setup; override;
   end;

implementation

uses
   uFSelecionarPessoa;

{$R *.dfm}

{ TfrmReportFilterOrientador }

procedure TfrmReportFilterOrientador.Setup;
begin
   inherited;
   Tab := afpOrientador;
end;

initialization
   RegisterClass(TfrmReportFilterOrientador);

finalization
   UnRegisterClass(TfrmReportFilterOrientador);

end.
