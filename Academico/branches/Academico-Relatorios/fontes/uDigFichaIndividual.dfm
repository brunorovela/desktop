object frmDigFichaIndividual: TfrmDigFichaIndividual
  Left = 218
  Top = 137
  Caption = 'Digita'#231#227'o de M'#233'dias e Faltas...'
  ClientHeight = 595
  ClientWidth = 800
  Color = clBtnFace
  Font.Charset = ANSI_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Arial'
  Font.Style = []
  FormStyle = fsMDIChild
  KeyPreview = True
  OldCreateOrder = False
  Position = poDesigned
  Visible = True
  WindowState = wsMaximized
  OnClose = FormClose
  OnCreate = FormCreate
  OnDestroy = FormDestroy
  OnKeyDown = FormKeyDown
  OnPaint = FormPaint
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 14
  object Panel3: TPanel
    Left = 0
    Top = 0
    Width = 800
    Height = 25
    Align = alTop
    BevelOuter = bvLowered
    Caption = 'DIGITA'#199#195'O DE M'#201'DIAS E FALTAS'
    Color = clBlue
    Font.Charset = ANSI_CHARSET
    Font.Color = clWhite
    Font.Height = -16
    Font.Name = 'Arial'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 0
  end
  object Panel1: TPanel
    Left = 285
    Top = 25
    Width = 515
    Height = 500
    Align = alClient
    BevelKind = bkFlat
    BevelOuter = bvNone
    TabOrder = 2
    object Panel2: TPanel
      Left = 0
      Top = 0
      Width = 511
      Height = 92
      Align = alTop
      BiDiMode = bdLeftToRight
      ParentBiDiMode = False
      TabOrder = 0
      object Label5: TLabel
        Left = 309
        Top = 47
        Width = 30
        Height = 14
        Caption = 'Etapa:'
      end
      object Label7: TLabel
        Left = 161
        Top = 47
        Width = 48
        Height = 14
        Caption = 'Disciplina:'
      end
      object btnDisciplina: TSpeedButton
        Left = 261
        Top = 62
        Width = 22
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
        OnClick = btnDisciplinaClick
      end
      object Label9: TLabel
        Left = 13
        Top = 6
        Width = 72
        Height = 14
        Caption = 'Ano/Semestre:'
      end
      object Label4: TLabel
        Left = 13
        Top = 47
        Width = 33
        Height = 14
        Caption = 'Turma:'
      end
      object btnTurmas: TSpeedButton
        Left = 113
        Top = 62
        Width = 22
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
        OnClick = btnTurmasClick
      end
      object lblCodigoAluno: TLabel
        Left = 161
        Top = 6
        Width = 56
        Height = 14
        Caption = 'C'#243'd. Aluno:'
      end
      object SpeedButton2: TSpeedButton
        Left = 261
        Top = 21
        Width = 22
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
        OnClick = SpeedButton2Click
      end
      object txtBimestre: TMaskEdit
        Left = 309
        Top = 62
        Width = 47
        Height = 22
        TabStop = False
        EditMask = '99;0; '
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Arial'
        Font.Style = []
        MaxLength = 2
        ParentFont = False
        TabOrder = 4
        Text = '01'
        OnExit = txtBimestreExit
      end
      object UpDown1: TUpDown
        Left = 358
        Top = 61
        Width = 15
        Height = 24
        Min = 1
        Max = 10
        Position = 1
        TabOrder = 6
        OnClick = UpDown1Click
      end
      object txtDisciplina: TEdit
        Left = 161
        Top = 62
        Width = 98
        Height = 22
        TabStop = False
        CharCase = ecUpperCase
        ReadOnly = True
        TabOrder = 5
        OnKeyDown = txtDisciplinaKeyDown
        OnKeyPress = txtCodigoAlunoKeyPress
      end
      object txtAnoSemestre: TMaskEdit
        Left = 13
        Top = 21
        Width = 104
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
        TabOrder = 0
        OnExit = txtAnoSemestreExit
        OnKeyPress = txtAnoSemestreKeyPress
      end
      object UpDown2: TUpDown
        Left = 119
        Top = 20
        Width = 16
        Height = 24
        Min = -100
        TabOrder = 1
        OnClick = UpDown2Click
      end
      object txtTurma: TEdit
        Left = 13
        Top = 62
        Width = 99
        Height = 22
        TabStop = False
        CharCase = ecUpperCase
        ReadOnly = True
        TabOrder = 3
        OnKeyDown = txtTurmaKeyDown
        OnKeyPress = txtTurmaKeyPress
      end
      object txtCodigoAluno: TEdit
        Left = 161
        Top = 21
        Width = 98
        Height = 22
        ReadOnly = True
        TabOrder = 2
        OnExit = txtCodigoAlunoExit
        OnKeyDown = txtCodigoAlunoKeyDown
        OnKeyPress = txtCodigoAlunoKeyPress
      end
    end
    object grd: TDBGrid
      Left = 0
      Top = 92
      Width = 511
      Height = 404
      Align = alClient
      BorderStyle = bsNone
      DataSource = dtcFicha
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Arial'
      Font.Style = []
      Options = [dgTitles, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgAlwaysShowSelection, dgConfirmDelete, dgCancelOnExit]
      ParentFont = False
      PopupMenu = pmQtd
      TabOrder = 1
      TitleFont.Charset = ANSI_CHARSET
      TitleFont.Color = clWindowText
      TitleFont.Height = -11
      TitleFont.Name = 'Arial'
      TitleFont.Style = []
      OnCellClick = grdCellClick
      Columns = <
        item
          Alignment = taCenter
          Expanded = False
          FieldName = 'nr_aluno'
          Title.Alignment = taCenter
          Width = 30
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'CodigoAluno'
          Title.Caption = 'C'#243'digo'
          Width = 70
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'Nome'
          Width = 200
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'Turma'
          Width = 100
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'Sigla'
          Title.Caption = 'Disciplina'
          Width = 57
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'M1'
          Width = 40
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'nr_faltas_injustificadas'
          Title.Caption = 'Fi1'
          Visible = False
        end
        item
          Expanded = False
          FieldName = 'nr_faltas_justificadas'
          Title.Caption = 'Fj1'
          Visible = False
        end
        item
          Expanded = False
          FieldName = 'F1'
          Width = 40
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'Exame1'
          Width = 40
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'ds_comportamento'
          Title.Caption = 'Comportamento'
          Visible = False
        end
        item
          Expanded = False
          FieldName = 'DescricaoSituacao'
          Title.Caption = 'Situa'#231#227'o'
          Width = 55
          Visible = True
        end>
    end
  end
  object Panel4: TPanel
    Left = 0
    Top = 525
    Width = 800
    Height = 45
    Align = alBottom
    TabOrder = 3
    object Label8: TLabel
      Left = 9
      Top = 24
      Width = 73
      Height = 14
      Caption = 'Professores:'
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Arial'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object lblProfessores: TLabel
      Left = 87
      Top = 24
      Width = 139
      Height = 14
      Caption = 'Professores - Set at Runtime'
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Arial'
      Font.Style = []
      ParentFont = False
    end
    object Label3: TLabel
      Left = 24
      Top = 8
      Width = 55
      Height = 14
      Caption = 'Disciplina:'
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Arial'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object DBText2: TDBText
      Left = 87
      Top = 8
      Width = 709
      Height = 14
      DataField = 'DS_Disciplinas'
      DataSource = dtcFicha
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Arial'
      Font.Style = []
      ParentFont = False
      Transparent = True
    end
  end
  object ScrollBox1: TScrollBox
    Left = 0
    Top = 25
    Width = 285
    Height = 500
    Align = alLeft
    TabOrder = 1
    object Panel5: TPanel
      Left = 0
      Top = 0
      Width = 281
      Height = 496
      Align = alClient
      BevelOuter = bvNone
      TabOrder = 0
      object Label1: TLabel
        Left = 9
        Top = 150
        Width = 39
        Height = 14
        Caption = 'C'#243'digo: '
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
      end
      object Label2: TLabel
        Left = 9
        Top = 100
        Width = 31
        Height = 14
        Caption = 'Aluno:'
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
      end
      object DBText1: TDBText
        Left = 9
        Top = 118
        Width = 264
        Height = 27
        DataField = 'Nome'
        DataSource = dtcFicha
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        ParentFont = False
        Transparent = True
        WordWrap = True
      end
      object lblM1: TLabel
        Left = 9
        Top = 194
        Width = 14
        Height = 14
        Caption = 'M1'
        FocusControl = dbeN1
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
      end
      object lblF1: TLabel
        Left = 9
        Top = 301
        Width = 15
        Height = 14
        Caption = 'F1:'
        FocusControl = dbeF1
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
      end
      object lblM1Info: TLabel
        Left = 9
        Top = 234
        Width = 144
        Height = 14
        Caption = '(Nota Digitada Manualmente)'
        FocusControl = dbeN1
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Arial'
        Font.Style = [fsItalic]
        ParentFont = False
      end
      object Label6: TLabel
        Left = 9
        Top = 259
        Width = 98
        Height = 14
        Caption = 'Faltas Injustificadas:'
        FocusControl = edFaltasInjustificadas
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
      end
      object Label10: TLabel
        Left = 129
        Top = 259
        Width = 93
        Height = 14
        Caption = 'Faltas Justificadas:'
        FocusControl = edFaltasJustificadas
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
      end
      object Label11: TLabel
        Left = 9
        Top = 347
        Width = 125
        Height = 14
        Caption = 'Comportamento (etapa x):'
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
        Visible = False
      end
      object dbeCodigo: TDBEdit
        Left = 9
        Top = 166
        Width = 110
        Height = 22
        DataField = 'CodigoAluno'
        DataSource = DM.dtcFichaIndividual
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
        ReadOnly = True
        TabOrder = 1
        OnKeyDown = dbeCodigoKeyDown
        OnKeyPress = dbeCodigoKeyPress
      end
      object dbeN1: TDBEdit
        Left = 9
        Top = 209
        Width = 110
        Height = 22
        DataField = 'Nota1'
        DataSource = DM.dtcFichaIndividual
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
        TabOrder = 2
        OnEnter = dbeN1Enter
        OnKeyDown = dbeN1KeyDown
        OnKeyPress = dbeN1KeyPress
      end
      object dbeF1: TDBEdit
        Left = 9
        Top = 316
        Width = 110
        Height = 22
        DataField = 'Falta1'
        DataSource = DM.dtcFichaIndividual
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
        TabOrder = 5
        OnKeyDown = dbeF1KeyDown
        OnKeyPress = dbeF1KeyPress
      end
      object radOpcoes: TRadioGroup
        Left = 9
        Top = 6
        Width = 264
        Height = 80
        Caption = 'Op'#231#245'es:'
        Columns = 2
        ItemIndex = 0
        Items.Strings = (
          'M'#233'dia'
          'Exame'
          'Exame Final'
          '2a. '#201'poca'
          'Conceitos'
          'Comportamento')
        TabOrder = 0
        OnClick = radOpcoesClick
      end
      object edFaltasInjustificadas: TEdit
        Left = 11
        Top = 273
        Width = 110
        Height = 22
        BiDiMode = bdLeftToRight
        ParentBiDiMode = False
        TabOrder = 3
        OnExit = edFaltasInjustificadasExit
        OnKeyDown = edFaltasInjustificadasKeyDown
        OnKeyPress = edFaltasInjustificadasKeyPress
      end
      object edFaltasJustificadas: TEdit
        Left = 129
        Top = 273
        Width = 110
        Height = 22
        BiDiMode = bdLeftToRight
        ParentBiDiMode = False
        TabOrder = 4
        OnExit = edFaltasJustificadasExit
        OnKeyDown = edFaltasJustificadasKeyDown
        OnKeyPress = edFaltasJustificadasKeyPress
      end
      object cbComportamento: TComboBox
        Left = 9
        Top = 363
        Width = 231
        Height = 20
        Style = csOwnerDrawFixed
        ItemHeight = 14
        TabOrder = 6
        OnChange = cbComportamentoChange
      end
    end
  end
  object toolPessoa: TToolBar
    Left = 0
    Top = 570
    Width = 800
    Height = 25
    Align = alBottom
    ButtonWidth = 82
    Caption = 'toolPessoa'
    EdgeBorders = [ebTop, ebBottom]
    Images = ImageList1
    List = True
    ShowCaptions = True
    TabOrder = 4
    object ToolButton1: TToolButton
      Left = 0
      Top = 0
      Caption = 'F12 Fechar'
      ImageIndex = 7
      OnClick = btnFecharClick
    end
    object ToolButton2: TToolButton
      Left = 82
      Top = 0
      Width = 8
      Caption = 'ToolButton2'
      ImageIndex = 8
      Style = tbsSeparator
    end
  end
  object cbDispensadoPi: TCheckBox
    Left = 11
    Top = 416
    Width = 110
    Height = 17
    Caption = 'Dispensado da PI'
    TabOrder = 5
    Visible = False
    OnClick = cbDispensadoPiClick
  end
  object tblFicha: TUMZQuery
    Connection = DM.db
    OnCalcFields = tblFichaCalcFields
    Filtered = True
    SQL.Strings = (
      'SELECT '
      '   m.nr_aluno, f.*, '
      '   p.nm_pessoa as nome, '
      '   d.sigla, d.descricao As ds_disciplinas,'
      '   gd.CD_GRADE as cd_grade,'
      '   gd.CD_CURSO,'
      #9' gd.CD_DISCIPLINA,'
      #9' gd.NR_SERIE'
      'FROM '
      
        '  pessoas p INNER JOIN fichaIndividual f ON (p.cd_pessoa = f.cod' +
        'igoaluno)'
      
        #9'INNER JOIN TURMAS as t ON (t.codigo = f.turma and f.anosemestre' +
        ' = t.anosemestre)'
      
        #9'INNER JOIN GRADES as g ON (g.cd_grade = t.cd_grade and t.curso ' +
        '= g.CD_CURSO)'
      
        #9'INNER JOIN grades_disciplinas as gd ON (gd.CD_GRADE = g.CD_GRAD' +
        'E AND gd.CD_CURSO = f.curso AND gd.CD_DISCIPLINA = f.disciplina)'
      
        '  INNER JOIN matriculas m ON (f.codigoaluno = m.codigoaluno) AND' +
        ' (f.turmamatricula = m.turma) AND (f.anosemestre = m.anosemestre' +
        ')'
      
        #9'INNER JOIN disciplinas d ON (f.Curso = d.Curso) AND (f.discipli' +
        'na = d.codigo)'
      'WHERE f.codigoaluno = 999999')
    Params = <>
    Left = 296
    Top = 160
    object tblFichaCodigoAluno: TIntegerField
      DisplayLabel = 'C'#243'd.'
      FieldName = 'CodigoAluno'
      Origin = 'FichaIndividual.CodigoAluno'
      DisplayFormat = '00000-0'
      EditFormat = '000000'
    end
    object tblFichaNome: TStringField
      DisplayWidth = 50
      FieldName = 'Nome'
      Origin = 'Alunos.Nome'
      Size = 45
    end
    object tblFichaAnoSemestre: TSmallintField
      FieldName = 'AnoSemestre'
      Origin = 'FichaIndividual.AnoSemestre'
    end
    object tblFichaTurma: TStringField
      Alignment = taCenter
      FieldName = 'Turma'
      Origin = 'FichaIndividual.Turma'
      Size = 50
    end
    object tblFichaCurso: TStringField
      FieldName = 'Curso'
      Origin = 'FichaIndividual.CodigoAluno'
      Size = 15
    end
    object tblFichaNota1: TFloatField
      Tag = 1
      DisplayLabel = 'M1'
      FieldName = 'Nota1'
      Origin = 'FichaIndividual.Disciplina'
      OnGetText = tblFichaNota1GetText
      DisplayFormat = '#0.0'
    end
    object tblFichaExame1: TFloatField
      Tag = 1
      DisplayLabel = 'E1'
      FieldName = 'Exame1'
      Origin = 'FichaIndividual.Falta1'
      OnGetText = tblFichaExame1GetText
      DisplayFormat = '#0.0'
    end
    object tblFichaNota2: TFloatField
      Tag = 1
      DisplayLabel = 'M2'
      FieldName = 'Nota2'
      Origin = 'FichaIndividual.Exame1'
      OnGetText = tblFichaNota1GetText
      DisplayFormat = '#0.0'
    end
    object tblFichaExame2: TFloatField
      Tag = 1
      DisplayLabel = 'E2'
      FieldName = 'Exame2'
      Origin = 'FichaIndividual.Falta2'
      OnGetText = tblFichaExame1GetText
      DisplayFormat = '#0.0'
    end
    object tblFichaNota3: TFloatField
      Tag = 1
      DisplayLabel = 'M3'
      FieldName = 'Nota3'
      Origin = 'FichaIndividual.Exame2'
      OnGetText = tblFichaNota1GetText
      DisplayFormat = '#0.0'
    end
    object tblFichaExame3: TFloatField
      Tag = 1
      DisplayLabel = 'E3'
      FieldName = 'Exame3'
      Origin = 'FichaIndividual.Falta3'
      OnGetText = tblFichaExame1GetText
      DisplayFormat = '#0.0'
    end
    object tblFichaNota4: TFloatField
      Tag = 1
      DisplayLabel = 'M4'
      FieldName = 'Nota4'
      Origin = 'FichaIndividual.Exame3'
      OnGetText = tblFichaNota1GetText
      DisplayFormat = '#0.0'
    end
    object tblFichaExame4: TFloatField
      Tag = 1
      DisplayLabel = 'E4'
      FieldName = 'Exame4'
      Origin = 'FichaIndividual.Falta4'
      OnGetText = tblFichaExame1GetText
      DisplayFormat = '#0.0'
    end
    object tblFichaNotaExame: TFloatField
      Tag = 1
      DisplayLabel = 'Ex.F'
      FieldName = 'NotaExame'
      Origin = 'FichaIndividual.Exame4'
      OnGetText = tblFichaNota1GetText
      DisplayFormat = '#0.00'
    end
    object tblFichaSituacao: TSmallintField
      FieldName = 'Situacao'
      Origin = 'FichaIndividual.2aEpoca'
    end
    object tblFichaSigla: TStringField
      Alignment = taCenter
      DisplayLabel = 'Discip'
      FieldName = 'Sigla'
      Size = 10
    end
    object tblFichaDescricaoSituacao: TStringField
      DisplayLabel = 'Sit.'
      FieldKind = fkCalculated
      FieldName = 'DescricaoSituacao'
      Size = 5
      Calculated = True
    end
    object tblFichaM1: TStringField
      Alignment = taCenter
      DisplayLabel = 'M1 B'
      FieldKind = fkCalculated
      FieldName = 'M1'
      Size = 5
      Calculated = True
    end
    object tblFichaM2: TStringField
      Alignment = taCenter
      DisplayLabel = 'M2 B'
      FieldKind = fkCalculated
      FieldName = 'M2'
      Size = 5
      Calculated = True
    end
    object tblFichaM3: TStringField
      Alignment = taCenter
      DisplayLabel = 'M3 B'
      FieldKind = fkCalculated
      FieldName = 'M3'
      Size = 5
      Calculated = True
    end
    object tblFichaM4: TStringField
      Alignment = taCenter
      DisplayLabel = 'M4 B'
      FieldKind = fkCalculated
      FieldName = 'M4'
      Size = 5
      Calculated = True
    end
    object tblFichaEmExame: TBooleanField
      FieldKind = fkCalculated
      FieldName = 'EmExame'
      Calculated = True
    end
    object tblFichaExF: TStringField
      Alignment = taCenter
      FieldKind = fkCalculated
      FieldName = 'ExF'
      Size = 5
      Calculated = True
    end
    object tblFichaField2EP: TStringField
      Alignment = taCenter
      FieldKind = fkCalculated
      FieldName = '2EP'
      Size = 5
      Calculated = True
    end
    object tblFichaF1: TStringField
      Alignment = taRightJustify
      DisplayWidth = 10
      FieldKind = fkCalculated
      FieldName = 'F1'
      Calculated = True
    end
    object tblFichaF2: TStringField
      Alignment = taRightJustify
      DisplayWidth = 10
      FieldKind = fkCalculated
      FieldName = 'F2'
      Calculated = True
    end
    object tblFichaF3: TStringField
      Alignment = taRightJustify
      DisplayWidth = 10
      FieldKind = fkCalculated
      FieldName = 'F3'
      Calculated = True
    end
    object tblFichaF4: TStringField
      Alignment = taRightJustify
      DisplayWidth = 10
      FieldKind = fkCalculated
      FieldName = 'F4'
      Calculated = True
    end
    object tblFichaCodigoGrade: TStringField
      FieldName = 'CodigoGrade'
    end
    object tblFichaDS_Disciplinas: TStringField
      FieldName = 'DS_Disciplinas'
      Origin = 'WMESTRE12.Disciplinas.Descricao'
      Size = 50
    end
    object tblFichaGrau: TSmallintField
      FieldName = 'Grau'
    end
    object tblFichaSerie: TSmallintField
      FieldName = 'Serie'
    end
    object tblFichaNota5: TFloatField
      FieldName = 'Nota5'
      OnGetText = tblFichaNota1GetText
    end
    object tblFichaExame5: TFloatField
      FieldName = 'Exame5'
      OnGetText = tblFichaExame1GetText
    end
    object tblFichaNota6: TFloatField
      FieldName = 'Nota6'
      OnGetText = tblFichaNota1GetText
    end
    object tblFichaExame6: TFloatField
      FieldName = 'Exame6'
      OnGetText = tblFichaExame1GetText
    end
    object tblFichaNota7: TFloatField
      FieldName = 'Nota7'
      OnGetText = tblFichaNota1GetText
    end
    object tblFichaExame7: TFloatField
      FieldName = 'Exame7'
      OnGetText = tblFichaExame1GetText
    end
    object tblFichaNota8: TFloatField
      FieldName = 'Nota8'
      OnGetText = tblFichaNota1GetText
    end
    object tblFichaExame8: TFloatField
      FieldName = 'Exame8'
      OnGetText = tblFichaExame1GetText
    end
    object tblFichaNota9: TFloatField
      FieldName = 'Nota9'
      OnGetText = tblFichaNota1GetText
    end
    object tblFichaExame9: TFloatField
      FieldName = 'Exame9'
      OnGetText = tblFichaExame1GetText
    end
    object tblFichaNota10: TFloatField
      FieldName = 'Nota10'
      OnGetText = tblFichaNota1GetText
    end
    object tblFichaExame10: TFloatField
      FieldName = 'Exame10'
      OnGetText = tblFichaExame1GetText
    end
    object tblFichaMediaFinal: TFloatField
      FieldName = 'MediaFinal'
    end
    object tblFichaUsuario: TIntegerField
      FieldName = 'Usuario'
    end
    object tblFichaCodigoEscola: TSmallintField
      FieldName = 'CodigoEscola'
    end
    object tblFichaMediaAnual: TFloatField
      FieldName = 'MediaAnual'
    end
    object tblFichaTurmaMatricula: TStringField
      FieldName = 'TurmaMatricula'
      Size = 50
    end
    object tblFichaM5: TStringField
      FieldKind = fkCalculated
      FieldName = 'M5'
      Size = 5
      Calculated = True
    end
    object tblFichaM6: TStringField
      FieldKind = fkCalculated
      FieldName = 'M6'
      Size = 5
      Calculated = True
    end
    object tblFichaM7: TStringField
      FieldKind = fkCalculated
      FieldName = 'M7'
      Size = 5
      Calculated = True
    end
    object tblFichaM8: TStringField
      FieldKind = fkCalculated
      FieldName = 'M8'
      Size = 5
      Calculated = True
    end
    object tblFichaM9: TStringField
      FieldKind = fkCalculated
      FieldName = 'M9'
      Size = 5
      Calculated = True
    end
    object tblFichaM10: TStringField
      FieldKind = fkCalculated
      FieldName = 'M10'
      Size = 5
      Calculated = True
    end
    object tblFichaF5: TStringField
      FieldKind = fkCalculated
      FieldName = 'F5'
      Size = 10
      Calculated = True
    end
    object tblFichaF6: TStringField
      FieldKind = fkCalculated
      FieldName = 'F6'
      Size = 10
      Calculated = True
    end
    object tblFichaF7: TStringField
      FieldKind = fkCalculated
      FieldName = 'F7'
      Size = 10
      Calculated = True
    end
    object tblFichaF8: TStringField
      FieldKind = fkCalculated
      FieldName = 'F8'
      Size = 10
      Calculated = True
    end
    object tblFichaF9: TStringField
      FieldKind = fkCalculated
      FieldName = 'F9'
      Size = 10
      Calculated = True
    end
    object tblFichaF10: TStringField
      FieldKind = fkCalculated
      FieldName = 'F10'
      Size = 10
      Calculated = True
    end
    object tblFichaArrumarDiario: TStringField
      FieldName = 'ArrumarDiario'
      Size = 50
    end
    object tblFichaAproveitamento: TStringField
      FieldName = 'Aproveitamento'
      Size = 1
    end
    object tblFichaSegunda_Epoca: TFloatField
      FieldName = 'Segunda_Epoca'
      OnGetText = tblFichaNota1GetText
    end
    object tblFichanota_d1: TFloatField
      FieldName = 'nota_d1'
    end
    object tblFichanota_d2: TFloatField
      FieldName = 'nota_d2'
    end
    object tblFichanota_d3: TFloatField
      FieldName = 'nota_d3'
    end
    object tblFichanota_d4: TFloatField
      FieldName = 'nota_d4'
    end
    object tblFichanota_d5: TFloatField
      FieldName = 'nota_d5'
    end
    object tblFichanota_d6: TFloatField
      FieldName = 'nota_d6'
    end
    object tblFichanota_d7: TFloatField
      FieldName = 'nota_d7'
    end
    object tblFichanota_d8: TFloatField
      FieldName = 'nota_d8'
    end
    object tblFichanota_d9: TFloatField
      FieldName = 'nota_d9'
    end
    object tblFichanota_d10: TFloatField
      FieldName = 'nota_d10'
    end
    object tblFichasimbolo_obs: TStringField
      FieldName = 'simbolo_obs'
      Size = 5
    end
    object tblFichacarga_horaria: TFloatField
      FieldName = 'carga_horaria'
    end
    object tblFichasn_bloqueado1: TSmallintField
      FieldName = 'sn_bloqueado1'
    end
    object tblFichasn_bloqueado2: TSmallintField
      FieldName = 'sn_bloqueado2'
    end
    object tblFichasn_bloqueado3: TSmallintField
      FieldName = 'sn_bloqueado3'
    end
    object tblFichasn_bloqueado4: TSmallintField
      FieldName = 'sn_bloqueado4'
    end
    object tblFichasn_bloqueado5: TSmallintField
      FieldName = 'sn_bloqueado5'
    end
    object tblFichasn_bloqueado6: TSmallintField
      FieldName = 'sn_bloqueado6'
    end
    object tblFichasn_bloqueado7: TSmallintField
      FieldName = 'sn_bloqueado7'
    end
    object tblFichasn_bloqueado8: TSmallintField
      FieldName = 'sn_bloqueado8'
    end
    object tblFichasn_bloqueado9: TSmallintField
      FieldName = 'sn_bloqueado9'
    end
    object tblFichasn_bloqueado10: TSmallintField
      FieldName = 'sn_bloqueado10'
    end
    object tblFichafrequencia: TFloatField
      FieldName = 'frequencia'
    end
    object tblFichanr_aluno: TSmallintField
      DisplayLabel = 'N'#186' Al.'
      FieldName = 'nr_aluno'
    end
    object tblFichads_media: TStringField
      FieldName = 'ds_media'
      Size = 10
    end
    object tblFichadisciplina: TIntegerField
      FieldName = 'disciplina'
      Required = True
    end
    object tblFichacd_grade: TLargeintField
      FieldName = 'cd_grade'
    end
    object tblFichatotalfaltas: TFloatField
      FieldName = 'totalfaltas'
    end
    object tblFichafalta1: TFloatField
      Tag = 1
      DisplayLabel = 'F1'
      FieldName = 'falta1'
      OnGetText = tblFichaFalta1GetText
    end
    object tblFichafalta2: TFloatField
      Tag = 1
      DisplayLabel = 'F2'
      FieldName = 'falta2'
      OnGetText = tblFichaFalta1GetText
    end
    object tblFichafalta3: TFloatField
      Tag = 1
      DisplayLabel = 'F3'
      FieldName = 'falta3'
      OnGetText = tblFichaFalta1GetText
    end
    object tblFichafalta4: TFloatField
      Tag = 1
      DisplayLabel = 'F4'
      FieldName = 'falta4'
      OnGetText = tblFichaFalta1GetText
    end
    object tblFichafalta5: TFloatField
      Tag = 1
      DisplayLabel = 'F5'
      FieldName = 'falta5'
      OnGetText = tblFichaFalta1GetText
    end
    object tblFichafalta6: TFloatField
      Tag = 1
      DisplayLabel = 'F6'
      FieldName = 'falta6'
      OnGetText = tblFichaFalta1GetText
    end
    object tblFichafalta7: TFloatField
      Tag = 1
      DisplayLabel = 'F7'
      FieldName = 'falta7'
      OnGetText = tblFichaFalta1GetText
    end
    object tblFichafalta8: TFloatField
      Tag = 1
      DisplayLabel = 'F8'
      FieldName = 'falta8'
      OnGetText = tblFichaFalta1GetText
    end
    object tblFichafalta9: TFloatField
      Tag = 1
      DisplayLabel = 'F9'
      FieldName = 'falta9'
      OnGetText = tblFichaFalta1GetText
    end
    object tblFichafalta10: TFloatField
      Tag = 1
      DisplayLabel = 'F10'
      FieldName = 'falta10'
      OnGetText = tblFichaFalta1GetText
    end
    object tblFichasn_bloq_freq1: TIntegerField
      FieldName = 'sn_bloq_freq1'
    end
    object tblFichasn_bloq_freq2: TIntegerField
      FieldName = 'sn_bloq_freq2'
    end
    object tblFichasn_bloq_freq3: TIntegerField
      FieldName = 'sn_bloq_freq3'
    end
    object tblFichasn_bloq_freq4: TIntegerField
      FieldName = 'sn_bloq_freq4'
    end
    object tblFichasn_bloq_freq5: TIntegerField
      FieldName = 'sn_bloq_freq5'
    end
    object tblFichasn_bloq_freq6: TIntegerField
      FieldName = 'sn_bloq_freq6'
    end
    object tblFichasn_bloq_freq7: TIntegerField
      FieldName = 'sn_bloq_freq7'
    end
    object tblFichasn_bloq_freq8: TIntegerField
      FieldName = 'sn_bloq_freq8'
    end
    object tblFichasn_bloq_freq9: TIntegerField
      FieldName = 'sn_bloq_freq9'
    end
    object tblFichasn_bloq_freq10: TIntegerField
      FieldName = 'sn_bloq_freq10'
    end
    object tblFichasn_bloqueio_ds_media: TIntegerField
      FieldName = 'sn_bloqueio_ds_media'
    end
    object tblFichads_professores: TMemoField
      FieldName = 'ds_professores'
      BlobType = ftMemo
    end
    object tblFichasn_faltas_justificadas: TSmallintField
      FieldName = 'sn_faltas_justificadas'
    end
    object tblFichasn_comportamento: TSmallintField
      FieldName = 'sn_comportamento'
    end
    object tblFichanr_faltas_justificadas: TLargeintField
      FieldName = 'nr_faltas_justificadas'
    end
    object tblFichanr_faltas_injustificadas: TIntegerField
      FieldKind = fkCalculated
      FieldName = 'nr_faltas_injustificadas'
      Calculated = True
    end
    object tblFichacd_disciplina: TIntegerField
      FieldName = 'cd_disciplina'
    end
    object tblFichads_comportamento: TStringField
      FieldName = 'ds_comportamento'
      Size = 255
    end
    object tblFichasn_dispensado_pi: TSmallintField
      FieldName = 'sn_dispensado_pi'
    end
    object tblFichasn_conceitos: TStringField
      FieldName = 'sn_conceitos'
      Size = 1
    end
  end
  object dtcFicha: TDataSource
    DataSet = tblFicha
    OnDataChange = dtcFichaDataChange
    Left = 328
    Top = 160
  end
  object pmQtd: TPopupMenu
    OnPopup = pmQtdPopup
    Left = 472
    Top = 168
  end
  object popTurmas: TPopupMenu
    Left = 616
    Top = 328
  end
  object ImageList1: TImageList
    Left = 504
    Top = 480
    Bitmap = {
      494C010109000E00040010001000FFFFFFFFFF10FFFFFFFFFFFFFFFF424D3600
      0000000000003600000028000000400000004000000001002000000000000040
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF000000000000000000000000000000
      0000808080000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF000000000080808000C0C0C000C0C0C0008080
      8000000000008080800000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF000000000080808000C0C0C000C0C0C000FFFF00008080
      8000808080000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF0000000000C0C0C000C0C0C000C0C0C000C0C0C0008080
      8000C0C0C0000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF0000000000C0C0C000FFFF0000C0C0C000C0C0C0008080
      8000C0C0C0000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF000000000080808000FFFF0000FFFF0000C0C0C0008080
      8000808080000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF000000000080808000C0C0C000C0C0C0008080
      8000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF0000000000C0C0C000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000FF000000FF000000FF000000FF000000FF00000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      FF000000FF000000FF000000FF000000FF000000FF000000FF000000FF000000
      FF00000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000007B7B7B0000000000000000000000
      00007B7B7B000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000848484008484840000000000000000000000
      0000000000000000000000000000000000000000000000000000000000003163
      9C0031639C000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000000000000000FF000000
      FF000000000000000000000000000000000000000000000000000000FF000000
      FF000000FF000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000ADB5AD000000000073737300000000000000000084848400737373000000
      0000000000000000000000000000000000000052630031639C0031639C003163
      9C0031639C000000000000526300005263000052630000526300005263000052
      630000000000000000000000000000000000000000000000FF000000FF000000
      FF000000FF000000000000000000000000000000000000000000000000000000
      FF000000FF000000FF0000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000848484007373
      7300CECECE00CECECE0000000000A59C9C009494940094949400848484000000
      00007373730000000000000000000000000000526300316B9C00316B9C003163
      9C0031639C000000000000CEFF0000CEFF0000CEFF0000000000000000000000
      000000000000000000000000000000000000000000000000FF00000000000000
      FF000000FF000000FF0000000000000000000000000000000000000000000000
      00000000FF000000FF0000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000008484840073737300D6D6
      D600CECECE000000000000000000A59C9C009494940094949400949494008484
      84000000000000000000000000000000000000526300296BA500296BA500296B
      9C00296B9C000000000000CEFF0000CEFF0000CEFF000000000000000000FF00
      0000000000000000000000000000000000000000FF000000FF00000000000000
      00000000FF000000FF000000FF00000000000000000000000000000000000000
      0000000000000000FF000000FF00000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000084848400F7F7F700CECE
      CE000000000000000000F7F7F70094949400A59C9C0094949400848484008484
      840084848400737373000000000000000000005263002173AD002173A5002173
      A5002973A5000000000010CEFF0000CEFF0000CEFF0000000000FF000000FF00
      0000000000000000000000000000000000000000FF000000FF00000000000000
      0000000000000000FF000000FF000000FF000000000000000000000000000000
      0000000000000000FF000000FF00000000000000000000000000000000000000
      00000000000000000000000000000000000000000000000000007B7B7B000000
      0000000000000000000000000000000000000000000084848400F7F7F7000000
      0000F7F7F700F7F7F700CECECE00CECECE00CECECE0094949400949494008484
      84007373730073737300000000000000000000526300187BAD00187BAD00FFFF
      FF002173AD000000000031D6FF0029D6FF0018D6FF00FF000000FF000000FF00
      0000000000000000000000000000000000000000FF000000FF00000000000000
      000000000000000000000000FF000000FF000000FF0000000000000000000000
      0000000000000000FF000000FF00000000000000000000000000FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF000000000000000000FFFFFF00000000000000
      0000000000000000000000000000000000000000000084848400F7F7F700F7F7
      F700D6D6D600D6D6D6000000FF002900CE00CECECE00CECECE00000000008484
      840084848400737373000000000000000000005263001084B5001884B5001884
      B500187BB5000000000063DEFF0052DEFF00FF000000FF000000FF000000FF00
      0000FF000000FF000000FF000000000000000000FF000000FF00000000000000
      00000000000000000000000000000000FF000000FF000000FF00000000000000
      0000000000000000FF000000FF00000000000000000000000000FFFFFF000000
      00000000000000000000FFFFFF000000000000000000FFFFFF00000000000000
      0000000000000000000000000000000000000000000084848400F7F7F700DEDE
      DE0000FF000000946300CECECE00CECECE00D6D6D60073737300848484000000
      00007373730073737300000000000000000000526300088CBD00108CBD001084
      BD001084B500000000008CE7FF00FF000000FF000000FF000000FF000000FF00
      0000FF000000FF000000FF000000000000000000FF000000FF00000000000000
      0000000000000000000000000000000000000000FF000000FF000000FF000000
      0000000000000000FF000000FF00000000000000000000000000FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF000000000000000000FFFFFF00000000000000
      0000000000000000000000000000000000000000000000000000848484008484
      8400DEDEDE00D6D6D600D6D6D600848484007373730000000000000000000000
      000073737300737373000000000000000000005263000894C600088CC600088C
      C600088CBD0000000000B5EFFF00A5EFFF00FF000000FF000000FF000000FF00
      0000FF000000FF000000FF00000000000000000000000000FF000000FF000000
      000000000000000000000000000000000000000000000000FF000000FF000000
      FF00000000000000FF0000000000000000000000000000000000FFFFFF000000
      0000000000000000000000000000FFFFFF00FFFFFF00FFFFFF00000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000084848400F7F7F700737373000000000000000000DEDEDE00DEE7DE00DEDE
      DE0000000000000000000000000000000000005263000094CE000094CE000094
      C6000094C60000000000DEF7FF00CEF7FF00C6EFFF00FF000000FF000000FF00
      000000000000000000000000000000000000000000000000FF000000FF000000
      FF000000000000000000000000000000000000000000000000000000FF000000
      FF000000FF000000FF0000000000000000000000000000000000FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000084848400DEE7DE00E7EFE700EFEFEF00F7F7
      F700DEDEDE0000000000000000000000000000526300009CCE00009CCE00009C
      CE000094CE0000000000FFFFFF00F7F7FF00E7F7FF0000000000FF000000FF00
      00000000000000000000000000000000000000000000000000000000FF000000
      FF000000FF000000000000000000000000000000000000000000000000000000
      FF000000FF00000000000000000000000000000000007B0000007B0000007B00
      00007B0000007B0000007B0000007B0000007B0000007B0000007B0000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000084848400EFEFEF00EFEFEF00F7F7
      F7008484840000000000000000000000000000526300009CCE00009CCE00009C
      CE00009CCE0000000000FFFFFF00FFFFFF00FFFFFF000000000000000000FF00
      0000000000000000000000000000000000000000000000000000000000000000
      FF000000FF000000FF000000FF000000FF000000FF000000FF000000FF000000
      FF0000000000000000000000000000000000000000007B0000007B0000007B00
      00007B0000007B0000007B0000007B0000007B0000007B0000007B0000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000084848400848484008484
      840000000000000000000000000000000000000000000052630000526300009C
      CE00009CCE000000000000526300005263000052630000526300000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000FF000000FF000000FF000000FF000000FF00000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000052
      6300005263000052630000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000FFFFFF00FFFFFF0000000000FFFF
      FF000000000000000000FFFFFF00000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000FFFFFF00000000000000000000000000008484000084
      8400000000000000000000000000000000000000000000000000000000000000
      0000000000000084840000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000FFFF0000000000000000000000FF
      FF00FFFFFF0000FFFF00FFFFFF0000FFFF0000000000FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00000000000000000000000000000000000000
      000000000000FFFFFF0000000000000000000000000000000000000000000000
      000000000000FFFFFF0000000000000000000000000000000000008484000084
      8400000000000000000000000000000000000000000000000000000000000000
      0000000000000084840000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000FFFF00000000000000FFFF00FFFF
      FF0000FFFF00FFFFFF00000000000000000000000000FFFFFF00FFFFFF00FFFF
      FF00FFFFFF0000000000FFFFFF00000000000000000000000000000000000000
      000000000000FFFFFF0000000000000000000000000000000000000000000000
      000000000000FFFFFF0000000000000000000000000000000000008484000084
      8400000000000000000000000000000000000000000000000000000000000000
      0000000000000084840000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000FFFF000000000000FFFFFF0000FF
      FF00FFFFFF0000FFFF00FFFFFF0000FFFF00FFFFFF0000000000FFFFFF000000
      000000000000FFFFFF00FFFFFF00000000000000000000000000000000000000
      00000000000000000000FFFFFF00000000000000000000000000000000000000
      0000FFFFFF000000000000000000000000000000000000000000008484000084
      8400000000000000000000000000000000000000000000000000000000000000
      0000000000000084840000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000FFFF00000000000000FFFF00FFFF
      FF0000FFFF00FFFFFF00000000000000000000000000000000000000000000FF
      FF0000000000FFFFFF00FFFFFF00000000000000000000000000000000000000
      0000000000000000000000000000FFFFFF00000000000000000000000000FFFF
      FF00000000000000000000000000000000000000000000000000008484000084
      8400008484000084840000848400008484000084840000848400008484000084
      8400008484000084840000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000FFFF000000000000FFFFFF0000FF
      FF00FFFFFF0000FFFF00FFFFFF0000FFFF00FFFFFF0000FFFF00FFFFFF000000
      0000FFFFFF00FFFFFF00FFFFFF00000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000FFFFFF000000
      0000000000000000000000000000000000000000000000000000008484000084
      8400000000000000000000000000000000000000000000000000000000000000
      0000008484000084840000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000FFFF00000000000000FFFF00FFFF
      FF0000000000000000000000000000000000000000000000000000000000FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00000000000000000000000000000000000000
      00000000000000000000000000000000000000000000FFFFFF00000000000000
      0000000000000000000000000000000000000000000000000000008484000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000084840000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000000000000000000000FF
      FF00FFFFFF0000FFFF00000000000000000000FFFF0000000000FFFFFF00FFFF
      FF000000000000000000FFFFFF00000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000FFFFFF000000
      0000000000000000000000000000000000000000000000000000008484000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000084840000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000FFFF0000000000FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00000000000000000000000000000000000000
      0000000000000000000000000000FFFFFF000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000008484000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000084840000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000FFFF0000000000FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00000000000000000000000000000000000000000000000000000000000000
      00000000000000000000FFFFFF00000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000008484000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000084840000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000FFFF0000000000FFFFFF00FFFFFF000000000000000000FFFF
      FF0000000000FFFFFF00FFFFFF00000000000000000000000000000000000000
      000000000000FFFFFF0000000000000000000000000000000000000000000000
      000000000000FFFFFF0000000000000000000000000000000000008484000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000FFFF000000000000000000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF0000000000FFFFFF000000000000000000000000000000000000000000FFFF
      FF00000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000008484000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      FF00000000000000000000000000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000424D3E000000000000003E000000
      2800000040000000400000000100010000000000000200000000000000000000
      000000000000000000000000FFFFFF0000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000FFFF000000000000000C000000000000
      0008000000000000000100000000000000030000000000000003000000000000
      0003000000000000000300000000000000030000000000000007000000000000
      000F000000000000000F000000000000000F000000000000001F000000000000
      003F000000000000007F000000000000FFFFF8F8FFFFFFFFF83FFAFAFC7FE3FF
      E00FF870F21F83FFCFC7F800E40F000F87E3FA10C203003FA3F3FA108603002F
      31F9F8008C01000F38F980019001000F3C798013802100013E39801380010001
      3F198013C06300019F8B801FF18F000F8FC3801FFE01000FC7E7801FFF07002F
      E00F801FFF8F803FF83FFFFFFFFFE3FFFFFFFC00FFFFFFFFFFFFFC00FFF9C001
      FFFF2000FFF98031FFFF0000E3F38031FC7F0000E3F38031FD7F0000E1C78001
      FD7F0000F08F8001E10F0000F81F8001EFEF0000FC3F8FF1E10F0000F81F8FF1
      FD7FE000F09F8FF1FD7FF800E1C78FF1FC7FF00083E38FF1FFFFE0018FF18FF5
      FFFFC403FFFF8001FFFFEC07FFFFFFFF00000000000000000000000000000000
      000000000000}
  end
  object qryAtualizarFaltasJustificadas: TUMZQuery
    Connection = DM.db
    Filtered = True
    SQL.Strings = (
      'REPLACE INTO ficha_faltas_justificadas'
      
        '  (nr_anosemestre, cd_turma, cd_pessoa, cd_disciplina, nr_serie,' +
        ' nr_etapa, nr_faltas)'
      'VALUES'
      
        '  (:nr_anosemestre, :cd_turma, :cd_pessoa, :cd_disciplina, :nr_s' +
        'erie, :nr_etapa, :nr_faltas)')
    Params = <
      item
        DataType = ftUnknown
        Name = 'nr_anosemestre'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'cd_turma'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'cd_pessoa'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'cd_disciplina'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'nr_serie'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'nr_etapa'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'nr_faltas'
        ParamType = ptUnknown
      end>
    Left = 248
    Top = 296
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'nr_anosemestre'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'cd_turma'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'cd_pessoa'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'cd_disciplina'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'nr_serie'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'nr_etapa'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'nr_faltas'
        ParamType = ptUnknown
      end>
  end
  object qryComportamento: TUMZQuery
    Connection = DM.db
    SQL.Strings = (
      'SELECT'
      '  cd_comportamento,'
      '  ds_comportamento'
      'FROM'
      '  avaliacoes_comportamento'
      'WHERE'
      '  cd_avaliacao = :cd_avaliacao '
      'ORDER BY'
      '  nr_ordem ASC')
    Params = <
      item
        DataType = ftUnknown
        Name = 'cd_avaliacao'
        ParamType = ptUnknown
      end>
    Left = 248
    Top = 392
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'cd_avaliacao'
        ParamType = ptUnknown
      end>
    object qryComportamentocd_comportamento: TIntegerField
      FieldName = 'cd_comportamento'
    end
    object qryComportamentods_comportamento: TStringField
      FieldName = 'ds_comportamento'
      Size = 255
    end
  end
  object dsComportamento: TDataSource
    DataSet = qryComportamento
    Left = 280
    Top = 392
  end
  object qryGravarComportamento: TUMZQuery
    Connection = DM.db
    SQL.Strings = (
      'REPLACE INTO matriculas_comportamento'
      
        '  (nr_anosemestre, cd_turma, cd_pessoa, nr_etapa, cd_comportamen' +
        'to)'
      'VALUES'
      
        '  (:nr_anosemestre, :cd_turma, :cd_pessoa, :nr_etapa, :cd_compor' +
        'tamento)'
      '')
    Params = <
      item
        DataType = ftUnknown
        Name = 'nr_anosemestre'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'cd_turma'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'cd_pessoa'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'nr_etapa'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'cd_comportamento'
        ParamType = ptUnknown
      end>
    Left = 248
    Top = 424
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'nr_anosemestre'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'cd_turma'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'cd_pessoa'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'nr_etapa'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'cd_comportamento'
        ParamType = ptUnknown
      end>
  end
  object qryComportamentoAluno: TUMZQuery
    Connection = DM.db
    SQL.Strings = (
      'SELECT'
      '  cd_comportamento'
      'FROM'
      '  matriculas_comportamento'
      'WHERE'
      '  nr_anosemestre = :nr_anosemestre AND'
      '  cd_turma LIKE :cd_turma AND'
      '  cd_pessoa = :cd_pessoa AND'
      '  nr_etapa = :nr_etapa')
    Params = <
      item
        DataType = ftUnknown
        Name = 'nr_anosemestre'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'cd_turma'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'cd_pessoa'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'nr_etapa'
        ParamType = ptUnknown
      end>
    Left = 280
    Top = 424
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'nr_anosemestre'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'cd_turma'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'cd_pessoa'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'nr_etapa'
        ParamType = ptUnknown
      end>
  end
  object qryOpcoesParametroAvaliacao: TUMZQuery
    Connection = DM.db
    SQL.Strings = (
      'SELECT'
      
        '  SUM(CASE WHEN (COALESCE(apm.sn_recuperacao, "N") = "S") THEN 1' +
        ' ELSE 0 END) recuperacao,'
      
        #9'SUM(CASE WHEN (COALESCE(apm.sn_diario_online, 0) = 1) THEN 1 EL' +
        'SE 0 END) diario_online,'
      
        #9'SUM(CASE WHEN (COALESCE(apm.sn_exame, "N") = "S") THEN 1 ELSE 0' +
        ' END) exame_final,'
      
        #9'SUM(CASE WHEN (COALESCE(apm.sn_segunda_epoca, "N") = "S") THEN ' +
        '1 ELSE 0 END) segunda_epoca,'
      
        #9'SUM(CASE WHEN (COALESCE(apm.sn_conceitos, "N") = "S") THEN 1 EL' +
        'SE 0 END) conceito_media,'
      
        #9'SUM(CASE WHEN (COALESCE(apm.sn_comportamento, 0) = 1) THEN 1 EL' +
        'SE 0 END) comportamento'
      'FROM'
      #9'turmas t'
      
        #9'INNER JOIN grades_disciplinas gd ON (gd.cd_curso = t.curso AND ' +
        'gd.cd_grade = t.cd_grade AND gd.nr_serie = t.serie)'
      
        #9'INNER JOIN avaliacoes_parametros_matriz apm ON (apm.cd_avaliaca' +
        'o = COALESCE(gd.cd_avaliacao, t.cd_avaliacao))'
      'WHERE'
      #9't.anosemestre = :nr_anosemestre AND'
      #9't.codigo = :cd_turma')
    Params = <
      item
        DataType = ftUnknown
        Name = 'nr_anosemestre'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'cd_turma'
        ParamType = ptUnknown
      end>
    Left = 248
    Top = 112
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'nr_anosemestre'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'cd_turma'
        ParamType = ptUnknown
      end>
    object qryOpcoesParametroAvaliacaorecuperacao: TLargeintField
      FieldName = 'recuperacao'
    end
    object qryOpcoesParametroAvaliacaodiario_online: TLargeintField
      FieldName = 'diario_online'
    end
    object qryOpcoesParametroAvaliacaoexame_final: TLargeintField
      FieldName = 'exame_final'
    end
    object qryOpcoesParametroAvaliacaosegunda_epoca: TLargeintField
      FieldName = 'segunda_epoca'
    end
    object qryOpcoesParametroAvaliacaoconceito_media: TLargeintField
      FieldName = 'conceito_media'
    end
    object qryOpcoesParametroAvaliacaocomportamento: TLargeintField
      FieldName = 'comportamento'
    end
  end
  object qryAtualizarDispensadoPI: TUMZQuery
    Connection = DM.db
    SQL.Strings = (
      'UPDATE'
      '  fichaindividual'
      'SET'
      '  sn_dispensado_pi = :sn_dispensado_pi'
      'WHERE'
      '  anosemestre = :anosemestre AND'
      '  turma = :turma AND'
      '  disciplina = :disciplina AND'
      '  serie = :serie AND'
      '  codigoaluno = :codigoaluno')
    Params = <
      item
        DataType = ftUnknown
        Name = 'sn_dispensado_pi'
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
      end
      item
        DataType = ftUnknown
        Name = 'serie'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'codigoaluno'
        ParamType = ptUnknown
      end>
    Left = 120
    Top = 416
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'sn_dispensado_pi'
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
      end
      item
        DataType = ftUnknown
        Name = 'serie'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'codigoaluno'
        ParamType = ptUnknown
      end>
  end
end
