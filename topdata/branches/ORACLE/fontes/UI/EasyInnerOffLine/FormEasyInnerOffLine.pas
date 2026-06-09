//******************************************************************************
//A Topdata Sistemas de Automação Ltda não se responsabiliza por qualquer
//tipo de dano que este software possa causar, este exemplo deve ser utilizado
//apenas para demonstrar a comunicação com os equipamentos da linha Inner.
//
//Exemplo Off-Line
//Desenvolvido em Visual Basic 6.
//                                           Topdata Sistemas de Automação Ltda.
//******************************************************************************

unit FormEasyInnerOffLine;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, Constantes, EasyInnerDLL, ExtCtrls, jpeg, ImgList;

type
  TFrmEasyInnerOffLine = class(TForm)
    btnEnviar: TButton;
    btnReceber: TButton;
    GroupBox2: TGroupBox;
    lblInner: TLabel;
    lblTipoConexao: TLabel;
    lblPorta: TLabel;
    txtNumInner: TEdit;
    cboTipoConexao: TComboBox;
    txtPorta: TEdit;
    lblQdtDigitos: TLabel;
    txtDigitos: TEdit;
    lblTipoLeitor: TLabel;
    cboTipoLeitor: TComboBox;
    chkDoisLeitores: TCheckBox;
    GroupBox3: TGroupBox;
    lblVersao: TMemo;
    lblTipoEquipamento: TLabel;
    cboEquipamento: TComboBox;
    lblEnvia: TLabel;
    chkHorarios: TCheckBox;
    chkLista: TCheckBox;
    chkBio: TCheckBox;
    chkRelogio: TCheckBox;
    chkMensagem: TCheckBox;
    chkSirene: TCheckBox;
    chkTeclado: TCheckBox;
    chkListaBio: TCheckBox;
    chkVerificacao: TCheckBox;
    chkIdentificacao: TCheckBox;
    Label1: TLabel;
    rdbPadraoLivre: TRadioButton;
    rdbPadraoTopdata: TRadioButton;
    lblBilhetes: TLabel;
    lstBilhetes: TListBox;
    Label2: TLabel;
    lblCatraca: TLabel;
    imgCatraca: TImage;
    Label3: TLabel;
    optEsquerda: TRadioButton;
    optDireita: TRadioButton;
    txtCatraoMaster: TEdit;
    chkCartaoMaster: TCheckBox;
    procedure btnEnviarClick(Sender: TObject);
    procedure btnReceberClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure cboTipoConexaoClick(Sender: TObject);
    //procedure chkHorariosClick(Sender: TObject);
    procedure chkBioClick(Sender: TObject);
    procedure chkListaBioClick(Sender: TObject);
    procedure chkVerificacaoClick(Sender: TObject);
    procedure cboTipoLeitorChange(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure cboEquipamentoChange(Sender: TObject);
    procedure optEsquerdaClick(Sender: TObject);
    procedure optDireitaClick(Sender: TObject);
    procedure chkCartaoMasterClick(Sender: TObject);
    procedure rdbPadraoTopdataClick(Sender: TObject);
  private
    procedure MontarConfiguracoes;
    procedure MontarMensagem;
    procedure MontarHorarios;
    procedure MontarListaTopdata;
    procedure MontarListaLivre;
    procedure MontarListaInnerBio;
    procedure ReceberBilhetes;
    procedure ReceberBilhetesInnerAcesso;
    function Retornar_SegundosSys : double;
    function Conectar(): Boolean;
    function DefineVersao(): Boolean;
    function Formata(const valor:String): String;
    function testaConexaoInner(NumInner:Integer):Integer;

    { Private declarations }
  public

    { Public declarations }
  end;

var
  FrmEasyInnerOffLine: TFrmEasyInnerOffLine;
  Ret                : Byte;
  Linha              : Integer;
  Variacao           : Integer;
  VersaoAlta         : Integer;
  VersaoBaixa        : Integer;
  VersaoSufixo       : Integer;
  InnerNetAcesso     : Boolean;
  InnerAcessoBIO     : Byte;


implementation

{$R *.DFM}

//***********************************************************************************
//Esta função ajusta as casas decimais para segundos
//***********************************************************************************
function TFrmEasyInnerOffLine.Retornar_SegundosSys : double;
begin
  Retornar_SegundosSys := (GetTickCount/DIV_SEGUNDOS);
end;

//***********************************************************************************
//Realiza o teste de conexão com o Inner
//***********************************************************************************
function TFrmEasyInnerOffLine.testaConexaoInner(NumInner : Integer):Integer;
Var
 RetRelogio : Byte;
 Dia : Byte;
 Mes : Byte;
 Ano : Byte;
 Hora : Byte;
 Minuto :Byte;
 Segundo : Byte;
Begin
     Dia := 0;
     Mes := 0;
     Ano := 0;
     Hora := 0;
     Minuto := 0;
     Segundo := 0;

     testaConexaoInner := ReceberRelogio(NumInner,@dia,@mes,@ano,@hora,@minuto,@segundo);
      Application.ProcessMessages;
END;

//***********************************************************************************
//CONECTAR
//Rotina responsável por efetuar a conexão com o Inner
//***********************************************************************************
Function TFrmEasyInnerOffLine.Conectar(): Boolean;
var
  Fim: Double;
  Data : TDateTime;
  Ret : Integer;
begin

  //Define qual será o tipo de conexão(meio de comunicação) que será utilizada
  //pela dll para comunicar com os Inners. Essa função deverá ser chamada antes
  //de iniciar o processo de comunicação e antes da função AbrirPortaComunicacao.
  DefinirTipoConexao(cboTipoConexao.ItemIndex);

  //Define qual padrão de cartão será utilizado pelos Inners
  //padrão Topdata ou padrão livre.
  if rdbPadraoLivre.Checked then
    DefinirPadraoCartao(TpCartao_PADRAO_LIVRE)
  else
    DefinirPadraoCartao(TpCartao_TOPDATA);

  //Fecha a porta de comunicação previamente aberta, seja ela serial, Modem ou TCP/IP.
  //FecharPortaComunicacao();

  //Abre a porta de comunicação desejada, essa função deverá ser chamada antes
  //de iniciar qualquer processo de transmissão ou recepção de dados com o Inner.
  Ret := AbrirPortaComunicacao(StrToInt(txtPorta.Text));
  Conectar := False;
  If (Ret = RET_COMANDO_OK) Then begin
    Ret := RET_COMANDO_ERRO;

    Fim := Retornar_SegundosSys() + 15;
    while (Retornar_SegundosSys() <= Fim) and (Ret <> RET_COMANDO_OK) do begin
         Application.ProcessMessages;
         Ret := testaConexaoInner(StrToInt(txtNumInner.Text));
     IF (Ret = RET_COMANDO_OK) THEN
     BEGIN
      Conectar := true;
     END;
     sleep(5);
    end;
  End;
End;

//***********************************************************************************
//MONTAR CONFIGURAÇÕES
//Esta rotina monta o buffer para enviar a configuração do Inner
//***********************************************************************************
procedure TFrmEasyInnerOffLine.MontarConfiguracoes;
begin

    //Antes de realizar a configuração precisa definir o Padrão do cartão
    //Topdata ou padrão livre.
    if rdbPadraoLivre.Checked then
     DefinirPadraoCartao(TpCartao_PADRAO_LIVRE)
    else
     DefinirPadraoCartao(TpCartao_TOPDATA);

    //Modo de comunicação
    //Configurações para Modo Offline.
    //Prepara o Inner para trabalhar no modo Off-Line, porém essa função ainda
    //não envia essa informação para o equipamento.
    ConfigurarInnerOffLine();

    //Verificar
    //Acionamentos 1 e 2
    //Configura como irá funcionar o acionamento(rele) 1 e 2 do Inner, e por
    //quanto tempo ele será acionado.
    case cboEquipamento.ItemIndex of
        //Coletor
        Acionamento_Coletor:
        begin
          if (chkSirene.Checked) then
            begin
               ConfigurarAcionamento1(FncAcionamento_CONECTADO_SIRENE, 5);
               ConfigurarAcionamento2(FncAcionamento_NAO_UTILIZADO, 0);
            end
          else
            begin
                ConfigurarAcionamento1(FncAcionamento_ACIONA_REGISTRO_ENTRADA_OU_SAIDA, 5);
                ConfigurarAcionamento2(FncAcionamento_ACIONA_REGISTRO_ENTRADA_OU_SAIDA, 3);
            end;
        end;

        //Catraca  entrada e saida, libera conforme leitor
        Acionamento_Catraca_Entrada_E_Saida:
        begin
          ConfigurarAcionamento1(FncAcionamento_ACIONA_REGISTRO_ENTRADA_OU_SAIDA, 5);
          ConfigurarAcionamento2(FncAcionamento_NAO_UTILIZADO, 0);

          ConfigurarLeitor1(EntradasOff_LEITOR1_ENTRADA_SAIDA);

            if(chkDoisLeitores.Checked) then
              begin
                ConfigurarLeitor2(EntradasOff_LEITOR2_ENTRADA_SAIDA);
              end
            else
              begin
                ConfigurarLeitor2(EntradasOff_LEITOR2_DESABILITADO);
           end;
        end;

        // catraca somente de entrada
        Acionamento_Catraca_Entrada:
        begin
          //Se Esquerda Selecionado - Inverte código
          If (cboEquipamento.ItemIndex <> Acionamento_Coletor) And (optDireita.Checked) Then
            begin
               ConfigurarAcionamento1(FncAcionamento_ACIONA_REGISTRO_ENTRADA, 5);
               ConfigurarLeitor1(EntradasOff_LEITOR1_SOMENTE_ENTRADA);
            end
          else
            begin
               ConfigurarAcionamento1(FncAcionamento_ACIONA_REGISTRO_SAIDA, 5);
               ConfigurarLeitor1(EntradasOff_LEITOR1_SOMENTE_SAIDA);
          end;

          ConfigurarAcionamento2(FncAcionamento_NAO_UTILIZADO, 0);
          ConfigurarLeitor2(EntradasOff_LEITOR2_DESABILITADO);
        end;

       //catraca somente de saida
        Acionamento_Catraca_Saida:
        begin
          //Se Esquerda Selecionado - Inverte código
           If (cboEquipamento.ItemIndex <> Acionamento_Coletor) And (optDireita.Checked) Then
             begin
               ConfigurarAcionamento1(FncAcionamento_ACIONA_REGISTRO_SAIDA, 5);
               ConfigurarLeitor1(EntradasOff_LEITOR1_SOMENTE_SAIDA);
             end
           else
             begin
                ConfigurarAcionamento1(FncAcionamento_ACIONA_REGISTRO_ENTRADA, 5);
                ConfigurarLeitor1(EntradasOff_LEITOR1_SOMENTE_ENTRADA);
           end;

          ConfigurarAcionamento2(FncAcionamento_NAO_UTILIZADO, 0);
          ConfigurarLeitor2(EntradasOff_LEITOR2_DESABILITADO);
        end;


            //catraca com urna
        Acionamento_Catraca_Urna:
        begin
          ConfigurarAcionamento1(FncAcionamento_ACIONA_REGISTRO_ENTRADA_OU_SAIDA, 5);
          ConfigurarAcionamento2(FncAcionamento_ACIONA_REGISTRO_SAIDA, 5);

          ConfigurarLeitor1(EntradasOff_LEITOR1_SOMENTE_ENTRADA);
          ConfigurarLeitor2(EntradasOff_LEITOR2_ENTRADA_SAIDA);

        end;
        
        //catraca de entrada com saída liberada
        Acionamento_Catraca_Saida_Liberada:
        begin
          //Se Esquerda Selecionado - Inverte código
           If (cboEquipamento.ItemIndex <> Acionamento_Coletor) And (optDireita.Checked) Then
             begin
                 ConfigurarAcionamento1(FncAcionamento_CATRACA_SAIDA_LIBERADA, 5);
                 ConfigurarLeitor1(EntradasOff_LEITOR1_SOMENTE_ENTRADA);
             end
           Else
             begin
                 ConfigurarAcionamento1(FncAcionamento_CATRACA_ENTRADA_LIBERADA, 5);
                 ConfigurarLeitor1(EntradasOff_LEITOR1_SOMENTE_SAIDA);
             end;
          ConfigurarAcionamento2(FncAcionamento_NAO_UTILIZADO, 0);

          ConfigurarLeitor2(EntradasOff_LEITOR2_DESABILITADO);
        end;

        //catraca de saída com entrada liberada
        Acionamento_Catraca_Entrada_Liberada:
        begin
         //Se Esquerda Selecionado - Inverte código
           If (cboEquipamento.ItemIndex <> Acionamento_Coletor) And (optDireita.Checked) Then
             begin
                 ConfigurarAcionamento1(FncAcionamento_CATRACA_ENTRADA_LIBERADA, 5);
                 ConfigurarLeitor1(EntradasOff_LEITOR1_SOMENTE_SAIDA);
             end
           Else
             begin
                 ConfigurarAcionamento1(FncAcionamento_CATRACA_SAIDA_LIBERADA, 5);
                 ConfigurarLeitor1(EntradasOff_LEITOR1_SOMENTE_ENTRADA);
           end;

         ConfigurarAcionamento2(FncAcionamento_NAO_UTILIZADO, 0);



         ConfigurarLeitor2(EntradasOff_LEITOR2_DESABILITADO);
        end;

        //catraca livre nos dois sentidos
        Acionamento_Catraca_Liberada_2_Sentidos:
        begin
           ConfigurarAcionamento1(FncAcionamento_CATRACA_LIBERADA_DOIS_SENTIDOS, 5);
           ConfigurarAcionamento2(FncAcionamento_NAO_UTILIZADO, 0);
           ConfigurarLeitor1(EntradasOff_LEITOR1_ENTRADA_SAIDA);

           if(chkDoisLeitores.Checked) then
             begin
                ConfigurarLeitor2(EntradasOff_LEITOR2_ENTRADA_SAIDA);
             end
           else
             begin
                ConfigurarLeitor2(EntradasOff_LEITOR2_DESABILITADO);
           end;
        end;

        //catraca bloqueda nos dois sentidos, libera nos dois sentidos e faz registro conforme o giro
        Acionamento_Catraca_Sentido_Giro:
        begin
          ConfigurarAcionamento1(FncAcionamento_CATRACA_LIBERADA_DOIS_SENTIDOS_MARCACAO_REGISTRO, 5);
          ConfigurarAcionamento2(FncAcionamento_NAO_UTILIZADO, 0);
          ConfigurarLeitor1(EntradasOff_LEITOR1_ENTRADA_SAIDA);

          if(chkDoisLeitores.Checked) then
            begin
               ConfigurarLeitor2(EntradasOff_LEITOR2_ENTRADA_SAIDA);
            end
          else
            begin
               ConfigurarLeitor2(EntradasOff_LEITOR2_DESABILITADO);
          end;
        end;

    end;

    //Configura o tipo do leitor que o Inner está utilizando, se é um leitor
    //de código de barras, magnético ou proximidade.
    Case cboTipoLeitor.ItemIndex Of
       TpLeitor_CODIGO_DE_BARRAS:
                BEGIN
                   ConfigurarTipoLeitor(TpLeitor_CODIGO_DE_BARRAS);
                END;

                TpLeitor_MAGNETICO:
                BEGIN
                  ConfigurarTipoLeitor(TpLeitor_MAGNETICO);
                END;

                TpLeitor_PROXIMIDADE_ABATRACK2:
                BEGIN
                 ConfigurarTipoLeitor(TpLeitor_PROXIMIDADE_ABATRACK2);
                END;

                TpLeitor_WIEGAND:
                BEGIN
                 ConfigurarTipoLeitor(TpLeitor_WIEGAND);
                 END;

                TpLeitor_PROXIMIDADE_SMART_CARD_SERIAL:
                BEGIN
                 ConfigurarTipoLeitor(TpLeitor_PROXIMIDADE_SMART_CARD_SERIAL)
                END;

                TpLeitor_CODIGO_BARRAS_SERIAL:
                BEGIN
                 ConfigurarTipoLeitor(TpLeitor_CODIGO_BARRAS_SERIAL)
                END;

                TpLeitor_WIEGAND_FC_SEM_ZERO:
                BEGIN
                 ConfigurarTipoLeitor(TpLeitor_WIEGAND_FC_SEM_ZERO)
                END;
    End;

    //Define a quantidade de dígitos dos cartões a serem lidos pelo Inner.
    DefinirQuantidadeDigitosCartao(StrToInt(txtDigitos.Text));

    
   IF(chkCartaoMaster.Checked) then
   begin
   DefinirNumeroCartaoMaster(txtCatraoMaster.Text);
   end;

    //Habilitar teclado
    //Permite que os dados sejam inseridos no Inner através do teclado do
    //equipamento. Habilitando o parâmetro ecoar, o teclado irá ecoar asteriscos
    //no display do Inner.
    If(chkTeclado.Checked) Then
       HabilitarTeclado(Opcao_SIM, 0)
    else
       HabilitarTeclado(Opcao_NAO, 0);

    //ConfigurarLeitor: Configura as operações que o leitor irá executar. Se irá
    //registrar os dados somente como entrada independente do sentido em que o
    //cartão for passado, somente como saída ou como entrada e saída.
    If ((chkDoisLeitores.Checked)) Then
    begin
      ConfigurarWiegandDoisLeitores(0, Opcao_SIM);
    End;

    //Define qual tipo de lista(controle) de acesso o Inner vai utilizar
    if(chkLista.Checked) then
        DefinirTipoListaAcesso(1)
    else
        DefinirTipoListaAcesso(0);

    //Configura o Inner para registrar as tentativas de acesso negado.
    RegistrarAcessoNegado(1);

    //Catraca
    //Define qual será o tipo do registro realizado pelo Inner ao aproximar um
    //cartão do tipo proximidade no leitor do Inner, sem que o usuário tenha
    //pressionado a tecla entrada, saída ou função.
    If ((cboEquipamento.ItemIndex = Acionamento_Catraca_Entrada_E_Saida) Or (cboEquipamento.ItemIndex = Acionamento_Catraca_Liberada_2_Sentidos) Or (cboEquipamento.ItemIndex = Acionamento_Catraca_Sentido_Giro)) Then
    begin
       DefinirFuncaoDefaultLeitoresProximidade(12); // 12 – Libera a catraca nos dois sentidos e registra o bilhete conforme o sentido giro.
    end
    Else
    begin
       If ((cboEquipamento.ItemIndex = Acionamento_Catraca_Entrada) Or (cboEquipamento.ItemIndex = Acionamento_Catraca_Saida_Liberada)) Then
        begin
         if (optDireita.Checked) then
           DefinirFuncaoDefaultLeitoresProximidade(10)  // 10 – Registrar sempre como entrada.
         Else
           DefinirFuncaoDefaultLeitoresProximidade(11);  // 11 – Registrar sempre como saída.

        end
        else
         begin
          if (optDireita.Checked) then
            DefinirFuncaoDefaultLeitoresProximidade(11)  // 11 – Registrar sempre como saída.
          Else
            DefinirFuncaoDefaultLeitoresProximidade(10);  // 10 – Registrar sempre como entrada.
         end;
    End;

    //Configura o tipo de registro que será associado a uma marcação, quando
    //for inserido o dedo no Inner bio sem que o usuário tenha definido se é um
    //entrada, saída, função, etc.
    DefinirFuncaoDefaultSensorBiometria(0);

    //ConfigurarBioVariavel(1);

end;

//***********************************************************************************
//MONTAR MENSAGEM
//Esta rotina é responsável por montar o buffer para o envio de mensagens
//***********************************************************************************
procedure TFrmEasyInnerOffLine.MontarMensagem;
begin
  DefinirMensagemEntradaOffLine(1, 'CATRACA LIBERADA');
  DefinirMensagemSaidaOffLine(1, 'CATRACA LIBERADA');
  DefinirMensagemPadraoOffLine(1, '    OFF LINE    ');
end;

//***********************************************************************************
//MONTAR HORARIOS
//Monta o buffer para enviar os horários de acesso
//Tabela de horários número 1
//***********************************************************************************
procedure TFrmEasyInnerOffLine.MontarHorarios;
var
iLinhas,i :Integer;
sLinhas:vetHor;
begin

   InserirHorarioAcesso (1, Segunda, InicioFaixa1, 8, 0);  //   'inicio faixa 1
   InserirHorarioAcesso (1, Segunda, FimFaixa1, 12, 0);    //   'fim faixa 1
   InserirHorarioAcesso (1, Segunda, InicioFaixa2, 13, 0); //   'Inicio faixa 2
   InserirHorarioAcesso (1, Segunda, FimFaixa2, 16, 0) ;   //   'fim faixa 2

   InserirHorarioAcesso (1, Terca, InicioFaixa1, 9, 0);    //   'inicio faixa 1
   InserirHorarioAcesso (1, Terca, FimFaixa1, 11, 0);      //   'fim faixa 1
   InserirHorarioAcesso (1, Terca, InicioFaixa2, 13, 0);   //   'Inicio faixa 2
   InserirHorarioAcesso (1, Terca, FimFaixa2, 20, 0 );     //   'fim faixa 2

   InserirHorarioAcesso (1, Quarta, InicioFaixa1, 6, 0);   //   'inicio faixa 1
   InserirHorarioAcesso (1, Quarta, FimFaixa1, 9, 0);      //   'fim faixa 1
   InserirHorarioAcesso (1, Quarta, InicioFaixa2, 14, 0);  //   'Inicio faixa 2
   InserirHorarioAcesso (1, Quarta, FimFaixa2, 21, 0 );    //   'fim faixa 2

   InserirHorarioAcesso (1, Quinta, InicioFaixa1, 6, 0);   //   'inicio faixa 1
   InserirHorarioAcesso (1, Quinta, FimFaixa1, 9, 0);      //   'fim faixa 1
   InserirHorarioAcesso (1, Quinta, InicioFaixa2, 14, 0);  //   'Inicio faixa 2
   InserirHorarioAcesso (1, Quinta, FimFaixa2, 21, 0);     //   'fim faixa 2

   InserirHorarioAcesso (1, Sexta, InicioFaixa1, 9, 0);    //   'inicio faixa 1
   InserirHorarioAcesso (1, Sexta, FimFaixa1, 11, 0);      //   'fim faixa 1
   InserirHorarioAcesso (1, Sexta, InicioFaixa2, 13, 0);   //   'Inicio faixa 2
   InserirHorarioAcesso (1, Sexta, FimFaixa2, 20, 0);      //   'fim faixa 2

   InserirHorarioAcesso (1, Sabado, InicioFaixa1, 9, 0);   //   'inicio faixa 1
   InserirHorarioAcesso (1, Sabado, FimFaixa1, 10, 0);     //   'fim faixa 1
   InserirHorarioAcesso (1, Sabado, InicioFaixa2, 11, 0);  //   'Inicio faixa 2
   InserirHorarioAcesso (1, Sabado, FimFaixa2, 13, 0);     //   'fim faixa 2

end;

//***********************************************************************************
//MONTAR LISTA TOPDATA
//Monta o buffer para enviar a lista nos inners da linha Inner, cartão padrão Topdata
//***********************************************************************************
procedure TFrmEasyInnerOffLine.MontarListaTopdata;
var
iLinhas,i :Integer;
sLinhas:vetUsu;
begin

  //Define qual padrão o Inner vai usar
  DefinirPadraoCartao(TpCartao_TOPDATA);

  //Quantidade de digitos que o cartao usará
  DefinirQuantidadeDigitosCartao(14);

  for i := 0 to 5 do begin
      //Insere usuário da lista no buffer da DLL
      InserirUsuarioListaAcesso(IntToStr(i), 101);
  end;

end;

//***********************************************************************************
//MONTAR LISTA LIVRE
//Monta o buffer para enviar a lista nos inners da linha Inner, cartão padrão livre 14 dígitos
//***********************************************************************************
procedure TFrmEasyInnerOffLine.MontarListaLivre;
begin

  //Define qual padrão o Inner vai usar
  DefinirPadraoCartao(TpCartao_PADRAO_LIVRE);

  //Quantidade de digitos que o cartao usará
  DefinirQuantidadeDigitosCartao( StrToInt(txtDigitos.Text));
  
  //inserir usuário na lista de acesso Off-Line
  InserirUsuarioListaAcesso('1',101);
  InserirUsuarioListaAcesso('187',101);
  InserirUsuarioListaAcesso('123456',101);
  InserirUsuarioListaAcesso('27105070',101);
  InserirUsuarioListaAcesso('103086639459',101);
end;

//***********************************************************************************
//APENAS PARA O INNER BIO
//Monta o buffer da lista de cartões dos usuários sem digital no Inner bio
//***********************************************************************************
procedure TFrmEasyInnerOffLine.MontarListaInnerBio;
begin
  if InnerNetAcesso then
  Begin

    IncluirUsuarioSemDigitalBioInnerAcesso('666');
    IncluirUsuarioSemDigitalBioInnerAcesso('1000');
    IncluirUsuarioSemDigitalBioInnerAcesso('3007');
  End
  Else
  Begin
    IncluirUsuarioSemDigitalBio('666');
    IncluirUsuarioSemDigitalBio('1000');
    IncluirUsuarioSemDigitalBio('3007');
  End;
end;

//***********************************************************************************
//Formata número menor que 10 com zero na frente
//***********************************************************************************
function TFrmEasyInnerOffLine.Formata(const valor:String): String;
begin
  if (StrtoInt(valor) < 10) then
     Formata := '0'+InttoStr(StrtoInt(valor))
  else
     Formata := valor;
end;

//***********************************************************************************
//COLETAR BILHETES
//Esta rotina efetua a coleta de bilhetes que foram registrados em off-line
//***********************************************************************************
procedure TFrmEasyInnerOffLine.ReceberBilhetes;
var
  Fim: Double;
  nBilhetes: Integer;
  Bilhete: typeBilhete;

begin

    nBilhetes := 0;

    //Tempo de coleta 15 segundos
    Fim := Retornar_SegundosSys() + 15;
    while (Retornar_SegundosSys() <= Fim) do
    begin
      Sleep(100);
      //Coleta um bilhete Off-Line que está armazenado na memória do Inner
      Ret := ColetarBilhete(StrToInt(txtNumInner.Text), @Bilhete.Tipo, @Bilhete.Dia, @Bilhete.Mes, @Bilhete.Ano,
                            @Bilhete.Hora, @Bilhete.Minuto, Bilhete.Cartao);

      If (Ret = RET_COMANDO_OK) Then
      begin
        //Armazena os dados do bilhete no list, pode ser utilizado com banco de dados ou outro
        //meio de armazenamento compatível
        lstBilhetes.Items.Add('Tipo: ' + IntToStr(Bilhete.Tipo) + ' Cartão: ' + Bilhete.Cartao + ' Data: ' +
                             Formata(IntToStr(Bilhete.Dia)) + '/' + Formata(InttoStr(Bilhete.Mes)) + '/' + Formata(IntToStr(Bilhete.Ano)) + ' Hora: ' +
                             Formata(IntToStr(Bilhete.Hora)) + ':' + Formata(IntToStr(Bilhete.Minuto)));

        Fim := Retornar_SegundosSys() + 15;
        nBilhetes := nBilhetes + 1;
      end;
    end;

    //Mensagens de Status
    lblBilhetes.Caption := 'Foram coletados ' + IntToStr(nBilhetes) + ' bilhete(s) offline !';
end;

//***********************************************************************************
//COLETAR BILHETES
//Esta rotina efetua a coleta de bilhetes que foram registrados em offline
//***********************************************************************************
procedure TFrmEasyInnerOffLine.ReceberBilhetesInnerAcesso;
var
    //Declaração variáveis
    Bilhete: typeBilhete;
    Fim: Single;
    nBilhetes: Longint;
    QtdeBilhetes: Integer;
    ColetarOffline: Boolean;
begin
    //Mensagem Status
    lblBilhetes.Caption := 'Conectando com o Inner...';
    nBilhetes := 0;
    //Verifica conexão
    QtdeBilhetes :=0;

    //Mensagem Status
    lblBilhetes.Caption := 'Coletando bilhetes...';
    ReceberQuantidadeBilhetes(StrToInt(txtNumInner.Text), @QtdeBilhetes);
    lblBilhetes.Caption := 'Foram coletados 0 bilhete(s)!';

    while (QtdeBilhetes > 0) do
    begin

        If Not (QtdeBilhetes = 0) Then
        begin
            While (QtdeBilhetes > 0) do
            begin

                With Bilhete do begin

                 Ret := ColetarBilhete(StrToInt(txtNumInner.Text), @Bilhete.Tipo, @Bilhete.Dia, @Bilhete.Mes, @Bilhete.Ano,
                        @Bilhete.Hora, @Bilhete.Minuto, Bilhete.Cartao);

                 If (Ret = RET_COMANDO_OK) Then
                 begin
                     //Armazena os dados do bilhete no list, pode ser utilizado com banco de dados ou outro
                     //meio de armazenamento compatível
                     lstBilhetes.Items.Add('Tipo: ' + IntToStr(Bilhete.Tipo) + ' Cartão: ' + Bilhete.Cartao + ' Data: ' +
                        Formata(IntToStr(Bilhete.Dia)) + '/' + Formata(InttoStr(Bilhete.Mes)) + '/' + Formata(IntToStr(Bilhete.Ano)) + ' Hora: ' +
                        Formata(IntToStr(Bilhete.Hora)) + ':' + Formata(IntToStr(Bilhete.Minuto)));

                     Fim := Retornar_SegundosSys() + 15;
                     nBilhetes := nBilhetes + 1;
                     QtdeBilhetes := QtdeBilhetes - 1;
                 end;
                End;
            end;
            //Mensagens de Status
            lblBilhetes.Caption := 'Foram coletados ' + IntToStr(nBilhetes) + ' bilhete(s) offline !';
            ReceberQuantidadeBilhetes(StrToInt(txtNumInner.Text), @QtdeBilhetes);
        End;
    end;


end;

//***********************************************************************************
//ENVIAR
//Envia as configurações, relógio, mensagem, horários, lista de acesso, horário
//da sirene, lista dos inners.
//***********************************************************************************
procedure TFrmEasyInnerOffLine.btnEnviarClick(Sender: TObject);
label
  Fim;
var
  Data: TDateTime;
  tDia, tMes, tAno, tHora, tMinuto, tSegundos, tMiliSegundos: WORD;

  Verificacao   : Integer;
  Identificacao : Integer;

begin

    //Campo obrigatório
    if cboTipoLeitor.ItemIndex = -1 Then
    begin
     MessageDlg('Favor selecionar um tipo de leitor !',mtError, [mbOk], 0);
     cboTipoLeitor.SetFocus;
     Screen.Cursor := crDefault;
     Exit;
    end;

    //Se catraca deve informar lado que está instalada
    If (cboEquipamento.ItemIndex <> Acionamento_Coletor) and (not optDireita.Checked) and (not optEsquerda.Checked) Then
    begin
     MessageDlg('Favor informar o lado de instalação da catraca !',mtError, [mbOk], 0);
     cboEquipamento.SetFocus;
     Screen.Cursor := crDefault;
     Exit;
    end;

    //Mensagem Status
    lblEnvia.Caption := 'Conectando com o inner...';
    Application.ProcessMessages();

    //Desabilita os botões durante execução
    btnEnviar.enabled := false;
    btnReceber.enabled := false;

    chkBio.Enabled := True;
    Screen.Cursor := crHourGlass;
    lblVersao.Lines.Clear;
    lblVersao.Font.Color := clBlack;
    lblVersao.Font.Style := [];  
    Linha := 0;

    //Define a versão do equipamento
    if not DefineVersao() then
        goto Fim;

    //Se selecionado Biometria, Valida se o equipamento é compatível
    If chkBio.Checked Then
    begin
     If ((Linha <> 6) and (Linha <>14)) Or ((Linha = 14) and (InnerAcessoBIO<>1)) Then
     begin
        MessageDlg('Equipamento não compatível com Biometria.', mtWarning, [mbOk], 0);
        lblVersao.Font.Color := clRed;
        lblVersao.Font.Style := [fsBold];
     End;
    End;

    //Mensagem Status
    lblEnvia.caption := 'Enviando configurações...';
    Sleep(100);
    application.processmessages;

    //Chama rotina que monta as configurações
    MontarConfiguracoes;

    //Configura o tipo de registro que será associado a uma marcação, quando for
    //inserido o dedo no Inner bio sem que o usuário tenha definido se é uma entrada,saída,função...
    if chkBio.Checked then
      //Entrada
      DefinirFuncaoDefaultSensorBiometria(10)
    else
      //Desativa
      DefinirFuncaoDefaultSensorBiometria(0);

    //Envia buffer com as configurações, buffer interno da dll que contém todas as
    //configurações das funções anteriores para o Inner, após o envio esse buffer
    //é limpo sendo necessário chamar novamente as funções acima para reconfigurá-lo.
    Ret := EnviarConfiguracoes(StrToInt(txtNumInner.Text));  //(nº do Inner)
    if Ret = RET_COMANDO_OK then
        lblEnvia.caption := 'Configurações enviadas com sucesso!'
    else
    begin
      Screen.Cursor := crDefault;
      lblEnvia.caption := 'Erro ao enviar as configurações!';
      goto Fim;
    end;
    application.processmessages;

    //Envia relógio
    //Configura o relógio(data/hora) do Inner.
    if chkRelogio.Checked then
     begin
      lblEnvia.caption := 'Enviando relógio...';
      application.processmessages;
      Sleep(100);
      Data := Now;
      DecodeDate(Data, tAno, tMes, tDia);
      DecodeTime(Data, tHora, tMinuto, tSegundos, tMiliSegundos);

      //Formato o ano, pega apenas os dois ultimos digitos
      tAno := StrToInt(Copy(IntToStr(tAno), 3, 2));

      //Envia relogio
      Ret := EnviarRelogio(StrToInt(txtNumInner.Text), Byte(tDia), Byte(tMes), Byte(tAno),
                                   Byte(tHora),Byte(tMinuto), Byte(tSegundos));

      if Ret = RET_COMANDO_OK then
        lblEnvia.caption := 'Relógio enviado com sucesso!'
      else
      begin
        lblEnvia.caption := 'Erro ao enviar relógio!';
        Screen.Cursor := crDefault;
        goto Fim;
      end;

    end;
    Application.ProcessMessages;

    //Envia o buffer com todas as mensagens off line configuradas anteriormente,
    //para o Inner.
    if chkMensagem.Checked then
     begin
      lblEnvia.caption := 'Enviando mensagem...';
      Sleep(100);
      Application.ProcessMessages;

      //Chama rotina de envio de mensagem
      MontarMensagem;

      //Envia Buffer com todas as mensagens offline
      Ret := EnviarMensagensOffLine(StrToInt(txtNumInner.Text));
      if Ret = RET_COMANDO_OK then
        lblEnvia.caption := 'Mensagem enviada com sucesso!'
      else
      begin
        lblEnvia.caption := 'Erro ao enviar mensagem!';
        Screen.Cursor := crDefault;
        goto Fim;
      end;
    end;
    Application.ProcessMessages;

    //Envia o buffer com os horário de sirene cadastrados para o Inner.
    if chkSirene.Checked then
    begin
      lblEnvia.caption := 'Enviando horários sirene...';
      application.processmessages;
      Sleep(100);

      //Chama rotina que monta os horarios
      Ret := EnviarHorariosSirene(StrToInt(txtNumInner.Text));
      if Ret = RET_COMANDO_OK then
        lblEnvia.caption := 'Horários da sirene enviados com sucesso!'
      else
      begin
        lblEnvia.caption := 'Erro ao enviar os horários da sirene!';
        Screen.Cursor := crDefault;
        goto Fim;
      end;
    end;
    Application.ProcessMessages;

    //Envia para o Inner o buffer com a lista de horários de acesso, após executar
    //o comando o buffer é limpo tomaticamente pela dll
    if chkHorarios.Checked then
     begin
      lblEnvia.caption := 'Enviando horários...';
      Application.ProcessMessages;
      Sleep(100);

      //chama a rotina que monta horarios
      MontarHorarios;

      //Envia buffer com lista de horarios de acesso
      Ret := EnviarHorariosAcesso(StrToInt(txtNumInner.Text));
      if Ret = RET_COMANDO_OK then
        lblEnvia.caption := 'Horários enviados com sucesso!'
      else
      begin
        lblEnvia.caption := 'Erro ao enviar os horários!';
        Screen.Cursor := crDefault;
        goto Fim;
      end;
    end;

    Application.ProcessMessages;

    //Envia lista
    if chkLista.Checked then
    begin
      lblEnvia.caption := 'Enviando lista...';
      Application.ProcessMessages;
      Sleep(100);

      //Verifica qual lista enviar
      if rdbPadraoTopdata.checked then
        //Chama rotina que monta lista do tipo TOPDATA
        MontarListaTopdata
      else if rdbPadraoLivre.checked then
        //Chama rotina que monta lista do tipo LIVRE
        MontarListaLivre;

      //Envia o Buffer com os usuarios da lista
      Ret := EnviarListaAcesso(StrToInt(txtNumInner.Text));
      if Ret = RET_COMANDO_OK then
        lblEnvia.caption := 'Lista enviada com sucesso!'
      else
      begin
        lblEnvia.caption := 'Erro ao enviar a lista!';
        Screen.Cursor := crDefault;
        goto Fim;
      end;
    end;

    //Equipamento Biometrico
    If ((Linha = 6) or ((Linha = 14))) And chkBio.Checked Then
    begin
        Identificacao := 0;
        Verificacao   := 0;

        if chkVerificacao.Checked then
           Verificacao := 1;

        if chkIdentificacao.Checked then
           Identificacao := 1;

        //Habilita/Desabilita a identificação biométrica e/ou a verificação
        //biométrica do Inner bio.
        ConfigurarBio(StrToInt(txtNumInner.Text),Identificacao, Verificacao);

        //Retorna o resultado da configuração do Inner Bio, função ConfigurarBio.
        //Se o retorno for igual a 0 é porque o Inner bio foi configurado com
        //sucesso.
        Ret := ResultadoConfiguracaoBio(StrToInt(txtNumInner.Text), 0);
    end;

    //Envia lista biométrica
    if chkListaBio.Checked then
    begin
      lblEnvia.caption := 'Enviando lista do InnerBio...';
      application.processmessages;
      Sleep(100);

      //Chama rotina que monta o buffer de cartões que não irão precisar da digital
      MontarListaInnerBio();

     if InnerNetAcesso then
     Begin
      Ret := EnviarListaUsuariosSemDigitalBioVariavel(StrToInt(txtNumInner.Text), StrToInt(txtDigitos.Text));
     End
     Else
     Begin
      Ret := EnviarListaUsuariosSemDigitalBio(StrToInt(txtNumInner.Text));
     End;
      //Envia o buffer com a lista de usuarios sem digital

      if Ret = RET_COMANDO_OK then
        lblEnvia.caption := 'Lista do InnerBio enviada com sucesso!'
      else
      begin
        lblEnvia.caption := 'Erro ao enviar a lista do InnerBio!';
        Screen.Cursor := crDefault;
        goto Fim;
      end;
    end;

Fim:

  //Após procedimentos, fecha porta de comunicação
  FecharPortaComunicacao();
  //Habilita novamente os botões
  btnEnviar.enabled := true;
  btnReceber.enabled := true;
  application.ProcessMessages;
  Screen.Cursor := crDefault;
end;

//***********************************************************************************
//RECEBER
//Esta rotina é responsável por efetuar a coleta dos bilhetes, verificando qual o padrao do cartão
//***********************************************************************************
procedure TFrmEasyInnerOffLine.btnReceberClick(Sender: TObject);
begin

  //Campo obrigatório
  if cboTipoLeitor.ItemIndex = -1 Then
  begin
     MessageDlg('Favor selecionar um tipo de leitor !',mtError, [mbOk], 0);
     cboTipoLeitor.SetFocus;
     Screen.Cursor := crDefault;
     Exit;
  end;

  //Desabilita os botões durante a coleta
  btnEnviar.Enabled := False;
  btnReceber.Enabled := False;
  Screen.Cursor := crHourGlass;

  //Define qual será o tipo de conexão(meio de comunicação) que será utilizada
  //pela dll para comunicar com os Inners.
  DefinirTipoConexao(cboTipoConexao.ItemIndex);
  //Tenta conectar
  if Conectar() then
  begin
        ReceberVersaoFirmware(strtoint(txtNumInner.Text),@Linha,@Variacao,@VersaoAlta,@VersaoBaixa,@VersaoSufixo,@InnerAcessoBIO);
        InnerNetAcesso := Linha = 14;
        //Definir padrão cartão
        if rdbPadraoTopdata.Checked Then
          DefinirPadraoCartao(TpCartao_TOPDATA)
        Else
         begin
          If rdbPadraoLivre.Checked Then
          DefinirPadraoCartao(TpCartao_PADRAO_LIVRE);
         end;

        //Mensagem Status
        lblBilhetes.Caption := 'Coletando bilhetes...';

        ConfigurarTipoLeitor(cboTipoLeitor.ItemIndex);
        DefinirQuantidadeDigitosCartao(StrToInt(txtDigitos.Text));

        //Chama rotina que realiza a coleta dos bilhetes offline
        if(InnerNetAcesso) then
           ReceberBilhetesInnerAcesso
        else
           ReceberBilhetes;
  end
  else
  begin
    lblBilhetes.Caption := 'Erro ao conectar no inner!';
  end;

  //Após realizar a coleta, habilita novamente os botões
  btnEnviar.Enabled := True;
  btnReceber.Enabled := True;
  Screen.Cursor := crDefault;
end;

//***********************************************************************************
//Abertura Formulário
//Carregamento das combos
//***********************************************************************************
procedure TFrmEasyInnerOffLine.FormCreate(Sender: TObject);
begin

  //Combo Tipo Conexão
  cboTIpoConexao.Items.Add('Serial');
  cboTIpoConexao.Items.Add('TCP/IP porta variável');
  cboTIpoConexao.Items.Add('TCP/IP porta fixa');
  cboTIpoConexao.ItemIndex := 2;

  //Combo Tipo Leitor
  cboTipoLeitor.Items.Clear;
  cboTipoLeitor.Items.Add('Código Barras');
  cboTipoLeitor.Items.Add('Magnético');
  cboTipoLeitor.Items.Add('Prox. Abatrack/Smart Card');
  cboTipoLeitor.Items.Add('Prox. Wiegand/Smart Card');
  cboTipoLeitor.Items.Add('Prox. Smart Card Serial');
  cboTipoLeitor.Items.Add('Codigo de barras serial');
  cboTipoLeitor.Items.Add('Wiegand FC sem zero');
  cboTipoLeitor.ItemIndex := 0;

  //Combo Equipamento
  cboEquipamento.Items.Clear;
  cboEquipamento.Items.Add('Não utilizado(Coletor)');
  cboEquipamento.Items.Add('Catraca Entrada/Saída');
  cboEquipamento.Items.Add('Catraca Entrada');
  cboEquipamento.Items.Add('Catraca Saída');
  cboEquipamento.Items.Add('Catraca Saída Liberada');
  cboEquipamento.Items.Add('Catraca Entrada Liberada');
  cboEquipamento.Items.Add('Catraca Liberada 2 Sentidos');
  cboEquipamento.Items.Add('Catraca Liberada 2 Sentidos(Sentido Giro)');
  cboEquipamento.Items.add('Catraca com Urna');
  cboEquipamento.ItemIndex := 0;

end;

//***********************************************************************************
//Selecionar combo Tipo Conexão
//Carrega o campo Porta de acordo com o item selecionado
//***********************************************************************************
procedure TFrmEasyInnerOffLine.cboTipoConexaoClick(Sender: TObject);
begin
  txtPorta.Enabled := true;

  if cboTipoConexao.ItemIndex = 0 then
  begin
    txtPorta.Text := '1';
  end
  else if cboTipoConexao.ItemIndex = 4 then
  begin
    txtPorta.Text := '3';
  end
  else
  begin
    if cboTipoConexao.ItemIndex = 1 then
    begin
        txtPorta.Enabled := false;
    end;

    txtPorta.Text := '3570';
  end;

end;


//***********************************************************************************
//Habilita/Desabilita campos Bio
//***********************************************************************************
procedure TFrmEasyInnerOffLine.chkBioClick(Sender: TObject);
begin
  if chkBio.checked then
  begin
    chkVerificacao.enabled   := true;
    chkIdentificacao.enabled := true;
    chkListaBio.Enabled      := true;
  end
  else
  begin
    chkVerificacao.enabled   := false;
    chkIdentificacao.enabled := false;
    chkListaBio.Enabled      := false;
  end;

  chkVerificacao.Checked   := false;
  chkIdentificacao.Checked := false;
  chkListaBio.Checked      := false;
end;

//***********************************************************************************
//Habilita/Desabilita campos
//***********************************************************************************
procedure TFrmEasyInnerOffLine.chkListaBioClick(Sender: TObject);
begin
    if (chkListaBio.Checked) then
        chkVerificacao.Checked := True;
end;

//***********************************************************************************
//Habilita/Desabilita campos
//***********************************************************************************
procedure TFrmEasyInnerOffLine.chkVerificacaoClick(Sender: TObject);
begin
    if not (chkVerificacao.Checked) then
       chkListaBio.Checked := False;

end;

//***********************************************************************************
//DEFINEVERSAO
//Esta rotina é responsável por identificar a versão do inner
//***********************************************************************************
function TFrmEasyInnerOffLine.DefineVersao(): Boolean;
var
    VersaoInner     : String;
    Ret2            : Integer;
    Modelo          : Integer;
    ModeloBioInner  : String;
    VersaoAltaBio   : Integer;
    VersaoBaixaBio  : Integer;
    VersaoBio       : String;
    StrVersao       : String;
    LinhaInner      : String;


 //    Linha              : Integer;
  //Variacao           : Integer;
  //VersaoAlta         : Integer;
  //VersaoBaixa        : Integer;
  //VersaoSufixo       : Integer;
  //InnerNetAcesso     : Boolean;
  //InnerAcessoBIO     : Byte;

begin

  //Envia Comando e Atualiza Lista de mensagens..
  Screen.Cursor := crHourGlass;
  Application.ProcessMessages;
  DefineVersao := true;
  InnerNetAcesso:= False;

  //Chama rotina que realiza a conexão
  if Conectar() then
  begin
      Application.ProcessMessages;
      Ret2 := 255;
    //  while (Ret2 <> 0) do
     // begin
          //Solicita a versão do firmware do Inner e dados como o Idioma, se é uma versão especial.
          Ret2 := ReceberVersaoFirmware(StrToInt(txtNumInner.Text), @Linha, @Variacao, @VersaoAlta, @VersaoBaixa, @VersaoSufixo, @InnerAcessoBIO);
      //    Sleep(100);
     // end;

      IF (Ret2 = RET_COMANDO_OK) THEN
      BEGIN
          //Define a linha do Inner
          CASE Linha OF
            1: LinhaInner := 'Inner Plus';
            2: LinhaInner := 'Inner Disk';
            3: LinhaInner := 'Inner Verid';
            6: LinhaInner := 'Inner Bio';
            7: LinhaInner := 'Inner NET';
            14:
             begin
               LinhaInner := 'Inner Acesso';
               InnerNetAcesso := True;
             end;
          END;

          VersaoInner := IntToStr(VersaoAlta) + '.' + IntToStr(VersaoBaixa) + '.' + IntToStr(VersaoSufixo);
          StrVersao := LinhaInner;

          if Variacao > 0 then
            StrVersao := StrVersao + ' - Variação: ' + IntToStr(Variacao);

          StrVersao := StrVersao + ' - Versão: ' +  VersaoInner;

          //Se for biometria
          If (Linha = 6) or (InnerAcessoBIO = 1) Then
          begin

              //Solicita o modelo do Inner bio.
              SolicitarModeloBio(StrToInt(txtNumInner.Text));

              Ret2 := 128;

              WHILE (Ret2 = 128) DO
              BEGIN

                  //Retorna o resultado do comando SolicitarModeloBio, o modelo
                  //do Inner Bio é retornado por referência no parâmetro da função.
                  Ret2 := ReceberModeloBio(StrToInt(txtNumInner.Text), 0, @Modelo);
                  Sleep(100);
              END;

              //Define o modelo do Inner Bio
              CASE Modelo OF
                  1: ModeloBioInner   := 'Modelo: Light 100 usuários FIM10';
                  4: ModeloBioInner   := 'Modelo: 1000/4000 usuários FIM01';
                  51: ModeloBioInner  := 'Modelo: 1000/4000 usuários FIM2030';
                  52: ModeloBioInner  := 'Modelo: 1000/4000 usuários FIM2040';
                  48: ModeloBioInner  := 'Modelo: Light 100 usuários FIM3030';
                  64: ModeloBioInner  := 'Modelo: Light 100 usuários FIM3040';
                  80: ModeloBioInner  := 'Modelo: 1000/4000 usuários FIM5060';
                  82: ModeloBioInner  := 'Modelo: 1000/4000 usuários FIM5260';
                  83: ModeloBioInner  := 'Modelo: Light 100 usuários FIM5360';
                  255: ModeloBioInner := 'Modelo: Desconhecido';
              END;

              //Solicita a versão do Inner bio.
              SolicitarVersaoBio(StrToInt(txtNumInner.Text));

              Ret2 := 128;

              WHILE (Ret2 = 128) DO
              BEGIN
                  //Retorna o resultado do comando SolicitarVersaoBio, a versão
                  //do Inner Bio é retornado por referência nos parâmetros da
                  //função.
                  Ret2 := ReceberVersaoBio(StrToInt(txtNumInner.Text), 0, @VersaoAltaBio, @VersaoBaixaBio);
                  Sleep(100);
              END;

              VersaoBio := IntToStr(VersaoAltaBio) + '.' + IntToStr(VersaoBaixaBio);
              StrVersao := StrVersao + ' - ' + ModeloBioInner + ' -> ' + VersaoBio;
          end;

          lblVersao.Lines.Clear;
          lblVersao.Lines.Add(StrVersao);
          Application.ProcessMessages;
          Screen.Cursor := crDefault;
      end;
  end
  else
  begin
     //Mensagem Status
     lblEnvia.Caption := 'Erro ao conectar no inner!';
     Screen.Cursor := crDefault;
     //FecharPortaComunicacao();
     Application.ProcessMessages;
     DefineVersao := false;
  end;

end;

//***********************************************************************************
//Habilita a opção 2 Leitores somente se o leitor for de proximidade
//***********************************************************************************
procedure TFrmEasyInnerOffLine.cboTipoLeitorChange(Sender: TObject);
begin
  chkDoisLeitores.Enabled := not(cboTipoLeitor.ItemIndex IN [TpLeitor_CODIGO_DE_BARRAS, TpLeitor_MAGNETICO]);
  chkDoisLeitores.Checked := False;
  if(cboTipoLeitor.ItemIndex = 2) then
  begin
      txtDigitos.Text := '14';
  end
  else if(cboTipoLeitor.ItemIndex = 3) then
  begin
      txtDigitos.Text := '6';
  end;

end;

//***********************************************************************************
//Fecha Formulário
//***********************************************************************************
procedure TFrmEasyInnerOffLine.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
    Action := caFree;
end;

//***********************************************************************************
//Seleção combo Equipamento
//Carrega os campos de acordo com o item selecionado
//***********************************************************************************
procedure TFrmEasyInnerOffLine.cboEquipamentoChange(Sender: TObject);
begin

 //Se catraca
 If (cboEquipamento.ItemIndex <> Acionamento_Coletor) Then
 begin
     optEsquerda.Enabled := True;
     optDireita.Enabled := True;
     chkDoisLeitores.Enabled := True;

    //Se Urna
    If ((cboEquipamento.ItemIndex = Acionamento_Catraca_Urna)) Then
    begin
      optDireita.Checked := True;
      optEsquerda.Checked := False;
      optDireita.Enabled := False;
      imgCatraca.Picture.LoadFromFile('Imagens\Direita-normall.JPG');
      lblCatraca.Enabled := True;
      cboTipoLeitor.ItemIndex := 4; //proximidade
      chkDoisLeitores.Checked := True;
    end
    else  //Não é Urna
     begin
        If (optDireita.Checked = True) Then
            imgCatraca.Picture.LoadFromFile('Imagens\Direita-normall.JPG')
        Else
         begin
          If (optEsquerda.Checked = True) Then
            imgCatraca.Picture.LoadFromFile('Imagens\Esquerda-invertidaa.JPG');
         end;
      lblCatraca.Enabled := True;
     End;

  end
  Else
  begin
    //Coletor
    optEsquerda.Enabled := False;
    optDireita.Enabled := False;
    lblCatraca.Enabled := False;
    imgCatraca.Picture.LoadFromFile('Imagens\nenhum.jpg');
  End;

end;

procedure TFrmEasyInnerOffLine.optEsquerdaClick(Sender: TObject);
begin
  //Carrega imagem catraca a esquerda
  imgCatraca.Picture.LoadFromFile('Imagens\Esquerda-invertidaa.JPG');
end;

procedure TFrmEasyInnerOffLine.optDireitaClick(Sender: TObject);
begin

  //Carrega imagem catraca a direita
  imgCatraca.Picture.LoadFromFile('Imagens\Direita-normall.JPG');

end;

procedure TFrmEasyInnerOffLine.chkCartaoMasterClick(Sender: TObject);
begin
if(chkCartaoMaster.Checked) then
begin
    txtCatraoMaster.Enabled := True;
end
else
begin
    txtCatraoMaster.Enabled := False;
end;
end;

procedure TFrmEasyInnerOffLine.rdbPadraoTopdataClick(Sender: TObject);
begin
MessageDlg('Este tipo é utilizado somente para cartões fabricado pela Topdata !', mtWarning, [mbOk], 0);
end;

end.
