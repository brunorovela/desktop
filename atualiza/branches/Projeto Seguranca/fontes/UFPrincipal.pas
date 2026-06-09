unit UFPrincipal;

interface

uses
   Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
   Dialogs, xmldom, XMLIntf, msxmldom, XMLDoc, ZSqlProcessor, StrUtils, DB,
   ZAbstractRODataset, ZAbstractDataset, UZDataset, ComCtrls, ExtCtrls,
   ZSqlUpdate, Buttons, ZDbcIntfs, StdCtrls;

type
   TfPrincipal = class(TForm)
      odlgUnm: TOpenDialog;
      xmlAtualiza: TXMLDocument;
      sqlAtualiza: TZSQLProcessor;
      qryAtualizacoes: TUMZQuery;
      qryComandos: TUMZQuery;
      qryComandosNR_COMANDO: TLargeintField;
      qryComandosCD_ATUALIZACAO: TStringField;
      qryComandosSN_SUCESSO: TSmallintField;
      qryComandosTX_CONTEUDO: TMemoField;
      qryComandosDT_EXECUCAO: TDateTimeField;
      qryComandosTX_ERRO: TMemoField;
      stbInfos: TStatusBar;
      pnlGeral: TPanel;
      prbArquivo: TProgressBar;
      prbComandos: TProgressBar;
      bvlSep1: TBevel;
      qryBuscaAtualizacao: TUMZReadOnlyQuery;
      qryBuscaAtualizacaoCD_ATUALIZACAO: TStringField;
      qryAtualizacoesCD_ATUALIZACAO: TStringField;
      qryAtualizacoesSN_COMPLETO: TSmallintField;
      updComandos: TZUpdateSQL;
      sbServidor: TSpeedButton;
      sbBanco: TSpeedButton;
      sbVersao: TSpeedButton;
      sqlInstall: TZSQLProcessor;
      Label1: TLabel;
      procedure FormClose(Sender: TObject; var Action: TCloseAction);
      procedure FormActivate(Sender: TObject);
      procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
      procedure sqlAtualizaAfterExecute(Processor: TZSQLProcessor;
            StatementIndex: Integer);
      procedure stbInfosDrawPanel(StatusBar: TStatusBar; Panel: TStatusPanel;
            const Rect: TRect);
      procedure FormCreate(Sender: TObject);
      procedure sqlAtualizaBeforeExecute(Processor: TZSQLProcessor;
            StatementIndex: Integer);
      procedure sqlAtualizaError(Processor: TZSQLProcessor;
            StatementIndex: Integer; E: Exception;
      var ErrorHandleAction: TZErrorHandleAction);
   private
      FSilent: Boolean;
      FForce: Boolean;
      FSilentAuth: Boolean;
      FFilePath: TFileName;
      FCurrCode: string;

      function GetFileStream: TStringStream;
      
      function IsSilentAuth: Boolean;

      ///   <summary>Verifica se a atualização informada já foi executada na
      ///   base de dados</summary>
      ///
      ///   <param name="Code">Chave única de identificação do Script de
      ///   atualização que será procurado no banco de dados</param>
      ///
      ///   <returns>Retorna <c>True</c> se o comando já foi executado na base
      ///   de dados ou <c>False</c> caso contrário</returns>
      function ExecutedCommand(const Code: string): Boolean;

      ///   <summary>Procura na linha informada definição do delimitador do
      ///   Script SQL</summary>
      ///
      ///   <param name="Line">Primeira linha do Script SQL, na qual deve estar
      ///   definido o delimitador</param>
      ///   <param name="Found">Variável que indica se uma definição para
      ///   delimitador foi encontrada na linha específica, sendo seu valor
      ///   <c>True</c> se encontrado ou <c>False</c> caso contrário</param>
      ///
      ///   <returns>Retorna o valor do delimitador encontrado</returns>
      function FindDelimiter(Line: string; out Found: Boolean): string;

      ///   <summary>Verifica se o protocolo do Script é suportado pelo banco
      ///   de dados ao qual o aplicativo está conectado</summary>
      ///
      ///   <param name="Protocol">Nome do protocolo do Script que será
      ///   comparado ao protocolo da conexão</param>
      ///
      ///   <returns>Retorna o valor lógico <c>True</c> se o protocolo é
      ///   suportado pelo banco de dados ou <c>False</c> caso contrário
      ///   </returns>
      function ValidProtocol(const Protocol: string): Boolean;

      ///   <summary>Este método verifica se o banco de dados do cliente já foi
      ///   atualizada em outra ocasião utilizada esta versão do atualizador do
      ///   banco de dados. Se é a primeira execução então cria as tabelas
      ///   necessárias e importa as atualizações da versão anterior</summary>
      procedure ImportSetupData;
      
      ///   <summary>Inicializa o processamento do arquivo de atualização
      ///   selecionado pelo usuário ou passado como argumento à aplicação
      ///   </summary>
      procedure Process;
      
      ///   <summary>Processa os arqgumentos enviados a aplicação para definir
      ///   o comportamento do processamento do atualizador</summary>
      procedure ProcessArguments;

      ///   <summary>Realiza o processamento de um Script de atualização
      ///   executando cada um dos comandos que compõem o Script</summary>
      ///
      ///   <param name="Code">Chave de identificação do Script de atualização
      ///   no controle de atualizações</param>
      ///   <param name="SQL">Script SQL que deve ser executado</param>
      procedure ProcessCommand(const Code, SQL: string);

      ///   <summary>Processa o conteúdo do arquivo de atualização</summary>
      procedure ProcessFile;

      procedure ChangePasswords;
   public
      ds_login : string;
      ds_senha : string;
      speed_process : Boolean;


      ///   <summary>Carrega o arquivo de atualização que será processado
      ///   </summary>
      ///
      ///   <returns>Retorna valor lógico <c>True</c> se o arquivo de
      ///   atualização foi carregado ou <c>False</c> caso contrário</returns>
      function LoadFile: Boolean;

      property SilentAuth: Boolean read IsSilentAuth;
   end;

