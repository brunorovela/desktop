// ******************************************************************************
// A Topdata Sistemas de Automação Ltda não se responsabiliza por qualquer
// tipo de dano que este software possa causar, este exemplo deve ser utilizado
// apenas para demonstrar a comunicação com os equipamentos da linha Inner.
//
// Exemplo Biometria
// Desenvolvido em Visual Basic 6.
// Topdata Sistemas de Automação Ltda.
// ******************************************************************************

unit FormEasyInnerTesteBio;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, DB, ADODB, Grids, DBGrids, Buttons, StdCtrls, ComCtrls, ComObj,
  shellapi, ExtCtrls, Constantes, EasyInnerDLL, Utils, NBioBSPCOMLib_TLB;

type
  TFrmEasyInnerTesteBio = class(TForm)
    PageControl1: TPageControl;
    tbConfiguracao: TTabSheet;
    LblStatus: TLabel;
    Image1: TImage;
    gbConfiguracoesGerais: TGroupBox;
    Label1: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label7: TLabel;
    Label11: TLabel;
    cboTipoConexao: TComboBox;
    cboPadraoCartao: TComboBox;
    txtQtdeDigitos: TEdit;
    cmdConfigurarInner: TButton;
    cboTipoLeitor: TComboBox;
    chkHabVerificacao: TCheckBox;
    chkHabIdentificacao: TCheckBox;
    gbDadosComuns: TGroupBox;
    Label5: TLabel;
    Label2: TLabel;
    txtNumInner: TEdit;
    txtPorta: TEdit;
    cmdReceberModelo: TButton;
    cmdReceberVersao: TButton;
    tbManutencaoUsuarioBio: TTabSheet;
    lblManutencao: TLabel;
    gbManutencaoListaMemoria: TGroupBox;
    Label6: TLabel;
    EdtUsuario: TEdit;
    cmdCadastrar: TButton;
    cmdExcluirUsuario: TButton;
    gbUsuarioSemDigital: TGroupBox;
    cmdEnviarLista: TButton;
    gbUsuarioMemoria: TGroupBox;
    lblUsuarios: TLabel;
    lstUsuarios: TListBox;
    cmdReceberQtdeUsuarios: TButton;
    cmdReceberTodosUsuarios: TButton;
    cmdGravarBase: TButton;
    gbUsuarioInner: TGroupBox;
    cmdEnviarInner: TButton;
    cmdApagar: TButton;
    cmdEnviarSelInner: TButton;
    sgUsuariosDigital: TStringGrid;
    ProgressBar1: TProgressBar;
    RadioGroup1: TRadioGroup;
    RdbDigital2: TRadioButton;
    RdbDigital1: TRadioButton;
    btnExcluirUsuarioSelInner: TButton;
    ADOConnection1: TADOConnection;
    ADODataSetUsuarioBio: TADODataSet;
    ADODataSetUsuarioBioCodigo: TAutoIncField;
    ADODataSetUsuarioBioCartao: TWideStringField;
    ADODataSetUsuarioBioTemplate1: TMemoField;
    ADODataSetUsuarioBioTemplate2: TMemoField;
    DataSourceUsuarioBio: TDataSource;
    ADOCommandUsuarioBio: TADOCommand;
    sgUsuarios: TStringGrid;
    ADODataSetUsuarioSD: TADODataSet;
    AutoIncField1: TAutoIncField;
    UsuariosSemDigitalCartao: TWideStringField;
    DataSourceUsuarioSD: TDataSource;
    ADOCommandUsuarioSD: TADOCommand;
    tbpHamster: TTabSheet;
    gpbHamster: TGroupBox;
    gpbCadastroHamster: TGroupBox;
    Label8: TLabel;
    Label12: TLabel;
    cboDispositivos: TComboBox;
    txtCartao: TEdit;
    btnIniciar: TButton;
    btnCapturar: TButton;
    gpbConfiguracoes: TGroupBox;
    lblMinVerify: TLabel;
    lbValorlVerify: TLabel;
    lblDigfital: TLabel;
    lblMinDigital: TLabel;
    TkbVerify: TTrackBar;
    chkPopup: TCheckBox;
    tkbValorDigital: TTrackBar;
    lblQualidadeImagem: TLabel;
    lblValorImagem: TLabel;
    lblValorDigital: TLabel;
    lblQualidadeDigital: TLabel;
    pic: TPanel;
    procedure FormCreate(Sender: TObject);
    procedure cmdReceberQtdeUsuariosClick(Sender: TObject);
    procedure cmdReceberTodosUsuariosClick(Sender: TObject);
    procedure cmdReceberModeloClick(Sender: TObject);
    procedure cmdReceberVersaoClick(Sender: TObject);
    procedure cmdInserirUsrListaClick(Sender: TObject);
    procedure cmdEnviarListaClick(Sender: TObject);
    procedure cmdConfigurarBioClick(Sender: TObject);
    procedure cmdCadastrarClick(Sender: TObject);
    procedure cmdExcluirUsuarioClick(Sender: TObject);
    procedure cmdEnviarUsuarioClick(Sender: TObject);
    procedure cboTipoConexaoChange(Sender: TObject);
    procedure cmdConfigurarInnerClick(Sender: TObject);
    procedure cmdEnviarInnerClick(Sender: TObject);
    procedure btIniciarClick(Sender: TObject);
    procedure btCapturarClick(Sender: TObject);
    procedure cboDispositivosChange(Sender: TObject);
    procedure edCartaoChange(Sender: TObject);
    procedure edCartaoKeyPress(Sender: TObject; var Key: Char);
    procedure btCapturar2Click(Sender: TObject);
    procedure cmdApagarClick(Sender: TObject);
    procedure cmdGravarBaseClick(Sender: TObject);
    procedure btnCadastrarNoLeitorBIOClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure cboDispositivosExit(Sender: TObject);
    procedure cboDispositivosDropDown(Sender: TObject);
    procedure cmdEnviarSelInnerClick(Sender: TObject);
    procedure btnExcluirUsuarioSelInnerClick(Sender: TObject);
    procedure sgUsuariosSelectCell(Sender: TObject; ACol, ARow: Integer;
      var CanSelect: Boolean);

  private
    procedure showFalhaConexao();
    procedure Finalizar();
    procedure MontarConfiguracao();
    procedure enviarTlpSel(cartao: string; TemplateA: string; TemplateB: string; Light: Boolean);
    procedure enviarTodosTlp(placaLight: boolean);
    procedure ConectaDLLNitgen();
    procedure ConectaMDB;
    Function CarregarUsuarioBioEspec(UsuarioSel: string): Boolean;
    Procedure InserirUsuarioBio(UsuarioBio: TStringList);
    Procedure CarregarTemplates;
    Procedure CarregarUsuariosSD;
    Function GetQualidadeCaptureDigital: Integer;
    Procedure QualidadeImagemCapture(ASender: TObject; Quality: integer);

    procedure SetarTimeoutBio();
    procedure TratarRetornoErro(Retorno: Integer);
    procedure ErroNitgen(Sender: TObject; E: Exception);

    Procedure EnviarUsuario(cartao: AnsiString;
      TemplateA: AnsiString; TemplateB: AnsiString; placaLight: boolean);
    Procedure EnviarUsuarioBioVariavel(cartao: AnsiString;
      TemplateA: AnsiString; TemplateB: AnsiString);

    Procedure ReceberUsuarioBio;
    Procedure ReceberUsuarioBioVariavel;

    Procedure ReceberDigitalBio;
    Procedure ReceberDigitalBioVariavel;

    Procedure ReceberUsuarios;

    function Retornar_SegundosSys(): double;
    function liberacaptura(): boolean;
    function BioLigth(): boolean;
    function inserirTemplateUsr(Usr: string; numTpl: Integer): boolean;
    function Conectar(): boolean;
    function CompletaString(var1: String; Len: Integer;
      complemento: String): String;
    function EsperaRespostaBio(Retorno: Integer): boolean;
    function testaConexaoInner(NumInner: Integer): Integer;

    function CapturaVersaoPlaca(): Integer;

  public
    { Public declarations }
  end;

var
  FrmEasyInnerTesteBio: TFrmEasyInnerTesteBio;
  Ret: Integer;
  Template: array [0 .. 843] of byte;
  TemplateLeitor: array [0 .. 403] of byte;
  CapturaObjNBioBSP: variant;
  CapturaObjExtraction: variant;
  CapturaObjFPData: variant;
  objIndexSearch: variant;
  HamsterPronto: boolean;

  ObjNBioBSPCOMLib_TLB: TNBioBSP;

  ObjNBioBSP: variant;
  ObjExtraction: OleVariant;
  ObjFPData: OleVariant;
  objDevice: OleVariant;
  objFPImage: OleVariant;

  EnvioObjNBioBSP: OleVariant;
  RecebObjNBioBSP: OleVariant;
  EnvioObjExtraction: OleVariant;
  EnvioObjFPData: OleVariant;
  RecebObjFPData: OleVariant;

  convIn: Array [0 .. 1] of Char;
  convOut: Char;
  saida: array [0 .. 403] of byte;
  linha: array [0 .. 843] of byte;

  i, iJaCadast, iOk, iFalhaCom, iFalhaEnvio, iTplInvalido,
    iParInvalido: Integer;
  nDataSize: Integer;
  LinhaInner: Integer;
  byFIR: Array of byte;
  Timeout: Extended;
  blnBase: boolean;

  dedo1: String;
  EnviarUsuario: String;

  Templates, Usuarios, SDigital: TStringList;
  bUsuario: array [0 .. 7] of byte;
  Usuario: array [0 .. 15] of AnsiChar;
  DigitalEnvio1: array [0 .. 404] of byte;
  DigitalEnvio2: array [0 .. 404] of byte;
  pTeste: array of byte;
  RowSelecionada: Integer;

implementation

{$R *.dfm}

// ***********************************************************************************
// Realiza o teste de conexão com o Inner
// ***********************************************************************************
function TFrmEasyInnerTesteBio.testaConexaoInner(NumInner: Integer): Integer;
Var
  RetRelogio: byte;
  Dia: byte;
  Mes: byte;
  Ano: byte;
  Hora: byte;
  Minuto: byte;
  Segundo: byte;
Begin
  Dia := 0;
  Mes := 0;
  Ano := 0;
  Hora := 0;
  Minuto := 0;
  Segundo := 0;

  testaConexaoInner := ReceberRelogio(NumInner, @Dia, @Mes, @Ano, @Hora,
    @Minuto, @Segundo);
  Application.ProcessMessages;
END;

// ***********************************************************************************
// Método que realiza a conexão com as DLL´s da Nitgen
// ***********************************************************************************
Procedure TFrmEasyInnerTesteBio.ConectaDLLNitgen;
var
  i: integer;
  nDeviceID: longint;
begin

  ObjNBioBSPCOMLib_TLB := TNBioBSP.Create(ObjNBioBSPCOMLib_TLB);
  // Evento de captura da qualidade
  ObjNBioBSPCOMLib_TLB.OnCaptureEvent := QualidadeImagemCapture;
 // ObjNBioBSPCOMLib_TLB.OnEnrollEvent := QualidadeImagemEnroll;
  // Apresenta mensagem caso não encontre o pacote Nitgen
  Application.OnException := ErroNitgen;

  ObjExtraction := ObjNBioBSPCOMLib_TLB.Extraction;
  ObjFPData := ObjNBioBSPCOMLib_TLB.FPData;
  objDevice := ObjNBioBSPCOMLib_TLB.Device;
  objFPImage := ObjNBioBSPCOMLib_TLB.FPImage;

  EnvioObjNBioBSP := CreateOleObject('NBioBSPCOM.NBioBSP');
  RecebObjNBioBSP := CreateOleObject('NBioBSPCOM.NBioBSP');
  EnvioObjExtraction := EnvioObjNBioBSP.Extraction;
  EnvioObjFPData := EnvioObjNBioBSP.FPData;
  RecebObjFPData := RecebObjNBioBSP.FPData;

  objDevice.Enumerate;

  // Combo Dispositivos
  for i := 0 to objDevice.EnumCount - 1 do
  begin
    nDeviceID := objDevice.EnumDeviceID[i];
    cboDispositivos.items.Append(objDevice.EnumDeviceName[i] + ' (ID:' +
      InttoStr(objDevice.GetDeviceNumber[nDeviceID]) + ')');
  end;

  objIndexSearch := EnvioObjNBioBSP.IndexSearch;
  if objIndexSearch.ErrorCode <> NBioAPIERROR_NONE then
  begin
    MessageDlg('Falha na importação dos dados (' + InttoStr(objIndexSearch.ErrorCode) + ')',
      mtError, [mbOk], 0);
  end;
  objIndexSearch.clearDB;

  PageControl1.ActivePage := tbConfiguracao;

end;

// ***********************************************************************************
// Apresenta mensagem caso não encontre o pacote da Nitgen
// ***********************************************************************************
Procedure TFrmEasyInnerTesteBio.ErroNitgen(Sender: TObject; E: Exception);
Begin
  Showmessage
    ('Para funcionamento do Hamster deverá instalar o pacote da Nitgen, maiores detalhes acesse o arquivo leiame contido na instalação do SDK (Menu Iniciar/Programas/SDK EasyInner/Manuais)');
end;

