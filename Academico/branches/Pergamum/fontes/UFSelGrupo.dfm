object fSelGrupos: TfSelGrupos
  Left = 0
  Top = 0
  BorderStyle = bsDialog
  Caption = 'Selecionar grupo'
  ClientHeight = 568
  ClientWidth = 592
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  KeyPreview = True
  OldCreateOrder = False
  Position = poScreenCenter
  OnKeyDown = FormKeyDown
  OnKeyPress = FormKeyPress
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object bvSep1: TBevel
    Left = 0
    Top = 25
    Width = 592
    Height = 3
    Align = alTop
    Shape = bsSpacer
    ExplicitLeft = 104
    ExplicitTop = 64
    ExplicitWidth = 50
  end
  object pnTop: TPanel
    Left = 0
    Top = 0
    Width = 592
    Height = 25
    Align = alTop
    BevelOuter = bvLowered
    Caption = 'SELECIONE UM GRUPO'
    Color = clBlue
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWhite
    Font.Height = -12
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 0
  end
  object pnPrincipal: TPanel
    Left = 0
    Top = 28
    Width = 592
    Height = 502
    Align = alClient
    BevelOuter = bvNone
    TabOrder = 1
    object bvSep2: TBevel
      Left = 0
      Top = 499
      Width = 592
      Height = 3
      Align = alBottom
      Shape = bsSpacer
      ExplicitLeft = 48
      ExplicitTop = 392
      ExplicitWidth = 50
    end
    object pnCampos: TPanel
      Left = 0
      Top = 0
      Width = 592
      Height = 60
      Align = alTop
      BevelOuter = bvNone
      TabOrder = 0
      object lblCodigo: TLabel
        Left = 21
        Top = 8
        Width = 42
        Height = 14
        Caption = 'C'#243'digo:'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -12
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
      end
      object lblNome: TLabel
        Left = 26
        Top = 35
        Width = 35
        Height = 14
        Caption = 'Nome:'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -12
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
      end
      object edCodigo: TEdit
        Left = 68
        Top = 6
        Width = 121
        Height = 21
        TabOrder = 0
        OnKeyPress = edCodigoKeyPress
      end
      object edNome: TEdit
        Left = 68
        Top = 33
        Width = 213
        Height = 21
        TabOrder = 1
      end
    end
    object pnGrid: TPanel
      Left = 0
      Top = 60
      Width = 592
      Height = 439
      Align = alClient
      BevelOuter = bvNone
      TabOrder = 1
      object bevSep3: TBevel
        Left = 0
        Top = 0
        Width = 592
        Height = 3
        Align = alTop
        Shape = bsSpacer
        ExplicitWidth = 582
      end
      object dbgModulos: TDBGrid
        Left = 0
        Top = 3
        Width = 592
        Height = 436
        Align = alClient
        DataSource = dsGrupos
        Options = [dgTitles, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgConfirmDelete, dgCancelOnExit]
        ReadOnly = True
        TabOrder = 0
        TitleFont.Charset = DEFAULT_CHARSET
        TitleFont.Color = clWindowText
        TitleFont.Height = -11
        TitleFont.Name = 'Tahoma'
        TitleFont.Style = []
        OnDblClick = dbgModulosDblClick
        OnTitleClick = dbgModulosTitleClick
        Columns = <
          item
            Expanded = False
            FieldName = 'CD_GRUPO'
            Title.Caption = 'C'#243'digo'
            Width = 86
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'DS_NOME_GRUPO'
            Title.Caption = 'Nome'
            Title.Font.Charset = DEFAULT_CHARSET
            Title.Font.Color = clGreen
            Title.Font.Height = -11
            Title.Font.Name = 'Tahoma'
            Title.Font.Style = [fsBold]
            Width = 468
            Visible = True
          end>
      end
    end
  end
  object pnRodaPe: TPanel
    Left = 0
    Top = 530
    Width = 592
    Height = 38
    Align = alBottom
    TabOrder = 2
    object sbSelecione: TSpeedButton
      Left = 393
      Top = 6
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
      OnClick = sbSelecioneClick
    end
    object sbFechar: TSpeedButton
      Left = 486
      Top = 6
      Width = 87
      Height = 25
      Hint = 'Sair'
      Caption = 'F12 Sair'
      Glyph.Data = {
        F6000000424DF600000000000000760000002800000010000000100000000100
        04000000000080000000CE0E0000C40E00001000000000000000000000000000
        80000080000000808000800000008000800080800000C0C0C000808080000000
        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00777777777777
        7777777777777777777777777744447777777777444444447777777444777744
        4777777447777774477777447777777744777744777777774477774477777777
        4477774477777777447777744777747447777774477774444777777777777444
        7777777777777444477777777777777777777777777777777777}
      OnClick = sbFecharClick
    end
  end
  object qryGrupos: TUMZQuery
    Connection = DM.db
    SortedFields = 'DS_NOME_GRUPO'
    Filtered = True
    SQL.Strings = (
      'SELECT DISTINCT'
      '   G.CD_GRUPO,'
      '   G.DS_NOME_GRUPO,'
      '   G.DS_PAPEL'
      'FROM'
      '   NU_GRUPOS G'
      '      JOIN NU_GRUPOS_HIERARQUIA H ON'
      '         (G.CD_GRUPO = H.CD_GRUPO_LIBERADO)'
      'WHERE'
      
        '   H.CD_GRUPO IN (SELECT CD_GRUPO FROM NU_GRUPOS_PESSOAS WHERE C' +
        'D_PESSOA = :CD_PESSOA) AND'
      '   (H.CD_GRUPO = 1 OR G.SN_BLOQUEADO = 0)')
    Params = <
      item
        DataType = ftUnknown
        Name = 'CD_PESSOA'
        ParamType = ptUnknown
      end>
    IndexFieldNames = 'DS_NOME_GRUPO Asc'
    Left = 168
    Top = 200
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'CD_PESSOA'
        ParamType = ptUnknown
      end>
    object qryGruposCD_GRUPO: TIntegerField
      FieldName = 'CD_GRUPO'
    end
    object qryGruposDS_NOME_GRUPO: TStringField
      FieldName = 'DS_NOME_GRUPO'
      Size = 50
    end
    object qryGruposDS_PAPEL: TStringField
      FieldName = 'DS_PAPEL'
      Size = 50
    end
  end
  object dsGrupos: TDataSource
    DataSet = qryGrupos
    Left = 208
    Top = 200
  end
end
