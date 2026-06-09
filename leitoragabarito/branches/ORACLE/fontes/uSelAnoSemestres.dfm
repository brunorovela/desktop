object frmSelAnoSemestres: TfrmSelAnoSemestres
  Left = 0
  Top = 0
  BorderIcons = [biMinimize, biMaximize]
  ClientHeight = 81
  ClientWidth = 239
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poDesktopCenter
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object pnlPrincipal: TPanel
    Left = 0
    Top = 0
    Width = 239
    Height = 81
    Align = alClient
    BevelOuter = bvNone
    TabOrder = 0
    object lblTitulo: TLabel
      Left = 8
      Top = 6
      Width = 227
      Height = 13
      Caption = 'Deseja copiar a prova para qual ano/semestre?'
    end
    object UpDown3: TUpDown
      Left = 219
      Top = 24
      Width = 14
      Height = 24
      Min = -100
      TabOrder = 0
      OnClick = UpDown3Click
    end
    object mkAnoSemestre: TMaskEdit
      Tag = 1
      Left = 8
      Top = 25
      Width = 212
      Height = 22
      TabStop = False
      EditMask = '9999/9;0;_'
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Arial'
      Font.Style = []
      MaxLength = 6
      ParentFont = False
      TabOrder = 1
      Text = '19931'
    end
    object Cancelar: TButton
      Left = 41
      Top = 51
      Width = 75
      Height = 25
      Caption = 'Cancelar'
      TabOrder = 2
      OnClick = CancelarClick
    end
    object Button1: TButton
      Left = 137
      Top = 51
      Width = 75
      Height = 25
      Caption = 'Confirmar'
      TabOrder = 3
      OnClick = ConfirmarClick
    end
  end
end
