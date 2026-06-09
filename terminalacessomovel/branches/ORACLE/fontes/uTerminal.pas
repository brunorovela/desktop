unit uTerminal;

interface

uses
   General,Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
   Dialogs, StdCtrls, jpeg, ExtCtrls,uXML;

const
   MSG_SAIDA         = 'Obrigado pela presença.';
   MSG_ENTRADA_LEGAL = 'Acesso Confirmado. Seja Bem Vindo(a)!';
   MSG_PENDENCIA_FIN = 'Identificado problema com a sua inscrição. Contate a coordenação do Evento.';
   MSG_SEM_INSCRICAO = 'Inscrição não localizada. Contate a coordenação do Evento.';
   MSG_SEM_INSCRICAO_ATIVIDADE = 'Inscrição na atividade não localizada. Contate a coordenação do Evento.';

type
   TfTerminal = class(TForm)
   strict private
      FMensagem: TForm;
      FTmMensagem: TTimer;
      FSlParametros: TStringList;
      procedure escondeTerminal;
      procedure atualizaContador;
      procedure temporizadorJanela(Sender: TObject);
      procedure ultimoAcesso(const oInscricao:TUMTAMInscricao;const oAtividade:TUMTAMAtividade);
      procedure inscreveAluno(const ASCodPessoa: string;oAtividade:TUMTAMAtividade);
      procedure entradaSemPgto(const ASCodPessoa: string;sCodigoInscricaoAtividade:string);
      procedure mostraDadosAluno(const ASCodPessoa: string);
      procedure processaEntradaSaida(const ASCodPessoa: string);
      procedure mostraMensagem(const ASMsg: string; const Cor: TColor);
      procedure inscreveAlunoNovaAtividade(const iCodPessoa:Integer;const oAtividade:TUMTAMAtividade;const oInscricao:TUMTAMInscricao);
      function confirmaOperacao: boolean;
   published
      FTmRelogio: TTimer;
      FGbContador: TGroupBox;
      FLbTInscritos: TLabel;
      FLbTPresentes: TLabel;
      FLbTNaoPresentes: TLabel;
      FLbInscritos: TLabel;
      FLbPresentes: TLabel;
      FLbNaoPresentes: TLabel;
      FBvSep2: TBevel;
      FPnImagem: TPanel;
      FBvSep3: TBevel;
      FPnDados: TPanel;
      FImUnimestre: TImage;
      FBvSep6: TBevel;
      FBvSep7: TBevel;
      FPnEntrada: TPanel;
      FBvSep5: TBevel;
      FLbTNome: TLabel;
      FPnUltimoAcesso: TPanel;
      FEdCodigo: TEdit;
      FLbTEntCodigo: TLabel;
      FLbNome: TLabel;
      FLbTCodigo: TLabel;
      FLbCodigo: TLabel;
      FPnMensagem: TPanel;
      FBvSep4: TBevel;
      FBvSep1: TBevel;
      FPnHorario: TPanel;
      FTmIntervalo: TTimer;
      procedure relogio(Sender: TObject);
      procedure temporizador(Sender: TObject);
      procedure inicializaFormulario(Sender: TObject);
      procedure fechaFormulario(Sender: TObject; var Action: TCloseAction);
      procedure mostraFormulario(Sender: TObject);
      procedure informaAluno(Sender: TObject; var Key: Char);
      procedure processaTeclasAtalho(Sender: TObject; var Key: Word; Shift: TShiftState);

   end;

var
   fTerminal: TfTerminal;

implementation

Uses
  Main, md5,uEscolhaAtividade,uEscolhaAtividadeOffline;

{$R *.dfm}

