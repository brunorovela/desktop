object frmCadProvasTurmas: TfrmCadProvasTurmas
  Left = 452
  Top = 123
  BorderStyle = bsDialog
  Caption = 'Selecionar a Turma...'
  ClientHeight = 440
  ClientWidth = 326
  Color = clBtnFace
  Font.Charset = ANSI_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Arial'
  Font.Style = []
  KeyPreview = True
  OldCreateOrder = True
  Position = poScreenCenter
  OnCloseQuery = FormCloseQuery
  OnKeyDown = FormKeyDown
  OnPaint = FormPaint
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 14
  object Bevel1: TBevel
    Left = 11
    Top = 145
    Width = 302
    Height = 5
    Style = bsRaised
  end
  object Label1: TLabel
    Left = 9
    Top = 14
    Width = 72
    Height = 14
    Alignment = taRightJustify
    Caption = 'Ano/Semestre:'
  end
  object Label2: TLabel
    Left = 11
    Top = 39
    Width = 70
    Height = 14
    Alignment = taRightJustify
    Caption = 'Departamento:'
  end
  object Label3: TLabel
    Left = 49
    Top = 64
    Width = 32
    Height = 14
    Alignment = taRightJustify
    Caption = 'Curso:'
  end
  object Label4: TLabel
    Left = 48
    Top = 90
    Width = 33
    Height = 14
    Alignment = taRightJustify
    Caption = 'Turma:'
  end
  object btnFechar: TSpeedButton
    Left = 235
    Top = 412
    Width = 79
    Height = 22
    Caption = 'F12 Fechar'
    Flat = True
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
    OnClick = btnFecharClick
  end
  object SpeedButton1: TSpeedButton
    Left = 123
    Top = 412
    Width = 107
    Height = 22
    Caption = 'Salvar e Fechar'
    Flat = True
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
    OnClick = SpeedButton1Click
  end
  object sbSalvar: TSpeedButton
    Left = 11
    Top = 412
    Width = 107
    Height = 22
    Caption = 'Salvar'
    Flat = True
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
    OnClick = sbSalvarClick
  end
  object grd: TDBGrid
    Tag = 5
    Left = 10
    Top = 154
    Width = 303
    Height = 254
    DataSource = dtcTurmas
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Arial'
    Font.Style = []
    Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgAlwaysShowSelection, dgConfirmDelete, dgCancelOnExit, dgMultiSelect]
    ParentFont = False
    PopupMenu = pmQtd
    TabOrder = 0
    TitleFont.Charset = ANSI_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'Arial'
    TitleFont.Style = []
    OnDblClick = grdDblClick
    Columns = <
      item
        Expanded = False
        FieldName = 'turma'
        Title.Caption = 'Turma'
        Width = 180
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'anosemestre'
        Title.Caption = 'Ano/Semestre'
        Width = 82
        Visible = True
      end>
  end
  object txtAnoSemestre: TMaskEdit
    Tag = 1
    Left = 104
    Top = 10
    Width = 193
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
    TabOrder = 1
    Text = '19931'
  end
  object UpDown2: TUpDown
    Left = 294
    Top = 9
    Width = 16
    Height = 24
    Min = -100
    TabOrder = 2
    OnClick = UpDown2Click
  end
  object cbDepto: TComboBox
    Tag = 2
    Left = 83
    Top = 35
    Width = 228
    Height = 22
    ItemHeight = 14
    TabOrder = 3
    OnChange = cbDeptoChange
  end
  object cbCurso: TComboBox
    Tag = 3
    Left = 83
    Top = 60
    Width = 228
    Height = 22
    ItemHeight = 14
    TabOrder = 4
    OnChange = cbCursoChange
  end
  object cbTurma: TComboBox
    Tag = 4
    Left = 83
    Top = 86
    Width = 228
    Height = 22
    AutoComplete = False
    ItemHeight = 14
    TabOrder = 5
    OnChange = cbTurmaChange
    OnKeyPress = cbTurmaKeyPress
  end
  object cbAnoSemextre: TCheckBox
    Left = 83
    Top = 12
    Width = 17
    Height = 17
    Checked = True
    State = cbChecked
    TabOrder = 6
    OnClick = cbAnoSemextreClick
  end
  object cbAlunosCursando: TCheckBox
    Left = 11
    Top = 112
    Width = 302
    Height = 33
    Caption = 
      'Selecionar apenas alunos que estejam cursando as disciplinas da ' +
      'prova'
    Checked = True
    State = cbChecked
    TabOrder = 7
    WordWrap = True
  end
  object qryTurmas: TUMZQuery
    Connection = DM.db
    Filtered = True
    SQL.Strings = (
      'SELECT'
      #9'd.descricao as depto,'
      #9'cc.cd_curso as curso,'
      #9't.anosemestre,'
      #9't.codigo as turma'
      'FROM'
      #9'departamentos d'
      
        #9'INNER JOIN cursos_coligadas cc ON (cc.cd_depto = d.codigo AND c' +
        'c.cd_coligada = d.cd_coligada AND cc.sn_ativo = 1)'
      
        #9'INNER JOIN turmas t ON (t.curso = cc.cd_curso AND t.cd_coligada' +
        ' = cc.cd_coligada)'
      'WHERE'
      #9't.anosemestre = :anosemestre AND'
      '  d.descricao = :depto AND'
      '  cc.cd_curso = :curso AND'
      '  t.codigo = :turma'
      'GROUP BY'
      #9'd.codigo,'
      #9'cc.cd_curso,'
      #9't.codigo'
      'ORDER BY'
      #9't.codigo')
    Params = <
      item
        DataType = ftUnknown
        Name = 'anosemestre'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'depto'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'curso'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'turma'
        ParamType = ptUnknown
      end>
    Left = 48
    Top = 400
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'anosemestre'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'depto'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'curso'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'turma'
        ParamType = ptUnknown
      end>
    object qryTurmasdepto: TStringField
      FieldName = 'depto'
      Origin = 'WMESTRE12.departamentos.descricao'
      Size = 50
    end
    object qryTurmascurso: TStringField
      FieldName = 'curso'
      Origin = 'WMESTRE12.cursos.apelido'
      Size = 50
    end
    object qryTurmasanosemestre: TSmallintField
      FieldName = 'anosemestre'
      Origin = 'WMESTRE12.cursos.anosemestre'
    end
    object qryTurmasturma: TStringField
      FieldName = 'turma'
      Origin = 'WMESTRE12.turmas.codigo'
      Size = 50
    end
  end
  object dtcTurmas: TDataSource
    DataSet = qryTurmas
    Left = 16
    Top = 400
  end
  object pmQtd: TPopupMenu
    OnPopup = pmQtdPopup
    Left = 80
    Top = 400
  end
  object qyCombo: TUMZQuery
    Connection = DM.db
    Params = <>
    Left = 128
    Top = 400
  end
end
