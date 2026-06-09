// ******************************************************************************
// A Topdata Sistemas de Automação Ltda não se responsabiliza por qualquer
// tipo de dano que este software possa causar, este exemplo deve ser utilizado
// apenas para demonstrar a comunicação com os equipamentos da linha Inner.
//
// Exemplo On-Line
// Desenvolvido em Delphi 6.
// Topdata Sistemas de Automação Ltda.
// ******************************************************************************

UNIT UnitEasyInnerOnLine;

INTERFACE

USES
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, ExtCtrls, Constantes, EasyInnerDLL, Inner, Bilhete, jpeg, UDM,
  Contnrs, ZDbcIntfs,IniFiles, Grids, ComCtrls;

TYPE
   TTipoPassagem = (taNone, taEntrada, taEntradaInvertida, taSaida,
      taSaidaInvertida);

   TCartao = class
   private
      FInner: Integer;
      FCartao: AnsiString;
      FTipoPassagem: TTipoPassagem;
      FConnection: IZConnection;
      constructor Create;
   end;
   
  TFormEasyInnerOnLine = CLASS(TForm)
    PRodapeFundo: TPanel;
    PRodapeEsquerda: TPanel;
    cmdSaida: TButton;
    cmdEntrada: TButton;
    PRodapeClient: TPanel;
    cmdParar: TButton;
    cmdIniciar: TButton;
    PGeralLeft: TPanel;
    TTimerBanco: TTimer;
    PGeralAll: TPanel;
    GBCatracas: TGroupBox;
    TGridCatraca: TStringGrid;
    TTimerCatracas: TTimer;
    PFundoOpcoes: TPanel;
    GroupBox1: TGroupBox;
    lblInners: TLabel;
    lblNumDig: TLabel;
    lblPorta: TLabel;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    lblCatraca: TLabel;
    imgCatraca: TImage;
    lblTipoEquipamento: TLabel;
    cboTipoConexao: TComboBox;
    txtPorta: TEdit;
    txtNumInners: TEdit;
    txtNumDigitos: TEdit;
    chkBiometrico: TCheckBox;
    chkVerificacao: TCheckBox;
    chkIdentificacao: TCheckBox;
    chkTeclado: TCheckBox;
    cboTipoLeitor: TComboBox;
    chkDoisLeitores: TCheckBox;
    chkLista: TCheckBox;
    chkListaBio: TCheckBox;
    GroupBox3: TGroupBox;
    lblVersao: TLabel;
    rdbPadraoLivre: TRadioButton;
    rdbPadraoTopdata: TRadioButton;
    optEsquerda: TRadioButton;
    optDireita: TRadioButton;
    cboEquipamento: TComboBox;
    chkCartaoMaster: TCheckBox;
    txtCatraoMaster: TEdit;
    PLogsCatracas: TPanel;
    lstBilhetes: TListBox;
    Panel1: TPanel;
    cmdLimpar: TButton;
    TStatus: TStatusBar;
    TTimerStatusBanco: TTimer;
    procedure TTimerStatusBancoTimer(Sender: TObject);
    procedure TTimerCatracasTimer(Sender: TObject);
    procedure TTimerBancoTimer(Sender: TObject);
    PROCEDURE FormCreate(Sender: TObject);
    PROCEDURE cmdIniciarClick(Sender: TObject);
    PROCEDURE cmdPararClick(Sender: TObject);
    PROCEDURE cboTipoConexaoChange(Sender: TObject);
    PROCEDURE cmdEntradaClick(Sender: TObject);
    PROCEDURE chkBiometricoClick(Sender: TObject);
    PROCEDURE FormClose(Sender: TObject; var Action: TCloseAction);
    PROCEDURE cboTipoLeitorChange(Sender: TObject);
    procedure cmdSaidaClick(Sender: TObject);
    procedure cmdLimparClick(Sender: TObject);
    procedure chkListaBioClick(Sender: TObject);
    procedure chkVerificacaoClick(Sender: TObject);
    procedure optEsquerdaClick(Sender: TObject);
    procedure optDireitaClick(Sender: TObject);
    procedure cboEquipamentoChange(Sender: TObject);
    procedure chkCartaoMasterClick(Sender: TObject);
    procedure rdbPadraoTopdataClick(Sender: TObject);
  PRIVATE
    Inner: TInner;
    FCartoes: TObjectList;
    function FindCartao(const Inner: Integer): TCartao;
    function SaveCartao(const Inner: Integer; const Cartao: AnsiString): TCartao;
//    Function LiberarAcesso(Cartao: string): Boolean;
    FUNCTION MaximoNumeroTentativas(): Boolean;
    FUNCTION ConfiguraEntradasMudancaOnLine(InnerAtual: TInner): Integer;
    FUNCTION BinarioParaDecimal(valorBinario: String): String;
    PROCEDURE MontaConfiguracaoInner(modo: Integer);
    PROCEDURE DefineValoresParaConfigurarLeitores;
    //PROCEDURE DefineVersao;
    PROCEDURE MontarListaTopdata;
    PROCEDURE MontarListaLivre;
    PROCEDURE MontarHorarios;
    PROCEDURE MontarBufferListaSemDigital(InnerAcesso: Boolean);
    PROCEDURE ReceberBilhetes;
    PROCEDURE ReceberBilhetesInnerAcesso;
    PROCEDURE CarregaPrefs();
    function testaConexaoInner(NumInner: Integer): Integer;
    
    // Maquina de Estados..
    PROCEDURE AtualizarMaquinaEstados();

    // Passos da maquina de Estado..
    PROCEDURE PASSO_ESTADO_CONECTAR();
    PROCEDURE PASSO_ESTADO_ENVIAR_CFG_OFFLINE();
    PROCEDURE PASSO_ESTADO_CONFIGURAR_ENTRADAS_ONLINE();
    PROCEDURE PASSO_ESTADO_COLETAR_BILHETES();
    PROCEDURE PASSO_ESTADO_ENVIAR_CFG_ONLINE();
    PROCEDURE PASSO_ESTADO_ENVIAR_DATA_HORA();
    PROCEDURE PASSO_ESTADO_ENVIA_MSG_URNA();
    PROCEDURE PASSO_ESTADO_MONITORA_URNA();
    PROCEDURE PASSO_ESTADO_ENVIAR_MSG_PADRAO();
    PROCEDURE PASSO_ESTADO_POLLING();
    PROCEDURE PASSO_ESTADO_ENVIA_PING_ONLINE();
    PROCEDURE PASSO_AGUARDA_TEMPO_MENSAGEM();
    PROCEDURE PASSO_LIBERA_GIRO_CATRACA();
    PROCEDURE PASSO_MONITORA_GIRO_CATRACA();
    PROCEDURE PASSO_ESTADO_RECONECTAR();
    PROCEDURE PASSO_ESTADO_DEFINICAO_TECLADO();
    PROCEDURE PASSO_ESTADO_AGUARDAR_DEFINICAO_TECLADO();
    PROCEDURE PASSO_ESTADO_ENVIAR_MSG_OFFLINE();
    PROCEDURE PASSO_ESTADO_ENVIAR_HORARIOS();
    PROCEDURE PASSO_ESTADO_ENVIAR_CONFIGMUD_ONLINE_OFFLINE();
    // Catraca Invertida
    PROCEDURE HABILITA_LADO_CATRACA(lado: string);
    Procedure PASSO_ESTADO_ENVIAR_MSG_ACESSO_NEGADO();

    procedure IniciarCatracas();
    procedure PararCatracas();

    procedure InicializarGridCatracas();
    procedure AtualizarGridCatracas();
    procedure LimparGridCatracas();

    // timeCatraca - atualizara o status das catracas
    procedure InicializarTimerCatraca();
    procedure PararTimerCatraca();

    function RetornarDescricaoEstadoCatraca(aEstado: enumEstadosInner): String;

    procedure HabilitarScrollHorizontalListBox(aListBox: TListBox);
    procedure GerarLogTela(aTexto: String);
  PUBLIC
    { Public declarations }
  END;

  // Variáveis utilizadas no Form..
VAR
  
  ConnIni: TIniFile;
  FormEasyInnerOnLine: TFormEasyInnerOnLine;
  listHOR: vetHor; // Lista dos horários
  // Teclado
  // EstadoTeclado : enumEstadosTeclado;
  ultCartao: string;
  intTentativas: Integer;

  // Byte de retorno quando enviado comandos para EasyInner..
  Ret: Byte;

  // Variável utilizada para controlar a maquina de estado, seu inicio e fim..
  Fechar: Boolean;
  Linha: Byte;
  QtdeInners: Integer;

  // Catraca
  // LiberaEntrada: Boolean;
  // LiberaSaida: Boolean;
  // LiberaEntradaInvertida: Boolean;
  // LiberaSaidaInvertida: Boolean;

  // ******************************************************
  // MAIS DE UM INNER

  // Array de Inners utilizados na maquina de estados..
  typInnersCadastrados: ARRAY OF typeInner;

  // Número do inner atual na maquina de estados..
  lngInnerAtual: Integer;

  // Quantidade total de Inners na maquina de estados..
  TotalInners: Integer;

  // tentativas para coleta de bilhetes
  TentativasColeta: Integer;


  arq: TextFile; { declarando a variável "arq" do tipo arquivo texto }
  countErroConexao: integer;
  FIniciarTelaAuto: Boolean;
  FReiniciarCatracasAuto: Boolean;

IMPLEMENTATION

{$R *.DFM}

// ***********************************************************************************
// Esta função ajusta as casas decimais para segundos
// ***********************************************************************************
function Retornar_SegundosSys: double;
begin
  Retornar_SegundosSys := (GetTickCount / DIV_SEGUNDOS);
end;

// ***********************************************************************************
// Formata número menor que 10 com zero na frente
// ***********************************************************************************
function Formata(const valor: String): String;
begin
  if (StrtoInt(valor) < 10) then
    Formata := '0' + InttoStr(StrtoInt(valor))
  else
    Formata := valor;
end;

// ***********************************************************************************
// ABERTURA FORMULÁRIO
// Carregamento das combos
// ***********************************************************************************
PROCEDURE TFormEasyInnerOnLine.FormCreate(Sender: TObject);
BEGIN
   FCartoes := TObjectList.Create;
  // Combo Tipo Conexão
  cboTipoConexao.Items.Add('Serial');
  cboTipoConexao.Items.Add('TCP/IP');
  cboTipoConexao.Items.Add('TCP/IP porta fixa');
  cboTipoConexao.ItemIndex := 3; // Default

  // Combo Tipo Leitor
  cboTipoLeitor.Items.Clear;
  cboTipoLeitor.Items.Add('Código Barras');
  cboTipoLeitor.Items.Add('Magnético');
  cboTipoLeitor.Items.Add('Prox. Abatrack/Smart Card');
  cboTipoLeitor.Items.Add('Prox. Wiegand/Smart Card');
  cboTipoLeitor.Items.Add('Prox. Smart Card Serial');
  cboTipoLeitor.Items.Add('Codigo de barras serial');
  cboTipoLeitor.Items.Add('Wiegand FC sem zero');
  cboTipoLeitor.ItemIndex := 0; // Default

  // Combo Equipamento
  cboEquipamento.Items.Clear;
  cboEquipamento.Items.Add('Não utilizado(Coletor)');
  cboEquipamento.Items.Add('Catraca Entrada/Saída');
  cboEquipamento.Items.Add('Catraca Entrada');
  cboEquipamento.Items.Add('Catraca Saída');
  cboEquipamento.Items.Add('Catraca Saída Liberada');
  cboEquipamento.Items.Add('Catraca Entrada Liberada');
  cboEquipamento.Items.Add('Catraca Liberada 2 Sentidos');
  cboEquipamento.Items.Add('Catraca Liberada 2 Sentidos(Sentido Giro)');
  cboEquipamento.Items.Add('Catraca com Urna');
  cboEquipamento.ItemIndex := 0; // Default

  // Desabilita botões
  cmdEntrada.Enabled := False;
  cmdParar.Enabled := False;
  cmdSaida.Enabled := False;
//  lblVersao.Caption := '';

  CarregaPrefs();
  InicializarGridCatracas();
END;

procedure TFormEasyInnerOnLine.GerarLogTela(aTexto: String);
var
  xTexto: String;
begin
    xTexto := Format('%s - %s', [FormatDateTime('DD/MM/YYYY HH:MM:SS', NOW()), aTexto]);

    lstBilhetes.Items.Add(xTexto);

    // verifica se precisa habilitar scroll horizontal
    HabilitarScrollHorizontalListBox(lstBilhetes);

    // rola o scroll automaticamente para baixo
    lstBilhetes.ItemIndex := lstBilhetes.Items.Count - 1;
    lstBilhetes.ItemIndex := -1;
end;

procedure TFormEasyInnerOnLine.HabilitarScrollHorizontalListBox(aListBox: TListBox);
var
  j, MaxWidth: integer;                                               
begin
  MaxWidth := 0;                                                      
  for j := 0 to aListBox.Items.Count - 1 do
  begin
    if MaxWidth < aListBox.Canvas.TextWidth(aListBox.Items[j]) then
      MaxWidth := aListBox.Canvas.TextWidth(aListBox.Items[j]) ;
  end;

  SendMessage(aListBox.Handle, LB_SETHORIZONTALEXTENT, MaxWidth + 5, 0);
end;

procedure TFormEasyInnerOnLine.InicializarGridCatracas;
begin
  // Inicializa a grid de catracas
  TGridCatraca.Cells[0, 0] := 'Inner';
  TGridCatraca.Cells[1, 0] := 'Status';

  TGridCatraca.ColWidths[0] := 80;
  TGridCatraca.ColWidths[1] := 500;
end;

procedure TFormEasyInnerOnLine.AtualizarGridCatracas;
var
  i, xQtdCatracas: Integer;
  xStatus: String;
begin
  try
    xQtdCatracas := Length(typInnersCadastrados);

    //linhas = qtd de catracas + linha fixa com cabeçalho
    TGridCatraca.RowCount := xQtdCatracas + 1;

    for i := 0 to Pred(xQtdCatracas) do
    begin
      if (TGridCatraca.Cells[0, i + 1] <> IntToStr(typInnersCadastrados[i].Numero)) then
        TGridCatraca.Cells[0, i + 1] := IntToStr(typInnersCadastrados[i].Numero);

      xStatus := RetornarDescricaoEstadoCatraca(typInnersCadastrados[i].EstadoAtual);
      if (TGridCatraca.Cells[1, i + 1] <> xStatus) then
      TGridCatraca.Cells[1, i + 1] := xStatus;
    end;
  except
    on E: Exception do
    begin
      GerarLogTela('Erro ao atualizar a lista de catracas: ' + E.Message);
    end;
  end;
end;

procedure TFormEasyInnerOnLine.LimparGridCatracas;
begin
  try
    TGridCatraca.RowCount := 2;
    TGridCatraca.Cells[0, 1] := '';
    TGridCatraca.Cells[1, 1] := '';
  except
    on E: Exception do
    begin
      GerarLogTela('Erro ao limpar a lista de catracas: ' + E.Message);
    end;
  end;
end;

procedure TFormEasyInnerOnLine.InicializarTimerCatraca;
begin
  TTimerCatracas.Enabled := True;
end;

procedure TFormEasyInnerOnLine.PararTimerCatraca;
begin
  TTimerCatracas.Enabled := False;
end;

procedure TFormEasyInnerOnLine.TTimerCatracasTimer(Sender: TObject);
begin
  AtualizarMaquinaEstados();
  AtualizarGridCatracas();
end;

procedure TFormEasyInnerOnLine.TTimerStatusBancoTimer(Sender: TObject);
var
  xBancoStatus: String;
begin
  xBancoStatus := 'Conectado';
  if (not DM.db.Connected) then
    xBancoStatus := 'Desconectado';

  xBancoStatus := 'Banco de dados: ' + xBancoStatus;

  if (xBancoStatus <> TStatus.Panels[0].Text)  then
  begin
    TStatus.Panels[0].Text := xBancoStatus;
  end;
end;

