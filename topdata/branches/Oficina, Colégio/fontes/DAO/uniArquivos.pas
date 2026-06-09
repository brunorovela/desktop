{*******************************************************}
{ }
{ Delphi Runtime Library }
{ Windows Messages and Types }
{ }
{ Copyright (c) 1991,96 Walter Alves Chagas Junior }
{ }
{*******************************************************}

unit uniArquivos;

interface

uses
Windows, Dialogs, Messages, SysUtils, Classes, Controls, StdCtrls,
Graphics, shellapi, Printers, Constantes, FileCtrl, StrUtils, Forms;

Procedure CopyFile( Const sourcefilename, targetfilename: String );
Procedure ZapFiles(vMasc:String);
procedure CriarArquivos(caminho: string);
procedure AddRegistro(Arquivo: string; Dados, registro: TStringList);

function fileSize(const FileName: String): LongInt;
function GetFileDate(TheFileName: string): string;
function FileDate(Arquivo: String): String;
function FillDir(Const AMask: string): TStringList;
function NumLinhasArq(Arqtexto:String): integer;
function FileCopy(source,dest: String): Boolean;
function ExtractName(const Filename: String): String;
function FileTypeName(const aFile: String): String;
function lerArquivo(nomeDoArquivo: String): TStringList;
function lerArquivoSIR (var x:vetSir ):Integer;
function lerArquivoHOR (var x:vetHor ):Integer;
function lerArquivoTPL (var x:vetTpl ):Integer;
function CaminhoArquivo():String;
function RemoveRegistro(Dados: TStringList; Arquivo, Valor: string): boolean;
function ExisteRegistro(Valor: string; Temps: TStringList): boolean;
function RemZeroEsquerda(valor: string): string;

var
  CaminhoDados: string;
implementation

function CaminhoArquivo():String;
var
  cam: string;
Begin
  cam := GetCurrentDir;
  cam := Copy(cam, 0, pos('Exemplos', cam)-1);
  if (not(DirectoryExists(cam))) then
  Begin
    cam := 'c:\BD_Exemplos\';
  end
  else
    cam := cam + 'Exemplos\Dados\';

  if (not(DirectoryExists(cam))) then
    CriarArquivos(cam);

  Result := cam;
end;

procedure CriarArquivos(caminho: string);
var
  i: Integer;
  arq: TextFile;
