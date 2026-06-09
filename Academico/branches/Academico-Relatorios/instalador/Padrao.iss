[Setup]
InternalCompressLevel=ultra
OutputDir=[$UniControle.Projeto$][$Modulo.ds_pasta$]\tags\testing
SourceDir=[$Modulo.SVNTempDir$]
OutputBaseFilename=Atualiza[$Modulo.ds_nome_atualiza$]-[$Versao.ds_versao$]
VersionInfoVersion=[$Versao.ds_versao$]
VersionInfoCompany=Uninformare Informática
VersionInfoDescription=[$Modulo.descricao$]
VersionInfoTextVersion=[$Modulo.descricao$] [$Versao.ds_versao$]
Compression=lzma/ultra
AppName=[$Modulo.descricao$]
AppVerName=[$Versao.ds_versao$]
InfoBeforeFile=[$UniControle.PastaLeiame$][$Modulo.cod$]-[$Modulo.nome$].txt
DirExistsWarning=no
ShowLanguageDialog=no
LanguageDetectionMethod=locale
WizardImageFile=[$UniControle.DirImagem$]wizard-UM-big.bmp
WizardSmallImageFile=[$UniControle.DirImagem$]wizard-UM-small.bmp
SetupIconFile=[$UniControle.DirImagem$]instalador.ico
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
Source: exe\[$Modulo.ds_executavel$].exe; DestDir: {app}\programas; Flags: overwritereadonly ignoreversion; DestName: [$Modulo.ds_executavel$].exe
Source: exe\*.dll; DestDir: {app}\programas\; Flags: sharedfile uninsneveruninstall overwritereadonly replacesameversion
Source: exe\u2lbcp.dll; DestDir: {sys}; Flags: sharedfile uninsneveruninstall overwritereadonly replacesameversion
Source: [$UniControle.PastaUNM$][$Modulo.cod$]-[$Modulo.nome$].unm; DestDir: {tmp}; Flags: deleteafterinstall
Source: [$UniControle.Projeto$][$UniControle.InstAtualiza$]; DestDir: {tmp}; Flags: deleteafterinstall overwritereadonly uninsremovereadonly
Source: exe\installdll.bat; DestDir: {app}\programas\; Flags: deleteafterinstall overwritereadonly ignoreversion

[Run]
Filename: {app}\programas\installdll.bat; WorkingDir: {app}\programas\; Flags: runhidden; Languages: 
Filename: {tmp}\InstAtualiza.exe; Parameters: /VERYSILENT; WorkingDir: {tmp}; Flags: runhidden
Filename: {reg:HKLM\Software\Uninformare\UNIMESTRE,AtualizaPath|{app}\programas\atualiza.exe}; Parameters: "--invisivel ""{tmp}\[$Modulo.cod$]-[$Modulo.nome$].unm"""; WorkingDir: {tmp}; Flags: runhidden

[Registry]
Root: HKLM; Subkey: SOFTWARE\Uninformare\UNIMESTRE; ValueType: string; ValueName: UniMestreDir; ValueData: {app}\
Root: HKLM; Subkey: SOFTWARE\Business Objects\Suite 11.0\Export\PDF; ValueType: dword; ValueName: ForceLargerFonts; ValueData: 00000001
Root: HKCU; Subkey: Software\Business Objects\Suite 11.0\Crystal Reports\Export\PDF; ValueType: dword; ValueName: ForceLargerFonts; ValueData: 00000001; Tasks: ; Languages: 

[Icons]
Name: {group}\[$Modulo.ds_executavel$]; Filename: {app}\programas\[$Modulo.ds_executavel$].exe; WorkingDir: {app}\programas\; IconFilename: {app}\programas\[$Modulo.ds_executavel$].exe; IconIndex: 0; Flags: createonlyiffileexists
Name: {commondesktop}\[$Modulo.ds_executavel$]; Filename: {app}\programas\[$Modulo.ds_executavel$].exe; Tasks: desktopicon

[CustomMessages]
SemAtualiza=Você precisa instalar o Atualiza 1.9.1.0 ou posterior para prosseguir na instalação

[_ISToolPreCompile]
Name: [$UniControle.UPX$]; Parameters: --force [$Modulo.SVNTempDir$]\exe\[$Modulo.ds_executavel$].exe
Name: [$UniControle.AtualizaCodificador$]; Parameters: -i -c -a [$UniControle.PastaUNM$][$Modulo.cod$]-[$Modulo.nome$].unm; Flags: runminimized

[_ISToolPostCompile]
Name: [$UniControle.AtualizaCodificador$]; Parameters: -i -d -a [$UniControle.PastaUNM$][$Modulo.cod$]-[$Modulo.nome$].unm; Flags: runminimized

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
