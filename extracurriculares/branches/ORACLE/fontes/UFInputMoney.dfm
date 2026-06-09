object fInputMoney: TfInputMoney
  Left = 0
  Top = 0
  BorderStyle = bsDialog
  Caption = 'fInputMoney'
  ClientHeight = 223
  ClientWidth = 401
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  PixelsPerInch = 96
  TextHeight = 13
  object lblPrompt: TLabel
    Left = 112
    Top = 40
    Width = 44
    Height = 13
    Caption = 'lblPrompt'
  end
  object btnOk: TButton
    Left = 80
    Top = 136
    Width = 75
    Height = 25
    Caption = 'btnOk'
    TabOrder = 0
  end
  object btnCancel: TButton
    Left = 176
    Top = 136
    Width = 75
    Height = 25
    Caption = 'btnCancel'
    TabOrder = 1
  end
  object edtValue: TEdit
    Left = 96
    Top = 80
    Width = 121
    Height = 21
    TabOrder = 2
    Text = 'edtValue'
  end
end