Begin
  ForceDirectories(caminho);

  //Horarios
  AssignFile(arq, caminho + 'Horarios.txt');
  Rewrite(arq);

  Write(arq, '//HorÃ¡rio;DiaDaSemana;Faixa;Hora;Minuto' + sLineBreak +
                     '1;1;1;8;0' + sLineBreak + '1;1;2;12;0' + sLineBreak +
                     '1;1;3;13;0' + sLineBreak + '1;1;4;18;0' + sLineBreak +
                     '1;2;1;8;0' + sLineBreak +  '1;2;2;12;0' + sLineBreak +
                     '1;2;3;13;0' + sLineBreak + '1;2;4;18;0' + sLineBreak +
                     '1;3;1;8;0' + sLineBreak +  '1;3;2;12;0' + sLineBreak +
                     '1;3;3;13;0' + sLineBreak + '1;3;4;18;0' + sLineBreak +
                     '1;4;1;8;0' + sLineBreak +  '1;4;2;12;0' + sLineBreak +
                     '1;4;3;13;0' + sLineBreak + '1;4;4;18;0' + sLineBreak +
                     '1;5;1;8;0' + sLineBreak +  '1;5;2;12;0' + sLineBreak +
                     '1;5;3;13;0' + sLineBreak + '1;5;4;18;0' + sLineBreak);
  Closefile(arq);

  //Sirene
  AssignFile(arq, caminho + 'Sirenes.txt');
  Rewrite(arq);

  Write(arq, '//Hora;Minuto;Segunda;Terca;Quarta;Quinta;Sexta;Sabado,DomingoFeriado' + sLineBreak +
                     '07;59;1;1;1;1;1;1;0' + sLineBreak +
                     '11;31;1;1;1;1;1;1;0' + sLineBreak +
                     '14;30;1;1;1;1;1;0;0' + sLineBreak +
                     '18;10;1;1;1;1;1;0;0');
  CloseFile(arq);

  //Templates
  AssignFile(arq, caminho + 'Templates.txt');
  Rewrite(arq);

  Write(arq, '//Cartão;IdBio;Template1;Template2;DataHoraCadastro' + sLineBreak +
                '14954;14954;'+
                '00000003BF47B77D581880A5B7FF495BE7F9321A5CCC65C210B0DF8B3082EAB'+
                '072B144AE61168EBC14F569DAB66C3ADFF918C337F2155FC3EF4BEDCFDB7FD5'+
                '8C457D850B41F6D9E13F4F3120D6722A86C17C2C920E94FB2D495AF160CDB7B'+
                '111D279162101C68B894F0FE9D1059D8624C2234AA649B2B13E6B1F0C71DD60'+
                '0FE38E6AB21192B2572865C1111D0FF9CC15FA7CA277C9E750156F54A9A26A3'+
                'B3F0234D50C7F3E3B1537A4606BD5FFBBB9DDA937FDD140179365545189C7E6'+
                'B68140E1540089B594C1ADDA6FD6AFF1F3E2A01FB2F8E42767068B97E17F158'+
                '1F5FD97779A2866DC017309C2F444198E3B9B23D5FA7A928D71E19899247ECF'+
                '0CCD225F7EF60349F10802A7B3F25FC9D7A35BB9626546AC35ACF43F6999441'+
                '77110364CE8E74901071D40E61CFDCC9F741F48106E838C9E5D3BFE58FCF1EA'+
                '11B7698956FFE0400D702E3DA69AC4FAD7D131EA2AA58ABDD673E39B2745584'+
                '126EA6C03A2CA359C504E25C6479E7C4D0D52F507BCD7F35CA352045003698B'+
                '4AAE1F79A94CAB6C9DF0707FF3BAACF4E34B080BCE89ACEAEC1D;'+
                '0000000319C77D14D2B4032521B72C8F10B154EF43790E7595D3B40E50B4A40'+
                '7D81D86A59ADA20936EF830E6A5DFDC9C1F78604A8B7FFE292E7EDEF028E468'+
                '2540842D6E1457A0F1E6A70ECA6CBCEA0BB637C59493846EDCEF02633820E64'+
                'D5E473A5F382D1CB9E4E865C6771979B11C06AB6FE6BCA652743C18555F77E0'+
                '27F1BEAFCA6ED7A3458B418DEED47F9140969AA104DBE38DFA3DA854571B3FC'+
                'B9DC88A1929FEF6F8B366D821AC961BA9D9413CA80C344A6AA170DF11E7486B'+
                '760E439371FB0A4A1AB745DB048D06BF8A9E7F6EB67BC282599E95F50D3E2C5'+
                'E174F6BF67D0D2E811040BA8FF61A18D9C7C3351AB911801838878CCF86383B'+
                '2B2403EB96A2166BA0AE114E4186495ED97B1000E654CF34C8F1E9FD2ED79CD'+
                '65E87FE6A5FB4ACD4B95BDD1528A2112CAF99FEB3A3E9F79C12FFF2BF5D379B'+
                '4C0BAC33E48008AAAC4E838A05B2FD11F8738F7BB391FE9DE29000F035CB622'+
                'CB3AC4DE1255E739E14FDFCCCF6EC73DEE3E048900A864D45091DEA62C939B6'+
                '3826CF8300FD64F94E66068800E1F6CF09EBB2C206592921EA15' + sLineBreak +
                '14956;14956;'+
                '00000003276E6EBA6DFCAEE2ABF292B6A7B901E5BC77E013AA23A012331F533'+
                '335AC76FF2103CFEC8B3DDC5AC00AFDF7D0418F93493BACF840F272E3DD1BDE'+
                '00734A83DCD2EC071FC254FD99B2B6F7C5CE57287045A79891FC16F282081BC'+
                '7679C26EDC5A93755DF73119063DE2719EDB985438E95B92068EDF3A7E9B639'+
                '4E004D1482ECAB5BC129D0F9DF62A2140CB8519F669A08F9EF34F0FD45D1E6A'+
                '03C54059681FF5BAAEE57F14F10046B3FB4BB2050568D244FA3E5512AD9C870'+
                'E2CB849C577137D9A5777B40D45009B133D61A31154409B1A3362277F30FD0B'+
                '3FEAFEE6AF329270958B92ED1AE83EF6BBA5692B710CB8907CF8ECE8C308AF3'+
                '229CFC5C66E90729A03167BE0F1691BEF21390E4B14D1D466E4BC72F84B48AB'+
                'A987D391387A04628C6EF75D22D01546AAF39E55BB9AED2DE6674FD0D2B0CFC'+
                '14637247C230BC09FD3A92A56C0F7594197BE3F825668E4BF4505B1128EE7CF'+
                '240FC3659F7CF862453CFF9B4C2E15FC7976F801C3023631918B7EDF0AC4D1B'+
                'D4A05586782D926EB4BAB33CDB7AE00D4BA821EC1979F462B8D5;'+
                '00000003570960F91F5FFEF0A0D89B43D054198A86E60ACA57E478B73DFDB7B'+
                'F4B37179ECD2F6BCE19886B941BE0CC1E78D7E4288A58727EC8772B19F99076'+
                'FE17069E7544C294C54A70BFF2D78D55D6E0CD72C667DB645844E87BE95F334'+
                '60E41FAF4C9061BE942655069BE4D6E679307741EA54E9DBA559AFCE359D048'+
                '904AD6AD2BE4626F8E68D91D86E299382ECFD04280ECBD075489D32716C3DA9'+
                '64F148CDBE536AB108ECA01B9DAB955DC420D2ACF36234848F12FE3D0808938'+
                'D5896096DEEBF4C39EF5D4956A90EF7884E4618AC57F190FD55138AE1897ED7'+
                '8211C2A0DA99709B0D9761D69C9E25C71DF6D82EC02F5D003FA3FC8143F5F8C'+
                '35470459D5DD2111CC2EEC0ED5465234B99F1F6195328598A1983E20C1EC5F4'+
                '0C84B69C11499CB8D75EFA1E68B4015CEC7A5687E3180ABA99E55EF23468474'+
                '5B4D91C6D022CEE752FA3265EEB48F851399291E42C9616ED80C8699BB04AA2'+
                'CB3F2E48997F993B340EC07CBE52D03966794BDDA6A34C3AA465D8274C8BE47'+
                'CD2FDD2C8BD17443AA9ACA1C9513F2D33DAF0118E59CF0F6442D');

  CloseFile(arq);

  //usuarios sem digital
  AssignFile(arq, caminho + 'UsuariosSD.txt');
  Rewrite(arq);

  Write(arq, '//Cartão;SemVerificaçãoDigital' + sLineBreak +
                '1;1' + sLineBreak +
                '187;1' + sLineBreak +
                '2;1' + sLineBreak +
                '123;1' + sLineBreak +
                '123456;1');
                
  CloseFile(arq);
