unit uCadTituloTipos;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Menus, DB, ZConnection, ImgList, ComCtrls, ToolWin, DBCtrls,
  StdCtrls, Mask, Grids, DBGrids, ExtCtrls, General, ZAbstractRODataset, ZAbstractDataset, ZDataset, UZDataset, Buttons,
  UMComboBox,uItemCombo, UZSortedGrid;

type
  Tfrm_CadTituloTipos = class(TForm)
    Bevel3: TBevel;
    Bevel7: TBevel;
    Panel3: TPanel;
    Panel1: TPanel;
    Bevel5: TBevel;
    grd: TZSortedGrid;
    Panel2: TPanel;
    pnAnoSemestre: TPanel;
    Panel4: TPanel;
    Bevel6: TBevel;
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
    qyTituloTipos: TUMZQuery;
    srcTituloTipos: TDataSource;
    pmQtd: TPopupMenu;
    qyTituloTiposds_ct_tipo_titulo: TStringField;
    qyContas: TUMZQuery;
    qyTituloTiposdesc_conta: TStringField;
    qyTituloTiposdesc_conta_debito: TStringField;
    qyTituloTiposdesc_conta_cancel: TStringField;
    ScrollBox1: TScrollBox;
    Label2: TLabel;
    dbCodigo: TDBEdit;
    Label1: TLabel;
    DBEdit1: TDBEdit;
    Label3: TLabel;
    DBEdit2: TDBEdit;
    DBLookupComboBox1: TDBLookupComboBox;
    sbConta: TSpeedButton;
    SpeedButton1: TSpeedButton;
    DBLookupComboBox2: TDBLookupComboBox;
    DBEdit4: TDBEdit;
    Label5: TLabel;
    Label9: TLabel;
    DBEdit8: TDBEdit;
    DBLookupComboBox3: TDBLookupComboBox;
    SpeedButton2: TSpeedButton;
    Label4: TLabel;
    DBEdit3: TDBEdit;
    dtpDataPadrao: TDateTimePicker;
    DBEdit5: TDBEdit;
    Label6: TLabel;
    Label7: TLabel;
    DBEdit6: TDBEdit;
    lblDataPadrao: TLabel;
    DBEdit7: TDBEdit;
    drgTipo: TDBRadioGroup;
    DBCheckBox1: TDBCheckBox;
    DBCheckBox2: TDBCheckBox;
    lbTituloNotaFiscal: TLabel;
    cmbServicosTitulos: TUMComboBox;
    Bevel2: TBevel;
    Panel5: TPanel;
    cbFiltroTipoConta: TComboBox;
    Label8: TLabel;
    qyContasCancel: TUMZQuery;
    DBCheckBox3: TDBCheckBox;
    dbcbCobrancaUnica: TDBCheckBox;
    qyTituloTiposCD_TIPO_TITULO: TIntegerField;
    qyTituloTiposCD_COLIGADA_MATRIZ: TIntegerField;
    qyTituloTiposDS_TIPO_TITULO: TStringField;
    qyTituloTiposCT_TIPO_TITULO: TSmallintField;
    qyTituloTiposCD_CONTA: TLargeintField;
    qyTituloTiposCD_PADRAO: TIntegerField;
    qyTituloTiposVL_PADRAO: TFloatField;
    qyTituloTiposCD_CONTA_DEBITO: TLargeintField;
    qyTituloTiposNR_PARCELA: TIntegerField;
    qyTituloTiposSN_FATURAMENTO: TSmallintField;
    qyTituloTiposDS_GRUPO_BOLETO: TStringField;
    qyTituloTiposSN_LIBERA_JUROS: TSmallintField;
    qyTituloTiposDT_PADRAO_GERACAO: TDateField;
    qyTituloTiposCD_TITULO_BANCO: TStringField;
    qyTituloTiposCD_NFE_G2KA_SERVICO_TITULO: TIntegerField;
    qyTituloTiposCD_CONTA_CANCEL: TLargeintField;
    qyTituloTiposCD_HISTORICO_FATURA: TLargeintField;
    qyTituloTiposDS_HISTORICO_FATURA: TStringField;
    qyTituloTiposSN_ATIVO: TSmallintField;
    qyTituloTiposSN_COBRANCA_UNICA: TSmallintField;
    qyTituloTiposSN_MANTER_NUMERO_PARCELA: TSmallintField;
    dbckMantemParcela: TDBCheckBox;
    sn_ativo: TRadioGroup;
    procedure sn_ativoClick(Sender: TObject);
    procedure DBEdit3KeyPress(Sender: TObject; var Key: Char);
    procedure cbFiltroTipoContaChange(Sender: TObject);
    procedure SpeedButton2Click(Sender: TObject);
    procedure cmbServicosTitulosClick(Sender: TObject);
    procedure srcTituloTiposDataChange(Sender: TObject; Field: TField);
    procedure DBEdit7KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure meDataPadraoKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure meDataPadraoExit(Sender: TObject);
    procedure meDataPadrao2Enter(Sender: TObject);
    procedure meDataPadraoEnter(Sender: TObject);
    procedure dbCodigoChange(Sender: TObject);
    procedure dtpDataPadraoChange(Sender: TObject);
    procedure SpeedButton1Click(Sender: TObject);
    procedure sbContaClick(Sender: TObject);
    procedure qyTituloTiposBeforePost(DataSet: TDataSet);
    procedure qyTituloTiposAfterPost(DataSet: TDataSet);
    procedure qyTituloTiposBeforeInsert(DataSet: TDataSet);
    procedure qyTituloTiposBeforeEdit(DataSet: TDataSet);
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
    procedure srcTituloTiposStateChange(Sender: TObject);
    procedure pmQtdPopup(Sender: TObject);
    procedure qyTituloTiposCalcFields(DataSet: TDataSet);
    procedure qyTituloTiposAfterInsert(DataSet: TDataSet);
    procedure dbCodigoKeyPress(Sender: TObject; var Key: Char);
    procedure dbCodigoExit(Sender: TObject);
    procedure carregaServicosTitulos();
    procedure liberaObjetos();
    procedure procuraServitoTitulo();
    procedure Filtrar();
  private
    { Private declarations }
    ordem: String;
    
    procedure DesativarOutrosTiposTitulo();
  public
    { Public declarations }
  end;

