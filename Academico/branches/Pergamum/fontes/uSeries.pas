unit uSeries;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  ExtCtrls, Grids, Wwdbigrd, Wwdbgrid, ComCtrls, Db, Wwdatsrc, ZConnection,
  Wwquery, TB97, TB97Tlbr, Buttons, StdCtrls, Mask, DBCtrls;

type
  TfrmSeries = class(TForm)
    paCabecalho: TPanel;
    Toolbar971: TToolbar97;
    btnIncluir: TSpeedButton;
    btnAlterar: TSpeedButton;
    btnSalvar: TSpeedButton;
    ToolbarSep972: TToolbarSep97;
    tbNavigator: TToolbar97;
    btnCancelar: TSpeedButton;
    btnImprimir: TSpeedButton;
    btnPesquisar: TSpeedButton;
    btnSair: TSpeedButton;
    btnExcluir: TSpeedButton;
    Dock971: TDock97;
    quSeries: TwwQuery;
    dsSeries: TwwDataSource;
    quSeriesCodigo: TSmallintField;
    quSeriesDescricao: TStringField;
    qry: TUMZQuery;
    qryMaximo: TIntegerField;
    dgGeral: TwwDBGrid;
    Navigator: TDBNavigator;
    procedure dbeCodigoKeyPress(Sender: TObject; var Key: Char);
    procedure quSeriesNewRecord(DataSet: TDataSet);
    procedure btnIncluirClick(Sender: TObject);
    procedure btnAlterarClick(Sender: TObject);
    procedure btnSalvarClick(Sender: TObject);
    procedure btnCancelarClick(Sender: TObject);
    procedure btnSairClick(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormCreate(Sender: TObject);
    procedure dsSeriesStateChange(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmSeries: TfrmSeries;

implementation

{$R *.DFM}






procedure TfrmSeries.dbeCodigoKeyPress(Sender: TObject; var Key: Char);
begin
  if Key = #13 then
  begin
    SelectNext(ActiveControl, True, True);
    Key := #0;
  end;
end;

procedure TfrmSeries.quSeriesNewRecord(DataSet: TDataSet);
begin
  qry.Close;
  qry.Prepare;
  qry.Open;
  quSeriesCodigo.AsInteger := qryMaximo.AsInteger + 1;
  qry.Close;
end;

procedure TfrmSeries.btnIncluirClick(Sender: TObject);
begin
  quSeries.Append;
end;

procedure TfrmSeries.btnAlterarClick(Sender: TObject);
begin
  quSeries.Edit;
end;

procedure TfrmSeries.btnSalvarClick(Sender: TObject);
var
  Codigo : String;
begin
  Codigo := quSeriesCodigo.AsString;
  quSeries.Post;
  quSeries.DisableControls;
  quSeries.Close;
  quSeries.Open;
  quSeries.Locate( 'Codigo', Codigo, [loPartialKey] );
  quSeries.EnableControls;
end;

procedure TfrmSeries.btnCancelarClick(Sender: TObject);
begin
  quSeries.Cancel;
end;

procedure TfrmSeries.btnSairClick(Sender: TObject);
begin
  Close;
end;

procedure TfrmSeries.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  case Key of
    VK_F2 : if btnIncluir.Enabled then btnIncluirClick( nil );
    VK_F3 : if btnAlterar.Enabled then btnAlterarClick( nil );
    VK_F4 : if btnSalvar.Enabled then btnSalvarClick( nil );
{    VK_F5 : btnExcluirClick( nil );}
    VK_F6 : if btnCancelar.Enabled then btnCancelarClick( nil );
{    VK_F7 : btnImprimirClick( nil );}
  end;
end;

procedure TfrmSeries.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  quSeries.Close;
  Action := caFree;
end;

procedure TfrmSeries.FormCreate(Sender: TObject);
begin
  quSeries.Open;
end;

procedure TfrmSeries.dsSeriesStateChange(Sender: TObject);
begin
  btnIncluir.Enabled     := TDataSource( Sender ).State in [dsBrowse];
  btnAlterar.Enabled     := TDataSource( Sender ).State in [dsBrowse];
  btnSalvar.Enabled      := TDataSource( Sender ).State in [dsEdit, dsInsert];
  btnExcluir.Enabled     := TDataSource( Sender ).State in [dsBrowse];
  btnCancelar.Enabled    := TDataSource( Sender ).State in [dsEdit, dsInsert];

end;



end.

