program umcatracas;

// Descomentar linha abaixo para debugar a classe TService "TSvcUnimestreCatracas"
// {$DEFINE DEBUG}                               

{%File 'consts.inc'}

{$ifdef DEBUG}
  {$APPTYPE CONSOLE}
{$endif}

uses
  SvcMgr,
  SysUtils,
  UService in 'UService.pas' {SvcUnimestreCatracas: TService},
  UDMCatracas in 'UDMCatracas.pas' {DMCatracas: TDataModule};

{$R *.RES}

var
  xStarted: Boolean;

begin

  {$IFDEF DEBUG}
  try
    WriteLn('SvcUnimestreCatracas DEBUG mode. Pressione [ENTER] para sair.');

    SvcUnimestreCatracas := TSvcUnimestreCatracas.Create(nil);
    SvcUnimestreCatracas.ServiceStart(SvcUnimestreCatracas, xStarted);

    ReadLn;
    FreeAndNil(SvcUnimestreCatracas);
  except
    on E: Exception do
    begin
      Writeln(E.ClassName, ': ', E.Message);
      WriteLn('SvcUnimestreCatracas DEBUG mode. Pressione [ENTER] para sair.');
      ReadLn;
    end;
  end;
  {$ELSE}
      if not Application.DelayInitialize or Application.Installing then
         Application.Initialize;

      Application.CreateForm(TSvcUnimestreCatracas, SvcUnimestreCatracas);
      Application.Run;
  {$ENDIF}
end.
