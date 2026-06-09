unit UFCharacterMap;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Grids, ExtCtrls, Contnrs, StdCtrls;

type
   TfrmCharacterMap = class(TForm)
      fpnCharMap: TFlowPanel;
      sbxCharMap: TScrollBox;
      procedure FormShow(Sender: TObject);
      procedure FormCreate(Sender: TObject);
   private
      FSelectedBox: TPaintBox;
      FSelectedChar: Word;
      FChosenChar: Word;
      procedure LoadCharacterMap;
      procedure LoadFont;
      procedure PaintBoxOnPaint(Sender: TObject);
      procedure PaintBoxOnClick(Sender: TObject);
      procedure PaintBoxOnDblClick(Sender: TObject);
   public
      property SelectedChar: Word read FSelectedChar;
      property ChosenChar: Word read FChosenChar write FChosenChar;
   end;

var
  frmCharacterMap: TfrmCharacterMap;

implementation

{$R *.dfm}

uses
   Math, Types;

procedure TfrmCharacterMap.FormCreate(Sender: TObject);
begin
   LoadFont;
   LoadCharacterMap;
end;

procedure TfrmCharacterMap.FormShow(Sender: TObject);
begin
   FSelectedBox := nil;
   ModalResult := mrCancel;
end;

procedure TfrmCharacterMap.LoadCharacterMap;
const
   FontRangeStart = $F000;
   FontRangeEnd = $F2E0;
   BoxWidth = 32;
   BoxHeight = 32;
var
   W: Word;
   S: WideString;
   X, Y, StrLen: Integer;
   PB: TPaintBox;
   CtrlCanvas: TControlCanvas;
   Glyphs: PWordArray;
   Count: DWORD;
begin
   for W := FontRangeStart to FontRangeEnd do
   begin
      CtrlCanvas := TControlCanvas.Create;
      try
         CtrlCanvas.Control := Self;
         CtrlCanvas.Font.Name := 'FontAwesome';

         S := WideChar(W);
         StrLen := Length(S);

         GetMem(Glyphs, SizeOf(Word) * StrLen);
         try
            Count := GetGlyphIndicesW(CtrlCanvas.Handle, PWideChar(S),
               Length(S), PWord(Glyphs), GGI_MARK_NONEXISTING_GLYPHS);

            if (Count <> GDI_ERROR) and (Glyphs[0] <> $FFFF) then
            begin
               PB := TPaintBox.Create(Self);
               PB.Parent := fpnCharMap;
               PB.Width := BoxWidth;
               PB.Height := BoxHeight;
               PB.Tag := W;
               PB.OnPaint := PaintBoxOnPaint;
               PB.OnClick := PaintBoxOnClick;
               PB.OnDblClick := PaintBoxOnDblClick;
            end;

         finally
            Dispose(Glyphs);
         end;
         
      finally
         FreeAndNil(CtrlCanvas);
      end;
   end;
end;

procedure TfrmCharacterMap.LoadFont;
var
   ResStream: TResourceStream;
   FontsCount: DWORD;
begin
   ResStream := TResourceStream.Create(HInstance, 'FontAwesome', 'TTF');
   try
      AddFontMemResourceEx(ResStream.Memory, ResStream.Size, nil, @FontsCount);
   finally
      FreeAndNil(ResStream);
   end;
end;

procedure TfrmCharacterMap.PaintBoxOnClick(Sender: TObject);
var
   PB: TPaintBox;
begin
   PB := TPaintBox(Sender);
   FSelectedChar := PB.Tag;

   if FSelectedBox <> nil then
      FSelectedBox.Repaint;

   PB.Repaint;
   FSelectedBox := PB;
end;

procedure TfrmCharacterMap.PaintBoxOnDblClick(Sender: TObject);
var
   PB: TPaintBox;
begin
   PB := TPaintBox(Sender);
   FChosenChar := PB.Tag;
   ModalResult := mrOk;
end;

procedure TfrmCharacterMap.PaintBoxOnPaint(Sender: TObject);
var
   PB: TPaintBox;
   W: Word;
   S: WideString;
   R: TRect;
begin
   PB := TPaintBox(Sender);

   if PB.Tag = FSelectedChar then
      PB.Canvas.Brush.Color := clSkyBlue;

   if PB.Tag = FChosenChar then
      PB.Canvas.Brush.Color := clHighlight;

   PB.Canvas.FillRect(PB.Canvas.ClipRect);

   PB.Canvas.Font.Name := 'FontAwesome';
   PB.Canvas.Font.Size := 16;
   PB.Canvas.Font.Color := clWindowText;

   W := PB.Tag;
   S := WideChar(W);

   R := PB.Canvas.ClipRect;

   DrawTextW(PB.Canvas.Handle, PWideChar(S), Length(S), R,
      DT_CENTER or DT_VCENTER or DT_SINGLELINE);

end;

end.
