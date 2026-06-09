unit UFFinPlanosFormulaVencto;

interface

uses
   Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
   Dialogs, StdCtrls, Spin, Buttons, DBCtrls, Mask;

type
   TfrmFinPlanosFormulaVencto = class(TForm)
      lblFormulaVencto: TLabel;
      lblFormulaDias: TLabel;
      sbOk: TSpeedButton;
      sbCancel: TSpeedButton;
      dbeFormulaDias: TDBEdit;
      dblcFormulaTipo: TDBLookupComboBox;
      dblcFormulaOperador: TDBLookupComboBox;
      procedure FormClose(Sender: TObject; var Action: TCloseAction);
      procedure sbCancelClick(Sender: TObject);
      procedure sbOkClick(Sender: TObject);
   public
      class function Edit: Boolean;
   end;

implementation

{$R *.dfm}

uses
   uPlanosNova;

class function TfrmFinPlanosFormulaVencto.Edit: Boolean;
const
   CaptionFmt = 'Fórmula de vencimento da parela %d';
var
   Form: TfrmFinPlanosFormulaVencto;
   CursorPos: TPoint;
begin
   Form := TfrmFinPlanosFormulaVencto.Create(Application);
   try
      CursorPos := Mouse.CursorPos;
   
      Form.Caption := Format(CaptionFmt, [frmPlanosNova.qyPlanosItensNR_PARCELA.AsInteger]);
      Form.Left := CursorPos.X;
      Form.Top := CursorPos.Y;

      Result := Form.ShowModal = mrOk;
      
   finally
      Form.Free;
      Form := nil;
   end;
end;

procedure TfrmFinPlanosFormulaVencto.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
   Action := caFree;
end;

procedure TfrmFinPlanosFormulaVencto.sbCancelClick(Sender: TObject);
begin
   ModalResult := mrCancel;
   CloseModal;
end;

procedure TfrmFinPlanosFormulaVencto.sbOkClick(Sender: TObject);
begin
   dblcFormulaTipo.SetFocus;
   dblcFormulaOperador.SetFocus;
   dbeFormulaDias.SetFocus;
   ModalResult := mrOk;
   CloseModal;
end;

end.
