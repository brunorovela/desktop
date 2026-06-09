object fBuscaCaixaPlanilha: TfBuscaCaixaPlanilha
  Left = 0
  Top = 0
  BorderIcons = []
  BorderStyle = bsSingle
  Caption = 'Busca movimento na planilha de caixa'
  ClientHeight = 491
  ClientWidth = 414
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  OnCreate = inicializaForm
  OnDestroy = FormDestroy
  PixelsPerInch = 96
  TextHeight = 13
  object FLbTDataMov: TLabel
    Left = 8
    Top = 50
    Width = 115
    Height = 13
    Alignment = taRightJustify
    Caption = 'Data de movimento:'
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object FLbDataMovAte: TLabel
    Left = 259
    Top = 50
    Width = 16
    Height = 13
    Caption = 'at'#233
  end
  object FLbTDataReg: TLabel
    Left = 8
    Top = 84
    Width = 95
    Height = 13
    Alignment = taRightJustify
    Caption = 'Data de registro:'
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object FLbDataRegAte: TLabel
    Left = 259
    Top = 84
    Width = 16
    Height = 13
    Caption = 'at'#233
  end
  object FLbTUsuario: TLabel
    Left = 8
    Top = 114
    Width = 46
    Height = 13
    Alignment = taRightJustify
    Caption = 'Usu'#225'rio:'
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object FLbTEntSaida: TLabel
    Left = 8
    Top = 146
    Width = 84
    Height = 13
    Alignment = taRightJustify
    Caption = 'Entrada/Sa'#237'da:'
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object FLbTOrigem: TLabel
    Left = 8
    Top = 213
    Width = 44
    Height = 13
    Alignment = taRightJustify
    Caption = 'Origem:'
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object FLbTVlLancamento: TLabel
    Left = 8
    Top = 382
    Width = 119
    Height = 13
    Alignment = taRightJustify
    Caption = 'Valor do lan'#231'amento:'
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object FLbTHist: TLabel
    Left = 8
    Top = 246
    Width = 53
    Height = 13
    Alignment = taRightJustify
    Caption = 'Hist'#243'rico:'
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object FLbTCompensado: TLabel
    Left = 8
    Top = 180
    Width = 79
    Height = 13
    Alignment = taRightJustify
    Caption = 'Compensado?'
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object FLbTPlanoContas: TLabel
    Left = 8
    Top = 316
    Width = 92
    Height = 13
    Alignment = taRightJustify
    Caption = 'Plano de contas:'
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object FLbTCentroCusto: TLabel
    Left = 8
    Top = 343
    Width = 93
    Height = 13
    Alignment = taRightJustify
    Caption = 'Centro de Custo:'
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object btnPlanoContas: TSpeedButton
    Left = 373
    Top = 315
    Width = 33
    Height = 23
    Flat = True
    Glyph.Data = {
      76010000424D7601000000000000760000002800000020000000100000000100
      04000000000000010000130B0000130B00001000000000000000000000000000
      800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
      FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333333333333
      33033333333333333F7F3333333333333000333333333333F777333333333333
      000333333333333F777333333333333000333333333333F77733333333333300
      033333333FFF3F777333333700073B703333333F7773F77733333307777700B3
      33333377333777733333307F8F8F7033333337F333F337F3333377F8F9F8F773
      3333373337F3373F3333078F898F870333337F33F7FFF37F333307F99999F703
      33337F377777337F3333078F898F8703333373F337F33373333377F8F9F8F773
      333337F3373337F33333307F8F8F70333333373FF333F7333333330777770333
      333333773FF77333333333370007333333333333777333333333}
    NumGlyphs = 2
    OnClick = btnPlanoContasClick
  end
  object Label1: TLabel
    Left = 5
    Top = 18
    Width = 126
    Height = 13
    Alignment = taRightJustify
    Caption = 'C'#243'digo de movimento:'
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object FCbDataMov: TCheckBox
    Left = 129
    Top = 49
    Width = 39
    Height = 17
    Caption = 'De:'
    TabOrder = 0
    OnClick = habilitaFiltroDataMovimento
  end
  object FDtDataMovIni: TDateTimePicker
    Left = 167
    Top = 48
    Width = 86
    Height = 21
    Date = 39897.000000000000000000
    Time = 39897.000000000000000000
    Enabled = False
    TabOrder = 1
  end
  object FDtDataMovFim: TDateTimePicker
    Left = 281
    Top = 48
    Width = 86
    Height = 21
    Date = 39897.999988425920000000
    Time = 39897.999988425920000000
    Enabled = False
    TabOrder = 2
  end
  object FCbDataReg: TCheckBox
    Left = 129
    Top = 83
    Width = 39
    Height = 17
    Caption = 'De:'
    TabOrder = 3
    OnClick = habilitaFiltroDataRegistro
  end
  object FDtDataRegIni: TDateTimePicker
    Left = 167
    Top = 81
    Width = 86
    Height = 21
    Date = 39897.000000000000000000
    Time = 39897.000000000000000000
    Enabled = False
    TabOrder = 4
  end
  object FDtDataRegFim: TDateTimePicker
    Left = 281
    Top = 81
    Width = 86
    Height = 21
    Date = 39897.999988425920000000
    Time = 39897.999988425920000000
    Enabled = False
    TabOrder = 5
  end
  object FCbUsuarios: TComboBox
    Left = 129
    Top = 114
    Width = 238
    Height = 19
    Style = csOwnerDrawFixed
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -12
    Font.Name = 'Tahoma'
    Font.Style = []
    ItemHeight = 13
    ParentFont = False
    TabOrder = 6
  end
  object FCbTpEntSaida: TComboBox
    Left = 129
    Top = 146
    Width = 184
    Height = 19
    Style = csOwnerDrawFixed
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -12
    Font.Name = 'Tahoma'
    Font.Style = []
    ItemHeight = 13
    ItemIndex = 3
    ParentFont = False
    TabOrder = 7
    Text = 'TODOS'
    Items.Strings = (
      'Abertura de caixa'
      'Entrada de valores'
      'Sa'#237'da de valores'
      'TODOS')
  end
  object FCbOrigem: TComboBox
    Left = 129
    Top = 213
    Width = 145
    Height = 19
    Style = csOwnerDrawFixed
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -12
    Font.Name = 'Tahoma'
    Font.Style = []
    ItemHeight = 13
    ItemIndex = 0
    ParentFont = False
    TabOrder = 9
    Text = 'QUALQUER'
    Items.Strings = (
      'QUALQUER'
      'Contas a receber'
      'Contas a pagar'
      'Tesouraria')
  end
  object FCbVlMaiorIgual: TCheckBox
    Left = 26
    Top = 402
    Width = 114
    Height = 17
    Caption = 'Igual ou maior que:'
    TabOrder = 13
    OnClick = habilitaFiltroValorLancmt
  end
  object FCbVlMenorIgual: TCheckBox
    Left = 26
    Top = 433
    Width = 114
    Height = 17
    Caption = 'Menor ou igual que:'
    TabOrder = 15
    OnClick = habilitaFiltroValorLancmt
  end
  object FEdVlMaiorIgual: TEdit
    Left = 146
    Top = 402
    Width = 118
    Height = 21
    Enabled = False
    TabOrder = 14
    OnExit = fimDigitacaoValor
    OnKeyPress = validaValor
  end
  object FEdVlMenorIgual: TEdit
    Left = 146
    Top = 433
    Width = 118
    Height = 21
    Enabled = False
    TabOrder = 16
    OnExit = fimDigitacaoValor
    OnKeyPress = validaValor
  end
  object FMmHist: TMemo
    Left = 129
    Top = 246
    Width = 238
    Height = 58
    TabOrder = 10
  end
  object FCbCentroCusto: TComboBox
    Left = 129
    Top = 343
    Width = 238
    Height = 19
    Style = csOwnerDrawFixed
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -12
    Font.Name = 'Tahoma'
    Font.Style = []
    ItemHeight = 13
    ParentFont = False
    TabOrder = 12
  end
  object FCbCompensado: TComboBox
    Left = 129
    Top = 180
    Width = 145
    Height = 19
    Style = csOwnerDrawFixed
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -12
    Font.Name = 'Tahoma'
    Font.Style = []
    ItemHeight = 13
    ItemIndex = 2
    ParentFont = False
    TabOrder = 8
    Text = 'AMBOS'
    Items.Strings = (
      'N'#227'o'
      'Sim'
      'AMBOS')
  end
  object FBnOK: TBitBtn
    Left = 8
    Top = 461
    Width = 121
    Height = 25
    TabOrder = 17
    OnClick = filtra
    Kind = bkOK
  end
  object FBnCancelar: TBitBtn
    Left = 135
    Top = 461
    Width = 121
    Height = 25
    TabOrder = 18
    OnClick = cancela
    Kind = bkCancel
  end
  object txtPlanoConta: TEdit
    Left = 129
    Top = 316
    Width = 238
    Height = 21
    TabOrder = 11
  end
  object edCodMov: TEdit
    Left = 137
    Top = 15
    Width = 230
    Height = 21
    TabOrder = 19
    OnKeyPress = validaValor
  end
end
