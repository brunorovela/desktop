object fMensGerarAnoSem: TfMensGerarAnoSem
  Left = 0
  Top = 0
  Width = 213
  Height = 52
  TabOrder = 0
  TabStop = True
  object lblAnoSem: TLabel
    Left = 3
    Top = 3
    Width = 71
    Height = 13
    Caption = 'Ano/semestre:'
    FocusControl = meAnoSem
  end
  object meAnoSem: TMaskEdit
    Left = 3
    Top = 19
    Width = 71
    Height = 21
    EditMask = '9999/9;0;_'
    MaxLength = 6
    TabOrder = 0
  end
  object udAnoSem: TUpDown
    Left = 74
    Top = 19
    Width = 17
    Height = 21
    Min = -100
    TabOrder = 1
    OnClick = udAnoSemClick
  end
end
