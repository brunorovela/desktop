object fBuscaTurma: TfBuscaTurma
  Left = 0
  Top = 0
  BorderStyle = bsDialog
  Caption = 'Busca de Turma'
  ClientHeight = 579
  ClientWidth = 601
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
  OnDestroy = FormDestroy
  PixelsPerInch = 96
  TextHeight = 13
  object bvlSep1: TBevel
    Left = 0
    Top = 20
    Width = 601
    Height = 3
    Align = alTop
    Shape = bsSpacer
    ExplicitLeft = 256
    ExplicitTop = 120
    ExplicitWidth = 50
  end
  object pnlTitle: TPanel
    Left = 0
    Top = 0
    Width = 601
    Height = 20
    Align = alTop
    BevelOuter = bvLowered
    Caption = 'SELE'#199#195'O DE TURMA'
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
    Top = 23
    Width = 601
    Height = 556
    Align = alClient
    BevelOuter = bvNone
    BorderWidth = 3
    TabOrder = 1
    ExplicitHeight = 610
    object bvlSep2: TBevel
      Left = 3
      Top = 124
      Width = 595
      Height = 3
      Align = alTop
      Shape = bsTopLine
      ExplicitTop = 173
      ExplicitWidth = 585
    end
    object bvlSep3: TBevel
      Left = 3
      Top = 516
      Width = 595
      Height = 3
      Align = alBottom
      Shape = bsBottomLine
      ExplicitLeft = 216
      ExplicitTop = 344
      ExplicitWidth = 50
    end
    object pnlFilters: TPanel
      Left = 3
      Top = 3
      Width = 595
      Height = 121
      Align = alTop
      BevelOuter = bvNone
      TabOrder = 0
      object lblUnit: TLabel
        Left = 17
        Top = 39
        Width = 92
        Height = 13
        Caption = 'Unidade de ensino:'
      end
      object lblDept: TLabel
        Left = 36
        Top = 66
        Width = 73
        Height = 13
        Caption = 'Departamento:'
      end
      object lblCourse: TLabel
        Left = 77
        Top = 93
        Width = 32
        Height = 13
        Caption = 'Curso:'
      end
      object pnlCustomFilter: TPanel
        Left = 0
        Top = 0
        Width = 595
        Height = 30
        Align = alTop
        BevelOuter = bvNone
        TabOrder = 0
        object pnlFilterYearSemester: TPanel
          Left = 0
          Top = -10
          Width = 241
          Height = 30
          BevelOuter = bvNone
          TabOrder = 0
          Visible = False
          object lblYearSemester: TLabel
            Left = 38
            Top = 6
            Width = 71
            Height = 13
            Caption = 'Ano/semestre:'
          end
          object meYearSemester: TMaskEdit
            Left = 115
            Top = 3
            Width = 89
            Height = 21
            EditMask = '9999/9;0;_'
            MaxLength = 6
            TabOrder = 0
          end
          object udYearSemester: TUpDown
            Left = 205
            Top = 3
            Width = 17
            Height = 21
            Min = -100
            TabOrder = 1
            OnClick = udYearSemesterClick
          end
        end
        object pnlFilterPeriod: TPanel
          Left = 288
          Top = -10
          Width = 457
          Height = 30
          BevelOuter = bvNone
          TabOrder = 1
          Visible = False
          object chkActiveClasses: TCheckBox
            Left = 17
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
            Left = 112
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
            Left = 188
            Top = 3
            Width = 92
            Height = 21
            Date = 40975.000000000000000000
            Time = 40975.000000000000000000
            TabOrder = 2
            OnChange = dtpInitDateChange
          end
          object chkFinalDate: TCheckBox
            Left = 286
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
            Left = 353
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
      object dblcUnits: TDBLookupComboBox
        Left = 115
        Top = 36
        Width = 214
        Height = 21
        KeyField = 'CD_COLIGADA'
        ListField = 'NM_COLIGADA'
        ListSource = dsUnits
        TabOrder = 1
      end
      object dblcDepts: TDBLookupComboBox
        Left = 115
        Top = 63
        Width = 214
        Height = 21
        KeyField = 'CD_DEPTO'
        ListField = 'DS_DEPTO'
        ListSource = dsDepts
        TabOrder = 2
      end
      object dblcCourses: TDBLookupComboBox
        Left = 115
        Top = 90
        Width = 214
        Height = 21
        KeyField = 'CD_CURSO'
        ListField = 'CD_CURSO'
        ListSource = dsCourses
        TabOrder = 3
      end
    end
    object pnlBotoes: TPanel
      Left = 3
      Top = 519
      Width = 595
      Height = 34
      Align = alBottom
      BevelOuter = bvNone
      TabOrder = 1
      ExplicitTop = 573
      object sbSelecionar: TSpeedButton
        Left = 423
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
        Left = 502
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
    object dbgClasses: TDBGrid
      Left = 3
      Top = 127
      Width = 595
      Height = 389
      Align = alClient
      DataSource = dsViewClasses
      Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgConfirmDelete, dgCancelOnExit]
      TabOrder = 2
      TitleFont.Charset = DEFAULT_CHARSET
      TitleFont.Color = clWindowText
      TitleFont.Height = -11
      TitleFont.Name = 'Tahoma'
      TitleFont.Style = []
      OnDblClick = dbgClassesDblClick
      OnTitleClick = dbgClassesTitleClick
      Columns = <
        item
          Expanded = False
          FieldName = 'CD_TURMA'
          Title.Caption = 'C'#243'digo'
          Title.Font.Charset = DEFAULT_CHARSET
          Title.Font.Color = clGreen
          Title.Font.Height = -11
          Title.Font.Name = 'Tahoma'
          Title.Font.Style = [fsBold]
          Width = 101
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'NR_ANOSEMESTRE'
          Title.Caption = 'Ano/semestre'
          Width = 97
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'DS_SITUACAO'
          Title.Caption = 'Situa'#231#227'o'
          Width = 152
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'NM_COLIGADA'
          Title.Caption = 'Unidade de ensino'
          Width = 189
          Visible = True
        end>
    end
  end
  object qryUnits: TUMZReadOnlyQuery
    Connection = DM.conn
    SortedFields = 'NM_COLIGADA'
    SQL.Strings = (
      'SELECT DISTINCT'
      '   C.CD_COLIGADA,'
      '   C.NM_COLIGADA,'
      '   GP.CD_PESSOA'
      'FROM'
      '   COLIGADAS C'
      '      JOIN NU_GRUPOS_PESSOAS GP ON'
      '         (C.CD_COLIGADA = GP.CD_COLIGADA)'
      '         LEFT JOIN COLIGADAS C2 ON'
      '            (C.CD_COLIGADA_MATRIZ = C2.CD_COLIGADA) AND'
      '            (GP.CD_COLIGADA = C2.CD_COLIGADA) AND'
      '            (C2.SN_MATRIZ = 1)'
      'WHERE'
      '   GP.CD_PESSOA = :CD_PESSOA AND'
      
        '   (C.SN_MATRIZ = 1 OR (C.SN_MATRIZ = 0 AND C.CD_COLIGADA_MATRIZ' +
        ' IS NULL)) AND'
      '   (C.SN_FINANCEIRO = 1 OR C.SN_ACADEMICO = 1)')
    Params = <
      item
        DataType = ftUnknown
        Name = 'CD_PESSOA'
        ParamType = ptUnknown
      end>
    IndexFieldNames = 'NM_COLIGADA Asc'
    Left = 168
    Top = 192
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'CD_PESSOA'
        ParamType = ptUnknown
      end>
    object qryUnitsCD_COLIGADA: TIntegerField
      FieldName = 'CD_COLIGADA'
      Required = True
    end
    object qryUnitsNM_COLIGADA: TStringField
      FieldName = 'NM_COLIGADA'
      Size = 50
    end
    object qryUnitsCD_PESSOA: TIntegerField
      FieldName = 'CD_PESSOA'
      Required = True
    end
  end
  object dsUnits: TDataSource
    AutoEdit = False
    DataSet = qryUnits
    OnDataChange = dsUnitsDataChange
    Left = 200
    Top = 192
  end
  object qryDepts: TUMZReadOnlyQuery
    Connection = DM.conn
    SQL.Strings = (
      'SELECT DISTINCT'
      '   D.CODIGO CD_DEPTO,'
      '   D.DESCRICAO DS_DEPTO,'
      '   GP.CD_PESSOA,'
      '   C.CD_COLIGADA'
      'FROM'
      '   DEPARTAMENTOS D'
      '      JOIN COLIGADAS C ON'
      '         (D.CD_COLIGADA = C.CD_COLIGADA)'
      '         JOIN NU_GRUPOS_PESSOAS GP ON'
      '            (C.CD_COLIGADA = GP.CD_COLIGADA)'
      '         LEFT JOIN COLIGADAS C2 ON'
      '            (C.CD_COLIGADA_MATRIZ = C2.CD_COLIGADA) AND'
      '            (GP.CD_COLIGADA = C2.CD_COLIGADA) AND'
      '            (C2.SN_MATRIZ = 1)'
      'WHERE'
      '   GP.CD_PESSOA = :CD_PESSOA AND'
      '   D.CD_COLIGADA = :CD_COLIGADA AND'
      
        '   (C.SN_MATRIZ = 1 OR (C.SN_MATRIZ = 0 AND C.CD_COLIGADA_MATRIZ' +
        ' IS NULL)) AND'
      '   (C.SN_FINANCEIRO = 1 OR C.SN_ACADEMICO = 1)')
    Params = <
      item
        DataType = ftUnknown
        Name = 'CD_PESSOA'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'CD_COLIGADA'
        ParamType = ptUnknown
      end>
    DataSource = dsUnits
    Left = 168
    Top = 232
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'CD_PESSOA'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'CD_COLIGADA'
        ParamType = ptUnknown
      end>
    object qryDeptsCD_DEPTO: TSmallintField
      FieldName = 'CD_DEPTO'
    end
    object qryDeptsDS_DEPTO: TStringField
      FieldName = 'DS_DEPTO'
      Size = 50
    end
    object qryDeptsCD_PESSOA: TIntegerField
      FieldName = 'CD_PESSOA'
      Required = True
    end
    object qryDeptsCD_COLIGADA: TIntegerField
      FieldName = 'CD_COLIGADA'
      Required = True
    end
  end
  object dsDepts: TDataSource
    AutoEdit = False
    DataSet = qryDepts
    OnDataChange = dsUnitsDataChange
    Left = 200
    Top = 232
  end
  object qryCourses: TUMZReadOnlyQuery
    Connection = DM.conn
    SortedFields = 'CD_CURSO'
    SQL.Strings = (
      'SELECT DISTINCT'
      '   CC.CD_CURSO,'
      '   CC.CD_COLIGADA,'
      '   CC.CD_DEPTO'
      'FROM'
      '   CURSOS_COLIGADAS CC'
      '      JOIN COLIGADAS C ON'
      '         (CC.CD_COLIGADA = C.CD_COLIGADA)'
      '         JOIN NU_GRUPOS_PESSOAS GP ON'
      '            (C.CD_COLIGADA = GP.CD_COLIGADA)'
      '         LEFT JOIN COLIGADAS C2 ON'
      '            (C.CD_COLIGADA_MATRIZ = C2.CD_COLIGADA) AND'
      '            (GP.CD_COLIGADA = C2.CD_COLIGADA) AND'
      '            (C2.SN_MATRIZ = 1)'
      'WHERE'
      '   GP.CD_PESSOA = :CD_PESSOA AND'
      '   CC.CD_DEPTO = :CD_DEPTO AND'
      '   CC.CD_COLIGADA = :CD_COLIGADA AND'
      
        '   (C.SN_MATRIZ = 1 OR (C.SN_MATRIZ = 0 AND C.CD_COLIGADA_MATRIZ' +
        ' IS NULL)) AND'
      '   (C.SN_FINANCEIRO = 1 OR C.SN_ACADEMICO = 1)')
    Params = <
      item
        DataType = ftUnknown
        Name = 'CD_PESSOA'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'CD_DEPTO'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'CD_COLIGADA'
        ParamType = ptUnknown
      end>
    DataSource = dsDepts
    IndexFieldNames = 'CD_CURSO Asc'
    Left = 168
    Top = 272
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'CD_PESSOA'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'CD_DEPTO'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'CD_COLIGADA'
        ParamType = ptUnknown
      end>
    object qryCoursesCD_CURSO: TStringField
      FieldName = 'CD_CURSO'
      Required = True
      Size = 15
    end
    object qryCoursesCD_COLIGADA: TSmallintField
      FieldName = 'CD_COLIGADA'
      Required = True
    end
    object qryCoursesCD_DEPTO: TSmallintField
      FieldName = 'CD_DEPTO'
      Required = True
    end
  end
  object dsCourses: TDataSource
    AutoEdit = False
    DataSet = qryCourses
    OnDataChange = dsUnitsDataChange
    Left = 200
    Top = 272
  end
  object qryViewClasses: TUMZReadOnlyQuery
    Connection = DM.conn
    SortedFields = 'CD_TURMA'
    Filtered = True
    SQL.Strings = (
      'SELECT'
      '   T.CODIGO CD_TURMA,'
      '   T.ANOSEMESTRE NR_ANOSEMESTRE,'
      '   T.CD_SITUACAO,'
      '   T.CD_COLIGADA,'
      '   CC.CD_DEPTO,'
      '   CC.CD_CURSO,'
      '   T.DATAINICIO DT_INICIO,'
      '   T.DATAFIM DT_FIM,'
      '   T.SN_ATIVA'
      'FROM'
      '   CURSOS_COLIGADAS CC'
      '      JOIN CURSOS_MESTRE CM ON'
      '         (CC.CD_CURSO = CM.CD_CURSO)'
      '      JOIN TURMAS T ON'
      '         (CC.CD_CURSO = T.CURSO) AND'
      '         (CC.CD_COLIGADA = T.CD_COLIGADA)')
    Params = <>
    IndexFieldNames = 'CD_TURMA Asc'
    Left = 168
    Top = 312
    object qryViewClassesCD_TURMA: TStringField
      FieldName = 'CD_TURMA'
      Required = True
      Size = 50
    end
    object qryViewClassesNR_ANOSEMESTRE: TSmallintField
      FieldName = 'NR_ANOSEMESTRE'
      Required = True
      DisplayFormat = '0000/0;0;_'
    end
    object qryViewClassesCD_SITUACAO: TSmallintField
      FieldName = 'CD_SITUACAO'
    end
    object qryViewClassesCD_COLIGADA: TIntegerField
      FieldName = 'CD_COLIGADA'
      Required = True
    end
    object qryViewClassesCD_DEPTO: TSmallintField
      FieldName = 'CD_DEPTO'
      Required = True
    end
    object qryViewClassesCD_CURSO: TStringField
      FieldName = 'CD_CURSO'
      Required = True
      Size = 15
    end
    object qryViewClassesDT_INICIO: TDateTimeField
      FieldName = 'DT_INICIO'
    end
    object qryViewClassesDT_FIM: TDateTimeField
      FieldName = 'DT_FIM'
    end
    object qryViewClassesSN_ATIVA: TSmallintField
      FieldName = 'SN_ATIVA'
    end
    object qryViewClassesNM_COLIGADA: TStringField
      FieldKind = fkLookup
      FieldName = 'NM_COLIGADA'
      LookupDataSet = qryUnits
      LookupKeyFields = 'CD_COLIGADA'
      LookupResultField = 'NM_COLIGADA'
      KeyFields = 'CD_COLIGADA'
      Lookup = True
    end
    object qryViewClassesDS_SITUACAO: TStringField
      FieldKind = fkLookup
      FieldName = 'DS_SITUACAO'
      LookupDataSet = qryStatus
      LookupKeyFields = 'CD_SITUACAO'
      LookupResultField = 'DS_VALOR'
      KeyFields = 'CD_SITUACAO'
      Lookup = True
    end
  end
  object dsViewClasses: TDataSource
    AutoEdit = False
    DataSet = qryViewClasses
    Left = 200
    Top = 312
  end
  object qryStatus: TUMZReadOnlyQuery
    Connection = DM.conn
    SQL.Strings = (
      'SELECT'
      '   CODIGO,'
      '   CD_MODULO,'
      '   CD_SITUACAO,'
      '   DS_VALOR,'
      '   DS_SIGLA'
      'FROM'
      '   SITUACOES'
      'WHERE'
      '   CD_MODULO = 1148')
    Params = <>
    Left = 176
    Top = 352
    object qryStatusCODIGO: TLargeintField
      FieldName = 'CODIGO'
      Required = True
    end
    object qryStatusCD_MODULO: TLargeintField
      FieldName = 'CD_MODULO'
    end
    object qryStatusCD_SITUACAO: TIntegerField
      FieldName = 'CD_SITUACAO'
    end
    object qryStatusDS_VALOR: TStringField
      FieldName = 'DS_VALOR'
      Size = 255
    end
    object qryStatusDS_SIGLA: TStringField
      FieldName = 'DS_SIGLA'
      Size = 50
    end
  end
end
