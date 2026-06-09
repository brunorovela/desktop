unit UFRemessaLayoutConfig;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, DB, ZAbstractRODataset, ZAbstractDataset, UZDataset, StdCtrls,
  DBCtrls, Mask, Buttons, ExtCtrls;

type
  TfrmRemessaLayoutConfig = class(TForm)
    pnlDados: TPanel;
    qryLayout: TUMZQuery;
    qryLayoutCD_LAYOUT: TLargeintField;
    qryLayoutSN_AUTO_GERAR: TSmallintField;
    qryLayoutNR_INTERVALO_AUTO_GERAR: TIntegerField;
    dsLayout: TDataSource;
    dbchAutoGerar: TDBCheckBox;
    lblIntervalo: TLabel;
    dbeIntervalo: TDBEdit;
    bbtnSalvar: TBitBtn;
    bbtnCancelar: TBitBtn;
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure dsLayoutStateChange(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
      procedure CreateParams(var Params: TCreateParams); override;
      class procedure ConfigLayout(const LayoutId, Left, Top: Integer);
  end;

var
  frmRemessaLayoutConfig: TfrmRemessaLayoutConfig;

implementation

{$R *.dfm}

class procedure TfrmRemessaLayoutConfig.ConfigLayout(const LayoutId, Left,
  Top: Integer);
begin
   Application.CreateForm(TfrmRemessaLayoutConfig, frmRemessaLayoutConfig);
   frmRemessaLayoutConfig.Left := Left;
   frmRemessaLayoutConfig.Top := Top;
   frmRemessaLayoutConfig.qryLayout.Close;
   frmRemessaLayoutConfig.qryLayout.ParamByName('CD_LAYOUT').AsInteger := LayoutId;
   frmRemessaLayoutConfig.qryLayout.Open;
   frmRemessaLayoutConfig.ShowModal;
end;

procedure TfrmRemessaLayoutConfig.CreateParams(var Params: TCreateParams);
begin
   inherited CreateParams(Params);
   Params.Style := Params.Style or WS_THICKFRAME or WS_BORDER;
end;

procedure TfrmRemessaLayoutConfig.dsLayoutStateChange(Sender: TObject);
begin
   bbtnSalvar.Enabled := qryLayout.State = dsEdit;
end;

procedure TfrmRemessaLayoutConfig.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
   frmRemessaLayoutConfig := nil;
   Action := caFree;
end;

procedure TfrmRemessaLayoutConfig.FormCloseQuery(Sender: TObject;
  var CanClose: Boolean);
begin
   if qryLayout.State = dsEdit then
   begin
      if ModalResult = mrOk then
      begin
         qryLayout.Post;
      end;

      if ModalResult = mrCancel then
      begin
         qryLayout.Cancel;
      end;
   end;
end;

end.
