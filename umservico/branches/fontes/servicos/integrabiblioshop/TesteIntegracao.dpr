program TesteIntegracao;

{$APPTYPE CONSOLE}

uses
  SysUtils, uSvcIntegraBiblioshop, uIServico in '..\uIServico.pas';

var
   ASvcIntegraBiblioshop: TUMSvcIntegraBiblioshop;
   AUMServicoAppRet: IUMServicoAppRet;

begin
   ASvcIntegraBiblioshop := TUMSvcIntegraBiblioshop.Create;
   ASvcIntegraBiblioshop.onLoadServico;
   AUMServicoAppRet := ASvcIntegraBiblioshop.processa;
end.
