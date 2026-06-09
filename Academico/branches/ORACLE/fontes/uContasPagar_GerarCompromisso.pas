unit uContasPagar_GerarCompromisso;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, Grids, DBGrids, ExtCtrls, Db, ZConnection, Spin, ComCtrls, Mask,
  General, ZAbstractRODataset, ZAbstractDataset, ZDataset, UZDataset, Menus, Buttons, ImgList, DBCtrls, dbcgrids,
  ZSqlUpdate;

type

  Tfrm_ContasPagar_GerarCompromisso = class(TForm)
    Bevel1: TBevel;
    Bevel2: TBevel;
    Bevel3: TBevel;
    Bevel4: TBevel;
    pgCompromisso: TPageControl;
    tsInfGerais: TTabSheet;
    sbAvancar: TSpeedButton;
    tsPlanoContas: TTabSheet;
    srcCompromisso: TDataSource;
    qyCompromisso: TUMZQuery;
    sbVoltar: TSpeedButton;
    sbFinalizar: TSpeedButton;
    Bevel5: TBevel;
    Bevel6: TBevel;
    qyCompromissocd_titulo: TIntegerField;
    qyCompromissocd_pessoa: TIntegerField;
    qyCompromissods_despesa: TStringField;
    qyCompromissonr_documento: TStringField;
    qyCompromissodt_emissao: TDateTimeField;
    qyCompromissodt_vencimento: TDateTimeField;
    qyCompromissovl_despesa: TFloatField;
    qyCompromissocd_situacao: TSmallintField;
    qyCompromissosn_previsao: TStringField;
    qyCompromissocd_tipo_titulo: TSmallintField;
    Label2: TLabel;
    DBEdit2: TDBEdit;
    Label3: TLabel;
    DBEdit3: TDBEdit;
    Label4: TLabel;
    DBEdit4: TDBEdit;
    Label5: TLabel;
    DBEdit5: TDBEdit;
    Label6: TLabel;
    DBEdit6: TDBEdit;
    Label7: TLabel;
    DBEdit7: TDBEdit;
    Label10: TLabel;
    Bevel7: TBevel;
    Label1: TLabel;
    SpeedButton1: TSpeedButton;
    DBCheckBox1: TDBCheckBox;
    DBLookupComboBox1: TDBLookupComboBox;
    lbNomeFornecedor: TLabel;
    sbCancelar: TSpeedButton;
    sbCancelarPlanoContas: TSpeedButton;
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
    Label13: TLabel;
    Label14: TLabel;
    Bevel9: TBevel;
    Bevel10: TBevel;
    lbNomeFornecedor2: TLabel;
    DBText2: TDBText;
    DBGrid1: TDBGrid;
    Panel3: TPanel;
    sbIncluirPlano: TSpeedButton;
    Label8: TLabel;
    dcxPlanoContas: TDBComboBox;
    Label9: TLabel;
    dcxCentroCustos: TDBComboBox;
    Label11: TLabel;
    deValor: TDBEdit;
    qyPlanoContaspc_cd_classificacao: TStringField;
    qyPlanoContaspcc_cd_classificacao: TStringField;
    Label15: TLabel;
    Label16: TLabel;
    dcxPCClassificacao: TDBComboBox;
    dcxPCCClassificacao: TDBComboBox;
    qyCompromissodt_competencia: TDateTimeField;
    qyCompromissodt_provavel_pgto: TDateTimeField;
    qyCompromissotp_entrada_saida: TSmallintField;
    DBComboBox1: TDBComboBox;
    Label17: TLabel;
    Label18: TLabel;
    DBEdit1: TDBEdit;
    Label19: TLabel;
    DBEdit8: TDBEdit;
    DBComboBox2: TDBComboBox;
    Label20: TLabel;
    procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure FormPaint(Sender: TObject);
    procedure sbAvancarClick(Sender: TObject);
    procedure sbVoltarClick(Sender: TObject);
    procedure pgCompromissoChanging(Sender: TObject;
      var AllowChange: Boolean);
    procedure sbFinalizarClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure SpeedButton1Click(Sender: TObject);
    procedure DBEdit2Exit(Sender: TObject);

    Function BuscaNome(cd_pessoa: integer): string;
    procedure sbCancelarClick(Sender: TObject);
    procedure sbCancelarPlanoContasClick(Sender: TObject);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure qyCompromissoAfterInsert(DataSet: TDataSet);
    procedure SpeedButton5Click(Sender: TObject);
    procedure qyPlanoContasAfterInsert(DataSet: TDataSet);
    procedure sbInserirPlanoClick(Sender: TObject);
    procedure qyPlanoContasAfterPost(DataSet: TDataSet);
    procedure KeyPress(Sender: TObject; var Key: Char);
    procedure dcxPlanoContasChange(Sender: TObject);
    procedure dcxPlanoContasChange2(Sender: TObject);
    procedure dcxCentroCustosChange(Sender: TObject);
    procedure dcxCentroCustosChange2(Sender: TObject);
    procedure sbIncluirPlanoClick(Sender: TObject);

  private
    { Private declarations }
  public
    { Public declarations }

    tipo_operacao: integer;
      { 1 - Normal, 2 - Alteração (Previsão->Compromisso) }
  end;

