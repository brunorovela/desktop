object frmSeries: TfrmSeries
  Left = 183
  Top = 147
  Width = 499
  Height = 330
  Caption = 'Séries/Fases'
  Font.Charset = ANSI_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Arial'
  Font.Style = []
  KeyPreview = True
  Position = poScreenCenter
  OnClose = FormClose
  OnCreate = FormCreate
  OnKeyDown = FormKeyDown
  PixelsPerInch = 96
  TextHeight = 14
  object paCabecalho: TPanel
    Left = 0
    Top = 0
    Width = 491
    Height = 25
    Align = alTop
    BevelOuter = bvLowered
    Caption = 'SÉRIES / FASES'
    Color = clBlue
    Font.Charset = ANSI_CHARSET
    Font.Color = clWhite
    Font.Height = -16
    Font.Name = 'Arial'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 0
  end
  object Dock971: TDock97
    Left = 0
    Top = 245
    Width = 491
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
      object Navigator: TDBNavigator
        Left = 0
        Top = 0
        Width = 184
        Height = 25
        DataSource = dsSeries
        VisibleButtons = [nbFirst, nbPrior, nbNext, nbLast]
        Flat = True
        Hints.Strings = (
          'Primeiro'
          'Anterior'
          'Próximo'
          'Último')
        TabOrder = 0
      end
    end
  end
  object dgGeral: TwwDBGrid
    Left = 0
    Top = 25
    Width = 491
    Height = 220
    Selected.Strings = (
      'Codigo'#9'7'#9'Código'
      'Descricao'#9'66'#9'Descrição')
    MemoAttributes = [mSizeable, mWordWrap, mViewOnly, mDisableDialog]
    TitleColor = clBtnFace
    FixedCols = 0
    ShowHorzScrollBar = True
    EditControlOptions = [ecoCheckboxSingleClick]
    Align = alClient
    DataSource = dsSeries
    Options = [dgEditing, dgAlwaysShowEditor, dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgAlwaysShowSelection, dgConfirmDelete, dgCancelOnExit, dgWordWrap]
    ReadOnly = True
    TabOrder = 2
    TitleAlignment = taLeftJustify
    TitleFont.Charset = ANSI_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'Arial'
    TitleFont.Style = []
    TitleLines = 1
    TitleButtons = False
    IndicatorColor = icBlack
  end
  object quSeries: TwwQuery
    OnNewRecord = quSeriesNewRecord
    Connection = db
    
    
    SQL.Strings = (
      'Select * from Series'
      'Order by Codigo')
    ValidateWithMask = True
    OnFilterOptions = [ofoEnabled, ofoShowHourGlass, ofoCancelOnEscape]
    Left = 408
    Top = 184
    object quSeriesCodigo: TSmallintField
      DisplayLabel = 'Código'
      DisplayWidth = 7
      FieldName = 'Codigo'
      Origin = 'Series.Codigo'
    end
    object quSeriesDescricao: TStringField
      DisplayLabel = 'Descrição'
      DisplayWidth = 66
      FieldName = 'Descricao'
      Origin = 'Series.Descricao'
      Size = 40
    end
  end
  object dsSeries: TwwDataSource
    DataSet = quSeries
    OnStateChange = dsSeriesStateChange
    Left = 376
    Top = 184
  end
  object qry: TUMZQuery
    Connection = db
    
    SQL.Strings = (
      'select Max(Codigo) as Maximo from Series')
    Left = 408
    Top = 216
    object qryMaximo: TIntegerField
      FieldName = 'Maximo'
      Origin = 'Series.Codigo'
    end
  end
end

