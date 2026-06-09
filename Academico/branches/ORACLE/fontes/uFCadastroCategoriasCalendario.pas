unit uFCadastroCategoriasCalendario;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ComCtrls, ToolWin, ImgList, ExtCtrls, uDM, DB, ZAbstractRODataset,
  ZAbstractDataset, UZDataset, StdCtrls, Mask, DBCtrls, General;

type
  TformCategoriaCalendario = class(TForm)
    Panel1: TPanel;
    pnTitulo: TPanel;
    ImageList1: TImageList;
    toolPessoa: TToolBar;
    btnCancelar: TToolButton;
    btnExcluir: TToolButton;
    btnSalvar: TToolButton;
    qryCategorias: TUMZQuery;
    qryCategoriascd_categoria: TIntegerField;
    qryCategoriasds_categoria: TStringField;
    qryCategoriasds_cor: TStringField;
    edDescricao: TDBEdit;
    Label1: TLabel;
    dsCategorias: TDataSource;
    qryVerificar: TUMZQuery;
    ColorDialog1: TColorDialog;
    Button1: TButton;
    procedure Button1Click(Sender: TObject);
    procedure btnExcluirClick(Sender: TObject);
    procedure btnCancelarClick(Sender: TObject);
    procedure btnSalvarClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
  private
    function TColorToHex( Color : TColor ): string;
    function HexToTColor( sColor : string ): TColor;
    { Private declarations }
  public
    modo: Integer;
    cd_categoria: Integer;
    cd_calendario: Integer;
    { Public declarations }
  end;

var
  formCategoriaCalendario: TformCategoriaCalendario;

implementation

{$R *.dfm}

function TformCategoriaCalendario.TColorToHex( Color : TColor ): string;
begin
  Result :=
    { red value }
    IntToHex( GetRValue( Color ), 2 ) +
    { green value }
    IntToHex( GetGValue( Color ), 2 ) +
    { blue value }
    IntToHex( GetBValue( Color ), 2 );
end;

function TformCategoriaCalendario.HexToTColor( sColor : string ): TColor;
begin
  Result :=
    RGB(
      { get red value }
      StrToInt( '$'+Copy( sColor, 1, 2 ) ),
      { get green value }
      StrToInt( '$'+Copy( sColor, 3, 2 ) ),
      { get blue value }
      StrToInt( '$'+Copy( sColor, 5, 2 ) )
    );
end;

procedure TformCategoriaCalendario.btnCancelarClick(Sender: TObject);
begin
   Self.Close;
end;

procedure TformCategoriaCalendario.btnExcluirClick(Sender: TObject);
begin
   qryVerificar.Close;
   qryVerificar.ParamByName('categoria').AsInteger := cd_categoria;
   qryVerificar.ParamByName('calendario').AsInteger := cd_calendario;
   qryVerificar.Open;

   if(qryVerificar.FieldByName('contador').AsInteger > 0) then
   begin
      Mensagem('Não é possivel excluir esta categoria pois ela esta vinculada a algum calendário.',  'Confirmação', MB_OK + MB_ICONWARNING );
      exit;
   end;

   qryCategorias.Delete;
   Self.Close;
end;

procedure TformCategoriaCalendario.btnSalvarClick(Sender: TObject);
begin
   qryCategoriasds_cor.AsString := TColorToHex(ColorDialog1.Color);
   qryCategorias.Post;
   Self.Close;
end;

procedure TformCategoriaCalendario.Button1Click(Sender: TObject);
begin
   ColorDialog1.Execute;
end;

procedure TformCategoriaCalendario.FormShow(Sender: TObject);
begin
   qryCategorias.Close;

   if(modo = 1) then
   begin
      btnExcluir.Enabled := false;
      qryCategorias.Open;
      qryCategorias.Insert;
      exit;
   end;

   btnExcluir.Enabled := true;
   qryCategorias.ParamByName('categoria').AsInteger := cd_categoria;
   qryCategorias.Open;
   qryCategorias.Edit;
   ColorDialog1.Color := HexToTColor(qryCategoriasds_cor.AsString);
end;
end.
