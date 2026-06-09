object frmSelCursos: TfrmSelCursos
  Left = 293
  Top = 281
  BorderStyle = bsDialog
  Caption = 'Selecionar o Curso...'
  ClientHeight = 319
  ClientWidth = 438
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
    Top = 48
    Width = 414
    Height = 5
    Style = bsRaised
  end
  object Label3: TLabel
    Left = 39
    Top = 14
    Width = 29
    Height = 14
    Caption = 'Curso'
  end
  object Label1: TLabel
    Left = 217
    Top = 14
    Width = 39
    Height = 14
    Caption = 'Per'#237'odo:'
  end
  object grd: TDBGrid
    Left = 10
    Top = 64
    Width = 415
    Height = 211
    BorderStyle = bsNone
    DataSource = dtcCursos
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Arial'
    Font.Style = []
    Options = [dgTitles, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgAlwaysShowSelection, dgConfirmDelete, dgCancelOnExit]
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
        FieldName = 'codigo'
        Title.Caption = 'C'#243'digo'
        Width = 100
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'descricao'
        Title.Caption = 'Descri'#231#227'o'
        Width = 285
        Visible = True
      end>
  end
  object txtCurso: TEdit
    Left = 75
    Top = 10
    Width = 122
    Height = 22
    ParentShowHint = False
    ShowHint = True
    TabOrder = 1
    OnKeyPress = txtCursoKeyPress
  end
  object txtAnoSemestre: TMaskEdit
    Left = 259
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
    TabOrder = 2
    Text = '19931'
  end
  object UpDown2: TUpDown
    Left = 310
    Top = 10
    Width = 16
    Height = 24
    Min = -100
    TabOrder = 3
    OnClick = UpDown2Click
  end
  object btnFechar: TButton
    Left = 335
    Top = 288
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
  object qryCursos: TUMZQuery
    Filtered = True
    SQL.Strings = (
      'select codigo, descricao, anosemestre, grau from cursos'
      'order by  anosemestre DESC, codigo')
    Params = <>
    Left = 48
    Top = 280
    object qryCursoscodigo: TStringField
      FieldName = 'codigo'
      Origin = 'WMESTRE12.cursos.codigo'
      Size = 15
    end
    object qryCursosdescricao: TStringField
      FieldName = 'descricao'
      Origin = 'WMESTRE12.cursos.descricao'
      Size = 100
    end
    object qryCursosanosemestre: TSmallintField
      FieldName = 'anosemestre'
      Origin = 'WMESTRE12.cursos.anosemestre'
    end
    object qryCursosgrau: TSmallintField
      FieldName = 'grau'
      Origin = 'WMESTRE12.cursos.grau'
    end
  end
  object dtcCursos: TDataSource
    DataSet = qryCursos
    Left = 16
    Top = 280
  end
end
