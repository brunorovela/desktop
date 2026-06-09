object frmProg: TfrmProg
  Left = 0
  Top = 0
  BorderIcons = []
  BorderStyle = bsDialog
  Caption = 'Finalizado...'
  ClientHeight = 100
  ClientWidth = 414
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poMainFormCenter
  PixelsPerInch = 96
  TextHeight = 13
  object lblDesc: TLabel
    Left = 8
    Top = 16
    Width = 393
    Height = 17
    Alignment = taCenter
    AutoSize = False
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object pgbProgresso: TProgressBar
    Left = 8
    Top = 48
    Width = 393
    Height = 33
    Smooth = True
    TabOrder = 0
  end
end

