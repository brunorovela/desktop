object PrincipalForm: TPrincipalForm
  Left = 201
  Top = 131
  ClientHeight = 710
  ClientWidth = 780
  Color = clBtnFace
  Font.Charset = ANSI_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Arial'
  Font.Style = []
  FormStyle = fsMDIForm
  Menu = MenuFinanceiro
  OldCreateOrder = True
  Position = poDefault
  ShowHint = True
  WindowState = wsMaximized
  OnCloseQuery = FormCloseQuery
  OnCreate = FormCreate
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 14
  object sbUsuario: TSpeedButton
    Left = 45
    Top = 416
    Width = 160
    Height = 22
    Caption = 'Usu'#225'rio: JOSIMAR'
    Flat = True
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = []
    Glyph.Data = {
      36030000424D3603000000000000360000002800000010000000100000000100
      18000000000000030000120B0000120B00000000000000000000FFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFB3B4D12F61A6D1D1E2FFFFFFF5
      E9E9E9CFCFE4C4C4E4C3C3E8CECEF4E7E7FFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      D6D6E40E7BC30EE3FF466CA4BA6E67D97746E38648F19347F29448E4884AD879
      48C97261F1DFDFFFFFFFFFFFFFFFFFFFEAEAF11584C60BF0FF4493B8F39D5BFF
      CA78FEC57F8869B07A5C99FBC17EFFCA7DFFB96DCA6750FFFFFFFFFFFFFFFFFF
      D7D7E51282C80BE8FF4494BAF1AF7FFFD399F8CCA04141DF2424D6ECC3A0FFC8
      88FFC785E28151FFFFFFFFFFFFFFFFFFBDBED6039ADA0BE8FF4194BCEDB697FF
      E4BFFFE8C56C68DC5955DAFAE1BFE7D399FFD0A0E58C68FFFFFFFFFFFFFFFFFF
      D4D4E3048CD30BE6FF439AC3EBBFAFFFF5E4FFFFED7C77DE6961D5FFFCEBFFF5
      E8FBE0C8E48B73FFFFFFFFFFFFFFFFFF878BBA00B9F10DE9FF4288B1E69A8FFF
      EADAECD6BF515BB7414CB2EBC8A6FFE3D0F2AF9BF6D0C9FFFFFFFFFFFFF2F2F6
      2962B000E2FF10E2FF3490C5A87383B3837F6BA7CC5EADD54EA2CE458AB1A781
      7FF3C5BCFFFFFFFFFFFFFFFFFF5E6FAC009AEA00E6FF0FDBF641E6FC45A0D559
      85B993DEFF92D7FB8BD2F56EC1E9428EC0E8EDF4FFFFFFFFFFFFFFFFFF2A5EB1
      00C9FF00E7FF0FFDFE65FFFF87E7F8688FC2ADE6FFA8E0FF9DDBFE92D6F86CBB
      E498C0E5FFFFFFFFFFFFFFFFFF095EBD00C8FF00EBFF0EFFFF5FFFFF91F1FE6B
      8BBAD0EEFFCDEEFFB5E5FF9CDCFF84CCF19ABEE4FFFFFFFFFFFFFFFFFF175EB8
      00CCFF0DC0EE3795C555EDF97ADEF3738CBAFCFFFFEFFCFFCAEEFFADEAFF69AA
      DBDCE5F1FFFFFFFFFFFFFFFFFF546DAF00CAFF0D9FDA57639D3DD3F35FBBDF88
      91B59FB7D0CAE0EDAFD7EE7CAACFB4C4D8FFFFFFFFFFFFFFFFFFFFFFFF989CC3
      086CC00A7FC3086EB32688C04C6BA7FFFFFFEDF0F4B7C2D2B5C0D0E6EAEFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF}
    ParentFont = False
    Transparent = False
    OnClick = TrocarUsurio1Click
  end
  object sbDataHora: TSpeedButton
    Left = 320
    Top = 416
    Width = 110
    Height = 22
    Caption = 'dd/mm/yyyy'
    Flat = True
    Glyph.Data = {
      36030000424D3603000000000000360000002800000010000000100000000100
      18000000000000030000120B0000120B00000000000000000000709C8C0C573C
      0C573C0C573C0C573C0C573C0C573C0C573C0C573C0C573C0C573C0C573C0C57
      3C0C573C709C8CFFFFFF105B3FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF105B3FFFFFFF146043FFFFFF
      FFFFFFCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCFFFF
      FFFFFFFF146043FFFFFF196548FFFFFFFFFFFFCCCCCCFFFFFFCCCCCCFFFFFFCC
      CCCCFFFFFFCCCCCCFFFFFFCCCCCCFFFFFFFFFFFF196548FFFFFF1F6B4DFFFFFF
      FFFFFFCCCCCCCCCCCC647ACD647ACD647ACDCCCCCCCCCCCCCCCCCCCCCCCCFFFF
      FFFFFFFF1F6B4DFFFFFF257253FFFFFFFFFFFFCCCCCCFFFFFF647ACDFFFFFF64
      7ACDFFFFFFCCCCCCFFFFFFCCCCCCFFFFFFFFFFFF257253FFFFFF2B7858FFFFFF
      FFFFFFCCCCCCCCCCCC647ACD647ACD647ACDCCCCCCCCCCCCCCCCCCCCCCCCFFFF
      FFFFFFFF2B7858FFFFFF317F5EFFFFFFFFFFFFCCCCCCFFFFFFCCCCCCFFFFFFCC
      CCCCFFFFFFCCCCCCFFFFFFCCCCCCFFFFFFFFFFFF317F5EFFFFFF378664FFFFFF
      FFFFFFCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCFFFF
      FFFFFFFF378664FFFFFF3D8C69FFFFFFFFFFFFCCCCCCFFFFFFCCCCCCFFFFFFCC
      CCCCFFFFFFCCCCCCFFFFFFCCCCCCFFFFFFFFFFFF3D8C69FFFFFF43936FFFFFFF
      FFFFFFCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCFFFF
      FFFFFFFF43936FFFFFFF499974FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF499974FFFFFF4E9E7933815F
      33815F33815F33815F33815F33815F33815F33815F33815F33815F33815F3381
      5F33815F4E9E79FFFFFF52A37D56A78056A78056A78056A78056A78056A78056
      A78056A78056A78056A78056A78056A78056A78052A37DFFFFFF56A7809ACAB3
      9ACAB39ACAB39ACAB39ACAB39ACAB39ACAB39ACAB39ACAB39ACAB39ACAB39ACA
      B39ACAB356A780FFFFFF9DCDB659AA8359AA8359AA8359AA8359AA8359AA8359
      AA8359AA8359AA8359AA8359AA8359AA8359AA839DCDB6FFFFFF}
    Transparent = False
  end
  object toolFinanceiro: TToolBar
    Left = 0
    Top = 0
    Width = 780
    Height = 57
    AutoSize = True
    ButtonHeight = 53
    ButtonWidth = 78
    Caption = 'toolFinanceiro'
    Color = clBtnFace
    EdgeBorders = [ebTop, ebBottom]
    Images = ImageList2
    ParentColor = False
    ShowCaptions = True
    TabOrder = 0
    Transparent = True
    Wrapable = False
    object ToolButton19: TToolButton
      Left = 0
      Top = 0
      Width = 8
      Caption = 'ToolButton19'
      ImageIndex = 8
      Style = tbsSeparator
    end
    object btnFinanceiro: TToolButton
      Left = 8
      Top = 0
      Caption = 'Extra'
      ImageIndex = 6
    end
    object ToolButton2: TToolButton
      Left = 86
      Top = 0
      Width = 8
      Caption = 'ToolButton2'
      ImageIndex = 1
      Style = tbsSeparator
    end
    object btnFinanceiroCadastro: TToolButton
      Left = 94
      Top = 0
      Caption = 'Cadastros'
      DropdownMenu = popFinanceiroCadastros
      ImageIndex = 0
    end
    object ToolButton1: TToolButton
      Left = 172
      Top = 0
      Width = 8
      Caption = 'ToolButton1'
      ImageIndex = 8
      Style = tbsSeparator
    end
    object btnFinanceiroTesouraria: TToolButton
      Left = 180
      Top = 0
      Caption = 'Inscri'#231#245'es'
      ImageIndex = 3
      OnClick = btnFinanceiroTesourariaClick
    end
    object ToolButton4: TToolButton
      Left = 258
      Top = 0
      Width = 8
      Caption = 'ToolButton4'
      ImageIndex = 8
      Style = tbsSeparator
    end
    object btnFinanc: TToolButton
      Left = 266
      Top = 0
      Caption = 'Financeiro'
      DropdownMenu = pmFinanc
      ImageIndex = 2
    end
    object ToolButton5: TToolButton
      Left = 344
      Top = 0
      Width = 8
      Caption = 'ToolButton5'
      ImageIndex = 8
      Style = tbsSeparator
    end
    object ToolButton6: TToolButton
      Left = 352
      Top = 0
      Caption = 'Relat'#243'rios'
      ImageIndex = 4
      OnClick = ToolButton6Click
    end
    object ToolButton3: TToolButton
      Left = 430
      Top = 0
      Width = 8
      Caption = 'ToolButton3'
      ImageIndex = 1
      Style = tbsSeparator
    end
    object btnFinanceiroConfiguracoes: TToolButton
      Left = 438
      Top = 0
      Caption = 'Configura'#231#245'es'
      DropdownMenu = popConfiguracoes
      ImageIndex = 1
    end
    object ToolButton11: TToolButton
      Left = 516
      Top = 0
      Width = 8
      Caption = 'ToolButton11'
      ImageIndex = 8
      Style = tbsSeparator
    end
    object btnFinanceiroSair: TToolButton
      Left = 524
      Top = 0
      Caption = 'Sair'
      ImageIndex = 5
      OnClick = btnSairClick
    end
    object ToolButton18: TToolButton
      Left = 602
      Top = 0
      Width = 8
      Caption = 'ToolButton18'
      ImageIndex = 7
      Style = tbsSeparator
    end
  end
  object stbOpcoes: TStatusBar
    Left = 0
    Top = 688
    Width = 780
    Height = 22
    Panels = <
      item
        Style = psOwnerDraw
        Width = 180
      end
      item
        Width = 320
      end
      item
        Style = psOwnerDraw
        Width = 220
      end
      item
        Width = 10
      end>
    OnDrawPanel = stbOpcoesDrawPanel
  end
  object popConfiguracoes: TPopupMenu
    Left = 440
    Top = 56
    object TrocarUsurio1: TMenuItem
      Caption = 'Trocar Usu'#225'rio'
      OnClick = TrocarUsurio1Click
    end
  end
  object Report: TCrpe
    About = 'Version and Credits...'
    DesignControls = 'Design-Time Window Controls'
    Version.Crpe.Major = 0
    Version.Crpe.Minor = 0
    Version.Crpe.Release = 0
    Version.Crpe.Build = 0
    Version.Report.Major = 0
    Version.Report.Minor = 0
    Version.Report.Letter = #0
    Version.Windows.Platform = 'NT'
    Version.Windows.Major = 6
    Version.Windows.Minor = 2
    Version.Windows.Build = '9200'
    TempPath = 'C:\DOCUME~1\CLAUDI~1\CONFIG~1\Temp\'
    PrintDate.Day = 0
    PrintDate.Month = 0
    PrintDate.Year = 0
    Subreports.Number = 0
    Subreports.Item.Top = -1
    Subreports.Item.Left = -1
    Subreports.Item.Width = -1
    Subreports.Item.Height = -1
    Subreports.Item.Border.Left = lsNone
    Subreports.Item.Border.Right = lsNone
    Subreports.Item.Border.Top = lsNone
    Subreports.Item.Border.Bottom = lsNone
    Subreports.Item.Border.TightHorizontal = False
    Subreports.Item.Border.DropShadow = False
    Subreports.Item.Border.ForeColor = clNone
    Subreports.Item.Border.BackgroundColor = clNone
    Subreports.Item.NLinks = 0
    GroupSortFields.Number = -1
    Groups.Number = -1
    Groups.Item.CustomizeGroupName = False
    ParamFields.AllowDialog = True
    ParamFields.Item.Top = -1
    ParamFields.Item.Left = -1
    ParamFields.Item.Width = -1
    ParamFields.Item.Height = -1
    ParamFields.Item.Border.Left = lsNone
    ParamFields.Item.Border.Right = lsNone
    ParamFields.Item.Border.Top = lsNone
    ParamFields.Item.Border.Bottom = lsNone
    ParamFields.Item.Border.TightHorizontal = False
    ParamFields.Item.Border.DropShadow = False
    ParamFields.Item.Border.ForeColor = clNone
    ParamFields.Item.Border.BackgroundColor = clNone
    ParamFields.Item.Format.Alignment = haDefault
    ParamFields.Item.Format.SuppressIfDuplicated = False
    ParamFields.Item.Format.CanGrow = False
    ParamFields.Item.Format.MaxNLines = 0
    ParamFields.Item.Format.Field.Number.CurrencySymbol = '$'
    ParamFields.Item.Format.Field.Number.ThousandSymbol = ','
    ParamFields.Item.Format.Field.Number.DecimalSymbol = '.'
    ParamFields.Item.Format.Field.Number.ShowZeroValueAs = '0'
    ParamFields.Item.Format.Field.Date.FirstSeparator = '/'
    ParamFields.Item.Format.Field.Date.SecondSeparator = '/'
    ParamFields.Item.Format.Field.Time.AMString = 'AM'
    ParamFields.Item.Format.Field.Time.PMString = 'PM'
    ParamFields.Item.Format.Field.Time.HourMinSeparator = ':'
    ParamFields.Item.Format.Field.Time.MinSecSeparator = ':'
    ParamFields.Item.Format.Field.Paragraph.LineSpacing = 1.000000000000000000
    ParamFields.Item.Font.Charset = DEFAULT_CHARSET
    ParamFields.Item.Font.Color = clWindowText
    ParamFields.Item.Font.Height = -11
    ParamFields.Item.Font.Name = 'MS Sans Serif'
    ParamFields.Item.Font.Style = []
    ParamFields.Item.HiliteConditions.Item.FontColor = clNone
    ParamFields.Item.HiliteConditions.Item.Background = clNone
    ParamFields.Item.ParamType = pfNoValue
    ParamFields.Item.ParamSource = psReport
    ParamFields.Item.Info.AllowNull = True
    ParamFields.Item.Info.AllowEditing = True
    ParamFields.Item.Info.AllowMultipleValues = False
    ParamFields.Item.Info.ValueType = vtDiscrete
    ParamFields.Item.Info.PartOfGroup = False
    ParamFields.Item.Info.MutuallyExclusiveGroup = True
    ParamFields.Item.Info.GroupNum = -1
    ParamFields.Item.ValueLimit = False
    ParamFields.Item.Ranges.Item.Bounds = IncludeStartAndEnd
    ParamFields.Item.NeedsCurrentValue = False
    ParamFields.Item.IsLinked = False
    Formulas.Item.Top = -1
    Formulas.Item.Left = -1
    Formulas.Item.Width = -1
    Formulas.Item.Height = -1
    Formulas.Item.Border.Left = lsNone
    Formulas.Item.Border.Right = lsNone
    Formulas.Item.Border.Top = lsNone
    Formulas.Item.Border.Bottom = lsNone
    Formulas.Item.Border.TightHorizontal = False
    Formulas.Item.Border.DropShadow = False
    Formulas.Item.Border.ForeColor = clNone
    Formulas.Item.Border.BackgroundColor = clNone
    Formulas.Item.Format.Alignment = haDefault
    Formulas.Item.Format.SuppressIfDuplicated = False
    Formulas.Item.Format.CanGrow = False
    Formulas.Item.Format.MaxNLines = 0
    Formulas.Item.Format.Field.Number.CurrencySymbol = '$'
    Formulas.Item.Format.Field.Number.ThousandSymbol = ','
    Formulas.Item.Format.Field.Number.DecimalSymbol = '.'
    Formulas.Item.Format.Field.Number.ShowZeroValueAs = '0'
    Formulas.Item.Format.Field.Date.FirstSeparator = '/'
    Formulas.Item.Format.Field.Date.SecondSeparator = '/'
    Formulas.Item.Format.Field.Time.AMString = 'AM'
    Formulas.Item.Format.Field.Time.PMString = 'PM'
    Formulas.Item.Format.Field.Time.HourMinSeparator = ':'
    Formulas.Item.Format.Field.Time.MinSecSeparator = ':'
    Formulas.Item.Format.Field.Paragraph.LineSpacing = 1.000000000000000000
    Formulas.Item.Font.Charset = DEFAULT_CHARSET
    Formulas.Item.Font.Color = clWindowText
    Formulas.Item.Font.Height = -11
    Formulas.Item.Font.Name = 'MS Sans Serif'
    Formulas.Item.Font.Style = []
    Formulas.Item.HiliteConditions.Item.FontColor = clNone
    Formulas.Item.HiliteConditions.Item.Background = clNone
    AreaFormat.Item.NSections = 0
    SectionSize.Item.Height = -1
    SectionSize.Item.Width = -1
    SQLExpressions.Item.Top = -1
    SQLExpressions.Item.Left = -1
    SQLExpressions.Item.Width = -1
    SQLExpressions.Item.Height = -1
    SQLExpressions.Item.Border.Left = lsNone
    SQLExpressions.Item.Border.Right = lsNone
    SQLExpressions.Item.Border.Top = lsNone
    SQLExpressions.Item.Border.Bottom = lsNone
    SQLExpressions.Item.Border.TightHorizontal = False
    SQLExpressions.Item.Border.DropShadow = False
    SQLExpressions.Item.Border.ForeColor = clNone
    SQLExpressions.Item.Border.BackgroundColor = clNone
    SQLExpressions.Item.Format.Alignment = haDefault
    SQLExpressions.Item.Format.SuppressIfDuplicated = False
    SQLExpressions.Item.Format.CanGrow = False
    SQLExpressions.Item.Format.MaxNLines = 0
    SQLExpressions.Item.Format.Field.Number.CurrencySymbol = '$'
    SQLExpressions.Item.Format.Field.Number.ThousandSymbol = ','
    SQLExpressions.Item.Format.Field.Number.DecimalSymbol = '.'
    SQLExpressions.Item.Format.Field.Number.ShowZeroValueAs = '0'
    SQLExpressions.Item.Format.Field.Date.FirstSeparator = '/'
    SQLExpressions.Item.Format.Field.Date.SecondSeparator = '/'
    SQLExpressions.Item.Format.Field.Time.AMString = 'AM'
    SQLExpressions.Item.Format.Field.Time.PMString = 'PM'
    SQLExpressions.Item.Format.Field.Time.HourMinSeparator = ':'
    SQLExpressions.Item.Format.Field.Time.MinSecSeparator = ':'
    SQLExpressions.Item.Format.Field.Paragraph.LineSpacing = 1.000000000000000000
    SQLExpressions.Item.Font.Charset = DEFAULT_CHARSET
    SQLExpressions.Item.Font.Color = clWindowText
    SQLExpressions.Item.Font.Height = -11
    SQLExpressions.Item.Font.Name = 'MS Sans Serif'
    SQLExpressions.Item.Font.Style = []
    SQLExpressions.Item.HiliteConditions.Item.FontColor = clNone
    SQLExpressions.Item.HiliteConditions.Item.Background = clNone
    LogOnInfo.Item.Table = -1
    SessionInfo.Table = -1
    SessionInfo.Item.Propagate = True
    ExportOptions.Excel.Constant = 9.000000000000000000
    ExportOptions.Excel.Area = 'D'
    ExportOptions.Excel.WorksheetFunctions = False
    ExportOptions.Excel.FirstPage = 1
    ExportOptions.Excel.LastPage = 1
    ExportOptions.HTML.PageNavigator = True
    ExportOptions.HTML.SeparatePages = True
    ExportOptions.HTML.FirstPage = 1
    ExportOptions.HTML.LastPage = 1
    ExportOptions.RTF.FirstPage = 1
    ExportOptions.RTF.LastPage = 1
    ExportOptions.Word.FirstPage = 1
    ExportOptions.Word.LastPage = 1
    ExportOptions.PDF.FirstPage = 1
    ExportOptions.PDF.LastPage = 1
    ExportOptions.Text.StringDelimiter = '"'
    ExportOptions.Text.FieldSeparator = ','
    Printer.PreserveRptSettings = [prOrientation, prPaperSize]
    PrintOptions.StartPage = 1
    PrintOptions.StopPage = 65535
    Lines.Item.LineStyle = lsNone
    Lines.Item.Left = -1
    Lines.Item.Right = -1
    Lines.Item.Width = -1
    Lines.Item.Top = -1
    Lines.Item.Bottom = -1
    Lines.Item.Color = clNone
    Lines.Item.Extend = False
    Lines.Item.Suppress = False
    Boxes.Number = -1
    Pictures.Item.Top = -1
    Pictures.Item.Left = -1
    Pictures.Item.Width = -1
    Pictures.Item.Height = -1
    Pictures.Item.Border.Left = lsNone
    Pictures.Item.Border.Right = lsNone
    Pictures.Item.Border.Top = lsNone
    Pictures.Item.Border.Bottom = lsNone
    Pictures.Item.Border.TightHorizontal = False
    Pictures.Item.Border.DropShadow = False
    Pictures.Item.Border.ForeColor = clNone
    Pictures.Item.Border.BackgroundColor = clNone
    Pictures.Item.CropLeft = -1
    Pictures.Item.CropRight = -1
    Pictures.Item.CropTop = -1
    Pictures.Item.CropBottom = -1
    TextObjects.Item.Top = -1
    TextObjects.Item.Left = -1
    TextObjects.Item.Width = -1
    TextObjects.Item.Height = -1
    TextObjects.Item.Border.Left = lsNone
    TextObjects.Item.Border.Right = lsNone
    TextObjects.Item.Border.Top = lsNone
    TextObjects.Item.Border.Bottom = lsNone
    TextObjects.Item.Border.TightHorizontal = False
    TextObjects.Item.Border.DropShadow = False
    TextObjects.Item.Border.ForeColor = clNone
    TextObjects.Item.Border.BackgroundColor = clNone
    TextObjects.Item.Format.Alignment = haDefault
    TextObjects.Item.Format.SuppressIfDuplicated = False
    TextObjects.Item.Format.CanGrow = False
    TextObjects.Item.Format.MaxNLines = 0
    TextObjects.Item.Format.Paragraph.LineSpacing = 1.000000000000000000
    TextObjects.Item.Font.Charset = DEFAULT_CHARSET
    TextObjects.Item.Font.Color = clWindowText
    TextObjects.Item.Font.Height = -11
    TextObjects.Item.Font.Name = 'MS Sans Serif'
    TextObjects.Item.Font.Style = []
    TextObjects.Item.Paragraphs.Item.Alignment = haDefault
    TextObjects.Item.Paragraphs.Item.IndentFirstLine = 0
    TextObjects.Item.Paragraphs.Item.IndentLeft = 0
    TextObjects.Item.Paragraphs.Item.IndentRight = 0
    TextObjects.Item.Paragraphs.Item.TextStart = 0
    TextObjects.Item.Paragraphs.Item.TextEnd = 0
    TextObjects.Item.Paragraphs.Item.TabStops.Item.Alignment = haDefault
    TextObjects.Item.Paragraphs.Item.TabStops.Item.Offset = -1
    TextObjects.Item.EmbeddedFields.Item.FieldObjectType = oftNone
    TextObjects.Item.EmbeddedFields.Item.FieldType = fvUnknown
    TextObjects.Item.EmbeddedFields.Item.TextStart = 0
    TextObjects.Item.EmbeddedFields.Item.TextEnd = 0
    TextObjects.Item.EmbeddedFields.Item.Format.Alignment = haDefault
    TextObjects.Item.EmbeddedFields.Item.Format.SuppressIfDuplicated = False
    TextObjects.Item.EmbeddedFields.Item.Format.CanGrow = False
    TextObjects.Item.EmbeddedFields.Item.Format.MaxNLines = 0
    TextObjects.Item.EmbeddedFields.Item.Format.Field.Number.CurrencySymbol = '$'
    TextObjects.Item.EmbeddedFields.Item.Format.Field.Number.ThousandSymbol = ','
    TextObjects.Item.EmbeddedFields.Item.Format.Field.Number.DecimalSymbol = '.'
    TextObjects.Item.EmbeddedFields.Item.Format.Field.Number.ShowZeroValueAs = '0'
    TextObjects.Item.EmbeddedFields.Item.Format.Field.Date.FirstSeparator = '/'
    TextObjects.Item.EmbeddedFields.Item.Format.Field.Date.SecondSeparator = '/'
    TextObjects.Item.EmbeddedFields.Item.Format.Field.Time.AMString = 'AM'
    TextObjects.Item.EmbeddedFields.Item.Format.Field.Time.PMString = 'PM'
    TextObjects.Item.EmbeddedFields.Item.Format.Field.Time.HourMinSeparator = ':'
    TextObjects.Item.EmbeddedFields.Item.Format.Field.Time.MinSecSeparator = ':'
    TextObjects.Item.EmbeddedFields.Item.Format.Field.Paragraph.LineSpacing = 1.000000000000000000
    TextObjects.Item.EmbeddedFields.Item.Border.Left = lsNone
    TextObjects.Item.EmbeddedFields.Item.Border.Right = lsNone
    TextObjects.Item.EmbeddedFields.Item.Border.Top = lsNone
    TextObjects.Item.EmbeddedFields.Item.Border.Bottom = lsNone
    TextObjects.Item.EmbeddedFields.Item.Border.TightHorizontal = False
    TextObjects.Item.EmbeddedFields.Item.Border.DropShadow = False
    TextObjects.Item.EmbeddedFields.Item.Border.ForeColor = clNone
    TextObjects.Item.EmbeddedFields.Item.Border.BackgroundColor = clNone
    TextObjects.Item.TextSize = -1
    TextObjects.Item.TextHeight = -1
    OleObjects.Item.Top = -1
    OleObjects.Item.Left = -1
    OleObjects.Item.Width = -1
    OleObjects.Item.Height = -1
    OleObjects.Item.Border.Left = lsNone
    OleObjects.Item.Border.Right = lsNone
    OleObjects.Item.Border.Top = lsNone
    OleObjects.Item.Border.Bottom = lsNone
    OleObjects.Item.Border.TightHorizontal = False
    OleObjects.Item.Border.DropShadow = False
    OleObjects.Item.Border.ForeColor = clNone
    OleObjects.Item.Border.BackgroundColor = clNone
    CrossTabs.Item.Top = -1
    CrossTabs.Item.Left = -1
    CrossTabs.Item.Width = -1
    CrossTabs.Item.Height = -1
    CrossTabs.Item.Border.Left = lsNone
    CrossTabs.Item.Border.Right = lsNone
    CrossTabs.Item.Border.Top = lsNone
    CrossTabs.Item.Border.Bottom = lsNone
    CrossTabs.Item.Border.TightHorizontal = False
    CrossTabs.Item.Border.DropShadow = False
    CrossTabs.Item.Border.ForeColor = clNone
    CrossTabs.Item.Border.BackgroundColor = clNone
    Maps.Item.Top = -1
    Maps.Item.Left = -1
    Maps.Item.Width = -1
    Maps.Item.Height = -1
    Maps.Item.Border.Left = lsNone
    Maps.Item.Border.Right = lsNone
    Maps.Item.Border.Top = lsNone
    Maps.Item.Border.Bottom = lsNone
    Maps.Item.Border.TightHorizontal = False
    Maps.Item.Border.DropShadow = False
    Maps.Item.Border.ForeColor = clNone
    Maps.Item.Border.BackgroundColor = clNone
    OLAPCubes.Item.Top = -1
    OLAPCubes.Item.Left = -1
    OLAPCubes.Item.Width = -1
    OLAPCubes.Item.Height = -1
    OLAPCubes.Item.Border.Left = lsNone
    OLAPCubes.Item.Border.Right = lsNone
    OLAPCubes.Item.Border.Top = lsNone
    OLAPCubes.Item.Border.Bottom = lsNone
    OLAPCubes.Item.Border.TightHorizontal = False
    OLAPCubes.Item.Border.DropShadow = False
    OLAPCubes.Item.Border.ForeColor = clNone
    OLAPCubes.Item.Border.BackgroundColor = clNone
    DatabaseFields.Item.Top = -1
    DatabaseFields.Item.Left = -1
    DatabaseFields.Item.Width = -1
    DatabaseFields.Item.Height = -1
    DatabaseFields.Item.Border.Left = lsNone
    DatabaseFields.Item.Border.Right = lsNone
    DatabaseFields.Item.Border.Top = lsNone
    DatabaseFields.Item.Border.Bottom = lsNone
    DatabaseFields.Item.Border.TightHorizontal = False
    DatabaseFields.Item.Border.DropShadow = False
    DatabaseFields.Item.Border.ForeColor = clNone
    DatabaseFields.Item.Border.BackgroundColor = clNone
    DatabaseFields.Item.Format.Alignment = haDefault
    DatabaseFields.Item.Format.SuppressIfDuplicated = False
    DatabaseFields.Item.Format.CanGrow = False
    DatabaseFields.Item.Format.MaxNLines = 0
    DatabaseFields.Item.Format.Field.Number.CurrencySymbol = '$'
    DatabaseFields.Item.Format.Field.Number.ThousandSymbol = ','
    DatabaseFields.Item.Format.Field.Number.DecimalSymbol = '.'
    DatabaseFields.Item.Format.Field.Number.ShowZeroValueAs = '0'
    DatabaseFields.Item.Format.Field.Date.FirstSeparator = '/'
    DatabaseFields.Item.Format.Field.Date.SecondSeparator = '/'
    DatabaseFields.Item.Format.Field.Time.AMString = 'AM'
    DatabaseFields.Item.Format.Field.Time.PMString = 'PM'
    DatabaseFields.Item.Format.Field.Time.HourMinSeparator = ':'
    DatabaseFields.Item.Format.Field.Time.MinSecSeparator = ':'
    DatabaseFields.Item.Format.Field.Paragraph.LineSpacing = 1.000000000000000000
    DatabaseFields.Item.Font.Charset = DEFAULT_CHARSET
    DatabaseFields.Item.Font.Color = clWindowText
    DatabaseFields.Item.Font.Height = -11
    DatabaseFields.Item.Font.Name = 'MS Sans Serif'
    DatabaseFields.Item.Font.Style = []
    DatabaseFields.Item.HiliteConditions.Item.FontColor = clNone
    DatabaseFields.Item.HiliteConditions.Item.Background = clNone
    SummaryFields.Item.Top = -1
    SummaryFields.Item.Left = -1
    SummaryFields.Item.Width = -1
    SummaryFields.Item.Height = -1
    SummaryFields.Item.Border.Left = lsNone
    SummaryFields.Item.Border.Right = lsNone
    SummaryFields.Item.Border.Top = lsNone
    SummaryFields.Item.Border.Bottom = lsNone
    SummaryFields.Item.Border.TightHorizontal = False
    SummaryFields.Item.Border.DropShadow = False
    SummaryFields.Item.Border.ForeColor = clNone
    SummaryFields.Item.Border.BackgroundColor = clNone
    SummaryFields.Item.Format.Alignment = haDefault
    SummaryFields.Item.Format.SuppressIfDuplicated = False
    SummaryFields.Item.Format.CanGrow = False
    SummaryFields.Item.Format.MaxNLines = 0
    SummaryFields.Item.Format.Field.Number.CurrencySymbol = '$'
    SummaryFields.Item.Format.Field.Number.ThousandSymbol = ','
    SummaryFields.Item.Format.Field.Number.DecimalSymbol = '.'
    SummaryFields.Item.Format.Field.Number.ShowZeroValueAs = '0'
    SummaryFields.Item.Format.Field.Date.FirstSeparator = '/'
    SummaryFields.Item.Format.Field.Date.SecondSeparator = '/'
    SummaryFields.Item.Format.Field.Time.AMString = 'AM'
    SummaryFields.Item.Format.Field.Time.PMString = 'PM'
    SummaryFields.Item.Format.Field.Time.HourMinSeparator = ':'
    SummaryFields.Item.Format.Field.Time.MinSecSeparator = ':'
    SummaryFields.Item.Format.Field.Paragraph.LineSpacing = 1.000000000000000000
    SummaryFields.Item.Font.Charset = DEFAULT_CHARSET
    SummaryFields.Item.Font.Color = clWindowText
    SummaryFields.Item.Font.Height = -11
    SummaryFields.Item.Font.Name = 'MS Sans Serif'
    SummaryFields.Item.Font.Style = []
    SummaryFields.Item.HiliteConditions.Item.FontColor = clNone
    SummaryFields.Item.HiliteConditions.Item.Background = clNone
    SpecialFields.Number = -1
    SpecialFields.Item.Top = -1
    SpecialFields.Item.Left = -1
    SpecialFields.Item.Width = -1
    SpecialFields.Item.Height = -1
    SpecialFields.Item.Border.Left = lsNone
    SpecialFields.Item.Border.Right = lsNone
    SpecialFields.Item.Border.Top = lsNone
    SpecialFields.Item.Border.Bottom = lsNone
    SpecialFields.Item.Border.TightHorizontal = False
    SpecialFields.Item.Border.DropShadow = False
    SpecialFields.Item.Border.ForeColor = clNone
    SpecialFields.Item.Border.BackgroundColor = clNone
    SpecialFields.Item.Format.Alignment = haDefault
    SpecialFields.Item.Format.SuppressIfDuplicated = False
    SpecialFields.Item.Format.CanGrow = False
    SpecialFields.Item.Format.MaxNLines = 0
    SpecialFields.Item.Format.Field.Number.CurrencySymbol = '$'
    SpecialFields.Item.Format.Field.Number.ThousandSymbol = ','
    SpecialFields.Item.Format.Field.Number.DecimalSymbol = '.'
    SpecialFields.Item.Format.Field.Number.ShowZeroValueAs = '0'
    SpecialFields.Item.Format.Field.Date.FirstSeparator = '/'
    SpecialFields.Item.Format.Field.Date.SecondSeparator = '/'
    SpecialFields.Item.Format.Field.Time.AMString = 'AM'
    SpecialFields.Item.Format.Field.Time.PMString = 'PM'
    SpecialFields.Item.Format.Field.Time.HourMinSeparator = ':'
    SpecialFields.Item.Format.Field.Time.MinSecSeparator = ':'
    SpecialFields.Item.Format.Field.Paragraph.LineSpacing = 1.000000000000000000
    SpecialFields.Item.Font.Charset = DEFAULT_CHARSET
    SpecialFields.Item.Font.Color = clWindowText
    SpecialFields.Item.Font.Height = -11
    SpecialFields.Item.Font.Name = 'MS Sans Serif'
    SpecialFields.Item.Font.Style = []
    SpecialFields.Item.HiliteConditions.Item.FontColor = clNone
    SpecialFields.Item.HiliteConditions.Item.Background = clNone
    GroupNameFields.Number = -1
    GroupNameFields.Item.Top = -1
    GroupNameFields.Item.Left = -1
    GroupNameFields.Item.Width = -1
    GroupNameFields.Item.Height = -1
    GroupNameFields.Item.Border.Left = lsNone
    GroupNameFields.Item.Border.Right = lsNone
    GroupNameFields.Item.Border.Top = lsNone
    GroupNameFields.Item.Border.Bottom = lsNone
    GroupNameFields.Item.Border.TightHorizontal = False
    GroupNameFields.Item.Border.DropShadow = False
    GroupNameFields.Item.Border.ForeColor = clNone
    GroupNameFields.Item.Border.BackgroundColor = clNone
    GroupNameFields.Item.Format.Alignment = haDefault
    GroupNameFields.Item.Format.SuppressIfDuplicated = False
    GroupNameFields.Item.Format.CanGrow = False
    GroupNameFields.Item.Format.MaxNLines = 0
    GroupNameFields.Item.Format.Field.Number.CurrencySymbol = '$'
    GroupNameFields.Item.Format.Field.Number.ThousandSymbol = ','
    GroupNameFields.Item.Format.Field.Number.DecimalSymbol = '.'
    GroupNameFields.Item.Format.Field.Number.ShowZeroValueAs = '0'
    GroupNameFields.Item.Format.Field.Date.FirstSeparator = '/'
    GroupNameFields.Item.Format.Field.Date.SecondSeparator = '/'
    GroupNameFields.Item.Format.Field.Time.AMString = 'AM'
    GroupNameFields.Item.Format.Field.Time.PMString = 'PM'
    GroupNameFields.Item.Format.Field.Time.HourMinSeparator = ':'
    GroupNameFields.Item.Format.Field.Time.MinSecSeparator = ':'
    GroupNameFields.Item.Format.Field.Paragraph.LineSpacing = 1.000000000000000000
    GroupNameFields.Item.Font.Charset = DEFAULT_CHARSET
    GroupNameFields.Item.Font.Color = clWindowText
    GroupNameFields.Item.Font.Height = -11
    GroupNameFields.Item.Font.Name = 'MS Sans Serif'
    GroupNameFields.Item.Font.Style = []
    GroupNameFields.Item.HiliteConditions.Item.FontColor = clNone
    GroupNameFields.Item.HiliteConditions.Item.Background = clNone
    RunningTotals.Number = -1
    RunningTotals.Item.Top = -1
    RunningTotals.Item.Left = -1
    RunningTotals.Item.Width = -1
    RunningTotals.Item.Height = -1
    RunningTotals.Item.Border.Left = lsNone
    RunningTotals.Item.Border.Right = lsNone
    RunningTotals.Item.Border.Top = lsNone
    RunningTotals.Item.Border.Bottom = lsNone
    RunningTotals.Item.Border.TightHorizontal = False
    RunningTotals.Item.Border.DropShadow = False
    RunningTotals.Item.Border.ForeColor = clNone
    RunningTotals.Item.Border.BackgroundColor = clNone
    RunningTotals.Item.Format.Alignment = haDefault
    RunningTotals.Item.Format.SuppressIfDuplicated = False
    RunningTotals.Item.Format.CanGrow = False
    RunningTotals.Item.Format.MaxNLines = 0
    RunningTotals.Item.Format.Field.Number.CurrencySymbol = '$'
    RunningTotals.Item.Format.Field.Number.ThousandSymbol = ','
    RunningTotals.Item.Format.Field.Number.DecimalSymbol = '.'
    RunningTotals.Item.Format.Field.Number.ShowZeroValueAs = '0'
    RunningTotals.Item.Format.Field.Date.FirstSeparator = '/'
    RunningTotals.Item.Format.Field.Date.SecondSeparator = '/'
    RunningTotals.Item.Format.Field.Time.AMString = 'AM'
    RunningTotals.Item.Format.Field.Time.PMString = 'PM'
    RunningTotals.Item.Format.Field.Time.HourMinSeparator = ':'
    RunningTotals.Item.Format.Field.Time.MinSecSeparator = ':'
    RunningTotals.Item.Format.Field.Paragraph.LineSpacing = 1.000000000000000000
    RunningTotals.Item.Font.Charset = DEFAULT_CHARSET
    RunningTotals.Item.Font.Color = clWindowText
    RunningTotals.Item.Font.Height = -11
    RunningTotals.Item.Font.Name = 'MS Sans Serif'
    RunningTotals.Item.Font.Style = []
    RunningTotals.Item.HiliteConditions.Item.FontColor = clNone
    RunningTotals.Item.HiliteConditions.Item.Background = clNone
    WindowZoom.Preview = pwDefault
    WindowZoom.Magnification = -1
    WindowState = wsMaximized
    WindowButtonBar.CancelBtn = True
    WindowButtonBar.CloseBtn = True
    WindowButtonBar.PrintSetupBtn = True
    WindowCursor.GroupArea = wcDefault
    WindowCursor.GroupAreaField = wcMagnify
    WindowCursor.DetailArea = wcDefault
    WindowCursor.DetailAreaField = wcDefault
    WindowCursor.Graph = wcMagnify
    WindowCursor.OnDemandSubreport = wcMagnify
    WindowCursor.HyperLink = wcMagnify
    Graphs.Number = -1
    Graphs.Item.Top = -1
    Graphs.Item.Left = -1
    Graphs.Item.Width = -1
    Graphs.Item.Height = -1
    Graphs.Item.Border.Left = lsNone
    Graphs.Item.Border.Right = lsNone
    Graphs.Item.Border.Top = lsNone
    Graphs.Item.Border.Bottom = lsNone
    Graphs.Item.Border.TightHorizontal = False
    Graphs.Item.Border.DropShadow = False
    Graphs.Item.Border.ForeColor = clNone
    Graphs.Item.Border.BackgroundColor = clNone
    Graphs.Item.Style = unknownGraphType
    Graphs.Item.Text.TitleFont.Charset = DEFAULT_CHARSET
    Graphs.Item.Text.TitleFont.Color = clWindowText
    Graphs.Item.Text.TitleFont.Height = -11
    Graphs.Item.Text.TitleFont.Name = 'MS Sans Serif'
    Graphs.Item.Text.TitleFont.Style = []
    Graphs.Item.Text.SubTitleFont.Charset = DEFAULT_CHARSET
    Graphs.Item.Text.SubTitleFont.Color = clWindowText
    Graphs.Item.Text.SubTitleFont.Height = -11
    Graphs.Item.Text.SubTitleFont.Name = 'MS Sans Serif'
    Graphs.Item.Text.SubTitleFont.Style = []
    Graphs.Item.Text.FootNoteFont.Charset = DEFAULT_CHARSET
    Graphs.Item.Text.FootNoteFont.Color = clWindowText
    Graphs.Item.Text.FootNoteFont.Height = -11
    Graphs.Item.Text.FootNoteFont.Name = 'MS Sans Serif'
    Graphs.Item.Text.FootNoteFont.Style = []
    Graphs.Item.Text.GroupsTitleFont.Charset = DEFAULT_CHARSET
    Graphs.Item.Text.GroupsTitleFont.Color = clWindowText
    Graphs.Item.Text.GroupsTitleFont.Height = -11
    Graphs.Item.Text.GroupsTitleFont.Name = 'MS Sans Serif'
    Graphs.Item.Text.GroupsTitleFont.Style = []
    Graphs.Item.Text.DataTitleFont.Charset = DEFAULT_CHARSET
    Graphs.Item.Text.DataTitleFont.Color = clWindowText
    Graphs.Item.Text.DataTitleFont.Height = -11
    Graphs.Item.Text.DataTitleFont.Name = 'MS Sans Serif'
    Graphs.Item.Text.DataTitleFont.Style = []
    Graphs.Item.Text.LegendFont.Charset = DEFAULT_CHARSET
    Graphs.Item.Text.LegendFont.Color = clWindowText
    Graphs.Item.Text.LegendFont.Height = -11
    Graphs.Item.Text.LegendFont.Name = 'MS Sans Serif'
    Graphs.Item.Text.LegendFont.Style = []
    Graphs.Item.Text.GroupLabelsFont.Charset = DEFAULT_CHARSET
    Graphs.Item.Text.GroupLabelsFont.Color = clWindowText
    Graphs.Item.Text.GroupLabelsFont.Height = -11
    Graphs.Item.Text.GroupLabelsFont.Name = 'MS Sans Serif'
    Graphs.Item.Text.GroupLabelsFont.Style = []
    Graphs.Item.Text.DataLabelsFont.Charset = DEFAULT_CHARSET
    Graphs.Item.Text.DataLabelsFont.Color = clWindowText
    Graphs.Item.Text.DataLabelsFont.Height = -11
    Graphs.Item.Text.DataLabelsFont.Name = 'MS Sans Serif'
    Graphs.Item.Text.DataLabelsFont.Style = []
    Graphs.Item.Axis.GridLineX = gglNone
    Graphs.Item.Axis.GridLineY = gglMajor
    Graphs.Item.Axis.GridLineY2 = gglNone
    Graphs.Item.Axis.GridLineZ = gglNone
    Graphs.Item.Axis.DataValuesY = gdvAutomatic
    Graphs.Item.Axis.DataValuesY2 = gdvAutomatic
    Graphs.Item.Axis.DataValuesZ = gdvAutomatic
    Graphs.Item.Axis.MinY = -1.000000000000000000
    Graphs.Item.Axis.MaxY = -1.000000000000000000
    Graphs.Item.Axis.MinY2 = -1.000000000000000000
    Graphs.Item.Axis.MaxY2 = -1.000000000000000000
    Graphs.Item.Axis.MinZ = -1.000000000000000000
    Graphs.Item.Axis.MaxZ = -1.000000000000000000
    Graphs.Item.Axis.NumberFormatY = gnfNoDecimal
    Graphs.Item.Axis.NumberFormatY2 = gnfNoDecimal
    Graphs.Item.Axis.NumberFormatZ = gnfNoDecimal
    Graphs.Item.Axis.DivisionTypeY = gdvAutomatic
    Graphs.Item.Axis.DivisionTypeY2 = gdvAutomatic
    Graphs.Item.Axis.DivisionTypeZ = gdvAutomatic
    Graphs.Item.Axis.DivisionsY = -1
    Graphs.Item.Axis.DivisionsY2 = -1
    Graphs.Item.Axis.DivisionsZ = -1
    SummaryInfo.SavePreviewPicture = False
    Left = 72
    Top = 120
  end
  object ImageList2: TImageList
    BlendColor = clBlue
    AllocBy = 7
    Height = 32
    Width = 32
    Left = 40
    Top = 120
    Bitmap = {
      494C010107000800080020002000FFFFFFFFFF10FFFFFFFFFFFFFFFF424D3600
      0000000000003600000028000000800000004000000001002000000000000080
      000000000000000000000000000000000000000000000000000000000000B5E0
      FA0094D2F70088CEF60088CEF70087CEF70087CFF70087CFF70087CFF70087CF
      F70087CFF70088CEF70088CEF60088CDF60088CDF60088CCF60088CBF60088CB
      F60088C9F60088C9F50089C7F50089C6F50089C5F50089C4F4008AC2F4008AC1
      F40096C6F5000000000000000000000000000000000000000000000000000000
      000000000000000000008C8CC5002829980027299D0027299F002628A4002528
      A8002528AA002428AF002327B4002327B6002227BB002227BD002127C1002127
      C5002026C7002026CA002026CC002026CC002026CB002026C8002026C700282D
      C500000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000119DEE00109F
      EE0010A0EE0010A1EE0010A2EF000FA2EF000FA3EF000FA3EF000FA3EF000FA3
      EF000FA3EF0010A2EF0010A1EE0010A0EE00109FEE00119DEE00119CED00119A
      ED001297EC001296EC001293EC001291EB00138EEB00138CEA001489EA001586
      E9001584E9001680E8004A9AED00000000000000000000000000000000000000
      0000000000002A2A9200282993002829990027299D0026289F002628A5002528
      A9002528AB002428B0002327B5002327B7002227BC002127BF002127C3002026
      C7002026CA001F26CE001F26D0001F26D1001F26D0002026CC002026CA002127
      C600262CC300E4E5F80000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000010A0EE0010A1EE000FA3
      EF000FA5EF000FA6EF000FA7F0000EA7F0000EA8F0000EA8F0000EA8F0000EA8
      F0000EA7F0000FA7F0000FA6EF000FA5EF000FA3EF0010A1EE0010A1EE00109E
      EE00119CED00119BED001298ED001295EC001292EB001390EB00138DEA001489
      EA001487E9001584E9001680E800A6CDF6000000000000000000000000000000
      00000000000029299200282994002829990027299E002628A0002628A5002528
      AA002528AC002428B1002327B6002327B8002227BD002127C0002127C4002026
      C9002026CC001F26D0001D25D4001D25D7001E26D2001F26CE002026CC002026
      C7002127C2009497E10000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000010A1EE000FA4EF000FA6
      EF0011A7F0000EA8F0000EAAF0000EAAF0000EAAF0000EABF0000EABF0000EAB
      F00026B3F2000EAAF0000EA9F0000EA7F0000FA6EF000FA4EF000FA3EF0010A1
      EE00109EEE00119CED00119AED001297EC001293EC001292EB002E9BEE00148B
      EA001489EA001585E9001582E8003891EB000000000000000000000000000000
      00000000000031319600282994002829990027299E002628A0002628A5002528
      AA002528AC002428B1002327B6002327B8002227BD002127C0002127C4002026
      C9002026CC001F26D0001D25D4001D25D7001E26D2001F26CE002026CC002026
      C700353AC8000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000A4DCF9000FA6EF000EA8F0000EAA
      F00039BBF40037BCF40037BDF40037BDF40037BDF40037BEF40037BEF40037BE
      F400BBE9FC0037BDF40037BCF40037BBF40038B9F30038B8F30038B7F30039B5
      F2003AB3F3003AB2F1003AAFF1003BADF1003CAAF0003CA9F000C7E6FB003CA2
      EF003CA1EE001488E9001585E9001681E8000000000000000000000000000000
      00000000000000000000C0C0E0002829990027299D0026289F002628A5002528
      A9002528AB002428B0002327B5002327B7002227BC002127BF002127C3002026
      C7002026CA001F26CE001F26D0001F26D1001F26D0002026CC002026CA004A4F
      D100000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000086D4F8000EAAF0000DADF1000DAF
      F10023B7F3000DA9F1000CB3F2000CB4F2000CB4F2000CB5F2000CB5F2000CB5
      F200ABE6FB000CB3F2000CB2F2000DB1F2000DAFF1000DADF1000EABF0000EA9
      F00010A7F0000FA5EF0010A1EE00109EEE00119BED001199ED00BBE1FA001292
      EB001390EB00138CEA001488E9001583E8000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000086D5F8000DACF1000DAFF1000CAF
      F2001F5AE4001944E0000CB5F2000CB6F3000CB7F3000CB7F3000CB7F3000CB7
      F300ABE6FB000CB5F2000CB5F2000CB3F2000CB1F2000DAFF1000DAEF1000EAB
      F0000FA9F1000FA7F0000FA3EF0010A0EE00119CED00119BED00BBE2FA001293
      EC001291EB00138DEA001489EA001585E9000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000000000E3E3
      F200AAABD9004F51B00027299F002729A0002628A1002628A1002F31A6007476
      C400AAABDB000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000086D7F8000DB0F1000CAFF2001D25
      DA001D25DA001D25DA00184CE1000BB7F3000BBCF3000BBCF3000BBCF3000BBC
      F300ABE8FB000BBAF3000BBAF3000CB8F3000CB6F3000CB4F2000CB2F2000DAF
      F1000EADF2000EABF0000EA7F0000FA4EF0010A0EE00109EEE00BBE3FA001296
      EC001294EC001390EB00138CEA001488E9000000000000000000000000000000
      000000000000000000000000000000000000000000009091CD0027299E002729
      9F002729A0002628A1002628A2002628A3002628A4002628A4002628A4002628
      A5002628A5002628A6002F31AA009091D2000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000FDFCFD00DCD8EE007B76BC005E5FAF00535B
      AA005560B000515DB100535DB300545AAE005C5BAF00605BAC005F5AA6008D89
      C500E3E3FB000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000085D9F9000CB5F2001C27DB001D25
      DA001D25DA001D25DA001D25DA001D25DA000ABFF4000AC1F4000AC1F4000AC1
      F400ABEAFC000ABFF4000ABEF4000BBCF3000BBAF3000CB8F3000CB6F3000CB4
      F2000EB1F2000DAFF1000EABF0000EA7F0000FA3EF0010A1EE00BBE3FB001199
      ED001297EC001293EC00138EEB00148AEA000000000000000000000000000000
      00000000000000000000000000004547AA0027299E0027299E002729A0002628
      A1002628A2002628A4002628A4002628A5002628A6002628A6002528A7002528
      A8002528A8002528A9002528A9002528A9002528A900D5D5EF00000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000FBFFFF00FAFFFF00F8FFFF00F9FFFF00FEFFFF000000000000000000FAFF
      FF00FAFFFF00FCFFFF00F3F6FD009996C7003E349B00322C9F002C2D9F00272E
      9F00222DA2001F27A4002229A30022289C002B2C9B002B2993002D2B8F00312D
      84007D7BB300F3F3FB0000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000085DAF9000CB7F3001185EB001D25
      DA001D25DA001D25DA001D25DA001D25DA00165BE40009C4F50009C4F50009C4
      F500AAEBFC000AC1F4000AC1F4000ABFF4000BBCF3000BBAF3000CB9F3000CB5
      F2000DB3F3000DB0F1000DACF1000EA9F0000FA5EF000FA3EF00BBE4FB00119B
      ED001198ED001294EC001390EB00148CEA000000000000000000000000000000
      0000000000009091CC00282A9E00595A63002729A0002628A1002628A3002628
      A4002628A4002628A6002628A6002528A7002528A9002528A9002528AA002528
      AA002528AA002528AB002528AB002528AC002528AC002528AC002629AC00FEFE
      FF0000000000000000000000000000000000FAFFFD00F4FFF900E3F3EC00C2E9
      D900B2EAD500AAE9D200A9EBD300A8E9D000ADE8D100D0EBE000ADE6CF00A3E7
      CB00A3EACD00B5EFE500AAC7E800394199002624A8002525A9001C209D001B23
      9A0018209B00191CA2001B1E9F00191C93001D218E001D2188001C1F84002624
      830038358000ACADC500FCFCFC00000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000085DBF9000BBAF3000ABEF4001181
      EA001D25DA001D25DA001D25DA001D25DA001D25DA001468E60008C9F60008C9
      F600AAECFC0009C6F50009C5F50009C3F5000AC1F4000ABEF4000BBCF3000BB9
      F3000DB6F3000CB4F2000DB0F1000EACF1000EA8F0000FA6EF00BBE4FB00109D
      EE00119BED001297EC001292EB00138DEA000000000000000000000000000000
      00008586C7005153B100CCCCE8005C5D600052536C00292B9F002628A4002628
      A6002628A6002528A8002528A9002528AA002528AB002528AB002528AD002428
      AD002428AD002428AE0054566A00393B91002428AE002428AE002428AE002428
      AE0000000000000000000000000000000000D9FDEB00B6E4CE0096D1B70077C2
      A40067C1A0005BC09D005BC69F0057C39C005AC39C0062C59F0053BE950049B9
      8E0044B98D0058BAA400669FBA00233E920017219E002C35AB005B62C0006F74
      BE007678BF007B77CB007976C6007778BD007579B800757CBB00747ABF004F4E
      A2002D2784006A6D9400EFF1F200000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000085DDF9000ABEF4000AC2F40009C5
      F50020CCF6001D25DA001D25DA001D25DA001D25DA001D25DA00136DE7000E92
      ED006E99EF001278E8001373E8001465E500165AE300184CE1001847E0001A3C
      DE000CBAF4000CB7F3000CB3F2000DAFF1000EAAF0000EA8F000BBE5FB0010A0
      EE00109DEE001199ED001294EC00138FEB00000000000000000000000000CBCB
      E70027299D00282AA000FAFAFD00ACADAE005C5D60005C5D60002729A4002528
      A8002528A9002528AA002528AC002528AD002428AD002428AE002428AE002428
      AF002428AF003539B6005C5D60005C5D60004C4E77002428B0002428B0002428
      B000292DB100CACBEC000000000000000000C9F9E50082C1A4007DCAAB0072CD
      AC0069CFAC0061CFA9005ACDA50058CCA20053CC9F004FCC9D0049CB990040C6
      940038C48F0043B99D0040899F00133A84004859C200A8B4EB00D9E4FF00EDF3
      FF00F5F4FF00FAF2FF00F9F2FF00FAF8FF00F4F5FF00F3F8FF00F1F6FF00908F
      DB00241F80004F528400A3ABAE00FAFBFA000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000085DEF9000AC0F40009C4F50009C7
      F5001FCDF7001276E8001D25DA001D25DA001D25DA001D25DA001D25DA001D25
      DA001D25DA001D25DA001D25DA001D25DA001D25DA001D25DA001D25DA001D25
      DA001094EE000CB9F3000CB4F2000DB0F1000EABF0000EAAF000BBE6FB0010A1
      EE00109EEE00119AED001295EC001391EB0000000000000000008384C7002729
      9D0027299F002628A100CDCEEA00FFFFFF00909193005C5D60005C5D60002628
      A9002528AB002428AD002428AE002428AE002428AF002428B0002428B1002428
      B2002428B200B1B2CD00EAEAEA0078797B005C5D60005859650032369C002327
      B3002428B2002428B2000000000000000000CEFAEB0088C9AE007CCFB5007BD0
      B80082D1BB008AD5BD0092DBC20091DEBE0082E2BC0059CFA1004ECD9A0049CC
      99003DC6920048BDA8003A86A800163986009DA7E300F9FFFF00D3DFFD00A8AF
      EE009598E8009596E8009A9BE8009B9CE000989BDC00999EDE009699DF00605F
      BD002A2889005C6193008D969C00F0F1F0000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000084DFFA0009C3F50009C7F50008CA
      F6001FD2F80007CFF700136EE7001D25DA001D25DA001D25DA001D25DA001D25
      DA001D25DA001D25DA001D25DA001D25DA001D25DA001D25DA001D25DA001D25
      DA001D25DA00146EE7000CB7F3000CB2F2000DAEF1000EABF000BAE6FB000FA2
      EF0010A0EE00119CED001297EC001292EB0000000000FFFFFF0027299E002729
      9E002628A1002628A4009FA0D700FFFFFF00FFFFFF00F8F8F9005C5D60005C5D
      60004C4E75002428AE002428B0002428B1002428B2002428B2002327B3002327
      B4002327B500FFFFFF00FFFFFF00FFFFFF00AAABAC005C5D60005C5D60002327
      B5002327B5002327B4006D70CD0000000000D1FBEB0093D0B80088D1BC009EDD
      CF00C6F6EB00DCFDFA00DEFFF800D9FFF400AFF9DB0066D2A70054C99D0053CC
      9F0049CA9A004FC1AE003D8BAA0031569600B8C0EC00F6FBFF007F86B8003839
      AA002E2FBA002C30B6002F30AE003233A7003134A0003234A0003132A2002D2D
      9D00302E90006369960097A1A600EDEEEE000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000084E1FA0009C6F50008CAF60007CE
      F7001ED5F80006D3F80006D6F80006D6F9001D25DA001D25DA001D25DA001D25
      DA001D25DA001D25DA001D25DA001D25DA001D25DA001D25DA001D25DA001D25
      DA001D25DA001D25DA000BB9F3000CB5F2000DB0F1000DAEF100BAE7FB000FA5
      EF0010A2EF00109DEE001198ED001293EC00000000007374C00027299F002628
      A1002628A3002628A4007172C500FFFFFF00FFFFFF00FFFFFF00F8F8F8005C5D
      60005C5D6000505270002428B2002327B3002327B4002327B5002327B6003134
      A200C0C1C300FFFFFF00FFFFFF00FFFFFF00FFFFFF00DEDEDF006E6F71002327
      B9002327B8002327B7002327B60000000000D6FAEC009BCBB500AADCCB00E1FD
      F600F5FFFF00E4F6F000D3F1E600C5F2E000A2EACF006DD1AE005EC8A30055C3
      9E0047BF98004BBCA6003C8F9C0028558000BECBE900F8FBFF006F6EB5003129
      B5002921C5002924BC002924AF00312BAC002E2BA8002725A1002827A4002926
      9F002B288C006B719E00A8B2B400ECEDEC000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000084E1FA0008C8F60008CCF60007D0
      F7001DD7F90006D5F80006D8F90005D9F9001562E5001D25DA001D25DA001D25
      DA001D25DA001D25DA001D25DA001D25DA001D25DA001D25DA001D25DA001D25
      DA001D25DA001D25DA001280EA000CB5F2000DB1F2000DAFF100BAE7FB000FA5
      EF000FA2EF00109EEE001199ED001294EC000000000027299E002628A1002628
      A2002628A4002628A6004144B300FFFFFF00FFFFFF00FFFFFF00FFFFFF00FCFC
      FC00929395005C5D600054556C002A2DAB002327B7002327B8002428B700E8E8
      E800FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF008284B4002227
      BB002227B9002227B9002327B900B1B2E600D4FBED00A3D1BC00BFE5D600F7FF
      FE00FDFDFC00DDE3E000C7DAD200BFDCD000B1DECC009FDAC3009FDBC5009BD9
      C3008CDBC2007ACEC400488FA20039619200B9C2EB00F8FAFF00706FB2002A24
      A100251FAF002423A80020229C0024259800212595001D2394001E2397002223
      97002D2C9000747AA900B0BCBD00EEF0ED000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000084E2FA0008CAF60007CEF70006D3
      F8001DD9F90006D8F90005DCFA0005DEFA0004E1FB0004E2FB0004E2FB0004E1
      FB00A9F4FE0005DCFA0005DAF90006D7F90006D3F80007CAF700193FDF001D25
      DA001D25DA001D25DA001D25DA000CB7F3000CB2F2000DB0F100BAE7FB001098
      ED000FA4EF00109FEE00119AED001295EC00000000002729A0002628A2002628
      A4002628A5002528A8002528A900FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00A1A1A3005C5D60005C5D60003135A2002227B900A7A7A900FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00B2B4DB002227BE002227
      BD002227BC002227BC002227BB003D42C200CBFBEA00A8D6C300C5E7D900F8FF
      FC000000000000000000F8FFFF00FAFFFF00F7FFFF00F8FFFF00000000000000
      0000E9FFFF00B8ECEF004D88AE002B4E9800B5B9EA00FBFAFF00AFB0E0007377
      D000686FD0006972CC006671CA00656EC700616EC5006371C900626FCA004449
      AE00232086008287BB00B9C4CA00F0F2F1000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000084E3FA0008CBF60007CFF70006D4
      F8001DDAF90005DAF90004DEFA0004E0FA0004E2FB0003E4FB0003E4FB0003E3
      FB00A9F5FE0004DEFA0005DCFA0006D8F90006D4F80007CFF7000CA3F0001D25
      DA001D25DA001D25DA001D25DA00108FEC000CB3F2000DB0F100A6CEF7001853
      E2000FA5EF0010A0EE00119BED001296EC00D0D0EA002628A1002628A4002628
      A4002628A6002528A9002528AA008486D100FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00B1B1B3005D5E61005C5D60006C6D7000FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF002127C0002127C0002227
      BF002227BF002227BE002227BD002227BB00D4FBF100ABD5C400CAE7DC00FDFF
      FF00F3F7F300D5EBE500C7EDE400BDECE000BCEBDF00C0E9DA00CAE4D700DEEF
      E500E7FFF900BCEFF3004C8DB600123A92007275DE00E1E0FF00F4F9FF00E2ED
      FF00DFECFF00E1E8FF00E8EBFF00EBE8FF00E9EBFF00E7E9FF00E5E3FF008D89
      DB0018167D00777AB800BDC4D700F7F8F8000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000083E4FB0008CDF70007D2F80006D6
      F8001DDCFA0005DDFA0004E1FB0003E3FB0003E7FC0002E9FC0002E9FC0002E8
      FC00A8F6FE0004E1FB0004DFFA0005DBF90006D6F80007D2F80007CFF7001B32
      DD001D25DA001D25DA001D25DA001D25DA001183EA001B34DD001D25DA001756
      E3000FA5EF0010A0EE00119BED001296EC00A5A6D7002628A2002628A4002628
      A6002528A8002528AA002528AC002428AE00C2C3E900FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00BFBFC000FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF005358D1002127C3002127C3002127
      C2002127C2002127C1002227BF002227BE00DCFCF400B4D7CB00CAE9DD00F7FF
      FF00EFFAF400CAEDE200ADE2D400A5E1D1009DDBC900A2D8C600B2D9C900D3F1
      E300E0FFF900AEEBE8004896B30010419A002930BE005958CD00858AD9009BA8
      E000A1ADDE00A9ADE000ADA9E000AFA5E000AFABDB00B1ABDB00B2A7DE00766C
      C2002422890030337B008A8EB100FAFAFD000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000083E4FB0007CDF70006D2F80006D7
      F9001CDEFA0004DFFA0003E3FB0003E6FC0002EBFD0001EEFD0001EEFD0002EC
      FD00A8F8FE0003E3FB0004E1FB0005DCFA0006D7F90006D2F80007D0F70008CB
      F6001D25DA001D25DA001D25DA001D25DA001D25DA001D25DA001D25DA00165A
      E3000FA6EF0010A1EE00119CED001297EC009697D2002628A4002628A5002628
      A6002528A9002528AC002428AD002428AF002428B2003337B800FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00B6B8EC002026C6002026C5002026C5002127
      C4002127C3002127C3002127C2002127C000E3FBF700C0DDD700C3E8DD00D9F6
      EB00F0FFF900E5FEF300E6FEF500EBFEF500E8FEF100E7FEF000EDFEF300EEFF
      F500C9F9E3008FDAC70048A4A600124D9800222CC1002422C5002E2CC4003034
      BB003237B4003938B2003834B0003B38B0003335A000373AA2003B38AA00322D
      9D002D2B90002929760037386C00BCBBCC000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000083E4FB0007CEF70006D3F80006D8
      F9002FE1FB002BE4FB002AE9FC002AEBFD0029EFFE0028F3FF0028F3FF0029F1
      FE00B6FAFF002AE9FC002BE7FC002CE3FB002DDEFA002DDAFA002ED8F9002ED3
      F8001D2BDB001D25DA001D25DA001D25DA001D25DA001D25DA001D25DA002662
      E50034B4F20010A1EE00119CED001297EC00ADAEDC002628A4002628A6002528
      A8002528AA002428AD002428AE002428B0002428B2002327B3003E42BF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00474CCF002026C8002026C8002026C8002026C8002026
      C7002026C6002026C5002127C3002127C200E6FAF800C0DEDA00BCEAE000B7E4
      D500C8F0DF00D0F8E700CEF5E300D5F6E400D5F7E300D1F7E500CAF4DE00B8E9
      CF0091D7B8006CC4A50058B4A000306C970017289F002A28BF002620BF002B29
      C2002C28BB002822AD002C28AB002828A300242B9900242D9800272799002B28
      930028278400242372002D2B690083829E000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000083E4FB0007CEF70006D3F80006D8
      F9001CDEFA0004DFFA0003E4FB0003E7FC0002EBFD0000F0FE0000F0FE0001EE
      FD00A8F8FE0003E4FB0004E2FB0005DDFA0006D8F90006D3F80007D0F7000AB7
      F3001D25DA001D25DA001D25DA001D25DA001D25DA001D25DA001D25DA00165F
      E4000FA6EF0010A1EE00119CED001297EC00E8E9F6002628A4002528A7002528
      A9002528AB002428AD002428AE002428B1002327B3002327B5002327B700393E
      C100DDDDF500FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00BABBBC005C5D600055576C002026CB002026CB002026CB002026
      C9002026C8002026C7002026C5002127C300EDF9F900B6D4CF00B4EBDE00A6E4
      D100A7E3CE009EE1C70096DDC30090DBBF0083D4B80077D2B40075CDAD0074CA
      A7006BC9A5006DCAA50067B693002A5C610022366F00373A99003835A0003731
      A500443BAF00261B8700221E7C0020217300242D750022286F0024236C002C28
      7600282874002B2A72002C2765008786A1000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000083E4FB0007CDF70006D2F80006D7
      F9001CDDFA0005DEFA0004E2FB0003E5FB0002E9FC0002EBFD0002EBFD0002EB
      FD00A8F7FE0004E2FB0004E1FB0005DCFA0006D7F9000D9AEF001A39DE001D25
      DA001D25DA001D25DA001D25DA001D25DA001D25DA001D25DA001D25DA001563
      E5000FA5EF0010A0EE00119BED001297EC00000000002628A5002528A8002528
      A9002528AC002428AE002428AF002428B2002327B4002327B6002327B900282C
      B2007B7C8900FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FCFCFC005C5D60005C5D60005B5C61001F26CE001F26CE001F26
      CC002026CA002026C9002026C7006569D70000000000CCDBD800A4CEC100B4EB
      D700AFE8CF00A6E7CB009FE2C6009EE1C70093DCC20088DCBF0088D9BC0086D7
      B80078D2B00074C4A10057886D002B463B002F3B460054587D009694BE008C88
      BE00716BAA0030266D002C296C00262968001E286500272D6C002F2D6E002826
      64002A2A64002F2C6700363164009A99AD000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000083E4FB0008CDF70007D2F80006D6
      F8001DDCFA0005DDFA0004E1FB0003E3FB0003E7FC0002E9FC0002E9FC0002E8
      FC00A8F6FE0004E1FB0004DFFA0005DBF90006D6F8000BB0F300184BE1001D25
      DA001D25DA001D25DA001D25DA001D25DA001D25DA001D25DA001D25DA001565
      E5000FA5EF0010A0EE00119BED001296EC00000000002729A7002528A9002528
      AA002528AD002428AE002428AF002428B2002327B5002327B6002327B900D1D2
      D200FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00CDCECF005C5D60005C5D60002D32B6001F26
      CE001F26CC002026CB002026C800000000000000000000000000B7CAC100779A
      870060866D00628D72006B957C0059806B00537E6B00477B6800457663004578
      62003B7B6100376B5600374B410042483C003D3F310070737100FFFFFB000000
      0000F0F0F200A19EB9006C6B900063668D00616991005D628E00666191006A67
      8F006D6E8D006C6B8B00908DA600EBEBEF000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000084E3FA0008CBF60007CFF70006D4
      F8001DDAF90005DAF90004DEFA0004E0FA0004E2FB0003E4FB0003E4FB0003E3
      FB00A9F5FE0004DEFA0005DCFA0006D8F90006D4F80007CFF70007CDF70009C0
      F5001C28DB001D25DA001D25DA001D25DA001D25DA001D25DA001D25DA001568
      E6000FA5EF0010A0EE00119BED001296EC0000000000B4B5E1002528A9002528
      AA002428AD002428AF002428B0002327B3002327B6002327B70083858F00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00EFF0F0005C5D60003A3E9F001F26
      D0001F26CE001F26CD002026CA00000000000000000000000000FBFCFB00CED7
      CC00828F7A0052604A005E6D570037453500304134002C413700314035003440
      34002E4536002E4137003C424200454441004441390079797300F2F2F1000000
      00000000000000000000F4F3F500F0F0F300F2F3F500F1F1F400F1F0F400F3F3
      F500F4F4F600F6F6F70000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000084E2FA0008C9F60007CDF70007D2
      F8001DD7F90006D7F90005DAF90005DCFA0005DEFA0004DFFA0004DFFA0004DF
      FA00A9F4FE0005DAF90006D8F90006D5F80007D2F80007CDF70008CBF60009C6
      F5000BC3F5000AC0F4001A36DD001D25DA001D25DA001D25DA001D25DA00156B
      E6000FA3EF00109EEE001199ED001295EC0000000000000000002528A9002528
      AA002428AD002428AF002428B0002327B3002327B600272BB900FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00EDEDFA00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF005C5D6000474A87001F26
      D1001F26CE001F26CE00C4C5F200000000000000000000000000000000000000
      0000FAFAF800C3C2B200B4B3A0005251440040433A003B443C004A4642004E44
      3E0048453D004445410042414700423E43003F3B3800A0A19C00FCFEF900FAFF
      F800000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000084E1FA0008C8F60008CCF60007D0
      F7001DD7F90006D5F80006D8F90005D9F90005DCFA0005DDFA0005DDFA0005DC
      FA00A9F3FD0006D8F90006D7F90006D3F80007D0F70008CCF60008C9F60009C5
      F5000BC2F5000ABFF4000BB4F2001C29DB001D25DA001D25DA001D25DA00156D
      E6000FA2EF00109EEE001199ED001294EC000000000000000000D6D7EF00272A
      AB002428AD002428AF002428B1002327B3002327B6002A2DBA00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF007C7FDE002026C8003439D000FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF0067686B0054566F001F26
      D2001F26CF002128CF0000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000008CE2FA0009C5F50008C9F60008CD
      F7006CE3FB00A4EFFD00A3F0FD00A3F0FD00A3F1FD00A3F1FD00A3F1FD00A3F1
      FD00E0FAFF00A3F0FD00A3EFFD00A4EEFD00A4EDFD00A4ECFC00A4EBFC00A4E9
      FC00A5E8FC00A5E7FB00A6E5FB00A6E4FB007FACF1003141DF001D25DA006E91
      ED00A7DDF900119CED001297EC001293EC000000000000000000000000000000
      00002428AD002428AF002428B0002327B3002327B6002327B7002227B900F3F4
      FC00FFFFFF00FFFFFF00FFFFFF00DCDDF4002026C7002026C8002026CB002027
      CF008C90E600FFFFFF00FFFFFF00FFFFFF00FFFFFF008A8B8D005C5D60001F26
      D1007378E1000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000D6F4FE000AC2F40009C5F50008C9
      F6001FCFF70007CDF70007CFF70007D0F70006D2F80006D3F80006D3F80006D2
      F800AAF0FD0007CFF70007CEF70008CCF60008C9F60009C5F50009C4F5000AC0
      F4000CBDF4000BBAF3000CB5F2000CB1F2000DADF1000EABF000AAD1F8001572
      E70010A0EE00119BED001296EC001291EB000000000000000000000000000000
      0000000000002428AF002428B0002327B3002327B6002327B7002227B9002227
      BC003136C300FFFFFF007074D9002127C4002026C6002026C7002026CA001F26
      CD001F26CE004D53DA00FFFFFF00FFFFFF00FFFFFF00ADADAF005C5D60003C42
      D600000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000AC0F40009C4F50009C7
      F50008C8F60008CBF60007CDF70007CEF70007CFF70007D0F70007D0F70007D0
      F70009D0F80007CDF70008CCF60008C9F60009C7F50009C4F5000AC2F4000ABE
      F4000BBAF3000CB9F3000CB4F2000DB0F1000EABF0000EAAF00011A6F000109E
      EE00109EEE00119AED001295EC0036A2EE000000000000000000000000000000
      00000000000000000000787BCE002428B2002327B5002327B6002327B9002227
      BB002227BD002227BF002127C2002127C3002026C5002026C7002026C8002026
      CB001F26CC001F26CE00282FD100B8BAF100FFFFFF00BFC1F100656892000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000004DCEF7000AC0F40009C3
      F50009C4F50009C6F50008C9F60008C9F60008CAF60008CBF60008CBF60008CB
      F60008CAF60008C9F60008C8F60009C5F50009C3F5000AC0F4000ABEF4000BBA
      F3000CB7F3000CB5F2000CB1F2000DADF1000EA9F0000FA7F0000FA3EF00109E
      EE00119CED001297EC001293EC00000000000000000000000000000000000000
      0000000000000000000000000000D9D9F2002327B4002327B6002327B9002227
      BB002227BC002227BE002127C1002127C2002127C4002026C5002026C7002026
      C9002026CA001F26CC001F26CE001F26CE009DA0EA0000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000080DCF9000ABF
      F4000AC0F4000AC2F40009C4F50009C4F50009C6F50009C6F50009C6F50009C6
      F50009C5F50009C4F50009C3F5000AC1F4000ABFF4000BBCF3000BBAF3000CB7
      F3000CB4F2000CB2F2000DAEF1000EAAF0000FA6EF000FA5EF0010A0EE00119C
      ED00119AED001C9BED0000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000000000006164CC002227
      B9002227BB002227BD002227BF002127C1002127C3002127C3002026C5002026
      C7002026C8002228CA00BABCEF00000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000000000E4CC
      BE00CDA38B00CBA08C00CA9F8C00C89D8D00C69B8E00C59A8E00C4988F00C196
      8F00C0959000BE939000BC909100BB8F9200B98D9200B88C9300B78B9300B78A
      9300B78A9300B78A9300B98D9600C6A2A9000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000009DD2F700A3D4F800BBDFFA000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000000000DBC0
      B900CBA49A00C59B8E00C69B8E00C69C8E00C79C8D00C79C8D00C79C8D00C79C
      8D00C79C8D00C69C8D00C69C8E00C69B8E00C59A8E00C59A8E00C4998E00C498
      8F00C3978F00C2978F00C1958F00C0949000BE939000BE929100BC919100BB8F
      9100C19A9D0000000000000000000000000000000000CEA07B00A14F1500A14F
      16009D4A17009B48180098451900933F1A00913C1C008E391C0089341E008731
      1F00852F2000812B22007D2622007B23230077202500751D2500711827006F16
      28006F1628006F1628006F1628006F1628006F162800DAC3C800000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000087CEF700119CED00119A
      ED001199ED001197ED001295EC001293EC001291EB00138DEB00359BED000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000C0FDFF0074F9FF0074F9FF0057ECFC0043E2FA0028D5F7001FCF
      F60022D0F60035D7F8005AEAFC0071F7FF008FF0FD0000000000000000000000
      00000000000000000000000000000000000000000000000000008C381D008E3A
      1C008F3A1C00903C1C00913D1C00923E1C00923E1B00933F1B00933F1B00933F
      1B00923E1B00923E1B00923E1C00913C1C00903B1C008E3A1C008D391C008B37
      1D008A351E0089341F0087312000842E2000812B2100802A21007D2623007B23
      24007A222400761E2500924E56000000000000000000A9581300A7551400A352
      1500A14F16009D4A18009B48180097441A00933F1B00913C1C008D391D008934
      1F0089341F00852F2000812B22007F2822007B23240077202500751D26007118
      2800711828006F1628006F1628006F1628006F1628006F162800856F81000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000024AAF0000FA0EE00109FEE00109E
      EE00119DEE00119AED001198ED001297ED001293EC001391EB00138EEB0044A2
      EF00000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000000000000000000099FB
      FF0074F9FF0055EEFD0013D3F70014D3F70014D2F70015D1F60017D0F60017CD
      F50018CDF50018CDF50019CCF5001ACBF5001AC8F4005CECFC006DEFFD000000
      000000000000000000000000000000000000000000008E3A1C00913C1C00923E
      1B00933F1B0094401A0095421A0096431A009643190097441900974419009744
      1900964319009643190096431A0095411A0094401B00923E1B00923E1C00903B
      1C008D391C008C381D008A351E0088321F00852F2000842E2000812B21007E27
      22007C2523007A222400761E2500C9A8AC00DDB99400AC5C1200A9581300A857
      1300A2511500A04E16009E4C17009B48180096431A0094401A00913C1C008C38
      1D008A351E0088331F00832D2000812B22007E2722007C25230077202500741C
      2600721A2700701728006F1628006F1628006F1628006F1628006F16280000C3
      F800A9EBFD000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000005FC6F5000EA8EF000EA7EF000EA7EF000FA5EF000FA3
      EF000FA2EE000FA0EE00109DEE00119CED001198ED001295EC001293EC00138F
      EB00178DEB00A3D1F70000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000079F9FF0056F1
      FE0015DEFA0010DBF90010D8F80011D8F80012D6F70013D5F70014D3F70014D2
      F70015D2F70016D0F60017CEF50018CDF50018CDF50019CCF50019CBF50063EE
      FD0000000000000000000000000000000000FFFFFF00913C1C00933F1B009440
      1A0095411A009643190097441900984519009845180099461800994618009946
      1800994618009845180098451900A3603D0096431A0094401A00933F1B00923E
      1C00903B1C008E3A1C008C371D0089341E0087311F0086302000822C20007F29
      22007E2722007B24240077202400883D4500DAB28800AF5F1000AA591200A958
      1300A5531400A14F1600A04E16009C4918009946180096421A00923D1B008F3A
      1C008C371D0089341F0086302000832D2000802922007E27220079212400761E
      2500741C2600732634006F1628006F1628006F1628006F1628006F16280000C3
      F8000EC7F9000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000EABF0000EABF0000EAAF0000EAAF0000EA9EF000EA7
      EF000FA5EF000FA3EF000FA0EE00109EEE00119BED001197ED001296EC001291
      EB00148DEB00178DEB0000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000082FAFF004BF1FE000AE3
      FB000BE2FA000DE0FA000DDDF9000EDDF9000FDBF90010DAF80011D8F800C8FC
      FF00BDFAFF0013D3F70014D2F70015D2F70016D0F60017CEF50017CDF50018CD
      F5005DEAFC0062CDEF000000000000000000D6B6A80094411A00964319009845
      1800994618009B4818009C4918009C4918009D4A17009E4B17009E4B17009E4B
      17009D4B17009D4A17009C491800D7D8D8009B4A1C00937B6F00974419009542
      1A00933F1B00923E1B00903B1C008D391D008A351E0089341F0086302000822C
      2000812B21007E2723007B23240077202500DAB28600B3631000AE5E1100AB5A
      1200A9581300A4521400A14F15009F4D16009B4818009B48180095411A00913C
      1B00913C1C008B361D0089341F0087311F00822C2100812B22007D2622008761
      63008C8E900085878900775B62006F182A006F1628006F1628006F16280000C3
      F80000C3F80000C3F700EAF9F300000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000A4E1FA000DAEF1000DAEF1000DADF1000DADF1000EABF0000EAA
      F0000EA9EF000FA6EF000FA3EF000FA1EE00109EEE001199ED001198ED001293
      EC001390EB00148DEB00DDEEFC00000000000000000000000000000000000000
      0000000000000000000000000000000000009EFBFF0074F9FF000AE7FD0009E4
      FB000AE3FB000BE3FB000CE0FA000DE0FA000DDDF9000EDCF90010DBF900C8FC
      FF00BDFAFF0012D6F70013D4F70014D3F70014D2F70016D1F60016D0F60017CE
      F5001BCFF6005EE5F9000000000000000000CBA18C00984519009B4818009C49
      18009D4B17009F4D1700A04E1600A04E1600A14F1500A2501500A2501500A250
      1500A1501500A14F1500B0795300D5D6D6009F5220009091930089746A009946
      18009744190096431A00933F1B00913C1C008D391C008C371D0089341E008630
      2000842E2000802A21007D2623007A222400DCB48600B4650F00B2621000B060
      1000AA591200A8571300A6541400A14F16009E4C17009C4918009A4718009440
      1A00923E1B00903B1C008A351E0089341F0086302000842E2000998483009698
      9A009597990086797B00838587007D7F81006F1D2E006F1628006F16280000C3
      F80000C3F80000C3F80025C28400DEF6ED000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000CB4F2000CB4F2000CB4F2000CB3F2000CB2F2000DB1F1000DB0
      F1000DAEF1000EABF0000EA9EF000EA6EF000FA3EF00109EEE00119DEE001198
      ED001293EC001291EB00148CEA00000000000000000000000000000000000000
      00000000000000000000000000000000000074F9FF0026F1FE0006EBFD0006E9
      FC0007E8FC0009E6FC0009E4FB000AE4FB0027E7FC0061EEFD00A9F8FF00C8FC
      FF00C8FCFF0097F4FE0054E6FB0017DAF90012D6F70013D4F70013D3F70014D2
      F70015D1F60016D0F6004CC3EB0000000000CBA18C009A4718009C4918009E4C
      17009F4D1600A14F1600A2501500A2511500A3521400A4531400A4531400A453
      1400A4521400A5581C00CDC4BE00D4D5D500A155220090919300818285009B48
      1800994618009744190095411A00923E1B008F3A1C008D391C008A351E008731
      1F0086302000822C21007E2822007B242400DDB58500B8690D00B4640F00B363
      1000AF5F1000AA591200A9581300A5531400A14F1600A04E16009C4918009946
      180096421A00923D1B008F3A1C008C371D0090483600ADA2A100ACAEAF009885
      8400802E2A0079212400836A6D00858789007B7D80006F2534006F16280000C3
      F80000C3F80000C3F80025C2840025C284000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000CB7F3000CB7F3000CB7F3000CB7F3000CB6F3000CB4F2000DB2
      F2000DB1F1000DAEF1000EABF0000EAAF0000FA5EF000FA1EE00109FEE00119A
      ED001296EC001293EC00138EEB00000000000000000000000000000000000000
      00000000000000000000000000007CFAFF0018F2FF0003EFFE0004EEFE0004EE
      FE0004EDFD0006EBFD0032EEFD00CCFCFF00D3FCFF00CFFCFF00C8FCFF00C8FC
      FF00C8FCFF00C8FCFF00C8FCFF00C8FCFF0074EDFD0010D9F80010D8F80012D7
      F70013D5F70013D3F7003EDBF80000000000CDA38B009E4B1700A04E1600A250
      1500A3521400A5531400A7551400A7561400A8571300A9581300A9581300A958
      1300A8571300CCCACA00D2D3D300D3D4D400A55D25008F909200818284008259
      3E009D4A18009B4818009845180095421A00923E1B00913C1C008D391C008A35
      1E0088331F00852F2000812B21007D262300DEB78500B96B0D00B5660E00B364
      0F00B1611000AB5B1200A9581200A7561300A1501500A14F16009D4B17009B48
      180098451900933F1A00913C1C008E3A1C00BAB4B300B7B8B900AFB0B100822F
      26007F2922007B24230077212600806064007F818300746F73006F29380000C3
      F80000C3F80000C3F80025C2840025C284000000000000000000000000000000
      00000000000000000000000000000000000064BCF4004BB0F200209BEE0046AA
      F00017A1EF000BB4F3000ABDF4000ABDF40043798C0043798C0044798C004478
      8C0044788C0044778C0044768B0044758B0045748B0045728B0045728B004570
      8A001199ED001197ED001292EB0071BAF3000000000000000000000000000000
      00000000000000000000A1FBFF0074F9FF0000F4FF0000F3FF0002F2FF0002F0
      FE0003EFFE0004EEFE00ECFEFF00EAFEFF00E2FEFF00E0FEFF00D6FDFF00D3FC
      FF00C8FCFF00B9FBFF00C8FCFF00C8FCFF00C8FCFF0023E2FA000DDDF9000FDC
      F90010DAF80010D8F80012D7F70087D5F100CFA58B00A14F1500A4521400A655
      1400A7561400A9581300AA5A1200AB5B1200AC5C1100AD5D1100AD5D1100AD5D
      1100B7977800CCCDCD00D3D4D400D1D2D200A9642A008E8F9100808183006465
      67009F4E16009E4C17009C4918009845180095411A00933F1B00903C1C008C38
      1D008B361E0087311F00832D20007F292200E0B98400BD6E0B00B96B0D00B768
      0D00B3630F00B1611000AD5D1100A9581200A7551300A3521400A14F16009D4A
      17009B48180097441900AC786100CCCDCC00C4C5C600C3C4C50089341F00852F
      2000812B21007F2822007B232300772024007D4F54007D7F8100797B7E0025A6
      CA0000C3F80000C3F80025C2840025C284000000000000000000000000000000
      00000000000000000000A7DBF900129DEE00119AED001199ED001197ED001295
      EC001293EC001291EB000EA6F0008DDFFA00F5F5F500F5F5F500F5F5F500F5F5
      F500F5F5F500F5F5F500F5F5F500F5F5F500F5F5F500F5F5F500F5F5F500B8B8
      B900119BED001198ED001293EC002999ED000000000000000000000000000000
      00000000000074F9FF0071F9FF0056F6FE0001F0FD0001F0FD0001F3FE0000F3
      FE0000F3FF006CF8FF00F9FFFF00F7FFFF00F0FEFF00EFFEFF0004EEFE00E2FE
      FF00D3FDFF0006E9FC00D3FCFF00CFFCFF00C8FCFF00A0F7FF000AE3FB000CE1
      FA000DDFF9000DDDF9000FDCF90012AEE400D0A68A00A3521500A6541400A857
      1300A9581300AB5A1200AC5C1100AD5D1100AE5E1000AF5F1000AF5F1000AF5F
      1000BFC0C000CDCDCE00D3D4D400D0D1D200AA662A008E8F91007F8083006364
      670079574000A04E16009D4A17009A4718009643190095411A00923E1C008E39
      1C008C371D0088331F00852F2000802A2100E1BA8400C0720A00BC6D0C00B96B
      0D00B6670E00B3631000B2621000AC5C1200A9581300A8571300A2511500A04E
      16009E4C1700BE9B8600DDDEDE00D9DADA00A2664F00903B1C008A351E008833
      1F0086302000812B22007E2722007C25230077202500793E4500818082007678
      7B003698B40000C3F80025C2840025C284000000000000000000000000000000
      000076CCF6000FA4EF000FA3EF000FA2EE000FA1EE0010A0EE00109DEE00119A
      ED001198ED001296EC001292EB001291EB0048A6EF00E9F4FE00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00BDBE
      BF00109EEE00119CED001297ED001291EB000000000000000000000000000000
      0000BCFDFF0055F6FF0026F0FE002AEDFC0003E9FA0002EAFA0002EDFB0001EF
      FC0001F0FD0001F3FE0000F3FE0000F4FF0005F3FF0021F3FF0003F0FE00F0FE
      FF00E1FDFF0024F1FF00E2FEFF00E0FEFF00DBFDFF00C1FBFF0008E6FC0009E5
      FB000AE3FB000AE3FB000CE1FA000EB9E900D1A88900A7551400A9581300AB5B
      1200AD5D1100AF5F1000B1611000B2621000B3630F00B4640F00B36B2000AFA6
      9E00BFC0C000CDCDCE00D3D4D400B0601000AE5E11009C7552007E7F82006364
      66005C5D60005D5D5F00A04E16009D4A1700994618009744190094401A00903C
      1C008E3A1C008A351E0087311F00832D2000E4BD8300C2740A00C0720A00BE6F
      0B00B96B0D00B6670E00B4640F00B2621000AC5B1200AA591200A8561300A250
      1500A14F1600CFD0D000D5D1CE00A35C360094401A00923D1B008F3A1C008A35
      1E0089341F0086302000812B2200802922007C24230077202500761E25007387
      8E007476790062777F0025C2840025C284000000000000000000000000000000
      00000EA8EF000EA7EF000EA7EF000FA5EF000FA3EF000FA2EE000FA0EE00109D
      EE00119CED001198ED001295EC001293EC00138FEB002E9AEE00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00BDBE
      BF000FA0EE00109DEE001198ED001292EB000000000000000000000000000000
      00007AFAFF0014EFFE002EF2FE001FEAFA0003E6F90003E6F90003E9FA0002EC
      FA0001EDFB0001F0FD0001F2FD0001F3FE0000F3FE0000F3FF0002F2FF00F7FF
      FF00EBFFFF00E6FEFF00EAFEFF00E8FEFF00E2FEFF00A7F9FF0006E9FC0008E7
      FC0009E5FB0009E4FB000AE3FB000DBFEB00D3AA8900A9581300AC5C1100AF5F
      1000B1611000B3630F00B5660E00B6670E00B7680D00B8690D00B76D1800B0A8
      A000C0C1C100CDCECE00D4D5D500BB814300B26210008E8B89007D7E81006263
      65005C5D6000635C5800A35215009F4D16009C4918009A47180096431900933F
      1B00913C1C008C381D0089341F00852F2000E4BE8300C4770900C1730A00BF71
      0A00BA6C0C00B7690D00B5660E00B3631000AE5E1100AB5B1200A9581300A453
      1400A1501500CFD0D000CCC1B9009B48180095421A00933F1A00913C1C008B37
      1D0089341E0087321F00822C2100812B22007D26220078212400772025002CAF
      D3007A7C7F006B7A810025C2840025C2840000000000000000000000000041BD
      F4000EABF0000EAAF0000EAAF0000EA9EF00189EDD00377FA300377EA300377D
      A300387CA300119BED001197ED001296EC001291EB001390EB00D8ECFC00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00BDBE
      BF000FA1EE00109FEE001198ED001293EC000000000000000000000000000000
      000074F9FF0002F2FF002AF4FF0017E4F80004E2F70004E2F70004E5F80003E5
      F80003E6F90003E9FA0002ECFA0002EDFB0041F3FD0091F8FF00F1FEFF00F9FE
      FF00FBFEFF00FDFFFF00F7FFFF00F5FFFF00F0FEFF000CEFFF0004EEFE0005EC
      FD0006EAFC0006E9FC0008E7FC000CC5EE00D4AB8900AB5A1200AE5E1100B161
      1000B3631000B5660E00B7680E00B7690D00B96B0D00BA6B0C00BA6C0C00B781
      3F00C0C1C100CECECF00D4D5D500CCCDCE00ABA196008C8D8F007D7E81006263
      65005C5D60008E592E00A4531400A04E16009D4A17009B48180097441900933F
      1B00923E1C008D391C0089341E0086302000E5BF8200C97C0700C3760900C173
      0A00BF710A00B96B0C00B96B0D00B5660E00B3631000B1611000AB5A1200A958
      1300A7551300C6C7C800C8BCB4009D4A17009B48180097441900933F1A00913C
      1C008D391C0089341E0087311F00852F2000812B22007D2622007B23230028B3
      D900828486007582880025C2840025C2840000000000000000000DB1F1000DB1
      F1000DB1F1000DB0F1000DB0F1000DAFF100FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF000FA0EE00119CED00119AED001296EC001293EC00138FEB00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00BDBE
      BF000FA4EF000FA1EE00119CED001296EC0000000000000000000000000076F9
      FF0031F5FE0000F5FF000FF5FF0026E2F70006DBF50005DBF50005DEF60004E1
      F60004E2F70004E5F8002AEAFA00CFFCFF00DDFDFF00DFFDFF00E4FDFF00EBFD
      FF00EDFDFF00F1FEFF00F9FEFF00FAFEFF001FF4FF0002F1FE0002F0FE0003EF
      FE0004EEFE0004EEFE0005ECFD000CBEEA00D5AC8800AE5E1100B2621000B465
      0F00B6670E00B86A0D00BB6C0C00BC6D0C00BE700C00BE700B00BF710B00BF71
      0B00C0C1C100CECECF00D4D5D500CBCCCC00A8A9AA008B8C8E007C7D80006162
      6400935C2900AA5A1200A7561400A35215009F4D16009D4B1700994618009542
      1A00933F1B00903B1C008B361D0087311F00E7C18200CB7F0700C87B0800C679
      0800C1730A00BE700B00BC6D0C00B86A0D00B4650F00B3631000B0601000AA59
      1200A9581300BEBFC000C2B7AF00A04E16009C4918009B48180096431A00923E
      1B00913C1C008C381D0089341F0088331F00842E2000802A22007E27220029B6
      DD0087898B007F8A8E0025C2840025C2840000000000000000000CB4F2000CB4
      F2000CB4F2000CB3F2000CB2F2000DB1F100FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF000FA3EF00109EEE00119DEE001198ED001296EC001291EB00B0D9
      F800FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00BDBE
      BF000FA5EF000FA2EE00119DEE001197ED00000000000000000074F9FF006FF9
      FF0002EBFB0002EEFC0001EEFC004AEFFC0007D5F20006D5F20006D8F30006DA
      F40005DBF50005DEF600CEFCFF00CFFCFF00D6FCFF00D8FCFF00DBFDFF00DDFD
      FF00DDFDFF0047F2FC0001EEFC0001F0FD0001F2FD0000F3FE0000F3FE0001F3
      FF0002F1FE0002F0FE0003EFFE001CB0E400D6AE8800B1611000B4650F00B768
      0D00B96B0D00BC6E0C00BF710B00C0720B00C1740A00C2750900C3760900C376
      0900C2945400CECFCF00D5D6D600C9CACB00A7A8A9008A8B8D007B7C7F006061
      6400AF5F1000AD5D1100A9581300A6541400A14F15009F4D16009B4818009744
      190095411A00913D1C008C381D0088331F00E9C38100CD820500CB7F0700C97D
      0700C4770900C1730A00BF710A00BA6C0C00B7690D00B5660E00B3631000AE5E
      1100AB5B1200BABBBC00BCB0A800A15015009F4D16009D4B17009B4818009542
      1A00933F1A00913C1C008B371D0089341E0087321F00822C2100812B220028B8
      DF00939596008790940025C2840025C28400000000000FBBF4000BBAF3000BBA
      F3000BBAF3000BBAF3000BB9F3000CB7F300FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF000EA8EF000FA3EF000FA1EE00119CED001199ED001295EC001391
      EB0027BBF40036D4F80037CFF70038CEF70038C9F70039C4F60039C2F50028B7
      F3000EA8EF000FA4EF00109EEE004CB2F20000000000B0FCFF0040F4FF0072F9
      FF0003E6F90003E9FA0002E9FA0073F9FF0008D2F10007D2F10007D5F20007D5
      F20006D5F20006D8F300C8FCFF00C8FCFF00C9FCFF00CBFCFF0019E5F800D6FC
      FF00CBFBFF0003E5F80003E7F90003E9FA0002ECFA0001EEFC0001EFFC0001F1
      FD0000F3FE0000F3FE0001F3FF00A5E0F500D7AE8800B2621000B5660E00B96B
      0D00BB6C0C00BE700B00C0730A00C1740A00C3760900C5780800C5780800C578
      0800C4822200CECFCF00D5D6D600C8C9CA00A7A8A9008A8B8D007B7C7F006061
      6300B0601000AE5E1100AA591200A6551400A2501500A04E16009C4918009744
      190096431A00923E1C008D391C0089341E00E9C38100D0840400CB7F0600CB7F
      0700C77A0800C1730A00C1730A00BD6E0B00B96B0D00B7680D00B3630F00B161
      1000AE5E1100B5B6B700B8ACA300A4521400A14F16009F4D16009B4818009845
      190095411A00913C1B008E391C008B361D0089341F00852F2000822C210028B9
      E100959799008D95970025C2840025C28400000000000ABCF4000ABDF4000ABD
      F4000ABDF4000ABCF4000ABCF4000BBAF300FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF000EAAF0000FA5EF000FA3EF00109EEE00119CED001197ED001292
      EB000FA0EF0008CBF70009C6F50009C3F5000ABDF4000CB7F3000CB4F2000DAF
      F1000EA9EF000FA5EF00109FEE0095D1F700000000007AFAFF000BF0FF0072F9
      FF0003E3F80003E6F90003E6F90050F4FE0008D0F00008D0F00008D2F10007D4
      F10007D5F20007D5F200C8FCFF00C8FCFF00C8FCFF00C8FCFF0005DEF600CFFC
      FF00C4FBFF0031EAF9009EF7FE007CF3FD0039EEFB0002EBFA0002ECFA0001EE
      FC0001F0FD0001F2FD0001EFFD0000000000D8AF8700B4640F00B8690D00BC6D
      0C00BE700C00C1730A00C3760900C5780800C87B0800C97D0700CA7D0700CA7D
      0700C97C0800CFCFD000D5D6D600C7C8C800A6A7A800898A8C007A7B7E006F61
      5300B2621000B0601000AC5C1200A8571300A3521400A15015009D4B17009946
      180097441900933F1B008E3A1C008A351E00F1D6A500D3870400CE830500CC80
      0600CA7E0700C6790800C2750A00C0720A00BC6D0C00B96B0D00B6670E00B363
      1000B2621000AFB0B100B5A9A000A8571300A2511500A14F16009E4C17009B48
      18009A47180094401A00913C1C00903B1C008A351E0088331F00833325002ABD
      E500999B9D0093999C0025C2840025C28400000000000AC3F50009C3F50009C4
      F5000BC1F1000BC0F1000CC0F1000CBDF000FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF000FACED0010A8EC0010A5EB0011A0EA00129DEA001199EC001295
      EC001292EB0007CEF70009C9F60009C5F5000ABFF4000BB9F3000CB6F3000DB0
      F1000EAAF0000EA7EF000FA0EE00000000000000000074F9FF0001F3FF0065F9
      FF0005DDF50005E0F60004E0F60004E3F80032DFF60008CAEE0008CDEF0008CF
      EF0008D0F00008D2F100C8FCFF00C8FCFF00C8FCFF00C8FCFF00AEF8FE00C8FC
      FF00C1FBFF00C9FCFF00CFFCFF00D1FCFF00D6FCFF0003E5F80003E5F80003E7
      F90002EAFA0002ECFA0015B4E60000000000D8B08700B5660E00B86A0D00BD6E
      0C00BF710B00C2750900C5780800C77A0800CA7D0700CB7F0600CC800600CC80
      0600CB7F0700CFD0D000D6D7D700C6C7C700A5A6A70088898B00797A7D007D63
      4500B3630F00B1611000AC5C1100A9581300A4531400A25015009E4B17009A47
      180097441900933F1B008F3A1C008A351E0000000000D68B0200D3870400D185
      0400CC800600CA7D0700C87B0800C2740A00C0720A00BE6F0B00B96B0D00B667
      0E00B4640F00ABACAD00B0A59A00AA591200A8561300A5531400A14F16009E4B
      17009C4918009946180094401A00923D1B008F3A1C008738230019A9D0002ABF
      E700A4A6A7009C9FA20025C2840025C284000000000009C5F50009C6F50023CD
      F7007D7E80007D7E80007D7E80007D7E8000FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF007D7E80007D7E80007D7E80007D7E80007D7E80002D84B8001297
      ED001293EC0007CFF70008C9F60009C6F5000AC0F4000BBAF3000CB7F3000DB0
      F1000EAAF0000EA7EF001AA6EF00000000000000000046F5FE0001F1FD0041F6
      FF0006D8F30006DAF40005DAF40005DDF50033EAFA0047E4F8000AC7ED0009C9
      ED0008CAEE0008CDEF0014D2F100A6F5FD00C8FCFF00C8FCFF00C8FCFF00C8FC
      FF00C8FCFF00C8FCFF00C8FCFF00C8FCFF003EE6F80004E0F60004E1F60004E3
      F70003E5F80005D9F4000000000000000000D9B08700B6670E00BB6C0C00BF71
      0B00C1730A00C4770800C97C0800CA7E0700CD810500CF840400D0850400D085
      0400CE830500CFD0D000D6D7D700C4C5C600A5A6A70088898B00797A7D008C65
      3600B4650F00B2621000AE5E1100AA591300A6541400A35214009F4D16009B48
      18009845180094401A00903B1C008B361D0000000000FDF9F000D58A0200D387
      0300D0840400CB7F0600CB7F0700C77A0800C1730A00C1730A00BD6E0B00B96B
      0D00B7680D00A1A2A400ADA29600AE5E1100A9581200A9581300A4521400A14F
      16009F4D16009B4818009845190095411A008745290000C3F80000C3F80029C0
      E900AEAFB000A9ABAC0025C2840025C2840096E9FC0008CAF60007CCF70088E7
      FC00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF002C86B9001198
      ED001297ED0007D0F70008CAF60009C7F5000AC1F4000BBAF3000CB7F3000DB1
      F1000EABF0000EA8EF00FFFFFF0000000000C5FDFF001CEDFC0002EBFB0009EC
      FC0020DFF60007D5F20006D5F20006D8F30006D9F30008DBF5001ECBEE000AC3
      EA000AC4EB000AC7ED0009C9ED0009CAEE0021D3F10062E4F700ACF6FD00C8FC
      FF00C8FCFF008DF0FB0039E0F60007D5F20006D7F20006D9F40006DAF40005DC
      F5000FB6E700B3E5F6000000000000000000D9B18700B7680D00BC6D0C00C072
      0A00C2750900C77A0800CB7F0700CC800600D0850400D4890400D58A0300D489
      0300D2870400CE830500CC800600C97C0800C4770800C0720A00BE700B00B96B
      0C00B5660E00B3640F00AF5F1000AA5A1200A6551400A45214009F4D16009B48
      18009946180094411A00903C1C008C371D0000000000000000008FCCC0007EA1
      6600A8933500A38F3600A28D3700A08B38009B8639009A833A0098823A00937D
      3C00937D3D009E9FA100A4A19A008D753F00886F4100876E4100856B41008067
      4300806744007D6345007B6146006C6859000FB6E20000C3F80000C3F8002AC1
      EB00AFB0B100ADAEAF0025C2840025C284008BE7FC0007CEF70007D0F70088E9
      FC00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF002C87B900119A
      ED001197ED0007D0F70008CAF60009C7F5000AC1F4000BBAF3000CB7F3000DB1
      F1000EABF00041BBF3000000000000000000BCFDFF0009E5F90003E6F90003E6
      F90066F6FE0008D2F10007D2F10007D5F20007D5F20006D5F20040E4F80028C9
      ED000BBEE9000BC1EA000AC3EA000AC4EB000AC6EC0009C7ED0009CAEE007DEA
      F90075E8F90008CFEF0008D1F00008D2F10007D4F10007D5F20007D5F2000DB1
      E50000000000000000000000000000000000DAB18700B8690D00BC6E0C00C073
      0A00C2750900C77A0800CB7F0600CD810500D2860400D58A0300D78C0200D68C
      0200629A8C0032A1C30032A0C300319DC4003297C2003290C200328CC1003383
      C00078706300B4640F00AF5F1000AB5A1200A7551400A4531400A04E16009C49
      18009946180095411A00913C1C008C371D00000000000000000000000000B0ED
      FD0000C3F80000C3F80000C3F80000C3F80000C3F80000C3F80000C3F80000C3
      F80000C3F80097989A0087A6AF0000C3F80000C3F80000C3F80000C3F80000C3
      F80000C3F80000C3F80000C3F80000C3F80000C3F80000C3F80000C3F8002AC4
      EE00B7B8B900B0B1B20025C2840025C28400A2EDFC0007D1F70006D3F80088EA
      FC00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF002C87B900119C
      ED001198ED0007D0F70008CAF60009C7F5000AC1F4000BBAF3000CB7F3000DB1
      F10052C3F500F1FAFF000000000000000000BFFDFF000BE2F70004E3F80003E3
      F80063F6FE0008CFF00008CFF00008D2F10007D4F10007D5F20023DBF400A0F6
      FE003ED2F0000CBDE9000BC0E9000BC1EA000AC3EA000AC4EB000AC7ED0009C9
      ED0009CAEE0008CCEE0008CEEF0008D0F00008D1F00007D2F1000AC1EA001AB3
      E60000000000000000000000000000000000DAB18700B8690D00BD6E0C00C173
      0A00C3760900C87B0800CC800600CE820500D3870400D78C0200DD9300003DA8
      B9000CB4F2000CB5F2000CB5F2000DB2F2000DABF0000FA2EE00109DED001292
      EB001486E900157FE800AF5F1000AB5A1200A7551400A4531400A04E16009C49
      18009946180095411A00913C1C008C371D000000000000000000000000000000
      0000EEFBFF0009C3D90005C3E60005C3E80005C3E80005C3E80005C3E80005C3
      E80005C3E80092939500819FA60005C3E80005C3E80005C3E80005C3E80005C3
      E80005C3E80005C3E80005C3E80005C3E80005C3E80005C3E80008C3DE003FC3
      A400C3C4C500BCBDBE0025C2840025C28400D5F8FE0006D6F90005D9F90087EE
      FD00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF002C89B900109E
      EE00119AED0007CFF70008C9F60009C6F5000AC0F4000BBAF3000CB7F300BEEA
      FC0000000000000000000000000000000000DFFEFF001BE1F70005DDF50005DD
      F50005E0F6002BDAF50009CAEE0009CCEE0008CEEF0008CFF00008D2F100C8FC
      FF00C8FCFF00B7F8FF0016BAE8000DBBE8000CBCE8000BBEE9000BC1EA000AC3
      EA000AC4EB000AC6EC0009C8ED0009C9EE000CB4E60003E1F70004E0F7000000
      000000000000000000000000000000000000DAB18700B8690D00BC6E0C00C073
      0A00C2750900C77A0800CB7F0600CD810500D2860400D58A03008F9B57000BBB
      F30009C2F40009C4F50009C4F5000ABFF3000CB7F2000DADF0000EA7EF00119B
      EC00138DEB001487E900AF5F1000AB5A1200A7551400A4531400A04E16009C49
      18009946180095411A00913C1C008C371D000000000000000000000000000000
      00000000000083DDB90025C2840025C2840025C2840025C2840025C2840025C2
      840025C284008A8B8D00839C940025C2840025C2840025C2840025C2840025C2
      840025C2840025C2840025C2840025C2840025C2840025C2840025C2840046C6
      9300C5C7C700C4C5C60025C28400EAF9F3000000000005DAF90005DCFA0085EF
      FD00FCFFFF00FCFFFF00FCFFFF00FCFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FCFEFF00FCFEFF00FCFEFF00FCFEFF00FCFEFF0012A1E800109E
      EE00119BED0007CEF70009C9F60009C5F5000ABFF4003EC8F600A7E5FB000000
      000000000000000000000000000000000000000000005CEDFB0006D8F30006D8
      F30006DAF40027E5F8004EE6F9000AC7ED0009C9ED0009CAEE0009CCEE0008CE
      EF0053E1F600C8FCFF00C8FCFF00C8FCFF00C5FBFF00A5EDFA006FD6F20055CD
      EE0036C7ED0008C9EE0005DDF50005DFF50004E1F7000AC3EC007AD1EF000000
      000000000000000000000000000000000000D9B18700B7680D00BC6D0C00C072
      0A00C2750900C77A0800CB7F0700CC800600D0850400D48904007AA16F0009C1
      F40008C8F60008CBF60008CBF60009C6F5000BBCF3000DB2F2000DABF000109E
      ED001390EB00148AEA00AF5F1000AA5A1200A6551400A45214009F4D16009B48
      18009946180094411A00903C1C008C371D000000000000000000000000000000
      0000000000000000000081DCB80025C2840025C2840025C2840025C2840025C2
      840025C28400898A8C008099910025C2840025C2840025C2840025C2840025C2
      840025C2840025C2840025C2840025C2840025C2840025C2840025C2840046C7
      9400C9CBCB00C4C6C60046CC9700000000000000000004DEFA0003E2FB0003E3
      FB0003E3FB0004E1FA0004DEFA0005DBF900FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF000ABEF4000CB8F3000CB5F2000DB0F1000EACF1000FA6EF000FA0
      EE0071C5F5000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000075F9FF0007D5F20007D5
      F20007D5F20006D7F20006D8F30033D5F2000AC3EA000AC4EB000AC7ED0009C9
      ED0009CAEE0009CBEE0008CDEF001CD4F200C8FCFF0047E0F60007D4F10007D5
      F20007D5F20006D7F20006D9F30006D9F30009C5EC00C1EAF900000000000000
      000000000000000000000000000000000000D9B08700B6670E00BB6C0C00BF71
      0B00C1730A00C4770800C97C0800CA7E0700CD810500CF8404006AA67F0008CB
      F60006D7F90005DAF90005D9F90006D2F70009C6F5000CB9F3000DB2F2000EA4
      EF001196EC00138EEB00AE5E1100AA591300A6541400A35214009F4D16009B48
      18009845180094401A00903B1C008B361D000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000083848600999B9C00C8D0CE0097989A00A4A7A800000000000000
      00000000000000000000000000000000000000000000CFD0D000D5D6D600E9F3
      EF00D5D7D700CED0D0000000000000000000000000002AE6FB0003E4FB0003E6
      FB0003E6FB0003E3FB0004E1FA0005DCFA00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF000ABFF4000BB9F3000CB6F3000DB0F1000DADF1000EA7EF0011A1
      EF00D6EFFD000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000008D0F10008CF
      F00008D2F10007D4F10007D5F20007D5F2005FE0F60014C0EB000BC1EA000AC3
      EA000AC4EB000AC6EC0009C8ED0009CAEE0009CBEE0009CCEE0008CEEF0008D0
      F00008D2F10007D4F10008CDEF000CB5E70008C9EE0000000000000000000000
      000000000000000000000000000000000000D8B08700B5660E00B86A0D00BD6E
      0C00BF710B00C2750900C5780800C77A0800CA7D0700CB7F06005CAB8F0006D3
      F80004E1FA0001EDFD0002E7FC0005D9F90008CBF6000BBCF3000CB5F2000EA7
      EF001198EC001390EB00AC5C1100A9581300A4531400A25015009E4B17009A47
      180097441900933F1B008F3A1C008A351E000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000A2A3A500DCDDDD00D1D1D2008E8F9100A3A4A500000000000000
      00000000000000000000000000000000000000000000F5F5F500E6E6E6000000
      0000DDDEDE00DADBDB000000000000000000000000000000000002EAFC0002EC
      FD0002ECFD0003E8FC0003E4FB0004DFFA00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF000AC1F4000BBAF3000CB7F3000DB1F1000DAEF1000EA8EF000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000077F6FE000ECD
      F00009CCEE0008CEEF0008CFF00008D2F10094F2FC00C8FCFF0076E0F6000DBA
      E9000CBDE9000BC0E9000AC2EA000AC4EB000AC6EC000AC7ED0009C9ED0009CB
      EE000AC7EC000BB8E70002E9FA0002EAFA00B0E4F60000000000000000000000
      000000000000000000000000000000000000D8AF8700B4640F00B8690D00BC6D
      0C00BE700C00C1730A00C3760900C5780800C87B0800C97D070055AC960006D3
      F80004E2FB0000F5FF0001EDFD0005DAF90008CBF6000BBCF3000CB5F2000EA7
      EF001198EC001390EB00AC5C1200A8571300A3521400A15015009D4B17009946
      180097441900933F1B008E3A1C008A351E000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000CECECF00898A8C009C9D9F00000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000D9DADA00DCDDDD000000000000000000000000000000000012EEFE0001EE
      FD0001EEFD0002E9FC0003E6FB0004E0FA00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF000AC1F4000BBAF3000CB7F3000DB1F1000DAEF1000EA8EF000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000BFFDFF005FE6
      F80009CAEE0009CBEE0008CCEE0008CFF00016D5F200A7F5FD00C8FCFF009AEA
      F9004AC8EE000CB7E7000BBEE9000BC1EA000AC3EA000AC4EB000BBFEA000CB6
      E7000AC2EB0003E4F80003E6F90007D2F1000000000000000000000000000000
      000000000000000000000000000000000000D9B38F00B2621000B5660E00B96B
      0D00BB6C0C00BE700B00C0730A00C1740A00C3760900C57808005FA3890006D0
      F70005DCF90004E2FB0004E1FA0006D7F90008C8F6000BBAF3000CB4F2000EA6
      EF001197EC00138FEB00AA591200A6551400A2501500A04E16009C4918009744
      190096431A00923E1C008D391C0089341E000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000CCCCCE0088898B009A9B9D00000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000D4D5D500DADBDB0000000000000000000000000000000000BAFAFF0005F2
      FF0001F1FE0002E9FC0003E6FB0004E0FA00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF000AC1F4000BBAF3000CB7F3000DB1F1000DAEF1007ACFF7000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000026CEEF000AC6EC0009C7ED0009CAEE0009CBEE0009CCEE001AD3F10083ED
      FA009CF3FC00C8FCFF0099F3FC0078ECFA0020DCF40006D8F30006D9F30005DB
      F40005DCF40005DEF5001CB5E600D4F0FA000000000000000000000000000000
      000000000000000000000000000000000000F1E4D700AF5F1000B3630F00B667
      0E00B7680D00BA6C0C00BD6E0C00BE700B00BF710B00C0730A00C1730A0056A4
      920006D0F70006D3F80006D3F80008CBF60009C1F4000CB5F2000DAFF1000FA1
      EE001392E900726E6400A8571300A4531400A04E16009E4C17009B4818009643
      190094401A00903C1C008C371D0088321F000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000C9C9CA007E7F820096979900000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000CFD0D000D0D1D10000000000000000000000000000000000000000000000
      000010EEFE0003E8FC0003E4FB0004DFFA0085EDFD0086EBFD0086E9FC0087E5
      FB0087E4FB000AC1F4000BBAF3000CB7F3000EB2F20085D6F800000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000002BCBEE000AC1EA000AC4EB000AC6EC000AC7ED0009C9ED0009CB
      EE0009CCEE006BE6F80008D0F00008D1F00007D3F10007D5F20007D5F20006D6
      F20006D7F20029B6E70000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000AE5E1100B2621000B465
      0F00B6670E00B86A0D00BB6C0C00BC6D0C00BE700C00BE700B00BF710B00BF71
      0B0010C4EB0008CBF60008CBF60009C6F5000BBCF3000DB2F2000DABF000109E
      ED00836A4B00AA5A1200A7561400A35215009F4D16009D4B1700994618009542
      1A00933F1B00903B1C008B361D00995040000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000C8C8C900757679007F808300A5A5A700A5A6
      A700A8A9AA00ACACAE00B0B1B200B2B3B500B9B9BA00BDBEBF00C1C1C200C3C4
      C500C7C8C900CCCDCE0000000000000000000000000000000000000000000000
      0000D7FCFF0003E5FB0003E3FB0005DDFA0006D8F90006D5F90007CFF70008C9
      F60009C6F5000AC0F4000BBAF3000CB7F300AEE5FB0000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000001EC2EB000BC0E9000BC1EA000AC3EA000AC5
      EC000AC7ED0009C9ED0009CBEE0009CBEE0008CDEF0008CFF00008D1F00024B5
      E600A4DFF4000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000C2875200AE5E1100B161
      1000B3631000B5660E00B7680E00B7690D00B96B0D00BA6B0C00BA6C0C00BA6C
      0C00B96B0C00B86A0D00B7690D00B6670E00B4640F00B1611000B0601000AC5C
      1100A9581300A8571300A4531400A04E16009D4A17009B48180097441900933F
      1B00923E1C008D391C0089341E00000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000EAEAEB0074757800747578007D7E8100898A
      8C00898A8C009293950097989A009D9EA000A6A7A800ACADAE00B2B3B400BABB
      BC00C0C1C200D4D5D60000000000000000000000000000000000000000000000
      000000000000000000000000000063E9FC0006D5F90006D2F80007CDF70009C7
      F50009C4F5004FD1F80000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000B7E7F8001AB8E7000CBA
      E7000BBDE9000AC2EA000AC1EB000BBDE9001FBAE80069CCEE00000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000D4A98300AD5D
      1100AF5F1000B1611000B3630F00B4640F00B5660E00B6670E00B6670E00B667
      0E00B5660E00B4650F00B4640F00B2621000B0601000AD5D1100AC5C1100A958
      1300A7551400A5531400A15015009E4C17009B4818009946180095411A00923E
      1C00903B1C00903F26000000000000000000424D3E000000000000003E000000
      2800000080000000400000000100010000000000000400000000000000000000
      000000000000000000000000FFFFFF00E0000007FC00000FFFFFFFFF00000000
      C0000001F8000003FFFFFFFF0000000080000000F8000003FFFFFFFF00000000
      80000000F8000007FFFFFFFF0000000000000000FC00000FFFFFFFFF00000000
      00000000FFFFFFFFFFFFFFFF0000000000000000FFE007FFFFFFFFFF00000000
      00000000FF8000FFFFFE00070000000000000000FE00003FF060000300000000
      00000000F800000F000000010000000000000000F000000F0000000100000000
      00000000E0000003000000000000000000000000C00000030000000000000000
      0000000080000001000000000000000000000000800000010000000000000000
      0000000080000000000000000000000000000000800000000C30000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000800000008000000000000000
      0000000080000001C0001000000000000000000080000001C0001C0300000000
      00000000C0000001F0000FFF0000000000000000C0000003FFFFFFFF00000000
      00000000F0000007FFFFFFFF0000000000000000F800000FFFFFFFFF00000000
      80000000FC00001FFFFFFFFF0000000080000001FE00007FFFFFFFFF00000000
      C0000003FFC001FFFFFFFFFF00000000E00000FFFFFFF8FFFFFFFFFFE0000007
      8000003FFFFF801FFFF8007FC00000018000001FFFFF000FFFE0001F80000000
      00000007FFFC0003FFC0000F0000000000000007FFFC0003FF80000300000000
      00000001FFF80001FF0000030000000000000000FFF80001FF00000100000000
      00000000FFF80001FE0000010000000000000000FF000000FC00000000000000
      00000000FC000000F80000000000000000000000F0000000F000000000000000
      00000000F0000000F00000000000000000000000E0000000F000000000000000
      00000000C0000000E00000000000000000000000C0000000C000000000000000
      0000000080000000800000000000000000000000800000008000000100000000
      0000000080000001800000010000000080000000800000018000000300000000
      80000000000000010000000300000000C0000000000000030000000F00000000
      E0000000000000030000000F00000000F00000000000000F0000001F00000000
      F80000008000001F8000001F00000000FC000001800007FF8000003F00000000
      FFF83F83800007FFC000007F00000000FFF83F93C0001FFFC000007F00000000
      FFFE3FF3C0001FFFC00000FF00000000FFFE3FF3C0001FFFF00000FF00000000
      FFFE3FF3F0003FFFF80003FF80000000FFFE0003F0007FFFFE0007FF80000001
      FFFE0003FE03FFFFFF803FFFC000000300000000000000000000000000000000
      000000000000}
  end
  object popFinanceiroCadastros: TPopupMenu
    Left = 96
    Top = 56
    object Contas1: TMenuItem
      Caption = 'Tipos de Pessoas'
      OnClick = Contas1Click
    end
    object PlanodeContas1: TMenuItem
      Caption = 'Atividades'
      OnClick = PlanodeContas1Click
    end
    object N1: TMenuItem
      Caption = '-'
    end
    object PlanosdeDescontos2: TMenuItem
      Caption = 'Planos de Descontos'
      OnClick = PlanosdeDescontos2Click
    end
  end
  object MenuFinanceiro: TMainMenu
    Left = 8
    Top = 56
    object Mdulo1: TMenuItem
      Caption = 'M'#243'dulo'
      object Sair1: TMenuItem
        Caption = 'Sair'
        OnClick = btnSairClick
      end
    end
    object MenuItem6: TMenuItem
      Caption = 'Cadastros'
      object iposdePessoas1: TMenuItem
        Caption = 'Tipos de Pessoas'
        OnClick = Contas1Click
      end
      object Atividades1: TMenuItem
        Caption = 'Atividades'
        OnClick = PlanodeContas1Click
      end
      object N2: TMenuItem
        Caption = '-'
      end
      object PlanosdeDescontos1: TMenuItem
        Caption = 'Planos de Descontos'
        OnClick = PlanosdeDescontos2Click
      end
    end
    object Financeiro1: TMenuItem
      Caption = 'Financeiro'
      object Cobrana2: TMenuItem
        Caption = 'Cobran'#231'a'
        OnClick = Cobrana1Click
      end
      object N3: TMenuItem
        Caption = '-'
      end
      object ResgatarPagamentos3: TMenuItem
        Caption = 'Resgatar Pagamentos'
        OnClick = Resgatarpagamentos2Click
      end
    end
    object MenuItem12: TMenuItem
      Caption = 'Configura'#231#245'es'
      object TrocarUsurio2: TMenuItem
        Caption = 'Trocar Usu'#225'rio'
        OnClick = TrocarUsurio1Click
      end
    end
  end
  object ImagensMenu: TImageList
    Left = 8
    Top = 120
    Bitmap = {
      494C010101000400040010001000FFFFFFFFFF10FFFFFFFFFFFFFFFF424D3600
      0000000000003600000028000000400000001000000001002000000000000010
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000CECE009CFFFF0000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000FF0000009C630000FF0000000000000000CECE009CFFFF00000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000FF000000FF000000FF00
      000000000000FF00000000000000000000000031310000CECE009CFFFF000000
      0000000000000000000000636300000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000FF0000000000000063CE
      FF00319CCE0000000000000084000063FF00000000000000000000FFFF009CFF
      FF0000FFFF0031CECE00319C9C00006363000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000063CEFF00319C
      CE00319CCE008484840094ADAD0084848400000000000000000000FFFF0000FF
      FF000031310063FFFF0000FFFF00006363000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000319CCE00319C
      CE00319CCE0063CEFF000000000000000000000000000000000063FFFF000031
      6300000000000000000063FFFF00006363000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000000000000000000063CE
      FF0063CEFF00319CCE000000000094ADAD0094ADAD0000000000319C9C0063FF
      FF000084840031CECE0000313100000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000063CEFF0063CE
      FF0063CEFF0063CEFF0063CEFF000000000094ADAD0000000000000000000063
      6300006363000063630000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000000000319C
      CE0063CEFF000000000063CEFF0094ADAD00C6C6C60094ADAD00000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000319CCE0063CEFF000031310094ADAD00C6C6C60000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000319CCE0063CEFF0094ADAD0094ADAD0000316300000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000094ADAD0000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000003131000031310000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
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
      2800000040000000100000000100010000000000800000000000000000000000
      000000000000000000000000FFFFFF00FFFF000000000000FE7F000000000000
      FE3F000000000000801F00000000000000010000000000000000000000000000
      80C000000000000080C400000000000000410000000000000063000000000000
      003F000000000000003F000000000000003F000000000000003F000000000000
      C03F000000000000F07F00000000000000000000000000000000000000000000
      000000000000}
  end
  object pmFinanc: TPopupMenu
    Left = 264
    Top = 56
    object Cobrana1: TMenuItem
      Caption = 'Cobran'#231'a'
      OnClick = Cobrana1Click
    end
    object Resgatarpagamentos1: TMenuItem
      Caption = '-'
    end
    object Resgatarpagamentos2: TMenuItem
      Caption = 'Resgatar pagamentos'
      OnClick = Resgatarpagamentos2Click
    end
  end
end
