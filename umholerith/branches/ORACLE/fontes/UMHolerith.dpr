program UMHolerith;

uses
  Forms,
  ufUMHolerith in 'ufUMHolerith.pas' {fHolerith},
  uUHolerithExportacao in 'uUHolerithExportacao.pas',
  uDM in 'uDM.pas' {DM: TDataModule},
  uFSplash in '..\..\..\..\..\sistemas\UMNucleo\fontes\uFSplash.pas' {fSplash},
  uLoginManager in '..\..\..\..\..\sistemas\UMNucleo\fontes\uLoginManager.pas',
  uUHolerithExportacaoIdentificadores in 'uUHolerithExportacaoIdentificadores.pas';

{$R *.res}

begin
   Application.Initialize;
   Application.Title := 'UMHolerith';            
   Application.CreateForm(TDM, DM);
  if DM.db.Connected then
   begin
      TLoginManager.GetInstancia(DM);
      Application.CreateForm(TfHolerith, fHolerith);
   end;

   Application.Run;
end.
