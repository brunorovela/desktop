object frmLancamentosManuais: TfrmLancamentosManuais
  Left = 0
  Top = 0
  Caption = 'Lan'#231'amentos cont'#225'beis manuais'
  ClientHeight = 621
  ClientWidth = 827
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  KeyPreview = True
  OldCreateOrder = False
  Position = poDesigned
  OnClose = FormClose
  OnCreate = FormCreate
  OnKeyDown = FormKeyDown
  OnKeyPress = FormKeyPress
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object paCabecalho: TPanel
    Left = 0
    Top = 0
    Width = 827
    Height = 26
    Align = alTop
    BevelOuter = bvLowered
    Caption = 'LAN'#199'AMENTOS CONT'#193'BEIS MANUAIS'
    Color = clBlue
    Font.Charset = ANSI_CHARSET
    Font.Color = clWhite
    Font.Height = -17
    Font.Name = 'Arial'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 0
  end
  object pnFundo: TPanel
    Left = 0
    Top = 105
    Width = 827
    Height = 516
    Align = alClient
    BevelOuter = bvNone
    TabOrder = 1
    object pnTopo: TPanel
      Left = 0
      Top = 0
      Width = 827
      Height = 491
      Align = alClient
      BevelOuter = bvNone
      TabOrder = 0
      object tcLancamentos: TTabControl
        Left = 0
        Top = 0
        Width = 827
        Height = 491
        Align = alClient
        TabOrder = 0
        Tabs.Strings = (
          '1'
          '+')
        TabIndex = 0
        TabStop = False
        OnChange = tcLancamentosChange
        OnChanging = tcLancamentosChanging
        object sbFecha1: TSpeedButton
          Tag = 1
          Left = 798
          Top = 27
          Width = 22
          Height = 20
          Glyph.Data = {
            36050000424D3605000000000000360400002800000010000000100000000100
            08000000000000010000120B0000120B000000010000280000000707B500F0F0
            FA005C5CCB003B3BC5002828C5008686D8004C4CC600FFFFFF001717C9003838
            EE002B2BE0009999DE007272D8000E0EBC005353C7001A1ACD006969CE00A8A8
            E5004242C5008F8FDB003131E6001F1FD2007A7AD5006C6CD9001111C3003232
            C5005353CC002121BD000909BA004040F7004C4CCD008181E8009898E6002222
            D6008A8AE6003D3DF4003535EB002020C4006B6BDE0000000000000000000000
            0000000000000000000000000000000000000000000000000000000000000000
            0000000000000000000000000000000000000000000000000000000000000000
            0000000000000000000000000000000000000000000000000000000000000000
            0000000000000000000000000000000000000000000000000000000000000000
            0000000000000000000000000000000000000000000000000000000000000000
            0000000000000000000000000000000000000000000000000000000000000000
            0000000000000000000000000000000000000000000000000000000000000000
            0000000000000000000000000000000000000000000000000000000000000000
            0000000000000000000000000000000000000000000000000000000000000000
            0000000000000000000000000000000000000000000000000000000000000000
            0000000000000000000000000000000000000000000000000000000000000000
            0000000000000000000000000000000000000000000000000000000000000000
            0000000000000000000000000000000000000000000000000000000000000000
            0000000000000000000000000000000000000000000000000000000000000000
            0000000000000000000000000000000000000000000000000000000000000000
            0000000000000000000000000000000000000000000000000000000000000000
            0000000000000000000000000000000000000000000000000000000000000000
            0000000000000000000000000000000000000000000000000000000000000000
            0000000000000000000000000000000000000000000000000000000000000000
            0000000000000000000000000000000000000000000000000000000000000000
            0000000000000000000000000000000000000000000000000000000000000000
            0000000000000000000000000000000000000000000000000000000000000000
            0000000000000000000000000000000000000000000000000000000000000000
            0000000000000000000000000000000000000000000000000000000000000000
            0000000000000000000000000000000000000000000000000000000000000000
            0000000000000000000000000000000000000000000000000000000000000000
            0000000000000000000000000000000000000000000000000000070716020107
            070707070701172207070710001C120107070707011A091D1F071300001C1C12
            010707011E1424232322161A1C1C1C0D1201011E210A1424241701101A1C1C0D
            18121215210A0A0A1E010701101A0D0D0D18080F1521211E0107070701101A0D
            0D1818080F151E01070707070701101E0D0D1818081201070707070707010619
            250D0D0D1812010707070707010619191919042525250601070707010E031919
            19191719191919060107010E0303030319060C0C191919190601051A12030303
            0601010C0C191919191011201A12120E010707010C0C191919050711201A0E01
            07070707010C0C031607070711050107070707070701050B0707}
          OnClick = removeAba
        end
        object lbDebito1: TLabel
          Tag = 1
          Left = 95
          Top = 61
          Width = 41
          Height = 16
          Caption = 'D'#233'bito:'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
        end
        object lbCredito1: TLabel
          Tag = 1
          Left = 90
          Top = 90
          Width = 46
          Height = 16
          Caption = 'Cr'#233'dito:'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
        end
        object lbValor1: TLabel
          Tag = 1
          Left = 101
          Top = 123
          Width = 35
          Height = 16
          Caption = 'Valor:'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
        end
        object sbBuscaDebito1: TSpeedButton
          Tag = 1
          Left = 615
          Top = 58
          Width = 22
          Height = 24
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
          OnClick = buscaContasDebito
        end
        object sbBuscaCredito1: TSpeedButton
          Tag = 1
          Left = 615
          Top = 90
          Width = 22
          Height = 24
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
          OnClick = buscaContasCredito
        end
        object lbHistorico1: TLabel
          Tag = 1
          Left = 82
          Top = 153
          Width = 54
          Height = 16
          Caption = 'Hist'#243'rico:'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
        end
        object lbComplemento1: TLabel
          Tag = 1
          Left = 52
          Top = 180
          Width = 84
          Height = 16
          Caption = 'Complemento:'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
        end
        object sbBuscaHistoricos1: TSpeedButton
          Tag = 1
          Left = 614
          Top = 150
          Width = 22
          Height = 24
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
          OnClick = buscaHistoricos
        end
        object edDescDebito1: TEdit
          Tag = 1
          Left = 234
          Top = 60
          Width = 374
          Height = 24
          TabStop = False
          Enabled = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
          TabOrder = 2
        end
        object cbCaixaBancoDebito1: TUMComboBox
          Tag = 1
          Left = 234
          Top = 60
          Width = 375
          Height = 24
          Style = csDropDownList
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = 'Tahoma'
          Font.Style = []
          ItemHeight = 16
          ParentFont = False
          TabOrder = 1
          Visible = False
          OnChange = cbCaixaBancoDebito1Change
          OnKeyDown = cbCaixaBancoDebito1KeyDown
          TamanhoMaximo = 0
        end
        object edCodigoDebito1: TEdit
          Tag = 1
          Left = 142
          Top = 60
          Width = 86
          Height = 24
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
          TabOrder = 0
          OnChange = edCodigoDebito1Change
          OnEnter = edCodigoDebito1Enter
          OnExit = edCodigoDebito1Exit
          OnKeyDown = edCodigoDebito1KeyDown
          OnKeyPress = edCodigoDebito1KeyPress
        end
        object edCodigoCredito1: TEdit
          Tag = 1
          Left = 142
          Top = 90
          Width = 86
          Height = 24
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
          TabOrder = 3
          OnChange = edCodigoCredito1Change
          OnEnter = edCodigoCredito1Enter
          OnExit = edCodigoCredito1Exit
          OnKeyDown = edCodigoCredito1KeyDown
          OnKeyPress = edCodigoCredito1KeyPress
        end
        object edDescCredito1: TEdit
          Tag = 1
          Left = 234
          Top = 90
          Width = 375
          Height = 24
          TabStop = False
          Enabled = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
          TabOrder = 5
        end
        object pnCompromisso1: TPanel
          Tag = 1
          Left = 4
          Top = 363
          Width = 819
          Height = 124
          Align = alBottom
          BevelOuter = bvNone
          TabOrder = 11
          Visible = False
          object lbTipoDocumento1: TLabel
            Tag = 1
            Left = 263
            Top = 23
            Width = 84
            Height = 16
            Caption = 'Tipo de T'#237'tulo:'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -13
            Font.Name = 'Tahoma'
            Font.Style = []
            ParentFont = False
          end
          object lbNumeroDocumento1: TLabel
            Tag = 1
            Left = 27
            Top = 23
            Width = 105
            Height = 16
            Caption = 'N'#186' do Documento:'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -13
            Font.Name = 'Tahoma'
            Font.Style = []
            ParentFont = False
          end
          object lbFornecedor1: TLabel
            Tag = 1
            Left = 62
            Top = 54
            Width = 70
            Height = 16
            Caption = 'Fornecedor:'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -13
            Font.Name = 'Tahoma'
            Font.Style = []
            ParentFont = False
          end
          object lbDataVencimento1: TLabel
            Tag = 1
            Left = 12
            Top = 84
            Width = 120
            Height = 16
            Caption = 'Data do Vencimento:'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -13
            Font.Name = 'Tahoma'
            Font.Style = []
            ParentFont = False
          end
          object lbNumeroParcelas1: TLabel
            Tag = 1
            Left = 232
            Top = 84
            Width = 89
            Height = 16
            Caption = 'N'#186' de Parcelas:'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -13
            Font.Name = 'Tahoma'
            Font.Style = []
            ParentFont = False
          end
          object sbBuscaFornecedores1: TSpeedButton
            Tag = 1
            Left = 611
            Top = 51
            Width = 22
            Height = 24
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
            OnClick = sbBuscaFornecedores1Click
          end
          object Label7: TLabel
            Left = 138
            Top = -2
            Width = 239
            Height = 16
            Caption = 'Dados para gera'#231#227'o de compromisso'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -13
            Font.Name = 'Tahoma'
            Font.Style = [fsBold]
            ParentFont = False
          end
          object edNumeroDoc1: TEdit
            Tag = 1
            Left = 138
            Top = 20
            Width = 119
            Height = 24
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -13
            Font.Name = 'Tahoma'
            Font.Style = []
            ParentFont = False
            TabOrder = 0
            OnChange = edNumeroDoc1Change
            OnKeyDown = edNumeroDoc1KeyDown
            OnKeyPress = edNumeroDoc1KeyPress
          end
          object edFornecedor1: TEdit
            Tag = 1
            Left = 138
            Top = 51
            Width = 467
            Height = 24
            TabStop = False
            Enabled = False
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -13
            Font.Name = 'Tahoma'
            Font.Style = []
            ParentFont = False
            TabOrder = 2
            OnChange = edFornecedor1Change
            OnKeyPress = edFornecedor1KeyPress
          end
          object edDataVencimento1: TMaskEdit
            Tag = 1
            Left = 138
            Top = 81
            Width = 88
            Height = 24
            EditMask = '!00/00/0000;1;_'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -13
            Font.Name = 'Tahoma'
            Font.Style = []
            MaxLength = 10
            ParentFont = False
            TabOrder = 3
            Text = '  /  /    '
            OnChange = edDataVencimento1Change
            OnKeyDown = edDataVencimento1KeyDown
            OnKeyPress = edDataVencimento1KeyPress
          end
          object edNumeroParcelas1: TEdit
            Tag = 1
            Left = 327
            Top = 81
            Width = 278
            Height = 24
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -13
            Font.Name = 'Tahoma'
            Font.Style = []
            ParentFont = False
            TabOrder = 4
            OnChange = edNumeroParcelas1Change
            OnKeyDown = edNumeroParcelas1KeyDown
            OnKeyPress = edNumeroParcelas1KeyPress
          end
          object cbTipoTitulo1: TUMComboBox
            Tag = 1
            Left = 354
            Top = 21
            Width = 251
            Height = 24
            Style = csDropDownList
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -13
            Font.Name = 'Tahoma'
            Font.Style = []
            ItemHeight = 16
            ParentFont = False
            TabOrder = 1
            OnChange = cbTipoTitulo1Change
            OnKeyDown = cbTipoTitulo1KeyDown
            OnKeyPress = cbTipoTitulo1KeyPress
            TamanhoMaximo = 0
          end
        end
        object edComplemento1: TEdit
          Tag = 1
          Left = 142
          Top = 180
          Width = 466
          Height = 24
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
          TabOrder = 8
          OnChange = edComplemento1Change
          OnKeyDown = edComplemento1KeyDown
          OnKeyPress = edComplemento1KeyPress
        end
        object edDescHist1: TEdit
          Tag = 1
          Left = 234
          Top = 150
          Width = 374
          Height = 24
          TabStop = False
          Enabled = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
          TabOrder = 9
        end
        object edCodigoHist1: TEdit
          Tag = 1
          Left = 142
          Top = 150
          Width = 86
          Height = 24
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
          TabOrder = 7
          OnChange = edCodigoHist1Change
          OnExit = edCodigoHist1Exit
          OnKeyDown = edCodigoHist1KeyDown
          OnKeyPress = edCodigoHist1KeyPress
        end
        object pnRateios1: TPanel
          Tag = 1
          Left = 4
          Top = 206
          Width = 819
          Height = 157
          Align = alBottom
          BevelOuter = bvNone
          TabOrder = 10
          Visible = False
          object lbCentroCusto1: TLabel
            Tag = 1
            Left = 35
            Top = 4
            Width = 97
            Height = 16
            Caption = 'Centro de Custo:'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -13
            Font.Name = 'Tahoma'
            Font.Style = []
            ParentFont = False
            Visible = False
          end
          object lbRateios1: TLabel
            Tag = 1
            Left = 610
            Top = 4
            Width = 63
            Height = 16
            Caption = 'Sem rateio'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -13
            Font.Name = 'Tahoma'
            Font.Style = []
            ParentFont = False
            Visible = False
          end
          object btInserir1: TSpeedButton
            Tag = 1
            Left = 610
            Top = 34
            Width = 75
            Height = 25
            Caption = '&Inserir'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -13
            Font.Name = 'Tahoma'
            Font.Style = []
            Glyph.Data = {
              76010000424D7601000000000000760000002800000020000000100000000100
              04000000000000010000130B0000130B00001000000000000000000000000000
              800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
              FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333333333333
              33333333FF33333333FF333993333333300033377F3333333777333993333333
              300033F77FFF3333377739999993333333333777777F3333333F399999933333
              33003777777333333377333993333333330033377F3333333377333993333333
              3333333773333333333F333333333333330033333333F33333773333333C3333
              330033333337FF3333773333333CC333333333FFFFF77FFF3FF33CCCCCCCCCC3
              993337777777777F77F33CCCCCCCCCC3993337777777777377333333333CC333
              333333333337733333FF3333333C333330003333333733333777333333333333
              3000333333333333377733333333333333333333333333333333}
            NumGlyphs = 2
            ParentFont = False
            Visible = False
            OnClick = btInserir1Click
          end
          object btAlterar1: TSpeedButton
            Tag = 1
            Left = 610
            Top = 65
            Width = 75
            Height = 25
            Caption = '&Alterar'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -13
            Font.Name = 'Tahoma'
            Font.Style = []
            Glyph.Data = {
              76010000424D7601000000000000760000002800000020000000100000000100
              04000000000000010000120B0000120B00001000000000000000000000000000
              800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
              FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333333000000
              000033333377777777773333330FFFFFFFF03FF3FF7FF33F3FF700300000FF0F
              00F077F777773F737737E00BFBFB0FFFFFF07773333F7F3333F7E0BFBF000FFF
              F0F077F3337773F3F737E0FBFBFBF0F00FF077F3333FF7F77F37E0BFBF00000B
              0FF077F3337777737337E0FBFBFBFBF0FFF077F33FFFFFF73337E0BF0000000F
              FFF077FF777777733FF7000BFB00B0FF00F07773FF77373377373330000B0FFF
              FFF03337777373333FF7333330B0FFFF00003333373733FF777733330B0FF00F
              0FF03333737F37737F373330B00FFFFF0F033337F77F33337F733309030FFFFF
              00333377737FFFFF773333303300000003333337337777777333}
            NumGlyphs = 2
            ParentFont = False
            Visible = False
            OnClick = btAlterar1Click
          end
          object btExcluir1: TSpeedButton
            Tag = 1
            Left = 610
            Top = 96
            Width = 75
            Height = 25
            Caption = '&Excluir'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -13
            Font.Name = 'Tahoma'
            Font.Style = []
            Glyph.Data = {
              76010000424D7601000000000000760000002800000020000000100000000100
              04000000000000010000130B0000130B00001000000000000000000000000000
              800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
              FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333333333333
              333333333333333333FF33333333333330003333333333333777333333333333
              300033FFFFFF3333377739999993333333333777777F3333333F399999933333
              3300377777733333337733333333333333003333333333333377333333333333
              3333333333333333333F333333333333330033333F33333333773333C3333333
              330033337F3333333377333CC3333333333333F77FFFFFFF3FF33CCCCCCCCCC3
              993337777777777F77F33CCCCCCCCCC399333777777777737733333CC3333333
              333333377F33333333FF3333C333333330003333733333333777333333333333
              3000333333333333377733333333333333333333333333333333}
            NumGlyphs = 2
            ParentFont = False
            Visible = False
            OnClick = btExcluir1Click
          end
          object stRateios1: TStringGrid
            Tag = 1
            Left = 138
            Top = 34
            Width = 466
            Height = 100
            TabStop = False
            ColCount = 1
            FixedCols = 0
            RowCount = 2
            Options = [goFixedVertLine, goFixedHorzLine, goVertLine, goHorzLine, goRangeSelect, goRowSelect]
            TabOrder = 0
            ColWidths = (
              66)
          end
          object cbCriterios1: TUMComboBox
            Tag = 1
            Left = 138
            Top = 4
            Width = 466
            Height = 24
            Style = csDropDownList
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -13
            Font.Name = 'Tahoma'
            Font.Style = []
            ItemHeight = 16
            ParentFont = False
            TabOrder = 1
            Visible = False
            OnChange = cbCriterios1Change
            OnKeyDown = cbCriterios1KeyDown
            OnKeyPress = cbCriterios1KeyPress
            TamanhoMaximo = 0
          end
        end
        object edValor1: TUMEditMonetario
          Tag = 1
          Left = 142
          Top = 120
          Width = 86
          Height = 24
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
          TabOrder = 6
          Text = '0,00'
          OnChange = edValor1Change
          OnExit = edValor1Exit
          Mascara = '###,###,##0.00'
          CasasDecimais = 2
          EnterProximoCampo = True
        end
        object cbCaixaBancoCredito1: TUMComboBox
          Tag = 1
          Left = 234
          Top = 90
          Width = 375
          Height = 24
          Style = csDropDownList
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = 'Tahoma'
          Font.Style = []
          ItemHeight = 16
          ParentFont = False
          TabOrder = 4
          Visible = False
          OnChange = cbCaixaBancoCredito1Change
          OnKeyDown = cbCaixaBancoCredito1KeyDown
          TamanhoMaximo = 0
        end
      end
    end
    object pnBotoes: TPanel
      Left = 0
      Top = 491
      Width = 827
      Height = 25
      Align = alBottom
      BevelOuter = bvNone
      TabOrder = 1
      object toolPessoa: TToolBar
        Left = 0
        Top = -1
        Width = 827
        Height = 26
        Align = alBottom
        ButtonWidth = 121
        Caption = 'toolPessoa'
        EdgeBorders = [ebTop, ebBottom]
        Images = ilImagens
        List = True
        ShowCaptions = True
        TabOrder = 0
        object btCancelar: TToolButton
          Left = 0
          Top = 0
          AutoSize = True
          Caption = 'F6 Cancelar'
          ImageIndex = 1
          OnClick = btAlterarClick
        end
        object ToolButton2: TToolButton
          Left = 88
          Top = 0
          Width = 8
          Caption = 'ToolButton2'
          ImageIndex = 8
          Style = tbsSeparator
        end
        object btSalvaFecha: TToolButton
          Left = 96
          Top = 0
          Caption = 'F12 Salvar e fechar'
          ImageIndex = 0
          OnClick = btExcluirClick
        end
        object ToolButton1: TToolButton
          Left = 217
          Top = 0
          Width = 8
          Caption = 'ToolButton1'
          ImageIndex = 9
          Style = tbsSeparator
        end
        object btSalvar: TToolButton
          Left = 225
          Top = 0
          AutoSize = True
          Caption = 'F5 Salvar'
          ImageIndex = 0
          OnClick = btInserirClick
        end
      end
    end
  end
  object Panel2: TPanel
    Left = 0
    Top = 26
    Width = 827
    Height = 79
    Align = alTop
    BevelOuter = bvNone
    TabOrder = 2
    object Label1: TLabel
      Left = 17
      Top = 11
      Width = 139
      Height = 16
      Caption = 'Data do Lan'#231'amento:'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label2: TLabel
      Left = 267
      Top = 11
      Width = 45
      Height = 16
      Caption = 'Chave:'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label3: TLabel
      Left = 445
      Top = 11
      Width = 122
      Height = 16
      Caption = 'Unidade de ensino:'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label6: TLabel
      Left = 502
      Top = 46
      Width = 65
      Height = 16
      Caption = 'Diferen'#231'as:'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
    end
    object Label5: TLabel
      Left = 234
      Top = 46
      Width = 80
      Height = 16
      Caption = 'Total D'#233'bitos:'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
    end
    object Label4: TLabel
      Left = 17
      Top = 46
      Width = 85
      Height = 16
      Caption = 'Total Cr'#233'ditos:'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
    end
    object edData: TMaskEdit
      Left = 162
      Top = 8
      Width = 99
      Height = 24
      EditMask = '!00/00/0000;1;_'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Tahoma'
      Font.Style = []
      MaxLength = 10
      ParentFont = False
      TabOrder = 0
      Text = '  /  /    '
      OnChange = edDataChange
      OnKeyDown = edDataKeyDown
    end
    object edChave: TEdit
      Left = 320
      Top = 8
      Width = 120
      Height = 24
      Enabled = False
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
      TabOrder = 1
    end
    object edTotalDebitos: TEdit
      Left = 320
      Top = 43
      Width = 120
      Height = 24
      Enabled = False
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
      TabOrder = 2
    end
    object edDiferencas: TEdit
      Left = 573
      Top = 43
      Width = 246
      Height = 24
      Enabled = False
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
      TabOrder = 3
    end
    object edTotalCreditos: TEdit
      Left = 108
      Top = 43
      Width = 120
      Height = 24
      Enabled = False
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
      TabOrder = 4
    end
    object cbColigadasLanc: TUMComboBox
      Tag = 1
      Left = 573
      Top = 6
      Width = 246
      Height = 24
      Style = csDropDownList
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Tahoma'
      Font.Style = []
      ItemHeight = 16
      ParentFont = False
      TabOrder = 5
      OnChange = cbColigadasLancChange
      OnKeyDown = cbColigadas1KeyDown
      TamanhoMaximo = 0
    end
  end
  object qryBuscaContas: TUMZReadOnlyQuery
    Connection = DM.db
    SQL.Strings = (
      'SELECT'
      #9'ds_conta,'
      #9'cd_conta'
      'FROM'
      #9'fin_config_plano_contas'
      'WHERE'
      #9'tp_conta = 1')
    Params = <>
    Left = 73
    Top = 133
  end
  object qryBuscaHistoricos: TUMZReadOnlyQuery
    Connection = DM.db
    SQL.Strings = (
      'SELECT'
      #9'cd_historico,'
      #9'ds_historico'
      'FROM'
      #9'fin_cp_historicos')
    Params = <>
    Left = 165
    Top = 133
  end
  object qryBuscaProximaChave: TUMZReadOnlyQuery
    Connection = DM.db
    SQL.Strings = (
      'SELECT'
      #9'(max(cd_chave) + 1) AS chave'
      'FROM'
      #9'fin_contabil')
    Params = <>
    Left = 135
    Top = 133
  end
  object qryCriterios: TUMZReadOnlyQuery
    Connection = DM.db
    SQL.Strings = (
      '('
      #9'SELECT'
      #9#9'cd_centro AS cd_apropriacao,'
      #9#9'ds_centro AS ds_apropriacao,'
      #9#9'100 AS vl_total,'
      #9#9'1 as centro_custo'
      #9'FROM'
      #9#9'fin_config_centro_custos'
      #9'where'
      '    tp_centro = 1'
      #9#9'AND cd_coligada_matriz = :cd_coligada'
      ')'
      'UNION'
      #9'('
      #9#9'SELECT'
      #9#9#9'cd_apropriacao,'
      #9#9#9'ds_apropriacao,'
      #9#9#9'vl_total,'
      #9#9#9'0 as centro_custo'
      #9#9'FROM'
      #9#9#9'fin_criterios_apropria'
      #9#9'WHERE'
      '      cd_coligada = :cd_coligada'
      #9#9'ORDER BY'
      #9#9#9'ds_apropriacao'
      #9')')
    Params = <
      item
        DataType = ftUnknown
        Name = 'cd_coligada'
        ParamType = ptUnknown
      end>
    Left = 103
    Top = 133
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'cd_coligada'
        ParamType = ptUnknown
      end>
  end
  object qryTiposTitulo: TUMZReadOnlyQuery
    Connection = DM.db
    SQL.Strings = (
      'SELECT'
      #9'fctt.cd_tipo_titulo,'
      #9'fctt.ds_tipo_titulo'
      'FROM'
      #9'fin_config_tipos_titulo fctt'
      'WHERE '
      '                fctt.ct_tipo_titulo = 2'
      'AND'
      #9'fctt.cd_coligada_matriz = :cd_coligada_matriz'
      '  and fctt.ct_tipo_titulo = 2'
      ''
      '')
    Params = <
      item
        DataType = ftUnknown
        Name = 'cd_coligada_matriz'
        ParamType = ptUnknown
      end>
    Left = 42
    Top = 133
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'cd_coligada_matriz'
        ParamType = ptUnknown
      end>
  end
  object qryBuscaLancamento: TUMZReadOnlyQuery
    Connection = DM.db
    Params = <>
    Left = 196
    Top = 133
  end
  object ilImagens: TImageList
    Left = 16
    Top = 168
    Bitmap = {
      494C010102000400040010001000FFFFFFFFFF10FFFFFFFFFFFFFFFF424D3600
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
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
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
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000008484000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000084840000000000000000000000FF000000FF00000000000000
      000000000000000000000000FF000000FF000000FF0000000000000000000000
      0000000000000000FF000000FF00000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000008484000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000084840000000000000000000000FF000000FF00000000000000
      00000000000000000000000000000000FF000000FF000000FF00000000000000
      0000000000000000FF000000FF00000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000008484000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000084840000000000000000000000FF000000FF00000000000000
      0000000000000000000000000000000000000000FF000000FF000000FF000000
      0000000000000000FF000000FF00000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000008484000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000008484000000000000000000000000000000FF000000FF000000
      000000000000000000000000000000000000000000000000FF000000FF000000
      FF00000000000000FF0000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000008484000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000FF000000FF000000
      FF000000000000000000000000000000000000000000000000000000FF000000
      FF000000FF000000FF0000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000008484000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000000000000000FF000000
      FF000000FF000000000000000000000000000000000000000000000000000000
      FF000000FF000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      FF000000FF000000FF000000FF000000FF000000FF000000FF000000FF000000
      FF00000000000000000000000000000000000000000000000000000000000000
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
      000000000000000000000000000000000000424D3E000000000000003E000000
      2800000040000000100000000100010000000000800000000000000000000000
      000000000000000000000000FFFFFF00FFFFFFFF00000000C001F83F00000000
      8031E00F000000008031CFC700000000803187E3000000008001A3F300000000
      800131F900000000800138F9000000008FF13C79000000008FF13E3900000000
      8FF13F19000000008FF19F8B000000008FF18FC3000000008FF5C7E700000000
      8001E00F00000000FFFFF83F0000000000000000000000000000000000000000
      000000000000}
  end
  object qryCadastroContasAtivas: TUMZQuery
    Connection = DM.db
    SQL.Strings = (
      'SELECT'
      #9'cd_caixa,'
      #9'cd_plano_conta'
      'FROM'
      #9'fin_cadastro_contas'
      'WHERE'
      #9'sn_ativa = '#39'S'#39)
    Params = <>
    Left = 12
    Top = 133
    object qryCadastroContasAtivascd_caixa: TIntegerField
      FieldName = 'cd_caixa'
      Required = True
    end
    object qryCadastroContasAtivascd_plano_conta: TLargeintField
      FieldName = 'cd_plano_conta'
    end
  end
end
