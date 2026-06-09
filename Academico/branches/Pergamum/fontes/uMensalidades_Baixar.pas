unit uMensalidades_Baixar;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, StdCtrls, Mask, ComCtrls, Buttons, UMEditMonetario, Grids,
  uItemComboMensalidadeCaixa, udm, UZDataset, uMensalidadesBaixarPessoaClass,
  Contnrs, General, uMensalidadesBaixarParcelaClass,
  uMensalidadesBaixarChequesClass,uRepRecibo, Menus, DB,
  uMensalidadeListaBaixa, uFinChequesMensalidades, UMComboBox, uClassMovimento, Ucmc7,
  ClassRegistros, uItemCombo, UMAjuda;

type
   TDynamicIntArray = array of Integer;

type
  TfrmMensalidadesBaixar = class(TForm)
    pnTitulo: TPanel;
    pnParcelas: TPanel;
    lbinfoSelecioneTitulos: TLabel;
    pnPgtoDinheiroCheque: TPanel;
    pnPgtoCartao: TPanel;
    tabParcelas: TTabControl;
    sgGridParcelas: TStringGrid;
    pnCheques: TPanel;
    lbNrBanco: TLabel;
    lbNrAgencia: TLabel;
    lbNrCC: TLabel;
    lbNrCheque: TLabel;
    lbVlCheque: TLabel;
    lbDtCompensacao: TLabel;
    sgGridCheques: TStringGrid;
    txtNrBanco: TEdit;
    txtNrAgencia: TEdit;
    txtNrCC: TEdit;
    txtNrCheque: TEdit;
    txtVlCheque: TUMEditMonetario;
    btnInserir: TBitBtn;
    btnExcluir: TBitBtn;
    txtDtCompensacao: TMaskEdit;
    pnTituloCheque: TPanel;
    chkDinheiro: TCheckBox;
    txtDinheiro: TUMEditMonetario;
    chkCheque: TCheckBox;
    txtCheque: TUMEditMonetario;
    chkCartao: TCheckBox;
    txtCartao: TUMEditMonetario;
    txtTroco: TUMEditMonetario;
    lbTroco: TLabel;
    txtVlTotal: TUMEditMonetario;
    lbVlTotal: TLabel;
    txtDataBaixa: TMaskEdit;
    lbDataBaixa: TLabel;
    cmbContaCaixa: TUMComboBox;
    lbContaCaixa: TLabel;
    pnBotoes: TPanel;
    chkTD: TCheckBox;
    lblTD: TLabel;
    pnlTalaoDepos: TPanel;
    pnlTalaoDeposTit: TPanel;
    lblTalaoDepos: TLabel;
    edtTalaoDepos: TEdit;
    ednm_titular: TEdit;
    Label1: TLabel;
    edObservacao: TEdit;
    pnCartao: TPanel;
    Panel2: TPanel;
    Panel3: TPanel;
    Label2: TLabel;
    Label3: TLabel;
    rbCredito: TRadioButton;
    rbDebito: TRadioButton;
    cbAdministradoras: TUMComboBox;
    Label4: TLabel;
    sgParcelasCartao: TStringGrid;
    edQtdParcelas: TEdit;
    udQtdParcelas: TUpDown;
    Label5: TLabel;
    btnCancelar: TPanel;
    btnBaixar: TPanel;
    UMAjuda1: TUMAjuda;
    edTID: TEdit;
    Label6: TLabel;
    procedure txtVlTotalChange(Sender: TObject);
    procedure Panel1MouseLeave(Sender: TObject);
    procedure Panel1MouseEnter(Sender: TObject);
    procedure Panel1Click(Sender: TObject);
    procedure edQtdParcelasKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure udQtdParcelasClick(Sender: TObject; Button: TUDBtnType);
    procedure rbDebitoClick(Sender: TObject);
    procedure rbCreditoClick(Sender: TObject);
    procedure edQtdParcelasChange(Sender: TObject);
    procedure cbAdministradorasChange(Sender: TObject);
    procedure edQtdParcelasKeyPress(Sender: TObject; var Key: Char);
    procedure cmbContaCaixaChange(Sender: TObject);
    procedure cmbContaCaixaMouseEnter(Sender: TObject);
    procedure cmbContaCaixaClick(Sender: TObject);
    procedure txtDtCompensacaoKeyUp(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure FormCreate(Sender: TObject);
    procedure chkTDClick(Sender: TObject);
    procedure btnCancelarMouseLeave(Sender: TObject);
    procedure btnCancelarMouseEnter(Sender: TObject);
    procedure sgGridParcelasClick(Sender: TObject);
    procedure sgGridParcelasExit(Sender: TObject);
    procedure btnCancelarClick(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure txtTrocoKeyPress(Sender: TObject; var Key: Char);
    procedure txtVlTotalKeyPress(Sender: TObject; var Key: Char);
    procedure sgGridChequesKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure sgGridParcelasKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure txtDataBaixaExit(Sender: TObject);
    procedure txtChequeExit(Sender: TObject);
    procedure sgGridChequesSetEditText(Sender: TObject; ACol, ARow: Integer;
      const Value: string);
    procedure popmnuRemovePessoaClick(Sender: TObject);
    procedure btnBaixarClick(Sender: TObject);
    procedure chkCartaoKeyPress(Sender: TObject; var Key: Char);
    procedure chkChequeKeyPress(Sender: TObject; var Key: Char);
    procedure chkDinheiroKeyPress(Sender: TObject; var Key: Char);
    procedure txtDtCompensacaoKeyPress(Sender: TObject; var Key: Char);
    procedure txtNrChequeKeyPress(Sender: TObject; var Key: Char);
    procedure txtNrCCKeyPress(Sender: TObject; var Key: Char);
    procedure txtNrAgenciaKeyPress(Sender: TObject; var Key: Char);
    procedure txtNrBancoKeyPress(Sender: TObject; var Key: Char);
    procedure txtDataBaixaKeyPress(Sender: TObject; var Key: Char);
    procedure cmbContaCaixaKeyPress(Sender: TObject; var Key: Char);
    procedure sgGridChequesSelectCell(Sender: TObject; ACol, ARow: Integer;
      var CanSelect: Boolean);
    procedure btnExcluirClick(Sender: TObject);
    procedure chkCartaoClick(Sender: TObject);
    procedure btnInserirClick(Sender: TObject);
    procedure chkDinheiroClick(Sender: TObject);
    procedure sgGridChequesKeyPress(Sender: TObject; var Key: Char);
    procedure sgGridChequesDrawCell(Sender: TObject; ACol, ARow: Integer;
      Rect: TRect; State: TGridDrawState);
    procedure txtVlTotalExit(Sender: TObject);
    procedure txtDinheiroExit(Sender: TObject);
    procedure sgGridParcelasSetEditText(Sender: TObject; ACol, ARow: Integer;
      const Value: string);
    procedure sgGridParcelasKeyPress(Sender: TObject; var Key: Char);
    procedure sgGridParcelasSelectCell(Sender: TObject; ACol, ARow: Integer;
      var CanSelect: Boolean);
    procedure sgGridParcelasDrawCell(Sender: TObject; ACol, ARow: Integer;
      Rect: TRect; State: TGridDrawState);
    procedure tabParcelasMouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure tabParcelasChange(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure chkChequeClick(Sender: TObject);
    procedure getListaContasCaixa(cd_caixa_selecionado: Integer = 0);
  private
    FAutoRelease: Boolean;
    data_hoje                    : TDateTime;
    data_alterada                : TDateTime;
    ListaPessoas                 : TObjectList;
    ListaCheques                 : TObjectList;

    ListaChequesMensalidades     : TObjectList;
    objPessoa                    : TMBPessoa;
    chkParcelaSelecionada        : TCheckBox;
    cheque_selecionado           : integer;

    //informações da mensalidad selecionada na planilha de recebimentos
    cd_mensalidade_selecionada   : string;
    ds_turma_selecionada         : string;
    cd_pessoa_selecionada        : string;
    ds_anosemestre_selecionado   : string;
    nm_pessoa_selecionada        : string;
    nm_titular                   : string;
    //Salva o código do caixa padrão do usuário
    cd_caixa_padrao              : string;
    index_caixa_atual            : integer;
    nr_pos_caixa_padrao          : integer;
    bBaixarCaixaAberto           : boolean;

    //recalculo do juros referente a data de compensação do cheque
    recalcula_juros              : Boolean;
    pergunta_juros_cheques       : Boolean;

    data_compensacao: TDate;

    stContasTDObrigadoria        : TStringList;
    taxaCartaoCobrada            : Double;
    procedure atualizarValores();
    function getQdeAcoesDescontosCondicionais(objParcela: TMBParcela): Integer;
    procedure aplicacaoDescontosCondicionais(iCol, iRow: Integer;
      var objParcela: TMBParcela);

    function IsAutoRelease: Boolean;
    procedure SetAutoRelease(const Value: Boolean);

    procedure VerificaValorPago();

    { Private declarations }
  public
    ListaMensalidadesBaixa: TObjectList;
    baixaRetorno: Boolean;
    cd_caixa_selecionado: Integer;
    valorRetorno: Double;
    
    data_baixa_retorno,
    data_credito_retorno         : TDate;

    mensalidades_baixadas: String;

    procedure ativaPainelCheque();
    procedure LiberaObjetos();
    procedure setDataHoje( data: TDateTime );
    procedure carregaAbas();
    procedure getMensalidade( objPessoa: TMBPessoa );
    procedure carregaGridParcelas( objPessoaParcela : TMBPessoa );
    procedure carregaGridCheques();
    procedure AdicionarCheckBox();
    procedure limpaGridParcelas();
    procedure limpaGridCheques();
    procedure limpaBuffer();
    procedure AlinharCheck();
    procedure CalcularTroco();
    procedure inserirCheque();
    procedure aoClicar( Sender : TObject );
    procedure setMensalidadeSelecionada( valor: string );
    procedure setArrParcelasSelecionadas( arrParcelas: TDynamicIntArray);
    procedure setPessoaSelecionada( valor: string );
    procedure setTurmaSelecionada( valor: string);
    procedure setNrAnoSemestreSelecionado( valor: string );
    procedure setNmPessoaSelecionada( valor: string );
    procedure setnm_titular( valor: string );
    procedure criaPessoa( cd_pessoa: string; nm_pessoa: string; ds_turma: string; nr_anosemestre : string);
    procedure ConcluirBaixaMensalidades();
    procedure HabilitaCartao( valor: Boolean );
    procedure HabilitaDinheiroCheque( valor: boolean );
    procedure LimpaCamposCheque();
    procedure SugereValorCheque();
    procedure AtualizaValorPago( objParcela : TMBParcela; iLinha : integer );
    procedure CadastrarCheques();
    procedure VerificaPgtoPorCheque();
    procedure ImpressaoDeRecibos( cd_mensalidade: String; sforcar_recibo : string; const MensalidadesAgrupadas: Boolean = False );
    procedure ImpressaoRelatorioRecibo( ds_mensalidades : string; sforcar_recibo : string );
    procedure limparListaBaixaMensalidades();
    procedure limparListaChequesMensalidades();
    procedure limparListaPessoas();
    procedure limparListaCheques();
    procedure BaixarMensalidades();
    procedure HabilitaBotaoBaixar();
    procedure AtualizaValoresMensalidades();
    procedure AtualizaJurosCompensacao();
    procedure MontaBaixaMensalidade();
    procedure InserirMensalidadeCheque();
    procedure BaixaPorDinheiroCheque();
    procedure BaixaPorCartao();
    procedure carregaAdministradoras();
    procedure habilitarcartoes();

    procedure carregaGridCartao();
    procedure carregaValoresGridCartao();
    procedure mostraQtdParcelas();
    procedure ativaBotaoBaixar( valor: boolean );
    procedure carregaContaAutomatica();
    procedure salvaParcelasCartao(codOperacao: Integer);
    procedure salvaOperacaoMensalidades(codOperacao: Integer);
   function verifica_caixa_fechado( cd_admin_cartao : Integer; field : String ): Boolean;
  
    class procedure AutenticarMensalidade(sMascara : String; objParcela: TMBParcela);
    function getDataHoje() : string;
    function getDataAtual() : TDateTime;
    function PessoaExistente( cd_pessoa: string ) : Boolean;
    function substituiCaracter( valor: string; str_antigo: string; str_novo: string ) : string;
    function confereMensalidades() : Boolean;
    function getMensalidadeSelecionada(): string;
    function getPessoaSelecionada() : string;
    function getTurmaSelecionada() : string;
    function getNrAnoSemestreSelecionado() : string;
    function getNmPessoaSelecionada() : string;
    function getnm_titulo() : string;
    function validaCaixa( cd_caixa: string; cd_depto: string; objParcela : TMBParcela ) : Boolean;
    function validaMensalidade( objParcela : TMBParcela ) : Boolean;
    function getCaixaDepto( cd_depto : integer ): string;
    function getValorPago( objParcela : TMBParcela ): double;
    function VerificaValores() : boolean;
    function VerificaTalaoDeposito() : boolean;
    function getCdChequeMaiorValor() : string;
    property AutoRelease: Boolean read IsAutoRelease write SetAutoRelease;
    function IdentificaCompensacaoMaiorVencimento() : Boolean;
    function validaData( ds_data:string ) : Boolean;
    procedure VerificaCalculoJurosCheque();
    procedure AtualizaJurosParcelas();
    function getValorTotalParcelas()   : double;
    function getValorTotalCheques()    : double;
    procedure atualizaValoresTotais();
    function getDataCompensacaoCheque() : TDate;
    function carregaMaximoIntervalo(codigoAdministradora: Integer): Integer;
    function getNumeroParcelas(): Integer;
    function getValorTaxa(codAdministradora: Integer; credito: Boolean): Currency;
    function getNumeroDias(codAdministradora: Integer; credito: Boolean): Currency;
    function getDatas(codAdministradora, nrParcelas: Integer): TStringList;
    function getProximoDiaUtil(data: String; diaSemana: Integer): String;
    function salvaOperacaoCartao(): Integer;
    function validaValoresCartaoGrid(): Boolean;

    procedure SelecionaParcela(const Mensalidade: string);
    { Public declarations }
  end;

var     
  frmMensalidadesBaixar: TfrmMensalidadesBaixar;
  arrParcelasSelecionadas: TDynamicIntArray;

Const
  iPainelCheque   = 162;
  ds_buscar       = 'Buscar outro Aluno';
  ds_observacao   = 'Observação';
  
implementation

uses uFSelecionarPessoa, Main, uImpMens, UConfirmacaoBaixa, uMensalidadeBaixarCartao,
     uUsuario, uMensalidadeAplicarDesconto;

{$R *.dfm}

procedure TfrmMensalidadesBaixar.ativaBotaoBaixar(valor: boolean);
begin
   if valor = true then
   begin
      btnBaixar.Caption := 'BAIXAR (F9)';
      btnBaixar.Tag     := 0;
      btnBaixar.Font.Color := clBlack;

      btnCancelar.Tag     := 0;
      btnCancelar.Font.Color := clBlack;
   end
   else
   begin
      btnBaixar.Tag     := 1;
      btnBaixar.Caption := 'AGUARDE...';
      btnBaixar.Font.Color := clGrayText;

      btnCancelar.Tag     := 1;
      btnCancelar.Font.Color := clGrayText;
   end;

   btnBaixar.Refresh;
end;

procedure TfrmMensalidadesBaixar.ativaPainelCheque;
begin
   if chkCheque.Checked = true then
   begin

      //expande o painel de cheque
      if pnCheques.Height = 1 then
      begin
         pnCheques.Height  := iPainelCheque;
         pnCheques.Enabled := true;

         txtNrBanco.SetFocus();
      end;

      //desabilita cartao
      Self.HabilitaCartao(false);

      //carrega a grid com os cheques
      Self.carregaGridCheques();
   end
   else
   begin
      //esconde o painel de cheques
      if pnCheques.Height <> 1 then
      begin
         pnCheques.Height  := 1;
         pnCheques.Enabled := false;
      end;

      txtCheque.setValorDouble('0');

      //desabilita cartao se cheque e dinheiro estiverem desabilitados
      if (chkCheque.Checked = false) and (chkDinheiro.Checked = false) then
      begin
         Self.HabilitaCartao(true);
      end;
   end;

end;

procedure TfrmMensalidadesBaixar.ConcluirBaixaMensalidades;
var
   cd_mensalidade,
   anosemestre,
   cd_pessoa,
   iPessoa,
   iParcela                : Integer;

   ListaParcelas           : TObjectList;

   objParcela              : TMBParcela;

   sforcar_recibo,
   mensalidades_agrupadas,
   separador,
   ds_mensalidades,
   sn_autenticar,
   ds_turma,
   cd_caixa_depto,
   cd_depto_mensalidade,
   situacao_mensalidade    : string;
   
   sn_imprimir_recibo      : boolean;
begin
   sn_autenticar        := DM.variavel_parametro('financeiro_qtd_autenticacao_baixa');
   sforcar_recibo       := TRIM(DM.variavel_parametro('financeiro_forcar_recibo'));
   sn_imprimir_recibo   := false;

   //se o parametro não estiver vazio
   if (sforcar_recibo <> '') then
   begin
      if Mensagem( 'Deseja imprimir o recibo do título baixado?', 'UNIMESTRE', MB_YESNOCANCEL + MB_ICONQUESTION ) = mrYes then
      begin
         sn_imprimir_recibo := true;
      end;
   end;

   //percorre a lista de pesso
   for iPessoa := 0 to ListaPessoas.Count - 1 do
   begin
      cd_pessoa         := 0;
      anosemestre       := 0;
      ds_turma          := '';
      ds_mensalidades   := '';

      objPessoa := (ListaPessoas.items[iPessoa] as TMBPessoa);

      //recupera a lista de parcela da pessoa corrente
      ListaParcelas := objPessoa.getListaParcelas(true);

      //se  alista de parcelas existir continuar
      if ListaParcelas <> nil then
      begin
            for iParcela := 0 to ListaParcelas.Count - 1 do
            begin
               objParcela := (ListaParcelas.items[iParcela] as TMBParcela);
               cd_mensalidade := StrToInt( objParcela.getValorCampo('cd_mensalidade') );

               //se a parcela estiver com sn_ativo = 1 é uma parcela selecionada
               //pelo usuário e vai ser baixada
               if objParcela.getValorCampo('sn_ativo') = '1'  then
               begin
                  //recupera a situacao da mensalidade
                  situacao_mensalidade := objParcela.getValorCampo('situacao');

                  //se for pendente ou reservada então prossegue na baixa
                  if (situacao_mensalidade = '2') or (situacao_mensalidade = '10')  then
                  begin

                     //departamento da mensalidade
                     cd_depto_mensalidade := objParcela.getValorCampo('depto');

                     //recupera o caixa do departamento relacionado a mensalidade
                     cd_caixa_depto := Self.getCaixaDepto( StrToInt( cd_depto_mensalidade) );

                     cd_pessoa   := StrToInt( objPessoa.getValorCampo('cd_pessoa') );
                     ds_turma    := objParcela.getValorCampo('turma');
                     anosemestre := StrToInt( objParcela.getValorCampo('anosemestre') );

                     //verifica a necessidade de autenticar a mensalidade.
                     if ( sn_autenticar <> '' ) and ( sn_autenticar <> '-1' ) then
                     begin
                        Self.AutenticarMensalidade( '', objParcela );
                     end;

                     //Concatena os códigos de mensalidades
                     if ( ds_mensalidades = '' ) then
                     begin
                        ds_mensalidades := objParcela.getValorCampo('cd_mensalidade');
                     end
                     else
                     begin
                        ds_mensalidades := ds_mensalidades + ', ' + objParcela.getValorCampo('cd_mensalidade');
                     end;

                     //imprime recibo se necessário
                     if ((sn_imprimir_recibo = true) and
                        (DM.variavel_parametro('agrupa_impressao_mensalidades_baixar') <> 'S')) then
                     begin
                        ImpressaoDeRecibos(
                           objParcela.getValorCampo('cd_mensalidade'),
                           sforcar_recibo
                        );
                     end;
                  end;
               end;
            end;
      end;

      // Caso for para imprimir mensalidades agrupadas
      if (sn_imprimir_recibo = true) and
         (DM.variavel_parametro('agrupa_impressao_mensalidades_baixar') = 'S') then
      begin

         separador := '';
         mensalidades_agrupadas := '';
         
         // percorre todas mensalidades da baixa
         for iParcela := 0 to ListaParcelas.Count - 1 do
         begin
            objParcela := (ListaParcelas.items[iParcela] as TMBParcela);

            // se parcela ativa
            if objParcela.getValorCampo('sn_ativo') = '1'  then
            begin
               situacao_mensalidade := objParcela.getValorCampo('situacao');

               // se ela não for pendente ou reservada é porque foi baixada
               if (situacao_mensalidade = '2') or (situacao_mensalidade = '10')  then
               begin

                  mensalidades_agrupadas :=
                     mensalidades_agrupadas +
                     separador +
                     objParcela.getValorCampo('cd_mensalidade');

                  separador := ', ';   
               end;
            end;
         end;

         // Imprime como mensalidade agrupada
         ImpressaoDeRecibos(
            mensalidades_agrupadas,
            sforcar_recibo,
            True
         );

      end;

      //Imprime relatorio do recibo se necessário
      if sn_imprimir_recibo = true then
      begin
         ImpressaoRelatorioRecibo( ds_mensalidades, sforcar_recibo );
      end;

      //ativa matricula
      if (cd_pessoa <> 0) and (trim(ds_turma) <> '') and (anosemestre <> 0) then
      begin
         DM.Ativar_Matricula( cd_pessoa, ds_turma, anosemestre, false, true );
      end;

   end;

end;

procedure TfrmMensalidadesBaixar.btnCancelarClick(Sender: TObject);
begin
   ModalResult := mrCancel;
   Self.Close();
end;

procedure TfrmMensalidadesBaixar.btnCancelarMouseEnter(Sender: TObject);
begin
   // Ao passar o mouse sobre este botão, retiramos o evento do OnExit da grid,
   // que estava validando valores 0 ou '' na coluna ValorPago
   // Obs.: Se ele está no cancelar, então ele PODE cancelar.
   sgGridParcelas.OnExit := nil;
end;

procedure TfrmMensalidadesBaixar.btnCancelarMouseLeave(Sender: TObject);
begin
   // Ao passar o mouse sobre este botão, habilitamos o evento do OnExit da grid,
   // que estava validando valores 0 ou '' na coluna ValorPago
   // Obs.: Se ele está FORA do cancelar, ele não pode fazer nada (OnExit habilitado).
   sgGridParcelas.OnExit := sgGridParcelasExit;
end;

procedure TfrmMensalidadesBaixar.btnExcluirClick(Sender: TObject);
var
   objCheque : TMBCheque;
begin
   if ListaCheques <> nil then
   begin
      //se houver apenas um registro então seleciona ele para exclusão
      if ListaCheques.Count = 1 then
      begin
         cheque_selecionado := 1;
      end;

      //se houver cheques cadastrados
      if ListaCheques.Count > 0 then
      begin
         if cheque_selecionado <> 0 then
         begin
            if Mensagem( 'Deseja apagar o cheque selecionado?', 'Atenção', MB_YESNO + MB_ICONINFORMATION) = mrYes then
            begin
               objCheque := (sgGridCheques.Objects[0, cheque_selecionado] as TMBCheque);
               ListaCheques.Remove( objCheque );

               if sgGridCheques.RowCount > 1 then
               begin
                  cheque_selecionado := sgGridCheques.RowCount - 1;
               end
               else
               begin
                  cheque_selecionado := 0;
               end;


               txtCheque.setValor( Self.getValorTotalCheques() );
               Self.SugereValorCheque();
               Self.CalcularTroco();

               if ListaCheques.Count = 0 then
               begin
                  ListaCheques := nil;
               end;

               Self.carregaGridCheques();

            end;
         end
         else
         begin
            Mensagem('Selecione o cheque que você deseja remover.', 'Atenção', MB_OK + MB_ICONWARNING);
         end;
      end;
   end
   else
   begin
      Mensagem('Não foi encontrado nenhum cheque para remover.', 'Atenção', MB_OK + MB_ICONWARNING);
   end;
end;

procedure TfrmMensalidadesBaixar.btnInserirClick(Sender: TObject);
begin
   if (trim(txtNrBanco.Text) <> '')
   and (trim(txtNrAgencia.Text) <> '')
   and (trim(txtNrCC.Text) <> '')
   and (trim(txtNrCheque.Text) <> '')
   and (trim(txtDtCompensacao.Text) <> '')
   and (txtVlCheque.getValorDouble() > 0) then
   begin
      Self.VerificaCalculoJurosCheque();
      Self.inserirCheque();

      Self.SugereValorCheque();

      Self.atualizaValoresTotais();
      Self.CalcularTroco();
      
      txtNrCheque.SetFocus;                                                                                 
   end
   else
   begin
      Mensagem('Preencha todas as informações referente ao cheque corretamente.','Aviso', MB_OK + MB_ICONWARNING);
   end;
end;

procedure TfrmMensalidadesBaixar.CadastrarCheques;
var
   qyCheques      : TUMZQuery;
   qyCancelar     : TUMZQuery;   
   objCheque      : TMBCheque;
   iCheques       : integer;
   cd_caixa       : string;
   cd_cheque      : integer;
   sCheques       : string;
   bErroBaixa     : boolean;
begin
   bErroBaixa  := false;
   
   if cmbContaCaixa.ItemIndex > -1 then
   begin
      cd_caixa := (cmbContaCaixa.Items.Objects[ cmbContaCaixa.itemIndex ] as TItemComboMCaixa).getCodigo();
   end;

   DM.CriarConsulta( qyCheques );
   qyCheques.Close();
   qyCheques.SQL.Clear();

   if (ListaCheques <> nil) and (ListaCheques.Count > 0) then
   begin

      for iCheques := 0 to ListaCheques.Count - 1 do
      begin
         objCheque := (ListaCheques.items[iCheques] as TMBCheque);

         if not TryStrToInt(objCheque.getValorCampo('cd_cheque'), cd_cheque) then
            cd_cheque := 0;

         try
            qyCheques.SQL.Clear();
            qyCheques.SQL.Add('INSERT INTO fin_cheques (');

            qyCheques.SQL.Add(' cd_cheque,           ');
            qyCheques.SQL.Add(' ds_cheque,           ');
            qyCheques.SQL.Add(' ds_conta,            ');
            qyCheques.SQL.Add(' ds_banco,            ');
            qyCheques.SQL.Add(' ds_agencia,          ');
            qyCheques.SQL.Add(' dt_compensacao,      ');
            qyCheques.SQL.Add(' cd_situacao,         ');
            qyCheques.SQL.Add(' nr_valor,            ');
            qyCheques.SQL.Add(' cd_caixa,            ');
            qyCheques.SQL.Add(' dt_emissao,          ');
            qyCheques.SQL.Add(' nm_titular) VALUES ( ');

            //se o cheque já possui um ID, mantem ele para o recadastro
            if cd_cheque <> 0 then
            begin
               qyCheques.SQL.Add(IntToStr(cd_cheque) + ', ');
            end
            else
            begin
               qyCheques.SQL.Add('NULL, ');
            end;

            qyCheques.SQL.Add(QuotedStr(objCheque.getValorCampo('nr_cheque')) + ', ');
            qyCheques.SQL.Add(QuotedStr(objCheque.getValorCampo('nr_conta')) + ', ');
            qyCheques.SQL.Add(QuotedStr(objCheque.getValorCampo('nr_banco')) + ', ');
            qyCheques.SQL.Add(QuotedStr(objCheque.getValorCampo('nr_agencia')) + ', ');
            qyCheques.SQL.Add(QuotedStr(FormatDateTime('yyyy-mm-dd', StrToDate(objCheque.getValorCampo('dt_compensacao')))) + ', ');
            qyCheques.SQL.Add('''0'', ');
            qyCheques.SQL.Add(QuotedStr(substituiCaracter(objCheque.getValorCampo('vl_cheque'), ',', '.')) + ', ');
            qyCheques.SQL.Add(QuotedStr(cd_caixa) + ', ');
            qyCheques.SQL.Add('NOW(), ');
            qyCheques.SQL.Add(QuotedStr(ednm_titular.Text));
            qyCheques.SQL.Add(');');

            qyCheques.ExecSQL();



            if sCheques <> '' then
            begin
               sCheques := sCheques+ ',';
            end;
            sCheques :=  sCheques + IntToStr(DM.LastInsert());
            
         Except
            bErroBaixa:= true;
            break;
         end;

         //se o cheque não tiver um ID, recupera esse ID da base
         if cd_cheque = 0 then
         begin
            cd_cheque := DM.LastInsert();

            objCheque.setValorCampo('cd_cheque',      IntToStr(cd_cheque) );
         end;

         objCheque.setValorCampo('vl_cheque_bkp',  objCheque.getValorCampo('vl_cheque') );
      end;

      if bErroBaixa then
      begin
         if sCheques <> '' then
         begin
            DM.CriarConsulta(qyCancelar);
            qyCancelar.SQL.Text := 'DELETE FROM fin_cheques WHERE cd_cheque IN ('+sCheques+')';
            qyCancelar.ExecSQL();
         end;

         for iCheques := 0 to ListaCheques.Count - 1 do
         begin
            objCheque := (ListaCheques.items[iCheques] as TMBCheque);
            objCheque.setValorCampo('cd_cheque',      '' );
         end;

         Mensagem( 'O cheque cadastrado já existe e não pode ser utilizado novamente!', 'UNIMESTRE', MB_OK + MB_ICONEXCLAMATION);
         frmMensalidadesBaixar.SetFocus();
         ativaBotaoBaixar( true );
         abort;
      end;


   end;
   FreeAndNil( qyCancelar );
   FreeAndNil( qyCheques );
end;

procedure TfrmMensalidadesBaixar.CalcularTroco;
var
   vl_valor    : double;
   vl_total    : double;
   vl_troco    : double;
begin
   if baixaRetorno then Exit;

   vl_valor    := 0;

   if (chkDinheiro.Checked = true) and (chkCheque.Checked = true) then
   begin
      vl_valor := txtDinheiro.getValorDouble() + txtCheque.getValorDouble();
   end
   else
   if chkDinheiro.Checked = true then
   begin
      vl_valor := txtDinheiro.getValorDouble();
   end
   else if chkCheque.Checked = true then
   begin
      vl_valor := txtCheque.getValorDouble();
   end
   else if chkCartao.Checked = true then
   begin
      vl_valor := txtCartao.getValorDouble();
   end;

   vl_total    := txtVlTotal.getValorDouble();

   if vl_valor > vl_total then
   begin
      vl_troco := vl_valor - vl_total;

      txtTroco.setValorDouble( FloatToStr(vl_troco) );
   end
   else
   begin
      txtTroco.setValorDouble('0');
   end;
end;

procedure TfrmMensalidadesBaixar.carregaAbas;
var
   i           : integer;
   nm_pessoa   : string;
begin
   //rotina para montar as abas de acordo com as pesquisas
   objPessoa := nil;

   //limpa todas as abas
   tabParcelas.Tabs.Clear;
 
   if ListaPessoas <> nil then
   begin
      //percorre a lista de pessoas
      for i := 0 to ListaPessoas.Count - 1 do
      begin
         objPessoa := TMBPessoa.Create();

         objPessoa := (ListaPessoas.items[i] as TMBPessoa);
         nm_pessoa := objPessoa.getValorCampo( 'nm_pessoa' );

         //adiciona a aba com o nome do aluno e o objeto relacionado a pessoa
         tabParcelas.Tabs.AddObject( nm_pessoa, objPessoa );

         objPessoa := nil;
      end;
   end;
   
   tabParcelas.Tabs.Add( ds_observacao );
   tabParcelas.Tabs.Add( ds_buscar );
end;

procedure TfrmMensalidadesBaixar.carregaAdministradoras;
const
   SQL_ADMINISTRADORA =
      ' SELECT '+
      '     cd_admin_cartao, '+
      '     ds_nome '+
      '  FROM '+
      '     fin_cadastro_admin_cartao '+
      '  WHERE '+
      '     sn_ativo = 1 ';
var
   qyAdministradoras: TUMZReadOnlyQuery;
begin
   DM.CriarConsulta(qyAdministradoras);

   qyAdministradoras.SQL.Text := SQL_ADMINISTRADORA;
   qyAdministradoras.Open;

   cbAdministradoras.Items.Clear;
   cbAdministradoras.ItemIndex := -1;

   while not qyAdministradoras.Eof do
   begin
      cbAdministradoras.Items.AddObject(
         qyAdministradoras.FieldByName('ds_nome').AsString,
         TItemCombo.Create(
            qyAdministradoras.FieldByName('cd_admin_cartao').AsString,
            qyAdministradoras.FieldByName('ds_nome').AsString
         )
      );

      qyAdministradoras.Next;
   end;
   // Selecionar automaticamente quando tiver uma única administradora
   if cbAdministradoras.Items.Count = 1 then begin
      cbAdministradoras.ItemIndex := 0;
      cbAdministradorasChange(nil);
   end;
end;

function TfrmMensalidadesBaixar.verifica_caixa_fechado( cd_admin_cartao : Integer; field : String ): Boolean;
var
   sql_busca_conta_automatica : String;
   qyVerificaCaixaFechado: TUMZReadOnlyQuery;
   bCaixaFechado : boolean;
begin
   sql_busca_conta_automatica := ''
      +' SELECT  '
      +' fcc.ds_situacao AS ds_situacao, '
      +' 	%s '
      +' FROM '
      +' fin_cadastro_admin_cartao fcac '
      +' LEFT JOIN fin_controle_caixa fcc ON ( '
      +'	  $$condicao$$ = fcc.cd_conta_banco '
      +' ) '
      +' WHERE '
      +'	fcac.cd_admin_cartao = :cd_admin_cartao '
      +' ORDER BY '
      +'	fcc.cd_abertura_caixa DESC LIMIT 1';

   sql_busca_conta_automatica := StringReplace(
      sql_busca_conta_automatica,
      '$$condicao$$',
      'fcac.'+field,
      [rfReplaceAll, rfIgnoreCase]
   );


   DM.CriarConsulta(qyVerificaCaixaFechado);
   qyVerificaCaixaFechado.SQL.Text := Format(sql_busca_conta_automatica, [field]);
   qyVerificaCaixaFechado.ParamByName('cd_admin_cartao').AsInteger := cd_admin_cartao;

   qyVerificaCaixaFechado.Open;

   bCaixaFechado := false;
   if ( UpperCase(qyVerificaCaixaFechado.FieldByName('ds_situacao').AsString) = 'F' )
   then begin
      bCaixaFechado := True;
   end;

   qyVerificaCaixaFechado.Close;
   Result := bCaixaFechado;   
end;

procedure TfrmMensalidadesBaixar.carregaContaAutomatica;
const
   SQL_BUSCA_CONTA_AUTOMATICA =
      '  SELECT '+
      '     %s '+
      '  FROM '+
      '     fin_cadastro_admin_cartao '+
      '  WHERE '+
      '     cd_admin_cartao = :cd_admin_cartao ';

var
   field : String;

   qyCampoAutomatico: TUMZReadOnlyQuery;
   
   i, cd_admin_cartao : Integer;
begin
   cmbContaCaixa.Enabled := True;

   field := 'cd_conta_debito';

   if rbCredito.Checked then
   begin
      field := 'cd_conta_credito';
   end;

   cd_admin_cartao := StrToInt(
      TItemCombo(
         cbAdministradoras.Items.Objects[cbAdministradoras.ItemIndex]
      ).getCodigo
   );

   DM.CriarConsulta(qyCampoAutomatico);

   qyCampoAutomatico.SQL.Text := Format(sql_busca_conta_automatica, [field]);
   qyCampoAutomatico.ParamByName('cd_admin_cartao').AsInteger := cd_admin_cartao;

   qyCampoAutomatico.Open;

   if ( verifica_caixa_fechado( cd_admin_cartao, field ) )
   then begin
      cmbContaCaixa.ItemIndex := -1;
      cmbContaCaixa.Enabled := False;
      Exit;
   end;

   if qyCampoAutomatico.FieldByName(field).AsString <> '' then
   begin
      for I := 0 to cmbContaCaixa.Items.Count - 1 do
      begin
         if qyCampoAutomatico.FieldByName(field).AsString = TItemComboMCaixa(cmbContaCaixa.Items.Objects[I]).getCodigo() then
         begin
            cmbContaCaixa.ItemIndex := i;
            cmbContaCaixa.Enabled := False;
            Exit;
         end;
      end;
   end;
end;

procedure TfrmMensalidadesBaixar.carregaGridCartao;
var
   iLinha         : integer;
   iColuna        : integer;
begin
   for iLinha := 1 to sgParcelasCartao.RowCount - 1 do
   begin
      for iColuna := 0 to sgParcelasCartao.ColCount - 1 do
      begin
         sgParcelasCartao.Cells[ iColuna, iLinha ] := '';
      end;
   end;

   sgParcelasCartao.RowCount := 1;

   sgParcelasCartao.Cols[0][0] := 'Par.';
   sgParcelasCartao.Cols[1][0] := 'Prev. Pag.';
   sgParcelasCartao.Cols[2][0] := 'Valor Parcela';
   sgParcelasCartao.Cols[3][0] := 'Tarifa';
   sgParcelasCartao.Cols[4][0] := 'Valor Líquido';

   sgParcelasCartao.ColWidths[0] := 40;
   sgParcelasCartao.ColWidths[1] := 80;
   sgParcelasCartao.ColWidths[2] := 100;
   sgParcelasCartao.ColWidths[3] := 60;
   sgParcelasCartao.ColWidths[4] := 100;
end;

procedure TfrmMensalidadesBaixar.carregaGridCheques;
var
   i,
   contador          : integer;
   
   objCheque         : TMBCheque;
   nr_total_cheques  : integer;
   total_linhas      : integer;
   total_colunas     : integer;
begin
   Self.limpaGridCheques();

   total_colunas              := 7;
   sgGridCheques.RowCount     := 2;
   sgGridCheques.FixedRows    := 1;
   sgGridCheques.ColCount     := total_colunas;

   sgGridCheques.Cols[0][0]   := 'Nº do Banco';
   sgGridCheques.Cols[1][0]   := 'Nº da Agência';
   sgGridCheques.Cols[2][0]   := 'Nº da CC';
   sgGridCheques.Cols[3][0]   := 'Nº do Cheque';
   sgGridCheques.Cols[4][0]   := 'Valor';
   sgGridCheques.Cols[5][0]   := 'Dt. Compensação';
   sgGridCheques.Cols[6][0]   := 'Titular';

   //tamanho das colunas
   sgGridCheques.ColWidths[0] := 80;
   sgGridCheques.ColWidths[1] := 85;
   sgGridCheques.ColWidths[2] := 90;
   sgGridCheques.ColWidths[3] := 85;
   sgGridCheques.ColWidths[4] := 75;
   sgGridCheques.ColWidths[5] := 110;
   sgGridCheques.ColWidths[6] := 175;

   if ListaCheques <> nil then
   begin
      Self.limpaGridCheques();

      //informações para preparar a grid
      nr_total_cheques           := ListaCheques.Count;
      total_linhas               := nr_total_cheques + 1; // +1 por que a primeira linha é fixa
      sgGridCheques.ColCount     := total_colunas;
      sgGridCheques.RowCount     := total_linhas;
      contador := 0;

      for i := ListaCheques.Count - 1 downto 0 do
      begin
         objCheque := (ListaCheques.items[i] as TMBCheque);

         //adiciona o objeto da parcela na linha do grid
         sgGridCheques.Objects[0, contador+1]   := objCheque;

         sgGridCheques.Cols[0][contador+1]      := objCheque.getValorCampo('nr_banco');
         sgGridCheques.Cols[1][contador+1]      := objCheque.getValorCampo('nr_agencia');
         sgGridCheques.Cols[2][contador+1]      := objCheque.getValorCampo('nr_conta');
         sgGridCheques.Cols[3][contador+1]      := objCheque.getValorCampo('nr_cheque');
         sgGridCheques.Cols[4][contador+1]      := substituiCaracter(objCheque.getValorCampo('vl_cheque'),'.',',');
         sgGridCheques.Cols[5][contador+1]      := objCheque.getValorCampo('dt_compensacao');
         sgGridCheques.Cols[6][contador+1]      := objCheque.getValorCampo('nm_titular');

         inc(contador);
      end;
   end;
end;

procedure TfrmMensalidadesBaixar.carregaGridParcelas( objPessoaParcela : TMBPessoa );
var
   i                 : integer;
   ListaParcelas     : TObjectList;
   nr_total_parcelas : integer;
   total_linhas      : integer;
   total_colunas     : integer;
   objParcela        : TMBParcela;
begin

   //se não for passado o parametro de seleção, o sistema vai selecionar a primeira pessoa da lista
   if objPessoaParcela = nil then
   begin
      if ListaPessoas <> nil then
      begin
         objPessoaParcela := (ListaPessoas.items[0] as TMBPessoa);
      end
      else
      begin
         Self.limpaBuffer();
         Self.limpaGridParcelas();
      end;
   end;

   if objPessoaParcela <> nil then
   begin
      ListaParcelas := objPessoaParcela.getListaParcelas();

      if ListaParcelas <> nil then
      begin
         limpaBuffer();
         Self.limpaGridParcelas();

         //informações para preparar a grid
         nr_total_parcelas             := ListaParcelas.Count;
         total_linhas                  := nr_total_parcelas + 1; // +1 por que a primeira linha é fixa
         total_colunas                 := 9; //fixo
         sgGridParcelas.FixedRows      := 1;
         sgGridParcelas.ColCount       := total_colunas;
         sgGridParcelas.Cols[0][0]     := '';
         sgGridParcelas.Cols[1][0]     := 'Parc';
         sgGridParcelas.Cols[2][0]     := 'Vencimento';
         sgGridParcelas.Cols[3][0]     := 'Tipo Tit';
         sgGridParcelas.Cols[4][0]     := 'Vl. Nominal';
         sgGridParcelas.Cols[5][0]     := 'Vl. Desc';
         sgGridParcelas.Cols[6][0]     := 'Vl. Juros';
         sgGridParcelas.Cols[7][0]     := 'Vl. Total';
         sgGridParcelas.Cols[8][0]     := 'Vl. Pago';

         //tamanho das colunas
         sgGridParcelas.ColWidths[0]   := 20;
         sgGridParcelas.ColWidths[1]   := 30;
         sgGridParcelas.ColWidths[2]   := 65;
         sgGridParcelas.ColWidths[3]   := 85;
         sgGridParcelas.ColWidths[4]   := 62;
         sgGridParcelas.ColWidths[5]   := 62;
         sgGridParcelas.ColWidths[6]   := 62;
         sgGridParcelas.ColWidths[7]   := 62;
         sgGridParcelas.ColWidths[8]   := 62;

         sgGridParcelas.RowCount       := total_linhas;

         for i := 0 to ListaParcelas.Count -1 do
         begin
            objParcela := (ListaParcelas.items[i] as TMBParcela);

            //adiciona o objeto da parcela na linha do grid
            sgGridParcelas.Objects[1, i+1]   := objParcela;

            sgGridParcelas.Cols[1][i+1]   := objParcela.getValorCampo('parcela');
            sgGridParcelas.Cols[2][i+1]   := objParcela.getValorCampo('datavencimento');
            sgGridParcelas.Cols[3][i+1]   := objParcela.getValorCampo('ds_tipo_titulo');
            sgGridParcelas.Cols[4][i+1]   := objParcela.getValorCampo('vl_nominal');
            sgGridParcelas.Cols[5][i+1]   := objParcela.getValorCampo('valordesconto');
            sgGridParcelas.Cols[6][i+1]   := objParcela.getValorCampo('valorjuros');
            sgGridParcelas.Cols[7][i+1]   := objParcela.getValorCampo('valortotal');
            sgGridParcelas.Cols[8][i+1]   := objParcela.getValorCampo('valorpago');
         end;

         Self.AdicionarCheckBox();
      end;
   end
   else
   begin
      sgGridParcelas.Cols[0][0]     := '';
      sgGridParcelas.Cols[1][0]     := 'Parc';
      sgGridParcelas.Cols[2][0]     := 'Vencimento';
      sgGridParcelas.Cols[3][0]     := 'Tipo Tit';
      sgGridParcelas.Cols[4][0]     := 'Vl. Nominal';
      sgGridParcelas.Cols[5][0]     := 'Vl. Desc';
      sgGridParcelas.Cols[6][0]     := 'Vl. Juros';
      sgGridParcelas.Cols[7][0]     := 'Vl. Total';
      sgGridParcelas.Cols[8][0]     := 'Vl. Pago';

      //tamanho das colunas
      sgGridParcelas.ColWidths[0]   := 20;
      sgGridParcelas.ColWidths[1]   := 30;
      sgGridParcelas.ColWidths[2]   := 65;
      sgGridParcelas.ColWidths[3]   := 85;
      sgGridParcelas.ColWidths[4]   := 62;
      sgGridParcelas.ColWidths[5]   := 62;
      sgGridParcelas.ColWidths[6]   := 62;
      sgGridParcelas.ColWidths[7]   := 62;
      sgGridParcelas.ColWidths[8]   := 62;
   end;
end;

function TfrmMensalidadesBaixar.carregaMaximoIntervalo(
  codigoAdministradora: Integer): Integer;
const
   SQL_INTERVALO =
      ' SELECT '+
      '     MAX(vl_valor) AS max_intervalo '+
      '  FROM '+
      '     fin_cartao_taxas_credito '+
      '  WHERE '+
      '     cd_admin_cartao = :cd_admin_cartao ';
var
   qyIntervalo: TUMZReadOnlyQuery;  
begin
   Result := 0;

   DM.CriarConsulta(qyIntervalo);

   qyIntervalo.SQL.Text := SQL_INTERVALO;
   qyIntervalo.ParamByName('cd_admin_cartao').AsInteger :=
      codigoAdministradora;
   qyIntervalo.Open;

   if qyIntervalo.FieldByName('max_intervalo').AsString <> '' then
   begin
      Result := qyIntervalo.FieldByName('max_intervalo').AsInteger;
   end;
end;

procedure TfrmMensalidadesBaixar.carregaValoresGridCartao;
var
   valorTotalComTaxa,
   valorTaxa,
   taxaOriginal,
   somaValorComTaxa,
   somaTaxa,
   somaValorSemTaxa: Double;

   i,
   nrParcelas,
   codigoAdministradora: Integer;

   datas: TStringList;
begin
   carregaGridCartao;

   somaValorComTaxa := 0;
   somaTaxa := 0;
   somaValorSemTaxa := 0;

   {Quantidade de parcelas que será dividido}
   nrParcelas := getNumeroParcelas;

   if nrParcelas = 0 then Exit;

   codigoAdministradora := StrToInt(
      TItemCombo(
         cbAdministradoras.Items.Objects[cbAdministradoras.ItemIndex]
      ).getCodigo
   );

   taxaOriginal := getValorTaxa(
      codigoAdministradora,
      rbCredito.Checked
   );
   
   taxaCartaoCobrada := TaxaOriginal;
                      
   {Cálculo - Regra de 3 para tirar o valor que a taxa representa}
   valorTaxa := (txtVlTotal.getValorDouble * taxaOriginal) / 100;
   {Soma do valor total mais valor da taxa}
   valorTotalComTaxa := txtVlTotal.getValorDouble - valorTaxa;

   sgParcelasCartao.RowCount := nrParcelas + 1;

   datas := getDatas(codigoAdministradora, nrParcelas);

   for i := 1 to nrParcelas - 1 do
   begin
      sgParcelasCartao.Cols[0][i] := IntToStr(i);

      sgParcelasCartao.Cols[1][i] := datas.Values[IntToStr(i)];

      somaValorComTaxa := RoundFloat(somaValorComTaxa + RoundFloat(txtVlTotal.getValorDouble / nrParcelas, 2), 2);
      sgParcelasCartao.Cols[2][i] := FloatToStr(RoundFloat(txtVlTotal.getValorDouble / nrParcelas, 2));

      somaTaxa := RoundFloat(somaTaxa + RoundFloat(valorTaxa / nrParcelas, 2), 2);
      sgParcelasCartao.Cols[3][i] := FloatToStr(RoundFloat(valorTaxa / nrParcelas, 2));

      somaValorSemTaxa := RoundFloat(somaValorSemTaxa + RoundFloat(valorTotalComTaxa / nrParcelas, 2), 2);
      sgParcelasCartao.Cols[4][i] := FloatToStr(RoundFloat(valorTotalComTaxa / nrParcelas, 2));
   end;

   if nrParcelas = 1 then i := 1;
   
   sgParcelasCartao.Cols[0][nrParcelas] := IntToStr(i);
   sgParcelasCartao.Cols[1][nrParcelas] := datas.Values[IntToStr(nrParcelas)];
   sgParcelasCartao.Cols[2][nrParcelas] := FloatToStr(RoundFloat(txtVlTotal.getValorDouble - somaValorComTaxa, 2));
   sgParcelasCartao.Cols[3][nrParcelas] := FloatToStr(RoundFloat(valorTaxa - somaTaxa, 2));
   sgParcelasCartao.Cols[4][nrParcelas] := FloatToStr(RoundFloat(valorTotalComTaxa - somaValorSemTaxa, 2));
end;

procedure TfrmMensalidadesBaixar.cbAdministradorasChange(Sender: TObject);
Var
   Cod : Integer;
begin
   rbCredito.Enabled := cbAdministradoras.ItemIndex > -1;
   rbDebito.Enabled  := cbAdministradoras.ItemIndex > -1;
   edTID.Enabled     := cbAdministradoras.ItemIndex > -1;
   rbCredito.Checked := False;
   rbDebito.Checked  := False;

   Cod := StrToInt(
      TItemCombo(
         cbAdministradoras.Items.Objects[cbAdministradoras.ItemIndex]
      ).getCodigo
   );

   udQtdParcelas.Max := carregaMaximoIntervalo(Cod);

   mostraQtdParcelas;

   if (getValorTaxa(Cod, True) = 0) AND (getNumeroDias(Cod, True) = 0 ) then
   begin
      // Não tem dia de vencimento e nem taxa configurada para cartão de crédito. Bloquear
      rbCredito.Enabled := false;
   end;
   if (getValorTaxa(Cod, false) = 0) AND (getNumeroDias(Cod, false) = 0 ) then
   begin
      // Não tem dia de vencimento e nem taxa configurada para cartão de debito. Bloquear
      rbDebito.Enabled := false;
   end;

   if (NOT rbDebito.Enabled) AND (rbCredito.Enabled) then begin
       rbCredito.Checked := true;
       carregaValoresGridCartao();
   end else begin
        if (rbDebito.Enabled) AND (NOT rbCredito.Enabled) then begin
            rbDebito.Checked := true;
            carregaValoresGridCartao();
        end else begin
            carregaGridCartao();
        end;
   end;

end;

procedure TfrmMensalidadesBaixar.AdicionarCheckBox;
var
   aux_count, i   : Integer;
   NovoCheckBox   : TCheckBox;
   objParcela     : TMBParcela;
begin
   limpaBuffer; // é bom não esquecer de limpar   controles não utilizados

   for i := 1 to sgGridParcelas.RowCount - 1 do
   begin
      //recupera o objeto da grid
      objParcela           := (sgGridParcelas.Objects[1,i] as TMBParcela);

      if Self.validaMensalidade( objParcela ) = true then
      begin
         NovoCheckBox         := TCheckBox.Create(tabParcelas);
         NovoCheckBox.Width   := 0;
         NovoCheckBox.Visible := false;
         NovoCheckBox.Caption := '';
         NovoCheckBox.Color   := clWhite;
         NovoCheckBox.Tag     := i-1;
         NovoCheckBox.Parent  := tabParcelas;
         NovoCheckBox.Enabled := True;
         NovoCheckBox.Checked := ( objParcela.getValorCampo('sn_ativo') = '1' );
         NovoCheckBox.OnClick := aoClicar;

         sgGridParcelas.Objects[0,i] := NovoCheckBox;
      end;
   end;

   AlinharCheck; // agora vamos alinhar o check na celular

end;

procedure TfrmMensalidadesBaixar.AlinharCheck;
var
  NovoCheckBox : TCheckBox;
  Rect         : TRect;
  i            : Integer;
  objParcela   : TMBParcela;
begin
   for i := 1 to sgGridParcelas.RowCount - 1 do
   begin
      //recupera o objeto da grid
      objParcela           := (sgGridParcelas.Objects[1,i] as TMBParcela);

      if objParcela <> nil then
      begin

         if Self.validaMensalidade( objParcela ) = true then
         begin

            NovoCheckBox := (sgGridParcelas.Objects[0,i] as TCheckBox);

            if NovoCheckBox <> nil then
            begin
               Rect                  := sgGridParcelas.CellRect(0,i); // aqui descobrimos a posição da celula para utilizarmos no check
               NovoCheckBox.Left     := Rect.Left+7;
               NovoCheckBox.Top      := Rect.Top+30;
               NovoCheckBox.Width    := Rect.Right - Rect.Left - 2;
               NovoCheckBox.Height   := Rect.Bottom - Rect.Top - 2;
               NovoCheckBox.Visible  := True;

               if objParcela.getValorCampo('sn_ativo') = '1' then
               begin
                  NovoCheckBox.Color := $00FFE9D2;
               end
               else
               begin
                  NovoCheckBox.Color := clWhite;
               end;
               
            end;

         end;

      end;

   end;

end;

procedure TfrmMensalidadesBaixar.limpaBuffer;
var
  NovoCheckBox: TCheckBox;
  i: Integer;
begin
   for i := 1 to sgGridParcelas.RowCount - 1 do
      begin
         NovoCheckBox := (sgGridParcelas.Objects[0,i] as TCheckBox);
         if NovoCheckBox <> nil then // o objeto deve existir para poder ser destruído
         begin
            NovoCheckBox.Visible          := false;
            sgGridParcelas.Objects[0,i]   := nil;
            NovoCheckBox.Free;
         end;
      end;
end;
procedure TfrmMensalidadesBaixar.LimpaCamposCheque;
begin
   txtDtCompensacao.Text := DateToStr(IncMonth(StrToDate(txtDtCompensacao.Text), 1));
   txtNrCheque.Text := IntToStr(StrToIntDef(txtNrCheque.Text, 0) + 1);
   txtVlCheque.setValorDouble('0');
end;

procedure TfrmMensalidadesBaixar.chkCartaoClick(Sender: TObject);
begin
   if chkCartao.Checked = true then
   begin
      Self.HabilitaDinheiroCheque( false );

      txtDataBaixaExit(nil);

      if txtCartao.getValorDouble() = 0 then
      begin
         txtCartao.setValorDouble(  FloatToStr( txtVlTotal.getValorDouble() ) );
      end;

      txtCartao.SelectAll();

      if pnCartao.Height = 1 then
      begin
         pnCartao.Height  := 218;
         pnCartao.Enabled := true;
         rbDebito.Enabled := False;
         rbDebito.Checked := False;
         rbCredito.Enabled := False;
         rbCredito.Checked := false;
         mostraQtdParcelas;
      end;

      carregaGridCartao;       
      carregaAdministradoras;

   end
   else
   begin
      Self.HabilitaDinheiroCheque( true );

      txtCartao.setValorDouble('0');
      
      if pnCartao.Height <> 1 then
      begin
         pnCartao.Height  := 1;
         pnCartao.Enabled := false;
         cmbContaCaixa.Enabled := True;
      end;
   end;

   Self.CalcularTroco();
   Self.HabilitaBotaoBaixar();
end;

procedure TfrmMensalidadesBaixar.chkCartaoKeyPress(Sender: TObject;
  var Key: Char);
begin
   if Key = #13 then
   begin
      SelectNext(Sender as TWinControl,true,true);
      Key := #0;
   end;
end;

procedure TfrmMensalidadesBaixar.chkChequeClick(Sender: TObject);
var
   data_baixa : TDate;
begin
   Self.ativaPainelCheque();
   Self.HabilitaBotaoBaixar();
   Self.atualizaValoresTotais();

   Self.SugereValorCheque();
   Self.CalcularTroco();

   recalcula_juros         := false;
   data_baixa              := StrToDate(txtDataBaixa.text);
   data_compensacao        := Self.getDataAtual();

   if data_baixa <> Self.getDataAtual() then
   begin
      data_compensacao     := 0;
   end;

   pergunta_juros_cheques  := false;
   Self.VerificaCalculoJurosCheque();

   //Insere automáticamente o nome do responsável pela mensalidade no campo
   //Títular do cheque.
   ednm_titular.Text := getnm_titulo;
end;

procedure TfrmMensalidadesBaixar.chkChequeKeyPress(Sender: TObject;
  var Key: Char);
begin
   if Key = #13 then
   begin
      SelectNext(Sender as TWinControl,true,true);
      Key := #0;
   end;
end;

procedure TfrmMensalidadesBaixar.chkDinheiroClick(Sender: TObject);
var
   vl_dinheiro : double;
   vl_cheque   : double;
   vl_total    : double;
begin
   vl_dinheiro          := 0;
   vl_total             := txtVlTotal.getValorDouble();
   vl_cheque            := txtCheque.getValorDouble();
   txtDinheiro.Enabled  := chkDinheiro.Checked;

   if chkDinheiro.Checked = true then
   begin
      Self.HabilitaCartao( false );

      if txtDinheiro.getValorDouble() = 0 then
      begin
         if vl_cheque <= vl_total then
         begin
            vl_dinheiro := vl_total - vl_cheque;
         end;

         txtDinheiro.setValorDouble( FloatToStr( vl_dinheiro ));
      end;

      if chkCheque.Checked = false then
      begin
         data_alterada := 0;
         txtDataBaixa.OnExit(nil);
      end;

      txtDinheiro.setfocus();
      txtVlCheque.setValor(0.00);
   end
   else
   begin
      txtDinheiro.setValorDouble('0');

      //desabilita cartao se cheque e dinheiro estiverem desabilitados
      if (chkCheque.Checked = false) and (chkDinheiro.Checked = false) then
      begin
         Self.HabilitaCartao(true);
      end;

      if (chkCheque.Checked = true) then
      begin
         Self.SugereValorCheque();
      end;
   end;

   Self.CalcularTroco();

   Self.HabilitaBotaoBaixar();
end;

procedure TfrmMensalidadesBaixar.chkDinheiroKeyPress(Sender: TObject;
  var Key: Char);
begin
   if Key = #13 then
   begin
      SelectNext(Sender as TWinControl,true,true);
      Key := #0;
   end;
end;

procedure TfrmMensalidadesBaixar.chkTDClick(Sender: TObject);
begin
   if chkTD.Checked then
      pnlTalaoDepos.Height := 84
   else
      pnlTalaoDepos.Height := 1;
end;

procedure TfrmMensalidadesBaixar.cmbContaCaixaChange(Sender: TObject);
begin
   if stContasTDObrigadoria.IndexOf((cmbContaCaixa.Items.Objects[ cmbContaCaixa.itemIndex ] as TItemComboMCaixa).getCodigo) > -1 then
   begin
      chkTD.Checked := True;
   end
   else
   begin
      chkTD.Checked := False;      
   end;
end;

procedure TfrmMensalidadesBaixar.cmbContaCaixaClick(Sender: TObject);
begin
   if (index_caixa_atual > -1) then
   begin
      if (cd_caixa_padrao <> (cmbContaCaixa.Items.Objects[ cmbContaCaixa.itemIndex ] as TItemComboMCaixa).getCodigo())
      and ((cmbContaCaixa.Items.Objects[ index_caixa_atual ] as TItemComboMCaixa).getCodigo() = cd_caixa_padrao)
      then
      begin
         if Mensagem( 'Deseja sair de sua conta padrão?', 'UNIMESTRE', MB_YESNO + MB_ICONQUESTION ) = mrNo then
         begin
            cmbContaCaixa.ItemIndex := index_caixa_atual;
         end;
      end;
   end;

   if tabParcelas.Tabs.Strings[ tabParcelas.TabIndex ] <> ds_observacao then
   begin
      sgGridParcelas.SetFocus;
   end;
end;

procedure TfrmMensalidadesBaixar.cmbContaCaixaKeyPress(Sender: TObject;
  var Key: Char);
begin
   if Key = #13 then
   begin
      SelectNext(Sender as TWinControl,true,true);
      Key := #0;
   end;
end;

procedure TfrmMensalidadesBaixar.cmbContaCaixaMouseEnter(Sender: TObject);
begin
   index_caixa_atual := cmbContaCaixa.ItemIndex;
end;

function TfrmMensalidadesBaixar.confereMensalidades: Boolean;
var
   bResultado           : Boolean;
   iPessoa              : integer;
   iParcela             : integer;
   ListaParcelas        : TObjectList;
   objParcela           : TMBParcela;
   objPessoa            : TMBPessoa;
   dt_pagamento         : TDateTime;
   dt_atual             : TDateTime;
   cd_caixa             : string;
   cd_depto             : string;
   objMensalidadeBaixa  : TMBMensalidadeBaixa;
begin
   bBaixarCaixaAberto   := false;
   bResultado           := true;

   Self.limparListaBaixaMensalidades();
   Self.limparListaChequesMensalidades();

   //recupera o código da conta se tiver sido selecionada
   if cmbContaCaixa.ItemIndex > -1 then
   begin
      cd_caixa := (cmbContaCaixa.Items.Objects[ cmbContaCaixa.itemIndex ] as TItemComboMCaixa).getCodigo();
   end
   else
   begin
      Mensagem('Selecione uma Conta Caixa', 'Atenção', MB_OK + MB_ICONWARNING);
      bResultado        := false;
      Result            := bResultado;
      ativaBotaoBaixar( true );
      Exit;
   end;

   //recupera a data de pagamento digitada
   if trim(txtDataBaixa.Text) <> '' then
   begin
      dt_pagamento := StrToDate( txtDataBaixa.Text );
   end
   else
   begin
      //se nao foi digitada força como sendo a data de hoje.
      txtDataBaixa.Text := Self.getDataHoje();
      dt_pagamento      := StrToDate( txtDataBaixa.Text );
   end;

   //Verificar Bloqueio da Data
   if DM.EstaBloqueado(dt_pagamento, true) then
   begin
      bResultado  := false;
      Result      := bResultado;
      Exit;
   end;

   // Vefificar se está baixando com data SUPERIOR a hoje;
   dt_atual := StrToDate( Self.getDataHoje );

   if dt_pagamento > dt_atual then
   begin
      Mensagem(Concat('Você está tentando baixar uma mensalidade com data ',
      'superior a hoje. Este procedimento está bloqueado pois pode causar ',
      'inconsistência nos saldos de caixa.'), 'Atenção', MB_OK + MB_ICONWARNING);
      bResultado  := false;
      Result      := bResultado;

      txtDataBaixa.SetFocus;
      txtDataBaixa.SelectAll;
      ativaBotaoBaixar( true );
      Exit;
   end;

   //verifica se existe uma lista de pessoas criada
   if ListaPessoas <> nil then
   begin

      //percorre a lista de pesso
      for iPessoa := 0 to ListaPessoas.Count - 1 do
      begin
         objPessoa := (ListaPessoas.items[iPessoa] as TMBPessoa);

         //recupera a lista de parcela da pessoa corrente
         ListaParcelas := objPessoa.getListaParcelas();

         //se  alista de parcelas existir continuar
         if ListaParcelas <> nil then
         begin

            for iParcela := 0 to ListaParcelas.Count - 1 do
            begin
               objParcela := (ListaParcelas.items[iParcela] as TMBParcela);

               //se a parcela estiver com sn_ativo = 1 é uma parcela selecionada
               //pelo usuários
               if objParcela.getValorCampo('sn_ativo') = '1'  then
               begin
                  cd_depto    := objParcela.getValorCampo('depto');

                  //validando o caixa selecionado...
                  bResultado  := Self.validaCaixa( cd_caixa, cd_depto, objParcela );

                  if bResultado = true then
                  begin
                     //validando a mensalidade através da situação
                     bResultado  := Self.validaMensalidade( objParcela );

                     //se o resultado da validação for true então adiciona
                     //a mensalidade na lista de baixa.
                     if bResultado = true then
                     begin

                        if ListaMensalidadesBaixa = nil then
                        begin
                           ListaMensalidadesBaixa := TObjectList.Create();
                        end;

                        objMensalidadeBaixa := TMBMensalidadeBaixa.Create();

                        objMensalidadeBaixa.setValorCampo('cd_mensalidade',   objParcela.getValorCampo('cd_mensalidade')   );
                        objMensalidadeBaixa.setValorCampo('valorjuros_fixo',  objParcela.getValorCampo('valorjuros_fixo')  );
                        objMensalidadeBaixa.setValorCampo('valorjuros',       objParcela.getValorCampo('valorjuros')       );
                        objMensalidadeBaixa.setValorCampo('datapagamento',    FormatDateTime('dd/mm/yyyy', dt_pagamento)   );
                        objMensalidadeBaixa.setValorCampo('valordesconto',    objParcela.getValorCampo('valordesconto')    );
                        objMensalidadeBaixa.setValorCampo('valorpago',        objParcela.getValorCampo('valorpago')        );
                        objMensalidadeBaixa.setValorCampo('parcela',          objParcela.getValorCampo('parcela')          );
                        objMensalidadeBaixa.setValorCampo('datavencimento',   objParcela.getValorCampo('datavencimento')   );
                        objMensalidadeBaixa.setValorCampo('alterou_juros',    objParcela.getValorCampo('alterou_juros')    );
                        objMensalidadeBaixa.setValorCampo('vl_pago_cheque',   '0'   );
                        objMensalidadeBaixa.setValorCampo('vl_pago_dinheiro', '0'   );
                        objMensalidadeBaixa.setValorCampo('ds_deposito', edtTalaoDepos.Text);

                        ListaMensalidadesBaixa.Add( objMensalidadeBaixa );
                     end;

                  end
                  else
                  begin
                      ativaBotaoBaixar( true );
                  end;


               end;
               
            end;

         end;

      end;

   end
   else
   begin
      Mensagem('Não foi selecionado uma pessoa ou a pessoa selecionada não possui mensalidades para baixar.', 'Atenção', MB_OK + MB_ICONWARNING );
      bResultado := false;
      ativaBotaoBaixar( true );
   end;

   Result := bResultado
end;

procedure TfrmMensalidadesBaixar.criaPessoa(cd_pessoa, nm_pessoa, ds_turma,
  nr_anosemestre: string);
begin
   //se a lista de pessoas não existir cria uma lista
   if ListaPessoas = nil then
   begin
      ListaPessoas := TObjectList.Create();
   end;

   if  (cd_pessoa <> '') and ( trim(nm_pessoa) <> '' )  then
   begin
      objPessoa := TMBPessoa.Create();

      objPessoa.setValorCampo( 'cd_pessoa',        cd_pessoa );
      objPessoa.setValorCampo( 'nm_pessoa',        nm_pessoa );
      objPessoa.setValorCampo( 'ds_turma',         ds_turma );
      objPessoa.setValorCampo( 'nr_anosemestre',   nr_anosemestre );

      ListaPessoas.Add( objPessoa );

      //busca a mensalidade referente a pessoa selecionada
      Self.getMensalidade( objPessoa );

      //carrega grid das parcelas
      Self.carregaGridParcelas( objPessoa );

      objPessoa := nil;
   end;
end;

procedure TfrmMensalidadesBaixar.edQtdParcelasChange(Sender: TObject);
begin
   if edQtdParcelas.Text = '' then
   begin
      Exit;
   end;

   if StrToInt(edQtdParcelas.Text) > udQtdParcelas.Max then
   begin
      edQtdParcelas.Text := IntToStr(udQtdParcelas.Max);
   end;
end;

procedure TfrmMensalidadesBaixar.edQtdParcelasKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
   if (Key = VK_RETURN) and (edQtdParcelas.Text <> '') then
   begin
      carregaValoresGridCartao;
      btnBaixar.SetFocus;
   end;
end;

procedure TfrmMensalidadesBaixar.edQtdParcelasKeyPress(Sender: TObject;
  var Key: Char);
begin
   if not(key in ['0'..'9']) and not(Key = #8) then
   begin
      Key := #0;
   end;
end;

procedure TfrmMensalidadesBaixar.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
   if AutoRelease then
   begin
      Self.LiberaObjetos();
      Action := caFree;
   end;
end;

procedure TfrmMensalidadesBaixar.FormCreate(Sender: TObject);
begin
   AutoRelease := True;
   baixaRetorno := False;
   habilitarcartoes();
end;

procedure TfrmMensalidadesBaixar.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
   case key of
      VK_F2 : begin
         tabParcelas.SetFocus();
      end;
      VK_F3 : begin
         if cmbContaCaixa.Enabled then cmbContaCaixa.SetFocus();
      end;
      VK_F4 :begin
         chkCheque.Checked  := not chkCheque.Checked;
      end;
      VK_F5 :begin
         chkDinheiro.Checked := not chkDinheiro.Checked;

         if chkDinheiro.Checked then
         begin
            txtDinheiro.SelectAll();
         end;
      end;
      VK_F6 : begin
         if chkCheque.Checked then sgGridCheques.SetFocus();
      end;
      VK_F9 : begin
         if btnBaixar.Tag = 0 then btnBaixarClick(Sender);
      end;
      VK_F10: begin
         SetGridFocus(sgGridParcelas, 1, 8);
      end;
      VK_F12 : begin
         btnCancelarClick(Sender);
      end;
   end;
end;

procedure TfrmMensalidadesBaixar.FormShow(Sender: TObject);
const
   SQL_FILTRA_CONTAS_OBRIGATORIA =
      ' SELECT ' +
      ' 	cd_caixa ' +
      ' FROM ' +
      ' 	fin_cadastro_contas ' +
      ' WHERE ' +
      ' 	cd_caixa IN (%s) ';
var
   dtDataServidor : TDateTime;
   bPermissaoConta, bPermissaoData : Boolean;
   qryCaixasObrigatorios: TUMZReadOnlyQuery;
   aux_count: Integer;
   NovoCheckBox : TCheckBox;
   Rect         : TRect;
   i            : Integer;
   objParcela   : TMBParcela;

begin

   DM.CriarConsulta(qryCaixasObrigatorios);

   stContasTDObrigadoria := TStringList.Create;

   try
      if DM.variavel_parametro('financeiro_talao_caixas_obrigatorios') <> '' then
      begin
         qryCaixasObrigatorios.SQL.Text := Format(SQL_FILTRA_CONTAS_OBRIGATORIA, [DM.variavel_parametro('financeiro_talao_caixas_obrigatorios')]);
         qryCaixasObrigatorios.Open;

         while not qryCaixasObrigatorios.Eof do
         begin
            stContasTDObrigadoria.Add(qryCaixasObrigatorios.FieldByName('cd_caixa').AsString);
            qryCaixasObrigatorios.Next;
         end;
      end;
   except on E: Exception do
   end;
   
   //seta a data de hoje
   dtDataServidor := DM.DataAtual();
   Self.setDataHoje( Trunc(dtDataServidor) );

   data_alterada           := Self.getDataAtual();
   txtDataBaixa.Text       := Self.getDataHoje();
   txtDtCompensacao.Text   := Self.getDataHoje();

   //verifica se o usuário tem permissão para alterar a data de baixa
   if not DM.UsuarioLogado.TemPermissao( 2056, npAcesso, False ) then
   begin
      txtDataBaixa.Enabled := false;
   end
   else
   begin
      txtDataBaixa.Enabled := true;
   end;

   bPermissaoData := txtDataBaixa.Enabled;

   //lista de caixas
   Self.getListaContasCaixa(cd_caixa_selecionado);

   //permissão para alterar o caixa
   if not DM.UsuarioLogado.TemPermissao( 2042, npAcesso, False ) then
   begin
      cmbContaCaixa.Enabled := false;
   end;

   bPermissaoConta :=cmbContaCaixa.Enabled;

   //carrega as abas
   Self.carregaAbas();

   pnCheques.Height := 1;
   pnlTalaoDepos.Height := 1;
   pnCartao.Height := 1;

   if (trim(Self.getPessoaSelecionada()) <> '') and
      (trim(Self.getNmPessoaSelecionada()) <> '') then
   begin
      Self.criaPessoa( Self.getPessoaSelecionada, Self.getNmPessoaSelecionada,
      Self.getTurmaSelecionada , Self.getNrAnoSemestreSelecionado );

      Self.carregaAbas();

      Self.atualizaValoresTotais();
   end;

   // Posicionar o cursor inicialmente na Conta ou Data da Baixa, ou Dinheiro

   if bPermissaoConta then begin
      cmbContaCaixa.SetFocus();
   end else if bPermissaoData then begin
      txtDataBaixa.SetFocus();
   end else begin
       chkCheque.SetFocus();
   end;

   recalcula_juros         := false;
   data_compensacao        := Self.getDataAtual();
   pergunta_juros_cheques  := false;

   edObservacao.Text := '';

   sgGridParcelas.SetFocus;

   for i := 1 to sgGridParcelas.RowCount - 1 do
   begin
      objParcela := (sgGridParcelas.Objects[1,i] as TMBParcela);

      NovoCheckBox := (sgGridParcelas.Objects[0,i] as TCheckBox);

      if NovoCheckBox <> nil then
      begin

         aux_count := 0;
         
         while (aux_count <> Length(arrParcelasSelecionadas)) do
         begin

            if (objParcela.getValorCampo('cd_mensalidade') = IntToStr(arrParcelasSelecionadas[aux_count])) then
            begin
               NovoCheckBox.OnClick(NovoCheckBox);
            end;

            aux_count := aux_count + 1;
         end;
      end;
   end;

   if baixaRetorno then
   begin
      if not(cd_pessoa_selecionada <> '') then
      begin
         tabParcelas.TabIndex := 1;
         tabParcelasChange(nil);

         if tabParcelas.Tabs.Count = 2 then
         begin
            ModalResult := mrCancel;
            PostMessage(Self.Handle, WM_CLOSE, 0, 0);
            Exit;
         end;
      end;

      txtDataBaixa.Text := FormatDateTime('dd/mm/yyyy', data_baixa_retorno);
      txtDataBaixa.ReadOnly := True;

      chkCartao.Enabled := False;
      chkCheque.Enabled := False;

      chkDinheiro.Checked := True;
      chkDinheiro.Enabled := False;

      txtDinheiro.setValor(valorRetorno);
      txtDinheiro.ReadOnly := True;

      btnBaixar.Tag := 1;
      btnBaixar.Font.Color := clGrayText;

      UMAjuda1.Visible := True;

      lbTroco.Caption := 'Diferença:';
      txtTroco.setValor(txtDinheiro.getValor - txtVlTotal.getValor);
   end;
end;

function TfrmMensalidadesBaixar.getCaixaDepto( cd_depto : integer ): string;
var
   cd_caixa : string;
   qyDepto  : TUMZQuery;
begin
   DM.CriarConsulta( qyDepto );

   qyDepto.Close();
   qyDepto.SQL.Clear();
   qyDepto.SQL.Add(' SELECT d.cd_caixa ');
   qyDepto.SQL.Add(' FROM departamentos d ');
   qyDepto.SQL.Add(' WHERE d.codigo = :depto ');
   qyDepto.ParamByName('depto').AsInteger := cd_depto;
   qyDepto.Open;

   cd_caixa := qyDepto.FieldByName('cd_caixa').AsString;

   qyDepto.Close();
   FreeAndNil( qyDepto );

   Result := cd_caixa;
end;

function TfrmMensalidadesBaixar.getCdChequeMaiorValor: string;
var
   i           : integer;
   valor       : double;
   valor_maior : double;
   objCheque   : TMBCheque;
   cd_cheque, S: string;
   FmtSett: TFormatSettings;
begin
   GetLocaleFormatSettings(LOCALE_SYSTEM_DEFAULT, FmtSett);
   cd_cheque   := '';
   valor_maior := 0;

   if ListaCheques <> nil then
   begin
      for i := 0 to ListaCheques.Count - 1 do
      begin
         objCheque := (ListaCheques.items[i] as TMBCheque);

         S := objCheque.getValorCampo('vl_cheque');
         S := StringReplace(S, '.', FmtSett.DecimalSeparator, []);

         if TryStrToFloat(S, valor) then
         begin
            if RoundFloat(valor, 2) > RoundFloat(valor_maior, 2) then
            begin
               valor_maior := RoundFloat( valor, 2 );
               cd_cheque :=  objCheque.getValorCampo('cd_cheque');
            end;
         end;
      end;
   end;

   Result := cd_cheque;
end;

function TfrmMensalidadesBaixar.getDataAtual: TDateTime;
begin
   Result := Self.data_hoje;
end;

function TfrmMensalidadesBaixar.getDataCompensacaoCheque: TDate;
var
   objCheques  : TMBCheque;
   ds_data     : string;
   dt_date     : TDate;
begin
   dt_date     := 0;

   if chkCheque.Checked = true then
   begin

      if ListaCheques <> nil then
      begin
         //recupera o objeto do primeiro cheque da lista de cheques
         objCheques  := (ListaCheques.items[0] as TMBCheque);

         //recupera a data de compensação do primeiro cheque
         ds_data     := objCheques.getValorCampo('dt_compensacao');

         //valida a data de compensação digitada para o cheque
         if ( Self.validaData(ds_data) ) then
         begin
            dt_date := StrToDate( ds_data );
         end
         else
         begin
            Mensagem('Digite uma data de compensação válida para o primeiro cheque.',
            'Atenção', MB_OK);
            Result := 0;
            exit;
         end;

      end
      else
      begin
         //recupera a data do campo "data de compensação" do cheque
         ds_data := txtDtCompensacao.Text;
         
         if ( Self.validaData(ds_data) ) then
         begin
            dt_date := StrToDate( ds_data );
         end
         else
         begin
            Mensagem('Digite uma data de compensação válida.',
            'Atenção', MB_OK);
            Result := 0;
            exit;
         end;

      end;

   end;

   Result := dt_date;
   
end;

function TfrmMensalidadesBaixar.getDataHoje: string;
begin
   Result := DateToStr(Self.data_hoje);
end;

function TfrmMensalidadesBaixar.getDatas(codAdministradora,
  nrParcelas: Integer): TStringList;
const
   SQL_BUSCA_DATAS =
      '   SELECT '+
      '      DATE_FORMAT(ADDDATE(:data:, INTERVAL %s day), %s) AS data1, '+
      '      DATE_FORMAT(ADDDATE(:data:, INTERVAL %s day), %s) AS dataFormatada1, '+
      '      DAYOFWEEK(ADDDATE(:data:, INTERVAL %s day) ) AS diaSemana1 '+
      '   FROM '+
      '      fin_cadastro_admin_cartao '+
      '   WHERE '+
      '      cd_admin_cartao = :cd_admin_cartao';

var
   i: Integer;
   
   qyBuscaDatas,
   qyBuscaDia: TUMZReadOnlyQuery;

   data: TDateTime;

   separador,
   field: String;
begin
   DM.CriarConsulta(qyBuscaDia);
   DM.CriarConsulta(qyBuscaDatas);

   data := StrToDateTime(txtDataBaixa.Text);

   field := 'nr_dia_vencimento_debito';

   if rbCredito.Checked then field := 'nr_dia_vencimento_credito';

   qyBuscaDia.SQL.Text :=
      Format(
         StringReplace(SQL_BUSCA_DATAS, ':data:', QuotedStr(FormatDateTime('yyyy-mm-dd', data) + ' 00:00:00'), [rfReplaceAll, rfIgnoreCase]),
         [
            field,
            QuotedStr('%Y-%m-%d'),
            field,
            QuotedStr('%d/%m/%Y'),
            field
         ]
      );
      
   qyBuscaDia.ParamByName('cd_admin_cartao').AsInteger := codAdministradora;
   qyBuscaDia.Open;

   field :=
      QuotedStr(qyBuscaDia.FieldByName('data1').AsString) +
      ' AS data1, ' +
      QuotedStr(qyBuscaDia.FieldByName('dataFormatada1').AsString) +
      ' AS dataFormatada1, ' +
      qyBuscaDia.FieldByName('diaSemana1').AsString +
      ' AS diaSemana1 ';
      
   separador := '';

   for I := 2 to nrParcelas do
   begin
      separador := ', ';

      field :=
         field +
         separador +
         Format(
            ' DAYOFWEEK( ADDDATE(%s, INTERVAL %d MONTH) ) AS diaSemana%d, ',
            [QuotedStr(qyBuscaDia.FieldByName('data1').AsString), i-1, i]
         );

      field :=
         field +
         Format(
            ' ADDDATE(%s, INTERVAL %d MONTH) AS data%d, ',
            [QuotedStr(qyBuscaDia.FieldByName('data1').AsString), i-1, i]
         );
         
      field :=
         field +
         Format(
            ' DATE_FORMAT(ADDDATE(%s, INTERVAL %d MONTH), %s) AS dataFormatada%d ',
            [QuotedStr(qyBuscaDia.FieldByName('data1').AsString), i-1, QuotedStr('%d/%m/%Y'), i]
         );   
   end;

   qyBuscaDatas.SQL.Text := 'SELECT ' + field;
   qyBuscaDatas.Open;

   Result := TStringList.Create;

   for I := 1 to nrParcelas do
   begin
      if qyBuscaDatas.FieldByName('diaSemana' + IntToStr(I)).AsInteger in [1, 7] then
      begin
         Result.Values[IntToStr(i)] :=
            getProximoDiaUtil(
               qyBuscaDatas.FieldByName('data' + IntToStr(I)).AsString,
               qyBuscaDatas.FieldByName('diaSemana' + IntToStr(I)).AsInteger
            );

         continue;
      end;

      Result.Values[IntToStr(i)] := qyBuscaDatas.FieldByName('dataFormatada' + IntToStr(I)).AsString;
   end;
end;

procedure TfrmMensalidadesBaixar.getListaContasCaixa(cd_caixa_selecionado: Integer = 0);
var
   qyContas    : TUMZQuery;
   objItem     : TItemComboMCaixa;
   cd_caixa    : string;
   ds_caixa    : string;
   ds_usuario  : string;
   sn_padrao   : string;
   iPosicao    : integer;
   Movimento   : TMovimento;
   tp_Conta    : word;
   cd_Abertura,
   pos_caixa_selecionado : Integer;
begin
   cd_caixa             := '';
   ds_caixa             := '';
   qyContas             := nil;
   ds_usuario           := IntToStr(DM.iCdPessoaLogado);
   iPosicao             := -1;
   nr_pos_caixa_padrao  := -1;

   DM.CriarConsulta( qyContas );
   qyContas.Close();
   qyContas.SQL.Clear;
   qyContas.SQL.Add('SELECT                                                ');
   qyContas.SQL.Add(' cc.cd_coligada, cc.cd_caixa, cc.ds_caixa, cc.tp_conta, u.sn_padrao   ');
   qyContas.SQL.Add('FROM                                                  ');
   qyContas.SQL.Add(' fin_cadastro_contas cc                               ');
   qyContas.SQL.Add(' INNER JOIN fin_contas_usuarios u ON (cc.cd_caixa = u.cd_caixa ) AND (cc.CD_COLIGADA = u.CD_COLIGADA) ');
   qyContas.SQL.Add(' INNER JOIN coligadas as co ON (co.cd_coligada = cc.cd_coligada ) ');   
   qyContas.SQL.Add('WHERE                                          ');
   qyContas.SQL.Add(' cc.sn_ativa = ''S''                           ');
   qyContas.SQL.Add(Format( ' AND ( cc.cd_coligada IN (%s) OR cc.sn_todas_coligadas = 1) ', [DM.UsuarioLogado.GetColigadasFilhaSelecionada()] ));
   qyContas.SQL.Add(' AND u.cd_usuario = ' + ds_usuario);
   qyContas.SQL.Add(' AND co.cd_coligada_matriz = ' + IntToStr(DM.UsuarioLogado.GetColigadaLogada.Codigo) );   
   qyContas.SQL.Add(' ORDER BY cc.ds_caixa                          ');
   qyContas.Open();

   Movimento := TMovimento.create;

   while not qyContas.Eof do
   begin
      cd_caixa    := qyContas.FieldByName('cd_caixa').AsString;
      ds_caixa    := qyContas.FieldByName('ds_caixa').AsString;
      sn_padrao   := qyContas.FieldByName('sn_padrao').AsString;

      { Somente inserir as contas que poderão ser utilizadas para a Baixa }
      Movimento.Coligada := qyContas.FieldByNAme('cd_coligada').AsInteger;

      if Movimento.VerificaContaAtiva(
            qyContas.FieldByNAme('cd_caixa').AsInteger,
            tp_Conta,
            cd_Abertura,
            qyContas.FieldByNAme('cd_coligada').AsInteger
      ) then
      begin
         if (tp_Conta <> 3) OR (cd_Abertura > 0) then
         begin
            objItem := TItemComboMCaixa.Create(
               cd_caixa,
               ds_caixa,
               sn_padrao,
               qyContas.FieldByName('cd_coligada').AsInteger
            );

            cmbContaCaixa.Items.AddObject( objItem.getDescricao, objItem );
            iPosicao := iPosicao + 1;

            if cd_caixa = IntToStr(cd_caixa_selecionado) then
            begin
               pos_caixa_selecionado := iPosicao;
            end;

            if sn_padrao = '1' then
            begin
               cd_caixa_padrao      := cd_caixa;
               nr_pos_caixa_padrao  := iPosicao;
            end;
         end;
      end;

      qyContas.Next;
   end;

   Movimento.Free;

   FreeAndNil( qyContas );

   //percorre a combo e seleciona a conta caixa padrão
   cmbContaCaixa.ItemIndex := nr_pos_caixa_padrao;

   // Se é para vir com caixa selecionado ignora o padrão.
   if cd_caixa_selecionado <> 0 then
   begin
      cmbContaCaixa.ItemIndex := pos_caixa_selecionado;
   end;
end;

procedure TfrmMensalidadesBaixar.getMensalidade( objPessoa: TMBPessoa );
var
   qyMensalidades : TUMZQuery;
   cd_pessoa      : string;
   ds_turma       : string;
   nr_anosemestre : string;
begin

   cd_pessoa      := objPessoa.getValorCampo('cd_pessoa');
   ds_turma       := objPessoa.getValorCampo('ds_turma');
   nr_anosemestre := objPessoa.getValorCampo('nr_anosemestre');

   FreeAndNil( qyMensalidades );
   DM.CriarConsulta( qyMensalidades );

   qyMensalidades.Close();
   qyMensalidades.SQL.Clear();
   qyMensalidades.SQL.Text :=
      'SELECT me.cd_mensalidade, me.codigoaluno, me.datavencimento, me.parcela, me.situacao, me.depto, COALESCE(me.valorjuros,0) as valorjuros, me.turma, me.anosemestre, '+
      '  (me.valorbruto + COALESCE(valorextra, 0) - COALESCE(descontoextra, 0)) as vl_nominal, '+
      '  GET_DESCONTOS(me.cd_mensalidade,  :data_hoje ) as desconto_calc,                            '+
      '  (COALESCE(valorjuros, 0) + COALESCE(GET_ACRESCIMOS(me.cd_mensalidade, :data_hoje ),0 )) as juros_calc,   '+
      '  (me.valorbruto + COALESCE(valorextra, 0) - COALESCE(descontoextra, 0)) - GET_DESCONTOS(me.cd_mensalidade,  :data_hoje ) + (COALESCE(valorjuros, 0) + GET_ACRESCIMOS(me.cd_mensalidade, :data_hoje )) as valortotal, ' +
      '  tt.ds_tipo_titulo                                                                     '+
      'FROM mensalidades as me                                                                 '+
      ' LEFT JOIN fin_tipos_titulo as tt ON (me.cd_tipo_titulo = tt.cd_tipo_titulo AND me.cd_coligada = tt.cd_coligada) '+
      'WHERE '+
      ' me.situacao IN ( 2, 10 ) AND ' +
      ' me.codigoaluno = :codigo ';

      //ordenação
      qyMensalidades.SQL.Add(' ORDER BY me.datavencimento, me.parcela ');

      qyMensalidades.ParamByName('codigo').AsString         := CONCAT('',   cd_pessoa,     '');
      qyMensalidades.ParamByName('data_hoje').AsString      := CONCAT('',   FormatDateTime('yyyy-mm-dd', StrToDate( Self.getDataHoje() )),'');

      qyMensalidades.Open();

      objPessoa.adicionaParcela( qyMensalidades, Self.getMensalidadeSelecionada() );
end;

function TfrmMensalidadesBaixar.getMensalidadeSelecionada: string;
begin
   Result := Self.cd_mensalidade_selecionada;
end;

function TfrmMensalidadesBaixar.getNmPessoaSelecionada: string;
begin
   Result := Self.nm_pessoa_selecionada;
end;

function TfrmMensalidadesBaixar.getnm_titulo: string;
begin
   Result := Self.nm_titular;
end;

function TfrmMensalidadesBaixar.getNrAnoSemestreSelecionado: string;
begin
   Result := Self.ds_anosemestre_selecionado;
end;

function TfrmMensalidadesBaixar.getNumeroDias(codAdministradora: Integer;
  credito: Boolean): Currency;
const

   SQL_TAXA =
      ' SELECT '+
      '     nr_dia_vencimento_credito, nr_dia_vencimento_debito '+
      '  FROM '+
      '     fin_cadastro_admin_cartao '+
      '  WHERE '+
      '     cd_admin_cartao = :cd_admin_cartao ';
var
   qyTaxa: TUMZReadOnlyQuery;  
begin
   DM.CriarConsulta(qyTaxa);

   qyTaxa.SQL.Text := SQL_TAXA;
   qyTaxa.ParamByName('cd_admin_cartao').AsInteger :=
         codAdministradora;
   qyTaxa.Open;
                  
   if credito then
   begin
      Result := qyTaxa.FieldByName('nr_dia_vencimento_credito').AsInteger;
   end else begin
      Result := qyTaxa.FieldByName('nr_dia_vencimento_debito').AsInteger;
   end;

   FreeAndNil(qyTaxa);

end;

function TfrmMensalidadesBaixar.getNumeroParcelas: Integer;
begin
   Result := 1;

   if rbCredito.Checked then
   begin
      Result := StrToInt(edQtdParcelas.text);
   end;
end;

function TfrmMensalidadesBaixar.getPessoaSelecionada: string;
begin
   Result := Self.cd_pessoa_selecionada;
end;

function TfrmMensalidadesBaixar.getProximoDiaUtil(data: String;
  diaSemana: Integer): String;
const
   SQL_PROXIMO_DIA_UTIL =
      'SELECT DATE_FORMAT(DATE_ADD(%s,INTERVAL %d DAY), %s) AS dataCorrigida ';
var
   qyProximoDiaUtil: TUMZReadOnlyQuery;
   nrDiasAdd: Integer;
begin
   nrDiasAdd := 1;

   if diaSemana = 7 then
   begin
      nrDiasAdd := 2;
   end;

   DM.CriarConsulta(qyProximoDiaUtil);
   qyProximoDiaUtil.SQL.Text := Format(SQL_PROXIMO_DIA_UTIL, [QuotedStr(data), nrDiasAdd, QuotedStr('%d/%m/%Y')]);
   qyProximoDiaUtil.Open;

   Result := qyProximoDiaUtil.FieldByName('dataCorrigida').AsString;
end;

function TfrmMensalidadesBaixar.getTurmaSelecionada: string;
begin
   Result := ds_turma_selecionada;
end;

function TfrmMensalidadesBaixar.getValorPago( objParcela : TMBParcela ): double;
var
   vl_bruto          : double;
   vl_juros          : double;
   vl_desconto       : double;
   vl_pago           : double;
begin

   try
      vl_bruto          := StrToFloat( objParcela.getValorCampo('vl_nominal')    );
   except
      vl_bruto          := 0;
   end;

   try
      vl_juros          := StrToFloat( objParcela.getValorCampo('valorjuros')    );
   except
      vl_juros          := 0;
   end;

   try
      vl_desconto       := StrToFloat( objParcela.getValorCampo('valordesconto') );
   except
      vl_desconto       := 0;
   end;

   vl_pago :=  RoundFloat( vl_bruto,         2 ) -
               RoundFloat( vl_desconto,      2 ) +
               RoundFloat( vl_juros,         2 );

   Result := RoundFloat( vl_pago, 2 );

end;

function TfrmMensalidadesBaixar.getValorTaxa(codAdministradora: Integer;
  credito: Boolean): Currency;
const
   SQL_TAXA_CREDITO =
      ' SELECT '+
      '     vl_taxa '+
      '  FROM '+
      '     fin_cartao_taxas_credito '+
      '  WHERE '+
      '     cd_admin_cartao = :cd_admin_cartao '+
      '     AND vl_valor >= :nr_parcelas '+
      '  ORDER BY '+
      '     vl_valor ASC '+
      '  LIMIT 1 ';
      
   SQL_TAXA_DEBITO =
      ' SELECT '+
      '     nr_taxa_debito '+
      '  FROM '+
      '     fin_cadastro_admin_cartao '+
      '  WHERE '+
      '     cd_admin_cartao = :cd_admin_cartao ';
var
   qyTaxa: TUMZReadOnlyQuery;  
begin
   DM.CriarConsulta(qyTaxa);
                  
   if credito then
   begin
      qyTaxa.SQL.Text := SQL_TAXA_CREDITO;
      
      qyTaxa.ParamByName('cd_admin_cartao').AsInteger :=
         codAdministradora;
      qyTaxa.ParamByName('nr_parcelas').AsInteger :=
         getNumeroParcelas; 

      qyTaxa.Open;


      Result := qyTaxa.FieldByName('vl_taxa').AsCurrency;
      Exit;
      FreeAndNil(qyTaxa);
   end;

   qyTaxa.SQL.Text := SQL_TAXA_DEBITO;
   qyTaxa.ParamByName('cd_admin_cartao').AsInteger := codAdministradora;
   qyTaxa.Open;

   Result := qyTaxa.FieldByName('nr_taxa_debito').AsCurrency;
   FreeAndNil(qyTaxa);
end;

function TfrmMensalidadesBaixar.getValorTotalCheques: double;
var
   objCheques  : TMBCheque;
   vl_cheque   : Double;
   vl_campo    : string;
   somaTotal   : Double;
   i           : integer;
begin
   vl_campo    := '';
   somaTotal   := 0;

   if ListaCheques <> nil then
   begin
      for i := 0 to ListaCheques.Count - 1 do
      begin
         objCheques  := (ListaCheques.items[i] as TMBCheque);
         vl_campo    :=  substituiCaracter(objCheques.getValorCampo('vl_cheque'), '.', ',');

         if trim(vl_campo) <> '' then
         begin
            vl_cheque   := StrToFloat( vl_campo );
         end
         else
         begin
            vl_cheque := 0;
         end;

         somaTotal   := somaTotal + vl_cheque;
      end;

   end;

   Result := somaTotal;
end;

function TfrmMensalidadesBaixar.getValorTotalParcelas: double;
var
   iPessoas       : integer;
   iParcelas      : integer;
   ListaParcelas  : TObjectList;
   objParcela     : TMBParcela;
   vl_parcela     : Double;
   somaTotal      : Double;
begin
   objPessoa := nil;
   somaTotal := 0;

   if ListaPessoas <> nil then
   begin
      for iPessoas := 0 to ListaPessoas.Count - 1 do
      begin
         objPessoa      := (ListaPessoas.items[iPessoas] as TMBPessoa);
         ListaParcelas  := objPessoa.getListaParcelas();

         for iParcelas  := 0 to ListaParcelas.Count - 1 do
         begin
            objParcela  := (ListaParcelas.items[iParcelas] as TMBParcela) ;

            if trim(objParcela.getValorCampo('sn_ativo')) = '1' then
            begin
               vl_parcela  := StrToFloat( objParcela.getValorCampo('valorpago') );
               somaTotal   := somaTotal + vl_parcela;
            end;
         end;

         objPessoa := nil;
      end;
   end;

   Result :=  somaTotal;
end;

procedure TfrmMensalidadesBaixar.HabilitaCartao(valor: Boolean);
begin
   // Para habilitar a opção de cartão, deverá existir uma administradora de cartões.
   if (chkCartao.Tag = 1) then
   begin
      chkCartao.Enabled := valor and not(baixaRetorno);
   end;
end;

procedure TfrmMensalidadesBaixar.HabilitaDinheiroCheque(valor: boolean);
begin
   chkCheque.Enabled    := valor and not(baixaRetorno);
   chkDinheiro.Enabled  := valor;
end;

procedure TfrmMensalidadesBaixar.habilitarcartoes;
const
   SQL_ADMINISTRADORA =
      ' SELECT '+
      '     COUNT(*) AS RESULTADO '+
      '  FROM '+
      '     fin_cadastro_admin_cartao '+
      '  WHERE '+
      '     sn_ativo = 1 ';
var
   qyAdministradoras: TUMZReadOnlyQuery;
begin
   DM.CriarConsulta(qyAdministradoras);

   qyAdministradoras.SQL.Text := SQL_ADMINISTRADORA;
   qyAdministradoras.Open;

   // Verificar se foi cadastrado algum cartão.
   // Se não for, colocar um hint no campo e bloqueá-lo
   // O Bloqueio será feito pela Tag na chamada HabilitarCartao
   if qyAdministradoras.FieldByName('RESULTADO').AsInteger >= 1 then begin
      chkCartao.Tag := 1;
      chkCartao.Hint := ''
   end else begin
      chkCartao.Tag := 0;
      chkCartao.Hint := 'Configure a baixa por cartão na opção "Cadastro >> Administradoras de Cartão.';
      chkCartao.Enabled := false;
   end ;
end;

function TfrmMensalidadesBaixar.IdentificaCompensacaoMaiorVencimento: Boolean;
var
   iPessoas       : integer;
   iParcelas      : integer;
   ListaParcelas  : TObjectList;
   objParcela     : TMBParcela;
   dt_comp        : TDate;
   dt_vencimento  : TDate;
   ds_comp        : string;
   ds_vencimento  : string;
   retorno        : Boolean;
begin
   objPessoa      := nil;
   retorno        := false;

   if ListaPessoas <> nil then
   begin
      //percorre todas as pessoas selecionadas nas ABAS
      for iPessoas := 0 to ListaPessoas.Count - 1 do
      begin
         objPessoa      := (ListaPessoas.items[iPessoas] as TMBPessoa);
         ListaParcelas  := objPessoa.getListaParcelas();

         //percorre todas as parcelas das pessoas.
         for iParcelas  := 0 to ListaParcelas.Count - 1 do
         begin
            objParcela  := (ListaParcelas.items[iParcelas] as TMBParcela) ;

            //se a parcela estiver selecionada
            if trim(objParcela.getValorCampo('sn_ativo')) = '1' then
            begin
               //verifica se a data de compensação do cheque é maior que o
               //vencimento da mensalidade
               ds_comp        := txtDtCompensacao.Text;
               ds_vencimento  := objParcela.getValorCampo('datavencimento');

               //valida as duas datas que serão comparadas
               if validaData(ds_comp) = true and validaData(ds_vencimento) then
               begin
                  dt_comp        := StrToDate( ds_comp );
                  dt_vencimento  := StrToDate( ds_vencimento );

                  //se a compensação do cheque for maior que o vencimento retorna verdadeiro para recalcular os juros.
                  if dt_comp > dt_vencimento then
                  begin
                     retorno := true;
                     break;
                  end;

               end
               else
               begin
                  Mensagem('Data de Compensação do Cheque ou Parcela Inválida. O sistema não fez a identificação do cálculo do juros.', 'Atenção', MB_OK + MB_ICONWARNING);
                  Result := false;
                  exit;
               end;

            end;

         end;

         objPessoa := nil;
      end;
   end;

   result := retorno;

end;

procedure TfrmMensalidadesBaixar.ImpressaoDeRecibos( cd_mensalidade: String; sforcar_recibo : string; const MensalidadesAgrupadas: Boolean = False );
var
   nr_qtd_recibo  : integer;
begin

   //verifica a necessidade de impressão do rececibo automatico
   if (sforcar_recibo = 'NORMAL') then
   begin

      // se forçar recibo for igual NORMAL o sistema vai mandar um codigo de mensalidade simples
      // ex: 178274

      oRecibo := TFinReciboManager.Create(StrToInt(cd_mensalidade));
      oRecibo.imprimirRecibo();

      FreeAndNil(oRecibo);

   end
   else if  (sforcar_recibo = 'FISCAL') then
   begin

      try
         nr_qtd_recibo := StrToInt( DM.variavel_parametro('financeiro_forcar_recibo_qtd') );
      except
         nr_qtd_recibo := 1;
      end;

      Application.CreateForm(TfrmImpMens, frmImpMens);

      while nr_qtd_recibo > 0 do
      begin

        frmImpMens.ImprimirReciboDOS( cd_mensalidade, False );
        Dec(nr_qtd_recibo);

      end;

      FreeAndNil(frmImpMens);

   end;
end;

procedure TfrmMensalidadesBaixar.ImpressaoRelatorioRecibo( ds_mensalidades : string; sforcar_recibo : string );
var
   sNomeRelatorio: String;
   PodeExportar: Boolean;
   infoRelatorio: ClasseRegistros;
begin
   //Rotina para impressão do relatorio do recibo NORMAL
   if (sforcar_recibo = 'NORMAL') then
   begin
      infoRelatorio := PrincipalForm.GetInfoRpt('relatorio_padrao_recibo');
      sNomeRelatorio := infoRelatorio.Campo['nm_arquivo']+'.rpt';

      PodeExportar := True;
      if infoRelatorio.Campo['sn_pode_exportar'] = 0 then
         PodeExportar := False;
         
      PrincipalForm.ImprimeRpt(Self, sNomeRelatorio , -1, '{mensalidades.cd_mensalidade} IN [' + ds_mensalidades + ']', '',nil,nil,nil,nil, true, False, nil, PodeExportar, False);
   end;
end;

procedure TfrmMensalidadesBaixar.inserirCheque;
var
   objCheque   : TMBCheque;
   nr_cheque   : string;
   nr_banco    : string;
   nr_agencia  : string;
   nr_conta    : string;
   vl_cheque   : string;
   dt_comp     : string;
   nm_titular  : string;
   arrData     : TStringList;
   DataComp: TDateTime;
begin
   nr_cheque   := txtNrCheque.Text;
   nr_banco    := txtNrBanco.Text;
   nr_agencia  := txtNrAgencia.Text;
   nr_conta    := txtNrCC.Text;
   vl_cheque   := txtVlCheque.getValorString();
   dt_comp     := txtDtCompensacao.Text;
   arrData     := TStringList.Create();
   nm_titular  := ednm_titular.Text;
   SplitString( dt_comp,'/',arrData );

   try
      DataComp := DataValida(
         StrToInt(arrData[2]),
         StrToInt(arrData[1]),
         StrToInt(arrData[0])
      );
      dt_comp := DateToStr(DataComp);
   except
      on E: EConvertError do
         dt_comp := '';
   end;


   //se a lista não estiver criada então cria a lista de cheques
   if ListaCheques = nil then
   begin
      ListaCheques := TObjectList.Create();
   end;

   //todos os campos dos cheques devem ser preenchidos
   if (trim(nr_cheque) <> '') and (trim(nr_banco) <> '') and
   (trim(nr_agencia) <> '') and (trim(nr_conta) <> '') and
   (trim(vl_cheque) <> '') and (trim(dt_comp) <> '') then
   begin
      objCheque := TMBCheque.Create();

      objCheque.setValorCampo( 'nr_cheque',        nr_cheque   );
      objCheque.setValorCampo( 'nr_banco',         nr_banco    );
      objCheque.setValorCampo( 'nr_agencia',       nr_agencia  );
      objCheque.setValorCampo( 'nr_conta',         nr_conta    );
      objCheque.setValorCampo( 'vl_cheque',        vl_cheque   );
      objCheque.setValorCampo( 'dt_compensacao',   dt_comp     );
      objCheque.setValorCampo( 'nm_titular',       nm_titular  );

      ListaCheques.Add( objCheque );

      Self.carregaGridCheques();

      //limpa campos Cheque
      Self.LimpaCamposCheque();

      txtNrBanco.SetFocus();
   end;
   
   FreeAndNil( arrData );
end;

procedure TfrmMensalidadesBaixar.InserirMensalidadeCheque;
var
   i              : integer;
   objFinCheque   : TMBFinCheques;
begin
   for i := 0 to ListaChequesMensalidades.Count - 1 do
   begin
      objFinCheque := (ListaChequesMensalidades.items[i] as TMBFinCheques);
      objFinCheque.inserir();
   end;
end;

function TfrmMensalidadesBaixar.IsAutoRelease: Boolean;
begin
   Result := FAutoRelease;
end;

procedure TfrmMensalidadesBaixar.LiberaObjetos;
var
   i : integer;
begin
   //libera a lista de tipos de titulos
   for i := cmbContaCaixa.Items.Count - 1 downto 0 do
   begin
      (cmbContaCaixa.Items.Objects[i] as TItemComboMCaixa).Free;
   end;

   //libera a lista de pessoas selecionadas
   Self.limparListaPessoas();

   //libera a lista e mensalidades a serem baixadas
   Self.limparListaBaixaMensalidades();

   //libera a lista de cheques das mensalidades
   Self.limparListaChequesMensalidades();

   //se a parcela selecionada estiver preenchida seta com vazia
   if chkParcelaSelecionada <> nil then
   begin
      chkParcelaSelecionada := nil
   end;

   cmbContaCaixa.Clear;
end;

procedure TfrmMensalidadesBaixar.limpaGridCheques;
var
   iLinha         : integer;
   iColuna        : integer;
begin

   for iLinha := 1 to sgGridCheques.RowCount - 1 do
   begin
      for iColuna := 0 to sgGridCheques.ColCount - 1 do
      begin
         sgGridCheques.Cells[ iColuna, iLinha ] := '';
      end;

      //libera objeto cheque
      sgGridCheques.Objects[0, iLinha]      := nil;
   end;

   sgGridCheques.RowCount := 2;
end;

procedure TfrmMensalidadesBaixar.limpaGridParcelas;
var
   iLinha      : integer;
   iColuna     : integer;
   NovoCheck   : TCheckBox;
begin
   sgGridParcelas.Options := sgGridParcelas.Options - [goEditing];

   for iLinha := 1 to sgGridParcelas.RowCount - 1 do
   begin
      for iColuna := 0 to sgGridParcelas.ColCount - 1 do
      begin
         sgGridParcelas.Cells[ iColuna, iLinha ] := '';

      end;

      //libera checkbox
      NovoCheck := (sgGridParcelas.Objects[0,iLinha] as TCheckBox);

      if NovoCheck <> nil then
      begin
         NovoCheck.Tag := -1;
         NovoCheck.Free;
         sgGridParcelas.Objects[0, iLinha]   := nil;
      end;

      //libera objeto parcela
      sgGridParcelas.Objects[1, iLinha]      := nil;

   end;

   sgGridParcelas.RowCount := 2;
end;

procedure TfrmMensalidadesBaixar.limparListaBaixaMensalidades;
var
   i : integer;
begin

   //libera a lista de mensalidades a serem baixadas
   if ListaMensalidadesBaixa <> nil then
   begin
      for i := ListaMensalidadesBaixa.Count - 1 downto 0 do
      begin
         (ListaMensalidadesBaixa.Items[i] as TMBMensalidadeBaixa).Free;
      end;

      ListaMensalidadesBaixa := nil;
   end;
end;

procedure TfrmMensalidadesBaixar.limparListaCheques;
var
   i : integer;
begin

   //libera a lista de cheques
   if ListaCheques <> nil then
   begin
      for i := ListaCheques.Count - 1 downto 0 do
      begin
         (ListaCheques.Items[i] as TMBCheque).Free;
      end;

      ListaCheques := nil;
   end;

end;

procedure TfrmMensalidadesBaixar.limparListaChequesMensalidades;
var
   i : integer;
begin

   //libera a lista de cheques das mensalidades
   if ListaChequesMensalidades <> nil then
   begin
      for i := ListaChequesMensalidades.Count - 1 downto 0 do
      begin
         (ListaChequesMensalidades.Items[i] as TMBFinCheques).Free;
      end;

      ListaChequesMensalidades := nil;
   end;

end;

procedure TfrmMensalidadesBaixar.limparListaPessoas;
var
   i: integer;
begin

   //libera a lista de pessoas selecionadas
   if ListaPessoas <> nil then
   begin
      for i := ListaPessoas.Count - 1 downto 0 do
      begin
         (ListaPessoas.Items[i] as TMBPessoa).Free;
      end;

      ListaPessoas   := nil;
      objPessoa      := nil;
   end;

end;

procedure TfrmMensalidadesBaixar.MontaBaixaMensalidade();
var
   vl_cheque                  : double;
   vl_dinheiro                : double;
   vl_mensalidade             : double;
   vl_troco                   : double;
   vl_devolucao               : double;
   cd_mensalidade             : string;
   cd_cheque                  : string;
   objMensalidadeBaixa        : TMBMensalidadeBaixa;
   objCheque                  : TMBCheque;
   objFinChequesMensalidades  : TMBFinCheques;
   i                          : integer;
   iCheque                    : integer;
   vl_restante                : double;
   vl_soma_cheques            : double;
   cd_cheque_maior_valor      : string;
begin

   if ListaMensalidadesBaixa <> nil then
   begin
      //verifica se o valor pago bate com o total das mensalidades

      vl_dinheiro       := RoundFloat( txtDinheiro.getValorDouble(), 2  );
      vl_troco          := RoundFloat( txtTroco.getValorDouble(),    2  );

      if chkCartao.Checked then
      begin
         vl_dinheiro       := RoundFloat( txtCartao.getValorDouble(), 2  );
         vl_troco          := RoundFloat( txtTroco.getValorDouble(),    2  );
      end;

      if vl_troco > 0 then
      begin
         cd_cheque_maior_valor := Self.getCdChequeMaiorValor();
      end;

      if ( (vl_dinheiro - vl_troco) >= 0) and (vl_troco <> 0) then
      begin
         vl_dinheiro    := RoundFloat( (vl_dinheiro - vl_troco), 2 );
         vl_troco       := 0;
      end;

      if ListaChequesMensalidades = nil then
      begin
         ListaChequesMensalidades := TObjectList.Create();
      end;
      
      for i := 0 to ListaMensalidadesBaixa.Count - 1 do
      begin
         //recupera a mensalidade que deve ser baixada
         objMensalidadeBaixa  := (ListaMensalidadesBaixa.items[i] as TMBMensalidadeBaixa);
         cd_mensalidade       := objMensalidadeBaixa.getValorCampo('cd_mensalidade');
         vl_mensalidade       := RoundFloat( StrToFloat(objMensalidadeBaixa.getValorCampo('valorpago')) , 2);

         //DESCONTA EM DINHEIRO AS MENSALIDADES
         if RoundFloat(vl_dinheiro, 2) > 0 then
         begin
            //desconta a mensalidade do dinheiro
            vl_restante       := RoundFloat( vl_dinheiro - vl_mensalidade, 2 );

            //se o valor do que resta do dinheiro for o suficiente pra pagar
            //a mensalidade efetua o registro de pagamento por dinheiro
            if vl_restante >= 0 then
            begin
               objMensalidadeBaixa.setValorCampo('vl_pago_dinheiro', FloatToStrF( vl_mensalidade, ffFixed, 15,2) );
               vl_dinheiro    := RoundFloat(vl_dinheiro - vl_mensalidade, 2);
               vl_mensalidade := 0;
            end
            else
            begin
               objMensalidadeBaixa.setValorCampo('vl_pago_dinheiro', FloatToStrF( vl_dinheiro, ffFixed, 15, 2) );
               vl_mensalidade := abs(vl_restante);
               vl_dinheiro    := 0;
            end;

         end;

         //DESCONTA EM CHEQUE AS MENSALIDADES

         if vl_mensalidade > 0 then
         begin

            //desconta os cheques caso exista algum cheque cadastrado
            if ListaCheques <> nil then
            begin
               vl_soma_cheques := 0;

               //se houver valor pendente usa os cheques cadastrados para pagar
               for iCheque := 0 to ListaCheques.Count - 1 do
               begin
                  objCheque   := (ListaCheques.items[iCheque] as TMBCheque);
                  cd_cheque   := objCheque.getValorCampo('cd_cheque');

                  vl_cheque   := StrToFloat( substituiCaracter( objCheque.getValorCampo('vl_cheque'), '.', ',') );
                  vl_cheque   := RoundFloat( vl_cheque , 2 );

                  //desconta o troco do primeiro cheque com valor compativel
                  vl_devolucao := 0;

                  
                  if vl_cheque > 0 then
                  begin

                     vl_restante := RoundFloat( vl_cheque - vl_mensalidade , 2);

                     if vl_restante >= 0 then
                     begin
                        // Aplicar o Retorno de troco somente quando existe restante (vl_restante) e quando for a ultima mensalidade.
                        // O retorno de dinheiro não pode ser feito enquanto houver possibilidade de mais rateio de cheques (outra mensalidade). }
                        if ( ((vl_cheque+vl_soma_cheques) - vl_troco) >= 0) AND (vl_troco <> 0) AND
                           ((ListaMensalidadesBaixa.Count-1) = i) then
                        begin
                           // Claudionor - o Valor do Cheque fica o mesmo, não retirar o troco
                           // vl_cheque    := RoundFloat( (vl_cheque - vl_troco), 2 );
                           // REVISAR
                           objMensalidadeBaixa.setValorCampo('vl_pago_dinheiro',   FloatToStrF( (abs(vl_troco) * -1), ffFixed, 15,2) );
                           vl_devolucao := abs(vl_troco);
                           vl_troco     := 0;
                        end;

                        if vl_soma_cheques > 0 then
                        begin
                           //soma o cheque que completa o valor da parcela
                           if ((ListaMensalidadesBaixa.Count-1) = i) then
                           begin
                              // Quando for a ULTIMA MENSALIDADE, jogar no cheque o valor total das somas dos cheques.
                              // Pois o retorno será feito através de dinheiro
                              vl_soma_cheques := RoundFloat( vl_soma_cheques + vl_cheque, 2);
                           end else begin
                              // Caso não seja a ultima mensalidade, definir o valor pago como sendo o valor real da mensalidade
                              vl_soma_cheques := RoundFloat( vl_soma_cheques + (vl_cheque - vl_restante), 2);
                           end;
                           
                           objMensalidadeBaixa.setValorCampo('vl_pago_cheque',   FloatToStrF(vl_soma_cheques, ffFixed, 15,2) );

                           objFinChequesMensalidades := TMBFinCheques.Create();
                           objFinChequesMensalidades.setValorCampo('cd_mensalidade',   cd_mensalidade );
                           objFinChequesMensalidades.setValorCampo('cd_cheque',        cd_cheque );
                           objFinChequesMensalidades.setValorCampo('nr_cheque',        objCheque.getValorCampo('nr_cheque') );

                           ListaChequesMensalidades.Add( objFinChequesMensalidades );

                           //armazena o que restou do valor do cheque para o próximo pagamento
                           objCheque.setValorCampo('vl_cheque', FloatToStrF( vl_restante, ffFixed, 15, 2) );
                           break;
                        end
                        else
                        begin
                           //total do cheque fecha com o total ou restante de uma mensalidade

                           // Claudionor - tratar casos em que o valor do cheque é maior, diferença em dinheiro
                           if ( ((ListaMensalidadesBaixa.Count-1) = i) OR ( (cd_cheque_maior_valor <> '') and (cd_cheque_maior_valor = cd_cheque) ) ) AND
                              (vl_devolucao > 0) then
                           begin
                              objMensalidadeBaixa.setValorCampo('vl_pago_cheque',   FloatToStrF( vl_mensalidade + vl_devolucao , ffFixed, 15,2) );
                              vl_restante := vl_cheque - (vl_mensalidade + vl_devolucao);
                           end else begin
                              objMensalidadeBaixa.setValorCampo('vl_pago_cheque',   FloatToStrF( vl_mensalidade , ffFixed, 15,2) );
                           end;

                           objFinChequesMensalidades := TMBFinCheques.Create();
                           objFinChequesMensalidades.setValorCampo('cd_mensalidade',   cd_mensalidade );
                           objFinChequesMensalidades.setValorCampo('cd_cheque',        cd_cheque );
                           objFinChequesMensalidades.setValorCampo('nr_cheque',        objCheque.getValorCampo('nr_cheque') );

                           ListaChequesMensalidades.Add( objFinChequesMensalidades );

                           //armazena o que restou do valor do cheque para o próximo pagamento
                           objCheque.setValorCampo('vl_cheque', FloatToStrF( vl_restante, ffFixed, 15, 2) );
                           break;

                        end;

                     end
                     else
                     begin
                        vl_soma_cheques := RoundFloat( vl_soma_cheques + vl_cheque, 2);

                        vl_mensalidade := abs(vl_restante);

                        objFinChequesMensalidades := TMBFinCheques.Create();
                        objFinChequesMensalidades.setValorCampo('cd_mensalidade',   cd_mensalidade );
                        objFinChequesMensalidades.setValorCampo('cd_cheque',        cd_cheque );
                        objFinChequesMensalidades.setValorCampo('nr_cheque',        objCheque.getValorCampo('nr_cheque') );

                        ListaChequesMensalidades.Add( objFinChequesMensalidades );

                        //zera o valor do cheque usado no pagamento da mensalidade
                        objCheque.setValorCampo('vl_cheque', '0' );
                     end;
                  end;
               end;
            end;
         end;
      end;
   end;
end;

procedure TfrmMensalidadesBaixar.mostraQtdParcelas;
begin
   edQtdParcelas.Visible   := (cbAdministradoras.ItemIndex > -1) and (rbCredito.Checked);
   udQtdParcelas.Visible   := (cbAdministradoras.ItemIndex > -1) and (rbCredito.Checked);
   Label5.Visible          := (cbAdministradoras.ItemIndex > -1) and (rbCredito.Checked);
   
   edQtdParcelas.Text := '0';
end;

procedure TfrmMensalidadesBaixar.aoClicar( Sender: TObject );
var
   iLinha, TopRow: Integer;
   ListaPar          : TObjectList;
   objParcela        : TMBParcela;
   objPessoaSel      : TMBPessoa;
   sn_ativo          : string;
   vl_pago           : double;
begin
   {O nome da check contém o número da linha no qual o check foi assinalado
   Exemplo: chkSnAtivo_1,  onde 1 é o número da linha do TStringGrid que
   vou precisar buscar o objeto. O Sistema só precisa separar esse valor}
   iLinha := (Sender as TCheckBox).Tag;

   //obtem a pessoa selecionada na aba
   objPessoaSel   := (tabParcelas.Tabs.Objects[tabParcelas.TabIndex] as TMBPessoa);
   ListaPar       := objPessoaSel.getListaParcelas();

   //instancia a parcela do objeto
   objParcela     := (ListaPar.items[iLinha] as TMBParcela);

   sn_ativo := objParcela.getValorCampo('sn_ativo');

   if trim(sn_ativo) = '1' then
   begin
      sn_ativo := '0';
      vl_pago  := 0;
   end
   else
   begin
      sn_ativo := '1';

      vl_pago := Self.getValorPago( objParcela );
   end;

   objParcela.setValorCampo( 'sn_ativo',     sn_ativo );
   objParcela.setValorCampo( 'valorpago',    FloatToStr( vl_pago ) );

   // Guarda o contexto atual para saber qual a parcela (linha) apresentada
   // no topo da listagem e desabilita a pintura do componente

   TopRow := sgGridParcelas.TopRow;
   LockWindowUpdate(sgGridParcelas.Handle);

   Self.carregaGridParcelas(objPessoaSel);

   // Resgata o contexto anterior definindo a linha topo da listagem e
   // reabilitando a pintura do componente

   sgGridParcelas.TopRow := TopRow;
   LockWindowUpdate(0);

   Self.atualizaValoresTotais();
   Self.CalcularTroco();

   if chkCartao.Checked and
      (cbAdministradoras.ItemIndex > -1) then
   begin
      carregaValoresGridCartao();   
   end;
end;

procedure TfrmMensalidadesBaixar.HabilitaBotaoBaixar();
begin
   //se uma das três opções de pagamento forem assinaladas então habilita
   if (chkDinheiro.Checked or chkCheque.Checked or chkCartao.Checked) then
   begin
      btnBaixar.Tag := 0;
      btnBaixar.Font.Color := clBlack;
      btnBaixar.Refresh;

      Exit;
   end;

   btnBaixar.Tag := 1;
   btnBaixar.Font.Color := clGrayText;
   btnBaixar.Refresh;
end;

procedure TfrmMensalidadesBaixar.Panel1Click(Sender: TObject);
begin
   if btnCancelar.Tag = 1 then Exit;

   ModalResult := mrCancel;
   Self.Close();
end;

procedure TfrmMensalidadesBaixar.Panel1MouseEnter(Sender: TObject);
begin
      // Ao passar o mouse sobre este botão, retiramos o evento do OnExit da grid,
   // que estava validando valores 0 ou '' na coluna ValorPago
   // Obs.: Se ele está no cancelar, então ele PODE cancelar.
   sgGridParcelas.OnExit := nil;
end;

procedure TfrmMensalidadesBaixar.Panel1MouseLeave(Sender: TObject);
begin
   // Ao passar o mouse sobre este botão, habilitamos o evento do OnExit da grid,
   // que estava validando valores 0 ou '' na coluna ValorPago
   // Obs.: Se ele está FORA do cancelar, ele não pode fazer nada (OnExit habilitado).
   sgGridParcelas.OnExit := sgGridParcelasExit;
end;

procedure TfrmMensalidadesBaixar.btnBaixarClick(Sender: TObject);
begin
   if btnBaixar.Tag = 1 then Exit;

   ativaBotaoBaixar( false );

   if cmbContaCaixa.ItemIndex = -1 then
   begin
      // Só deverá entrar nesse if, caso a conta estiver FECHADA
      if ( not cmbContaCaixa.Enabled ) then
      begin
         Mensagem(
            'Não é possível realizar a baixa! Favor escolher uma conta que esteja aberta.',
            'Aviso',
            MB_ICONEXCLAMATION + MB_OK,
            Handle
         );
         ativaBotaoBaixar( true );
         Exit;
      end;
      Mensagem(
         'Selecione uma Conta Caixa',
         'Atenção',
         MB_OK + MB_ICONWARNING
      );
      ativaBotaoBaixar( true );
      Exit;
   end;

   if (edtTalaoDepos.Text = '') AND
      (stContasTDObrigadoria.IndexOf((cmbContaCaixa.Items.Objects[ cmbContaCaixa.itemIndex ] as TItemComboMCaixa).getCodigo) > -1) then
   begin
      Mensagem(
         'Não é possível realizar a baixa! Favor preencher o campo do talão de depósito',
         'Aviso',
         MB_ICONEXCLAMATION + MB_OK,
         Handle
      );

      edtTalaoDepos.SetFocus;
      ativaBotaoBaixar( true );
      Exit;
   end;

   if (DM.variavel_parametro('observacao_baixar_mensalidade_obrigatorio') = 'S') and
      (edObservacao.Text = '') then
   begin
      Mensagem(
         'Não é possível realizar a baixa! Favor preencher o campo de Observação',
         'Aviso',
         MB_ICONEXCLAMATION + MB_OK,
         Handle
      );

      tabParcelas.TabIndex := tabParcelas.Tabs.Count - 2;

      edObservacao.Visible    := True;
      sgGridParcelas.Visible  := False;
      limpaBuffer();
      Self.limpaGridParcelas();
      ativaBotaoBaixar( true );
      Exit;
   end;

   if chkCartao.Checked and
      not(validaValoresCartaoGrid) then
   begin
      Mensagem(
         'O valor das parcelas difere do valor total da baixa.',
         'Aviso',
         MB_OK + MB_ICONWARNING
      );
      ativaBotaoBaixar( true );
      Exit;
   end;

   { Validacao para baixa por cartão - Checa se o campo TID é válido }
   if ((trim(edTID.text) <> '') AND ( length(edTID.text) <> 20 ) ) then
   begin
      Mensagem(
         'Número de TID inválido. Este código deve conter 20 caracteres!',
         'Atenção',
         MB_OK + MB_ICONWARNING
      );
      ativaBotaoBaixar( true );
      Exit;
   end;
   
   //verifica se existe autorização para baixar mensalidade
   if DM.UsuarioLogado.TemPermissao(2012, npAcesso, True) then
   begin
      //faz a conferencia das informações selecionadas e da mensalidade
      //if Mensagem('O sistema irá efetuar baixa das mensalidades selecionadas. Deseja continuar?', 'Atenção', MB_YESNO + MB_ICONWARNING) = mrYes then
      //begin
      if Self.confereMensalidades() = true then
      begin

         if Self.VerificaTalaoDeposito() then
         begin

            if Self.VerificaValores() = true then
            begin

               //identifica se a baixa é com dinheiro, cheque ou cartão
               if (chkDinheiro.Checked = true) or (chkCheque.Checked = true) then
               begin
                  Self.BaixaPorDinheiroCheque();
               end;
               
               if chkCartao.Checked = true then
               begin
                  Self.BaixaPorCartao();
               end;
            end
            else
            begin
               Mensagem( 'O valor a ser pago não confere com o valor total.', 'Atenção', MB_OK + MB_ICONWARNING );
               ativaBotaoBaixar( true );
            end;
 
         end
         else
         begin
            ativaBotaoBaixar( true );
         end;
      end;
   end
   else
   begin
      Mensagem('Sem permissão para baixar mensalidades.', 'Atenção', MB_OK + MB_ICONERROR );
      ativaBotaoBaixar( true );
   end;

   ativaBotaoBaixar( True );
end;

function TfrmMensalidadesBaixar.PessoaExistente( cd_pessoa: string ): Boolean;
var
   i        : integer;
   bExiste  : Boolean;
begin
   bExiste := false;

   if ListaPessoas <> nil then
   begin
      for i := 0 to ListaPessoas.Count - 1 do
      begin
         objPessoa := nil;
         objPessoa := (ListaPessoas.items[i] as TMBPessoa);

         if objPessoa.getValorCampo('cd_pessoa') = cd_pessoa then
         begin
            tabParcelas.TabIndex := i;
            bExiste := true;
            break;
         end;
      end;
      
   end;

   Result := bExiste;
end;

procedure TfrmMensalidadesBaixar.popmnuRemovePessoaClick(Sender: TObject);
begin
   if (ListaPessoas <> nil) and (ListaPessoas.Count > 1) then
   begin
//      Retirar a pessoa da Tela de baixa sem confirmação.   
//      if Mensagem( 'Deseja apagar a pessoa selecionada?', 'Atenção', MB_YESNO + MB_ICONINFORMATION) = mrYes then
//      begin
         Self.limpaGridParcelas();
         ListaPessoas.Remove( (tabParcelas.Tabs.Objects[tabParcelas.TabIndex] as TMBPessoa) );

         if ListaPessoas.Count = 0 then
         begin
            ListaPessoas := nil;
         end;

         Self.carregaAbas();
         Self.carregaGridParcelas( nil );

         //ajusta a soma das parcelas
         Self.atualizaValoresTotais();
//      end;
   end
   else if (ListaPessoas <> nil) and (ListaPessoas.Count = 1) then
   begin
      //não remove a ultima pessoa selecionada e não mostra mensagem
   end
   else
   begin
      Mensagem('Não foi encontrado nenhuma pessoa para remover.', 'Atenção', MB_OK + MB_ICONWARNING);
   end;
end;

procedure TfrmMensalidadesBaixar.rbCreditoClick(Sender: TObject);
begin
   mostraQtdParcelas;

   if udQtdParcelas.Max > 0 then
   begin
      edQtdParcelas.Text := '1';
   end;

   carregaValoresGridCartao;
   carregaContaAutomatica;
end;

procedure TfrmMensalidadesBaixar.rbDebitoClick(Sender: TObject);
begin
   mostraQtdParcelas;
   carregaValoresGridCartao;
   carregaContaAutomatica;
end;

function TfrmMensalidadesBaixar.salvaOperacaoCartao: Integer;
const
   SQL_OPERACAO_CARTAO =
      ' INSERT INTO fin_cartao_operacao ( '+
      '     cd_admin_cartao, '+
      '     cd_caixa, '+
      '     vl_total, '+
      '     sn_credito, '+
      '     nr_qtd_parcelas, '+
      '     nr_taxa_original, '+
      '     nr_taxa, '+
      '     dt_operacao, '+
      '     ds_tid_cartao '+
      ' ) '+
      ' VALUES '+
      '    ( '+
      '        :cd_admin_cartao, '+
      '        :cd_caixa, '+
      '        :vl_total, '+
      '        :sn_credito, '+
      '        :nr_qtd_parcelas, '+
      '        :nr_taxa_original, '+
      '        :nr_taxa, '+
      '        NOW(),'+
      '        :ds_tid_cartao'+
      '    ) ';
var
   qyOperacao: TUMZQuery;
begin
   DM.CriarConsulta(qyOperacao);

   qyOperacao.SQL.Text := SQL_OPERACAO_CARTAO;

   qyOperacao.ParamByName('cd_admin_cartao').AsInteger :=
      StrToInt(TItemCombo(cbAdministradoras.Items.Objects[cbAdministradoras.ItemIndex]).getCodigo);
   qyOperacao.ParamByName('cd_caixa').AsInteger :=
      StrToInt(TItemComboMCaixa(cmbContaCaixa.Items.Objects[cmbContaCaixa.itemIndex]).getCodigo);
   qyOperacao.ParamByName('vl_total').AsFloat :=
      txtVlTotal.getValorDouble;
      
   if ((trim(edTID.text) <> '')) then
   begin
      qyOperacao.ParamByName('ds_tid_cartao').AsString :=
           trim(edTID.text);
   end;

   if rbCredito.Checked then qyOperacao.ParamByName('sn_credito').AsInteger := 1;
   if rbDebito.Checked then qyOperacao.ParamByName('sn_credito').AsInteger := 0;
   
   qyOperacao.ParamByName('nr_taxa_original').AsFloat :=
      taxaCartaoCobrada;
   qyOperacao.ParamByName('nr_taxa').AsFloat :=
      taxaCartaoCobrada;

   if rbCredito.Checked then
   begin
      qyOperacao.ParamByName('nr_qtd_parcelas').AsInteger :=
         StrToInt(edQtdParcelas.Text);
   end;

   qyOperacao.ExecSQL;

   Result := DM.LastInsert;
end;

procedure TfrmMensalidadesBaixar.salvaOperacaoMensalidades(
  codOperacao: Integer);
const
   SQL_OPERACAO_MENSALIDADES =
      ' INSERT INTO fin_cartao_mensalidades (cd_operacao, cd_mensalidade) '+
      '  VALUES '+
      '     ( '+
      '        :cd_operacao, '+
      '        :cd_mensalidade '+
      '     ) ';
var
   i: Integer;
   objMensalidadeBaixar : TMBMensalidadeBaixa;
   qyOperacaoMensalidades: TUMZQuery;
begin
   DM.CriarConsulta(qyOperacaoMensalidades);

   for I := 0 to ListaMensalidadesBaixa.Count - 1 do
   begin
      objMensalidadeBaixar := (ListaMensalidadesBaixa.items[i] as TMBMensalidadeBaixa);

      qyOperacaoMensalidades.Params.Clear;
      qyOperacaoMensalidades.SQL.Text := SQL_OPERACAO_MENSALIDADES;
      
      qyOperacaoMensalidades.ParamByName('cd_operacao').AsInteger :=
         codOperacao;
      qyOperacaoMensalidades.ParamByName('cd_mensalidade').AsInteger :=
         StrToInt(objMensalidadeBaixar.getValorCampo('cd_mensalidade'));

      qyOperacaoMensalidades.ExecSQL;
   end;
end;

procedure TfrmMensalidadesBaixar.salvaParcelasCartao(codOperacao: Integer);
const
   SQL_PARCELAS =
      ' INSERT INTO fin_cartao_parcelas ( '+
      '     cd_operacao, '+
      '     nr_parcela, '+
      '     vl_valor_parcela, '+
      '     dt_vencimento_original, '+
      '     dt_vencimento, '+
      '     cd_caixa_atual '+
      '  ) '+
      '  VALUE '+
      '     ( '+
      '        :cd_operacao, '+
      '        :nr_parcela, '+
      '        :vl_valor_parcela, '+
      '        :dt_vencimento_original, '+
      '        :dt_vencimento, '+
      '        :cd_caixa_atual '+
      '     ) ';
var
   qyParcelas: TUMZQuery;
   i: Integer;
begin
   DM.CriarConsulta(qyParcelas);

   for I := 1 to sgParcelasCartao.RowCount - 1 do
   begin
      qyParcelas.Params.Clear;

      qyParcelas.SQL.Text := SQL_PARCELAS;

      qyParcelas.ParamByName('cd_operacao').AsInteger :=
         codOperacao;
      qyParcelas.ParamByName('nr_parcela').AsInteger :=
         StrToInt(sgParcelasCartao.Cols[0][i]);
      qyParcelas.ParamByName('vl_valor_parcela').AsFloat :=
         StrToFloat(sgParcelasCartao.Cols[2][i]);
      qyParcelas.ParamByName('dt_vencimento_original').AsDate :=
         StrToDate(sgParcelasCartao.Cols[1][i]);
      qyParcelas.ParamByName('dt_vencimento').AsDate :=
         StrToDate(sgParcelasCartao.Cols[1][i]);
      qyParcelas.ParamByName('cd_caixa_atual').AsInteger :=
         StrToInt(TItemComboMCaixa(cmbContaCaixa.Items.Objects[cmbContaCaixa.itemIndex]).getCodigo);      

      qyParcelas.ExecSQL;   
   end;
end;

procedure TfrmMensalidadesBaixar.SelecionaParcela(const Mensalidade: string);
var
   I, R: Integer;
   TmpObj: TObject;
   Parcela: TMBParcela;
begin
   for I := 1 to sgGridParcelas.RowCount do
   begin
      TmpObj := sgGridParcelas.Objects[1, I];
      
      if Assigned(TmpObj) and (TmpObj is TMBParcela) then
      begin
         Parcela := TMBParcela(TmpObj);
         
         if Parcela.getValorCampo('cd_mensalidade') = Mensalidade then
         begin
            if I > sgGridParcelas.VisibleRowCount then
            begin
               R := I - sgGridParcelas.VisibleRowCount + 1;
               sgGridParcelas.TopRow := R;
            end;
            Break;
         end;
      end;
   end;
end;

procedure TfrmMensalidadesBaixar.setArrParcelasSelecionadas(
  arrParcelas: TDynamicIntArray);
begin
   arrParcelasSelecionadas := arrParcelas;
end;

procedure TfrmMensalidadesBaixar.SetAutoRelease(const Value: Boolean);
begin
   FAutoRelease := Value;
end;

procedure TfrmMensalidadesBaixar.setDataHoje(data: TDateTime);
begin
   Self.data_hoje := data;
end;

procedure TfrmMensalidadesBaixar.setMensalidadeSelecionada(valor: string);
begin
   Self.cd_mensalidade_selecionada := valor;
end;

procedure TfrmMensalidadesBaixar.setNmPessoaSelecionada(valor: string);
begin
   Self.nm_pessoa_selecionada := valor;
end;

procedure TfrmMensalidadesBaixar.setnm_titular(valor: string);
begin
   Self.nm_titular := valor;
end;

procedure TfrmMensalidadesBaixar.setNrAnoSemestreSelecionado(valor: string);
begin
   Self.ds_anosemestre_selecionado := valor;
end;

procedure TfrmMensalidadesBaixar.setPessoaSelecionada(valor: string);
begin
   Self.cd_pessoa_selecionada := valor;
end;

procedure TfrmMensalidadesBaixar.setTurmaSelecionada(valor: string);
begin
   Self.ds_turma_selecionada := valor;
end;

procedure TfrmMensalidadesBaixar.sgGridChequesDrawCell(Sender: TObject; ACol,
  ARow: Integer; Rect: TRect; State: TGridDrawState);
var
   TextoColuna : String;
   valor       : Currency;
begin
   { Alinhar valores a direita }

   TextoColuna := sgGridCheques.Cells[ACol, ARow];

   if ACol in [ 4 ]  then //Coluna a ser alinhada a direita
   begin
      if ARow >= 1 then
      begin
         try
            valor       := StrToCurr(TextoColuna);
            TextoColuna := FloatToStrF(valor, ffFixed, 12, 2);
         except
            TextoColuna := '0,00';
         end;
      end;

      sgGridCheques.Canvas.FillRect(Rect);
      Rect.Right := Rect.Right - 2; // Espaçamento para texto não grudar na borda do grid
      DrawText(sgGridCheques.Canvas.Handle, PChar(TextoColuna), Length(TextoColuna), Rect, DT_RIGHT);
   end;

end;

procedure TfrmMensalidadesBaixar.sgGridChequesKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
   if (key = VK_TAB) or (Key = VK_RETURN) then
   begin
      if btnBaixar.Tag = 0 then
      begin
         btnBaixar.SetFocus();
      end
      else
      begin
         tabParcelas.SetFocus();
      end;
   end;
end;

procedure TfrmMensalidadesBaixar.sgGridChequesKeyPress(Sender: TObject;
  var Key: Char);
begin
   //Se for . transforma para virgula
   if(Key in['.']) then
   begin
      Key :=  ',';
   end;
   
   //configura as teclas de numeração e pontuação para digitação no grid
   if ListaCheques <> nil then
   begin
      if not (Key in[ '0'..'9', ',', #8, #13, #47 ]) then
      begin
         Key:= #0;
      end;
   end
   else
   begin
      key := #0;
   end;
end;

procedure TfrmMensalidadesBaixar.sgGridChequesSelectCell(Sender: TObject; ACol,
  ARow: Integer; var CanSelect: Boolean);
begin
   if ARow > 0 then
   begin
      cheque_selecionado := ARow;
   end;
end;

procedure TfrmMensalidadesBaixar.sgGridChequesSetEditText(Sender: TObject; ACol,
  ARow: Integer; const Value: string);
var
   objCheque   : TMBCheque;
   ds_data     : string;
begin

   if ListaCheques <> nil then
   begin
      //desconsidera a primeira linha que é cabeçalho
      if ARow >= 1 then
      begin
         //recupera o objeto do cheque que está armazenado na coluna 0
         objCheque := (sgGridCheques.Objects[0, ARow] as TMBCheque);

         if objCheque <> nil then
         begin

            // Atribui o valor digitado
            case ACol of
               3 :  //numero do cheque
               begin

                  try
                     objCheque.setValorCampo( 'nr_cheque', sgGridCheques.Cols[ ACol ][ ARow ] );
                  except
                     objCheque.setValorCampo( 'nr_cheque', '' );
                  end;

               end;

               0 :  //numero do banco
               begin

                  try
                     objCheque.setValorCampo( 'nr_banco', sgGridCheques.Cols[ ACol ][ ARow ] );
                  except
                     objCheque.setValorCampo( 'nr_banco', '' );
                  end;

               end;

               1 :  //numero da agencia
               begin

                  try
                     objCheque.setValorCampo( 'nr_agencia', sgGridCheques.Cols[ ACol ][ ARow ] );
                  except
                     objCheque.setValorCampo( 'nr_agencia', '' );
                  end;

               end;

               2 :  //numero da conta
               begin

                  try
                     objCheque.setValorCampo( 'nr_conta', sgGridCheques.Cols[ ACol ][ ARow ] );
                  except
                     objCheque.setValorCampo( 'nr_conta', '' );
                  end;

               end;

               4 :  //valor do cheque
               begin

                  try
                     objCheque.setValorCampo( 'vl_cheque', sgGridCheques.Cols[ ACol ][ ARow ] );
                  except
                     objCheque.setValorCampo( 'vl_cheque', '' );
                  end;

                  Self.atualizaValoresTotais();
                  Self.CalcularTroco();
               end;

               5 :  //data de compensacao do cheque
               begin

                  try
                     ds_data := sgGridCheques.Cols[ ACol ][ ARow ];

                     if Length(ds_data) = 10 then
                     begin

                        if Self.validaData(ds_data) then
                        begin
                           objCheque.setValorCampo( 'dt_compensacao', ds_data );

                           Self.VerificaCalculoJurosCheque();
                           Self.SugereValorCheque();
                           Self.CalcularTroco();
                        end;

                     end;

                  except
                     objCheque.setValorCampo( 'dt_compensacao', '' );
                  end;

               end;

            end;

         end;

      end;
   end;

end;

procedure TfrmMensalidadesBaixar.sgGridParcelasClick(Sender: TObject);
begin
   VerificaValorPago();
end;

procedure TfrmMensalidadesBaixar.sgGridParcelasDrawCell(Sender: TObject; ACol,
  ARow: Integer; Rect: TRect; State: TGridDrawState);
var
   TextoColuna : String;
   valor       : Currency;
   objParcela  : TMBParcela;
begin

   if not (gdFixed in State) then
   begin
      AlinharCheck;
   end;

   //muda a cor da linha quando selecionado.
   if ARow > 0 then
   begin
      objParcela           := (sgGridParcelas.Objects[1,ARow] as TMBParcela);

      if objParcela <> nil then
      begin
         if objParcela.getValorCampo('sn_ativo') = '0' then
         begin
            sgGridParcelas.Canvas.Font.Color    := clblack;//coloque a cor do colordialog
            sgGridParcelas.Canvas.Brush.Color   := clWhite;
         end
         else
         begin
            sgGridParcelas.Canvas.Font.Color    := clblack;//coloque a cor do colordialog
            sgGridParcelas.Canvas.Brush.Color   := $00FFE9D2;
         end;
      end;

      Canvas.Font := sgGridParcelas.Canvas.Font;
      sgGridParcelas.Canvas.FillRect(Rect);
      sgGridParcelas.Canvas.TextOut(Rect.Left+1,Rect.Top+1,sgGridParcelas.Cells[ACol,Arow]);
   end;

   { Alinhar valores a direita }
   TextoColuna := sgGridParcelas.Cells[ACol, ARow];

   if TextoColuna <> '' then
   begin
      if ACol in [4, 5, 6, 7, 8]  then //Coluna a ser alinhada a direita
      begin
         if ARow >= 1 then
         begin
            try
               valor       := StrToCurr(TextoColuna);
               TextoColuna := FloatToStrF(valor, ffFixed, 12, 2);
            except
               TextoColuna := '0,00';
            end;
         end;

         sgGridParcelas.Canvas.FillRect(Rect);
         Rect.Right := Rect.Right - 2; // Espaçamento para texto não grudar na borda do grid
         DrawText(sgGridParcelas.Canvas.Handle, PChar(TextoColuna), Length(TextoColuna), Rect, DT_RIGHT);
      end;
   end;
end;

procedure TfrmMensalidadesBaixar.sgGridParcelasExit(Sender: TObject);
begin
   VerificaValorPago();
   Self.CalcularTroco();
end;

procedure TfrmMensalidadesBaixar.sgGridParcelasKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
   if (key = VK_TAB) and not(baixaRetorno) then
   begin
      chkDinheiro.SetFocus();
   end;

   if Key = VK_SPACE then
   begin
      chkParcelaSelecionada.OnClick( chkParcelaSelecionada );
   end;
end;

procedure TfrmMensalidadesBaixar.sgGridParcelasKeyPress(Sender: TObject;
  var Key: Char);
begin
   //Se for . transforma para virgula
   if(Key in['.']) then
   begin
      Key :=  ',';
   end;
   
   //configura as teclas de numeração e pontuação para digitação no grid
   if not (Key in[ '0'..'9', ',', #8, #13 ]) then
   begin
      Key:= #0;
   end;
   
end;

procedure TfrmMensalidadesBaixar.sgGridParcelasSelectCell(Sender: TObject; ACol,
  ARow: Integer; var CanSelect: Boolean);
var
    objParcela     : TMBParcela;
    sn_ativo       : string;

begin

   //recupera o objeto da parcela que está armazenado na coluna 1
   objParcela  := (sgGridParcelas.Objects[1, ARow] as TMBParcela);
   if ObjParcela <> nil then begin
      sn_ativo    := trim(objParcela.getValorCampo('sn_ativo'));
   end;

   // Não alterar parcelas desmarcadas
   if ( (ACol in [ 0, 1, 2, 3, 4, 7 ] ) OR (sn_ativo = '0') ) then
   begin
      sgGridParcelas.Options := sgGridParcelas.Options - [goEditing];
   end
   else
   begin
      if ACol = 5 then //coluna valor desconto
      begin
         // Permite usuário editar a celula inicialmente
         sgGridParcelas.Options := sgGridParcelas.Options + [goEditing];

         // Se usuário não tiver permissão, não permite mais a edição da celula
         if not DM.UsuarioLogado.TemPermissao( 2043, npAcesso, False ) then
         begin
            sgGridParcelas.Options := sgGridParcelas.Options - [goEditing];
            Exit;
         end;

         // Informa que existem mais de 1 desconto condicional vinculado ao título
         if (objParcela <> nil) and
            (getQdeAcoesDescontosCondicionais(objParcela) > 1) then
         begin
            // Pergunta se ele deseja abrir a tela de gerenciar descontos
            if (Mensagem('O estudante possui mais de um desconto condicional, deseja fazer ajustes sobre a parcela?', 'UNIMESTRE', MB_YESNOCANCEL + MB_ICONQUESTION ) = mrYes) then
            begin
               // Abre a tela de aplicação de vários descontos
               aplicacaoDescontosCondicionais(ACol, ARow, objParcela);
            end;

            // Se usuário possuir mais de 1 parcela não permite ele editar a coluna diretamente
            sgGridParcelas.Options := sgGridParcelas.Options - [goEditing];
            Exit;
         end;

      end
      else if(ACol = 6) then //coluna valor juros
      begin
         if not DM.UsuarioLogado.TemPermissao( 2044, npAcesso, False ) then
         begin
            sgGridParcelas.Options := sgGridParcelas.Options - [goEditing];
            Exit;
         end
         else
         begin
            sgGridParcelas.Options := sgGridParcelas.Options + [goEditing];
         end;
      end
      else if(ACol = 8) then //coluna valor pago
      begin
         if not DM.UsuarioLogado.TemPermissao( 2057, npAcesso, False ) or
            (chkCartao.Checked) then
         begin
            sgGridParcelas.Options := sgGridParcelas.Options - [goEditing];
            Exit;
         end
         else
         begin
            sgGridParcelas.Options := sgGridParcelas.Options + [goEditing];
         end;
      end;
   end;

   //seta a parcela selecionada
   if ARow > 0 then
   begin
      if (sgGridParcelas.Objects[0, ARow] as TCheckBox) <> nil then
      begin
         chkParcelaSelecionada := (sgGridParcelas.Objects[0, ARow] as TCheckBox);
      end;
   end;

   Self.CalcularTroco();
// Não atualizar o valor só pelo fato de ter clicado na grid
//   Self.AtualizaValoresCampos();
end;

procedure TfrmMensalidadesBaixar.sgGridParcelasSetEditText(Sender: TObject;
  ACol, ARow: Integer; const Value: string);
var
   objParcela          : TMBParcela;
   sn_ativo            : string;
   vl_juros            : double;
   vl_juros_fixo       : double;
begin
   //descondierando a primeira linha que é cabeçalho
   if ARow >= 1 then
   begin
      //recupera o objeto da parcela que está armazenado na coluna 1
      objParcela  := (sgGridParcelas.Objects[1, ARow] as TMBParcela);
      sn_ativo    := trim(objParcela.getValorCampo('sn_ativo'));

      //só altera a parcela que estiver ativa
      if sn_ativo = '1' then
      begin

         // Atribui o valor digitado
         case ACol of
            5 :  //coluna valor desconto
            begin

               try
                  objParcela.setValorCampo( 'valordesconto', sgGridParcelas.Cols[ ACol ][ ARow ] );
                  Self.AtualizaValorPago( objParcela, ARow );
                  Self.atualizaValoresTotais();
               except
                  objParcela.setValorCampo( 'valordesconto', '0' );
               end;

            end;

            6 :  //coluna valor juros
            begin

               try
                  objParcela.setValorCampo( 'valorjuros', sgGridParcelas.Cols[ ACol ][ ARow ] );
                  Self.AtualizaValorPago( objParcela, Arow );
                  Self.atualizaValoresTotais();

                  //verifica se o juros foi alterado para setar a flag
                  vl_juros       := StrToFloat( sgGridParcelas.Cols[ ACol ][ ARow ] );
                  vl_juros_fixo  := StrToFloat( objParcela.getValorCampo('valorjuros_fixo') );

                  if vl_juros <> vl_juros_fixo then
                  begin
                     objParcela.setValorCampo('alterou_juros', '1');
                  end
                  else
                  begin
                     objParcela.setValorCampo('alterou_juros', '0');
                  end;
                  

               except
                  objParcela.setValorCampo( 'valorjuros', '0' );
               end;

            end;

            7 :  //coluna valor total
            begin

               try
                  objParcela.setValorCampo( 'valortotal', sgGridParcelas.Cols[ ACol ][ ARow ] );
                  Self.AtualizaValorPago( objParcela, Arow );
                  Self.atualizaValoresTotais();
               except
                  objParcela.setValorCampo( 'valortotal', '0' );
               end;

            end;

            8 :  //coluna valor pago
            begin

               try
                  objParcela.setValorCampo( 'valorpago', sgGridParcelas.Cols[ ACol ][ ARow ] );
                  Self.AtualizaValorPago( objParcela, Arow );
                  Self.atualizaValoresTotais();
               except
                  objParcela.setValorCampo( 'valorpago', '0' );
               end;

            end;

         end;

      end;
   end;
end;

function TfrmMensalidadesBaixar.substituiCaracter(valor, str_antigo,
  str_novo: string): string;
begin
   Result := StringReplace( valor, str_antigo, str_novo, [rfReplaceAll, rfIgnoreCase] );
end;

procedure TfrmMensalidadesBaixar.SugereValorCheque;
var
   vl_dinheiro : double;
   vl_cheque   : double;
   vl_total    : double;
   vl_dinheiro_cheque   : double;
begin
   vl_dinheiro := txtDinheiro.getValorDouble();
   vl_cheque   := txtCheque.getValorDouble();
   vl_total    := txtVlTotal.getValorDouble();
   vl_dinheiro_cheque := vl_cheque + vl_dinheiro;

   if vl_dinheiro_cheque <= vl_total then
   begin
      vl_cheque := vl_total - vl_dinheiro_cheque;
   end;

   txtVlCheque.setValorDouble( FloatToStrF(vl_cheque, ffFixed, 15,2) );
end;

procedure TfrmMensalidadesBaixar.tabParcelasChange(Sender: TObject);
var
   ds_aba_selecionada   : string;
   cd_pessoa            : string;
   nm_pessoa            : string;
   ds_turma             : string;
   nr_anosemestre       : string;
   resultado_filtro     : TResultadoFiltroPessoa;
begin
   objPessoa            := nil;
   ds_aba_selecionada   := tabParcelas.Tabs.Strings[ tabParcelas.TabIndex ];

   if ds_aba_selecionada = ds_buscar then
   begin
      //seta as configurações para o form de busca da pessoa
      resultado_filtro := TfrmSelecionarPessoa.Filtrar([]);

      //atribui o retorno aos campos
      if resultado_filtro.filtrado then
      begin
         cd_pessoa      := IntToStr(resultado_filtro.cd_pessoa);
         nm_pessoa      := resultado_filtro.nm_pessoa;

         //tenta recuperar a turma
         try
            ds_turma       := resultado_filtro.cd_turma;
         except
            ds_turma       := '';
         end;

         //tenta recuperar anosemestre
         try
            nr_anosemestre := IntToStr(resultado_filtro.nr_anosemestre);
         except
            nr_anosemestre := '';
         end;

      end
      else
      begin
         tabParcelas.TabIndex := tabParcelas.TabIndex-1;
      end;

      if trim(cd_pessoa) <> '' then
      begin
         //se a pessoa selecionada ainda não foi adicionada nas abas continua...
         if PessoaExistente( cd_pessoa ) = false then
         begin

            // se os campos de retorno não forem vazios adiciona no objeto
            Self.criaPessoa( cd_pessoa, nm_pessoa, ds_turma, nr_anosemestre );

            Self.carregaAbas();

            //deixa ativo a ultima pessoa selecionada
            tabParcelas.TabIndex := tabParcelas.Tabs.Count - 3;

            AtualizaValoresMensalidades;
         end
         else
         begin
            Mensagem('Essa pessoa já foi selecionada.', 'Atenção', MB_OK + MB_ICONWARNING );
         end;
      end;
   end
   else if ds_aba_selecionada = ds_observacao then
   begin
      edObservacao.Visible    := True;
      sgGridParcelas.Visible  := False;
      limpaBuffer();
      Self.limpaGridParcelas();
   end
   else
   begin
      objPessoa := nil;
      objPessoa := (tabParcelas.Tabs.Objects[tabParcelas.TabIndex] as TMBPessoa);

      Self.carregaGridParcelas(objPessoa);

      objPessoa := nil;

      edObservacao.Visible := False;
      sgGridParcelas.Visible := True;
   end;
end;

procedure TfrmMensalidadesBaixar.tabParcelasMouseDown(Sender: TObject;
  Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
var
   iQtdeAbas : integer;
begin
   iQtdeAbas := tabParcelas.Tabs.Count-1;

   if iQtdeAbas = 0 then
   begin
      tabParcelas.OnChange( nil );
   end;
end;

procedure TfrmMensalidadesBaixar.txtChequeExit(Sender: TObject);
begin
   Self.SugereValorCheque();
end;

procedure TfrmMensalidadesBaixar.txtDataBaixaExit(Sender: TObject);
var
   data_baixa                 : TDateTime;
   objPessoaSel               : TMBPessoa;
   calcula_juros_cheque_pre   : string;
begin
   data_baixa                 := StrToDate(txtDataBaixa.Text);
   calcula_juros_cheque_pre   := DM.variavel_parametro('calcula_juros_cheque_pre');

   if ( chkCheque.Checked = false )
      or (( chkCheque.Checked = true ) and ( calcula_juros_cheque_pre = '0' )) or
      (chkCartao.Checked) then
   begin

      if (data_alterada <> data_baixa)
//      Claudionor Testar or (chkCartao.Checked)
      then
      begin
         data_alterada := data_baixa;
         Self.AtualizaValoresMensalidades();

         //obtem a pessoa selecionada na aba
         objPessoaSel  := (tabParcelas.Tabs.Objects[tabParcelas.TabIndex] as TMBPessoa);

         Self.carregaGridParcelas( objPessoaSel );
         Self.atualizaValoresTotais();

         if chkCartao.Checked then
         begin
            carregaValoresGridCartao;
         end;
      end;

   end;

   Self.CalcularTroco();
end;

procedure TfrmMensalidadesBaixar.txtDataBaixaKeyPress(Sender: TObject;
  var Key: Char);
begin
   if Key = #13 then
   begin
      SelectNext(Sender as TWinControl,true,true);
      Key := #0;
   end;
end;

procedure TfrmMensalidadesBaixar.txtDinheiroExit(Sender: TObject);
begin
   Self.CalcularTroco();
   Self.SugereValorCheque();
end;

procedure TfrmMensalidadesBaixar.txtDtCompensacaoKeyPress(Sender: TObject;
  var Key: Char);
begin
   if Key = #13 then
   begin
      btnInserirClick( nil );
      txtNrBanco.SetFocus();
      Key := #0;
   end;

end;

procedure TfrmMensalidadesBaixar.txtDtCompensacaoKeyUp(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
   if Length( txtDtCompensacao.Text ) = 10 then
   begin

      if Self.validaData(txtDtCompensacao.Text) then
      begin
         Self.VerificaCalculoJurosCheque();
      end;

   end;
end;

procedure TfrmMensalidadesBaixar.txtNrAgenciaKeyPress(Sender: TObject;
  var Key: Char);
begin
   if Key = #13 then
   begin
      SelectNext(Sender as TWinControl,true,true);
      Key := #0;
   end;
end;

procedure TfrmMensalidadesBaixar.txtNrBancoKeyPress(Sender: TObject;
  var Key: Char);
Var
     g_infCheque : TInfCheque;  
begin
   if key = #13 Then
   Begin
      if Copy(txtNrBanco.Text, 1, 1) = '<' then begin
      
        if CMC7Ok(txtNrBanco.Text , g_infCheque) then begin

           txtNrBanco.Text    := g_infcheque.banc;
           txtNrAgencia.Text  := g_infcheque.agen;
           txtNrCC.Text       := g_infcheque.cont;
           txtNrCheque.Text   := g_infcheque.nume;

           btnInserirClick(Sender);

        end else begin

           Application.MessageBox(pchar('Ocorreu um erro durante a leitura do cheque. Tente efetuar novamente a leitura ou digitar manualmente as informações!'),'Aviso', MB_OK + MB_ICONEXCLAMATION) ;
           txtNrBanco.Clear;
           txtNrBanco.SetFocus();

        end;      
      end else begin
         SelectNext(Sender as TWinControl, True, True);
      end;
      Key := #0;
   End;
end;

procedure TfrmMensalidadesBaixar.txtNrCCKeyPress(Sender: TObject;
  var Key: Char);
begin
   if Key = #13 then
   begin
      SelectNext(Sender as TWinControl,true,true);
      Key := #0;
   end;
end;

procedure TfrmMensalidadesBaixar.txtNrChequeKeyPress(Sender: TObject;
  var Key: Char);
begin
   if Key = #13 then
   begin
      SelectNext(Sender as TWinControl,true,true);
      Key := #0;
   end;
end;

procedure TfrmMensalidadesBaixar.txtTrocoKeyPress(Sender: TObject;
  var Key: Char);
begin
   if (key = #13) or (key = #9) Then
   begin
     SelectNext(Sender as TWinControl, True, True);
     Key := #0;

     if btnBaixar.Tag = 0 then
      begin
         btnBaixar.SetFocus();
      end
      else
      begin
         tabParcelas.SetFocus();
      end;
   end;
end;

procedure TfrmMensalidadesBaixar.txtVlTotalChange(Sender: TObject);
begin
   if baixaRetorno then
   begin
      txtTroco.setValor(txtDinheiro.getValor - txtVlTotal.getValor);
   end;
end;

procedure TfrmMensalidadesBaixar.txtVlTotalExit(Sender: TObject);
begin
   Self.CalcularTroco();
end;

procedure TfrmMensalidadesBaixar.txtVlTotalKeyPress(Sender: TObject;
  var Key: Char);
begin
   if key = #13 Then
   begin
      SelectNext(Sender as TWinControl, True, True);
      Key := #0;
   end;
end;

procedure TfrmMensalidadesBaixar.udQtdParcelasClick(Sender: TObject;
  Button: TUDBtnType);
begin
   carregaValoresGridCartao();
end;

function TfrmMensalidadesBaixar.validaCaixa( cd_caixa: string; cd_depto: string; objParcela : TMBParcela ): Boolean;
var
   qyCaixa           : TUMZQuery;
   bResultado        : Boolean;
   dt_abertura       : string;
   dt_atual          : string;
begin
   bResultado        := true;

   DM.CriarConsulta( qyCaixa );

   qyCaixa.Close;
   qyCaixa.SQL.Clear;
   qyCaixa.SQL.Add('SELECT ');
   qyCaixa.SQL.Add(' d.cd_caixa ');
   qyCaixa.SQL.Add('FROM ');
   qyCaixa.SQL.Add(' departamentos d ');
   qyCaixa.SQL.Add('WHERE ');
   qyCaixa.SQL.Add(' d.codigo = :depto ');
   qyCaixa.ParamByName('depto').AsString := cd_depto;
   qyCaixa.Open;

   try
      DM.tblControle.Close;
      DM.tblControle.ParamByName('Situacao').asString       := 'A';
      DM.tblControle.ParamByName('codcaixadepto').AsString  := cd_caixa;
      Dm.tblControle.Open;
   except
      Mensagem( Concat('Para efetuar a baixa deste título é necessário antes ',
      'ter selecionado uma conta válida!'), 'Atenção', MB_OK + MB_ICONWARNING );
      bResultado  := false;
      Result      := bResultado;
      exit;
   end;

   if not DM.tblControle.Eof then
   begin

      if cd_caixa = qyCaixa.FieldByName('cd_caixa').AsString then
      begin
        dt_abertura  := FormatDateTime( 'dd/mm/yyyy', DM.tblControledt_abertura.AsDateTime );
        dt_atual     := FormatDateTime( 'dd/mm/yyyy', StrToDate( Self.getDataHoje() ) );

        if ( dt_abertura <> dt_atual ) then
        begin
            if bBaixarCaixaAberto = false then
            begin
               if Mensagem( Concat( 'Você está baixando uma mensalidade no caixa ',
               'que foi aberto em ', dt_abertura, '.', chr(13), 'Deseja continuar?' ) ,
               'Confirmação', MB_YESNO + MB_ICONQUESTION ) <> mrYes then
               begin
                  bResultado           := false;
                  Result               := bResultado;
                  bBaixarCaixaAberto   := false;
                  exit;
               end
               else
               begin
                  bBaixarCaixaAberto := true;
               end;
            end;
        end;

      end;

   end
   else
   begin
      DM.CriarConsulta( qyCaixa );

      // Vefificar se é uma conta Caixa
      qyCaixa.Close();
      qyCaixa.SQL.Clear;
      qyCaixa.SQL.Add(' SELECT cd_caixa, tp_conta ');
      qyCaixa.SQL.Add(' FROM fin_cadastro_contas ');
      qyCaixa.SQL.Add(' WHERE cd_caixa = :CdCaixa ');

      qyCaixa.ParamByName('CdCAixa').AsString     := cd_caixa;
//      qyCaixa.ParamByName('CdColigada').AsInteger := DM.iColigadaSelecionada;
      
      qyCaixa.Open();

      if qyCaixa.FieldByName('tp_conta').AsInteger = 3 then
      begin
         Mensagem('Não é possível baixar a mensalidade. O caixa está fechado.', 'Atenção', MB_OK);
         bResultado  := false;
         Result      := bResultado;
         exit;
      end
      else
      begin

         // Conta Corrente
         if qyCaixa.FieldByName('tp_conta').AsInteger = 1 then
         begin
            objParcela.setValorCampo( 'usuario', 'RETORNO' );
         end;

      end;

   end;

   if qyCaixa <> nil then
   begin
      FreeAndNil( qyCaixa );
   end;

   Result := bResultado;
end;

function TfrmMensalidadesBaixar.validaMensalidade(
  objParcela: TMBParcela): Boolean;
var
   situacao_mensalidade : integer;
   bResultado           : Boolean;
   nr_anosemestre       : string;
   ds_turma             : string;
   cd_pessoa            : string;
begin
   bResultado           := true;
   situacao_mensalidade := StrToInt( objParcela.getValorCampo('situacao') );
   cd_pessoa            := objParcela.getValorCampo('codigoaluno');
   ds_turma             := objParcela.getValorCampo('turma');
   nr_anosemestre       := objParcela.getValorCampo('anosemestre');

   case situacao_mensalidade of

      0..1 :
      begin
         Mensagem( 'Mensalidade já baixada.',           Application.Title,
         MB_OK + MB_ICONEXCLAMATION );
         bResultado  := false;
         Result      := bResultado;
         Exit;
      end;

      4 :
      begin
         Mensagem( 'Mensalidade já foi cancelada.',     Application.Title,
         MB_OK + MB_ICONEXCLAMATION );
         bResultado  := false;
         Result      := bResultado;
         Exit;
      end;

      5 :
      begin
         Mensagem( 'Mensalidade já foi cancelada.',     Application.Title,
         MB_OK + MB_ICONEXCLAMATION );
         bResultado  := false;
         Result      := bResultado;
         Exit;
      end;

      6 :
      begin
         Mensagem( 'Mensalidade baixada por Desconto.', Application.Title,
         MB_OK + MB_ICONEXCLAMATION );
         bResultado  := false;
         Result      := bResultado;
         Exit;
      end;

      7 :
      begin
         Mensagem( 'Mensalidade já foi cancelada.',     Application.Title,
         MB_OK + MB_ICONEXCLAMATION );
         bResultado  := false;
         Result      := bResultado;
         Exit;
      end;

   end;

   if trim(cd_pessoa) = '' then
   begin
      Mensagem( 'Não foi possível recuperar o código do aluno relacionado a mensalidade.', Application.Title,
      MB_OK + MB_ICONEXCLAMATION );
      bResultado  := false;
      Result      := bResultado;
      Exit;
   end;

   Result := bResultado;

end;

function TfrmMensalidadesBaixar.validaValoresCartaoGrid: Boolean;
var
   valorGrid: Currency;
   i: Integer;
begin
   Result := False;

   valorGrid := 0;

   for I := 1 to sgParcelasCartao.RowCount - 1 do
   begin
      valorGrid := valorGrid + StrToFloat(sgParcelasCartao.Cols[2][i]);
   end;

   Result := valorGrid = txtVlTotal.getValorDouble;
end;

procedure TfrmMensalidadesBaixar.VerificaCalculoJurosCheque;
var
   calcula_juros_cheque_pre   : string;
   parcela_vencida            : boolean;
begin
   if chkCheque.Checked = true then
   begin

      calcula_juros_cheque_pre := DM.variavel_parametro('calcula_juros_cheque_pre');

      if calcula_juros_cheque_pre = '1' then
      begin
      
         //o sistema verifica em todas as parcelas de todas as pessoas se a
         //data de compensação de cheque é maior que o vencimento de uma delas.
         parcela_vencida := Self.IdentificaCompensacaoMaiorVencimento();

         if parcela_vencida = true then
         begin

            //verifica se a permissão para que o usuário escolha entre aplicar
            //ou não o juros nas parcelas
            if DM.UsuarioLogado.TemPermissao( 2081, npAcesso, false ) then
            begin

               if (data_compensacao <> Self.getDataCompensacaoCheque() ) or (data_compensacao = 0) then
               begin
                  if (pergunta_juros_cheques = false) then
                  begin

                     if Mensagem( 'O sistema identificou que a data de compensação é '+
                     'maior que a data de vencimento da(s) parcela(s) selecionada(s). '+
                     'Deseja Calcular e Adicionar o Juros?',
                     'Atenção', MB_YESNO + MB_ICONINFORMATION ) = MrYes then
                     begin
                        recalcula_juros := true;

                        data_compensacao := Self.getDataCompensacaoCheque();
                     end
                     else
                     begin
                        recalcula_juros := false;

                        data_compensacao := Self.getDataCompensacaoCheque();
                     end;

                     pergunta_juros_cheques := true;
                  end;

               end;

            end
            else
            begin

               recalcula_juros      := true;

            end;

         end;

      end;

   end;

   if recalcula_juros = true then
   begin
      Self.AtualizaJurosParcelas();
   end;

end;

procedure TfrmMensalidadesBaixar.VerificaPgtoPorCheque;
var
   vl_cheque   : double;
   objCheque   : TMBCheque;
   nr_cheque   : string;
   nr_banco    : string;
   nr_agencia  : string;
   nr_conta    : string;
   dt_comp     : string;
   cd_caixa    : string;
   nm_titular  : string;
begin
   nr_cheque   := txtNrCheque.Text;
   nr_banco    := txtNrBanco.Text;
   nr_agencia  := txtNrAgencia.Text;
   nr_conta    := txtNrCC.Text;
   vl_cheque   := txtVlCheque.getValorDouble;
   dt_comp     := txtDtCompensacao.Text;
   nm_titular  := ednm_titular.text;

   //recupera o cd_caixa da conta selecionada.
   if cmbContaCaixa.ItemIndex > -1 then
   begin
      cd_caixa := (cmbContaCaixa.Items.Objects[ cmbContaCaixa.itemIndex ] as TItemComboMCaixa).getCodigo();
   end;

   //se não houver lista de cheques mas houver um valor a ser pago no cheque
   //inclui esse valor na lista de cheques para cadastro na tabela.
   if (ListaCheques = nil) and (vl_cheque <> 0) then
   begin
      ListaCheques   := TObjectList.Create();
      objCheque      := TMBCheque.Create();

      objCheque.setValorCampo( 'nr_cheque',        nr_cheque   );
      objCheque.setValorCampo( 'nr_banco',         nr_banco    );
      objCheque.setValorCampo( 'nr_agencia',       nr_agencia  );
      objCheque.setValorCampo( 'nr_conta',         nr_conta    );
      objCheque.setValorCampo( 'vl_cheque',        substituiCaracter( FloatToStr(vl_cheque), ',', '.'));
      objCheque.setValorCampo( 'dt_compensacao',   dt_comp     );
      objCheque.setValorCampo( 'nm_titular',       nm_titular  );

      ListaCheques.Add( objCheque );
   end;

end;

function TfrmMensalidadesBaixar.VerificaTalaoDeposito: boolean;
const
   SQL_VERIFICA_TALAO_DEPOSITO_TALAO_EXISTENTE =
      ' SELECT p.nm_pessoa, m.datapagamento, m.valorpago ' +
      ' FROM mensalidades m ' +
      '      INNER JOIN pessoas p ON ( m.codigoaluno = p.cd_pessoa ) ' +
      ' WHERE m.ds_deposito = :ds_deposito ';
var
   qyPesquisa              : TUMZReadOnlyQuery;
   valor_talao_deposito    : string;
   mensagem_pergunta       : string;
begin
   Result := True;
   valor_talao_deposito := Trim( edtTalaoDepos.Text );
   
   if ( not chkTD.Checked ) then
   begin
      Exit;
   end
   else if ( valor_talao_deposito = '' ) then
   begin
      Mensagem( 'Nº do talão de depósito deve ser preenchido.' );
      edtTalaoDepos.SetFocus();

      Result := False;
      Exit;
   end;

   DM.CriarConsulta( qyPesquisa );
   qyPesquisa.SQL.Text := SQL_VERIFICA_TALAO_DEPOSITO_TALAO_EXISTENTE;
   qyPesquisa.ParamByName( 'ds_deposito' ).AsString := valor_talao_deposito;
   qyPesquisa.Open();

   if qyPesquisa.RecordCount > 0 then
   begin
      mensagem_pergunta := 'Este talão de depósito já foi utilizado para baixar o(s) seguinte(s) título(s): ' + Chr(13) + Chr(13);

      while not qyPesquisa.Eof do
      begin
         mensagem_pergunta := mensagem_pergunta + FillString(qyPesquisa.FieldByName('nm_pessoa').AsString, alLeft, ' ', 35, false);
         mensagem_pergunta := mensagem_pergunta + '  ' + FormatDateTime('dd/mm/yyyy', qyPesquisa.FieldByName('datapagamento').AsDateTime);
         mensagem_pergunta := mensagem_pergunta + '  ' + Format( '%8.2n', [qyPesquisa.FieldByName('valorpago').AsCurrency] );
         mensagem_pergunta := mensagem_pergunta + Chr(13);

         qyPesquisa.Next;
      end;

      mensagem_pergunta := mensagem_pergunta + Chr(13) + Chr(13) +
                           'Deseja continuar a baixa com o mesmo número de depósito?';

      if Mensagem(mensagem_pergunta, 'UNIMESTRE', MB_YESNO + MB_DEFBUTTON2 + MB_ICONQUESTION) <> mrYes then
      begin
         edtTalaoDepos.SetFocus();
         Result := False;
      end;
   end;

   FreeAndNil( qyPesquisa );     
end;

function TfrmMensalidadesBaixar.VerificaValores: boolean;
var
   vl_dinheiro    : double;
   vl_cheque      : double;
   vl_total       : double;
   vl_soma        : double;
   bResultado     : boolean;
begin
   bResultado     := true;

   //verifica se o valor pago bate com o total das mensalidades
   vl_dinheiro    := RoundFloat( txtDinheiro.getValorDouble(), 2  );
   vl_cheque      := RoundFloat( txtCheque.getValorDouble(),   2  );
   vl_total       := RoundFloat( txtVlTotal.getValorDouble(),  2  );

   if (chkDinheiro.Checked = true) and (chkCheque.Checked = true) then
   begin
      vl_soma     := (vl_dinheiro + vl_cheque);
      vl_soma     := RoundFloat( vl_soma, 2 );

      if vl_soma < vl_total then
      begin
         bResultado  := false;
         Result      := bResultado;
         exit;
      end;
   end
   else
   if chkDinheiro.Checked = true then
   begin
      if vl_dinheiro < vl_total then
      begin
         bResultado  := false;
         Result      := bResultado;
         exit;
      end;
   end
   else if chkCheque.Checked = true then
   begin
      if vl_cheque < vl_total then
      begin
         bResultado  := false;
         Result      := bResultado;
         exit;
      end;
   end;

   Result      := bResultado;
end;

procedure TfrmMensalidadesBaixar.VerificaValorPago;
var
   I: Integer;
   bConvert : boolean;
   cValor : Extended;
begin
   for I := 1 to sgGridParcelas.RowCount - 1 do
   begin
      if (sgGridParcelas.Objects[0,i] as TCheckBox).Checked then
      begin

         if trim(sgGridParcelas.Cols[ 8 ][ i ]) <> '' then
         begin
            sgGridParcelas.Cols[ 8 ][ i ]:= FloatToStrF(StrToFloat(sgGridParcelas.Cols[ 8 ][ i ]), ffFixed, 12, 2);
         end;
         
         bConvert:= TryStrToFloat(trim(sgGridParcelas.Cells[8, I]), cValor);
         if  ((not bConvert) or ( cValor = 0.0 )) then
         begin
            SetGridFocus( sgGridParcelas, I, 8 );
            Break;
         end;
      end;
   end;
end;

procedure TfrmMensalidadesBaixar.AtualizaJurosCompensacao;
var
   iPessoa        : integer;
   iParcela       : integer;
   objParcela     : TMBParcela;
   ListaParcelas  : TObjectList;
   qyGetValores   : TUMZQuery;
   vl_acrescimo   : double;
   vl_desconto    : double;
   cd_mensalidade : integer;
   data_pgto      : TDate;
   data_pgto_mysql: string;
   vl_pago        : double;
begin
   DM.CriarConsulta( qyGetValores );
   data_pgto         := Self.getDataCompensacaoCheque();
   data_pgto_mysql   := FormatDateTime('yyyy-mm-dd', data_pgto);

   //percorre a lista de pesso
   for iPessoa := 0 to ListaPessoas.Count - 1 do
   begin
      objPessoa := (ListaPessoas.items[iPessoa] as TMBPessoa);

      //recupera a lista de parcela da pessoa corrente
      ListaParcelas := objPessoa.getListaParcelas();

      //se  alista de parcelas existir continuar
      if ListaParcelas <> nil then
      begin

         for iParcela := 0 to ListaParcelas.Count - 1 do
         begin
            objParcela     := (ListaParcelas.items[iParcela] as TMBParcela);
            cd_mensalidade := StrToInt( objParcela.getValorCampo('cd_mensalidade') );

            //GET ACRESCIMOS
            qyGetValores.Close();
            qyGetValores.SQL.Clear();
            qyGetValores.Params.Clear();
            qyGetValores.SQL.Add( 'SELECT GET_ACRESCIMOS( :cd_mensalidade, :data_pgto_mysql ) AS acrescimo' );
            qyGetValores.ParamByName('cd_mensalidade').AsInteger  := cd_mensalidade;
            qyGetValores.ParamByName('data_pgto_mysql').AsString  := data_pgto_mysql;
            qyGetValores.Open;
            vl_acrescimo := qyGetValores.FieldByName('acrescimo').AsFloat +
                            StrToFloat(objParcela.getValorCampo('valorjuros_fixo'));
            qyGetValores.Close();

            //GET DESCONTOS
            qyGetValores.Close();
            qyGetValores.SQL.Clear();
            qyGetValores.Params.Clear();
            qyGetValores.SQL.Add( 'SELECT GET_DESCONTOS( :cd_mensalidade, :data_pgto_mysql ) AS desconto' );
            qyGetValores.ParamByName('cd_mensalidade').AsInteger  := cd_mensalidade;
            qyGetValores.ParamByName('data_pgto_mysql').AsString  := data_pgto_mysql;
            qyGetValores.Open;
            vl_desconto := qyGetValores.FieldByName('desconto').AsFloat;
            qyGetValores.Close();

            objParcela.setValorCampo( 'juros_calc',      FloatToStrF( vl_acrescimo, ffFixed, 15, 2)   );
            objParcela.setValorCampo( 'desconto_calc',   FloatToStrF( vl_desconto,  ffFixed, 15, 2)   );
            objParcela.setValorCampo( 'valordesconto',   objParcela.getValorCampo('desconto_calc')    );
            objParcela.setValorCampo( 'valorjuros',      objParcela.getValorCampo('juros_calc')       );

            if objParcela.getValorCampo('sn_ativo') = '1' then
            begin
               vl_pago := Self.getValorPago( objParcela );
               objParcela.setValorCampo('valorpago',     FloatToStrF( vl_pago, ffFixed, 15, 2 ) );
               objParcela.setValorCampo('valortotal',    FloatToStrF( vl_pago, ffFixed, 15, 2 ) );
            end;

         end;

      end;

   end;

   FreeAndNil( qyGetValores );

end;

procedure TfrmMensalidadesBaixar.AtualizaJurosParcelas;
var
   objPessoaSel   : TMBPessoa;
   objCheque      : TMBCheque;
   vl_total_cheques : Currency;
begin
   Self.AtualizaJurosCompensacao();

   //obtem a pessoa selecionada na aba
   objPessoaSel   := (tabParcelas.Tabs.Objects[tabParcelas.TabIndex] as TMBPessoa);

   Self.carregaGridParcelas( objPessoaSel );

   Self.atualizaValoresTotais();

   // se na lista de cheques contar apenas 1 cheque então altera o valor do cheque também
   if (chkCheque.Checked = true) and (chkDinheiro.Checked = false) then
   begin
      if ListaCheques <> nil then
      begin
         if ListaCheques.Count = 1 then
         begin
            objCheque := (ListaCheques.items[0] as TMBCheque);
            objCheque.setValorCampo( 'vl_cheque', txtVlTotal.getValorString() );

            vl_total_cheques  := Self.getValorTotalCheques();
            txtCheque.setValorDouble( FloatToStr(vl_total_cheques) );

            Self.carregaGridCheques();
            Self.SugereValorCheque();
         end;
      end;
   end;
end;

procedure TfrmMensalidadesBaixar.AtualizaValoresMensalidades;
var
   iPessoa        : integer;
   iParcela       : integer;
   objParcela     : TMBParcela;
   ListaParcelas  : TObjectList;
   qyGetValores   : TUMZQuery;
   vl_acrescimo   : double;
   vl_desconto    : double;
   vl_nominal     : double;
   vl_total       : double;
   cd_mensalidade : integer;
   data_pgto      : TDateTime;
   data_pgto_mysql: string;
   vl_pago        : double;
begin
   DM.CriarConsulta( qyGetValores );
   data_pgto         := StrToDate( txtDataBaixa.Text );
   data_pgto_mysql   := FormatDateTime('yyyy-mm-dd', data_pgto);

   //percorre a lista de pesso
   for iPessoa := 0 to ListaPessoas.Count - 1 do
   begin
      objPessoa := (ListaPessoas.items[iPessoa] as TMBPessoa);

      //recupera a lista de parcela da pessoa corrente
      ListaParcelas := objPessoa.getListaParcelas();

      //se  alista de parcelas existir continuar
      if ListaParcelas <> nil then                           
      begin

         for iParcela := 0 to ListaParcelas.Count - 1 do
         begin
            objParcela     := (ListaParcelas.items[iParcela] as TMBParcela);
            cd_mensalidade := StrToInt( objParcela.getValorCampo('cd_mensalidade') );

            //GET ACRESCIMOS, GET_DESCONTOS
            qyGetValores.Close();
            qyGetValores.SQL.Clear();
            qyGetValores.Params.Clear();
            qyGetValores.SQL.Add( ' SELECT GET_ACRESCIMOS( :cd_mensalidade, :data_pgto_mysql ) AS acrescimo, '+
                                  '        GET_DESCONTOS( :cd_mensalidade, :data_pgto_mysql ) AS desconto' );
            qyGetValores.ParamByName('cd_mensalidade').AsInteger  := cd_mensalidade;
            qyGetValores.ParamByName('data_pgto_mysql').AsString  := data_pgto_mysql;
            qyGetValores.Open;
            vl_acrescimo := qyGetValores.FieldByName('acrescimo').AsFloat +
                            StrToFloat(objParcela.getValorCampo('valorjuros_fixo'));
            vl_desconto := qyGetValores.FieldByName('desconto').AsFloat;
            qyGetValores.Close();

            // Valor Nominal e Valor Total
            qyGetValores.Close();
            qyGetValores.SQL.Clear();
            qyGetValores.Params.Clear();
            qyGetValores.SQL.Add( ' SELECT (valorbruto + COALESCE(valorextra, 0) - COALESCE(descontoextra, 0)) vl_nominal, '+
                                  '        (valorbruto + COALESCE(valorextra, 0) - COALESCE(descontoextra, 0)) - GET_DESCONTOS(cd_mensalidade,  :data_pgto_mysql ) + (COALESCE(valorjuros, 0) + GET_ACRESCIMOS(cd_mensalidade, :data_pgto_mysql )) valortotal '+
                                  ' FROM mensalidades WHERE cd_mensalidade = :cd_mensalidade ' );
            qyGetValores.ParamByName('cd_mensalidade').AsInteger  := cd_mensalidade;
            qyGetValores.ParamByName('data_pgto_mysql').AsString  := data_pgto_mysql;
            qyGetValores.Open;
            vl_nominal := qyGetValores.FieldByName('vl_nominal').AsFloat;
            vl_total := qyGetValores.FieldByName('valortotal').AsFloat;
            qyGetValores.Close();

            objParcela.setValorCampo( 'juros_calc',      FloatToStrF( vl_acrescimo, ffFixed, 15, 2)   );
            objParcela.setValorCampo( 'desconto_calc',   FloatToStrF( vl_desconto,  ffFixed, 15, 2)   );
            objParcela.setValorCampo( 'valordesconto',   objParcela.getValorCampo('desconto_calc')    );
            objParcela.setValorCampo( 'valorjuros',      objParcela.getValorCampo('juros_calc')       );

            objParcela.setValorCampo( 'vl_nominal',      FloatToStrF( vl_nominal, ffFixed, 15, 2)   );
            objParcela.setValorCampo( 'valortotal',      FloatToStrF( vl_total,  ffFixed, 15, 2)   );

            if objParcela.getValorCampo('sn_ativo') = '1' then
            begin
               vl_pago := Self.getValorPago( objParcela );
               objParcela.setValorCampo('valorpago',     FloatToStrF( vl_pago, ffFixed, 15, 2 ) );
               objParcela.setValorCampo('valortotal',    FloatToStrF( vl_pago, ffFixed, 15, 2 ) );
            end;


         end;

      end;

   end;

   FreeAndNil( qyGetValores );
end;

procedure TfrmMensalidadesBaixar.atualizaValoresTotais;
var
   vl_total_parcelas : double;
   vl_total_cheques  : double;
begin
   vl_total_parcelas := Self.getValorTotalParcelas();
   vl_total_cheques  := Self.getValorTotalCheques();

   txtVlTotal.setValorDouble( FloatToStr(vl_total_parcelas) );

   if chkCartao.Checked then
   begin
      txtCartao.setValorDouble( FloatToStr(vl_total_parcelas) );
   end;

   if (chkDinheiro.Checked = true) and (chkCheque.Checked = true) then
   begin
      if(vl_total_parcelas >= vl_total_cheques) then
      begin
         if not(baixaRetorno) then
         begin
            txtDinheiro.setValorDouble( FloatToStr(vl_total_parcelas - vl_total_cheques) );
         end;
      end
      else if (vl_total_parcelas <= vl_total_cheques) then
      begin
         Self.CalcularTroco();
      end
      else
      begin
         if not(baixaRetorno) then
         begin
            txtDinheiro.setValorDouble( FloatToStr(vl_total_parcelas) );
         end;
      end;

      txtCheque.setValorDouble( FloatToStr(vl_total_cheques) );
      Self.SugereValorCheque();
   end
   else if( chkDinheiro.Checked = true ) and (chkCheque.Checked = false) then
   begin
      if not(baixaRetorno) then
      begin
         txtDinheiro.setValorDouble( FloatToStr(vl_total_parcelas) );
      end;
   end
   else if( chkCheque.Checked = true ) and (chkDinheiro.Checked = false) then
   begin
      txtCheque.setValorDouble( FloatToStr(vl_total_cheques) );
      Self.SugereValorCheque();
   end;

   if baixaRetorno and (txtDinheiro.getValorDouble = txtVlTotal.getValorDouble) then
   begin
      btnBaixar.Tag := 0;
      btnBaixar.Font.Color := clBlack;

      txtTroco.setValor(txtDinheiro.getValor - txtVlTotal.getValor);
   end
   else if baixaRetorno then
   begin
      btnBaixar.Tag := 1;
      btnBaixar.Font.Color := clGrayText;

      txtTroco.setValor(txtDinheiro.getValor - txtVlTotal.getValor);
   end;

   btnBaixar.Refresh;
end;

procedure TfrmMensalidadesBaixar.AtualizaValorPago( objParcela : TMBParcela; iLinha : integer);
var
   vl_pago : double;
begin
   { Estava impedindo a digitação de valor para pagamento. removido por marcelo e bruno em 26/01/2012 oc 31706    }
   if objParcela <> nil then
   begin

      vl_pago := Self.getValorPago( objParcela );

      // O valor a ser pago não foi alterado, então sistema sugere pagar o valor total
      if( objParcela.getValorCampo('valorpago') = objParcela.getValorCampo('valortotal')) then
      begin
         objParcela.setValorCampo( 'valorpago', FloatToStrF( vl_pago, ffFixed, 15, 2) );
         objParcela.setValorCampo( 'valortotal', FloatToStrF( vl_pago, ffFixed, 15, 2 ) );

         sgGridParcelas.Cols[ 8 ][ iLinha ] := objParcela.getValorCampo('valorpago');
         sgGridParcelas.Cols[ 7 ][ iLinha ] := objParcela.getValorCampo('valortotal');
      end
      // Já defini manualmente o valor a ser pago, não é mais o mesmo que o valor total calculado automaticamente
      else
      begin
         objParcela.setValorCampo( 'valortotal', FloatToStrF( vl_pago, ffFixed, 15, 2 ) );
         sgGridParcelas.Cols[ 7 ][ iLinha ] := objParcela.getValorCampo('valortotal');
      end;
   end;
end;

class procedure TfrmMensalidadesBaixar.AutenticarMensalidade(sMascara: String; objParcela: TMBParcela);
Var
   nro_aut  : integer;
   i        : integer;
   arquivo  : TextFile;

   strAut   : String;
   campo    : string;

   linha    : string;
   n        : Integer;
   bEnterNaUltima : Boolean;
begin

   try
       nro_aut := StrToInt(DM.variavel_parametro('financeiro_qtd_autenticacao_baixa'));
   except
       nro_aut := 0;
   end;

   if nro_aut = 0 then
   begin
      Exit;
   end;

   if nro_aut = -1 then
   begin
      nro_aut := 1;
   end;

   i := 0;

   // A mascara pode ser passada na chamada da função... (caso de estorno).. se não passar assumir
   // o parametro financeiro_autenticacao_campos
   if sMascara = ''  then
   begin
      strAut := DM.variavel_parametro('financeiro_autenticacao_campos')
   end
   else
   begin
      strAut := sMascara;
   end;

   if Pos('[ENTER]', strAut) > 0 then begin
       bEnterNaUltima := true;
       strAut := ReplaceStr(strAut, '[ENTER]', ''); // Retirar a string ENTER
   end else begin
       bEnterNaUltima := false;
   end;

   { String Padrão }
   if trim(strAut) = '' then
   begin
      strAut := 'UNIMESTRE[codigoaluno][parcela][nossonumero][datapagamento][valorpago][situacao]';
   end;

   while i < nro_aut do
   begin
      INC(I);

      if Mensagem(Concat('Posicione o papel para autenticação ', IntToStr(i),
      ' do título:', chr(13), 'Vencimento: ', objParcela.getValorCampo('datavencimento'), chr(13),
      'Valor Pago: ', objParcela.getValorCampo('valorpago') ), 'Confirmação', MB_YESNO + MB_ICONQUESTION)
      <> mrYes then
      begin
         Exit;
      end;

      linha := '';

      { Verificar linha de Autenticação }

      n := 1;

      while n <= Length(strAut) do
      begin

         if strAut[n] = '[' then
         begin

            campo := '';
            inc(n);

            while strAut[n] <> ']' do
            begin
               campo := campo + strAut[n];
               inc(n);
            end;

            linha := linha + objParcela.getValorCampo(campo);
         end
         else
         begin
            linha := linha + strAut[n];
         end;

         inc(n);

      end;

      if Pos('#13', linha) > 0 then
      begin
         linha := StringReplace(linha, '#13', CHR(13), [rfReplaceAll]);
      end;

      { Abrir o arquivo ou Porta }
      //
      try
         AssignFile(arquivo, DM.variavel_parametro('impressao_matricial_porta'));
         Rewrite(arquivo);

         write(arquivo, chr(13));
         Write(arquivo, linha);
         write(arquivo, chr(13));

         if bEnterNaUltima AND (i = nro_aut) then begin
            Writeln(arquivo, '');
         end;

         CloseFile(arquivo);
      except
         Mensagem('Não foi possível encontrar a impressora de autenticação.', 'Erro', MB_OK + MB_ICONERROR);
      end;

   end;

end;

procedure TfrmMensalidadesBaixar.BaixaPorCartao;
var
   codOperacao: Integer;
begin
   {distribui os valores pagos em DINHEIRO ou CHEQUE entre as mensalidades}
   Self.MontaBaixaMensalidade();

   {Efetua a baixa da mensalidade}
   Self.BaixarMensalidades();

   {Salva os registros necessários para baixa com cartão de crédito}
   codOperacao := Self.salvaOperacaoCartao;
   
   Self.salvaParcelasCartao(codOperacao);
   Self.salvaOperacaoMensalidades(codOperacao);

   {Impressão de recibos da baixa}
   Self.ConcluirBaixaMensalidades();

   //fecha a tela de baixa de mensalidade
   ModalResult := mrOk;
   Self.Close();
end;

procedure TfrmMensalidadesBaixar.BaixaPorDinheiroCheque;
begin
   //adiciona o valor do cheque na lista de cheques
   //essa função funciona quando o usuário digita os valores do cheque mas não clica no botão Adicionar.
   Self.VerificaPgtoPorCheque();

   //cadastra todos os cheques utilizados para o pagamento das mensalidades
   if chkCheque.Checked = true then
   begin
      Self.CadastrarCheques();
   end;

   //distribui os valores pagos em DINHEIRO ou CHEQUE entre as mensalidades
   Self.MontaBaixaMensalidade();

   //cria o form para confirmação do pagamento das mensalidades
   Application.CreateForm( TfrmMBConfirmacaoBaixa, frmMBConfirmacaoBaixa );
   frmMBConfirmacaoBaixa.setListaMensalidades( ListaMensalidadesBaixa );
   frmMBConfirmacaoBaixa.setListaChequesMensalidades( ListaChequesMensalidades );
   frmMBConfirmacaoBaixa.setListaCheques( ListaCheques );
   frmMBConfirmacaoBaixa.setValorTotal( txtVlTotal.getValorDouble );

   if frmMBConfirmacaoBaixa.validaValores() then
   begin
      Self.BaixarMensalidades();

      Self.InserirMensalidadeCheque();

      Self.ConcluirBaixaMensalidades();

      //fecha a tela de baixa de mensalidade
      ModalResult := mrOk;
      Self.Close();
   end
   else
   begin
      Mensagem('Atenção' + CHR(13) + CHR(13) + 'O sistema gerou uma inconsistência na distribuição dos ' +
      'valores. Por favor, Entre em contato com o suporte.', 'UNIMESTRE', MB_OK + MB_ICONERROR);
   end;
end;

procedure TfrmMensalidadesBaixar.BaixarMensalidades;
var
   i, cd_coligada       : integer;
   objMensalidadeBaixar : TMBMensalidadeBaixa;
   qryDadosMensalidade  : TUMZQuery;
   cd_caixa             : string;
   valor_desconto       : Double;
   MensalidadeDaParcela : Boolean;
   dt_credito, separador: String;
   iPercDiffDesconto    : Currency;
begin
   DM.CriarConsulta(qryDadosMensalidade);

   separador := '';

   { nunca trocar a coligada da mensalidade
   cd_coligada := (cmbContaCaixa.Items.Objects[ cmbContaCaixa.itemIndex ] as TItemComboMCaixa).getCdColigada();

   //apenas por garantia se a coligada for zero utiliza a selecionada
   if cd_coligada = 0 then
   begin
      MensalidadeDaParcela := True;
   end;
   }

   MensalidadeDaParcela := True;   

   if ListaMensalidadesBaixa <> nil then
   begin
      if cmbContaCaixa.ItemIndex > -1 then
      begin
         cd_caixa := (cmbContaCaixa.Items.Objects[ cmbContaCaixa.itemIndex ] as TItemComboMCaixa).getCodigo();
      end;

      for i := 0 to ListaMensalidadesBaixa.Count - 1 do
      begin
         objMensalidadeBaixar := ( ListaMensalidadesBaixa.items[i] as TMBMensalidadeBaixa );

         qryDadosMensalidade.Close;
         qryDadosMensalidade.SQL.Text := '                     '+
            ' SELECT                                           '+
            '    codigoaluno cd_pessoa, cd_coligada,           '+
            '    valordesconto                                 '+
            ' FROM                                             '+
            '    mensalidades                                  '+
            ' WHERE                                            '+
            '    cd_mensalidade = :cd_mensalidade              ';
         qryDadosMensalidade.ParamByName('cd_mensalidade').AsInteger := StrToInt(objMensalidadeBaixar.getValorCampo('cd_mensalidade'));
         qryDadosMensalidade.Open;

         if MensalidadeDaParcela then
            cd_coligada := qryDadosMensalidade.FieldByName('cd_coligada').AsInteger;

         if objMensalidadeBaixar.getValorCampo('valordesconto') = '' then
         begin
            valor_desconto := 0;
         end else begin
            valor_desconto := StrToFloat(objMensalidadeBaixar.getValorCampo('valordesconto'));
         end;

         // Recálcula o percentual de desconto das ações de movimento da mensalidade com relação ao valor informado
         DM.recalcularDescCondicionalAcoesMovimento(
            StrToInt( objMensalidadeBaixar.getValorCampo('cd_mensalidade') ),
            qryDadosMensalidade.FieldByName('valordesconto').AsCurrency,
            valor_desconto
         );

         //dt_credito := '';

         if baixaRetorno then
         begin
            dt_credito := DateTimeToString(data_credito_retorno);
         end;

         DM.BaixarRecebimento(
            StrToInt( objMensalidadeBaixar.getValorCampo('cd_mensalidade') ),
            StrToFloat( objMensalidadeBaixar.getValorCampo('valorjuros_fixo') ),
            StrToDate( objMensalidadeBaixar.getValorCampo('datapagamento')    ),
            StrToFloat( objMensalidadeBaixar.getValorCampo('valorjuros')      ),
            valor_desconto,
            StrToFloat( objMensalidadeBaixar.getValorCampo('valorpago')       ),
            StrToFloat( objMensalidadeBaixar.getValorCampo('vl_pago_cheque')  ),
            StrToFloat( objMensalidadeBaixar.getValorCampo('vl_pago_dinheiro')),
            StrToInt(cd_caixa),
            '',
            cd_coligada,
            StrToBool( objMensalidadeBaixar.getValorCampo('alterou_juros')    ),
            '',
            objMensalidadeBaixar.getValorCampo('ds_deposito'),
            edObservacao.text,
            dt_credito,
            baixaRetorno
         );

         qryDadosMensalidade.Close;
         qryDadosMensalidade.ParamByName('cd_mensalidade').AsInteger := StrToInt(objMensalidadeBaixar.getValorCampo('cd_mensalidade'));
         qryDadosMensalidade.Open;

         // Verifica se a mensalidade possui desconto condicional (após a baixa), se possuir significa que o desconto foi aplicado
         if (qryDadosMensalidade.FieldByName('valordesconto').AsCurrency > 0) then
         begin
            // Ganha os descontos condicionais por pagamento em dia
            DM.aplicaAcoesMovimentoDescontosCondicionais(StrToInt( objMensalidadeBaixar.getValorCampo('cd_mensalidade') ));
         end;

         mensalidades_baixadas :=
            mensalidades_baixadas +
            separador +
            objMensalidadeBaixar.getValorCampo('cd_mensalidade');

         separador := ', ';   

        if (DM.variavel_nu_parametro('UMFinanceiro.Financeiro.Negocia.PreAcordo',0) = '1' ) then
        begin
           dm.ComfirmarNegociacaoBaixa( StrToInt( objMensalidadeBaixar.getValorCampo('cd_mensalidade') ) );
           DM.LimpaMensaNegociacaoPaga( StrToInt( objMensalidadeBaixar.getValorCampo('cd_mensalidade') ), qryDadosMensalidade.FieldByName('cd_pessoa').AsInteger )
        end;
      end;

   end;
   FreeAndNil(qryDadosMensalidade);
end;

function TfrmMensalidadesBaixar.validaData( ds_data:string ) : Boolean;
//valida data no formato dma = 10/10/2012.
var
   dt_data_valida : TDateTime;
begin
   Result := TryStrToDate(ds_data, dt_data_valida);
end;

function TfrmMensalidadesBaixar.getQdeAcoesDescontosCondicionais(objParcela: TMBParcela): Integer;
const
   SQL_ACOES_MOVIMENTO_CONDICIONAIS =
      ' SELECT ' +
      '   COUNT(*) nr_acoes ' +
      ' FROM ' +
      ' 	fin_mov_cr ' +
      ' WHERE ' +
      ' 	sn_desc_condicional = 1 AND ' +
      '  COALESCE(cd_mensalidade_origem, cd_mensalidade) = :cd_mensalidade ';
var
   qyAcoesCondicionais : TUMZQuery;
begin

   {
      Retorna quantas ações de movimento de descontos condicionais estão
      vinculadas ao título
   }

   DM.CriarConsulta(qyAcoesCondicionais);

   qyAcoesCondicionais.Close;
   qyAcoesCondicionais.SQL.Text := SQL_ACOES_MOVIMENTO_CONDICIONAIS;
   qyAcoesCondicionais.ParamByName('cd_mensalidade').AsInteger := StrToInt( objParcela.getValorCampo('cd_mensalidade') );
   qyAcoesCondicionais.Open;

   Result := qyAcoesCondicionais.FieldByName('nr_acoes').AsInteger;

end;

procedure TfrmMensalidadesBaixar.aplicacaoDescontosCondicionais(iCol, iRow: Integer; var objParcela: TMBParcela);
var
   objPessoaSel: TMBPessoa;
begin

   {
      Verifica se o titulo possui mais de um desconto condicional vinculado a esse campo, se possuir
      abrir a tela de aplicação de descontos para gerenciar os vários descontos, usuário precisa
      possuir permissão para acessar essa tela. Se possuir apenas um desconto condicional vinculado
      ao ajusta a ação de movimento do desconto condicional vinculada ao plano (sem necessidade de permissão)
      Se não possuir nenhum desconto condicional, inclui um novo desconto condicional
   }

   // Verifica se usuário tem permissão para gerenciar a aplicação de descontos
   if not DM.UsuarioLogado.TemPermissao(2020, npIncluir, True ) then Exit;

   // Conferir Bloqueio de Alterações por data
   if DM.EstaBloqueado(Dm.DataAtual(), True) then Exit;

   // Abre a tela de gerenciar descontos 
   Application.CreateForm(TfrmMensalidadeAplicarDescontos, frmMensalidadeAplicarDescontos);
   frmMensalidadeAplicarDescontos.iCodigoMensalidade := StrToInt( objParcela.getValorCampo('cd_mensalidade') );

   frmMensalidadeAplicarDescontos.ShowModal;

   FreeAndNil(frmMensalidadeAplicarDescontos);

   // Atualizar os valores na tela
   atualizarValores();

end;

procedure TfrmMensalidadesBaixar.atualizarValores();
var
   objPessoaSel: TMBPessoa;
   qyMensalidades: TUMZQuery;
begin

   // Atualiza os valores da mensalidade
   Self.AtualizaValoresMensalidades();

   // Pega a pessoa na aba selecionada
   objPessoaSel  := (tabParcelas.Tabs.Objects[tabParcelas.TabIndex] as TMBPessoa);

   // Carrega a grid com os novos valores
   Self.carregaGridParcelas( objPessoaSel );
   Self.atualizaValoresTotais();

   // Carrega a grid de cartão com os novos valores
   if chkCartao.Checked then
   begin
      carregaValoresGridCartao;
   end;
   
end;

end.
