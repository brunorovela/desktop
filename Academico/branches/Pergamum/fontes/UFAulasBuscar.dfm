object frmAulasBuscar: TfrmAulasBuscar
  Left = 0
  Top = 0
  BorderStyle = bsDialog
  Caption = 'Busca de aulas'
  ClientHeight = 623
  ClientWidth = 794
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poMainFormCenter
  OnClose = FormClose
  OnCloseQuery = FormCloseQuery
  OnCreate = FormCreate
  OnDestroy = FormDestroy
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object bvlSep1: TBevel
    Left = 0
    Top = 254
    Width = 794
    Height = 3
    Align = alTop
    Shape = bsSpacer
    ExplicitLeft = 264
    ExplicitTop = 352
    ExplicitWidth = 50
  end
  object bvlSep2: TBevel
    Left = 0
    Top = 589
    Width = 794
    Height = 3
    Align = alBottom
    Shape = bsSpacer
    ExplicitWidth = 625
  end
  object pnlFiltros: TPanel
    Left = 0
    Top = 0
    Width = 794
    Height = 254
    Align = alTop
    BevelOuter = bvNone
    TabOrder = 0
    object sbBuscarCurso: TSpeedButton
      Left = 755
      Top = 72
      Width = 23
      Height = 21
      Flat = True
      Glyph.Data = {
        76010000424D7601000000000000760000002800000020000000100000000100
        04000000000000010000130B0000130B00001000000000000000000000000000
        800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333333333333
        33033333333333333F7F3333333333333000333333333333F777333333333333
        000333333333333F777333333333333000333333333333F77733333333333300
        033333333FFF3F777333333700073B703333333F7773F77733333307777700B3
        33333377333777733333307F8F8F7033333337F333F337F3333377F8F9F8F773
        3333373337F3373F3333078F898F870333337F33F7FFF37F333307F99999F703
        33337F377777337F3333078F898F8703333373F337F33373333377F8F9F8F773
        333337F3373337F33333307F8F8F70333333373FF333F7333333330777770333
        333333773FF77333333333370007333333333333777333333333}
      NumGlyphs = 2
      OnClick = sbBuscarCursoClick
    end
    object sbBuscarUnidade: TSpeedButton
      Left = 371
      Top = 72
      Width = 23
      Height = 21
      Flat = True
      Glyph.Data = {
        76010000424D7601000000000000760000002800000020000000100000000100
        04000000000000010000130B0000130B00001000000000000000000000000000
        800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333333333333
        33033333333333333F7F3333333333333000333333333333F777333333333333
        000333333333333F777333333333333000333333333333F77733333333333300
        033333333FFF3F777333333700073B703333333F7773F77733333307777700B3
        33333377333777733333307F8F8F7033333337F333F337F3333377F8F9F8F773
        3333373337F3373F3333078F898F870333337F33F7FFF37F333307F99999F703
        33337F377777337F3333078F898F8703333373F337F33373333377F8F9F8F773
        333337F3373337F33333307F8F8F70333333373FF333F7333333330777770333
        333333773FF77333333333370007333333333333777333333333}
      NumGlyphs = 2
      OnClick = sbBuscarUnidadeClick
    end
    object sbBuscarTurma: TSpeedButton
      Left = 371
      Top = 112
      Width = 23
      Height = 21
      Flat = True
      Glyph.Data = {
        76010000424D7601000000000000760000002800000020000000100000000100
        04000000000000010000130B0000130B00001000000000000000000000000000
        800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333333333333
        33033333333333333F7F3333333333333000333333333333F777333333333333
        000333333333333F777333333333333000333333333333F77733333333333300
        033333333FFF3F777333333700073B703333333F7773F77733333307777700B3
        33333377333777733333307F8F8F7033333337F333F337F3333377F8F9F8F773
        3333373337F3373F3333078F898F870333337F33F7FFF37F333307F99999F703
        33337F377777337F3333078F898F8703333373F337F33373333377F8F9F8F773
        333337F3373337F33333307F8F8F70333333373FF333F7333333330777770333
        333333773FF77333333333370007333333333333777333333333}
      NumGlyphs = 2
      OnClick = sbBuscarTurmaClick
    end
    object sbBuscarDisciplina: TSpeedButton
      Left = 755
      Top = 112
      Width = 23
      Height = 21
      Flat = True
      Glyph.Data = {
        76010000424D7601000000000000760000002800000020000000100000000100
        04000000000000010000130B0000130B00001000000000000000000000000000
        800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333333333333
        33033333333333333F7F3333333333333000333333333333F777333333333333
        000333333333333F777333333333333000333333333333F77733333333333300
        033333333FFF3F777333333700073B703333333F7773F77733333307777700B3
        33333377333777733333307F8F8F7033333337F333F337F3333377F8F9F8F773
        3333373337F3373F3333078F898F870333337F33F7FFF37F333307F99999F703
        33337F377777337F3333078F898F8703333373F337F33373333377F8F9F8F773
        333337F3373337F33333307F8F8F70333333373FF333F7333333330777770333
        333333773FF77333333333370007333333333333777333333333}
      NumGlyphs = 2
      OnClick = sbBuscarDisciplinaClick
    end
    object sbBuscarProfessor: TSpeedButton
      Left = 755
      Top = 152
      Width = 23
      Height = 21
      Flat = True
      Glyph.Data = {
        76010000424D7601000000000000760000002800000020000000100000000100
        04000000000000010000130B0000130B00001000000000000000000000000000
        800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333333333333
        33033333333333333F7F3333333333333000333333333333F777333333333333
        000333333333333F777333333333333000333333333333F77733333333333300
        033333333FFF3F777333333700073B703333333F7773F77733333307777700B3
        33333377333777733333307F8F8F7033333337F333F337F3333377F8F9F8F773
        3333373337F3373F3333078F898F870333337F33F7FFF37F333307F99999F703
        33337F377777337F3333078F898F8703333373F337F33373333377F8F9F8F773
        333337F3373337F33333307F8F8F70333333373FF333F7333333330777770333
        333333773FF77333333333370007333333333333777333333333}
      NumGlyphs = 2
      OnClick = sbBuscarProfessorClick
    end
    object sbBuscarGrupo: TSpeedButton
      Left = 371
      Top = 152
      Width = 23
      Height = 21
      Flat = True
      Glyph.Data = {
        76010000424D7601000000000000760000002800000020000000100000000100
        04000000000000010000130B0000130B00001000000000000000000000000000
        800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333333333333
        33033333333333333F7F3333333333333000333333333333F777333333333333
        000333333333333F777333333333333000333333333333F77733333333333300
        033333333FFF3F777333333700073B703333333F7773F77733333307777700B3
        33333377333777733333307F8F8F7033333337F333F337F3333377F8F9F8F773
        3333373337F3373F3333078F898F870333337F33F7FFF37F333307F99999F703
        33337F377777337F3333078F898F8703333373F337F33373333377F8F9F8F773
        333337F3373337F33333307F8F8F70333333373FF333F7333333330777770333
        333333773FF77333333333370007333333333333777333333333}
      NumGlyphs = 2
      OnClick = sbBuscarGrupoClick
    end
    object lblDataInicio: TLabel
      Left = 16
      Top = 176
      Width = 49
      Height = 13
      Caption = 'Data in'#237'cio'
    end
    object lblDataFim: TLabel
      Left = 400
      Top = 176
      Width = 40
      Height = 13
      Caption = 'Data fim'
    end
    object sbBuscarEstado: TSpeedButton
      Left = 371
      Top = 32
      Width = 23
      Height = 21
      Flat = True
      Glyph.Data = {
        76010000424D7601000000000000760000002800000020000000100000000100
        04000000000000010000130B0000130B00001000000000000000000000000000
        800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333333333333
        33033333333333333F7F3333333333333000333333333333F777333333333333
        000333333333333F777333333333333000333333333333F77733333333333300
        033333333FFF3F777333333700073B703333333F7773F77733333307777700B3
        33333377333777733333307F8F8F7033333337F333F337F3333377F8F9F8F773
        3333373337F3373F3333078F898F870333337F33F7FFF37F333307F99999F703
        33337F377777337F3333078F898F8703333373F337F33373333377F8F9F8F773
        333337F3373337F33333307F8F8F70333333373FF333F7333333330777770333
        333333773FF77333333333370007333333333333777333333333}
      NumGlyphs = 2
      OnClick = sbBuscarEstadoClick
    end
    object sbBuscarMunicipio: TSpeedButton
      Left = 755
      Top = 32
      Width = 23
      Height = 21
      Flat = True
      Glyph.Data = {
        76010000424D7601000000000000760000002800000020000000100000000100
        04000000000000010000130B0000130B00001000000000000000000000000000
        800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333333333333
        33033333333333333F7F3333333333333000333333333333F777333333333333
        000333333333333F777333333333333000333333333333F77733333333333300
        033333333FFF3F777333333700073B703333333F7773F77733333307777700B3
        33333377333777733333307F8F8F7033333337F333F337F3333377F8F9F8F773
        3333373337F3373F3333078F898F870333337F33F7FFF37F333307F99999F703
        33337F377777337F3333078F898F8703333373F337F33373333377F8F9F8F773
        333337F3373337F33333307F8F8F70333333373FF333F7333333330777770333
        333333773FF77333333333370007333333333333777333333333}
      NumGlyphs = 2
      OnClick = sbBuscarMunicipioClick
    end
    object lbleCurso: TLabeledEdit
      Left = 400
      Top = 72
      Width = 352
      Height = 21
      BevelInner = bvNone
      BevelKind = bkFlat
      BorderStyle = bsNone
      EditLabel.Width = 28
      EditLabel.Height = 13
      EditLabel.Caption = 'Curso'
      ReadOnly = True
      TabOrder = 3
    end
    object lbleColigada: TLabeledEdit
      Left = 16
      Top = 72
      Width = 352
      Height = 21
      BevelInner = bvNone
      BevelKind = bkFlat
      BorderStyle = bsNone
      EditLabel.Width = 39
      EditLabel.Height = 13
      EditLabel.Caption = 'Unidade'
      ReadOnly = True
      TabOrder = 2
    end
    object lbleTurma: TLabeledEdit
      Left = 16
      Top = 112
      Width = 352
      Height = 21
      BevelInner = bvNone
      BevelKind = bkFlat
      BorderStyle = bsNone
      EditLabel.Width = 30
      EditLabel.Height = 13
      EditLabel.Caption = 'Turma'
      ReadOnly = True
      TabOrder = 4
    end
    object lbleDisciplina: TLabeledEdit
      Left = 400
      Top = 112
      Width = 352
      Height = 21
      BevelInner = bvNone
      BevelKind = bkFlat
      BorderStyle = bsNone
      EditLabel.Width = 43
      EditLabel.Height = 13
      EditLabel.Caption = 'Disciplina'
      ReadOnly = True
      TabOrder = 5
    end
    object lbleGrupo: TLabeledEdit
      Left = 16
      Top = 152
      Width = 352
      Height = 21
      BevelInner = bvNone
      BevelKind = bkFlat
      BorderStyle = bsNone
      EditLabel.Width = 29
      EditLabel.Height = 13
      EditLabel.Caption = 'Grupo'
      ReadOnly = True
      TabOrder = 6
    end
    object lbleProfessor: TLabeledEdit
      Left = 400
      Top = 152
      Width = 352
      Height = 21
      BevelInner = bvNone
      BevelKind = bkFlat
      BorderStyle = bsNone
      EditLabel.Width = 46
      EditLabel.Height = 13
      EditLabel.Caption = 'Professor'
      ReadOnly = True
      TabOrder = 7
    end
    object dtpDataInicio: TDateTimePicker
      Left = 16
      Top = 192
      Width = 352
      Height = 21
      Date = 42661.629650856480000000
      Time = 42661.629650856480000000
      ShowCheckbox = True
      Checked = False
      TabOrder = 8
    end
    object dtpDataFim: TDateTimePicker
      Left = 400
      Top = 192
      Width = 352
      Height = 21
      Date = 42661.630830208330000000
      Time = 42661.630830208330000000
      ShowCheckbox = True
      Checked = False
      TabOrder = 9
    end
    object bbtnLimpar: TBitBtn
      Left = 97
      Top = 219
      Width = 75
      Height = 25
      Caption = 'Limpar'
      TabOrder = 11
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
      Left = 16
      Top = 219
      Width = 75
      Height = 25
      Caption = 'Filtrar'
      TabOrder = 10
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
    object lbleEstados: TLabeledEdit
      Left = 16
      Top = 32
      Width = 352
      Height = 21
      BevelInner = bvNone
      BevelKind = bkFlat
      BorderStyle = bsNone
      EditLabel.Width = 38
      EditLabel.Height = 13
      EditLabel.Caption = 'Estados'
      ReadOnly = True
      TabOrder = 0
    end
    object lbleMunicipios: TLabeledEdit
      Left = 400
      Top = 32
      Width = 352
      Height = 21
      BevelInner = bvNone
      BevelKind = bkFlat
      BorderStyle = bsNone
      EditLabel.Width = 48
      EditLabel.Height = 13
      EditLabel.Caption = 'Munic'#237'pios'
      ReadOnly = True
      TabOrder = 1
    end
  end
  object pnlBotoes: TPanel
    Left = 0
    Top = 592
    Width = 794
    Height = 31
    Align = alBottom
    BevelOuter = bvNone
    TabOrder = 2
    object bbtnSelecionar: TBitBtn
      Left = 16
      Top = 3
      Width = 92
      Height = 25
      Caption = 'Selecionar'
      TabOrder = 0
      Kind = bkOK
    end
    object bbtnCancelar: TBitBtn
      Left = 114
      Top = 3
      Width = 92
      Height = 25
      Caption = 'Cancelar'
      TabOrder = 1
      Kind = bkCancel
    end
  end
  object dbgAulas: TZSortedGrid
    Left = 0
    Top = 257
    Width = 794
    Height = 332
    Align = alClient
    DataSource = dsAulas
    Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgConfirmDelete, dgCancelOnExit]
    TabOrder = 1
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'Tahoma'
    TitleFont.Style = []
    OnDblClick = dbgAulasDblClick
    Columns = <
      item
        Expanded = False
        FieldName = 'NR_AULA'
        Title.Caption = 'N'#250'mero'
        Width = 53
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'NR_ANOSEMESTRE'
        Title.Caption = 'Ano/Semestre'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'CD_TURMA'
        Title.Caption = 'Turma'
        Width = 69
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'DS_DISCIPLINA'
        Title.Caption = 'Disciplina'
        Width = 218
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'NM_PESSOA'
        Title.Caption = 'Professor'
        Width = 196
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'NR_ETAPA'
        Title.Caption = 'Etapa'
        Width = 42
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'DT_AULA'
        Title.Caption = 'Data'
        Width = 91
        Visible = True
      end>
  end
  object qryAulas: TUMZReadOnlyQuery
    Connection = DM.db
    SQL.Strings = (
      'SELECT'
      '  A.CD_DIARIO_AULA,'
      '  A.NRO_AULA NR_AULA,'
      '  A.ANOSEMESTRE NR_ANOSEMESTRE,'
      '  A.TURMA CD_TURMA,'
      '  P.NM_PESSOA,'
      '  T.CURSO CD_CURSO,'
      '  T.SERIE NR_ETAPA,'
      '  A.`DATA` DT_AULA,'
      '  D.DESCRICAO DS_DISCIPLINA,'
      '  A.`ME_LOCAL_AULA`'
      'FROM'
      '  DIARIO_AULAS A'
      ''
      '    JOIN TURMAS T ON'
      '      (A.ANOSEMESTRE = T.ANOSEMESTRE) AND'
      '      (A.TURMA = T.CODIGO)'
      ''
      '    JOIN DISCIPLINAS D ON'
      '      (A.DISCIPLINA = D.CODIGO) AND'
      '      (T.CURSO = D.CURSO)'
      ''
      '    JOIN PESSOAS P ON'
      '      (A.CD_PROFESSOR = P.CD_PESSOA)')
    Params = <>
    Left = 416
    Top = 360
    object qryAulasCD_DIARIO_AULA: TLargeintField
      FieldName = 'CD_DIARIO_AULA'
      Required = True
    end
    object qryAulasNR_AULA: TSmallintField
      FieldName = 'NR_AULA'
    end
    object qryAulasNR_ANOSEMESTRE: TSmallintField
      FieldName = 'NR_ANOSEMESTRE'
      DisplayFormat = '0000/0'
    end
    object qryAulasCD_TURMA: TStringField
      FieldName = 'CD_TURMA'
      Required = True
      Size = 50
    end
    object qryAulasNM_PESSOA: TStringField
      FieldName = 'NM_PESSOA'
      Size = 60
    end
    object qryAulasCD_CURSO: TStringField
      FieldName = 'CD_CURSO'
      Size = 15
    end
    object qryAulasNR_ETAPA: TSmallintField
      FieldName = 'NR_ETAPA'
      Required = True
    end
    object qryAulasDT_AULA: TDateTimeField
      FieldName = 'DT_AULA'
    end
    object qryAulasDS_DISCIPLINA: TStringField
      FieldName = 'DS_DISCIPLINA'
      Size = 150
    end
    object qryAulasME_LOCAL_AULA: TMemoField
      FieldName = 'ME_LOCAL_AULA'
      BlobType = ftMemo
    end
  end
  object dsAulas: TDataSource
    DataSet = qryAulas
    Left = 448
    Top = 360
  end
  object qryFiltros: TUMZQuery
    Connection = DM.db
    SQL.Strings = (
      'SELECT'
      '  `CD_USUARIO`,'
      '  `DS_PARAMETRO`,'
      '  `DS_VALOR`'
      'FROM'
      '  `USUARIOS_PARAMETROS`'
      'WHERE'
      '  `CD_USUARIO` = :CD_USUARIO AND'
      '  `DS_PARAMETRO` LIKE :DS_PARAMETRO     ')
    Params = <
      item
        DataType = ftUnknown
        Name = 'CD_USUARIO'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'DS_PARAMETRO'
        ParamType = ptUnknown
      end>
    Left = 480
    Top = 360
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'CD_USUARIO'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'DS_PARAMETRO'
        ParamType = ptUnknown
      end>
    object qryFiltrosCD_USUARIO: TLargeintField
      FieldName = 'CD_USUARIO'
    end
    object qryFiltrosDS_PARAMETRO: TStringField
      FieldName = 'DS_PARAMETRO'
      Size = 100
    end
    object qryFiltrosDS_VALOR: TStringField
      FieldName = 'DS_VALOR'
      Size = 255
    end
  end
end