var
  frm_CadTituloTipos: Tfrm_CadTituloTipos;
implementation

uses Main, uDM, uUsuario, uSelConta;

{$R *.dfm}

procedure Tfrm_CadTituloTipos.FormShow(Sender: TObject);
begin
   { Todas em maiúsculas }
   DM.TodasMaiusculas(TForm(Sender));

   qyContas.Close();
   qyContas.ParamByName('cd_coligada_matriz').AsInteger := DM.UsuarioLogado.ColigadaLogada;
   qyContas.Open();

   qyContasCancel.Close();
   qyContasCancel.ParamByName('cd_coligada_matriz').AsInteger := DM.UsuarioLogado.ColigadaLogada;
   qyContasCancel.Open();

   ordem := 'ds_tipo_titulo';

   qyTituloTipos.ParamByName('CD_COLIGADA_MATRIZ').AsInteger := DM.UsuarioLogado.ColigadaLogada;
   qyTituloTipos.Open;
   sn_ativo.ItemIndex := 0;
   
   Self.carregaServicosTitulos();
   Self.procuraServitoTitulo();
end;

procedure Tfrm_CadTituloTipos.liberaObjetos;
var
   i: integer;
begin
   //libera a lista de tipos de titulos
   for i := cmbServicosTitulos.Items.Count - 1 downto 0 do
   begin
      (cmbServicosTitulos.Items.Objects[i] as TItemCombo).Free;
   end;
   cmbServicosTitulos.Clear;
