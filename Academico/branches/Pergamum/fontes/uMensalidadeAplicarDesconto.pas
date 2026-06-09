unit uMensalidadeAplicarDesconto;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, Grids, DBGrids, ExtCtrls, UMAjuda, DBCtrls, Mask,
  DB, ZAbstractRODataset, UZDataset, Menus, ZAbstractDataset, UMEditMonetario,
  UMEditNumerico;

const
   ALTURA_PADRAO_FORM = 488;
   LARGURA_PADRAO_FORM = 494;

type
  TfrmMensalidadeAplicarDescontos = class(TForm)
    pnDescontos: TPanel;
    lbValorInfoValorBruto: TLabel;
    lbValorBruto: TLabel;
    lbInfoDescAplicados: TLabel;
    lbDescAplicados: TLabel;
    blBruto: TBevel;
    blDescontos: TBevel;
    blLiquidoAntes: TBevel;
    lbInfoLiquidoAntes: TLabel;
    lbLiquidoAntes: TLabel;
    blLiquidoApos: TBevel;
    lbInfoApos: TLabel;
    lbLiquidoApos: TLabel;
    dbgDescontos: TDBGrid;
    btFechar: TBitBtn;
    pnTitulo: TPanel;
    pnInfoAluno: TPanel;
    lbInfoAluno: TLabel;
    lbInfoTurma: TLabel;
    lbInfoVencimento: TLabel;
    lbAluno: TLabel;
    lbTurma: TLabel;
    lbVencimento: TLabel;
    umInfoParcelas: TUMAjuda;
    pnInfoIntervaloParcelas: TPanel;
    lbInfoParcelas: TLabel;
    lbInfoParcelas2: TLabel;
    lbInfoGrid: TLabel;
    pnAplicarDescontos: TPanel;
    lbMotivoDesconto: TLabel;
    rgTipoDesconto: TRadioGroup;
    lbPercentual: TLabel;
    lbCalcularSobre: TLabel;
    cbCalcularSobre: TComboBox;
    lbValorDesconto: TLabel;
    cbRecalcularCondicionaisProporcional: TCheckBox;
    lbObservacao: TLabel;
    btConfirmar: TBitBtn;
    btCancelar: TBitBtn;
    meObservacao: TMemo;
    gbAplicar: TGroupBox;
    lbAte: TLabel;
    rbParcelaSelecionada: TRadioButton;
    rbVariasParcelas: TRadioButton;
    sbAdicionarDesconto: TSpeedButton;
    qyVerificaValoresDiferentes: TUMZReadOnlyQuery;
    qyMensalidade: TUMZReadOnlyQuery;
    dsDescontos: TDataSource;
    qyDescontos: TUMZReadOnlyQuery;
    qyValoresTotais: TUMZReadOnlyQuery;
    pmDescontos: TPopupMenu;
    miExcluir: TMenuItem;
    qyAcoesBaixa: TUMZQuery;
    StringField1: TStringField;
    SmallintField1: TSmallintField;
    qyAcoesBaixacd_acao: TLargeintField;
    edParcelaInicial: TUMEditNumerico;
    edParcelaFinal: TUMEditNumerico;
    edPercentualDesconto: TUMEditMonetario;
    edValorDesconto: TUMEditMonetario;
    cbAcoesBaixa: TComboBox;
    qyAcaoDesconto100: TUMZQuery;
    edAcaoDesconto100: TEdit;
    qyDescontosExcluir: TUMZReadOnlyQuery;
    pnDesabilitaFixo: TPanel;
    umInfoDescontoFixo: TUMAjuda;
    qyAcoesBaixavl_perc_desconto: TFloatField;
    qyAcoesBaixasn_altera_desconto: TIntegerField;
    qyAcoesBaixavl_perc_desconto_plano: TFloatField;
    qyAcoesBaixavl_desconto_plano: TFloatField;
    qyAcoesBaixanr_qtd_planos: TLargeintField;
    qyAcoesBaixasn_condicional_plano: TIntegerField;
    procedure edValorDescontoKeyPress(Sender: TObject; var Key: Char);
    procedure edPercentualDescontoKeyPress(Sender: TObject; var Key: Char);
    procedure edValorDescontoEnter(Sender: TObject);
    procedure edPercentualDescontoEnter(Sender: TObject);
    procedure cbAcoesBaixaChange(Sender: TObject);
    procedure edValorDescontoClick(Sender: TObject);
    procedure edPercentualDescontoClick(Sender: TObject);
    procedure btConfirmarClick(Sender: TObject);
    procedure rgTipoDescontoClick(Sender: TObject);
    procedure cbCalcularSobreChange(Sender: TObject);
    procedure edValorDescontoExit(Sender: TObject);
    procedure edPercentualDescontoExit(Sender: TObject);
    procedure miExcluirClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure informadaParcela(Sender: TObject);
    procedure btCancelarClick(Sender: TObject);
    procedure btFecharClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure sbAdicionarDescontoClick(Sender: TObject);
    procedure rbVariasParcelasClick(Sender: TObject);
    procedure rbParcelaSelecionadaClick(Sender: TObject);
  private
    { Private declarations }
    bExisteParcelasValoresDiferentes: Boolean;
    procedure ajusteAcaoMensalidadeOrigem;
    function verificaFixoInformado: Boolean;
    procedure verificaPossuiAcaoMovimentoCondicional;
    procedure verificaHabilitaDescontoFixo;
    function verificarCamposParcelas: Boolean;
    procedure verificaMostrarDescontoFinanceiro100;
    function isParcelaSelecionadaBaixadaPorDesconto: Boolean;
    procedure limparCamposDesconto;
    procedure aplicarDescontoCondicional;
    procedure aplicarDescontoFixo;
    function verificarCamposInformados: Boolean;
    procedure aplicarDescontoFixo100;
    procedure verificaMostrarAplicarDesconto;
    procedure carregarAcoesMovimento;
    procedure calcularPercentualDesconto;
    procedure calcularValorDesconto;
    procedure excluirDesconto;
    procedure atualizarDescontos;
    procedure carregarDadosMensalidade;

    function existemParcelasValoresDiferentes: Boolean;
    procedure verificaMostrarAdicionarDesconto;
    procedure verificaMostrarVariasParcelas;
  public
    { Public declarations }
    iCodigoMensalidade: Integer;
    mudouValorDesconto : Boolean;
  end;

var
  frmMensalidadeAplicarDescontos: TfrmMensalidadeAplicarDescontos;

implementation

uses uDM, uUsuario, General, uClassMovimento, uItemCombo;

{$R *.dfm}

procedure TfrmMensalidadeAplicarDescontos.btCancelarClick(Sender: TObject);
begin
   // Esconde o painel de mostrar desconto
   sbAdicionarDesconto.Down := False;
   verificaMostrarAdicionarDesconto();
end;

procedure TfrmMensalidadeAplicarDescontos.btConfirmarClick(Sender: TObject);
begin

   // Se a parcela selecionada foi baixada por desconto não permite aplicar outro desconto
   if isParcelaSelecionadaBaixadaPorDesconto() then
   begin
      Mensagem(
         'Parcela selecionada já está baixada, não é possível aplicar desconto.',
         Application.Title,
         MB_OK + MB_ICONSTOP
      );
      Exit;
   end;   

   // Realiza a checagem de campos digitados pelo usuário
   if not verificarCamposInformados() then
   begin
      Exit;
   end;

   // Verifica se foi selecionado o desconto 0 - Fixo
   if rgTipoDesconto.ItemIndex = 0 then
   begin
      aplicarDescontoFixo();
   end;

   // Verifica se foi selecionado o desconto 1 - Condicional
   if rgTipoDesconto.ItemIndex = 1 then
   begin
      aplicarDescontoCondicional();
   end;

   // Verifica se foi selecionado o desconto 2 - Financeiro 100%
   if rgTipoDesconto.ItemIndex = 2 then
   begin
      aplicarDescontoFixo100();
   end;

   // Grava a última inserção na usuário parametros 
   DM.Set_Parametro_usuario( cbAcoesBaixa,    self.Name );
   DM.Set_Parametro_usuario( cbCalcularSobre, self.Name );
   DM.Set_Parametro_usuario( rgTipoDesconto,  self.Name );

   // Limpa a tela de aplicação de descontos e esconde ela
   limparCamposDesconto();

   // Apresenta mensagem de sucesso na aplicação do desconto
   Mensagem(
      'O desconto foi aplicado com sucesso.',
      'Atenção',
      MB_OK + MB_ICONINFORMATION
   );

   // Carrega os descontos atualizados na tela
   atualizarDescontos();
end;

procedure TfrmMensalidadeAplicarDescontos.btFecharClick(Sender: TObject);
begin
   close();
end;

procedure TfrmMensalidadeAplicarDescontos.FormCreate(Sender: TObject);
begin
   // Inicia variaveis do formulário
   bExisteParcelasValoresDiferentes := False;

   // Valores em branco para os campos de intervalo de parcela
   edParcelaInicial.Text := '';
   edParcelaFinal.Text := '';

   // Inicial os campos de texto com valor em branco
   edPercentualDesconto.Clear;
   edValorDesconto.Clear;

   // Ajusta o tamanho da tela padrão na sua criação
   verificaMostrarVariasParcelas();
   verificaMostrarAdicionarDesconto();
end;

procedure TfrmMensalidadeAplicarDescontos.FormShow(Sender: TObject);
begin
   // Atualiza o código da mensalidade de origem caso o mesmo for NULL
   ajusteAcaoMensalidadeOrigem();

   // Verifica se possui desconto condicional, sem ação de movimento vinculada,
   // Nesse caso cria uma ação automática de desconto condicional
   verificaPossuiAcaoMovimentoCondicional();

   // Carregar as ações de baixa de movimento para inclusão de novos descontos
   carregarAcoesMovimento();

   // Verifica se mostra a opção de desconto financeiro de 100%
   verificaMostrarDescontoFinanceiro100();

   // Verifica se habilita a opção de desconto fixo
   verificaHabilitaDescontoFixo();

   // Atualiza os descontos na tela
   atualizarDescontos();

   mudouValorDesconto := true;
end;

procedure TfrmMensalidadeAplicarDescontos.ajusteAcaoMensalidadeOrigem();
var
   qyAjustarOrigemMovimentacao: TUMZQUery;
