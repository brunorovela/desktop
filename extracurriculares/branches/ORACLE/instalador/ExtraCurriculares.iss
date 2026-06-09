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
Name: Portugues; MessagesFile: compiler:Languages\Portuguese.isl

[Files]
Source: exe\[$Modulo.ds_executavel$].exe; DestDir: {app}\programas; Flags: overwritereadonly ignoreversion; DestName: [$Modulo.ds_executavel$].exe
Source: exe\*.dll; DestDir: {app}\programas\; Flags: sharedfile uninsneveruninstall overwritereadonly replacesameversion
Source: [$UniControle.PastaUNM$][$Modulo.cod$]-[$Modulo.nome$].unm; DestDir: {tmp}; Flags: deleteafterinstall
Source: [$UniControle.Projeto$][$UniControle.InstAtualiza$]; DestDir: {tmp}; Flags: deleteafterinstall overwritereadonly uninsremovereadonly

[Run]
Filename: {tmp}\InstAtualiza.exe; Parameters: /VERYSILENT; WorkingDir: {tmp}; Flags: runhidden
Filename: {reg:HKLM\Software\Uninformare\UNIMESTRE,AtualizaPath|{app}\programas\atualiza.exe}; Parameters: "--invisivel ""{tmp}\[$Modulo.cod$]-[$Modulo.nome$].unm"""; WorkingDir: {tmp}; Flags: runhidden

[Registry]
Root: HKLM; Subkey: SOFTWARE\Uninformare\UNIMESTRE; ValueType: string; ValueName: UniMestreDir; ValueData: {app}\

[Icons]
Name: {group}\[$Modulo.ds_executavel$]; Filename: {app}\programas\[$Modulo.ds_executavel$].exe; WorkingDir: {app}\programas\; IconFilename: {app}\programas\[$Modulo.ds_executavel$].exe; IconIndex: 0; Flags: createonlyiffileexists

[CustomMessages]
SemAtualiza=Você precisa instalar o Atualiza 1.5.1.0 ou posterior para prosseguir na instalação

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

[INI]
Filename: {app}\programas\unimestre.ini; Section: Conexao; Key: Protocolo; String: mysql-5; Flags: createkeyifdoesntexist uninsdeletesection
Filename: {app}\programas\unimestre.ini; Section: Conexao; Key: Servidor; String: localhost; Flags: createkeyifdoesntexist uninsdeletesection
Filename: {app}\programas\unimestre.ini; Section: Conexao; Key: Banco; String: unimestre; Flags: createkeyifdoesntexist uninsdeletesection
Filename: {app}\programas\unimestre.ini; Section: Conexao; Key: Porta; String: 3306; Flags: createkeyifdoesntexist uninsdeletesection
Filename: {app}\programas\unimestre.ini; Section: Conexao; Key: Usuario; String: academico; Flags: createkeyifdoesntexist uninsdeletesection
Filename: {app}\programas\unimestre.ini; Section: Conexao; Key: Senha; String: 113FF833CC0040FF3E91D20136B016DF0F; Flags: createkeyifdoesntexist uninsdeletesection