// ***********************************************************************************
// ABERTURA FORMULÁRIO
// Carregamento das combos e campos
// ***********************************************************************************
Procedure TFrmEasyInnerTesteBio.FormCreate(Sender: TObject);
begin
  // Conecta na base
  CarregarTemplates;
  CarregarUsuariosSD;

  // Combo Tipo Conexão
  cboTipoConexao.items.Clear;
  cboTipoConexao.items.Add('Serial');
  cboTipoConexao.items.Add('TCP/IP');
  cboTipoConexao.items.Add('TCP/IP porta fixa');
  cboTipoConexao.ItemIndex := 2; // Default

  // Combo Padrão Cartão
  cboPadraoCartao.items.Clear;
  cboPadraoCartao.items.Add('Topdata');
  cboPadraoCartao.items.Add('Livre');
  cboPadraoCartao.ItemIndex := 1; // Default

  // Combo Tipo Leitor
  cboTipoLeitor.items.Clear;
  cboTipoLeitor.Items.Add('Código Barras');
  cboTipoLeitor.Items.Add('Magnético');
  cboTipoLeitor.Items.Add('Prox. Abatrack/Smart Card');
  cboTipoLeitor.Items.Add('Prox. Wiegand/Smart Card');
  cboTipoLeitor.Items.Add('Prox. Smart Card Serial');
  cboTipoLeitor.Items.Add('Codigo de barras serial');
  cboTipoLeitor.Items.Add('Wiegand FC sem zero');
  cboTipoLeitor.ItemIndex := 0; // Default

  // Mensagem Status
  lblManutencao.Caption := 'Selecione um comando.';
  Application.ProcessMessages;

  // Conecta na DLL
  ConectaDLLNitgen();

end;

// ***********************************************************************************
// Receber Usuários cadastrados no Inner Bio
// Retorna a quantidade de usuários cadastrados.
// ***********************************************************************************
Procedure TFrmEasyInnerTesteBio.cmdReceberQtdeUsuariosClick(Sender: TObject);
var
  tentativas: Integer;
  Quantidade: Integer;
begin

  // Mensagem Status
  lblManutencao.Caption := 'Recebendo quantidade de usuários cadastrados...';
  Application.ProcessMessages;
  Screen.Cursor := crHourGlass;
  If Conectar() Then
  begin
    tentativas := 0;
    // Solicita a quantidade de usuários cadastrados no Inner Bio.
    Ret := SolicitarQuantidadeUsuariosBio(StrToInt(txtNumInner.Text));
    sleep(10);

    If (Ret = RET_COMANDO_OK) Then
    begin
      Ret := RET_BIO_PROCESSANDO;
      SetarTimeoutBio();
      repeat
        // Retorna a quantidade de usuários cadastrados no Inner Bio
        sleep(10);
        Application.ProcessMessages;
        Ret := ReceberQuantidadeUsuariosBio(StrToInt(txtNumInner.Text), 0,
          @Quantidade);
        If (Ret = RET_COMANDO_OK) Then
        begin
          MessageDlg('Quantidade total de usuários: ' + InttoStr(Quantidade),
            mtInformation, [mbOk], 0);
          break;
        end;
        tentativas := tentativas + 1;
      until ((0 = Ret) or (tentativas > 50));
    End;

  End;

  // Fecha porta comunicação
  Finalizar();
  Screen.Cursor := crDefault;
  Application.ProcessMessages;

end;

Procedure TFrmEasyInnerTesteBio.ReceberUsuarioBio;
var
  nPacote, nUsuario, qtdTlp, tentativas: Integer;
begin
  // contadores
  nPacote := 0;
  nUsuario := 0;

  // Limpa lista de usuários
  lstUsuarios.Clear();
  ProgressBar1.Position := 0;
  ProgressBar1.Max := qtdTlp;
  // Inicia coleta usuários
  lblManutencao.Caption := 'Iniciando coleta de usuários...';
  InicializarColetaListaUsuariosBio();
  sleep(40);

  While TemProximoPacote() = 1 do
  begin
    repeat
      // Solicita uma parte(pacote) da lista de usuarios do bio
      Ret := SolicitarListaUsuariosBio(StrToInt(txtNumInner.Text));
      LblStatus.Caption := 'Solicitando pacote...';
      Application.ProcessMessages;
      // sleep(60);
    until (Ret <> RET_BIO_PROCESSANDO); // se ainda estava

    If (Ret = RET_COMANDO_OK) Then
    begin
      // Recebe uma parte da lista com os usuarios
      repeat
        Application.ProcessMessages;
        Ret := ReceberPacoteListaUsuariosBio(StrToInt(txtNumInner.Text));
        LblStatus.Caption := 'Recebendo pacote: ' + InttoStr(nPacote + 1);
        // Application.ProcessMessages;
        // sleep(60);
      until (Ret <> RET_BIO_PROCESSANDO);

      if (Ret = 0) then
      begin
        inc(nPacote);
        LblStatus.Caption := 'Recebeu pacote: ' + InttoStr(nPacote);
        Application.ProcessMessages;
      end
      else
      begin
        continue;
      end;

      // Verifica se existe um usuario
      While TemProximoUsuario() = 1 do
      begin
        // Pede um usuario da lista
        lstUsuarios.ItemIndex := lstUsuarios.Count;
        Application.ProcessMessages;
        sleep(10);
        Ret := ReceberUsuarioLista(StrToInt(txtNumInner.Text), @Usuario);

        If (Ret = RET_COMANDO_OK) Then
        begin
          inc(nUsuario);
          // Insere o usuario no listbox
          lstUsuarios.items.Add(Usuario);
        End;
      end;

    End
    else
    begin
      beep;

      // Em caso de erro
      case Ret of
        RET_COMANDO_ERRO:
          LblStatus.Caption := 'Erro ao abrir porta de comunicação';
        RET_PORTA_NAOABERTA:
          LblStatus.Caption := 'Porta não aberta';
        RET_PORTA_JAABERTA:
          LblStatus.Caption := 'Porta já aberta';
        RET_DLL_INNER2K_NAO_ENCONTRADA:
          LblStatus.Caption := 'DLL Inner2k não encontrada';
        RET_DLL_INNERTCP_NAO_ENCONTRADA:
          LblStatus.Caption := 'DLL InnerTCP não encontrada';
        RET_DLL_INNERTCP2_NAO_ENCONTRADA:
          LblStatus.Caption := 'DLL InnerTCP2 não encontrada';
        RET_ERRO_GPF:
          LblStatus.Caption := 'Ocorreu um erro dentro da DLL';
        RET_TIPO_CONEXAO_INVALIDA:
          LblStatus.Caption := 'Tipo de conexão inválida';
      else
        LblStatus.Caption := 'Erro ' + InttoStr(Ret);
      end;
    end;
    Application.ProcessMessages;
    ProgressBar1.Position := nUsuario;
  end;
  lblManutencao.Caption := 'Recebeu ' + InttoStr(nUsuario) + ' usuários';
  ProgressBar1.Position := 0;
  beep();
  Finalizar();
  Screen.Cursor := crDefault;
end;

Procedure TFrmEasyInnerTesteBio.ReceberUsuarioBioVariavel;
var
  nPacote, nUsuario, tentativas: Integer;
  Usr: String;
begin
  // contadores
  nPacote := 0;
  nUsuario := 0;
  // Limpa lista de usuários
  lstUsuarios.Clear();
  // Inicia coleta usuários
  lblManutencao.Caption := 'Iniciando coleta de usuários...';
  InicializarColetaListaUsuariosBio();
  sleep(40);

  While TemProximoPacote() = 1 do
  begin
    repeat
      sleep(20);
      Application.ProcessMessages;
      // Solicita uma parte(pacote) da lista de usuarios do bio
      Ret := SolicitarListaUsuariosBioVariavel(StrToInt(txtNumInner.Text));
      LblStatus.Caption := 'Solicitando pacote...';
      Application.ProcessMessages;
      // sleep(60);
    until (Ret <> RET_BIO_PROCESSANDO); // se ainda estava

    If (Ret = RET_COMANDO_OK) Then
    begin
      // Recebe uma parte da lista com os usuarios
      repeat
        Application.ProcessMessages;
        Ret := SolicitarListaUsuariosComDigital(StrToInt(txtNumInner.Text));
        Application.ProcessMessages;
        LblStatus.Caption := 'Recebendo pacote: ' + InttoStr(nPacote + 1);
        // Application.ProcessMessages;
        // sleep(60);
      until (Ret <> RET_BIO_PROCESSANDO);

      if (Ret = 0) then
      begin
        inc(nPacote);
        LblStatus.Caption := 'Recebeu pacote: ' + InttoStr(nPacote);
        Application.ProcessMessages;
      end
      else
      begin
        continue;
      end;

      // Verifica se existe um usuario
      While TemProximoUsuario() = 1 do
      begin
        // Pede um usuario da lista
        lstUsuarios.ItemIndex := lstUsuarios.Count - 1;
        Application.ProcessMessages;
        sleep(20);
        Ret := ReceberUsuarioComDigital(@bUsuario);
        Application.ProcessMessages;
        If (Ret = RET_COMANDO_OK) Then
        begin
          inc(nUsuario);
          Usr := '';
          for i := 0 to 7 do
          Begin
            if (ord(bUsuario[i]) <= 9) then
            begin
              Usr := Usr + '0' + InttoStr(ord(bUsuario[i]));
            end
            else
            begin
              Usr := Usr + InttoStr(ord(bUsuario[i]));
            end;
          end;
          // Insere o usuario no listbox
          lstUsuarios.items.Add(Usr);
          ProgressBar1.Position := nUsuario;
        End;
      end;

    End
    else
    begin
      // Em caso de erro
      case Ret of
        RET_COMANDO_ERRO:
          LblStatus.Caption := 'Erro ao abrir porta de comunicação';
        RET_PORTA_NAOABERTA:
          LblStatus.Caption := 'Porta não aberta';
        RET_PORTA_JAABERTA:
          LblStatus.Caption := 'Porta já aberta';
        RET_DLL_INNER2K_NAO_ENCONTRADA:
          LblStatus.Caption := 'DLL Inner2k não encontrada';
        RET_DLL_INNERTCP_NAO_ENCONTRADA:
          LblStatus.Caption := 'DLL InnerTCP não encontrada';
        RET_DLL_INNERTCP2_NAO_ENCONTRADA:
          LblStatus.Caption := 'DLL InnerTCP2 não encontrada';
        RET_ERRO_GPF:
          LblStatus.Caption := 'Ocorreu um erro dentro da DLL';
        RET_TIPO_CONEXAO_INVALIDA:
          LblStatus.Caption := 'Tipo de conexão inválida';
      else
        LblStatus.Caption := 'Erro ' + InttoStr(Ret);
      end;
    end;
    Application.ProcessMessages;

  end;
  lblManutencao.Caption := 'Recebeu ' + InttoStr(nUsuario) + ' usuários';
end;

// ***********************************************************************************
// Receber Usuários cadastrados no Inner Bio
// Retorna todos os usuários cadastrados
// ***********************************************************************************
Procedure TFrmEasyInnerTesteBio.cmdReceberTodosUsuariosClick(Sender: TObject);
begin

  // Mensagem Status
  Application.ProcessMessages;
  Screen.Cursor := crHourGlass;
  lblManutencao.Caption := 'Recebendo todos os usuários...';

  ReceberUsuarios;

  ProgressBar1.Position := 0;
  Finalizar();
  Screen.Cursor := crDefault;

end;

Procedure TFrmEasyInnerTesteBio.ReceberUsuarios;
var
  qtdTlp, tentativas: Integer;
begin

  // Se conectar Inner
  If Conectar() Then
  begin
    Application.ProcessMessages;
    // Solicita a quantidade de usuários cadastrados no Inner Bio.
    Ret := SolicitarQuantidadeUsuariosBio(StrToInt(txtNumInner.Text));
    tentativas := 0;
    If (Ret = RET_COMANDO_OK) Then
    begin
      Ret := RET_BIO_PROCESSANDO;
      SetarTimeoutBio();
      repeat
        // Retorna a quantidade de usuários cadastrados no Inner Bio
        Application.ProcessMessages;
        Ret := ReceberQuantidadeUsuariosBio(StrToInt(txtNumInner.Text),
          0, @qtdTlp);
        tentativas := tentativas + 1;
      until ((Ret = RET_COMANDO_OK) or (tentativas > 10));
    End;
    ProgressBar1.Max := qtdTlp;

    if (CapturaVersaoPlaca < 5) then
    begin
      ReceberUsuarioBio;
    end
    else
    begin
      ReceberUsuarioBioVariavel;
    end;
  end
  else
  begin
    MessageDlg('Erro ao conectar', mtInformation, [mbOk], 0);
  end;

  ProgressBar1.Position := 0;
  Finalizar();
  Screen.Cursor := crDefault;
end;

// ***********************************************************************************
// Receber Modelo Bio
// O modelo do Inner Bio é retornado.
// ***********************************************************************************
Procedure TFrmEasyInnerTesteBio.cmdReceberModeloClick(Sender: TObject);
var
  Modelo: Integer;
  tentativas: Integer;
