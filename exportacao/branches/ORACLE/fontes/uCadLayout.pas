unit uCadLayout;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  DB, ZAbstractRODataset, ZAbstractDataset, ZDataset,DBTables, DBCtrls, Buttons, Grids, DBGrids, ExtCtrls, General,
  StdCtrls, Mask, ComCtrls, ImgList, ToolWin, Menus, dblookup, UZDataset, uUsuario;

type
  TfCadLayout = class(TForm)
    pnTitulo: TPanel;
    bvEspaco: TBevel;
    pcCadastro: TPageControl;
    tsLayout: TTabSheet;
    tsItens: TTabSheet;
    pnConteudo: TPanel;
    Bevel1: TBevel;
    Panel2: TPanel;
    pnAnoSemestre: TPanel;
    Panel3: TPanel;
    grd: TDBGrid;
    Panel1: TPanel;
    Panel6: TPanel;
    Panel7: TPanel;
    ilAcoes: TImageList;
    toolPessoa: TToolBar;
    tlbSep1: TToolButton;
    dbNav: TDBNavigator;
    tlbSep2: TToolButton;
    btnInserir: TToolButton;
    btnAlterar: TToolButton;
    btnExcluir: TToolButton;
    tlbSep3: TToolButton;
    btnSalvar: TToolButton;
    btnCancelar: TToolButton;
    tlbSep4: TToolButton;
    btnFechar: TToolButton;
    tlbSep5: TToolButton;
    Panel4: TPanel;
    Bevel2: TBevel;
    Panel5: TPanel;
    Panel8: TPanel;
    Panel9: TPanel;
    DBGrid1: TDBGrid;
    Panel10: TPanel;
    Panel11: TPanel;
    Panel12: TPanel;
    Label4: TLabel;
    DBEdit3: TDBEdit;
    Label8: TLabel;
    tsEspec: TTabSheet;
    qyLayouts: TUMZQuery;
    dsLayouts: TDataSource;
    qyItensFiltro: TUMZQuery;
    qyLayoutItens: TUMZQuery;
    dsItensFiltro: TDataSource;
    dsLayoutItens: TDataSource;
    dsConsultas: TDataSource;
    cbItensConsulta: TDBLookupComboBox;
    Panel13: TPanel;
    Bevel3: TBevel;
    Panel14: TPanel;
    Panel15: TPanel;
    Panel16: TPanel;
    DBGrid2: TDBGrid;
    Panel17: TPanel;
    Panel18: TPanel;
    Panel19: TPanel;
    Label9: TLabel;
    DBEdit1: TDBEdit;
    pgTurmas: TPageControl;
    tsObs: TTabSheet;
    DBMemo1: TDBMemo;
    TabSheet1: TTabSheet;
    Memo1: TMemo;
    Panel26: TPanel;
    Panel20: TPanel;
    PageControl1: TPageControl;
    tsFiltroCampos: TTabSheet;
    TabSheet3: TTabSheet;
    Memo2: TMemo;
    DBCheckBox1: TDBCheckBox;
    Label3: TLabel;
    dbEdItemOrdem: TDBEdit;
    Panel21: TPanel;
    Panel22: TPanel;
    Panel23: TPanel;
    dgListaFiltros: TDBGrid;
    Label19: TLabel;
    pmFuncoes: TPopupMenu;
    qyRConsultas: TUMZQuery;
    DBEdit6: TDBEdit;
    Label7: TLabel;
    Label5: TLabel;
    DBEdit7: TDBEdit;
    Label10: TLabel;
    DBEdit8: TDBEdit;
    Panel24: TPanel;
    PageControl2: TPageControl;
    TabSheet2: TTabSheet;
    DBMemo2: TDBMemo;
    TabSheet4: TTabSheet;
    Memo3: TMemo;
    Panel25: TPanel;
    Label11: TLabel;
    btnCampos: TBitBtn;
    btnFuncoes: TBitBtn;
    btnLimpar: TBitBtn;
    udItemOrdem: TUpDown;
    dbEdEspecFiltro: TDBEdit;
    udEspecOrdem: TUpDown;
    Label12: TLabel;
    qyRConsultasnm_consulta: TStringField;
    qyRConsultasds_consulta: TStringField;
    qyItensFiltrocd_layout_filtro: TLargeintField;
    qyItensFiltrods_ligacao: TStringField;
    qyItensFiltrods_grupo1: TStringField;
    qyItensFiltrods_campo: TStringField;
    qyItensFiltrods_operador: TStringField;
    qyItensFiltrods_valor: TStringField;
    qyItensFiltrods_grupo2: TStringField;
    qyItensFiltronr_ordem: TLargeintField;
    qyRFormatos: TUMZQuery;
    StringField3: TStringField;
    StringField4: TStringField;
    dsRFormatos: TDataSource;
    qyRFilLigacao: TUMZQuery;
    dsRFilLigacao: TDataSource;
    qyRFilLigacaods_sigla: TStringField;
    qyRFilLigacaods_valor: TStringField;
    qyItensFiltrolk_ligacao: TStringField;
    qyRFilOper: TUMZQuery;
    StringField1: TStringField;
    StringField2: TStringField;
    dsRFilOper: TDataSource;
    qyItensFiltrolk_operador: TStringField;
    qyItensFiltrosn_fixo: TSmallintField;
    qyItensEspec: TUMZQuery;
    dsItensEspec: TDataSource;
    qyLayoutItensnm_consulta: TStringField;
    qyLayoutItensds_item: TStringField;
    qyLayoutItensnr_ordem: TLargeintField;
    qyLayoutItenssn_ativo: TSmallintField;
    qyItensEspecds_descricao: TStringField;
    qyItensEspecnr_tamanho: TLargeintField;
    qyItensEspecchr_preenche: TStringField;
    qyItensEspecnr_ordem: TLargeintField;
    qyREspecTipos: TUMZQuery;
    dsREspecTipos: TDataSource;
    Label13: TLabel;
    cbEspecTipo: TDBLookupComboBox;
    qyItensEspecds_valor: TMemoField;
    DBEdit5: TDBEdit;
    Label14: TLabel;
    qyItensEspecvalor: TStringField;
    N1: TMenuItem;
    Label15: TLabel;
    DBLookupComboBox1: TDBLookupComboBox;
    qyRPosicoes: TUMZQuery;
    dsRPosicoes: TDataSource;
    Label16: TLabel;
    DBEdit9: TDBEdit;
    Label17: TLabel;
    DBLookupComboBox2: TDBLookupComboBox;
    qyRItensPai: TUMZQuery;
    dsRItensPai: TDataSource;
    qyRItensPaids_item: TStringField;
    qyLayoutItenschr_separador: TStringField;
    btnImpLayout: TToolButton;
    btnExpLayout: TToolButton;
    qyRExpo: TUMZQuery;
    qyLayoutsds_layout: TStringField;
    qyLayoutsme_layout: TBlobField;
    qyLayoutscd_formato: TIntegerField;
    qyLayoutssn_ativo: TSmallintField;
    qyItensEspecchr_posicao: TIntegerField;
    qyItensEspeccd_tipo: TIntegerField;
    qyRPosicoescd_situacao: TIntegerField;
    qyRPosicoesds_valor: TStringField;
    qyREspecTiposcd_situacao: TIntegerField;
    qyREspecTiposds_valor: TStringField;
    qyLayoutscd_layout: TIntegerField;
    qyLayoutItenscd_layout_item: TIntegerField;
    qyLayoutItenscd_layout: TIntegerField;
    qyLayoutItenscd_layout_item_pai: TIntegerField;
    qyItensEspeccd_item: TIntegerField;
    qyRItensPaicd_layout_item: TIntegerField;
    qyItensFiltrocd_item: TLargeintField;
    qyItensEspeccd_layout_espec: TIntegerField;
    tsConsultas: TTabSheet;
    TabSheet5: TTabSheet;
    DBMemo3: TDBMemo;
    DBMemo4: TDBMemo;
    qyLayoutItensme_sqls_antes: TMemoField;
    qyLayoutItensme_sqls_depois: TMemoField;
    qyItensFiltrods_chave: TStringField;
    qyItensFiltrods_dialogo: TStringField;
    qyLayoutsnm_arquivo_padrao: TStringField;
    qyItensFiltrods_tipo: TStringField;
    qyRFilTipo: TUMZQuery;
    StringField5: TStringField;
    StringField6: TStringField;
    dsRFilTipo: TDataSource;
    qyItensFiltrodescTipo: TStringField;
    qyLayoutssn_exportacao: TSmallintField;
    qyLayoutsSN_USAR_CH_SIT: TSmallintField;
    Panel27: TPanel;
    Label2: TLabel;
    DBEdit2: TDBEdit;
    DBCheckBox2: TDBCheckBox;
    DBCheckBox3: TDBCheckBox;
    pnEscondeUsaAnosemestre: TPanel;
    Panel29: TPanel;
    DBCheckBox5: TDBCheckBox;
    Panel30: TPanel;
    Label6: TLabel;
    DBEdit4: TDBEdit;
    Label1: TLabel;
    cbLkFormato: TDBLookupComboBox;
    DBCheckBox4: TDBCheckBox;
    Label18: TLabel;
    DBEdit10: TDBEdit;
    qyLayoutsSN_USAR_ANOSEMESTRE: TSmallintField;
    procedure DBCheckBox2Click(Sender: TObject);
    procedure dsLayoutsDataChange(Sender: TObject; Field: TField);
    procedure btnExpLayoutClick(Sender: TObject);
    procedure qyItensEspecBeforeClose(DataSet: TDataSet);
    procedure qyLayoutItensBeforeClose(DataSet: TDataSet);
    procedure FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure DBMemo2KeyPress(Sender: TObject; var Key: Char);
    procedure btnLimparClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure btnFuncoesClick(Sender: TObject);
    procedure MenuItemClick(Sender: TObject);
    procedure DBMemo2DragDrop(Sender, Source: TObject; X, Y: Integer);
    procedure DBMemo2DragOver(Sender, Source: TObject; X, Y: Integer;
      State: TDragState; var Accept: Boolean);
    procedure btnCamposClick(Sender: TObject);
    procedure udEspecOrdemClick(Sender: TObject; Button: TUDBtnType);
    procedure qyItensEspecCalcFields(DataSet: TDataSet);
    procedure qyItensEspecBeforePost(DataSet: TDataSet);
    procedure qyLayoutItensBeforePost(DataSet: TDataSet);
    procedure udItemOrdemClick(Sender: TObject; Button: TUDBtnType);
    procedure dsItensEspecStateChange(Sender: TObject);
    procedure dsLayoutItensStateChange(Sender: TObject);
    procedure pcCadastroChanging(Sender: TObject; var AllowChange: Boolean);
    procedure dsLayoutsStateChange(Sender: TObject);
    procedure btnFecharClick(Sender: TObject);
    procedure btnSalvarClick(Sender: TObject);
    procedure btnCancelarClick(Sender: TObject);
    procedure btnExcluirClick(Sender: TObject);
    procedure btnAlterarClick(Sender: TObject);
    procedure btnInserirClick(Sender: TObject);
    procedure qyItensEspecAfterOpen(DataSet: TDataSet);
    procedure DBEdit7KeyPress(Sender: TObject; var Key: Char);
    procedure qyItensFiltroBeforePost(DataSet: TDataSet);
    procedure qyItensFiltroAfterOpen(DataSet: TDataSet);
    procedure dgListaFiltrosEditButtonClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormShow(Sender: TObject);
    procedure qyLayoutItensAfterOpen(DataSet: TDataSet);
    procedure qyLayoutsAfterOpen(DataSet: TDataSet);
    procedure pcCadastroChange(Sender: TObject);
    procedure DBEdit2KeyPress(Sender: TObject; var Key: Char);
  private
    bkEspec: Pointer;
    bkItens: Pointer;

    procedure AtualizaToolbar(bEnabled: Boolean = True);
    procedure CarregaMenuCampos();
    procedure ExportaLayoutParaArquivo();

    { Private declarations }
  public
    { Public declarations }
  end;

