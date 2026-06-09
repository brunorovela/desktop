object frmDataHoje: TfrmDataHoje
  Left = 261
  Top = 219
  BorderStyle = bsSingle
  Caption = 'Data de Hoje...'
  ClientHeight = 75
  ClientWidth = 274
  Color = clBtnFace
  Font.Charset = ANSI_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Arial'
  Font.Style = []
  OldCreateOrder = True
  Position = poScreenCenter
  OnPaint = FormPaint
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 14
  object Label1: TLabel
    Left = 39
    Top = 8
    Width = 196
    Height = 19
    Caption = 'Confirmar a Data de Hoje:'
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'Arial'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object txt: TMaskEdit
    Left = 64
    Top = 32
    Width = 137
    Height = 32
    EditMask = '!99/99/9900;1;_'
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -21
    Font.Name = 'Arial'
    Font.Style = [fsBold]
    MaxLength = 10
    ParentFont = False
    TabOrder = 0
    Text = '  /  /    '
    OnKeyPress = txtKeyPress
  end
end
