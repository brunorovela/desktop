unit uParametrosRestritos;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Db, DBTables, DBCtrls, Buttons, Grids, DBGrids, ExtCtrls, General,
  StdCtrls, Mask, ComCtrls, ImgList, ToolWin, md5;

type
  TfrmParametrosRestritos = class(TForm)
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
    tblParam: TQuery;
    tblParamds_variavel: TStringField;
    tblParamds_valor: TStringField;
    tblParamsn_restrito: TStringField;
    bdeDs_valor: TEdit;
    tblParamds_variavel_usuario: TMemoField;
    Label1: TLabel;
    bdmDs_variavel_usuario: TDBMemo;
    cbRestrito: TCheckBox;
    qyCategorias: TQuery;
    srcCategorias: TDataSource;
    tblParamcd_categoria: TIntegerField;
    tblParamds_categoria: TStringField;
    Label2: TLabel;
    DBLookupComboBox1: TDBLookupComboBox;
    bnCategorias: TBitBtn;
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
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmParametrosRestritos: TfrmParametrosRestritos;
  strSenha : String;
  snSenha : string;

implementation

uses uPrincipal, uDM, ucCategorias;

{$R *.DFM}

procedure TfrmParametrosRestritos.btnSairClick(Sender: TObject);
begin
  Close;
end;

procedure TfrmParametrosRestritos.btnNovoClick(Sender: TObject);
begin
  tblParam.Insert;
  grd.SetFocus;
end;

procedure TfrmParametrosRestritos.btnAlterarClick(Sender: TObject);
begin
  bdeDs_variavel.SetFocus;
  bdeDs_valor.ReadOnly := false;
  cbRestrito.Enabled := true;  

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

procedure TfrmParametrosRestritos.btnSalvarClick(Sender: TObject);
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

  if cbRestrito.Checked = true then
      begin
        tblParamsn_restrito.AsString := 'S';
      end
    else
      begin
        tblParamsn_restrito.AsString := 'N';
      end;

  tblParam.Post;

  bdeDs_valor.ReadOnly := true;
  cbRestrito.Enabled := false;

  tblParam.Close;
  tblParam.Open;
end;

procedure TfrmParametrosRestritos.btnCancelarClick(Sender: TObject);
begin
  bdeDs_valor.ReadOnly := true;
  cbRestrito.Enabled := false;

  tblParam.Cancel;
end;

procedure TfrmParametrosRestritos.btnExcluirClick(Sender: TObject);
begin
  if Mensagem( 'Deseja realmente excluir ?', Application.Title,
     MB_YESNO + MB_ICONQUESTION ) = ID_YES then
    tblParam.Delete;
end;

procedure TfrmParametrosRestritos.FormKeyDown(Sender: TObject; var Key: Word;
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

procedure TfrmParametrosRestritos.FormShow(Sender: TObject);
begin
  tblParam.Close;
  tblParam.Open;

  bdeDs_valor.ReadOnly := true;  
end;

procedure TfrmParametrosRestritos.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  tblParam.Close;

  Action := caFree;
end;

procedure TfrmParametrosRestritos.btnFecharClick(Sender: TObject);
begin
  tblParam.Close;

  Close;
end;

procedure TfrmParametrosRestritos.btnInserirClick(Sender: TObject);
begin
  bdeDs_variavel.SetFocus;

  cbRestrito.Enabled := true;
  cbRestrito.Checked := false;

  bdeDs_valor.ReadOnly := false;
  bdeDs_valor.Text := '';

  tblParam.Append;
end;

procedure TfrmParametrosRestritos.DBEdit1Enter(Sender: TObject);
begin
   frmPrincipal.MostraHint2(Sender);
end;

procedure TfrmParametrosRestritos.bdeDs_variavelExit(Sender: TObject);
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

procedure TfrmParametrosRestritos.dsParamDataChange(Sender: TObject; Field: TField);
begin

  if not (dsParam.State in [dsEdit, dsInsert]) then
    begin
      bdeDs_valor.Text := tblParamds_valor.AsString;

      if tblParamsn_restrito.AsString = 'S' then
          begin
            cbRestrito.Checked := true;
          end
        else
          begin
            cbRestrito.Checked := false;
          end;

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

end; // dsParamDataChange

procedure TfrmParametrosRestritos.dsParamStateChange(Sender: TObject);
begin
  DBNavigator1.Enabled := TDataSource( Sender ).State in [dsBrowse];
  btnInserir.Enabled := TDataSource( Sender ).State in [dsBrowse];
  btnAlterar.Enabled := TDataSource( Sender ).State in [dsBrowse];
  btnSalvar.Enabled := TDataSource( Sender ).State in [dsEdit, dsInsert];
  btnExcluir.Enabled := TDataSource( Sender ).State in [dsBrowse];
  btnCancelar.Enabled := TDataSource( Sender ).State in [dsEdit, dsInsert];
end;

procedure TfrmParametrosRestritos.bdeDs_variavelKeyPress(Sender: TObject;
  var Key: Char);
begin
  if Key = #13 then
  begin
    SelectNext(ActiveControl,True,True);
    Key := #0;
  end;
end;

procedure TfrmParametrosRestritos.bdeDs_variavelKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  case Key of
    VK_DOWN : SelectNext( TWinControl( Sender ), True, True );
    VK_UP : SelectNext( TWinControl( Sender ), False, True );
  end;
end;

procedure TfrmParametrosRestritos.bnCategoriasClick(Sender: TObject);
begin
  qyCategorias.Close;
  fcCategorias.ShowModal;
  qyCategorias.Open;
end;

end.
