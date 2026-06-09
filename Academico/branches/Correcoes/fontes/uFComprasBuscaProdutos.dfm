object frmComprasBuscaProdutos: TfrmComprasBuscaProdutos
  Left = 0
  Top = 0
  BorderStyle = bsDialog
  Caption = 'Compras - Busca de Produtos'
  ClientHeight = 489
  ClientWidth = 525
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  OnCreate = FormCreate
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object Bevel6: TBevel
    Left = 0
    Top = 26
    Width = 525
    Height = 5
    Align = alTop
    Shape = bsSpacer
    ExplicitLeft = -87
    ExplicitTop = 25
    ExplicitWidth = 568
  end
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 525
    Height = 26
    Align = alTop
    BevelOuter = bvLowered
    Caption = 'BUSCA DE PRODUTOS'
    Color = clBlue
    Font.Charset = ANSI_CHARSET
    Font.Color = clWhite
    Font.Height = -17
    Font.Name = 'Arial'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 0
  end
  object Panel2: TPanel
    Left = 0
    Top = 31
    Width = 525
    Height = 117
    Align = alTop
    TabOrder = 1
    object Label1: TLabel
      Left = 118
      Top = 37
      Width = 51
      Height = 13
      Caption = 'Categoria:'
    end
    object Label2: TLabel
      Left = 82
      Top = 91
      Width = 87
      Height = 13
      Caption = 'Nome do Produto:'
    end
    object Label3: TLabel
      Left = 76
      Top = 64
      Width = 93
      Height = 13
      Caption = 'C'#243'digo do Produto:'
    end
    object Label4: TLabel
      Left = 77
      Top = 10
      Width = 92
      Height = 13
      Caption = 'Unidade de Ensino:'
    end
    object cbCategorias: TUMComboBox
      Left = 175
      Top = 34
      Width = 276
      Height = 21
      ItemHeight = 13
      TabOrder = 1
      OnChange = cbCategoriasChange
      OnKeyUp = edFiltroNomeProdutoKeyUp
      TamanhoMaximo = 0
      SelecionarUnicoAutomatico = False
    end
    object edFiltroNomeProduto: TEdit
      Left = 175
      Top = 88
      Width = 276
      Height = 21
      TabOrder = 3
      OnKeyUp = edFiltroNomeProdutoKeyUp
    end
    object edFiltroCodigoProduto: TEdit
      Left = 175
      Top = 64
      Width = 276
      Height = 21
      TabOrder = 2
      OnEnter = edFiltroCodigoProdutoEnter
      OnKeyUp = edFiltroNomeProdutoKeyUp
    end
    object cbColigadas: TUMComboBox
      Left = 175
      Top = 6
      Width = 276
      Height = 21
      ItemHeight = 13
      TabOrder = 0
      OnChange = cbColigadasChange
      OnKeyUp = edFiltroNomeProdutoKeyUp
      TamanhoMaximo = 0
      SelecionarUnicoAutomatico = False
    end
  end
  object DBGrid1: TDBGrid
    Left = 0
    Top = 148
    Width = 525
    Height = 341
    Align = alClient
    DataSource = dsListaProdutos
    Options = [dgTitles, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgConfirmDelete, dgCancelOnExit]
    TabOrder = 2
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'Tahoma'
    TitleFont.Style = []
    OnDblClick = DBGrid1DblClick
    Columns = <
      item
        Expanded = False
        FieldName = 'CD_PRODUTO'
        Title.Caption = 'C'#243'digo'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'DS_PRODUTO'
        Title.Caption = 'Descri'#231#227'o'
        Width = 190
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'QTD_PRODUTOS'
        Title.Caption = 'Qtd. Estoque'
        Width = 70
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'VL_PRODUTO'
        Title.Caption = 'Valor'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'SN_ESTOQUE_POR_COLIGADA'
        Visible = True
      end>
  end
  object qyListaProdutos: TUMZReadOnlyQuery
    Connection = DM.db
    SQL.Strings = (
      'SELECT DISTINCT'
      '  cp.CD_PRODUTO, cp.DS_PRODUTO, cp.SN_IMPRIMIR_CUPOM,'
      
        '  CAST( GET_COMPRAS_QTD_ESTOQUE( cp.CD_PRODUTO ) AS SIGNED ) AS ' +
        'QTD_PRODUTOS,'
      
        '  cb.cd_codigo_barras as codBarras,  CP.NR_PARCELAS, cp.cd_categ' +
        'oria, cp.vl_produto'
      'FROM'
      '   COMP_PRODUTOS cp'
      
        'LEFT JOIN comp_codigo_barras cb on (cp.cd_produto = cb.cd_produt' +
        'o AND cb.sn_cantina = 0)'
      'ORDER BY'
      '  cp.DS_PRODUTO')
    Params = <>
    Left = 32
    Top = 40
    object qyListaProdutosCD_PRODUTO: TStringField
      FieldName = 'CD_PRODUTO'
      Required = True
      Size = 30
    end
    object qyListaProdutosDS_PRODUTO: TStringField
      FieldName = 'DS_PRODUTO'
      Required = True
      Size = 255
    end
    object qyListaProdutosQTD_PRODUTOS: TLargeintField
      FieldName = 'QTD_PRODUTOS'
    end
    object qyListaProdutosSN_IMPRIMIR_CUPOM: TSmallintField
      FieldName = 'SN_IMPRIMIR_CUPOM'
      Required = True
    end
    object qyListaProdutoscodBarras: TStringField
      FieldName = 'codBarras'
      Size = 30
    end
    object qyListaProdutosNR_PARCELAS: TIntegerField
      FieldName = 'NR_PARCELAS'
    end
    object qyListaProdutoscd_categoria: TIntegerField
      FieldName = 'cd_categoria'
    end
    object qyListaProdutossn_acumular_valores: TSmallintField
      FieldName = 'sn_acumular_valores'
    end
    object qyListaProdutossn_gerar_titulo: TSmallintField
      FieldName = 'sn_gerar_titulo'
    end
    object qyListaProdutosvl_compra: TFloatField
      FieldName = 'vl_compra'
      DisplayFormat = '###,###,##0.00'
      currency = True
    end
    object qyListaProdutosVL_PRODUTO: TFloatField
      FieldName = 'VL_PRODUTO'
      DisplayFormat = '###,###,##0.00'
    end
    object qyListaProdutosSN_ESTOQUE_POR_COLIGADA: TIntegerField
      FieldName = 'SN_ESTOQUE_POR_COLIGADA'
    end
  end
  object dsListaProdutos: TDataSource
    DataSet = qyListaProdutos
    Left = 64
    Top = 40
  end
end
