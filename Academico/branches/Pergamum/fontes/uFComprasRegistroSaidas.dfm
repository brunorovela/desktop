object frmComprasRegistroSaidas: TfrmComprasRegistroSaidas
  Left = 0
  Top = 0
  BorderStyle = bsDialog
  Caption = 'Compras - Sa'#237'da de Produtos e Kits'
  ClientHeight = 541
  ClientWidth = 599
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
    Width = 599
    Height = 541
    ActivePage = tbProdutos
    Align = alClient
    TabOrder = 0
    OnChange = PageControl1Change
    OnChanging = PageControl1Changing
    object tbProdutos: TTabSheet
      Caption = 'Produtos'
      object Panel2: TPanel
        Left = 0
        Top = 247
        Width = 591
        Height = 100
        Align = alTop
        TabOrder = 4
        object Label1: TLabel
          Left = 12
          Top = 6
          Width = 87
          Height = 13
          Caption = 'Nome do Produto:'
        end
        object Label3: TLabel
          Left = 12
          Top = 53
          Width = 71
          Height = 13
          Caption = 'Pre'#231'o Unit'#225'rio:'
        end
        object Label4: TLabel
          Left = 139
          Top = 53
          Width = 60
          Height = 13
          Caption = 'Quantidade:'
        end
        object Label6: TLabel
          Left = 275
          Top = 53
          Width = 55
          Height = 13
          Caption = 'Valor Total:'
        end
        object Label7: TLabel
          Left = 412
          Top = 53
          Width = 83
          Height = 13
          Caption = 'Data da Entrada:'
        end
        object Label5: TLabel
          Left = 412
          Top = 6
          Width = 111
          Height = 13
          Caption = 'Qtd. Atual do Estoque:'
        end
        object Label11: TLabel
          Left = 275
          Top = 6
          Width = 99
          Height = 13
          Caption = 'Ano/Sem da retirada'
        end
        object edNomeProduto: TEdit
          Left = 12
          Top = 25
          Width = 243
          Height = 21
          ReadOnly = True
          TabOrder = 0
        end
        object edPrecoUnitario: TUMEditMonetario
          Left = 12
          Top = 72
          Width = 121
          Height = 21
          Enabled = False
          TabOrder = 3
          Text = '0,00'
          Mascara = '###,###,##0.00'
          CasasDecimais = 2
          EnterProximoCampo = True
        end
        object edQuantidade: TDBEdit
          Left = 139
          Top = 72
          Width = 131
          Height = 21
          DataField = 'nr_quantidade'
          DataSource = dsRegistraSaida
          TabOrder = 4
          OnChange = edQuantidadeChange
          OnExit = edQuantidadeExit
        end
        object edValorTotal: TUMEditMonetario
          Left = 275
          Top = 72
          Width = 131
          Height = 21
          Enabled = False
          TabOrder = 5
          Text = '0,00'
          Mascara = '###,###,##0.00'
          CasasDecimais = 2
          EnterProximoCampo = True
        end
        object DBEdit5: TDBEdit
          Left = 412
          Top = 72
          Width = 174
          Height = 21
          DataField = 'dt_entrada'
          DataSource = dsRegistraSaida
          Enabled = False
          TabOrder = 6
        end
        object edQtdAtualEstoque: TEdit
          Left = 412
          Top = 25
          Width = 174
          Height = 21
          Enabled = False
          TabOrder = 2
        end
        object udDAnoSem: TUpDown
          Left = 372
          Top = 25
          Width = 16
          Height = 22
          Min = -100
          TabOrder = 7
          OnClick = udDAnoSemClick
        end
        object DbAnoSem: TDBEdit
          Left = 275
          Top = 25
          Width = 91
          Height = 21
          DataField = 'NR_ANOSEMESTRE'
          DataSource = dsRegistraSaida
          ReadOnly = True
          TabOrder = 1
        end
      end
      object Panel1: TPanel
        Left = 0
        Top = 0
        Width = 591
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
        TabOrder = 6
      end
      object toolPessoa: TToolBar
        Left = 0
        Top = 490
        Width = 591
        Height = 23
        Align = alBottom
        ButtonWidth = 84
        Caption = 'toolPessoa'
        EdgeBorders = [ebTop, ebBottom]
        Images = ImageList2
        List = True
        ShowCaptions = True
        TabOrder = 7
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
        Width = 591
        Height = 41
        Align = alTop
        TabOrder = 0
        object rgTipoEntrada: TRadioGroup
          Left = 12
          Top = 3
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
      object pnCod: TPanel
        Left = 0
        Top = 133
        Width = 591
        Height = 57
        Align = alTop
        TabOrder = 2
        object Label16: TLabel
          Left = 12
          Top = 6
          Width = 143
          Height = 13
          Caption = 'Informe o C'#243'digo do Produto:'
        end
        object SpeedButton5: TSpeedButton
          Left = 299
          Top = 24
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
          Top = 25
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
        Top = 190
        Width = 591
        Height = 57
        Align = alTop
        TabOrder = 3
        Visible = False
        object Label17: TLabel
          Left = 12
          Top = 6
          Width = 192
          Height = 13
          Align = alCustom
          Caption = 'Informe o C'#243'digo de barras do Produto:'
        end
        object SpeedButton8: TSpeedButton
          Left = 299
          Top = 24
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
          Top = 25
          Width = 281
          Height = 21
          MaxLength = 30
          TabOrder = 0
          OnExit = edCodBarrasExit
          OnKeyPress = edCodBarrasKeyPress
        end
      end
      object Panel6: TPanel
        Left = 0
        Top = 67
        Width = 591
        Height = 66
        Align = alTop
        TabOrder = 1
        object Label9: TLabel
          Left = 12
          Top = 6
          Width = 88
          Height = 13
          Caption = 'Informe a Pessoa:'
        end
        object SpeedButton1: TSpeedButton
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
          OnClick = SpeedButton1Click
        end
        object msgSemPermPro: TLabel
          Left = 12
          Top = 46
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
          Top = 20
          Width = 81
          Height = 21
          DataField = 'cd_pessoa'
          DataSource = dsRegistraSaida
          TabOrder = 0
          OnExit = DBEdit2Exit
        end
        object edNomeComprador: TEdit
          Left = 99
          Top = 20
          Width = 442
          Height = 21
          Enabled = False
          TabOrder = 1
        end
      end
      object pnParcelas: TPanel
        Left = 0
        Top = 347
        Width = 591
        Height = 143
        Align = alClient
        TabOrder = 5
        Visible = False
        object Panel10: TPanel
          Left = 1
          Top = 1
          Width = 589
          Height = 56
          Align = alTop
          BevelOuter = bvNone
          TabOrder = 0
          object Label20: TLabel
            Left = 11
            Top = 8
            Width = 68
            Height = 13
            Align = alCustom
            Caption = 'Nro. parcelas:'
          end
          object Label21: TLabel
            Left = 11
            Top = 32
            Width = 147
            Height = 13
            Align = alCustom
            Caption = 'com vencimento sempre no dia'
          end
          object lblVenctoSempre: TLabel
            Left = 206
            Top = 32
            Width = 57
            Height = 13
            Align = alCustom
            Caption = ', a partir de'
          end
          object sbCalcVencto: TSpeedButton
            Left = 489
            Top = 5
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
            Left = 154
            Top = 8
            Width = 4
            Height = 13
            Caption = ','
          end
          object lblVenctoOpcs: TLabel
            Left = 352
            Top = 32
            Width = 187
            Height = 13
            Caption = '(exceto s'#225'bados, domingos e feriados)'
          end
          object edNrParcelas: TEdit
            Left = 85
            Top = 6
            Width = 47
            Height = 21
            Align = alCustom
            ReadOnly = True
            TabOrder = 0
            Text = '1'
          end
          object edDiaVencto: TEdit
            Left = 166
            Top = 27
            Width = 31
            Height = 21
            Align = alCustom
            TabOrder = 1
            OnKeyPress = edDiaVenctoKeyPress
          end
          object dtpVenctoSempre: TDateTimePicker
            Left = 269
            Top = 27
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
            Left = 132
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
          Top = 57
          Width = 589
          Height = 85
          Align = alClient
          BevelOuter = bvNone
          TabOrder = 1
          object dbgParcelas: TDBGrid
            Left = 0
            Top = 0
            Width = 589
            Height = 85
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
                Width = 207
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
    object tbKits: TTabSheet
      Caption = 'Kits'
      ImageIndex = 1
      object Panel3: TPanel
        Left = 0
        Top = 247
        Width = 591
        Height = 100
        Align = alTop
        TabOrder = 4
        object Label10: TLabel
          Left = 419
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
        object Label19: TLabel
          Left = 276
          Top = 6
          Width = 99
          Height = 13
          Caption = 'Ano/Sem da retirada'
        end
        object edQuantkit: TEdit
          Left = 419
          Top = 25
          Width = 132
          Height = 21
          Enabled = False
          TabOrder = 2
        end
        object edNomeKit: TEdit
          Left = 12
          Top = 25
          Width = 243
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
          TabOrder = 3
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
          TabOrder = 5
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
          TabOrder = 4
          OnChange = edQuantidadeKitChange
          OnExit = edQuantidadeKitExit
        end
        object txtAnoSemestre: TMaskEdit
          Left = 276
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
          TabOrder = 1
        end
        object UpDown1: TUpDown
          Left = 373
          Top = 25
          Width = 16
          Height = 22
          Min = -100
          TabOrder = 6
          OnClick = UpDown1Click
        end
      end
      object Panel4: TPanel
        Left = 0
        Top = 0
        Width = 591
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
        Top = 490
        Width = 591
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
        Width = 591
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
        Width = 591
        Height = 57
        Align = alTop
        TabOrder = 2
        object Label8: TLabel
          Left = 12
          Top = 6
          Width = 117
          Height = 13
          Caption = 'Informe o C'#243'digo do Kit:'
        end
        object SpeedButton4: TSpeedButton
          Left = 299
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
        object edCodkIT: TEdit
          Left = 12
          Top = 25
          Width = 281
          Height = 21
          TabOrder = 0
          OnChange = edCdPessoaChange
          OnExit = edCodkITExit
          OnKeyPress = edCodkITKeyPress
        end
      end
      object pnCodBarraKit: TPanel
        Left = 0
        Top = 190
        Width = 591
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
        Width = 591
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
        Width = 591
        Height = 143
        Align = alClient
        TabOrder = 5
        Visible = False
        object Panel11: TPanel
          Left = 1
          Top = 1
          Width = 589
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
          Width = 589
          Height = 85
          Align = alClient
          BevelOuter = bvNone
          TabOrder = 1
          object dbgParcelasKit: TDBGrid
            Left = 0
            Top = 0
            Width = 589
            Height = 85
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
    AfterPost = qyRegistraSaidaAfterPost
    SQL.Strings = (
      'SELECT * FROM comp_estoque WHERE 1=0')
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
    Left = 648
    Top = 319
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
    FieldDefs = <
      item
        Name = 'CD_TIPO_TITULO'
        DataType = ftInteger
      end
      item
        Name = 'DS_TIPO_TITULO'
        DataType = ftString
        Size = 20
      end
      item
        Name = 'NR_PARCELA'
        DataType = ftInteger
      end
      item
        Name = 'NR_CREDITOS'
        DataType = ftFloat
      end
      item
        Name = 'DT_VENCTO'
        DataType = ftDate
      end
      item
        Name = 'VL_BRUTO'
        DataType = ftCurrency
      end
      item
        Name = 'VL_DESCONTO'
        DataType = ftCurrency
      end
      item
        Name = 'VL_DESC_EXTRA'
        DataType = ftCurrency
      end
      item
        Name = 'VL_EXTRA'
        DataType = ftCurrency
      end
      item
        Name = 'CD_RESPONSAVEL'
        DataType = ftInteger
      end
      item
        Name = 'NM_RESPONSAVEL'
        DataType = ftString
        Size = 64
      end
      item
        Name = 'SN_DIVISIVEL'
        DataType = ftBoolean
      end
      item
        Name = 'SN_RECIBO_IMP'
        DataType = ftBoolean
      end
      item
        Name = 'SN_GERAR'
        DataType = ftBoolean
      end
      item
        Name = 'SN_PERDOAR'
        DataType = ftBoolean
      end
      item
        Name = 'CD_CONTA'
        DataType = ftInteger
      end
      item
        Name = 'PtrItemPlano'
        DataType = ftInteger
      end
      item
        Name = 'CD_ACAO_MOVIMENTO'
        DataType = ftLargeint
      end
      item
        Name = 'CD_DESC_CONDICIONAL'
        DataType = ftLargeint
      end
      item
        Name = 'SN_DIVIDIDO'
        DataType = ftBoolean
      end
      item
        Name = 'VL_CREDITO'
        DataType = ftCurrency
      end
      item
        Name = 'IDX_PARCELA'
        DataType = ftInteger
      end
      item
        Name = 'VL_PERCENTUAL_DIVISAO'
        DataType = ftCurrency
      end>
    IndexDefs = <>
    IndexFieldNames = 'NR_PARCELA'
    Params = <>
    StoreDefs = True
    Left = 424
    Top = 216
    Data = {
      8F0200009619E0BD0100000018000000170000000000030000008F020E43445F
      5449504F5F544954554C4F04000100000000000E44535F5449504F5F54495455
      4C4F01004900000001000557494454480200020014000A4E525F50415243454C
      4104000100000000000B4E525F4352454449544F530800040000000000094454
      5F56454E43544F040006000000000008564C5F425255544F0800040000000100
      07535542545950450200490006004D6F6E6579000B564C5F444553434F4E544F
      080004000000010007535542545950450200490006004D6F6E6579000D564C5F
      444553435F455854524108000400000001000753554254595045020049000600
      4D6F6E65790008564C5F45585452410800040000000100075355425459504502
      00490006004D6F6E6579000E43445F524553504F4E534156454C040001000000
      00000E4E4D5F524553504F4E534156454C010049000000010005574944544802
      00020040000C534E5F44495649534956454C02000300000000000D534E5F5245
      4349424F5F494D50020003000000000008534E5F474552415202000300000000
      000A534E5F504552444F415202000300000000000843445F434F4E5441040001
      00000000000C5074724974656D506C616E6F04000100000000001143445F4143
      414F5F4D4F56494D454E544F08000100000000001343445F444553435F434F4E
      444943494F4E414C08000100000000000B534E5F444956494449444F02000300
      000000000A564C5F4352454449544F0800040000000100075355425459504502
      00490006004D6F6E6579000B4944585F50415243454C41040001000000000015
      564C5F50455243454E5455414C5F4449564953414F0800040000000100075355
      42545950450200490006004D6F6E6579000000}
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
    object cdsParcelasVL_BRUTO: TCurrencyField
      FieldName = 'VL_BRUTO'
      DisplayFormat = '###,###,##0.00'
    end
    object cdsParcelasDS_TIPO_TITULO: TStringField
      Alignment = taRightJustify
      FieldName = 'DS_TIPO_TITULO'
    end
  end
  object dsParcelas: TDataSource
    DataSet = cdsParcelas
    Left = 424
    Top = 248
  end
end
