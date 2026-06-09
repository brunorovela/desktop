object frmSelecionarHistoricos: TfrmSelecionarHistoricos
  Left = 0
  Top = 0
  BorderIcons = []
  BorderStyle = bsSingle
  Caption = 'Sele'#231#227'o de hist'#243'ricos'
  ClientHeight = 293
  ClientWidth = 409
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 409
    Height = 293
    Align = alClient
    TabOrder = 0
    object btnFechar: TSpeedButton
      Left = 99
      Top = 260
      Width = 85
      Height = 25
      Hint = 'Sair'
      Caption = 'Cancelar'
      Glyph.Data = {
        F6000000424DF600000000000000760000002800000010000000100000000100
        04000000000080000000CE0E0000C40E00001000000000000000000000000000
        80000080000000808000800000008000800080800000C0C0C000808080000000
        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00777777777777
        7777777777777777777777777744447777777777444444447777777444777744
        4777777447777774477777447777777744777744777777774477774477777777
        4477774477777777447777744777747447777774477774444777777777777444
        7777777777777444477777777777777777777777777777777777}
      OnClick = btnFecharClick
    end
    object Panel2: TPanel
      Left = 1
      Top = 1
      Width = 407
      Height = 73
      Align = alTop
      BevelOuter = bvNone
      TabOrder = 0
      object lbCodigo: TLabel
        Left = 11
        Top = 14
        Width = 44
        Height = 16
        Caption = 'C'#243'digo:'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
      end
      object lbDescricao: TLabel
        Left = 11
        Top = 44
        Width = 60
        Height = 16
        Caption = 'Descri'#231#227'o:'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
      end
      object edCodigo: TEdit
        Left = 61
        Top = 11
        Width = 332
        Height = 24
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
        TabOrder = 0
        OnKeyDown = edCodigoKeyDown
        OnKeyPress = edCodigoKeyPress
      end
      object edDescricao: TEdit
        Left = 77
        Top = 41
        Width = 316
        Height = 24
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
        TabOrder = 1
        OnKeyDown = edDescricaoKeyDown
      end
    end
    object dbgHistoricos: TDBGrid
      Left = 1
      Top = 74
      Width = 407
      Height = 181
      Align = alTop
      DataSource = dsHistoricos
      Options = [dgTitles, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgConfirmDelete, dgCancelOnExit]
      TabOrder = 1
      TitleFont.Charset = DEFAULT_CHARSET
      TitleFont.Color = clWindowText
      TitleFont.Height = -11
      TitleFont.Name = 'Tahoma'
      TitleFont.Style = []
      OnDblClick = dbgHistoricosDblClick
      Columns = <
        item
          Expanded = False
          FieldName = 'cd_historico'
          Title.Caption = 'C'#243'digo'
          Width = 50
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'ds_historico'
          Title.Caption = 'Descri'#231#227'o'
          Width = 250
          Visible = True
        end>
    end
    object BitBtn1: TBitBtn
      Left = 8
      Top = 260
      Width = 85
      Height = 25
      Caption = 'Selecionar '
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
      TabOrder = 2
      OnClick = BitBtn1Click
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
  end
  object qryHistoricos: TUMZReadOnlyQuery
    Connection = DM.db
    SQL.Strings = (
      'SELECT'
      #9'cd_historico,'
      #9'ds_historico'
      'FROM'
      #9'fin_cp_historicos')
    Params = <>
    Left = 360
    Top = 216
  end
  object dsHistoricos: TDataSource
    DataSet = qryHistoricos
    Left = 328
    Top = 216
  end
end
