object frmMatriculasTotais: TfrmMatriculasTotais
  Left = 0
  Top = 0
  BorderStyle = bsToolWindow
  Caption = 'Informa'#231#245'es e totalizadores'
  ClientHeight = 255
  ClientWidth = 445
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  Padding.Left = 3
  Padding.Top = 3
  Padding.Right = 3
  Padding.Bottom = 3
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 13
  object bvlSep2: TBevel
    Left = 3
    Top = 205
    Width = 439
    Height = 3
    Align = alBottom
    Shape = bsBottomLine
    ExplicitLeft = 0
    ExplicitTop = 388
    ExplicitWidth = 624
  end
  object pnlQuantidades: TPanel
    Left = 3
    Top = 3
    Width = 439
    Height = 202
    Align = alClient
    BevelOuter = bvNone
    Padding.Left = 3
    Padding.Top = 3
    Padding.Right = 3
    Padding.Bottom = 3
    TabOrder = 0
    ExplicitHeight = 190
    object bvlSep4: TBevel
      Left = 218
      Top = 3
      Width = 3
      Height = 196
      Align = alLeft
      Shape = bsLeftLine
      ExplicitLeft = 304
      ExplicitTop = 80
      ExplicitHeight = 50
    end
    object pnlSituacoes: TPanel
      Left = 3
      Top = 3
      Width = 215
      Height = 196
      Align = alLeft
      BevelOuter = bvNone
      Padding.Left = 3
      Padding.Top = 3
      Padding.Right = 3
      Padding.Bottom = 3
      TabOrder = 0
      ExplicitHeight = 184
      object bvlSep3: TBevel
        Left = 3
        Top = 20
        Width = 209
        Height = 3
        Align = alTop
        Shape = bsTopLine
        ExplicitLeft = 40
        ExplicitTop = 160
        ExplicitWidth = 50
      end
      object pnlSituacoesTitulo: TPanel
        Left = 3
        Top = 3
        Width = 209
        Height = 17
        Align = alTop
        Alignment = taLeftJustify
        BevelOuter = bvNone
        Caption = 'Situa'#231#245'es'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ParentFont = False
        TabOrder = 0
      end
      object dbgSituacoes: TDBGrid
        Left = 3
        Top = 23
        Width = 209
        Height = 170
        Align = alClient
        BorderStyle = bsNone
        Color = clBtnFace
        DataSource = dsSituacoes
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = []
        Options = [dgColumnResize, dgRowLines, dgTabs, dgRowSelect, dgConfirmDelete, dgCancelOnExit]
        ParentFont = False
        TabOrder = 1
        TitleFont.Charset = DEFAULT_CHARSET
        TitleFont.Color = clWindowText
        TitleFont.Height = -11
        TitleFont.Name = 'Tahoma'
        TitleFont.Style = []
        Columns = <
          item
            Expanded = False
            FieldName = 'DS_SITUACAO'
            Title.Caption = 'Situa'#231#227'o'
            Width = 96
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'NR_QUANTIDADE'
            Title.Caption = 'Quantidade'
            Visible = True
          end>
      end
    end
    object pnlIngressos: TPanel
      Left = 221
      Top = 3
      Width = 215
      Height = 196
      Align = alClient
      AutoSize = True
      BevelOuter = bvNone
      Padding.Left = 3
      Padding.Top = 3
      Padding.Right = 3
      Padding.Bottom = 3
      TabOrder = 1
      ExplicitHeight = 184
      object bvlSep5: TBevel
        Left = 3
        Top = 20
        Width = 209
        Height = 3
        Align = alTop
        Shape = bsTopLine
        ExplicitLeft = 216
        ExplicitTop = 80
        ExplicitWidth = 50
      end
      object pnlIngressosTitulo: TPanel
        Left = 3
        Top = 3
        Width = 209
        Height = 17
        Align = alTop
        Alignment = taLeftJustify
        BevelOuter = bvNone
        Caption = 'Formas de Ingresso'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ParentFont = False
        TabOrder = 0
      end
      object dbgIngressos: TDBGrid
        Left = 3
        Top = 23
        Width = 209
        Height = 170
        Align = alClient
        BorderStyle = bsNone
        Color = clBtnFace
        DataSource = dsIngressos
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = []
        Options = [dgColumnResize, dgRowLines, dgTabs, dgRowSelect, dgConfirmDelete, dgCancelOnExit]
        ParentFont = False
        TabOrder = 1
        TitleFont.Charset = DEFAULT_CHARSET
        TitleFont.Color = clWindowText
        TitleFont.Height = -11
        TitleFont.Name = 'Tahoma'
        TitleFont.Style = []
        Columns = <
          item
            Expanded = False
            FieldName = 'DS_INGRESSO'
            Title.Caption = 'Forma de ingresso'
            Width = 96
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'NR_QUANTIDADE'
            Title.Caption = 'Quantidade'
            Visible = True
          end>
      end
    end
  end
  object pnlTotais: TPanel
    Left = 3
    Top = 208
    Width = 439
    Height = 44
    Align = alBottom
    BevelOuter = bvNone
    Padding.Left = 3
    Padding.Top = 3
    Padding.Right = 3
    Padding.Bottom = 3
    TabOrder = 1
    object lblAtivos: TLabel
      Left = 6
      Top = 6
      Width = 109
      Height = 13
      Caption = 'Total de alunos ativos:'
    end
    object lblTotal: TLabel
      Left = 21
      Top = 25
      Width = 94
      Height = 13
      Caption = 'Total de matr'#237'culas:'
    end
    object lblAtivosNumero: TLabel
      Left = 118
      Top = 6
      Width = 77
      Height = 13
      Caption = 'lblAtivosNumero'
    end
    object lblTotalNumero: TLabel
      Left = 118
      Top = 25
      Width = 71
      Height = 13
      Caption = 'lblTotalNumero'
    end
  end
  object qryIngressos: TUMZReadOnlyQuery
    Connection = DM.db
    SortedFields = 'DS_INGRESSO'
    SQL.Strings = (
      'SELECT'
      '  `CD_INGRESSO`,'
      '  `DS_INGRESSO`,'
      '  `SN_ATIVO`'
      'FROM'
      '  `MATRICULAS_INGRESSO`')
    Params = <>
    IndexFieldNames = 'DS_INGRESSO Asc'
    Left = 280
    Top = 64
    object qryIngressosCD_INGRESSO: TIntegerField
      FieldName = 'CD_INGRESSO'
      Required = True
    end
    object qryIngressosDS_INGRESSO: TStringField
      FieldName = 'DS_INGRESSO'
      Size = 50
    end
    object qryIngressosSN_ATIVO: TSmallintField
      FieldName = 'SN_ATIVO'
    end
  end
  object qrySituacoes: TUMZReadOnlyQuery
    Connection = DM.db
    SortedFields = 'NR_ORDEM_FINAL'
    SQL.Strings = (
      'SELECT'
      '  `CD_SITUACAO`,'
      '  `DS_SITUACAO`,'
      '  `CD_SITUACAO_PAI`,'
      '  `NR_ORDEM_FINAL`'
      'FROM'
      '  `SITUACAO`')
    Params = <>
    IndexFieldNames = 'NR_ORDEM_FINAL Asc'
    Left = 248
    Top = 64
    object qrySituacoesCD_SITUACAO: TIntegerField
      FieldName = 'CD_SITUACAO'
    end
    object qrySituacoesDS_SITUACAO: TStringField
      FieldName = 'DS_SITUACAO'
      Size = 15
    end
    object qrySituacoesCD_SITUACAO_PAI: TIntegerField
      FieldName = 'CD_SITUACAO_PAI'
    end
    object qrySituacoesNR_ORDEM_FINAL: TIntegerField
      FieldName = 'NR_ORDEM_FINAL'
    end
  end
  object dspSituacoes: TDataSetProvider
    DataSet = qrySituacoes
    Left = 248
    Top = 96
  end
  object dspIngressos: TDataSetProvider
    DataSet = qryIngressos
    Left = 280
    Top = 96
  end
  object cdsSituacoes: TClientDataSet
    Aggregates = <>
    AggregatesActive = True
    Filter = 'NR_QUANTIDADE > 0'
    Filtered = True
    FieldDefs = <>
    IndexDefs = <
      item
        Name = 'cdsSituacoesIndexDS_SITUACAO'
        Fields = 'DS_SITUACAO'
      end>
    IndexName = 'cdsSituacoesIndexDS_SITUACAO'
    Params = <>
    ProviderName = 'dspSituacoes'
    StoreDefs = True
    OnCalcFields = cdsSituacoesCalcFields
    Left = 248
    Top = 128
    object cdsSituacoesCD_SITUACAO: TIntegerField
      FieldName = 'CD_SITUACAO'
    end
    object cdsSituacoesDS_SITUACAO: TStringField
      FieldName = 'DS_SITUACAO'
      Size = 15
    end
    object cdsSituacoesCD_SITUACAO_PAI: TIntegerField
      FieldName = 'CD_SITUACAO_PAI'
    end
    object cdsSituacoesNR_ORDEM_FINAL: TIntegerField
      FieldName = 'NR_ORDEM_FINAL'
    end
    object cdsSituacoesNR_QUANTIDADE: TIntegerField
      FieldKind = fkInternalCalc
      FieldName = 'NR_QUANTIDADE'
    end
    object cdsSituacoesNR_QUANTIDADE_ATIVO: TIntegerField
      FieldKind = fkInternalCalc
      FieldName = 'NR_QUANTIDADE_ATIVO'
    end
    object cdsSituacoesSUM_TOTAL_ATIVO: TAggregateField
      FieldName = 'SUM_TOTAL_ATIVO'
      Active = True
      Expression = 'SUM(NR_QUANTIDADE_ATIVO)'
    end
  end
  object cdsIngressos: TClientDataSet
    Aggregates = <>
    Filter = 'NR_QUANTIDADE > 0'
    Filtered = True
    FieldDefs = <>
    IndexDefs = <
      item
        Name = 'cdsIngressosIndexDS_INGRESSO'
        Fields = 'DS_INGRESSO'
      end>
    IndexName = 'cdsIngressosIndexDS_INGRESSO'
    Params = <>
    ProviderName = 'dspIngressos'
    StoreDefs = True
    OnCalcFields = cdsIngressosCalcFields
    Left = 280
    Top = 128
    object cdsIngressosCD_INGRESSO: TIntegerField
      FieldName = 'CD_INGRESSO'
      Required = True
    end
    object cdsIngressosDS_INGRESSO: TStringField
      FieldName = 'DS_INGRESSO'
      Size = 50
    end
    object cdsIngressosSN_ATIVO: TSmallintField
      FieldName = 'SN_ATIVO'
    end
    object cdsIngressosNR_QUANTIDADE: TIntegerField
      FieldKind = fkInternalCalc
      FieldName = 'NR_QUANTIDADE'
    end
  end
  object dsSituacoes: TDataSource
    DataSet = cdsSituacoes
    Left = 248
    Top = 160
  end
  object dsIngressos: TDataSource
    DataSet = cdsIngressos
    Left = 280
    Top = 160
  end
end
