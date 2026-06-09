object fPermRel: TfPermRel
  Left = 0
  Top = 0
  Caption = 'Controle de Permiss'#245'es de Acesso a Relat'#243'rios'
  ClientHeight = 487
  ClientWidth = 774
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  FormStyle = fsMDIChild
  KeyPreview = True
  OldCreateOrder = False
  Position = poScreenCenter
  Visible = True
  WindowState = wsMaximized
  OnClose = FormClose
  OnCreate = FormCreate
  OnKeyDown = FormKeyDown
  PixelsPerInch = 96
  TextHeight = 13
  object bvlSep1: TBevel
    Left = 0
    Top = 22
    Width = 774
    Height = 3
    Align = alTop
    Shape = bsSpacer
    ExplicitWidth = 835
  end
  object bvlSep2: TBevel
    Left = 0
    Top = 461
    Width = 774
    Height = 3
    Align = alBottom
    Shape = bsSpacer
    ExplicitTop = 462
    ExplicitWidth = 825
  end
  object splSep: TSplitter
    Left = 281
    Top = 25
    Height = 436
    ExplicitLeft = 440
    ExplicitTop = 296
    ExplicitHeight = 100
  end
  object pnlTitulo: TPanel
    Left = 0
    Top = 0
    Width = 774
    Height = 22
    Align = alTop
    BevelOuter = bvLowered
    Caption = 'CONTROLE DE PERMISS'#213'ES DE ACESSO A RELAT'#211'RIOS'
    Color = clBlue
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindow
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 0
  end
  object tlbOpcoes: TToolBar
    Left = 0
    Top = 464
    Width = 774
    Height = 23
    Align = alBottom
    ButtonWidth = 81
    Images = ilImagens
    List = True
    ShowCaptions = True
    TabOrder = 3
    object btnSep1: TToolButton
      Left = 0
      Top = 0
      Width = 8
      Style = tbsSeparator
    end
    object btnFechar: TToolButton
      Left = 8
      Top = 0
      Caption = 'F12 Fechar'
      ImageIndex = 0
      OnClick = btnFecharClick
    end
    object btnSep2: TToolButton
      Left = 89
      Top = 0
      Width = 8
      ImageIndex = 1
      Style = tbsSeparator
    end
  end
  object pnlModulos: TPanel
    Left = 0
    Top = 25
    Width = 281
    Height = 436
    Align = alLeft
    BevelOuter = bvNone
    TabOrder = 1
    object bvlSep3: TBevel
      Left = 0
      Top = 18
      Width = 281
      Height = 3
      Align = alTop
      Shape = bsSpacer
    end
    object pnlModulosTit: TPanel
      Left = 0
      Top = 0
      Width = 281
      Height = 18
      Align = alTop
      BevelOuter = bvLowered
      Caption = 'M'#211'DULOS DE IMPRESS'#195'O'
      Color = clGray
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindow
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
      TabOrder = 0
    end
    object dbgModulos: TDBGrid
      Left = 0
      Top = 21
      Width = 281
      Height = 415
      Align = alClient
      DataSource = dsModulos
      Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgConfirmDelete, dgCancelOnExit]
      ReadOnly = True
      TabOrder = 1
      TitleFont.Charset = DEFAULT_CHARSET
      TitleFont.Color = clWindowText
      TitleFont.Height = -11
      TitleFont.Name = 'Tahoma'
      TitleFont.Style = []
      Columns = <
        item
          Expanded = False
          FieldName = 'CD_MODULO'
          Title.Caption = 'C'#243'digo'
          Width = 47
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'DS_NOME_MODULO'
          Title.Caption = 'Nome'
          Width = 204
          Visible = True
        end>
    end
  end
  object pnlPerm: TPanel
    Left = 284
    Top = 25
    Width = 490
    Height = 436
    Align = alClient
    BevelOuter = bvNone
    TabOrder = 2
    object bvlSep4: TBevel
      Left = 0
      Top = 81
      Width = 490
      Height = 3
      Align = alTop
      Shape = bsSpacer
      ExplicitLeft = 249
      ExplicitTop = 273
      ExplicitWidth = 63
    end
    object bvlSep6: TBevel
      Left = 0
      Top = 102
      Width = 490
      Height = 3
      Align = alTop
      Shape = bsSpacer
      ExplicitLeft = 336
      ExplicitTop = 280
      ExplicitWidth = 50
    end
    object pnlGrupo: TPanel
      Left = 0
      Top = 0
      Width = 490
      Height = 81
      Align = alTop
      BevelOuter = bvNone
      TabOrder = 1
      object bvlSep5: TBevel
        Left = 0
        Top = 18
        Width = 490
        Height = 3
        Align = alTop
        Shape = bsSpacer
      end
      object sbSelGrupo: TSpeedButton
        Left = 235
        Top = 47
        Width = 22
        Height = 21
        Flat = True
        Glyph.Data = {
          76010000424D7601000000000000760000002800000020000000100000000100
          04000000000000010000130B0000130B00001000000000000000000000000000
          800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
          FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333333333333
          33033333333333333F7F3333333333333000333333333333F777333333333333
          000333333333333F777333333333333000333333333333F77733333333333300
          033333333FFF3F777333333700073B703333333F7773F77733333307777700B3
          33333377333777733333307F8F8F7033333337F333F337F3333377F8F9F8F773
          3333373337F3373F3333078F898F870333337F33F7FFF37F333307F99999F703
          33337F377777337F3333078F898F8703333373F337F33373333377F8F9F8F773
          333337F3373337F33333307F8F8F70333333373FF333F7333333330777770333
          333333773FF77333333333370007333333333333777333333333}
        NumGlyphs = 2
        OnClick = sbSelGrupoClick
      end
      object pnlGrupoTit: TPanel
        Left = 0
        Top = 0
        Width = 490
        Height = 18
        Align = alTop
        BevelOuter = bvLowered
        Caption = 'GRUPO'
        Color = clGray
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindow
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
        TabOrder = 0
      end
      object ledGrupo: TLabeledEdit
        Left = 6
        Top = 47
        Width = 227
        Height = 21
        EditLabel.Width = 405
        EditLabel.Height = 13
        EditLabel.Caption = 
          'Selecione o grupo de pessoas para o qual deseja controlar as per' +
          'miss'#245'es de acesso:'
        ReadOnly = True
        TabOrder = 1
      end
    end
    object pnlGruposTit: TPanel
      Left = 0
      Top = 84
      Width = 490
      Height = 18
      Align = alTop
      BevelOuter = bvLowered
      Caption = 'GRUPOS DE RELAT'#211'RIO'
      Color = clGray
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindow
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
      TabOrder = 0
    end
    object pnlPermissoes: TPanel
      Left = 0
      Top = 105
      Width = 490
      Height = 331
      Align = alClient
      BevelOuter = bvNone
      TabOrder = 2
      object sbxPermissoes: TScrollBox
        Left = 0
        Top = 0
        Width = 490
        Height = 331
        Align = alClient
        BevelOuter = bvNone
        TabOrder = 0
      end
    end
  end
  object ilImagens: TImageList
    Left = 544
    Top = 352
    Bitmap = {
      494C010101000400040010001000FFFFFFFFFF10FFFFFFFFFFFFFFFF424D3600
      0000000000003600000028000000400000001000000001002000000000000010
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000003163
      9C0031639C000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000052630031639C0031639C003163
      9C0031639C000000000000526300005263000052630000526300005263000052
      6300000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000526300316B9C00316B9C003163
      9C0031639C000000000000CEFF0000CEFF0000CEFF0000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000526300296BA500296BA500296B
      9C00296B9C000000000000CEFF0000CEFF0000CEFF000000000000000000FF00
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000005263002173AD002173A5002173
      A5002973A5000000000010CEFF0000CEFF0000CEFF0000000000FF000000FF00
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000526300187BAD00187BAD00FFFF
      FF002173AD000000000031D6FF0029D6FF0018D6FF00FF000000FF000000FF00
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000005263001084B5001884B5001884
      B500187BB5000000000063DEFF0052DEFF00FF000000FF000000FF000000FF00
      0000FF000000FF000000FF000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000526300088CBD00108CBD001084
      BD001084B500000000008CE7FF00FF000000FF000000FF000000FF000000FF00
      0000FF000000FF000000FF000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000005263000894C600088CC600088C
      C600088CBD0000000000B5EFFF00A5EFFF00FF000000FF000000FF000000FF00
      0000FF000000FF000000FF000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000005263000094CE000094CE000094
      C6000094C60000000000DEF7FF00CEF7FF00C6EFFF00FF000000FF000000FF00
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000526300009CCE00009CCE00009C
      CE000094CE0000000000FFFFFF00F7F7FF00E7F7FF0000000000FF000000FF00
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000526300009CCE00009CCE00009C
      CE00009CCE0000000000FFFFFF00FFFFFF00FFFFFF000000000000000000FF00
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000052630000526300009C
      CE00009CCE000000000000526300005263000052630000526300000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000052
      6300005263000052630000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000424D3E000000000000003E000000
      2800000040000000100000000100010000000000800000000000000000000000
      000000000000000000000000FFFFFF00FFFF000000000000E3FF000000000000
      83FF000000000000000F000000000000003F000000000000002F000000000000
      000F000000000000000F00000000000000010000000000000001000000000000
      0001000000000000000F000000000000000F000000000000002F000000000000
      803F000000000000E3FF00000000000000000000000000000000000000000000
      000000000000}
  end
  object dsModulos: TDataSource
    AutoEdit = False
    DataSet = qryModulos
    OnDataChange = dsModulosDataChange
    Left = 112
    Top = 160
  end
  object qryModulos: TUMZReadOnlyQuery
    Connection = DM.db
    SQL.Strings = (
      'SELECT'
      '   CD_MODULO,'
      '   DS_NOME_MODULO,'
      '   DS_DESCRICAO,'
      '   DS_CHAVE'
      'FROM'
      '   NU_MODULOS'
      'WHERE'
      '   DS_CHAVE LIKE '#39'Impressao.%'#39)
    Params = <>
    Left = 112
    Top = 192
    object qryModulosCD_MODULO: TIntegerField
      FieldName = 'CD_MODULO'
    end
    object qryModulosDS_NOME_MODULO: TStringField
      FieldName = 'DS_NOME_MODULO'
      Size = 100
    end
    object qryModulosDS_DESCRICAO: TStringField
      FieldName = 'DS_DESCRICAO'
      Size = 255
    end
    object qryModulosDS_CHAVE: TStringField
      FieldName = 'DS_CHAVE'
      Size = 50
    end
  end
  object scriptAtualizaRel: TZSQLProcessor
    ParamCheck = False
    Params = <>
    Script.Strings = (
      
        'INSERT INTO NU_MODULOS_ACOES (CD_MODULO, DS_NOME_ACAO, DS_CHAVE,' +
        ' DS_LICENCA)'
      'SELECT'
      
        '   (SELECT CD_MODULO FROM NU_MODULOS WHERE DS_CHAVE = '#39'Impressao' +
        '.Academico'#39'),'
      
        '   CONCAT('#39'Acesso aos relat'#243'rios acad'#234'micos do grupo '#39', R.DS_GRU' +
        'PO),'
      '   CONCAT('#39'Rel.Grupo.'#39', R.DS_GRUPO),'
      '   '#39#39
      'FROM'
      '   RELATORIOS R'
      '      LEFT JOIN NU_MODULOS_ACOES MA ON'
      
        '         (CONCAT('#39'Rel.Grupo.'#39', R.DS_GRUPO) = MA.DS_CHAVE AND MA.' +
        'CD_MODULO = (SELECT CD_MODULO FROM NU_MODULOS WHERE DS_CHAVE = '#39 +
        'Impressao.Academico'#39'))'
      '         LEFT JOIN NU_MODULOS M ON'
      '            (MA.CD_MODULO = M.CD_MODULO) AND'
      '            (M.DS_CHAVE = '#39'Impressao.Academico'#39')'
      'WHERE'
      '   MA.CD_ACAO IS NULL AND'
      '   R.CD_MODULO = 1'
      'GROUP BY'
      '   R.DS_GRUPO;'
      ''
      
        'INSERT INTO NU_MODULOS_ACOES (CD_MODULO, DS_NOME_ACAO, DS_CHAVE,' +
        ' DS_LICENCA)'
      'SELECT'
      
        '   (SELECT CD_MODULO FROM NU_MODULOS WHERE DS_CHAVE = '#39'Impressao' +
        '.CR'#39'),'
      
        '   CONCAT('#39'Acesso aos relat'#243'rios contas a receber do grupo '#39', R.' +
        'DS_GRUPO),'
      '   CONCAT('#39'Rel.Grupo.'#39', R.DS_GRUPO),'
      '   '#39#39
      'FROM'
      '   RELATORIOS R'
      '      LEFT JOIN NU_MODULOS_ACOES MA ON'
      
        '         (CONCAT('#39'Rel.Grupo.'#39', R.DS_GRUPO) = MA.DS_CHAVE AND MA.' +
        'CD_MODULO = (SELECT CD_MODULO FROM NU_MODULOS WHERE DS_CHAVE = '#39 +
        'Impressao.CR'#39'))'
      '         LEFT JOIN NU_MODULOS M ON'
      '            (MA.CD_MODULO = M.CD_MODULO) AND'
      '            (M.DS_CHAVE = '#39'Impressao.CR'#39')'
      'WHERE'
      '   MA.CD_ACAO IS NULL AND'
      '   R.CD_MODULO = 2'
      'GROUP BY'
      '   R.DS_GRUPO;'
      ''
      
        'INSERT INTO NU_MODULOS_ACOES (CD_MODULO, DS_NOME_ACAO, DS_CHAVE,' +
        ' DS_LICENCA)'
      'SELECT'
      
        '   (SELECT CD_MODULO FROM NU_MODULOS WHERE DS_CHAVE = '#39'Impressao' +
        '.CP'#39'),'
      
        '   CONCAT('#39'Acesso aos relat'#243'rios contas a pagar do grupo '#39', R.DS' +
        '_GRUPO),'
      '   CONCAT('#39'Rel.Grupo.'#39', R.DS_GRUPO),'
      '   '#39#39
      'FROM'
      '   RELATORIOS R'
      '      LEFT JOIN NU_MODULOS_ACOES MA ON'
      
        '         (CONCAT('#39'Rel.Grupo.'#39', R.DS_GRUPO) = MA.DS_CHAVE AND MA.' +
        'CD_MODULO = (SELECT CD_MODULO FROM NU_MODULOS WHERE DS_CHAVE = '#39 +
        'Impressao.CP'#39'))'
      '         LEFT JOIN NU_MODULOS M ON'
      '            (MA.CD_MODULO = M.CD_MODULO) AND'
      '            (M.DS_CHAVE = '#39'Impressao.CP'#39')'
      'WHERE'
      '   MA.CD_ACAO IS NULL AND'
      '   R.CD_MODULO = 4'
      'GROUP BY'
      '   R.DS_GRUPO;'
      ''
      
        'INSERT INTO NU_MODULOS_ACOES (CD_MODULO, DS_NOME_ACAO, DS_CHAVE,' +
        ' DS_LICENCA)'
      'SELECT'
      
        '   (SELECT CD_MODULO FROM NU_MODULOS WHERE DS_CHAVE = '#39'Impressao' +
        '.Gerencial'#39'),'
      
        '   CONCAT('#39'Acesso aos relat'#243'rios gerenciais do grupo '#39', R.DS_GRU' +
        'PO),'
      '   CONCAT('#39'Rel.Grupo.'#39', R.DS_GRUPO),'
      '   '#39#39
      'FROM'
      '   RELATORIOS R'
      '      LEFT JOIN NU_MODULOS_ACOES MA ON'
      
        '         (CONCAT('#39'Rel.Grupo.'#39', R.DS_GRUPO) = MA.DS_CHAVE AND MA.' +
        'CD_MODULO = (SELECT CD_MODULO FROM NU_MODULOS WHERE DS_CHAVE = '#39 +
        'Impressao.Gerencial'#39'))'
      '         LEFT JOIN NU_MODULOS M ON'
      '            (MA.CD_MODULO = M.CD_MODULO) AND'
      '            (M.DS_CHAVE = '#39'Impressao.Gerencial'#39')'
      'WHERE'
      '   MA.CD_ACAO IS NULL AND'
      '   R.CD_MODULO = 5'
      'GROUP BY'
      '   R.DS_GRUPO;')
    Connection = DM.db
    Delimiter = ';'
    Left = 360
    Top = 160
  end
  object qryPermissoes: TUMZReadOnlyQuery
    Connection = DM.db
    SortedFields = 'DS_GRUPO'
    SQL.Strings = (
      'SELECT'
      '   MA.CD_ACAO,'
      '   MA.CD_MODULO,'
      '   MA.DS_NOME_ACAO,'
      '   MA.DS_CHAVE,'
      '   GP.CD_GRUPO,'
      '   SUBSTRING_INDEX(MA.DS_CHAVE, '#39'.'#39', -1) DS_GRUPO,'
      '   IFNULL(GP.NR_PERMISSAO, 0) NR_PERMISSAO'
      'FROM'
      '   NU_MODULOS_ACOES MA'
      '      LEFT JOIN NU_GRUPOS_PERMISSOES GP ON'
      '         (MA.CD_ACAO = GP.CD_ACAO) AND'
      '         (GP.CD_GRUPO = :CD_GRUPO)'
      'WHERE'
      '   MA.CD_MODULO = :CD_MODULO')
    Params = <
      item
        DataType = ftUnknown
        Name = 'CD_GRUPO'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'CD_MODULO'
        ParamType = ptUnknown
      end>
    IndexFieldNames = 'DS_GRUPO Asc'
    SQLList.Strings = (
      
        'oracle=SELECT'#13#10'   MA.CD_ACAO,'#13#10'   MA.CD_MODULO,'#13#10'   MA.DS_NOME_A' +
        'CAO,'#13#10'   MA.DS_CHAVE,'#13#10'   GP.CD_GRUPO,'#13#10'   SUBSTRING_INDEX(MA.DS' +
        '_CHAVE, '#39'.'#39', -1) DS_GRUPO,'#13#10'   CAST(COALESCE(GP.NR_PERMISSAO, 0)' +
        ' AS NUMBER(5)) NR_PERMISSAO'#13#10'FROM'#13#10'   NU_MODULOS_ACOES MA'#13#10'     ' +
        ' LEFT JOIN NU_GRUPOS_PERMISSOES GP ON'#13#10'         (MA.CD_ACAO = GP' +
        '.CD_ACAO) AND'#13#10'         (GP.CD_GRUPO = :CD_GRUPO)'#13#10'WHERE'#13#10'   MA.' +
        'CD_MODULO = :CD_MODULO'
      
        'mysql-5=SELECT'#13#10'   MA.CD_ACAO,'#13#10'   MA.CD_MODULO,'#13#10'   MA.DS_NOME_' +
        'ACAO,'#13#10'   MA.DS_CHAVE,'#13#10'   GP.CD_GRUPO,'#13#10'   SUBSTRING_INDEX(MA.D' +
        'S_CHAVE, '#39'.'#39', -1) DS_GRUPO,'#13#10'   IFNULL(GP.NR_PERMISSAO, 0) NR_PE' +
        'RMISSAO'#13#10'FROM'#13#10'   NU_MODULOS_ACOES MA'#13#10'      LEFT JOIN NU_GRUPOS' +
        '_PERMISSOES GP ON'#13#10'         (MA.CD_ACAO = GP.CD_ACAO) AND'#13#10'     ' +
        '    (GP.CD_GRUPO = :CD_GRUPO)'#13#10'WHERE'#13#10'   MA.CD_MODULO = :CD_MODU' +
        'LO')
    Left = 360
    Top = 192
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'CD_GRUPO'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'CD_MODULO'
        ParamType = ptUnknown
      end>
    object qryPermissoesCD_ACAO: TIntegerField
      FieldName = 'CD_ACAO'
    end
    object qryPermissoesCD_MODULO: TIntegerField
      FieldName = 'CD_MODULO'
    end
    object qryPermissoesDS_NOME_ACAO: TStringField
      FieldName = 'DS_NOME_ACAO'
      Size = 100
    end
    object qryPermissoesDS_CHAVE: TStringField
      FieldName = 'DS_CHAVE'
      Size = 50
    end
    object qryPermissoesDS_GRUPO: TStringField
      FieldName = 'DS_GRUPO'
      ReadOnly = True
      Size = 4000
    end
    object qryPermissoesCD_GRUPO: TIntegerField
      FieldName = 'CD_GRUPO'
    end
    object qryPermissoesNR_PERMISSAO: TLargeintField
      FieldName = 'NR_PERMISSAO'
      ReadOnly = True
    end
  end
  object qryUpdPerm: TUMZQuery
    Connection = DM.db
    SQL.Strings = (
      '')
    Params = <>
    SQLList.Strings = (
      
        'mysql-5=REPLACE INTO NU_GRUPOS_PERMISSOES'#13#10'   (CD_ACAO, CD_GRUPO' +
        ', NR_PERMISSAO)'#13#10'VALUES'#13#10'   (:CD_ACAO, :CD_GRUPO, :NR_PERMISSAO)'
      
        'oracle=MERGE INTO NU_GRUPOS_PERMISSOES GP USING'#13#10'('#13#10'   SELECT'#13#10' ' +
        '     :CD_ACAO CD_ACAO,'#13#10'      :CD_GRUPO CD_GRUPO,'#13#10'      :NR_PER' +
        'MISSAO NR_PERMISSAO'#13#10'   FROM'#13#10'      DUAL'#13#10') UP ON'#13#10'   (GP.CD_ACA' +
        'O = UP.CD_ACAO AND'#13#10'    GP.CD_GRUPO = UP.CD_GRUPO)'#13#10'WHEN MATCHED' +
        ' THEN'#13#10'   UPDATE SET GP.NR_PERMISSAO = UP.NR_PERMISSAO'#13#10'WHEN NOT' +
        ' MATCHED THEN'#13#10'   INSERT'#13#10'      (GP.CD_ACAO, GP.CD_GRUPO, GP.NR_' +
        'PERMISSAO)'#13#10'   VALUES'#13#10'      (UP.CD_ACAO, UP.CD_GRUPO, UP.NR_PER' +
        'MISSAO)')
    Left = 360
    Top = 224
  end
  object qryRe: TUMZQuery
    Params = <>
    Left = 360
    Top = 264
  end
  object scriptAtualizaRelOracle: TZSQLProcessor
    Params = <>
    Script.Strings = (
      'DECLARE'
      '   numero NUMBER ; '
      ''
      'BEGIN'
      '   SELECT'
      '      CD_MODULO INTO numero'
      '   FROM'
      '      NU_MODULOS'
      '   WHERE'
      '      DS_CHAVE = '#39'Impressao.Academico'#39' ; '
      ''
      ''
      #9'EXECUTE IMMEDIATE '#39
      
        #9'INSERT INTO NU_MODULOS_ACOES (CD_MODULO, DS_NOME_ACAO, DS_CHAVE' +
        ')'
      #9'('
      #9#9'SELECT'
      
        #9#9' (SELECT CD_MODULO FROM NU_MODULOS WHERE DS_CHAVE = '#39#39'Impressa' +
        'o.Academico'#39#39') as cd_modulo_chave ,'
      
        #9#9' '#39#39'Acesso aos relat'#243'rios acad'#234'micos do grupo'#39#39'||R.DS_GRUPO as ' +
        'nm_grupo,'
      #9#9' '#39#39'Rel.Grupo.'#39#39'||R.DS_GRUPO as grupo'
      #9'FROM'
      #9#9' RELATORIOS R'
      #9#9#9#9'LEFT JOIN NU_MODULOS_ACOES MA ON('
      
        #9#9#9#9#9' '#39#39'Rel.Grupo.'#39#39'||R.DS_GRUPO = MA.DS_CHAVE AND MA.CD_MODULO ' +
        '= '#39'||numero ||'#39')'
      #9#9#9#9#9' LEFT JOIN NU_MODULOS M ON'
      #9#9#9#9#9#9#9'(MA.CD_MODULO = M.CD_MODULO) AND'
      #9#9#9#9#9#9#9'(M.DS_CHAVE = '#39#39'Impressao.Academico'#39#39')'
      #9'WHERE'
      #9#9' MA.CD_ACAO IS NULL AND'
      #9#9' R.CD_MODULO = 1'
      #9'GROUP BY'
      #9#9' R.DS_GRUPO'
      #9')'#39'  ;'
      #9'SELECT'
      #9#9'CD_MODULO INTO numero'
      #9'FROM'
      #9#9'NU_MODULOS'
      #9'WHERE'
      #9#9'DS_CHAVE = '#39'Impressao.CR'#39' ; '
      ''
      #9'EXECUTE IMMEDIATE '#39
      
        #9'INSERT INTO NU_MODULOS_ACOES (CD_MODULO, DS_NOME_ACAO, DS_CHAVE' +
        ')'
      #9'('
      #9#9'SELECT'
      
        #9#9#9' (SELECT CD_MODULO FROM NU_MODULOS WHERE DS_CHAVE = '#39#39'Impress' +
        'ao.CR'#39#39'),'
      
        #9#9#9' CONCAT('#39#39'Acesso aos relat'#243'rios contas a receber do grupo '#39#39',' +
        ' R.DS_GRUPO),'
      #9#9#9' CONCAT('#39#39'Rel.Grupo.'#39#39', R.DS_GRUPO)'
      #9#9'FROM'
      #9#9#9' RELATORIOS R'
      #9#9#9#9#9'LEFT JOIN NU_MODULOS_ACOES MA ON'
      
        #9#9#9#9#9#9' (CONCAT('#39#39'Rel.Grupo.'#39#39', R.DS_GRUPO) = MA.DS_CHAVE AND MA.' +
        'CD_MODULO ='#39'||numero||'#39')'
      #9#9#9#9#9#9' LEFT JOIN NU_MODULOS M ON'
      #9#9#9#9#9#9#9#9'(MA.CD_MODULO = M.CD_MODULO) AND'
      #9#9#9#9#9#9#9#9'(M.DS_CHAVE = '#39#39'Impressao.CR'#39#39')'
      #9#9'WHERE'
      #9#9#9' MA.CD_ACAO IS NULL AND'
      #9#9#9' R.CD_MODULO = 2'
      #9#9'GROUP BY'
      #9#9#9' R.DS_GRUPO'
      #9')'#39';'
      ''
      #9'SELECT'
      #9#9'CD_MODULO INTO numero'
      #9'FROM'
      #9#9'NU_MODULOS'
      #9'WHERE'
      #9#9'DS_CHAVE = '#39'Impressao.CP'#39'; '
      ''
      #9'EXECUTE IMMEDIATE '#39
      
        #9'INSERT INTO NU_MODULOS_ACOES (CD_MODULO, DS_NOME_ACAO, DS_CHAVE' +
        ')'
      #9'('
      #9#9'SELECT'
      
        #9#9#9' (SELECT CD_MODULO FROM NU_MODULOS WHERE DS_CHAVE = '#39#39'Impress' +
        'ao.CP'#39#39'),'
      
        #9#9#9' CONCAT('#39#39'Acesso aos relat'#243'rios contas a pagar do grupo '#39#39', R' +
        '.DS_GRUPO),'
      #9#9#9' CONCAT('#39#39'Rel.Grupo.'#39#39', R.DS_GRUPO)'
      #9#9'FROM'
      #9#9#9' RELATORIOS R'
      #9#9#9#9#9'LEFT JOIN NU_MODULOS_ACOES MA ON'
      
        #9#9#9#9#9#9' (CONCAT('#39#39'Rel.Grupo.'#39#39', R.DS_GRUPO) = MA.DS_CHAVE AND MA.' +
        'CD_MODULO = '#39'||numero||'#39')'
      #9#9#9#9#9#9' LEFT JOIN NU_MODULOS M ON'
      #9#9#9#9#9#9#9#9'(MA.CD_MODULO = M.CD_MODULO) AND'
      #9#9#9#9#9#9#9#9'(M.DS_CHAVE = '#39#39'Impressao.CP'#39#39')'
      #9#9'WHERE'
      #9#9#9' MA.CD_ACAO IS NULL AND'
      #9#9#9' R.CD_MODULO = 4'
      #9#9'GROUP BY'
      #9#9#9' R.DS_GRUPO'
      #9')'
      #9#39';'
      #9
      #9'SELECT'
      #9#9'CD_MODULO INTO numero'
      #9'FROM'
      #9#9'NU_MODULOS'
      #9'WHERE'
      #9#9'DS_CHAVE = '#39'Impressao.Gerencial'#39'; '
      ''
      #9'EXECUTE IMMEDIATE '
      
        #9#9#39'INSERT INTO NU_MODULOS_ACOES (CD_MODULO, DS_NOME_ACAO, DS_CHA' +
        'VE)'
      #9#9' ('
      #9#9#9#9'SELECT'
      
        #9#9#9#9#9'(SELECT CD_MODULO FROM NU_MODULOS WHERE DS_CHAVE = '#39#39'Impres' +
        'sao.Gerencial'#39#39'),'
      
        #9#9#9#9#9'CONCAT('#39#39'Acesso aos relat'#243'rios gerenciais do grupo '#39#39', R.DS' +
        '_GRUPO),'
      #9#9#9#9#9'CONCAT('#39#39'Rel.Grupo.'#39#39', R.DS_GRUPO)'
      #9#9#9'  FROM'
      #9#9#9#9#9'RELATORIOS R'
      #9#9#9#9#9'LEFT JOIN NU_MODULOS_ACOES MA ON'
      
        #9#9#9#9#9'(CONCAT('#39#39'Rel.Grupo.'#39#39', R.DS_GRUPO) = MA.DS_CHAVE AND MA.CD' +
        '_MODULO = '#39'||numero||'#39')'
      #9#9#9#9#9'LEFT JOIN NU_MODULOS M ON'
      #9#9#9#9#9#9'(MA.CD_MODULO = M.CD_MODULO) AND'
      #9#9#9#9#9#9'(M.DS_CHAVE = '#39#39'Impressao.Gerencial'#39#39')'
      #9#9#9#9'WHERE'
      #9#9#9#9#9'MA.CD_ACAO IS NULL AND'
      #9#9#9#9#9'R.CD_MODULO = 5'
      #9#9#9#9'GROUP BY'
      #9#9#9#9#9'R.DS_GRUPO'
      #9#9#9')'#39';'
      ''
      'END;')
    Connection = DM.db
    DelimiterType = dtSetTerm
    Delimiter = '\\'
    Left = 320
    Top = 160
  end
end
