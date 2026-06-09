unit uFiltroControleCartao;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, StdCtrls, UMComboBox, UMEditMonetario, ComCtrls, Buttons,
  uFSelecionarPessoa, DB, ZAbstractRODataset, ZAbstractDataset, UZDataset,
  uDM, uItemCombo;

type
  TfrmFiltroControleCartao = class(TForm)
    Panel1: TPanel;
    Label1: TLabel;
    pnRemessaTit: TPanel;
    Label2: TLabel;
    edAluno: TEdit;
    Label3: TLabel;
    Label4: TLabel;
    cbAdministradora: TUMComboBox;
    Label5: TLabel;
    Label6: TLabel;
    chbMaior: TCheckBox;
    edValorMaior: TUMEditMonetario;
    chbMenor: TCheckBox;
    edValorMenor: TUMEditMonetario;
    Label7: TLabel;
    CheckBox3: TCheckBox;
    CheckBox4: TCheckBox;
    dtpDePrevisao: TDateTimePicker;
    dtpAtePrevisao: TDateTimePicker;
    chbDe: TCheckBox;
    chbAte: TCheckBox;
    Label8: TLabel;
    Label9: TLabel;
    cbContas: TUMComboBox;
    Panel2: TPanel;
    btnFiltrar: TSpeedButton;
    btnCancelar: TSpeedButton;
    cbSituacoes: TComboBox;
    sbPessoas: TSpeedButton;
    sbLimparPessoas: TSpeedButton;
    sbLimparFiltros: TSpeedButton;
    cbDebito: TCheckBox;
    cbCredito: TCheckBox;
    procedure sbLimparFiltrosClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure chbMenorClick(Sender: TObject);
    procedure chbMaiorClick(Sender: TObject);
    procedure btnFiltrarClick(Sender: TObject);
    procedure sbLimparPessoasClick(Sender: TObject);
    procedure sbPessoasClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure btnCancelarClick(Sender: TObject);
  private
    Filtrou: Boolean;
    carregouConta, carregouDatas, carregouAdministradora: Boolean;
    
    procedure carregaContas();
    procedure carregaDatas();
    procedure carregaAdministradoras();

    function getSQLOtimizadoBusca(): String;
    function getFiltrosBusca(SQLOtimizado: String): String;
  public
    SQLFiltro: String;

    function filtraParcelas(): Boolean;
  end;

var
  frmFiltroControleCartao: TfrmFiltroControleCartao;

implementation

{$R *.dfm}

procedure TfrmFiltroControleCartao.btnCancelarClick(Sender: TObject);
begin
   Filtrou := False;

   Self.Close;
end;

procedure TfrmFiltroControleCartao.btnFiltrarClick(Sender: TObject);
begin
   edAluno.SetFocus;

   SQLFiltro := getFiltrosBusca(getSQLOtimizadoBusca());

   Filtrou := True;
   
   Self.Close;
end;

procedure TfrmFiltroControleCartao.carregaAdministradoras;
const
   SQL_ADMINISTRADORAS =
      ' SELECT '+
      '     cd_admin_cartao, '+
      '     ds_nome '+
      '  FROM '+
      '     fin_cadastro_admin_cartao ';
var
   qyAdministradoras: TUMZQuery;
begin
   cbAdministradora.Items.Clear;

   DM.CriarConsulta(qyAdministradoras);

   qyAdministradoras.SQL.Text := SQL_ADMINISTRADORAS;
   qyAdministradoras.Open;

   cbAdministradora.Items.AddObject(
      'Selecione',
      TItemCombo.Create(
         '-1',
         'Selecione'
      )
   );

   while not qyAdministradoras.Eof do
   begin
      cbAdministradora.Items.AddObject(
         qyAdministradoras.FieldByName('ds_nome').AsString,
         TItemCombo.Create(
            qyAdministradoras.FieldByName('cd_admin_cartao').AsString,
            qyAdministradoras.FieldByName('ds_nome').AsString
         )
      );

      qyAdministradoras.Next;
   end;

   cbAdministradora.ItemIndex := 0;
   carregouAdministradora := True;
end;

procedure TfrmFiltroControleCartao.carregaContas;
var
   qyContas: TUMZReadOnlyQuery;
