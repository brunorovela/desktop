object frmSelCep: TfrmSelCep
  Left = 306
  Top = 225
  BorderStyle = bsDialog
  Caption = 'Selecionar o CEP'
  ClientHeight = 377
  ClientWidth = 592
  Color = clBtnFace
  Font.Charset = ANSI_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Arial'
  Font.Style = []
  KeyPreview = True
  OldCreateOrder = True
  Position = poScreenCenter
  OnClose = FormClose
  OnCloseQuery = FormCloseQuery
  OnDestroy = FormDestroy
  OnKeyDown = FormKeyDown
  OnPaint = FormPaint
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 14
  object Bevel1: TBevel
    Left = 11
    Top = 72
    Width = 574
    Height = 5
    Style = bsRaised
  end
  object Label3: TLabel
    Left = 47
    Top = 12
    Width = 22
    Height = 14
    Alignment = taRightJustify
    Caption = 'CEP:'
  end
  object Label1: TLabel
    Left = 10
    Top = 44
    Width = 59
    Height = 14
    Alignment = taRightJustify
    Caption = 'Logradouro:'
  end
  object Label2: TLabel
    Left = 276
    Top = 44
    Width = 32
    Height = 14
    Alignment = taRightJustify
    Caption = 'Bairro:'
  end
  object Label4: TLabel
    Left = 272
    Top = 12
    Width = 36
    Height = 14
    Alignment = taRightJustify
    Caption = 'Cidade:'
  end
  object SpeedButton1: TSpeedButton
    Left = 400
    Top = 344
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
    Top = 88
    Width = 575
    Height = 249
    BorderStyle = bsNone
    DataSource = dtcCep
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
    Columns = <
      item
        Expanded = False
        FieldName = 'nm_logradouro'
        Title.Caption = 'Logradouro'
        Width = 203
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'ds_cep'
        Title.Caption = 'CEP'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'ds_complemento'
        Title.Caption = 'Complemento'
        Width = 100
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'nm_bairro'
        Title.Caption = 'Bairro'
        Width = 80
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'nm_cidade'
        Title.Caption = 'Cidade'
        Width = 85
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'ds_uf'
        Title.Caption = 'UF'
        Width = 20
        Visible = True
      end>
  end
  object btnFechar: TButton
    Left = 495
    Top = 344
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
  object edLogradouro: TEdit
    Left = 80
    Top = 40
    Width = 175
    Height = 22
    CharCase = ecUpperCase
    TabOrder = 2
    OnKeyPress = edLogradouroKeyPress
  end
  object edBairro: TEdit
    Left = 312
    Top = 40
    Width = 175
    Height = 22
    CharCase = ecUpperCase
    TabOrder = 3
    OnKeyPress = edBairroKeyPress
  end
  object edCidade: TEdit
    Left = 312
    Top = 8
    Width = 175
    Height = 22
    CharCase = ecUpperCase
    TabOrder = 4
    OnKeyPress = edCidadeKeyPress
  end
  object edCep: TEdit
    Left = 80
    Top = 8
    Width = 175
    Height = 22
    CharCase = ecUpperCase
    TabOrder = 5
    OnKeyPress = edCepKeyPress
  end
  object qyCep: TUMZQuery
    Connection = DM.db
    Filtered = True
    SQL.Strings = (
      'SELECT DISTINCT'
      #9'cl.nm_logradouro,'
      #9'cl.ds_cep,'
      '                ct.ds_logradouro,'
      '                ct.cd_logradouro,'
      #9'cl.ds_complemento,'
      #9'cb.nm_bairro,'
      #9'cc.nm_cidade,'
      #9'ce.ds_uf,'
      #9'cp.ds_pais,'
      '               cc.cd_cidade,'
      '               m.cd_municipio'
      'FROM'
      #9'cep_logradouros cl'
      'INNER JOIN logradouros ct ON('
      #9'cl.cd_tipo = ct.cd_logradouro'
      ')'
      'INNER JOIN cep_bairros cb ON('
      '  cl.cd_cidade = cb.cd_cidade'
      #9'AND cl.ds_uf = cb.ds_uf'
      #9'AND('
      #9#9'cl.cd_bairro1 = cb.cd_bairro'
      #9#9'OR cl.cd_bairro2 = cb.cd_bairro'
      #9')'
      ')'
      'INNER JOIN cep_cidades cc ON('
      #9'cl.cd_cidade = cc.cd_cidade'
      #9'AND cl.ds_uf = cc.ds_uf'
      ')'
      'INNER JOIN estados ce ON('
      #9'cl.ds_uf = ce.ds_uf'
      ')'
      'INNER JOIN municipios m ON('
      #9'm.ds_municipio = cc.nm_cidade'
      #9'AND m.uf = ce.ds_uf'
      ')'
      'INNER JOIN paises cp ON('
      #9'cp.cd_pais = ce.cd_pais'
      ')')
    Params = <>
    Left = 56
    Top = 344
    object qyCepnm_logradouro: TStringField
      FieldName = 'nm_logradouro'
      Origin = 'WMESTRE12.cep_logradouros.nm_logradouro'
      FixedChar = True
      Size = 100
    end
    object qyCepds_cep: TStringField
      FieldName = 'ds_cep'
      Origin = 'WMESTRE12.cep_logradouros.ds_cep'
      FixedChar = True
      Size = 8
    end
    object qyCepds_complemento: TStringField
      FieldName = 'ds_complemento'
      Origin = 'WMESTRE12.cep_logradouros.ds_complemento'
      FixedChar = True
      Size = 100
    end
    object qyCepnm_bairro: TStringField
      FieldName = 'nm_bairro'
      Origin = 'WMESTRE12.cep_bairros.nm_bairro'
      FixedChar = True
      Size = 100
    end
    object qyCepnm_cidade: TStringField
      FieldName = 'nm_cidade'
      Origin = 'WMESTRE12.cep_cidades.nm_cidade'
      FixedChar = True
      Size = 100
    end
    object qyCepds_uf: TStringField
      FieldName = 'ds_uf'
      Origin = 'WMESTRE12.estados.ds_estado'
      Size = 50
    end
    object qyCepds_pais: TStringField
      FieldName = 'ds_pais'
      Origin = 'WMESTRE12.paises.ds_pais'
      Size = 50
    end
    object qyCepcd_cidade: TIntegerField
      FieldName = 'cd_cidade'
      Required = True
    end
    object qyCepcd_municipio: TLargeintField
      FieldName = 'cd_municipio'
      Required = True
    end
    object qyCepds_logradouro: TStringField
      FieldName = 'ds_logradouro'
      Size = 120
    end
    object qyCepcd_logradouro: TIntegerField
      FieldName = 'cd_logradouro'
      Required = True
    end
  end
  object dtcCep: TDataSource
    DataSet = qyCep
    Left = 24
    Top = 344
  end
  object pmQtd: TPopupMenu
    OnPopup = pmQtdPopup
    Left = 664
    Top = 264
  end
end
