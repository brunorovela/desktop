unit uRemessaBancariaResumo;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Grids, DBGrids, ExtCtrls, DB, ZAbstractRODataset, ZAbstractDataset,
  UZDataset, ImgList, ComCtrls, ToolWin;

type
  TfrmRemessaBancariaResumo = class(TForm)
    Panel3: TPanel;
    gridVinculados: TDBGrid;
    dsResumoRemessa: TDataSource;
    qyResumoRemessa: TUMZQuery;
    qyResumoRemessads_ocorrencia: TStringField;
    qyResumoRemessavl_total: TFloatField;
    qyResumoRemessavl_desconto_total: TFloatField;
    qyResumoRemessanr_pessoas: TLargeintField;
    tbAcoesFila: TToolBar;
    ToolButton1: TToolButton;
    btFechar: TToolButton;
    ToolButton2: TToolButton;
    ilAcoes: TImageList;
    qyResumoRemessanr_boletos: TLargeintField;
    procedure btFecharClick(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
  private
    { Private declarations }
  public
    { Public declarations }
    procedure filtrarResumoFilaRemessa(cdLayout: integer);
    procedure filtrarResumoArquivoRemessa(cdArquivo: integer);    
  end;

var
  frmRemessaBancariaResumo: TfrmRemessaBancariaResumo;

implementation

{$R *.dfm}
    
procedure TfrmRemessaBancariaResumo.filtrarResumoFilaRemessa(cdLayout: integer);
const
  SQL_RESUMO_REMESSA_FILA =
    ' SELECT '+
    '   ro.ds_ocorrencia, '+
    '   COUNT(DISTINCT re.cd_resp) nr_pessoas, '+
    '   COUNT(re.cd_boleto) nr_boletos, '+
    '   SUM(re.vl_nominal) vl_total, '+
    '   SUM(re.vl_desconto) vl_desconto_total '+
    ' FROM '+
    '   rem_envios re '+
    '   INNER JOIN (SELECT DISTINCT cd_layout, cd_ocorrencia, ds_ocorrencia FROM rem_ocorrencias) ro ON ( '+
    '     ro.cd_ocorrencia = re.cd_ocorrencia AND '+
    '     ro.cd_layout = re.cd_layout '+
    '   ) '+
    ' WHERE '+
    '   re.cd_layout = :cd_layout AND '+
    '   re.sn_ignorado = 0 AND '+
    '   re.cd_arquivo IS NULL '+
    ' GROUP BY '+
    '   ro.cd_ocorrencia '+
    ' ORDER BY '+
    '   ro.cd_ocorrencia ';
begin

  // Busca as informações do resumo de remessa
  qyResumoRemessa.Close;

  qyResumoRemessa.SQL.Text := SQL_RESUMO_REMESSA_FILA;
  qyResumoRemessa.ParamByName('cd_layout').AsInteger := cdLayout;

  qyResumoRemessa.Open;

end;

procedure TfrmRemessaBancariaResumo.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
   case Key of
      VK_F12: btFecharClick(nil);
   end;
end;

procedure TfrmRemessaBancariaResumo.btFecharClick(Sender: TObject);
begin
  self.Close;
end;

procedure TfrmRemessaBancariaResumo.filtrarResumoArquivoRemessa(cdArquivo: integer);
const
  SQL_RESUMO_REMESSA_ARQUIVO =
    ' SELECT '+
    '   ro.ds_ocorrencia, '+
    '   COUNT(DISTINCT re.cd_resp) nr_pessoas, '+
    '   COUNT(re.cd_boleto) nr_boletos, '+
    '   SUM(re.vl_nominal) vl_total, '+
    '   SUM(re.vl_desconto) vl_desconto_total '+
    ' FROM '+
    '   rem_envios re '+
    '   INNER JOIN (SELECT DISTINCT cd_layout, cd_ocorrencia, ds_ocorrencia FROM rem_ocorrencias) ro ON ( '+
    '     ro.cd_ocorrencia = re.cd_ocorrencia AND '+
    '     ro.cd_layout = re.cd_layout '+
    '   ) '+
    ' WHERE '+
    '   re.cd_arquivo = :cd_arquivo AND '+
    '   re.sn_ignorado = 0 '+
    ' GROUP BY '+
    '   ro.cd_ocorrencia '+
    ' ORDER BY '+
    '   ro.cd_ocorrencia ';
begin

  // Busca as informações do resumo de remessa
  qyResumoRemessa.Close;

  qyResumoRemessa.SQL.Text := SQL_RESUMO_REMESSA_ARQUIVO;
  qyResumoRemessa.ParamByName('cd_arquivo').AsInteger := cdArquivo;

  qyResumoRemessa.Open;

end;

end.
