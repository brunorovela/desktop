unit UDMNotify;

interface

uses
   SysUtils, Classes, Types, IdUserPassProvider, IdMessage, IdSASLLogin, IdSASL,
   IdSASLUserPass, IdSASLPlain, IdBaseComponent, IdComponent, IdTCPConnection,
   IdTCPClient, IdExplicitTLSClientServerBase, IdMessageClient, IdSMTPBase,
   IdSMTP, IdAttachment, IdAttachmentFile, IdText, UFunctions, Windows;

type
   TDMNotify = class(TDataModule)
      IdSMTP: TIdSMTP;
      IdUserPassProvider: TIdUserPassProvider;
      IdSASLLogin: TIdSASLLogin;
      IdMessage: TIdMessage;
      IdSASLPlain: TIdSASLPlain;
      procedure DataModuleDestroy(Sender: TObject);
      procedure DataModuleCreate(Sender: TObject);
   private
      FStart: TDateTime;
      FStop: TDateTime;
      FErros: TStringList;
      FPwdFails: TStringList;
      function GetStart: TDateTime;
      function GetStop: TDateTime;
      procedure SetStart(const Value: TDateTime);
      procedure SetStop(const Value: TDateTime);

      function GetAttachTemplate: string;

      ///   <summary>Monta a mensagem que será enviada à equipe de suporte
      ///   técnico do Unimestre substituindo as variáveis com as informações do
      ///   cliente</summary>
      ///
      ///   <returns>Conteúdo da mensagem de email</returns>
      function GetMessage: string;

      ///   <summary>Recupera do arquivo de recurso o modelo de email que será
      ///   enviado à equipe de Suporte do Unimestre informando da ocorrência
      ///   de erros na atualização do banco de dados</summary>
      ///
      ///   <returns>Retorna o modelo de email recuperado ao arquivo de recurso
      ///   </returns>
      function GetMessageTemplate: string;

      function GetTempDirectory: string;
      function MakeAttachment: TFileName;
      function NeedSend: Boolean;
   public
      procedure AppendChangePassFail(const User, Host, Error: string);
      procedure AppendError(const Key, Error, SQL: string; const Number: Integer);
      procedure SendErrors;
      property Start: TDateTime read GetStart write SetStart;
      property Stop: TDateTime read GetStop write SetStop;
   end;

var
  DMNotify: TDMNotify;

implementation

uses
   UDM, UFLogin;

{$R *.dfm}

{ TDMNotify }

procedure TDMNotify.DataModuleCreate(Sender: TObject);
begin
   FErros := TStringList.Create;
   FPwdFails := TStringList.Create;
end;

procedure TDMNotify.DataModuleDestroy(Sender: TObject);
begin
   FErros.Free;
   FPwdFails.Free;
end;

procedure TDMNotify.AppendChangePassFail(const User, Host, Error: string);
const
   SErrorLine =
   '<tr%s>' +
      '<td class="sqlCode">%s</td>' +
      '<td class="errorTag">%s</td>' +
      '<td class="errorTag">%s</td>' +
   '</tr>';

   function GetLineBackground: string;
   begin
      if ((FPwdFails.Count + 1) mod 2) = 0 then
         Result := ''
      else
         Result := ' class="td1"'
   end;
   
begin
   FPwdFails.Add(Format(SErrorLine, [GetLineBackground, User, Host, Error]));
end;

procedure TDMNotify.AppendError(const Key, Error, SQL: string;
  const Number: Integer);
const
   SErrorLine =
   '<tr%s>' +
      '<td class="commandKey">%s</td>' +
      '<td class="sequenceNumber">%d</td>' +
      '<td class="errorTag">%s</td>' +
      '<td class="sqlCode">%s</td>' +
   '</tr>';

   function GetLineBackground: string;
   begin
      if ((FErros.Count + 1) mod 2) = 0 then
         Result := ''
      else
         Result := ' class="td1"'
   end;

begin
   FErros.Add(Format(SErrorLine, [GetLineBackground, Key, Number, Error, SQL]));
end;

function TDMNotify.GetAttachTemplate: string;
var
   ResStream: TResourceStream;
   StrStream: TStringStream;
