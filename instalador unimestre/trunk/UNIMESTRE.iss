#define AppVersion "2.18.1.1"
#define DirAtualizadorUNIMESTRE "..\..\academico\tags\testing"
#define Copyright "Uninformare Informática Ltda."
#define WebSite "http://www.unimestre.com"

[Setup]
InternalCompressLevel=ultra
AppName=UNIMESTRE
AppVerName=UNIMESTRE {#AppVersion}
VersionInfoVersion={#AppVersion}
AppPublisher={#Copyright}
AppPublisherURL={#WebSite}
AppSupportURL={#WebSite}
AppUpdatesURL={#WebSite}
DirExistsWarning=no
ShowLanguageDialog=no
LanguageDetectionMethod=locale
DefaultDirName={reg:HKLM\Software\Uninformare\UNIMESTRE,UniMestreDir|{sd}\UNIMESTRE}
DefaultGroupName=Unimestre
OutputDir=..\tags
OutputBaseFilename=InstaladorUNIMESTRE-{#AppVersion}
WizardImageFile=recursos\icones\wizard-UM-big.bmp
WizardSmallImageFile=recursos\icones\unimestre.bmp
SetupIconFile=recursos\icones\unimestre.ico
Compression=lzma/ultra
SolidCompression=yes
Uninstallable=true
AppID={{E3A8D72D-1E45-4B94-AA4C-37A46786351E}}
PrivilegesRequired=admin
VersionInfoCompany={#Copyright}
VersionInfoCopyright={#Copyright}


[CustomMessages]
ODBC_DriverName=MySQL ODBC 3.51 Driver
ODBC_Description=UNIMESTRE MySQL DSN
ODBC_Database=unimestre
ODBC_Option=3

[Languages]
Name: brazilianportuguese; MessagesFile: compiler:Languages\BrazilianPortuguese.isl

[Files]
; Fontes
Source: recursos\fontes\Cia_itft.ttf; DestDir: {fonts}; FontInstall: CIA ITF Tall; Flags: onlyifdoesntexist uninsneveruninstall ignoreversion
Source: recursos\fontes\ciacode39_m.ttf; DestDir: {fonts}; FontInstall: CIA Code 39 Medium Text; Flags: onlyifdoesntexist uninsneveruninstall ignoreversion

; Atualiza do sistema
Source: {#DirAtualizadorUNIMESTRE}\AtualizaUnimestre-{#AppVersion}.exe; DestDir: {tmp}; Flags: ignoreversion

; ODBC
Source: recursos\odbc\*; DestDir: {tmp}; Check: NOT(IsMySQLOdbcInstalled())

; Crystal Reports
Source: recursos\terceiros\*; DestDir: {tmp}; Check: NOT(IsCrystalInstalled())

; DLLs MySQL
Source: recursos\dlls\mysql\*.dll; DestDir: {sys}; Flags: onlyifdoesntexist

; DLLs para System32 (SysWow64)
Source: recursos\dlls\system\*.dll; DestDir: {sys}; Flags: onlyifdoesntexist

; ATENÇÃO: Esta linha copia as DLLs para a pasta programas & Cria o arquivo INI de configuração do UNIMESTRE
Source: recursos\dlls\*.dll; DestDir: {app}\programas; Flags: ignoreversion onlyifdoesntexist

[Icons]
; Criação dos Links para o site do UNIMESTRE
Name: {app}\programas\Controle de Ocorrências; Filename: http://www.unimestre.com/ocorrencias.php
Name: {app}\programas\Site UNIMESTRE; Filename: http://www.unimestre.com/

[Run]
; Ao final da instalação, questionar se deseja criar o unimestre
Filename: {app}\programas\Unimestre.exe; Description: {cm:LaunchProgram,UNIMESTRE}; Flags: nowait postinstall skipifsilent unchecked; Check: ArquivoUNIMESTREExistente()

; Instalação do MySQL ODBC
Filename: msiexec.exe; Parameters: "/i ""{tmp}\mysql-connector-odbc-3.51.30-win32.msi"""; StatusMsg: Instalando ODBC 32bit; Check: NOT(IsMySQLOdbcInstalled()) AND NOT(IsWin64()); Flags: skipifsilent
Filename: msiexec.exe; Parameters: "/i ""{tmp}\mysql-connector-odbc-3.51.30-winx64.msi"""; StatusMsg: Instalando ODBC 64bit; Check: NOT(IsMySQLOdbcInstalled()) AND IsWin64(); Flags: skipifsilent

; Instalação dos recursos necessários para Relatórios
Filename: msiexec.exe; Parameters: "/i ""{tmp}\atualizacaogeradorrelatorios.msi"""; StatusMsg: Instalando Crystal Reports; Check: NOT(IsCrystalInstalled()); Flags: skipifsilent

; Registro de DLLs que se encontram na pasta "recursos\dlls"
Filename: regsvr32.exe; Parameters: "/s ""{app}\programas\capicom.dll"""; StatusMsg: Registrando DLLs do Sistema; Flags: skipifsilent
Filename: regsvr32.exe; Parameters: "/s ""{app}\programas\crdb_odbc.dll"""; StatusMsg: Registrando DLLs do Sistema; Flags: skipifsilent
Filename: regsvr32.exe; Parameters: "/s ""{app}\programas\crdb_odbc_res_en.dll"""; StatusMsg: Registrando DLLs do Sistema; Flags: skipifsilent
Filename: regsvr32.exe; Parameters: "/s ""{app}\programas\crpe32.dll"""; StatusMsg: Registrando DLLs do Sistema; Flags: skipifsilent
Filename: regsvr32.exe; Parameters: "/s ""{app}\programas\CRUE32.dll"""; StatusMsg: Registrando DLLs do Sistema; Flags: skipifsilent
Filename: regsvr32.exe; Parameters: "/s ""{app}\programas\DelZip190.dll"""; StatusMsg: Registrando DLLs do Sistema; Flags: skipifsilent
Filename: regsvr32.exe; Parameters: "/s ""{app}\programas\Extens32.dll"""; StatusMsg: Registrando DLLs do Sistema; Flags: skipifsilent
Filename: regsvr32.exe; Parameters: "/s ""{app}\programas\libeay32.dll"""; StatusMsg: Registrando DLLs do Sistema; Flags: skipifsilent
Filename: regsvr32.exe; Parameters: "/s ""{app}\programas\midas.dll"""; StatusMsg: Registrando DLLs do Sistema; Flags: skipifsilent
Filename: regsvr32.exe; Parameters: "/s ""{app}\programas\msxml5.dll"""; StatusMsg: Registrando DLLs do Sistema; Flags: skipifsilent
Filename: regsvr32.exe; Parameters: "/s ""{app}\programas\querybuilder.dll"""; StatusMsg: Registrando DLLs do Sistema; Flags: skipifsilent
Filename: regsvr32.exe; Parameters: "/s ""{app}\programas\ssleay32.dll"""; StatusMsg: Registrando DLLs do Sistema; Flags: skipifsilent
Filename: regsvr32.exe; Parameters: "/s ""{app}\programas\u2lbcp.dll"""; StatusMsg: Registrando DLLs do Sistema; Flags: skipifsilent

; Executar o Atualizador do UNIMESTRE, que irá na verdade INSTALAR o UNIMESTRE
Filename: {tmp}\AtualizaUnimestre-{#AppVersion}.exe; Description: Instalador UNIMESTRE; Flags: skipifsilent

[Registry]
Root: HKLM; Subkey: SOFTWARE\Uninformare\UNIMESTRE; ValueType: string; ValueName: UniMestreDir; ValueData: {app}\
Root: HKLM; Subkey: SOFTWARE\Business Objects\Suite 11.0\Export\PDF; ValueType: dword; ValueName: ForceLargerFonts; ValueData: 00000001
Root: HKCU; Subkey: Software\Business Objects\Suite 11.0\Crystal Reports\Export\PDF; ValueType: dword; ValueName: ForceLargerFonts; ValueData: 00000001; Tasks: ; Languages: 

[Code]
function ArquivoUNIMESTREExistente(): Boolean;
begin
  Result := FileExists(ExpandConstant('{app}') + '\programas\unimestre.exe');
end;

// Função para validar se o ODBC está ou não instalado
function IsMySQLOdbcInstalled(): Boolean;
begin
  Result := RegValueExists(HKEY_LOCAL_MACHINE, 'SOFTWARE\ODBC\ODBCINST.INI\ODBC Drivers', ExpandConstant('{cm:ODBC_DriverName}'));
end;

function IsCrystalInstalled(): Boolean;
begin
	Result := RegKeyExists(HKEY_LOCAL_MACHINE, 'SOFTWARE\Business Objects\Suite 11.0\Crystal Reports');
end;

{*
 FORMULÁRIO DE CONFIGURAÇÃO DO BANCO DE DADOS
*}
var
  cbUsaProjetoSeguranca: TNewCheckBox;
  edIP: TNewEdit;
  edPorta: TNewEdit;
  edUsuario: TNewEdit;
  edSenha: TPasswordEdit;
  edPastaRelatorio: TNewEdit;
  edPastaINI: TNewEdit;
  RadioButtonManual, RadioButtonCopia: TNewRadioButton;
  RadioButtonManterConfiguracao, RadioButtonCorrigirConfiguracao: TNewRadioButton;
  ID_PAGE_CONFIGURACAO_INI, ID_PAGE_BUSCA_INI: Integer;
  btnBuscaPastaRelatorios: TNewButton;


procedure SetRegMySQL();
begin
  RegWriteStringValue(HKEY_LOCAL_MACHINE, 'SOFTWARE\ODBC\ODBC.INI\ODBC Data Sources', 'unimestre', ExpandConstant('{cm:ODBC_DriverName}'));
  RegWriteStringValue(HKEY_LOCAL_MACHINE, 'SOFTWARE\ODBC\ODBC.INI\unimestre', 'Description', ExpandConstant('{cm:ODBC_Description}'));
  RegWriteStringValue(HKEY_LOCAL_MACHINE, 'SOFTWARE\ODBC\ODBC.INI\unimestre', 'Database', ExpandConstant('{cm:ODBC_Database}'));
  RegWriteStringValue(HKEY_LOCAL_MACHINE, 'SOFTWARE\ODBC\ODBC.INI\unimestre', 'Driver', ExpandConstant('{pf}') + '\MySQL\Connector ODBC 3.51\myodbc3.dll');
  RegWriteStringValue(HKEY_LOCAL_MACHINE, 'SOFTWARE\ODBC\ODBC.INI\unimestre', 'Server', edIP.Text);
  RegWriteStringValue(HKEY_LOCAL_MACHINE, 'SOFTWARE\ODBC\ODBC.INI\unimestre', 'User', edUsuario.Text);
  RegWriteStringValue(HKEY_LOCAL_MACHINE, 'SOFTWARE\ODBC\ODBC.INI\unimestre', 'Password', '');
  RegWriteStringValue(HKEY_LOCAL_MACHINE, 'SOFTWARE\ODBC\ODBC.INI\unimestre', 'Port', edPorta.text);
  RegWriteStringValue(HKEY_LOCAL_MACHINE, 'SOFTWARE\ODBC\ODBC.INI\unimestre', 'Option', ExpandConstant('{cm:ODBC_Option}'));
end;

procedure ButtonBuscarPasta(Sender: TObject);
var
  dir: String;
begin
  dir := 'C:\UNIMESTRE\relatorios';
  if BrowseForFolder('Selecionar pasta de Relatórios', dir, True) then
  begin
    TNewEdit(TButton(Sender).Owner).Text := dir;
  end;
end;

procedure ButtonBuscarArquivo(Sender: TObject);
var
  arquivo: String;
begin
  arquivo := '*.ini';

  if GetOpenFileName('Selecionar o diretório do arquivo .ini para cópia', arquivo, '', 'Configuração UNIMESTRE (*.ini)', '*.ini') then
  begin
    TNewEdit(TButton(Sender).Owner).Text := arquivo;
  end;
end;

procedure CreateINIFile();
var
  INIFile : TStringList;
  INIFileSave : TArrayOfString;
  I : Integer;
begin
  if NOT(DirExists(ExpandConstant('{app}') + '\programas')) then
  begin
    CreateDir(ExpandConstant('{app}'));
    CreateDir(ExpandConstant('{app}') + '\programas');
  end;

  if RadioButtonManual.Checked then
  begin
    INIFile := TStringList.Create();

    INIFile.Add('[Conexao]');
    INIFile.Add('Servidor=' + edIP.Text);
    INIFile.Add('Banco=unimestre');
    INIFile.Add('Usuario=' + edUsuario.Text);
    INIFile.Add('Senha=' + edSenha.Text);
    INIFile.Add('Porta=' + edPorta.Text);
    INIFile.Add('Opcoes=');
    INIFile.Add('Protocol=mysql-5');
    INIFile.Add('Protocolo=mysql-5');

    if cbUsaProjetoSeguranca.Checked then
    begin
      INIFile.Add('Usa.Start=1');
    end else begin
      INIFile.Add('Usa.Start=0');
    end;

    INIFile.Add('');
    INIFile.Add('[Conexao.docs]');
    INIFile.Add('Servidor=' + edIP.Text);
    INIFile.Add('Banco=unimestre_docs');
    INIFile.Add('Usuario=' + edUsuario.Text);
    INIFile.Add('Senha=' + edSenha.Text);
    INIFile.Add('Porta=' + edPorta.Text);
    INIFile.Add('Opcoes=');
    INIFile.Add('Protocol=mysql-5');
    INIFile.Add('Protocolo=mysql-5');
    INIFile.Add('');
    INIFile.Add('[Configuracoes]');
    INIFile.Add('EfeitosVisuais=1');
    INIFile.Add('UsarPastaProgramas=1');
    INIFile.Add('Programas=' + ExpandConstant('{app}') + '\programas');
    INIFile.Add('Relatorios=' + edPastaRelatorio.Text);
    INIFile.Add('');
    INIFile.Add('[Atualiza]');
    INIFile.Add('DirPadrao=./');
    INIFile.Add('Usuario=backup');
    INIFile.Add('Senha=91BF7BB5459833E31ABB');
    INIFile.Add('Programa=./Atualiza.exe');
    INIFile.Add('Confirma.Conexao=0');
    INIFile.Add('Notifica.Erros=0');
    INIFile.Add('');
    INIFile.Add('[Academico]');
    INIFile.Add('Programa=./UniMestre.exe');
    INIFile.Add('');
    INIFile.Add('[Backup]');
    INIFile.Add('mysql=' + ExpandConstant('{app}') + '\programas\mysql');
    INIFile.Add('mysqldump=' + ExpandConstant('{app}') + '\programas\mysqldump');
    INIFile.add('');
    INIFile.add('[ImpressoraDOS]');
    INIFile.add('Porta=' + ExpandConstant('{app}') + '\programas\porta_padrao.txt');
    INIFile.add('PularLinhas=0');
    INIFile.add('');
    INIFile.add('[Digitalizacao]');
    INIFile.add('ForcarFechamento=N');

    SetArrayLength(INIFileSave, INIFile.Count);
    for I := 0 to INIFile.Count - 1 do
    begin
      INIFileSave[I] := INIFile[I];
    end;

    SaveStringsToFile(ExpandConstant('{app}') + '\programas\unimestre.ini', INIFileSave, False);

    if NOT(FileExists(ExpandConstant('{src}') + '\unimestre.ini')) then
    begin
      SaveStringsToFile(ExpandConstant('{src}') + '\unimestre.ini', INIFileSave, False);
    end;
  end if RadioButtonCopia.Checked then
  begin
    FileCopy(edPastaINI.Text, ExpandConstant('{app}') + '\programas\unimestre.ini', False);

    if RadioButtonCorrigirConfiguracao.Checked then
    begin
      SetIniString('Conexao', 'Servidor', edIP.Text, ExpandConstant('{app}') + '\programas\unimestre.ini');
      SetIniInt('Conexao', 'Porta', StrToInt(edPorta.Text), ExpandConstant('{app}') + '\programas\unimestre.ini');
      SetIniString('Conexao', 'Usuario', edUsuario.Text, ExpandConstant('{app}') + '\programas\unimestre.ini');
      SetIniString('Conexao', 'Senha', edSenha.Text, ExpandConstant('{app}') + '\programas\unimestre.ini');

      SetIniString('Conexao.docs', 'Servidor', edIP.Text, ExpandConstant('{app}') + '\programas\unimestre.ini');
      SetIniInt('Conexao.docs', 'Porta', StrToInt(edPorta.Text), ExpandConstant('{app}') + '\programas\unimestre.ini');
      SetIniString('Conexao.docs', 'Usuario', edUsuario.Text, ExpandConstant('{app}') + '\programas\unimestre.ini');
      SetIniString('Conexao.docs', 'Senha', edSenha.Text, ExpandConstant('{app}') + '\programas\unimestre.ini');

      if cbUsaProjetoSeguranca.Checked then
        SetIniInt('Conexao', 'Usa.Start', 1, ExpandConstant('{app}') + '\programas\unimestre.ini')
      else
        SetIniInt('Conexao', 'Usa.Start', 0, ExpandConstant('{app}') + '\programas\unimestre.ini');

      SetIniString('Configuracoes', 'Relatorios', edPastaRelatorio.Text, ExpandConstant('{app}') + '\programas\unimestre.ini');
    end;

    SetIniString('ImpressoraDOS', 'PularLinhas', '0', ExpandConstant('{app}') + '\programas\unimestre.ini');
    SetIniString('ImpressoraDOS', 'Porta',  ExpandConstant('{app}') + '\programas\porta_padrao.txt', ExpandConstant('{app}') + '\programas\unimestre.ini');

  end;

  SetRegMySQL();
end;

function VerificarDadosConfiguracao(Page: TWizardPage): Boolean;
var
  erro : String;
  porta : Integer;
begin
  Result := True;
  erro := '';

  if RadioButtonCorrigirConfiguracao.Checked then
  begin
    if Length(Trim(edIP.Text)) = 0 then
      erro := erro + #13 + '   - É obrigatório o preenchimento do endereço IP.';

    if Length(Trim(edPorta.Text)) = 0 then
    begin
      erro := erro + #13 + '   - É obrigatório o preenchimento da porta.';
    end else begin
      if Pos(' ', edPorta.Text) > 0 then
      begin
        erro := erro + #13 + '   - Não é possível utilizar espaços no número da porta.';
      end else begin
        try
          porta := StrToInt(edPorta.Text);

          if (porta < 1) OR (porta > 65536) then
            erro := erro + #13 + '   - Porta errada. É possível utilizar somente números entre 1 e 65536.';
        except
          erro := erro + #13 + '   - Porta errada. Digite somente número entre os valores 1 e 65536.';
        end;
      end;
    end;

    if Length(Trim(edUsuario.Text)) = 0 then
      erro := erro + #13 + '   - É obrigatório o preenchimento do nome de usuário do banco.';

  end;

  if Length(Trim(erro)) > 0 then
  begin
    erro := 'Os seguinte erros foram encontrados:' + #13 + erro;
    MsgBox(erro, mbError, MB_OK);

    Result := False;
  end;

  if Result then
  begin
    CreateINIFile();
  end;
end;

procedure CheckTipoConfiguracao(Sender: TObject);
begin
  RadioButtonManterConfiguracao.OnClick := nil;
  RadioButtonCorrigirConfiguracao.OnClick := nil;

  RadioButtonManterConfiguracao.Checked := TNewRadioButton(Sender).Name = RadioButtonManterConfiguracao.Name;
  RadioButtonCorrigirConfiguracao.Checked := NOT(RadioButtonManterConfiguracao.Checked);

  RadioButtonManterConfiguracao.OnClick := @CheckTipoConfiguracao;
  RadioButtonCorrigirConfiguracao.OnClick := @CheckTipoConfiguracao;

  cbUsaProjetoSeguranca.Enabled := RadioButtonCorrigirConfiguracao.Checked;
  edIP.Enabled := RadioButtonCorrigirConfiguracao.Checked;
  edPorta.Enabled := RadioButtonCorrigirConfiguracao.Checked;
  edUsuario.Enabled := RadioButtonCorrigirConfiguracao.Checked;
  edSenha.Enabled := RadioButtonCorrigirConfiguracao.Checked;
  edPastaRelatorio.Enabled := RadioButtonCorrigirConfiguracao.Checked;
  btnBuscaPastaRelatorios.Enabled := RadioButtonCorrigirConfiguracao.Checked;
end;

procedure CreateTheWizardPages;
var
  Page: TWizardPage;
  StaticText, StaticText2: TNewStaticText;
  ButtonDirINI: TNewButton;
begin
  {
    **
    TELA PARA PESQUISA DO ARQUIVO .INI OU DEFINIÇÃO PARA CRIAÇÃO DE UM NOVO
    **
  }
  Page := CreateCustomPage(wpPreparing, 'Configuração UNIMESTRE', 'Selecione um arquivo de configuração ou defina um novo');
  ID_PAGE_BUSCA_INI := Page.ID;

  RadioButtonCopia := TNewRadioButton.Create(Page);
  with RadioButtonCopia do
  begin
    Height := ScaleY(17);
    Width := Page.SurfaceWidth - Left;
    Caption := 'Utilizar configurações pré-definidas do arquivo:';
    Name := 'cbImportar';
    Parent := Page.Surface;
  end;

  StaticText := TNewStaticText.Create(Page);
  with StaticText do
  begin
    Top := RadioButtonCopia.Top + RadioButtonCopia.Height + ScaleY(10);
    Left := ScaleX(10);
    Caption := 'Arquivo de configuração de conexão:'
    AutoSize := True;
    Parent := Page.Surface;
  end;

  edPastaINI := TNewEdit.Create(Page);
  with edPastaINI do
  begin
    Top := StaticText.Top + StaticText.Height + ScaleY(5);
    Left := StaticText.Left;
    Width := Page.SurfaceWidth - Left - ScaleX(100);
    Text := '';
    Parent := Page.Surface;
  end;

  ButtonDirINI := TNewButton.Create(edPastaINI);
  with ButtonDirINI do
  begin
    Top := edPastaINI.Top - ScaleY(1);
    Width := Page.SurfaceWidth - (edPastaINI.Left + edPastaINI.Width) - ScaleX(10);
    Height := ScaleY(23);
    Left := Page.SurfaceWidth - Width - ScaleX(4);
    Caption := 'Buscar pasta';
    Parent := Page.Surface;
    OnClick := @ButtonBuscarArquivo;
  end;

  RadioButtonManual := TNewRadioButton.Create(Page);
  with RadioButtonManual do
  begin
    Width := ScaleX(150);
    Top := edPastaINI.Top + edPastaINI.Height + ScaleX(15);
    Height := ScaleY(17);
    Caption := 'Definir novas configurações';
    Parent := Page.Surface;
    Name := 'cbManual';
    Checked := True;
  end;


  {
    **
    TELA PARA CONFIGURAÇÃO DO ARQUIVO .INI CARREGADO OU CRIAÇÃO DE UMA NOVA CONFIGURAÇÃO
    **
  }
  Page := CreateCustomPage(Page.ID, 'Configuração UNIMESTRE', 'Configure as informações do banco de dados e a pasta de Relatórios');
  ID_PAGE_CONFIGURACAO_INI := Page.ID;

  RadioButtonManterConfiguracao := TNewRadioButton.Create(Page);
  with RadioButtonManterConfiguracao do
  begin
    Top := ScaleY(1);
    Left := ScaleY(0);
    Width := ScaleX(150);
    Name := 'RadioButtonManterConfiguracao';
    Caption := 'Manter configurações';
    Checked := True;
    Parent := Page.Surface;
    OnClick := @CheckTipoConfiguracao;
  end;

  RadioButtonCorrigirConfiguracao := TNewRadioButton.Create(Page);
  with RadioButtonCorrigirConfiguracao do
  begin
    Top := RadioButtonManterConfiguracao.Top;
    Left := RadioButtonManterConfiguracao.Left + RadioButtonManterConfiguracao.Width + ScaleY(10);
    Width := ScaleX(200);
    Name := 'RadioButtonCorrigirConfiguracao';
    Caption := 'Alterar configurações existentes';
    Checked := False;
    Parent := Page.Surface;
    OnClick := @CheckTipoConfiguracao;
  end;

  // Usa Projeto Segurança
  cbUsaProjetoSeguranca := TNewCheckBox.Create(Page);
  with cbUsaProjetoSeguranca do
  begin
    Width := ScaleX(240);
    Left := ScaleX(4);
    Top := RadioButtonManterConfiguracao.Top + RadioButtonManterConfiguracao.Height + ScaleY(15);
    Height := ScaleY(17);
    Caption := 'Usar modo seguro (Projeto de Segurança)';
    Checked := False;
    Parent := Page.Surface;
    Name := 'usa_seguranca';
  end;

  StaticText := TNewStaticText.Create(Page);
  with StaticText do
  begin
    Top := cbUsaProjetoSeguranca.Top + cbUsaProjetoSeguranca.Height + ScaleY(10);
    Left := ScaleX(4);
    Caption := 'Configuração do Servidor';
    Font.Style := [fsBold];
    AutoSize := True;
    Parent := Page.Surface;
  end;

  StaticText2 := TNewStaticText.Create(Page);
  with StaticText2 do
  begin
    Top := StaticText.Top + StaticText.Height + ScaleY(5);
    Left := ScaleX(4);
    Caption := 'IP:';
    AutoSize := True;
    Parent := Page.Surface;
  end;

  // IP
  edIP := TNewEdit.Create(Page);
  with edIP do
  begin
    Top := StaticText2.Top - ScaleY(2);
    Left := StaticText2.Left + StaticText2.Width + ScaleX(5);
    Width := Page.SurfaceWidth - ScaleX(120);
    Text := 'localhost';
    Parent := Page.Surface;
    Name := 'ip';
  end;

  StaticText := TNewStaticText.Create(Page);
  with StaticText do
  begin
    Top := StaticText2.Top;
    Left := edIP.Left + edIP.Width + ScaleX(10);
    AutoSize := True;
    Caption := 'Porta:';
    Parent := Page.Surface;
  end;

  // Porta
  edPorta := TNewEdit.Create(Page);
  with edPorta do
  begin
    Top := StaticText2.Top - ScaleY(4);
    Left := StaticText.Left + StaticText.Width + ScaleX(5);
    Width := Page.SurfaceWidth - Left - ScaleX(4);
    Text := '3306';
    Parent := Page.Surface;
    Name := 'porta';
  end;

  StaticText := TNewStaticText.Create(Page);
  with StaticText do
  begin
    Top := edPorta.Top + edPorta.Height + ScaleY(10);
    Left := ScaleX(4);
    AutoSize := True;
    Caption := 'Usuário:';
    Parent := Page.Surface;
  end;

  // Usuário
  edUsuario := TNewEdit.Create(Page);
  with edUsuario do
  begin
    Top := StaticText.Top - ScaleY(4);
    Left := StaticText.Left + StaticText.Width + ScaleX(5);
    Width := ScaleX(100);
    Text := '';
    Parent := Page.Surface;
    Name := 'usuario';
  end;

  StaticText2 := TNewStaticText.Create(Page);
  with StaticText2 do
  begin
    Top := StaticText.Top;
    Left := edUsuario.Left + edUsuario.Width + ScaleX(15);
    AutoSize := True;
    Caption := 'Senha (Criptografada):';
    Parent := Page.Surface;
  end;

  // Senha
  edSenha := TPasswordEdit.Create(Page);
  with edSenha do
  begin
    Top := StaticText.Top - ScaleY(4);
    Left := StaticText2.Left + StaticText2.Width + ScaleX(5);
    Width := Page.SurfaceWidth - Left - ScaleX(4);
    Name := 'senha';
    Text := '';
    Parent := Page.Surface;
  end;

  {*
   * CONFIGURAÇÃO DE PASTAS DOS RELATÓRIOS
   *}
  StaticText2 := TNewStaticText.Create(Page);
  with StaticText2 do
  begin
    Top := StaticText.Top + StaticText.Height + ScaleY(15);
    Caption := 'Relatórios';
    Font.Style := [fsBold];
    AutoSize := True;
    Parent := Page.Surface;
  end;

  StaticText := TNewStaticText.Create(Page);
  with StaticText do
  begin
    Top := StaticText2.Top + StaticText2.Height + ScaleY(7);
    Caption := 'Pasta de Relatórios:';
    AutoSize := True;
    Parent := Page.Surface;
  end;

  edPastaRelatorio := TNewEdit.Create(Page);
  with edPastaRelatorio do
  begin
    Top := StaticText.Top - ScaleY(4);
    Left := StaticText.Left + StaticText.Width + ScaleX(5);
    Width := Page.SurfaceWidth - Left;
    Text := 'C:\UNIMESTRE\relatorios';
    Parent := Page.Surface;
    Name := 'pasta_relatorio';
  end;

  btnBuscaPastaRelatorios := TNewButton.Create(edPastaRelatorio);
  with btnBuscaPastaRelatorios do
  begin
    Top := edPastaRelatorio.Top + edPastaRelatorio.Height + ScaleY(5);
    Width := ScaleX(75);
    Height := ScaleY(23);
    Left := Page.SurfaceWidth - Width;
    Caption := 'Buscar pasta';
    OnClick := @ButtonBuscarPasta;
    Parent := Page.Surface;
  end;

  CheckTipoConfiguracao(RadioButtonManterConfiguracao);
  Page.OnNextButtonClick := @VerificarDadosConfiguracao;
end;

procedure InitializeWizard;
begin
  CreateTheWizardPages;
end;

procedure CurPageChanged(CurPageID: Integer);
begin
  if CurPageID = ID_PAGE_BUSCA_INI then
  begin
    {* ENTRANDO NA PÁGINA DE REQUISIÇÃO DO ARQUIVO .INI OU ESCOLHA DE NOVA CONFIGURAÇÃO *}
    if FileExists(ExpandConstant('{src}') + '\unimestre.ini') then
    begin
      edPastaINI.Text := ExpandConstant('{src}') + '\unimestre.ini';
      RadioButtonCopia.Checked := True;
      RadioButtonManual.Checked := False;
    end else begin
      edPastaINI.Text := '';
      RadioButtonCopia.Checked := False;
      RadioButtonManual.Checked := True;
    end;
  end else if CurPageID = ID_PAGE_CONFIGURACAO_INI then
  begin
    if NOT(DirExists(ExpandConstant('{app}') + '\relatorios')) then
    begin
      CreateDir(ExpandConstant('{app}'));
      CreateDir(ExpandConstant('{app}') + '\relatorios');
    end;

    {* TELA PARA VALIDAÇÃO DAS INFORMAÇÕES OU CORREÇÃO DE CONFIGURA DO BANCO DE DADOS *}
    RadioButtonManterConfiguracao.Visible := RadioButtonCopia.Checked;
    RadioButtonCorrigirConfiguracao.Visible := RadioButtonCopia.Checked;

    if NOT(RadioButtonCorrigirConfiguracao.Visible) then
    begin
      RadioButtonCorrigirConfiguracao.Checked := True;
    end;

    if RadioButtonCopia.Checked then
    begin
      edIP.Text := GetIniString('Conexao', 'Servidor', 'localhost', edPastaINI.Text);
      edPorta.Text := IntToStr(GetIniInt('Conexao', 'Porta', 3306, 1, 65536, edPastaINI.Text));
      edUsuario.Text := GetIniString('Conexao', 'Usuario', '', edPastaINI.Text);
      edSenha.Text := GetIniString('Conexao', 'Senha', '', edPastaINI.Text);
      cbUsaProjetoSeguranca.Checked := GetIniInt('Conexao', 'Usa.Start', 0, 0, 1, edPastaINI.Text) = 1;
      edPastaRelatorio.Text := GetIniString('Configuracoes', 'Relatorios', ExpandConstant('{app}') + '\relatorios', edPastaINI.Text);
    end else begin
      edIP.Text := '';
      edPorta.Text := '';
      edUsuario.Text := '';
      edSenha.Text := '';
      cbUsaProjetoSeguranca.Checked := False;
      edPastaRelatorio.Text := ExpandConstant('{app}') + '\relatorios';
    end;
  end;
end;
