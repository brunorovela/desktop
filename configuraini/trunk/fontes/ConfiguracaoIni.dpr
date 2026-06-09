program ConfiguracaoIni;

uses
  Forms,
  uConfiguraIni in 'uConfiguraIni.pas' {frmAtualiza};

{$R *.res}

begin
  Application.Initialize;
  Application.CreateForm(TfrmAtualiza, frmAtualiza);
  Application.Run;
end.
