object fCobrancasHistorico: TfCobrancasHistorico
  Left = 0
  Top = 0
  BorderStyle = bsToolWindow
  Caption = 'Hist'#243'rico'
  ClientHeight = 203
  ClientWidth = 407
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 13
  object lbUsuario: TLabel
    Left = 8
    Top = 8
    Width = 40
    Height = 13
    Caption = 'Usu'#225'rio:'
  end
  object FlbHistorico: TLabel
    Left = 176
    Top = 35
    Width = 45
    Height = 13
    Caption = 'Hist'#243'rico:'
  end
  object FdtRegistro: TLabel
    Left = 8
    Top = 149
    Width = 85
    Height = 13
    Caption = 'Data de Registro:'
  end
  object FlbDtRetorno: TLabel
    Left = 8
    Top = 168
    Width = 84
    Height = 13
    Caption = 'Data de Retorno:'
  end
  object FmmHistorico: TMemo
    Left = 0
    Top = 54
    Width = 409
    Height = 87
    Lines.Strings = (
      'FmmHistorico')
    ReadOnly = True
    ScrollBars = ssVertical
    TabOrder = 0
  end
end