begin
   cbContas.Items.Clear;

   DM.CriarConsulta(qyContas);

   qyContas.Close();
   qyContas.SQL.Clear;
   qyContas.SQL.Add('SELECT                                                               ');
   qyContas.SQL.Add(' cc.cd_caixa, cc.ds_caixa                                            ');
   qyContas.SQL.Add('FROM                                                                 ');
   qyContas.SQL.Add(' fin_cadastro_contas cc                                              ');
   qyContas.SQL.Add(' INNER JOIN fin_contas_usuarios u ON (cc.cd_caixa = u.cd_caixa ) AND ');
   qyContas.SQL.Add('    (cc.CD_COLIGADA = u.CD_COLIGADA)                                 ');
   qyContas.SQL.Add('WHERE                                                                ');
   qyContas.SQL.Add(' cc.sn_ativa = ''S''                                                 ');
   qyContas.SQL.Add(
      Format( ' AND ( cc.cd_coligada IN (%s) OR cc.sn_todas_coligadas = 1) ',
         [DM.UsuarioLogado.GetColigadasFilhaSelecionada()])                               );
   qyContas.SQL.Add(' AND u.cd_usuario = ' + IntToStr(DM.GetUsuarioLogado.Pessoa.Codigo)  );
   qyContas.SQL.Add(' ORDER BY cc.ds_caixa                                                ');
   qyContas.Open();

   cbContas.Items.AddObject(
      'Selecione',
      TItemCombo.Create(
         '-1',
         'Selecione'
      )
   );

   while not qyContas.Eof do
   begin
      cbContas.Items.AddObject(
         qyContas.FieldByName('ds_caixa').AsString,
         TItemCombo.Create(
            qyContas.FieldByName('cd_caixa').AsString,
            qyContas.FieldByName('ds_caixa').AsString
         )
      );

      qyContas.Next;
   end;

   cbContas.ItemIndex := 0;
   carregouConta := True;
end;

procedure TfrmFiltroControleCartao.carregaDatas;
begin
   dtpDePrevisao.Date := Date;
   dtpAtePrevisao.Date := Date;
   
   carregouDatas := True;
end;

procedure TfrmFiltroControleCartao.chbMaiorClick(Sender: TObject);
begin
   if edValorMaior.getValorDouble = 0 then
   begin
      edValorMaior.setValorDouble('0');
   end;
end;

procedure TfrmFiltroControleCartao.chbMenorClick(Sender: TObject);
begin
   if edValorMenor.getValorDouble = 0 then
   begin
      edValorMenor.setValorDouble('0');
   end;
end;

function TfrmFiltroControleCartao.filtraParcelas: Boolean;
begin
   Self.ShowModal;

   Result := Filtrou;
end;

procedure TfrmFiltroControleCartao.FormCreate(Sender: TObject);
begin
   carregouConta := False;
   carregouDatas := False;
   carregouAdministradora := False;
end;

procedure TfrmFiltroControleCartao.FormShow(Sender: TObject);
begin
   if not(carregouConta) then carregaContas;
   if not(carregouAdministradora) then carregaAdministradoras;
   if not(carregouDatas) then carregaDatas;
end;

function TfrmFiltroControleCartao.getFiltrosBusca(SQLOtimizado: String): String;
begin
   SQLOtimizado := SQLOtimizado + ' WHERE (1 = 1) ';

   if sbPessoas.Tag > 0  then
   begin
      SQLOtimizado := SQLOtimizado + ' AND (m.codigoaluno = :codigoaluno) ';
      SQLOtimizado := StringReplace(SQLOtimizado, ':codigoaluno', IntToStr(sbPessoas.Tag), [rfReplaceAll, rfIgnoreCase]);
   end;

   if cbAdministradora.ItemIndex > 0  then
   begin
      SQLOtimizado := SQLOtimizado + ' AND (fcac.cd_admin_cartao = :cd_admin_cartao) ';
      SQLOtimizado := StringReplace(
                         SQLOtimizado,
                         ':cd_admin_cartao',
                         TItemCombo(cbAdministradora.Items.Objects[cbAdministradora.ItemIndex]).getCodigo,
                         [rfReplaceAll, rfIgnoreCase]
                      );
   end;

   if not(cbCredito.Checked and cbDebito.Checked) then
   begin
      if cbCredito.Checked then
      begin
         SQLOtimizado := SQLOtimizado + ' AND (fco.sn_credito = 1) ';
      end;

      if cbDebito.Checked then
      begin
         SQLOtimizado := SQLOtimizado + ' AND (fco.sn_credito = 0) ';
      end;
   end;

   if chbMaior.Checked then
   begin
      SQLOtimizado := SQLOtimizado + ' AND (fcp.vl_valor_parcela >= :vl_valor_parcela) ';
      SQLOtimizado := StringReplace(SQLOtimizado, ':vl_valor_parcela', edValorMaior.getValorString, [rfReplaceAll, rfIgnoreCase]);
   end;

   if chbMenor.Checked then
   begin
      SQLOtimizado := SQLOtimizado + ' AND (fcp.vl_valor_parcela <= :vl_valor_parcela) ';
      SQLOtimizado := StringReplace(SQLOtimizado, ':vl_valor_parcela', edValorMenor.getValorString, [rfReplaceAll, rfIgnoreCase]);
   end;

   if chbDe.Checked then
   begin
      SQLOtimizado := SQLOtimizado + ' AND (fcp.dt_vencimento >= :dt_vencimento) ';
      SQLOtimizado := StringReplace(SQLOtimizado, ':dt_vencimento', QuotedStr(FormatDateTime('yyyy-mm-dd', dtpDePrevisao.Date)), [rfReplaceAll, rfIgnoreCase]);
   end;

   if chbAte.Checked then
   begin
      SQLOtimizado := SQLOtimizado + ' AND (fcp.dt_vencimento <= :dt_vencimento) ';
      SQLOtimizado := StringReplace(SQLOtimizado, ':dt_vencimento', QuotedStr(FormatDateTime('yyyy-mm-dd', dtpAtePrevisao.Date)), [rfReplaceAll, rfIgnoreCase]);
   end;

   if cbSituacoes.ItemIndex = 1 then
   begin
      SQLOtimizado := SQLOtimizado + ' AND (fcp.sn_liquidado = 0) ';
   end;

   if cbSituacoes.ItemIndex = 2 then
   begin
      SQLOtimizado := SQLOtimizado + ' AND (fcp.sn_liquidado = 1) ';
   end;

   if cbContas.ItemIndex > 0 then
   begin
      SQLOtimizado := SQLOtimizado + ' AND (fco.cd_caixa = :cd_caixa) ';
      SQLOtimizado := StringReplace(
                         SQLOtimizado,
                         ':cd_caixa',
                         TItemCombo(cbContas.Items.Objects[cbContas.ItemIndex]).getCodigo,
                         [rfReplaceAll, rfIgnoreCase]
                      );         
   end;

   Result := SQLOtimizado;
   Result := Result + ' ) AS parcelas ';