end;

procedure Tfrm_CadTituloTipos.meDataPadrao2Enter(Sender: TObject);
begin
   if not(qyTituloTipos.State  in [dsInsert,dsEdit]) then
      qyTituloTipos.Edit;
end;

procedure Tfrm_CadTituloTipos.meDataPadraoExit(Sender: TObject);
begin

   if not (qyTituloTipos.State in[dsInsert,dsEdit]) then
      qyTituloTipos.Edit;
      
   if Sender is TDateTimePicker then
   begin
      qyTituloTiposdt_padrao_geracao.AsDateTime := dtpDataPadrao.Date;
   end;

end;

procedure Tfrm_CadTituloTipos.meDataPadraoKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  if (key = VK_DELETE) or (key = VK_BACK)  then begin
    qyTituloTiposdt_padrao_geracao.AsString := '';
  end
  else
  begin
    key := 0;
  end;
end;

procedure Tfrm_CadTituloTipos.meDataPadraoEnter(Sender: TObject);
begin
   if not(qyTituloTipos.State  in [dsInsert,dsEdit]) then
      qyTituloTipos.Edit;
end;

procedure Tfrm_CadTituloTipos.Filtrar;
Var
   ds_filtros, ds_operador : String;
begin
   // Inicializa as variáveis
   ds_filtros  := '';
   ds_operador := '';
   
   case (cbFiltroTipoConta.ItemIndex) of
      1:
         begin
            ds_filtros := ds_filtros + ' ct_tipo_titulo = 1 ';
         end;
      2:
         begin
            ds_filtros := ds_filtros + ' ct_tipo_titulo = 2 ';
         end;   
   end;

   // Add o operador AND no SQL
   if ( ds_filtros <> '' )  then
      ds_operador := ' AND ';
               
   case (sn_ativo.ItemIndex) of
      0 :
         begin
            ds_filtros := ds_filtros + ds_operador + ' sn_ativo = 1 ';
         end;
      1 :
         begin
            ds_filtros := ds_filtros + ds_operador + ' sn_ativo = 0 ';
         end;
   end;

   // Se algo foi filtrado, realiza o filtro
   if ( ds_filtros <> '' )  then
   begin
      qyTituloTipos.Filter := ds_filtros;
      qyTituloTipos.Filtered := True;
   end else 
   begin
      qyTituloTipos.Filtered := False;         
   end;
   
   qyTituloTipos.First;
end;

procedure Tfrm_CadTituloTipos.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
   Self.liberaObjetos();
   Action := caFree;
end;

procedure Tfrm_CadTituloTipos.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
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

procedure Tfrm_CadTituloTipos.btnSairClick(Sender: TObject);
begin
  Close;
end;

procedure Tfrm_CadTituloTipos.btnExcluirClick(Sender: TObject);
var
   qyVerificaExclusao: TUMZQuery;
   inativar: Boolean;
