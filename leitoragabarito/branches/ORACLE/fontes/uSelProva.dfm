object frmSelProva: TfrmSelProva
  Left = 293
  Top = 281
  Caption = 'Selecionar a Prova...'
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
    Left = 10
    Top = 40
    Width = 415
    Height = 5
    Style = bsRaised
  end
  object Label3: TLabel
    Left = 130
    Top = 14
    Width = 52
    Height = 14
    Caption = 'Descri'#231#227'o:'
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
  object Label1: TLabel
    Left = 10
    Top = 14
    Width = 54
    Height = 14
    Caption = 'Nro. Prova:'
  end
  object grd: TDBGrid
    Left = 10
    Top = 56
    Width = 415
    Height = 219
    BorderStyle = bsNone
    DataSource = srcProva
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
        FieldName = 'nr_prova'
        Title.Caption = 'Nro.Prova'
        Width = 60
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'ds_prova'
        Title.Caption = 'Descri'#231#227'o'
        Width = 300
        Visible = True
      end>
  end
  object txtDescricao: TEdit
    Left = 184
    Top = 10
    Width = 241
    Height = 22
    ParentShowHint = False
    ShowHint = True
    TabOrder = 1
    OnKeyPress = txtDescricaoKeyPress
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
    TabOrder = 2
    OnClick = btnFecharClick
  end
  object UpDown2: TUpDown
    Left = 97
    Top = 9
    Width = 14
    Height = 24
    Min = -100
    TabOrder = 3
    OnClick = UpDown2Click
  end
  object txtNroProva: TMaskEdit
    Tag = 1
    Left = 67
    Top = 10
    Width = 33
    Height = 22
    TabStop = False
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Arial'
    Font.Style = []
    ParentFont = False
    TabOrder = 4
    Text = '1'
  end
  object qyProva: TUMZQuery
    Connection = DM.db
    Filtered = True
    SQL.Strings = (
      'SELECT * FROM leitora_provas ORDER BY nr_prova, ds_prova')
    Left = 48
    Top = 288
    object qyProvacd_prova: TIntegerField
      FieldName = 'cd_prova'
      Origin = 'WMESTRE12.leitora_provas.cd_prova'
    end
    object qyProvanr_prova: TSmallintField
      FieldName = 'nr_prova'
      Origin = 'WMESTRE12.leitora_provas.nr_prova'
    end
    object qyProvads_prova: TStringField
      FieldName = 'ds_prova'
      Origin = 'WMESTRE12.leitora_provas.ds_prova'
      Size = 100
    end
    object qyProvanr_correcoes: TIntegerField
      FieldName = 'nr_correcoes'
      Origin = 'WMESTRE12.leitora_provas.nr_correcoes'
    end
  end
  object srcProva: TDataSource
    DataSet = qyProva
    Left = 16
    Top = 288
  end
  object pmQtd: TPopupMenu
    OnPopup = pmQtdPopup
    Left = 664
    Top = 264
  end
end