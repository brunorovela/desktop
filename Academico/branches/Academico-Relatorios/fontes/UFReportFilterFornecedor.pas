unit UFReportFilterFornecedor;

interface

uses
   Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
   Dialogs, UFReportFilterPessoa, StdCtrls, UStdCtrls, Buttons, ExtCtrls;

type
   TfrmReportFilterFornecedor = class(TfrmReportFilterPessoa)
   private
      procedure Setup; override;
   end;

implementation

uses
   uFSelecionarPessoa;

{$R *.dfm}

{ TfrmReportFilterFornecedor }

procedure TfrmReportFilterFornecedor.Setup;
begin
   inherited;
   Tab := afpFornecedor;
end;

initialization
   RegisterClass(TfrmReportFilterFornecedor);

finalization
   UnRegisterClass(TfrmReportFilterFornecedor);

end.
