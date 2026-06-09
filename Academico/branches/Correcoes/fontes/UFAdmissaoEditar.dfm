object frmAdmissaoEditar: TfrmAdmissaoEditar
  Left = 0
  Top = 0
  BorderStyle = bsDialog
  Caption = 'Registro de Admiss'#227'o'
  ClientHeight = 327
  ClientWidth = 454
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  Padding.Left = 6
  Padding.Top = 3
  Padding.Right = 6
  Padding.Bottom = 3
  OldCreateOrder = False
  Position = poScreenCenter
  OnCloseQuery = FormCloseQuery
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object pnlDados: TPanel
    Left = 6
    Top = 3
    Width = 442
    Height = 293
    Align = alTop
    TabOrder = 0
    object lblDataAdmissao: TLabel
      Left = 8
      Top = 8
      Width = 80
      Height = 13
      Caption = 'Data Admiss'#227'o *'
      FocusControl = dtpAdmissao
    end
    object lblDataSaida: TLabel
      Left = 8
      Top = 49
      Width = 52
      Height = 13
      Caption = 'Data Sa'#237'da'
      FocusControl = dtpSaida
    end
    object lblHorasSemanais: TLabel
      Left = 8
      Top = 90
      Width = 76
      Height = 13
      Caption = 'Horas Semanais'
      FocusControl = dbeHorasSemanais
    end
    object lblObservacao: TLabel
      Left = 8
      Top = 210
      Width = 63
      Height = 13
      Caption = 'Observa'#231#245'es'
      FocusControl = dbeObservacao
    end
    object lblFuncao: TLabel
      Left = 8
      Top = 130
      Width = 44
      Height = 13
      Caption = 'Fun'#231#227'o *'
      FocusControl = dblcFuncao
    end
    object lblSituacao: TLabel
      Left = 8
      Top = 170
      Width = 50
      Height = 13
      Caption = 'Situa'#231#227'o *'
      FocusControl = dblcSituacao
    end
    object lblCodigo: TLabel
      Left = 8
      Top = 250
      Width = 104
      Height = 13
      Caption = 'C'#243'digo de Integra'#231#227'o'
      FocusControl = dbeCodigo
    end
    object dbeHorasSemanais: TDBEdit
      Left = 8
      Top = 106
      Width = 121
      Height = 21
      DataField = 'VL_HORAS_SEMANAIS'
      DataSource = dsAdmissao
      TabOrder = 2
    end
    object dbeObservacao: TDBEdit
      Left = 8
      Top = 226
      Width = 425
      Height = 21
      DataField = 'DS_OBSERVACAO'
      DataSource = dsAdmissao
      TabOrder = 5
    end
    object dblcFuncao: TDBLookupComboBox
      Left = 8
      Top = 146
      Width = 425
      Height = 21
      DataField = 'DS_FUNCAO'
      DataSource = dsAdmissao
      TabOrder = 3
    end
    object dtpAdmissao: TDatePickerEx
      Left = 8
      Top = 24
      Width = 121
      Height = 22
      MaxLength = 10
      TabOrder = 0
      Text = '14122016'
      OnExit = dtpAdmissaoExit
      OnSelectDate = dtpAdmissaoSelectDate
    end
    object dtpSaida: TDatePickerEx
      Left = 8
      Top = 65
      Width = 121
      Height = 22
      MaxLength = 10
      TabOrder = 1
      Text = '14122016'
      OnExit = dtpSaidaExit
      OnSelectDate = dtpSaidaSelectDate
    end
    object dblcSituacao: TDBLookupComboBox
      Left = 8
      Top = 186
      Width = 425
      Height = 21
      DataField = 'DS_SITUACAO'
      DataSource = dsAdmissao
      TabOrder = 4
    end
    object dbeCodigo: TDBEdit
      Left = 8
      Top = 266
      Width = 121
      Height = 21
      DataField = 'DS_CODIGO_EXTERNO'
      DataSource = dsAdmissao
      TabOrder = 6
    end
  end
  object bbtnConfirmar: TBitBtn
    Left = 269
    Top = 299
    Width = 88
    Height = 25
    Caption = 'Confirmar'
    Enabled = False
    TabOrder = 1
    Kind = bkOK
  end
  object bbtnCancelar: TBitBtn
    Left = 360
    Top = 299
    Width = 88
    Height = 25
    Caption = 'Cancelar'
    TabOrder = 2
    Kind = bkCancel
  end
  object qryAdmissao: TUMZQuery
    Connection = DM.db
    AfterOpen = qryAdmissaoAfterOpen
    SQL.Strings = (
      'SELECT'
      '  `CD_ADMISSAO`,'
      '  `CD_PESSOA`,'
      '  `CD_FUNCAO`,'
      '  `CD_SITUACAO`,'
      '  `DT_ADMISSAO`,'
      '  `DT_SAIDA`,'
      '  `VL_HORAS_SEMANAIS`,'
      '  `DS_OBSERVACAO`,'
      '  `DS_CODIGO_EXTERNO`'
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
    Left = 208
    Top = 40
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'CD_ADMISSAO'
        ParamType = ptUnknown
      end>
    object qryAdmissaoCD_ADMISSAO: TLargeintField
      FieldName = 'CD_ADMISSAO'
      Required = True
    end
    object qryAdmissaoCD_PESSOA: TIntegerField
      FieldName = 'CD_PESSOA'
      Required = True
    end
    object qryAdmissaoCD_FUNCAO: TSmallintField
      FieldName = 'CD_FUNCAO'
      Required = True
      OnChange = qryAdmissaoCD_FUNCAOChange
    end
    object qryAdmissaoDT_ADMISSAO: TDateField
      FieldName = 'DT_ADMISSAO'
    end
    object qryAdmissaoDT_SAIDA: TDateField
      FieldName = 'DT_SAIDA'
    end
    object qryAdmissaoVL_HORAS_SEMANAIS: TFloatField
      FieldName = 'VL_HORAS_SEMANAIS'
    end
    object qryAdmissaoDS_OBSERVACAO: TStringField
      FieldName = 'DS_OBSERVACAO'
      Size = 255
    end
    object qryAdmissaoDS_FUNCAO: TStringField
      FieldKind = fkLookup
      FieldName = 'DS_FUNCAO'
      LookupDataSet = qryOcupacoes
      LookupKeyFields = 'CD_FUNCAO'
      LookupResultField = 'DS_FUNCAO'
      KeyFields = 'CD_FUNCAO'
      Lookup = True
    end
    object qryAdmissaoCD_SITUACAO: TIntegerField
      FieldName = 'CD_SITUACAO'
      OnChange = qryAdmissaoCD_SITUACAOChange
    end
    object qryAdmissaoDS_SITUACAO: TStringField
      FieldKind = fkLookup
      FieldName = 'DS_SITUACAO'
      LookupDataSet = qrySituacoes
      LookupKeyFields = 'CD_SITUACAO'
      LookupResultField = 'DS_VALOR'
      KeyFields = 'CD_SITUACAO'
      Lookup = True
    end
    object qryAdmissaoDS_CODIGO_EXTERNO: TStringField
      FieldName = 'DS_CODIGO_EXTERNO'
      Size = 16
    end
  end
  object qryOcupacoes: TUMZReadOnlyQuery
    Connection = DM.db
    SortedFields = 'DS_FUNCAO'
    SQL.Strings = (
      'SELECT'
      '  `CD_FUNCAO`,'
      '  `DS_FUNCAO`'
      'FROM'
      '  `PESSOAS_OCUPACOES`')
    Params = <>
    IndexFieldNames = 'DS_FUNCAO Asc'
    Left = 208
    Top = 72
    object qryOcupacoesCD_FUNCAO: TSmallintField
      FieldName = 'CD_FUNCAO'
    end
    object qryOcupacoesDS_FUNCAO: TStringField
      FieldName = 'DS_FUNCAO'
      Size = 150
    end
  end
  object dsAdmissao: TDataSource
    DataSet = qryAdmissao
    Left = 240
    Top = 40
  end
  object qrySituacoes: TUMZReadOnlyQuery
    Connection = DM.db
    SQL.Strings = (
      'SELECT'
      '  `CD_SITUACAO`,'
      '  `DS_VALOR`'
      'FROM'
      '   `SITUACOES`'
      'WHERE'
      '  `CD_MODULO` = 1057')
    Params = <>
    Left = 208
    Top = 104
    object qrySituacoesCD_SITUACAO: TIntegerField
      FieldName = 'CD_SITUACAO'
    end
    object qrySituacoesDS_VALOR: TStringField
      FieldName = 'DS_VALOR'
      Size = 255
    end
  end
  object qryHistorico: TUMZReadOnlyQuery
    Connection = DM.db
    SQL.Strings = (
      'SELECT'
      '  MIN(`DT_INICIO`) `DT_INICIO`,'
      '  MAX(`DT_FIM`) `DT_FIM`'
      'FROM'
      '  `ADMISSAO_HISTORICO`'
      'WHERE'
      '  `CD_ADMISSAO` = :CD_ADMISSAO')
    Params = <
      item
        DataType = ftUnknown
        Name = 'CD_ADMISSAO'
        ParamType = ptUnknown
      end>
    DataSource = dsAdmissao
    Left = 208
    Top = 136
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'CD_ADMISSAO'
        ParamType = ptUnknown
      end>
    object qryHistoricoDT_INICIO: TDateField
      FieldName = 'DT_INICIO'
      ReadOnly = True
    end
    object qryHistoricoDT_FIM: TDateField
      FieldName = 'DT_FIM'
      ReadOnly = True
    end
  end
end
