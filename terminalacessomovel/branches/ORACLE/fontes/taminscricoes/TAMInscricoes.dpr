program TAMInscricoes;

uses
  Forms,
  Windows,
  ufBuscaEvento in 'ufBuscaEvento.pas' {fBuscaEvento},

  uClasses in 'uClasses.pas',
  ufTAMInscricoes in 'ufTAMInscricoes.pas' {fTAMInscricoes};

{$R *.res}

begin
  Application.Initialize;
  Application.CreateForm(TfTAMInscricoes, fTAMInscricoes);
  Application.Run;
end.
