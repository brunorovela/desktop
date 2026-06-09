program umGuardianCatracas;

uses
  Forms,
  uPrincipal in 'uPrincipal.pas' {frmPrincipal};

{$R *.res}

begin
  Application.Initialize;
  Application.CreateForm(TfrmPrincipal, frmPrincipal);
  Application.Title := 'Monitor serviço catracas';
  Application.Run;
end.
