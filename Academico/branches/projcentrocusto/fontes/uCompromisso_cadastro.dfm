object frmCompromissoCadastro: TfrmCompromissoCadastro
  Left = 411
  Top = 0
  AutoSize = True
  BorderIcons = [biSystemMenu, biMinimize]
  Caption = 'Gerar Compromissos'
  ClientHeight = 965
  ClientWidth = 806
  Color = clBtnFace
  Font.Charset = ANSI_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  KeyPreview = True
  OldCreateOrder = False
  Position = poDesigned
  OnClose = FormClose
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object pnGridParcelas: TPanel
    Left = 0
    Top = 243
    Width = 806
    Height = 140
    Align = alTop
    TabOrder = 0
    object sgParcelas: TStringGrid
      Left = 1
      Top = 26
      Width = 804
      Height = 113
      Align = alClient
      ColCount = 1
      DefaultColWidth = 100
      DefaultRowHeight = 20
      FixedCols = 0
      RowCount = 2
      Options = [goFixedVertLine, goFixedHorzLine, goVertLine, goHorzLine, goRangeSelect, goRowSelect]
      TabOrder = 0
      OnDrawCell = sgParcelasDrawCell
      OnSelectCell = sgParcelasSelectCell
    end
    object pnTituloParcelas: TPanel
      Left = 1
      Top = 1
      Width = 804
      Height = 25
      Align = alTop
      BevelOuter = bvNone
      Caption = 'INFORMA'#199#213'ES REFERENTES AS PARCELAS'
      Color = clBlue
      Font.Charset = ANSI_CHARSET
      Font.Color = clWhite
      Font.Height = -13
      Font.Name = 'Arial'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 1
    end
  end
  object pnInfoCompromissos: TPanel
    Left = 0
    Top = 25
    Width = 806
    Height = 218
    Align = alTop
    AutoSize = True
    TabOrder = 1
    object lbFornecedor: TLabel
      Left = 8
      Top = 1
      Width = 57
      Height = 13
      Caption = 'Fornecedor:'
    end
    object lbTipoTitulo: TLabel
      Left = 8
      Top = 39
      Width = 70
      Height = 13
      Caption = 'Tipo de T'#237'tulo:'
    end
    object lbNrDocumento: TLabel
      Left = 263
      Top = 39
      Width = 78
      Height = 13
      Caption = 'Nro Documento:'
    end
    object lbDtEmissao: TLabel
      Left = 395
      Top = 39
      Width = 59
      Height = 13
      Caption = 'Dt. Emiss'#227'o:'
    end
    object lbPlanoContas: TLabel
      Left = 8
      Top = 76
      Width = 81
      Height = 13
      Caption = 'Plano de Contas:'
    end
    object lblHistorico: TLabel
      Left = 395
      Top = 76
      Width = 72
      Height = 13
      Caption = 'Hist'#243'rico Geral:'
    end
    object lbDtCompetencia: TLabel
      Left = 8
      Top = 113
      Width = 82
      Height = 13
      Caption = 'Dt. Compet'#234'ncia:'
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
    end
    object lbVlNota: TLabel
      Left = 178
      Top = 113
      Width = 85
      Height = 13
      Caption = 'Valor total l'#237'quido:'
    end
    object lbQtdParcelas: TLabel
      Left = 613
      Top = 113
      Width = 70
      Height = 13
      Caption = 'Qtde Parcelas:'
    end
    object lbPrimeiroVencimento: TLabel
      Left = 395
      Top = 113
      Width = 99
      Height = 13
      Caption = 'Primeiro Vencimento:'
    end
    object sbFornecedor: TSpeedButton
      Left = 119
      Top = 16
      Width = 24
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
      OnClick = sbFornecedorClick
    end
    object sbPlanoContas: TSpeedButton
      Left = 362
      Top = 89
      Width = 24
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
      OnClick = sbPlanoContasClick
    end
    object sbCriterioInserir: TSpeedButton
      Left = 8
      Top = 185
      Width = 65
      Height = 25
      Caption = '&Inserir'
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
      Visible = False
      OnClick = sbCriterioInserirClick
    end
    object sbCriterioEditar: TSpeedButton
      Left = 74
      Top = 185
      Width = 65
      Height = 25
      Caption = '&Editar'
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
      Visible = False
      OnClick = sbCriterioEditarClick
    end
    object sbCriterioApagar: TSpeedButton
      Left = 139
      Top = 185
      Width = 62
      Height = 25
      Caption = '&Apagar'
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
      Visible = False
      OnClick = sbCriterioApagarClick
    end
    object sbCadastrarHistorico: TSpeedButton
      Left = 773
      Top = 89
      Width = 23
      Height = 22
      Flat = True
      Glyph.Data = {
        76010000424D7601000000000000760000002800000020000000100000000100
        04000000000000010000120B0000120B00001000000000000000000000000000
        800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00555500000000
        0555555F7777777775F55500FFFFFFFFF0555577F5FFFFFFF7F550F0FEEEEEEE
        F05557F7F777777757F550F0FFFFFFFFF05557F7F5FFFFFFF7F550F0FEEEEEEE
        F05557F7F777777757F550F0FF777FFFF05557F7F5FFFFFFF7F550F0FEEEEEEE
        F05557F7F777777757F550F0FF7F777FF05557F7F5FFFFFFF7F550F0FEEEEEEE
        F05557F7F777777757F550F0FF77F7FFF05557F7F5FFFFFFF7F550F0FEEEEEEE
        F05557F7F777777757F550F0FFFFFFFFF05557F7FF5F5F5F57F550F00F0F0F0F
        005557F77F7F7F7F77555055070707070555575F7F7F7F7F7F55550507070707
        0555557575757575755555505050505055555557575757575555}
      NumGlyphs = 2
      OnClick = sbCadastrarHistoricoClick
    end
    object sbTurmaProfessor: TSpeedButton
      Left = 777
      Top = 53
      Width = 23
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
      OnClick = sbTurmaProfessorClick
    end
    object lbTurma: TLabel
      Left = 611
      Top = 39
      Width = 84
      Height = 13
      Caption = 'Turma - Disciplina'
    end
    object txtCdFornecedor: TEdit
      Left = 8
      Top = 16
      Width = 107
      Height = 21
      ReadOnly = True
      TabOrder = 0
      OnKeyPress = txtCdFornecedorKeyPress
    end
    object txtNrDocumento: TEdit
      Left = 263
      Top = 54
      Width = 126
      Height = 21
      MaxLength = 50
      TabOrder = 2
      OnKeyPress = txtNrDocumentoKeyPress
    end
    object chkNFEntregue: TCheckBox
      Left = 515
      Top = 55
      Width = 97
      Height = 17
      Caption = 'N.F. Entregue?'
      TabOrder = 4
      OnKeyPress = chkNFEntregueKeyPress
    end
    object txtDsHistorico: TEdit
      Left = 531
      Top = 90
      Width = 240
      Height = 21
      MaxLength = 255
      ParentShowHint = False
      ShowHint = False
      TabOrder = 9
      OnExit = txtDsHistoricoExit
      OnKeyPress = txtDsHistoricoKeyPress
    end
    object txtDtCompetencia: TMaskEdit
      Left = 8
      Top = 128
      Width = 164
      Height = 21
      EditMask = '!99/99/9999;1; '
      MaxLength = 10
      TabOrder = 10
      Text = '  /  /    '
      OnKeyPress = txtDtCompetenciaKeyPress
    end
    object txtDtPrimeiroVencimento: TMaskEdit
      Left = 395
      Top = 128
      Width = 212
      Height = 21
      EditMask = '!99/99/9999;1; '
      MaxLength = 10
      TabOrder = 12
      Text = '  /  /    '
      OnExit = txtDtPrimeiroVencimentoExit
      OnKeyPress = txtDtPrimeiroVencimentoKeyPress
    end
    object txtDtEmissao: TMaskEdit
      Left = 395
      Top = 54
      Width = 114
      Height = 21
      EditMask = '!99/99/9999;1; '
      MaxLength = 10
      TabOrder = 3
      Text = '  /  /    '
      OnKeyPress = txtDtEmissaoKeyPress
    end
    object txtQtdeParcelas: TUMEditNumerico
      Left = 615
      Top = 128
      Width = 156
      Height = 21
      TabOrder = 13
      Text = '1'
      OnExit = txtQtdeParcelasExit
      OnKeyPress = txtQtdeParcelasKeyPress
    end
    object pnCriteriosOpcoes: TPanel
      Left = 10
      Top = 155
      Width = 783
      Height = 32
      BevelOuter = bvNone
      TabOrder = 14
      object lbCentroCusto: TLabel
        Left = 207
        Top = 5
        Width = 84
        Height = 13
        Caption = 'Centro de Custos:'
      end
      object sbSelecionaCentro: TSpeedButton
        Left = 607
        Top = 2
        Width = 24
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
        OnClick = sbSelecionaCentroClick
      end
      object cmbCriterioApropriacao: TUMComboBox
        Left = 0
        Top = 2
        Width = 192
        Height = 21
        Style = csDropDownList
        ItemHeight = 13
        TabOrder = 0
        OnChange = cmbCriterioApropriacaoChange
        OnKeyPress = cmbCriterioApropriacaoKeyPress
        TamanhoMaximo = 0
      end
      object cbCentrosAnaliticos: TUMComboBox
        Left = 297
        Top = 2
        Width = 306
        Height = 21
        Style = csDropDownList
        ItemHeight = 13
        TabOrder = 1
        OnChange = cbCentrosAnaliticosChange
        OnSelect = cbCentrosAnaliticosSelect
        TamanhoMaximo = 0
      end
    end
    object pnGridCriterios: TPanel
      Left = 207
      Top = 155
      Width = 595
      Height = 62
      BevelOuter = bvNone
      TabOrder = 15
      object sgGridApropriacoes: TStringGrid
        Left = 0
        Top = 0
        Width = 595
        Height = 58
        Align = alTop
        ColCount = 1
        DefaultColWidth = 100
        DefaultRowHeight = 17
        FixedCols = 0
        RowCount = 2
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -9
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        Options = [goFixedVertLine, goFixedHorzLine, goVertLine, goHorzLine, goRangeSelect, goRowSelect]
        ParentFont = False
        ScrollBars = ssVertical
        TabOrder = 0
        OnDblClick = sgGridApropriacoesDblClick
        OnDrawCell = sgGridApropriacoesDrawCell
        OnSelectCell = sgGridApropriacoesSelectCell
        ExplicitLeft = -29
      end
    end
    object lbNomeFornecedor: TPanel
      Left = 149
      Top = 11
      Width = 647
      Height = 27
      Alignment = taLeftJustify
      BevelOuter = bvLowered
      Caption = '  [utilize a lupa para selecionar um fornecedor]'
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 16
    end
    object txtCdConta: TUMEditNumerico
      Left = 8
      Top = 90
      Width = 65
      Height = 21
      TabOrder = 6
      Text = '0'
      OnExit = txtCdContaExit
      OnKeyPress = txtCdContaKeyPress
    end
    object txtVlNota: TUMEditMonetario
      Left = 178
      Top = 128
      Width = 211
      Height = 21
      TabOrder = 11
      Text = '0,00'
      OnExit = txtVlNotaExit
      OnKeyUp = txtVlNotaKeyUp
      Mascara = '###,###,##0.00'
      CasasDecimais = 2
      EnterProximoCampo = True
    end
    object cmbTipoTitulo: TUMComboBox
      Left = 8
      Top = 54
      Width = 249
      Height = 21
      Style = csDropDownList
      ItemHeight = 13
      TabOrder = 1
      OnCloseUp = cmbTipoTituloCloseUp
      OnKeyPress = cmbTipoTituloKeyPress
      TamanhoMaximo = 0
    end
    object cmbHistorico: TUMComboBox
      Left = 395
      Top = 90
      Width = 130
      Height = 21
      Style = csDropDownList
      ItemHeight = 13
      TabOrder = 8
      OnChange = cmbHistoricoChange
      OnKeyPress = cmbHistoricoKeyPress
      TamanhoMaximo = 395
    end
    object cmbPlanoContas: TUMComboBox
      Left = 79
      Top = 90
      Width = 277
      Height = 21
      Style = csDropDownList
      ItemHeight = 13
      TabOrder = 7
      OnChange = cmbPlanoContasChange
      OnKeyPress = cmbPlanoContasKeyPress
      TamanhoMaximo = 0
    end
    object txtTurmaProfessor: TEdit
      Left = 611
      Top = 54
      Width = 160
      Height = 21
      ReadOnly = True
      TabOrder = 5
    end
  end
  object pnTitulo: TPanel
    Left = 0
    Top = 0
    Width = 806
    Height = 25
    Align = alTop
    Caption = 'COMPROMISSO A PAGAR'
    Color = clBlue
    Font.Charset = ANSI_CHARSET
    Font.Color = clWhite
    Font.Height = -13
    Font.Name = 'Arial'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 2
  end
  object pnInfoParcelas: TPanel
    Left = 0
    Top = 383
    Width = 806
    Height = 170
    Align = alTop
    TabOrder = 3
    object pnParParcela: TPanel
      Left = 1
      Top = 1
      Width = 56
      Height = 168
      Align = alLeft
      BevelOuter = bvLowered
      TabOrder = 0
      object Label2: TLabel
        Left = 5
        Top = 8
        Width = 44
        Height = 13
        Caption = 'Parcela'
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object lbInfoParcela: TLabel
        Left = 1
        Top = 67
        Width = 54
        Height = 20
        Alignment = taCenter
        AutoSize = False
        Caption = '01/99'
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -16
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
      end
    end
    object pcTabParcela: TPageControl
      Left = 57
      Top = 1
      Width = 748
      Height = 168
      ActivePage = Parcela
      Align = alClient
      TabOrder = 1
      object Parcela: TTabSheet
        Caption = 'Parcela'
        object lbInfo: TLabel
          Left = 417
          Top = 39
          Width = 264
          Height = 13
          AutoSize = False
          Visible = False
        end
        object ScrollBox1: TScrollBox
          Left = 0
          Top = 0
          Width = 740
          Height = 140
          Align = alClient
          BevelInner = bvNone
          BevelOuter = bvNone
          TabOrder = 0
          object lbComplementoHistorico: TLabel
            Left = 417
            Top = 50
            Width = 157
            Height = 13
            Cursor = crHandPoint
            Caption = '[+] Completar hist'#243'rico da parcela'
            Font.Charset = ANSI_CHARSET
            Font.Color = clRed
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ParentFont = False
            Visible = False
            OnClick = lbComplementoHistoricoClick
          end
          object lbParHistorico: TLabel
            Left = 417
            Top = 14
            Width = 98
            Height = 13
            Caption = 'Hist'#243'rico da Parcela:'
          end
          object lbParCaixa: TLabel
            Left = 303
            Top = 89
            Width = 94
            Height = 13
            Caption = 'Pagar com a Conta:'
          end
          object lbValorMora: TLabel
            Left = 303
            Top = 50
            Width = 69
            Height = 13
            Caption = 'Valor da Mora:'
          end
          object lbParValor: TLabel
            Left = 289
            Top = 14
            Width = 27
            Height = 13
            Caption = 'Valor:'
          end
          object lbParDtProvavelPgto: TLabel
            Left = 192
            Top = 14
            Width = 70
            Height = 13
            Caption = 'Prov'#225'vel Pgto:'
          end
          object lbParVencimento: TLabel
            Left = 97
            Top = 14
            Width = 59
            Height = 13
            Caption = 'Vencimento:'
          end
          object lbCdTitulo: TLabel
            Left = 3
            Top = 14
            Width = 49
            Height = 13
            Caption = 'C'#243'd. t'#237'tulo'
          end
          object lbParValorAbatimento: TLabel
            Left = 3
            Top = 50
            Width = 98
            Height = 13
            Caption = 'Valor do Abatimento:'
          end
          object lbParValorDesconto: TLabel
            Left = 107
            Top = 50
            Width = 91
            Height = 13
            Caption = 'Valor do Desconto:'
          end
          object lbValorMulta: TLabel
            Left = 209
            Top = 50
            Width = 71
            Height = 13
            Caption = 'Valor da Multa:'
          end
          object lbParFormaPgto: TLabel
            Left = 3
            Top = 89
            Width = 72
            Height = 13
            Caption = 'Forma de Pgto:'
          end
          object txtComplementoHistorico: TEdit
            Left = 415
            Top = 65
            Width = 300
            Height = 21
            TabOrder = 9
            Visible = False
            OnExit = txtComplementoHistoricoExit
          end
          object txtParHistorico: TEdit
            Left = 414
            Top = 28
            Width = 300
            Height = 21
            MaxLength = 255
            TabOrder = 4
            OnKeyPress = txtParHistoricoKeyPress
            OnKeyUp = txtParHistoricoKeyUp
          end
          object chkSnPrevisao: TCheckBox
            Left = 598
            Top = 106
            Width = 119
            Height = 17
            Caption = 'Previs'#227'o de despesa'
            TabOrder = 12
            OnKeyPress = chkSnPrevisaoKeyPress
          end
          object cmbCaixa: TUMComboBox
            Left = 303
            Top = 104
            Width = 287
            Height = 21
            Style = csDropDownList
            ItemHeight = 13
            TabOrder = 11
            OnChange = cmbCaixaChange
            OnKeyPress = cmbCaixaKeyPress
            TamanhoMaximo = 0
          end
          object txtParValorMora: TUMEditMonetario
            Left = 303
            Top = 65
            Width = 104
            Height = 21
            TabOrder = 8
            Text = '0,00'
            Mascara = '###,###,##0.00'
            CasasDecimais = 2
            EnterProximoCampo = True
          end
          object txtParvlNota: TUMEditMonetario
            Left = 289
            Top = 28
            Width = 119
            Height = 21
            TabOrder = 3
            Text = '0,00'
            OnExit = txtParvlNotaExit
            Mascara = '###,###,##0.00'
            CasasDecimais = 2
            EnterProximoCampo = True
          end
          object txtParProvavelPgto: TMaskEdit
            Left = 193
            Top = 28
            Width = 89
            Height = 21
            EditMask = '!99/99/9999;1; '
            MaxLength = 10
            TabOrder = 2
            Text = '  /  /    '
            OnExit = txtParProvavelPgtoExit
            OnKeyPress = txtParProvavelPgtoKeyPress
          end
          object txtParVencimento: TMaskEdit
            Left = 97
            Top = 28
            Width = 88
            Height = 21
            EditMask = '!99/99/9999;1; '
            MaxLength = 10
            TabOrder = 1
            Text = '  /  /    '
            OnExit = txtParVencimentoExit
            OnKeyPress = txtParVencimentoKeyPress
          end
          object txtParCdTitulo: TEdit
            Left = 3
            Top = 28
            Width = 82
            Height = 21
            Enabled = False
            TabOrder = 0
            OnKeyPress = txtParCdTituloKeyPress
          end
          object txtParValorAbatimento: TUMEditMonetario
            Left = 3
            Top = 65
            Width = 98
            Height = 21
            TabOrder = 5
            Text = '0,00'
            Mascara = '###,###,##0.00'
            CasasDecimais = 2
            EnterProximoCampo = True
          end
          object txtParValorDesconto: TUMEditMonetario
            Left = 107
            Top = 65
            Width = 98
            Height = 21
            TabOrder = 6
            Text = '0,00'
            Mascara = '###,###,##0.00'
            CasasDecimais = 2
            EnterProximoCampo = True
          end
          object txtParValorMulta: TUMEditMonetario
            Left = 209
            Top = 65
            Width = 88
            Height = 21
            TabOrder = 7
            Text = '0,00'
            Mascara = '###,###,##0.00'
            CasasDecimais = 2
            EnterProximoCampo = True
          end
          object cmbFormaPgto: TUMComboBox
            Left = 3
            Top = 104
            Width = 260
            Height = 21
            Style = csDropDownList
            ItemHeight = 13
            TabOrder = 10
            OnChange = cmbFormaPgtoChange
            OnKeyPress = cmbFormaPgtoKeyPress
            TamanhoMaximo = 0
          end
        end
      end
      object tsObservacao: TTabSheet
        Caption = 'Observa'#231#245'es'
        ImageIndex = 1
        object txtObservacao: TMemo
          Left = 3
          Top = 3
          Width = 716
          Height = 105
          ScrollBars = ssVertical
          TabOrder = 0
        end
      end
      object tbsParcelaAnexos: TTabSheet
        Caption = 'Anexos'
        ImageIndex = 2
        object bvlSep1: TBevel
          Left = 704
          Top = 0
          Width = 3
          Height = 140
          Align = alRight
          Shape = bsRightLine
          ExplicitLeft = 656
          ExplicitTop = 40
          ExplicitHeight = 50
        end
        object dbgAnexosParc: TDBGrid
          Left = 0
          Top = 0
          Width = 704
          Height = 140
          Align = alClient
          DataSource = dsAnexosParc
          TabOrder = 0
          TitleFont.Charset = ANSI_CHARSET
          TitleFont.Color = clWindowText
          TitleFont.Height = -11
          TitleFont.Name = 'MS Sans Serif'
          TitleFont.Style = []
          OnDrawColumnCell = dbgAnexosParcDrawColumnCell
          OnDblClick = dbgAnexosParcDblClick
          OnKeyDown = dbgAnexosParcKeyDown
          Columns = <
            item
              Expanded = False
              FieldName = 'DT_INCLUSAO'
              ReadOnly = True
              Title.Caption = 'Data inclus'#227'o'
              Width = 128
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'DS_OBSERVACAO'
              Title.Caption = 'Observa'#231#227'o'
              Width = 461
              Visible = True
            end
            item
              Expanded = False
              ReadOnly = True
              Title.Caption = 'Anexo'
              Width = 52
              Visible = True
            end>
        end
        object pnlBotoes: TPanel
          Left = 707
          Top = 0
          Width = 33
          Height = 140
          Align = alRight
          BevelOuter = bvNone
          TabOrder = 1
          object sbAnexar: TSpeedButton
            Left = 6
            Top = 3
            Width = 23
            Height = 22
            Hint = 'Anexar arquivo'
            Flat = True
            Glyph.Data = {
              36030000424D3603000000000000360000002800000010000000100000000100
              18000000000000030000120B0000120B00000000000000000000FFFFFFFFFFFF
              FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF84B094257341196B
              3725734184B094FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
              FFFFFFFFFF88B297288C5364BA8D95D2B264BA8D288C5381AE91FFFFFFFFFFFF
              F7F7F7CFCFCF7171715B5B5BAFAFAFF3F3F3FFFFFF22713F62BA8B60BA87FFFF
              FF60B98767BC8F20703DFFFFFFF9F9F9989898929292E7E7E7D7D7D76868685D
              5D5DEAEAEA317B4C9CD4B6FFFFFFFFFFFFFFFFFF95D2B2196B37FFFFFFE8E8E8
              848484F3F3F3FFFFFFFFFFFFE6E6E68C8C8C62626248896090D3B192D6B1FFFF
              FF65BC8C67BC8F20703DFFFFFFDFDFDF929292F3F3F3FFFFFFFFFFFFA9A9A9C2
              C2C294949459776461AB8195D4B4BAE6D06ABB8F2D8F5781AE91FFFFFFEFEFEF
              969696AFAFAFFEFEFEA1A1A1818181707070ABABAB9191915774615F98744F8E
              664A8A6199BDA6FFFFFFFFFFFFFFFFFFF2F2F29E9E9EB8B8B8B9B9B9D7D7D7FA
              FAFA7A7A7AACACAC909090575757E8E8E8FFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
              FFFFFFF0F0F09E9E9EB6B6B6B4B4B4CDCDCDFAFAFA7A7A7AA7A7A79292925E5E
              5EEDEDEDFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF3F3F39C9C9CAFAFAFB4
              B4B4CACACAF5F5F5898989A9A9A99B9B9B666666F0F0F0FFFFFFFFFFFFFFFFFF
              FFFFFFFFFFFFFFFFFFF6F6F69B9B9BAEAEAEB2B2B2D5D5D5F9F9F98D8D8DACAC
              AC8787875D5D5DFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF7F7F7A5
              A5A5B0B0B0ABABABD7D7D7FFFFFFFFFFFFE4E4E4686868FFFFFFFFFFFFFFFFFF
              FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF5F5F5A6A6A6B3B3B39D9D9DD6D6D6FFFF
              FFDFDFDF696969FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
              FFFFF3F3F3A4A4A4A3A3A3979797A5A5A58E8E8EB7B7B7FFFFFFFFFFFFFFFFFF
              FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF5F5F5A5A5A5AAAAAAE4E4
              E4E7E7E7FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
              FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF}
            OnClick = sbAnexarClick
          end
          object sbDelAnexo: TSpeedButton
            Left = 6
            Top = 25
            Width = 23
            Height = 22
            Hint = 'Remover anexo'
            Flat = True
            Glyph.Data = {
              36030000424D3603000000000000360000002800000010000000100000000100
              18000000000000030000120B0000120B00000000000000000000FFFFFFFFFFFF
              FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF95B0E3235CC20543
              BC1F59C186A6DDFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
              FFFFFFFFFF8CABE12866CA2177E60579EA0164DD074FBE86A6DDFFFFFFFFFFFF
              F7F7F7CFCFCF7171715B5B5BAFAFAFF3F3F3FFFFFF1F59C1639DF4187FFF0076
              F80076EE0368E11E59C0FFFFFFF9F9F9989898929292E7E7E7D7D7D76868685D
              5D5DEAEAEA0543BCAECDFEFFFFFFFFFFFFFFFFFF187FEF0543BCFFFFFFE8E8E8
              848484F3F3F3FFFFFFFFFFFFE6E6E68C8C8C626262225AC08DB5F64D92FF1177
              FF2186FF408AEB245CC2FFFFFFDFDFDF929292F3F3F3FFFFFFFFFFFFA9A9A9C2
              C2C2949494415C8F3D76D28DB5F7B8D6FE72A8F52F6DCC94AFE2FFFFFFEFEFEF
              969696AFAFAFFEFEFEA1A1A1818181707070ABABAB9191913B56892860C50543
              BC205AC188A7DEFFFFFFFFFFFFFFFFFFF2F2F29E9E9EB8B8B8B9B9B9D7D7D7FA
              FAFA7A7A7AACACAC909090575757E8E8E8FFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
              FFFFFFF0F0F09E9E9EB6B6B6B4B4B4CDCDCDFAFAFA7A7A7AA7A7A79292925E5E
              5EEDEDEDFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF3F3F39C9C9CAFAFAFB4
              B4B4CACACAF5F5F5898989A9A9A99B9B9B666666F0F0F0FFFFFFFFFFFFFFFFFF
              FFFFFFFFFFFFFFFFFFF6F6F69B9B9BAEAEAEB2B2B2D5D5D5F9F9F98D8D8DACAC
              AC8787875D5D5DFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF7F7F7A5
              A5A5B0B0B0ABABABD7D7D7FFFFFFFFFFFFE4E4E4686868FFFFFFFFFFFFFFFFFF
              FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF5F5F5A6A6A6B3B3B39D9D9DD6D6D6FFFF
              FFDFDFDF696969FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
              FFFFF3F3F3A4A4A4A3A3A3979797A5A5A58E8E8EB7B7B7FFFFFFFFFFFFFFFFFF
              FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF5F5F5A5A5A5AAAAAAE4E4
              E4E7E7E7FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
              FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF}
            OnClick = sbDelAnexoClick
          end
        end
      end
    end
  end
  object pnPgtoBoleto: TPanel
    Left = 0
    Top = 553
    Width = 806
    Height = 75
    Align = alTop
    TabOrder = 4
    object lbBoletoPagamentoCom: TLabel
      Left = 8
      Top = 6
      Width = 80
      Height = 13
      Caption = 'Pagamento com:'
    end
    object lblInfoBoletoFormaPgto: TLabel
      Left = 93
      Top = 6
      Width = 414
      Height = 13
      AutoSize = False
      Caption = 'Boleto/Tributo com C'#243'digo de Barras'
    end
    object lbParBoletoCodigoBarras: TLabel
      Left = 8
      Top = 29
      Width = 84
      Height = 13
      Caption = 'C'#243'digo de Barras:'
    end
    object txtParBoletoCodigoBarras: TEdit
      Left = 8
      Top = 44
      Width = 356
      Height = 21
      MaxLength = 50
      TabOrder = 0
      OnExit = txtParBoletoCodigoBarrasExit
      OnKeyPress = txtParBoletoCodigoBarrasKeyPress
    end
    object pnLinhaDigitavel: TPanel
      Left = 370
      Top = 25
      Width = 437
      Height = 43
      BevelOuter = bvNone
      TabOrder = 1
      object lbPontoGrupo3: TLabel
        Left = 245
        Top = 25
        Width = 3
        Height = 13
        Caption = '.'
      end
      object lbPontoGrupo2: TLabel
        Left = 142
        Top = 25
        Width = 3
        Height = 13
        Caption = '.'
      end
      object lbPontoGrupo1: TLabel
        Left = 45
        Top = 25
        Width = 3
        Height = 13
        Caption = '.'
      end
      object lbLinhaDigitavel: TLabel
        Left = 4
        Top = 3
        Width = 148
        Height = 13
        Caption = 'Linha Digit'#225'vel Boleto Banc'#225'rio'
      end
      object txtLinhaDigitavelGrupo8: TEditJump
        Left = 336
        Top = 18
        Width = 95
        Height = 21
        MaxLength = 14
        TabOrder = 7
        OnExit = txtLinhaDigitavelGrupo8Exit
        MaxLenPulo = False
      end
      object txtLinhaDigitavelGrupo7: TEditJump
        Left = 306
        Top = 18
        Width = 19
        Height = 21
        MaxLength = 1
        TabOrder = 6
        MaxLenPulo = True
      end
      object txtLinhaDigitavelGrupo6: TEditJump
        Left = 251
        Top = 18
        Width = 45
        Height = 21
        MaxLength = 6
        TabOrder = 5
        MaxLenPulo = True
      end
      object txtLinhaDigitavelGrupo5: TEditJump
        Left = 203
        Top = 18
        Width = 40
        Height = 21
        MaxLength = 5
        TabOrder = 4
        MaxLenPulo = True
      end
      object txtLinhaDigitavelGrupo4: TEditJump
        Left = 147
        Top = 18
        Width = 45
        Height = 21
        MaxLength = 6
        TabOrder = 3
        MaxLenPulo = True
      end
      object txtLinhaDigitavelGrupo3: TEditJump
        Left = 101
        Top = 18
        Width = 40
        Height = 21
        MaxLength = 5
        TabOrder = 2
        MaxLenPulo = True
      end
      object txtLinhaDigitavelGrupo2: TEditJump
        Left = 50
        Top = 18
        Width = 40
        Height = 21
        MaxLength = 5
        TabOrder = 1
        MaxLenPulo = True
      end
      object txtLinhaDigitavelGrupo1: TEditJump
        Left = 4
        Top = 18
        Width = 40
        Height = 21
        MaxLength = 5
        TabOrder = 0
        MaxLenPulo = True
      end
    end
  end
  object pnPgtoCartaoCredito: TPanel
    Left = 0
    Top = 703
    Width = 806
    Height = 75
    Align = alTop
    TabOrder = 6
    object lbCCPagamentoCom: TLabel
      Left = 8
      Top = 6
      Width = 80
      Height = 13
      Caption = 'Pagamento com:'
    end
    object lbInfoCCPagamentoCom: TLabel
      Left = 94
      Top = 6
      Width = 591
      Height = 13
      AutoSize = False
      Caption = 'Cr'#233'dito em C/C Real / DOC / TED'
    end
    object lbParCCBanco: TLabel
      Left = 322
      Top = 30
      Width = 34
      Height = 13
      Caption = 'Banco:'
    end
    object lbParCCAgencia: TLabel
      Left = 391
      Top = 30
      Width = 42
      Height = 13
      Caption = 'Ag'#234'ncia:'
    end
    object lbParCCDigAgencia: TLabel
      Left = 459
      Top = 30
      Width = 64
      Height = 13
      Caption = 'Dig. Ag'#234'ncia:'
    end
    object lbParNrContaCorrente: TLabel
      Left = 530
      Top = 30
      Width = 97
      Height = 13
      Caption = 'Nro. Conta Corrente:'
    end
    object lbParCCDigContaCorrente: TLabel
      Left = 635
      Top = 30
      Width = 53
      Height = 13
      Caption = 'Dig. Conta:'
    end
    object lbParCCDifAgenciaConta: TLabel
      Left = 699
      Top = 30
      Width = 94
      Height = 13
      Caption = 'Dif. Ag'#234'ncia/Conta:'
    end
    object lbDadosBancoAgencia: TLabel
      Left = 8
      Top = 30
      Width = 34
      Height = 13
      Caption = 'Dados:'
    end
    object sbExcluirConta: TSpeedButton
      Left = 293
      Top = 46
      Width = 22
      Height = 21
      Flat = True
      Glyph.Data = {
        42020000424D4202000000000000420000002800000010000000100000000100
        1000030000000002000000000000000000000000000000000000007C0000E003
        00001F0000001F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C
        1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C
        000000001F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C
        0000FF7F1F7C1F7C1F7C1F7C00000000FF7F1F7C1F7C1F7C1F7C1F7C1F7C0000
        FF7F1F7C1F7C1F7C1F7C1F7C00000000FF7F1F7C1F7C1F7C1F7C1F7C1F7C0000
        FF7F1F7C1F7C1F7C1F7C1F7C000000000000FF7F1F7C1F7C1F7C00000000FF7F
        1F7C1F7C1F7C1F7C1F7C1F7C1F7C000000000000FF7F1F7C00000000FF7F1F7C
        1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C00000000000000000000FF7F1F7C1F7C
        1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C000000000000FF7F1F7C1F7C1F7C
        1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C00000000000000000000FF7F1F7C1F7C
        1F7C1F7C1F7C1F7C1F7C1F7C1F7C000000000000FF7F1F7C000000001F7C1F7C
        1F7C1F7C1F7C1F7C1F7C1F7C000000000000FF7F1F7C1F7C1F7C000000000000
        1F7C1F7C1F7C1F7C0000000000000000FF7F1F7C1F7C1F7C1F7C1F7C00000000
        FF7F1F7C1F7C1F7C00000000FF7F1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C0000
        000000001F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C
        1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C
        1F7C1F7C1F7C}
      OnClick = sbExcluirContaClick
    end
    object txtParCCBanco: TEdit
      Left = 322
      Top = 46
      Width = 61
      Height = 21
      TabOrder = 1
      OnKeyPress = txtParCCBancoKeyPress
    end
    object txtParCCAgencia: TEdit
      Left = 391
      Top = 46
      Width = 60
      Height = 21
      TabOrder = 2
      OnKeyPress = txtParCCAgenciaKeyPress
    end
    object txtParCCDigAgencia: TEdit
      Left = 459
      Top = 46
      Width = 64
      Height = 21
      TabOrder = 3
      OnKeyPress = txtParCCDigAgenciaKeyPress
    end
    object txtParCCContaCorrente: TEdit
      Left = 531
      Top = 46
      Width = 96
      Height = 21
      TabOrder = 4
      OnKeyPress = txtParCCContaCorrenteKeyPress
    end
    object txtParCCDigContaCorrente: TEdit
      Left = 633
      Top = 46
      Width = 56
      Height = 21
      TabOrder = 5
      OnKeyPress = txtParCCDigContaCorrenteKeyPress
    end
    object txtParCCDifAgenciaConta: TEdit
      Left = 699
      Top = 46
      Width = 94
      Height = 21
      TabOrder = 6
      OnKeyPress = txtParCCDifAgenciaContaKeyPress
    end
    object cmbDadosBancoAgencia: TUMComboBox
      Left = 8
      Top = 46
      Width = 280
      Height = 21
      Style = csDropDownList
      ItemHeight = 13
      TabOrder = 0
      OnChange = cmbDadosBancoAgenciaChange
      OnKeyPress = cmbDadosBancoAgenciaKeyPress
      TamanhoMaximo = 0
    end
  end
  object pnPgtoDarf: TPanel
    Left = 0
    Top = 778
    Width = 806
    Height = 75
    Align = alTop
    TabOrder = 7
    object lbParDarfPagamentoCom: TLabel
      Left = 12
      Top = 8
      Width = 80
      Height = 13
      Caption = 'Pagamento com:'
    end
    object lbParDarfCodigoReceitaTributo: TLabel
      Left = 11
      Top = 30
      Width = 140
      Height = 13
      Caption = 'C'#243'digo da Receita Tributo (*):'
    end
    object lbParDarfNrReferencia: TLabel
      Left = 199
      Top = 30
      Width = 110
      Height = 13
      Caption = 'N'#250'mero de Refer'#234'ncia:'
    end
    object lbInfoDarfPagamentoCom: TLabel
      Left = 98
      Top = 8
      Width = 447
      Height = 13
      AutoSize = False
      Caption = ' Tributo - DARF Normal'
    end
    object txtParDarfCodigoReceitaTributo: TEdit
      Left = 12
      Top = 47
      Width = 170
      Height = 21
      TabOrder = 0
      OnKeyPress = txtParDarfCodigoReceitaTributoKeyPress
    end
    object txtParDarfNrReferencia: TEdit
      Left = 199
      Top = 47
      Width = 170
      Height = 21
      TabOrder = 1
      OnKeyPress = txtParDarfNrReferenciaKeyPress
    end
  end
  object pnPgtoGPS: TPanel
    Left = 0
    Top = 853
    Width = 806
    Height = 75
    Align = alTop
    TabOrder = 8
    object lbParGpsPagamentoCom: TLabel
      Left = 12
      Top = 8
      Width = 80
      Height = 13
      Caption = 'Pagamento com:'
    end
    object lbInfoParGpsPagamentoCom: TLabel
      Left = 97
      Top = 8
      Width = 583
      Height = 13
      AutoSize = False
      Caption = ' Tributo - GPS (Guia da Previd'#234'ncia Social)'
    end
    object lbParGpsCodigoReceitaTributo: TLabel
      Left = 12
      Top = 29
      Width = 140
      Height = 13
      Caption = 'C'#243'digo da Receita Tributo (*):'
    end
    object lbParGpsPgtoINSS: TLabel
      Left = 170
      Top = 29
      Width = 149
      Height = 13
      Caption = 'Valor previsto do pgto do INSS:'
    end
    object lbParGpsValorOutraEntidade: TLabel
      Left = 345
      Top = 29
      Width = 126
      Height = 13
      Caption = 'Valor de Outras Entidades:'
    end
    object lbParGpsAtualizacaoMonetaria: TLabel
      Left = 501
      Top = 29
      Width = 108
      Height = 13
      Caption = 'Atualiza'#231#227'o Monet'#225'ria:'
    end
    object txtParGpsCodigoReceitaTributo: TEdit
      Left = 12
      Top = 46
      Width = 121
      Height = 21
      TabOrder = 0
      OnKeyPress = txtParGpsCodigoReceitaTributoKeyPress
    end
    object txtParGpsPgtoINSS: TUMEditMonetario
      Left = 170
      Top = 46
      Width = 106
      Height = 21
      TabOrder = 1
      Text = '0,00'
      Mascara = '###,###,##0.00'
      CasasDecimais = 2
      EnterProximoCampo = True
    end
    object txtParGpsValorOutraEntidade: TUMEditMonetario
      Left = 345
      Top = 46
      Width = 106
      Height = 21
      TabOrder = 2
      Text = '0,00'
      Mascara = '###,###,##0.00'
      CasasDecimais = 2
      EnterProximoCampo = True
    end
    object txtParGpsAtualizacaoMonetaria: TUMEditMonetario
      Left = 501
      Top = 46
      Width = 106
      Height = 21
      TabOrder = 3
      Text = '0,00'
      Mascara = '###,###,##0.00'
      CasasDecimais = 2
      EnterProximoCampo = True
    end
  end
  object pnBotoes: TPanel
    Left = 0
    Top = 928
    Width = 806
    Height = 37
    Align = alTop
    TabOrder = 9
    object btnConfirmar: TBitBtn
      Left = 553
      Top = 6
      Width = 120
      Height = 25
      Caption = '&Confirmar'
      Enabled = False
      TabOrder = 0
      OnClick = btnConfirmarClick
      Glyph.Data = {
        F2010000424DF201000000000000760000002800000024000000130000000100
        0400000000007C01000000000000000000001000000000000000000000000000
        80000080000000808000800000008000800080800000C0C0C000808080000000
        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333334433333
        3333333333388F3333333333000033334224333333333333338338F333333333
        0000333422224333333333333833338F33333333000033422222243333333333
        83333338F3333333000034222A22224333333338F33F33338F33333300003222
        A2A2224333333338F383F3338F33333300003A2A222A222433333338F8333F33
        38F33333000034A22222A22243333338833333F3338F333300004222A2222A22
        2433338F338F333F3338F3330000222A3A2224A22243338F3838F338F3338F33
        0000A2A333A2224A2224338F83338F338F3338F300003A33333A2224A2224338
        333338F338F3338F000033333333A2224A2243333333338F338F338F00003333
        33333A2224A2233333333338F338F83300003333333333A2224A333333333333
        8F338F33000033333333333A222433333333333338F338F30000333333333333
        A224333333333333338F38F300003333333333333A223333333333333338F8F3
        000033333333333333A3333333333333333383330000}
      NumGlyphs = 2
    end
    object btnCancelar: TBitBtn
      Left = 679
      Top = 6
      Width = 120
      Height = 25
      Cancel = True
      Caption = '&Cancelar'
      TabOrder = 1
      OnClick = btnCancelarClick
      Glyph.Data = {
        DE010000424DDE01000000000000760000002800000024000000120000000100
        0400000000006801000000000000000000001000000000000000000000000000
        80000080000000808000800000008000800080800000C0C0C000808080000000
        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333333333333
        333333333333333333333333000033338833333333333333333F333333333333
        0000333911833333983333333388F333333F3333000033391118333911833333
        38F38F333F88F33300003339111183911118333338F338F3F8338F3300003333
        911118111118333338F3338F833338F3000033333911111111833333338F3338
        3333F8330000333333911111183333333338F333333F83330000333333311111
        8333333333338F3333383333000033333339111183333333333338F333833333
        00003333339111118333333333333833338F3333000033333911181118333333
        33338333338F333300003333911183911183333333383338F338F33300003333
        9118333911183333338F33838F338F33000033333913333391113333338FF833
        38F338F300003333333333333919333333388333338FFF830000333333333333
        3333333333333333333888330000333333333333333333333333333333333333
        0000}
      NumGlyphs = 2
    end
    object btnDuplicarCompromisso: TBitBtn
      Left = 8
      Top = 6
      Width = 170
      Height = 25
      Caption = 'Duplicar Compromisso'
      TabOrder = 2
      Visible = False
      OnClick = btnDuplicarCompromissoClick
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
    end
    object cbBaixar: TCheckBox
      Left = 363
      Top = 11
      Width = 178
      Height = 17
      Caption = 'Baixar compromisso ao confirmar'
      TabOrder = 3
      OnClick = cbBaixarClick
    end
  end
  object pnPgtoBoletoArrecadacao: TPanel
    Left = 0
    Top = 628
    Width = 806
    Height = 75
    Align = alTop
    TabOrder = 5
    object lblInfoBoletoArrecadacaoFormaPgto: TLabel
      Left = 8
      Top = 6
      Width = 322
      Height = 13
      Caption = 'Pagamento com: Boleto/Tributo com C'#243'digo de Barras Arrecada'#231#227'o'
    end
    object lbParBoletoCodigoBarrasArrecadacao: TLabel
      Left = 8
      Top = 28
      Width = 84
      Height = 13
      Caption = 'C'#243'digo de Barras:'
    end
    object lbLinhaDigitavelArrecadacao: TLabel
      Left = 370
      Top = 28
      Width = 134
      Height = 13
      Caption = 'Linha Digit'#225'vel Arrecada'#231#227'o'
    end
    object txtParBoletoCodigoBarrasArrecadacao: TEdit
      Left = 8
      Top = 44
      Width = 356
      Height = 21
      TabOrder = 0
      OnExit = txtParBoletoCodigoBarrasArrecadacaoExit
      OnKeyPress = txtParBoletoCodigoBarrasArrecadacaoKeyPress
    end
    object txtGrupo1: TEditJump
      Left = 370
      Top = 44
      Width = 74
      Height = 21
      MaxLength = 11
      TabOrder = 1
      MaxLenPulo = True
    end
    object txtGrupo2: TEditJump
      Left = 450
      Top = 44
      Width = 20
      Height = 21
      MaxLength = 1
      TabOrder = 2
      MaxLenPulo = True
    end
    object txtGrupo3: TEditJump
      Left = 478
      Top = 44
      Width = 75
      Height = 21
      MaxLength = 11
      TabOrder = 3
      MaxLenPulo = True
    end
    object txtGrupo4: TEditJump
      Left = 559
      Top = 44
      Width = 20
      Height = 21
      MaxLength = 1
      TabOrder = 4
      MaxLenPulo = True
    end
    object txtGrupo6: TEditJump
      Left = 668
      Top = 44
      Width = 20
      Height = 21
      MaxLength = 1
      TabOrder = 6
      MaxLenPulo = True
    end
    object txtGrupo7: TEditJump
      Left = 696
      Top = 44
      Width = 75
      Height = 21
      MaxLength = 11
      TabOrder = 7
      MaxLenPulo = True
    end
    object txtGrupo8: TEditJump
      Left = 777
      Top = 44
      Width = 20
      Height = 21
      MaxLength = 1
      TabOrder = 8
      OnExit = txtGrupo8Exit
      MaxLenPulo = False
    end
    object txtGrupo5: TEditJump
      Left = 586
      Top = 44
      Width = 75
      Height = 21
      MaxLength = 11
      TabOrder = 5
      MaxLenPulo = True
    end
  end
  object qryAnexosParc: TUMZQuery
    Connection = DM.db
    SortedFields = 'DT_INCLUSAO'
    SortType = stDescending
    UpdateObject = updAnexosParc
    SQL.Strings = (
      'SELECT'
      '   CD_TITULO,'
      '   CD_COLIGADA,'
      '   DT_INCLUSAO,'
      '   DS_OBSERVACAO,'
      '   BB_ANEXO,'
      '   CD_ANEXO'
      'FROM'
      '   FIN_CONTAS_PAGAR_ANEXOS'
      'WHERE'
      '   CD_TITULO = :CD_TITULO AND'
      '   CD_COLIGADA = :CD_COLIGADA')
    Params = <
      item
        DataType = ftUnknown
        Name = 'CD_TITULO'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'CD_COLIGADA'
        ParamType = ptUnknown
      end>
    IndexFieldNames = 'DT_INCLUSAO Desc'
    Left = 384
    Top = 344
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'CD_TITULO'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'CD_COLIGADA'
        ParamType = ptUnknown
      end>
    object qryAnexosParcCD_TITULO: TLargeintField
      FieldName = 'CD_TITULO'
      Required = True
    end
    object qryAnexosParcCD_COLIGADA: TSmallintField
      FieldName = 'CD_COLIGADA'
      Required = True
    end
    object qryAnexosParcDT_INCLUSAO: TDateTimeField
      FieldName = 'DT_INCLUSAO'
    end
    object qryAnexosParcDS_OBSERVACAO: TStringField
      FieldName = 'DS_OBSERVACAO'
      Size = 255
    end
    object qryAnexosParcBB_ANEXO: TBlobField
      FieldName = 'BB_ANEXO'
      Required = True
    end
    object qryAnexosParcCD_ANEXO: TLargeintField
      FieldName = 'CD_ANEXO'
    end
  end
  object dsAnexosParc: TDataSource
    DataSet = qryAnexosParc
    Left = 416
    Top = 344
  end
  object updAnexosParc: TZUpdateSQL
    DeleteSQL.Strings = (
      'DELETE FROM FIN_CONTAS_PAGAR_ANEXOS'
      'WHERE'
      '   CD_ANEXO = :CD_ANEXO')
    InsertSQL.Strings = (
      'INSERT INTO FIN_CONTAS_PAGAR_ANEXOS'
      '   (CD_TITULO, CD_COLIGADA, DT_INCLUSAO, BB_ANEXO)'
      'VALUES'
      '   (:CD_TITULO, :CD_COLIGADA, NOW(), :BB_ANEXO)')
    ModifySQL.Strings = (
      'UPDATE FIN_CONTAS_PAGAR_ANEXOS'
      'SET'
      '   DS_OBSERVACAO = :DS_OBSERVACAO,'
      '   BB_ANEXO = :BB_ANEXO'
      'WHERE'
      '   CD_ANEXO = :CD_ANEXO')
    RefreshSQL.Strings = (
      '')
    UseSequenceFieldForRefreshSQL = False
    Left = 352
    Top = 344
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'DS_OBSERVACAO'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'BB_ANEXO'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'CD_ANEXO'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'CD_TITULO'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'CD_COLIGADA'
        ParamType = ptUnknown
      end>
  end
  object ilAnexos: TImageList
    Left = 456
    Top = 344
    Bitmap = {
      494C010101000400040010001000FFFFFFFFFF10FFFFFFFFFFFFFFFF424D3600
      0000000000003600000028000000400000001000000001002000000000000010
      000000000000000000000000000000000000000000003F3F3F001F1F1F002222
      22001F1F1F008D8D8D00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000003939390022222200FFFFFF00FFFF
      FF00FFFFFF002525250080808000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000001C1C1C00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF002525250080808000FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000001F1F1F00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF002626260080808000FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000001F1F1F00FFFFFF00FFFFFF00FFFF
      FF006D6D6D00202020001B1B1B00FFFFFF002424240080808000FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000006F6F6F0020202000FFFFFF000000
      00001F1F1F00E5E5E5009E9E9E0018181800FFFFFF002424240080808000FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000FFFFFF006B6B6B001F1F1F00FFFF
      FF0029292900A0A0A000FFFFFF009191910018181800FFFFFF00222222007E7E
      7E00FFFFFF00FFFFFF00FFFFFF00FFFFFF000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000FFFFFF00FFFFFF006B6B6B001F1F
      1F00FFFFFF001F1F1F00A0A0A000FFFFFF00919191001E1E1E00FFFFFF002222
      22007E7E7E00FFFFFF00FFFFFF00FFFFFF000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000FFFFFF00FFFFFF00FFFFFF006B6B
      6B0020202000FFFFFF0022222200A0A0A000FFFFFF00919191001C1C1C00FFFF
      FF00222222007E7E7E00FFFFFF00FFFFFF000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000FFFFFF00FFFFFF00FFFFFF00FFFF
      FF006B6B6B0024242400FFFFFF0022222200A0A0A000FFFFFF00919191001C1C
      1C00FFFFFF00222222008B8B8B00FFFFFF000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF006B6B6B0024242400FFFFFF0022222200A0A0A000FFFFFF009191
      91001C1C1C00FFFFFF0019191900FFFFFF000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF006B6B6B0024242400FFFFFF0022222200A0A0A000FFFF
      FF00919191001D1D1D00FFFFFF00FFFFFF000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF007171710024242400FFFFFF0022222200FFFF
      FF00FFFFFF00818181001E1E1E00FFFFFF000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF007171710024242400FFFFFF00FFFF
      FF00FFFFFF00A0A0A0001F1F1F00FFFFFF000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF0046464600292929000000
      0000FFFFFF006D6D6D001F1F1F00FFFFFF000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00515151001F1F
      1F001F1F1F001F1F1F00B1B1B100FFFFFF000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000424D3E000000000000003E000000
      2800000040000000100000000100010000000000800000000000000000000000
      000000000000000000000000FFFFFF0080000000000000000000000000000000
      0000000000000000000000000000000000000000000000001000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0010000000000000000000000000000000000000000000000000000000000000
      000000000000}
  end
end
