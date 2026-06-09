unit UFReportUIPerms;

interface

uses
   Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
   Dialogs, DB, ZAbstractRODataset, ZAbstractDataset, UZDataset, ComCtrls,
   DBClient, Provider, Grids, DBGrids, ZSqlUpdate, ExtCtrls, StdCtrls, Buttons,
   UDBGrids, Menus, ImgList;

type
   TfrmReportUIPerms = class(TForm)
      bbtnCancelar: TBitBtn;
      bbtnSalvar: TBitBtn;
      bvlSep1: TBevel;
      bvlSep2: TBevel;
      bvlSep3: TBevel;
      bvlSep4: TBevel;
      cdsCategoria: TClientDataSet;
      cdsCategoriaCD_CATEGORIA: TLargeintField;
      cdsCategoriaCD_GRUPO: TIntegerField;
      cdsCategoriaCD_PERMISSAO: TLargeintField;
      cdsCategoriaDS_NOME_GRUPO: TStringField;
      cdsCategoriaSN_CONCEDER: TIntegerField;
      cdsCategoriaSN_IMPRIMIR: TIntegerField;
      cdsCategoriaSN_RENOMEAR: TIntegerField;
      cdsRelatorio: TClientDataSet;
      cdsRelatorioCD_GRUPO: TIntegerField;
      cdsRelatorioCD_PERMISSAO: TLargeintField;
      cdsRelatorioCD_RELATORIO: TLargeintField;
      cdsRelatorioDS_NOME_GRUPO: TStringField;
      cdsRelatorioSN_CONCEDER: TIntegerField;
      cdsRelatorioSN_IMPRIMIR: TIntegerField;
      cdsRelatorioSN_RENOMEAR: TIntegerField;
      dbgCategoria: TSortedDBGrid;
      dbgRelatorio: TSortedDBGrid;
      dsCategoria: TDataSource;
      dspCategoria: TDataSetProvider;
      dspRelatorio: TDataSetProvider;
      dsRelatorio: TDataSource;
      ilOpcoes: TImageList;
      imgCategoria: TImage;
      imgRelatorio: TImage;
      lblCategoria: TLabel;
      lblRelatorio: TLabel;
      miCategoriaConcederDesmarcar: TMenuItem;
      miCategoriaConcederMarcar: TMenuItem;
      miCategoriaImprimirDesmarcar: TMenuItem;
      miCategoriaImprimirMarcar: TMenuItem;
      miCategoriaRenomearDesmarcar: TMenuItem;
      miCategoriaRenomearMarcar: TMenuItem;
      miRelatorioConcederDesmarcar: TMenuItem;
      miRelatorioConcederMarcar: TMenuItem;
      miRelatorioImprimirDesmarcar: TMenuItem;
      miRelatorioImprimirMarcar: TMenuItem;
      miRelatorioRenomearDesmarcar: TMenuItem;
      miRelatorioRenomearMarcar: TMenuItem;
      pgcOpcoes: TPageControl;
      pmCategoriaConceder: TPopupMenu;
      pmCategoriaImprimir: TPopupMenu;
      pmCategoriaRenomear: TPopupMenu;
      pmRelatorioConceder: TPopupMenu;
      pmRelatorioImprimir: TPopupMenu;
      pmRelatorioRenomear: TPopupMenu;
      pnlBotoes: TPanel;
      pnlCategoria: TPanel;
      pnlRelatorio: TPanel;
      qryCategoria: TUMZQuery;
      qryCategoriaCD_CATEGORIA: TLargeintField;
      qryCategoriaCD_GRUPO: TIntegerField;
      qryCategoriaCD_PERMISSAO: TLargeintField;
      qryCategoriaDS_NOME_GRUPO: TStringField;
      qryCategoriaSN_CONCEDER: TIntegerField;
      qryCategoriaSN_IMPRIMIR: TIntegerField;
      qryCategoriaSN_RENOMEAR: TIntegerField;
      qryRelatorio: TUMZQuery;
      qryRelatorioCD_GRUPO: TIntegerField;
      qryRelatorioCD_PERMISSAO: TLargeintField;
      qryRelatorioCD_RELATORIO: TLargeintField;
      qryRelatorioDS_NOME_GRUPO: TStringField;
      qryRelatorioSN_CONCEDER: TIntegerField;
      qryRelatorioSN_IMPRIMIR: TIntegerField;
      qryRelatorioSN_RENOMEAR: TIntegerField;
      tbsCategoria: TTabSheet;
      tbsRelatorio: TTabSheet;
      updCategoria: TZUpdateSQL;
      updRelatorio: TZUpdateSQL;
      procedure DataGridCellClick(Column: TColumn);
      procedure DataGridDrawColumnCell(Sender: TObject; const Rect: TRect;
         DataCol: Integer; Column: TColumn; State: TGridDrawState);
      procedure FormClose(Sender: TObject; var Action: TCloseAction);
      procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
      procedure miCategoriaConcederDesmarcarClick(Sender: TObject);
      procedure miCategoriaConcederMarcarClick(Sender: TObject);
      procedure miCategoriaImprimirDesmarcarClick(Sender: TObject);
      procedure miCategoriaImprimirMarcarClick(Sender: TObject);
      procedure miCategoriaRenomearDesmarcarClick(Sender: TObject);
      procedure miCategoriaRenomearMarcarClick(Sender: TObject);
      procedure miRelatorioConcederDesmarcarClick(Sender: TObject);
      procedure miRelatorioConcederMarcarClick(Sender: TObject);
      procedure miRelatorioImprimirDesmarcarClick(Sender: TObject);
      procedure miRelatorioImprimirMarcarClick(Sender: TObject);
      procedure miRelatorioRenomearDesmarcarClick(Sender: TObject);
      procedure miRelatorioRenomearMarcarClick(Sender: TObject);
   private
      FActiveDataSet: TClientDataSet;
      function Changed: Boolean;
      procedure UpdateButtonStatus;
      procedure UpdateField(const FieldName: AnsiString; const Value: Integer;
         const DataSet: TDataSet);
   public
      class function ManageReportPrivileges(const ID: Cardinal;
         const Name: AnsiString): Boolean;
      class function ManageCategoryPrivileges(const ID: Cardinal;
         const Name: AnsiString): Boolean;
   end;