procedure TfTerminal.informaAluno(Sender: TObject; var Key: Char);
begin
   if (Key = #13) and (Self.FEdCodigo.Text <> '') then
   begin
      Self.FTmIntervalo.Enabled := False;
      Self.processaEntradaSaida(Self.FEdCodigo.Text);
      Self.atualizaContador;
      PrincipalForm.FUMTerminalAcessoXML.salvaXML;
      Self.FEdCodigo.Clear;
      Self.FEdCodigo.SetFocus;
   end
   else if (Key = #48) and (Self.FEdCodigo.Text = '') then
   begin
      Key := #0;   
   end
   else if not (Key in[#48..#57, #8]) then
   begin
      Key := #0;
   end;
end;

procedure TfTerminal.inicializaFormulario(Sender: TObject);
begin
   Self.FTmMensagem := TTimer.Create(Self);
   Self.FTmMensagem.Enabled := False;
   Self.FTmMensagem.Interval := 5000;
   Self.FTmMensagem.OnTimer := Self.temporizadorJanela;
end;

procedure TfTerminal.inscreveAluno(const ASCodPessoa: string;oAtividade:TUMTAMAtividade);
const
   QUESTAO_INSCRICAO = 'Pessoa não inscrita, deseja permitir o acesso desta pessoa?';
   ENTRADA_NOME = 'Digite o nome do Aluno';
var
   sNome: string;
   oInscricao:TUMTAMInscricao;
begin
   // Dispara o temporizador de janelas
   Self.escondeTerminal;
   Self.FTmMensagem.Enabled := True;
   Self.FPnMensagem.Visible := False;
   Self.mostraMensagem(MSG_SEM_INSCRICAO, clRed);
   Self.FTmIntervalo.Enabled := False;
   Self.FMensagem := CreateMessageDialog(QUESTAO_INSCRICAO, mtConfirmation, [mbYes, mbNo], mbNo);

   if not (PrincipalForm.FUMTerminalAcessoXML.UMEvento.SnLiberarInscricoes = '1') then
   begin
      if Self.FMensagem.ShowModal = ID_YES then
      begin
         // Usuário confirmou solicitação. Desliga o temporizador.
         Self.FTmMensagem.Enabled := False;
         if Self.confirmaOperacao then
         begin
            if InputQuery(Application.Title, ENTRADA_NOME, sNome) then
            begin
               //adiciona uma nova inscrição
               oInscricao:= PrincipalForm.FUMTerminalAcessoXML.UMEvento.addInscricao(
                  GeraCodigoUnico, 'true', PrincipalForm.FUMTerminalAcessoXML.UMEvento.CodEvento,
                  ASCodPessoa, sNome, '1', '', FormatDateTime('yyyy-mm-dd hh:nn:ss', Now), 'N');

               //inscreve o aluno nesta atividade
               oInscricao.addInscricaoAtividade(oAtividade.CodigoAtividade,oInscricao.CodInscricao,GeraCodigoUnico);

               //mostra os dados do aluno
               Self.mostraDadosAluno(ASCodPessoa);

               //registra o acesso do aluno
               Self.ultimoAcesso(oInscricao,oAtividade);


            end else
            begin
               Self.FTmIntervalo.Enabled := True;
            end;
         end;
      end else
      begin
         Self.FTmIntervalo.Enabled := True;
      end;
   end
   else
   begin
      // O evento permite inscrição automática , n pergunta antes e faz
      Self.FTmMensagem.Enabled := False;
      
      //requisita nome do inscrito
      if InputQuery(Application.Title, ENTRADA_NOME, sNome) then
      begin
         //adiciona uma nova inscrição
         oInscricao:= PrincipalForm.FUMTerminalAcessoXML.UMEvento.addInscricao(
            GeraCodigoUnico, 'true', PrincipalForm.FUMTerminalAcessoXML.UMEvento.CodEvento,
            ASCodPessoa, sNome, '1', '', FormatDateTime('yyyy-mm-dd hh:nn:ss', Now), 'N');

         //inscreve o aluno nesta atividade
         oInscricao.addInscricaoAtividade(oAtividade.CodigoAtividade,oInscricao.CodInscricao,GeraCodigoUnico);

         //mostra os dados do aluno
         Self.mostraDadosAluno(ASCodPessoa);

         //registra o acesso do aluno
         Self.ultimoAcesso(oInscricao,oAtividade);
      end else
      begin
         Self.FTmIntervalo.Enabled := True;
      end;

   end;

end;

procedure TfTerminal.inscreveAlunoNovaAtividade(const iCodPessoa: Integer;
  const oAtividade: TUMTAMAtividade; const oInscricao: TUMTAMInscricao);
const
   QUESTAO_INSCRICAO = 'Pessoa não inscrita para esta atividade, deseja permitir o acesso desta pessoa?';

begin
//Adiciona objeto em inscricoes atividades
   // Dispara o temporizador de janelas
   Self.escondeTerminal;
   Self.FTmMensagem.Enabled := True;
   Self.FPnMensagem.Visible := False;
   Self.mostraMensagem(MSG_SEM_INSCRICAO, clRed);
   Self.FTmIntervalo.Enabled := False;

   Self.FMensagem := CreateMessageDialog(QUESTAO_INSCRICAO, mtConfirmation, [mbYes, mbNo], mbNo);
   
   if not(PrincipalForm.FUMTerminalAcessoXML.UMEvento.SnLiberarInscricoes = '1') then
   begin
      if Self.FMensagem.ShowModal = ID_YES  then
      begin
         // Usuário confirmou solicitação. Desliga o temporizador.
         Self.FTmMensagem.Enabled := False;
         if Self.confirmaOperacao then
         begin
            //Registra inscrição na atividade selecionada
            oInscricao.addInscricaoAtividade(oAtividade.CodigoAtividade,oInscricao.CodInscricao,GeraCodigoUnico);

            oInscricao.getInscricaoAtividadeByChave(
               oInscricao.CodInscricao+
               PrincipalForm.FUMTerminalAcessoXML.UMAtividade.CodigoAtividade
            );

            //Mostra as informações da nova inscrição
            Self.mostraDadosAluno(oInscricao.CodPessoa);


            //Registra o acesso do aluno
            Self.ultimoAcesso(oInscricao,oAtividade);
         end;
      end else
      begin
            Self.FTmIntervalo.Enabled := True;
      end;
   end else
   begin

      // O evento permite inscrição automática , n pergunta antes e faz
      Self.FTmMensagem.Enabled := False;

      //Registra inscrição na atividade selecionada
      oInscricao.getInscricaoAtividadeByChave(
         oInscricao.CodInscricao+
         PrincipalForm.FUMTerminalAcessoXML.UMAtividade.CodigoAtividade
      );

      //Mostra as informações da nova inscrição
      Self.mostraDadosAluno(oInscricao.CodPessoa);

      //Registra o acesso do aluno
      Self.ultimoAcesso(oInscricao,oAtividade);
   end;

end;

procedure TfTerminal.escondeTerminal;
begin
   Self.FPnDados.Visible := False;
   Self.FPnMensagem.Visible := False;
   Self.FPnUltimoAcesso.Visible := False;
   Self.FTmIntervalo.Enabled := False;
end;

procedure TfTerminal.fechaFormulario(Sender: TObject; var Action: TCloseAction);
begin
   Action := caFree;
end;



function TfTerminal.confirmaOperacao: boolean;
var
   sChave: string;
   bReTentar: boolean;
begin
   Result := False;
   bReTentar := True;
   if not (PrincipalForm.FUMTerminalAcessoXML.UMEvento.SnLiberarInscricoes = '1') then
   begin
      if PasswordInputQuery(Application.Title, 'Informe a senha de acesso:', sChave, #42) then
      begin
         while bReTentar do
         begin
            Result := MD5Print(MD5String(sChave)) = PrincipalForm.FUMTerminalAcessoXML.UMEvento.Senha;
            if not Result then
            begin
               bReTentar := Mensagem('Chave inválida!', Application.Title, MB_RETRYCANCEL) = ID_RETRY;
               if(bReTentar)then
               begin
                  PasswordInputQuery(Application.Title, 'Informe a senha de acesso:', sChave, #42);
               end;
            end else
            begin
               bReTentar := False;
            end;
         end;
      end;
   end
   else
   begin
      Result:=true;
   end;
end;

{
  Questiona o usuário deseja permitir a entrada do aluno mesmo sem ter efetuado
  o pagamento da inscrição.
}
procedure TfTerminal.entradaSemPgto(const ASCodPessoa: string;sCodigoInscricaoAtividade:string);
const
   QUESTAO_PAGAMENTO = 'Deseja permitir o acesso desta pessoa ?';
   MSG_NAO_ENTROU    =  'Entrada não efetuada!';
begin
   Self.FPnMensagem.Visible := True;
   Self.FTmMensagem.Enabled := True; // Dispara o temporizador de janelas
   Self.mostraMensagem(MSG_PENDENCIA_FIN, clRed);
   Self.FTmIntervalo.Enabled := False;
   Self.FMensagem := CreateMessageDialog(QUESTAO_PAGAMENTO, mtConfirmation, [mbYes, mbNo], mbNo);
   try
      if Self.FMensagem.ShowModal = IDYES then
      begin
         // Recebeu confirmação do usuário, desliga o temporizador
         Self.FTmMensagem.Enabled := False;
         if Self.confirmaOperacao then
         begin
            PrincipalForm.FUMTerminalAcessoXML.UMEvento.getInscricaoByPessoa(ASCodPessoa).addEntrada(PrincipalForm.FUMTerminalAcessoXML.UMAtividade.CodigoAtividade,sCodigoInscricaoAtividade);
            Self.mostraMensagem(MSG_ENTRADA_LEGAL, clGreen);
         end else
         begin
            Self.FTmIntervalo.Enabled := True;
         end;
      end else
      begin
         Self.FTmIntervalo.Enabled := True;
      end;
   finally
      //Self.FMensagem.Free;
   end;
end;

procedure TfTerminal.mostraDadosAluno(const ASCodPessoa: string);
begin
   with PrincipalForm.FUMTerminalAcessoXML.UMEvento.getInscricaoByPessoa(ASCodPessoa) do
   begin
      Self.FLbCodigo.Caption := CodPessoa;
      Self.FLbNome.Caption := NomePessoa;
      Self.FPnDados.Visible := True;
   end;
end;

procedure TfTerminal.mostraFormulario(Sender: TObject);
begin
   Self.Width := Screen.Width;
   Self.Height := Screen.Height;
   Self.FTmMensagem := TTimer.Create(Self);
   Self.FTmMensagem.Enabled := False;
   Self.FTmMensagem.OnTimer := Self.temporizadorJanela;
   Self.FTmMensagem.Interval := 9999;
   
   //se só tiver uma atividade já acessa direto o terminal para essa atividade
   if PrincipalForm.FUMTerminalAcessoXML.UMEvento.AtividadesCount > 1 then
   begin
      if not Assigned(fEscolheAtividadeOffline) then
      begin
        Application.CreateForm(TfEscolheAtividadeOffline, fEscolheAtividadeOffline);
      end;
      fEscolheAtividadeOffline.ShowModal();
   end
   else
   begin
      PrincipalForm.FUMTerminalAcessoXML.setAtividadeSel(PrincipalForm.FUMTerminalAcessoXML.UMEvento.Atividade[0]);
   end;

   Self.atualizaContador;
end;

procedure TfTerminal.mostraMensagem(const ASMsg: string; const Cor: TColor);
begin
   Self.FPnMensagem.Caption := ASMsg;
   Self.FPnMensagem.Color := Cor;
   Self.FPnMensagem.Visible := True;
   Self.FTmIntervalo.Enabled := True;
end;

procedure TfTerminal.processaEntradaSaida(const ASCodPessoa: string);
var
   oInscricao : TUMTAMInscricao;
   oInscricaoAtividade: TUMTAMInscricoesAtividade;
   iCodPessoa:Integer;
begin
   Self.FPnEntrada.Enabled := False;


   try
     iCodPessoa := StrToInt(ASCodPessoa);
   except
      ON EConvertError do
      begin
         Mensagem('Digite um código de pessoa válido!');
         exit;
      end;
   end;

   //procura se tem inscrição
   if PrincipalForm.FUMTerminalAcessoXML.UMEvento.isPessoaExiste(ASCodPessoa) then
   begin
      oInscricao := PrincipalForm.FUMTerminalAcessoXML.UMEvento.getInscricaoByPessoa(ASCodPessoa);

      oInscricaoAtividade := nil;
      //pega a instancia de atividade pela chave se houver
      oInscricaoAtividade :=  oInscricao.getInscricaoAtividadeByChave(
         oInscricao.CodInscricao+
         PrincipalForm.FUMTerminalAcessoXML.UMAtividade.CodigoAtividade
      );
      if not (Assigned(oInscricaoAtividade)) then
      begin
      //   if PrincipalForm.FUMTerminalAcessoXML.UMEvento.SnLiberarInscricoes = '1' then
      //   begin
            //Insere ele na atividade
            inscreveAlunoNovaAtividade(iCodPessoa, PrincipalForm.FUMTerminalAcessoXML.UMAtividade,oInscricao);
      //   end else begin
           //Mostra mensagem
     //       Self.mostraDadosAluno(ASCodPessoa);
     //       Self.mostraMensagem(MSG_SEM_INSCRICAO_ATIVIDADE, clRed);
      //      Self.FTmIntervalo.Enabled := True;
     //    end;
      end
      else
      begin
         Self.mostraDadosAluno(ASCodPessoa);
         Self.ultimoAcesso(oInscricao,PrincipalForm.FUMTerminalAcessoXML.UMAtividade);
      end;

   end else
   begin
      Self.inscreveAluno(ASCodPessoa,PrincipalForm.FUMTerminalAcessoXML.UMAtividade);
   end;
   
   Self.FPnEntrada.Enabled := True;
end;

procedure TfTerminal.processaTeclasAtalho(Sender: TObject; var Key: Word;
  Shift: TShiftState);
var
   sChave: string;
begin
   if Key = VK_ESCAPE then
   begin
      Self.FTmIntervalo.Enabled := False;
      PasswordInputQuery(Application.Title, 'Informe a chave de acesso ao arquivo', sChave, #42);
      if MD5Print(MD5String(sChave)) = PrincipalForm.FUMTerminalAcessoXML.UMEvento.Senha then
      begin
         Self.Close;
      end;   
   end
   else if (Key = VK_F4) and (ssAlt in Shift) then Key := 0;
end;

procedure TfTerminal.relogio(Sender: TObject);
begin
   Self.FPnHorario.Caption := 'Hora atual: ' + FormatDateTime('dd/mm/yyyy hh:nn:ss', Now);
end;


procedure TfTerminal.temporizador(Sender: TObject);
begin
   Self.escondeTerminal;
end;

procedure TfTerminal.temporizadorJanela(Sender: TObject);
begin
   Self.FMensagem.ModalResult := ID_NO;
   Self.FMensagem.Close;
   Self.FTmMensagem.Enabled := False;
   Self.escondeTerminal;
end;

procedure TfTerminal.ultimoAcesso(const oInscricao:TUMTAMInscricao;const oAtividade:TUMTAMAtividade);
var
   oInscricaoAtividade:TUMTAMInscricoesAtividade;
begin

   oInscricaoAtividade := nil;
   oInscricaoAtividade := oInscricao.getInscricaoAtividadeByChave(oInscricao.CodInscricao+oAtividade.CodigoAtividade);

   if(Assigned(oInscricaoAtividade))then
   begin
      with  oInscricaoAtividade do
      begin
         case oInscricao.getTipoAcesso(oInscricaoAtividade,oAtividade) of
            taEntrada:  Self.mostraMensagem(MSG_ENTRADA_LEGAL, clGreen);
            taSaida:    Self.mostraMensagem(MSG_SAIDA, clGreen);
            taSemPagar:
            begin
               if(PrincipalForm.FUMTerminalAcessoXML.UMEvento.SnChecarFinAcesso = '1') then
               begin
                  Self.entradaSemPgto(oInscricao.CodPessoa,oInscricaoAtividade.CodigoInscricaoAtividade);
               end
               else
               begin
                  oInscricao.addEntrada(oAtividade.CodigoAtividade,oInscricaoAtividade.CodigoInscricaoAtividade);
                  Self.mostraMensagem(MSG_ENTRADA_LEGAL, clGreen);
               end;
            end;
         end;
      end;
   end;
end;

procedure TfTerminal.atualizaContador;
begin
   Self.FLbInscritos.Caption := IntToStr(PrincipalForm.FUMTerminalAcessoXML.UMEvento.getTotalInscricoes);
   Self.FLbPresentes.Caption := IntToStr(PrincipalForm.FUMTerminalAcessoXML.UMEvento.getTotalPresencas);
   Self.FLbNaoPresentes.Caption := IntToStr(PrincipalForm.FUMTerminalAcessoXML.UMEvento.getTotalInscricoes - PrincipalForm.FUMTerminalAcessoXML.UMEvento.getTotalPresencas)
end;

end.

