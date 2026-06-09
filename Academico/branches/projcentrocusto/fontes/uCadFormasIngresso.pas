unit uCadFormasIngresso;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Menus, DB, ZConnection, ImgList, ComCtrls, ToolWin, DBCtrls,
  StdCtrls, Mask, Grids, DBGrids, ExtCtrls, General, ZAbstractRODataset, ZAbstractDataset, ZDataset, UZDataset;

type
  Tfrm_FormasIngresso = class(TForm)
    Bevel3: TBevel;
    Bevel7: TBevel;
    Panel3: TPanel;
    Panel1: TPanel;
    Bevel5: TBevel;
    grd: TDBGrid;
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
    tblFormasIngresso: TUMZQuery;
    dsDocumento: TDataSource;
    pmQtd: TPopupMenu;
    tblFormasIngressocd_ingresso: TIntegerField;
    tblFormasIngressods_ingresso: TStringField;
    Label1: TLabel;
    DBEdit1: TDBEdit;
    Label2: TLabel;
    DBEdit2: TDBEdit;
    tblFormasIngressosn_ativo: TSmallintField;
    DBCheckBox1: TDBCheckBox;
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
    procedure dsDocumentoStateChange(Sender: TObject);
    procedure pmQtdPopup(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frm_FormasIngresso: Tfrm_FormasIngresso;

implementation

uses Main, uDM, uUsuario, uChecarUsoColigada, uFormaIngresso;

{$R *.dfm}

procedure Tfrm_FormasIngresso.FormShow(Sender: TObject);
begin
  { Todas em maiúsculas }
  DM.TodasMaiusculas(TForm(Sender));

   tblFormasIngresso.Close;
   tblFormasIngresso.Open;
end;

procedure Tfrm_FormasIngresso.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
   Action := caFree;
end;

procedure Tfrm_FormasIngresso.FormKeyDown(Sender: TObject; var Key: Word;
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

procedure Tfrm_FormasIngresso.btnSairClick(Sender: TObject);
begin
  Close;
end;

procedure Tfrm_FormasIngresso.btnExcluirClick(Sender: TObject);
begin
  { Verificando permissão }
   if DM.UsuarioLogado.TemPermissao(1119, npExcluir, true) AND
      NOT(TChecarUsoColigada.Create( TFormaIngresso.Create( tblFormasIngressocd_ingresso.AsInteger ) ).NaoPossuiPermissao()) then
   begin
     { Verificando se há matrículas com esta forma de ingresso }
     DM.qAux1.Close;
     DM.qAux1.SQL.Clear;
     DM.qAux1.SQL.Add('SELECT COUNT(*) as qtde FROM matriculas WHERE cd_ingresso = :cd_ingresso');
     DM.qAux1.ParamByName('cd_ingresso').AsInteger := tblFormasIngresso.FieldByName('cd_ingresso').AsInteger;
     DM.qAux1.Open;

     if DM.qAux1.FieldByName('qtde').AsInteger > 0 then
     begin
       Mensagem( 'Não é possível excluir.'+CHR(13)+'Há matrículas registradas para esta forma de ingresso.', Application.Title,     MB_OK + MB_ICONERROR );
       Exit;
     end;
     { / Verificando se há matrículas com esta forma de ingresso }

     if Mensagem( 'Deseja realmente excluir ?', Application.Title,
        MB_YESNO + MB_ICONQUESTION ) = ID_YES then
     begin
        tblFormasIngresso.Delete;
     end;
   end;
end;

procedure Tfrm_FormasIngresso.btnFecharClick(Sender: TObject);
begin
   tblFormasIngresso.Close;
   tblFormasIngresso.Open;
   Close;
end;

procedure Tfrm_FormasIngresso.btnInserirClick(Sender: TObject);
begin
   if DM.UsuarioLogado.TemPermissao(1119, npIncluir, true) then
   begin
      DBEdit2.SetFocus;
      tblFormasIngresso.Insert;
   end;
end;

procedure Tfrm_FormasIngresso.btnAlterarClick(Sender: TObject);
begin
   if DM.UsuarioLogado.TemPermissao(1119, npAlterar, true) AND
      NOT(TChecarUsoColigada.Create( TFormaIngresso.Create( tblFormasIngressocd_ingresso.AsInteger ) ).NaoPossuiPermissao()) then
   begin
      DBEdit2.SetFocus;
      tblFormasIngresso.Edit;
   end;
end;

procedure Tfrm_FormasIngresso.btnSalvarClick(Sender: TObject);
Var xCodigo : Integer;
begin
   xCodigo := tblFormasIngressocd_ingresso.AsInteger;
   tblFormasIngresso.Post;
   tblFormasIngresso.Close;
   tblFormasIngresso.Open;

   tblFormasIngresso.Locate('cd_ingresso', xCodigo, []);
end;

procedure Tfrm_FormasIngresso.btnCancelarClick(Sender: TObject);
begin
   tblFormasIngresso.Cancel;
end;

procedure Tfrm_FormasIngresso.dsDocumentoStateChange(Sender: TObject);
begin

   if (tblFormasIngresso.State in [dsEdit, dsInsert]) and
      (TChecarUsoColigada.Create( TFormaIngresso.Create( tblFormasIngressocd_ingresso.AsInteger ) ).NaoPossuiPermissao()) then
   begin
     tblFormasIngresso.Cancel;
   end;

   btnInserir.Enabled := not (tblFormasIngresso.State in [dsInsert, dsEdit]);
   btnAlterar.Enabled := not (tblFormasIngresso.State in [dsInsert, dsEdit]);
   btnExcluir.Enabled := not (tblFormasIngresso.State in [dsInsert, dsEdit]);
   btnSalvar.Enabled := tblFormasIngresso.State in [dsInsert, dsEdit];
   btnCancelar.Enabled := tblFormasIngresso.State in [dsInsert, dsEdit];
   btnFechar.Enabled := not (tblFormasIngresso.State in [dsInsert, dsEdit]);
end;

procedure Tfrm_FormasIngresso.pmQtdPopup(Sender: TObject);
begin
  DM.quantidade_registros(tblFormasIngresso, pmQtd);
end;

end.

