unit UFLGTCValorKM;

interface

uses
   Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
   Dialogs, UFLGTCValorBase, DB, DBClient, StdCtrls, Mask, DBCtrls,
   ZAbstractRODataset, UZDataset;

type
   TfrmLGTCValorKM = class(TfrmLGTCValorBase)
      cdsValorCD_TIPO: TLargeintField;
      cdsValorDS_TIPO: TStringField;
      cdsValorNR_QUANTIDADE: TFloatField;
      cdsValorVL_TOTAL: TCurrencyField;
      cdsValorVL_UNITARIO: TCurrencyField;
      dbeQuantidade: TDBEdit;
      dbeTotal: TDBEdit;
      dbeValorUnitario: TDBEdit;
      dblcTipo: TDBLookupComboBox;
      lblIgual: TLabel;
      lblQuantidade: TLabel;
      lblTipo: TLabel;
      lblTotal: TLabel;
      lblValorUnitario: TLabel;
      lblX: TLabel;
      qryTipoTransporte: TUMZReadOnlyQuery;
      qryTipoTransporteCD_TIPO_TRANSPORTE: TLargeintField;
      qryTipoTransporteDS_CHAVE: TStringField;
      qryTipoTransporteDS_TIPO_TRANSPORTE: TStringField;
      procedure cdsValorCalcFields(DataSet: TDataSet);
      procedure cdsValorCD_TIPOChange(Sender: TField);
      procedure cdsValorNR_QUANTIDADEChange(Sender: TField);
      procedure cdsValorVL_TOTALChange(Sender: TField);
      procedure cdsValorVL_UNITARIOChange(Sender: TField);
   private
      function CanSave: Boolean; override;
      function GetValor: Currency; override;
      procedure HighlightControls; override;
   public
      constructor Create(AOwner: TComponent); override;
      destructor Destroy; override;
      procedure SetExtraValue(const Value: AnsiString); override;
   end;

var
   frmLGTCValorKM: TfrmLGTCValorKM;

implementation

{$R *.dfm}

{ TfrmLGTCValorKM }

function TfrmLGTCValorKM.CanSave: Boolean;
begin
   Result :=
      (not cdsValorNR_QUANTIDADE.IsNull) and
      (not cdsValorVL_UNITARIO.IsNull) and
      (not cdsValorVL_TOTAL.IsNull) and
      (not cdsValorCD_TIPO.IsNull);
end;

procedure TfrmLGTCValorKM.cdsValorCalcFields(DataSet: TDataSet);
begin
   cdsValorVL_TOTAL.AsCurrency := cdsValorNR_QUANTIDADE.AsFloat * cdsValorVL_UNITARIO.AsCurrency;
end;

procedure TfrmLGTCValorKM.cdsValorCD_TIPOChange(Sender: TField);
begin
   dblcTipo.Color := clWindow;
end;

procedure TfrmLGTCValorKM.cdsValorNR_QUANTIDADEChange(Sender: TField);
begin
   dbeQuantidade.Color := clWindow;
end;

procedure TfrmLGTCValorKM.cdsValorVL_TOTALChange(Sender: TField);
begin
   dbeTotal.Color := clWindow;
end;

procedure TfrmLGTCValorKM.cdsValorVL_UNITARIOChange(Sender: TField);
begin
   dbeValorUnitario.Color := clWindow;
end;

constructor TfrmLGTCValorKM.Create(AOwner: TComponent);
begin
   inherited;
   qryTipoTransporte.Open;
end;

destructor TfrmLGTCValorKM.Destroy;
begin
   qryTipoTransporte.Close;
   inherited;
end;

function TfrmLGTCValorKM.GetValor: Currency;
begin
   Result := cdsValorVL_TOTAL.AsCurrency;
end;

procedure TfrmLGTCValorKM.HighlightControls;
begin
   if cdsValorNR_QUANTIDADE.IsNull then
      dbeQuantidade.Color := clInfoBk;

   if cdsValorVL_UNITARIO.IsNull then
      dbeValorUnitario.Color := clInfoBk;

   if cdsValorVL_TOTAL.IsNull then
      dbeTotal.Color := clInfoBk;

   if cdsValorCD_TIPO.IsNull then
      dblcTipo.Color := clInfoBk;
end;

procedure TfrmLGTCValorKM.SetExtraValue(const Value: AnsiString);
var
   C: Currency;
   S: AnsiString;
begin
   S := StringReplace(Value, '.', ',', [rfReplaceAll]);
   
   if not TryStrToCurr(S, C) then
      C := 0;
      
   cdsValorVL_UNITARIO.AsCurrency := C;
end;

initialization
   RegisterClass(TfrmLGTCValorKM);

finalization
   UnRegisterClass(TfrmLGTCValorKM);

end.
