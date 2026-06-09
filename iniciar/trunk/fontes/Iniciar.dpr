program Iniciar;

uses
  Forms,
  Messages,
  Dialogs,
  Windows,
  SysUtils,
  Variants,
  Classes,
  Graphics,
  Controls,
  IniFiles,
  ShlObj,
  ComCtrls,
  ExtCtrls,
  StdCtrls,
  DbTables,
  Db,
  uPrincipal in 'uPrincipal.pas' {fPrincipal},
  uErro in 'uErro.pas' {frm_Erro};

{$R *.res}

var
  strAuxCopia : TStringList; { Auxulia no processo de verificação de versão e copia}
  Principal:TfPrincipal; { Estancia o objeto correspondente ao objeto do
                           formulario principal }
  auxStr:String;
begin
    { Inicia a Aplicação e cria o Form Principal }
    Application.Initialize;
    Principal:= TfPrincipal.Create(nil); {Cria o Form o proprietário é a aplicação.}
    Principal.Visible:=False; { Esconde o Form }

    { Configurações do programa }
    Principal.strWmestre := '\wmestre.ini';
    Principal.strFileIniServ := 'iniciar.ini';  // Variavel com o arquivo de configuração para copia de arquivos no SERVIDOR
    Principal.strFileIniLocal := 'iniciar.ini'; // Variavel com o arquivo de configuração paara copia de arquivos no LOCAL
    Principal.strPathServ := ExtractFilePath(ParamStr(0)); // Variavel com o caminho do SERVIDOR onde se encontra o INICIAR.EXE
    Principal.strPathLocal:= Principal.funcReadIniValue('wmestre.ini','Configuracoes','Programa'); // Variavel com o caminho do UNIMESTRE LOCAL
    Principal.strPathIniServ := Principal.strPathServ+Principal.strFileIniServ; // Variavel ccm o CAMINHO + ARQUIVO do SERVIDOR
    Principal.strPathIniLocal := Principal.strPathLocal+Principal.strFileIniLocal; // Variavel ccm o CAMINHO + ARQUIVO LOCAL
    Principal.strRaizIniServ := 'Arquivos';  // Variavel com a CHAVE dio INI onde se estão os arquivos para copia no SERVIDOR
    Principal.strRaizIniLocal := 'Arquivos'; // Variavel com a CHAVE dio INI onde se estão os arquivos para copia no computador LOCAL
    Principal.strKeyIniServ := 'Copia';
    Principal.strKeyIniLocal := 'Copia';
    strAuxCopia := TStringList.Create();

    if ParamStr(1) = '' then
      begin
         Messagedlg('O parâmetro referente ao módulo do programa não foi informado, verifique o atalho para o UNI-MESTRE.', mtError, [mbOk], 0);
         exit;
      end
      else
        begin
           { Chama a função que verifica a versão dos arquivos retornado TRUE = Atualizado, }
           auxStr:=Principal.funcGetVersion();
           if (auxStr = 'TRUE' ) then
             begin
               { Se a função de atualização for executada com sucesso }
               Principal.Visible:=True;
               Principal.Show;
               Application.Run;
               Application.ProcessMessages;
               if (Principal.funcAtuUnimestre(ParamStr(1)) = TRUE) then
                 begin
                   Principal.funcWriteStringIni(Principal.strPathIniLocal,Principal.strRaizIniLocal,Principal.strKeyIniLocal,Principal.auxString1);
                   Principal.Visible:=False;
                   Principal.funcExeUnimestre(ParamStr(1));
                 end
                 else
                   begin
                      Application.Terminate;
                   end;
             end
             else
               if (auxStr = 'STOP') then
                 begin
                   Application.Terminate;
                 end
                 else
                  { Se as versões forem iguais chama o Modulo passado como parametro no PATH do atalho}
                   begin
                     if (auxStr = 'FALSE') then
                       begin
                          Principal.funcExeUnimestre(ParamStr(1));
                       end;
                   end;
        end;
end.