var
  frm_ContasPagar_GerarCompromisso: Tfrm_ContasPagar_GerarCompromisso;
  finalizou: boolean;
  plano_contas: array of integer;
  plano_centro_custos: array of integer;
  pc_cd_classificacao: array of string;
  pcc_cd_classificacao: array of string;
  total_informado: Real;

implementation

uses Main, uDM, uSelConta, uContasPagar_Planilha, Math, uFSelecionarPessoa;

{$R *.DFM}

procedure Tfrm_ContasPagar_GerarCompromisso.FormKeyDown(Sender: TObject; var Key: Word;
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
        VK_ESCAPE : sbCancelarPlanoContasClick( nil );
        VK_F5 : sbVoltarClick( nil );
        VK_F6 : sbFinalizarClick( nil );
        VK_ADD : sbInserirPlanoClick( nil );
      end;
    end;

  end;

end;

procedure Tfrm_ContasPagar_GerarCompromisso.FormPaint(Sender: TObject);
begin
  PapelParede(Sender);
end;

procedure Tfrm_ContasPagar_GerarCompromisso.sbAvancarClick(
  Sender: TObject);
var
  regCompromisso, regMovimentacao: integer;
begin
  regCompromisso := qyCompromisso.FieldByName('cd_titulo').AsInteger;

  DBEdit2.SetFocus;
{  if qyCompromisso.FieldByName('sn_previsao').AsString = 'S' then
  begin
    qyCompromisso.Post;
    finalizou := True;
    Close;
    Abort;
  end; }

  qyMovimentacao.Close;
  qyMovimentacao.Open;

  regMovimentacao := DM.ProximoId2('nr_sequencia', 'cd_titulo', 'fin_mov_cp', qyCompromisso.FieldByName('cd_titulo').AsInteger);
  qyMovimentacao.Insert;
  qyMovimentacao.FieldByName('cd_titulo').AsInteger := regCompromisso;
  qyMovimentacao.FieldByName('nr_sequencia').AsInteger := regMovimentacao;
  qyMovimentacao.FieldByName('cd_movimento').AsInteger := 1;
  qyMovimentacao.FieldByName('dt_movimento').AsDateTime := DataHoje;
  qyMovimentacao.FieldByName('vl_entrada').AsFloat := qyCompromisso.FieldByName('vl_despesa').AsFloat;

  pgCompromisso.ActivePage := tsPlanoContas;
  qyPlanoContas.Close;
  qyPlanoContas.ParamByName('cd_titulo').AsInteger := regCompromisso;
  qyPlanoContas.ParamByName('nr_sequencia').AsInteger := regMovimentacao;
  qyPlanoContas.Open;
  dcxPlanoContas.SetFocus;
  qyPlanoContas.Insert;
end;

procedure Tfrm_ContasPagar_GerarCompromisso.sbVoltarClick(
  Sender: TObject);
begin
  pgCompromisso.ActivePage := tsInfGerais;
  DBEdit2.SetFocus;
end;

procedure Tfrm_ContasPagar_GerarCompromisso.pgCompromissoChanging(
  Sender: TObject; var AllowChange: Boolean);
begin
  AllowChange := False;
end;

procedure Tfrm_ContasPagar_GerarCompromisso.sbFinalizarClick(
  Sender: TObject);
begin
  try
    if (dcxPlanoContas.Text = '') OR (dcxCentroCustos.Text = '') then
      qyPlanoContas.Cancel
    else
      qyPlanoContas.Post;
  except
  end;

  DM.qyAux1.Close;
  DM.qyAux1.SQL.Clear;
  DM.qyAux1.SQL.Add('SELECT SUM(vl_movimento) AS total FROM apropriacao_cp WHERE cd_titulo = :cd_titulo AND nr_sequencia = :nr_sequencia');
  DM.qyAux1.ParamByName('cd_titulo').AsInteger := qyMovimentacao.FieldByName('cd_titulo').AsInteger;
  DM.qyAux1.ParamByName('nr_sequencia').AsInteger := qyMovimentacao.FieldByName('nr_sequencia').AsInteger;
  DM.qyAux1.Open;

  if DM.qyAux1.FieldByName('total').AsFloat <> qyMovimentacao.FieldByName('vl_entrada').AsFloat then
  begin
    MessageDlg('O total dos valores informados nos Centros de Custos'+CHR(13)+'devem ser iguais ao Valor Total informado.', mtWarning, [mbOK], 0);
    Abort;
  end;

  qyCompromisso.Post;
  if qyCompromisso.FieldByName('sn_previsao').AsString = 'N' then
  begin
    { Gerando LOG }
//    DM.gerar_log(2121, qyCompromisso.FieldByName('cd_titulo').AsInteger, 0, qyMovimentacao.FieldByName('nr_sequencia').AsInteger, qyMovimentacao.FieldByName('dt_movimento').AsDateTime);

    qyMovimentacao.Post;
  end;

  finalizou := true;
  Close;
end;

procedure Tfrm_ContasPagar_GerarCompromisso.FormShow(Sender: TObject);
var
  n : LongInt ;
begin

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

  pgCompromisso.ActivePage := tsInfGerais;
  total_informado := 0;

  { Selecionando na base os tipos de título }
  DM.qyTiposTitulo.Close;
  DM.qyTiposTitulo.SQL.Clear;
  DM.qyTiposTitulo.SQL.Add('SELECT                    ');
  DM.qyTiposTitulo.SQL.Add('   *                      ');
  DM.qyTiposTitulo.SQL.Add('FROM                      ');
  DM.qyTiposTitulo.SQL.Add('   tipos_titulo           ');
  DM.qyTiposTitulo.SQL.Add('WHERE                     ');
  DM.qyTiposTitulo.SQL.Add('   ct_tipo_titulo = 2     ');  // 2 = Contas a Pagar
  DM.qyTiposTitulo.Open;

  DBEdit2.SetFocus;
  qyCompromisso.Open;

  case tipo_operacao of
    1: Begin
      qyCompromisso.Insert;
      qyCompromisso.FieldByName('dt_emissao').EditMask := '99/99/9999';
      qyCompromisso.FieldByName('dt_vencimento').EditMask := '99/99/9999';
      qyCompromisso.FieldByName('dt_emissao').AsDateTime := DataHoje;
    end;
    2: Begin
      qyCompromisso.Locate('cd_titulo', frm_Compromisso_Planilha.qryContasPagar.FieldByName('cd_titulo').AsInteger, []);
      qyCompromisso.Edit;
      qyCompromisso.FieldByName('sn_previsao').AsString := 'N';
    end;
  end;

  { Montando o ComboBox de Planos de Contas }
  dcxPlanoContas.Items.Clear;
  dcxPCClassificacao.Items.Clear;
  dcxCentroCustos.Items.Clear;
  dcxPCCClassificacao.Items.Clear;
  DM.qyAux1.Close;
  DM.qyAux1.SQL.Clear;
  DM.qyAux1.SQL.Add('SELECT * FROM plano_contas WHERE tp_conta = 2 AND tp_entrada_saida = 2');
  DM.qyAux1.Open;

  n := 0;
  while not DM.qyAux1.Eof do
  begin
    SetLength(plano_contas,n+1);
    plano_contas[n] := DM.qyAux1.FieldByName('cd_conta').AsInteger;
    dcxPlanoContas.Items.Add(DM.qyAux1.FieldByName('ds_conta').AsString);

    SetLength(pc_cd_classificacao,n+1);
    pc_cd_classificacao[n] := DM.qyAux1.FieldByName('cd_classificacao').AsString;
    dcxPCClassificacao.Items.Add(DM.qyAux1.FieldByName('cd_classificacao').AsString);

    n := n + 1;
    DM.qyAux1.Next;
  end;
  { / Montando o ComboBox de Planos de Contas }


  { Montando o ComboBox de Centros de Custos }
  DM.qyAux1.Close;
  DM.qyAux1.SQL.Clear;
  DM.qyAux1.SQL.Add('SELECT * FROM plano_centro_custos WHERE tp_centro = 2');
  DM.qyAux1.Open;

  n := 0;
  while not DM.qyAux1.Eof do
  begin
    SetLength(plano_centro_custos,n+1);
    plano_centro_custos[n] := DM.qyAux1.FieldByName('cd_centro').AsInteger;
    dcxCentroCustos.Items.Add(DM.qyAux1.FieldByName('ds_centro').AsString);

    SetLength(pcc_cd_classificacao,n+1);
    pcc_cd_classificacao[n] := DM.qyAux1.FieldByName('cd_classificacao').AsString;
    dcxPCCClassificacao.Items.Add(DM.qyAux1.FieldByName('cd_classificacao').AsString);

    n := n + 1;
    DM.qyAux1.Next;
  end;
  { / Montando o ComboBox de Centros de Custos }

end;

procedure Tfrm_ContasPagar_GerarCompromisso.SpeedButton1Click(
  Sender: TObject);
var
   resultado: TResultadoFiltroPessoa;
begin

   resultado := TfrmSelecionarPessoa.Filtrar([]);

  if resultado.filtrado then
  begin
    qyCompromisso.FieldByName('cd_pessoa').AsInteger := resultado.cd_pessoa;
    lbNomeFornecedor.Caption := resultado.nm_pessoa;
    lbNomeFornecedor2.Caption := resultado.nm_pessoa;
  end;
end;

Function Tfrm_ContasPagar_GerarCompromisso.BuscaNome(cd_pessoa: integer): string;
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

procedure Tfrm_ContasPagar_GerarCompromisso.DBEdit2Exit(Sender: TObject);
begin

  if qyCompromisso.FieldByName('cd_pessoa').AsString <> '' then
  begin
    lbNomeFornecedor.Caption := BuscaNome(qyCompromisso.FieldByName('cd_pessoa').AsInteger);
    lbNomeFornecedor2.Caption := BuscaNome(qyCompromisso.FieldByName('cd_pessoa').AsInteger);
  end;

end;

procedure Tfrm_ContasPagar_GerarCompromisso.sbCancelarClick(
  Sender: TObject);
begin
  Close;
end;

procedure Tfrm_ContasPagar_GerarCompromisso.sbCancelarPlanoContasClick(
  Sender: TObject);
begin
  Close;
end;

procedure Tfrm_ContasPagar_GerarCompromisso.FormCloseQuery(Sender: TObject;
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

    qyCompromisso.Cancel;
    qyMovimentacao.Cancel;

  end;

  frm_Compromisso_Planilha.qryContasPagar.Close;
  frm_Compromisso_Planilha.qryContasPagar.Open;
  frm_Compromisso_Planilha.qryContasPagar.Locate('cd_titulo', qyMovimentacao.FieldByName('cd_titulo').AsInteger, []);
  frm_Compromisso_Planilha.Filtra;

end;

procedure Tfrm_ContasPagar_GerarCompromisso.qyCompromissoAfterInsert(
  DataSet: TDataSet);
begin
  qyCompromisso.FieldByName('cd_titulo').AsInteger := DM.ProximoId('cd_titulo','fin_contas_pagar');
  qyCompromisso.FieldByName('cd_situacao').AsInteger := 2;
  qyCompromisso.FieldByName('sn_previsao').AsString := 'N';
end;

procedure Tfrm_ContasPagar_GerarCompromisso.SpeedButton5Click(
  Sender: TObject);
var
   resultado: TResultadoFiltroPessoa;  
begin

   resultado := TfrmSelecionarPessoa.Filtrar([]);

  if resultado.filtrado then
  Begin
    qyPlanoContas.FieldByName('cd_conta').AsInteger := resultado.cd_pessoa;
    lbNomeFornecedor.Caption := resultado.nm_pessoa;
    lbNomeFornecedor2.Caption := resultado.nm_pessoa;
  End;

end;

procedure Tfrm_ContasPagar_GerarCompromisso.qyPlanoContasAfterInsert(
  DataSet: TDataSet);
begin
  qyPlanoContas.FieldByName('cd_titulo').AsInteger := qyMovimentacao.FieldByName('cd_titulo').AsInteger;
  qyPlanoContas.FieldByName('nr_sequencia').AsInteger := qyMovimentacao.FieldByName('nr_sequencia').AsInteger;
  qyPlanoContas.FieldByName('vl_movimento').AsFloat := qyMovimentacao.FieldByName('vl_entrada').AsFloat - total_informado;
  dcxPlanoContas.SetFocus;
end;

procedure Tfrm_ContasPagar_GerarCompromisso.sbInserirPlanoClick(
  Sender: TObject);
begin
  try
    qyPlanoContas.Post;
  except
  end;
  dcxPlanoContas.SetFocus;
  qyPlanoContas.Insert;
end;

procedure Tfrm_ContasPagar_GerarCompromisso.qyPlanoContasAfterPost(
  DataSet: TDataSet);
begin
  if (qyPlanoContas.FieldByName('cd_conta').AsInteger <= 0) OR (qyPlanoContas.FieldByName('cd_centro').AsInteger <= 0) then
  begin
    qyPlanoContas.CancelUpdates;
    qyPlanoContas.Close;
    qyPlanoContas.Open;
  end
  else
  begin
    total_informado := total_informado + qyPlanoContas.FieldByName('vl_movimento').AsFloat;
    qyPlanoContas.ApplyUpdates;
    qyPlanoContas.First;
  end;
end;

procedure Tfrm_ContasPagar_GerarCompromisso.KeyPress(
  Sender: TObject; var Key: Char);
begin

  if key = #13 Then
  Begin
     SelectNext(Sender as TWinControl, True, True);
     Key := #0;
  End;

end;

procedure Tfrm_ContasPagar_GerarCompromisso.dcxPlanoContasChange(
  Sender: TObject);
begin
  qyPlanoContas.FieldByName('cd_conta').AsInteger := plano_contas[dcxPlanoContas.ItemIndex];
  qyPlanoContas.FieldByName('pc_cd_classificacao').AsString := pc_cd_classificacao[dcxPlanoContas.ItemIndex];
end;

procedure Tfrm_ContasPagar_GerarCompromisso.dcxPlanoContasChange2(
  Sender: TObject);
begin
  qyPlanoContas.FieldByName('cd_conta').AsInteger := plano_contas[dcxPCClassificacao.ItemIndex];
  dcxPlanoContas.ItemIndex := dcxPCClassificacao.ItemIndex;
  qyPlanoContas.FieldByName('ds_conta').AsString := dcxPlanoContas.Text;
  qyPlanoContas.FieldByName('pc_cd_classificacao').AsString := pc_cd_classificacao[dcxPCClassificacao.ItemIndex];
end;

procedure Tfrm_ContasPagar_GerarCompromisso.dcxCentroCustosChange(
  Sender: TObject);
begin
  qyPlanoContas.FieldByName('cd_centro').AsInteger := plano_centro_custos[dcxCentroCustos.ItemIndex];
  qyPlanoContas.FieldByName('pcc_cd_classificacao').AsString := pcc_cd_classificacao[dcxCentroCustos.ItemIndex];
end;

procedure Tfrm_ContasPagar_GerarCompromisso.dcxCentroCustosChange2(
  Sender: TObject);
begin
  qyPlanoContas.FieldByName('cd_centro').AsInteger := plano_centro_custos[dcxPCCClassificacao.ItemIndex];
  dcxCentroCustos.ItemIndex := dcxPCCClassificacao.ItemIndex;
  qyPlanoContas.FieldByName('ds_centro').AsString := dcxCentroCustos.Text;
  qyPlanoContas.FieldByName('pcc_cd_classificacao').AsString := pcc_cd_classificacao[dcxPCCClassificacao.ItemIndex];
end;

procedure Tfrm_ContasPagar_GerarCompromisso.sbIncluirPlanoClick(
  Sender: TObject);
begin
  try
    qyPlanoContas.Post;
  except
  end;

  qyPlanoContas.Insert;
end;

end.

