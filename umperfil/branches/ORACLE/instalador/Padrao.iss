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

[Files]
Source: exe\[$Modulo.ds_executavel$].exe; DestDir: {app}\programas; Flags: overwritereadonly ignoreversion; DestName: [$Modulo.ds_executavel$].exe
Source: exe\*.dll; DestDir: {app}\programas\; Flags: sharedfile uninsneveruninstall overwritereadonly replacesameversion

[Registry]
Root: HKLM; Subkey: SOFTWARE\Uninformare\UNIMESTRE; ValueType: string; ValueName: UniMestreDir; ValueData: {app}\

[Icons]
Name: {group}\[$Modulo.ds_executavel$]; Filename: {app}\programas\[$Modulo.ds_executavel$].exe; WorkingDir: {app}\programas\; IconFilename: {app}\programas\[$Modulo.ds_executavel$].exe; IconIndex: 0; Flags: createonlyiffileexists
