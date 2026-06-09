object frmDigFichaIndividual: TfrmDigFichaIndividual
  Left = 218
  Top = 137
  Caption = 'Digita'#231#227'o de M'#233'dias e Faltas...'
  ClientHeight = 493
  ClientWidth = 747
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
  OnCreate = FormCreate
  OnDestroy = FormDestroy
  OnKeyDown = FormKeyDown
  OnPaint = FormPaint
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 14
  object Bevel4: TBevel
    Left = 0
    Top = 25
    Width = 747
    Height = 6
    Align = alTop
    Shape = bsSpacer
    ExplicitTop = 31
    ExplicitWidth = 717
  end
  object Panel3: TPanel
    Left = 0
    Top = 0
    Width = 747
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
    Left = 0
    Top = 31
    Width = 747
    Height = 327
    Align = alClient
    BevelOuter = bvNone
    TabOrder = 1
    object Panel2: TPanel
      Left = 531
      Top = 0
      Width = 216
      Height = 327
      Align = alRight
      BevelOuter = bvNone
      TabOrder = 0
      object Label5: TLabel
        Left = 34
        Top = 39
        Width = 30
        Height = 14
        Caption = 'Etapa:'
      end
      object Label7: TLabel
        Left = 16
        Top = 124
        Width = 48
        Height = 14
        Caption = 'Disciplina:'
      end
      object btnDisciplina: TSpeedButton
        Left = 170
        Top = 121
        Width = 30
        Height = 22
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
        Left = 14
        Top = 11
        Width = 50
        Height = 14
        Caption = 'Ano/Sem.:'
      end
      object Label4: TLabel
        Left = 31
        Top = 68
        Width = 33
        Height = 14
        Caption = 'Turma:'
      end
      object btnTurmas: TSpeedButton
        Left = 170
        Top = 65
        Width = 30
        Height = 22
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
        Left = 9
        Top = 96
        Width = 55
        Height = 14
        Caption = 'C'#243'd. Aluno:'
      end
      object SpeedButton2: TSpeedButton
        Left = 170
        Top = 93
        Width = 30
        Height = 22
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
        Left = 70
        Top = 36
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
        TabOrder = 0
        Text = '01'
        OnExit = txtBimestreExit
      end
      object UpDown1: TUpDown
        Left = 119
        Top = 35
        Width = 15
        Height = 24
        Min = 1
        Max = 10
        Position = 1
        TabOrder = 1
        OnClick = UpDown1Click
      end
      object txtDisciplina: TEdit
        Left = 70
        Top = 121
        Width = 98
        Height = 22
        TabStop = False
        CharCase = ecUpperCase
        ReadOnly = True
        TabOrder = 2
        OnKeyPress = txtCodigoAlunoKeyPress
      end
      object txtAnoSemestre: TMaskEdit
        Left = 70
        Top = 9
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
        TabOrder = 3
        OnExit = txtAnoSemestreExit
        OnKeyPress = txtAnoSemestreKeyPress
      end
      object UpDown2: TUpDown
        Left = 127
        Top = 8
        Width = 16
        Height = 24
        Min = -100
        TabOrder = 4
        OnClick = UpDown2Click
      end
      object radOpcoes: TRadioGroup
        Left = 29
        Top = 153
        Width = 140
        Height = 125
        Caption = 'Op'#231#245'es:'
        ItemIndex = 0
        Items.Strings = (
          'M'#233'dia'
          'Exame'
          'Exame Final'
          '2a. '#201'poca'
          'Conceitos')
        TabOrder = 5
        OnClick = radOpcoesClick
      end
      object txtTurma: TEdit
        Left = 70
        Top = 65
        Width = 99
        Height = 22
        TabStop = False
        CharCase = ecUpperCase
        TabOrder = 6
        OnKeyPress = txtTurmaKeyPress
      end
      object txtCodigoAluno: TEdit
        Left = 70
        Top = 93
        Width = 99
        Height = 22
        TabOrder = 7
        OnExit = txtCodigoAlunoExit
        OnKeyPress = txtCodigoAlunoKeyPress
      end
    end
    object grd: TDBGrid
      AlignWithMargins = True
      Left = 3
      Top = 3
      Width = 525
      Height = 321
      Align = alClient
      BorderStyle = bsNone
      DataSource = dtcFicha
      Options = [dgTitles, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgAlwaysShowSelection, dgConfirmDelete, dgCancelOnExit]
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
          FieldName = 'Nome'
          Width = 138
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'Turma'
          Width = 60
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'Sigla'
          Width = 40
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'CodigoAluno'
          Width = 50
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
          FieldName = 'DescricaoSituacao'
          Visible = True
        end>
    end
  end
  object Panel4: TPanel
    Left = 0
    Top = 432
    Width = 747
    Height = 61
    Align = alBottom
    BevelOuter = bvNone
    TabOrder = 2
    DesignSize = (
      747
      61)
    object Bevel1: TBevel
      AlignWithMargins = True
      Left = 5
      Top = 0
      Width = 737
      Height = 2
      Margins.Left = 5
      Margins.Top = 0
      Margins.Right = 5
      Margins.Bottom = 0
      Align = alTop
      ExplicitLeft = 4
      ExplicitTop = 79
      ExplicitWidth = 701
    end
    object Label8: TLabel
      Left = 8
      Top = 8
      Width = 77
      Height = 16
      Caption = 'Professores:'
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Arial'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object lblProfessores: TLabel
      Left = 91
      Top = 8
      Width = 179
      Height = 16
      Caption = 'Professores - Set at Runtime'
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Arial'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label3: TLabel
      Left = 19
      Top = 30
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
      Top = 30
      Width = 438
      Height = 14
      DataField = 'DS_Disciplinas'
      DataSource = dtcFicha
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Arial'
      Font.Style = [fsBold]
      ParentFont = False
      Transparent = True
    end
    object btnFechar: TSpeedButton
      Left = 643
      Top = 20
      Width = 87
      Height = 25
      Hint = 'Sair'
      Anchors = [akRight, akBottom]
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
      Transparent = False
      OnClick = btnFecharClick
      ExplicitLeft = 1246
      ExplicitTop = 105
    end
  end
  object Panel5: TPanel
    Left = 0
    Top = 358
    Width = 747
    Height = 74
    Align = alBottom
    BevelOuter = bvNone
    TabOrder = 3
    object Bevel2: TBevel
      AlignWithMargins = True
      Left = 5
      Top = 0
      Width = 737
      Height = 2
      Margins.Left = 5
      Margins.Top = 0
      Margins.Right = 5
      Margins.Bottom = 0
      Align = alTop
      ExplicitLeft = 3
      ExplicitTop = 13
      ExplicitWidth = 702
    end
    object Label1: TLabel
      Left = 10
      Top = 17
      Width = 53
      Height = 16
      Caption = 'C'#243'digo: '
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Arial'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label2: TLabel
      Left = 18
      Top = 45
      Width = 41
      Height = 16
      Caption = 'Aluno:'
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Arial'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object DBText1: TDBText
      Left = 72
      Top = 45
      Width = 403
      Height = 14
      DataField = 'Nome'
      DataSource = dtcFicha
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Arial'
      Font.Style = [fsBold]
      ParentFont = False
      Transparent = True
    end
    object lblM1: TLabel
      Left = 255
      Top = 17
      Width = 18
      Height = 16
      Alignment = taRightJustify
      Caption = 'M1'
      FocusControl = dbeN1
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Arial'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object lblF1: TLabel
      Left = 409
      Top = 17
      Width = 19
      Height = 16
      Alignment = taRightJustify
      Caption = 'F1:'
      FocusControl = dbeF1
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Arial'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object lblM1Info: TLabel
      Left = 526
      Top = 17
      Width = 185
      Height = 16
      Caption = '(Nota Digitada Manualmente)'
      FocusControl = dbeN1
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Arial'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object dbeCodigo: TDBEdit
      Left = 72
      Top = 14
      Width = 113
      Height = 24
      DataField = 'CodigoAluno'
      DataSource = DM.dtcFichaIndividual
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Arial'
      Font.Style = [fsBold]
      ParentFont = False
      ReadOnly = True
      TabOrder = 0
      OnKeyDown = dbeCodigoKeyDown
      OnKeyPress = dbeCodigoKeyPress
    end
    object dbeN1: TDBEdit
      Left = 283
      Top = 14
      Width = 81
      Height = 24
      DataField = 'Nota1'
      DataSource = DM.dtcFichaIndividual
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Arial'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 1
      Visible = False
      OnEnter = dbeN1Enter
      OnKeyDown = dbeN1KeyDown
      OnKeyPress = dbeN1KeyPress
    end
    object dbeF1: TDBEdit
      Left = 434
      Top = 14
      Width = 73
      Height = 24
      DataField = 'Falta1'
      DataSource = DM.dtcFichaIndividual
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Arial'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 2
      OnKeyDown = dbeF1KeyDown
      OnKeyPress = dbeF1KeyPress
    end
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
    Left = 32
    Top = 224
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
      Size = 5
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
  end
  object dtcFicha: TDataSource
    DataSet = tblFicha
    OnDataChange = dtcFichaDataChange
    Left = 32
    Top = 272
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
end
