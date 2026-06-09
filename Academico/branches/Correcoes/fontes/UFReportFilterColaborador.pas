unit UFReportFilterColaborador;

interface

uses
   Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
   Dialogs, StdCtrls, UStdCtrls, Buttons, ExtCtrls, UFReportFilterPessoa;

type
   TfrmReportFilterColaborador = class(TfrmReportFilterPessoa)
   private
      procedure Setup; override;
   end;

implementation

uses
   uFSelecionarPessoa;

{$R *.dfm}

{ TfrmReportFilterColaborador }

procedure TfrmReportFilterColaborador.Setup;
begin
   inherited;
   Tab := afpFuncionario;
end;

initialization
   RegisterClass(TfrmReportFilterColaborador);

finalization
   UnRegisterClass(TfrmReportFilterColaborador);

end.
