unit uRetornoBanco;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ComCtrls, StdCtrls, UMComboBox, ExtCtrls, Buttons, DB,
  ZAbstractRODataset, ZAbstractDataset, UZDataset, Grids, DBGrids, ToolWin,
  ImgList, uColigada, general, md5, uGeneral, uConfiguraRetorno, ClassRegistros,
  UMDateTimePicker, uMensalidades_Baixar;

type
  TSituacao = (sAguardandoProcessamento, sOcorrenciaInexistente, sNNNaoEncontrado, sValorDivergente, sJaPago, sNegociado, sCancelado, sNNDuplicado, sRegistroInformativo, sRegistroProcessado, sDesconto );
  {
  0: sAguardandoProcessamento = Já foi identificado o aluno, mas está aguardando a baixa
  1: sOcorrenciaInexistente = Código de OC fornecido pelo banco não está configurado no sistema;
  2: sNNNaoEncontrado = Não foi possível identificar de quem é o NN
  3: sValorDivergente = O Valor está divergente, título não baixado
  4: sJaPago = O título já foi baixado, a baixa terá que ser manual
  5: sNegociado = O título pago está negociado
  6: sCancelado = O título pago está cancelado ou negociado
  7: sNNDuplicado = O NN está duplicado * Analisar essa situação
  8: sDesconto = O título está com desconto 100% (situacao 6 ou 7)
  10: sRegistroProcessado = * Analisar, não sei para que serve

  }
  TfrmRetornoBanco = class(TForm)
    Panel5: TPanel;
    Label2: TLabel;
    Panel1: TPanel;
    cbColigadas: TUMComboBox;
    PageControl1: TPageControl;
    tsArquivo: TTabSheet;
    tsHistorico: TTabSheet;
    Panel2: TPanel;
    Panel3: TPanel;
    qryRetorno: TUMZQuery;
    qryRetornoDataRetorno: TDateTimeField;
    qryRetornoBaixados: TSmallintField;
    qryRetornoRejeitados: TSmallintField;
    qryRetornoNomeArquivo: TStringField;
    qryRetornooutras_ocorrencias: TSmallintField;
    qryRetornocd_banco: TStringField;
    qryRetornocodigo: TIntegerField;
    qryRetornousuario: TIntegerField;
    qryRetornonm_coligada: TStringField;
    qryRetornocd_coligada: TSmallintField;
    qryRetornods_caixa: TStringField;
    dtcRetorno: TDataSource;
    grd: TDBGrid;
    Panel4: TPanel;
    Panel6: TPanel;
    Label1: TLabel;
    txtArquivo: TEdit;
    btnCodigoDepartamento: TSpeedButton;
    Label3: TLabel;
    ImageList1: TImageList;
    ToolBar: TToolBar;
    ToolButton2: TToolButton;
    btnImprimirTudo: TToolButton;
    btnImprimirBaixas: TToolButton;
    ToolButton7: TToolButton;
    ToolButton1: TToolButton;
    ToolButton5: TToolButton;
    btFechar: TToolButton;
    ToolButton9: TToolButton;
    SpeedButton1: TSpeedButton;
    Label4: TLabel;
    Bevel1: TBevel;
    Bevel2: TBevel;
    Label5: TLabel;
    Label6: TLabel;
    sbAtualizar: TSpeedButton;
    OpenDialog: TOpenDialog;
    tblBanco: TUMZQuery;
    tblBancocd_banco: TStringField;
    tblBanconm_banco: TStringField;
    tblBanconn_inicio: TSmallintField;
    tblBanconn_tam: TSmallintField;
    tblBancobanco_inicio: TSmallintField;
    tblBancobanco_tam: TSmallintField;
    tblBancoretorno_inicio: TIntegerField;
    tblBancoocorre_inicio: TSmallintField;
    tblBancoocorre_tam: TSmallintField;
    tblBancovl_titulo_inicio: TSmallintField;
    tblBancovl_titulo_tam: TSmallintField;
    tblBancovl_pago_inicio: TSmallintField;
    tblBancovl_pago_tam: TSmallintField;
    tblBancovl_acresc_inicio: TSmallintField;
    tblBancovl_acresc_tam: TSmallintField;
    tblBancosequencia_inicio: TSmallintField;
    tblBancosequencia_tam: TSmallintField;
    tblBancodt_pgto_inicio: TSmallintField;
    tblBancodt_pgto_tam: TSmallintField;
    tblBancods_layout: TStringField;
    tblBancolayout_inicio: TSmallintField;
    tblBancolayout_tam: TSmallintField;
    tblBanconr_linha_header: TSmallintField;
    tblBanconr_linha_trailer: TSmallintField;
    tblBanconr_linha_registro: TSmallintField;
    tblBancoconta_inicio: TSmallintField;
    tblBancoconta_tam: TSmallintField;
    tblBancomotivo_inicio: TSmallintField;
    tblBancomotivo_tam: TSmallintField;
    tblBancotarifa_inicio: TSmallintField;
    tblBancotarifa_tam: TSmallintField;
    tblBancosn_acrescimo_separado: TSmallintField;
    tblBancodt_pgto_formado: TStringField;
    tblBancodt_credito_inicio: TSmallintField;
    tblBancodt_credito_tam: TSmallintField;
    tblBancodt_credito_formato: TStringField;
    tblBancolinha_ignorar_inicio: TSmallintField;
    tblBancolinha_ignorar_tamanho: TSmallintField;
    tblBancolinha_ignorar_texto: TStringField;
    tblBancocarteira_inicio: TSmallintField;
    tblBancocateira_tam: TSmallintField;
    tblBanconn_inicio2: TSmallintField;
    tblBanconn_tam2: TSmallintField;
    tblBancocarteira_nn1: TStringField;
    tblBancocarteira_nn2: TStringField;
    tblBancofl_dt_pgto_inicio: TIntegerField;
    tblBancofl_dt_pgto: TStringField;
    tblBancods_separador_colunas: TStringField;
    tblBanconr_cpf_inicio: TSmallintField;
    tblBanconr_cpf_tam: TSmallintField;
    tblBancodt_venc_inicio: TSmallintField;
    tblBancodt_venc_tam: TSmallintField;
    tblBancodt_venc_formato: TStringField;
    tblBancosn_liberar_juros: TSmallintField;
    lbBanco: TLabel;
    blmoldura: TBevel;
    lblReg: TLabel;
    Bar: TProgressBar;
    btnBaixar: TSpeedButton;
    qryItens: TUMZQuery;
    dtcItens: TDataSource;
    Panel7: TPanel;
    ToolBar1: TToolBar;
    btBaixar: TToolButton;
    ToolButton8: TToolButton;
    sbSelecionarColuna: TSpeedButton;
    ToolButton10: TToolButton;
    btnFechar: TToolButton;
    grdItens: TDBGrid;
    Panel8: TPanel;
    Label7: TLabel;
    Bevel3: TBevel;
    Label8: TLabel;
    txtQtd_linhas: TEdit;
    Label9: TLabel;
    txtSoma_titulos: TEdit;
    Label10: TLabel;
    txtSoma_creditos: TEdit;
    Label11: TLabel;
    txtSituacao: TEdit;
    Panel9: TPanel;
    qryItensTotal: TUMZQuery;
    qryItenscd_retorno: TIntegerField;
    qryItensnr_sequencia: TIntegerField;
    qryItensnr_nossonumero: TStringField;
    qryItenscd_ocorrencia: TStringField;
    qryItenscd_motivo: TStringField;
    qryItensdt_pagamento: TDateTimeField;
    qryItensdt_credito: TDateTimeField;
    qryItensvl_titulo: TFloatField;
    qryItensvl_pago: TFloatField;
    qryItensvl_tarifa: TFloatField;
    qryItensds_ocorrencia: TStringField;
    qryItensds_motivo: TStringField;
    qryItensTotalqtd_linhas: TLargeintField;
    qryItensTotalsoma_titulos: TFloatField;
    qryItensTotalsoma_pagos: TFloatField;
    qryItensTotalsoma_tarifas: TFloatField;
    Label12: TLabel;
    txtSoma_Tarifas: TEdit;
    Bar2: TProgressBar;
    qryItenssn_baixar: TStringField;
    qryItenscd_caixa: TIntegerField;
    qryItenscd_situacao: TIntegerField;
    qryItensds_situacao: TStringField;
    qryItensvl_acrescimo: TFloatField;
    qryItensTotalds_situacao: TStringField;
    qryItensnm_pessoa: TStringField;
    qryItensnm_resp: TStringField;
    qryItenscd_pessoa: TIntegerField;
    qryItenscd_resp: TIntegerField;
    qryItensvl_soma_baixas: TFloatField;
    qryTitulos: TUMZQuery;
    qryTituloscd_retorno: TIntegerField;
    qryTitulosnr_sequencia: TIntegerField;
    qryTituloscd_mensalidade: TIntegerField;
    qryTitulosvl_titulo: TFloatField;
    qryTitulosdescontoextra: TFloatField;
    qryTitulosvl_desc_calc: TFloatField;
    qryTitulosvalorextra: TFloatField;
    qryTitulosvalorpago: TFloatField;
    qryTitulosvl_total: TFloatField;
    qryTitulosds_tipo_titulo: TStringField;
    qryTitulosdatavencimento: TDateTimeField;
    qryTitulosparcela: TSmallintField;
    btnTitulos: TToolButton;
    ToolButton12: TToolButton;
    qryItensds_cor: TStringField;
    sbBaixar: TSpeedButton;
    qryItensds_observacao: TStringField;
    btnEstornar: TToolButton;
    qryTituloscd_mensalidade_origem: TIntegerField;
    ToolButton11: TToolButton;
    qryItensTotalsn_tarifa_lancada: TSmallintField;
    qryTarifaTotal: TUMZQuery;
    qryTarifaTotaldt_credito: TDateTimeField;
    qryTarifaTotalcd_caixa: TIntegerField;
    qryTarifaTotalsoma_tarifas: TFloatField;
    qryTarifaTotalsn_tarifa_lancada: TSmallintField;
    qryItensTotalqtd_baixados: TLargeintField;
    qryItensTotalqtd_informativos: TLargeintField;
    qryItensTotalqtd_pendentes: TLargeintField;
    tblBancotarifa_inicio2: TIntegerField;
    tblBancotarifa_tam2: TIntegerField;
    qryItenssn_ocorrencia: TStringField;
    btnRegras: TToolButton;
    ToolButton14: TToolButton;
    qryRetornoqtd_boletos: TStringField;
    qryItensdt_vencimento: TDateTimeField;
    btnLogs: TToolButton;
    ToolButton4: TToolButton;
    qryTitulosvalorjuros: TFloatField;
    dtpFim: TUMDateTimePicker;
    dtpInicio: TUMDateTimePicker;
    qryItensbaixados: TIntegerField;
    qryItensrejeitados: TIntegerField;
    qryItensoutras_ocorrencias: TIntegerField;
    procedure dtpInicioChangeDate(Sender: TObject);
    procedure dtpFimChangeDate(Sender: TObject);
    procedure btnLogsClick(Sender: TObject);
    procedure grdItensTitleClick(Column: TColumn);
    procedure ToolButton1Click(Sender: TObject);
    procedure btnImprimirBaixasClick(Sender: TObject);
    procedure btnImprimirTudoClick(Sender: TObject);
    procedure btnRegrasClick(Sender: TObject);
    procedure btBaixarClick(Sender: TObject);
    procedure btnEstornarClick(Sender: TObject);
    procedure grdDblClick(Sender: TObject);
    procedure grdItensDrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumn; State: TGridDrawState);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure btnTitulosClick(Sender: TObject);
    procedure dtcItensDataChange(Sender: TObject; Field: TField);
    procedure sbSelecionarColunaClick(Sender: TObject);
    procedure sbBaixarClick(Sender: TObject);
    procedure PageControl1Change(Sender: TObject);
    procedure txtArquivoChange(Sender: TObject);
    procedure btnBaixarClick(Sender: TObject);
    procedure btnCodigoDepartamentoClick(Sender: TObject);
    procedure SpeedButton1Click(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure btFecharClick(Sender: TObject);
    procedure sbAtualizarClick(Sender: TObject);
    procedure cbColigadasCloseUp(Sender: TObject);
    procedure cbColigadasChange(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormCreate(Sender: TObject);
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
    CobFile : TextFile;
    lngSize : LongInt;
    bTarifaPorOcorrencia : Boolean;
    lngLidos : LongInt;
    Baixado : Word;
    sOrdem : String;
    PrecisaAtualizarRetorno : Boolean;
    NomeArquivoRetorno : String;

    slColunas : TStringlist;

    sColCarteira : String;
    sColValTarifa : String;
    sColValPago : String;
    sColSequencia : String;
    sColCPF : String;
    sColVencimento : String;
    sColOrdem : String;
    strNossoNumero : String;
    matCobranca : string;
    Tarifa : Currency;

    md5_arquivo : string;    

    iColCPF, iColVencimento : Integer;

    ValPago : Currency;
    ValTitulo : Currency;
    ValAcrescimo : Currency;

    pLimiteJuros : Currency;
    pLimiteDescontos : Currency;
    pBaixarParcial : String;
    pRetirarDesconto : String;
    qyTemp1 : TUMZQuery;
    qyTemp2 : TUMZQuery;
    
    Procedure Montar(valor : Boolean);
    Procedure FiltrarArquivos();
    Procedure CapturarArquivo();
    Procedure ProcessarArquivo();
    Function LerArquivo() : Boolean;
    Procedure AtualizarParametros();
    Function DescobrirLayout() : boolean;
    function selecionaContaBaixar(sConta : String) : Integer;
    function pega_data_credito : String;
    function pega_data_pgto : String;
    Procedure FiltrarConteudo ();
    function BuscaNossoNumero( strNumero : String; sFiltro : String ) : Boolean;
    Procedure AtualizarSituacaoItem (cd_retorno : Integer; cd_linha : Integer; cd_situacao : TSituacao; cd_resp : Integer = 0; cd_pessoa : Integer = 0; dt_vencimento: TDateTime = 0; ds_obs : string = '');
    procedure BaixarMensa( Conta : Integer; ValorBaixa : Currency; ValorDesconto : Currency; ValorJuros : Currency );
    Procedure BaixarMensaManualmente;
    procedure InserirItem();
    Procedure LancarTarifa();
    Procedure AtualizarRetorno();
    function buscaSiglaSitPorNN(nossoNumero: String): String;
    Function BaixarDuplicados(Valor: Currency; Conta: Integer) : Currency;
    function getMensalidades(nr_nossonumero: String): uMensalidades_Baixar.TDynamicIntArray;

    function hasNFGerada(nossoNumero: String): Boolean;
    // Procedure ProcessarItens();


  public
    { Public declarations }
  end;

var
  frmRetornoBanco: TfrmRetornoBanco;

implementation

uses uDM, uCamposPlanilhas, uSelCaixa, Main, uClassMovimento, uRetornoTitulos, uUsuario,
  uEstorno, uRepRecibo;

{$R *.dfm}

procedure TfrmRetornoBanco.btnBaixarClick(Sender: TObject);
begin
   IF LerArquivo() then begin ;   // Só entra se conseguir ler o arquivo.
      // Posicionar no conteúdo - itens
      FiltrarConteudo();
      PageControl1.ActivePage := tsHistorico;

      //Processar as baixas
      sbBaixarClick(nil);
      PrecisaAtualizarRetorno := true;
   end;
end;

procedure TfrmRetornoBanco.btnCodigoDepartamentoClick(Sender: TObject);
begin
    CapturarArquivo();
end;

function TfrmRetornoBanco.BuscaNossoNumero(strNumero, sFiltro: String): Boolean;
Var
   NovoNN : String;
   qBuscaBoleto : TUMZQuery;
   chaves : String;
   CdMensalidade : String;
begin

  // A busca de NN na verdade prepara a tabela de mensalidades para efetuar a baixa.
  // O sistema traz em dm.tblmensalidades as linhas que deverão ser baixadas


  // Busca normal pelo Nosso número

  if Pos(';', strNumero) > 0  then begin
     // Está passando informações de busca por CPF / Vencimento
     sColCPF := Copy(strNumero, 1, Pos(';', strNumero) - 1);
     sColVencimento := Copy(strNumero, Pos(';', strNumero) + 1, 10);
     strNumero := ''
  end;


  if Trim(strNumero) <> '' then begin

      NovoNN := strNumero;

      // IF Length(NovoNN) < 8 then begin
      //   NovoNN := FillString(NovoNN, alRight, '0', 8, false);
      // end;

      Result := False;

      // Alterado por claudionor 14/01

      if sFiltro = '' then Begin
         Dm.tblMensalidades.SQL.Clear();
         Dm.tblMensalidades.SQL.Text :=
           ' SELECT * from Mensalidades WHERE ' +
           // Alterado por Claudionor: 12/05/2015
           // ' CONCAT(REPEAT("0",' + IntToStr(Length(NovoNN)) + ' -length(nossonumero)), nossonumero) = ''' + NovoNN + ''' ' +
           ' nossonumero = ''' + NovoNN + ''' ' +
           ' ORDER BY valorbruto DESC ';

      End else Begin
         Dm.tblMensalidades.SQL.Clear();
         Dm.tblMensalidades.SQL.Text :=
           ' SELECT * from Mensalidades WHERE ' +
           ' nossonumero = ''' + NovoNN + ''' AND ' +

           sFiltro +
           ' ORDER BY valorbruto DESC ';
      End;

      Dm.tblMensalidades.Open();
      Dm.tblMensalidades.FetchAll();

      Result := Dm.tblMensalidades.RecordCount > 0;

      if not Result AND Dm.isTrue(qryItenssn_baixar.AsString) then begin
         // Primeiro verificar se já está BAIXADO e PAGO..

         Dm.tblMensalidades.close();
         Dm.tblMensalidades.SQL.Clear();
         Dm.tblMensalidades.SQL.Text :=
           ' SELECT * from Mensalidades WHERE ' +
           ' nossonumero = ''' + NovoNN + ''' AND  (situacao = 0 OR situacao = 1) ' + 
           ' ORDER BY valorbruto DESC ';
         Dm.tblMensalidades.Open();
         Dm.tblMensalidades.FetchAll();

         IF (Dm.tblMensalidades.RecordCount > 0) THEN begin

            // Se não encontrou a parcela como pendente, mas encontrou como paga, então não restaurar o nosso número.
            Result := false ;
            Exit;

         end;

         // Se não encontrou nada, e for BAIXA, tentar identificar o NN na impressão do boleto

         // Pesquisar um boleto impresso com esse NN, relacionando com a mensalidade
         // do mesmo aluno, mesmo vencimento e mesmo valorbruto e pendente para baixa
         DM.CriarConsulta(qBuscaBoleto);
         qBuscaBoleto.Close();
         qBuscaBoleto.SQL.Text :=
              ' SELECT '+
              '    m.codigoaluno, '+
              '    m.anosemestre, '+
              '    m.cd_coligada, '+
              '    m.turma, '+
              '    m.parcela, '+
              '    m.datavencimento, '+
              '    m.cd_mensalidade, '+
              '    m.cd_caixa, '+
              '    m.nossonumero '+
              ' FROM '+
              '    fin_boleto AS b '+
              ' INNER JOIN ( '+
              '    SELECT '+
              '       sum(valorextra)valorextra, '+
              '       sum(valorbruto)valorbruto, '+
              '       sum(descontoextra)descontoextra, '+
              '       sum(valorjuros)valorjuros, '+
              '       codigoaluno, '+
              '       datavencimento, '+
              '       situacao, '+
              '       nossonumero, '+
              '       anosemestre, '+
              '       cd_coligada, '+
              '       turma, '+
              '       parcela, '+
              '       GROUP_CONCAT(cd_mensalidade) as cd_mensalidade, '+
              '       cd_caixa '+
              '    FROM '+
              '       mensalidades '+
              '    GROUP BY '+
              '       codigoaluno, '+
              '       anosemestre, '+
              '       cd_coligada, '+
              '       turma, '+
              '       datavencimento, '+
              '       cd_caixa, '+
              '       nossonumero) AS m ON ( '+
              '    m.codigoaluno = b.cd_pessoa '+
              '    AND m.datavencimento = b.dt_vencimento '+
              '    AND round((COALESCE(m.valorbruto, 0) + COALESCE(m.valorextra, 0) - COALESCE(m.descontoextra, 0) + COALESCE(m.valorjuros, 0)), 2) = round(b.vl_boleto, 2) '+
              ' ) '+
              ' WHERE '+
              '    b.nr_nossonumero = :nossonumero '+
              '    AND situacao IN (2, 10)  ';
              
         qBuscaBoleto.ParamByName('nossonumero').AsString := NovoNN;
         qBuscaBoleto.Open();

         if qBuscaBoleto.RecordCount = 1 then
         begin
            // Somente considerar se achar um único registro
            // se não achar, ou achar mais, não baixar

            // Guardar um LOG da alteração do NN na planilha de mensalidades

            chaves := FillString(qBuscaBoleto.FieldByName('codigoaluno').AsString, alRight, '0', 10, true ) + ';' +
                      qBuscaBoleto.FieldByName('anosemestre').AsString + ';' + qBuscaBoleto.FieldByName('turma').AsString + ';' +
                      qBuscaBoleto.FieldByName('parcela').AsString + ';' +
                      FormatDateTime('dd/mm/yyyy',qBuscaBoleto.FieldByName('datavencimento').AsDateTime) + ';';

            DM.setLog(2013, 'alteracao', chaves, qBuscaBoleto.FieldByName('cd_coligada').AsInteger, 'Restauração de NN (NN Atual = "'+ qBuscaBoleto.FieldByName('nossonumero').AsString +'" NN Novo = "' + NovoNN +  '" )');

            CdMensalidade := qBuscaBoleto.FieldByName('cd_mensalidade').AsString;

            // Preparar a tabela de mensalidades para baixar nesta
//            IntToStr(CdMensalidade);

            Dm.tblMensalidades.Close();
            DM.tblMensalidades.SQL.Text :=
              ' SELECT * from Mensalidades WHERE ' +
              '   cd_mensalidade IN (' + CdMensalidade + ')';

            // Alterar a Mensalidade
            qBuscaBoleto.Close();
            qBuscaBoleto.SQL.Text := 'UPDATE mensalidades SET nossonumero = ''' + NovoNN + ''' WHERE cd_mensalidade IN (' + CdMensalidade + ')';
            qBuscaBoleto.ExecSQL();

            // Abrir a tabela
            Dm.tblMensalidades.Open();
            Dm.tblMensalidades.FetchAll();

            // Mudar o resultado para verdadeiro para baixar nessa mensalidade
            Result := true
         end;
         FreeAndNil(qBuscaBoleto);
      end;

  end else begin
     // Busca por CPF e Vencimento
     if (sColCPF <> '') AND (sColVencimento <> '') then begin

         Result := False;

         if sFiltro <> '' then begin
            sFiltro := ' AND ' + sFiltro;
         end;

         if tblBancocd_banco.AsString = 'FIE' then begin
           sFiltro := sFiltro + ' AND r.sn_nao_bloquear_financeiro = 1 ';
         end;


         Dm.tblMensalidades.SQL.Clear();
         Dm.tblMensalidades.SQL.Text :=
           ' SELECT Mensalidades.* from Mensalidades ' +
           ' INNER JOIN pessoas ON (pessoas.cd_pessoa = Mensalidades.codigoaluno) ' +
           ' INNER JOIN pessoas as r ON (r.cd_pessoa = Mensalidades.cd_resp)  ' +
           ' WHERE ' +
           '  pessoas.ds_cpf = :ds_cpf AND Mensalidades.datavencimento = :dt_venc ' +
           sFiltro +
           ' ORDER BY valorbruto DESC ';


         DM.tblMensalidades.ParamByName('ds_cpf').AsString := sColCPF;
         DM.tblMensalidades.ParamByName('dt_venc').AsString := FormatDateTime('yyyy-mm-dd', StrToDate(sColVencimento) );

         Dm.tblMensalidades.Open();
         Dm.tblMensalidades.FetchAll();

         Result := Dm.tblMensalidades.RecordCount > 0;

     
     end else begin

        Result := false;

     end;
     
  end;

end;

function TfrmRetornoBanco.buscaSiglaSitPorNN(nossoNumero: String): String;
const
   SQL_BUSCA_SIGLA_NN =
   'SELECT ds_sigla_situacao '+
   'FROM mensalidades M      '+
   'INNER JOIN situacoes_financeiras S ON (S.cd_situacao = M.situacao) '+
   'WHERE m.nossonumero like ''%';
var
   qryBuscaSigla : TUMZQuery;
begin
   dm.CriarConsulta(qryBuscaSigla);
   qryBuscaSigla.SQL.Add(SQL_BUSCA_SIGLA_NN);
   qryBuscaSigla.SQL.Text := SQL_BUSCA_SIGLA_NN + nossoNumero + '%''';
   qryBuscaSigla.Open;
   result := qryBuscaSigla.FieldByName('ds_sigla_situacao').AsString;
   qryBuscaSigla.Close;
   FreeAndNil( qryBuscaSigla );
end;

procedure TfrmRetornoBanco.CapturarArquivo;
Var Arquivo: TextFile;
    linha : string;
    qyControle : TUMZQuery;
begin
  { Essa procedure apenas abre o arquivo de retorno, verifica se ele está dentro dos padrões de um arquivo de retorno
    configurado no sistema, verifica qual o layout será utilizado, e a quantidade de registros dentro do arquivo
  } 

  // Abrir a caixa para selecionar arquivos
  if OpenDialog.Execute then
     txtArquivo.Text := OpenDialog.FileName
  else
     Exit;


  // verificar se existe algum layout cadastrado para este retorno
  if not DescobrirLayout then Exit;

  { Mostra o Banco }
  lbBanco.Caption := 'Layout :' + tblBanconm_banco.AsString;

  AssignFile( Arquivo, OpenDialog.FileName );
  Reset( Arquivo );

  md5_arquivo := '';

  lngSize := 0;
  readln(Arquivo, linha);

  //Contar a quantiadde de linhas do arquivo;

  while not EOF(Arquivo) do
  Begin
     // Pegar o MD5 da linha e ir concatenando
     md5_arquivo := md5_arquivo + MD5Print(MD5String(linha));

     if trim(linha) <> '' then begin

       if (tblBancolinha_ignorar_inicio.AsInteger > 0) AND (lngSize > tblBanconr_linha_header.AsInteger) then begin

          if copy(linha, tblBancolinha_ignorar_inicio.AsInteger, tblBancolinha_ignorar_tamanho.AsInteger) <> tblBancolinha_ignorar_texto.AsString then begin

              INC(lngSize);

//          end else begin
//             DEC(lngSize);
          end;

       end else begin
           INC(lngSize);
       end;
     end;

     readln(Arquivo, linha);
  End;

  if trim(linha) <> '' then begin
     md5_arquivo := md5_arquivo + MD5Print(MD5String(linha));
     INC(lngSize);
  end;

  CloseFile(Arquivo);  

  // Calcular o MD5 final
  md5_arquivo :=  MD5Print(MD5String(md5_arquivo));

  // Verificar a existencia do arquivo
  Dm.CriarConsulta( qyControle );
  qyControle.Close();
  qyControle.SQL.Text := 'SELECT codigo, dataretorno, COALESCE(baixados, 0) + COALESCE(rejeitados, 0) + COALESCE(outras_ocorrencias, 0) as qtd FROM retorno ' +
                         ' WHERE md5_arquivo = "' + md5_arquivo + '" ';
  qyControle.Open;

  if NOT qyControle.EOF then begin
     if qyControle.FieldByName('qtd').AsInteger = 0 then begin
     
         Mensagem( 'Atenção: ' + CHR(13) + CHR(13) +
                   'Este arquivo já foi processado no dia '+ FormatDateTime('dd/mm/yyyy', qyControle.FieldByName('dataretorno').AsDatetime) +' através do código de retorno '+qyControle.FieldByName('codigo').AsString+' de forma incompleta.' + CHR(13) + CHR(13) +
                   'O sistema irá excluir o retorno anterior e reprocessar o arquivo agora.'
                   // + CHR(13) + CHR(13) + 'Deseja visualizar este retorno?'
                   , Application.Title, MB_OK + MB_ICONWARNING );

         qyTemp1.Close();
         qyTemp1.SQL.Text := 'DELETE FROM retorno_itens WHERE cd_retorno = ' + qyControle.FieldByName('codigo').AsString;
         qyTemp1.ExecSQL();

         qyTemp1.Close();
         qyTemp1.SQL.Text := 'DELETE FROM retorno WHERE codigo = ' + qyControle.FieldByName('codigo').AsString ;
         qyTemp1.ExecSQL();

         qyTemp1.Close();     


     end else begin

         // O arquivo já existe, informar e não processar

         Mensagem( 'Atenção: ' + CHR(13) + CHR(13) +
                   'Este arquivo já foi processado no dia '+ FormatDateTime('dd/mm/yyyy', qyControle.FieldByName('dataretorno').AsDatetime) +' através do código de retorno '+qyControle.FieldByName('codigo').AsString+'.'
                   // + CHR(13) + CHR(13) + 'Deseja visualizar este retorno?'
                   , Application.Title, MB_OK + MB_ICONWARNING );

         // Iniciar uma nova transação para garantir que tudo seja executado
         FreeAndNil(qyControle);
         txtArquivo.Text := '';
         Montar(false);
         exit; // Vai sair da procedure, não executando o arquivo
     end;

  end;
  // Se chegou aqui, vai continuar
  Montar(True);

  lngSize := lngSize - tblBanconr_linha_header.AsInteger;
  lngSize := lngSize - tblBanconr_linha_trailer.AsInteger;

  lngSize := lngSize DIV tblBanconr_linha_registro.AsInteger;

  Bar.Max := lngSize;

  lblReg.Caption := 'Registros: ' + IntToStr( lngSize );

  FreeAndNil(qyControle);


end;

procedure TfrmRetornoBanco.cbColigadasChange(Sender: TObject);
var
  strColigadas : TStringList;
  i : Integer;
  sFiltro,sOperador : string;
begin
   if( cbColigadas.ItemIndex <> 0) then
   begin
      qryRetorno.Filter := 'cd_coligada ='+IntToStr(TColigada(cbColigadas.Items.Objects[cbColigadas.ItemIndex]).Codigo);
      qryRetorno.Filtered := True;
   end
   else
   begin
      sFiltro := '';
      strColigadas := explode(DM.GetColigadas,',');
      for I := 0 to strColigadas.Count - 1 do
      begin
         sFiltro := sFiltro +sOperador+' cd_coligada = '+strColigadas[i]+' ';
         sOperador := 'or'
      end;
      qryRetorno.Filter := sFiltro;
      qryRetorno.Filtered := True;
   end;

   btnBaixar.Enabled := cbColigadas.ItemIndex > 0;

end;

procedure TfrmRetornoBanco.cbColigadasCloseUp(Sender: TObject);
begin
   DM.SalvaColigada(cbColigadas);
end;

function TfrmRetornoBanco.DescobrirLayout;
var
  strbanco, strlayout, linha, linhaAux : String;
  n : Integer;
  Arquivo : TextFile;
begin

  // Neste momento, não conhecemos ainda o layout que o arquivo tem,
  // e nem a quantidade de linhas do cabeçalho
  // Por isso, será lida as 10 primeiras do arquivo e concatenada
  // É nessa string que o layout é procurado

  AssignFile( Arquivo, OpenDialog.FileName );
  Reset( Arquivo );

  linha := '';

  n := 1;
  while (n <= 10) AND (not EOF(Arquivo)) do Begin
     readln(Arquivo, linhaAux);
     linha := linha + linhaAux;
     inc(n);
  end;

  // Ler toda a tabela de parametros do retorno e procurar o layout

  tblBanco.Close;
  tblBanco.SQL.Clear;
  tblBanco.SQL.Add('SELECT * from banco_parametro_retorno');
  tblBanco.SQL.Add('ORDER by cd_banco, ds_layout');
  tblBanco.Open;

  tblBanco.First;

  { Testar todos os layout até encontrar o correto }

  while not tblBanco.Eof do
  begin
     strbanco  := Copy(linha, tblBancobanco_inicio.AsInteger, tblBancobanco_tam.AsInteger);
     strlayout := Copy(linha, tblBancolayout_inicio.AsInteger, tblBancolayout_tam.AsInteger);

     if (trim(strbanco) = Trim(tblBancocd_banco.AsString)) AND (trim(strlayout) = Trim(tblBancods_layout.AsString))
     then
     Begin
         { Encontrou o Layout Correto / Pode encerrar a procura e processar o arquivo }

         { A tabela banco ficará posicionada no banco correto }

         CloseFile(Arquivo);

         Result := True;
         Exit

     end;

     tblBanco.Next;
  end;

  { Se chegar aqui nenhum banco foi cadastrado }

  CloseFile(Arquivo);
  Result := false;

  Mensagem('Este arquivo não foi identificado como um arquivo de retorno válido.' + CHR(13) + CHR(13) +
           'Verifique se foi selecionado o arquivo correto.', 'Atenção', MB_OK + MB_ICONWARNING);

end;

procedure TfrmRetornoBanco.dtcItensDataChange(Sender: TObject; Field: TField);
begin
   qryTitulos.Close();
   qryTitulos.ParamByName('cd_retorno').AsInteger := qryItenscd_retorno.AsInteger;
   qryTitulos.ParamByName('nr_sequencia').AsInteger := qryItensnr_sequencia.AsInteger;
   qryTitulos.Open();

   // Analisar o botão baixar
   btBaixar.Enabled := ((qryItenscd_situacao.AsInteger in [0, 2, 3, 4, 5, 6, 7, 8]) AND (qryItenssn_baixar.AsString = 'S'));
   btnLogs.Enabled := btBaixar.Enabled;

   btnEstornar.Enabled := ((qryItenscd_situacao.AsInteger in [10]));

end;

procedure TfrmRetornoBanco.dtpFimChangeDate(Sender: TObject);
begin
      if dtpInicio.Date > dtpFim.Date then begin
         dtpInicio.Date := dtpFim.Date;
      end;
end;

procedure TfrmRetornoBanco.dtpInicioChangeDate(Sender: TObject);
Var
   DataFim : TDateTime;
   dia, mes, ano : Word;
   diaf, mesf, anof : Word;
begin
  // Ao mudar a data inicial, configurar de forma automática a data final para o
  // último dia do mês da data inicial
  DecodeDate(dtpInicio.Date, ano, mes, dia);
  DecodeDate(dtpFim.Date, anof, mesf, diaf);

  // Somente se mudar o mês, senão, manter a data final filtrada como está
  if (anof <> ano) OR (mesf <> mes) then begin
      DataFim := DataValida(ano, mes, 31);
      dtpFim.Date := DataFim;
  end else begin
      if dtpInicio.Date > dtpFim.Date then begin
         dtpFim.Date := dtpInicio.Date;
      end;

  end;
  
end;

procedure TfrmRetornoBanco.FiltrarArquivos;
const
   S_SQL_RETORNO =
       ' SELECT c.cd_coligada, c.nm_coligada ' +
       '      , r.codigo, r.dataretorno, r.usuario, r.baixados, r.rejeitados, r.outras_ocorrencias, r.md5_arquivo, r.nomearquivo, r.cd_banco, r.cd_caixa ' +
       '      , CAST( (IFNULL(r.baixados,0) + IFNULL(r.rejeitados,0) + IFNULL(r.outras_ocorrencias,0)) AS CHAR) as qtd_boletos ' + 
       '      , fcc.ds_caixa ' +
       '   FROM retorno as r' +
       '  INNER JOIN coligadas c ON (c.cd_coligada = r.cd_coligada) ' +
       '   LEFT JOIN fin_cadastro_contas fcc ON (fcc.cd_caixa = r.cd_caixa) ' +
       ' WHERE c.cd_coligada IN ( %s ) ' +
       '   AND r.dataretorno >= "%s" AND r.dataretorno <= "%s" ';


   S_SQL_RETORNO_MYSQL =
      S_SQL_RETORNO + ' ORDER BY r.codigo DESC ';

   S_SQL_RETORNO_ORACLE =
      S_SQL_RETORNO + ' ORDER BY r.codigo DESC ';

   function GetSQLByProtocol: string;
   begin
      if DM.db.Protocol = DB_PROTOCOL_ORACLE then
         Result := S_SQL_RETORNO_ORACLE
      else if DM.db.Protocol = DB_PROTOCOL_MYSQL then
         Result := S_SQL_RETORNO_MYSQL;

      { Filtrar somente as coligadas filhas logadas }
      Result := Format( Result, [DM.UsuarioLogado.GetColigadasFilhaSelecionada()
                                 , DateToStr(dtpInicio.Date, DM.fsDateTimeFormatPadrao)
                                 , DateToStr(dtpFim.Date + 1, DM.fsDateTimeFormatPadrao)] );
   end;

begin
   // Fitlrar a listagem de arquivos;

   qryRetorno.Close;
   qryRetorno.SQL.Text := GetSQLByProtocol;
   qryRetorno.Open;

end;

procedure TfrmRetornoBanco.FiltrarConteudo;
var
   sn_erro:Boolean;
CONST
   SQL_CONTEUDO = ' select ri.cd_retorno, ri.nr_sequencia, ri.nr_nossonumero, ri.cd_ocorrencia, ri.cd_motivo ' +
                   '      , ri.dt_pagamento, ri.dt_credito, ri.vl_titulo, ri.vl_acrescimo, ri.vl_pago, ri.vl_tarifa ' +
                   '      , IFNULL(bcr.ds_ocorrencia, ''Ocorrência não configurada'') as ds_ocorrencia ' +
                   '      , CAST(IF(ISNULL(bcr.ds_ocorrencia), 0, 1) AS CHAR) as sn_ocorrencia ' +
                   '      , IFNULL(brm.ds_motivo, '''') as ds_motivo ' +
                   '      , bcr.sn_baixar ' +
                   '      , ri.cd_caixa ' +
                   '      , ri.cd_situacao ' +
                   '      , si.ds_valor as "ds_situacao" ' +
                   '      , si.ds_sigla as "ds_cor" ' +
                   '      , ri.cd_pessoa ' +
                   '      , ri.cd_resp ' +
                   '      , ri.dt_vencimento ' +
                   '      , IFNULL(p.nm_pessoa, '''') as nm_pessoa ' +
                   '      , IFNULL(re.nm_pessoa, '''') as nm_resp ' +
                   '      , ROUND(SUM(IF(IFNULL(bcr.sn_baixar, '''')=''S'', me.valorpago, 0)),2) as vl_soma_baixas ' +
                   '      , ri.ds_observacao ' +
                   '      , r.baixados, r.rejeitados, r.outras_ocorrencias '+
                   '      FROM retorno_itens as ri ' +
                   '      INNER JOIN retorno as r ON (r.codigo = ri.cd_retorno) ' +
                   '      INNER JOIN situacoes as si ON (si.cd_situacao = ri.cd_situacao and si.cd_modulo = 2004) ' +
                   '      LEFT JOIN pessoas as p ON (p.cd_pessoa = ri.cd_pessoa) ' +
                   '      LEFT JOIN pessoas as re ON (re.cd_pessoa = ri.cd_resp) ' +
                   '      LEFT JOIN banco_codigo_retorno as bcr ON (bcr.cd_banco = r.cd_banco and bcr.cd_retorno = ri.cd_ocorrencia AND bcr.cd_origem = 1) ' +
                   '      LEFT JOIN banco_retorno_motivos as brm ON (brm.cd_banco = r.cd_banco and brm.cd_motivo = ri.cd_motivo AND brm.cd_grupo_motivos = bcr.cd_grupo_motivos and brm.cd_origem = 1 ) ' +
                   '      LEFT JOIN retorno_itens_titulos as rit ON (rit.cd_retorno = ri.cd_retorno and rit.nr_sequencia = ri.nr_sequencia) ' +
                   '      LEFT JOIN mensalidades as me ON (me.cd_mensalidade = rit.cd_mensalidade) ' +
                   '      where ri.cd_retorno = :cd_retorno ' +
                   '      GROUP BY ri.cd_retorno, ri.nr_sequencia ';


begin
   qryItens.Close();
   qryItens.SQL.Clear();
   qryItens.SQL.Add(SQL_CONTEUDO);
   qryItens.SQL.Add( ' ORDER BY ' + sOrdem  );
   qryItens.ParamByName('cd_retorno').AsInteger := qryRetornocodigo.AsInteger;

   qryItens.Open();

   qryItensTotal.Close();
   qryItensTotal.ParamByName('cd_retorno').AsInteger := qryRetornocodigo.AsInteger;
   qryItensTotal.Open();

   txtQtd_linhas.Text :=  qryItensTotalqtd_linhas.AsString;
   txtSoma_titulos.Text := qryItensTotalsoma_titulos.DisplayText;
   txtSoma_creditos.Text := qryItensTotalsoma_pagos.DisplayText;
   txtSoma_Tarifas.Text := qryItensTotalsoma_tarifas.DisplayText;
   txtSituacao.Text := qryItensTotalds_situacao.Text;

   sn_erro := ( (qryItensbaixados.AsInteger = 0) AND (qryItensrejeitados.AsInteger = 0) AND (qryItensoutras_ocorrencias.AsInteger = 0));

   // O campo de situação traz ok quando todos os registros foram processados/baixados corretamente.
   // Neste caso, a cor ficará verde, senão, amarela.
   if (qryItensTotalds_situacao.Text = 'OK') OR (sn_erro)  then
   begin
      txtSituacao.Color := clLime;
      sbBaixar.Enabled := False;
   end else begin
      txtSituacao.Color := clYellow;
      sbBaixar.Enabled := True;
   end;

end;

procedure TfrmRetornoBanco.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  FreeAndNil(qyTemp1);
  FreeAndNil(qyTemp2);
  Action := caFree;
end;

procedure TfrmRetornoBanco.FormCloseQuery(Sender: TObject;
  var CanClose: Boolean);
begin
   if btnTitulos.Tag = 1 then begin
      frmRetornoTitulos.Close();
   end;
end;

procedure TfrmRetornoBanco.FormCreate(Sender: TObject);
begin
  DM.MontarPlanilha(grd, 'planilha_retorno_campos_principal');
  DM.MontarPlanilha(grdItens, 'planilha_retorno_itens');
  Montar(false);

  sOrdem := ' nr_sequencia ';

  AtualizarParametros();

  DM.CriarConsulta(qyTemp1);
  DM.CriarConsulta(qyTemp2);
end;

procedure TfrmRetornoBanco.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  case Key of
    VK_F12 : btFecharClick( nil );
  end;
end;

procedure TfrmRetornoBanco.FormShow(Sender: TObject);
begin
   dtpInicio.Date := Dm.Dataatual() - 15;
   dtpFim.Date := Dm.Dataatual();

   DM.CarregaColigadas(cbColigadas, true );

   PageControl1.ActivePageIndex := 0;

   FiltrarArquivos();

   cbColigadasChange(nil);
end;

function TfrmRetornoBanco.getMensalidades(
  nr_nossonumero: String): uMensalidades_Baixar.TDynamicIntArray;
const
   SQL_BUSCA_MENSALIDADES =
      'SELECT '+
	   '   cd_mensalidade '+
      'FROM '+
      '	mensalidades '+
      'WHERE '+
      '	nossonumero = :nossonumero ';
var
   qyBuscaMensalidades: TUMZReadOnlyQuery;
   i: Integer;
begin
   DM.CriarConsulta(qyBuscaMensalidades);

   i := 0;

   qyBuscaMensalidades.SQL.Text := SQL_BUSCA_MENSALIDADES;
   qyBuscaMensalidades.ParamByName('nossonumero').AsString := nr_nossonumero;
   qyBuscaMensalidades.Open;

   SetLength(Result, qyBuscaMensalidades.RecordCount);

   while not qyBuscaMensalidades.Eof do
   begin
      Result[i] := qyBuscaMensalidades.FieldByName('cd_mensalidade').AsInteger;

      qyBuscaMensalidades.Next;
      Inc(i);      
   end;
end;

procedure TfrmRetornoBanco.grdDblClick(Sender: TObject);
begin
   PageControl1.ActivePage := tsHistorico;
   PageControl1Change(nil);
end;

procedure TfrmRetornoBanco.grdItensDrawColumnCell(Sender: TObject;
  const Rect: TRect; DataCol: Integer; Column: TColumn; State: TGridDrawState);
begin
   if Column.Field.FieldName = 'ds_situacao' then
   begin
      if NOT(gdSelected IN State) then
      begin
         TGeneral.AlterarCorCelula(grdItens, Rect, DataCol, Column, State, TGeneral.ColorFromHTML(qryItensds_cor.AsString));
      end;
   end;
end;

procedure TfrmRetornoBanco.grdItensTitleClick(Column: TColumn);
var
   n : Integer;
begin
   if grdItens.DataSource.DataSet.FieldByName(Column.FieldName).FieldKind <> fkData Then
   begin
      exit;
   end;

   For n:= 0 to grdItens.Columns.Count - 1 do
   begin
      grdItens.Columns[n].Title.Font.Style := [];
   end;

   if sOrdem = Column.FieldName then
   begin
     sOrdem := Column.FieldName + ' DESC ';
   end
   else
   begin
     sOrdem := Column.FieldName;
   end;

   Column.Title.Font.Style := [fsUnderline];

   FiltrarConteudo();
end;

function TfrmRetornoBanco.hasNFGerada(nossoNumero: String): Boolean;
const
   SQL_HAS_NF_GERADA =
      '  SELECT '+
      '     GROUP_CONCAT(nr_nf) AS notas '+
      '  FROM '+
      '     mensalidades '+
      '  WHERE '+
      '     nossonumero = :nossonumero ';
var
   qyHasNFGerada: TUMZReadOnlyQuery;
begin
   DM.CriarConsulta(qyHasNFGerada);

   qyHasNFGerada.SQL.Text := SQL_HAS_NF_GERADA;
   qyHasNFGerada.ParamByName('nossonumero').AsString := nossoNumero;
   qyHasNFGerada.Open;

   Result := (qyHasNFGerada.FieldByName('notas').AsString <> '');
end;

procedure TfrmRetornoBanco.InserirItem();
Var
   qAcao: TUMZQuery;
begin
   DM.CriarConsulta(qAcao);
   
   qAcao.SQL.Text :=
      ' REPLACE INTO retorno_itens_titulos (cd_retorno, nr_sequencia, cd_mensalidade) VALUES ' +
      ' (:cd_retorno, :nr_sequencia, :cd_mensalidade) ';

   qAcao.ParamByName('cd_retorno').AsInteger := qryItenscd_retorno.AsInteger;
   qAcao.ParamByName('nr_sequencia').AsInteger := qryItensnr_sequencia.AsInteger;
   qAcao.ParamByName('cd_mensalidade').AsInteger := DM.tblMensalidadescd_mensalidade.AsInteger;

   qAcao.ExecSQL();

   FreeAndNil(qAcao);
end;

procedure TfrmRetornoBanco.LancarTarifa;
Var
  mov : TMovimento;
  iMov : Integer;
  qyTarifa : TUMZQuery;
  iCentroTarifa, iContaTarifa : Integer;
  iTpConta : Word;
  iCodAberturaAtual : Integer;
begin
   qryTarifaTotal.Close();
   qryTarifaTotal.ParamByName('cd_retorno').AsInteger := qryRetornocodigo.AsInteger;
   qryTarifaTotal.Open();

   DM.CriarConsulta(qyTarifa);

   while not qryTarifaTotal.Eof do begin

       mov := TMovimento.Create;


       // Verificar se o caixa está aberto

       if not mov.VerificaContaAtiva(qryTarifaTotalcd_caixa.AsInteger, iTpConta, iCodAberturaAtual ) then begin
         Mensagem( 'Não é possível lançar a tarifa em um caixa inativo. A tarifa não será lançada.', Application.Title, MB_OK + MB_ICONSTOP );
         Screen.Cursor := crDefault;
         Exit;
       end;

       if (iTpConta = 3) AND (iCodAberturaAtual = 0) then begin
         Mensagem( 'Não é possível lançar a tarifa em um caixa fechado. A tarifa não será lançada..', Application.Title, MB_OK + MB_ICONSTOP );
         Screen.Cursor := crDefault;
         Exit;
       end;

       mov.Historico := Dm.variavel_parametro('financeiro_retorno_tarifa_historico');

       if mov.Historico = '' then begin
          mov.Historico := 'TARIFAS BANCÁRIAS - BOLETOS';
       end;

       mov.ValorMovimento := qryTarifaTotalsoma_tarifas.AsCurrency;

       mov.ValorEmDinheiro := qryTarifaTotalsoma_tarifas.AsCurrency;
       mov.ValorEmCheque   := 0;
       mov.Mensalidade     := 0;
       mov.EntradaSaida    := 2;  // Débito na Conta
       mov.CodAcao         := Dm.BuscarCodigoAcaoPadrao( 4 );
       mov.NumeroDocumento := ExtractFileName( qryRetornoNomeArquivo.AsString );
       mov.DataLiberacao := Dm.DataAtual();
       mov.Origem := 1; // Contas a Receber;

       mov.DataMovimento := qryTarifaTotaldt_credito.AsDateTime;

       mov.Coligada := qryRetornocd_coligada.AsInteger;

       iMov := mov.RegistrarMovimentacaoTe( qryTarifaTotalcd_caixa.AsInteger );

               // Buscar os códigos de plano de contas e centro de custo para tarifas

       qyTarifa.Close();
       qyTarifa.SQL.Text := ' SELECT cd_conta_tarifa, cd_centro_tarifa FROM fin_cadastro_contas ' +
                                    '  WHERE cd_caixa = ' +  IntToStr(qryTarifaTotalcd_caixa.AsInteger);

       qyTarifa.Open();

       iContaTarifa := qyTarifa.FieldByName('cd_conta_tarifa').AsInteger;
       iCentroTarifa := qyTarifa.FieldByName('cd_centro_tarifa').AsInteger;

       // Inserir apripriação para a tarifa

       qyTarifa.Close();

       qyTarifa.SQL.Text := 'INSERT INTO fin_apropria_te (cd_movimento_te, cd_coligada, cd_conta, cd_centro, vl_movimento) '+
                                    'VALUES  (:cd_movimento_te, :cd_coligada, :cd_conta, :cd_centro, :vl_movimento) ';

       qyTarifa.ParamByName('cd_movimento_te').AsInteger := iMov;
       qyTarifa.ParamByName('cd_coligada').AsInteger := qryRetornocd_coligada.AsInteger;

       qyTarifa.ParamByName('cd_conta').AsInteger := iContaTarifa;
       qyTarifa.ParamByName('cd_centro').AsInteger := iCentroTarifa;
       qyTarifa.ParamByName('vl_movimento').AsCurrency := qryTarifaTotalsoma_tarifas.AsCurrency;
       qyTarifa.ExecSQL();



       FreeAndNil( mov );

       qryTarifaTotal.Next();

   end;

   qryTarifaTotal.Close();

   qyTarifa.Close;
   qyTarifa.SQL.Clear;
   qyTarifa.SQL.Add('UPDATE retorno SET ');
   qyTarifa.SQL.Add('sn_tarifa_lancada = 1 ');
   qyTarifa.SQL.Add('WHERE codigo = :codigo');

   qyTarifa.ParamByName('codigo').AsInteger := qryRetornocodigo.AsInteger;
   qyTarifa.ExecSQL;

   FreeAndNil(qyTarifa);


end;

Function TfrmRetornoBanco.LerArquivo() : Boolean;
var
  Arquivo : TextFile;
  linha : String;
  nro_linha : integer;
  n : Integer;
  qyRetorno : TUMZQuery;
  qyInsert : TUMZQuery;
  qyMaxRetorno : TUMZReadOnlyQuery;
  qyControle : TUMZQuery;
  iContaBaixa : Integer;
  ValTarifa : Currency;

  iCaixa : Integer;

  sAux : String;
  sConta,
  strOcorrencia,
  strMotivo : string;

begin
   { Esta procedure faz a leitura do conteúdo do arquivo e carrega para a tabela retorno_itens
     Nesta procedure não é efetuada nenhuma baixa, apenas carregado o arquivo e verificado se os NN existem
   }

   Result := true;

   if cbColigadas.ItemIndex = 0 then
   begin
      Mensagem('Selecione uma Unidade de Ensino!', 'Aviso', MB_ICONWARNING + MB_OK);
      Result := false; 
      Exit;
   end;

   iCaixa := -1;

  // Se não tiver conta para baixa selecionada
  if tblBancoconta_inicio.AsInteger = 0 then begin

      // Não encontrou a Conta, pedir para selecionar

      Mensagem('Atenção' + CHR(13) + CHR(13) + 'Na próxima tela, você deverá selecionar a conta para efetuar os lançamentos das baixas e tarifas.', Application.Title, MB_OK + MB_ICONINFORMATION);

      frm_SelCAixa.ShowModal;

      if frm_SelCaixa.flgSearch then begin

         iCaixa := frm_SelCaixa.qyCaixacd_caixa.AsInteger;

      end
      else begin
        Result := false; 
        exit;
      end;

  end;

  { Abrir o Arquivo retorno }

  {$I-}
  AssignFile( CobFile, txtArquivo.Text );
  Reset( CobFile );

  { Verificar se é um arquivo válido }
  if IOResult <> 0 then
  begin
    Mensagem( 'Atenção: ' + CHR(13) + CHR(13) + 'O Arquivo selecionada não é válido', 'Erro', MB_OK, MB_ICONERROR);
    CloseFile( CobFile );
    FreeAndNil( CobFile );
    Result := false; 
    Exit;
  end;
  {$I+}

  { Fechar o Arquivo }
  CloseFile( CobFile );

  { Abrir o arquivo para a Baixa }
  AssignFile( CobFile, OpenDialog.FileName );
  Reset( CobFile );

  { passar as linhas do header... não precisamos mais dela }

  n := 1;

  matCobranca := '';

  // Ler o cabeçalho
  while n <= tblBanconr_linha_header.AsInteger do
  Begin
     ReadLn( CobFile, linha );
     if trim(linha) <> '' then begin
        matCobranca := matCobranca + linha;
        inc(n);
     end;
  end;


  { Vefificar se é um arquivo RETORNO }
  if tblBancoretorno_inicio.AsInteger <> 0 then
  Begin

     if Copy( matCobranca, tblBancoretorno_inicio.AsInteger, 7 ) <> 'RETORNO' then
     begin

       Mensagem( 'Atenção: ' + CHR(13) + CHR(13) + 'O Arquivo selecionado não é um arquivo de retorno.' + CHR(13) + 'Verifique se foi selecionado o arquivo correto.', Application.Title, MB_OK + MB_ICONSTOP );
       CloseFile( CobFile );
       Result := false; 
       Exit;

     end;

  End;

  Dm.CriarConsulta(qyRetorno);
  Dm.CriarConsulta(qyMaxRetorno);

  qyMaxRetorno.Close();
  qyMaxRetorno.SQL.Text := 'SELECT IFNULL(MAX(codigo), 0) + 1 as maximo FROM retorno';
  qyMaxRetorno.Open();

  { Registrar as informações na tabela retorno }
  qyRetorno.Close;
  qyRetorno.SQL.Clear;
  qyRetorno.SQL.Add('INSERT INTO retorno ');
  qyRetorno.SQL.Add('( Codigo, DataRetorno, Baixados, Rejeitados, outras_ocorrencias, Usuario, NomeArquivo, cd_banco, cd_coligada, md5_arquivo )');
  qyRetorno.SQL.Add('VALUES(:codigo, :dataretorno, :baixados, :rejeitados, :outras_ocorrencias, :usuario, :nomeArquivo, :cd_banco, :cd_coligada, :md5_arquivo ) ');

  qyRetorno.ParamByName('codigo').AsInteger := qyMaxRetorno.FieldByName('maximo').AsInteger;
  qyRetorno.ParamByName('cd_banco').AsString := tblBancocd_banco.AsString;
  qyRetorno.ParamByName('dataretorno').AsDateTime  := DataHoje;
  qyRetorno.ParamByName('baixados').AsInteger    := 0;
  qyRetorno.ParamByName('rejeitados').AsInteger  := 0;
  qyRetorno.ParamByName('outras_ocorrencias').AsInteger := 0;
  qyRetorno.ParamByName('usuario').AsInteger     := DM.iCdPessoaLogado;
  qyRetorno.ParamByName('cd_coligada').AsInteger := TColigada(cbColigadas.Items.Objects[cbColigadas.ItemIndex]).Codigo;
  qyRetorno.ParamByName('nomearquivo').AsString  := ExtractFileName( txtArquivo.Text );
  qyRetorno.ParamByName('md5_arquivo').AsString := md5_arquivo;

  qyRetorno.ExecSQL;


  // Verificar se está configurado uma TARIFA em código de OCORRENCIA
  // campo banco_codigo_retorno.sn_baixas = "T"

    DM.qAux2.Close;
    DM.qAux2.SQL.Clear;
    Dm.qAux2.SQL.Add('select * from banco_codigo_retorno');
    Dm.qAux2.SQL.Add('where cd_banco = :banco and sn_baixar = "T" AND cd_origem = 1');
    Dm.qAux2.ParamByName('banco').AsString := tblBancocd_banco.AsString;
    Dm.qAux2.Open;

    if not Dm.qAux2.EOF then begin
       bTarifaPorOcorrencia := true;
    end else begin
       bTarifaPorOcorrencia := false;
    end;

  // Fim da tarifa por ocorrencia

  nro_linha := 0;

  lngLidos := 0;

  while nro_linha < lngSize do
  begin

    Inc( lngLidos );

    { Apresentar resultados na tela }
    Bar.Position := lngLidos;

    lblReg.Caption := 'Registros: ' + IntToStr( lngLidos ) + ' de ' + IntToStr( lngSize );

    Application.ProcessMessages;

    matCobranca := '';

    n := 1;

    while n <= tblBanconr_linha_registro.AsInteger do
    begin
       ReadLn( CobFile, linha );
       // Verificar se existe alguma linha para IGNORAR

       if tblBancolinha_ignorar_inicio.AsInteger > 0  then begin

          if copy(linha, tblBancolinha_ignorar_inicio.AsInteger, tblBancolinha_ignorar_tamanho.AsInteger) = tblBancolinha_ignorar_texto.AsString then begin

              n := 1;
              matCobranca := '';
              continue;

          end;

       end;

       if (trim(linha) <> '') OR EOF(CobFile) then begin
          matCobranca := matCobranca + linha;
          inc(n);
       end;
    end;

    // Arqui a variavel matCobranca tem a linha do destalhes completa // Verificar se trata-se de uso de CSV
    strNossoNumero := '';

    if tblBancods_separador_colunas.AsString <> '' then begin
       // É com separador = CSV
       FreeAndNil(slColunas);
       slColunas := TStringList.Create();
       SplitString(matCobranca, Trim(tblBancods_separador_colunas.AsString), slColunas);

       // LEr o vencimento independente do separador
       if tblBancodt_venc_inicio.AsInteger > 0 then begin

          sColVencimento := Trim(slColunas[tblBancodt_venc_inicio.AsInteger-1]);
          sColVencimento := StringReplace(sColVencimento, '-', '', [rfReplaceAll]);
          sColVencimento := StringReplace(sColVencimento, '/', '', [rfReplaceAll]);

          if (tblBancodt_venc_formato.AsString = 'amd') then begin

             sColVencimento :=  Copy( sColVencimento, 1 + tblBancodt_venc_tam.AsInteger - 2, 2 )
                       + '/' + Copy( sColVencimento, 1 + tblBancodt_venc_tam.AsInteger - 4, 2 )
                       + '/' + Copy( sColVencimento, 1, tblBancodt_venc_tam.AsInteger - 4);

          end else begin

             sColVencimento :=  Copy( sColVencimento, 1, 2 )
                       + '/' + Copy( sColVencimento, 1 + 2 , 2 )
                       + '/' + Copy( sColVencimento, 1 + 4, tblBancodt_venc_tam.AsInteger - 4);
          end;
       end else begin
          sColVencimento := '';

       end;

       if tblBanconn_inicio.AsInteger > 0 then begin
           // Usa Nosso Número
           if tblBancocarteira_inicio.AsInteger > 0 then begin
              sColCarteira  := Trim(slColunas[tblBancocarteira_inicio.AsInteger-1]);
              if sColCarteira = tblBancocarteira_nn2.AsString then begin
                   strNossoNumero := Trim(slColunas[tblBanconn_inicio2.AsInteger-1]);
              end else begin
                   strNossoNumero :=  Trim(slColunas[tblBanconn_inicio.AsInteger-1]);
              end;
           end else begin
               strNossoNumero :=  Trim(slColunas[tblBanconn_inicio.AsInteger-1]);
           end;

       end else begin

           // Não usa NossoNúmero - Identificar pelo CPF e VENCIMENTO;

           sColCPF := Trim(slColunas[tblBanconr_cpf_inicio.AsInteger-1]);
           sColCPF := StringReplace(sColCPF, '-', '', [rfReplaceAll]);
           sColCPF := StringReplace(sColCPF, '.', '', [rfReplaceAll]);
           sColCPF := FillString(sColCPF, alRight, '0', 11, true);

       end;


       if tblBancoconta_inicio.AsInteger > 0 then begin
          sConta := Trim(slColunas[tblBancoconta_inicio.AsInteger-1]);
       end;

       // Senão tiver configuração de código de ocorrencia no arquivo, assumir = OK - esse valor deve exitir em banco_codigo_retorno
       if tblBancoocorre_inicio.AsInteger = 0 then begin
          strOcorrencia := 'OK';
       end else begin
          strOcorrencia := Trim(slColunas[tblBancoocorre_inicio.AsInteger-1]);
       end;


       if tblBancomotivo_inicio.AsInteger > 0 then begin
          strMotivo := Trim(slColunas[tblBancomotivo_inicio.AsInteger-1]);
       end else begin
          strMotivo := '';
       end;

       if tblBancotarifa_inicio.AsInteger > 0  then begin
          sColCarteira  := Trim(slColunas[tblBancocarteira_inicio.AsInteger-1]);
          if sColCarteira = tblBancocarteira_nn2.AsString then begin
             sColValTarifa := Trim(slColunas[tblBancotarifa_inicio2.AsInteger-1]);
          end else begin
             sColValTarifa := Trim(slColunas[tblBancotarifa_inicio.AsInteger-1]);
          end;
          ValTarifa := StrToCurr( sColValTarifa );
       end;

       if tblBancovl_acresc_inicio.AsInteger > 0 then begin
          sColValPago := Trim(slColunas[tblBancovl_acresc_inicio.AsInteger-1]);
          ValAcrescimo := StrToCurr( sColValPago );
       end;

       sColValPago := Trim(slColunas[tblBancovl_pago_inicio.AsInteger-1]);
       ValPago := StrToCurr( sColValPago );


       sColValPago := Trim(slColunas[tblBancovl_titulo_inicio.AsInteger-1]);
       ValTitulo := StrToCurr( sColValPago  );

       if tblBancosn_acrescimo_separado.AsInteger = 1 then begin
          ValPago := ValPago + ValAcrescimo
       end;

       if tblBancosequencia_inicio.AsInteger > 0 then begin
          sColSequencia := Trim(slColunas[ tblBancosequencia_inicio.AsInteger-1]);
       end else begin
          sColSequencia := IntToStr(lngLidos);
       end;

//       Trim(slColunas[ ]);

    end else begin
       // Não é com separador

       if tblBanconn_inicio.AsInteger > 0 then begin
          // Busca por NN
           if tblBancocarteira_inicio.AsInteger > 0 then begin
              sColCarteira := Copy(matCobranca, tblBancocarteira_inicio.AsInteger, tblBancocateira_tam.AsInteger);
              if sColCarteira = tblBancocarteira_nn2.AsString then begin
                 strNossoNumero :=  Copy( matCobranca, tblBanconn_inicio2.AsInteger, tblBanconn_tam2.AsInteger );
              end else begin
                 strNossoNumero :=  Copy( matCobranca, tblBanconn_inicio.AsInteger, tblBanconn_tam.AsInteger );
              end;
           end else begin
              strNossoNumero :=  Copy( matCobranca, tblBanconn_inicio.AsInteger, tblBanconn_tam.AsInteger );
           end;

       end else begin
          // Não usa NossoNúmero - Identificar pelo CPF e VENCIMENTO;

           sColCPF := Trim( Copy(matCobranca, tblBanconr_cpf_inicio.AsInteger, tblBanconr_cpf_tam.AsInteger ) );
           sColCPF := StringReplace(sColCPF, '-', '', [rfReplaceAll]);
           sColCPF := StringReplace(sColCPF, '.', '', [rfReplaceAll]);
           sColCPF := FillString(sColCPF, alRight, '0', 11, true);

       end;

       if tblBancodt_venc_inicio.AsInteger > 0 then begin


          if (tblBancodt_venc_formato.AsString = 'amd') then begin

             sColVencimento :=  Copy( matCobranca, tblBancodt_venc_inicio.AsInteger + tblBancodt_venc_tam.AsInteger - 2, 2 )
                        + '/' + Copy( matCobranca, tblBancodt_venc_inicio.AsInteger + tblBancodt_venc_tam.AsInteger - 4, 2 )
                        + '/' + Copy( matCobranca, tblBancodt_venc_inicio.AsInteger, tblBancodt_venc_tam.AsInteger - 4);

          end else begin

             sColVencimento :=  Copy( matCobranca, tblBancodt_venc_inicio.AsInteger, 2 )
                        + '/' + Copy( matCobranca, tblBancodt_venc_inicio.AsInteger + 2 , 2 )
                        + '/' + Copy( matCobranca, tblBancodt_venc_inicio.AsInteger + 4, tblBancodt_venc_tam.AsInteger - 4);

          end;


       end else begin

          sColVencimento := '';

       end;  

       if tblBancoconta_inicio.AsInteger > 0 then begin
          sConta := Copy(matCobranca, tblBancoconta_inicio.AsInteger, tblBancoconta_tam.AsInteger);
       end;

       if tblBancoocorre_inicio.AsInteger = 0 then begin
          strOcorrencia := 'OK';
       end else begin
          strOcorrencia := Copy( matCobranca, tblBancoocorre_inicio.AsInteger, tblBancoocorre_tam.AsInteger ) ;
       end;

       if tblBancomotivo_inicio.AsInteger > 0 then begin
          strMotivo := Copy(matCobranca, tblBancomotivo_inicio.AsInteger, tblBancomotivo_tam.AsInteger);
       end else begin
          strMotivo := '';
       end;

       if tblBancotarifa_inicio.AsInteger > 0  then begin
          sColCarteira := Copy(matCobranca, tblBancocarteira_inicio.AsInteger, tblBancocateira_tam.AsInteger);
          if sColCarteira = tblBancocarteira_nn2.AsString then begin
             sColValTarifa := Copy( matCobranca, tblBancotarifa_inicio2.AsInteger, tblBancotarifa_tam2.AsInteger);
             ValTarifa := StrToCurr(Copy( sColValTarifa, 1, tblBancotarifa_tam2.AsInteger - 2 ) + ',' +
                        Copy( sColValTarifa, 1 + tblBancotarifa_tam2.AsInteger - 2 ,  2 ));
          end else begin
             sColValTarifa := Copy( matCobranca, tblBancotarifa_inicio.AsInteger, tblBancotarifa_tam.AsInteger);
             ValTarifa := StrToCurr(Copy( sColValTarifa, 1, tblBancotarifa_tam.AsInteger - 2 ) + ',' +
                        Copy( sColValTarifa, 1 + tblBancotarifa_tam.AsInteger - 2 ,  2 ));
          end;

       end;

       ValPago := StrToCurr(Copy( matCobranca, tblBancovl_pago_inicio.AsInteger, tblBancovl_pago_tam.AsInteger - 2 ) + ',' +
                                 Copy( matCobranca, tblBancovl_pago_inicio.AsInteger + tblBancovl_pago_tam.AsInteger - 2 ,  2 ));

       ValTitulo := StrToCurr(Copy( matCobranca, tblBancovl_titulo_inicio.AsInteger, tblBancovl_titulo_tam.AsInteger - 2 ) + ',' +
                                 Copy( matCobranca, tblBancovl_titulo_inicio.AsInteger + tblBancovl_titulo_tam.AsInteger - 2 ,  2 ));

       if tblBancovl_acresc_inicio.AsInteger > 0 then begin
         ValAcrescimo := StrToCurr(Copy( matCobranca, tblBancovl_acresc_inicio.AsInteger, tblBancovl_acresc_tam.AsInteger - 2 ) + ',' +
                         Copy( matCobranca, tblBancovl_acresc_inicio.AsInteger + tblBancovl_acresc_tam.AsInteger - 2 ,  2 ));
       end;

       if tblBancosn_acrescimo_separado.AsInteger = 1 then begin

              ValPago := ValPago +   ValAcrescimo;
       end;

       if tblBancosequencia_inicio.AsInteger > 0 then begin
          sColSequencia := Copy(matCobranca, tblBancosequencia_inicio.AsInteger, tblBancosequencia_tam.AsInteger);
       end else begin
          sColSequencia := IntToStr(lngLidos);
       end;

    end;

    // Analisar se a conta da baixa vem do retorno ou foi selecionada pelo usuário

    if iCaixa < 0 then begin   // Não tem conta selecionada para baixa
       iContaBaixa := selecionaContaBaixar(sConta);
    end else begin
     // Tem que baixar sempre na conta selecionada no inicio
        iContaBaixa := iCaixa;
     end;

    inc(nro_linha);

    if nro_linha > lngSize then Break;

    { NossoNumero }

    // Buscar o código de OCORRENCIA
    DM.qAux2.Close;
    DM.qAux2.SQL.Clear;
    Dm.qAux2.SQL.Add('select * from banco_codigo_retorno');
    Dm.qAux2.SQL.Add('where cd_banco = :banco and cd_retorno = :retorno AND cd_origem = 1');
    Dm.qAux2.ParamByName('banco').AsString := tblBancocd_banco.AsString;
    DM.qAux2.ParamByName('retorno').AsString := strOcorrencia;
    Dm.qAux2.Open;

    // Caso a ocorrencia não seja de baixa, zerar o valor pago, para não confundir visualmente o cliente.
    if DM.qAux2.FieldByName('sn_baixar').AsString = 'N' then begin
       ValPago := 0;
    end;


    // Pegar o valor da tarifa

   { Alterar Ocorrencia se usar remessa }


    // No caso da tarifa ser configurada por códig ode retorno, somente somar se a ocorrencia for sn_baixas = T
    // Claudionor

    if (tblBancotarifa_tam.AsInteger > 0) AND
       (
          (  not bTarifaPorOcorrencia ) OR
          ( (bTarifaPorOcorrencia AND (DM.qAux2.FieldByName('sn_baixar').AsString = 'T') ) )
       )
    then begin

      Tarifa := ValTarifa;

    end else begin

       Tarifa := 0;

    end;


    DM.CriarConsulta(qyInsert);

    if sColVencimento <> '' then begin
       qyInsert.SQL.Text :=
         'INSERT INTO retorno_itens ( cd_retorno, nr_sequencia, nr_nossonumero, cd_ocorrencia, cd_motivo, dt_vencimento, dt_pagamento, dt_credito, vl_titulo, vl_acrescimo, vl_pago, vl_tarifa, cd_caixa, cd_situacao )' +
         'VALUES (:cd_retorno, :nr_sequencia, :nr_nossonumero, :cd_ocorrencia, :cd_motivo, :dt_vencimento, :dt_pagamento, :dt_credito, :vl_titulo, :vl_acrescimo, :vl_pago, :vl_tarifa, :cd_caixa, 0 )';
         qyInsert.ParamByName('dt_vencimento').AsString :=FormatDateTime('yyyy-mm-dd',StrToDate(sColVencimento));
    end else begin
       qyInsert.SQL.Text :=
         'INSERT INTO retorno_itens ( cd_retorno, nr_sequencia, nr_nossonumero, cd_ocorrencia, cd_motivo, dt_pagamento, dt_credito, vl_titulo, vl_acrescimo, vl_pago, vl_tarifa, cd_caixa, cd_situacao )' +
         'VALUES (:cd_retorno, :nr_sequencia, :nr_nossonumero, :cd_ocorrencia, :cd_motivo, :dt_pagamento, :dt_credito, :vl_titulo, :vl_acrescimo, :vl_pago, :vl_tarifa, :cd_caixa, 0 )';
    end;


    qyInsert.ParamByName('cd_retorno').AsInteger := qyMaxRetorno.FieldByName('maximo').AsInteger;
    qyInsert.ParamByName('nr_sequencia').AsInteger := StrToInt( sColSequencia );
    if strNossoNumero = '' then begin
       qyInsert.ParamByName('nr_nossonumero').AsString := sColCPF + ';' + sColVencimento;
    end else begin
       qyInsert.ParamByName('nr_nossonumero').AsString := strNossoNumero;
    end;
    qyInsert.ParamByName('cd_ocorrencia').AsString := strOcorrencia;
    qyInsert.ParamByName('cd_motivo').AsString := strMotivo;
    qyInsert.ParamByName('dt_pagamento').AsDateTime :=  StrToDate(pega_data_pgto());
   
    qyInsert.ParamByName('dt_credito').AsDateTime :=  StrToDate(pega_data_credito());

    if (tblBancotarifa_tam.AsInteger > 0) AND (bTarifaPorOcorrencia) AND (DM.qAux2.FieldByName('sn_baixar').AsString = 'T')
    then begin
       qyInsert.ParamByName('vl_pago').AsFloat := 0;
       qyInsert.ParamByName('vl_titulo').AsFloat := 0;
       qyInsert.ParamByName('vl_acrescimo').AsFloat := 0;
    end else begin
       qyInsert.ParamByName('vl_pago').AsFloat := ValPago;
       qyInsert.ParamByName('vl_titulo').AsFloat := ValTitulo;
       qyInsert.ParamByName('vl_acrescimo').AsFloat := ValAcrescimo;
    end;
    qyInsert.ParamByName('vl_tarifa').AsFloat := Tarifa;
    qyInsert.ParamByName('cd_caixa').AsInteger := iContaBaixa ;
    
    qyInsert.ExecSQL();
    FreeAndNil(qyInsert);


    { Apresentar resultados na tela }
    Bar.Position := lngLidos;

    lblReg.Caption := 'Registros: ' + IntToStr( lngLidos ) + ' de ' + IntToStr( lngSize );

    Application.ProcessMessages;

  end;

  // Se ele leu todo o arquivp sem nenhum impedimento, então gravar o código da conta da baixa (uma delas, pois pode ter mais)
  // e também a quantidade de linhas lidas. Isso garantirá que o arquivo não será mais reprocessado futuramente.
  
  qyRetorno.Close;
  qyRetorno.SQL.Clear;
  qyRetorno.SQL.Add('UPDATE retorno SET ');
  qyRetorno.SQL.Add('cd_caixa = :cd_caixa');
  qyRetorno.SQL.Add(', outras_ocorrencias = :qtd_ocorrencia');
  qyRetorno.SQL.Add('WHERE codigo = :codigo');

  qyRetorno.ParamByName('codigo').AsInteger := qyMaxRetorno.FieldByName('maximo').AsInteger;
  qyRetorno.ParamByName('cd_caixa').AsInteger := iContaBaixa;
  qyRetorno.ParamByName('qtd_ocorrencia').AsInteger := lngLidos;

  qyRetorno.ExecSQL;


  Screen.Cursor := crDefault;

  Montar(false);

  Bar.Max := 0;
  lblReg.Caption := 'Registros:';

// fim registro na conta banco

  FreeAndNil(qyRetorno);
  FreeAndNil(qyMaxRetorno);

  CloseFile( CobFile );

  qryRetorno.DisableControls;
  qryRetorno.Close;
  qryRetorno.Open;
  qryRetorno.First;
  qryRetorno.EnableControls;

end;
procedure TfrmRetornoBanco.Montar(valor: Boolean);
begin
      blmoldura.Visible := valor;
      lbBanco.Visible := valor;
      lblReg.Visible := valor;
      Bar.Visible := valor;
      btnBaixar.Visible := valor;

end;

procedure TfrmRetornoBanco.PageControl1Change(Sender: TObject);
var
  Ponteiro : Pointer;
begin
   if PageControl1.ActivePage = tsHistorico then begin
      // Somente ativar
      if (not qryItens.Active) OR (qryItenscd_retorno.AsInteger <> qryRetornoCodigo.AsInteger) then begin
         PrecisaAtualizarRetorno := false;
         FiltrarConteudo();
      end;
   end else begin
      if PrecisaAtualizarRetorno then begin
         // Foi controlado se precisa atualizar o retorno, quando houver atualização de totais.
         // Guardar o ponteiro para voltar na mesma posição.
         Ponteiro := qryRetorno.GetBookmark();
         FiltrarArquivos();
         if qryRetorno.BookmarkValid(Ponteiro) then begin
            qryRetorno.GotoBookmark(Ponteiro);
         end;
      end;

   end;
end;

function TfrmRetornoBanco.pega_data_credito: String;
Var
  data         : string;
  dataValida   : TDateTime;
begin

  if tblBancodt_credito_inicio.AsInteger <= 0 then begin

     data := pega_data_pgto();

  end else begin


     if tblBancods_separador_colunas.AsString <> '' then begin

         data := Trim(slColunas[tblBancodt_credito_inicio.AsInteger-1]);
         data := StringReplace(data, '-', '', [rfReplaceAll]);
         data := StringReplace(data, '/', '', [rfReplaceAll]);


         // Esta flag força baixar pela data de pagamento, quando o registro tiver o conteudo do campo fl_dt_pagamento
         if tblBancofl_dt_pgto_inicio.AsInteger > 0 then begin
            if  Trim(slColunas[tblBancofl_dt_pgto_inicio.AsInteger-1]) = tblBancofl_dt_pgto.AsString then begin

               data := pega_data_pgto();
               result := data;
               exit;
           
            end;

         end;

         if (data = '') OR
            (data = FillString('0',alLeft, '0',tblBancodt_credito_tam.AsInteger,false))
         then
            data := pega_data_pgto()
         else if (tblBancodt_credito_formato.AsString = 'amd') then begin

            data :=  Copy( data, 1 + tblBancodt_credito_tam.AsInteger - 2, 2 )
                  + '/' + Copy( data, 1 + tblBancodt_credito_tam.AsInteger - 4, 2 )
                  + '/' + Copy( data, 1, tblBancodt_credito_tam.AsInteger - 4);

         end else begin

            data :=  Copy( data, 1, 2 )
                  + '/' + Copy( data, 1 + 2 , 2 )
                  + '/' + Copy( data, 1 + 4, tblBancodt_credito_tam.AsInteger - 4);

         end;


     end else begin      


         // Esta flag força baixar pela data de pagamento, quando o registro tiver o conteudo do campo fl_dt_pagamento
         if tblBancofl_dt_pgto_inicio.AsInteger > 0 then begin
            if Copy(matCobranca, tblBancofl_dt_pgto_inicio.AsInteger, Length(tblBancofl_dt_pgto.AsString)) = tblBancofl_dt_pgto.AsString then begin

               data := pega_data_pgto();
               result := data;
               exit;
           
            end;

         end;

         if (Trim(Copy( matCobranca, tblBancodt_credito_inicio.AsInteger, tblBancodt_credito_tam.AsInteger )) = '') OR
            (Trim(Copy( matCobranca, tblBancodt_credito_inicio.AsInteger, tblBancodt_credito_tam.AsInteger )) = FillString('0',alLeft, '0',tblBancodt_credito_tam.AsInteger,false))
         then
            data := pega_data_pgto()
         else if (tblBancodt_credito_formato.AsString = 'amd') then begin

            data :=  Copy( matCobranca, tblBancodt_credito_inicio.AsInteger + tblBancodt_credito_tam.AsInteger - 2, 2 )
                  + '/' + Copy( matCobranca, tblBancodt_credito_inicio.AsInteger + tblBancodt_credito_tam.AsInteger - 4, 2 )
                  + '/' + Copy( matCobranca, tblBancodt_credito_inicio.AsInteger, tblBancodt_credito_tam.AsInteger - 4);

         end else begin

            data :=  Copy( matCobranca, tblBancodt_credito_inicio.AsInteger, 2 )
                  + '/' + Copy( matCobranca, tblBancodt_credito_inicio.AsInteger + 2 , 2 )
                  + '/' + Copy( matCobranca, tblBancodt_credito_inicio.AsInteger + 4, tblBancodt_credito_tam.AsInteger - 4);

         end;


     end;



     //verifica se o conteudo que foi pego está em formato de uma data válida.
     try
         dataValida := strtodate(data)
     except
         data       := pega_data_pgto();
     end;

  end;

  result := data;

end;


function TfrmRetornoBanco.pega_data_pgto: String;
Var
  data : string;
begin

  if tblBancods_separador_colunas.AsString <> ''  then begin

     data := Trim(slColunas[tblBancodt_pgto_inicio.AsInteger-1]);
     data := StringReplace(data, '-', '', [rfReplaceAll]);
     data := StringReplace(data, '/', '', [rfReplaceAll]);

     if (tblBancodt_pgto_formado.AsString = 'amd') then begin

         data :=  Copy( data, 1 + tblBancodt_pgto_tam.AsInteger - 2, 2 )
               + '/' + Copy( data, 1 + tblBancodt_pgto_tam.AsInteger - 4, 2 )
               + '/' + Copy( data, 1, tblBancodt_pgto_tam.AsInteger - 4);

     end else begin

         data :=  Copy( data, 1, 2 )
               + '/' + Copy( data, 1 + 2 , 2 )
               + '/' + Copy( data, 1 + 4, tblBancodt_pgto_tam.AsInteger - 4);

     end;


  end else begin

      if (tblBancodt_pgto_formado.AsString = 'amd') then begin

         data :=  Copy( matCobranca, tblBancodt_pgto_inicio.AsInteger + tblBancodt_pgto_tam.AsInteger - 2, 2 )
               + '/' + Copy( matCobranca, tblBancodt_pgto_inicio.AsInteger + tblBancodt_pgto_tam.AsInteger - 4, 2 )
               + '/' + Copy( matCobranca, tblBancodt_pgto_inicio.AsInteger, tblBancodt_pgto_tam.AsInteger - 4);

      end else begin

         data :=  Copy( matCobranca, tblBancodt_pgto_inicio.AsInteger, 2 )
               + '/' + Copy( matCobranca, tblBancodt_pgto_inicio.AsInteger + 2 , 2 )
               + '/' + Copy( matCobranca, tblBancodt_pgto_inicio.AsInteger + 4, tblBancodt_pgto_tam.AsInteger - 4);

      end;

      
  end;



  result := data;


end;

procedure TfrmRetornoBanco.ProcessarArquivo;
var
  iContaBaixa : Integer;

  sAux : String;
  dtTarifa : TDateTime;

  siglaNN : String;
  sParamDuplicado : Char;
  mov : TMovimento;
  iTpConta : Word;
  iCodAberturaAtual : Integer;
begin
  { Essa procedure deve percorrer a tabela de retorno_itens e efeutar a baixa dos títulos }

   grdItens.Enabled := false;
   Bar2.Max := qryItens.RecordCount;
   Bar2.Visible := true;

   sAux := DM.variavel_parametro('financeiro_retorno_baixar_duplicados');
   sParamDuplicado := sAux[1];

   sAux := '';

  // O processamento agora é feito em cima da tabela de itens
  qryItens.First();
  while not qryItens.EOF do begin
    //  Apresentar resultados na tela
    Bar2.Position := qryItens.RecNo;

    Application.ProcessMessages;

   // A primeira coisa que será feita, é testar se a conta está ativa para fazer a baixa;
   // Verificar se o caixa está aberto
   mov := TMovimento.Create;
   if not mov.VerificaContaAtiva(qryItenscd_caixa.AsInteger, iTpConta, iCodAberturaAtual ) then begin
      Mensagem( 'Não é possível processar este retorno com o caixa fechado. '+CHR(13)+ 'Abra o caixa e retorne a esta tela para processar as baixas.', Application.Title, MB_OK + MB_ICONSTOP );
      Screen.Cursor := crDefault;
      grdItens.Enabled := true;
      Bar2.Visible := false;
      FiltrarConteudo();
      Exit;
   end;

   if (iTpConta = 3) AND (iCodAberturaAtual = 0) then begin
      Mensagem( 'Não é possível processar este retorno com o caixa fechado. '+CHR(13)+ 'Abra o caixa e retorne a esta tela para processar as baixas.', Application.Title, MB_OK + MB_ICONSTOP );
      Screen.Cursor := crDefault;
      grdItens.Enabled := true;
      Bar2.Visible := false;
      FiltrarConteudo();      
      Exit;
   end;   
   freeandnil(mov);

    // Verificar se o registro já foi processado
    // Em caso positivo, não fazer NADA, apenas ir para o próximo registro
    if qryItenscd_situacao.AsInteger <> 10 then begin

        iContaBaixa := qryItenscd_caixa.AsInteger;
        ValPago :=  qryItensvl_pago.AsCurrency;
        strNossoNumero := qryItensnr_nossonumero.AsString;

        if qryItenssn_ocorrencia.AsString = '0'  then  Begin
            // A ocorrencia não foi cadastrada. O baixa deve ser ignorada

            //ANALISAR = Mesmo assim, deverá procurar o NN e identificar o responsável pelo título

            if BuscaNossoNumero(strNossoNumero, '') then begin
               AtualizarSituacaoItem(qryItenscd_retorno.AsInteger, qryItensnr_sequencia.AsInteger, sOcorrenciaInexistente, Dm.tblMensalidadescd_resp.AsInteger, Dm.tblMensalidadesCodigoAluno.AsInteger, dm.tblMensalidadesDataVencimento.AsDateTime,  'Ocorrência = ' + qryItenscd_ocorrencia.AsString );
            end else begin
               AtualizarSituacaoItem(qryItenscd_retorno.AsInteger, qryItensnr_sequencia.AsInteger, sOcorrenciaInexistente, 0, 0, 0, 'Ocorrência = ' + qryItenscd_ocorrencia.AsString );

            end;

        End ELSE Begin


           if Dm.isTrue(qryItenssn_baixar.AsString) then Begin
              // A ocorrencia refere-se a uma baixa

              if BuscaNossoNumero( strNossoNumero, ' (situacao = 2 OR situacao = 8 OR situacao = 10) ' ) then Begin
                   // VERIFICAR A QUANTIDADE ENCONTRADA

                   if ( DM.tblMensalidades.RecordCount > 1) AND
                      ( NOT ( sParamDuplicado in ['S','P','I'] ) )
                   then Begin
                        AtualizarSituacaoItem(qryItenscd_retorno.AsInteger, qryItensnr_sequencia.AsInteger, sNNDuplicado);
                   end else begin

                        // Todas as baixas, duplicadas ou não, serão processadas aqui.
                        BaixarDuplicados( qryItensvl_pago.AsCurrency, qryItenscd_caixa.AsInteger);

                      // Fim da soma do valor pago
                   End;

              End else begin
                 if BuscaNossoNumero( strNossoNumero, ' (situacao = 0 OR situacao = 1) ' ) then
                 begin
                      AtualizarSituacaoItem(qryItenscd_retorno.AsInteger, qryItensnr_sequencia.AsInteger, sJaPago, DM.tblMensalidadescd_resp.AsInteger, Dm.tblMensalidadesCodigoAluno.AsInteger, Dm.tblMensalidadesDataVencimento.AsDateTime);
                 end else begin
                    // Se o nosso numero não esta na situação OK verifica se não esta em uma especifica
                    if BuscaNossoNumero( strNossoNumero, ' (situacao in (3)) ' ) then
                    begin
                      AtualizarSituacaoItem(qryItenscd_retorno.AsInteger, qryItensnr_sequencia.AsInteger, sNegociado, DM.tblMensalidadescd_resp.AsInteger, Dm.tblMensalidadesCodigoAluno.AsInteger, Dm.tblMensalidadesDataVencimento.AsDateTime);
                    end else begin
                        if BuscaNossoNumero( strNossoNumero, ' (situacao in (4,5)) ' ) then
                        begin
                          AtualizarSituacaoItem(qryItenscd_retorno.AsInteger, qryItensnr_sequencia.AsInteger, sCancelado, DM.tblMensalidadescd_resp.AsInteger, Dm.tblMensalidadesCodigoAluno.AsInteger, Dm.tblMensalidadesDataVencimento.AsDateTime);
                        end else begin
                           if BuscaNossoNumero( strNossoNumero, ' (situacao in (6,7)) ' ) then
                           begin
                               AtualizarSituacaoItem(qryItenscd_retorno.AsInteger, qryItensnr_sequencia.AsInteger, sDesconto, DM.tblMensalidadescd_resp.AsInteger, Dm.tblMensalidadesCodigoAluno.AsInteger, Dm.tblMensalidadesDataVencimento.AsDateTime);
                           end else begin
                               AtualizarSituacaoItem(qryItenscd_retorno.AsInteger, qryItensnr_sequencia.AsInteger, sNNNaoEncontrado);
                           end;
                        end;
                    end;
                 end;
              end;
           End Else Begin // Náo é baixa

              // Verificar se o nossonúmero existe
              if BuscaNossoNumero( strNossoNumero, '' ) then
              Begin

                    while not DM.tblMensalidades.Eof do begin

                      InserirItem();

                      DM.tblMensalidades.Next();

                    end;

                    AtualizarSituacaoItem(qryItenscd_retorno.AsInteger, qryItensnr_sequencia.AsInteger, sRegistroInformativo, DM.tblMensalidadescd_resp.AsInteger, Dm.tblMensalidadesCodigoAluno.AsInteger, Dm.tblMensalidadesDataVencimento.AsDateTime);
              End
              else
              Begin
                   AtualizarSituacaoItem(qryItenscd_retorno.AsInteger, qryItensnr_sequencia.AsInteger, sRegistroInformativo);
              End;
           End;

        End;

    end;


    qryItens.Next();

  end;
  Bar2.Visible := false;

  grdItens.Enabled := true;

  DM.tblMensalidades.Close;

  FiltrarConteudo();


  // Ao chegar aqui, os itens estão atualizados, podemos então confiar no valor total da tarifa para lançamento
  // e também nos demais totais para lançar na tela de retorno.


  if (qryItensTotalsoma_tarifas.AsCurrency > 0)
     AND (dm.variavel_parametro('financeiro_retorno_lancar_tarifa_automatica') = 'S')
     AND (qryItensTotalsn_tarifa_lancada.AsInteger = 0)  
  then begin
     // Se tiver valor de tarifa, lançar na conta

     LancarTarifa();
  end;

  // Atualiza as informações na tabela retorno (as quantidades de baixados, reijeitados, outras ocorrencias

  AtualizarRetorno();           

end;


procedure TfrmRetornoBanco.sbAtualizarClick(Sender: TObject);
begin
  FiltrarArquivos();
end;

function TfrmRetornoBanco.selecionaContaBaixar(sConta: String): Integer;
begin
  // Verificar a Conta para Baixar

  with DM.qyAux do begin
     Close;
     SQL.Clear;
     SQL.Add(
       ' SELECT cd_caixa, ds_caixa, nr_banco, nr_conta, ds_identificacao_retorno   ' +
       ' FROM fin_cadastro_contas              ' +
       ' WHERE ds_identificacao_retorno = :DsConta AND sn_ativa = ''S'' '
     );
     ParamByName('DsConta').AsString := sConta;
     Open();

     if not Eof then begin
            Result := FieldByName('cd_caixa').AsInteger;
            EXit;
     end
     else begin
         result := -1;
         Exit;
     end;
  end;

end;

procedure TfrmRetornoBanco.SpeedButton1Click(Sender: TObject);
begin
   Application.CreateForm(TfrmSelColunas, frmSelColunas);
   frmSelColunas.SelecionaColunas(grd, 'planilha_retorno_campos_principal');
end;

procedure TfrmRetornoBanco.ToolButton1Click(Sender: TObject);
var
   NomeRel, selecao : String;
   sNomeRelatorio: String;
   PodeExportar: Boolean;
   infoRelatorio: ClasseRegistros;
begin
   if not DM.UsuarioLogado.TemPermissao( 2002, npAcesso, True ) then Exit;

   if Mensagem('Este procedimento irá gerar e imprimir recibos para todos os itens do retorno.'#13'Deseja continuar?', 'Atenção', MB_YESNO) <> mrYes then Exit;

   // Gerar todos os recibos

   try

      if (not qryItens.Active) OR (qryItenscd_retorno.AsInteger <> qryRetornoCodigo.AsInteger) then begin
         FiltrarConteudo();
      end;

      qryItens.DisableControls();

      qryItens.First;

      oRecibo := TFinReciboManager.Create(qryTituloscd_mensalidade.AsInteger);

      while not qryItens.Eof do begin
      try
         qryTitulos.Close();
         qryTitulos.ParamByName('cd_retorno').AsInteger := qryItenscd_retorno.AsInteger;
         qryTitulos.ParamByName('nr_sequencia').AsInteger := qryItensnr_sequencia.AsInteger;
         qryTitulos.Open();

         while not qryTitulos.Eof do begin

            oRecibo.setMensalidade(qryTituloscd_mensalidade.AsInteger);
            oRecibo.imprimirRecibo();

            qryTitulos.Next();

         end;

         qryItens.Next();
      except
         //ignorar
      end;                                   

      end;

      FreeAndNil(oRecibo);

      qryItens.First();      

   finally

      qryItens.EnableControls();
      
   end;

   NomeRel := '.rpt';
   selecao := '{retorno.codigo} = ' + qryRetornocodigo.AsString;

   infoRelatorio := PrincipalForm.GetInfoRpt('repReciboRetorno');

   sNomeRelatorio := infoRelatorio.Campo['nm_arquivo']+NomeRel;

   PodeExportar := True;
   if infoRelatorio.Campo['sn_pode_exportar'] = 0 then
      PodeExportar := False;


   PrincipalForm.ImprimeRpt(Self, sNomeRelatorio, -1, selecao, '',nil,nil,nil,nil, true, False, nil, PodeExportar);

   end;

procedure TfrmRetornoBanco.btnLogsClick(Sender: TObject);
var
   sNomeRelatorio: String;
   PodeExportar: Boolean;
   infoRelatorio: ClasseRegistros;
begin
   infoRelatorio := PrincipalForm.GetInfoRpt('Rel_Logs_Fin_Boleto');

   sNomeRelatorio := infoRelatorio.Campo['nm_arquivo']+'.rpt';

   PodeExportar := True;
   if infoRelatorio.Campo['sn_pode_exportar'] = 0 then
      PodeExportar := False;
      
   PrincipalForm.ImprimeRpt(Self, sNomeRelatorio, -1, '{fin_boleto.nr_nossonumero}= "' + qryItensnr_nossonumero.AsString + '"', '', nil, nil, nil,nil, True, False, nil, PodeExportar);
end;

procedure TfrmRetornoBanco.btnImprimirBaixasClick(Sender: TObject);
var
  sFiltro : String;
  sNomeRelatorio: String;
   PodeExportar: Boolean;
   infoRelatorio: ClasseRegistros;
begin
   sFiltro := '';
   // Apresentar somente os itens do retorno selecionado
   sFiltro := '{retorno.codigo}= ' + qryRetornocodigo.AsString;

   infoRelatorio := PrincipalForm.GetInfoRpt('repBaixasRetorno');
   sNomeRelatorio := infoRelatorio.Campo['nm_arquivo']+'.rpt';

   PodeExportar := True;
   if infoRelatorio.Campo['sn_pode_exportar'] = 0 then
      PodeExportar := False;

   PrincipalForm.ImprimeRpt(Self, sNomeRelatorio, -1, sFiltro, '', nil, nil, nil, nil, True, False, nil, PodeExportar);

end;

procedure TfrmRetornoBanco.btnImprimirTudoClick(Sender: TObject);
var
   sNomeRelatorio: String;
   PodeExportar: Boolean;
   infoRelatorio: ClasseRegistros;
begin
   infoRelatorio := PrincipalForm.GetInfoRpt('repBaixasRetornoCompleto');

   sNomeRelatorio := infoRelatorio.Campo['nm_arquivo']+'.rpt';

   PodeExportar := True;
   if infoRelatorio.Campo['sn_pode_exportar'] = 0 then
      PodeExportar := False;
      
   PrincipalForm.ImprimeRpt(Self, sNomeRelatorio, -1, '{retorno.codigo}= ' + qryRetornocodigo.AsString, '', nil, nil, nil,nil, True, False, nil, PodeExportar);
end;

procedure TfrmRetornoBanco.btnRegrasClick(Sender: TObject);
begin
   Application.CreateForm(TfrmConfiguraRetorno, frmConfiguraRetorno);

   frmConfiguraRetorno.ShowModal;

 // Atualizar os valores dos Parâmetros 
   AtualizarParametros();   
end;

procedure TfrmRetornoBanco.btnEstornarClick(Sender: TObject);
Var
   dblDinheiro, dblCheque : Currency;
   iCodCaixa, iCodAbertura, iCodAberturaAtual : integer;
   iTpConta :word;
   Movimento : TMovimento;
   ds_historico, sCodCheques, sOpCheques, sAux, sCodMensalidadeOrigem : String;
   i : Integer;
   qyAltera,  qyValidaMensalidade : TUMZQuery;
   bTemParcial : Boolean;
   Ponteiro : Pointer;
begin
   // A lógica de estorno foi baseada no estorno pela planilha de mensalidades, porém,
   // simplificada, visto que algumas verificações se fazem desnecessárias.
   if not DM.UsuarioLogado.TemPermissao( 2015, npAcesso, True ) then Exit;

   if NOT ((qryItenscd_situacao.AsInteger = 10) and (qryItenssn_baixar.AsString = 'S')) Then Begin
      Mensagem( 'Este item não está disponível para estorno.', Application.Title, MB_OK + MB_ICONSTOP );
      Exit;
   End;

   if hasNFGerada(qryItensnr_nossonumero.AsString) then
   begin
      if not DM.UsuarioLogado.TemPermissao(DM.GetUsuarioLogado.Pessoa.Codigo, 'UMFinanceiro.PermiteEstornarComNF', npAcesso, true) then
      begin
         Exit;
      end;

      if Mensagem('O título que está sendo estornado tem uma NF gerada. Deseja continuar?', 'Aviso', MB_YESNO + MB_ICONWARNING, Handle) <> mrYes then
      begin
         Exit;         
      end;
   end;

  // Verificar Bloqueio por Pagamento

  if DM.EstaBloqueado(qryItensdt_pagamento.AsDateTime, True) then Exit;

  // Selecionar o caixa que foi baixado e o código de Abertura
  // Selecionar o registro de baixa e não de quitação de cheque

  // retorno = Para cada mensalidade do item, deverá repetir a ação do estorno


  if Mensagem( 'Confirma o estorno de todas as parcelas do item selecionado ?', Application.Title, MB_YESNO + MB_ICONQUESTION + MB_DEFBUTTON2) = ID_NO then Exit;

  // Solicitar o motivo do estorno uma única vez
  if ( frmEstorno = nil ) then
    Application.CreateForm(TfrmEstorno , frmEstorno);

  if( frmEstorno.motivoEstorno =  '')then begin
    frmEstorno.ShowModal;
  end;

  qryTitulos.First();

  while not qryTitulos.Eof do begin

      qyTemp2.Close;
      qyTemp2.SQL.Clear;
      qyTemp2.SQL.Add('SELECT * FROM fin_mov_tesouraria WHERE nr_estorno = 0 AND cd_acao <> 18 AND cd_mensalidade = :CdMensalidade' );
      qyTemp2.SQL.Add('ORDER BY cd_movimento_te ');
      qyTemp2.ParamByName('CdMensalidade').AsInteger := qryTituloscd_mensalidade.AsInteger;
      qyTemp2.Open;

      // Parcela entrou no caixa?

      if qyTemp2.Eof then
      begin
          Mensagem( 'Não é possível estornar uma parcela que não entrou na conta.', Application.Title, MB_OK + MB_ICONSTOP );
          Screen.Cursor := crDefault;
          Exit;
      end;


      // Verificar se todos os lançamentos com este cd_mensalidade estão em caixas abertos

      qyTemp2.First();

      // Códigos dos caixas que a parcela foi baixada
      iCodCaixa := qyTemp2.FieldByName('cd_caixa').AsInteger;
      iCodAbertura := qyTemp2.FieldByName('cd_abertura_caixa').AsInteger;

      movimento := TMovimento.Create;

      movimento.Coligada := qyTemp2.FieldByName('cd_coligada').AsInteger;

      if not Movimento.VerificaContaAtiva(iCodCaixa, iTpConta, iCodAberturaAtual ) then begin
        Mensagem( 'Não é possível estornar mensalidade. A conta não está mais ativa.', Application.Title, MB_OK + MB_ICONSTOP );
        Screen.Cursor := crDefault;
        Exit;
      end;

      if (iTpConta = 3) AND (iCodAberturaAtual = 0) then begin
        Mensagem( 'Não é possível estornar mensalidade. O caixa está fechado.', Application.Title, MB_OK + MB_ICONSTOP );
        Screen.Cursor := crDefault;
        Exit;
      end;

      if (iTpConta = 3) AND (iCodAberturaAtual <> iCodAbertura) then begin
        if Mensagem( 'Atenção: O caixa que a parcela foi baixada ja foi fechado. Se você estornar essa parcela, será feito um lançamento de débito no caixa aberto atualmente. Deseja continuar.', Application.Title, MB_YESNOCANCEL + MB_ICONSTOP ) <> mrYES then begin
           Screen.Cursor := crDefault;
           Exit;
        end;
      end;

      movimento.free;

      // Verificar se tem alguma parcela parcial PAGA abaixo deste cd_mensalidade;

      sCodMensalidadeOrigem := qryTituloscd_mensalidade_origem.AsString;

      qyTemp1.Close();
      qyTemp1.SQL.Text :=
        ' SELECT count(*) AS resultado FROM mensalidades m ' +
        '  WHERE m.cd_mensalidade_origem = ' + sCodMensalidadeOrigem +
        '    AND m.cd_mensalidade > ' + qryTituloscd_mensalidade.AsString +
        '    AND m.situacao in (0,1) ';

      qyTemp1.Open();

      bTemParcial := qyTemp1.FieldByName('resultado').AsInteger > 0;

      if bTemParcial then begin

         sAux := 'Atenção:' + CHR(13) + CHR(13);
         sAux := 'Existe um título parcial desta parcela baixada. Você deverá estornar primeiro esta parcial.';

         Mensagem(sAux, 'UNIMESTRE', MB_OK + MB_ICONWARNING);

         Exit;

      end;


      // Verificar se tem que autenticar

      // Códigos dos caixas que a parcela foi baixada
      iCodCaixa := qyTemp2.FieldByName('cd_caixa').AsInteger;
      iCodAbertura := qyTemp2.FieldByName('cd_abertura_caixa').AsInteger;

      Screen.Cursor := crHourGlass;

      dblDinheiro := qyTemp2.FieldByName('vl_dinheiro').AsCurrency;
      dblCheque   := qyTemp2.FieldByName('vl_cheque').AsCurrency;
      ds_historico := qyTemp2.FieldByNAme('ds_movimento').AsString;

      movimento := TMovimento.Create;

      movimento.Historico := 'ESTORNO ' + qyTemp2.FieldByName('ds_movimento').AsString;

      Movimento.ValorMovimento := qyTemp2.FieldByName('vl_movimento').AsCurrency;

      Movimento.ValorEmDinheiro := qyTemp2.FieldByName('vl_dinheiro').AsCurrency;
      Movimento.ValorEmCheque   := qyTemp2.FieldByName('vl_cheque').AsCurrency;
      Movimento.Mensalidade     := qyTemp2.FieldByName('cd_mensalidade').AsInteger;

      if qyTemp2.FieldByName('tp_entrada_saida').AsInteger = 1 then begin
         Movimento.EntradaSaida    := 2;
      end else begin
         Movimento.EntradaSaida    := 1;
      end;

      Movimento.CodAcao := 6 ; // Acão Padrão
      Movimento.NumeroDocumento := qyTemp2.FieldByName('nr_documento').AsString;
      Movimento.DataLiberacao := Date;
      Movimento.Origem := 1; // Contas a Receber;

      // Gravar a mesma data de movimento do lançamento original - resolve os problemas de saldos dos relatórios.
      Movimento.DataMovimento := qyTemp2.FieldByName('dt_movimento').AsDateTime;

      Movimento.Coligada := qyTemp2.FieldByName('cd_coligada').AsInteger;
      Movimento.FormaDePagamento := qyTemp2.FieldByName('cd_forma_pgto').AsInteger;

      Movimento.RegistrarMovimentacaoTe( iCodCaixa );

      // Registrar o Estorno

      DM.CriarConsulta(qyAltera);
      qyAltera.SQL.Text :=
         ' SELECT max(nr_estorno) ultimo FROM fin_mov_tesouraria ';
      qyAltera.Open();

      i := qyAltera.FieldByName('ultimo').AsInteger + 1;

      qyAltera.Close();

      qyAltera.SQL.Text :=
          ' UPDATE fin_mov_tesouraria      ' +
          ' SET nr_estorno = ' + IntToStr(i) +
          ' , dt_compensacao = NULL, sn_compensado = 0 '  +  // Um estorno não poderá mais contar no saldo
          ' WHERE cd_movimento_te in (' + IntToStr(qyTemp2.FieldByName('cd_movimento_te').AsInteger) + ', ' + IntToStr(Movimento.CodigoMovimento) + ') AND cd_coligada = ' + qyTemp2.FieldByName('cd_coligada').AsString;
      qyAltera.ExecSQL();

      // Estornar a Apropriação na tesouraria

      qyAltera.SQL.Text := ' DELETE FROM fin_apropria_te WHERE cd_movimento_te = ' + qyTemp2.FieldByName('cd_movimento_te').AsString +
       ' AND cd_coligada = ' + qyTemp2.FieldByName('cd_coligada').AsString;
      qyAltera.ExecSQL();

      // Liberar no retorno para baixar novamente

      qyAltera.SQL.Text := ' DELETE from retorno_itens_titulos WHERE cd_retorno = ' + qryTituloscd_retorno.AsString +
                           ' AND nr_sequencia = ' + qryTitulosnr_sequencia.AsString +
                           ' AND cd_mensalidade = ' + qryTituloscd_mensalidade.AsString ;
      qyAltera.ExecSQL();

      FreeAndNil(qyAltera);

      //Registrar o motivo do estorno para cada mensalidade
      Movimento.registraEstorno(
        qyTemp2.FieldByName('cd_movimento_te').AsInteger,
        qyTemp2.FieldByName('cd_caixa').AsInteger,
        qryTituloscd_mensalidade.AsInteger,
        qyTemp2.FieldByName('cd_coligada').AsInteger,
        dm.iCdPessoaLogado,
        qryItensdt_pagamento.AsDateTime,
        frmEstorno.motivoEstorno,
        0
      );

      Movimento.free;

      // Fim do registro de Estorno

      // Agora deve ser reaberta a mensalidade

      DM.tblMensalidades.Close;
      DM.tblMensalidades.SQL.Clear;
      DM.tblMensalidades.SQL.Add( 'select * from Mensalidades where' );
      DM.tblMensalidades.SQL.Add( '(cd_mensalidade = :CdMensalidade)' );
      DM.tblMensalidades.ParamByName('CdMensalidade').AsInteger := qryTituloscd_mensalidade.AsInteger;
      DM.tblMensalidades.Open;

      DM.tblMensalidades.Edit;
      DM.tblMensalidadesDataPagamento.AsString := '';
      DM.tblMensalidadesSituacao.AsInteger := 2;
      DM.tblMensalidadesValorPago.Value := 0;
      Dm.tblMensalidadesdt_credito.AsString := '';
      DM.tblMensalidadesIndiceCorrecao.Value := 0;

      // Voltar os Juros anteriores
      DM.tblMensalidadesValorJuros.AsCurrency := DM.tblMensalidadesvalorjuros_fixo.AsCurrency;
      DM.tblMensalidadesValorDesconto.AsCurrency := Dm.tblMensalidadesvalordesconto_fixo.AsCurrency;

      // Limpar o número do talão de depósito
      DM.tblMensalidadesds_deposito.AsString := '';

      DM.tblMensalidades.Post;

      // Estornar o lançamento no Movimento do Contas a Receber
      qyTemp2.Close;
      qyTemp2.SQL.Clear;

      //Verifica se a conexão é Oracle ou MySQL
      if qyTemp2.Connection.Protocol = 'oracle' then //Oracle
      begin
        qyTemp2.SQL.Add(
           ' DELETE FROM fin_mov_cr '  +
           '  WHERE cd_mensalidade = :CdMensalidade ' +
           '  AND COALESCE(cd_mensalidade_origem, cd_mensalidade) = :cd_mensalidade_origem ' +
           '  AND cd_coligada = :CdColigada ' +
           '  AND sn_desc_condicional = 0 ' +
           '  AND NR_SEQUENCIA = (SELECT MAX(NR_SEQUENCIA) FROM FIN_MOV_CR WHERE CD_MENSALIDADE = :CdMensalidade AND CD_COLIGADA = :CdColigada) '
         );
      end else begin
        qyTemp2.SQL.Add(
           ' DELETE FROM fin_mov_cr '  +
           '  WHERE cd_mensalidade = :CdMensalidade ' +
           '  AND COALESCE(cd_mensalidade_origem, cd_mensalidade) = :cd_mensalidade_origem ' +
           '  AND cd_coligada = :CdColigada ' +
           '  AND sn_desc_condicional = 0 ' +
           '  ORDER BY nr_sequencia DESC LIMIT 1 '
         );
      end;
      qyTemp2.ParamByName('CdMensalidade').AsString := sCodMensalidadeOrigem;
      qyTemp2.ParamByName('cd_mensalidade_origem').AsInteger := Dm.tblMensalidadescd_mensalidade.AsInteger;
      qyTemp2.ParamByName('CdColigada').AsInteger := Dm.tblMensalidadescd_coligada.AsInteger;
      qyTemp2.ExecSQL();

      Screen.Cursor := crDefault;

      DM.tblMensalidades.Close();

      // Excluir as parcial criadas pela baixa
      qyTemp1.Close();
      qyTemp1.SQL.Text :=
        ' DELETE FROM mensalidades ' +
        '  WHERE cd_mensalidade_origem = ' + sCodMensalidadeOrigem +
        '    AND cd_mensalidade > ' + qryTituloscd_mensalidade.AsString +
        '    AND situacao not in (0,1) ';

      qyTemp1.ExecSQL();

      Mensagem( 'Parcelas estornadas com sucesso.', Application.Title, MB_OK + MB_ICONINFORMATION );

      qryTitulos.Next();

  end;

  AtualizarSituacaoItem(qryItenscd_retorno.AsInteger, qryItensnr_sequencia.AsInteger, sAguardandoProcessamento, qryItenscd_resp.AsInteger, qryItenscd_pessoa.AsInteger );

  Ponteiro := qryItens.GetBookmark();
  FiltrarConteudo();
  AtualizarRetorno();
  qryItens.GotoBookmark(Ponteiro);

  frmEstorno.motivoEstorno := '';
  frmEstorno.meMotivo.Text := '';

end;

procedure TfrmRetornoBanco.btnTitulosClick(Sender: TObject);
begin
   if btnTitulos.Tag = 1 then begin
      frmRetornoTitulos.Close();
      btnTitulos.Down := false;
      btnTitulos.Tag := 0;
   end else begin
       btnTitulos.Down := true;
       btnTitulos.Tag := 1;
       Application.CreateForm(TfrmRetornoTitulos, frmRetornoTitulos);
       frmRetornoTitulos.Show();
   end;
end;

procedure TfrmRetornoBanco.sbBaixarClick(Sender: TObject);
begin
   try
      // Desativar os botões enquanto processa o arquivo
      sbSelecionarColuna.Enabled := false;
      btnTitulos.Enabled := false;
      btBaixar.Enabled := false;
      btnLogs.Enabled := btBaixar.Enabled;
      btnEstornar.Enabled := false;
      btnRegras.Enabled := false;
      btnFechar.Enabled := false;
      sbBaixar.Enabled := false;

      dtcItens.OnDataChange := nil;

      NomeArquivoRetorno := qryRetornoNomeArquivo.AsString;

      ProcessarArquivo();


   finally

      sbSelecionarColuna.Enabled := true;
      btnTitulos.Enabled := true;
      btnRegras.Enabled := true;
      btnFechar.Enabled := true;
//      sbBaixar.Enabled := true; Essa ativação já ocorre na atualização dos totais

      dtcItens.OnDataChange :=  dtcItensDataChange;
   end;
end;

procedure TfrmRetornoBanco.sbSelecionarColunaClick(Sender: TObject);
begin
   Application.CreateForm(TfrmSelColunas, frmSelColunas);
   frmSelColunas.SelecionaColunas(grdItens, 'planilha_retorno_itens');
end;

procedure TfrmRetornoBanco.txtArquivoChange(Sender: TObject);
begin
   if trim(txtArquivo.Text) = '' then begin

   end;
end;

procedure TfrmRetornoBanco.AtualizarParametros;
begin
 if DM.variavel_parametro('financeiro_retorno_limite_ajuste_juros') <> '' then begin
     pLimiteJuros := StrToCurr(DM.variavel_parametro('financeiro_retorno_limite_ajuste_juros'));
  end else begin
     pLimiteJuros := 0
  end;

  if DM.variavel_parametro('financeiro_retorno_limite_ajuste_desconto') <> '' then begin
     pLimiteDescontos := StrToCurr(DM.variavel_parametro('financeiro_retorno_limite_ajuste_desconto'));
  end else begin
     pLimiteDescontos := 0
  end;

  pBaixarParcial := DM.variavel_parametro('financeiro_retorno_baixar_parcial_pgto_menor');

  pRetirarDesconto := DM.variavel_parametro('financeiro_retorno_retirar_desconto_se_pago_maior') ;
end;

procedure TfrmRetornoBanco.AtualizarRetorno;
Var
   qAtualiza : TUMZQuery;
begin


  DM.CriarUniConsulta(qAtualiza);


  qAtualiza.Close;
  qAtualiza.SQL.Clear;
  qAtualiza.SQL.Add('UPDATE retorno SET ');
  qAtualiza.SQL.Add('Baixados = :baixados, Rejeitados = :rejeitados, outras_ocorrencias = :outras_ocorrencias ');
  qAtualiza.SQL.Add('WHERE codigo = :codigo');

  qAtualiza.ParamByName('codigo').AsInteger := qryRetornocodigo.AsInteger;
  qAtualiza.ParamByName('baixados').AsInteger    := qryItensTotalqtd_baixados.AsInteger;
  qAtualiza.ParamByName('rejeitados').AsInteger  := qryItensTotalqtd_pendentes.AsInteger;
  qAtualiza.ParamByName('outras_ocorrencias').AsInteger := qryItensTotalqtd_informativos.AsInteger;

  qAtualiza.ExecSQL;

  FreeAndNil(qAtualiza);
  PrecisaAtualizarRetorno := true;
end;

procedure TfrmRetornoBanco.AtualizarSituacaoItem(cd_retorno : Integer; cd_linha : Integer; cd_situacao : TSituacao; cd_resp : Integer = 0; cd_pessoa : Integer = 0; dt_vencimento: TDateTime = 0; ds_obs : string = '');
Var
  iAcao : Integer;
  qryAux : TUMZQuery;  
begin
  case cd_situacao of
       sAguardandoProcessamento: iAcao := 0;
       sOcorrenciaInexistente: iAcao := 1;
       sNNNaoEncontrado: iAcao := 2;
       sValorDivergente: iAcao := 3;
       sJaPago : iAcao := 4;
       sNegociado: iAcao := 5;
       sCancelado: iAcao := 6;
       sDesconto : iAcao := 8;
       sNNDuplicado: iAcao := 7;
       sRegistroInformativo: iAcao := 9;
       sRegistroProcessado : iAcao := 10;
   end;

   Dm.CriarConsulta(qryAux);

   qryAux.SQL.Text :=
      ' UPDATE retorno_itens set cd_situacao = :cd_situacao ';

   // Atualizar o código do responsável financeiro e aluno do boleto
   if cd_resp > 0 then begin
      qryAux.SQL.Add(' , cd_resp = ' + IntToStr(cd_resp));
   end;
   if cd_pessoa > 0 then begin
      qryAux.SQL.Add(' , cd_pessoa = ' + IntToStr(cd_pessoa));
   end;
   if dt_vencimento > 0 then begin
      qryAux.SQL.Add(' , dt_vencimento = IFNULL(dt_vencimento, "' + FormatDateTime('yyyy-mm-dd', dt_vencimento) +'")');
   end;
   // if ds_obs <> '' then begin
      // A nova observação pode sempre gravar.
      qryAux.SQL.Add(' , ds_observacao = "' + ds_obs + '"' );
   // end;
   qryAux.SQL.Add(
      '  WHERE cd_retorno = :cd_retorno ' +
      '    AND nr_sequencia = :nr_sequencia ') ;

   qryAux.ParamByName('cd_retorno').AsInteger := cd_retorno;
   qryAux.ParamByName('nr_sequencia').AsInteger := cd_linha;
   qryAux.ParamByName('cd_situacao').AsInteger := iAcao;

   qryAux.ExecSQL();

   FreeAndNil(qryAux);

end;

function TfrmRetornoBanco.BaixarDuplicados(Valor: Currency; Conta: Integer): Currency;
Var
   // Valores contidos na mensalidade do aluno
   aMensaTotalCalc : Array of Currency;  // Valor total calculado pelo UNIMESTRE
   aMensaLiquido   : Array of Currency;  // Valor Bruto + ValorExtra - DescontoExtra + ValorJuros(fixo)
   aMensaDesconto  : Array of Currency;  // Valor Desconto
   aMensaJuros     : Array of Currency;  // Juros CALCULADO - JUROS(fixo)

   //Valores que serão baixados
   aBaixaTotal     : Array of Currency; // Valor que será baixado (líquido)
   aBaixaLiquido   : Array of Currency; // Valor Bruto + ValorExtra - DescontoExtra + ValorJuros(fixo)
   aBaixaDesconto  : Array of Currency; // Valor Desconto
   aBaixaJuros     : Array of Currency; // Juros CALCULADO - JUROS(fixo)
   aBaixaDiferenca : Array of Currency;
   APodeBaixar     : Array of Boolean;

   bEfetuarBaixa : Boolean;

   cValorPendente  : Currency;
   cValorTotalCalc,
   cValorTotalJuros,
   cValorTotalDesconto : Currency;
   cValorAux : Currency;
   i : Integer;

   bBaixouTodas : Boolean;

   sMsgAux : String;
begin

   // A tabela de mensalidades neste ponto tem todos os registos com o mesmo
   // NN em ordem decrescente de valor.

   // Guardar os valores atualizados das mensalidades encontradas
   Dm.tblMensalidades.First();

   // Definir tamanho dos Arrays;

   SetLength(aMensaTotalCalc, DM.tblMensalidades.RecordCount);
   SetLength(aMensaLiquido,   DM.tblMensalidades.RecordCount);
   SetLength(aMensaDesconto,  DM.tblMensalidades.RecordCount);
   SetLength(aMensaJuros,     DM.tblMensalidades.RecordCount);

   SetLength(aBaixaTotal,     DM.tblMensalidades.RecordCount);
   SetLength(aBaixaLiquido,   DM.tblMensalidades.RecordCount);
   SetLength(aBaixaDesconto,  DM.tblMensalidades.RecordCount);
   SetLength(aBaixaJuros,     DM.tblMensalidades.RecordCount);
   SetLength(aBaixaDiferenca, DM.tblMensalidades.RecordCount);
   SetLength(aPodeBaixar,     DM.tblMensalidades.RecordCount);

   i := 0;
   cValorTotalCalc := 0;
   CValorTotalJuros := 0;
   cVAlorTotalDesconto := 0;

   // Primeiramente será carregado para os arrays todos os valores
   // Referente a todas as mensalidades encontradas para este NN
   while not Dm.tblMensalidades.Eof do begin

      // Colocar a data de pagamento para saber o valor no dia do pagamento
      // Destar forma, o CALCFIELD irá atualizar os descontos e juros
      DM.tblMensalidades.Edit;

      DM.tblMensalidadesDataPagamento.AsDateTime := qryItensdt_pagamento.AsDateTime ;
      DM.tblMensalidadesdt_credito.AsDateTime := qryItensdt_credito.AsDateTime;

      aMensaTotalCalc[i] := DM.tblMensalidadesValorTotalCalc.AsCurrency;

      aMensaLiquido[i]   := DM.tblMensalidadesValorBruto.AsCurrency +
                            DM.tblMensalidadesValorExtra.AsCurrency +
                            DM.tblMensalidadesValorJuros.AsCurrency -
                            DM.tblMensalidadesDescontoExtra.AsCurrency;

      aMensaDesconto[i]  := DM.tblMensalidadesValorDescontoCalc.AsCurrency;

      // Somente o juros calculado - retirar o juros fixo, pois já está no aMensaLiquido
      aMensaJuros[i]     := DM.tblMensalidadesValorJurosCalc.AsCurrency; 

      cValorTotalCalc := cValorTotalCalc + aMensaTotalCalc[i];
      cValorTotalJuros := cValorTotalJuros + aMensaJuros[i];
      cValorTotalDesconto := cValorTotalDesconto + aMensaDesconto[i];

      INC(i);

      DM.tblMensalidades.Cancel();

      DM.tblMensalidades.Next();

   end;

   cValorPendente := Valor;

   bEfetuarBaixa := false;

   // Percorrer todas as parcelas e tentar alocar o valor TOTAL para efetuar a baixa
   //

   bBaixouTodas := true;

   for i := 0 to Length(aMensaTotalCalc) - 1 do begin

      if (aMensaTotalCalc[i] <= cValorPendente) then begin
         aBaixaTotal[i]    := aMensaTotalCalc[i];
         aBaixaDesconto[i] := aMensaDesconto[i];
         aBaixaJuros[i]    := aMensaJuros[i];
         aBaixaDiferenca[i] := 0;
         cValorPendente := cValorPendente - aMensaTotalCalc[i];
         APodeBaixar[i] := true;
      end else begin
         aPodeBaixar[i] := false;
         aBaixaDiferenca[i] := aMensaTotalCalc[i] - cValorPendente;
         bBaixouTodas  := false;

      end;

   end;

   if (bBaixouTodas) AND (cValorPendente = 0) then begin
      // Se o valor pago foi suficiente para baixar 1 ou mais parcelas completas, sem sobra de valores 
      bEfetuarBaixa := True;
   end;
   


   // Caso tenha ficado pendencias por pagamento a menor, fazer os tratamentos para ver se é possível ajustar com os
   // Parametros de limite de juros e Descontos

   if bBaixouTodas = false then begin
      cValorAux := cValorTotalCalc - qryItensvl_pago.AsCurrency;
      if (cValorPendente = 0) THEN begin
         // Se faltou parcelas, mas o valor foi suficiente para baixar outras parcelas do aluno.
         sMsgAux := 'Pgto a menor: '  + FloatToStrF(cValorAux, ffNumber, 7, 2);
         bEfetuarBaixa := true;
      end else begin
         if ( cValorAux <= pLimiteJuros ) AND (cValorTotalJuros >= cValorAux)  then begin

             sMsgAux := 'Pgto a menor: '  + FloatToStrF(cValorAux, ffNumber, 7, 2) + ' Ajustado juros/desc';

             // Se entrar aqui, ele vai sair com tudo resolvido, retirando os juros para fechar o valor.
             // Montar novamente as variaveis, porém agora, tentando resolver os juros desde a primeira parcela
             cValorPendente := Valor;

             // Percorrer todas as parcelas e tentar alocar o valor TOTAL para efetuar a baixa
             //

             bBaixouTodas := true;

             for i := 0 to Length(aMensaTotalCalc) - 1 do begin

                // Se tiver juros, vou reduzir o juros
                if aMensaJuros[i] >= cValorAux then begin
                   aMensaTotalCalc[i] := aMensaTotalCalc[i] - cValorAux;
                   aMensaJuros[i] := aMensaJuros[i] - cValorAux;
                   cValorAux := 0;
                end else begin
                   aMensaTotalCalc[i] := aMensaTotalCalc[i] - aMensaJuros[i];
                   cValorAux := cValorAux - aMensaJuros[i];
                   aMensaJuros[i] := 0;
                end;

                if (aMensaTotalCalc[i] <= cValorPendente) then begin
                   aBaixaTotal[i]    := aMensaTotalCalc[i];
                   aBaixaDesconto[i] := aMensaDesconto[i];
                   aBaixaJuros[i]    := aMensaJuros[i];
                   aPodeBaixar[i] := true;
                   aBaixaDiferenca[i] := 0;
                   cValorPendente := cValorPendente - aMensaTotalCalc[i];
                end else begin

                   aPodeBaixar[i] := false;
                   aBaixaDiferenca[i] := aMensaTotalCalc[i] - cValorPendente;
                   bBaixouTodas  := false;
                end;

             end;

             If cValorPendente = 0 then begin
                // Se ele conseguiu atribuir o valor pendente nas parcelas, então pode baixar;
                bEfetuarBaixa := true;
             end;


         end;


         if ( cValorAux <= pLimiteDescontos) and (cValorAux > 0)   then begin

             sMsgAux := 'Pgto a menor: '  + FloatToStrF(cValorAux, ffNumber, 7, 2) + ' Ajustado juros/desc';

             // Se entrar aqui, ele vai sair com tudo resolvido, incluindo descontos para fechar o valor.
             // Montar novamente as variaveis, porém agora, tentando resolver os descontos desde a primeira parcela
             cValorPendente := Valor;

             // Percorrer todas as parcelas e tentar alocar o valor TOTAL para efetuar a baixa
             //

             bBaixouTodas := true;

             for i := 0 to Length(aMensaTotalCalc) - 1 do begin

                // Verificar se pode retirar o desconto desta parcela
                if aMensaTotalCalc[i] > cValorAux then begin
                   aMensaTotalCalc[i] := aMensaTotalCalc[i] - cValorAux;
                   aMensaDesconto[i] := aMensaDesconto[i] + cValorAux;
                end;

                if (aMensaTotalCalc[i] <= cValorPendente) then begin
                   aBaixaTotal[i]    := aMensaTotalCalc[i];
                   aBaixaDesconto[i] := aMensaDesconto[i];
                   aBaixaJuros[i]    := aMensaJuros[i];
                   aPodeBaixar[i] := True;
                   aBaixaDiferenca[i] := 0;
                   cValorPendente := cValorPendente - aMensaTotalCalc[i];
                end else begin
                   aPodeBaixar[i] := false;
                   aBaixaDiferenca[i] := aMensaTotalCalc[i] - cValorPendente;
                   bBaixouTodas  := false;
                end;
             end;

             If cValorPendente = 0 then begin
                // Se ele conseguiu atribuir o valor pendente nas parcelas, então pode baixar;
                bEfetuarBaixa := true;
             end;

         end;
      end;
   end else begin
     if ( cValorPendente > 0 ) then begin

        // Se o valor pago a maior está dentro do valor limite para ajuste de juros, então baixar
        // Arrumar a diferença pendente como juros na primeira parcela

        if (cValorPendente <= pLimiteJuros) then begin

            sMsgAux := 'Pgto a maior: ' + FloatToStrF(cValorPendente, ffNumber, 7, 2) + ' Ajustado juros/desc';

            aBaixaTotal[0]    := aMensaTotalCalc[0] + cValorPendente;
            aBaixaJuros[0]    := aMensaJuros[0] + cValorPendente;
            cValorPendente    := 0;
            aPodeBaixar[0]    := true;

            bEfetuarBaixa := true;

            cValorPendente := 0;

        end;

     end;

   end;


   // Verificar o que ainda falta baixar

   if not bEfetuarBaixa then begin
      // Se ele entrar aqui, é porque a diferença do valor pago para o valor pendente é maior que os limites.
      // Pode ser a maior ou a menor. Deve ser verificado o que fazer
      cValorAux := cValorTotalCalc - qryItensvl_pago.AsCurrency;

      if cValorAux > 0 then begin

         if pBaixarParcial = 'S' then begin
            // O alunos pagou um valor menor que o limite e o sistema está configurado para gerar a parcial.
            sMsgAux :=  'Pgto a menor: ' + FloatToStrF(cValorAux, ffNumber, 7, 2) + ' Baixa Parcial ';

            bBaixouTodas := true;
            cValorPendente := Valor;

            bEfetuarBaixa := true;

            for i := 0 to Length(aMensaTotalCalc) - 1 do begin

              if (aMensaTotalCalc[i] <= cValorPendente) then begin
                 aBaixaTotal[i]    := aMensaTotalCalc[i];
                 aBaixaDesconto[i] := aMensaDesconto[i];
                 aBaixaJuros[i]    := aMensaJuros[i];
                 aBaixaDiferenca[i] := 0;
                 cValorPendente := cValorPendente - aMensaTotalCalc[i];
                 APodeBaixar[i] := true;
              end else begin
                 aPodeBaixar[i] := true;
                 aBaixaTotal[i]    := cValorPendente;
                 aBaixaDesconto[i] := aMensaDesconto[i];
                 aBaixaJuros[i]    := aMensaJuros[i];
                 cValorPendente := 0;

              end;

           end;

         end else begin
            sMsgAux :=  'Pgto a menor: ' + FloatToStrF(cValorAux, ffNumber, 7, 2);
            bEfetuarBaixa := false;
         end;

      end else begin
          // Se entrar aqui, é porque o aluno pagou a maior
          IF (pRetirarDesconto = 'S')
             AND (RoundFloat(ABS(cValorPendente), 2) <= RoundFloat(cValorTotalDesconto,2))
          then begin
             sMsgAux := 'Pgto a maior: ' + FloatToStrF(ABS(cValorPendente), ffNumber, 7, 2) + ' ajuste desconto' ;

             for i := 0 to Length(aBaixaDesconto) - 1 do begin

                // Se o aluno tinha desconto
                if (aBaixaDesconto[i] > 0)  then begin

                   if aMensaDesconto[i] <= cValorPendente then begin

                      cValorPendente := cValorPendente - aBaixaDesconto[i];
                      aBaixaTotal[i] := aBaixaTotal[i] + aBaixaDesconto[i];
                      aBaixaDesconto[i] := 0;

                   end else begin

                      aBaixaDesconto[i] := aBaixaDesconto[i] - cValorPendente;
                      aBaixaTotal[i] := aBaixaTotal[i] + cValorPendente;
                      cValorPendente := 0;

                   end;
                end;
             end;
             bEfetuarBaixa := true;

          end else begin
             sMsgAux := 'Pgto a maior: ' + FloatToStrF(ABS(cValorPendente), ffNumber, 7, 2) ;
          end;


      end;

   end;


   // Se a baixa ocorreu 100% correta, ou baixou algumas parcelas 100% e não sobrou valor,
   // baixar tudo e registrar sucesso
   IF (bEfetuarBaixa)   then
   begin

       i := 0;
       DM.tblMensalidades.First;

       cValorAux := 0;
       while not DM.tblMensalidades.Eof do
       begin
          if (APodeBaixar[i]) then
          begin
              BaixarMensa(Conta, aBaixaTotal[i], aBaixaDesconto[i], aBaixaJuros[i]);
          end;
          Dm.tblMensalidades.Next;
          Inc(i);
       end;
       AtualizarSituacaoItem(qryItenscd_retorno.AsInteger, qryItensnr_sequencia.AsInteger, sRegistroProcessado, DM.tblMensalidadescd_resp.AsInteger, Dm.tblMensalidadesCodigoAluno.AsInteger, Dm.tblMensalidadesDataVencimento.AsDateTime, sMsgAux);

       // Se baixou tudo 100%, pode sair da procedure;
       
   end else begin
       AtualizarSituacaoItem(qryItenscd_retorno.AsInteger, qryItensnr_sequencia.AsInteger, sValorDivergente, DM.tblMensalidadescd_resp.AsInteger, Dm.tblMensalidadesCodigoAluno.AsInteger, Dm.tblMensalidadesDataVencimento.AsDateTime, sMsgAux);
   end;


   EXIT; // Teste, decidir o que fazer depois


end;

procedure TfrmRetornoBanco.BaixarMensa(Conta: Integer; ValorBaixa: Currency; ValorDesconto : Currency; ValorJuros : Currency);
var
  flg : Boolean;
begin

  flg := False;

  DM.tblMensalidades.Edit;

  DM.tblMensalidadesDataPagamento.AsDateTime := qryItensdt_pagamento.AsDateTime;
  DM.tblMensalidadesdt_credito.AsDateTime := qryItensdt_credito.AsDateTime;

  DM.tblMensalidadesValorPago.AsCurrency := RoundFloat(ValorBaixa, 2);

  DM.tblMensalidadesUsuario.AsString := 'RETORNO';

  DM.tblMensalidadesValorJuros.AsCurrency := ValorJuros;
  DM.tblMensalidadesValorDesconto.AsCurrency := ValorDesconto;

  // Verificar se deve liberar os juros para todos os registros - configuração no banco_parametro_retorno
  if tblBancosn_liberar_juros.AsInteger = 1 then begin
      DM.tblMensalidadessn_liberar_juros.AsInteger := 1;
  end;
     
  flg := not (DM.BaixarMensalidade(Conta, NomeArquivoRetorno, qryRetornocd_coligada.AsInteger, false, true ));

  InserirItem();

end;

procedure TfrmRetornoBanco.BaixarMensaManualmente;
var
   cd_mensalidade : string;
   cd_caixa       : integer;
   iQtd           : integer;
begin
   { Verificar se a baixa é somente do cheque pré-datado }
   try
      Application.CreateForm( TfrmMensalidadesBaixar, frmMensalidadesBaixar );

      cd_mensalidade := '';
      
      cd_caixa :=  qryItenscd_caixa.AsInteger;

      if qryTitulos.RecordCount >= 1 then
      begin

         //seta as variáveis
         frmMensalidadesBaixar.baixaRetorno := True;
         frmMensalidadesBaixar.valorRetorno := qryItensvl_pago.AsFloat;

         if qryItenscd_situacao.AsInteger = 3 then
         begin
            frmMensalidadesBaixar.setArrParcelasSelecionadas(Self.getMensalidades(qryItensnr_nossonumero.AsString));
         end;

         frmMensalidadesBaixar.data_baixa_retorno := qryItensdt_pagamento.AsDateTime;
         frmMensalidadesBaixar.data_credito_retorno := qryItensdt_credito.AsDateTime;

         frmMensalidadesBaixar.cd_caixa_selecionado := cd_caixa;
         frmMensalidadesBaixar.setPessoaSelecionada( qryItenscd_pessoa.AsString );
         frmMensalidadesBaixar.setMensalidadeSelecionada( cd_mensalidade );
         frmMensalidadesBaixar.setTurmaSelecionada( '' );
         frmMensalidadesBaixar.setNrAnoSemestreSelecionado( '' );
         frmMensalidadesBaixar.setNmPessoaSelecionada( qryItensnm_pessoa.AsString );

         //Passa nome do resposável pela mensalidade como o titular do cheque por
         //padrão (para preenchimento automático do campo como um facilitador)
         if qryItensnm_resp.asString <> '' then
         begin
            frmMensalidadesBaixar.setnm_titular(qryItensnm_resp.asString);
         end;
         //Caso não possua um responsável pela mensalidade, passa o próprio
         //aluno como titular.
         if qryItensnm_resp.asString = '' then
         begin
            frmMensalidadesBaixar.setnm_titular(qryItensnm_pessoa.AsString);
         end;

         frmMensalidadesBaixar.ShowModal();
         if Trim(frmMensalidadesBaixar.mensalidades_baixadas) <> '' then begin
            // Se a tela foi confirmada, inserir cada uma das mensalidades e então atualizar a situação do item.

            DM.tblMensalidades.Close();
            DM.tblMensalidades.SQL.Text :=
              ' SELECT * from mensalidades WHERE cd_mensalidade in (' + frmMensalidadesBaixar.mensalidades_baixadas + '); ';
            DM.tblMensalidades.Open();

            DM.tblMensalidades.First();
            while NOT DM.tblMensalidades.Eof do begin
               InserirItem();
               Dm.tblMensalidades.Next();
            end;

            AtualizarSituacaoItem(qryItenscd_retorno.AsInteger, qryItensnr_sequencia.AsInteger, sRegistroProcessado, DM.tblMensalidadescd_resp.AsInteger, Dm.tblMensalidadesCodigoAluno.AsInteger, Dm.tblMensalidadesDataVencimento.AsDateTime, 'Baixa Manual');

         end;

         FiltrarConteudo();
         AtualizarRetorno();
      end;

   finally

      frmMensalidadesBaixar := nil

   end;
end;

procedure TfrmRetornoBanco.btBaixarClick(Sender: TObject);
begin
   if not DM.UsuarioLogado.TemPermissao( 2012, npAcesso, True ) then Exit;

   BaixarMensaManualmente();
end;

procedure TfrmRetornoBanco.btFecharClick(Sender: TObject);
begin
  Close;
end;

end.
