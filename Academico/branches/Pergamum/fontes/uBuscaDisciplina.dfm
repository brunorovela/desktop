object fBuscaDisciplina: TfBuscaDisciplina
  Left = 0
  Top = 0
  BorderStyle = bsDialog
  Caption = 'Busca de disciplina...'
  ClientHeight = 363
  ClientWidth = 561
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  KeyPreview = True
  OldCreateOrder = False
  Position = poScreenCenter
  OnClose = fechaJanela
  OnCreate = inicializaFormulario
  OnKeyDown = processaTeclasAtalho
  PixelsPerInch = 96
  TextHeight = 13
  object FBvSep1: TBevel
    Left = 0
    Top = 22
    Width = 561
    Height = 5
    Align = alTop
    ExplicitTop = 25
    ExplicitWidth = 541
  end
  object FBvSep2: TBevel
    Left = 0
    Top = 62
    Width = 561
    Height = 5
    Align = alTop
    ExplicitTop = 30
    ExplicitWidth = 551
  end
  object FPnTitulo: TPanel
    Left = 0
    Top = 0
    Width = 561
    Height = 22
    Align = alTop
    BevelOuter = bvLowered
    Caption = 'SELECIONE A DISCIPLINA DESEJADA'
    Color = clBlue
    Font.Charset = ANSI_CHARSET
    Font.Color = clWhite
    Font.Height = -13
    Font.Name = 'Arial'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 0
  end
  object FPnFiltros: TPanel
    Left = 0
    Top = 27
    Width = 561
    Height = 35
    Align = alTop
    BevelOuter = bvLowered
    TabOrder = 1
    object FLbAnoSem: TLabel
      Left = 9
      Top = 9
      Width = 72
      Height = 13
      Caption = 'Ano/Semestre:'
    end
    object FLbCurso: TLabel
      Left = 178
      Top = 9
      Width = 32
      Height = 13
      Caption = 'Curso:'
    end
    object FLbTurma: TLabel
      Left = 358
      Top = 9
      Width = 34
      Height = 13
      Caption = 'Turma:'
    end
    object FBnCurso: TSpeedButton
      Left = 321
      Top = 6
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
      Layout = blGlyphBottom
      NumGlyphs = 2
      OnClick = buscaCurso
    end
    object FBnTurma: TSpeedButton
      Left = 520
      Top = 6
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
      Layout = blGlyphBottom
      NumGlyphs = 2
      OnClick = buscaTurma
    end
    object FMeAnoSem: TMaskEdit
      Left = 87
      Top = 6
      Width = 54
      Height = 21
      EditMask = '9999/9;0;_'
      MaxLength = 6
      TabOrder = 0
    end
    object FUdAnoSem: TUpDown
      Left = 147
      Top = 6
      Width = 17
      Height = 21
      Min = -100
      TabOrder = 1
      OnClick = incDecAnoSemestre
    end
    object FEdCurso: TEdit
      Left = 216
      Top = 6
      Width = 99
      Height = 21
      TabOrder = 2
      OnKeyPress = selecionaCurso
    end
    object FEdTurma: TEdit
      Left = 398
      Top = 6
      Width = 116
      Height = 21
      TabOrder = 3
      OnKeyPress = selecionaCurso
    end
  end
  object FPnOpcoes: TPanel
    Left = 0
    Top = 332
    Width = 561
    Height = 31
    Align = alBottom
    BevelOuter = bvNone
    TabOrder = 2
    object FBnSelecionar: TSpeedButton
      Left = 363
      Top = 3
      Width = 87
      Height = 25
      Caption = 'Selecionar'
      Glyph.Data = {
        76010000424D7601000000000000760000002800000020000000100000000100
        04000000000000010000120B0000120B00001000000000000000000000000000
        800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00555555555555
        555555555555555555555555555555555555555555FF55555555555559055555
        55555555577FF5555555555599905555555555557777F5555555555599905555
        555555557777FF5555555559999905555555555777777F555555559999990555
        5555557777777FF5555557990599905555555777757777F55555790555599055
        55557775555777FF5555555555599905555555555557777F5555555555559905
        555555555555777FF5555555555559905555555555555777FF55555555555579
        05555555555555777FF5555555555557905555555555555777FF555555555555
        5990555555555555577755555555555555555555555555555555}
      NumGlyphs = 2
      OnClick = selecionaDisciplina
    end
    object FBnSair: TSpeedButton
      Left = 456
      Top = 3
      Width = 87
      Height = 25
      Hint = 'Sair'
      Caption = 'F12 Sair'
      Glyph.Data = {
        F6000000424DF600000000000000760000002800000010000000100000000100
        04000000000080000000CE0E0000C40E00001000000000000000000000000000
        80000080000000808000800000008000800080800000C0C0C000808080000000
        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00777777777777
        7777777777777777777777777744447777777777444444447777777444777744
        4777777447777774477777447777777744777744777777774477774477777777
        4477774477777777447777744777747447777774477774444777777777777444
        7777777777777444477777777777777777777777777777777777}
      OnClick = fecha
    end
  end
  object FDgDisciplinas: TDBGrid
    Left = 0
    Top = 67
    Width = 561
    Height = 265
    Align = alClient
    DataSource = FDsDisciplinas
    Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgConfirmDelete, dgCancelOnExit]
    TabOrder = 3
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'Tahoma'
    TitleFont.Style = []
    OnDblClick = selecionaDisciplina
    OnKeyPress = confirmaSelecao
    Columns = <
      item
        Expanded = False
        FieldName = 'anosemestre'
        Title.Caption = 'Ano/Semestre'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'curso'
        Title.Caption = 'Curso'
        Width = 84
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'serie'
        Title.Caption = 'Etapa'
        Width = 32
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'turma'
        Title.Caption = 'Turma'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'descricao'
        Title.Caption = 'Disciplina'
        Width = 183
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'disciplina'
        Title.Caption = 'C'#243'digo'
        Width = 42
        Visible = True
      end>
  end
  object FQyDisciplinas: TUMZQuery
    Connection = DM.db
    SQL.Strings = (
      'SELECT'
      '   gc.anosemestre,'
      '   gc.curso,'
      '   gc.disciplina,'
      '   gc.serie,'
      '   d.sigla,'
      '   d.descricao,'
      '   t.grau,'
      '   gc.cd_grade,'
      '   t.codigo turma'
      'FROM'
      '   gradecurricular gc JOIN turmas t'
      '      ON(gc.anosemestre = t.anosemestre AND'
      '             gc.curso = t.curso AND'
      '             gc.serie = t.serie AND'
      '             gc.turno = t.turno)'
      '      JOIN disciplinas d'
      '         ON(gc.disciplina = d.codigo AND'
      '               gc.curso = d.curso)'
      'WHERE'
      '   :filtros'
      'ORDER BY'
      '   d.ordem, d.descricao')
    Params = <
      item
        DataType = ftUnknown
        Name = 'filtros'
        ParamType = ptUnknown
      end>
    Left = 328
    Top = 176
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'filtros'
        ParamType = ptUnknown
      end>
    object FQyDisciplinascurso: TStringField
      FieldName = 'curso'
      FixedChar = True
      Size = 15
    end
    object FQyDisciplinasdescricao: TStringField
      FieldName = 'descricao'
      Size = 150
    end
    object FQyDisciplinasdisciplina: TIntegerField
      FieldName = 'disciplina'
      ReadOnly = True
    end
    object FQyDisciplinasanosemestre: TSmallintField
      FieldName = 'anosemestre'
      ReadOnly = True
    end
    object FQyDisciplinasserie: TSmallintField
      FieldName = 'serie'
      ReadOnly = True
    end
    object FQyDisciplinasturma: TStringField
      FieldName = 'turma'
      Required = True
      Size = 50
    end
  end
  object FDsDisciplinas: TDataSource
    AutoEdit = False
    DataSet = FQyDisciplinas
    Left = 360
    Top = 176
  end
end
