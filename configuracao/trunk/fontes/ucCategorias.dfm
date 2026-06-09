object fcCategorias: TfcCategorias
  Left = 486
  Top = 259
  BorderStyle = bsDialog
  Caption = 'Par'#226'metros - Categorias'
  ClientHeight = 259
  ClientWidth = 332
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Position = poDesktopCenter
  OnClose = FormClose
  OnDestroy = FormDestroy
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object Panel3: TPanel
    Left = 0
    Top = 0
    Width = 332
    Height = 25
    Align = alTop
    BevelOuter = bvLowered
    Caption = 'PAR'#194'METROS CATEGORIAS'
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
    Top = 25
    Width = 332
    Height = 76
    Align = alTop
    BevelOuter = bvNone
    TabOrder = 1
    object Label2: TLabel
      Left = 8
      Top = 8
      Width = 48
      Height = 13
      Caption = 'Descri'#231#227'o'
      FocusControl = deDescricao
    end
    object sbIncluir: TSpeedButton
      Left = 198
      Top = 50
      Width = 60
      Height = 22
      Caption = 'Incluir'
      Flat = True
      OnClick = sbIncluirClick
    end
    object sbExcluir: TSpeedButton
      Left = 262
      Top = 50
      Width = 60
      Height = 22
      Caption = 'Excluir'
      Flat = True
      OnClick = sbExcluirClick
    end
    object deDescricao: TDBEdit
      Left = 8
      Top = 24
      Width = 313
      Height = 21
      DataField = 'ds_categoria'
      DataSource = srcCategorias
      TabOrder = 0
      OnKeyPress = deDescricaoKeyPress
    end
  end
  object dcgCategorias: TDBGrid
    Left = 0
    Top = 101
    Width = 332
    Height = 158
    Align = alClient
    DataSource = srcCategorias
    Options = [dgTitles, dgIndicator, dgColumnResize, dgRowLines, dgTabs, dgRowSelect, dgAlwaysShowSelection, dgCancelOnExit]
    TabOrder = 2
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'MS Sans Serif'
    TitleFont.Style = []
    OnDblClick = dcgCategoriasDblClick
    Columns = <
      item
        Expanded = False
        FieldName = 'ds_categoria'
        Title.Caption = 'Descri'#231#227'o'
        Visible = True
      end>
  end
  object qyCategorias: TQuery
    DatabaseName = 'unimestre'
    RequestLive = True
    SQL.Strings = (
      'SELECT'
      '  *'
      'FROM'
      '  parametros_categorias'
      'ORDER BY'
      '  ds_categoria')
    UpdateMode = upWhereKeyOnly
    Left = 273
    Top = 145
    object qyCategoriascd_categoria: TIntegerField
      FieldName = 'cd_categoria'
      Origin = 'UNIMESTRE.parametros_categorias.cd_categoria'
    end
    object qyCategoriasds_categoria: TStringField
      FieldName = 'ds_categoria'
      Origin = 'UNIMESTRE.parametros_categorias.ds_categoria'
      Size = 150
    end
  end
  object srcCategorias: TDataSource
    DataSet = qyCategorias
    OnStateChange = srcCategoriasStateChange
    Left = 273
    Top = 177
  end
  object qyMaxCat: TQuery
    DatabaseName = 'unimestre'
    SQL.Strings = (
      'SELECT'
      '  (MAX(cd_categoria) + 1) AS MAX'
      'FROM'
      '  parametros_categorias')
    Left = 272
    Top = 217
  end
end