begin
   DM.CriarConsulta(qyAjustarOrigemMovimentacao);

   // Verifica se a ação de movimento possui código de mensalidade origem
   qyAjustarOrigemMovimentacao.Close;
   qyAjustarOrigemMovimentacao.SQL.Text := 'UPDATE fin_mov_cr SET cd_mensalidade_origem = cd_mensalidade WHERE cd_mensalidade_origem IS NULL AND cd_mensalidade = :cd_mensalidade';
   qyAjustarOrigemMovimentacao.ParamByName('cd_mensalidade').AsInteger := iCodigoMensalidade;
   qyAjustarOrigemMovimentacao.ExecSQL;

end;

procedure TfrmMensalidadeAplicarDescontos.verificaPossuiAcaoMovimentoCondicional();
var
   qyChecaAcaoMovimento: TUMZQUery;
begin
   DM.CriarConsulta(qyChecaAcaoMovimento);

   // Verifica se a mensalidade possui desconto condicional mas não possui ações de movimento condicionais
   qyChecaAcaoMovimento.Close;
   qyChecaAcaoMovimento.SQL.Text := ''+
   ' SELECT '+
   '     m.valordesconto vl_desconto, '+
   '     COALESCE(SUM(cr.vl_desconto), 0) vl_desconto_acoes, '+
   '     CASE WHEN m.situacao IN (2,10) THEN 1 ELSE 0 END sn_pendente '+
   ' FROM '+
   '  	mensalidades m '+
   '     LEFT JOIN fin_mov_cr cr ON (cr.cd_mensalidade_origem = m.cd_mensalidade AND cr.sn_desc_condicional = 1) '+
   ' WHERE '+
	'     m.cd_mensalidade = :cd_mensalidade '+
	' GROUP BY '+
   '     m.cd_mensalidade                    ';

   qyChecaAcaoMovimento.ParamByName('cd_mensalidade').AsInteger := iCodigoMensalidade;
   qyChecaAcaoMovimento.Open;

   // Se a mensalidade possui desconto condicional e não possui ação de movimento para ele,
   // cria a ação de movimento de desconto condicional
   if (qyChecaAcaoMovimento.FieldByName('vl_desconto_acoes').AsCurrency = 0) and
      (qyChecaAcaoMovimento.FieldByName('vl_desconto').AsCurrency > 0) then
   begin
      // Criar ação de movimento condicional
      DM.criarAcaoAutomaticaDescontoCondicional(iCodigoMensalidade, qyChecaAcaoMovimento.FieldByName('vl_desconto').AsCurrency);
   end;

   // Aplica a ação de desconto condicional se a situação da mensalidade for baixa ou baixa parcial
   if (qyChecaAcaoMovimento.FieldByName('sn_pendente').AsCurrency = 0) then
   begin
      DM.aplicaAcoesMovimentoDescontosCondicionais(iCodigoMensalidade);
   end;

end;

procedure TfrmMensalidadeAplicarDescontos.informadaParcela(
  Sender: TObject);
begin

   // Se foi informada a parcela inicial e também a parcela final
   if (Length(Trim(edParcelaInicial.Text)) > 0) and (Length(Trim(edParcelaFinal.Text)) > 0) then
   begin
      // Verifica e atualiza a variavel que informa se existem parcelas com valores diferentes
      bExisteParcelasValoresDiferentes := existemParcelasValoresDiferentes();
      verificaMostrarVariasParcelas();
   end;

end;

procedure TfrmMensalidadeAplicarDescontos.miExcluirClick(Sender: TObject);
begin
   excluirDesconto();
end;

procedure TfrmMensalidadeAplicarDescontos.rbParcelaSelecionadaClick(
  Sender: TObject);
begin
   verificaMostrarVariasParcelas();
end;

procedure TfrmMensalidadeAplicarDescontos.rbVariasParcelasClick(
  Sender: TObject);
begin
   verificaMostrarVariasParcelas();
end;

procedure TfrmMensalidadeAplicarDescontos.rgTipoDescontoClick(Sender: TObject);
begin
   verificaMostrarAplicarDesconto();
   // Verifica o valor digitado se obriga o uso de recálculo de condicionais
   verificaFixoInformado();   
end;

procedure TfrmMensalidadeAplicarDescontos.sbAdicionarDescontoClick(
  Sender: TObject);
begin
   verificaMostrarAdicionarDesconto();
end;

procedure TfrmMensalidadeAplicarDescontos.verificaMostrarVariasParcelas();
begin

   {
      Os procedimentos aqui realizam ajustes visuais na tela para apresentação de
      informações quando utilizado o intervalo de parcelas, ou seja, ajustam o tamanho da tela,
      aparecimento de informações para esclarecimento e habilitar a opção de digitar as parcelas de inicio e fim.
   }

   // Verifica se mostra o panel com a informação de uso de várias parcelas que contém valores diferentes
   pnInfoIntervaloParcelas.Visible := bExisteParcelasValoresDiferentes and rbVariasParcelas.Checked;

   // Reseta a tela para a altura padrão, caso a mensagem de intervalo de parcelas está sendo mostrada ajusta o formulário
   frmMensalidadeAplicarDescontos.Height := ALTURA_PADRAO_FORM;
   if pnInfoIntervaloParcelas.Visible then
   begin
      // Ajusta o tamanho da tela
      frmMensalidadeAplicarDescontos.Height := frmMensalidadeAplicarDescontos.Height + pnInfoIntervaloParcelas.Height;
   end;

   // Apresenta a informação sobre o valor bruto quando utilizada várias parcelas (icone de exclamação)
   umInfoParcelas.Visible := rbVariasParcelas.Checked;

   // Ajusta a label do valor bruto da parcela para ficar pouco a frente do icone de exclamação
   lbValorInfoValorBruto.Left := 21;
   if rbVariasParcelas.Checked then
   begin
      // O espaçamento a esquerda dessa label será maior para a interrogação ficar ao lado dela
      lbValorInfoValorBruto.Left := 48;
   end;

   // verifica se deve habilitar ou não o campo de parcela inicial e final
   edParcelaInicial.Enabled := rbVariasParcelas.Checked;
   edParcelaFinal.Enabled := rbVariasParcelas.Checked;

   // Marca ou desmarca a opção de parcela selecionada caso estiver marcada ou não a opção de várias parcelas
   rbParcelaSelecionada.Checked := not rbVariasParcelas.Checked;

end;


procedure TfrmMensalidadeAplicarDescontos.verificaMostrarAdicionarDesconto();
begin

   {
      Os procedimentos aqui realizam ajustes visuais na tela,
      apresentação do formulário lateral para adicionar um novo desconto
   }

   // Verifica se mostra o panel para adicionar novo desconto
   pnAplicarDescontos.Visible := sbAdicionarDesconto.Down;

   // Reseta a tela para a largura padrão, caso pressionado para adicionar novo desconto então ajusta largura da tela
   frmMensalidadeAplicarDescontos.Width := LARGURA_PADRAO_FORM;
   if sbAdicionarDesconto.Down then
   begin
      // Ajusta o tamanho da tela
      frmMensalidadeAplicarDescontos.Width := frmMensalidadeAplicarDescontos.Width + pnAplicarDescontos.Width;
      DM.Get_Parametro_usuario( TComboBox(cbAcoesBaixa),     self.Name );
      cbAcoesBaixaChange( nil );
      DM.Get_Parametro_usuario( TComboBox(cbCalcularSobre),  self.Name );
      cbCalcularSobreChange( nil );
      DM.Get_Parametro_usuario( TRadioGroup(rgTipoDesconto), self.Name );
      rgTipoDescontoClick( nil );
   end;

end;

procedure TfrmMensalidadeAplicarDescontos.verificaMostrarDescontoFinanceiro100();
begin

   {
      Verifica se cliente possui uma ação de movimento automática para desconto de 100% financeiro
   }

   // Se o usuário não possui uma ação de desconto 100% automática, remove a opção da tela
   if qyAcaoDesconto100.Eof then
   begin
      // Remove a opção de 2 - Financeiro de 100%
      rgTipoDesconto.Items.Delete(2);
   end;

   // Se existir ação automática de baixa por desconto utiliza essa ação
   if not qyAcaoDesconto100.Eof then
   begin
      edAcaoDesconto100.Text := qyAcaoDesconto100.FieldByName('ds_acao').AsString;
      edAcaoDesconto100.Tag := qyAcaoDesconto100.FieldByName('cd_acao').AsInteger;
   end;

end;

procedure TfrmMensalidadeAplicarDescontos.verificaHabilitaDescontoFixo();
const
   SQL_MENSALIDADE_PARCIAL = ''+
      ' SELECT '+
      '     tipoparcela '+
      ' FROM '+
      '     mensalidades '+
      ' WHERE '+
      '     cd_mensalidade = :cd_mensalidade';
var
   qyMensalidadeParcial: TUMZQuery;
begin

   DM.CriarConsulta(qyMensalidadeParcial);

   // Prepara o SQL para verificar se a mensalidade é parcial ou negociada
   qyMensalidadeParcial.Close;
   qyMensalidadeParcial.SQL.Text := SQL_MENSALIDADE_PARCIAL;
   qyMensalidadeParcial.ParamByName('cd_mensalidade').AsInteger := iCodigoMensalidade;
   qyMensalidadeParcial.Open;

   // Se o SQL trouxe resultados signifca que é uma mensalidade parcial ou negociada e
   // o parameetro de bloqueio financeiro estiver ativado
   if (qyMensalidadeParcial.FieldByName('tipoparcela').AsInteger in [1,4]) and
      (DM.variavel_parametro('financeiro_bloquear_competencia') = 'S') then
   begin
      // Desabilita o radio button de desconto FIXO (0 - primeiro da lista)
      rgTipoDesconto.Controls[0].Enabled := False;
      // Seleciona o desconto condicional como opção default nesse caso
      rgTipoDesconto.ItemIndex := 1;
      // Habilita a informação de que o desconto fixo não pode ser aplicado em mensalidades parciais ou negociadas
      pnDesabilitaFixo.Visible := True;
   end;

end;

procedure TfrmMensalidadeAplicarDescontos.limparCamposDesconto();
begin
   {
      Limpar a tela de aplicação de descontos e esconde ela
   }

   edPercentualDesconto.setValor(0);
   edPercentualDesconto.Clear;
   edValorDesconto.setValor(0);
   edValorDesconto.Clear;
   meObservacao.Clear;

   // Posiciona na aplicação de desconto fixo
   rgTipoDesconto.ItemIndex := 0;
   // Se não for permitido atribuição de desconto fixo, posiciona no desconto condicional
   if pnDesabilitaFixo.Visible then
   begin
      rgTipoDesconto.ItemIndex := 1;
   end;

   cbCalcularSobre.ItemIndex := 0;

   cbRecalcularCondicionaisProporcional.Checked := False;

end;

