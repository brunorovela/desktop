object frmSelecionarCentro: TfrmSelecionarCentro
  Left = 0
  Top = 0
  BorderIcons = []
  BorderStyle = bsSingle
  Caption = 'Sele'#231#227'o de centro de custos'
  ClientHeight = 216
  ClientWidth = 319
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
  object pnFundo: TPanel
    Left = 0
    Top = 0
    Width = 319
    Height = 216
    Align = alClient
    BevelOuter = bvNone
    TabOrder = 0
    ExplicitHeight = 213
    object lbValor: TLabel
      Left = 16
      Top = 119
      Width = 35
      Height = 16
      Caption = 'Valor:'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
    end
    object lbCentroCusto: TLabel
      Left = 16
      Top = 11
      Width = 97
      Height = 16
      Caption = 'Centro de Custo:'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
    end
    object btnFechar: TSpeedButton
      Left = 107
      Top = 175
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
    object lbPercentual: TLabel
      Left = 16
      Top = 63
      Width = 65
      Height = 16
      Caption = 'Percentual:'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
    end
    object edValor: TEdit
      Left = 16
      Top = 141
      Width = 121
      Height = 24
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
      TabOrder = 0
      OnKeyDown = edValorKeyDown
      OnKeyPress = edValorKeyPress
    end
    object cbCentro: TComboBox
      Left = 16
      Top = 33
      Width = 281
      Height = 24
      Style = csDropDownList
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Tahoma'
      Font.Style = []
      ItemHeight = 16
      ParentFont = False
      TabOrder = 1
    end
    object btSelecionar: TBitBtn
      Left = 16
      Top = 175
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
      OnClick = btSelecionarClick
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
    object edPercentual: TEdit
      Left = 16
      Top = 85
      Width = 121
      Height = 24
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
      TabOrder = 3
      OnChange = edPercentualChange
      OnKeyDown = edValorKeyDown
      OnKeyPress = edValorKeyPress
    end
  end
  object qryCentroCusto: TUMZReadOnlyQuery
    Connection = DM.db
    SQL.Strings = (
      'SELECT'
      #9'cd_centro,'
      #9'ds_centro'
      'FROM'
      #9'fin_config_centro_custos'
      'WHERE'
      #9'tp_centro = 1'
      #9'AND cd_coligada_matriz = :cd_coligada_matriz'
      '  AND sn_ativo = 1'
      'ORDER BY'
      ' ds_centro')
    Params = <
      item
        DataType = ftUnknown
        Name = 'cd_coligada_matriz'
        ParamType = ptUnknown
      end>
    Left = 272
    Top = 8
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'cd_coligada_matriz'
        ParamType = ptUnknown
      end>
  end
end
