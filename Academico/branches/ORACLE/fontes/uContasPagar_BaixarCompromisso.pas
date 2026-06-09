unit uContasPagar_BaixarCompromisso;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, Grids, DBGrids, ExtCtrls, Db, ZConnection, Spin, ComCtrls, Mask,
  General, ZAbstractRODataset, ZAbstractDataset, ZDataset, UZDataset, Menus, Buttons, ImgList, DBCtrls, dbcgrids;

type
  Tfrm_ContasPagar_BaixarCompromisso = class(TForm)
    Bevel1: TBevel;
    Bevel2: TBevel;
    Bevel3: TBevel;
    Bevel4: TBevel;
    pgCompromisso: TPageControl;
    tsInfGerais: TTabSheet;
    sbAvancar: TSpeedButton;
    tsPlanoContas: TTabSheet;
    sbVoltar: TSpeedButton;
    sbFinalizar: TSpeedButton;
    Bevel5: TBevel;
    Bevel6: TBevel;
    sbCancelar: TSpeedButton;
    sbCancelarPlano: TSpeedButton;
    qyPlanoContas: TUMZQuery;
    srcPlanoContas: TDataSource;
    qyMovimentacao: TUMZQuery;
    qyMovimentacaocd_titulo: TIntegerField;
    qyMovimentacaonr_sequencia: TIntegerField;
    qyMovimentacaocd_movimento: TIntegerField;
    qyMovimentacaodt_movimento: TDateTimeField;
    qyMovimentacaovl_entrada: TFloatField;
    qyMovimentacaovl_saida: TFloatField;
    qyMovimentacaovl_multa: TFloatField;
    qyMovimentacaovl_juros: TFloatField;
    qyMovimentacaovl_desconto: TFloatField;
    qyMovimentacaovl_liquido: TFloatField;
    qyMovimentacaocd_movimento_te: TIntegerField;
    qyMovimentacaods_observacao: TMemoField;
    Panel1: TPanel;
    Label12: TLabel;
    Bevel8: TBevel;
    DBText1: TDBText;
    srcMovimentacao: TDataSource;
    updPlanoContas: TZUpdateSQL;
    qyPlanoContascd_titulo: TIntegerField;
    qyPlanoContasnr_sequencia: TIntegerField;
    qyPlanoContascd_conta: TIntegerField;
    qyPlanoContascd_centro: TIntegerField;
    qyPlanoContasvl_movimento: TFloatField;
    qyPlanoContasds_conta: TStringField;
    qyPlanoContasds_centro: TStringField;
    Label1: TLabel;
    Label2: TLabel;
    DBEdit2: TDBEdit;
    Label4: TLabel;
    DBEdit4: TDBEdit;
    Label5: TLabel;
    deMulta: TDBEdit;
    Label6: TLabel;
    deJuros: TDBEdit;
    Label7: TLabel;
    deDesconto: TDBEdit;
    Label10: TLabel;
    DBEdit8: TDBEdit;
    Label13: TLabel;
    DBLookupComboBox1: TDBLookupComboBox;
    moObservacao: TMemo;
    Label3: TLabel;
    Bevel7: TBevel;
    qyMovimentacao_TE: TUMZQuery;
    srcMovimentacao_TE: TDataSource;
    qyMovimentacao_TEcd_movimento_te: TIntegerField;
    qyMovimentacao_TEcd_caixa: TIntegerField;
    qyMovimentacao_TEdt_movimento: TDateTimeField;
    qyMovimentacao_TEnr_sequencia: TIntegerField;
    qyMovimentacao_TEcd_movimento: TIntegerField;
    qyMovimentacao_TEds_movimento: TStringField;
    qyMovimentacao_TEds_observacao: TMemoField;
    qyMovimentacao_TEtp_cheque_dinheiro: TStringField;
    qyMovimentacao_TEvl_movimento: TFloatField;
    qyMovimentacao_TEdt_liberacao: TDateTimeField;
    qyMovimentacao_TEcd_origem: TIntegerField;
    tsCaixa: TTabSheet;
    sbAvancarCaixa: TSpeedButton;
    sbCancelarCaixa: TSpeedButton;
    Bevel9: TBevel;
    edCaixa: TEdit;
    Label14: TLabel;
    Bevel10: TBevel;
    Label15: TLabel;
    Label16: TLabel;
    Bevel11: TBevel;
    SpeedButton1: TSpeedButton;
    lbds_Caixa: TLabel;
    lbSaldoAtual: TLabel;
    Label18: TLabel;
    drgPagamentoEm: TDBRadioGroup;
    Label17: TLabel;
    deLiberacao: TDBEdit;
    Label19: TLabel;
    Label20: TLabel;
    Bevel12: TBevel;
    Label21: TLabel;
    Label22: TLabel;
    Bevel13: TBevel;
    Label23: TLabel;
    Bevel14: TBevel;
    lbNovoSaldo: TLabel;
    qyPlanoContas_TE: TUMZQuery;
    srcPlanoContas_TE: TDataSource;
    sbVoltarCaixa: TSpeedButton;
    qyPlanoContas_TEnr_sequencia: TIntegerField;
    qyPlanoContas_TEcd_caixa: TIntegerField;
    qyPlanoContas_TEdt_movimento: TDateTimeField;
    qyPlanoContas_TEcd_conta: TIntegerField;
    qyPlanoContas_TEcd_centro: TIntegerField;
    qyPlanoContas_TEvl_movimento: TFloatField;
    qyMovimentacao_TEnr_documento: TStringField;
    deDescricao: TDBEdit;
    Label24: TLabel;
    Bevel15: TBevel;
    DBText3: TDBText;
    lbValorPendente: TLabel;
    Panel2: TPanel;
    deValor: TDBEdit;
    Label11: TLabel;
    DBGrid1: TDBGrid;
    qyPlanoContaspc_cd_classificacao: TStringField;
    qyPlanoContaspcc_cd_classificacao: TStringField;
    DBText2: TDBText;
    Bevel16: TBevel;
    Label8: TLabel;
    Label9: TLabel;
    DBText4: TDBText;
    Bevel17: TBevel;
    Label25: TLabel;
    DBText5: TDBText;
    Bevel18: TBevel;
    Label26: TLabel;
    DBText6: TDBText;
    Bevel19: TBevel;
    Label27: TLabel;
    DBText7: TDBText;
    Bevel20: TBevel;
    procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure FormPaint(Sender: TObject);
    procedure sbAvancarClick(Sender: TObject);
    procedure sbVoltarClick(Sender: TObject);
    procedure sbVoltarCaixaClick(Sender: TObject);
    procedure pgCompromissoChanging(Sender: TObject;
      var AllowChange: Boolean);
    procedure sbFinalizarClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure SpeedButton1Click(Sender: TObject);
    procedure DBEdit2Exit(Sender: TObject);

    Function BuscaNome(cd_pessoa: integer): string;
    procedure sbCancelarClick(Sender: TObject);
    procedure sbCancelarPlanoClick(Sender: TObject);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure qyCompromissoAfterInsert(DataSet: TDataSet);
    procedure SpeedButton5Click(Sender: TObject);
    procedure qyPlanoContasAfterInsert(DataSet: TDataSet);
    procedure qyPlanoContasAfterPost(DataSet: TDataSet);
    procedure sbAvancarCaixaClick(Sender: TObject);
    procedure KeyPress(Sender: TObject; var Key: Char);
    procedure SpeedButton2Click(Sender: TObject);
    procedure deMultaExit(Sender: TObject);
    procedure deJurosExit(Sender: TObject);
    procedure deDescontoExit(Sender: TObject);
    Procedure AtualizaApropriacoes;
    procedure drgPagamentoEmClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    tipo_movimento: integer;
  end;

