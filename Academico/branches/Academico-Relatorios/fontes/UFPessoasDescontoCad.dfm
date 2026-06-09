object fPessoasDescontoCad: TfPessoasDescontoCad
  Left = 0
  Top = 0
  BorderStyle = bsDialog
  Caption = 'Desconto programado'
  ClientHeight = 674
  ClientWidth = 770
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  OnClose = FormClose
  OnCloseQuery = FormCloseQuery
  OnCreate = FormCreate
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object bvlSep1: TBevel
    Left = 0
    Top = 22
    Width = 770
    Height = 3
    Align = alTop
    Shape = bsTopLine
    ExplicitLeft = 296
    ExplicitTop = 232
    ExplicitWidth = 50
  end
  object bvlSep2: TBevel
    Left = 0
    Top = 671
    Width = 770
    Height = 3
    Align = alBottom
    Shape = bsBottomLine
    ExplicitLeft = 304
    ExplicitTop = 240
    ExplicitWidth = 50
  end
  object pnlTitulo: TPanel
    Left = 0
    Top = 0
    Width = 770
    Height = 22
    Align = alTop
    BevelOuter = bvNone
    Caption = 'DESCONTO PROGRAMADO'
    Color = clBlue
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindow
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 0
  end
  object pnlBotoes: TPanel
    Left = 0
    Top = 643
    Width = 770
    Height = 28
    Align = alBottom
    BevelOuter = bvNone
    TabOrder = 2
    object bbtnCancelar: TBitBtn
      Left = 406
      Top = 2
      Width = 80
      Height = 25
      Caption = 'Cancelar'
      TabOrder = 1
      OnClick = bbtnCancelarClick
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
    object bbtnConfirmar: TBitBtn
      Left = 326
      Top = 2
      Width = 80
      Height = 25
      Caption = 'Confirmar'
      TabOrder = 0
      OnClick = bbtnConfirmarClick
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
  end
  object pnlDados: TScrollBox
    Left = 0
    Top = 25
    Width = 770
    Height = 618
    Align = alClient
    BevelOuter = bvNone
    BorderStyle = bsNone
    TabOrder = 1
    object Bevel1: TBevel
      Left = 3
      Top = 211
      Width = 736
      Height = 86
    end
    object lblNomeBeneficiado: TLabel
      Left = 3
      Top = 6
      Width = 107
      Height = 13
      Caption = 'Estudante beneficiado'
      FocusControl = dbeNomeBeneficiado
    end
    object sbSelBeneficiado: TSpeedButton
      Left = 358
      Top = 22
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
      OnClick = sbSelBeneficiadoClick
    end
    object lblNomeIndicado: TLabel
      Left = 387
      Top = 6
      Width = 91
      Height = 13
      Caption = 'Estudante indicado'
      FocusControl = dbeNomeIndicado
    end
    object sbSelIndicado: TSpeedButton
      Left = 742
      Top = 22
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
      OnClick = sbSelIndicadoClick
    end
    object lblDescDepto: TLabel
      Left = 3
      Top = 46
      Width = 69
      Height = 13
      Caption = 'Departamento'
    end
    object lblPercDesconto: TLabel
      Left = 3
      Top = 300
      Width = 51
      Height = 13
      Caption = 'Percentual'
      FocusControl = dbePercDesconto
    end
    object lblHistorico: TLabel
      Left = 271
      Top = 300
      Width = 41
      Height = 13
      Caption = 'Hist'#243'rico'
      FocusControl = dbeHistorico
    end
    object lblDataInicio: TLabel
      Left = 3
      Top = 340
      Width = 49
      Height = 13
      Caption = 'Data in'#237'cio'
      FocusControl = dbeDataInicio
    end
    object lblDataFinal: TLabel
      Left = 137
      Top = 340
      Width = 46
      Height = 13
      Caption = 'Data final'
      FocusControl = dbeDataFinal
    end
    object lblParcInicio: TLabel
      Left = 271
      Top = 340
      Width = 61
      Height = 13
      Caption = 'Parcela in'#237'cio'
      FocusControl = dbeParcInicio
    end
    object lblParcFinal: TLabel
      Left = 373
      Top = 340
      Width = 58
      Height = 13
      Caption = 'Parcela final'
      FocusControl = dbeParcelaFinal
    end
    object lblTiposTitulo: TLabel
      Left = 3
      Top = 380
      Width = 119
      Height = 13
      Caption = 'Tipos de t'#237'tulo permitidos'
    end
    object sbExcTipoTitulo: TSpeedButton
      Left = 472
      Top = 418
      Width = 23
      Height = 22
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
      OnClick = sbExcTipoTituloClick
    end
    object sbAdcTipoTitulo: TSpeedButton
      Left = 472
      Top = 396
      Width = 23
      Height = 22
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
      OnClick = sbAdcTipoTituloClick
    end
    object sbLimpaTiposTitulo: TSpeedButton
      Left = 472
      Top = 440
      Width = 23
      Height = 22
      Flat = True
      Glyph.Data = {
        46030000424D46030000000000003600000028000000120000000E0000000100
        18000000000010030000C40E0000C40E00000000000000000000FFFFFFFFFFFF
        FFFFFFFDFDFCCCCCD36C6D9D95959FE5E6E2FFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF0000FFFFFFFEFEFED0D0CA5A5A7F3130
        D43736ED2C2BD32B2B91868691CFD0CAF9FAF9FFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFF0000FDFDFC9090A42423A93836F34544FF3A39E33A39E344
        43FF302EDE24239A3434419E9E9DF8F8F8FFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        000081819F2D2CDF4544FF4342FF4241FF4543FF1F1E803635D24746FF4746FF
        19188454544A6F7072BBBBBBFBFCFBFFFFFFFFFFFFFFFFFF00007070A63E3DFF
        4241FF4342FF4342FF3635D82D2CB71D1D7A2B2AAA4342FB3D3CFF36366CEBEC
        E2A1A1A3616066C8C9C9FEFEFEFFFFFF0000C9CACB3C3BD54342FF3A39E02D2C
        B73737DA4544FF4342FE2A29A81A1A6E2E2DB22B2BC3B5B5C4FFFFFFEBEAEC8A
        8A8E88888AF4F5F50000FFFFFE8080BB2928D22F2EC94241FD4442FF4241FF42
        41FF4544FF4241FC302FBA11116B35354BFFFFFEFFFFFFFFFFFFD5D5D7A4A4A7
        0000FFFFFFF2F2F29191B45352D43C3BF83F3EFF4241FF4241FF4443FF4342FF
        3433F124249B83838DE8E8E6B1B1B4E5E5E6FFFFFF9595980000FFFFFFFFFFFF
        FFFFFFF6F6F5C1C1CF6A69BE4140E73C3BF92929C02A2A7B81809ADCDCD2FFFF
        FFFDFDFDD1D1D39898998B8B8D86868A0000FFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFDFDFDD9D9DC9797AB989897E4E4DAFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFA
        FAFA87888CCBCACC0000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFF2F2F2D1D1D3C8C8C9DDDDDEF5F5F5D9D9DAAAAAADC2C1C4F9F9FAFFFFFF
        0000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        F2F2F2D6D6D7AFAFB2C3C3C5EAEAEAFFFFFFFFFFFFFFFFFF0000FFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF0000FFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFF0000}
      OnClick = sbLimpaTiposTituloClick
    end
    object Label1: TLabel
      Left = 387
      Top = 46
      Width = 28
      Height = 13
      Caption = 'Curso'
    end
    object UMAjuda1: TUMAjuda
      Left = 399
      Top = 233
      Width = 24
      Height = 24
      ParentShowHint = False
      Picture.Data = {
        07544269746D6170F6060000424DF60600000000000036000000280000001800
        0000180000000100180000000000C0060000C40E0000C40E0000000000000000
        0000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFCFCFCF6F6F6F4F4F4FAFAFA
        FCFCFCFEFEFEFEFEFEFCFCFCFAFAFAF4F4F4F6F6F6FCFCFCFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF7F7F7E9EAEADD
        DDDDC7C5C4A8A294968F798D83698D8369968F79A8A294C7C5C4DDDDDDE9EAEA
        F7F7F7FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFEFE
        FEFBFBFBCDCCC996875F967523C0911AD6A422E5B22DE5B22DD6A422C0911A96
        752396875FCDCCC9FBFBFBFEFEFEFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFC4BBADB1923DD0A321EBC03EE3BB3EDEB73FDCB442DCB4
        42DEB73FE3BB3EEBC03ED0A321B1923DC4BBADFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFDACEABA87F06DFBB3DE0BD46D0A639C99732
        C59031C48E31C48E31C59031C99732D0A639E0BD46DFBB3DA87F06DACEABFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFE1DAC19C7600DEC045D8B342C9
        9733C68F31C69031C38C28C0871FC0871FC38C28C69031C68F31C99733D8B342
        DEC0459C7600E1DAC1FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFEFEFDB09341D6B8
        43D8B447CB9836C99234CB9537C38C27B78523BE9441BE9441B78523C38C27CB
        9537C99234CB9836D8B447D6B843B09341FEFEFDFFFFFFFFFFFFFFFFFFFFFFFF
        D6C9A6B4921ADEBF53D1A13CCC9738CC9737D09D41BB800FD5BC86FFFFFFFFFF
        FFD5BC86BB8010D09D41CC9737CC9738D1A13CDEBF53B4921AD6C9A6FFFFFFFF
        FFFFFFFFFFFEFEFEAB903AD7B84DD9B24AD19F3ECE9B3BCE9B3AD1A043C08819
        D0B26EFBF9F4FCFAF5D0B16DC08717D1A043CE9B3ACE9B3BD19F3ED9B24AD7B8
        4DAB903AFEFEFEFFFFFFFFFFFFEFEADDA88516E0C05DDAB04BD3A23FD29E3DD2
        9E3ED3A041CB9630BF912CC7A14AC69F47C19435CD9938D3A040D29E3DD29E3D
        D3A23FDAB04BE0C05DA88516EFEADDFFFFFFFFFFFFE6DFCAB9982FE9CC77DEB8
        5FD9AD52D6A548D4A13FD7A647C78F1FD6B97DFFFFFFFFFFFFF0E8DCBF8C26D1
        9D37D5A343D6A548D9AD52DEB85FE9CC77B9982FE6DFCAFFFFFFFFFFFFE0D7BD
        C5A841EED27DE1BD66DFB762DDB25CDBAD56DCAE56DAAB4EC79636E8D9BEFFFF
        FFFFFFFFE1CDA5C28F27DBAD54DDB25CDFB762E1BD66EED27DC5A841E0D7BDFF
        FFFFFFFFFFDFD6BDCAAF51F2DB87E5C36BE2BC66E1B763DFB35FD3A23FD09C36
        CD982EC69738EEE3CFFFFFFFFFFFFFD9BB84D3A342E3BA69E2BC65E5C36BF2DB
        87CAAF51DFD6BDFFFFFFFFFFFFE5DDC8C9B25EF6E291E9CC74E7C46CE7C270D2
        A440D2B268DFC894CFAB5BCB9627CEA552FEFFFFFFFFFFEADCBCCD9E35E8C473
        E7C46CE9CC74F6E291C9B25EE5DDC8FFFFFFFFFFFFEEE9DBBEA658FAEAA3EED4
        7BEBCD76EDCD7BD3A73CEFE5CBFFFFFFF5EFE4CDA44BD8B974FFFFFFFFFFFFED
        E2C5D2A63CEDCD7BEBCD76EED47BFAEAA3BEA658EEE9DBFFFFFFFFFFFFFEFEFE
        B49D58F9EFBCF4DF8AEFD780F0D480E0BC58E1CB94FEFEFFFEFEFDFDFCFAFDFD
        FCFEFEFDFFFFFFE8D7AFDCB750F0D582EFD77FF4DF8AF9EFBCB49D58FEFEFEFF
        FFFFFFFFFFFFFFFFD6CAA6D1BE83FFF4BCF1DD84F2DB87F0D57BDCBD61F5EFE1
        FFFFFFFFFFFFFFFFFFFFFFFFF9F5EFDABD68EED277F2DB88F1DD83FFF4BCD1BE
        83D6CAA6FFFFFFFFFFFFFFFFFFFFFFFFFEFEFDB69E5BFAF3D2F9ECADF4E18AF6
        E18EEED579E0C772ECE0BBF8F6ECF9F6EDEEE4C3E0C978E7CD6DF7E28FF3E08A
        F9ECADFAF3D2B69E5BFEFEFDFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFE1D8BFAD93
        3FFFFFE8FBF0B9F6E694F7E591F4DF85E7D072DFC96CDFC96CE6CF72F3DD83F7
        E692F6E694FBF0B9FFFFE9AD933FE1D8BFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFD6CAA6AB903DFAF5DDFFFEDBFBF0B5F9ECA6F9EA9DF9E895F9E8
        95F9EA9DF9ECA6FBF0B6FFFEDBFAF5DDAB903DD6CAA6FFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFE4DBC3B7A160D4C699FDF9E4FFFFE5
        FFFFDEFFFFDBFFFFDBFFFFDEFFFFE5FDF9E4D6C79AB7A060E4DBC2FFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFEFEFDD5
        C9A4B19A57BEAA6DCFBF8BD6C798D6C798CFBF8BBEAB6EB19A56D5C8A3FEFEFD
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFEFEBDDE7E0CBE0D6BBE0D6BBE7E0CBEFEBDDFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFF}
      ShowHint = False
      Transparent = True
      Caption = 
        'Esta funcionalidade mudou e caso marcada ser'#225' poss'#237'vel'#13#10'ao gerar' +
        ' as mensalidades no momento da matricula, aplicar'#13#10'um desconto f' +
        'ixo juntamente de uma divis'#227'o e optar por '#13#10'manter na parcela do' +
        ' aluno o desconto concedido ou caso'#13#10'desmarcar esta op'#231#227'o a divi' +
        's'#227'o calcular'#225' percentualmente '#13#10'o desconto entre as duas parcela' +
        's originadas da divis'#227'o (Comportamento'#13#10'atual do sistema). Exemp' +
        'lo de utiliza'#231#227'o: Alguns clientes'#13#10'utilizam combinadamente ProUn' +
        'i+FIES e necessitam que'#13#10'o ProUNI seja aplicado antes do FIES e ' +
        'que a divis'#227'o realizada'#13#10'para controlar o FIES seja feita descon' +
        'siderando o desconto'#13#10'referente ao ProUNI.'
      Titulo = 'AJUDA'
      PanelWidth = 20
    end
    object lblValorFixo: TLabel
      Left = 137
      Top = 300
      Width = 53
      Height = 13
      Caption = 'Valor Fixo*'
      FocusControl = dbeValorFixo
    end
    object lblLegenda: TLabel
      Left = 3
      Top = 490
      Width = 599
      Height = 13
      Caption = 
        '* Na aplica'#231#227'o do plano de desconto o sistema d'#225' prefer'#234'ncia ao ' +
        '% de desconto. Na aus'#234'ncia deste utiliza o valor desconto.'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = [fsItalic]
      ParentFont = False
      WordWrap = True
    end
    object sbLimpaCurso: TSpeedButton
      Left = 742
      Top = 62
      Width = 23
      Height = 21
      Flat = True
      Glyph.Data = {
        46030000424D46030000000000003600000028000000120000000E0000000100
        18000000000010030000C40E0000C40E00000000000000000000FFFFFFFFFFFF
        FFFFFFFDFDFCCCCCD36C6D9D95959FE5E6E2FFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF0000FFFFFFFEFEFED0D0CA5A5A7F3130
        D43736ED2C2BD32B2B91868691CFD0CAF9FAF9FFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFF0000FDFDFC9090A42423A93836F34544FF3A39E33A39E344
        43FF302EDE24239A3434419E9E9DF8F8F8FFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        000081819F2D2CDF4544FF4342FF4241FF4543FF1F1E803635D24746FF4746FF
        19188454544A6F7072BBBBBBFBFCFBFFFFFFFFFFFFFFFFFF00007070A63E3DFF
        4241FF4342FF4342FF3635D82D2CB71D1D7A2B2AAA4342FB3D3CFF36366CEBEC
        E2A1A1A3616066C8C9C9FEFEFEFFFFFF0000C9CACB3C3BD54342FF3A39E02D2C
        B73737DA4544FF4342FE2A29A81A1A6E2E2DB22B2BC3B5B5C4FFFFFFEBEAEC8A
        8A8E88888AF4F5F50000FFFFFE8080BB2928D22F2EC94241FD4442FF4241FF42
        41FF4544FF4241FC302FBA11116B35354BFFFFFEFFFFFFFFFFFFD5D5D7A4A4A7
        0000FFFFFFF2F2F29191B45352D43C3BF83F3EFF4241FF4241FF4443FF4342FF
        3433F124249B83838DE8E8E6B1B1B4E5E5E6FFFFFF9595980000FFFFFFFFFFFF
        FFFFFFF6F6F5C1C1CF6A69BE4140E73C3BF92929C02A2A7B81809ADCDCD2FFFF
        FFFDFDFDD1D1D39898998B8B8D86868A0000FFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFDFDFDD9D9DC9797AB989897E4E4DAFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFA
        FAFA87888CCBCACC0000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFF2F2F2D1D1D3C8C8C9DDDDDEF5F5F5D9D9DAAAAAADC2C1C4F9F9FAFFFFFF
        0000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        F2F2F2D6D6D7AFAFB2C3C3C5EAEAEAFFFFFFFFFFFFFFFFFF0000FFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF0000FFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFF0000}
      OnClick = sbLimpaCursoClick
    end
    object bvlTipoTitulo: TBevel
      Left = 3
      Top = 136
      Width = 736
      Height = 33
    end
    object bvlVencto: TBevel
      Left = 3
      Top = 172
      Width = 736
      Height = 33
    end
    object pgcTipoDesconto: TPageControl
      Left = 383
      Top = 86
      Width = 386
      Height = 47
      ActivePage = tbsDesconto
      Style = tsButtons
      TabOrder = 5
      object tbsDesconto: TTabSheet
        Caption = 'tbsDesconto'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
        TabVisible = False
        object lblDescPlano: TLabel
          Left = 0
          Top = 0
          Width = 135
          Height = 13
          Caption = 'Plano de desconto/conv'#234'nio'
        end
        object cbDescPlano: TUMLookupComboBox
          Left = 0
          Top = 16
          Width = 352
          Height = 21
          DataField = 'DS_PLANO_DESCONTO'
          DataSource = dsPessoaDesconto
          TabOrder = 0
        end
      end
      object tbsDivisao: TTabSheet
        Caption = 'tbsDivisao'
        ImageIndex = 1
        TabVisible = False
        object lblNomeResponsavel: TLabel
          Left = 0
          Top = 0
          Width = 176
          Height = 13
          Caption = 'Respons'#225'vel pelas parcelas divididas'
          FocusControl = dbeNomeResponsavel
        end
        object sbSelResponsavel: TSpeedButton
          Left = 355
          Top = 16
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
          OnClick = sbSelResponsavelClick
        end
        object dbeNomeResponsavel: TDBEdit
          Left = 0
          Top = 16
          Width = 352
          Height = 21
          DataField = 'NM_PESSOA'
          DataSource = dsResponsavelDivisao
          TabOrder = 0
        end
      end
    end
    object dbeNomeBeneficiado: TDBEdit
      Left = 3
      Top = 22
      Width = 352
      Height = 21
      DataField = 'NM_PESSOA'
      DataSource = dsBeneficiado
      TabOrder = 0
    end
    object dbeNomeIndicado: TDBEdit
      Left = 387
      Top = 22
      Width = 352
      Height = 21
      DataField = 'NM_PESSOA'
      DataSource = dsIndicado
      TabOrder = 1
    end
    object dbePercDesconto: TDBEdit
      Left = 3
      Top = 316
      Width = 128
      Height = 21
      DataField = 'VL_PERCENTUAL'
      DataSource = dsPessoaDesconto
      TabOrder = 14
      OnKeyPress = dbePercDescontoKeyPress
    end
    object dbeHistorico: TDBEdit
      Left = 271
      Top = 316
      Width = 468
      Height = 21
      DataField = 'DS_HISTORICO'
      DataSource = dsPessoaDesconto
      TabOrder = 16
    end
    object dbeParcInicio: TDBEdit
      Left = 271
      Top = 356
      Width = 96
      Height = 21
      DataField = 'NR_PARC_INICIO'
      DataSource = dsPessoaDesconto
      TabOrder = 19
    end
    object dbeParcelaFinal: TDBEdit
      Left = 373
      Top = 356
      Width = 96
      Height = 21
      DataField = 'NR_PARC_FIM'
      DataSource = dsPessoaDesconto
      TabOrder = 20
    end
    object dbmObservacoes: TDBMemo
      Left = 0
      Top = 522
      Width = 770
      Height = 96
      Align = alBottom
      DataField = 'TX_OBSERVACOES'
      DataSource = dsPessoaDesconto
      ScrollBars = ssBoth
      TabOrder = 22
    end
    object dbeDataInicio: TDBEdit
      Left = 3
      Top = 356
      Width = 128
      Height = 21
      DataField = 'DT_INICIO'
      DataSource = dsPessoaDesconto
      TabOrder = 17
    end
    object dbeDataFinal: TDBEdit
      Left = 137
      Top = 356
      Width = 128
      Height = 21
      DataField = 'DT_FIM'
      DataSource = dsPessoaDesconto
      TabOrder = 18
    end
    object dbgTposTituloDesc: TDBGrid
      Left = 3
      Top = 396
      Width = 466
      Height = 91
      DataSource = dsTiposTituloDesc
      TabOrder = 21
      TitleFont.Charset = DEFAULT_CHARSET
      TitleFont.Color = clWindowText
      TitleFont.Height = -11
      TitleFont.Name = 'Tahoma'
      TitleFont.Style = []
      Columns = <
        item
          Expanded = False
          FieldName = 'DS_TIPO_TITULO'
          Title.Caption = 'Tipo de t'#237'tulo'
          Width = 339
          Visible = True
        end>
    end
    object dbrgTipoDesconto: TDBRadioGroup
      Left = 3
      Top = 89
      Width = 352
      Height = 44
      Caption = 'Forma de aplica'#231#227'o'
      Columns = 2
      DataField = 'TP_DESCONTO'
      DataSource = dsPessoaDesconto
      Items.Strings = (
        'Desconto'
        'Divis'#227'o de t'#237'tulo')
      ParentBackground = True
      TabOrder = 4
      Values.Strings = (
        '1'
        '2')
      OnChange = dbrgTipoDescontoChange
    end
    object cbManterDescontos: TDBCheckBox
      Left = 9
      Top = 217
      Width = 372
      Height = 17
      Caption = 
        'Manter os descontos apenas na parcela de responsabilidade do alu' +
        'no:'
      DataField = 'sn_manter_desconto_fixo'
      DataSource = dsPessoaDesconto
      TabOrder = 10
      ValueChecked = '1'
      ValueUnchecked = '0'
      OnClick = cbManterDescontosClick
    end
    object rbAplicaBruto: TRadioButton
      Left = 9
      Top = 237
      Width = 384
      Height = 17
      Caption = 
        'Efetuar a divis'#227'o do percentual informado com base no valor brut' +
        'o do t'#237'tulo'
      Checked = True
      TabOrder = 11
      TabStop = True
      OnClick = rbAplicaBrutoClick
    end
    object rbAplicaLiquido: TRadioButton
      Left = 9
      Top = 257
      Width = 387
      Height = 17
      Caption = 
        'Efetuar a divis'#227'o do percentual informado com base no valor l'#237'qu' +
        'ido do t'#237'tulo'
      TabOrder = 12
      OnClick = rbAplicaLiquidoClick
    end
    object lcbDepartamentos: TUMLookupComboBox
      Left = 3
      Top = 62
      Width = 352
      Height = 21
      DataField = 'DS_DEPARTAMENTO'
      DataSource = dsPessoaDesconto
      TabOrder = 2
    end
    object dbeValorFixo: TDBEdit
      Left = 137
      Top = 316
      Width = 128
      Height = 21
      DataField = 'VL_FIXO'
      DataSource = dsPessoaDesconto
      TabOrder = 15
    end
    object dbchTipoTitulo: TDBCheckBox
      Left = 9
      Top = 143
      Width = 300
      Height = 17
      Caption = 'Alterar o tipo de t'#237'tulo das parcelas resultantes da divis'#227'o'
      DataField = 'SN_ALTERAR_TIPO_TITULO'
      DataSource = dsPessoaDesconto
      TabOrder = 6
      ValueChecked = '1'
      ValueUnchecked = '0'
      OnClick = dbchTipoTituloClick
    end
    object dbchVencto: TDBCheckBox
      Left = 9
      Top = 180
      Width = 381
      Height = 17
      Caption = 
        'Calcular data de vencimento das parcelas resultantes da divis'#227'o ' +
        'a partir de'
      DataField = 'SN_ALTERAR_VENCTO'
      DataSource = dsPessoaDesconto
      TabOrder = 8
      ValueChecked = '1'
      ValueUnchecked = '0'
      OnClick = dbchVenctoClick
    end
    object dbeVenctoInicial: TDBEdit
      Left = 393
      Top = 178
      Width = 134
      Height = 21
      DataField = 'DT_VENCTO_INICIAL'
      DataSource = dsPessoaDesconto
      TabOrder = 13
    end
    object dblcTipoTitulo: TDBLookupComboBox
      Left = 312
      Top = 142
      Width = 352
      Height = 21
      DataField = 'DS_TIPO_TITULO'
      DataSource = dsPessoaDesconto
      TabOrder = 7
    end
    object Panel1: TPanel
      Left = 0
      Top = 505
      Width = 770
      Height = 17
      Align = alBottom
      BevelOuter = bvNone
      Caption = 'Observa'#231#245'es'
      Color = clBlue
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindow
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 23
    end
    object lcbCursos: TUMLookupComboBox
      Left = 387
      Top = 62
      Width = 352
      Height = 21
      DataField = 'DS_CURSO'
      DataSource = dsPessoaDesconto
      TabOrder = 3
    end
    object dbchDividirCondicional: TDBCheckBox
      Left = 27
      Top = 277
      Width = 156
      Height = 17
      Caption = 'Incluir desconto condicional'
      DataField = 'SN_DIVIDIR_DESCONTO_CONDICIONAL'
      DataSource = dsPessoaDesconto
      TabOrder = 9
      ValueChecked = '1'
      ValueUnchecked = '0'
    end
  end
  object qryPessoaDesconto: TUMZQuery
    Connection = DM.db
    BeforeEdit = qryPessoaDescontoBeforeEdit
    BeforePost = qryPessoaDescontoBeforePost
    AfterPost = qryPessoaDescontoAfterPost
    OnNewRecord = qryPessoaDescontoNewRecord
    SQL.Strings = (
      'SELECT'
      '   CD_DESCONTO_PESSOA,'
      '   CD_PESSOA,'
      '   CD_DESCONTO,'
      '   VL_ANOSEM_INICIO,'
      '   VL_ANOSEM_FIM,'
      '   CD_DEPTO,'
      '   SN_PRIMEIRA_PARCELA,'
      '   CD_PESSOA_INDICADA,'
      '   DT_INICIO,'
      '   DT_FIM,'
      '   VL_PERCENTUAL,'
      '   NR_PARC_INICIO,'
      '   NR_PARC_FIM,'
      '   DS_HISTORICO,'
      '   TX_OBSERVACOES,'
      '   CD_RESPONSAVEL,'
      '   TP_DESCONTO,'
      '   CD_CURSO,'
      '   sn_manter_desconto_fixo,'
      '   nr_forma_aplicar_divisao,'
      '   VL_FIXO,'
      '   CD_TIPO_TITULO,'
      '   CD_COLIGADA_MATRIZ,'
      '   SN_ALTERAR_VENCTO,'
      '   DT_VENCTO_INICIAL,'
      '   SN_ALTERAR_TIPO_TITULO,'
      '   SN_DIVIDIR_DESCONTO_CONDICIONAL'
      'FROM  '
      '   PESSOAS_DESCONTOS     '
      'WHERE     '
      '   CD_PESSOA = :CD_PESSOA')
    Params = <
      item
        DataType = ftUnknown
        Name = 'CD_PESSOA'
        ParamType = ptUnknown
      end>
    Left = 368
    Top = 56
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'CD_PESSOA'
        ParamType = ptUnknown
      end>
    object qryPessoaDescontoCD_DESCONTO_PESSOA: TLargeintField
      FieldName = 'CD_DESCONTO_PESSOA'
      Required = True
    end
    object qryPessoaDescontoCD_PESSOA: TLargeintField
      FieldName = 'CD_PESSOA'
      Required = True
      OnChange = qryPessoaDescontoCD_PESSOAChange
    end
    object qryPessoaDescontoCD_DESCONTO: TLargeintField
      FieldName = 'CD_DESCONTO'
      OnChange = qryPessoaDescontoCD_DESCONTOChange
    end
    object qryPessoaDescontoVL_ANOSEM_INICIO: TIntegerField
      FieldName = 'VL_ANOSEM_INICIO'
      Required = True
    end
    object qryPessoaDescontoVL_ANOSEM_FIM: TIntegerField
      FieldName = 'VL_ANOSEM_FIM'
      Required = True
    end
    object qryPessoaDescontoCD_DEPTO: TIntegerField
      FieldName = 'CD_DEPTO'
      Required = True
      OnChange = qryPessoaDescontoCD_DEPTOChange
    end
    object qryPessoaDescontoSN_PRIMEIRA_PARCELA: TStringField
      FieldName = 'SN_PRIMEIRA_PARCELA'
      Size = 1
    end
    object qryPessoaDescontoCD_PESSOA_INDICADA: TLargeintField
      FieldName = 'CD_PESSOA_INDICADA'
    end
    object qryPessoaDescontoDT_INICIO: TDateTimeField
      FieldName = 'DT_INICIO'
      OnChange = qryPessoaDescontoDT_INICIOChange
      EditMask = '!99/99/0000;1;_'
    end
    object qryPessoaDescontoDT_FIM: TDateTimeField
      FieldName = 'DT_FIM'
      OnChange = qryPessoaDescontoDT_FIMChange
      EditMask = '!99/99/0000;1;_'
    end
    object qryPessoaDescontoVL_PERCENTUAL: TFloatField
      FieldName = 'VL_PERCENTUAL'
    end
    object qryPessoaDescontoNR_PARC_INICIO: TSmallintField
      FieldName = 'NR_PARC_INICIO'
      OnChange = qryPessoaDescontoNR_PARC_INICIOChange
    end
    object qryPessoaDescontoNR_PARC_FIM: TIntegerField
      FieldName = 'NR_PARC_FIM'
      OnChange = qryPessoaDescontoNR_PARC_FIMChange
    end
    object qryPessoaDescontoDS_HISTORICO: TStringField
      FieldName = 'DS_HISTORICO'
      Size = 150
    end
    object qryPessoaDescontoTX_OBSERVACOES: TMemoField
      FieldName = 'TX_OBSERVACOES'
      BlobType = ftMemo
    end
    object qryPessoaDescontoCD_RESPONSAVEL: TIntegerField
      FieldName = 'CD_RESPONSAVEL'
      OnChange = qryPessoaDescontoCD_RESPONSAVELChange
    end
    object qryPessoaDescontoTP_DESCONTO: TSmallintField
      FieldName = 'TP_DESCONTO'
      Required = True
      OnChange = qryPessoaDescontoTP_DESCONTOChange
    end
    object qryPessoaDescontoDS_PLANO_DESCONTO: TStringField
      FieldKind = fkLookup
      FieldName = 'DS_PLANO_DESCONTO'
      LookupDataSet = qryPlanosDesconto
      LookupKeyFields = 'CODIGO'
      LookupResultField = 'DESCRICAOPLANO'
      KeyFields = 'CD_DESCONTO'
      Lookup = True
    end
    object qryPessoaDescontoDS_DEPARTAMENTO: TStringField
      FieldKind = fkLookup
      FieldName = 'DS_DEPARTAMENTO'
      LookupDataSet = qryDepartamentos
      LookupKeyFields = 'CODIGO'
      LookupResultField = 'DESCRICAO'
      KeyFields = 'CD_DEPTO'
      Lookup = True
    end
    object qryPessoaDescontoDS_CURSO: TStringField
      FieldKind = fkLookup
      FieldName = 'DS_CURSO'
      LookupDataSet = qryCursos
      LookupKeyFields = 'CD_CURSO'
      LookupResultField = 'DS_CURSO'
      KeyFields = 'CD_CURSO'
      Size = 255
      Lookup = True
    end
    object qryPessoaDescontoCD_CURSO: TStringField
      FieldName = 'CD_CURSO'
      Size = 255
    end
    object qryPessoaDescontosn_manter_desconto_fixo: TSmallintField
      FieldName = 'sn_manter_desconto_fixo'
    end
    object qryPessoaDescontonr_forma_aplicar_divisao: TSmallintField
      FieldName = 'nr_forma_aplicar_divisao'
    end
    object qryPessoaDescontoVL_FIXO: TFloatField
      FieldName = 'VL_FIXO'
      DisplayFormat = '###,###,##0.00'
    end
    object qryPessoaDescontoCD_TIPO_TITULO: TIntegerField
      FieldName = 'CD_TIPO_TITULO'
      OnChange = qryPessoaDescontoCD_TIPO_TITULOChange
    end
    object qryPessoaDescontoCD_COLIGADA_MATRIZ: TIntegerField
      FieldName = 'CD_COLIGADA_MATRIZ'
    end
    object qryPessoaDescontoSN_ALTERAR_VENCTO: TSmallintField
      FieldName = 'SN_ALTERAR_VENCTO'
      Required = True
    end
    object qryPessoaDescontoDT_VENCTO_INICIAL: TDateField
      FieldName = 'DT_VENCTO_INICIAL'
      EditMask = '!99/99/0000;1;_'
    end
    object qryPessoaDescontoSN_ALTERAR_TIPO_TITULO: TSmallintField
      FieldName = 'SN_ALTERAR_TIPO_TITULO'
    end
    object qryPessoaDescontoDS_TIPO_TITULO: TStringField
      FieldKind = fkLookup
      FieldName = 'DS_TIPO_TITULO'
      LookupDataSet = qryTiposTitulo
      LookupKeyFields = 'CD_TIPO_TITULO'
      LookupResultField = 'DS_TIPO_TITULO'
      KeyFields = 'CD_TIPO_TITULO'
      Lookup = True
    end
    object qryPessoaDescontoSN_DIVIDIR_DESCONTO_CONDICIONAL: TSmallintField
      FieldName = 'SN_DIVIDIR_DESCONTO_CONDICIONAL'
      Required = True
    end
  end
  object qryBeneficiado: TUMZReadOnlyQuery
    Connection = DM.db
    SQL.Strings = (
      'SELECT'
      '   CD_PESSOA,'
      '   NM_PESSOA'
      'FROM'
      '   PESSOAS'
      'WHERE'
      '   CD_PESSOA = :CD_PESSOA')
    Params = <
      item
        DataType = ftUnknown
        Name = 'CD_PESSOA'
        ParamType = ptUnknown
      end>
    DataSource = dsPessoaDesconto
    Left = 288
    Top = 136
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'CD_PESSOA'
        ParamType = ptUnknown
      end>
    object qryBeneficiadoCD_PESSOA: TIntegerField
      FieldName = 'CD_PESSOA'
      Required = True
    end
    object qryBeneficiadoNM_PESSOA: TStringField
      FieldName = 'NM_PESSOA'
      Size = 60
    end
  end
  object dsPessoaDesconto: TDataSource
    DataSet = qryPessoaDesconto
    OnStateChange = dsPessoaDescontoStateChange
    OnDataChange = dsPessoaDescontoDataChange
    Left = 328
    Top = 56
  end
  object qryIndicado: TUMZReadOnlyQuery
    Connection = DM.db
    SQL.Strings = (
      'SELECT'
      '   CD_PESSOA,'
      '   NM_PESSOA'
      'FROM'
      '   PESSOAS'
      'WHERE'
      '   CD_PESSOA = :CD_PESSOA_INDICADA')
    Params = <
      item
        DataType = ftUnknown
        Name = 'CD_PESSOA_INDICADA'
        ParamType = ptUnknown
      end>
    DataSource = dsPessoaDesconto
    Left = 368
    Top = 136
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'CD_PESSOA_INDICADA'
        ParamType = ptUnknown
      end>
    object qryIndicadoCD_PESSOA: TIntegerField
      FieldName = 'CD_PESSOA'
      Required = True
    end
    object qryIndicadoNM_PESSOA: TStringField
      FieldName = 'NM_PESSOA'
      Size = 60
    end
  end
  object dsBeneficiado: TDataSource
    DataSet = qryBeneficiado
    Left = 240
    Top = 136
  end
  object dsIndicado: TDataSource
    DataSet = qryIndicado
    Left = 328
    Top = 136
  end
  object qryPlanosDesconto: TUMZReadOnlyQuery
    Connection = DM.db
    SortedFields = 'DESCRICAOPLANO'
    SQL.Strings = (
      'SELECT'
      '   CODIGO,'
      '   DESCRICAOPLANO,'
      '   PERCENTUALDESCONTO,'
      '   VALORDESCONTO,'
      '   CD_ACAO_MOVIMENTO,'
      '   SN_CONDICIONAL,'
      '   CD_TIPO_DESCONTO,'
      '   SN_PRIMEIRA_PARCELA'
      'FROM'
      '   PLANOSDESCONTO')
    Params = <>
    IndexFieldNames = 'DESCRICAOPLANO Asc'
    Left = 367
    Top = 177
    object qryPlanosDescontoCODIGO: TIntegerField
      FieldName = 'CODIGO'
    end
    object qryPlanosDescontoDESCRICAOPLANO: TStringField
      FieldName = 'DESCRICAOPLANO'
      Size = 255
    end
    object qryPlanosDescontoPERCENTUALDESCONTO: TFloatField
      FieldName = 'PERCENTUALDESCONTO'
    end
    object qryPlanosDescontoVALORDESCONTO: TFloatField
      FieldName = 'VALORDESCONTO'
    end
    object qryPlanosDescontoCD_ACAO_MOVIMENTO: TLargeintField
      FieldName = 'CD_ACAO_MOVIMENTO'
    end
    object qryPlanosDescontoSN_CONDICIONAL: TSmallintField
      FieldName = 'SN_CONDICIONAL'
    end
    object qryPlanosDescontoCD_TIPO_DESCONTO: TSmallintField
      FieldName = 'CD_TIPO_DESCONTO'
    end
    object qryPlanosDescontoSN_PRIMEIRA_PARCELA: TStringField
      FieldName = 'SN_PRIMEIRA_PARCELA'
      Size = 1
    end
  end
  object qryResponsavelDivisao: TUMZReadOnlyQuery
    Connection = DM.db
    SQL.Strings = (
      'SELECT'
      '   CD_PESSOA,'
      '   NM_PESSOA'
      'FROM'
      '   PESSOAS'
      'WHERE'
      '   CD_PESSOA = :CD_RESPONSAVEL')
    Params = <
      item
        DataType = ftUnknown
        Name = 'CD_RESPONSAVEL'
        ParamType = ptUnknown
      end>
    DataSource = dsPessoaDesconto
    Left = 368
    Top = 216
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'CD_RESPONSAVEL'
        ParamType = ptUnknown
      end>
    object qryResponsavelDivisaoCD_PESSOA: TIntegerField
      FieldName = 'CD_PESSOA'
      Required = True
    end
    object qryResponsavelDivisaoNM_PESSOA: TStringField
      FieldName = 'NM_PESSOA'
      Size = 60
    end
  end
  object dsResponsavelDivisao: TDataSource
    DataSet = qryResponsavelDivisao
    Left = 328
    Top = 216
  end
  object qryDepartamentos: TUMZReadOnlyQuery
    Connection = DM.db
    SortedFields = 'DESCRICAO'
    SQL.Strings = (
      'SELECT'
      '   D.CODIGO,'
      '   D.DESCRICAO,'
      '   D.RAZAOSOCIAL,'
      '   D.CD_CAIXA,'
      '   D.CD_COLIGADA,'
      '   D.CD_INSTITUICAO'
      'FROM'
      '   DEPARTAMENTOS D'
      '   INNER JOIN COLIGADAS C ON ( C.cd_coligada = D.cd_coligada )'
      'WHERE'
      '   C.cd_coligada_matriz = :cd_coligada_matriz')
    Params = <
      item
        DataType = ftUnknown
        Name = 'cd_coligada_matriz'
        ParamType = ptUnknown
      end>
    IndexFieldNames = 'DESCRICAO Asc'
    Left = 368
    Top = 256
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'cd_coligada_matriz'
        ParamType = ptUnknown
      end>
    object qryDepartamentosCODIGO: TSmallintField
      FieldName = 'CODIGO'
    end
    object qryDepartamentosDESCRICAO: TStringField
      FieldName = 'DESCRICAO'
      Size = 50
    end
    object qryDepartamentosRAZAOSOCIAL: TStringField
      FieldName = 'RAZAOSOCIAL'
      Size = 50
    end
    object qryDepartamentosCD_CAIXA: TIntegerField
      FieldName = 'CD_CAIXA'
    end
    object qryDepartamentosCD_COLIGADA: TIntegerField
      FieldName = 'CD_COLIGADA'
      Required = True
    end
    object qryDepartamentosCD_INSTITUICAO: TIntegerField
      FieldName = 'CD_INSTITUICAO'
    end
  end
  object qryTiposTitulo: TUMZReadOnlyQuery
    Connection = DM.db
    SortedFields = 'DS_TIPO_TITULO'
    SQL.Strings = (
      'SELECT'
      '   CD_TIPO_TITULO,'
      '   DS_TIPO_TITULO,'
      '   CD_COLIGADA_MATRIZ'
      'FROM'
      '   fin_config_tipos_titulo'
      'WHERE'
      '   ct_tipo_titulo = 1 AND '
      '   cd_coligada_matriz = :cd_coligada_matriz'
      '   AND sn_ativo = 1')
    Params = <
      item
        DataType = ftUnknown
        Name = 'cd_coligada_matriz'
        ParamType = ptUnknown
      end>
    IndexFieldNames = 'DS_TIPO_TITULO Asc'
    Left = 368
    Top = 296
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'cd_coligada_matriz'
        ParamType = ptUnknown
      end>
    object qryTiposTituloCD_TIPO_TITULO: TIntegerField
      FieldName = 'CD_TIPO_TITULO'
      Required = True
    end
    object qryTiposTituloDS_TIPO_TITULO: TStringField
      FieldName = 'DS_TIPO_TITULO'
      Size = 255
    end
    object qryTiposTituloCD_COLIGADA_MATRIZ: TIntegerField
      FieldName = 'CD_COLIGADA_MATRIZ'
      Required = True
    end
  end
  object qryTposTituloDesc: TUMZQuery
    Connection = DM.db
    SQL.Strings = (
      'SELECT'
      '   CD_DESCONTO_PESSOA,'
      '   CD_TIPO_TITULO,'
      '   CD_COLIGADA'
      'FROM'
      '   FIN_TP_TITULOS_PESSOAS_DESC'
      'WHERE'
      '   CD_DESCONTO_PESSOA = :CD_DESCONTO_PESSOA')
    Params = <
      item
        DataType = ftUnknown
        Name = 'CD_DESCONTO_PESSOA'
        ParamType = ptUnknown
      end>
    DataSource = dsPessoaDesconto
    Left = 368
    Top = 336
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'CD_DESCONTO_PESSOA'
        ParamType = ptUnknown
      end>
    object qryTposTituloDescCD_DESCONTO_PESSOA: TIntegerField
      FieldName = 'CD_DESCONTO_PESSOA'
      Required = True
    end
    object qryTposTituloDescCD_TIPO_TITULO: TSmallintField
      FieldName = 'CD_TIPO_TITULO'
      Required = True
    end
    object qryTposTituloDescCD_COLIGADA: TSmallintField
      FieldName = 'CD_COLIGADA'
      Required = True
    end
    object qryTposTituloDescDS_TIPO_TITULO: TStringField
      FieldKind = fkLookup
      FieldName = 'DS_TIPO_TITULO'
      LookupDataSet = qryTiposTitulo
      LookupKeyFields = 'CD_TIPO_TITULO'
      LookupResultField = 'DS_TIPO_TITULO'
      KeyFields = 'CD_TIPO_TITULO'
      Size = 256
      Lookup = True
    end
  end
  object dsPlanosDesconto: TDataSource
    DataSet = qryPlanosDesconto
    Left = 328
    Top = 176
  end
  object cdsTposTituloDesc: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspTposTituloDesc'
    AfterOpen = cdsTposTituloDescAfterOpen
    BeforePost = cdsTposTituloDescBeforePost
    AfterPost = cdsTposTituloDescAfterPost
    OnNewRecord = cdsTposTituloDescNewRecord
    Left = 368
    Top = 376
    object cdsTposTituloDescCD_DESCONTO_PESSOA: TIntegerField
      FieldName = 'CD_DESCONTO_PESSOA'
    end
    object cdsTposTituloDescCD_TIPO_TITULO: TIntegerField
      FieldName = 'CD_TIPO_TITULO'
    end
    object cdsTposTituloDescCD_COLIGADA: TIntegerField
      FieldName = 'CD_COLIGADA'
    end
    object cdsTposTituloDescDS_TIPO_TITULO: TStringField
      DisplayWidth = 256
      FieldKind = fkLookup
      FieldName = 'DS_TIPO_TITULO'
      LookupDataSet = qryTiposTitulo
      LookupKeyFields = 'CD_TIPO_TITULO'
      LookupResultField = 'DS_TIPO_TITULO'
      KeyFields = 'CD_TIPO_TITULO'
      Size = 256
      Lookup = True
    end
  end
  object dspTposTituloDesc: TDataSetProvider
    DataSet = qryTposTituloDesc
    UpdateMode = upWhereKeyOnly
    Left = 408
    Top = 376
  end
  object dsTiposTituloDesc: TDataSource
    DataSet = cdsTposTituloDesc
    Left = 328
    Top = 376
  end
  object qryVerificaConflito: TUMZReadOnlyQuery
    Connection = DM.db
    SQL.Strings = (
      'SELECT'
      '   CD_DESCONTO_PESSOA'
      'FROM'
      '   PESSOAS_DESCONTOS'
      'WHERE'
      '   DT_FIM > NOW() AND'
      '   CD_PESSOA = :CD_PESSOA AND'
      '   TP_DESCONTO = 2 AND'
      '   CD_DESCONTO_PESSOA != :CD_DESCONTO_PESSOA AND'
      '   :DT_INICIO BETWEEN DT_INICIO AND DT_FIM OR'
      '   :DT_FIM BETWEEN DT_INICIO AND DT_FIM')
    Params = <
      item
        DataType = ftUnknown
        Name = 'CD_PESSOA'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'CD_DESCONTO_PESSOA'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'DT_INICIO'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'DT_FIM'
        ParamType = ptUnknown
      end>
    Left = 544
    Top = 464
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'CD_PESSOA'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'CD_DESCONTO_PESSOA'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'DT_INICIO'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'DT_FIM'
        ParamType = ptUnknown
      end>
    object qryVerificaConflitoCD_DESCONTO_PESSOA: TLargeintField
      FieldName = 'CD_DESCONTO_PESSOA'
      Required = True
    end
  end
  object qryCursos: TUMZReadOnlyQuery
    Connection = DM.db
    SortedFields = 'DS_CURSO'
    SQL.Strings = (
      'SELECT'
      '   cm.CD_CURSO,'
      #9' cm.DS_CURSO'
      'FROM'
      '   cursos_mestre cm'
      
        #9' INNER JOIN cursos_coligadas cc ON ( cm.cd_curso = cc.CD_CURSO ' +
        ')'
      'WHERE'
      '   cc.cd_coligada = :cd_coligada'
      'AND'
      '   cm.sn_ativo = 1')
    Params = <
      item
        DataType = ftUnknown
        Name = 'cd_coligada'
        ParamType = ptUnknown
      end>
    IndexFieldNames = 'DS_CURSO Asc'
    Left = 408
    Top = 256
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'cd_coligada'
        ParamType = ptUnknown
      end>
    object qryCursosCD_CURSO: TStringField
      FieldName = 'CD_CURSO'
      Size = 255
    end
    object qryCursosDS_CURSO: TStringField
      FieldName = 'DS_CURSO'
      Size = 255
    end
  end
end