end;

function TfrmFiltroControleCartao.getSQLOtimizadoBusca: String;
const
   SQL_CAMPOS =
      ' fcac.ds_nome, '+
      ' IF(fco.sn_credito = 1, ''Crédito'', ''Débito'') AS tipo_operacao, '+
      ' fcp.nr_parcela, '+
      ' fcp.dt_vencimento, '+
      ' IF(fcp.sn_liquidado = 1, ''Recebido'', ''Aguardando Recebimento'') AS situacao, '+
      ' fcp.vl_valor_parcela AS vl_parcela, '+
      ' fco.nr_taxa, '+
      ' ROUND((ROUND((fco.nr_taxa * fcp.vl_valor_parcela), 2) / 100), 2) AS tarifa, '+
      ' ROUND(fcp.vl_valor_parcela - ROUND((ROUND((fco.nr_taxa * fcp.vl_valor_parcela), 2) / 100), 2),2) AS valor_liquido, '+
      ' fcc.ds_caixa, '+
      ' fco.cd_operacao, '+
      ' fcp.cd_parcela, '+
      ' fcac.cd_admin_cartao, '+
      ' fco.sn_credito, '+
      ' fcp.sn_liquidado ';

   SQL_BASE =
      '   SELECT '+
	   '     * '+
      '   FROM '+
	   '   (  '+
      ' SELECT '+
      '   %s '+
      ' FROM '+
      '   fin_cartao_parcelas fcp '+
      ' INNER JOIN fin_cartao_operacao fco ON( '+
      '    fco.cd_operacao = fcp.cd_operacao '+
      ' ) '+
      ' INNER JOIN fin_cadastro_contas fcc ON ( '+
      '    fcc.cd_caixa = fcp.cd_caixa_atual '+
      ' ) '+
      ' INNER JOIN fin_cadastro_admin_cartao fcac ON ( '+
      '    fcac.cd_admin_cartao = fco.cd_admin_cartao '+
      ' ) ';

   SQL_BUSCA_ALUNO =
      ' INNER JOIN fin_cartao_mensalidades fcm ON ( '+
      '    fcm.cd_operacao = fco.cd_operacao '+
      ' ) '+
      ' INNER JOIN mensalidades m ON ( '+
      '    m.cd_mensalidade = fcm.cd_mensalidade '+
      ' ) ';
begin
   Result := Format(SQL_BASE, [SQL_CAMPOS]);

   if sbPessoas.Tag > 0 then
   begin
      Result := Result + ' ' + SQL_BUSCA_ALUNO;
   end;
end;

procedure TfrmFiltroControleCartao.sbLimparPessoasClick(Sender: TObject);
begin
   sbPessoas.Tag := -1;
   edAluno.Text := '';
end;

procedure TfrmFiltroControleCartao.sbPessoasClick(Sender: TObject);
var
   resultado_filtro: TResultadoFiltroPessoa;
begin
   sbPessoas.Tag := -1;
   edAluno.Text := '';

   resultado_filtro := TfrmSelecionarPessoa.Filtrar([], afpEstudante);

   if resultado_filtro.filtrado then
   Begin
      edAluno.Text := resultado_filtro.nm_pessoa;
      sbPessoas.Tag := resultado_filtro.cd_pessoa;
   end;
end;

procedure TfrmFiltroControleCartao.sbLimparFiltrosClick(Sender: TObject);
begin
   sbPessoas.Tag := -1;
   edAluno.Text := '';
   cbAdministradora.ItemIndex := -1;
   cbDebito.Checked := False;
   cbCredito.Checked := False;
   chbMaior.Checked := False;
   edValorMaior.setValorDouble('0');
   chbMenor.Checked := False;
   edValorMenor.setValorDouble('0');
   chbDe.Checked := False;
   dtpDePrevisao.Date := Date;
   chbAte.Checked := False;
   dtpAtePrevisao.Date := Date;
   cbSituacoes.ItemIndex := -1;
   cbContas.ItemIndex := -1;
end;

end.