var
   fPrincipal: TfPrincipal;

implementation

uses
   UDM, UDMNotify, UFunctions;

{$R *.dfm}

{ TfPrincipal }

procedure TfPrincipal.ChangePasswords;
var
   Node: IXMLNode;
   User, Pass, Key, ClientKey: string;
begin
   if DM.CanChangePassword then
   begin
      Node := xmlAtualiza.DocumentElement.ChildNodes.FindNode('senhas');

      if Node <> nil then
      begin

         Node := Node.ChildNodes.First;
         while Node <> nil do
         begin
            ClientKey := Node.Attributes['chave'];
            User := Node.Attributes['usuario'];
            Pass := Node.ChildValues['senha'];
            Key := Node.ChildValues['chave'];
            DM.ChangePassword(User, Pass, Key, ClientKey);
            Node := Node.NextSibling;
         end;

         DM.connMySQL.ExecuteDirect('FLUSH PRIVILEGES');   
      end;
   end;
end;

function TfPrincipal.ExecutedCommand(const Code: string): Boolean;
begin
   qryBuscaAtualizacao.Close;
   qryBuscaAtualizacao.ParamByName('CD_ATUALIZACAO').AsString := Code;
   qryBuscaAtualizacao.Open;
   Result := not qryBuscaAtualizacao.IsEmpty;
   qryBuscaAtualizacao.Close;
end;

function TfPrincipal.FindDelimiter(Line: string; out Found: Boolean): string;
begin
   Line := Trim(Line);
   if AnsiUpperCase(LeftStr(Line, 9)) = 'DELIMITER' then
   begin
      Result := Copy(Line, 11, Length(Line));
      Found := True;
   end
   else
   begin
      Result := #59; // ;
      Found := False;
   end;
end;

procedure TfPrincipal.FormActivate(Sender: TObject);
begin
   Process;
end;

procedure TfPrincipal.FormClose(Sender: TObject; var Action: TCloseAction);
begin
   Action := caFree;
end;

procedure TfPrincipal.FormCloseQuery(Sender: TObject; var CanClose: Boolean);
begin
   CanClose := False;
end;

procedure TfPrincipal.FormCreate(Sender: TObject);
begin
   sbServidor.Parent := stbInfos;
   sbBanco.Parent := stbInfos;
   sbVersao.Parent := stbInfos;
   
   sbServidor.Caption := Format('%s:%d', [DM.connUnimestre.HostName, DM.connUnimestre.Port]);
   sbBanco.Caption := DM.connUnimestre.Database;
   sbVersao.Caption := GetAppVersion;
   
   ProcessArguments;

   FSilentAuth := False;

   Application.NormalizeTopMosts;
   SetWindowPos(Handle, HWND_TOPMOST, 0, 0, 0, 0,
      SWP_NOACTIVATE or SWP_NOMOVE or SWP_NOSIZE);
end;

function TfPrincipal.GetFileStream: TStringStream;
const
   SHeader = 'UNIMESTE - SISTEMA INTEGRADO DE GESTãO EDUCACIONAL';
var
   FileContent: TStringList;
   Header, Key, Content: string;
begin
   FileContent := TStringList.Create;
   try
      FileContent.LoadFromFile(FFilePath);
      if FileContent.Count = 3 then
      begin
         Header := FileContent.Strings[0];
         Key := FileContent.Strings[1];
         Content := FileContent.Strings[2];
         if EncodedStr(Header) and EncodedStr(Key) then
         begin
            Header := Decrypt(Header);
            if UpperCase(Header) = SHeader then
            begin
               Content := Decrypt(Content, Key);
               Result := TStringStream.Create(Content);
               FSilentAuth := True;
            end
            else
               Result := TStringStream.Create(Content);
         end
         else
            Result := TStringStream.Create(FileContent.Text);
      end
      else
         Result := TStringStream.Create(FileContent.Text);
   finally
      FileContent.Free;
   end;
