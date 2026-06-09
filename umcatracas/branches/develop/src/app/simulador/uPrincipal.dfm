object Form1: TForm1
  Left = 0
  Top = 0
  BorderIcons = [biSystemMenu, biMinimize]
  BorderStyle = bsSingle
  Caption = 'Unimestre simulador Henry8x'
  ClientHeight = 396
  ClientWidth = 645
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poDesktopCenter
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object mmLog: TMemo
    Left = 0
    Top = 138
    Width = 645
    Height = 258
    Align = alBottom
    ReadOnly = True
    ScrollBars = ssBoth
    TabOrder = 0
  end
  object GroupBox1: TGroupBox
    Left = 0
    Top = 0
    Width = 645
    Height = 138
    Align = alClient
    Caption = 'Pedido do equipamento'
    TabOrder = 1
    object Label1: TLabel
      Left = 16
      Top = 64
      Width = 52
      Height = 13
      Caption = 'Comando: '
    end
    object rbPasso1: TRadioButton
      Left = 16
      Top = 17
      Width = 217
      Height = 17
      Caption = '1 - Passou a carteirinha para entrar'
      TabOrder = 0
      OnClick = rbPasso1Click
    end
    object rbPasso2: TRadioButton
      Left = 16
      Top = 40
      Width = 217
      Height = 17
      Caption = '2 - Girou catraca sentido entrada'
      TabOrder = 1
      OnClick = rbPasso2Click
    end
    object rbPasso3: TRadioButton
      Left = 380
      Top = 17
      Width = 237
      Height = 17
      Caption = '3 - Passou a carteirinha para sair'
      TabOrder = 2
      OnClick = rbPasso3Click
    end
    object edComando: TEdit
      Left = 16
      Top = 83
      Width = 489
      Height = 21
      TabOrder = 3
    end
    object btEnviar: TButton
      Left = 528
      Top = 81
      Width = 75
      Height = 25
      Caption = 'Enviar'
      TabOrder = 4
      OnClick = btEnviarClick
    end
    object rbPasso4: TRadioButton
      Left = 380
      Top = 40
      Width = 167
      Height = 17
      Caption = '4 - Girou catraca sentido sa'#237'da'
      TabOrder = 5
      OnClick = rbPasso4Click
    end
  end
  object XPManifest1: TXPManifest
    Left = 400
    Top = 24
  end
end
