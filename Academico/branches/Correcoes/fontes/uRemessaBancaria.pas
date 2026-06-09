unit uRemessaBancaria;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, StdCtrls, UMComboBox, ToolWin, ComCtrls, UMDateTimePicker,
  Buttons, Grids, DBGrids, ImgList, UZDataset, DB, ZAbstractRODataset,
  ZAbstractDataset, General, uGeneral, uSplash, uRemessaClass, UZDbcFuncs,
  ZDbcIntfs, uUsuario;

type
   TLayout = class(TObject)                                
   strict private
      FOrigemID: Integer;
      cdLayout: integer;
      cdCaixa: integer;
      nrRemessa: integer;
      nmLayout: string;
   public
      procedure setCdLayout(cdLayout: integer);
      procedure setCdCaixa(cdCaixa: integer);
      procedure setNrRemessa(nrRemessa: integer);
      procedure setNmLayout(nmLayout: string);

      function getCdLayout() : integer;
      function getCdCaixa() : integer;
      function getNrRemessa() : integer;
      function getNmLayout() : string;

      property OrigemID: Integer read FOrigemID write FOrigemID;
   end;

  TfrmRemessaBancaria = class(TForm)
    pnTitulo: TPanel;
    pnLayout: TPanel;
    lbLayout: TLabel;
    cbLayouts: TUMComboBox;
    pcRemessa: TPageControl;
    tsFilaRemessa: TTabSheet;
    pnFilaRemessa: TPanel;
    pnPesquisarFila: TPanel;
    dbgFilaRemessa: TDBGrid;
    tbAcoesFila: TToolBar;
    ToolButton1: TToolButton;
    btRemoverFila: TToolButton;
    ToolButton3: TToolButton;
    btGerarArquivoFila: TToolButton;
    ToolButton4: TToolButton;
    btFecharFila: TToolButton;
    ToolButton2: TToolButton;
    btMarcar: TSpeedButton;
    btDesmarcar: TSpeedButton;
    ToolButton5: TToolButton;
    btVerResumoFila: TToolButton;
    btFiltrarFila: TButton;
    tsArquivos: TTabSheet;
    tsConteudoArquivo: TTabSheet;
    pnConteudoArquivo: TPanel;
    pnPesquisarConteudoArquivo: TPanel;
    lbPesquisarConteudoArquivo: TLabel;
    edPesquisarConteudoArquivo: TEdit;
    btFiltrarConteudoArquivo: TButton;
    dbgConteudoArquivo: TDBGrid;
    lbPesquisarFila: TLabel;
    edPesquisarFila: TEdit;
    pnArquivo: TPanel;
    pnPesquisarArquivo: TPanel;
    lbDataExportacaoArquivo: TLabel;
    btFiltrarArquivo: TButton;
    dbgArquivo: TDBGrid;
    tbAcoesPesquisar: TToolBar;
    ToolButton7: TToolButton;
    btVerResumoArquivo: TToolButton;
    btExcluirArquivo: TToolButton;
    ToolButton10: TToolButton;
    btBaixarArquivo: TToolButton;
    ToolButton12: TToolButton;
    btFecharArquivo: TToolButton;
    ToolButton14: TToolButton;
    dtpFimExportacao: TUMDateTimePicker;
    dtpInicioExportacao: TUMDateTimePicker;
    lbAteArquivo: TLabel;
    tbArquivo: TToolBar;
    ToolButton6: TToolButton;
    btFecharConteudoArquivo: TToolButton;
    ToolButton17: TToolButton;
    ilAcoes: TImageList;
    btConfirmarEnvioBancoArquivo: TToolButton;
    qyFilaRemessa: TUMZQuery;
    dsFilaRemessa: TDataSource;
    qyFilaRemessanr_nossonumero: TStringField;
    qyFilaRemessanm_pessoa: TStringField;
    qyFilaRemessadt_vencimento: TDateTimeField;
    qyFilaRemessads_ocorrencia: TStringField;
    qyFilaRemessadt_inclusao: TDateTimeField;
    qyFilaRemessasn_selecao: TBooleanField;
    qyFilaRemessacd_envio: TIntegerField;
    qyLayouts: TUMZQuery;
    qyFilaRemessavl_nominal: TFloatField;
    qyFilaRemessavl_desconto: TFloatField;
    qyRemoverFila: TUMZQuery;
    qryLayoutEspec: TUMZReadOnlyQuery;
    qryLayoutEspecnr_inicio: TIntegerField;
    qryLayoutEspecnr_tamanho: TIntegerField;
    qryLayoutEspecds_valor: TMemoField;
    qryLayoutEspecchr_fill: TStringField;
    qryContatos: TUMZReadOnlyQuery;
    qryContatoscd_pessoa: TIntegerField;
    qryContatoscd_contato: TIntegerField;
    qryContatosds_contato: TStringField;
    dsArquivos: TDataSource;
    qyArquivos: TUMZQuery;
    qyArquivosdt_exportacao: TDateTimeField;
    qyArquivosnm_arquivo: TStringField;
    qyArquivosds_situacao: TStringField;
    qyArquivosnr_boletos: TLargeintField;
    qyArquivoscd_arquivo: TIntegerField;
    qyArquivosds_situacao_completa: TStringField;
    dsConteudoArquivo: TDataSource;
    qyConteudoArquivo: TUMZQuery;
    StringField1: TStringField;
    StringField2: TStringField;
    DateTimeField1: TDateTimeField;
    FloatField1: TFloatField;
    FloatField2: TFloatField;
    StringField3: TStringField;
    DateTimeField2: TDateTimeField;
    qyConteudoArquivods_situacao: TStringField;
    sdArquivoRemessa: TSaveDialog;
    cbStatus: TUMComboBox;
    pnGridConteudoArquivo: TPanel;
    btnReenviar: TToolButton;
    btnIncluir: TToolButton;
    btnSep1: TToolButton;
    sdlgRemessa: TSaveDialog;
    sbConfigLayout: TSpeedButton;
    qyFilaRemessanm_aluno: TStringField;
    qyConteudoArquivonm_aluno: TStringField;
    btnTitulos: TToolButton;
    btnTitulosArquivo: TToolButton;
    qyConteudoArquivocd_envio: TIntegerField;
    qyFilaRemessads_criticas: TStringField;
    pnCriticas: TPanel;
    qyTemCriticas: TUMZQuery;
    procedure btnTitulosArquivoClick(Sender: TObject);
    procedure btnTitulosClick(Sender: TObject);
    procedure sbConfigLayoutClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure btnIncluirClick(Sender: TObject);
    procedure btnReenviarClick(Sender: TObject);
    procedure cbStatusChange(Sender: TObject);
    procedure dbgConteudoArquivoDrawColumnCell(Sender: TObject;
      const Rect: TRect; DataCol: Integer; Column: TColumn;
      State: TGridDrawState);
    procedure btFiltrarConteudoArquivoClick(Sender: TObject);
    procedure edPesquisarConteudoArquivoKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure edPesquisarConteudoArquivoExit(Sender: TObject);
    procedure edPesquisarConteudoArquivoEnter(Sender: TObject);
    procedure btFecharConteudoArquivoClick(Sender: TObject);
    procedure btFecharArquivoClick(Sender: TObject);
    procedure dbgArquivoDrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumn; State: TGridDrawState);
    procedure btExcluirArquivoClick(Sender: TObject);
    procedure btConfirmarEnvioBancoArquivoClick(Sender: TObject);
    procedure dtpFimExportacaoChangeDate(Sender: TObject);
    procedure dtpInicioExportacaoChangeDate(Sender: TObject);
    procedure pcRemessaChange(Sender: TObject);
    procedure btFiltrarArquivoClick(Sender: TObject);
    procedure btVerResumoArquivoClick(Sender: TObject);
    procedure btVerResumoFilaClick(Sender: TObject);
    procedure btBaixarArquivoClick(Sender: TObject);
    procedure btGerarArquivoFilaClick(Sender: TObject);
    procedure btRemoverFilaClick(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure edPesquisarFilaKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure cbLayoutsChange(Sender: TObject);
    procedure edPesquisarFilaExit(Sender: TObject);
    procedure btDesmarcarClick(Sender: TObject);
    procedure btMarcarClick(Sender: TObject);
    procedure dbgFilaRemessaCellClick(Column: TColumn);
    procedure dbgFilaRemessaDrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumn; State: TGridDrawState);
    procedure btFecharClick(Sender: TObject);
    procedure edPesquisarFilaEnter(Sender: TObject);
    procedure btFiltrarFilaClick(Sender: TObject);
    procedure FormShow(Sender: TObject);

    const TEXTO_PESQUISAR = 'Digite um NN, responsável, ocorrência ou vencimento que deseja pesquisar';

  private
    { Private declarations }
    RemDados, RemInfo, arrSelecionadosFila: TStringList;
    iLinhaCount: LongInt;
    LILinhaContinua: LongInt;
      FPermConfig: TUMPermissoes;

    procedure preencherComboLayout();
    procedure filtrarFilaRemessa();
    procedure filtrarArquivos();
    procedure filtrarConteudoArquivo();
    procedure preencherCamposPlaceHolder();
    procedure exportaDados();
    procedure verificaHabilitarGerarArquivo();
    procedure ReenviaRejeitadas;

    function possuiLayoutSelecionado(): boolean;
    function possuiArquivoPendente(): boolean;
    function geraCabecalho(): boolean;
    function geraDetalhes(): boolean;
    function geraRodape(): boolean;
    function getNumeroArquivoRemessa(): integer;
    function formataSequencia(sValor: string; iSize: Integer; sFill: string; isSomenteNumeros: Boolean = false): string;
    function getNomeArquivoRemessa(): string;
    function getCdUltimoArquivo(): integer;

  public
    { Public declarations }
  end;

var
  frmRemessaBancaria: TfrmRemessaBancaria;

implementation

{$R *.dfm}

uses
   uDM, StrUtils, uRemessaBancariaResumo, UFRemessaIncluir,
   UFRemessaLayoutConfig, URemessaThread, UFRemessaTitulos;

procedure TfrmRemessaBancaria.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
   Action := caFree;
end;

procedure TfrmRemessaBancaria.FormCreate(Sender: TObject);
const
   SChavePermissao = 'UMFinanceiro.Recebimentos.Remessa.Config.Layout';
begin
   FPermConfig := DM.UsuarioLogado.GetPermissoes(0, SChavePermissao);
   pnCriticas.Visible := false;
   pcRemessa.ActivePageIndex := 0;
end;

procedure TfrmRemessaBancaria.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
   case Key of
      VK_F2:
         if btnIncluir.Enabled then
            btnIncluir.Click;
            
      VK_F9:  btRemoverFilaClick(nil);
      VK_F12: btFecharClick(nil);
   end;
end;

procedure TfrmRemessaBancaria.FormShow(Sender: TObject);
begin
  // Cria o stringlist que armazenará as linha selecionadas
  arrSelecionadosFila := TStringList.Create;

  // Preenche os campos com os placeholders necessários
  self.preencherCamposPlaceHolder();

  // Preenche a combo de layout (filtro para todas as guias)
  self.preencherComboLayout();

  dtpInicioExportacao.setDate(DM.DataAtual());
  dtpFimExportacao.setDate(DM.DataAtual());

  // Filtra a tela inicial de fila de remessa
  self.filtrarFilaRemessa();
end;