var
   frmReportUIPerms: TfrmReportUIPerms;

implementation

uses
   uDM, uIUMDataModule;

{$R *.dfm}

function TfrmReportUIPerms.Changed: Boolean;
begin
   Result := True;
   try
      FActiveDataSet.Delta;
   except
      on E: EDBClient do
         if E.ErrorCode = 16385 then
            Result := False;
   end;
end;

procedure TfrmReportUIPerms.DataGridCellClick(Column: TColumn);
var
   AllowClick: Boolean;
begin
   AllowClick :=
      (Column.FieldName = 'SN_IMPRIMIR') or
      (Column.FieldName = 'SN_RENOMEAR') or
      (Column.FieldName = 'SN_CONCEDER');
      
   if AllowClick then
   begin
      Column.Field.DataSet.Edit;
      Column.Field.AsInteger := Ord(not Boolean(Column.Field.AsInteger));
      Column.Field.DataSet.Post;
      UpdateButtonStatus;
   end;
end;

procedure TfrmReportUIPerms.DataGridDrawColumnCell(Sender: TObject;
  const Rect: TRect; DataCol: Integer; Column: TColumn; State: TGridDrawState);
const
   IsChecked: array[Boolean] of Integer = (DFCS_BUTTONCHECK,
      DFCS_BUTTONCHECK or DFCS_CHECKED);
var
   DrawRect: TRect;
   ReDraw: Boolean;
begin
   ReDraw :=
      (Column.FieldName = 'SN_IMPRIMIR') or
      (Column.FieldName = 'SN_RENOMEAR') or
      (Column.FieldName = 'SN_CONCEDER');

   if ReDraw then
   begin
      DrawRect := Rect;
      InflateRect(DrawRect, -2, -2);
      TDBGrid(Sender).Canvas.FillRect(Rect);
      DrawFrameControl(TDBGrid(Sender).Canvas.Handle, DrawRect, DFC_BUTTON,
         IsChecked[Column.Field.AsInteger = 1]);
   end;
end;

procedure TfrmReportUIPerms.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
   Action := caFree;
end;

procedure TfrmReportUIPerms.FormCloseQuery(Sender: TObject;
  var CanClose: Boolean);
const
   SCaption = 'Confirmação';
   SMsgConfirmSave = 'Deseja realmente aplicar as alterações?';
   SMsgConfirmCancel = 'Deseja realmente descartar as alterações?';
var
   S: AnsiString;
   UserChoice: Integer;
begin
   CanClose := not Changed;

   if CanClose then
      Exit;

   S := SMsgConfirmCancel;

   if ModalResult = mrOk then
      S := SMsgConfirmSave;

   UserChoice := MessageBox(Handle, PChar(S), SCaption,
      MB_ICONQUESTION or MB_YESNO);

   CanClose := UserChoice = ID_YES;
end;

class function TfrmReportUIPerms.ManageCategoryPrivileges(const ID: Cardinal;
  const Name: AnsiString): Boolean;
