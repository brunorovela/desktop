unit uAdministradoraCartao;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, Grids, DBGrids, StdCtrls, DB, ZAbstractRODataset,
  ZAbstractDataset, UZDataset, uDM, Mask, DBCtrls, UMComboBox, Buttons,
  ComCtrls, ToolWin, ImgList, uUsuario, uItemCombo, General, uTaxaAdministradora;

type
  TfrmAdministradoraCartao = class(TForm)
    Panel1: TPanel;
    Panel2: TPanel;
    Panel3: TPanel;
    Panel4: TPanel;
    DBGrid1: TDBGrid;
    Panel5: TPanel;
    qryAdministradoraCartao: TUMZQuery;
    dsAdministradoraCartao: TDataSource;
    qryAdministradoraCartaocd_admin_cartao: TIntegerField;
    qryAdministradoraCartaods_nome: TStringField;
    qryAdministradoraCartaonr_dia_vencimento_credito: TIntegerField;
    qryAdministradoraCartaonr_dia_vencimento_debito: TIntegerField;
    qryAdministradoraCartaocd_conta_credito: TIntegerField;
    qryAdministradoraCartaocd_conta_debito: TIntegerField;
    Label5: TLabel;
    qryAdministradoraCartaosn_ativo: TSmallintField;
    qryTaxasCredito: TUMZQuery;
    dsTaxasCredito: TDataSource;
    qryAdministradoraCartaocd_conta_baixa_credito: TIntegerField;
    qryAdministradoraCartaocd_conta_baixa_debito: TIntegerField;
    SpeedButton1: TSpeedButton;
    pnTaxas: TPanel;
    DBGrid2: TDBGrid;
    sbTaxaMenos: TSpeedButton;
    sbTaxaMais: TSpeedButton;
    toolPessoa: TToolBar;
    ToolButton1: TToolButton;
    btnInserir: TToolButton;
    btnAlterar: TToolButton;
    btnExcluir: TToolButton;
    ToolButton4: TToolButton;
    btnSalvar: TToolButton;
    btnCancelar: TToolButton;
    ToolButton8: TToolButton;
    btnFechar: TToolButton;
    ToolButton2: TToolButton;
    ilBotoes: TImageList;
    Label10: TLabel;
    Panel7: TPanel;
    Label1: TLabel;
    dbeNomeAdministradora: TDBEdit;
    Label2: TLabel;
    cbCreditosReceber: TUMComboBox;
    Label3: TLabel;
    cbDebitosReceber: TUMComboBox;
    Label4: TLabel;
    cbCreditosRecebidos: TUMComboBox;
    Label6: TLabel;
    cbDebitosRecebidos: TUMComboBox;
    Label7: TLabel;
    dbeVencCredito: TDBEdit;
    Label8: TLabel;
    dbeVencDebito: TDBEdit;
    Label9: TLabel;
    dbeTaxaDebito: TDBEdit;
    DBCheckBox1: TDBCheckBox;
    qryTaxasCreditocd_admin_cartao: TIntegerField;
    qryTaxasCreditovl_taxa: TFloatField;
    qryTaxasCreditovl_valor: TIntegerField;
    qryAdministradoraCartaonr_taxa_debito: TFloatField;
    Label11: TLabel;
    Label12: TLabel;
    dbeVL_min_operacao: TDBEdit;
    qryAdministradoraCartaovl_min_operacao: TFloatField;

    procedure qryAdministradoraCartaoAfterInsert(DataSet: TDataSet);
    procedure qryAdministradoraCartaoAfterOpen(DataSet: TDataSet);
    procedure qryTaxasCreditovl_valorGetText(Sender: TField; var Text: string;
      DisplayText: Boolean);
    procedure FormDestroy(Sender: TObject);
    procedure sbTaxaMenosClick(Sender: TObject);
    procedure sbTaxaMaisClick(Sender: TObject);
    procedure dbeTaxaDebitoExit(Sender: TObject);
    procedure dbeVencDebitoExit(Sender: TObject);
    procedure dbeVencDebitoKeyPress(Sender: TObject; var Key: Char);
    procedure dbeVencCreditoExit(Sender: TObject);
    procedure dbeVencCreditoKeyPress(Sender: TObject; var Key: Char);
    procedure dsAdministradoraCartaoDataChange(Sender: TObject; Field: TField);
    procedure dsAdministradoraCartaoStateChange(Sender: TObject);
    procedure cbDebitosRecebidosChange(Sender: TObject);
    procedure cbCreditosRecebidosChange(Sender: TObject);
    procedure cbDebitosReceberChange(Sender: TObject);
    procedure cbCreditosReceberChange(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure qryAdministradoraCartaoBeforeDelete(DataSet: TDataSet);
    procedure qryAdministradoraCartaoBeforeEdit(DataSet: TDataSet);
    procedure qryAdministradoraCartaoBeforeInsert(DataSet: TDataSet);
    procedure btnFecharClick(Sender: TObject);
    procedure btnCancelarClick(Sender: TObject);
    procedure btnSalvarClick(Sender: TObject);
    procedure btnExcluirClick(Sender: TObject);
    procedure btnAlterarClick(Sender: TObject);
    procedure btnInserirClick(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    function getAdministradoraJson: String;
    procedure carregaContas();
    procedure reloadTaxas();
    procedure deleteTaxa(cd_admin_cartao: Integer; vl_valor: Integer = -1);
    procedure corrigeCombos(combo: TUMComboBox; nmCampo: String);
    procedure validaCodigosContas();

    function isExclusaoValida(): Boolean;
    function getChaveOperacao(): String;
    function isFormularioValido(): Boolean;
  public
    { Public declarations }
  end;

var
  frmAdministradoraCartao: TfrmAdministradoraCartao;

implementation

{$R *.dfm}

procedure TfrmAdministradoraCartao.btnAlterarClick(Sender: TObject);
begin
   qryAdministradoraCartao.Edit;
end;

procedure TfrmAdministradoraCartao.btnCancelarClick(Sender: TObject);
begin
   qryAdministradoraCartao.Cancel;
end;

procedure TfrmAdministradoraCartao.btnExcluirClick(Sender: TObject);
begin
   if qryAdministradoraCartao.RecordCount = 0 then Exit;
   if not(isExclusaoValida) then Exit;

   if Mensagem('Tem certeza que deseja excluir esta administradora?', 'Aviso', MB_YESNO + MB_ICONWARNING) = mrYes then
   begin
      DM.setLog(
         123654,
         'Exclusão',
         'Exclusão',
         0,
         DM.getQueryJson(qryAdministradoraCartao)
      );

      deleteTaxa(
         qryAdministradoraCartaocd_admin_cartao.AsInteger
      );

      qryAdministradoraCartao.Delete;
   end;
end;

procedure TfrmAdministradoraCartao.btnFecharClick(Sender: TObject);
begin
   Self.Close;
end;

procedure TfrmAdministradoraCartao.btnInserirClick(Sender: TObject);
begin
   qryAdministradoraCartao.Insert;
   dbeNomeAdministradora.SetFocus;
end;

procedure TfrmAdministradoraCartao.btnSalvarClick(Sender: TObject);
begin
   if isFormularioValido then
   begin
      DM.setLog(
         123654,
         Self.getChaveOperacao,
         Self.getChaveOperacao,
         0,
         DM.getQueryJson(qryAdministradoraCartao)
      );

      qryAdministradoraCartao.Post;

      qryAdministradoraCartao.Close;
      qryAdministradoraCartao.Open;
   end;
end;

procedure TfrmAdministradoraCartao.carregaContas;
var
   qyContas: TUMZReadOnlyQuery;
   itemCombo: TItemCombo;
begin
   cbCreditosReceber.Items.Clear;
   cbDebitosReceber.Items.Clear;
   cbCreditosRecebidos.Items.Clear;
   cbDebitosRecebidos.Items.Clear;

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

   cbCreditosReceber.Items.AddObject(
      'Selecione',
      TItemCombo.Create(
         '-1',
         'Selecione'
      )
   );

   cbDebitosReceber.Items.AddObject(
      'Selecione',
      TItemCombo.Create(
         '-1',
         'Selecione'
      )
   );

   cbCreditosRecebidos.Items.AddObject(
      'Selecione',
      TItemCombo.Create(
         '-1',
         'Selecione'
      )
   );

   cbDebitosRecebidos.Items.AddObject(
      'Selecione',
      TItemCombo.Create(
         '-1',
         'Selecione'
      )
   );

   while not qyContas.Eof do
   begin
      cbCreditosReceber.Items.AddObject(
         qyContas.FieldByName('ds_caixa').AsString,
         TItemCombo.Create(
            qyContas.FieldByName('cd_caixa').AsString,
            qyContas.FieldByName('ds_caixa').AsString
         )
      );

      cbDebitosReceber.Items.AddObject(
         qyContas.FieldByName('ds_caixa').AsString,
         TItemCombo.Create(
            qyContas.FieldByName('cd_caixa').AsString,
            qyContas.FieldByName('ds_caixa').AsString
         )
      );

      cbCreditosRecebidos.Items.AddObject(
         qyContas.FieldByName('ds_caixa').AsString,
         TItemCombo.Create(
            qyContas.FieldByName('cd_caixa').AsString,
            qyContas.FieldByName('ds_caixa').AsString
         )
      );

      cbDebitosRecebidos.Items.AddObject(
         qyContas.FieldByName('ds_caixa').AsString,
         TItemCombo.Create(
            qyContas.FieldByName('cd_caixa').AsString,
            qyContas.FieldByName('ds_caixa').AsString
         )
      );

      qyContas.Next;
   end;
end;

procedure TfrmAdministradoraCartao.cbCreditosReceberChange(Sender: TObject);
begin
   if StrToInt(TItemCombo(cbCreditosReceber.Items.Objects[cbCreditosReceber.ItemIndex]).codigo) = -1 then
   begin
      qryAdministradoraCartaocd_conta_credito.Clear;
      Exit;
   end;

   qryAdministradoraCartaocd_conta_credito.AsInteger :=
      StrToInt(TItemCombo(cbCreditosReceber.Items.Objects[cbCreditosReceber.ItemIndex]).codigo);
end;

procedure TfrmAdministradoraCartao.cbCreditosRecebidosChange(Sender: TObject);
begin
   if StrToInt(TItemCombo(cbCreditosRecebidos.Items.Objects[cbCreditosRecebidos.ItemIndex]).codigo) = -1 then
   begin
      qryAdministradoraCartaocd_conta_baixa_credito.Clear;
      Exit;
   end;

   qryAdministradoraCartaocd_conta_baixa_credito.AsInteger :=
      StrToInt(TItemCombo(cbCreditosRecebidos.Items.Objects[cbCreditosRecebidos.ItemIndex]).codigo);
end;

procedure TfrmAdministradoraCartao.cbDebitosReceberChange(Sender: TObject);
begin
   if StrToInt(TItemCombo(cbDebitosReceber.Items.Objects[cbDebitosReceber.ItemIndex]).codigo) = -1 then
   begin
      qryAdministradoraCartaocd_conta_debito.Clear;
      Exit;
   end;

   qryAdministradoraCartaocd_conta_debito.AsInteger :=
      StrToInt(TItemCombo(cbDebitosReceber.Items.Objects[cbDebitosReceber.ItemIndex]).codigo);
end;

procedure TfrmAdministradoraCartao.cbDebitosRecebidosChange(Sender: TObject);
begin
   if StrToInt(TItemCombo(cbDebitosRecebidos.Items.Objects[cbDebitosRecebidos.ItemIndex]).codigo) = -1 then
   begin
      qryAdministradoraCartaocd_conta_baixa_debito.Clear;
      Exit;
   end;

   qryAdministradoraCartaocd_conta_baixa_debito.AsInteger :=
      StrToInt(TItemCombo(cbDebitosRecebidos.Items.Objects[cbDebitosRecebidos.ItemIndex]).codigo);
end;

procedure TfrmAdministradoraCartao.corrigeCombos(combo: TUMComboBox; nmCampo: String);
var
   i,
   regSelecionado,
   comboIndexSelecionar: Integer;
begin
   comboIndexSelecionar := -1;

   regSelecionado := qryAdministradoraCartao.FieldByName(nmCampo).AsInteger;

   for I := 0 to combo.Items.Count - 1 do
   begin
      if StrToInt(TItemCombo(combo.Items.Objects[i]).codigo) = regSelecionado then
      begin
         comboIndexSelecionar := i;
      end;
   end;

   combo.ItemIndex := comboIndexSelecionar;
end;

procedure TfrmAdministradoraCartao.dbeTaxaDebitoExit(Sender: TObject);
begin
   if qryAdministradoraCartaonr_taxa_debito.AsFloat < 0 then
   begin
      Mensagem('Você não pode informar uma valor de taxa para débito negativo.', 'Aviso', MB_OK + MB_ICONWARNING);
   end;
end;

procedure TfrmAdministradoraCartao.dbeVencCreditoExit(Sender: TObject);
begin
   if qryAdministradoraCartaonr_dia_vencimento_credito.AsInteger > 31 then
   begin
      Mensagem('Você deve informar um valor de no máximo trinta e um (31) para dias de vencimento.', 'Aviso', MB_OK + MB_ICONWARNING);

      dbeVencCredito.SetFocus;
   end;
end;

procedure TfrmAdministradoraCartao.dbeVencCreditoKeyPress(Sender: TObject;
  var Key: Char);
begin
   if not (key in ['0'..'9',#8,#9])then
   begin
      Key := #0;
   end;
end;

procedure TfrmAdministradoraCartao.dbeVencDebitoExit(Sender: TObject);
begin
   if qryAdministradoraCartaonr_dia_vencimento_debito.AsInteger > 31 then
   begin
      Mensagem('Você deve informar um valor de no máximo trinta e um (31) para dias de vencimento.', 'Aviso', MB_OK + MB_ICONWARNING);

      dbeVencDebito.SetFocus;
   end;
end;

procedure TfrmAdministradoraCartao.dbeVencDebitoKeyPress(Sender: TObject;
  var Key: Char);
begin
   if not (key in ['0'..'9',#8,#9])then
   begin
      Key := #0;
   end;
end;

procedure TfrmAdministradoraCartao.deleteTaxa(cd_admin_cartao: Integer; vl_valor: Integer = -1);
const
   SQL_DELETE_TAXA =
      'DELETE FROM fin_cartao_taxas_credito WHERE ' +
      ' cd_admin_cartao = :cd_admin_cartao ';
var
   qyDeleteTaxa: TUMZQuery;
begin
   DM.CriarConsulta(qyDeleteTaxa);

   qyDeleteTaxa.SQL.Text := SQL_DELETE_TAXA;
   qyDeleteTaxa.ParamByName('cd_admin_cartao').AsInteger :=
      qryAdministradoraCartaocd_admin_cartao.AsInteger;

   if vl_valor <> -1 then
   begin
      qyDeleteTaxa.SQL.Add(' AND vl_valor = :vl_valor ');
      qyDeleteTaxa.ParamByName('vl_valor').AsInteger :=
         qryTaxasCreditovl_valor.AsInteger;
   end;
   
   qyDeleteTaxa.ExecSQL;
end;

procedure TfrmAdministradoraCartao.dsAdministradoraCartaoDataChange(
  Sender: TObject; Field: TField);
begin
   if qryAdministradoraCartao.State <> dsBrowse then
   begin
      Exit;
   end;
   
   corrigeCombos(cbCreditosReceber, 'cd_conta_credito');
   corrigeCombos(cbDebitosReceber, 'cd_conta_debito');
   corrigeCombos(cbCreditosRecebidos, 'cd_conta_baixa_credito');
   corrigeCombos(cbDebitosRecebidos, 'cd_conta_baixa_debito');

   reloadTaxas;
end;

procedure TfrmAdministradoraCartao.dsAdministradoraCartaoStateChange(
  Sender: TObject);
var
   editando: Boolean;
begin
   editando := qryAdministradoraCartao.State in [dsInsert, dsEdit];

   btnSalvar.Enabled    := editando;
   btnCancelar.Enabled  := editando;

   btnInserir.Enabled := not(editando);
   btnExcluir.Enabled := not(editando);
   btnAlterar.Enabled := not(editando);

   cbCreditosReceber.Enabled     := editando;
   cbDebitosReceber.Enabled      := editando;
   cbCreditosRecebidos.Enabled   := editando;
   cbDebitosRecebidos.Enabled    := editando;

   pnTaxas.Enabled      := not(qryAdministradoraCartao.State in [dsInsert]);
   sbTaxaMenos.Enabled  := pnTaxas.Enabled;
   sbTaxaMais.Enabled   := pnTaxas.Enabled;

   DBGrid1.Enabled := not editando;
end;

procedure TfrmAdministradoraCartao.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
   Action := caFree;
end;

procedure TfrmAdministradoraCartao.FormDestroy(Sender: TObject);
begin
   frmAdministradoraCartao := nil;
end;

procedure TfrmAdministradoraCartao.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
   case Key of
      VK_F2 : btnInserirClick( nil );
      VK_F3 : btnAlterarClick( nil );
      VK_F5 : btnSalvarClick( nil );
      VK_F9 : btnExcluirClick( nil );
      VK_F6 : btnCancelarClick( nil );
      VK_F12 : btnFecharClick( nil );
   end;
end;

procedure TfrmAdministradoraCartao.FormShow(Sender: TObject);
begin
   carregaContas;
   
   qryAdministradoraCartao.Close;
   qryAdministradoraCartao.Open;

   reloadTaxas;
end;

function TfrmAdministradoraCartao.getAdministradoraJson: String;
begin



   with qryAdministradoraCartao do
   begin
      Result :=   '{"administradora": {' +
                  '"cd_admin_cartao": "'+
                     FieldByName('cd_admin_cartao').AsString            +'",'+
                  '"ds_nome": "'+
                     FieldByName('ds_nome').AsString                    +'",'+
                  '"nr_dia_vencimento_credito": "'+
                     FieldByName('nr_dia_vencimento_credito').AsString  +'",'+
                  '"nr_dia_vencimento_debito": "'+
                     FieldByName('nr_dia_vencimento_debito').AsString   +'",'+
                  '"cd_conta_credito": "'+
                     FieldByName('cd_conta_credito').AsString           +'",'+
                  '"cd_conta_debito": "'+
                     FieldByName('cd_conta_debito').AsString            +'",'+
                  '"nr_taxa_debito": "'+
                     FieldByName('nr_taxa_debito').AsString             +'",'+
                  '"sn_ativo": "'+
                     FieldByName('sn_ativo').AsString                   +'",'+
                  '"cd_conta_baixa_credito": "'+
                     FieldByName('cd_conta_baixa_credito').AsString     +'",'+
                  '"cd_conta_baixa_debito": "'+
                     FieldByName('cd_conta_baixa_debito').AsString      +'"}}';
   end;
end;

function TfrmAdministradoraCartao.getChaveOperacao: String;
begin
   Result := 'Alteracao';

   if qryAdministradoraCartao.State in [dsInsert] then
   begin
      Result := 'Inclusao';
   end;
end;

function TfrmAdministradoraCartao.isExclusaoValida: Boolean;
const
   SQL_VALIDA_EXCLUSAO =
      '  SELECT '+
      '     count(cd_operacao) AS qtd '+
      '  FROM '+
      '     fin_cartao_operacao '+
      '  WHERE '+
      '     cd_admin_cartao = :cd_admin_cartao ';
var
   qyValida: TUMZReadOnlyQuery;
begin
   Result := True;

   DM.CriarConsulta(qyValida);

   qyValida.SQL.Text := SQL_VALIDA_EXCLUSAO;
   qyValida.ParamByName('cd_admin_cartao').AsInteger :=
      qryAdministradoraCartaocd_admin_cartao.AsInteger;
   qyValida.Open;

   if qyValida.FieldByName('qtd').AsInteger > 0 then
   begin
      Mensagem(
         'Você não pode excluir uma administradora usada em alguma operação.',
         'Aviso',
         MB_OK + MB_ICONWARNING
      );

      Result := False;
      Exit;
   end;
end;

function TfrmAdministradoraCartao.isFormularioValido: Boolean;
begin
   Result := True;;

   if dbeNomeAdministradora.Text = '' then
   begin
      Mensagem('Você não preencheu o campo "Nome da administradora", para prosseguir com o cadastro desta administradora, informe o valor referente à este campo.', 'Aviso', MB_OK + MB_ICONWARNING);
      Result := False;
      Exit;
   end;

   if dbeVencCredito.Text = '' then
   begin
      Mensagem('Você não preencheu o campo "Qtd. dias para vencimento - Crédito", para prosseguir com o cadastro desta administradora, informe o valor referente à este campo.', 'Aviso', MB_OK + MB_ICONWARNING);
      Result := False;
      Exit;
   end;

   if dbeVencDebito.Text = '' then
   begin
      Mensagem('Você não preencheu o campo "Qtd. dias para vencimento - Débito", para prosseguir com o cadastro desta administradora, informe o valor referente à este campo.', 'Aviso', MB_OK + MB_ICONWARNING);
      Result := False;                               
      Exit;
   end;

   if dbeTaxaDebito.Text = '' then
   begin
      Mensagem('Você não preencheu o campo "Taxa para débito", para prosseguir com o cadastro desta administradora, informe o valor referente à este campo.', 'Aviso', MB_OK + MB_ICONWARNING);
      Result := False;
      Exit;
   end;      
end;

procedure TfrmAdministradoraCartao.qryAdministradoraCartaoAfterInsert(
  DataSet: TDataSet);
begin
   qryAdministradoraCartaosn_ativo.AsInteger := 1;
end;

procedure TfrmAdministradoraCartao.qryAdministradoraCartaoAfterOpen(
  DataSet: TDataSet);
begin
   sbTaxaMais.Enabled := qryAdministradoraCartao.RecordCount > 0;
   sbTaxaMenos.Enabled := qryAdministradoraCartao.RecordCount > 0;
end;

procedure TfrmAdministradoraCartao.qryAdministradoraCartaoBeforeDelete(
  DataSet: TDataSet);
begin
   if not DM.UsuarioLogado.TemPermissao( 0, 'UMFinanceiro.AdminCartao', npExcluir, True )then
   begin
      Abort;
   end;
end;

procedure TfrmAdministradoraCartao.qryAdministradoraCartaoBeforeEdit(
  DataSet: TDataSet);
begin
   if not DM.UsuarioLogado.TemPermissao( 0, 'UMFinanceiro.AdminCartao', npAlterar, True )then
   begin
      Abort;
   end;
end;

procedure TfrmAdministradoraCartao.qryAdministradoraCartaoBeforeInsert(
  DataSet: TDataSet);
begin
   if not DM.UsuarioLogado.TemPermissao( 0, 'UMFinanceiro.AdminCartao', npIncluir, True )then
   begin
      Abort;
   end;
end;

procedure TfrmAdministradoraCartao.qryTaxasCreditovl_valorGetText(
  Sender: TField; var Text: string; DisplayText: Boolean);
begin
   if Sender.AsString = '' then exit;

   Text := 'Até ' + Sender.AsString + 'x';
end;

procedure TfrmAdministradoraCartao.reloadTaxas;
begin
   qryTaxasCredito.Close;
   qryTaxasCredito.ParamByName('cd_admin_cartao').AsInteger :=
      qryAdministradoraCartaocd_admin_cartao.AsInteger;
   qryTaxasCredito.Open;
end;

procedure TfrmAdministradoraCartao.sbTaxaMaisClick(Sender: TObject);
begin
   Application.CreateForm(TfrmTaxaAdministradora, frmTaxaAdministradora);

   frmTaxaAdministradora.codigoAdministradora :=
      qryAdministradoraCartaocd_admin_cartao.AsInteger;

   frmTaxaAdministradora.ShowModal;   

   reloadTaxas;

   FreeAndNil(frmTaxaAdministradora);
end;

procedure TfrmAdministradoraCartao.sbTaxaMenosClick(Sender: TObject);
begin
   if Mensagem('Tem certeza que deseja excluir este intervalo?', 'Aviso', MB_YESNO + MB_ICONWARNING) = mrYes then
   begin
      deleteTaxa(
         qryAdministradoraCartaocd_admin_cartao.AsInteger,
         qryTaxasCreditovl_valor.AsInteger
      );
      
      reloadTaxas;
   end;
end;

procedure TfrmAdministradoraCartao.validaCodigosContas;
begin
   if TItemCombo(cbCreditosReceber.Items.Objects[cbCreditosReceber.ItemIndex]).getCodigo = '-1' then
   begin
      
   end;

end;

end.
