unit uRelatorios;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Db, ZConnection, DBCtrls, Buttons, Grids, DBGrids, ExtCtrls, General,
  ZAbstractRODataset, ZAbstractDataset, ZDataset, UZDataset,
  StdCtrls, Mask, ComCtrls, ImgList, ToolWin, md5, DBTables,
  ZSqlUpdate;

type
  TfrmRelatorios = class(TForm)
    Panel3: TPanel;
    Panel1: TPanel;
    grd: TDBGrid;
    Panel2: TPanel;
    Panel4: TPanel;
    Bevel3: TBevel;
    Bevel5: TBevel;
    Bevel7: TBevel;
    Bevel1: TBevel;
    toolPessoa: TToolBar;
    ToolButton1: TToolButton;
    btnInserir: TToolButton;
    btnAlterar: TToolButton;
    btnExcluir: TToolButton;
    ToolButton4: TToolButton;
    btnSalvar: TToolButton;
    btnCancelar: TToolButton;
    ToolButton9: TToolButton;
    btnFechar: TToolButton;
    ToolButton2: TToolButton;
    ImageList1: TImageList;
    DBNavigator1: TDBNavigator;
    dsRelatorios: TDataSource;
    qyRelatorios: TUMZQuery;
    ScrollBox1: TScrollBox;
    Label1: TLabel;
    DBEdit1: TDBEdit;
    Label2: TLabel;
    DBEdit2: TDBEdit;
    Label3: TLabel;
    DBEdit3: TDBEdit;
    Label4: TLabel;
    DBEdit4: TDBEdit;
    Label5: TLabel;
    Label7: TLabel;
    DBEdit7: TDBEdit;
    Label9: TLabel;
    DBEdit9: TDBEdit;
    Label11: TLabel;
    DBMemo1: TDBMemo;
    DBRadioGroup1: TDBRadioGroup;
    DBRadioGroup2: TDBRadioGroup;
    Label8: TLabel;
    DBRadioGroup3: TDBRadioGroup;
    DBMemo2: TDBMemo;
    Label6: TLabel;
    DBEdit5: TDBEdit;
    UpdateSQL1: TZUpdateSQL;
    qyRelatoriosnm_relatorio: TStringField;
    qyRelatorioscd_modulo: TIntegerField;
    qyRelatorioscd_cabecalho: TIntegerField;
    qyRelatoriosds_grupo: TStringField;
    qyRelatoriosnm_arquivo: TStringField;
    qyRelatoriosds_parametros: TStringField;
    qyRelatoriosds_formula: TMemoField;
    qyRelatoriosds_especial: TMemoField;
    qyRelatoriosds_ordem: TStringField;
    qyRelatoriossn_disponivel: TStringField;
    qyRelatoriosds_formula_grupo: TStringField;
    qyRelatoriosds_sql: TMemoField;
    qyRelatoriosds_sql_ordem: TStringField;
    qyRelatorioscd_relatorio: TIntegerField;
    qyRelatoriossn_impressao_numero: TStringField;
    procedure FormDestroy(Sender: TObject);
    procedure btnSairClick(Sender: TObject);
    procedure btnNovoClick(Sender: TObject);
    procedure btnExcluirClick(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure FormShow(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure btnFecharClick(Sender: TObject);
    procedure btnInserirClick(Sender: TObject);
    procedure DBEdit1Enter(Sender: TObject);
    procedure dsRelatoriosStateChange(Sender: TObject);
    procedure bdeDs_variavelKeyPress(Sender: TObject; var Key: Char);
    procedure bdeDs_variavelKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure qyRelatoriosCalcFields(DataSet: TDataSet);
    procedure btnAlterarClick(Sender: TObject);
    procedure btnSalvarClick(Sender: TObject);
    procedure btnCancelarClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmRelatorios: TfrmRelatorios;
  strSenha : String;
  snSenha : string;

implementation

uses uPrincipal, uDM, ucCategorias;

{$R *.DFM}

procedure TfrmRelatorios.btnSairClick(Sender: TObject);
begin
  Close;
end;

procedure TfrmRelatorios.btnNovoClick(Sender: TObject);
begin
  qyRelatorios.Insert;
  grd.SetFocus;
end;

procedure TfrmRelatorios.btnExcluirClick(Sender: TObject);
begin
  if Mensagem( 'Deseja realmente excluir ?', Application.Title,
     MB_YESNO + MB_ICONQUESTION ) = ID_YES then
          qyRelatorios.Delete;
end;

procedure TfrmRelatorios.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  case Key of
    VK_F2 : btnInserirClick( nil );
    VK_F3 : btnAlterarClick( nil );
    VK_F5 : btnSalvarClick( nil );
    VK_F4 : btnExcluirClick( nil );
    VK_F6 : btnCancelarClick( nil );
    VK_F12 : btnFecharClick( nil );
  end;
end;

procedure TfrmRelatorios.FormShow(Sender: TObject);
begin

  qyRelatorios.Close;
  qyRelatorios.Open;

end;

procedure TfrmRelatorios.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  qyRelatorios.Close;

  Action := caFree;
end;

procedure TfrmRelatorios.FormDestroy(Sender: TObject);
begin
   frmRelatorios := nil;
end;

procedure TfrmRelatorios.btnFecharClick(Sender: TObject);
begin
  qyRelatorios.Close;

  Close;
end;

procedure TfrmRelatorios.btnInserirClick(Sender: TObject);
begin
  DBEdit1.SetFocus;
  qyRelatorios.Insert;
end;

procedure TfrmRelatorios.DBEdit1Enter(Sender: TObject);
begin
   frmPrincipal.MostraHint2(Sender);
end;

procedure TfrmRelatorios.dsRelatoriosStateChange(Sender: TObject);
begin
  DBNavigator1.Enabled := TDataSource( Sender ).State in [dsBrowse];
  btnInserir.Enabled := TDataSource( Sender ).State in [dsBrowse];
  btnAlterar.Enabled := TDataSource( Sender ).State in [dsBrowse];
  btnSalvar.Enabled := TDataSource( Sender ).State in [dsEdit, dsInsert];
  btnExcluir.Enabled := TDataSource( Sender ).State in [dsBrowse];
  btnCancelar.Enabled := TDataSource( Sender ).State in [dsEdit, dsInsert];
end;

procedure TfrmRelatorios.bdeDs_variavelKeyPress(Sender: TObject;
  var Key: Char);
begin
  if Key = #13 then
  begin
    SelectNext(ActiveControl,True,True);
    Key := #0;
  end;
end;

procedure TfrmRelatorios.bdeDs_variavelKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  case Key of
    VK_DOWN : SelectNext( TWinControl( Sender ), True, True );
    VK_UP : SelectNext( TWinControl( Sender ), False, True );
  end;
end;

procedure TfrmRelatorios.qyRelatoriosCalcFields(DataSet: TDataSet);
begin
if qyRelatorios.FieldByName('sn_restrito').AsString = 'S' then
  qyRelatorios.FieldByName('restrito').AsString := 'X';
end;

procedure TfrmRelatorios.btnAlterarClick(Sender: TObject);
begin
  qyRelatorios.Edit;
end;

procedure TfrmRelatorios.btnSalvarClick(Sender: TObject);
begin
  qyRelatorios.Post;
  qyRelatorios.ApplyUpdates;

  qyRelatorios.Close;
  qyRelatorios.Open;
end;

procedure TfrmRelatorios.btnCancelarClick(Sender: TObject);
begin
  qyRelatorios.Cancel;
end;

end.
