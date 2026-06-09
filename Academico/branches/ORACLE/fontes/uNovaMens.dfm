object frm_mensa_alterar: Tfrm_mensa_alterar
  Left = 251
  Top = 174
  BorderStyle = bsDialog
  Caption = 'Alterar T'#237'tulos'
  ClientHeight = 458
  ClientWidth = 623
  Color = clBtnFace
  Font.Charset = ANSI_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Arial'
  Font.Style = []
  KeyPreview = True
  OldCreateOrder = True
  Position = poScreenCenter
  ShowHint = True
  OnCloseQuery = FormCloseQuery
  OnKeyDown = FormKeyDown
  OnPaint = FormPaint
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 14
  object Label1: TLabel
    Left = 11
    Top = 12
    Width = 100
    Height = 14
    Caption = 'Plano de Pagamento:'
  end
  object Label2: TLabel
    Left = 11
    Top = 36
    Width = 93
    Height = 14
    Caption = 'Plano de Desconto:'
  end
  object Bevel1: TBevel
    Left = 8
    Top = 61
    Width = 457
    Height = 10
    Shape = bsTopLine
  end
  object SpeedButton1: TSpeedButton
    Left = 506
    Top = 8
    Width = 23
    Height = 22
    Hint = 'Aplicar Plano de Pagamento na Mensalidade Selecionada'
    Flat = True
    Glyph.Data = {
      76010000424D7601000000000000760000002800000020000000100000000100
      04000000000000010000120B0000120B00001000000000000000000000000000
      800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
      FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00555555555555
      555555555555555555555555555555555555555555FF55555555555559055555
      55555555577FF5555555555599905555555555557777F5555555555599905555
      555555557777FF5555555559999905555555555777777F555555559999990555
      5555557777777FF5555557990599905555555777757777F55555790555599055
      55557775555777FF5555555555599905555555555557777F5555555555559905
      555555555555777FF5555555555559905555555555555777FF55555555555579
      05555555555555777FF5555555555557905555555555555777FF555555555555
      5990555555555555577755555555555555555555555555555555}
    NumGlyphs = 2
    OnClick = SpeedButton1Click
  end
  object SpeedButton2: TSpeedButton
    Left = 506
    Top = 32
    Width = 23
    Height = 22
    Hint = 'Aplicar Plano de Desconto na Mensalidade Selecionada'
    Flat = True
    Glyph.Data = {
      76010000424D7601000000000000760000002800000020000000100000000100
      04000000000000010000120B0000120B00001000000000000000000000000000
      800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
      FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00555555555555
      555555555555555555555555555555555555555555FF55555555555559055555
      55555555577FF5555555555599905555555555557777F5555555555599905555
      555555557777FF5555555559999905555555555777777F555555559999990555
      5555557777777FF5555557990599905555555777757777F55555790555599055
      55557775555777FF5555555555599905555555555557777F5555555555559905
      555555555555777FF5555555555559905555555555555777FF55555555555579
      05555555555555777FF5555555555557905555555555555777FF555555555555
      5990555555555555577755555555555555555555555555555555}
    NumGlyphs = 2
    OnClick = SpeedButton2Click
  end
  object TabControl1: TTabControl
    Left = 8
    Top = 77
    Width = 657
    Height = 332
    Style = tsFlatButtons
    TabOrder = 0
    Tabs.Strings = (
      'PARCELA SELECIONADA'
      'ALUNO'
      'TURMA')
    TabIndex = 0
    OnChange = TabControl1Change
    object lbCodigoAluno: TLabel
      Left = 32
      Top = 39
      Width = 66
      Height = 14
      Alignment = taRightJustify
      Caption = 'C'#243'digo Aluno:'
      FocusControl = dbCodigoAluno
    end
    object dbNomeAluno: TDBText
      Left = 199
      Top = 40
      Width = 242
      Height = 14
      DataField = 'Nome'
      DataSource = DM.dtcAlunoMens
    end
    object lbParcelaInicial: TLabel
      Left = 30
      Top = 116
      Width = 68
      Height = 14
      Alignment = taRightJustify
      Caption = 'Parcela Inicial:'
      FocusControl = dbParcelaInicial
    end
    object lbDataVencimento: TLabel
      Left = 14
      Top = 168
      Width = 84
      Height = 14
      Alignment = taRightJustify
      Caption = 'Data Vencimento:'
      FocusControl = dbVencimento
    end
    object lbValorBruto: TLabel
      Left = 400
      Top = 116
      Width = 57
      Height = 14
      Alignment = taRightJustify
      Caption = 'Valor Bruto:'
      FocusControl = dbValorBruto
    end
    object lbValorDesconto: TLabel
      Left = 350
      Top = 142
      Width = 107
      Height = 14
      Alignment = taRightJustify
      Caption = 'Desconto Condicional:'
      FocusControl = dbValorDesconto
    end
    object lbValorExtra: TLabel
      Left = 401
      Top = 168
      Width = 56
      Height = 14
      Alignment = taRightJustify
      Caption = 'Valor Extra:'
      FocusControl = dbValorExtra
    end
    object lbTurma: TLabel
      Left = 65
      Top = 64
      Width = 33
      Height = 14
      Alignment = taRightJustify
      Caption = 'Turma:'
      FocusControl = dbTurma
    end
    object lbAnoLetivo: TLabel
      Left = 10
      Top = 90
      Width = 88
      Height = 14
      Alignment = taRightJustify
      Caption = 'Ano Letivo / Sem.:'
      FocusControl = dbAnoLetivo
    end
    object lbDataPagto: TLabel
      Left = 402
      Top = 246
      Width = 55
      Height = 14
      Alignment = taRightJustify
      Caption = 'Data Pagto:'
      FocusControl = dbPagamento
    end
    object lbValorJuros: TLabel
      Left = 399
      Top = 194
      Width = 58
      Height = 14
      Alignment = taRightJustify
      Caption = 'Valor Juros:'
      FocusControl = dbValorJuros
    end
    object lbValorTotal: TLabel
      Left = 404
      Top = 220
      Width = 53
      Height = 14
      Alignment = taRightJustify
      Caption = 'Valor Total:'
      FocusControl = dbValorTotal
    end
    object DBText2: TDBText
      Left = 556
      Top = 194
      Width = 40
      Height = 14
      AutoSize = True
      DataField = 'ValorJurosCalc'
      DataSource = DM.dtcMensalidades
    end
    object DBText3: TDBText
      Left = 556
      Top = 220
      Width = 40
      Height = 14
      AutoSize = True
      DataField = 'ValorTotalCalc'
      DataSource = DM.dtcMensalidades
      Visible = False
    end
    object lbNossoNumero: TLabel
      Left = 408
      Top = 64
      Width = 49
      Height = 14
      Alignment = taRightJustify
      Caption = 'Nosso N'#186':'
      FocusControl = dbNossoNumero
    end
    object lbParcelaFinal: TLabel
      Left = 34
      Top = 142
      Width = 64
      Height = 14
      Alignment = taRightJustify
      Caption = 'Parcela Final:'
      FocusControl = edParcelaFinal
    end
    object lbCreditos: TLabel
      Left = 384
      Top = 272
      Width = 73
      Height = 14
      Alignment = taRightJustify
      Caption = 'Corrigir por Cr.:'
    end
    object lbTipoTitulo: TLabel
      Left = 32
      Top = 220
      Width = 66
      Height = 14
      Alignment = taRightJustify
      Caption = 'Tipo de T'#237'tulo:'
      FocusControl = dbNossoNumero
    end
    object Label3: TLabel
      Left = 8
      Top = 194
      Width = 90
      Height = 14
      Alignment = taRightJustify
      Caption = 'Data Compet'#234'ncia:'
      FocusControl = dbCompetencia
    end
    object lbPlanoContas: TLabel
      Left = 17
      Top = 246
      Width = 81
      Height = 14
      Alignment = taRightJustify
      Caption = 'Plano de Contas:'
      FocusControl = dbNossoNumero
    end
    object lbCentroCusto: TLabel
      Left = 17
      Top = 272
      Width = 81
      Height = 14
      Alignment = taRightJustify
      Caption = 'Centro de Custo:'
      FocusControl = dbNossoNumero
    end
    object lbHistorico: TLabel
      Left = 412
      Top = 90
      Width = 45
      Height = 14
      Alignment = taRightJustify
      Caption = 'Hist'#243'rico:'
      FocusControl = dbNossoNumero
    end
    object sbCadeado: TSpeedButton
      Left = 553
      Top = 113
      Width = 22
      Height = 22
      Flat = True
      Glyph.Data = {
        76010000424D7601000000000000760000002800000020000000100000000100
        04000000000000010000120B0000120B00001000000000000000000000000000
        800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333333000003
        333333333F777773FF333333008888800333333377333F3773F3333077870787
        7033333733337F33373F3308888707888803337F33337F33337F330777880887
        7703337F33337FF3337F3308888000888803337F333777F3337F330777700077
        7703337F33377733337F33088888888888033373FFFFFFFFFF73333000000000
        00333337777777777733333308033308033333337F7F337F7F33333308033308
        033333337F7F337F7F33333308033308033333337F73FF737F33333377800087
        7333333373F77733733333333088888033333333373FFFF73333333333000003
        3333333333777773333333333333333333333333333333333333}
      NumGlyphs = 2
    end
    object umInfoCondicional: TUMAjuda
      Left = 553
      Top = 139
      Width = 24
      Height = 24
      Picture.Data = {
        055449636F6E0000010001001818000001002000880900001600000028000000
        1800000030000000010020000000000000090000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000100000005
        0000000B0000000F000000100000001100000010000000100000001100000010
        0000000F0000000B000000050000000100000000000000000000000000000000
        0000000000000000000000000000000000000000000000010000000700000018
        0000002C251800455940006E6A4E008575560093755600936A4E00855940006E
        251800450000002C000000180000000700000001000000000000000000000000
        0000000000000000000000000000000000000000000000010000000D39290042
        7053039B946E07D3B88B17EEC89A22FBD2A32AFED2A32AFEC89A22FBB88B17EE
        946E07D37053039B392900420000000D00000001000000000000000000000000
        00000000000000000000000000000000795700007856000A825F015BA17A0DC2
        C79D22FBDFB538FFE0B63BFFDDB33BFFDBB13CFFDBB13CFFDDB33BFFE0B63BFF
        DFB538FFC79D22FBA17A0DC2825F015B7856000A795700000000000000000000
        000000000000000000000000866700008165000A8E6B006EAD8715ECD4AF34FF
        DCB63FFFD3A738FFCC9A33FFC89330FFC6902FFFC7902FFFC89431FFCC9B33FF
        D3A738FFDCB63FFFD4AF34FFAD8715EC8E6B006E8165000A8667000000000000
        000000000000000084630000000000008B680054AC8917EBD4B43AFFD7B13FFF
        CD9C36FFC79230FFBD8824FFB9851EFFBD8724FFC38C29FFC6902FFFC79131FF
        C89332FFCC9C36FFD7B13FFFD4B43AFFAC8917EB8B6800540000000084630000
        0000000000000000946E01008560001AA37F11B6CEAE3AFFD7B243FFCE9C38FF
        CA9434FFC28C2CFFD0B17BFFE9DCC5FFDBC49EFFC19644FFC08B2AFFC99333FF
        CA9435FFCA9435FFCE9C38FFD7B243FFCEAE3AFFA37F11B68560001A946E0100
        0000000000000000FFE15E00906E0470BB9A2AF8D8B649FFD2A43FFFCD9938FF
        CC9737FFC18D2BFFE2CFB0FFFFFFFFFFFDFBF9FFE0CDAEFFCAA564FFC59131FF
        CC9737FFCC9738FFCD9938FFD2A43FFFD8B649FFBB9A2AF8906E0470FFE15E00
        000000008665000084630015A07E11BED1B145FFD9B148FFD2A13EFFCF9B3BFF
        CF9B3BFFC79332FFD4B782FFFFFFFFFFFBF9F6FFD1B47FFFCFB076FFC2963EFF
        CB9735FFCF9B3BFFCF9B3BFFD2A13EFFD9B148FFD1B145FFA07E11BE84630015
        866500008B6700008A660046B5942CE4DAB853FFDAB14CFFD4A441FFD29F3EFF
        D29F3EFFCF9A37FFCAA04CFFF6F0E7FFFFFFFFFFE3CFA9FFBC8A25FFC79431FF
        D19E3DFFD29F3EFFD29F3EFFD4A441FFDAB14CFFDAB853FFB5942CE48A660046
        8B6700008C6700008C670068C3A545F8E3C469FFDFB95FFFDAAE52FFD7A649FF
        D5A342FFD4A140FFCB9A3BFFE4D1ACFFFFFFFFFFF2E9DAFFCCA14FFFD29F3BFF
        D5A342FFD5A343FFD7A649FFDAAE52FFDFB95FFFE3C469FFC3A545F88C670068
        8C6700008B6700008B67007ACCB154FFE8CA70FFE3BF67FFDFB761FFDDB25BFF
        DBAD55FFD3A243FFC4932DFFD6B675FFFBF9F5FFFDFCFBFFD7B97BFFCF9C37FF
        DAAA4FFFDBAD55FFDDB25BFFDFB761FFE3BF67FFE8CA70FFCCB154FF8B67007A
        8B6700008B6700008B67007AD1B862FFEDD27AFFE7C66DFFE3BE68FFE1B864FF
        E0B561FFD3A64BFFD7B87CFFD0AD6AFFF1E7D5FFFFFFFFFFE7D6B5FFD2A54EFF
        DEB25CFFE0B561FFE1B864FFE3BE68FFE7C66DFFEDD27AFFD1B862FF8B67007A
        8B6700008C6700008C680068D2BD71F8F0DA86FFEBCE75FFE8C66FFFE5BF6AFF
        E3BB67FFDDB258FFD3AA59FFDCC28DFFF5EDE0FFFFFFFFFFF0E4CFFFD5AD5CFF
        E1B660FFE3BB67FFE5BF6AFFE8C66FFFEBCE75FFF0DA86FFD2BD71F88C680068
        8C6700008B6700008B670046CCB770E4F2E095FFEFD67EFFECCF77FFEAC872FF
        E8C36EFFE7C06AFFDFB459FFD7AE54FFDBBD7CFFE3CEA3FFD9BB7CFFD8AD50FF
        E5BE66FFE8C36EFFEAC872FFECCF77FFEFD67EFFF2E095FFCCB770E48B670046
        8B6700008665000083610015AF9544BDF0E2A9FFF4E08EFFF0D881FFEED27BFF
        ECCD76FFEBC872FFEAC670FFE7C169FFDEB557FFD8BA73FFE6D4ACFFDABD75FF
        DFBA5CFFECCC76FFEED27BFFF0D880FFF4E08EFFF0E2A9FFAF9544BD83610015
        8665000000000000FFFFFF009675156ED6C48AF8F9EBAFFFF4E18DFFF2DB85FF
        F1D681FFEFD27DFFEECF7AFFEDCD78FFE1BF66FFECDEBAFFFFFFFFFFF6EFDEFF
        DDBF63FFF0D680FFF2DB85FFF4E18CFFF9EBAFFFD6C48AF89675156EFFFFFF00
        000000000000000099781C00845C001AB2974AB6EEE3B6FFFAEDAFFFF6E492FF
        F5E08CFFF3DC89FFF2D986FFF2D883FFEACE75FFE3CE8CFFF6F1DEFFEFE4BEFF
        E5CD73FFF5E08CFFF6E492FFFAEDAFFFEEE3B6FFB2974AB6845C001A99781C00
        000000000000000083600000000000008D6B0554BCA65DEBF3EBC6FFFBF1BAFF
        F8E99DFFF7E593FFF6E391FFF6E290FFF5DF8CFFECD67DFFE5D078FFE9D47BFF
        F4E28CFFF8E99DFFFBF1BAFFF3EBC6FFBCA65DEB8D6B05540000000083600000
        000000000000000000000000866600007E5F000A9272116EBBA55DECEEE5C1FF
        FCF5CCFFFBF0B6FFFAEDA7FFF9EAA0FFF9E99AFFF9E99AFFF9EA9FFFFAEDA7FF
        FBF0B6FFFCF5CCFFEEE5C1FFBBA55DEC9272116E7E5F000A8666000000000000
        0000000000000000000000000000000084600000825D00098D690750B39B53B5
        D9CCA1F8F3ECCDFFFAF4D1FFFDF6CFFFFEF7CCFFFEF7CCFFFDF6CFFFFAF4D1FF
        F3ECCDFFDBCDA1F8B39C54B68C690750825D0009846000000000000000000000
        000000000000000000000000000000000000000062350000FFFF3D00845F0B1A
        96761970AB9146BACDBD8AE2D9CCA0F5DCCFA4FDDCCFA4FDD9CCA0F5CDBD8AE2
        AB9146BB97761972855F0B1BFFFB3B0062350000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        8F6900008260000F8A6600428C6800628C6700788C6700788C6800628A660042
        8260000F8F690000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        00000000F0000F00F0000F00F0000F00F0000F00E0000700C0000300C0000300
        C000030080000100800001008000010080000100800001008000010080000100
        80000100C0000300C0000300C0000300E0000700F0000F00FC003F00FF00FF00
        FFFFFF00}
      Transparent = True
      Caption = 
        'N'#227'o '#233' mais poss'#237'vel alterar o valor do desconto condicional por ' +
        'essa tela.'#13#10'Voc'#234' deve utilizar a tela de gerenciamento de descon' +
        'tos atrav'#233's do bot'#227'o descontos na planilha de recebimentos.'
      Titulo = 'Altera'#231#227'o de desconto condicional'
      PanelWidth = 100
      Position = poBottomLeft
    end
    object dbCodigoAluno: TDBEdit
      Left = 103
      Top = 36
      Width = 89
      Height = 22
      DataField = 'CodigoAluno'
      DataSource = DM.dtcMensalidades
      Font.Charset = ANSI_CHARSET
      Font.Color = clBlack
      Font.Height = -11
      Font.Name = 'Arial'
      Font.Style = []
      ParentFont = False
      TabOrder = 0
      OnKeyDown = dbCodigoAlunoKeyDown
      OnKeyPress = dbCodigoAlunoKeyPress
    end
    object dbParcelaInicial: TDBEdit
      Left = 103
      Top = 113
      Width = 77
      Height = 22
      DataField = 'Parcela'
      DataSource = DM.dtcMensalidades
      TabOrder = 3
      OnExit = dbParcelaInicialExit
      OnKeyDown = dbCodigoAlunoKeyDown
      OnKeyPress = dbCodigoAlunoKeyPress
    end
    object dbVencimento: TDBEdit
      Left = 103
      Top = 165
      Width = 89
      Height = 22
      DataField = 'DataVencimento'
      DataSource = DM.dtcMensalidades
      MaxLength = 10
      TabOrder = 5
      OnChange = dbVencimentoChange
      OnKeyDown = dbCodigoAlunoKeyDown
      OnKeyPress = dbCodigoAlunoKeyPress
    end
    object dbValorBruto: TDBEdit
      Left = 463
      Top = 112
      Width = 89
      Height = 22
      DataField = 'ValorBruto'
      DataSource = DM.dtcMensalidades
      TabOrder = 12
      OnEnter = dbValorBrutoEnter
      OnExit = dbValorBrutoExit
      OnKeyDown = dbCodigoAlunoKeyDown
      OnKeyPress = dbValorBrutoKeyPress
    end
    object dbValorDesconto: TDBEdit
      Left = 463
      Top = 140
      Width = 89
      Height = 22
      DataField = 'ValorDesconto'
      DataSource = DM.dtcMensalidades
      Enabled = False
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Arial'
      Font.Style = []
      ParentFont = False
      ReadOnly = True
      TabOrder = 13
    end
    object dbValorExtra: TDBEdit
      Left = 463
      Top = 165
      Width = 89
      Height = 22
      DataField = 'ValorExtra'
      DataSource = DM.dtcMensalidades
      TabOrder = 14
      OnEnter = dbValorExtraEnter
      OnKeyDown = dbCodigoAlunoKeyDown
      OnKeyPress = dbValorBrutoKeyPress
    end
    object dbTurma: TDBEdit
      Left = 103
      Top = 61
      Width = 89
      Height = 22
      DataField = 'Turma'
      DataSource = DM.dtcMensalidades
      TabOrder = 1
      OnKeyDown = dbCodigoAlunoKeyDown
      OnKeyPress = dbCodigoAlunoKeyPress
    end
    object dbAnoLetivo: TDBEdit
      Left = 103
      Top = 87
      Width = 89
      Height = 22
      DataField = 'AnoSemestre'
      DataSource = DM.dtcMensalidades
      MaxLength = 5
      TabOrder = 2
      OnKeyDown = dbCodigoAlunoKeyDown
      OnKeyPress = dbCodigoAlunoKeyPress
    end
    object dbPagamento: TDBEdit
      Left = 463
      Top = 243
      Width = 89
      Height = 22
      DataField = 'DataPagamento'
      DataSource = DM.dtcMensalidades
      Enabled = False
      MaxLength = 10
      TabOrder = 17
      OnKeyDown = dbCodigoAlunoKeyDown
      OnKeyPress = dbCodigoAlunoKeyPress
    end
    object dbValorJuros: TDBEdit
      Left = 463
      Top = 191
      Width = 89
      Height = 22
      DataField = 'ValorJuros'
      DataSource = DM.dtcMensalidades
      TabOrder = 15
      OnEnter = dbValorJurosEnter
      OnKeyDown = dbCodigoAlunoKeyDown
      OnKeyPress = dbValorBrutoKeyPress
    end
    object dbValorTotal: TDBEdit
      Left = 463
      Top = 217
      Width = 89
      Height = 22
      DataField = 'ValorTotalCalc'
      DataSource = DM.dtcMensalidades
      Enabled = False
      TabOrder = 16
      OnEnter = dbValorTotalEnter
      OnKeyDown = dbCodigoAlunoKeyDown
      OnKeyPress = dbValorBrutoKeyPress
    end
    object dbNossoNumero: TDBEdit
      Left = 463
      Top = 61
      Width = 89
      Height = 22
      TabStop = False
      DataField = 'NossoNumero'
      DataSource = DM.dtcMensalidades
      TabOrder = 10
      OnKeyPress = dbCodigoAlunoKeyPress
    end
    object edParcelaFinal: TEdit
      Left = 103
      Top = 139
      Width = 77
      Height = 22
      TabOrder = 4
      Text = '0'
      OnExit = edParcelaFinalExit
      OnKeyPress = dbCodigoAlunoKeyPress
    end
    object upDnParcelaInicial: TUpDown
      Left = 180
      Top = 112
      Width = 13
      Height = 25
      Min = -100
      Max = 32767
      TabOrder = 19
      OnClick = upDnParcelaInicialClick
    end
    object upDnParcelaFinal: TUpDown
      Left = 180
      Top = 138
      Width = 13
      Height = 25
      Min = -100
      Max = 32767
      TabOrder = 20
      OnClick = upDnParcelaFinalClick
    end
    object dbTipoTitulo: TDBLookupComboBox
      Left = 103
      Top = 217
      Width = 234
      Height = 22
      DataField = 'ds_tipo_titulo'
      DataSource = DM.dtcMensalidades
      TabOrder = 7
      OnKeyPress = dbCodigoAlunoKeyPress
    end
    object dbCompetencia: TDBEdit
      Left = 103
      Top = 191
      Width = 89
      Height = 22
      DataField = 'dt_competencia'
      DataSource = DM.dtcMensalidades
      MaxLength = 10
      TabOrder = 6
      OnChange = dbCompetenciaChange
      OnKeyDown = dbCodigoAlunoKeyDown
      OnKeyPress = dbCodigoAlunoKeyPress
    end
    object chkCompetencia: TCheckBox
      Left = 194
      Top = 190
      Width = 17
      Height = 17
      TabOrder = 21
      OnClick = chkCompetenciaClick
    end
    object dbPlanoContas: TDBLookupComboBox
      Left = 103
      Top = 243
      Width = 234
      Height = 22
      DataField = 'cd_plano_conta'
      DataSource = DM.dtcMensalidades
      KeyField = 'cd_conta'
      ListField = 'ds_conta'
      ListSource = dsPlanoContas
      TabOrder = 8
      OnKeyPress = dbCodigoAlunoKeyPress
    end
    object dbCentroCusto: TDBLookupComboBox
      Left = 103
      Top = 269
      Width = 234
      Height = 22
      DataField = 'cd_centro_custo'
      DataSource = DM.dtcMensalidades
      KeyField = 'cd_centro'
      ListField = 'ds_centro'
      ListSource = dsCentroCustos
      TabOrder = 9
      OnKeyPress = dbCodigoAlunoKeyPress
    end
    object dbHistorico: TDBEdit
      Left = 463
      Top = 87
      Width = 144
      Height = 22
      DataField = 'ds_historico'
      DataSource = DM.dtcMensalidades
      TabOrder = 11
      OnKeyDown = dbCodigoAlunoKeyDown
      OnKeyPress = dbCodigoAlunoKeyPress
    end
    object dbCreditos: TDBCheckBox
      Left = 463
      Top = 271
      Width = 97
      Height = 17
      DataField = 'sn_credito_parcela'
      DataSource = DM.dtcMensalidades
      TabOrder = 18
      ValueChecked = 'S'
      ValueUnchecked = 'N'
    end
    object chkApenasDiasUteis: TCheckBox
      Left = 194
      Top = 168
      Width = 143
      Height = 17
      Caption = 'Considerar Dia '#218'til'
      TabOrder = 22
    end
    object ckb_recalcular_descontos_vlr_bruto: TCheckBox
      Left = 103
      Top = 297
      Width = 234
      Height = 33
      Caption = 
        'Recalcular todos os descontos j'#225' aplicados, proporcionalmente ao' +
        ' novo valor bruto'
      Enabled = False
      TabOrder = 23
      WordWrap = True
    end
  end
  object DBLookupComboBox1: TDBLookupComboBox
    Left = 120
    Top = 8
    Width = 380
    Height = 22
    DataField = 'descPlano'
    DataSource = DataSource1
    DropDownWidth = 400
    NullValueKey = 46
    TabOrder = 3
    TabStop = False
  end
  object DBLookupComboBox2: TDBLookupComboBox
    Left = 120
    Top = 32
    Width = 380
    Height = 22
    DataField = 'descDesconto'
    DataSource = DataSource1
    NullValueKey = 46
    TabOrder = 4
    TabStop = False
  end
  object btnConfirmar: TBitBtn
    Left = 482
    Top = 420
    Width = 107
    Height = 25
    Caption = 'Confirmar'
    TabOrder = 1
    OnClick = btnConfirmarClick
    Glyph.Data = {
      F2010000424DF201000000000000760000002800000024000000130000000100
      0400000000007C01000000000000000000001000000000000000000000000000
      80000080000000808000800000008000800080800000C0C0C000808080000000
      FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333334433333
      3333333333388F3333333333000033334224333333333333338338F333333333
      0000333422224333333333333833338F33333333000033422222243333333333
      83333338F3333333000034222A22224333333338F33F33338F33333300003222
      A2A2224333333338F383F3338F33333300003A2A222A222433333338F8333F33
      38F33333000034A22222A22243333338833333F3338F333300004222A2222A22
      2433338F338F333F3338F3330000222A3A2224A22243338F3838F338F3338F33
      0000A2A333A2224A2224338F83338F338F3338F300003A33333A2224A2224338
      333338F338F3338F000033333333A2224A2243333333338F338F338F00003333
      33333A2224A2233333333338F338F83300003333333333A2224A333333333333
      8F338F33000033333333333A222433333333333338F338F30000333333333333
      A224333333333333338F38F300003333333333333A223333333333333338F8F3
      000033333333333333A3333333333333333383330000}
    NumGlyphs = 2
  end
  object btnCancelar: TBitBtn
    Left = 393
    Top = 420
    Width = 83
    Height = 25
    Cancel = True
    Caption = 'Cancelar'
    TabOrder = 2
    OnClick = btnCancelarClick
    Glyph.Data = {
      DE010000424DDE01000000000000760000002800000024000000120000000100
      0400000000006801000000000000000000001000000000000000000000000000
      80000080000000808000800000008000800080800000C0C0C000808080000000
      FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333333333333
      333333333333333333333333000033338833333333333333333F333333333333
      0000333911833333983333333388F333333F3333000033391118333911833333
      38F38F333F88F33300003339111183911118333338F338F3F8338F3300003333
      911118111118333338F3338F833338F3000033333911111111833333338F3338
      3333F8330000333333911111183333333338F333333F83330000333333311111
      8333333333338F3333383333000033333339111183333333333338F333833333
      00003333339111118333333333333833338F3333000033333911181118333333
      33338333338F333300003333911183911183333333383338F338F33300003333
      9118333911183333338F33838F338F33000033333913333391113333338FF833
      38F338F300003333333333333919333333388333338FFF830000333333333333
      3333333333333333333888330000333333333333333333333333333333333333
      0000}
    NumGlyphs = 2
  end
  object tblMatriculas: TUMZQuery
    Connection = DM.db
    SQL.Strings = (
      
        'select codigoaluno, turma, anosemestre, planopagamento, planodes' +
        'conto from matriculas where codigoaluno = :codigoaluno '
      'and turma = :turma and anosemestre = :anosemestre')
    Params = <
      item
        DataType = ftInteger
        Name = 'codigoaluno'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'turma'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'anosemestre'
        ParamType = ptUnknown
      end>
    Left = 424
    Top = 64
    ParamData = <
      item
        DataType = ftInteger
        Name = 'codigoaluno'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'turma'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'anosemestre'
        ParamType = ptUnknown
      end>
    object tblMatriculasturma: TStringField
      FieldName = 'turma'
      Origin = 'WMESTRE12.matriculas.turma'
      Size = 50
    end
    object tblMatriculasdescPlano: TStringField
      FieldKind = fkLookup
      FieldName = 'descPlano'
      LookupDataSet = tblPlanos
      LookupKeyFields = 'CD_PLANO'
      LookupResultField = 'desc_completa'
      KeyFields = 'planopagamento'
      Size = 50
      Lookup = True
    end
    object tblMatriculasdescDesconto: TStringField
      FieldKind = fkLookup
      FieldName = 'descDesconto'
      LookupDataSet = tblDescontos
      LookupKeyFields = 'codigo'
      LookupResultField = 'descricaoplano'
      KeyFields = 'planodesconto'
      Size = 50
      Lookup = True
    end
    object tblMatriculascodigoaluno: TIntegerField
      FieldName = 'codigoaluno'
      Required = True
    end
    object tblMatriculasanosemestre: TSmallintField
      FieldName = 'anosemestre'
      Required = True
    end
    object tblMatriculasplanopagamento: TIntegerField
      FieldName = 'planopagamento'
    end
    object tblMatriculasplanodesconto: TIntegerField
      FieldName = 'planodesconto'
    end
  end
  object tblPlanos: TUMZQuery
    Connection = DM.db
    OnCalcFields = tblPlanosCalcFields
    SQL.Strings = (
      'SELECT DISTINCT'
      #9'fp.CD_PLANO,'
      #9'fp.CD_COLIGADA,'
      #9'fp.DS_PLANO,'
      #9'fp.NR_ANOSEMESTRE,'
      #9'fp.VL_CONTRATO,'
      #9'fp.VL_DESCONTO,'
      #9'fp.VL_MATRICULA,'
      '  fp.VL_COBRADO'
      'FROM'
      #9'fin_planos_turmas fpt '
      'INNER JOIN matriculas m ON ('
      #9'm.codigoaluno = :codigoaluno'
      #9'AND m.anosemestre = :anosemestre'
      #9'AND m.turma = :turma'
      ')'
      'INNER'#9'JOIN fin_planos fp ON'
      '('
      #9'fpt.CD_PLANO = fp.CD_PLANO '
      #9'OR m.planopagamento = fp.CD_PLANO'
      ')'
      'WHERE'
      #9'fp.NR_ANOSEMESTRE = :anosemestre'
      #9'AND fp.CD_COLIGADA = :cd_coligada'
      #9'AND fpt.cd_turma = :turma;')
    Params = <
      item
        DataType = ftInteger
        Name = 'codigoaluno'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'anosemestre'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'turma'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'cd_coligada'
        ParamType = ptUnknown
      end>
    Left = 360
    Top = 65
    ParamData = <
      item
        DataType = ftInteger
        Name = 'codigoaluno'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'anosemestre'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'turma'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'cd_coligada'
        ParamType = ptUnknown
      end>
    object tblPlanosCD_PLANO: TIntegerField
      FieldName = 'CD_PLANO'
      Required = True
    end
    object tblPlanosCD_COLIGADA: TIntegerField
      FieldName = 'CD_COLIGADA'
      Required = True
    end
    object tblPlanosDS_PLANO: TStringField
      FieldName = 'DS_PLANO'
      Size = 50
    end
    object tblPlanosNR_ANOSEMESTRE: TSmallintField
      FieldName = 'NR_ANOSEMESTRE'
    end
    object tblPlanosVL_CONTRATO: TFloatField
      FieldName = 'VL_CONTRATO'
    end
    object tblPlanosVL_DESCONTO: TFloatField
      FieldName = 'VL_DESCONTO'
    end
    object tblPlanosVL_MATRICULA: TFloatField
      FieldName = 'VL_MATRICULA'
    end
    object tblPlanosdesc_completa: TStringField
      FieldKind = fkCalculated
      FieldName = 'desc_completa'
      Size = 100
      Calculated = True
    end
    object tblPlanosplanoMatricula: TIntegerField
      FieldKind = fkCalculated
      FieldName = 'planoMatricula'
      Calculated = True
    end
    object tblPlanosVL_COBRADO: TFloatField
      FieldName = 'VL_COBRADO'
    end
  end
  object tblDescontos: TUMZQuery
    Connection = DM.db
    SortedFields = 'DESCRICAOPLANO'
    SQL.Strings = (
      'SELECT'
      '  CODIGO,'
      '  DESCRICAOPLANO,'
      '  PERCENTUALDESCONTO,'
      '  VALORDESCONTO,'
      '  SN_CONDICIONAL'
      'FROM'
      '  PLANOSDESCONTO')
    Params = <>
    IndexFieldNames = 'DESCRICAOPLANO Asc'
    Left = 392
    Top = 64
    object tblDescontosCODIGO: TIntegerField
      FieldName = 'CODIGO'
    end
    object tblDescontosDESCRICAOPLANO: TStringField
      FieldName = 'DESCRICAOPLANO'
      Size = 255
    end
    object tblDescontosPERCENTUALDESCONTO: TFloatField
      FieldName = 'PERCENTUALDESCONTO'
    end
    object tblDescontosVALORDESCONTO: TFloatField
      FieldName = 'VALORDESCONTO'
    end
    object tblDescontosSN_CONDICIONAL: TSmallintField
      FieldName = 'SN_CONDICIONAL'
    end
  end
  object DataSource1: TDataSource
    DataSet = tblMatriculas
    Left = 424
    Top = 96
  end
  object qyAux: TUMZQuery
    Connection = DM.db
    Params = <>
    Left = 528
    Top = 72
  end
  object qyPlanoContas: TUMZQuery
    Connection = DM.db
    SQL.Strings = (
      'SELECT cd_conta, ds_conta FROM fin_plano_contas '
      
        'WHERE tp_conta = 1 AND tp_entrada_saida in (1,0) AND sn_ativo = ' +
        '1 '
      'AND cd_coligada = :cd_coligada '
      'ORDER BY ds_conta')
    Params = <
      item
        DataType = ftInteger
        Name = 'cd_coligada'
        ParamType = ptUnknown
      end>
    Left = 496
    Top = 64
    ParamData = <
      item
        DataType = ftInteger
        Name = 'cd_coligada'
        ParamType = ptUnknown
      end>
    object qyPlanoContasds_conta: TStringField
      FieldName = 'ds_conta'
      Origin = 'WMESTRE12.fin_plano_contas.ds_conta'
      Size = 255
    end
    object qyPlanoContascd_conta: TLargeintField
      FieldName = 'cd_conta'
      Required = True
    end
  end
  object qyCentroCustos: TUMZQuery
    Connection = DM.db
    SQL.Strings = (
      'SELECT cd_centro, ds_centro from fin_centro_custos  '
      'WHERE  tp_centro = 1 AND sn_ativo = 1 AND '
      'cd_coligada = :cd_coligada ORDER BY ds_centro')
    Params = <
      item
        DataType = ftInteger
        Name = 'cd_coligada'
        ParamType = ptUnknown
      end>
    Left = 496
    Top = 96
    ParamData = <
      item
        DataType = ftInteger
        Name = 'cd_coligada'
        ParamType = ptUnknown
      end>
    object qyCentroCustosds_centro: TStringField
      FieldName = 'ds_centro'
      Origin = 'WMESTRE12.fin_centro_custos.ds_centro'
      Size = 255
    end
    object qyCentroCustoscd_centro: TLargeintField
      FieldName = 'cd_centro'
      Required = True
    end
  end
  object dsPlanoContas: TDataSource
    AutoEdit = False
    DataSet = qyPlanoContas
    Left = 496
    Top = 128
  end
  object dsCentroCustos: TDataSource
    AutoEdit = False
    DataSet = qyCentroCustos
    Left = 496
    Top = 168
  end
end
