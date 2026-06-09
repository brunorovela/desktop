object frm_Tesouraria_gerar: Tfrm_Tesouraria_gerar
  Left = 221
  Top = 168
  Caption = 'Movimenta'#231#227'o'
  ClientHeight = 506
  ClientWidth = 615
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  OnClose = FormClose
  OnCloseQuery = FormCloseQuery
  OnCreate = FormCreate
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object Label4: TLabel
    Left = 8
    Top = 72
    Width = 53
    Height = 13
    Caption = 'Cod. Conta'
  end
  object Label5: TLabel
    Left = 96
    Top = 72
    Width = 94
    Height = 13
    Caption = 'Descri'#231#227'o da Conta'
  end
  object Label6: TLabel
    Left = 8
    Top = 112
    Width = 111
    Height = 13
    Caption = 'Hist'#243'rico do Movimento'
  end
  object Label8: TLabel
    Left = 390
    Top = 112
    Width = 106
    Height = 13
    Caption = 'N'#186' Doc (Nota/Recibo)'
  end
  object Label11: TLabel
    Left = 368
    Top = 160
    Width = 85
    Height = 13
    Caption = 'Data Lan'#231'amento'
  end
  object Label22: TLabel
    Left = 8
    Top = 160
    Width = 83
    Height = 13
    Caption = 'Valor em Dinheiro'
  end
  object Label3: TLabel
    Left = 9
    Top = 32
    Width = 98
    Height = 13
    Caption = 'A'#231#227'o do Movimento:'
  end
  object Label1: TLabel
    Left = 132
    Top = 160
    Width = 81
    Height = 13
    Caption = 'Valor em Cheque'
  end
  object Label7: TLabel
    Left = 256
    Top = 160
    Width = 52
    Height = 13
    Caption = 'N'#186' Cheque'
  end
  object sbConta: TSpeedButton
    Left = 472
    Top = 88
    Width = 24
    Height = 19
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
    OnClick = sbContaClick
  end
  object Label2: TLabel
    Left = 8
    Top = 203
    Width = 90
    Height = 13
    Caption = 'Unidade de Ensino'
  end
  object pnTitulo: TPanel
    Left = 0
    Top = 0
    Width = 615
    Height = 25
    Align = alTop
    BevelOuter = bvLowered
    Caption = 'MOVIMENTA'#199#195'O NA TESOURARIA'
    Color = clBlue
    Font.Charset = ANSI_CHARSET
    Font.Color = clWhite
    Font.Height = -13
    Font.Name = 'Arial'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 11
  end
  object pgApropriacao: TPageControl
    Left = 0
    Top = 252
    Width = 615
    Height = 224
    ActivePage = tsComApropriacao
    Align = alBottom
    MultiLine = True
    Style = tsFlatButtons
    TabOrder = 10
    OnEnter = pgApropriacaoEnter
    object tsSemApropriacao: TTabSheet
      Caption = 'Sem Apropria'#231#227'o'
      object Label20: TLabel
        Left = 2
        Top = 2
        Width = 56
        Height = 13
        Caption = 'Cod. Centro'
      end
      object Label21: TLabel
        Left = 67
        Top = 2
        Width = 81
        Height = 13
        Caption = 'Centro de Custos'
      end
      object sbMais_semApropriacao: TSpeedButton
        Left = 508
        Top = 19
        Width = 24
        Height = 19
        Hint = 'Incluir Plano de Contas'
        Flat = True
        Glyph.Data = {
          36040000424D3604000000000000360000002800000010000000100000000100
          2000000000000004000000000000000000000000000000000000FF00FF00FF00
          FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
          FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
          FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
          FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
          FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
          FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
          FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
          FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
          FF00FF00FF00FF00FF00FF00FF00FF00FF00000000000000000000000000FF00
          FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
          FF00FF00FF00FF00FF00FF00FF00FF00FF0000000000FF00FF0000000000FF00
          FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
          FF00FF00FF00FF00FF00FF00FF00FF00FF0000000000FF00FF0000000000FF00
          FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
          FF00FF00FF0000000000000000000000000000000000FF00FF00000000000000
          00000000000000000000FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
          FF00FF00FF0000000000FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
          FF00FF00FF0000000000FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
          FF00FF00FF0000000000000000000000000000000000FF00FF00000000000000
          00000000000000000000FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
          FF00FF00FF00FF00FF00FF00FF00FF00FF0000000000FF00FF0000000000FF00
          FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
          FF00FF00FF00FF00FF00FF00FF00FF00FF0000000000FF00FF0000000000FF00
          FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
          FF00FF00FF00FF00FF00FF00FF00FF00FF00000000000000000000000000FF00
          FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
          FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
          FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
          FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
          FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
          FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
          FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00}
        Visible = False
      end
      object SpeedButton1: TSpeedButton
        Left = 478
        Top = 19
        Width = 24
        Height = 19
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
      object edCodCentro: TEdit
        Left = 4
        Top = 19
        Width = 57
        Height = 21
        TabOrder = 0
        OnExit = edCodCentroExit
        OnKeyPress = edCodCentroKeyPress
      end
      object cbCentro: TComboBox
        Left = 67
        Top = 19
        Width = 405
        Height = 19
        Style = csOwnerDrawFixed
        ItemHeight = 13
        TabOrder = 1
        OnChange = cbCentroChange
        OnKeyPress = cbCentroKeyPress
      end
    end
    object tsComApropriacao: TTabSheet
      Caption = 'Com apropria'#231#227'o'
      ImageIndex = 2
      object sbCriterioInserir: TSpeedButton
        Left = 3
        Top = 30
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
        OnClick = sbCriterioInserirClick
      end
      object sbCriterioApagar: TSpeedButton
        Left = 145
        Top = 30
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
        OnClick = sbCriterioApagarClick
      end
      object sbCriterioEditar: TSpeedButton
        Left = 74
        Top = 30
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
        OnClick = sbCriterioEditarClick
      end
      object pnlDireita: TPanel
        Left = 0
        Top = 61
        Width = 607
        Height = 132
        Align = alBottom
        BevelOuter = bvNone
        Caption = 'pnlDireita'
        TabOrder = 0
        object sgGridApropriacoes: TStringGrid
          Left = 0
          Top = 0
          Width = 607
          Height = 132
          Align = alClient
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
          OnSelectCell = sgGridApropriacoesSelectCell
        end
      end
      object cmbCriterioApropriacao: TUMComboBox
        Left = 3
        Top = 3
        Width = 204
        Height = 21
        Style = csDropDownList
        ItemHeight = 13
        TabOrder = 1
        OnChange = cmbCriterioApropriacaoChange
        OnKeyPress = cmbCriterioApropriacaoKeyPress
        TamanhoMaximo = 0
        SelecionarUnicoAutomatico = False
      end
    end
  end
  object Panel1: TPanel
    Left = 0
    Top = 476
    Width = 615
    Height = 30
    Align = alBottom
    BevelOuter = bvNone
    TabOrder = 12
    object btnConfirmar: TBitBtn
      Left = 246
      Top = 2
      Width = 125
      Height = 25
      Caption = 'Confirmar e Fechar'
      TabOrder = 1
      OnClick = btnConfirmarFecharClick
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
      Left = 379
      Top = 2
      Width = 83
      Height = 25
      Caption = 'Cancelar'
      TabOrder = 2
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
    object btnConfirmarIncluir: TBitBtn
      Left = 119
      Top = 2
      Width = 121
      Height = 25
      Caption = 'Confirmar e Incluir'
      TabOrder = 0
      OnClick = btnConfirmarIncluirClick
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
  end
  object cbAcaoMovimento: TComboBox
    Left = 8
    Top = 47
    Width = 489
    Height = 22
    Style = csOwnerDrawFixed
    ItemHeight = 16
    TabOrder = 0
    OnKeyPress = cbAcaoMovimentoKeyPress
  end
  object edCodConta: TEdit
    Left = 8
    Top = 88
    Width = 81
    Height = 21
    TabOrder = 1
    OnExit = edCodContaExit
    OnKeyPress = edCodContaKeyPress
  end
  object cbPlanoConta: TComboBox
    Left = 95
    Top = 88
    Width = 374
    Height = 19
    Style = csOwnerDrawFixed
    ItemHeight = 13
    TabOrder = 2
    OnChange = cbPlanoContaChange
    OnKeyPress = cbPlanoContaKeyPress
  end
  object edHistorico: TEdit
    Left = 8
    Top = 128
    Width = 375
    Height = 21
    TabOrder = 3
    OnKeyPress = edHistoricoKeyPress
  end
  object edNroDocumento: TEdit
    Left = 390
    Top = 128
    Width = 107
    Height = 21
    TabOrder = 4
    OnKeyPress = edNroDocumentoKeyPress
  end
  object edValorDinheiro: TEdit
    Left = 8
    Top = 176
    Width = 118
    Height = 21
    TabOrder = 5
    OnExit = edValorDinheiroExit
    OnKeyPress = edValorDinheiroKeyPress
  end
  object edValorCheque: TEdit
    Left = 132
    Top = 176
    Width = 118
    Height = 21
    TabOrder = 6
    OnExit = edValorDinheiroExit
    OnKeyPress = edValorDinheiroKeyPress
  end
  object edNroCheque: TEdit
    Left = 256
    Top = 176
    Width = 107
    Height = 21
    TabOrder = 7
    OnKeyPress = edNroDocumentoKeyPress
  end
  object cbUnidadeEnsino: TUMComboBox
    Left = 8
    Top = 219
    Width = 487
    Height = 21
    Style = csDropDownList
    ItemHeight = 13
    TabOrder = 9
    OnKeyPress = cbUnidadeEnsinoKeyPress
    TamanhoMaximo = 0
  end
  object umdtLancamento: TUMDateTimePicker
    Left = 369
    Top = 179
    Width = 90
    Height = 21
    BevelOuter = bvNone
    TabOrder = 8
    TabStop = True
    ImgBotaoCalendario.Data = {
      36030000424D3603000000000000360000002800000010000000100000000100
      1800000000000003000000000000000000000000000000000000D8E9ECD8E9EC
      D8E9EC9BA0B99CA3BDA1A6BEA0A2B9A8A8B9ABA5B2A59FAAA7A6B893A0BD789E
      C78CA5B5C0B39ED8E9ECD8E9ECC6DBF29EBBDC86AAD27BA1CB799EC67FA0C688
      A6C78CA6C58FABCA809EC27DA3CC6DA0D090ACBFB5AB98BCB0A487DFF64AA2E2
      3A95D53B9AE13192DD3698E2409DE23C95D93C95DC3A95DF3C97E14399DF4D95
      D483A5BDAEAA9BB3A99E279AEC309CE43297D839A0E6339DE9309BE83A9EE235
      97DD389DEB37A1F5349AEA3E99DF51A0E278A1C0A6A69DB5AEA63490D67CCAEE
      BDFAFF84C1DBB8F9FF86C8E8B5EDFBA5DDF195D5F1A0E7FC87C5EFBEF3FF75BB
      F170A3C9A0A7A5B0ADA74AA5F27BBFE2D1FEFF91BDD1BFF0FF94C6DFCFF4FABA
      E1F3ABDEF3B0ECFD98C7F2D4F7FF6FB3EB629DCC9FADAEADADAB1887F050A2E7
      81B5D77FB0D279B0DD6FA7DB8BB6DB7DABD869A5E9549CF1639BDE89B0DB5DA8
      ED599BD098ABB2A0A5A5158FFE66C1FCBAF3FF8EC2E6B7F2FF85C1EFC0EEFCA4
      D7F72F72C3084DB373AFF3C8F2FF6CBAFD539AD292A9B3A5ABAD138FFF64BEFF
      BBF4FF8BC0EBB0ECFF85C4FCBDEDFE9ED1F7286BC80648B864A3F0C2EEFF62B4
      FA549BD790A9B4A3ABAD1D8AF94898EC80B1E26F9ECF82B6F3679DE088B0E581
      ACE9528CDF3076DB659AED8AB1EB58A5F45095D28BA1AD9CA3A64B99EE8FC6EF
      D8F7FFAAC7DFD4F5FFA5C9EAD2E9FCBDD6F7B5DBF7B4E3FEA4C6F9D4EEFF6FB6
      F75D9FD99AADB8ACB1B3438CD788C3E9CDF9FF99C5E3C5F5FF91C1E7C8F0FBB4
      DAF3A9D8F3AFE6FD97C4F1CCF5FF6EB7F7609ED293A4AC9EA2A5379DF241A1EC
      49A4E646A2EA4BABF83C9BEB50A9F14DA3ED4CA7F641A0F74DA7F94FA2ED479E
      ED659BCB9BA6AAA6A6A63196EE2E94EB1F87DD2691EF1D8BED1C8AEC2992EF1E
      83DF2A90ED1F86E7238BEC2184E12A83D771A2CDC9D0D1E5E2E2458BDC4491E9
      287DDE2D88F1207BE72681EB3B92F92B7FE13A8AE92B7CDD3086EB2F86EB3B8C
      E08EBBE2EAF0F0D8E9ECB5EDFF80C0F9317DE269BBFD3084F15DAFF43B8AF14F
      9AEA62A8F33D83DF6DB9FE2D7EE779C6F7C4EFFFD8E9ECD8E9EC}
    OnChangeDate = umdtLancamentoChangeDate
    OnKeyPress = umdtLancamentoKeyPress
    Date = 42255.000000000000000000
    InverterPosicaoCalendario = False
    MostraCalenadarioDesdeCampoTexto = False
  end
  object qyPlano_Contas: TUMZQuery
    Connection = DM.db
    SQL.Strings = (
      'SELECT'
      '  *'
      'FROM'
      '  fin_config_plano_contas'
      'WHERE'
      '  tp_conta = 1 AND'
      '  cd_coligada_matriz = :cd_coligada_matriz AND'
      '  sn_ativo = 1'
      'ORDER BY'
      '  ds_conta')
    Params = <
      item
        DataType = ftUnknown
        Name = 'cd_coligada_matriz'
        ParamType = ptUnknown
      end>
    Left = 576
    Top = 96
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'cd_coligada_matriz'
        ParamType = ptUnknown
      end>
    object qyPlano_Contascd_conta: TLargeintField
      FieldName = 'cd_conta'
      Required = True
    end
    object qyPlano_Contasds_conta: TStringField
      FieldName = 'ds_conta'
      Origin = 'WMESTRE12.fin_plano_contas.ds_conta'
      Size = 255
    end
    object qyPlano_Contasds_observacao: TMemoField
      FieldName = 'ds_observacao'
      Origin = 'WMESTRE12.fin_plano_contas.ds_observacao'
      BlobType = ftMemo
      Size = 1
    end
    object qyPlano_Contascd_classificacao: TStringField
      FieldName = 'cd_classificacao'
      Origin = 'WMESTRE12.fin_plano_contas.cd_classificacao'
    end
    object qyPlano_Contastp_conta: TSmallintField
      FieldName = 'tp_conta'
      Origin = 'WMESTRE12.fin_plano_contas.tp_conta'
    end
    object qyPlano_Contastp_entrada_saida: TSmallintField
      FieldName = 'tp_entrada_saida'
      Origin = 'WMESTRE12.fin_plano_contas.tp_entrada_saida'
    end
    object qyPlano_Contascd_apropriacao: TIntegerField
      FieldName = 'cd_apropriacao'
    end
    object qyPlano_Contascd_coligada_matriz: TIntegerField
      FieldName = 'cd_coligada_matriz'
      Required = True
    end
  end
  object qyCentro_Custos: TUMZQuery
    Connection = DM.db
    OnCalcFields = qyCentro_CustosCalcFields
    SQL.Strings = (
      'SELECT'
      '  *'
      'FROM'
      '  fin_config_centro_custos'
      'WHERE'
      '  tp_centro  = 1 AND'
      '  cd_coligada_matriz = :cd_coligada_matriz AND'
      '  sn_ativo = 1'
      'ORDER BY'
      '  cd_classificacao, ds_centro')
    Params = <
      item
        DataType = ftUnknown
        Name = 'cd_coligada_matriz'
        ParamType = ptUnknown
      end>
    Left = 576
    Top = 64
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'cd_coligada_matriz'
        ParamType = ptUnknown
      end>
    object qyCentro_Custoscd_centro: TLargeintField
      FieldName = 'cd_centro'
      Required = True
    end
    object qyCentro_CustosdesClassificacaoDesc: TStringField
      FieldKind = fkCalculated
      FieldName = 'desClassificacaoDesc'
      Size = 100
      Calculated = True
    end
    object qyCentro_Custosds_centro: TStringField
      FieldName = 'ds_centro'
      Origin = 'WMESTRE12.fin_centro_custos.ds_centro'
      Size = 255
    end
    object qyCentro_Custosds_observacao: TMemoField
      FieldName = 'ds_observacao'
      Origin = 'WMESTRE12.fin_centro_custos.ds_observacao'
      BlobType = ftMemo
      Size = 1
    end
    object qyCentro_Custoscd_classificacao: TStringField
      FieldName = 'cd_classificacao'
      Origin = 'WMESTRE12.fin_centro_custos.cd_classificacao'
    end
    object qyCentro_Custostp_centro: TSmallintField
      FieldName = 'tp_centro'
      Origin = 'WMESTRE12.fin_centro_custos.tp_centro'
    end
    object qyCentro_Custoscd_grupo: TLargeintField
      FieldName = 'cd_grupo'
    end
    object qyCentro_Custoscd_coligada_matriz: TIntegerField
      FieldName = 'cd_coligada_matriz'
      Required = True
    end
  end
  object qyAcao: TUMZQuery
    Connection = DM.db
    SQL.Strings = (
      'SELECT * FROM fin_tipos_movimento '
      'where cd_tipo_movimento = 1'
      'ORDER by ds_movimento')
    Params = <>
    Left = 576
    Top = 33
  end
  object qryColigadas: TUMZQuery
    Connection = DM.db
    SQL.Strings = (
      'SELECT'
      #9'cd_coligada,'
      #9'nm_coligada,'
      #9'sn_bloquear_financeiro,'
      #9'dt_bloqueio_financeiro,'
      #9'sn_bloquear_boleto,'
      #9'dt_bloqueio_boleto'
      'FROM'
      #9'coligadas_matriz')
    Params = <>
    Left = 576
    Top = 128
    object qryColigadascd_coligada: TIntegerField
      FieldName = 'cd_coligada'
    end
    object qryColigadasnm_coligada: TStringField
      FieldName = 'nm_coligada'
      Size = 255
    end
    object qryColigadassn_bloquear_financeiro: TSmallintField
      FieldName = 'sn_bloquear_financeiro'
    end
    object qryColigadasdt_bloqueio_financeiro: TDateField
      FieldName = 'dt_bloqueio_financeiro'
    end
    object qryColigadassn_bloquear_boleto: TSmallintField
      FieldName = 'sn_bloquear_boleto'
    end
    object qryColigadasdt_bloqueio_boleto: TDateField
      FieldName = 'dt_bloqueio_boleto'
    end
  end
end
