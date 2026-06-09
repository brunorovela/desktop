unit ufTAMInscricoes;

interface

uses
   Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
   Dialogs, ExtCtrls, jpeg, StdCtrls, IniFiles, ZConnection, uClasses, Consts,
   uAFuncoes, uCFuncString, UZStartConnection;

type
   TfTAMInscricoes = class(TForm)
    procedure FLedCodigoChange(Sender: TObject);
   strict private
      FIfConf: TIniFile;
      FZConn: TZConnection;
      ConexaoStart: TUMZStartConnection;
      FUMTAMEvento: TUMTAMEvento;
      function isPeriodoInscricoes: boolean;
      function solicitaSenhaEvento: boolean;
      function informaSenha(const ACaption, APrompt: string; var Value: string; const APasswordChar: Char): boolean;
      procedure limpaTela;
      procedure processaLinhaComandos;
      procedure inscrevePessoa(const ASCodPessoa: string);
      procedure imprimeComprovante(const ASCodPessoa: string);
      procedure mostraAluno(const ABSucesso: boolean; const ASMsg: string; const ASCodPessoa: string = ''; const ASNomePessoa: string = '');
      procedure conecta(const ASServidor, ASBanco, ASProtocolo, ASUsuario, ASSenha: string; const AIPorta: integer);
   published
      FBvSep1: TBevel;
      FBvSep2: TBevel;
      FBvSep6: TBevel;
      FPnEvento: TPanel;
      FPnCodigo: TPanel;
      FImOk: TImage;
      FImCancel: TImage;
      FLedCodigo: TLabeledEdit;
      FPnInscricao: TPanel;
      FBvSep3: TBevel;
      FBvSep4: TBevel;
      FBvSep5: TBevel;
      FPnMsg: TPanel;
      FPnDados: TPanel;
      FGbCodigo: TGroupBox;
      FLbCodigo: TLabel;
      FGbNome: TGroupBox;
      FLbNome: TLabel;
      FPnPeriodo: TPanel;
      FPnImagem: TPanel;
      FImUnimestre: TImage;
      FTmTimer: TTimer;
      FTmPeriodo: TTimer;
      procedure mostraFormulario(Sender: TObject);
      procedure inicializaFormulario(Sender: TObject);
      procedure fechaFormulario(Sender: TObject; var Action: TCloseAction);
      procedure informaPessoa(Sender: TObject; var Key: Char);
      procedure processaTeclasAtalho(Sender: TObject; var Key: Word; Shift: TShiftState);
      procedure temporizadorGeral(Sender: TObject);
      procedure temporizadorPeriodo(Sender: TObject);
   public
      procedure startConnDefaultConnection(Sender: TObject);      
   end;

var
   fTAMInscricoes: TfTAMInscricoes;

implementation

{$R *.dfm}

uses
   ufBuscaEvento;

{ TfTAMInscricoes }

{ Tenta abrir conexão com o banco de dados. }
procedure TfTAMInscricoes.conecta(const ASServidor, ASBanco, ASProtocolo,
  ASUsuario, ASSenha: string; const AIPorta: integer);
begin
   Self.FZConn := TZConnection.Create(Self);
   try
      Self.FZConn.HostName := ASServidor;
      Self.FZConn.Database := ASBanco;
      Self.FZConn.Protocol := ASProtocolo;
      Self.FZConn.User := ASUsuario;
      Self.FZConn.Password := ASSenha;
      Self.FZConn.Port := AIPorta;
      Self.FZConn.Connect;
   except
      on E: Exception do raise E;
   end;
end;

{ Este método é invocado no evento OnClose do formulário. }
procedure TfTAMInscricoes.fechaFormulario(Sender: TObject;
  var Action: TCloseAction);
begin
   Self.FIfConf.Free;
   Self.FUMTAMEvento.Free;
   Self.FZConn.Disconnect;
   Self.FZConn.Free;
   Action := caFree;
end;

procedure TfTAMInscricoes.FLedCodigoChange(Sender: TObject);
begin

end;