function TFormEasyInnerOnLine.RetornarDescricaoEstadoCatraca(aEstado: enumEstadosInner): String;
begin
  Result := '';

  case aEstado of
    ESTADO_CONECTAR: Result := 'Conectando...';
    ESTADO_RECONECTAR: Result := 'Reconectando...';
    ESTADO_POLLING: Result := 'Monitorando...';

    ESTADO_ENVIAR_CFG_ONLINE: Result := 'Configurando online...';
    ESTADO_ENVIAR_CFG_OFFLINE: Result := 'Configurando offline...';

    ESTADO_COLETAR_BILHETES: Result := 'Coletando bilhetes...';
    ESTADO_ENVIAR_DATA_HORA: Result := 'Enviando data/hora...';
    ESTADO_ENVIAR_MSG_PADRAO: Result := 'Enviando mensagem padrão...';
    ESTADO_CONFIGURAR_ENTRADAS_ONLINE: Result := 'Configurando entradas online...';
    ESTADO_LIBERAR_CATRACA: Result := 'Liberando catraca...';
    ESTADO_MONITORA_GIRO_CATRACA: Result := 'Monitorando giro da catraca...';
    PING_ONLINE: Result := 'Ping...';
    AGUARDA_TEMPO_MENSAGEM: Result := 'Aguardadno tempo de mensagem...';
    ESTADO_DEFINICAO_TECLADO: Result := 'Definição de teclado...';
    ESTADO_AGUARDAR_DEFINICAO_TECLADO: Result := 'Aguardando definição do teclado...';
    ESTADO_ENVIA_MSG_URNA: Result := 'Enviando mensagem urna...';
    ESTADO_MONITORA_URNA: Result := 'Monitorando urna...';
    ESTADO_ENVIAR_MENSAGEM: Result := 'Enviando mensagem...';
    ESTADO_ENVIAR_HORARIOS: Result := 'Enviando horários...';
    ESTADO_ENVIAR_CONFIGMUD_ONLINE_OFFLINE: Result := 'Enviando config. online e offline...';
    ESTADO_ENVIAR_MSG_ACESSO_NEGADO: Result := 'Acesso negado...';
  end;
end;

{Function TFormEasyInnerOnLine.LiberarAcesso(Cartao: string): Boolean;
var
  Cartoes: TStringList;
  i: Integer;
Begin
  Cartoes := TStringList.Create;
  Cartoes.Add('1');
  Cartoes.Add('187');
  Cartoes.Add('123456');
  Cartoes.Add('27105070');
  Cartoes.Add('103086639459');
  Cartoes.Add('00004370356707');
  Cartoes.Add('00201874549706');

  For i := 0 to Cartoes.Count - 1 do
  Begin
    if (Cartoes[i] = trim(Cartao)) then
      LiberarAcesso := true
  end;

  Result := True;
end;       }

// ***********************************************************************************
// FUNCIONAMENTO DA MÁQUINA DE ESTADOS
// MÉTODO RESPONSÁVEL EM EXECUTAR OS PROCEDIMENTOS DO MODO ONLINE
// A Máquina de Estados nada mais é do que uma rotina que fica em loop testando
// uma variável que chamamos de Estado. Dependendo do estado atual, executamos
// alguns procedimentos e em seguida alteramos o estado que será verificado pela
// máquina de estados novamente no próximo passo do loop.
// ***********************************************************************************
PROCEDURE TFormEasyInnerOnLine.AtualizarMaquinaEstados();
BEGIN
  WITH typInnersCadastrados[lngInnerAtual] DO
  BEGIN
    CASE EstadoAtual OF
      ESTADO_CONECTAR:
        PASSO_ESTADO_CONECTAR();

      ESTADO_RECONECTAR:
        PASSO_ESTADO_RECONECTAR();

      ESTADO_ENVIAR_CFG_OFFLINE:
        PASSO_ESTADO_ENVIAR_CFG_OFFLINE();

      ESTADO_COLETAR_BILHETES:
        PASSO_ESTADO_COLETAR_BILHETES();

      ESTADO_ENVIAR_CFG_ONLINE:
        PASSO_ESTADO_ENVIAR_CFG_ONLINE();

      ESTADO_ENVIAR_DATA_HORA:
        PASSO_ESTADO_ENVIAR_DATA_HORA();

      ESTADO_ENVIAR_MSG_PADRAO:
        PASSO_ESTADO_ENVIAR_MSG_PADRAO();

      ESTADO_CONFIGURAR_ENTRADAS_ONLINE:
        PASSO_ESTADO_CONFIGURAR_ENTRADAS_ONLINE();

      ESTADO_POLLING:
        PASSO_ESTADO_POLLING();

      ESTADO_LIBERAR_CATRACA:
        PASSO_LIBERA_GIRO_CATRACA();

      ESTADO_MONITORA_GIRO_CATRACA:
        PASSO_MONITORA_GIRO_CATRACA();

      PING_ONLINE:
        PASSO_ESTADO_ENVIA_PING_ONLINE();                          

      AGUARDA_TEMPO_MENSAGEM:
        PASSO_AGUARDA_TEMPO_MENSAGEM();

      ESTADO_DEFINICAO_TECLADO:
        PASSO_ESTADO_DEFINICAO_TECLADO();

      ESTADO_AGUARDAR_DEFINICAO_TECLADO:
        PASSO_ESTADO_AGUARDAR_DEFINICAO_TECLADO();

      ESTADO_ENVIA_MSG_URNA:
        PASSO_ESTADO_ENVIA_MSG_URNA();

      ESTADO_MONITORA_URNA:
        PASSO_ESTADO_MONITORA_URNA();

      ESTADO_ENVIAR_MENSAGEM:
        PASSO_ESTADO_ENVIAR_MSG_OFFLINE();

      ESTADO_ENVIAR_HORARIOS:
        PASSO_ESTADO_ENVIAR_HORARIOS();

      ESTADO_ENVIAR_CONFIGMUD_ONLINE_OFFLINE:
        PASSO_ESTADO_ENVIAR_CONFIGMUD_ONLINE_OFFLINE();

      ESTADO_ENVIAR_MSG_ACESSO_NEGADO:
        PASSO_ESTADO_ENVIAR_MSG_ACESSO_NEGADO();
    END;

{      Inc(CntDoEvents);

      IF (CntDoEvents > 10) THEN
      BEGIN
        CntDoEvents := 0;
        Application.ProcessMessages;
        Sleep(1);
      END;}

    lngInnerAtual := lngInnerAtual + 1;
    IF ((lngInnerAtual + 1) > TotalInners) THEN
    BEGIN
      lngInnerAtual := 0;
    END;
  END;
END;

procedure TFormEasyInnerOnLine.IniciarCatracas;
var
  Count: Integer;
begin
  try
    // Campo obrigatório
    IF cboTipoLeitor.ItemIndex = -1 THEN
    BEGIN
      MessageDlg('Favor selecionar um tipo de leitor !', mtWarning, [mbOk], 0);
      Exit;
    END;

    countErroConexao := 0;

    // Catraca
    If (cboEquipamento.ItemIndex <> Acionamento_Coletor) and
      (not optDireita.Checked) and (not optEsquerda.Checked) Then
    begin
      MessageDlg('Favor informar o lado de instalação da catraca !', mtError,
        [mbOk], 0);
      cboEquipamento.SetFocus;
      Screen.Cursor := crDefault;
      Exit;
    end;

    GerarLogTela('Iniciando catracas...');

    Inner := TInner.Create;

    // Define a quantidade de Inners que o sistema terá..
    TotalInners := StrtoInt(txtNumInners.Text);
    SetLength(typInnersCadastrados, TotalInners);

    // Atribui o vetor com os números dos Inners, sempre de 1 a N
    FOR Count := 0 TO TotalInners - 1 DO
    BEGIN
      typInnersCadastrados[Count].Numero := Count + 1;

      // Catraca
      If (cboEquipamento.ItemIndex <> Acionamento_Coletor) Then
        typInnersCadastrados[Count].Catraca := true
      Else
        typInnersCadastrados[Count].Catraca := False;

      // Seta nas configurações do Inner os dados informados em tela
      typInnersCadastrados[Count].Biometrico := chkBiometrico.Checked;
      typInnersCadastrados[Count].QtdDigitos := StrtoInt(txtNumDigitos.Text);
      typInnersCadastrados[Count].CntDoEvents := 0;
      typInnersCadastrados[Count].Teclado := chkTeclado.Checked;
      typInnersCadastrados[Count].PadraoCartao := cboTipoLeitor.ItemIndex;
      typInnersCadastrados[Count].ListaBio := chkListaBio.Checked;
      typInnersCadastrados[Count].Lista := chkLista.Checked;

      // Seta as configurações Bio
      IF (chkVerificacao.Checked) THEN
        typInnersCadastrados[Count].Verificacao := 1
      ELSE
        typInnersCadastrados[Count].Verificacao := 0;

      IF chkIdentificacao.Checked THEN
        typInnersCadastrados[Count].Identificacao := 1
      ELSE
        typInnersCadastrados[Count].Identificacao := 0;

      typInnersCadastrados[Count].DoisLeitores := chkDoisLeitores.Checked;
      typInnersCadastrados[Count].CountPingFail := 0;
      typInnersCadastrados[Count].CountTentativasEnvioComando := 0;

      // Define o estado Inicial de cada Inner como Conectar..
      typInnersCadastrados[Count].EstadoAtual := ESTADO_CONECTAR;
    END;

    // Define qual será o tipo de conexão(meio de comunicação) que será utilizada
    // pela dll para comunicar com os Inners.
    DefinirTipoConexao(cboTipoConexao.ItemIndex);

    // Define o Tipo de padrão de Cartão..
    if rdbPadraoLivre.Checked then
      DefinirPadraoCartao(TpCartao_PADRAO_LIVRE)
    else
      DefinirPadraoCartao(TpCartao_TOPDATA);

    FecharPortaComunicacao();
    Ret := AbrirPortaComunicacao(StrtoInt(txtPorta.Text));

    IF (Ret = RET_COMANDO_OK) THEN
    BEGIN
      InicializarTimerCatraca();
    END;
  except
    on E: Exception do
    begin
      GerarLogTela('Erro ao inicializar catracas: ' + E.Message);
    end;
  end;
end;

procedure TFormEasyInnerOnLine.PararCatracas;
begin
  GerarLogTela('Parando catracas...');

  try
    PararTimerCatraca();
    FecharPortaComunicacao();

    if (Fechar = true) then
      CloseQuery;
  except
    on E: Exception do
    begin
      GerarLogTela('Erro ao parar catracas: ' + E.Message);
    end;
  end;
end;

// ***********************************************************************************
// INICIAR
// Envia as configurações e deixa em modo online (Polling)
// ***********************************************************************************
PROCEDURE TFormEasyInnerOnLine.cmdIniciarClick(Sender: TObject);
BEGIN
  IniciarCatracas();

  cmdParar.Enabled := true;
  cmdIniciar.Enabled := False;            
END;

procedure TFormEasyInnerOnLine.TTimerBancoTimer(Sender: TObject);
var
  xProcesso: String;
begin
  try
    xProcesso := 'Verificando conexão...';

    if (not DM.db.Connected) then
    begin
      xProcesso := 'Forçando conexão...';
      DM.db.Connect;
      Sleep(600);
    end;

    if (not DM.db.Connected) then
    begin
      GerarLogTela('Ocorreu um erro ao tentar atualizar a conexão com o banco de dados...');
    end;

    xProcesso := 'Carregar horário...';

    // Executa para não perder a conexão com o banco de dados.
    DM.DataAtual;

    xProcesso := 'Verificar debug...';
    if (DM.IsDebugging and DM.TryLoadDebugger) then
    begin
      GerarLogTela('Atualizando conexão com o banco de dados...');
      lstBilhetes.Items.SaveToFile(ExtractFilePath(ParamStr(0)) + 'debug_memo_catraca.txt');
    end;
  except
    on E: Exception do
    begin
      GerarLogTela('Erro ao verificar conexão com banco de dados: ' + xProcesso + ': ' + E.Message);
    end;
  end;
 end;

// ***********************************************************************************
// PARAR
// Altera de modo online para offline
// ***********************************************************************************
PROCEDURE TFormEasyInnerOnLine.cmdPararClick(Sender: TObject);
BEGIN
  // Desabilita botões
  cmdEntrada.Enabled := False;
  cmdParar.Enabled := False;
  cmdSaida.Enabled := False;

  PararCatracas();
  LimparGridCatracas();

  // Habilita botão
  cmdIniciar.Enabled := true;
  Application.ProcessMessages;
END;

// ***********************************************************************************
// Combo Tipo Conexão
// Carrega campo Porta de acordo com a seleção
// ***********************************************************************************
PROCEDURE TFormEasyInnerOnLine.cboTipoConexaoChange(Sender: TObject);
BEGIN
  IF (cboTipoConexao.ItemIndex = 0) THEN
    txtPorta.Text := '1'
  ELSE
    txtPorta.Text := '3570';
END;

// ***********************************************************************************
// ENTRADA
// Efetua a operação de entrada da catraca
// ***********************************************************************************
PROCEDURE TFormEasyInnerOnLine.cmdEntradaClick(Sender: TObject);
BEGIN
  try
    IF (cboEquipamento.ItemIndex <> Acionamento_Coletor) THEN
    BEGIN
      // Catraca
      HABILITA_LADO_CATRACA('Entrada');
      typInnersCadastrados[lngInnerAtual].EstadoAtual := ESTADO_LIBERAR_CATRACA;
      cmdEntrada.Enabled := False;
      cmdSaida.Enabled := False;
    END
    ELSE
    BEGIN
      // coletor
      cmdEntrada.Enabled := False;
      cmdSaida.Enabled := False;
      AcionarRele1(1);
      EnviarMensagemPadraoOnLine(1, 0, 'Acesso Liberado!!');
      typInnersCadastrados[lngInnerAtual].TempoInicialMensagem := Now;
      typInnersCadastrados[lngInnerAtual].EstadoAtual := AGUARDA_TEMPO_MENSAGEM;
      cmdEntrada.Enabled := true;
      cmdSaida.Enabled := true;
    END;
  except
    on E: Exception do
    begin
      GerarLogTela('Erro ao executar entrada de catraca: ' + E.Message);
    end;
  end;
END;

// ***********************************************************************************
// SAÍDA
// Efetua a operação de saída da catraca
// ***********************************************************************************
PROCEDURE TFormEasyInnerOnLine.cmdSaidaClick(Sender: TObject);
BEGIN
  try
    IF (cboEquipamento.ItemIndex <> Acionamento_Coletor) THEN
    BEGIN
      // Catraca
      HABILITA_LADO_CATRACA('Saida');
      typInnersCadastrados[lngInnerAtual].EstadoAtual := ESTADO_LIBERAR_CATRACA;
      cmdEntrada.Enabled := False;
      cmdSaida.Enabled := False;
    END
    ELSE
    BEGIN
      // coletor
      cmdEntrada.Enabled := False;
      cmdSaida.Enabled := False;
      AcionarRele2(1);
      EnviarMensagemPadraoOnLine(1, 0, 'Acesso Liberado!!');
      typInnersCadastrados[lngInnerAtual].TempoInicialMensagem := Now;
      typInnersCadastrados[lngInnerAtual].EstadoAtual := AGUARDA_TEMPO_MENSAGEM;
      cmdEntrada.Enabled := true;
      cmdSaida.Enabled := true;
    END;
  except
    on E: Exception do
    begin
      GerarLogTela('Erro ao executar saída de catraca: ' + E.Message);
    end;
  end;
END;

// ***********************************************************************************
// HABILITA/DESABILITA CAMPOS
// ***********************************************************************************
PROCEDURE TFormEasyInnerOnLine.chkBiometricoClick(Sender: TObject);
BEGIN
  IF (chkBiometrico.Checked) THEN
  BEGIN
    chkVerificacao.Enabled := true;
    chkIdentificacao.Enabled := true;
    chkListaBio.Enabled := true;
  END
  ELSE
  BEGIN
    chkVerificacao.Enabled := False;
    chkIdentificacao.Enabled := False;
    chkListaBio.Enabled := False;
    chkVerificacao.Checked := False;
    chkIdentificacao.Checked := False;
    chkListaBio.Checked := False;
  END;
END;

// ***********************************************************************************
// FECHAMENTO FORMULÁRIO
// ***********************************************************************************

function TFormEasyInnerOnLine.FindCartao(const Inner: Integer): TCartao;
var
   Temp: TCartao;
   I: Integer;
begin
  Result := nil;

  try
     for I := 0 to FCartoes.Count - 1 do
     begin
        Temp := TCartao(FCartoes.Items[I]);

        if Temp.FInner = Inner then
        begin
           Result := Temp;
           Break;
        end;
     end;

     if Result = nil then
     begin
        GerarLogTela('Não encontrou nenhum cartão');

        Temp := TCartao.Create;
        Temp.FInner := Inner;
        FCartoes.Add(Temp);

        Result := Temp;
     end;
  except
    on E: Exception do
    begin
      GerarLogTela('Erro ao buscar cartões: ' + E.Message);
    end;
  end;
end;

PROCEDURE TFormEasyInnerOnLine.FormClose(Sender: TObject; var Action: TCloseAction);
BEGIN
  Action := caFree;
  FecharPortaComunicacao;
END;

