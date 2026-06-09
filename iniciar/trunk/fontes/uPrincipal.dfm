object fPrincipal: TfPrincipal
  Left = 281
  Top = 275
  BorderIcons = []
  BorderStyle = bsNone
  ClientHeight = 97
  ClientWidth = 326
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  Visible = True
  OnCreate = FormCreate
  OnPaint = FormPaint
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
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
  object LabStatus: TLabel
    Left = 96
    Top = 49
    Width = 133
    Height = 16
    Caption = 'Atualizando o sistema.'
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
  object ProgressBar1: TProgressBar
    Left = 88
    Top = 72
    Width = 150
    Height = 17
    TabOrder = 0
  end
end
