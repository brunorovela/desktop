object frmSelDisciplinasAcad: TfrmSelDisciplinasAcad
  Left = 297
  Top = 245
  Caption = 'Selecionar uma Disciplina'
  ClientHeight = 317
  ClientWidth = 466
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
    Top = 48
    Width = 446
    Height = 5
    Style = bsRaised
  end
  object Label3: TLabel
    Left = 15
    Top = 14
    Width = 32
    Height = 14
    Caption = 'Curso:'
  end
  object btnCodigoCurso: TSpeedButton
    Left = 176
    Top = 11
    Width = 33
    Height = 23
    Flat = True
    Glyph.Data = {
      76010000424D7601000000000000760000002800000020000000100000000100
      04000000000000010000130B0000130B00001000000000000000000000000000
      800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
      FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333333333333
      33033333333333333F7F3333333333333000333333333333F777333333333333
      000333333333333F777333333333333000333333333333F77733333333333300
      033333333FFF3F777333333700073B703333333F7773F77733333307777700B3
      33333377333777733333307F8F8F7033333337F333F337F3333377F8F9F8F773
      3333373337F3373F3333078F898F870333337F33F7FFF37F333307F99999F703
      33337F377777337F3333078F898F8703333373F337F33373333377F8F9F8F773
      333337F3373337F33333307F8F8F70333333373FF333F7333333330777770333
      333333773FF77333333333370007333333333333777333333333}
    NumGlyphs = 2
    OnClick = btnCodigoCursoClick
  end
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
    Top = 64
    Width = 447
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
        Width = 70
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'codigo'
        Title.Caption = 'C'#243'digo'
        Width = 40
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'sigla'
        Title.Caption = 'Sigla'
        Width = 40
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'descricao'
        Title.Caption = 'Descri'#231#227'o'
        Width = 270
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
  object txtCurso: TEdit
    Left = 55
    Top = 11
    Width = 121
    Height = 22
    TabOrder = 2
  end
  object qryCursos: TUMZQuery
    Connection = DM.db
    Filtered = True
    SQL.Strings = (
      
        'select DISTINCT d.codigo, d.curso, d.descricao, sigla from disci' +
        'plinas d, turmasprofessores tp'
      'where d.codigo = tp.disciplina and d.curso = tp.curso')
    Params = <>
    Left = 56
    Top = 288
    object qryCursoscodigo: TIntegerField
      FieldName = 'codigo'
      Origin = 'WMESTRE12.disciplinas.codigo'
    end
    object qryCursoscurso: TStringField
      FieldName = 'curso'
      Origin = 'WMESTRE12.disciplinas.curso'
      Size = 15
    end
    object qryCursosdescricao: TStringField
      FieldName = 'descricao'
      Origin = 'WMESTRE12.disciplinas.descricao'
      Size = 50
    end
    object qryCursossigla: TStringField
      FieldName = 'sigla'
      Origin = 'WMESTRE12.disciplinas.sigla'
      Size = 5
    end
  end
  object dtcCursos: TDataSource
    DataSet = qryCursos
    Left = 24
    Top = 288
  end
  object pmQtd: TPopupMenu
    OnPopup = pmQtdPopup
    Left = 88
    Top = 288
  end
end
