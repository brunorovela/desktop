unit uTesouraria_GerarMovimentacao;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, General, ZAbstractRODataset, ZAbstractDataset, ZDataset, UZDataset, ZConnection, DB, DBCtrls, ExtCtrls, StdCtrls, dbcgrids,
  Mask, Buttons, ComCtrls, Main;

type
  Tfrm_Tesouraria_GerarMovimentacao = class(TForm)
    Bevel1: TBevel;
    Bevel2: TBevel;
    Bevel3: TBevel;
    Bevel4: TBevel;
    Label19: TLabel;
    Label20: TLabel;
    Bevel12: TBevel;
    Label21: TLabel;
    Label22: TLabel;
    Bevel13: TBevel;
    pgCompromisso: TPageControl;
    tsInfGerais: TTabSheet;
    Bevel5: TBevel;
    sbAvancar: TSpeedButton;
    sbCancelar: TSpeedButton;
    Label1: TLabel;
    Label2: TLabel;
    Label5: TLabel;
    Label10: TLabel;
    Label13: TLabel;
    Label18: TLabel;
    DBEdit2: TDBEdit;
    deMulta: TDBEdit;
    DBEdit8: TDBEdit;
    DBLookupComboBox1: TDBLookupComboBox;
    moObservacao: TMemo;
    deDescricao: TDBEdit;
    tsCaixa: TTabSheet;
    Bevel9: TBevel;
    sbAvancarCaixa: TSpeedButton;
    sbCancelarCaixa: TSpeedButton;
    Label14: TLabel;
    Bevel10: TBevel;
    Label15: TLabel;
    Label16: TLabel;
    Bevel11: TBevel;
    SpeedButton1: TSpeedButton;
    lbds_Caixa: TLabel;
    lbSaldoAtual: TLabel;
    Label17: TLabel;
    Label23: TLabel;
    Bevel14: TBevel;
    lbNovoSaldo: TLabel;
    sbVoltarCaixa: TSpeedButton;
    edCaixa: TEdit;
    DBRadioGroup1: TDBRadioGroup;
    DBEdit1: TDBEdit;
    tsPlanoContas: TTabSheet;
    Bevel6: TBevel;
    sbFinalizar: TSpeedButton;
    sbCancelarPlano: TSpeedButton;
    DBCtrlGrid1: TDBCtrlGrid;
    Label8: TLabel;
    Label9: TLabel;
    Label11: TLabel;
    dcxPlanoContas: TDBComboBox;
    dcxCentroCustos: TDBComboBox;
    Panel1: TPanel;
    Label12: TLabel;
    Bevel8: TBevel;
    DBText1: TDBText;
    Label24: TLabel;
    Bevel15: TBevel;
    DBText3: TDBText;
    qyPlanoContas: TUMZQuery;
    srcPlanoContas: TDataSource;
    qyMovimentacao: TUMZQuery;
    srcMovimentacao: TDataSource;
    updPlanoContas: TZUpdateSQL;
    qyMovimentacaocd_movimento_te: TIntegerField;
    qyMovimentacaocd_caixa: TIntegerField;
    qyMovimentacaodt_movimento: TDateTimeField;
    qyMovimentacaonr_sequencia: TIntegerField;
    qyMovimentacaocd_movimento: TIntegerField;
    qyMovimentacaonr_documento: TStringField;
    qyMovimentacaods_movimento: TStringField;
    qyMovimentacaods_observacao: TMemoField;
    qyMovimentacaotp_cheque_dinheiro: TStringField;
    qyMovimentacaovl_movimento: TFloatField;
    qyMovimentacaodt_liberacao: TDateTimeField;
    qyMovimentacaocd_origem: TIntegerField;
    qyPlanoContasnr_sequencia: TIntegerField;
    qyPlanoContascd_caixa: TIntegerField;
    qyPlanoContasdt_movimento: TDateTimeField;
    qyPlanoContascd_conta: TIntegerField;
    qyPlanoContascd_centro: TIntegerField;
    qyPlanoContasvl_movimento: TFloatField;
    qyPlanoContasds_conta: TStringField;
    qyPlanoContasds_centro: TStringField;
    Panel2: TPanel;
    sbIncluirPlano: TSpeedButton;
    DBEdit3: TDBEdit;
    procedure FormPaint(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure sbFinalizarClick(Sender: TObject);
    procedure sbAvancarClick(Sender: TObject);
    procedure SpeedButton1Click(Sender: TObject);
    procedure KeyPress(Sender: TObject; var Key: Char);
    procedure sbVoltarCaixaClick(Sender: TObject);
    procedure pgCompromissoChanging(Sender: TObject;
      var AllowChange: Boolean);
    procedure sbCancelarCaixaClick(Sender: TObject);
    procedure sbCancelarClick(Sender: TObject);
    procedure sbAvancarCaixaClick(Sender: TObject);
    procedure sbVoltarClick(Sender: TObject);
    procedure sbCancelarPlanoClick(Sender: TObject);
    procedure qyPlanoContasAfterInsert(DataSet: TDataSet);
    procedure qyPlanoContasAfterPost(DataSet: TDataSet);
    procedure sbIncluirPlanoClick(Sender: TObject);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure dcxPlanoContasChange(Sender: TObject);
    procedure dcxCentroCustosChange(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frm_Tesouraria_GerarMovimentacao: Tfrm_Tesouraria_GerarMovimentacao;
  cd_movimento_te, nr_sequencia: integer;
  total_informado : Real;
  finalizou: boolean;
  plano_contas: array of integer;
  plano_centro_custos: array of integer;

implementation

uses uDM, uSelCaixa, uTesouraria_Planilha;

{$R *.dfm}

procedure Tfrm_Tesouraria_GerarMovimentacao.FormPaint(Sender: TObject);
begin
  PapelParede(Sender);
end;

procedure Tfrm_Tesouraria_GerarMovimentacao.FormShow(Sender: TObject);
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

  { Montando o ComboBox de Planos de Contas }
  dcxPlanoContas.Items.Clear;
  dcxCentroCustos.Items.Clear;
  DM.qyAux1.Close;
  DM.qyAux1.SQL.Clear;
  DM.qyAux1.SQL.Add('SELECT * FROM plano_contas');
  DM.qyAux1.Open;

  n := 0;
  while not DM.qyAux1.Eof do
  begin
    SetLength(plano_contas,n+1);
    plano_contas[n] := DM.qyAux1.FieldByName('cd_conta').AsInteger;
    dcxPlanoContas.Items.Add(DM.qyAux1.FieldByName('ds_conta').AsString);

    n := n + 1;
    DM.qyAux1.Next;
  end;
  { / Montando o ComboBox de Planos de Contas }


  { Montando o ComboBox de Centros de Custos }
  DM.qyAux1.Close;
  DM.qyAux1.SQL.Clear;
  DM.qyAux1.SQL.Add('SELECT * FROM plano_centro_custos');
  DM.qyAux1.Open;

  n := 0;
  while not DM.qyAux1.Eof do
  begin
    SetLength(plano_centro_custos,n+1);
    plano_centro_custos[n] := DM.qyAux1.FieldByName('cd_centro').AsInteger;
    dcxCentroCustos.Items.Add(DM.qyAux1.FieldByName('ds_centro').AsString);

    n := n + 1;
    DM.qyAux1.Next;
  end;
  { / Montando o ComboBox de Centros de Custos }

  pgCompromisso.ActivePage := tsInfGerais;
  total_informado := 0;

  { Tipos de movimento }
  DM.qyTiposMovto3.Close;
  DM.qyTiposMovto3.ParamByName('cd_origem').AsInteger := 3;
  DM.qyTiposMovto3.Open;

  DBEdit8.SetFocus;
  qyMovimentacao.Open;
  qyMovimentacao.Insert;

  cd_movimento_te := DM.ProximoId('cd_movimento_te', 'fin_mov_tesouraria');

  qyMovimentacao.FieldByName('cd_movimento_te').AsInteger := cd_movimento_te;
  qyMovimentacao.FieldByName('dt_movimento').AsDateTime := DataHoje;
  qyMovimentacao.FieldByName('dt_liberacao').EditMask := '99/99/9999';
  qyMovimentacao.FieldByName('dt_liberacao').AsDateTime := DataHoje;
  qyMovimentacao.FieldByName('cd_origem').AsInteger := 3; // Tesouraria

end;

procedure Tfrm_Tesouraria_GerarMovimentacao.sbFinalizarClick(
  Sender: TObject);
begin
  if (dcxPlanoContas.Text = '') OR (dcxCentroCustos.Text = '') then
    qyPlanoContas.Cancel
  else
    qyPlanoContas.Post;

  DM.qyAux1.Close;
  DM.qyAux1.SQL.Clear;
  DM.qyAux1.SQL.Add('SELECT SUM(vl_movimento) AS total FROM apropriacao_te WHERE cd_caixa = :cd_caixa AND dt_movimento = :dt_movimento AND nr_sequencia = :nr_sequencia');
  DM.qyAux1.ParamByName('cd_caixa').AsInteger := qyMovimentacao.FieldByName('cd_caixa').AsInteger;
  DM.qyAux1.ParamByName('dt_movimento').AsString := FormatDateTime('yyyy-mm-dd', qyMovimentacao.FieldByName('dt_movimento').AsDateTime);
  DM.qyAux1.ParamByName('nr_sequencia').AsInteger := qyMovimentacao.FieldByName('nr_sequencia').AsInteger;
  DM.qyAux1.Open;

  if DM.qyAux1.FieldByName('total').AsFloat <> qyMovimentacao.FieldByName('vl_movimento').AsFloat then
  begin
    MessageDlg('O total dos valores informados nos Centros de Custos'+CHR(13)+'deve ser igual ao Valor da movimentação.', mtWarning, [mbOK], 0);
    Abort;
  end;

  { Verificando se é ENTRADA ou SAÍDA e atualizando o SALDO }
  DM.qyTiposMovto.Open;
  DM.qyTiposMovto.Locate('cd_movimento', qyMovimentacao.FieldByName('cd_movimento').AsInteger, []);

  if DM.qyTiposMovto.FieldByName('tp_entrada_saida').AsInteger = 1 then
    DM.AtualizaSaldo(qyMovimentacao.FieldByName('cd_caixa').AsInteger, qyMovimentacao.FieldByName('dt_movimento').AsDateTime, StrToFloat('-'+qyMovimentacao.FieldByName('vl_movimento').AsString))
  else
    DM.AtualizaSaldo(qyMovimentacao.FieldByName('cd_caixa').AsInteger, qyMovimentacao.FieldByName('dt_movimento').AsDateTime, qyMovimentacao.FieldByName('vl_movimento').AsFloat);
  { / Verificando se é ENTRADA ou SAÍDA e atualizando o SALDO }

  DM.gerar_log(2184,0,qyMovimentacao.FieldByName('cd_caixa').AsInteger, qyMovimentacao.FieldByName('nr_sequencia').AsInteger, qyMovimentacao.FieldByName('dt_movimento').AsDateTime);
  qyMovimentacao.Post;

  finalizou := true;
  Close;

end;

procedure Tfrm_Tesouraria_GerarMovimentacao.sbAvancarClick(
  Sender: TObject);
begin

  if moObservacao.Text <> '' then
      DM.RegistraObservacoes(qyMovimentacao.FieldByName('ds_observacao'), moObservacao.Text);

  moObservacao.ReadOnly := True;

  total_informado := qyMovimentacao.FieldByName('vl_movimento').AsFloat;
  pgCompromisso.ActivePage := tsCaixa;

end;

procedure Tfrm_Tesouraria_GerarMovimentacao.SpeedButton1Click(
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

    if frm_SelCaixa.qyCaixa.FieldByName('vl_saldo').AsFloat < qyMovimentacao.FieldByName('vl_movimento').AsFloat then
      MessageDlg('O saldo deste caixa é menor do que o valor necessário para baixar o compromisso.'+CHR(13)+'Devido a isso o saldo do caixa ficará negativo.', mtWarning, [mbOK], 0);

    edCaixa.Text := frm_SelCaixa.qyCaixa.FieldByName('cd_caixa').AsString;
    lbds_Caixa.Caption := frm_SelCaixa.qyCaixa.FieldByName('ds_caixa').AsString;
    lbSaldoAtual.Caption := frm_SelCaixa.qyCaixa.FieldByName('vl_saldo').AsString;

    { Verificando se é ENTRADA ou SAÍDA e atualizando o SALDO }
    DM.qyTiposMovto.Open;
    DM.qyTiposMovto.Locate('cd_movimento', qyMovimentacao.FieldByName('cd_movimento').AsInteger, []);

    if DM.qyTiposMovto.FieldByName('tp_entrada_saida').AsInteger = 1 then
      lbNovoSaldo.Caption := FloatToStr(frm_SelCaixa.qyCaixa.FieldByName('vl_saldo').AsFloat + qyMovimentacao.FieldByName('vl_movimento').AsFloat)
    else
      lbNovoSaldo.Caption := FloatToStr(frm_SelCaixa.qyCaixa.FieldByName('vl_saldo').AsFloat - qyMovimentacao.FieldByName('vl_movimento').AsFloat);
    { / Verificando se é ENTRADA ou SAÍDA e atualizando o SALDO }

  end;

end;

procedure Tfrm_Tesouraria_GerarMovimentacao.KeyPress(
  Sender: TObject; var Key: Char);
begin

  if key = #13 Then
  Begin
     SelectNext(Sender as TWinControl, True, True);
     Key := #0;
  End;

end;

procedure Tfrm_Tesouraria_GerarMovimentacao.sbVoltarCaixaClick(
  Sender: TObject);
begin
    pgCompromisso.ActivePage := tsInfGerais;
end;

procedure Tfrm_Tesouraria_GerarMovimentacao.pgCompromissoChanging(
  Sender: TObject; var AllowChange: Boolean);
begin
  AllowChange := False;
end;

procedure Tfrm_Tesouraria_GerarMovimentacao.sbCancelarCaixaClick(
  Sender: TObject);
begin
  Close;
end;

procedure Tfrm_Tesouraria_GerarMovimentacao.sbCancelarClick(
  Sender: TObject);
begin
  Close;
end;

procedure Tfrm_Tesouraria_GerarMovimentacao.sbAvancarCaixaClick(
  Sender: TObject);
begin

  pgCompromisso.ActivePage := tsPlanoContas;
  frm_Tesouraria_GerarMovimentacao.Cursor := crHourGlass;
  qyMovimentacao.FieldByName('cd_caixa').AsInteger := StrToInt(edCaixa.Text);
  nr_sequencia := DM.ProximoId3('nr_sequencia', 'cd_caixa', 'dt_movimento', 'fin_mov_tesouraria', edCaixa.Text, FormatDateTime('yyyy-mm-dd', qyMovimentacao.FieldByName('dt_movimento').AsDateTime));
  qyMovimentacao.FieldByName('nr_sequencia').AsInteger := nr_sequencia;

  DM.qyAux2.Close;
  DM.qyAux2.SQL.Clear;
  DM.qyAux2.SQL.Add('SELECT cd_movimento_caixa FROM tipos_movimento WHERE cd_movimento = :cd_movimento');
  DM.qyAux2.ParamByName('cd_movimento').AsInteger := qyMovimentacao.FieldByName('cd_movimento').AsInteger;
  DM.qyAux2.Open;

  qyPlanoContas.Close;
  qyPlanoContas.ParamByName('cd_caixa').AsInteger := qyMovimentacao.FieldByName('cd_caixa').AsInteger;
  qyPlanoContas.ParamByName('dt_movimento').AsString := FormatDateTime('yyyy-mm-dd', qyMovimentacao.FieldByName('dt_movimento').AsDateTime);
  qyPlanoContas.ParamByName('nr_sequencia').AsInteger := nr_sequencia;
  qyPlanoContas.Prepare;
  qyPlanoContas.Open;
  dcxPlanoContas.SetFocus;
  qyPlanoContas.Insert;

  frm_Tesouraria_GerarMovimentacao.Cursor := crDefault;

end;

procedure Tfrm_Tesouraria_GerarMovimentacao.sbVoltarClick(Sender: TObject);
begin
    pgCompromisso.ActivePage := tsCaixa;
end;

procedure Tfrm_Tesouraria_GerarMovimentacao.sbCancelarPlanoClick(
  Sender: TObject);
begin
  Close;
end;

procedure Tfrm_Tesouraria_GerarMovimentacao.qyPlanoContasAfterInsert(
  DataSet: TDataSet);
begin
  DM.qyAux2.Close;
  DM.qyAux2.SQL.Clear;
  DM.qyAux2.SQL.Add('INSERT INTO apropriacao_te(cd_caixa,dt_movimento,nr_sequencia,cd_conta,cd_centro,vl_movimento) VALUES(:cd_caixa,:dt_movimento,:nr_sequencia,:cd_conta,:cd_centro,:vl_movimento)');
  DM.qyAux2.ParamByName('cd_caixa').AsInteger := qyMovimentacao.FieldByName('cd_caixa').AsInteger;
  DM.qyAux2.ParamByName('dt_movimento').AsString := FormatDateTime('yyyy-mm-dd', qyMovimentacao.FieldByName('dt_movimento').AsDateTime);
  DM.qyAux2.ParamByName('nr_sequencia').AsInteger := qyMovimentacao.FieldByName('nr_sequencia').AsInteger;
  DM.qyAux2.ParamByName('vl_movimento').AsFloat := qyMovimentacao.FieldByName('vl_movimento').AsFloat - total_informado;

  qyPlanoContas.FieldByName('vl_movimento').AsFloat := qyMovimentacao.FieldByName('vl_movimento').AsFloat - total_informado;
end;

procedure Tfrm_Tesouraria_GerarMovimentacao.qyPlanoContasAfterPost(
  DataSet: TDataSet);
begin
  total_informado := total_informado + qyPlanoContas.FieldByName('vl_movimento').AsFloat;
//  qyPlanoContas.ApplyUpdates;
  DM.qyAux2.ParamByName('vl_movimento').AsFloat := qyPlanoContas.FieldByName('vl_movimento').AsFloat;
  DM.qyAux2.ExecSQL;
  qyPlanoContas.Close;
  qyPlanoContas.ParamByName('cd_caixa').AsInteger := qyMovimentacao.FieldByName('cd_caixa').AsInteger;
  qyPlanoContas.ParamByName('dt_movimento').AsString := FormatDateTime('yyyy-mm-dd', qyMovimentacao.FieldByName('dt_movimento').AsDateTime);
  qyPlanoContas.ParamByName('nr_sequencia').AsInteger := qyMovimentacao.FieldByName('nr_sequencia').AsInteger;
  qyPlanoContas.Open;
  qyPlanoContas.First;
end;

procedure Tfrm_Tesouraria_GerarMovimentacao.sbIncluirPlanoClick(
  Sender: TObject);
begin
  try
    qyPlanoContas.Post;
  except
  end;

  qyPlanoContas.Insert;
end;

procedure Tfrm_Tesouraria_GerarMovimentacao.FormCloseQuery(Sender: TObject;
  var CanClose: Boolean);
begin

  if not finalizou then
  begin

    DM.qyAux2.Close;
    DM.qyAux2.SQL.Clear;
    DM.qyAux2.SQL.Add('DELETE FROM apropriacao_te WHERE cd_caixa = :cd_caixa AND dt_movimento = :dt_movimento AND nr_sequencia = :nr_sequencia');
    DM.qyAux2.ParamByName('cd_caixa').AsInteger := qyMovimentacao.FieldByName('cd_caixa').AsInteger;
    DM.qyAux2.ParamByName('dt_movimento').AsString := FormatDateTime('yyyy-mm-dd', qyMovimentacao.FieldByName('dt_movimento').AsDateTime);
    DM.qyAux2.ParamByName('nr_sequencia').AsInteger := qyMovimentacao.FieldByName('nr_sequencia').AsInteger;
    DM.qyAux2.ExecSQL;

    qyMovimentacao.Cancel;

  end;

  frm_Tesouraria_Planilha.Filtra;

end;

procedure Tfrm_Tesouraria_GerarMovimentacao.FormKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
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
        VK_F6 : sbFinalizarClick( nil );
        VK_ADD : sbIncluirPlanoClick( nil );
      end;
    end;

  end;

end;

procedure Tfrm_Tesouraria_GerarMovimentacao.dcxPlanoContasChange(
  Sender: TObject);
begin
  DM.qyAux2.ParamByName('cd_conta').AsInteger := plano_contas[dcxPlanoContas.ItemIndex];
end;

procedure Tfrm_Tesouraria_GerarMovimentacao.dcxCentroCustosChange(
  Sender: TObject);
begin
  DM.qyAux2.ParamByName('cd_centro').AsInteger := plano_centro_custos[dcxCentroCustos.ItemIndex];
end;

end.

