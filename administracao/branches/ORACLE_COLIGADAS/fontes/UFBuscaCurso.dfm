object fBuscaCurso: TfBuscaCurso
  Left = 0
  Top = 0
  BorderStyle = bsDialog
  Caption = 'Busca de cursos'
  ClientHeight = 475
  ClientWidth = 694
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  OnClose = FormClose
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object pnlTitle: TPanel
    Left = 0
    Top = 0
    Width = 694
    Height = 22
    Align = alTop
    BevelOuter = bvLowered
    Caption = 'SELE'#199#195'O DE CURSO'
    Color = clBlue
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindow
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 0
  end
  object pnlAll: TPanel
    Left = 0
    Top = 22
    Width = 694
    Height = 453
    Align = alClient
    BevelOuter = bvNone
    BorderWidth = 3
    TabOrder = 1
    object bvlSep1: TBevel
      Left = 3
      Top = 57
      Width = 688
      Height = 3
      Align = alTop
      Shape = bsTopLine
      ExplicitLeft = 344
      ExplicitTop = 168
      ExplicitWidth = 50
    end
    object bvlSep2: TBevel
      Left = 3
      Top = 412
      Width = 688
      Height = 3
      Align = alBottom
      Shape = bsBottomLine
      ExplicitLeft = 360
      ExplicitTop = 208
      ExplicitWidth = 50
    end
    object pnlFilters: TPanel
      Left = 3
      Top = 3
      Width = 688
      Height = 54
      Align = alTop
      BevelOuter = bvNone
      TabOrder = 0
      object pnlFilter: TPanel
        Left = 0
        Top = 0
        Width = 208
        Height = 54
        Align = alLeft
        BevelOuter = bvNone
        TabOrder = 0
        object lblFilter: TLabel
          Left = 8
          Top = 3
          Width = 80
          Height = 13
          Caption = 'Nome ou c'#243'digo:'
        end
        object edtFilter: TEdit
          Left = 8
          Top = 18
          Width = 185
          Height = 21
          TabOrder = 0
          OnKeyPress = edtFilterKeyPress
        end
      end
      object pnlFilterYearSemester: TPanel
        Left = 256
        Top = 3
        Width = 137
        Height = 45
        BevelOuter = bvNone
        TabOrder = 1
        Visible = False
        object lblYearSemester: TLabel
          Left = 8
          Top = 3
          Width = 71
          Height = 13
          Caption = 'Ano/semestre:'
        end
        object meYearSemester: TMaskEdit
          Left = 8
          Top = 18
          Width = 89
          Height = 21
          EditMask = '9999/9;0;_'
          MaxLength = 6
          TabOrder = 0
        end
        object udYearSemester: TUpDown
          Left = 99
          Top = 18
          Width = 17
          Height = 21
          Min = -100
          TabOrder = 1
          OnClick = udYearSemesterClick
        end
      end
      object pnlFilterPeriod: TPanel
        Left = 416
        Top = 3
        Width = 174
        Height = 41
        BevelOuter = bvNone
        TabOrder = 2
        Visible = False
        object chkActiveClasses: TCheckBox
          Left = 3
          Top = 5
          Width = 89
          Height = 17
          Caption = 'Turmas ativas'
          Checked = True
          State = cbChecked
          TabOrder = 0
          OnClick = chkActiveClassesClick
        end
        object chkInitDate: TCheckBox
          Left = 98
          Top = 5
          Width = 74
          Height = 17
          Caption = 'Data in'#237'cio:'
          Checked = True
          State = cbChecked
          TabOrder = 1
          OnClick = chkInitDateClick
        end
        object dtpInitDate: TDateTimePicker
          Left = 174
          Top = 3
          Width = 92
          Height = 21
          Date = 40975.000000000000000000
          Time = 40975.000000000000000000
          TabOrder = 2
          OnChange = dtpInitDateChange
        end
        object chkFinalDate: TCheckBox
          Left = 272
          Top = 5
          Width = 65
          Height = 17
          Caption = 'Data fim:'
          Checked = True
          State = cbChecked
          TabOrder = 3
          OnClick = chkFinalDateClick
        end
        object dtpFinalDate: TDateTimePicker
          Left = 339
          Top = 3
          Width = 92
          Height = 21
          Date = 40975.999988425920000000
          Time = 40975.999988425920000000
          TabOrder = 4
          OnChange = dtpFinalDateChange
        end
      end
    end
    object pnlButtons: TPanel
      Left = 3
      Top = 415
      Width = 688
      Height = 35
      Align = alBottom
      BevelOuter = bvNone
      TabOrder = 1
      object sbSelecionar: TSpeedButton
        Left = 523
        Top = 6
        Width = 79
        Height = 25
        Caption = 'Selecionar'
        Glyph.Data = {
          76010000424D7601000000000000760000002800000020000000100000000100
          04000000000000010000120B0000120B00001000000000000000000000000000
          800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
          FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00555555555555
          555555555555555555555555555555555555555555FF55555555555559055555
          55555555577FF5555555555599905555555555557777F5555555555599905555
          555555557777FF5555555559999905555555555777777F555555559999990555
          5555557777777FF5555557990599905555555777757777F55555790555599055
          55557775555777FF5555555555599905555555555557777F5555555555559905
          555555555555777FF5555555555559905555555555555777FF55555555555579
          05555555555555777FF5555555555557905555555555555777FF555555555555
          5990555555555555577755555555555555555555555555555555}
        NumGlyphs = 2
        OnClick = sbSelecionarClick
      end
      object sbFechar: TSpeedButton
        Left = 602
        Top = 6
        Width = 79
        Height = 25
        Caption = 'Fechar'
        Glyph.Data = {
          42020000424D4202000000000000420000002800000010000000100000000100
          1000030000000002000000000000000000000000000000000000007C0000E003
          00001F0000001F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C
          1F7C1F7C1F7C1F7C1F7C1F7C0000000000001F7C1F7C1F7C1F7C1F7C1F7C1F7C
          1F7C1F7C1F7C1F7C00000000864D864D00001F7C1F7C1F7C1F7C1F7C1F7C1F7C
          1F7C1F7C1F7C4031864D864D864D864D00004031403140314031403140311F7C
          1F7C1F7C1F7C4031A64DA64D864D864D0000207F207F207F00001F7C1F7C1F7C
          1F7C1F7C1F7C4031A551A551A54DA54D0000207F207F207F00001F7C1F001F7C
          1F7C1F7C1F7C4031C455C451C451C5510000227F207F207F00001F001F001F7C
          1F7C1F7C1F7C4031E355E355FF7FC4550000467F457F437F1F001F001F001F7C
          1F7C1F7C1F7C4031025A035A035AE35900006C7F6A7F1F001F001F001F001F00
          1F001F001F7C4031215E225E025E025A0000917F1F001F001F001F001F001F00
          1F001F001F7C4031416221622162215E0000B67FB47F1F001F001F001F001F00
          1F001F001F7C403140664066406240620000DB7FD97FB87F1F001F001F001F7C
          1F7C1F7C1F7C403160666066606640660000FF7FDE7FDC7F00001F001F001F7C
          1F7C1F7C1F7C403160666066606660660000FF7FFF7FFF7F00001F7C1F001F7C
          1F7C1F7C1F7C1F7C4031403160666066000040314031403140311F7C1F7C1F7C
          1F7C1F7C1F7C1F7C1F7C1F7C4031403140311F7C1F7C1F7C1F7C1F7C1F7C1F7C
          1F7C1F7C1F7C}
        OnClick = sbFecharClick
      end
    end
    object dbgCourses: TDBGrid
      Left = 3
      Top = 60
      Width = 688
      Height = 352
      Align = alClient
      DataSource = dsCourses
      Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgConfirmDelete, dgCancelOnExit]
      TabOrder = 2
      TitleFont.Charset = DEFAULT_CHARSET
      TitleFont.Color = clWindowText
      TitleFont.Height = -11
      TitleFont.Name = 'Tahoma'
      TitleFont.Style = []
      OnDblClick = dbgCoursesDblClick
      OnTitleClick = dbgCoursesTitleClick
      Columns = <
        item
          Expanded = False
          FieldName = 'CD_CURSO'
          Title.Caption = 'C'#243'digo'
          Width = 92
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'DS_CURSO'
          Title.Caption = 'Descri'#231#227'o'
          Title.Font.Charset = DEFAULT_CHARSET
          Title.Font.Color = clGreen
          Title.Font.Height = -11
          Title.Font.Name = 'Tahoma'
          Title.Font.Style = [fsBold]
          Width = 365
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'NM_COLIGADA'
          Title.Caption = 'Unidade de ensino'
          Width = 175
          Visible = True
        end>
    end
  end
  object qryCourses: TUMZReadOnlyQuery
    Connection = DM.conn
    SortedFields = 'DS_CURSO'
    Filtered = True
    SQL.Strings = (
      'SELECT DISTINCT'
      '   CM.CD_CURSO,'
      '   CM.DS_CURSO,'
      '   C.NM_COLIGADA,'
      '   T.ANOSEMESTRE NR_ANOSEMESTRE,'
      '   T.DATAINICIO DT_INICIO,'
      '   T.DATAFIM DT_FIM,'
      '   T.SN_ATIVA'
      'FROM'
      '   CURSOS_MESTRE CM'
      '      JOIN CURSOS_COLIGADAS CC ON'
      '         (CM.CD_CURSO = CC.CD_CURSO)'
      '         JOIN TURMAS T ON'
      '            (CM.CD_CURSO = T.CURSO) AND'
      '            (CC.CD_COLIGADA = T.CD_COLIGADA)'
      '            JOIN COLIGADAS C ON'
      '               (T.CD_COLIGADA = C.CD_COLIGADA)'
      '               JOIN NU_GRUPOS_PESSOAS GP ON'
      '                  (C.CD_COLIGADA = GP.CD_COLIGADA)'
      '               LEFT JOIN COLIGADAS C2 ON'
      '                  (C.CD_COLIGADA_MATRIZ = C2.CD_COLIGADA) AND'
      '                  (GP.CD_COLIGADA = C2.CD_COLIGADA) AND'
      '                  (C2.SN_MATRIZ = 1)'
      'WHERE'
      '   CC.SN_ATIVO = 1 AND'
      
        '   (C.SN_MATRIZ = 1 OR (C.SN_MATRIZ = 0 AND C.CD_COLIGADA_MATRIZ' +
        ' IS NULL)) AND'
      '   (C.SN_FINANCEIRO = 1 OR C.SN_ACADEMICO = 1) AND'
      '   GP.CD_PESSOA = :CD_PESSOA'
      'GROUP BY'
      '   CM.CD_CURSO,'
      '   C.CD_COLIGADA,'
      '   T.ANOSEMESTRE')
    Params = <
      item
        DataType = ftUnknown
        Name = 'CD_PESSOA'
        ParamType = ptUnknown
      end>
    IndexFieldNames = 'DS_CURSO Asc'
    Left = 224
    Top = 208
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'CD_PESSOA'
        ParamType = ptUnknown
      end>
    object qryCoursesCD_CURSO: TStringField
      FieldName = 'CD_CURSO'
      Size = 15
    end
    object qryCoursesDS_CURSO: TStringField
      FieldName = 'DS_CURSO'
      Size = 255
    end
    object qryCoursesNM_COLIGADA: TStringField
      FieldName = 'NM_COLIGADA'
      Size = 50
    end
    object qryCoursesNR_ANOSEMESTRE: TSmallintField
      FieldName = 'NR_ANOSEMESTRE'
      Required = True
    end
    object qryCoursesDT_INICIO: TDateTimeField
      FieldName = 'DT_INICIO'
    end
    object qryCoursesDT_FIM: TDateTimeField
      FieldName = 'DT_FIM'
    end
    object qryCoursesSN_ATIVA: TSmallintField
      FieldName = 'SN_ATIVA'
    end
  end
  object dsCourses: TDataSource
    AutoEdit = False
    DataSet = qryCourses
    Left = 248
    Top = 248
  end
end
