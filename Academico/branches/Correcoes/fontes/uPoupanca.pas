unit uPoupanca;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Db, ZConnection, DBCtrls, Buttons, Grids, DBGrids, ExtCtrls, General,
  ZAbstractRODataset, ZAbstractDataset, ZDataset, UZDataset,
  StdCtrls, Mask, ImgList, ComCtrls, ToolWin, Menus, UZSortedGrid, uLkJSON;

type
  TfrmPoupanca = class(TForm)
    Panel1: TPanel;
    Panel3: TPanel;
    grd: TZSortedGrid;
    dtcPoupanca: TDataSource;
    tblPoupanca: TUMZQuery;
    Bevel1: TBevel;
    Bevel2: TBevel;
    pnIndice: TPanel;
    Label1: TLabel;
    Label2: TLabel;
    DBEdit2: TDBEdit;
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
    pmQtd: TPopupMenu;
    tblPoupancaDATA: TDateTimeField;
    tblPoupancaINDICEPOUPANCA: TFloatField;
    tblPoupancaINDICECORRIGIDO: TFloatField;
    tblPoupancaCD_POUPANCA: TLargeintField;
    tblPoupancaSN_CALCULADO: TSmallintField;
    DBEdit1: TDBEdit;
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
    procedure FormShow(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure btnSairClick(Sender: TObject);
    procedure pmQtdPopup(Sender: TObject);
  private
    dblIndice : Double;
      FJSONOldRecord: TlkJSONobject;
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
   FJSONOldRecord := nil;
   pnIndice.Visible := True;
   DBEdit1.SetFocus;
   tblPoupanca.Insert;
end;

procedure TfrmPoupanca.btnAlterarClick(Sender: TObject);
begin
   FJSONOldRecord := DM.RecordToJSON(tblPoupanca);
  pnIndice.Visible := True;
  DBEdit1.SetFocus;
  tblPoupanca.Edit;
end;

procedure TfrmPoupanca.btnSalvarClick(Sender: TObject);
var
   JSONObject: TlkJSONobject;
   Operacao, Key: AnsiString;
begin
  if Mensagem( 'Deseja realmente salvar ?', Application.Title,
       MB_YESNO + MB_ICONQUESTION ) = ID_YES then
    begin
      DBEdit2.SetFocus;
      DBEdit1.SetFocus;
      tblPoupanca.DisableControls;
      tblPoupancaSN_CALCULADO.AsInteger := 0;
      tblPoupanca.Post;

      Key := tblPoupancaCD_POUPANCA.AsString;
      
      if FJSONOldRecord = nil then
      begin
         JSONObject := DM.RecordToJSON(tblPoupanca);
         Operacao := 'Inclusao';
      end;

      if FJSONOldRecord <> nil then
      begin
         JSONObject := TlkJSONobject.Create(True);
         JSONObject.Add('antigo', FJSONOldRecord);
         JSONObject.Add('novo', DM.RecordToJSON(tblPoupanca));
         Operacao := 'Alteracao';        
      end;

      DM.setLog(2005, Operacao, Key, DM.UsuarioLogado.ColigadaLogada,
         UTF8Decode(TlkJSON.GenerateText(JSONObject)));

      JSONObject.Free;
      FJSONOldRecord := nil;

      CorrigirIndices;
      tblPoupanca.Refresh;
      tblPoupanca.EnableControls;
    end;
end;

procedure TfrmPoupanca.btnCancelarClick(Sender: TObject);
begin
  tblPoupanca.Cancel;
end;

procedure TfrmPoupanca.btnExcluirClick(Sender: TObject);
const
   SLogOperacao = 'Exclusao';
var
   JSONObject: TlkJSONobject;
   Key: AnsiString;
begin
   if Mensagem( 'Deseja realmente excluir ?', Application.Title, MB_YESNO + MB_ICONQUESTION ) = ID_YES then
   begin
      JSONObject := DM.RecordToJSON(tblPoupanca);
      try
         Key := tblPoupancaCD_POUPANCA.AsString;
         
         DM.setLog(2005, SLogOperacao, Key, DM.UsuarioLogado.ColigadaLogada,
            UTF8Decode(TlkJSON.GenerateText(JSONObject)));
      finally
         JSONObject.Free;
      end;

      tblPoupanca.DisableControls;
      tblPoupanca.Delete;
      CorrigirIndices;
      tblPoupanca.Refresh;
      tblPoupanca.EnableControls;
   end;
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
const
   SSQLCorrigeIndices = ''
      + 'UPDATE '
      + '   poupanca p, '
      + '   ( '
      + '      SELECT '
      + '         a.CD_POUPANCA, '
      + '         COALESCE(ROUND(EXP(SUM(LOG(b.indicepoupanca / 100 + 1))), 4), 1) vl_corrigido '
      + '      FROM '
      + '         poupanca a '
      + '            LEFT JOIN poupanca b ON '
      + '               (a.`data` < b.`data`) '
      + '      GROUP BY '
      + '         a.`data` '
      + '   ) t '
      + 'SET '
      + '   p.indicecorrigido = t.vl_corrigido '
      + 'WHERE '
      + '   p.CD_POUPANCA = t.CD_POUPANCA ';
begin
   DM.db.ExecuteDirect(SSQLCorrigeIndices);
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

procedure TfrmPoupanca.FormShow(Sender: TObject);
begin
  { Todas em maiúsculas }
  DM.TodasMaiusculas(TForm(Sender));

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

