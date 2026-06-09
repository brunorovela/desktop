object frmSelColunas: TfrmSelColunas
  Left = 0
  Top = 0
  BorderStyle = bsDialog
  Caption = 'Selecionar Colunas'
  ClientHeight = 296
  ClientWidth = 437
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  OnClose = FormClose
  PixelsPerInch = 96
  TextHeight = 13
  object Bevel4: TBevel
    Left = 0
    Top = 25
    Width = 437
    Height = 11
    Align = alTop
    Shape = bsSpacer
  end
  object Label1: TLabel
    Left = 16
    Top = 40
    Width = 111
    Height = 13
    Caption = 'Colunas Dispon'#237'veis'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object Label2: TLabel
    Left = 240
    Top = 40
    Width = 102
    Height = 13
    Caption = 'Colunas Utilizadas'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object btInsereUm: TSpeedButton
    Left = 206
    Top = 74
    Width = 25
    Height = 24
    Caption = '>'
    Flat = True
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Arial'
    Font.Style = [fsBold]
    ParentFont = False
    OnClick = btInsereUmClick
  end
  object btRemoveUm: TSpeedButton
    Left = 206
    Top = 98
    Width = 25
    Height = 24
    Caption = '<'
    Flat = True
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Arial'
    Font.Style = [fsBold]
    ParentFont = False
    OnClick = btRemoveUmClick
  end
  object btInsereTodos: TSpeedButton
    Left = 206
    Top = 122
    Width = 25
    Height = 24
    Caption = '>>'
    Flat = True
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Arial'
    Font.Style = [fsBold]
    ParentFont = False
    OnClick = btInsereTodosClick
  end
  object btRemoveTodos: TSpeedButton
    Left = 206
    Top = 146
    Width = 25
    Height = 24
    Caption = '<<'
    Flat = True
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Arial'
    Font.Style = [fsBold]
    ParentFont = False
    OnClick = btRemoveTodosClick
  end
  object sbParaCima: TSpeedButton
    Left = 206
    Top = 186
    Width = 25
    Height = 24
    Flat = True
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Arial'
    Font.Style = [fsBold]
    Glyph.Data = {
      76010000424D7601000000000000760000002800000020000000100000000100
      04000000000000010000120B0000120B00001000000000000000000000000000
      800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
      FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333333000333
      3333333333777F33333333333309033333333333337F7F333333333333090333
      33333333337F7F33333333333309033333333333337F7F333333333333090333
      33333333337F7F33333333333309033333333333FF7F7FFFF333333000090000
      3333333777737777F333333099999990333333373F3333373333333309999903
      333333337F33337F33333333099999033333333373F333733333333330999033
      3333333337F337F3333333333099903333333333373F37333333333333090333
      33333333337F7F33333333333309033333333333337373333333333333303333
      333333333337F333333333333330333333333333333733333333}
    NumGlyphs = 2
    ParentFont = False
    OnClick = sbParaCimaClick
  end
  object sbParaBaixo: TSpeedButton
    Left = 206
    Top = 210
    Width = 25
    Height = 24
    Flat = True
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Arial'
    Font.Style = [fsBold]
    Glyph.Data = {
      76010000424D7601000000000000760000002800000020000000100000000100
      04000000000000010000120B0000120B00001000000000000000000000000000
      800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
      FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333333303333
      333333333337F33333333333333033333333333333373F333333333333090333
      33333333337F7F33333333333309033333333333337373F33333333330999033
      3333333337F337F33333333330999033333333333733373F3333333309999903
      333333337F33337F33333333099999033333333373333373F333333099999990
      33333337FFFF3FF7F33333300009000033333337777F77773333333333090333
      33333333337F7F33333333333309033333333333337F7F333333333333090333
      33333333337F7F33333333333309033333333333337F7F333333333333090333
      33333333337F7F33333333333300033333333333337773333333}
    NumGlyphs = 2
    ParentFont = False
    OnClick = sbParaBaixoClick
  end
  object Panel3: TPanel
    Left = 0
    Top = 0
    Width = 437
    Height = 25
    Align = alTop
    BevelOuter = bvLowered
    Caption = 'SELECIONAR COLUNAS'
    Color = clBlue
    Font.Charset = ANSI_CHARSET
    Font.Color = clWhite
    Font.Height = -13
    Font.Name = 'Arial'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 0
  end
  object lbDisponiveis: TListBox
    Left = 16
    Top = 56
    Width = 180
    Height = 185
    ItemHeight = 13
    Sorted = True
    TabOrder = 1
  end
  object lbUtilizadas: TListBox
    Left = 240
    Top = 56
    Width = 180
    Height = 185
    ItemHeight = 13
    TabOrder = 2
  end
  object BitBtn1: TBitBtn
    Left = 336
    Top = 256
    Width = 83
    Height = 25
    TabOrder = 3
    Kind = bkCancel
  end
  object BitBtn2: TBitBtn
    Left = 232
    Top = 256
    Width = 99
    Height = 25
    Caption = 'Utilizar'
    TabOrder = 4
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
  object cbGravarPadrao: TCheckBox
    Left = 16
    Top = 260
    Width = 185
    Height = 17
    Caption = 'Gravar como padr'#227'o'
    TabOrder = 5
  end
end