var
  fCadLayout: TfCadLayout;

implementation

{$R *.DFM}
uses
   uDM, uListaCampos, uClassesUteis, uMForms, uMain, uScriptFunctions, IniFiles;



{ TfCadLayout }

procedure TfCadLayout.DBCheckBox2Click(Sender: TObject);
begin
   DBCheckBox3.Enabled := DBCheckBox2.Checked;
   DBCheckBox5.Enabled := DBCheckBox2.Checked;
end;

procedure TfCadLayout.DBEdit2KeyPress(Sender: TObject; var Key: Char);
begin
   if not (Key in ['0'..'9']) then begin
      Key := #0;
   end;
end;

procedure TfCadLayout.pcCadastroChange(Sender: TObject);
begin
   if (pcCadastro.ActivePage = tsLayout) then begin
      pnTitulo.Caption := 'CADASTRO DE LAYOUT';
      dbNav.DataSource := dsLayouts;
   end
   else if (pcCadastro.ActivePage = tsItens) then begin
      pnTitulo.Caption := 'CADASTRO DOS ITENS DO LAYOUT - ' + qyLayouts.FieldByName('ds_layout').AsString;
      dbNav.DataSource := dsLayoutItens;
   end
   else if (pcCadastro.ActivePage = tsEspec) then begin
      pnTitulo.Caption := 'CADASTRO DA ESPECIFICAÇÃO DO LAYOUT - ' + qyLayoutItensds_item.AsString;
      dbNav.DataSource := dsItensEspec;
   end;
