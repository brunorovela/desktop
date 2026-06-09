unit UFTextEdit;

interface

uses
   Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms, 
   Dialogs, ToolWin, ComCtrls, StdCtrls, ImgList, DBCtrls, StrUtils;

type
   TfrmTexEdit = class(TFrame)
      btnBold: TToolButton;
      btnCenter: TToolButton;
      btnCopy: TToolButton;
      btnCut: TToolButton;
      btnItalic: TToolButton;
      btnLeft: TToolButton;
      btnPaste: TToolButton;
      btnRight: TToolButton;
      btnSep1: TToolButton;
      btnSep2: TToolButton;
      btnUnderline: TToolButton;
      dbreEditor: TDBRichEdit;
      ilControls: TImageList;
      tlbControls: TToolBar;
      procedure btnBoldClick(Sender: TObject);
      procedure btnCenterClick(Sender: TObject);
      procedure btnCopyClick(Sender: TObject);
      procedure btnCutClick(Sender: TObject);
      procedure btnItalicClick(Sender: TObject);
      procedure btnLeftClick(Sender: TObject);
      procedure btnPasteClick(Sender: TObject);
      procedure btnRightClick(Sender: TObject);
      procedure btnUnderlineClick(Sender: TObject);
      procedure dbreEditorChange(Sender: TObject);
      procedure dbreEditorSelectionChange(Sender: TObject);
   private
      function GetAsHTML: AnsiString;
      procedure UpdateButtons;
   public
      property AsHTML: AnsiString read GetAsHTML;
   end;

implementation

{$R *.dfm}

{ TfrmTexEdit }

procedure TfrmTexEdit.btnBoldClick(Sender: TObject);
begin
   if fsBold in dbreEditor.SelAttributes.Style then
      dbreEditor.SelAttributes.Style := dbreEditor.SelAttributes.Style - [fsBold]
   else
      dbreEditor.SelAttributes.Style := dbreEditor.SelAttributes.Style + [fsBold];

   UpdateButtons;
end;

procedure TfrmTexEdit.btnCenterClick(Sender: TObject);
begin
   dbreEditor.Paragraph.Alignment := taCenter;
end;

procedure TfrmTexEdit.btnCopyClick(Sender: TObject);
begin
   dbreEditor.CopyToClipboard;
end;

procedure TfrmTexEdit.btnCutClick(Sender: TObject);
begin
   dbreEditor.CutToClipboard;
end;

procedure TfrmTexEdit.btnItalicClick(Sender: TObject);
begin
   if fsItalic in dbreEditor.SelAttributes.Style then
      dbreEditor.SelAttributes.Style := dbreEditor.SelAttributes.Style - [fsItalic]
   else
      dbreEditor.SelAttributes.Style := dbreEditor.SelAttributes.Style + [fsItalic];

   UpdateButtons;
end;

procedure TfrmTexEdit.btnLeftClick(Sender: TObject);
begin
   dbreEditor.Paragraph.Alignment := taLeftJustify;
end;

procedure TfrmTexEdit.btnPasteClick(Sender: TObject);
begin
   dbreEditor.PasteFromClipboard;
end;

procedure TfrmTexEdit.btnRightClick(Sender: TObject);
begin
   dbreEditor.Paragraph.Alignment := taRightJustify;
end;

procedure TfrmTexEdit.btnUnderlineClick(Sender: TObject);
begin
   if fsUnderline in dbreEditor.SelAttributes.Style then
      dbreEditor.SelAttributes.Style := dbreEditor.SelAttributes.Style - [fsUnderline]
   else
      dbreEditor.SelAttributes.Style := dbreEditor.SelAttributes.Style + [fsUnderline];

   UpdateButtons;
end;

function TfrmTexEdit.GetAsHTML: AnsiString;
const
   AlignStyle: array [TAlignment] of AnsiString = (
      '<span style="text-align: left;">',
      '<span style="text-align: right;">',
      '<span style="text-align: center;">');