begin
   if not DM.UsuarioLogado.TemPermissao( 2032, npExcluir, True ) then Abort;

   if Mensagem( 'Deseja realmente excluir ?', Application.Title,
      MB_YESNO + MB_ICONQUESTION ) = ID_YES then
   begin
      { Gerando LOG de acesso }
      DM.gerar_log_acesso(2106, 'N', 'N', 'N', 'S');

      inativar := false;
      
      dm.CriarConsulta(qyVerificaExclusao);

      //Verifica se o plano possui uma mensalidade
      qyVerificaExclusao.SQL.Text := ''+
      'SELECT count(cd_mensalidade) as qtd ' +
      'FROM mensalidades ' +
      'WHERE cd_tipo_titulo = :titulo';

      qyVerificaExclusao.ParamByName('titulo').asInteger :=
         qyTituloTiposcd_tipo_titulo.AsInteger;

      qyVerificaExclusao.Open;

      if (qyVerificaExclusao.FieldByName('qtd').AsInteger > 0) then
      begin
         inativar := True;
      end;

      //Verifica se o plano possui algum registro vínculado em fin_planos_itens
      qyVerificaExclusao.SQL.Text := ''+
      'SELECT count(cd_plano_item) as qtd ' +
      'FROM fin_planos_itens ' +
      'WHERE cd_tipo_parcela = :cd_tipo';

      qyVerificaExclusao.ParamByName('cd_tipo').asInteger :=
         qyTituloTiposcd_tipo_titulo.AsInteger;

      qyVerificaExclusao.Open;

      if (qyVerificaExclusao.FieldByName('qtd').AsInteger > 0) then
      begin
         inativar := True;
      end;

      {Se encontrou alguma mensalidade ou fin_planos_itens vinculado ao plano
      apenas desativa o plano, senão exclui o plano}
      if inativar = True then
      begin
         qyTituloTipos.Edit;
         qyTituloTipossn_ativo.AsInteger := 0;
         qyTituloTipos.Post;

         qyTituloTipos.Refresh;
      end
      else
      begin
         qyTituloTipos.Delete;
      end;

   end;
end;

procedure Tfrm_CadTituloTipos.btnFecharClick(Sender: TObject);
begin
   qyTituloTipos.Close();
   Close();
end;

procedure Tfrm_CadTituloTipos.btnInserirClick(Sender: TObject);
begin
   DBEdit1.SetFocus();
   qyTituloTipos.Insert();
end;

procedure Tfrm_CadTituloTipos.btnAlterarClick(Sender: TObject);
begin
   DBEdit1.SetFocus();
   qyTituloTipos.Edit();
end;

procedure Tfrm_CadTituloTipos.btnSalvarClick(Sender: TObject);
Var
  reg: integer;
begin
  reg := qyTituloTipos.FieldByName('cd_tipo_titulo').AsInteger;

  { Gerando LOG de acesso }
  if qyTituloTipos.State in [dsInsert] then
   DM.gerar_log_acesso(2106, 'N', 'S', 'N', 'N')
  else
   DM.gerar_log_acesso(2106, 'N', 'N', 'S', 'N');

  qyTituloTiposcd_coligada_matriz.AsInteger := DM.UsuarioLogado.ColigadaLogada;

  qyTituloTipos.Post();
  qyTituloTipos.Close();
  qyTituloTipos.Open();
  qyTituloTipos.Locate('cd_tipo_titulo', reg, []);
end;

procedure Tfrm_CadTituloTipos.carregaServicosTitulos;
var
   qyServicoTitulo   : TUMZReadOnlyQuery;
   objItem           : TItemCombo;
   cd_codigo         : string;
   ds_descricao      : string;
begin
   DM.CriarConsulta( qyServicoTitulo );
   qyServicoTitulo.Close();
   qyServicoTitulo.SQL.Clear;
   qyServicoTitulo.SQL.Add('SELECT cd_nfe_g2ka_servicos_titulos, ');
   if ( DM.db.Protocol = DB_PROTOCOL_ORACLE ) then
      qyServicoTitulo.SQL.Add(' CONCAT(ds_item_servico , '' - '' || ds_descricao_servico) ds_descricao_servico        ')
   else
      qyServicoTitulo.SQL.Add(' CONCAT(ds_item_servico,'' - '',ds_descricao_servico) ds_descricao_servico        ');
   qyServicoTitulo.SQL.Add('FROM                                           ');
   qyServicoTitulo.SQL.Add(' fin_nfe_g2ka_servicos_titulos                 ');
   qyServicoTitulo.Open();

   objItem := TItemCombo.Create( '0', 'Não' );
   cmbServicosTitulos.Items.AddObject( objItem.getDescricao, objItem );
   
   while not qyServicoTitulo.Eof do
   begin
      cd_codigo      := qyServicoTitulo.FieldByName('cd_nfe_g2ka_servicos_titulos').AsString;
      ds_descricao   := qyServicoTitulo.FieldByName('ds_descricao_servico').AsString;

      objItem := TItemCombo.Create( cd_codigo, ds_descricao );

      cmbServicosTitulos.Items.AddObject( objItem.getDescricao, objItem );

      qyServicoTitulo.Next;
   end;

   FreeAndNil( qyServicoTitulo );
