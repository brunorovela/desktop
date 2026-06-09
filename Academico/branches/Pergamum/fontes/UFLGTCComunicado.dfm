object frmLGTCComunicado: TfrmLGTCComunicado
  Left = 0
  Top = 0
  BorderStyle = bsDialog
  Caption = 'Enviar comunicados'
  ClientHeight = 435
  ClientWidth = 436
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
  OnClose = FormClose
  PixelsPerInch = 96
  TextHeight = 13
  object pnlDados: TPanel
    Left = 6
    Top = 3
    Width = 424
    Height = 429
    Align = alClient
    TabOrder = 0
    object lblObjetivo: TLabel
      Left = 6
      Top = 3
      Width = 41
      Height = 13
      Caption = 'Objetivo'
      FocusControl = dblcObjetivo
    end
    object lblEnviarPara: TLabel
      Left = 6
      Top = 43
      Width = 55
      Height = 13
      Caption = 'Enviar para'
    end
    object lblOrientacao: TLabel
      Left = 6
      Top = 181
      Width = 387
      Height = 26
      Caption = 
        'O sistema realizar'#225' o envio de um comunicado para uma das aulas ' +
        'selecionadas. Deseja alterar a situa'#231#227'o das aulas selecionadas?'
      WordWrap = True
    end
    object lblSituacaoDespesa: TLabel
      Left = 6
      Top = 141
      Width = 136
      Height = 13
      Caption = 'Enviar despesas na situa'#231#227'o'
      FocusControl = dblcSituacaoDespesa
    end
    object lblComplemento: TLabel
      Left = 6
      Top = 254
      Width = 134
      Height = 13
      Caption = 'Complemento da mensagem'
      FocusControl = dbmComplemento
    end
    object dblcObjetivo: TDBLookupComboBox
      Left = 6
      Top = 19
      Width = 412
      Height = 21
      DataField = 'DS_OBJETIVO'
      DataSource = dsComunicado
      TabOrder = 0
    end
    object dbckNotificarProfessor: TDBCheckBox
      Left = 12
      Top = 59
      Width = 128
      Height = 17
      Caption = 'Professor'
      DataField = 'SN_NOTIFICAR_PROFESSOR'
      DataSource = dsComunicado
      TabOrder = 1
      ValueChecked = '1'
      ValueUnchecked = '0'
    end
    object dbckCoordenador: TDBCheckBox
      Left = 12
      Top = 79
      Width = 128
      Height = 17
      Caption = 'Coordenador'
      DataField = 'SN_NOTIFICAR_COORDENADOR'
      DataSource = dsComunicado
      TabOrder = 2
      ValueChecked = '1'
      ValueUnchecked = '0'
    end
    object dbckConsultor: TDBCheckBox
      Left = 12
      Top = 99
      Width = 128
      Height = 17
      Caption = 'Consultor'
      DataField = 'SN_NOTIFICAR_CONSULTOR'
      DataSource = dsComunicado
      TabOrder = 3
      ValueChecked = '1'
      ValueUnchecked = '0'
    end
    object chkNotificarOutros: TCheckBox
      Left = 12
      Top = 119
      Width = 64
      Height = 17
      Caption = 'Outros'
      TabOrder = 4
      OnClick = chkNotificarOutrosClick
    end
    object edtOutrosEmails: TEdit
      Left = 79
      Top = 117
      Width = 339
      Height = 21
      Enabled = False
      TabOrder = 5
    end
    object dblcSituacaoDespesa: TDBLookupComboBox
      Left = 6
      Top = 157
      Width = 412
      Height = 21
      DataField = 'DS_SITUACAO_DESPESA'
      DataSource = dsComunicado
      TabOrder = 6
    end
    object dblcSituacaoAula: TDBLookupComboBox
      Left = 6
      Top = 230
      Width = 412
      Height = 21
      DataField = 'DS_SITUACAO_AULA'
      DataSource = dsComunicado
      Enabled = False
      TabOrder = 7
    end
    object chkSituacaoAula: TCheckBox
      Left = 6
      Top = 210
      Width = 176
      Height = 17
      Caption = 'Alterar situa'#231#227'o da aula para'
      TabOrder = 8
      OnClick = chkSituacaoAulaClick
    end
    object dbmComplemento: TDBMemo
      Left = 6
      Top = 270
      Width = 412
      Height = 128
      DataField = 'ME_COMPLEMENTO_MENSAGEM'
      DataSource = dsComunicado
      ScrollBars = ssBoth
      TabOrder = 9
    end
    object bbtnEnviar: TBitBtn
      Left = 265
      Top = 401
      Width = 75
      Height = 25
      Caption = 'Enviar'
      TabOrder = 10
      Kind = bkOK
    end
    object bbtnCancelar: TBitBtn
      Left = 343
      Top = 401
      Width = 75
      Height = 25
      Caption = 'Cancelar'
      TabOrder = 11
      Kind = bkCancel
    end
  end
  object qryComunicado: TUMZQuery
    Connection = DM.db
    SQL.Strings = (
      'SELECT'
      '  `CD_COMUNICADO`,'
      '  `CD_OBJETIVO`,'
      '  `SN_NOTIFICAR_PROFESSOR`,'
      '  `SN_NOTIFICAR_COORDENADOR`,'
      '  `SN_NOTIFICAR_CONSULTOR`,'
      '  `DS_EMAIL_OUTROS`,'
      '  `CD_SITUACAO_DESPESA`,'
      '  `CD_SITUACAO_AULA`,'
      '  `ME_COMPLEMENTO_MENSAGEM`,'
      '  `ME_TEMPLATE`'
      'FROM'
      '  `LGTC_COMUNICADO`'
      'WHERE'
      '  `CD_COMUNICADO` = :CD_COMUNICADO')
    Params = <
      item
        DataType = ftUnknown
        Name = 'CD_COMUNICADO'
        ParamType = ptUnknown
      end>
    Left = 272
    Top = 56
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'CD_COMUNICADO'
        ParamType = ptUnknown
      end>
    object qryComunicadoCD_COMUNICADO: TLargeintField
      FieldName = 'CD_COMUNICADO'
      Required = True
    end
    object qryComunicadoCD_OBJETIVO: TSmallintField
      FieldName = 'CD_OBJETIVO'
      Required = True
    end
    object qryComunicadoCD_SITUACAO_AULA: TIntegerField
      FieldName = 'CD_SITUACAO_AULA'
    end
    object qryComunicadoSN_NOTIFICAR_PROFESSOR: TSmallintField
      FieldName = 'SN_NOTIFICAR_PROFESSOR'
      Required = True
    end
    object qryComunicadoSN_NOTIFICAR_COORDENADOR: TSmallintField
      FieldName = 'SN_NOTIFICAR_COORDENADOR'
      Required = True
    end
    object qryComunicadoSN_NOTIFICAR_CONSULTOR: TSmallintField
      FieldName = 'SN_NOTIFICAR_CONSULTOR'
      Required = True
    end
    object qryComunicadoDS_EMAIL_OUTROS: TMemoField
      FieldName = 'DS_EMAIL_OUTROS'
      BlobType = ftMemo
    end
    object qryComunicadoCD_SITUACAO_DESPESA: TLargeintField
      FieldName = 'CD_SITUACAO_DESPESA'
    end
    object qryComunicadoME_COMPLEMENTO_MENSAGEM: TMemoField
      FieldName = 'ME_COMPLEMENTO_MENSAGEM'
      BlobType = ftMemo
    end
    object qryComunicadoME_TEMPLATE: TMemoField
      FieldName = 'ME_TEMPLATE'
      BlobType = ftMemo
    end
    object qryComunicadoDS_OBJETIVO: TStringField
      FieldKind = fkLookup
      FieldName = 'DS_OBJETIVO'
      LookupDataSet = qryObjetivos
      LookupKeyFields = 'CD_OBJETIVO'
      LookupResultField = 'DS_OBJETIVO'
      KeyFields = 'CD_OBJETIVO'
      Lookup = True
    end
    object qryComunicadoDS_SITUACAO_DESPESA: TStringField
      FieldKind = fkLookup
      FieldName = 'DS_SITUACAO_DESPESA'
      LookupDataSet = qrySituacaoDespesa
      LookupKeyFields = 'CD_SITUACAO'
      LookupResultField = 'DS_SITUACAO'
      KeyFields = 'CD_SITUACAO_DESPESA'
      Lookup = True
    end
    object qryComunicadoDS_SITUACAO_AULA: TStringField
      FieldKind = fkLookup
      FieldName = 'DS_SITUACAO_AULA'
      LookupDataSet = qrySituacaoAula
      LookupKeyFields = 'CD_SITUACAO'
      LookupResultField = 'DS_VALOR'
      KeyFields = 'CD_SITUACAO_AULA'
      Lookup = True
    end
  end
  object qryObjetivos: TUMZReadOnlyQuery
    Connection = DM.db
    SortedFields = 'DS_OBJETIVO'
    SQL.Strings = (
      'SELECT'
      '  `CD_OBJETIVO`,'
      '  `DS_OBJETIVO`'
      'FROM'
      '  `LGTC_COMUNICADO_OBJETIVO`')
    Params = <>
    IndexFieldNames = 'DS_OBJETIVO Asc'
    Left = 272
    Top = 88
    object qryObjetivosCD_OBJETIVO: TSmallintField
      FieldName = 'CD_OBJETIVO'
      Required = True
    end
    object qryObjetivosDS_OBJETIVO: TStringField
      FieldName = 'DS_OBJETIVO'
      Required = True
      Size = 255
    end
  end
  object dsComunicado: TDataSource
    DataSet = qryComunicado
    Left = 240
    Top = 56
  end
  object qrySituacaoDespesa: TUMZReadOnlyQuery
    Connection = DM.db
    SortedFields = 'DS_SITUACAO'
    SQL.Strings = (
      'SELECT'
      '  `CD_SITUACAO`,'
      '  `DS_SITUACAO`,'
      '  `DS_CHAVE`'
      'FROM'
      '  `LGTC_DESPESA_SITUACAO`')
    Params = <>
    IndexFieldNames = 'DS_SITUACAO Asc'
    Left = 272
    Top = 120
    object qrySituacaoDespesaCD_SITUACAO: TLargeintField
      FieldName = 'CD_SITUACAO'
      Required = True
    end
    object qrySituacaoDespesaDS_SITUACAO: TStringField
      FieldName = 'DS_SITUACAO'
      Required = True
      Size = 64
    end
    object qrySituacaoDespesaDS_CHAVE: TStringField
      FieldName = 'DS_CHAVE'
      Required = True
      Size = 16
    end
  end
  object qrySituacaoAula: TUMZReadOnlyQuery
    Connection = DM.db
    SortedFields = 'DS_VALOR'
    SQL.Strings = (
      'SELECT'
      '  `CD_SITUACAO`,'
      '  `DS_VALOR`,'
      '  `DS_SIGLA`'
      'FROM'
      '  `SITUACOES`'
      'WHERE'
      '  `CD_MODULO` = 1029')
    Params = <>
    IndexFieldNames = 'DS_VALOR Asc'
    Left = 272
    Top = 152
    object qrySituacaoAulaCD_SITUACAO: TIntegerField
      FieldName = 'CD_SITUACAO'
    end
    object qrySituacaoAulaDS_VALOR: TStringField
      FieldName = 'DS_VALOR'
      Size = 255
    end
    object qrySituacaoAulaDS_SIGLA: TStringField
      FieldName = 'DS_SIGLA'
      Size = 50
    end
  end
  object qryComunicadoAula: TUMZQuery
    Connection = DM.db
    SQL.Strings = (
      'SELECT'
      '  `CD_COMUNICADO`,'
      '  `CD_DIARIO_AULA`'
      'FROM'
      '  `LGTC_COMUNICADO_AULA`'
      'WHERE'
      '  `CD_COMUNICADO` = :CD_COMUNICADO')
    Params = <
      item
        DataType = ftUnknown
        Name = 'CD_COMUNICADO'
        ParamType = ptUnknown
      end>
    DataSource = dsComunicado
    Left = 272
    Top = 184
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'CD_COMUNICADO'
        ParamType = ptUnknown
      end>
    object qryComunicadoAulaCD_COMUNICADO: TLargeintField
      FieldName = 'CD_COMUNICADO'
      Required = True
    end
    object qryComunicadoAulaCD_DIARIO_AULA: TLargeintField
      FieldName = 'CD_DIARIO_AULA'
      Required = True
    end
  end
end
