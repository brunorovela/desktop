unit UFLGTCValorTotal;

interface

uses
   Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
   Dialogs, UFLGTCValorBase, DB, DBClient, StdCtrls, Mask, DBCtrls;

type
   TfrmLGTCValorTotal = class(TfrmLGTCValorBase)
      cdsValorVL_TOTAL: TCurrencyField;
      dbeTotal: TDBEdit;
      lvlTotal: TLabel;
      procedure cdsValorVL_TOTALChange(Sender: TField);
   private
      function CanSave: Boolean; override;
      function GetValor: Currency; override;
      procedure HighlightControls; override;
   public
      procedure SetExtraValue(const Value: AnsiString); override;
   end;

var
   frmLGTCValorTotal: TfrmLGTCValorTotal;

implementation

{$R *.dfm}

{ TfrmLGTCValorTotal }

function TfrmLGTCValorTotal.CanSave: Boolean;
begin
   Result := not cdsValorVL_TOTAL.IsNull;
end;

procedure TfrmLGTCValorTotal.cdsValorVL_TOTALChange(Sender: TField);
begin
   dbeTotal.Color := clWindow;
end;

function TfrmLGTCValorTotal.GetValor: Currency;
begin
   Result := cdsValorVL_TOTAL.AsCurrency;
end;

procedure TfrmLGTCValorTotal.HighlightControls;
begin
   if cdsValorVL_TOTAL.IsNull then
      dbeTotal.Color := clInfoBk;
end;

procedure TfrmLGTCValorTotal.SetExtraValue(const Value: AnsiString);
var
   C: Currency;
   S: AnsiString;
begin
   S := StringReplace(Value, '.', ',', [rfReplaceAll]);
   
   if not TryStrToCurr(S, C) then
      C := 0;
      
   cdsValorVL_TOTAL.AsCurrency := C;
end;

initialization
   RegisterClass(TfrmLGTCValorTotal);

finalization
   UnRegisterClass(TfrmLGTCValorTotal);

end.