end;

procedure TfPrincipal.ImportSetupData;
const
   SSQLSearchTable = 'SHOW TABLES FROM %s LIKE ?';
var
   Statement: IZPreparedStatement;
   ResultSet: IZResultSet;
   HasUpdatesTable, HasCommandsTable: Boolean;
begin
   Statement := DM.PrepareStatement(Format(SSQLSearchTable, [DM.connUnimestre.Database]));
   
   try
      Statement.SetString(1, 'ATU_ATUALIZACOES');
      ResultSet := Statement.ExecuteQueryPrepared;
      try
         HasUpdatesTable := ResultSet.Next;
      finally
         ResultSet.Close;
      end;
   finally
      Statement.Close;
   end;

   try
      Statement.SetString(1, 'ATU_COMANDOS');
      ResultSet := Statement.ExecuteQueryPrepared;
      try
         HasCommandsTable := ResultSet.Next;
      finally
         ResultSet.Close;
      end;
   finally
      Statement.Close;
   end;

   if not (HasUpdatesTable and HasCommandsTable) then
   begin
      sqlInstall.Parse;
      
      if not HasUpdatesTable then
         DM.CreateStatement.Execute(sqlInstall.Statements[0]);

      if not HasCommandsTable then
      begin
         DM.CreateStatement.Execute(sqlInstall.Statements[1]);
         DM.CreateStatement.Execute(sqlInstall.Statements[2]);
         DM.CreateStatement.Execute(sqlInstall.Statements[3]);
      end;
   end;
end;

function TfPrincipal.IsSilentAuth: Boolean;
begin
   Result := FSilentAuth;
end;

function TfPrincipal.LoadFile: Boolean;
var
   FileSelected: Boolean;
begin
   FileSelected := FileExists(FFilePath);

   if FileSelected or odlgUnm.Execute then
   begin
      Result := True;
      
      if not FileSelected then
         FFilePath := odlgUnm.FileName;

      xmlAtualiza.LoadFromStream(GetFileStream);
      xmlAtualiza.Active := True;
      xmlAtualiza.Version := '1.0';
      xmlAtualiza.Encoding := 'windows-1252';
   end
   else
      Result := False;
end;

procedure TfPrincipal.Process;
const
   SInfoCaption = 'Informação';
   SInvalidFile = 'O arquivo de atualização não foi selecionado.'#13'O processo não pode ser iniciado.';
   SUpdateFinished = 'O processo de atualização foi finalizado.';
begin
   if LoadFile then
   begin
      DMNotify.Start := DM.NowFromDatabase;
      ProcessFile;
      Application.ProcessMessages;
      DMNotify.Stop := DM.NowFromDatabase;

      if DM.NotifyErrors then
      begin
         DMNotify.SendErrors;
      end;

      // apenas mostra a mensagem se nao for execução
      // pelo sistema de automacao
      if speed_process = false then
      begin
         MessageBox(
            Handle,
            PChar(SUpdateFinished),
            PChar(SInfoCaption),
            MB_ICONINFORMATION or MB_OK
         );
      end;

      Application.ProcessMessages;
      Application.Terminate;
   end
   else
      MessageBox(Handle, PChar(SInvalidFile), PChar(SInfoCaption),
            MB_ICONINFORMATION or MB_OK);
end;

procedure TfPrincipal.ProcessArguments;
var
   I: Integer;
   CurrParam: string;
   sn_test_complete : string;
begin
   FSilent := False;
   FForce := False;
   FFilePath := EmptyStr;
   ds_login := '';
   ds_senha := '';


   sn_test_complete := ParamStr(1);
   ds_login := ParamStr(2);
   ds_senha := ParamStr(3);

   // gambiarra, se for admin
   // os parametros precisam ser:
   // admin - senha - path para arquivo
   if (ds_login = 'admin') and (sn_test_complete = 'TestComplet') then
   begin
      FFilePath := ParamStr(4);
   end
   else
   begin

      ds_login := '';
      ds_senha := '';

      // caso contratio faz o que ja fazia antes
      for I := 1 to ParamCount do
      begin
         CurrParam := ParamStr(I);
         FSilentAuth := (CurrParam = '--invisivel') or (CurrParam = '-i') or FSilent;
         FForce := (CurrParam = '--forcado') or (CurrParam = '-f') or FForce;

         if LeftStr(CurrParam, 1) <> #45 then
            if FileExists(CurrParam) then
               FFilePath := CurrParam
            else
               FFilePath := DM.DefaultDirectory + CurrParam;
      end;
   end;