// ***********************************************************************************
// Se tipo de leitor for proximidade habilita opção 2 leitores
// ***********************************************************************************
PROCEDURE TFormEasyInnerOnLine.cboTipoLeitorChange(Sender: TObject);
BEGIN
  chkDoisLeitores.Enabled :=
    (not(cboTipoLeitor.ItemIndex = TpLeitor_CODIGO_DE_BARRAS) and
    not(cboTipoLeitor.ItemIndex = TpLeitor_MAGNETICO));
  chkDoisLeitores.Checked := False;
END;

// ***********************************************************************************
// Define Mudanças OnLine
// Função que configura BIT a BIT, Ver no manual Anexo III
// ***********************************************************************************
FUNCTION TFormEasyInnerOnLine.ConfiguraEntradasMudancaOnLine(InnerAtual: TInner): Integer;
VAR
  Configuracao: String;
  _Leitor: String;
BEGIN
  try
	  // Usa o Inner Atual na lista de Inners Cadastrados...
	  WITH typInnersCadastrados[lngInnerAtual] DO
	  BEGIN
		// Habilita Teclado
		IF Teclado THEN
		  Configuracao := '1'
		ELSE
		  Configuracao := '0';

		IF not(Biometrico) THEN
		BEGIN
		  // Dois leitores
		  IF (DoisLeitores) THEN
			Configuracao := '010' + // Leitor 2 só saida
			  '001' + // Leitor 1 só entrada
			  Configuracao
		  ELSE // Apenas um leitores
			Configuracao := '000' + // Leitor 2 Desativado
			  '011' + // Leitor 1 configurado para Entrada e Saída
			  Configuracao;

		  Configuracao := '1' + // Habilitado
			Configuracao;
		  {
			--------------------------------------------------------------------------------------------------
			|       7        |     6      |   5    |   4    |   3    |    2    |      1     |        0       |
			--------------------------------------------------------------------------------------------------
			| Seta/Reseta    |  Bit 2     |  Bit 1 |  Bit 0 | Bit 2  |  Bit 1  |   Bit 0    |  Teclado       |
			|   config.      | Leitor 2   |        |        |        |         |            |                |
			|   bit-a-bit    |            |        |        |        |         |            |                |
			--------------------------------------------------------------------------------------------------
			| 1 – Habilita   | 000 – Desativa leitor        |  000 - Desativa leitor        | 1 – Habilita   |
			| 0 – Desabilita | 001 - Leitor só entrada      |  001 - Leitor só entrada      | 0 – Desabilita |
			|                | 010 - Leitor só saída        |  010 - Leitor só saída        |                |
			|                | 011 - Leitor Entrada e saída |  011 - Leitor Entrada e saída |                |
			|                | 100 - Leitor Entrada e Saída |  100 - Leitor Entrada e       |                |
			|                |   Invertido                  |   Saída Invertido             |                |
			--------------------------------------------------------------------------------------------------
		  }

		END
		ELSE // Com Biometria
		BEGIN
		  IF (DoisLeitores) THEN
			_Leitor := '11'
		  ELSE
			_Leitor := '10';

		  Configuracao := '0' + // Bit Fixo
			'1' + // Habilitado
			InttoStr(Identificacao) + // Identificação
			InttoStr(Verificacao) + // Verificação
			'0' + // Bit fixo
			_Leitor + // 11 -> habilita leitor 1 e 2, 10 -> habilita apenas leitor 1
			Configuracao;
		  {
			------------------------------------------------------------------------------------------------------------------------
			|    7     |       6       |       5       |       4       |      3       |       2      |      1       |      0       |
			------------------------------------------------------------------------------------------------------------------------
			| Bit fixo | Seta/Reseta   | Identificação |  Verificação  |   Bit fixo   |   Leitor 1   | Leitor 2     |  Teclado     |
			|   '0'    |    config.    |      Bio      |      Bio      |    Config    |              |              |              |
			|          | bit-a-bit bio |               |               |      L2      |              |              |              |
			|          |               |               |               |     '0'      |              |              |              |
			------------------------------------------------------------------------------------------------------------------------
			|    0     |  1-Habilita   | 1-Habilita    | 1-Habilita    | 1-Habilita   | 1-Habilita   | 1-Habilita   | 1-Habilita   |
			|          |  0-Desabilita | 0-Desabilita  | 0-Desabilita  | 0-Desabilita | 0-Desabilita | 0-Desabilita | 0-Desabilita |
			------------------------------------------------------------------------------------------------------------------------
		  }
		END;

		// Converte Binário para Decimal
		ConfiguraEntradasMudancaOnLine :=
		  StrtoInt(BinarioParaDecimal(Configuracao));
	  END;
  except
    on E: Exception do
    begin
      GerarLogTela('Erro ao configurar entrada mudança online: ' + E.Message);
    end;  
  end;
END;

// ***********************************************************************************
// Converte Binário para Decimal
// ***********************************************************************************
FUNCTION TFormEasyInnerOnLine.BinarioParaDecimal(valorBinario: string): String;
VAR
  decimal: real;
  x, y: Integer;
BEGIN
  try
	  decimal := 0;
	  y := 0;
	  FOR x := Length(valorBinario) DOWNTO 1 DO
	  BEGIN
		decimal := decimal + (StrToFloat(valorBinario[x])) * Exp(y * Ln(2));
		y := y + 1;
	  END;
	  BinarioParaDecimal := FloatToStr(decimal);
  except
    on E: Exception do
    begin
      GerarLogTela('Erro ao converter binario para decimal: ' + E.Message);
    end;
  end;
END;

// ***********************************************************************************
// CONFIGURAÇÃO LEITORES
// De acordo com o lado da catraca, coletor ou se é dois leitores
// ***********************************************************************************
PROCEDURE TFormEasyInnerOnLine.DefineValoresParaConfigurarLeitores;
BEGIN
  try
	  // Usa o Inner Atual na lista de Inners Cadastrados...
	  WITH typInnersCadastrados[lngInnerAtual] DO
	  BEGIN

		// Configuração Catraca Esquerda ou Direita
		// define os valores para configurar os leitores de acordo com o tipo de inner
		If (DoisLeitores) Then
		begin
		  If (optDireita.Checked) Then
		  begin
			// Direita Selecionado
			ValorLeitor1 := EntradasOff_LEITOR1_SOMENTE_ENTRADA;
			ValorLeitor2 := EntradasOff_LEITOR2_SOMENTE_SAIDA;
		  end
		  Else
		  begin
			// Esquerda Selecionado
			ValorLeitor1 := EntradasOff_LEITOR1_SOMENTE_SAIDA;
			ValorLeitor2 := EntradasOff_LEITOR2_SOMENTE_ENTRADA;
		  End;
		end
		Else If (optDireita.Checked) Then
		  // Direita Selecionado
		  ValorLeitor1 := EntradasOff_LEITOR1_ENTRADA_SAIDA
		Else
		  // Esquerda Selecionado
		  ValorLeitor1 := EntradasOff_LEITOR1_SAIDA_ENTRADA;

		ValorLeitor2 := EntradasOff_LEITOR1_DESABILITADO;
	  END;
  except
    on E: Exception do
    begin
      GerarLogTela('Erro ao definir valores para configurar leitores: ' + E.Message);
    end;  
  end;  
END;

// ***********************************************************************************
// MONTAR CONFIGURAÇÃO
// Envia as configurações, relogio, mensagem, horarios, lista de acesso, horario
// da sirene, lista dos inners.
// ***********************************************************************************
PROCEDURE TFormEasyInnerOnLine.MontaConfiguracaoInner(modo: Integer);
begin
  try
	  // Usa o Inner Atual na lista de Inners Cadastrados...
	  WITH typInnersCadastrados[lngInnerAtual] DO
	  BEGIN

		// Antes de realizar a configuração precisa definir o Padrão do cartão
		if rdbPadraoLivre.Checked then
		  DefinirPadraoCartao(TpCartao_PADRAO_LIVRE)
		else
		  DefinirPadraoCartao(TpCartao_TOPDATA);

		// Define modo de comunicação
		IF (modo = MODO_OFF_LINE) THEN
		  // Configurações para Modo Offline.
		  // Prepara o Inner para trabalhar no modo Off-Line, porém essa função
		  // ainda não envia essa informação para o equipamento.
		  ConfigurarInnerOffLine()
		ELSE
		  // Configurações para Modo Online.
		  // Prepara o Inner para trabalhar no modo On-Line, porém essa função
		  // ainda não envia essa informação para o equipamento.
		  ConfigurarInnerOnLine();

		// Verificar
		// Acionamentos 1 e 2
		// Configura como irá funcionar o acionamento(rele) 1 e 2 do Inner, e por
		// quanto tempo ele será acionado.
		case cboEquipamento.ItemIndex of
		  // Coletor
		  Acionamento_Coletor:
			begin
			  ConfigurarAcionamento1
				(FncAcionamento_ACIONA_REGISTRO_ENTRADA_OU_SAIDA, 5);
			  ConfigurarAcionamento2
				(FncAcionamento_ACIONA_REGISTRO_ENTRADA_OU_SAIDA, 3);
			end;

		  // Catraca  entrada e saida, libera conforme leitor
		  Acionamento_Catraca_Entrada_E_Saida:
			begin
			  ConfigurarAcionamento1
				(FncAcionamento_ACIONA_REGISTRO_ENTRADA_OU_SAIDA, 5);
			  ConfigurarAcionamento2(FncAcionamento_NAO_UTILIZADO, 0);

			  ConfigurarLeitor1(EntradasOff_LEITOR1_ENTRADA_SAIDA);

			  if (chkDoisLeitores.Checked) then
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
			  // Se Esquerda Selecionado - Inverte código
			  If (cboEquipamento.ItemIndex <> Acionamento_Coletor) And
				(optDireita.Checked) Then
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

		  // catraca somente de saida
		  Acionamento_Catraca_Saida:
			begin
			  // Se Esquerda Selecionado - Inverte código
			  If (cboEquipamento.ItemIndex <> Acionamento_Coletor) And
				(optDireita.Checked) Then
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

		  // catraca com urna
		  Acionamento_Catraca_Urna:
			begin
			  ConfigurarAcionamento1
				(FncAcionamento_ACIONA_REGISTRO_ENTRADA_OU_SAIDA, 5);
			  ConfigurarAcionamento2(FncAcionamento_ACIONA_REGISTRO_SAIDA, 5);

			  ConfigurarLeitor1(EntradasOff_LEITOR1_SOMENTE_ENTRADA);
			  ConfigurarLeitor2(EntradasOff_LEITOR2_ENTRADA_SAIDA);

			end;

		  // catraca de entrada com saída liberada
		  Acionamento_Catraca_Saida_Liberada:
			begin
			  // Se Esquerda Selecionado - Inverte código
			  If (cboEquipamento.ItemIndex <> Acionamento_Coletor) And
				(optDireita.Checked) Then
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

		  // catraca de saída com entrada liberada
		  Acionamento_Catraca_Entrada_Liberada:
			begin
			  // Se Esquerda Selecionado - Inverte código
			  If (cboEquipamento.ItemIndex <> Acionamento_Coletor) And
				(optDireita.Checked) Then
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

		  // catraca livre nos dois sentidos
		  Acionamento_Catraca_Liberada_2_Sentidos:
			begin
			  ConfigurarAcionamento1
				(FncAcionamento_CATRACA_LIBERADA_DOIS_SENTIDOS, 5);
			  ConfigurarAcionamento2(FncAcionamento_NAO_UTILIZADO, 0);
			  ConfigurarLeitor1(EntradasOff_LEITOR1_ENTRADA_SAIDA);

			  if (chkDoisLeitores.Checked) then
			  begin
				ConfigurarLeitor2(EntradasOff_LEITOR2_ENTRADA_SAIDA);
			  end
			  else
			  begin
				ConfigurarLeitor2(EntradasOff_LEITOR2_DESABILITADO);
			  end;
			end;

		  // catraca bloqueda nos dois sentidos, libera nos dois sentidos e faz registro conforme o giro
		  Acionamento_Catraca_Sentido_Giro:
			begin
			  ConfigurarAcionamento1
				(FncAcionamento_CATRACA_LIBERADA_DOIS_SENTIDOS_MARCACAO_REGISTRO,
				5);
			  ConfigurarAcionamento2(FncAcionamento_NAO_UTILIZADO, 0);
			  ConfigurarLeitor1(EntradasOff_LEITOR1_ENTRADA_SAIDA);

			  if (chkDoisLeitores.Checked) then
			  begin
				ConfigurarLeitor2(EntradasOff_LEITOR2_ENTRADA_SAIDA);
			  end
			  else
			  begin
				ConfigurarLeitor2(EntradasOff_LEITOR2_DESABILITADO);
			  end;
			end;

		end;

		// Configurar tipo do leitor
		CASE PadraoCartao OF
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
		END;

		DefinirQuantidadeDigitosCartao(QtdDigitos);
		// Caso desejar configurar o Inner para ler cartoes
		// que possam variar de 1 dígito até 16 dígitos
		// utilizar a funcao InserirQuantidadeDigitoVariavel
		//InserirQuantidadeDigitoVariavel(6);
		//InserirQuantidadeDigitoVariavel(8);

		IF (chkCartaoMaster.Checked) then
		begin
		  DefinirNumeroCartaoMaster(txtCatraoMaster.Text);
		end;

		// Habilitar teclado
		IF (Teclado) THEN
		  HabilitarTeclado(Opcao_SIM, 0)
		ELSE
		  HabilitarTeclado(Opcao_NAO, 0);

		// Define os valores para configurar os leitores de acordo com o tipo de inner
		DefineValoresParaConfigurarLeitores;
		ConfigurarLeitor1(ValorLeitor1);
		ConfigurarLeitor2(ValorLeitor2);

		// Box = Configura equipamentos com dois leitores
		IF (DoisLeitores) THEN
		  ConfigurarWiegandDoisLeitores(0, Opcao_SIM);

		// Registra acesso negado
		RegistrarAcessoNegado(1);

		// Catraca
		// Define qual será o tipo do registro realizado pelo Inner ao aproximar um
		// cartão do tipo proximidade no leitor do Inner, sem que o usuário tenha
		// pressionado a tecla entrada, saída ou função.
		If ((cboEquipamento.ItemIndex = Acionamento_Catraca_Entrada_E_Saida) Or
		  (cboEquipamento.ItemIndex = Acionamento_Catraca_Liberada_2_Sentidos) Or
		  (cboEquipamento.ItemIndex = Acionamento_Catraca_Sentido_Giro)) Then
		begin
		  DefinirFuncaoDefaultLeitoresProximidade(12);
		  // 12 – Libera a catraca nos dois sentidos e registra o bilhete conforme o sentido giro.
		end
		Else
		begin
		  If ((cboEquipamento.ItemIndex = Acionamento_Catraca_Entrada) Or
			(cboEquipamento.ItemIndex = Acionamento_Catraca_Saida_Liberada)) Then
		  begin
			if (optDireita.Checked) then
			  DefinirFuncaoDefaultLeitoresProximidade(10)
			  // 10 – Registrar sempre como entrada.
			Else
			  DefinirFuncaoDefaultLeitoresProximidade(11);
			// 11 – Registrar sempre como saída.

		  end
		  else
		  begin
			if (optDireita.Checked) then
			  DefinirFuncaoDefaultLeitoresProximidade(11)
			  // 11 – Registrar sempre como saída.
			Else
			  DefinirFuncaoDefaultLeitoresProximidade(10);
			// 10 – Registrar sempre como entrada.
		  end;
		End;

		// Configura o tipo de registro que será associado a uma marcação
		IF (Biometrico) THEN
		  DefinirFuncaoDefaultSensorBiometria(10)
		ELSE
		  DefinirFuncaoDefaultSensorBiometria(0);

		IF (QtdDigitos <= 14) then
		BEGIN
		  // Configura para receber o horario dos dados quando Online.
		  ReceberDataHoraDadosOnLine(Opcao_SIM);
		END;

	//    ConfigurarBioVariavel(1);
	  END;
  except
    on E: Exception do
    begin
      GerarLogTela('Erro ao montar configuração inners: ' + E.Message);
    end;
  end;  
END;

// ***********************************************************************************
// Realiza o teste de conexão com o Inner
// ***********************************************************************************
function TFormEasyInnerOnLine.testaConexaoInner(NumInner: Integer): Integer;
Var
  Dia: Byte;
  Mes: Byte;
  Ano: Byte;
  Hora: Byte;
  Minuto: Byte;
  Segundo: Byte;
Begin
  try
	  Dia := 0;
	  Mes := 0;
	  Ano := 0;
	  Hora := 0;
	  Minuto := 0;
	  Segundo := 0;

	  testaConexaoInner := ReceberRelogio(NumInner, @Dia, @Mes, @Ano, @Hora,
		@Minuto, @Segundo);
	  Application.ProcessMessages;
  except
    on E: Exception do
    begin
      GerarLogTela('Erro ao testar conexão com inners: ' + E.Message);
    end;
  end;  
