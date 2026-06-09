object ReportDataModule: TReportDataModule
  OldCreateOrder = False
  OnCreate = DataModuleCreate
  Height = 401
  Width = 400
  object qryCategorias: TUMZQuery
    Connection = DM.db
    UpdateObject = updCategorias
    SQL.Strings = (
      'SELECT'
      '  C.CD_CATEGORIA,'
      '  C.CD_CATEGORIA_PAI,'
      '  C.CD_MODULO,'
      '  C.DS_CATEGORIA,'
      '  C.DS_CHAVE,'
      '  C.SN_PADRAO,'
      '  C.SN_ATIVO,'
      '  C.DT_INCLUSAO,'
      '  C.DT_ALTERACAO,'
      '  EXISTS ('
      '    SELECT'
      '      P.CD_PERMISSAO'
      '    FROM'
      '      UNI_RELATORIO_CATEGORIA_PERMISSAO P'
      '        JOIN NU_GRUPOS_PESSOAS G ON'
      '          (P.CD_GRUPO = G.CD_GRUPO)'
      '    WHERE'
      '      C.CD_CATEGORIA = P.CD_CATEGORIA AND'
      '      G.CD_PESSOA = :CD_PESSOA AND'
      '      P.SN_RENOMEAR = 1'
      '  ) SN_RENOMEAR,'
      '  EXISTS ('
      '    SELECT'
      '      P.CD_PERMISSAO'
      '    FROM'
      '      UNI_RELATORIO_CATEGORIA_PERMISSAO P'
      '        JOIN NU_GRUPOS_PESSOAS G ON'
      '          (P.CD_GRUPO = G.CD_GRUPO)'
      '    WHERE'
      '      C.CD_CATEGORIA = P.CD_CATEGORIA AND'
      '      G.CD_PESSOA = :CD_PESSOA AND'
      '      P.SN_CONCEDER = 1'
      '  ) SN_CONCEDER'
      'FROM'
      '  UNI_RELATORIO_CATEGORIA C'
      'WHERE'
      '  C.SN_ATIVO = 1 AND'
      '  ('
      '    C.SN_PADRAO = 1 OR'
      '    EXISTS ('
      '      SELECT'
      '        P.CD_PERMISSAO'
      '      FROM'
      '        UNI_RELATORIO_CATEGORIA_PERMISSAO P'
      '          JOIN NU_GRUPOS_PESSOAS G ON'
      '            (P.CD_GRUPO = G.CD_GRUPO)'
      '      WHERE'
      '        C.CD_CATEGORIA = P.CD_CATEGORIA AND'
      '        G.CD_PESSOA = :CD_PESSOA AND'
      '        P.SN_IMPRIMIR = 1'
      '    )'
      '  )')
    Params = <
      item
        DataType = ftUnknown
        Name = 'CD_PESSOA'
        ParamType = ptUnknown
      end>
    Left = 121
    Top = 112
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'CD_PESSOA'
        ParamType = ptUnknown
      end>
    object qryCategoriasCD_CATEGORIA: TLargeintField
      FieldName = 'CD_CATEGORIA'
      Required = True
    end
    object qryCategoriasCD_CATEGORIA_PAI: TLargeintField
      FieldName = 'CD_CATEGORIA_PAI'
    end
    object qryCategoriasCD_MODULO: TIntegerField
      FieldName = 'CD_MODULO'
      Required = True
    end
    object qryCategoriasDS_CATEGORIA: TStringField
      FieldName = 'DS_CATEGORIA'
      Required = True
      Size = 255
    end
    object qryCategoriasDS_CHAVE: TStringField
      FieldName = 'DS_CHAVE'
      Required = True
      Size = 64
    end
    object qryCategoriasSN_PADRAO: TSmallintField
      FieldName = 'SN_PADRAO'
      Required = True
    end
    object qryCategoriasSN_ATIVO: TSmallintField
      FieldName = 'SN_ATIVO'
      Required = True
    end
    object qryCategoriasDT_INCLUSAO: TDateTimeField
      FieldName = 'DT_INCLUSAO'
      Required = True
    end
    object qryCategoriasDT_ALTERACAO: TDateTimeField
      FieldName = 'DT_ALTERACAO'
    end
    object qryCategoriasSN_RENOMEAR: TLargeintField
      FieldName = 'SN_RENOMEAR'
      ReadOnly = True
    end
    object qryCategoriasSN_CONCEDER: TLargeintField
      FieldName = 'SN_CONCEDER'
      ReadOnly = True
    end
  end
  object qryArquivo: TUMZReadOnlyQuery
    Connection = DM.db
    SQL.Strings = (
      'SELECT'
      '  CD_ARQUIVO,'
      '  NM_ARQUIVO,'
      '  DS_CHAVE,'
      '  DS_MD5,'
      '  ME_ARQUIVO,'
      '  DT_INCLUSAO,'
      '  DT_ALTERACAO'
      'FROM'
      '  UNI_RELATORIO_ARQUIVO'
      'WHERE'
      '  CD_ARQUIVO = :CD_ARQUIVO')
    Params = <
      item
        DataType = ftUnknown
        Name = 'CD_ARQUIVO'
        ParamType = ptUnknown
      end>
    Left = 121
    Top = 56
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'CD_ARQUIVO'
        ParamType = ptUnknown
      end>
    object qryArquivoCD_ARQUIVO: TLargeintField
      FieldName = 'CD_ARQUIVO'
      Required = True
    end
    object qryArquivoNM_ARQUIVO: TStringField
      FieldName = 'NM_ARQUIVO'
      Required = True
      Size = 255
    end
    object qryArquivoDS_CHAVE: TStringField
      FieldName = 'DS_CHAVE'
      Required = True
      Size = 64
    end
    object qryArquivoDS_MD5: TStringField
      FieldName = 'DS_MD5'
      Required = True
      Size = 32
    end
    object qryArquivoME_ARQUIVO: TBlobField
      FieldName = 'ME_ARQUIVO'
      Required = True
    end
    object qryArquivoDT_INCLUSAO: TDateTimeField
      FieldName = 'DT_INCLUSAO'
      Required = True
    end
    object qryArquivoDT_ALTERACAO: TDateTimeField
      FieldName = 'DT_ALTERACAO'
      Required = True
    end
  end
  object qryFiltros: TUMZReadOnlyQuery
    Connection = DM.db
    SortedFields = 'NR_ORDEM'
    SortType = stDescending
    SQL.Strings = (
      'SELECT'
      '  CD_FILTRO,'
      '  CD_RELATORIO,'
      '  CD_SQL,'
      '  NM_FILTRO,'
      '  NR_CLASSE,'
      '  NR_ORDEM,'
      '  SN_ATIVO,'
      '  SN_OBRIGATORIO,'
      '  ME_CONFIG,'
      '  DT_INCLUSAO,'
      '  DT_ALTERACAO'
      'FROM'
      '  UNI_RELATORIO_FILTRO'
      'WHERE'
      '  CD_RELATORIO = :CD_RELATORIO AND'
      '  SN_ATIVO = 1')
    Params = <
      item
        DataType = ftUnknown
        Name = 'CD_RELATORIO'
        ParamType = ptUnknown
      end>
    IndexFieldNames = 'NR_ORDEM Desc'
    Left = 121
    Top = 168
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'CD_RELATORIO'
        ParamType = ptUnknown
      end>
    object qryFiltrosCD_FILTRO: TLargeintField
      FieldName = 'CD_FILTRO'
      Required = True
    end
    object qryFiltrosCD_RELATORIO: TLargeintField
      FieldName = 'CD_RELATORIO'
      Required = True
    end
    object qryFiltrosCD_SQL: TLargeintField
      FieldName = 'CD_SQL'
      Required = True
    end
    object qryFiltrosNM_FILTRO: TStringField
      FieldName = 'NM_FILTRO'
      Required = True
      Size = 255
    end
    object qryFiltrosNR_CLASSE: TSmallintField
      FieldName = 'NR_CLASSE'
      Required = True
    end
    object qryFiltrosNR_ORDEM: TSmallintField
      FieldName = 'NR_ORDEM'
      Required = True
    end
    object qryFiltrosSN_ATIVO: TSmallintField
      FieldName = 'SN_ATIVO'
      Required = True
    end
    object qryFiltrosSN_OBRIGATORIO: TSmallintField
      FieldName = 'SN_OBRIGATORIO'
      Required = True
    end
    object qryFiltrosME_CONFIG: TMemoField
      FieldName = 'ME_CONFIG'
      BlobType = ftMemo
    end
    object qryFiltrosDT_INCLUSAO: TDateTimeField
      FieldName = 'DT_INCLUSAO'
      Required = True
    end
    object qryFiltrosDT_ALTERACAO: TDateTimeField
      FieldName = 'DT_ALTERACAO'
    end
  end
  object qryHistorico: TUMZReadOnlyQuery
    Connection = DM.db
    SQL.Strings = (
      'SELECT'
      '  CD_HISTORICO,'
      '  CD_RELATORIO,'
      '  NM_AUTOR,'
      '  ME_DESCRICAO,'
      '  DT_INCLUSAO,'
      '  DT_ALTERACAO'
      'FROM'
      '  UNI_RELATORIO_HISTORICO'
      'WHERE'
      '  CD_RELATORIO = :CD_RELATORIO')
    Params = <
      item
        DataType = ftUnknown
        Name = 'CD_RELATORIO'
        ParamType = ptUnknown
      end>
    Left = 121
    Top = 224
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'CD_RELATORIO'
        ParamType = ptUnknown
      end>
    object qryHistoricoCD_HISTORICO: TLargeintField
      FieldName = 'CD_HISTORICO'
      Required = True
    end
    object qryHistoricoCD_RELATORIO: TLargeintField
      FieldName = 'CD_RELATORIO'
      Required = True
    end
    object qryHistoricoNM_AUTOR: TStringField
      FieldName = 'NM_AUTOR'
      Required = True
      Size = 255
    end
    object qryHistoricoME_DESCRICAO: TMemoField
      FieldName = 'ME_DESCRICAO'
      Required = True
      BlobType = ftMemo
    end
    object qryHistoricoDT_INCLUSAO: TDateTimeField
      FieldName = 'DT_INCLUSAO'
      Required = True
    end
    object qryHistoricoDT_ALTERACAO: TDateTimeField
      FieldName = 'DT_ALTERACAO'
      Required = True
    end
  end
  object qryImpressao: TUMZQuery
    Connection = DM.db
    SQL.Strings = (
      'SELECT'
      '  CD_IMPRESSAO,'
      '  CD_RELATORIO,'
      '  CD_PESSOA,'
      '  ME_FILTRO,'
      '  DT_INCLUSAO,'
      '  DT_ALTERACAO'
      'FROM'
      '  UNI_RELATORIO_IMPRESSAO'
      'WHERE'
      '  CD_RELATORIO = :CD_RELATORIO')
    Params = <
      item
        DataType = ftUnknown
        Name = 'CD_RELATORIO'
        ParamType = ptUnknown
      end>
    Left = 121
    Top = 280
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'CD_RELATORIO'
        ParamType = ptUnknown
      end>
    object qryImpressaoCD_IMPRESSAO: TLargeintField
      FieldName = 'CD_IMPRESSAO'
    end
    object qryImpressaoCD_RELATORIO: TLargeintField
      FieldName = 'CD_RELATORIO'
    end
    object qryImpressaoCD_PESSOA: TIntegerField
      FieldName = 'CD_PESSOA'
    end
    object qryImpressaoME_FILTRO: TMemoField
      FieldName = 'ME_FILTRO'
      BlobType = ftMemo
    end
    object qryImpressaoDT_INCLUSAO: TDateTimeField
      FieldName = 'DT_INCLUSAO'
    end
    object qryImpressaoDT_ALTERACAO: TDateTimeField
      FieldName = 'DT_ALTERACAO'
    end
  end
  object qryRelatorios: TUMZQuery
    Connection = DM.db
    UpdateObject = updRelatorios
    SQL.Strings = (
      'SELECT'
      '  R.CD_RELATORIO,'
      '  R.CD_RELATORIO_PAI,'
      '  R.CD_ARQUIVO,'
      '  R.CD_CATEGORIA,'
      '  R.CD_PESSOA,'
      '  R.NM_RELATORIO,'
      '  R.DS_CHAVE,'
      '  R.NR_PADRAO,'
      '  R.SN_ATIVO,'
      '  R.SN_BOLETO,'
      '  R.DS_LINK_HELP,'
      '  R.ME_DESC_PADRAO,'
      '  R.ME_DESC_CLIENTE,'
      '  R.ME_CONFIG,'
      '  R.DS_BOLETO_FILTRO_MENSALIDADE,'
      '  R.DS_BOLETO_FILTRO,'
      '  R.DT_INCLUSAO,'
      '  R.DT_ALTERACAO,'
      '  EXISTS ('
      '    SELECT'
      '      P.CD_PERMISSAO'
      '    FROM'
      '      UNI_RELATORIO_PERMISSAO P'
      '        JOIN NU_GRUPOS_PESSOAS G ON'
      '          (P.CD_GRUPO = G.CD_GRUPO)'
      '    WHERE'
      '      R.CD_RELATORIO = P.CD_RELATORIO AND'
      '      G.CD_PESSOA = :CD_PESSOA AND'
      '      P.SN_RENOMEAR = 1'
      '  ) SN_RENOMEAR,'
      '  EXISTS ('
      '    SELECT'
      '      P.CD_PERMISSAO'
      '    FROM'
      '      UNI_RELATORIO_PERMISSAO P'
      '        JOIN NU_GRUPOS_PESSOAS G ON'
      '          (P.CD_GRUPO = G.CD_GRUPO)'
      '    WHERE'
      '      R.CD_RELATORIO = P.CD_RELATORIO AND'
      '      G.CD_PESSOA = :CD_PESSOA AND'
      '      P.SN_CONCEDER = 1'
      '  ) SN_CONCEDER'
      'FROM'
      '  UNI_RELATORIO R'
      'WHERE'
      '  R.SN_ATIVO = 1 AND'
      '  ('
      '    R.NR_PADRAO = 1 OR'
      '    EXISTS ('
      '      SELECT'
      '        P.CD_PERMISSAO'
      '      FROM'
      '        UNI_RELATORIO_PERMISSAO P'
      '          JOIN NU_GRUPOS_PESSOAS G ON'
      '            (P.CD_GRUPO = G.CD_GRUPO)'
      '      WHERE'
      '        R.CD_RELATORIO = P.CD_RELATORIO AND'
      '        G.CD_PESSOA = :CD_PESSOA AND'
      '        P.SN_IMPRIMIR = 1'
      '    )'
      '  )')
    Params = <
      item
        DataType = ftUnknown
        Name = 'CD_PESSOA'
        ParamType = ptUnknown
      end>
    Left = 121
    Top = 8
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'CD_PESSOA'
        ParamType = ptUnknown
      end>
    object qryRelatoriosCD_RELATORIO: TLargeintField
      FieldName = 'CD_RELATORIO'
    end
    object qryRelatoriosCD_RELATORIO_PAI: TLargeintField
      FieldName = 'CD_RELATORIO_PAI'
    end
    object qryRelatoriosCD_ARQUIVO: TLargeintField
      FieldName = 'CD_ARQUIVO'
    end
    object qryRelatoriosCD_CATEGORIA: TLargeintField
      FieldName = 'CD_CATEGORIA'
    end
    object qryRelatoriosCD_PESSOA: TIntegerField
      FieldName = 'CD_PESSOA'
    end
    object qryRelatoriosNM_RELATORIO: TStringField
      FieldName = 'NM_RELATORIO'
      Size = 255
    end
    object qryRelatoriosDS_CHAVE: TStringField
      FieldName = 'DS_CHAVE'
      Size = 64
    end
    object qryRelatoriosNR_PADRAO: TSmallintField
      FieldName = 'NR_PADRAO'
    end
    object qryRelatoriosSN_ATIVO: TSmallintField
      FieldName = 'SN_ATIVO'
    end
    object qryRelatoriosSN_BOLETO: TSmallintField
      FieldName = 'SN_BOLETO'
    end
    object qryRelatoriosDS_LINK_HELP: TStringField
      FieldName = 'DS_LINK_HELP'
      Size = 255
    end
    object qryRelatoriosME_DESC_PADRAO: TMemoField
      FieldName = 'ME_DESC_PADRAO'
      BlobType = ftMemo
    end
    object qryRelatoriosME_DESC_CLIENTE: TMemoField
      FieldName = 'ME_DESC_CLIENTE'
      BlobType = ftMemo
    end
    object qryRelatoriosME_CONFIG: TMemoField
      FieldName = 'ME_CONFIG'
      BlobType = ftMemo
    end
    object qryRelatoriosDS_BOLETO_FILTRO_MENSALIDADE: TStringField
      FieldName = 'DS_BOLETO_FILTRO_MENSALIDADE'
      Size = 255
    end
    object qryRelatoriosDS_BOLETO_FILTRO: TStringField
      FieldName = 'DS_BOLETO_FILTRO'
      Size = 255
    end
    object qryRelatoriosDT_INCLUSAO: TDateTimeField
      FieldName = 'DT_INCLUSAO'
    end
    object qryRelatoriosDT_ALTERACAO: TDateTimeField
      FieldName = 'DT_ALTERACAO'
    end
    object qryRelatoriosSN_RENOMEAR: TLargeintField
      FieldName = 'SN_RENOMEAR'
      ReadOnly = True
    end
    object qryRelatoriosSN_CONCEDER: TLargeintField
      FieldName = 'SN_CONCEDER'
      ReadOnly = True
    end
  end
  object qrySQL: TUMZReadOnlyQuery
    Connection = DM.db
    SQL.Strings = (
      'SELECT'
      '  CD_SQL,'
      '  NM_SQL,'
      '  NM_AUTOR,'
      '  ME_CONFIG,'
      '  DT_INCLUSAO,'
      '  DT_ALTERACAO'
      'FROM'
      '  UNI_RELATORIO_SQL'
      'WHERE'
      '  CD_SQL = :CD_SQL')
    Params = <
      item
        DataType = ftUnknown
        Name = 'CD_SQL'
        ParamType = ptUnknown
      end>
    Left = 121
    Top = 328
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'CD_SQL'
        ParamType = ptUnknown
      end>
    object qrySQLCD_SQL: TLargeintField
      FieldName = 'CD_SQL'
      Required = True
    end
    object qrySQLNM_SQL: TStringField
      FieldName = 'NM_SQL'
      Required = True
      Size = 255
    end
    object qrySQLNM_AUTOR: TStringField
      FieldName = 'NM_AUTOR'
      Required = True
      Size = 255
    end
    object qrySQLME_CONFIG: TMemoField
      FieldName = 'ME_CONFIG'
      BlobType = ftMemo
    end
    object qrySQLDT_INCLUSAO: TDateTimeField
      FieldName = 'DT_INCLUSAO'
      Required = True
    end
    object qrySQLDT_ALTERACAO: TDateTimeField
      FieldName = 'DT_ALTERACAO'
    end
  end
  object dspRelatorios: TDataSetProvider
    DataSet = qryRelatorios
    Left = 216
    Top = 8
  end
  object dspArquivo: TDataSetProvider
    DataSet = qryArquivo
    Left = 216
    Top = 56
  end
  object dspCategorias: TDataSetProvider
    DataSet = qryCategorias
    Left = 216
    Top = 112
  end
  object dspFiltros: TDataSetProvider
    DataSet = qryFiltros
    Left = 216
    Top = 168
  end
  object dspHistorico: TDataSetProvider
    DataSet = qryHistorico
    Left = 216
    Top = 224
  end
  object dspImpressao: TDataSetProvider
    DataSet = qryImpressao
    Left = 216
    Top = 280
  end
  object dspSQL: TDataSetProvider
    DataSet = qrySQL
    Left = 216
    Top = 328
  end
  object cdsRelatorios: TClientDataSet
    Aggregates = <>
    FieldDefs = <
      item
        Name = 'CD_RELATORIO'
        Attributes = [faRequired]
        DataType = ftLargeint
      end
      item
        Name = 'CD_RELATORIO_PAI'
        DataType = ftLargeint
      end
      item
        Name = 'CD_ARQUIVO'
        Attributes = [faRequired]
        DataType = ftLargeint
      end
      item
        Name = 'CD_CATEGORIA'
        Attributes = [faRequired]
        DataType = ftLargeint
      end
      item
        Name = 'CD_PESSOA'
        DataType = ftInteger
      end
      item
        Name = 'NM_RELATORIO'
        Attributes = [faRequired]
        DataType = ftString
        Size = 255
      end
      item
        Name = 'DS_CHAVE'
        DataType = ftString
        Size = 64
      end
      item
        Name = 'NR_PADRAO'
        Attributes = [faRequired]
        DataType = ftSmallint
      end
      item
        Name = 'SN_ATIVO'
        Attributes = [faRequired]
        DataType = ftSmallint
      end
      item
        Name = 'SN_BOLETO'
        Attributes = [faRequired]
        DataType = ftSmallint
      end
      item
        Name = 'DS_LINK_HELP'
        DataType = ftString
        Size = 255
      end
      item
        Name = 'ME_DESC_PADRAO'
        DataType = ftMemo
      end
      item
        Name = 'ME_DESC_CLIENTE'
        DataType = ftMemo
      end
      item
        Name = 'ME_CONFIG'
        DataType = ftMemo
      end
      item
        Name = 'DS_BOLETO_FILTRO_MENSALIDADE'
        DataType = ftString
        Size = 255
      end
      item
        Name = 'DS_BOLETO_FILTRO'
        DataType = ftString
        Size = 255
      end
      item
        Name = 'DT_INCLUSAO'
        Attributes = [faRequired]
        DataType = ftDateTime
      end
      item
        Name = 'DT_ALTERACAO'
        DataType = ftDateTime
      end
      item
        Name = 'SN_RENOMEAR'
        Attributes = [faReadonly]
        DataType = ftLargeint
      end
      item
        Name = 'SN_CONCEDER'
        Attributes = [faReadonly]
        DataType = ftLargeint
      end>
    IndexDefs = <
      item
        Name = 'DEFAULT_INDEX'
        Fields = 'NM_RELATORIO'
      end>
    IndexFieldNames = 'NM_RELATORIO'
    Params = <
      item
        DataType = ftUnknown
        Name = 'CD_PESSOA'
        ParamType = ptUnknown
      end>
    ProviderName = 'dspRelatorios'
    StoreDefs = True
    Left = 320
    Top = 8
    object cdsRelatoriosCD_RELATORIO: TLargeintField
      FieldName = 'CD_RELATORIO'
    end
    object cdsRelatoriosCD_RELATORIO_PAI: TLargeintField
      FieldName = 'CD_RELATORIO_PAI'
    end
    object cdsRelatoriosCD_ARQUIVO: TLargeintField
      FieldName = 'CD_ARQUIVO'
    end
    object cdsRelatoriosCD_CATEGORIA: TLargeintField
      FieldName = 'CD_CATEGORIA'
    end
    object cdsRelatoriosCD_PESSOA: TIntegerField
      FieldName = 'CD_PESSOA'
    end
    object cdsRelatoriosNM_RELATORIO: TStringField
      FieldName = 'NM_RELATORIO'
      Size = 255
    end
    object cdsRelatoriosDS_CHAVE: TStringField
      FieldName = 'DS_CHAVE'
      Size = 64
    end
    object cdsRelatoriosNR_PADRAO: TSmallintField
      FieldName = 'NR_PADRAO'
    end
    object cdsRelatoriosSN_ATIVO: TSmallintField
      FieldName = 'SN_ATIVO'
    end
    object cdsRelatoriosSN_BOLETO: TSmallintField
      FieldName = 'SN_BOLETO'
    end
    object cdsRelatoriosDS_LINK_HELP: TStringField
      FieldName = 'DS_LINK_HELP'
      Size = 255
    end
    object cdsRelatoriosME_DESC_PADRAO: TMemoField
      FieldName = 'ME_DESC_PADRAO'
      BlobType = ftMemo
    end
    object cdsRelatoriosME_DESC_CLIENTE: TMemoField
      FieldName = 'ME_DESC_CLIENTE'
      BlobType = ftMemo
    end
    object cdsRelatoriosME_CONFIG: TMemoField
      FieldName = 'ME_CONFIG'
      BlobType = ftMemo
    end
    object cdsRelatoriosDS_BOLETO_FILTRO_MENSALIDADE: TStringField
      FieldName = 'DS_BOLETO_FILTRO_MENSALIDADE'
      Size = 255
    end
    object cdsRelatoriosDS_BOLETO_FILTRO: TStringField
      FieldName = 'DS_BOLETO_FILTRO'
      Size = 255
    end
    object cdsRelatoriosDT_INCLUSAO: TDateTimeField
      FieldName = 'DT_INCLUSAO'
    end
    object cdsRelatoriosDT_ALTERACAO: TDateTimeField
      FieldName = 'DT_ALTERACAO'
    end
    object cdsRelatoriosSN_RENOMEAR: TLargeintField
      FieldName = 'SN_RENOMEAR'
      ReadOnly = True
    end
    object cdsRelatoriosSN_CONCEDER: TLargeintField
      FieldName = 'SN_CONCEDER'
      ReadOnly = True
    end
  end
  object cdsArquivo: TClientDataSet
    Aggregates = <>
    Params = <
      item
        DataType = ftUnknown
        Name = 'CD_ARQUIVO'
        ParamType = ptUnknown
      end>
    ProviderName = 'dspArquivo'
    Left = 320
    Top = 56
    object cdsArquivoCD_ARQUIVO: TLargeintField
      FieldName = 'CD_ARQUIVO'
      Required = True
    end
    object cdsArquivoNM_ARQUIVO: TStringField
      FieldName = 'NM_ARQUIVO'
      Required = True
      Size = 255
    end
    object cdsArquivoDS_CHAVE: TStringField
      FieldName = 'DS_CHAVE'
      Required = True
      Size = 64
    end
    object cdsArquivoDS_MD5: TStringField
      FieldName = 'DS_MD5'
      Required = True
      Size = 32
    end
    object cdsArquivoME_ARQUIVO: TBlobField
      FieldName = 'ME_ARQUIVO'
      Required = True
    end
    object cdsArquivoDT_INCLUSAO: TDateTimeField
      FieldName = 'DT_INCLUSAO'
      Required = True
    end
    object cdsArquivoDT_ALTERACAO: TDateTimeField
      FieldName = 'DT_ALTERACAO'
      Required = True
    end
  end
  object cdsCategorias: TClientDataSet
    Aggregates = <>
    FieldDefs = <
      item
        Name = 'CD_CATEGORIA'
        Attributes = [faRequired]
        DataType = ftLargeint
      end
      item
        Name = 'CD_CATEGORIA_PAI'
        DataType = ftLargeint
      end
      item
        Name = 'CD_MODULO'
        Attributes = [faRequired]
        DataType = ftInteger
      end
      item
        Name = 'DS_CATEGORIA'
        Attributes = [faRequired]
        DataType = ftString
        Size = 255
      end
      item
        Name = 'DS_CHAVE'
        Attributes = [faRequired]
        DataType = ftString
        Size = 64
      end
      item
        Name = 'SN_PADRAO'
        Attributes = [faRequired]
        DataType = ftSmallint
      end
      item
        Name = 'SN_ATIVO'
        Attributes = [faRequired]
        DataType = ftSmallint
      end
      item
        Name = 'DT_INCLUSAO'
        Attributes = [faRequired]
        DataType = ftDateTime
      end
      item
        Name = 'DT_ALTERACAO'
        DataType = ftDateTime
      end
      item
        Name = 'SN_RENOMEAR'
        Attributes = [faReadonly]
        DataType = ftLargeint
      end
      item
        Name = 'SN_CONCEDER'
        Attributes = [faReadonly]
        DataType = ftLargeint
      end>
    IndexDefs = <
      item
        Name = 'DEFAULT_INDEX'
        Fields = 'DS_CATEGORIA'
      end>
    IndexFieldNames = 'DS_CATEGORIA'
    Params = <
      item
        DataType = ftUnknown
        Name = 'CD_PESSOA'
        ParamType = ptUnknown
      end>
    ProviderName = 'dspCategorias'
    StoreDefs = True
    Left = 320
    Top = 112
    object cdsCategoriasCD_CATEGORIA: TLargeintField
      FieldName = 'CD_CATEGORIA'
      Required = True
    end
    object cdsCategoriasCD_CATEGORIA_PAI: TLargeintField
      FieldName = 'CD_CATEGORIA_PAI'
    end
    object cdsCategoriasCD_MODULO: TIntegerField
      FieldName = 'CD_MODULO'
      Required = True
    end
    object cdsCategoriasDS_CATEGORIA: TStringField
      FieldName = 'DS_CATEGORIA'
      Required = True
      Size = 255
    end
    object cdsCategoriasDS_CHAVE: TStringField
      FieldName = 'DS_CHAVE'
      Required = True
      Size = 64
    end
    object cdsCategoriasSN_PADRAO: TSmallintField
      FieldName = 'SN_PADRAO'
      Required = True
    end
    object cdsCategoriasSN_ATIVO: TSmallintField
      FieldName = 'SN_ATIVO'
      Required = True
    end
    object cdsCategoriasDT_INCLUSAO: TDateTimeField
      FieldName = 'DT_INCLUSAO'
      Required = True
    end
    object cdsCategoriasDT_ALTERACAO: TDateTimeField
      FieldName = 'DT_ALTERACAO'
    end
    object cdsCategoriasSN_RENOMEAR: TLargeintField
      FieldName = 'SN_RENOMEAR'
      ReadOnly = True
    end
    object cdsCategoriasSN_CONCEDER: TLargeintField
      FieldName = 'SN_CONCEDER'
      ReadOnly = True
    end
  end
  object cdsFiltros: TClientDataSet
    Aggregates = <>
    Params = <
      item
        DataType = ftUnknown
        Name = 'CD_RELATORIO'
        ParamType = ptUnknown
      end>
    ProviderName = 'dspFiltros'
    Left = 320
    Top = 168
    object cdsFiltrosCD_FILTRO: TLargeintField
      FieldName = 'CD_FILTRO'
      Required = True
    end
    object cdsFiltrosCD_RELATORIO: TLargeintField
      FieldName = 'CD_RELATORIO'
      Required = True
    end
    object cdsFiltrosCD_SQL: TLargeintField
      FieldName = 'CD_SQL'
      Required = True
    end
    object cdsFiltrosNM_FILTRO: TStringField
      FieldName = 'NM_FILTRO'
      Required = True
      Size = 255
    end
    object cdsFiltrosNR_CLASSE: TSmallintField
      FieldName = 'NR_CLASSE'
      Required = True
    end
    object cdsFiltrosNR_ORDEM: TSmallintField
      FieldName = 'NR_ORDEM'
      Required = True
    end
    object cdsFiltrosSN_ATIVO: TSmallintField
      FieldName = 'SN_ATIVO'
      Required = True
    end
    object cdsFiltrosSN_OBRIGATORIO: TSmallintField
      FieldName = 'SN_OBRIGATORIO'
      Required = True
    end
    object cdsFiltrosME_CONFIG: TMemoField
      FieldName = 'ME_CONFIG'
      BlobType = ftMemo
    end
    object cdsFiltrosDT_INCLUSAO: TDateTimeField
      FieldName = 'DT_INCLUSAO'
      Required = True
    end
    object cdsFiltrosDT_ALTERACAO: TDateTimeField
      FieldName = 'DT_ALTERACAO'
    end
  end
  object cdsHistorico: TClientDataSet
    Aggregates = <>
    Params = <
      item
        DataType = ftUnknown
        Name = 'CD_RELATORIO'
        ParamType = ptUnknown
      end>
    ProviderName = 'dspHistorico'
    Left = 320
    Top = 224
    object cdsHistoricoCD_HISTORICO: TLargeintField
      FieldName = 'CD_HISTORICO'
      Required = True
    end
    object cdsHistoricoCD_RELATORIO: TLargeintField
      FieldName = 'CD_RELATORIO'
      Required = True
    end
    object cdsHistoricoNM_AUTOR: TStringField
      FieldName = 'NM_AUTOR'
      Required = True
      Size = 255
    end
    object cdsHistoricoME_DESCRICAO: TMemoField
      FieldName = 'ME_DESCRICAO'
      Required = True
      BlobType = ftMemo
    end
    object cdsHistoricoDT_INCLUSAO: TDateTimeField
      FieldName = 'DT_INCLUSAO'
      Required = True
    end
    object cdsHistoricoDT_ALTERACAO: TDateTimeField
      FieldName = 'DT_ALTERACAO'
      Required = True
    end
  end
  object cdsImpressao: TClientDataSet
    Aggregates = <>
    Params = <
      item
        DataType = ftUnknown
        Name = 'CD_RELATORIO'
        ParamType = ptUnknown
      end>
    ProviderName = 'dspImpressao'
    Left = 320
    Top = 280
    object cdsImpressaoCD_IMPRESSAO: TLargeintField
      FieldName = 'CD_IMPRESSAO'
    end
    object cdsImpressaoCD_RELATORIO: TLargeintField
      FieldName = 'CD_RELATORIO'
    end
    object cdsImpressaoCD_PESSOA: TIntegerField
      FieldName = 'CD_PESSOA'
    end
    object cdsImpressaoME_FILTRO: TMemoField
      FieldName = 'ME_FILTRO'
      BlobType = ftMemo
    end
    object cdsImpressaoDT_INCLUSAO: TDateTimeField
      FieldName = 'DT_INCLUSAO'
    end
    object cdsImpressaoDT_ALTERACAO: TDateTimeField
      FieldName = 'DT_ALTERACAO'
    end
  end
  object cdsSQL: TClientDataSet
    Aggregates = <>
    Params = <
      item
        DataType = ftUnknown
        Name = 'CD_SQL'
        ParamType = ptUnknown
      end>
    ProviderName = 'dspSQL'
    Left = 320
    Top = 328
    object cdsSQLCD_SQL: TLargeintField
      FieldName = 'CD_SQL'
      Required = True
    end
    object cdsSQLNM_SQL: TStringField
      FieldName = 'NM_SQL'
      Required = True
      Size = 255
    end
    object cdsSQLNM_AUTOR: TStringField
      FieldName = 'NM_AUTOR'
      Required = True
      Size = 255
    end
    object cdsSQLME_CONFIG: TMemoField
      FieldName = 'ME_CONFIG'
      BlobType = ftMemo
    end
    object cdsSQLDT_INCLUSAO: TDateTimeField
      FieldName = 'DT_INCLUSAO'
      Required = True
    end
    object cdsSQLDT_ALTERACAO: TDateTimeField
      FieldName = 'DT_ALTERACAO'
    end
  end
  object updRelatorios: TZUpdateSQL
    ModifySQL.Strings = (
      'UPDATE'
      '        UNI_RELATORIO'
      'SET'
      '        NM_RELATORIO = :NM_RELATORIO'
      'WHERE'
      '        CD_RELATORIO = :CD_RELATORIO')
    UseSequenceFieldForRefreshSQL = False
    Left = 32
    Top = 8
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'NM_RELATORIO'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'CD_RELATORIO'
        ParamType = ptUnknown
      end>
  end
  object updCategorias: TZUpdateSQL
    ModifySQL.Strings = (
      'UPDATE'
      '        UNI_RELATORIO_CATEGORIA'
      'SET'
      '        DS_CATEGORIA = :DS_CATEGORIA'
      'WHERE'
      '        CD_CATEGORIA = :CD_CATEGORIA')
    UseSequenceFieldForRefreshSQL = False
    Left = 32
    Top = 112
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'DS_CATEGORIA'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'CD_CATEGORIA'
        ParamType = ptUnknown
      end>
  end
end
