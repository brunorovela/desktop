{
#TIT= Tela inicial do Módulo Financeiro
#OBJ= Menus e funções
#AUT= Jonathan
#DAT= 18/08/2004
#MOD= ...
#DES=
}      
unit Main;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  ComCtrls, Menus, ExtCtrls, General, ZAbstractRODataset, ZAbstractDataset,
  UZDataSet, Buttons, ToolWin, ZConnection, DBCtrls, mysql_api,
  ExtDlgs, uTrataExcecao, uUsuario, uLoginManager, ImgList,
  uMensagem, uTratamentoExcecaoPadrao, uTratamentoExcecaoAcademico;

type
  TPrincipalForm = class(TForm)
    ImageList2: TImageList;
    toolFinanceiro: TToolBar;
    btnSep1: TToolButton;
    btnIniciarTerminal: TToolButton;
    btnSep2: TToolButton;
    btnCalcularFreq: TToolButton;
    btnSair: TToolButton;
    btnSep6: TToolButton;
    btnSep5: TToolButton;
    btnConfiguracoes: TToolButton;
    BarraDeStatus: TToolBar;
    traco1: TToolButton;
    btnUsuario: TToolButton;
    traco2: TToolButton;
    traco3: TToolButton;
    btnDatas: TToolButton;
    ImagensMenu: TImageList;
    pnlMsg: TPanel;
    traco4: TToolButton;
    btnSep3: TToolButton;
    mmPrincipal: TMainMenu;
    miPrincipal: TMenuItem;
    miIniciarTerminal: TMenuItem;
    CalcularFrequncia1: TMenuItem;
    N1: TMenuItem;
    imSair: TMenuItem;
    tblLogo: TToolButton;
    opdImagem: TOpenPictureDialog;
    btnConsultar: TToolButton;
    ToolButton2: TToolButton;
    ToolButton1: TToolButton;
    popConfiguracoes: TPopupMenu;
    TrocarUsurio1: TMenuItem;
    MenuItem1: TMenuItem;
    Parmetros2: TMenuItem;
    btnImportar: TToolButton;
    ToolButton4: TToolButton;
    Configuraes1: TMenuItem;
    N2: TMenuItem;
    ImportaoAutomtica1: TMenuItem;
    GerenciamentodePresenas1: TMenuItem;
    miSep1: TMenuItem;
    miCatracas: TMenuItem;
    miIdentificacao: TMenuItem;
    procedure miIdentificacaoClick(Sender: TObject);
    procedure miCatracasClick(Sender: TObject);
    procedure GerenciamentodePresenas1Click(Sender: TObject);
    procedure btnConsultarClick(Sender: TObject);
    procedure ImportaoAutomtica1Click(Sender: TObject);
    procedure Configuraes1Click(Sender: TObject);
    procedure btnImportarClick(Sender: TObject);
    procedure Parmetros2Click(Sender: TObject);
    procedure CalcularFrequncia1Click(Sender: TObject);
    procedure imSairClick(Sender: TObject);
    procedure miIniciarTerminalClick(Sender: TObject);
    procedure tblLogoClick(Sender: TObject);
    procedure btnCalcularFreqClick(Sender: TObject);
    procedure btnIniciarTerminalClick(Sender: TObject);

    procedure FormShow(Sender: TObject);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure FormCreate(Sender: TObject);
    procedure FormResize(Sender: TObject);
    procedure TrocarUsurio1Click(Sender: TObject);
    procedure btnSairClick(Sender: TObject);
    procedure tratarErroBanco(Sender: TObject);
  private

    { Private declarations }
    function MostraVersao : String ;

  public

    { Public declarations }
    function ProcuraForm(frmForm : TForm):Boolean;

    {
    Function PrintRpt(AReport:String;ACabecalho:String;ASelectionFormula:String; AGroupFormula : String; ATitulo:String; AFiltro:String; const AFields: Array of String;
	     const AValues: Array of String;const ASortFields: Array of String;ADialog: Boolean):Boolean;
    }

    Procedure MostraHint(Sender: TObject);
    { # Procedure   MostraHint
      # Descrição:  Redireciona o Hint da Aplicação para o painel no formulário principal
      #
      # Parametros: Sender : Usado pela própria aplicação
    }
    procedure MostraHint2(Sender: TObject);
    { # Procedure   MostraHint
      # Descrição:  Redireciona o Hint do objeto para o painel no formulário principal
      #
      # Parametros: Sender : Nome do objeto que dispara o Hint
    }

  end;

