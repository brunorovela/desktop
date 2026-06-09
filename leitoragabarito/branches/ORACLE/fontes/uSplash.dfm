object frmSplash: TfrmSplash
  Left = 266
  Top = 240
  BorderIcons = []
  BorderStyle = bsNone
  ClientHeight = 97
  ClientWidth = 326
  Color = clBtnFace
  Font.Charset = ANSI_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Arial'
  Font.Style = []
  OldCreateOrder = True
  Position = poScreenCenter
  Visible = True
  OnPaint = FormPaint
  PixelsPerInch = 96
  TextHeight = 14
  object lblAguarde: TLabel
    Left = 130
    Top = 25
    Width = 60
    Height = 16
    Caption = 'Aguarde...'
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Arial'
    Font.Style = []
    ParentFont = False
    Transparent = True
  end
  object Label1: TLabel
    Left = 56
    Top = 57
    Width = 213
    Height = 16
    Caption = 'Conectando com o Banco de Dados.'
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Arial'
    Font.Style = []
    ParentFont = False
    Transparent = True
  end
  object Bevel1: TBevel
    Left = 0
    Top = 0
    Width = 326
    Height = 97
    Align = alClient
    Style = bsRaised
  end
end