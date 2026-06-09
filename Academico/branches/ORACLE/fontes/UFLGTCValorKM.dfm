inherited frmLGTCValorKM: TfrmLGTCValorKM
  Width = 451
  Height = 304
  Align = alClient
  Constraints.MinHeight = 43
  ExplicitWidth = 451
  ExplicitHeight = 304
  object lblQuantidade: TLabel [0]
    Left = 3
    Top = 3
    Width = 124
    Height = 13
    Caption = 'Quilometragem Percorrida'
    FocusControl = dbeQuantidade
  end
  object lblValorUnitario: TLabel [1]
    Left = 149
    Top = 3
    Width = 98
    Height = 13
    Caption = 'Custo do Quil'#244'metro'
    FocusControl = dbeValorUnitario
  end
  object lblTotal: TLabel [2]
    Left = 297
    Top = 3
    Width = 49
    Height = 13
    Caption = 'Valor total'
    FocusControl = dbeTotal
  end
  object lblX: TLabel [3]
    Left = 139
    Top = 22
    Width = 7
    Height = 13
    Caption = 'X'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object lblIgual: TLabel [4]
    Left = 285
    Top = 22
    Width = 9
    Height = 13
    Caption = '='
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object lblTipo: TLabel [5]
    Left = 433
    Top = 3
    Width = 20
    Height = 13
    Caption = 'Tipo'
    FocusControl = dblcTipo
  end
  object dbeQuantidade: TDBEdit [6]
    Left = 3
    Top = 19
    Width = 133
    Height = 21
    DataField = 'NR_QUANTIDADE'
    DataSource = dsValor
    TabOrder = 0
  end
  object dbeValorUnitario: TDBEdit [7]
    Left = 149
    Top = 19
    Width = 133
    Height = 21
    DataField = 'VL_UNITARIO'
    DataSource = dsValor
    TabOrder = 1
  end
  object dbeTotal: TDBEdit [8]
    Left = 297
    Top = 19
    Width = 133
    Height = 21
    DataField = 'VL_TOTAL'
    DataSource = dsValor
    ReadOnly = True
    TabOrder = 2
  end
  object dblcTipo: TDBLookupComboBox [9]
    Left = 433
    Top = 19
    Width = 150
    Height = 21
    DataField = 'DS_TIPO'
    DataSource = dsValor
    TabOrder = 3
  end
  inherited cdsValor: TClientDataSet
    OnCalcFields = cdsValorCalcFields
    Left = 456
    Top = 8
    object cdsValorNR_QUANTIDADE: TFloatField
      FieldName = 'NR_QUANTIDADE'
      OnChange = cdsValorNR_QUANTIDADEChange
      DisplayFormat = '###,###,##0.00'
    end
    object cdsValorVL_UNITARIO: TCurrencyField
      FieldName = 'VL_UNITARIO'
      OnChange = cdsValorVL_UNITARIOChange
      DisplayFormat = '###,###,##0.00'
    end
    object cdsValorCD_TIPO: TLargeintField
      FieldName = 'CD_TIPO'
      OnChange = cdsValorCD_TIPOChange
    end
    object cdsValorDS_TIPO: TStringField
      FieldKind = fkLookup
      FieldName = 'DS_TIPO'
      LookupDataSet = qryTipoTransporte
      LookupKeyFields = 'CD_TIPO_TRANSPORTE'
      LookupResultField = 'DS_TIPO_TRANSPORTE'
      KeyFields = 'CD_TIPO'
      Lookup = True
    end
    object cdsValorVL_TOTAL: TCurrencyField
      FieldKind = fkInternalCalc
      FieldName = 'VL_TOTAL'
      OnChange = cdsValorVL_TOTALChange
      DisplayFormat = '###,###,##0.00'
    end
  end
  inherited dsValor: TDataSource
    Left = 488
    Top = 8
  end
  object qryTipoTransporte: TUMZReadOnlyQuery
    Connection = DM.db
    SortedFields = 'DS_TIPO_TRANSPORTE'
    SQL.Strings = (
      'SELECT'
      '  `CD_TIPO_TRANSPORTE`,'
      '  `DS_TIPO_TRANSPORTE`,'
      '  `DS_CHAVE`'
      'FROM'
      '  `LGTC_TIPO_TRANSPORTE`')
    Params = <>
    IndexFieldNames = 'DS_TIPO_TRANSPORTE Asc'
    Left = 520
    Top = 8
    object qryTipoTransporteCD_TIPO_TRANSPORTE: TLargeintField
      FieldName = 'CD_TIPO_TRANSPORTE'
      Required = True
    end
    object qryTipoTransporteDS_TIPO_TRANSPORTE: TStringField
      FieldName = 'DS_TIPO_TRANSPORTE'
      Required = True
      Size = 64
    end
    object qryTipoTransporteDS_CHAVE: TStringField
      FieldName = 'DS_CHAVE'
      Required = True
      Size = 32
    end
  end
end