end;

procedure TfCadLayout.qyLayoutsAfterOpen(DataSet: TDataSet);
begin
   qyLayoutItens.Close();
   qyLayoutItens.Open();
end;

procedure TfCadLayout.qyLayoutItensAfterOpen(DataSet: TDataSet);
begin
   if (qyLayoutItens.BookmarkValid(bkItens)) then begin
      qyLayoutItens.GotoBookmark(bkItens);
   end;
   bkItens := nil;
   qyItensEspec.Close();
   qyItensEspec.Open();
   qyRConsultas.Close();
   qyRConsultas.Open();
   qyItensFiltro.Close();
   qyItensfiltro.Open();
   qyRItensPai.Close();
   qyRItensPai.Open();
end;

procedure TfCadLayout.FormShow(Sender: TObject);
begin
   qyLayouts.Open();
   pcCadastro.ActivePage := tsLayout;
end;

procedure TfCadLayout.FormClose(Sender: TObject; var Action: TCloseAction);
begin
   Action := caFree;
end;

procedure TfCadLayout.dgListaFiltrosEditButtonClick(Sender: TObject);
var
   mg: TDBGrid;
   Item: TItem;
begin
   mg := TDBGrid(Sender);
   if not (ProcuraForm(fMain, fListaCampos)) then begin
      Application.CreateForm(TfListaCampos, fListaCampos);
   end;
   Item := fListaCampos.ListaCamposModal(qyLayoutItensnm_consulta.AsString);
   if not (Item = nil) then begin
      if (Item.getValor() = '') then begin
          Mensagem('Somente Campos são Permitidos!!');
      end
      else begin
         if not (qyItensFiltro.State in [dsInsert, dsEdit]) then begin
            qyItensFiltro.Insert();
         end;
            //ShowMessage(InttoStr(mg.));
         mg.SelectedField.AsString := Item.getNome() + '.' + Item.GetValor();
      end;
   end;