end;

function fileSize(const FileName: String): LongInt;
{Retorna o tamanho de um arquivo}
var
  SearchRec : TSearchRec;
begin { !Win32! -> GetFileSize }
  if FindFirst(FileName,faAnyFile,SearchRec)=0
  then Result:=SearchRec.Size
  else Result:=0;
  FindClose(SearchRec);
end;

function GetFileDate(TheFileName: string): string;
var
FHandle: integer;
begin
FHandle := FileOpen(TheFileName, 0);
result := DateToStr((FileDateToDateTime(FileGetDate(FHandle))));
FileClose(FHandle);
end;

function FileDate(Arquivo: String): String;
{Retorna a data e a hora de um arquivo}
var
FHandle: integer;
begin
if not fileexists(Arquivo) then
  begin
  Result := 'Nome de Arquivo Inválido';
  end
else
  begin
  FHandle := FileOpen(Arquivo, 0);
  try
  Result := DateTimeToStr(FileDateToDateTime(FileGetDate(FHandle)));
  finally
  FileClose(FHandle);
  end;
  end;
end;

Procedure ZapFiles(vMasc:String);
{Apaga arquivos usando mascaras tipo: *.zip, *.* }
Var Dir : TsearchRec;
  Erro: Integer;
Begin
  Erro := FindFirst(vMasc,faArchive,Dir);
  While Erro = 0 do Begin
  DeleteFile( ExtractFilePAth(vMasc)+Dir.Name );
  Erro := FindNext(Dir);
  End;
  FindClose(Dir);
