object frmComprasRegistroSaidas: TfrmComprasRegistroSaidas
  Left = 347
  Top = 108
  BorderStyle = bsDialog
  Caption = 'Compras - Sa'#237'da de Produtos e Kits'
  ClientHeight = 671
  ClientWidth = 738
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  FormStyle = fsStayOnTop
  KeyPreview = True
  OldCreateOrder = False
  Position = poScreenCenter
  OnClose = FormClose
  OnCloseQuery = FormCloseQuery
  OnCreate = FormCreate
  OnKeyDown = FormKeyDown
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object SpeedButton6: TSpeedButton
    Left = 299
    Top = 124
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
    OnClick = SpeedButton4Click
  end
  object PageControl1: TPageControl
    Left = 0
    Top = 0
    Width = 738
    Height = 671
    ActivePage = tbProdutos
    Align = alClient
    TabOrder = 0
    OnChange = PageControl1Change
    OnChanging = PageControl1Changing
    object tbProdutos: TTabSheet
      Caption = 'Produtos'
      object PanelProduto: TPanel
        Left = 0
        Top = 215
        Width = 730
        Height = 202
        Align = alClient
        TabOrder = 3
        object Panel9: TPanel
          Left = 1
          Top = 45
          Width = 728
          Height = 156
          Align = alClient
          BevelOuter = bvNone
          Caption = 'Panel9'
          TabOrder = 0
          object dbProdutos: TDBGrid
            Left = 0
            Top = 0
            Width = 728
            Height = 156
            Align = alClient
            DataSource = dsProdutos
            TabOrder = 0
            TitleFont.Charset = DEFAULT_CHARSET
            TitleFont.Color = clWindowText
            TitleFont.Height = -11
            TitleFont.Name = 'Tahoma'
            TitleFont.Style = []
            OnColEnter = dbProdutosColEnter
            OnColExit = dbProdutosColExit
            OnExit = dbProdutosExit
            OnKeyDown = dbProdutosKeyDown
            Columns = <
              item
                Expanded = False
                FieldName = 'ds_produto'
                ReadOnly = True
                Width = 148
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'nr_qtd_estoque'
                ReadOnly = True
                Width = 99
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'nr_preco_unitario'
                ReadOnly = True
                Width = 77
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'nr_quantidade'
                Width = 71
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'vl_total'
                ReadOnly = True
                Title.Caption = 'Valor Total'
                Visible = True
              end>
          end
        end
        object Panel2: TPanel
          Left = 1
          Top = 1
          Width = 728
          Height = 44
          Align = alTop
          TabOrder = 1
          object Label11: TLabel
            Left = 12
            Top = 0
            Width = 99
            Height = 13
            Caption = 'Ano/Sem da retirada'
          end
          object Label7: TLabel
            Left = 139
            Top = 0
            Width = 83
            Height = 13
            Caption = 'Data da Entrada:'
          end
          object sbSelecionarColunaDisc: TSpeedButton
            Left = 696
            Top = 15
            Width = 23
            Height = 21
            Hint = 'Selecionar Colunas'
            Align = alCustom
            Flat = True
            Glyph.Data = {
              36030000424D3603000000000000360000002800000010000000100000000100
              1800000000000003000000000000000000000000000000000000FFFFFFFFFFFF
              FFFFFFDFDFDFDFDFDFBFBFBFBFBFBFBFBFBFBFBFBFA0A0A0CFCFCFDFDFDFDFDF
              DFDFDFDFFFFFFFFFFFFFFFFFFFDFDFDFDFDFDFBFBFBF70707020202000000000
              0000000000505050909090A0A0A0CFCFCFDFDFDFEFEFEFEFEFEFDFDFDFCFCFCF
              808080404040000000505050606060A0A0A0A0A0A0A0A0A04040405050509090
              90B0B0B0DFDFDFEFEFEFBFBFBF505050202020808080A0A0806060608F8F6F6F
              6F6F6060607F7F3F606060606040404040A0A0A0B0B0B0DFDFDF9F9F9F606020
              9090505050306F6F6FBFBFBF8F6F30400000400000BF9F9FDFDFDF8F8F6F7050
              50402020A0A0A0B0B0B09F9F9F808060303030C0C0C0B0B0B0BF9F20DF7F00FF
              3F00FF00009F0000CFCFCFDFDFDFDFDFDF907050402020A0A0A0404020602020
              A080609030307F7F40DFBF00BF0000000000BF0000FF0000A06060CFCFCFBFBF
              9F806000402000808080808020202000600000804000804020FF7F00BF000000
              00009F3F3FDF5F3F705030B0B090804000606040303030BFBFBFA0A060606040
              2020006000008060009F2000FF0000FF0000FF0000DFDF3F8040008020007070
              702020209F9F9FFFFFFF909030A0A080B0B09020200000000040000040000040
              0000400000400000202020A0A0802020209F9F9FFFFFFFFFFFFFCFCFCFA0A060
              A0A080A0A0A0A0A0A08080606F6F6F6F6F6F8F8F6FA0A0A0A0A0A02020209F9F
              9FFFFFFFFFFFFFFFFFFF7F7F3FBFBF9FA0A080909070909070AFAF8F80806080
              8080808060808060606060DFDFDFFFFFFFFFFFFFDFDFDFC0C0C0303030202000
              707030909070A0A0A0909090909070A0A060CFCFCFDFDFDFFFFFFFFFFFFFDFDF
              DF808060705030CFAFAFEFEFEF303030000000202000404020A0A060B0B090DF
              DFDFDFDFDFDFDFDFBFBF9F606060202000303030EFEFEFFFFFFFFFFFFFFFFFFF
              AFAFAF303030000000000000000000000000000000000000000000303030AFAF
              AFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFAFAFAF7F7F7F7F7F7F7F
              7F7F7F7F7F7F7F7FEFEFEFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF}
            ParentShowHint = False
            ShowHint = True
            OnClick = sbSelecionarColunaDiscClick
          end
          object DbAnoSem: TDBEdit
            Left = 12
            Top = 15
            Width = 91
            Height = 21
            DataField = 'NR_ANOSEMESTRE'
            DataSource = dsRegistraSaida
            ReadOnly = True
            TabOrder = 0
          end
          object udDAnoSem: TUpDown
            Left = 109
            Top = 15
            Width = 16
            Height = 22
            Min = -100
            TabOrder = 1
            OnClick = udDAnoSemClick
          end
          object DBEdit5: TDBEdit
            Left = 139
            Top = 15
            Width = 174
            Height = 21
            DataField = 'dt_entrada'
            DataSource = dsRegistraSaida
            Enabled = False
            TabOrder = 2
          end
        end
      end
      object Panel1: TPanel
        Left = 0
        Top = 0
        Width = 730
        Height = 26
        Align = alTop
        BevelOuter = bvLowered
        Caption = 'REGISTRO DE SA'#205'DA DE PRODUTOS (VENDAS)'
        Color = clBlue
        Font.Charset = ANSI_CHARSET
        Font.Color = clWhite
        Font.Height = -17
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        ParentFont = False
        TabOrder = 5
      end
      object toolPessoa: TToolBar
        Left = 0
        Top = 620
        Width = 730
        Height = 23
        Align = alBottom
        ButtonWidth = 84
        Caption = 'toolPessoa'
        EdgeBorders = [ebTop, ebBottom]
        Images = ImageList2
        List = True
        ShowCaptions = True
        TabOrder = 6
        object ToolButton1: TToolButton
          Left = 0
          Top = 0
          Width = 8
          Caption = 'ToolButton1'
          ImageIndex = 9
          Style = tbsSeparator
        end
        object btnIncluir: TToolButton
          Left = 8
          Top = 0
          AutoSize = True
          Caption = 'F2 Incluir'
          Enabled = False
          ImageIndex = 0
          OnClick = btnIncluirClick
        end
        object ToolButton4: TToolButton
          Left = 83
          Top = 0
          Width = 8
          Caption = 'ToolButton4'
          ImageIndex = 3
          Style = tbsSeparator
        end
        object btnSalvar: TToolButton
          Left = 91
          Top = 0
          AutoSize = True
          Caption = 'F5 Salvar'
          Enabled = False
          ImageIndex = 1
          OnClick = btnSalvarClick
        end
        object btnCancelar: TToolButton
          Left = 167
          Top = 0
          AutoSize = True
          Caption = 'F6 Cancelar'
          Enabled = False
          ImageIndex = 2
          OnClick = btnCancelarClick
        end
        object ToolButton11: TToolButton
          Left = 255
          Top = 0
          Width = 8
          Caption = 'ToolButton11'
          ImageIndex = 7
          Style = tbsSeparator
        end
        object btnSair: TToolButton
          Left = 263
          Top = 0
          AutoSize = True
          Caption = 'F12 Fechar'
          ImageIndex = 4
          OnClick = btnSairClick
        end
      end
      object pnSelecionaEntrada: TPanel
        Left = 0
        Top = 26
        Width = 730
        Height = 37
        Align = alTop
        TabOrder = 0
        object rgTipoEntrada: TRadioGroup
          Left = 12
          Top = 0
          Width = 258
          Height = 34
          Caption = 'Tipo de Entrada'
          Columns = 2
          Items.Strings = (
            'C'#243'digo'
            'C'#243'digo de Barras')
          TabOrder = 0
          OnClick = rgTipoEntradaClick
        end
      end
      object Panel6: TPanel
        Left = 0
        Top = 63
        Width = 730
        Height = 54
        Align = alTop
        TabOrder = 1
        object Label9: TLabel
          Left = 12
          Top = 2
          Width = 88
          Height = 13
          Caption = 'Informe a Pessoa:'
        end
        object SpeedButton1: TSpeedButton
          Left = 547
          Top = 15
          Width = 22
          Height = 22
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
          OnClick = SpeedButton1Click
        end
        object msgSemPermPro: TLabel
          Left = 12
          Top = 36
          Width = 271
          Height = 13
          Caption = 'Esta pessoa n'#227'o possui permiss'#227'o para retirar produtos!'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clRed
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
          Visible = False
        end
        object DBEdit2: TDBEdit
          Left = 12
          Top = 16
          Width = 81
          Height = 21
          DataField = 'cd_pessoa'
          DataSource = dsRegistraSaida
          TabOrder = 0
          OnExit = DBEdit2Exit
        end
        object edNomeComprador: TEdit
          Left = 99
          Top = 15
          Width = 442
          Height = 21
          Enabled = False
          TabOrder = 1
        end
      end
      object pnParcelas: TPanel
        Left = 0
        Top = 417
        Width = 730
        Height = 178
        Align = alBottom
        TabOrder = 4
        Visible = False
        object Panel10: TPanel
          Left = 1
          Top = 1
          Width = 728
          Height = 40
          Align = alTop
          BevelOuter = bvNone
          TabOrder = 0
          object Label20: TLabel
            Left = 0
            Top = 10
            Width = 68
            Height = 13
            Align = alCustom
            Caption = 'Nro. parcelas:'
          end
          object Label21: TLabel
            Left = 129
            Top = 10
            Width = 147
            Height = 13
            Align = alCustom
            Caption = 'com vencimento sempre no dia'
          end
          object lblVenctoSempre: TLabel
            Left = 318
            Top = 10
            Width = 57
            Height = 13
            Align = alCustom
            Caption = ', a partir de'
          end
          object sbCalcVencto: TSpeedButton
            Left = 650
            Top = 6
            Width = 79
            Height = 21
            Hint = 'Calcular vencimentos'
            Caption = 'Visualizar'
            Flat = True
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
            OnClick = sbCalcVenctoClick
          end
          object Label25: TLabel
            Left = 119
            Top = 10
            Width = 4
            Height = 13
            Caption = ','
          end
          object lblVenctoOpcs: TLabel
            Left = 463
            Top = 10
            Width = 187
            Height = 13
            Caption = '(exceto s'#225'bados, domingos e feriados)'
          end
          object edNrParcelas: TEdit
            Left = 72
            Top = 6
            Width = 29
            Height = 21
            Align = alCustom
            ReadOnly = True
            TabOrder = 0
            Text = '1'
          end
          object edDiaVencto: TEdit
            Left = 281
            Top = 6
            Width = 31
            Height = 21
            Align = alCustom
            TabOrder = 1
            OnKeyPress = edDiaVenctoKeyPress
          end
          object dtpVenctoSempre: TDateTimePicker
            Left = 381
            Top = 6
            Width = 77
            Height = 21
            Align = alCustom
            Date = 41065.414538032400000000
            Format = 'MM/yyyy'
            Time = 41065.414538032400000000
            DateMode = dmUpDown
            TabOrder = 2
          end
          object upParcelas: TUpDown
            Left = 101
            Top = 6
            Width = 16
            Height = 21
            Associate = edNrParcelas
            Min = 1
            Position = 1
            TabOrder = 3
          end
        end
        object Panel8: TPanel
          Left = 1
          Top = 41
          Width = 728
          Height = 136
          Align = alClient
          BevelOuter = bvNone
          TabOrder = 1
          object dbgParcelas: TDBGrid
            Left = 0
            Top = 0
            Width = 728
            Height = 136
            Align = alClient
            DataSource = dsParcelas
            Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgConfirmDelete, dgCancelOnExit]
            TabOrder = 0
            TitleFont.Charset = DEFAULT_CHARSET
            TitleFont.Color = clWindowText
            TitleFont.Height = -11
            TitleFont.Name = 'Tahoma'
            TitleFont.Style = []
            Columns = <
              item
                Alignment = taLeftJustify
                Expanded = False
                FieldName = 'DS_TIPO_TITULO'
                ReadOnly = True
                Title.Caption = 'Tipo de t'#237'tulo'
                Width = 187
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'NM_PRODUTO'
                ReadOnly = True
                Title.Caption = 'Produto'
                Width = 148
                Visible = True
              end
              item
                Alignment = taLeftJustify
                Expanded = False
                FieldName = 'NR_PARCELA'
                ReadOnly = True
                Title.Caption = 'Parcela'
                Width = 51
                Visible = True
              end
              item
                Alignment = taLeftJustify
                Expanded = False
                FieldName = 'DT_VENCTO'
                ReadOnly = True
                Title.Caption = 'Vencimento'
                Width = 70
                Visible = True
              end
              item
                Alignment = taLeftJustify
                Expanded = False
                FieldName = 'VL_BRUTO'
                ReadOnly = True
                Title.Caption = 'Valor bruto'
                Width = 86
                Visible = True
              end>
          end
        end
      end
      object pnlBusca: TPanel
        Left = 0
        Top = 117
        Width = 730
        Height = 98
        Align = alTop
        AutoSize = True
        BevelOuter = bvNone
        TabOrder = 2
        object pnCod: TPanel
          Left = 0
          Top = 49
          Width = 730
          Height = 49
          Align = alTop
          TabOrder = 0
          object Label16: TLabel
            Left = 12
            Top = 2
            Width = 143
            Height = 13
            Caption = 'Informe o C'#243'digo do Produto:'
          end
          object SpeedButton5: TSpeedButton
            Left = 299
            Top = 20
            Width = 22
            Height = 22
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
            OnClick = SpeedButton5Click
          end
          object edCodigoProduto: TDBEdit
            Left = 12
            Top = 21
            Width = 281
            Height = 21
            DataField = 'cd_produto'
            DataSource = dsRegistraSaida
            TabOrder = 0
            OnEnter = edCodigoProdutoEnter
            OnExit = edCodigoProdutoExit
          end
        end
        object PnCodBarra: TPanel
          Left = 0
          Top = 0
          Width = 730
          Height = 49
          Align = alTop
          TabOrder = 1
          Visible = False
          object Label17: TLabel
            Left = 12
            Top = 2
            Width = 192
            Height = 13
            Align = alCustom
            Caption = 'Informe o C'#243'digo de barras do Produto:'
          end
          object SpeedButton8: TSpeedButton
            Left = 299
            Top = 20
            Width = 22
            Height = 22
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
            OnClick = SpeedButton5Click
          end
          object edCodBarras: TEdit
            Left = 12
            Top = 21
            Width = 281
            Height = 21
            MaxLength = 30
            TabOrder = 0
            OnExit = edCodBarrasExit
            OnKeyPress = edCodBarrasKeyPress
          end
        end
      end
      object panel_total: TPanel
        Left = 0
        Top = 595
        Width = 730
        Height = 25
        Align = alBottom
        BevelOuter = bvNone
        TabOrder = 7
        object Label1: TLabel
          Left = 11
          Top = 7
          Width = 53
          Height = 13
          Caption = 'Valor total:'
        end
        object lblvl_total: TLabel
          Left = 70
          Top = 7
          Width = 38
          Height = 13
          BiDiMode = bdLeftToRight
          Caption = 'R$ 0,00'
          ParentBiDiMode = False
        end
      end
    end
    object tbKits: TTabSheet
      Caption = 'Kits'
      ImageIndex = 1
      object Panel3: TPanel
        Left = 0
        Top = 247
        Width = 730
        Height = 100
        Align = alTop
        TabOrder = 4
        object Label10: TLabel
          Left = 275
          Top = 6
          Width = 111
          Height = 13
          Caption = 'Qtd. Atual do Estoque:'
        end
        object Label12: TLabel
          Left = 12
          Top = 6
          Width = 87
          Height = 13
          Caption = 'Nome do Produto:'
        end
        object Label13: TLabel
          Left = 12
          Top = 55
          Width = 71
          Height = 13
          Caption = 'Pre'#231'o Unit'#225'rio:'
        end
        object Label14: TLabel
          Left = 139
          Top = 55
          Width = 60
          Height = 13
          Caption = 'Quantidade:'
        end
        object Label15: TLabel
          Left = 275
          Top = 55
          Width = 55
          Height = 13
          Caption = 'Valor Total:'
        end
        object edQuantkit: TEdit
          Left = 275
          Top = 25
          Width = 132
          Height = 21
          Enabled = False
          TabOrder = 1
        end
        object edNomeKit: TEdit
          Left = 12
          Top = 25
          Width = 249
          Height = 21
          ReadOnly = True
          TabOrder = 0
        end
        object edPrecoUnitarioKit: TUMEditMonetario
          Left = 12
          Top = 74
          Width = 121
          Height = 21
          Enabled = False
          TabOrder = 2
          Text = '0,00'
          Mascara = '###,###,##0.00'
          CasasDecimais = 2
          EnterProximoCampo = True
        end
        object edValorTotalKit: TUMEditMonetario
          Left = 276
          Top = 74
          Width = 131
          Height = 21
          Enabled = False
          TabOrder = 4
          Text = '0,00'
          Mascara = '###,###,##0.00'
          CasasDecimais = 2
          EnterProximoCampo = True
        end
        object edQuantidadeKit: TEdit
          Left = 139
          Top = 74
          Width = 124
          Height = 21
          TabOrder = 3
          OnChange = edQuantidadeKitChange
          OnExit = edQuantidadeKitExit
        end
      end
      object Panel4: TPanel
        Left = 0
        Top = 0
        Width = 730
        Height = 26
        Align = alTop
        BevelOuter = bvLowered
        Caption = 'REGISTRO DE SA'#205'DA DE KITS (VENDAS)'
        Color = clBlue
        Font.Charset = ANSI_CHARSET
        Font.Color = clWhite
        Font.Height = -17
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        ParentFont = False
        TabOrder = 6
      end
      object ToolBar1: TToolBar
        Left = 0
        Top = 620
        Width = 730
        Height = 23
        Align = alBottom
        ButtonWidth = 84
        Caption = 'toolPessoa'
        EdgeBorders = [ebTop, ebBottom]
        Images = ImageList2
        List = True
        ShowCaptions = True
        TabOrder = 7
        object ToolButton3: TToolButton
          Left = 0
          Top = 0
          Width = 8
          Caption = 'ToolButton1'
          ImageIndex = 9
          Style = tbsSeparator
        end
        object btnIncluirKit: TToolButton
          Left = 8
          Top = 0
          AutoSize = True
          Caption = 'F2 Incluir'
          ImageIndex = 0
          OnClick = edCdPessoaChange
        end
        object ToolButton6: TToolButton
          Left = 83
          Top = 0
          Width = 8
          Caption = 'ToolButton4'
          ImageIndex = 3
          Style = tbsSeparator
        end
        object btnsalvarKit: TToolButton
          Left = 91
          Top = 0
          AutoSize = True
          Caption = 'F5 Salvar'
          Enabled = False
          ImageIndex = 1
          OnClick = btnsalvarKitClick
        end
        object btnCancelarKit: TToolButton
          Left = 167
          Top = 0
          AutoSize = True
          Caption = 'F6 Cancelar'
          Enabled = False
          ImageIndex = 2
          OnClick = btnCancelarKitClick
        end
        object ToolButton9: TToolButton
          Left = 255
          Top = 0
          Width = 8
          Caption = 'ToolButton11'
          ImageIndex = 7
          Style = tbsSeparator
        end
        object btnFecharKit: TToolButton
          Left = 263
          Top = 0
          AutoSize = True
          Caption = 'F12 Fechar'
          ImageIndex = 4
          OnClick = btnFecharKitClick
        end
        object ToolButton12: TToolButton
          Left = 348
          Top = 0
          Width = 8
          ImageIndex = 8
          Style = tbsSeparator
        end
      end
      object Panel5: TPanel
        Left = 0
        Top = 26
        Width = 730
        Height = 41
        Align = alTop
        TabOrder = 0
        object rgTipoEntradaKit: TRadioGroup
          Left = 12
          Top = 4
          Width = 258
          Height = 34
          Caption = 'Tipo de Entrada'
          Columns = 2
          Items.Strings = (
            'C'#243'digo'
            'C'#243'digo de Barras')
          TabOrder = 0
          OnClick = rgTipoEntradaKitClick
        end
      end
      object pnCodKit: TPanel
        Left = 0
        Top = 133
        Width = 730
        Height = 57
        Align = alTop
        TabOrder = 2
        object Label8: TLabel
          Left = 140
          Top = 6
          Width = 117
          Height = 13
          Caption = 'Informe o C'#243'digo do Kit:'
        end
        object SpeedButton4: TSpeedButton
          Left = 432
          Top = 25
          Width = 22
          Height = 22
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
          OnClick = SpeedButton4Click
        end
        object Label19: TLabel
          Left = 12
          Top = 6
          Width = 99
          Height = 13
          Caption = 'Ano/Sem da retirada'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
        end
        object edCodkIT: TEdit
          Left = 140
          Top = 25
          Width = 281
          Height = 21
          TabOrder = 1
          OnChange = edCdPessoaChange
          OnExit = edCodkITExit
          OnKeyPress = edCodkITKeyPress
        end
        object txtAnoSemestre: TMaskEdit
          Left = 12
          Top = 25
          Width = 91
          Height = 22
          TabStop = False
          EditMask = '9999/9;0;_'
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = []
          MaxLength = 6
          ParentFont = False
          TabOrder = 0
        end
        object UpDown1: TUpDown
          Left = 107
          Top = 25
          Width = 16
          Height = 22
          Min = -100
          TabOrder = 2
          OnClick = UpDown1Click
        end
      end
      object pnCodBarraKit: TPanel
        Left = 0
        Top = 190
        Width = 730
        Height = 57
        Align = alTop
        TabOrder = 3
        Visible = False
        object Label18: TLabel
          Left = 12
          Top = 6
          Width = 166
          Height = 13
          Caption = 'Informe o C'#243'digo de barras do Kit:'
        end
        object SpeedButton2: TSpeedButton
          Left = 299
          Top = 25
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
          OnClick = SpeedButton4Click
        end
        object edCodBarraKit: TEdit
          Left = 12
          Top = 25
          Width = 281
          Height = 21
          TabOrder = 0
          OnChange = edCdPessoaChange
          OnExit = edCodBarraKitExit
          OnKeyPress = edCodBarraKitKeyPress
        end
      end
      object Panel7: TPanel
        Left = 0
        Top = 67
        Width = 730
        Height = 66
        Align = alTop
        Caption = 'Panel7'
        TabOrder = 1
        object Label2: TLabel
          Left = 12
          Top = 6
          Width = 88
          Height = 13
          Caption = 'Informe a Pessoa:'
        end
        object SpeedButton3: TSpeedButton
          Left = 547
          Top = 19
          Width = 22
          Height = 22
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
          OnClick = SpeedButton3Click
        end
        object msgSemPermKit: TLabel
          Left = 12
          Top = 45
          Width = 271
          Height = 13
          Caption = 'Esta pessoa n'#227'o possui permiss'#227'o para retirar produtos!'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clRed
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
          Visible = False
        end
        object edCdPessoa: TEdit
          Left = 12
          Top = 20
          Width = 81
          Height = 21
          TabOrder = 0
          OnChange = edCdPessoaChange
          OnExit = edCdPessoaExit
          OnKeyPress = edCdPessoaKeyPress
        end
        object edNmPessoa: TEdit
          Left = 99
          Top = 20
          Width = 442
          Height = 21
          Enabled = False
          TabOrder = 1
        end
      end
      object pnParcelaKit: TPanel
        Left = 0
        Top = 347
        Width = 730
        Height = 273
        Align = alClient
        TabOrder = 5
        Visible = False
        object Panel11: TPanel
          Left = 1
          Top = 1
          Width = 728
          Height = 56
          Align = alTop
          BevelOuter = bvNone
          TabOrder = 0
          object Label22: TLabel
            Left = 11
            Top = 8
            Width = 68
            Height = 13
            Align = alCustom
            Caption = 'Nro. parcelas:'
          end
          object Label23: TLabel
            Left = 11
            Top = 32
            Width = 147
            Height = 13
            Align = alCustom
            Caption = 'com vencimento sempre no dia'
          end
          object Label24: TLabel
            Left = 203
            Top = 32
            Width = 57
            Height = 13
            Align = alCustom
            Caption = ', a partir de'
          end
          object sbCalcVenctoKit: TSpeedButton
            Left = 489
            Top = 5
            Width = 79
            Height = 22
            Hint = 'Calcular vencimentos'
            Caption = 'Visualizar'
            Flat = True
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
            OnClick = sbCalcVenctoKitClick
          end
          object Label26: TLabel
            Left = 156
            Top = 8
            Width = 4
            Height = 13
            Caption = ','
          end
          object Label27: TLabel
            Left = 348
            Top = 32
            Width = 187
            Height = 13
            Caption = '(exceto s'#225'bados, domingos e feriados)'
          end
          object edNrParcelasKit: TEdit
            Left = 85
            Top = 6
            Width = 47
            Height = 21
            Align = alCustom
            ReadOnly = True
            TabOrder = 0
            Text = '1'
          end
          object edDiaVenctoKit: TEdit
            Left = 165
            Top = 28
            Width = 31
            Height = 21
            Align = alCustom
            TabOrder = 1
            OnKeyPress = edDiaVenctoKitKeyPress
          end
          object dtpVenctoSempreKit: TDateTimePicker
            Left = 266
            Top = 28
            Width = 77
            Height = 21
            Align = alCustom
            Date = 41065.414538032400000000
            Format = 'MM/yyyy'
            Time = 41065.414538032400000000
            DateMode = dmUpDown
            TabOrder = 2
          end
          object upParcelasKit: TUpDown
            Left = 132
            Top = 6
            Width = 16
            Height = 21
            Associate = edNrParcelasKit
            Min = 1
            Position = 1
            TabOrder = 3
          end
        end
        object Panel12: TPanel
          Left = 1
          Top = 57
          Width = 728
          Height = 215
          Align = alClient
          BevelOuter = bvNone
          TabOrder = 1
          object dbgParcelasKit: TDBGrid
            Left = 0
            Top = 0
            Width = 728
            Height = 215
            Align = alClient
            DataSource = dsParcelas
            TabOrder = 0
            TitleFont.Charset = DEFAULT_CHARSET
            TitleFont.Color = clWindowText
            TitleFont.Height = -11
            TitleFont.Name = 'Tahoma'
            TitleFont.Style = []
            Columns = <
              item
                Alignment = taLeftJustify
                Expanded = False
                FieldName = 'DS_TIPO_TITULO'
                ReadOnly = True
                Title.Caption = 'Tipo de t'#237'tulo'
                Width = 202
                Visible = True
              end
              item
                Alignment = taLeftJustify
                Expanded = False
                FieldName = 'NR_PARCELA'
                ReadOnly = True
                Title.Caption = 'Parcela'
                Width = 51
                Visible = True
              end
              item
                Alignment = taLeftJustify
                Expanded = False
                FieldName = 'DT_VENCTO'
                ReadOnly = True
                Title.Caption = 'Vencimento'
                Width = 90
                Visible = True
              end
              item
                Alignment = taLeftJustify
                Expanded = False
                FieldName = 'VL_BRUTO'
                ReadOnly = True
                Title.Caption = 'Valor bruto'
                Width = 140
                Visible = True
              end>
          end
        end
      end
    end
  end
  object ImageList2: TImageList
    Left = 680
    Top = 317
    Bitmap = {
      494C010105000900040010001000FFFFFFFFFF10FFFFFFFFFFFFFFFF424D3600
      0000000000003600000028000000400000003000000001002000000000000030
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
      0000000000000000FF000000FF000000FF000000FF000000FF00000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000008484000084
      8400000000000000000000000000000000000000000000000000000000000000
      0000000000000084840000000000000000000000000000000000000000000000
      FF000000FF000000FF000000FF000000FF000000FF000000FF000000FF000000
      FF00000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000007B7B7B0000000000000000000000
      00007B7B7B000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000008484000084
      8400000000000000000000000000000000000000000000000000000000000000
      00000000000000848400000000000000000000000000000000000000FF000000
      FF000000000000000000000000000000000000000000000000000000FF000000
      FF000000FF000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000008484000084
      8400000000000000000000000000000000000000000000000000000000000000
      000000000000008484000000000000000000000000000000FF000000FF000000
      FF000000FF000000000000000000000000000000000000000000000000000000
      FF000000FF000000FF0000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000008484000084
      8400000000000000000000000000000000000000000000000000000000000000
      000000000000008484000000000000000000000000000000FF00000000000000
      FF000000FF000000FF0000000000000000000000000000000000000000000000
      00000000FF000000FF0000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000008484000084
      8400008484000084840000848400008484000084840000848400008484000084
      8400008484000084840000000000000000000000FF000000FF00000000000000
      00000000FF000000FF000000FF00000000000000000000000000000000000000
      0000000000000000FF000000FF00000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000008484000084
      8400000000000000000000000000000000000000000000000000000000000000
      0000008484000084840000000000000000000000FF000000FF00000000000000
      0000000000000000FF000000FF000000FF000000000000000000000000000000
      0000000000000000FF000000FF00000000000000000000000000000000000000
      00000000000000000000000000000000000000000000000000007B7B7B000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000008484000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000084840000000000000000000000FF000000FF00000000000000
      000000000000000000000000FF000000FF000000FF0000000000000000000000
      0000000000000000FF000000FF00000000000000000000000000FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF000000000000000000FFFFFF00000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000008484000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000084840000000000000000000000FF000000FF00000000000000
      00000000000000000000000000000000FF000000FF000000FF00000000000000
      0000000000000000FF000000FF00000000000000000000000000FFFFFF000000
      00000000000000000000FFFFFF000000000000000000FFFFFF00000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000008484000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000084840000000000000000000000FF000000FF00000000000000
      0000000000000000000000000000000000000000FF000000FF000000FF000000
      0000000000000000FF000000FF00000000000000000000000000FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF000000000000000000FFFFFF00000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000008484000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000008484000000000000000000000000000000FF000000FF000000
      000000000000000000000000000000000000000000000000FF000000FF000000
      FF00000000000000FF0000000000000000000000000000000000FFFFFF000000
      0000000000000000000000000000FFFFFF00FFFFFF00FFFFFF00000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000008484000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000FF000000FF000000
      FF000000000000000000000000000000000000000000000000000000FF000000
      FF000000FF000000FF0000000000000000000000000000000000FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000008484000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000000000000000FF000000
      FF000000FF000000000000000000000000000000000000000000000000000000
      FF000000FF00000000000000000000000000000000007B0000007B0000007B00
      00007B0000007B0000007B0000007B0000007B0000007B0000007B0000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      FF000000FF000000FF000000FF000000FF000000FF000000FF000000FF000000
      FF0000000000000000000000000000000000000000007B0000007B0000007B00
      00007B0000007B0000007B0000007B0000007B0000007B0000007B0000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000FF000000FF000000FF000000FF000000FF00000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000424D3E000000000000003E000000
      2800000040000000300000000100010000000000800100000000000000000000
      000000000000000000000000FFFFFF0000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000FFFF000000000000E3FF000000000000
      83FF000000000000000F000000000000003F000000000000002F000000000000
      000F000000000000000F00000000000000010000000000000001000000000000
      0001000000000000000F000000000000000F000000000000002F000000000000
      803F000000000000E3FF000000000000FFFFFFFFFFFFF8F8FFFFC001F83FFAFA
      FFFF8031E00FF870FFFF8031CFC7F800FC7F803187E3FA10FD7F8001A3F3FA10
      FD7F800131F9F800E10F800138F98001EFEF8FF13C798013E10F8FF13E398013
      FD7F8FF13F198013FD7F8FF19F8B801FFC7F8FF18FC3801FFFFF8FF5C7E7801F
      FFFF8001E00F801FFFFFFFFFF83FFFFF00000000000000000000000000000000
      000000000000}
  end
  object qyRegistraSaida: TUMZQuery
    Connection = DM.db
    BeforeInsert = qyRegistraSaidaBeforeInert
    AfterInsert = qyRegistraSaidaAfterInsert
    BeforePost = qyRegistraSaidaBeforePost
    SQL.Strings = (
      'SELECT ce.* FROM comp_estoque ce WHERE 1=0')
    Params = <>
    Left = 464
    Top = 215
    object qyRegistraSaidacd_compra: TIntegerField
      FieldName = 'cd_compra'
    end
    object qyRegistraSaidacd_produto: TStringField
      FieldName = 'cd_produto'
      Required = True
      Size = 30
    end
    object qyRegistraSaidatp_entrada_saida: TSmallintField
      FieldName = 'tp_entrada_saida'
      Required = True
    end
    object qyRegistraSaidacd_pessoa: TIntegerField
      FieldName = 'cd_pessoa'
    end
    object qyRegistraSaidatp_pessoa: TSmallintField
      FieldName = 'tp_pessoa'
      Required = True
    end
    object qyRegistraSaidanr_quantidade: TIntegerField
      FieldName = 'nr_quantidade'
      Required = True
    end
    object qyRegistraSaidadt_compra: TDateTimeField
      FieldName = 'dt_compra'
    end
    object qyRegistraSaidadt_entrada: TDateTimeField
      FieldName = 'dt_entrada'
      DisplayFormat = 'dd/mm/yyyy hh:nn'
    end
    object qyRegistraSaidavl_compra: TFloatField
      FieldName = 'vl_compra'
      DisplayFormat = '###,###,##0.00'
      EditFormat = '0.00'
    end
    object qyRegistraSaidacd_usuario: TIntegerField
      FieldName = 'cd_usuario'
    end
    object qyRegistraSaidaNR_ANOSEMESTRE: TIntegerField
      FieldName = 'NR_ANOSEMESTRE'
      EditFormat = '0000/0'
    end
  end
  object dsRegistraSaida: TDataSource
    DataSet = qyRegistraSaida
    OnStateChange = dsRegistraSaidaStateChange
    Left = 496
    Top = 216
  end
  object Timer1: TTimer
    OnTimer = Timer1Timer
    Left = 712
    Top = 319
  end
  object qyRegistraSaidaKits: TUMZQuery
    Connection = DM.db
    BeforeInsert = qyRegistraSaidaBeforeInert
    SQL.Strings = (
      'SELECT * FROM comp_estoque WHERE 1=0')
    Params = <>
    Left = 464
    Top = 247
    object qyRegistraSaidaKitsCD_COMPRA: TIntegerField
      FieldName = 'CD_COMPRA'
      Required = True
    end
    object qyRegistraSaidaKitsCD_PRODUTO: TStringField
      FieldName = 'CD_PRODUTO'
      Required = True
      Size = 30
    end
    object qyRegistraSaidaKitsTP_ENTRADA_SAIDA: TSmallintField
      FieldName = 'TP_ENTRADA_SAIDA'
      Required = True
    end
    object qyRegistraSaidaKitsCD_PESSOA: TIntegerField
      FieldName = 'CD_PESSOA'
    end
    object qyRegistraSaidaKitsTP_PESSOA: TSmallintField
      FieldName = 'TP_PESSOA'
      Required = True
    end
    object qyRegistraSaidaKitsNR_QUANTIDADE: TIntegerField
      FieldName = 'NR_QUANTIDADE'
      Required = True
    end
    object qyRegistraSaidaKitsDT_COMPRA: TDateTimeField
      FieldName = 'DT_COMPRA'
    end
    object qyRegistraSaidaKitsDT_ENTRADA: TDateTimeField
      FieldName = 'DT_ENTRADA'
    end
    object qyRegistraSaidaKitsVL_COMPRA: TFloatField
      FieldName = 'VL_COMPRA'
    end
    object qyRegistraSaidaKitsCD_KIT: TIntegerField
      FieldName = 'CD_KIT'
    end
    object qyRegistraSaidaKitsCD_USUARIO: TIntegerField
      FieldName = 'CD_USUARIO'
    end
    object qyRegistraSaidaKitsNR_ANOSEMESTRE: TIntegerField
      FieldName = 'NR_ANOSEMESTRE'
      EditFormat = '0000/0'
    end
  end
  object cdsParcelas: TClientDataSet
    Active = True
    Aggregates = <>
    AggregatesActive = True
    FieldDefs = <
      item
        Name = 'CD_TIPO_TITULO'
        DataType = ftInteger
      end
      item
        Name = 'NR_PARCELA'
        DataType = ftInteger
      end
      item
        Name = 'DT_VENCTO'
        DataType = ftDate
      end
      item
        Name = 'NM_PRODUTO'
        DataType = ftString
        Size = 255
      end
      item
        Name = 'VL_BRUTO'
        DataType = ftCurrency
      end
      item
        Name = 'DS_TIPO_TITULO'
        DataType = ftString
        Size = 20
      end
      item
        Name = 'CD_PRODUTO'
        DataType = ftString
        Size = 255
      end>
    IndexDefs = <>
    IndexFieldNames = 'NR_PARCELA'
    Params = <>
    StoreDefs = True
    Left = 424
    Top = 216
    Data = {
      DC0000009619E0BD010000001800000007000000000003000000DC000E43445F
      5449504F5F544954554C4F04000100000000000A4E525F50415243454C410400
      0100000000000944545F56454E43544F04000600000000000A4E4D5F50524F44
      55544F020049000000010005574944544802000200FF0008564C5F425255544F
      080004000000010007535542545950450200490006004D6F6E6579000E44535F
      5449504F5F544954554C4F01004900000001000557494454480200020014000A
      43445F50524F4455544F020049000000010005574944544802000200FF000000}
    object cdsParcelasCD_TIPO_TITULO: TIntegerField
      FieldName = 'CD_TIPO_TITULO'
    end
    object cdsParcelasNR_PARCELA: TIntegerField
      FieldName = 'NR_PARCELA'
    end
    object cdsParcelasDT_VENCTO: TDateField
      Alignment = taRightJustify
      FieldName = 'DT_VENCTO'
    end
    object cdsParcelasNM_PRODUTO: TStringField
      FieldName = 'NM_PRODUTO'
      Size = 255
    end
    object cdsParcelasVL_BRUTO: TCurrencyField
      FieldName = 'VL_BRUTO'
      DisplayFormat = '###,###,##0.00'
    end
    object cdsParcelasDS_TIPO_TITULO: TStringField
      Alignment = taRightJustify
      FieldName = 'DS_TIPO_TITULO'
    end
    object cdsParcelasCD_PRODUTO: TStringField
      FieldName = 'CD_PRODUTO'
      Size = 255
    end
    object cdsParcelasSUM_VALOR_BRUTO: TAggregateField
      FieldName = 'SUM_VALOR_BRUTO'
      Active = True
      Expression = 'SUM(VL_BRUTO)'
    end
  end
  object dsParcelas: TDataSource
    DataSet = cdsParcelas
    Left = 424
    Top = 248
  end
  object dsProdutos: TDataSource
    DataSet = cdsProdutos
    OnDataChange = dsProdutosDataChange
    Left = 384
    Top = 248
  end
  object cdsProdutos: TClientDataSet
    Active = True
    Aggregates = <>
    AggregatesActive = True
    FieldDefs = <
      item
        Name = 'ds_produto'
        DataType = ftString
        Size = 255
      end
      item
        Name = 'nr_qtd_estoque'
        DataType = ftInteger
      end
      item
        Name = 'nr_preco_unitario'
        DataType = ftFloat
      end
      item
        Name = 'nr_quantidade'
        DataType = ftInteger
      end
      item
        Name = 'ds_codigo_barra'
        DataType = ftString
        Size = 255
      end
      item
        Name = 'cd_produto'
        DataType = ftString
        Size = 255
      end
      item
        Name = 'nr_parcelas'
        DataType = ftInteger
      end
      item
        Name = 'sn_imprimir_cupom'
        DataType = ftInteger
      end
      item
        Name = 'sn_gerar_titulo'
        DataType = ftInteger
      end
      item
        Name = 'sn_acumular_valores'
        DataType = ftInteger
      end
      item
        Name = 'cd_agendamento'
        DataType = ftInteger
      end
      item
        Name = 'vl_compra'
        DataType = ftFloat
      end
      item
        Name = 'vl_total'
        DataType = ftFloat
      end
      item
        Name = 'sn_parcelar'
        DataType = ftBoolean
      end
      item
        Name = 'nr_parcelar'
        DataType = ftInteger
      end>
    IndexDefs = <
      item
        Name = 'DEFAULT_ORDER'
      end
      item
        Name = 'CHANGEINDEX'
      end>
    IndexFieldNames = 'CD_PRODUTO'
    Params = <>
    StoreDefs = True
    OnCalcFields = cdsProdutosCalcFields
    Left = 384
    Top = 216
    Data = {
      4E0100009619E0BD01000000180000000C0000000000030000004E010A64735F
      70726F6475746F020049000000010005574944544802000200FF000E6E725F71
      74645F6573746F7175650400010000000000116E725F707265636F5F756E6974
      6172696F08000400000000000D6E725F7175616E746964616465040001000000
      00000F64735F636F6469676F5F62617272610200490000000100055749445448
      02000200FF000A63645F70726F6475746F020049000000010005574944544802
      000200FF000B6E725F70617263656C6173040001000000000011736E5F696D70
      72696D69725F6375706F6D04000100000000000F736E5F67657261725F746974
      756C6F040001000000000013736E5F6163756D756C61725F76616C6F72657304
      000100000000000E63645F6167656E64616D656E746F04000100000000000976
      6C5F636F6D70726108000400000000000000}
    object cdsProdutosds_produto: TStringField
      Tag = 1
      DisplayLabel = 'Nome do produto'
      FieldName = 'ds_produto'
      Size = 255
    end
    object cdsProdutosnr_qtd_estoque: TIntegerField
      Tag = 1
      DisplayLabel = 'Qtd. Atual Estoque'
      FieldName = 'nr_qtd_estoque'
    end
    object cdsProdutosnr_preco_unitario: TFloatField
      Tag = 1
      DisplayLabel = 'Pre'#231'o Unit'#225'rio'
      FieldName = 'nr_preco_unitario'
      DisplayFormat = '###,###,##0.00'
    end
    object cdsProdutosnr_quantidade: TIntegerField
      Tag = 1
      DisplayLabel = 'Quantidade'
      FieldName = 'nr_quantidade'
      OnSetText = cdsProdutosnr_quantidadeSetText
      DisplayFormat = '0'
      MaxValue = 999999
      MinValue = 1
    end
    object cdsProdutosds_codigo_barra: TStringField
      FieldName = 'ds_codigo_barra'
      Size = 255
    end
    object cdsProdutosvl_total: TFloatField
      Tag = 1
      DisplayLabel = 'Valor total'
      FieldKind = fkInternalCalc
      FieldName = 'vl_total'
      DisplayFormat = '###,###,##0.00'
    end
    object cdsProdutoscd_produto: TStringField
      FieldName = 'cd_produto'
      Size = 255
    end
    object cdsProdutosnr_parcelas: TIntegerField
      FieldName = 'nr_parcelas'
    end
    object cdsProdutossn_imprimir_cupom: TIntegerField
      FieldName = 'sn_imprimir_cupom'
    end
    object cdsProdutossn_gerar_titulo: TIntegerField
      FieldName = 'sn_gerar_titulo'
    end
    object cdsProdutossn_acumular_valores: TIntegerField
      FieldName = 'sn_acumular_valores'
    end
    object cdsProdutossn_parcelar: TBooleanField
      FieldKind = fkInternalCalc
      FieldName = 'sn_parcelar'
    end
    object cdsProdutosnr_parcelar: TIntegerField
      FieldKind = fkInternalCalc
      FieldName = 'nr_parcelar'
    end
    object cdsProdutoscd_agendamento: TIntegerField
      FieldName = 'cd_agendamento'
    end
    object cdsProdutosvl_compra: TFloatField
      Tag = 1
      DisplayLabel = 'Valor compra'
      FieldName = 'vl_compra'
      DisplayFormat = '###,###,##0.00'
    end
    object cdsProdutosvl_total_compra: TAggregateField
      FieldName = 'vl_total_compra'
      Active = True
      currency = True
      DisplayFormat = '###,###,##0.00'
      Expression = 'SUM(vl_total)'
    end
    object cdsProdutosmin_parcelas: TAggregateField
      FieldName = 'min_parcelas'
      Active = True
      Expression = 'MIN(nr_parcelas)'
    end
    object cdsProdutosmin_parcelar: TAggregateField
      FieldName = 'min_parcelar'
      Active = True
      Expression = 'MIN(nr_parcelar)'
    end
    object cdsProdutosmax_imprimir: TAggregateField
      FieldName = 'max_imprimir'
      Active = True
      Expression = 'MAX(sn_imprimir_cupom)'
    end
  end
end