procedure TfrmRemessaBancaria.pcRemessaChange(Sender: TObject);
begin

  if pcRemessa.ActivePage = tsFilaRemessa then
  begin
    self.filtrarFilaRemessa();
  end;

  if pcRemessa.ActivePage = tsArquivos then
  begin
    self.filtrarArquivos();
  end;

  if pcRemessa.ActivePage = tsConteudoArquivo then
  begin
    self.filtrarConteudoArquivo();
  end;
  
end;

procedure TfrmRemessaBancaria.preencherCamposPlaceHolder();
begin
  // Preencher o valor padrão de pesquisar na fila ou conteúdo do arquivo 
  edPesquisarFila.Text := TEXTO_PESQUISAR;
  edPesquisarConteudoArquivo.Text := TEXTO_PESQUISAR;
end;

procedure TfrmRemessaBancaria.preencherComboLayout();
var
  objLayout: TLayout;
begin

  // Busca os layouts disponíveis para remessa bancária
  qyLayouts.Close;
  qyLayouts.ParamByName('cd_coligada').AsInteger := DM.UsuarioLogado.ColigadaLogada;  
  qyLayouts.Open;

  cbLayouts.Clear;
  cbLayouts.AddItem('Selecione um layout', nil);
  while not qyLayouts.Eof do
  begin

    // Criar um novo layout  
    objLayout := TLayout.Create;
    
    objLayout.setCdLayout(qyLayouts.FieldByName('cd_layout').AsInteger);
    objLayout.setCdCaixa(qyLayouts.FieldByName('cd_caixa').AsInteger);
    objLayout.setNrRemessa(qyLayouts.FieldByName('nr_remessa').AsInteger);
    objLayout.setNmLayout(qyLayouts.FieldByName('nm_layout').AsString);
    objLayout.OrigemID := qyLayouts.FieldByName('cd_origem').AsInteger;

    // Adiciona o Objeto layout na combo
    cbLayouts.AddItem(qyLayouts.FieldByName('nm_layout').AsString, objLayout);

    qyLayouts.Next;
  end;

  // Seleciona a primeira opção por padrão 
  cbLayouts.ItemIndex := 0;

end;
    
procedure TfrmRemessaBancaria.ReenviaRejeitadas;
const
   SQLReinsereRejeitadas = ''
      + ' INSERT INTO rem_envios ( '
      + ' 	cd_layout, '
      + ' 	nr_nossonumero, '
      + ' 	nr_sequencia, '
      + ' 	cd_resp, '
      + ' 	dt_vencimento, '
      + ' 	vl_nominal, '
      + ' 	vl_desconto, '
      + ' 	cd_ocorrencia, '
      + ' 	cd_boleto, '
      + ' 	dt_inclusao '
      + ' ) '
      + ' SELECT '
      + ' 	e.cd_layout, '
      + ' 	e.nr_nossonumero, '
      + ' 	(SELECT MAX(nr_sequencia)FROM rem_envios WHERE nr_nossonumero =  e.nr_nossonumero) + 1, '
      + ' 	e.cd_resp, '
      + ' 	e.dt_vencimento, '
      + ' 	e.vl_nominal, '
      + ' 	e.vl_desconto, '
      + ' 	e.cd_ocorrencia, '
      + ' 	e.cd_boleto, '
      + ' 	CURRENT_TIMESTAMP '
      + ' FROM '
      + ' 	rem_status s '
      + ' 		JOIN rem_envios e ON '
      + ' 			(s.cd_envio_atual = e.cd_envio) AND '
      + ' 			(s.nr_nossonumero = e.nr_nossonumero) '
      + ' WHERE '
      + ' 	s.ds_situacao = ''J'' AND '
      + ' 	e.sn_ignorado = 0 AND '
      + ' 	e.cd_arquivo = ? ';
      
   SQLAtualizaStatus = ''
      + ' UPDATE rem_status s '
      + ' SET '
      + ' 	s.ds_situacao = ''F'', '
      + ' 	s.cd_envio_atual = ( '
      + ' 		SELECT '
      + ' 			e_novo.cd_envio '
      + ' 		FROM '
      + ' 			rem_envios e_novo '
      + ' 				JOIN rem_envios e_velho ON '
      + ' 					(e_novo.nr_nossonumero = e_velho.nr_nossonumero) '
      + ' 		WHERE '
      + ' 			e_velho.cd_envio = s.cd_envio_atual AND '
      + ' 			(e_velho.nr_sequencia + 1) = e_novo.nr_sequencia '
      + ' 	) '
      + ' WHERE '
      + ' 	s.ds_situacao = ''J'' AND '
      + ' 	EXISTS ( '
      + ' 		SELECT '
      + ' 			e_novo.cd_envio '
      + ' 		FROM '
      + ' 			rem_envios e_novo '
      + ' 				JOIN rem_envios e_velho ON '
      + ' 					(e_novo.nr_nossonumero = e_velho.nr_nossonumero) '
      + ' 		WHERE '
      + ' 			e_novo.cd_envio != s.cd_envio_atual AND '
      + ' 			e_velho.cd_envio = s.cd_envio_atual AND '
      + ' 			(e_velho.nr_sequencia + 1) = e_novo.nr_sequencia '
      + ' 	) ';
var
   Stmt: IZPreparedStatement;
begin
   Stmt := PrepareStatement(SQLReinsereRejeitadas);
   try
      Stmt.SetInt(1, qyArquivoscd_arquivo.AsInteger);
      Stmt.ExecutePrepared;
   finally
      Stmt.Close;
      Stmt := nil;
   end;

   Execute(SQLAtualizaStatus);
end;

procedure TfrmRemessaBancaria.sbConfigLayoutClick(Sender: TObject);
var
   Layout: TLayout;
   X, Y: Integer;
begin
   Layout := TLayout(cbLayouts.Items.Objects[cbLayouts.ItemIndex]);

   X := sbConfigLayout.ClientOrigin.X;
   Y := sbConfigLayout.ClientOrigin.Y + sbConfigLayout.Height;

   TfrmRemessaLayoutConfig.ConfigLayout(Layout.getCdLayout, X, Y);

   if TRemessaThread.Enabled then
   begin
      TRemessaThread.Instance.Terminate;
      TRemessaThread.Instance.WaitFor;
      TRemessaThread.Instance.Resume;
   end;
end;

procedure TfrmRemessaBancaria.btMarcarClick(Sender: TObject);
var
  cd_envio: Integer;
begin
  if not possuiLayoutSelecionado() then
  begin
    Exit;
  end;

  qyFilaRemessa.DisableControls();

  cd_envio := qyFilaRemessacd_envio.AsInteger;

  qyFilaRemessa.First();

  While not qyFilaRemessa.Eof do
  begin
    if arrSelecionadosFila.IndexOf(qyFilaRemessacd_envio.AsString) < 0 then
    begin
      arrSelecionadosFila.Add(qyFilaRemessacd_envio.AsString);
    end;
    
    qyFilaRemessa.Next;
  end;

  dbgFilaRemessa.Repaint();

  qyFilaRemessa.Locate('cd_envio', cd_envio, []);

  qyFilaRemessa.EnableControls();
end;

procedure TfrmRemessaBancaria.btnIncluirClick(Sender: TObject);
begin
   if frmRemessaIncluir = nil then
   begin
      Application.CreateForm(TfrmRemessaIncluir, frmRemessaIncluir);
   end;

   frmRemessaIncluir.cdLayout := TLayout(cbLayouts.Items.Objects[cbLayouts.ItemIndex]).getCdLayout();
   if frmRemessaIncluir.ShowModal = mrOk then
   begin
      qyFilaRemessa.Refresh;
      verificaHabilitarGerarArquivo;
   end;
end;

procedure TfrmRemessaBancaria.btnReenviarClick(Sender: TObject);
const
   MsgPergunta = ''
      + 'Este procedimento colocará novamente na fila de remessa todos os '
      + 'pedidos de registro de títulos do arquivo atual que foram rejeitados '
      + 'pelo banco. Os títulos que sofreram alterações de valores e '
      + 'vencimentos devem ser reimpressos para que sejam processados.'#13
      + 'Deseja realmente continuar?';
   MsgCaption = 'Confirmação';
var
   UserChoice: Integer;
begin
   UserChoice := MessageBox(0, MsgPergunta, MsgCaption,
      MB_ICONQUESTION or MB_YESNO or MB_DEFBUTTON2);

   if UserChoice = ID_YES then
   begin
      ReenviaRejeitadas;
      qyConteudoArquivo.Refresh;
   end;
end;

procedure TfrmRemessaBancaria.btnTitulosArquivoClick(Sender: TObject);
begin
   TfrmRemessaTitulos.MostraTitulos(qyConteudoArquivocd_envio.AsInteger);
end;

procedure TfrmRemessaBancaria.btnTitulosClick(Sender: TObject);
begin
   TfrmRemessaTitulos.MostraTitulos(qyFilaRemessacd_envio.AsInteger);
end;

procedure TfrmRemessaBancaria.btRemoverFilaClick(Sender: TObject);
const
  SQL_NN_ATUALIZAR_ENVIO_ATUAL = ''+
    ' SELECT '+
    '     nr_nossonumero '+
    ' FROM '+
    '     rem_status '+
    ' WHERE '+
    '     cd_envio_atual IN (:cd_envios) ';

  SQL_REMOVER_FILA = ''+
    ' UPDATE '+
    '     rem_envios '+
    ' SET '+
    '     sn_ignorado = 1, '+
    '     dt_ignorado = NOW() '+
    ' WHERE '+
    '     cd_envio IN (:cd_envios)'+
    '     AND ISNULL(cd_arquivo)';
var
  removerRegistros: integer;
  qyAtualizarEnvioAtual: TUMZQuery;
  objRemessa: TRemessa;  
begin

  if not DM.UsuarioLogado.TemPermissao( DM.iCdPessoaLogado, 'UMFinanceiro.RemoverEnvioFilaRemessa', npExcluir, True ) then
  begin
    Exit;
  end;

  // Se não possuir nenhum registro selecionado
  if arrSelecionadosFila.Count = 0 then
  begin
    Mensagem('Nenhum registro selecionado, selecione um registro para utilizar a opção de remover.', 'UNIMESTRE', MB_OK + MB_ICONWARNING, Handle);
    Exit;
  end;

  DM.CriarConsulta(qyAtualizarEnvioAtual);

  objRemessa := TRemessa.Create;

  removerRegistros := Mensagem('Atenção' + CHR(13) + CHR(13) +
      'O sistema está programado para manter os status dos nossos números sincronizados com o banco. '+
      'Ao remover um ou mais registros manualmente da fila poderá causar uma falha nesse sincronismo.'+CHR(13)+CHR(13)+
      'Você tem certeza que deseja remover os registros selecionados? ', 'UNIMESTRE', MB_YESNO + MB_ICONQUESTION);

  // Se o usuário confirmou que deseja remover
  if removerRegistros = mrYes then
  begin
    arrSelecionadosFila.Delimiter := ',';

    // Marca os registros como ignorados
    qyRemoverFila.Close;
    qyRemoverFila.SQL.Text := ReplaceStr( SQL_REMOVER_FILA, ':cd_envios', arrSelecionadosFila.DelimitedText );
    qyRemoverFila.ExecSQL;

    // Recupera os NN que devem ser atualizados o envio atual
    qyAtualizarEnvioAtual.Close;
    qyAtualizarEnvioAtual.SQL.Text := ReplaceStr( SQL_NN_ATUALIZAR_ENVIO_ATUAL, ':cd_envios', arrSelecionadosFila.DelimitedText );
    qyAtualizarEnvioAtual.Open;

    // Atualiza o envio atual do NN, pois o mesmo acabou de ser ignorado(removido) acima
    while not qyAtualizarEnvioAtual.Eof do
    begin
      objRemessa.atualizarEnvioAtualNossoNumero(qyAtualizarEnvioAtual.FieldByName('nr_nossonumero').AsString);
      qyAtualizarEnvioAtual.Next;
    end;

    // Inserir o log de exclusão (sn_ignorado) de registro da fila de remessa
    DM.setLog(2062, 'exclusao', arrSelecionadosFila.DelimitedText, DM.UsuarioLogado.ColigadaLogada,
      'Removidos manualmente (marca como ignorado) da fila de remessa os envios de códigos => (' + arrSelecionadosFila.DelimitedText + ')');

    // Limpa o array de registros selecionados
    arrSelecionadosFila.Clear;

    Mensagem('Registros removidos com sucesso.', 'UNIMESTRE', MB_OK+ MB_ICONWARNING, Handle);

    // Recarrega os registros em tela
    self.filtrarFilaRemessa();
  end;

  FreeAndNil(qyAtualizarEnvioAtual);
  FreeAndNil(objRemessa);

