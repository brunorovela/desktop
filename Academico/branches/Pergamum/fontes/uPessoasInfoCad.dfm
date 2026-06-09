object fPessoasInfoCad: TfPessoasInfoCad
  Left = 0
  Top = 0
  BorderStyle = bsDialog
  Caption = 'Cadastro de Contatos e Informa'#231#245'es'
  ClientHeight = 623
  ClientWidth = 710
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -13
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = True
  Position = poDesktopCenter
  OnClose = FormClose
  OnCreate = FormCreate
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 16
  object Panel1: TPanel
    Left = 0
    Top = 598
    Width = 710
    Height = 25
    Align = alBottom
    BevelOuter = bvNone
    TabOrder = 0
    object btnOk: TBitBtn
      Left = 486
      Top = 0
      Width = 112
      Height = 25
      Align = alRight
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
      Left = 598
      Top = 0
      Width = 112
      Height = 25
      Align = alRight
      Cancel = True
      Caption = 'Cancelar'
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Arial'
      Font.Style = []
      ModalResult = 2
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
  object PageControl1: TPageControl
    Left = 0
    Top = 0
    Width = 710
    Height = 598
    ActivePage = tsInfo
    Align = alClient
    TabOrder = 1
    object tsInfo: TTabSheet
      Caption = 'Informa'#231#245'es de contato'
      object Panel3: TPanel
        Left = 0
        Top = 0
        Width = 702
        Height = 567
        Align = alClient
        BevelOuter = bvNone
        TabOrder = 0
        object Label2: TLabel
          Left = 9
          Top = 62
          Width = 142
          Height = 16
          Caption = 'Descri'#231#227'o da Informa'#231#227'o'
        end
        object Label3: TLabel
          Left = 9
          Top = 152
          Width = 161
          Height = 16
          Hint = 
            'Informe um nome e tecle ENTER para localizar entre os nomes seme' +
            'lhantes dispon'#237'veis no banco de dados.'
          Caption = 'Nome da Pessoa de Contato'
          ParentShowHint = False
          ShowHint = True
        end
        object sbSelecionaPessoa: TSpeedButton
          Left = 664
          Top = 174
          Width = 30
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
          OnClick = sbSelecionaPessoaClick
        end
        object lblFone2: TLabel
          Left = 185
          Top = 200
          Width = 111
          Height = 16
          Caption = 'Telefone Comercial'
        end
        object Label6: TLabel
          Left = 9
          Top = 248
          Width = 35
          Height = 16
          Caption = 'E-Mail'
        end
        object Label5: TLabel
          Left = 284
          Top = 454
          Width = 56
          Height = 16
          Caption = 'Data Info.'
          FocusControl = DBEdit5
        end
        object Label7: TLabel
          Left = 382
          Top = 301
          Width = 109
          Height = 16
          Caption = 'Turma Interessada'
          FocusControl = dbe_turma
        end
        object lblCidade: TLabel
          Left = 441
          Top = 355
          Width = 39
          Height = 16
          Caption = 'Cidade'
        end
        object lblEstado: TLabel
          Left = 225
          Top = 355
          Width = 38
          Height = 16
          Caption = 'Estado'
        end
        object Label11: TLabel
          Left = 7
          Top = 10
          Width = 51
          Height = 16
          Caption = 'Unidade:'
        end
        object Label13: TLabel
          Left = 228
          Top = 405
          Width = 53
          Height = 16
          Caption = 'Endere'#231'o'
        end
        object Label12: TLabel
          Left = 7
          Top = 457
          Width = 224
          Height = 16
          Caption = 'Forma que ficou sabendo da institui'#231#227'o'
        end
        object lblFone1: TLabel
          Left = 9
          Top = 200
          Width = 118
          Height = 16
          Caption = 'Telefone Residencial'
        end
        object lblFone3: TLabel
          Left = 367
          Top = 200
          Width = 51
          Height = 16
          Caption = 'Celular 1'
        end
        object lblFone4: TLabel
          Left = 541
          Top = 200
          Width = 51
          Height = 16
          Caption = 'Celular 2'
        end
        object Label1: TLabel
          Left = 9
          Top = 300
          Width = 33
          Height = 16
          Caption = 'Curso'
          FocusControl = dbe_turma
        end
        object btnCodigoCurso: TSpeedButton
          Left = 347
          Top = 322
          Width = 29
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
          OnClick = btnCodigoCursoClick
        end
        object btnCodigoTurma: TSpeedButton
          Left = 628
          Top = 322
          Width = 30
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
          OnClick = btnCodigoTurmaClick
        end
        object Label4: TLabel
          Left = 382
          Top = 249
          Width = 77
          Height = 16
          Caption = #193'rea/Assunto'
          FocusControl = dbe_turma
        end
        object btnAreaAssunto: TSpeedButton
          Left = 664
          Top = 270
          Width = 30
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
          OnClick = btnAreaAssuntoClick
        end
        object Label14: TLabel
          Left = 480
          Top = 456
          Width = 90
          Height = 16
          Caption = 'Data de retorno'
          FocusControl = dbe_turma
        end
        object Label16: TLabel
          Left = 257
          Top = 10
          Width = 41
          Height = 16
          Caption = 'Status:'
        end
        object Label17: TLabel
          Left = 484
          Top = 10
          Width = 54
          Height = 16
          Caption = 'Consultor'
        end
        object nm_vendedor: TLabel
          Left = 481
          Top = 35
          Width = 78
          Height = 16
          Caption = 'nm_vendedor'
        end
        object Label18: TLabel
          Left = 603
          Top = 457
          Width = 91
          Height = 16
          Caption = 'Hora de retorno'
          FocusControl = dbe_turma
        end
        object sbMaisInformacoes: TSpeedButton
          Left = 502
          Top = 529
          Width = 192
          Height = 25
          Caption = 'F10   Mais Informa'#231#245'es >>'
          Flat = True
          NumGlyphs = 2
          OnClick = sbMaisInformacoesClick
        end
        object LabelNumero: TLabel
          Left = 613
          Top = 405
          Width = 45
          Height = 16
          Caption = 'Numero'
        end
        object sbBuscaCep: TSpeedButton
          Left = 189
          Top = 375
          Width = 30
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
          OnClick = sbBuscaCepClick
        end
        object lbCep: TLabel
          Left = 9
          Top = 355
          Width = 22
          Height = 16
          Caption = 'CEP'
        end
        object lbBairro: TLabel
          Left = 9
          Top = 405
          Width = 34
          Height = 16
          Caption = 'Bairro'
        end
        object Label15: TLabel
          Left = 9
          Top = 507
          Width = 93
          Height = 16
          Caption = 'Informa'#231#227'o por:'
        end
        object btnImprimirRelatorio: TSpeedButton
          Left = 664
          Top = 322
          Width = 30
          Height = 24
          Flat = True
          Glyph.Data = {
            36030000424D3603000000000000360000002800000010000000100000000100
            18000000000000030000120B0000120B00000000000000000000FF00FFFF00FF
            FF00FFFF00FF6C6A6A6C6A6AFF00FFFF00FF6C6A6A6C6A6AFF00FFFF00FFFF00
            FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF6C6A6AAAA7A7A19F9F6C6A6A6C
            6A6A6C6A6AE5E3E36C6A6A6C6A6A6C6A6AFF00FFFF00FFFF00FFFF00FFFF00FF
            6C6A6ADAD9D9A19F9FA19F9FA19F9F3736363535356C6D6DBFBFBFE1E2E2B7B6
            B66C6A6A6C6A6A6C6A6AFF00FF6C6A6AD4D3D3CACACA8E8C8C8E8C8C8E8C8C3C
            3B3B0A090A0707070B0B0B0707077A7A7ABBBBBB6C6A6AFF00FF6C6A6ACACACA
            CACACA8E8C8CD7D4D4CECBCBBFBCBCB1AFAFA3A0A08886865E5B5C0707070909
            090808086C6A6A7673736C6A6ACACACA8E8C8CEFEEEEFFFEFEFBFAFAE3E0E1DE
            DEDEDEDDDDCFCECEBDBCBCADABAB8B89895856567A78787573736C6A6A8E8C8C
            FFFFFFFEFCFCFAFAFAD5D4D5989193A09899B2ABACC4C0C1D7D7D7D8D8D8C7C6
            C6B7B6B6918F8F6C6969FF00FF6C6A6A6C6A6AEDEBEBB1A6A77A6F728A838896
            92959690919D97989A93959E9899BBBABAD1D1D1C2C2C26C6A6AFF00FFFF00FF
            FF00FF6C6A6ABB897FA7876D8B6F647D67606F62657973798F8B8EA9A3A4CBCA
            CAC1C1C16C6A6AFF00FFFF00FFFF00FFFF00FFFF00FFBD8281FFE3B4FFD39FE9
            B281C99973BA916CBD8281807D7E6C6A6A6C6A6AFF00FFFF00FFFF00FFFF00FF
            FF00FFFF00FFBD8281FFE0B8FFD3A7FFD09DFFCE90FFC688BD8281FF00FFFF00
            FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFC08683FFE7CFFFE0C0FFD9B2FF
            D3A5FFD099BD8281FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
            FF00FFBD8281FEEBD8FFE6CCFFDEBDFFD8B1FED3A4BD8281FF00FFFF00FFFF00
            FFFF00FFFF00FFFF00FFFF00FFFF00FFBD8281FFFFF2FFFFF2FFEBD8FFE5CAFF
            E1BDF3C7A7BD8281FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
            BD8281BD8281BD8281FBEFE2FBE3CFFBDDC2BD8281FF00FFFF00FFFF00FFFF00
            FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFBD8281BD8281BD
            8281FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF}
          Layout = blGlyphTop
          OnClick = btnImprimirRelatorioClick
        end
        object cbNomePessoa: TComboBox
          Left = 9
          Top = 174
          Width = 649
          Height = 24
          Hint = 
            'Informe um nome e tecle ENTER para localizar entre os nomes seme' +
            'lhantes dispon'#237'veis no banco de dados.'
          AutoDropDown = True
          ItemHeight = 16
          ParentShowHint = False
          ShowHint = True
          Sorted = True
          TabOrder = 3
          OnChange = cbNomePessoaChange
          OnExit = cbNomePessoaExit
          OnKeyPress = cbNomePessoaKeyPress
          OnSelect = cbNomePessoaSelect
        end
        object DBEdit1: TDBEdit
          Left = 185
          Top = 222
          Width = 156
          Height = 24
          DataField = 'ds_telefone2'
          DataSource = fPessoasInformacoes.dsPessoasInfo
          TabOrder = 5
          OnKeyPress = DBEdit2KeyPress
        end
        object DBEdit6: TDBEdit
          Left = 9
          Top = 270
          Width = 352
          Height = 24
          DataField = 'ds_email'
          DataSource = fPessoasInformacoes.dsPessoasInfo
          TabOrder = 8
          OnKeyPress = DBEdit2KeyPress
        end
        object DBEdit5: TDBEdit
          Left = 284
          Top = 477
          Width = 185
          Height = 24
          DataField = 'dt_informacao'
          DataSource = fPessoasInformacoes.dsPessoasInfo
          MaxLength = 16
          TabOrder = 19
          OnKeyPress = DBEdit2KeyPress
        end
        object dbe_turma: TDBEdit
          Left = 383
          Top = 323
          Width = 239
          Height = 24
          CharCase = ecUpperCase
          DataField = 'cd_turma'
          DataSource = fPessoasInformacoes.dsPessoasInfo
          TabOrder = 11
        end
        object dblcMunicipios: TDBLookupComboBox
          Left = 441
          Top = 375
          Width = 253
          Height = 24
          DataField = 'ds_cidade_lk'
          DataSource = fPessoasInformacoes.dsPessoasInfo
          TabOrder = 14
        end
        object dblcEstados: TDBLookupComboBox
          Left = 224
          Top = 375
          Width = 210
          Height = 24
          DataField = 'ds_estado'
          DataSource = fPessoasInformacoes.dsPessoasInfo
          TabOrder = 13
        end
        object cbUnidadeEnsino: TUMComboBox
          Left = 9
          Top = 32
          Width = 231
          Height = 24
          Style = csDropDownList
          ItemHeight = 16
          TabOrder = 0
          OnSelect = cbUnidadeEnsinoSelect
          TamanhoMaximo = 0
        end
        object DBEdit3: TDBEdit
          Left = 228
          Top = 426
          Width = 379
          Height = 24
          DataField = 'ds_endereco'
          DataSource = fPessoasInformacoes.dsPessoasInfo
          TabOrder = 16
          OnKeyPress = DBEdit2KeyPress
        end
        object cbFormaConheceu: TComboBox
          Left = 7
          Top = 479
          Width = 271
          Height = 22
          Style = csOwnerDrawFixed
          ItemHeight = 16
          TabOrder = 18
        end
        object DBEdit12: TDBEdit
          Left = 541
          Top = 222
          Width = 153
          Height = 24
          DataField = 'ds_telefone4'
          DataSource = fPessoasInformacoes.dsPessoasInfo
          TabOrder = 7
          OnKeyPress = DBEdit2KeyPress
        end
        object DBEdit13: TDBEdit
          Left = 9
          Top = 322
          Width = 332
          Height = 24
          DataField = 'ds_curso'
          DataSource = fPessoasInformacoes.dsPessoasInfo
          TabOrder = 10
          OnChange = DBEdit13Change
        end
        object DBEdit11: TDBEdit
          Left = 367
          Top = 222
          Width = 149
          Height = 24
          DataField = 'ds_telefone3'
          DataSource = fPessoasInformacoes.dsPessoasInfo
          TabOrder = 6
          OnKeyPress = DBEdit2KeyPress
        end
        object DBEdit4: TDBEdit
          Left = 9
          Top = 222
          Width = 152
          Height = 24
          DataField = 'ds_contatos'
          DataSource = fPessoasInformacoes.dsPessoasInfo
          TabOrder = 4
          OnKeyPress = DBEdit2KeyPress
        end
        object umdtRetorno: TUMDateTimePicker
          Left = 500
          Top = 477
          Width = 97
          Height = 24
          BevelOuter = bvNone
          TabOrder = 21
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
          Date = 42256.000000000000000000
          InverterPosicaoCalendario = False
          MostraCalenadarioDesdeCampoTexto = False
        end
        object dbDsInformacao: TDBMemo
          Left = 9
          Top = 84
          Width = 685
          Height = 62
          DataField = 'ds_informacao'
          DataSource = fPessoasInformacoes.dsPessoasInfo
          MaxLength = 200
          ScrollBars = ssVertical
          TabOrder = 2
        end
        object checksnretorno: TCheckBox
          Left = 482
          Top = 480
          Width = 12
          Height = 17
          Caption = ' '
          TabOrder = 20
          OnClick = checksnretornoClick
        end
        object cbAreaAssunto: TUMComboBox
          Left = 382
          Top = 271
          Width = 276
          Height = 24
          Style = csDropDownList
          ItemHeight = 16
          TabOrder = 9
          TamanhoMaximo = 0
        end
        object cbStatus: TUMComboBox
          Left = 257
          Top = 32
          Width = 210
          Height = 24
          Style = csDropDownList
          ItemHeight = 16
          TabOrder = 1
          OnSelect = cbUnidadeEnsinoSelect
          TamanhoMaximo = 0
        end
        object dbe_horaRetorno: TDBEdit
          Left = 603
          Top = 477
          Width = 91
          Height = 24
          DataField = 'dt_retorno'
          DataSource = fPessoasInformacoes.dsPessoasInfo
          TabOrder = 22
        end
        object dbBairro: TDBEdit
          Left = 12
          Top = 426
          Width = 210
          Height = 24
          DataField = 'ds_bairro'
          DataSource = fPessoasInformacoes.dsPessoasInfo
          TabOrder = 15
        end
        object dbCep: TDBEdit
          Left = 12
          Top = 375
          Width = 174
          Height = 24
          DataField = 'ds_cep'
          DataSource = fPessoasInformacoes.dsPessoasInfo
          TabOrder = 12
        end
        object edNumero: TDBEdit
          Left = 616
          Top = 426
          Width = 78
          Height = 24
          DataField = 'ds_endereco_nro'
          DataSource = fPessoasInformacoes.dsPessoasInfo
          TabOrder = 17
        end
        object cbInfoPor: TUMComboBox
          Left = 9
          Top = 529
          Width = 332
          Height = 24
          Style = csDropDownList
          ItemHeight = 16
          TabOrder = 23
          TamanhoMaximo = 0
        end
      end
    end
    object tsObs: TTabSheet
      Caption = 'Observa'#231#245'es'
      ImageIndex = 1
      object pannelobs: TPanel
        Left = 0
        Top = 0
        Width = 702
        Height = 567
        Align = alClient
        TabOrder = 0
        object Panel4: TPanel
          Left = 1
          Top = 61
          Width = 700
          Height = 50
          Align = alTop
          BevelOuter = bvNone
          TabOrder = 1
          Visible = False
          object Label9: TLabel
            Left = 8
            Top = -2
            Width = 37
            Height = 16
            Caption = 'Label9'
          end
          object DBEdit9: TDBEdit
            Left = 8
            Top = 18
            Width = 425
            Height = 24
            DataField = 'ds_obs2'
            DataSource = fPessoasInformacoes.dsPessoasInfo
            TabOrder = 0
            OnKeyPress = DBEdit2KeyPress
          end
        end
        object Panel2: TPanel
          Left = 1
          Top = 111
          Width = 700
          Height = 50
          Align = alTop
          BevelOuter = bvNone
          TabOrder = 2
          Visible = False
          object Label10: TLabel
            Left = 8
            Top = -2
            Width = 44
            Height = 16
            Caption = 'Label10'
          end
          object DBEdit10: TDBEdit
            Left = 8
            Top = 20
            Width = 425
            Height = 24
            DataField = 'ds_obs3'
            DataSource = fPessoasInformacoes.dsPessoasInfo
            TabOrder = 0
            OnKeyPress = DBEdit2KeyPress
          end
        end
        object Panel5: TPanel
          Left = 1
          Top = 1
          Width = 700
          Height = 60
          Align = alTop
          BevelOuter = bvNone
          TabOrder = 0
          Visible = False
          object Label8: TLabel
            Left = 9
            Top = 4
            Width = 37
            Height = 16
            Caption = 'Label8'
          end
          object DBEdit8: TDBEdit
            Left = 8
            Top = 26
            Width = 425
            Height = 24
            DataField = 'ds_obs1'
            DataSource = fPessoasInformacoes.dsPessoasInfo
            TabOrder = 0
            OnKeyPress = DBEdit2KeyPress
          end
        end
        object Panel6: TPanel
          Left = 1
          Top = 161
          Width = 700
          Height = 120
          Align = alTop
          BevelOuter = bvNone
          TabOrder = 3
          Visible = False
          object lbl11: TLabel
            Left = 9
            Top = 4
            Width = 27
            Height = 16
            Caption = 'lbl11'
          end
          object DBMemo1: TDBMemo
            Left = 8
            Top = 26
            Width = 425
            Height = 79
            DataField = 'ds_obs4'
            DataSource = fPessoasInformacoes.dsPessoasInfo
            TabOrder = 0
            Visible = False
          end
        end
      end
    end
  end
  object qryPessoas: TUMZQuery
    Connection = DM.db
    SQL.Strings = (
      'SELECT'
      '   cd_pessoa,'
      '   nm_pessoa'
      'FROM'
      '   pessoas'
      'WHERE'
      '   nm_pessoa LIKE :nm_pessoa')
    Params = <
      item
        DataType = ftUnknown
        Name = 'nm_pessoa'
        ParamType = ptUnknown
      end>
    Left = 398
    Top = 8
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'nm_pessoa'
        ParamType = ptUnknown
      end>
    object qryPessoascd_pessoa: TIntegerField
      FieldName = 'cd_pessoa'
      Origin = 'WMESTRE12.pessoas.cd_pessoa'
    end
    object qryPessoasnm_pessoa: TStringField
      FieldName = 'nm_pessoa'
      Origin = 'WMESTRE12.pessoas.nm_pessoa'
      Size = 60
    end
  end
  object qryInfoPor: TUMZQuery
    Connection = DM.db
    SQL.Strings = (
      'SELECT '
      #9's.cd_situacao cd_situacao,'
      #9's.ds_valor ds_valor'#9
      'FROM'#9
      #9'situacoes s'
      'WHERE'
      #9's.cd_modulo = 30005'
      'ORDER BY '
      '   s.ds_valor ASC')
    Params = <>
    Left = 352
    Top = 552
  end
end
