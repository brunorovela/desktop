unit uCadPadrao;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Menus, DB, ZConnection, ImgList, ComCtrls, ToolWin, DBCtrls,
  StdCtrls, Mask, Grids, DBGrids, ExtCtrls, General, ZAbstractRODataset, ZAbstractDataset, ZDataset, UZDataset;

type
  TfrmCadPadrao = class(TForm)
    Bevel3: TBevel;
    Bevel7: TBevel;
    pnTitulo: TPanel;
    Panel1: TPanel;
    Bevel5: TBevel;
    grd: TDBGrid;
    Panel2: TPanel;
    pnAnoSemestre: TPanel;
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
    tabela: TUMZQuery;
    datasource: TDataSource;
    pmQtd: TPopupMenu;
    tabelacodigo: TSmallintField;
    tabeladocumento: TStringField;
    tabelaprazo: TStringField;
    tabelasigla: TStringField;
    tabelaordem: TIntegerField;
    tabelads_sexo: TStringField;
    Panel4: TPanel;
    Bevel6: TBevel;
    procedure tabelaNewRecord(DataSet: TDataSet);
    procedure grdTitleClick(Column: TColumn);
    procedure FormShow(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure btnExcluirClick(Sender: TObject);
    procedure btnFecharClick(Sender: TObject);
    procedure btnInserirClick(Sender: TObject);
    procedure btnAlterarClick(Sender: TObject);
    procedure btnSalvarClick(Sender: TObject);
    procedure btnCancelarClick(Sender: TObject);
    procedure datasourceStateChange(Sender: TObject);
    procedure pmQtdPopup(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmCadPadrao: TfrmCadPadrao;

implementation

uses Main, uDM;

{$R *.dfm}

procedure TfrmCadPadrao.FormShow(Sender: TObject);
begin
   { Todas em maiúsculas }
   DM.TodasMaiusculas(TForm(Sender));

   Self.Caption := pnTitulo.Caption;

   //tabela.close();
   //tabela.open();
end;

procedure TfrmCadPadrao.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
   Action := caFree;
end;

procedure TfrmCadPadrao.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  case Key of
    VK_F2 : btnInserirClick( nil );
    VK_F3 : btnAlterarClick( nil );
    VK_F5 : btnSalvarClick( nil );
    VK_F4 : btnExcluirClick( nil );
    VK_F6 : btnCancelarClick( nil );
    VK_F12 : btnSairClick( nil );
  end;

end;

procedure TfrmCadPadrao.btnExcluirClick(Sender: TObject);
begin
  if Mensagem( 'Deseja realmente excluir ?', Application.Title,
     MB_YESNO + MB_ICONQUESTION ) = ID_YES then
  begin
     //tabela.Delete;
  end;
end;

procedure TfrmCadPadrao.btnFecharClick(Sender: TObject);
begin
   //tabela.Close;
   //tabela.Open;
   Close;
end;

procedure TfrmCadPadrao.btnInserirClick(Sender: TObject);
begin
   //campo.SetFocus;
   //tabela.Insert;
end;

procedure TfrmCadPadrao.btnAlterarClick(Sender: TObject);
begin
   //campo.SetFocus;
   //tabela.Edit;
end;

procedure TfrmCadPadrao.btnSalvarClick(Sender: TObject);
var
   lugar : Pointer;
begin
   //lugar := tabela.GetBookmark;

   //tabela.Post;
   //tabela.Close;
   //tabela.Open;

   //tabela.GotoBookmark(lugar);

end;

procedure TfrmCadPadrao.btnCancelarClick(Sender: TObject);
begin
   //tabela.Cancel;
end;

procedure TfrmCadPadrao.datasourceStateChange(Sender: TObject);
var
   estado : boolean;
begin
   //estado := (tabela.State in [dsInsert, dsEdit]);

   btnInserir.Enabled := not estado;
   btnAlterar.Enabled := not estado;
   btnExcluir.Enabled := not estado;

   btnSalvar.Enabled := estado;
   btnCancelar.Enabled := estado;

   btnFechar.Enabled := not estado;
end;

procedure TfrmCadPadrao.pmQtdPopup(Sender: TObject);
begin
  //DM.quantidade_registros(tabela, pmQtd);
end;

procedure TfrmCadPadrao.grdTitleClick(Column: TColumn);
var
   sCampo : string;
   sOrdem : string;
begin
   sCampo := Column.FieldName;

   if Column.Title.Font.Style = [fsBold] then begin
      sOrdem := 'DESC';
      Column.Title.Font.Style := [fsItalic];
   end
   else if Column.Title.Font.Style = [fsItalic] then begin
      sOrdem := '';
      Column.Title.Font.Style := [];
   end
   else begin
      sOrdem := 'ASC';
      Column.Title.Font.Style := [fsBold];
   end;

   if sOrdem <> '' then begin
      with tabela do begin
         Close();
         SQL.Text := '                ' +
            'SELECT                   ' +
            '   *                     ' +
            'FROM                     ' +
            '   tabela                ' +
            'ORDER BY                 ' +
            '   '+sCampo+' '+sOrdem+' ' +
         '';
         Open();
      end;
   end;

end;

procedure TfrmCadPadrao.tabelaNewRecord(DataSet: TDataSet);
begin
{   DM.qyAux.Close;
   DM.qyAux.SQL.Clear;
   DM.qyAux.SQL.Add('select max(campo) ultimo from tabela');
   DM.qyAux.Open;

   tabela.FieldByName('campo').AsInteger := DM.qyAux.FieldByName('ultimo').AsInteger + 1;

   DM.qyAux.Close;
}end;

end.
