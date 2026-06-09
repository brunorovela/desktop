unit uFbuscaAreas;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Grids, DBGrids, ExtCtrls, DB, ZAbstractRODataset, ZAbstractDataset,
  UZDataset, StdCtrls;

type
  TFBuscaAreas = class(TForm)
    pnlPrincipal: TPanel;
    qryAreas: TUMZQuery;
    dsAreas: TDataSource;
    lblNome: TLabel;
    edNome: TEdit;
    qryAreascd_area: TIntegerField;
    qryAreasds_area: TStringField;
    dbgDragAndDrop: TDBGrid;
    procedure dbgDragAndDropColEnter(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure edNomeChange(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FBuscaAreas: TFBuscaAreas;

implementation



{$R *.dfm}

procedure TFBuscaAreas.dbgDragAndDropColEnter(Sender: TObject);
begin
   dbgDragAndDrop.BeginDrag(true);
end;

procedure TFBuscaAreas.edNomeChange(Sender: TObject);
begin
   qryAreas.Close;
   qryAreas.ParamByName('area').AsString := '%'+edNome.Text+'%';
   qryAreas.Open;
end;

procedure TFBuscaAreas.FormShow(Sender: TObject);
begin
   qryAreas.Close;
   qryAreas.ParamByName('area').AsString := '%%';
   qryAreas.Open;
end;

end.
