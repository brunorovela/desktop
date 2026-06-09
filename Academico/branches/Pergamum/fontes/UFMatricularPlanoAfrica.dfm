object fMatricularPlanoAfrica: TfMatricularPlanoAfrica
  Left = 0
  Top = 0
  Width = 790
  Height = 417
  TabOrder = 0
  TabStop = True
  object bvlSep1: TBevel
    Left = 0
    Top = 55
    Width = 790
    Height = 3
    Align = alTop
    Shape = bsTopLine
    ExplicitLeft = 544
    ExplicitTop = 336
    ExplicitWidth = 50
  end
  object bvlSep2: TBevel
    Left = 0
    Top = 260
    Width = 790
    Height = 3
    Align = alBottom
    Shape = bsBottomLine
    ExplicitLeft = 3
    ExplicitTop = 184
    ExplicitWidth = 961
  end
  object pnlPlanos: TPanel
    Left = 0
    Top = 0
    Width = 790
    Height = 55
    Align = alTop
    BevelOuter = bvNone
    TabOrder = 0
    object lblPlanoPagto: TLabel
      Left = 0
      Top = 0
      Width = 76
      Height = 13
      Caption = 'Plano financeiro'
      FocusControl = dblcPlanoPgto
    end
    object lblDiscGradeTit: TLabel
      Left = 577
      Top = 0
      Width = 145
      Height = 13
      Caption = 'Disciplinas na grade curricular:'
    end
    object lblDiscAnuaisTit: TLabel
      Left = 590
      Top = 19
      Width = 132
      Height = 13
      Caption = 'Disciplinas anuais em curso:'
    end
    object lblDiscMatTit: TLabel
      Left = 530
      Top = 38
      Width = 192
      Height = 13
      Caption = 'Disciplinas selecionadas neste processo:'
    end
    object lblDiscGrade: TLabel
      Left = 728
      Top = 0
      Width = 14
      Height = 13
      Caption = '00'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clGreen
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object lblDiscAnuais: TLabel
      Left = 728
      Top = 19
      Width = 14
      Height = 13
      Caption = '00'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clGreen
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object lblDiscMat: TLabel
      Left = 728
      Top = 38
      Width = 14
      Height = 13
      Caption = '00'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clGreen
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object sbRestaurar: TSpeedButton
      Left = 324
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
    object dblcPlanoPgto: TDBLookupComboBox
      Left = 0
      Top = 16
      Width = 321
      Height = 21
      KeyField = 'CD_PLANO'
      ListField = 'DS_PLANO'
      ListSource = dsPlanoPgto
      TabOrder = 0
    end
  end
  object dbgParcelas: TDBGrid
    Left = 0
    Top = 58
    Width = 790
    Height = 202
    Align = alClient
    DataSource = dsParcelas
    ReadOnly = True
    TabOrder = 1
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'Tahoma'
    TitleFont.Style = []
    Columns = <
      item
        Expanded = False
        FieldName = 'DS_TIPO_TITULO'
        Title.Caption = 'Tipo de t'#237'tulo'
        Width = 160
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'NR_PARCELA'
        Title.Caption = 'Parcela'
        Width = 53
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'DT_VENCTO'
        Title.Caption = 'Vencimento'
        Width = 83
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'VL_BRUTO'
        Title.Caption = 'Valor bruto'
        Width = 70
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'VL_DESCONTO'
        Title.Caption = 'Desconto'
        Width = 70
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'VL_BOLSA'
        Title.Caption = 'Bolsa'
        Width = 70
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'VL_EXTRA'
        Title.Caption = 'Valor extra'
        Width = 70
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'NM_RESPONSAVEL'
        Title.Caption = 'Respons'#225'vel'
        Width = 148
        Visible = True
      end>
  end
  object tcBolsas: TTabControl
    Left = 0
    Top = 263
    Width = 790
    Height = 154
    Align = alBottom
    Style = tsFlatButtons
    TabOrder = 2
    Tabs.Strings = (
      'Desconto condicional'
      'Bolsa ou gratuidade'
      'Entidade pagadora')
    TabIndex = 0
    OnChange = tcBolsasChange
    object lblBolsaNome: TLabel
      Left = 11
      Top = 26
      Width = 124
      Height = 13
      Caption = 'Tipo de bolsa ou conv'#234'nio'
      FocusControl = dblcTipoBolsa
    end
    object lblValorBolsa: TLabel
      Left = 11
      Top = 69
      Width = 67
      Height = 13
      Caption = 'Valor da bolsa'
      FocusControl = dbeValorBolsa
    end
    object lblPercBolsa: TLabel
      Left = 103
      Top = 69
      Width = 94
      Height = 13
      Caption = 'Percentual da bolsa'
      FocusControl = dbePercBolsa
    end
    object lblRespBolsa: TLabel
      Left = 11
      Top = 112
      Width = 61
      Height = 13
      Caption = 'Respons'#225'vel'
      FocusControl = dbeRespBolsa
    end
    object sbBolsaSelResp: TSpeedButton
      Left = 395
      Top = 128
      Width = 23
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
      OnClick = sbBolsaSelRespClick
    end
    object lblBolsaGratuidade: TLabel
      Left = 424
      Top = 131
      Width = 72
      Height = 13
      Caption = '(gratuidade)'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clGreen
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
      Visible = False
    end
    object sbAplicarBolsa: TSpeedButton
      Left = 324
      Top = 42
      Width = 23
      Height = 21
      AllowAllUp = True
      GroupIndex = 1
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
      OnClick = sbAplicarBolsaClick
    end
    object dblcTipoBolsa: TDBLookupComboBox
      Left = 11
      Top = 42
      Width = 310
      Height = 21
      DataField = 'DS_BOLSA'
      DataSource = dsBolsas
      TabOrder = 0
    end
    object dbeValorBolsa: TDBEdit
      Left = 11
      Top = 85
      Width = 86
      Height = 21
      DataField = 'VL_FIXO_SUGERIDO'
      DataSource = dsBolsas
      TabOrder = 1
    end
    object dbePercBolsa: TDBEdit
      Left = 103
      Top = 85
      Width = 86
      Height = 21
      DataField = 'VL_PERC_SUGERIDO'
      DataSource = dsBolsas
      TabOrder = 2
    end
    object dbeRespBolsa: TDBEdit
      Left = 11
      Top = 128
      Width = 61
      Height = 21
      BevelKind = bkFlat
      BorderStyle = bsNone
      Color = clBtnFace
      DataField = 'CD_RESPONSAVEL'
      DataSource = dsBolsas
      ReadOnly = True
      TabOrder = 3
    end
    object dbeNomeRespBolsa: TDBEdit
      Left = 75
      Top = 128
      Width = 317
      Height = 21
      BevelKind = bkFlat
      BorderStyle = bsNone
      Color = clBtnFace
      DataField = 'NM_RESPONSAVEL'
      DataSource = dsBolsas
      ReadOnly = True
      TabOrder = 4
    end
  end
  object qryPlanoPgto: TUMZReadOnlyQuery
    Connection = DM.db
    SortedFields = 'DS_PLANO'
    SQL.Strings = (
      'SELECT'
      '   P.CD_PLANO,'
      '   P.DS_PLANO,'
      '   P.NR_ANOSEM NR_ANOSEMESTRE,'
      '   T.CD_TURMA'
      'FROM'
      '   FIN_PLANO_PGTO P'
      '      JOIN FIN_PLANO_TURMAS T ON'
      '         (P.CD_PLANO = T.CD_PLANO) AND'
      '         (P.NR_ANOSEM = T.NR_ANOSEM)'
      'WHERE'
      '   T.CD_TURMA = :CD_TURMA AND'
      '   T.NR_ANOSEM = :NR_ANOSEMESTRE')
    Params = <
      item
        DataType = ftUnknown
        Name = 'CD_TURMA'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'NR_ANOSEMESTRE'
        ParamType = ptUnknown
      end>
    DataSource = fMatricular.dsMatricula
    IndexFieldNames = 'DS_PLANO Asc'
    Left = 616
    Top = 72
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'CD_TURMA'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'NR_ANOSEMESTRE'
        ParamType = ptUnknown
      end>
    object qryPlanoPgtoCD_PLANO: TLargeintField
      FieldName = 'CD_PLANO'
      Required = True
    end
    object qryPlanoPgtoDS_PLANO: TStringField
      FieldName = 'DS_PLANO'
      Size = 150
    end
    object qryPlanoPgtoNR_ANOSEMESTRE: TIntegerField
      FieldName = 'NR_ANOSEMESTRE'
    end
    object qryPlanoPgtoCD_TURMA: TStringField
      FieldName = 'CD_TURMA'
      Required = True
      Size = 50
    end
  end
  object dsPlanoPgto: TDataSource
    AutoEdit = False
    DataSet = qryPlanoPgto
    OnDataChange = dsPlanoPgtoDataChange
    Left = 664
    Top = 72
  end
  object qryItensPlano: TUMZReadOnlyQuery
    Connection = DM.db
    SortedFields = 'NR_DISC_MIN'
    SortType = stDescending
    Filtered = True
    SQL.Strings = (
      'SELECT'
      '   I.CD_PLANO_ITEM,'
      '   CASE I.NR_DISC_MIN'
      '      WHEN -1 THEN :NR_DISC_GRADE'
      '      ELSE COALESCE(I.NR_DISC_MIN, 0)'
      '   END NR_DISC_MIN,'
      '   CASE'
      '      WHEN I.NR_DISC_MAX = -1 THEN :NR_DISC_GRADE'
      '      ELSE COALESCE(I.NR_DISC_MAX, 0)'
      '   END NR_DISC_MAX,'
      '   I.SN_PODE_REPETIR,'
      '   I.CD_TIPO_TITULO,'
      '   I.NR_PARCELAS,'
      '   I.VL_PARCELA,'
      '   I.VL_DESCONTO,'
      '   I.DT_INICIAL,'
      '   I.DT_PRIMEIRA_PARC,'
      '   I.DT_SEGUNDA_PARC,'
      '   I.SN_DIA_UTIL,'
      '   I.SN_ULTIMO_DIA_MES,'
      '   TT.CD_CONTA,'
      '   TT.DS_TIPO_TITULO'
      'FROM'
      '   FIN_PLANO_TURMAS P'
      '      JOIN TURMAS T ON'
      '         (P.CD_TURMA = T.CODIGO) AND'
      '         (P.NR_ANOSEM = T.ANOSEMESTRE)'
      '      JOIN FIN_PLANOS_PGTO_ITENS I ON'
      '         (P.CD_PLANO = I.CD_PLANO)'
      '         JOIN FIN_TIPOS_TITULO TT ON'
      '            (I.CD_TIPO_TITULO = TT.CD_TIPO_TITULO) AND'
      '            (T.CD_COLIGADA = TT.CD_COLIGADA)'
      'WHERE'
      '   P.CD_PLANO = :CD_PLANO AND'
      '   P.CD_TURMA = :CD_TURMA AND'
      '   P.NR_ANOSEM = :NR_ANOSEMESTRE')
    Params = <
      item
        DataType = ftUnknown
        Name = 'NR_DISC_GRADE'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'CD_PLANO'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'CD_TURMA'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'NR_ANOSEMESTRE'
        ParamType = ptUnknown
      end>
    DataSource = dsPlanoPgto
    IndexFieldNames = 'NR_DISC_MIN Desc'
    Left = 616
    Top = 232
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'NR_DISC_GRADE'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'CD_PLANO'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'CD_TURMA'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'NR_ANOSEMESTRE'
        ParamType = ptUnknown
      end>
    object qryItensPlanoCD_PLANO_ITEM: TLargeintField
      FieldName = 'CD_PLANO_ITEM'
      Required = True
    end
    object qryItensPlanoNR_DISC_MIN: TLargeintField
      FieldName = 'NR_DISC_MIN'
      ReadOnly = True
    end
    object qryItensPlanoNR_DISC_MAX: TLargeintField
      FieldName = 'NR_DISC_MAX'
      ReadOnly = True
    end
    object qryItensPlanoSN_PODE_REPETIR: TSmallintField
      FieldName = 'SN_PODE_REPETIR'
    end
    object qryItensPlanoCD_TIPO_TITULO: TLargeintField
      FieldName = 'CD_TIPO_TITULO'
    end
    object qryItensPlanoNR_PARCELAS: TIntegerField
      FieldName = 'NR_PARCELAS'
    end
    object qryItensPlanoVL_PARCELA: TFloatField
      FieldName = 'VL_PARCELA'
    end
    object qryItensPlanoVL_DESCONTO: TFloatField
      FieldName = 'VL_DESCONTO'
    end
    object qryItensPlanoDT_INICIAL: TDateTimeField
      FieldName = 'DT_INICIAL'
    end
    object qryItensPlanoDT_PRIMEIRA_PARC: TDateTimeField
      FieldName = 'DT_PRIMEIRA_PARC'
    end
    object qryItensPlanoDT_SEGUNDA_PARC: TDateTimeField
      FieldName = 'DT_SEGUNDA_PARC'
    end
    object qryItensPlanoSN_DIA_UTIL: TSmallintField
      FieldName = 'SN_DIA_UTIL'
    end
    object qryItensPlanoSN_ULTIMO_DIA_MES: TSmallintField
      FieldName = 'SN_ULTIMO_DIA_MES'
    end
    object qryItensPlanoCD_CONTA: TLargeintField
      FieldName = 'CD_CONTA'
    end
    object qryItensPlanoDS_TIPO_TITULO: TStringField
      FieldName = 'DS_TIPO_TITULO'
      Size = 255
    end
  end
  object cdsParcelas: TClientDataSet
    Active = True
    Aggregates = <>
    Filter = 'NR_TIPO = 0'
    Filtered = True
    FieldDefs = <
      item
        Name = 'CD_TIPO_TITULO'
        DataType = ftInteger
      end
      item
        Name = 'DS_TIPO_TITULO'
        DataType = ftString
        Size = 64
      end
      item
        Name = 'NR_PARCELA'
        DataType = ftInteger
      end
      item
        Name = 'DT_VENCTO'
        DataType = ftDateTime
      end
      item
        Name = 'VL_BRUTO'
        DataType = ftCurrency
      end
      item
        Name = 'VL_DESCONTO'
        DataType = ftCurrency
      end
      item
        Name = 'VL_BOLSA'
        DataType = ftCurrency
      end
      item
        Name = 'VL_EXTRA'
        DataType = ftCurrency
      end
      item
        Name = 'CD_RESPONSAVEL'
        DataType = ftInteger
      end
      item
        Name = 'NM_RESPONSAVEL'
        DataType = ftString
        Size = 60
      end
      item
        Name = 'CD_PESSOA'
        DataType = ftInteger
      end
      item
        Name = 'CD_PARCELA'
        Attributes = [faReadonly]
        DataType = ftAutoInc
      end
      item
        Name = 'NR_TIPO'
        DataType = ftInteger
      end
      item
        Name = 'CD_PLANO_ITEM'
        DataType = ftInteger
      end
      item
        Name = 'CD_CONTA'
        DataType = ftInteger
      end
      item
        Name = 'CD_BOLSA'
        DataType = ftInteger
      end>
    IndexDefs = <>
    IndexFieldNames = 'NR_PARCELA'
    Params = <>
    StoreDefs = True
    Left = 616
    Top = 312
    Data = {
      E20100009619E0BD010000001800000010000000000003000000E2010E43445F
      5449504F5F544954554C4F04000100000000000E44535F5449504F5F54495455
      4C4F01004900000001000557494454480200020040000A4E525F50415243454C
      4104000100000000000944545F56454E43544F080008000000000008564C5F42
      5255544F080004000000010007535542545950450200490006004D6F6E657900
      0B564C5F444553434F4E544F0800040000000100075355425459504502004900
      06004D6F6E65790008564C5F424F4C5341080004000000010007535542545950
      450200490006004D6F6E65790008564C5F455854524108000400000001000753
      5542545950450200490006004D6F6E6579000E43445F524553504F4E53415645
      4C04000100000000000E4E4D5F524553504F4E534156454C0100490000000100
      055749445448020002003C000943445F504553534F4104000100000000000A43
      445F50415243454C410400010002000100075355425459504502004900080041
      75746F696E6300074E525F5449504F04000100000000000D43445F504C414E4F
      5F4954454D04000100000000000843445F434F4E544104000100000000000843
      445F424F4C5341040001000000000001000C4155544F494E4356414C55450400
      010001000000}
    object cdsParcelasCD_TIPO_TITULO: TIntegerField
      FieldName = 'CD_TIPO_TITULO'
    end
    object cdsParcelasDS_TIPO_TITULO: TStringField
      FieldName = 'DS_TIPO_TITULO'
      Size = 64
    end
    object cdsParcelasNR_PARCELA: TIntegerField
      FieldName = 'NR_PARCELA'
    end
    object cdsParcelasDT_VENCTO: TDateTimeField
      FieldName = 'DT_VENCTO'
    end
    object cdsParcelasVL_BRUTO: TCurrencyField
      FieldName = 'VL_BRUTO'
      DisplayFormat = '###,###,##0.00'
    end
    object cdsParcelasVL_DESCONTO: TCurrencyField
      FieldName = 'VL_DESCONTO'
      DisplayFormat = '###,###,##0.00'
    end
    object cdsParcelasVL_BOLSA: TCurrencyField
      FieldName = 'VL_BOLSA'
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
      Size = 60
    end
    object cdsParcelasCD_PESSOA: TIntegerField
      FieldName = 'CD_PESSOA'
    end
    object cdsParcelasCD_PARCELA: TAutoIncField
      FieldName = 'CD_PARCELA'
    end
    object cdsParcelasNR_TIPO: TIntegerField
      FieldName = 'NR_TIPO'
    end
    object cdsParcelasCD_PLANO_ITEM: TIntegerField
      FieldName = 'CD_PLANO_ITEM'
    end
    object cdsParcelasCD_CONTA: TIntegerField
      FieldName = 'CD_CONTA'
    end
    object cdsParcelasCD_BOLSA: TIntegerField
      FieldName = 'CD_BOLSA'
    end
  end
  object dsParcelas: TDataSource
    DataSet = cdsParcelas
    Left = 664
    Top = 312
  end
  object qryTotDiscAnuais: TUMZReadOnlyQuery
    Connection = DM.db
    SQL.Strings = (
      'SELECT'
      '   COUNT(F.DISCIPLINA) NR_DISCIPLINAS'
      'FROM'
      '   FICHAINDIVIDUAL F'
      '      JOIN TURMAS T ON'
      '         (F.TURMA = T.CODIGO) AND'
      '         (F.ANOSEMESTRE = T.ANOSEMESTRE)'
      '      JOIN GRADES_DISCIPLINAS G ON'
      '         (T.CD_GRADE = G.CD_GRADE) AND'
      '         (F.DISCIPLINA = G.CD_DISCIPLINA) AND'
      '         (T.CURSO = G.CD_CURSO)'
      '      JOIN SITUACAO S ON'
      '         (F.SITUACAO = S.CD_SITUACAO)'
      'WHERE'
      '   S.CD_SITUACAO_PAI NOT IN (0, 3, 4, 5, 6, 7, 8, 9) AND'
      '   G.NR_CREDITOS_ACADEMICOS = 12 AND'
      '   F.CODIGOALUNO = :CD_PESSOA AND'
      '   F.ANOSEMESTRE = :NR_ANOSEMESTRE')
    Params = <
      item
        DataType = ftUnknown
        Name = 'CD_PESSOA'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'NR_ANOSEMESTRE'
        ParamType = ptUnknown
      end>
    DataSource = fMatricular.dsMatricula
    Left = 616
    Top = 192
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'CD_PESSOA'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'NR_ANOSEMESTRE'
        ParamType = ptUnknown
      end>
    object qryTotDiscAnuaisNR_DISCIPLINAS: TLargeintField
      FieldName = 'NR_DISCIPLINAS'
      ReadOnly = True
    end
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
    Left = 616
    Top = 112
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
  object qryBolsas: TUMZReadOnlyQuery
    Connection = DM.db
    SortedFields = 'DS_BOLSA'
    SQL.Strings = (
      'SELECT'
      '   CD_BOLSA,'
      '   DS_BOLSA,'
      '   SN_GRATUIDADE,'
      '   VL_FIXO_SUGERIDO,'
      '   VL_PERC_SUGERIDO'
      'FROM'
      '   FIN_BOLSAS_TIPOS')
    Params = <>
    IndexFieldNames = 'DS_BOLSA Asc'
    Left = 616
    Top = 152
    object qryBolsasCD_BOLSA: TIntegerField
      FieldName = 'CD_BOLSA'
      Required = True
    end
    object qryBolsasDS_BOLSA: TStringField
      FieldName = 'DS_BOLSA'
      Size = 100
    end
    object qryBolsasSN_GRATUIDADE: TSmallintField
      FieldName = 'SN_GRATUIDADE'
    end
    object qryBolsasVL_FIXO_SUGERIDO: TFloatField
      FieldName = 'VL_FIXO_SUGERIDO'
    end
    object qryBolsasVL_PERC_SUGERIDO: TFloatField
      FieldName = 'VL_PERC_SUGERIDO'
    end
  end
  object cdsBolsas: TClientDataSet
    Aggregates = <>
    Params = <>
    Left = 616
    Top = 352
    object cdsBolsasCD_BOLSA: TIntegerField
      FieldName = 'CD_BOLSA'
      OnChange = cdsBolsasCD_BOLSAChange
    end
    object cdsBolsasDS_BOLSA: TStringField
      FieldKind = fkLookup
      FieldName = 'DS_BOLSA'
      LookupDataSet = qryBolsas
      LookupKeyFields = 'CD_BOLSA'
      LookupResultField = 'DS_BOLSA'
      KeyFields = 'CD_BOLSA'
      Size = 100
      Lookup = True
    end
    object cdsBolsasVL_FIXO_SUGERIDO: TCurrencyField
      FieldName = 'VL_FIXO_SUGERIDO'
      DisplayFormat = '###,###,##0.00'
    end
    object cdsBolsasVL_PERC_SUGERIDO: TCurrencyField
      FieldName = 'VL_PERC_SUGERIDO'
      DisplayFormat = '###,###,##0.00'
    end
    object cdsBolsasCD_RESPONSAVEL: TIntegerField
      FieldName = 'CD_RESPONSAVEL'
    end
    object cdsBolsasNM_RESPONSAVEL: TStringField
      FieldName = 'NM_RESPONSAVEL'
      Size = 255
    end
    object cdsBolsasNR_TIPO: TIntegerField
      FieldName = 'NR_TIPO'
    end
    object cdsBolsasSN_APLICADO: TBooleanField
      FieldName = 'SN_APLICADO'
    end
    object cdsBolsasSN_GRATUIDADE: TBooleanField
      FieldName = 'SN_GRATUIDADE'
    end
  end
  object dsBolsas: TDataSource
    DataSet = cdsBolsas
    OnDataChange = dsBolsasDataChange
    Left = 664
    Top = 352
  end
  object qryBolsaTiposTitulo: TUMZReadOnlyQuery
    Connection = DM.db
    SQL.Strings = (
      'SELECT'
      '   CD_BOLSAS_TIPO_TITULOS,'
      '   CD_BOLSA,'
      '   CD_TIPO_TITULO,'
      '   CD_COLIGADA'
      'FROM'
      '   FIN_BOLSAS_TIPOS_TITULOS'
      'WHERE'
      '   CD_COLIGADA = :CD_COLIGADA')
    Params = <
      item
        DataType = ftUnknown
        Name = 'CD_COLIGADA'
        ParamType = ptUnknown
      end>
    DataSource = fMatricular.dsTurma
    Left = 616
    Top = 272
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'CD_COLIGADA'
        ParamType = ptUnknown
      end>
    object qryBolsaTiposTituloCD_BOLSAS_TIPO_TITULOS: TIntegerField
      FieldName = 'CD_BOLSAS_TIPO_TITULOS'
      Required = True
    end
    object qryBolsaTiposTituloCD_BOLSA: TIntegerField
      FieldName = 'CD_BOLSA'
    end
    object qryBolsaTiposTituloCD_TIPO_TITULO: TIntegerField
      FieldName = 'CD_TIPO_TITULO'
    end
    object qryBolsaTiposTituloCD_COLIGADA: TIntegerField
      FieldName = 'CD_COLIGADA'
    end
  end
end