End;

function FillDir(Const AMask: string): TStringList;
{Retorna uma TStringlist de todos os arquivos localizados
 no path corrente , Esta função trabalha com mascaras}
var
  SearchRec : TSearchRec;
  intControl : integer;
begin
  Result := TStringList.create;
  intControl := FindFirst( AMask, faAnyFile, SearchRec );
  if intControl = 0 then
  begin
  while (intControl = 0) do
  begin
  Result.Add( SearchRec.Name );
  intControl := FindNext( SearchRec );
  end;
  FindClose( SearchRec );
  end;
end;

function NumLinhasArq(Arqtexto:String): integer;
// Retorna o número de linhas que um arquivo possui
Var
  f: Textfile;
  linha, cont:integer;
Begin
linha := 0;
cont := 0;
AssignFile(f, Arqtexto);
Reset(f);
While not eof(f) Do
  begin
  ReadLn(f);
  Cont := Cont + 1;
  end;
Closefile(f);
result := cont;
end;

function FileCopy(source,dest: String): Boolean;
{copia um arquivo de um lugar para outro. Retornando falso em caso de erro}
var
fSrc,fDst,len: Integer;
size: Longint;
buffer: packed array [0..2047] of Byte;
begin
if source <> dest then
  begin
  fSrc := FileOpen(source,fmOpenRead);
  if fSrc >= 0 then
  begin
  size := FileSeek(fSrc,0,2);
  FileSeek(fSrc,0,0);
  fDst := FileCreate(dest);
  if fDst >= 0 then
  begin
  while size > 0 do
  begin
  len := FileRead(fSrc,buffer,sizeof(buffer));
  FileWrite(fDst,buffer,len);
  size := size - len;
  end;
  FileSetDate(fDst, FileGetDate(fSrc));
  FileClose(fDst);
  FileSetAttr(dest, FileGetAttr(source));
  Result := True;
  end
  else
  begin
  Result := False;
  end;
  FileClose(fSrc);
  end;
  end;
end;
 
Procedure CopyFile( Const sourcefilename, targetfilename: String );
{Copia um arquivo de um lugar para outro}
Var
  S, T: TFileStream;
Begin
  S := TFileStream.Create( sourcefilename, fmOpenRead );
  try
  T := TFileStream.Create( targetfilename, fmOpenWrite or fmCreate );
  try
  T.CopyFrom(S, S.Size ) ;
  finally
  T.Free;
  end;
  finally
  S.Free;
  end;
end;

function ExtractName(const Filename: String): String;
{Retorna o nome do Arquivo sem extensão}
var
aExt : String;
aPos : Integer;
begin
aExt := ExtractFileExt(Filename);
Result := ExtractFileName(Filename);
if aExt <> '' then
  begin
  aPos := Pos(aExt,Result);
  if aPos > 0 then
  begin
  Delete(Result,aPos,Length(aExt));
  end;
  end;
end;
 
