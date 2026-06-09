unit uGruposPrestacaoContas;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Grids, DBGrids, ComCtrls, ToolWin, ImgList, ExtCtrls, DB, DBTables,
  StdCtrls, Mask, DBCtrls, UMLookupComboBox, General, uDM, UZDataset,
  ZAbstractRODataset, ZAbstractDataset;

type
  TfrmGrupoPrestacaoConta = class(TForm)
    pnTitulo: TPanel;
    imgBotoes: TImageList;
    tbBotoesAcao: TToolBar;
    tpSeparador1: TToolButton;
    btnIncluir: TToolButton;
    btnAlterar: TToolButton;
    btnExcluir: TToolButton;
    tpSeparador2: TToolButton;
    btnSalvar: TToolButton;
    btnCancelar: TToolButton;
    btnSair: TToolButton;
    tpSeparador3: TToolButton;
    pnCampos: TPanel;
    dbListaGrupoPrestacao: TDBGrid;
    dsGrupoPrestacaoContas: TDataSource;
    lbGrupo: TLabel;
    lbNivel: TLabel;
    dbtxtNivel: TDBEdit;
    dsGrupos: TDataSource;
    dbcmbGrupos: TDBLookupComboBox;
    gbAcoes: TGroupBox;
    chkDesbloqueiaFinanceiro: TDBCheckBox;
    chkBloqueiaFinanceiro: TDBCheckBox;
    zGrupoPrestacaoContas: TUMZQuery;
    zGrupos: TUMZReadOnlyQuery;
    zGruposcd_grupo: TIntegerField;
    zGruposds_nome_grupo: TStringField;
    zGrupoPrestacaoContascd_grupo_prestacao_conta: TIntegerField;
    zGrupoPrestacaoContascd_grupo: TIntegerField;
    zGrupoPrestacaoContasnr_nivel: TIntegerField;
    zGrupoPrestacaoContassn_bloqueia_financeiro: TSmallintField;
    zGrupoPrestacaoContassn_desbloqueia_financeiro: TSmallintField;
    zGrupoPrestacaoContasds_grupo: TStringField;
    procedure zGrupoPrestacaoContasNewRecord(DataSet: TDataSet);
    procedure zGrupoPrestacaoContasBeforeEdit(DataSet: TDataSet);
    procedure FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure btnCancelarClick(Sender: TObject);
    procedure btnSalvarClick(Sender: TObject);
    procedure btnExcluirClick(Sender: TObject);
    procedure btnAlterarClick(Sender: TObject);
    procedure btnIncluirClick(Sender: TObject);
    procedure btnSairClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    { Private declarations }
    procedure HabilitaBotoes( bEnable: Boolean );
  public
    { Public declarations }
  end;

var
  frmGrupoPrestacaoConta: TfrmGrupoPrestacaoConta;

implementation

{$R *.dfm}

procedure TfrmGrupoPrestacaoConta.btnAlterarClick(Sender: TObject);
begin
   if not (zGrupoPrestacaoContas.State = dsEdit) then
   begin
      zGrupoPrestacaoContas.Edit;
      dbcmbGrupos.SetFocus;
   end;
end;

procedure TfrmGrupoPrestacaoConta.btnCancelarClick(Sender: TObject);
begin
   zGrupoPrestacaoContas.Cancel;
   HabilitaBotoes( false );
end;

procedure TfrmGrupoPrestacaoConta.btnExcluirClick(Sender: TObject);
begin
   if zGrupoPrestacaoContas.IsEmpty <> true then
   begin
      if  Mensagem('Deseja excluir o registro selecionado?', 'Confirmação', MB_YESNO + MB_ICONQUESTION ) = mrYes then
      begin
         zGrupoPrestacaoContas.Delete;
      end;
   end;
end;

procedure TfrmGrupoPrestacaoConta.btnIncluirClick(Sender: TObject);
begin
   if not (zGrupoPrestacaoContas.State = dsInsert) then
   begin
      zGrupoPrestacaoContas.Insert;
      dbcmbGrupos.SetFocus;
   end;
end;

procedure TfrmGrupoPrestacaoConta.btnSairClick(Sender: TObject);
begin
   Self.Close();
end;

procedure TfrmGrupoPrestacaoConta.btnSalvarClick(Sender: TObject);
begin
   zGrupoPrestacaoContas.Post;
   zGrupoPrestacaoContas.Close();
   zGrupoPrestacaoContas.Open();
   Self.HabilitaBotoes( false );
end;

procedure TfrmGrupoPrestacaoConta.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
   zGrupos.Close();
   zGrupoPrestacaoContas.Close();
   Action := caFree;
end;

procedure TfrmGrupoPrestacaoConta.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
   case Key of
      VK_F2  : if btnIncluir.Enabled  then btnIncluirClick( nil );
      VK_F3  : if btnAlterar.Enabled  then btnAlterarClick( nil );
      VK_F9  : if btnExcluir.Enabled  then btnExcluirClick( nil );
      VK_F5  : if btnSalvar.Enabled   then btnSalvarClick( nil );
      VK_F6  : if btnCancelar.Enabled then btnCancelarClick( nil );
      VK_F12 : if btnSair.Enabled     then btnSairClick( nil );
   end;
end;

procedure TfrmGrupoPrestacaoConta.FormShow(Sender: TObject);
begin
   zGrupos.Open();
   zGrupoPrestacaoContas.Open();
end;

procedure TfrmGrupoPrestacaoConta.HabilitaBotoes(bEnable: Boolean);
begin
   Self.btnSalvar.Enabled   := bEnable;
   Self.btnCancelar.Enabled := bEnable;
   Self.btnAlterar.Enabled  := not bEnable;
   Self.btnIncluir.Enabled  := not bEnable;
   Self.btnExcluir.Enabled  := not bEnable;
end;

procedure TfrmGrupoPrestacaoConta.zGrupoPrestacaoContasBeforeEdit(
  DataSet: TDataSet);
begin
   HabilitaBotoes( true );
end;

procedure TfrmGrupoPrestacaoConta.zGrupoPrestacaoContasNewRecord(
  DataSet: TDataSet);
begin
   HabilitaBotoes( true );
end;

end.