end;

procedure Tfrm_CadTituloTipos.cbFiltroTipoContaChange(Sender: TObject);
begin
   Filtrar();
end;

procedure Tfrm_CadTituloTipos.cmbServicosTitulosClick(Sender: TObject);
begin
   qyTituloTiposcd_nfe_g2ka_servico_titulo.AsString := (cmbServicosTitulos.Items.Objects[cmbServicosTitulos.itemIndex] as TItemCombo).getCodigo()
end;

procedure Tfrm_CadTituloTipos.btnCancelarClick(Sender: TObject);
begin
   qyTituloTipos.Cancel();
end;

procedure Tfrm_CadTituloTipos.sbContaClick(Sender: TObject);
begin
   // Seleção de Plano de Contas
   if not (qyTituloTipos.State in [dsInsert, dsEdit]) then
   begin
      qyTituloTipos.Edit;
   end;

   frm_SelConta.SomenteAnalitico := True;
   frm_SelConta.ShowModal;

   if frm_SelConta.flgSearch then
   begin
      qyTituloTiposcd_conta.AsInteger := frm_SelConta.qyPlanosContascd_conta.AsInteger;
   end;
end;

procedure Tfrm_CadTituloTipos.SpeedButton1Click(Sender: TObject);
begin
   // Seleção de Plano de Contas
   if not (qyTituloTipos.State in [dsInsert, dsEdit]) then
   begin
      qyTituloTipos.Edit;
   end;

   frm_SelConta.SomenteAnalitico := True;
   frm_SelConta.ShowModal;

   if frm_SelConta.flgSearch then
   begin
      qyTituloTiposcd_conta_debito.AsInteger := frm_SelConta.qyPlanosContascd_conta.AsInteger;
   end;
end;

procedure Tfrm_CadTituloTipos.SpeedButton2Click(Sender: TObject);
begin
   // Seleção de Plano de Contas
   if not (qyTituloTipos.State in [dsInsert, dsEdit]) then
   begin
     qyTituloTipos.Edit;
   end;

   frm_SelConta.SomenteAnalitico := True;
   frm_SelConta.ShowModal;

   if frm_SelConta.flgSearch then
   begin
      qyTituloTiposcd_conta_cancel.AsInteger := frm_SelConta.qyPlanosContascd_conta.AsInteger;
   end;
end;

procedure Tfrm_CadTituloTipos.srcTituloTiposDataChange(Sender: TObject;
  Field: TField);
begin
   procuraServitoTitulo();
end;

procedure Tfrm_CadTituloTipos.srcTituloTiposStateChange(Sender: TObject);
begin

    { Somente digitar o código na inclusão }
    dbCodigo.Enabled := (qyTituloTipos.State = dsInsert);

    btnInserir.Enabled := not (qyTituloTipos.State in [dsInsert, dsEdit]);
    btnAlterar.Enabled := not (qyTituloTipos.State in [dsInsert, dsEdit]);
    btnExcluir.Enabled := not (qyTituloTipos.State in [dsInsert, dsEdit]);
    btnSalvar.Enabled := qyTituloTipos.State in [dsInsert, dsEdit];
    btnCancelar.Enabled := qyTituloTipos.State in [dsInsert, dsEdit];
    btnFechar.Enabled := not (qyTituloTipos.State in [dsInsert, dsEdit]);

    cmbServicosTitulos.Enabled := (qyTituloTipos.State in [dsInsert, dsEdit]);
end;