end;

procedure TfrmRemessaBancaria.btVerResumoArquivoClick(Sender: TObject);
var
  cdArquivo: integer;
begin
  if not possuiLayoutSelecionado() then
  begin
    Mensagem('Selecione um layout para exibir o resumo!');
    Exit;
  end;

  cdArquivo := qyArquivos.FieldByName('cd_arquivo').AsInteger;

  // Abre a janela para visualizar o resumo da remessa
  frmRemessaBancariaResumo := TfrmRemessaBancariaResumo.Create( self );
  frmRemessaBancariaResumo.filtrarResumoArquivoRemessa(cdArquivo);
  frmRemessaBancariaResumo.ShowModal();
end;

procedure TfrmRemessaBancaria.btVerResumoFilaClick(Sender: TObject);
var
  cdLayout: integer;
begin

  if not possuiLayoutSelecionado() then
  begin
    Mensagem('Selecione um layout para exibir o resumo!');
    Exit;
  end;

  cdLayout := TLayout(cbLayouts.Items.Objects[cbLayouts.ItemIndex]).getCdLayout();

  // Abre a janela para visualizar o resumo da remessa
  frmRemessaBancariaResumo := TfrmRemessaBancariaResumo.Create( self );
  frmRemessaBancariaResumo.filtrarResumoFilaRemessa(cdLayout);
  frmRemessaBancariaResumo.ShowModal();
end;

procedure TfrmRemessaBancaria.cbLayoutsChange(Sender: TObject);
begin

   sbConfigLayout.Enabled := npAcesso in FPermConfig;

  if pcRemessa.ActivePage = tsFilaRemessa then
  begin
    self.filtrarFilaRemessa();
  end;

  if pcRemessa.ActivePage = tsArquivos then
  begin
    self.filtrarArquivos();
  end;

  if pcRemessa.ActivePage = tsConteudoArquivo then
  begin
    self.filtrarConteudoArquivo();
  end;  

end;

procedure TfrmRemessaBancaria.cbStatusChange(Sender: TObject);
var
  posicao: Pointer;
  objRemessa: TRemessa;
begin

  // Somente executa se a situação atual é Exportado e está sendo alterada para Rejeitado (ItemIndex = 1
  if (qyConteudoArquivo.FieldByName('ds_status').AsString = 'Exportado') and
     (cbStatus.ItemIndex = 1) then
  begin

    // Verifica se o objeto remessa ainda não está criado
    // Nesse caso inicializa o mesmo
    objRemessa := TRemessa.Create;

    objRemessa.alterarStatusNossoNumero(qyConteudoArquivo.FieldByName('nr_nossonumero').AsString, snnRejeitado);

    // Inserir o log de alteração de situação de um nosso número pelo usuário
    DM.setLog(2062, 'alteracao', qyConteudoArquivo.FieldByName('nr_nossonumero').AsString, DM.UsuarioLogado.ColigadaLogada,
      'Alterada a situação do NN = '+qyConteudoArquivo.FieldByName('nr_nossonumero').AsString+' de "Exportado" para "Rejeitado".');

    FreeAndNil(objRemessa);

    // Atualiza o registro na grid
    posicao := qyConteudoArquivo.GetBookmark;
    qyConteudoArquivo.Close();
    qyConteudoArquivo.Open();
    qyConteudoArquivo.GotoBookmark(posicao);

  end;

end;

procedure TfrmRemessaBancaria.btBaixarArquivoClick(Sender: TObject);
const
  SQL_BAIXAR_ARQUIVO = ''+
    ' SELECT '+
    '     nm_arquivo, '+
    '     me_arquivo '+
    ' FROM '+
    '     rem_arquivos '+
    ' WHERE '+
    '     cd_arquivo = :cd_arquivo';
var
  qyArquivo: TUMZQuery;
  remessa: TStringList;
begin

  DM.CriarConsulta(qyArquivo);

  qyArquivo.Close;
  qyArquivo.SQL.Text := SQL_BAIXAR_ARQUIVO;
  qyArquivo.ParamByName('cd_arquivo').AsInteger := qyArquivos.FieldByName('cd_arquivo').AsInteger;
  qyArquivo.Open;

  if qyArquivo.IsEmpty then
  begin
    Mensagem('Não foi selecionado nenhum arquivo!');
    Exit;
  end;

  // Pergunta ao usuário onde deseja salvar o arquivo de remessa
  if sdArquivoRemessa.Execute then
  begin
    remessa := TStringList.Create;
    remessa.Text := qyArquivo.FieldByName('me_arquivo').AsString;
    remessa.SaveToFile(sdArquivoRemessa.FileName);
    Mensagem('O arquivo de remessa foi baixado em:' + Chr(13) + sdArquivoRemessa.FileName);

    FreeAndNil(remessa);
  end;

  FreeAndNil(qyArquivo);

end;

procedure TfrmRemessaBancaria.btConfirmarEnvioBancoArquivoClick(
  Sender: TObject);
const
  SQL_ATUALIZAR_ARQUIVO =
    ' UPDATE '+
    '   rem_arquivos '+
    ' SET '+
    '   ds_situacao = :ds_situacao '+
    ' WHERE '+
    '   cd_arquivo = :cd_arquivo ';
var
  qyAtualizarArquivo: TUMZQuery;
  confirmarEnvio: integer;
begin

  if qyArquivos.FieldByName('ds_situacao').AsString <> 'A' then
  begin
    Mensagem('O arquivo selecionado precisa estar na situação de "Aguardando envio ao banco" para utilizar essa opção.');
    Exit;
  end;

  confirmarEnvio := Mensagem('Atenção' + CHR(13) + CHR(13) +
      'Você está informando que o arquivo selecionado foi enviado ao banco.'+CHR(13)+
      'Deseja confirmar essa ação? ', 'UNIMESTRE', MB_YESNO + MB_ICONQUESTION);

  // Se o usuário confirmou que deseja remover
  if confirmarEnvio = mrYes then
  begin

    DM.CriarUniConsulta(qyAtualizarArquivo);

    // Modifica a situação do arquivo
    qyAtualizarArquivo.Close;
    qyAtualizarArquivo.SQL.Text := SQL_ATUALIZAR_ARQUIVO;
    qyAtualizarArquivo.ParamByName('ds_situacao').AsString := 'U';
    qyAtualizarArquivo.ParamByName('cd_arquivo').AsInteger := qyArquivos.FieldByName('cd_arquivo').AsInteger;
    qyAtualizarArquivo.ExecSQL;

    // Atualiza os arquivos em tela
    self.filtrarArquivos();

    Mensagem('Confirmação de envio ao banco realizada com sucesso!');

    FreeAndNil(qyAtualizarArquivo);
  end;

end;

procedure TfrmRemessaBancaria.btDesmarcarClick(Sender: TObject);
var
  index, cd_envio: integer;
begin
  if not possuiLayoutSelecionado() then
  begin
    Exit;
  end;

  qyFilaRemessa.DisableControls();

  cd_envio := qyFilaRemessacd_envio.AsInteger;

  qyFilaRemessa.First();

  while not qyFilaRemessa.Eof do
  begin
    index := arrSelecionadosFila.IndexOf(qyFilaRemessacd_envio.AsString);
    if index >= 0 then
    begin
      arrSelecionadosFila.Delete(index);
    end;

    qyFilaRemessa.Next;
  end;

  dbgFilaRemessa.Repaint();

  qyFilaRemessa.Locate('cd_envio', cd_envio, []);

  qyFilaRemessa.EnableControls();
end;

procedure TfrmRemessaBancaria.btExcluirArquivoClick(Sender: TObject);
const
  SQL_IGNORAR_ARQUIVO =
    ' UPDATE '+
    '   rem_arquivos '+
    ' SET '+
    '   sn_ignorado = 1, '+
    '   dt_ignorado = NOW() '+
    ' WHERE '+
    '   cd_arquivo = :cd_arquivo ';

  SQL_ATUALIZAR_ENVIOS_ARQUIVO =
    ' UPDATE '+
    '   rem_envios re '+
    '   INNER JOIN rem_status rs ON (rs.nr_nossonumero = re.nr_nossonumero) '+
    ' SET '+
    '   re.cd_arquivo = NULL, '+
    '   rs.ds_situacao = CASE WHEN rs.ds_situacao IN ("E") THEN "F" ELSE rs.ds_situacao END '+
    ' WHERE '+
    '   re.cd_arquivo = :cd_arquivo ';
var
  qyIgnorarArquivo, qyAtualizarEnviosArquivo: TUMZQuery;
  confirmarExclusao: integer;
  objRemessa: TRemessa;
begin

  if not DM.UsuarioLogado.TemPermissao(2062, npExcluir, true) then
  begin
    Exit;
  end;

  if qyArquivos.FieldByName('ds_situacao').AsString = 'R' then
  begin
    Mensagem('O arquivo já foi confirmado pelo retorno, não é possível excluir este arquivo.');
    Exit;
  end else if ((qyArquivos.FieldByName('ds_situacao').AsString = 'U') and (qyArquivos.FieldByName('cd_arquivo').AsInteger <> self.getCdUltimoArquivo())) then
  begin
    Mensagem('Para excluir um arquivo marcado como "Envio confirmado pelo usuário" ele precisa ser o último arquivo exportado (arquivo mais recente).');
    Exit;
  end else if ((qyArquivos.FieldByName('ds_situacao').AsString <> 'A') and (qyArquivos.FieldByName('ds_situacao').AsString <> 'U')) then
  begin
    Mensagem('O arquivo selecionado precisa estar na situação de "Aguardando envio ao banco" ou ser o último arquivo com "Envio confirmado pelo usuário".');
    Exit;
  end;

  confirmarExclusao := Mensagem('Atenção' + CHR(13) + CHR(13) +
      'Você realmente deseja excluir o arquivo selecionado, todas as remessas contidas no mesmo voltarão para fila de remessa? ', 'UNIMESTRE', MB_YESNO + MB_ICONQUESTION);

  // Se o usuário confirmou que deseja remover
  if confirmarExclusao = mrYes then
  begin

    DM.CriarUniConsulta(qyIgnorarArquivo);
    DM.CriarUniConsulta(qyAtualizarEnviosArquivo);

    // Ignora o arquivo selecionado
    qyIgnorarArquivo.Close;
    qyIgnorarArquivo.SQL.Text := SQL_IGNORAR_ARQUIVO;
    qyIgnorarArquivo.ParamByName('cd_arquivo').AsInteger := qyArquivos.FieldByName('cd_arquivo').AsInteger;
    qyIgnorarArquivo.ExecSQL;

    // Verifica se o objeto remessa ainda não está criado
    // Nesse caso inicializa o mesmo
    objRemessa := TRemessa.Create;

    // Otimizar os envios da remessa
    // ignora as alterações e envios que não foram ao banco ainda e inclui
    // novamente o registro com as informações atualizadas 
    objRemessa.otimizarEnviosRemessa(qyArquivos.FieldByName('cd_arquivo').AsInteger);

    // Inserir o log de exclusão (sn_ignorado) de arquivo de remessa
    DM.setLog(2062, 'exclusao', qyArquivos.FieldByName('cd_arquivo').AsString, DM.UsuarioLogado.ColigadaLogada,
      'Arquivo removido manualmente (marca como ignorado) o arquivo ignorado é ' + qyArquivos.FieldByName('cd_arquivo').AsString + ' - ' + qyArquivos.FieldByName('nm_arquivo').AsString);

    // Apaga o arquivo das remessas para que sejam apresentadas na fila de remessa novamente
    qyAtualizarEnviosArquivo.Close;
    qyAtualizarEnviosArquivo.SQL.Text := SQL_ATUALIZAR_ENVIOS_ARQUIVO;
    qyAtualizarEnviosArquivo.ParamByName('cd_arquivo').AsInteger := qyArquivos.FieldByName('cd_arquivo').AsInteger;
    qyAtualizarEnviosArquivo.ExecSQL;

    // Atualiza os arquivos em tela
    self.filtrarArquivos();

    Mensagem('Arquivo excluído com sucesso!');

    FreeAndNil(objRemessa);
    FreeAndNil(qyIgnorarArquivo);
    FreeAndNil(qyAtualizarEnviosArquivo);
  end;

