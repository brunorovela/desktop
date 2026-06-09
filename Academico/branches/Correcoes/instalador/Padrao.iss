[Setup]
InternalCompressLevel=ultra
OutputDir=C:\Programacao\Desenvolvimento\unimestre\Academico\tags\testing
SourceDir=C:\Programacao\Desenvolvimento\unimestre\Academico\branches\Correcoes
OutputBaseFilename=AtualizaUnimestre-2.26.1.3
VersionInfoVersion=2.26.1.3
VersionInfoCompany=Uninformare Informática
VersionInfoDescription=ACADÊMICO
VersionInfoTextVersion=ACADÊMICO 2.26.1.3
Compression=lzma/ultra
AppName=ACADÊMICO
AppVerName=2.26.1.3
InfoBeforeFile=C:\Programacao\Desenvolvimento\unimestre\Academico\branches\Correcoes\instalador\Leiame.txt
DirExistsWarning=no
ShowLanguageDialog=no
LanguageDetectionMethod=locale
WizardImageFile=C:\Programacao\Desenvolvimento\sistemas\Imagens\wizard-UM-big.bmp
WizardSmallImageFile=C:\Programacao\Desenvolvimento\sistemas\Imagens\wizard-UM-small.bmp
SetupIconFile=C:\Programacao\Desenvolvimento\sistemas\Imagens\instalador.ico
Uninstallable=false
AppID={{E3A8D72D-1E45-4B94-AA4C-37A46786351E}
DefaultDirName={reg:HKLM\Software\Uninformare\UNIMESTRE,UniMestreDir|{sd}\UNIMESTRE}
DisableProgramGroupPage=true
DefaultGroupName=UNIMESTRE

[Languages]
Name: Portugues; MessagesFile: compiler:Languages\BrazilianPortuguese.isl

[Tasks]
Name: desktopicon; Description: {cm:CreateDesktopIcon}; GroupDescription: {cm:AdditionalIcons}; Flags: unchecked

[Files]
Source: exe\UniMestre.exe; DestDir: {app}\programas; Flags: overwritereadonly ignoreversion; DestName: UniMestre.exe
Source: exe\*.dll; DestDir: {app}\programas\; Flags: sharedfile uninsneveruninstall overwritereadonly replacesameversion
Source: exe\u2lbcp.dll; DestDir: {sys}; Flags: sharedfile uninsneveruninstall overwritereadonly replacesameversion
Source: exe\installdll.bat; DestDir: {app}\programas\; Flags: deleteafterinstall overwritereadonly ignoreversion

[Run]
Filename: {app}\programas\installdll.bat; WorkingDir: {app}\programas\; Flags: runhidden; Languages: 

[Registry]
Root: HKLM; Subkey: SOFTWARE\Uninformare\UNIMESTRE; ValueType: string; ValueName: UniMestreDir; ValueData: {app}\
Root: HKLM; Subkey: SOFTWARE\Business Objects\Suite 11.0\Export\PDF; ValueType: dword; ValueName: ForceLargerFonts; ValueData: 00000001
Root: HKCU; Subkey: Software\Business Objects\Suite 11.0\Crystal Reports\Export\PDF; ValueType: dword; ValueName: ForceLargerFonts; ValueData: 00000001; Tasks: ; Languages: 

[Icons]
Name: {group}\Unimestre; Filename: {app}\programas\Unimestre.exe; WorkingDir: {app}\programas\; IconFilename: {app}\programas\Unimestre.exe; IconIndex: 0; Flags: createonlyiffileexists
Name: {commondesktop}\Unimestre; Filename: {app}\programas\Unimestre.exe; Tasks: desktopicon

[_ISToolPreCompile]
Name: C:\Programacao\Tecnologia\Internos\UniControle\trunk\exe\Tools; Parameters: --force C:\Programacao\Desenvolvimento\unimestre\Academico\trunk\exe\Unimestre.exe


[_ISToolPostCompile]


[Code]
function InitializeSetup: boolean;
begin
	Result := RegKeyExists(HKEY_LOCAL_MACHINE, 'SOFTWARE\Business Objects\Suite 11.0\Crystal Reports');
	if not Result then
	begin
		MsgBox('As bibliotecas do Crystal Reports XI não foram encontradas. A instalação será abortada.', mbInformation, MB_OK);
	end;
end;

procedure CurPageChanged(CurPageID: Integer);
var
  pular_linhas: String;
  porta: String;
  forcar_fechamento: String;
  relatorios: string;
  alterar: Boolean;
begin

  alterar := False;

  if (CurPageID = wpInstalling) then
  begin

    if FileExists(ExpandConstant('{syswow64}') + '\wmestre.ini') then
    begin
      pular_linhas  := getIniString('ImpressoraDOS', 'PularLinhas', '0', ExpandConstant('{syswow64}') + '\wmestre.ini');
      porta         := getIniString('ImpressoraDOS', 'Porta', '0', ExpandConstant('{syswow64}') + '\wmestre.ini');
      forcar_fechamento := getIniString('Digitalizacao', 'ForcarFechamento', 'N', ExpandConstant('{syswow64}') + '\wmestre.ini');

      relatorios := getIniString(
        'Configuracoes',
        'Relatorios',
        getIniString('Configuracoes', 'Relatorios', '', ExpandConstant('{app}') + '\programas\unimestre.ini'),
        ExpandConstant('{syswow64}') + '\wmestre.ini'
      );

      alterar       := true;
    end
    else if FileExists(ExpandConstant('{sys}') + '\wmestre.ini') then
    begin
      pular_linhas  := getIniString('ImpressoraDOS', 'PularLinhas', '0', ExpandConstant('{syswow64}') + '\wmestre.ini');
      porta         := getIniString('ImpressoraDOS', 'Porta', '0', ExpandConstant('{syswow64}') + '\wmestre.ini');
      forcar_fechamento := getIniString('Digitalizacao', 'ForcarFechamento', 'N', ExpandConstant('{sys}') + '\wmestre.ini');

      relatorios := getIniString(
        'Configuracoes',
        'Relatorios',
        getIniString('Configuracoes', 'Relatorios', '', ExpandConstant('{app}') + '\programas\unimestre.ini'),
        ExpandConstant('{sys}') + '\wmestre.ini'
      );

      alterar       := true;
    end
    else if FileExists(ExpandConstant('{win}') + '\wmestre.ini') then
    begin
      pular_linhas      := getIniString('ImpressoraDOS', 'PularLinhas', '0', ExpandConstant('{win}') + '\wmestre.ini');
      porta             := getIniString('ImpressoraDOS', 'Porta', '0', ExpandConstant('{win}') + '\wmestre.ini');
      forcar_fechamento := getIniString('Digitalizacao', 'ForcarFechamento', 'N', ExpandConstant('{win}') + '\wmestre.ini');

      relatorios := getIniString(
        'Configuracoes',
        'Relatorios',
        getIniString('Configuracoes', 'Relatorios', '', ExpandConstant('{app}') + '\programas\unimestre.ini'),
        ExpandConstant('{win}') + '\wmestre.ini'
      );

      alterar           := true;
    end

    if alterar then
    begin
      setIniString('ImpressoraDOS', 'PularLinhas', pular_linhas, ExpandConstant('{app}') + '\programas\unimestre.ini');
      setIniString('ImpressoraDOS', 'Porta', porta, ExpandConstant('{app}') + '\programas\unimestre.ini');
      setIniString('Configuracoes', 'Relatorios', relatorios, ExpandConstant('{app}') + '\programas\unimestre.ini');
      setIniString('Digitalizacao', 'ForcarFechamento', forcar_fechamento, ExpandConstant('{app}') + '\programas\unimestre.ini');
    end;
  end;
end;
