unit UFLGTCValorAula;

interface

uses
   Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
   Dialogs, UFLGTCValorBase, DB, DBClient, StdCtrls, Mask, DBCtrls,
   ZAbstractRODataset, UZDataset;

type
   TfrmLGTCValorAula = class(TfrmLGTCValorBase)
      cdsValorVL_CARGA_HORARIA: TCurrencyField;
      cdsValorVL_HORA_AULA: TCurrencyField;
      cdsValorVL_TOTAL: TCurrencyField;
      dbeCargaHoraria: TDBEdit;
      dbeHoraAula: TDBEdit;
      dbeTotal: TDBEdit;
      lblCargaHoraria: TLabel;
      lblHoraAula: TLabel;
      lblIgual: TLabel;
      lblTotal: TLabel;
      lblX: TLabel;
      procedure cdsValorCalcFields(DataSet: TDataSet);
      procedure cdsValorVL_CARGA_HORARIAChange(Sender: TField);
      procedure cdsValorVL_HORA_AULAChange(Sender: TField);
      procedure cdsValorVL_TOTALChange(Sender: TField);
   private
      function CanSave: Boolean; override;
      function GetValor: Currency; override;
      procedure HighlightControls; override;
   public
      procedure SetExtraValue(const Value: AnsiString); override;
      procedure SetField(const FieldName: AnsiString; const Value: Variant); override;
   end;

var
   frmLGTCValorAula: TfrmLGTCValorAula;

implementation

{$R *.dfm}

{ TfrmLGTCValorAula }

function TfrmLGTCValorAula.CanSave: Boolean;
begin
   Result :=
      (not cdsValorVL_HORA_AULA.IsNull) and
      (not cdsValorVL_CARGA_HORARIA.IsNull) and
      (not cdsValorVL_TOTAL.IsNull);
end;

procedure TfrmLGTCValorAula.cdsValorCalcFields(DataSet: TDataSet);
begin
   cdsValorVL_TOTAL.AsCurrency :=
      cdsValorVL_HORA_AULA.AsCurrency * cdsValorVL_CARGA_HORARIA.AsCurrency;
end;

procedure TfrmLGTCValorAula.cdsValorVL_CARGA_HORARIAChange(Sender: TField);
begin
   dbeCargaHoraria.Color := clWindow;
end;

procedure TfrmLGTCValorAula.cdsValorVL_HORA_AULAChange(Sender: TField);
begin
   dbeHoraAula.Color := clWindow;
end;

procedure TfrmLGTCValorAula.cdsValorVL_TOTALChange(Sender: TField);
begin
   dbeTotal.Color := clWindow;
end;

function TfrmLGTCValorAula.GetValor: Currency;
begin
   Result := cdsValorVL_TOTAL.AsCurrency;
end;

procedure TfrmLGTCValorAula.HighlightControls;
begin
   if cdsValorVL_HORA_AULA.IsNull then
      dbeHoraAula.Color := clInfoBk;

   if cdsValorVL_CARGA_HORARIA.IsNull then
      dbeCargaHoraria.Color := clInfoBk;

   if cdsValorVL_TOTAL.IsNull then
      dbeTotal.Color := clInfoBk;
end;

procedure TfrmLGTCValorAula.SetExtraValue(const Value: AnsiString);
var
   C: Currency;
   S: AnsiString;
begin
   S := StringReplace(Value, '.', ',', [rfReplaceAll]);

   if not TryStrToCurr(S, C) then
      C := 0;
      
   cdsValorVL_HORA_AULA.AsCurrency := C;
end;

procedure TfrmLGTCValorAula.SetField(const FieldName: AnsiString;
  const Value: Variant);
begin
   cdsValor.FieldByName(FieldName).Value := Value;
end;

initialization
   RegisterClass(TfrmLGTCValorAula);

finalization
   UnRegisterClass(TfrmLGTCValorAula);

end.
