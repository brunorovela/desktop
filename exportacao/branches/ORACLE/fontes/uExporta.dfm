object fExportar: TfExportar
  Left = 0
  Top = 0
  Caption = 'Exportar'
  ClientHeight = 509
  ClientWidth = 792
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  FormStyle = fsMDIChild
  KeyPreview = True
  OldCreateOrder = False
  Visible = True
  WindowState = wsMaximized
  OnClose = FormClose
  OnCreate = FormCreate
  OnKeyDown = FormKeyDown
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object pnTitulo: TPanel
    Left = 0
    Top = 0
    Width = 792
    Height = 22
    Align = alTop
    BevelOuter = bvLowered
    Caption = 'LISTA DE LAYOUTS PARA EXPORTA'#199#195'O'
    Color = clBlue
    Font.Charset = ANSI_CHARSET
    Font.Color = clWhite
    Font.Height = -13
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 0
  end
  object Panel2: TPanel
    Left = 0
    Top = 22
    Width = 792
    Height = 462
    Align = alClient
    BevelOuter = bvLowered
    Font.Charset = ANSI_CHARSET
    Font.Color = clBlack
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
    TabOrder = 1
    object grd: TDBGrid
      Left = 1
      Top = 21
      Width = 790
      Height = 274
      Align = alClient
      BorderStyle = bsNone
      DataSource = dsLayouts
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Arial'
      Font.Style = []
      Options = [dgTitles, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgAlwaysShowSelection, dgConfirmDelete, dgCancelOnExit]
      ParentFont = False
      TabOrder = 0
      TitleFont.Charset = ANSI_CHARSET
      TitleFont.Color = clWindowText
      TitleFont.Height = -11
      TitleFont.Name = 'Arial'
      TitleFont.Style = []
      Columns = <
        item
          Expanded = False
          FieldName = 'cd_layout'
          Title.Alignment = taCenter
          Title.Caption = 'C'#243'digo'
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'ds_layout'
          Title.Alignment = taCenter
          Title.Caption = 'Descri'#231#227'o'
          Width = 500
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'cd_formato'
          Title.Alignment = taCenter
          Title.Caption = 'Formato'
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'ativo'
          Title.Alignment = taCenter
          Title.Caption = 'Ativo'
          Width = 60
          Visible = True
        end>
    end
    object Panel6: TPanel
      Left = 1
      Top = 295
      Width = 790
      Height = 20
      Align = alBottom
      BevelOuter = bvLowered
      Caption = 'INFORMA'#199#213'ES EXTRAS'
      Color = clGray
      Font.Charset = ANSI_CHARSET
      Font.Color = clWhite
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
      TabOrder = 1
    end
    object Panel1: TPanel
      Left = 1
      Top = 1
      Width = 790
      Height = 20
      Align = alTop
      BevelOuter = bvLowered
      Caption = 'LISTA'
      Color = clGray
      Font.Charset = ANSI_CHARSET
      Font.Color = clWhite
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
      TabOrder = 2
    end
    object meInfo: TMemo
      Left = 1
      Top = 315
      Width = 790
      Height = 146
      Align = alBottom
      Font.Charset = ANSI_CHARSET
      Font.Color = clBlack
      Font.Height = -12
      Font.Name = 'Courier New'
      Font.Style = []
      ParentFont = False
      ReadOnly = True
      TabOrder = 3
    end
  end
  object toolPessoa: TToolBar
    Left = 0
    Top = 484
    Width = 792
    Height = 25
    Align = alBottom
    ButtonWidth = 117
    Caption = 'tbAcoes'
    EdgeBorders = [ebTop, ebBottom]
    Images = ilAcoes
    List = True
    ShowCaptions = True
    TabOrder = 2
    object tlbSep1: TToolButton
      Left = 0
      Top = 0
      Width = 8
      Caption = 'tlbSep1'
      ImageIndex = 9
      Style = tbsSeparator
    end
    object dbNav: TDBNavigator
      Left = 8
      Top = 0
      Width = 104
      Height = 22
      VisibleButtons = [nbFirst, nbPrior, nbNext, nbLast]
      Flat = True
      TabOrder = 0
    end
    object ToolButton2: TToolButton
      Left = 112
      Top = 0
      Width = 10
      Caption = 'ToolButton2'
      ImageIndex = 8
      Style = tbsSeparator
    end
    object ToolButton1: TToolButton
      Left = 122
      Top = 0
      AutoSize = True
      Caption = ' F4 EXPORTAR >>'
      ImageIndex = 1
      OnClick = ToolButton1Click
    end
    object tlbSep5: TToolButton
      Left = 243
      Top = 0
      Width = 8
      Caption = 'tlbSep5'
      ImageIndex = 8
      Style = tbsSeparator
    end
    object btnFechar: TToolButton
      Left = 251
      Top = 0
      AutoSize = True
      Caption = 'F12 Fechar'
      ImageIndex = 0
      OnClick = btnFecharClick
    end
  end
  object ilAcoes: TImageList
    Top = 448
    Bitmap = {
      494C010102000400040010001000FFFFFFFFFF10FFFFFFFFFFFFFFFF424D3600
      0000000000003600000028000000400000001000000001002000000000000010
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000273AB000273AB000273
      AB000273AB000273AB000273AB000273AB000273AB000273AB000273AB000273
      AB000273AB000273AB0000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000009A616A009A616A009A616A009A61
      6A009A616A009A616A007244450061CFF40061CFF40061CFF40061CFF40061CF
      F4001081A5000273AB0000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000003163
      9C0031639C000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000009B666800FCF1DD00FBE6C100FBE6
      C100F3D9B800FBE6C100203E2000046B0B00046B0B00046B0B004EC9A00061CF
      F4001081A50060CEE6000273AB00000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000052630031639C0031639C003163
      9C0031639C000000000000526300005263000052630000526300005263000052
      6300000000000000000000000000000000009B6A6B00FEF9EF00FBE8C900F4DC
      BD00EDD3B400FBE6C1007244450057CCD000046B0B00046B0C00046B0B0043BF
      7E001081A50097EBF2000273AB00000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000526300316B9C00316B9C003163
      9C0031639C000000000000CEFF0000CEFF0000CEFF0000000000000000000000
      00000000000000000000000000000000000096777000FDFAF400FCEED700FBE8
      C900F4DCBD00FBE6C100724445006CD7F6006CD7F600046B0B0018573500046B
      0B00187A8D00A3ECF3000273AB00000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000526300296BA500296BA500296B
      9C00296B9C000000000000CEFF0000CEFF0000CEFF000000000000000000FF00
      000000000000000000000000000000000000CF946D00FDFAF400FDF6E600FCEE
      D700FBE6C400FBEBD1007244450075DCF70075DCF70047C28800046B0B003DBC
      6700046B0B0097EBF20057CCD0000273AB000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000005263002173AD002173A5002173
      A5002973A5000000000010CEFF0000CEFF0000CEFF0000000000FF000000FF00
      000000000000000000000000000000000000CE966F00FDFAF400FEF9EF00FDF6
      E600FDF3E200FDF6E6007244450097EBF20053CBBE006E976900046B0B003DBC
      6700046B0B006B9C6D0097918F000273AB000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000526300187BAD00187BAD00FFFF
      FF002173AD000000000031D6FF0029D6FF0018D6FF00FF000000FF000000FF00
      000000000000000000000000000000000000D69E7300FDFAF400FDFAF400FEF8
      EB00EACEAF00B6A48C007244450009696C00046B0B00046B0B003DBC67003EBD
      6C003DBC6700046B0B00046B0B000273AB000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000005263001084B5001884B5001884
      B500187BB5000000000063DEFF0052DEFF00FF000000FF000000FF000000FF00
      0000FF000000FF000000FF00000000000000D9A27800FDFAF400FDFAF400FCF1
      DD009B6668009B666800D59B700083E4F60047C28800046B0B0042BE760047C2
      88003DBC6700046B0B00EDD3B400724445000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000526300088CBD00108CBD001084
      BD001084B500000000008CE7FF00FF000000FF000000FF000000FF000000FF00
      0000FF000000FF000000FF00000000000000D9A27800CF946D00CF946D00CF94
      6D009B666800C2A384008FEBF60089E8F60089E8F6005B514700046B0B003DBC
      6700046B0B00EACEAF00FBE6C100724445000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000005263000894C600088CC600088C
      C600088CBD0000000000B5EFFF00A5EFFF00FF000000FF000000FF000000FF00
      0000FF000000FF000000FF00000000000000000000000273AB00FDFAF4008FEB
      F6008FEBF6008FEBF6000273AB000273AB000273AB00CF946D006B9C6D00046B
      0B00F6E0C100FBE6C400FBEBD100724445000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000005263000094CE000094CE000094
      C6000094C60000000000DEF7FF00CEF7FF00C6EFFF00FF000000FF000000FF00
      00000000000000000000000000000000000000000000000000000273AB000273
      AB000273AB000273AB00000000000000000000000000CE966F00FDFAF400FEF9
      EF00FDF6E600FDF3E200FDF6E600724445000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000526300009CCE00009CCE00009C
      CE000094CE0000000000FFFFFF00F7F7FF00E7F7FF0000000000FF000000FF00
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000D69E7300FDFAF400FDFA
      F400FEF8EB00EACEAF00B6A48C00724445000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000526300009CCE00009CCE00009C
      CE00009CCE0000000000FFFFFF00FFFFFF00FFFFFF000000000000000000FF00
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000D9A27800FDFAF400FDFA
      F400FCF1DD009B6668009B666800D59B70000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000052630000526300009C
      CE00009CCE000000000000526300005263000052630000526300000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000D9A27800CF946D00CF94
      6D00CF946D009B666800D59B7000000000000000000000000000000000000000
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
      000000000000000000000000FFFFFF00FFFF800300000000E3FF000300000000
      83FF000100000000000F000100000000003F000100000000002F000000000000
      000F000000000000000F00000000000000010000000000000001000000000000
      0001800000000000000FC38000000000000FFF8000000000002FFF8000000000
      803FFF8100000000E3FFFFFF0000000000000000000000000000000000000000
      000000000000}
  end
  object dsLayouts: TDataSource
    AutoEdit = False
    DataSet = qyRLayouts
    Left = 28
    Top = 80
  end
  object qyRLayouts: TUMZQuery
    Connection = DM.ZConn
    SQL.Strings = (
      'SELECT * FROM expo_layouts')
    Params = <>
    Top = 80
    object qyRLayoutsds_layout: TStringField
      FieldName = 'ds_layout'
      Size = 255
    end
    object qyRLayoutsme_layout: TBlobField
      FieldName = 'me_layout'
    end
    object qyRLayoutscd_formato: TIntegerField
      FieldName = 'cd_formato'
    end
    object qyRLayoutssn_ativo: TSmallintField
      FieldName = 'sn_ativo'
    end
    object qyRLayoutsativo: TStringField
      FieldKind = fkCalculated
      FieldName = 'ativo'
      Calculated = True
    end
    object qyRLayoutscd_layout: TIntegerField
      FieldName = 'cd_layout'
    end
    object qyRLayoutsnm_arquivo_padrao: TStringField
      FieldName = 'nm_arquivo_padrao'
      Size = 240
    end
    object qyRLayoutssn_exportacao: TIntegerField
      FieldName = 'sn_exportacao'
    end
  end
  object qyRExpoEspec: TUMZQuery
    Connection = DM.ZConn
    SQL.Strings = (
      'SELECT'
      '  *'
      'FROM'
      '  expo_layout_espec'
      'WHERE'
      '  cd_item = :cd_layout_item'
      'ORDER BY'
      '  nr_ordem')
    Params = <
      item
        DataType = ftUnknown
        Name = 'cd_layout_item'
        ParamType = ptUnknown
      end>
    DataSource = dsRExpoItens
    Left = 216
    Top = 336
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'cd_layout_item'
        ParamType = ptUnknown
      end>
    object qyRExpoEspecds_descricao: TStringField
      FieldName = 'ds_descricao'
      Size = 255
    end
    object qyRExpoEspecnr_tamanho: TLargeintField
      FieldName = 'nr_tamanho'
    end
    object qyRExpoEspecds_valor: TMemoField
      FieldName = 'ds_valor'
      BlobType = ftMemo
    end
    object qyRExpoEspecchr_preenche: TStringField
      FieldName = 'chr_preenche'
      Size = 10
    end
    object qyRExpoEspecchr_posicao: TSmallintField
      FieldName = 'chr_posicao'
    end
    object qyRExpoEspeccd_tipo: TSmallintField
      FieldName = 'cd_tipo'
    end
    object qyRExpoEspecnr_ordem: TLargeintField
      FieldName = 'nr_ordem'
    end
    object qyRExpoEspeccd_item: TIntegerField
      FieldName = 'cd_item'
    end
    object qyRExpoEspeccd_layout_espec: TIntegerField
      FieldName = 'cd_layout_espec'
    end
  end
  object qyRExpoItens: TUMZQuery
    Connection = DM.ZConn
    AfterOpen = qyRExpoItensAfterOpen
    SQL.Strings = (
      'SELECT'
      '  *'
      'FROM'
      '  expo_layout_itens'
      'WHERE'
      '  cd_layout = :cd_layout'
      '  AND sn_ativo = 1'
      'ORDER BY'
      '  nr_ordem')
    Params = <
      item
        DataType = ftUnknown
        Name = 'cd_layout'
        ParamType = ptUnknown
      end>
    DataSource = dsLayouts
    Left = 8
    Top = 336
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'cd_layout'
        ParamType = ptUnknown
      end>
    object qyRExpoItensnm_consulta: TStringField
      FieldName = 'nm_consulta'
      Size = 50
    end
    object qyRExpoItensds_item: TStringField
      FieldName = 'ds_item'
      Size = 100
    end
    object qyRExpoItensnr_ordem: TLargeintField
      FieldName = 'nr_ordem'
    end
    object qyRExpoItenssn_ativo: TSmallintField
      FieldName = 'sn_ativo'
    end
    object qyRExpoItenschr_separador: TStringField
      FieldName = 'chr_separador'
    end
    object qyRExpoItenscd_layout_item: TIntegerField
      FieldName = 'cd_layout_item'
    end
    object qyRExpoItenscd_layout: TIntegerField
      FieldName = 'cd_layout'
    end
    object qyRExpoItenscd_layout_item_pai: TIntegerField
      FieldName = 'cd_layout_item_pai'
    end
    object qyRExpoItensme_sqls_antes: TMemoField
      FieldName = 'me_sqls_antes'
      BlobType = ftMemo
    end
    object qyRExpoItensme_sqls_depois: TMemoField
      FieldName = 'me_sqls_depois'
      BlobType = ftMemo
    end
  end
  object sdSalvar: TSaveDialog
    DefaultExt = '.txt'
    Filter = 'Todos os Arquivos|*.*'
    Options = [ofOverwritePrompt, ofHideReadOnly, ofExtensionDifferent, ofNoReadOnlyReturn, ofEnableSizing]
    Left = 632
    Top = 200
  end
  object qyRItensSQL: TUMZQuery
    Connection = DM.ZConn
    SQL.Strings = (
      'SELECT '
      '  eli.cd_layout_item,'
      '  eli.cd_layout,'
      '  eli.nm_consulta,'
      '  eli.ds_item,'
      '  ec.me_sql'
      'FROM'
      '  expo_consultas ec'
      
        '  INNER JOIN expo_layout_itens eli ON (ec.nm_consulta = eli.nm_c' +
        'onsulta)'
      'WHERE'
      '  (eli.sn_ativo = 1) AND '
      '  (ec.sn_ativo = 1) AND '
      '  (eli.cd_layout_item =  :cd_layout_item)'
      'ORDER BY'
      '  eli.nr_ordem')
    Params = <
      item
        DataType = ftUnknown
        Name = 'cd_layout_item'
        ParamType = ptUnknown
      end>
    Left = 256
    Top = 336
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'cd_layout_item'
        ParamType = ptUnknown
      end>
    object qyRItensSQLme_sql: TBlobField
      FieldName = 'me_sql'
    end
  end
  object qyRItensFiltro: TUMZQuery
    Connection = DM.ZConn
    SQL.Strings = (
      'SELECT '
      '  elf.ds_ligacao,'
      '  elf.ds_grupo1,'
      
        '  IF(IFNULL(ec.ds_consulta, "")="", elf.ds_campo, ec.ds_consulta' +
        ') as ds_campo,'
      '  elf.ds_operador,'
      '  elf.ds_valor, '
      '  elf.ds_grupo2'
      'FROM'
      '  expo_layout_filtros elf'
      
        '  LEFT JOIN expo_campos as ec ON (ec.nm_tabela = SUBSTRING(elf.d' +
        's_campo,1, LOCATE('#39'.'#39', elf.ds_campo)-1) AND ec.nm_campo =   SUBS' +
        'TRING(elf.ds_campo,LOCATE('#39'.'#39', elf.ds_campo)+1))'
      'WHERE'
      '  (elf.sn_fixo = 1) AND '
      '  (elf.cd_item = :cd_layout_item)'
      'ORDER BY'
      '  elf.nr_ordem')
    Params = <
      item
        DataType = ftUnknown
        Name = 'cd_layout_item'
        ParamType = ptUnknown
      end>
    Left = 296
    Top = 336
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'cd_layout_item'
        ParamType = ptUnknown
      end>
    object qyRItensFiltrods_ligacao: TStringField
      FieldName = 'ds_ligacao'
      Size = 10
    end
    object qyRItensFiltrods_grupo1: TStringField
      FieldName = 'ds_grupo1'
      Size = 10
    end
    object qyRItensFiltrods_campo: TStringField
      FieldName = 'ds_campo'
      Size = 255
    end
    object qyRItensFiltrods_operador: TStringField
      FieldName = 'ds_operador'
      Size = 50
    end
    object qyRItensFiltrods_valor: TStringField
      FieldName = 'ds_valor'
      Size = 255
    end
    object qyRItensFiltrods_grupo2: TStringField
      FieldName = 'ds_grupo2'
      Size = 10
    end
  end
  object qyRCamposAux: TUMZQuery
    Connection = DM.ZConn
    SQL.Strings = (
      'SELECT '
      
        #9'CONCAT(IF((ISNULL(ds_consulta)OR (LENGTH(TRIM(ds_consulta))=0))' +
        ',CONCAT(ec.nm_tabela, '#39'.'#39', ec.nm_campo),ds_consulta),'
      #9#39' as '#39','#9'CONCAT(ec.nm_tabela, '#39'_'#39', ec.nm_campo)) as campo'
      'FROM'
      '  expo_campos ec'
      'WHERE'
      '  (CONCAT(ec.nm_tabela, '#39'.'#39', ec.nm_campo) = :nomecampo)')
    Params = <
      item
        DataType = ftUnknown
        Name = 'nomecampo'
        ParamType = ptUnknown
      end>
    Left = 336
    Top = 336
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'nomecampo'
        ParamType = ptUnknown
      end>
  end
  object dsRExpoItens: TDataSource
    AutoEdit = False
    DataSet = qyRExpoItens
    Left = 44
    Top = 336
  end
  object qyAux: TUMZQuery
    Connection = DM.ZConn
    Params = <>
    Left = 16
    Top = 184
  end
  object qyAux2: TUMZQuery
    Connection = DM.ZConn
    Params = <>
    Left = 48
    Top = 184
  end
  object qyVerificaPermissaoColigada: TUMZQuery
    Connection = DM.ZConn
    SQL.Strings = (
      'SELECT DISTINCT'
      #9'd.codigo cd_departamento,'
      '  d.descricao ds_departamento,'
      
        '  CASE WHEN MAX(ngp.cd_pessoa) IS NOT NULL THEN 1 ELSE 0 END sn_' +
        'permissao'
      'FROM'
      '  departamentos d'
      '  LEFT JOIN coligadas c ON (c.cd_coligada = d.cd_coligada)'
      '  LEFT JOIN nu_grupos_pessoas ngp ON ('
      '    ngp.cd_coligada = c.cd_coligada AND'
      '    ngp.cd_pessoa = :cd_pessoa'
      '  )'
      'WHERE'
      '  d.codigo IN :cd_departamento_in'
      'GROUP BY'
      #9'd.codigo')
    Params = <
      item
        DataType = ftUnknown
        Name = 'cd_pessoa'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'cd_departamento_in'
        ParamType = ptUnknown
      end>
    Left = 80
    Top = 184
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'cd_pessoa'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'cd_departamento_in'
        ParamType = ptUnknown
      end>
  end
end
