object FCatracaDesktop: TFCatracaDesktop
  Left = 0
  Top = 0
  Caption = 'M'#243'dulo de catracas Henry - Desktop'
  ClientHeight = 473
  ClientWidth = 833
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 13
  object PFundoGeral: TPanel
    Left = 0
    Top = 0
    Width = 833
    Height = 454
    Align = alClient
    TabOrder = 0
    object PGeralButton: TPanel
      Left = 1
      Top = 412
      Width = 831
      Height = 41
      Align = alBottom
      TabOrder = 0
      object BIniciar: TButton
        Left = 9
        Top = 5
        Width = 75
        Height = 25
        Caption = 'Iniciar'
        TabOrder = 0
        OnClick = BIniciarClick
      end
      object btnParar: TButton
        Left = 90
        Top = 5
        Width = 75
        Height = 25
        Caption = 'Parar'
        TabOrder = 1
        OnClick = btnPararClick
      end
      object BtnLimparLogs: TButton
        Left = 184
        Top = 5
        Width = 81
        Height = 25
        Caption = 'Limpar logs'
        TabOrder = 2
        OnClick = BtnLimparLogsClick
      end
    end
    object PSubGeralFundo: TPanel
      Left = 1
      Top = 1
      Width = 831
      Height = 411
      Align = alClient
      TabOrder = 1
      object PSecFundoButton: TPanel
        Left = 1
        Top = 62
        Width = 829
        Height = 348
        Align = alClient
        BevelOuter = bvNone
        TabOrder = 0
        object MLogs: TMemo
          Left = 0
          Top = 17
          Width = 829
          Height = 331
          Align = alClient
          ReadOnly = True
          ScrollBars = ssVertical
          TabOrder = 0
        end
        object PFundoGeralLogs: TPanel
          Left = 0
          Top = 0
          Width = 829
          Height = 17
          Align = alTop
          Caption = 'Logs'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = [fsBold]
          ParentFont = False
          TabOrder = 1
        end
      end
      object PGeralTop: TPanel
        Left = 1
        Top = 1
        Width = 829
        Height = 61
        Align = alTop
        TabOrder = 1
        object lbTempoReinicializar: TLabel
          Left = 272
          Top = 13
          Width = 112
          Height = 13
          Caption = 'Tempo para reinicializar'
        end
        object chGerarLogs: TCheckBox
          Left = 8
          Top = 13
          Width = 156
          Height = 17
          Caption = 'Gerar logs detalhados'
          TabOrder = 0
        end
        object chReiniciarAutomaticamente: TCheckBox
          Left = 8
          Top = 32
          Width = 156
          Height = 17
          Caption = 'Reiniciar automaticamente'
          TabOrder = 1
          OnClick = chReiniciarAutomaticamenteClick
        end
        object edTempoReiniciar: TEdit
          Left = 272
          Top = 28
          Width = 121
          Height = 21
          Enabled = False
          TabOrder = 2
          Text = '5'
        end
        object cbIntervaloReiniciar: TComboBox
          Left = 400
          Top = 28
          Width = 97
          Height = 21
          AutoComplete = False
          Style = csDropDownList
          Enabled = False
          ItemHeight = 13
          ItemIndex = 1
          TabOrder = 3
          Text = 'Minutos'
          Items.Strings = (
            'Segundos'
            'Minutos'
            'Horas')
        end
      end
    end
  end
  object TStatus: TStatusBar
    Left = 0
    Top = 454
    Width = 833
    Height = 19
    Panels = <
      item
        Width = 200
      end>
  end
  object XPManifest1: TXPManifest
    Left = 312
    Top = 144
  end
  object TTimerBanco: TTimer
    Interval = 300000
    OnTimer = TTimerBancoTimer
    Left = 312
    Top = 200
  end
  object TTimerStatusBanco: TTimer
    Interval = 5000
    OnTimer = TTimerStatusBancoTimer
    Left = 352
    Top = 200
  end
  object TTimerReiniciar: TTimer
    Enabled = False
    OnTimer = TTimerReiniciarTimer
    Left = 390
    Top = 200
  end
end
