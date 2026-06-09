object frmDisciplinasSelecao: TfrmDisciplinasSelecao
  Left = 0
  Top = 0
  BorderStyle = bsToolWindow
  Caption = 'Sele'#231#227'o de disciplinas...'
  ClientHeight = 571
  ClientWidth = 594
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  FormStyle = fsStayOnTop
  OldCreateOrder = False
  Position = poScreenCenter
  OnCreate = FormCreate
  OnDestroy = FormDestroy
  PixelsPerInch = 96
  TextHeight = 13
  object bvlSep1: TBevel
    Left = 0
    Top = 191
    Width = 594
    Height = 3
    Align = alTop
    Shape = bsSpacer
    ExplicitLeft = 224
    ExplicitTop = 376
    ExplicitWidth = 50
  end
  object pnlFiltros: TPanel
    Left = 0
    Top = 0
    Width = 594
    Height = 191
    Align = alTop
    BevelOuter = bvNone
    TabOrder = 0
    object lblUnidade: TLabel
      Left = 3
      Top = 3
      Width = 39
      Height = 13
      Caption = 'Unidade'
    end
    object lblDepto: TLabel
      Left = 3
      Top = 43
      Width = 69
      Height = 13
      Caption = 'Departamento'
    end
    object lblCurso: TLabel
      Left = 3
      Top = 83
      Width = 28
      Height = 13
      Caption = 'Curso'
    end
    object lblDisciplina: TLabel
      Left = 3
      Top = 123
      Width = 43
      Height = 13
      Caption = 'Disciplina'
    end
    object cbUnidades: TUMComboBox
      Left = 3
      Top = 16
      Width = 588
      Height = 21
      ItemHeight = 13
      TabOrder = 0
      OnExit = cbUnidadesExit
      TamanhoMaximo = 0
    end
    object cbDepto: TUMComboBox
      Left = 3
      Top = 59
      Width = 588
      Height = 21
      ItemHeight = 13
      TabOrder = 1
      OnExit = cbDeptoExit
      TamanhoMaximo = 0
    end
    object cbCursos: TUMComboBox
      Left = 3
      Top = 99
      Width = 588
      Height = 21
      ItemHeight = 13
      TabOrder = 2
      OnExit = cbCursosExit
      TamanhoMaximo = 0
    end
    object cbDisciplinas: TUMComboBox
      Left = 3
      Top = 139
      Width = 588
      Height = 21
      ItemHeight = 13
      TabOrder = 3
      TamanhoMaximo = 0
    end
    object bbtnLimpar: TBitBtn
      Left = 396
      Top = 163
      Width = 96
      Height = 25
      Caption = 'Limpar filtros'
      TabOrder = 4
      OnClick = bbtnLimparClick
      Glyph.Data = {
        46030000424D46030000000000003600000028000000120000000E0000000100
        18000000000010030000C40E0000C40E00000000000000000000FFFFFFFFFFFF
        FFFFFFFDFDFCCCCCD36C6D9D95959FE5E6E2FFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF0000FFFFFFFEFEFED0D0CA5A5A7F3130
        D43736ED2C2BD32B2B91868691CFD0CAF9FAF9FFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFF0000FDFDFC9090A42423A93836F34544FF3A39E33A39E344
        43FF302EDE24239A3434419E9E9DF8F8F8FFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        000081819F2D2CDF4544FF4342FF4241FF4543FF1F1E803635D24746FF4746FF
        19188454544A6F7072BBBBBBFBFCFBFFFFFFFFFFFFFFFFFF00007070A63E3DFF
        4241FF4342FF4342FF3635D82D2CB71D1D7A2B2AAA4342FB3D3CFF36366CEBEC
        E2A1A1A3616066C8C9C9FEFEFEFFFFFF0000C9CACB3C3BD54342FF3A39E02D2C
        B73737DA4544FF4342FE2A29A81A1A6E2E2DB22B2BC3B5B5C4FFFFFFEBEAEC8A
        8A8E88888AF4F5F50000FFFFFE8080BB2928D22F2EC94241FD4442FF4241FF42
        41FF4544FF4241FC302FBA11116B35354BFFFFFEFFFFFFFFFFFFD5D5D7A4A4A7
        0000FFFFFFF2F2F29191B45352D43C3BF83F3EFF4241FF4241FF4443FF4342FF
        3433F124249B83838DE8E8E6B1B1B4E5E5E6FFFFFF9595980000FFFFFFFFFFFF
        FFFFFFF6F6F5C1C1CF6A69BE4140E73C3BF92929C02A2A7B81809ADCDCD2FFFF
        FFFDFDFDD1D1D39898998B8B8D86868A0000FFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFDFDFDD9D9DC9797AB989897E4E4DAFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFA
        FAFA87888CCBCACC0000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFF2F2F2D1D1D3C8C8C9DDDDDEF5F5F5D9D9DAAAAAADC2C1C4F9F9FAFFFFFF
        0000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        F2F2F2D6D6D7AFAFB2C3C3C5EAEAEAFFFFFFFFFFFFFFFFFF0000FFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF0000FFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFF0000}
    end
    object bbtnFiltrar: TBitBtn
      Left = 495
      Top = 163
      Width = 96
      Height = 25
      Caption = 'Filtrar'
      TabOrder = 5
      OnClick = bbtnFiltrarClick
      Glyph.Data = {
        76010000424D7601000000000000760000002800000020000000100000000100
        04000000000000010000130B0000130B00001000000000000000000000000000
        800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333333333333
        333333333333333333FF33333333333330003FF3FFFFF3333777003000003333
        300077F777773F333777E00BFBFB033333337773333F7F33333FE0BFBF000333
        330077F3337773F33377E0FBFBFBF033330077F3333FF7FFF377E0BFBF000000
        333377F3337777773F3FE0FBFBFBFBFB039977F33FFFFFFF7377E0BF00000000
        339977FF777777773377000BFB03333333337773FF733333333F333000333333
        3300333777333333337733333333333333003333333333333377333333333333
        333333333333333333FF33333333333330003333333333333777333333333333
        3000333333333333377733333333333333333333333333333333}
      NumGlyphs = 2
    end
  end
  object pnlDisciplinas: TPanel
    Left = 0
    Top = 194
    Width = 594
    Height = 377
    Align = alClient
    BevelOuter = bvNone
    TabOrder = 1
    object tsOpcoes: TTabSet
      Left = 0
      Top = 356
      Width = 594
      Height = 21
      Align = alBottom
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = []
      Style = tsModernTabs
      Tabs.Strings = (
        'Por Curso'
        'Por Disciplina Mestre')
      TabIndex = 0
      OnChange = tsOpcoesChange
    end
    object pgcOpcoes: TPageControl
      Left = 0
      Top = 0
      Width = 594
      Height = 356
      ActivePage = tbsCurso
      Align = alClient
      Style = tsFlatButtons
      TabOrder = 1
      object tbsCurso: TTabSheet
        Caption = 'tbsCurso'
        TabVisible = False
        object tvCurso: TTreeView
          Left = 0
          Top = 0
          Width = 586
          Height = 346
          Align = alClient
          BevelInner = bvNone
          BevelKind = bkFlat
          BorderStyle = bsNone
          DragMode = dmAutomatic
          Indent = 19
          ReadOnly = True
          TabOrder = 0
          OnDragDrop = tvCursoDragDrop
        end
      end
      object tbsDisciplinaMestre: TTabSheet
        Caption = 'tbsDisciplinaMestre'
        ImageIndex = 1
        TabVisible = False
        object tvMestre: TTreeView
          Left = 0
          Top = 0
          Width = 586
          Height = 346
          Align = alClient
          BevelInner = bvNone
          BevelKind = bkFlat
          BorderStyle = bsNone
          DragMode = dmAutomatic
          Indent = 19
          ReadOnly = True
          TabOrder = 0
          OnDragDrop = tvMestreDragDrop
        end
      end
    end
  end
  object qryDisciplinas: TUMZReadOnlyQuery
    Connection = DM.db
    OnCalcFields = qryDisciplinasCalcFields
    SQL.Strings = (
      'SELECT DISTINCT'
      '  D.`CURSO` `CD_CURSO`,'
      '  D.`SIGLA` `DS_SIGLA`,'
      '  D.`DESCRICAO` `DS_DISCIPLINA`,'
      '  D.`CODIGO` `CD_DISCIPLINA`,'
      '  M.`DS_DISCIPLINA` `DS_DISCIPLINA_MESTRE`,'
      '  M.`DS_SIGLA` `DS_SIGLA_MESTRE`,'
      '  D.`CD_DISCIPLINA_PAI`'
      'FROM'
      '  `DISCIPLINAS` D'
      ''
      '    JOIN `CURSOS_MESTRE` C ON'
      '      (D.`CURSO` = C.`CD_CURSO`)'
      ''
      '    JOIN `DISCIPLINAS_MESTRE` M ON'
      '      (D.`CD_DISCIPLINA_PAI` = M.`CD_DISCIPLINA_PAI`)'
      'WHERE'
      '  EXISTS ('
      '    SELECT'
      '      C.`CD_CURSO`'
      '    FROM'
      '      `CURSOS_MESTRE` C'
      '    WHERE'
      '      C.`CD_CURSO` = D.`CURSO` AND'
      '      C.`SN_ATIVO` = '#39'S'#39
      '  )')
    Params = <>
    Left = 208
    Top = 272
    object qryDisciplinasCD_CURSO: TStringField
      FieldName = 'CD_CURSO'
      Required = True
      Size = 15
    end
    object qryDisciplinasDS_SIGLA: TStringField
      FieldName = 'DS_SIGLA'
      Size = 10
    end
    object qryDisciplinasDS_DISCIPLINA: TStringField
      FieldName = 'DS_DISCIPLINA'
      Size = 150
    end
    object qryDisciplinasCD_DISCIPLINA: TIntegerField
      FieldName = 'CD_DISCIPLINA'
      ReadOnly = True
      DisplayFormat = '00000000000'
    end
    object qryDisciplinasDS_DISCIPLINA_MESTRE: TStringField
      FieldName = 'DS_DISCIPLINA_MESTRE'
      ReadOnly = True
      Size = 255
    end
    object qryDisciplinasDS_SIGLA_MESTRE: TStringField
      FieldName = 'DS_SIGLA_MESTRE'
      ReadOnly = True
      Size = 10
    end
    object qryDisciplinasCD_DISCIPLINA_PAI: TStringField
      FieldName = 'CD_DISCIPLINA_PAI'
      Required = True
      Size = 255
    end
    object qryDisciplinasDS_DISCIPLINA_MESTRE_DISPLAY: TStringField
      FieldKind = fkCalculated
      FieldName = 'DS_DISCIPLINA_MESTRE_DISPLAY'
      Size = 255
      Calculated = True
    end
    object qryDisciplinasDS_DISCIPLINA_DISPLAY: TStringField
      FieldKind = fkCalculated
      FieldName = 'DS_DISCIPLINA_DISPLAY'
      Size = 255
      Calculated = True
    end
  end
  object qryUnidades: TUMZReadOnlyQuery
    Connection = DM.db
    SortedFields = 'NM_COLIGADA'
    SQL.Strings = (
      'SELECT'
      '  `CD_COLIGADA`,'
      '  `NM_COLIGADA`'
      'FROM'
      '  `COLIGADAS`')
    Params = <>
    IndexFieldNames = 'NM_COLIGADA Asc'
    Left = 240
    Top = 272
    object qryUnidadesCD_COLIGADA: TIntegerField
      FieldName = 'CD_COLIGADA'
      Required = True
    end
    object qryUnidadesNM_COLIGADA: TStringField
      FieldName = 'NM_COLIGADA'
      Size = 255
    end
  end
  object qryDepto: TUMZReadOnlyQuery
    Connection = DM.db
    SortedFields = 'NM_DEPTO'
    SQL.Strings = (
      'SELECT'
      '  `CODIGO` `CD_DEPTO`,'
      '  `DESCRICAO` `NM_DEPTO`,'
      '  `CD_COLIGADA`'
      'FROM'
      '  `DEPARTAMENTOS`')
    Params = <>
    IndexFieldNames = 'NM_DEPTO Asc'
    Left = 272
    Top = 272
    object qryDeptoCD_DEPTO: TSmallintField
      FieldName = 'CD_DEPTO'
      ReadOnly = True
    end
    object qryDeptoNM_DEPTO: TStringField
      FieldName = 'NM_DEPTO'
      ReadOnly = True
      Size = 255
    end
    object qryDeptoCD_COLIGADA: TIntegerField
      FieldName = 'CD_COLIGADA'
      Required = True
    end
  end
  object qryCursos: TUMZReadOnlyQuery
    Connection = DM.db
    SortedFields = 'DS_CURSO'
    SQL.Strings = (
      'SELECT'
      '  C.`CD_CURSO`,'
      '  C.`DS_CURSO`,'
      '  L.`CD_COLIGADA`,'
      '  L.`CD_DEPTO`'
      'FROM'
      '  `CURSOS_MESTRE` C'
      '    JOIN `CURSOS_COLIGADAS` L ON'
      '      (C.`CD_CURSO` = L.`CD_CURSO`)'
      'WHERE'
      '  C.`SN_ATIVO` = '#39'S'#39)
    Params = <>
    IndexFieldNames = 'DS_CURSO Asc'
    Left = 304
    Top = 272
    object qryCursosCD_CURSO: TStringField
      FieldName = 'CD_CURSO'
      Required = True
      Size = 15
    end
    object qryCursosDS_CURSO: TStringField
      FieldName = 'DS_CURSO'
      Size = 255
    end
    object qryCursosCD_COLIGADA: TSmallintField
      FieldName = 'CD_COLIGADA'
      Required = True
    end
    object qryCursosCD_DEPTO: TSmallintField
      FieldName = 'CD_DEPTO'
      Required = True
    end
  end
  object qryDiscFiltro: TUMZReadOnlyQuery
    Connection = DM.db
    SortedFields = 'DS_DISCIPLINA'
    SQL.Strings = (
      'SELECT DISTINCT'
      '  D.`DESCRICAO` `DS_DISCIPLINA`'
      'FROM'
      '  `DISCIPLINAS` D'
      'WHERE'
      #9'EXISTS ('
      #9#9'SELECT'
      #9#9#9'CC.`CD_CURSO`'
      #9#9'FROM'
      #9#9#9'`CURSOS_COLIGADAS` CC'
      #9#9'WHERE'
      #9#9#9'D.`CURSO` = CC.`CD_CURSO` AND'
      #9#9#9'CC.`SN_ATIVO` = 1'
      #9')')
    Params = <>
    IndexFieldNames = 'DS_DISCIPLINA Asc'
    Left = 336
    Top = 272
    object qryDiscFiltroDS_DISCIPLINA: TStringField
      FieldName = 'DS_DISCIPLINA'
      ReadOnly = True
      Size = 150
    end
  end
end
