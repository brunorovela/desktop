object frmNegociacao: TfrmNegociacao
  Left = 0
  Top = 25
  BorderStyle = bsDialog
  ClientHeight = 510
  ClientWidth = 900
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poMainFormCenter
  ShowHint = True
  OnClose = FormClose
  OnCreate = FormCreate
  OnDestroy = FormDestroy
  OnKeyDown = FormKeyDown
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object Bevel4: TBevel
    Left = 0
    Top = 55
    Width = 900
    Height = 5
    Align = alTop
    Shape = bsSpacer
    ExplicitWidth = 700
  end
  object Bevel1: TBevel
    Left = 0
    Top = 25
    Width = 900
    Height = 5
    Align = alTop
    Shape = bsSpacer
    ExplicitWidth = 700
  end
  object PageControl1: TPageControl
    Left = 0
    Top = 60
    Width = 900
    Height = 450
    ActivePage = TabSheet1
    Align = alClient
    TabOrder = 0
    OnChange = PageControl1Change
    OnChanging = PageControl1Changing
    object TabSheet1: TTabSheet
      Caption = 'Nova Negocia'#231#227'o'
      object Splitter1: TSplitter
        Left = 433
        Top = 25
        Width = 4
        Height = 397
        Beveled = True
      end
      object ScrollBox2: TScrollBox
        Left = 0
        Top = 0
        Width = 892
        Height = 25
        Align = alTop
        BorderStyle = bsNone
        TabOrder = 0
        object Label31: TLabel
          Left = 14
          Top = 3
          Width = 129
          Height = 13
          Caption = 'Simula'#231#245'es de Negocia'#231#227'o:'
        end
        object sbExcluir: TSpeedButton
          Left = 614
          Top = 0
          Width = 23
          Height = 22
          Flat = True
          Glyph.Data = {
            76010000424D7601000000000000760000002800000020000000100000000100
            04000000000000010000120B0000120B00001000000000000000000000000000
            800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
            FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00500005000555
            555557777F777555F55500000000555055557777777755F75555005500055055
            555577F5777F57555555005550055555555577FF577F5FF55555500550050055
            5555577FF77577FF555555005050110555555577F757777FF555555505099910
            555555FF75777777FF555005550999910555577F5F77777775F5500505509990
            3055577F75F77777575F55005055090B030555775755777575755555555550B0
            B03055555F555757575755550555550B0B335555755555757555555555555550
            BBB35555F55555575F555550555555550BBB55575555555575F5555555555555
            50BB555555555555575F555555555555550B5555555555555575}
          NumGlyphs = 2
          OnClick = sbExcluirClick
        end
        object cbSimulacao: TComboBox
          Left = 149
          Top = 0
          Width = 465
          Height = 22
          Style = csOwnerDrawFixed
          ItemHeight = 16
          ItemIndex = 0
          TabOrder = 0
          Text = 'Iniciar uma nova negocia'#231#227'o'
          OnChange = SpeedButton3Click
          Items.Strings = (
            'Iniciar uma nova negocia'#231#227'o')
        end
      end
      object Panel4: TPanel
        Left = 0
        Top = 25
        Width = 433
        Height = 397
        Align = alLeft
        BevelOuter = bvNone
        TabOrder = 1
        DesignSize = (
          433
          397)
        object Label5: TLabel
          Left = 16
          Top = 1
          Width = 152
          Height = 13
          Caption = 'Parcelas que ser'#227'o negociadas:'
        end
        object Label6: TLabel
          Left = 108
          Top = 219
          Width = 122
          Height = 13
          Alignment = taRightJustify
          Anchors = [akTop, akRight]
          Caption = 'Valor Nominal a Negociar:'
        end
        object Label7: TLabel
          Left = 55
          Top = 246
          Width = 98
          Height = 13
          Alignment = taRightJustify
          Anchors = [akTop, akRight]
          Caption = 'Juros:   Negociados:'
        end
        object Label12: TLabel
          Left = 249
          Top = 246
          Width = 54
          Height = 13
          Anchors = [akTop, akRight]
          Caption = 'Atualizado:'
        end
        object Label8: TLabel
          Left = 124
          Top = 270
          Width = 109
          Height = 13
          Alignment = taRightJustify
          Anchors = [akTop, akRight]
          Caption = 'Valor Total a Negociar:'
        end
        object Label10: TLabel
          Left = 164
          Top = 294
          Width = 69
          Height = 13
          Alignment = taRightJustify
          Anchors = [akTop, akRight]
          Caption = 'Valor Entrada:'
        end
        object Label17: TLabel
          Left = 142
          Top = 318
          Width = 91
          Height = 13
          Alignment = taRightJustify
          Anchors = [akTop, akRight]
          Caption = 'L'#237'quido a Negociar:'
        end
        object Label2: TLabel
          Left = 116
          Top = 340
          Width = 118
          Height = 13
          Alignment = taRightJustify
          Anchors = [akTop, akRight]
          Caption = 'Quantidade de Cr'#233'ditos:'
        end
        object sbParcelasPagas: TSpeedButton
          Left = 240
          Top = -3
          Width = 25
          Height = 22
          Hint = 'Apresentar parcelas j'#225' pagas'
          AllowAllUp = True
          GroupIndex = 1
          Flat = True
          Glyph.Data = {
            76010000424D7601000000000000760000002800000020000000100000000100
            04000000000000010000120B0000120B00001000000000000000000000000000
            800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
            FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333333333333
            33333FFFFFFFFFFFFFFF000000000000000077777777777777770FFFFFFFFFFF
            FFF07F3FF3FF3FF3FFF70F00F00F00F000F07F773773773777370FFFFFFFFFFF
            FFF07F3FF3FF3FF3FFF70F00F00F00F000F07F773773773777370FFFFFFFFFFF
            FFF07F3FF3FF3FF3FFF70F00F00F00F000F07F773773773777370FFFFFFFFFFF
            FFF07F3FF3FF3FF3FFF70F00F00F00F000F07F773773773777370FFFFFFFFFFF
            FFF07FFFFFFFFFFFFFF70CCCCCCCCCCCCCC07777777777777777088CCCCCCCCC
            C8807FF7777777777FF700000000000000007777777777777777333333333333
            3333333333333333333333333333333333333333333333333333}
          NumGlyphs = 2
          Visible = False
          OnClick = sbParcelasPagasClick
        end
        object sbMarcar: TSpeedButton
          Left = 272
          Top = -3
          Width = 25
          Height = 22
          Hint = 'Selecionar Parcelas'
          Flat = True
          Glyph.Data = {
            82020000424D8202000000000000420000002800000011000000100000000100
            10000300000040020000C30E0000C30E00000000000000000000007C0000E003
            00001F000000FF7F734E734E734E734E734E734E734EFF7FFF7FFF7FFF7FFF7F
            FF7FFF7FFF7FFF7F0000FF7F734EFF7FFF7FFF7FFF7FFF7F734EFF7FFF7FFF7F
            FF7FFF7FFF7FFF7FFF7FFF7F0000FF7F734EFF7FFF7F0000FF7FFF7F734EFF7F
            FF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7F0000FF7F734EFF7F0000FF7F0000FF7F
            734EFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7F0000FF7F734EFF7FFF7FFF7F
            FF7F0000734EFF7F734E734E734E734E734E734E734EFF7F0000FF7F734EFF7F
            FF7FFF7FFF7FFF7F734EFF7F734EFF7FFF7FFF7FFF7FFF7F734EFF7F0000FF7F
            734E734E734E734E734E734E734EFF7F734EFF7FFF7F0000FF7FFF7F734EFF7F
            0000FF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7F734EFF7F0000FF7F0000FF7F
            734EFF7F0000FF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7F734EFF7FFF7FFF7F
            FF7F0000734EFF7F0000FF7F734E734E734E734E734E734E734EFF7F734EFF7F
            FF7FFF7FFF7FFF7F734EFF7F0000FF7F734EFF7FFF7FFF7FFF7FFF7F734EFF7F
            734E734E734E734E734E734E734EFF7F0000FF7F734EFF7FFF7F0000FF7FFF7F
            734EFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7F0000FF7F734EFF7F0000FF7F
            0000FF7F734EFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7F0000FF7F734EFF7F
            FF7FFF7FFF7F0000734EFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7F0000FF7F
            734EFF7FFF7FFF7FFF7FFF7F734EFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7F
            0000FF7F734E734E734E734E734E734E734EFF7FFF7FFF7FFF7FFF7FFF7FFF7F
            FF7FFF7F0000}
          OnClick = sbMarcarClick
        end
        object sbDesmarcar: TSpeedButton
          Left = 297
          Top = -3
          Width = 25
          Height = 22
          Hint = 'Desmarcar parcelas selecionadas'
          Flat = True
          Glyph.Data = {
            76030000424D7603000000000000360000002800000011000000100000000100
            18000000000040030000C30E0000C30E00000000000000000000FFFFFF999999
            999999999999999999999999999999999999FFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFF00FFFFFF999999FFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFF999999FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FF00FFFFFF999999FFFFFFFFFFFFFFFFFFFFFFFFFFFFFF999999FFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF00FFFFFF999999FFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFF999999FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFF00FFFFFF999999FFFFFFFFFFFFFFFFFFFFFFFFFFFFFF99
            9999FFFFFF999999999999999999999999999999999999999999FFFFFF00FFFF
            FF999999FFFFFFFFFFFFFFFFFFFFFFFFFFFFFF999999FFFFFF999999FFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFF999999FFFFFF00FFFFFF9999999999999999999999
            99999999999999999999FFFFFF999999FFFFFFFFFFFFFFFFFFFFFFFFFFFFFF99
            9999FFFFFF00FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FF999999FFFFFFFFFFFFFFFFFFFFFFFFFFFFFF999999FFFFFF00FFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF999999FFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFF999999FFFFFF00FFFFFF999999999999999999999999999999
            999999999999FFFFFF999999FFFFFFFFFFFFFFFFFFFFFFFFFFFFFF999999FFFF
            FF00FFFFFF999999FFFFFFFFFFFFFFFFFFFFFFFFFFFFFF999999FFFFFF999999
            999999999999999999999999999999999999FFFFFF00FFFFFF999999FFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFF999999FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFF00FFFFFF999999FFFFFFFFFFFFFFFFFFFFFFFFFFFFFF99
            9999FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF00FFFF
            FF999999FFFFFFFFFFFFFFFFFFFFFFFFFFFFFF999999FFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF00FFFFFF999999FFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFF999999FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFF00FFFFFF999999999999999999999999999999999999999999FFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF00}
          OnClick = sbDesmarcarClick
        end
        object sbMarcarVencidas: TSpeedButton
          Left = 320
          Top = -3
          Width = 25
          Height = 22
          Hint = 'Selecionar Parcelas Vencidas'
          Flat = True
          Glyph.Data = {
            76030000424D7603000000000000360000002800000011000000100000000100
            18000000000040030000C30E0000C30E00000000000000000000FFFFFF9C9C9C
            9C9C9C9C9C9C9C9C9C9C9C9C9C9C9C9C9C9CFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFF00FFFFFF9C9C9CFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFF9C9C9CFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FF00FFFFFF9C9C9CFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF9C9C9CFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF00FFFFFF9C9C9CFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFF9C9C9CFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFF00FFFFFF9C9C9CFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF9C
            9C9CFFFFFF9C9C9C9C9C9C9C9C9C9C9C9C9C9C9C9C9C9C9C9C9CFFFFFF00FFFF
            FF9C9C9CFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF9C9C9CFFFFFF9C9C9CFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFF9C9C9CFFFFFF00FFFFFF9C9C9C9C9C9C9C9C9C9C9C
            9C9C9C9C9C9C9C9C9C9CFFFFFF9C9C9CFFFFFFFFFFFF000000FFFFFFFFFFFF9C
            9C9CFFFFFF00FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FF9C9C9CFFFFFF000000FFFFFF000000FFFFFF9C9C9CFFFFFF00FFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF9C9C9CFFFFFFFFFFFFFFFF
            FFFFFFFF0000009C9C9CFFFFFF00FFFFFF9C9C9C9C9C9C9C9C9C9C9C9C9C9C9C
            9C9C9C9C9C9CFFFFFF9C9C9CFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF9C9C9CFFFF
            FF00FFFFFF9C9C9CFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF9C9C9CFFFFFF9C9C9C
            9C9C9C9C9C9C9C9C9C9C9C9C9C9C9C9C9C9CFFFFFF00FFFFFF9C9C9CFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFF9C9C9CFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFF00FFFFFF9C9C9CFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF9C
            9C9CFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF00FFFF
            FF9C9C9CFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF9C9C9CFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF00FFFFFF9C9C9CFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFF9C9C9CFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFF00FFFFFF9C9C9C9C9C9C9C9C9C9C9C9C9C9C9C9C9C9C9C9C9CFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF00}
          OnClick = sbMarcarVencidasClick
        end
        object lstAtuais: TCheckListBox
          AlignWithMargins = True
          Left = 25
          Top = 22
          Width = 398
          Height = 167
          Margins.Left = 25
          Margins.Top = 22
          Margins.Right = 10
          OnClickCheck = lstAtuaisClickCheck
          Align = alTop
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Courier New'
          Font.Style = []
          ItemHeight = 14
          ParentFont = False
          TabOrder = 0
        end
        object ckbCorrige: TCheckBox
          Left = 25
          Top = 196
          Width = 273
          Height = 17
          Caption = 'Atualizar at'#233' a data da entrada.'
          TabOrder = 1
          OnClick = ckbCorrigeClick
        end
        object dbBruto: TDBEdit
          Left = 241
          Top = 216
          Width = 145
          Height = 21
          Anchors = [akTop, akRight]
          Color = clBtnFace
          DataField = 'vl_bruto_negocia'
          DataSource = dsNegocia
          ReadOnly = True
          TabOrder = 2
          OnExit = dbBrutoExit
          OnKeyPress = dbBrutoKeyPress
        end
        object DBEdit9: TDBEdit
          Left = 161
          Top = 243
          Width = 74
          Height = 21
          Anchors = [akTop, akRight]
          Color = clBtnFace
          DataField = 'JurosNegociado'
          DataSource = dsNegocia
          TabOrder = 3
          OnChange = dbJurosChange
          OnKeyPress = dbBrutoKeyPress
        end
        object dbJuros: TDBEdit
          Left = 308
          Top = 243
          Width = 85
          Height = 21
          Anchors = [akTop, akRight]
          DataField = 'vl_juros_negocia'
          DataSource = dsNegocia
          TabOrder = 4
          OnChange = dbJurosChange
          OnKeyPress = dbBrutoKeyPress
        end
        object dbTotal: TDBEdit
          Left = 248
          Top = 267
          Width = 145
          Height = 21
          Anchors = [akTop, akRight]
          Color = clBtnFace
          DataField = 'ValTotal'
          DataSource = dsNegocia
          ReadOnly = True
          TabOrder = 5
          OnKeyPress = dbBrutoKeyPress
        end
        object dbEntrada: TDBEdit
          Left = 248
          Top = 291
          Width = 145
          Height = 21
          Anchors = [akTop, akRight]
          DataField = 'vl_entrada'
          DataSource = dsNegocia
          TabOrder = 6
          OnChange = dbEntradaChange
          OnKeyPress = dbBrutoKeyPress
        end
        object dbLiquido: TDBEdit
          Left = 248
          Top = 315
          Width = 145
          Height = 21
          Anchors = [akTop, akRight]
          Color = clBtnFace
          DataField = 'ValLiquido'
          DataSource = dsNegocia
          ReadOnly = True
          TabOrder = 7
          OnKeyPress = dbBrutoKeyPress
        end
        object dbCreditos: TDBEdit
          Left = 248
          Top = 339
          Width = 145
          Height = 21
          Anchors = [akTop, akRight]
          DataField = 'vl_creditos'
          DataSource = dsNegocia
          TabOrder = 8
          OnKeyPress = dbBrutoKeyPress
        end
        object btnConfirmar: TBitBtn
          Left = 7
          Top = 366
          Width = 149
          Height = 29
          Hint = 'Confirmar Negocia'#231#227'o'
          Caption = 'Confirmar Negocia'#231#227'o'
          TabOrder = 9
          OnClick = btnConfirmarClick
          Glyph.Data = {
            DE010000424DDE01000000000000760000002800000024000000120000000100
            0400000000006801000000000000000000001000000000000000000000000000
            80000080000000808000800000008000800080800000C0C0C000808080000000
            FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333333333333
            3333333333333333333333330000333333333333333333333333F33333333333
            00003333344333333333333333388F3333333333000033334224333333333333
            338338F3333333330000333422224333333333333833338F3333333300003342
            222224333333333383333338F3333333000034222A22224333333338F338F333
            8F33333300003222A3A2224333333338F3838F338F33333300003A2A333A2224
            33333338F83338F338F33333000033A33333A222433333338333338F338F3333
            0000333333333A222433333333333338F338F33300003333333333A222433333
            333333338F338F33000033333333333A222433333333333338F338F300003333
            33333333A222433333333333338F338F00003333333333333A22433333333333
            3338F38F000033333333333333A223333333333333338F830000333333333333
            333A333333333333333338330000333333333333333333333333333333333333
            0000}
          NumGlyphs = 2
        end
        object btnSimular: TBitBtn
          Left = 155
          Top = 366
          Width = 136
          Height = 29
          Hint = 'Confirmar Negocia'#231#227'o'
          Caption = 'Salvar Simula'#231#227'o'
          TabOrder = 10
          OnClick = SpeedButton2Click
          Glyph.Data = {
            76010000424D7601000000000000760000002800000020000000100000000100
            04000000000000010000130B0000130B00001000000000000000000000000000
            800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
            FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333333330070
            7700333333337777777733333333008088003333333377F73377333333330088
            88003333333377FFFF7733333333000000003FFFFFFF77777777000000000000
            000077777777777777770FFFFFFF0FFFFFF07F3333337F3333370FFFFFFF0FFF
            FFF07F3FF3FF7FFFFFF70F00F0080CCC9CC07F773773777777770FFFFFFFF039
            99337F3FFFF3F7F777F30F0000F0F09999937F7777373777777F0FFFFFFFF999
            99997F3FF3FFF77777770F00F000003999337F773777773777F30FFFF0FF0339
            99337F3FF7F3733777F30F08F0F0337999337F7737F73F7777330FFFF0039999
            93337FFFF7737777733300000033333333337777773333333333}
          NumGlyphs = 2
        end
        object btnCancelar: TBitBtn
          Left = 290
          Top = 366
          Width = 103
          Height = 29
          Hint = 'Cancelar Negocia'#231#227'o'
          Cancel = True
          Caption = 'Cancelar'
          TabOrder = 11
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
      end
      object Panel5: TPanel
        Left = 437
        Top = 25
        Width = 455
        Height = 397
        Align = alClient
        BevelOuter = bvNone
        TabOrder = 2
        object Label9: TLabel
          Left = 16
          Top = 3
          Width = 132
          Height = 13
          Caption = 'Parcelas que ser'#227'o criadas:'
        end
        object Label19: TLabel
          Left = 50
          Top = 228
          Width = 44
          Height = 13
          Alignment = taRightJustify
          Caption = 'Parcelas:'
        end
        object Label13: TLabel
          Left = 245
          Top = 256
          Width = 45
          Height = 13
          Caption = 'Juros de:'
        end
        object sb1X: TSpeedButton
          Left = 208
          Top = 225
          Width = 29
          Height = 21
          Caption = '1 X'
          Flat = True
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = []
          ParentFont = False
          OnClick = sb1XClick
        end
        object sb2X: TSpeedButton
          Left = 236
          Top = 225
          Width = 30
          Height = 21
          Caption = '2 X'
          Flat = True
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = []
          ParentFont = False
          OnClick = sb2XClick
        end
        object sb3X: TSpeedButton
          Left = 265
          Top = 225
          Width = 30
          Height = 21
          Caption = '3 X'
          Flat = True
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = []
          ParentFont = False
          OnClick = sb3XClick
        end
        object sb4X: TSpeedButton
          Left = 294
          Top = 225
          Width = 31
          Height = 21
          Caption = '4 X'
          Flat = True
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = []
          ParentFont = False
          OnClick = sb4XClick
        end
        object sb5X: TSpeedButton
          Left = 324
          Top = 225
          Width = 29
          Height = 21
          Caption = '5 X'
          Flat = True
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = []
          ParentFont = False
          OnClick = sb5XClick
        end
        object sb6X: TSpeedButton
          Left = 352
          Top = 225
          Width = 30
          Height = 21
          Caption = '6 X'
          Flat = True
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = []
          ParentFont = False
          OnClick = sb6XClick
        end
        object sbJuros: TSpeedButton
          Left = 359
          Top = 252
          Width = 23
          Height = 22
          Caption = 'C'
          Flat = True
          OnClick = sbJurosClick
        end
        object Label14: TLabel
          Left = 339
          Top = 255
          Width = 12
          Height = 16
          Caption = '%'
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          ParentFont = False
        end
        object Label16: TLabel
          Left = 66
          Top = 341
          Width = 28
          Height = 13
          Alignment = taRightJustify
          Caption = 'OBS.:'
        end
        object Label15: TLabel
          Left = 34
          Top = 283
          Width = 60
          Height = 13
          Alignment = taRightJustify
          Caption = 'Turma Base:'
        end
        object Label30: TLabel
          Left = 41
          Top = 311
          Width = 53
          Height = 13
          Alignment = taRightJustify
          Caption = 'Tipo T'#237'tulo:'
        end
        object grdNovas: TStringGrid
          Left = 13
          Top = 25
          Width = 388
          Height = 167
          ColCount = 6
          DefaultColWidth = 60
          DefaultRowHeight = 19
          RowCount = 20
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = []
          Options = [goFixedVertLine, goFixedHorzLine, goVertLine, goHorzLine, goDrawFocusSelected, goEditing, goTabs]
          ParentFont = False
          TabOrder = 0
          OnDrawCell = grdNovasDrawCell
          OnGetEditMask = grdNovasGetEditMask
          OnKeyDown = grdNovasKeyDown
          OnKeyPress = grdNovasKeyPress
          OnSelectCell = grdNovasSelectCell
          OnSetEditText = grdNovasSetEditText
          RowHeights = (
            19
            19
            19
            19
            19
            19
            19
            19
            19
            19
            19
            22
            19
            19
            19
            19
            19
            19
            19
            19)
        end
        object grdTotais: TStringGrid
          Left = 13
          Top = 198
          Width = 388
          Height = 21
          TabStop = False
          Color = clBtnFace
          ColCount = 6
          DefaultColWidth = 48
          DefaultRowHeight = 19
          FixedCols = 0
          RowCount = 1
          FixedRows = 0
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = []
          Options = [goFixedVertLine, goFixedHorzLine, goVertLine, goHorzLine]
          ParentFont = False
          ScrollBars = ssNone
          TabOrder = 1
          OnDrawCell = grdTotaisDrawCell
          OnKeyPress = grdNovasKeyPress
          RowHeights = (
            19)
        end
        object txtParcelas: TSpinEdit
          Left = 108
          Top = 225
          Width = 56
          Height = 22
          MaxValue = 99
          MinValue = 1
          TabOrder = 2
          Value = 1
          OnChange = txtParcelasChange
          OnKeyPress = dbBrutoKeyPress
        end
        object cbData: TComboBox
          Left = 16
          Top = 253
          Width = 86
          Height = 22
          Style = csOwnerDrawFixed
          Color = clBtnFace
          ItemHeight = 16
          ItemIndex = 0
          TabOrder = 3
          Text = 'A partir de:'
          OnChange = cbDataChange
          Items.Strings = (
            'A partir de:'
            'Entrada em:')
        end
        object datApartir: TDateTimePicker
          Left = 108
          Top = 253
          Width = 98
          Height = 21
          Date = 35955.000000000000000000
          Format = 'dd/MM/yyyy'
          Time = 35955.000000000000000000
          TabOrder = 4
          OnChange = datApartirChange
        end
        object txtJuros: TEdit
          Left = 296
          Top = 253
          Width = 40
          Height = 21
          TabOrder = 5
          Text = '2'
          OnChange = txtJurosChange
          OnExit = txtJurosExit
          OnKeyPress = txtJurosKeyPress
        end
        object cbTurma: TComboBox
          Left = 108
          Top = 280
          Width = 274
          Height = 22
          Style = csOwnerDrawFixed
          ItemHeight = 16
          TabOrder = 6
          OnChange = cbTurmaChange
          OnKeyPress = dbBrutoKeyPress
        end
        object cbTipoTitulos: TComboBox
          Left = 108
          Top = 308
          Width = 274
          Height = 22
          Style = csOwnerDrawFixed
          ItemHeight = 16
          TabOrder = 7
          OnChange = cbTipoTitulosChange
        end
        object dbOBS: TDBEdit
          Left = 108
          Top = 338
          Width = 274
          Height = 21
          DataField = 'ds_negocia'
          DataSource = dsNegocia
          TabOrder = 8
          OnKeyPress = dbBrutoKeyPress
        end
        object btnCalcular: TBitBtn
          Left = 253
          Top = 370
          Width = 132
          Height = 25
          Hint = 'Efetuar simula'#231#227'o de c'#225'lculo'
          Caption = 'F5 Atualizar C'#225'lculo'
          TabOrder = 9
          OnClick = btnCalcularClick
          Glyph.Data = {
            76010000424D7601000000000000760000002800000020000000100000000100
            04000000000000010000120B0000120B00001000000000000000000000000000
            800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
            FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00337000000000
            73333337777777773F333308888888880333337F3F3F3FFF7F33330808089998
            0333337F737377737F333308888888880333337F3F3F3F3F7F33330808080808
            0333337F737373737F333308888888880333337F3F3F3F3F7F33330808080808
            0333337F737373737F333308888888880333337F3F3F3F3F7F33330808080808
            0333337F737373737F333308888888880333337F3FFFFFFF7F33330800000008
            0333337F7777777F7F333308000E0E080333337F7FFFFF7F7F33330800000008
            0333337F777777737F333308888888880333337F333333337F33330888888888
            03333373FFFFFFFF733333700000000073333337777777773333}
          NumGlyphs = 2
        end
      end
    end
    object TabSheet2: TTabSheet
      Caption = 'Negocia'#231#245'es Anteriores'
      ImageIndex = 1
      object Label20: TLabel
        Left = 20
        Top = 8
        Width = 117
        Height = 13
        Caption = 'Negocia'#231#245'es registradas'
      end
      object Label21: TLabel
        Left = 17
        Top = 370
        Width = 136
        Height = 13
        Alignment = taRightJustify
        Caption = 'Negocia'#231#227'o Confirmada por:'
      end
      object Label22: TLabel
        Left = 42
        Top = 187
        Width = 111
        Height = 13
        Alignment = taRightJustify
        Caption = 'Valor Bruto a Negociar:'
      end
      object Label23: TLabel
        Left = 31
        Top = 214
        Width = 122
        Height = 13
        Alignment = taRightJustify
        Caption = 'Juros Calculado at'#233' hoje:'
      end
      object Label24: TLabel
        Left = 44
        Top = 241
        Width = 109
        Height = 13
        Alignment = taRightJustify
        Caption = 'Valor Total a Negociar:'
      end
      object Label25: TLabel
        Left = 68
        Top = 263
        Width = 69
        Height = 13
        Alignment = taRightJustify
        Caption = 'Valor Entrada:'
      end
      object Label26: TLabel
        Left = 62
        Top = 292
        Width = 91
        Height = 13
        Alignment = taRightJustify
        Caption = 'L'#237'quido a Negociar:'
      end
      object Label27: TLabel
        Left = 417
        Top = 8
        Width = 97
        Height = 13
        Caption = 'Parcelas negociadas'
      end
      object Label28: TLabel
        Left = 416
        Top = 168
        Width = 165
        Height = 13
        Caption = 'Parcelas criadas com a negocia'#231#227'o'
      end
      object SpeedButton1: TSpeedButton
        Left = 417
        Top = 360
        Width = 152
        Height = 24
        Caption = 'Desfazer Negocia'#231#227'o'
        Flat = True
        Glyph.Data = {
          76010000424D7601000000000000760000002800000020000000100000000100
          04000000000000010000130B0000130B00001000000000000000000000000000
          800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
          FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333333333333
          3333333333FFFFF3333333333999993333333333F77777FFF333333999999999
          3333333777333777FF3333993333339993333377FF3333377FF3399993333339
          993337777FF3333377F3393999333333993337F777FF333337FF993399933333
          399377F3777FF333377F993339993333399377F33777FF33377F993333999333
          399377F333777FF3377F993333399933399377F3333777FF377F993333339993
          399377FF3333777FF7733993333339993933373FF3333777F7F3399933333399
          99333773FF3333777733339993333339933333773FFFFFF77333333999999999
          3333333777333777333333333999993333333333377777333333}
        NumGlyphs = 2
        OnClick = SpeedButton1Click
      end
      object Label4: TLabel
        Left = 36
        Top = 319
        Width = 118
        Height = 13
        Alignment = taRightJustify
        Caption = 'Quantidade de Cr'#233'ditos:'
      end
      object Label29: TLabel
        Left = 36
        Top = 397
        Width = 28
        Height = 13
        Alignment = taRightJustify
        Caption = 'OBS.:'
      end
      object btnNegociacao: TSpeedButton
        Left = 417
        Top = 331
        Width = 152
        Height = 26
        Caption = 'Imprimir Negocia'#231#227'o'
        Flat = True
        Glyph.Data = {
          36040000424D3604000000000000360000002800000010000000100000000100
          2000000000000004000000000000000000000000000000000000FF00FF00FF00
          FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
          FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
          FF00000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000FF00FF00FF00FF00FF00FF00FF00FF000000
          0000C6C6C600C6C6C600C6C6C600C6C6C600C6C6C600C6C6C600C6C6C600C6C6
          C600C6C6C60000000000C6C6C60000000000FF00FF00FF00FF00000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000C6C6C60000000000FF00FF0000000000C6C6
          C600C6C6C600C6C6C600C6C6C600C6C6C600C6C6C60000FFFF0000FFFF0000FF
          FF00C6C6C600C6C6C600000000000000000000000000FF00FF0000000000C6C6
          C600C6C6C600C6C6C600C6C6C600C6C6C600C6C6C60084848400848484008484
          8400C6C6C600C6C6C60000000000C6C6C60000000000FF00FF00000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000C6C6C600C6C6C6000000000000000000C6C6
          C600C6C6C600C6C6C600C6C6C600C6C6C600C6C6C600C6C6C600C6C6C600C6C6
          C600C6C6C60000000000C6C6C60000000000C6C6C60000000000FF00FF000000
          0000000000000000000000000000000000000000000000000000000000000000
          000000000000C6C6C60000000000C6C6C6000000000000000000FF00FF00FF00
          FF0000000000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
          FF00FFFFFF0000000000C6C6C60000000000C6C6C60000000000FF00FF00FF00
          FF00FF00FF0000000000FFFFFF00000000000000000000000000000000000000
          0000FFFFFF0000000000000000000000000000000000FF00FF00FF00FF00FF00
          FF00FF00FF0000000000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
          FF00FFFFFF00FFFFFF0000000000FF00FF00FF00FF00FF00FF00FF00FF00FF00
          FF00FF00FF00FF00FF0000000000FFFFFF000000000000000000000000000000
          000000000000FFFFFF0000000000FF00FF00FF00FF00FF00FF00FF00FF00FF00
          FF00FF00FF00FF00FF0000000000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
          FF00FFFFFF00FFFFFF00FFFFFF0000000000FF00FF00FF00FF00FF00FF00FF00
          FF00FF00FF00FF00FF00FF00FF00000000000000000000000000000000000000
          000000000000000000000000000000000000FF00FF00FF00FF00FF00FF00FF00
          FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
          FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00}
        OnClick = btnNegociacaoClick
      end
      object Label18: TLabel
        Left = 30
        Top = 344
        Width = 123
        Height = 13
        Alignment = taRightJustify
        Caption = 'Negocia'#231#227'o Simulada por:'
      end
      object DBGrid1: TDBGrid
        Left = 17
        Top = 32
        Width = 296
        Height = 127
        BorderStyle = bsNone
        DataSource = dsNegociaAnterior
        Options = [dgTitles, dgColumnResize, dgRowLines, dgTabs, dgRowSelect, dgConfirmDelete, dgCancelOnExit]
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
            FieldName = 'cd_negocia'
            Width = 55
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'dt_negocia'
            Width = 75
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'ValTotal'
            Width = 74
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'vl_entrada'
            Width = 74
            Visible = True
          end>
      end
      object DBEdit1: TDBEdit
        Left = 168
        Top = 183
        Width = 145
        Height = 21
        Color = clBtnFace
        DataField = 'vl_bruto_negocia'
        DataSource = dsNegociaAnterior
        ReadOnly = True
        TabOrder = 1
      end
      object DBEdit2: TDBEdit
        Left = 168
        Top = 210
        Width = 145
        Height = 21
        Color = clBtnFace
        DataField = 'vl_juros_negocia'
        DataSource = dsNegociaAnterior
        ReadOnly = True
        TabOrder = 2
      end
      object DBEdit3: TDBEdit
        Left = 168
        Top = 237
        Width = 145
        Height = 21
        Color = clBtnFace
        DataField = 'ValTotal'
        DataSource = dsNegociaAnterior
        ReadOnly = True
        TabOrder = 3
      end
      object DBEdit4: TDBEdit
        Left = 168
        Top = 264
        Width = 145
        Height = 21
        Color = clBtnFace
        DataField = 'vl_entrada'
        DataSource = dsNegociaAnterior
        ReadOnly = True
        TabOrder = 4
      end
      object DBEdit5: TDBEdit
        Left = 168
        Top = 291
        Width = 145
        Height = 21
        Color = clBtnFace
        DataField = 'ValLiquido'
        DataSource = dsNegociaAnterior
        ReadOnly = True
        TabOrder = 5
      end
      object DBEdit6: TDBEdit
        Left = 168
        Top = 370
        Width = 145
        Height = 21
        Color = clBtnFace
        DataField = 'nm_usuario_negocia'
        DataSource = dsNegociaAnterior
        ReadOnly = True
        TabOrder = 7
      end
      object DBGrid2: TDBGrid
        Left = 417
        Top = 32
        Width = 400
        Height = 127
        BorderStyle = bsNone
        DataSource = dsParcAtual
        Options = [dgTitles, dgColumnResize, dgRowLines, dgTabs, dgRowSelect, dgConfirmDelete, dgCancelOnExit]
        TabOrder = 8
        TitleFont.Charset = DEFAULT_CHARSET
        TitleFont.Color = clWindowText
        TitleFont.Height = -11
        TitleFont.Name = 'Tahoma'
        TitleFont.Style = []
        Columns = <
          item
            Expanded = False
            FieldName = 'parcela'
            Width = 55
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'datavencimento'
            Width = 75
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'valor_bruto'
            Width = 80
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'valorjuros'
            Width = 80
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'valor_total'
            Width = 80
            Visible = True
          end>
      end
      object DBGrid3: TDBGrid
        Left = 416
        Top = 198
        Width = 401
        Height = 127
        BorderStyle = bsNone
        DataSource = dsParcNova
        Options = [dgTitles, dgColumnResize, dgRowLines, dgTabs, dgRowSelect, dgConfirmDelete, dgCancelOnExit]
        TabOrder = 9
        TitleFont.Charset = DEFAULT_CHARSET
        TitleFont.Color = clWindowText
        TitleFont.Height = -11
        TitleFont.Name = 'Tahoma'
        TitleFont.Style = []
        Columns = <
          item
            Expanded = False
            FieldName = 'parcela'
            Width = 55
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'datavencimento'
            Width = 75
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'valor_total'
            Width = 80
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'valorpago'
            Width = 80
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'datapagamento'
            Width = 80
            Visible = True
          end>
      end
      object BitBtn1: TBitBtn
        Left = 739
        Top = 331
        Width = 78
        Height = 25
        Cancel = True
        Caption = 'Fechar'
        TabOrder = 10
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
      object DBEdit7: TDBEdit
        Left = 168
        Top = 318
        Width = 145
        Height = 21
        Color = clBtnFace
        DataField = 'vl_creditos'
        DataSource = dsNegociaAnterior
        ReadOnly = True
        TabOrder = 6
        OnKeyPress = dbBrutoKeyPress
      end
      object DBEdit8: TDBEdit
        Left = 70
        Top = 396
        Width = 243
        Height = 21
        Color = clBtnFace
        DataField = 'ds_negocia'
        DataSource = dsNegociaAnterior
        ReadOnly = True
        TabOrder = 11
      end
      object DBEdit10: TDBEdit
        Left = 168
        Top = 344
        Width = 145
        Height = 21
        Color = clBtnFace
        DataField = 'nm_usuario_simula'
        DataSource = dsNegociaAnterior
        ReadOnly = True
        TabOrder = 12
      end
    end
  end
  object Panel3: TPanel
    Left = 0
    Top = 0
    Width = 900
    Height = 25
    Align = alTop
    BevelOuter = bvLowered
    Caption = 'NEGOCIA'#199#195'O FINANCEIRA'
    Color = clBlue
    Font.Charset = ANSI_CHARSET
    Font.Color = clWhite
    Font.Height = -13
    Font.Name = 'Arial'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 1
  end
  object Panel1: TPanel
    Left = 0
    Top = 30
    Width = 900
    Height = 25
    Align = alTop
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 2
    object Label1: TLabel
      Left = 8
      Top = 5
      Width = 35
      Height = 13
      Caption = 'Nome:'
    end
    object lbNome: TLabel
      Left = 56
      Top = 5
      Width = 409
      Height = 13
      AutoSize = False
      Caption = 'CLAUDIONOR SILVEIRA'
    end
    object Label3: TLabel
      Left = 480
      Top = 4
      Width = 70
      Height = 13
      Caption = 'C'#243'd. Pessoa:'
    end
    object lbCodigo: TLabel
      Left = 560
      Top = 4
      Width = 81
      Height = 13
      AutoSize = False
      Caption = '000000-0'
    end
  end
  object tblMensalidades: TUMZQuery
    Connection = DM.db
    OnCalcFields = tblMensalidadesCalcFields
    BeforePost = tblMensalidadesBeforePost
    SQL.Strings = (
      'select r.nm_pessoa as nm_resp'
      '     , m.datavencimento'
      '     , m.databasecorrecao'
      '     , m.situacao'
      '     , m.parcela'
      '     , m.cd_mensalidade'
      '     , m.sn_liberar_juros'
      '     , m.sn_liberar_descontos'
      '     , m.valorjuros'
      '     , m.valorjuros_fixo'
      '     , m.valorbruto'
      '     , m.valordesconto'
      '     , m.valorextra'
      '     , m.valorpago'
      '     , m.descontoextra'
      '     , m.valortotal'
      '     , m.turma'
      '     , m.anosemestre'
      '     , m.nr_creditos'
      '     , m.tipoparcela'
      
        '     , GET_ACRESCIMOS(m.cd_mensalidade, NULL ) as juros_calc    ' +
        '       '
      
        '     , GET_DESCONTOS(m.cd_mensalidade, NULL ) as desconto_calc  ' +
        '        '
      ''
      ' from Mensalidades AS m'
      'INNER JOIN Pessoas AS p ON (m.CodigoAluno = p.cd_pessoa ) '
      
        'LEFT JOIN pessoas AS r ON (IFNULL(m.cd_resp, p.cd_resp_finan) = ' +
        'r.cd_pessoa) '
      'LIMIT 10')
    Params = <>
    Left = 288
    Top = 56
    object tblMensalidadesValorTotalCalc: TFloatField
      FieldKind = fkCalculated
      FieldName = 'ValorTotalCalc'
      Calculated = True
    end
    object tblMensalidadesValorJurosCalc: TFloatField
      FieldKind = fkCalculated
      FieldName = 'ValorJurosCalc'
      Calculated = True
    end
    object tblMensalidadesValorDescontoCalc: TCurrencyField
      Tag = 1
      DisplayLabel = 'Desc.Cond.'
      FieldKind = fkCalculated
      FieldName = 'ValorDescontoCalc'
      DisplayFormat = '###,###,##0.00'
      Calculated = True
    end
    object tblMensalidadesdatavencimento: TDateTimeField
      FieldName = 'datavencimento'
    end
    object tblMensalidadesdatabasecorrecao: TDateTimeField
      FieldName = 'databasecorrecao'
    end
    object tblMensalidadessituacao: TSmallintField
      FieldName = 'situacao'
    end
    object tblMensalidadesparcela: TSmallintField
      FieldName = 'parcela'
    end
    object tblMensalidadescd_mensalidade: TIntegerField
      FieldName = 'cd_mensalidade'
    end
    object tblMensalidadessn_liberar_juros: TSmallintField
      FieldName = 'sn_liberar_juros'
    end
    object tblMensalidadessn_liberar_descontos: TSmallintField
      FieldName = 'sn_liberar_descontos'
    end
    object tblMensalidadesvalorjuros: TFloatField
      FieldName = 'valorjuros'
    end
    object tblMensalidadesvalorjuros_fixo: TFloatField
      FieldName = 'valorjuros_fixo'
    end
    object tblMensalidadesvalorbruto: TFloatField
      FieldName = 'valorbruto'
    end
    object tblMensalidadesvalordesconto: TFloatField
      FieldName = 'valordesconto'
    end
    object tblMensalidadesvalorextra: TFloatField
      FieldName = 'valorextra'
    end
    object tblMensalidadesvalorpago: TFloatField
      FieldName = 'valorpago'
    end
    object tblMensalidadesdescontoextra: TFloatField
      FieldName = 'descontoextra'
    end
    object tblMensalidadesturma: TStringField
      FieldName = 'turma'
      Size = 50
    end
    object tblMensalidadesanosemestre: TSmallintField
      FieldName = 'anosemestre'
    end
    object tblMensalidadesnr_creditos: TFloatField
      FieldName = 'nr_creditos'
    end
    object tblMensalidadesvalortotal: TFloatField
      FieldName = 'valortotal'
    end
    object tblMensalidadestipoparcela: TSmallintField
      FieldName = 'tipoparcela'
    end
    object tblMensalidadesnm_resp: TStringField
      FieldName = 'nm_resp'
      Size = 60
    end
    object tblMensalidadesjuros_calc: TFloatField
      FieldName = 'juros_calc'
    end
    object tblMensalidadesdesconto_calc: TFloatField
      FieldName = 'desconto_calc'
    end
  end
  object qryPoupanca: TUMZQuery
    Connection = DM.db
    SQL.Strings = (
      'select Avg( IndicePoupanca ) as Media from Poupanca'
      'where'
      'Data >= :DataInicio and Data <= :DataFim')
    Params = <
      item
        DataType = ftDateTime
        Name = 'DataInicio'
        ParamType = ptUnknown
      end
      item
        DataType = ftDateTime
        Name = 'DataFim'
        ParamType = ptUnknown
      end>
    Left = 256
    Top = 56
    ParamData = <
      item
        DataType = ftDateTime
        Name = 'DataInicio'
        ParamType = ptUnknown
      end
      item
        DataType = ftDateTime
        Name = 'DataFim'
        ParamType = ptUnknown
      end>
    object qryPoupancaMedia: TFloatField
      FieldName = 'Media'
    end
  end
  object qyNegocia: TUMZQuery
    Connection = DM.db
    OnCalcFields = qyNegociaCalcFields
    BeforePost = qyNegociaBeforePost
    SQL.Strings = (
      'SELECT * from fin_negocia'
      'WHERE cd_pessoa = :CdPessoa AND cd_negocia = :CdNegocia')
    Params = <
      item
        DataType = ftInteger
        Name = 'CdPessoa'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'CdNegocia'
        ParamType = ptUnknown
      end>
    Left = 320
    Top = 56
    ParamData = <
      item
        DataType = ftInteger
        Name = 'CdPessoa'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'CdNegocia'
        ParamType = ptUnknown
      end>
    object qyNegociacd_negocia: TLargeintField
      DisplayLabel = 'C'#243'd.'
      FieldName = 'cd_negocia'
      Origin = 'WMESTRE12.fin_negocia.cd_negocia'
    end
    object qyNegociacd_pessoa: TIntegerField
      DisplayLabel = 'C'#243'd. Pessoa'
      FieldName = 'cd_pessoa'
      Origin = 'WMESTRE12.fin_negocia.cd_pessoa'
    end
    object qyNegociads_negocia: TStringField
      DisplayLabel = 'OBS.'
      FieldName = 'ds_negocia'
      Origin = 'WMESTRE12.fin_negocia.ds_negocia'
      Size = 200
    end
    object qyNegociadt_negocia: TDateTimeField
      DisplayLabel = 'Data'
      FieldName = 'dt_negocia'
      Origin = 'WMESTRE12.fin_negocia.dt_negocia'
    end
    object qyNegociavl_bruto_negocia: TFloatField
      DisplayLabel = 'Valor Bruto'
      FieldName = 'vl_bruto_negocia'
      Origin = 'WMESTRE12.fin_negocia.vl_bruto_negocia'
      DisplayFormat = '###,##0.00'
    end
    object qyNegociavl_juros_negocia: TFloatField
      DisplayLabel = 'Juros'
      FieldName = 'vl_juros_negocia'
      Origin = 'WMESTRE12.fin_negocia.vl_juros_negocia'
      OnChange = qyNegociavl_juros_negociaChange
      DisplayFormat = '###,##0.00'
    end
    object qyNegociavl_entrada: TFloatField
      DisplayLabel = 'Entrada'
      FieldName = 'vl_entrada'
      Origin = 'WMESTRE12.fin_negocia.vl_entrada'
      DisplayFormat = '###,##0.00'
    end
    object qyNegociaValLiquido: TCurrencyField
      DisplayLabel = 'L'#237'quido'
      FieldKind = fkCalculated
      FieldName = 'ValLiquido'
      DisplayFormat = '###,##0.00'
      Calculated = True
    end
    object qyNegociaValTotal: TCurrencyField
      DisplayLabel = 'Total'
      FieldKind = fkCalculated
      FieldName = 'ValTotal'
      DisplayFormat = '###,##0.00'
      Calculated = True
    end
    object qyNegociaNomeUsuario: TStringField
      FieldKind = fkCalculated
      FieldName = 'NomeUsuario'
      Size = 30
      Calculated = True
    end
    object qyNegociavl_creditos: TFloatField
      FieldName = 'vl_creditos'
      Origin = 'WMESTRE12.fin_negocia.vl_creditos'
      DisplayFormat = '###,##0.00'
    end
    object qyNegociacd_simulacao: TIntegerField
      FieldName = 'cd_simulacao'
      Origin = 'WMESTRE12.fin_negocia.cd_simulacao'
    end
    object qyNegociaJurosNegociado: TCurrencyField
      FieldKind = fkCalculated
      FieldName = 'JurosNegociado'
      DisplayFormat = '###,##0.00'
      Calculated = True
    end
    object qyNegociavl_desconto_negocia: TFloatField
      FieldName = 'vl_desconto_negocia'
      Origin = 'WMESTRE12.fin_negocia.vl_desconto_negocia'
    end
    object qyNegociacd_usuario: TIntegerField
      FieldName = 'cd_usuario'
    end
  end
  object dsNegocia: TDataSource
    DataSet = qyNegocia
    Left = 352
    Top = 56
  end
  object qyAux: TUMZQuery
    Connection = DM.db
    Params = <>
    Left = 512
    Top = 56
  end
  object qyParcAtual: TUMZQuery
    Connection = DM.db
    SQL.Strings = (
      'SELECT '
      '   m.parcela, m.datavencimento, '
      
        '   (COALESCE(m.valorbruto,0) + COALESCE(m.valorextra,0) - COALES' +
        'CE(m.descontoextra,0)) valor_bruto,'
      '   m.valorjuros,'
      
        '  (COALESCE(m.valorbruto,0) + COALESCE(m.valorextra,0) - COALESC' +
        'E(m.descontoextra,0) + COALESCE(m.valorjuros,0)) valor_total'
      'FROM '
      '   mensalidades m, fin_negocia_parc_atual n'
      'WHERE'
      '  m.cd_mensalidade = n.cd_mensalidade AND '
      '  n.cd_negocia = :cd_negocia')
    Params = <
      item
        DataType = ftInteger
        Name = 'cd_negocia'
        ParamType = ptUnknown
        Size = 4
      end>
    DataSource = dsNegociaAnterior
    Left = 384
    Top = 56
    ParamData = <
      item
        DataType = ftInteger
        Name = 'cd_negocia'
        ParamType = ptUnknown
        Size = 4
      end>
    object qyParcAtualparcela: TSmallintField
      DisplayLabel = 'Parcela'
      FieldName = 'parcela'
    end
    object qyParcAtualdatavencimento: TDateTimeField
      DisplayLabel = 'Vencimento'
      FieldName = 'datavencimento'
    end
    object qyParcAtualvalor_bruto: TFloatField
      DisplayLabel = 'Valor Bruto'
      FieldName = 'valor_bruto'
      DisplayFormat = '###,##0.00'
    end
    object qyParcAtualvalorjuros: TFloatField
      DisplayLabel = 'Valor Juros'
      FieldName = 'valorjuros'
      DisplayFormat = '###,##0.00'
    end
    object qyParcAtualvalor_total: TFloatField
      DisplayLabel = 'Valor Total'
      FieldName = 'valor_total'
      DisplayFormat = '###,##0.00'
    end
  end
  object qyParcNovas: TUMZQuery
    Connection = DM.db
    SQL.Strings = (
      'SELECT '
      '   m.parcela, m.datavencimento, '
      
        '   (COALESCE(m.valorbruto,0) + COALESCE(m.valorextra,0) - COALES' +
        'CE(m.descontoextra,0) - COALESCE(m.valordesconto,0) + COALESCE(I' +
        'F(m.situacao in (2,10), m.valorjuros, m.valorjuros_fixo),0)) val' +
        'or_total,'
      '   m.valorpago, m.datapagamento'
      'FROM '
      '   mensalidades m, fin_negocia_parc_nova n'
      'WHERE'
      '  m.cd_mensalidade = n.cd_mensalidade AND '
      '  n.cd_negocia = :cd_negocia')
    Params = <
      item
        DataType = ftInteger
        Name = 'cd_negocia'
        ParamType = ptUnknown
        Size = 4
      end>
    DataSource = dsNegociaAnterior
    Left = 448
    Top = 56
    ParamData = <
      item
        DataType = ftInteger
        Name = 'cd_negocia'
        ParamType = ptUnknown
        Size = 4
      end>
    object qyParcNovasparcela: TSmallintField
      DisplayLabel = 'Parcela'
      FieldName = 'parcela'
    end
    object qyParcNovasdatavencimento: TDateTimeField
      DisplayLabel = 'Vencimento'
      FieldName = 'datavencimento'
    end
    object qyParcNovasvalor_total: TFloatField
      DisplayLabel = 'Valor Total'
      FieldName = 'valor_total'
      DisplayFormat = '###,##0.00'
    end
    object qyParcNovasvalorpago: TFloatField
      DisplayLabel = 'Valor Pago'
      FieldName = 'valorpago'
      DisplayFormat = '###,##0.00'
    end
    object qyParcNovasdatapagamento: TDateTimeField
      DisplayLabel = 'Data Pgto.'
      FieldName = 'datapagamento'
    end
  end
  object dsParcNova: TDataSource
    AutoEdit = False
    DataSet = qyParcNovas
    Left = 480
    Top = 56
  end
  object dsParcAtual: TDataSource
    AutoEdit = False
    DataSet = qyParcAtual
    Left = 416
    Top = 56
  end
  object spNegocia: TZStoredProc
    Connection = DM.db
    Params = <>
    StoredProcName = 'PROC_COMPETENCIA'
    Left = 224
    Top = 56
  end
  object qyNegociaAnterior: TUMZQuery
    Connection = DM.db
    OnCalcFields = qyNegociaAnteriorCalcFields
    SQL.Strings = (
      
        'SELECT n.*, un.nm_pessoa As nm_usuario_negocia, u.nm_pessoa as n' +
        'm_usuario_simula from '
      '   fin_negocia n '
      '   LEFT JOIN pessoas un ON (n.cd_usuario = un.cd_pessoa)'
      
        '   LEFT JOIN fin_negocia_simula s ON (n.cd_simulacao = s.cd_simu' +
        'lacao)'
      '   LEFT JOIN pessoas u ON (s.cd_usuario = u.cd_pessoa)'
      'WHERE n.cd_pessoa = :cd_pessoa')
    Params = <
      item
        DataType = ftInteger
        Name = 'cd_pessoa'
        ParamType = ptUnknown
      end>
    Left = 544
    Top = 56
    ParamData = <
      item
        DataType = ftInteger
        Name = 'cd_pessoa'
        ParamType = ptUnknown
      end>
    object qyNegociaAnteriords_negocia: TStringField
      DisplayLabel = 'OBS.'
      FieldName = 'ds_negocia'
      Origin = 'WMESTRE12.fin_negocia.ds_negocia'
      Size = 200
    end
    object qyNegociaAnteriorcd_negocia: TLargeintField
      DisplayLabel = 'C'#243'd. Pessoa'
      FieldName = 'cd_negocia'
      Origin = 'WMESTRE12.fin_negocia.cd_negocia'
    end
    object qyNegociaAnteriordt_negocia: TDateTimeField
      DisplayLabel = 'Data'
      FieldName = 'dt_negocia'
      Origin = 'WMESTRE12.fin_negocia.dt_negocia'
    end
    object qyNegociaAnteriorvl_bruto_negocia: TFloatField
      DisplayLabel = 'Valor Bruto'
      FieldName = 'vl_bruto_negocia'
      Origin = 'WMESTRE12.fin_negocia.vl_bruto_negocia'
      DisplayFormat = '###,##0.00'
    end
    object qyNegociaAnteriorvl_juros_negocia: TFloatField
      DisplayLabel = 'Juros'
      FieldName = 'vl_juros_negocia'
      Origin = 'WMESTRE12.fin_negocia.vl_juros_negocia'
      OnChange = qyNegociavl_juros_negociaChange
      DisplayFormat = '###,##0.00'
    end
    object cd_usuario: TSmallintField
      DisplayLabel = 'C'#243'd. Usu'#225'rio'
      FieldName = 'cd_usuario'
      Origin = 'WMESTRE12.fin_negocia.cd_usuario'
    end
    object qyNegociaAnteriorValLiquido: TCurrencyField
      DisplayLabel = 'L'#237'quido'
      FieldKind = fkCalculated
      FieldName = 'ValLiquido'
      DisplayFormat = '###,##0.00'
      Calculated = True
    end
    object qyNegociaAnteriorValTotal: TCurrencyField
      DisplayLabel = 'Total'
      FieldKind = fkCalculated
      FieldName = 'ValTotal'
      DisplayFormat = '###,##0.00'
      Calculated = True
    end
    object qyNegociaAnteriorvl_creditos: TFloatField
      FieldName = 'vl_creditos'
      Origin = 'WMESTRE12.fin_negocia.vl_creditos'
      DisplayFormat = '###,##0.00'
    end
    object qyNegociaAnteriorcd_simulacao: TIntegerField
      FieldName = 'cd_simulacao'
      Origin = 'WMESTRE12.fin_negocia.cd_simulacao'
    end
    object qyNegociaAnteriorJurosNegociado: TCurrencyField
      FieldKind = fkCalculated
      FieldName = 'JurosNegociado'
      DisplayFormat = '###,##0.00'
      Calculated = True
    end
    object qyNegociaAnteriorvl_desconto_negocia: TFloatField
      FieldName = 'vl_desconto_negocia'
      Origin = 'WMESTRE12.fin_negocia.vl_desconto_negocia'
    end
    object qyNegociaAnteriornm_usuario_negocia: TStringField
      FieldName = 'nm_usuario_negocia'
      Size = 30
    end
    object qyNegociaAnteriornm_usuario_simula: TStringField
      FieldName = 'nm_usuario_simula'
      Size = 30
    end
    object qyNegociaAnteriorvl_entrada: TFloatField
      FieldName = 'vl_entrada'
      DisplayFormat = '###,##0.00'
    end
    object qyNegociaAnteriorcd_pessoa: TIntegerField
      FieldName = 'cd_pessoa'
    end
  end
  object dsNegociaAnterior: TDataSource
    DataSet = qyNegociaAnterior
    Left = 576
    Top = 56
  end
end
