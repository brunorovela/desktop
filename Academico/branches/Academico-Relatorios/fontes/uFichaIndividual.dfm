object frmFichaIndividual: TfrmFichaIndividual
  Left = 196
  Top = 105
  Caption = 'Ficha Individual'
  ClientHeight = 447
  ClientWidth = 813
  Color = clBtnFace
  Font.Charset = ANSI_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Arial'
  Font.Style = []
  FormStyle = fsMDIChild
  KeyPreview = True
  OldCreateOrder = True
  Position = poDefault
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
  object Bevel1: TBevel
    Left = 0
    Top = 419
    Width = 813
    Height = 3
    Align = alBottom
    Shape = bsSpacer
    ExplicitTop = 420
    ExplicitWidth = 800
  end
  object Bevel2: TBevel
    Left = 0
    Top = 371
    Width = 813
    Height = 3
    Align = alBottom
    Shape = bsSpacer
    ExplicitTop = 376
    ExplicitWidth = 800
  end
  object Bevel3: TBevel
    Left = 0
    Top = 30
    Width = 813
    Height = 5
    Align = alTop
    Shape = bsSpacer
    ExplicitTop = 0
    ExplicitWidth = 800
  end
  object Bevel4: TBevel
    Left = 0
    Top = 59
    Width = 4
    Height = 312
    Align = alLeft
    Shape = bsSpacer
    ExplicitTop = 74
    ExplicitHeight = 299
  end
  object Bevel5: TBevel
    Left = 809
    Top = 59
    Width = 4
    Height = 312
    Align = alRight
    Shape = bsSpacer
    ExplicitLeft = 796
    ExplicitTop = 74
    ExplicitHeight = 299
  end
  object Bevel6: TBevel
    Left = 0
    Top = 0
    Width = 813
    Height = 5
    Align = alTop
    Shape = bsSpacer
    ExplicitWidth = 800
  end
  object Panel3: TPanel
    Left = 0
    Top = 5
    Width = 813
    Height = 25
    Align = alTop
    BevelOuter = bvLowered
    Caption = 'FICHA INDIVIDUAL'
    Color = clBlue
    Font.Charset = ANSI_CHARSET
    Font.Color = clWhite
    Font.Height = -16
    Font.Name = 'Arial'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 0
  end
  object Panel8: TPanel
    Left = 0
    Top = 385
    Width = 813
    Height = 34
    Align = alBottom
    TabOrder = 1
    object btnAluno: TSpeedButton
      Left = 549
      Top = 5
      Width = 118
      Height = 24
      Hint = 'Buscar por Aluno'
      Caption = 'F8 Por Aluno...'
      Glyph.Data = {
        F6000000424DF600000000000000760000002800000010000000100000000100
        04000000000080000000CE0E0000D80E00001000000000000000000000000000
        80000080000000808000800000008000800080800000C0C0C000808080000000
        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00222222222222
        222200000000000022000FFFFFFFFFF020000FFFFFFF000080020FFFFFF08778
        08220FFFFF0877E880220FFFFF07777870220FFFFF07E77870220FFFFF08EE78
        80220FFFFFF0877802220FFFFFFF000022220FFFFFFFFFF022220FFFFFFF0000
        22220FFFFFFF070222220FFFFFFF002222220000000002222222}
      OnClick = btnAlunoClick
    end
    object btnTurmas: TSpeedButton
      Left = 667
      Top = 5
      Width = 118
      Height = 24
      Hint = 'Buscar por Turma'
      Caption = 'F9 Por Turma...'
      Glyph.Data = {
        F6000000424DF600000000000000760000002800000010000000100000000100
        04000000000080000000CE0E0000D80E00001000000000000000000000000000
        80000080000000808000800000008000800080800000C0C0C000808080000000
        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00222222222222
        222200000000000022000FFFFFFFFFF020000FFFFFFF000080020FFFFFF08778
        08220FFFFF0877E880220FFFFF07777870220FFFFF07E77870220FFFFF08EE78
        80220FFFFFF0877802220FFFFFFF000022220FFFFFFFFFF022220FFFFFFF0000
        22220FFFFFFF070222220FFFFFFF002222220000000002222222}
      OnClick = btnTurmasClick
    end
    object Label7: TLabel
      Left = 6
      Top = 6
      Width = 78
      Height = 14
      Caption = 'Filtrar Disciplina:'
    end
    object SpeedButton6: TSpeedButton
      Left = 430
      Top = 5
      Width = 118
      Height = 24
      Hint = 'Recalcular as m'#233'dias e freq'#252#234'ncias'
      Caption = 'Recalcular M'#233'dias'
      OnClick = SpeedButton6Click
    end
    object btnCodigoDisciplina: TSpeedButton
      Left = 172
      Top = 3
      Width = 33
      Height = 22
      Hint = 'Selecionar uma disciplina Espec'#237'fica'
      AllowAllUp = True
      GroupIndex = 1
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
      OnClick = btnCodigoDisciplinaClick
    end
    object txtDisciplina: TEdit
      Left = 90
      Top = 3
      Width = 81
      Height = 22
      CharCase = ecUpperCase
      Color = clBtnFace
      Enabled = False
      TabOrder = 0
      OnKeyPress = txtDisciplinaKeyPress
    end
    object ckbSomenteAtivos: TCheckBox
      Left = 211
      Top = 6
      Width = 110
      Height = 17
      Hint = 'Apresentar somente alunos ativos'
      Caption = 'Somente Ativos'
      TabOrder = 1
      OnClick = ckbSomenteAtivosClick
    end
    object ckbBloq: TCheckBox
      Left = 327
      Top = 6
      Width = 97
      Height = 17
      Caption = 'Ver Bloqueios'
      TabOrder = 2
      OnClick = ckbBloqClick
    end
  end
  object Panel1: TPanel
    Left = 0
    Top = 35
    Width = 813
    Height = 24
    Align = alTop
    BevelOuter = bvLowered
    Color = clBlue
    TabOrder = 2
    object lbl: TLabel
      Left = 8
      Top = 3
      Width = 56
      Height = 18
      Caption = 'ALUNO:'
      Font.Charset = ANSI_CHARSET
      Font.Color = clWhite
      Font.Height = -15
      Font.Name = 'Arial'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object lbl2: TLabel
      Left = 756
      Top = 3
      Width = 5
      Height = 19
      Alignment = taRightJustify
      Caption = '-'
      Font.Charset = ANSI_CHARSET
      Font.Color = clWhite
      Font.Height = -16
      Font.Name = 'Arial'
      Font.Style = [fsBold]
      ParentFont = False
    end
  end
  object toolPessoa: TToolBar
    Left = 0
    Top = 422
    Width = 813
    Height = 25
    Align = alBottom
    ButtonWidth = 155
    Caption = 'toolPessoa'
    EdgeBorders = [ebTop, ebBottom]
    Images = ImageList1
    List = True
    ShowCaptions = True
    TabOrder = 3
    object SpeedButton5: TToolButton
      Left = 0
      Top = 0
      Hint = 'Digita'#231#227'o da Prova Interdisciplinar'
      AutoSize = True
      Caption = 'Digita'#231#227'o PI'
      ImageIndex = 1
      OnClick = SpeedButton5Click
    end
    object SpeedButton3: TToolButton
      Left = 86
      Top = 0
      Hint = 'Digita'#231#227'o de M'#233'dias e Faltas'
      AutoSize = True
      Caption = 'Digita'#231#227'o de M'#233'dias/Faltas'
      ImageIndex = 1
      OnClick = SpeedButton3Click
    end
    object btnAcerto: TToolButton
      Left = 245
      Top = 0
      Hint = 'Acerto de M'#233'dias e faltas da disciplina selecionada'
      AutoSize = True
      Caption = 'Acerto de M'#233'dias/Faltas'
      ImageIndex = 1
      OnClick = btnAcertoClick
    end
    object ToolButton4: TToolButton
      Left = 393
      Top = 0
      Width = 5
      Caption = 'ToolButton4'
      ImageIndex = 3
      Style = tbsSeparator
    end
    object btnObservacoes: TToolButton
      Left = 398
      Top = 0
      Hint = 'Registrar oberva'#231#245'es de secretaria'
      AutoSize = True
      Caption = 'Observa'#231#245'es'
      ImageIndex = 1
      OnClick = btnObservacoesClick
    end
    object SpeedButton1: TToolButton
      Left = 495
      Top = 0
      AutoSize = True
      Caption = 'F7 Imprimir'
      ImageIndex = 6
      Visible = False
    end
    object ToolButton8: TToolButton
      Left = 577
      Top = 0
      Width = 5
      Caption = 'ToolButton8'
      ImageIndex = 6
      Style = tbsSeparator
    end
    object btnFechar: TToolButton
      Left = 582
      Top = 0
      Hint = 'Fechar a ficha individual'
      AutoSize = True
      Caption = 'F12 Fechar'
      ImageIndex = 7
      OnClick = btnFecharClick
    end
    object ToolButton3: TToolButton
      Left = 668
      Top = 0
      Width = 5
      Caption = 'ToolButton2'
      ImageIndex = 8
      Style = tbsSeparator
    end
  end
  object tcFicha: TTabControl
    Left = 4
    Top = 59
    Width = 805
    Height = 312
    Align = alClient
    TabOrder = 4
    Tabs.Strings = (
      'Turma Selecionada')
    TabIndex = 0
    object grd: TDBGrid
      Left = 4
      Top = 25
      Width = 797
      Height = 283
      Align = alClient
      Color = clWhite
      DataSource = dtcFicha
      Options = [dgTitles, dgColumnResize, dgColLines, dgTabs, dgRowSelect, dgAlwaysShowSelection, dgCancelOnExit]
      PopupMenu = pmLog
      TabOrder = 0
      TitleFont.Charset = ANSI_CHARSET
      TitleFont.Color = clWindowText
      TitleFont.Height = -11
      TitleFont.Name = 'Arial'
      TitleFont.Style = []
      OnDrawColumnCell = grdDrawColumnCell
      OnKeyDown = grdKeyDown
      OnTitleClick = grdTitleClick
    end
  end
  object Panel2: TPanel
    Left = 0
    Top = 374
    Width = 813
    Height = 11
    Align = alBottom
    BevelOuter = bvNone
    TabOrder = 5
    object Label1: TLabel
      Left = 5
      Top = -3
      Width = 48
      Height = 14
      Caption = 'Disciplina:'
    end
    object lblProfessores: TLabel
      Left = 72
      Top = -3
      Width = 98
      Height = 14
      Caption = '[nome do professor]'
    end
  end
  object tblFicha: TUMZQuery
    Connection = DM.db
    AfterClose = tblFichaAfterClose
    OnCalcFields = tblFichaCalcFields
    CachedUpdates = True
    AfterPost = tblFichaAfterPost
    SQL.Strings = (
      'SELECT'
      '  FichaIndividual.*,'
      '  Pessoas.nm_pessoa as nome,'
      '  FichaIndividual.Turma,'
      '  Provainstitucional.mediainstitucional as nota_pi,'
      '  Disciplinas.Sigla,'
      '  Disciplinas.descricao'
      'FROM'
      '  ((FichaIndividual'
      
        '    INNER JOIN Pessoas ON FichaIndividual.CodigoAluno = Pessoas.' +
        'cd_pessoa)'
      
        '    INNER JOIN TURMAS as t ON (t.codigo = FichaIndividual.turma ' +
        'and FichaIndividual.anosemestre = t.anosemestre)'
      
        '    INNER JOIN GRADES as g ON (g.cd_grade = t.cd_grade and t.cur' +
        'so = g.CD_CURSO)'
      
        '    INNER JOIN grades_disciplinas as gd ON (gd.CD_GRADE = g.CD_G' +
        'RADE AND gd.CD_CURSO = FichaIndividual.curso AND gd.CD_DISCIPLIN' +
        'A = FichaIndividual.disciplina)'
      '  )'
      
        '    INNER JOIN Disciplinas ON (gd.cd_disciplina = Disciplinas.Co' +
        'digo and gd.cd_curso = Disciplinas.Curso)'
      
        '    LEFT JOIN Provainstitucional ON (FichaIndividual.codigoaluno' +
        ' = Provainstitucional.codigoaluno AND FichaIndividual.anosemestr' +
        'e = Provainstitucional.anosemestre AND Fichaindividual.turmamatr' +
        'icula = Provainstitucional.turma)'
      'WHERE'
      '  FichaIndividual.codigoaluno = 999999'
      'ORDER BY'
      
        '  Pessoas.nm_pessoa, Disciplinas.ordem, FichaIndividual.CodigoGr' +
        'ade;')
    Params = <>
    Left = 48
    Top = 232
    object tblFichaCodigoAluno: TIntegerField
      DisplayLabel = 'C'#243'd.'
      DisplayWidth = 8
      FieldName = 'CodigoAluno'
      DisplayFormat = '00000-0'
    end
    object tblFichaNome: TStringField
      DisplayWidth = 10
      FieldName = 'Nome'
      Size = 45
    end
    object tblFichaTurma: TStringField
      Alignment = taCenter
      DisplayWidth = 50
      FieldName = 'Turma'
      Size = 50
    end
    object tblFichaSigla: TStringField
      Alignment = taCenter
      DisplayWidth = 10
      FieldName = 'Sigla'
      Size = 10
    end
    object tblFichaDescricaoSituacao: TStringField
      DisplayLabel = 'Sit.'
      DisplayWidth = 10
      FieldKind = fkCalculated
      FieldName = 'DescricaoSituacao'
      Calculated = True
    end
    object tblFichaSituacao: TSmallintField
      DisplayLabel = 'Sit.'
      DisplayWidth = 4
      FieldName = 'Situacao'
      Visible = False
    end
    object tblFichaAnoSemestre: TSmallintField
      DisplayLabel = 'Ano/Sem.'
      DisplayWidth = 10
      FieldName = 'AnoSemestre'
      Visible = False
      DisplayFormat = '0000/0'
    end
    object tblFichaCurso: TStringField
      DisplayWidth = 15
      FieldName = 'Curso'
      Size = 15
    end
    object tblFichaCodigoGrade: TStringField
      FieldName = 'CodigoGrade'
    end
    object tblFichaTurmaMatricula: TStringField
      DisplayWidth = 50
      FieldName = 'TurmaMatricula'
      Size = 50
    end
    object tblFichaGrau: TSmallintField
      FieldName = 'Grau'
    end
    object tblFichaSerie: TSmallintField
      FieldName = 'Serie'
    end
    object tblFichaNota1: TFloatField
      Alignment = taCenter
      DisplayLabel = 'M'#233'd.1'
      DisplayWidth = 5
      FieldName = 'Nota1'
      OnGetText = tblFichaNota1GetText
      DisplayFormat = '#0.0'
    end
    object tblFichaNota2: TFloatField
      Alignment = taCenter
      DisplayLabel = 'M'#233'd.2'
      DisplayWidth = 5
      FieldName = 'Nota2'
      OnGetText = tblFichaNota1GetText
      DisplayFormat = '#0.0'
    end
    object tblFichaNota3: TFloatField
      Alignment = taCenter
      DisplayLabel = 'M'#233'd.3'
      DisplayWidth = 5
      FieldName = 'Nota3'
      OnGetText = tblFichaNota1GetText
      DisplayFormat = '#0.0'
    end
    object tblFichaNota4: TFloatField
      Alignment = taCenter
      DisplayLabel = 'M'#233'd.4'
      DisplayWidth = 5
      FieldName = 'Nota4'
      OnGetText = tblFichaNota1GetText
      DisplayFormat = '#0.0'
    end
    object tblFichaNota5: TFloatField
      Alignment = taCenter
      DisplayLabel = 'M'#233'd.5'
      FieldName = 'Nota5'
      OnGetText = tblFichaNota1GetText
      DisplayFormat = '#0.0'
    end
    object tblFichaNota6: TFloatField
      Alignment = taCenter
      DisplayLabel = 'M'#233'd.6'
      FieldName = 'Nota6'
      OnGetText = tblFichaNota1GetText
      DisplayFormat = '#0.0'
    end
    object tblFichaNota7: TFloatField
      Alignment = taCenter
      DisplayLabel = 'M'#233'd.7'
      FieldName = 'Nota7'
      OnGetText = tblFichaNota1GetText
      DisplayFormat = '#0.0'
    end
    object tblFichaNota8: TFloatField
      Alignment = taCenter
      DisplayLabel = 'M'#233'd.8'
      FieldName = 'Nota8'
      OnGetText = tblFichaNota1GetText
      DisplayFormat = '#0.0'
    end
    object tblFichaNota9: TFloatField
      Alignment = taCenter
      DisplayLabel = 'M'#233'd.9'
      FieldName = 'Nota9'
      OnGetText = tblFichaNota1GetText
      DisplayFormat = '#0.0'
    end
    object tblFichaNota10: TFloatField
      Alignment = taCenter
      DisplayLabel = 'M'#233'd.10'
      FieldName = 'Nota10'
      OnGetText = tblFichaNota1GetText
      DisplayFormat = '#0.0'
    end
    object tblFichaNotaExame: TFloatField
      Alignment = taCenter
      DisplayLabel = 'Ex F'
      DisplayWidth = 5
      FieldName = 'NotaExame'
      OnGetText = tblFichaNotaExameGetText
      DisplayFormat = '#0.00'
    end
    object tblFichaMediaFinal: TFloatField
      Alignment = taCenter
      FieldName = 'MediaFinal'
      OnGetText = tblFichaNota1GetText
      DisplayFormat = '#0.0'
    end
    object tblFichaUsuario: TIntegerField
      FieldName = 'Usuario'
    end
    object tblFichaCodigoEscola: TSmallintField
      FieldName = 'CodigoEscola'
    end
    object tblFichaMediaAnual: TFloatField
      Alignment = taCenter
      FieldName = 'MediaAnual'
      OnGetText = tblFichaNota1GetText
    end
    object tblFichaSegunda_Epoca: TFloatField
      Alignment = taCenter
      FieldName = 'Segunda_Epoca'
      OnGetText = tblFichaSegunda_EpocaGetText
    end
    object tblFichaexame1: TFloatField
      Alignment = taCenter
      FieldName = 'exame1'
      OnGetText = tblFichaexame1GetText
    end
    object tblFichaexame2: TFloatField
      Alignment = taCenter
      FieldName = 'exame2'
      OnGetText = tblFichaexame1GetText
    end
    object tblFichaexame3: TFloatField
      Alignment = taCenter
      FieldName = 'exame3'
      OnGetText = tblFichaexame1GetText
    end
    object tblFichaexame4: TFloatField
      Alignment = taCenter
      FieldName = 'exame4'
      OnGetText = tblFichaexame1GetText
    end
    object tblFichaexame5: TFloatField
      Alignment = taCenter
      FieldName = 'exame5'
      OnGetText = tblFichaexame1GetText
    end
    object tblFichaexame6: TFloatField
      Alignment = taCenter
      FieldName = 'exame6'
      OnGetText = tblFichaexame1GetText
    end
    object tblFichaexame7: TFloatField
      Alignment = taCenter
      FieldName = 'exame7'
      OnGetText = tblFichaexame1GetText
    end
    object tblFichaexame8: TFloatField
      Alignment = taCenter
      FieldName = 'exame8'
      OnGetText = tblFichaexame1GetText
    end
    object tblFichaexame9: TFloatField
      Alignment = taCenter
      FieldName = 'exame9'
      OnGetText = tblFichaexame1GetText
    end
    object tblFichaexame10: TFloatField
      Alignment = taCenter
      FieldName = 'exame10'
      OnGetText = tblFichaexame1GetText
    end
    object tblFichanota_d1: TFloatField
      Alignment = taCenter
      FieldName = 'nota_d1'
      OnGetText = tblFichaNota1GetText
    end
    object tblFichanota_d2: TFloatField
      Alignment = taCenter
      FieldName = 'nota_d2'
      OnGetText = tblFichaNota1GetText
    end
    object tblFichanota_d3: TFloatField
      Alignment = taCenter
      FieldName = 'nota_d3'
      OnGetText = tblFichaNota1GetText
    end
    object tblFichanota_d4: TFloatField
      Alignment = taCenter
      FieldName = 'nota_d4'
      OnGetText = tblFichaNota1GetText
    end
    object tblFichanota_d5: TFloatField
      Alignment = taCenter
      FieldName = 'nota_d5'
      OnGetText = tblFichaNota1GetText
    end
    object tblFichanota_d6: TFloatField
      Alignment = taCenter
      FieldName = 'nota_d6'
      OnGetText = tblFichaNota1GetText
    end
    object tblFichanota_d7: TFloatField
      Alignment = taCenter
      FieldName = 'nota_d7'
      OnGetText = tblFichaNota1GetText
    end
    object tblFichanota_d8: TFloatField
      Alignment = taCenter
      FieldName = 'nota_d8'
      OnGetText = tblFichaNota1GetText
    end
    object tblFichanota_d9: TFloatField
      Alignment = taCenter
      FieldName = 'nota_d9'
      OnGetText = tblFichaNota1GetText
    end
    object tblFichanota_d10: TFloatField
      Alignment = taCenter
      FieldName = 'nota_d10'
      OnGetText = tblFichaNota1GetText
    end
    object tblFichaaproveitamento: TStringField
      Alignment = taCenter
      FieldName = 'aproveitamento'
      FixedChar = True
      Size = 1
    end
    object tblFichaarrumardiario: TStringField
      FieldName = 'arrumardiario'
      Size = 50
    end
    object tblFichasimbolo_obs: TStringField
      FieldName = 'simbolo_obs'
      Size = 5
    end
    object tblFichacarga_horaria: TFloatField
      FieldName = 'carga_horaria'
    end
    object tblFichasn_bloqueado1: TSmallintField
      Alignment = taCenter
      FieldName = 'sn_bloqueado1'
    end
    object tblFichasn_bloqueado2: TSmallintField
      Alignment = taCenter
      FieldName = 'sn_bloqueado2'
    end
    object tblFichasn_bloqueado3: TSmallintField
      Alignment = taCenter
      FieldName = 'sn_bloqueado3'
    end
    object tblFichasn_bloqueado4: TSmallintField
      Alignment = taCenter
      FieldName = 'sn_bloqueado4'
    end
    object tblFichasn_bloqueado5: TSmallintField
      Alignment = taCenter
      FieldName = 'sn_bloqueado5'
    end
    object tblFichasn_bloqueado6: TSmallintField
      Alignment = taCenter
      FieldName = 'sn_bloqueado6'
    end
    object tblFichasn_bloqueado7: TSmallintField
      Alignment = taCenter
      FieldName = 'sn_bloqueado7'
    end
    object tblFichasn_bloqueado8: TSmallintField
      Alignment = taCenter
      FieldName = 'sn_bloqueado8'
    end
    object tblFichasn_bloqueado9: TSmallintField
      Alignment = taCenter
      FieldName = 'sn_bloqueado9'
    end
    object tblFichasn_bloqueado10: TSmallintField
      Alignment = taCenter
      FieldName = 'sn_bloqueado10'
    end
    object tblFichabloq1: TStringField
      Alignment = taCenter
      FieldKind = fkCalculated
      FieldName = 'bloq1'
      Size = 1
      Calculated = True
    end
    object tblFichabloq2: TStringField
      Alignment = taCenter
      FieldKind = fkCalculated
      FieldName = 'bloq2'
      Size = 1
      Calculated = True
    end
    object tblFichabloq3: TStringField
      Alignment = taCenter
      FieldKind = fkCalculated
      FieldName = 'bloq3'
      Size = 1
      Calculated = True
    end
    object tblFichabloq4: TStringField
      Alignment = taCenter
      FieldKind = fkCalculated
      FieldName = 'bloq4'
      Size = 1
      Calculated = True
    end
    object tblFichabloq5: TStringField
      Alignment = taCenter
      FieldKind = fkCalculated
      FieldName = 'bloq5'
      Size = 1
      Calculated = True
    end
    object tblFichabloq6: TStringField
      Alignment = taCenter
      FieldKind = fkCalculated
      FieldName = 'bloq6'
      Size = 1
      Calculated = True
    end
    object tblFichabloq7: TStringField
      Alignment = taCenter
      FieldKind = fkCalculated
      FieldName = 'bloq7'
      Size = 1
      Calculated = True
    end
    object tblFichabloq8: TStringField
      Alignment = taCenter
      FieldKind = fkCalculated
      FieldName = 'bloq8'
      Size = 1
      Calculated = True
    end
    object tblFichabloq9: TStringField
      Alignment = taCenter
      FieldKind = fkCalculated
      FieldName = 'bloq9'
      Size = 1
      Calculated = True
    end
    object tblFichabloq10: TStringField
      Alignment = taCenter
      FieldKind = fkCalculated
      FieldName = 'bloq10'
      Size = 1
      Calculated = True
    end
    object tblFichafrequencia: TFloatField
      Alignment = taCenter
      DisplayLabel = 'F.%'
      FieldName = 'frequencia'
      DisplayFormat = '##0'
    end
    object tblFichadt_saida: TDateTimeField
      FieldName = 'dt_saida'
    end
    object tblFichadb_media_periodo1: TFloatField
      Alignment = taCenter
      FieldName = 'db_media_periodo1'
      OnGetText = tblFichaNota1GetText
    end
    object tblFichacd_situacao_periodo1: TSmallintField
      Alignment = taCenter
      FieldName = 'cd_situacao_periodo1'
    end
    object tblFichadb_media_periodo2: TFloatField
      Alignment = taCenter
      FieldName = 'db_media_periodo2'
      OnGetText = tblFichaNota1GetText
    end
    object tblFichacd_situacao_periodo2: TSmallintField
      Alignment = taCenter
      FieldName = 'cd_situacao_periodo2'
    end
    object tblFichadb_media_periodo3: TFloatField
      Alignment = taCenter
      FieldName = 'db_media_periodo3'
      OnGetText = tblFichaNota1GetText
    end
    object tblFichacd_situacao_periodo3: TSmallintField
      Alignment = taCenter
      FieldName = 'cd_situacao_periodo3'
    end
    object tblFichadb_media_periodo4: TFloatField
      Alignment = taCenter
      FieldName = 'db_media_periodo4'
      OnGetText = tblFichaNota1GetText
    end
    object tblFichacd_situacao_periodo4: TSmallintField
      Alignment = taCenter
      FieldName = 'cd_situacao_periodo4'
    end
    object tblFichadb_media_periodo5: TFloatField
      Alignment = taCenter
      FieldName = 'db_media_periodo5'
      OnGetText = tblFichaNota1GetText
    end
    object tblFichacd_situacao_periodo5: TSmallintField
      Alignment = taCenter
      FieldName = 'cd_situacao_periodo5'
    end
    object tblFichadb_media_periodo6: TFloatField
      Alignment = taCenter
      FieldName = 'db_media_periodo6'
      OnGetText = tblFichaNota1GetText
    end
    object tblFichacd_situacao_periodo6: TSmallintField
      Alignment = taCenter
      FieldName = 'cd_situacao_periodo6'
    end
    object tblFichadb_media_periodo7: TFloatField
      Alignment = taCenter
      FieldName = 'db_media_periodo7'
      OnGetText = tblFichaNota1GetText
    end
    object tblFichacd_situacao_periodo7: TSmallintField
      Alignment = taCenter
      FieldName = 'cd_situacao_periodo7'
    end
    object tblFichadb_media_periodo8: TFloatField
      Alignment = taCenter
      FieldName = 'db_media_periodo8'
      OnGetText = tblFichaNota1GetText
    end
    object tblFichacd_situacao_periodo8: TSmallintField
      Alignment = taCenter
      FieldName = 'cd_situacao_periodo8'
    end
    object tblFichadb_media_periodo9: TFloatField
      Alignment = taCenter
      FieldName = 'db_media_periodo9'
      OnGetText = tblFichaNota1GetText
    end
    object tblFichacd_situacao_periodo9: TSmallintField
      Alignment = taCenter
      FieldName = 'cd_situacao_periodo9'
    end
    object tblFichadb_media_periodo10: TFloatField
      Alignment = taCenter
      FieldName = 'db_media_periodo10'
      OnGetText = tblFichaNota1GetText
    end
    object tblFichacd_situacao_periodo10: TSmallintField
      Alignment = taCenter
      FieldName = 'cd_situacao_periodo10'
    end
    object tblFichads_situacao_periodo1: TStringField
      Alignment = taCenter
      FieldKind = fkLookup
      FieldName = 'ds_situacao_periodo1'
      LookupDataSet = qySituacoes
      LookupKeyFields = 'cd_situacao'
      LookupResultField = 'ds_sigla'
      KeyFields = 'cd_situacao_periodo1'
      Size = 50
      Lookup = True
    end
    object tblFichads_situacao_periodo2: TStringField
      Alignment = taCenter
      FieldKind = fkLookup
      FieldName = 'ds_situacao_periodo2'
      LookupDataSet = qySituacoes
      LookupKeyFields = 'cd_situacao'
      LookupResultField = 'ds_sigla'
      KeyFields = 'cd_situacao_periodo2'
      Size = 50
      Lookup = True
    end
    object tblFichads_situacao_periodo3: TStringField
      Alignment = taCenter
      FieldKind = fkLookup
      FieldName = 'ds_situacao_periodo3'
      LookupDataSet = qySituacoes
      LookupKeyFields = 'cd_situacao'
      LookupResultField = 'ds_sigla'
      KeyFields = 'cd_situacao_periodo3'
      Size = 50
      Lookup = True
    end
    object tblFichads_situacao_periodo4: TStringField
      Alignment = taCenter
      FieldKind = fkLookup
      FieldName = 'ds_situacao_periodo4'
      LookupDataSet = qySituacoes
      LookupKeyFields = 'cd_situacao'
      LookupResultField = 'ds_sigla'
      KeyFields = 'cd_situacao_periodo4'
      Size = 50
      Lookup = True
    end
    object tblFichads_situacao_periodo5: TStringField
      Alignment = taCenter
      FieldKind = fkLookup
      FieldName = 'ds_situacao_periodo5'
      LookupDataSet = qySituacoes
      LookupKeyFields = 'cd_situacao'
      LookupResultField = 'ds_sigla'
      KeyFields = 'cd_situacao_periodo5'
      Size = 50
      Lookup = True
    end
    object tblFichads_situacao_periodo6: TStringField
      Alignment = taCenter
      FieldKind = fkLookup
      FieldName = 'ds_situacao_periodo6'
      LookupDataSet = qySituacoes
      LookupKeyFields = 'cd_situacao'
      LookupResultField = 'ds_sigla'
      KeyFields = 'cd_situacao_periodo6'
      Size = 50
      Lookup = True
    end
    object tblFichads_situacao_periodo7: TStringField
      Alignment = taCenter
      FieldKind = fkLookup
      FieldName = 'ds_situacao_periodo7'
      LookupDataSet = qySituacoes
      LookupKeyFields = 'cd_situacao'
      LookupResultField = 'ds_sigla'
      KeyFields = 'cd_situacao_periodo7'
      Size = 50
      Lookup = True
    end
    object tblFichads_situacao_periodo8: TStringField
      Alignment = taCenter
      FieldKind = fkLookup
      FieldName = 'ds_situacao_periodo8'
      LookupDataSet = qySituacoes
      LookupKeyFields = 'cd_situacao'
      LookupResultField = 'ds_sigla'
      KeyFields = 'cd_situacao_periodo8'
      Size = 50
      Lookup = True
    end
    object tblFichads_situacao_periodo9: TStringField
      Alignment = taCenter
      FieldKind = fkLookup
      FieldName = 'ds_situacao_periodo9'
      LookupDataSet = qySituacoes
      LookupKeyFields = 'cd_situacao'
      LookupResultField = 'ds_sigla'
      KeyFields = 'cd_situacao_periodo9'
      Size = 50
      Lookup = True
    end
    object tblFichads_situacao_periodo10: TStringField
      Alignment = taCenter
      FieldKind = fkLookup
      FieldName = 'ds_situacao_periodo10'
      LookupDataSet = qySituacoes
      LookupKeyFields = 'cd_situacao'
      LookupResultField = 'ds_sigla'
      KeyFields = 'cd_situacao_periodo10'
      Size = 50
      Lookup = True
    end
    object tblFichads_media: TStringField
      Alignment = taCenter
      FieldName = 'ds_media'
      Size = 10
    end
    object tblFichabloqA: TStringField
      Alignment = taCenter
      FieldKind = fkCalculated
      FieldName = 'bloqA'
      Size = 1
      Calculated = True
    end
    object tblFichadescricao: TStringField
      FieldName = 'descricao'
      Size = 150
    end
    object tblFichasn_bloq_freq1: TSmallintField
      FieldName = 'sn_bloq_freq1'
    end
    object tblFichasn_bloq_freq2: TSmallintField
      FieldName = 'sn_bloq_freq2'
    end
    object tblFichasn_bloq_freq3: TSmallintField
      FieldName = 'sn_bloq_freq3'
    end
    object tblFichasn_bloq_freq4: TSmallintField
      FieldName = 'sn_bloq_freq4'
    end
    object tblFichasn_bloq_freq5: TSmallintField
      FieldName = 'sn_bloq_freq5'
    end
    object tblFichasn_bloq_freq6: TSmallintField
      FieldName = 'sn_bloq_freq6'
    end
    object tblFichasn_bloq_freq7: TSmallintField
      FieldName = 'sn_bloq_freq7'
    end
    object tblFichasn_bloq_freq8: TSmallintField
      FieldName = 'sn_bloq_freq8'
    end
    object tblFichasn_bloq_freq9: TSmallintField
      FieldName = 'sn_bloq_freq9'
    end
    object tblFichasn_bloq_freq10: TSmallintField
      FieldName = 'sn_bloq_freq10'
    end
    object tblFichasn_bloq_freq_global: TSmallintField
      FieldName = 'sn_bloq_freq_global'
    end
    object tblFichabloq_freq1: TStringField
      Alignment = taCenter
      FieldKind = fkCalculated
      FieldName = 'bloq_freq1'
      Size = 1
      Calculated = True
    end
    object tblFichabloq_freq3: TStringField
      Alignment = taCenter
      FieldKind = fkCalculated
      FieldName = 'bloq_freq3'
      Size = 1
      Calculated = True
    end
    object tblFichabloq_freq2: TStringField
      Alignment = taCenter
      FieldKind = fkCalculated
      FieldName = 'bloq_freq2'
      Size = 1
      Calculated = True
    end
    object tblFichabloq_freq4: TStringField
      Alignment = taCenter
      FieldKind = fkCalculated
      FieldName = 'bloq_freq4'
      Size = 1
      Calculated = True
    end
    object tblFichabloq_freq5: TStringField
      Alignment = taCenter
      FieldKind = fkCalculated
      FieldName = 'bloq_freq5'
      Size = 1
      Calculated = True
    end
    object tblFichabloq_freq6: TStringField
      Alignment = taCenter
      FieldKind = fkCalculated
      FieldName = 'bloq_freq6'
      Size = 1
      Calculated = True
    end
    object tblFichabloq_freq8: TStringField
      Alignment = taCenter
      FieldKind = fkCalculated
      FieldName = 'bloq_freq8'
      Size = 1
      Calculated = True
    end
    object tblFichabloq_freq7: TStringField
      Alignment = taCenter
      FieldKind = fkCalculated
      FieldName = 'bloq_freq7'
      Size = 1
      Calculated = True
    end
    object tblFichabloq_freq9: TStringField
      Alignment = taCenter
      FieldKind = fkCalculated
      FieldName = 'bloq_freq9'
      Calculated = True
    end
    object tblFichabloq_freq10: TStringField
      Alignment = taCenter
      FieldKind = fkCalculated
      FieldName = 'bloq_freq10'
      Size = 1
      Calculated = True
    end
    object tblFichabloq_freq_global: TStringField
      Alignment = taCenter
      FieldKind = fkCalculated
      FieldName = 'bloq_freq_global'
      Size = 1
      Calculated = True
    end
    object tblFichadisciplina: TIntegerField
      FieldName = 'disciplina'
    end
    object tblFichanota_pi: TFloatField
      FieldName = 'nota_pi'
    end
    object tblFichamediainstitucional: TStringField
      FieldKind = fkCalculated
      FieldName = 'mediainstitucional'
      Calculated = True
    end
    object tblFichasn_faltou_exame: TSmallintField
      FieldName = 'sn_faltou_exame'
      ReadOnly = True
    end
    object tblFichasn_faltou_2epoca: TSmallintField
      FieldName = 'sn_faltou_2epoca'
      ReadOnly = True
    end
    object tblFichasn_possui_adap: TSmallintField
      FieldName = 'sn_possui_adap'
      ReadOnly = True
    end
    object tblFichasn_possui_depen: TSmallintField
      FieldName = 'sn_possui_depen'
      ReadOnly = True
    end
    object tblFichatotalfaltas: TFloatField
      Alignment = taCenter
      FieldName = 'totalfaltas'
    end
    object tblFichafalta1: TFloatField
      Alignment = taCenter
      DisplayLabel = 'F 1'
      DisplayWidth = 5
      FieldName = 'falta1'
      OnGetText = tblFichaFalta1GetText
    end
    object tblFichafalta2: TFloatField
      Alignment = taCenter
      DisplayLabel = 'F 2'
      DisplayWidth = 5
      FieldName = 'falta2'
      OnGetText = tblFichaFalta1GetText
    end
    object tblFichafalta3: TFloatField
      Alignment = taCenter
      DisplayLabel = 'F 3'
      DisplayWidth = 5
      FieldName = 'falta3'
      OnGetText = tblFichaFalta1GetText
    end
    object tblFichafalta4: TFloatField
      Alignment = taCenter
      DisplayLabel = 'F 4'
      DisplayWidth = 5
      FieldName = 'falta4'
      OnGetText = tblFichaFalta1GetText
    end
    object tblFichafalta5: TFloatField
      Alignment = taCenter
      DisplayLabel = 'F 5'
      DisplayWidth = 5
      FieldName = 'falta5'
      OnGetText = tblFichaFalta1GetText
    end
    object tblFichafalta6: TFloatField
      Alignment = taCenter
      DisplayLabel = 'F 6'
      DisplayWidth = 5
      FieldName = 'falta6'
      OnGetText = tblFichaFalta1GetText
    end
    object tblFichafalta7: TFloatField
      Alignment = taCenter
      DisplayLabel = 'F 7'
      DisplayWidth = 5
      FieldName = 'falta7'
      OnGetText = tblFichaFalta1GetText
    end
    object tblFichafalta8: TFloatField
      Alignment = taCenter
      DisplayLabel = 'F 8'
      DisplayWidth = 5
      FieldName = 'falta8'
      OnGetText = tblFichaFalta1GetText
    end
    object tblFichafalta9: TFloatField
      Alignment = taCenter
      DisplayLabel = 'F 9'
      DisplayWidth = 5
      FieldName = 'falta9'
      OnGetText = tblFichaFalta1GetText
    end
    object tblFichafalta10: TFloatField
      Alignment = taCenter
      DisplayLabel = 'F 10'
      DisplayWidth = 5
      FieldName = 'falta10'
      OnGetText = tblFichaFalta1GetText
    end
    object tblFichacd_avaliacao: TIntegerField
      FieldName = 'cd_avaliacao'
    end
    object tblFichacd_grupo: TStringField
      FieldName = 'cd_grupo'
      Size = 255
    end
  end
  object dtcFicha: TDataSource
    DataSet = tblFicha
    OnDataChange = dtcFichaDataChange
    Left = 16
    Top = 232
  end
  object qry: TUMZQuery
    Connection = DM.db
    Params = <>
    Left = 144
    Top = 232
  end
  object tblAtualizar: TUMZQuery
    Connection = DM.db
    SQL.Strings = (
      'select * from FichaIndividual'
      'order by CodigoAluno')
    Params = <>
    Left = 208
    Top = 232
  end
  object tbl: TUMZQuery
    Connection = DM.db
    SQL.Strings = (
      
        'select * from FichaIndividual where (Curso = '#39'REG02'#39' or Curso = ' +
        #39'SUP02'#39') and'
      '(AnoSemestre >= 20001) and TotalFaltas is NULL')
    Params = <>
    Left = 284
    Top = 233
  end
  object popFicha: TPopupMenu
    Left = 88
    Top = 235
    object PorAluno1: TMenuItem
      Caption = 'Por Aluno'
    end
    object PorTurma1: TMenuItem
      Caption = 'Por Turma'
    end
  end
  object ImageList1: TImageList
    Left = 440
    Top = 344
    Bitmap = {
      494C010108000900040010001000FFFFFFFFFF10FFFFFFFFFFFFFFFF424D3600
      0000000000003600000028000000400000003000000001002000000000000030
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
      2800000040000000300000000100010000000000800100000000000000000000
      000000000000000000000000FFFFFF0000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000FFFFF8F8FFFFFFFFF83FFAFAFC7FE3FF
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
  object pmQtd: TPopupMenu
    OnPopup = pmQtdPopup
    Left = 664
    Top = 264
  end
  object pmLog: TPopupMenu
    OnPopup = pmLogPopup
    Left = 360
    Top = 267
  end
  object qySituacoes: TUMZQuery
    Connection = DM.db
    CachedUpdates = True
    SQL.Strings = (
      'SELECT'
      '   *'
      'FROM'
      '   situacoes'
      'WHERE'
      '   cd_modulo = 1100')
    Params = <>
    Left = 80
    Top = 280
    object qySituacoesds_valor: TStringField
      FieldName = 'ds_valor'
      Origin = 'WMESTRE12.situacoes.ds_valor'
      Size = 255
    end
    object qySituacoesds_sigla: TStringField
      FieldName = 'ds_sigla'
      Origin = 'WMESTRE12.situacoes.ds_sigla'
      Size = 50
    end
    object qySituacoesme_descricao: TMemoField
      FieldName = 'me_descricao'
      Origin = 'WMESTRE12.situacoes.me_descricao'
      BlobType = ftMemo
      Size = 1
    end
    object qySituacoescodigo: TLargeintField
      FieldName = 'codigo'
      Required = True
    end
    object qySituacoescd_modulo: TLargeintField
      FieldName = 'cd_modulo'
    end
    object qySituacoescd_situacao: TIntegerField
      FieldName = 'cd_situacao'
    end
    object qySituacoescd_auxiliar: TLargeintField
      FieldName = 'cd_auxiliar'
    end
  end
end
