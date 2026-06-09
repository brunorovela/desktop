object fMensagemDinamica: TfMensagemDinamica
  Left = 0
  Top = 0
  BorderStyle = bsDialog
  Caption = 'UNIMESTRE'
  ClientHeight = 110
  ClientWidth = 694
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
  object pnGeral: TPanel
    Left = 0
    Top = 0
    Width = 694
    Height = 72
    Align = alClient
    BevelOuter = bvNone
    TabOrder = 0
    object pnMensagem: TLabel
      Left = 96
      Top = 0
      Width = 529
      Height = 66
      AutoSize = False
      Layout = tlCenter
    end
  end
  object pnBotoes: TPanel
    Left = 0
    Top = 72
    Width = 694
    Height = 38
    Align = alBottom
    BevelOuter = bvNone
    Color = clBtnHighlight
    TabOrder = 1
  end
end