END;

// ***********************************************************************************
// CONECTAR
// Inicia a conexão com o Inner
// Próximo passo: ESTADO_ENVIAR_CFG_OFFLINE
// ***********************************************************************************
PROCEDURE TFormEasyInnerOnLine.PASSO_ESTADO_CONECTAR();
const
   SLogEsperaFmt = 'Inner: %d > Aguardar 2 segundos para reconexão...';
   SLogConectouFmt = 'Inner: %d > Conexão efetuada com sucesso!';
   SLogNaoConectouFmt = 'Inner: %d > Não foi possível estabelecer conexão.';
VAR
  tempo: TDateTime;
BEGIN
  try
	  // Usa o Inner Atual na lista de Inners Cadastrados...
	  WITH typInnersCadastrados[lngInnerAtual] DO
	  BEGIN
		TRY
	//      lblStatus.Caption := 'Inner ' + InttoStr(Numero) + ' Estado conectar';
		  tempo := Now - TempoInicialConectar;
		  If StrtoInt(FormatDateTime('ss', tempo)) < 2 then
		  Begin
			Exit;
		  End;
		  TempoInicialConectar := Now;
		  // Testa a conexão, tenta enviar um relógio para o Inner.
		  Ret := testaConexaoInner(Numero);
		  IF (Ret = RET_COMANDO_OK) THEN
		  BEGIN
			// caso consiga o Inner vai para o Passo de Configuração OFFLINE, posteriormente para coleta de Bilhetes.
			CountTentativasEnvioComando := 0;
			EstadoAtual := ESTADO_ENVIAR_CFG_OFFLINE;
		  END
		  ELSE
		  BEGIN
			// caso ele não consiga, tentará enviar três vezes, se não conseguir volta para o passo Reconectar
			IF (CountTentativasEnvioComando >= 3) THEN
			Begin
			  EstadoAtual := ESTADO_RECONECTAR;
			End;
			Inc(CountTentativasEnvioComando);
		  END;
		EXCEPT
		  EstadoAtual := ESTADO_CONECTAR;
		END;
	  END;
  except
    on E: Exception do
    begin
      GerarLogTela('Erro estado conectar: ' + E.Message);
    end;
  end;
END;

Procedure TFormEasyInnerOnLine.PASSO_ESTADO_ENVIAR_MSG_ACESSO_NEGADO();
Begin
  try
	  WITH typInnersCadastrados[lngInnerAtual] DO
	  BEGIN
	//    lblStatus.Caption := 'Inner ' + InttoStr(Numero) +  ' Enviando mensagem de acesso negado!';
		Application.ProcessMessages;

		Ret := EnviarMensagemPadraoOnLine(Numero, 0,
		  'Acesso bloqueado!');

		if (Ret = 0) then
		Begin
		  AcionarBipLongo(Numero);
		  if (InnerNetAcesso) then
			LigarLedVermelho(Numero);
		  TempoInicialMensagem := Now;
		  CountTentativasEnvioComando := 0;
		  EstadoAtual := AGUARDA_TEMPO_MENSAGEM;
		end
		else
		Begin
		  if (CountTentativasEnvioComando > 3) then
			EstadoAtual := ESTADO_RECONECTAR;
		  CountTentativasEnvioComando := CountTentativasEnvioComando + 1;
		end;
	  end;
  except
    on E: Exception do
    begin
      GerarLogTela('Erro estado enviar mensagem acesso negado: ' + E.Message);
    end;
  end;  
end;

PROCEDURE TFormEasyInnerOnLine.PASSO_ESTADO_ENVIAR_MSG_OFFLINE();
BEGIN
  try
	  WITH typInnersCadastrados[lngInnerAtual] DO
	  BEGIN
		// Mensagem Entrada e Saida Offline Liberado!
		if (optEsquerda.Checked) then
		begin
		  DefinirMensagemEntradaOffLine(1, 'Entrada liberada.');
		  DefinirMensagemSaidaOffLine(1, 'Saida liberada.');
		end
		else
		begin
		  DefinirMensagemEntradaOffLine(1, 'Saida liberada.');
		  DefinirMensagemSaidaOffLine(1, 'Entrada liberada.');
		end;
		DefinirMensagemPadraoOffLine(1, 'Modo OffLine');

		// Envia mensagens definidas
		Ret := EnviarMensagensOffLine(Numero);

		IF (Ret = RET_COMANDO_OK) THEN
		BEGIN

		  // Zera contador
		  CountTentativasEnvioComando := 0;
		  EstadoAtual := ESTADO_ENVIAR_CONFIGMUD_ONLINE_OFFLINE;

		  // Adiciona 3 segundos tempo de coleta
		  TempoColeta := StrtoInt(FormatDateTime('ss', Now)) + 3;
		END
		ELSE
		BEGIN
		  // caso ele não consiga, tentará enviar três vezes, se não conseguir volta para o passo Reconectar
		  IF (CountTentativasEnvioComando >= 3) THEN
			EstadoAtual := ESTADO_RECONECTAR;

		  // Adiciona 1 contador de tentativas
		  Inc(CountTentativasEnvioComando);
		END;
	  END;
  except
    on E: Exception do
    begin
      GerarLogTela('Erro estado enviar mensagem offline: ' + E.Message);
    end;
  end;  
END;

PROCEDURE TFormEasyInnerOnLine.PASSO_ESTADO_ENVIAR_CONFIGMUD_ONLINE_OFFLINE();
VAR
  _Teclado: Integer;
  _Leitor1: Integer;
  _Leitor2: Integer;
BEGIN
  try
	  WITH typInnersCadastrados[lngInnerAtual] DO
	  BEGIN
		// Configura a mudança automática
		// Habilita/Desabilita a mudança automática do modo OffLine do Inner para
		// OnLine e vice-versa.
		// Habilita a mudança Offline
		IF Pos('TCP', cboTipoConexao.Text) > 0 THEN
		  HabilitarMudancaOnLineOffLine(2, 10) // Habilita a mudança Offline
		ELSE
		  HabilitarMudancaOnLineOffLine(1, 10); // Habilita a mudança Offline

		// Configura o teclado para quando o Inner voltar para OnLine após uma queda
		// para OffLine.
		DefinirConfiguracaoTecladoOnLine(QtdDigitos, 0, 5, 17);

		// Define Mudanças OnLine
		// Função que configura BIT a BIT, Ver no manual Anexo III
		DefinirEntradasMudancaOnLine(ConfiguraEntradasMudancaOnLine(Inner));

		IF Teclado THEN
		  _Teclado := Opcao_SIM
		ELSE
		  _Teclado := Opcao_NAO;

		IF (Biometrico) THEN
		BEGIN
		  IF DoisLeitores THEN
			_Leitor2 := 3
		  ELSE
			_Leitor2 := 0;

		  // Configura entradas mudança OffLine com Biometria
		  DefinirEntradasMudancaOffLineComBiometria(_Teclado, 3, _Leitor2,
			Verificacao, Identificacao);
		END
		ELSE
		BEGIN
		  IF DoisLeitores THEN
		  BEGIN
			_Leitor1 := 1;
			_Leitor2 := 2;
		  END
		  ELSE
		  BEGIN
			_Leitor1 := 3;
			_Leitor2 := 0;
		  END;

		  // Configura entradas mudança OffLine
		  DefinirEntradasMudancaOffLine(_Teclado, _Leitor1, _Leitor2, 0);
		END;

		// Define mensagem de Alteração Online -> Offline.
		DefinirMensagemPadraoMudancaOffLine(1, ' Modo OffLine');

		// Define mensagem de Alteração OffLine -> OnLine.
		DefinirMensagemPadraoMudancaOnLine(1, ' Modo Online');

		// Envia Configurações.
		Ret := EnviarConfiguracoesMudancaAutomaticaOnLineOffLine(Numero);

		IF (Ret = RET_COMANDO_OK) THEN
		BEGIN

		  // Zera contador
		  CountTentativasEnvioComando := 0;
		  EstadoAtual := ESTADO_COLETAR_BILHETES;
		  TentativasColeta := 0;

		  // Adiciona 3 segundos tempo de coleta
		  TempoColeta := StrtoInt(FormatDateTime('ss', Now)) + 3;
		END
		ELSE
		BEGIN
		  // caso ele não consiga, tentará enviar três vezes, se não conseguir volta para o passo Reconectar
		  IF (CountTentativasEnvioComando >= 3) THEN
			EstadoAtual := ESTADO_RECONECTAR;

		  // Adiciona 1 contador de tentativas
		  Inc(CountTentativasEnvioComando);
		END;
	  END;
  except
    on E: Exception do
    begin
      GerarLogTela('Erro estado enviar config UD Online/Offline: ' + E.Message);
    end;
  end;  
END;

// ***********************************************************************************
// CFG_OFFLINE
// Configura modo Offline
// Próximo passo: ESTADO_COLETAR_BILHETES
// ***********************************************************************************
PROCEDURE TFormEasyInnerOnLine.PASSO_ESTADO_ENVIAR_CFG_OFFLINE();

BEGIN
  try
	  // Usa o Inner Atual na lista de Inners Cadastrados...
	  WITH typInnersCadastrados[lngInnerAtual] DO
	  BEGIN
		TRY
		  // Preenche os campos de configuração do Inner
		  MontaConfiguracaoInner(MODO_OFF_LINE);
		  Application.ProcessMessages;

		  // Envia o comando de configuração
		  Ret := EnviarConfiguracoes(Numero);

		  // Testa o retorno do envio das configurações Off Line
		  IF (Ret = RET_COMANDO_OK) THEN
		  BEGIN

			// Zera contador
			CountTentativasEnvioComando := 0;

			IF (chkLista.Checked) then
			BEGIN
			  EstadoAtual := ESTADO_ENVIAR_HORARIOS;
			END
			ELSE
			BEGIN
			  EstadoAtual := ESTADO_ENVIAR_MENSAGEM;
			END;
			if chkListaBio.Checked then
			Begin
			  Application.ProcessMessages;
			  // Para uma lista sem digital com mais de 250 usuários utilize
			  // IncluirUsuarioSemDigitalBioInnerAcesso(NumeroInner);
			  // com o ConfigurarBioVariavel(1) nas configurações para setar 16 digitos
			  // Chama rotina que monta o buffer de cartoes que nao irao precisar da digital
			  MontarBufferListaSemDigital(InnerNetAcesso);
			  if InnerNetAcesso then
			  Begin
				Ret := EnviarListaUsuariosSemDigitalBioVariavel(StrtoInt(txtNumInners.Text), StrToInt(txtNumDigitos.Text));
			  End
			  Else
			  Begin
				// Envia o buffer com a lista de usuarios sem digital
				Ret := EnviarListaUsuariosSemDigitalBio(StrtoInt(txtNumInners.Text));
			  End;
			End
			Else
			Begin
			  EstadoAtual := ESTADO_ENVIAR_MENSAGEM;
			End;

			// Adiciona 3 segundos tempo de coleta
			TempoColeta := StrtoInt(FormatDateTime('ss', Now)) + 3;
		  END
		  ELSE
		  BEGIN
			// caso ele não consiga, tentará enviar três vezes, se não conseguir volta para o passo Reconectar
			IF (CountTentativasEnvioComando >= 3) THEN
			  EstadoAtual := ESTADO_RECONECTAR;

			// Adiciona 1 contador de tentativas
			Inc(CountTentativasEnvioComando);
		  END;
		EXCEPT
		  EstadoAtual := ESTADO_CONECTAR;
		END;
	  END;
  except
    on E: Exception do
    begin
      GerarLogTela('Erro estado enviar CFG offline: ' + E.Message);
    end;
  end;
END;

PROCEDURE TFormEasyInnerOnLine.PASSO_ESTADO_ENVIAR_HORARIOS();
BEGIN
  try
	  // Usa o Inner Atual na lista de Inners Cadastrados...
	  WITH typInnersCadastrados[lngInnerAtual] DO
	  BEGIN

		// Define Lista e horários offline
		IF (Lista) THEN
		BEGIN
		  MontarHorarios();

		  // Define a Lista de verificação
		  if rdbPadraoTopdata.Checked then
			MontarListaTopdata
		  else if rdbPadraoLivre.Checked then
			MontarListaLivre;

		  EnviarListaAcesso(Numero);

		  // Define qual tipo de lista(controle) de acesso o Inner vai utilizar.
		  // Utilizar lista branca (cartões fora da lista tem o acesso negado).
		  DefinirTipoListaAcesso(1);
		END
		ELSE
		  // Não utilizar a lista de acesso.
		  DefinirTipoListaAcesso(0);

		IF (Ret = RET_COMANDO_OK) THEN
		BEGIN

		  // Zera contador
		  CountTentativasEnvioComando := 0;
		  EstadoAtual := ESTADO_ENVIAR_MENSAGEM;

		  // Adiciona 3 segundos tempo de coleta
		  TempoColeta := StrtoInt(FormatDateTime('ss', Now)) + 3;
		END
		ELSE
		BEGIN
		  // caso ele não consiga, tentará enviar três vezes, se não conseguir volta para o passo Reconectar
		  IF (CountTentativasEnvioComando >= 3) THEN
			EstadoAtual := ESTADO_RECONECTAR;

		  // Adiciona 1 contador de tentativas
		  Inc(CountTentativasEnvioComando);
		END;
	  END;
  except
    on E: Exception do
    begin
      GerarLogTela('Erro estado enviar horarios: ' + E.Message);
    end;  	  
  end;  	  
END;

// *********************************************************************************
// TEMPO_MENSAGEM
// Mantém a mensagem no display por 2 segundos.
// Próximo passo: ESTADO_ENVIAR_MSG_PADRAO
// ***********************************************************************************
PROCEDURE TFormEasyInnerOnLine.PASSO_AGUARDA_TEMPO_MENSAGEM();
VAR
  tempo: TDateTime;
BEGIN
  try
	  // Usa o Inner Atual na lista de Inners Cadastrados...
	  WITH typInnersCadastrados[lngInnerAtual] DO
	  BEGIN
		TRY
		  // Após passar os 2 segundos volta para o passo enviar mensagem padrão
		  tempo := Now - TempoInicialMensagem;
		  IF StrtoInt(FormatDateTime('ss', tempo)) >= 2 THEN
			EstadoAtual := ESTADO_ENVIAR_MSG_PADRAO;

		EXCEPT
		  EstadoAtual := ESTADO_CONECTAR;
		END;
	  END;
  except
    on E: Exception do
    begin
      GerarLogTela('Erro estado aguarda tempo mensagem: ' + E.Message);
    end;
  end;  
END;

// ***********************************************************************************
// COLETAR_BILHETES
// Efetua a coleta dos bilhetes no modo Off-line
// Próximo passo: ESTADO_ENVIAR_CFG_ONLINE
// ***********************************************************************************
PROCEDURE TFormEasyInnerOnLine.ReceberBilhetes();
VAR
  // Declaração variáveis
  Bilhetes: typeBilhete;
  tempo: LONGLONG;
  nBilhetes: Longint;
begin
  try
	  // Usa o Inner Atual na lista de Inners Cadastrados...
	  WITH typInnersCadastrados[lngInnerAtual] DO
	  BEGIN
		// Mensagem Status
	//    lblStatus.Caption := 'Inner ' + InttoStr(Numero) + ' Coletando bilhetes...';

		nBilhetes := 0;
		tempo := GetTickCount + 200;
		While (GetTickCount < tempo) do
		begin
		  With Bilhetes do
		  begin
			Ret := ColetarBilhete(Numero, @Bilhetes.Tipo, @Bilhetes.Dia,
			  @Bilhetes.Mes, @Bilhetes.Ano, @Bilhetes.Hora, @Bilhetes.Minuto,
			  Bilhetes.Cartao);
			Application.ProcessMessages;
			If (Ret = RET_COMANDO_OK) Then
			begin
			  // Armazena os dados do bilhete no list, pode ser utilizado com banco de dados ou outro
			  // meio de armazenamento compatível
			  GerarLogTela('Marcações Offline. Inner: ' + InttoStr(Numero)
				+ ' Tipo: ' + InttoStr(Bilhetes.Tipo) + ' Cartão: ' +
				(Bilhetes.Cartao) + ' Data: ' + FormatFloat('00', Bilhetes.Dia) +
				'/' + FormatFloat('00', Bilhetes.Mes) + '/' + FormatFloat('00',
				Bilhetes.Ano) + ' Hora: ' + FormatFloat('00', Bilhetes.Hora) + ':' +
				FormatFloat('00', Bilhetes.Minuto));
				nBilhetes := nBilhetes + 1;
			end;
		  end;
		end;
		TentativasColeta := TentativasColeta + 1;

		GerarLogTela(
		  Format('Catraca: %d - Foram coletados %d bilhete(s) offline.',
		  [lngInnerAtual + 1, nBilhetes])
		);

		// Mensagens de Status
	//    lblStatus.Caption := 'Foram coletados ' + InttoStr(nBilhetes) + ' bilhete(s) offline !';
	  end;
  except	  
    on E: Exception do
    begin
      GerarLogTela('Erro estado receber bilhetes: ' + E.Message);
    end;    
  end;    
