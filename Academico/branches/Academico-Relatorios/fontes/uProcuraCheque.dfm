object frmProcuraCheque: TfrmProcuraCheque
  Left = 339
  Top = 272
  BorderIcons = []
  BorderStyle = bsSingle
  Caption = 'Digite os dados do Cheque'
  ClientHeight = 636
  ClientWidth = 533
  Color = clBtnFace
  Font.Charset = ANSI_CHARSET
  Font.Color = clWindowText
  Font.Height = -12
  Font.Name = 'Arial'
  Font.Style = []
  OldCreateOrder = True
  Position = poScreenCenter
  OnCloseQuery = FormCloseQuery
  OnCreate = FormCreate
  OnKeyDown = FormKeyDown
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 15
  object pcBuscar: TPageControl
    Left = 0
    Top = 0
    Width = 533
    Height = 595
    ActivePage = tsBuscarAvancado
    Align = alClient
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Arial'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 0
    object tsBuscar: TTabSheet
      Caption = 'Buscar'
      ImageIndex = 1
      object Label4: TLabel
        Left = 55
        Top = 32
        Width = 82
        Height = 16
        Caption = 'N'#186' do Banco:'
      end
      object Label5: TLabel
        Left = 43
        Top = 73
        Width = 94
        Height = 16
        Caption = 'N'#186' da Ag'#234'ncia:'
      end
      object Label6: TLabel
        Left = 77
        Top = 114
        Width = 60
        Height = 16
        Caption = 'N'#186' da CC:'
      end
      object Label7: TLabel
        Left = 46
        Top = 155
        Width = 91
        Height = 16
        Caption = 'N'#186' do Cheque:'
      end
      object Label9: TLabel
        Left = 43
        Top = 196
        Width = 94
        Height = 16
        Caption = 'Compensa'#231#227'o:'
      end
      object txtCheque_Banco: TEdit
        Left = 156
        Top = 30
        Width = 146
        Height = 24
        TabOrder = 0
        OnKeyPress = txtValor
      end
      object txtCheque_Agencia: TEdit
        Left = 156
        Top = 69
        Width = 146
        Height = 24
        TabOrder = 1
        OnKeyPress = txtValor
      end
      object txtCheque_CC: TEdit
        Left = 156
        Top = 111
        Width = 146
        Height = 24
        TabOrder = 2
        OnKeyPress = txtValor
      end
      object txtCheque_nro: TEdit
        Left = 156
        Top = 152
        Width = 146
        Height = 24
        TabOrder = 3
        OnKeyPress = txtValor
      end
      object txtCheque_Data: TMaskEdit
        Left = 156
        Top = 194
        Width = 146
        Height = 24
        EditMask = '!99/99/00;1;_'
        MaxLength = 8
        TabOrder = 4
        Text = '  /  /  '
        OnKeyPress = txtValor
      end
    end
    object tsBuscarAvancado: TTabSheet
      Caption = 'Buscar'
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = []
      ImageIndex = 2
      ParentFont = False
      object Label12: TLabel
        Left = 0
        Top = 9
        Width = 109
        Height = 13
        Alignment = taRightJustify
        Caption = 'Dados Acad'#234'micos:'
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object Label13: TLabel
        Left = 8
        Top = 35
        Width = 47
        Height = 13
        Alignment = taRightJustify
        Caption = 'Ano/Sem:'
      end
      object Label15: TLabel
        Left = 137
        Top = 35
        Width = 31
        Height = 13
        Alignment = taRightJustify
        Caption = 'Aluno:'
      end
      object sbBuscaAluno: TSpeedButton
        Left = 276
        Top = 31
        Width = 23
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
        OnClick = sbBuscaAlunoClick
      end
      object Label18: TLabel
        Left = 0
        Top = 424
        Width = 52
        Height = 13
        Alignment = taRightJustify
        Caption = 'Situa'#231#227'o:'
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object Label19: TLabel
        Left = 23
        Top = 93
        Width = 33
        Height = 13
        Caption = 'Banco:'
      end
      object Label20: TLabel
        Left = 187
        Top = 94
        Width = 42
        Height = 13
        Caption = 'Ag'#234'ncia:'
      end
      object Label21: TLabel
        Left = 168
        Top = 126
        Width = 61
        Height = 13
        Caption = 'C. Corrente:'
      end
      object Label22: TLabel
        Left = 2
        Top = 124
        Width = 55
        Height = 13
        Caption = 'N. Cheque:'
      end
      object Label23: TLabel
        Left = 0
        Top = 65
        Width = 100
        Height = 13
        Alignment = taRightJustify
        Caption = 'Dados do Cheque:'
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object Label16: TLabel
        Left = 0
        Top = 229
        Width = 126
        Height = 13
        Alignment = taRightJustify
        Caption = 'Data de Compensa'#231#227'o'
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object lblDataAte: TLabel
        Left = 159
        Top = 252
        Width = 16
        Height = 13
        Alignment = taRightJustify
        Caption = 'at'#233
      end
      object Label30: TLabel
        Left = 0
        Top = 476
        Width = 36
        Height = 13
        Alignment = taRightJustify
        Caption = 'Conta:'
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object lblEmissaoAte: TLabel
        Left = 159
        Top = 300
        Width = 16
        Height = 13
        Alignment = taRightJustify
        Caption = 'at'#233
      end
      object Label32: TLabel
        Left = 0
        Top = 277
        Width = 93
        Height = 13
        Caption = 'Data de Emiss'#227'o'
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object FLbTitVlCheque: TLabel
        Left = 0
        Top = 154
        Width = 93
        Height = 13
        Alignment = taRightJustify
        Caption = 'Valor do cheque:'
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object Label33: TLabel
        Left = 314
        Top = 35
        Width = 34
        Height = 13
        Alignment = taRightJustify
        Caption = 'Titular:'
      end
      object sbBuscaTitular: TSpeedButton
        Left = 456
        Top = 31
        Width = 23
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
        OnClick = sbBuscaTitularClick
      end
      object Label34: TLabel
        Left = 0
        Top = 322
        Width = 55
        Height = 13
        Caption = 'Unidades:'
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object sbTodasUnidades: TSpeedButton
        Left = 340
        Top = 341
        Width = 23
        Height = 22
        Hint = 'Marcar todas as unidades'
        Flat = True
        Glyph.Data = {
          42040000424D4204000000000000420000002800000010000000100000000100
          20000300000000040000C20E0000C20E00000000000000000000000000FF0000
          FF0000FF0000FFFFFFFFFF9C9C9CFF9C9C9CFF9C9C9CFF9C9C9CFF9C9C9CFF9C
          9C9CFF9C9C9CFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFF9C9C9CFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFF9C9C9CFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFF9C9C9CFFFFFFFFFFFFFFFFFF010101FFFFFFFFFFFF
          FFFFFF9C9C9CFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFF9C9C9CFFFFFFFFFF000000FFF4F4F4FF010101FFFF
          FFFFFF9C9C9CFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFF9C9C9CFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF00
          0000FF9C9C9CFFFFFFFFFF9C9C9CFF9C9C9CFF9C9C9CFF9C9C9CFF9C9C9CFF9C
          9C9CFF9C9C9CFFFFFFFFFF9C9C9CFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFF9C9C9CFFFFFFFFFF9C9C9CFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFF9A9A9AFFFFFFFFFF9C9C9CFF9C9C9CFF9C9C9CFF9C9C9CFF9C9C9CFF9C
          9C9CFF9C9C9CFFFFFFFFFF9C9C9CFFFFFFFFFFFFFFFFFF010101FFFFFFFFFFFF
          FFFFFF9A9A9AFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFF9C9C9CFFFFFFFFFF000000FFF4F4F4FF010101FFFF
          FFFFFF9F9F9FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFF9C9C9CFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF00
          0000FF999999FFFFFFFFFF9C9C9CFF9C9C9CFF9C9C9CFF9C9C9CFF9C9C9CFF9C
          9C9CFF9C9C9CFFFFFFFFFF9C9C9CFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFF9C9C9CFFFFFFFFFF9C9C9CFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFF9C9C9CFFFFFFFFFF9C9C9CFF9C9C9CFF9C9C9CFF9C9C9CFF9C9C9CFF9C
          9C9CFF9C9C9CFFFFFFFFFF9C9C9CFFFFFFFFFFFFFFFFFF010101FFFFFFFFFFFF
          FFFFFF9C9C9CFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFF9C9C9CFFFFFFFFFF000000FFF4F4F4FF010101FFFF
          FFFFFF9C9C9CFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFF9C9C9CFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF00
          0000FF9C9C9CFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFF9C9C9CFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFF9C9C9CFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFF9C9C9CFF9C9C9CFF9C9C9CFF9C9C9CFF9C9C9CFF9C
          9C9CFF9C9C9CFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFF}
        ParentShowHint = False
        ShowHint = True
        OnClick = sbTodasUnidadesClick
      end
      object sbNenhumaUnidade: TSpeedButton
        Left = 340
        Top = 369
        Width = 23
        Height = 22
        Hint = 'Desmarcar todas as unidades'
        Flat = True
        Glyph.Data = {
          36030000424D3603000000000000360000002800000010000000100000000100
          18000000000000030000C30E0000C30E00000000000000000000FFFFFF9E9E9E
          9E9E9E9E9E9E9E9E9E9E9E9E9E9E9E9E9E9EFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFF9E9E9EFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF9E
          9E9EFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF9E9E9E
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFF9E9E9EFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFF9E9E9EFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF9E
          9E9EFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF9E9E9E
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFF9E9E9EFFFFFF9E9E9E9E9E9E9E9E9E9E9E
          9E9E9E9E9E9E9E9E9E9EFFFFFF9E9E9EFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF9E
          9E9EFFFFFF9E9E9EFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF9E9E9EFFFFFF9E9E9E
          9E9E9E9E9E9E9E9E9E9E9E9E9E9E9E9E9E9EFFFFFF9E9E9EFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFF9E9E9EFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFF9E9E9EFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF9E9E9EFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF9E9E9EFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFF9E9E9EFFFFFF9E9E9E9E9E9E9E9E9E9E9E9E9E9E9E9E9E9E9E
          9E9EFFFFFF9E9E9EFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF9E9E9EFFFFFF9E9E9E
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFF9E9E9EFFFFFF9E9E9E9E9E9E9E9E9E9E9E
          9E9E9E9E9E9E9E9E9E9EFFFFFF9E9E9EFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF9E
          9E9EFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF9E9E9E
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFF9E9E9EFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFF9E9E9EFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF9E
          9E9EFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF9E9E9E
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFF9E9E9EFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFF9E9E9E9E9E9E9E9E9E9E9E9E9E9E9E9E9E9E9E
          9E9EFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF}
        ParentShowHint = False
        ShowHint = True
        OnClick = sbNenhumaUnidadeClick
      end
      object mskAnoSem: TMaskEdit
        Tag = 1
        Left = 61
        Top = 31
        Width = 48
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
        Text = '20051'
      end
      object udAnoSem: TUpDown
        Left = 110
        Top = 31
        Width = 13
        Height = 21
        TabOrder = 14
        OnClick = udAnoSemClick
      end
      object txtAluno: TEdit
        Left = 173
        Top = 31
        Width = 103
        Height = 21
        CharCase = ecUpperCase
        ReadOnly = True
        TabOrder = 1
      end
      object cbListaSituacao: TComboBox
        Left = 19
        Top = 443
        Width = 468
        Height = 29
        Style = csDropDownList
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -17
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ItemHeight = 21
        ParentFont = False
        TabOrder = 12
      end
      object edABanco: TEdit
        Left = 61
        Top = 89
        Width = 100
        Height = 21
        TabOrder = 2
        OnKeyPress = txtValor
      end
      object edAAgencia: TEdit
        Left = 234
        Top = 89
        Width = 100
        Height = 21
        TabOrder = 3
        OnKeyPress = txtValor
      end
      object edACheque: TEdit
        Left = 61
        Top = 121
        Width = 100
        Height = 21
        TabOrder = 4
        OnKeyPress = txtValor
      end
      object edACCorrente: TEdit
        Left = 234
        Top = 121
        Width = 100
        Height = 21
        TabOrder = 5
        OnKeyPress = txtValor
      end
      object ckbData: TCheckBox
        Left = 23
        Top = 251
        Width = 37
        Height = 17
        Caption = 'De:'
        TabOrder = 10
        OnClick = ckbDataClick
      end
      object cbListaConta: TComboBox
        Left = 19
        Top = 498
        Width = 468
        Height = 29
        Style = csDropDownList
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -17
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ItemHeight = 21
        ParentFont = False
        TabOrder = 13
      end
      object ckbEmissao: TCheckBox
        Left = 23
        Top = 299
        Width = 37
        Height = 17
        Caption = 'De:'
        TabOrder = 11
        OnClick = ckbEmissaoClick
      end
      object FCbVlMenorIgual: TCheckBox
        Left = 21
        Top = 204
        Width = 103
        Height = 17
        Caption = 'Menor ou igual '#224':'
        TabOrder = 8
        OnClick = habilitaFiltroValor
      end
      object FCbVlMaiorIgual: TCheckBox
        Left = 21
        Top = 173
        Width = 103
        Height = 17
        Caption = 'Maior ou igual '#224':'
        TabOrder = 6
        OnClick = habilitaFiltroValor
      end
      object FEdVlMenorIgual: TEdit
        Left = 130
        Top = 202
        Width = 107
        Height = 21
        Enabled = False
        TabOrder = 9
        OnExit = fimDigitacaoValor
        OnKeyPress = recebeValorCheque
      end
      object FEdVlMaiorIgual: TEdit
        Left = 130
        Top = 171
        Width = 107
        Height = 21
        Enabled = False
        ParentShowHint = False
        ShowHint = False
        TabOrder = 7
        OnExit = fimDigitacaoValor
        OnKeyPress = recebeValorCheque
      end
      object txtnm_titular: TEdit
        Left = 354
        Top = 31
        Width = 103
        Height = 21
        CharCase = ecUpperCase
        ReadOnly = True
        TabOrder = 15
      end
      object umdtVencInicial: TUMDateTimePicker
        Left = 63
        Top = 248
        Width = 90
        Height = 21
        BevelOuter = bvNone
        TabOrder = 16
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
        Date = 42591.000000000000000000
        InverterPosicaoCalendario = False
        MostraCalenadarioDesdeCampoTexto = False
      end
      object umdtVencFinal: TUMDateTimePicker
        Left = 181
        Top = 248
        Width = 90
        Height = 21
        BevelOuter = bvNone
        TabOrder = 17
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
        Date = 42591.000000000000000000
        InverterPosicaoCalendario = False
        MostraCalenadarioDesdeCampoTexto = False
      end
      object umdtEmissaoDe: TUMDateTimePicker
        Left = 63
        Top = 296
        Width = 90
        Height = 21
        BevelOuter = bvNone
        TabOrder = 18
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
        Date = 42591.000000000000000000
        InverterPosicaoCalendario = False
        MostraCalenadarioDesdeCampoTexto = False
      end
      object umdtEmissaoAte: TUMDateTimePicker
        Left = 181
        Top = 296
        Width = 90
        Height = 21
        BevelOuter = bvNone
        TabOrder = 19
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
        Date = 42591.000000000000000000
        InverterPosicaoCalendario = False
        MostraCalenadarioDesdeCampoTexto = False
      end
      object clbUnidades: TCheckListBox
        Left = 19
        Top = 341
        Width = 315
        Height = 77
        ItemHeight = 13
        TabOrder = 20
      end
      object chkMostrarCaixasInativos: TCheckBox
        Left = 0
        Top = 539
        Width = 464
        Height = 17
        Caption = 
          'Buscar cheques sem v'#237'nculo com os caixas ou vinculado a caixas i' +
          'nativos'
        Checked = True
        State = cbChecked
        TabOrder = 21
      end
    end
    object tsIncAlt: TTabSheet
      Caption = 'Inclus'#227'o/Altera'#231#227'o'
      ImageIndex = 2
      object Label8: TLabel
        Left = 26
        Top = 247
        Width = 45
        Height = 14
        Alignment = taRightJustify
        Caption = 'Situa'#231#227'o:'
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
      end
      object Label10: TLabel
        Left = 37
        Top = 110
        Width = 34
        Height = 14
        Caption = 'Banco:'
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
      end
      object Label11: TLabel
        Left = 28
        Top = 75
        Width = 43
        Height = 14
        Caption = 'Ag'#234'ncia:'
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
      end
      object Label14: TLabel
        Left = 13
        Top = 144
        Width = 58
        Height = 14
        Caption = 'C. Corrente:'
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
      end
      object Label17: TLabel
        Left = 18
        Top = 38
        Width = 53
        Height = 14
        Caption = 'N. Cheque:'
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
      end
      object Label24: TLabel
        Left = 9
        Top = 9
        Width = 100
        Height = 13
        Alignment = taRightJustify
        Caption = 'Dados do Cheque:'
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object Label26: TLabel
        Left = -110
        Top = 242
        Width = 45
        Height = 14
        Alignment = taRightJustify
        Caption = 'Situa'#231#227'o:'
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
      end
      object Label1: TLabel
        Left = 42
        Top = 176
        Width = 28
        Height = 14
        Caption = 'Valor:'
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
      end
      object Label2: TLabel
        Left = -1
        Top = 212
        Width = 72
        Height = 14
        Caption = 'Compensa'#231#227'o:'
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
      end
      object btnCodigoAluno: TSpeedButton
        Left = 482
        Top = 68
        Width = 23
        Height = 24
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
        OnClick = btnCodigoAlunoClick
      end
      object Label3: TLabel
        Left = 252
        Top = 51
        Width = 90
        Height = 14
        Caption = 'C'#243'digo da Pessoa:'
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
      end
      object Label25: TLabel
        Left = 252
        Top = 121
        Width = 178
        Height = 14
        Caption = 'Associar o cheque com as parcelas:'
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
      end
      object Label27: TLabel
        Left = 2
        Top = 349
        Width = 69
        Height = 14
        Caption = 'Observa'#231#245'es:'
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
      end
      object Label28: TLabel
        Left = 253
        Top = 99
        Width = 30
        Height = 14
        Caption = 'Nome:'
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
      end
      object lbNome: TLabel
        Left = 289
        Top = 99
        Width = 3
        Height = 14
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
      end
      object Label29: TLabel
        Left = 40
        Top = 282
        Width = 31
        Height = 14
        Alignment = taRightJustify
        Caption = 'Conta:'
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
      end
      object lbPessoa: TLabel
        Left = 253
        Top = 9
        Width = 206
        Height = 42
        Caption = 
          'Selecione um c'#243'digo de pessoa para relacionar o cheque com um t'#237 +
          'tulo j'#225' baixado.'
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        ParentFont = False
        WordWrap = True
      end
      object Label31: TLabel
        Left = 39
        Top = 316
        Width = 32
        Height = 14
        Alignment = taRightJustify
        Caption = 'Titular:'
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
      end
      object edIBanco: TEdit
        Left = 77
        Top = 105
        Width = 148
        Height = 24
        TabOrder = 2
        OnKeyPress = txtValor
      end
      object edIAgencia: TEdit
        Left = 77
        Top = 70
        Width = 148
        Height = 24
        TabOrder = 1
        OnKeyPress = txtValor
      end
      object edINumero: TEdit
        Left = 77
        Top = 33
        Width = 148
        Height = 24
        TabOrder = 0
        OnKeyPress = txtValor
      end
      object edIConta: TEdit
        Left = 77
        Top = 139
        Width = 148
        Height = 24
        TabOrder = 3
        OnKeyPress = txtValor
      end
      object edIValor: TEdit
        Left = 77
        Top = 173
        Width = 148
        Height = 24
        TabOrder = 4
        OnKeyPress = edIValorKePress
      end
      object cbISituacao: TComboBox
        Left = 77
        Top = 242
        Width = 148
        Height = 21
        Style = csDropDownList
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ItemHeight = 13
        ParentFont = False
        TabOrder = 5
      end
      object clbParcelas: TCheckListBox
        Left = 252
        Top = 138
        Width = 253
        Height = 125
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -12
        Font.Name = 'Courier New'
        Font.Style = []
        ItemHeight = 15
        Items.Strings = (
          'Parc. num dd/mm/AAAA valor')
        ParentFont = False
        TabOrder = 6
        OnEnter = clbParcelasEnter
      end
      object edAluno: TEdit
        Left = 252
        Top = 68
        Width = 227
        Height = 24
        TabOrder = 7
        OnKeyPress = txtValor
      end
      object mmObservacoes: TMemo
        Left = 77
        Top = 345
        Width = 428
        Height = 78
        TabOrder = 8
      end
      object cbContas: TComboBox
        Left = 77
        Top = 277
        Width = 428
        Height = 22
        Style = csOwnerDrawFixed
        ItemHeight = 16
        TabOrder = 9
      end
      object Ednm_titular: TEdit
        Left = 77
        Top = 311
        Width = 428
        Height = 24
        TabOrder = 10
      end
      object umdtCompensacao: TUMDateTimePicker
        Left = 77
        Top = 208
        Width = 148
        Height = 21
        BevelOuter = bvNone
        TabOrder = 11
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
        Date = 42591.000000000000000000
        InverterPosicaoCalendario = False
        MostraCalenadarioDesdeCampoTexto = False
      end
    end
  end
  object Panel1: TPanel
    Left = 0
    Top = 595
    Width = 533
    Height = 41
    Align = alBottom
    TabOrder = 1
    object btnOk: TBitBtn
      Left = 143
      Top = 8
      Width = 114
      Height = 25
      Caption = 'Ok'
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Arial'
      Font.Style = []
      ParentFont = False
      TabOrder = 0
      OnClick = btnOkClick
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
    object btnCancel: TBitBtn
      Left = 272
      Top = 8
      Width = 112
      Height = 25
      Cancel = True
      Caption = 'Cancelar'
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Arial'
      Font.Style = []
      ParentFont = False
      TabOrder = 1
      OnClick = btnCancelClick
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
  object qyParcelas: TUMZQuery
    Connection = DM.db
    SQL.Strings = (
      'SELECT'
      '   M.CD_MENSALIDADE,'
      '   M.PARCELA,'
      '   M.DATAPAGAMENTO,'
      '   M.VALORPAGO,'
      '   C.CD_CHEQUE'
      'FROM'
      '   MENSALIDADES M'
      '      LEFT JOIN FIN_CHEQUES_MENSALIDADES C ON'
      '         (M.CD_MENSALIDADE = C.CD_MENSALIDADE) AND'
      '         (C.CD_CHEQUE = :CHEQUE)'
      'WHERE'
      '   M.SITUACAO IN (0,1) AND'
      '   M.CODIGOALUNO = :ALUNO AND'
      '   M.CD_COLIGADA IN ( %s )'
      'ORDER BY'
      '   M.DATAPAGAMENTO DESC,'
      '   M.PARCELA ASC')
    Params = <
      item
        DataType = ftLargeint
        Name = 'cheque'
        ParamType = ptUnknown
      end
      item
        DataType = ftLargeint
        Name = 'aluno'
        ParamType = ptUnknown
      end>
    Left = 496
    Top = 58
    ParamData = <
      item
        DataType = ftLargeint
        Name = 'cheque'
        ParamType = ptUnknown
      end
      item
        DataType = ftLargeint
        Name = 'aluno'
        ParamType = ptUnknown
      end>
  end
end
