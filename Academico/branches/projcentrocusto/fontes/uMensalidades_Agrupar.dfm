object frm_Mensalidades_agrupar: Tfrm_Mensalidades_agrupar
  Left = 285
  Top = 266
  Width = 519
  Height = 347
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object Panel3: TPanel
    Left = 0
    Top = 0
    Width = 511
    Height = 25
    Align = alTop
    BevelOuter = bvLowered
    Caption = 'AGRUPAR MENSALIDADES'
    Color = clBlue
    Font.Charset = ANSI_CHARSET
    Font.Color = clWhite
    Font.Height = -16
    Font.Name = 'Arial'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 0
  end
  object GroupBox1: TGroupBox
    Left = 8
    Top = 40
    Width = 497
    Height = 249
    TabOrder = 1
    object Label1: TLabel
      Left = 16
      Top = 24
      Width = 116
      Height = 13
      Caption = 'C'#243'digo do Respons'#225'vel:'
    end
    object btnCodigoAluno: TSpeedButton
      Left = 241
      Top = 19
      Width = 33
      Height = 23
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
    end
    object txtCodigo_Resp: TEdit
      Left = 150
      Top = 21
      Width = 91
      Height = 21
      TabOrder = 0
    end
  end
  object Query1: TUMZQuery
    Left = 464
    Top = 40
  end
end

