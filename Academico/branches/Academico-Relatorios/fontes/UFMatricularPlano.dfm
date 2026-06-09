object fMatricularPlano: TfMatricularPlano
  Left = 0
  Top = 0
  Width = 806
  Height = 417
  TabOrder = 0
  TabStop = True
  object bvlSep1: TBevel
    Left = 0
    Top = 191
    Width = 806
    Height = 3
    Align = alTop
    Shape = bsTopLine
    ExplicitTop = 399
    ExplicitWidth = 998
  end
  object pnlOpcoes: TPanel
    Left = 0
    Top = 0
    Width = 806
    Height = 191
    Align = alTop
    BevelOuter = bvNone
    TabOrder = 0
    object lblPlanoPgto: TLabel
      Left = 0
      Top = 0
      Width = 98
      Height = 13
      Caption = 'Plano de pagamento'
    end
    object sbRestaurar: TSpeedButton
      Left = 437
      Top = 16
      Width = 23
      Height = 21
      Hint = 'Desfazer todas as altera'#231#245'es'
      Flat = True
      Glyph.Data = {
        36030000424D3603000000000000360000002800000010000000100000000100
        18000000000000030000120B0000120B00000000000000000000FFFFFFF1F1F1
        ECECECE8E8E8E5E5E5E5E5E5E5E5E5E5E5E5E5E5E5E5E5E5E5E5E5E5E5E5E5E5
        E5E5E5E5E9E9E9F7F7F7FFFFFFE3E3E3A5825EAD7135AD7135AD7135AD7135AD
        7135AD7135AD7135AD7237B4804BB89674C5BEB7D4D4D4EFEFEFFFFFFFFFFFFF
        B07437FFC02BFFB812FFB811FFB70FFFB70EFFB60CFFB60BFEB40AF2AB12D593
        22BA8143DCCEBFFFFFFFFFFFFFFFFFFFB4783AFFCD50FFC332FFC12CFFBF26FF
        BC1EFFBA18FFB812FFB70EFFB406FFB303ECA619BD8546F3EAE0FFFFFFFFFFFF
        CA9D6EB97D3DB97D3DB97D3DB97D3DB97D3DB97D3DB97D3DBF823BD69730FBB4
        10FFB304DB992AD4AE87FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFF6EEE6D3AA7FD89A36FCB20CF1AE1FC6915AFFFFFFFFFFFF
        FFFFFFFFFFFFE4C9ACD3A674FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF7EFE6C78B
        45F3B126F3B127C48847FFFFFFFFFFFFFFFFFFE6CBADC88C49C88C49FFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFF8F0E7CB904BE8AC39E9AD3AC88D4BFFFFFFFFFFFF
        E9CEB0CD924EEABD73CD924EFFFFFFFFFFFFFFFFFFFFFFFFF9F1E8DDB587D9A2
        57DB9E3EE0A850D4A065FFFFFFECD1B1D49852F5C77BF5C77BD49852D49852D4
        9852D49852D49852D69C55DDA960DDA85AD99F50DFAA5FE4BF94F1DCC3D99D56
        F7CB7FEFB468F3BF73F6CA7EF6C97DF6C87CF6C87CF6C77BF5C478F1BB6FF1B8
        6CF0BF74DEA765F9F0E5F3DEC5DEA25AFFE498F4BE72F6C77BF8CF83F8CF83F8
        CE82F8CE82F8CD81F8CD81F5C97EEDBB71E2AC68F4E1CAFFFFFFFFFFFFF2D7B6
        E3A75DFFE599FDD78BE3A75DE3A75DE3A75DE3A75DE3A75DE3A85FE7B272EEC9
        9BFAF1E6FFFFFFFFFFFFFFFFFFFFFFFFF4D9B8E7AB61FFE599E7AB61FFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFF6DBB9EBAF64EBAF64FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF7DCBAF2C58CFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF}
      OnClick = sbRestaurarClick
    end
    object sbDividirTitulos: TSpeedButton
      Left = 619
      Top = 87
      Width = 159
      Height = 22
      Caption = 'Alterar quantidade de parcelas'
      Flat = True
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = []
      Margin = 5
      ParentFont = False
      OnClick = sbDividirTitulosClick
    end
    object sbDividirResp: TSpeedButton
      Left = 619
      Top = 112
      Width = 159
      Height = 22
      Caption = 'Dividir t'#237'tulos'
      Flat = True
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = []
      Margin = 5
      ParentFont = False
      OnClick = sbDividirRespClick
    end
    object sbPlanoDesconto: TSpeedButton
      Left = 619
      Top = 62
      Width = 159
      Height = 22
      Caption = 'Plano de desconto'
      Flat = True
      Margin = 5
      OnClick = sbPlanoDescontoClick
    end
    object lblDescontoProg: TLabel
      Left = 521
      Top = 16
      Width = 257
      Height = 13
      Caption = 'Este aluno possui desconto(s) programado(s)'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
      Visible = False
    end
    object imgPlanoDesconto: TImage
      Left = 600
      Top = 65
      Width = 16
      Height = 16
      AutoSize = True
      Center = True
      Picture.Data = {
        07544269746D617036030000424D360300000000000036000000280000001000
        000010000000010018000000000000030000120B0000120B0000000000000000
        0000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF36823C337C39FFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF3F8D
        4653A25B4E9E56327C38FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFF4899505AAB6376CA8173C87D509F58337D39FFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF50A55962B46C7DCE
        887ACC8675CA8075C98051A159347E3AFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFF58AF626ABC7583D28F79C9845FB16962B36C77C98277CB8152A25B
        357F3BFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF6BBC7578C9857FCE8C52A6
        5BFCFDFCF0F7F15BAC667BCC8578CB8453A35C36813CFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFF6BBC746CBF78FCFEFDFFFFFFFFFFFFEDF5EE5DAD677CCD88
        7BCD8655A45E37813DFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFEFEFEFFFF
        FFFFFFFFFFFFFFFFFFFFEDF5EE5EAE687ECE897DCE8856A55F38823EFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFEDF6EE
        5FAF6980CF8C7ECF8A57A66038843FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFEEF6EF61B16B81D18E79C88456A55FFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFEEF6EF62B26C5EAE68F6FAF7FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFEFF7F0F6FAF7FFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFF}
      Transparent = True
      Visible = False
    end
    object imgNumParcelas: TImage
      Left = 600
      Top = 90
      Width = 16
      Height = 16
      AutoSize = True
      Center = True
      Picture.Data = {
        07544269746D617036030000424D360300000000000036000000280000001000
        000010000000010018000000000000030000120B0000120B0000000000000000
        0000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF36823C337C39FFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF3F8D
        4653A25B4E9E56327C38FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFF4899505AAB6376CA8173C87D509F58337D39FFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF50A55962B46C7DCE
        887ACC8675CA8075C98051A159347E3AFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFF58AF626ABC7583D28F79C9845FB16962B36C77C98277CB8152A25B
        357F3BFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF6BBC7578C9857FCE8C52A6
        5BFCFDFCF0F7F15BAC667BCC8578CB8453A35C36813CFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFF6BBC746CBF78FCFEFDFFFFFFFFFFFFEDF5EE5DAD677CCD88
        7BCD8655A45E37813DFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFEFEFEFFFF
        FFFFFFFFFFFFFFFFFFFFEDF5EE5EAE687ECE897DCE8856A55F38823EFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFEDF6EE
        5FAF6980CF8C7ECF8A57A66038843FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFEEF6EF61B16B81D18E79C88456A55FFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFEEF6EF62B26C5EAE68F6FAF7FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFEFF7F0F6FAF7FFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFF}
      Transparent = True
      Visible = False
    end
    object imgDivisao: TImage
      Left = 600
      Top = 115
      Width = 16
      Height = 16
      AutoSize = True
      Center = True
      Picture.Data = {
        07544269746D617036030000424D360300000000000036000000280000001000
        000010000000010018000000000000030000120B0000120B0000000000000000
        0000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF36823C337C39FFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF3F8D
        4653A25B4E9E56327C38FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFF4899505AAB6376CA8173C87D509F58337D39FFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF50A55962B46C7DCE
        887ACC8675CA8075C98051A159347E3AFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFF58AF626ABC7583D28F79C9845FB16962B36C77C98277CB8152A25B
        357F3BFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF6BBC7578C9857FCE8C52A6
        5BFCFDFCF0F7F15BAC667BCC8578CB8453A35C36813CFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFF6BBC746CBF78FCFEFDFFFFFFFFFFFFEDF5EE5DAD677CCD88
        7BCD8655A45E37813DFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFEFEFEFFFF
        FFFFFFFFFFFFFFFFFFFFEDF5EE5EAE687ECE897DCE8856A55F38823EFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFEDF6EE
        5FAF6980CF8C7ECF8A57A66038843FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFEEF6EF61B16B81D18E79C88456A55FFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFEEF6EF62B26C5EAE68F6FAF7FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFEFF7F0F6FAF7FFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFF}
      Transparent = True
      Visible = False
    end
    object dblcPlanoPgto: TDBLookupComboBox
      Left = -3
      Top = 16
      Width = 434
      Height = 21
      KeyField = 'CD_PLANO'
      ListField = 'DS_PLANO'
      ListSource = dsPlanoPgto
      TabOrder = 0
      OnClick = dblcPlanoPgtoClick
    end
    object gbVencto: TGroupBox
      Left = 0
      Top = 43
      Width = 460
      Height = 145
      Caption = 'Op'#231#245'es de vencimento'
      TabOrder = 1
      object lblVenctoSempre: TLabel
        Left = 136
        Top = 74
        Width = 57
        Height = 13
        Caption = ', a partir de'
        Visible = False
      end
      object sbCalcVencto: TSpeedButton
        Left = 0
        Top = 120
        Width = 79
        Height = 22
        Hint = 'Calcular vencimentos'
        Caption = 'Aplicar '
        Enabled = False
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
        OnClick = sbCalcVenctoClick
      end
      object lblVenctoDiaUtil: TLabel
        Left = 126
        Top = 46
        Width = 133
        Height = 13
        Caption = #186' dia '#250'til do m'#234's, a partir de'
        Visible = False
      end
      object lblVenctoOpcs: TLabel
        Left = 269
        Top = 74
        Width = 187
        Height = 13
        Caption = '(exceto s'#225'bados, domingos e feriados)'
        Visible = False
      end
      object lbDiaVencEstudante: TLabel
        Left = 308
        Top = 100
        Width = 45
        Height = 13
        BiDiMode = bdLeftToRight
        Caption = '(Dia XX)'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ParentBiDiMode = False
        ParentFont = False
      end
      object rbVenctoPlano: TRadioButton
        Left = 3
        Top = 19
        Width = 243
        Height = 17
        Caption = 'Manter configura'#231#245'es do plano de pagamento'
        Checked = True
        TabOrder = 0
        TabStop = True
        OnClick = rbVenctoPlanoClick
      end
      object rbVenctoDiaUtil: TRadioButton
        Left = 3
        Top = 45
        Width = 72
        Height = 17
        Caption = 'Sempre no'
        TabOrder = 1
        OnClick = rbVenctoDiaUtilClick
      end
      object dtpVenctoDiaUtil: TDateTimePicker
        Left = 262
        Top = 43
        Width = 70
        Height = 22
        Date = 41065.414538032400000000
        Format = 'MM/yyyy'
        Time = 41065.414538032400000000
        DateMode = dmUpDown
        TabOrder = 3
        Visible = False
        OnChange = dtpVenctoDiaUtilChange
      end
      object cbDiaVencto: TComboBox
        Left = 95
        Top = 71
        Width = 38
        Height = 22
        Style = csOwnerDrawFixed
        ItemHeight = 16
        TabOrder = 4
        Visible = False
        OnSelect = cbDiaVenctoSelect
      end
      object rbVenctoSempre: TRadioButton
        Left = 3
        Top = 73
        Width = 89
        Height = 17
        Caption = 'Sempre no dia'
        TabOrder = 5
        OnClick = rbVenctoSempreClick
      end
      object dtpVenctoSempre: TDateTimePicker
        Left = 196
        Top = 71
        Width = 70
        Height = 22
        Date = 41065.414538032400000000
        Format = 'MM/yyyy'
        Time = 41065.414538032400000000
        DateMode = dmUpDown
        TabOrder = 6
        Visible = False
        OnChange = dtpVenctoSempreChange
      end
      object cbDiaUtil: TComboBox
        Left = 81
        Top = 42
        Width = 42
        Height = 22
        Style = csOwnerDrawFixed
        ItemHeight = 16
        ItemIndex = 0
        TabOrder = 2
        Text = '01'
        Visible = False
        OnSelect = cbDiaUtilSelect
        Items.Strings = (
          '01'
          '02'
          '03'
          '04'
          '05'
          '06'
          '07'
          '08'
          '09'
          '10'
          '11'
          '12'
          '13'
          '14'
          '15'
          '16'
          '17'
          '18'
          '19'
          '20'
          '21'
          '22'
          '23')
      end
      object rbVenctoEstudante: TRadioButton
        Left = 3
        Top = 99
        Width = 302
        Height = 17
        Caption = 'Utilizar dia de vencimento predefinido para este estudante.'
        TabOrder = 7
        OnClick = rbVenctoEstudanteClick
      end
    end
    object cbUtilizarDescProgramado: TCheckBox
      Left = 572
      Top = 35
      Width = 208
      Height = 13
      Caption = 'Utilizar o(s) desconto(s) programado(s)'
      Checked = True
      State = cbChecked
      TabOrder = 2
      Visible = False
      OnClick = cbUtilizarDescProgramadoClick
    end
  end
  object dbgParcelas: TDBGrid
    Left = 0
    Top = 194
    Width = 806
    Height = 223
    Align = alClient
    DataSource = dsParcelas
    TabOrder = 1
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'Tahoma'
    TitleFont.Style = []
    OnDrawColumnCell = dbgParcelasDrawColumnCell
    Columns = <
      item
        Expanded = False
        FieldName = 'DS_TIPO_TITULO'
        ReadOnly = True
        Title.Caption = 'Tipo de t'#237'tulo'
        Width = 158
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'NR_PARCELA'
        ReadOnly = True
        Title.Caption = 'Parcela'
        Width = 49
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'DT_VENCTO'
        ReadOnly = True
        Title.Caption = 'Vencimento'
        Width = 85
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'VL_BRUTO'
        ReadOnly = True
        Title.Caption = 'Valor bruto'
        Width = 62
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'VL_DESCONTO'
        ReadOnly = True
        Title.Caption = 'Desconto'
        Width = 62
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'VL_DESC_EXTRA'
        ReadOnly = True
        Title.Caption = 'Bolsa'
        Width = 62
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'VL_EXTRA'
        ReadOnly = True
        Title.Caption = 'Valor extra'
        Width = 60
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'VL_LIQUIDO'
        ReadOnly = True
        Title.Caption = 'Valor L'#237'quido'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'NM_RESPONSAVEL'
        ReadOnly = True
        Title.Caption = 'Respons'#225'vel'
        Width = 151
        Visible = True
      end>
  end
  object qryPlanoPgto: TUMZReadOnlyQuery
    Connection = DM.db
    SQL.Strings = (
      'SELECT'
      '   P.CD_PLANO,'
      '   P.CD_COLIGADA,'
      '   P.CD_TIPO_PLANO,'
      '   P.DS_PLANO,'
      '   P.NR_ANOSEMESTRE,'
      '   P.NR_PARCELAS,'
      '   P.VL_COBRADO,'
      '   P.VL_CONTRATO,'
      '   P.VL_TAXAMATERIAL,'
      '   P.VL_TAXAAPOSTILA,'
      '   P.VL_DESCONTO,'
      '   P.VL_MATRICULA,'
      '   P.DT_APARTIR,'
      '   P.NR_TAXASMATERIAL,'
      '   P.NR_DIAS_PARCELA_ZERO,'
      '   P.SN_DIAS_UTEIS,'
      '   P.SN_CREDITOS,'
      '   P.NR_CREDITOS_BASE,'
      '   P.NR_MAX_DISCIPLINAS,'
      '   P.DS_DIAS_VENCTO,'
      '   P.SN_PULAR_SABADOS,'
      '   P.SN_PULAR_DOMINGOS,'
      '   P.SN_PULAR_FERIADOS,'
      '   P.CD_ACAO_MOVIMENTO_DESC_COND,'
      '   P.CD_ACAO_MOVIMENTO_DESC_FIXO,'
      '   P.NR_TIPO_VENCTO,'
      '   P.NR_FORMULA_VENCTO,'
      '   P.NR_FORMULA_OPERADOR,'
      '   P.NR_FORMULA_DIAS   '
      'FROM'
      '   FIN_PLANOS P'
      '      JOIN FIN_PLANOS_TURMAS T ON'
      '         (P.CD_PLANO = T.CD_PLANO)'
      'WHERE'
      '   T.CD_TURMA = :CD_TURMA AND'
      '   T.CD_CURSO = :CD_CURSO AND'
      '   P.CD_COLIGADA = :CD_COLIGADA_MATRIZ AND'
      '   P.NR_ANOSEMESTRE = :NR_ANOSEMESTRE AND'
      '   ('
      '     ('
      '      P.SN_VIGENCIA = 1 AND'
      
        '      CURRENT_DATE BETWEEN DATE(P.DT_VIGENCIA_INICIO) AND DATE(P' +
        '.DT_VIGENCIA_FIM)'
      '     )'
      '     OR'
      '     P.SN_VIGENCIA = 0'
      '   )'
      'ORDER BY'
      '  P.DS_PLANO')
    Params = <
      item
        DataType = ftUnknown
        Name = 'CD_TURMA'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'CD_CURSO'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'CD_COLIGADA_MATRIZ'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'NR_ANOSEMESTRE'
        ParamType = ptUnknown
      end>
    DataSource = fMatricular.dsTurma
    Left = 24
    Top = 240
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'CD_TURMA'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'CD_CURSO'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'CD_COLIGADA_MATRIZ'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'NR_ANOSEMESTRE'
        ParamType = ptUnknown
      end>
    object qryPlanoPgtoCD_PLANO: TIntegerField
      FieldName = 'CD_PLANO'
      Required = True
    end
    object qryPlanoPgtoCD_COLIGADA: TIntegerField
      FieldName = 'CD_COLIGADA'
      Required = True
    end
    object qryPlanoPgtoCD_TIPO_PLANO: TIntegerField
      FieldName = 'CD_TIPO_PLANO'
      Required = True
    end
    object qryPlanoPgtoDS_PLANO: TStringField
      FieldName = 'DS_PLANO'
      Size = 50
    end
    object qryPlanoPgtoNR_ANOSEMESTRE: TSmallintField
      FieldName = 'NR_ANOSEMESTRE'
    end
    object qryPlanoPgtoNR_PARCELAS: TSmallintField
      FieldName = 'NR_PARCELAS'
    end
    object qryPlanoPgtoVL_COBRADO: TFloatField
      FieldName = 'VL_COBRADO'
    end
    object qryPlanoPgtoVL_CONTRATO: TFloatField
      FieldName = 'VL_CONTRATO'
    end
    object qryPlanoPgtoVL_TAXAMATERIAL: TFloatField
      FieldName = 'VL_TAXAMATERIAL'
    end
    object qryPlanoPgtoVL_TAXAAPOSTILA: TFloatField
      FieldName = 'VL_TAXAAPOSTILA'
    end
    object qryPlanoPgtoVL_DESCONTO: TFloatField
      FieldName = 'VL_DESCONTO'
    end
    object qryPlanoPgtoVL_MATRICULA: TFloatField
      FieldName = 'VL_MATRICULA'
    end
    object qryPlanoPgtoDT_APARTIR: TDateTimeField
      FieldName = 'DT_APARTIR'
    end
    object qryPlanoPgtoNR_TAXASMATERIAL: TSmallintField
      FieldName = 'NR_TAXASMATERIAL'
    end
    object qryPlanoPgtoNR_DIAS_PARCELA_ZERO: TSmallintField
      FieldName = 'NR_DIAS_PARCELA_ZERO'
    end
    object qryPlanoPgtoSN_DIAS_UTEIS: TSmallintField
      FieldName = 'SN_DIAS_UTEIS'
      Required = True
    end
    object qryPlanoPgtoSN_CREDITOS: TSmallintField
      FieldName = 'SN_CREDITOS'
      Required = True
    end
    object qryPlanoPgtoNR_CREDITOS_BASE: TFloatField
      FieldName = 'NR_CREDITOS_BASE'
      Required = True
    end
    object qryPlanoPgtoNR_MAX_DISCIPLINAS: TLargeintField
      FieldName = 'NR_MAX_DISCIPLINAS'
    end
    object qryPlanoPgtoDS_DIAS_VENCTO: TStringField
      FieldName = 'DS_DIAS_VENCTO'
      Required = True
      Size = 31
    end
    object qryPlanoPgtoSN_PULAR_SABADOS: TSmallintField
      FieldName = 'SN_PULAR_SABADOS'
      Required = True
    end
    object qryPlanoPgtoSN_PULAR_DOMINGOS: TSmallintField
      FieldName = 'SN_PULAR_DOMINGOS'
      Required = True
    end
    object qryPlanoPgtoSN_PULAR_FERIADOS: TSmallintField
      FieldName = 'SN_PULAR_FERIADOS'
      Required = True
    end
    object qryPlanoPgtocd_acao_movimento_desc_cond: TLargeintField
      FieldName = 'cd_acao_movimento_desc_cond'
    end
    object qryPlanoPgtocd_acao_movimento_desc_fixo: TLargeintField
      FieldName = 'cd_acao_movimento_desc_fixo'
    end
    object qryPlanoPgtoNR_TIPO_VENCTO: TSmallintField
      FieldName = 'NR_TIPO_VENCTO'
      Required = True
    end
    object qryPlanoPgtoNR_FORMULA_VENCTO: TSmallintField
      FieldName = 'NR_FORMULA_VENCTO'
    end
    object qryPlanoPgtoNR_FORMULA_OPERADOR: TSmallintField
      FieldName = 'NR_FORMULA_OPERADOR'
    end
    object qryPlanoPgtoNR_FORMULA_DIAS: TIntegerField
      FieldName = 'NR_FORMULA_DIAS'
    end
  end
  object dsPlanoPgto: TDataSource
    AutoEdit = False
    DataSet = qryPlanoPgto
    Left = 64
    Top = 240
  end
  object qryItensPlano: TUMZReadOnlyQuery
    Connection = DM.db
    SQL.Strings = (
      'SELECT'
      '   I.CD_PLANO_ITEM,'
      '   I.CD_PLANO,'
      '   I.NR_PARCELA,'
      '   I.VL_BRUTO,'
      '   I.VL_DESCONTO,'
      '   I.VL_EXTRA,'
      '   I.VL_DESCONTO_EXTRA,'
      '   I.VL_TOTAL,'
      '   I.NR_DIA,'
      '   I.NR_MES,'
      '   I.NR_ANO,'
      '   I.NR_CREDITOS_MINIMOS,'
      '   I.SN_CREDITO_PARCELA,'
      '   I.CD_TIPO_PARCELA,'
      '   I.SN_DIVISIVEL,'
      '   T.DS_TIPO_TITULO,'
      '   T.CD_CONTA,'
      '   T.SN_MANTER_NUMERO_PARCELA,'
      '   I.SN_BLOQUEADO,'
      '   I.NR_FORMULA_VENCTO,'
      '   I.NR_FORMULA_OPERADOR,'
      '   I.NR_FORMULA_DIAS'
      'FROM'
      '   FIN_PLANOS_ITENS I'
      '      JOIN FIN_CONFIG_TIPOS_TITULO T ON'
      '         (I.CD_TIPO_PARCELA = T.CD_TIPO_TITULO)'
      'WHERE'
      '   I.CD_PLANO = :CD_PLANO AND'
      '   T.CD_COLIGADA_MATRIZ = :CD_COLIGADA')
    Params = <
      item
        DataType = ftUnknown
        Name = 'CD_PLANO'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'CD_COLIGADA'
        ParamType = ptUnknown
      end>
    DataSource = dsPlanoPgto
    Left = 24
    Top = 280
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'CD_PLANO'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'CD_COLIGADA'
        ParamType = ptUnknown
      end>
    object qryItensPlanoCD_PLANO_ITEM: TIntegerField
      FieldName = 'CD_PLANO_ITEM'
      Required = True
    end
    object qryItensPlanoCD_PLANO: TIntegerField
      FieldName = 'CD_PLANO'
      Required = True
    end
    object qryItensPlanoNR_PARCELA: TSmallintField
      FieldName = 'NR_PARCELA'
      Required = True
    end
    object qryItensPlanoVL_BRUTO: TFloatField
      FieldName = 'VL_BRUTO'
    end
    object qryItensPlanoVL_DESCONTO: TFloatField
      FieldName = 'VL_DESCONTO'
    end
    object qryItensPlanoVL_EXTRA: TFloatField
      FieldName = 'VL_EXTRA'
    end
    object qryItensPlanoVL_DESCONTO_EXTRA: TFloatField
      FieldName = 'VL_DESCONTO_EXTRA'
    end
    object qryItensPlanoVL_TOTAL: TFloatField
      FieldName = 'VL_TOTAL'
    end
    object qryItensPlanoNR_DIA: TSmallintField
      FieldName = 'NR_DIA'
      Required = True
    end
    object qryItensPlanoNR_MES: TIntegerField
      FieldName = 'NR_MES'
      Required = True
    end
    object qryItensPlanoNR_ANO: TIntegerField
      FieldName = 'NR_ANO'
      Required = True
    end
    object qryItensPlanoNR_CREDITOS_MINIMOS: TFloatField
      FieldName = 'NR_CREDITOS_MINIMOS'
    end
    object qryItensPlanoSN_CREDITO_PARCELA: TSmallintField
      FieldName = 'SN_CREDITO_PARCELA'
      Required = True
    end
    object qryItensPlanoCD_TIPO_PARCELA: TIntegerField
      FieldName = 'CD_TIPO_PARCELA'
      Required = True
    end
    object qryItensPlanoSN_DIVISIVEL: TSmallintField
      FieldName = 'SN_DIVISIVEL'
      Required = True
    end
    object qryItensPlanoDS_TIPO_TITULO: TStringField
      FieldName = 'DS_TIPO_TITULO'
      Size = 255
    end
    object qryItensPlanoCD_CONTA: TLargeintField
      FieldName = 'CD_CONTA'
    end
    object qryItensPlanoSN_MANTER_NUMERO_PARCELA: TSmallintField
      FieldName = 'SN_MANTER_NUMERO_PARCELA'
    end
    object qryItensPlanoSN_BLOQUEADO: TSmallintField
      FieldName = 'SN_BLOQUEADO'
      Required = True
    end
    object qryItensPlanoNR_FORMULA_VENCTO: TSmallintField
      FieldName = 'NR_FORMULA_VENCTO'
    end
    object qryItensPlanoNR_FORMULA_OPERADOR: TSmallintField
      FieldName = 'NR_FORMULA_OPERADOR'
    end
    object qryItensPlanoNR_FORMULA_DIAS: TIntegerField
      FieldName = 'NR_FORMULA_DIAS'
    end
  end
  object cdsParcelas: TClientDataSet
    Active = True
    Aggregates = <>
    IndexFieldNames = 'NR_PARCELA'
    Params = <>
    OnCalcFields = cdsParcelasCalcFields
    Left = 24
    Top = 320
    Data = {
      020300009619E0BD01000000180000001B00000000000300000002030E43445F
      5449504F5F544954554C4F04000100000000000A4E525F50415243454C410400
      0100000000000B4E525F4352454449544F5308000400000000000944545F5645
      4E43544F040006000000000008564C5F425255544F0800040000000100075355
      42545950450200490006004D6F6E6579000B564C5F444553434F4E544F080004
      000000010007535542545950450200490006004D6F6E6579000D564C5F444553
      435F4558545241080004000000010007535542545950450200490006004D6F6E
      65790008564C5F45585452410800040000000100075355425459504502004900
      06004D6F6E6579000E43445F524553504F4E534156454C04000100000000000E
      4E4D5F524553504F4E534156454C010049000000010005574944544802000200
      40000C534E5F44495649534956454C02000300000000000D534E5F5245434942
      4F5F494D50020003000000000008534E5F474552415202000300000000000A53
      4E5F504552444F415202000300000000000843445F434F4E5441040001000000
      00000C5074724974656D506C616E6F04000100000000001143445F4143414F5F
      4D4F56494D454E544F08000100000000001343445F444553435F434F4E444943
      494F4E414C08000100000000000B534E5F444956494449444F02000300000000
      000A564C5F4352454449544F0800040000000100075355425459504502004900
      06004D6F6E6579000B4944585F50415243454C41040001000000000015564C5F
      50455243454E5455414C5F4449564953414F0800040000000100075355425459
      50450200490006004D6F6E65790018534E5F4D414E5445525F4E554D45524F5F
      50415243454C4102000300000000000E44535F5449504F5F544954554C4F0100
      4900000001000557494454480200020064000E4E525F5449504F5F56454E4354
      4F04000100000000001144535F464F524D554C415F56454E43544F0200490000
      00010005574944544802000200FF000C534E5F424C4F51554541444F02000300
      000000000000}
    object cdsParcelasCD_TIPO_TITULO: TIntegerField
      FieldName = 'CD_TIPO_TITULO'
    end
    object cdsParcelasNR_PARCELA: TIntegerField
      FieldName = 'NR_PARCELA'
    end
    object cdsParcelasNR_CREDITOS: TFloatField
      FieldName = 'NR_CREDITOS'
    end
    object cdsParcelasDT_VENCTO: TDateField
      FieldName = 'DT_VENCTO'
      OnSetText = cdsParcelasDT_VENCTOSetText
    end
    object cdsParcelasVL_BRUTO: TCurrencyField
      FieldName = 'VL_BRUTO'
      DisplayFormat = '###,###,##0.00'
    end
    object cdsParcelasVL_DESCONTO: TCurrencyField
      FieldName = 'VL_DESCONTO'
      DisplayFormat = '###,###,##0.00'
    end
    object cdsParcelasVL_DESC_EXTRA: TCurrencyField
      FieldName = 'VL_DESC_EXTRA'
      DisplayFormat = '###,###,##0.00'
    end
    object cdsParcelasVL_EXTRA: TCurrencyField
      FieldName = 'VL_EXTRA'
      DisplayFormat = '###,###,##0.00'
    end
    object cdsParcelasCD_RESPONSAVEL: TIntegerField
      FieldName = 'CD_RESPONSAVEL'
    end
    object cdsParcelasNM_RESPONSAVEL: TStringField
      FieldName = 'NM_RESPONSAVEL'
      Size = 64
    end
    object cdsParcelasSN_DIVISIVEL: TBooleanField
      FieldName = 'SN_DIVISIVEL'
    end
    object cdsParcelasSN_RECIBO_IMP: TBooleanField
      FieldName = 'SN_RECIBO_IMP'
    end
    object cdsParcelasSN_GERAR: TBooleanField
      FieldName = 'SN_GERAR'
    end
    object cdsParcelasSN_PERDOAR: TBooleanField
      FieldName = 'SN_PERDOAR'
    end
    object cdsParcelasCD_CONTA: TIntegerField
      FieldName = 'CD_CONTA'
    end
    object cdsParcelasPtrItemPlano: TIntegerField
      FieldName = 'PtrItemPlano'
    end
    object cdsParcelasCD_ACAO_MOVIMENTO: TLargeintField
      FieldName = 'CD_ACAO_MOVIMENTO'
    end
    object cdsParcelasCD_DESC_CONDICIONAL: TLargeintField
      FieldName = 'CD_DESC_CONDICIONAL'
    end
    object cdsParcelasVENC_ATUAL: TBooleanField
      FieldKind = fkCalculated
      FieldName = 'VENC_ATUAL'
      Calculated = True
    end
    object cdsParcelasSN_DIVIDIDO: TBooleanField
      FieldName = 'SN_DIVIDIDO'
    end
    object cdsParcelasVL_CREDITO: TCurrencyField
      FieldName = 'VL_CREDITO'
    end
    object cdsParcelasIDX_PARCELA: TIntegerField
      FieldName = 'IDX_PARCELA'
    end
    object cdsParcelasVL_PERCENTUAL_DIVISAO: TCurrencyField
      FieldName = 'VL_PERCENTUAL_DIVISAO'
    end
    object cdsParcelasVL_LIQUIDO: TCurrencyField
      FieldKind = fkCalculated
      FieldName = 'VL_LIQUIDO'
      DisplayFormat = '###,###,##0.00'
      Calculated = True
    end
    object cdsParcelasSN_MANTER_NUMERO_PARCELA: TBooleanField
      FieldName = 'SN_MANTER_NUMERO_PARCELA'
    end
    object cdsParcelasDS_TIPO_TITULO: TStringField
      DisplayWidth = 100
      FieldName = 'DS_TIPO_TITULO'
      Size = 100
    end
    object cdsParcelasNR_TIPO_VENCTO: TIntegerField
      FieldName = 'NR_TIPO_VENCTO'
    end
    object cdsParcelasDS_FORMULA_VENCTO: TStringField
      FieldName = 'DS_FORMULA_VENCTO'
      Size = 255
    end
    object cdsParcelasSN_BLOQUEADO: TBooleanField
      FieldName = 'SN_BLOQUEADO'
    end
  end
  object dsParcelas: TDataSource
    DataSet = cdsParcelas
    OnDataChange = dsParcelasDataChange
    Left = 64
    Top = 320
  end
  object qryResponsavel: TUMZReadOnlyQuery
    Connection = DM.db
    SQL.Strings = (
      'SELECT'
      '   P.CD_PESSOA,'
      '   P.NM_PESSOA,'
      '   P.CD_RESP_FINAN,'
      '   R.NM_PESSOA NM_RESP_FINAN'
      'FROM'
      '   PESSOAS P'
      '      LEFT JOIN PESSOAS R ON'
      '         (P.CD_RESP_FINAN = R.CD_PESSOA)'
      'WHERE'
      '   P.CD_PESSOA = :CD_PESSOA')
    Params = <
      item
        DataType = ftUnknown
        Name = 'CD_PESSOA'
        ParamType = ptUnknown
      end>
    DataSource = fMatricular.dsMatricula
    Left = 24
    Top = 360
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'CD_PESSOA'
        ParamType = ptUnknown
      end>
    object qryResponsavelCD_PESSOA: TIntegerField
      FieldName = 'CD_PESSOA'
      Required = True
    end
    object qryResponsavelNM_PESSOA: TStringField
      FieldName = 'NM_PESSOA'
      Size = 60
    end
    object qryResponsavelCD_RESP_FINAN: TIntegerField
      FieldName = 'CD_RESP_FINAN'
    end
    object qryResponsavelNM_RESP_FINAN: TStringField
      FieldName = 'NM_RESP_FINAN'
      Size = 60
    end
  end
  object qryDtVencPessoa: TUMZReadOnlyQuery
    Connection = DM.db
    SQL.Strings = (
      'SELECT'
      '   NR_DIA_VENCIMENTO'
      'FROM'
      '   PESSOAS'
      'WHERE'
      '   CD_PESSOA = :CD_PESSOA')
    Params = <
      item
        DataType = ftUnknown
        Name = 'CD_PESSOA'
        ParamType = ptUnknown
      end>
    DataSource = fMatricular.dsMatricula
    Left = 56
    Top = 360
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'CD_PESSOA'
        ParamType = ptUnknown
      end>
    object qryDtVencPessoaNR_DIA_VENCIMENTO: TLargeintField
      FieldName = 'NR_DIA_VENCIMENTO'
    end
  end
  object cdsDescontos: TClientDataSet
    Active = True
    Aggregates = <>
    FieldDefs = <
      item
        Name = 'VL_DESCONTO'
        DataType = ftCurrency
      end
      item
        Name = 'CD_ACAO_MOVIMENTO'
        DataType = ftInteger
      end
      item
        Name = 'CD_TIPO_DESCONTO'
        DataType = ftInteger
      end
      item
        Name = 'CD_TIPO_COMPORTAMENTO'
        DataType = ftInteger
      end
      item
        Name = 'DS_OBSERVACAO'
        DataType = ftString
        Size = 255
      end
      item
        Name = 'IDX_PARCELA'
        DataType = ftInteger
      end
      item
        Name = 'SN_DESCONTO_PLANO'
        DataType = ftInteger
      end>
    IndexDefs = <>
    Params = <>
    StoreDefs = True
    Left = 112
    Top = 320
    Data = {
      E30000009619E0BD010000001800000007000000000003000000E3000B564C5F
      444553434F4E544F080004000000010007535542545950450200490006004D6F
      6E6579001143445F4143414F5F4D4F56494D454E544F04000100000000001043
      445F5449504F5F444553434F4E544F04000100000000001543445F5449504F5F
      434F4D504F5254414D454E544F04000100000000000D44535F4F425345525641
      43414F020049000000010005574944544802000200FF000B4944585F50415243
      454C41040001000000000011534E5F444553434F4E544F5F504C414E4F040001
      00000000000000}
    object cdsDescontosVL_DESCONTO: TCurrencyField
      FieldName = 'VL_DESCONTO'
      DisplayFormat = '###,###,##0.00'
    end
    object cdsDescontosCD_ACAO_MOVIMENTO: TIntegerField
      FieldName = 'CD_ACAO_MOVIMENTO'
    end
    object cdsDescontosCD_TIPO_DESCONTO: TIntegerField
      FieldName = 'CD_TIPO_DESCONTO'
    end
    object cdsDescontosCD_TIPO_COMPORTAMENTO: TIntegerField
      FieldName = 'CD_TIPO_COMPORTAMENTO'
    end
    object cdsDescontosDS_OBSERVACAO: TStringField
      FieldName = 'DS_OBSERVACAO'
      Size = 255
    end
    object cdsDescontosIDX_PARCELA: TIntegerField
      FieldName = 'IDX_PARCELA'
    end
    object cdsDescontosSN_DESCONTO_PLANO: TIntegerField
      FieldName = 'SN_DESCONTO_PLANO'
    end
  end
  object qryDescontoProgFixo: TUMZReadOnlyQuery
    Connection = DM.db
    SQL.Strings = (
      'SELECT'
      '  pd.*,'
      '  pld.percentualdesconto,'
      '  pld.valordesconto,'
      '  pld.cd_acao_movimento,'
      
        '  CASE WHEN pld.cd_tipo_desconto IS NOT NULL THEN pld.cd_tipo_de' +
        'sconto ELSE 2 END cd_tipo_desconto'
      'FROM'
      '  pessoas_descontos pd'
      
        '  INNER JOIN fin_tp_titulos_pessoas_desc tptp ON (tptp.cd_descon' +
        'to_pessoa = pd.cd_desconto_pessoa)'
      '  LEFT JOIN planosdesconto pld ON (pld.codigo = pd.cd_desconto)'
      'WHERE'
      '  pld.sn_condicional = 0 AND'
      '  pd.tp_desconto = 1 AND'
      '  COALESCE(pd.cd_curso, :cd_curso) LIKE :cd_curso AND'
      '  pd.cd_pessoa = :cd_pessoa AND'
      '  pd.cd_depto = :cd_depto AND'
      '  pd.nr_parc_inicio <= :nr_parcela AND'
      '  pd.nr_parc_fim >=  :nr_parcela AND'
      '  tptp.cd_tipo_titulo = :cd_tipo_parcela AND'
      '  CURDATE() BETWEEN pd.dt_inicio AND pd.dt_fim AND'
      
        '  CASE WHEN :cd_coligada IS NOT NULL THEN tptp.cd_coligada = :cd' +
        '_coligada ELSE 1=1 END'
      'ORDER BY'
      '   pd.cd_desconto_pessoa ASC')
    Params = <
      item
        DataType = ftUnknown
        Name = 'CD_CURSO'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'CD_PESSOA'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'CD_DEPTO'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'nr_parcela'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'cd_tipo_parcela'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'cd_coligada'
        ParamType = ptUnknown
      end>
    Left = 344
    Top = 376
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'CD_CURSO'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'CD_PESSOA'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'CD_DEPTO'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'nr_parcela'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'cd_tipo_parcela'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'cd_coligada'
        ParamType = ptUnknown
      end>
  end
  object qryDescontoProgCondicional: TUMZReadOnlyQuery
    Connection = DM.db
    SQL.Strings = (
      'SELECT'
      '  pd.*,'
      '  pld.percentualdesconto,'
      '  pld.valordesconto,'
      '  pld.cd_acao_movimento,'
      
        '  CASE WHEN pld.cd_tipo_desconto IS NOT NULL THEN pld.cd_tipo_de' +
        'sconto ELSE 2 END cd_tipo_desconto'
      'FROM'
      '  pessoas_descontos pd'
      
        '  INNER JOIN fin_tp_titulos_pessoas_desc tptp ON (tptp.cd_descon' +
        'to_pessoa = pd.cd_desconto_pessoa)'
      '  LEFT JOIN planosdesconto pld ON (pld.codigo = pd.cd_desconto)'
      'WHERE'
      '  (pld.sn_condicional = 1 OR pld.codigo IS NULL) AND'
      '  pd.tp_desconto = 1 AND'
      '  COALESCE(pd.cd_curso, :cd_curso) LIKE :cd_curso AND'
      '  pd.cd_pessoa = :cd_pessoa AND'
      '  pd.cd_depto = :cd_depto AND'
      '  pd.nr_parc_inicio <= :nr_parcela AND'
      '  pd.nr_parc_fim >=  :nr_parcela AND'
      '  tptp.cd_tipo_titulo = :cd_tipo_parcela AND'
      '  CURDATE() BETWEEN pd.dt_inicio AND pd.dt_fim AND'
      
        '  CASE WHEN :cd_coligada IS NOT NULL THEN tptp.cd_coligada = :cd' +
        '_coligada ELSE 1=1 END'
      'ORDER BY'
      '   pd.cd_desconto_pessoa ASC')
    Params = <
      item
        DataType = ftUnknown
        Name = 'CD_CURSO'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'CD_PESSOA'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'CD_DEPTO'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'nr_parcela'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'cd_tipo_parcela'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'cd_coligada'
        ParamType = ptUnknown
      end>
    Left = 376
    Top = 376
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'CD_CURSO'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'CD_PESSOA'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'CD_DEPTO'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'nr_parcela'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'cd_tipo_parcela'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'cd_coligada'
        ParamType = ptUnknown
      end>
  end
end
