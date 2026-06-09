unit UStartup;

interface

uses
   Windows, Registry;

type
   IsWow64ProcessFunc = function(Handle: THandle; var Iret: BOOL): Windows.BOOL; stdcall;

function IsWow64Process: Boolean;
procedure FixCRBarcodePDFExport;

implementation

function IsWow64Process: Boolean;
var
   Handle: IsWow64ProcessFunc;
   Iret: Windows.BOOL;
begin
   Result := False;

   Handle := GetProcAddress(GetModuleHandle('kernel32.dll'), 'IsWow64Process');

   if Assigned(Handle) then
   begin
      if Handle(GetCurrentProcess, Iret) then
         Result := Iret;
   end;
end;

procedure FixCRBarcodePDFExport;
const
   SForceLargerFonts = 'ForceLargerFonts';
   SRegKeyWin32 = 'Software\Business Objects\Suite 11.0\Crystal Reports\Export\PDF\';
   SRelease2KeyWin32 = 'Software\Business Objects\Suite 11.5\Crystal Reports\Export\PDF\';
   SRegKeyWin64 = 'Software\Wow6432Node\Business Objects\Suite 11.0\Crystal Reports\Export\PDF\';
   SRelease2KeyWin64 = 'Software\Wow6432Node\Business Objects\Suite 11.5\Crystal Reports\Export\PDF\';
var
   Reg: TRegistry;
begin
   Reg := TRegistry.Create;
   try
      Reg.RootKey := HKEY_CURRENT_USER;

      if Reg.OpenKey(SRegKeyWin32, True) then
      begin
         Reg.WriteInteger(SForceLargerFonts, 1);
         Reg.CloseKey;
      end;

      if Reg.OpenKey(SRelease2KeyWin32, True) then
      begin
         Reg.WriteInteger(SForceLargerFonts, 1);
         Reg.CloseKey;
      end;

      Reg.RootKey := HKEY_LOCAL_MACHINE;
      
      if Reg.OpenKey(SRegKeyWin32, True) then
      begin
         Reg.WriteInteger(SForceLargerFonts, 1);
         Reg.CloseKey;
      end;

      if Reg.OpenKey(SRelease2KeyWin32, True) then
      begin
         Reg.WriteInteger(SForceLargerFonts, 1);
         Reg.CloseKey;
      end;

      if IsWow64Process then
      begin
         Reg.RootKey := HKEY_CURRENT_USER;

         if Reg.OpenKey(SRegKeyWin64, True) then
         begin
            Reg.WriteInteger(SForceLargerFonts, 1);
            Reg.CloseKey;
         end;

         if Reg.OpenKey(SRelease2KeyWin64, True) then
         begin
            Reg.WriteInteger(SForceLargerFonts, 1);
            Reg.CloseKey;
         end;

         Reg.RootKey := HKEY_LOCAL_MACHINE;
      
         if Reg.OpenKey(SRegKeyWin64, True) then
         begin
            Reg.WriteInteger(SForceLargerFonts, 1);
            Reg.CloseKey;
         end;

         if Reg.OpenKey(SRelease2KeyWin64, True) then
         begin
            Reg.WriteInteger(SForceLargerFonts, 1);
            Reg.CloseKey;
         end;
      end;
      
   finally
      Reg.Free;
      Reg := nil;
   end;
end;

initialization
   FixCRBarcodePDFExport;

end.
