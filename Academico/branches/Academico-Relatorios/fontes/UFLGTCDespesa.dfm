object frmLGTCDespesa: TfrmLGTCDespesa
  Left = 0
  Top = 0
  Width = 623
  Height = 304
  Align = alClient
  Constraints.MinHeight = 289
  TabOrder = 0
  TabStop = True
  ExplicitWidth = 451
  object pnlDescricao: TPanel
    Left = 0
    Top = 0
    Width = 623
    Height = 43
    Align = alTop
    BevelOuter = bvNone
    TabOrder = 0
    ExplicitWidth = 451
    object lblDescricao: TLabel
      Left = 3
      Top = 3
      Width = 46
      Height = 13
      Caption = 'Descri'#231#227'o'
      FocusControl = dbeObservacao
    end
    object dbeObservacao: TDBEdit
      Left = 3
      Top = 19
      Width = 539
      Height = 21
      DataField = 'DS_OBSERVACAO'
      DataSource = dsDespesa
      TabOrder = 0
    end
  end
  object pnlValor: TPanel
    Left = 0
    Top = 43
    Width = 623
    Height = 46
    Align = alTop
    BevelOuter = bvNone
    TabOrder = 1
    ExplicitWidth = 451
  end
  object pnlDados: TPanel
    Left = 0
    Top = 89
    Width = 623
    Height = 215
    Align = alClient
    BevelOuter = bvNone
    TabOrder = 2
    ExplicitWidth = 451
    object lblPlano: TLabel
      Left = 3
      Top = 40
      Width = 78
      Height = 13
      Caption = 'Plano de Contas'
      FocusControl = dbePlano
    end
    object sbBuscarPlano: TSpeedButton
      Left = 545
      Top = 56
      Width = 23
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
      OnClick = sbBuscarPlanoClick
    end
    object lblArquivo: TLabel
      Left = 3
      Top = 120
      Width = 87
      Height = 13
      Caption = 'Arquivo (opcional)'
      FocusControl = dbeArquivo
    end
    object sbArquivo: TSpeedButton
      Left = 545
      Top = 136
      Width = 23
      Height = 21
      Flat = True
      Glyph.Data = {
        EE000000424DEE000000000000007600000028000000100000000F0000000100
        0400000000007800000000000000000000001000000010000000000000000000
        80000080000000808000800000008000800080800000C0C0C000808080000000
        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00CCCCCCCCCCCC
        CCCC0000000000000CCC00777777777770CC0F0BFBFBFBFBF0CC0B0FBFBFBFBF
        BF0C0FB0FBFBFBFBFB0C0BF0BFBFBFBFBFB00FBF0000000000000BFBFBFBFBFB
        F0CC0FBFBFBFBFBFB0CC0BFBFBFB00000CCCC0BFBFB0CCCCCCCCCC00000CCCCC
        CCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCC}
      OnClick = sbArquivoClick
    end
    object lblSituacao: TLabel
      Left = 3
      Top = 160
      Width = 41
      Height = 13
      Caption = 'Situa'#231#227'o'
      FocusControl = dblcSituacao
    end
    object lblFornecedor: TLabel
      Left = 3
      Top = 0
      Width = 55
      Height = 13
      Caption = 'Fornecedor'
      FocusControl = dbeFornecedor
    end
    object sbBuscarFornecedor: TSpeedButton
      Left = 545
      Top = 16
      Width = 23
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
      OnClick = sbBuscarFornecedorClick
    end
    object sbDownloadAnexo: TSpeedButton
      Left = 571
      Top = 136
      Width = 23
      Height = 21
      Flat = True
      Glyph.Data = {
        36030000424D3603000000000000360000002800000010000000100000000100
        18000000000000030000C30E0000C30E00000000000000000000FFFFFF000000
        0000000000000000000000000000000000000000000000000000000000000000
        00000000FFFFFFFFFFFF9B9C9B9B9C9B63656363656363656363656363656363
        65636365636365636365636365636365639B9C9B000000FFFFFF636563CECFCE
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFCECF
        CE6365639B9C9B000000636563CECFCE63656363656363656363656363656363
        6563636563636563636563636563CECFCE636563636563000000636563CECFCE
        CECFCECECFCECECFCECECFCECECFCECECFCECECFCECECFCECECFCECECFCECECF
        CE636563636563000000636563CECFCECECFCECECFCECECFCECECFCECECFCECE
        CFCECECFCECECFCECECFCE009A0000FF006365636365630000009B9C9BFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FF636563636563000000FFFFFF9B9C9BF3F3F3CECFCECECFCECECFCECECFCECE
        CFCECECFCECECFCECECFCECECFCECECFCECECFCE9B9C9B000000FFFFFFFFFFFF
        9B9C9B9B9C9B9B9C9B9B9C9B9B9C9B9B9C9B0000009B9C9B9B9C9B9B9C9B9B9C
        9B9B9C9B9B9C9BFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF3E
        B3FF00CFFF000000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFF3EB3FF46DDFF00CFFF46DDFF000000FFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF3EB3FF3EB3FF3E
        B3FF00CFFF000000000000000000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFF3EB3FF00CFFF000000FFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF3E
        B3FF00CFFF000000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFF3EB3FF00CFFF000000FFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF3E
        B3FF009AFF000000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF}
      OnClick = sbDownloadAnexoClick
    end
    object lblTipoTitulo: TLabel
      Left = 3
      Top = 80
      Width = 64
      Height = 13
      Caption = 'Tipo de T'#237'tulo'
      FocusControl = dblcTipoTitulo
    end
    object dbePlano: TDBEdit
      Left = 3
      Top = 56
      Width = 539
      Height = 21
      DataField = 'DS_CONTA'
      DataSource = dsDespesa
      TabOrder = 1
    end
    object dbeArquivo: TDBEdit
      Left = 3
      Top = 136
      Width = 539
      Height = 21
      DataField = 'NM_ARQUIVO'
      DataSource = dsAnexo
      TabOrder = 3
    end
    object dblcSituacao: TDBLookupComboBox
      Left = 3
      Top = 176
      Width = 539
      Height = 21
      DataField = 'DS_SITUACAO'
      DataSource = dsDespesa
      TabOrder = 4
    end
    object dbeFornecedor: TDBEdit
      Left = 3
      Top = 16
      Width = 539
      Height = 21
      DataField = 'NM_FORNECEDOR'
      DataSource = dsDespesa
      TabOrder = 0
    end
    object dblcTipoTitulo: TDBLookupComboBox
      Left = 3
      Top = 96
      Width = 539
      Height = 21
      DataField = 'DS_TIPO_TITULO'
      DataSource = dsDespesa
      TabOrder = 2
    end
  end
  object qrySituacoes: TUMZReadOnlyQuery
    Connection = DM.db
    SQL.Strings = (
      'SELECT'
      '  `CD_SITUACAO`,'
      '  `DS_SITUACAO`,'
      '  `DS_CHAVE`,'
      '  `DS_COR`'
      'FROM'
      '  `LGTC_DESPESA_SITUACAO`')
    Params = <>
    Left = 336
    Top = 56
    object qrySituacoesCD_SITUACAO: TLargeintField
      FieldName = 'CD_SITUACAO'
      Required = True
    end
    object qrySituacoesDS_SITUACAO: TStringField
      FieldName = 'DS_SITUACAO'
      Required = True
      Size = 64
    end
    object qrySituacoesDS_CHAVE: TStringField
      FieldName = 'DS_CHAVE'
      Required = True
      Size = 16
    end
    object qrySituacoesDS_COR: TStringField
      FieldName = 'DS_COR'
      Size = 6
    end
  end
  object qryPlanos: TUMZReadOnlyQuery
    Connection = DM.db
    SQL.Strings = (
      'SELECT'
      '  `CD_CONTA`,'
      '  `CD_COLIGADA_MATRIZ`,'
      '  `DS_CONTA`'
      'FROM'
      '  `FIN_CONFIG_PLANO_CONTAS`')
    Params = <>
    Left = 304
    Top = 56
    object qryPlanosCD_CONTA: TLargeintField
      FieldName = 'CD_CONTA'
      Required = True
    end
    object qryPlanosCD_COLIGADA_MATRIZ: TIntegerField
      FieldName = 'CD_COLIGADA_MATRIZ'
      Required = True
    end
    object qryPlanosDS_CONTA: TStringField
      FieldName = 'DS_CONTA'
      Size = 255
    end
  end
  object dsDespesa: TDataSource
    DataSet = qryDespesa
    Left = 240
    Top = 56
  end
  object odlgAnexo: TOpenDialog
    Title = 'Selecione um arquivo para anexar '#224' despesa'
    Left = 208
    Top = 56
  end
  object qryFornecedor: TUMZReadOnlyQuery
    Connection = DM.db
    SQL.Strings = (
      'SELECT'
      '  `CD_PESSOA`,'
      '  `NM_PESSOA`'
      'FROM'
      '  `PESSOAS`'
      'WHERE'
      '  `CD_PESSOA` = :CD_FORNECEDOR')
    Params = <
      item
        DataType = ftUnknown
        Name = 'CD_FORNECEDOR'
        ParamType = ptUnknown
      end>
    Left = 368
    Top = 56
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'CD_FORNECEDOR'
        ParamType = ptUnknown
      end>
    object qryFornecedorCD_PESSOA: TIntegerField
      FieldName = 'CD_PESSOA'
      Required = True
    end
    object qryFornecedorNM_PESSOA: TStringField
      FieldName = 'NM_PESSOA'
      Size = 60
    end
  end
  object qryDespesa: TUMZQuery
    Connection = DM.db
    AfterPost = qryDespesaAfterPost
    SQL.Strings = (
      'SELECT'
      '  `CD_DESPESA`,'
      '  `CD_TIPO_DESPESA`,'
      '  `CD_DIARIO_AULA`,'
      '  `CD_SITUACAO`,'
      '  `CD_FORNECEDOR`,'
      '  `CD_CONTA`,'
      '  `CD_COLIGADA_MATRIZ`,'
      '  `DS_OBSERVACAO`,'
      '  `DT_COMPROMISSO`,'
      '  `VL_TOTAL`,'
      '  `ME_JSON_VALOR`,'
      '  `DT_CADASTRO`,'
      '  `DT_ALTERACAO`,'
      '  `CD_TIPO_TITULO`'
      'FROM'
      '  `LGTC_DESPESA_AULA`'
      'WHERE'
      '  `CD_DESPESA` = :CD_DESPESA')
    Params = <
      item
        DataType = ftUnknown
        Name = 'CD_DESPESA'
        ParamType = ptUnknown
      end>
    Left = 272
    Top = 56
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'CD_DESPESA'
        ParamType = ptUnknown
      end>
    object qryDespesaCD_DESPESA: TLargeintField
      FieldName = 'CD_DESPESA'
      Required = True
    end
    object qryDespesaCD_TIPO_DESPESA: TLargeintField
      FieldName = 'CD_TIPO_DESPESA'
      Required = True
    end
    object qryDespesaCD_DIARIO_AULA: TLargeintField
      FieldName = 'CD_DIARIO_AULA'
      Required = True
    end
    object qryDespesaCD_SITUACAO: TLargeintField
      FieldName = 'CD_SITUACAO'
      Required = True
      OnChange = qryDespesaCD_SITUACAOChange
    end
    object qryDespesaCD_FORNECEDOR: TIntegerField
      FieldName = 'CD_FORNECEDOR'
      Required = True
      OnChange = qryDespesaCD_FORNECEDORChange
    end
    object qryDespesaCD_CONTA: TLargeintField
      FieldName = 'CD_CONTA'
      Required = True
    end
    object qryDespesaCD_COLIGADA_MATRIZ: TIntegerField
      FieldName = 'CD_COLIGADA_MATRIZ'
      Required = True
    end
    object qryDespesaDS_OBSERVACAO: TStringField
      FieldName = 'DS_OBSERVACAO'
      OnChange = qryDespesaDS_OBSERVACAOChange
      Size = 255
    end
    object qryDespesaDT_COMPROMISSO: TDateTimeField
      FieldName = 'DT_COMPROMISSO'
      Required = True
    end
    object qryDespesaVL_TOTAL: TFloatField
      FieldName = 'VL_TOTAL'
    end
    object qryDespesaME_JSON_VALOR: TMemoField
      FieldName = 'ME_JSON_VALOR'
      BlobType = ftMemo
    end
    object qryDespesaDT_CADASTRO: TDateTimeField
      FieldName = 'DT_CADASTRO'
    end
    object qryDespesaDT_ALTERACAO: TDateTimeField
      FieldName = 'DT_ALTERACAO'
    end
    object qryDespesaDS_SITUACAO: TStringField
      FieldKind = fkLookup
      FieldName = 'DS_SITUACAO'
      LookupDataSet = qrySituacoes
      LookupKeyFields = 'CD_SITUACAO'
      LookupResultField = 'DS_SITUACAO'
      KeyFields = 'CD_SITUACAO'
      Size = 255
      Lookup = True
    end
    object qryDespesaDS_CONTA: TStringField
      FieldKind = fkLookup
      FieldName = 'DS_CONTA'
      LookupDataSet = qryPlanos
      LookupKeyFields = 'CD_CONTA;CD_COLIGADA_MATRIZ'
      LookupResultField = 'DS_CONTA'
      KeyFields = 'CD_CONTA;CD_COLIGADA_MATRIZ'
      OnChange = qryDespesaDS_CONTAChange
      Size = 255
      Lookup = True
    end
    object qryDespesaDS_CHAVE: TStringField
      FieldKind = fkLookup
      FieldName = 'DS_CHAVE'
      LookupDataSet = qryValores
      LookupKeyFields = 'CD_TIPO_DESPESA'
      LookupResultField = 'DS_CHAVE'
      KeyFields = 'CD_TIPO_DESPESA'
      Size = 255
      Lookup = True
    end
    object qryDespesaNM_FORNECEDOR: TStringField
      FieldKind = fkLookup
      FieldName = 'NM_FORNECEDOR'
      LookupDataSet = qryFornecedor
      LookupKeyFields = 'CD_PESSOA'
      LookupResultField = 'NM_PESSOA'
      KeyFields = 'CD_FORNECEDOR'
      Size = 255
      Lookup = True
    end
    object qryDespesaCD_TIPO_TITULO: TIntegerField
      FieldName = 'CD_TIPO_TITULO'
      Required = True
      OnChange = qryDespesaCD_TIPO_TITULOChange
    end
    object qryDespesaDS_TIPO_TITULO: TStringField
      FieldKind = fkLookup
      FieldName = 'DS_TIPO_TITULO'
      LookupDataSet = qryTiposTitulo
      LookupKeyFields = 'CD_TIPO_TITULO'
      LookupResultField = 'DS_TIPO_TITULO'
      KeyFields = 'CD_TIPO_TITULO'
      Lookup = True
    end
  end
  object qryValores: TUMZReadOnlyQuery
    Connection = DM.db
    SQL.Strings = (
      'SELECT'
      '  T.`CD_TIPO_DESPESA`,'
      '  V.`CD_VALOR`,'
      '  V.`DS_VALOR`,'
      '  V.`DS_CHAVE`'
      'FROM'
      '  `LGTC_TIPO_DESPESA` T'
      ''
      '    JOIN `LGTC_TD_VALOR` V ON'
      '      (T.`CD_VALOR` = V.`CD_VALOR`)')
    Params = <>
    Left = 400
    Top = 56
    object qryValoresCD_TIPO_DESPESA: TLargeintField
      FieldName = 'CD_TIPO_DESPESA'
      Required = True
    end
    object qryValoresCD_VALOR: TLargeintField
      FieldName = 'CD_VALOR'
      Required = True
    end
    object qryValoresDS_VALOR: TStringField
      FieldName = 'DS_VALOR'
      Required = True
      Size = 64
    end
    object qryValoresDS_CHAVE: TStringField
      FieldName = 'DS_CHAVE'
      Required = True
      Size = 16
    end
  end
  object qryAnexo: TUMZQuery
    Connection = DM.db
    SQL.Strings = (
      'SELECT'
      '  `CD_ANEXO`,'
      '  `CD_DESPESA`,'
      '  `NM_ARQUIVO`,'
      '  `BB_ANEXO`,'
      '  `NR_TAMANHO`'
      'FROM'
      '  `LGTC_DESPESA_ANEXO`'
      'WHERE'
      '  `CD_DESPESA` = :CD_DESPESA')
    Params = <
      item
        DataType = ftUnknown
        Name = 'CD_DESPESA'
        ParamType = ptUnknown
      end>
    Left = 272
    Top = 88
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'CD_DESPESA'
        ParamType = ptUnknown
      end>
    object qryAnexoCD_ANEXO: TLargeintField
      FieldName = 'CD_ANEXO'
      Required = True
    end
    object qryAnexoCD_DESPESA: TLargeintField
      FieldName = 'CD_DESPESA'
      Required = True
    end
    object qryAnexoNM_ARQUIVO: TStringField
      FieldName = 'NM_ARQUIVO'
      Required = True
      Size = 255
    end
    object qryAnexoBB_ANEXO: TBlobField
      FieldName = 'BB_ANEXO'
      Required = True
    end
    object qryAnexoNR_TAMANHO: TFloatField
      FieldName = 'NR_TAMANHO'
    end
  end
  object dsAnexo: TDataSource
    DataSet = qryAnexo
    Left = 240
    Top = 88
  end
  object qryValorExtra: TUMZReadOnlyQuery
    Connection = DM.db
    SQL.Strings = (
      'SELECT'
      '  C.`DS_CONTEUDO`'
      'FROM'
      '  PESSOAS_CADASTRO C'
      'WHERE'
      '  C.`CD_PESSOA` = :CD_PESSOA AND'
      '  EXISTS ('
      '    SELECT'
      '      T.`CD_TIPO_DESPESA`'
      '    FROM'
      '      `LGTC_TIPO_DESPESA` T'
      '    WHERE'
      '      C.`CD_CAMPO` = T.`CD_CAMPO` AND'
      '      T.`CD_TIPO_DESPESA` = :CD_TIPO_DESPESA'
      '  )')
    Params = <
      item
        DataType = ftUnknown
        Name = 'CD_PESSOA'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'CD_TIPO_DESPESA'
        ParamType = ptUnknown
      end>
    Left = 432
    Top = 56
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'CD_PESSOA'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'CD_TIPO_DESPESA'
        ParamType = ptUnknown
      end>
    object qryValorExtraDS_CONTEUDO: TStringField
      FieldName = 'DS_CONTEUDO'
      Size = 100
    end
  end
  object qryCargaHoraria: TUMZReadOnlyQuery
    Connection = DM.db
    SQL.Strings = (
      'SELECT'
      '  G.`VL_VALOR`'
      'FROM'
      '  `GRADES_DISCIPLINAS` G'
      'WHERE'
      '  EXISTS ('
      '    SELECT'
      '      A.`CD_DIARIO_AULA`'
      '    FROM'
      '      `DIARIO_AULAS` A'
      '        JOIN `TURMAS` T ON'
      '          (A.`TURMA` = T.`CODIGO`) AND'
      '          (A.`ANOSEMESTRE` = T.`ANOSEMESTRE`)'
      '    WHERE'
      '      G.`CD_GRADE` = T.`CD_GRADE` AND'
      '      G.`CD_CURSO` = T.`CURSO` AND'
      '      G.`CD_DISCIPLINA` = A.`DISCIPLINA` AND'
      '      G.`NR_SERIE` = T.`SERIE` AND'
      '      A.`CD_DIARIO_AULA` = :CD_DIARIO_AULA '
      '  )')
    Params = <
      item
        DataType = ftUnknown
        Name = 'CD_DIARIO_AULA'
        ParamType = ptUnknown
      end>
    Left = 464
    Top = 56
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'CD_DIARIO_AULA'
        ParamType = ptUnknown
      end>
    object qryCargaHorariaVL_VALOR: TFloatField
      FieldName = 'VL_VALOR'
    end
  end
  object qryTiposTitulo: TUMZReadOnlyQuery
    Connection = DM.db
    SQL.Strings = (
      'SELECT'
      '  `CD_TIPO_TITULO`,'
      '  `DS_TIPO_TITULO`'
      'FROM'
      '  `FIN_CONFIG_TIPOS_TITULO`'
      'WHERE'
      '  `SN_ATIVO` = 1 AND'
      '  `CT_TIPO_TITULO` = 2 AND'
      '  `CD_COLIGADA_MATRIZ` = :CD_COLIGADA')
    Params = <
      item
        DataType = ftUnknown
        Name = 'CD_COLIGADA'
        ParamType = ptUnknown
      end>
    Left = 496
    Top = 56
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'CD_COLIGADA'
        ParamType = ptUnknown
      end>
    object qryTiposTituloCD_TIPO_TITULO: TIntegerField
      FieldName = 'CD_TIPO_TITULO'
      Required = True
    end
    object qryTiposTituloDS_TIPO_TITULO: TStringField
      FieldName = 'DS_TIPO_TITULO'
      Size = 255
    end
  end
end