var
  frm_ContasPagar_BaixarCompromisso: Tfrm_ContasPagar_BaixarCompromisso;
  cd_titulo, nr_sequencia: integer;
  cd_movimento_te, nr_sequencia_te: integer;
  total_informado : Real;
  atualizando, finalizou: boolean;
  plano_contas: array of integer;
  plano_centro_custos: array of integer;

implementation

uses Main, uDM, uSelPessoas, uSelConta, uContasPagar_Planilha, Math,
  uSelCaixa, Variants;

{$R *.DFM}

procedure Tfrm_ContasPagar_BaixarCompromisso.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin

  case pgCompromisso.ActivePageIndex of

    0: Begin
      case Key of
        VK_ESCAPE : sbCancelarClick( nil );
        VK_F6 : sbAvancarClick( nil );
      end;
    end;
    1: Begin
      case Key of
        VK_ESCAPE : sbCancelarClick( nil );
        VK_F5 : sbVoltarCaixaClick( nil );
        VK_F6 : sbAvancarCaixaClick( nil );
      end;
    end;
    2: Begin
      case Key of
        VK_ESCAPE : sbCancelarPlanoClick( nil );
        VK_F5 : sbVoltarClick( nil );
        VK_F6 : sbFinalizarClick( nil );
      end;
    end;
  end;

