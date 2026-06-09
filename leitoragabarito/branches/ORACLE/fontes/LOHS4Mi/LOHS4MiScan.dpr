program LOHS4MiScan;

{$APPTYPE CONSOLE}

uses
  SysUtils,
  uLOHS4MiScan in 'uLOHS4MiScan.pas';

begin
   with TUMLOHSScan.Create do
   begin
      try
         Conecta;
         LeFormulario;
      finally
         Desconecta;
         Salva;
         Free;
      end;
   end;
end.

