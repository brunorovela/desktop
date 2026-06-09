unit uEstornoObs;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, DB, ZAbstractRODataset, ZAbstractDataset, UZDataset, DBCtrls,
  StdCtrls, ExtCtrls;

type
  TfrmTesourariaEstorno = class(TForm)
    pnlTopo: TPanel;
    pnlPrincipal: TPanel;
    Label4: TLabel;
    lblUsuario: TLabel;
    Label3: TLabel;
    Label2: TLabel;
    Label1: TLabel;
    dtBaixa: TDBText;
    dtEstorno: TDBText;
    nmUsuario: TDBText;
    nmCaixa: TLabel;
    lblDescricao: TLabel;
    qryEstorno: TUMZQuery;
    dsEstorno: TDataSource;
    qryEstornonm_pessoa: TStringField;
    qryEstornodt_baixa: TDateTimeField;
    qryEstornodt_estorno: TDateTimeField;
    qryEstornods_estorno: TMemoField;
    qryEstornods_caixa: TStringField;
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