end;

PROCEDURE TFormEasyInnerOnLine.PASSO_ESTADO_COLETAR_BILHETES();
BEGIN
  try
	  if (typInnersCadastrados[lngInnerAtual].InnerNetAcesso) then
		ReceberBilhetesInnerAcesso
	  else if (TentativasColeta > 3) then
		ReceberBilhetes
	  else
		typInnersCadastrados[lngInnerAtual].EstadoAtual := ESTADO_ENVIAR_CFG_ONLINE;
  except		
    on E: Exception do
    begin
      GerarLogTela('Erro estado coletar bilhetes: ' + E.Message);
    end;    	
  end;    	
END;

// ***********************************************************************************
// COLETAR BILHETES
// Esta rotina efetua a coleta de bilhetes que foram registrados em offline
// ***********************************************************************************
procedure TFormEasyInnerOnLine.ReceberBilhetesInnerAcesso;
var
  Bilhete: typeBilhete;
begin
  try
	  WITH typInnersCadastrados[lngInnerAtual] DO
	  BEGIN
		QtdeBilhetes := 0;
		ReceberQuantidadeBilhetes(Numero, @QtdeBilhetes);
		Application.ProcessMessages;

		TentativasColeta := TentativasColeta + 1;
		while (QtdeBilhetes > 0) do
		begin
		  If Not(QtdeBilhetes = 0) Then
		  begin
			While (QtdeBilhetes > 0) do
			begin
			  With Bilhete do
			  begin
	    		Ret := ColetarBilhete(Numero, @Bilhete.Tipo, @Bilhete.Dia,
				  @Bilhete.Mes, @Bilhete.Ano, @Bilhete.Hora, @Bilhete.Minuto,
				  Bilhete.Cartao);

   				If (Ret = RET_COMANDO_OK) Then
   				begin
   				  //Fim := Retornar_SegundosSys() + 15;
   				  //nBilhetes := nBilhetes + 1;
	    			  QtdeBilhetes := QtdeBilhetes - 1;

   				  // Armazena os dados do bilhete no list, pode ser utilizado com banco de dados ou outro
   				  // meio de armazenamento compatível
   				  GerarLogTela('Tipo: ' + InttoStr(Bilhete.Tipo) +
   					' Cartão: ' + Bilhete.Cartao + ' Data: ' +
   					Formata(InttoStr(Bilhete.Dia)) + '/' +
   					Formata(InttoStr(Bilhete.Mes)) + '/' +
   					Formata(InttoStr(Bilhete.Ano)) + ' Hora: ' +
   					Formata(InttoStr(Bilhete.Hora)) + ':' +
   					Formata(InttoStr(Bilhete.Minuto)) +
	    				' - Qtd. Bilhetes: ' + IntToStr(QtdeBilhetes)
   					);
				  end;
			  end;
			end;
			ReceberQuantidadeBilhetes(Numero, @QtdeBilhetes);
		  end;
		end;
		typInnersCadastrados[lngInnerAtual].EstadoAtual := ESTADO_ENVIAR_CFG_ONLINE;
	  end;
  except	  
    on E: Exception do
    begin
      GerarLogTela('Erro estado receber inners acesso: ' + E.Message);
    end;      
  end;      
end;

function TFormEasyInnerOnLine.SaveCartao(const Inner: Integer; const Cartao: AnsiString): TCartao;
begin
  Result := nil;

  try 
	   Result := FindCartao(Inner);

     if (Result = nil) then
     begin
       GerarLogTela('Não foi possível buscar um cartão - Catão: ' + Cartao);
     end
     else
     begin
  	   Result.FTipoPassagem := taNone;
  	   Result.FCartao := Cartao;
       Result.FConnection := DM.FindConnection(Cartao);
     end;
  except
    on E: Exception do
    begin
      GerarLogTela('Erro salvar cartão: ' + E.Message);
    end;       
  end;       
end;

// ***********************************************************************************
// CFG_ONLINE
// Configura modo On-line
// Próximo passo: ESTADO_ENVIAR_DATA_HORA
// ***********************************************************************************
PROCEDURE TFormEasyInnerOnLine.PASSO_ESTADO_ENVIAR_CFG_ONLINE();
VAR
  Ret: Integer;
BEGIN
  try
	  // Usa o Inner Atual na lista de Inners Cadastrados...
	  WITH typInnersCadastrados[lngInnerAtual] DO
	  BEGIN
		TRY
		  // Monta configuração modo Online
		  MontaConfiguracaoInner(MODO_ON_LINE);
		  Application.ProcessMessages;

		  // Envia as configurações ao Inner Atual.
		  Ret := EnviarConfiguracoes(Numero);
		  IF (Ret = RET_COMANDO_OK) THEN
		  BEGIN
			// caso consiga enviar as configurações, passa para o passo Enviar Data Hora
			CountTentativasEnvioComando := 0;
			EstadoAtual := ESTADO_ENVIAR_DATA_HORA;
		  END
		  ELSE
		  BEGIN
			// caso ele não consiga, tentará enviar três vezes, se não conseguir volta para o passo Reconectar
			IF (CountTentativasEnvioComando >= 3) THEN
			  EstadoAtual := ESTADO_RECONECTAR;

			// Adiciona 1 ao contador de tentativas
			Inc(CountTentativasEnvioComando);
		  END;

		EXCEPT
		  EstadoAtual := ESTADO_CONECTAR;
		END;
	  END;
  except	  
    on E: Exception do
    begin
      GerarLogTela('Erro estado enviar cfg online: ' + E.Message);
    end;    
  end;    
END;

// ***********************************************************************************
// DATA_HORA
// Envia ao Inner data e hora atual
// Próximo passo: ESTADO_ENVIAR_MSG_PADRAO
// ***********************************************************************************
PROCEDURE TFormEasyInnerOnLine.PASSO_ESTADO_ENVIAR_DATA_HORA();
VAR
  Ret: Integer;
BEGIN
  try
	  // Usa o Inner Atual na lista de Inners Cadastrados...
	  WITH typInnersCadastrados[lngInnerAtual] DO
	  BEGIN

		TRY
		  // Exibe estado do Inner no Rodapé da Janela
		  //lblStatus.Caption := 'Inner ' + InttoStr(Numero) +  ' Enviando data e hora...';
		  //Application.ProcessMessages;

		  // Envia Comando de Relógio ao Inner Atual..
		  Ret := EnviarRelogio(Numero, StrtoInt(FormatDateTime('dd', Now)),
			StrtoInt(FormatDateTime('mm', Now)), StrtoInt(FormatDateTime('yy', Now)
			), StrtoInt(FormatDateTime('hh', Now)),
			StrtoInt(FormatDateTime('nn', Now)),
			StrtoInt(FormatDateTime('ss', Now)));

		  // Testa o Retorno do comando de Envio de Relógio..
		  IF (Ret = RET_COMANDO_OK) THEN
		  BEGIN
			// Vai para o passo de Envio de Msg Padrão..
			CountTentativasEnvioComando := 0;
			EstadoAtual := ESTADO_ENVIAR_MSG_PADRAO;
		  END
		  ELSE
		  BEGIN
			// caso ele não consiga, tentará enviar três vezes, se não conseguir volta para o passo Reconectar
			IF (CountTentativasEnvioComando >= 3) THEN
			  EstadoAtual := ESTADO_RECONECTAR;

			// Adiciona 1 ao contador de tentativas
			Inc(CountTentativasEnvioComando);
		  END;
		EXCEPT
		  EstadoAtual := ESTADO_CONECTAR;
		END;
	  END;
  except	  
  on E: Exception do
    begin
      GerarLogTela('Erro estado enviar data/hora: ' + E.Message);
    end;    	  
  end;    	  
END;

// ***********************************************************************************
// MSG_URNA
// Envia mensagem padrão estado Urna
// Próximo passo: ESTADO_MONITORA_URNA
// ***********************************************************************************
PROCEDURE TFormEasyInnerOnLine.PASSO_ESTADO_ENVIA_MSG_URNA();
begin
  try
	  // Usa o Inner Atual na lista de Inners Cadastrados...
	  WITH typInnersCadastrados[lngInnerAtual] DO
	  BEGIN

		// Enviar mensagem padrão Urna
		If (EnviarMensagemPadraoOnLine(Numero, 0, ' DEPOSITE O        CARTAO')
		  = RET_COMANDO_OK) Then
		begin
		  AcionarRele2(Numero);
		  CountTentativasEnvioComando := 0;
		  EstadoAtual := ESTADO_MONITORA_URNA;
		end
		Else
		begin
		  // Caso ele não consiga, tentará enviar três vezes, se não conseguir volta para o passo Reconectar
		  If (CountTentativasEnvioComando >= 3) Then
			EstadoAtual := ESTADO_RECONECTAR;

		  // Adiciona 1 ao contador de tentativas
		  CountTentativasEnvioComando := CountTentativasEnvioComando + 1;
		end;
	  END;
  except	  
    on E: Exception do
    begin
      GerarLogTela('Erro estado enviar mensagem urna: ' + E.Message);
    end;    	  
  end;    	  
End;

// ***********************************************************************************
// MONITORA_URNA
// Monitora o depósito do cartão na Urna
// Próximo passo: ESTADO_LIBERAR_CATRACA
// ***********************************************************************************
PROCEDURE TFormEasyInnerOnLine.PASSO_ESTADO_MONITORA_URNA();
var
  tempo: TDateTime;
  Bilhete: TBilhete;
  Cartao: TCartao;
begin
  try
	  // Usa o Inner Atual na lista de Inners Cadastrados...
	  WITH typInnersCadastrados[lngInnerAtual] DO
	  BEGIN
		// Exibe estado do giro
	//    lblDados.Caption := 'Monitorando Giro de Catraca!';

		// Exibe estado do Inner no Rodapé da Janela
	//    lblStatus.Caption := 'Inner ' + InttoStr(Numero) + ' Monitora Giro da Catraca...';

		// Declaração de Variáveis..
		Bilhete := TBilhete.Create;
		Bilhete.Origem := 0;
		Bilhete.Complemento := 0;
		Bilhete.Dia := 0;
		Bilhete.Mes := 0;
		Bilhete.Ano := 0;
		Bilhete.Hora := 0;
		Bilhete.Minuto := 0;
		Bilhete.Segundo := 0;
		Bilhete.Cartao := '';

		// Monitora o giro da catraca..
		Ret := ReceberDadosOnLine(Numero, @Bilhete.Origem, @Bilhete.Complemento,
		  @Bilhete.Cartao, @Bilhete.Dia, @Bilhete.Mes, @Bilhete.Ano, @Bilhete.Hora,
		  @Bilhete.Minuto, @Bilhete.Segundo);

		Cartao := FindCartao(Numero);

		// Testa o retorno do comando..
		If (Ret = RET_COMANDO_OK) Then
		begin
		  // Testa se a urna recolheu o cartão
		  If (Bilhete.Origem = Origem_URNA) Then
		  begin
	//        lblDados.Caption := 'URNA RECOLHEU CARTÃO';
			// Vai para o estado de Envio de Msg Padrão..
			Cartao.FTipoPassagem := taEntrada;
			EstadoAtual := ESTADO_LIBERAR_CATRACA;
		  end
		  Else
			// Se não depositou o cartão mostra mensagem e bloqueia o acesso
			If (Bilhete.Origem = Origem_FIM_DE_TEMPO_DE_ACIONAMENTO) Then
			begin
	//          lblDados.Caption := 'NÃO DEPOSITOU CARTÃO';
			  // AcionarBipLongo (InnerAtual.Numero);
			  EnviarMensagemPadraoOnLine(Numero, 0, '     ACESSO          NEGADO');

			  // Vai para o estado de Envio de Msg Padrão..
			  TempoInicialMensagem := Now;
			  EstadoAtual := AGUARDA_TEMPO_MENSAGEM;
			end
		  Else
			// Se Urna cheia
			If(Bilhete.Origem = Origem_URNA_CHEIA) Then
			begin
	//           lblDados.Caption := 'URNA CHEIA';
			   AcionarBipLongo (Numero);
			   EnviarMensagemPadraoOnLine(Numero, 0, '   URNA CHEIA    ESVAZIAR URNA');

			   // Vai para o estado de Envio de Msg Padrão..
			   TempoInicialMensagem := Now;
			   EstadoAtual := AGUARDA_TEMPO_MENSAGEM;


			end;
		End
		Else
		begin
		  // Caso o tempo que estiver monitorando o giro chegue a 3 segundos,
		  // deverá enviar o ping on line para manter o equipamento em modo on line
		  tempo := Now - TempoInicialPingOnLine;
		  If StrtoInt(FormatDateTime('ss', tempo)) >= 3 then
		  begin
			EstadoSolicitacaoPingOnLine := EstadoAtual;
			CountTentativasEnvioComando := 0;
			TempoInicialPingOnLine := Now;
			EstadoAtual := PING_ONLINE;
		  end;
		End;
	  END;
  except	  
    on E: Exception do
    begin
      GerarLogTela('Erro estado monitorar urna: ' + E.Message);
    end;    	  
  end;    	  
End;

// ***********************************************************************************
// MENSAGEM_PADRAO
// Envia mensagem padrão modo Online
// Próximo passo: ESTADO_CONFIGURAR_ENTRADAS_ONLINE
// ***********************************************************************************
PROCEDURE TFormEasyInnerOnLine.PASSO_ESTADO_ENVIAR_MSG_PADRAO();
VAR
  Ret: Integer;
BEGIN
  try
	  // Usa o Inner Atual na lista de Inners Cadastrados...
	  WITH typInnersCadastrados[lngInnerAtual] DO
	  BEGIN 
		TRY
		  // Exibe estado do Inner no Rodapé da Janela
	//      lblStatus.Caption := 'Inner ' + InttoStr(Numero) + ' Enviando Mensagem Padrão...';
		  //Application.ProcessMessages;

		  // Envia comando definindo a mensagem Padrão Online para o Inner.
		  Ret := EnviarMensagemPadraoOnLine(Numero, Opcao_SIM, 'Modo Online');

		  // Testa o retorno da mensagem enviada..
		  IF (Ret = RET_COMANDO_OK) THEN
		  BEGIN
			// Muda o passo para configuração de entradas Online.
			CountTentativasEnvioComando := 0;
			EstadoAtual := ESTADO_CONFIGURAR_ENTRADAS_ONLINE;
		  END
		  ELSE
		  BEGIN
			// caso ele não consiga, tentará enviar três vezes, se não conseguir volta para o passo Reconectar
			IF (CountTentativasEnvioComando >= 3) THEN
			  EstadoAtual := ESTADO_RECONECTAR;

			// Adiciona 1 ao contador de tentativas
			Inc(CountTentativasEnvioComando);
		  END;
		EXCEPT
		  EstadoAtual := ESTADO_CONECTAR;
		END;
	  END;
  except	  
    on E: Exception do
    begin
      GerarLogTela('Erro estado enviar mensagem padrão: ' + E.Message);
    end;
  end;    	  
END;

// ***********************************************************************************
// CONFIGURAR_ENTRADAS_ONLINE
// Preparação configuração online para entrar em modo Polling
// Próximo passo: ESTADO_POLLING
// ***********************************************************************************
PROCEDURE TFormEasyInnerOnLine.PASSO_ESTADO_CONFIGURAR_ENTRADAS_ONLINE();
VAR
  Ret: Integer;
  ValorDecimal: Integer;
