object frmSelTurmas: TfrmSelTurmas
  Left = 482
  Top = 133
  BorderStyle = bsDialog
  Caption = 'Selecionar a Turma...'
  ClientHeight = 348
  ClientWidth = 241
  Color = clBtnFace
  Font.Charset = ANSI_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Arial'
  Font.Style = []
  KeyPreview = True
  OldCreateOrder = True
  Position = poScreenCenter
  OnDestroy = FormDestroy
  OnKeyDown = FormKeyDown
  OnPaint = FormPaint
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 14
  object Bevel1: TBevel
    Left = 11
    Top = 72
    Width = 217
    Height = 5
    Style = bsRaised
  end
  object Label3: TLabel
    Left = 39
    Top = 14
    Width = 33
    Height = 14
    Caption = 'Turma:'
  end
  object Label1: TLabel
    Left = 33
    Top = 46
    Width = 39
    Height = 14
    Caption = 'Per'#237'odo:'
  end
  object grd: TDBGrid
    Left = 10
    Top = 88
    Width = 215
    Height = 211
    DataSource = dtcTurmas
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Arial'
    Font.Style = []
    Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgConfirmDelete, dgCancelOnExit]
    ParentFont = False
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
        FieldName = 'Turma'
        Width = 83
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'AnoSemestre'
        Width = 97
        Visible = True
      end>
  end
  object txtTurma: TEdit
    Left = 75
    Top = 10
    Width = 122
    Height = 22
    ParentShowHint = False
    ShowHint = True
    TabOrder = 1
    OnKeyPress = txtTurmaKeyPress
  end
  object txtAnoSemestre: TMaskEdit
    Left = 75
    Top = 42
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
    TabOrder = 2
    Text = '19931'
  end
  object UpDown2: TUpDown
    Left = 126
    Top = 42
    Width = 16
    Height = 24
    Min = -100
    TabOrder = 3
    OnClick = UpDown2Click
  end
  object btnFechar: TButton
    Left = 135
    Top = 304
    Width = 89
    Height = 25
    Caption = 'F12 Fechar'
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Arial'
    Font.Style = []
    ModalResult = 1
    ParentFont = False
    TabOrder = 4
    OnClick = btnFecharClick
  end
  object qryTurmas: TUMZQuery
    Filtered = True
    SQL.Strings = (
      'select Turma, AnoSemestre, Curso from [Matriculas] '
      'where Turma = :Turma '
      'group by Turma, AnoSemestre, Curso'
      'order by  AnoSemestre DESC, Turma')
    Params = <
      item
        DataType = ftUnknown
        Name = 'Turma'
        ParamType = ptUnknown
      end>
    Left = 48
    Top = 304
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'Turma'
        ParamType = ptUnknown
      end>
    object qryTurmasTurma: TStringField
      Alignment = taCenter
      FieldName = 'Turma'
      Size = 5
    end
    object qryTurmasAnoSemestre: TSmallintField
      Alignment = taCenter
      DisplayLabel = 'Ano/Sem.'
      FieldName = 'AnoSemestre'
      DisplayFormat = '0000/0'
    end
    object qryTurmasCurso: TStringField
      FieldName = 'Curso'
      Size = 5
    end
  end
  object dtcTurmas: TDataSource
    DataSet = qryTurmas
    Left = 16
    Top = 304
  end
end