{ Efetua impressão do comprovante de inscrição do aluno.
}
procedure TfTAMInscricoes.imprimeComprovante(const ASCodPessoa: string);

   function getTextoCentralizado(const ASTexto: string): string;
   var
      iTam: integer;
   begin
      Result := Trim(ASTexto);
      try
         iTam := StrToInt(Self.FUMTAMEvento.Parametros['impressao_tamanho']);
      except
         on E: EConvertError do iTam := 40;
      end;
      while Length(Result) < iTam do Result := ' ' + Result + ' ';
   end;

var
   i: integer;
   sSaida: string;
   tfImp: TextFile;
   slComp: TStringList;
begin
   sSaida := Self.FUMTAMEvento.Parametros['impressao_dos_porta'];
   if (Trim(sSaida) <> '') and FileExists(sSaida) then
   begin
      try
         AssignFile(tfImp, sSaida);
         Rewrite(tfImp);
         Writeln(tfImp, Chr(27) + 'R');
         Writeln(tfImp, '');
         slComp := TStringList.Create;
         try
            slComp.Text := Self.FUMTAMEvento.Inscricoes[ASCodPessoa].Comprovante;
            for i := 0 to slComp.Count - 1 do
            begin
               Writeln(tfImp, getTextoCentralizado(slComp.Strings[i]));
            end;
            CloseFile(tfImp);
         finally
            slComp.Free;
         end;
      except
         on E: Exception do CloseFile(tfImp);
      end;
   end;
end;

{ Este método é invocado no evento OnKeyPress da caixa para informar o código. }
procedure TfTAMInscricoes.informaPessoa(Sender: TObject; var Key: Char);
begin
   if Key = #13 then
   begin
      Self.limpaTela;
      Self.inscrevePessoa(Self.FLedCodigo.Text);
   end
   else if not (Key in['0'..'9', Chr(8)]) then
   begin
      Key := #0;
   end;
end;

{ Exibe interface para o usuário informar senha. }
function TfTAMInscricoes.informaSenha(const ACaption, APrompt: string;
  var Value: string; const APasswordChar: Char): boolean;

function GetAveCharSize(Canvas: TCanvas): TPoint;
   var
      I: Integer;
      Buffer: array[0..51] of Char;
   begin
      for I := 0 to 25 do Buffer[I] := Chr(I + Ord('A'));
      for I := 0 to 25 do Buffer[I + 26] := Chr(I + Ord('a'));
      GetTextExtentPoint(Canvas.Handle, Buffer, 52, TSize(Result));
      Result.X := Result.X div 52;
   end;

var
   Form: TForm;
   Prompt: TLabel;
   Edit: TEdit;
   DialogUnits: TPoint;
   ButtonTop, ButtonWidth, ButtonHeight: Integer;
begin
   Result := False;
   Form := TForm.Create(Application);
   with Form do
      try
         Canvas.Font := Font;
         DialogUnits := GetAveCharSize(Canvas);
         BorderStyle := bsDialog;
         Caption := ACaption;
         ClientWidth := MulDiv(180, DialogUnits.X, 4);
         Position := poScreenCenter;
         Prompt := TLabel.Create(Form);
         with Prompt do
         begin
            Parent := Form;
            Caption := APrompt;
            Left := MulDiv(8, DialogUnits.X, 4);
            Top := MulDiv(8, DialogUnits.Y, 8);
            Constraints.MaxWidth := MulDiv(164, DialogUnits.X, 4);
            WordWrap := True;
         end;
         Edit := TEdit.Create(Form);
         with Edit do
         begin
            Parent := Form;
            Left := Prompt.Left;
            Top := Prompt.Top + Prompt.Height + 5;
            Width := MulDiv(164, DialogUnits.X, 4);
            MaxLength := 255;
            PasswordChar := APasswordChar;
            Text := Value;
            SelectAll;
         end;
         ButtonTop := Edit.Top + Edit.Height + 15;
         ButtonWidth := MulDiv(50, DialogUnits.X, 4);
         ButtonHeight := MulDiv(14, DialogUnits.Y, 8);
         with TButton.Create(Form) do
         begin
            Parent := Form;
            Caption := SMsgDlgOK;
            ModalResult := mrOk;
            Default := True;
            SetBounds(MulDiv(38, DialogUnits.X, 4), ButtonTop, ButtonWidth, ButtonHeight);
         end;
         with TButton.Create(Form) do
         begin
            Parent := Form;
            Caption := SMsgDlgCancel;
            ModalResult := mrCancel;
            Cancel := True;
            SetBounds(MulDiv(92, DialogUnits.X, 4), Edit.Top + Edit.Height + 15,
            ButtonWidth, ButtonHeight);
            Form.ClientHeight := Top + Height + 13;          
         end;
         if ShowModal = mrOk then
         begin
            Value := Edit.Text;
            Result := True;
         end;
      finally
         Form.Free;
      end;
