program UMPerfil;

uses
  Forms,
  XPMan,
  UFMain in 'UFMain.pas' {fMain},
  UUtils in 'UUtils.pas',
  md5 in 'md5.pas';

{$R *.res}
{$R RESOURCES.RES}

begin
   Application.Initialize;
   Application.Title := 'Gerenciador de perfis de conexão do Unimestre';
   Application.CreateForm(TfMain, fMain);
   Application.Run;
end.
