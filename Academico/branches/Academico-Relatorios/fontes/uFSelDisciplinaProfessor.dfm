object fSelDisciplinaProfessor: TfSelDisciplinaProfessor
  Left = 0
  Top = 0
  BorderStyle = bsDialog
  Caption = 'Sele'#231#227'o de Disciplina'
  ClientHeight = 361
  ClientWidth = 644
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object bvSep1: TBevel
    Left = 0
    Top = 22
    Width = 644
    Height = 3
    Align = alTop
    Shape = bsSpacer
    ExplicitWidth = 594
  end
  object bvSep2: TBevel
    Left = 0
    Top = 57
    Width = 644
    Height = 3
    Align = alTop
    Shape = bsSpacer
    ExplicitTop = 30
    ExplicitWidth = 594
  end
  object pnTitulo: TPanel
    Left = 0
    Top = 0
    Width = 644
    Height = 22
    Align = alTop
    BevelOuter = bvLowered
    Caption = 'Selecionar Disciplina'
    Color = clBlue
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindow
    Font.Height = -13
    Font.Name = 'Arial'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 0
  end
  object pnFiltro: TPanel
    Left = 0
    Top = 25
    Width = 644
    Height = 32
    Align = alTop
    BevelOuter = bvNone
    TabOrder = 1
    object lbAnoSem: TLabel
      Left = 473
      Top = 6
      Width = 76
      Height = 14
      Caption = 'ANOSEMESTRE'
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Arial'
      Font.Style = []
      ParentFont = False
      Visible = False
    end
    object lbTurmaT: TLabel
      Left = 17
      Top = 8
      Width = 38
      Height = 14
      Caption = 'Turma:'
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Arial'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object bnSelTurma: TSpeedButton
      Left = 189
      Top = 5
      Width = 23
      Height = 21
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
      OnClick = SelecionaTurma
    end
    object lbGrade: TLabel
      Left = 218
      Top = 9
      Width = 36
      Height = 14
      Caption = 'Grade:'
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Arial'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object edTurma: TEdit
      Left = 62
      Top = 5
      Width = 121
      Height = 21
      TabOrder = 0
      OnKeyPress = FiltraTurma
    end
  end
  object pnGeral: TPanel
    Left = 0
    Top = 60
    Width = 644
    Height = 301
    Align = alClient
    BevelOuter = bvNone
    TabOrder = 2
    object dgGrade: TDBGrid
      Left = 0
      Top = 0
      Width = 644
      Height = 265
      Align = alTop
      DataSource = dsGrade
      Options = [dgTitles, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgConfirmDelete, dgCancelOnExit]
      TabOrder = 0
      TitleFont.Charset = DEFAULT_CHARSET
      TitleFont.Color = clWindowText
      TitleFont.Height = -11
      TitleFont.Name = 'Tahoma'
      TitleFont.Style = []
      OnDblClick = Seleciona
      Columns = <
        item
          Expanded = False
          FieldName = 'curso'
          Title.Caption = 'Curso'
          Width = 57
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'serie'
          Title.Caption = 'S'#233'rie'
          Width = 39
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'descricao'
          Title.Caption = 'Disciplina'
          Width = 215
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'sigla'
          Title.Caption = 'Sigla'
          Width = 61
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'nm_pessoa'
          Title.Caption = 'Professor'
          Width = 239
          Visible = True
        end>
    end
    object bnOK: TBitBtn
      Left = 431
      Top = 271
      Width = 75
      Height = 25
      Caption = 'Ok'
      Default = True
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Arial'
      Font.Style = []
      ModalResult = 1
      ParentFont = False
      TabOrder = 1
      Glyph.Data = {
        DE010000424DDE01000000000000760000002800000024000000120000000100
        0400000000006801000000000000000000001000000000000000000000000000
        80000080000000808000800000008000800080800000C0C0C000808080000000
        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333333333333
        3333333333333333333333330000333333333333333333333333F33333333333
        00003333344333333333333333388F3333333333000033334224333333333333
        338338F3333333330000333422224333333333333833338F3333333300003342
        222224333333333383333338F3333333000034222A22224333333338F338F333
        8F33333300003222A3A2224333333338F3838F338F33333300003A2A333A2224
        33333338F83338F338F33333000033A33333A222433333338333338F338F3333
        0000333333333A222433333333333338F338F33300003333333333A222433333
        333333338F338F33000033333333333A222433333333333338F338F300003333
        33333333A222433333333333338F338F00003333333333333A22433333333333
        3338F38F000033333333333333A223333333333333338F830000333333333333
        333A333333333333333338330000333333333333333333333333333333333333
        0000}
      NumGlyphs = 2
    end
    object bnCancel: TBitBtn
      Left = 512
      Top = 271
      Width = 75
      Height = 25
      Cancel = True
      Caption = 'Cancelar'
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Arial'
      Font.Style = []
      ModalResult = 2
      ParentFont = False
      TabOrder = 2
      Glyph.Data = {
        DE010000424DDE01000000000000760000002800000024000000120000000100
        0400000000006801000000000000000000001000000000000000000000000000
        80000080000000808000800000008000800080800000C0C0C000808080000000
        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333333333333
        333333333333333333333333000033338833333333333333333F333333333333
        0000333911833333983333333388F333333F3333000033391118333911833333
        38F38F333F88F33300003339111183911118333338F338F3F8338F3300003333
        911118111118333338F3338F833338F3000033333911111111833333338F3338
        3333F8330000333333911111183333333338F333333F83330000333333311111
        8333333333338F3333383333000033333339111183333333333338F333833333
        00003333339111118333333333333833338F3333000033333911181118333333
        33338333338F333300003333911183911183333333383338F338F33300003333
        9118333911183333338F33838F338F33000033333913333391113333338FF833
        38F338F300003333333333333919333333388333338FFF830000333333333333
        3333333333333333333888330000333333333333333333333333333333333333
        0000}
      NumGlyphs = 2
    end
  end
  object qyGrade: TUMZQuery
    Connection = DM.db
    SQL.Strings = (
      'SELECT'
      #9't.grau,'
      #9't.codigo AS cd_turma,'
      #9't.cd_grade,'
      #9't.curso,'
      #9't.serie,'
      #9'gd.CD_DISCIPLINA AS disciplina,'
      #9'gd.NR_AULAS AS numeroaulas,'
      #9'd.sigla,'
      #9'd.descricao,'
      #9'p.cd_pessoa,'
      #9'COALESCE(p.nm_pessoa, "<Professor n'#227'o definido>") as nm_pessoa'
      'FROM'
      #9'turmas t'
      #9'INNER JOIN grades_disciplinas gd ON ( '
      
        #9#9'gd.CD_CURSO = t.curso AND gd.CD_GRADE = t.cd_grade AND gd.NR_S' +
        'ERIE = t.serie '
      #9')'
      ''
      #9'LEFT JOIN turmasprofessores tp ON ('
      #9#9'tp.anosemestre = t.anosemestre AND tp.curso = gd.CD_CURSO AND '
      #9#9'tp.turma = t.codigo AND tp.disciplina = gd.CD_DISCIPLINA'
      #9')'
      ''
      
        #9'LEFT JOIN disciplinas d ON ( d.curso = gd.CD_CURSO AND d.codigo' +
        ' = gd.CD_DISCIPLINA )'
      #9
      #9'LEFT JOIN pessoas p ON ( p.cd_pessoa = tp.professor )'
      'WHERE'
      '  t.codigo = :turma AND'
      '  t.anosemestre = :anosemestre'
      'ORDER BY'
      '  d.ordem, d.descricao')
    Params = <
      item
        DataType = ftString
        Name = 'Turma'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'AnoSemestre'
        ParamType = ptUnknown
      end>
    Left = 432
    Top = 136
    ParamData = <
      item
        DataType = ftString
        Name = 'Turma'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'AnoSemestre'
        ParamType = ptUnknown
      end>
  end
  object dsGrade: TDataSource
    AutoEdit = False
    DataSet = qyGrade
    Left = 432
    Top = 168
  end
end
