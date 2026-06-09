unit uHistoricoCheque;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, DBGrids, Grids, DBCtrls, StdCtrls, ComCtrls, DB, ZConnection,
  Buttons, ZAbstractRODataset, ZAbstractDataset, ZDataset, UZDataset, uDM;

type
  TfHistoricoCheque = class(TForm)
    Panel3: TPanel;
    pcCheques: TPageControl;
    tsDetalhes: TTabSheet;
    tsHistorico: TTabSheet;
    dbgChequesMensalidades: TDBGrid;
    qyChequesDetalhes: TUMZQuery;
    dsChequesDetalhes: TDataSource;
    dbgHistorico: TDBGrid;
    qyChequesMensalidades: TUMZQuery;
    dsChequesMensalidades: TDataSource;
    qyChequesMensalidadesvencimento: TDateTimeField;
    qyChequesMensalidadesconta: TStringField;
    qyChequesMensalidadessituacao: TStringField;
    Panel1: TPanel;
    btnOk: TBitBtn;
    qyChequesMensalidadescontaAntiga: TStringField;
    qyChequesMensalidadessituacaoAntiga: TStringField;
    qyChequesDetalhesNM_PESSOA: TStringField;
    qyChequesDetalhesTURMA: TStringField;
    qyChequesDetalhesVENCIMENTO: TDateTimeField;
    qyChequesDetalhesPAGAMENTO: TDateTimeField;
    qyChequesDetalhesVALOR: TFloatField;
    qyChequesDetalhesPARCELA: TStringField;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure btnOkClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
  public
    iCodCheque: Integer;
    { Public declarations }
  end;

var
  fHistoricoCheque: TfHistoricoCheque;

implementation

{$R *.dfm}

procedure TfHistoricoCheque.btnOkClick(Sender: TObject);
begin
   ModalResult:= MrCancel;
end;

procedure TfHistoricoCheque.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
   ModalResult:= mrCancel;
end;

procedure TfHistoricoCheque.FormShow(Sender: TObject);
begin
   pcCheques.ActivePage:= tsDetalhes;
   qyChequesMensalidades.Close();
   qyChequesDetalhes.Close();
   qyChequesDetalhes.ParamByName('cd_cheque').AsInteger := iCodCheque;
   qyChequesMensalidades.ParamByName('cd_cheque').AsInteger := iCodCheque;
   qyChequesMensalidades.Open();
   qyChequesDetalhes.Open();
end;

end.

