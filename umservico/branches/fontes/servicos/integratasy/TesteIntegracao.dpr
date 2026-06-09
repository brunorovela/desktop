program TesteIntegracao;

{$APPTYPE CONSOLE}

uses
  SysUtils, uSvcIntegraTasy, uIServico in '..\uIServico.pas';

var
   ASvcIntegraTasy: TUMSvcIntegraTasy;

begin
   ASvcIntegraTasy := TUMSvcIntegraTasy.Create;
   ASvcIntegraTasy.onLoadServico;
   ASvcIntegraTasy.processa;
end.
