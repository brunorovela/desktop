[LangOptions]
LanguageName=Portuguese
LanguageID=$0416

[_ISTool]
UseAbsolutePaths=true
[Setup]
InternalCompressLevel=ultra
OutputDir=..\tags\stable
SourceDir=..\
OutputBaseFilename=InstAtualiza
VersionInfoVersion=2.20.1.1
VersionInfoCompany=Uninformare Informática
VersionInfoDescription=Utilitário de atualização do banco de dados
Compression=lzma/ultra
AppName=Unimestre - Atualiza
AppVerName=Atualiza 2.20.1.1
ShowLanguageDialog=no
AppID={{39B593AC-C0CF-433B-BF02-173BBC18A6ED}
DefaultDirName={reg:HKLM\Software\Uninformare\UNIMESTRE,UniMestreDir|{sd}\UNIMESTRE}
DirExistsWarning=no
SetupIconFile=..\..\..\..\Sistemas\Imagens\install.ico
DefaultGroupName=Unimestre
DisableProgramGroupPage=true
RestartIfNeededByRun=false
AppPublisherURL=http://www.unimestre.com/
AppSupportURL=Unimestre
AppVersion=2.20.1.1
UninstallDisplayIcon={app}\programas\atualiza.exe
UninstallDisplayName=Desinstalador do Atualiza
WizardImageFile=..\..\..\..\Sistemas\Imagens\wizard-UM-big.bmp
WizardSmallImageFile=..\..\..\..\Sistemas\Imagens\wizard-UM-small.bmp

[Dirs]
Name: {app}\programas\scripts; Flags: uninsalwaysuninstall
Name: {app}\imagens

[Files]
Source: exe\Atualiza.exe; DestDir: {app}\programas; Flags: overwritereadonly uninsremovereadonly replacesameversion ignoreversion; DestName: atualiza.exe
Source: ..\..\..\..\Sistemas\Imagens\versao15.ico; DestDir: {app}\imagens; DestName: icone.ico

[INI]
Filename: {app}\programas\unimestre.ini; Section: Conexao; Key: Servidor; String: localhost; Flags: createkeyifdoesntexist uninsdeletesection
Filename: {app}\programas\unimestre.ini; Section: Conexao; Key: Banco; String: unimestre; Flags: createkeyifdoesntexist uninsdeletesection
Filename: {app}\programas\unimestre.ini; Section: Conexao; Key: Usuario; String: academico; Flags: createkeyifdoesntexist uninsdeletesection
Filename: {app}\programas\unimestre.ini; Section: Conexao; Key: Senha; Flags: createkeyifdoesntexist uninsdeletesection; String: 
Filename: {app}\programas\unimestre.ini; Section: Conexao; Key: Porta; String: 3306; Flags: createkeyifdoesntexist uninsdeletesection
Filename: {app}\programas\unimestre.ini; Section: Conexao; Key: Protocolo; String: mysql-5; Flags: createkeyifdoesntexist uninsdeletesection
Filename: {app}\programas\unimestre.ini; Section: Atualiza; Key: DirPadrao; String: {app}; Flags: createkeyifdoesntexist uninsdeletesection
Filename: {app}\programas\unimestre.ini; Section: Atualiza; Key: Usuario; String: backup; Flags: createkeyifdoesntexist uninsdeletesection
Filename: {app}\programas\unimestre.ini; Section: Atualiza; Key: Senha; String: 91BF7BB5459833E31ABB; Flags: createkeyifdoesntexist uninsdeletesection

[Registry]
Root: HKCR; SubKey: .unm; ValueType: string; ValueData: Unimestre.Atualiza; Flags: uninsdeletekey
Root: HKCR; SubKey: Unimestre.Atualiza; ValueType: string; ValueData: Arquivo de atualização do Unimestre; Flags: uninsdeletekey
Root: HKCR; SubKey: Unimestre.Atualiza\Shell\Open\Command; ValueType: string; ValueData: """{app}\programas\atualiza.exe"" ""%1"""; Flags: uninsdeletekey
Root: HKCR; Subkey: Unimestre.Atualiza\DefaultIcon; ValueType: string; ValueData: {app}\imagens\icone.ico,0; Flags: uninsdeletekey
Root: HKLM; Subkey: SOFTWARE\Uninformare\UNIMESTRE; ValueType: string; ValueName: AtualizaPath; ValueData: {app}\programas\atualiza.exe; Flags: uninsclearvalue noerror

[Languages]
Name: Portuguese; MessagesFile: compiler:Languages\BrazilianPortuguese.isl

[Icons]
Name: {group}\Atualiza; Filename: {app}\programas\atualiza.exe; WorkingDir: {app}\programas; IconFilename: {app}\programas\atualiza.exe; IconIndex: 0
Name: {group}\Uteis\Remover o Atualiza; Filename: {uninstallexe}

[_ISToolPreCompile]
Name: ..\..\..\..\Sistemas\Codificador\exe\upx.exe; Parameters: ..\exe\Atualiza.exe