begin

  Screen.Cursor := crHourGlass;

  // Mensagem Status
  LblStatus.Caption := 'Recebendo Modelo Bio...';
  tentativas := 0;
  Application.ProcessMessages;
  If Conectar() Then
  begin

    // Envia comando solicitando modelo do BIO...
    Ret := SolicitarModeloBio(StrToInt(txtNumInner.Text));
    If Ret = RET_COMANDO_OK Then
    begin
      repeat
        sleep(5);

        // Envia solicitação de resposta..
        Ret := ReceberModeloBio(StrToInt(txtNumInner.Text), 0, @Modelo);
        If Ret = RET_COMANDO_OK Then
        begin
          Case Modelo of
            2:
              MessageDlg('Modelo do bio: Light usuários (FIM10).',
                mtInformation, [mbOk], 0);
            4:
              MessageDlg('Modelo do bio: 5000 usuários (FIM01).', mtInformation,
                [mbOk], 0);
            51:
              MessageDlg('Modelo do bio: 5000 usuários (FIM2030).',
                mtInformation, [mbOk], 0);
            52:
              MessageDlg('Modelo do bio: 5000 usuários (FIM2040).',
                mtInformation, [mbOk], 0);
            48:
              MessageDlg('Modelo do bio: Light 100 usuários (FIM3030).',
                mtInformation, [mbOk], 0);
            64:
              MessageDlg('Modelo do bio: Light 1000 usuários (FIM3040).',
                mtInformation, [mbOk], 0);
            80:
              MessageDlg('Modelo do bio: 5000 usuários FIM5060.', mtInformation,
                [mbOk], 0);
            82:
              MessageDlg('Modelo do bio: 5000 usuários FIM5260.', mtInformation,
                [mbOk], 0);
            83:
              MessageDlg('Modelo do bio: Light 1000 usuários FIM5360.',
                mtInformation, [mbOk], 0);

            96:
              MessageDlg('Modelo do bio: FIM6060.', mtInformation, [mbOk], 0);
            255:
              MessageDlg('Modelo do bio: Desconhecido', mtInformation,
                [mbOk], 0);
          End;
          break;
        End;
        tentativas := tentativas + 1;
      until (not(Ret = RET_BIO_PROCESSANDO) or (tentativas < 20));

      If (Ret <> RET_COMANDO_OK) then
      Begin
        MessageDlg('Erro ao Receber ModeloBio', mtInformation, [mbOk], 0);
      END;
    End;
  End;
  Finalizar();
  Screen.Cursor := crDefault;

end;

// ***********************************************************************************
// Receber Versão Bio
// A versão do Inner Bio é retornado.
// ***********************************************************************************
Procedure TFrmEasyInnerTesteBio.cmdReceberVersaoClick(Sender: TObject);
var
  VersaoAlta, VersaoBaixa: Integer;

begin

  Screen.Cursor := crHourGlass;

  // Mensagem Status
  LblStatus.Caption := 'Recebendo Versão Bio...';
  Application.ProcessMessages;

  // Conecta com o Inner..
  If Conectar() Then
  begin

    // Envia Comando solicitando versão..
    Ret := SolicitarVersaoBio(StrToInt(txtNumInner.Text));
    sleep(250);
    If Ret = RET_COMANDO_OK Then
    begin
      Ret := RET_BIO_PROCESSANDO;

      While Ret = RET_BIO_PROCESSANDO do
      begin
        Ret := ReceberVersaoBio(StrToInt(txtNumInner.Text), 0, @VersaoAlta,
          @VersaoBaixa);

        If Ret = RET_COMANDO_OK Then
          MessageDlg('A versão do inner bio é ' + InttoStr(VersaoAlta) + '.' +
            InttoStr(VersaoBaixa), mtInformation, [mbOk], 0);
      End;
    End;
  End;

  Finalizar();
  Screen.Cursor := crDefault;

end;

// ***********************************************************************************
// Inserir usuário sem digital no leitor
// ***********************************************************************************
Procedure TFrmEasyInnerTesteBio.cmdInserirUsrListaClick(Sender: TObject);
begin
  { Screen.Cursor := crHourGlass;
    Ret := IncluirUsuarioSemDigitalBio(txtUsuario.Text);

    If Ret = RET_COMANDO_OK Then
    begin
    MessageDlg('Usuário inserido com sucesso!', mtInformation, [mbOk], 0);
    End;
    Screen.Cursor := crDefault; }
end;

// ***********************************************************************************
// Envio Lista de Usuários sem digital
// ***********************************************************************************
Procedure TFrmEasyInnerTesteBio.cmdEnviarListaClick(Sender: TObject);
var
  i: Integer;
  cartao: string;
begin
  Screen.Cursor := crHourGlass;
  for i := 1 to sgUsuariosDigital.RowCount - 1 do
  Begin
    if (sgUsuariosDigital.Cells[0, i] <> '') then
    Begin
      cartao := sgUsuariosDigital.Cells[0, i];
      IncluirUsuarioSemDigitalBio(cartao);
    end;
  end;
  If (Conectar()) Then
  begin
    Ret := EnviarListaUsuariosSemDigitalBio(StrToInt(txtNumInner.Text));

    If Ret = RET_COMANDO_OK Then
    begin
      MessageDlg('Lista de usuários sem digital enviada com sucesso!',
        mtInformation, [mbOk], 0);
    End;
  end;

  Finalizar();
  Screen.Cursor := crDefault;
  Application.ProcessMessages;
end;

// ***********************************************************************************
// Configuração do Inner
// Método que realiza as configurações Biométricas para um Inner Bio
// ***********************************************************************************
Procedure TFrmEasyInnerTesteBio.cmdConfigurarBioClick(Sender: TObject);
var
  Identificacao, Verificacao: Integer;
begin
  Screen.Cursor := crHourGlass;

  // Mensagem Status
  LblStatus.Caption := 'Enviando Configuração Bio...';
  Application.ProcessMessages;

  // Tenta realizar a conexão para realizar o envio de configurações..
  If Conectar() Then
  begin

    CapturaVersaoPlaca();

    // Se Biometria
    If ((LinhaInner = 6) Or ((LinhaInner = 14))) Then
      DefinirFuncaoDefaultSensorBiometria(10)
    else
      DefinirFuncaoDefaultSensorBiometria(0);

    // Verifica se estão checados os campos verificação e Identificação..

    if chkHabIdentificacao.Checked = true then
      Identificacao := 1
    else
      Identificacao := 0;

    if chkHabVerificacao.Checked = true then
      Verificacao := 1
    else
      Verificacao := 0;

    repeat

      // Envia a Configuração de BIO para Inner.
      Ret := ConfigurarBio(StrToInt(txtNumInner.Text), Identificacao,
        Verificacao);
      If Ret = RET_COMANDO_OK Then
      begin
        repeat
          Ret := ResultadoConfiguracaoBio(StrToInt(txtNumInner.Text), 0);
          If Ret = RET_COMANDO_OK Then
          begin
            MessageDlg('Inner bio configurado com sucesso!', mtInformation,
              [mbOk], 0);
            break;
          End;
          sleep(10);
        until (Ret <> RET_BIO_PROCESSANDO);
        break;
      end;
      sleep(10);
    until (Ret <> RET_BIO_PROCESSANDO);
  End;
  Finalizar();

  Screen.Cursor := crDefault;
end;

// ***********************************************************************************
// Cadastrar Novo Usuário no Leitor Bio
// Cadastra a 1º e 2º digital do usuário na memória do Inner Bio.
// ***********************************************************************************
Procedure TFrmEasyInnerTesteBio.cmdCadastrarClick(Sender: TObject);
var
  Usuario: String;
begin

  // Campo obrigatório
  if (trim(EdtUsuario.Text) = '') then
  begin
    MessageDlg('Preencha o Nº do usuário para cadastro', mtInformation,
      [mbOk], 0);
    EdtUsuario.SetFocus;
    exit;
  end;

  // Mensagem Status
  LblStatus.Caption := 'Cadastrando Usuário ' + EdtUsuario.Text;
  Application.ProcessMessages;
  Screen.Cursor := crHourGlass;

  // Conecta com o Inner.
  If Conectar() Then
  begin

    // Se BioLight
    if BioLigth then
      SetarBioLight(1);

    Usuario := EdtUsuario.Text;

    // Inserção da primeira digital
    MessageDlg('Posicione a primeira digital', mtInformation, [mbOk], 0);
    if (not(inserirTemplateUsr(Usuario, 0))) then
    begin
      Screen.Cursor := crDefault;
      exit;
    end;
    sleep(20);

    // Inserção da segunda digital
    MessageDlg('Posicione a segunda digital', mtInformation, [mbOk], 0);
    if (not(inserirTemplateUsr(Usuario, 2))) then
    begin
      Screen.Cursor := crDefault;
      exit;
    end;
    MessageDlg('Usuário cadastrado!', mtInformation, [mbOk], 0);
  End;

  // Fechar porta comunicação
  Finalizar();
  Screen.Cursor := crDefault;
end;

// ***********************************************************************************
// APAGA O CARTÃO 'Usuário'
// Verifica se o usuário existe, se sim, exclui e retorna.
// ***********************************************************************************
Procedure TFrmEasyInnerTesteBio.cmdExcluirUsuarioClick(Sender: TObject);
var
  tentativas: Integer;
  Template: array [0 .. 403] of byte;
begin
  Screen.Cursor := crHourGlass;

  // Mensagem Status
  LblStatus.Caption := 'Excluindo Usuário ' + EdtUsuario.Text;
  Application.ProcessMessages;

  tentativas := 0;
  // Conecta
  If Conectar() Then
  begin
    SolicitarTemplateLeitor(StrToInt(txtNumInner.Text));
    sleep(100);
    // Testa o Retorno do comando de Envio de Relógio..
    repeat
      // Vai para o passo de Envio de Msg Padrão..
      Ret := ReceberTemplateLeitor(StrToInt(txtNumInner.Text), 0, @Template);
      sleep(300); // aguardar a captura da digital
      tentativas := tentativas + 1;
    until ((Ret = 0) or (tentativas > 50));

    lblManutencao.Caption := IntegerToHex(Template);
    MessageDlg('Digital recebida !', mtInformation, [mbOk], 1);

  End;

  Finalizar();
  Screen.Cursor := crDefault;
end;

// ***********************************************************************************
// Envia usuário para a memória
// ***********************************************************************************
Procedure TFrmEasyInnerTesteBio.cmdEnviarUsuarioClick(Sender: TObject);
begin
  If Conectar() Then
  begin

    // Envia um template com duas digitais para o Inner Bio cadastrar no seu banco de dados.
    Ret := EnviarUsuarioBio(StrToInt(txtNumInner.Text), @Template);

    If Ret = RET_COMANDO_OK Then
    begin
      Ret := RET_BIO_PROCESSANDO;
      While Ret = RET_BIO_PROCESSANDO do
      begin
        Ret := UsuarioFoiEnviado(StrToInt(txtNumInner.Text), 0);

        If Ret = RET_COMANDO_OK Then
        begin
          MessageDlg('Usuário enviado com sucesso!', mtInformation, [mbOk], 0);
        End;
      End;
    End;
  End;
  // Fecha porta de comunicação
  Finalizar();

end;

// ***********************************************************************************
// Seleção Tipo de Conexão
// Carrega o campo porta de acordo com a seleção
// ***********************************************************************************
Procedure TFrmEasyInnerTesteBio.cboTipoConexaoChange(Sender: TObject);
begin
  if (cboTipoConexao.ItemIndex = 0) then
    txtPorta.Text := '1'
  else
    txtPorta.Text := '3570';

end;

// ***********************************************************************************
// MONTAR CONFIGURAÇÕES
// Esta rotina monta o buffer para enviar a configuração do Inner
// ***********************************************************************************
Procedure TFrmEasyInnerTesteBio.MontarConfiguracao;
Var
  Versao: Integer;
begin

  // Configurações
  DefinirPadraoCartao(cboPadraoCartao.ItemIndex);
  DefinirQuantidadeDigitosCartao(StrToInt(txtQtdeDigitos.Text));

  // Modo Offline
  ConfigurarInnerOffLine();

  // Configurações
  HabilitarTeclado(1, 0);
  DefinirQuantidadeDigitosCartao(StrToInt(txtQtdeDigitos.Text));
  ConfigurarTipoLeitor(cboTipoLeitor.ItemIndex);
  ConfigurarLeitor1(3);
  ConfigurarAcionamento1(1, 5);

  Versao := CapturaVersaoPlaca();
  //if Versao >= 5 then
  //Begin
  //  ConfigurarBioVariavel(1);
  //End;

  // Configura o tipo de registro que será associado a uma marcação, quando for inserido
  // o dedo do Inner bio sem que o usuário tenha definido se é um entrada, saída, função...
  If ((LinhaInner = 6) Or ((LinhaInner = 14))) Then
    DefinirFuncaoDefaultSensorBiometria(10)
  else
    DefinirFuncaoDefaultSensorBiometria(0);
end;

// ***********************************************************************************
// Configuração do Inner
// ***********************************************************************************
Procedure TFrmEasyInnerTesteBio.cmdConfigurarInnerClick(Sender: TObject);
var
  Identificacao, Verificacao, Mensagem: Integer;
