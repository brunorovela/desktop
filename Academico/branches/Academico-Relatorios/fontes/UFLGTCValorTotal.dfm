inherited frmLGTCValorTotal: TfrmLGTCValorTotal
  Width = 451
  Height = 304
  Align = alClient
  Constraints.MinHeight = 43
  ExplicitWidth = 451
  ExplicitHeight = 304
  object lvlTotal: TLabel [0]
    Left = 3
    Top = 3
    Width = 24
    Height = 13
    Caption = 'Total'
    FocusControl = dbeTotal
  end
  object dbeTotal: TDBEdit [1]
    Left = 3
    Top = 19
    Width = 104
    Height = 21
    DataField = 'VL_TOTAL'
    DataSource = dsValor
    TabOrder = 0
  end
  inherited cdsValor: TClientDataSet
    Left = 200
    Top = 16
    object cdsValorVL_TOTAL: TCurrencyField
      FieldName = 'VL_TOTAL'
      OnChange = cdsValorVL_TOTALChange
      DisplayFormat = '###,###,##0.00'
    end
  end
  inherited dsValor: TDataSource
    Left = 232
    Top = 16
  end
end