end;

procedure TfrmRemessaBancaria.btFecharArquivoClick(Sender: TObject);
begin
  self.Close;
end;

procedure TfrmRemessaBancaria.btFecharClick(Sender: TObject);
begin
  self.Close;
end;

procedure TfrmRemessaBancaria.btFecharConteudoArquivoClick(Sender: TObject);
begin
  self.Close;
end;

procedure TfrmRemessaBancaria.btFiltrarArquivoClick(Sender: TObject);
begin
  self.filtrarArquivos();
end;

procedure TfrmRemessaBancaria.btFiltrarConteudoArquivoClick(Sender: TObject);
begin
  self.filtrarConteudoArquivo();
end;

procedure TfrmRemessaBancaria.btFiltrarFilaClick(Sender: TObject);
begin
  self.filtrarFilaRemessa();
end;

procedure TfrmRemessaBancaria.btGerarArquivoFilaClick(Sender: TObject);
begin
  if not possuiLayoutSelecionado() then
  begin
    Mensagem('Selecione um layout para realizar a geração do arquivo de remessa!');
    Exit;
  end;

  if possuiArquivoPendente() then
  begin
    Mensagem('Atenção:'+Chr(13)+Chr(13)+
             'Existe um arquivo exportado anteriormente pendente de confirmação.'+Chr(13)+ 
             'Para confirmar este arquivo, vá na guia ARQUIVOS, e clique no botão "Confirmar Envio" para indicar que você realmente enviou o arquivo para o Banco.'+Chr(13)+
             'Você também poderá aguardar o retorno do banco sobre a última remessa para o sistema confirmar automaticamente.');
    Exit;
  end;

  self.exportaDados();
  self.filtrarFilaRemessa();
end;

procedure TfrmRemessaBancaria.exportaDados();
const
   SMsgErroCriarArquivoFmt = 'Ocorreu um erro ao tentar criar o arquivo "%s" na pasta "%s": %s';
   SMsgOperacaoCancelada = 'Operação cancelada.';
   SCaptionErro = 'Erro';
   SCaptionInfo = 'Informação';
  SQL_ATUALIZA_REMESSA = ''+
    ' UPDATE '+
    '     rem_status rs '+
    '     INNER JOIN rem_envios re ON (rs.nr_nossonumero = re.nr_nossonumero) '+
    ' SET '+
    '     rs.ds_situacao = CASE WHEN rs.ds_situacao IN ("F", "J") THEN "E" ELSE rs.ds_situacao END, '+
    '     re.cd_arquivo = :cd_arquivo '+
    ' WHERE '+
    '     re.cd_layout = :cd_layout AND '+
    '     re.sn_ignorado = 0 AND '+
    '     re.cd_arquivo IS NULL ';

  SQL_ATUALIZA_NR_REMESSA = ''+
    ' UPDATE '+
    '     rem_layouts '+
    ' SET '+
    '     nr_remessa = :nr_remessa '+
    ' WHERE '+
    '     cd_layout = :cd_layout';

  SQL_INSERIR_ARQUIVO_REMESSA = ''+
    ' INSERT INTO rem_arquivos (cd_pessoa, dt_exportacao, ds_situacao, nm_arquivo, me_arquivo) '+
    '   VALUES (:cd_pessoa, NOW(), :ds_situacao, :nm_arquivo, :me_arquivo) ';
var
  sNome : string;
  qyAtualizarRemessa, qyInserirArquivo: TUMZQuery;
  objLayout: TLayout;
  cdArquivo: integer;
   FileName, DirName, S: AnsiString;
   DirCreated, Selected: Boolean;   
begin
  frmSpl2 := TfrmSplash.Create(self);
  frmSpl2.Processando(True);
  frmSpl2.setTitulo('Remessa');
  frmSpl2.setTexto('Analisando estrutura de Layout...');

  if RemDados <> nil then
  begin
    FreeAndNil(RemDados);
  end;
  
  RemDados := TStringList.Create();
  RemInfo := TStringList.Create();
  iLinhaCount := 0;

  frmSpl2.setTexto('Criando Cabeçalho...');

  //cria o cabecalho
  if not geraCabecalho() then begin
    FreeAndNil(RemDados);
    frmSpl2.Processando(False);
    Exit;
  end;

  frmSpl2.setTexto('Criando Detalhes...');
  //cria o  corpo
  if not geraDetalhes() then begin
    FreeAndNil(RemDados);
    frmSpl2.Processando(False);
    Exit;
  end;

  frmSpl2.setTexto('Criando Rodapé...');
  //cria o final
  if not geraRodape() then begin
    FreeAndNil(RemDados);
    frmSpl2.Processando(False);
    Exit;
  end;

  frmSpl2.setTexto('Salvando o Arquivo...');
  //salva em arquivo
   try
      sNome := getNomeArquivoRemessa;

      FileName := ExtractFileName(sNome);
      DirName := ExtractFileDir(sNome);
      DirName := Trim(DirName);

      DirCreated :=
         DirectoryExists(DirName) or
         ((DirName <> '') and CreateDir(DirName));

      if DirCreated then
      begin
         RemDados.SaveToFile(sNome);
      end;

      if not DirCreated then
      begin
         sdlgRemessa.InitialDir := DirName;
         sdlgRemessa.FileName := FileName;
         Selected := sdlgRemessa.Execute;

         if Selected then
         begin
            RemDados.SaveToFile(sdlgRemessa.FileName);
            sNome := sdlgRemessa.FileName;
         end;

         if not Selected then
         begin
            MessageBox(0, SMsgOperacaoCancelada, SCaptionInfo,
               MB_ICONINFORMATION + MB_OK);
            frmSpl2.Processando(False);
            Exit;
         end;
      end;
      
   except
      on E : EFCreateError do
      begin
         S := Format(SMsgErroCriarArquivoFmt, [FileName, DirName, E.Message]);
         MessageBox(0, PChar(S), SCaptionErro, MB_ICONERROR + MB_OK);
         frmSpl2.Processando(False);
         Exit;
      end;    
  end;

  DM.CriarConsulta(qyInserirArquivo);

  // Insere o arquivo no banco
  qyInserirArquivo.Close;
  qyInserirArquivo.SQL.Text := SQL_INSERIR_ARQUIVO_REMESSA;
  qyInserirArquivo.ParamByName('cd_pessoa').AsInteger := DM.iCdPessoaLogado;
  qyInserirArquivo.ParamByName('ds_situacao').AsString := 'A';
  qyInserirArquivo.ParamByName('nm_arquivo').AsString := sNome;
  qyInserirArquivo.ParamByName('me_arquivo').AsMemo := RemDados.Text;
  qyInserirArquivo.ExecSQL;

  // Recupera o código do arquivo inserido
  cdArquivo := Dm.LastInsert;

  FreeAndNil(RemDados);

  frmSpl2.setTexto('Atualizando dados...');

  DM.CriarConsulta(qyAtualizarRemessa);

  // Atualiza a rem_envios com o arquivo criado
  qyAtualizarRemessa.Close;
  qyAtualizarRemessa.SQL.Text := SQL_ATUALIZA_REMESSA;
  qyAtualizarRemessa.ParamByName('cd_layout').AsInteger := TLayout(cbLayouts.Items.Objects[cbLayouts.ItemIndex]).getCdLayout();
  qyAtualizarRemessa.ParamByName('cd_arquivo').AsInteger := cdArquivo;
  qyAtualizarRemessa.ExecSQL;

  // Atualiza a rem_envios com o número da remessa do layout
  qyAtualizarRemessa.Close();
  qyAtualizarRemessa.SQL.Text := SQL_ATUALIZA_NR_REMESSA;
  qyAtualizarRemessa.ParamByName('cd_layout').AsInteger := TLayout(cbLayouts.Items.Objects[cbLayouts.ItemIndex]).getCdLayout();
  qyAtualizarRemessa.ParamByName('nr_remessa').AsInteger := (getNumeroArquivoRemessa()+1);
  qyAtualizarRemessa.ExecSQL();

  // Atualiza o número da remessa no layout selecionado
  objLayout := TLayout(cbLayouts.Items.Objects[cbLayouts.ItemIndex]);
  objLayout.setNrRemessa((objLayout.getNrRemessa()+1));

  cbLayouts.Items.Objects[cbLayouts.ItemIndex] := objLayout;

  frmSpl2.Processando(False);

  //tudo ok.. manda mensagem
  Mensagem('Arquivo de remessa gerado em:' + Chr(13) + sNome );

  FreeAndNil(qyAtualizarRemessa);
  FreeAndNil(qyInserirArquivo);

end;

