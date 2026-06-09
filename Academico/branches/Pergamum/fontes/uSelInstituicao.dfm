object FrmSelInstituicao: TFrmSelInstituicao
  Left = 0
  Top = 0
  BorderStyle = bsDialog
  Caption = 'Selecionar Institui'#231#227'o'
  ClientHeight = 502
  ClientWidth = 567
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  OnClose = FormClose
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object Bevel6: TBevel
    Left = 0
    Top = 25
    Width = 567
    Height = 5
    Align = alTop
    Shape = bsSpacer
    ExplicitWidth = 568
  end
  object pnTitulo: TPanel
    Left = 0
    Top = 0
    Width = 567
    Height = 25
    Align = alTop
    BevelOuter = bvLowered
    Caption = 'SELECIONE UMA INSTITUI'#199#195'O DE ENSINO'
    Color = clBlue
    Font.Charset = ANSI_CHARSET
    Font.Color = clWhite
    Font.Height = -13
    Font.Name = 'Arial'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 0
  end
  object Panel1: TPanel
    Left = 0
    Top = 30
    Width = 567
    Height = 107
    Align = alTop
    BevelOuter = bvNone
    TabOrder = 1
    object Label2: TLabel
      Left = 10
      Top = 13
      Width = 37
      Height = 13
      Caption = 'C'#243'digo:'
    end
    object Label1: TLabel
      Left = 16
      Top = 39
      Width = 31
      Height = 13
      Caption = 'Nome:'
    end
    object Bevel1: TBevel
      Left = 8
      Top = 93
      Width = 548
      Height = 5
      Style = bsRaised
    end
    object Label3: TLabel
      Left = 10
      Top = 64
      Width = 37
      Height = 13
      Caption = 'Cidade:'
    end
    object txCodigo: TEdit
      Left = 51
      Top = 11
      Width = 72
      Height = 21
      Hint = 'Digite o c'#243'digo sem h'#237'fen'
      ParentShowHint = False
      ShowHint = True
      TabOrder = 0
      OnEnter = txCodigoEnter
      OnKeyPress = txCodigoKeyPress
    end
    object txNome: TEdit
      Left = 51
      Top = 36
      Width = 347
      Height = 21
      CharCase = ecUpperCase
      TabOrder = 1
      OnEnter = txNomeEnter
      OnKeyPress = txNomeKeyPress
    end
    object txCidade: TEdit
      Left = 51
      Top = 61
      Width = 347
      Height = 21
      CharCase = ecUpperCase
      TabOrder = 2
      OnEnter = txCidadeEnter
      OnKeyPress = txCidadeKeyPress
    end
    object ckbTodas: TCheckBox
      Left = 216
      Top = 13
      Width = 182
      Height = 17
      Caption = 'Mostrar todas as Institui'#231#245'es'
      TabOrder = 3
      OnClick = ckbTodasClick
    end
  end
  object grdPessoa: TDBGrid
    Left = 8
    Top = 143
    Width = 547
    Height = 315
    BorderStyle = bsNone
    DataSource = dtcInstituicao
    Options = [dgTitles, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgAlwaysShowSelection, dgConfirmDelete, dgCancelOnExit]
    TabOrder = 2
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'Tahoma'
    TitleFont.Style = []
    OnDblClick = grdPessoaDblClick
    OnKeyPress = grdPessoaKeyPress
    Columns = <
      item
        Expanded = False
        FieldName = 'cd_instituicao'
        Title.Caption = 'C'#243'd. Institui'#231#227'o'
        Width = 62
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'nm_instituicao'
        Width = 290
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'ds_cidade'
        Width = 130
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'ds_estado'
        Width = 35
        Visible = True
      end>
  end
  object Panel2: TPanel
    Left = 0
    Top = 464
    Width = 567
    Height = 38
    Align = alBottom
    BevelOuter = bvNone
    TabOrder = 3
    object btnFechar: TSpeedButton
      Left = 464
      Top = 5
      Width = 87
      Height = 25
      Hint = 'Sair'
      Caption = 'F12 Sai&r'
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
    object SpeedButton1: TSpeedButton
      Left = 368
      Top = 5
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
  end
  object qryInstituicao: TUMZQuery
    Connection = DM.db
    SQL.Strings = (
      
        'select cd_instituicao, nm_instituicao, ds_cidade, ds_estado from' +
        ' instituicoes_ensino')
    Params = <>
    Left = 368
    Top = 264
    object qryInstituicaonm_instituicao: TStringField
      DisplayLabel = 'Nome da Institui'#231#227'o'
      FieldName = 'nm_instituicao'
      Origin = 'WMESTRE12.instituicoes_ensino.nm_instituicao'
      Size = 80
    end
    object qryInstituicaods_cidade: TStringField
      DisplayLabel = 'Cidade'
      FieldName = 'ds_cidade'
      Origin = 'WMESTRE12.instituicoes_ensino.ds_cidade'
      Size = 50
    end
    object qryInstituicaods_estado: TStringField
      DisplayLabel = 'Estado'
      FieldName = 'ds_estado'
      Origin = 'WMESTRE12.instituicoes_ensino.ds_estado'
      FixedChar = True
      Size = 3
    end
    object qryInstituicaocd_instituicao: TIntegerField
      FieldName = 'cd_instituicao'
      Required = True
    end
  end
  object dtcInstituicao: TDataSource
    DataSet = qryInstituicao
    Left = 400
    Top = 264
  end
end