end;

{ Este método é invocado no evento OnCreate do formulário. }
procedure TfTAMInscricoes.inicializaFormulario(Sender: TObject);
begin
   Self.FZConn := TZConnection.Create(Self);

   Self.ConexaoStart := TUMZStartConnection.Create(Self);
   Self.ConexaoStart.DefaultConnection := Self.startConnDefaultConnection;
   Self.ConexaoStart.IniProps.SectionName := 'Conexao';
   Self.ConexaoStart.IniProps.DatabaseIdent := 'Banco';
   Self.ConexaoStart.IniProps.HostNameIdent := 'Servidor';
   Self.ConexaoStart.IniProps.PasswordIdent := 'Senha';
   Self.ConexaoStart.IniProps.PortIdent := 'Porta';
   Self.ConexaoStart.IniProps.ProtocolIdent := 'Protocolo';
   Self.ConexaoStart.IniProps.UserIdent := 'Usuario';
   Self.ConexaoStart.UnimestreUser := 'umsistema';
   Self.ConexaoStart.Connection := Self.FZConn;

   if not FileExists(ExtractFileDir(ParamStr(0)) + '\unimestre.ini') then
   begin
      Mensagem('O arquivo de configuração unimestre.ini não foi encontrado.', 'Erro!', MB_ICONERROR, Self.Handle);
      Mensagem('A aplicação será encerrada!', 'Erro!', MB_ICONERROR, Self.Handle);
      Application.Terminate;
   end
   else
   begin
      Self.FIfConf := TIniFile.Create(ExtractFileDir(ParamStr(0)) + '\unimestre.ini');
      Self.ConexaoStart.IniPath := ExtractFileDir(ParamStr(0)) + '\unimestre.ini';
      Self.ConexaoStart.Active := Self.FIfConf.ReadBool('Conexao', 'Usa.Start', False);
      Self.ConexaoStart.ConnectUnimestre;
   end;

   Self.FLbCodigo.Caption := '';
   Self.FLbNome.Caption := '';
   Self.FPnMsg.Caption := '';
   Self.processaLinhaComandos;
end;

{ Efetua a inscrição da pessoa no evento. }
procedure TfTAMInscricoes.inscrevePessoa(const ASCodPessoa: string);
const
   ALUNO_INEXISTENTE = 'CÓDIGO INVÁLIDO, INSCRIÇÃO NÃO REALIZADA.';
   INSCRICAO_OK      = 'INSCRIÇÃO CONFIRMADA.';
   ALUNO_JA_INSCRITO = 'ALUNO JÁ INSCRITO NO EVENTO';
   TURMA_INVALIDA    = 'SUA TURMA NÃO ESTÁ VINCULADA A ESTE EVENTO.';
   ERRO_INSCRICAO    = 'OCORREU UM ERRO DURANTE O PROCESSO DE INSCRIÇÃO.';
   INSC_OK_ERRO_MENS = 'INSCRIÇÂO CONFIRMADA, MAS OCORREU ERRO NA GERAÇÃO DA MENSALIDADE.';
   SEM_VAGAS         = 'TODAS AS VAGAS DISPONÍVEIS PARA ESTE EVENTO FORAM OCUPADAS.';
   PENDENCIA_FIN     = 'PENDÊNCIA ENCONTRADA, PROCURE A COORDENAÇÃO DO EVENTO.';

