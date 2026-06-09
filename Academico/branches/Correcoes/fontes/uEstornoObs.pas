unit uEstornoObs;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, DB, ZAbstractRODataset, ZAbstractDataset, UZDataset, DBCtrls,
  StdCtrls, ExtCtrls, Mask;

type
  TfrmTesourariaEstorno = class(TForm)
    qryEstorno: TUMZQuery;
    dsEstorno: TDataSource;
    qryEstornonm_pessoa: TStringField;
    qryEstornodt_baixa: TDateTimeField;
    qryEstornodt_estorno: TDateTimeField;
    qryEstornods_estorno: TMemoField;
    qryEstornods_caixa: TStringField;
    pnlDados: TPanel;
    lblUsuario: TLabel;
    dbeUsuario: TDBEdit;
    lblDataBaixa: TLabel;
    dbeDataBaixa: TDBEdit;
    lblDataEstorno: TLabel;
    dbeDataEstorno: TDBEdit;
    lblObservacoes: TLabel;
    dbmObservacoes: TDBMemo;
    lblCaixa: TLabel;
    dbeCaixa: TDBEdit;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmTesourariaEstorno: TfrmTesourariaEstorno;

implementation

{$R *.dfm}

end.
