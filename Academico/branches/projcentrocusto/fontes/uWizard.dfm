object fWizard: TfWizard
  Left = 0
  Top = 0
  Caption = 'Wizard'
  ClientHeight = 487
  ClientWidth = 528
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  OnCloseQuery = FormCloseQuery
  PixelsPerInch = 96
  TextHeight = 13
  object pnAcoes: TPanel
    Left = 0
    Top = 426
    Width = 528
    Height = 61
    Align = alBottom
    BevelKind = bkFlat
    BevelOuter = bvNone
    TabOrder = 0
    object btnCancelar: TBitBtn
      Left = 4
      Top = 15
      Width = 117
      Height = 33
      Caption = '&Cancelar'
      TabOrder = 0
      Kind = bkCancel
    end
    object btnProximo: TBitBtn
      Left = 266
      Top = 14
      Width = 111
      Height = 33
      Caption = '&Pr'#243'ximo >>'
      TabOrder = 1
    end
    object btnAnterior: TBitBtn
      Left = 135
      Top = 14
      Width = 117
      Height = 33
      Caption = '<< &Anterior'
      TabOrder = 2
    end
    object btnFinalizar: TBitBtn
      Left = 397
      Top = 14
      Width = 117
      Height = 33
      Caption = '&Finalizar'
      TabOrder = 3
      NumGlyphs = 2
    end
  end
  object pcPassos: TPageControl
    Left = 0
    Top = 0
    Width = 528
    Height = 426
    Align = alClient
    MultiLine = True
    Style = tsFlatButtons
    TabOrder = 1
    ExplicitLeft = 72
    ExplicitTop = 16
  end
end

