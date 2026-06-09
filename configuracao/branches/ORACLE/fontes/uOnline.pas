unit uOnline;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Db, ZConnection, DBCtrls, Buttons, Grids, DBGrids, ExtCtrls, General, ZAbstractRODataset, ZAbstractDataset, ZDataset, UZDataset,
  StdCtrls, Mask, ComCtrls, ImgList, ToolWin, md5;

type
  TfrmOnline = class(TForm)
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
    Label3: TLabel;
    bdeDs_variavel: TDBEdit;
    Label4: TLabel;
    dsParam: TDataSource;
    tblParam: TUMZQuery;
    tblParamds_variavel: TStringField;
    tblParamds_valor: TStringField;
    tblParamsn_restrito: TStringField;
    bdeDs_valor: TEdit;
    tblParamds_variavel_usuario: TMemoField;
    Label1: TLabel;
    bdmDs_variavel_usuario: TDBMemo;
    qyCategorias: TUMZQuery;
    srcCategorias: TDataSource;
    tblParamcd_categoria: TIntegerField;
    tblParamds_categoria: TStringField;
    Label2: TLabel;
    DBLookupComboBox1: TDBLookupComboBox;
    bnCategorias: TBitBtn;
    tblParamrestrito: TStringField;
    procedure FormDestroy(Sender: TObject);
    procedure btnSairClick(Sender: TObject);
    procedure btnNovoClick(Sender: TObject);
    procedure btnAlterarClick(Sender: TObject);
    procedure btnSalvarClick(Sender: TObject);
    procedure btnCancelarClick(Sender: TObject);
    procedure btnExcluirClick(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure FormShow(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure btnFecharClick(Sender: TObject);
    procedure btnInserirClick(Sender: TObject);
    procedure DBEdit1Enter(Sender: TObject);
    procedure bdeDs_variavelExit(Sender: TObject);
    procedure dsParamDataChange(Sender: TObject; Field: TField);
    procedure dsParamStateChange(Sender: TObject);
    procedure bdeDs_variavelKeyPress(Sender: TObject; var Key: Char);
    procedure bdeDs_variavelKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure bnCategoriasClick(Sender: TObject);
    procedure tblParamCalcFields(DataSet: TDataSet);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmOnline: TfrmOnline;
  strSenha : String;
  snSenha : string;

implementation

uses uPrincipal, uDM, ucCategorias;

{$R *.DFM}

procedure TfrmOnline.btnSairClick(Sender: TObject);
begin
  Close;
end;

procedure TfrmOnline.btnNovoClick(Sender: TObject);
begin
  tblParam.Insert;
  grd.SetFocus;
end;

procedure TfrmOnline.btnAlterarClick(Sender: TObject);
begin
  bdeDs_variavel.SetFocus;
  bdeDs_valor.ReadOnly := false;

  strSenha := tblParamds_valor.AsString;

  if Pos('senha', tblParamds_variavel.AsString) <> 0 then
    begin
      snSenha := 'S';
    end
  else
    begin
      snSenha := 'N';
    end;


  tblParam.Edit;
end;

procedure TfrmOnline.btnSalvarClick(Sender: TObject);
var
  local : Pointer;
begin

  if bdeDs_valor.PasswordChar = '*' then
    begin
      if ((bdeDs_valor.Text <> strSenha) or (snSenha = 'N')) then
        begin
          tblParamds_valor.AsString := MD5Print(MD5String(bdeDs_valor.Text));
        end
    end
  else
    begin
      tblParamds_valor.AsString := bdeDs_valor.Text;
    end;

  tblParamsn_restrito.AsString := 'N';

  tblParam.Post;

  bdeDs_valor.ReadOnly := true;  

  local := tblParam.GetBookmark;
  tblParam.Close;
  tblParam.Open;
  tblParam.GotoBookmark(local);
end;

procedure TfrmOnline.btnCancelarClick(Sender: TObject);
begin
  bdeDs_valor.ReadOnly := true;

  tblParam.Cancel;
end;

procedure TfrmOnline.btnExcluirClick(Sender: TObject);
begin
  if Mensagem( 'Deseja realmente excluir ?', Application.Title,
     MB_YESNO + MB_ICONQUESTION ) = ID_YES then
    tblParam.Delete;
end;

procedure TfrmOnline.FormKeyDown(Sender: TObject; var Key: Word;
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

procedure TfrmOnline.FormShow(Sender: TObject);
begin

  tblParam.Close;

  if DM.tblUsuariosNome.FieldByName('Nome').AsString <> 'ADMIN' then
  begin
    tblParam.SQL.Clear;
    tblParam.SQL.Text := ' ' +
                          'SELECT ' +
                              '* ' +
                            'FROM ' +
                              'online_parametros ' +
                            'WHERE ' +
                              'sn_restrito = ''N'' ' +
                            'ORDER BY ' +
                              'ds_variavel ';
  end;

  tblParam.Open;

  qyCategorias.Close;
  qyCategorias.Open;

  bdeDs_valor.ReadOnly := true;  
end;

procedure TfrmOnline.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  tblParam.Close;

  Action := caFree;
end;

procedure TfrmOnline.FormDestroy(Sender: TObject);
begin
   frmOnline := nil;
end;

procedure TfrmOnline.btnFecharClick(Sender: TObject);
begin
  tblParam.Close;

  Close;
end;

procedure TfrmOnline.btnInserirClick(Sender: TObject);
begin
  bdeDs_variavel.SetFocus;

  bdeDs_valor.ReadOnly := false;
  bdeDs_valor.Text := '';

  tblParam.Append;
end;

procedure TfrmOnline.DBEdit1Enter(Sender: TObject);
begin
   frmPrincipal.MostraHint2(Sender);
end;

procedure TfrmOnline.bdeDs_variavelExit(Sender: TObject);
begin
  if Pos('senha', bdeDs_variavel.Text) <> 0 then
  // Verifica se o registro possui a palavra senha
    begin
      bdeDs_valor.PasswordChar := '*';
    end
  else
    begin
      bdeDs_valor.PasswordChar := #0;
    end;
end;

procedure TfrmOnline.dsParamDataChange(Sender: TObject; Field: TField);
begin

  if not (dsParam.State in [dsEdit, dsInsert]) then
    begin
      bdeDs_valor.Text := tblParamds_valor.AsString;
    end;

  if Pos('senha', tblParamds_variavel.AsString) <> 0 then
  // Verifica se o registro possui a palavra senha
    begin
      bdeDs_valor.PasswordChar := '*';
    end
  else
    begin
      bdeDs_valor.PasswordChar := #0;
    end;

end;

procedure TfrmOnline.dsParamStateChange(Sender: TObject);
begin
  DBNavigator1.Enabled := TDataSource( Sender ).State in [dsBrowse];
  btnInserir.Enabled := TDataSource( Sender ).State in [dsBrowse];
  btnAlterar.Enabled := TDataSource( Sender ).State in [dsBrowse];
  btnSalvar.Enabled := TDataSource( Sender ).State in [dsEdit, dsInsert];
  btnExcluir.Enabled := TDataSource( Sender ).State in [dsBrowse];
  btnCancelar.Enabled := TDataSource( Sender ).State in [dsEdit, dsInsert];
end;

procedure TfrmOnline.bdeDs_variavelKeyPress(Sender: TObject;
  var Key: Char);
begin
  if Key = #13 then
  begin
    SelectNext(ActiveControl,True,True);
    Key := #0;
  end;
end;

procedure TfrmOnline.bdeDs_variavelKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  case Key of
    VK_DOWN : SelectNext( TWinControl( Sender ), True, True );
    VK_UP : SelectNext( TWinControl( Sender ), False, True );
  end;
end;

procedure TfrmOnline.bnCategoriasClick(Sender: TObject);
begin
  qyCategorias.Close;
  fcCategorias.ShowModal;
  qyCategorias.Open;  
end;

procedure TfrmOnline.tblParamCalcFields(DataSet: TDataSet);
begin
if tblParam.FieldByName('sn_restrito').AsString = 'S' then
  tblParam.FieldByName('restrito').AsString := 'X';
end;

end.
