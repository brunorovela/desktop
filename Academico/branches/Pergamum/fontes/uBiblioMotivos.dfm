object fmMotivos: TfmMotivos
  Left = 325
  Top = 331
  BorderStyle = bsDialog
  Caption = 'Motivo...'
  ClientHeight = 136
  ClientWidth = 456
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  OnClose = FormClose
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel
    Tag = 1
    Left = 49
    Top = 11
    Width = 35
    Height = 13
    Caption = 'Motivo:'
  end
  object Label2: TLabel
    Tag = 1
    Left = 8
    Top = 103
    Width = 71
    Height = 13
    Caption = 'Autorizado por:'
  end
  object pnlUsuario: TPanel
    Left = 88
    Top = 98
    Width = 185
    Height = 25
    Caption = 'pnlUsuario'
    TabOrder = 0
  end
  object BitBtn1: TBitBtn
    Left = 280
    Top = 98
    Width = 75
    Height = 25
    TabOrder = 1
    OnClick = BitBtn1Click
    Kind = bkOK
    Style = bsNew
  end
  object btnCancelar: TBitBtn
    Tag = 1
    Left = 360
    Top = 98
    Width = 75
    Height = 25
    Caption = 'Cancelar'
    TabOrder = 2
    Kind = bkCancel
    Style = bsNew
  end
  object txtMotivo: TMemo
    Left = 88
    Top = 12
    Width = 345
    Height = 79
    TabOrder = 3
  end
end

