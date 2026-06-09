object Form2: TForm2
  Left = 0
  Top = 0
  BorderIcons = [biSystemMenu]
  BorderStyle = bsDialog
  Caption = 'Selecione o Respons'#225'vel'
  ClientHeight = 202
  ClientWidth = 332
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
    Width = 332
    Height = 202
    Align = alClient
    TabOrder = 0
    ExplicitLeft = 56
    ExplicitTop = 57
    ExplicitWidth = 185
    ExplicitHeight = 41
    object Label1: TLabel
      Left = 24
      Top = 24
      Width = 52
      Height = 13
      Caption = 'Selecione: '
    end
    object UMComboBox1: TUMComboBox
      Left = 82
      Top = 21
      Width = 231
      Height = 21
      ItemHeight = 13
      TabOrder = 0
      Text = 'UMComboBox1'
      TamanhoMaximo = 0
    end
  end
end
