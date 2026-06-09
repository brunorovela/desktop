unit UFNFSeHist;

interface

uses
   Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
   Dialogs, ExtCtrls, StdCtrls, Grids, DBGrids, DB, uDM, ZAbstractRODataset,
   UZDataset, DBCtrls;

type
   TfNFSeHist = class(TForm)
      pnlServicos: TPanel;
      rgServicos: TRadioGroup;
      bvlSep1: TBevel;
      dsMensagem: TDataSource;
      qryMensagem: TUMZReadOnlyQuery;
      qryMensagemCD_RETORNO: TLargeintField;
      qryMensagemCD_LOTE: TLargeintField;
      qryMensagemCD_SERVICO: TSmallintField;
      qryMensagemDT_CONSULTA: TDateTimeField;
      qryMensagemDS_CODIGO: TStringField;
      qryMensagemDS_MENSAGEM: TMemoField;
      qryMensagemDS_CORRECAO: TMemoField;
      dbgMensagem: TDBGrid;
    pnlRetornos: TPanel;
    splSep1: TSplitter;
    pnlMensagens: TPanel;
    lblMensagem: TLabel;
    lblCorrecao: TLabel;
    dbmMensagem: TDBMemo;
    dbmCorrecao: TDBMemo;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
      procedure rgServicosClick(Sender: TObject);
   private
      FCodigoLote: Integer;
   public
      class procedure ShowLogs(const AOwner: TComponent;
         const CodigoLote: Integer);
   end;

var
   fNFSeHist: TfNFSeHist;

implementation

{$R *.dfm}

procedure TfNFSeHist.FormClose(Sender: TObject; var Action: TCloseAction);
begin
   qryMensagem.Close;
   Action := caFree;
end;

procedure TfNFSeHist.rgServicosClick(Sender: TObject);
begin
   qryMensagem.Filter := Format('CD_SERVICO = %d AND CD_LOTE = %d',
      [rgServicos.ItemIndex + 1, FCodigoLote]);
end;

class procedure TfNFSeHist.ShowLogs(const AOwner: TComponent;
  const CodigoLote: Integer);
begin
   if fNFSeHist = nil then
      fNFSeHist := TfNFSeHist.Create(AOwner);
   fNFSeHist.FCodigoLote := CodigoLote;
   fNFSeHist.qryMensagem.Filter := Format('CD_SERVICO = %d AND CD_LOTE = %d',
      [fNFSeHist.rgServicos.ItemIndex + 1, CodigoLote]);
   fNFSeHist.qryMensagem.Open;
   fNFSeHist.ShowModal;
   fNFSeHist.Free;
   fNFSeHist := nil;
end;

end.
