unit uPoupanca;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Db, ZConnection, DBCtrls, Buttons, Grids, DBGrids, ExtCtrls, General, ZAbstractRODataset, ZAbstractDataset, ZDataset, UZDataset,
  StdCtrls, Mask, ImgList, ComCtrls, ToolWin, Menus;

type
  TfrmPoupanca = class(TForm)
    Panel1: TPanel;
    Panel3: TPanel;
    grd: TDBGrid;
    dtcPoupanca: TDataSource;
    tblPoupanca: TUMZQuery;
    tblPoupancaData: TDateTimeField;
    Bevel1: TBevel;
    Bevel2: TBevel;
    pnIndice: TPanel;
    Label1: TLabel;
    DBEdit1: TDBEdit;
    Label2: TLabel;
    DBEdit2: TDBEdit;
    Label3: TLabel;
    DBEdit3: TDBEdit;
    toolPessoa: TToolBar;
    ToolButton1: TToolButton;
    btnInserir: TToolButton;
    btnAlterar: TToolButton;
    btnExcluir: TToolButton;
    ToolButton5: TToolButton;
    btnSalvar: TToolButton;
    btnCancelar: TToolButton;
    ToolButton8: TToolButton;
    btnSair: TToolButton;
    ToolButton10: TToolButton;
    ImageList1: TImageList;
    tblPoupancaindicecorrigido: TFloatField;
    tblPoupancaindicepoupanca: TFloatField;
    pmQtd: TPopupMenu;
    procedure DBEdit3KeyPress(Sender: TObject; var Key: Char);
    procedure DBEdit2KeyPress(Sender: TObject; var Key: Char);
    procedure btnInserirClick(Sender: TObject);
    procedure btnAlterarClick(Sender: TObject);
    procedure btnSalvarClick(Sender: TObject);
    procedure btnCancelarClick(Sender: TObject);
    procedure btnExcluirClick(Sender: TObject);
    procedure dtcPoupancaStateChange(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure CorrigirIndices;
    procedure tblPoupancaAfterPost(DataSet: TDataSet);
    procedure FormShow(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure btnSairClick(Sender: TObject);
    procedure pmQtdPopup(Sender: TObject);
  private
    flg : Boolean;
    dblIndice : Double;
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmPoupanca: TfrmPoupanca;

implementation

uses uDM, Main;

{$R *.DFM}


procedure TfrmPoupanca.btnInserirClick(Sender: TObject);
begin
  pnIndice.Visible := True;
  DBEdit1.SetFocus;
  tblPoupanca.Append;
end;

procedure TfrmPoupanca.btnAlterarClick(Sender: TObject);
begin
  pnIndice.Visible := True;
  DBEdit1.SetFocus;
  tblPoupanca.Edit;
end;

procedure TfrmPoupanca.btnSalvarClick(Sender: TObject);
begin
  if Mensagem( 'Deseja realmente salvar ?', Application.Title,
       MB_YESNO + MB_ICONQUESTION ) = ID_YES then
    begin
      tblPoupanca.Post;
      tblPoupanca.Close;
      tblPoupanca.Open;
      tblPoupanca.First;
    end;
end;

procedure TfrmPoupanca.btnCancelarClick(Sender: TObject);
begin
  tblPoupanca.Cancel;
end;

procedure TfrmPoupanca.btnExcluirClick(Sender: TObject);
begin
  if Mensagem( 'Deseja realmente excluir ?', Application.Title, MB_YESNO + MB_ICONQUESTION ) = ID_YES then
     tblPoupanca.Delete;
end;

procedure TfrmPoupanca.dtcPoupancaStateChange(Sender: TObject);
begin
  btnInserir.Enabled := TDataSource( Sender ).State in [dsBrowse];
  btnAlterar.Enabled := TDataSource( Sender ).State in [dsBrowse];
  btnSalvar.Enabled := TDataSource( Sender ).State in [dsEdit, dsInsert];
  btnExcluir.Enabled := TDataSource( Sender ).State in [dsBrowse];
  btnCancelar.Enabled := TDataSource( Sender ).State in [dsEdit, dsInsert];

  pnIndice.Visible := TDataSource( Sender ).State in [dsEdit, dsInsert];
  
end;

procedure TfrmPoupanca.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  case Key of
    VK_F1 : PrincipalForm.confSobreClick( nil );
    VK_F2 : btnInserirClick( nil );
    VK_F3 : btnAlterarClick( nil );
    VK_F5 : btnSalvarClick( nil );
    VK_F9 : btnExcluirClick( nil );
    VK_F6 : btnCancelarClick( nil );
{    VK_F7 : btnImprimirClick( nil );}
{    VK_F8 : btnPesquisarClick( nil );}
    VK_F12 : btnSairClick( nil );
  end;
end;

procedure TfrmPoupanca.CorrigirIndices;
var
  dblIndiceAnterior : Double;
begin
  Screen.Cursor := crHourGlass;
  tblPoupanca.DisableControls;
  tblPoupanca.First;
  dblIndice := tblPoupancaIndicePoupanca.Value;
  dblIndiceAnterior := tblPoupancaIndiceCorrigido.Value;
  tblPoupanca.Next;
  while not tblPoupanca.Eof do
  begin
    tblPoupanca.Edit;
    tblPoupancaIndiceCorrigido.Value := RoundFloat(
      ( ( ( dblIndice / 100 ) + 1 ) * dblIndiceAnterior ), 4 );

    flg := True;
    tblPoupanca.Post;
    dblIndice := tblPoupancaIndicePoupanca.Value;
    dblIndiceAnterior := tblPoupancaIndiceCorrigido.Value;
    tblPoupanca.Next;
  end;
  flg := False;
  tblPoupanca.EnableControls;
  Screen.Cursor := crDefault;
end;

procedure TfrmPoupanca.DBEdit2KeyPress(Sender: TObject; var Key: Char);
begin
   //Se for . transforma para virgula
   if(Key in['.']) then
   begin
      Key :=  ',';
   end;
end;

procedure TfrmPoupanca.DBEdit3KeyPress(Sender: TObject; var Key: Char);
begin
   //Se for . transforma para virgula
   if(Key in['.']) then
   begin
      Key :=  ',';
   end;
end;

procedure TfrmPoupanca.tblPoupancaAfterPost(DataSet: TDataSet);
begin
  if not flg then CorrigirIndices;

  DM.CalculoPoupanca;
end;

procedure TfrmPoupanca.FormShow(Sender: TObject);
begin
  { Todas em maiúsculas }
  DM.TodasMaiusculas(TForm(Sender));

  flg := False;
  tblPoupanca.Open;
end;

procedure TfrmPoupanca.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  tblPoupanca.Close;
  Action := caFree;
end;

procedure TfrmPoupanca.btnSairClick(Sender: TObject);
begin
   Close;
end;

procedure TfrmPoupanca.pmQtdPopup(Sender: TObject);
begin
  DM.quantidade_registros(tblPoupanca, pmQtd);

end;

end.