BEGIN
  try
	  // Usa o Inner Atual na lista de Inners Cadastrados...
	  WITH typInnersCadastrados[lngInnerAtual] DO
	  BEGIN

		TRY
		  // Exibe estado do Inner no Rodapé da Janela
	//      lblStatus.Caption := 'Inner ' + InttoStr(Numero) + ' Configurando Entradas Online...';
	//      Application.ProcessMessages;

		  // Converte Binário para Decimal
		  ValorDecimal := ConfiguraEntradasMudancaOnLine(Inner);
		  // Ver no manual Anexo III

		  Ret := EnviarFormasEntradasOnLine(Numero, // Numero do Inner..
			QtdDigitos, // Qtd Digitos Teclado..
			1, // Eco do Teclado no Display..
			ValorDecimal,
			// Valor decimal resultante da conversão Binário para Decimal
			15, // Tempo teclado..
			17); // Posição do Cursor no Teclado..

		  // Testa o retorno do comando..
		  IF (Ret = RET_COMANDO_OK) THEN
		  BEGIN
			// Vai para o Estado De Polling.
			TempoInicialPingOnLine := Now;
			CountTentativasEnvioComando := 0;
			EstadoAtual := ESTADO_POLLING;

			// Se catraca
			IF Catraca THEN
			BEGIN
			  cmdEntrada.Caption := 'Entrada';
			  cmdSaida.Caption := 'Saida';
			  cmdEntrada.Enabled := true;
			  cmdSaida.Enabled := true;
			END
			ELSE
			BEGIN
			  cmdEntrada.Caption := 'Porta 1';
			  cmdSaida.Caption := 'Porta 2';
			  cmdEntrada.Enabled := true;
			  cmdSaida.Enabled := true;
			END;
		  END
		  ELSE
		  BEGIN
			// caso ele não consiga, tentará enviar três vezes, se não conseguir volta para o passo Reconectar
			IF (CountTentativasEnvioComando >= 3) THEN
			  EstadoAtual := ESTADO_RECONECTAR;

			// Adiciona 1 ao contador de tentativas
			Inc(CountTentativasEnvioComando);
		  END;
		EXCEPT
		  EstadoAtual := ESTADO_CONECTAR;
		END;
	  END;
  except
    on E: Exception do
    begin
      GerarLogTela('Erro estado configurar entradas online:' + E.Message);
    end;
  end;
END;

// ***********************************************************************************
// MaximoNumeroTentativas
// Verifica se a quantidade máxima de tentativas de um envio de comando
// Ocorreu, caso tenha ocorrido retorna TRUE, senão FALSE..
// ***********************************************************************************
FUNCTION TFormEasyInnerOnLine.MaximoNumeroTentativas: Boolean;
BEGIN
  try
	  // Incrementa o número de tentativas..
	  intTentativas := intTentativas + 1;

	  // Verifica se o número de tentativas é maior do que 3..
	  // MAXIMO_TENTATIVAS_COMUNICACAO
	  if (intTentativas > 3) then
		MaximoNumeroTentativas := true // Retorna TRUE
	  else
		MaximoNumeroTentativas := False; // Retorna FALSE
  except
    on E: Exception do
    begin
      GerarLogTela('Erro verificar número máximo tentativas' + E.Message);
    end;
  end;
END;

// ***********************************************************************************
// DEFINICAO_TECLADO
// Mostra mensagem para que seja informado se é entrada ou saída
// Este estado configura a mensagem padrão que será exibida no dispositivo em seu
// funcionamento Online utilizando o método EnviarMensagemPadraoOnline.
// O passo posterior a este estado é o passo de configuração de entradas online,
// ou em caso de erro pode retornar para o estado de conexão após alcançar o
// número máximo de tentativas.
// Próximo passo: ESTADO_POLLING
// ******************************************************************************
PROCEDURE TFormEasyInnerOnLine.PASSO_ESTADO_DEFINICAO_TECLADO();
BEGIN
  try
	  // Usa o Inner Atual na lista de Inners Cadastrados...
	  WITH typInnersCadastrados[lngInnerAtual] DO
	  BEGIN

		// Envia mensagem Padrão Online..
		Ret := EnviarMensagemPadraoOnLine(Numero, 0, 'ENTRADA OU SAIDA?');
		Ret := EnviarFormasEntradasOnLine(Numero, 0,
		  // Quantidade de Digitos do Teclado.. (Não aceita digitação numérica)
		  0, // 0 – não ecoa
		  EntradasON_ACEITA_TECLADO, 10, // Tempo de entrada do Teclado (10s).
		  32); // Posição do Cursor (32 fica fora..)

		// Se Retorno OK, vai para proximo estado..
		if (Ret = RET_COMANDO_OK) then
		begin
		  intTentativas := 0;
		  EstadoTeclado := AGUARDANDO_TECLADO;
		  EstadoAtual := ESTADO_AGUARDAR_DEFINICAO_TECLADO;
		end
		else
		begin // Caso o retorno não for OK, tenta novamente até 3x..
		  if (MaximoNumeroTentativas = true) THEN
		  BEGIN
			EstadoAtual := ESTADO_CONECTAR;
		  end;
		end;
	  END;
  except
    on E: Exception do
    begin
      GerarLogTela('Erro estado definir teclado: ' + E.Message);
    end;
  end;	  
END;

PROCEDURE TFormEasyInnerOnLine.PASSO_ESTADO_AGUARDAR_DEFINICAO_TECLADO();
var
  Ret: Integer;
  Bilhetes: TBilhete;
  tempo: TDateTime;
BEGIN
  try
	  // Usa o Inner Atual na lista de Inners Cadastrados...
	  WITH typInnersCadastrados[lngInnerAtual] DO
	  BEGIN

		Bilhetes := nil;
		TRY
		  // Exibe estado do Inner no Rodapé da Janela
	//      lblStatus.Caption := 'Inner ' + InttoStr(Numero) + ' Estado Aguardar Definição Teclado';
	//      Application.ProcessMessages;

		  Bilhetes := TBilhete.Create;
		  Bilhetes.Origem := 0;
		  Bilhetes.Complemento := 0;
		  Bilhetes.Dia := 0;
		  Bilhetes.Mes := 0;
		  Bilhetes.Ano := 0;
		  Bilhetes.Hora := 0;
		  Bilhetes.Minuto := 0;
		  Bilhetes.Segundo := 0;

		  // Envia o Comando Receber Dados Online..
		  Ret := ReceberDadosOnLine(Numero, @Bilhetes.Origem, @Bilhetes.Complemento,
			@Bilhetes.Cartao, @Bilhetes.Dia, @Bilhetes.Mes, @Bilhetes.Ano,
			@Bilhetes.Hora, @Bilhetes.Minuto, @Bilhetes.Segundo);

		  // Atribui Temporizador
		  Temporizador := Now;

		  IF (Ret = RET_COMANDO_OK) THEN
		  BEGIN
			If (Bilhetes.Complemento = 66) then
			Begin
			  AcionarBipCurto(Numero);
			  HABILITA_LADO_CATRACA('Entrada');
			  EstadoAtual := ESTADO_LIBERAR_CATRACA;
			end
			Else if (Bilhetes.Complemento = 67) then
			Begin
			  AcionarBipCurto(Numero);
			  HABILITA_LADO_CATRACA('Saida');
			  EstadoAtual := ESTADO_LIBERAR_CATRACA;
			end
			Else if (Bilhetes.Complemento = 42) then
			Begin
			  CountTentativasEnvioComando := 0;
			  EstadoAtual := ESTADO_ENVIAR_MSG_PADRAO;
			end
			Else if (Bilhetes.Complemento = 35) then
			Begin
			  AcionarBipCurto(Numero);
			  EnviarMensagemPadraoOnLine(Numero, 0, 'LIBERADO DOIS SENTIDOS');
			  EstadoAtual := ESTADO_LIBERAR_CATRACA;
			end
			Else if (Bilhetes.Complemento = 65) then
			Begin
			  EstadoAtual := ESTADO_DEFINICAO_TECLADO;
			END;
			EstadoTeclado := TECLADO_EM_BRANCO
		  end
		  Else
		  Begin
			// Se passar 3 segundos sem receber nada, passa para o estado enviar ping on line, para manter o equipamento em on line.
			tempo := Now - TempoInicialPingOnLine;
			IF StrtoInt(FormatDateTime('ss', tempo)) >= 3 THEN
			BEGIN
			  EstadoSolicitacaoPingOnLine := EstadoAtual;
			  CountTentativasEnvioComando := 0;
			  TempoInicialPingOnLine := Now;
			  EstadoAtual := PING_ONLINE;
			END;
		  END;
		  Bilhetes.Destroy;
		EXCEPT
		  if not(Bilhetes = nil) then
			Bilhetes.Destroy;

		  EstadoAtual := ESTADO_CONECTAR;
		END;
	  END;
  except
    on E: Exception do
    begin
      GerarLogTela('Erro estado aguardar definição teclado: ' + E.Message);
    end;
  end;	  
END;

// ***********************************************************************************
// HABILITA_LADO_CATRACA
// De acordo com o que foi informado (Esquerda ou Direita)
// ***********************************************************************************
PROCEDURE TFormEasyInnerOnLine.HABILITA_LADO_CATRACA(lado: string);
var
   Cartao: TCartao;
BEGIN
	  try
	   Cartao := FindCartao(typInnersCadastrados[lngInnerAtual].Numero);

	  if (lado = 'Entrada') then
	  begin
		// entrada
		if (optDireita.Checked) Then
		begin
		  Cartao.FTipoPassagem := taEntrada;
		end
		else
		begin
		  Cartao.FTipoPassagem := taEntradaInvertida;
		end;
	  end;

	  if (lado = 'Saida') then
	  begin
		// saída
		if (optDireita.Checked) Then
		begin
		  Cartao.FTipoPassagem := taSaida;
		end
		else
		begin
		  Cartao.FTipoPassagem := taSaidaInvertida;
		end;
	  end;
  except
    on E: Exception do
    begin
      GerarLogTela('Erro ao habilitar lado catraca:' + E.Message);
    end;
  end;	  
END;

// ***********************************************************************************
// POLLING
// É onde funciona todo o processo do modo online
// Passagem de cartão, catraca, urna, mensagens...
// ***********************************************************************************
PROCEDURE TFormEasyInnerOnLine.PASSO_ESTADO_POLLING();
const
   SLogCartaLidoFmt = 'Inner: %d, Cartão: %s';
VAR
  Ret: Integer;
  Count: Integer;
  Bilhetes: TBilhete;
  strCartao: String;
  tempo: TDateTime;
  NumCartao: String;
  Bilhete: String;
  TipoAcesso: TTipoAcesso;
  Cartao: TCartao;
BEGIN
  try
	  // Usa o Inner Atual na lista de Inners Cadastrados...
	  WITH typInnersCadastrados[lngInnerAtual] DO
	  BEGIN

		Bilhetes := nil;
		TRY
		  // Exibe estado do Inner no Rodapé da Janela
	//      lblStatus.Caption := 'Inner ' + InttoStr(Numero) + ' Estado de Polling...';
	//      Application.ProcessMessages;

		  Bilhetes := TBilhete.Create;
		  Bilhetes.Origem := 0;
		  Bilhetes.Complemento := 0;
		  Bilhetes.Dia := 0;
		  Bilhetes.Mes := 0;
		  Bilhetes.Ano := 0;
		  Bilhetes.Hora := 0;
		  Bilhetes.Minuto := 0;
		  Bilhetes.Segundo := 0;
		  Bilhetes.Cartao := '';

		  // Envia o Comando Receber Dados Online..
		  Ret := ReceberDadosOnLine(Numero, @Bilhetes.Origem, @Bilhetes.Complemento,
			@Bilhetes.Cartao, @Bilhetes.Dia, @Bilhetes.Mes, @Bilhetes.Ano,
			@Bilhetes.Hora, @Bilhetes.Minuto, @Bilhetes.Segundo);

		  // Atribui Temporizador
		  Temporizador := Now;

		  // Testa o Retorno do Comando..
		  IF (Ret = RET_COMANDO_OK) THEN
		  BEGIN
			// Teste se a origem é Fim de Acionamento, Função, Anula ou Giro de Catraca..
			// Caso seja alguma destas origens, retorna para a maquina de estados.
			IF ((Bilhetes.Complemento = Origem_FIM_DE_TEMPO_DE_ACIONAMENTO) OR
			  (Bilhetes.Complemento = Origem_GIRO_DA_CATRACA_TOPDATA) OR
			  (Bilhetes.Complemento = Complemento_TECLA_FUNCAO) OR
			  (Bilhetes.Complemento = Complemento_ANULA_VIA_TECLADO) OR
			  ((Bilhetes.Cartao = '') and
			  not(EstadoTeclado = AGUARDANDO_TECLADO))) THEN
			BEGIN
			  // Zera contador de tentativas
			  CountTentativasEnvioComando := 0;
			  EstadoAtual := ESTADO_ENVIAR_MSG_PADRAO;
			  Bilhetes.Destroy;
			  Exit;
			END;

			// Validar os dados aqui
			strCartao := '';
			FOR Count := 0 TO Length(Bilhetes.Cartao) DO
			BEGIN
			  strCartao := strCartao + Bilhetes.Cartao[Count];
			END;

			// Se o cartão padrão for topdata, configura os dígitos do cartão como padrão topdata
			NumCartao := '';
			If (rdbPadraoTopdata.Checked) Then
			begin
			  // Padrão Topdata --> Cartão Topdata deve ter sempre 14 dígitos.
			  // 5 dígitos
			  NumCartao := Copy(Bilhetes.Cartao, 13, 1);
			  NumCartao := NumCartao + Copy(Bilhetes.Cartao, 4, 4);
			end
			Else
			  // Padrão Livre
			  NumCartao := Bilhetes.Cartao;

			Cartao := SaveCartao(Numero, NumCartao);

			Bilhete := 'Marcações Online. Inner: ' + InttoStr(Numero) + ' ' +
			  'Origem: ' + InttoStr(Bilhetes.Origem) + ' ' + 'Complemento: ' +
			  InttoStr(Bilhetes.Complemento) + ' Cartão: ' + NumCartao;

			// Se Quantidade de dígitos informado for maior que 14 não deve mostrar data e hora
			if (QtdDigitos <= 14) then
			begin
			  Bilhete := Bilhete + ' Data: ' + FormatFloat('00', Bilhetes.Dia) + '/'
				+ FormatFloat('00', Bilhetes.Mes) + '/' +
				FormatFloat('00', Bilhetes.Ano) + ' Hora: ' +
				FormatFloat('00', Bilhetes.Hora) + ':' +
				FormatFloat('00', Bilhetes.Minuto) + ':' +
				FormatFloat('00', Bilhetes.Segundo);
			end;

			// Adiciona bilhete coletado na Lista
			GerarLogTela(Bilhete);

			TipoAcesso := taNenhum;
			if (DM.db.Connected) then begin
        if (Cartao <> nil) then
        begin
  			  TipoAcesso := DM.GetTipoAcesso(Cartao.FCartao, Cartao.FConnection);
          //GerarLogTela('Acesso: ' + IntToStr(Ord(TipoAcesso)));
        end;
			end
			else
			begin
			  inc(countErroConexao);
			  // Adiciona bilhete coletado na Lista
			  GerarLogTela('Conexão perdida com o banco de dados');

			  if (countErroConexao >= 10) then
			  begin
  				lstBilhetes.Items.Add('Parando aplicação depois de 10 tentativas de reconectar');
				  countErroConexao := 0;
				  ShowMessage('Aplicação perdeu a conexão com o banco de dados. Por gentileza reinicie a aplicação');
				  abort;
			  end;
			end;

			if TipoAcesso in [taNenhum, taEntradaBloqueada, taSaidaBloqueada] then
			Begin
			  EstadoAtual := ESTADO_ENVIAR_MSG_ACESSO_NEGADO;
			end
			// Se 1 leitor
			// E Urna ou entrada e saída ou liberada 2 sentidos ou sentido giro
			// E cartão = proximidade
			else If ((chkDoisLeitores.Checked = False) And
			  ((cboEquipamento.ItemIndex = Acionamento_Catraca_Urna) or
			  (cboEquipamento.ItemIndex = Acionamento_Catraca_Entrada_E_Saida) Or
			  (cboEquipamento.ItemIndex = Acionamento_Catraca_Liberada_2_Sentidos)
			  Or (cboEquipamento.ItemIndex = Acionamento_Catraca_Sentido_Giro)) And
			  ((cboTipoLeitor.ItemIndex = 2) Or (cboTipoLeitor.ItemIndex = 3) Or
			  (cboTipoLeitor.ItemIndex = 4))) then
			begin
			  if (EstadoTeclado = TECLADO_EM_BRANCO) then
			  begin
				// Apresenta mensagem para informa se é entrada ou saída
				EstadoAtual := ESTADO_DEFINICAO_TECLADO;
			  end;

			  if ((Catraca) And
				(cboEquipamento.ItemIndex = Acionamento_Catraca_Urna)) Then
			  begin
				EstadoAtual := ESTADO_ENVIA_MSG_URNA
			  end;
			end
			else
			begin
			  IF (Catraca) THEN
			  begin
				if (cboEquipamento.ItemIndex = Acionamento_Catraca_Entrada) and
				   (TipoAcesso = taEntradaLiberada) then
				begin
				  HABILITA_LADO_CATRACA('Entrada');
				  EstadoAtual := ESTADO_LIBERAR_CATRACA;
				end
				else if (cboEquipamento.ItemIndex = Acionamento_Catraca_Saida) and
				   (TipoAcesso = taSaidaLiberada) then
				begin
				  HABILITA_LADO_CATRACA('Saida');
				  EstadoAtual := ESTADO_LIBERAR_CATRACA;
				end
				// Se Urna e 2 leitores
				else If ((cboEquipamento.ItemIndex = Acionamento_Catraca_Urna) And
				  (Bilhetes.Origem = Origem_VIA_LEITOR2)) Then
				begin
				  EstadoAtual := ESTADO_ENVIA_MSG_URNA
				end
				Else if (TipoAcesso in [taEntradaLiberada, taSaidaLiberada]) then
				begin
				   if TipoAcesso = taEntradaLiberada then
				   begin
					  HABILITA_LADO_CATRACA('Entrada');
				   end;

				   if TipoAcesso = taSaidaLiberada then
				   begin
					  HABILITA_LADO_CATRACA('Saida');
				   end;

				   EstadoAtual := ESTADO_LIBERAR_CATRACA;
				END;
			  end
			  ELSE if (TipoAcesso in [taEntradaLiberada, taSaidaLiberada]) then
			  BEGIN
				// Aciona Bip Curto..
				AcionarBipCurto(Numero);

				// Desliga Led Verde
				LigarBackLite(Numero);
				TempoInicialMensagem := Now;
				CountTentativasEnvioComando := 0;
				EnviarMensagemPadraoOnLine(typInnersCadastrados[lngInnerAtual]
				  .Numero, 0, 'Acesso Liberado!!');
				EstadoAtual := AGUARDA_TEMPO_MENSAGEM;
			  END;

			  // Mensagem padrão
			  // EnviarMensagemPadraoOnLine(Numero, 0, 'Acesso Liberado!');
			end;
		  END
		  ELSE
		  BEGIN
			// Se passar 3 segundos sem receber nada, passa para o estado enviar ping on line, para manter o equipamento em on line.
			tempo := Now - TempoInicialPingOnLine;
			IF StrtoInt(FormatDateTime('ss', tempo)) >= 3 THEN
			BEGIN
			  EstadoSolicitacaoPingOnLine := EstadoAtual;
			  CountTentativasEnvioComando := 0;
			  TempoInicialPingOnLine := Now;
			  EstadoAtual := PING_ONLINE;
			END;
		  END;
		  Bilhetes.Destroy;
		EXCEPT
		  if not(Bilhetes = nil) then
			Bilhetes.Destroy;

		  EstadoAtual := ESTADO_CONECTAR;
		END;
	  END;
  except
    on E: Exception do
    begin
      GerarLogTela('Erro estado pull config: ' + E.Message);
    end;
  end;	  
