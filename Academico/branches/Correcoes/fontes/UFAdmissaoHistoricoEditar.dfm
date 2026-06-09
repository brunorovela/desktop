object frmAdmissaoHistoricoEditar: TfrmAdmissaoHistoricoEditar
  Left = 0
  Top = 0
  BorderStyle = bsDialog
  Caption = 'Registro de Hist'#243'rico Admissional'
  ClientHeight = 351
  ClientWidth = 454
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  Padding.Left = 8
  Padding.Top = 3
  Padding.Right = 8
  Padding.Bottom = 3
  OldCreateOrder = False
  Position = poScreenCenter
  OnCloseQuery = FormCloseQuery
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object pnlDados: TPanel
    Left = 8
    Top = 3
    Width = 438
    Height = 317
    Align = alTop
    TabOrder = 0
    object lblDataInicio: TLabel
      Left = 8
      Top = 8
      Width = 34
      Height = 13
      Caption = 'In'#237'cio *'
      FocusControl = dtpInicio
    end
    object lblDataFim: TLabel
      Left = 8
      Top = 49
      Width = 16
      Height = 13
      Caption = 'Fim'
      FocusControl = dtpFim
    end
    object lblRegime: TLabel
      Left = 8
      Top = 90
      Width = 104
      Height = 13
      Caption = 'Regime de Trabalho *'
      FocusControl = dblcRegime
    end
    object bvlAreas: TBevel
      Left = 8
      Top = 130
      Width = 336
      Height = 19
      Shape = bsBottomLine
    end
    object lblAreas: TLabel
      Left = 8
      Top = 133
      Width = 28
      Height = 13
      Caption = #193'reas'
    end
    object dblcRegime: TDBLookupComboBox
      Left = 8
      Top = 106
      Width = 336
      Height = 21
      DataField = 'DS_REGIME'
      DataSource = dsHistorico
      TabOrder = 2
    end
    object dtpInicio: TDatePickerEx
      Left = 8
      Top = 24
      Width = 121
      Height = 22
      MaxLength = 10
      TabOrder = 0
      Text = '14122016'
      OnExit = dtpInicioExit
      OnSelectDate = dtpInicioSelectDate
    end
    object dtpFim: TDatePickerEx
      Left = 8
      Top = 65
      Width = 121
      Height = 22
      MaxLength = 10
      TabOrder = 1
      Text = '14122016'
      OnExit = dtpFimExit
      OnSelectDate = dtpFimSelectDate
    end
    object dbckSequencial: TDBCheckBox
      Left = 8
      Top = 152
      Width = 136
      Height = 17
      Caption = 'Sequencial'
      DataField = 'SN_SEQUENCIAL'
      DataSource = dsHistorico
      TabOrder = 3
      ValueChecked = '1'
      ValueUnchecked = '0'
    end
    object dbckGraduacaoPresencial: TDBCheckBox
      Left = 8
      Top = 172
      Width = 136
      Height = 17
      Caption = 'Gradua'#231#227'o Presencial'
      DataField = 'SN_GRADUACAO_PRESENCIAL'
      DataSource = dsHistorico
      TabOrder = 4
      ValueChecked = '1'
      ValueUnchecked = '0'
    end
    object dbckGraduacaoDistancia: TDBCheckBox
      Left = 8
      Top = 192
      Width = 136
      Height = 17
      Caption = 'Gradua'#231#227'o '#224' Dist'#226'ncia'
      DataField = 'SN_GRADUACAO_DISTANCIA'
      DataSource = dsHistorico
      TabOrder = 5
      ValueChecked = '1'
      ValueUnchecked = '0'
    end
    object dbckPosPresencial: TDBCheckBox
      Left = 8
      Top = 212
      Width = 136
      Height = 17
      Caption = 'P'#243's Presencial'
      DataField = 'SN_POS_PRESENCIAL'
      DataSource = dsHistorico
      TabOrder = 6
      ValueChecked = '1'
      ValueUnchecked = '0'
    end
    object dbckPosDistancia: TDBCheckBox
      Left = 8
      Top = 232
      Width = 136
      Height = 17
      Caption = 'P'#243's '#224' Dist'#226'ncia'
      DataField = 'SN_POS_DISTANCIA'
      DataSource = dsHistorico
      TabOrder = 7
      ValueChecked = '1'
      ValueUnchecked = '0'
    end
    object dbckPesquisa: TDBCheckBox
      Left = 8
      Top = 252
      Width = 136
      Height = 17
      Caption = 'Pesquisa'
      DataField = 'SN_PESQUISA'
      DataSource = dsHistorico
      TabOrder = 8
      ValueChecked = '1'
      ValueUnchecked = '0'
    end
    object dbckExtensao: TDBCheckBox
      Left = 8
      Top = 272
      Width = 136
      Height = 17
      Caption = 'Extens'#227'o'
      DataField = 'SN_EXTENSAO'
      DataSource = dsHistorico
      TabOrder = 9
      ValueChecked = '1'
      ValueUnchecked = '0'
    end
    object dbckGestao: TDBCheckBox
      Left = 8
      Top = 292
      Width = 136
      Height = 17
      Caption = 'Gest'#227'o'
      DataField = 'SN_GESTAO'
      DataSource = dsHistorico
      TabOrder = 10
      ValueChecked = '1'
      ValueUnchecked = '0'
    end
  end
  object bbtnConfirmar: TBitBtn
    Left = 267
    Top = 323
    Width = 88
    Height = 25
    Caption = 'Confirmar'
    Enabled = False
    TabOrder = 1
    Kind = bkOK
  end
  object bbtnCancelar: TBitBtn
    Left = 358
    Top = 323
    Width = 88
    Height = 25
    Caption = 'Cancelar'
    TabOrder = 2
    Kind = bkCancel
  end
  object qryHistorico: TUMZQuery
    Connection = DM.db
    AfterOpen = qryHistoricoAfterOpen
    SQL.Strings = (
      'SELECT'
      '  `CD_ADMISSAO_HISTORICO`,'
      '  `CD_ADMISSAO`,'
      '  `CD_REGIME`,'
      '  `DT_INICIO`,'
      '  `DT_FIM`,'
      '  `SN_SEQUENCIAL`,'
      '  `SN_GRADUACAO_PRESENCIAL`,'
      '  `SN_GRADUACAO_DISTANCIA`,'
      '  `SN_POS_PRESENCIAL`,'
      '  `SN_POS_DISTANCIA`,'
      '  `SN_PESQUISA`,'
      '  `SN_EXTENSAO`,'
      '  `SN_GESTAO`'
      'FROM'
      '  `ADMISSAO_HISTORICO`'
      'WHERE'
      '  `CD_ADMISSAO_HISTORICO` = :CD_ADMISSAO_HISTORICO')
    Params = <
      item
        DataType = ftUnknown
        Name = 'CD_ADMISSAO_HISTORICO'
        ParamType = ptUnknown
      end>
    Left = 232
    Top = 40
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'CD_ADMISSAO_HISTORICO'
        ParamType = ptUnknown
      end>
    object qryHistoricoCD_ADMISSAO_HISTORICO: TLargeintField
      FieldName = 'CD_ADMISSAO_HISTORICO'
      Required = True
    end
    object qryHistoricoCD_ADMISSAO: TLargeintField
      FieldName = 'CD_ADMISSAO'
      Required = True
    end
    object qryHistoricoCD_REGIME: TIntegerField
      FieldName = 'CD_REGIME'
      Required = True
      OnChange = qryHistoricoCD_REGIMEChange
    end
    object qryHistoricoDT_INICIO: TDateField
      FieldName = 'DT_INICIO'
      Required = True
    end
    object qryHistoricoDT_FIM: TDateField
      FieldName = 'DT_FIM'
    end
    object qryHistoricoSN_SEQUENCIAL: TSmallintField
      FieldName = 'SN_SEQUENCIAL'
      Required = True
    end
    object qryHistoricoSN_GRADUACAO_PRESENCIAL: TSmallintField
      FieldName = 'SN_GRADUACAO_PRESENCIAL'
      Required = True
    end
    object qryHistoricoSN_GRADUACAO_DISTANCIA: TSmallintField
      FieldName = 'SN_GRADUACAO_DISTANCIA'
      Required = True
    end
    object qryHistoricoSN_POS_PRESENCIAL: TSmallintField
      FieldName = 'SN_POS_PRESENCIAL'
      Required = True
    end
    object qryHistoricoSN_POS_DISTANCIA: TSmallintField
      FieldName = 'SN_POS_DISTANCIA'
      Required = True
    end
    object qryHistoricoSN_PESQUISA: TSmallintField
      FieldName = 'SN_PESQUISA'
      Required = True
    end
    object qryHistoricoSN_EXTENSAO: TSmallintField
      FieldName = 'SN_EXTENSAO'
      Required = True
    end
    object qryHistoricoSN_GESTAO: TSmallintField
      FieldName = 'SN_GESTAO'
      Required = True
    end
    object qryHistoricoDS_REGIME: TStringField
      FieldKind = fkLookup
      FieldName = 'DS_REGIME'
      LookupDataSet = qryRegimes
      LookupKeyFields = 'CD_REGIME'
      LookupResultField = 'DS_REGIME'
      KeyFields = 'CD_REGIME'
      Lookup = True
    end
  end
  object qryRegimes: TUMZReadOnlyQuery
    Connection = DM.db
    SortedFields = 'DS_REGIME'
    SQL.Strings = (
      'SELECT'
      '  `CD_REGIME`,'
      '  `DS_REGIME`'
      'FROM'
      '  `FUNCIONARIOS_TIPOS_REGIMES`')
    Params = <>
    IndexFieldNames = 'DS_REGIME Asc'
    Left = 232
    Top = 72
    object qryRegimesCD_REGIME: TIntegerField
      FieldName = 'CD_REGIME'
    end
    object qryRegimesDS_REGIME: TStringField
      FieldName = 'DS_REGIME'
      Size = 50
    end
  end
  object dsHistorico: TDataSource
    DataSet = qryHistorico
    Left = 264
    Top = 40
  end
  object qryHistoricoAnterior: TUMZReadOnlyQuery
    Connection = DM.db
    SQL.Strings = (
      'SELECT'
      '  `CD_REGIME`,'
      '  `SN_SEQUENCIAL`,'
      '  `SN_GRADUACAO_PRESENCIAL`,'
      '  `SN_GRADUACAO_DISTANCIA`,'
      '  `SN_POS_PRESENCIAL`,'
      '  `SN_POS_DISTANCIA`,'
      '  `SN_PESQUISA`,'
      '  `SN_EXTENSAO`,'
      '  `SN_GESTAO`'
      'FROM'
      '  `ADMISSAO_HISTORICO`'
      'WHERE'
      '  `CD_ADMISSAO` = :CD_ADMISSAO'
      'ORDER BY'
      '  `DT_INICIO` DESC,'
      '  `DT_FIM` DESC,'
      '  `CD_ADMISSAO_HISTORICO` DESC'
      'LIMIT 1')
    Params = <
      item
        DataType = ftUnknown
        Name = 'CD_ADMISSAO'
        ParamType = ptUnknown
      end>
    Left = 232
    Top = 104
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'CD_ADMISSAO'
        ParamType = ptUnknown
      end>
    object qryHistoricoAnteriorCD_REGIME: TIntegerField
      FieldName = 'CD_REGIME'
      Required = True
    end
    object qryHistoricoAnteriorSN_SEQUENCIAL: TSmallintField
      FieldName = 'SN_SEQUENCIAL'
      Required = True
    end
    object qryHistoricoAnteriorSN_GRADUACAO_PRESENCIAL: TSmallintField
      FieldName = 'SN_GRADUACAO_PRESENCIAL'
      Required = True
    end
    object qryHistoricoAnteriorSN_GRADUACAO_DISTANCIA: TSmallintField
      FieldName = 'SN_GRADUACAO_DISTANCIA'
      Required = True
    end
    object qryHistoricoAnteriorSN_POS_PRESENCIAL: TSmallintField
      FieldName = 'SN_POS_PRESENCIAL'
      Required = True
    end
    object qryHistoricoAnteriorSN_POS_DISTANCIA: TSmallintField
      FieldName = 'SN_POS_DISTANCIA'
      Required = True
    end
    object qryHistoricoAnteriorSN_PESQUISA: TSmallintField
      FieldName = 'SN_PESQUISA'
      Required = True
    end
    object qryHistoricoAnteriorSN_EXTENSAO: TSmallintField
      FieldName = 'SN_EXTENSAO'
      Required = True
    end
    object qryHistoricoAnteriorSN_GESTAO: TSmallintField
      FieldName = 'SN_GESTAO'
      Required = True
    end
  end
  object qryInserirCampos: TUMZQuery
    Connection = DM.db
    SQL.Strings = (
      
        'INSERT INTO `ADMISSAO_HISTORICO_CAMPO` (`CD_ADMISSAO_HISTORICO`,' +
        ' `CD_ADMISSAO_CAMPO`)'
      'SELECT'
      '  :CD_ADMISSAO_HISTORICO,'
      '  `CD_ADMISSAO_CAMPO`'
      'FROM'
      '  `ADMISSAO_CAMPO`')
    Params = <
      item
        DataType = ftUnknown
        Name = 'CD_ADMISSAO_HISTORICO'
        ParamType = ptUnknown
      end>
    Left = 232
    Top = 136
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'CD_ADMISSAO_HISTORICO'
        ParamType = ptUnknown
      end>
  end
  object qryAdmissao: TUMZReadOnlyQuery
    Connection = DM.db
    SQL.Strings = (
      'SELECT'
      '  `DT_ADMISSAO`,'
      '  `DT_SAIDA`'
      'FROM'
      '  `ADMISSAO`'
      'WHERE'
      '  `CD_ADMISSAO` = :CD_ADMISSAO')
    Params = <
      item
        DataType = ftUnknown
        Name = 'CD_ADMISSAO'
        ParamType = ptUnknown
      end>
    Left = 232
    Top = 168
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'CD_ADMISSAO'
        ParamType = ptUnknown
      end>
    object qryAdmissaoDT_ADMISSAO: TDateField
      FieldName = 'DT_ADMISSAO'
    end
    object qryAdmissaoDT_SAIDA: TDateField
      FieldName = 'DT_SAIDA'
    end
  end
end
