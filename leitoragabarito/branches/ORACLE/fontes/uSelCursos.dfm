object frmSelCursos: TfrmSelCursos
  Left = 293
  Top = 281
  Caption = 'Selecionar o Curso...'
  ClientHeight = 313
  ClientWidth = 428
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
  object SpeedButton1: TSpeedButton
    Left = 240
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
  object udAnoSemestre: TUpDown
    Left = 310
    Top = 10
    Width = 16
    Height = 24
    Min = -100
    TabOrder = 3
    OnClick = udAnoSemestreClick
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
    Connection = DM.db
    Filtered = True
    SQL.Strings = (
      'select codigo, descricao, anosemestre, grau from cursos'
      'order by  anosemestre DESC, codigo')
    Params = <>
    Left = 48
    Top = 304
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
    Top = 304
  end
  object pmQtd: TPopupMenu
    OnPopup = pmQtdPopup
    Left = 664
    Top = 264
  end
end