END;

// ***********************************************************************************
// LIBERA_GIRO_CATRACA
// Libera a catraca de acordo com o lado informado
// Próximo Passo: ESTADO_MONITORA_GIRO_CATRACA
// ***********************************************************************************
PROCEDURE TFormEasyInnerOnLine.PASSO_LIBERA_GIRO_CATRACA();
const
   SLogLiberouFmt = 'Inner: %d, Cartão: %s, Operação: %d';
VAR
  Ret: Integer;
   Cartao: TCartao;
BEGIN
  try
	  // Usa o Inner Atual na lista de Inners Cadastrados...
	  WITH typInnersCadastrados[lngInnerAtual] DO
	  BEGIN

		TRY
		  // Exibe estado do Inner no Rodapé da Janela
	//      lblStatus.Caption := 'Inner ' + InttoStr(Numero) + ' Libera Giro da Catraca...';
	//      Application.ProcessMessages;

		  Cartao := FindCartao(Numero);

		  // Envia comando de liberar a catraca para Entrada.
		  If (Cartao.FTipoPassagem = taEntrada) Then
		  begin
			EnviarMensagemPadraoOnLine(Numero, 0,
			  '                ENTRADA LIBERADA');
			Cartao.FTipoPassagem := taNone;
			Ret := LiberarCatracaEntrada(Numero);
		  end
		  else if (Cartao.FTipoPassagem = taEntradaInvertida) then
		  begin
			EnviarMensagemPadraoOnLine(Numero, 0,
			  '                ENTRADA LIBERADA');
			Cartao.FTipoPassagem := taNone;
			Ret := LiberarCatracaEntradaInvertida(Numero);
		  end
		  else if (Cartao.FTipoPassagem = taSaida) then
		  begin
			EnviarMensagemPadraoOnLine(Numero, 0,
			  '                 SAIDA LIBERADA');
			Cartao.FTipoPassagem := taNone;
			Ret := LiberarCatracaSaida(Numero);
		  end
		  else if (Cartao.FTipoPassagem = taSaidaInvertida) Then
		  begin
			EnviarMensagemPadraoOnLine(Numero, 0,
			  '                 SAIDA LIBERADA');
			Cartao.FTipoPassagem := taNone;
			Ret := LiberarCatracaSaidaInvertida(Numero);
		  end
		  Else
		  begin
			EnviarMensagemPadraoOnLine(Numero, 0, 'LIBERADO DOIS SENTIDOS');
			Ret := LiberarCatracaDoisSentidos(Numero);
		  end;

		  // Testa Retorno do comando..
		  IF (Ret = RET_COMANDO_OK) THEN
		  BEGIN
			AcionarBipCurto(Numero);
			CountPingFail := 0;
			CountTentativasEnvioComando := 0;
			TempoInicialPingOnLine := Now;
			EstadoAtual := ESTADO_MONITORA_GIRO_CATRACA;
		  END
		  ELSE
		  BEGIN
			// Se o retorno for diferente de 0 tenta liberar a catraca 3 vezes, caso não consiga enviar o comando volta para o passo reconectar.
			IF (CountTentativasEnvioComando >= 3) THEN
			BEGIN
			  CountTentativasEnvioComando := 0;
			  EstadoAtual := ESTADO_RECONECTAR;
			END;

			// Adiciona 1 ao contador de tentativas
			Inc(CountTentativasEnvioComando);
		  END;
		EXCEPT
		  EstadoAtual := ESTADO_CONECTAR;
		END;
	  END;
  except
    on E: Exception do
    begin
      GerarLogTela('Erro estado liberar giro catraca: ' + E.Message);
    end;
  end;	  
END;

// ***********************************************************************************
// MONITORA_GIRO_CATRACA
// Verifica se a catraca foi girada ou não e caso sim para qual lado.
// Próximo Passo: ESTADO_ENVIAR_MSG_PADRAO
// ***********************************************************************************
PROCEDURE TFormEasyInnerOnLine.PASSO_MONITORA_GIRO_CATRACA();
const
   SLogGiroFmt = 'Inner: %d, Cartão: %s, Giro: %s';
VAR
  Ret: Integer;
  tempo: TDateTime;
  Bilhete: TBilhete;
  Cartao: TCartao;
BEGIN
  try
	  // Usa o Inner Atual na lista de Inners Cadastrados...
	  WITH typInnersCadastrados[lngInnerAtual] DO
	  BEGIN

		TRY
		  // Exibe estado do giro
	//      lblDados.Caption := 'Monitorando Giro de Catraca!';

		  // Exibe estado do Inner no Rodapé da Janela
	//      lblStatus.Caption := 'Inner ' + InttoStr(Numero) + ' Monitora Giro da Catraca...';
	//      Application.ProcessMessages;

		  // Declaração de Variáveis..
		  Bilhete := TBilhete.Create;
		  Bilhete.Origem := 0;
		  Bilhete.Complemento := 0;
		  Bilhete.Dia := 0;
		  Bilhete.Mes := 0;
		  Bilhete.Ano := 0;
		  Bilhete.Hora := 0;
		  Bilhete.Minuto := 0;
		  Bilhete.Segundo := 0;

		  // Monitora o giro da catraca..
		  Ret := ReceberDadosOnLine(Numero, @Bilhete.Origem, @Bilhete.Complemento,
			@Bilhete.Cartao, @Bilhete.Dia, @Bilhete.Mes, @Bilhete.Ano, @Bilhete.Hora,
			@Bilhete.Minuto, @Bilhete.Segundo);

		  Cartao := FindCartao(Numero);

		  // Testa o retorno do comando..
		  IF (Ret = RET_COMANDO_OK) THEN
		  BEGIN
			// Testa se girou o não a catraca..
			IF (Bilhete.Origem = Origem_FIM_DE_TEMPO_DE_ACIONAMENTO) THEN
			begin
	//          lblDados.Caption := 'Não girou a catraca!';
			end
			ELSE IF (Bilhete.Origem = Origem_GIRO_DA_CATRACA_TOPDATA) THEN
			Begin
			  If (optDireita.Checked) Then
			  Begin
				If (Bilhete.Complemento = 1) Then
				Begin
	//              lblDados.Caption := 'Girou a catraca para saída.';
				  DM.RegistraSaida(Cartao.FCartao, Cartao.FConnection);
				end
				Else
				Begin
	//              lblDados.Caption := 'Girou a catraca para entrada.';
				  DM.RegistraEntrada(Cartao.FCartao, Cartao.FConnection);
				End;
			  End
			  Else If (optEsquerda.Checked) Then
			  Begin
				If (Bilhete.Complemento = 1) Then
				Begin
	//              lblDados.Caption := 'Girou a catraca para entrada.';
				  DM.RegistraEntrada(Cartao.FCartao, Cartao.FConnection);
				End
				Else
				Begin
	//              lblDados.Caption := 'Girou a catraca para saída.';
				  DM.RegistraSaida(Cartao.FCartao, Cartao.FConnection);
				End;
			  End;
			END;
			cmdEntrada.Enabled := true;
			cmdSaida.Enabled := true;

			Application.ProcessMessages;

			// Vai para o estado de Envio de Msg Padrão..
			EstadoAtual := ESTADO_ENVIAR_MSG_PADRAO;
		  END
		  ELSE
		  BEGIN
			// Caso o tempo que estiver monitorando o giro chegue a 3 segundos,
			// deverá enviar o ping on line para manter o equipamento em modo on line
			tempo := Now - TempoInicialPingOnLine;
			IF StrtoInt(FormatDateTime('ss', tempo)) >= 3 THEN
			BEGIN
			  EstadoSolicitacaoPingOnLine := EstadoAtual;
			  CountTentativasEnvioComando := 0;
			  TempoInicialPingOnLine := Now;
			  EstadoAtual := PING_ONLINE;
			END;
		  END;
		  Bilhete.Destroy;
		EXCEPT
		  EstadoAtual := ESTADO_CONECTAR;
		END;
	END;
  except
    on E: Exception do
    begin
      GerarLogTela('Erro estado monitorar giro catraca: ' + E.Message);
    end;
  end;	
END;

// ***********************************************************************************
// ENVIA_PING_ONLINE
// Testa comunicação com o Inner e mantém o Inner em OnLine quando a mudança
// automática está configurada. Especialmente indicada para a verificação da
// conexão em comunicação TCP/IP.
// Próximo Passo: RETORNA MÉTODO QUE O ACIONOU
// ***********************************************************************************
PROCEDURE TFormEasyInnerOnLine.PASSO_ESTADO_ENVIA_PING_ONLINE();
VAR
  retorno: Integer;
BEGIN
  try
	  // Usa o Inner Atual na lista de Inners Cadastrados...
	  WITH typInnersCadastrados[lngInnerAtual] DO
	  BEGIN
		TRY
		  // Exibe estado do Inner no Rodapé da Janela
	//      lblStatus.Caption := 'Inner ' + InttoStr(Numero) + ' PING ONLINE...';
	//      Application.ProcessMessages;

		  // Envia o comando de PING ON LINE, se o retorno FOR OK volta para o estado onde chamou o método
		  retorno := PingOnLine(Numero);
		  IF (retorno = RET_COMANDO_OK) THEN
			EstadoAtual := EstadoSolicitacaoPingOnLine
		  ELSE
		  BEGIN
			// caso ele não consiga, tentará enviar três vezes, se não conseguir volta para o passo Reconectar
			IF (CountTentativasEnvioComando >= 3) THEN
			  EstadoAtual := ESTADO_RECONECTAR;

			// Adiciona 1 ao contador de tentativas
			Inc(CountTentativasEnvioComando);
		  END;
		  TempoInicialPingOnLine := Now;
		EXCEPT
		  EstadoAtual := ESTADO_CONECTAR;
		END;
	  END;
  except
    on E: Exception do
    begin
      GerarLogTela('Erro estado enviar ping online: ' + E.Message);
    end;
  end;	  
END;

// ***********************************************************************************
// RECONECTAR
// Se a conexão cair tenta conectar novamente
// Próximo Passo: ESTADO_ENVIAR_CFG_OFFLINE
// ***********************************************************************************
PROCEDURE TFormEasyInnerOnLine.PASSO_ESTADO_RECONECTAR();
VAR
  tempo: TDateTime;
  Ret: Integer;
BEGIN
  try
	  WITH typInnersCadastrados[lngInnerAtual] DO
	  BEGIN
		TRY
	//      lblStatus.Caption := 'Inner ' + InttoStr(Numero) + ' Estado reconectar';

		  tempo := Now - TempoInicialConectar;
		  If StrtoInt(FormatDateTime('ss', tempo)) < 10 then
		  Begin
			Exit;
		  End;
		  TempoInicialConectar := Now;
		  
		  // Testa a conexão, tenta enviar um relógio para o Inner.
		  Ret := testaConexaoInner(Numero);
		  IF (Ret = RET_COMANDO_OK) THEN
		  BEGIN
			// caso consiga o Inner vai para o Passo de Configuração OFFLINE, posteriormente para coleta de Bilhetes.
			CountTentativasEnvioComando := 0;
			EstadoAtual := ESTADO_ENVIAR_CFG_OFFLINE;
		  END
		  ELSE
		  BEGIN
			// caso ele não consiga, tentará enviar três vezes, se não conseguir volta para o passo Reconectar
			IF (CountTentativasEnvioComando >= 3) THEN
			Begin
			  EstadoAtual := ESTADO_RECONECTAR;

			  // para e inicia o processo para reconectar na catraca
			  if (FReiniciarCatracasAuto) then
			  begin
				  GerarLogTela('Reiniciando catracas...');

	  			PararCatracas();
		  		Sleep(1000);
			  	IniciarCatracas();
			  end;
			End;
			Inc(CountTentativasEnvioComando);
		  END;
		EXCEPT
		  EstadoAtual := ESTADO_CONECTAR;
		END;
	  END;
  except
    on E: Exception do
    begin
      GerarLogTela('Erro estado reconectar: ' + E.Message);
    end;
  end;	  
END;

// ***********************************************************************************
// LIMPAR
// Esvazia a lista de bilhetes
// ***********************************************************************************
PROCEDURE TFormEasyInnerOnLine.cmdLimparClick(Sender: TObject);
BEGIN
  lstBilhetes.Clear;
END;