procedure Tfrm_CadTituloTipos.pmQtdPopup(Sender: TObject);
begin
  DM.quantidade_registros(qyTituloTipos, pmQtd);
end;

procedure Tfrm_CadTituloTipos.procuraServitoTitulo;
var
   i                 : integer;
   bEncontrou        : Boolean;
   cd_servico_titulo : string;
begin

   cd_servico_titulo := qyTituloTipos.FieldByName('cd_nfe_g2ka_servico_titulo').AsString;
   bEncontrou        := false;

   if  (cd_servico_titulo <> '0') and (cd_servico_titulo <> '')  then
   begin

      for i := 0 to cmbServicosTitulos.Items.Count - 1 do
      begin
         if ( (cmbServicosTitulos.Items.Objects[i] as TItemCombo).getCodigo = cd_servico_titulo ) then
         begin
            cmbServicosTitulos.ItemIndex   := i;
            bEncontrou := true;
            break;
         end;
      end;
   end;

   if (bEncontrou = false) then
   begin
      cmbServicosTitulos.ItemIndex   := 0;
   end;
end;

procedure Tfrm_CadTituloTipos.qyTituloTiposCalcFields(DataSet: TDataSet);
begin

  if qyTituloTipos.FieldByName('ct_tipo_titulo').AsInteger = 1 then
    qyTituloTipos.FieldByName('ds_ct_tipo_titulo').AsString := 'CR'
   else
    qyTituloTipos.FieldByName('ds_ct_tipo_titulo').AsString := 'CP';

end;

procedure Tfrm_CadTituloTipos.sn_ativoClick(Sender: TObject);
begin
   Filtrar();
end;

procedure Tfrm_CadTituloTipos.qyTituloTiposAfterInsert(DataSet: TDataSet);
begin
   qyTituloTipos.FieldByName('cd_tipo_titulo').AsInteger :=
      DM.ProximoId2( 'cd_tipo_titulo', 'cd_coligada_matriz', 'fin_config_tipos_titulo',
                     DM.UsuarioLogado.ColigadaLogada );
end;

procedure Tfrm_CadTituloTipos.qyTituloTiposAfterPost(DataSet: TDataSet);
var
   titulo : Pointer;
begin
   if qyTituloTiposcd_padrao.AsInteger = 1 then
   begin
      DesativarOutrosTiposTitulo();

      titulo := qyTituloTipos.GetBookmark;

      qyTituloTipos.Close();
      qyTituloTipos.Open();

      qyTituloTipos.GotoBookmark(titulo);
   end;
end;

procedure Tfrm_CadTituloTipos.dbCodigoKeyPress(Sender: TObject;
  var Key: Char);
begin
   if Key = #13 then
   begin
       SelectNext(Sender as TWincontrol, True, True);
       Key := #0;
   end;
end;

procedure Tfrm_CadTituloTipos.DBEdit3KeyPress(Sender: TObject; var Key: Char);
begin
   //Se for . transforma para virgula
   if(Key in['.']) then
   begin
      Key :=  ',';
   end;
end;

procedure Tfrm_CadTituloTipos.DBEdit7KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin

      
    if (key = VK_DELETE) or (key = VK_BACK)  then begin
        if not (qyTituloTipos.State in[dsInsert,dsEdit]) then
           qyTituloTipos.Edit;
           
      qyTituloTiposdt_padrao_geracao.AsString:='';
    end
    else
    begin
      key := 0;
    end;
end;

procedure Tfrm_CadTituloTipos.DesativarOutrosTiposTitulo;
const
   SQL_DESATIVAR_OUTROS_TIPOS_TITULO =
      ' UPDATE fin_config_tipos_titulo SET cd_padrao = 0 ' +
      ' WHERE cd_tipo_titulo <> :cd_tipo_titulo AND ' +
      '       cd_coligada_matriz = :cd_coligada_matriz AND ' +
      '       ct_tipo_titulo = :ct_tipo_titulo ';
