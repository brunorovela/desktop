unit uFSelCategoriaHorario;

interface

uses
   Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
   Dialogs, ExtCtrls, DB, ZConnection, ComCtrls, ToolWin, ImgList, Grids, DBGrids,
   StdCtrls, DBCtrls, ZAbstractRODataset, ZAbstractDataset, ZDataset, UZDataset,
   uDM;

type
   TfSelCategoriaHorario = class(TForm)
   published
      pnTitulo: TPanel;
      bvSep1: TBevel;
      dsCategorias: TDataSource;
      qyCategorias: TUMZQuery;
      ilImagens: TImageList;
      tbAcoes: TToolBar;
      tbSep1: TToolButton;
      tbConfirmar: TToolButton;
      tbCancelar: TToolButton;
      tbSep2: TToolButton;
      tbSep3: TToolButton;
      bvSep2: TBevel;
      qyCategoriasds_categoria: TStringField;
      lbCategorias: TDBLookupListBox;
      procedure FormCreate(Sender: TObject);
      procedure AposAbrirQueryCategorias(DataSet: TDataSet);
      procedure ProcessaTeclasAtalho(Sender: TObject; var Key: Word;
         Shift: TShiftState);
      procedure CancelaSelecao(Sender: TObject);
      procedure ConfirmaSelecao(Sender: TObject);
      procedure SelecionaCategoria(Sender: TObject);
   private
      FSCategoria: string;
   public
      class function GetCategoria(AOwner: TComponent; var ASCategoria: string): boolean;
   end;

var
   fSelCategoriaHorario: TfSelCategoriaHorario;

implementation

{$R *.dfm}

{ TfSelCategoriaHorario }

procedure TfSelCategoriaHorario.AposAbrirQueryCategorias(DataSet: TDataSet);
begin
   Self.tbConfirmar.Enabled := not Self.qyCategorias.IsEmpty;
end;

procedure TfSelCategoriaHorario.CancelaSelecao(Sender: TObject);
begin
   Self.ModalResult := mrCancel;
   Self.CloseModal;
end;

procedure TfSelCategoriaHorario.ConfirmaSelecao(Sender: TObject);
begin
   Self.FSCategoria := Self.qyCategoriasds_categoria.AsString;
   Self.ModalResult := mrOk;
   Self.CloseModal;
end;

procedure TfSelCategoriaHorario.FormCreate(Sender: TObject);
begin
   Self.qyCategorias.Open;
end;

class function TfSelCategoriaHorario.GetCategoria(AOwner: TComponent;
  var ASCategoria: string): boolean;
begin
   if not Assigned(fSelCategoriaHorario) then
      fSelCategoriaHorario := TfSelCategoriaHorario.Create(AOwner);
   try
      Result := fSelCategoriaHorario.ShowModal = mrOk;
      if Result then
      begin
         if Trim(fSelCategoriaHorario.FSCategoria) = '' then
            Result := false;
         ASCategoria := fSelCategoriaHorario.FSCategoria;
      end;
   finally
      FreeAndNil(fSelCategoriaHorario);
   end;
end;

procedure TfSelCategoriaHorario.ProcessaTeclasAtalho(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
   case Key of
      VK_F5:
         if Self.tbConfirmar.Enabled then
            Self.ConfirmaSelecao(nil);
      VK_F6:
         if Self.tbCancelar.Enabled then
            Self.CancelaSelecao(nil);
   end;
end;

procedure TfSelCategoriaHorario.SelecionaCategoria(Sender: TObject);
begin
   Self.ConfirmaSelecao(nil);
end;

end.

