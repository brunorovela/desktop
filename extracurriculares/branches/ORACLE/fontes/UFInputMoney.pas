unit UFInputMoney;

interface

uses
   Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
   Dialogs, StdCtrls, Consts, Mask;

type
   TfInputMoney = class(TForm)
      lblPrompt: TLabel;
      btnOk: TButton;
      btnCancel: TButton;
    edtValue: TEdit;
   private
      procedure Initialize(const ACaption, APrompt: string; var Value: string);
   public
      class function InputMoney(const ACaption, APrompt: string;
            var Value: string): Boolean;
   end;

implementation

{$R *.dfm}

procedure TfInputMoney.Initialize(const ACaption, APrompt: string;
      var Value: string);

   function GetAveCharSize(Canvas: TCanvas): TPoint;
   var
      I: Integer;
      Buffer: array[0..51] of Char;
   begin
      for I := 0 to 25 do Buffer[I] := Chr(I + Ord('A'));
      for I := 0 to 25 do Buffer[I + 26] := Chr(I + Ord('a'));
      GetTextExtentPoint(Canvas.Handle, Buffer, 52, TSize(Result));
      Result.X := Result.X div 52;
   end;

var
   DialogUnits: TPoint;
   ButtonTop, ButtonWidth, ButtonHeight: Integer;
begin
   Caption := ACaption;
   Canvas.Font := Font;
   DialogUnits := GetAveCharSize(Canvas);
   ClientWidth := MulDiv(180, DialogUnits.X, 4);

   with lblPrompt do
   begin
      Caption := APrompt;
      Left := MulDiv(8, DialogUnits.X, 4);
      Top := MulDiv(8, DialogUnits.Y, 8);
      Constraints.MaxWidth := MulDiv(164, DialogUnits.X, 4);
      WordWrap := True;
   end;

   with edtValue do
   begin
      Left := lblPrompt.Left;
      Top := lblPrompt.Top + lblPrompt.Height + 5;
      Width := MulDiv(164, DialogUnits.X, 4);
      MaxLength := 255;
      Text := Value;
      SelectAll;
   end;

   ButtonTop := edtValue.Top + edtValue.Height + 15;
   ButtonWidth := MulDiv(50, DialogUnits.X, 4);
   ButtonHeight := MulDiv(14, DialogUnits.Y, 8);

   with btnOk do
   begin
      Caption := SMsgDlgOK;
      ModalResult := mrOk;
      Default := True;
      SetBounds(MulDiv(38, DialogUnits.X, 4), ButtonTop, ButtonWidth,
            ButtonHeight);
   end;

   with btnCancel do
   begin
      Caption := SMsgDlgCancel;
      ModalResult := mrCancel;
      Cancel := True;
      SetBounds(MulDiv(92, DialogUnits.X, 4),
            edtValue.Top + edtValue.Height + 15, ButtonWidth, ButtonHeight);
      Self.ClientHeight := Top + Height + 13;
   end;
end;

class function TfInputMoney.InputMoney(const ACaption, APrompt: string;
  var Value: string): Boolean;
var
   InputMoney: TfInputMoney;
begin
   InputMoney := TfInputMoney.Create(Application);
   try
      InputMoney.Initialize(ACaption, APrompt, Value);
      if InputMoney.ShowModal = mrOk then
      begin
         Result := True;
         Value := InputMoney.edtValue.Text;
      end
      else
         Result := False;
   finally
      InputMoney.Free;
   end;
end;

end.
