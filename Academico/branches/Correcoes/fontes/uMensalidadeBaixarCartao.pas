unit uMensalidadeBaixarCartao;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ExtCtrls, UMEditMonetario, General, udm,
  uMensalidadeFinCartao, UZDataSet, ZAbstractRODataset;

type
  TfrmMensalidadeBaixaCartao = class(TForm)
    pnTitulo: TPanel;
    txtVlTotal: TUMEditMonetario;
    pnBotoes: TPanel;
    btnIniciarTransacao: TButton;
    lblVlTotal: TLabel;
    terminal_ativo: TTimer;
    pnInfo: TPanel;
    tempo_transacao: TTimer;
    CheckBox1: TCheckBox;
    procedure tempo_transacaoTimer(Sender: TObject);
    procedure btnIniciarTransacaoClick(Sender: TObject);
    procedure terminal_ativoTimer(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    vl_total                     : double;
    nr_segundos_espera_terminal  : integer;
    nr_moeda_cartao              : integer;
    contador                     : integer;
    status_terminal_ativo        : Boolean;
    pasta_requisicao             : string;
    pasta_resposta               : string;
    data_atual                   : TDateTime;
    cd_caixa                     : string;
    dias_previsao_credito        : integer;
    dias_previsao_debito         : integer;
    objFinCartao                 : TMBFinCartao;
    { Private declarations }
  public
    procedure setValorTotal( valor: double);
    procedure habilitaBotoes( valor: Boolean );
    procedure criaArquivoRequisicao();
    procedure apagaArquivoResposta( sArquivo: string );
    procedure apagaArquivoRequisicao( sArquivo: string );
    procedure iniciaTransacao();
    procedure MensagemCartao( msg: string; segundos: integer );
    procedure atualizaFinCartao();
    procedure finalizaTransacao();
    procedure setDataAtual( valor: TDateTime );
    procedure setCdCaixa( valor: string );
    procedure gerarParcelas();
    function getValorUltimaParcela( vl_total_transacao: double; nr_parcelas: integer; vl_parcela: double ) : double;
    function getDataPrevisao( dt_previsao: TDateTime ) : TDateTime;
    function setValorRequisicao( svalor : string ) : string;
    function getValorTotal() : double;
    function existeArquivo( sCaminho: string ) : Boolean;
    function operacaoCancelada() : Boolean;
    function lerValorArquivoResposta( sCampo : string ) : string;
    function substituiCaracter( valor: string; str_antigo: string; str_novo: string ) : string;
    function getProximoMes( dtPrevisaoInicial: TDateTime; dtPrevisao: TDateTime ) : TDateTime;
    function getDataAtual() : TDateTime;
    function getCdCaixa() : string;
    { Public declarations }
  end;

var
  frmMensalidadeBaixaCartao: TfrmMensalidadeBaixaCartao;

const
   nm_arquivo_requisicao      = 'IntPos.001'; // após finalizar o arquivo será renomeado para IntPos.001
   nm_arquivo_requisicao_temp = 'IntPos.tmp';
   nm_arquivo_status          = 'IntPos.Sts';
   nm_arquivo_resposta        = 'IntPos.001';


implementation

uses uMensalidadeBaixarMsgCartao;

{$R *.dfm}

{ TfrmMensalidadeBaixaCartao }

procedure TfrmMensalidadeBaixaCartao.apagaArquivoRequisicao( sArquivo: string );
var
   sCaminho : string;
begin
   sCaminho := Concat(pasta_requisicao, sArquivo);

   if existeArquivo( sCaminho ) then
   begin
      DeleteFile( sCaminho );
   end;
end;

procedure TfrmMensalidadeBaixaCartao.apagaArquivoResposta(sArquivo: string);
var
   sCaminho : string;
begin
   sCaminho := Concat(pasta_resposta, sArquivo);
   
   if existeArquivo( sCaminho )  then
   begin
      DeleteFile( sCaminho );
   end;
end;

procedure TfrmMensalidadeBaixaCartao.atualizaFinCartao;
var
   sCaminho       : string;
   tp_transacao   : integer;
   nr_nsu         : string;
   nr_parcelas    : string;
   nr_finalizacao : string;
   nm_rede        : string;
begin
   sCaminho := Concat(pasta_resposta, nm_arquivo_resposta);

   if existeArquivo( sCaminho )  then
   begin
      //tipo de transação
      try
         tp_transacao := StrToInt( lerValorArquivoResposta('011-000') );
      except
         tp_transacao := 0;
      end;

      if tp_transacao in [10..13] then
      begin
         objFinCartao.setValorCampo('tp_transacao', 'C');
      end
      else if tp_transacao in [20..25] then
      begin
         objFinCartao.setValorCampo('tp_transacao', 'D');
      end
      else
      begin
         //se o sistema parar aqui é uma forma de pagamento não tratada.
         //os tipos estão na página 16 do guia técnico campo 011-000
         objFinCartao.setValorCampo('tp_transacao', '' );
      end;

      //NSU
      nr_nsu := lerValorArquivoResposta('012-000');

      objFinCartao.setValorCampo('nr_nsu', nr_nsu );

      //Quantidade de parcelas
      nr_parcelas := lerValorArquivoResposta('018-000');

      if nr_parcelas <> '' then
      begin
         objFinCartao.setValorCampo('nr_parcelas', nr_parcelas);
      end;

      //codigo de finalizacao da transacao
      nr_finalizacao := lerValorArquivoResposta('027-000');
      objFinCartao.setValorCampo('nr_finalizacao', nr_finalizacao);

      //nome da rede responsável pela autorizacao
      nm_rede := lerValorArquivoResposta('010-000');
      objFinCartao.setValorCampo('nm_rede', nm_rede);

      objFinCartao.atualizar();
   end;
end;

procedure TfrmMensalidadeBaixaCartao.finalizaTransacao;
var
   Arquivo        : TextFile;
   sCaminho       : string;
   sCaminho_novo  : string;
begin
   //escreve no arquivo de requisicao temporário
   sCaminho := Concat( pasta_requisicao, nm_arquivo_requisicao_temp );

   AssignFile ( Arquivo, sCaminho );
   Rewrite ( Arquivo );

   //informações no guia técnico 11 e 21
   Writeln ( Arquivo, '000-000 = CNF' );
   Writeln ( Arquivo, '001-000 = '     + objFinCartao.getValorCampo('cd_cartao')       );
   Writeln ( Arquivo, '010-000 = '     + objFinCartao.getValorCampo('nm_rede')         );
   Writeln ( Arquivo, '012-000 = '     + objFinCartao.getValorCampo('nr_nsu')          );
   Writeln ( Arquivo, '027-000 = '     + objFinCartao.getValorCampo('nr_finalizacao')  );
   Writeln ( Arquivo, '999-999 = 0' );

   CloseFile ( Arquivo );

   //renomeia o arquivo de requisicao para arquivo válido
   sCaminho_novo := Concat( pasta_requisicao, nm_arquivo_requisicao );

   RenameFile( sCaminho, sCaminho_novo );
end;

procedure TfrmMensalidadeBaixaCartao.btnIniciarTransacaoClick(Sender: TObject);
begin
   Self.iniciaTransacao();
end;

procedure TfrmMensalidadeBaixaCartao.criaArquivoRequisicao;
var
   Arquivo        : TextFile;
   sCaminho       : string;
   sCaminho_novo  : string;
   sOperacao      : string;
begin
   //escreve no arquivo de requisicao temporário
   sCaminho := Concat( pasta_requisicao, nm_arquivo_requisicao_temp );
   if CheckBox1.Checked then
   begin
      sOperacao := 'ADM';
   end
   else
   begin
      sOperacao := 'CRT';
   end;
   AssignFile ( Arquivo, sCaminho );
   Rewrite ( Arquivo );

   //informações no guia técnico 11 e 21
   Writeln ( Arquivo, '000-000 = ' + sOperacao );
   Writeln ( Arquivo, '001-000 = ' + objFinCartao.getValorCampo('cd_cartao') );
   Writeln ( Arquivo, '003-000 = ' + setValorRequisicao( objFinCartao.getValorCampo('vl_transacao')) );
   Writeln ( Arquivo, '004-000 = ' + IntToStr(nr_moeda_cartao) ); //campo moeda (0-real, 1-dolar)
   Writeln ( Arquivo, '999-999 = 0' );

   CloseFile ( Arquivo );

   //renomeia o arquivo de requisicao para arquivo válido
   sCaminho_novo := Concat( pasta_requisicao, nm_arquivo_requisicao );

   RenameFile( sCaminho, sCaminho_novo );
end;

function TfrmMensalidadeBaixaCartao.existeArquivo(sCaminho: string): Boolean;
var
   bEncontrou : Boolean;
begin
   bEncontrou := false;

   //verifica se o arquivo existe
   if FileExists( sCaminho ) then
   begin
      bEncontrou := true;
   end;

   Result := bEncontrou;
end;

procedure TfrmMensalidadeBaixaCartao.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
   terminal_ativo.Enabled  := false;
   tempo_transacao.Enabled := false;
   contador := 0;

   if objFinCartao <> nil then
   begin
      FreeAndNil( objFinCartao );
   end;

   //apaga arquivos existentes
   apagaArquivoRequisicao( nm_arquivo_requisicao );
   apagaArquivoResposta( nm_arquivo_resposta );
   apagaArquivoResposta( nm_arquivo_status );

   Action   := caFree;
end;

procedure TfrmMensalidadeBaixaCartao.FormShow(Sender: TObject);
begin
   contador                := 0;
   status_terminal_ativo   := false;

   try
      nr_segundos_espera_terminal   := StrToInt( DM.variavel_parametro('financeiro_segundos_espera_terminal') );
   except
      nr_segundos_espera_terminal   := 7;
   end;

   try
      nr_moeda_cartao  := StrToInt( DM.variavel_parametro('financeiro_moeda_cartao') );
   except
      nr_moeda_cartao  := 0;
   end;

   pasta_requisicao  := Concat( DM.variavel_parametro('financeiro_tefdiscado_pasta_requisicao'), '/' );
   pasta_resposta    := Concat( DM.variavel_parametro('financeiro_tefdiscado_pasta_resposta'),   '/' );

   try
      dias_previsao_credito := StrToInt( DM.variavel_parametro('financeiro_dias_previsao_credito') );
   except
      dias_previsao_credito := 30;
   end;

   try
      dias_previsao_debito := StrToInt( DM.variavel_parametro('financeiro_dias_previsao_debito') );
   except
      dias_previsao_debito := 1;
   end;

   //apaga arquivos existentes
   apagaArquivoRequisicao( nm_arquivo_requisicao );
   apagaArquivoResposta( nm_arquivo_resposta );
   apagaArquivoResposta( nm_arquivo_status );
end;

procedure TfrmMensalidadeBaixaCartao.gerarParcelas;
var
   nr_parcelas             : integer;
   vl_parcela              : double;
   dt_previsao             : TDateTime;
   dt_previsao_inicial     : TDateTime;
   iParcela                : integer;
   qyFinCartoesParcelas    : TUMZQuery;
   vl_ultima_parcela       : double;
   vl_total_transacao_str  : string;
   vl_total_transacao      : double;
   vl_parcela_str          : string;
begin
   if objFinCartao <> nil then
   begin
      //recupera a quantidade de parcelas
      try
         nr_parcelas := StrToInt( objFinCartao.getValorCampo('nr_parcelas') );
      except
         nr_parcelas := 1;
      end;

      try
         dt_previsao          := objFinCartao.getDataTransacao();
         dt_previsao          := getDataPrevisao( dt_previsao );
         dt_previsao_inicial  := dt_previsao;
      except
         dt_previsao          := getDataAtual();
         dt_previsao          := getDataPrevisao( dt_previsao );
         dt_previsao_inicial  := dt_previsao;
      end;

      //ajusta o valor das parcelas
      vl_total_transacao_str  := substituiCaracter( objFinCartao.getValorCampo('vl_transacao'), '.', ',' );
      vl_total_transacao      := StrToFloat( vl_total_transacao_str );

      vl_parcela              := RoundFloat (RoundFloat( vl_total_transacao, 2 ) / nr_parcelas, 2);

      vl_ultima_parcela       := getValorUltimaParcela( vl_total_transacao, nr_parcelas, vl_parcela );

      DM.CriarConsulta( qyFinCartoesParcelas );

      //grava cada parcela em base
      for iParcela := 1 to nr_parcelas do
      begin

         //Identifica se a ultima parcela possui valor diferente e faz a mudança
         if (iParcela = nr_parcelas) and (vl_parcela <> vl_ultima_parcela) then
         begin
            vl_parcela := vl_ultima_parcela;
         end;

         try
            qyFinCartoesParcelas.Close();
            qyFinCartoesParcelas.SQL.Clear();
            qyFinCartoesParcelas.SQL.Add('INSERT INTO fin_cartoes_parcelas ( ');
            qyFinCartoesParcelas.SQL.Add('cd_cartao, nr_parcela, vl_parcela, dt_previsao_cr, dt_credito, cd_caixa, sn_baixado) ');
            qyFinCartoesParcelas.SQL.Add('VALUES ( ');
            qyFinCartoesParcelas.SQL.Add( objFinCartao.getValorCampo('cd_cartao') + ', '  );
            qyFinCartoesParcelas.SQL.Add( IntToStr(iParcela) + ', '  );

            vl_parcela_str := FloatToStrF( vl_parcela, ffFixed, 15, 2 );
            vl_parcela_str := substituiCaracter( vl_parcela_str, ',', '.');

            qyFinCartoesParcelas.SQL.Add( QuotedStr( vl_parcela_str ) + ', '  );

            qyFinCartoesParcelas.SQL.Add( QuotedStr( FormatDateTime( 'yyyy-mm-dd', dt_previsao ) ) + ', '  );
            qyFinCartoesParcelas.SQL.Add( 'NULL , '  );
            qyFinCartoesParcelas.SQL.Add( getCdCaixa + ' , '  );
            qyFinCartoesParcelas.SQL.Add( '0); ' );
            qyFinCartoesParcelas.ExecSQL;
         except on E: EZDatabaseError do
            TrataErroBanco( qyFinCartoesParcelas, E );
         end;

         dt_previsao := getProximoMes( dt_previsao_inicial, dt_previsao );
      end;

   end;
end;

function TfrmMensalidadeBaixaCartao.getCdCaixa: string;
begin
   Result := Self.cd_caixa;
end;

function TfrmMensalidadeBaixaCartao.getDataAtual: TDateTime;
begin
   Result := Self.data_atual;
end;

function TfrmMensalidadeBaixaCartao.getDataPrevisao(dt_previsao: TDateTime): TDateTime;
var
   tp_transacao   : string;
   data_prevista  : TDateTime;
begin
   data_prevista := dt_previsao;
   if objFinCartao <> nil then
   begin
      tp_transacao := objFinCartao.getValorCampo('tp_transacao');

      //se o tipo da transação for crédito
      if  tp_transacao = 'C' then
      begin
         data_prevista :=  dt_previsao + dias_previsao_credito;
      end;
      //se o tipo da transação for débito
      if tp_transacao = 'D' then
      begin
         data_prevista := dt_previsao + dias_previsao_debito;
      end;
   end;

   Result := data_prevista;
end;

function TfrmMensalidadeBaixaCartao.getProximoMes( dtPrevisaoInicial: TDateTime;
dtPrevisao: TDateTime ): TDateTime;
var
   wano           : word;
   wmes           : word;
   wdia           : word;
   wInicialAno    : word;
   wInicialMes    : word;
   wInicialDia    : word;
begin
   // A proxima parcela deve ter vencimento no próximo mês no mesmo dia da data inicial
   DecodeDate( dtPrevisaoInicial,  wInicialAno,   wInicialMes,   wInicialDia );
   DecodeDate( dtPrevisao, wano,   wmes,  wdia );

   wmes := wmes + 1;

   if wMes > 12 then
   begin
      wmes := 1;
      wano := wano  + 1;
   end;

   Result := DataValida( wano, wmes, wInicialDia );
end;

function TfrmMensalidadeBaixaCartao.getValorTotal: double;
begin
   Result := RoundFloat(Self.vl_total, 2);
end;

function TfrmMensalidadeBaixaCartao.getValorUltimaParcela(
  vl_total_transacao: double; nr_parcelas: integer; vl_parcela: double): double;
var
   vl_total_calculado   : double;
   vl_ultima_parcela    : double;
begin
   vl_total_calculado   := RoundFloat( RoundFloat( vl_parcela , 2) * nr_parcelas, 2 );
   vl_ultima_parcela    := vl_parcela;
   if ( RoundFloat(vl_total_calculado, 2) ) <> ( RoundFloat(vl_total_transacao, 2) )  then
   begin
      //diminui uma parcela
      nr_parcelas := nr_parcelas - 1;

      vl_ultima_parcela := RoundFloat( RoundFloat( vl_parcela, 2 ) * nr_parcelas, 2 );
      vl_ultima_parcela := RoundFloat(vl_total_transacao - vl_ultima_parcela, 2);
   end;

   Result := RoundFloat(vl_ultima_parcela, 2);
end;

procedure TfrmMensalidadeBaixaCartao.habilitaBotoes(valor: Boolean);
begin
   btnIniciarTransacao.Enabled   := valor;
end;

procedure TfrmMensalidadeBaixaCartao.iniciaTransacao();
var
   cd_cartao : integer;
begin
   //desabilita botoes
   habilitaBotoes(false);
   
   if objFinCartao = nil then
   begin
      objFinCartao := TMBFinCartao.Create();
   end;

   objFinCartao.setValorCampo('vl_transacao', txtVlTotal.getValorString);

   objFinCartao.inserir();
   cd_cartao := DM.LastInsert;

   objFinCartao.setValorCampo('cd_cartao',    IntToStr(cd_cartao) );

   criaArquivoRequisicao();
   tempo_transacao.Enabled := false;
   terminal_ativo.Enabled := true;

end;

function TfrmMensalidadeBaixaCartao.lerValorArquivoResposta(
  sCampo: string): string;
var
   Arquivo        : TextFile;
   sLinha         : string;
   sValor         : string;
   sCaminho       : string;
   iTamanhoLinha  : integer;
begin
   sCaminho := Concat(pasta_resposta, nm_arquivo_resposta);
   sValor   := '';

   AssignFile( Arquivo, sCaminho );

   //envia o ponteiro de leitura para inicio do arquivo
   Reset( Arquivo );

   while not Eof ( Arquivo ) do
   begin
      ReadLn ( Arquivo, sLinha );

      iTamanhoLinha := Length( sLinha );

      if Copy(slinha, 1,7) = sCampo then
      begin
         sValor := Copy(slinha, 11, iTamanhoLinha );
         break;
      end;

   end;

   CloseFile( Arquivo );

   Result := trim(sValor);
end;

procedure TfrmMensalidadeBaixaCartao.MensagemCartao(msg: string;
  segundos: integer);
begin
   Application.CreateForm( TfrmMensalidadeBaixaMsgCartao, frmMensalidadeBaixaMsgCartao);
   frmMensalidadeBaixaMsgCartao.setMensagem( msg );
   frmMensalidadeBaixaMsgCartao.setSegundos( segundos );
   frmMensalidadeBaixaMsgCartao.ShowModal();
end;

procedure TfrmMensalidadeBaixaCartao.setCdCaixa(valor: string);
begin
   Self.cd_caixa := valor;
end;

procedure TfrmMensalidadeBaixaCartao.setDataAtual(valor: TDateTime);
begin
   Self.data_atual := valor;
end;

function TfrmMensalidadeBaixaCartao.setValorRequisicao(svalor: string) : string;
var
   valor_sem_formatacao : string;
   casa_decimal         : string;
begin
   casa_decimal := '';

   if Pos('.', svalor) = 0 then
   begin
      casa_decimal := '00'
   end;

   valor_sem_formatacao := substituiCaracter( svalor, '.', '');
   valor_sem_formatacao := Concat(valor_sem_formatacao, casa_decimal);

   Result := valor_sem_formatacao;
end;

procedure TfrmMensalidadeBaixaCartao.setValorTotal(valor: double);
begin
   Self.vl_total := RoundFloat(valor, 2);

   txtVlTotal.setValorDouble( FloatToStrF(Self.vl_total, ffFixed, 15, 2 ) );
end;

function TfrmMensalidadeBaixaCartao.substituiCaracter(valor, str_antigo,
  str_novo: string): string;
begin
   Result := StringReplace( valor, str_antigo, str_novo, [rfReplaceAll, rfIgnoreCase] );
end;

procedure TfrmMensalidadeBaixaCartao.tempo_transacaoTimer(Sender: TObject);
begin
   //recebeu o arquivo Intpos.001?
   if existeArquivo( Concat( pasta_resposta, nm_arquivo_resposta) ) = true then
   begin

      //se recebeu verifica se o campo 001-000 é igual ao do arquivo enviado
      if lerValorArquivoResposta('001-000') = trim(objFinCartao.getValorCampo('cd_cartao')) then
      begin
         terminal_ativo.Enabled  := false;
         tempo_transacao.Enabled := false;
         pnInfo.Visible          := false;

         if Self.operacaoCancelada = true then
         begin
            if Self.lerValorArquivoResposta('030-000') <> '' then
            begin
               MensagemCartao( Self.lerValorArquivoResposta('030-000'), 5 );
            end;
            habilitaBotoes(true);

            apagaArquivoResposta( nm_arquivo_status );
            apagaArquivoResposta( nm_arquivo_resposta );
            objFinCartao.apagar;
            FreeAndNil( objFinCartao );
         end
         else
         begin
            terminal_ativo.Enabled  := false;
            tempo_transacao.Enabled := false;

            if Self.lerValorArquivoResposta('030-000') <> '' then
            begin
               MensagemCartao( Self.lerValorArquivoResposta('030-000'), 5 );
            end;

            Self.atualizaFinCartao();
            Self.finalizaTransacao();

            //apaga arquivos
            apagaArquivoResposta( nm_arquivo_resposta );
            apagaArquivoResposta( nm_arquivo_status );


            //gera a(s) parcela(s)
            Self.gerarParcelas();

            FreeAndNil( objFinCartao );

            MensagemCartao('Transação concluída', 3);
            habilitaBotoes(true);
            Self.Close();
         end;

         exit;
      end;
   end;

   if pnInfo.Visible = false then
   begin
      terminal_ativo.Enabled  := false;
      contador                := 0;
      pnInfo.Caption          := 'Aguardando transação';
      pnInfo.Visible          := true;
   end;

   pnInfo.Caption := Concat(pnInfo.Caption, '.');
end;

procedure TfrmMensalidadeBaixaCartao.terminal_ativoTimer(Sender: TObject);
begin
   contador := contador + 1;

   //verifica se existe o arquivo de status
   if existeArquivo(  Concat(pasta_resposta, nm_arquivo_status) ) = true then
   begin
      terminal_ativo.Enabled  := false;
      contador := 0;
      pnInfo.Visible          := false;
      pnInfo.Caption          := '';
      tempo_transacao.Enabled := true;
      exit;
   end;

   //ativa o painel se não estiver ativo
   if (pnInfo.Visible = false) then
   begin
      tempo_transacao.Enabled := false;
      contador                := 0;
      pnInfo.Caption          := 'Aguardando resposta';
      pnInfo.Visible          := true;
   end;

   //acrescente pontos na string para indicar processamento.
   pnInfo.Caption := Concat(pnInfo.Caption, '.');

   //testa se o contador chegou no limite de espera.
   if contador = nr_segundos_espera_terminal then
   begin
      terminal_ativo.Enabled  := false;

      apagaArquivoRequisicao( nm_arquivo_requisicao );
      objFinCartao.apagar();
      FreeAndNil( objFinCartao );

      pnInfo.Visible          := false;
      contador                := 0;

      //mensagem de 3 segundos
      MensagemCartao( 'TEF não está ativo.', 3 );
      habilitaBotoes(true);
   end;
end;

function TfrmMensalidadeBaixaCartao.operacaoCancelada: Boolean;
var
   bResultado : boolean;
begin
   bResultado := false;

   if lerValorArquivoResposta('009-000') <> '0' then
   begin
      bResultado := true;
   end;

   Result := bResultado;
end;


end.
