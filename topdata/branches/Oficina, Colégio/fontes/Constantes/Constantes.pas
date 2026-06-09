//******************************************************************************
//A Topdata Sistemas de Automação Ltda não se responsabiliza por qualquer
//tipo de dano que este software possa causar, este exemplo deve ser utilizado
//apenas para demonstrar a comunicação com os equipamentos da linha
//inner e não deve ser alterado, por este motivo ele não deve ser incluso em
//suas aplicações comerciais.
//
//Desenvolvido em Delphi 6.
//                                           Topdata Sistemas de Automação Ltda.
//******************************************************************************

unit Constantes;

interface

  //******************************************************************************
  //Declaração das Constantes
  //******************************************************************************

  const EmptyDigital : array [1..10] of byte = (0,0,0,0,0,0,0,0,0,0);

  //Constantes de Retorno
  Const RET_COMANDO_OK = 0;
  Const RET_COMANDO_ERRO = 1;
  Const RET_PORTA_NAOABERTA = 2;
  Const RET_PORTA_JAABERTA = 3;
  Const RET_DLL_INNER2K_NAO_ENCONTRADA = 4;
  Const RET_DLL_INNERTCP_NAO_ENCONTRADA = 5;
  Const RET_DLL_INNERTCP2_NAO_ENCONTRADA = 6;
  Const RET_ERRO_GPF = 8;
  Const RET_TIPO_CONEXAO_INVALIDA = 9;
  Const DIV_SEGUNDOS = 1000;

  //Constantes de Opção
  Const Opcao_SIM = 1;
  Const Opcao_NAO = 0;


  //Constantes de Modo
  Const MODO_OFF_LINE = 0;
  Const MODO_ON_LINE = 1;

  //Constantes de Tipo de Cartão..
  Const TpCartao_TOPDATA = 0;
  Const TpCartao_PADRAO_LIVRE = 1;

  //Constantes de Tipo de Leitor..
  Const TpLeitor_CODIGO_DE_BARRAS = 0;
  Const TpLeitor_MAGNETICO = 1;
  Const TpLeitor_PROXIMIDADE_ABATRACK2 = 2;
  Const TpLeitor_WIEGAND = 3;
  Const TpLeitor_PROXIMIDADE_SMART_CARD_SERIAL = 4;
  Const TpLeitor_CODIGO_BARRAS_SERIAL = 5;
  Const TpLeitor_WIEGAND_FC_SEM_ZERO = 6;

  //Constantes do método DefinirEntradasMudancaOffline
  Const EntradasOff_NAO_ACEITA_DADOS_TECLADO = 0;
  Const EntradasOff_ACEITA_DADOS_TECLADO = 1;

  Const EntradasOff_LEITOR1_DESABILITADO = 0;
  Const EntradasOff_LEITOR1_SOMENTE_ENTRADA = 1;
  Const EntradasOff_LEITOR1_SOMENTE_SAIDA = 2;
  Const EntradasOff_LEITOR1_ENTRADA_SAIDA = 3;
  Const EntradasOff_LEITOR1_SAIDA_ENTRADA = 4;

  Const EntradasOff_LEITOR2_DESABILITADO = 0;
  Const EntradasOff_LEITOR2_SOMENTE_ENTRADA = 1;
  Const EntradasOff_LEITOR2_SOMENTE_SAIDA = 2;
  Const EntradasOff_LEITOR2_ENTRADA_SAIDA = 3;
  Const EntradasOff_LEITOR2_SAIDA_ENTRADA = 4;
  Const EntradasOff_RESERVADO_USO_FUTURO = 0;

  //Constantes do Método DefinirEntradasMudancaOnline
  Const EntradasMudON_NAO_ACEITA_ENTRADA_DADOS = 0;
  Const EntradasMudON_ACEITA_TECLADO = 1;
  Const EntradasMudON_ACEITA_LEITURA_LEITOR1 = 2;
  Const EntradasMudON_ACEITA_LEITURA_LEITOR2 = 3;
  Const EntradasMudON_TECLADO_E_LEITOR1 = 4;
  Const EntradasMudON_TECLADO_E_LEITOR2 = 5;
  Const EntradasMudON_LEITOR1_E_LEITOR2 = 6;
  Const EntradasMudON_TECLADO_E_LEITOR1_E_LEITOR2 = 7;
  Const EntradasMudON_TECLADO_E_VERIF_BIOMETRICA = 10;
  Const EntradasMudON_LEITOR1_E_VERIF_BIOMETRICA = 11;
  Const EntradasMudON_TECLADO_E_LEITOR1_E_VERIF_BIOMETRICA = 12;
  Const EntradasMudON_LEITOR1_COM_VERI_BIO_E_LEITOR2_SEM_VERI_BIO = 13;
  Const EntradasMudON_LEITOR1_COM_VERI_BIO_E_LEITOR2_SEM_VERI_BIO_E_TECLADO_SEM_VERI_BIO = 14;
  Const EntradasMudON_LEITOR1_E_IDENTIFICACAO_BIO = 100;
  Const EntradasMudON_LEITOR1_E_TECLADO_E_IDENTIFICACAO_BIO = 101;
  Const EntradasMudON_LEITOR1_E_LEITOR2_E_IDENTIFICACAO_BIO = 102;
  Const EntradasMudON_LEITOR1_E_LEITOR2_E_TECLADO_E_IDENTIFICACAO_BIO = 103;
  Const EntradasMudON_LEITOR1_INVERTIDO_E_IDENTIFICACAO_BIO = 104;
  Const EntradasMudON_LEITOR1_INVERTIDO_E_TECLADO_E_IDENTIFICACAO_BIO = 105;

  //Constantes de Origem do Método Receber Dados Online
  Const Origem_VIA_TECLADO = 1;
  Const Origem_VIA_LEITOR1 = 2;
  Const Origem_VIA_LEITOR2 = 3;
  Const Origem_SENSOR_DA_CATRACA  = 4; //OBSOLETO, Não Recomandável utilizar..
  Const Origem_FIM_DE_TEMPO_DE_ACIONAMENTO = 5;
  Const Origem_GIRO_DA_CATRACA_TOPDATA = 6;
  Const Origem_URNA = 7;
  Const Origem_EVENTO_SENSOR1 = 8;
  Const Origem_EVENTO_SENSOR2 = 9;
  Const Origem_EVENTO_SENSOR3 = 10;
  Const Origem_SENSOR_BIOMETRICO = 12;
  Const Origem_URNA_CHEIA = 20;

  //Constantes do Complemento do Método Receber Dados Online
  Const Complemento_SAIDA = 0;
  Const Complemento_ENTRADA = 1;
  Const Complemento_CONFIRMA_VIA_TECLADO = 35;
  Const Complemento_ANULA_VIA_TECLADO = 42;
  Const Complemento_SENSOR_PRESENCA_DEDO = 37;
  Const Complemento_TECLA_FUNCAO =65;
  Const Complemento_TECLA_ENTRADA = 66;
  Const Complemento_TECLA_SAIDA = 67;
  Const Complemento_INSERIU_TODOS_OS_DIG_DISPONIVEIS_NO_TECLADO = 255;

  //Constantes de Tipo de acionamento
  Const Acionamento_Coletor = 0;
  Const Acionamento_Catraca_Entrada_E_Saida = 1;
  Const Acionamento_Catraca_Entrada = 2;
  Const Acionamento_Catraca_Saida = 3;
  Const Acionamento_Catraca_Saida_Liberada = 4;
  Const Acionamento_Catraca_Entrada_Liberada = 5;
  Const Acionamento_Catraca_Liberada_2_Sentidos = 6;
  Const Acionamento_Catraca_Sentido_Giro = 7;
  Const Acionamento_Catraca_Urna = 8;    

  //Constantes de Função de Acionamento..
  Const FncAcionamento_NAO_UTILIZADO = 0;
  Const FncAcionamento_ACIONA_REGISTRO_ENTRADA_OU_SAIDA = 1;
  Const FncAcionamento_ACIONA_REGISTRO_ENTRADA = 2;
  Const FncAcionamento_ACIONA_REGISTRO_SAIDA = 3;
  Const FncAcionamento_CONECTADO_SIRENE = 4;
  Const FncAcionamento_REVISTA_USUARIOS = 5;
  Const FncAcionamento_CATRACA_SAIDA_LIBERADA = 6;
  Const FncAcionamento_CATRACA_ENTRADA_LIBERADA = 7;
  Const FncAcionamento_CATRACA_LIBERADA_DOIS_SENTIDOS = 8;
  Const FncAcionamento_CATRACA_LIBERADA_DOIS_SENTIDOS_MARCACAO_REGISTRO = 9;

  //Constantes de Eco de digitos no teclado
  Const ECOAR_DIGITADO = 0;
  Const ECOAR_ASTERISCO = 1;

  //Constantes de Configuração de Leitor
  Const ConfigLeitor_DESATIVADO = 0;
  Const ConfigLeitor_ENTRADA = 1;
  Const ConfigLeitor_SAIDA = 2;
  Const ConfigLeitor_ENTRADA_SAIDA =  3;
  Const ConfigLeitor_ENTRADA_SAIDA_INVERTIDA = 4;

  //Constantes de função Default de sensor de Biometria..
  Const DefSenBIO_DESABILITADO = 0;
  Const DefSenBIO_F1 = 1;
  Const DefSenBIO_F2 = 2;
  Const DefSenBIO_F3 = 3;
  Const DefSenBIO_F4 = 4;
  Const DefSenBIO_F5 = 5;
  Const DefSenBIO_F6 = 6;
  Const DefSenBIO_F7 = 7;
  Const DefSenBIO_F8 = 8;
  Const DefSenBIO_F9 = 9;
  Const DefSenBIO_ENTRADA = 10;
  Const DefSenBIO_SAIDA = 11;
  Const DefSenBIO_DOIS_SENTIDOS = 12;

  //Constantes do método de habilitação de mudança Online/Offline.
  Const HabMudOnOFF_DESABILITA_MUDANCA = 0;
  Const HabMudOnOFF_HABILITA = 1;
  Const HabMudOnOFF_HABILITA_COM_PINGONLINE = 2;

  //Constantes do método DefinirEntradasMudancaOfflineComBiometria
  Const EntradasOffBIO_NAO_ACEITA_DADOS_TECLADO = 0;
  Const EntradasOffBIO_ACEITA_DADOS_TECLADO = 1;
  Const EntradasOffBIO_LEITOR1_DESATIVADO = 0;
  Const EntradasOffBIO_LEITOR1_ENTRADA_SAIDA = 3;
  Const EntradasOffBIO_LEITOR1_SAIDA_ENTRADA = 4;
  Const EntradasOffBIO_LEITOR2_DESATIVADO = 0;
  Const EntradasOffBIO_LEITOR2_ENTRADA_SAIDA = 3;
  Const EntradasOffBIO_VERIFICACAO_DESATIVADA = 0;
  Const EntradasOffBIO_VERIFICACAO_ATIVADA = 1;
  Const EntradasOffBIO_IDENTIFICACAO_DESATIVADA = 0;
  Const EntradasOffBIO_IDENTIFICACAO_ATIVADA = 1;

  //Constantes dos métodos DefinirMensagemPadraoMudancaOffLine e DefinirMensagemPadraoMudancaOnLine
  Const DefinirMensagemMudanca_NAO_EXIBIR_DATA = 0;
  Const DefinirMensagemMudanca_EXIBIR_DATA = 1;

  //Constantes dos métodos DefinirMensagemPadraoMudancaOffLine e DefinirMensagemPadraoMudancaOnLine
  Const Const_NAO_EXIBIR_DATA = 0;
  Const Const_EXIBIR_DATA = 1;

  //Constantes do Método EnviarFormasEntradasOnLine
  Const EntradasON_NAO_ACEITA_ENTRADA_DADOS = 0;
  Const EntradasON_ACEITA_TECLADO = 1;
  Const EntradasON_ACEITA_LEITURA_LEITOR1 = 2;
  Const EntradasON_ACEITA_LEITURA_LEITOR2 = 3;
  Const EntradasON_TECLADO_E_LEITOR1 = 4;
  Const EntradasON_TECLADO_E_LEITOR2 = 5;
  Const EntradasON_LEITOR1_E_LEITOR2 = 6;
  Const EntradasON_TECLADO_E_LEITOR1_E_LEITOR2 = 7;
  Const EntradasON_TECLADO_E_VERIF_BIOMETRICA = 10;
  Const EntradasON_LEITOR1_E_VERIF_BIOMETRICA = 11;
  Const EntradasON_TECLADO_E_LEITOR1_E_VERIF_BIOMETRICA = 12;
  Const EntradasON_LEITOR1_COM_VERI_BIO_E_LEITOR2_SEM_VERI_BIO = 13;
  Const EntradasON_LEITOR1_COM_VERI_BIO_E_LEITOR2_SEM_VERI_BIO_E_TECLADO_SEM_VERI_BIO = 14;
  Const EntradasON_LEITOR1_E_IDENTIFICACAO_BIO = 100;
  Const EntradasON_LEITOR1_E_TECLADO_E_IDENTIFICACAO_BIO = 101;
  Const EntradasON_LEITOR1_E_LEITOR2_E_IDENTIFICACAO_BIO = 102;
  Const EntradasON_LEITOR1_E_LEITOR2_E_TECLADO_E_IDENTIFICACAO_BIO = 103;
  Const EntradasON_LEITOR1_INVERTIDO_E_IDENTIFICACAO_BIO = 104;
  Const EntradasON_LEITOR1_INVERTIDO_E_TECLADO_E_IDENTIFICACAO_BIO = 105;

  //Constantes do Método DefinirConfiguracaoTecladoOnLine
  Const TecladoOn_NAO_ECOAR_NO_DISLPAY = 0;
  Const TecladoOn_ECOAR_NO_DISLPAY = 1;
  Const TecladoOn_ECOAR_ASTERISCO = 2;

  //***********************************************************************************
  //Bio
  //***********************************************************************************
  const NBioAPIERROR_NONE = 0;
  Const NBioAPIERROR_USR_ALRD = 1287;

  Const RET_BIO_PROCESSANDO             = 128;
  Const RET_BIO_FALHA_COMUNICACAO       = 129;
  Const RET_BIO_USR_JA_CADASTRADO       = 131;
  Const RET_BIO_BASE_CHEIA              = 133;
  Const RET_BIO_USR_NAO_CADASTRADO      = 132;
  Const RET_BIO_DIG_NAO_CONFERE         = 134;
  Const RET_BIO_INVALIDA                = 135;
  Const RET_BIO_TEMPLATE_INVALIDO       = 136;
  Const RET_BIO_PARAMETROS_INVALIDOS    = 137;

  //Constante de Dispositivo
  Const NBioBSP_DEVICE_ID_NONE          = 0;
  Const NBioBSP_DEVICE_ID_FDP02_0       = 1;
  Const NBioBSP_DEVICE_ID_FDU01_0       = 2;
  Const NBioBSP_DEVICE_ID_OSU02_0       = 3;
  Const NBioBSP_DEVICE_ID_FDU11_0       = 4;
  Const NBioBSP_DEVICE_ID_FSC01_0       = 5;
  Const NBioBSP_DEVICE_ID_FDU03_0       = 6;
  Const NBioBSP_DEVICE_ID_AUTO_DETECT   = 255;
  Const NBioBSPERROR_NONE               = 0;

  //Window Style
