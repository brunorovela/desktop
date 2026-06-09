object FrmRepasseCertificado: TFrmRepasseCertificado
  Left = 0
  Top = 0
  Width = 451
  Height = 304
  Align = alClient
  TabOrder = 0
  TabStop = True
  object pnlPrincipal: TPanel
    Left = 0
    Top = 0
    Width = 451
    Height = 304
    Align = alClient
    BevelOuter = bvNone
    TabOrder = 0
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
        Width = 448
        Height = 13
        Caption = 
          'Informa abaixo, quais os certificados forma impressos, para c'#225'lc' +
          'ulo do repasse:'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ParentFont = False
      end
    end
    object pnlPrincipalRepasse: TPanel
      Left = 0
      Top = 41
      Width = 451
      Height = 263
      Align = alClient
      BevelOuter = bvNone
      TabOrder = 1
      object dbgRepasse: TDBGrid
        Left = 0
        Top = 0
        Width = 451
        Height = 263
        Align = alClient
        DataSource = dsCertificado
        Options = [dgEditing, dgTitles, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgConfirmDelete, dgCancelOnExit]
        TabOrder = 0
        TitleFont.Charset = DEFAULT_CHARSET
        TitleFont.Color = clWindowText
        TitleFont.Height = -11
        TitleFont.Name = 'Tahoma'
        TitleFont.Style = []
        OnDblClick = dbgRepasseDblClick
        Columns = <
          item
            Expanded = False
            FieldName = 'nm_pessoa'
            ReadOnly = True
            Title.Caption = 'Nome do Estudante'
            Width = 250
            Visible = True
          end
          item
            DropDownRows = 2
            Expanded = False
            FieldName = 'desc_certificado'
            Title.Caption = 'Imprimiu certificado?'
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'dt_repasse'
            Title.Caption = 'Data de Repasse'
            Width = 95
            Visible = True
          end>
      end
    end
  end
  object qryGetAlunos: TUMZQuery
    Connection = DM.db
    OnCalcFields = qryGetAlunosCalcFields
    SQL.Strings = (
      'SELECT'
      '   m.codigoaluno,p.nm_pessoa,cr.cd_repasse,'
      '   cr.dt_inicio_repasse '
      'FROM'
      '   matriculas m'
      '   INNER JOIN pessoas p ON (m.codigoaluno = p.cd_pessoa)'
      
        '   LEFT JOIN conv_repasses cr ON (cr.cd_pessoa = p.cd_pessoa AND' +
        '  m.turma = cr.cd_turma)'
      'WHERE'
      '   m.turma = :cd_turma'
      '  AND m.anosemestre = :anosemestre'
      '  AND m.situacao in'
      '  ('
      '      SELECT'
      '           cd_situacao'
      '      FROM'
      '          nu_modulos_matriculas_sit nms'
      
        '          INNER JOIN nu_modulos nm ON (nm.cd_modulo = nms.cd_mod' +
        'ulo)'
      '      WHERE'
      '         ds_chave = '#39'ContConv'#39' AND sn_aceita = 1'
      '   )'
      'ORDER BY'
      '   p.nm_pessoa')
    Params = <
      item
        DataType = ftUnknown
        Name = 'cd_turma'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'anosemestre'
        ParamType = ptUnknown
      end>
    SQLList.Strings = (
      
        'mysql-5=SELECT'#13#10'   m.codigoaluno,p.nm_pessoa, cr.cd_repasse,'#13#10'  ' +
        ' cr.dt_inicio_repasse '#13#10'FROM'#13#10'   matriculas m'#13#10'   INNER JOIN pes' +
        'soas p ON (m.codigoaluno = p.cd_pessoa)'#13#10'   LEFT JOIN conv_repas' +
        'ses cr ON (cr.cd_pessoa = p.cd_pessoa AND  m.turma = cr.cd_turma' +
        ')'#13#10'WHERE'#13#10'   m.turma = :cd_turma'#13#10'  AND m.anosemestre = :anoseme' +
        'stre'#13#10'  AND m.situacao in'#13#10'  ('#13#10'      SELECT'#13#10'           cd_situ' +
        'acao'#13#10'      FROM'#13#10'          nu_modulos_matriculas_sit nms'#13#10'     ' +
        '     INNER JOIN nu_modulos nm ON (nm.cd_modulo = nms.cd_modulo)'#13 +
        #10'      WHERE'#13#10'         ds_chave = '#39'ContConv'#39' AND sn_aceita = 1'#13#10 +
        '   )'#13#10'ORDER BY'#13#10'   p.nm_pessoa'
      
        'oracle=SELECT'#13#10'   m.codigoaluno,p.nm_pessoa, cr.cd_repasse,'#13#10'   ' +
        'cr.dt_inicio_repasse '#13#10'FROM'#13#10'   matriculas m'#13#10'   INNER JOIN pess' +
        'oas p ON (m.codigoaluno = p.cd_pessoa)'#13#10'   LEFT JOIN conv_repass' +
        'es cr ON (cr.cd_pessoa = p.cd_pessoa AND  m.turma = cr.cd_turma)' +
        #13#10'WHERE'#13#10'   m.turma = :cd_turma'#13#10'  AND m.anosemestre = :anosemes' +
        'tre'#13#10'  AND m.situacao in'#13#10'  ('#13#10'      SELECT'#13#10'           cd_situa' +
        'cao'#13#10'      FROM'#13#10'          nu_modulos_matriculas_sit nms'#13#10'      ' +
        '    INNER JOIN nu_modulos nm ON (nm.cd_modulo = nms.cd_modulo)'#13#10 +
        '      WHERE'#13#10'         ds_chave = '#39'ContConv'#39' AND sn_aceita = 1'#13#10' ' +
        '  )'#13#10'ORDER BY'#13#10'   p.nm_pessoa')
    Left = 56
    Top = 224
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'cd_turma'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'anosemestre'
        ParamType = ptUnknown
      end>
    object qryGetAlunoscodigoaluno: TIntegerField
      FieldName = 'codigoaluno'
      Required = True
    end
    object qryGetAlunosnm_pessoa: TStringField
      FieldName = 'nm_pessoa'
      Size = 60
    end
    object qryGetAlunosdt_inicio_repasse: TDateTimeField
      FieldName = 'dt_inicio_repasse'
      EditMask = '!99/99/0000;1;_'
    end
    object qryGetAlunossn_repasse: TIntegerField
      FieldKind = fkCalculated
      FieldName = 'sn_repasse'
      Calculated = True
    end
    object qryGetAlunoscd_repasse: TLargeintField
      FieldName = 'cd_repasse'
      Required = True
    end
  end
  object cdsCertificadoRepasse: TClientDataSet
    Aggregates = <>
    Params = <>
    BeforeEdit = cdsCertificadoRepasseBeforeEdit
    Left = 96
    Top = 224
    object cdsCertificadoRepassecd_pessoa: TIntegerField
      FieldName = 'cd_pessoa'
    end
    object cdsCertificadoRepassenm_pessoa: TStringField
      FieldName = 'nm_pessoa'
      Size = 255
    end
    object cdsCertificadoRepassedesc_certificado: TStringField
      FieldKind = fkLookup
      FieldName = 'desc_certificado'
      LookupDataSet = cdsAtivo
      LookupKeyFields = 'cd_situacao'
      LookupResultField = 'ds_situacao'
      KeyFields = 'sn_certificado'
      Size = 3
      Lookup = True
    end
    object cdsCertificadoRepassesn_certificado: TIntegerField
      FieldName = 'sn_certificado'
    end
    object cdsCertificadoRepassedt_repasse: TDateField
      FieldName = 'dt_repasse'
      OnSetText = cdsCertificadoRepassedt_repasseSetText
      EditMask = '!99/99/0000;1;_'
    end
  end
  object cdsAtivo: TClientDataSet
    Aggregates = <>
    Params = <>
    Left = 96
    Top = 192
    object cdsAtivocd_situacao: TIntegerField
      FieldName = 'cd_situacao'
    end
    object cdsAtivods_situacao: TStringField
      FieldName = 'ds_situacao'
      Size = 3
    end
  end
  object dsCertificado: TDataSource
    DataSet = cdsCertificadoRepasse
    OnDataChange = dsCertificadoDataChange
    Left = 128
    Top = 224
  end
  object qryContrato: TUMZQuery
    Connection = DM.db
    SQL.Strings = (
      'SELECT'
      '   vl_contrato,'
      '  cd_coligada'
      'FROM'
      '   conv_contratos'
      'WHERE'
      '   cd_contrato = :cd_contrato'
      '   ')
    Params = <
      item
        DataType = ftUnknown
        Name = 'cd_contrato'
        ParamType = ptUnknown
      end>
    Left = 16
    Top = 224
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'cd_contrato'
        ParamType = ptUnknown
      end>
    object qryContratovl_contrato: TFloatField
      FieldName = 'vl_contrato'
    end
    object qryContratocd_coligada: TLargeintField
      FieldName = 'cd_coligada'
    end
  end
  object qryVerificaRepasse: TUMZQuery
    Connection = DM.db
    SQL.Strings = (
      'SELECT'
      '   count(*) as repetido'
      'FROM'
      '   conv_repasses'
      'WHERE'
      '   cd_contrato = :cd_contrato'
      '   AND cd_pessoa = :cd_pessoa'
      '   AND cd_turma = :cd_turma')
    Params = <
      item
        DataType = ftUnknown
        Name = 'cd_contrato'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'cd_pessoa'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'cd_turma'
        ParamType = ptUnknown
      end>
    SQLList.Strings = (
      
        'oracle=SELECT'#13#10'   cast(count(*) as number(19)) as repetido'#13#10'FROM' +
        #13#10'   conv_repasses'#13#10'WHERE'#13#10'   cd_contrato = :cd_contrato'#13#10'   AND' +
        ' cd_pessoa = :cd_pessoa'#13#10'   AND cd_turma = :cd_turma'
      
        'mysql-5=SELECT'#13#10'    count(*) as repetido'#13#10'FROM'#13#10'   conv_repasses' +
        #13#10'WHERE'#13#10'   cd_contrato = :cd_contrato'#13#10'   AND cd_pessoa = :cd_p' +
        'essoa'#13#10'   AND cd_turma = :cd_turma')
    Left = 16
    Top = 192
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'cd_contrato'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'cd_pessoa'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'cd_turma'
        ParamType = ptUnknown
      end>
    object qryVerificaRepasserepetido: TLargeintField
      FieldName = 'repetido'
      ReadOnly = True
    end
  end
end