end;

procedure TfPrincipal.ProcessCommand(const Code, SQL: string);
var
   FoundDelimiter: Boolean;
begin
   if (not ExecutedCommand(Code)) or FForce then
   begin
      FCurrCode := Code;
      sqlAtualiza.Script.Text := SQL;
      sqlAtualiza.Delimiter :=
            FindDelimiter(sqlAtualiza.Script.Strings[0], FoundDelimiter);
      if FoundDelimiter then
         sqlAtualiza.Script.Delete(0);
      sqlAtualiza.Parse;
      prbComandos.Max := sqlAtualiza.StatementCount;
      Application.ProcessMessages;
      
      qryAtualizacoes.Append;
      qryAtualizacoesCD_ATUALIZACAO.AsString := Code;
      qryAtualizacoesSN_COMPLETO.AsInteger := 0;
      qryAtualizacoes.Post;
      
      sqlAtualiza.Execute;

      qryAtualizacoes.Edit;
      qryAtualizacoesSN_COMPLETO.AsInteger := 1;
      qryAtualizacoes.Post;
   end;
end;

procedure TfPrincipal.ProcessFile;
var
   Node: IXMLNode;
   Protocol, SQL, Code: string;
begin
   ImportSetupData;
   
   if DM.startConn.Active then
      ChangePasswords;

   qryAtualizacoes.Open;
   qryComandos.Open;

   Application.ProcessMessages;
   
   Node := xmlAtualiza.DocumentElement.ChildNodes.FindNode('atualizas');

   if Node <> nil then
   begin
   
      prbArquivo.Position := 0;
      prbArquivo.Max := Node.ChildNodes.Count;
      
      Node := Node.ChildNodes.First;
      while Node <> nil do
      begin
         Protocol := Node.Attributes['protocolo'];
         if ValidProtocol(Protocol) then
         begin
            Code := Node.Attributes['codigo'];
            SQL := Node.NodeValue;
//            pnlCodigo.Caption := Code;
            ProcessCommand(Code, SQL);
         end;
         prbComandos.Position := 0;
         prbArquivo.StepIt;
         Application.ProcessMessages;

         Node := Node.NextSibling;
      end;
   end;

   qryComandos.Close;
   qryAtualizacoes.Close;
end;

procedure TfPrincipal.sqlAtualizaAfterExecute(Processor: TZSQLProcessor;
  StatementIndex: Integer);
begin
   qryComandos.Post;
   prbComandos.StepIt;
end;

procedure TfPrincipal.sqlAtualizaBeforeExecute(Processor: TZSQLProcessor;
  StatementIndex: Integer);
begin
   qryComandos.Insert;
   qryComandosNR_COMANDO.AsInteger := StatementIndex + 1;
   qryComandosCD_ATUALIZACAO.AsString := FCurrCode;
   qryComandosSN_SUCESSO.AsInteger := 1;
   qryComandosTX_CONTEUDO.AsString := Processor.Statements[StatementIndex];
end;

procedure TfPrincipal.sqlAtualizaError(Processor: TZSQLProcessor;
  StatementIndex: Integer; E: Exception;
  var ErrorHandleAction: TZErrorHandleAction);
begin
   ErrorHandleAction := eaSkip;
   qryComandosSN_SUCESSO.AsInteger := 0;
   qryComandosTX_ERRO.AsString := E.Message;
   DMNotify.AppendError(
      qryComandosCD_ATUALIZACAO.AsString, E.Message,
      Processor.Statements[StatementIndex], StatementIndex + 1);
end;

procedure TfPrincipal.stbInfosDrawPanel(StatusBar: TStatusBar;
  Panel: TStatusPanel; const Rect: TRect);
begin
   case Panel.Index of
      0:
         begin
            sbServidor.Top := Rect.Top;
            sbServidor.Left := Rect.Left;
            sbServidor.Width := Rect.Right - Rect.Left;
            sbServidor.Height := Rect.Bottom - Rect.Top;
         end;
      1:
         begin
            sbBanco.Top := Rect.Top;
            sbBanco.Left := Rect.Left;
            sbBanco.Width := Rect.Right - Rect.Left;
            sbBanco.Height := Rect.Bottom - Rect.Top;
         end;
      2:
         begin
            sbVersao.Top := Rect.Top;
            sbVersao.Left := Rect.Left;
            sbVersao.Width := Rect.Right - Rect.Left;
            sbVersao.Height := Rect.Bottom - Rect.Top;
         end;
   end;
end;

function TfPrincipal.ValidProtocol(const Protocol: string): Boolean;
begin
   Result := (Protocol = 'ansi') or (Protocol = DM.connUnimestre.Protocol);
end;

end.