end;

procedure TfCadLayout.qyItensFiltroAfterOpen(DataSet: TDataSet);
begin
   qyRFilLigacao.Close();
   qyRFilLigacao.Open();
   qyRFilOper.Close();
   qyRFilOper.Open();
   qyRFilTipo.Close();
   qyRFilTipo.Open();
end;

procedure TfCadLayout.qyItensFiltroBeforePost(DataSet: TDataSet);
begin
   if (qyLayoutItens.State in [dsInsert]) then begin
      if qyLayoutItenscd_layout_item.IsNull then begin
         qyLayoutItenscd_layout_item.AsInteger := (DM.getContaRegistros('expo_layout_itens', 'cd_layout ='+ qyLayoutscd_layout.AsString)+1);
      end;
   end;
   qyItensFiltrocd_item.AsInteger := qyLayoutItenscd_layout_item.AsInteger;
   if (qyItensFiltro.State in [dsInsert]) then begin
      qyItensFiltronr_ordem.AsInteger := (DM.GetMax('expo_layout_filtros', 'nr_ordem', 'cd_item = ' + qyLayoutItenscd_layout_item.AsString)+1);
   end;
end;

procedure TfCadLayout.DBEdit7KeyPress(Sender: TObject; var Key: Char);
begin
   if (Key < #32) then begin
       Exit;
   end;
   if not (Key in ['0'..'9']) then begin
      Key := #0;
   end;
end;

procedure TfCadLayout.qyItensEspecAfterOpen(DataSet: TDataSet);
begin
   qyREspecTipos.Close();
   qyREspecTipos.Open();
   qyRPosicoes.Close();
   qyRPosicoes.Open();
   if qyItensEspec.BookmarkValid(bkEspec) then begin
      qyItensEspec.GotoBookmark(bkEspec);
   end;
   bkEspec := nil;
end;

procedure TfCadLayout.btnInserirClick(Sender: TObject);
begin

   if not (DM.GetUsuarioLogado.TemPermissao(12003, npIncluir, True)) then begin
      Exit;
   end;

   if pcCadastro.ActivePage = tsLayout then begin
      qyLayouts.Last();
      qyLayouts.Insert();

   end
   else if pcCadastro.ActivePage = tsItens then begin
      if qyLayouts.RecordCount > 0 then begin
         qyLayoutItens.Last();
         qyLayoutItens.Insert();
         qyLayoutItenscd_layout.AsInteger := qyLayoutscd_layout.AsInteger;
      end;
   end
   else if pcCadastro.ActivePage = tsEspec then begin
      if qyLayouts.RecordCount > 0 then begin
         qyItensEspec.Last();
         qyItensEspec.Insert();
         qyItensEspeccd_item.AsInteger := qyLayoutItenscd_layout_item.AsInteger;
         qyItensEspeccd_tipo.AsInteger := 0;
         qyItensEspecnr_tamanho.AsInteger := 1;
         qyItensEspecchr_preenche.AsString := '';
      end;
   end;
end;

procedure TfCadLayout.btnAlterarClick(Sender: TObject);
begin
   if not (DM.GetUsuarioLogado.TemPermissao(12003, npAlterar, True)) then begin
      Exit;
   end;
   if pcCadastro.ActivePage = tsLayout then begin
      if qyLayouts.RecordCount > 0 then begin
         qyLayouts.Edit();
      end;
   end
   else if pcCadastro.ActivePage = tsItens then begin
      if qyLayoutItens.RecordCount > 0 then begin
         qyLayoutItens.Edit();
      end;
   end
   else if pcCadastro.ActivePage = tsEspec then begin
      if qyItensEspec.RecordCount > 0 then begin
         qyItensEspec.Edit();
      end;
   end;
end;

procedure TfCadLayout.btnExcluirClick(Sender: TObject);
var
   sMsg: string;
begin
   if not (DM.GetUsuarioLogado.TemPermissao(12003, npExcluir, True)) then begin
      Exit;
   end;
   //verifica acesso
   sMsg := 'CUIDADO!!!!' + #13 + #13;
   sMsg := sMsg + 'Apagando este item você estará apagando também todos os ';
   sMsg := sMsg + 'dados relativos à ele!! ' + #13 + #13;
   sMsg := sMsg + 'TEM CERTEZA QUE DESEJA APAGAR?? ' + #13 + #13;

   if (Mensagem(sMsg, 'Atenção!', MB_ICONQUESTION + MB_YESNO, Self.Handle) = mrYes) then begin
      if pcCadastro.ActivePage = tsLayout then begin
         DM.apagaRegistros('expo_layout_espec ele INNER JOIN expo_layout_itens eli ON (eli.cd_layout_item = ele.cd_item) ', 'eli.cd_layout = ' + qyLayoutscd_layout.AsString + '');
         DM.apagaRegistros('expo_layout_filtros elf INNER JOIN expo_layout_itens eli ON (eli.cd_layout_item = elf.cd_item) ', 'eli.cd_layout = ' + qyLayoutscd_layout.AsString + '');
         DM.apagaRegistros('expo_layout_itens', 'cd_layout = ' + qyLayoutscd_layout.AsString + '');
         qyLayouts.Delete();
      end
      else if pcCadastro.ActivePage = tsItens then begin
         DM.apagaRegistros('expo_layout_filtros', 'cd_item = ' + qyLayoutItenscd_layout_item.AsString + '');
         DM.apagaRegistros('expo_layout_espec', 'cd_item = ' + qyLayoutItenscd_layout_item.AsString + '');
         qyLayoutItens.Delete();
      end
      else if pcCadastro.ActivePage = tsEspec then begin
         qyItensEspec.Delete();
      end;
   end;

end;

procedure TfCadLayout.btnCancelarClick(Sender: TObject);
begin
   if pcCadastro.ActivePage = tsLayout then begin
      qyLayouts.Cancel();
   end
   else if pcCadastro.ActivePage = tsItens then begin
      qyLayoutItens.Cancel();
   end
   else if pcCadastro.ActivePage = tsEspec then begin
      qyItensEspec.Cancel();
   end;
end;

procedure TfCadLayout.btnSalvarClick(Sender: TObject);
begin
   if pcCadastro.ActivePage = tsLayout then begin
      qyLayouts.Post();
   end
   else if pcCadastro.ActivePage = tsItens then begin
      qyLayoutItens.Post();
      qyLayoutItens.Close();
      qyLayoutItens.Open();
   end
   else if pcCadastro.ActivePage = tsEspec then begin
      qyItensEspec.Post();
      qyItensEspec.Close();
      qyItensEspec.Open();
    end;
end;

procedure TfCadLayout.btnFecharClick(Sender: TObject);
begin
   Close();
end;

procedure TfCadLayout.dsLayoutsDataChange(Sender: TObject; Field: TField);
begin
   DBCheckBox3.Enabled := ( qyLayoutssn_exportacao.AsInteger = 1 );
   DBCheckBox5.Enabled := ( qyLayoutssn_exportacao.AsInteger = 1 );
end;

procedure TfCadLayout.dsLayoutsStateChange(Sender: TObject);
var
   bBrowse: Boolean;
begin
   bBrowse :=  not (qyLayouts.State in [dsInsert, dsEdit]);

   if pcCadastro.ActivePage = tsLayout then begin
      AtualizaToolbar(bBrowse);
      dbNav.Enabled := not bBrowse;
   end;
   cbLkFormato.Enabled :=not bBrowse;

end;

procedure TfCadLayout.AtualizaToolbar(bEnabled: Boolean);
begin
   btnInserir.Enabled := bEnabled;
   btnAlterar.Enabled := bEnabled;
   btnExcluir.Enabled := bEnabled;
   btnSalvar.Enabled := not bEnabled;
   btnCancelar.Enabled := not bEnabled;
   btnFechar.Enabled := bEnabled;
end;

procedure TfCadLayout.pcCadastroChanging(Sender: TObject;
  var AllowChange: Boolean);
begin
   AllowChange := True;
   if pcCadastro.ActivePage = tsLayout then begin
      if (qyLayouts.State in [dsInsert, dsEdit]) then begin
         Mensagem('Impossível Trocar: Registro em Edição!!');
         AllowChange := False;
         Exit;
      end;

      //verifica se tem algum registro selecionado
      {if ((qyLayouts.RecordCount = 0) and (qyLayouts.RecNo = -1)) then begin
         Mensagem('Impossível Trocar: Selecione um Registro !!');
         AllowChange := False;
         Exit;
      end; }

   end
   else if pcCadastro.ActivePage = tsItens then begin
      if (qyLayoutItens.State in [dsInsert, dsEdit]) then begin
         Mensagem('Impossível Trocar: Registro em Edição!!');
         AllowChange := False;
         Exit;
      end;

      {if ((qyLayoutItens.RecordCount = 0) and (qyLayoutItens.RecNo = -1)) then begin
         Mensagem('Impossível Trocar: Selecione um Registro !!');
         AllowChange := False;
         Exit;
      end;   }
   end
   else if pcCadastro.ActivePage = tsEspec then begin
      if (qyItensEspec.State in [dsInsert, dsEdit]) then begin
         Mensagem('Impossível Trocar: Registro em Edição!!');
         AllowChange := False;
         Exit;
      end;
   end;
end;

procedure TfCadLayout.dsLayoutItensStateChange(Sender: TObject);
var
   bBrowse: Boolean;
begin
   bBrowse :=  not (qyLayoutItens.State in [dsInsert, dsEdit]);

   if pcCadastro.ActivePage = tsItens then begin
      AtualizaToolbar(bBrowse);
      dbNav.Enabled := not bBrowse;
   end;
   udItemOrdem.Enabled := bBrowse;
   cbItensConsulta.Enabled := not bBrowse;
   DBLookupComboBox2.Enabled := not bBrowse;
   dgListaFiltros.Enabled := bBrowse;
end;

procedure TfCadLayout.dsItensEspecStateChange(Sender: TObject);
var
   bBrowse: Boolean;
begin
   bBrowse :=  not (qyItensEspec.State in [dsInsert, dsEdit]);
   if pcCadastro.ActivePage = tsEspec then begin
      AtualizaToolbar(bBrowse);
      dbNav.Enabled := not bBrowse;
   end;
   cbEspecTipo.Enabled := not bBrowse;
   udEspecOrdem.Enabled := bBrowse;
   btnCampos.Enabled := not bBrowse;
   btnFuncoes.Enabled := not bBrowse;
   btnLimpar.Enabled := not bBrowse;
   DBLookupComboBox1.Enabled := not bBrowse; 

end;

procedure TfCadLayout.udItemOrdemClick(Sender: TObject; Button: TUDBtnType);
var
   iOrdem, iNovaOrdem: Integer;
   iMaxOrdem: Integer;
   bkPos: Pointer;
begin
   iMaxOrdem := DM.GetMax('expo_layout_itens', 'nr_ordem', 'cd_layout = ' + qyLayoutscd_layout.AsString +'');
   iOrdem := RC_StrToInt(dbEdItemOrdem.Text);
   iNovaOrdem := iOrdem;
   if Button = btNext then begin
      if (iOrdem > 1) then begin
         Dec(iNovaOrdem);
      end;
   end
   else begin
      if  (iOrdem < iMaxOrdem) then begin
         Inc(iNovaOrdem);
      end;
   end;
   if (iNovaOrdem > iOrdem) then begin
      qyLayoutItens.Edit();
      qyLayoutItensnr_ordem.AsInteger := iNovaOrdem;
      qyLayoutItens.Post();
      qyLayoutItens.Next();
      qyLayoutItens.Edit();
      qyLayoutItensnr_ordem.AsInteger := iNovaOrdem-1;
      qyLayoutItens.Post();
   end
   else if (iNovaOrdem < iOrdem) then begin
      qyLayoutItens.Edit();
      qyLayoutItensnr_ordem.AsInteger := iNovaOrdem;
      qyLayoutItens.Prior();
      qyLayoutItens.Edit();
      qyLayoutItensnr_ordem.AsInteger := iNovaordem+1;
      qyLayoutItens.Post();
   end;
   bkPos := qyLayoutItens.GetBookmark;
   qyLayoutItens.Close();
   qyLayoutItens.Open();
   qyLayoutItens.GotoBookmark(bkPos);
end;

procedure TfCadLayout.qyLayoutItensBeforePost(DataSet: TDataSet);
begin
   if (qyLayoutItens.State in [dsInsert]) then begin
      qyLayoutItensnr_ordem.AsInteger := (DM.GetMax('expo_layout_itens', 'nr_ordem', 'cd_layout = ' + qyLayoutscd_layout.AsString)+1);
   end;
   if ((qyLayoutItenscd_layout_item_pai.IsNull) or (qyLayoutItenscd_layout_item_pai.AsInteger = qyLayoutItenscd_layout_item.AsInteger)) then begin
      qyLayoutItenscd_layout_item_pai.AsInteger := -1;
   end;
   bkItens := qyLayoutItens.GetBookmark();
end;

procedure TfCadLayout.qyItensEspecBeforePost(DataSet: TDataSet);
begin
   if (qyItensEspec.State in [dsInsert]) then begin
      qyItensEspecnr_ordem.AsInteger := (DM.GetMax('expo_layout_espec', 'nr_ordem', 'cd_item = ' + qyLayoutItenscd_layout_item.AsString)+1);
   end;
   bkEspec := qyItensEspec.GetBookmark();
end;

procedure TfCadLayout.qyItensEspecCalcFields(DataSet: TDataSet);
begin
   qyItensEspecvalor.ASString := qyItensEspecds_valor.AsString;
end;

procedure TfCadLayout.udEspecOrdemClick(Sender: TObject; Button: TUDBtnType);
var
   iOrdem, iNovaOrdem: Integer;
   iMaxOrdem: Integer;
   bkPos: Pointer;
begin
   iMaxOrdem := DM.GetMax('expo_layout_espec', 'nr_ordem', 'cd_item = ' + qyLayoutItenscd_layout_item.AsString +'');
   iOrdem := RC_StrToInt(dbEdEspecFiltro.Text);
   iNovaOrdem := iOrdem;
   if Button = btNext then begin
      if (iOrdem > 1) then begin
         Dec(iNovaOrdem);
      end;
   end
   else begin
      if  (iOrdem < iMaxOrdem) then begin
         Inc(iNovaOrdem);
      end;
   end;
   if (iNovaOrdem > iOrdem) then begin
      qyItensEspec.Edit();
      qyItensEspecnr_ordem.AsInteger := iNovaOrdem;
      qyItensEspec.Post();
      qyItensEspec.Next();
      qyItensEspec.Edit();
      qyItensEspecnr_ordem.AsInteger := iNovaOrdem-1;
      qyItensEspec.Post();
   end
   else if (iNovaOrdem < iOrdem) then begin
      qyItensEspec.Edit();
      qyItensEspecnr_ordem.AsInteger := iNovaOrdem;
      qyItensEspec.Prior();
      qyItensEspec.Edit();
      qyItensEspecnr_ordem.AsInteger := iNovaOrdem+1;
      qyItensEspec.Post();
   end;
   bkPos := qyItensEspec.GetBookmark;
   qyItensEspec.Close();
   qyItensEspec.Open();
   qyItensEspec.GotoBookmark(bkPos);
end;

procedure TfCadLayout.btnCamposClick(Sender: TObject);
begin
   if not (ProcuraForm(fMain, fListaCampos)) then begin
      Application.CreateForm(TfListaCampos, fListaCampos);
   end;
   fListaCampos.ListaCampos(qyLayoutItensnm_consulta.AsString);
   fListaCampos.Left := Bevel3.Left + 30;
   fListaCampos.Top := Panel24.Top - 20;
   fListaCampos.Show();
end;

procedure TfCadLayout.DBMemo2DragOver(Sender, Source: TObject; X, Y: Integer;
  State: TDragState; var Accept: Boolean);
begin
   if Source is TTreeView then begin
      if qyItensEspec.State in [dsInsert, dsEdit] then begin
         Accept := True;
      end;
   end;
end;

procedure TfCadLayout.DBMemo2DragDrop(Sender, Source: TObject; X, Y: Integer);
var
   tvw: TTreeView;
   Item: TItem;
begin
   tvw := TTreeView(Source);

   Item := fListaCampos.getItem(tvw.Selected.AbsoluteIndex);

   if not (Item = nil) then begin
      DBMemo2.Perform( WM_LBUTTONDOWN,  MK_LBUTTON, MakeLong( Loword(X), Loword(Y)));
      DBMemo2.Perform( WM_LBUTTONUP,  0, MakeLong( Loword(X), Loword(Y)));
      DBMemo2.SelLength := 0;
      DBMemo2.Seltext := '{'+ Item.getNome()+'.'+Item.GetValor()+ '}';
   end;

end;

procedure TfCadLayout.CarregaMenuCampos;
var
   slDados: TStringList;
   i: Integer;
   sGrupo, sGrupo1: string;
   sFuncao: string;
   oiTem, oiGrupo: TMenuItem;
begin
   slDados := TStringList.Create();
   PSGetAllFunctions(slDados);
   sGrupo1 := '';
   oiGrupo := nil;
   for i := 0 to slDados.Count-1 do begin
      sGrupo := slDados.Names[i];
      sFuncao := slDados.ValueFromIndex[i];
      if sGrupo1 <> sGrupo then begin
         //muda o grupo
         oiGrupo := TMenuItem.Create(pmFuncoes);
         oiGrupo.Caption := sGrupo;
         pmFuncoes.Items.Add(oiGrupo);
         sGrupo1 := sGrupo;
      end;
      oiTem := TMenuItem.Create(pmFuncoes);
      oiTem.Caption := sFuncao;
      oiTem.OnClick := MenuItemClick;
      oiGrupo.Add(oiTem);
   end;
   FreeAndNil(slDados);
end;

procedure TfCadLayout.MenuItemClick(Sender: TObject);
begin
   DBMemo2.SelLength := 0;
   DBMemo2.Seltext := StringReplace(TMenuItem(Sender).Caption, '&', '', [rfReplaceAll, rfIgnoreCase]);
end;

procedure TfCadLayout.btnFuncoesClick(Sender: TObject);
var
 pt: TPoint;
begin
   GetCursorPos(pt);
   pmFuncoes.Popup(pt.X, pt.Y);
end;

procedure TfCadLayout.FormCreate(Sender: TObject);
begin
   CarregaMenuCampos();
end;

procedure TfCadLayout.btnLimparClick(Sender: TObject);
begin
   qyItensEspecds_valor.AsString := '';
end;

procedure TfCadLayout.DBMemo2KeyPress(Sender: TObject; var Key: Char);
begin
   if Key = #9 then begin
      DBMemo2.SelText := '  ';
      Key := #0;
   end;
end;

procedure TfCadLayout.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
   case Key of
      VK_F2:
         if (btnInserir.Enabled) then
            btnInserirClick( nil );
      VK_F3 :
         if (btnAlterar.Enabled) then
            btnAlterarClick( nil );
      VK_F5 :
         if (btnSalvar.Enabled) then
            btnSalvarClick( nil );
      VK_F4 :
         if (btnExcluir.Enabled) then
            btnExcluirClick( nil );
      VK_F6 :
         if (btnCancelar.Enabled) then
            btnCancelarClick( nil );
      VK_F12 :
         if (btnFechar.Enabled) then
            btnFecharClick( nil );
   end;
end;

procedure TfCadLayout.qyLayoutItensBeforeClose(DataSet: TDataSet);
begin
   bkItens := qyLayoutItens.GetBookmark();
end;

procedure TfCadLayout.qyItensEspecBeforeClose(DataSet: TDataSet);
begin
   bkEspec := qyItensEspec.GetBookmark();
end;

procedure TfCadLayout.ExportaLayoutParaArquivo;
var
   slDados: TStringList;
begin
   slDados := TStringList.Create();

   //Exportando Layout
   with qyRExpo do begin
      Close();
      SQL.Clear();
      Params.Clear();
      SQL.Text := ''+
      'SELECT                                                           '+
      '   NULL as cd_layout, ds_layout, me_layout, cd_formato, sn_ativo '+
      'FROM                                                             '+
      '   expo_layouts                                                  '+
      'WHERE                                                            '+
      '  cd_layout = :cd_layout;                                        ';
      Params.ParamByName('cd_layout').AsInteger := qyLayoutscd_layout.AsInteger;
      Open();
      //slDados.AddStrings(DM.geraDDLFromQuery('expo_layouts', qyLayoutscd_layout.AsString, qyRExpo));
      Close();
   end;

   //Exportando Itens  e Especificacoes do Layout
   with qyRExpo do begin
      Close();
      SQL.Clear();
      Params.Clear();
      SQL.Text := ''+
      'SELECT                                                           '+
      '   NULL as cd_layout, ds_layout, me_layout, cd_formato, sn_ativo '+
      'FROM                                                             '+
      '   expo_layouts                                                  '+
      'WHERE                                                            '+
      '  cd_layout = :cd_layout;                                        ';
      Params.ParamByName('cd_layout').AsInteger := qyLayoutscd_layout.AsInteger;
      Open();
      //slDados.AddStrings(DM.geraDDLFromQuery('expo_layouts', qyLayoutscd_layout.AsString, qyRExpo));
      Close();
   end;

   slDados.SaveToFile('D:\Temp\teste.exp');
end;

procedure TfCadLayout.btnExpLayoutClick(Sender: TObject);
begin
   //ExportaLayoutParaArquivo();
end;

end.
