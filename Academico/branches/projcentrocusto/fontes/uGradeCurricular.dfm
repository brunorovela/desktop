object frmGradeCurricular: TfrmGradeCurricular
  Left = 141
  Top = 102
  Width = 498
  Height = 351
  Caption = 'Grade Curricular'
  Font.Charset = ANSI_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Arial'
  Font.Style = []
  KeyPreview = True
  Position = poScreenCenter
  Visible = True
  OnClose = FormClose
  OnKeyDown = FormKeyDown
  PixelsPerInch = 96
  TextHeight = 14
  object dkBottom: TDock97
    Left = 0
    Top = 266
    Width = 490
    Height = 58
    Position = dpBottom
    object tbNavigator: TToolbar97
      Left = 0
      Top = 29
      Caption = 'Navegador'
      DockPos = 0
      DockRow = 1
      FullSize = True
      TabOrder = 0
      object btnCancelar: TSpeedButton
        Left = 95
        Top = 0
        Width = 95
        Height = 25
        Hint = 'Cancelar'
        Caption = 'F6 &Cancelar'
        Flat = True
        Glyph.Data = {
          F6000000424DF600000000000000760000002800000010000000100000000100
          04000000000080000000CE0E0000D80E00001000000000000000000000000000
          80000080000000808000800000008000800080800000C0C0C000808080000000
          FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00777777777777
          7777777777777777777777777777777770F77770F7777777777777000F777777
          0F7777000F777770F777777000F77700F7777777000F700F77777777700000F7
          7777777777000F7777777777700000F777777777000F70F77777770000F77700
          F77770000F7777700F77700F7777777700F77777777777777777}
        OnClick = btnCancelarClick
      end
      object btnImprimir: TSpeedButton
        Left = 190
        Top = 0
        Width = 95
        Height = 25
        Hint = 'Imprimir'
        Caption = 'F7 Im&primir'
        Flat = True
        Glyph.Data = {
          F6000000424DF600000000000000760000002800000010000000100000000100
          04000000000080000000CE0E0000D80E00001000000000000000000000000000
          8000008000000080800080000000800080008080000080808000C0C0C0000000
          FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00222222222222
          22222200000000000222208888888880802200000000000008020888888BBB88
          0002088888877788080200000000000008800888888888808080200000000008
          0800220FFFFFFFF080802220F00000F000022220FFFFFFFF022222220F00000F
          022222220FFFFFFFF02222222000000000222222222222222222}
      end
      object btnPesquisar: TSpeedButton
        Left = 285
        Top = 0
        Width = 95
        Height = 25
        Hint = 'Pesquisar'
        Caption = 'F8 &Pesquisar'
        Flat = True
        Glyph.Data = {
          F6000000424DF600000000000000760000002800000010000000100000000100
          04000000000080000000CE0E0000D80E00001000000000000000000000000000
          80000080000000808000800000008000800080800000C0C0C000808080000000
          FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00222222222222
          222200000000000022000FFFFFFFFFF020000FFFFFFF000080020FFFFFF08778
          08220FFFFF0877E880220FFFFF07777870220FFFFF07E77870220FFFFF08EE78
          80220FFFFFF0877802220FFFFFFF000022220FFFFFFFFFF022220FFFFFFF0000
          22220FFFFFFF070222220FFFFFFF002222220000000002222222}
        OnClick = btnPesquisarClick
      end
      object btnSair: TSpeedButton
        Left = 380
        Top = 0
        Width = 95
        Height = 25
        Hint = 'Sair'
        Caption = 'F12 Sai&r'
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
        OnClick = btnSairClick
      end
      object btnExcluir: TSpeedButton
        Left = 0
        Top = 0
        Width = 95
        Height = 25
        Hint = 'Excluir'
        Caption = 'F5 E&xcluir'
        Flat = True
        Glyph.Data = {
          76010000424D7601000000000000760000002800000020000000100000000100
          04000000000000010000130B0000130B00001000000000000000000000000000
          800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
          FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333333333333
          333333333333333333FF33333333333330003333333333333777333333333333
          300033FFFFFF3333377739999993333333333777777F3333333F399999933333
          3300377777733333337733333333333333003333333333333377333333333333
          3333333333333333333F333333333333330033333F33333333773333C3333333
          330033337F3333333377333CC3333333333333F77FFFFFFF3FF33CCCCCCCCCC3
          993337777777777F77F33CCCCCCCCCC399333777777777737733333CC3333333
          333333377F33333333FF3333C333333330003333733333333777333333333333
          3000333333333333377733333333333333333333333333333333}
        NumGlyphs = 2
        OnClick = btnExcluirClick
      end
    end
    object Toolbar971: TToolbar97
      Left = 0
      Top = 0
      Caption = 'Navegador'
      DockPos = 0
      FullSize = True
      TabOrder = 1
      object btnIncluir: TSpeedButton
        Left = 192
        Top = 0
        Width = 94
        Height = 25
        Hint = 'Novo'
        Caption = 'F2 &Incluir'
        Flat = True
        Glyph.Data = {
          F6000000424DF600000000000000760000002800000010000000100000000100
          0400000000008000000000000000000000001000000000000000000000000000
          8000008000000080800080000000800080008080000080808000C0C0C0000000
          FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00888888888888
          888888888888888888888800000000000888880FFFFFFFFF0888880FFFFFFFFF
          0888880FFFFFFFFF0888880FFFFFFFFF0888880FFFFFFFFF0888880FFFFFFFFF
          0888880FFFFFFFFF0888880FFFFFFFFF0888880FFFFFF0000888880FFFFFF0F0
          8888880FFFFFF008888888000000008888888888888888888888}
        OnClick = btnIncluirClick
      end
      object btnAlterar: TSpeedButton
        Left = 286
        Top = 0
        Width = 94
        Height = 25
        Hint = 'Alterar'
        Caption = 'F3 &Alterar'
        Flat = True
        Glyph.Data = {
          76010000424D7601000000000000760000002800000020000000100000000100
          04000000000000010000120B0000120B00001000000000000000000000000000
          800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
          FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333333000000
          000033333377777777773333330FFFFFFFF03FF3FF7FF33F3FF700300000FF0F
          00F077F777773F737737E00BFBFB0FFFFFF07773333F7F3333F7E0BFBF000FFF
          F0F077F3337773F3F737E0FBFBFBF0F00FF077F3333FF7F77F37E0BFBF00000B
          0FF077F3337777737337E0FBFBFBFBF0FFF077F33FFFFFF73337E0BF0000000F
          FFF077FF777777733FF7000BFB00B0FF00F07773FF77373377373330000B0FFF
          FFF03337777373333FF7333330B0FFFF00003333373733FF777733330B0FF00F
          0FF03333737F37737F373330B00FFFFF0F033337F77F33337F733309030FFFFF
          00333377737FFFFF773333303300000003333337337777777333}
        NumGlyphs = 2
        OnClick = btnAlterarClick
      end
      object btnSalvar: TSpeedButton
        Left = 380
        Top = 0
        Width = 95
        Height = 25
        Hint = 'Salvar'
        Caption = 'F4 &Salvar'
        Flat = True
        Glyph.Data = {
          F6000000424DF600000000000000760000002800000010000000100000000100
          04000000000080000000CE0E0000C40E00001000000000000000000000000000
          8000008000000080800080000000800080008080000080808000C0C0C0000000
          FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00222222222222
          2222220000000000000220330000008803022033000000880302203300000088
          0302203300000000030220333333333333022033000000003302203088888888
          0302203088888888030220308888888803022030888888880302203088888888
          0002203088888888080220000000000000022222222222222222}
        OnClick = btnSalvarClick
      end
      object ToolbarSep972: TToolbarSep97
        Left = 184
        Top = 0
        SizeHorz = 8
      end
      object DBNavigator971: TDBNavigator97
        Left = 0
        Top = 0
        Width = 184
        Height = 25
        DataSource = dsGrade
        VisibleButtons = [nbFirst, nbPrior, nbNext, nbLast]
        DisplayMode = dmGlyphOnly
        ConfirmDelete = False
      end
    end
  end
  object paCabecalho: TPanel
    Left = 0
    Top = 0
    Width = 490
    Height = 25
    Align = alTop
    BevelOuter = bvLowered
    Caption = 'GRADE CURRICULAR'
    Color = clBlue
    Font.Charset = ANSI_CHARSET
    Font.Color = clWhite
    Font.Height = -16
    Font.Name = 'Arial'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 1
  end
  object pcGeral: TPageControl
    Left = 0
    Top = 34
    Width = 490
    Height = 232
    ActivePage = tsGrade
    Align = alClient
    TabOrder = 2
    object tsFolha: TTabSheet
      Caption = 'Folha'
    end
    object tsGrade: TTabSheet
      Caption = 'Grade'
      ParentShowHint = False
      ShowHint = False
    end
  end
  object dkTop: TDock97
    Left = 0
    Top = 25
    Width = 490
    Height = 9
  end
  object quGrade: TwwQuery
    AfterInsert = quGradeAfterInsert
    AfterPost = quGradeAfterPost
    OnNewRecord = quGradeNewRecord
    OnPostError = quGradePostError
    Connection = db
    
    
    SQL.Strings = (
      'Select * From GradeCurricular where '
      'Curso = :Curso and'
      'AnoSemestre = :AnoSemestre and'
      'Serie = :Serie'
      'Order By Curso,Disciplina,Serie')
    Params.Data = {
      0100030005437572736F00010200300000000B416E6F53656D65737472650003
      040000000000000005536572696500030400000000000000}
    ValidateWithMask = True
    OnFilterOptions = [ofoEnabled, ofoShowHourGlass, ofoCancelOnEscape]
    Left = 432
    Top = 80
    object quGradeAnoSemestre: TSmallintField
      DisplayLabel = 'Ano/Sem.'
      FieldName = 'AnoSemestre'
      Origin = 'GradeCurricular.AnoSemestre'
      DisplayFormat = '0000/0'
      EditFormat = '00000'
    end
    object quGradeCurso: TStringField
      FieldName = 'Curso'
      Origin = 'GradeCurricular.Curso'
      Size = 15
    end
    object quGradeDisciplina: TSmallintField
      FieldName = 'Disciplina'
      Origin = 'GradeCurricular.Disciplina'
    end
    object quGradeSerie: TSmallintField
      DisplayLabel = 'Série'
      FieldName = 'Serie'
      Origin = 'GradeCurricular.Serie'
    end
    object quGradeNumeroAulas: TFloatField
      DisplayLabel = 'Nr. Aulas'
      FieldName = 'NumeroAulas'
      Origin = 'GradeCurricular.NumeroAulas'
    end
    object quGradeValor: TFloatField
      FieldName = 'Valor'
      Origin = 'GradeCurricular.Curso'
    end
    object quGradeCodigoGrade: TIntegerField
      FieldName = 'CodigoGrade'
      Origin = 'GradeCurricular.Disciplina'
    end
  end
  object dsGrade: TwwDataSource
    AutoEdit = False
    DataSet = quGrade
    Left = 400
    Top = 80
  end
  object fdGeral: TwwFilterDialog
    DataSource = dsGradeGrid
    Options = [fdCaseSensitive, fdShowCaseSensitive, fdShowOKCancel, fdShowViewSummary, fdShowFieldOrder, fdShowValueRangeTab, fdShowNonMatching]
    SortBy = fdSortByFieldNo
    Caption = 'Filtro'
    FilterMethod = fdByFilter
    DefaultMatchType = fdMatchStart
    DefaultFilterBy = fdFilterByValue
    DefaultField = 'Codigo'
    FieldOperators.OrChar = 'or'
    FieldOperators.AndChar = 'and'
    FieldOperators.NullChar = 'null'
    FilterOptimization = fdUseAllIndexes
    Left = 364
    Top = 77
  end
  object dsDisciplinas: TwwDataSource
    AutoEdit = False
    DataSet = quDisciplinas
    Left = 400
    Top = 144
  end
  object quDisciplinas: TwwQuery
    Connection = db
    
    
    SQL.Strings = (
      'Select * From Disciplinas '
      'Order By Descricao')
    ValidateWithMask = True
    OnFilterOptions = [ofoEnabled, ofoShowHourGlass, ofoCancelOnEscape]
    Left = 432
    Top = 144
  end
  object dsSeries: TwwDataSource
    AutoEdit = False
    DataSet = quSeries
    Left = 400
    Top = 176
  end
  object quSeries: TwwQuery
    Connection = db
    
    
    SQL.Strings = (
      'Select * From Series '
      'Order By Descricao')
    ValidateWithMask = True
    OnFilterOptions = [ofoEnabled, ofoShowHourGlass, ofoCancelOnEscape]
    Left = 432
    Top = 176
    object quSeriesDescricao: TStringField
      DisplayLabel = 'Descrição'
      DisplayWidth = 50
      FieldName = 'Descricao'
      Origin = 'Series.Descricao'
      Size = 40
    end
    object quSeriesCodigo: TSmallintField
      DisplayLabel = 'Código'
      DisplayWidth = 10
      FieldName = 'Codigo'
      Origin = 'Series.Codigo'
    end
  end
  object dsCursos: TwwDataSource
    AutoEdit = False
    DataSet = quCursos
    Left = 400
    Top = 112
  end
  object quCursos: TwwQuery
    Connection = db
    
    
    SQL.Strings = (
      'Select * From Cursos'
      'Order By Descricao')
    ValidateWithMask = True
    OnFilterOptions = [ofoEnabled, ofoShowHourGlass, ofoCancelOnEscape]
    Left = 432
    Top = 112
  end
  object dsGradeGrid: TwwDataSource
    AutoEdit = False
    DataSet = quGradeGrid
    Left = 400
    Top = 224
  end
  object quGradeGrid: TwwQuery
    Connection = db
    
    SQL.Strings = (
      'Select G.*,C.Descricao as DescCurso,D.Descricao as DescDisci'
      'From GradeCurricular G,Cursos C,Disciplinas D'
      'Where C.Codigo = G.Curso and'
      'C.AnoSemestre = G.AnoSemestre And   '
      'D.Codigo = G.Disciplina and'
      'G.Curso = :Curso and'
      'G.AnoSemestre = :AnoSemestre and'
      'G.Serie = :Serie'
      'Order By C.Descricao,D.Descricao,Serie')
    Params.Data = {
      0100030005437572736F00010200300000000B416E6F53656D65737472650003
      040000000000000005536572696500030400000000000000}
    ValidateWithMask = True
    OnFilterOptions = [ofoEnabled, ofoShowHourGlass, ofoCancelOnEscape]
    Left = 432
    Top = 224
    object quGradeGridAnoSemestre: TSmallintField
      DisplayLabel = 'Ano/Sem.'
      DisplayWidth = 8
      FieldName = 'AnoSemestre'
      Origin = 'GradeCurricular.AnoSemestre'
      DisplayFormat = '0000/0'
    end
    object quGradeGridDescCurso: TStringField
      DisplayLabel = 'Curso'
      DisplayWidth = 28
      FieldName = 'DescCurso'
      Origin = 'Cursos.Descricao'
      Size = 50
    end
    object quGradeGridDescDisci: TStringField
      DisplayLabel = 'Disciplina'
      DisplayWidth = 28
      FieldName = 'DescDisci'
      Origin = 'Disciplinas.Descricao'
      Size = 50
    end
    object quGradeGridSerie: TSmallintField
      DisplayLabel = 'Série'
      DisplayWidth = 10
      FieldName = 'Serie'
      Origin = 'GradeCurricular.Serie'
    end
    object quGradeGridNumeroAulas: TFloatField
      DisplayLabel = 'Nr. Aulas'
      DisplayWidth = 10
      FieldName = 'NumeroAulas'
      Origin = 'GradeCurricular.NumeroAulas'
    end
    object quGradeGridCurso: TStringField
      DisplayLabel = 'Código do Curso'
      DisplayWidth = 5
      FieldName = 'Curso'
      Origin = 'GradeCurricular.Curso'
      Visible = False
      Size = 15
    end
    object quGradeGridDisciplina: TSmallintField
      DisplayLabel = 'Código da Disciplina'
      DisplayWidth = 10
      FieldName = 'Disciplina'
      Origin = 'GradeCurricular.Disciplina'
      Visible = False
    end
  end
  object qryMax: TUMZQuery
    Connection = db
    
    SQL.Strings = (
      'select Max(CodigoGrade) as MaxCodigoGrade from GradeCurricular')
    Left = 352
    Top = 224
    object qryMaxMaxCodigoGrade: TIntegerField
      FieldName = 'MaxCodigoGrade'
      Origin = 'GradeCurricular.CodigoGrade'
    end
  end
end

