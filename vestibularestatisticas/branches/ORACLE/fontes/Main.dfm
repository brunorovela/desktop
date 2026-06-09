object PrincipalForm: TPrincipalForm
  Left = 190
  Top = 116
  ClientHeight = 619
  ClientWidth = 788
  Color = clBtnFace
  Font.Charset = ANSI_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Arial'
  Font.Style = []
  FormStyle = fsMDIForm
  Menu = MainMenu1
  OldCreateOrder = True
  Position = poDefault
  ShowHint = True
  WindowState = wsMaximized
  OnCloseQuery = FormCloseQuery
  OnCreate = FormCreate
  OnResize = FormResize
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 14
  object toolFinanceiro: TToolBar
    Left = 0
    Top = 0
    Width = 788
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
      Caption = 'Vestibular'
      ImageIndex = 14
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
      Caption = 'Importar'
      ImageIndex = 10
      OnClick = btnFinanceiroCadastroClick
    end
    object ToolButton1: TToolButton
      Left = 172
      Top = 0
      Width = 8
      Caption = 'ToolButton1'
      ImageIndex = 8
      Style = tbsSeparator
    end
    object ToolButton6: TToolButton
      Left = 180
      Top = 0
      Caption = 'Relat'#243'rios'
      DropdownMenu = popRelatorios
      ImageIndex = 3
      OnClick = ToolButton6Click
    end
    object ToolButton3: TToolButton
      Left = 258
      Top = 0
      Width = 8
      Caption = 'ToolButton3'
      ImageIndex = 1
      Style = tbsSeparator
    end
    object btnFinanceiroConfiguracoes: TToolButton
      Left = 266
      Top = 0
      Caption = 'Configura'#231#245'es'
      DropdownMenu = popConfiguracoes
      ImageIndex = 6
    end
    object ToolButton11: TToolButton
      Left = 344
      Top = 0
      Width = 8
      Caption = 'ToolButton11'
      ImageIndex = 8
      Style = tbsSeparator
    end
    object btnFinanceiroSair: TToolButton
      Left = 352
      Top = 0
      Caption = 'Sair'
      ImageIndex = 11
      OnClick = btnSairClick
    end
    object ToolButton18: TToolButton
      Left = 430
      Top = 0
      Width = 8
      Caption = 'ToolButton18'
      ImageIndex = 7
      Style = tbsSeparator
    end
  end
  object BarraDeStatus: TToolBar
    Left = 0
    Top = 593
    Width = 788
    Height = 26
    Align = alBottom
    ButtonWidth = 112
    Caption = 'toolEscolar'
    EdgeBorders = [ebTop, ebBottom]
    Images = ImagensMenu
    List = True
    ShowCaptions = True
    TabOrder = 1
    Transparent = True
    object traco1: TToolButton
      Left = 0
      Top = 0
      Width = 8
      Caption = 'ToolButton19'
      ImageIndex = 8
      Style = tbsSeparator
    end
    object btnUsuario: TToolButton
      Left = 8
      Top = 0
      Caption = 'Usu'#225'rio: MASTER'
      ImageIndex = 0
      OnClick = TrocarUsurio1Click
    end
    object traco2: TToolButton
      Left = 120
      Top = 0
      Width = 8
      Caption = 'ToolButton2'
      ImageIndex = 1
      Style = tbsSeparator
    end
    object pnlMsg: TPanel
      Left = 128
      Top = 0
      Width = 428
      Height = 22
      Align = alClient
      BevelOuter = bvNone
      TabOrder = 0
    end
    object traco3: TToolButton
      Left = 556
      Top = 0
      Width = 8
      Caption = 'ToolButton3'
      ImageIndex = 1
      Style = tbsSeparator
    end
    object btnDatas: TToolButton
      Left = 564
      Top = 0
      AutoSize = True
      OnClick = btnDatasClick
    end
    object traco4: TToolButton
      Left = 578
      Top = 0
      Width = 8
      Caption = 'traco4'
      ImageIndex = 0
      Style = tbsSeparator
    end
  end
  object popConfiguracoes: TPopupMenu
    Left = 264
    Top = 56
    object TrocarUsurio1: TMenuItem
      Caption = 'Trocar Usu'#225'rio'
      OnClick = TrocarUsurio1Click
    end
    object N1: TMenuItem
      Caption = '-'
    end
    object Parmetros1: TMenuItem
      Caption = 'Par'#226'metros'
      OnClick = Parmetros1Click
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
    Version.Windows.Minor = 1
    Version.Windows.Build = '7601'
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
      494C01010F001100080020002000FFFFFFFFFF10FFFFFFFFFFFFFFFF424D3600
      000000000000360000002800000080000000A000000001002000000000000040
      0100000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000E7F3F400B1AD
      B5009F9BA400949199008B898F007D7A80007F7C84008F8A96009994A100ACA5
      AE00BEBEC200EBF9FA0000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000004A4A4A004A4A4A004A4A4A004A4A
      4A004A4A4A004A4A4A004A4A4A004A4A4A004A4A4A004A4A4A004A4A4A004A4A
      4A004A4A4A004A4A4A004A4A4A004A4A4A004A4A4A004A4A4A004A4A4A004A4A
      4A004A4A4A004A4A4A004A4A4A004A4A4A004A4A4A004A4A4A004A4A4A004A4A
      4A004A4A4A004A4A4A004A4A4A00000000000000000000000000000000000000
      000000000000EFFFFF00E9F4F500D8E0E10000000000C0C6CB00B0B5BA005350
      5C002C2939001B172C0014112800120F2600100D23001512280027243A004D48
      5900736E7A00C1C9CE00CCD4DB0000000000DEE5E900E9F5F600EFFFFF000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000084848400C6C6C600C6C6C600C6C6
      C600C6C6C600C6C6C600C6C6C600C6C6C600C6C6C600C6C6C600C6C6C600C6C6
      C600C6C6C600C6C6C600C6C6C600C6C6C600C6C6C600C6C6C600C6C6C600C6C6
      C600C6C6C600C6C6C600C6C6C600C6C6C600C6C6C600C6C6C600C6C6C600C6C6
      C600C6C6C600C6C6C6004A4A4A00000000000000000000000000000000000000
      00000000000000000000EDFAFA00E1E9EA00AFA9AD00717085003A3D64001E1E
      4E000E0D440012124E0012124D000F104B001214500014155200141654001F22
      4400413C53006F6F8800A5A3B000D7DEE200E2EBEF00EDFAFB00000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000084848400C6C6C600000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000C6C6C6004A4A4A00000000000000000000000000000000000000
      0000000000000000000000000000E8F4F70068658100282D700020227A002127
      77001C2675001C2A78001E2575001C24740020297A001E2A7C001E2A7F00171D
      530015184F0021297500616A9500E9F6F9000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000084848400C6C6C600000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000031639C0063639C0063319C00000000000000
      00003163CE000063CE000000000000000000000000004A4A4A00633131006331
      000000000000C6C6C6004A4A4A00000000000000000000000000000000000000
      00000000000000000000D6E2EC00787FB40026275800313D93002B388E002937
      8F0028358D0026348B0026328A00263189002431890023338A0026368F002327
      5600222B6A002A39980027378F007280B300DAE4EE0000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000084848400C6C6C600000000003131
      FF006363FF00639CFF00CECEFF00CECEFF000000000000000000000000000000
      000000000000000000000000000031639C0031639C0063319C00000000000000
      00003163CE003163CE000063FF0000000000000000004A4A4A00633131006331
      310000000000C6C6C6004A4A4A00000000000000000000000000000000000000
      000000000000D1DAEA007C88C4003E4EA4002F3860003A44A000333D9A00313D
      98002F39950030399500303893002D378F002A378D002A3690002F3F92002526
      50002D37850034409E003747A2003846AB007985C100D9E5EE00000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000084848400C6C6C600000000003131
      FF006363FF00639CFF00CECEFF00CECEFF000000000000000000000000000000
      0000000000000000000000000000319CCE0031639C0063639C00000000000000
      00003131CE003163CE000063CE00000000000000000031636300525252000000
      000000000000C6C6C6004A4A4A00000000000000000000000000000000000000
      0000DFEBF3008A96CD00465BB4004854AF0032345D003D479C0036409F00323C
      9B00303A9800313B99002F3794002D368F002C389100293596002B388C002427
      450030389C003543A3003948A700414EAC004459B1008D9ACB00E0ECF4000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000084848400C6C6C600000000003131
      FF006363FF00639CFF00CECEFF00CECEFF000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000C6C6C6004A4A4A0000000000000000000000000000000000EDFA
      FD00AEB9E1005469BF004E64BD004954B7003334580036418F0036419D00333C
      9C00313B9900313B990030389500303992002F3A92002A3B93002B3382002C29
      5400313C9E003241A3003847A7003F4CAA004559B1004C5CBA00A0ADD800EBF9
      FB00000000000000000000000000000000000000000000000000000000000000
      0000000000007F7F7F000000000000000000000000007F7F7F00000000000000
      00000000000000000000000000000000000000000000FFFFFF00FFFFFF00FFFF
      FF00000000007F7F7F007F7F7F007F7F7F007F7F7F007F7F7F0000000000FFFF
      FF0000000000FFFFFF00FFFFFF00FFFFFF000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000084848400C6C6C600000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000009CCE00319CCE0031639C00000000000000
      000031319C0031319C003163CE00000000000000000031639C00424242004A4A
      4A0000000000C6C6C6004A4A4A00000000000000000000000000EFFFFF00C8D3
      E800626FC7005268BE00485DB7004555BA00343869003139750035409E002E3D
      9500363D9700323B96002F3893002E378F002B3990002E3D9300252B65002B2E
      6300313E9D0031409F003744A5003B4CA9004254AE00495AB7005666C200BECA
      E500000000000000000000000000000000000000000000000000000000000000
      0000000000000000FF000000FF000000000000FFFF0000FFFF00000000000000
      0000000000000000000000000000000000007F7F7F007F7F7F007F7F7F000000
      00007F7F7F0000000000000000007F7F7F00FFFFFF00000000007F7F7F000000
      00007F7F7F007F7F7F007F7F7F007F7F7F000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000084848400C6C6C600000000008484
      8400C6C6C60084848400C6C6C60084848400C6C6C60000000000848484000000
      000000000000000000000000000031CECE003163CE0000000000000000000000
      000063319C0031319C003163CE00000000000000000000639C0031639C004A4A
      4A0000000000C6C6C6004A4A4A00000000000000000000000000E3F0F8006A7A
      C600576BC6005062BA004559B6004254B700343A83002D2E5A0034419C002E3B
      9500343B95002F3892002D3690002C368D002A368F002A398D00212745002A32
      7700323B9700313E9C003641A6003949AA004050AD004B57B7005063C00096A5
      D700E2EEF4000000000000000000000000000000000000000000000000000000
      00000000FF000000FF000000FF000000000000FFFF0000FFFF0000FFFF000000
      0000000000000000000000000000000000000000000000000000000000007F7F
      7F000000000000000000000000007F7F7F00FFFFFF0000000000000000007F7F
      7F0000000000FFFFFF0000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000084848400C6C6C600000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000CEFF0000000000319CCE00000000000000
      000063319C0031319C0031319C0000000000000000003163CE0031639C003163
      9C0000000000C6C6C6004A4A4A00000000000000000000000000C2CDE6006270
      C3005164BE004A5AB7004356B4003C4DB00038439C00272649002F3C91002A37
      91002E37910029338C0027308A0027318800253088002534850020203E002732
      88002E3790002D3B99003640A7003A47AA00394AA9004253B8004D5DBA005766
      BD00B2BDCE000000000000000000000000000000000000000000000000000000
      FF000000FF000000FF000000FF000000000000FFFF0000FFFF0000FFFF0000FF
      FF000000000000000000000000000000000000000000000000007F7F7F000000
      00000000000000000000000000007F7F7F00FFFFFF0000000000000000000000
      00007F7F7F0000000000FFFFFF00000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000084848400C6C6C600CE9C0000CE9C
      0000CE9C0000CE9C0000CE9C0000CE9C0000CE9C0000CE9C0000CE9C0000CE9C
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000C6C6C6004A4A4A000000000000000000EDFBFC00A1AFDC005767
      BF00495CBC004556B5003E50AF00394AAD003143A8002A2952002D3178002435
      9100232F8900262F8700212B8300242F8400222F87001B2868001B1F4A002432
      8C0024328E0029389900313CA1003642A6003848AC00404DB0004059BB004A55
      A8008F95BE00ECFAFC000000000000000000000000007F7F7F000000FF000000
      FF000000FF000000FF000000FF000000000000FFFF0000FFFF0000FFFF0000FF
      FF0000FFFF007F7F7F000000000000000000000000007F7F7F00FFFFFF000000
      00000000000000000000000000007F7F7F00FFFFFF0000000000000000000000
      0000000000007F7F7F00FFFFFF00000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000084848400C6C6C600000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000004A4A4A006331310063310000000000000000
      00006300630063319C0031319C0000000000000000000063CE003163CE003163
      9C0000000000C6C6C6004A4A4A000000000000000000DCE7ED005967BD004B5C
      BC004258BA004155B2003D4DB0003645AB00303EA800262D7100242153002231
      8D00212D8700222C8400202A82001E297E00202E8300161A480018206500202D
      8B0022308B00253595002A3A9C00313EA8003441AD003C4BAF004053B7003741
      70004C5BAF00C4CBE800000000000000000000000000000000000000FF000000
      FF000000FF000000FF000000FF000000000000FFFF0000FFFF0000FFFF0000FF
      FF0000FFFF00000000000000000000000000000000007F7F7F00FFFFFF000000
      00000000000000000000000000007F7F7F00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF007F7F7F00FFFFFF00000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000084848400C6C6C600000000008484
      840084848400C6C6C60084848400C6C6C6008484840084848400848484000000
      00000000000000000000000000004A4A4A006331310063313100000000000000
      0000630063006331630063319C000000000000000000009CFF000063CE003163
      CE0000000000C6C6C6004A4A4A000000000000000000C7D1D8004151A1004054
      BB003B50B5003F50B1003A4BB0003544AD00303EA600203390001F1B48002230
      8100212B89001B2B83001C2683001C277B0018287C0017133B001C277800222E
      890020308B0025379500283A9D00303DA900313FB000394EB400313A75003A41
      8B003F59BA00ACB4D600000000000000000000000000000000000000FF000000
      FF000000FF000000FF000000FF00000000000000000000000000000000000000
      000000000000000000000000000000000000000000007F7F7F00FFFFFF000000
      00000000000000000000000000007F7F7F007F7F7F007F7F7F007F7F7F007F7F
      7F007F7F7F007F7F7F00FFFFFF00000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000084848400C6C6C600000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000316363005252520000FF0000000000000000
      000063319C006300630063319C0000000000000000000063FF000063FF000063
      CE0000000000C6C6C6004A4A4A000000000000000000C0C9DC002D3676003D4C
      AF003D4EBB004151B2003E51B4003748AF002F3FA800223798001D2255001E27
      6500222D8C001B2B8400212C80001E2C880018236C00191747001B2D8600202E
      8A0022338F0025369700293A9B002940A000344AB2002E367B00313775004153
      B6003B54B8009EA3D200000000000000000000000000000000000000FF000000
      FF000000FF000000FF000000000000FF000000000000FF000000FF000000FF00
      0000FF000000000000000000000000000000000000007F7F7F00FFFFFF000000
      000000000000000000007F7F7F00000000007F7F7F0000000000FFFFFF000000
      0000000000007F7F7F00FFFFFF00000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000084848400C6C6C600000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000C6C6C6004A4A4A000000000000000000BAC7DF00323288002F36
      72004052B600415CC400475BBA003B4CB1003242A700273CA600222B7D001D1D
      4B0024339000202D89001E318400232E8D00191C52001C24670024318F002331
      8F002735950028389B002E39AB003B46AF0028336F002A3176003B4ABB003B53
      BC00394EB900949CCB000000000000000000000000007F7F7F000000FF000000
      FF000000FF000000000000FF000000FF000000FF000000000000FF000000FF00
      0000FF0000007F7F7F000000000000000000000000007F7F7F0000000000FFFF
      FF00000000007F7F7F000000000000000000000000007F7F7F0000000000FFFF
      FF00000000007F7F7F0000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000084848400C6C6C600848484008484
      8400848484008484840084848400848484008484840084848400848484008484
      8400848484008484840084848400848484008484840084848400848484008484
      8400848484008484840084848400848484008484840084848400848484008484
      840084848400C6C6C6004A4A4A000000000000000000B9C6DE00283AA400323B
      8600313A7200475BB6005064CA004157BB003345AE002D40AC00243899002324
      4A002735960027358F00263293002C328E00191B4100212E87002B3596002534
      940027379C002E3EAC003946A400262E64002A3070003847B100394EBF003F53
      BF00374BB8009DA5CD0000000000000000000000000000000000000000000000
      FF000000000000FF000000FF000000FF000000FF000000FF000000000000FF00
      00000000000000000000000000000000000000000000000000007F7F7F000000
      00007F7F7F0000000000000000000000000000000000000000007F7F7F000000
      00007F7F7F000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000084848400C6C6C600C6C6C600C6C6
      C600C6C6C600C6C6C600C6C6C600C6C6C600C6C6C600C6C6C600C6C6C600C6C6
      C60084848400C6C6C600C6C6C600C6C6C600C6C6C600C6C6C600C6C6C600C6C6
      C600C6C6C600C6C6C600C6C6C600C6C6C600C6C6C600C6C6C600C6C6C600C6C6
      C600C6C6C600C6C6C6004A4A4A000000000000000000CDD7EC002839A8002F44
      B300414C9700373D72004353A300485DCA003E51BC00384AB6003248A900282B
      52002E399600313C9C00313F9D002A35840025274A002A3B9D00313E9E002A3E
      9F003347B000333F8C0023265D002F3487003549B4003A4CBC003D52BE003D54
      BC003145B800ABB1D60000000000000000000000000000000000000000000000
      000000FF000000FF000000FF000000FF000000FF000000FF000000FF00000000
      00000000000000000000000000000000000000000000FFFFFF00FFFFFF007F7F
      7F0000000000FFFFFF0000000000000000000000000000000000000000007F7F
      7F000000000000000000FFFFFF00FFFFFF000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000084848400C6C6C600C6C6C6008484
      8400C6C6C60084848400C6C6C600C6C6C60084848400C6C6C60084848400C6C6
      C60084848400C6C6C600C6C6C600000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000C6C6C6004A4A4A000000000000000000E3EFF6003241A9002D41
      B100374ABE004955B5003A407700323E78004457AF00475DC5004C5FBD003738
      5E0038429C003949A8003B48AC002F365E0031387B003748B0003A49A8004050
      B700373E880029265600313E9700304AB6003A4FBB003D54C2004155C6003C52
      C0003A4ABC00CDD2EB0000000000000000000000000000000000000000000000
      00000000000000FF000000FF000000FF000000FF000000FF0000000000000000
      0000000000000000000000000000000000007F7F7F007F7F7F00000000000000
      00007F7F7F0000000000FFFFFF00FFFFFF00FFFFFF00FFFFFF007F7F7F000000
      0000000000007F7F7F007F7F7F007F7F7F000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000084848400C6C6C600C6C6C600C6C6
      C6008484840000000000C6C6C600C6C6C6000000000084848400C6C6C600C6C6
      C60084848400C6C6C600C6C6C600000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000C6C6C6004A4A4A000000000000000000EFFFFF008692CD00263B
      AD003345B8003B50BD004A59C4003C4498002B316900434880005D629B003D43
      69004C59BC004A5BBB004858B0003F3D5900404EAA004656BD004558BB00424D
      94002D3564003A4AAD003C4FBE003B52B8004054BF004358C6004058C800344C
      C3008E9BD600EFFFFF0000000000000000000000000000000000000000000000
      0000000000007F7F7F000000000000000000000000007F7F7F00000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000007F7F7F007F7F7F007F7F7F007F7F7F007F7F7F00000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000084848400C6C6C600C6C6C6008484
      8400C6C6C60084848400C6C6C600C6C6C60084848400C6C6C60084848400C6C6
      C60084848400C6C6C600C6C6C600000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000C6C6C6004A4A4A00000000000000000000000000C3CEE7002339
      AD002F44BA003851BE003E54C4004A5AC800485BB9004E559500493D4C004940
      51006268A400667AC700626AA5004E5080005065CB005069C7005965BD004045
      7200505BB000445AC5004158C1003F57C600435ECA00475ECC00415BCE00364E
      C100D2DEEE000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000084848400C6C6C600C6C6C600C6C6
      C600C6C6C600C6C6C600C6C6C600C6C6C600C6C6C600C6C6C600C6C6C600C6C6
      C60084848400C6C6C600C6C6C600C6C6C600C6C6C600C6C6C600C6C6C600C6C6
      C600C6C6C600C6C6C600C6C6C600C6C6C600C6C6C600C6C6C600C6C6C600C6C6
      C600C6C6C600C6C6C6004A4A4A00000000000000000000000000EBF9FB007082
      C9002E44C200364FC400425AC3005065CA005E71D5007F8ED70063607C005D61
      9B005960910063618900665F7500656991007980CB007587D00063649500626F
      AB006376D800576BCD004F60D4004C62D3004E68D3004F64D1004153BB007D88
      BD00EEFDFD000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000084848400C6C6C600633100006331
      0000633100006331000063310000633100006331000063310000633100006331
      0000633100006331000063310000633100006331000063310000633100006331
      0000633100000000000000000000000000000000000000000000000000000000
      000000000000000000004A4A4A0000000000000000000000000000000000D6E2
      F0005D75C6004058C4005A6ED3007486DB008D96D8007D7C8F006B719E007888
      D8007E8EE200828AC500747188007979AB006E719E007071900077687000716E
      9A007178A000676AA900555EA40049569B0042529300354492005A66AC00D2DE
      EC00000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000084848400C6C6C600633100006331
      0000633100006331000063310000633100006331000063310000633100006331
      0000633100006331000063310000633100006331000063310000633100006331
      000063310000C6C6C600C6C6C60000000000C6C6C600C6C6C60000000000C6C6
      C600C6C6C600000000004A4A4A00000000000000000000000000000000000000
      0000BDC7DE006373B1004F5995006B6896006F7095006A73AD007D8EDF0099A2
      E500A2ABE8009C9ABD008C8EB7009DA4EC0092A1EC008C8BB7008C88A5007783
      C5006C7ABC005D6DB2004C5BAA004959B300495CC0004050C700BECAEA000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000084848400C6C6C600633100006331
      0000633100006331000063310000633100006331000063310000633100006331
      0000633100006331000063310000633100006331000063310000633100006331
      000063310000C6C6C600C6C6C60000000000C6C6C600C6C6C60000000000C6C6
      C600C6C6C600000000004A4A4A00000000000000000000000000000000000000
      000000000000C6D3EF008B9CDA006C7CD3007E8CDC00949DE6009EA9ED00A8B0
      ED00B3BBE800A19EB000A2ABDD00AEB6F100AFB5F400A1A1B600A9A8DB0095A8
      EF008A9CE9008698EA006E84E4005476DA00768DDF00BDCBEC00EFFFFF000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000084848400C6C6C600633100006331
      0000633100006331000063310000633100006331000063310000633100006331
      0000633100006331000063310000633100006331000063310000633100006331
      0000633100006331000063310000633100006331000063310000633100006331
      000063310000633100004A4A4A00000000000000000000000000000000000000
      00000000000000000000D5E4F600ABBDF1008699E800A7B0EF00B2B9F100B8BF
      F400BEBED300AEA9BE00C2C3F700C4C8F400BEC6F200ADADC800B8B5D600B2BA
      EF00A1AEED008EA1E9006E88E50093A4E700D0DEF10000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000084848400C6C6C600C6C6C600C6C6
      C600C6C6C600C6C6C600C6C6C600C6C6C600C6C6C600C6C6C600C6C6C600C6C6
      C600C6C6C600C6C6C600C6C6C600C6C6C600C6C6C600C6C6C600C6C6C600C6C6
      C600C6C6C600C6C6C600C6C6C600C6C6C600C6C6C600C6C6C600C6C6C600C6C6
      C600C6C6C600C6C6C6004A4A4A00000000000000000000000000000000000000
      0000000000000000000000000000E9F7FD00CBDBF600C6D5F300A9B4EF00C3C4
      F200B7AEBF00C4C2E500CECFF900D2D1F800CDD1F900C4C2EA00B7B3C600BFC0
      E800A8B3F300939FE700C3D2EE00E7F5FB000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000008484840084848400848484008484
      8400848484008484840084848400848484008484840084848400848484008484
      8400848484008484840084848400848484008484840084848400848484008484
      8400848484008484840084848400848484008484840084848400848484008484
      840084848400848484004A4A4A00000000000000000000000000000000000000
      00000000000000000000000000000000000000000000EBF9FC00E0ECFA00D3DC
      E800ABA7C500C2C8F600CACCF300CBCDF500C9CDF600C6C6F600BCB9DD00CFD8
      E500D7E4F000EBF8FC00EFFFFF00000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000000000EFFE
      FE00E8E8F200DADEF300D7D8F000D8D8F100DCDDF100E6E8F500E9ECF600EFFF
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
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000ADADA5000000
      29006B6B7300F7F7F70000000000000000000000000000000000000000000000
      0000E7E7E700080818000000080000081000E7E7DE0000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000FFEFFF000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000FFFFFF006B6B8C00000073000000
      D6009494E70000006B00ADADAD00F7F7F7000000000000000000000000008484
      8C00182142006373A500737BA5001029630021294A008C8C9400D6D6D6000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000C6CEE7001839
      B50000219C0008299C0000219C0008299C0008299C0008299C0008299C000829
      9C0008299C0008299C0008299C0008299C0008299C0008299C0008299C000021
      A5000021A50000219C0000219C000021A50000219C0000219C0000219C000829
      9C001839B500ADB5DE0000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000003131000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000211842000000C6000018E7000018
      DE007384EF000000DE002121C60021217B007B7B8C00FFFFF700F7F7F7002931
      4A00A5ADCE00F7F7F700C6D6E70008185A0042528C00394A7B00212952005A5A
      6300EFEFEF000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000006363630063636300636363006363
      6300636363006363630063636300636363006363630063636300636363006363
      6300636363006363630063636300636363006363630063636300636363006363
      63006363630063636300636363006363630000000000C6CEE7000829AD000829
      AD000831BD000831BD001839B5001839B5001839B5001839B5001839B5001839
      B5001839B5001839B5001839B5000831BD001839B5000831BD000831BD000831
      BD000831BD000831BD000831BD000831BD000831BD000831BD000831BD000029
      B5000021A50000219C00ADB5DE00000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000009C9C0000639C00000000000031
      3100000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000001029001094EF0029DEF70031E7
      F70084A5F7000000D6003939F7000000DE000000C60000006B008C8C8C008484
      7B000000000000000000BDC6DE0010215A0042528400394A7B00182963002129
      7300081031006B6B7300D6D6D600000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000009C3900009C3900009C3900009C3900009C39
      00009C3900009C3900009C3900009C3900009C3900009C3900009C3900009C39
      00009C3900009C3900009C3900009C3900009C3900009C3900009C3900009C39
      00009C3900009C3900009C39000063636300000000003152CE000029C6000831
      CE001839C6001839C6002142D6002142D6002142D6002142D6002142D6002142
      D6002142D6002142D6002142D6002142D6001039DE002142D6001039DE001039
      DE001039DE001039DE000831CE000031DE000031DE000031D6000031D6000029
      C6000029C6000021A5001839B500000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000CECE00003131009CFFFF0000639C000000
      0000003131000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000031310031F7F70052F7FF0052E7
      FF00849CF7000000DE003939EF000000DE000000DE000000EF0000008C007B7B
      7B000000000000000000A5B5CE0008215A0039528400394A8400102163001029
      63002139730010215A0018214A005A5A6300EFEFEF0000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000A5522100DEEFEF00DEEFEF00DEEFEF00DEEF
      EF00DEEFEF00DEEFEF00DEEFEF00DEEFEF00DEEFEF00DEEFEF00DEEFEF00DEEF
      EF00DEEFEF00DEEFEF00DEEFEF00DEEFEF00DEEFEF00DEEFEF00DEEFEF00DEEF
      EF00DEEFEF00CECEC6006342310063636300000000000031D6001039DE001039
      DE001842DE002142D6002952DE002952DE002952DE002952DE002952DE002952
      DE002952DE002952DE002952DE002952DE00214AE700214AE700214AE7001842
      DE00104AEF001842DE000842E7000842E7000039E7000039E7000039E7000031
      D6000031D6000029B50000219C00000000000000000000000000000000000000
      0000000000009C630000FF000000000000000000000000000000000000000000
      000000000000000000000000000000FFFF0000CECE00003131009CFFFF000063
      9C00000000000031310000000000000000000000000000000000000000000000
      00000000000000000000000000000000000008183100297BFF00186BF7000029
      FF007B7BF7000000DE003942EF000000DE000000DE000000EF000000B5008484
      7B00D6DEE7007B84AD0018316B00102163004A5A8C004A63940018316B001829
      6B0021316B0029397B0018296B001029630008103100737B8400D6D6D6000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000A5522100DEEFEF00BDB5BD00B5949C00BDB5
      B500CECECE00D6E7EF00DEEFEF00DEEFEF00BDB5BD00B5949C00BDB5B500CECE
      CE00D6E7EF00DEEFEF00DEEFEF00BDB5BD00B5949C00BDB5B500CECECE00D6E7
      EF00DEEFEF00CECEC6006342310063636300000000000031DE001039DE001842
      DE00214AE7002952E7003152E7003152E700315AE700315AE700315AE7003152
      E7003152E7003152E700295AE700295AE700295AE7002152EF002152E700184A
      E700184AE700104AEF00104AEF000842E7000842E7000039E7000039E7000031
      DE000031D6000029C60000219C00000000000000000000000000FF0000000000
      00000000000000000000000000000000000000000000FF0000009C6300009C63
      00009C630000FF000000000000000000000000FFFF0000CECE00003131009CFF
      FF0000639C000000000000313100000000000000000000000000000000000000
      000000000000000000000000000000000000000031000000F7000000FF000808
      FF007B84F7000000E7003939EF000000E7000000E7000000EF000000B5004A52
      6300526BA500102163001021630008215A004252840052639400213173002131
      730021316B0021397B0021397B0021316B002131730010215A00081842005A5A
      6300EFEFEF000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000A5522100DEEFEF00BDE7F700B5E7F700B5E7
      F700C6E7F700DEEFEF00DEEFEF00DEEFEF00D6E7EF00E7DEC600E7DEC600DEDE
      CE00DEEFEF00DEEFEF00DEEFEF00BDD6F700B5CEF700B5CEF700D6E7EF00DEEF
      EF00DEEFEF00CECEC6006342310063636300000000000031DE001842DE00214A
      E7002952E7003152E700315AE700395AE700395AE700395AE700395AE7004263
      E7008C9CEF00BDCEF700E7EFFF000000000000000000E7EFFF00BDCEF7007B9C
      F700295AEF002152EF00104AEF00104AEF000842E7000842E7000039E7000039
      E7000031D6000029C60000219C0000000000FF00000000000000000000000000
      000000000000FF0000009C630000FF000000FF000000FF000000FF000000FF00
      0000FF000000000000000000000000000000003131000000000000CECE000031
      31009CFFFF0000639C0000000000003131000031310000316300003131000031
      630000636300000000000000000000000000000031000000FF000000FF001818
      FF007B84F7000000EF004A4AEF000000EF000000EF000000F7000000BD004A52
      5A005A73AD0010296B0008185200102963004252840042528400183173002131
      7300314A7B0021397300293973002131730029397B0031428400213173002139
      7300081039006B737B00D6D6D600000000000000000000000000636363006363
      6300636363006363630063636300A5522100DEEFEF0021D6FF0010BDEF000063
      F7006BDEF700DEEFEF00DEEFEF00DEEFEF00DED6C600DE9C08004A7B0000FFA5
      2100DEEFEF00DEEFEF00DEEFEF003152EF00BD7B39000031FF00C6C6E700DEEF
      EF00DEEFEF00CECEC6006342310063636300000000000031DE001842DE002952
      E7003152E700315AE700395AE700395AE7004263E7004263E7008C9CEF00F7FF
      FF00000000000000000000000000000000000000000000000000000000000000
      0000EFF7FF007B9CF700184AE700104AEF00104AEF000842E7000039E7000039
      E7000031D6000029C60000219C0000000000000000000000000000000000FF00
      00009C630000FF000000FF000000FF000000000000000000000000000000FF00
      000000000000000000000000000000000000000000000031310000FFFF0000CE
      CE00003131009CFFFF0000639C00000000000000000000000000000000000000
      000000000000006363000000000000000000000031000000FF000808FF002929
      FF008484F7000000F7005A5AF7000000F7000000F7000000FF000000C600424A
      5A004A639C00293973000821630018296B00526394005263940021397B002139
      7300213973002939730029397B0021397B002939730029427B0029397B002942
      8C0021397B0010215A0010214A00525252000000000084BDD60029ADDE0018AD
      DE000884AD0018738C0063636300A5522100DEEFEF0021D6FF00F79C0000C6A5
      39006BDEF700DEEFEF00DEEFEF00DEEFEF00DED6C60063EF4A0063EF4A00FFA5
      2100DEEFEF00DEEFEF00DEEFEF00425ADE00CE6300005A4A8C00C6C6E700DEEF
      EF00DEEFEF00CECEC6006342310063636300000000001039DE001842DE003152
      E700315AE700395AE7004263E7004263E7004263E700BDCEF700000000000000
      0000E7EFFF0094A5F700637BEF003963EF003963EF00527BEF008C9CEF00E7EF
      FF000000000000000000B5BDF700104AEF00104AEF000842E7000842E7000039
      E7000031DE000029C60000219C000000000000000000FF0000009C630000FF00
      0000FF000000FF000000000000000000000063CEFF0084848400000000000000
      000000000000000000000000000000000000000000000084840000639C000000
      000000FFFF000031310063FFFF0000639C0000FFFF0000639C0000FFFF0000FF
      FF00319C9C00000000000063630000000000000031000000FF001008FF003939
      FF00848CFF000000F700525AF7000000F7000000FF000000FF000000C600424A
      5A004A5A94001821630008216300102963004A5A8C005A6B9C00314A8C002139
      7B00213973002939730031427B0029427B0021316B002139730029427B00314A
      8C0021427B002131730021317300081031000000000063B5CE005AC6E70084DE
      FF006BD6FF0052C6F7004294AD00A5522100DEEFEF0021B5FF000031FF0021C6
      DE0084DEF700DEEFEF00DEEFEF00DEEFEF00E7DEC60000630000CEB51800FFA5
      3100DEEFEF00DEEFEF00DEEFEF002152FF00A56B4A00D68C2900CEC6DE00DEEF
      EF00DEEFEF00CECEC6006342310063636300000000001039DE00214AE7003152
      E700395AE7004263E7004263E7004A6BE700BDCEF7000000000000000000A5B5
      F700426BE7004263E7004263E7003963EF003963EF003163EF00295AEF00295A
      EF008C9CEF000000000000000000B5BDF700104AEF00104AEF000842E7000039
      E7000031DE002142C6000021A500000000000000000000000000FF000000FF00
      00000000000000000000C6C6C60063CEFF0094ADAD00319CCE00848484000000
      00000000840000008400000084000063FF000000840000000000000000000000
      00000000000000FFFF0000639C009CFFFF000031310000FFFF0031CECE0031CE
      CE0063FFFF00319C9C000000000000636300000031000808FF001818FF004A4A
      FF00848CFF000000FF00525AF7000000FF000000FF000000FF000000CE00424A
      5200526BA5001029630000184A00182963004A528C004A5A8C0031428400294A
      7B00293973002939730029397B0031427B00314A7B002139840018316B002139
      6B0029427B0029427B0021397B00101839000000000063B5CE0052BDE70084DE
      FF0073D6FF0073D6FF0073ADBD00A5522100DEEFEF0021D6FF0000CEFF0021CE
      F700A5DEDE00DEEFEF00DEEFEF00DEEFEF00E7E7D600FFA52100FFA52100E7CE
      9C00DEEFEF00DEEFEF00DEEFEF00426BFF002152FF00395AF700C6D6EF00DEEF
      EF00DEEFEF00CECEC6006342310063636300000000001039DE002952E700315A
      E7004263E7004263E7004A63E7008C9CEF00000000000000000094A5F700426B
      E700426BE700426BE7004263E7004263E7003963EF003163EF003163EF00295A
      EF002152EF007394F70000000000000000007B9CF700104AEF000842E7000842
      E7001039DE002142C6000021A500000000000000000000000000000000000000
      000063CEFF00C6C6C60063CEFF0094ADAD00319CCE0084848400000000000000
      840000008400319CCE0084848400000084000063FF0000000000000000000000
      00000000000000639C009CFFFF000031630000FFFF0031CECE000031630031CE
      CE0031CECE0063FFFF000000000000636300000031001010FF002121FF004A42
      FF00848CFF000000FF00525AF7000000FF000000FF000000FF000000CE003942
      52005A6BA5002139730008185A0018296B00526394004A5A8C0021397300394A
      8400314A840029427B002942840031427B0042528C002942840031427B002939
      7B0029397B003142840021427B00101039000000000063B5CE0029ADDE0094E7
      FF0073DEFF0073DEFF0073ADBD00A5522100DEEFEF00D6DEE700D6DEDE00D6DE
      E700D6E7EF00D6E7EF00DEEFEF00DEEFEF00D6DEE700D6DEDE00D6DEE700D6E7
      EF00D6E7EF00DEEFEF00DEEFEF00D6DEE700D6DEDE00D6DEE700D6E7EF00D6E7
      EF00DEEFEF00CECEC6006342310063636300000000001842DE002952E700395A
      E7004263E7004A63E7005A73EF00F7FFFF0000000000A5B5F7004A6BE7004A6B
      E7004A6BE700426BE7004263E70000000000000000003163EF003163EF00295A
      EF002152EF002152EF008C9CEF0000000000EFF7FF002152EF00104AEF001039
      DE001039DE002142C6000021A500000000000000000000000000000000000000
      0000C6C6C60063CEFF00C6C6C600319CCE0084848400319CCE00000000008484
      8400319CCE0094ADAD00319CCE00848484000000000000000000000000000000
      00000000000000FFFF000031310000FFFF0031CECE000031310063FFFF0063FF
      FF0000FFFF0000FFFF000000000000636300000031001818FF002929FF004A42
      FF008C8CFF000000FF005A63EF000000FF000808FF000808FF000000CE003942
      5200425A9C0018316B0000185A0018296B0052639C00526B940029428400394A
      840039529400314A8C00314A8C0029427B0029427B0031427B00425A94002942
      84002139730029397300394A840018213900000000005AADC60031ADDE009CE7
      FF007BE7FF007BE7FF0073B5BD00A5522100DEEFEF00CECECE00C6B5BD00C6C6
      CE00CED6DE00D6E7EF00DEEFEF00DEEFEF00CECECE00C6B5BD00C6C6CE00CED6
      DE00D6E7EF00DEEFEF00DEEFEF00CECECE00C6B5BD00C6C6CE00CED6DE00D6E7
      EF00DEEFEF00CECEC6006342310063636300000000001842DE003152E7004263
      E7004A63E7004A6BE70094A5F70000000000E7EFFF00526BE7004A6BE7004A6B
      E7004A6BE700426BE7004263E70000000000000000003163EF003163EF00295A
      EF002152EF002152EF002152EF00E7EFFF00000000007394F700104AEF00104A
      EF001039DE002142C6000021A500000000000000000000000000000000000000
      000000000000C6C6C60063CEFF0094ADAD000000000000000000000000000000
      000000000000319CCE0084848400000000000000000000000000000000000000
      00000000000000639C009CFFFF0031CECE000031310000639C00000000000000
      000000639C0000FFFF000000000000636300000031002121FF002929FF004242
      FF008C8CFF000000FF006363EF000808FF000808FF000808FF000000CE00424A
      52004A5A9C001029630000184A0018296B006373940063739C00394A84003142
      7B00314A8400314A8C0039528C00314A8C002942840029427B00314A84002942
      84002942840021427B0021427B00102139000000000031A5CE0031ADDE00A5EF
      FF007BE7FF007BE7FF007BB5BD00A5522100DEEFEF0021A52100009C0000009C
      21006BC67300DEEFEF00DEEFEF00DEEFEF008CADF7004A6BE700316BFF004A84
      FF00DEEFEF00DEEFEF00DEEFEF00D6CECE00AD849400C67B8400CE8C9400DEEF
      EF00DEEFEF00CECEC6006342310063636300000000001842DE00315AE7004263
      E7004A6BE7004A6BE700CED6FF0000000000A5B5F700526BE7004A6BE7004A6B
      E7004A6BE700426BE7004263E70000000000000000003163EF003163EF00295A
      EF002152EF002152EF002152EF007B9CF70000000000BDCEF700184AE7001842
      DE001039DE002142C60008299C00000000000000000000000000000000000000
      000000000000319CCE00C6C6C600319CCE0084848400319CCE008484840063CE
      FF008484840000000000319CCE00000000000000000000000000000000000000
      00000031310063FFFF0031CECE000031630063FFFF0000000000008484000000
      00000000000063FFFF00000000000063630008083100186BFF0018ADF70021B5
      EF007B9CF7000800FF00636BEF001010FF001010FF001010FF000800CE00424A
      52005263A50010296B0000104A00182963005A6B9C00636B9C004A5A94004252
      9400314A8C00394A8C0052639C00425A9C00314A8C00314A8C0021427B003142
      7B00425294002939840021428C00102142000000000031A5CE0021ADD600A5EF
      FF0084EFFF0084EFFF007BBDBD00A5522100DEEFEF0021A5210000BD9C0000AD
      8C006BC67300DEEFEF00DEEFEF00DEEFEF0084ADF700AD6373005273E7004A84
      FF00DEEFEF00DEEFEF00DEEFEF00D6D6D60029B5EF009C8C9400CE8C9400DEEF
      EF00DEEFEF00CECEC600634231006363630000000000214AE700395AE7004A6B
      E700526BE7005273E700EFF7FF0000000000738CEF00526BE700526BE7004A6B
      E7004A6BE700426BE7004263E70000000000000000003163EF00295AE700295A
      E7002152EF002152E7002152EF004A6BEF0000000000EFF7FF00184AE700184A
      E7002142D6002142C60008299C00000000000000000000000000000000000000
      00000000000000000000319CCE00C6C6C60063CEFF00C6C6C60063CEFF00C6C6
      C60063CEFF000000000000000000000000000000000000000000000000000000
      0000003131009CFFFF0031CECE0000FFFF0000FFFF0000000000008484000000
      000031CECE0000FFFF000031310000639C000029310021E7F70052F7FF005AFF
      FF008CADFF000808FF007373F7001010FF001010FF001010FF000808CE003942
      520052639C00213173000018520021316B006B73A50063739C0039528C00525A
      9C00394A9400394A8C0039528C004A5A94004A5A940042529400314A8C002942
      7B00314A8400394A8C00314A8C00102142000000000052B5D600089CCE00BDEF
      FF0084EFFF0084EFFF0084BDBD00A5522100DEEFEF0021A5420000A5D60000BD
      9C006BC67300DEEFEF00DEEFEF00DEEFEF0084ADF700AD637300945273004A84
      FF00DEEFEF00DEEFEF00DEEFEF00DED6DE0010BDF7004A94E700CE8C9400DEEF
      EF00DEEFEF00CECEC600634231006363630000000000214AE7004263E7004A6B
      E7005273E7005273E70000000000000000005273E700526BE7004A6BE7004A6B
      E7004A63E7004263E7004263E7000000000000000000315AE700295AE700295A
      E7002152EF002152E700184AE700184AE7000000000000000000184AE700214A
      E7002142D6002142C60008299C00000000000000000000000000000000000000
      000000000000000000000000000063CEFF00C6C6C60063CEFF0094ADAD00319C
      CE0094ADAD0000000000319CCE0094ADAD00319CCE0094ADAD00000000000000
      000000639C00319C9C009CFFFF0063FFFF0063FFFF00008484000000000031CE
      CE0000FFFF000031310000639C0000000000082931004ACEFF004AC6FF005A84
      EF008C94FF001010FF008484FF001818FF001818FF002121FF001010CE00424A
      52004A639C0018296B000821630018316B005A739C007384AD00425A9C00425A
      94004A5A9C0052639C004A5A94004A5A94004252940052639C004A5A9400294A
      840029427B00394A8400394A9400101839000000000052B5D60029ADDE00BDF7
      FF008CF7FF008CF7FF0084BDBD00A5522100DEEFEF0021A53900009C630021A5
      1800CED6C600DEEFEF00DEEFEF00DEEFEF0084ADF7005263D600635AB500B5B5
      C600DEEFEF00DEEFEF00DEEFEF00DEDEDE00BD7B84008C8CB500DEA58C00DEEF
      EF00DEEFEF00CECEC600634231006363630000000000214AE7004263E700526B
      E7005A73EF005A73EF0000000000000000005273E700526BE700526BE7004A6B
      E7004A63E7004263E7004263E7000000000000000000315AE700295AE700295A
      E7002152E7002152E7002152E700184AE70000000000000000002152E700214A
      E7002142D6002142C6001029A500000000000000000000000000000000000000
      0000000000000000000063CEFF0094ADAD0063CEFF0094ADAD0063CEFF00C6C6
      C60063CEFF000000000000000000319CCE0094ADAD0063CEFF00000000000000
      00000000000000639C00319C9C009CFFFF009CFFFF009CFFFF009CFFFF009CFF
      FF000031310000639C000000000000000000080831003131FF004239FF00524A
      FF008C8CFF001818FF008484FF002121FF002121FF002121FF001810CE004A52
      52004A639C0010215A0008185A0018316B005A6B9C006B7BA50052639C006373
      A5005263A5006373A500526BA5004A5A9C005263A500425A940042528C004252
      8C00314A840029427B00394A8C0021294200000000004AB5D60029ADDE00C6F7
      FF008CF7FF008CF7FF0084C6BD00A5522100DEEFEF00CEE7E700DEEFEF00DEEF
      EF00DEEFEF00DEEFEF00DEEFEF00DEEFEF00DEEFF700DEEFEF00D6E7EF00DEEF
      EF00DEEFEF00DEEFEF00DEEFEF00DEEFF700DEEFEF00D6E7EF00D6E7EF00DEEF
      EF00DEEFEF00CECEC6006342310063636300000000002952E7004A63E7005A73
      EF005A73EF005A7BEF00E7EFFF0000000000738CEF005273E7004A6BE7004A6B
      E7004A63E7004263E7004263E7000000000000000000315AE700295AE7002952
      E7002952E7002152E7002152E7003963EF0000000000EFF7FF002152E700214A
      E7002142D6002142C6001029A500000000000000000000000000000000000000
      00000000000063CEFF00C6C6C60063CEFF0094ADAD0063CEFF00EFEFEF0063CE
      FF00C6C6C60063CEFF00C6C6C60000000000319CCE0094ADAD00000000000000
      0000000000000000000000639C000063630000639C000063630000639C000063
      630000639C00000000000000000000000000080831005252FF008C8CF700A5A5
      F700A5A5FF003131FF008484FF002121FF002121FF002929FF001818CE003942
      52004A5A940008215A000018520021316B006B73A5007384AD004A5A94005A6B
      9C005A73A5006B7BAD005263A5004A639C0052639C004A5A9C00425294004252
      8C0039528C002942840031428400182139000000000029ADDE0029ADDE00BDF7
      FF0094FFFF0094FFFF008CCEBD00C65A0000F7A52100F7A52100F7A52100F7A5
      2100F7A52100F7A52100F7A52100F7A52100F7A52100F7A52100F7A52100F7A5
      2100F7A52100F7A52100F7A52100F7A52100F7A52100F7A52100F7A52100F7A5
      2100F7A52100DEA563006B4A310063636300000000003152E7004A6BE7005A7B
      EF005A7BEF005A7BEF00CED6FF0000000000A5B5F700526BE7004A6BE7004A6B
      E7004A63E7004263E7004263E70000000000000000003152E7003152E7002952
      E7002952E7002152E700214AE700738CEF0000000000CED6FF00214AE7002952
      DE00294AD6002142C6001029A500000000000000000000000000000000000000
      000000000000C6C6C60063CEFF00C6C6C60063CEFF00EFEFEF0063CEFF00EFEF
      EF0063CEFF00C6C6C60000000000319CCE0094ADAD00319CCE00000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000080831008C94FF00DEE7FF00DEDE
      F700D6D6F700A5A5F7009494F7003131FF002929FF002929FF002121CE003139
      520042529C0008215A000010520021316B007384A5007B8CB5005263A5005A6B
      A5006373A5007384AD006373A500526BA5004A639C005A6B9C004A5A94003952
      9400314A840042529400314A9400102142005AC6E70042B5DE0031B5DE00ADDE
      F7009CFFFF009CFFFF008CCEBD00AD420000D66B0000D66B0000D66B0000D66B
      0000D66B0000D66B0000D66B0000D66B0000D66B0000D66B0000D66B0000D66B
      0000D66B0000D66B0000DE7B1800FFCE9C00DE7B1800F7BD7B00EF9C4A00846B
      7B00316BFF00C68442007B634A0063636300000000003152E700526BE7005A7B
      EF00637BEF00637BEF00A5B5F70000000000E7EFFF005273E700526BE7004A6B
      E7004A63E7004263E7004263E70000000000000000003152E7003152E7002952
      E7002952E700214AE700214AE700E7EFFF00000000008C9CEF002952E7002952
      DE00294AD6002142C6001029A500000000000000000000000000000000000000
      00000000000000000000C6C6C600319CCE0094ADAD0063CEFF00C6C6C6000000
      000094ADAD0063CEFF000000000094ADAD0063CEFF00C6C6C600319CCE0094AD
      AD00000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000029293100DEE7FF0029A5F70029AD
      F70052BDF700C6DEF700C6CEF700A5A5EF006B6BF7004242FF002121CE003139
      52003142840029396B0018296300182963006373A5007B84B5005263A5007384
      B5006B7BAD006373AD006373AD00848CAD005A6BAD004252940042529400314A
      8C00314A8C0039528C00314A9400182142005AC6E7005AC6E7005AC6E700ADDE
      F700A5FFFF00A5FFFF009CF7EF00AD522100CE732100E7944200E7944200E794
      4200E7944200E7944200E7944200E7944200E7944200E7944200E7944200E794
      4200E7944200E7944200E7944200E7944200E7944200E7944200E7944200E794
      4200CE732100A53900006363630000000000000000003152E7005273E7006B84
      EF006B84EF006B84EF006B84EF00F7FFFF0000000000A5B5F700526BE7004A6B
      E7004A63E7004263E7004263E7000000000000000000315AE7003152E7003152
      E7002952E7002952E7008C9CEF0000000000EFF7FF00315AE7002952E7002952
      DE00294AD6002142C6001029A500000000000000000000000000000000000000
      000000000000000000000000000000000000319CCE0094ADAD0063CEFF000000
      000000000000000000000000000063CEFF00C6C6C600319CCE0094ADAD000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000C6C6BD009C9CCE004AADFF0029C6
      F70073E7FF007BE7FF009CDEFF00BDDEFF00D6D6F700B5B5FF005252C6001821
      3900636B9C00949CB5008C9CC600526B94007384AD00737BA5005263A5005A73
      A5006B7BAD00848CB5006373AD005A6BA500526BA5005263A500425A94004252
      8C0039529400294A8400314A8400182139005AC6E7005AC6E7005AC6E700B5E7
      F700ADFFFF00ADFFFF00ADFFFF009CCEBD008C947B008C947B008C947B008C94
      7B008C947B008C947B008C947B008C947B008C947B008C947B008C947B008C94
      7B008C947B007B8C7B0094947B0042635A0063392100845A420094735A009C7B
      5A009C7B630063636300000000000000000000000000315AE7005A73EF006B84
      EF006B84EF006B84EF006B84EF00A5B5F700000000000000000094A5F7004A6B
      E7004A6BE7004263E7004263E7004263E700395AE700315AE7003152E7003152
      E7003152E7005273E70000000000000000008C9CEF002952E7002952E7002952
      DE00294AD6002142C6001029A500000000000000000000000000000000000000
      00000000000000000000000000000000000000000000319CCE00C6C6C60063CE
      FF00C6C6C600003131000000000094ADAD0000000000C6C6C600319CCE000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000BDBDCE00524ABD006BB5
      FF005AD6FF006BDEFF007BE7FF008CE7FF00ADEFFF00DEF7FF009CA5CE001818
      2900739CAD00E7EFF700F7F7FF00C6CEE7009CADBD007B8CAD006373A5006373
      AD006373AD007B8CB500637BB5005263AD004A5A9C004A5A9C0042529400394A
      8C00314A8C0039529400294A8C00102139005AC6E70063C6E70063C6EF0073CE
      E700E7FFFF00D6FFFF00CEFFFF00C6FFFF00BDFFFF00BDFFFF00BDFFFF00BDFF
      FF00BDFFFF00BDFFFF00BDFFFF00BDFFFF00BDFFFF00BDFFFF00BDFFFF00BDFF
      FF00BDFFFF0094E7FF00BDF7FF0031B5DE0063524A0063636300000000000000
      00000000000000000000000000000000000000000000315AE7005A7BEF006B84
      EF00738CEF00738CEF006B84EF00637BEF00BDCEF7000000000000000000A5B5
      F7004A6BE7004A63E7004263E7004263E700395AE700395AE7003152E7003152
      E7008C9CEF000000000000000000B5BDF7003152E7002952E7003152E7002952
      DE00294AD6002142C6001029A500000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000319CCE00C6C6
      C60063CEFF00C6C6C60000000000319CCE000000000000000000000000000031
      6300000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000C6BDC6004A42
      BD006BB5FF0073DEFF0084E7FF008CEFFF008CEFFF0084EFFF0094DEEF005A7B
      840029424200637B8400BDD6D60000000000F7F7FF00BDC6DE0094A5BD00737B
      AD006373AD006373A5007384AD00636BAD005263A5004A5A9C00425294003952
      9400314A8400314A8400394A9400182142005AC6E70063C6E7008CE7FF0031BD
      DE0021ADD60039B5DE007BCEE70094D6EF00B5E7F700EFFFFF00DEFFFF00C6FF
      FF00C6FFFF00C6FFFF00C6FFFF00C6FFFF00C6FFFF00C6FFFF00C6FFFF00C6FF
      FF00C6FFFF0094E7FF00C6F7FF0042B5DE00525A5A0063636300000000000000
      00000000000000000000000000000000000000000000395AE7005A7BEF00738C
      EF007B94EF00738CEF00738CEF006B84EF00637BEF00BDCEF700000000000000
      0000E7EFFF00A5B5F7006B84EF004263E7004263E7005273E7008C9CEF00E7EF
      FF000000000000000000B5BDF7003152E7003152E7003152E7003152E7003152
      E700294AD6002142C6001029A500000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000000000319C
      CE0094ADAD0063CEFF000000000094ADAD00319CCE0094ADAD00003131000031
      6300000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000000000BDBD
      C6004A4ABD006BB5FF007BE7FF0084EFFF008CEFFF00A5FFFF008CEFFF0094FF
      FF008CCED600527B8400293942005A738400D6DEE70000000000F7F7FF00BDC6
      DE008C94BD007B8CAD005A73A500526BA5004A639C004A5A9C004A5A9C00314A
      8C00314A8C00294284004252940018294A005AC6E700A5DEF700A5F7FF008CF7
      FF008CF7FF007BEFF7006BDEF7004ACEE70031BDDE0021ADD60063C6E700EFFF
      FF00D6FFFF00D6FFFF00D6FFFF00D6FFFF00D6FFFF00D6FFFF00D6FFFF00D6FF
      FF00D6FFFF009CE7FF00CEF7FF0073CEE700425A630063636300000000000000
      00000000000000000000000000000000000000000000395AE7006B84EF007B94
      EF008C9CEF007B94EF007B94EF00738CEF006B84EF00637BEF00A5B5F700F7FF
      FF00000000000000000000000000000000000000000000000000000000000000
      0000F7FFFF0094A5F700395AE700315AE700315AE7003152E7003152E7002952
      DE00294AD6002142C6001029A500000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000319CCE0094ADAD0063CEFF0094ADAD000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000BDBDC6004A4ABD006BBDFF0084EFFF008CEFFF007BEFFF00ADFFFF00A5F7
      FF008CF7FF00A5FFFF00A5E7EF00527B7B0021394200637B8400BDD6D6000000
      0000EFEFFF00BDC6DE00849CBD006B7BAD004A639C00314A8C00394A9400425A
      9400314A94002942840031428400182142005AC6E700ADDEF700ADFFFF0094FF
      FF0094FFFF0094FFFF0094FFFF0094FFFF0094FFFF0094FFFF0029BDDE007BCE
      E700F7FFFF00EFFFFF00EFFFFF00EFFFFF00E7FFFF00E7FFFF00E7FFFF00E7FF
      FF00E7FFFF00A5E7FF00CEF7FF008CD6EF003163730063636300000000000000
      000000000000000000000000000000000000000000004263E700738CEF008C9C
      EF0094A5F7008C9CEF007B94EF007B94EF006B84EF006B84EF006B84EF006B84
      EF00A5B5F700CED6FF00F7FFFF000000000000000000F7FFFF00CED6FF0094A5
      F7005A73EF004A63E7004263E7004263E700395AE700395AE700315AE7003152
      E700294AD6002142C60008299C00000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000031310000000000319CCE0094ADAD00319CCE000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000BDBDC600524ABD006BBDFF008CEFFF00B5FFFF007BEFFF00ADFF
      FF00BDFFFF0094F7FF008CEFFF00ADFFFF009CD6D600527B8400314A4A005A73
      8400D6DEE70000000000EFEFFF00B5C6DE00949CB500637BA50042528C004252
      8C00314A8C00294A8C0029428400101839005AC6E700ADDEF700ADFFFF009CFF
      FF009CFFFF009CFFFF009CFFFF009CFFFF009CFFFF009CFFFF008CF7FF0039BD
      DE0021ADD60039B5DE005ABDDE007BCEE700ADDEEF00BDE7F700F7FFFF00F7FF
      FF00F7FFFF00BDEFFF00E7FFFF00BDE7F700317B940063636300000000000000
      000000000000000000000000000000000000000000004A63E700738CEF0094A5
      F700A5B5F70094A5F7008C9CEF007B94EF00738CEF00738CEF006B84EF006B84
      EF006B84EF00637BEF00637BEF005A7BEF005A7BEF005A7BEF005A73EF005A73
      EF005A73EF00526BE7004A6BE7004A6BE7004263E7004263E700395AE7003152
      E700294AD6001839B50008299C00000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000003131000031310000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000BDBDC6004A4ABD006BBDFF008CEFFF00B5FFFF007BEF
      FF0084EFFF00BDFFFF00ADFFFF008CEFFF009CFFFF00C6FFFF00CEEFF700BDBD
      BD004A5A63006B848C00BDD6DE0000000000EFF7FF00CED6DE0094A5BD00636B
      9400314A8C0029428C00294A8C00101839005AC6E70073CEE700CEFFFF009CFF
      FF009CFFFF009CFFFF009CFFFF009CFFFF009CFFFF00A5FFFF00D6FFFF00D6FF
      FF00C6FFFF00BDFFFF0094EFF7007BEFF7004ACEE70039BDDE0021B5DE0018A5
      D60039B5DE0073C6E7007BCEE7008CD6EF003194B50063636300000000000000
      000000000000000000000000000000000000000000004A63E7007B94EF0094A5
      F700A5B5F70094A5F70094A5F7007B94EF007B94EF00738CEF00738CEF006B84
      EF006B84EF006B84EF006B84EF00637BEF00637BEF00637BEF00637BEF005A7B
      EF005A73EF005A73E700526BE7004A6BE7004A63E7004263E700315AE7003152
      E7002142D6001839B50008299C00000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000313100003131000031
      3100000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000BDBDC600524ABD006BBDFF008CEFFF00B5FF
      FF0094F7FF0084EFFF00B5FFFF00BDFFFF00C6F7FF00DEF7FF00000000000000
      0000FFFFFF00C6C6C600525A630063848C00D6DEE70000000000FFFFFF00C6CE
      DE008C9CB50063739C00425A9400182139000000000063BDD600E7F7FF00A5FF
      FF009CFFFF009CFFFF009CFFFF009CFFFF009CFFFF00D6FFFF0094D6EF005AAD
      C6005AB5D6007BCEE7008CD6EF00B5E7F700C6EFF700DEFFFF00D6FFFF00C6FF
      FF00B5FFFF0052C6E700428CA500529CBD006363630000000000000000000000
      000000000000000000000000000000000000000000005A73EF006B84EF0094A5
      F70094A5F70094A5F7008C9CEF007B94EF00738CEF00738CEF006B84EF006B84
      EF00637BEF00637BEF00637BEF005A7BEF005A7BEF005A7BEF005A73EF005A73
      EF005273E700526BE7004A6BE7004A6BE7004263E700395AE7003152E7002952
      DE002142D6001839B5001839B500FFEFFF000000000000000000000000000000
      0000000000000000000000000000003131000031310000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000BDBDC6004A4ABD006BBDFF008CEF
      FF00BDFFFF00A5F7FF00B5F7FF00E7FFFF00F7FFFF0000000000000000000000
      0000000000000000000000000000BDBDBD004A5A63006B848C00BDD6D6000000
      0000F7F7FF00ADB5CE008494B5002931420000000000000000005ABDDE00EFFF
      FF00E7FFFF00CEFFFF00CEFFFF00B5FFFF00CEFFFF00C6EFF7005294A5006363
      6300000000000000000000000000000000007BBDD60063B5CE004AB5D60063BD
      D6005ABDDE004AB5DE0063636300000000000000000000000000000000000000
      00000000000000000000000000000000000000000000CED6FF004A63E7006B84
      EF007B94EF00738CEF006B84EF00637BEF005A7BEF005A73EF005A73EF00526B
      E700526BE700526BE7004A6BE7004A6BE7004A6BE7004A6BE7004A63E7004263
      E7004263E700395AE700395AE700395AE700315AE7003152E7002952DE001842
      DE001839C6000831BD00ADB5DE00000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000BDBDC6005252C6005AAD
      EF00C6EFFF00DEFFFF0000000000000000000000000000000000000000000000
      000000000000000000000000000000000000FFFFFF00C6C6C600525A63006B84
      8C00A5A5B500C6C6C60000000000949CA50000000000000000000000000063BD
      DE004AB5DE0073C6E7007BCEE7009CDEEF00BDE7F7004AADCE00636363000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000BDCEF700637B
      EF004263E7004263E700395AE700315AE7003152E7003152E7003152E7003152
      E7003152E7003152E7003152E7003152E7002952E7002952E7002952E700214A
      E700214AE700214AE700214AE700214AE7001842DE001842DE001039DE001039
      DE003152CE00ADB5DE0000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000C6C6D6000808
      3900FFFFF7000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000000000C6C6
      C60031314200ADADAD0000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000FFEFFF000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000005221
      3100390018000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000009C9C9C009C9C9C00848484008C8C8C009C9C9C000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000008484840084848400000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000C68C63007B42
      3100390018000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000000000009C9C9C008484
      84007B7B7B009C9C9C00A5948C00B59C9400AD94940094847B006B6363009C9C
      9C00000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000084848400848484008484840084848400848484008484
      8400000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000CE9C7300DEAD84007B42
      3100390018000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000009C9C9C0094847B00CEA59C00E7B5
      B5006B636300B5948C00CEAD9C00FFC6C600FFCECE00FFCECE00947B7B009494
      94009C9C9C009C9C9C0000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000084B5840084B5
      8400086B0800086B080010731000107310001873180018731800187318001873
      1800187B1800187B1800107B1000107B1000107B1000107B1000087B0800087B
      0800087B0800087B0800007B0000007B0000007B0000007B0000007300000073
      00007BB57B007BB57B0000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00008484840084848400848484000000000000000000C6C6C600848484008484
      8400848484008484840000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000BD946B00DEB58C00E7B58C007B42
      3100390018000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000C6A59400F7BDBD00FFC6C600FFC6
      C600DEADAD00C6A59400D6AD9C00FFC6C600FFC6C600FFCECE00947373006B63
      630094847B00AD8C8C00736363006B6B6B000000000000000000000000000000
      000000000000000000000000000000000000000000000000000084B5840084B5
      8400086B0800086B080010731000107310001873180018731800187318001873
      1800187B1800187B1800107B1000107B1000107B1000107B1000087B0800087B
      0800087B0800087B0800007B0000007B0000007B0000007B0000007300000073
      00007BB57B007BB57B0000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000848484008484
      84008484840000000000000000008484840000000000C6C6C600C6C6C600C6C6
      C600848484008484840084848400848484000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000CEAD8C00CEAD8400EFC69C00E7B58C008452
      4A00390018000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000BDA59C00CEAD9C00EFBDB500FFC6C600FFC6
      C600FFC6C600E7B5AD00E7B5AD00FFC6C600FFC6C600FFC6C600CE9494009C84
      7B00E7B5AD00FFC6C600EFBDB5008C7373006363630000000000000000000000
      0000000000000000000000000000000000000000000000000000108410001084
      1000188C1800188C180029942900299429002994290029942900299429002994
      29002994290029942900299C2900299C2900219C2100219C210018A5180018A5
      180010A5100010A5100008A5080008A50800009C0000009C0000009400000094
      0000006B0000006B000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000008484840084848400848484000000
      000000000000848484000000000000000000848484008484840000000000C6C6
      C600C6C6C600C6C6C60084848400848484008484840084848400000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000009473
      84009473840084636B009C737300BD9C7B00D6AD8C00EFC69C00DEB58C008452
      4A005A2942003900180000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000008C8484008C7B7B00C6A59400DEAD9C00FFC6C600FFC6
      C600FFC6C600FFC6C600FFC6C600FFC6C600FFC6C600FFC6C600FFC6BD00EFBD
      B500FFBDBD00FFC6C600FFC6C600FFBDBD008C7B7B0000000000000000000000
      0000000000000000000000000000000000000000000000000000108410001084
      1000188C1800188C180029942900299429002994290029942900299429002994
      29002994290029942900299C2900299C2900219C2100219C210018A5180018A5
      180010A5100010A5100008A5080008A50800009C0000009C0000009400000094
      0000006B0000006B000000000000000000000000000000000000000000000000
      0000000000000000000084848400848484008484840000000000000000008484
      8400000000000000000084848400848484000000000000000000848484000000
      000000000000C6C6C600C6C6C600C6C6C6008484840084848400000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000008C63520084636B00734239008C63
      52009C6B5A00A57B6300BD947B00C6A58400DEB59400EFC69C00DEB58C00B58C
      6B006B3931004A18210039001800522131000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000B59C8C00DEADAD00B58C8C00C6A59400D6AD9C00FFBDBD00FFBD
      BD00FFBDBD00FFBDBD00FFBDBD00FFBDBD00FFBDBD00FFBDBD00FFBDBD00FFBD
      BD00FFBDBD00FFBDBD00FFBDBD00E7ADAD009C94940000000000000000000000
      0000000000000000000000000000000000000000000000000000188C1800188C
      18002994290029942900319C3100319C3100399C3900399C3900399C3900399C
      390039A5390039A53900A5D6A500A5D6A500000000000000000021AD210021AD
      210018B5180018B5180010B5100010B5100008AD080008AD0800009C0000009C
      0000007B0000007B000000000000000000000000000000000000000000000000
      0000000000000000000084848400000000000000000084848400000000000000
      0000848484008484840000000000000000008484840000000000000000000000
      0000C6C6C600C6C6C60084848400000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000B59C94008C6352008C635200AD846B00B59C7B00BD9C
      7B00BD9C7B00BD9C7B00C6A58400D6AD8C00EFC69C00EFCEA500DEBD9400CEAD
      8C00BD9C7300BD946B0084524A00632929004208210073525A00000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000C6A59400E7ADA500FFBDBD00FFBDBD00FFB5B500F7B5B500FFBDBD00FFBD
      BD00FFBDBD00FFBDBD00FFBDBD00FFBDBD00FFBDBD00FFBDBD00FFBDBD00FFBD
      BD00FFBDBD00FFBDBD00FFBDBD00B58C8C008C8C8C0000000000000000000000
      0000000000000000000000000000000000000000000000000000188C1800188C
      18002994290029942900319C3100319C3100399C3900399C3900399C3900399C
      390039A5390039A53900A5D6A500A5D6A500000000000000000021AD210021AD
      210018B5180018B5180010B5100010B5100008AD080008AD0800009C0000009C
      0000007B0000007B000000000000000000000000000000000000000000000000
      000000000000000000008484840084848400C6C6C600C6C6C600848484008484
      8400000000000000000084848400000000000000000000000000C6C6C600C6C6
      C60084848400000000000000000084848400C6C6C60084848400000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000B59C9400A57B6300BD9C7B00BDA58400C6A58C00C6AD8C00D6AD
      8C00DEB59400DEBD9400E7BD9C00EFCEA500FFD6AD00FFD6AD00EFCEA500DEBD
      9400D6AD8C00C6A58C00BD9C7B00BD947300946352004A182100522131000000
      000000000000000000000000000000000000000000000000000000000000C6AD
      A500D6AD9C00FFB5B500FFB5B500FFB5B500FFB5B500FFB5B500FFB5B500FFB5
      B500FFB5B500FFB5B500F7B5B500F7B5AD00F7B5AD00FFB5B500FFB5B500FFB5
      B500FFB5B500FFB5B500FFB5B500AD8484005A5A5A008C7B7B00947373006363
      6300000000000000000000000000000000000000000000000000219421002194
      2100399C3900399C390042A5420042A542004AA54A004AA54A0042A5420042A5
      420042A5420042A5420000000000000000000000000000000000000000000000
      000021B5210021B5210018B5180018B5180008B5080008B5080008A5080008A5
      0800007B0000007B000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000008484840084848400C6C6C600C6C6
      C60084848400000000000000000000000000C6C6C600C6C6C600848484000000
      00000000000084848400C6C6C600C6C6C600C6C6C60084848400000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000AD8C7B00B5947B00BDA58400C6AD8C00D6B59C00DEC6A500EFC6A500F7CE
      AD00FFE7BD00FFE7BD00FFE7BD00FFE7BD00FFE7BD00FFE7BD00FFDEBD00FFDE
      B500EFC6A500E7BD9C00D6B59400CEAD8C00BD9C7B00B58C6B00632929004208
      210000000000000000000000000000000000000000000000000000000000CEAD
      A500D6AD9C00F7ADA500FFB5B500FFB5B500FFB5B500FFB5B500FFB5B500FFB5
      B500F7ADAD00DEBDBD000000000000000000D6B5AD00CEAD9C00DEAD9C00FFAD
      AD00FFB5B500FFB5B500FFB5B500F7ADAD00DE9C9C00EFADAD00FFB5B5007B63
      6300848484000000000000000000000000000000000000000000219421002194
      2100399C3900399C390042A5420042A542004AA54A004AA54A0042A5420042A5
      420042A5420042A5420000000000000000000000000000000000000000000000
      000021B5210021B5210018B5180018B5180008B5080008B5080008A5080008A5
      0800007B0000007B000000000000000000000000000084848400C6C6C600C6C6
      C600C6C6C600C6C6C600C6C6C600C6C6C600C6C6C600C6C6C600848484008484
      84000000000000000000C6C6C600C6C6C6008484840000000000000000008484
      8400C6C6C600C6C6C6000000000000000000C6C6C600C6C6C600848484000000
      000000000000000000000000000000000000000000000000000000000000BD9C
      8C00B59C8400C6AD9400CEB59C00DEC6A500F7D6B500FFDEBD00FFE7BD00F7CE
      AD00A55A3100D67B4A00CE845200CE845200CE845200E79C6B00E79C6B00CE84
      5200FFDEB500FFD6B500EFCEA500E7BD9C00D6B59400C6A58C00BD9473007342
      3900420821000000000000000000000000000000000000000000000000000000
      0000C6A59C00CEA59400F7ADA500FFADAD00FFADAD00FFADAD00FFADAD00EFA5
      A500BDADAD000000000000000000000000000000000000000000CEADA500CEA5
      9400EFADA500FFADAD00FFADAD00FFADAD00FFADAD00FFADAD00FFADAD00CE94
      9400636363000000000000000000000000000000000000000000299429002994
      290042A5420042A542004AA54A004AA54A004AA54A004AA54A004AA54A004AA5
      4A0042A5420042A5420042AD420042AD42000000000000000000000000000000
      0000000000000000000018B5180018B5180010AD100010AD100008A5080008A5
      0800088408000884080000000000000000000000000084848400C6C6C600C6C6
      C600C6C6C600C6C6C600C6C6C600C6C6C60000FF000000840000C6C6C6008484
      8400848484008484840084848400000000000000000084848400C6C6C600C6C6
      C6000000000000000000FF000000FF00000000000000C6C6C600848484000000
      0000000000000000000000000000000000000000000000000000B59C8C00B59C
      8C00C6AD9400D6BDA500E7CEB500FFDEBD00FFE7C600FFE7C600FFE7C600FFDE
      BD00B5845A009C421800AD421000C6632900C6632900AD421000A5522900D6A5
      7B00FFDEBD00FFDEBD00FFDEBD00FFD6B500E7C6A500D6B59400C6A58C00BD94
      7300632929005221310000000000000000000000000000000000000000000000
      000000000000C6AD9C00CEA59400FFADAD00FFADAD00FFADAD00FFADAD00AD8C
      8C0000000000000000000000000000000000000000000000000000000000CEAD
      9C00CEA59400F7ADA500FFADAD00FFADAD00FFADAD00FFADAD00FFADAD00FFAD
      AD00AD9C9C000000000000000000000000000000000000000000299429002994
      290042A5420042A542004AA54A004AA54A004AA54A004AA54A004AA54A004AA5
      4A0042A5420042A5420042AD420042AD42000000000000000000000000000000
      0000000000000000000018B5180018B5180010AD100010AD100008A5080008A5
      0800088408000884080000000000000000000000000084848400C6C6C600C6C6
      C600C6C6C600C6C6C600C6C6C600C6C6C600C6C6C600C6C6C600C6C6C6008484
      840084848400848484000000000084848400C6C6C600C6C6C600000000000000
      0000FF000000FF000000FF000000FF000000FF00000000000000C6C6C6008484
      84000000000000000000000000000000000000000000B59C8C00B59C8C00C6AD
      9C00D6BDA500EFD6BD00FFE7C600FFE7C600FFE7C600FFE7C600FFE7C600FFE7
      C600FFF7D600C69473008C290000942900009429000084391000F7CEAD00FFEF
      CE00FFDEBD00FFDEBD00FFDEBD00FFDEBD00FFDEB500EFC6A500D6B59C00C6AD
      8C00B58C6B004A18210052213100000000000000000000000000000000009C94
      94007B6B6B00BD948C00DEAD9C00FFA5A500FFADAD00FFADAD00DE949400A5A5
      A500000000000000000000000000000000000000000000000000000000000000
      0000C6AD9C00D6A59400FFA5A500FFADAD00FFADAD00FFADAD00FFADAD00D69C
      9C00000000000000000000000000000000000000000000000000319C3100319C
      31004AA54A004AA54A0052AD520052AD520052AD520052AD52004AAD4A004AAD
      4A004AA54A004AA54A0042AD420042AD420039AD390039AD3900000000000000
      00000000000000000000000000000000000018AD180018AD180018A5180018A5
      1800108410001084100000000000000000000000000084848400C6C6C600C6C6
      C600C6C6C600C6C6C600C6C6C600C6C6C600C6C6C600C6C6C600C6C6C6008484
      84008484840084848400C6C6C600C6C6C600C6C6C60000000000FF000000FF00
      0000FF000000FF000000FF000000FF000000FF00000000000000C6C6C600C6C6
      C6008484840000000000000000000000000000000000CEAD9C00C6AD9C00D6BD
      A500EFD6BD00FFE7CE00FFE7CE00FFE7CE00FFE7CE00FFE7CE00FFE7C600FFE7
      C600FFEFCE00C69C7B00842900009C31000094290000A5522900FFDEBD00FFE7
      C600FFE7C600FFE7BD00FFDEBD00FFDEBD00FFDEBD00FFDEBD00E7CEAD00D6BD
      9C00C6AD8C00946352005221310000000000000000000000000000000000D6A5
      9400FFA5A500FFA5A500FFA5A500FFA5A500FFA5A500FFA5A500A57B7B000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000CEADA500CEAD9400EFA59C00FFA5A500FFA5A500FFA5A500AD7B7B00A5A5
      A500000000000000000000000000000000000000000000000000319C3100319C
      31004AA54A004AA54A0052AD520052AD520052AD520052AD52004AAD4A004AAD
      4A004AA54A004AA54A0042AD420042AD420039AD390039AD3900000000000000
      00000000000000000000000000000000000018AD180018AD180018A5180018A5
      1800108410001084100000000000000000000000000084848400000000000000
      000000000000000000000000000000000000000000000000000000000000C6C6
      C600848484008484840084848400C6C6C60000000000FF000000FF000000FF00
      0000FF000000FF000000FF000000FF000000FF000000FF00000000000000C6C6
      C60084848400000000000000000000000000BDA59C00BDA59C00D6BDA500E7CE
      B500FFE7CE00FFE7D600FFE7CE00FFE7CE00FFE7CE00FFE7CE00FFE7CE00FFE7
      CE00FFEFD600C69C7B00842900009C31000094290000A5522900FFDEBD00FFE7
      CE00FFE7C600FFE7C600FFE7C600FFE7C600FFE7C600FFE7C600FFDEBD00E7C6
      AD00D6BD9C00C6A5840042082100522131000000000000000000C6A59400D6A5
      9400FFA5A500FFA5A500FFA5A500FFA5A500FFA5A500FFA5A5007B6363000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000CEAD9C00DEA59400FFA5A500FFA5A500FFA5A5007B5A5A006363
      6300949494000000000000000000000000000000000000000000399C3900399C
      390052AD520052AD520000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000189C1800189C
      1800188418001884180000000000000000000000000084848400848484008484
      8400848484008484840084848400848484008484840084848400848484000000
      0000C6C6C6008484840084848400C6C6C60000000000FF000000FF000000FF00
      0000FF000000FF000000FF000000FF000000FF000000FF00000000000000C6C6
      C600C6C6C600848484000000000000000000BDA59C00CEB5A500DEC6B500F7DE
      C600FFEFD600FFEFD600FFEFD600FFEFD600FFEFD600FFE7CE00FFE7CE00FFE7
      CE00FFEFD600C69C7B00842900009C31000094290000A55A3100FFDEC600FFE7
      CE00FFE7C600FFE7C600FFE7C600FFE7C600FFE7C600FFE7C600FFE7C600F7D6
      B500DEC6A500CEB59C0084524A006B4252000000000000000000C69C8C00DEA5
      9400FF9C9C00FF9C9C00FF9C9C00FF9C9C00FF9C9C00FF9C9C00736363000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000CEAD9C00CEA59400FF9C9C00FF9C9C00FF9C9C00EF949400AD73
      7300846363006363630000000000000000000000000000000000399C3900399C
      390052AD520052AD520000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000189C1800189C
      1800188418001884180000000000000000000000000084848400C6C6C600C6C6
      C600C6C6C600C6C6C600C6C6C600C6C6C600C6C6C600C6C6C600C6C6C6008484
      840000000000C6C6C6000000000084848400C6C6C60000000000FF000000FF00
      0000FF000000FF000000FF000000FF000000FF000000FF000000000000000000
      0000C6C6C600848484000000000000000000CEB5A500D6C6B500E7D6C600FFE7
      D600FFEFD600FFEFD600FFEFD600FFEFD600FFEFD600FFEFD600FFEFD600FFEF
      D600FFEFDE00C69C7B00842900009C31000094290000A55A3100FFDEC600FFE7
      CE00FFE7CE00FFE7CE00FFE7CE00FFE7CE00FFE7CE00FFE7C600FFE7CE00FFDE
      C600E7CEB500D6BDA500AD846B0063394A000000000000000000C6A59C00D6A5
      9400FF9C9C00FF9C9C00FF9C9C00FF9C9C00FF9C9C00FF9C9C00735A5A000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000C6ADA500CEAD9400F79C9400FF9C9C00FF9C9C00FF9C9C00FF9C
      9C00FF9C9C005A5A5A000000000000000000000000000000000042A5420042A5
      42005AAD5A005AAD5A0000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000219C2100219C
      2100187B1800187B180000000000000000000000000084848400C6C6C600C6C6
      C600C6C6C600C6C6C600C6C6C600C6C6C600C6C6C600C6C6C600C6C6C6008484
      840084848400000000000000000084848400C6C6C60000000000FF000000FF00
      0000FF000000FF000000FF000000FF0000000000000000000000C6C6C600C6C6
      C60084848400848484000000000000000000CEBDB500D6C6BD00EFDECE00FFEF
      DE00FFEFDE00FFEFDE00FFEFDE00FFEFD600FFEFD600FFEFD600FFEFD600FFEF
      D600FFF7DE00C69C8400842900009C31000094290000A55A3100FFDEC600FFEF
      D600FFE7CE00FFE7CE00FFE7CE00FFE7CE00FFE7CE00FFE7CE00FFE7CE00FFE7
      CE00EFD6BD00DEC6A500B58C7B0063394A000000000000000000000000000000
      0000CEAD9C00D6A59400EF9C9400FF9C9400FF9C9C00FF9C9C008C6363008C8C
      8C00000000000000000000000000000000000000000000000000000000000000
      000000000000C6ADA500D6AD9C00F7949400FF9C9C00FF9C9C00FF9C9C00FF9C
      9C00FF9C9C005A5A5A000000000000000000000000000000000042A5420042A5
      42005AAD5A005AAD5A0000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000219C2100219C
      2100187B1800187B180000000000000000000000000084848400C6C6C600C6C6
      C600C6C6C600C6C6C600C6C6C600C6C6C600C6C6C600C6C6C600C6C6C6008484
      8400848484008484840000000000FF00000084848400C6C6C60000000000FF00
      0000FFFF0000FF0000000000000000000000C6C6C600C6C6C600848484008484
      840000840000000000000000000000000000CEC6B500D6CEBD00EFDED600FFEF
      DE00FFEFDE00FFEFDE00FFEFDE00FFEFDE00FFEFDE00FFEFDE00FFEFDE00FFEF
      DE00FFF7E700C69C8400842900009C31000094290000A55A3100FFDEC600FFEF
      D600FFE7D600FFE7D600FFE7CE00FFE7CE00FFE7CE00FFE7CE00FFE7CE00FFE7
      CE00EFD6C600DECEB500B5948C0063394A000000000000000000000000000000
      000000000000BDA59C00CEA59400F7949400FF949400FF949400BD7373006363
      6300000000000000000000000000000000000000000000000000000000000000
      000000000000C6A59C00CEAD9400F7949400FF949400FF949400FF949400FF94
      9400FF94940084848400000000000000000000000000000000004AA54A004AA5
      4A0063B5630063B5630063AD630063AD63005AAD5A005AAD5A0052A5520052A5
      52004AA54A004AA54A00399C3900399C3900319C3100319C3100000000000000
      000000000000000000000000000000000000219C2100219C2100299429002994
      2900217B2100217B210000000000000000000000000084848400000000000000
      000000000000000000000000000000000000000000000000000000000000C6C6
      C600848484008484840000000000FF00000084848400C6C6C60000000000FF00
      00000000000000000000C6C6C600C6C6C600848484008484840000FF00000084
      000000840000008400000000000000000000D6C6BD00D6CEBD00EFE7D600FFF7
      E700FFF7E700FFF7E700FFEFDE00FFEFDE00FFEFDE00FFEFDE00FFEFDE00FFEF
      DE00FFFFEF00CEA58C008C2900009C31000094290000A55A3100FFE7CE00FFEF
      DE00FFEFD600FFEFD600FFEFD600FFEFD600FFEFD600FFEFD600FFEFD600FFEF
      D600EFD6C600DECEB500B5948C0063394A000000000000000000000000000000
      0000BDADAD00BD9C8C00EF949400F7949400F7949400F7949400EF8C8C005A52
      5200949494000000000000000000000000000000000000000000000000000000
      000000000000C6A59C00D6A59400FF949400F7949400FF949400EF948C00E794
      9400EFA59C0000000000000000000000000000000000000000004AA54A004AA5
      4A0063B5630063B5630063AD630063AD63005AAD5A005AAD5A0052A5520052A5
      52004AA54A004AA54A00399C3900399C3900319C3100319C3100000000000000
      000000000000000000000000000000000000219C2100219C2100299429002994
      2900217B2100217B210000000000000000000000000084848400848484008484
      8400848484008484840084848400848484008484840084848400848484000000
      0000C6C6C6008484840000000000FF000000FF00000084848400C6C6C6000000
      0000C6C6C600C6C6C6008484840084848400C6C6C60000FF00000084000000FF
      000000840000008400000000000000000000D6C6BD00DECEC600EFE7D600FFF7
      E700FFF7E700FFF7E700FFF7E700FFF7E700FFF7E700FFF7E700FFF7E700FFF7
      E700F7E7CE00AD633900942900009C31000094290000A55A3100FFE7D600FFF7
      DE00FFEFDE00FFEFD600FFEFD600FFEFD600FFEFD600FFEFD600FFEFD600FFEF
      DE00F7DEC600DECEB500B5948C006B4252000000000000000000000000000000
      0000C6A59400EF948C00F78C8C00F78C8C00F78C8C00F78C8C00F78C8C00AD6B
      6B005A5A5A009494940000000000000000000000000000000000000000000000
      000000000000C6AD9C00E7948C00F78C8C00F78C8C00F78C8C008C6B6B009494
      8C0000000000000000000000000000000000000000000000000052AD520052AD
      52006BB56B006BB56B006BB56B006BB56B005AAD5A005AAD5A0052AD520052AD
      52004AA54A004AA54A00429C4200429C42000000000000000000000000000000
      000000000000000000002994290029942900299C2900299C2900299429002994
      2900217B2100217B210000000000000000000000000084848400C6C6C600C6C6
      C600C6C6C600C6C6C600C6C6C600C6C6C600C6C6C600C6C6C600C6C6C6008484
      840000000000C6C6C60000000000FF000000FF00000084848400C6C6C600C6C6
      C6008484840084848400840000000084000000840000C6C6C60000FF00000084
      000000FF0000008400000000000000000000D6CEBD00DED6CE00EFE7DE00FFF7
      EF00FFF7EF00FFF7E700FFF7E700FFF7E700FFF7E700FFF7E700FFF7EF00D6B5
      9C00843910007B2100008421000084210000731800008C523100FFE7D600FFF7
      E700FFEFDE00FFEFDE00FFEFDE00FFEFDE00FFEFDE00FFEFD600FFF7DE00FFF7
      E700F7DECE00E7D6C600B594840094738400000000000000000000000000C6AD
      9C00D69C8C00F78C8C00F78C8C00F78C8C00F78C8C00F78C8C00F78C8C00EF8C
      8C00845A5A006363630094949400000000000000000000000000000000000000
      0000B59C9400D6A59400EF8C8C00F78C8C00F78C8C00F78C8C009C6B6B005252
      52009C9C9C00000000000000000000000000000000000000000052AD520052AD
      52006BB56B006BB56B006BB56B006BB56B005AAD5A005AAD5A0052AD520052AD
      52004AA54A004AA54A00429C4200429C42000000000000000000000000000000
      000000000000000000002994290029942900299C2900299C2900299429002994
      2900217B2100217B210000000000000000000000000084848400C6C6C600C6C6
      C600C6C6C600C6C6C600C6C6C600C6C6C600C6C6C600C6C6C600C6C6C6008484
      8400848484000000000000000000FF000000FF000000FF000000848484008484
      8400FF00000084000000FF00000084000000FF00000000840000C6C6C60000FF
      000000840000008400000000000000000000D6C6BD00DED6D600EFE7DE00FFF7
      EF00FFFFF700FFF7EF00FFF7EF00FFF7EF00FFF7EF00FFF7EF00FFF7EF00DEC6
      B500A57B6300A57B6300A57B63009C6B5A0084523100A57B6300FFEFDE00FFF7
      E700FFF7E700FFEFDE00FFEFDE00FFEFDE00FFEFDE00FFEFDE00FFFFEF00FFF7
      DE00F7DECE00E7D6C6009C6B5A0000000000000000000000000000000000C6AD
      A500CEAD9400E78C8400EF848400EF848400EF848400EF848400EF848400EF84
      8400EF848400845A5A005252520084848400000000000000000000000000AD9C
      9400CEA59400E78C8400EF848400EF848400EF848400EF848400EF8484009C6B
      6B006363630000000000000000000000000000000000000000005AAD5A005AAD
      5A007BBD7B007BBD7B0073BD730073BD730063B5630063B563005AAD5A005AAD
      5A0052A5520052A5520000000000000000000000000000000000000000000000
      0000319C3100319C3100319C3100319C3100319C3100319C3100299429002994
      2900217B2100217B210000000000000000000000000084848400C6C6C600C6C6
      C600C6C6C600C6C6C600C6C6C600C6C6C600C6C6C600C6C6C600C6C6C6008484
      8400848484008484840000000000FF000000FF000000FF000000008400000084
      0000FF0000000084000084000000FF000000840000000084000000FF0000C6C6
      C60000FF0000008400000000000000000000D6C6BD00DED6CE00E7DEDE00F7EF
      E70000000000FFFFF700FFF7EF00FFF7EF00FFF7EF00FFF7EF00FFF7EF00FFF7
      EF00FFFFF700FFFFEF00FFFFF700FFFFF700FFFFEF00FFF7EF00FFF7E700FFF7
      E700FFF7E700FFF7E700FFF7E700FFF7E700FFEFDE00FFF7EF00FFFFF700FFEF
      DE00EFDECE00E7CEB5008C637300000000000000000000000000000000000000
      0000CEAD9C00D6948C00EF848400E7848400E7948C00DE8C8400EF848400EF84
      8400EF848400EF848400BD6B6B00735A5A005252520063636300947B7B00D694
      8C00E7848400EF848400EF848400EF848400EF848400EF848400EF848400E784
      84008C6B6B0000000000000000000000000000000000000000005AAD5A005AAD
      5A007BBD7B007BBD7B0073BD730073BD730063B5630063B563005AAD5A005AAD
      5A0052A5520052A5520000000000000000000000000000000000000000000000
      0000319C3100319C3100319C3100319C3100319C3100319C3100299429002994
      2900217B2100217B210000000000000000000000000084848400000000000000
      0000000000000000000000000000000000000000000000000000000000008484
      8400848484008484840000000000FF000000FF000000FF000000FF000000FF00
      00000084000000FF00000084000084000000FF00000084000000008400000084
      000000FF000000000000000000000000000000000000E7DED600E7DEDE00EFEF
      E700FFFFF70000000000FFFFF700FFFFF700FFFFF700FFFFF700FFFFEF00FFF7
      EF00FFF7EF00FFFFF700FFEFE700F7DEC600FFEFE700FFFFEF00FFF7EF00FFF7
      EF00FFF7E700FFF7E700FFF7E700FFF7E700FFF7EF0000000000FFF7EF00F7E7
      D600EFDECE00AD8C840000000000000000000000000000000000000000000000
      0000CEAD9C00CEAD9C00CEAD9C00CEAD9C00C6AD9C00CE9C8C00E77B7B00E77B
      7B00E77B7B00E77B7B00E7848400E7848400DE7B7B00DE7B7B00E7848400E77B
      7B00E77B7B00E77B7B00E77B7B00E77B7B00E77B7B00E77B7B00E7847B00DE7B
      7B00A594940000000000000000000000000000000000000000006BB56B006BB5
      6B008CC68C008CC68C0084C6840084C684006BB56B006BB56B0063B5630063B5
      630063AD630063AD6300B5DEB500B5DEB50000000000000000004AA54A004AA5
      4A004AA54A004AA54A0042A5420042A54200399C3900399C3900319431003194
      3100187B1800187B18000000000000000000000000000000000084848400C6C6
      C600C6C6C600C6C6C600C6C6C600C6C6C600C6C6C600C6C6C600C6C6C600C6C6
      C60084848400848484000000000000840000FF000000FF000000FF000000FF00
      0000FF0000000084000000FF000000840000FF000000FF000000840000008400
      00000084000000000000000000000000000000000000E7E7E700E7DED600E7E7
      E700F7EFEF000000000000000000FFFFF700FFFFF700FFFFF700FFFFF700FFFF
      F70000000000D6BDA5009C421800D67B4A00D67B4A00E7C6AD00FFFFF700FFF7
      EF00FFF7EF00FFF7EF00FFF7EF00FFFFF70000000000FFFFF700F7EFDE00EFE7
      D600DEC6B500C6ADAD0000000000000000000000000000000000000000000000
      0000000000000000000000000000CEAD9C00C6A59400D6948400E77B7B00E77B
      7B00E77B7B00E77B7B00E77B7B00E77B7B00E77B7B00E77B7B00E77B7B00E77B
      7B00E77B7B00E77B7B00E77B7B00DE8C8400D69C9C00DE847B00E77B7B00C684
      84000000000000000000000000000000000000000000000000006BB56B006BB5
      6B008CC68C008CC68C0084C6840084C684006BB56B006BB56B0063B5630063B5
      630063AD630063AD6300B5DEB500B5DEB50000000000000000004AA54A004AA5
      4A004AA54A004AA54A0042A5420042A54200399C3900399C3900319431003194
      3100187B1800187B180000000000000000000000000000000000000000008484
      8400C6C6C600C6C6C600C6C6C600C6C6C600C6C6C600C6C6C600C6C6C600C6C6
      C600C6C6C60084848400000000000084000000840000FF000000FF000000FF00
      0000FF000000FF00000000840000FF000000FF000000FF000000FF0000008400
      0000000000000000000000000000000000000000000000000000F7EFE700E7E7
      DE00EFE7E700F7F7EF00000000000000000000000000FFFFF700FFFFF700FFFF
      F700FFF7F7008C52310084210000C6632900BD5A2100AD633900FFF7EF00FFFF
      F700FFF7EF00FFFFF700FFFFF7000000000000000000F7EFE700EFE7DE00EFDE
      CE00BDA59C000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000CEAD9C00CEA59400D6847B00DE737300DE7B
      7B00DE7B7B00DE737300DE737300DE7B7B00DE7B7B00DE7B7B00DE7B7B00DE73
      7300DE7B7B00DE7B7B00E7737300BD737300A58C8400D69C9C00D69C9C000000
      000000000000000000000000000000000000000000000000000073BD730073BD
      73009CCE9C009CCE9C008CC68C008CC68C007BBD7B007BBD7B0073BD730073BD
      73006BB56B006BB56B0063B5630063B5630063B5630063B563005AAD5A005AAD
      5A0052AD520052AD52004AA54A004AA54A0042A5420042A54200299429002994
      2900187318001873180000000000000000000000000000000000000000000000
      0000848484008484840084848400848484008484840084848400848484008484
      840084848400848484000000000000FF00000084000000840000FF000000FF00
      000000840000FF000000FF000000FF000000FF000000FF000000FF0000008400
      000000000000000000000000000000000000000000000000000000000000F7EF
      E700E7E7DE00EFE7E700F7F7F700000000000000000000000000000000000000
      0000F7F7EF007B4231007318000094290000731800008C523100F7EFE7000000
      000000000000000000000000000000000000F7F7EF00EFEFE700EFDED600CEBD
      B500000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000CEADA500CEA58C00DE737300DE737300DE73
      7300DE737300D68C8400D6847B00DE737300DE737300DE737300DE737300DE7B
      7300DE737300DE737300DE737300BD6B6B005A5A5A0000000000000000000000
      000000000000000000000000000000000000000000000000000073BD730073BD
      73009CCE9C009CCE9C008CC68C008CC68C007BBD7B007BBD7B0073BD730073BD
      73006BB56B006BB56B0063B5630063B5630063B5630063B563005AAD5A005AAD
      5A0052AD520052AD52004AA54A004AA54A0042A5420042A54200299429002994
      2900187318001873180000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000848484000000
      000000FF00000000000000FF00000084000000FF000000840000008400000084
      0000008400000084000000840000FF000000FF000000FF000000FF0000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000F7EFE700E7E7E700EFEFEF00F7F7F7000000000000000000000000000000
      000000000000BDA59C005A210800520800005A210800CEB5A500000000000000
      00000000000000000000FFFFF700F7F7EF00F7EFE700E7D6CE00DECEC6000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000CEAD9C00CEAD9C00CE8C8400D6737300DE6B
      7300BD737300CEAD9C00CE948400D6737300D6737300D66B6B00D6847B00CEA5
      8C00D67B7300DE6B7300D6737300DE7373008C6B6B0000000000000000000000
      0000000000000000000000000000000000000000000000000000B5DEB500B5DE
      B50073BD730073BD730063B5630063B563005AAD5A005AAD5A0052AD520052AD
      52004AA54A004AA54A004AA54A004AA54A004AA54A004AA54A0042A5420042A5
      420039A5390039A53900399C3900399C3900319C3100319C3100218C2100218C
      21008CBD8C008CBD8C0000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000008484
      840084848400C6C6C6000000000000FF000000FF000000FF000000FF00000084
      000000840000008400000084000000840000FF000000FF000000FF0000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000E7E7E700EFEFE700EFEFEF00F7EFF700F7F7F700000000000000
      00000000000000000000E7DED600C6B5B500E7DED60000000000000000000000
      0000FFF7F700FFF7F700F7EFEF00F7EFE700E7D6CE0000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000CEAD9C00CEAD9C00CE9C8C00D68C
      8C0000000000C6AD9C00CE9C8400D66B6B00D66B6B00D66B6B00CE737300C6AD
      9C00CE948400D66B6B00D66B6B00CE737300D69C9C0000000000000000000000
      0000000000000000000000000000000000000000000000000000B5DEB500B5DE
      B50073BD730073BD730063B5630063B563005AAD5A005AAD5A0052AD520052AD
      52004AA54A004AA54A004AA54A004AA54A004AA54A004AA54A0042A5420042A5
      420039A5390039A53900399C3900399C3900319C3100319C3100218C2100218C
      21008CBD8C008CBD8C0000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000848484008484840000000000C6C6C600C6C6C600C6C6C60000FF
      000000FF0000008400000084000000840000FF00000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000F7F7EF00F7EFEF00EFEFEF00EFF7F700F7F7
      F700F7F7F7000000000000000000000000000000000000000000FFF7F700F7F7
      F700F7F7F700F7EFE700E7DEDE00F7F7EF000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000C6AD9C00CEA58C00CE6B6B00D6636300D6636300A5737300BDAD
      AD00CEAD9C00CE847B00D69C9C00000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000848484008484840084848400848484008484
      8400848484008484840000840000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000FFF7F700F7EFE700EFEF
      E700EFEFEF00EFEFEF00EFEFEF00EFEFEF00EFEFEF00EFEFEF00F7EFE700F7EF
      E700FFF7EF00FFF7F70000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000CEAD9C00CEAD9C00CE8C8400CE8C8400D6948C00000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000003131
      3100313131003131310031313100000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000007B7B
      7B005A5A5A00525252007B7B7B007B7B7B000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000848484006B6B6B006B6B6B006B6B6B006B6B6B008484
      8400000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000313131003131
      3100313131003131310031313100313131003131310031313100000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000AD9C9400B5A5
      9C00C6B5B5008C8484006B5A5A005A5252005A5A5A00737373007B7B7B000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000848484006B6B
      6B006B6B6B006B6B6B006B6B6B006B6B6B006B6B6B006B6B6B006B6B6B006B6B
      6B006B6B6B000073AD000073A5000073A5000073A5000073AD00006BA5005A5A
      5A006B6B6B006B6B6B006B6B6B006B6B6B006B6B6B006B6B6B006B6B6B006B6B
      6B006B6B6B006B6B6B006B6B6B006B6B6B000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000636363009452
      100084390800633918004A312900393939003131310031313100313131003131
      3100313131000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000AD9C9400CEC6
      C600F7F7F700F7F7F700FFF7F700DED6D600B5A5A5008C7373005A5252005252
      5200636363008C8484007B7B7B00000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000005A5A5A005A5A5A005A5A
      5A005A5A5A005A5A5A005A5A5A005A5A5A005A5A5A005A5A5A005A5A5A005A5A
      5A005A5A5A0010ADDE0029C6EF0029BDDE0029BDDE0029C6EF00007BAD005A5A
      5A005A5A5A005A5A5A005A5A5A005A5A5A005A5A5A005A5A5A005A5A5A005A5A
      5A005A5A5A005A5A5A005A5A5A005A5A5A000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000063636300BD52
      0000A53900009C3100009C3100008C2900007329080052312100423931004239
      3100313131003131310031313100313131000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000B5A59C00B5A59400D6CE
      C600E7E7E700DEDEDE00D6D6D600DEDEDE00EFEFEF00F7F7F700F7EFEF00D6CE
      C600AD9C94007B6B6B00525252005A5A5A00737373007B7B7B00000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000009C9C9C00A5A5A500A5A5
      A500A5A5A500A5A5A500A5A5A500A5A5A500A5A5A500A5A5A500A5A5A5009494
      94007373730021A5CE0073D6EF0084EFFF007BE7FF006BD6F700187394007B7B
      7B00A5A5A500A5A5A500A5A5A500A5A5A500A5A5A500A5A5A500A5A5A500A5A5
      A500A5A5A500A5A5A5005A5A5A005A5A5A000000000000000000000000006B6B
      6B006B6B6B006B6B6B006B6B6B006B6B6B006B6B6B006B6B6B006B6B6B006B6B
      6B006B6B6B000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000063636300B552
      1800A5390000C67B4200E7BD9400D6946300B5633900AD4200009C3100007B31
      0800633918004A31290039393900313131003131310031313100313131000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000B5A59C00D6BDA500EFDE
      CE00DEDED6000000000000000000DEDEDE00EFEFEF00DEDEE700D6D6D600DEDE
      DE00EFEFEF0000000000EFE7E700C6B5B500947B73006B5A5A00525252006363
      6300000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000009C9C9C00FFF7DE00FFF7
      DE00FFF7DE00FFF7E700FFF7E700FFF7DE00FFF7DE00F7E7D6008C8C84004A4A
      4A005A5A5A00313131006B7B7B009CBDC600ADCEDE005A636B0084636300B5A5
      A5007B7B7B00A59C9400F7E7D600FFF7DE00FFF7DE00FFF7DE00FFF7DE00FFF7
      DE00FFF7DE00FFF7DE005A5A5A006B6B6B00000000006B6B6B006B6B6B008C52
      31008442290084422900844229008442290084422900844229006B4A31006B52
      4A006B635A006B6B6B006B6B6B006B6B6B000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000063636300C66B
      18009C310000CE8C6300FFF7DE00FFE7CE00FFDEB500F7CEA500E7AD8400C67B
      4200B5521800AD4200009C310000732908005231210042393100313131003131
      3100313131003131310000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000B5A59C00D6BDA500EFDE
      CE00D6D6D600EFEFEF00ADCEF700BDCED60000000000EFF7FF00DEDEDE00F7F7
      F700EFEFEF00CECECE00D6D6D600E7E7E700FFF7F700FFE7CE00DEAD8C007B63
      5A00737373000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000009C9C9C009C9C9C009C9C
      9C009C9C9C009C9C9C009C9C9C009C9C9C006B6B6B004A4A4A0094949400F7F7
      F700C6C6C600A5A5A5006B6B6B00524A4A0084636300C6949400BD949400DED6
      D60000000000E7E7E700848484006B6B6B008C8C8C009C9C9C009C9C9C009C9C
      9C009C9C9C009C9C9C009C9C9C000000000000000000B5523100C6421000D64A
      2100DE523100E75A3900EF5A4200FF635200FF635200FF635200CE4A2100D64A
      2100D64A2100A53918007B4221006B524A006B6B6B006B6B6B006B6B6B006B6B
      6B006B6B6B006B6B6B006B6B6B006B6B6B006B6B6B006B6B6B006B6B6B006B6B
      6B006B6B6B006B6B6B000000000000000000000000000000000063636300C66B
      18009C310000CE845200FFEFD600FFE7C600FFE7C600FFE7C600FFE7C600FFE7
      BD00FFDEB500EFB58C00D6946300C6733900B55218009C3100007B3108006339
      18004A3129003131310031313100000000000000000000000000000000000000
      00000000000000000000000000000000000000000000B5A59C00D6BDA500EFDE
      CE00D6D6D600EFEFEF00DEDEE700CECECE00DEDEDE00A5BDE700C6CEDE000000
      0000BDE7FF00DEDEDE0000000000EFEFEF00CECECE00E7E7E700F7EFEF00947B
      73004A4A4A007B7B7B0000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000006363630084848400EFEFEF00F7F7F700EFEF
      EF00BDBDBD00B5B5B500B5B5B500BDADAD00AD8484007B6B6B006B6B6B007B7B
      7B009C9C9C00D6D6D600F7F7F700F7F7F700A5A5A5009C9C9C00000000000000
      00000000000000000000000000000000000000000000C6421000D64A2100DE52
      3100EF5A4200FF635200FF6B5200FF735A00FF735A00F76B4A00D68C5200CE5A
      2900FF635200FF635200E75A3900C64210006B4A31002163210021632100186B
      18001873180021942100188C1800188C1800188C1800108C100018731800186B
      1800315A39006B6B6B006B6B6B0000000000000000000000000063636300C66B
      1800A5390000D69C7300FFEFD600FFE7CE00FFE7C600FFE7C600FFDEB500FFDE
      B500FFDEB500FFDEB500FFE7BD00FFD6AD00FFCE9400E7AD7300DE945200B55A
      21009C3100004239310031313100000000000000000000000000000000000000
      00000000000000000000000000000000000000000000B5A59C00F7C69C00F7EF
      D600D6D6D6000000000000000000D6D6D60000000000EFEFEF00CECECE00D6D6
      D600BDCED600D6D6D600F7F7F700BDE7FF00D6D6D600EFEFEF00D6D6D600EFEF
      EF008C737300525252007B7B7B00000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000007B7B7B006B6B6B00D6D6D600F7F7F700F7F7F700EFEFEF00EFEF
      EF00BDBDBD00ADADAD00B5B5B500ADADAD0039393900525252005A5A5A006B6B
      6B007B7B7B008C8C8C009C9C9C00C6C6C600EFEFEF0000000000CECECE00A5A5
      A5000000000000000000000000000000000000000000C6421000DE523100EF5A
      4200FF635200FF735A00FF7B6300FF7B6300FF846B00C6522900FFE7B500D68C
      5200F76B5200FF6B5200FF635200EF5A42009C5A180042B542004AC64A00299C
      29002194210052C6520052C652004ABD4A0042BD420039B5390029AD290029AD
      290008840800187318006B6B6B0000000000000000000000000063636300C66B
      1800A5390000DEA58C00FFEFD600FFE7CE00FFE7CE00FFE7C600FFE7C600FFDE
      B500FFDEB500FFDEB500FFDEB500FFDEB500FFD69C00FFC67300FFC68400E7AD
      6B00AD4200004A31290031313100000000000000000000000000000000000000
      00000000000000000000000000000000000000000000B5A59C00F7C69C00F7E7
      D600CECECE00E7E7E70084ADF700D6D6DE0000000000CEE7FF00DEDEDE000000
      0000F7F7F700DEDEDE00DEDEE700BDCED600DEDEDE0000000000BDE7FF00CECE
      CE00EFE7E7008C8484007B7B7B00000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000000000A5A5
      A50063636300C6C6C60000000000F7F7F700F7F7F700EFEFEF00EFEFEF00E7E7
      E700B5B5B500ADADAD00ADADAD00B5B5B5008C8C8C006B6B6B00525252005A5A
      5A006B6B6B007B7B7B008C8C8C009C9C9C00ADADAD00C6C6C600E7E7E7000000
      00007B7B7B0000000000000000000000000000000000C6522900E75A3900FF63
      5200FF735A00FF7B6300FF846B00FF8C6B00D6633100EFBD8C00FFE7B500EFBD
      8C00E7634200FF7B6300FF6B5200FF635200AD63290052C652005AC65A0073AD
      5A0084AD63004AB54A0063CE63005AC65A0052C6520042BD420039B5390029AD
      290018941800187318006B6B6B0000000000000000000000000063636300CE6B
      21009C310000DEA58C00FFF7DE00FFE7D600FFE7CE00FFE7CE00FFE7C600E7DE
      CE00DED6BD00FFDEB500FFDEB500FFDEB500FFC68400FFB55200FFC67300E79C
      5200AD4200004A31290031313100000000000000000000000000000000000000
      00000000000000000000000000000000000000000000B5A59C00FFD6A500EFDE
      C600E7DECE00E7DECE00DED6D600CECECE00D6D6D600A5BDE700D6D6D600EFEF
      F70084ADF700EFEFEF00EFF7FF00D6DEDE00DEDEE700D6D6D600C6CEDE00EFEF
      EF00CEC6C600AD9C94007B7B7B00000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000A5A5A500A5A5
      A5000000000000000000F7F7F700F7F7F700EFEFEF00EFEFEF00E7E7E700E7E7
      E700ADADAD00A5A5A500ADADAD00ADADAD00B5B5B500B5B5B500B5B5B5009C9C
      9C0084848400737373007B7B7B008C8C8C009C9C9C00A5A5A5008C8C8C007373
      73007B7B7B0000000000000000000000000000000000CE5A2900E75A3900FF6B
      5A00FF7B6300FF846B00FF947300EF845A00D68C5200FFDEA500FFDEA500FFDE
      A500D65A3100FF846B00FF735A00FF635200AD6329006BCE6B0042A54200BDDE
      AD00FFF7EF004A9C420073D673006BCE6B0063CE630052C6520042BD420039B5
      390018941800187318006B6B6B0000000000000000000000000063636300CE73
      2900A5390000E7BD9400FFF7DE00FFEFD600FFE7D600FFE7CE00FFE7C60042AD
      CE0073BDC600FFE7BD00FFDEB500FFDEB500FFB55200FFAD3100FFC67300E7AD
      6B00AD4200004239310031313100000000000000000000000000000000000000
      00000000000000000000000000000000000000000000B5A59C00FFE7CE00EFDE
      C600EFDEC600EFE7CE00EFE7CE00DEDEDE0000000000EFEFEF00DEDEDE00E7E7
      E700D6D6D600D6D6D600BDCED600BDCED600F7F7F7009CCEFF00DEDEE700D6CE
      C6006B4A31006B4A31005A524A005A5A5A007373730000000000000000000000
      0000000000000000000000000000000000000000000000000000A5A5A500D6D6
      D60000000000F7F7F700F7F7F700EFEFEF00EFEFEF00E7E7E700B5B5B5007373
      7300636363007B7B7B008C8C8C00A5A5A500ADADAD00B5B5B500B5B5B500B5B5
      B500BDBDBD00B5B5B500A5A5A500949494004A4A4A0031313100BDBDBD007B7B
      7B007B7B7B000000000000000000000000000000000000000000CE5A2900EF73
      5200FF7B6300FF8C6B00FF946B00CE5A2900FFCE9C00FFCE9C00FFCE9C00FFCE
      9C00D6734200FF8C6B00FF7B6300F76B4A00947B310073D67300399C3900FFFF
      F700FFFFF700CEE7C600399C39007BD67B006BD66B0063CE63004AC64A0039B5
      3900187318006B6B6B0000000000000000000000000000000000846B5200CE6B
      2100A5390000EFD6B500FFF7E700FFEFD600FFEFD600FFEFD6008CC6CE00009C
      CE0042ADCE00FFDEB500FFDEB500FFD6AD00FFAD2900FFB55200FFDEB500E7AD
      84009C4A08004239310031313100000000000000000000000000000000000000
      00000000000000000000000000000000000000000000B5A59C00FFEFD600EFDE
      B500EFDEC600EFDEC600E7DECE00DEDEDE00F7F7F70084ADF700E7E7E700F7FF
      FF00C6D6E700F7F7F700F7F7F700D6D6D600E7E7E700C6D6E700E7E7E700C694
      8C00CE6B4200CE6B4200C65A3900AD4A210073422100524A4200737373000000
      0000000000000000000000000000000000000000000000000000A5A5A500CECE
      CE00F7F7F700F7F7F700EFEFEF00E7E7E700A5A5A5007373730094949400C6C6
      C600ADADAD008C8C8C00848484006B6B6B00737373008C8C8C00A5A5A500B5B5
      B500B5B5B500BDBDBD00BDBDBD00BDBDBD00C6C6C600A5A5A500CECECE008C8C
      8C007B7B7B00000000000000000000000000000000000000000000000000D663
      3100EF735200FF8C6B00CE5A2900EF9C7B00BD8C8400BD8C8400EFBD8C00FFBD
      9400D6734200FF8C7300FF7B5A00B54218007BCE6B007BD67B006BAD63000000
      0000000000000000000084B5840063C663007BD67B006BCE6B005AC65A00299C
      2900187318000000000000000000000000000000000000000000846B5200CE6B
      2100A5390000E7CEB500FFF7E700FFF7DE00FFEFD600ADD6D600009CCE0018A5
      CE00109CCE00E7DECE00FFE7CE00FFC67300DEA54A00C6BDAD00DEB59C00DE94
      5200AD4200003939390031313100000000000000000000000000000000000000
      00000000000000000000000000000000000000000000B5A59C00F7EFDE00EFDE
      B500EFDEB500EFDEC600EFDEC600E7DECE00DED6D600DED6D600D6D6D600C6CE
      DE00B5BDD600EFEFEF009CCEFF00D6D6DE0000000000CEE7FF00E7E7E700BD8C
      8400BD5A3900C65A4200CE634A00CE6B5200CE6B5200AD4A21005A4231005A5A
      5A00000000000000000000000000000000000000000000000000A5A5A500CECE
      CE00F7F7F700E7E7E700ADADAD007373730094949400CECECE00DEDEDE00D6D6
      D600B5B5B5009C9C9C00A5A5A500A5A5A5009C9C9C0084848400737373007373
      73008C8C8C00A5A5A500BDBDBD00BDBDBD00BDBDBD0073A584005AAD73007373
      73007B7B7B000000000000000000000000000000000000000000000000000000
      0000B5634A00B54218004A214A0000006B00000873000008730010086B007B4A
      6B00D65A3100D65A3100846318006BC663007BD67B008CE78C006BAD6300FFF7
      EF00FFF7EF00FFEFDE00FFEFDE004A9C420073CE73006BD66B0052BD5200427B
      4200000000000000000000000000000000000000000000000000846B4A00CE73
      2900A5390000EFD6B500FFF7EF00FFF7E700ADD6D600009CCE004AB5CE00D6DE
      D600009CCE00ADCEC600FFEFD6009C7352001842520052949C00B5732900DE84
      2900BD5200006B42210031313100313131003131310000000000000000000000
      000000000000000000000000000000000000B5A59C00E7E7E700EFEFE700E7D6
      AD00EFDEB500EFDEB500EFDEC600EFDEC600EFE7CE00F7E7D600F7EFDE00F7EF
      DE00E7E7DE00E7E7DE00DEDEDE00D6D6D600DEDEDE00A5BDE700E7E7E700BD8C
      8400A5390800A5390800AD421800B5522900BD5A3900CE634A00BD5A39007342
      21005A5A5A00000000000000000000000000000000000000000084848400B5B5
      B5009C9C9C006B6B6B00A5A5A500DEDEDE00DEDEDE00DEDEDE00D6D6D600D6D6
      D600EFEFEF00E7E7E700CECECE00BDBDBD00ADADAD00A5A5A500ADADAD00A5A5
      A5008C8C8C0073737300737373008C8C8C00ADADAD006B9C7B0052BD7B006363
      63007B7B7B000000000000000000000000000000000000000000000000004A4A
      4A0018181800000000000000100008217B001029940010299400082994000018
      7B0031184A00635A5A006BAD6300399C39006BD66B008CE78C0084AD6300DED6
      BD006B9CAD00398CB5006B9CAD009CB5A5004A94310042A54200427B42000000
      00000000000000000000000000000000000000000000636363009C735200CE6B
      2100AD420000FFF7E700FFF7EF00BDD6DE00009CCE0042ADCE00F7EFDE00FFE7
      D60031ADCE0042ADCE00FFE7CE00E7CEB500527B8C007B7B5200FFC68400FFD6
      AD00F7B57300E78C3900BD6B1000845229003131310031313100313131000000
      000000000000000000000000000000000000B5A59C0073B5F7003994FF00426B
      EF005A84DE007B94DE00B5BDD600D6CEC600EFDEC600EFE7CE00F7E7D600F7EF
      DE00F7EFDE00FFF7EF00FFF7EF00FFFFF70000000000F7F7F700F7F7F700A594
      8400944A1000A53900009C3100009C310000A5390800B54A2100C65A3900BD5A
      39007342210063636300000000000000000000000000000000007B7B7B007373
      7300BDBDBD00E7E7E700E7E7E700DEDEDE00DEDEDE00D6D6D600D6D6D600DEDE
      DE00EFEFEF00E7E7E700EFEFEF00EFEFEF00EFEFEF00DEDEDE00C6C6C600B5B5
      B500ADADAD00B5B5B500ADADAD00949494008484840063636300636363007B7B
      7B007B7B7B000000000000000000000000000000000000000000101010000808
      0800080808000000080008296B0010319C001039A5001039A5001039A5001039
      A50000187B002931520000000000000000004A9C42004A9C4200317B52000873
      B5001884CE001884D6001884CE00107BBD00006B7300315A39006B6B6B000000
      0000000000000000000000000000000000000000000063636300A57B5200C66B
      1800AD420000FFF7EF00FFF7EF0084C6D60042ADCE00EFE7D600FFF7DE00FFEF
      D60084C6D600009CCE00E7DECE00FFE7CE00EFE7D600BD8C5A00E7AD6B00FFE7
      C600FFEFD600FFDEB500FFC68400E7944200C66B180094521000735239003131
      310031313100000000000000000000000000B5A59C004284FF00317BFF000039
      FF000842FF000842FF00105AFF00105AFF00105AFF004284FF006B9CEF0084AD
      F700C6CEDE00DEDEE700FFF7EF00FFF7EF00FFFFF70000000000000000008C94
      6B0018630000AD420000AD420000A5420000A53900009C310000AD421800A563
      4A00A55231005A423100737373000000000000000000000000007B7B7B00D6D6
      D600E7E7E700E7E7E700DEDEDE00DEDEDE00D6D6D600D6D6D600D6D6D600F7F7
      F700BDBDBD00BDBDBD00B5B5B500BDBDBD00D6D6D600E7E7E700E7E7E700E7E7
      E700E7E7E700CECECE00C6C6C600B5B5B500B5B5B500B5B5B500A5A5A5007373
      73007B7B7B000000000000000000000000000000000018181800080808001010
      10000808080008296B00184AAD00184AAD00184AB500184AB500184AB500184A
      AD001039A50008186B0000000000000000000000000000000000000000002994
      F7002994F7002994F7002994F7002994F7001884D600105A8C00635A5A006B6B
      6B00000000000000000000000000000000000000000063636300A57B5200CE6B
      2100AD420000FFF7EF00FFF7F700FFF7EF00FFF7E700FFF7E700FFF7DE00FFF7
      DE00CEDED600009CCE009CC6CE00FFE7CE00FFE7CE00FFE7C600E7AD6B00DE84
      3100E79C5200FFDEB500FFE7CE00FFE7C600FFC68400E79C5200D67B21008452
      290052525200313131003131310000000000B5A59C0073CEFF008CF7FF008CF7
      FF0073CEFF0052ADFF004294FF00398CFF002173FF002173FF001863FF001863
      FF002173FF00217BFF002984FF0052ADFF0073B5F7009CCEFF00CEE7FF008C94
      6B0000730000296B0000BD520000B54A0000AD420000A5420000944A10007B63
      3900A5634A00734221005A5A5A0000000000000000000000000084848400E7E7
      E700E7E7E700DEDEDE00DEDEDE00D6D6D600D6D6D600CECECE00EFEFEF00D6D6
      D600C6C6C600EFEFEF00EFEFEF00EFEFEF00D6D6D600BDBDBD00B5B5B500BDBD
      BD00CECECE00E7E7E700E7E7E700E7E7E700DEDEDE00CECECE00C6C6C6008C8C
      8C007B7B7B000000000000000000000000000000000010101000101010001818
      1800080808001852B5001852BD00185AC600185AC600185AC600185AC6001852
      BD001852BD0000298400105AA5000000000000000000217BB500319CFF00319C
      FF00319CFF00319CFF00319CFF00319CFF00319CFF00218CE700295A6B006B6B
      6B00000000000000000000000000000000000000000063636300BD8C5A00C66B
      1800B55A2100FFFFF700FFFFF700FFF7F700FFF7EF00FFF7EF00FFF7E700FFF7
      DE00FFEFDE0021A5CE0042ADCE00FFE7D600FFE7CE00FFE7CE00FFEFD600D68C
      5200A539000094521000DE945200EFC69400FFE7CE00FFE7C600BDA58400A5AD
      A5007B7B9C001818840031316B003131310000000000B5A59C00B5A59C00B5A5
      9C00B5A59C00B5A59C0084B5C60073BDDE0073B5F70052ADFF0052ADFF003994
      FF00298CFF002984FF002984FF002984FF002984FF00298CFF00298CFF00737B
      4200007B0000007B0000B56B0000C65A0000BD520000B54A0000735A08005A63
      29007B633900945A2900524A42007373730000000000000000008C8C8C00DEDE
      DE00DEDEDE00DEDEDE00D6D6D600D6D6D600D6D6D600EFEFEF00D6D6D600BDBD
      BD00F7F7F700F7F7F700EFEFEF00EFEFEF00EFEFEF00EFEFEF00EFEFEF00DEDE
      DE00CECECE00B5B5B500B5B5B500BDBDBD00CECECE00E7E7E700DEDEDE008C8C
      8C007B7B7B000000000000000000000000001818180018181800181818002121
      2100081829002163C6002163CE00216BCE00216BD600216BD600216BD6002163
      CE002163CE0010429C00295A6B00000000001073A500218CE70039A5FF0039A5
      FF0039A5FF0039A5FF0039A5FF0039A5FF0039A5FF00319CFF00107BBD005A63
      63006B6B6B000000000000000000000000000000000063636300CE946B00C66B
      1800B5633900FFFFF700FFFFF700FFF7F700FFF7F700FFF7EF00FFF7EF00FFF7
      E700FFF7E7007BC6D600109CCE00D6DED600FFEFD600FFE7CE00FFEFD600D68C
      5200843908005A4A310031313100DE843100DE843100EFB57B009C8C8400E7EF
      F7004A52C600084AD6000829B5004A4A7B000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000948C0800947B
      73008C848400738CA500528CD600528CD6004284FF005A84DE00737BAD005A7B
      21000884000073730000CE6B0000D66B00008C630000735A0800186300003163
      18005A6329007B6339006B4A3100737373000000000000000000000000008C8C
      8C00DEDEDE00D6D6D600D6D6D600D6D6D600DEDEDE00B5B5B5009C9C9C00D6D6
      D600F7F7F700F7F7F700F7F7F700EFEFEF00EFEFEF00EFEFEF00EFEFEF00EFEF
      EF00EFEFEF00E7E7E700E7E7E700DEDEDE00BDBDBD00ADADAD00D6D6D6007B7B
      7B00000000000000000000000000000000001818180021212100292929002929
      290010101000216BD6002173DE002973DE00297BE700297BE700297BE7002973
      DE002173D6001052B50029315200000000001073A50039A5FF0042ADFF0042AD
      FF0042ADFF0042ADFF0042ADFF0042ADFF0042A5FF0039A5FF002994E700295A
      6B006B6B6B000000000000000000000000000000000063636300CE946B00C66B
      1800B56339000000000000000000FFFFF700FFF7F700FFF7F700FFF7EF00FFF7
      EF00FFF7E700EFE7D600009CCE0084C6D600FFEFD600FFE7D600FFF7DE00D68C
      52009C31000039424200313131000000000000000000DE945200DE9452008484
      9C002931B5002173EF000829B5004A4A7B000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000948C0800BD52
      0000C65A0000D66B0000D6730000D67B0800A58408004A940800299400001894
      0000B5840000E7840000DE7B0000B56B0000007B000000730000006B00001063
      0800426321005A63290073422100737373000000000000000000000000000000
      0000848484009494940094949400ADADAD009C9C9C00B5B5B500ADADAD009494
      94008C8C8C0094949400A5A5A500BDBDBD00D6D6D600EFEFEF00EFEFEF00EFEF
      EF00EFEFEF00EFEFEF00E7E7E700E7E7E700B5B5B500CECECE00848484000000
      0000000000000000000000000000000000001818180029292900292929003131
      3100212121002163B5002984EF00298CF7003194FF003194FF003194FF00298C
      F700297BE700185AC600295A6B00000000001073A50042ADFF0042ADFF004AB5
      FF004AB5FF004AB5FF004AB5FF004AADFF0042ADFF0042ADFF0042A5FF002163
      84006B6B6B000000000000000000000000000000000063636300D6946300BD52
      0000BD734200000000000000000000000000FFFFF700FFF7F700FFF7F700FFF7
      EF00FFF7EF00FFF7E70052B5D60018A5CE00FFEFD600FFEFD600FFF7E700D68C
      52009C3100003942420031313100000000000000000000000000000000002931
      B5002931B5002931B5002931B500000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000948C0800C65A
      0000D66B0000DE730000B584000029940000319C08004A94080018A51000849C
      0000FF940000F78C0000EF8C00008484000000840000007B000000730000006B
      00001863080042632100944A1000737373000000000000000000000000000000
      00000000000000000000A5A5A500EFEFEF00EFEFEF00EFEFEF00B5B5B500ADAD
      AD00B5B5B500BDBDBD00BDBDBD00ADADAD009C9C9C008C8C8C009C9C9C00A5A5
      A500C6C6C600E7E7E700DEDEDE00B5B5B500C6C6C60084848400000000000000
      0000000000000000000000000000000000001818180029292900393939003939
      39003939390010295A00298CF7003194FF00319CFF0039A5FF00319CFF00319C
      FF003194FF001063BD00295A6B00000000001073A5004AB5FF004AB5FF0052B5
      FF0052B5FF0052B5FF0052B5FF004AB5FF004AB5FF004AADFF0042ADFF00216B
      9C006B6B6B000000000000000000000000000000000063636300DEAD7B00B54A
      0000CE8C630000000000000000000000000000000000FFFFF700FFF7F700FFF7
      F700FFF7EF00FFF7EF00BDD6DE00009CCE009CCED600FFEFD600FFF7E700D68C
      52009C3100003942420031313100000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000948C0800CE6B
      0000D6730000D67B000018A5100010AD210031AD290031AD2900ADAD2900FFA5
      1800FFA51800FF9C0800FF940000EF8C00008484000000840000007B0000316B
      00001863000031631800944A1000737373000000000000000000000000000000
      000000000000000000009C9C9C00F7F7F7000000000000000000DEDEDE00C6C6
      C600C6C6C600B5B5B500BDBDBD00BDBDBD00C6C6C600CECECE00D6D6D600D6D6
      D600A5A5A500ADADAD00B5B5B500A5A5A5009494940000000000000000000000
      0000000000000000000000000000000000000000000018181800393939004242
      42004A4A4A002929290010295A0010429C001852D600216BDE002984EF003194
      F7003194FF00105AA500105AA500000000001073A50052B5FF0052BDFF0052BD
      FF0052BDFF0052BDFF0052BDFF0052BDFF0052B5FF004AB5FF004AB5FF00107B
      BD006B6B6B000000000000000000000000000000000063636300DEAD7B00B54A
      0000CE8C63000000000000000000000000000000000000000000FFFFF700FFF7
      F700FFF7F700FFF7EF00FFF7E70031ADD60031ADD600FFEFDE00FFF7DE00C67B
      42008C4200004A4A4A0031313100000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000948C0800D66B
      0000DE7300004A94080010AD290018B5390021BD420021BD42004ABD4A00D6C6
      5200F7BD5200FFB53100FF9C0800FF940000B5840000088C0000187B00000073
      0000006B000010630800945A2900737373000000000000000000000000000000
      0000000000000000000094949400BDB5B500E7B5AD00FFB5A500FFB5A500FFC6
      BD00FFD6CE00FFE7DE00F7E7DE00EFEFEF00E7E7E700D6D6D600D6D6D600D6D6
      D600A5A5A500B5B5B500BDBDBD00000000000000000000000000000000000000
      0000000000000000000000000000000000000000000029292900393939004A4A
      4A004A4A4A00635A5A00636363004A4A4A001821290000105A0008218C001031
      9C0008296B000810180000000000000000001073A50052BDFF0052BDFF0039A5
      DE00399CDE004AB5F70052B5FF0052BDFF0052BDFF0052B5FF0042ADEF001073
      A5006B6B6B000000000000000000000000000000000063636300DEAD7B00B54A
      0000CE8C6300000000000000000000000000000000000000000000000000FFFF
      F700FFF7F700FFF7F700FFF7EF00CEE7E700CEE7E700FFF7E700FFEFDE00C67B
      42008C4200004A4A4A0031313100000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000000000D673
      0800E77B000052AD210021BD420029C6520031CE630039CE6B0039CE6B0073D6
      7300FFD67B00FFC65A00FFB53100FF9C0800B5940000088C000000840000007B
      000000730000296B00008C6B4200000000000000000000000000000000000000
      000000000000000000000000000094949400E7BD9C00FFD6AD00FFD6AD00FFCE
      AD00FFCEA500FFC6A500FFC69C00FFBD9C00FFCEAD00FFD6BD00F7D6C600D6CE
      CE008C8C8C000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000292929005252
      520052525200636363008484840094949400A5A5A50073737300424242002929
      2900292929003939390000000000000000001073A500107BBD001073A5002184
      C6003994C600398CB5002184C6001884CE001884D6002184C600217BAD001063
      8C00000000000000000000000000000000000000000063636300E7AD6B00BD52
      0000BD632100CE845200CE9C8400E7CEB500EFDED60000000000000000000000
      00000000000000000000FFFFF700FFF7F700FFF7EF00FFF7EF00FFF7E700C67B
      42008C4200004A4A4A0031313100000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000000000948C
      0800948C080018B5390029C6520039CE6B0052D67B008CDE8C0063DE840052D6
      7B00DEEFA500FFD67B00F7BD5200FFA51800CE9400002994000029840000087B
      000000730000737300008C6B4200000000000000000000000000000000000000
      0000000000000000000000000000BD949400FFD6B500FFDEB500FFDEB500FFDE
      B500FFDEB500FFDEB500FFDEB500FFDEB500FFDEB500FFD6B500E7BD9C000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000002121
      2100635A5A0073737300848484008C8C8C00A5A5A500A5A5A5007B7B7B004A4A
      4A0018181800000000000000000000000000107BBD001073A5003994C600429C
      D60052ADD6007BBDE70094CEEF009CCEE70063ADD6003994C6001873A5004273
      9C00000000000000000000000000000000000000000063636300E7AD7300C65A
      0000BD520000B54A0000B54A0000BD520000BD520000B55A2100BD7B5A00CE94
      7300E7C6AD00E7DECE00F7E7DE00FFF7EF000000000000000000FFF7EF00D684
      42008C4200004A4A4A0031313100000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000010AD290021BD420031CE630052D67B008CDE8C00DEEFA5008CEFA500B5F7
      BD00FFFFCE009CD67B00FFC65A00D6AD2100CE940000EF840000188C00000084
      0000087300009C7B390000000000000000000000000000000000000000000000
      0000000000000000000000000000B58C8400FFDEBD00FFDEBD00FFDEBD00FFDE
      BD00FFDEBD00FFDEBD00FFDEBD00FFDEBD00FFDEBD00FFDEBD00CEA594000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000029292900636363008C8C8C0094949400848484006B6B6B00424242002929
      290000000000000000000000000000000000000000001073A500398CB50052AD
      D6007BBDE70084C6E7009CCEEF009CCEE70063ADD6003994C6001073A5000000
      0000000000000000000000000000000000000000000063636300EFB57B00C65A
      0000C65A0000C65A0000C65A0000C65A0000C65A0000C65A0000C65A0000B54A
      0000B54A0000B54A0000BD632100C67B4200CE8C6300DEA58C00E7C6AD00C673
      39008C4200004A4A4A0031313100000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000029C6520029C6520042D66B0063DE84008CEFA500B5F7BD00CEF7B5009CEF
      AD00CEF7B50042D6730052C6520052AD2100949C0800EF840000C67B00000884
      0000A5840800A584080000000000000000000000000000000000000000000000
      0000000000000000000000000000BD948C00FFE7CE00FFE7CE00FFE7CE00FFE7
      CE00FFE7CE00FFE7CE00FFE7CE00FFE7CE00FFE7CE00FFE7CE00BD948C000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000002929290029292900292929002929290029292900292929000000
      00000000000000000000000000000000000000000000000000001073A500429C
      D60094CEE700A5D6EF0094CEE7007BBDE70052ADD600217BAD00000000000000
      0000000000000000000000000000000000000000000063636300EFB57B00E794
      4200D6731800D66B0800C6630000C65A0000C65A0000C65A0000C65A0000C65A
      0000C6630000C6630000C65A0000BD520000B54A0000B54A0000BD520000BD52
      00009C4A08004A4A4A0031313100000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000006BC65A006BC65A0073DE84008CEFA500CEF7B500B5F7BD00CEF7
      B500A5E7940042D6730029C6520031AD2900E7940000E7840000DE730000CE94
      0000CE9400000000000000000000000000000000000000000000000000000000
      00000000000000000000A57B7B00DEB5AD00FFE7CE00FFE7CE00FFE7CE00FFE7
      CE00FFE7CE00FFE7CE00FFE7CE00FFE7CE00FFE7CE00FFE7CE00BD9C9C000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000001073
      A5001073A5001073A5001073A5001073A5001073A50000000000000000000000
      000000000000000000000000000000000000000000006363630063636300EFAD
      5A00CEAD7B00DEC69400EFC68400F7B57300EFAD5A00E7943900DE842900D66B
      0800C65A0000C65A0000C65A0000C65A0000C6630000C6630000C6630000C663
      00007B4A18005252520031313100000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000005ADE84005ADE84008CDE8C009CEFAD00ADEFA5008CEF
      A50063DE840039D66B0029C64A0018B53900E78C0000E7840000EF941800EF94
      1800000000000000000000000000000000000000000000000000000000000000
      00000000000000000000A57B7B00F7DECE00FFEFDE00FFEFDE00FFEFDE00FFEF
      DE00FFEFDE00FFEFDE00FFEFDE00FFEFDE00FFEFDE00F7DECE00BD9C9C000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000006363
      630063636300636363006363630063636300EFAD5A00CEAD7B00CEAD7B00DEC6
      9400EFC69400EFB57B00E7AD6B00DE943900DE842900D6731800D66B0800D66B
      08007B4A18006363630031313100000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000005AD673005AD673008CDE8C0073E7940063DE
      84005AD6730031CE630021BD420031AD2900D69C2100F7BD5200F7BD52000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000AD847B00FFF7E700FFF7E700FFF7E700FFF7E700FFF7
      E700FFF7E700FFF7E700FFF7E700FFF7E700FFF7E700DEBDB500000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000006363630063636300636363006363
      6300636363006363630063636300EFAD5A00CEAD7B00CEAD7B00CEAD7B00D6A5
      6300846B4A006363630000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000E7C65200E7C65200E7C6
      5200E7C65200E7C65200E7C65200E7C65200E7C6520000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000A57B7B00DEBDBD00FFF7EF00FFF7EF00FFF7EF00FFF7EF00FFF7
      EF00FFF7EF00FFF7EF00FFF7EF00FFF7EF00FFF7EF00C6A5A500000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000636363006363630063636300636363006363
      6300636363000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000A57B7B00CEADAD00CEADAD00CEB5B500CEB5AD00CEB5AD00D6BD
      BD00CEB5B500CEB5B500CEB5B500CEB5B500CEADAD0000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000424D3E000000000000003E000000
      2800000080000000A00000000100010000000000000A00000000000000000000
      000000000000000000000000FFFFFF0000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000FFFFFFFFFFFFFFFFFFFFFFFF00000000
      FFFFFFFFFFFFFFFFFFFFFFFF0000000000000000FFC003FFFFFFFFFF00000000
      00000000F880011FFFFFFFFF0000000000000000FC00003FFFFFFFFF00000000
      3FFFFFF8FE0000FFFFFFFFFF000000003FFE3388FC00007FFFFFFFFF00000000
      20FE3188F800003FFFFFFFFF0000000020FE3198F000001FFFFFFC1F00000000
      20FFFFF8E000000FF83F8828000000003FFE3188C000000F1010165000000000
      205E7188C0000007E00FEE6B000000003FFEB188C0000007C007DE7500000000
      000FFFF88000000380039E79000000003FFE31888000000380039E0100000000
      201E31888000000380039E01000000003FFE31888000000380039D5900000000
      3FFFFFF8800000038003ABAB000000000000000080000003C007D7D700000000
      0000000080000003E00F8BEC000000000000FFF8800000033018341800000000
      0480FFF880000003F83FF83F0000000000000000C0000007FFFFFFFF00000000
      00000000C0000007FFFFFFFF0000000000000000E000000FFFFFFFFF00000000
      00000000F000001FFFFFFFFF0000000000000000F800001FFFFFFFFF00000000
      00000000FC00007FFFFFFFFF0000000000000000FE0000FFFFFFFFFF00000000
      00000000FF8001FFFFFFFFFF00000000FFFFFFFFFFE00FFFFFFFFFFF00000000
      FFFFFFFFFFFFFFFFFFFFFFFF00000000FFFFFFFFC3F07FFFFFFFFFFFFFFFFFF7
      FFFFFFFF00E01FFFFFFFFFFFC0000003FFFE1FFF000007FFFF00000080000001
      FFFC0FFF000C01FFFE00000080000001FFFC07FF000C007FFE00000080000001
      F80003FF0000001FFE00000080000001C00001FF00000007FE00000080018001
      0000000700000001C0000000800FF00100000003000000008000000080300C01
      0000000100000000800000008060060180000000000000008000000080C00301
      80003000000000008000000080818101C0007000000000008000000081018081
      E000F000000000008000000081018081E000F010000000008000000081018081
      C00030000000000080000000830180C1800010010000000080000000830180C1
      8000180300000000800000008101808100001C07000000008000000081018081
      00000FFF000000000000000081018081000007FF000000000000000180818101
      00000FFF000000000000000380C0030100000FFF800000000000003F80600601
      00000FFFC00100000000003F80300C0100000FFFE00040000000003F800FF001
      80000FFFF00010000000003F80018001800007FFF80004000000003F80000001
      C00007FFFC0001000000003F80000001F00007FFFE0030408000007F80000000
      FE000FFFFF007E10C00F01FF80000001FF803FFFFF83FF02E01FFFFFC0000003
      FFFFFFFFFFC7FFE3FFFFFFFFFFFFFFF7FFFF3FFFFFFFE7FFFFFC1FFFFFFFFFFF
      FFFC0FFFFFFFC7FFFFC00FFFFFFFFFFFFFF003FFFFFF87FFFF0003FFC0000003
      FFC180FFFFFF07FFFF0000FFC0000003FF06003FFFFE07FFFE00007FC0000003
      FC19001FFFE003FFFC00007FC0000003FC64481FFF0000FFF800007FC000C003
      FD91301FFC00003FF000007FC000C003FC04C01FF800001FE000000FC003F003
      C003001FF000000FE0030007C003F003800C030FE0000007F007C007C000FC03
      80000C8FC0000003F80FE007C000FC038000304780000001E00FF00FC0003F03
      8000404380000001E01FF00FC0003F03BFE0002300000000C01FF807C3FFFFC3
      8000002100000000C01FF803C3FFFFC38000001100000000C01FF803C3FFFFC3
      8000000100000000F00FF803C3FFFFC38000000100000000F80FF803C0003F03
      BFE0000100000000F007F807C0003F038000000100000000F003F80FC000FC03
      8000000100000000E001F007C000FC038000000100000001E000E007C003F003
      8000000108000001F0000007C003F003BFE0000384000043F0000007C000C003
      C000000386080083FE00000FC000C003E0000007C3800187FE00001FC0000003
      F0020007E1F01F0FFE00007FC0000003FFD4000FF0F83C1FFE00007FC0000003
      FFE2001FF83C707FFF08007FC0000003FFF9007FFE07C0FFFFF801FFFFFFFFFF
      FFFE01FFFF8003FFFFF83FFFFFFFFFFFFFFFFFFFE1FFFFFFE0FFFFFFFFFC0FFF
      FFFFFFFFC03FFFFFC01FFFFFC0000000FFFFFFFFC007FFFFC001FFFF80000000
      FFFFFFFFC000FFFF80003FFF80000000E007FFFFC0001FFF86040FFF80000000
      8000FFFFC00003FF808007FF8000080180000003C00001FF801203FFFE00003F
      80000001C00001FF868001FFF800004F80000001C00001FF809041FFE2000017
      80000001C00001FF800001FFCC00000780000001C00001FF8080007FC8000007
      C0000003C00001FF8000001FC0000007E0001C07C00001FF8000800FC0000007
      F000000FC000007F00000007C0000007E000001F8000001F00008003C0000007
      C003001F8000000700006001C00000078003E00F8000000100000001C0000007
      8001800F8000000080000000C00000070001000780000000FFC00000E000000F
      0001000786000180FFC00000F000001F00010007870001E1FFC00000FC00003F
      00010007878001FFFFC00000FCC0007F8001000787C001FFFFC00000FC0001FF
      8003000787E001FFFFE00001FE0007FFC003000F807C01FFFFE00001FE001FFF
      E007000F8000C1FFFFF00003FE001FFFF00F801F800001FFFFF00003FE001FFF
      F81FC03F800001FFFFF80007FC001FFFFFFFE07F800001FFFFFC000FFC001FFF
      FFFFFFFFE00001FFFFFE001FFC003FFFFFFFFFFFFF0003FFFFFF807FF8003FFF
      FFFFFFFFFFFE07FFFFFFFFFFF8007FFF00000000000000000000000000000000
      000000000000}
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
  object popRelatorios: TPopupMenu
    Left = 184
    Top = 56
    object ListadeAprovados1: TMenuItem
      Caption = 'Lista de Aprovados'
      OnClick = ListadeAprovados1Click
    end
    object ListadeaprovadosNomesidnticos1: TMenuItem
      Caption = 'Lista de aprovados - Nomes id'#234'nticos'
      OnClick = ListadeaprovadosNomesidnticos1Click
    end
    object ListadeaprovadosNomesSemelhantes1: TMenuItem
      Caption = 'Lista de aprovados - Nomes semelhantes'
      OnClick = ListadeaprovadosNomesSemelhantes1Click
    end
  end
  object MainMenu1: TMainMenu
    Left = 16
    Top = 80
    object Sair1: TMenuItem
      Caption = 'Sair'
      OnClick = Sair1Click
    end
  end
end
