object frmDigProvaInstitucional: TfrmDigProvaInstitucional
  Left = 146
  Top = 176
  Caption = 'Digita'#231#227'o da Prova Interdisciplinar'
  ClientHeight = 423
  ClientWidth = 721
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
  object btnFechar: TSpeedButton
    Left = 630
    Top = 391
    Width = 83
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
    Top = 336
    Width = 49
    Height = 16
    Caption = 'C'#243'digo:'
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Arial'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object Label2: TLabel
    Left = 20
    Top = 360
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
    Left = 68
    Top = 360
    Width = 353
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
    Left = 178
    Top = 336
    Width = 60
    Height = 16
    Alignment = taRightJustify
    Caption = 'Reda'#231#227'o:'
    FocusControl = dbeReda
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Arial'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object Bevel1: TBevel
    Left = 8
    Top = 324
    Width = 713
    Height = 2
  end
  object Bevel2: TBevel
    Left = 8
    Top = 383
    Width = 713
    Height = 2
  end
  object Label9: TLabel
    Left = 533
    Top = 61
    Width = 47
    Height = 14
    Caption = 'Ano/Sem.'
  end
  object Label4: TLabel
    Left = 547
    Top = 86
    Width = 33
    Height = 14
    Caption = 'Turma:'
  end
  object btnTurmas: TSpeedButton
    Left = 689
    Top = 82
    Width = 32
    Height = 23
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
    Left = 524
    Top = 114
    Width = 55
    Height = 14
    Caption = 'C'#243'd. Aluno:'
  end
  object SpeedButton2: TSpeedButton
    Left = 689
    Top = 110
    Width = 32
    Height = 23
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
  object DBText2: TDBText
    Left = 70
    Top = 338
    Width = 40
    Height = 14
    AutoSize = True
    DataField = 'CodigoAluno'
    DataSource = dtcFicha
    Transparent = True
  end
  object Label3: TLabel
    Left = 320
    Top = 336
    Width = 41
    Height = 16
    Alignment = taRightJustify
    Caption = 'Prova:'
    FocusControl = dbeReda
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Arial'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object Label5: TLabel
    Left = 443
    Top = 336
    Width = 43
    Height = 16
    Alignment = taRightJustify
    Caption = 'M'#233'dia:'
    FocusControl = dbeReda
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Arial'
    Font.Style = [fsBold]
    ParentFont = False
    OnClick = btnFecharClick
  end
  object Bevel4: TBevel
    Left = 0
    Top = 0
    Width = 721
    Height = 8
    Align = alTop
    Shape = bsSpacer
    ExplicitWidth = 729
  end
  object Bevel3: TBevel
    Left = 0
    Top = 33
    Width = 721
    Height = 8
    Align = alTop
    Shape = bsSpacer
    ExplicitWidth = 729
  end
  object btnMediaPI: TSpeedButton
    Left = 526
    Top = 200
    Width = 187
    Height = 22
    Caption = 'Calcular M'#233'dia da PI'
    OnClick = btnMediaPIClick
  end
  object dbeReda: TDBEdit
    Left = 248
    Top = 334
    Width = 57
    Height = 24
    DataField = 'NotaRedacao'
    DataSource = dtcDigPRova
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Arial'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 0
    OnKeyDown = dbeRedaKeyDown
    OnKeyPress = dbeRedaKeyPress
  end
  object Panel3: TPanel
    Left = 0
    Top = 8
    Width = 721
    Height = 25
    Align = alTop
    BevelOuter = bvLowered
    Caption = 'DIGITA'#199#195'O DA PROVA INTERDISCIPLINAR'
    Color = clBlue
    Font.Charset = ANSI_CHARSET
    Font.Color = clWhite
    Font.Height = -16
    Font.Name = 'Arial'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 4
  end
  object grd: TDBGrid
    Left = 9
    Top = 48
    Width = 511
    Height = 271
    DataSource = dtcFicha
    Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgAlwaysShowSelection, dgConfirmDelete, dgCancelOnExit]
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
        Expanded = False
        FieldName = 'CodigoAluno'
        Width = 50
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'Nome'
        Width = 180
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'Turma'
        Width = 50
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'AnoSemestre'
        Width = 50
        Visible = True
      end
      item
        Alignment = taCenter
        Expanded = False
        FieldName = 'NReda'
        Title.Alignment = taCenter
        Width = 45
        Visible = True
      end
      item
        Alignment = taCenter
        Expanded = False
        FieldName = 'NProva'
        Title.Alignment = taCenter
        Width = 45
        Visible = True
      end
      item
        Alignment = taCenter
        Expanded = False
        FieldName = 'MPI'
        Title.Alignment = taCenter
        Width = 45
        Visible = True
      end>
  end
  object txtAnoSemestre: TMaskEdit
    Left = 583
    Top = 57
    Width = 54
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
    TabOrder = 2
    OnExit = txtAnoSemestreExit
    OnKeyPress = txtAnoSemestreKeyPress
  end
  object UpDown2: TUpDown
    Left = 634
    Top = 57
    Width = 15
    Height = 24
    Min = -100
    TabOrder = 3
  end
  object txtTurma: TEdit
    Left = 583
    Top = 82
    Width = 106
    Height = 22
    TabStop = False
    CharCase = ecUpperCase
    TabOrder = 5
    OnKeyPress = txtTurmaKeyPress
  end
  object txtCodigoAluno: TEdit
    Left = 583
    Top = 110
    Width = 106
    Height = 22
    TabOrder = 6
    OnExit = txtCodigoAlunoExit
    OnKeyPress = txtCodigoAlunoKeyPress
  end
  object dbeProva: TDBEdit
    Left = 367
    Top = 332
    Width = 57
    Height = 24
    DataField = 'NotaProva'
    DataSource = dtcDigPRova
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Arial'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 7
    OnKeyDown = dbeRedaKeyDown
    OnKeyPress = dbeProvaKeyPress
  end
  object dbeMedia: TDBEdit
    Left = 496
    Top = 334
    Width = 57
    Height = 24
    DataField = 'MediaInstitucional'
    DataSource = dtcDigPRova
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Arial'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 8
    OnKeyDown = dbeRedaKeyDown
    OnKeyPress = dbeMediaKeyPress
  end
  object tblFicha: TUMZQuery
    Connection = DM.db
    OnCalcFields = tblFichaCalcFields
    Filtered = True
    SQL.Strings = (
      'SELECT ProvaInstitucional.*, Alunos.Nome'
      'FROM (Alunos INNER JOIN ProvaInstitucional '
      'ON Alunos.Codigo = ProvaInstitucional.CodigoAluno)'
      'Where AnoSemestre = :AnoSemestre')
    Params = <
      item
        DataType = ftUnknown
        Name = 'AnoSemestre'
        ParamType = ptUnknown
      end>
    Left = 32
    Top = 224
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'AnoSemestre'
        ParamType = ptUnknown
      end>
    object tblFichaCodigoAluno: TIntegerField
      DisplayLabel = 'Codigo'
      FieldName = 'CodigoAluno'
      Origin = 'WMESTRE12.ProvaInstitucional.CodigoAluno'
    end
    object tblFichaNome: TStringField
      FieldName = 'Nome'
      Origin = 'WMESTRE12.Alunos.Nome'
      Size = 45
    end
    object tblFichaTurma: TStringField
      FieldName = 'Turma'
      Origin = 'WMESTRE12.ProvaInstitucional.Turma'
      Size = 50
    end
    object tblFichaAnoSemestre: TSmallintField
      DisplayLabel = 'Ano/Sem.'
      FieldName = 'AnoSemestre'
      Origin = 'WMESTRE12.ProvaInstitucional.AnoSemestre'
    end
    object tblFichaNotaRedacao: TFloatField
      DisplayLabel = 'Reda'#231#227'o'
      FieldName = 'NotaRedacao'
      Origin = 'WMESTRE12.ProvaInstitucional.NotaRedacao'
      DisplayFormat = '#0.00'
    end
    object tblFichaNotaProva: TFloatField
      DisplayLabel = 'Quest'#245'es'
      FieldName = 'NotaProva'
      Origin = 'WMESTRE12.ProvaInstitucional.NotaProva'
      DisplayFormat = '#0.00'
    end
    object tblFichaMediaInstitucional: TFloatField
      DisplayLabel = 'P.I.'
      FieldName = 'MediaInstitucional'
      Origin = 'WMESTRE12.ProvaInstitucional.MediaInstitucional'
      DisplayFormat = '#0.00'
    end
    object tblFichaNProva: TStringField
      DisplayLabel = 'Prova'
      FieldKind = fkCalculated
      FieldName = 'NProva'
      Size = 8
      Calculated = True
    end
    object tblFichaMPI: TStringField
      DisplayLabel = 'P.I.'
      FieldKind = fkCalculated
      FieldName = 'MPI'
      Size = 8
      Calculated = True
    end
    object tblFichaNReda: TStringField
      DisplayLabel = 'Reda'#231#227'o'
      FieldKind = fkCalculated
      FieldName = 'NReda'
      Size = 4
      Calculated = True
    end
    object tblFichanr_casas_decimais: TSmallintField
      FieldName = 'nr_casas_decimais'
    end
  end
  object dtcFicha: TDataSource
    DataSet = tblFicha
    OnDataChange = dtcFichaDataChange
    Left = 32
    Top = 272
  end
  object qry: TUMZQuery
    Connection = DM.db
    SQL.Strings = (
      'SELECT P.codigoaluno, P.turma, P.anosemestre, P.notaredacao,'
      'P.notaredacao1, P.notaredacao2, P.cd_prova, P.sn_pi,'
      'P.notaprova AS notaprova,'
      'P.mediainstitucional AS mediainstitucional'
      'FROM ProvaInstitucional P'
      'where'
      'P.AnoSemestre = :AnoSemestre and'
      'P.Codigoaluno = :CodigoAluno and'
      'P.Turma = :Turma')
    Params = <
      item
        DataType = ftInteger
        Name = 'AnoSemestre'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'CodigoAluno'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'Turma'
        ParamType = ptUnknown
      end>
    Left = 64
    Top = 224
    ParamData = <
      item
        DataType = ftInteger
        Name = 'AnoSemestre'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'CodigoAluno'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'Turma'
        ParamType = ptUnknown
      end>
    object qryCodigoAluno: TIntegerField
      FieldName = 'CodigoAluno'
      Origin = 'WMESTRE12.ProvaInstitucional.CodigoAluno'
    end
    object qryTurma: TStringField
      FieldName = 'Turma'
      Origin = 'WMESTRE12.ProvaInstitucional.Turma'
      Size = 50
    end
    object qryAnoSemestre: TSmallintField
      FieldName = 'AnoSemestre'
      Origin = 'WMESTRE12.ProvaInstitucional.AnoSemestre'
    end
    object qryNotaRedacao: TFloatField
      FieldName = 'NotaRedacao'
      Origin = 'WMESTRE12.ProvaInstitucional.NotaRedacao'
      DisplayFormat = '#0.0'
    end
    object qryNotaProva: TFloatField
      FieldName = 'NotaProva'
      Origin = 'WMESTRE12.ProvaInstitucional.NotaProva'
      DisplayFormat = '#0.0'
    end
    object qryMediaInstitucional: TFloatField
      FieldName = 'MediaInstitucional'
      Origin = 'WMESTRE12.ProvaInstitucional.MediaInstitucional'
      DisplayFormat = '#0.0'
    end
  end
  object popTurmas: TPopupMenu
    Left = 608
    Top = 328
  end
  object tblDigProva: TUMZQuery
    Connection = DM.db
    SQL.Strings = (
      'SELECT P.codigoaluno, P.turma, P.anosemestre, P.notaredacao,'
      'P.notaredacao1, P.notaredacao2, P.cd_prova, P.sn_pi,'
      'P.notaprova AS notaprova,'
      'P.mediainstitucional AS mediainstitucional'
      'FROM ProvaInstitucional P'
      '')
    Params = <>
    Left = 168
    Top = 224
    object tblDigProvaCodigoAluno: TIntegerField
      FieldName = 'CodigoAluno'
      Origin = 'WMESTRE12.ProvaInstitucional.CodigoAluno'
    end
    object tblDigProvaTurma: TStringField
      FieldName = 'Turma'
      Origin = 'WMESTRE12.ProvaInstitucional.Turma'
      Size = 50
    end
    object tblDigProvaAnoSemestre: TSmallintField
      FieldName = 'AnoSemestre'
      Origin = 'WMESTRE12.ProvaInstitucional.AnoSemestre'
    end
    object tblDigProvaNotaRedacao: TFloatField
      FieldName = 'NotaRedacao'
      Origin = 'WMESTRE12.ProvaInstitucional.NotaRedacao'
      OnChange = tblDigProvaNotaRedacaoChange
      DisplayFormat = '#0.00'
    end
    object tblDigProvaNotaProva: TFloatField
      FieldName = 'NotaProva'
      Origin = 'WMESTRE12.ProvaInstitucional.NotaProva'
      OnChange = tblDigProvaNotaProvaChange
    end
    object tblDigProvaMediaInstitucional: TFloatField
      FieldName = 'MediaInstitucional'
      Origin = 'WMESTRE12.ProvaInstitucional.MediaInstitucional'
    end
  end
  object tblInclusao: TUMZQuery
    Connection = DM.db
    Params = <>
    Left = 32
    Top = 192
  end
  object dtcDigPRova: TDataSource
    DataSet = tblDigProva
    Left = 200
    Top = 224
  end
  object pmQtd: TPopupMenu
    OnPopup = pmQtdPopup
    Left = 664
    Top = 264
  end
end
