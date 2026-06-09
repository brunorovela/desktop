unit uTerminalOnline;

interface

uses
   General,Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
   Dialogs, StdCtrls, jpeg, ExtCtrls,uXML,uDM, DB, UZDataset, ZAbstractDataset, ZDataset , uModelTam, CropImage, ZAbstractRODataset;

const
   MSG_SAIDA         = 'Obrigado pela presença.';
   MSG_ENTRADA_LEGAL = 'Acesso Confirmado. Seja Bem Vindo(a)!';
   MSG_PENDENCIA_FIN = 'Indentificado problema com a sua inscrição. Contate a coordenação do Evento.';
   MSG_SEM_INSCRICAO = 'Inscrição não localizada. Contate a coordenação do Evento.';
   MSG_SEM_INSCRICAO_ATIVIDADE = 'Inscrição na atividade não localizada. Contate a coordenação do Evento.';
   MSG_SEM_CADASTRO_PESSOA = 'Pessoa não cadastrada no sistema!';
   MSG_INSCRICAO_CONFIRMADA = 'Inscrição Efetuada!';

type
   TfTerminalOnline = class(TForm)
    tblInscricoes: TUMZQuery;
    tblInscricoesCD_INSCRICAO: TLargeintField;
    tblInscricoesCD_EVENTO: TLargeintField;
    tblInscricoesCD_PESSOA: TLargeintField;
    tblInscricoesNM_PESSOA: TStringField;
    tblInscricoesSN_INSCRICAO_EVENTO: TSmallintField;
    tblInscricoesCD_MENSALIDADE: TLargeintField;
    tblInscricoesDT_INSCRICAO: TDateTimeField;
    tblInscricoesAtividades: TUMZQuery;
    tblInscricoesAtividadescd_inscricao_atividade: TLargeintField;
    tblInscricoesAtividadescd_atividade: TLargeintField;
    tblInscricoesAtividadescd_inscricao: TLargeintField;
    tblEntradas: TUMZQuery;
    tblEntradasCD_ENTRADA: TLargeintField;
    tblEntradascd_inscricao_atividade: TLargeintField;
    tblEntradasDT_ENTRADA: TDateTimeField;
    tblEntradasDT_SAIDA: TDateTimeField;
    tblEventos: TUMZQuery;
    tblAtividades: TUMZQuery;
    tblAtividadescd_atividade: TLargeintField;
    tblAtividadescd_evento: TLargeintField;
    tblAtividadesnm_palestrante: TMemoField;
    tblAtividadesds_tema: TMemoField;
    tblAtividadesdt_atividade: TDateField;
    tblAtividadeshr_inicio: TTimeField;
    tblAtividadeshr_fim: TTimeField;
    tblAtividadesnr_horas: TIntegerField;
    tblAtividadesnr_vagas: TIntegerField;
    tblAtividadessn_escolhe: TSmallintField;
    tblAtividadesme_ambiente: TMemoField;
    tblAtividadesds_atividade: TStringField;
    tblEventosCD_EVENTO: TLargeintField;
    tblEventosCD_GESTOR: TLargeintField;
    tblEventosDS_EVENTO: TStringField;
    tblEventosME_EVENTO: TMemoField;
    tblEventosDT_EVENTO: TDateTimeField;
    tblEventosNR_VAGAS: TLargeintField;
    tblEventosVL_INSCRICAO: TFloatField;
    tblEventosDT_VENCIMENTO: TDateField;
    tblEventosDT_INICIO_INSCRICAO: TDateTimeField;
    tblEventosDT_FIM_INSCRICAO: TDateTimeField;
    tblEventosSN_BOLETO: TSmallintField;
    tblEventosSN_CHECAR_FIN_INSCRICAO: TSmallintField;
    tblEventosDT_CADASTRO: TDateTimeField;
    tblEventosDS_SENHA: TStringField;
    tblEventosVL_PRESENCA: TIntegerField;
    tblEventosME_CERTIFICADO: TBlobField;
    tblEventosSN_CONVALIDAR_ATIVIDADES: TSmallintField;
    tblEventosSN_CALCULO_CARGA_HORARIA: TSmallintField;
    tblEventosME_ASSINATURA_1: TBlobField;
    tblEventosME_ASSINATURA_2: TBlobField;
    tblEventosME_ASSINATURA_3: TBlobField;
    tblEventosNR_PARCELA: TSmallintField;
    tblEventosCD_TIPO_TITULO: TLargeintField;
    tblEventosSN_CHECAR_FIN_ACESSO: TSmallintField;
    tblEventosTurmas: TUMZQuery;
    tblEventosTurmasCD_EVENTO_TURMA: TLargeintField;
    tblEventosTurmasCD_EVENTO: TLargeintField;
    tblEventosTurmasCD_TURMA: TStringField;
    tblEventosTurmasCD_DISCIPLINA: TLargeintField;
    tblEventosTurmasCD_CURSO: TStringField;
    tblEventosTurmasNR_ANOSEMESTRE: TLargeintField;
    dsEventos: TDataSource;
    tblEventosSN_LIBERAR_INSCRICOES: TSmallintField;
    tblEventosDT_EVENTO_FIM: TDateTimeField;
    tblEventosME_LOCAL: TMemoField;
    tblEventosCD_GE_ATIVIDADE: TLargeintField;
    Panel1: TPanel;
    imageFoto: TImage;
    lbFoto: TLabel;
   strict private
      FMensagem: TForm;
      FTmMensagem: TTimer;
      FSlParametros: TStringList;
      procedure escondeTerminal;
      procedure atualizaContador;
      procedure temporizadorJanela(Sender: TObject);
      procedure ultimoAcesso(oInscricao: TUMInscricao; oAtividade: TUMAtividade; bInscricaoNaHora:Boolean);
      procedure inscreveAluno(const iCodPessoa: Integer; const oAtividade: TUMAtividade; const oEvento:TUMEvento);
      procedure inscreveAlunoNovaAtividade(const iCodPessoa: Integer; const oAtividade: TUMAtividade; oInscricao: TUMInscricao);
      procedure entradaSemPgto(const oAtividadeInscricao: TUMInscricoesAtividades;const oAtividade:TUMAtividade);
      procedure mostraDadosAluno(const oInscricao: TUMInscricao);
      procedure mostraDadosPessoa(const iCodigoPessoa: Integer);
      procedure processaEntradaSaida(const ASCodPessoa: string);
      procedure mostraMensagem(const ASMsg: string; const Cor: TColor);
      function confirmaOperacao: boolean;
      function temRegistroPessoa(const iCodigoPessoa:Integer):Boolean;
      function getNomePessoa(const iCodigoPessoa:Integer):String;
      procedure carregaImagemAluno(sCodigoAluno:Integer);
      
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
  fTerminalOnline: TfTerminalOnline;