function FileTypeName(const aFile: String): String;
{Retorna descrição do tipo do arquivo. Requer a unit ShellApi}
var
  aInfo: TSHFileInfo;
begin
  if SHGetFileInfo(PChar(aFile),0,aInfo,Sizeof(aInfo),SHGFI_TYPENAME)<>0 then
  Result := StrPas(aInfo.szTypeName)
  else begin
  Result := ExtractFileExt(aFile);
  Delete(Result,1,1);
  Result := Result +' File';
  end;
end;
 
{function PrintImage(Origem: String):Boolean;
// imprime um bitmap selecionado retornando falso em caso negativo
// requer as units Graphics e printers declaradas na clausula Uses
var
Imagem: TBitmap;
begin
if fileExists(Origem) then
  begin
  Imagem := TBitmap.Create;
  Imagem.LoadFromFile(Origem);
  with Printer do
  begin
  BeginDoc;
  Canvas.Draw((PageWidth - Imagem.Width) div 2,(PageHeight - Imagem.Height) div 2,Imagem);
  EndDoc;
  end;
  Imagem.Free;
  Result := True;
  end
else
  begin
  Result := False;
  end;
end;   }

function lerArquivo(nomeDoArquivo: String): TStringList;
var arq: TextFile;
i, tot, pos: Integer;
dados: TStringList;
linha: string;
begin
      if (CaminhoDados = '') then
        CaminhoDados := CaminhoArquivo();

      dados := TStringList.Create;

      if (FileExists(CaminhoDados + nomeDoArquivo + '.txt')) then
      Begin
        AssignFile (arq, CaminhoDados + nomeDoArquivo + '.txt');
        Reset (arq);
        while not Eof (arq) do
        begin
            { Processe a linha lida aqui. }
            { Para particionar a linha lida em pedaços, use a função Copy. }
            ReadLn (arq, linha);
            if (linha <> '') then
              dados.Add(linha);
        end;
        CloseFile ( arq );
        lerArquivo := dados;
      end
      else
        lerArquivo := dados;
end;

procedure AddRegistro(Arquivo: string; Dados, registro: TStringList);
var
  arq: TextFile;
  i: integer;
Begin
  Dados.Add('//CartÃ£o;IdBio;Template1;Template2;DataHoraCadastro');
  For i := 0 to registro.Count-1 do
  Begin
    Dados.Add(registro[i]);
  end;
  AssignFile(arq, CaminhoDados + Arquivo + '.txt');
  Rewrite(arq);
  For i := 0 to Dados.Count-1 do
  Begin
    Writeln(arq, Dados[i]);
  end;
  CloseFile(arq);
end;

function ExisteRegistro(Valor: string; Temps: TStringList): boolean;
var
  ret: boolean;
  TamValor, TamDado, i, x: Integer;
Begin
  ret := false;
  Valor := RemZeroEsquerda(Valor);
  TamValor := Length(Valor);
  For i := 1 to Temps.Count-1 do
  Begin
    TamDado := 0;
    x := 1;
    while (copy(Temps[i], x, 1) <> ';') do
    Begin
      TamDado := TamDado +1;
      x := x +1;
    end;
    If (TamDado = TamValor) then
        If (copy(Temps[i], 0, TamDado) = Valor) then
          ret := true;
  end;
  Result := ret;
end;

function RemoveRegistro(Dados: TStringList; Arquivo, Valor: string): boolean;
var
  DadoRemovido: Boolean;
  i: Integer;
  arq: TextFile;
Begin
  if (CaminhoDados = '') then
    CaminhoDados := CaminhoArquivo();

  AssignFile(arq, CaminhoDados + Arquivo + '.txt');
  Rewrite(arq);

  for i := 0 to Dados.Count -1 do
  begin
    if (Copy(Dados[i], 0, Length(Valor)) <> Valor) then
      Writeln(arq, Dados[i])
    else
      DadoRemovido := true;

  end;
  Closefile(arq);
end;

