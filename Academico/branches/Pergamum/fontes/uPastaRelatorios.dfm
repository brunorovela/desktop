object Form1: TForm1
  Left = 0
  Top = 0
  BorderStyle = bsDialog
  Caption = 'UNIMESTRE'
  ClientHeight = 250
  ClientWidth = 454
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
    Left = 16
    Top = 24
    Width = 165
    Height = 13
    Caption = 'Pasta de Impress'#227'o de Relat'#243'rios:'
  end
  object Label2: TLabel
    Left = 16
    Top = 88
    Width = 92
    Height = 13
    Caption = 'Pasta do Windows:'
  end
  object Label3: TLabel
    Left = 16
    Top = 151
    Width = 106
    Height = 13
    Caption = 'Pasta do UNIMESTRE:'
  end
  object Memo1: TMemo
    Left = 16
    Top = 43
    Width = 417
    Height = 38
    ReadOnly = True
    TabOrder = 0
  end
  object BitBtn1: TBitBtn
    Left = 358
    Top = 214
    Width = 75
    Height = 25
    TabOrder = 1
    OnClick = BitBtn1Click
    Kind = bkOK
  end
  object Memo2: TMemo
    Left = 16
    Top = 107
    Width = 417
    Height = 38
    ReadOnly = True
    TabOrder = 2
  end
  object Memo3: TMemo
    Left = 16
    Top = 170
    Width = 417
    Height = 38
    ReadOnly = True
    TabOrder = 3
  end
end
