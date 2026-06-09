object frm_mensa_alterar: Tfrm_mensa_alterar
  Left = 251
  Top = 174
  BorderStyle = bsDialog
  Caption = 'Alterar T'#237'tulos'
  ClientHeight = 409
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
    Height = 297
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
      TabOrder = 13
      OnEnter = dbValorDescontoEnter
      OnKeyDown = dbCodigoAlunoKeyDown
      OnKeyPress = dbValorBrutoKeyPress
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
    Left = 509
    Top = 380
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
    Left = 419
    Top = 380
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
    Top = 64
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
    SQL.Strings = (
      'select * from planosdesconto'
      'order by descricaoplano')
    Params = <>
    Left = 392
    Top = 64
    object tblDescontosdescricaoplano: TStringField
      FieldName = 'descricaoplano'
      Origin = 'WMESTRE12.planosdesconto.descricaoplano'
      Size = 40
    end
    object tblDescontospercentualdesconto: TFloatField
      FieldName = 'percentualdesconto'
      Origin = 'WMESTRE12.planosdesconto.percentualdesconto'
    end
    object tblDescontosvalordesconto: TFloatField
      FieldName = 'valordesconto'
      Origin = 'WMESTRE12.planosdesconto.valordesconto'
    end
    object tblDescontoscodigo: TIntegerField
      FieldName = 'codigo'
    end
  end
  object DataSource1: TDataSource
    DataSet = tblMatriculas
    Left = 208
    Top = 224
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