// ***********************************************************************************
// DEFINEVERSAO
// Esta rotina é responsável por identificar a versão do inner
// ***********************************************************************************
{PROCEDURE TFormEasyInnerOnLine.DefineVersao;
VAR
  Variacao: SHORT;
  VersaoAlta: Byte;
  VersaoBaixa: Byte;
  VersaoSufixo: Byte;
  Modelo: Integer;
  VersaoAltaBio: Integer;
  VersaoBaixaBio: Integer;
  LinhaInner: String;
  VersaoInner: String;
  ModeloBioInner: String;
  VersaoBio: String;
  InnerAcessoBIO: Byte;
BEGIN                  
  // ******************************************************
  // MAIS DE UM INNER

  // Usa o Inner Atual na lista de Inners Cadastrados...
  WITH typInnersCadastrados[lngInnerAtual] DO
  BEGIN

    // Solicita a versão do firmware do Inner e dados como o Idioma, se é
    // uma versão especial.
    Ret := ReceberVersaoFirmware(Numero, @Linha, @Variacao, @VersaoAlta,
      @VersaoBaixa, @VersaoSufixo, @InnerAcessoBIO);

    // Se selecionado Biometria, Valida se o equipamento é compatível
    If chkBiometrico.Checked Then
    begin
      If ((Linha <> 6) and (Linha <> 14)) Or
        ((Linha = 14) and (InnerAcessoBIO <> 1)) Then
      begin
        MessageDlg('Equipamento ' + InttoStr(typInnersCadastrados[lngInnerAtual]
          .Numero) + ' não compatível com Biometria.', mtWarning, [mbOk], 0);
        lblVersao.Font.Color := clRed;
        lblVersao.Font.Style := [fsBold];
      End;
    End;

    IF (Ret = RET_COMANDO_OK) THEN
    BEGIN

      // Define a linha do Inner
      CASE Linha OF
        1:
          LinhaInner := 'Inner Plus';
        2:
          LinhaInner := 'Inner Disk';
        3:
          LinhaInner := 'Inner Verid';
        6:
          LinhaInner := 'Inner Bio';
        7:
          LinhaInner := 'Inner NET';
        14:
          begin
            LinhaInner := 'Inner Acesso';
            InnerNetAcesso := true;
          end;
      END;

      VersaoInner := InttoStr(VersaoAlta) + '.' + InttoStr(VersaoBaixa) + '.' +
        InttoStr(VersaoSufixo);

      // Se for biometria
      If ((Linha = 6) Or (InnerAcessoBIO = 1)) Then
      BEGIN

        // Solicita o modelo do Inner bio.
        SolicitarModeloBio(Numero);

        Ret := 128;

        WHILE (Ret = 128) DO
        BEGIN
          Sleep(1);

          // Retorna o resultado do comando SolicitarModeloBio, o modelo
          // do Inner Bio é retornado por referência no parâmetro da função.
          Ret := ReceberModeloBio(Numero, 0, @Modelo);
        END;

        // Define o modelo do Inner Bio
        CASE Modelo OF
          1:
            ModeloBioInner := 'Modelo: Light 100 usuários FIM10';
          4:
            ModeloBioInner := 'Modelo: 5000 usuários FIM01';
          51:
            ModeloBioInner := 'Modelo: 5000 usuários FIM2030';
          52:
            ModeloBioInner := 'Modelo: 5000 usuários FIM2040';
          48:
            ModeloBioInner := 'Modelo: Light 100 usuários FIM3030';
          64:
            ModeloBioInner := 'Modelo: Light 1000 usuários FIM3040';
          80:
            ModeloBioInner := 'Modelo: FIM5060';
          82:
            ModeloBioInner := 'Modelo: FIM5260';
          83:
            ModeloBioInner := 'Modelo: FIM5360';
          96:
            ModeloBioInner := 'Modelo: FIM6060';
          255:
            ModeloBioInner := 'Modelo: Desconhecido';
        END;

        // Solicita a versão do Inner bio.
        Ret := SolicitarVersaoBio(Numero);

        Ret := 128;

        WHILE (Ret = 128) DO
        BEGIN
          Sleep(1);

          // Retorna o resultado do comando SolicitarVersaoBio, a versão
          // do Inner Bio é retornado por referência nos parâmetros da
          // função.
          Ret := ReceberVersaoBio(Numero, 0, @VersaoAltaBio, @VersaoBaixaBio);
        END;

        VersaoBio := InttoStr(VersaoAltaBio) + '.' + InttoStr(VersaoBaixaBio);
      END;
      lblVersao.Caption := lblVersao.Caption + 'Inner(' +
        InttoStr(Numero) + '): ';
      lblVersao.Caption := lblVersao.Caption + LinhaInner;

      if Variacao <> 0 then
        lblVersao.Caption := lblVersao.Caption + ' - Variação: ' +
          InttoStr(Variacao);

      lblVersao.Caption := lblVersao.Caption + ' - Versão: ' + VersaoInner;

      If (Linha = 6) Or (InnerAcessoBIO = 1) Then
        lblVersao.Caption := lblVersao.Caption + ' - ' + ModeloBioInner + ' -> '
          + VersaoBio;
    END;
    lblVersao.Caption := lblVersao.Caption + CHR(13)
  END;
END;}

// ***********************************************************************************
// MONTAR HORARIOS
// Insere no buffer da dll um horário de acesso. O Inner possui uma tabela de
// 100 horários de acesso, para cada horário é possível definir 4 faixas de acesso
// para cada dia da semana.
// Tabela de horarios numero 1
// ***********************************************************************************
PROCEDURE TFormEasyInnerOnLine.MontarHorarios;
begin
  try
	  // Usa o Inner Atual na lista de Inners Cadastrados...
	  WITH typInnersCadastrados[lngInnerAtual] DO
	  BEGIN

		InserirHorarioAcesso(1, Segunda, InicioFaixa1, 8, 0); // 'inicio faixa 1
		InserirHorarioAcesso(1, Segunda, FimFaixa1, 12, 0); // 'fim faixa 1
		InserirHorarioAcesso(1, Segunda, InicioFaixa2, 13, 0); // 'Inicio faixa 2
		InserirHorarioAcesso(1, Segunda, FimFaixa2, 16, 0); // 'fim faixa 2

		InserirHorarioAcesso(1, Terca, InicioFaixa1, 9, 0); // 'inicio faixa 1
		InserirHorarioAcesso(1, Terca, FimFaixa1, 11, 0); // 'fim faixa 1
		InserirHorarioAcesso(1, Terca, InicioFaixa2, 13, 0); // 'Inicio faixa 2
		InserirHorarioAcesso(1, Terca, FimFaixa2, 20, 0); // 'fim faixa 2

		InserirHorarioAcesso(1, Quarta, InicioFaixa1, 6, 0); // 'inicio faixa 1
		InserirHorarioAcesso(1, Quarta, FimFaixa1, 9, 0); // 'fim faixa 1
		InserirHorarioAcesso(1, Quarta, InicioFaixa2, 14, 0); // 'Inicio faixa 2
		InserirHorarioAcesso(1, Quarta, FimFaixa2, 21, 0); // 'fim faixa 2

		InserirHorarioAcesso(1, Quinta, InicioFaixa1, 6, 0); // 'inicio faixa 1
		InserirHorarioAcesso(1, Quinta, FimFaixa1, 9, 0); // 'fim faixa 1
		InserirHorarioAcesso(1, Quinta, InicioFaixa2, 14, 0); // 'Inicio faixa 2
		InserirHorarioAcesso(1, Quinta, FimFaixa2, 21, 0); // 'fim faixa 2

		InserirHorarioAcesso(1, Sexta, InicioFaixa1, 9, 0); // 'inicio faixa 1
		InserirHorarioAcesso(1, Sexta, FimFaixa1, 11, 0); // 'fim faixa 1
		InserirHorarioAcesso(1, Sexta, InicioFaixa2, 13, 0); // 'Inicio faixa 2
		InserirHorarioAcesso(1, Sexta, FimFaixa2, 20, 0); // 'fim faixa 2

		InserirHorarioAcesso(1, Sabado, InicioFaixa1, 9, 0); // 'inicio faixa 1
		InserirHorarioAcesso(1, Sabado, FimFaixa1, 10, 0); // 'fim faixa 1
		InserirHorarioAcesso(1, Sabado, InicioFaixa2, 11, 0); // 'Inicio faixa 2
		InserirHorarioAcesso(1, Sabado, FimFaixa2, 13, 0); // 'fim faixa 2

		EnviarHorariosAcesso(Numero);
	  END;
  except
    on E: Exception do
    begin
      GerarLogTela('Erro ao montar horários: ' + E.Message);
    end;
  end;	  
END;

// ***********************************************************************************
// MONTAR LISTA TOPDATA
// Monta o buffer para enviar a lista nos inners da linha Inner, cartão padrão Topdata
// ***********************************************************************************
PROCEDURE TFormEasyInnerOnLine.MontarListaTopdata;
var
  i: Integer;
begin
	  try
	  // Define qual padrão o Inner vai usar
	  DefinirPadraoCartao(TpCartao_TOPDATA);

	  // Quantidade de digitos que o cartao usará
	  DefinirQuantidadeDigitosCartao(14);

	  for i := 0 to 5 do
	  begin
		// Insere usuário da lista no buffer da DLL
		InserirUsuarioListaAcesso(InttoStr(i), 101);
	  end;
  except
    on E: Exception do
    begin
      GerarLogTela('Erro ao montar lista topdata: ' + E.Message);
    end;
  end;	  
end;

// ***********************************************************************************
// MONTAR LISTA LIVRE
// Monta o buffer para enviar a lista nos inners da linha Inner, cartão padrão livre 14 dígitos
// ***********************************************************************************
PROCEDURE TFormEasyInnerOnLine.MontarListaLivre;
begin
	  try
	  // Define qual padrão o Inner vai usar
	  DefinirPadraoCartao(TpCartao_PADRAO_LIVRE);

	  // Quantidade de digitos que o cartao usará
	  DefinirQuantidadeDigitosCartao(StrtoInt(txtNumDigitos.Text));
	  // inserir usuário na lista de acesso Off-Line
	  InserirUsuarioListaAcesso('1', 101);
	  InserirUsuarioListaAcesso('187', 101);
	  InserirUsuarioListaAcesso('123456', 101);
	  InserirUsuarioListaAcesso('27105070', 101);
	  InserirUsuarioListaAcesso('103086639459', 101);
  except
    on E: Exception do
    begin
      GerarLogTela('Erro ao montar lista livre: ' + E.Message);
    end;
  end;	  
END;

// ***********************************************************************************
// HABILITA/DESABILITA CAMPOS
// ***********************************************************************************
procedure TFormEasyInnerOnLine.chkListaBioClick(Sender: TObject);
begin
  if (chkListaBio.Checked) then
    chkVerificacao.Checked := true;
end;

// ***********************************************************************************
// HABILITA/DESABILITA CAMPOS
// ***********************************************************************************
procedure TFormEasyInnerOnLine.chkVerificacaoClick(Sender: TObject);
begin
  if not(chkVerificacao.Checked) then
    chkListaBio.Checked := False;
end;

// ***********************************************************************************
// Insere o número do cartão na lista de usuários sem digital do Inner bio.
// ***********************************************************************************
procedure TFormEasyInnerOnLine.MontarBufferListaSemDigital(InnerAcesso: Boolean);
begin
  try
	  // Para uma lista sem digital com mais de 250 usuários utilize
	  // IncluirUsuarioSemDigitalBioInnerAcesso(NumeroInner);
	  // com o ConfigurarBioVariavel(1)nas configurações para setar 16 digitos
	  if InnerAcesso then
	  Begin
		IncluirUsuarioSemDigitalBioInnerAcesso('999');
		IncluirUsuarioSemDigitalBioInnerAcesso('1000');
		IncluirUsuarioSemDigitalBioInnerAcesso('1');
		IncluirUsuarioSemDigitalBioInnerAcesso('3007');
	  End
	  Else
	  Begin
		IncluirUsuarioSemDigitalBio('999');
		IncluirUsuarioSemDigitalBio('1000');
		IncluirUsuarioSemDigitalBio('1');
		IncluirUsuarioSemDigitalBio('3007');
	  End;
  except
    on E: Exception do
    begin
      GerarLogTela('Erro ao montar buffer lista sem digital: ' + E.Message);
    end;
  end;  
end;

procedure TFormEasyInnerOnLine.optEsquerdaClick(Sender: TObject);
begin
  imgCatraca.Picture.LoadFromFile('Imagens\Esquerda-invertidaa.JPG');
end;

procedure TFormEasyInnerOnLine.optDireitaClick(Sender: TObject);
begin
  imgCatraca.Picture.LoadFromFile('Imagens\Direita-normall.JPG');
end;

// *************************************************
// Ação ao selecionar item na combo de Equipamento
// *************************************************
procedure TFormEasyInnerOnLine.CarregaPrefs;
var
   IniPath: TFileName;
   NumeroInners: String;
   NumeroDigitos: String;
   Porta: String;
   Padrao: String;
   TipoConexao: String;
   TipoEquipamento: String;
   TipoLeitor: String;
   DoisLeitores: String;
   CatracaEsquerda: String;
   ParametrosListaOffline: String;
   ParametrosTeclado: String;
   ParametrosBiometria: String;
   ParametroListaBio: String;
   ParametroVerificacao: String;
   ParametroIdentificacao: String;
begin
  try
	   IniPath := Format('%s%sunimestre.ini', [ExtractFilePath(ParamStr(0)), PathDelim]);
	   ConnIni := TIniFile.Create(IniPath);

	   NumeroInners := ConnIni.ReadString('Catraca.Prefs','NumeroInners','4');
	   NumeroDigitos:= ConnIni.ReadString('Catraca.Prefs','NumeroDigitos','20');
	   Porta:= ConnIni.ReadString('Catraca.Prefs','Porta','3570');
	   Padrao:= ConnIni.ReadString('Catraca.Prefs','Padrao','1');
	   TipoConexao:= ConnIni.ReadString('Catraca.Prefs','TipoConexao','1');
	   TipoEquipamento:= ConnIni.ReadString('Catraca.Prefs','TipoEquipamento','1');
	   TipoLeitor:= ConnIni.ReadString('Catraca.Prefs','TipoLeitor','2');
	   DoisLeitores:= ConnIni.ReadString('Catraca.Prefs','DoisLeitores','1');
	   CatracaEsquerda:= ConnIni.ReadString('Catraca.Prefs','CatracaEsquerda','1');
	   ParametrosListaOffline:= ConnIni.ReadString('Catraca.Prefs','ParametrosListaOffline','0');
	   ParametrosTeclado:= ConnIni.ReadString('Catraca.Prefs','ParametrosTeclado','0');
	   ParametrosBiometria:= ConnIni.ReadString('Catraca.Prefs','ParametrosBiometria','0');
	   ParametroListaBio := ConnIni.ReadString('Catraca.Prefs','ParametroListaBio','0');
	   ParametroVerificacao := ConnIni.ReadString('Catraca.Prefs','ParametroVerificacao','0');
	   ParametroIdentificacao := ConnIni.ReadString('Catraca.Prefs','ParametroIdentificacao','0');

	   FIniciarTelaAuto := ConnIni.ReadBool('Catraca.Prefs', 'IniciarAutomatico', True);
	   FReiniciarCatracasAuto := ConnIni.ReadBool('Catraca.Prefs', 'ReiniciarCatracasAuto', True);

	   txtNumInners.Text := NumeroInners;
	   txtNumDigitos.Text := NumeroDigitos;
	   txtPorta.Text := Porta;
	   cboTipoConexao.ItemIndex := StrToInt(TipoConexao);
	   cboEquipamento.ItemIndex := StrToInt(TipoEquipamento);
	   cboTipoLeitor.ItemIndex  := StrToInt(TipoLeitor);

	   optEsquerda.Checked := (CatracaEsquerda = '1');
	   optDireita.Checked := not optEsquerda.Checked;
	   chkTeclado.Checked := ParametrosTeclado = '1';
	   chkLista.Checked :=  ParametrosListaOffline = '1';
	   chkBiometrico.Checked := ParametrosBiometria = '1';
     chkListaBio.Checked := ParametroListaBio = '1';
	   chkVerificacao.Checked := ParametroVerificacao = '1';
	   chkIdentificacao.Checked := ParametroIdentificacao = '1';

	   cboTipoLeitorChange(self);
	   cboEquipamentoChange(self);

	   chkDoisLeitores.Checked  := (DoisLeitores = '1');

     if (FIniciarTelaAuto) then
		    cmdIniciarClick(self);
  except
    on E: Exception do
    begin
      GerarLogTela('Erro ao carregar configuração arquivo .ini das catracas' + E.Message);
    end;
  end;	  
end;

procedure TFormEasyInnerOnLine.cboEquipamentoChange(Sender: TObject);
begin
  // Se catraca
  If (cboEquipamento.ItemIndex <> Acionamento_Coletor) Then
  begin
    optEsquerda.Enabled := true;
    optDireita.Enabled := true;
    chkDoisLeitores.Enabled := true;

    // Se Urna
    If ((cboEquipamento.ItemIndex = Acionamento_Catraca_Urna)) Then
    begin
      optDireita.Checked := true;
      optEsquerda.Checked := False;
      optDireita.Enabled := False;
      imgCatraca.Picture.LoadFromFile('Imagens\Direita-normall.JPG');
      lblCatraca.Enabled := true;
      cboTipoLeitor.ItemIndex := 4; // proximidade
      chkDoisLeitores.Checked := true;
      // chkDoisLeitores.Enabled := False;
    end
    else
    begin
      If (optDireita.Checked = true) Then
        imgCatraca.Picture.LoadFromFile('Imagens\Direita-normall.JPG')
      Else
      begin
        If (optEsquerda.Checked = true) Then
          imgCatraca.Picture.LoadFromFile('Imagens\Esquerda-invertidaa.JPG');
      end;
      lblCatraca.Enabled := true;
    End;

  end
  Else
  begin // Coletor
    optEsquerda.Enabled := False;
    optDireita.Enabled := False;
    lblCatraca.Enabled := False;
    imgCatraca.Picture.LoadFromFile('Imagens\nenhum.jpg');
  End;

end;

procedure TFormEasyInnerOnLine.chkCartaoMasterClick(Sender: TObject);
begin
  if (chkCartaoMaster.Checked) then
  begin
    txtCatraoMaster.Enabled := true;
  end
  else
  begin
    txtCatraoMaster.Enabled := False;
  end;
end;

procedure TFormEasyInnerOnLine.rdbPadraoTopdataClick(Sender: TObject);
begin
  MessageDlg
    ('Este tipo é utilizado somente para cartões fabricado pela Topdata !',
    mtWarning, [mbOk], 0);
end;

{ TCartao }

constructor TCartao.Create;
begin
   FCartao := '';
   FInner := 0;
   FTipoPassagem := taNone;
end;

end.
