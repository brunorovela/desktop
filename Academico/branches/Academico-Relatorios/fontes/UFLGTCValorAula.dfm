inherited frmLGTCValorAula: TfrmLGTCValorAula
  Width = 451
  Height = 304
  Align = alClient
  ExplicitWidth = 451
  ExplicitHeight = 304
  object lblHoraAula: TLabel [0]
    Left = 3
    Top = 3
    Width = 47
    Height = 13
    Caption = 'Hora Aula'
    FocusControl = dbeHoraAula
  end
  object lblCargaHoraria: TLabel [1]
    Left = 186
    Top = 3
    Width = 67
    Height = 13
    Caption = 'Carga Hor'#225'ria'
    FocusControl = dbeCargaHoraria
  end
  object lblTotal: TLabel [2]
    Left = 371
    Top = 3
    Width = 51
    Height = 13
    Caption = 'Valor Total'
    FocusControl = dbeTotal
  end
  object lblX: TLabel [3]
    Left = 176
    Top = 22
    Width = 7
    Height = 13
    BiDiMode = bdLeftToRight
    Caption = 'X'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentBiDiMode = False
    ParentFont = False
  end
  object lblIgual: TLabel [4]
    Left = 359
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
  object dbeHoraAula: TDBEdit [5]
    Left = 3
    Top = 19
    Width = 170
    Height = 21
    DataField = 'VL_HORA_AULA'
    DataSource = dsValor
    TabOrder = 0
  end
  object dbeCargaHoraria: TDBEdit [6]
    Left = 186
    Top = 19
    Width = 170
    Height = 21
    DataField = 'VL_CARGA_HORARIA'
    DataSource = dsValor
    TabOrder = 1
  end
  object dbeTotal: TDBEdit [7]
    Left = 371
    Top = 19
    Width = 170
    Height = 21
    DataField = 'VL_TOTAL'
    DataSource = dsValor
    TabOrder = 2
  end
  inherited cdsValor: TClientDataSet
    OnCalcFields = cdsValorCalcFields
    Left = 472
    Top = 8
    object cdsValorVL_HORA_AULA: TCurrencyField
      FieldName = 'VL_HORA_AULA'
      OnChange = cdsValorVL_HORA_AULAChange
    end
    object cdsValorVL_CARGA_HORARIA: TCurrencyField
      FieldName = 'VL_CARGA_HORARIA'
      OnChange = cdsValorVL_CARGA_HORARIAChange
      currency = False
    end
    object cdsValorVL_TOTAL: TCurrencyField
      FieldKind = fkInternalCalc
      FieldName = 'VL_TOTAL'
      OnChange = cdsValorVL_TOTALChange
    end
  end
  inherited dsValor: TDataSource
    Left = 504
    Top = 8
  end
end
