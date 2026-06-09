program umCatracaDesktop;

{%File 'consts.inc'}

uses
  Forms,
  uCatracaDesktop in 'uCatracaDesktop.pas' {FCatracaDesktop},
  UDMCatracas in 'UDMCatracas.pas' {DMCatracas: TDataModule};

{$R *.res}

begin
  Application.Initialize;
  Application.CreateForm(TFCatracaDesktop, FCatracaDesktop);
  Application.CreateForm(TDMCatracas, DMCatracas);
  Application.Run;
end.