function RemZeroEsquerda(valor: string): string;
var
  blnNum : boolean;
  str    : string;
  i      : integer;
Begin
  blnNum := false;
  for i := 0 to Length(valor) do
  Begin

    if (Copy(valor, i, 1) <> '0') then
      blnNum := true;

    if (blnNum) then
      str := str + Copy(valor, i, 1);
  end;
  Result := str;
end;

function lerArquivoHOR (var x:vetHor ):Integer;
var arq: TextFile;
nomeDoArquivo,linha, path: String;
i, numLinhas, tot, po: Integer;
tHor:typeHorario;
iP1,iP2:integer;
begin
  if (CaminhoDados = '') then
     CaminhoDados := CaminhoArquivo();

  path := CaminhoDados;
  path := path + 'Horarios.txt';

  if (FileExists(path)) then
  Begin

    nomeDoArquivo := path;
    AssignFile ( arq, nomeDoArquivo );
    numLinhas := NumLinhasArq(nomeDoArquivo);
    SetLength (x,numLinhas);
    Reset ( arq );
    ReadLn ( arq, linha );
    for i:=0 to numLinhas do
    begin
        { Processe a linha lida aqui. }
        { Para particionar a linha lida em pedaços, use a função Copy. }

        ReadLn ( arq, linha);

        if(pos(';',linha)>0) then begin
              ip1:=1;
              ip2:= pos(';',copy(linha,ip1,length(linha)-ip1));//2;101;0
              tHor.Horario :=strtoint(copy(linha,ip1,ip2-1));

              ip1:= ip1+ip2;
              ip2:= pos(';',copy(linha,ip1,length(linha)-ip1));//2;101;0
              tHor.DiaDaSemana:=strtoint(copy(linha,ip1,ip2-1));

              ip1:= ip1+ip2;
              ip2:= pos(';',copy(linha,ip1,length(linha)-ip1));
              tHor.Faixa:=StrToInt(copy(linha,ip1,ip2-1));

              ip1:= ip1+ip2;
              ip2:= pos(';',copy(linha,ip1,length(linha)-ip1));
              tHor.Hora:=StrToInt(copy(linha,ip1,ip2-1));

              ip1:= ip1+ip2;
              tHor.Minuto:=StrToInt(copy(linha,ip1,ip2-1));

              x[i]:=tHor;
        end;

    end;
    CloseFile ( arq );
    result:= numLinhas;
  end
  else
  Begin
    MessageDlg('Arquivo de horários não localizado no caminho: ' + path, mtWarning, [mbOk], 0);
    Result := 0;
  end;
end;

function lerArquivoTPL (var x:vetTpl ):Integer;
var arq: TextFile;
nomeDoArquivo, linha, path: String;
i, numLinhas, tot, po: Integer;
tTpl:typeTemplate;
iP1,iP2:integer;
begin

  if (CaminhoDados = '') then
    CaminhoDados := CaminhoArquivo();

  path := CaminhoDados;

  path := path + 'Templates.txt';

  if (FileExists(path)) then
  Begin

    nomeDoArquivo := path;
    AssignFile ( arq, nomeDoArquivo );
    numLinhas := NumLinhasArq(nomeDoArquivo);
    SetLength (x,numLinhas);
    Reset ( arq );
    ReadLn ( arq, linha );
    for i:=0 to numLinhas do
    begin
        { Processe a linha lida aqui. }
        { Para particionar a linha lida em pedaços, use a função Copy. }

        ReadLn ( arq, linha);
        if(pos(';',linha)>0) then begin
              ip1:=1;
              ip2:= pos(';',linha);//2;2;101;0
              tTpl.Cartao:=copy(linha,ip1,ip2-1);

              ip1:= ip1+ip2;
              ip2:= pos(';',copy(linha,ip1,length(linha)-ip1));//2;101;0
              tTpl.IdBio:=copy(linha,ip1,ip2-1);

              ip1:= ip1+ip2;
              ip2:= pos(';',copy(linha,ip1,length(linha)-ip1));
              tTpl.Template1:=copy(linha,ip1,ip2-1);


              ip1:= ip1+ip2;
              ip2:= pos(';',copy(linha,ip1,length(linha)-ip1));

              if(ip2 = 0) then
              begin
                tTpl.Template2:=copy(linha,ip1,length(linha)-ip1);
                tTpl.DataHoraCadastro:=DateTimeToStr(Now);
              end
              else begin
                tTpl.Template2:=copy(linha,ip1,ip2-1);
                ip1:= ip1+ip2;
                tTpl.DataHoraCadastro:=copy(linha,ip1,1);
              end;
              x[i]:=tTpl;
        end;
    end;
    CloseFile ( arq );
    result:= numLinhas;
  end
  else
  Begin
    MessageDlg('Arquivo de templates não localizado no caminho: ' + path, mtWarning, [mbOk], 0);
    Result := 0;
  end;