end;

procedure Tfrm_ContasPagar_BaixarCompromisso.FormPaint(Sender: TObject);
begin
  PapelParede(Sender);
end;

procedure Tfrm_ContasPagar_BaixarCompromisso.sbAvancarClick(
  Sender: TObject);
begin

  if (tipo_movimento = 1) AND (qyMovimentacao.FieldByName('vl_saida').AsFloat+qyMovimentacao.FieldByName('vl_multa').AsFloat+qyMovimentacao.FieldByName('vl_juros').AsFloat-qyMovimentacao.FieldByName('vl_desconto').AsFloat > qyMovimentacao.FieldByName('vl_liquido').AsFloat) then
  begin
    MessageDlg('Não há necessidade de Baixar um valor maior do que o Líquido.', mtWarning, [mbOK], 0);
    Abort;
  end;

  if moObservacao.Text <> '' then
      DM.RegistraObservacoes(qyMovimentacao.FieldByName('ds_observacao'), moObservacao.Text);

  moObservacao.ReadOnly := True;

  qyPlanoContas.Close;
  qyPlanoContas.Open;

  total_informado := qyMovimentacao.FieldByName('vl_liquido').AsFloat;
  if tipo_movimento = 1 then
    pgCompromisso.ActivePage := tsCaixa
  else
  begin

    pgCompromisso.ActivePage := tsPlanoContas;
    qyPlanoContas.Close;
    qyPlanoContas.ParamByName('cd_titulo').AsInteger := cd_titulo;
    qyPlanoContas.ParamByName('nr_sequencia').AsInteger := nr_sequencia;
    qyPlanoContas.Prepare;
    qyPlanoContas.Open;

    AtualizaApropriacoes;

  end;
end;

procedure Tfrm_ContasPagar_BaixarCompromisso.sbVoltarClick(
  Sender: TObject);
begin
  if tipo_movimento = 1 then
    pgCompromisso.ActivePage := tsCaixa
  else
  begin
    pgCompromisso.ActivePage := tsInfGerais;
    DBLookupComboBox1.SetFocus;
  end;
end;

procedure Tfrm_ContasPagar_BaixarCompromisso.sbVoltarCaixaClick(
  Sender: TObject);
begin
    pgCompromisso.ActivePage := tsInfGerais;
end;

procedure Tfrm_ContasPagar_BaixarCompromisso.pgCompromissoChanging(
  Sender: TObject; var AllowChange: Boolean);
begin
  AllowChange := False;
end;

procedure Tfrm_ContasPagar_BaixarCompromisso.sbFinalizarClick(
  Sender: TObject);
begin
  try
      qyPlanoContas.Post;
  except
  end;

  { Gerando LOG }
  DM.gerar_log(2121, qyMovimentacao.FieldByName('cd_titulo').AsInteger, 0, qyMovimentacao.FieldByName('nr_sequencia').AsInteger, qyMovimentacao.FieldByName('dt_movimento').AsDateTime);

  try
    qyMovimentacao.Post;
  except
  end;

  if tipo_movimento = 1 then
  begin
    { Gerando LOG }
    DM.gerar_log(2131, 0, qyMovimentacao_TE.FieldByName('cd_caixa').AsInteger, qyMovimentacao_TE.FieldByName('nr_sequencia').AsInteger, qyMovimentacao_TE.FieldByName('dt_movimento').AsDateTime);

    try
      qyMovimentacao_TE.Post;
    except
    end;
  end;

  DM.qyAux1.Close;
  DM.qyAux1.SQL.Clear;
  DM.qyAux1.SQL.Add('SELECT SUM(vl_movimento) AS total FROM apropriacao_cp WHERE cd_titulo = :cd_titulo AND nr_sequencia = :nr_sequencia');
  DM.qyAux1.ParamByName('cd_titulo').AsInteger := qyMovimentacao.FieldByName('cd_titulo').AsInteger;
  DM.qyAux1.ParamByName('nr_sequencia').AsInteger := qyMovimentacao.FieldByName('nr_sequencia').AsInteger;
  DM.qyAux1.Open;

  if DM.qyAux1.FieldByName('total').AsFloat <> qyMovimentacao.FieldByName('vl_liquido').AsFloat then
  begin
    MessageDlg('O total dos valores informados nos Centros de Custos'+CHR(13)+'devem ser iguais ao Valor Total informado.', mtWarning, [mbOK], 0);
    Abort;
  end;

  DM.AtualizaSaldo(qyMovimentacao_TE.FieldByName('cd_caixa').AsInteger, DataHoje, qyMovimentacao_TE.FieldByName('vl_movimento').AsFloat);

  DM.qyAux1.Close;
  DM.qyAux1.SQL.Clear;
  DM.qyAux1.SQL.Add('SELECT SUM(vl_entrada) AS vl_entrada, SUM(vl_saida) AS vl_saida FROM movimentacao_cp WHERE cd_titulo = :cd_titulo');
  DM.qyAux1.ParamByName('cd_titulo').AsInteger := qyMovimentacao.FieldByName('cd_titulo').AsInteger;
  DM.qyAux1.Open;

  if DM.qyAux1.FieldByName('vl_saida').AsFloat >= DM.qyAux1.FieldByName('vl_entrada').AsFloat then
  begin
    DM.qyAux2.Close;
    DM.qyAux2.SQL.Clear;
    DM.qyAux2.SQL.Add('UPDATE contas_pagar SET cd_situacao = 2 WHERE cd_titulo = :cd_titulo');
    DM.qyAux2.ParamByName('cd_titulo').AsInteger := qyMovimentacao.FieldByName('cd_titulo').AsInteger;
    DM.qyAux2.ExecSQL;
  end;

  finalizou := true;
  Close;