function TfrmRemessaBancaria.geraCabecalho(): boolean;
const
  S_SQL_LAYOUT =
    ' SELECT '+
    '     %s cabecalho ' +
    ' FROM '+
    '     rem_layouts layout ' +
    '     LEFT JOIN fin_cadastro_contas financeiro ON (layout.cd_caixa = financeiro.cd_caixa) ' +
    ' WHERE '+
    '     layout.cd_layout = :cd_layout';
  S_ARQUIVO_NUMERO = '[arquivo_numero]';
  S_LINHA_NUMERO = '[linha_numero]';
  S_GLUE_MYSQL = ', ';
  S_FORMATED_VALUE_MYSQL = '%s(COALESCE(%s,''''), %s, ''%s'')';
  S_CONCAT_MYSQL = 'CONCAT(%s)';
var
  LSValue, LSSize, LSFill, LSTemp, LSGlue, LSSQL: string;
  qryLayout: TUMZQuery;
begin

  DM.CriarConsulta(qryLayout);

  qryLayoutEspec.Close;
  qryLayoutEspec.ParamByName('cd_layout').AsInteger := TLayout(cbLayouts.Items.Objects[cbLayouts.ItemIndex]).getCdLayout();
  qryLayoutEspec.ParamByName('cd_tipo').AsInteger := 1;
  qryLayoutEspec.Open;

  LILinhaContinua := 1;

  while not qryLayoutEspec.Eof do
  begin
    LSValue := StringReplace(qryLayoutEspecds_valor.AsString, '"', '''', [rfReplaceAll]);
    LSSize := qryLayoutEspecnr_tamanho.AsString;
    LSFill := qryLayoutEspecchr_fill.AsString;

    // Preenchimento fixo
    if LSValue = S_ARQUIVO_NUMERO then
    begin
      LSValue := Format('''%d''', [getNumeroArquivoRemessa + 1])
    end else if LSValue = '' then
    begin
      // Valor padrão
      LSValue := ''' ''';
    end;

    // Preenchimento padrão
    if LSFill = '' then
    begin
      LSFill := ' ';
    end;

    if LSValue = S_LINHA_NUMERO then
    begin
      RemInfo.Values['Linha.Size'] := LSSize;
      RemInfo.Values['Linha.Fill'] := LSFill;
      LSTemp := Format('''%s''', [LSValue]);
    end else if LSValue = '[linha_continua]' then
    begin
      RemInfo.Values['LinhaC.Size'] := LSSize;
      RemInfo.Values['LinhaC.Fill'] := LSFill;

      LSTemp := '''[linha_continua_cab]''';
    end else begin
      // Lado do preenchimento
      if LSFill = '0' then
      begin
        LSTemp := 'LPAD'
      end else begin
        LSTemp := 'RPAD';
      end;

      LSTemp := Format(S_FORMATED_VALUE_MYSQL, [LSTemp, LSValue, LSSize, LSFill]);
    end;

    LSSQL := LSSQL + LSGlue + LSTemp;
    LSGlue := S_GLUE_MYSQL;
    
    qryLayoutEspec.Next;
  end;
  
  qryLayoutEspec.Close;

  if LSSQL = '' then
  begin
    LSSQL := '''''';
  end;

  qryLayout.Close;
  qryLayout.SQL.Text := Format(S_SQL_LAYOUT, [Format(S_CONCAT_MYSQL, [LSSQL])]);
  qryLayout.ParamByName('cd_layout').AsInteger := TLayout(cbLayouts.Items.Objects[cbLayouts.ItemIndex]).getCdLayout();
  try
    qryLayout.Open;

    if not qryLayout.IsEmpty then
    begin
      Inc(iLinhaCount);
      LSTemp := qryLayout.FieldByName('cabecalho').AsString;
      if RemInfo.Values['Linha.Size'] <> '' then
      begin
        LSTemp := StringReplace(LSTemp, S_LINHA_NUMERO,
                    formataSequencia(
                      Format('%d', [iLinhaCount]),
                      StrToInt(RemInfo.Values['Linha.Size']),
                      RemInfo.Values['Linha.Fill']), [rfReplaceAll]);
      end;

      if RemInfo.Values['LinhaC.Size'] <> '' then
      begin
        LSTemp := StringReplace(LSTemp, '[linha_continua_cab]',
            formataSequencia(
              Format('%d', [LILinhaContinua]),
              StrToInt(RemInfo.Values['LinhaC.Size']),
              RemInfo.Values['LinhaC.Fill']), [rfReplaceAll]);

        LILinhaContinua := LILinhaContinua + 1;
      end;

      while AnsiPos('||', LSTemp) > 0 do
      begin
        RemDados.Add(Copy(LSTemp, 1, AnsiPos('||', LSTemp) - 1));
        LSTemp := Copy(LSTemp, AnsiPos('||', LSTemp) + 2, Length(LSTemp));
      end;

      RemDados.Add(LSTemp);
      Result := true;
      
    end else begin
      Mensagem('Nenhum registro de cabeçalho!!', 'Erro!', MB_ICONERROR + MB_OK, Handle);
      Result := false;
    end;
    
  except
    Mensagem('Erro nos detalhes do Layout do Arquivo de Remessa (Cabecalho)', 'Erro!', MB_ICONERROR + MB_OK, Handle);
    Result := false;
  end;
  qryLayout.Close;
end;

function TfrmRemessaBancaria.geraDetalhes(): boolean;
const
  S_SQL_DADOS =
    ' SELECT                     '+
    '     dda.nr_conta_corrente,  '+
    '     dda.ds_banco,           '+
    '     dda.nr_agencia,         '+
    '     dda.nr_documento,       '+
    '     dda.sn_autoriza_debito, '+
    '     resp.cd_pessoa codresp, '+
    '     o.nr_posicao_inicio,    '+
    '     o.nr_tamanho,           '+
    '     %s detalhes %s ' +
    ' FROM ' +
    '     rem_envios remessa ' +
    '     INNER JOIN rem_status rem_status ON (rem_status.nr_nossonumero = remessa.nr_nossonumero)' +
    '     INNER JOIN rem_envios registro ON (rem_status.cd_envio_registro = registro.cd_envio) '+
    '     INNER JOIN pessoas resp ON (remessa.cd_resp = resp.cd_pessoa) ' +
    '     INNER JOIN rem_layouts layout ON (remessa.cd_layout = layout.cd_layout) ' +
    '     LEFT JOIN fin_boleto boleto ON (boleto.cd_boleto = remessa.cd_boleto) ' +
    '     LEFT JOIN fin_cadastro_contas financeiro ON (layout.cd_caixa = financeiro.cd_caixa)  ' +
    '     LEFT JOIN pessoas_debito_automatico dda ON (dda.cd_pessoa = boleto.cd_pessoa ) '+
    '     LEFT JOIN rem_ocorrencias o ON ( ' +
    '       o.cd_ocorrencia = remessa.cd_ocorrencia AND ' +
    '       o.cd_layout = layout.cd_layout AND ' +
    '       o.sn_ativo = 1 '+
    '     ) ' +
    ' WHERE ' +
    '     layout.cd_layout = :cd_layout AND ' +
    '     remessa.sn_ignorado = 0 AND ' +
    '     remessa.cd_arquivo IS NULL '+
    ' GROUP BY ' +
    '     remessa.cd_resp, ' +
    '     remessa.nr_nossonumero, ' +
    '     remessa.cd_ocorrencia '+
    ' ORDER BY '+
    '     remessa.cd_envio ASC ';

  S_OP = ' AND ';
  S_REGISTRO_SEQUENCIA = '[registro_sequencia]';
  S_REGISTRO_SEQUENCIA1 = '[registro_sequencia1]';
  S_REGISTRO_SEQUENCIA2 = '[registro_sequencia2]';
  S_LINHA_NUMERO = '[linha_numero]';
  S_GLUE_MYSQL = ', ';
  S_FORMATED_VALUE_MYSQL_WITHOUT_PAD = 'COALESCE(%s, '''')';
  S_FORMATED_VALUE_MYSQL = '%s(COALESCE(%s,''''), %s, ''%s'')';
  S_CONCAT_MYSQL = 'CONCAT(%s)';
var
  i, LIContatos, LIContador, LIContaLinhas, LIContLinhaCont, Inicio,
  Tamanho: integer;
  LSGlue, LSSQL, LSValue, LSSize, LSFill, LSTemp: string;
  LSlTemp: TStringList;
  LContatos: array[1..10] of TStringList;
  qryLayout: TUMZQuery;