var
   PrincipalForm: TPrincipalForm; 
   DataHoje : TDateTime;
   ano_semestre_incremento : Byte;
   tentativas_conexao : integer;
   nr_tentativas_conexao : integer;

implementation

uses
   uDM, uErro, DB, uConsulta, uParametros, uTerminal, uImportaDados,
   uFConfiguracao, uProgresso, uFAgendamentoEncerramentoPeriodo, uIUMDataModule,
   uFSplash, uFGerenciamentoPresencas, UFCadCatracas, UFCadIdentificacao;

{$R *.DFM}


procedure TPrincipalForm.FormShow(Sender: TObject);
var
  wAno, wMes, wDia : Word;
  iRec, I: Integer;
begin
  if not DM.db.Connected then Exit;

   btnUsuario.Caption := ' USUÁRIO : ' + DM.GetUsuarioLogado.Pessoa.Login;

   // Atualizar data atual
   DataHoje := DM.DataAtual();
   btnDatas.Caption := ' DATA: ' + FormatDateTime( 'dd/mm/yyyy', DataHoje ) + ' - ' + FormatDateTime( 'dddd', DataHoje );

   { Pegar AnoSemestre Atual }

   DecodeDate(DataHoje,wAno,wMes,wDia);

   if DM.variavel_parametro('ano_semestre_incremento') = '2' then
      ano_semestre_incremento := 2
   else
      ano_semestre_incremento := 1;


   PrincipalForm.Caption := Application.Title + ' - ' + DM.variavel_parametro('cliente_nome_fantasia')+ ' - (' + MostraVersao() + ') ';

   { Configurar posição da Data }
   pnlMsg.Width := BarraDeStatus.Width - (traco1.Width + traco2.Width + traco3.Width + traco4.Width + btnUsuario.Width + btnDatas.Width);


   //verifica finalizacao
   {
   with DM.qyTerminal do
   begin
      Close();
      SQL.Clear();
      SQL.Add(
      'SELECT                                                               '+
      '   COUNT(*) as conta                                           '+
      'FROM                                                                 '+
      '   diario_terminal_acessos                                           '+
      'WHERE                                                                '+
      '   sn_finalizado < 2 AND sn_especial = 0 AND dt_saida IS NULL          '+
      '   AND DATE_FORMAT(dt_entrada, "%Y-%m-%d") < DATE_FORMAT(NOW(), "%Y-%m-%d") '+
      'GROUP BY                                                             '+
      '   DATE_FORMAT(dt_entrada, "%Y-%m-%d")                                  '
      );
      Open();
      iRec := FieldByName('conta').AsInteger;
      Close();
      if (iRec > 0) then
      begin
         if Mensagem('Há Entradas de alunos no periodo anterior não finalizadas. Deseja Finalizar Agora?', 'Atenção!!', MB_YESNO + MB_ICONQUESTION) = IDYES then
         begin
            Application.CreateForm(TfrmTerminal, frmTerminal);
            DM.CarregaParametros();
            frmTerminal.GeraSaidaTodos(True);
            frmTerminal.GeraFaltasFinal();
            frmTerminal.Free();
            Mensagem('Entradas Finalizadas!!!', 'Atenção', MB_OK + MB_ICONINFORMATION);
         end;
      end;
   end;
   }
   DM.CarregaParametros();

   for I := 1 to ParamCount do
   begin
      if AnsiUpperCase(ParamStr(I)) = 'AUTO' then
      begin
         btnIniciarTerminal.Click;
         Break;
      end;
   end;
end;

