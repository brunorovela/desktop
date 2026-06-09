object frmRepasseTurma: TfrmRepasseTurma
  Left = 0
  Top = 0
  Width = 451
  Height = 304
  Align = alClient
  TabOrder = 0
  TabStop = True
  object pnlPrincipalTurma: TPanel
    Left = 0
    Top = 0
    Width = 451
    Height = 304
    Align = alClient
    BevelOuter = bvNone
    TabOrder = 0
    object bvlSep1: TBevel
      Left = 0
      Top = 41
      Width = 451
      Height = 3
      Align = alTop
      Shape = bsSpacer
      ExplicitLeft = 80
      ExplicitTop = 136
      ExplicitWidth = 50
    end
    object pnlTopoRepasse: TPanel
      Left = 0
      Top = 0
      Width = 451
      Height = 41
      Align = alTop
      BevelOuter = bvNone
      TabOrder = 0
      object lblDescricao: TLabel
        Left = 8
        Top = 14
        Width = 292
        Height = 13
        Caption = 'Informe abaixo os crit'#233'rios para c'#225'lculo do repasse:'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ParentFont = False
      end
    end
    object pnlDadosRepasse: TPanel
      Left = 0
      Top = 44
      Width = 451
      Height = 260
      Align = alClient
      BevelOuter = bvNone
      TabOrder = 1
      object lblInicioRepasse: TLabel
        Left = 8
        Top = 6
        Width = 81
        Height = 13
        Caption = 'Inicio do repasse'
      end
      object lblValor: TLabel
        Left = 290
        Top = 6
        Width = 107
        Height = 13
        Caption = 'Valor Total de repasse'
      end
      object lblQtdParcelas: TLabel
        Left = 144
        Top = 6
        Width = 114
        Height = 13
        Caption = 'Quantidade de parcelas'
      end
      object mkedInicioRepasse: TMaskEdit
        Left = 8
        Top = 23
        Width = 120
        Height = 21
        EditMask = '!99/9999;1;_'
        MaxLength = 7
        TabOrder = 0
        Text = '  /    '
        OnChange = mkedInicioRepasseChange
      end
      object edValor: TUMEditMonetario
        Left = 290
        Top = 23
        Width = 121
        Height = 21
        TabOrder = 2
        Text = '0,00'
        OnChange = edValorChange
        Mascara = '###,###,##0.00'
        EnterProximoCampo = True
      end
      object edQtdParcelas: TEdit
        Left = 144
        Top = 23
        Width = 121
        Height = 21
        TabOrder = 1
        OnChange = edQtdParcelasChange
      end
    end
  end
  object qryGetRepasseTurma: TUMZQuery
    Connection = DM.db
    SQL.Strings = (
      'SELECT'
      '   cd_turma,'
      '   cd_contrato,'
      '   vl_remessa,'
      '   nr_total_parcelas,'
      '   DATE_FORMAT(dt_inicio_repasse,'#39'%m/%Y'#39')  as inicio_repasse,'
      '   dt_inicio_repasse'
      'FROM'
      '   conv_repasses'
      'WHERE'
      '   cd_contrato = :cd_contrato'
      '   AND cd_turma = :cd_turma')
    Params = <
      item
        DataType = ftUnknown
        Name = 'cd_contrato'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'cd_turma'
        ParamType = ptUnknown
      end>
    Left = 160
    Top = 120
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'cd_contrato'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'cd_turma'
        ParamType = ptUnknown
      end>
    object qryGetRepasseTurmacd_turma: TStringField
      FieldName = 'cd_turma'
      Size = 50
    end
    object qryGetRepasseTurmavl_remessa: TFloatField
      FieldName = 'vl_remessa'
    end
    object qryGetRepasseTurmanr_total_parcelas: TIntegerField
      FieldName = 'nr_total_parcelas'
    end
    object qryGetRepasseTurmainicio_repasse: TStringField
      FieldName = 'inicio_repasse'
      ReadOnly = True
      Size = 7
    end
    object qryGetRepasseTurmacd_contrato: TLargeintField
      FieldName = 'cd_contrato'
    end
    object qryGetRepasseTurmadt_inicio_repasse: TDateTimeField
      FieldName = 'dt_inicio_repasse'
    end
  end
end
