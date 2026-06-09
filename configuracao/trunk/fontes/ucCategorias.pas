unit ucCategorias;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, DB, DBTables, ExtCtrls, StdCtrls, Mask, DBCtrls, Grids, DBGrids,
  Buttons;

type
  TfcCategorias = class(TForm)
    Panel3: TPanel;
    qyCategorias: TQuery;
    srcCategorias: TDataSource;
    Panel1: TPanel;
    dcgCategorias: TDBGrid;
    qyCategoriascd_categoria: TIntegerField;
    qyCategoriasds_categoria: TStringField;
    Label2: TLabel;
    deDescricao: TDBEdit;
    sbIncluir: TSpeedButton;
    sbExcluir: TSpeedButton;
    qyMaxCat: TQuery;
    procedure FormDestroy(Sender: TObject);
    procedure srcCategoriasStateChange(Sender: TObject);
    procedure dcgCategoriasDblClick(Sender: TObject);
    procedure sbIncluirClick(Sender: TObject);
    procedure sbExcluirClick(Sender: TObject);
    procedure deCodigoKeyPress(Sender: TObject; var Key: Char);
    procedure deDescricaoKeyPress(Sender: TObject; var Key: Char);
    procedure FormShow(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  fcCategorias: TfcCategorias;

implementation

{$R *.dfm}

procedure TfcCategorias.srcCategoriasStateChange(Sender: TObject);
begin
  if srcCategorias.State in [dsInsert, dsEdit] then
  begin
    deDescricao.ReadOnly := false;

    sbIncluir.Enabled := false;
    sbExcluir.Enabled := false;
  end
  else
  begin
    deDescricao.ReadOnly := true;

    sbIncluir.Enabled := true;
    sbExcluir.Enabled := true;
  end;
end;

procedure TfcCategorias.dcgCategoriasDblClick(Sender: TObject);
begin
  qyCategorias.Edit;

  deDescricao.SetFocus;
end;

procedure TfcCategorias.sbIncluirClick(Sender: TObject);
begin

  qyMaxCat.Close;
  qyMaxCat.Open;

  qyCategorias.Insert;

  qyCategorias.FieldByName('cd_categoria').AsInteger := qyMaxCat.FieldByName('MAX').AsInteger;

  deDescricao.SetFocus;

end;

procedure TfcCategorias.sbExcluirClick(Sender: TObject);
begin
  if qyCategorias.FieldByName('cd_categoria').AsInteger = 0 then
  begin
    MessageDlg('Você não pode excluir esta categoria!', mtError, [mbOK], 0);
    abort;
  end;

  if MessageDlg('Excluir o registro selecionado?', mtConfirmation, [mbYes, mbNo], 0) = mrYes then
  begin
    qyCategorias.Delete;
    qyCategorias.Close;
    qyCategorias.Open;    
  end;
end;

procedure TfcCategorias.deCodigoKeyPress(Sender: TObject; var Key: Char);
begin
  if key = #13 then
  begin
    key := #0;
    deDescricao.SetFocus;
  end;

end;

procedure TfcCategorias.deDescricaoKeyPress(Sender: TObject;
  var Key: Char);
begin
  if key = #27 then
  begin
    qyCategorias.Cancel;
    abort;
  end;

  if key = #13 then
  begin
    key := #0;
    if MessageDlg('Confirma a inclusão/alteração?', mtConfirmation, [mbYes, mbNo], 0) = mryes then
    begin
      try
        qyCategorias.Post;
        qyCategorias.Close;
        qyCategorias.Open;
      except
        MessageDlg('ERRO ao incluir/alterar!' + chr(13), mtError, [mbOk], 0);
      end;
    end;
  end;

end;

procedure TfcCategorias.FormShow(Sender: TObject);
begin
  qyCategorias.Close;
  qyCategorias.Open;
end;

procedure TfcCategorias.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  qyCategorias.Close;
  qyMaxCat.Close;
  Action := caFree;
end;

procedure TfcCategorias.FormDestroy(Sender: TObject);
begin
   fcCategorias := nil;
end;

end.