procedure TPrincipalForm.GerenciamentodePresenas1Click(Sender: TObject);
begin
   if NOT(DM.UsuarioLogado.TemPermissao(0, 'TerminalAcesso.GerenciamentoPresencas', npAcesso, True)) then
      Exit;

   if NOT(ProcuraForm(frmGerenciamentoPresencas)) then
   begin
      Application.CreateForm(TfrmGerenciamentoPresencas, frmGerenciamentoPresencas);
   end else begin
      frmGerenciamentoPresencas.Show();
   end;
end;

procedure TPrincipalForm.ImportaoAutomtica1Click(Sender: TObject);
begin
   if dm.GetUsuarioLogado.TemPermissao( 0, 'TerminalAcesso.Importacao.Agendamentos', npAcesso, True ) then
   begin
      if not ProcuraForm( TForm(frmAgendamentoEncerramentoPeriodo) ) then
         Application.CreateForm(TfrmAgendamentoEncerramentoPeriodo, frmAgendamentoEncerramentoPeriodo)
       else
         frmAgendamentoEncerramentoPeriodo.Show;
   end;
end;

{ FormShow }


procedure TPrincipalForm.FormCloseQuery(Sender: TObject; var CanClose: Boolean);
begin

  if Mensagem( 'Deseja realmente sair do sistema ?', Application.Title,
	       MB_YESNO + MB_ICONQUESTION ) = ID_YES then
  begin

     CanClose := True;
     Dm.db.Disconnect;

  end
  else

    CanClose := False;

end; { FormCloseQuery }


procedure TPrincipalForm.FormCreate(Sender: TObject);
var
   pWindows : PChar;
   strWindows : String;
   strPrograma : String;
   RotinaTratarErroBancoP: Pointer;
   RotinaTratarErroBancoM: Pointer;

