unit uContComplMedias;

interface

uses
   Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
   Dialogs, DB, ZConnection, ImgList, StdCtrls, Mask, DBCtrls, Buttons, Grids,
   DBGrids, ComCtrls, ToolWin, ExtCtrls, General, ZAbstractRODataset,
   ZAbstractDataset, ZDataset, UZDataset, uUsuario, uDM;

type
  TfrmComplMedias = class(TForm)
    Bevel2: TBevel;
    Bevel1: TBevel;
    frmTitle: TPanel;
    Panel5: TPanel;
    qyAjustes: TUMZQuery;
    srcAjustes: TDataSource;
    Bevel3: TBevel;
    dbgAjustes: TDBGrid;
    Panel1: TPanel;
    lbCodigo: TLabel;
    lbDesc: TLabel;
    DBECodigo: TDBEdit;
    DBEDesc: TDBEdit;
    ImageList3: TImageList;
    toolPessoa: TToolBar;
    ToolButton1: TToolButton;
    tbIncluir: TToolButton;
    tbAlterar: TToolButton;
    tbExcluir: TToolButton;
    ToolButton7: TToolButton;
    tbSalvar: TToolButton;
    tbCancelar: TToolButton;
    ToolButton2: TToolButton;
    btnFechar: TToolButton;
    ToolButton6: TToolButton;
    qyAjustesCD_AJUSTE: TLargeintField;
    qyAjustesDS_AJUSTE: TStringField;
    procedure FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure tbAlterarClick(Sender: TObject);
    procedure qyAjustesAfterPost(DataSet: TDataSet);
    procedure tbExcluirClick(Sender: TObject);
    procedure tbSalvarClick(Sender: TObject);
    procedure tbCancelarClick(Sender: TObject);
    procedure srcAjustesStateChange(Sender: TObject);
    procedure srcAjustesDataChange(Sender: TObject; Field: TField);
    procedure tbIncluirClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure btnFecharClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmComplMedias: TfrmComplMedias;

implementation

{$R *.dfm}

procedure TfrmComplMedias.btnFecharClick(Sender: TObject);
begin
  close;
end;

procedure TfrmComplMedias.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  Action := caFree;
end;

procedure TfrmComplMedias.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
   case key of
      VK_F2 : if tbIncluir.Enabled then tbIncluirClick( nil );
      VK_F3 : if tbAlterar.Enabled then tbAlterarClick( nil );
      VK_F5 : if tbSalvar.Enabled then tbSalvarClick( nil );
      VK_F9 : if tbExcluir.Enabled then tbExcluirClick( nil );
      VK_F6 : if tbCancelar.Enabled then tbCancelarClick( nil );
      VK_F12 : if btnFechar.Enabled then btnFecharClick( nil );
   end;
end;

procedure TfrmComplMedias.FormShow(Sender: TObject);
begin
   qyAjustes.Close();
   qyAjustes.Open();
end;

procedure TfrmComplMedias.qyAjustesAfterPost(DataSet: TDataSet);
begin
  qyAjustes.Close();
  qyAjustes.Open();
end;

procedure TfrmComplMedias.srcAjustesDataChange(Sender: TObject; Field: TField);
begin
  qyAjustes.Open;
end;

procedure TfrmComplMedias.srcAjustesStateChange(Sender: TObject);
var
  bEditando: boolean;
begin
   bEditando := qyAjustes.State in [dsInsert, dsEdit];
   tbIncluir.Enabled  := not bEditando;
   tbAlterar.Enabled  := not bEditando;
   tbExcluir.Enabled  := not bEditando;
   tbSalvar.Enabled   := bEditando;
   tbCancelar.Enabled := bEditando;
   dbgAjustes.Enabled := not bEditando;
end;

procedure TfrmComplMedias.tbAlterarClick(Sender: TObject);
begin
   if DM.UsuarioLogado.TemPermissao(1115, npAlterar, true) then
   begin
      qyAjustes.Edit();
      DBEDesc.SetFocus();
   end;
end;

procedure TfrmComplMedias.tbCancelarClick(Sender: TObject);
begin
   qyAjustes.Cancel();
end;

procedure TfrmComplMedias.tbExcluirClick(Sender: TObject);
begin
   if DM.UsuarioLogado.TemPermissao(1115, npExcluir, true) then
      if Mensagem('Tem certeza que deseja excluir o ajuste selecionado ?',  'Confirmação', MB_YESNO + MB_ICONQUESTION ) = mrYes Then begin
         qyAjustes.Delete;
      end;
end;

procedure TfrmComplMedias.tbIncluirClick(Sender: TObject);
begin
   if DM.UsuarioLogado.TemPermissao(1115, npIncluir, true) then
   begin
      DBEDesc.SetFocus();
      qyAjustes.Insert();
   end;
end;

procedure TfrmComplMedias.tbSalvarClick(Sender: TObject);
begin
  qyAjustes.Post();
end;

end.

