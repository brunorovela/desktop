{
#TIT= Cadastro de Contas
#OBJ= Cadastrar contas e alterar/excluir as já existentes
#AUT= Jonathan
#DAT= 18/08/2004
#MOD= ...
#DES=
}
unit uCadContas;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Menus, DB, ZConnection, ImgList, ComCtrls, ToolWin, DBCtrls,
  StdCtrls, Mask, Grids, DBGrids, ExtCtrls, General, ZAbstractRODataset, ZAbstractDataset, ZDataset, UZDataset, uClassMovimento, CheckLst,
  Buttons, UMComboBox, uColigada, uListaColigadas, UMAjuda, uULancamentos;

type
  Tfrm_CadContas = class(TForm)
    Panel3: TPanel;
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
    ImageList1: TImageList;
    qyContas: TUMZQuery;
    srcContas: TDataSource;
    pmQtd: TPopupMenu;
    qyContasds_caixa: TStringField;
    qyContasnm_banco: TStringField;
    qyContasnr_banco: TStringField;
    qyContasnr_agencia: TStringField;
    qyContasnm_agencia: TStringField;
    qyContasnr_conta: TStringField;
    qyContasdt_criacao: TDateTimeField;
    qyContassn_ativa: TStringField;
    qyContasds_observacao: TMemoField;
    qyContasativa: TStringField;
    qyContasnr_uso_banco: TStringField;
    qyContasds_mensagem_bloqueto: TMemoField;
    qyContassn_multa: TStringField;
    qyContassn_juros: TStringField;
    qyContassn_correcao: TStringField;
    qyContasvl_multa_percent: TFloatField;
    qyContasvl_juros_percent: TFloatField;
    qyContasnr_carteira: TStringField;
    qyContasnr_convenio: TStringField;
    qyContasnr_transacao: TStringField;
    qyContascd_coligada: TSmallintField;
    qyContasds_identificacao_retorno: TStringField;
    qyContasnm_arquivo_bloqueto: TStringField;
    qyContasds_nn_prefixo: TStringField;
    qyContasdt_saldo_base: TDateTimeField;
    qyContassn_juros_mensal: TStringField;
    qyContasvl_juros_mensal: TFloatField;
    qyPlanos: TUMZQuery;
    qyContasdescPlanoContas: TStringField;
    qyContasdescPlanoDesconto: TStringField;
    qyContasdescPlanoAcrescimos: TStringField;
    qyContasvl_saldo_inicio: TFloatField;
    qyContasvl_dias_desc_perc: TFloatField;
    qyContassn_saldo_disponivel: TSmallintField;
    qyContasds_categoria: TStringField;
    qyContasds_grupo_categoria: TStringField;
    qyContasdescPlanoTarifa: TStringField;
    qyCentros: TUMZQuery;
    qyContasdescCentroCustos: TStringField;
    qyContastp_conta: TSmallintField;
    qyContasnr_float_bancario: TSmallintField;
    qyContasnr_ultimo_cheque: TIntegerField;
    qyContasnr_nn_ultimo: TIntegerField;
    qyContasnr_dias_acrescimo: TIntegerField;
    qyContasnr_dias_desconto: TIntegerField;
    qyContascd_boleto_online: TLargeintField;
    qyContascd_plano_conta: TLargeintField;
    qyContascd_conta_desconto: TLargeintField;
    qyContascd_conta_acrescimo: TLargeintField;
    qyContascd_conta_tarifa: TLargeintField;
    qyContascd_centro_tarifa: TLargeintField;
    qrySelectUsuarios: TUMZReadOnlyQuery;
    qryInsertUsuarios: TUMZQuery;
    qryDeleteUsuarios: TUMZQuery;
    qryUpdateUsuarios: TUMZQuery;
    qryReplaceUsuarios: TUMZQuery;
    qrySelectUsuariosCODIGO: TIntegerField;
    qrySelectUsuariosNM_USUARIO: TStringField;
    qrySelectUsuariosSN_ATIVO: TStringField;
    qrySelectUsuariosSN_PADRAO: TSmallintField;
    qyContascd_caixa: TIntegerField;
    qrySelectUsuariosCD_CAIXA: TIntegerField;
    qyContassn_transf_aberta: TSmallintField;
    Panel10: TPanel;
    cbUnidadeEnsino: TUMComboBox;
    Label31: TLabel;
    Panel11: TPanel;
    Panel4: TPanel;
    ScrollBox2: TScrollBox;
    Panel7: TPanel;
    Label12: TLabel;
    Bevel4: TBevel;
    Label2: TLabel;
    Label3: TLabel;
    DBCodConta: TDBEdit;
    DBEdit2: TDBEdit;
    DBLookupComboBox1: TDBLookupComboBox;
    DBCheckBox1: TDBCheckBox;
    pgConta: TPageControl;
    TabSheet4: TTabSheet;
    Label11: TLabel;
    Label14: TLabel;
    Label15: TLabel;
    Label19: TLabel;
    Label23: TLabel;
    Label24: TLabel;
    Label28: TLabel;
    deSaldo: TDBEdit;
    DBCheckBox2: TDBCheckBox;
    DBCheckBox3: TDBCheckBox;
    DBCheckBox4: TDBCheckBox;
    DBEdit3: TDBEdit;
    DBEdit11: TDBEdit;
    DBCheckBox5: TDBCheckBox;
    DBEdit15: TDBEdit;
    DBEdit19: TDBEdit;
    DBEdit20: TDBEdit;
    DBEdit24: TDBEdit;
    TabSheet1: TTabSheet;
    Label5: TLabel;
    Label4: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    Label8: TLabel;
    Label9: TLabel;
    Label10: TLabel;
    DBEdit5: TDBEdit;
    DBEdit4: TDBEdit;
    DBEdit6: TDBEdit;
    DBEdit7: TDBEdit;
    DBEdit8: TDBEdit;
    DBEdit9: TDBEdit;
    DBEdit10: TDBEdit;
    TabSheet2: TTabSheet;
    Label13: TLabel;
    Label16: TLabel;
    Label17: TLabel;
    Label18: TLabel;
    Label20: TLabel;
    Label21: TLabel;
    Label22: TLabel;
    DBEdit1: TDBEdit;
    DBEdit12: TDBEdit;
    DBEdit13: TDBEdit;
    DBEdit14: TDBEdit;
    DBEdit16: TDBEdit;
    DBEdit17: TDBEdit;
    DBEdit18: TDBEdit;
    TabSheet3: TTabSheet;
    DBMemo2: TDBMemo;
    tsPlanoContas: TTabSheet;
    tsUsuarios: TTabSheet;
    cklUsuarios: TCheckListBox;
    Panel8: TPanel;
    sbMarcar: TSpeedButton;
    sbDesmarcar: TSpeedButton;
    sbPadrao: TSpeedButton;
    Panel9: TPanel;
    DBCheckBox6: TDBCheckBox;
    Panel5: TPanel;
    DBMemo1: TDBMemo;
    Panel6: TPanel;
    Label1: TLabel;
    Panel1: TPanel;
    grd: TDBGrid;
    Panel2: TPanel;
    pnAnoSemestre: TPanel;
    qyContassn_todas_coligadas: TSmallintField;
    DBCheckBox7: TDBCheckBox;
    qyContascd_conta_desc_cp: TLargeintField;
    qyContascd_conta_multa_cp: TLargeintField;
    qyContascd_conta_juros_cp: TLargeintField;
    qyContasdsContaDescCP: TStringField;
    qyContasdsMultaCP: TStringField;
    qyContasdsJurosCP: TStringField;
    ScrollBox1: TScrollBox;
    Label25: TLabel;
    DBEdit21: TDBEdit;
    DBLookupComboBox2: TDBLookupComboBox;
    Label26: TLabel;
    DBEdit22: TDBEdit;
    DBLookupComboBox3: TDBLookupComboBox;
    Label27: TLabel;
    DBEdit23: TDBEdit;
    DBLookupComboBox4: TDBLookupComboBox;
    Label29: TLabel;
    DBEdit25: TDBEdit;
    DBLookupComboBox5: TDBLookupComboBox;
    Label30: TLabel;
    DBEdit26: TDBEdit;
    DBLookupComboBox6: TDBLookupComboBox;
    Label32: TLabel;
    DBEdit27: TDBEdit;
    DBLookupComboBox7: TDBLookupComboBox;
    Label33: TLabel;
    DBEdit28: TDBEdit;
    DBLookupComboBox8: TDBLookupComboBox;
    Label34: TLabel;
    DBEdit29: TDBEdit;
    DBLookupComboBox9: TDBLookupComboBox;
    UMAjuda1: TUMAjuda;
    UMAjuda2: TUMAjuda;
    sbConta: TSpeedButton;
    SpeedButton1: TSpeedButton;
    SpeedButton2: TSpeedButton;
    SpeedButton3: TSpeedButton;
    SpeedButton4: TSpeedButton;
    SpeedButton5: TSpeedButton;
    SpeedButton6: TSpeedButton;
    SpeedButton7: TSpeedButton;
    sbAviso1: TSpeedButton;
    sbAviso: TSpeedButton;
    procedure transformaPonto(Sender: TObject; var Key: Char);
    procedure sbAviso1Click(Sender: TObject);
    procedure DBLookupComboBox9Exit(Sender: TObject);
    procedure DBLookupComboBox8Exit(Sender: TObject);
    procedure DBLookupComboBox7Exit(Sender: TObject);
    procedure DBLookupComboBox6Exit(Sender: TObject);
    procedure DBLookupComboBox5Exit(Sender: TObject);
    procedure DBLookupComboBox4Exit(Sender: TObject);
    procedure DBLookupComboBox3Exit(Sender: TObject);
    procedure DBLookupComboBox9Enter(Sender: TObject);
    procedure DBLookupComboBox8Enter(Sender: TObject);
    procedure DBLookupComboBox7Enter(Sender: TObject);
    procedure DBLookupComboBox6Enter(Sender: TObject);
    procedure DBLookupComboBox5Enter(Sender: TObject);
    procedure DBLookupComboBox4Enter(Sender: TObject);
    procedure DBLookupComboBox2Exit(Sender: TObject);
    procedure DBLookupComboBox3Enter(Sender: TObject);
    procedure DBLookupComboBox2Enter(Sender: TObject);
    procedure SpeedButton4Click(Sender: TObject);
    procedure SpeedButton7Click(Sender: TObject);
    procedure SpeedButton6Click(Sender: TObject);
    procedure SpeedButton5Click(Sender: TObject);
    procedure SpeedButton3Click(Sender: TObject);
    procedure SpeedButton2Click(Sender: TObject);
    procedure SpeedButton1Click(Sender: TObject);
    procedure sbContaClick(Sender: TObject);
    procedure cbUnidadeEnsinoSelect(Sender: TObject);
    procedure cbUnidadeEnsinoChange(Sender: TObject);
    procedure sbPadraoClick(Sender: TObject);
    procedure sbDesmarcarClick(Sender: TObject);
    procedure sbMarcarClick(Sender: TObject);
    procedure srcContasDataChange(Sender: TObject; Field: TField);
    procedure cklUsuariosClickCheck(Sender: TObject);
    procedure pgContaChange(Sender: TObject);
    procedure qyContasBeforeInsert(DataSet: TDataSet);
    procedure qyContasBeforeEdit(DataSet: TDataSet);
    procedure FormShow(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure btnSairClick(Sender: TObject);
    procedure btnExcluirClick(Sender: TObject);
    procedure btnFecharClick(Sender: TObject);
    procedure btnInserirClick(Sender: TObject);
    procedure btnAlterarClick(Sender: TObject);
    procedure btnSalvarClick(Sender: TObject);
    procedure btnCancelarClick(Sender: TObject);
    procedure srcContasStateChange(Sender: TObject);
    procedure pmQtdPopup(Sender: TObject);
    procedure qyContasNewRecord(DataSet: TDataSet);
    procedure qyContasAfterInsert(DataSet: TDataSet);
    procedure DBCodContaKeyPress(Sender: TObject; var Key: Char);
    procedure qyContasCalcFields(DataSet: TDataSet);
    procedure qyContasBeforePost(DataSet: TDataSet);
  private
    { Private declarations }
    ListaUsuarios : Array of Integer;
    procedure MensagemColigada;
    Procedure MontaUsuarios();
    procedure CarregaUnidadeEnsino();
    procedure Filtra(coligada: Integer = -1);
    function VerificaUnidadeEnsino(): Boolean;

  public
    { Public declarations }
  end;

var
  frm_CadContas: Tfrm_CadContas;

implementation

uses Main, uDM, Math, uUsuario, uSelConta, uSelCentro;

{$R *.dfm}

procedure Tfrm_CadContas.FormShow(Sender: TObject);
begin

   // Selecionar somente as contas da unidade de ensino selecionada

   qyPlanos.Close();
   qyPlanos.ParamByName('cd_coligada').AsInteger := DM.GetUsuarioLogado.GetColigadaLogada.Codigo;
   qyPlanos.Open();

   qyCentros.Close();
   qyCentros.ParamByName('cd_coligada_matriz').AsInteger := DM.GetUsuarioLogado.GetColigadaLogada.Codigo;
   qyCentros.Open();

   CarregaUnidadeEnsino;
   Filtra();

   DM.qyTiposConta.Close();
   DM.qyTiposConta.Open();

   pgConta.ActivePageIndex := 0;

   cklUsuarios.Enabled := DM.UsuarioLogado.TemPermissao( 2028, npIncluir, False );
   sbMarcar.Enabled := DM.UsuarioLogado.TemPermissao( 2028, npIncluir, False );
   sbDesmarcar.Enabled:= DM.UsuarioLogado.TemPermissao( 2028, npIncluir, False );
end;

procedure Tfrm_CadContas.MensagemColigada();
begin
   Mensagem('Selecione uma coligada!');
end;

procedure Tfrm_CadContas.MontaUsuarios;
var
   I: integer;
begin
    // Selecionar todos os usuários ativos no sistema,
    // Relacionando com a tabela fin_contas_usuarios para identificar os que
    // já estão usando esta conta
   qrySelectUsuarios.Close;
   qrySelectUsuarios.ParamByName('CD_CAIXA').AsInteger := qyContascd_caixa.AsInteger;
   qrySelectUsuarios.ParamByName('CD_COLIGADA').AsInteger := qyContascd_coligada.AsInteger;
   qrySelectUsuarios.Open;

    // Preencher a Combo
   cklUsuarios.Items.Clear;

   SetLength(ListaUsuarios, qrySelectUsuarios.RecordCount);
   cklUsuarios.Items.BeginUpdate;
   while not qrySelectUsuarios.Eof do
   begin
      I := cklUsuarios.Items.Add(qrySelectUsuariosNM_USUARIO.AsString);
      cklUsuarios.Checked[I] := qrySelectUsuariosSN_ATIVO.AsInteger = 1;
      ListaUsuarios[I] := qrySelectUsuariosCODIGO.AsInteger;
      qrySelectUsuarios.Next;
   end;
   cklUsuarios.Items.EndUpdate;
end;

procedure Tfrm_CadContas.Filtra(coligada: Integer = -1);
const
   SQL_CONTAS_FILTRADAS = 'SELECT * FROM FIN_CADASTRO_CONTAS '+
      ' WHERE CD_COLIGADA = %d'+
      ' ORDER BY TP_CONTA, DS_CAIXA';
begin

   qyContas.Close();

   if cbUnidadeEnsino.ItemIndex > 0 then
   begin
      if coligada = 0 then
         qyContas.SQL.Text := Format(SQL_CONTAS_FILTRADAS, [
            0
         ])
      else
         qyContas.SQL.Text := Format(SQL_CONTAS_FILTRADAS, [
            TColigada(cbUnidadeEnsino.Items.Objects[cbUnidadeEnsino.ItemIndex]).Codigo
         ]);

      qyContas.Open();
   end;
end;

procedure Tfrm_CadContas.FormClose(Sender: TObject; var Action: TCloseAction);
begin
   // Destruir o formulário

   Action := caFree;
end;

procedure Tfrm_CadContas.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  // Teclas de atalho rápido
  
  case Key of
    VK_F1 : PrincipalForm.confSobreClick( nil );
    VK_F2 : btnInserirClick( nil );
    VK_F3 : btnAlterarClick( nil );
    VK_F5 : btnSalvarClick( nil );
    VK_F9 : btnExcluirClick( nil );
    VK_F6 : btnCancelarClick( nil );
    VK_F12 : btnSairClick( nil );
  end;

end;

procedure Tfrm_CadContas.btnSairClick(Sender: TObject);
begin
  // Fechar o formulário
  
  Close();
end;

procedure Tfrm_CadContas.btnExcluirClick(Sender: TObject);
Var
   sChave : String;
begin
  // Excluir a conta selecionada

  if not DM.UsuarioLogado.TemPermissao( 2028, npExcluir, True ) then Abort;

  // Verificar se existe lançamento da tesouraria

  if (DM.ExisteRegistro('fin_mov_tesouraria',['cd_caixa', 'cd_coligada'],[qyContas.FieldByName('cd_caixa').AsString, qyContascd_coligada.AsString])) then
  begin
      Mensagem( 'Não é possível excluir este registro.'+CHR(13)+'Há informações ligadas a ele. Você pode somente desativar a conta.', Application.Title, MB_OK + MB_ICONWARNING );
      Exit;
  end;

  if Mensagem( 'Deseja realmente excluir a conta selecionada?', Application.Title, MB_YESNO + MB_ICONQUESTION ) = ID_YES then
  begin
     // Gerar Log da exclusão

     sChave := qyContascd_caixa.AsString + ';';
     sChave := sChave + qyContascd_coligada.AsString;

     DM.setLog(2028, 'Exclusao', schave, DM.GetUsuarioLogado.GetColigadaLogada.Codigo);

     qyContas.Delete();
  end;
end;

procedure Tfrm_CadContas.btnFecharClick(Sender: TObject);
begin
   // Fechar o Formulário
   qyContas.Close();
   Close();
end;

procedure Tfrm_CadContas.btnInserirClick(Sender: TObject);
begin

   if not VerificaUnidadeEnsino() then exit;

   // Incluir nova Conta
   pgConta.ActivePageIndex := 0;
   DBEdit2.SetFocus();
   qyContas.Insert();
end;

procedure Tfrm_CadContas.btnAlterarClick(Sender: TObject);
begin
   // Alterar a conta selecionada
   DBEdit2.SetFocus();
   qyContas.Edit();
end;

procedure Tfrm_CadContas.btnSalvarClick(Sender: TObject);
var
   reg: integer;
begin
   grd.SetFocus;

   reg := qyContas.FieldByName('cd_caixa').AsInteger;

   qyContascd_coligada.AsInteger :=
      TColigada(cbUnidadeEnsino.Items.Objects[cbUnidadeEnsino.ItemIndex]).Codigo;

   qyContas.Post();
   qyContas.Close();
   qyContas.Open();
   qyContas.Locate('cd_caixa', reg, []);
end;

procedure Tfrm_CadContas.CarregaUnidadeEnsino;
begin
   DM.CarregaColigadas(cbUnidadeEnsino);
end;

procedure Tfrm_CadContas.cbUnidadeEnsinoChange(Sender: TObject);
begin
   if cbUnidadeEnsino.ItemIndex > 0 then
      Filtra()
   else
      qyContas.Close;      
end;

procedure Tfrm_CadContas.cbUnidadeEnsinoSelect(Sender: TObject);
begin
   DM.SalvaColigada(cbUnidadeEnsino);

   if cbUnidadeEnsino.ItemIndex > 0 then
      Filtra()
   else
      qyContas.Close;

end;

procedure Tfrm_CadContas.cklUsuariosClickCheck(Sender: TObject);
begin
   if ( qyContas.State IN [dsInsert] ) then
   begin
      Mensagem( 'Você precisa salvar as alterações para selecionar os usuários.' );
      try
         try
            cklUsuarios.OnClickCheck := nil;
            cklUsuarios.Checked[cklUsuarios.ItemIndex] := False;
         finally
            cklUsuarios.OnClickCheck := cklUsuariosClickCheck;
         end;
      except
         cklUsuarios.OnClickCheck := cklUsuariosClickCheck;
      end;                                                                             
      Exit;
   end;   

   if cklUsuarios.Checked[cklUsuarios.ItemIndex] then
   begin
      try
         qryInsertUsuarios.ParamByName('CD_CAIXA').AsInteger := qyContascd_caixa.AsInteger;
         qryInsertUsuarios.ParamByName('CD_COLIGADA').AsInteger := qyContascd_coligada.AsInteger;
         qryInsertUsuarios.ParamByName('CD_USUARIO').AsInteger := ListaUsuarios[cklUsuarios.ItemIndex];
         qryInsertUsuarios.ExecSQL;
      Except
         // apenas não insere novamente o usuário pois ele já está habilitado para este caixa
      end;
   end
   else
   begin
      qryDeleteUsuarios.ParamByName('CD_CAIXA').AsInteger := qyContascd_caixa.AsInteger;
      qryDeleteUsuarios.ParamByName('CD_COLIGADA').AsInteger := qyContascd_coligada.AsInteger;
      qryDeleteUsuarios.ParamByName('CD_USUARIO').AsInteger := ListaUsuarios[cklUsuarios.ItemIndex];
      qryDeleteUsuarios.ExecSQL;
   end;
end;

procedure Tfrm_CadContas.btnCancelarClick(Sender: TObject);
begin
   qyContas.Cancel();
end;

procedure Tfrm_CadContas.sbAviso1Click(Sender: TObject);
begin
   MessageDlg('Os campos desta aba estão desabilitados, pois já existe um bloqueto configurado para esta conta.', mtInformation, [mbOK], -1);
end;

procedure Tfrm_CadContas.sbContaClick(Sender: TObject);
begin
   // Seleção de Plano de Contas
   if not (qyContas.State in [dsInsert, dsEdit]) then
   begin
      qyContas.Edit;
   end;

//   frm_SelConta.setTipoConta(tcAtivo);
   frm_SelConta.ShowModal;

   if frm_SelConta.flgSearch then
   begin
      qyContascd_plano_conta.AsInteger := frm_SelConta.qyPlanosContascd_conta.AsInteger;
   end;
end;

procedure Tfrm_CadContas.sbDesmarcarClick(Sender: TObject);
var
   n : Integer;
begin
   if ( qyContas.State IN [dsInsert] ) then
   begin
      Mensagem( 'Você precisa salvar as alterações para selecionar os usuários.' );
      Exit;
   end;
   
   for n := 0 to cklUsuarios.Count - 1 do begin

       cklUsuarios.ItemIndex := n;
       cklUsuarios.Checked[n] := false;

       cklUsuariosClickCheck(nil);
    
   end;

   MontaUsuarios();
end;

procedure Tfrm_CadContas.sbMarcarClick(Sender: TObject);
var
   n : Integer;
begin
   if ( qyContas.State IN [dsInsert] ) then
   begin
      Mensagem( 'Você precisa salvar as alterações para selecionar os usuários.' );
      Exit;
   end;

   for n := 0 to cklUsuarios.Count - 1 do begin

       cklUsuarios.ItemIndex := n;
       cklUsuarios.Checked[n] := True;

       cklUsuariosClickCheck(nil);

   end;

   MontaUsuarios();

end;

procedure Tfrm_CadContas.sbPadraoClick(Sender: TObject);
var
   LIItem: integer;
begin
   if ( qyContas.State IN [dsInsert] ) then
   begin
      Mensagem( 'Você precisa salvar as alterações para selecionar os usuários.' );
      Exit;
   end;

   LIItem := cklUsuarios.ItemIndex;

   if (LIItem = -1) then
   begin
      Mensagem( 'Você precisa selecionar um usuário.', 'Aviso', MB_OK + MB_ICONINFORMATION );
      Exit;
   end;

   // Marcar a conta como ativa
   cklUsuarios.Checked[LIItem] := true;


   // Retirar o padrão das outras contas deste usuário;
   qryUpdateUsuarios.ParamByName('CD_COLIGADA').AsInteger := qyContascd_coligada.AsInteger;
   qryUpdateUsuarios.ParamByName('CD_USUARIO').AsInteger := ListaUsuarios[cklUsuarios.ItemIndex];
   qryUpdateUsuarios.ExecSQL;

   // Inserir a conta como padrão
   qryReplaceUsuarios.ParamByName('CD_CAIXA').AsInteger := qyContascd_caixa.AsInteger;
   qryReplaceUsuarios.ParamByName('CD_COLIGADA').AsInteger := qyContascd_coligada.AsInteger;
   qryReplaceUsuarios.ParamByName('CD_USUARIO').AsInteger := ListaUsuarios[cklUsuarios.ItemIndex];
   qryReplaceUsuarios.ExecSQL;

   MontaUsuarios;
   cklUsuarios.ItemIndex := LIItem;
end;

procedure Tfrm_CadContas.SpeedButton1Click(Sender: TObject);
begin
   // Seleção de Plano de Contas
   if not (qyContas.State in [dsInsert, dsEdit]) then
   begin
      qyContas.Edit;
   end;

   frm_SelConta.setTipoConta(tcResultado);
   frm_SelConta.ShowModal;

   if frm_SelConta.flgSearch then
   begin
      qyContascd_conta_desconto.AsInteger := frm_SelConta.qyPlanosContascd_conta.AsInteger;
   end;
end;

procedure Tfrm_CadContas.SpeedButton2Click(Sender: TObject);
begin

  // Seleção de Plano de Contas
  if not (qyContas.State in [dsInsert, dsEdit]) then begin
     qyContas.Edit;
  end;

  frm_SelConta.setTipoConta(tcResultado);
  frm_SelConta.ShowModal;

  if frm_SelConta.flgSearch then begin

        qyContascd_conta_acrescimo.AsInteger := frm_SelConta.qyPlanosContascd_conta.AsInteger;

  end;
end;

procedure Tfrm_CadContas.SpeedButton3Click(Sender: TObject);
begin

  // Seleção de Plano de Contas
  if not (qyContas.State in [dsInsert, dsEdit]) then begin
     qyContas.Edit;
  end;

  frm_SelConta.setTipoConta(tcResultado);
  frm_SelConta.ShowModal;

  if frm_SelConta.flgSearch then begin

        qyContascd_conta_tarifa.AsInteger := frm_SelConta.qyPlanosContascd_conta.AsInteger;

  end;
end;

procedure Tfrm_CadContas.SpeedButton4Click(Sender: TObject);
begin

  // Seleção de Plano de Contas
  if not (qyContas.State in [dsInsert, dsEdit]) then begin
     qyContas.Edit;
  end;

  frm_SelConta.setTipoConta(tcResultado);
  frm_SelCentro.ShowModal;

  if frm_SelCentro.flgSearch then begin
      qyContascd_centro_tarifa.AsInteger := frm_SelCentro.qyCentroscd_centro.AsInteger;
  end;
end;

procedure Tfrm_CadContas.SpeedButton5Click(Sender: TObject);
begin

  // Seleção de Plano de Contas
  if not (qyContas.State in [dsInsert, dsEdit]) then begin
     qyContas.Edit;
  end;

  frm_SelConta.setTipoConta(tcResultado);
  frm_SelConta.ShowModal;

  if frm_SelConta.flgSearch then begin

        qyContascd_conta_multa_cp.AsInteger := frm_SelConta.qyPlanosContascd_conta.AsInteger;

  end;
end;

procedure Tfrm_CadContas.SpeedButton6Click(Sender: TObject);
begin

  // Seleção de Plano de Contas
  if not (qyContas.State in [dsInsert, dsEdit]) then begin
     qyContas.Edit;
  end;

  frm_SelConta.setTipoConta(tcResultado);
  frm_SelConta.ShowModal;

  if frm_SelConta.flgSearch then begin

        qyContascd_conta_juros_cp.AsInteger := frm_SelConta.qyPlanosContascd_conta.AsInteger;

  end;
end;

procedure Tfrm_CadContas.SpeedButton7Click(Sender: TObject);
begin

  // Seleção de Plano de Contas
  if not (qyContas.State in [dsInsert, dsEdit]) then begin
     qyContas.Edit;
  end;

  frm_SelConta.setTipoConta(tcResultado);
  frm_SelConta.ShowModal;

  if frm_SelConta.flgSearch then begin

        qyContascd_conta_desc_cp.AsInteger := frm_SelConta.qyPlanosContascd_conta.AsInteger;

  end;
end;

procedure Tfrm_CadContas.srcContasDataChange(Sender: TObject; Field: TField);
var
   habilitado : Boolean;
begin
   if pgConta.ActivePage = tsUsuarios then begin
      MontaUsuarios();
   end;

   habilitado := ((qyContasnm_arquivo_bloqueto.AsString = '') or (qyContasnm_arquivo_bloqueto.IsNull));

   DBEdit1.Enabled  := habilitado;
   DBEdit4.Enabled  := habilitado;
   DBEdit5.Enabled  := habilitado;
   DBEdit6.Enabled  := habilitado;
   DBEdit7.Enabled  := habilitado;
   DBEdit8.Enabled  := habilitado;
   DBEdit9.Enabled  := habilitado;
   DBEdit12.Enabled := habilitado;
   DBEdit13.Enabled := habilitado;
   DBEdit14.Enabled := habilitado;
   DBEdit16.Enabled := habilitado;
   DBEdit17.Enabled := habilitado;
   DBEdit18.Enabled := habilitado;
   sbAviso1.Visible := not habilitado;
   sbAviso.Visible := not habilitado;
end;

procedure Tfrm_CadContas.srcContasStateChange(Sender: TObject);
begin
    if qyContas.State in [dsInsert] then
      deSaldo.Enabled := True
    else
      deSaldo.Enabled := False;

    btnInserir.Enabled        := not (qyContas.State in [dsInsert, dsEdit]);
    btnAlterar.Enabled        := not (qyContas.State in [dsInsert, dsEdit]);
    btnExcluir.Enabled        := not (qyContas.State in [dsInsert, dsEdit]);
    btnSalvar.Enabled         := qyContas.State in [dsInsert, dsEdit];
    btnCancelar.Enabled       := qyContas.State in [dsInsert, dsEdit];
    btnFechar.Enabled         := not (qyContas.State in [dsInsert, dsEdit]);
    cbUnidadeEnsino.Enabled   := qyContas.State in [dsBrowse, dsInactive];
end;

procedure Tfrm_CadContas.transformaPonto(Sender: TObject; var Key: Char);
begin
   //Se for . transforma para virgula
   if(Key in['.']) then
   begin
      Key :=  ',';
   end;
end;

function Tfrm_CadContas.VerificaUnidadeEnsino: Boolean;
begin

   Result := True;

   if cbUnidadeEnsino.ItemIndex = 0 then
   begin
      Mensagem('Selecione uma unidade de ensino!', 'Aviso', MB_OK + MB_ICONINFORMATION);
      Result := False;
   end;
end;

procedure Tfrm_CadContas.pgContaChange(Sender: TObject);
begin
   if pgConta.ActivePage = tsUsuarios then begin

      MontaUsuarios();

   end;
end;

procedure Tfrm_CadContas.pmQtdPopup(Sender: TObject);
begin
  DM.quantidade_registros(qyContas, pmQtd);
end;

procedure Tfrm_CadContas.qyContasNewRecord(DataSet: TDataSet);
begin
  // Inclusão de nova conta
  
  DataSet.FieldByName('dt_criacao').AsDateTime := DataHoje;
  DataSet.FieldByName('sn_ativa').AsString := 'S';
end;

procedure Tfrm_CadContas.qyContasAfterInsert(DataSet: TDataSet);
begin
   // Inclusão de nova conta
   
   qyContas.FieldByName('cd_caixa').AsInteger := DM.ProximoId('cd_caixa', 'fin_cadastro_contas');
   qyContas.FieldByName('cd_coligada').AsInteger := DM.GetUsuarioLogado.GetColigadaLogada.Codigo;
end;

procedure Tfrm_CadContas.DBCodContaKeyPress(Sender: TObject;
  var Key: Char);
begin
   //Se for . transforma para virgula
   if(Key in['.']) then
   begin
      Key :=  ',';
   end;
   
   // Alternar entre campos
   if Key = #13 then
   Begin
       SelectNext(Sender as TWinControl, True, True);
       Key := #0;
   End;
end;

procedure Tfrm_CadContas.DBLookupComboBox2Enter(Sender: TObject);
begin
   // Lista apenas contas Ativo
//   qyPlanos.Filter := ' cd_grupo_contas = 2 ';
//   qyPlanos.Filtered := True;
end;

procedure Tfrm_CadContas.DBLookupComboBox2Exit(Sender: TObject);
begin
//   qyPlanos.Filtered := False;
end;

procedure Tfrm_CadContas.DBLookupComboBox3Enter(Sender: TObject);
begin
   // Lista apenas contas Resultado
//   qyPlanos.Filter := ' cd_grupo_contas = 4 ';
//   qyPlanos.Filtered := True;
end;

procedure Tfrm_CadContas.DBLookupComboBox3Exit(Sender: TObject);
begin
//   qyPlanos.Filtered := False;
end;

procedure Tfrm_CadContas.DBLookupComboBox4Enter(Sender: TObject);
begin
   // Lista apenas contas Resultado
//   qyPlanos.Filter := ' cd_grupo_contas = 4 ';
//   qyPlanos.Filtered := True;
end;

procedure Tfrm_CadContas.DBLookupComboBox4Exit(Sender: TObject);
begin
//   qyPlanos.Filtered := False;
end;

procedure Tfrm_CadContas.DBLookupComboBox5Enter(Sender: TObject);
begin
   // Lista apenas contas Resultado
//   qyPlanos.Filter := ' cd_grupo_contas = 4 ';
//   qyPlanos.Filtered := True;
end;

procedure Tfrm_CadContas.DBLookupComboBox5Exit(Sender: TObject);
begin
//   qyPlanos.Filtered := False;
end;

procedure Tfrm_CadContas.DBLookupComboBox6Enter(Sender: TObject);
begin
   // Lista apenas contas Resultado
//   qyPlanos.Filter := ' cd_grupo_contas = 4 ';
//   qyPlanos.Filtered := True;
end;

procedure Tfrm_CadContas.DBLookupComboBox6Exit(Sender: TObject);
begin
//   qyPlanos.Filtered := False;
end;

procedure Tfrm_CadContas.DBLookupComboBox7Enter(Sender: TObject);
begin
   // Lista apenas contas Resultado
//   qyPlanos.Filter := ' cd_grupo_contas = 4 ';
//   qyPlanos.Filtered := True;
end;

procedure Tfrm_CadContas.DBLookupComboBox7Exit(Sender: TObject);
begin
//   qyPlanos.Filtered := False;
end;

procedure Tfrm_CadContas.DBLookupComboBox8Enter(Sender: TObject);
begin
   // Lista apenas contas Resultado
//   qyPlanos.Filter := ' cd_grupo_contas = 4 ';
//   qyPlanos.Filtered := True;
end;

procedure Tfrm_CadContas.DBLookupComboBox8Exit(Sender: TObject);
begin
//   qyPlanos.Filtered := False;
end;

procedure Tfrm_CadContas.DBLookupComboBox9Enter(Sender: TObject);
begin
   // Lista apenas contas Resultado
//   qyPlanos.Filter := ' cd_grupo_contas = 4 ';
//   qyPlanos.Filtered := True;
end;

procedure Tfrm_CadContas.DBLookupComboBox9Exit(Sender: TObject);
begin
//   qyPlanos.Filtered := False;
end;

procedure Tfrm_CadContas.qyContasCalcFields(DataSet: TDataSet);
begin
  // Apresentação do campo Ativo na tela

  if DM.isTrue(qyContas.FieldByName('sn_ativa').AsString) then

    qyContas.FieldByName('ativa').AsString := 'X';

end;

procedure Tfrm_CadContas.qyContasBeforePost(DataSet: TDataSet);
var
   qyRegistra : TUMZQuery;
   sChave : String;
begin

  if qyContas.State = dsInsert then
  Begin

     if qyContastp_conta.AsInteger <> 3 then
     begin

        // Na inclusão quando a conta não for caixa, gerar um saldo inicial na
        // movimentação da tesouraria
        // A conta caixa gera o saldo inicial na sua abertura

        Dm.CriarConsulta(qyRegistra);

        qyRegistra.Close;
        qyRegistra.SQL.Clear;

        qyRegistra.SQL.Add('INSERT INTO fin_mov_tesouraria ');
        qyRegistra.SQL.Add('(cd_movimento_te, cd_caixa, cd_coligada, dt_movimento, dt_registro, cd_acao, ds_movimento,  ');
        qyRegistra.SQL.Add('dt_liberacao, cd_origem, tp_entrada_saida, vl_movimento, vl_saldo )');
        qyRegistra.SQL.Add(' VALUES (:cd_movimento_te, :cd_caixa, :cd_coligada, :dt_movimento, :dt_registro, :cd_acao, :ds_movimento, ');
        qyRegistra.SQL.Add(':dt_liberacao, :cd_origem, :tp_entrada_saida, :vl_movimento, :vl_saldo)');

        qyRegistra.ParamByName('cd_movimento_te').AsInteger := DM.ProximoId('cd_movimento_te', 'fin_mov_tesouraria');
        qyRegistra.ParamByName('cd_caixa').AsInteger := qyContascd_caixa.AsInteger;
        qyRegistra.ParamByName('cd_coligada').AsInteger := qyContascd_coligada.AsInteger;
        qyRegistra.ParamByName('dt_movimento').AsDateTime := DM.DataAtual;
        qyRegistra.ParamByName('dt_registro').AsDateTime := Dm.DataAtual;
        qyRegistra.ParamByName('cd_acao').AsInteger := 5;  // Código Ação padrão para Ajuste do Saldo
        qyRegistra.ParamByName('ds_movimento').AsString := 'Saldo Inicial';
        qyRegistra.ParamByName('dt_liberacao').AsDateTime := now;
        qyRegistra.ParamByName('cd_origem').AsInteger := 3;  // Tesouraria
        qyRegistra.ParamByName('tp_entrada_saida').AsInteger := 1;  // Entradas
        qyRegistra.ParamByName('vl_movimento').AsFloat := qyContasvl_saldo_inicio.AsFloat;
        qyRegistra.ParamByName('vl_saldo').AsFloat := qyContasvl_saldo_inicio.AsFloat;

        qyRegistra.ExecSQL;

        FreeAndNil(qyRegistra);

     End;


  End;

  // Registrar log da alteração ou inclusão 

  sChave := qyContascd_caixa.AsString + ';';
  sChave := sChave + qyContascd_coligada.AsString;

  if qyContas.State in [dsInsert] then
     DM.setLog(2028, 'Inclusao', sChave, DM.GetUsuarioLogado.GetColigadaLogada.Codigo)
  else
     DM.setLog(2028, 'Alteracao', sChave, DM.GetUsuarioLogado.GetColigadaLogada.Codigo);

end;

procedure Tfrm_CadContas.qyContasBeforeEdit(DataSet: TDataSet);
begin
   // Verificar se tem acesso para alteração

   if not DM.UsuarioLogado.TemPermissao( 2028, npAlterar, True ) then Abort;
end;

procedure Tfrm_CadContas.qyContasBeforeInsert(DataSet: TDataSet);
begin
   // Verificar se tem acesso para inclusão

   if not DM.UsuarioLogado.TemPermissao( 2028, npIncluir, True ) then Abort;
end;

end.

