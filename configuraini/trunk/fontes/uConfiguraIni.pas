unit uConfiguraIni;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, IniFiles, jpeg, ExtCtrls, Buttons, DB, ZAbstractRODataset,
  ZAbstractDataset, UZDataset, ZConnection;

type
  TfrmAtualiza = class(TForm)
    Image1: TImage;
    bbAtualizar: TBitBtn;
    Label1: TLabel;
    ZConnection1: TZConnection;
    procedure bbAtualizarClick(Sender: TObject);
  private
    function verificaConexaoStart( HostName: String; Porta: Integer ): Boolean;
  public
    { Public declarations }
  end;

var
  frmAtualiza: TfrmAtualiza;

implementation

{$R *.dfm}

procedure TfrmAtualiza.bbAtualizarClick(Sender: TObject);
var
   configuracao, iniWMestre: TIniFile;
   strWindows, strPrograma: String;
   Buffer: array[0..144] of Char;
   sessoes: TStringList;
   i: Integer;
   qryVerificaConexao: TUMZQuery;
begin
   {
      Este executável altera o unimestre.ini do cliente para que funcione
      a segurança do banco de dados, a máquina do cliente irá conectar/atualizar
      usando o usuário umstart NO banco de dados umstart.
   }

   GetWindowsDirectory(Buffer,144);
   strWindows := (StrPas(Buffer));

   iniWMestre := TIniFile.Create(strWindows + '\WMESTRE.INI' );
   
   strPrograma := iniWMestre.ReadString( 'Configuracoes', 'Programa', ExtractFilePath(Application.ExeName))+'unimestre.ini';

   if FileExists(strPrograma) then
   begin
      configuracao := TIniFile.Create(strPrograma);
   end
   else
   begin
      configuracao := TIniFile.Create('C:\unimestre\programas\unimestre.ini');
   end;

   if not verificaConexaoStart(configuracao.ReadString('Conexao', 'Servidor', ''), configuracao.ReadInteger('Conexao', 'Porta', 3306)) then
   begin
      ShowMessage('Não foi possível estabelecer conexão com seu banco de dados umstart');
      Exit;
   end;

   configuracao.WriteString('Conexao', 'Usa.Start', '1');
   configuracao.WriteString('Conexao', 'Usuario', 'umstart');
   configuracao.WriteString('Conexao', 'Senha', '87B25FC170E61D28ED60928B8E');

   configuracao.WriteString('Atualiza', 'Notifica.erros', '1');
   configuracao.WriteString('Atualiza', 'Banco', 'mysql');
   configuracao.WriteString('Atualiza', 'Usuario', 'umstart');
   configuracao.WriteString('Atualiza', 'Usa.Start', '1');
   configuracao.WriteString('Atualiza', 'Senha', '87B25FC170E61D28ED60928B8E');

   configuracao.WriteString('Conexao.docs', 'Usuario', 'umstart');
   configuracao.WriteString('Conexao.docs', 'Senha', '87B25FC170E61D28ED60928B8E');
   configuracao.WriteString('Conexao.docs', 'Usa.Start', '1');

   ShowMessage('Seus dados foram atualizados com sucesso!');

   FreeAndNil(configuracao);

   if FileExists('C:\unimestre\programas\2.0\unimestre.ini') then
   begin
      configuracao := TIniFile.Create('C:\unimestre\programas\2.0\unimestre.ini');

      sessoes := TStringList.Create;

      configuracao.ReadSections(sessoes);

      // Começo do 4 para só pegar os perfis de conexão
      for i := 0 to sessoes.Count - 1 do
      begin
      
         if (sessoes[i] <> 'SISTEMA') and (Pos('PERFIL.' ,sessoes[i]) = 0) then
         begin
            configuracao.WriteString(sessoes[i], 'Conexao.Senha', '87B25FC170E61D28ED60928B8E');
            configuracao.WriteString(sessoes[i], 'Conexao.Usuario', 'umstart');
            configuracao.WriteString(sessoes[i], 'Usa.Start', '1');
         end;
      end;

      ShowMessage('Os dados da biblioteca foram atualizados com sucesso!');
      
   end
   else
   begin
      ShowMessage('Não foi possível encontrar o executável '+
         'da biblioteca para configuracao');
   end;
   

   FreeAndNil(configuracao);
end;

function TfrmAtualiza.verificaConexaoStart(HostName: String; Porta: Integer): Boolean;
begin
   ZConnection1.HostName := HostName;
   ZConnection1.Port := Porta;
   ZConnection1.User := 'umstart';
   ZConnection1.Protocol := 'mysql-5';
   ZConnection1.Database := 'umstart';
   ZConnection1.Password := 'dW1zdGFydA==';

   // Teste

   try
      ZConnection1.Connect;
   except on E: Exception do
   end;

   Result := ZConnection1.Connected;
end;

end.
