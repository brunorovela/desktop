unit UFLGTCValorQuantidade;

interface

uses
   Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
   Dialogs, UFLGTCValorBase, DB, DBClient, StdCtrls, Mask, DBCtrls;

type
   TfrmLGTCValorQuantidade = class(TfrmLGTCValorBase)
      cdsValorNR_QUANTIDADE: TFloatField;
      cdsValorVL_TOTAL: TCurrencyField;
      cdsValorVL_UNITARIO: TCurrencyField;
      dbeQuantidade: TDBEdit;
      dbeTotal: TDBEdit;
      dbeValor: TDBEdit;
      lblIgual: TLabel;
      lblQuantidade: TLabel;
      lblTotal: TLabel;
      lblValor: TLabel;
      lblX: TLabel;
      procedure cdsValorCalcFields(DataSet: TDataSet);
      procedure cdsValorNR_QUANTIDADEChange(Sender: TField);
      procedure cdsValorVL_TOTALChange(Sender: TField);
      procedure cdsValorVL_UNITARIOChange(Sender: TField);
   private
      function CanSave: Boolean; override;
      function GetValor: Currency; override;
      procedure HighlightControls; override;
   public
      procedure SetExtraValue(const Value: AnsiString); override;
   end;

var
   frmLGTCValorQuantidade: TfrmLGTCValorQuantidade;

implementation

{$R *.dfm}

function TfrmLGTCValorQuantidade.CanSave: Boolean;
begin
   Result :=
      (not cdsValorNR_QUANTIDADE.IsNull) and
      (not cdsValorVL_UNITARIO.IsNull) and
      (not cdsValorVL_TOTAL.IsNull);
end;

procedure TfrmLGTCValorQuantidade.cdsValorCalcFields(DataSet: TDataSet);
begin
   cdsValorVL_TOTAL.AsCurrency := cdsValorNR_QUANTIDADE.AsFloat * cdsValorVL_UNITARIO.AsCurrency;
end;

procedure TfrmLGTCValorQuantidade.cdsValorNR_QUANTIDADEChange(Sender: TField);
begin
   dbeQuantidade.Color := clWindow;
end;

procedure TfrmLGTCValorQuantidade.cdsValorVL_TOTALChange(Sender: TField);
begin
   dbeTotal.Color := clWindow;
end;

procedure TfrmLGTCValorQuantidade.cdsValorVL_UNITARIOChange(Sender: TField);
begin
   dbeValor.Color := clWindow;
end;

function TfrmLGTCValorQuantidade.GetValor: Currency;
begin
   Result := cdsValorVL_TOTAL.AsCurrency;
end;

procedure TfrmLGTCValorQuantidade.HighlightControls;
begin
   if cdsValorNR_QUANTIDADE.IsNull then
      dbeQuantidade.Color := clInfoBk;

   if cdsValorVL_UNITARIO.IsNull then
      dbeValor.Color := clInfoBk;

   if cdsValorVL_TOTAL.IsNull then
      dbeTotal.Color := clInfoBk;
end;

procedure TfrmLGTCValorQuantidade.SetExtraValue(const Value: AnsiString);
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
   RegisterClass(TfrmLGTCValorQuantidade);

finalization
   UnRegisterClass(TfrmLGTCValorQuantidade);

end.