begin

  Mensagem := 0;

  // Campo obrigatório
  if cboTipoLeitor.ItemIndex = -1 then
  begin
    MessageDlg('Favor selecionar um tipo de leitor !', mtWarning, [mbOk], 0);
    exit;
  end;

  // Mensagem Status
  LblStatus.Caption := 'Enviando Configuração...';
  Application.ProcessMessages;
  Screen.Cursor := crHourGlass;

  // Verifica se estão checados os campos validação e Identificação..

  If chkHabIdentificacao.Checked = true Then
    Identificacao := 1
  Else
    Identificacao := 0;

  If (chkHabIdentificacao.Checked = true) Then
    Verificacao := 1
  Else
    Verificacao := 0;

  // Conexão INNER
  If Conectar() Then
  begin

    // Configuração INNER
    MontarConfiguracao();

    Ret := EnviarConfiguracoes(StrToInt(txtNumInner.Text));

    If Ret <> RET_COMANDO_OK Then
      Mensagem := 1;

    // Configuração INNER BIO
    If (Identificacao = 1) Or (Verificacao = 1) Then

      // Mensagem Status
      LblStatus.Caption := 'Enviando Configuração Bio...';
    Application.ProcessMessages;

    repeat
      Ret := ConfigurarBio(StrToInt(txtNumInner.Text), Identificacao,
        Verificacao);
      If Ret = RET_COMANDO_OK Then
      begin
        repeat
          Ret := ResultadoConfiguracaoBio(StrToInt(txtNumInner.Text), 0);
          If Ret <> RET_COMANDO_OK Then
          begin
            Mensagem := 2;
            break;
          End;
          sleep(10);
        until (Ret <> RET_BIO_PROCESSANDO);
        break;
      end;
      sleep(10);
    until (Ret <> RET_BIO_PROCESSANDO);
  end
  else
  Begin
    Mensagem := 1;
  End;

  if Mensagem = 0 then
    MessageDlg('Configuração enviada com sucesso!', mtInformation, [mbOk], 0)
  else
  begin
    if Mensagem = 1 then
      MessageDlg('Erro ao enviar a configuração!', mtError, [mbOk], 0)
    else
      MessageDlg('Erro ao configurar o Inner bio!', mtError, [mbOk], 0);
  end;

  Screen.Cursor := crDefault;
  // Fecha Porta Comunicação
  Finalizar();
end;

// ***********************************************************************************
// Retorna o modelo BioLight
// ***********************************************************************************
function TFrmEasyInnerTesteBio.BioLigth: boolean;
var
  placaLight: boolean;
  Ret: Integer;
  Modelo: Integer;

begin
  placaLight := false;

  // Solicita Modelo
  Ret := SolicitarModeloBio(StrToInt(txtNumInner.Text));
  repeat

    If Ret = RET_COMANDO_OK Then
    begin
      sleep(5);

      // Recebe Modelo
      Ret := ReceberModeloBio(StrToInt(txtNumInner.Text), 0, @Modelo);
      If Ret = RET_COMANDO_OK Then
      begin
        Case Modelo of
          2:
            begin
              lblManutencao.Caption :=
                'Modelo do bio: Light usuários  := FIM10).';
              placaLight := true;
              break;
            end;
          4:
            lblManutencao.Caption :=
              'Modelo do bio: 1000/4000 usuários  := FIM01).';
          51:
            lblManutencao.Caption :=
              'Modelo do bio: 1000/4000 usuários  := FIM2030).';
          52:
            lblManutencao.Caption :=
              'Modelo do bio: 1000/4000 usuários  := FIM2040).';
          48:
            begin
              lblManutencao.Caption :=
                'Modelo do bio: Light 100 usuários  := FIM3030).';
              placaLight := true;
              break;
            end;
          64:
            begin
              lblManutencao.Caption :=
                'Modelo do bio: Light 100 usuários  := FIM3040).';
              placaLight := true;
              break;
            end;
          80:
            lblManutencao.Caption :=
              'Modelo do bio: 1000/4000 usuários FIM5060.';
          82:
            lblManutencao.Caption :=
              'Modelo do bio: 1000/4000 usuários FIM5260.';
          83:
            begin
              lblManutencao.Caption :=
                'Modelo do bio: Light 100 usuários FIM5360.';
              placaLight := true;
              break;
            end;
          255:
            lblManutencao.Caption := 'Modelo do bio: Desconhecido';
        End;
        break;
      End;
    End;
  until (not(Ret = RET_BIO_PROCESSANDO));
  result := placaLight;
end;

// ***********************************************************************************
// CONECTAR
// Rotina responsável por efetuar a conexão com o Inner
// ***********************************************************************************
function TFrmEasyInnerTesteBio.Conectar: boolean;
var
  Fim: double;
begin

  // Define o tipo de conexão selecionada no Combo..
  DefinirTipoConexao(cboTipoConexao.ItemIndex);

  // Fecha as conexões caso esteja aberta..
  FecharPortaComunicacao();

  // Abre a porta de Conexão conforme a Porta Indicada..

  Ret := AbrirPortaComunicacao(StrToInt(txtPorta.Text));
  Application.ProcessMessages;
  Conectar := false;

  // Tenta Realizar a Conexão por Até 15 s..
  If (Ret = RET_COMANDO_OK) Then
  begin
    Ret := RET_COMANDO_ERRO;

    // Registra o tempo fim de conexão (tempo atual +15)
    Fim := Retornar_SegundosSys() + 15;

    while (Retornar_SegundosSys() <= Fim) And (Ret <> RET_COMANDO_OK) do
    begin
      Application.ProcessMessages;
      Ret := testaConexaoInner(StrToInt(txtNumInner.Text));
      sleep(20);

    end;
    Application.ProcessMessages;
    If (Ret = RET_COMANDO_OK) Then
      lblManutencao.Caption := 'Conectou ao Inner!'
    else
    begin
      lblManutencao.Caption := 'Não conectou ao Inner!';
      Screen.Cursor := crDefault;
    end;

    Conectar := true;
  End
  else
    showFalhaConexao;

  Application.ProcessMessages;

end;

Procedure TFrmEasyInnerTesteBio.enviarTodosTlp(placaLight: boolean);
var
  Ret1, Ret2, tentativas, j, i, x, k: Integer;
  linha: array [0 .. 843] of byte;
  tempConv: array [0 .. 404] of byte;
  TemplateA, TemplateB, cartao: String;
  sai: byte;
  conv: array [0 .. 1] of Char;
  Year, Month, Day, Hour, Min, Sec, MSec: String;
begin

    ADOConnection1.Close;
    ADOConnection1.Open;
    ADODataSetUsuarioBio.Close;
    ADODataSetUsuarioBio.CommandText := ' select * from UsuariosBio order by Codigo';
    ADODataSetUsuarioBio.Open;
    ADODataSetUsuarioBio.RecordCount;
    //Vai para o primeiro registrado retornado consulta
    ADODataSetUsuarioBio.First;

    while (not(ADODataSetUsuarioBio.Eof)) do
    begin

      // Carrega os dados do usuário
      cartao := IntToStr(StrToInt64(ADODataSetUsuarioBioCartao.Value));
      TemplateA :=ADODataSetUsuarioBioTemplate1.Value ;
      TemplateB := ADODataSetUsuarioBioTemplate2.Value;

      // Limpa linha
      for i := 0 to 843 do
      begin
        linha[i] := 0;
      end;

      // Master
      linha[0] := 0;

      // Usuário
      if not placaLight then
      begin
        for i := 1 to 10 - length(cartao) do
        begin
          linha[i] := ord('0');
        end;
      end
      else // Placa light
      begin
        for i := 1 to 8 - length(cartao) do
        begin
          linha[i] := ord('0');
        end;
      end;
      // Template A
      i := 1;
      if not placaLight then
      begin
        cartao := CompletaString(cartao, 10, '0');
        for j := 1 to length(cartao) do
        begin
          linha[i] := StrToInt(copy(cartao, j, 1)) + 48;
          inc(i);
        end;
        i := 28;
        k := 0;
        for j := 1 to 808 do
        begin
          if j mod 2 = 1 then
          begin
            StrPCopy(conv, copy(TemplateA, j, 2));
            HexToBin(conv, @sai, 1);
            tempConv[k] := sai;
            k := k + 1;
          end;
        end;

        for j := 0 to 404 do
        begin
          linha[i] := tempConv[j];
          i := i + 1;
        end;
      end
      else // Placa light
      begin
        cartao := CompletaString(cartao, 8, '0');
        for j := 1 to length(cartao) do
        begin
          linha[i] := StrToInt(copy(cartao, j, 1)) + 48;
          i := i + 1;
        end;
        i := 27;
        k := 0;
        for j := 0 to 807 do
        begin
          if j mod 2 = 0 then
          begin
            StrPCopy(conv, copy(TemplateA, j + 1, 2));
            HexToBin(conv, @sai, 1);
            tempConv[k] := sai;
            k := k + 1;
          end;
        end;

        EnvioObjFPData.Import(1, 0, 1, 7, 404, tempConv[0]);
        EnvioObjFPData.Export(EnvioObjFPData.FIR, 6);
        byFIR := EnvioObjFPData.FPData[0, 0];

        for j := 0 to 399 do
        begin
          linha[i] := byFIR[j];
          i := i + 1;
        end;
      end;

      // Template B
      if not placaLight then
      begin
        i := 432;
        k := 0;
        for j := 1 to 808 do
        begin
          if j mod 2 = 1 then
          begin
            StrPCopy(conv, copy(TemplateB, j, 2));
            HexToBin(conv, @sai, 1);
            tempConv[k] := sai;
            k := k + 1;
          end;
        end;

        for j := 0 to 404 do
        begin
          linha[i] := tempConv[j];
          i := i + 1;
        end;
      end
      else // Placa light
      begin
        i := 427;
        k := 0;
        for j := 0 to 807 do
        begin
          if j mod 2 = 0 then
          begin
            StrPCopy(conv, copy(TemplateB, j + 1, 2));
            HexToBin(conv, @sai, 1);
            tempConv[k] := sai;
            k := k + 1;
          end;
        end;
        EnvioObjFPData.Import(1, 1, 1, 7, 404, tempConv[0]);
        EnvioObjFPData.Export(EnvioObjFPData.FIR, 6);
        byFIR := EnvioObjFPData.FPData[1, 0];

        for j := 0 to 399 do
        begin
          linha[i] := byFIR[i - 427];
          i := i + 1;
        end;
      end;

      if not placaLight then
      begin

        Year := FormatDateTime('yyyy', Date);
        Month := FormatDateTime('mm', Date);
        Day := FormatDateTime('dd', Date);
        Hour := FormatDateTime('hh', Time);
        Min := FormatDateTime('nn', Time);
        Sec := FormatDateTime('ss', Time);

        linha[836] := StrToInt(Year) div 100;
        linha[837] := StrToInt(Year) mod 100;
        linha[838] := StrToInt(Month);
        linha[839] := StrToInt(Day);
        linha[840] := StrToInt(Hour);
        linha[841] := StrToInt(Min);
        linha[842] := StrToInt(Sec);
        linha[843] := 0;
      end
      else
        SetarBioLight(1);

      // Envia um template com duas digitais para o Inner Bio cadastrar no seu banco de dados.
      tentativas := 0;

      Application.ProcessMessages;
      sleep(40);
      Ret1 := EnviarUsuarioBio(StrToInt(txtNumInner.Text), @linha);
      tentativas := tentativas + 1;

      tentativas := 0;
      If (Ret1 = RET_COMANDO_OK) Then
      begin
        repeat
          Ret2 := UsuarioFoiEnviado(StrToInt(txtNumInner.Text), 0);

          If (Ret2 = RET_COMANDO_OK) Then
          Begin
            iOk := iOk + 1;
          end
          else if (Ret2 = RET_BIO_USR_JA_CADASTRADO) then
          Begin
            iJaCadast := iJaCadast + 1;
          end
          else if (Ret2 = RET_BIO_FALHA_COMUNICACAO) then
          Begin
            iFalhaCom := iFalhaCom + 1;
            if (iFalhaCom = 3) then
              break;
          end
          else if (Ret2 = RET_BIO_TEMPLATE_INVALIDO) then
          Begin
            iTplInvalido := iTplInvalido + 1;
            if (iTplInvalido = 2) then
              break;
          end
          else if (Ret2 = RET_BIO_PARAMETROS_INVALIDOS) then
          Begin
            iParInvalido := iParInvalido + 1;
            if (iParInvalido = 2) then
              break;
          end
          else if (Ret2 = RET_BIO_BASE_CHEIA) then
          Begin
            blnBase := true;
            break;
          end;
          tentativas := tentativas + 1;
        until ((Ret2 <> RET_BIO_PROCESSANDO) or (tentativas > 10));
      end
      else
      Begin
        iFalhaEnvio := iFalhaEnvio + 1;
      end;
      if (iTplInvalido = 2) then
      Begin
        lblManutencao.Caption := 'Template inválido, verifique o template!';
        break;
      end
      else if (iParInvalido = 2) then
      Begin
        lblManutencao.Caption := 'Parametros inválidos!';
        break;
      end
      else if (blnBase) then
      Begin
        lblManutencao.Caption := 'Base do inner cheia!';
        break;
      end
      else
      Begin
        lblManutencao.Alignment := taRightJustify;
        lblManutencao.Caption := 'ENVIADOS: ' + InttoStr(iOk);
        lblManutencao.Caption := lblManutencao.Caption + chr(13) +
          'JÁ CADASTRADOS: ' + InttoStr(iJaCadast);
        lblManutencao.Caption := lblManutencao.Caption + chr(13) + 'FALHA ENVIO: '
          + InttoStr(iFalhaEnvio);
      end;
  end;
