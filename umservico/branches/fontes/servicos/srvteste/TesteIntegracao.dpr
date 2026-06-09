program TesteIntegracao;

{$APPTYPE CONSOLE}

uses
  SysUtils, uSvcIntegraTasy, uIServico in '..\uIServico.pas';

var
   ASvcIntegraTasy: TUMSvcIntegraTasy;
   AUMServicoAppRet: IUMServicoAppRet;

begin
   ASvcIntegraTasy := TUMSvcIntegraTasy.Create;
   ASvcIntegraTasy.onLoadServico;
   AUMServicoAppRet := ASvcIntegraTasy.processa;
end.
