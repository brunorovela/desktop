object frmReportFormula: TfrmReportFormula
  Left = 0
  Top = 0
  Width = 451
  Height = 72
  Align = alTop
  AutoSize = True
  TabOrder = 0
  TabStop = True
  Visible = False
  object pnlContent: TPanel
    Left = 0
    Top = 0
    Width = 451
    Height = 72
    Align = alTop
    BevelOuter = bvNone
    TabOrder = 0
    object pnlLabel: TPanel
      Left = 0
      Top = 0
      Width = 43
      Height = 72
      Align = alLeft
      BevelOuter = bvNone
      Padding.Top = 6
      Padding.Right = 3
      TabOrder = 0
      object lblLabel: TLabel
        Left = 5
        Top = 6
        Width = 35
        Height = 66
        Align = alRight
        Caption = 'lblLabel'
        ExplicitHeight = 13
      end
    end
    object pnlValue: TPanel
      Left = 43
      Top = 0
      Width = 408
      Height = 72
      Align = alClient
      BevelOuter = bvNone
      TabOrder = 1
      object sbClear: TSpeedButton
        Left = 390
        Top = 6
        Width = 23
        Height = 21
        Flat = True
        Glyph.Data = {
          42020000424D4202000000000000420000002800000010000000100000000100
          1000030000000002000000000000000000000000000000000000007C0000E003
          00001F0000001F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C
          1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C
          000000001F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C
          0000FF7F1F7C1F7C1F7C1F7C00000000FF7F1F7C1F7C1F7C1F7C1F7C1F7C0000
          FF7F1F7C1F7C1F7C1F7C1F7C00000000FF7F1F7C1F7C1F7C1F7C1F7C1F7C0000
          FF7F1F7C1F7C1F7C1F7C1F7C000000000000FF7F1F7C1F7C1F7C00000000FF7F
          1F7C1F7C1F7C1F7C1F7C1F7C1F7C000000000000FF7F1F7C00000000FF7F1F7C
          1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C00000000000000000000FF7F1F7C1F7C
          1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C000000000000FF7F1F7C1F7C1F7C
          1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C00000000000000000000FF7F1F7C1F7C
          1F7C1F7C1F7C1F7C1F7C1F7C1F7C000000000000FF7F1F7C000000001F7C1F7C
          1F7C1F7C1F7C1F7C1F7C1F7C000000000000FF7F1F7C1F7C1F7C000000000000
          1F7C1F7C1F7C1F7C0000000000000000FF7F1F7C1F7C1F7C1F7C1F7C00000000
          FF7F1F7C1F7C1F7C00000000FF7F1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C0000
          000000001F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C
          1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C
          1F7C1F7C1F7C}
        OnClick = sbClearClick
      end
      object mmValue: TMemo
        Left = 3
        Top = 3
        Width = 384
        Height = 66
        ScrollBars = ssBoth
        TabOrder = 0
      end
    end
  end
end
