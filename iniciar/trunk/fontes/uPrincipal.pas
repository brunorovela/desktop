{
#TIT= Tela de Splash;
#OBJ= Esta verifica a versão do executável e outros arquivos do .INI no cliente em relação ao servidor e atualiza se necessário;
#AUT= Marcelo Gonzaga, Victor Godoy Poluceno;
#DAT= 11\08\2004;
#MOD= 16\08\2004 às 6:00 PM;
#DES= Se o executavel e os arquivos não estiverem na mesma versão do servidor apenas executa o sistema,
caso a versão seja diferente ou o executável  e os outros arquivos não exista ele copia a versão que está no servidor;
}
unit uPrincipal;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, IniFiles, ShlObj, ComCtrls, ExtCtrls, StdCtrls, DbTables, Db;

type
  TfPrincipal = class(TForm)
    lblAguarde: TLabel;
    LabStatus: TLabel;
    ProgressBar1: TProgressBar;
    Bevel1: TBevel;
    procedure FormPaint(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    auxString1 : String;
    auxString2 : String;
    auxString3 : TStringList;
    auxString4 : TStringList;
    strArqCopia : TStringList;
    strDllArqLocal: TStringList;
    strDLLVerLocal : TStringList;
    strDllArqServ: TStringList;
    strDLLVerServ : TStringList;
    strKeyIniServ : String;
    strKeyIniLocal : String;
    strDLLVer : TStringList;
    strDllArq : TStringList;
    strWmestre : String;
    strPathLocal : String;
    strFileIniLocal : String;
    strPathServ:String;      // Armazena o caminho do executavel no servidor, pego atraves dp path do atalho
    strFileIniServ : String;  // Arquivo INI no servidor
    strPathIniLocal :String;
    strPathIniServ : String; // Variavel com o nome ou caminho do arquivo .ini no servidor
    strVersionLocal: String; // Recebe o valor da versão local do Unimestre
    strRaizIniServ: String;  // Raiz defaul do arquivo ini do iniciar
    strRaizIniLocal : String;
    procedure PapelParede(Sender: TObject);
    //
    function funcExtractWinDir():String;
    // Retorna o diretorio do windows
    function funcGetVersion():String;
    // Verifica se os arquivos estão atualizados comparando com o ".ini" com servidor.
    function funcExeUnimestre(strModulo:String):Boolean;
    // Caso os arquivos estiverem atualizados, chama o programa executado ex: UniMestre.exe, Biblioteca.exe.
    function funcAtuUnimestre(strModulo:String):Boolean;
    // Caso os arquivos estiverem desatualizados, copia os arquivos atualizados do servidor.
    function funcReadIniValue(PathIni:String; Raiz:String; Dados:String):String;
    //
    function funcReadIniSection(strPathIni:String; strRaiz:String):TStringList;
    //
    function FunGetBuildInfo(strVerModulo : String): String;
    //
    function CopyFileWithProgressBar1(Source, Destination: TStringList):Boolean;
    //
    function funcReadIni():Boolean;
    //
    function ReplaceStr(strLine, strType: String): string;
    //
    function funcWriteStringIni(strPathIni, strRaiz, strKey, strValue:String):Boolean;
    //
    Procedure MostraErro(Sender: TObject; E : Exception);

end;

var
  fPrincipal: TfPrincipal;
  IniFile :TIniFile;
  MyBitmap : TBitmap;
  iniBitmap : String;

implementation

uses uErro;


{$R *.dfm}

{ TfPrincipal }

{
#FDES= Executa o Modulo caso o sistema esteja atualizado ou tenha sido atualizado;
#FRET= Retorna TRUE ou FALSE;
#FPAR= PARAMETRO1= Parâmetro que representa o nome do executável;
#FAUT= Victor Godoy Poluceno;
#FMOD= 28/09/2004 às 12:00 PM;
}
function TfPrincipal.funcExeUnimestre(strModulo:String): Boolean;
var
  strPathExe: PAnsiChar;
  wordErro:Word;
begin
  { Pega o PATH onde o UNIMESTRE foi instalado mas o modulo passado por parametro e chama o programa }
  strPathExe:=PAnsiChar(funcReadIniValue('wmestre.ini','Configuracoes','Programa')+ParamStr(1));
  wordErro:=WinExec(strPathExe, SW_SHOWNORMAL);
  
  { Se o programa for executado com sucesso retorna TRUE caso contrario retorna FALSE}
  if (wordErro <= 31) then
    begin
      Messagedlg('Ocorreu um erro inesperado. Erro: erro ao executar o programa '+ strModulo+'.', mtWarning, [mbOk], 0);
      result := FALSE;
    end
    else
      begin
        result := TRUE;
      end;
end;

{
#FDES= Compara as versões do executaveis dos clientes e locais e verifica a
       comparação dos arquivos do INI (Outros);
#FRET= Retorna TRUE ou FALSE;
#FAUT= Marcelo Gonzaga, Victor Godoy Poluceno;
#FMOD= 28/09/2004 às 14:00 PM;
}
function TfPrincipal.funcGetVersion: String;
var
  i,j : integer;
  auxCond : integer;
  strVerExeLocal:String;  { Armazema o diretorio do WINDOWS }
  strVerExeServ:String;   { Armazena a versão executavel LOCAL}
  strIniLocal:String;     { Caminho do arquivo INI LOCAL padrão = pasta windows + wmestre.ini }
  strPathSys:string;      { Armazema o diretorio do WINDOWS }
begin
  { Usa a função funcExtractDir, que retorna o diretorio windows }
  strPathSys:=funcExtractWinDir;
  { Caminho strPathSys + wmestre.ini }
  strIniLocal:= strPathSys+strWmestre;
  { Cria a STRING LIST que vai armazenar os arquivos a serem copiados }
  strArqCopia := TStringList.Create();

  { Mostra uma mensagem de erro caso o arquivo não exista }
  if FileExists(strIniLocal) <> TRUE Then
    begin
       Messagedlg('Ocorreu um erro inesperado. Erro: não foi possível encontrar o arquivo de configuração do unimestre: '+ strIniLocal + ' verifique o arquivo.', mtWarning, [mbOk], 0);
       result:='STOP';
       exit;
    end
    else { Se o arquivo for econtrado começa a executar as verificações }
      begin
        { Pega as versões do executaveis }
        strVerExeLocal := FunGetBuildInfo(funcReadIniValue('wmestre.ini','Configuracoes','Programa')+ParamStr(1));
        strVerExeServ := FunGetBuildInfo(PAnsiChar(strPathServ)+ParamStr(1));
        { Pega os arquivos e versões do INI }
        if funcReadIni() = FALSE then
          begin
            result := 'STOP';
            exit;
          end;

        { Verifica se a função encontrou o arquivo local }
        if strVerExeLocal <> '' then
          begin
            { Verifica se a função encontrou o arquivo no Servidor }
            if strVerExeServ  <> '' then
              begin
                result:='TRUE'; { deault TRUE = versões iguais }
                { Le a variavel STRING LIST comparando as versões dos arquivos }
                for i := 0 to strDllArqServ.Count-1  do
                  begin
                    for j := 0 to strDllArqLocal.Count-1 do
                      begin
                        if  UpperCase(strDllArqServ[i]) = UpperCase(strDllArqLocal[j]) then
                          begin
                            auxCond := 1;
                            { Verifica se os arquivos e as versões são iguais ou são iguais a 0 COPIAR SEMPRE }
                            if (UpperCase(strDllVerServ[i]) <> UpperCase(strDllVerLocal[j])) or ((UpperCase(strDllVerServ[i]) = '0')  and (UpperCase(strDllVerLocal[i]) = '0')) then
                              begin
                                { String List com os arquivos a serem copiados }
                                strArqCopia.Add(strDllArqServ[i]);
                                result:='FALSE';
                              end;
                          end
                          else
                            begin
                              if auxCond <> 1 then
                                auxCond := 0;
                              end;
                          if auxCond = 0 then
                            begin
                              { String List com os arquivos a serem copiados }
                              strArqCopia.Add(strDllArqServ[i]);
                              result:='FALSE';
                            end;
                      end;
                  end;
                  { Se for igual retorna 0 }
                  if AnsiCompareText(strVerExeLocal,strVerExeServ)<> 0 then
                    begin
                      { Caso o executavel precise se copiado }
                      strArqCopia.Add('Executavel');
                      result:='FALSE';
                    end;
              end; 
          end;
      end;
end;

{
#FDES= Verifica quais arquivos devem ser copiados e envia para a função de copia;
#FRET= Retorna TRUE ou FALSE;
#FPAR= PARAMETRO1= Parâmetro que representa o nome do executável;
#FAUT= Marcelo Gonzaga, Victor Godoy Poluceno;
#FMOD= 29/09/2004 às 14:00 PM;
}
function TfPrincipal.funcAtuUnimestre(strModulo:String): Boolean;
var
  i : integer;
  pansiExeLocal: PAnsiChar;
  pansiExeServ: PAnsiChar;
  pansiIniLocal: PAnsiChar;
  pansiIniServ: PAnsiChar;
begin
  auxString3 := TStringList.Create();
  auxString4 := TStringList.Create();

  for i := 0 to strArqCopia.Count-1 do
    begin
     { Se o arquivo executavel precisar ser copiado }
      if strArqCopia[i] = 'Executavel' then
        begin
          pansiExeLocal:= PAnsiChar(funcReadIniValue('wmestre.ini','Configuracoes','Programa')+ ParamStr(1));
          pansiExeServ:= PAnsiChar(ExtractFilePath(ParamStr(0))+ParamStr(1));

          auxString3.Add(pansiExeLocal);
          auxString4.Add(pansiExeServ);

        end
        else
          begin
            { Se for outro arquivo qualquer }
            pansiExeLocal:= PAnsiChar(strPathLocal+ strArqCopia[i]);
            pansiExeServ:= PAnsiChar(strPathServ + strArqCopia[i]);

            auxString3.Add(pansiExeLocal);
            auxString4.Add(pansiExeServ);
          end;
    end;
    { Executa a opia dos arquivos passando para a função duas String Lists com os arquivos }
    if (CopyFileWithProgressBar1(auxString4,auxString3) = FALSE) then
      begin
        result := FALSE;
      end
      else
        begin
          { Atualiza a versão no arquivo local }
          funcReadIniValue(strPathIniServ,strRaizIniServ,strKeyIniServ);
          result := TRUE;
        end;
end;

{
#FDES= Retorna o diretório do windows;
#FRET= Retorna o diretório (String);
#FAUT= Victor Godoy Poluceno;
#FMOD= 12\08\2004 às 3:00 PM;
}
function TfPrincipal.funcExtractWinDir: String;
var
  Buffer : Array[0..144] of Char;
begin
  GetWindowsDirectory(Buffer,144);
  result := StrPas(Buffer);
end;

{                                                                 
#FDES= Retorna valores em um arquivo .INI;
#FRET= O texto pesquisado;
#FPAR= PARAMETRO1= Caminho do INI;
#FPAR= PARAMETRO2= Chave do INI;
#FPAR= PARAMETRO3= Valores do INI;
#FAUT= Victor Godoy Poluceno;
#FMOD= 11\08\2004 às 2:00 PM;
}
function TfPrincipal.funcReadIniValue(PathIni: String; Raiz:String; Dados:String ): String;
begin
  { Estancio no tipo já criado o TIniFile com o nome do arquivo passado por parametro da função PathIni}
  IniFile :=TIniFile.Create(PathIni);
  try
    { Retorna o resultado da consulta no arquivo .INI}
    result := IniFile.ReadString(Raiz, Dados,'');
  finally
    { Libera a memoria do tipo IniFile }
    IniFile.Free;
  end;
end;
{
#FDES= Copia arquivos usando a barra de progresso;
#FRET= retorna verdadeiro ou falso;
#FPAR= PARAMETRO1= Fonte dos arquivos String List;
#FPAR= PARAMETRO2= Destino do Arquivo String List;
#FAUT= Victor Godoy Poluceno;
#FMOD= 29/09/2004 às 6:00 PM;
}
function TFPrincipal.CopyFileWithProgressBar1(Source, Destination: TStringList):Boolean;
var
  auxErro: String;
  auxString : String;
  i : integer;
  FromF, FromLenght,ToF: file of byte;
  Buffer: array[0..4096] of char;
  NumRead: integer;
  FileLength,FileLengthArq : longint;
begin
  result := TRUE;
  try
    begin
    { Tamanho de todos os arquivos juntos }
    for i := 0 to Source.Count-1 do
      begin
        auxString := Source[i];
        { Verifica a ocorrencia de erros e para a execução do programa }
        try
          begin
            AssignFile(FromLenght, auxString);
            reset(FromLenght);
           end;
        except
          on e: exception do
            begin
              Messagedlg('Não foi possível efetuar a atualização do sistema. Erro: arquivo ou caminho '+auxString+' não existe no servidor ou não possui permissões suficientes, verifique os arquivos de comparação (.INI).', mtError, [mbOk], 0);
              result := FALSE;
            end;
        end;
        FileLength := FileLength+FileSize(FromLenght);
        CloseFile(FromLenght);
      end;

      with Progressbar1 do
        begin
          Min := 0;
          Max := FileLength;
          while FileLength > 0 do
            begin
              FileLengthArq:=0;
              for i := 0 to Source.Count-1 do
                begin
                  auxString := Source[i];
                  AssignFile(FromF, auxString);
                  reset(FromF);
                  FileLengthArq := FileLengthArq + FileSize(FromF);
                  auxString :=  Destination[i];
                  { Verifica a ocorrencia de erros e para a execução do programa }
                  try
                    begin
                      AssignFile(ToF, auxString);
                      rewrite(ToF);
                    end;
                  except
                    on e: exception do
                      begin
                        Messagedlg('Não foi possível efetuar a atualização do sistema. Erro: arquivo ou caminho '+auxString+' não existe no computador local ou não possui permissões suficientes, verifique os arquivos de comparação (.INI).', mtError, [mbOk], 0);
                        result := FALSE;
                      end;
                  end;

                 while FileLengthArq > 0 do
                     begin
                       BlockRead(FromF, Buffer[0], SizeOf(Buffer), NumRead);
                       FileLength := FileLength - NumRead;
                       FileLengthArq := FileLengthArq - NumRead;
                       BlockWrite(ToF, Buffer[0], NumRead);
                       Position := Position + NumRead;
                     end;
                  CloseFile(FromF);
                  CloseFile(ToF);
                end;
            end;
        end;
      end; // end for
  except
    on e: exception do
       begin
         if  result = TRUE then
           begin
             Messagedlg('Não foi possível efetuar a atualização do sistema. Erro: copia de arquivos.', mtError, [mbOk], 0);
             result := FALSE;
           end;
       end;
  end;
end;

{
#PDES= Chama bmp utilizado de fundo na tela;
#PAUT= Victor Godoy Poluceno;
#PMOD= 16\08\2004 às 4:30 PM;
}
procedure TfPrincipal.FormPaint(Sender: TObject);
begin
  PapelParede(Sender);
end;

{
#PDES= Configura bmp utilizado de fundo na tela;
#PAUT= Victor Godoy Poluceno;
#PMOD= 16\08\2004 às 4:30 PM;
}
procedure TfPrincipal.PapelParede(Sender: TObject);
var
  nx, ny, PosX, PosY, n : Integer;
begin
  PosX := 0;
  PosY := 0;
  nx := 0;
  ny := 0;
  if MyBitmap = nil then Exit;

  if Sender is TForm then
  begin
    for n := 0 to TForm( Sender ).ComponentCount - 1 do
      if TForm( Sender ).Components[n] is TLabel then
        TLabel( TForm( Sender ).Components[n] ).Transparent := True;

    while ny < TForm( Sender ).Height do
    begin
      while nx < TForm( Sender ).Width do
      begin
        if Sender is TForm then
          TForm( Sender ).Canvas.Draw( PosX, PosY, MyBitmap );
        PosX := PosX + MyBitmap.Width;
        nx := PosX;
      end;
      PosY := PosY + MyBitmap.Height;
      ny := PosY;
      nx := 0;
      PosX := 0;
    end;
  end;

  if Sender is TImage then
  begin
    while ny < TImage( Sender ).Height do
    begin
      while nx < TImage( Sender ).Width do
      begin
        if Sender is TImage then
          TImage( Sender ).Canvas.Draw( PosX, PosY, MyBitmap );
        PosX := PosX + MyBitmap.Width;
        nx := PosX;
      end;
      PosY := PosY + MyBitmap.Height;
      ny := PosY;
      nx := 0;
      PosX := 0;
    end;
    TImage( Sender ).SendToBack;
  end;
end;

{
#FDES= Retorna versão do executável da string informada;
#FRET= String com a versão;
#FPAR= PARAMETRO1= String com o executável a ser analisado;
#FAUT= Marcelo Gonzaga;
#FMOD= 12\08\2004 às 7:00 PM;
}

function TfPrincipal.funGetBuildInfo(strVerModulo: String): String;
var
  VerInfoSize: DWORD;
  VerInfo: Pointer;
  VerValueSize: DWORD;
  VerValue: PVSFixedFileInfo;
  Dummy: DWORD;
  V1, V2, V3, V4: Word;
  Prog : String;
begin
  if not(FileExists(strVerModulo)) then
    begin
      result:='FALSE';
      exit;
    end;
  Prog := strVerModulo;
  VerInfoSize := GetFileVersionInfoSize(PChar(prog), Dummy);
  GetMem(VerInfo, VerInfoSize);
  GetFileVersionInfo(PChar(prog), 0, VerInfoSize, VerInfo);
  VerQueryValue(VerInfo, '\', Pointer(VerValue), VerValueSize);
  with VerValue^ do
    begin
      V1 := dwFileVersionMS shr 16;
      V2 := dwFileVersionMS and $FFFF;
      V3 := dwFileVersionLS shr 16;
      V4 := dwFileVersionLS and $FFFF;
    end;
  FreeMem(VerInfo, VerInfoSize);
  result := Copy (IntToStr (v1), 1, 4) + '.' +
  Copy (IntToStr (100 + v2), 3, 2) + '.' +
  Copy (IntToStr (100 + v3), 3, 2) + '.' +
  Copy (IntToStr (100 + v4), 3, 2);
end;

{
#PDES= Evento de criação do form;
#PAUT= Victor Godoy Poluceno;
#PMOD= 11\08\2004 às 1:30 PM;
}
function TfPrincipal.funcReadIniSection(strPathIni, strRaiz: String): TStringList;
var
  IniSection:TIniFile;
  strResult:TStringList;
begin
  strResult:=TStringList.Create;
  IniSection := TIniFile.Create(strPathIni);
  IniSection.ReadSectionValues(strRaiz, strResult);
  IniSection.Free;
  result := strResult;
end;

{
#FDES= Le o arquivo INI no servidor e local armazenando os valores lidos em uma STRINGLIST;
#FRET= True se o processo foi executado com sucesso, e FALSE caso aconteça algum erro;
#FAUT= Victor Godoy Polucno;
#FMOD= 28/09/2004 às 14:00 PM;
}
function TfPrincipal.funcReadIni: Boolean;
var
   i,j : integer;
begin
   result := TRUE;
   try
     strDllArqServ:= TStringList.Create();
     strDLLVerServ := TStringList.Create();
     strDllArqLocal:= TStringList.Create();
     strDLLVerLocal := TStringList.Create();
     auxString1:=funcReadIniValue(strPathIniServ,strRaizIniServ,strKeyIniServ);
     auxString2:=funcReadIniValue(strPathIniLocal,strRaizIniLocal,strKeyIniLocal);

     if not FileExists(strPathIniLocal) then
       begin
         Messagedlg('Não foi possível efetuar a atualização do sistema. Erro: arquivo de comparação local '+strPathIniLocal+' não foi econtrado.', mtWarning, [mbOk], 0);
         result := FALSE;
       end;

     if not FileExists(strPathIniServ) then
       begin
         Messagedlg('Não foi possível efetuar a atualização do sistema. Erro: o arquivo de comparação no servidor '+strPathIniServ+' não foi econtrado.', mtWarning, [mbOk], 0);
         result := FALSE;
       end;

     ReplaceStr(auxString1,'Serv');
     ReplaceStr(auxString2,'Local');
   except
     on e: exception do
       result := FALSE;
     end;
end;


function TfPrincipal.ReplaceStr(strLine, strType: String): string;
var
  i,k,j,intTotal,intCount,intPosKey,intPosSep: Integer;
  auxStr,auxStr2, strLinha: String;
begin
   strLinha := strLine;
   intCount:=0;
   intTotal:=Length(strLinha);
   for i := 0 to intTotal-1  do
      begin
         if strLinha[i] = ';' then
           begin
             intCount:= intCount+1;
           end;
      end;

      { COPIA para as StringLists os NOMES e as VERSÔES DOS ARQUIVOS}
      for j := 0 to intCount do
        begin
          intPosSep:=Pos(';',strLinha);
          if intPosSep = 0 then
            begin
              auxStr:=strLinha;
              strLinha:='';
            end
            else
              begin
                 auxStr:=Copy(strLinha,1,intPosSep-1);
                 Delete(strLinha,1,intPosSep); // Deleta, porque já peguei valor do 1º
              end;

          intPosSep:=Pos(',',auxStr);
          if intPosSep = 0 then
            begin
              if strType = 'Serv' then
                begin
                  strDllArqServ.Add(auxStr);
                  strDLLVerServ.Add('0');
                end
                else
                  if strType = 'Local' then
                    begin
                      strDllArqLocal.Add(auxStr);
                      strDLLVerLocal.Add('0');
                    end;
            end
            else
              begin
                if strType = 'Serv' then
                begin
                  auxStr2:=Copy(auxStr,1,intPosSep-1);
                  strDllArqServ.Add(auxStr2);
                  Delete(auxStr,1,intPosSep); // Deleta, porque já peguei valor do 1º
                  strDLLVerServ.Add(auxStr);
                end
                else
                  if strType = 'Local' then
                    begin
                      auxStr2:=Copy(auxStr,1,intPosSep-1);
                      strDllArqLocal.Add(auxStr2);
                      Delete(auxStr,1,intPosSep); // Deleta, porque já peguei valor do 1º
                      strDLLVerLocal.Add(auxStr);
                    end;
              end;
        end;
end;


{
#FDES= Escreve uma String em um arquivo do tipo INI;
#FRET= True se o processo foi executado com sucesso;
#FPAR= PARAMETRO1= String com o CAMINHO do arquivo a ser escrito;
#FPAR= PARAMETRO2= RAIZ do arquivo onde se econtra a CHAVE com o VALOR a ser alterado;
#FPAR= PARAMETRO3= CHAVE onde o valor será escrito;
#FPAR= PARAMETRO4= Valor a ser escrito na CHAVE;
#FAUT= Victor Godoy Polucno;
#FMOD= 28/09/2004 às 14:00 PM;
}
function TfPrincipal.funcWriteStringIni(strPathIni,strRaiz, strKey, strValue:String): Boolean;
begin
  { Estancia o tipo TIniFile com o nome do
    arquivo passado por parametro da função strPathIni}
  IniFile :=TIniFile.Create(strPathIni);
  try
    { Escreve uma String no ARQUIVO INI }
    IniFile.WriteString(strRaiz, strKey, strValue);
  finally
    { Libera a memoria do tipo IniFile }
    IniFile.Free;
    result := TRUE;
  end;
end;

procedure TfPrincipal.FormShow(Sender: TObject);
begin
  iniBitmap :=  funcReadIniValue('wmestre.ini','Configuracoes','Bitmap');
  MyBitmap := TBitmap.Create;
  MyBitmap.LoadFromFile(iniBitmap );
end;

procedure TfPrincipal.FormCreate(Sender: TObject);
begin
  Application.OnException := MostraErro;
end;

procedure TfPrincipal.MostraErro(Sender: TObject; E: Exception);
begin
   if Pos('Duplicate entry', E.Message) > 0 then
      Messagedlg('Cadastro Duplicado! O sistema detectou informações duplicadas neste cadastro.',mtError, [mbOk], 0)
   else
   Begin
      Application.CreateForm(Tfrm_Erro, frm_Erro);
      frm_erro.lbErro.Caption := E.Message;
      frm_Erro.ShowModal;
   End;

end;  { MostraErro }

end.