end;

procedure Tfrm_ContasPagar_BaixarCompromisso.FormShow(Sender: TObject);
var
  n: LongInt;
begin
  { Todas em maiúsculas }
  DM.TodasMaiusculas(TForm(Sender));

  { Avançar controle com ENTER }
  for n := 0 to ( ComponentCount - 1 ) do
  begin
    if Components[n].ClassType = TDBEdit then
      TDBEdit(Components[n]).OnKeyPress := KeyPress;
    if Components[n].ClassType = TDBLookupComboBox then
      TDBLookupComboBox(Components[n]).OnKeyPress := KeyPress;
    if Components[n].ClassType = TDBComboBox then
      TDBComboBox(Components[n]).OnKeyPress := KeyPress;
    if Components[n].ClassType = TDBCheckBox then
      TDBCheckBox(Components[n]).OnKeyPress := KeyPress;
    if Components[n].ClassType = TEdit then
      TEdit(Components[n]).OnKeyPress := KeyPress;
    if Components[n].ClassType = TCheckBox then
      TCheckBox(Components[n]).OnKeyPress := KeyPress;
    if Components[n].ClassType = TRadioButton then
      TRadioButton(Components[n]).OnKeyPress := KeyPress;
  end ;

  { Variáveis }
  cd_titulo := frm_ContasPagar_Planilha.qyContasPagar.FieldByName('cd_titulo').AsInteger;

  pgCompromisso.ActivePage := tsInfGerais;
  total_informado := 0;

  { Tipos de movimento }
  DM.qyTiposMovto2.Close;
  DM.qyTiposMovto2.ParamByName('cd_tipo_movimento').AsInteger := tipo_movimento;
  DM.qyTiposMovto2.ParamByName('cd_origem').AsInteger := 2;
  DM.qyTiposMovto2.Open;

  DBLookupComboBox1.SetFocus;
  qyMovimentacao.Open;
  qyMovimentacao.Insert;

  nr_sequencia := DM.ProximoId2('nr_sequencia', 'cd_titulo', 'fin_movi_cp', cd_titulo);

  qyMovimentacao.FieldByName('cd_titulo').AsInteger := cd_titulo;
  qyMovimentacao.FieldByName('nr_sequencia').AsInteger := nr_sequencia;
  qyMovimentacao.FieldByName('dt_movimento').EditMask := '99/99/9999';
  qyMovimentacao.FieldByName('dt_movimento').AsDateTime := DataHoje;

  DM.qyAux1.Close;
  DM.qyAux1.SQL.Clear;
  DM.qyAux1.SQL.Add('SELECT                                         ');
  DM.qyAux1.SQL.Add('	SUM(vl_entrada) AS vl_entrada,                ');
  DM.qyAux1.SQL.Add('	SUM(vl_saida) AS vl_saida,                    ');
  DM.qyAux1.SQL.Add('	SUM(vl_multa) AS vl_multa,                    ');
  DM.qyAux1.SQL.Add('	SUM(vl_juros) AS vl_juros,                    ');
  DM.qyAux1.SQL.Add('	SUM(vl_desconto) AS vl_desconto               ');
  DM.qyAux1.SQL.Add('FROM                                           ');
  DM.qyAux1.SQL.Add('	movimentacao_cp                               ');
  DM.qyAux1.SQL.Add('WHERE                                          ');
  DM.qyAux1.SQL.Add('	cd_titulo = :cd_titulo                        ');
  DM.qyAux1.ParamByName('cd_titulo').AsInteger := cd_titulo;
  DM.qyAux1.Open;

  lbValorPendente.Caption := FloatToStr(DM.qyAux1.FieldByName('vl_entrada').AsFloat - DM.qyAux1.FieldByName('vl_saida').AsFloat);

  if tipo_movimento = 1 then
  begin

    deDescricao.Enabled := True;
    deMulta.Enabled := True;
    deJuros.Enabled := True;
    deDesconto.Enabled := True;

    qyMovimentacao.FieldByName('vl_multa').AsFloat := 0;
    qyMovimentacao.FieldByName('vl_juros').AsFloat := 0;
    qyMovimentacao.FieldByName('vl_desconto').AsFloat := 0;
    qyMovimentacao.FieldByName('vl_liquido').AsFloat := DM.qyAux1.FieldByName('vl_entrada').AsFloat - DM.qyAux1.FieldByName('vl_saida').AsFloat;
    qyMovimentacao.FieldByName('vl_saida').AsFloat := DM.qyAux1.FieldByName('vl_entrada').AsFloat - DM.qyAux1.FieldByName('vl_saida').AsFloat;

    cd_movimento_te := DM.ProximoId('cd_movimento_te', 'fin_mov_tesouraria');

    qyMovimentacao_TE.Close;
    qyMovimentacao_TE.Open;
    qyMovimentacao_TE.Insert;
    qyMovimentacao_TE.FieldByName('cd_movimento_te').AsInteger := cd_movimento_te;
    qyMovimentacao_TE.FieldByName('dt_movimento').AsDateTime := DataHoje;
    qyMovimentacao_TE.FieldByName('dt_liberacao').EditMask := '99/99/9999';

  end
  else
  begin
    deDescricao.Enabled := False;
    deMulta.Enabled := False;
    deJuros.Enabled := False;
    deDesconto.Enabled := False;
    qyMovimentacao.FieldByName('vl_saida').AsFloat := DM.qyAux1.FieldByName('vl_entrada').AsFloat - DM.qyAux1.FieldByName('vl_saida').AsFloat;
  end;