function TfrmMensalidadeAplicarDescontos.existemParcelasValoresDiferentes(): Boolean;
var
   nrParcelaInicial, nrParcelaFinal: Integer;
begin

   {
      Verifica se existe alguma parcela no intervalo informado pelo usuário
      que contenha valores diferentes uma das outras, os valores checados são:
      valor bruto, desconto condicional e desconto fixo
   }

   // Retorno inicialmente é falso
   Result := False;

   // Busca o número da parcela inicial e final
   nrParcelaInicial := StrToInt(edParcelaInicial.Text);
   nrParcelaFinal := StrToInt(edParcelaFinal.Text);

   // Executa o SQL para verificar se possui parcelas diferentes
   qyVerificaValoresDiferentes.Close;
   qyVerificaValoresDiferentes.ParamByName('cd_pessoa').AsInteger := qyMensalidade.FieldByName('cd_pessoa').AsInteger;
   qyVerificaValoresDiferentes.ParamByName('nr_anosemestre').AsInteger := qyMensalidade.FieldByName('nr_anosemestre').AsInteger;
   qyVerificaValoresDiferentes.ParamByName('cd_turma').AsString := qyMensalidade.FieldByName('cd_turma').AsString;
   qyVerificaValoresDiferentes.ParamByName('nr_parcela_inicial').AsInteger := nrParcelaInicial;
   qyVerificaValoresDiferentes.ParamByName('nr_parcela_final').AsInteger := nrParcelaFinal;
   qyVerificaValoresDiferentes.SQL.Text := StringReplace(qyVerificaValoresDiferentes.SQL.Text, ':nr_tipo_parcelas', '1, 4', [rfReplaceAll]);
   qyVerificaValoresDiferentes.Open;

   // Se o resultado do SQL é maior que 1 significa que existe parcelas que divergem nos valores bruto, desconto condicional e fixo
   if qyVerificaValoresDiferentes.RecordCount > 1 then
   begin
      Result := True;
   end;

end;

procedure TfrmMensalidadeAplicarDescontos.carregarDadosMensalidade();
begin
   // Carrega os dados estáticos da mensalidade (que não vão ser alterados por comportamento dessa tela)
   qyMensalidade.Close;
   qyMensalidade.ParamByName('cd_mensalidade').AsInteger := iCodigoMensalidade;
   qyMensalidade.Open;

   qyMensalidade.First;
   if not qyMensalidade.Eof then
   begin
      lbAluno.Caption := qyMensalidade.FieldByName('ds_aluno').AsString;
      lbTurma.Caption := qyMensalidade.FieldByName('cd_turma').AsString;
      lbVencimento.Caption := qyMensalidade.FieldByName('dt_vencimento_formatada').AsString;
      lbValorBruto.Caption := qyMensalidade.FieldByName('vl_bruto').AsString;
   end;
end;

procedure TfrmMensalidadeAplicarDescontos.cbAcoesBaixaChange(Sender: TObject);
var
   percentual, valor: Currency;
   alteraDesconto: Integer;
begin
   valor := 0;
   percentual := StrToCurr(TItemCombo(cbAcoesBaixa.Items.Objects[cbAcoesBaixa.ItemIndex]).getVariavel());
   alteraDesconto := StrToInt(TItemCombo(cbAcoesBaixa.Items.Objects[cbAcoesBaixa.ItemIndex]).getVariavel2());

   edPercentualDesconto.setValor(0);
   edPercentualDesconto.Clear;
   edPercentualDesconto.Enabled := True;
   edValorDesconto.setValor(0);
   edValorDesconto.Clear;
   edValorDesconto.Enabled := True;

   qyAcoesBaixa.Locate('cd_acao', TItemCombo(cbAcoesBaixa.Items.Objects[cbAcoesBaixa.ItemIndex]).getCodigo(), []);

   // Verifica se somente existe um plano de desconto vinculado a ação de movimento,
   // nesse caso utiliza os valores do plano de desconto
   if qyAcoesBaixa.FieldByName('nr_qtd_planos').AsInteger = 1 then
   begin
      // Seleciona o desconto condicional como opção default nesse caso
      rgTipoDesconto.ItemIndex := 1;
      if qyAcoesBaixa.FieldByName('sn_condicional_plano').AsInteger = 0 then
      begin
         // Marca como desconto fixo
         rgTipoDesconto.ItemIndex := 0;
      end;
      rgTipoDescontoClick(Sender);

      percentual := qyAcoesBaixa.FieldByName('vl_perc_desconto_plano').AsFloat;

      if not (percentual > 0) then
      begin
         valor := qyAcoesBaixa.FieldByName('vl_desconto_plano').AsFloat;
      end;
   end;

   if percentual > 0 then
   begin
      edPercentualDesconto.setValor(percentual);
      // Cálcula o valor com base no percentual informado
      calcularValorDesconto();

      // Verifica se o usuário pode alterar o valor do desconto (de acordo com a regra definida na ação de movimento)
      edPercentualDesconto.Enabled := (alteraDesconto > 0);
      edValorDesconto.Enabled := (alteraDesconto > 0);
   end;

   if valor > 0 then
   begin
      edValorDesconto.setValor(valor);
      // Cálcula o valor com base no percentual informado
      calcularPercentualDesconto();
      // Verifica o valor digitado se obriga o uso de recálculo de condicionais
      verificaFixoInformado();

      // Verifica se o usuário pode alterar o valor do desconto (de acordo com a regra definida na ação de movimento)
      edPercentualDesconto.Enabled := (alteraDesconto > 0);
      edValorDesconto.Enabled := (alteraDesconto > 0);
   end;

end;

procedure TfrmMensalidadeAplicarDescontos.cbCalcularSobreChange(
  Sender: TObject);
begin
   calcularValorDesconto();
   // Verifica o valor digitado se obriga o uso de recálculo de condicionais
   verificaFixoInformado();   
end;

procedure TfrmMensalidadeAplicarDescontos.carregarAcoesMovimento();
begin
   // Carrega as ações de movimento para preencher a combo na inclusão de novos descontos
   qyAcoesBaixa.Close;
   qyAcoesBaixa.Open;

   qyAcoesBaixa.First;
   while not qyAcoesBaixa.Eof do
   begin
      cbAcoesBaixa.Items.AddObject(
         qyAcoesBaixa.FieldByName('ds_acao').AsString,
         TItemCombo.Create(
            qyAcoesBaixa.FieldByName('cd_acao').AsString,
            qyAcoesBaixa.FieldByName('ds_acao').AsString,
            qyAcoesBaixa.FieldByName('vl_perc_desconto').AsCurrency,
            qyAcoesBaixa.FieldByName('sn_altera_desconto').AsInteger
         )
      );

      qyAcoesBaixa.Next;
   end;

   // Seleciona a primeira ação na combo
   cbAcoesBaixa.ItemIndex := 0;

   // Carrega a ação de baixa de desconto financeiro 100%
   qyAcaoDesconto100.Close;
   qyAcaoDesconto100.Open;
      
end;

procedure TfrmMensalidadeAplicarDescontos.atualizarDescontos();
begin
   // Carrega as informações da mensalidade
   carregarDadosMensalidade();

   // Atualiza os valores dos descontos apresentados na tela
   qyDescontos.Close;
   qyDescontos.ParamByName('cd_mensalidade').AsInteger := iCodigoMensalidade;
   qyDescontos.Open;

   // Atualiza os valores totais apresentados (total de descontos, total líquido antes dos condicionais e após condicionais)
   qyValoresTotais.Close;
   qyValoresTotais.ParamByName('cd_mensalidade').AsInteger := iCodigoMensalidade;
   qyValoresTotais.Open;

   qyValoresTotais.First;
   if not qyValoresTotais.Eof then
   begin
      lbDescAplicados.Caption := qyValoresTotais.FieldByName('vl_total_descontos').AsString;
      lbLiquidoAntes.Caption := qyValoresTotais.FieldByName('vl_liquido_antes_condicionais').AsString;
      lbLiquidoApos.Caption := qyValoresTotais.FieldByName('vl_liquido_apos_condicionais').AsString;            
   end;   
end;

procedure TfrmMensalidadeAplicarDescontos.calcularValorDesconto();
var
  valorDesconto: Currency;  
begin

   {
      Verifica sobre qual valor deve ser cálculado o percentual, sendo as opções da combo:
      0 - Calcular sobre valor bruto da parcela
      1 - Calcular sobre valor líquido antes dos descontos condicionais
      2 - Calcular sobre valor líquido após todos os descontos

      Cálcula o valor em reais da forma escolhida na combo
   }

   // 0 - Calcular sobre valor bruto da parcela
   if cbCalcularSobre.ItemIndex = 0 then
   begin
      valorDesconto := (qyMensalidade.FieldByName('vl_bruto').AsCurrency * edPercentualDesconto.getValor())/100;
      edValorDesconto.setValorString(FloatToStrF(valorDesconto, ffFixed, 12, 2));
   end;

   // 1 - Calcular sobre valor líquido antes dos descontos condicionais
   if cbCalcularSobre.ItemIndex = 1 then
   begin
      valorDesconto := (qyValoresTotais.FieldByName('vl_liquido_antes_condicionais').AsCurrency * edPercentualDesconto.GetValor())/100;
      edValorDesconto.setValorString(FloatToStrF(valorDesconto, ffFixed, 12, 2));
   end;

   // 2 - Calcular sobre valor líquido após todos os descontos
   if cbCalcularSobre.ItemIndex = 2 then
   begin
      valorDesconto := (qyValoresTotais.FieldByName('vl_liquido_apos_condicionais').AsCurrency * edPercentualDesconto.getValor())/100;
      edValorDesconto.setValorString(FloatToStrF(valorDesconto, ffFixed, 12, 2));
   end;

end;

procedure TfrmMensalidadeAplicarDescontos.calcularPercentualDesconto();
var
   percentualDesconto: Currency;
