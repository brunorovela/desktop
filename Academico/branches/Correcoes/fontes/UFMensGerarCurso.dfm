object fMensGerarCurso: TfMensGerarCurso
  Left = 0
  Top = 0
  Width = 336
  Height = 59
  TabOrder = 0
  TabStop = True
  object lblCursoAnoSem: TLabel
    Left = 3
    Top = 3
    Width = 71
    Height = 13
    Caption = 'Ano/semestre:'
    FocusControl = meCursoAnoSem
  end
  object lblCurso: TLabel
    Left = 97
    Top = 3
    Width = 32
    Height = 13
    Caption = 'Curso:'
    FocusControl = edtCurso
  end
  object sbSelCurso: TSpeedButton
    Left = 221
    Top = 19
    Width = 23
    Height = 21
    Flat = True
    Glyph.Data = {
      76010000424D7601000000000000760000002800000020000000100000000100
      04000000000000010000130B0000130B00001000000000000000000000000000
      800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
      FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333333333333
      33033333333333333F7F3333333333333000333333333333F777333333333333
      000333333333333F777333333333333000333333333333F77733333333333300
      033333333FFF3F777333333700073B703333333F7773F77733333307777700B3
      33333377333777733333307F8F8F7033333337F333F337F3333377F8F9F8F773
      3333373337F3373F3333078F898F870333337F33F7FFF37F333307F99999F703
      33337F377777337F3333078F898F8703333373F337F33373333377F8F9F8F773
      333337F3373337F33333307F8F8F70333333373FF333F7333333330777770333
      333333773FF77333333333370007333333333333777333333333}
    NumGlyphs = 2
    OnClick = sbSelCursoClick
  end
  object meCursoAnoSem: TMaskEdit
    Left = 3
    Top = 19
    Width = 71
    Height = 21
    EditMask = '9999/9;0;_'
    MaxLength = 6
    TabOrder = 0
  end
  object udCursoAnoSem: TUpDown
    Left = 74
    Top = 19
    Width = 17
    Height = 21
    Min = -100
    TabOrder = 1
    OnClick = udCursoAnoSemClick
  end
  object edtCurso: TEdit
    Left = 97
    Top = 19
    Width = 121
    Height = 21
    ReadOnly = True
    TabOrder = 2
  end
end