begin
   if Self.isPeriodoInscricoes then
   begin
      case Self.FUMTAMEvento.Inscricoes[ASCodPessoa].inscreve of
         riErroBanco: Self.mostraAluno(False, ERRO_INSCRICAO);
         riSemTurma: Self.mostraAluno(False, TURMA_INVALIDA);
         riInvalido: Self.mostraAluno(False, ALUNO_INEXISTENTE);
         riInscrito: Self.mostraAluno(False, ALUNO_JA_INSCRITO);
         riSemVagas: Self.mostraAluno(False, SEM_VAGAS);
         riFinPendencia: Self.mostraAluno(False, PENDENCIA_FIN);
         riSucesso:
         begin
            Self.mostraAluno(True, INSCRICAO_OK, ASCodPessoa, Self.FUMTAMEvento.Inscricoes[ASCodPessoa].NomePessoa);
            Self.FUMTAMEvento.Inscricoes[ASCodPessoa].geraMensalidade;
         end;
      end;
   end;
   Self.FTmTimer.Enabled := True;
end;

{ Verifica se está no período de inscrições. }
function TfTAMInscricoes.isPeriodoInscricoes: boolean;
const
   MSG_ANTECIPADO = 'As inscrições para este evento iniciam dia :dia às :horas.';
   MSG_ATRASADO = 'As inscrições para este evento encerraram-se dia :dia às :horas.';
var
   sMsg: string;
begin
   case Self.FUMTAMEvento.Periodo of
      rpAntecipado:
      begin
         Result := False;
         sMsg := StringReplace(MSG_ANTECIPADO, ':dia', FormatDateTime('dd/mm/yyyy', Self.FUMTAMEvento.DataIniInsc), [rfReplaceAll, rfIgnoreCase]);
         sMsg := StringReplace(sMsg, ':horas', FormatDateTime('hh:nn', Self.FUMTAMEvento.DataIniInsc), [rfReplaceAll, rfIgnoreCase]);
      end;
      rpInscricoes:
      begin
         Result := True;
         sMsg := '';
      end;
      rpAtrasado:
      begin
         Result := False;
         sMsg := StringReplace(MSG_ATRASADO, ':dia', FormatDateTime('dd/mm/yyyy', Self.FUMTAMEvento.DataFimInsc), [rfReplaceAll, rfIgnoreCase]);
         sMsg := StringReplace(sMsg, ':horas', FormatDateTime('hh:nn', Self.FUMTAMEvento.DataFimInsc), [rfReplaceAll, rfIgnoreCase]);
      end;
   end;
   Self.FPnPeriodo.Caption := sMsg;
end;

{ Limpa as informações do aluno anterior na entrada de um novo aluno. }
procedure TfTAMInscricoes.limpaTela;
begin
   Self.FLbCodigo.Caption := '';
   Self.FLbNome.Caption := '';
   Self.FPnMsg.Caption := '';
   Self.FImOk.Visible := False;
   Self.FImCancel.Visible := False;
   Self.FTmTimer.Enabled := False;
end;

procedure TfTAMInscricoes.mostraAluno(const ABSucesso: boolean; const ASMsg,
  ASCodPessoa, ASNomePessoa: string);
begin
   Self.FLedCodigo.Clear;
   Self.FLedCodigo.Enabled := False;
   Self.FLbCodigo.Caption := ASCodPessoa;
   Self.FLbNome.Caption := ASNomePessoa;
   Self.FPnMsg.Caption := ASMsg;
   Self.FImOk.Visible := ABSucesso;
   Self.FImCancel.Visible := not ABSucesso;
   if ABSucesso then
   begin
      Self.FPnMsg.Font.Color := clGreen;
   end else
   begin
      Self.FPnMsg.Font.Color := clRed;
   end;
   Self.FLedCodigo.Enabled := True;
   Self.FLedCodigo.SetFocus;
end;

{ Método invocado no evento OnShow do formulário. }
procedure TfTAMInscricoes.mostraFormulario(Sender: TObject);
begin
   Self.Height := Screen.Height;
   Self.Width := Screen.Width;
   if not Assigned(Self.FUMTAMEvento) then
   begin
      Self.FUMTAMEvento := TUMTAMEvento.Create(TfBuscaEvento.getCodEvento(Self.FZConn, 0, False), Self.FZConn);
   end;
   if Self.FUMTAMEvento.Codigo = 0 then
   begin
      Application.Terminate;
   end;   
   Self.FPnEvento.Caption := Self.FUMTAMEvento.Descricao;
   Self.temporizadorPeriodo(nil);