begin

   {
      Verifica sobre qual valor deve ser cálculado o percentual, sendo as opções da combo:
      0 - Calcular sobre valor bruto da parcela
      1 - Calcular sobre valor líquido antes dos descontos condicionais
      2 - Calcular sobre valor líquido após todos os descontos

      Cálcula o valor em reais da forma escolhida na combo
   }

   // 0 - Calcular sobre valor bruto da parcela
   if cbCalcularSobre.ItemIndex = 0 then
   begin
      percentualDesconto := (edValorDesconto.getValor()*100)/qyMensalidade.FieldByName('vl_bruto').AsCurrency;
      edPercentualDesconto.setValorString(FloatToStrF(percentualDesconto, ffFixed, 12, 2));
   end;

   // 1 - Calcular sobre valor líquido antes dos descontos condicionais
   if (cbCalcularSobre.ItemIndex = 1) and
      (qyValoresTotais.FieldByName('vl_liquido_antes_condicionais').AsCurrency > 0) then
   begin
      percentualDesconto := (edValorDesconto.getValor()*100)/qyValoresTotais.FieldByName('vl_liquido_antes_condicionais').AsCurrency;
      edPercentualDesconto.setValorString(FloatToStrF(percentualDesconto, ffFixed, 12, 2));
   end;

   // 2 - Calcular sobre valor líquido após todos os descontos
   if (cbCalcularSobre.ItemIndex = 2) and
      (qyValoresTotais.FieldByName('vl_liquido_apos_condicionais').AsCurrency > 0) then
   begin
      percentualDesconto := (edValorDesconto.getValor()*100)/qyValoresTotais.FieldByName('vl_liquido_apos_condicionais').AsCurrency;
      edPercentualDesconto.setValorString(FloatToStrF(percentualDesconto, ffFixed, 12, 2));
   end;

end;

procedure TfrmMensalidadeAplicarDescontos.edPercentualDescontoClick(
  Sender: TObject);
begin
   edPercentualDesconto.SelStart:= 0;
   edPercentualDesconto.SelLength:= 1;
end;

procedure TfrmMensalidadeAplicarDescontos.edPercentualDescontoEnter(
  Sender: TObject);
begin
   mudouValorDesconto := false;
end;

procedure TfrmMensalidadeAplicarDescontos.edPercentualDescontoExit(
  Sender: TObject);
begin
   if(mudouValorDesconto = false) then
   begin
      mudouValorDesconto := true;
      exit;
   end;
   
   // Cálcula o valor com base no percentual informado
   calcularValorDesconto();
   // Verifica o valor digitado se obriga o uso de recálculo de condicionais
   verificaFixoInformado();
end;

procedure TfrmMensalidadeAplicarDescontos.edPercentualDescontoKeyPress(
  Sender: TObject; var Key: Char);
begin
   mudouValorDesconto := true;
end;

procedure TfrmMensalidadeAplicarDescontos.edValorDescontoClick(Sender: TObject);
begin
   edValorDesconto.SelStart:= 0;
   edValorDesconto.SelLength:= 1;
end;

procedure TfrmMensalidadeAplicarDescontos.edValorDescontoEnter(Sender: TObject);
begin
   mudouValorDesconto := false;
end;

procedure TfrmMensalidadeAplicarDescontos.edValorDescontoExit(Sender: TObject);
begin
   if(mudouValorDesconto = false) then
   begin
      mudouValorDesconto := true;
      exit;
   end;
   
   // Recálcula o valor percentual
   calcularPercentualDesconto();
   // Verifica o valor digitado se obriga o uso de recálculo de condicionais
   verificaFixoInformado();
end;

procedure TfrmMensalidadeAplicarDescontos.edValorDescontoKeyPress(
  Sender: TObject; var Key: Char);
begin
   mudouValorDesconto := true;
end;

procedure TfrmMensalidadeAplicarDescontos.verificaMostrarAplicarDesconto();
begin

   // Habilita os campos de digitação dos descontos e opções de desconto por padrão
   edPercentualDesconto.Enabled := True;
   edValorDesconto.Enabled := True;
   cbRecalcularCondicionaisProporcional.Enabled := True;
   cbRecalcularCondicionaisProporcional.Checked := True;
   cbCalcularSobre.Enabled := True;
   edAcaoDesconto100.Visible := False;
   cbAcoesBaixa.Visible := True;

   {
      Verifica se está sendo utilizada a opção de 1 - Condicional
      Nesse caso desabilita a opção de ajustar descontos proporcionalmente
   }
   if rgTipoDesconto.ItemIndex = 1 then
   begin
      cbRecalcularCondicionaisProporcional.Enabled := False;
      cbRecalcularCondicionaisProporcional.Checked := False;
   end;

   {
      Verifica se está sendo aplicado 2 - desconto financeiro 100%
      Nesse caso desabilita algumas opções da tela
   }
   if rgTipoDesconto.ItemIndex = 2 then
   begin
      // Define o percentual de desconto como 100%
      edPercentualDesconto.setValor(100);
      // Define o cálcular sobre como 1 - Calcular sobre valor líquido antes dos descontos condicionais
      cbCalcularSobre.ItemIndex := 1;
      // Cálcula o valor do desconto
      calcularValorDesconto();

      edPercentualDesconto.Enabled := False;
      edValorDesconto.Enabled := False;
      cbRecalcularCondicionaisProporcional.Enabled := False;
      cbRecalcularCondicionaisProporcional.Checked := False;
      cbCalcularSobre.Enabled := False;
      edAcaoDesconto100.Visible := True;
      cbAcoesBaixa.Visible := False;
   end;

end;


function TfrmMensalidadeAplicarDescontos.verificarCamposParcelas(): Boolean;
var
   iParcelaInicial, iParcelaFinal: Integer;
begin
   Result := True;

   // Verifica se está utilizando um intervalo de parcelas
   if rbVariasParcelas.Checked then
   begin

      // Verifica se foi informado o intervalo de parcelas
      try
         iParcelaInicial := StrToInt(edParcelaInicial.Text);
         iParcelaFinal := StrToInt(edParcelaFinal.Text);
      except
         Mensagem('Digite um valor numérico para as parcelas.', 'Atenção', MB_OK + MB_ICONWARNING);
         edParcelaInicial.SetFocus;
         Result := False;
         Exit;
      end;

      if iParcelaInicial > iParcelaFinal then
      begin
         Mensagem('Intervalo digitado das parcelas é inválido.', 'Atenção', MB_OK + MB_ICONWARNING);
         edParcelaInicial.SetFocus;
         Result := False;
         Exit;
      end;
      

      // A parcela selecionada da mensalidade deve estar dentro do intervalo para poder prosseguir
      if (qyMensalidade.FieldByName('nr_parcela').AsInteger < iParcelaInicial) or
         (qyMensalidade.FieldByName('nr_parcela').AsInteger > iParcelaFinal) then
      begin
         Mensagem('A parcela selecionada ('+qyMensalidade.FieldByName('nr_parcela').AsString+') não está dentro do intervalo de parcelas digitadas, é necessário que o intervalo de parcelas inclua a parcela selecionada.', 'Atenção', MB_OK + MB_ICONWARNING);
         edParcelaInicial.SetFocus;
         Result := False;
         Exit;
      end;

   end;

end;

function TfrmMensalidadeAplicarDescontos.verificaFixoInformado(): Boolean;
begin
   {
      Verifica se foi selecionado 0 - fixo,
      nesse caso se o valor não for menor que o valor pendente da parcela (valorbruto+valorextra - fixo - condicional),
      liga automaticamente a opção de Recalcular todos descontos condicionais já aplicados.
   }
   cbRecalcularCondicionaisProporcional.Enabled := True;
   if (rgTipoDesconto.ItemIndex = 0) and
      (edValorDesconto.getValor() >= qyValoresTotais.FieldByName('vl_liquido_apos_condicionais').AsCurrency) then
   begin
      cbRecalcularCondicionaisProporcional.Checked := True;
      cbRecalcularCondicionaisProporcional.Enabled := False;
   end;
end;

function TfrmMensalidadeAplicarDescontos.verificarCamposInformados(): Boolean;
var
   iParcelaInicial, iParcelaFinal: Integer;
begin

   // Verifica os campos informados de intervalo de parcelas
   Result := verificarCamposParcelas();

   // Verifica se o percentual de desconto foi informado
   if not (edPercentualDesconto.getValor() > 0) then
   begin
      Mensagem('Necessário informar o percentual de desconto.', 'Atenção', MB_OK + MB_ICONWARNING);
      if edPercentualDesconto.Enabled then
      begin
         edPercentualDesconto.SetFocus;
      end;
      Result := False;
      Exit;
   end;

   // Verifica se o valor de desconto foi informado
   if not (edValorDesconto.getValor() > 0) then
   begin
      Mensagem('Necessário informar o valor de desconto.', 'Atenção', MB_OK + MB_ICONWARNING);
      if edPercentualDesconto.Enabled then
      begin
         edValorDesconto.SetFocus;
      end;
      Result := False;
      Exit;
   end;

   // Verifica se a observação/justificativa foi informada
   if not (Length(Trim(meObservacao.Text)) > 0) then
   begin
      Mensagem('Necessário informar uma observação/justificativa para o desconto.', 'Atenção', MB_OK + MB_ICONWARNING);
      meObservacao.SetFocus;
      Result := False;
      Exit;
   end;

   {
      Verifica se foi selecionado 1 - condicional,
      nesse caso valor informado deve ser menor que o valor pendente da parcela (valorbruto+valorextra - fixo - condicional)
      Isso para evitar que o valor do desconto condicional que o usuário quer atribuir ultrapasse o valor pendente ou se iguale,
      pois não pode dar baixa por desconto condicional
   }
   if (rgTipoDesconto.ItemIndex = 1) and
      (edValorDesconto.getValor() >= qyValoresTotais.FieldByName('vl_liquido_apos_condicionais').AsCurrency) then
   begin
      Mensagem('O valor de desconto condicional não pode ser maior ou igual que o valor pendente ('+qyValoresTotais.FieldByName('vl_liquido_apos_condicionais').AsString+').', 'Atenção', MB_OK + MB_ICONWARNING, Handle);
      if edValorDesconto.Enabled then
      begin
         edValorDesconto.SetFocus;
      end;
      Result := False;
      Exit;
   end;

end;

procedure TfrmMensalidadeAplicarDescontos.excluirDesconto();
var
   sMensagemConfirmacao: String;
   bAjustarCondicionalProporcional: Boolean;
   cValorDesconto, cIndicePerc, cNovoDescCondicional: Currency;
   qyAcao, qyAtualizarCondicional: TUMZQuery;
   sChaveLog, sLog: String;
