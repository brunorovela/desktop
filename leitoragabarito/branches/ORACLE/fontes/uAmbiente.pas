unit uAmbiente;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes;


  {*
    Função:
      setBloqueio(bStatus: Boolean): Integer;

    Bloqueia as Teclas CTRL + ALT + DEL, CTRL + ESC entre outras e também
    esconde a barra de tarefas

    Parametros:
      bSatus: Boolean = Estado do Bloqueio (Ligado / Desligado)
  *}
  function setBloqueio(bStatus: Boolean): Integer;
  function setBloqTeclas(bStatus: Boolean): Integer;
  function setBloqTaskBar(bStatus: Boolean): Integer;
  function getTeclaEstado(iTecla: Integer): Boolean;


implementation

function setBloqueio(bStatus: Boolean): Integer;
begin
  setBloqTeclas(bStatus);
  setBloqTaskBar(bStatus);
end;




function setBloqTeclas(bStatus: Boolean): Integer;
var
  iOldValue: Longint;
begin
  Result := SystemParametersInfo(97, Word(bStatus), @iOldValue, 0);
end;


function setBloqTaskBar(bStatus: Boolean): Integer;
var
  iValue: Integer;
begin
  if bStatus then
    iValue := SW_HIDE
  else
    iValue := SW_SHOWNA;

  Result := ShowWindow(FindWindow('Shell_TrayWnd',nil), iValue) ;
end;

function getTeclaEstado(iTecla: Integer): Boolean;
begin
  Result := Odd (GetKeyState (Key));
end;



end.