begin
   if frmReportUIPerms = nil then
      Application.CreateForm(TfrmReportUIPerms, frmReportUIPerms);

   frmReportUIPerms.pgcOpcoes.ActivePage := frmReportUIPerms.tbsCategoria;
   frmReportUIPerms.lblCategoria.Caption := Name;
   frmReportUIPerms.cdsCategoria.Close;
   frmReportUIPerms.cdsCategoria.Params.ParamByName('CD_CATEGORIA').AsInteger := ID;
   frmReportUIPerms.cdsCategoria.Params.ParamByName('CD_PESSOA').AsInteger := DM.UsuarioLogado.Pessoa.Codigo;
   frmReportUIPerms.cdsCategoria.Open;
   frmReportUIPerms.FActiveDataSet := frmReportUIPerms.cdsCategoria;
   Result := frmReportUIPerms.ShowModal = mrOk;

   if Result then
   begin
      frmReportUIPerms.cdsCategoria.ApplyUpdates(0);
   end;

   frmReportUIPerms := nil;
end;

class function TfrmReportUIPerms.ManageReportPrivileges(const ID: Cardinal;
  const Name: AnsiString): Boolean;
begin
   if frmReportUIPerms = nil then
      Application.CreateForm(TfrmReportUIPerms, frmReportUIPerms);

   frmReportUIPerms.pgcOpcoes.ActivePage := frmReportUIPerms.tbsRelatorio;
   frmReportUIPerms.lblRelatorio.Caption := Name;
   frmReportUIPerms.cdsRelatorio.Close;
   frmReportUIPerms.cdsRelatorio.Params.ParamByName('CD_RELATORIO').AsInteger := ID;
   frmReportUIPerms.cdsRelatorio.Params.ParamByName('CD_PESSOA').AsInteger := DM.UsuarioLogado.Pessoa.Codigo;
   frmReportUIPerms.cdsRelatorio.Open;
   frmReportUIPerms.FActiveDataSet := frmReportUIPerms.cdsRelatorio;
   Result := frmReportUIPerms.ShowModal = mrOk;

   if Result then
   begin
      frmReportUIPerms.cdsRelatorio.ApplyUpdates(0);
   end;

   frmReportUIPerms := nil;
end;

procedure TfrmReportUIPerms.miCategoriaConcederDesmarcarClick(Sender: TObject);
begin
   UpdateField('SN_CONCEDER', 0, cdsCategoria);
end;

procedure TfrmReportUIPerms.miCategoriaConcederMarcarClick(Sender: TObject);
begin
   UpdateField('SN_CONCEDER', 1, cdsCategoria);
end;

procedure TfrmReportUIPerms.miCategoriaImprimirDesmarcarClick(Sender: TObject);
begin
   UpdateField('SN_IMPRIMIR', 0, cdsCategoria);
end;

procedure TfrmReportUIPerms.miCategoriaImprimirMarcarClick(Sender: TObject);
begin
   UpdateField('SN_IMPRIMIR', 1, cdsCategoria);
end;

procedure TfrmReportUIPerms.miCategoriaRenomearDesmarcarClick(Sender: TObject);
begin
   UpdateField('SN_RENOMEAR', 0, cdsCategoria);
end;

procedure TfrmReportUIPerms.miCategoriaRenomearMarcarClick(Sender: TObject);
begin
   UpdateField('SN_RENOMEAR', 1, cdsCategoria);
end;

procedure TfrmReportUIPerms.miRelatorioConcederDesmarcarClick(Sender: TObject);
begin
   UpdateField('SN_CONCEDER', 0, cdsRelatorio);
end;

procedure TfrmReportUIPerms.miRelatorioConcederMarcarClick(Sender: TObject);
begin
   UpdateField('SN_CONCEDER', 1, cdsRelatorio);
end;

procedure TfrmReportUIPerms.miRelatorioImprimirDesmarcarClick(Sender: TObject);
begin
   UpdateField('SN_IMPRIMIR', 0, cdsRelatorio);
end;

procedure TfrmReportUIPerms.miRelatorioImprimirMarcarClick(Sender: TObject);
begin
   UpdateField('SN_IMPRIMIR', 1, cdsRelatorio);
end;

procedure TfrmReportUIPerms.miRelatorioRenomearDesmarcarClick(Sender: TObject);
begin
   UpdateField('SN_RENOMEAR', 0, cdsRelatorio);
end;

procedure TfrmReportUIPerms.miRelatorioRenomearMarcarClick(Sender: TObject);
begin
   UpdateField('SN_RENOMEAR', 1, cdsRelatorio);
end;

procedure TfrmReportUIPerms.UpdateButtonStatus;
begin
   bbtnSalvar.Enabled := Changed;
end;

procedure TfrmReportUIPerms.UpdateField(const FieldName: AnsiString;
  const Value: Integer; const DataSet: TDataSet);
var
   Bookmark: TBookmark;
begin
   Bookmark := DataSet.GetBookmark;
   DataSet.DisableControls;
   DataSet.First;
   while not DataSet.Eof do
   begin
      DataSet.Edit;
      DataSet.FieldByName(FieldName).AsInteger := Value;
      DataSet.Post;
      DataSet.Next;
   end;
   DataSet.GotoBookmark(Bookmark);
   DataSet.EnableControls;
   UpdateButtonStatus;
end;

end.
