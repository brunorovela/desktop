unit uSelConcurso;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, ComCtrls, ToolWin, Grids, DBGrids, ImgList, DB,
  ZAbstractRODataset, UZDataset;

type
  TSelConcurso = class(TForm)
    Panel3: TPanel;
    gridConcursos: TDBGrid;
    Panel7: TPanel;
    toolConcurso: TToolBar;
    btnSelConcurso: TToolButton;
    ToolButton1: TToolButton;
    btnFechar: TToolButton;
    ImageList1: TImageList;
    qyConcursos: TUMZReadOnlyQuery;
    dsConcursos: TDataSource;
    qyConcursosDT_INSCRICAO: TDateTimeField;
    qyConcursosDS_SITUACAO: TStringField;
    qyConcursosCD_CURSO: TStringField;
    qyConcursosPROCESSO: TStringField;
    qyConcursosds_concurso: TStringField;
    qyConcursosds_area: TStringField;
    qyConcursosNR_ANOSEMESTRE: TIntegerField;
    qyConcursosCD_GRADE: TIntegerField;
    qyConcursosCD_COLIGADA: TSmallintField;
    qyConcursosNM_COLIGADA: TStringField;
    procedure FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure qyConcursosCalcFields(DataSet: TDataSet);
    procedure selecionarConcurso(Sender: TObject);
    procedure btnFecharClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    flgSearch: boolean;
  end;

var
  fSelConcurso: TSelConcurso;

implementation

{$R *.dfm}

procedure TSelConcurso.btnFecharClick(Sender: TObject);
begin
   flgSearch := false;
   qyConcursos.Close;
   Close;
end;

procedure TSelConcurso.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin

   if Key = VK_F12 then
      btnFechar.Click;

end;

procedure TSelConcurso.qyConcursosCalcFields(DataSet: TDataSet);
begin
   if qyConcursosds_concurso.AsString = qyConcursosds_area.AsString then
   begin
      qyConcursosPROCESSO.AsString := qyConcursosds_concurso.AsString;
   end else begin
      qyConcursosPROCESSO.AsString := qyConcursosds_concurso.AsString + ' / ' + qyConcursosds_area.AsString;
   end;
end;

procedure TSelConcurso.selecionarConcurso(Sender: TObject);
begin
   flgSearch := true;
   Close;
end;

end.
