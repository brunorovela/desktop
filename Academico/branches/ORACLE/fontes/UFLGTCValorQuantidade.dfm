inherited frmLGTCValorQuantidade: TfrmLGTCValorQuantidade
  Width = 451
  Height = 304
  Align = alClient
  Constraints.MinHeight = 43
  ExplicitWidth = 451
  ExplicitHeight = 304
  object lblQuantidade: TLabel [0]
    Left = 3
    Top = 3
    Width = 56
    Height = 13
    Caption = 'Quantidade'
    FocusControl = dbeQuantidade
  end
  object lblValor: TLabel [1]
    Left = 120
    Top = 3
    Width = 64
    Height = 13
    Caption = 'Valor Unit'#225'rio'
    FocusControl = dbeValor
  end
  object lblTotal: TLabel [2]
    Left = 239
    Top = 3
    Width = 51
    Height = 13
    Caption = 'Valor Total'
    FocusControl = dbeTotal
  end
  object lblX: TLabel [3]
    Left = 110
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
    Left = 227
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
  object dbeQuantidade: TDBEdit [5]
    Left = 3
    Top = 19
    Width = 104
    Height = 21
    DataField = 'NR_QUANTIDADE'
    DataSource = dsValor
    TabOrder = 0
  end
  object dbeValor: TDBEdit [6]
    Left = 120
    Top = 19
    Width = 104
    Height = 21
    DataField = 'VL_UNITARIO'
    DataSource = dsValor
    TabOrder = 1
  end
  object dbeTotal: TDBEdit [7]
    Left = 239
    Top = 19
    Width = 104
    Height = 21
    DataField = 'VL_TOTAL'
    DataSource = dsValor
    ReadOnly = True
    TabOrder = 2
  end
  inherited cdsValor: TClientDataSet
    OnCalcFields = cdsValorCalcFields
    Left = 368
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
    object cdsValorVL_TOTAL: TCurrencyField
      FieldKind = fkInternalCalc
      FieldName = 'VL_TOTAL'
      OnChange = cdsValorVL_TOTALChange
      DisplayFormat = '###,###,##0.00'
    end
  end
  inherited dsValor: TDataSource
    Left = 408
    Top = 8
  end
end