begin

  DM.CriarConsulta(qryLayout);

  qryLayoutEspec.Close;
  qryLayoutEspec.ParamByName('cd_layout').AsInteger := TLayout(cbLayouts.Items.Objects[cbLayouts.ItemIndex]).getCdLayout();
  qryLayoutEspec.ParamByName('cd_tipo').AsInteger := 2;
  qryLayoutEspec.Open;

  LIContLinhaCont := 1;

  while not qryLayoutEspec.Eof do
  begin
    LSValue := StringReplace(qryLayoutEspecds_valor.AsString, '"', '''', [rfReplaceAll]);
    LSSize  := qryLayoutEspecnr_tamanho.AsString;
    LSFill  := qryLayoutEspecchr_fill.AsString;

    // Preenchimento padrão
    if LSFill = '' then
    begin
      LSFill := ' ';
    end;

    // Valor padrão
    if LSValue = '' then
    begin
      LSValue := ''' ''';
    end;

    // Parâmetro fixo
    if (LSValue = S_REGISTRO_SEQUENCIA) or
       (LSValue = S_REGISTRO_SEQUENCIA1) or
       (LSValue = S_REGISTRO_SEQUENCIA2) then
    begin
      RemInfo.Values['RegSeq.Size'] := LSSize;
      RemInfo.Values['RegSeq.Fill'] := LSFill;
      LSTemp := Format('''%s''', [LSValue]);

    end else if LSValue = S_LINHA_NUMERO then
    begin
      RemInfo.Values['Linha.Size'] := LSSize;
      RemInfo.Values['Linha.Fill'] := LSFill;
      LSTemp := Format('''%s''', [LSValue]);
       
    end else if LSValue = '[linha_continua]' then
    begin
      RemInfo.Values['LinhaC.Size'] := LSSize;
      RemInfo.Values['LinhaC.Fill'] := LSFill;

      // Eu quero ver quantas vezes ele passou por aqui
      RemInfo.Values['LinhaC.Qtd'] := RemInfo.Values['LinhaC.Qtd'] + 'X';
         
      LSTemp := Format('''[linha_continua_%d]''', [LIContLinhaCont]);

      Inc(LIContLinhaCont);
       
    end else if LeftStr(LSValue, 4) = '[dv:' then
    begin
      // Digito verificador
      LSlTemp := TStringList.Create;
      try
        LSTemp := Copy(LSValue, 2, Length(LSValue) - 2);
        SplitString(LSTemp, ':', LSlTemp);
        RemInfo.Values['DV.Num'] := LSlTemp.Strings[1];
        RemInfo.Values['DV.Tipo'] := LSlTemp.Strings[2];
        RemInfo.Values['DV.Banco'] := LSlTemp.Strings[3];
        RemInfo.Values['DV.Valor'] :=  Format(', (%s) DIGITO_VERIFICADOR', [LSlTemp.Strings[4]]);
        RemInfo.Values['DV.Size'] := LSSize;
        RemInfo.Values['DV.Fill'] := LSFill;
        LSTemp := '''[DIGITO_VERIFICADOR]''';
      finally
        LSlTemp.Free;
      end;
      
    end else if LeftStr(LSValue, 9) = '[contato:' then
    begin
      // Contato
      Inc(LIContatos);
      LContatos[LIContatos] := TStringList.Create;
      LSlTemp := TStringList.Create;
      try
        LSTemp := Copy(LSValue, 2, Length(LSValue) - 2);
        SplitString(LSTemp, ':', LSlTemp);
        LContatos[LIContatos].Values['Pessoa'] := LSlTemp.Strings[1];
        LContatos[LIContatos].Values['Contato'] := LSlTemp.Strings[2];
        LContatos[LIContatos].Values['Cont.Size'] := LSSize;
        LContatos[LIContatos].Values['Cont.Fill'] := LSFill;
        // Formato: [contato:aluno/responsavel:contato:tamanho]
        LSTemp := Format('''[contato_%d]''', [LIContatos]);
      finally
        LSlTemp.Free;
      end;
      
    end else if LeftStr(LSValue, 25) = '[contato_somente_numeros:' then
    begin
      // Contato
      Inc(LIContatos);
      LContatos[LIContatos] := TStringList.Create;
      LSlTemp := TStringList.Create;
      try
        LSTemp := Copy(LSValue, 2, Length(LSValue) - 2);
        SplitString(LSTemp, ':', LSlTemp);
        LContatos[LIContatos].Values['Pessoa'] := LSlTemp.Strings[1];
        LContatos[LIContatos].Values['Contato'] := LSlTemp.Strings[2];
        LContatos[LIContatos].Values['Cont.Size'] := LSSize;
        LContatos[LIContatos].Values['Cont.Fill'] := LSFill;
        LContatos[LIContatos].Values['Mascara'] := 'contato_somente_numeros';
        // Formato: [contato:aluno/responsavel:contato:tamanho]
        LSTemp := Format('''[contato_%d]''', [LIContatos]);
      finally
        LSlTemp.Free;
      end;

    end else if LSSize = '-1' then
    begin
      LSTemp := Format(S_FORMATED_VALUE_MYSQL_WITHOUT_PAD, [LSValue]);

    end else begin
    
      // Lado do preenchimento
      if LSFill = '0' then
      begin
        LSTemp := 'LPAD'
      end else begin
        LSTemp := 'RPAD';
      end;

      LSTemp := Format(S_FORMATED_VALUE_MYSQL, [LSTemp, LSValue, LSSize, LSFill]);
    end;

    LSSQL := LSSQL + LSGlue + LSTemp;
    LSGlue := S_GLUE_MYSQL;
    qryLayoutEspec.Next;
  end;
  
  qryLayoutEspec.Close;

  if LSSQL = '' then
  begin
    LSSQL := '''''';
  end;

  try
    qryLayout.Close;
    qryLayout.SQL.Text := Format(S_SQL_DADOS, [Format(S_CONCAT_MYSQL, [LSSQL]), RemInfo.Values['DV.Valor']]);
    qryLayout.ParamByName('cd_layout').AsInteger := TLayout(cbLayouts.Items.Objects[cbLayouts.ItemIndex]).getCdLayout();

    try
      qryLayout.Open;

      if qryLayout.IsEmpty then
      begin
        Mensagem('Nenhum registro de cabeçalho!!', 'Erro!', MB_ICONERROR + MB_OK, Handle);
        Result := false;
        qryLayout.Close;
        Exit;
      end;

      LIContador := 1;

      while not qryLayout.Eof do
      begin
        Inc(LIContaLinhas);
        Inc(iLinhaCount);
        LSTemp := qryLayout.FieldByName('detalhes').AsString;
        // Digito verificador
        if RemInfo.Values['DV.Valor'] <> '' then
        begin
          if RemInfo.Values['DV.Num'] = '11' then
          begin
            LSGlue := DV11(qryLayout.FieldByName('DIGITO_VERIFICADOR').AsString,
              RemInfo.Values['DV.Tipo'],
              RemInfo.Values['DV.Banco'])
          end else if RemInfo.Values['DV.Num'] = '10' then
          begin
            LSGlue := DV10(qryLayout.FieldByName('DIGITO_VERIFICADOR').AsString,
              RemInfo.Values['DV.Banco'])
          end else if RemInfo.Values['DV.Num'] = 'A2' then
          begin
            LSGlue := DVA2(qryLayout.FieldByName('DIGITO_VERIFICADOR').AsString,
              RemInfo.Values['DV.Tipo'],
              RemInfo.Values['DV.Banco'])
          end else
          begin
            LSGlue := '0';
          end;

          // Substitui
          LSTemp := StringReplace(LSTemp, '[DIGITO_VERIFICADOR]',
            FormataSequencia(LSGlue, StrToInt(RemInfo.Values['DV.Size']),
            RemInfo.Values['DV.FIll']), [rfReplaceAll]);
        end;

        if RemInfo.Values['RegSeq.Size'] <> '' then
        begin
          LSTemp := StringReplace(LSTemp, S_REGISTRO_SEQUENCIA,
                      FormataSequencia(Format('%d', [LIContador]),
                      StrToInt(RemInfo.Values['RegSeq.Size']),
                      RemInfo.Values['RegSeq.Fill']), [rfReplaceAll]);

          LSTemp := StringReplace(LSTemp, S_REGISTRO_SEQUENCIA1,
                      FormataSequencia(Format('%d', [LIContador * 2 - 1]),
                      StrToInt(RemInfo.Values['RegSeq.Size']),
                      RemInfo.Values['RegSeq.Fill']), [rfReplaceAll]);

          LSTemp := StringReplace(LSTemp, S_REGISTRO_SEQUENCIA2,
                      FormataSequencia(Format('%d', [LIContador * 2]),
                      StrToInt(RemInfo.Values['RegSeq.Size']),
                      RemInfo.Values['RegSeq.Fill']), [rfReplaceAll]);
        end;

        if RemInfo.Values['Linha.Size'] <> '' then
        begin
          LSTemp := StringReplace(LSTemp, S_LINHA_NUMERO,
            FormataSequencia(Format('%d', [iLinhaCount]),
            StrToInt(RemInfo.Values['Linha.Size']),
            RemInfo.Values['Linha.Fill']), [rfReplaceAll]);
        end;

        if RemInfo.Values['LinhaC.Size'] <> '' then
        begin
          LIContLinhaCont := Length(RemInfo.Values['LinhaC.Qtd']);
          for LIContLinhaCont := 1 to Length(RemInfo.Values['LinhaC.Qtd']) do
          begin
            LSTemp := StringReplace(LSTemp, Format('[linha_continua_%d]', [LIContLinhaCont]),
              FormataSequencia(IntToStr(LILinhaContinua),
              StrToInt(RemInfo.Values['LinhaC.Size']),
              RemInfo.Values['LinhaC.Fill']), [rfReplaceAll]);
             // Se houve configuração da ocorrencia para cortar alguma linha/segmento, contar somente uma vez
             if (qryLayout.FieldByName('nr_posicao_inicio').AsInteger <= 0) OR (LIContLinhaCont = 1) then begin
                INC( LILinhaContinua );
             end;
          end;
                      
        end;

        for i := 1 to LIContatos do
        begin
          qryContatos.Close;
          if LContatos[i].Values['Pessoa'] = 'responsavel' then
          begin
            qryContatos.ParamByName('cd_pessoa').AsInteger := qryLayout.FieldByName('codresp').AsInteger;
          end else begin
            qryContatos.ParamByName('cd_pessoa').AsInteger := qryLayout.FieldByName('codaluno').AsInteger;
          end;

          qryContatos.ParamByName('cd_contato').AsString := LContatos[i].Values['Contato'];
          qryContatos.Open;

          if LContatos[i].Values['Mascara'] = '' then
          begin
            LSTemp := StringReplace(LSTemp, Format('[contato_%d]', [i]),
              FormataSequencia(qryContatosDS_CONTATO.AsString,
              StrToInt(LContatos[i].Values['Cont.Size']),
              LContatos[i].Values['Cont.Fill']), [rfReplaceAll]);
          end;

          if LContatos[i].Values['Mascara'] <> '' then
          begin
            LSTemp := StringReplace(LSTemp, Format('[contato_%d]', [i]),
              FormataSequencia(qryContatosDS_CONTATO.AsString,
              StrToInt(LContatos[i].Values['Cont.Size']),
              LContatos[i].Values['Cont.Fill'], True), [rfReplaceAll]);
          end;
        end;

        Inicio := qryLayout.FieldByName('nr_posicao_inicio').AsInteger;
        Tamanho := qryLayout.FieldByName('nr_tamanho').AsInteger;

        if (Inicio <> 0) and (Tamanho <> 0) then
        begin
           LSTemp := Copy(LSTemp, Inicio, Tamanho);
        end;        

        while AnsiPos('||', LSTemp) > 0 do
        begin
          RemDados.Add(Copy(LSTemp, 1, AnsiPos('||', LSTemp) - 1));
          LSTemp := Copy(LSTemp, AnsiPos('||', LSTemp) + 2, Length(LSTemp));
        end;

        RemDados.Add(LSTemp);
        Inc(LIContador);
        qryLayout.Next;
      end;

      Result := true;
      qryLayout.Close;

    except
      Mensagem('Erro nos detalhes do Layout do Arquivo de Remessa (Detalhes)', 'Erro!', MB_ICONERROR + MB_OK, Handle);
      Result := false;
    end;

    qryLayout.Close;
 except
 end;
 
end;

function TfrmRemessaBancaria.geraRodape(): boolean;
const
  S_SQL_DADOS =
    ' SELECT '+
    '     %s rodape ' +
    ' FROM ' +
    '     rem_envios remessa ' +
    '     INNER JOIN rem_status rem_status ON (rem_status.nr_nossonumero = remessa.nr_nossonumero)' +
    '     INNER JOIN rem_envios registro ON (rem_status.cd_envio_registro = registro.cd_envio) '+
    '     INNER JOIN pessoas resp ON (remessa.cd_resp = resp.cd_pessoa) ' +
    '     INNER JOIN rem_layouts layout ON (remessa.cd_layout = layout.cd_layout) ' +
    '     LEFT JOIN fin_boleto boleto ON (boleto.cd_boleto = remessa.cd_boleto) ' +
    '     LEFT JOIN fin_cadastro_contas financeiro ON (layout.cd_caixa = financeiro.cd_caixa)  ' +
    ' WHERE ' +
    '     layout.cd_layout = :cd_layout AND ' +
    '     remessa.sn_ignorado = 0 AND ' +
    '     remessa.cd_arquivo IS NULL '+
    ' GROUP BY ' +
    '     layout.cd_layout '+
    ' ORDER  BY '+
    '     remessa.cd_envio ASC ';
  S_OP = ' AND ';
  S_ARQUIVO_NUMERO = '[arquivo_numero]';
  S_LINHA_NUMERO = '[linha_numero]';
  S_LINHAS_TOTAL = '[linhas_total]';
  S_GLUE_MYSQL = ', ';
  S_FORMATED_VALUE_MYSQL_WITHOUT_PAD = 'COALESCE(%s, '''')';
  S_FORMATED_VALUE_MYSQL = '%s(COALESCE(%s,''''), %s, ''%s'')';
  S_CONCAT_MYSQL = 'CONCAT(%s)';
var
  sSQL: string;
  sAux, sGlue: string;
  sFill, sSize, sValor: string;
  LIContaLinhas: integer;
  LSValue, LSSize, LSFill, LSTemp, LSSQL, LSGlue: string;
  qryLayout: TUMZQuery;
begin

  DM.CriarConsulta(qryLayout);

  qryLayoutEspec.Close;
  qryLayoutEspec.ParamByName('cd_layout').AsInteger := TLayout(cbLayouts.Items.Objects[cbLayouts.ItemIndex]).getCdLayout();
  qryLayoutEspec.ParamByName('cd_tipo').AsInteger := 4;
  qryLayoutEspec.Open;

  while not qryLayoutEspec.Eof do
  begin
    LSValue := StringReplace(qryLayoutEspecds_valor.AsString, '"', '''', [rfReplaceAll]);
    LSSize := qryLayoutEspecnr_tamanho.AsString;
    LSFill := qryLayoutEspecchr_fill.AsString;

    // Parâmetro fixo
    if LSValue = S_ARQUIVO_NUMERO then
    begin
      LSValue := Format('''%d''', [getNumeroArquivoRemessa + 1]);

    // Valor padrão
    end else if LSValue = '' then
    begin
      LSValue := ''' ''';
    end;

    if LSValue = S_LINHAS_TOTAL then
    begin
       LSValue := IntToStr(RemDados.Count);
    end;
      
    // Preenchimento padrão
    if LSFill = '' then
    begin
      LSFill := ' ';
    end;

    if LSValue = S_LINHA_NUMERO then
    begin
      RemInfo.Values['Linha.Size'] := LSSize;
      RemInfo.Values['Linha.Fill'] := LSFill;
      LSTemp := Format('''%s''', [LSValue]);
    end else if LSValue = '[linha_continua]' then
    begin
      RemInfo.Values['LinhaC.Size'] := LSSize;
      RemInfo.Values['LinhaC.Fill'] := LSFill;

      LSTemp := '''[linha_continua_rod]''';
    end else if LSSize = '-1' then
    begin
      LSTemp := Format(S_FORMATED_VALUE_MYSQL_WITHOUT_PAD, [LSValue]);
       
    // Lado do preenchimento
    end else begin

      if LSFill = '0' then
      begin
        LSTemp := 'LPAD'

      end else begin
        LSTemp := 'RPAD';
      end;

      LSTemp := Format(S_FORMATED_VALUE_MYSQL, [LSTemp, LSValue, LSSize, LSFill]);
    end;

    LSSQL := LSSQL + LSGlue + LSTemp;
    LSGlue := S_GLUE_MYSQL;

    qryLayoutEspec.Next;
  end;
  qryLayoutEspec.Close;

  if LSSQL = '' then
  begin
    LSSQL := '''''';
  end;

  try
    qryLayout.Close;
    qryLayout.SQL.Text := Format(S_SQL_DADOS, [Format(S_CONCAT_MYSQL, [LSSQL])]);
    qryLayout.ParamByName('cd_layout').AsInteger := TLayout(cbLayouts.Items.Objects[cbLayouts.ItemIndex]).getCdLayout();

    try
      qryLayout.Open;

      if qryLayout.IsEmpty then
      begin
        Mensagem('Nenhum registro de rodapé!', 'Erro!', MB_ICONERROR + MB_OK, Handle);
        Result := false;
        qryLayout.Close;
        Exit;
      end;

      Inc(LIContaLinhas);
      Inc(iLinhaCount);
      LSTemp := qryLayout.FieldByName('RODAPE').AsString;

      if RemInfo.Values['Linha.Size'] <> '' then
      begin
        LSTemp := StringReplace(LSTemp, S_LINHA_NUMERO,
          FormataSequencia(Format('%d', [iLinhaCount]),
          StrToInt(RemInfo.Values['Linha.Size']),
          RemInfo.Values['Linha.Fill']), [rfReplaceAll]);
      end;

      if RemInfo.Values['LinhaC.Size'] <> '' then
      begin
        LSTemp := StringReplace(LSTemp, '[linha_continua_rod]',
            formataSequencia(
              Format('%d', [LILinhaContinua]),
              StrToInt(RemInfo.Values['LinhaC.Size']),
              RemInfo.Values['LinhaC.Fill']), [rfReplaceAll]);

        LILinhaContinua := LILinhaContinua + 1;
      end;

      while AnsiPos('||', LSTemp) > 0 do
      begin
        RemDados.Add(Copy(LSTemp, 1, AnsiPos('||', LSTemp) - 1));
        LSTemp := Copy(LSTemp, AnsiPos('||', LSTemp) + 2, Length(LSTemp));
      end;

      RemDados.Add(LSTemp);
      Result := true;

    except
       Mensagem('Erro nos detalhes do Layout do Arquivo de Remessa (Rodape)', 'Erro!', MB_ICONERROR + MB_OK, Handle);
       Result := false;
    end;

    qryLayout.Close;
  except
  end;
end;

function TfrmRemessaBancaria.getNumeroArquivoRemessa(): integer;
begin
  Result := TLayout(cbLayouts.Items.Objects[cbLayouts.ItemIndex]).getNrRemessa();
end;

function TfrmRemessaBancaria.formataSequencia(sValor: string; iSize: Integer;
  sFill: string; isSomenteNumeros: Boolean = False ): string;
var
  sAux: string;
begin
  sAux := DupeString(sFill, iSize);
  if (sFill = '0') then
  begin
    sAux := sAux + (sValor);
    sAux := RightStr(sAux, iSize);
  end else begin
    sAux := sValor + sAux;
    sAux := LeftStr(sAux, iSize);
  end;

  if isSomenteNumeros = True then
  begin
    sAux := stringReplace(sAux, '(', '', []);
    sAux := stringReplace(sAux, ')', '', []);
    sAux := stringReplace(sAux, '-', '', []);
  end;

  Result := sAux;
end;

function TfrmRemessaBancaria.getNomeArquivoRemessa(): string;
var
  nome, sAux : string;
  i, cont : Integer;
  qLayout : TUMZQuery;
  NmArquivo : String;
  ix : integer;

  dia, mes, ano : word;

  aM : Array [1..12] of string;
begin
  // Função para descobrir o nome do arquivo remessa
  // Buscar o padrao do nome do arquivo na tabela remessas
  DM.CriarConsulta(qLayout);

  qLayout.SQL.Text := 'SELECT nm_arquivo FROM rem_layouts WHERE cd_layout = ' + IntToStr(TLayout(cbLayouts.Items.Objects[cbLayouts.ItemIndex]).getCdLayout());
  qLayout.Open();

  NmArquivo := Trim(qLayout.FieldByName('nm_arquivo').AsString);

  // Formato Padrão, continuar usando o mesmo modelo
  if NmArquivo = '' then
  begin
    NmArquivo := 'CB[dd][mm]A[c].REM';
  end;

  // Substituir [mm] pelo mes com 2 digitos
  NmArquivo := ReplaceStr(NmArquivo, '[mm]', FormatDateTime('mm', Now()));

  // Substituir [dd] pelo dia com 2 digitos
  NmArquivo := ReplaceStr(NmArquivo, '[dd]', FormatDateTime('dd', Now()));

  // Substituir [aa] pelo ano com 2 digitos
  NmArquivo := ReplaceStr(NmArquivo, '[aa]', FormatDateTime('yy', Now()));

  // Substituir [aa] pelo ano com 4 digitos
  NmArquivo := ReplaceStr(NmArquivo, '[aaaa]', FormatDateTime('yyyy', Now()));

  NmArquivo := ReplaceStr(NmArquivo, '[hh]', FormatDateTime('hh', Now));
  NmArquivo := ReplaceStr(NmArquivo, '[nn]', FormatDateTime('nn', Now));
  NmArquivo := ReplaceStr(NmArquivo, '[ss]', FormatDateTime('ss', Now));

  if Pos('[m]', NmArquivo) > 0 then
  begin
    DecodeDate(Now, ano, mes, dia);

    case mes of
      1..9 : NmArquivo := ReplaceStr(NmArquivo, '[m]', IntToStr(mes));
      10   : NmArquivo := ReplaceStr(NmArquivo, '[m]', 'O');
      11   : NmArquivo := ReplaceStr(NmArquivo, '[m]', 'N');
      12   : NmArquivo := ReplaceStr(NmArquivo, '[m]', 'D');
    end;
  end;

  Nome := NmArquivo;


  if Pos('|CRM|', NmArquivo) > 0 then begin
    // Retirar o | e testar
    // Regra específica para o banco SICREDI
    // CRM RM2 RM3 ...
    nome := ReplaceStr(NmArquivo, '|', '');

    if not FileExists(nome) then begin
       result := nome;
       Exit;
    end else begin

      NmArquivo := ReplaceStr(NmArquivo, '|CRM|', 'RM[c]');
      ix:= 2;

    end;

  end else begin

    ix := 1;

  end;

  cont := 0;

  if Pos('[c]', NmArquivo) > 0 then cont := 9;

  for i := ix to cont do begin

     Nome := ReplaceStr(NmArquivo, '[c]', FillString(IntToStr(i), alRight, '0', 1, false));

     if not FileExists(nome) then begin
        result := nome;
        Exit;
     end;

  end;

  Result := nome;

  FreeAndNil(qLayout);

  Exit;
end;

function TfrmRemessaBancaria.getCdUltimoArquivo(): integer;
const
  SQL_GET_ULTIMO_CD_ARQUIVO =
    ' SELECT '+
    '   MAX(cd_arquivo) cd_arquivo  '+
    ' FROM '+
    '   rem_arquivos '+
    ' WHERE '+
    '   sn_ignorado = 0 ';
var
  qyUltimoArquivo: TUMZQuery;
begin

  DM.CriarUniConsulta(qyUltimoArquivo);

  // Busca o código do último arquivo
  qyUltimoArquivo.Close;
  qyUltimoArquivo.SQL.Text := SQL_GET_ULTIMO_CD_ARQUIVO;
  qyUltimoArquivo.Open;

  Result := -1;
  if not qyUltimoArquivo.Eof then
  begin
    Result := qyUltimoArquivo.FieldByName('cd_arquivo').AsInteger;
  end;

  FreeAndNil(qyUltimoArquivo);

end;

procedure TfrmRemessaBancaria.dbgArquivoDrawColumnCell(Sender: TObject;
  const Rect: TRect; DataCol: Integer; Column: TColumn; State: TGridDrawState);
begin
  if (Column.Field.FieldName = 'ds_situacao_completa') and
     not(gdSelected IN State) then
  begin

    // Se a situação do arquivo for confirmado envio ao banco pelo usuário
    if qyArquivosds_situacao.AsString = 'U' then
    begin
      TGeneral.AlterarCorCelula(dbgArquivo, Rect, DataCol, Column, State, TGeneral.ColorFromHTML('#FFFF00'));
    end;

    // Se a situação do arquivo for confirmado pelo retorno
    if qyArquivosds_situacao.AsString = 'R' then
    begin
      TGeneral.AlterarCorCelula(dbgArquivo, Rect, DataCol, Column, State, TGeneral.ColorFromHTML('#00FF00'));

    end;

  end;
end;

{
  Essa procedure efetua o tratamento para apresentar a combo de Exportado para Rejeitado,
  Somente apresenta essa possibilidade quando o status estiver como
  Exportado e somente permite alterar para Rejeitado.
  Esse comportamento é permitido através de uma combo na grid.
}

procedure TfrmRemessaBancaria.dbgConteudoArquivoDrawColumnCell(Sender: TObject;
  const Rect: TRect; DataCol: Integer; Column: TColumn; State: TGridDrawState);
var
  cor: integer;
begin

  // Verifica se permite alterar o status de um NN
  // Apenas se o status atual for Exportado e permite modificar para Rejeitado
  // Exportado >> Rejeitado

  if (Column.FieldName = 'ds_status') and
     (gdSelected IN State) and
     (qyConteudoArquivo.FieldByName('ds_status').AsString = 'Exportado') then
  begin
    cbStatus.Left := Rect.Left + dbgConteudoArquivo.Left;
    cbStatus.Top := Rect.Top + dbgConteudoArquivo.Top;

    cbStatus.Width := Rect.Right - Rect.Left;
    cbStatus.Height := Rect.Bottom - Rect.Top;

    // Seleciona a opção Exportado
    cbStatus.ItemIndex := 0;

    cbStatus.Visible := True;
  end else begin
    cbStatus.Visible := False;
  end;

  // Pinta a celula com o conteúdo exportado para destacar a mesma
  if (Column.Field.FieldName = 'ds_status') and
     not(gdSelected IN State) then
  begin

    // Se a situação do arquivo for confirmado envio ao banco pelo usuário
    if (qyConteudoArquivo.FieldByName('ds_status').AsString = 'Exportado') then
    begin
      TGeneral.AlterarCorCelula(dbgConteudoArquivo, Rect, DataCol, Column, State, TGeneral.ColorFromHTML('#FFFF00'));
    end;

  end;

end;

{
  Essa procedure efetua a seleção da coluna que pode ser selecionada na
  grid de fila de remessa
}

procedure TfrmRemessaBancaria.dbgFilaRemessaCellClick(Column: TColumn);
var
  index: integer;
  PG: TPoint;
  GC: TGridCoord;
begin
  if not(qyFilaRemessa.RecordCount > 0) then
  begin
    Exit;
  end;

  PG := dbgFilaRemessa.ScreenToClient(Mouse.CursorPos);
  GC := dbgFilaRemessa.MouseCoord( PG.X, PG.Y ) ;

  if GC.X = 1 then
  begin
    index := arrSelecionadosFila.IndexOf(qyFilaRemessacd_envio.AsString);

    if index >= 0 then
    begin
      arrSelecionadosFila.Delete(index);
    end else begin
      arrSelecionadosFila.Add(qyFilaRemessacd_envio.AsString);
    end;

    dbgFilaRemessa.Repaint();
  end;
  
end;

{
  Esse método realiza o desenho do retangulo de selecionado nos registros da fila
  de remessa na coluna de seleção da grid.
}

procedure TfrmRemessaBancaria.dbgFilaRemessaDrawColumnCell(Sender: TObject;
  const Rect: TRect; DataCol: Integer; Column: TColumn; State: TGridDrawState);
const
  IsChecked: array[Boolean] of Integer =
    (DFCS_BUTTONCHECK, DFCS_BUTTONCHECK or DFCS_CHECKED);
var
  DrawRect: TRect;
  index, cor: integer;
begin

  if (Column.Field.FieldName = 'ds_criticas')  and (qyFilaRemessa.RecordCount > 0)
  and not(gdSelected IN State) 
  then begin
      // Apresentar a coluna de críticas em vermelho quando houver alguma crítica de algum campo.
      // As críticas são montadas em um CONCAT dentro e um unico campo no SQL.
      if qyFilaRemessads_criticas.AsString <> '' then begin

         TGeneral.AlterarCorCelula(dbgFilaRemessa, Rect, DataCol, Column, State, TGeneral.ColorFromHTML('#FFFF00'));

      end;

  end;  
  if (Column.FieldName = 'sn_selecao') and (qyFilaRemessa.RecordCount > 0) then
  begin
    dbgFilaRemessa.Canvas.FillRect(Rect);

    if (gdFocused in State) then
    begin
      DrawRect.Left := Rect.Left + 1;
    end else begin
      DrawRect.Left := Rect.Left + 2;
    end;

    DrawRect.Right := Rect.Right - 2;
    DrawRect.Top := Rect.Top + 2;
    DrawRect.Bottom := Rect.Bottom - 2;

    index := arrSelecionadosFila.IndexOf(qyFilaRemessacd_envio.AsString);

    DrawFrameControl(
      dbgFilaRemessa.Canvas.Handle,
      DrawRect,
      DFC_BUTTON,
      IsChecked[index >= 0]
    );
  end;

  
end;

procedure TfrmRemessaBancaria.dtpFimExportacaoChangeDate(Sender: TObject);
begin
  self.filtrarArquivos();
end;

procedure TfrmRemessaBancaria.dtpInicioExportacaoChangeDate(Sender: TObject);
begin
  self.filtrarArquivos();
end;

procedure TfrmRemessaBancaria.edPesquisarConteudoArquivoEnter(Sender: TObject);
begin
  if edPesquisarConteudoArquivo.Text = TEXTO_PESQUISAR then
  begin
    edPesquisarConteudoArquivo.Text := '';
  end;
end;

procedure TfrmRemessaBancaria.edPesquisarConteudoArquivoExit(Sender: TObject);
begin
  if edPesquisarConteudoArquivo.Text = '' then
  begin
    edPesquisarConteudoArquivo.Text := TEXTO_PESQUISAR;
  end;
end;

procedure TfrmRemessaBancaria.edPesquisarConteudoArquivoKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  if Key = VK_RETURN then
  begin
    self.filtrarConteudoArquivo();
  end;
end;

procedure TfrmRemessaBancaria.edPesquisarFilaEnter(Sender: TObject);
begin
  if edPesquisarFila.Text = TEXTO_PESQUISAR then
  begin
    edPesquisarFila.Text := '';
  end;
end;

procedure TfrmRemessaBancaria.edPesquisarFilaExit(Sender: TObject);
begin
  if edPesquisarFila.Text = '' then
  begin
    edPesquisarFila.Text := TEXTO_PESQUISAR;
  end;
end;

procedure TfrmRemessaBancaria.edPesquisarFilaKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  if Key = VK_RETURN then
  begin
    self.filtrarFilaRemessa();
  end;
end;

procedure TfrmRemessaBancaria.filtrarFilaRemessa();
var
  dsFiltro: string;
  objLayout: TLayout;
begin

  // Fecha o arquivo de remessa
  qyFilaRemessa.Close;

  btnIncluir.Enabled := False;

  // Busca o layout selecionado
  objLayout := TLayout(cbLayouts.Items.Objects[cbLayouts.ItemIndex]);

  // Verifica se a posição selecionada não possui nenhum layout
  if objLayout = nil then
  begin
    Exit;
  end;

  btnIncluir.Enabled := objLayout.OrigemID in [3, 101];

  dsFiltro := edPesquisarFila.Text;

  // Verifica se o usuário NÃO informou um texto na pesquisa
  // Texto é igual ao placeholder
  if edPesquisarFila.Text = TEXTO_PESQUISAR then
  begin
    dsFiltro := '';
  end;
  
  pnCriticas.Visible := false;

  // Executa o SQL para filtrar a fila de envio para o layout selecionado
  qyFilaRemessa.ParamByName('cd_layout').AsInteger := objLayout.getCdLayout();
  qyFilaRemessa.ParamByName('ds_filtro').AsString := dsFiltro;
  qyFilaRemessa.Open;


  // Executa o SQL para filtrar a fila de envio para o layout selecionado
  qyTemCriticas.Close();
  qyTemCriticas.ParamByName('cd_layout').AsInteger := objLayout.getCdLayout();
  qyTemCriticas.ParamByName('ds_filtro').AsString := dsFiltro;
  qyTemCriticas.Open;

  pnCriticas.Visible := qyTemCriticas.FieldByName('sn_criticas').AsInteger = 1;

  // Verifica se deve bloquear ou habilitar o botão de gerar arquivo
  verificaHabilitarGerarArquivo();

end;

procedure TfrmRemessaBancaria.filtrarArquivos();
var
  objLayout: TLayout;
begin

  // Verifica se NÃO foi selecionado nenhum layout
  if cbLayouts.ItemIndex = -1 then
  begin
    Exit;
  end;

  // Busca o layout selecionado
  objLayout := TLayout(cbLayouts.Items.Objects[cbLayouts.ItemIndex]);

  // Verifica se a posição selecionada não possui nenhum layout 
  if objLayout = nil then
  begin
    Exit;
  end;

  // Executa o SQL para filtrar a fila de envio para o layout selecionado
  qyArquivos.Close;
  qyArquivos.ParamByName('cd_layout').AsInteger := objLayout.getCdLayout();
  qyArquivos.ParamByName('dt_inicio').AsString := formatdatetime('yyyy-mm-dd 00:00:00', dtpInicioExportacao.getDate());
  qyArquivos.ParamByName('dt_fim').AsString := formatdatetime('yyyy-mm-dd 23:59:59', dtpFimExportacao.getDate());
  qyArquivos.Open;

end;

procedure TfrmRemessaBancaria.filtrarConteudoArquivo();
var
  dsFiltro: string;
  objLayout: TLayout;
begin

  // Verifica se NÃO foi selecionado nenhum layout
  if cbLayouts.ItemIndex = -1 then
  begin
    Exit;
  end;

  // Busca o layout selecionado
  objLayout := TLayout(cbLayouts.Items.Objects[cbLayouts.ItemIndex]);

  // Verifica se a posição selecionada não possui nenhum layout 
  if objLayout = nil then
  begin
    Exit;
  end;

  dsFiltro := edPesquisarConteudoArquivo.Text;

  // Verifica se o usuário NÃO informou um texto na pesquisa
  // Texto é igual ao placeholder
  if edPesquisarConteudoArquivo.Text = TEXTO_PESQUISAR then
  begin
    dsFiltro := '';
  end;
  
  // Executa o SQL para filtrar a fila de envio para o layout selecionado
  qyConteudoArquivo.Close;
  qyConteudoArquivo.ParamByName('cd_layout').AsInteger := objLayout.getCdLayout();
  qyConteudoArquivo.ParamByName('cd_arquivo').AsInteger := qyArquivos.FieldByName('cd_arquivo').AsInteger;
  qyConteudoArquivo.ParamByName('ds_filtro').AsString := dsFiltro;
  qyConteudoArquivo.Open;

end;

function TfrmRemessaBancaria.possuiLayoutSelecionado(): boolean;
begin
  Result := false;
  if cbLayouts.Items.Objects[cbLayouts.ItemIndex] <> nil then
  begin
    Result := true;
  end;
end;

function TfrmRemessaBancaria.possuiArquivoPendente(): boolean;
const
  SQL_ARQUIVOS_PENDENTES =
    ' SELECT '+
    '     COUNT(DISTINCT ra.cd_arquivo) nr_arquivos '+
    ' FROM '+
    '     rem_arquivos ra '+
    '     INNER JOIN rem_envios re ON (re.cd_arquivo = ra.cd_arquivo) '+
    ' WHERE '+
    '     ra.ds_situacao LIKE "A" AND '+
    '     ra.sn_ignorado = 0 AND '+
    '     re.cd_layout = :cd_layout';
var
  qyArquivos: TUMZQUery;
begin
  DM.CriarConsulta(qyArquivos);

  qyArquivos.Close;
  qyArquivos.SQL.Text := SQL_ARQUIVOS_PENDENTES;
  qyArquivos.ParamByName('cd_layout').AsInteger := TLayout(cbLayouts.Items.Objects[cbLayouts.ItemIndex]).getCdLayout();
  qyArquivos.Open;

  Result := false;
  if (qyArquivos.FieldByName('nr_arquivos').AsInteger > 0) then
  begin
    Result := true;
  end;

  FreeAndNil(qyArquivos);
end;

procedure TfrmRemessaBancaria.verificaHabilitarGerarArquivo();
begin

  btGerarArquivoFila.Enabled := false;
  if qyFilaRemessa.RecordCount > 0 then
  begin
    btGerarArquivoFila.Enabled := true;
  end;

end;

{ TLayout }

function TLayout.getCdCaixa: integer;
begin
  Result := self.cdCaixa;
end;

function TLayout.getCdLayout: integer;
begin
  Result := self.cdLayout;
end;

function TLayout.getNmLayout: string;
begin
  Result := self.nmLayout;
end;

function TLayout.getNrRemessa: integer;
begin
  Result := self.nrRemessa;
end;

procedure TLayout.setCdCaixa(cdCaixa: integer);
begin
  self.cdCaixa := cdCaixa;
end;

procedure TLayout.setCdLayout(cdLayout: integer);
begin
  self.cdLayout := cdLayout;
end;

procedure TLayout.setNmLayout(nmLayout: string);
begin
  self.nmLayout := nmLayout;
end;

procedure TLayout.setNrRemessa(nrRemessa: integer);
begin
  self.nrRemessa := nrRemessa;
end;

end.
