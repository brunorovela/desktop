object frm_mensa_gerar: Tfrm_mensa_gerar
  Left = 0
  Top = 0
  BorderStyle = bsDialog
  Caption = 'Gera'#231#227'o de T'#237'tulos a Receber'
  ClientHeight = 531
  ClientWidth = 582
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Position = poDesigned
  OnClose = FormClose
  OnCreate = FormCreate
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object Panel3: TPanel
    Left = 0
    Top = 0
    Width = 582
    Height = 22
    Align = alTop
    BevelOuter = bvLowered
    Caption = 'GERA'#199#195'O DE T'#205'TULOS A RECEBER'
    Color = clBlue
    Font.Charset = ANSI_CHARSET
    Font.Color = clWhite
    Font.Height = -13
    Font.Name = 'Arial'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 0
  end
  object btConfirmar: TBitBtn
    Left = 388
    Top = 498
    Width = 97
    Height = 25
    Caption = 'Confirmar'
    TabOrder = 3
    OnClick = btConfirmarClick
    Glyph.Data = {
      DE010000424DDE01000000000000760000002800000024000000120000000100
      0400000000006801000000000000000000001000000000000000000000000000
      80000080000000808000800000008000800080800000C0C0C000808080000000
      FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333333333333
      3333333333333333333333330000333333333333333333333333F33333333333
      00003333344333333333333333388F3333333333000033334224333333333333
      338338F3333333330000333422224333333333333833338F3333333300003342
      222224333333333383333338F3333333000034222A22224333333338F338F333
      8F33333300003222A3A2224333333338F3838F338F33333300003A2A333A2224
      33333338F83338F338F33333000033A33333A222433333338333338F338F3333
      0000333333333A222433333333333338F338F33300003333333333A222433333
      333333338F338F33000033333333333A222433333333333338F338F300003333
      33333333A222433333333333338F338F00003333333333333A22433333333333
      3338F38F000033333333333333A223333333333333338F830000333333333333
      333A333333333333333338330000333333333333333333333333333333333333
      0000}
    NumGlyphs = 2
  end
  object btCancelar: TBitBtn
    Left = 491
    Top = 502
    Width = 83
    Height = 25
    Cancel = True
    Caption = 'Fechar'
    ModalResult = 2
    TabOrder = 4
    OnClick = btCancelarClick
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
  object gbResponsavel: TGroupBox
    Left = 0
    Top = 63
    Width = 582
    Height = 119
    Align = alTop
    Caption = 'Gerar T'#237'tulos para:'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 1
    object btnCodigoAluno: TSpeedButton
      Left = 132
      Top = 45
      Width = 22
      Height = 21
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
      OnClick = btnCodigoAlunoClick
    end
    object btnCurso: TSpeedButton
      Left = 523
      Top = 45
      Width = 22
      Height = 21
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
      OnClick = btnCursoClick
    end
    object btnTurma: TSpeedButton
      Left = 374
      Top = 45
      Width = 22
      Height = 21
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
      OnClick = btnTurmaClick
    end
    object btnTurmaFixa: TSpeedButton
      Left = 523
      Top = 72
      Width = 22
      Height = 21
      Enabled = False
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
      OnClick = btnTurmaFixaClick
    end
    object Label2: TLabel
      Left = 11
      Top = 26
      Width = 89
      Height = 13
      Caption = 'C'#243'digo da Pessoa:'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
    end
    object Label3: TLabel
      Left = 253
      Top = 26
      Width = 33
      Height = 13
      Caption = 'Turma:'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
    end
    object Label4: TLabel
      Left = 402
      Top = 26
      Width = 30
      Height = 13
      Caption = 'Curso:'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
    end
    object Label5: TLabel
      Left = 160
      Top = 26
      Width = 71
      Height = 13
      Caption = 'Ano/Semestre:'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
    end
    object cbAlunosCursando: TCheckBox
      Left = 11
      Top = 97
      Width = 297
      Height = 17
      Caption = 'Considerar somente estudantes com situa'#231#227'o CURSANDO'
      Checked = True
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
      State = cbChecked
      TabOrder = 8
      OnKeyPress = cbResponsavelKeyPress
    end
    object cbFixarTurma: TCheckBox
      Left = 253
      Top = 74
      Width = 135
      Height = 17
      Caption = 'Fixar os t'#237'tulos na turma:'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
      TabOrder = 6
      OnClick = cbFixarTurmaClick
      OnKeyPress = cbResponsavelKeyPress
    end
    object cbResponsavel: TCheckBox
      Left = 12
      Top = 74
      Width = 199
      Height = 17
      Caption = 'Gerar um '#250'nico t'#237'tulo por respons'#225'vel'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
      TabOrder = 5
      OnClick = cbResponsavelClick
      OnKeyPress = cbResponsavelKeyPress
    end
    object txtAnoSemestre: TMaskEdit
      Left = 160
      Top = 45
      Width = 72
      Height = 22
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
      OnKeyPress = txtAnoSemestreKeyPress
    end
    object txtCodigoAluno: TEdit
      Left = 11
      Top = 45
      Width = 121
      Height = 21
      Enabled = False
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
      TabOrder = 0
      OnChange = txtCodigoAlunoChange
      OnKeyPress = txtCodigoAlunoKeyPress
    end
    object txtCurso: TEdit
      Left = 402
      Top = 45
      Width = 121
      Height = 21
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
      TabOrder = 4
      OnKeyPress = txtCursoKeyPress
    end
    object txtTurma: TEdit
      Left = 253
      Top = 45
      Width = 121
      Height = 21
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
      TabOrder = 3
      OnKeyPress = txtTurmaKeyPress
    end
    object txtTurmaFixa: TEdit
      Left = 402
      Top = 72
      Width = 121
      Height = 21
      Enabled = False
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
      TabOrder = 7
      OnKeyPress = txtTurmaKeyPress
    end
    object UpDownCursos: TUpDown
      Left = 232
      Top = 45
      Width = 15
      Height = 21
      Min = -100
      TabOrder = 2
      OnClick = UpDownCursosClick
    end
  end
  object gbInfosTitulo: TGroupBox
    AlignWithMargins = True
    Left = 0
    Top = 192
    Width = 582
    Height = 306
    Margins.Left = 0
    Margins.Top = 10
    Margins.Right = 0
    Margins.Bottom = 5
    Align = alTop
    Caption = 'Informa'#231#245'es do T'#237'tulo:'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 2
    object Label10: TLabel
      Left = 11
      Top = 76
      Width = 81
      Height = 13
      Caption = 'Centro de Custos'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
    end
    object Label7: TLabel
      Left = 280
      Top = 76
      Width = 90
      Height = 13
      Caption = 'Hist'#243'rico do T'#237'tulo:'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
    end
    object Label8: TLabel
      Left = 11
      Top = 29
      Width = 67
      Height = 13
      Caption = 'Tipo do T'#237'tulo'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
    end
    object Label9: TLabel
      Left = 280
      Top = 29
      Width = 78
      Height = 13
      Caption = 'Plano de Contas'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
    end
    object lbDataVencimento: TLabel
      Left = 180
      Top = 169
      Width = 85
      Height = 13
      Alignment = taRightJustify
      Caption = 'Data Vencimento:'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
    end
    object lbDescontoExtra: TLabel
      Left = 392
      Top = 123
      Width = 76
      Height = 13
      Alignment = taRightJustify
      Caption = 'Desconto Extra:'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
    end
    object lbParcelaFinal: TLabel
      Left = 98
      Top = 169
      Width = 64
      Height = 13
      Alignment = taRightJustify
      Caption = 'Parcela Final:'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
    end
    object lbParcelaInicial: TLabel
      Left = 11
      Top = 169
      Width = 69
      Height = 13
      Alignment = taRightJustify
      Caption = 'Parcela Inicial:'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
    end
    object lbValorBruto: TLabel
      Left = 11
      Top = 123
      Width = 55
      Height = 13
      Alignment = taRightJustify
      Caption = 'Valor Bruto:'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
    end
    object lbValorDesconto: TLabel
      Left = 265
      Top = 123
      Width = 107
      Height = 13
      Alignment = taRightJustify
      Caption = 'Valor Desconto em dia'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
    end
    object lbValorExtra: TLabel
      Left = 138
      Top = 123
      Width = 54
      Height = 13
      Alignment = taRightJustify
      Caption = 'Valor Extra:'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
    end
    object cbCentroCusto: TComboBox
      Left = 11
      Top = 95
      Width = 263
      Height = 22
      Style = csOwnerDrawFixed
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ItemHeight = 16
      ParentFont = False
      TabOrder = 2
      OnKeyPress = cbTipoTitulosKeyPress
    end
    object cbPlanoContas: TComboBox
      Left = 280
      Top = 48
      Width = 265
      Height = 22
      Style = csOwnerDrawFixed
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ItemHeight = 16
      ParentFont = False
      TabOrder = 1
      OnKeyPress = cbTipoTitulosKeyPress
    end
    object cbTipoTitulos: TComboBox
      Left = 11
      Top = 48
      Width = 263
      Height = 22
      Style = csOwnerDrawFixed
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ItemHeight = 16
      ParentFont = False
      TabOrder = 0
      OnChange = cbTipoTitulosChange
      OnKeyPress = cbTipoTitulosKeyPress
    end
    object ckCreditos: TCheckBox
      Left = 12
      Top = 261
      Width = 198
      Height = 17
      Caption = 'Ajustar conforme cr'#233'ditos acad'#234'micos'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
      TabOrder = 12
    end
    object ckNaoDuplicar: TCheckBox
      Left = 12
      Top = 284
      Width = 263
      Height = 17
      Caption = 'N'#227'o duplicar t'#237'tulos com mesmo n'#250'mero de parcela'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
      TabOrder = 13
    end
    object txtDataVencimento: TDateTimePicker
      Left = 180
      Top = 188
      Width = 116
      Height = 21
      Date = 38275.886499548610000000
      Time = 38275.886499548610000000
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
      TabOrder = 10
      OnKeyPress = txtDataVencimentoKeyPress
    end
    object txtDescontoExtra: TEdit
      Left = 392
      Top = 142
      Width = 121
      Height = 21
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
      TabOrder = 7
      OnExit = txtValorBrutoExit
      OnKeyPress = txtValorBrutoKeyPress
    end
    object txtHistorico: TEdit
      Left = 280
      Top = 95
      Width = 265
      Height = 21
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
      TabOrder = 3
    end
    object txtParcelaFinal: TEdit
      Left = 98
      Top = 188
      Width = 76
      Height = 21
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
      TabOrder = 9
      OnKeyPress = txtParcelaFinalKeyPress
    end
    object txtParcelaInicial: TEdit
      Left = 11
      Top = 188
      Width = 81
      Height = 21
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
      TabOrder = 8
      OnKeyPress = txtParcelaInicialKeyPress
    end
    object txtValorBruto: TEdit
      Left = 11
      Top = 142
      Width = 121
      Height = 21
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
      TabOrder = 4
      OnExit = txtValorBrutoExit
      OnKeyPress = txtValorBrutoKeyPress
    end
    object txtValorDesconto: TEdit
      Left = 265
      Top = 142
      Width = 121
      Height = 21
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
      TabOrder = 6
      OnExit = txtValorBrutoExit
      OnKeyPress = txtValorBrutoKeyPress
    end
    object txtValorExtra: TEdit
      Left = 138
      Top = 142
      Width = 121
      Height = 21
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
      TabOrder = 5
      OnExit = txtValorBrutoExit
      OnKeyPress = txtValorBrutoKeyPress
    end
    object rgVencto: TRadioGroup
      Left = 11
      Top = 215
      Width = 526
      Height = 40
      Caption = 'Op'#231#245'es de Vencimento'
      Columns = 3
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ItemIndex = 0
      Items.Strings = (
        'No dia selecionado'
        'Apenas em dias '#250'teis'
        'N'#227'o gerar em finais de semana')
      ParentFont = False
      TabOrder = 11
    end
  end
  object Panel1: TPanel
    Left = 0
    Top = 22
    Width = 582
    Height = 41
    Align = alTop
    BevelOuter = bvNone
    TabOrder = 5
    object Label31: TLabel
      Left = 9
      Top = 14
      Width = 112
      Height = 13
      Align = alCustom
      Caption = 'Unidade de Ensino:'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object cbUnidadeEnsino: TUMComboBox
      Left = 127
      Top = 11
      Width = 350
      Height = 21
      Style = csDropDownList
      ItemHeight = 13
      TabOrder = 0
      OnSelect = cbUnidadeEnsinoSelect
      TamanhoMaximo = 0
    end
  end
  object qySelecao: TUMZQuery
    Connection = DM.db
    Params = <>
    Left = 472
    Top = 288
  end
  object qyInsert: TUMZQuery
    Connection = DM.db
    SQL.Strings = (
      'insert into Mensalidades '
      
        '(CodigoAluno, Parcela, DataVencimento, dt_competencia, Turma, Da' +
        'taEmissao, NossoNumero, '
      
        'ValorBruto, ValorDesconto, DescontoExtra, ValorExtra, ValorTotal' +
        ', ValorJuros, Situacao, Usuario, Bloqueto, '
      
        'AnoSemestre,  Curso, Depto, TipoParcela, sn_credito_parcela, cd_' +
        'mensalidade_origem, ds_historico, cd_plano_conta, cd_centro_cust' +
        'o, cd_tipo_titulo, cd_resp, cd_caixa)'
      'VALUES'
      
        '(:CodigoAluno, :Parcela, :DataVencimento, :dt_competencia, :Turm' +
        'a, :DataEmissao, '
      
        ':NossoNumero, :ValorBruto, :ValorDesconto, :DescontoExtra, :Valo' +
        'rExtra, '
      
        ':ValorTotal, :ValorJuros, :Situacao, :Usuario, :Bloqueto, :AnoSe' +
        'mestre, :Curso, '
      
        ':Depto, :Tipo, :sn_credito_parcela, :cd_mensalidade_origem, :His' +
        'torico, :cd_plano_conta, :cd_centro_custo, :cd_tipo_titulo, :cd_' +
        'resp, :cd_caixa)')
    Params = <
      item
        DataType = ftInteger
        Name = 'CodigoAluno'
        ParamType = ptUnknown
      end
      item
        DataType = ftSmallint
        Name = 'Parcela'
        ParamType = ptUnknown
      end
      item
        DataType = ftDateTime
        Name = 'DataVencimento'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'dt_competencia'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'Turma'
        ParamType = ptUnknown
      end
      item
        DataType = ftDateTime
        Name = 'DataEmissao'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'NossoNumero'
        ParamType = ptUnknown
      end
      item
        DataType = ftFloat
        Name = 'ValorBruto'
        ParamType = ptUnknown
      end
      item
        DataType = ftFloat
        Name = 'ValorDesconto'
        ParamType = ptUnknown
      end
      item
        DataType = ftFloat
        Name = 'DescontoExtra'
        ParamType = ptUnknown
      end
      item
        DataType = ftFloat
        Name = 'ValorExtra'
        ParamType = ptUnknown
      end
      item
        DataType = ftFloat
        Name = 'ValorTotal'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'ValorJuros'
        ParamType = ptUnknown
      end
      item
        DataType = ftSmallint
        Name = 'Situacao'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'Usuario'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'Bloqueto'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'AnoSemestre'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'Curso'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'Depto'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'Tipo'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'sn_credito_parcela'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'cd_mensalidade_origem'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'Historico'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'cd_plano_conta'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'cd_centro_custo'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'cd_tipo_titulo'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'cd_resp'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'cd_caixa'
        ParamType = ptUnknown
      end>
    Left = 472
    Top = 320
    ParamData = <
      item
        DataType = ftInteger
        Name = 'CodigoAluno'
        ParamType = ptUnknown
      end
      item
        DataType = ftSmallint
        Name = 'Parcela'
        ParamType = ptUnknown
      end
      item
        DataType = ftDateTime
        Name = 'DataVencimento'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'dt_competencia'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'Turma'
        ParamType = ptUnknown
      end
      item
        DataType = ftDateTime
        Name = 'DataEmissao'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'NossoNumero'
        ParamType = ptUnknown
      end
      item
        DataType = ftFloat
        Name = 'ValorBruto'
        ParamType = ptUnknown
      end
      item
        DataType = ftFloat
        Name = 'ValorDesconto'
        ParamType = ptUnknown
      end
      item
        DataType = ftFloat
        Name = 'DescontoExtra'
        ParamType = ptUnknown
      end
      item
        DataType = ftFloat
        Name = 'ValorExtra'
        ParamType = ptUnknown
      end
      item
        DataType = ftFloat
        Name = 'ValorTotal'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'ValorJuros'
        ParamType = ptUnknown
      end
      item
        DataType = ftSmallint
        Name = 'Situacao'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'Usuario'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'Bloqueto'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'AnoSemestre'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'Curso'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'Depto'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'Tipo'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'sn_credito_parcela'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'cd_mensalidade_origem'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'Historico'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'cd_plano_conta'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'cd_centro_custo'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'cd_tipo_titulo'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'cd_resp'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'cd_caixa'
        ParamType = ptUnknown
      end>
  end
  object qyAux: TUMZQuery
    Connection = DM.db
    Params = <>
    Left = 472
    Top = 352
  end
end