end;

Procedure TFrmEasyInnerTesteBio.EnviarUsuarioBioVariavel(cartao: AnsiString;
  TemplateA: AnsiString; TemplateB: AnsiString);
var
  Ret, tentativas, j, i, k: Integer;
  tempConv: array [0 .. 404] of byte;
  sai: byte;
  conv: array [0 .. 1] of Char;
  Year, Month, Day, Hour, Min, Sec: string;

begin

  i := 0;
  k := 0;
  for j := 1 to 808 do
  begin
    if j mod 2 = 1 then
    begin
      StrPCopy(conv, copy(TemplateA, j, 2));
      HexToBin(conv, @sai, 1);
      DigitalEnvio1[k] := sai;
      k := k + 1;
    end;
  end;

  i := 0;
  k := 0;
  for j := 1 to 808 do
  begin
    if j mod 2 = 1 then
    begin
      StrPCopy(conv, copy(TemplateB, j, 2));
      HexToBin(conv, @sai, 1);
      DigitalEnvio2[k] := sai;
      k := k + 1;
    end;
  end;

  Application.ProcessMessages;
  sleep(20);
  if (RdbDigital2.Checked) then
  begin
    Ret := EnviarDigitalUsuario(StrToInt(txtNumInner.Text), cartao,
      @DigitalEnvio1, @DigitalEnvio2);
  end
  else
  begin
    Ret := EnviarDigitalUsuario(StrToInt(txtNumInner.Text), cartao,
      @DigitalEnvio1, @EmptyDigital);
  end;

  if (Ret = RET_COMANDO_OK) then
  begin
    repeat
      Application.ProcessMessages;
      Ret := UsuarioFoiEnviado(StrToInt(txtNumInner.Text), 0);
      sleep(20);
      If (Ret = RET_COMANDO_OK) Then
      Begin
        iOk := iOk + 1;
        break;
      end
      else if (Ret = RET_BIO_USR_JA_CADASTRADO) then
      Begin
        iJaCadast := iJaCadast + 1;
        break;
      end
      else if (Ret = RET_BIO_FALHA_COMUNICACAO) then
      Begin
        iFalhaCom := iFalhaCom + 1;
        if (iFalhaCom = 3) then
          break;
      end
      else if (Ret = RET_BIO_TEMPLATE_INVALIDO) then
      Begin
        iTplInvalido := iTplInvalido + 1;
        if (iTplInvalido = 2) then
          break;
      end
      else if (Ret = RET_BIO_PARAMETROS_INVALIDOS) then
      Begin
        iParInvalido := iParInvalido + 1;
        if (iParInvalido = 2) then
          break;
      end
      else if (Ret = RET_BIO_BASE_CHEIA) then
      Begin
        blnBase := true;
        break;
      end;

      tentativas := +tentativas;
    until ((Ret <> RET_BIO_PROCESSANDO) or (tentativas > 10));

    lblManutencao.Alignment := taRightJustify;
    lblManutencao.Caption := 'ENVIADOS: ' + InttoStr(iOk);
    lblManutencao.Caption := lblManutencao.Caption + chr(13) +
      'JÁ CADASTRADOS: ' + InttoStr(iJaCadast);
    lblManutencao.Caption := lblManutencao.Caption + chr(13) + 'FALHA ENVIO: ' +
      InttoStr(iFalhaEnvio);

  end;

end;

Procedure TFrmEasyInnerTesteBio.EnviarUsuario
  (cartao: AnsiString; TemplateA: AnsiString; TemplateB: AnsiString; placaLight: boolean);
var
  Ret, tentativas, j, i, k: Integer;
  linha: array [0 .. 843] of byte;
  tempConv: array [0 .. 404] of byte;
  // TemplateA,
  // TemplateB,
  // cartao: string;
  sai: byte;
  conv: array [0 .. 1] of Char;
  Year, Month, Day, Hour, Min, Sec: string;
  ValorData: string;
begin
  // Limpa linha
  for i := 0 to 843 do
  begin
    linha[i] := 0;
  end;

  // Master
  linha[0] := 0;

  // Usuário
  if not placaLight then
  begin

    if length(cartao) > 10 then
    begin
      cartao := copy(cartao, length(cartao) - 10, length(cartao));
    end;

    for i := 1 to 10 - length(cartao) do
    begin
      linha[i] := ord('0');
    end;
  end
  else // Placa light
  begin
    if length(cartao) > 8 then
    begin
      cartao := copy(cartao, length(cartao) - 10, length(cartao));
    end;

    for i := 1 to 8 - length(cartao) do
    begin
      linha[i] := ord('0');
    end;
  end;
  // Template A
  i := 1;
  if not placaLight then
  begin
    cartao := CompletaString(cartao, 10, '0');
    for j := 1 to length(cartao) do
    begin
      linha[i] := StrToInt(copy(cartao, j, 1)) + 48;
      inc(i);
    end;
    i := 28;
    k := 0;
    for j := 1 to 808 do
    begin
      if j mod 2 = 1 then
      begin
        StrPCopy(conv, copy(TemplateA, j, 2));
        HexToBin(conv, @sai, 1);
        tempConv[k] := sai;
        k := k + 1;
      end;
    end;

    for j := 0 to 404 do
    begin
      linha[i] := tempConv[j];
      i := i + 1;
    end;
  end
  else // Placa light
  begin
    cartao := CompletaString(cartao, 8, '0');
    for j := 1 to length(cartao) do
    begin
      linha[i] := StrToInt(copy(cartao, j, 1)) + 48;
      i := i + 1;
    end;
    i := 27;
    k := 0;
    for j := 0 to 807 do
    begin
      if j mod 2 = 0 then
      begin
        StrPCopy(conv, copy(TemplateA, j + 1, 2));
        HexToBin(conv, @sai, 1);
        tempConv[k] := sai;
        k := k + 1;
      end;
    end;

    EnvioObjFPData.Import(1, 0, 1, 7, 404, tempConv[0]);
    EnvioObjFPData.Export(EnvioObjFPData.FIR, 6);
    byFIR := EnvioObjFPData.FPData[0, 0];

    for j := 0 to 399 do
    begin
      linha[i] := byFIR[j];
      i := i + 1;
    end;
  end;

  // Template B
  if not placaLight then
  begin
    i := 432;
    k := 0;
    for j := 1 to 808 do
    begin
      if j mod 2 = 1 then
      begin
        StrPCopy(conv, copy(TemplateB, j, 2));
        HexToBin(conv, @sai, 1);
        tempConv[k] := sai;
        k := k + 1;
      end;
    end;

    for j := 0 to 404 do
    begin
      linha[i] := tempConv[j];
      i := i + 1;
    end;
  end
  else // Placa light
  begin
    i := 427;
    k := 0;
    for j := 0 to 807 do
    begin
      if j mod 2 = 0 then
      begin
        StrPCopy(conv, copy(TemplateB, j + 1, 2));
        HexToBin(conv, @sai, 1);
        tempConv[k] := sai;
        k := k + 1;
      end;
    end;
    EnvioObjFPData.Import(1, 1, 1, 7, 404, tempConv[0]);
    EnvioObjFPData.Export(EnvioObjFPData.FIR, 6);
    byFIR := EnvioObjFPData.FPData[1, 0];

    for j := 0 to 399 do
    begin
      linha[i] := byFIR[i - 427];
      i := i + 1;
    end;
  end;

  if not placaLight then
  begin

    Year := FormatDateTime('yyyy', Date);
    Month := FormatDateTime('mm', Date);
    Day := FormatDateTime('dd', Date);
    Hour := FormatDateTime('hh', Time);
    Min := FormatDateTime('nn', Time);
    Sec := FormatDateTime('ss', Time);

    linha[836] := HexToInt(IntToStr(StrToInt(Year) div 100));
    linha[837] := HexToInt(IntToStr(StrToInt(Year) mod 100));
    linha[838] := HexToInt(Month);
    linha[839] := HexToInt(Day);
    linha[840] := HexToInt(Hour);
    linha[841] := HexToInt(Min);
    linha[842] := HexToInt(Sec);
    linha[843] := 0;
  end
  else
    SetarBioLight(1);

  // Envia um template com duas digitais para o Inner Bio cadastrar no seu banco de dados.
  tentativas := 0;

  Application.ProcessMessages;
  Ret := EnviarUsuarioBio(StrToInt(txtNumInner.Text), @linha);
  tentativas := tentativas + 1;

  tentativas := 0;
  If (Ret = RET_COMANDO_OK) Then
  begin
    repeat
      Ret := UsuarioFoiEnviado(StrToInt(txtNumInner.Text), 0);

      If (Ret = RET_COMANDO_OK) Then
      Begin
        iOk := iOk + 1;
      end
      else if (Ret = RET_BIO_USR_JA_CADASTRADO) then
      Begin
        iJaCadast := iJaCadast + 1;
      end
      else if (Ret = RET_BIO_FALHA_COMUNICACAO) then
      Begin
        iFalhaCom := iFalhaCom + 1;
        if (iFalhaCom = 3) then
          break;
      end
      else if (Ret = RET_BIO_TEMPLATE_INVALIDO) then
      Begin
        iTplInvalido := iTplInvalido + 1;
        if (iTplInvalido = 2) then
          break;
      end
      else if (Ret = RET_BIO_PARAMETROS_INVALIDOS) then
      Begin
        iParInvalido := iParInvalido + 1;
        if (iParInvalido = 2) then
          break;
      end
      else if (Ret = RET_BIO_BASE_CHEIA) then
      Begin
        blnBase := true;
        break;
      end;
      tentativas := tentativas + 1;
    until ((Ret <> RET_BIO_PROCESSANDO) or (tentativas > 10));

    lblManutencao.Alignment := taRightJustify;
    lblManutencao.Caption := 'ENVIADOS: ' + InttoStr(iOk);
    lblManutencao.Caption := lblManutencao.Caption + chr(13) +
      'JÁ CADASTRADOS: ' + InttoStr(iJaCadast);
    lblManutencao.Caption := lblManutencao.Caption + chr(13) + 'FALHA ENVIO: ' +
      InttoStr(iFalhaEnvio);

  end;
end;

// ***********************************************************************************
// Enviar placa Light
// Método responsável em enviar os usuários(templates) da base para o Inner
// ***********************************************************************************
Procedure TFrmEasyInnerTesteBio.enviarTlpSel(cartao: string; TemplateA: string; TemplateB: string; Light: Boolean);
var
  VersaoAlta: Integer;
  index : integer;
begin

  // Carrega os dados do usuário

  VersaoAlta := CapturaVersaoPlaca();
  if (VersaoAlta < 5) then
  begin
    EnviarUsuario(cartao, TemplateA, TemplateB, Light);
  end
  else
  begin
    EnviarUsuarioBioVariavel(cartao, TemplateA, TemplateB);
  end;
end;

// ***********************************************************************************
// Fecha porta de comunicação
// ***********************************************************************************
Procedure TFrmEasyInnerTesteBio.Finalizar;
begin
  FecharPortaComunicacao();
  LblStatus.Caption := 'Selecione um comando.';
  Application.ProcessMessages;
end;

// ***********************************************************************************
// O usuário será cadastrado no Inner bio com o número do cartão
// Retorna o resultado
// ***********************************************************************************
function TFrmEasyInnerTesteBio.inserirTemplateUsr(Usr: string;
  numTpl: Integer): boolean;
var
  Retorno: boolean;
begin
  Retorno := false;

  // Solicita inserção
  InserirUsuarioLeitorBio(StrToInt(txtNumInner.Text), numTpl, Usr);
  sleep(1000);
  SetarTimeoutBio;
  Ret := -1;
  repeat
    Application.ProcessMessages;
    // Retorna resultado inserção
    Ret := ResultadoInsercaoUsuarioLeitorBio(StrToInt(txtNumInner.Text), 0);

  until not(EsperaRespostaBio(Ret));

  If (numTpl = 0) Then
    numTpl := numTpl + 1;

  // Resultado do cadastro
  case Ret of
    RET_COMANDO_OK:
      begin
        Retorno := true;
        MessageDlg('Digital ' + InttoStr(numTpl) + ' capturada com sucesso.',
          mtInformation, [mbOk], 0);
      end;
    RET_BIO_USR_JA_CADASTRADO:
      begin
        MessageDlg('Usuário já existe.', mtWarning, [mbOk], 0);
      end;
    RET_BIO_BASE_CHEIA: // RET_BIO_BASE_CHEIA = 133
      begin
        MessageDlg('Não é possível incluir novo usuário, a base está cheia.',
          mtError, [mbOk], 0);
      end;
    RET_BIO_FALHA_COMUNICACAO: // RET_BIO_FALHA_COMUNICACAO = 129
      begin
        MessageDlg('Houve falha de comunicação, favor repetir o comando.',
          mtError, [mbOk], 0);
      end;
    RET_BIO_DIG_NAO_CONFERE: // RET_DIG_NAO_CONFERE = 134
      begin
        MessageDlg('As digitais não conferem', mtError, [mbOk], 0);
      end;
  end;

  result := Retorno;