begin


   RotinaTratarErroBancoP := Pointer(self);
   RotinaTratarErroBancoM := self.MethodAddress('tratarErroBanco');

   Application.OnException := TTrataExcecao.Create(TTratamentoExcecaoAcademico.Create, RotinaTratarErroBancoP, RotinaTratarErroBancoM ).TrataExcecao;

   // Application.OnException := TTrataExcecao.Create(nil).TrataExcecao;


   { Pega o Path do Programa e do Relatório }
  strPrograma := iniWMestre.ReadString( 'Configuracoes', 'Programa', 'c:\unimestre\programas\' );

   { Diretório do Windows }
   pWindows := strAlloc( 144 );
   GetWindowsDirectory( pWindows, 144 );
   strWindows := strPas( pWindows );
   strDispose( pWindows );

   { Parâmetros Gerais }
   ThousandSeparator := '.';
   DecimalSeparator := ',';
   CurrencyDecimals := 4;
   ShortDateFormat := 'dd/mm/yyyy';

   LongMonthNames[1] := 'Janeiro';
   LongMonthNames[2] := 'Fevereiro';
   LongMonthNames[3] := 'Março';
   LongMonthNames[4] := 'Abril';
   LongMonthNames[5] := 'Maio';
   LongMonthNames[6] := 'Junho';
   LongMonthNames[7] := 'Julho';
   LongMonthNames[8] := 'Agosto';
   LongMonthNames[9] := 'Setembro';
   LongMonthNames[10] := 'Outubro';
   LongMonthNames[11] := 'Novembro';
   LongMonthNames[12] := 'Dezembro';

   ShortMonthNames[1] := 'JAN';
   ShortMonthNames[2] := 'FEV';
   ShortMonthNames[3] := 'MAR';
   ShortMonthNames[4] := 'ABR';
   ShortMonthNames[5] := 'MAI';
   ShortMonthNames[6] := 'JUN';
   ShortMonthNames[7] := 'JUL';
   ShortMonthNames[8] := 'AGO';
   ShortMonthNames[9] := 'SET';
   ShortMonthNames[10] := 'OUT';
   ShortMonthNames[11] := 'NOV';
   ShortMonthNames[12] := 'DEZ';

   LongDayNames[1] := 'Domingo';
   LongDayNames[2] := 'Segunda-Feira';
   LongDayNames[3] := 'Terça-Feira';
   LongDayNames[4] := 'Quarta-Feira';
   LongDayNames[5] := 'Quinta-Feira';
   LongDayNames[6] := 'Sexta-Feira';
   LongDayNames[7] := 'Sábado';

   { Redirecional o Hint }
   Application.OnHint := MostraHint;
end;  { FormCreate }

procedure TPrincipalForm.TrocarUsurio1Click(Sender: TObject);
{ Trocar de Usuários }
begin
   if TLoginManager.GetInstancia().RealizarLogin(False) then
   begin
      btnUsuario.Caption := ' USUÁRIO : ' + DM.GetUsuarioLogado.Pessoa.Login;
   end else begin
      Application.Terminate;
   end;
end; { TrocarUsurio1Click }

procedure TPrincipalForm.btnSairClick(Sender: TObject);
{ Sair do Sistema }
begin
  close;
end; { btnSair }

function TPrincipalForm.ProcuraForm(frmForm : TForm):Boolean;
var
  n : Integer;
begin

  Result := False;

  for n := 0 to MDIChildCount - 1 do
  begin

    if MDIChildren[n] = frmForm then
    begin
	Result := True;
	Break;
    end;

  end;

end; {ProcuraForm }

procedure TPrincipalForm.MostraHint(Sender: TObject);
begin

   pnlMsg.Caption := GetLongHint(Application.Hint);

end; { MostraHint }


procedure TPrincipalForm.MostraHint2(Sender: TObject);
begin

   pnlMsg.Caption := GetLongHint(TWinControl(Sender).Hint);

end;  { MostraHint2 }

function TPrincipalForm.MostraVersao: String;
const
   NOVIDATA = '';

var
  dwInfoSize,           // Size of VERSIONINFO structure
  dwVerSize,            // Size of Version Info Data
  dwWnd: DWORD;         // Handle for the size call.
  FI: PVSFixedFileInfo; // Delphi structure; see WINDOWS.PAS
  ptrVerBuf: Pointer;   // pointer to a version buffer
  strFileName,          // Name of the file to check
  strVersion : string;  // Holds parsed version number
begin

   strFileName := Application.ExeName;
   dwInfoSize :=
      getFileVersionInfoSize( pChar( strFileName ), dwWnd);

   if ( dwInfoSize = 0 ) then
      result := NOVIDATA
   else
   begin

      getMem( ptrVerBuf, dwInfoSize );
      try

         if getFileVersionInfo( pChar( strFileName ),
            dwWnd, dwInfoSize, ptrVerBuf ) then

            if verQueryValue( ptrVerBuf, '\',
                              pointer(FI), dwVerSize ) then

            strVersion :=   
               format( '%d.%d.%d.%d',
                       [ hiWord( FI.dwFileVersionMS ),
                         loWord( FI.dwFileVersionMS ),
                         hiWord( FI.dwFileVersionLS ),
                         loWord( FI.dwFileVersionLS ) ] );

      finally
        FreeMem( ptrVerBuf );
      end;
    end;
  Result := strVersion;
end;

procedure TPrincipalForm.FormResize(Sender: TObject);
begin
   pnlMsg.Width := BarraDeStatus.Width - (traco1.Width + traco2.Width + traco3.Width + traco4.Width + btnUsuario.Width + btnDatas.Width);
end;



procedure TPrincipalForm.btnConsultarClick(Sender: TObject);
begin
   if not ProcuraForm(frmConsulta) then
   begin
      Application.CreateForm(TfrmConsulta, frmConsulta);
   end else begin
      frmConsulta.Show();
   end;
end;

procedure TPrincipalForm.btnImportarClick(Sender: TObject);
var
   fImportaDados: TfImportaDados;
begin
  //if PasswordDlg.Autorizar(10001, taAcessar, True) then begin
    Application.CreateForm(TfImportaDados, fImportaDados);
    fImportaDados.ShowModal();
  //end;
end;

procedure TPrincipalForm.btnIniciarTerminalClick(Sender: TObject);
const
   MSG_SEM_PESSOA =
      'Está habilitado o envio automático de ocorrências para os alunos.' + #13 +
      'Para prosseguir é necessário que seu usuário esteja vinculado a um cadastro de pessoa' + #13 +
      '(Sistema Acadêmico > Configurações > Usuários > Seu usuário, víncule-o a um cadastro de pessoa),' + #13 +
      'ou desative a opção de uso de ocorrências em' + #13 +
      '"Configurações > Configurações > Utilizar Envio de Ocorrência ONLINE"';
begin
   if dm.GetUsuarioLogado.TemPermissao(10001, npAcesso, true) then
   begin
      if DM.UtilizaEnvioOcorrencias and (DM.GetUsuarioLogado = nil) then
      begin
         Mensagem(MSG_SEM_PESSOA, 'Atenção!', MB_OK + MB_ICONWARNING);
      end
      else
      begin
         Application.CreateForm(TfrmTerminal, frmTerminal);
         frmTerminal.ShowModal;
      end;
   end;
end;

procedure TPrincipalForm.btnCalcularFreqClick(Sender: TObject);
const
   MSG_ENCERRAMENTO_PERIODO =
      'Tem certeza de que deseja encerrar o período?';
   MSG_ENCERRAMENTO_FINALIZADO =
      'Encerramento de período finalizado com sucesso.';
   SQL_TA_ENCERRAR_PERIODO =
      ' CALL TA_ENCERRAR_PERIODO() ';
{var
   slFiltro, slT: TStringList;
   i: Integer;
   sAux: string;
   frmBarraProgresso: TfrmProg;}
var
   Conexao, ConexaoAux: mysql_api.PMYSQL;
   FlagsConexao: Integer;
   qyExecutaProcedure: TUMZQuery;
begin
   if ( Mensagem(MSG_ENCERRAMENTO_PERIODO, '', MB_YESNO + MB_DEFBUTTON2 + MB_ICONQUESTION, Handle) <> mrYes ) then
   begin
      Exit;
   end;

   TfSplash.GetInstancia.ShowSplashScreen('Encerramento de Período', 'Aguarde enquanto o sistema realiza o encerramento de período...');

   try
      ConexaoAux := mysql_api.mysql_init(nil);

      FlagsConexao := 0;
                                                     
      //if opRememberOptions   in FParameters then
         FlagsConexao := FlagsConexao + CLIENT_REMEMBER_OPTIONS;
      //if opLongPassword      in FParameters then
         FlagsConexao := FlagsConexao + CLIENT_LONG_PASSWORD;
      //if opFoundRows         in FParameters then
         FlagsConexao := FlagsConexao + CLIENT_FOUND_ROWS;
      //if opLongFlag          in FParameters then
         FlagsConexao := FlagsConexao + CLIENT_LONG_FLAG;
      //if opConnectWithDb     in FParameters then
         FlagsConexao := FlagsConexao + CLIENT_CONNECT_WITH_DB;
      //if opNoSchema          in FParameters then
         FlagsConexao := FlagsConexao + CLIENT_NO_SCHEMA;
      //if opCompress          in FParameters then
         FlagsConexao := FlagsConexao + CLIENT_COMPRESS;
      //if opODBC              in FParameters then
         FlagsConexao := FlagsConexao + CLIENT_ODBC;
      //if opLocalFiles        in FParameters then
         FlagsConexao := FlagsConexao + CLIENT_LOCAL_FILES;
      //if opIgnoreSpace       in FParameters then
         FlagsConexao := FlagsConexao + CLIENT_IGNORE_SPACE;
      //if opProtocol41        in FParameters then
         FlagsConexao := FlagsConexao + CLIENT_PROTOCOL_41;
      //if opInteractive       in FParameters then
         FlagsConexao := FlagsConexao + CLIENT_INTERACTIVE;
      //if opSSL               in FParameters then
         // comentário em 05/08/2024
         // essa linha abaixo foi comentada e descomentada
         // provavelmente por que tem clientes que funcionam e clientes que nao
         // caso seja necessário rever isso, fazer uma FLAG em TELA
         FlagsConexao := FlagsConexao + CLIENT_SSL;
      //if opIgnoreSigpipe     in FParameters then
         FlagsConexao := FlagsConexao + CLIENT_IGNORE_SIGPIPE;
      //if opTransactions      in FParameters then
         FlagsConexao := FlagsConexao + CLIENT_TRANSACTIONS;
      //if opReserved          in FParameters then
         FlagsConexao := FlagsConexao + CLIENT_RESERVED;
      //if opSecureConnection  in FParameters then
         FlagsConexao := FlagsConexao + CLIENT_SECURE_CONNECTION;
      //if opMultiStatements   in FParameters then
         FlagsConexao := FlagsConexao + CLIENT_MULTI_STATEMENTS;
      //if opMultiResults      in FParameters then
         FlagsConexao := FlagsConexao + CLIENT_MULTI_RESULTS;
      //if opRememberOptions   in FParameters then
         FlagsConexao := FlagsConexao + CLIENT_REMEMBER_OPTIONS;

      Conexao := mysql_api.mysql_real_connect(
         ConexaoAux,
         PAnsiChar(UTF8Encode(DM.db.HostName)),
         PAnsiChar(UTF8Encode(DM.db.User)),
         PAnsiChar(UTF8Encode(DM.db.Password)),
         PAnsiChar(UTF8Encode(DM.db.Database)),
         DM.db.Port,
         PAnsiChar(Utf8Encode(DM.db.HostName)),
         FlagsConexao
      );

      //mysql_api.mysql_select_db(Conexao, PAnsiChar(db.Database));
      mysql_api.mysql_query(Conexao, PAnsiChar(SQL_TA_ENCERRAR_PERIODO));

      if (mysql_api.mysql_errno(Conexao) > 0) then
      begin
         DM.SetLog(10043, 'alteracao', 'TerminalAcesso', DM.UsuarioLogado.GetColigadaLogada().Codigo, 'Erro ao executar a finalização de período: '+mysql_api.mysql_error(Conexao));

         // Tenta utilizar outro meio de conexão antes de emitir o erro
         try
            try
               DM.CriarConsulta(qyExecutaProcedure);
               qyExecutaProcedure.SQL.Text := PAnsiChar(SQL_TA_ENCERRAR_PERIODO);
               qyExecutaProcedure.ExecSQL;
            except
               on E: Exception do
               begin
                  DM.SetLog(10043, 'alteracao', 'TerminalAcesso', DM.UsuarioLogado.GetColigadaLogada().Codigo, 'Erro ao executar a finalização de período: '+E.Message);

                  TfSplash.GetInstancia.CloseSplashScreen;
                  Mensagem('Ocorreu um erro ao realizar o encerramento de período.', 'Erro', MB_OK + MB_ICONERROR, Handle);
               end;
            end;
         finally
            FreeAndNil(qyExecutaProcedure);
         end;
      end;

      TfSplash.GetInstancia.CloseSplashScreen;

      Mensagem(MSG_ENCERRAMENTO_FINALIZADO);
   finally
      mysql_api.mysql_close(Conexao);
   end;
end;

procedure TPrincipalForm.tblLogoClick(Sender: TObject);
begin
  if opdImagem.Execute(Self.Handle) then begin
    if FileExists(opdImagem.FileName) then begin
      iniWMestre.WriteString('TerminalAcesso', 'Imagem', opdImagem.FileName);
    end;
  end;
end;

procedure TPrincipalForm.miCatracasClick(Sender: TObject);
const
   SChaveModulo = 'TerminalAcesso.Configuracoes.Catracas.Cadastro';
var
   TemPerm: Boolean;
begin
   TemPerm := DM.UsuarioLogado.TemPermissao(DM.UsuarioLogado.Pessoa.Codigo,
      SChaveModulo, npAcesso, True);
   if TemPerm then
   begin
      if frmCadCatracas = nil then
         Application.CreateForm(TfrmCadCatracas, frmCadCatracas);
      frmCadCatracas.Show;
   end;
end;

procedure TPrincipalForm.miIdentificacaoClick(Sender: TObject);
const
   SChaveModulo = 'TerminalAcesso.Configuracoes.Identificacao.Cadastro';
var
   TemPerm: Boolean;
begin
   TemPerm := DM.UsuarioLogado.TemPermissao(DM.UsuarioLogado.Pessoa.Codigo,
      SChaveModulo, npAcesso, True);
   if TemPerm then
   begin
      if frmCadIdentificacao = nil then
         Application.CreateForm(TfrmCadIdentificacao, frmCadIdentificacao);
      frmCadIdentificacao.Show;
   end;
end;

procedure TPrincipalForm.miIniciarTerminalClick(Sender: TObject);
begin
  btnIniciarTerminalClick(nil);
end;

procedure TPrincipalForm.imSairClick(Sender: TObject);
begin
  Application.Terminate();
end;

procedure TPrincipalForm.CalcularFrequncia1Click(Sender: TObject);
begin
  btnCalcularFreqClick(nil);
end;

procedure TPrincipalForm.Configuraes1Click(Sender: TObject);
begin
   if dm.GetUsuarioLogado.TemPermissao(10042, npAcesso, true) then
   begin
      if not ProcuraForm(fConfiguracao) then
         Application.CreateForm(TfConfiguracao, fConfiguracao)
      else
         fConfiguracao.Show;
   end;
end;

procedure TPrincipalForm.Parmetros2Click(Sender: TObject);
begin
    if not dm.GetUsuarioLogado.TemPermissao( 10041, npAcesso, True ) then Exit;

    if not ProcuraForm( TForm(frmParametros) ) then
      Application.CreateForm(TfrmParametros, frmParametros)
    else
      frmParametros.Show;

    frmParametros.Filtra(TerminalAcesso, DM.db, dm.GetUsuarioLogado.TemPermissao( 10041, npAlterar, False ));
end;


{ Essa função foi criada para tentar fazer o banco de dados se reconectar}
procedure TPrincipalForm.tratarErroBanco(Sender:Tobject);
var
   Parametros: TParamsIni;
   FormularioErro : TfrmMensagem;
   problema_resolvido : boolean;
begin
   Sleep(1000);
   inc(tentativas_conexao);
   problema_resolvido := False;

   Try

      dm.db.Disconnect;
      dm.db.Reconnect;
      dm.db.Connect;


      if dm.db.Ping = true then
      begin
         problema_resolvido := true;
         tentativas_conexao := 0;
      end;
   Except
      // nada
   end;


   // nao teve como... a conexao nao foi mais realizada
   // mostra mensagem de erro
   if problema_resolvido = false then
   begin

      // se chegou no limite de tentativas, mostra tela para usuario
      if (tentativas_conexao > nr_tentativas_conexao) then
      begin
         Parametros.titulo := 'Encontrada uma inconsistência no sistema!';
         Parametros.opcoes := (BT_OK + ICO_ERROR);
         Parametros.mensagens.msgPrincipal := 'Falha na conexão: o UNIMESTRE não está mais conseguindo se conectar ao banco de dados. O sistema será fechado.';
         Parametros.dimensao.altura := 250;
         Parametros.dimensao.largura := 600;
         Parametros.snErroBanco := true;

         tentativas_conexao := 0;

         FormularioErro := TfrmMensagem.create(nil, parametros);
         FormularioErro.btnReconectar.Visible := true;  
         FormularioErro.ShowModal;

         FormularioErro.setValores(
            Pointer(self),
            self.MethodAddress('tratarErroBanco')
         );


      end
      else
      begin
         // apenas abre a tela para rechamar esta funcao
         Parametros.titulo := 'Encontrada uma inconsistência no sistema!';
         Parametros.opcoes := (BT_OK + ICO_ERROR);
         Parametros.mensagens.msgPrincipal := 'Falha na conexão: o UNIMESTRE não está mais conseguindo se conectar ao banco de dados. O sistema será fechado.';
         Parametros.dimensao.altura := 250;
         Parametros.dimensao.largura := 600;
         Parametros.snErroBanco := true;

         FormularioErro := TfrmMensagem.create(nil, parametros);
         FormularioErro.Show;

         FormularioErro.setValores(
            Pointer(self),
            self.MethodAddress('tratarErroBanco')
         );

         FormularioErro.btnReconectar.Visible := false;
         FormularioErro.btnReconectarClick(Sender);
      end;
   end;



end;

end.

