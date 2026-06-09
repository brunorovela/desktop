object frmMensalidadeAplicarDescontos: TfrmMensalidadeAplicarDescontos
  Left = 0
  Top = 0
  BorderStyle = bsDialog
  Caption = 'Desconto'
  ClientHeight = 525
  ClientWidth = 977
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
  object pnDescontos: TPanel
    Left = 0
    Top = 127
    Width = 489
    Height = 398
    Align = alLeft
    TabOrder = 3
    object lbValorInfoValorBruto: TLabel
      Left = 48
      Top = 73
      Width = 164
      Height = 13
      Caption = 'Valor bruto da parcela selecionada'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
    end
    object lbValorBruto: TLabel
      Left = 432
      Top = 73
      Width = 33
      Height = 13
      Alignment = taRightJustify
      Caption = '900,00'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
    end
    object lbInfoDescAplicados: TLabel
      Left = 21
      Top = 95
      Width = 146
      Height = 13
      Caption = 'Descontos aplicados a parcela'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
    end
    object lbDescAplicados: TLabel
      Left = 432
      Top = 95
      Width = 33
      Height = 13
      Alignment = taRightJustify
      Caption = '400,00'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
    end
    object blBruto: TBevel
      Left = 21
      Top = 87
      Width = 445
      Height = 1
      Style = bsRaised
    end
    object blDescontos: TBevel
      Left = 21
      Top = 109
      Width = 445
      Height = 1
      Style = bsRaised
    end
    object blLiquidoAntes: TBevel
      Left = 21
      Top = 320
      Width = 445
      Height = 1
      Style = bsRaised
    end
    object lbInfoLiquidoAntes: TLabel
      Left = 21
      Top = 305
      Width = 281
      Height = 13
      Caption = 'Valor l'#237'quido da parcela (antes dos descontos condicionais)'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
    end
    object lbLiquidoAntes: TLabel
      Left = 432
      Top = 305
      Width = 33
      Height = 13
      Alignment = taRightJustify
      Caption = '700,00'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
    end
    object blLiquidoApos: TBevel
      Left = 21
      Top = 345
      Width = 445
      Height = 1
      Style = bsRaised
    end
    object lbInfoApos: TLabel
      Left = 21
      Top = 330
      Width = 272
      Height = 13
      Caption = 'Valor l'#237'quido da parcela (ap'#243's os descontos condicionais)'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
    end
    object lbLiquidoApos: TLabel
      Left = 432
      Top = 330
      Width = 33
      Height = 13
      Alignment = taRightJustify
      Caption = '500,00'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
    end
    object umInfoParcelas: TUMAjuda
      Left = 21
      Top = 64
      Width = 24
      Height = 24
      Picture.Data = {
        055449636F6E0000010001001818000001002000880900001600000028000000
        1800000030000000010020000000000000090000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000100000005
        0000000B0000000F000000100000001100000010000000100000001100000010
        0000000F0000000B000000050000000100000000000000000000000000000000
        0000000000000000000000000000000000000000000000010000000700000018
        0000002C251800455940006E6A4E008575560093755600936A4E00855940006E
        251800450000002C000000180000000700000001000000000000000000000000
        0000000000000000000000000000000000000000000000010000000D39290042
        7053039B946E07D3B88B17EEC89A22FBD2A32AFED2A32AFEC89A22FBB88B17EE
        946E07D37053039B392900420000000D00000001000000000000000000000000
        00000000000000000000000000000000795700007856000A825F015BA17A0DC2
        C79D22FBDFB538FFE0B63BFFDDB33BFFDBB13CFFDBB13CFFDDB33BFFE0B63BFF
        DFB538FFC79D22FBA17A0DC2825F015B7856000A795700000000000000000000
        000000000000000000000000866700008165000A8E6B006EAD8715ECD4AF34FF
        DCB63FFFD3A738FFCC9A33FFC89330FFC6902FFFC7902FFFC89431FFCC9B33FF
        D3A738FFDCB63FFFD4AF34FFAD8715EC8E6B006E8165000A8667000000000000
        000000000000000084630000000000008B680054AC8917EBD4B43AFFD7B13FFF
        CD9C36FFC79230FFBD8824FFB9851EFFBD8724FFC38C29FFC6902FFFC79131FF
        C89332FFCC9C36FFD7B13FFFD4B43AFFAC8917EB8B6800540000000084630000
        0000000000000000946E01008560001AA37F11B6CEAE3AFFD7B243FFCE9C38FF
        CA9434FFC28C2CFFD0B17BFFE9DCC5FFDBC49EFFC19644FFC08B2AFFC99333FF
        CA9435FFCA9435FFCE9C38FFD7B243FFCEAE3AFFA37F11B68560001A946E0100
        0000000000000000FFE15E00906E0470BB9A2AF8D8B649FFD2A43FFFCD9938FF
        CC9737FFC18D2BFFE2CFB0FFFFFFFFFFFDFBF9FFE0CDAEFFCAA564FFC59131FF
        CC9737FFCC9738FFCD9938FFD2A43FFFD8B649FFBB9A2AF8906E0470FFE15E00
        000000008665000084630015A07E11BED1B145FFD9B148FFD2A13EFFCF9B3BFF
        CF9B3BFFC79332FFD4B782FFFFFFFFFFFBF9F6FFD1B47FFFCFB076FFC2963EFF
        CB9735FFCF9B3BFFCF9B3BFFD2A13EFFD9B148FFD1B145FFA07E11BE84630015
        866500008B6700008A660046B5942CE4DAB853FFDAB14CFFD4A441FFD29F3EFF
        D29F3EFFCF9A37FFCAA04CFFF6F0E7FFFFFFFFFFE3CFA9FFBC8A25FFC79431FF
        D19E3DFFD29F3EFFD29F3EFFD4A441FFDAB14CFFDAB853FFB5942CE48A660046
        8B6700008C6700008C670068C3A545F8E3C469FFDFB95FFFDAAE52FFD7A649FF
        D5A342FFD4A140FFCB9A3BFFE4D1ACFFFFFFFFFFF2E9DAFFCCA14FFFD29F3BFF
        D5A342FFD5A343FFD7A649FFDAAE52FFDFB95FFFE3C469FFC3A545F88C670068
        8C6700008B6700008B67007ACCB154FFE8CA70FFE3BF67FFDFB761FFDDB25BFF
        DBAD55FFD3A243FFC4932DFFD6B675FFFBF9F5FFFDFCFBFFD7B97BFFCF9C37FF
        DAAA4FFFDBAD55FFDDB25BFFDFB761FFE3BF67FFE8CA70FFCCB154FF8B67007A
        8B6700008B6700008B67007AD1B862FFEDD27AFFE7C66DFFE3BE68FFE1B864FF
        E0B561FFD3A64BFFD7B87CFFD0AD6AFFF1E7D5FFFFFFFFFFE7D6B5FFD2A54EFF
        DEB25CFFE0B561FFE1B864FFE3BE68FFE7C66DFFEDD27AFFD1B862FF8B67007A
        8B6700008C6700008C680068D2BD71F8F0DA86FFEBCE75FFE8C66FFFE5BF6AFF
        E3BB67FFDDB258FFD3AA59FFDCC28DFFF5EDE0FFFFFFFFFFF0E4CFFFD5AD5CFF
        E1B660FFE3BB67FFE5BF6AFFE8C66FFFEBCE75FFF0DA86FFD2BD71F88C680068
        8C6700008B6700008B670046CCB770E4F2E095FFEFD67EFFECCF77FFEAC872FF
        E8C36EFFE7C06AFFDFB459FFD7AE54FFDBBD7CFFE3CEA3FFD9BB7CFFD8AD50FF
        E5BE66FFE8C36EFFEAC872FFECCF77FFEFD67EFFF2E095FFCCB770E48B670046
        8B6700008665000083610015AF9544BDF0E2A9FFF4E08EFFF0D881FFEED27BFF
        ECCD76FFEBC872FFEAC670FFE7C169FFDEB557FFD8BA73FFE6D4ACFFDABD75FF
        DFBA5CFFECCC76FFEED27BFFF0D880FFF4E08EFFF0E2A9FFAF9544BD83610015
        8665000000000000FFFFFF009675156ED6C48AF8F9EBAFFFF4E18DFFF2DB85FF
        F1D681FFEFD27DFFEECF7AFFEDCD78FFE1BF66FFECDEBAFFFFFFFFFFF6EFDEFF
        DDBF63FFF0D680FFF2DB85FFF4E18CFFF9EBAFFFD6C48AF89675156EFFFFFF00
        000000000000000099781C00845C001AB2974AB6EEE3B6FFFAEDAFFFF6E492FF
        F5E08CFFF3DC89FFF2D986FFF2D883FFEACE75FFE3CE8CFFF6F1DEFFEFE4BEFF
        E5CD73FFF5E08CFFF6E492FFFAEDAFFFEEE3B6FFB2974AB6845C001A99781C00
        000000000000000083600000000000008D6B0554BCA65DEBF3EBC6FFFBF1BAFF
        F8E99DFFF7E593FFF6E391FFF6E290FFF5DF8CFFECD67DFFE5D078FFE9D47BFF
        F4E28CFFF8E99DFFFBF1BAFFF3EBC6FFBCA65DEB8D6B05540000000083600000
        000000000000000000000000866600007E5F000A9272116EBBA55DECEEE5C1FF
        FCF5CCFFFBF0B6FFFAEDA7FFF9EAA0FFF9E99AFFF9E99AFFF9EA9FFFFAEDA7FF
        FBF0B6FFFCF5CCFFEEE5C1FFBBA55DEC9272116E7E5F000A8666000000000000
        0000000000000000000000000000000084600000825D00098D690750B39B53B5
        D9CCA1F8F3ECCDFFFAF4D1FFFDF6CFFFFEF7CCFFFEF7CCFFFDF6CFFFFAF4D1FF
        F3ECCDFFDBCDA1F8B39C54B68C690750825D0009846000000000000000000000
        000000000000000000000000000000000000000062350000FFFF3D00845F0B1A
        96761970AB9146BACDBD8AE2D9CCA0F5DCCFA4FDDCCFA4FDD9CCA0F5CDBD8AE2
        AB9146BB97761972855F0B1BFFFB3B0062350000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        8F6900008260000F8A6600428C6800628C6700788C6700788C6800628A660042
        8260000F8F690000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        00000000F0000F00F0000F00F0000F00F0000F00E0000700C0000300C0000300
        C000030080000100800001008000010080000100800001008000010080000100
        80000100C0000300C0000300C0000300E0000700F0000F00FC003F00FF00FF00
        FFFFFF00}
      Transparent = True
      Visible = False
      Caption = 
        'Mesmo selecionando v'#225'rias parcelas, os valores apresentados e c'#225 +
        'lculos ser'#227'o baseados na parcela selecionada.'
      Titulo = 'Intervalo de parcelas'
      PanelWidth = 100
    end
    object lbInfoGrid: TLabel
      Left = 227
      Top = 284
      Width = 238
      Height = 14
      Caption = 'clique com o bot'#227'o direto para excluir um desconto.'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Times New Roman'
      Font.Style = []
      ParentFont = False
    end
    object sbAdicionarDesconto: TSpeedButton
      Left = 21
      Top = 360
      Width = 124
      Height = 25
      AllowAllUp = True
      GroupIndex = 1
      Caption = 'Adicionar desconto'
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
      OnClick = sbAdicionarDescontoClick
    end
    object lblDescontoCustomizado: TLabel
      Left = 21
      Top = 117
      Width = 223
      Height = 13
      Caption = 'Regra de desconto programada pela institui'#231#227'o'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
      Visible = False
    end
    object bvlDescontoCustomizado: TBevel
      Left = 21
      Top = 131
      Width = 445
      Height = 1
      Style = bsRaised
      Visible = False
    end
    object lblDescontoCustomizadoValor: TLabel
      Left = 432
      Top = 117
      Width = 33
      Height = 13
      Alignment = taRightJustify
      Caption = '000,00'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
      Visible = False
    end
    object gbAplicar: TGroupBox
      Left = 21
      Top = 12
      Width = 444
      Height = 45
      Caption = ' Aplicar sobre '
      TabOrder = 0
      object lbAte: TLabel
        Left = 379
        Top = 19
        Width = 15
        Height = 13
        Caption = 'at'#233
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
      end
      object rbParcelaSelecionada: TRadioButton
        Left = 10
        Top = 18
        Width = 113
        Height = 17
        Caption = 'Parcela selecionada'
        Checked = True
        TabOrder = 0
        TabStop = True
        OnClick = rbParcelaSelecionadaClick
      end
      object rbVariasParcelas: TRadioButton
        Left = 235
        Top = 18
        Width = 106
        Height = 17
        Caption = 'V'#225'rias parcelas de'
        TabOrder = 1
        OnClick = rbVariasParcelasClick
      end
      object edParcelaInicial: TUMEditNumerico
        Left = 344
        Top = 16
        Width = 31
        Height = 21
        TabOrder = 2
        Text = '0'
        OnChange = informadaParcela
      end
      object edParcelaFinal: TUMEditNumerico
        Left = 399
        Top = 16
        Width = 31
        Height = 21
        TabOrder = 3
        Text = '0'
        OnChange = informadaParcela
      end
    end
    object dbgDescontos: TDBGrid
      Left = 22
      Top = 140
      Width = 444
      Height = 142
      Hint = 'Utilize o bot'#227'o direito do mouse para excluir algum desconto'
      DataSource = dsDescontos
      Options = [dgTitles, dgColumnResize, dgRowLines, dgTabs, dgRowSelect, dgConfirmDelete, dgCancelOnExit]
      PopupMenu = pmDescontos
      TabOrder = 1
      TitleFont.Charset = DEFAULT_CHARSET
      TitleFont.Color = clWindowText
      TitleFont.Height = -11
      TitleFont.Name = 'Tahoma'
      TitleFont.Style = []
      Columns = <
        item
          Expanded = False
          FieldName = 'ds_acao'
          Title.Caption = 'Movimento'
          Width = 260
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'ds_tipo'
          Title.Caption = 'Tipo'
          Width = 80
          Visible = True
        end
        item
          Alignment = taRightJustify
          Expanded = False
          FieldName = 'vl_desconto_apresentado'
          Title.Caption = 'Valor'
          Width = 80
          Visible = True
        end>
    end
    object btFechar: TBitBtn
      Left = 386
      Top = 360
      Width = 80
      Height = 25
      Cancel = True
      Caption = 'Fechar'
      TabOrder = 2
      OnClick = btFecharClick
      Glyph.Data = {
        36040000424D3604000000000000360000002800000010000000100000000100
        2000000000000004000000000000000000000000000000000000FF00FF00FF00
        FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
        FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
        FF00FF00FF00000000000000000000000000FF00FF00FF00FF00FF00FF00FF00
        FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF000000
        00000000000031639C0031639C0000000000FF00FF00FF00FF00FF00FF00FF00
        FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00005263003163
        9C0031639C0031639C0031639C00000000000052630000526300005263000052
        63000052630000526300FF00FF00FF00FF00FF00FF00FF00FF0000526300316B
        9C00316B9C0031639C0031639C000000000000CEFF0000CEFF0000CEFF000000
        0000FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF0000526300296B
        A500296BA500296B9C00296B9C000000000000CEFF0000CEFF0000CEFF000000
        0000FF00FF00FF000000FF00FF00FF00FF00FF00FF00FF00FF00005263002173
        AD002173A5002173A5002973A5000000000010CEFF0000CEFF0000CEFF000000
        0000FF000000FF000000FF00FF00FF00FF00FF00FF00FF00FF0000526300187B
        AD00187BAD00FFFFFF002173AD000000000031D6FF0029D6FF0018D6FF00FF00
        0000FF000000FF000000FF00FF00FF00FF00FF00FF00FF00FF00005263001084
        B5001884B5001884B500187BB5000000000063DEFF0052DEFF00FF000000FF00
        0000FF000000FF000000FF000000FF000000FF000000FF00FF0000526300088C
        BD00108CBD001084BD001084B500000000008CE7FF00FF000000FF000000FF00
        0000FF000000FF000000FF000000FF000000FF000000FF00FF00005263000894
        C600088CC600088CC600088CBD0000000000B5EFFF00A5EFFF00FF000000FF00
        0000FF000000FF000000FF000000FF000000FF000000FF00FF00005263000094
        CE000094CE000094C6000094C60000000000DEF7FF00CEF7FF00C6EFFF00FF00
        0000FF000000FF000000FF00FF00FF00FF00FF00FF00FF00FF0000526300009C
        CE00009CCE00009CCE000094CE0000000000FFFFFF00F7F7FF00E7F7FF000000
        0000FF000000FF000000FF00FF00FF00FF00FF00FF00FF00FF0000526300009C
        CE00009CCE00009CCE00009CCE0000000000FFFFFF00FFFFFF00FFFFFF000000
        0000FF00FF00FF000000FF00FF00FF00FF00FF00FF00FF00FF00FF00FF000052
        630000526300009CCE00009CCE00000000000052630000526300005263000052
        6300FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
        FF00FF00FF00005263000052630000526300FF00FF00FF00FF00FF00FF00FF00
        FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00}
    end
  end
  object pnTitulo: TPanel
    Left = 0
    Top = 0
    Width = 977
    Height = 25
    Align = alTop
    BevelOuter = bvLowered
    Caption = 'APLICAR DESCONTOS'
    Color = clBlue
    Font.Charset = ANSI_CHARSET
    Font.Color = clWhite
    Font.Height = -13
    Font.Name = 'Arial'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 0
  end
  object pnInfoAluno: TPanel
    Left = 0
    Top = 25
    Width = 977
    Height = 62
    Align = alTop
    TabOrder = 1
    object lbInfoAluno: TLabel
      Left = 108
      Top = 6
      Width = 31
      Height = 13
      Alignment = taRightJustify
      Caption = 'Aluno:'
    end
    object lbInfoTurma: TLabel
      Left = 105
      Top = 22
      Width = 34
      Height = 13
      Alignment = taRightJustify
      Caption = 'Turma:'
    end
    object lbInfoVencimento: TLabel
      Left = 39
      Top = 38
      Width = 100
      Height = 13
      Alignment = taRightJustify
      Caption = 'Data de Vencimento:'
    end
    object lbAluno: TLabel
      Left = 146
      Top = 6
      Width = 799
      Height = 13
      AutoSize = False
      Caption = 'C'#243'digo - Aluno'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object lbTurma: TLabel
      Left = 146
      Top = 22
      Width = 335
      Height = 13
      AutoSize = False
      Caption = 'Turma'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object lbVencimento: TLabel
      Left = 146
      Top = 38
      Width = 124
      Height = 13
      AutoSize = False
      Caption = 'Data de Vencimento'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
    end
  end
  object pnInfoIntervaloParcelas: TPanel
    Left = 0
    Top = 87
    Width = 977
    Height = 40
    Align = alTop
    TabOrder = 2
    Visible = False
    object lbInfoParcelas: TLabel
      Left = 21
      Top = 6
      Width = 368
      Height = 13
      Caption = 'Existem parcelas com valores diferentes da parcela selecionada.'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clRed
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
      WordWrap = True
    end
    object lbInfoParcelas2: TLabel
      Left = 21
      Top = 21
      Width = 436
      Height = 13
      Caption = 
        'Os descontos aplicados ter'#227'o como base os valores da parcela sel' +
        'ecionada.'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clRed
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
      WordWrap = True
    end
  end
  object pnAplicarDescontos: TPanel
    Left = 489
    Top = 127
    Width = 488
    Height = 398
    Align = alClient
    TabOrder = 4
    Visible = False
    object lbMotivoDesconto: TLabel
      Left = 25
      Top = 16
      Width = 97
      Height = 13
      Caption = 'Motivo do desconto:'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
    end
    object lbPercentual: TLabel
      Left = 21
      Top = 74
      Width = 101
      Height = 13
      Caption = 'Percentual desconto:'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
    end
    object lbCalcularSobre: TLabel
      Left = 52
      Top = 45
      Width = 70
      Height = 13
      Caption = 'Calcular sobre:'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
    end
    object lbValorDesconto: TLabel
      Left = 288
      Top = 74
      Width = 74
      Height = 13
      Caption = 'Valor desconto:'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
    end
    object lbObservacao: TLabel
      Left = 21
      Top = 158
      Width = 85
      Height = 13
      Caption = 'Obs./Justificativa:'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
    end
    object rgTipoDesconto: TRadioGroup
      Left = 21
      Top = 106
      Width = 445
      Height = 46
      Caption = ' Aplicar como desconto '
      Columns = 3
      ItemIndex = 0
      Items.Strings = (
        'Fixo'
        'Condicional'
        'Financeiro 100%')
      TabOrder = 5
      OnClick = rgTipoDescontoClick
    end
    object edAcaoDesconto100: TEdit
      Left = 131
      Top = 13
      Width = 334
      Height = 21
      Enabled = False
      TabOrder = 1
      Visible = False
    end
    object cbCalcularSobre: TComboBox
      Left = 131
      Top = 42
      Width = 335
      Height = 21
      Style = csDropDownList
      ItemHeight = 13
      ItemIndex = 0
      TabOrder = 2
      Text = 'Valor bruto da parcela'
      OnChange = cbCalcularSobreChange
      Items.Strings = (
        'Valor bruto da parcela'
        'Valor l'#237'quido antes dos descontos condicionais'
        'Valor l'#237'quido ap'#243's todos os descontos')
    end
    object cbRecalcularCondicionaisProporcional: TCheckBox
      Left = 21
      Top = 254
      Width = 292
      Height = 27
      Caption = 
        'Recalcular todos os descontos condicionais j'#225' aplicados, proporc' +
        'ionalmente ao novo valor l'#237'quido.'
      Checked = True
      State = cbChecked
      TabOrder = 7
      WordWrap = True
    end
    object btConfirmar: TBitBtn
      Left = 21
      Top = 292
      Width = 90
      Height = 25
      Caption = 'Confirmar'
      TabOrder = 8
      OnClick = btConfirmarClick
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
    object btCancelar: TBitBtn
      Left = 376
      Top = 292
      Width = 90
      Height = 25
      Caption = 'Cancelar'
      TabOrder = 9
      OnClick = btCancelarClick
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
    object meObservacao: TMemo
      Left = 21
      Top = 175
      Width = 445
      Height = 74
      TabOrder = 6
    end
    object edPercentualDesconto: TUMEditMonetario
      Left = 131
      Top = 71
      Width = 97
      Height = 21
      BiDiMode = bdLeftToRight
      ParentBiDiMode = False
      TabOrder = 3
      Text = '0,00'
      OnClick = edPercentualDescontoClick
      OnEnter = edPercentualDescontoEnter
      OnExit = edPercentualDescontoExit
      OnKeyPress = edPercentualDescontoKeyPress
      Mascara = '###,###,##0.00'
      CasasDecimais = 2
      EnterProximoCampo = True
    end
    object edValorDesconto: TUMEditMonetario
      Left = 369
      Top = 71
      Width = 97
      Height = 21
      BiDiMode = bdLeftToRight
      ParentBiDiMode = False
      TabOrder = 4
      Text = '0,00'
      OnClick = edValorDescontoClick
      OnEnter = edValorDescontoEnter
      OnExit = edValorDescontoExit
      OnKeyPress = edValorDescontoKeyPress
      Mascara = '###,###,##0.00'
      CasasDecimais = 2
      EnterProximoCampo = True
    end
    object cbAcoesBaixa: TComboBox
      Left = 131
      Top = 13
      Width = 335
      Height = 21
      Style = csDropDownList
      ItemHeight = 13
      TabOrder = 0
      OnChange = cbAcoesBaixaChange
    end
    object pnDesabilitaFixo: TPanel
      Left = 70
      Top = 121
      Width = 26
      Height = 25
      BevelOuter = bvNone
      TabOrder = 10
      Visible = False
      object umInfoDescontoFixo: TUMAjuda
        Left = 1
        Top = 1
        Width = 24
        Height = 24
        Picture.Data = {
          055449636F6E0000010001001818000001002000880900001600000028000000
          1800000030000000010020000000000000090000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000100000005
          0000000B0000000F000000100000001100000010000000100000001100000010
          0000000F0000000B000000050000000100000000000000000000000000000000
          0000000000000000000000000000000000000000000000010000000700000018
          0000002C251800455940006E6A4E008575560093755600936A4E00855940006E
          251800450000002C000000180000000700000001000000000000000000000000
          0000000000000000000000000000000000000000000000010000000D39290042
          7053039B946E07D3B88B17EEC89A22FBD2A32AFED2A32AFEC89A22FBB88B17EE
          946E07D37053039B392900420000000D00000001000000000000000000000000
          00000000000000000000000000000000795700007856000A825F015BA17A0DC2
          C79D22FBDFB538FFE0B63BFFDDB33BFFDBB13CFFDBB13CFFDDB33BFFE0B63BFF
          DFB538FFC79D22FBA17A0DC2825F015B7856000A795700000000000000000000
          000000000000000000000000866700008165000A8E6B006EAD8715ECD4AF34FF
          DCB63FFFD3A738FFCC9A33FFC89330FFC6902FFFC7902FFFC89431FFCC9B33FF
          D3A738FFDCB63FFFD4AF34FFAD8715EC8E6B006E8165000A8667000000000000
          000000000000000084630000000000008B680054AC8917EBD4B43AFFD7B13FFF
          CD9C36FFC79230FFBD8824FFB9851EFFBD8724FFC38C29FFC6902FFFC79131FF
          C89332FFCC9C36FFD7B13FFFD4B43AFFAC8917EB8B6800540000000084630000
          0000000000000000946E01008560001AA37F11B6CEAE3AFFD7B243FFCE9C38FF
          CA9434FFC28C2CFFD0B17BFFE9DCC5FFDBC49EFFC19644FFC08B2AFFC99333FF
          CA9435FFCA9435FFCE9C38FFD7B243FFCEAE3AFFA37F11B68560001A946E0100
          0000000000000000FFE15E00906E0470BB9A2AF8D8B649FFD2A43FFFCD9938FF
          CC9737FFC18D2BFFE2CFB0FFFFFFFFFFFDFBF9FFE0CDAEFFCAA564FFC59131FF
          CC9737FFCC9738FFCD9938FFD2A43FFFD8B649FFBB9A2AF8906E0470FFE15E00
          000000008665000084630015A07E11BED1B145FFD9B148FFD2A13EFFCF9B3BFF
          CF9B3BFFC79332FFD4B782FFFFFFFFFFFBF9F6FFD1B47FFFCFB076FFC2963EFF
          CB9735FFCF9B3BFFCF9B3BFFD2A13EFFD9B148FFD1B145FFA07E11BE84630015
          866500008B6700008A660046B5942CE4DAB853FFDAB14CFFD4A441FFD29F3EFF
          D29F3EFFCF9A37FFCAA04CFFF6F0E7FFFFFFFFFFE3CFA9FFBC8A25FFC79431FF
          D19E3DFFD29F3EFFD29F3EFFD4A441FFDAB14CFFDAB853FFB5942CE48A660046
          8B6700008C6700008C670068C3A545F8E3C469FFDFB95FFFDAAE52FFD7A649FF
          D5A342FFD4A140FFCB9A3BFFE4D1ACFFFFFFFFFFF2E9DAFFCCA14FFFD29F3BFF
          D5A342FFD5A343FFD7A649FFDAAE52FFDFB95FFFE3C469FFC3A545F88C670068
          8C6700008B6700008B67007ACCB154FFE8CA70FFE3BF67FFDFB761FFDDB25BFF
          DBAD55FFD3A243FFC4932DFFD6B675FFFBF9F5FFFDFCFBFFD7B97BFFCF9C37FF
          DAAA4FFFDBAD55FFDDB25BFFDFB761FFE3BF67FFE8CA70FFCCB154FF8B67007A
          8B6700008B6700008B67007AD1B862FFEDD27AFFE7C66DFFE3BE68FFE1B864FF
          E0B561FFD3A64BFFD7B87CFFD0AD6AFFF1E7D5FFFFFFFFFFE7D6B5FFD2A54EFF
          DEB25CFFE0B561FFE1B864FFE3BE68FFE7C66DFFEDD27AFFD1B862FF8B67007A
          8B6700008C6700008C680068D2BD71F8F0DA86FFEBCE75FFE8C66FFFE5BF6AFF
          E3BB67FFDDB258FFD3AA59FFDCC28DFFF5EDE0FFFFFFFFFFF0E4CFFFD5AD5CFF
          E1B660FFE3BB67FFE5BF6AFFE8C66FFFEBCE75FFF0DA86FFD2BD71F88C680068
          8C6700008B6700008B670046CCB770E4F2E095FFEFD67EFFECCF77FFEAC872FF
          E8C36EFFE7C06AFFDFB459FFD7AE54FFDBBD7CFFE3CEA3FFD9BB7CFFD8AD50FF
          E5BE66FFE8C36EFFEAC872FFECCF77FFEFD67EFFF2E095FFCCB770E48B670046
          8B6700008665000083610015AF9544BDF0E2A9FFF4E08EFFF0D881FFEED27BFF
          ECCD76FFEBC872FFEAC670FFE7C169FFDEB557FFD8BA73FFE6D4ACFFDABD75FF
          DFBA5CFFECCC76FFEED27BFFF0D880FFF4E08EFFF0E2A9FFAF9544BD83610015
          8665000000000000FFFFFF009675156ED6C48AF8F9EBAFFFF4E18DFFF2DB85FF
          F1D681FFEFD27DFFEECF7AFFEDCD78FFE1BF66FFECDEBAFFFFFFFFFFF6EFDEFF
          DDBF63FFF0D680FFF2DB85FFF4E18CFFF9EBAFFFD6C48AF89675156EFFFFFF00
          000000000000000099781C00845C001AB2974AB6EEE3B6FFFAEDAFFFF6E492FF
          F5E08CFFF3DC89FFF2D986FFF2D883FFEACE75FFE3CE8CFFF6F1DEFFEFE4BEFF
          E5CD73FFF5E08CFFF6E492FFFAEDAFFFEEE3B6FFB2974AB6845C001A99781C00
          000000000000000083600000000000008D6B0554BCA65DEBF3EBC6FFFBF1BAFF
          F8E99DFFF7E593FFF6E391FFF6E290FFF5DF8CFFECD67DFFE5D078FFE9D47BFF
          F4E28CFFF8E99DFFFBF1BAFFF3EBC6FFBCA65DEB8D6B05540000000083600000
          000000000000000000000000866600007E5F000A9272116EBBA55DECEEE5C1FF
          FCF5CCFFFBF0B6FFFAEDA7FFF9EAA0FFF9E99AFFF9E99AFFF9EA9FFFFAEDA7FF
          FBF0B6FFFCF5CCFFEEE5C1FFBBA55DEC9272116E7E5F000A8666000000000000
          0000000000000000000000000000000084600000825D00098D690750B39B53B5
          D9CCA1F8F3ECCDFFFAF4D1FFFDF6CFFFFEF7CCFFFEF7CCFFFDF6CFFFFAF4D1FF
          F3ECCDFFDBCDA1F8B39C54B68C690750825D0009846000000000000000000000
          000000000000000000000000000000000000000062350000FFFF3D00845F0B1A
          96761970AB9146BACDBD8AE2D9CCA0F5DCCFA4FDDCCFA4FDD9CCA0F5CDBD8AE2
          AB9146BB97761972855F0B1BFFFB3B0062350000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          8F6900008260000F8A6600428C6800628C6700788C6700788C6800628A660042
          8260000F8F690000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          00000000F0000F00F0000F00F0000F00F0000F00E0000700C0000300C0000300
          C000030080000100800001008000010080000100800001008000010080000100
          80000100C0000300C0000300C0000300E0000700F0000F00FC003F00FF00FF00
          FFFFFF00}
        Transparent = True
        Caption = 
          'N'#227'o '#233' poss'#237'vel aplicar desconto fixo em parcelas parciais ou neg' +
          'ociadas.'
        Titulo = 'Desconto Fixo'
        PanelWidth = 100
      end
    end
  end
  object qyVerificaValoresDiferentes: TUMZReadOnlyQuery
    Connection = DM.db
    SQL.Strings = (
      'SELECT'
      #9'm.cd_mensalidade'
      'FROM'
      #9'mensalidades m'
      'WHERE'
      #9'm.situacao IN (2,10) AND'
      #9'm.codigoaluno = :cd_pessoa AND'
      #9'm.anosemestre = :nr_anosemestre AND'
      #9'm.turma LIKE :cd_turma AND'
      #9'm.parcela BETWEEN :nr_parcela_inicial AND :nr_parcela_final AND'
      #9'm.tipoparcela NOT IN (:nr_tipo_parcelas)'
      'GROUP BY'
      #9'm.valorbruto, m.valordesconto, m.descontoextra, m.valorextra')
    Params = <
      item
        DataType = ftUnknown
        Name = 'cd_pessoa'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'nr_anosemestre'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'cd_turma'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'nr_parcela_inicial'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'nr_parcela_final'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'nr_tipo_parcelas'
        ParamType = ptUnknown
      end>
    Left = 464
    Top = 88
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'cd_pessoa'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'nr_anosemestre'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'cd_turma'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'nr_parcela_inicial'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'nr_parcela_final'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'nr_tipo_parcelas'
        ParamType = ptUnknown
      end>
  end
  object qyMensalidade: TUMZReadOnlyQuery
    Connection = DM.db
    SQL.Strings = (
      'SELECT'
      #9'p.cd_pessoa cd_pessoa,'
      '  CONCAT(p.cd_pessoa, '#39' - '#39', p.nm_pessoa) ds_aluno,'
      #9'm.turma cd_turma,'
      #9'm.anosemestre nr_anosemestre,'
      
        '  DATE_FORMAT(m.datavencimento, '#39'%d/%m/%Y'#39') dt_vencimento_format' +
        'ada,'
      
        '  REPLACE(REPLACE(FORMAT(valorbruto, 2), '#39','#39', '#39#39'), '#39'.'#39', '#39','#39') vl_' +
        'bruto,'
      '  m.valordesconto,'
      '  m.valorextra,'
      '  m.datavencimento dt_vencimento,'
      '  m.dt_competencia,'
      '  m.situacao,'
      '  m.datapagamento dt_pagamento,'
      '  m.cd_coligada,'
      '  m.cd_mensalidade_origem,'
      '  m.parcela nr_parcela'
      'FROM'
      '  mensalidades m'
      #9'INNER JOIN pessoas p ON (p.cd_pessoa = m.codigoaluno)'
      'WHERE'
      '  m.cd_mensalidade = :cd_mensalidade')
    Params = <
      item
        DataType = ftUnknown
        Name = 'cd_mensalidade'
        ParamType = ptUnknown
      end>
    Left = 473
    Top = 200
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'cd_mensalidade'
        ParamType = ptUnknown
      end>
  end
  object dsDescontos: TDataSource
    DataSet = qyDescontos
    Left = 320
    Top = 288
  end
  object qyDescontos: TUMZReadOnlyQuery
    Connection = DM.db
    SQL.Strings = (
      '('
      'SELECT'
      '  am.ds_acao,'
      
        '  CASE WHEN cr.sn_desc_condicional > 0 THEN '#39'Condicional'#39' ELSE '#39 +
        'Fixo'#39' END ds_tipo,'
      
        '  REPLACE(REPLACE(FORMAT(CASE WHEN cr.vl_desconto > 0 THEN cr.vl' +
        '_desconto ELSE cr.vl_saida END, 2), '#39','#39', '#39#39'), '#39'.'#39', '#39','#39') vl_desco' +
        'nto_apresentado,'
      
        '  REPLACE(REPLACE(FORMAT(cr.vl_saida, 2), '#39','#39', '#39#39'), '#39'.'#39', '#39','#39') vl' +
        '_saida,'
      
        '  REPLACE(REPLACE(FORMAT(cr.vl_juros, 2), '#39','#39', '#39#39'), '#39'.'#39', '#39','#39') vl' +
        '_juros,'
      '  cr.sn_desc_condicional,'
      '  am.cd_tipo_acao,'
      '  cr.nr_sequencia,'
      '  cr.cd_coligada,'
      '  m.situacao'
      'FROM'
      '  fin_mov_cr cr'
      '  INNER JOIN fin_acoes_movimento am ON (cr.cd_acao = am.cd_acao)'
      
        '  INNER JOIN mensalidades m ON (m.cd_mensalidade = cr.cd_mensali' +
        'dade_origem)'
      'WHERE'
      '  cr.cd_mensalidade_origem = :cd_mensalidade AND'
      '  COALESCE(am.cd_acao_automatica, 0) <> 12 AND'
      '  am.cd_tipo_acao = 3 AND'
      '  am.cd_origem = 1'
      'ORDER BY'
      '  cr.nr_sequencia'
      ')'
      'UNION ('
      '  SELECT'
      '    '#39'Regra de desconto programada pela institui'#231#227'o'#39' ds_acao,'
      '    '#39'Condicional'#39' ds_tipo,'
      '    REPLACE('
      '      REPLACE('
      '        FORMAT('
      
        '          GET_DESCONTOS(m.cd_mensalidade, NULL) - m.valordescont' +
        'o,'
      '          2'
      '        ),'
      '        '#39','#39','
      '        '#39#39
      '      ),'
      '      '#39'.'#39','
      '      '#39','#39
      '    ) vl_desconto_apresentado,'
      '    0.0 vl_saida,'
      '    0.0 vl_juros,'
      '    1 sn_desc_condicional,'
      '    NULL cd_tipo_acao,'
      '    NULL nr_sequencia,'
      '    m.cd_coligada,'
      '    -99 situacao'
      '  FROM'
      '    mensalidades m'
      '  WHERE'
      '    m.cd_mensalidade = :cd_mensalidade AND'
      '    m.valordesconto != GET_DESCONTOS(m.cd_mensalidade, NULL)'
      ')')
    Params = <
      item
        DataType = ftUnknown
        Name = 'cd_mensalidade'
        ParamType = ptUnknown
      end>
    Left = 352
    Top = 288
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'cd_mensalidade'
        ParamType = ptUnknown
      end>
  end
  object qyValoresTotais: TUMZReadOnlyQuery
    Connection = DM.db
    SQL.Strings = (
      'SELECT'
      
        '  CASE WHEN COALESCE(m.descontoextra, 0) + COALESCE(m.valordesco' +
        'nto, 0) > (m.valorbruto) THEN REPLACE(REPLACE(FORMAT((m.valorbru' +
        'to), 2), '#39','#39', '#39#39'), '#39'.'#39', '#39','#39')'
      
        '       ELSE REPLACE(REPLACE(FORMAT(COALESCE(m.descontoextra, 0) ' +
        '+ COALESCE(m.valordesconto, 0), 2), '#39','#39', '#39#39'), '#39'.'#39', '#39','#39')'
      '  END vl_total_descontos,'
      ''
      
        #9'REPLACE(REPLACE(FORMAT((m.valorbruto) - COALESCE(m.descontoextr' +
        'a,0), 2), '#39','#39', '#39#39'), '#39'.'#39', '#39','#39') vl_liquido_antes_condicionais,'
      ''
      
        #9'CASE WHEN (m.valorbruto ) - COALESCE(m.descontoextra, 0) - COAL' +
        'ESCE(m.valordesconto, 0) < 0 THEN 0.00'
      
        '       ELSE REPLACE(REPLACE(FORMAT((m.valorbruto) - COALESCE(m.d' +
        'escontoextra, 0) - COALESCE(m.valordesconto, 0), 2), '#39','#39', '#39#39'), '#39 +
        '.'#39', '#39','#39')'
      '  END vl_liquido_apos_condicionais,'
      ''
      
        '  REPLACE(REPLACE(FORMAT(COALESCE(GET_DESCONTOS(m.cd_mensalidade' +
        ', NULL), 0), 2), '#39','#39', '#39#39'), '#39'.'#39', '#39','#39') vl_descontos'
      'FROM'
      '  mensalidades m'
      'WHERE'
      '  m.cd_mensalidade = :cd_mensalidade')
    Params = <
      item
        DataType = ftUnknown
        Name = 'cd_mensalidade'
        ParamType = ptUnknown
      end>
    Left = 473
    Top = 416
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'cd_mensalidade'
        ParamType = ptUnknown
      end>
  end
  object pmDescontos: TPopupMenu
    Left = 176
    Top = 304
    object miExcluir: TMenuItem
      Caption = 'Excluir'
      OnClick = miExcluirClick
    end
  end
  object qyAcoesBaixa: TUMZQuery
    Connection = DM.db
    SQL.Strings = (
      'SELECT'
      '  fam.cd_acao,'
      '  fam.ds_acao,'
      '  fam.tp_entrada_saida,'
      '  fam.cd_tipo_acao,'
      '  fam.vl_perc_desconto,'
      '  COALESCE(fam.sn_altera_desconto, 1) sn_altera_desconto,'
      '  COALESCE(pd.sn_condicional, 0) sn_condicional_plano,'
      #9'pd.percentualdesconto vl_perc_desconto_plano,'
      #9'pd.valordesconto vl_desconto_plano,'
      '  COUNT(pd.codigo) nr_qtd_planos'
      'FROM'
      '  fin_acoes_movimento fam'
      
        '  LEFT JOIN planosdesconto pd ON (pd.cd_acao_movimento = fam.cd_' +
        'acao)'
      'WHERE'
      '  fam.sn_ativo = '#39'S'#39' AND'
      '  fam.cd_tipo_acao = 3 AND'
      '  fam.cd_origem = 1'
      'GROUP BY'
      #9'fam.cd_acao  '
      'ORDER BY'
      '  fam.ds_acao')
    Params = <>
    Left = 928
    Top = 104
    object StringField1: TStringField
      FieldName = 'ds_acao'
      Origin = 'WMESTRE12.fin_acoes_movimento.ds_acao'
      Size = 255
    end
    object SmallintField1: TSmallintField
      FieldName = 'tp_entrada_saida'
      Origin = 'WMESTRE12.fin_acoes_movimento.tp_entrada_saida'
    end
    object qyAcoesBaixacd_acao: TLargeintField
      FieldName = 'cd_acao'
      Required = True
    end
    object qyAcoesBaixavl_perc_desconto: TFloatField
      FieldName = 'vl_perc_desconto'
    end
    object qyAcoesBaixasn_altera_desconto: TIntegerField
      FieldName = 'sn_altera_desconto'
    end
    object qyAcoesBaixanr_qtd_planos: TLargeintField
      FieldName = 'nr_qtd_planos'
    end
    object qyAcoesBaixavl_perc_desconto_plano: TFloatField
      FieldName = 'vl_perc_desconto_plano'
    end
    object qyAcoesBaixavl_desconto_plano: TFloatField
      FieldName = 'vl_desconto_plano'
    end
    object qyAcoesBaixasn_condicional_plano: TIntegerField
      FieldName = 'sn_condicional_plano'
    end
  end
  object qyAcaoDesconto100: TUMZQuery
    Connection = DM.db
    SQL.Strings = (
      'SELECT'
      '  cd_acao, ds_acao'
      'FROM'
      '  fin_acoes_movimento'
      'WHERE'
      '  cd_acao_automatica = 18')
    Params = <>
    Left = 928
    Top = 72
  end
  object qyDescontosExcluir: TUMZReadOnlyQuery
    Connection = DM.db
    SQL.Strings = (
      'SELECT'
      '  mparc.cd_mensalidade,'
      '  mparc.cd_mensalidade_origem,'
      '  mparc.datavencimento,'
      '  mparc.datapagamento,'
      '  mparc.parcela,'
      '  mparc.situacao,'
      '  mparc.valordesconto,'
      '  fparc.nr_sequencia,'
      '  fparc.cd_coligada,'
      #9'fparc.vl_saida,'
      '  fparc.vl_desconto,'
      '  aparc.cd_tipo_acao,'
      '  fparc.sn_desc_condicional'
      'FROM'
      #9'mensalidades mbase'
      
        #9'INNER JOIN fin_mov_cr fbase ON (mbase.cd_mensalidade = fbase.cd' +
        '_mensalidade_origem)'
      #9'INNER JOIN mensalidades mparc ON ('
      #9#9'mparc.codigoaluno = mbase.codigoaluno AND'
      #9#9'mparc.turma = mbase.turma AND'
      #9#9'mparc.anosemestre = mbase.anosemestre AND'
      #9#9'mparc.valorbruto = mbase.valorbruto AND'
      #9#9'mparc.situacao = mbase.situacao AND'
      
        '    CASE WHEN :cd_mensalidade_aplicar IS NOT NULL THEN mparc.cd_' +
        'mensalidade = :cd_mensalidade_aplicar'
      
        '         ELSE'#9'mparc.parcela BETWEEN :nr_parcela_inicial AND :nr_' +
        'parcela_final'
      '    END     '
      #9')'
      #9'INNER JOIN fin_mov_cr fparc ON ('
      #9#9'fparc.cd_mensalidade_origem = mparc.cd_mensalidade AND'
      #9#9'fparc.nr_sequencia = fbase.nr_sequencia AND'
      #9#9'fparc.cd_acao = fbase.cd_acao AND'
      #9#9'fparc.cd_coligada = fbase.cd_coligada'#9'AND'
      #9#9'fparc.vl_saida = fbase.vl_saida AND'
      #9#9'fparc.vl_desconto = fbase.vl_desconto AND'
      '    fparc.sn_desc_condicional = fbase.sn_desc_condicional'
      #9')'
      '  INNER JOIN fin_acoes_movimento aparc ON ('
      #9#9'aparc.cd_acao = fparc.cd_acao'
      #9')'
      'WHERE'
      #9'fbase.cd_mensalidade_origem = :cd_mensalidade AND'
      #9'fbase.cd_coligada = :cd_coligada AND'
      #9'fbase.nr_sequencia = :nr_sequencia AND'
      #9'mbase.situacao NOT IN (0, 1)')
    Params = <
      item
        DataType = ftUnknown
        Name = 'cd_mensalidade_aplicar'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'nr_parcela_inicial'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'nr_parcela_final'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'cd_mensalidade'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'cd_coligada'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'nr_sequencia'
        ParamType = ptUnknown
      end>
    Left = 208
    Top = 304
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'cd_mensalidade_aplicar'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'nr_parcela_inicial'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'nr_parcela_final'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'cd_mensalidade'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'cd_coligada'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'nr_sequencia'
        ParamType = ptUnknown
      end>
  end
end
