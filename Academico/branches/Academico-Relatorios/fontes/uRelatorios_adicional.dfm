object frm_relatorios_adicional: Tfrm_relatorios_adicional
  Left = 0
  Top = 0
  Caption = 'Preenchimento de Vari'#225'veis'
  ClientHeight = 381
  ClientWidth = 641
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 13
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 641
    Height = 25
    Align = alTop
    BevelOuter = bvLowered
    Caption = 'Preenchimento de Vari'#225'veis'
    Color = clBlue
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWhite
    Font.Height = -13
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 0
  end
  object btConfirmar: TBitBtn
    Left = 448
    Top = 352
    Width = 97
    Height = 25
    Caption = 'Confirmar'
    ModalResult = 1
    TabOrder = 1
    OnClick = btConfirmarClick
    Glyph.Data = {
      DE010000424DDE01000000000000760000002800000024000000120000000100
      0400000000006801000000000000000000001000000000000000000000000000
      80000080000000808000800000008000800080800000C0C0C000808080000000
      FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333333333333
      3333333333333333333333330000333333333333333333333333F33333333333
      00003333344333333333333333388F3333333333000033334224333333333333
      338338F3333333330000333422224333333333333833338F3333333300003342
      222224333333333383333338F3333333000034222A22224333333338F338F333
      8F33333300003222A3A2224333333338F3838F338F33333300003A2A333A2224
      33333338F83338F338F33333000033A33333A222433333338333338F338F3333
      0000333333333A222433333333333338F338F33300003333333333A222433333
      333333338F338F33000033333333333A222433333333333338F338F300003333
      33333333A222433333333333338F338F00003333333333333A22433333333333
      3338F38F000033333333333333A223333333333333338F830000333333333333
      333A333333333333333338330000333333333333333333333333333333333333
      0000}
    NumGlyphs = 2
  end
  object btCancelar: TBitBtn
    Left = 559
    Top = 352
    Width = 75
    Height = 25
    Caption = 'Cancelar'
    TabOrder = 2
    OnClick = btCancelarClick
    Kind = bkCancel
  end
  object sxDados: TScrollBox
    Left = 8
    Top = 32
    Width = 625
    Height = 313
    TabOrder = 3
  end
  object qyCampos: TUMZQuery
    Connection = DM.db
    SQL.Strings = (
      'SELECT'
      '  ds_variaveis'
      'FROM'
      '  relatorios'
      'WHERE'
      '  cd_relatorio = :cd_relatorio')
    Params = <
      item
        DataType = ftUnknown
        Name = 'cd_relatorio'
        ParamType = ptUnknown
      end>
    Left = 608
    Top = 32
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'cd_relatorio'
        ParamType = ptUnknown
      end>
  end
end