end;


function lerArquivoSIR (var x:vetSir ):Integer;
var arq: TextFile;
nomeDoArquivo, linha, path: String;
i, numLinhas, tot: Integer;
tSir:typeSirene;
iP1,iP2:integer;
begin
  if (CaminhoDados = '') then
    CaminhoDados := CaminhoArquivo();

  path := CaminhoDados;
  path := path + 'Sirenes.txt';

  if (FileExists(path)) then
  Begin

    nomeDoArquivo := path;
    AssignFile ( arq, nomeDoArquivo );
    numLinhas := NumLinhasArq(nomeDoArquivo);
    SetLength (x,numLinhas);
    Reset ( arq );
    ReadLn ( arq, linha );
    for i:=0 to numLinhas do
    begin
        { Processe a linha lida aqui. }
        { Para particionar a linha lida em pedaços, use a função Copy. }

        ReadLn ( arq, linha);
        if(pos(';',linha)>0) then begin
              ip1:=1;
              ip2:= pos(';',linha);//2;2;101;0
              tSir.Hora:=strtoint(copy(linha,ip1,ip2-1));

              ip1:= ip1+ip2;
              ip2:= pos(';',copy(linha,ip1,length(linha)-ip1));//2;101;0
              tsir.Minuto:=strtoint( copy(linha,ip1,ip2-1));

              ip1:= ip1+ip2;
              ip2:= pos(';',copy(linha,ip1,length(linha)-ip1));
              tSir.Segunda:=StrToInt(copy(linha,ip1,ip2-1));

              ip1:= ip1+ip2;
              ip2:= pos(';',copy(linha,ip1,length(linha)-ip1));
              tSir.Terca:=StrToInt(copy(linha,ip1,ip2-1));

                            ip1:= ip1+ip2;
              ip2:= pos(';',copy(linha,ip1,length(linha)-ip1));
              tSir.Quarta:=StrToInt(copy(linha,ip1,ip2-1));

                            ip1:= ip1+ip2;
              ip2:= pos(';',copy(linha,ip1,length(linha)-ip1));
              tSir.Quinta:=StrToInt(copy(linha,ip1,ip2-1));

                            ip1:= ip1+ip2;
              ip2:= pos(';',copy(linha,ip1,length(linha)-ip1));
              tSir.Sexta:=StrToInt(copy(linha,ip1,ip2-1));

                            ip1:= ip1+ip2;
              ip2:= pos(';',copy(linha,ip1,length(linha)-ip1));
              tSir.Sabado:=StrToInt(copy(linha,ip1,ip2-1));

              ip1:= ip1+ip2;
              tSir.DomingoFeriado:=StrToInt(copy(linha,ip1,ip2-1));
              x[i]:=tSir;
        end;

    end;
    CloseFile ( arq );
    result:= numLinhas;
  end
  else
  Begin
    MessageDlg('Arquivo de sirenes não localizado no caminho: ' + path, mtWarning, [mbOk], 0);
    Result := 0;
  end;
end;

end.