Const NBioAPI_WINDOW_STYLE_POPUP = 0;
Const NBioAPI_WINDOW_STYLE_INVISIBLE = 1 ; //   'only for NBioAPI_Capture()
Const NBioAPI_WINDOW_STYLE_CONTINUOUS = 2 ;

//'Constantes Bio Fir Purpose
Const NBioAPI_FIR_PURPOSE_VERIFY = 1;
Const NBioAPI_FIR_PURPOSE_IDENTIFY = 2;
Const NBioAPI_FIR_PURPOSE_ENROLL = 3;
Const NBioAPI_FIR_PURPOSE_ENROLL_FOR_VERIFICATION_ONLY = 4;
Const NBioAPI_FIR_PURPOSE_ENROLL_FOR_IDENTIFICATION_ONLY = 5;
Const NBioAPI_FIR_PURPOSE_AUDIT = 6;
Const NBioAPI_FIR_PURPOSE_UPDATE = 10;

  //Exportação
  Const  MINCONV_TYPE_FDP                = 0;
  Const  MINCONV_TYPE_FDU                = 1;
  Const  MINCONV_TYPE_FDA                = 2;
  Const  MINCONV_TYPE_OLD_FDA            = 3;
  Const  MINCONV_TYPE_FDAC               = 4;
  Const  MINCONV_TYPE_FIM10_HV           = 5;
  Const  MINCONV_TYPE_FIM10_LV           = 6;
  Const  MINCONV_TYPE_FIM01_HV           = 7;
  Const  MINCONV_TYPE_FIM01_HD           = 8;
  Const  MINCONV_TYPE_FELICA             = 9;

  //Retorno BIO
  Const  FALHA_NA_COMUNICACAO                               = 1;
  Const  PROCESSANDO_ULTIMO_COMANDO                         = 128;
  Const  FALHA_NA_COMUNICACAO_COM_PLACA_BIO                 = 129;
  Const  INNER_BIO_NAO_ESTA_EM_MODO_MASTER                  = 130;
  Const  USUARIO_JA_CADASTRADO_NO_BANCO_DE_DADOS_INNER_BIO  = 131;
  Const  USUARIO_NAO_CADASTRADO_NO_BANCO_DE_DADOS_INNER_BIO = 132;
  Const  BASE_DE_DADOS_DE_USUARIOS_ESTA_CHEIA               = 133;
  Const  ERRO_NO_SEGUNDO_DEDO_DO_USUARIO                    = 134;
  Const  SOLICITACAO_PARA_INNER_BIO_INVALIDA                = 135;

  Const ARQ_USU = 'Usuarios.txt';


  // Cosntantes dias
  Const Domingo = 1;
  Const Segunda = 2;
  Const Terca = 3;
  Const Quarta = 4;
  Const Quinta = 5;
  Const Sexta = 6;
  Const Sabado = 7;

  //Constantes Faixas
  Const InicioFaixa1 = 1;
  Const FimFaixa1 = 2;
  Const InicioFaixa2 = 3;
  Const FimFaixa2 = 4;


  //******************************************************************************
  //Declaração dos Enumeradores
  //******************************************************************************

  //Enumeradores Estados Teclado
  Type enumEstadosTeclado = (
       TECLADO_EM_BRANCO,
       AGUARDANDO_TECLADO
  );

  //Enumeradores Estados Inner
  Type enumEstadosInner = (
       ESTADO_CONECTAR,
       ESTADO_ENVIAR_CFG_OFFLINE,
       ESTADO_COLETAR_BILHETES,
       ESTADO_ENVIAR_CFG_ONLINE,
       ESTADO_ENVIAR_DATA_HORA,
       ESTADO_ENVIAR_MSG_PADRAO,
       ESTADO_CONFIGURAR_ENTRADAS_ONLINE,
       ESTADO_POLLING,
       ESTADO_LIBERAR_CATRACA,
       ESTADO_ENVIAR_BIPCURTO,
       ESTADO_MONITORA_GIRO_CATRACA,
       PING_ONLINE,
       ESTADO_RECONECTAR,
       AGUARDA_TEMPO_MENSAGEM,
       ESTADO_DEFINICAO_TECLADO,
       ESTADO_AGUARDAR_DEFINICAO_TECLADO,    
       ESTADO_ENVIA_MSG_URNA,
       ESTADO_MONITORA_URNA,
       ESTADO_ENVIAR_MENSAGEM,
       ESTADO_ENVIAR_HORARIOS,
       ESTADO_ENVIAR_CONFIGMUD_ONLINE_OFFLINE,
       ESTADO_ENVIAR_MSG_ACESSO_NEGADO
  );

  //******************************************************************************
  //Declaração Tipo de Bilhete
  //******************************************************************************

  Type typeBilhete = Record
    Tipo: Byte;
    Dia: Byte;
    Mes: Byte;
    Ano: Byte;
    Hora: Byte;
    Minuto: Byte;
    Cartao: array[0..15] of char;
  End;

  Type typeUsuario = Record
     Cartao     : string;
     IdBio      : string;
     Horario    : byte;
     SemDigital : boolean;
  end;

  Type typeHorario = Record
        Horario           :byte;
        DiaDaSemana       :byte;
        Faixa             :byte;
        Hora              :byte;
        Minuto            :byte;
  end;

  //Cartão;IdBio;Template1;Template2;DataHoraCadastro
  Type typeTemplate = Record
        Cartao            :string;
        IdBio             :string;
        Template1         :string;
        Template2         :string;
        DataHoraCadastro  :string;
  end;

  Type typeSirene = Record
        //Hora;Minuto;Segunda;Terca;Quarta;Quinta;Sexta;Sabado,DomingoFeriado
        Hora    :byte;
        Minuto  :byte;
        Segunda :byte;
        Terca   :byte;
        Quarta  :byte;
        Quinta  :byte;
        Sexta   :byte;
        Sabado  :byte;
        DomingoFeriado:byte;
  end;

  Type typeInner = Record
        PadraoCartao                : Integer;
        CountTentativasEnvioComando : Integer;
        TempoInicialPingOnLine      : TDateTime;
        EstadoAtual                 : enumEstadosInner;
        EstadoTeclado               : enumEstadosTeclado;
        CountRepeatPingOnline       : Integer;
        Verificacao                 : Integer;
        Identificacao               : Integer;
        DoisLeitores                : Boolean;
        CountPingFail               : Integer;
        Numero                      : Integer;
        TempoColeta                 : Integer;
        Catraca                     : Boolean;
        Biometrico                  : Boolean;
        QtdDigitos                  : Integer;
        CntDoEvents                 : Integer;
        TipoLeitor                  : Integer;
        ValorLeitor1                : Integer;
        ValorLeitor2                : Integer;
        Teclado                     : Boolean;
        Temporizador                : TDateTime;
        EstadoSolicitacaoPingOnLine : enumEstadosInner;
        TempoInicialMensagem        : TDateTime;
        ListaBio                    : Boolean;
        Lista                       : Boolean;
        InnerNetAcesso              : Boolean;
        QtdeBilhetes                : Integer;
        TempoInicialConectar        : TDateTime;
  End;
  type
  vetUsu= array of typeUsuario;
  vetSir= array of typeSirene;
  vetHor= array of typeHorario;
  vetTpl= array of typeTemplate;
implementation

end.