end;

// ***********************************************************************************
// Habilita o botão para captura somente se o hamster estiver pronto e o cartão
// tiver sido informado
// ***********************************************************************************
function TFrmEasyInnerTesteBio.liberacaptura: boolean;
begin
  if ((HamsterPronto) and (txtCartao.Text <> '')) then
    btnCapturar.Enabled := true
  else
    btnCapturar.Enabled := false;

  liberacaptura := true;
end;

// ***********************************************************************************
// Retorna segundos sistema
// ***********************************************************************************
function TFrmEasyInnerTesteBio.Retornar_SegundosSys: double;
begin
  Retornar_SegundosSys := (GetTickCount / DIV_SEGUNDOS);
end;

Procedure TFrmEasyInnerTesteBio.sgUsuariosSelectCell(Sender: TObject; ACol,
  ARow: Integer; var CanSelect: Boolean);
begin
  RowSelecionada := ARow;
end;

Procedure TFrmEasyInnerTesteBio.showFalhaConexao;
begin
  MessageDlg('Conexão falhou!', mtError, [mbOk], 0);
end;

// ***********************************************************************************
// Enviar Usuários PC para o Inner Bio
// Consulta todos os usuários cadastrados no banco de dados do computador (.MDB)
// Envia um template com duas digitais de cada usuário para o Inner Bio cadastrar
// no seu banco de dados.
// ***********************************************************************************
Procedure TFrmEasyInnerTesteBio.cmdEnviarInnerClick(Sender: TObject);
var
  placaLight: boolean;
  versao: Integer;
  x: Integer;
  DigitalA, DigitalB, cartao: String;
begin
   ADODataSetUsuarioBio.Close;
   ADODataSetUsuarioBio.CommandText := 'SELECT * FROM UsuariosBio';
   ADODataSetUsuarioBio.Open;
  // Consulta se o usuário existe
  if ADODataSetUsuarioBio.RecordCount = 0 then
        Exit;

  Screen.Cursor := crHourGlass;

  // Mensagem de Status
  lblManutencao.Caption := 'Iniciando comunicação...';

  iJaCadast := 0;
  iOk := 0;
  iFalhaCom := 0;
  iTplInvalido := 0;
  iParInvalido := 0;
  iFalhaEnvio := 0;
  blnBase := false;

  // Se conectar Bio
  if Conectar() then
  begin
    lblManutencao.Caption := 'Verificando tipo da placa FIM...';

    placaLight := BioLigth;
    versao := CapturaVersaoPlaca;
    if versao >= 5 then
    Begin
      placaLight := false
    End;
    //Vai para o primeiro registrado retornado consulta
    ADODataSetUsuarioBio.First;

    ProgressBar1.Max := ADODataSetUsuarioBio.RecordCount;
    // enviarTodosTlp(placaLight);
    x := 1;
    while (x < ADODataSetUsuarioBio.RecordCount-1) do
    begin
      cartao := IntToStr(StrToInt64(ADODataSetUsuarioBioCartao.Value));
      DigitalA := ADODataSetUsuarioBioTemplate1.Value ;
      DigitalB := ADODataSetUsuarioBioTemplate2.Value;
      if versao < 5 then
      begin
        EnviarUsuario(cartao, DigitalA, DigitalB,
          placaLight);
      end
      else
      begin
        EnviarUsuarioBioVariavel(cartao, DigitalA, DigitalB);
      end;

      ProgressBar1.Position := x;
      ADODataSetUsuarioBio.Next;
      x := x + 1;
      Sleep(100);
    end;

    ProgressBar1.Position := 0;
    Screen.Cursor := crDefault;
    // Fecha porta comunicação
    Finalizar();
  end;
end;

// ***********************************************************************************
// INICIO (Hamster)
// ***********************************************************************************
Procedure TFrmEasyInnerTesteBio.btIniciarClick(Sender: TObject);
var
      iDeviceID: integer;
      openedDeviceID: longword;
    begin
      iDeviceID := NBioBSP_DEVICE_ID_AUTO_DETECT;

      // Seleciona dispositivo
      if (cboDispositivos.ItemIndex > 0) then
        iDeviceID := objDevice.MakeDeviceID
          [objDevice.EnumDeviceNameID[cboDispositivos.ItemIndex - 1],
          objDevice.EnumDeviceInstance[cboDispositivos.ItemIndex - 1]]
      else
        iDeviceID := NBioBSP_DEVICE_ID_AUTO_DETECT;

      // Fechar Dispositivo
      openedDeviceID := objDevice.openedDeviceID;
      objDevice.Close(openedDeviceID);

      // Abrir Dispositivo
      objDevice.Open(iDeviceID);
      if (objDevice.ErrorCode = NBioBSPERROR_NONE) then
      begin
        MessageDlg('Hamster pronto, informe o número do cartão', mtInformation, [mbOk], 0);
        txtCartao.SetFocus;
        HamsterPronto := true;
      end
      else
        HamsterPronto := false;

      // Habilita botão para captura
      liberacaptura;
end;

// ***********************************************************************************
// CAPTURA TEMPLATE
// Cadastra as digitais do novo usuário
// ***********************************************************************************
Procedure TFrmEasyInnerTesteBio.btCapturarClick(Sender: TObject);
var
      sTpl: String;
      fLinha: integer;
      nDataSize: integer;
      idDedo: integer;
      nFingerCnt: integer;
      nFingerID: integer;
      ValorQtdDigital: Integer;
      Template1, Template2: String;
    begin
      try

        ADODataSetUsuarioBio.First;

        // Obrigatório
        if (txtCartao.Text = '') then
        begin
          MessageDlg('Favor informar o número do cartão!', mtWarning, [mbOk], 0);
          exit;
        end;

        // Verifica se usuário já existe
        if ADODataSetUsuarioBio.Locate('Cartao', StrToInt64(txtCartao.Text), []) then
        begin
          MessageDlg('Usuario já cadastrado!', mtWarning, [mbOk], 0);
          exit;
        end
        else
        begin
          // Senão inicia preparação leitura dedos
          MessageDlg('Preparando a leitura do dedo 1', mtInformation, [mbOk], 0);
          ObjExtraction.DefaultTimeout := 0;
          if chkPopup.Checked = true then
          begin
            ObjExtraction.WindowStyle := NBioAPI_WINDOW_STYLE_POPUP;
          end
          else
          begin
            ObjExtraction.WindowStyle := NBioAPI_WINDOW_STYLE_INVISIBLE;
            ObjExtraction.FingerWnd := pic.Handle;
          end;

          ObjExtraction.VerifyImageQuality := TkbVerify.Position;
          ObjExtraction.Capture(NBioAPI_FIR_PURPOSE_VERIFY);
          ValorQtdDigital :=  GetQualidadeCaptureDigital;
          if ValorQtdDigital >= tkbValorDigital.Position then
          Begin
            lblValorDigital.Caption := IntToStr(ValorQtdDigital);
            ObjFPData.Export(ObjExtraction.FIR, MINCONV_TYPE_FIM01_HV);
            nFingerID := ObjFPData.FingerID[0];
            byFIR := ObjFPData.FPData[nFingerID, 0];
            Template1 := IntegerToHex(byFIR);
            MessageDlg('Preparando a leitura do dedo 2', mtInformation, [mbOk], 0);
            ObjExtraction.Capture(NBioAPI_FIR_PURPOSE_VERIFY);
            ValorQtdDigital :=  GetQualidadeCaptureDigital;
            if ValorQtdDigital >= tkbValorDigital.Position then
            Begin
              ObjFPData.Export(ObjExtraction.FIR, MINCONV_TYPE_FIM01_HV);
              nFingerID := ObjFPData.FingerID[0];
              byFIR := ObjFPData.FPData[nFingerID, 0];
              Template2 := IntegerToHex(byFIR);
            End
            Else
            Begin
              MessageDlg('Qualidade da digital baixa!', mtInformation, [mbOk], 0);
              Exit;
            End;
            lblValorDigital.Caption := IntToStr(ValorQtdDigital);
          End
          Else
          Begin
            MessageDlg('Qualidade da digital baixa!', mtInformation, [mbOk], 0);
            lblValorDigital.Caption := IntToStr(ValorQtdDigital);
            Exit;
          End;

          ADOConnection1.BeginTrans;
          ADODataSetUsuarioBio.Append;
          ADODataSetUsuarioBio.Fields.FieldByName('Cartao').AsString := InttoStr(StrToInt64(txtCartao.Text));
          ADODataSetUsuarioBio.Fields.FieldByName('Template1').AsString := Template1;
          ADODataSetUsuarioBio.Fields.FieldByName('Template2').AsString := Template2;
          ADODataSetUsuarioBio.Post;
          ADOConnection1.CommitTrans;
          MessageDlg('Digital gravada com sucesso!', mtInformation, [mbOk], 0);
        end;
      except
        on E: Exception do
        begin
          OutputDebugString(Pchar('Erro ' + E.Message));
          asm int 3
          end
          ;
        end;
      end;
    end;

// ***********************************************************************************
// Se a combo tiver populada, habilita o botão iniciar
// ***********************************************************************************
Procedure TFrmEasyInnerTesteBio.cboDispositivosChange(Sender: TObject);
begin
  btnIniciar.Enabled := (cboDispositivos.items.Count > 0);
end;

// ***********************************************************************************
// Ao preencher o campo cartão, chama rotina para liberar captura
// ***********************************************************************************
Procedure TFrmEasyInnerTesteBio.edCartaoChange(Sender: TObject);
begin
  liberacaptura;
end;

// ***********************************************************************************
// Ao digitar o número do cartão, inicia a captura
// ***********************************************************************************
Procedure TFrmEasyInnerTesteBio.edCartaoKeyPress(Sender: TObject;
  var Key: Char);
begin
  if (Key = chr(13)) then
    btCapturarClick(self);
end;

// ***********************************************************************************
// CAPTURA TEMPLATE
// Cadastra as digitais do novo usuário
// ***********************************************************************************
Procedure TFrmEasyInnerTesteBio.btCapturar2Click(Sender: TObject);
begin
  btCapturarClick(self);
end;

// ***********************************************************************************
// APAGA O CARTÃO 'Usuário'
// ***********************************************************************************
Procedure TFrmEasyInnerTesteBio.cmdApagarClick(Sender: TObject);
var
  linha: Integer;
  Templates: TStringList;
begin
  // Consulta se foi selecioada uma linha para excluir
  if (RowSelecionada = 0) then
  Begin
    exit;
  End;

  // Usuário encontrado
  if MessageDlg('Deseja realmente apagar o cartão ' + sgUsuarios.Cells[0, RowSelecionada]
    + '?', mtConfirmation, [mbYes, mbNo], 0) = mrYes then
  begin
      CarregarUsuarioBioEspec(sgUsuarios.Cells[0, RowSelecionada]);
      ADOConnection1.BeginTrans;
      ADODataSetUsuarioBio.Delete;
      ADOConnection1.CommitTrans;

      MessageDlg('Dado excluído com sucesso!', mtInformation, [mbOk], 0);
      ConectaMDB;
  end;
end;

Procedure TFrmEasyInnerTesteBio.ReceberDigitalBio;
var
  i, y, j, x, qtdTlp, tentativas: Integer;
  placaLight: boolean;
  pTeste: array of byte;
  Ret1, Ret2: Integer;
  Usuario, slinha, Template1, Template2: string;
  Temps: TStringList;