begin

   // Verifica se o usuário possui permissão de acesso a esse recurso
   if not DM.UsuarioLogado.TemPermissao(2047, npAcesso, True ) then
   begin
      Exit;
   end;

   // verifica se o usuário está removendo um desconto condicional e a mensalidade não esta pendente
   if (qyDescontos.FieldByName('sn_desc_condicional').AsInteger = 1) and
      not (qyDescontos.FieldByName('situacao').AsInteger in [2,10]) then
   begin
      Mensagem('Não é possível remover um desconto condicional de uma mensalidade que não está pendente.', 'Atenção', MB_OK + MB_ICONWARNING);
      Exit;      
   end;

   if qyDescontos.FieldByName('situacao').AsInteger in [0, 1] then
   begin
      Mensagem('Para cancelar um título pago, utilize a opção ESTORNAR.', 'Atenção', MB_OK + MB_ICONWARNING);
      Exit;
   end;

   if qyDescontos.FieldByName('cd_tipo_acao').AsInteger = 1 then
   begin
      Mensagem('Para cancelar um pagamento, utilize a opção ESTORNAR.', 'Atenção', MB_OK + MB_ICONWARNING);
      Exit;
   end;

   // Verifica se os campos de número de parcelas foi informado corretamente
   if not verificarCamposParcelas() then
   begin
      Exit;
   end;

   // Se selecionada a opção de apenas a parcela selecionada
   if rbParcelaSelecionada.Checked then
   begin
      sMensagemConfirmacao := 'Tem certeza que deseja excluir o desconto '+qyDescontos.FieldByName('ds_acao').AsString+' da parcela selecionada?';
   end;

   // Selecionada a opção de intervalo de parcelas
   if rbVariasParcelas.Checked then
   begin
      sMensagemConfirmacao := 'Tem certeza que deseja excluir o desconto '+qyDescontos.FieldByName('ds_acao').AsString+' da parcela '+ edParcelaInicial.Text +' até a parcela '+edParcelaFinal.Text+'?';
   end;

   // Confirma se o usuário deseja executar a ação de exclusão de desconto
   if Mensagem(sMensagemConfirmacao, 'Atenção', MB_YESNO + MB_ICONQUESTION) <> mrYes then
   begin
      Exit;
   end;

   bAjustarCondicionalProporcional := False;

   // Prepara mensagem questionando se usuário deseja reajustar o desconto condicional proporcionalmente
   sMensagemConfirmacao := 'Atenção:' + CHR(13) + CHR(13) +
                           'O estudante possui um desconto condicional para este título.' + CHR(13) +
                           'Você deseja aumentar este desconto proporcionalmente após a retirada do desconto fixo?';

   // Verifica se o usuário deseja ajustar o condicional de forma proporcional
   if (qyDescontos.FieldByName('cd_tipo_acao').AsInteger = 3) and // Baixa Por Desconto
      (qyDescontos.FieldByName('sn_desc_condicional').AsInteger = 0) and // Desconto não é condicional
      (qyMensalidade.FieldByName('valordesconto').AsCurrency > 0) and  // possui desconto condicional
      (Mensagem(sMensagemConfirmacao, 'UNIMESTRE', MB_YESNO + MB_ICONWARNING) = MrYes) then
   begin
      // Verifica se o usuário deseja ajustar o desconto condicional de forma proporcional
      bAjustarCondicionalProporcional := True;
   end;

   // Atribui os valores da mensalidade selecionada
   qyDescontosExcluir.Close;
   qyDescontosExcluir.ParamByName('cd_mensalidade').AsInteger := iCodigoMensalidade;
   qyDescontosExcluir.ParamByName('cd_coligada').AsInteger := qyDescontos.FieldByName('cd_coligada').AsInteger;
   qyDescontosExcluir.ParamByName('nr_sequencia').AsInteger := qyDescontos.FieldByName('nr_sequencia').AsInteger;

   // Zera as variáveis primeiramente
   qyDescontosExcluir.ParamByName('cd_mensalidade_aplicar').Clear;
   qyDescontosExcluir.ParamByName('nr_parcela_inicial').Clear;
   qyDescontosExcluir.ParamByName('nr_parcela_final').Clear;

   // Usuário selecionou para excluir apenas a parcela selecionada
   if rbParcelaSelecionada.Checked then
   begin
      qyDescontosExcluir.ParamByName('cd_mensalidade_aplicar').AsInteger := iCodigoMensalidade;
   end;

   // Verifica se o usuário selecionou várias parcelas para excluir e informa quais parcelas
   if rbVariasParcelas.Checked then
   begin
      qyDescontosExcluir.ParamByName('nr_parcela_inicial').AsInteger := StrToInt(edParcelaInicial.Text);
      qyDescontosExcluir.ParamByName('nr_parcela_final').AsInteger := StrToInt(edParcelaFinal.Text);
   end;

   // Cria as querys necessárias
   DM.CriarConsulta(qyAcao);
   DM.CriarConsulta(qyAtualizarCondicional);

   qyDescontosExcluir.Open;

   // Varre os descontos que serão excluídos
   while not qyDescontosExcluir.Eof do
   begin
      // Verifica se está bloqueada a parcela não exclui desconto dessa parcela
      if DM.EstaBloqueado(qyDescontosExcluir.FieldByName('datavencimento').AsDateTime, True) then
      begin
         continue;
      end;

      // Se não estiver PENDENTE ou RESERVADA e estiver bloqueada não exclui o desconto dessa parcela  
      if (not (qyDescontosExcluir.FieldByName('situacao').AsInteger in [2,10])) and
         DM.EstaBloqueado(qyDescontosExcluir.FieldByName('datapagamento').AsDateTime, true) then
      begin
         continue;
      end;

      

      // BAIXA POR CANCELAMENTO OU DESCONTO
      if qyDescontosExcluir.FieldByName('cd_tipo_acao').AsInteger = 2 then
      begin

         // Atualiza os valores da mensalidade
         qyAcao.Close;
         qyAcao.SQL.Clear;
         qyAcao.SQL.Add(
            ' UPDATE mensalidades SET ' +
            '   situacao = 2,  valorpago = null, datapagamento = null, valordesconto = valordesconto_fixo ' +
            ' WHERE cd_mensalidade = :cd_mensalidade ');

         qyAcao.ParamByName('cd_mensalidade').AsInteger := qyDescontosExcluir.FieldByName('cd_mensalidade').AsInteger;
                                                    
         qyAcao.ExecSQL;

         // Gera log da alteração dos descontos
         sChaveLog := qyDescontosExcluir.FieldByName('cd_mensalidade').AsString;
         DM.setLog(2014, 'Exclusao', sChaveLog, qyDescontosExcluir.FieldByName('cd_coligada').AsInteger, 'Estorno do Cancelamento');

      end;



      // BAIXA POR DESCONTO (FIXO)
      if (qyDescontosExcluir.FieldByName('cd_tipo_acao').AsInteger = 3) and
         (qyDescontosExcluir.FieldByName('sn_desc_condicional').AsInteger = 0) then
      begin

         qyAcao.Close;
         qyAcao.SQL.Clear;
         qyAcao.SQL.Add(
            ' SELECT SUM(m.vl_saida) vl_total_saida, me.valordesconto, me.descontoextra, (me.valorbruto + me.valorextra) valorbruto ' +
            ' FROM ' +
            '    fin_mov_cr m ' +
            '    INNER JOIN fin_acoes_movimento a ON (m.cd_acao = a.cd_acao) ' +
            '    INNER JOIN mensalidades me ON (me.cd_mensalidade = m.cd_mensalidade_origem) ' +
            ' WHERE ' +
            '    m.cd_mensalidade_origem = :cd_mensalidade AND a.cd_tipo_acao = 3 ' +
            ' GROUP BY me.cd_mensalidade '
         );

         qyAcao.ParamByName('cd_mensalidade').AsInteger := qyDescontosExcluir.FieldByName('cd_mensalidade').AsInteger;
         qyAcao.Open;

         // Cria a linha de log
         sLog := 'Cancelamento do desconto fixo '+qyDescontos.FieldByName('ds_acao').AsString+' no valor de R$ '+qyDescontosExcluir.FieldByName('vl_saida').AsString;

         // Calcula o novo desconto extra após exclusão do desconto selecionado
         cValorDesconto := qyAcao.FieldByName('vl_total_saida').AsCurrency - qyDescontosExcluir.FieldByName('vl_saida').AsCurrency;

         // Atribui o novo desconto condicional como sendo o antigo até esse momento
         cNovoDescCondicional := qyAcao.FieldByName('valordesconto').AsCurrency;

         // Verifica se deve ajustar o desconto condicional de forma proporcional
         if bAjustarCondicionalProporcional then
         begin
            // Ajustar desconto condicional da parcela e ações de movimento desses descontos
            cIndicePerc := qyAcao.FieldByName('valordesconto').AsCurrency  / (qyAcao.FieldByName('valorbruto').AsCurrency - qyAcao.FieldByName('descontoextra').AsCurrency);
            cNovoDescCondicional := RoundFloat(cIndicePerc * (qyAcao.FieldByName('valorbruto').AsCurrency - (qyAcao.FieldByName('descontoextra').AsCurrency - qyDescontos.FieldByName('vl_saida').AsCurrency)), 2);

            // Recalcular o desconto condicional das ações de movimento da parcela
            DM.recalcularDescCondicionalAcoesMovimento(
               qyDescontosExcluir.FieldByName('cd_mensalidade').AsInteger,
               qyAcao.FieldByName('valordesconto').AsCurrency,
               cNovoDescCondicional
            );
         end;

         // Atualiza os valores da mensalidade 
         qyAcao.Close;
         qyAcao.SQL.Clear;
         qyAcao.SQL.Add(
            ' UPDATE mensalidades SET ' +
            '   situacao = 2,  valorpago = null, datapagamento = null, descontoextra = :descontoextra, valordesconto = :novo_valordesconto ' +
            ' WHERE cd_mensalidade = :cd_mensalidade ');

         qyAcao.ParamByName('cd_mensalidade').AsInteger := qyDescontosExcluir.FieldByName('cd_mensalidade').AsInteger;
         qyAcao.ParamByName('descontoextra').AsCurrency := cValorDesconto;
         qyAcao.ParamByName('novo_valordesconto').AsCurrency := cNovoDescCondicional;

         qyAcao.ExecSQL;

         // Gera log da alteração dos descontos
         sChaveLog := qyDescontosExcluir.FieldByName('cd_mensalidade').AsString;
         DM.setLog(2014, 'Exclusao', sChaveLog, qyDescontosExcluir.FieldByName('cd_coligada').AsInteger, 'Alterado parcela '+IntToStr(qyDescontosExcluir.FieldByName('parcela').AsInteger)+'.'+chr(13)+sLog);
      end;


      // BAIXA POR DESCONTO (CONDICIONAL)
      if (qyDescontosExcluir.FieldByName('cd_tipo_acao').AsInteger = 3) and
         (qyDescontosExcluir.FieldByName('sn_desc_condicional').AsInteger = 1) then
      begin

         qyAcao.Close;
         qyAcao.SQL.Clear;
         qyAcao.SQL.Add(
            ' SELECT SUM(m.vl_desconto) vl_total_desconto, me.valordesconto, me.descontoextra, me.valorbruto ' +
            ' FROM ' +
            '    fin_mov_cr m ' +
            '    INNER JOIN fin_acoes_movimento a ON (m.cd_acao = a.cd_acao) ' +
            '    INNER JOIN mensalidades me ON (me.cd_mensalidade = m.cd_mensalidade_origem) ' +
            ' WHERE ' +
            '    m.cd_mensalidade_origem = :cd_mensalidade AND a.cd_tipo_acao = 3 ' +
            ' GROUP BY me.cd_mensalidade '
         );

         qyAcao.ParamByName('cd_mensalidade').AsInteger := qyDescontosExcluir.FieldByName('cd_mensalidade').AsInteger;
         qyAcao.Open;

         // Cria a linha de log
         sLog := 'Cancelamento do desconto condicional '+qyDescontos.FieldByName('ds_acao').AsString+' no valor de R$ '+qyDescontosExcluir.FieldByName('vl_desconto').AsString;

         // Calcula o novo desconto extra após exclusão do desconto selecionado
         cValorDesconto := qyAcao.FieldByName('vl_total_desconto').AsCurrency - qyDescontosExcluir.FieldByName('vl_desconto').AsCurrency;

         // Atualiza os valores da mensalidade 
         qyAcao.Close;
         qyAcao.SQL.Clear;
         qyAcao.SQL.Add(
            ' UPDATE mensalidades SET ' +
            '   valordesconto = :valordesconto ' +
            ' WHERE cd_mensalidade = :cd_mensalidade ');

         qyAcao.ParamByName('cd_mensalidade').AsInteger := qyDescontosExcluir.FieldByName('cd_mensalidade').AsInteger;
         qyAcao.ParamByName('valordesconto').AsCurrency := cValorDesconto;

         qyAcao.ExecSQL;

         // Gera log da alteração dos descontos
         sChaveLog := qyDescontosExcluir.FieldByName('cd_mensalidade').AsString;
         DM.setLog(2014, 'Exclusao', sChaveLog, qyDescontosExcluir.FieldByName('cd_coligada').AsInteger, 'Alterado parcela '+IntToStr(qyDescontosExcluir.FieldByName('parcela').AsInteger)+'.'+chr(13)+sLog);
      end;


      // Efetua a exclusão do desconto na fin_mov_cr
      qyAcao.Close;
      qyAcao.SQL.Clear;
      qyAcao.SQL.Add(
        ' DELETE FROM fin_mov_cr '  +
        '  WHERE cd_mensalidade = :cd_mensalidade ' +
        '    AND cd_mensalidade_origem = :cd_mensalidade_origem ' +
        '    AND nr_sequencia = :nr_sequencia ' +
        '    AND cd_coligada = :cd_coligada '
      );
      qyAcao.ParamByName('cd_mensalidade').AsInteger := qyDescontosExcluir.FieldByName('cd_mensalidade_origem').AsInteger;
      qyAcao.ParamByName('nr_sequencia').AsInteger := qyDescontosExcluir.FieldByName('nr_sequencia').AsInteger;
      qyAcao.ParamByName('cd_coligada').AsInteger := qyDescontosExcluir.FieldByName('cd_coligada').AsInteger;
      qyAcao.ParamByName('cd_mensalidade_origem').AsInteger := qyDescontosExcluir.FieldByName('cd_mensalidade').AsInteger;
      qyAcao.ExecSQL();

      {
         Atualiza o desconto condicional se a mensalidade não estava pendente, ou seja,
         a mensalidade saiu de baixa por desconto para pendente, nesse caso atualiza o desconto condicional
         com base nas ações de movimento (se houverem)
      }
      if not (qyDescontosExcluir.FieldByName('situacao').AsInteger in [2, 10]) then
      begin
         qyAcao.Close;
         qyAcao.SQL.Clear;
         qyAcao.SQL.Add(
           ' SELECT SUM(vl_desconto) vl_soma_condicional FROM fin_mov_cr '  +
           '  WHERE cd_mensalidade_origem = :cd_mensalidade ' +
           '    AND sn_desc_condicional = 1 '+
           ' GROUP BY cd_mensalidade_origem '
         );
         qyAcao.ParamByName('cd_mensalidade').AsInteger := qyDescontosExcluir.FieldByName('cd_mensalidade').AsInteger;
         qyAcao.Open();

         if qyAcao.FieldByName('vl_soma_condicional').AsCurrency > 0 then
         begin
            qyAtualizarCondicional.Close;
            qyAtualizarCondicional.SQL.Clear;
            qyAtualizarCondicional.SQL.Add(
              ' UPDATE mensalidades SET valordesconto = :valordesconto '  +
              ' WHERE cd_mensalidade = :cd_mensalidade '
            );
            qyAtualizarCondicional.ParamByName('valordesconto').AsCurrency := qyAcao.FieldByName('vl_soma_condicional').AsCurrency;
            qyAtualizarCondicional.ParamByName('cd_mensalidade').AsInteger := qyDescontosExcluir.FieldByName('cd_mensalidade').AsInteger;
            qyAtualizarCondicional.ExecSQL();
         end;
      end;

      qyDescontosExcluir.Next;
   end;

   atualizarDescontos();
                            
