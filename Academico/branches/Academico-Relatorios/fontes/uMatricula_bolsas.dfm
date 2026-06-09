object FrmMatricula_bolsa: TFrmMatricula_bolsa
  Left = 0
  Top = 0
  BorderStyle = bsDialog
  Caption = 'Bolsas / Conv'#234'nios'
  ClientHeight = 155
  ClientWidth = 471
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel
    Left = 8
    Top = 16
    Width = 122
    Height = 13
    Caption = 'Tipo de Bolsa / Conv'#234'nio:'
  end
  object Label2: TLabel
    Left = 8
    Top = 48
    Width = 71
    Height = 13
    Caption = 'Valor da Bolsa:'
  end
  object Label3: TLabel
    Left = 248
    Top = 48
    Width = 98
    Height = 13
    Caption = 'Percentual da Bolsa:'
  end
  object lbResp: TLabel
    Left = 8
    Top = 80
    Width = 117
    Height = 13
    Caption = 'Respons'#225'vel Financeiro:'
  end
  object sbResp: TSpeedButton
    Left = 224
    Top = 76
    Width = 26
    Height = 24
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
    OnClick = sbRespClick
  end
  object cbBolsas: TComboBox
    Left = 144
    Top = 13
    Width = 317
    Height = 22
    Style = csOwnerDrawFixed
    ItemHeight = 16
    TabOrder = 0
    OnChange = cbBolsasChange
    OnKeyPress = cbBolsasKeyPress
  end
  object edValorBolsa: TEdit
    Left = 144
    Top = 45
    Width = 81
    Height = 21
    TabOrder = 1
  end
  object edPercentual: TEdit
    Left = 388
    Top = 45
    Width = 73
    Height = 21
    TabOrder = 2
  end
  object edCodigoResp: TEdit
    Left = 144
    Top = 77
    Width = 81
    Height = 21
    TabOrder = 3
  end
  object edNomeResp: TEdit
    Left = 248
    Top = 77
    Width = 213
    Height = 21
    TabOrder = 4
  end
  object BitBtn1: TBitBtn
    Left = 256
    Top = 120
    Width = 91
    Height = 25
    Caption = 'Cancelar'
    TabOrder = 6
    Kind = bkAbort
  end
  object BitBtn2: TBitBtn
    Left = 353
    Top = 120
    Width = 108
    Height = 25
    Caption = 'Confirmar'
    ModalResult = 1
    TabOrder = 5
    OnClick = BitBtn2Click
    Glyph.Data = {
      F2010000424DF201000000000000760000002800000024000000130000000100
      0400000000007C01000000000000000000001000000000000000000000000000
      80000080000000808000800000008000800080800000C0C0C000808080000000
      FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333334433333
      3333333333388F3333333333000033334224333333333333338338F333333333
      0000333422224333333333333833338F33333333000033422222243333333333
      83333338F3333333000034222A22224333333338F33F33338F33333300003222
      A2A2224333333338F383F3338F33333300003A2A222A222433333338F8333F33
      38F33333000034A22222A22243333338833333F3338F333300004222A2222A22
      2433338F338F333F3338F3330000222A3A2224A22243338F3838F338F3338F33
      0000A2A333A2224A2224338F83338F338F3338F300003A33333A2224A2224338
      333338F338F3338F000033333333A2224A2243333333338F338F338F00003333
      33333A2224A2233333333338F338F83300003333333333A2224A333333333333
      8F338F33000033333333333A222433333333333338F338F30000333333333333
      A224333333333333338F38F300003333333333333A223333333333333338F8F3
      000033333333333333A3333333333333333383330000}
    NumGlyphs = 2
  end
  object qyBolsas: TUMZQuery
    Connection = DM.db
    Params = <>
    Top = 120
  end
end