end;

procedure Tfrm_ContasPagar_BaixarCompromisso.SpeedButton1Click(
  Sender: TObject);
begin

  frm_SelCaixa.ShowModal;

  if frm_SelCaixa.flgSearch then
  begin

    if frm_SelCaixa.qyCaixa.FieldByName('sn_ativa').AsString = 'N' then
    begin
      MessageDlg('Este caixa está inativo, escolha um caixa ativo para prosseguir.', mtWarning, [mbOK], 0);
      Abort;
    end;

    if frm_SelCaixa.qyCaixa.FieldByName('vl_saldo').AsFloat < qyMovimentacao.FieldByName('vl_saida').AsFloat then
      MessageDlg('O saldo deste caixa é menor do que o valor necessário para baixar o compromisso.'+CHR(13)+'Devido a isso o saldo do caixa ficará negativo.', mtWarning, [mbOK], 0);

    edCaixa.Text := frm_SelCaixa.qyCaixa.FieldByName('cd_caixa').AsString;
    lbds_Caixa.Caption := frm_SelCaixa.qyCaixa.FieldByName('ds_caixa').AsString;
    lbSaldoAtual.Caption := frm_SelCaixa.qyCaixa.FieldByName('vl_saldo').AsString;
    lbNovoSaldo.Caption := FloatToStr(frm_SelCaixa.qyCaixa.FieldByName('vl_saldo').AsFloat - qyMovimentacao.FieldByName('vl_liquido').AsFloat);

  end;

end;

Function Tfrm_ContasPagar_BaixarCompromisso.BuscaNome(cd_pessoa: integer): string;
Begin
  pgCompromisso.Cursor := crHourGlass;
  DM.qyAux1.Close;
  DM.qyAux1.SQL.Clear;
  DM.qyAux1.SQL.Add('SELECT nm_pessoa FROM pessoas WHERE cd_pessoa = :cd_pessoa');
  DM.qyAux1.ParamByName('cd_pessoa').AsInteger := cd_pessoa;
  DM.qyAux1.Open;

  Result := DM.qyAux1.FieldByName('nm_pessoa').AsString;
  pgCompromisso.Cursor := crDefault;