end;

procedure TfrmMensalidadeAplicarDescontos.aplicarDescontoFixo100();
var
   movimento: TMovimento;
   iParcelaInicial, iParcelaFinal, iBloqueio: Integer;
   qyMensalidadesAplicar: TUMZQuery;
   MensDataBaixa, sChaveLog: String;
   cValorDesconto, cValorDescontoAplicado: Currency;
begin

   // Pega os dados informados pelo usuário nos campos
   if rbVariasParcelas.Checked then
   begin
      iParcelaInicial := StrToInt(edParcelaInicial.Text);
      iParcelaFinal := StrToInt(edParcelaFinal.Text);
   end;
   cValorDesconto := StrToCurr(StringReplace(edValorDesconto.Text, '.', '', [rfReplaceAll]));

   DM.CriarConsulta(qyMensalidadesAplicar);
   qyMensalidadesAplicar.Close;
   qyMensalidadesAplicar.SQL.Clear;

   // Prepara o SQL que irá varrer os titulos com base nos filtros da tela
   qyMensalidadesAplicar.SQL.Add(
   ' SELECT                ' +
   '    m.cd_mensalidade_origem,                                              ' +
   '    m.cd_mensalidade,                                                     ' +
   '    m.cd_coligada,                                                        ' +
   '    m.valorjuros vl_juros,                                                ' +
   '    m.datavencimento,                                                     ' +
   '    m.dt_competencia,                                                     ' +
   '    (SUM(f.vl_entrada) - SUM(f.vl_saida)) vl_pendente                     ' +
   ' FROM                                                                     ' +
   '   mensalidades m INNER JOIN pessoas p ON (m.codigoaluno = p.cd_pessoa)   ' +
   '   LEFT JOIN fin_mov_cr f ON (m.cd_mensalidade_origem = f.cd_mensalidade) ' +
   ' WHERE ');

   // Se foi utiliza a opção de parcela selecionada
   if rbParcelaSelecionada.Checked then
   begin
      qyMensalidadesAplicar.SQL.Add(' m.cd_mensalidade = ' + IntToStr(iCodigoMensalidade));
   end;

   // Se foi utilizada a opção de intervalo de parcelas
   if rbVariasParcelas.Checked then
   begin
      qyMensalidadesAplicar.SQL.Add(
         ' m.codigoaluno = :cd_pessoa      ' +
         ' AND m.turma = :cd_turma             ' +
         ' AND m.anosemestre = :nr_anosemestre ' +
         ' AND m.parcela BETWEEN :nr_parcela_inicial AND :nr_parcela_final ' +
         ' AND m.situacao in (2,10) ');

      // Verificar se é permitido o cancelamento de títulos com data de competência/vencimento bloqueadas.
      // Como padrão o sistema deve deixar cancelar, visto que é normal cancelamentos após o faturamento
      // Sendo que a data do cancelamento é colocada como sendo a data atual.
      if DM.variavel_parametro('FinanceiroCancelaDataBloqueada') = 'N' then
      begin
         qyMensalidadesAplicar.SQL.Add(' AND m.datavencimento > :data_bloqueio ');
         qyMensalidadesAplicar.SQL.Add(' AND m.dt_competencia > :data_bloqueio ');

         qyMensalidadesAplicar.ParamByName('data_bloqueio').AsDate := Dm.DataBloqueioFinanceiro(0);
      end;

      qyMensalidadesAplicar.ParamByName('cd_pessoa').AsInteger := qyMensalidade.FieldByName('cd_pessoa').AsInteger;
      qyMensalidadesAplicar.ParamByName('cd_turma').AsString := qyMensalidade.FieldByName('cd_turma').AsString;
      qyMensalidadesAplicar.ParamByName('nr_anosemestre').AsInteger := qyMensalidade.FieldByName('nr_anosemestre').AsInteger;
      qyMensalidadesAplicar.ParamByName('nr_parcela_inicial').AsInteger := iParcelaInicial;
      qyMensalidadesAplicar.ParamByName('nr_parcela_final').AsInteger := iParcelaFinal;
   end;

   qyMensalidadesAplicar.SQL.Add(' GROUP BY m.cd_mensalidade_origem, m.cd_coligada ');

   qyMensalidadesAplicar.Open;

   // Prepara a ação de movimento para a ação de desconto selecionada
   Movimento := TMovimento.Create;

   // Varre as mensalidades que serão aplicadas o desconto
   while not qyMensalidadesAplicar.Eof do begin

      // Utiliza como desconto aplicado inicialmente o valor informado
      cValorDescontoAplicado := cValorDesconto;
      // Caso o valor informado seja maior que o valor pendente, ajusta o valor informado para o valor pendente 
      if cValorDesconto > qyMensalidadesAplicar.FieldByName('vl_pendente').AsCurrency then
      begin
         cValorDescontoAplicado := qyMensalidadesAplicar.FieldByName('vl_pendente').AsCurrency
      end;

      // Soma ao desconto aplicado o valor extra da mensalidade
      cValorDescontoAplicado := cValorDescontoAplicado;

      // Salva o valor desconto condicional existente hoje (para caso reverter o desconto 100%, possa ser revertido o desconto condicional também)
      Dm.qyAux.Close;
      DM.qyAux.SQL.Clear;
      DM.qyAux.SQL.Add(' UPDATE mensalidades SET valordesconto_fixo = valordesconto WHERE cd_mensalidade = :cd_mensalidade ');
      DM.qyAux.ParamByName('cd_mensalidade').AsInteger := qyMensalidadesAplicar.FieldByName('cd_mensalidade').AsInteger;
      DM.qyAux.ExecSQL();
      
      // Seta o novo valor do desconto condicional, a data de pagamento e situação da mensalidade
      DM.qyAux.Close;
      DM.qyAux.SQL.Clear;
      DM.qyAux.SQL.Add(' UPDATE mensalidades SET ' +
                       '   datapagamento = CASE WHEN ((curdate() < datavencimento) OR (:MensDataBaixa LIKE "[VENCIMENTO]")) AND (:MensDataBaixa NOT LIKE "[BAIXA]") AND (:MensDataBaixa NOT LIKE "[ATUAL]") AND (:BloqueioData = 0) THEN datavencimento ELSE curdate() END, '+
                       '   situacao = 7, valortotal = 0, ' +
                       '   valordesconto = ROUND(valorbruto + COALESCE(valorextra,0) - COALESCE(descontoextra, 0), 2)' +
                       ' WHERE cd_mensalidade = :cd_mensalidade ');

      MensDataBaixa := DM.variavel_parametro('mensalidades_data_baixa');
      MensDataBaixa := Trim(MensDataBaixa);
                                 
      iBloqueio := 0;
      if (DM.EstaBloqueado(qyMensalidadesAplicar.FieldByName('datavencimento').AsDatetime, True)) OR
         (DM.EstaBloqueado(qyMensalidadesAplicar.FieldByName('dt_competencia').AsDatetime, True)) then
      begin
         iBloqueio := 1;
      end;

      DM.qyAux.ParamByName('BloqueioData').AsInteger := iBloqueio;
      DM.qyAux.ParamByName('MensDataBaixa').AsString := MensDataBaixa;
      DM.qyAux.ParamByName('cd_mensalidade').AsInteger := qyMensalidadesAplicar.FieldByName('cd_mensalidade').AsInteger;;
      DM.qyAux.ExecSQL();

      // Cria a ação de movimento da baixa por desconto 100%
      Movimento.TipoDeAcao := BaixarporCancelamento;
      Movimento.CodigoTitulo := qyMensalidadesAplicar.FieldByName('cd_mensalidade_origem').AsInteger;
      movimento.MensalidadeOrigem := qyMensalidadesAplicar.FieldByName('cd_mensalidade').AsInteger;
      Movimento.Coligada := qyMensalidadesAplicar.FieldByName('cd_coligada').AsInteger;
      Movimento.CodigoMovimento := qyMensalidadesAplicar.FieldByName('cd_mensalidade').AsInteger;
      Movimento.CodAcao :=  edAcaoDesconto100.Tag;
      Movimento.Observacao := meObservacao.Text;
      Movimento.ValorDesconto := cValorDescontoAplicado;
      Movimento.ValorMovimento := cValorDescontoAplicado;
      Movimento.ValorJuros := qyMensalidadesAplicar.FieldByName('vl_juros').AsCurrency;
      Movimento.DescCondicional := 1;
      Movimento.RegistrarMovimentacaoCR(0);

      // Registra a ação de remessa de cancelamento      
      DM.FazAcaoRemessa(arCancelar, qyMensalidadesAplicar.FieldByName('cd_mensalidade').AsInteger);

      // Registra o log da operação
      sChaveLog := qyMensalidadesAplicar.FieldByName('cd_mensalidade').AsString + ';' +FormatDateTime('dd/mm/yyyy', Dm.DataAtual) + ';';
      DM.setLog(2070, 'Inclusao', sChaveLog, qyMensalidadesAplicar.FieldByName('cd_coligada').AsInteger, 'Desconto Financeiro 100% no valor de: ' + FloatToStr(cValorDescontoAplicado));

      qyMensalidadesAplicar.Next;
   end;

   Movimento.Free;
   