var
   I, Index, TextLen, Alignment: Integer;
   Bold, Italic, Underline: Boolean;
   S: AnsiString;
   TagList: TStrings;

   function CloseChildren(const Wanted: AnsiChar): AnsiString;
   var
      I, Index: Integer;
      S: AnsiString;
   begin
      Result := EmptyStr;

      for I := TagList.Count - 1 downto 0 do
      begin
         S := TagList[I][2];

         if S = 's' then
            Result := Result + '</span>';

         if S = 'b' then
            Result := Result + '</b>';

         if S = 'i' then
            Result := Result + '</i>';

         if S = 'u' then
            Result := Result + '</u>';

         if Wanted = S then
         begin
            Index := I;
            Break;
         end;
      end;

      for I := Index + 1 to TagList.Count - 1 do
      begin
         Result := Result + TagList[I];
      end;

      TagList.Delete(Index);
   end;

   function CloseAll: AnsiString;
   var
      S: AnsiString;
      I: Integer;
   begin
      Result := EmptyStr;

      for I := TagList.Count - 1 downto 0 do
      begin
         S := TagList[I][2];

         if S = 's' then
            Result := Result + '</span>';

         if S = 'b' then
            Result := Result + '</b>';

         if S = 'i' then
            Result := Result + '</i>';

         if S = 'u' then
            Result := Result + '</u>';
      end;
   end;

begin
   LockWindowUpdate(dbreEditor.Handle);
   Alignment := -1;
   Bold := False;
   Italic := False;
   Underline := False;
   Result := '';
   TextLen := Length(dbreEditor.Text);

   TagList := TStringList.Create;

   try

      for I := 0 to TextLen - 1 do
      begin
         dbreEditor.SelStart := I;
         dbreEditor.SelLength := 1;

         S := Copy(dbreEditor.Text, I + 1, 1);

         if Alignment <> Ord(dbreEditor.Paragraph.Alignment) then
         begin

            if Alignment <> -1 then
            begin
               Result := Result + CloseChildren('s');
            end;

            Result := Result + AlignStyle[dbreEditor.Paragraph.Alignment];
            Alignment := Ord(dbreEditor.Paragraph.Alignment);
            
            TagList.Add(AlignStyle[dbreEditor.Paragraph.Alignment]);
         end;

         if (fsBold in dbreEditor.SelAttributes.Style) and (not Bold) then
         begin
            Result := Result + '<b>';
            TagList.Add('<b>');
            Bold := True;
         end;

         if (not (fsBold in dbreEditor.SelAttributes.Style)) and Bold then
         begin
            Result := Result + CloseChildren('b');
            Bold := False;
         end;

         if (fsItalic in dbreEditor.SelAttributes.Style) and (not Italic) then
         begin
            Result := Result + '<i>';
            TagList.Add('<i>');
            Italic := True;
         end;

         if (not (fsItalic in dbreEditor.SelAttributes.Style)) and Italic then
         begin
            Result := Result + CloseChildren('i');
            Italic := False;
         end;

         if (fsUnderline in dbreEditor.SelAttributes.Style) and (not Underline) then
         begin
            Result := Result + '<u>';
            TagList.Add('<u>');
            Underline := True;
         end;

         if (not (fsUnderline in dbreEditor.SelAttributes.Style)) and Underline then
         begin
            Result := Result + CloseChildren('u');
            Underline := False;
         end;

         if S = #10#13 then
            Result := Result + '<br />'
         else
            Result := Result + S;
      end;

      Result := Result + CloseAll;
      
   finally
      FreeAndNil(TagList);
   end;

   LockWindowUpdate(0);

end;

procedure TfrmTexEdit.dbreEditorChange(Sender: TObject);
begin
   UpdateButtons;
end;

procedure TfrmTexEdit.dbreEditorSelectionChange(Sender: TObject);
begin
   UpdateButtons;
end;

procedure TfrmTexEdit.UpdateButtons;
begin
   btnBold.Down := fsBold in dbreEditor.SelAttributes.Style;
   btnItalic.Down := fsItalic in dbreEditor.SelAttributes.Style;
   btnUnderline.Down := fsUnderline in dbreEditor.SelAttributes.Style;
   btnLeft.Down := dbreEditor.Paragraph.Alignment = taLeftJustify;
   btnCenter.Down := dbreEditor.Paragraph.Alignment = taCenter;
   btnRight.Down := dbreEditor.Paragraph.Alignment = taRightJustify;
end;

end.
