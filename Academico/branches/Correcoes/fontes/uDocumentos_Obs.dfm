object frm_Documentos_Obs: Tfrm_Documentos_Obs
  Left = 255
  Top = 263
  BorderStyle = bsDialog
  Caption = 'Observação para o Documento'
  ClientHeight = 174
  ClientWidth = 380
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object Bevel1: TBevel
    Left = 11
    Top = 48
    Width = 361
    Height = 28
  end
  object lbDoc: TLabel
    Left = 24
    Top = 56
    Width = 28
    Height = 13
    Caption = 'lbDoc'
  end
  object Label2: TLabel
    Left = 14
    Top = 88
    Width = 61
    Height = 13
    Caption = 'Observação:'
  end
  object eDoc: TEdit
    Left = 14
    Top = 104
    Width = 353
    Height = 21
    TabOrder = 0
  end
  object BitBtn1: TBitBtn
    Left = 184
    Top = 136
    Width = 97
    Height = 25
    Caption = '&Confirmar'
    Default = True
    ModalResult = 1
    TabOrder = 1
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
  object BitBtn2: TBitBtn
    Left = 288
    Top = 136
    Width = 75
    Height = 25
    Caption = 'Cancelar'
    TabOrder = 2
    Kind = bkCancel
  end
  object Panel3: TPanel
    Left = 0
    Top = 0
    Width = 380
    Height = 25
    Align = alTop
    BevelOuter = bvLowered
    Caption = 'OBSERVAÇÃO DO DOCUMENTO'
    Color = clBlue
    Font.Charset = ANSI_CHARSET
    Font.Color = clWhite
    Font.Height = -13
    Font.Name = 'Arial'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 3
  end
end