begin

  // Se a lista de usuários estiver vazia finaliza
  if lstUsuarios.items.Count = 0 then
    exit;

  // Mensagem Status
  lblManutencao.Caption := 'Iniciando processo de gravação.';
  Application.ProcessMessages;
  Screen.Cursor := crHourGlass;

  Ret2 := -1;
  if Conectar() then
  Begin
    Temps := TStringList.Create;
    placaLight := BioLigth();
    tentativas := 0;
    // Solicita a quantidade de usuários cadastrados no Inner Bio.
    Application.ProcessMessages;
    Ret := SolicitarQuantidadeUsuariosBio(StrToInt(txtNumInner.Text));

    If (Ret = RET_COMANDO_OK) Then
    begin
      Ret := RET_BIO_PROCESSANDO;
      repeat
        // Retorna a quantidade de usuários cadastrados no Inner Bio
        Application.ProcessMessages;
        Ret := ReceberQuantidadeUsuariosBio(StrToInt(txtNumInner.Text),
          0, @qtdTlp);
        Application.ProcessMessages;
        tentativas := tentativas + 1;
      until ((Ret = RET_COMANDO_OK) or (tentativas > 10));
    End;
    // Para cada usuário da lista
    ProgressBar1.Position := 0;
    ProgressBar1.Max := qtdTlp;

    lblManutencao.Caption := 'Carregando templates...';
    x := 1;
    for i := 0 to lstUsuarios.items.Count - 1 do
    Begin
      // Verifica se já existe no banco de dados
      if not(CarregarUsuarioBioEspec(lstUsuarios.items.Strings[i])) then
      Begin
        // Senão existe
        if (placaLight) then
          SetarBioLight(1);

        repeat
          // Solicita os dados do usuário cadastrados no leitor
          Application.ProcessMessages;
          Ret1 := SolicitarUsuarioCadastradoBio(StrToInt(txtNumInner.Text),
            InttoStr(StrToInt64(lstUsuarios.items.Strings[i])));
          Application.ProcessMessages;
        until (Ret1 = RET_COMANDO_OK);

        tentativas := 0;
        repeat
          lblManutencao.Caption := InttoStr(x) + ' templates carregados.';
          If (Ret1 = RET_COMANDO_OK) Then
          Begin

            // Recebe os dados do usuário cadastrados no leitor
            Application.ProcessMessages;
            Ret2 := ReceberUsuarioCadastradoBio(StrToInt(txtNumInner.Text), 0,
              @Template);
            Application.ProcessMessages;
            // Se retornado com sucesso
            If (Ret2 = RET_COMANDO_OK) Then
            Begin

              // Inicia processo de gravação
              if (placaLight) then
              Begin
                SetLength(byFIR, 404);
                SetLength(pTeste, 404);
                j := 27;
                for y := 0 to 403 do
                begin
                  pTeste[y] := Template[j];
                  inc(j);
                end;
                RecebObjFPData.Import(1, 0, 1, 6, 400, pTeste[0]);
                RecebObjFPData.Export(RecebObjFPData.FIR, 7);

                byFIR := RecebObjFPData.FPData[0, 0];
                Template1 := IntegerToHex(byFIR);

                for y := 0 to 403 do
                begin
                  pTeste[y] := 0;
                end;

                j := 427;
                for y := 0 to 403 do
                begin
                  pTeste[y] := Template[j];
                  inc(j);
                end;

                RecebObjFPData.Import(1, 0, 1, 6, 400, pTeste[0]);
                RecebObjFPData.Export(RecebObjFPData.FIR, 7);
                byFIR := RecebObjFPData.FPData[0, 0];

                Template2 := IntegerToHex(byFIR);

                if RecebObjFPData.ErrorCode <> NBioAPIERROR_NONE then
                begin
                  MessageDlg('Falhou a importação dos dados (' +
                    InttoStr(RecebObjFPData.ErrorCode) + ')', mtError,
                    [mbOk], 0);
                end;

              end
              else
              begin
                // SetLength(byFIR,404);
                SetLength(pTeste, 404);

                j := 28;
                for y := 0 to 403 do
                begin
                  pTeste[y] := Template[j];
                  inc(j);
                end;

                SetLength(pTeste, 404);

                // converte o template 1 que está em byte para string(hexadecimal)
                Template1 := IntegerToHex(pTeste);

                for y := 0 to 403 do
                begin
                  pTeste[y] := 0;
                end;

                j := 432;
                for y := 0 to 403 do
                begin
                  pTeste[y] := Template[j];
                  inc(j);
                end;

                // converte o template 2 que está em byte para string(hexadecimal)
                Template2 := IntegerToHex(pTeste);
              end;
              Usuario := RemZeroEsquerda(lstUsuarios.items.Strings[i]);
              Temps.Add(Usuario);
              Temps.Add(Template1);
              Temps.Add(Template2);
              InserirUsuarioBio(Temps);
              Temps := TStringList.Create;
              x := x + 1;
              ProgressBar1.Position := x;

              Template1 := '';
              Template2 := '';
            end;
          end;
          tentativas := tentativas + 1;
          Application.ProcessMessages;
        until ((Ret2 = 0) or (tentativas > 30));

      end;
      Application.ProcessMessages;
    end;
  end;
  Screen.Cursor := crDefault;
end;

Procedure TFrmEasyInnerTesteBio.ReceberDigitalBioVariavel;
var
  i, y, j, x, qtdTlp, tentativas: Integer;
  placaLight: boolean;
  Ret1, Ret2: Integer;
  Usuario, slinha, Template1, Template2: string;
  Temps: TStringList;
  tamanho : Integer;
  TemplateRecebido: array of byte;
begin

  // Se a lista de usuários estiver vazia finaliza
  if lstUsuarios.items.Count = 0 then
    exit;

  // Mensagem Status
  lblManutencao.Caption := 'Iniciando processo de gravação.';
  Application.ProcessMessages;
  Screen.Cursor := crHourGlass;

  Ret2 := -1;
  if Conectar() then
  Begin
    Temps := TStringList.Create;
    placaLight := BioLigth();
    tentativas := 0;
    // Solicita a quantidade de usuários cadastrados no Inner Bio.
    Application.ProcessMessages;
    Ret := SolicitarQuantidadeUsuariosBio(StrToInt(txtNumInner.Text));

    If (Ret = RET_COMANDO_OK) Then
    begin
      Ret := RET_BIO_PROCESSANDO;
      repeat
        // Retorna a quantidade de usuários cadastrados no Inner Bio
        Application.ProcessMessages;
        Ret := ReceberQuantidadeUsuariosBio(StrToInt(txtNumInner.Text),
          0, @qtdTlp);
        Application.ProcessMessages;
        tentativas := tentativas + 1;
      until ((Ret = RET_COMANDO_OK) or (tentativas > 10));
    End;
    // Para cada usuário da lista
    ProgressBar1.Position := 0;
    ProgressBar1.Max := qtdTlp;

    lblManutencao.Caption := 'Carregando templates...';


    x := 1;
    for i := 0 to lstUsuarios.items.Count - 1 do
    Begin
      // Verifica se já existe no banco de dados
      if not(CarregarUsuarioBioEspec(lstUsuarios.items.Strings[i])) then
      Begin
        // Senão existe
        if (placaLight) then
          SetarBioLight(1);
        Usuario := RemZeroEsquerda(lstUsuarios.items.Strings[i]);

        // Solicita os dados do usuário cadastrados no leitor
        Application.ProcessMessages;
        Ret1 := SolicitarDigitalUsuario(StrToInt(txtNumInner.Text), Usuario);

        tentativas := 0;
        repeat
          lblManutencao.Caption := InttoStr(x) + ' templates carregados.';
          If (Ret1 = RET_COMANDO_OK) Then
          Begin
           repeat
            Application.ProcessMessages;
            Ret := ReceberRespostaRequisicaoBio(StrToInt(txtNumInner.Text),@tamanho);
           until ((Ret = RET_COMANDO_OK) or (Ret = RET_BIO_USR_NAO_CADASTRADO)) ;

           if Ret = RET_BIO_USR_NAO_CADASTRADO then
           Begin
            lblManutencao.Caption := Usuario + ' não cadastrado!';
           End
           Else
           Begin
             SetLength(TemplateRecebido,tamanho);

              // Recebe os dados do usuário cadastrados no leitor
              Application.ProcessMessages;
              Ret2 := ReceberDigitalUsuario(StrToInt(txtNumInner.Text),TemplateRecebido,tamanho);
              Application.ProcessMessages;
              // Se retornado com sucesso
              If (Ret2 = RET_COMANDO_OK) Then
              Begin

                SetLength(pTeste, 404);

                j := 68;
                for y := 0 to 403 do
                begin
                  pTeste[y] := TemplateRecebido[j];
                  inc(j);
                end;

                SetLength(pTeste, 404);

                // converte o template 1 que está em byte para string(hexadecimal)
                Template1 := IntegerToHex(pTeste);

                for y := 0 to 403 do
                begin
                  pTeste[y] := 0;
                end;

                if(tamanho>472)then
                begin
                  j := 472;
                  for y := 0 to 403 do
                  begin
                    pTeste[y] := TemplateRecebido[j];
                    inc(j);
                  end;

                   // converte o template 2 que está em byte para string(hexadecimal)
                Template2 := IntegerToHex(pTeste);
                end
                else
                begin
                     Template2 := Template1;
                end;
                Temps.Add(Usuario);
                Temps.Add(Template1);
                Temps.Add(Template2);
                InserirUsuarioBio(Temps);
                Temps := TStringList.Create;
                x := x + 1;
                ProgressBar1.Position := x;

                Template1 := '';
                Template2 := '';
              end;
            end;
          End;
          tentativas := tentativas + 1;
          Application.ProcessMessages;
        until ((Ret2 = RET_COMANDO_OK) or (tentativas > 30));
      end
      else
      Begin
        lblManutencao.Caption := Usuario + ' já cadastrado';
      End;
      Application.ProcessMessages;
    end;
  end;
  Screen.Cursor := crDefault;
end;

// ***********************************************************************************
// Gravar Base
// Grava os usuários na base de dados do computador (.mdb)
// ***********************************************************************************
Procedure TFrmEasyInnerTesteBio.cmdGravarBaseClick(Sender: TObject);
begin
  // Mensagem Status
  Application.ProcessMessages;
  Screen.Cursor := crHourGlass;

  // Se conectar Inner
  If Conectar() Then
  begin
    lblManutencao.Caption := 'Recebendo todos os usuários...';
    Application.ProcessMessages;

    if (CapturaVersaoPlaca < 5) then
    begin
      ReceberDigitalBio;
    end
    else
    begin
      ReceberDigitalBiovariavel;
    end;
  end;
end;

// ***********************************************************************************
// Solicita dados do Firmware
// Retorna o resultado
// ***********************************************************************************
function TFrmEasyInnerTesteBio.CapturaVersaoPlaca: Integer;
var
  VersaoAlta: byte;
  VersaoBaixa: byte;
  VersaoSufixo: byte;
  Ret2: Integer;
  VariacaoInner: SHORT;
  InnerAcessoBio: byte;

begin

  Ret2 := -1;
  while (Ret2 <> 0) do
  begin
    Ret2 := ReceberVersaoFirmware(StrToInt(txtNumInner.Text), @LinhaInner,
      @VariacaoInner, @VersaoAlta, @VersaoBaixa, @VersaoSufixo,
      @InnerAcessoBio);
    sleep(100);
  end;

  If (((LinhaInner <> 6) AND (LinhaInner <> 14)) OR
    ((LinhaInner = 14) AND (InnerAcessoBio = 0))) Then
  begin
    MessageDlg('Equipamento não compatível com Biometria.', mtWarning,
      [mbOk], 0);
  end;
  CapturaVersaoPlaca := VersaoAlta;
end;

// ***********************************************************************************
// Completa string de acordo com os parâmetros enviados
// ***********************************************************************************
function TFrmEasyInnerTesteBio.CompletaString(var1: String; Len: Integer;
  complemento: String): String;
begin
  while (length(var1) < Len) do
  begin
    var1 := complemento + var1;
  end;
  CompletaString := var1;
end;

// ***********************************************************************************
// Cadastrar Novo Usuário no Leitor Bio
// Cadastro das digitais do usuário (templates)
// ***********************************************************************************
Procedure TFrmEasyInnerTesteBio.btnCadastrarNoLeitorBIOClick(Sender: TObject);
var
  Usuario: String;
begin
  Screen.Cursor := crHourGlass;

  // Campo obrigatório
  if (lstUsuarios.ItemIndex = -1) then
  begin
    MessageDlg
      ('É necessário selecionar um usuário em memória para cadastrar no InnerBIO (Necessita número Usuário)!',
      mtWarning, [mbOk], 0);
    Screen.Cursor := crDefault;
    exit;
  end
  else
    Usuario := lstUsuarios.items[lstUsuarios.ItemIndex];

  // Mensagem Status
  lblManutencao.Caption := 'Tentando Conectar...';
  Application.ProcessMessages;

  // Conecta com o Inner.
  if (Conectar()) then
  begin
    if (BioLigth) then
      Usuario := CompletaString(Usuario, 8, '0')
    else
      Usuario := CompletaString(Usuario, 10, '0');

    // Mensagem Status
    lblManutencao.Caption := 'Coletando Templates...';
    Application.ProcessMessages;

    // Solicita Posicionamento do Dedo..
    MessageDlg
      ('Coloque o dedo no leitor para realizar a captura do Template A.',
      mtInformation, [mbOk], 0);

    // Solicita a primeira digital do usuario
    Ret := InserirUsuarioLeitorBio(StrToInt(txtNumInner.Text), 0, Usuario);

    // Testa o Retorno do Comando..
    if (Ret = RET_COMANDO_OK) then
    begin
      // Seta Timeouto no InnerBIO
      SetarTimeoutBio();
      Ret := 255;
      // Aguarda resposta do InnerBIO..
      while (EsperaRespostaBio(Ret)) do
      begin
        Ret := ResultadoInsercaoUsuarioLeitorBio(StrToInt(txtNumInner.Text), 0);
      end;
    end;

    // Testa Retorno da Resposta..
    if (Ret <> RET_COMANDO_OK) then
    begin
      TratarRetornoErro(Ret);
      Screen.Cursor := crDefault;
      FecharPortaComunicacao();
      exit;
    end;

    // Solicita a segunda digital, testando se é a mesma ou se é uma digital diferente..
    // Caso seja a mesma digital..
    // Caso seja outro template..

    // Testa Retorno do Comando..
    if (Ret = RET_COMANDO_OK) then
    begin
      SetarTimeoutBio();

      // Aguarda Reposta do Comando..
      Ret := 255;
      while (EsperaRespostaBio(Ret)) do
      begin
        Ret := ResultadoInsercaoUsuarioLeitorBio(StrToInt(txtNumInner.Text), 0);
      end;
    end;

    // Testa retorno da Resposta..
    if (Ret = RET_COMANDO_OK) then
      MessageDlg('Usuário inserido pelo leitor com sucesso!', mtInformation,
        [mbOk], 0)
    else
    begin
      TratarRetornoErro(Ret);

      // Muda o cursor para default..
      FecharPortaComunicacao();
      Screen.Cursor := crDefault;
      exit;
    end;
  end;

  // Fecha a porta de comunicação com o InnerBIO
  FecharPortaComunicacao();

  // Seta o Cursor para Default.
  Screen.Cursor := crDefault;
  lblManutencao.Caption := 'Templates coletados com sucesso!';
  Application.ProcessMessages;
