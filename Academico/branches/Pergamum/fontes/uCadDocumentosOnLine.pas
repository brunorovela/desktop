unit uCadDocumentosOnLine;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Menus, DB, ZConnection, ImgList, ComCtrls, ToolWin, DBCtrls,
  StdCtrls, Mask, Grids, DBGrids, ExtCtrls, General, ZAbstractRODataset,
  ZAbstractDataset, ZDataset, UZDataset;

type
  Tfrm_DocumentosOnLine = class(TForm)
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
    tblDocumento: TUMZQuery;
    dsDocumento: TDataSource;
    qMax: TUMZQuery;
    qMaxUltimo: TSmallintField;
    pmQtd: TPopupMenu;
    tblDocumentocd_doc: TSmallintField;
    tblDocumentods_titulo: TStringField;
    tblDocumentonr_anosemestre: TSmallintField;
    tblDocumentods_doc: TMemoField;
    tblDocumentocd_tipo_doc: TStringField;
    Label2: TLabel;
    DBEdit2: TDBEdit;
    Label3: TLabel;
    DBEdit3: TDBEdit;
    Label4: TLabel;
    DBMemo1: TDBMemo;
    DBRadioGroup1: TDBRadioGroup;
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
  frm_DocumentosOnLine: Tfrm_DocumentosOnLine;

implementation

uses Main, uDM, uUsuario;

{$R *.dfm}

procedure Tfrm_DocumentosOnLine.FormShow(Sender: TObject);
begin
  { Todas em maiúsculas }
  DM.TodasMaiusculas(TForm(Sender));

   tblDocumento.Close;
   tblDocumento.Open;
end;

procedure Tfrm_DocumentosOnLine.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
   Action := caFree;
end;

procedure Tfrm_DocumentosOnLine.FormKeyDown(Sender: TObject; var Key: Word;
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

procedure Tfrm_DocumentosOnLine.btnSairClick(Sender: TObject);
begin
  Close;
end;

procedure Tfrm_DocumentosOnLine.btnExcluirClick(Sender: TObject);
begin
   if DM.UsuarioLogado.TemPermissao(1118, npExcluir, true) then
   begin
     if Mensagem( 'Deseja realmente excluir ?', Application.Title,
        MB_YESNO + MB_ICONQUESTION ) = ID_YES then
     begin
        tblDocumento.Delete;
     end;
   end;
end;

procedure Tfrm_DocumentosOnLine.btnFecharClick(Sender: TObject);
begin
   tblDocumento.Close;
   tblDocumento.Open;
   Close;
end;

procedure Tfrm_DocumentosOnLine.btnInserirClick(Sender: TObject);
begin
   if DM.UsuarioLogado.TemPermissao(1118, npIncluir, true) then
   begin
      DBEdit2.SetFocus;
      tblDocumento.Insert;
   end;
end;

procedure Tfrm_DocumentosOnLine.btnAlterarClick(Sender: TObject);
begin
   if DM.UsuarioLogado.TemPermissao(1118, npAlterar, true) then
   begin
      DBEdit2.SetFocus;
      tblDocumento.Edit;
   end;
end;

procedure Tfrm_DocumentosOnLine.btnSalvarClick(Sender: TObject);
Var xCodigo : Integer;
begin
   xCodigo := tblDocumentocd_doc.AsInteger;
   tblDocumento.Post;
   tblDocumento.Close;
   tblDocumento.Open;

   tblDocumento.Locate('cd_doc', xCodigo, []);
end;

procedure Tfrm_DocumentosOnLine.btnCancelarClick(Sender: TObject);
begin
   tblDocumento.Cancel;
end;

procedure Tfrm_DocumentosOnLine.dsDocumentoStateChange(Sender: TObject);
begin
    btnInserir.Enabled := not (tblDocumento.State in [dsInsert, dsEdit]);
    btnAlterar.Enabled := not (tblDocumento.State in [dsInsert, dsEdit]);
    btnExcluir.Enabled := not (tblDocumento.State in [dsInsert, dsEdit]);
    btnSalvar.Enabled := tblDocumento.State in [dsInsert, dsEdit];
    btnCancelar.Enabled := tblDocumento.State in [dsInsert, dsEdit];
    btnFechar.Enabled := not (tblDocumento.State in [dsInsert, dsEdit]);
end;

procedure Tfrm_DocumentosOnLine.pmQtdPopup(Sender: TObject);
begin
  DM.quantidade_registros(tblDocumento, pmQtd);
end;

end.