end;

procedure TfrmMensalidadeAplicarDescontos.aplicarDescontoFixo();
var
   movimento: TMovimento;
   iParcelaInicial, iParcelaFinal: Integer;
   cValorDesconto, cValorDescontoAplicado,
   cIndicePerc, cValorMovimentacoes: Currency;
   qyMensalidadesAplicar, qyAplicaoDesconto, qyAcao: TUMZQuery;
   MensDataBaixa, sChaveLog: string;
begin

   // Pega os dados informados pelo usuário nos campos
   if rbVariasParcelas.Checked then
   begin
      iParcelaInicial := StrToInt(edParcelaInicial.Text);
      iParcelaFinal := StrToInt(edParcelaFinal.Text);
   end;
   cValorDesconto := StrToCurr(StringReplace(edValorDesconto.Text, '.', '', [rfReplaceAll]));

   // Cria as querys necessárias para o procedimento
   DM.CriarConsulta(qyAcao);
   DM.CriarConsulta(qyAplicaoDesconto);
   DM.CriarConsulta(qyMensalidadesAplicar);

   qyMensalidadesAplicar.Close;
   qyMensalidadesAplicar.SQL.Clear;
   
   qyMensalidadesAplicar.SQL.Add(
      ' SELECT                                                         ' +
      '   m.cd_mensalidade_origem, m.cd_coligada,                      ' +
      '   CAST(m.datavencimento AS DATETIME) datavencimento,           ' +
      '   CAST(COALESCE(m.dt_competencia, m.datavencimento) AS DATETIME) dt_competencia, ' +
      '   m.cd_mensalidade, m.situacao,                                                  ' +
      '   m.valordesconto, m.descontoextra, (m.valorbruto + m.valorextra) valorbruto, ' +
      '   (SUM(f.vl_entrada) - SUM(f.vl_saida)) vl_pendente       ' +
      ' FROM                                                      ' +
      '   mensalidades m                                          ' +
      '   INNER JOIN pessoas p ON ( m.codigoaluno = p.cd_pessoa ) ' +
      '   LEFT JOIN fin_mov_cr f ON (m.cd_mensalidade_origem = f.cd_mensalidade) ' +
      ' WHERE                                                     ' +
      '    m.situacao in (2,10)                                   ');

   if (DM.variavel_parametro('financeiro_bloquear_competencia') = 'S') then
   begin
      qyMensalidadesAplicar.SQL.Add(' AND m.tipoparcela <> 4 ');
   end;

   // Se foi utiliza a opção de parcela selecionada
   if rbParcelaSelecionada.Checked then
   begin
      qyMensalidadesAplicar.SQL.Add(' AND m.cd_mensalidade = ' + IntToStr(iCodigoMensalidade));
   end;

   // Se foi utilizada a opção de intervalo de parcelas
   if rbVariasParcelas.Checked then
   begin
      qyMensalidadesAplicar.SQL.Add(
         ' AND m.codigoaluno = :cd_pessoa      ' +
         ' AND m.turma = :cd_turma             ' +
         ' AND m.anosemestre = :nr_anosemestre ' +
         ' AND m.parcela BETWEEN :nr_parcela_inicial AND :nr_parcela_final ' +
         ' AND m.tipoparcela <> 1 ' + 
         ' AND m.situacao NOT IN (0, 1) ');

      qyMensalidadesAplicar.ParamByName('cd_pessoa').AsInteger := qyMensalidade.FieldByName('cd_pessoa').AsInteger;
      qyMensalidadesAplicar.ParamByName('cd_turma').AsString := qyMensalidade.FieldByName('cd_turma').AsString;
      qyMensalidadesAplicar.ParamByName('nr_anosemestre').AsInteger := qyMensalidade.FieldByName('nr_anosemestre').AsInteger;
      qyMensalidadesAplicar.ParamByName('nr_parcela_inicial').AsInteger := iParcelaInicial;
      qyMensalidadesAplicar.ParamByName('nr_parcela_final').AsInteger := iParcelaFinal;
   end;

   qyMensalidadesAplicar.SQL.Add(' GROUP BY m.cd_mensalidade_origem ');

   qyMensalidadesAplicar.Open;

   // Cria ação de movimento para o desconto FIXO
   movimento := TMovimento.Create;

   while not qyMensalidadesAplicar.Eof do
   begin

      // Verifica se a data de vencimento ou competencia está bloqueada para alteração, nesse caso pula essa mensalidade
      if ( DM.EstaBloqueado(qyMensalidadesAplicar.FieldByName('datavencimento').AsDatetime, True) ) OR
         ( DM.EstaBloqueado(qyMensalidadesAplicar.FieldByName('dt_competencia').AsDatetime, True) ) then
      begin
         qyMensalidadesAplicar.Next();
         continue;
      end;

      // Utiliza como desconto aplicado inicialmente o valor informado
      cValorDescontoAplicado := cValorDesconto;
      // Caso o valor informado seja maior que o valor pendente, ajusta o valor informado para o valor pendente
      if cValorDesconto > qyMensalidadesAplicar.FieldByName('vl_pendente').AsCurrency then begin
         cValorDescontoAplicado := qyMensalidadesAplicar.FieldByName('vl_pendente').AsCurrency
      end;

      qyAplicaoDesconto.Close;
      qyAplicaoDesconto.SQL.Clear;
      qyAplicaoDesconto.SQL.Add('UPDATE mensalidades ' );
      qyAplicaoDesconto.SQL.Add('SET descontoextra = :vl_novo_desconto_fixo ');

      // Se estiver com a opção de recalcular o desconto condicional ativada inclui o campo para ser alterado no SQL
      if cbRecalcularCondicionaisProporcional.Checked then
      begin
         qyAplicaoDesconto.SQL.Add(', valordesconto = :vl_novo_desconto_condicional ');
      end;

      // Se a mensalidade for pendente/reserva e o valor de desconto aplicado é maior ou igual ao valor pendente
      if (cValorDescontoAplicado >= qyMensalidadesAplicar.FieldByName('vl_pendente').AsCurrency) AND
         (qyMensalidadesAplicar.FieldByName('situacao').AsInteger IN [2,10] ) then
      begin
         // define a data de pagamento, zera o juros
         qyAplicaoDesconto.SQL.Add(', datapagamento = CASE WHEN ((curdate() < datavencimento) OR (:MensDataBaixa LIKE "[VENCIMENTO]")) AND (:MensDataBaixa NOT LIKE "[BAIXA]") AND (:MensDataBaixa NOT LIKE "[ATUAL]") THEN datavencimento ELSE curdate() END ');
         qyAplicaoDesconto.SQL.Add(', valorjuros = 0 ');

         MensDataBaixa := DM.variavel_parametro('mensalidades_data_baixa');
         MensDataBaixa := Trim(MensDataBaixa);

         qyAplicaoDesconto.ParamByName('MensDataBaixa').AsString := MensDataBaixa;
      end;

      qyAplicaoDesconto.SQL.Add(' WHERE cd_mensalidade = :cd_mensalidade ' );

      // Busca os valores das ações de movimento da mensalidade
      qyAcao.Close;
      qyAcao.SQL.Clear;
      qyAcao.SQL.Add(
         ' SELECT SUM(m.vl_saida) - COALESCE((SELECT SUM(COALESCE(descontoextra, 0)) FROM mensalidades WHERE cd_mensalidade_origem = :cd_mensalidade AND cd_mensalidade < :cd_nova_mensalidade), 0) vl_saida '+
         ' FROM ' +
         '   fin_mov_cr m '+
         '   INNER JOIN fin_acoes_movimento a ON (m.cd_acao = a.cd_acao) ' +
         ' WHERE ' +
         '    m.cd_mensalidade = :cd_mensalidade AND a.cd_tipo_acao = 3 ' +
         ' GROUP BY m.cd_mensalidade '
      );

      qyAcao.ParamByName('cd_mensalidade').AsInteger := qyMensalidadesAplicar.FieldByName('cd_mensalidade_origem').AsInteger;
      qyAcao.ParamByName('cd_nova_mensalidade').AsInteger := qyMensalidadesAplicar.FieldByName('cd_mensalidade').AsInteger;
      qyAcao.Open;

      // Descobrir o valor atual dos descontos na movimentação
      qyAplicaoDesconto.ParamByName('cd_mensalidade').AsInteger := qyMensalidadesAplicar.FieldByName('cd_mensalidade').AsInteger;
      qyAplicaoDesconto.ParamByName('vl_novo_desconto_fixo').AsFloat := RoundFloat(qyAcao.FieldByName('vl_saida').AsCurrency + cValorDescontoAplicado, 2);

      if cbRecalcularCondicionaisProporcional.Checked then
      begin
         cIndicePerc := ( qyMensalidadesAplicar.FieldByName('valordesconto').AsCurrency / (qyMensalidadesAplicar.FieldByName('valorbruto').AsCurrency - qyAcao.FieldByName('vl_saida').AsCurrency) ); // Indice de desconto
         qyAplicaoDesconto.ParamByName('vl_novo_desconto_condicional').AsFloat := RoundFloat(cIndicePerc * (qyMensalidadesAplicar.FieldByName('valorbruto').AsCurrency - (qyAcao.FieldByName('vl_saida').AsCurrency + cValorDescontoAplicado)), 2);

         // Recalcular o desconto condicional das ações de movimento da parcela
         DM.recalcularDescCondicionalAcoesMovimento(
            qyMensalidadesAplicar.FieldByName('cd_mensalidade').AsInteger,
            qyMensalidadesAplicar.FieldByName('valordesconto').AsCurrency,
            qyAplicaoDesconto.ParamByName('vl_novo_desconto_condicional').AsCurrency
         );
      end;

      // Aplica o desconto confirmado
      qyAplicaoDesconto.ExecSQL;

      movimento.TipoDeAcao := BaixarporDesconto;
      movimento.CodigoTitulo := qyMensalidadesAplicar.FieldByName('cd_mensalidade_origem').AsInteger;
      movimento.MensalidadeOrigem := qyMensalidadesAplicar.FieldByName('cd_mensalidade').AsInteger;
      movimento.Coligada := qyMensalidadesAplicar.FieldByName('cd_coligada').AsInteger;
      movimento.CodigoMovimento := qyMensalidadesAplicar.FieldByName('cd_mensalidade').AsInteger;
      movimento.CodAcao :=  StrToInt(TItemCombo(cbAcoesBaixa.Items.Objects[cbAcoesBaixa.ItemIndex]).getCodigo());
      movimento.Observacao := meObservacao.Text;
      movimento.ValorMovimento := cValorDescontoAplicado;

      movimento.RegistrarMovimentacaoCR(0);

      // Registra a ação de remessa de desconto
      DM.FazAcaoRemessa(arDesconto, qyMensalidadesAplicar.FieldByName('cd_mensalidade').AsInteger);

      // Registra o log da operação
      sChaveLog := qyMensalidadesAplicar.FieldByName('cd_mensalidade').AsString + ';' +
                   FormatDateTime('dd/mm/yyyy', Dm.DataAtual) + ';' +
                   FloatToStr(cValorDescontoAplicado) + ';';
      DM.setLog(2020, 'Inclusao', sChaveLog, qyMensalidadesAplicar.FieldByName('cd_coligada').AsInteger, 'Desconto Fixo no valor de: ' + FloatToStr(cValorDescontoAplicado));

      qyMensalidadesAplicar.Next();
   end;

   movimento.Free();
