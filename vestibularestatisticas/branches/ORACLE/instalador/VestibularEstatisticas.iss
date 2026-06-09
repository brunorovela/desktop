[Setup]
InternalCompressLevel=ultra
OutputDir=D:\Programacao\Desenvolvimento\ATUALIZACOES\Atualizadores\
SourceDir=D:\Programacao\Desenvolvimento\UNIMESTRE\VestibularEstatisticas\
OutputBaseFilename=VestibularEstatisticas
VersionInfoVersion=1.0.0.4
VersionInfoCompany=Uninformare Informática
VersionInfoDescription=Uni-Mestre - Estatísticas do Vestibular
VersionInfoTextVersion=Uni-Mestre - Estatísticas do Vestibular
Compression=lzma/ultra
AppName=UNI-MESTRE - Estatísticas do Vestibular
AppVerName=1.0.0.4
InfoBeforeFile=D:\Programacao\Desenvolvimento\UNIMESTRE\VestibularEstatisticas\instalador\Leiame.txt
DirExistsWarning=no
ShowLanguageDialog=no
LanguageDetectionMethod=locale
WizardImageFile=D:\Programacao\Sistemas\Imagens\wizard-UM-big.bmp
WizardSmallImageFile=D:\Programacao\Sistemas\Imagens\wizard-UM-small.bmp
SetupIconFile=D:\Programacao\Sistemas\Imagens\instalador.ico
Uninstallable=false
AppID={{E3A8D72D-1E45-4B94-AA4C-37A46786351E}
DefaultDirName={reg:HKLM\Software\Uninformare\UNIMESTRE,UniMestreDir|{sd}\UNIMESTRE}
DisableProgramGroupPage=true
DefaultGroupName=UNIMESTRE
[Languages]
Name: Portugues; MessagesFile: compiler:Languages\PortugueseStd.isl

[Files]
Source: ..\..\ATUALIZACOES\Atualizadores\InstAtualiza.exe; DestDir: {tmp}; Flags: deleteafterinstall overwritereadonly uninsremovereadonly
Source: exe\Vestibular_Estatisticas_ok.exe; DestDir: {app}\programas; Flags: overwritereadonly ignoreversion; DestName: Vestibular_Estatisticas.exe
Source: ..\..\ATUALIZACOES\Gerais\Atualizacoes.unm; DestDir: {tmp}; Flags: deleteafterinstall

[Run]
Filename: {tmp}\InstAtualiza.exe; Parameters: /VERYSILENT; WorkingDir: {tmp}; Flags: runhidden
Filename: {reg:HKLM\Software\Uninformare\UNIMESTRE,AtualizaPath|{app}\programas\atualiza.exe}; Parameters: "--invisivel ""{tmp}\Atualizacoes.unm"""; WorkingDir: {tmp}; Flags: runhidden

[Registry]
Root: HKLM; Subkey: SOFTWARE\Uninformare\UNIMESTRE; ValueType: string; ValueName: UniMestreDir; ValueData: {app}\

[Icons]
Name: {group}\Estatísticas do Vestibular; Filename: {app}\programas\Vestibular_Estatisticas.exe; WorkingDir: {app}\programas\; IconFilename: {app}\programas\Vestibular_Estatisticas.exe; IconIndex: 0; Flags: createonlyiffileexists

[CustomMessages]
SemAtualiza=Você precisa instalar o Atualiza 1.5.1.0 ou posterior para prosseguir na instalação

[_ISToolPreCompile]
Name: D:\Programacao\Sistemas\Codificador\exe\upx.exe; Parameters: D:\Programacao\Desenvolvimento\UNIMESTRE\VestibularEstatisticas\exe\Vestibular_Estatisticas_ok.exe
Name: D:\Programacao\Sistemas\Codificador\exe\AtualizaCodificador.exe; Parameters: -i -c -a D:\Programacao\Desenvolvimento\UNIMESTRE\VestibularEstatisticas\instalador\VestibularEstatisticas.unm; Flags: runminimized

[_ISToolPostCompile]
Name: D:\Programacao\Sistemas\Codificador\exe\AtualizaCodificador.exe; Parameters: -i -d -a D:\Programacao\Desenvolvimento\UNIMESTRE\VestibularEstatisticas\instalador\VestibularEstatisticas.unm; Flags: runminimized
