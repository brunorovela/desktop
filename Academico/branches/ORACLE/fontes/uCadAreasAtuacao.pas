unit uCadAreasAtuacao;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Menus, DB, ZConnection, ImgList, ComCtrls, ToolWin, DBCtrls,
  StdCtrls, Mask, Grids, DBGrids, ExtCtrls, General, ZAbstractRODataset,
  ZAbstractDataset, ZDataset, UZDataset;

type
  Tfrm_CadAreasAtuacao = class(TForm)
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
    tblAreas: TUMZQuery;
    dtcAreas: TDataSource;
    pmQtd: TPopupMenu;
    Label1: TLabel;
    DBEdit1: TDBEdit;
    Label2: TLabel;
    DBEdit2: TDBEdit;
    tblAreascd_area_atuacao: TIntegerField;
    tblAreasds_area_atuacao: TStringField;
    procedure FormShow(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure btnSairClick(Sender: TObject);
    procedure btnExcluirClick(Sender: TObject);
    procedure btnFecharClick(Sender: TObject);
    procedure btnInserirClick(Sender: TObject);
    procedure btnAlterarClick(Sender: TObject);
    procedure btnCancelarClick(Sender: TObject);
    procedure dtcAreasStateChange(Sender: TObject);
    procedure pmQtdPopup(Sender: TObject);
    procedure btnSalvarClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frm_CadAreasAtuacao: Tfrm_CadAreasAtuacao;

implementation

uses Main, uDM, uUsuario;

{$R *.dfm}

procedure Tfrm_CadAreasAtuacao.FormShow(Sender: TObject);
begin
  { Todas em maiúsculas }
  DM.TodasMaiusculas(TForm(Sender));

   tblAreas.Close;
   tblAreas.Open;
end;

procedure Tfrm_CadAreasAtuacao.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
   Action := caFree;
end;

procedure Tfrm_CadAreasAtuacao.FormKeyDown(Sender: TObject; var Key: Word;
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

procedure Tfrm_CadAreasAtuacao.btnSairClick(Sender: TObject);
begin
  Close;
end;

procedure Tfrm_CadAreasAtuacao.btnExcluirClick(Sender: TObject);
begin
   if DM.UsuarioLogado.TemPermissao(2061, npExcluir, true) then
   begin
      if Mensagem( 'Deseja realmente excluir ?', Application.Title, MB_YESNO + MB_ICONQUESTION ) = ID_YES then
      begin
         tblAreas.Delete;
      end;
   end;
end;

procedure Tfrm_CadAreasAtuacao.btnFecharClick(Sender: TObject);
begin
   tblAreas.Close;
   Close;
end;

procedure Tfrm_CadAreasAtuacao.btnInserirClick(Sender: TObject);
begin
   if DM.UsuarioLogado.TemPermissao(2061, npIncluir, true) then
   begin
      DBEdit1.SetFocus;
      tblAreas.Insert;
   end;
end;

procedure Tfrm_CadAreasAtuacao.btnAlterarClick(Sender: TObject);
begin
   if DM.UsuarioLogado.TemPermissao(2061, npAlterar, true) then
   begin
      DBEdit1.SetFocus;
      tblAreas.Edit;
   end;
end;

procedure Tfrm_CadAreasAtuacao.btnCancelarClick(Sender: TObject);
begin
   tblAreas.Cancel;
   tblAreas.Close;
   tblAreas.Open;
end;

procedure Tfrm_CadAreasAtuacao.dtcAreasStateChange(Sender: TObject);
begin
    btnInserir.Enabled := not (tblAreas.State in [dsInsert, dsEdit]);
    btnAlterar.Enabled := not (tblAreas.State in [dsInsert, dsEdit]);
    btnExcluir.Enabled := not (tblAreas.State in [dsInsert, dsEdit]);
    btnSalvar.Enabled := tblAreas.State in [dsInsert, dsEdit];
    btnCancelar.Enabled := tblAreas.State in [dsInsert, dsEdit];
    btnFechar.Enabled := not (tblAreas.State in [dsInsert, dsEdit]);
end;

procedure Tfrm_CadAreasAtuacao.pmQtdPopup(Sender: TObject);
begin
  DM.quantidade_registros(tblAreas, pmQtd);
end;

procedure Tfrm_CadAreasAtuacao.btnSalvarClick(Sender: TObject);
begin
   tblAreas.Post;
   tblAreas.Close;
   tblAreas.Open;
end;

end.

