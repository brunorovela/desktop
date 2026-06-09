object frmDigAulasDadas: TfrmDigAulasDadas
  Left = 218
  Top = 137
  Caption = 'Digita'#231#227'o de Aulas Dadas'
  ClientHeight = 441
  ClientWidth = 714
  Color = clBtnFace
  Font.Charset = ANSI_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Arial'
  Font.Style = []
  KeyPreview = True
  OldCreateOrder = True
  Position = poScreenCenter
  OnClose = FormClose
  OnDestroy = FormDestroy
  OnKeyDown = FormKeyDown
  OnPaint = FormPaint
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 14
  object btnFechar: TSpeedButton
    Left = 615
    Top = 400
    Width = 87
    Height = 25
    Hint = 'Sair'
    Caption = 'F12 &Fechar'
    Flat = True
    Glyph.Data = {
      F6000000424DF600000000000000760000002800000010000000100000000100
      04000000000080000000CE0E0000C40E00001000000000000000000000000000
      80000080000000808000800000008000800080800000C0C0C000808080000000
      FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00777777777777
      7777777777777777777777777744447777777777444444447777777444777744
      4777777447777774477777447777777744777744777777774477774477777777
      4477774477777777447777744777747447777774477774444777777777777444
      7777777777777444477777777777777777777777777777777777}
    OnClick = btnFecharClick
  end
  object Label1: TLabel
    Left = 10
    Top = 364
    Width = 40
    Height = 16
    Caption = 'Turma'
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Arial'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object lblM1: TLabel
    Left = 296
    Top = 364
    Width = 78
    Height = 16
    Alignment = taRightJustify
    Caption = 'Aulas Dadas'
    FocusControl = dbeN1
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Arial'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object Bevel1: TBevel
    Left = 4
    Top = 348
    Width = 701
    Height = 2
  end
  object Bevel2: TBevel
    Left = 3
    Top = 391
    Width = 702
    Height = 3
  end
  object Label7: TLabel
    Left = 515
    Top = 117
    Width = 48
    Height = 14
    Caption = 'Disciplina:'
  end
  object btnDisciplina: TSpeedButton
    Left = 672
    Top = 113
    Width = 33
    Height = 23
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
    OnClick = btnDisciplinaClick
  end
  object Label8: TLabel
    Left = 8
    Top = 397
    Width = 63
    Height = 16
    Caption = 'Professor:'
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Arial'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object Label9: TLabel
    Left = 516
    Top = 52
    Width = 47
    Height = 14
    Caption = 'Ano/Sem.'
  end
  object Label3: TLabel
    Left = 8
    Top = 416
    Width = 66
    Height = 16
    Caption = 'Disciplina:'
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Arial'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object DBText2: TDBText
    Left = 91
    Top = 417
    Width = 438
    Height = 14
    DataField = 'descricao'
    DataSource = dtcFicha
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Arial'
    Font.Style = [fsBold]
    ParentFont = False
    Transparent = True
  end
  object Label4: TLabel
    Left = 530
    Top = 85
    Width = 33
    Height = 14
    Caption = 'Turma:'
  end
  object btnTurmas: TSpeedButton
    Left = 672
    Top = 81
    Width = 33
    Height = 23
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
    OnClick = btnTurmasClick
  end
  object Bevel3: TBevel
    Left = 0
    Top = 0
    Width = 714
    Height = 6
    Align = alTop
    Shape = bsSpacer
    ExplicitWidth = 722
  end
  object Bevel4: TBevel
    Left = 0
    Top = 31
    Width = 714
    Height = 6
    Align = alTop
    Shape = bsSpacer
    ExplicitWidth = 722
  end
  object DBText3: TDBText
    Left = 91
    Top = 398
    Width = 438
    Height = 14
    DataField = 'nm_pessoa'
    DataSource = dtcFicha
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Arial'
    Font.Style = [fsBold]
    ParentFont = False
    Transparent = True
  end
  object Label5: TLabel
    Left = 515
    Top = 149
    Width = 48
    Height = 14
    Caption = 'Professor'
  end
  object btnProfessor: TSpeedButton
    Left = 672
    Top = 145
    Width = 33
    Height = 23
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
    OnClick = btnProfessorClick
  end
  object lblMensagemNr_Aulas: TLabel
    Left = 471
    Top = 356
    Width = 230
    Height = 28
    Caption = 
      'A quantidade de aulas dadas '#233' calculada pelas aulas cadastradas ' +
      'no di'#225'rio de classe.'
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Arial'
    Font.Style = []
    ParentFont = False
    Visible = False
    WordWrap = True
  end
  object dbeN1: TDBEdit
    Left = 384
    Top = 360
    Width = 81
    Height = 24
    DataField = 'numeroaulas'
    DataSource = dsDigita
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Arial'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 1
    OnKeyDown = dbeN1KeyDown
    OnKeyPress = dbeN1KeyPress
  end
  object Panel3: TPanel
    Left = 0
    Top = 6
    Width = 714
    Height = 25
    Align = alTop
    BevelOuter = bvLowered
    Caption = 'DIGITA'#199#195'O DE AULAS DADAS'
    Color = clBlue
    Font.Charset = ANSI_CHARSET
    Font.Color = clWhite
    Font.Height = -16
    Font.Name = 'Arial'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 6
  end
  object grd: TDBGrid
    Left = 8
    Top = 37
    Width = 493
    Height = 297
    BorderStyle = bsNone
    DataSource = dtcFicha
    Options = [dgTitles, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgAlwaysShowSelection, dgConfirmDelete, dgCancelOnExit]
    PopupMenu = pmQtd
    TabOrder = 2
    TitleFont.Charset = ANSI_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'Arial'
    TitleFont.Style = []
    OnCellClick = grdCellClick
    Columns = <
      item
        Expanded = False
        FieldName = 'anosemestre'
        Width = 50
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'curso'
        Width = 60
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'turma'
        Width = 60
        Visible = True
      end
      item
        Alignment = taCenter
        Expanded = False
        FieldName = 'sigla'
        Title.Alignment = taCenter
        Title.Caption = 'Disciplina'
        Width = 70
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'nm_pessoa'
        Width = 150
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'numeroaulas'
        Title.Caption = 'Aulas dadas'
        Width = 67
        Visible = True
      end>
  end
  object dbeCodigo: TDBEdit
    Left = 72
    Top = 360
    Width = 169
    Height = 24
    DataField = 'turma'
    DataSource = dsDigita
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Arial'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 0
    OnKeyDown = dbeCodigoKeyDown
    OnKeyPress = dbeCodigoKeyPress
  end
  object txtDisciplina: TEdit
    Left = 566
    Top = 113
    Width = 107
    Height = 22
    TabStop = False
    CharCase = ecUpperCase
    TabOrder = 3
    OnKeyPress = txtCodigoAlunoKeyPress
  end
  object txtAnoSemestre: TMaskEdit
    Left = 566
    Top = 48
    Width = 55
    Height = 22
    TabStop = False
    EditMask = '9999/9;0;_'
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Arial'
    Font.Style = []
    MaxLength = 6
    ParentFont = False
    TabOrder = 4
    OnExit = txtAnoSemestreExit
    OnKeyPress = txtAnoSemestreKeyPress
  end
  object UpDown2: TUpDown
    Left = 617
    Top = 48
    Width = 16
    Height = 24
    Min = -100
    TabOrder = 5
    OnClick = UpDown2Click
  end
  object txtTurma: TEdit
    Left = 566
    Top = 81
    Width = 107
    Height = 22
    TabStop = False
    CharCase = ecUpperCase
    TabOrder = 7
    OnKeyPress = txtTurmaKeyPress
  end
  object txtProfessor: TEdit
    Left = 566
    Top = 145
    Width = 107
    Height = 22
    TabStop = False
    CharCase = ecUpperCase
    TabOrder = 8
    OnKeyPress = txtCodigoAlunoKeyPress
  end
  object tblAulas: TUMZQuery
    Connection = DM.db
    AfterOpen = tblAulasAfterOpen
    Filtered = True
    AfterPost = tblAulasAfterPost
    SQL.Strings = (
      'SELECT'
      #9'tp.cd_turmaprofessor,'
      #9'tp.anosemestre,'
      #9'd.curso,'
      #9'tp.turma,'
      #9'tp.disciplina,'
      #9'COALESCE('
      #9#9'('
      #9#9'SELECT'
      #9#9#9' SUM( DA.QTD_AULAS ) QTD_AULAS '
      #9#9#9'FROM'
      #9#9#9' DIARIO_AULAS DA '
      #9#9#9'WHERE'
      #9#9#9' DA.TURMA = tp.turma '
      #9#9#9'AND'
      #9#9#9' DA.DISCIPLINA = tp.disciplina '
      #9#9#9'AND'
      #9#9#9' DA.ANOSEMESTRE = tp.anosemestre'#9
      #9#9'),tp.numeroaulas'
      #9') AS numeroaulas,'
      #9'd.ordem,'
      #9'tp.professor,'
      #9'd.sigla,'
      #9'd.descricao,'
      #9'p.nm_pessoa'
      'FROM'
      '  turmasprofessores tp,'
      '  disciplinas d,'
      '  pessoas p'
      'WHERE'
      '  tp.disciplina = d.codigo'
      '  AND tp.curso = d.curso'
      '  AND tp.professor = p.cd_pessoa')
    Params = <>
    Left = 32
    Top = 224
    object tblAulasanosemestre: TSmallintField
      DisplayLabel = 'Ano/Sem.'
      FieldName = 'anosemestre'
      Origin = 'WMESTRE12.turmasprofessores.anosemestre'
    end
    object tblAulascurso: TStringField
      DisplayLabel = 'Curso'
      FieldName = 'curso'
      Origin = 'WMESTRE12.turmasprofessores.curso'
      Size = 15
    end
    object tblAulasturma: TStringField
      DisplayLabel = 'Turma'
      FieldName = 'turma'
      Origin = 'WMESTRE12.turmasprofessores.turma'
      Size = 50
    end
    object tblAulasdisciplina: TIntegerField
      DisplayLabel = 'Disciplina'
      FieldName = 'disciplina'
      Origin = 'WMESTRE12.turmasprofessores.disciplina'
    end
    object tblAulasprofessor: TIntegerField
      DisplayLabel = 'Professor'
      FieldName = 'professor'
      Origin = 'WMESTRE12.turmasprofessores.professor'
    end
    object tblAulasnumeroaulas: TLargeintField
      FieldName = 'numeroaulas'
    end
    object tblAulasordem: TSmallintField
      FieldName = 'ordem'
      Origin = 'WMESTRE12.disciplinas.ordem'
    end
    object tblAulassigla: TStringField
      DisplayLabel = 'Sigla'
      FieldName = 'sigla'
      Origin = 'WMESTRE12.disciplinas.sigla'
      Size = 10
    end
    object tblAulasdescricao: TStringField
      DisplayLabel = 'Disciplina'
      FieldName = 'descricao'
      Origin = 'WMESTRE12.disciplinas.descricao'
      Size = 50
    end
    object tblAulasnm_pessoa: TStringField
      DisplayLabel = 'Professor'
      FieldName = 'nm_pessoa'
      Origin = 'WMESTRE12.pessoas.nm_pessoa'
      Size = 60
    end
  end
  object dtcFicha: TDataSource
    DataSet = tblAulas
    OnDataChange = dtcFichaDataChange
    Left = 32
    Top = 272
  end
  object tblDigita: TUMZQuery
    Connection = DM.db
    SQL.Strings = (
      'select * from turmasprofessores'
      'where turma = :turma and professor = :professor '
      'and disciplina = :disciplina and curso = :curso '
      'and anosemestre = :anosemestre')
    Params = <
      item
        DataType = ftUnknown
        Name = 'turma'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'professor'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'disciplina'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'curso'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'anosemestre'
        ParamType = ptUnknown
      end>
    Left = 104
    Top = 224
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'turma'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'professor'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'disciplina'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'curso'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'anosemestre'
        ParamType = ptUnknown
      end>
  end
  object dsDigita: TDataSource
    DataSet = tblDigita
    Left = 104
    Top = 264
  end
  object pmQtd: TPopupMenu
    OnPopup = pmQtdPopup
    Left = 664
    Top = 240
  end
  object qryAulasDadasDiario: TUMZQuery
    Connection = DM.db
    SQL.Strings = (
      'SELECT'
      #9'SUM( da.qtd_aulas ) qtd_aulas'
      'FROM'
      #9'diario_aulas da'
      'WHERE'
      #9'da.turma = :turma'
      'AND da.disciplina = :disciplina'
      'AND da.anosemestre = :anosemestre;')
    Params = <
      item
        DataType = ftUnknown
        Name = 'turma'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'disciplina'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'anosemestre'
        ParamType = ptUnknown
      end>
    Left = 432
    Top = 304
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'turma'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'disciplina'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'anosemestre'
        ParamType = ptUnknown
      end>
  end
  object qryAtualizaNr_Aulas: TUMZQuery
    Connection = DM.db
    SQL.Strings = (
      'UPDATE'
      '  turmasprofessores'
      'SET'
      '  numeroaulas = :qtd_aulas'
      'WHERE'
      '  anosemestre = :anosemestre AND'
      '  turma = :turma AND'
      '  disciplina = :disciplina'
      '')
    Params = <
      item
        DataType = ftUnknown
        Name = 'qtd_aulas'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'anosemestre'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'turma'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'disciplina'
        ParamType = ptUnknown
      end>
    Left = 464
    Top = 304
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'qtd_aulas'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'anosemestre'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'turma'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'disciplina'
        ParamType = ptUnknown
      end>
  end
end
