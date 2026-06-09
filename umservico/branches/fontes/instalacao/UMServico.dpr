library UMServico;

{ Important note about DLL memory management: ShareMem must be the
  first unit in your library's USES clause AND your project's (select
  Project-View Source) USES clause if your DLL exports any procedures or
  functions that pass strings as parameters or function results. This
  applies to all strings passed to and from your DLL--even those that
  are nested in records and classes. ShareMem is the interface unit to
  the BORLNDMM.DLL shared memory manager, which must be deployed along
  with your DLL. To avoid using BORLNDMM.DLL, pass string information
  using PChar or ShortString parameters. }

uses
   SysUtils, Classes, WinSvc, Windows, Tlhelp32, ShellApi;

{$R *.res}

function IsInstalado: boolean; stdcall;
const
   MAQUINA = '';
   SERVICE_NAME = 'UMServico';
   MAX_SERVICOS = 4096;
type
   TSvcStatusA = array[0..MAX_SERVICOS] of TEnumServiceStatus;
   PSvcStatusA = ^TSvcStatusA;
var
	I: integer;
	LSCHandle: SC_HANDLE;
	LWBytesNecessarios, LWNumServicos, LWProxServico: DWORD;
	LSSA: PSvcStatusA;
begin
   Result := false;
   LSCHandle := OpenSCManager(PChar(MAQUINA), nil, SC_MANAGER_ALL_ACCESS);
   if LSCHandle > 0 then
   begin
      LWProxServico := 0;
      New(LSSA);
      EnumServicesStatus(LSCHandle, SERVICE_WIN32, SERVICE_STATE_ALL, LSSA^[0],
      SizeOf(LSSA^), LWBytesNecessarios, LWNumServicos, LWProxServico);
      for I := 0 to LWNumServicos - 1 do
         if StrPas(LSSA^[I].lpDisplayName) = SERVICE_NAME then
         begin
            Result := true;
            Break;
         end;
      Dispose(LSSA);
      CloseServiceHandle(LSCHandle);
   end;
end;

function IsExecutando: boolean; stdcall;
const
   PROCESS_NAME = 'UMServico.exe';
   PROCESS_TERMINATE = $0001;
var
   Continua: boolean;
   HndProcesso: THandle;
   ProcessEntry32: TProcessEntry32;
begin
   Result := False;
   HndProcesso := CreateToolhelp32Snapshot(TH32CS_SNAPPROCESS, 0);
   ProcessEntry32.dwSize := SizeOf(ProcessEntry32);
   Continua := Process32First(HndProcesso, ProcessEntry32);
   while Continua and (not Result) do
   begin
      Result := (ExtractFileName(ProcessEntry32.szExeFile) = PROCESS_NAME) or (ProcessEntry32.szExeFile = PROCESS_NAME);
      Continua := Process32Next(HndProcesso, ProcessEntry32);
   end;
   CloseHandle(HndProcesso);
end;

procedure StopService; stdcall;
const
   S_COMMAND = 'net stop umservico';
begin
   WinExec(PChar(S_COMMAND), SW_HIDE);
end;

exports
   IsInstalado, IsExecutando, StopService;

begin

end.
