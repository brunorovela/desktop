unit uSelTiposMovimento;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Grids, DBGrids, Db, ZConnection, DBCtrls, Buttons, ExtCtrls, General, ZAbstractRODataset, ZAbstractDataset, ZDataset, UZDataset,
  ComCtrls, ToolWin, ImgList, Menus;

type
  TfrmSelTiposMovimento = class(TForm)
    dtcTiposMovimento: TDataSource;
    pnl: TPanel;
    Panel3: TPanel;
    grd: TDBGrid;
    tblTiposMovimento: TUMZQuery;
    tblTiposMovimentoDescricao: TStringField;
    tblTiposMovimentoTipoMovimento: TStringField;
    Bevel1: TBevel;
    ImageList1: TImageList;
    toolPessoa: TToolBar;
    ToolButton1: TToolButton;
    btnNovo: TToolButton;
    btnAlterar: TToolButton;
    btnExcluir: TToolButton;
    ToolButton4: TToolButton;
    btnSalvar: TToolButton;
    btnCancelar: TToolButton;
    ToolButton8: TToolButton;
    btnSair: TToolButton;
    ToolButton7: TToolButton;
    ToolButton2: TToolButton;
    btnAplicar: TToolButton;
    tblTiposMovimentocodigo: TStringField;
    pmQtd: TPopupMenu;
    procedure grdKeyPress(Sender: TObject; var Key: Char);
    procedure grdDblClick(Sender: TObject);
    procedure btnSairClick(Sender: TObject);
    procedure dtcTiposMovimentoStateChange(Sender: TObject);
    procedure btnNovoClick(Sender: TObject);
    procedure btnAlterarClick(Sender: TObject);
    procedure btnSalvarClick(Sender: TObject);
    procedure btnExcluirClick(Sender: TObject);
    procedure btnCancelarClick(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure FormShow(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure btnAplicarClick(Sender: TObject);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure pmQtdPopup(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmSelTiposMovimento: TfrmSelTiposMovimento;

implementation

uses uDM;

{$R *.DFM}

procedure TfrmSelTiposMovimento.grdKeyPress(Sender: TObject;
  var Key: Char);
begin
  if Key = #13 then
  begin
    Close;
    Key := #0;
  end;
end;

procedure TfrmSelTiposMovimento.grdDblClick(Sender: TObject);
begin
  Close;
end;


procedure TfrmSelTiposMovimento.btnSairClick(Sender: TObject);
begin
  Close;
end;

procedure TfrmSelTiposMovimento.dtcTiposMovimentoStateChange(
  Sender: TObject);
begin
  btnNovo.Enabled := TDataSource( Sender ).State in [dsBrowse];
  btnAlterar.Enabled := TDataSource( Sender ).State in [dsBrowse];
  btnSalvar.Enabled := TDataSource( Sender ).State in [dsEdit, dsInsert];
  btnExcluir.Enabled := TDataSource( Sender ).State in [dsBrowse];
  btnCancelar.Enabled := TDataSource( Sender ).State in [dsEdit, dsInsert];
  if TDataSource( Sender ).State in [dsInsert, dsEdit] then
    grd.Options := [dgEditing,dgTitles,dgIndicator,dgColumnResize,dgColLines,
                    dgRowLines,dgTabs,dgCancelOnExit]
  else
    grd.Options := [dgRowSelect,dgTitles,dgIndicator,dgColumnResize,dgColLines,
                    dgRowLines,dgTabs,dgCancelOnExit];
end;

procedure TfrmSelTiposMovimento.btnNovoClick(Sender: TObject);
begin
  tblTiposMovimento.Insert;
  grd.SetFocus;
end;

procedure TfrmSelTiposMovimento.btnAlterarClick(Sender: TObject);
begin
  tblTiposMovimento.Edit;
  grd.SetFocus;
end;

procedure TfrmSelTiposMovimento.btnSalvarClick(Sender: TObject);
Var codigo : String;
begin
  codigo  := tblTiposMovimentoCodigo.AsString;
  tblTiposMovimento.Post;
  tblTiposMovimento.Close;
  tblTiposMovimento.Open;
  tblTiposMovimento.Locate('Codigo', codigo, []);
end;

procedure TfrmSelTiposMovimento.btnExcluirClick(Sender: TObject);
begin
  if Mensagem( 'Deseja realmente excluir ?', Application.Title,
     MB_YESNO + MB_ICONQUESTION ) = ID_YES then
     tblTiposMovimento.Delete;
end;

procedure TfrmSelTiposMovimento.btnCancelarClick(Sender: TObject);
begin
  tblTiposMovimento.Cancel;
end;

procedure TfrmSelTiposMovimento.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  case Key of
//    VK_F2 : if btnNovo.Enabled then btnNovoClick( nil );
//    VK_F3 : if btnAlterar.Enabled then btnAlterarClick( nil );
//    VK_F4 : if btnSalvar.Enabled then btnSalvarClick( nil );
//    VK_F5 : if btnExcluir.Enabled then btnExcluirClick( nil );
//    VK_F6 : if btnCancelar.Enabled then btnCancelarClick( nil );
{    VK_F7 : btnImprimirClick( nil );}
{    VK_F8 : btnPesquisarClick( nil );}
    VK_F12 : btnSairClick( nil );
  end;

end;

procedure TfrmSelTiposMovimento.FormShow(Sender: TObject);
begin
  { Todas em maiúsculas }
  DM.TodasMaiusculas(TForm(Sender));

  if not tblTiposMovimento.Active then tblTiposMovimento.Open;
end;

procedure TfrmSelTiposMovimento.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  Action := caFree;
end;

procedure TfrmSelTiposMovimento.btnAplicarClick(Sender: TObject);
begin
  Close;

end;

procedure TfrmSelTiposMovimento.FormCloseQuery(Sender: TObject;
  var CanClose: Boolean);
begin
   CanClose := not (tblTiposMovimento.State in [dsEdit, dsInsert]); 
end;

procedure TfrmSelTiposMovimento.pmQtdPopup(Sender: TObject);
begin
  DM.quantidade_registros(tblTiposMovimento, pmQtd);

end;

end.

