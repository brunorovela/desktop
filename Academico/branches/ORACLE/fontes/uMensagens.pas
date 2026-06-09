unit uMensagens;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  ExtCtrls, Db, ZConnection, DBCtrls, Buttons, Grids, DBGrids, General, ZAbstractRODataset, ZAbstractDataset, ZDataset, UZDataset, Menus;

type
  TfrmMensagens = class(TForm)
    Panel1: TPanel;
    Panel2: TPanel;
    Panel3: TPanel;
    grd: TDBGrid;
    Panel4: TPanel;
    btnSair2: TSpeedButton;
    btnMensagem2: TSpeedButton;
    btnImprimir2: TSpeedButton;
    btnCancelar2: TSpeedButton;
    btnExcluir2: TSpeedButton;
    btnSalvar2: TSpeedButton;
    btnAlterar2: TSpeedButton;
    btnNovo2: TSpeedButton;
    btnMensagem: TSpeedButton;
    btnSair: TSpeedButton;
    btnImprimir: TSpeedButton;
    btnCancelar: TSpeedButton;
    btnExcluir: TSpeedButton;
    btnSalvar: TSpeedButton;
    btnAlterar: TSpeedButton;
    btnNovo: TSpeedButton;
    Navigator: TDBNavigator;
    dtcMensagens: TDataSource;
    tblMensagensRead: TZTable;
    tblMensagensReadCodigo: TIntegerField;
    tblMensagens: TUMZQuery;
    tblMensagensCodigo: TIntegerField;
    tblMensagensTitulo: TStringField;
    tblMensagensMensagem: TBlobField;
    pmQtd: TPopupMenu;
    procedure btnSairClick(Sender: TObject);
    procedure btnNovoClick(Sender: TObject);
    procedure btnAlterarClick(Sender: TObject);
    procedure btnSalvarClick(Sender: TObject);
    procedure btnExcluirClick(Sender: TObject);
    procedure btnCancelarClick(Sender: TObject);
    procedure btnMensagemClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure FormHide(Sender: TObject);
    procedure dtcMensagensStateChange(Sender: TObject);
    procedure tblMensagensNewRecord(DataSet: TDataSet);
    procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure pmQtdPopup(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmMensagens: TfrmMensagens;

implementation

uses uAMensagem, uDM;

{$R *.DFM}


procedure TfrmMensagens.btnSairClick(Sender: TObject);
begin
  Close;
end;

procedure TfrmMensagens.btnNovoClick(Sender: TObject);
begin
  tblMensagens.Append;
end;

procedure TfrmMensagens.btnAlterarClick(Sender: TObject);
begin
  tblMensagens.Edit;
end;

procedure TfrmMensagens.btnSalvarClick(Sender: TObject);
begin
  tblMensagens.Post;
end;

procedure TfrmMensagens.btnExcluirClick(Sender: TObject);
begin
  if Mensagem( 'Deseja realmente excluir ?', Application.Title,
     MB_YESNO + MB_ICONQUESTION ) = ID_YES then
     tblMensagens.Delete;
end;

procedure TfrmMensagens.btnCancelarClick(Sender: TObject);
begin
  tblMensagens.Cancel;
end;

procedure TfrmMensagens.btnMensagemClick(Sender: TObject);
begin
  Application.CreateForm(TfrmAMensagem, frmAMensagem);
  frmAMensagem.ShowModal;
end;

procedure TfrmMensagens.FormShow(Sender: TObject);
begin
  { Todas em maiúsculas }
  DM.TodasMaiusculas(TForm(Sender));

  Screen.Cursor := crHourGlass;
  if not tblMensagensRead.Active then tblMensagensRead.Open;
  if not tblMensagens.Active then tblMensagens.Open;
  Screen.Cursor := crDefault;
end;

procedure TfrmMensagens.FormHide(Sender: TObject);
begin
{  tblMensagens.Close;
  tblMensagensRead.Close;}
end;

procedure TfrmMensagens.dtcMensagensStateChange(Sender: TObject);
begin
  btnNovo.Enabled := TDataSource( Sender ).State in [dsBrowse];
  btnNovo2.Enabled := TDataSource( Sender ).State in [dsBrowse];
  btnAlterar.Enabled := TDataSource( Sender ).State in [dsBrowse];
  btnAlterar2.Enabled := TDataSource( Sender ).State in [dsBrowse];
  btnSalvar.Enabled := TDataSource( Sender ).State in [dsEdit, dsInsert];
  btnSalvar2.Enabled := TDataSource( Sender ).State in [dsEdit, dsInsert];
  btnExcluir.Enabled := TDataSource( Sender ).State in [dsBrowse];
  btnExcluir2.Enabled := TDataSource( Sender ).State in [dsBrowse];
  btnCancelar.Enabled := TDataSource( Sender ).State in [dsEdit, dsInsert];
  btnCancelar2.Enabled := TDataSource( Sender ).State in [dsEdit, dsInsert];
  btnImprimir.Enabled := TDataSource( Sender ).State in [dsBrowse];
  btnImprimir2.Enabled := TDataSource( Sender ).State in [dsBrowse];
  btnMensagem.Enabled := TDataSource( Sender ).State in [dsBrowse, dsEdit, dsInsert];
  btnMensagem2.Enabled := TDataSource( Sender ).State in [dsBrowse, dsEdit, dsInsert];
  if TDataSource( Sender ).State in [dsInsert, dsEdit] then
    grd.Options := [dgEditing,dgTitles,dgIndicator,dgColumnResize,dgColLines,
                    dgRowLines,dgTabs,dgCancelOnExit]
  else
    grd.Options := [dgRowSelect,dgTitles,dgIndicator,dgColumnResize,dgColLines,
                    dgRowLines,dgTabs,dgCancelOnExit];
end;

procedure TfrmMensagens.tblMensagensNewRecord(DataSet: TDataSet);
begin
  tblMensagensRead.Refresh;
  tblMensagensRead.Last;
  tblMensagensCodigo.AsInteger := tblMensagensReadCodigo.AsInteger + 1;
end;

procedure TfrmMensagens.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  case Key of
    VK_F2 : if btnNovo.Enabled then btnNovoClick( nil );
    VK_F3 : if btnAlterar.Enabled then btnAlterarClick( nil );
    VK_F4 : if btnSalvar.Enabled then btnSalvarClick( nil );
    VK_F5 : if btnExcluir.Enabled then btnExcluirClick( nil );
    VK_F6 : if btnCancelar.Enabled then btnCancelarClick( nil );
{    VK_F7 : btnImprimirClick( nil );}
    VK_F8 : btnMensagemClick( nil );
    VK_F12 : btnSairClick( nil );
  end;
end;

procedure TfrmMensagens.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  Action := caFree;
end;

procedure TfrmMensagens.pmQtdPopup(Sender: TObject);
begin
  DM.quantidade_registros(tblMensagens, pmQtd);

end;

end.