implementation

Uses
  Main, md5,uEscolhaAtividade,DBTables;

{$R *.dfm}

procedure TfTerminalOnline.informaAluno(Sender: TObject; var Key: Char);
begin
   if (Key = #13) and (Self.FEdCodigo.Text <> '') then
   begin
      Self.FTmIntervalo.Enabled := False;
      Self.processaEntradaSaida(Self.FEdCodigo.Text);
      Self.atualizaContador;
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

procedure TfTerminalOnline.inicializaFormulario(Sender: TObject);
begin
   Self.FTmMensagem := TTimer.Create(Self);
   Self.FTmMensagem.Enabled := False;
   Self.FTmMensagem.Interval := 5000;
   Self.FTmMensagem.OnTimer := Self.temporizadorJanela;
end;

function TfTerminalOnline.temRegistroPessoa(
  const iCodigoPessoa: Integer): Boolean;
var
   qryPessoas: TUMZQuery;
begin
      //ver se ele tem entrada na tabela de pessoas
      qryPessoas := DM.newQuery;
      try
         with qryPessoas do
         begin
            SQL.Text:='SELECT * FROM PESSOAS WHERE cd_pessoa=:pCDPessoa';
            ParamByName('pCDPessoa').asInteger := iCodigoPessoa;
            Open;

            if not EOF then
            begin
               Result:= True;
            end
            else begin
               Result:= False;
            end;
         end;
      finally
         qryPessoas.free;
      end;
end;

procedure TfTerminalOnline.inscreveAluno(const iCodPessoa: Integer; const oAtividade: TUMAtividade; const oEvento:TUMEvento);
const
   QUESTAO_INSCRICAO = 'Pessoa não inscrita, deseja permitir o acesso desta pessoa?';
   ENTRADA_NOME = 'Digite o nome do Aluno';
   S_OPERACAO = 'Inclusão';
   S_CHAVE = 'Eventos.Log.Inscricoes';
var
   sNome, ds_obs: string;
   oNovaInscricao : TUMInscricao;

begin
   // Dispara o temporizador de janelas
   Self.escondeTerminal;
   Self.FTmMensagem.Enabled := True;
   Self.FPnMensagem.Visible := False;

   Self.FTmIntervalo.Enabled := False;
   Self.FMensagem := CreateMessageDialog(QUESTAO_INSCRICAO, mtConfirmation, [mbYes, mbNo], mbNo);

   //não libera inscrição automática
   if not (oEvento.SnLiberarInscricoes) then
   begin
      //Pessoa com registro
      if(Self.temRegistroPessoa(iCodPessoa))then
      begin
         //Mostra as informações da pessoa
         Self.mostraDadosPessoa(iCodPessoa);
         //Informa que não possui inscrição e não permite fazer nada
         Self.mostraMensagem(MSG_SEM_INSCRICAO, clRed);
      end
      else
      begin
         //Informa que a pessoa não tem registro an instituição
         Self.mostraMensagem(MSG_SEM_CADASTRO_PESSOA, clRed);
      end;
      Self.FTmIntervalo.Enabled := True;
   end
   else
   begin
      // O evento permite inscrição automática , n pergunta antes e faz
      Self.FTmMensagem.Enabled := False;

      //Pessoa com registro
      if(Self.temRegistroPessoa(iCodPessoa))then
      begin
         sNome:=Self.getNomePessoa(iCodPessoa);
         
         //Adiciona uma nova inscrição
         oNovaInscricao := TUMEvento.addInscricao(oEventoSel,true,sNome,false,iCodPessoa,true);

         ds_obs := '[Eventos] Ação realizada em: Terminal de acesso móvel '
             + #13 + ' Cód. Evento = ' + IntToStr(oEventoSel.getCodigoEvento())
             + #13 + ' Pessoa = ' + IntTostr(iCodPessoa)
             + #13 + ' Cód. Usuário realizou ação = ' + IntTostr( DM.GetUsuarioLogado.Pessoa.Codigo)
             + #13 + ' Data = ' + FormatDateTime('dd/mm/yyyy hh:nn:ss', Now);;

         // Set log -Inclusão
         DM.SetLog(
            34,
            S_OPERACAO,
            S_CHAVE,
            0,
            ds_obs
         );

         //Registra inscrição na atividade selecionada
         TUMInscricoesAtividades.addInscricaoAtividade(oNovaInscricao,oAtividade);

         //Nome do inscrito
         oNovaInscricao.setNomePessoa(sNome);

         //Mostra as informações da nova inscrição
         Self.mostraDadosAluno(oNovaInscricao);

         //Registra o acesso do aluno
         Self.ultimoAcesso(oNovaInscricao,oAtividade,true);

         Self.FTmIntervalo.Enabled := True;
      end
      else
      begin
         //Informa que a pessoa não tem registro an instituição
         Self.mostraMensagem(MSG_SEM_CADASTRO_PESSOA, clRed);
      end;     


   end;


end;

procedure TfTerminalOnline.inscreveAlunoNovaAtividade(const iCodPessoa: Integer; const oAtividade: TUMAtividade; oInscricao: TUMInscricao);
const
   QUESTAO_INSCRICAO = 'Pessoa não inscrita para esta atividade, deseja permitir o acesso desta pessoa?';

begin
   // Dispara o temporizador de janelas
   Self.escondeTerminal;
   Self.FTmMensagem.Enabled := True;
   Self.FPnMensagem.Visible := False;
   //Self.mostraMensagem(MSG_SEM_INSCRICAO, clRed);
   Self.FTmIntervalo.Enabled := False;

   Self.FMensagem := CreateMessageDialog(QUESTAO_INSCRICAO, mtConfirmation, [mbYes, mbNo], mbNo);

   // O evento permite inscrição automática , n pergunta antes e faz
   Self.FTmMensagem.Enabled := False;

   //Registra inscrição na atividade selecionada
   TUMInscricoesAtividades.addInscricaoAtividade(oInscricao,oAtividade);

   //Mostra as informações da nova inscrição
   Self.mostraDadosAluno(oInscricao);

   //Registra o acesso do aluno
   Self.ultimoAcesso(oInscricao,oAtividade,false);


end;

procedure TfTerminalOnline.escondeTerminal;
begin
   Self.FPnDados.Visible := False;
   Self.FPnMensagem.Visible := False;
   Self.FPnUltimoAcesso.Visible := False;
   Self.FTmIntervalo.Enabled := False;
end;

procedure TfTerminalOnline.fechaFormulario(Sender: TObject; var Action: TCloseAction);
begin
   Action := caFree;
end;



function TfTerminalOnline.getNomePessoa(const iCodigoPessoa: Integer): String;
var
   qryPessoas: TUMZQuery;
begin
      //ver se ele tem entrada na tabela de pessoas
      qryPessoas := DM.newQuery;
      try
         with qryPessoas do
         begin
            SQL.Text:='SELECT * FROM PESSOAS WHERE cd_pessoa=:pCDPessoa';
            ParamByName('pCDPessoa').asInteger := iCodigoPessoa;
            Open;

            if not EOF then
            begin
               Result:= FieldByName('nm_pessoa').asString;
            end
            else begin
               Result:= '';
            end;
         end;
      finally
         qryPessoas.free;
      end;

end;

procedure TfTerminalOnline.carregaImagemAluno(sCodigoAluno: Integer);
var
   tblPessoaInfo: TUMZQuery;
   BS: TStream;
   Imagem:TJPEGImage;
begin
   tblPessoaInfo := DM.newQuery;
   try
      with tblPessoaInfo do
      begin
         SQL.Text := 'SELECT im_pessoa FROM pessoas WHERE cd_pessoa=:pCDAluno';
         ParamByName('pCDAluno').AsInteger := sCodigoAluno;
         Open();

         if not EOF then
         begin
            if(FieldByName('im_pessoa').AsString <> '') then
            begin
               imageFoto.visible := True;
               Panel1.Caption := '';
               { Cria o componente BLOBStream baseado no campo qyPessoasFoto em modo leitura (Note: BMREAD) }
               BS := CreateBlobStream((FieldByName('im_pessoa') as TBlobField), BMREAD);
               try
                  try
                     { Cria o componente JPEG }
                     Imagem := TJPEGImage.Create;
                     { Abre no componente JPEG baseado no Stream criado anteriormente que já possui a imagem da base}
                     Imagem.LoadFromStream(BS);
                     { Apenas abre no componente TImage a foto que está aberta no componente JPEG (Imagem)}
                     imageFoto.Picture.Assign(Imagem);
                  except
                     imageFoto.visible := false;
                     Panel1.Caption := 'FOTO';
                  end;
               finally
                 { Libera da memória os componentes criados }
                 FreeAndNil(BS);
                 FreeAndNil(Imagem);
               end;
            end
            else
            begin
               { Coloca uma imagem qualquer no componente TImage }
               imageFoto.visible := false;
               Panel1.Caption := 'X';
            end;
         end;

      end;
   finally
      tblPessoaInfo.Free;
   end; 
end;

function TfTerminalOnline.confirmaOperacao: boolean;
var
   sChave: string;
   bReTentar: boolean;
begin
   Result := False;
   bReTentar := True;
   if not (oEventoSel.SnLiberarInscricoes) then
   begin
      if PasswordInputQuery(Application.Title, 'Informe a senha de acesso:', sChave, #42) then
      begin
         while bReTentar do
         begin

            Result:=( sChave = uEscolhaAtividade.oEventoSel.SenhaAcesso );

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
procedure TfTerminalOnline.entradaSemPgto(const oAtividadeInscricao: TUMInscricoesAtividades;const oAtividade:TUMAtividade);
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
            TUMInscricoesAtividades.addEntradaAtividade(oAtividadeInscricao,oAtividade);
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
      if(Assigned(Self.FMensagem))then
      begin
         //Self.FMensagem.Free;
      end;
   end;
end;

procedure TfTerminalOnline.mostraDadosAluno(const oInscricao: TUMInscricao);
begin
   with oInscricao do
   begin
      Self.FLbCodigo.Caption := IntToStr(CodigoPessoa);
      Self.FLbNome.Caption := NomePessoa;
      Self.FPnDados.Visible := True;
      Self.carregaImagemAluno(CodigoPessoa);
   end;
end;



procedure TfTerminalOnline.mostraDadosPessoa(const iCodigoPessoa: Integer);
var
   qryPessoas:TUMZQuery;
begin
   qryPessoas:= DM.newQuery;
   try
      with qryPessoas do
      begin
         SQL.Text := 'SELECT * FROM pessoas WHERE cd_pessoa=:pCDPessoa';
         ParamByName('pCDPessoa').asInteger:= iCodigoPessoa;
         Open;
         if not EOF then
         begin
            Self.FLbCodigo.Caption := FieldByName('cd_pessoa').asString;
            Self.FLbNome.Caption := FieldByName('nm_pessoa').asString;
            Self.FPnDados.Visible := True;
            Self.carregaImagemAluno(FieldByName('cd_pessoa').asInteger);
         end;         
      end;
   finally
      qryPessoas.Free();
   end;
end;

procedure TfTerminalOnline.mostraFormulario(Sender: TObject);
begin
      
   Self.Width := Screen.Width;
   Self.Height := Screen.Height;
   Self.FTmMensagem := TTimer.Create(Self);
   Self.FTmMensagem.Enabled := False;
   Self.FTmMensagem.OnTimer := Self.temporizadorJanela;
   Self.FTmMensagem.Interval := 9999; 
   Self.atualizaContador;
end;

procedure TfTerminalOnline.mostraMensagem(const ASMsg: string; const Cor: TColor);
begin
   Self.FPnMensagem.Caption := ASMsg;
   Self.FPnMensagem.Color := Cor;
   Self.FPnMensagem.Visible := True;
   Self.FTmIntervalo.Enabled := True;
end;

procedure TfTerminalOnline.processaEntradaSaida(const ASCodPessoa: string);
var
   oInscricao:TUMInscricao;
   iCodPessoa:Integer;
   oInscricaoAtividade:TUMInscricoesAtividades;
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
   oInscricao := TUMInscricao.getInscricao(oEventoSel.getCodigoEvento,iCodPessoa);



   //Se ja tem uma inscrição para esse aluno
   if(Assigned(oInscricao))then
   begin
      //verificar se tem inscrição na atividade
      oInscricaoAtividade := TUMInscricoesAtividades.getInscricaoAtividade(oInscricao,oAtividadeSel);

      //ainda não está inscrito para esta atividade
      if not (Assigned(oInscricaoAtividade)) then
      begin
         if oEventoSel.SnLiberarInscricoes then
         begin
            //Insere ele na atividade
            inscreveAlunoNovaAtividade(iCodPessoa,oAtividadeSel,oInscricao);
         end else begin
            //Mostra mensagem
            Self.mostraDadosPessoa(iCodPessoa);
            Self.mostraMensagem(MSG_SEM_INSCRICAO_ATIVIDADE, clRed);
            Self.FTmIntervalo.Enabled := True;
         end;
      end
      else
      begin
         //Já ta inscrito na atividade e no evento , mostra mensagem de confirmação
         Self.mostraDadosAluno(oInscricao);
         Self.ultimoAcesso(oInscricao,oAtividadeSel,false);
      end;
   end
   else
   begin
      //Inscreve aluno no evento e na atividade selecionada
      if(Assigned(oAtividadeSel) and Assigned(oEventoSel)) then
      begin
         Self.inscreveAluno(iCodPessoa,oAtividadeSel,oEventoSel);
      end;
   end;

   Self.FPnEntrada.Enabled := True;
end;

procedure TfTerminalOnline.processaTeclasAtalho(Sender: TObject; var Key: Word;
  Shift: TShiftState);
var
   sChave: string;
begin
   if Key = VK_ESCAPE then
   begin
      Self.FTmIntervalo.Enabled := False;
      PasswordInputQuery(Application.Title, 'Informe a chave de acesso do evento', sChave, #42);
      if( sChave = uEscolhaAtividade.oEventoSel.SenhaAcesso )then
      begin
         Self.Close;  
      end;
   end
   else if (Key = VK_F4) and (ssAlt in Shift) then Key := 0;
end;

procedure TfTerminalOnline.relogio(Sender: TObject);
begin
   Self.FPnHorario.Caption := 'Hora atual: ' + FormatDateTime('dd/mm/yyyy hh:nn:ss', Now);
end;


procedure TfTerminalOnline.temporizador(Sender: TObject);
begin
   Self.escondeTerminal;
end;

procedure TfTerminalOnline.temporizadorJanela(Sender: TObject);
begin
   Self.FMensagem.ModalResult := ID_NO;
   Self.FMensagem.Close;
   Self.FTmMensagem.Enabled := False;
   Self.escondeTerminal;
end;



procedure TfTerminalOnline.ultimoAcesso(oInscricao: TUMInscricao; oAtividade: TUMAtividade;bInscricaoNaHora:Boolean);
var
   oInscricaoAtividade : TUMInscricoesAtividades;
   msgEntrada : String;
begin
   oInscricaoAtividade := nil;
   //recupera a inscrição na atividade selecionada
   oInscricaoAtividade := TUMInscricoesAtividades.getInscricaoAtividade(oInscricao,oAtividade);

   if(Assigned(oInscricaoAtividade))then
   begin
      with oInscricaoAtividade do
      begin
         case getTipoAcesso(oInscricao,oInscricaoAtividade) of
            taEntrada:
            begin
               addEntradaAtividade(oInscricaoAtividade,oAtividade);
               
               msgEntrada := MSG_ENTRADA_LEGAL;
               if bInscricaoNaHora then
               begin
                  msgEntrada := MSG_INSCRICAO_CONFIRMADA;
               end;
               Self.mostraMensagem(MSG_ENTRADA_LEGAL, clGreen);
            end;

            taSaida:    Self.mostraMensagem(MSG_SAIDA, clGreen);
            taSemPagar:
            begin
               if(oEventoSel.SnCheckarFinanceiroAcesso) then
               begin
                  Self.entradaSemPgto(oInscricaoAtividade,oAtividade);
                  exit;
               end;

               addEntradaAtividade(oInscricaoAtividade,oAtividade);

               msgEntrada := MSG_ENTRADA_LEGAL;
               if bInscricaoNaHora then
               begin
                  msgEntrada := MSG_INSCRICAO_CONFIRMADA;
               end;
               Self.mostraMensagem(msgEntrada, clGreen);
            end;
         end;
      end;
   end;
   
end;

procedure TfTerminalOnline.atualizaContador;
var
   iNrInscricoes,iNrFaltantes,iNrPresentes:Integer;
begin

   iNrInscricoes := TUMInscricao.getTotalInscricoes(oEventoSel);
   iNrPresentes  := TUMInscricao.getTotalPresentes(oEventoSel);;
   iNrFaltantes  := iNrInscricoes - iNrPresentes;


   Self.FLbInscritos.Caption := IntToStr(iNrInscricoes);
   Self.FLbPresentes.Caption := IntToStr(iNrPresentes);
   Self.FLbNaoPresentes.Caption := IntToStr(iNrFaltantes);

end;

end.

