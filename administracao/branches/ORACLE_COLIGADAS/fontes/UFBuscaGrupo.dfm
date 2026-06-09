object fBuscaGrupo: TfBuscaGrupo
  Left = 0
  Top = 0
  BorderStyle = bsDialog
  Caption = 'Sele'#231#227'o de grupo'
  ClientHeight = 512
  ClientWidth = 505
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  OnClose = FormClose
  OnCreate = FormCreate
  OnDestroy = FormDestroy
  PixelsPerInch = 96
  TextHeight = 13
  object bvlSep1: TBevel
    Left = 0
    Top = 20
    Width = 505
    Height = 3
    Align = alTop
    Shape = bsSpacer
    ExplicitLeft = 336
    ExplicitTop = 280
    ExplicitWidth = 50
  end
  object pnlTitulo: TPanel
    Left = 0
    Top = 0
    Width = 505
    Height = 20
    Align = alTop
    BevelOuter = bvLowered
    Caption = 'SELECIONE UM GRUPO'
    Color = clBlue
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindow
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 0
  end
  object pnlAll: TPanel
    Left = 0
    Top = 23
    Width = 505
    Height = 489
    Align = alClient
    BevelOuter = bvNone
    BorderWidth = 3
    TabOrder = 1
    object bvlSep2: TBevel
      Left = 3
      Top = 66
      Width = 499
      Height = 3
      Align = alTop
      Shape = bsTopLine
      ExplicitLeft = -329
      ExplicitTop = 38
      ExplicitWidth = 514
    end
    object bvlSep3: TBevel
      Left = 3
      Top = 451
      Width = 499
      Height = 3
      Align = alBottom
      Shape = bsBottomLine
      ExplicitLeft = 135
      ExplicitTop = 38
      ExplicitWidth = 50
    end
    object dbgGrupos: TDBGrid
      Left = 3
      Top = 69
      Width = 499
      Height = 382
      Align = alClient
      DataSource = dsGrupos
      Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgConfirmDelete, dgCancelOnExit]
      TabOrder = 0
      TitleFont.Charset = DEFAULT_CHARSET
      TitleFont.Color = clWindowText
      TitleFont.Height = -11
      TitleFont.Name = 'Tahoma'
      TitleFont.Style = []
      OnDblClick = dbgGruposDblClick
      OnTitleClick = dbgGruposTitleClick
      Columns = <
        item
          Expanded = False
          FieldName = 'CD_GRUPO'
          Title.Caption = 'C'#243'digo'
          Width = 81
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
          Width = 351
          Visible = True
        end>
    end
    object pnlFiltros: TPanel
      Left = 3
      Top = 3
      Width = 499
      Height = 63
      Align = alTop
      BevelOuter = bvNone
      TabOrder = 1
      object lblCodigo: TLabel
        Left = 8
        Top = 9
        Width = 37
        Height = 13
        Caption = 'C'#243'digo:'
      end
      object lblNome: TLabel
        Left = 14
        Top = 36
        Width = 31
        Height = 13
        Caption = 'Nome:'
      end
      object edtCodigo: TEdit
        Left = 51
        Top = 6
        Width = 86
        Height = 21
        TabOrder = 0
        OnChange = edtCodigoChange
        OnKeyPress = edtCodigoKeyPress
      end
      object edtNome: TEdit
        Left = 51
        Top = 33
        Width = 238
        Height = 21
        TabOrder = 1
        OnChange = edtCodigoChange
      end
    end
    object pnlOpcoes: TPanel
      Left = 3
      Top = 454
      Width = 499
      Height = 32
      Align = alBottom
      BevelOuter = bvNone
      TabOrder = 2
      object sbSelecionar: TSpeedButton
        Left = 336
        Top = 6
        Width = 79
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
        OnClick = sbSelecionarClick
      end
      object sbFechar: TSpeedButton
        Left = 415
        Top = 6
        Width = 79
        Height = 25
        Caption = 'Fechar'
        Glyph.Data = {
          42020000424D4202000000000000420000002800000010000000100000000100
          1000030000000002000000000000000000000000000000000000007C0000E003
          00001F0000001F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C
          1F7C1F7C1F7C1F7C1F7C1F7C0000000000001F7C1F7C1F7C1F7C1F7C1F7C1F7C
          1F7C1F7C1F7C1F7C00000000864D864D00001F7C1F7C1F7C1F7C1F7C1F7C1F7C
          1F7C1F7C1F7C4031864D864D864D864D00004031403140314031403140311F7C
          1F7C1F7C1F7C4031A64DA64D864D864D0000207F207F207F00001F7C1F7C1F7C
          1F7C1F7C1F7C4031A551A551A54DA54D0000207F207F207F00001F7C1F001F7C
          1F7C1F7C1F7C4031C455C451C451C5510000227F207F207F00001F001F001F7C
          1F7C1F7C1F7C4031E355E355FF7FC4550000467F457F437F1F001F001F001F7C
          1F7C1F7C1F7C4031025A035A035AE35900006C7F6A7F1F001F001F001F001F00
          1F001F001F7C4031215E225E025E025A0000917F1F001F001F001F001F001F00
          1F001F001F7C4031416221622162215E0000B67FB47F1F001F001F001F001F00
          1F001F001F7C403140664066406240620000DB7FD97FB87F1F001F001F001F7C
          1F7C1F7C1F7C403160666066606640660000FF7FDE7FDC7F00001F001F001F7C
          1F7C1F7C1F7C403160666066606660660000FF7FFF7FFF7F00001F7C1F001F7C
          1F7C1F7C1F7C1F7C4031403160666066000040314031403140311F7C1F7C1F7C
          1F7C1F7C1F7C1F7C1F7C1F7C4031403140311F7C1F7C1F7C1F7C1F7C1F7C1F7C
          1F7C1F7C1F7C}
        OnClick = sbFecharClick
      end
    end
  end
  object qryGrupos: TUMZReadOnlyQuery
    Connection = DM.conn
    SortedFields = 'DS_NOME_GRUPO'
    Filtered = True
    SQL.Strings = (
      'SELECT DISTINCT'
      '   G.CD_GRUPO,'
      '   G.DS_NOME_GRUPO,'
      '   G.DS_PAPEL'
      'FROM'
      '   NU_GRUPOS G'
      'WHERE'
      '  EXISTS ('
      '    SELECT'
      '      H.CD_GRUPO_ALTERNAR'
      '    FROM'
      '      NU_GRUPOS_HIERARQUIA H'
      ''
      '        JOIN NU_GRUPOS_PESSOAS P ON'
      '          (H.CD_GRUPO = P.CD_GRUPO)'
      '    WHERE'
      '      G.CD_GRUPO = H.CD_GRUPO_LIBERADO AND'
      '      P.CD_PESSOA = :CD_PESSOA'
      '  ) AND'
      '  G.SN_BLOQUEADO = 0')
    Params = <
      item
        DataType = ftUnknown
        Name = 'CD_PESSOA'
        ParamType = ptUnknown
      end>
    IndexFieldNames = 'DS_NOME_GRUPO Asc'
    Left = 192
    Top = 240
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'CD_PESSOA'
        ParamType = ptUnknown
      end>
    object qryGruposCD_GRUPO: TIntegerField
      FieldName = 'CD_GRUPO'
      Required = True
    end
    object qryGruposDS_NOME_GRUPO: TStringField
      FieldName = 'DS_NOME_GRUPO'
      Required = True
      Size = 50
    end
    object qryGruposDS_PAPEL: TStringField
      FieldName = 'DS_PAPEL'
      Size = 50
    end
  end
  object dsGrupos: TDataSource
    AutoEdit = False
    DataSet = qryGrupos
    Left = 152
    Top = 200
  end
end
