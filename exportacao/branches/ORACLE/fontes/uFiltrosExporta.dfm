object fFiltroExporta: TfFiltroExporta
  Left = 0
  Top = 0
  BorderStyle = bsDialog
  Caption = 'Informe os filtros para a Exporta'#231#227'o:'
  ClientHeight = 149
  ClientWidth = 332
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -13
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  PixelsPerInch = 96
  TextHeight = 16
  object lbFiltro: TLabel
    Left = 16
    Top = 18
    Width = 289
    Height = 38
    AutoSize = False
    Caption = 'Nome do Filtro:'
    WordWrap = True
  end
  object edString: TEdit
    Left = 16
    Top = 62
    Width = 289
    Height = 24
    TabOrder = 0
    Visible = False
  end
  object edInteger: TEdit
    Left = 16
    Top = 62
    Width = 289
    Height = 24
    TabOrder = 1
    Visible = False
  end
  object dtpData: TDateTimePicker
    Left = 16
    Top = 62
    Width = 289
    Height = 24
    Date = 39794.609327974540000000
    Time = 39794.609327974540000000
    TabOrder = 2
    Visible = False
  end
  object btnOk: TBitBtn
    Left = 104
    Top = 106
    Width = 100
    Height = 25
    TabOrder = 3
    Kind = bkOK
  end
  object btnCancel: TBitBtn
    Left = 205
    Top = 106
    Width = 100
    Height = 25
    TabOrder = 4
    Kind = bkCancel
  end
end
