object frmSelDesconto: TfrmSelDesconto
  Left = 352
  Top = 185
  Caption = 'Selecionar o Plano de desconto...'
  ClientHeight = 324
  ClientWidth = 339
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
    Top = 40
    Width = 318
    Height = 5
    Style = bsRaised
  end
  object Label3: TLabel
    Left = 39
    Top = 14
    Width = 52
    Height = 14
    Caption = 'Descri'#231#227'o:'
  end
  object SpeedButton1: TSpeedButton
    Left = 144
    Top = 296
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
  end
  object grd: TDBGrid
    Left = 10
    Top = 56
    Width = 319
    Height = 233
    DataSource = dtcTurmas
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Arial'
    Font.Style = []
    Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgConfirmDelete, dgCancelOnExit]
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
        FieldName = 'descricaoplano'
        Title.Caption = 'Descri'#231#227'o do plano'
        Width = 283
        Visible = True
      end>
  end
  object txtDescricao: TEdit
    Left = 123
    Top = 10
    Width = 166
    Height = 22
    ParentShowHint = False
    ShowHint = True
    TabOrder = 1
    OnKeyPress = txtDescricaoKeyPress
  end
  object btnFechar: TButton
    Left = 239
    Top = 296
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
  object qryPlanoDesconto: TUMZQuery
    Connection = DM.db
    Filtered = True
    SQL.Strings = (
      'select * from planosdesconto')
    Params = <>
    Left = 48
    Top = 296
    object qryPlanoDescontocodigo: TIntegerField
      FieldName = 'codigo'
      Origin = 'WMESTRE12.planosdesconto.codigo'
    end
    object qryPlanoDescontodescricaoplano: TStringField
      FieldName = 'descricaoplano'
      Origin = 'WMESTRE12.planosdesconto.descricaoplano'
      Size = 40
    end
    object qryPlanoDescontopercentualdesconto: TFloatField
      FieldName = 'percentualdesconto'
      Origin = 'WMESTRE12.planosdesconto.percentualdesconto'
    end
    object qryPlanoDescontovalordesconto: TFloatField
      FieldName = 'valordesconto'
      Origin = 'WMESTRE12.planosdesconto.valordesconto'
    end
  end
  object dtcTurmas: TDataSource
    DataSet = qryPlanoDesconto
    Left = 16
    Top = 296
  end
  object pmQtd: TPopupMenu
    OnPopup = pmQtdPopup
    Left = 80
    Top = 296
  end
end