End;

procedure Tfrm_ContasPagar_BaixarCompromisso.DBEdit2Exit(Sender: TObject);
begin
//  lbNomeFornecedor.Caption := BuscaNome(qyCompromisso.FieldByName('cd_pessoa').AsInteger);
end;

procedure Tfrm_ContasPagar_BaixarCompromisso.sbCancelarClick(
  Sender: TObject);
begin
  Close;
end;

procedure Tfrm_ContasPagar_BaixarCompromisso.sbCancelarPlanoClick(
  Sender: TObject);
begin
  Close;
end;

procedure Tfrm_ContasPagar_BaixarCompromisso.FormCloseQuery(Sender: TObject;
  var CanClose: Boolean);
begin

  if not finalizou then
  begin

    DM.qyAux2.Close;
    DM.qyAux2.SQL.Clear;
    DM.qyAux2.SQL.Add('DELETE FROM apropriacao_cp WHERE cd_titulo = :cd_titulo AND nr_sequencia = :nr_sequencia');
    DM.qyAux2.ParamByName('cd_titulo').AsInteger := qyMovimentacao.FieldByName('cd_titulo').AsInteger;
    DM.qyAux2.ParamByName('nr_sequencia').AsInteger := qyMovimentacao.FieldByName('nr_sequencia').AsInteger;
    DM.qyAux2.ExecSQL;

    DM.qyAux2.Close;
    DM.qyAux2.SQL.Clear;
    DM.qyAux2.SQL.Add('DELETE FROM apropriacao_te WHERE nr_sequencia = :nr_sequencia AND cd_caixa = :cd_caixa');
    DM.qyAux2.ParamByName('nr_sequencia').AsInteger := nr_sequencia_te;
    DM.qyAux2.ParamByName('cd_caixa').AsInteger := qyMovimentacao_TE.FieldByName('cd_caixa').AsInteger;
    DM.qyAux2.ExecSQL;

    qyMovimentacao.Cancel;
    if tipo_movimento = 1 then
      qyMovimentacao_TE.Cancel;
  end;

  frm_ContasPagar_Planilha.qyContasPagar.Close;
  frm_ContasPagar_Planilha.qyContasPagar.Open;
  frm_ContasPagar_Planilha.qyContasPagar.Locate('cd_titulo', qyMovimentacao.FieldByName('cd_titulo').AsInteger, []);
  frm_ContasPagar_Planilha.Filtra;

end;

procedure Tfrm_ContasPagar_BaixarCompromisso.qyCompromissoAfterInsert(
  DataSet: TDataSet);
begin
//  qyCompromisso.FieldByName('cd_titulo').AsInteger := DM.ProximoId('cd_titulo','contas_pagar');
//  qyCompromisso.FieldByName('cd_situacao').AsInteger := 1;
//  qyCompromisso.FieldByName('sn_previsao').AsString := 'N';
end;

procedure Tfrm_ContasPagar_BaixarCompromisso.SpeedButton5Click(
  Sender: TObject);
begin

  frm_SelConta.ShowModal;
  if frm_SelConta.flgSearch then
  Begin
    qyPlanoContas.FieldByName('cd_conta').AsInteger := frm_SelPessoa.qryPessoa.FieldByName('cd_pessoa').AsInteger;
//  lbNomeFornecedor.Caption := BuscaNome(frm_SelPessoa.qryPessoa.FieldByName('cd_pessoa').AsInteger);
  End;

end;

procedure Tfrm_ContasPagar_BaixarCompromisso.qyPlanoContasAfterInsert(
  DataSet: TDataSet);
begin

  qyPlanoContas.FieldByName('cd_titulo').AsInteger := cd_titulo;
  qyPlanoContas.FieldByName('nr_sequencia').AsInteger := nr_sequencia;
  qyPlanoContas.FieldByName('vl_movimento').AsFloat := qyMovimentacao.FieldByName('vl_saida').AsFloat - total_informado;

end;

procedure Tfrm_ContasPagar_BaixarCompromisso.qyPlanoContasAfterPost(
  DataSet: TDataSet);