end;

procedure TfrmMensalidadeAplicarDescontos.aplicarDescontoCondicional();
var
   movimento: TMovimento;
   iParcelaInicial, iParcelaFinal: Integer;
   cValorDesconto: Currency;
   qyMensalidadesAplicar, qyAplicaoDesconto: TUMZQuery;
   sChaveLog: string;
begin

   // Pega os dados informados pelo usuário nos campos
   if rbVariasParcelas.Checked then
   begin
      iParcelaInicial := StrToInt(edParcelaInicial.Text);
      iParcelaFinal := StrToInt(edParcelaFinal.Text);
   end;
   cValorDesconto := StrToCurr(StringReplace(edValorDesconto.Text, '.', '', [rfReplaceAll]));

   // Cria as querys necessárias para o procedimento
   DM.CriarConsulta(qyAplicaoDesconto);
   DM.CriarConsulta(qyMensalidadesAplicar);


   qyMensalidadesAplicar.Close;
   qyMensalidadesAplicar.SQL.Clear;
   
   qyMensalidadesAplicar.SQL.Add(
      ' SELECT                                                    ' +
      '   m.cd_mensalidade_origem, m.cd_mensalidade, m.cd_coligada                         ' +
      ' FROM                                                      ' +
      '   mensalidades m                                          ' +
      '   INNER JOIN pessoas p ON ( m.codigoaluno = p.cd_pessoa ) ' +
      '   LEFT JOIN fin_mov_cr f ON (m.cd_mensalidade = f.cd_mensalidade) ' +
      ' WHERE                                                     ' +
      '    m.situacao in (2,10)                                   ');

   // Se foi utiliza a opção de parcela selecionada
   if rbParcelaSelecionada.Checked then
   begin
      qyMensalidadesAplicar.SQL.Add(' AND m.cd_mensalidade = ' + IntToStr(iCodigoMensalidade));
   end;

   // Se foi utilizada a opção de intervalo de parcelas
   if rbVariasParcelas.Checked then
   begin
      qyMensalidadesAplicar.SQL.Add(
         ' AND m.codigoaluno = :cd_pessoa      ' +
         ' AND m.turma = :cd_turma             ' +
         ' AND m.anosemestre = :nr_anosemestre ' +
         ' AND m.parcela BETWEEN :nr_parcela_inicial AND :nr_parcela_final ' +
         ' AND m.tipoparcela <> 1 ' + 
         ' AND m.situacao NOT IN (0, 1) ');

      qyMensalidadesAplicar.ParamByName('cd_pessoa').AsInteger := qyMensalidade.FieldByName('cd_pessoa').AsInteger;
      qyMensalidadesAplicar.ParamByName('cd_turma').AsString := qyMensalidade.FieldByName('cd_turma').AsString;
      qyMensalidadesAplicar.ParamByName('nr_anosemestre').AsInteger := qyMensalidade.FieldByName('nr_anosemestre').AsInteger;
      qyMensalidadesAplicar.ParamByName('nr_parcela_inicial').AsInteger := iParcelaInicial;
      qyMensalidadesAplicar.ParamByName('nr_parcela_final').AsInteger := iParcelaFinal;
   end;

   qyMensalidadesAplicar.SQL.Add(' GROUP BY m.cd_mensalidade ');

   qyMensalidadesAplicar.Open;

   // Cria ação de movimento para o desconto FIXO
   movimento := TMovimento.Create;

   while not qyMensalidadesAplicar.Eof do
   begin

      qyAplicaoDesconto.Close;
      qyAplicaoDesconto.SQL.Clear;
      qyAplicaoDesconto.SQL.Add('UPDATE mensalidades                                                      ' );
      qyAplicaoDesconto.SQL.Add(' SET valordesconto = ROUND(COALESCE(valordesconto, 0) + :vl_desconto, 2) ' );
      qyAplicaoDesconto.SQL.Add(' WHERE cd_mensalidade = :cd_mensalidade                                  ' );

      qyAplicaoDesconto.ParamByName('cd_mensalidade').AsInteger := qyMensalidadesAplicar.FieldByName('cd_mensalidade').AsInteger;
      qyAplicaoDesconto.ParamByName('vl_desconto').AsFloat := cValorDesconto;
      qyAplicaoDesconto.ExecSQL;

      movimento.TipoDeAcao := BaixarporDesconto;
      movimento.CodigoTitulo := qyMensalidadesAplicar.FieldByName('cd_mensalidade_origem').AsInteger;
      movimento.MensalidadeOrigem := qyMensalidadesAplicar.FieldByName('cd_mensalidade').AsInteger;
      movimento.Coligada := qyMensalidadesAplicar.FieldByName('cd_coligada').AsInteger;
      movimento.CodigoMovimento := qyMensalidadesAplicar.FieldByName('cd_mensalidade').AsInteger;
      movimento.CodAcao :=  StrToInt(TItemCombo(cbAcoesBaixa.Items.Objects[cbAcoesBaixa.ItemIndex]).getCodigo());
      movimento.Observacao := meObservacao.Text;
      Movimento.DescCondicional := 1;
      Movimento.ValorDesconto := cValorDesconto;

      movimento.RegistrarMovimentacaoCR(0);

      // Registra a ação de remessa de desconto condicional
      DM.FazAcaoRemessa(arAltMensalidade, qyMensalidadesAplicar.FieldByName('cd_mensalidade').AsInteger);

      // Registra logs da operação
      sChaveLog := qyMensalidadesAplicar.FieldByName('cd_mensalidade').AsString + ';' +
                     FormatDateTime('dd/mm/yyyy', Dm.DataAtual) + ';' +
                     FloatToStr(cValorDesconto) + ';';

      DM.setLog(2020, 'Inclusao', sChaveLog, qyMensalidadesAplicar.FieldByName('cd_coligada').AsInteger, 'Desconto efetuado no valor de: ' + FloatToStr(cValorDesconto));

      qyMensalidadesAplicar.Next;
   end;

   movimento.Free();

end;

function TfrmMensalidadeAplicarDescontos.isParcelaSelecionadaBaixadaPorDesconto(): Boolean;
begin

   Result := False;

   case qyMensalidade.FieldByName('situacao').AsInteger of
      0,1,3,4,5,6,7,8,9 :
      begin
         Result := True;
      end;
   end;

end;

end.