begin
   ResStream := TResourceStream.Create(HInstance, 'EMAILATTACH', RT_RCDATA);
   try
      StrStream := TStringStream.Create('');
      try
         StrStream.CopyFrom(ResStream, 0);
         Result := StrStream.DataString;
      finally
         StrStream.Free;
      end;
   finally
      ResStream.Free;
   end;
end;

function TDMNotify.GetMessage: string;
var
   S: string;
begin
   if TfLogin.GetLoggedUser = '' then
   begin
      S := '&nbsp;'
   end
   else
      S := TfLogin.GetLoggedUser;

   Result := GetMessageTemplate;
   Result := StringReplace(Result, '{$clientName}', DM.ClientName, []);
   Result := StringReplace(Result, '{$macAddress}', GetMacAddress(#42), []);
   Result := StringReplace(Result, '{$databaseAddress}', DM.DatabaseAddress, []);
   Result := StringReplace(Result, '{$databaseUser}', DM.connUnimestre.User, []);
   Result := StringReplace(Result, '{$systemUser}', S, []);
   Result := StringReplace(Result, '{$initDate}', FormatDateTime('dd/mm/yyyy hh:nn:ss', Start), []);
   Result := StringReplace(Result, '{$finalDate}', FormatDateTime('dd/mm/yyyy hh:nn:ss', Stop), []);
end;

function TDMNotify.GetMessageTemplate: string;
var
   ResStream: TResourceStream;
   StrStream: TStringStream;
begin
   ResStream := TResourceStream.Create(HInstance, 'EMAILBODY', RT_RCDATA);
   try
      StrStream := TStringStream.Create('');
      try
         StrStream.CopyFrom(ResStream, 0);
         Result := StrStream.DataString;
      finally
         StrStream.Free;
      end;
   finally
      ResStream.Free;
   end;
end;

function TDMNotify.GetStart: TDateTime;
begin
   Result := FStart;
end;

function TDMNotify.GetStop: TDateTime;
begin
   Result := FStop;
end;

function TDMNotify.GetTempDirectory: string;
var
   PathName: array [0..MAX_PATH] of Char;
begin
   GetTempPath(MAX_PATH, @PathName);
   Result := StrPas(PathName);
end;

function TDMNotify.MakeAttachment: TFileName;
var
   AttachFile: TStringList;
   S: string;
begin
   Result := GetTempDirectory + 'erros.html';
   AttachFile := TStringList.Create;
   try
      S := Format(GetAttachTemplate, [FErros.Text, FPwdFails.Text]);
      S := StringReplace(S, '{$countErrors}', Format('%d', [FErros.Count]), []);
      S := StringReplace(S, '{$start}', FormatDateTime('dd/mm/yyyy hh:nn:ss', Start), []);
      S := StringReplace(S, '{$stop}', FormatDateTime('dd/mm/yyyy hh:nn:ss', Stop), []);
      if FileExists(Result) then
         SysUtils.DeleteFile(Result);
      AttachFile.Text := S;
      AttachFile.SaveToFile(Result);
   finally
      AttachFile.Free;
   end;
end;

function TDMNotify.NeedSend: Boolean;
begin
   Result := (FErros.Count > 0) or (FPwdFails.Count > 0);
end;

procedure TDMNotify.SendErrors;
var
   IdAttach: TIdAttachment;
   IdText: TIdText;
begin
   if NeedSend then
   begin
      IdAttach := TIdAttachmentFile.Create(IdMessage.MessageParts, MakeAttachment);
      try
         IdText := TIdText.Create(IdMessage.MessageParts, nil);
         try
            IdText.ContentType := 'text/html';
            IdText.ContentDescription := 'multipart-1';
            IdText.CharSet := 'ISO-8859-1';
            IdText.ContentTransfer := '16bit';
            IdText.Body.Text := GetMessage;
            try
               IdSMTP.Connect;
               if IdSMTP.Connected and IdSMTP.Authenticate then
               begin
                  IdSMTP.Send(IdMessage);
                  IdSMTP.Disconnect;
               end;
            except
               //
            end;
         finally
            IdText.Free;
         end;
      finally
         IdAttach.Free;
      end;
   end;
end;

procedure TDMNotify.SetStart(const Value: TDateTime);
begin
   FStart := Value;
end;

procedure TDMNotify.SetStop(const Value: TDateTime);
begin
   FStop := Value;
end;

end.