var
   qyAlteraTipoTituloPadrao : TUMZQuery;
begin
   DM.CriarConsulta(qyAlteraTipoTituloPadrao);

   qyAlteraTipoTituloPadrao.SQL.Text := SQL_DESATIVAR_OUTROS_TIPOS_TITULO;
   qyAlteraTipoTituloPadrao.ParamByName('cd_tipo_titulo').AsInteger := qyTituloTiposcd_tipo_titulo.AsInteger;
   qyAlteraTipoTituloPadrao.ParamByName('cd_coligada_matriz').AsInteger := qyTituloTiposcd_coligada_matriz.AsInteger;
   qyAlteraTipoTituloPadrao.ParamByName('ct_tipo_titulo').AsInteger := qyTituloTiposct_tipo_titulo.AsInteger;

   qyAlteraTipoTituloPadrao.ExecSQL();
   FreeAndNil(qyAlteraTipoTituloPadrao);
end;

procedure Tfrm_CadTituloTipos.dtpDataPadraoChange(Sender: TObject);
begin
   if not (qyTituloTipos.State in[dsInsert,dsEdit]) then
      qyTituloTipos.Edit;
   if Sender is TDateTimePicker then
   begin
      qyTituloTiposdt_padrao_geracao.AsDateTime := dtpDataPadrao.Date;
   end;
end;

procedure Tfrm_CadTituloTipos.dbCodigoChange(Sender: TObject);
begin
   if qyTituloTiposdt_padrao_geracao.AsDateTime <> 0 then begin
      dtpDataPadrao.Date := qyTituloTiposdt_padrao_geracao.AsDateTime;
   end
   else
   begin
      dtpDataPadrao.DateTime := now();
   end;
end;

procedure Tfrm_CadTituloTipos.dbCodigoExit(Sender: TObject);
var
   intCod : Integer;
   qyTemTipoTitulo : TUMZReadOnlyQuery;
begin
   if not (qyTituloTipos.State = dsInsert) then
      Exit;

   if qyTituloTipos.FieldByName('cd_tipo_titulo').AsString = '' then
   begin
      qyTituloTipos.Cancel;
      Exit;
   end;

   intCod := qyTituloTipos.FieldByName('cd_tipo_titulo').AsInteger;

   DM.CriarConsulta(qyTemTipoTitulo);

   qyTemTipoTitulo.SQL.Text := 'SELECT * FROM fin_config_tipos_titulo WHERE cd_tipo_titulo = :cd_tipo_titulo';
   qyTemTipoTitulo.ParamByName('cd_tipo_titulo').AsInteger := intCod;
   qyTemTipoTitulo.Open;

   if not qyTemTipoTitulo.Eof then
   begin
       qyTituloTipos.Cancel;
       qyTituloTipos.Locate('cd_tipo_titulo', intCod, []);
   end;

   FreeAndNil(qyTemTipoTitulo);

   btnAlterarClick(nil); 

end;

procedure Tfrm_CadTituloTipos.qyTituloTiposBeforeEdit(DataSet: TDataSet);
begin
   if not DM.UsuarioLogado.TemPermissao( 2032, npAlterar, True ) then Abort;
end;

procedure Tfrm_CadTituloTipos.qyTituloTiposBeforeInsert(DataSet: TDataSet);
begin
   if not DM.UsuarioLogado.TemPermissao( 2032, npIncluir, True ) then Abort;
end;

procedure Tfrm_CadTituloTipos.qyTituloTiposBeforePost(DataSet: TDataSet);
begin
   if (qyTituloTiposct_tipo_titulo.AsInteger = 1) AND (qyTituloTiposcd_conta.AsInteger = 0) then begin
      Mensagem('É necessário selecionar uma Conta para um tipo de título do Contas a Receber.', 'Atenção', MB_OK + MB_ICONWARNING );
      Abort;
   end;
end;

end.