end;

{ Processa os parâmetros passados pela linha de comandos. }
procedure TfTAMInscricoes.processaLinhaComandos;
var
   i: Byte;
   iCodEvento: integer;
begin
   for i := 0 to ParamCount - 1 do
   begin
      if ParamStr(i) = '--evento' then
      begin
         try
            iCodEvento := StrToInt(ParamStr(i + 1));
         except
            on E: EConvertError do Exit;
         end;
         Self.FUMTAMEvento := TUMTAMEvento.Create(iCodEvento, Self.FZConn);
      end;
   end;
end;

{ Método invocado no evento OnKeyDown do formulário. }
procedure TfTAMInscricoes.processaTeclasAtalho(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
   if (Key = VK_ESCAPE) then
   begin
      if Self.solicitaSenhaEvento then Self.Close;
   end
   else if (Key = VK_F4) and (ssAlt in Shift) then Key := 0;
end;

{ Solicita ao usuário a senha de acesso ao arquivo XML para efetuar operação. }
function TfTAMInscricoes.solicitaSenhaEvento: boolean;
var
   sSenha: string;
begin
   Result := Self.informaSenha(Application.Title, 'Informe a senha para acesso:', sSenha, #42) and (Self.FUMTAMEvento.SenhaMD5 = sSenha);
end;

procedure TfTAMInscricoes.startConnDefaultConnection(Sender: TObject);
begin
   if not FileExists(ExtractFileDir(ParamStr(0)) + '\unimestre.ini') then
   begin
      Mensagem('O arquivo de configuração unimestre.ini não foi encontrado.', 'Erro!', MB_ICONERROR, Self.Handle);
      Mensagem('A aplicação será encerrada!', 'Erro!', MB_ICONERROR, Self.Handle);
      Application.Terminate;
   end
   else
   begin
      Self.FIfConf := TIniFile.Create(ExtractFileDir(ParamStr(0)) + '\unimestre.ini');
            try
         Self.conecta(
            Self.FIfConf.ReadString('Conexao', 'Servidor', 'localhost'),
            Self.FIfConf.ReadString('Conexao', 'Banco', 'unimestre_famesul'),
            Self.FIfConf.ReadString('Conexao', 'Protocolo', 'mysql-5'),
            Self.FIfConf.ReadString('Conexao', 'Usuario', 'academico'),
            TFuncString.crypt(Self.FIfConf.ReadString('Conexao', 'Senha', 'E2619A55EE66EA14CA02619741AD13D270'), ctDecode),
            Self.FIfConf.ReadInteger('Conexao', 'Porta', 3306));
      except
         on E: Exception do
         begin
            Mensagem('Não foi possível efetuar conexão com o banco de dados.' + #13 + E.Message, 'Erro!', MB_ICONERROR, Self.Handle);
            Mensagem('A aplicação será encerrada!', 'Erro!', MB_ICONERROR, Self.Handle);
            Application.Terminate;
         end;
      end;
   end;
end;

{ Método invocado no evento OnTimer do temporizador FTmTimer. }
procedure TfTAMInscricoes.temporizadorGeral(Sender: TObject);
begin
   Self.FLedCodigo.Clear;
   Self.FLbCodigo.Caption := '';
   Self.FLbNome.Caption := '';
   Self.FPnMsg.Caption := '';
   Self.FImOk.Visible := False;
   Self.FImCancel.Visible := False;
   Self.FTmTimer.Enabled := False;
   Self.FLedCodigo.Enabled := True;
   Self.FLedCodigo.SetFocus;
end;

{ Método invocado no evento OnTimer do temporizador FTmPeriodo. }
procedure TfTAMInscricoes.temporizadorPeriodo(Sender: TObject);
begin
   Self.FLedCodigo.Enabled := Self.isPeriodoInscricoes;
   Self.FPnPeriodo.Visible := not Self.FLedCodigo.Enabled;
end;

end.
