object frmSelDisciplinas: TfrmSelDisciplinas
  Left = 297
  Top = 245
  Caption = 'Selecionar uma Disciplina'
  ClientHeight = 313
  ClientWidth = 458
  Color = clBtnFace
  Font.Charset = ANSI_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Arial'
  Font.Style = []
  KeyPreview = True
  OldCreateOrder = True
  Position = poScreenCenter
  OnKeyDown = FormKeyDown
  OnPaint = FormPaint
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 14
  object SpeedButton1: TSpeedButton
    Left = 272
    Top = 288
    Width = 87
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
    OnClick = SpeedButton1Click
  end
  object grd: TDBGrid
    Left = 10
    Top = 8
    Width = 447
    Height = 267
    BorderStyle = bsNone
    DataSource = dtcCursos
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Arial'
    Font.Style = []
    Options = [dgTitles, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgAlwaysShowSelection, dgConfirmDelete, dgCancelOnExit]
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
        FieldName = 'curso'
        Title.Caption = 'Curso'
        Width = 83
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'descricao'
        Title.Caption = 'Descri'#231#227'o'
        Width = 276
        Visible = True
      end>
  end
  object btnFechar: TButton
    Left = 367
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
    TabOrder = 1
    OnClick = btnFecharClick
  end
  object qryCursos: TUMZQuery
    Connection = DM.db
    Filtered = True
    SQL.Strings = (
      'SELECT'
      '   pd.cd_prova_disciplina,'
      '   d.descricao,'
      '   d.curso'
      'FROM'
      '   leitora_provas_disciplinas pd'
      
        '      INNER JOIN disciplinas d ON (d.codigo = pd.cd_disciplina A' +
        'ND d.curso = pd.cd_curso)'
      'WHERE'
      '   pd.cd_prova = :cd_prova')
    Left = 56
    Top = 288
    ParamData = <
      item
        DataType = ftString
        Name = 'cd_prova'
        ParamType = ptUnknown
      end>
    object qryCursoscd_prova_disciplina: TIntegerField
      FieldName = 'cd_prova_disciplina'
      Origin = 'WMESTRE12.leitora_provas_disciplinas.cd_prova_disciplina'
    end
    object qryCursosdescricao: TStringField
      FieldName = 'descricao'
      Origin = 'WMESTRE12.disciplinas.descricao'
      Size = 100
    end
    object qryCursoscurso: TStringField
      FieldName = 'curso'
      Origin = 'WMESTRE12.disciplinas.curso'
      Size = 15
    end
  end
  object dtcCursos: TDataSource
    DataSet = qryCursos
    Left = 24
    Top = 288
  end
  object pmQtd: TPopupMenu
    Left = 88
    Top = 288
  end
end