end;

// ***********************************************************************************
// Seta Timeout Bio
// ***********************************************************************************
Procedure TFrmEasyInnerTesteBio.SetarTimeoutBio;
begin
  Timeout := Retornar_SegundosSys() + 7;
end;

// ***********************************************************************************
// Espera Resposta Bio
// ***********************************************************************************
function TFrmEasyInnerTesteBio.EsperaRespostaBio(Retorno: Integer): boolean;
begin
  sleep(300);
  EsperaRespostaBio := ((Retorno <> RET_COMANDO_OK) and
    (Retornar_SegundosSys() <= Timeout));
end;

// ***********************************************************************************
// Apresenta a mensagem de acordo com o erro retornado
// ***********************************************************************************
Procedure TFrmEasyInnerTesteBio.TratarRetornoErro(Retorno: Integer);
begin
  case Retorno of
    FALHA_NA_COMUNICACAO:
      MessageDlg('Erro: Falha na comunicação com o Inner BIO.', mtError,
        [mbOk], 0);

    PROCESSANDO_ULTIMO_COMANDO:
      MessageDlg('Atenção: Ainda processando último Comando.', mtError,
        [mbOk], 0);

    FALHA_NA_COMUNICACAO_COM_PLACA_BIO:
      MessageDlg('Erro: Falha na comunicação com a placa BIO.', mtError,
        [mbOk], 0);

    INNER_BIO_NAO_ESTA_EM_MODO_MASTER:
      MessageDlg('Erro: Inner BIO não esta em moddo MASTER.', mtError,
        [mbOk], 0);

    USUARIO_JA_CADASTRADO_NO_BANCO_DE_DADOS_INNER_BIO:
      MessageDlg('Erro: Usuário ja cadastrado no banco de dados do Inner BIO.',
        mtError, [mbOk], 0);

    USUARIO_NAO_CADASTRADO_NO_BANCO_DE_DADOS_INNER_BIO:
      MessageDlg('Erro: Usuário não cadastrado no banco de dados Inner BIO.',
        mtError, [mbOk], 0);

    BASE_DE_DADOS_DE_USUARIOS_ESTA_CHEIA:
      MessageDlg('Erro: Base de dados de Usuários esta cheia.', mtError,
        [mbOk], 0);

    ERRO_NO_SEGUNDO_DEDO_DO_USUARIO:
      MessageDlg('Erro: Erro no segundo dedo do Usuário.', mtError, [mbOk], 0);

    SOLICITACAO_PARA_INNER_BIO_INVALIDA:
      MessageDlg('Erro: Solicitação para Inner BIO Inválida.', mtError,
        [mbOk], 0);

  else
    MessageDlg('Erro: Mensagem Indefinida', mtInformation, [mbOk], 0);
  end;
end;
// ***********************************************************************************
// Fechamento Formulário
// ***********************************************************************************
Procedure TFrmEasyInnerTesteBio.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  Action := caFree;
end;

Procedure TFrmEasyInnerTesteBio.cboDispositivosExit(Sender: TObject);
begin
  cboDispositivosChange(Sender);
end;

Procedure TFrmEasyInnerTesteBio.cboDispositivosDropDown(Sender: TObject);
begin
  // Verifica se a combo Dispositivos foi carregada
  If (cboDispositivos.items.Count = 0) Then
    Application.MessageBox
      ('Hamster não foi conectado ou o driver não foi instalado, para maiores detalhes acesse o arquivo leiame contido na instalação do SDK (Menu Iniciar/Programas/SDK EasyInner/Manuais)',
      'Error', mb_ok);

end;

Procedure TFrmEasyInnerTesteBio.cmdEnviarSelInnerClick(Sender: TObject);
var
  placaLight: boolean;
  cartao, TemplateA, TemplateB: string;
  index: Integer;
begin
  Screen.Cursor := crHourGlass;
  lblManutencao.Caption := 'Iniciando comunicação...';
  iOk := 0;
  iJaCadast := 0;
  iFalhaEnvio := 0;
  cartao := sgUsuarios.Cells[0, RowSelecionada];
  TemplateA := sgUsuarios.Cells[1, RowSelecionada];
  TemplateB := sgUsuarios.Cells[2, RowSelecionada]; 
  // Se conectar Bio
  if Conectar() then
  begin
    Application.ProcessMessages;
    placaLight := BioLigth;
    enviarTlpSel(cartao, TemplateA, TemplateB, placaLight);

    // Fecha porta comunicação
    Finalizar();
  end;
  Screen.Cursor := crDefault;
end;

Procedure TFrmEasyInnerTesteBio.btnExcluirUsuarioSelInnerClick(Sender: TObject);
var
  Usuario: AnsiString;
  i: Integer;
  Retorno: byte;
  light: boolean;
  versao: Integer;
begin
  Screen.Cursor := crHourGlass;

  // Mensagem Status
  LblStatus.Caption := 'Excluindo Usuário ';
  Application.ProcessMessages;

  // Conecta
  If Conectar() Then
  begin
    versao := CapturaVersaoPlaca;
    light := BioLigth;
    // if(BioLigth) then
    // Usuario := StringOfChar('0',8-length(EdtUsuario.text))+EdtUsuario.text + StringOfChar('0',8)
    // else if(
    // Usuario := StringOfChar('0',10-length(EdtUsuario.text))+EdtUsuario.text;

    with lstUsuarios do
    begin
      for i := -1 + lstUsuarios.Count downto 0 do
      begin
        if Selected[i] then
        begin
          Usuario := items.Strings[i];

          if (versao < 5) then
          begin
            if (light) then
            begin
              SetarBioLight(1);
            end;
          end;

          // Solicita exclusão
          Application.ProcessMessages;
          Retorno := SolicitarExclusaoUsuario(StrToInt(txtNumInner.Text),
          RemZeroEsquerda(Usuario));
          Application.ProcessMessages;

          repeat
            sleep(20);
            // Retorna se o usuário foi efetivamente excluído
            Application.ProcessMessages;
            Retorno := UsuarioFoiExcluido(StrToInt(txtNumInner.Text), 0);
            Application.ProcessMessages;
            If Retorno = RET_COMANDO_OK Then
            begin
              lblManutencao.Caption := Usuario + ' excluído com sucesso!';
              break;
            end
            else if Retorno = RET_BIO_USR_NAO_CADASTRADO then
            begin
              lblManutencao.Caption := Usuario + ' não cadastrado!';
              break;
            End;
          until (Retorno <> RET_BIO_PROCESSANDO);

        end;
      end;
    end;
  End;
  Finalizar();
  Screen.Cursor := crDefault;
end;

Procedure TFrmEasyInnerTesteBio.ConectaMDB;
var
    strConn   : string;
    path      : string;
    pos,i,tot: integer;

begin

    //Identifica o caminho da pasta do Delphi
    path := Application.ExeName;
    pos := Length(path)-1;
    tot := 0;
    i := pos;

    While i > 0 do
    begin

      If (Copy(path, i, 1) = '\') Then
       tot := tot + 1;

      If (tot = 3) Then break;

      i := i - 1;
    end;

    path := Copy(path, 0, i);
    path := path + 'BaseExemplos\SDK_exemplos.mdb';

    strConn:= 'Provider=Microsoft.Jet.OLEDB.4.0;Data Source=' + path  + ';Persist Security Info=False';
    ADOConnection1.Close;
    ADOConnection1.ConnectionString := strConn;
    //Verifica se existe o banco de dados antes de executar
    If (not fileexists(path)) then
    Begin
     //Senão existe apresenta mensagem
      Showmessage('Não foi possível conectar na base de dados, o arquivo UsuarioBio.mdb deve estar na pasta BaseBio !')
    End;
end;

Function TFrmEasyInnerTesteBio.CarregarUsuarioBioEspec(UsuarioSel: string): Boolean;
begin
  ADOConnection1.Close;
  ADOConnection1.Open;
  ADODataSetUsuarioBio.Close;
  ADODataSetUsuarioBio.CommandText := 'select * from UsuariosBio WHERE Cartao = "' + UsuarioSel + '"';
  ADODataSetUsuarioBio.Open;
  ADODataSetUsuarioBio.RecordCount;
  if ADODataSetUsuarioBio.RecordCount > 0 then
  Begin
    Result := True;
  end
  else
  Begin
    Result := False;
  End;
end;

  Procedure TFrmEasyInnerTesteBio.InserirUsuarioBio(UsuarioBio: TStringList);
  Begin
    ADODataSetUsuarioBio.Close;
    ADODataSetUsuarioBio.CommandText := 'SELECT * FROM UsuariosBio';
    ADODataSetUsuarioBio.Open;
    ADODataSetUsuarioBio.First;
    if Not ADODataSetUsuarioBio.Locate('Cartao', UsuarioBio[0], []) then
    begin
      ADODataSetUsuarioBio.Connection.BeginTrans;
      ADODataSetUsuarioBio.Append;
      ADODataSetUsuarioBio.Fields.FieldByName('Cartao').AsString := UsuarioBio[0];
      ADODataSetUsuarioBio.Fields.FieldByName('Template1').AsString := UsuarioBio[1];
      ADODataSetUsuarioBio.Fields.FieldByName('Template2').AsString := UsuarioBio[1];
      ADODataSetUsuarioBio.Post;
      ADODataSetUsuarioBio.Connection.CommitTrans;
    end;
  End;

  Procedure TFrmEasyInnerTesteBio.CarregarTemplates;
  Var
    index: Integer;
    Cartao, Template1, Template2: string;
  Begin
    ConectaMDB;
    ADODataSetUsuarioBio.Close;
    ADODataSetUsuarioBio.CommandText := 'SELECT *  FROM UsuariosBio ORDER BY CDbl(Cartao)';
    ADODataSetUsuarioBio.Open;
    if ADODataSetUsuarioBio.RecordCount > 0 then
    Begin
      sgUsuarios.RowCount := 2;
      sgUsuarios.FixedRows := 1;
      // Cartão;Template1;Template2
      sgUsuarios.Cols[0].Text := 'Cartão';
      sgUsuarios.Cols[1].Text := 'Template1';
      sgUsuarios.Cols[2].Text := 'Template2';
      ADODataSetUsuarioBio.First;
      for index := 1 to ADODataSetUsuarioBio.RecordCount - 1 do
      Begin
        Cartao := ADODataSetUsuarioBioCartao.Value;
        Template1 := ADODataSetUsuarioBioTemplate1.Value;
        Template2 := ADODataSetUsuarioBioTemplate2.Value;
        sgUsuarios.Cells[0, index] := Cartao;
        sgUsuarios.Cells[1, index] := Template1;
        sgUsuarios.Cells[2, index] := Template2;
        ADODataSetUsuarioBio.Next;
        sgUsuarios.RowCount := sgUsuarios.RowCount + 1;
        Application.ProcessMessages;
      End;
    End;
  End;

  Procedure TFrmEasyInnerTesteBio.CarregarUsuariosSD;
  Var
    Cartao: string;
    index: integer;
  Begin
    ADODataSetUsuarioSD.Close;
    ADODataSetUsuarioSD.CommandText := ' select *  from ListaSemDigital order by Codigo';
    ADODataSetUsuarioSD.Open;
    if ADODataSetUsuarioSD.RecordCount > 0 then
    Begin
      sgUsuariosDigital.Cols[0].Text := 'Cartão';
      ADODataSetUsuarioSD.First;
      for index := 1 to ADODataSetUsuarioSD.RecordCount do
      Begin
        Cartao := UsuariosSemDigitalCartao.Value;
        sgUsuariosDigital.Cells[0, index] := Cartao;
        ADODataSetUsuarioSD.Next;
        sgUsuariosDigital.RowCount := sgUsuariosDigital.RowCount + 1;
        Application.ProcessMessages;
      End;
    End;
    ADODataSetUsuarioSD.Close;
  End;

  Function TFrmEasyInnerTesteBio.GetQualidadeCaptureDigital: Integer;
  Var
    iTlFinger, iSplNumber: Integer;
    QtdDigital: Integer;
  Begin
    ObjFPData.CheckQuality(ObjExtraction.FIR, objFPImage.auditData);
    for iTlFinger := 0 to ObjFPData.TotalFingerCount - 1 do
    begin
      for iSplNumber := 0 to ObjFPData.SampleNumber - 1 do
      begin
        QtdDigital := ObjFPData.QualityInfo[ObjFPData.FingerID[iTlFinger], iSplNumber];
      end;
    end;
    Result := QtdDigital;
  End;

  procedure TFrmEasyInnerTesteBio.QualidadeImagemCapture(ASender: TObject; Quality: integer);
  begin
    lblvalorImagem.Caption := InttoStr(Quality);
  end;

end.
