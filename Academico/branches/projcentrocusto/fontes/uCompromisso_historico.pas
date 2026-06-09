unit uCompromisso_historico;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, udm, Grids, DBGrids, DB, DBTables, StdCtrls, Mask, DBCtrls,
  ToolWin, ComCtrls, ImgList,General, ZAbstractRODataset, ZAbstractDataset,
  UZDataset;

type
  TfrmCompromissoHistorico = class(TForm)
    pnTitulo: TPanel;
    dsCompromissoHistorico: TDataSource;
    tbBotoesAcao: TToolBar;
    ToolButton1: TToolButton;
    btnIncluir: TToolButton;
    btnAlterar: TToolButton;
    ToolButton5: TToolButton;
    btnExcluir: TToolButton;
    btnSalvar: TToolButton;
    imgBotoes: TImageList;
    btnCancelar: TToolButton;
    btnFechar: TToolButton;
    ToolButton2: TToolButton;
    qyCompromissoHistorico: TUMZQuery;
    Panel1: TPanel;
    dbGridHistorico: TDBGrid;
    Panel2: TPanel;
    lbCodigo: TLabel;
    lbHistorico: TLabel;
    dbCodigo: TDBText;
    dbHistorico: TDBEdit;
    procedure dbGridHistoricoTitleClick(Column: TColumn);
    procedure FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure FormShow(Sender: TObject);
    procedure qyCompromissoHistoricoBeforeEdit(DataSet: TDataSet);
    procedure qyCompromissoHistoricoNewRecord(DataSet: TDataSet);
    procedure btnIncluirClick(Sender: TObject);
    procedure btnAlterarClick(Sender: TObject);
    procedure btnExcluirClick(Sender: TObject);
    procedure btnSalvarClick(Sender: TObject);
    procedure btnCancelarClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure btnFecharClick(Sender: TObject);
    procedure botoesConfirmacao(valor: boolean);
    procedure desabilitaCampo( valor: boolean );
  strict private
    bmListagem : Pointer;

    procedure Filtrar(const ordenacao: String = '');
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmCompromissoHistorico: TfrmCompromissoHistorico;

implementation

{$R *.dfm}

procedure TfrmCompromissoHistorico.botoesConfirmacao(valor: boolean);
begin
   btnSalvar.Enabled    := valor;
   btnCancelar.Enabled  := valor;
   btnIncluir.Enabled   := not valor;
   btnAlterar.Enabled   := not valor;
   btnExcluir.Enabled   := not valor;
end;

procedure TfrmCompromissoHistorico.btnAlterarClick(Sender: TObject);
begin
   if qyCompromissoHistorico.RecordCount > 0 then
   begin
      dbHistorico.SetFocus();
      qyCompromissoHistorico.Edit;

      bmListagem := qyCompromissoHistorico.GetBookmark;
   end
   else
   begin
      Mensagem('Selecione um registro para alterar.', 'Atenção', MB_OK + MB_ICONWARNING);
   end;
end;

procedure TfrmCompromissoHistorico.btnCancelarClick(Sender: TObject);
begin
   qyCompromissoHistorico.Cancel;

   Self.botoesConfirmacao( false );
end;

procedure TfrmCompromissoHistorico.btnExcluirClick(Sender: TObject);
begin
   if qyCompromissoHistorico.RecordCount > 0 then
   begin
      if  Mensagem('Deseja excluir o registro selecionado?', 'Confirmação', MB_YESNO + MB_ICONQUESTION ) = mrYes then
      begin
         qyCompromissoHistorico.Delete;

         if qyCompromissoHistorico.RecordCount = 0 then
         begin
            desabilitaCampo(false);
         end;

      end;
   end;
end;

procedure TfrmCompromissoHistorico.btnFecharClick(Sender: TObject);
begin
   qyCompromissoHistorico.Cancel;
   Self.Close();
end;

procedure TfrmCompromissoHistorico.btnIncluirClick(Sender: TObject);
begin
   if dbHistorico.Enabled = false then
   begin
      dbHistorico.Enabled := true;
   end;

   dbHistorico.SetFocus();
   qyCompromissoHistorico.Insert;
end;

procedure TfrmCompromissoHistorico.btnSalvarClick(Sender: TObject);
var
   LastInsert : String;
   BuscaById: Boolean;
begin
   BuscaById := (qyCompromissoHistorico.State in [dsInsert]);

   qyCompromissoHistorico.Post;

   if BuscaById then
      LastInsert := IntToStr( DM.LastInsert );

   Filtrar();

   Self.botoesConfirmacao( false );
   dbGridHistorico.SetFocus();

   qyCompromissoHistorico.Last;
   qyCompromissoHistorico.First;

   if BuscaById then
      qyCompromissoHistorico.Locate( 'cd_historico', LastInsert, [] )
   else if qyCompromissoHistorico.BookmarkValid(bmListagem) then
      qyCompromissoHistorico.GotoBookmark(bmListagem);
end;

procedure TfrmCompromissoHistorico.dbGridHistoricoTitleClick(Column: TColumn);
begin
   if btnSalvar.Enabled then
      Mensagem( 'Salve a Inclusão/Alteração para ordenar os valores.', '', MB_OK + MB_ICONINFORMATION, Handle )
   else
      Filtrar( Column.FieldName );
end;

procedure TfrmCompromissoHistorico.desabilitaCampo(valor: boolean);
begin
   dbHistorico.Enabled := valor;
end;

procedure TfrmCompromissoHistorico.Filtrar(const ordenacao: String);
const
   SQL_LISTA_HISTORICO =
      'SELECT * FROM FIN_CP_HISTORICOS';
begin
   qyCompromissoHistorico.Close;
   qyCompromissoHistorico.SQL.Text := SQL_LISTA_HISTORICO;

   if qyCompromissoHistorico.SortedFields <> ordenacao then
   begin
      qyCompromissoHistorico.SortedFields := ordenacao;
      qyCompromissoHistorico.SortType := stAscending;
   end else begin
      if qyCompromissoHistorico.SortType = stAscending then
         qyCompromissoHistorico.SortType := stDescending
      else
         qyCompromissoHistorico.SortType := stAscending;
   end;

   qyCompromissoHistorico.Open;
end;

procedure TfrmCompromissoHistorico.FormClose(Sender: TObject; var Action: TCloseAction);
begin
   qyCompromissoHistorico.Cancel;
   qyCompromissoHistorico.Active := false;
   Action := caFree;
end;

procedure TfrmCompromissoHistorico.FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
begin
  case Key of
    VK_F2 : if btnIncluir.Enabled then btnIncluirClick(nil);
    VK_F3 : if btnAlterar.Enabled then btnAlterarClick(nil);
    VK_F5 : if btnSalvar.Enabled then btnSalvarClick(nil);
    VK_F6 : if btnCancelar.Enabled then btnCancelarClick(nil);
    VK_F9 : if btnExcluir.Enabled then btnExcluirClick(nil);
    VK_F12 : if btnFechar.Enabled then btnFecharClick(nil);
  end;
end;

procedure TfrmCompromissoHistorico.FormShow(Sender: TObject);
begin
   Filtrar();

   if qyCompromissoHistorico.RecordCount = 0 then
   begin
      desabilitaCampo(false);
   end;
end;

procedure TfrmCompromissoHistorico.qyCompromissoHistoricoBeforeEdit(
  DataSet: TDataSet);
begin
   Self.botoesConfirmacao( true );
end;

procedure TfrmCompromissoHistorico.qyCompromissoHistoricoNewRecord(
  DataSet: TDataSet);
begin
   Self.botoesConfirmacao( true );
end;

end.