begin
  total_informado := total_informado + qyPlanoContas.FieldByName('vl_movimento').AsFloat;
  qyPlanoContas.ApplyUpdates;

  { Gerando a apropriacao na tesouraria }
  if tipo_movimento = 1 then  // Se for 1 --> Baixa por pagamento
  begin

    qyPlanoContas_TE.Close;
    qyPlanoContas_TE.SQL.Clear;

    if atualizando then
      qyPlanoContas_TE.SQL.Add('INSERT INTO apropriacao_te VALUES (:nr_sequencia, :cd_caixa, :dt_movimento, :cd_conta, :cd_centro, :vl_movimento)')
    else
      qyPlanoContas_TE.SQL.Add('UPDATE apropriacao_te SET cd_conta = :cd_conta, cd_centro = :cd_centro, vl_movimento = :vl_movimento WHERE cd_caixa = :cd_caixa AND dt_movimento = :dt_movimento AND nr_sequencia = :nr_sequencia');

    qyPlanoContas_TE.ParamByName('nr_sequencia').AsInteger := nr_sequencia_te;
    qyPlanoContas_TE.ParamByName('cd_caixa').AsInteger := StrToInt(edCaixa.Text);
    qyPlanoContas_TE.ParamByName('dt_movimento').AsString := FormatDateTime('yyyy-mm-dd', DataHoje);
    qyPlanoContas_TE.ParamByName('cd_conta').AsInteger := qyPlanoContas.FieldByName('cd_conta').AsInteger;
    qyPlanoContas_TE.ParamByName('cd_centro').AsInteger := qyPlanoContas.FieldByName('cd_centro').AsInteger;
    qyPlanoContas_TE.ParamByName('vl_movimento').AsFloat := qyPlanoContas.FieldByName('vl_movimento').AsFloat;
    qyPlanoContas_TE.ExecSQL;

  end;

  qyPlanoContas.First;

end;

procedure Tfrm_ContasPagar_BaixarCompromisso.sbAvancarCaixaClick(
  Sender: TObject);
begin

  pgCompromisso.ActivePage := tsPlanoContas;
  frm_ContasPagar_BaixarCompromisso.Cursor := crHourGlass;
  qyMovimentacao_TE.FieldByName('cd_caixa').AsInteger := StrToInt(edCaixa.Text);

  DM.qyAux2.Close;
  DM.qyAux2.SQL.Clear;
  DM.qyAux2.SQL.Add('SELECT cd_movimento_caixa FROM tipos_movimento WHERE cd_movimento = :cd_movimento');
  DM.qyAux2.ParamByName('cd_movimento').AsInteger := qyMovimentacao.FieldByName('cd_movimento').AsInteger;
  DM.qyAux2.Open;

  nr_sequencia_te := DM.ProximoId3('nr_sequencia', 'cd_caixa', 'dt_movimento', 'fin_mov_tesouraria', edCaixa.Text, FormatDateTime('yyyy-mm-dd', DataHoje));
  qyMovimentacao_TE.FieldByName('nr_sequencia').AsInteger := nr_sequencia_te;
  qyMovimentacao_TE.FieldByName('cd_movimento').AsInteger := DM.qyAux2.FieldByName('cd_movimento_caixa').AsInteger;
  qyMovimentacao_TE.FieldByName('nr_documento').AsString := frm_ContasPagar_Planilha.qyContasPagar.FieldByName('nr_documento').AsString;
  qyMovimentacao_TE.FieldByName('ds_observacao').AsString := qyMovimentacao.FieldByName('ds_observacao').AsString;
  qyMovimentacao_TE.FieldByName('vl_movimento').ASFloat := qyMovimentacao.FieldByName('vl_liquido').AsFloat;
  qyMovimentacao_TE.FieldByName('cd_origem').AsInteger := 2;  // 2 - Contas a Pagar
//  qyMovimentacao_TE.Post;

  qyMovimentacao.FieldByName('cd_movimento_te').AsInteger := cd_movimento_te;
//  qyMovimentacao.Post;

  qyPlanoContas.Close;
  qyPlanoContas.ParamByName('cd_titulo').AsInteger := cd_titulo;
  qyPlanoContas.ParamByName('nr_sequencia').AsInteger := nr_sequencia;
  qyPlanoContas.Prepare;
  qyPlanoContas.Open;

  AtualizaApropriacoes;

  frm_ContasPagar_BaixarCompromisso.Cursor := crDefault;

end;

procedure Tfrm_ContasPagar_BaixarCompromisso.KeyPress(
  Sender: TObject; var Key: Char);
