object frmSelTurmas: TfrmSelTurmas
  Left = 325
  Top = 175
  Width = 334
  Height = 465
  Caption = 'Selecionar a Turma...'
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
    Top = 104
    Width = 302
    Height = 5
    Style = bsRaised
  end
  object Label1: TLabel
    Left = 9
    Top = 14
    Width = 72
    Height = 14
    Caption = 'Ano/Semestre:'
  end
  object Label2: TLabel
    Left = 8
    Top = 46
    Width = 70
    Height = 14
    Caption = 'Departamento:'
  end
  object Label3: TLabel
    Left = 8
    Top = 78
    Width = 32
    Height = 14
    Caption = 'Curso:'
  end
  object Label4: TLabel
    Left = 160
    Top = 78
    Width = 33
    Height = 14
    Caption = 'Turma:'
  end
  object btnFechar: TSpeedButton
    Left = 224
    Top = 400
    Width = 87
    Height = 22
    Caption = 'F12 Fechar'
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
  object grd: TDBGrid
    Left = 10
    Top = 120
    Width = 303
    Height = 275
    DataSource = dtcTurmas
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Arial'
    Font.Style = []
    Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgAlwaysShowSelection, dgConfirmDelete, dgCancelOnExit]
    ParentFont = False
    PopupMenu = pmQtd
    TabOrder = 0
    TitleFont.Charset = ANSI_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'Arial'
    TitleFont.Style = []
    OnDblClick = grdDblClick
    OnKeyPress = grdKeyPress
    Columns = <
      item
        Expanded = False
        FieldName = 'turma'
        Title.Caption = 'Turma'
        Width = 147
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'anosemestre'
        Title.Caption = 'Ano/Semestre'
        Width = 97
        Visible = True
      end>
  end
  object txtAnoSemestre: TMaskEdit
    Left = 83
    Top = 10
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
    TabOrder = 1
    Text = '19931'
  end
  object UpDown2: TUpDown
    Left = 134
    Top = 10
    Width = 16
    Height = 24
    Min = -100
    TabOrder = 2
    OnClick = UpDown2Click
  end
  object cbDepto: TComboBox
    Left = 80
    Top = 40
    Width = 233
    Height = 22
    ItemHeight = 14
    TabOrder = 3
    OnChange = cbDeptoChange
  end
  object cbCurso: TComboBox
    Left = 42
    Top = 72
    Width = 111
    Height = 22
    ItemHeight = 14
    TabOrder = 4
    OnChange = cbCursoChange
  end
  object cbTurma: TComboBox
    Left = 200
    Top = 72
    Width = 113
    Height = 22
    ItemHeight = 14
    TabOrder = 5
    OnChange = cbTurmaChange
    OnKeyPress = cbTurmaKeyPress
  end
  object qryTurmas: TUMZQuery
    Connection = db
    Filtered = True
    
    SQL.Strings = (
      'SELECT'
      #9'd.descricao as depto,'
      #9'c.codigo as curso,'
      #9'c.anosemestre,'
      #9't.codigo as turma'
      'FROM'
      #9'departamentos d,'
      #9'cursos c,'
      #9'turmas t'
      'WHERE'
      #9'c.depto = d.codigo AND'
      #9't.curso = c.codigo'
      #9'AND c.anosemestre = :anosemestre'
      #9'AND d.descricao = :depto'
      #9'AND c.codigo = :curso'
      #9'AND t.codigo = :turma'
      'GROUP BY'
      #9'd.codigo,'
      #9'c.codigo,'
      #9't.codigo'
      'ORDER BY'
      #9't.codigo')
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
      Size = 15
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
end