begin

  if key = #13 Then
  Begin
     SelectNext(Sender as TWinControl, True, True);
     Key := #0;
  End;

end;


procedure Tfrm_ContasPagar_BaixarCompromisso.SpeedButton2Click(
  Sender: TObject);
begin
  try
    qyPlanoContas.Post;
  except
  end;
  
  qyPlanoContas.Insert;
end;

procedure Tfrm_ContasPagar_BaixarCompromisso.deMultaExit(Sender: TObject);
begin
    qyMovimentacao.FieldByName('vl_liquido').AsFloat := StrToFloat(lbValorPendente.Caption) + qyMovimentacao.FieldByName('vl_multa').AsFloat + qyMovimentacao.FieldByName('vl_juros').AsFloat - qyMovimentacao.FieldByName('vl_desconto').AsFloat;

end;

procedure Tfrm_ContasPagar_BaixarCompromisso.deJurosExit(Sender: TObject);
begin
    qyMovimentacao.FieldByName('vl_liquido').AsFloat := StrToFloat(lbValorPendente.Caption) + qyMovimentacao.FieldByName('vl_multa').AsFloat + qyMovimentacao.FieldByName('vl_juros').AsFloat - qyMovimentacao.FieldByName('vl_desconto').AsFloat;

end;

procedure Tfrm_ContasPagar_BaixarCompromisso.deDescontoExit(
  Sender: TObject);
begin
    qyMovimentacao.FieldByName('vl_liquido').AsFloat := StrToFloat(lbValorPendente.Caption) + qyMovimentacao.FieldByName('vl_multa').AsFloat + qyMovimentacao.FieldByName('vl_juros').AsFloat - qyMovimentacao.FieldByName('vl_desconto').AsFloat;

end;

Procedure Tfrm_ContasPagar_BaixarCompromisso.AtualizaApropriacoes;
Begin

  atualizando := true;

    DM.qyAux1.Close;
    DM.qyAux1.SQL.Clear;
    DM.qyAux1.SQL.Add('SELECT * FROM apropriacao_cp WHERE cd_titulo = :cd_titulo AND nr_sequencia = 1');
    DM.qyAux1.ParamByName('cd_titulo').AsInteger := cd_titulo;
    DM.qyAux1.Open;

    while not DM.qyAux1.Eof do
    begin
      qyPlanoContas.Insert;
      qyPlanoContas.FieldByName('cd_titulo').AsInteger := DM.qyAux1.FieldByName('cd_titulo').AsInteger;
      qyPlanoContas.FieldByName('nr_sequencia').AsInteger := nr_sequencia;
      qyPlanoContas.FieldByName('cd_conta').AsInteger := DM.qyAux1.FieldByName('cd_conta').AsInteger;
      qyPlanoContas.FieldByName('cd_centro').AsInteger := DM.qyAux1.FieldByName('cd_centro').AsInteger;
      qyPlanoContas.FieldByName('vl_movimento').AsFloat := DM.qyAux1.FieldByName('vl_movimento').AsFloat;

        DM.qyAux2.Close;
        DM.qyAux2.SQL.Clear;
        DM.qyAux2.SQL.Add('SELECT ds_conta FROM plano_contas WHERE cd_conta = :cd_conta');
        DM.qyAux2.ParamByName('cd_conta').AsInteger := qyPlanoContas.FieldByName('cd_conta').AsInteger;
        DM.qyAux2.Open;
        qyPlanoContas.FieldByName('ds_conta').AsString := DM.qyAux2.FieldByName('ds_conta').AsString;

        DM.qyAux2.Close;
        DM.qyAux2.SQL.Clear;
        DM.qyAux2.SQL.Add('SELECT ds_centro FROM plano_centro_custos WHERE cd_centro = :cd_centro');
        DM.qyAux2.ParamByName('cd_centro').AsInteger := qyPlanoContas.FieldByName('cd_centro').AsInteger;
        DM.qyAux2.Open;
        qyPlanoContas.FieldByName('ds_centro').AsString := DM.qyAux2.FieldByName('ds_centro').AsString;

      qyPlanoContas.Post;
      DM.qyAux1.Next;
    end;

    atualizando := False;

end;

procedure Tfrm_ContasPagar_BaixarCompromisso.drgPagamentoEmClick(
  Sender: TObject);
begin

  if drgPagamentoEm.ItemIndex = 1 then
    deLiberacao.Enabled := False
  else
    deLiberacao.Enabled := True;

end;

end.

