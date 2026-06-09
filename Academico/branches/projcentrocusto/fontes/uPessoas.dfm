object frm_Pessoas: Tfrm_Pessoas
  Left = 185
  Top = 123
  Caption = 'Cadastro de Pessoas'
  ClientHeight = 582
  ClientWidth = 925
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  FormStyle = fsMDIChild
  KeyPreview = True
  OldCreateOrder = False
  Position = poDefault
  ShowHint = True
  Visible = True
  WindowState = wsMaximized
  OnClose = FormClose
  OnCreate = FormCreate
  OnDestroy = FormDestroy
  OnKeyDown = FormKeyDown
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object Panel3: TPanel
    Left = 0
    Top = 0
    Width = 925
    Height = 25
    Align = alTop
    Alignment = taLeftJustify
    BevelOuter = bvLowered
    Color = clBlue
    Font.Charset = ANSI_CHARSET
    Font.Color = clWhite
    Font.Height = -16
    Font.Name = 'Arial'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 1
    object DBText1: TDBText
      Left = 95
      Top = 0
      Width = 501
      Height = 19
      DataField = 'nm_pessoa'
      DataSource = dsPessoa
    end
    object DBText2: TDBText
      Left = 0
      Top = 2
      Width = 89
      Height = 19
      Alignment = taRightJustify
      DataField = 'cd_pessoa'
      DataSource = dsPessoa
      OnDblClick = DBText2DblClick
    end
  end
  object toolPessoa: TToolBar
    Left = 0
    Top = 557
    Width = 925
    Height = 25
    Align = alBottom
    ButtonWidth = 139
    Caption = 'toolPessoa'
    EdgeBorders = [ebTop, ebBottom]
    Images = ImageList1
    List = True
    ShowCaptions = True
    TabOrder = 2
    object ToolButton6: TToolButton
      Left = 0
      Top = 0
      Width = 8
      Caption = 'ToolButton6'
      ImageIndex = 10
      Style = tbsSeparator
    end
    object DBNavigator1: TDBNavigator
      Left = 8
      Top = 0
      Width = 48
      Height = 22
      DataSource = dsPessoa
      VisibleButtons = [nbPrior, nbNext]
      Flat = True
      TabOrder = 0
    end
    object ToolButton1: TToolButton
      Left = 56
      Top = 0
      Width = 8
      Caption = 'ToolButton1'
      ImageIndex = 9
      Style = tbsSeparator
    end
    object btIncluir_Pessoa: TToolButton
      Left = 64
      Top = 0
      AutoSize = True
      Caption = 'F2 Incluir'
      ImageIndex = 0
      OnClick = btIncluir_PessoaClick
    end
    object btAlterar_Pessoa: TToolButton
      Left = 138
      Top = 0
      AutoSize = True
      Caption = 'F3 Alterar'
      ImageIndex = 1
      OnClick = btAlterar_PessoaClick
    end
    object btExcluir_Pessoa: TToolButton
      Left = 214
      Top = 0
      AutoSize = True
      Caption = 'F9 Excluir'
      ImageIndex = 2
      OnClick = btExcluir_PessoaClick
    end
    object ToolButton4: TToolButton
      Left = 291
      Top = 0
      Width = 8
      Caption = 'ToolButton4'
      ImageIndex = 3
      Style = tbsSeparator
    end
    object btSalvar_Pessoa: TToolButton
      Left = 299
      Top = 0
      AutoSize = True
      Caption = 'F5 Salvar'
      ImageIndex = 3
      OnClick = btSalvar_PessoaClick
    end
    object btCancelar_Pessoa: TToolButton
      Left = 375
      Top = 0
      AutoSize = True
      Caption = 'F6 Cancelar'
      ImageIndex = 4
      OnClick = btCancelar_PessoaClick
    end
    object ToolButton8: TToolButton
      Left = 463
      Top = 0
      Width = 8
      Caption = 'ToolButton8'
      ImageIndex = 6
      Style = tbsSeparator
    end
    object btnObservacoes: TToolButton
      Left = 471
      Top = 0
      Caption = 'Orienta'#231#227'o Pedag'#243'gica'
      ImageIndex = 1
      Visible = False
      OnClick = btnObservacoesClick
    end
    object btn_ImprimirAcade: TToolButton
      Left = 610
      Top = 0
      AutoSize = True
      Caption = 'F7 Imprimir'
      ImageIndex = 6
      Visible = False
    end
    object btBuscar_Pessoa: TToolButton
      Left = 691
      Top = 0
      AutoSize = True
      Caption = 'F8 Buscar'
      ImageIndex = 5
      OnClick = btBuscar_PessoaClick
    end
    object ToolButton11: TToolButton
      Left = 770
      Top = 0
      Width = 8
      Caption = 'ToolButton11'
      ImageIndex = 7
      Style = tbsSeparator
    end
    object btFechar_Pessoa: TToolButton
      Left = 778
      Top = 0
      AutoSize = True
      Caption = 'F12 Fechar'
      ImageIndex = 7
      OnClick = btFechar_PessoaClick
    end
    object ToolButton2: TToolButton
      Left = 863
      Top = 0
      Width = 8
      Caption = 'ToolButton2'
      ImageIndex = 8
      Style = tbsSeparator
    end
  end
  object pgPessoa: TPageControl
    Left = 0
    Top = 25
    Width = 925
    Height = 532
    ActivePage = tsComplementares
    Align = alClient
    Style = tsFlatButtons
    TabOrder = 0
    OnChange = pgPessoaChange
    OnChanging = pgPessoaChanging
    object tsDadosPessoais: TTabSheet
      Caption = 'DADOS PESSOAIS'
      object lbNomeSocial: TLabel
        Left = 6
        Top = 39
        Width = 58
        Height = 13
        Caption = 'Nome social'
        FocusControl = dbNome
        Visible = False
      end
      object Label2: TLabel
        Left = 561
        Top = -1
        Width = 82
        Height = 13
        Caption = 'Data Nascimento'
        FocusControl = dbNasc
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
      end
      object Label3: TLabel
        Left = 451
        Top = 81
        Width = 64
        Height = 13
        Caption = 'Cidade Nasc.'
        Transparent = True
      end
      object Label5: TLabel
        Left = 412
        Top = -1
        Width = 24
        Height = 13
        Caption = 'Sexo'
      end
      object Label6: TLabel
        Left = 125
        Top = 81
        Width = 68
        Height = 13
        Caption = 'Nacionalidade'
      end
      object Label7: TLabel
        Left = 6
        Top = 125
        Width = 19
        Height = 13
        Caption = 'Cep'
        FocusControl = dbCep
      end
      object Label8: TLabel
        Left = 343
        Top = 125
        Width = 33
        Height = 13
        Caption = 'Cidade'
      end
      object Label9: TLabel
        Left = 116
        Top = 166
        Width = 54
        Height = 13
        Caption = 'Logradouro'
        FocusControl = dbEndereco
      end
      object Label10: TLabel
        Left = 469
        Top = 166
        Width = 64
        Height = 13
        Caption = 'Complemento'
        FocusControl = dbComplemento
      end
      object Label11: TLabel
        Left = 501
        Top = 125
        Width = 27
        Height = 13
        Caption = 'Bairro'
        FocusControl = dbBairro
      end
      object Label13: TLabel
        Left = 112
        Top = 125
        Width = 22
        Height = 13
        Caption = 'Pa'#237's'
      end
      object Label14: TLabel
        Left = 412
        Top = 39
        Width = 55
        Height = 13
        Caption = 'Estado Civil'
      end
      object Label38: TLabel
        Left = 398
        Top = 166
        Width = 37
        Height = 13
        Caption = 'N'#250'mero'
        FocusControl = DBEdit2
      end
      object Label41: TLabel
        Left = 6
        Top = 81
        Width = 53
        Height = 13
        Caption = 'Pa'#237's Nasc.'
      end
      object Label42: TLabel
        Left = 320
        Top = 81
        Width = 64
        Height = 13
        Caption = 'Estado Nasc.'
        FocusControl = DBLookupComboBox2
      end
      object Label4: TLabel
        Left = 234
        Top = 125
        Width = 33
        Height = 13
        Caption = 'Estado'
        FocusControl = DBLookupComboBox3
      end
      object sbCep: TSpeedButton
        Left = 80
        Top = 141
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
        OnClick = sbCepClick
      end
      object lbTipoLogradouro: TLabel
        Left = 4
        Top = 166
        Width = 78
        Height = 13
        Caption = 'Tipo Logradouro'
        FocusControl = dbEndereco
      end
      object lbNomeOficial: TLabel
        Left = 6
        Top = -1
        Width = 28
        Height = 13
        Caption = 'Nome'
      end
      object lbNomeSocialInfo: TLabel
        Left = 75
        Top = 39
        Width = 310
        Height = 14
        Caption = '(quando preenchido '#233' a informa'#231#227'o exibida em 100% do sistema)'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Times New Roman'
        Font.Style = [fsItalic]
        ParentFont = False
        Visible = False
      end
      object lbNomeOficialInfo: TLabel
        Left = 75
        Top = -1
        Width = 195
        Height = 14
        Caption = '(igual o documento de identifica'#231#227'o civil)'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Times New Roman'
        Font.Style = [fsItalic]
        ParentFont = False
        Visible = False
      end
      object umAjuda: TUMAjuda
        Left = 369
        Top = 53
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
        Transparent = True
        Visible = False
        Caption = 
          'Conforme resolu'#231#227'o n'#186' 12, de 16 de janeiro de 2015. '#13#10'Conselho n' +
          'acional de combate '#224' discrimina'#231#227'o e promo'#231#245'es dos direitos de l' +
          #233'sbicas, gays, travestis e transexuais - CNCD/LGBT.'#13#10#13#10'Secretari' +
          'a de Direitos Humanos.'#13#10'Presid'#234'ncia da Rep'#250'blica'
        Titulo = 'NOME SOCIAL'
        PanelWidth = 550
        PanelHeight = 300
      end
      object dbNomeOficial: TDBEdit
        Left = 6
        Top = 15
        Width = 389
        Height = 21
        DataField = 'nm_pessoa_oficial'
        DataSource = dsPessoa
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
        TabOrder = 0
        Visible = False
        OnExit = dbNomeOficialExit
        OnKeyPress = dbNomeKeyPress
      end
      object dbNome: TDBEdit
        Left = 6
        Top = 15
        Width = 389
        Height = 21
        DataField = 'nm_pessoa'
        DataSource = dsPessoa
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
        TabOrder = 1
        OnExit = dbNomeExit
        OnKeyPress = dbNomeKeyPress
      end
      object dbCidadeAtual: TDBLookupComboBox
        Left = 344
        Top = 141
        Width = 151
        Height = 21
        DataField = 'descMunicipioAtual'
        DataSource = dsPessoa
        TabOrder = 14
        OnKeyPress = dbNomeKeyPress
      end
      object dbCidadeNascimento: TDBLookupComboBox
        Left = 451
        Top = 98
        Width = 198
        Height = 21
        DataField = 'descMunicipio'
        DataSource = dsPessoa
        TabOrder = 10
        OnKeyPress = dbNomeKeyPress
      end
      object dbNasc: TDBEdit
        Left = 561
        Top = 15
        Width = 88
        Height = 21
        DataField = 'dt_nascimento'
        DataSource = dsPessoa
        TabOrder = 3
        OnKeyPress = dbNomeKeyPress
      end
      object dbSexo: TDBComboBox
        Left = 412
        Top = 15
        Width = 135
        Height = 22
        Style = csOwnerDrawFixed
        DataField = 'ds_sexo'
        DataSource = dsPessoa
        ItemHeight = 16
        Items.Strings = (
          'Masculino'
          'Feminino')
        TabOrder = 2
        OnKeyPress = dbNomeKeyPress
      end
      object Panel1: TPanel
        Left = 659
        Top = 16
        Width = 107
        Height = 122
        TabOrder = 23
        OnDblClick = imageFotoDblClick
        object ciFoto: TCropImage
          Left = 1
          Top = 1
          Width = 105
          Height = 120
          Align = alClient
          Border = False
          ToolWidth = 3
          Visible = False
          ExplicitLeft = 0
          ExplicitTop = 0
        end
        object imageFoto: TImage
          Left = 1
          Top = 1
          Width = 105
          Height = 120
          Align = alClient
          AutoSize = True
          Center = True
          PopupMenu = pmFoto
          Stretch = True
          OnDblClick = imageFotoDblClick
        end
        object imgWebCam: TVideoWindow
          Left = 1
          Top = 1
          Width = 105
          Height = 120
          FilterGraph = fWebcamDriver.filterGraph
          VMROptions.Mode = vmrRenderless
          Color = clBlack
          Visible = False
          Align = alClient
        end
      end
      object dbCep: TDBEdit
        Left = 6
        Top = 141
        Width = 75
        Height = 21
        DataField = 'ds_cep'
        DataSource = dsPessoa
        TabOrder = 11
        OnKeyPress = dbNomeKeyPress
      end
      object dbEndereco: TDBEdit
        Left = 118
        Top = 182
        Width = 273
        Height = 21
        DataField = 'ds_logradouro'
        DataSource = dsPessoa
        TabOrder = 17
        OnKeyPress = dbNomeKeyPress
      end
      object dbComplemento: TDBEdit
        Left = 469
        Top = 182
        Width = 181
        Height = 21
        DataField = 'ds_complemento'
        DataSource = dsPessoa
        TabOrder = 19
        OnKeyPress = dbComplementoKeyPress
      end
      object dbBairro: TDBEdit
        Left = 500
        Top = 141
        Width = 149
        Height = 21
        DataField = 'ds_bairro'
        DataSource = dsPessoa
        TabOrder = 15
        OnKeyPress = dbNomeKeyPress
      end
      object pcDocumentos: TPageControl
        Left = 1
        Top = 219
        Width = 765
        Height = 110
        ActivePage = TabSheet4
        MultiLine = True
        Style = tsFlatButtons
        TabOrder = 20
        OnChange = pcDocumentosChange
        object TabSheet2: TTabSheet
          Caption = 'Documenta'#231#227'o'
          object Label15: TLabel
            Left = 1
            Top = 0
            Width = 20
            Height = 13
            Caption = 'CPF'
            FocusControl = dbCpf
          end
          object Label16: TLabel
            Left = 152
            Top = -3
            Width = 50
            Height = 13
            Caption = 'Identidade'
            FocusControl = dbIdentidade
          end
          object Label17: TLabel
            Left = 303
            Top = 0
            Width = 67
            Height = 13
            Caption = 'Org'#227'o/Estado'
            FocusControl = dbOrgaoIdent
          end
          object Label12: TLabel
            Left = 454
            Top = 0
            Width = 76
            Height = 13
            Caption = 'Data Expedi'#231#227'o'
            FocusControl = DBEdit4
          end
          object sbMaisInformacoes: TSpeedButton
            Left = 605
            Top = 12
            Width = 145
            Height = 25
            Caption = 'F10   Mais Informa'#231#245'es >>'
            Flat = True
            NumGlyphs = 2
            OnClick = sbMaisInformacoesClick
          end
          object lblPassaporte: TLabel
            Left = 1
            Top = 41
            Width = 53
            Height = 13
            Caption = 'Passaporte'
            FocusControl = dbCpf
          end
          object dbCpf: TDBEdit
            Left = 1
            Top = 17
            Width = 145
            Height = 21
            CharCase = ecUpperCase
            DataField = 'ds_cpf'
            DataSource = dsPessoa
            TabOrder = 0
            OnKeyPress = dbNomeKeyPress
          end
          object dbIdentidade: TDBEdit
            Left = 152
            Top = 16
            Width = 145
            Height = 21
            CharCase = ecUpperCase
            DataField = 'ds_identidade'
            DataSource = dsPessoa
            TabOrder = 1
            OnKeyPress = dbNomeKeyPress
          end
          object dbOrgaoIdent: TDBEdit
            Left = 303
            Top = 16
            Width = 145
            Height = 21
            CharCase = ecUpperCase
            DataField = 'ds_identidade_orgao_exp'
            DataSource = dsPessoa
            TabOrder = 2
            OnKeyPress = dbNomeKeyPress
          end
          object DBEdit4: TDBEdit
            Left = 454
            Top = 16
            Width = 145
            Height = 21
            DataField = 'dt_identidade_expedicao'
            DataSource = dsPessoa
            TabOrder = 3
            OnKeyPress = dbNomeKeyPress
          end
          object dbPassaporte: TDBEdit
            Left = 1
            Top = 57
            Width = 145
            Height = 21
            CharCase = ecUpperCase
            DataField = 'ds_passaporte'
            DataSource = dsPessoa
            TabOrder = 4
            OnKeyPress = dbNomeKeyPress
          end
        end
        object TabSheet3: TTabSheet
          Caption = 'T'#237'tulo Eleitoral'
          ImageIndex = 1
          object Label18: TLabel
            Left = 0
            Top = 0
            Width = 51
            Height = 13
            Caption = 'Nro. T'#237'tulo'
            FocusControl = dbNroTitulo
          end
          object Label21: TLabel
            Left = 471
            Top = 0
            Width = 65
            Height = 13
            Caption = 'Data Emiss'#227'o'
            FocusControl = dbEmissao
          end
          object Label19: TLabel
            Left = 312
            Top = 0
            Width = 31
            Height = 13
            Caption = 'Se'#231#227'o'
            FocusControl = dbSecao
          end
          object Label20: TLabel
            Left = 156
            Top = 0
            Width = 25
            Height = 13
            Caption = 'Zona'
            FocusControl = dbZona
          end
          object dbNroTitulo: TDBEdit
            Left = 0
            Top = 16
            Width = 150
            Height = 21
            DataField = 'ds_titulo_numero'
            DataSource = dsPessoa
            TabOrder = 0
          end
          object dbEmissao: TDBEdit
            Left = 471
            Top = 16
            Width = 150
            Height = 21
            DataField = 'dt_titulo_emissao'
            DataSource = dsPessoa
            TabOrder = 3
          end
          object dbSecao: TDBEdit
            Left = 312
            Top = 16
            Width = 150
            Height = 21
            DataField = 'ds_titulo_secao'
            DataSource = dsPessoa
            TabOrder = 2
          end
          object dbZona: TDBEdit
            Left = 156
            Top = 16
            Width = 150
            Height = 21
            DataField = 'ds_titulo_zona'
            DataSource = dsPessoa
            TabOrder = 1
          end
        end
        object TabSheet4: TTabSheet
          Caption = 'Servi'#231'o Militar'
          ImageIndex = 2
          object Label22: TLabel
            Left = 2
            Top = 0
            Width = 55
            Height = 13
            Caption = 'Corpora'#231#227'o'
          end
          object Label23: TLabel
            Left = 146
            Top = 0
            Width = 54
            Height = 13
            Caption = 'Org'#227'o S.M.'
          end
          object Label24: TLabel
            Left = 270
            Top = 0
            Width = 84
            Height = 13
            Caption = 'N'#250'mero do Org'#227'o'
            FocusControl = DBRMNUMERO
          end
          object Label25: TLabel
            Left = 396
            Top = 0
            Width = 80
            Height = 13
            Caption = 'Documento S.M.'
          end
          object Label26: TLabel
            Left = 3
            Top = 43
            Width = 63
            Height = 13
            Caption = 'N'#250'mero Doc.'
            FocusControl = DBDOCNUME
          end
          object DBRMNUMERO: TDBEdit
            Left = 270
            Top = 16
            Width = 121
            Height = 21
            DataField = 'ds_rm_org_numero'
            DataSource = dsPessoa
            TabOrder = 2
          end
          object DBDOCNUME: TDBEdit
            Left = 2
            Top = 59
            Width = 121
            Height = 21
            DataField = 'ds_rm_doc_numero'
            DataSource = dsPessoa
            TabOrder = 4
          end
          object DBRMCORP: TDBComboBox
            Left = 2
            Top = 16
            Width = 137
            Height = 21
            DataField = 'ds_rm_corporacao'
            DataSource = dsPessoa
            ItemHeight = 13
            Items.Strings = (
              'EX'#201'RCITO'
              'MARINHA'
              'AERON'#193'UTICA'
              'DEFESA')
            TabOrder = 0
          end
          object DBRMORGAO: TDBComboBox
            Left = 144
            Top = 16
            Width = 121
            Height = 21
            DataField = 'ds_rm_orgao'
            DataSource = dsPessoa
            ItemHeight = 13
            Items.Strings = (
              'SSMR'
              'CSM'
              'SDR'
              'SERMOB'
              'SMOB')
            TabOrder = 1
          end
          object DBDOCTIPO: TDBComboBox
            Left = 396
            Top = 16
            Width = 222
            Height = 21
            DataField = 'ds_rm_doc_tipo'
            DataSource = dsPessoa
            ItemHeight = 13
            Items.Strings = (
              'Certificado de Alistamento Militar'
              'Certificado de Reservista'
              'Certificado de Dispensa de Incorpora'#231#227'o'
              'Certificado de Isen'#231#227'o'
              'Certid'#227'o de Situa'#231#227'o Militar'
              'Carta Patente '
              'Provis'#227'o de Reforma'
              'Atestado de Situa'#231#227'o Militar'
              'Atestado de Desobrigado do Servi'#231'o Militar')
            TabOrder = 3
          end
        end
        object tsCertidao: TTabSheet
          Caption = 'Certid'#227'o Civil'
          ImageIndex = 3
          object lbTipoCertidao: TLabel
            Left = 0
            Top = 0
            Width = 78
            Height = 13
            Caption = 'Tipo de Certid'#227'o'
          end
          object lbEmissaoCertidao: TLabel
            Left = 144
            Top = 0
            Width = 80
            Height = 13
            Caption = 'Data de Emiss'#227'o'
            FocusControl = dbEmissaoCertidao
          end
          object lbUFCertidao: TLabel
            Left = 248
            Top = 0
            Width = 53
            Height = 13
            Caption = 'UF Cart'#243'rio'
            FocusControl = dbUFCertidao
          end
          object lbOrgamCertidao: TLabel
            Left = 315
            Top = 0
            Width = 82
            Height = 13
            Caption = 'Nome do Cart'#243'rio'
            FocusControl = dbOrgaoCertidao
          end
          object lbMatricula: TLabel
            Left = 0
            Top = 38
            Width = 46
            Height = 13
            Caption = 'Matricula:'
            FocusControl = dbMatricula
          end
          object lbLivro: TLabel
            Left = 355
            Top = 38
            Width = 23
            Height = 13
            Caption = 'Livro'
            FocusControl = dbLivro
          end
          object lbFolha: TLabel
            Left = 461
            Top = 38
            Width = 26
            Height = 13
            Caption = 'Folha'
            FocusControl = dbFolha
          end
          object lbNumeroTermo: TLabel
            Left = 545
            Top = 38
            Width = 85
            Height = 13
            Caption = 'N'#250'mero do Termo'
            FocusControl = dbNumeroTErmo
          end
          object dbEmissaoCertidao: TDBEdit
            Left = 144
            Top = 16
            Width = 97
            Height = 21
            DataField = 'dt_cert'
            DataSource = dsPessoa
            TabOrder = 1
            OnKeyPress = dbNomeKeyPress
          end
          object dbUFCertidao: TDBEdit
            Left = 248
            Top = 16
            Width = 57
            Height = 21
            DataField = 'ds_cert_uf'
            DataSource = dsPessoa
            TabOrder = 2
            OnKeyPress = dbNomeKeyPress
          end
          object dbOrgaoCertidao: TDBEdit
            Left = 315
            Top = 16
            Width = 166
            Height = 21
            DataField = 'ds_cert_orgao'
            DataSource = dsPessoa
            TabOrder = 3
            OnKeyPress = dbNomeKeyPress
          end
          object dbTipoCertidao: TDBComboBox
            Left = 0
            Top = 16
            Width = 138
            Height = 21
            DataField = 'tp_cert'
            DataSource = dsPessoa
            ItemHeight = 13
            Items.Strings = (
              'Nascimento'
              'Casamento'
              'Div'#243'rcio'
              'Uni'#227'o Est'#225'vel')
            TabOrder = 0
            OnChange = dbTipoCertidaoChange
            OnKeyPress = dbNomeKeyPress
          end
          object dbMatricula: TDBEdit
            Left = 0
            Top = 54
            Width = 343
            Height = 21
            DataField = 'ds_matricula'
            DataSource = dsPessoa
            Enabled = False
            TabOrder = 4
            OnExit = dbMatriculaExit
            OnKeyPress = dbNomeKeyPress
          end
          object dbLivro: TDBEdit
            Left = 355
            Top = 54
            Width = 97
            Height = 21
            DataField = 'ds_cert_livro'
            DataSource = dsPessoa
            TabOrder = 5
            OnKeyPress = dbNomeKeyPress
          end
          object dbFolha: TDBEdit
            Left = 461
            Top = 54
            Width = 73
            Height = 21
            DataField = 'ds_cert_folha'
            DataSource = dsPessoa
            TabOrder = 6
            OnKeyPress = dbNomeKeyPress
          end
          object dbNumeroTErmo: TDBEdit
            Left = 545
            Top = 54
            Width = 89
            Height = 21
            DataField = 'nr_cert_termo'
            DataSource = dsPessoa
            TabOrder = 7
            OnKeyPress = dbNomeKeyPress
          end
        end
      end
      object DBEdit2: TDBEdit
        Left = 397
        Top = 182
        Width = 65
        Height = 21
        DataField = 'ds_logradouro_nro'
        DataSource = dsPessoa
        TabOrder = 18
        OnKeyPress = dbNomeKeyPress
      end
      object DBLookupComboBox2: TDBLookupComboBox
        Left = 319
        Top = 98
        Width = 126
        Height = 21
        DataField = 'descEstadoNasc'
        DataSource = dsPessoa
        DropDownWidth = 200
        TabOrder = 9
        OnCloseUp = DBLookupComboBox2CloseUp
        OnKeyPress = dbNomeKeyPress
      end
      object DBLookupComboBox3: TDBLookupComboBox
        Left = 234
        Top = 141
        Width = 106
        Height = 21
        DataField = 'descEstado'
        DataSource = dsPessoa
        DropDownWidth = 150
        TabOrder = 13
        OnKeyPress = dbNomeKeyPress
      end
      object DBLookupComboBox4: TDBLookupComboBox
        Left = 412
        Top = 55
        Width = 135
        Height = 21
        DataField = 'descEstadoCivil'
        DataSource = dsPessoa
        TabOrder = 5
        OnKeyPress = dbNomeKeyPress
      end
      object dbTipoLogradouro: TDBLookupComboBox
        Left = 5
        Top = 182
        Width = 105
        Height = 21
        DataField = 'desLogradouro'
        DataSource = dsPessoa
        DropDownWidth = 150
        TabOrder = 16
        OnKeyPress = dbNomeKeyPress
      end
      object sbPaisCombo: TDBLookupComboBox
        Left = 6
        Top = 98
        Width = 113
        Height = 21
        DataField = 'descPaisNasc'
        DataSource = dsPessoa
        DropDownWidth = 200
        TabOrder = 7
        OnCloseUp = sbPaisComboCloseUp
        OnExit = sbPaisComboExit
        OnKeyPress = dbNomeKeyPress
      end
      object pnFotoBtn: TPanel
        Left = 607
        Top = 379
        Width = 106
        Height = 23
        BevelOuter = bvNone
        TabOrder = 24
      end
      object dbcUtilizaImagem: TDBCheckBox
        Left = 667
        Top = 183
        Width = 92
        Height = 17
        Caption = 'Utilizar imagem'
        DataField = 'sn_foto'
        DataSource = dsPessoa
        TabOrder = 21
        ValueChecked = 'S'
        ValueUnchecked = 'N'
      end
      object ToolBar1: TToolBar
        Left = 655
        Top = 139
        Width = 115
        Height = 22
        Align = alNone
        Images = imgListFoto
        ParentShowHint = False
        ShowHint = True
        TabOrder = 25
        object btnConectar: TToolButton
          Left = 0
          Top = 0
          Hint = 'Webcam'
          ImageIndex = 0
          Visible = False
          OnClick = btnConectarClick
        end
        object btnCapturar: TToolButton
          Left = 23
          Top = 0
          Hint = 'Capturar'
          ImageIndex = 1
          Visible = False
          OnClick = btnCapturarClick
        end
        object btnAplicar: TToolButton
          Left = 46
          Top = 0
          Hint = 'Aplicar'
          ImageIndex = 3
          Visible = False
          OnClick = btnAplicarClick
        end
        object btnCancelar: TToolButton
          Left = 69
          Top = 0
          Hint = 'Cancelar'
          ImageIndex = 2
          Visible = False
          OnClick = btnCancelarClick
        end
        object btnDigitalizar: TToolButton
          Left = 92
          Top = 0
          Hint = 'Digitalizar'
          ImageIndex = 5
          Visible = False
          OnClick = btnDigitalizarClick
        end
      end
      object DBCheckBox10: TDBCheckBox
        Left = 561
        Top = 57
        Width = 82
        Height = 17
        Caption = 'Naturalizado'
        DataField = 'sn_naturalizado'
        DataSource = dsPessoa
        TabOrder = 6
        ValueChecked = '1'
        ValueUnchecked = '0'
      end
      object dbPais: TDBLookupComboBox
        Left = 109
        Top = 141
        Width = 119
        Height = 21
        DataField = 'descPais'
        DataSource = dsPessoa
        DropDownWidth = 200
        TabOrder = 12
        OnCloseUp = sbPaisAtualComboCloseUp
        OnKeyPress = dbNomeKeyPress
      end
      object dbNacionalidade: TUMComboBox
        Left = 125
        Top = 98
        Width = 188
        Height = 21
        ItemHeight = 13
        TabOrder = 8
        OnExit = dbNacionalidadeExit
        OnKeyDown = dbNacionalidadeKeyDown
        OnKeyPress = dbNacionalidadeKeyPress
        TamanhoMaximo = 0
      end
      object pnContato: TPanel
        Left = 0
        Top = 332
        Width = 904
        Height = 170
        Margins.Left = 0
        Margins.Top = 0
        Margins.Right = 0
        Margins.Bottom = 0
        Align = alCustom
        BevelOuter = bvNone
        ParentColor = True
        TabOrder = 22
        object Label32: TLabel
          Left = 287
          Top = 113
          Width = 79
          Height = 13
          Caption = 'Tipo Documento'
          Visible = False
        end
        object Label36: TLabel
          Left = 6
          Top = 5
          Width = 198
          Height = 13
          Caption = 'Nome da M'#227'e na Certid'#227'o de Nascimento'
        end
        object Label35: TLabel
          Left = 6
          Top = 49
          Width = 192
          Height = 13
          Caption = 'Nome do Pai na Certid'#227'o de Nascimento'
          FocusControl = dbPai
        end
        object Label37: TLabel
          Left = 6
          Top = 92
          Width = 85
          Height = 13
          Caption = 'Nome do Conjuge'
          FocusControl = dbConjuge
        end
        object lblMensagemHierarquia: TLabel
          Left = 389
          Top = 133
          Width = 366
          Height = 28
          AutoSize = False
          Caption = 
            'Seu grupo n'#227'o possui hierarquia sobre algum dos grupos que este ' +
            'usu'#225'rio est'#225' vinculado.'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clRed
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
          Visible = False
          WordWrap = True
        end
        object dbMae: TDBEdit
          Left = 6
          Top = 23
          Width = 363
          Height = 21
          DataField = 'nm_mae'
          DataSource = dsPessoa
          TabOrder = 0
          OnKeyPress = dbNomeKeyPress
        end
        object dbPai: TDBEdit
          Left = 6
          Top = 66
          Width = 363
          Height = 21
          DataField = 'nm_pai'
          DataSource = dsPessoa
          TabOrder = 1
          OnKeyPress = dbNomeKeyPress
        end
        object dbConjuge: TDBEdit
          Left = 6
          Top = 109
          Width = 363
          Height = 21
          DataField = 'nm_conjuge'
          DataSource = dsPessoa
          TabOrder = 2
          OnKeyPress = dbNomeKeyPress
        end
        object VSTContatos: TVirtualStringTree
          Left = 389
          Top = 10
          Width = 366
          Height = 120
          Header.AutoSizeIndex = 0
          Header.Font.Charset = DEFAULT_CHARSET
          Header.Font.Color = clWindowText
          Header.Font.Height = -11
          Header.Font.Name = 'Tahoma'
          Header.Font.Style = []
          Header.MainColumn = -1
          TabOrder = 3
          Columns = <>
        end
      end
      object cbNomeOficial: TDBCheckBox
        Left = 6
        Top = 57
        Width = 171
        Height = 17
        Caption = 'Habilitar nome social da pessoa'
        DataField = 'sn_nome_social'
        DataSource = dsPessoa
        TabOrder = 4
        ValueChecked = '1'
        ValueUnchecked = '0'
        OnClick = cbNomeOficialClick
      end
    end
    object tsComplementares: TTabSheet
      Caption = 'COMPLEMENTARES'
      ImageIndex = 1
      object ScrollBox1: TScrollBox
        Left = 0
        Top = 0
        Width = 917
        Height = 501
        HorzScrollBar.Visible = False
        Align = alClient
        TabOrder = 0
        object Panel2: TPanel
          Left = 0
          Top = 0
          Width = 913
          Height = 225
          Align = alTop
          BevelOuter = bvNone
          TabOrder = 0
          object Label39: TLabel
            Left = 3
            Top = 6
            Width = 90
            Height = 13
            Caption = 'Nome da Empresa:'
          end
          object Label40: TLabel
            Left = 395
            Top = 6
            Width = 72
            Height = 13
            Caption = 'Cargo/Fun'#231#227'o:'
            FocusControl = DBEdit1
          end
          object SpeedButton1: TSpeedButton
            Left = 333
            Top = 21
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
            OnClick = SpeedButton1Click
          end
          object Label74: TLabel
            Left = 118
            Top = 50
            Width = 94
            Height = 13
            Caption = 'Arquivo Documento'
            FocusControl = DBEdit13
          end
          object Bevel2: TBevel
            Left = 0
            Top = 95
            Width = 761
            Height = 3
            Shape = bsBottomLine
          end
          object Label33: TLabel
            Left = 6
            Top = 103
            Width = 26
            Height = 13
            Caption = 'Login'
          end
          object Label108: TLabel
            Left = 145
            Top = 103
            Width = 159
            Height = 13
            Caption = 'Senha (digite apenas para alterar)'
          end
          object Label109: TLabel
            Left = 316
            Top = 103
            Width = 80
            Height = 13
            Caption = 'Redigite a senha'
          end
          object lbVencimento: TLabel
            Left = 3
            Top = 49
            Width = 90
            Height = 13
            Caption = 'Dia do Vencimento'
            FocusControl = dbDiaVencimento
          end
          object Bevel3: TBevel
            Left = 0
            Top = 199
            Width = 761
            Height = 3
            Shape = bsBottomLine
          end
          object Label207: TLabel
            Left = 6
            Top = 208
            Width = 103
            Height = 13
            Caption = 'Data de cadastro:'
            FocusControl = dbDiaVencimento
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = [fsBold]
            ParentFont = False
          end
          object Label210: TLabel
            Left = 185
            Top = 208
            Width = 144
            Height = 13
            Caption = 'Data da '#250'ltima altera'#231#227'o:'
            FocusControl = dbDiaVencimento
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = [fsBold]
            ParentFont = False
          end
          object Label211: TLabel
            Left = 407
            Top = 208
            Width = 199
            Height = 13
            Caption = 'Usu'#225'rio que fez a '#250'ltima altera'#231#227'o:'
            FocusControl = dbDiaVencimento
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = [fsBold]
            ParentFont = False
          end
          object lbDTCadastro: TLabel
            Left = 113
            Top = 208
            Width = 58
            Height = 13
            Caption = '15/10/2009'
            FocusControl = dbDiaVencimento
          end
          object lbDTAlteracao: TLabel
            Left = 335
            Top = 208
            Width = 58
            Height = 13
            Caption = '15/10/2009'
            FocusControl = dbDiaVencimento
          end
          object lbUsuario: TLabel
            Left = 612
            Top = 208
            Width = 35
            Height = 13
            Caption = 'ADMIN'
            FocusControl = dbDiaVencimento
          end
          object sbDesvinculaEmpresa: TSpeedButton
            Left = 359
            Top = 21
            Width = 23
            Height = 22
            Hint = 'Remover v'#237'nculo da pessoa com a empresa'
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
            OnClick = sbDesvinculaEmpresaClick
          end
          object Label29: TLabel
            Left = 8
            Top = 154
            Width = 191
            Height = 13
            Caption = 'Forma que ficou sabendo da institui'#231#227'o: '
          end
          object Label68: TLabel
            Left = 242
            Top = 154
            Width = 137
            Height = 13
            Caption = 'Informe como ficou sabendo:'
          end
          object DBEdit1: TDBEdit
            Left = 394
            Top = 21
            Width = 245
            Height = 21
            DataField = 'ds_cargo'
            DataSource = dsPessoa
            TabOrder = 1
            OnKeyPress = DBEdit1KeyPress
          end
          object DBLookupComboBox1: TDBLookupComboBox
            Left = 3
            Top = 22
            Width = 327
            Height = 21
            DataField = 'descEmpresa'
            DataSource = dsPessoa
            TabOrder = 0
          end
          object DBEdit13: TDBEdit
            Left = 116
            Top = 66
            Width = 363
            Height = 21
            DataField = 'ds_arquivo_documento'
            DataSource = dsPessoa
            TabOrder = 4
            OnKeyPress = DBEdit13KeyPress
          end
          object edLogin: TEdit
            Left = 6
            Top = 119
            Width = 131
            Height = 21
            TabOrder = 6
            OnKeyPress = edLoginKeyPress
          end
          object edSenha1: TEdit
            Left = 145
            Top = 119
            Width = 163
            Height = 21
            ParentShowHint = False
            PasswordChar = '*'
            ShowHint = True
            TabOrder = 7
            OnKeyPress = edSenha1KeyPress
          end
          object edSenha2: TEdit
            Left = 316
            Top = 119
            Width = 163
            Height = 21
            PasswordChar = '*'
            TabOrder = 8
            OnKeyPress = edSenha2KeyPress
          end
          object dbDiaVencimento: TDBEdit
            Left = 4
            Top = 66
            Width = 100
            Height = 21
            DataField = 'nr_dia_vencimento'
            DataSource = dsPessoa
            TabOrder = 3
            OnKeyPress = dbDiaVencimentoKeyPress
          end
          object Button1: TButton
            Left = 645
            Top = 16
            Width = 116
            Height = 25
            Caption = 'Necessidade Especial'
            TabOrder = 2
            OnClick = Button1Click
          end
          object btnLiberarAcesso: TButton
            Left = 485
            Top = 115
            Width = 136
            Height = 25
            Caption = 'Liberar acesso on-line'
            TabOrder = 10
            OnClick = btnLiberarAcessoClick
          end
          object btnBloquearOnline: TButton
            Left = 485
            Top = 115
            Width = 136
            Height = 25
            Caption = 'Bloquear acesso on-line'
            TabOrder = 9
            OnClick = btnBloquearOnlineClick
          end
          object cbRetiraMaterial: TDBCheckBox
            Left = 485
            Top = 68
            Width = 166
            Height = 17
            Caption = 'Bloquear a retirada de produtos'
            DataField = 'sn_pode_retirar_material'
            DataSource = dsPessoa
            TabOrder = 5
            ValueChecked = '1'
            ValueUnchecked = '0'
          end
          object cbFormaConhece: TComboBox
            Left = 6
            Top = 172
            Width = 230
            Height = 21
            ItemHeight = 13
            TabOrder = 11
            OnChange = cbFormaConheceChange
          end
          object edFormaConheceuOutro: TEdit
            Left = 241
            Top = 172
            Width = 238
            Height = 21
            TabOrder = 12
          end
        end
        object Panel4: TPanel
          Left = 0
          Top = 225
          Width = 913
          Height = 24
          Align = alTop
          Caption = 'OBSERVA'#199#213'ES GERAIS'
          Color = clBlue
          Font.Charset = ANSI_CHARSET
          Font.Color = clWhite
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          ParentFont = False
          TabOrder = 1
          object btnAlteraObs: TBitBtn
            Left = 843
            Top = 1
            Width = 23
            Height = 22
            Hint = 'Alterar Observa'#231#245'es Gerais'
            Align = alRight
            TabOrder = 0
            Visible = False
            OnClick = btnAlteraObsClick
            Glyph.Data = {
              36040000424D3604000000000000360000002800000010000000100000000100
              2000000000000004000000000000000000000000000000000000FF00FF00FF00
              FF00FF00FF00FF00FF00FF00FF00FF00FF000000000000000000000000000000
              0000000000000000000000000000000000000000000000000000FF00FF00FF00
              FF00FF00FF00FF00FF00FF00FF00FF00FF0000000000FFFFFF00FFFFFF00FFFF
              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF0000000000000000000000
              0000FF00FF000000000000000000000000000000000000000000FFFFFF00FFFF
              FF0000000000FFFFFF000000000000000000FFFFFF0000000000FFFF00000000
              00000000000000FFFF00FFFFFF0000FFFF00FFFFFF0000FFFF0000000000FFFF
              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF0000000000FFFF00000000
              000000FFFF00FFFFFF0000FFFF00FFFFFF00000000000000000000000000FFFF
              FF00FFFFFF00FFFFFF00FFFFFF0000000000FFFFFF0000000000FFFF00000000
              0000FFFFFF0000FFFF00FFFFFF0000FFFF00FFFFFF0000FFFF00FFFFFF000000
              0000FFFFFF000000000000000000FFFFFF00FFFFFF0000000000FFFF00000000
              000000FFFF00FFFFFF0000FFFF00FFFFFF000000000000000000000000000000
              00000000000000FFFF0000000000FFFFFF00FFFFFF0000000000FFFF00000000
              0000FFFFFF0000FFFF00FFFFFF0000FFFF00FFFFFF0000FFFF00FFFFFF0000FF
              FF00FFFFFF0000000000FFFFFF00FFFFFF00FFFFFF0000000000FFFF00000000
              000000FFFF00FFFFFF0000000000000000000000000000000000000000000000
              000000000000FFFFFF00FFFFFF00FFFFFF00FFFFFF0000000000000000000000
              00000000000000FFFF00FFFFFF0000FFFF00000000000000000000FFFF000000
              0000FFFFFF00FFFFFF000000000000000000FFFFFF0000000000FF00FF00FF00
              FF00FF00FF000000000000000000000000000000000000FFFF0000000000FFFF
              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF0000000000FF00FF00FF00
              FF00FF00FF00FF00FF00FF00FF000000000000FFFF0000000000FFFFFF00FFFF
              FF00FFFFFF00FFFFFF0000000000000000000000000000000000FF00FF00FF00
              FF00FF00FF00FF00FF000000000000FFFF0000000000FFFFFF00FFFFFF000000
              000000000000FFFFFF0000000000FFFFFF00FFFFFF0000000000FF00FF00FF00
              FF00FF00FF000000000000FFFF000000000000000000FFFFFF00FFFFFF00FFFF
              FF00FFFFFF00FFFFFF0000000000FFFFFF0000000000FF00FF00FF00FF00FF00
              FF00000000000000FF0000000000FF00FF0000000000FFFFFF00FFFFFF00FFFF
              FF00FFFFFF00FFFFFF000000000000000000FF00FF00FF00FF00FF00FF00FF00
              FF00FF00FF0000000000FF00FF00FF00FF000000000000000000000000000000
              0000000000000000000000000000FF00FF00FF00FF00FF00FF00}
          end
          object btnSalvarObs: TBitBtn
            Left = 866
            Top = 1
            Width = 23
            Height = 22
            Hint = 'Salvar Observa'#231#245'es Gerais'
            Align = alRight
            TabOrder = 1
            Visible = False
            OnClick = btnSalvarObsClick
            Glyph.Data = {
              36040000424D3604000000000000360000002800000010000000100000000100
              2000000000000004000000000000000000000000000000000000FF00FF00FF00
              FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
              FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
              FF00000000000000000000000000000000000000000000000000000000000000
              00000000000000000000000000000000000000000000FF00FF00FF00FF000000
              0000008484000084840000000000000000000000000000000000000000000000
              0000FF00FF00FF00FF00000000000084840000000000FF00FF00FF00FF000000
              0000008484000084840000000000000000000000000000000000000000000000
              0000FF00FF00FF00FF00000000000084840000000000FF00FF00FF00FF000000
              0000008484000084840000000000000000000000000000000000000000000000
              0000FF00FF00FF00FF00000000000084840000000000FF00FF00FF00FF000000
              0000008484000084840000000000000000000000000000000000000000000000
              00000000000000000000000000000084840000000000FF00FF00FF00FF000000
              0000008484000084840000848400008484000084840000848400008484000084
              84000084840000848400008484000084840000000000FF00FF00FF00FF000000
              0000008484000084840000000000000000000000000000000000000000000000
              00000000000000000000008484000084840000000000FF00FF00FF00FF000000
              00000084840000000000FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
              FF00FF00FF00FF00FF00000000000084840000000000FF00FF00FF00FF000000
              00000084840000000000FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
              FF00FF00FF00FF00FF00000000000084840000000000FF00FF00FF00FF000000
              00000084840000000000FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
              FF00FF00FF00FF00FF00000000000084840000000000FF00FF00FF00FF000000
              00000084840000000000FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
              FF00FF00FF00FF00FF00000000000084840000000000FF00FF00FF00FF000000
              00000084840000000000FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
              FF00FF00FF00FF00FF00000000000000000000000000FF00FF00FF00FF000000
              00000084840000000000FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
              FF00FF00FF00FF00FF0000000000FF00FF0000000000FF00FF00FF00FF000000
              0000000000000000000000000000000000000000000000000000000000000000
              00000000000000000000000000000000000000000000FF00FF00FF00FF00FF00
              FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
              FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00}
          end
          object btnCancelarObs: TBitBtn
            Left = 889
            Top = 1
            Width = 23
            Height = 22
            Hint = 'Cancelar Observa'#231#245'es Gerais'
            Align = alRight
            TabOrder = 2
            Visible = False
            OnClick = btnCancelarObsClick
            Glyph.Data = {
              42040000424D4204000000000000420000002800000010000000100000000100
              20000300000000040000130B0000130B00000000000000000000000000FF0000
              FF0000FF000000FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF
              00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF
              00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF000000000000
              000000000000000000000000000000FF00FF00FF00FF00FF00FF00FF00FF00FF
              00FF00FF00FF00FF00FF00FF00FF00FF00FF0000000000000000000000000000
              0000000000000000000000000000000000000000000000FF00FF00FF00FF00FF
              00FF00FF00FF00FF00FF00FF00FF000000000000000000FF00FF00FF00FF00FF
              00FF00FF00FF00FF00FF00FF00FF00000000000000000000000000FF00FF00FF
              00FF00FF00FF00FF00FF0000000000000000000000000000000000FF00FF00FF
              00FF00FF00FF00FF00FF00FF00FF00FF00FF00000000000000000000000000FF
              00FF00FF00FF00FF00FF0000000000FF00FF00000000000000000000000000FF
              00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF000000000000000000FF
              00FF00FF00FF000000000000000000FF00FF00FF00FF00000000000000000000
              000000FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF000000000000
              000000FF00FF000000000000000000FF00FF00FF00FF00FF00FF000000000000
              00000000000000FF00FF00FF00FF00FF00FF00FF00FF00FF00FF000000000000
              000000FF00FF000000000000000000FF00FF00FF00FF00FF00FF00FF00FF0000
              0000000000000000000000FF00FF00FF00FF00FF00FF00FF00FF000000000000
              000000FF00FF000000000000000000FF00FF00FF00FF00FF00FF00FF00FF00FF
              00FF00000000000000000000000000FF00FF00FF00FF00FF00FF000000000000
              000000FF00FF000000000000000000FF00FF00FF00FF00FF00FF00FF00FF00FF
              00FF00FF00FF00000000000000000000000000FF00FF00FF00FF000000000000
              000000FF00FF00FF00FF000000000000000000FF00FF00FF00FF00FF00FF00FF
              00FF00FF00FF00FF00FF00000000000000000000000000FF00FF0000000000FF
              00FF00FF00FF00FF00FF00000000000000000000000000FF00FF00FF00FF00FF
              00FF00FF00FF00FF00FF00FF00FF0000000000000000000000000000000000FF
              00FF00FF00FF00FF00FF00FF00FF00000000000000000000000000FF00FF00FF
              00FF00FF00FF00FF00FF00FF00FF00FF00FF000000000000000000FF00FF00FF
              00FF00FF00FF00FF00FF00FF00FF00FF00FF0000000000000000000000000000
              0000000000000000000000000000000000000000000000FF00FF00FF00FF00FF
              00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF000000000000
              000000000000000000000000000000FF00FF00FF00FF00FF00FF00FF00FF00FF
              00FF00FF00FF}
          end
        end
        object dbObs: TDBMemo
          Left = 0
          Top = 249
          Width = 913
          Height = 127
          Align = alClient
          DataField = 'ds_observacao'
          DataSource = dsPessoa
          TabOrder = 2
        end
        object lbVinculoExterno: TPanel
          Left = 0
          Top = 376
          Width = 913
          Height = 25
          Cursor = crHandPoint
          Align = alBottom
          Caption = 
            'CADASTRO DE V'#205'NCULO EXTERNO (OUTROS SISTEMAS) / clique nesta bar' +
            'ra para esconder a grade a baixo'
          Color = clBlue
          Font.Charset = ANSI_CHARSET
          Font.Color = clWhite
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          ParentFont = False
          TabOrder = 3
          OnClick = lbVinculoExternoClick
        end
        object pnVinculosExterno: TPanel
          Left = 0
          Top = 401
          Width = 913
          Height = 96
          Align = alBottom
          BevelOuter = bvNone
          TabOrder = 4
          object pnAcoesVinculoExterno: TPanel
            Left = 889
            Top = 0
            Width = 24
            Height = 96
            Align = alRight
            BevelOuter = bvNone
            TabOrder = 0
            object btnRemoverVinculoExterno: TSpeedButton
              Left = 0
              Top = 44
              Width = 24
              Height = 22
              Align = alTop
              Flat = True
              Glyph.Data = {
                36040000424D3604000000000000360000002800000010000000100000000100
                2000000000000004000000000000000000000000000000000000FF00FF00FF00
                FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
                FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
                FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
                FF00FF00FF00FF00FF00FF00FF000000000000000000FF00FF00FF00FF00FF00
                FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
                FF00FF00FF00FF00FF00FF00FF0000000000FFFFFF00FF00FF00FF00FF00FF00
                FF00FF00FF000000000000000000FFFFFF00FF00FF00FF00FF00FF00FF00FF00
                FF00FF00FF00FF00FF0000000000FFFFFF00FF00FF00FF00FF00FF00FF00FF00
                FF00FF00FF000000000000000000FFFFFF00FF00FF00FF00FF00FF00FF00FF00
                FF00FF00FF00FF00FF0000000000FFFFFF00FF00FF00FF00FF00FF00FF00FF00
                FF00FF00FF00000000000000000000000000FFFFFF00FF00FF00FF00FF00FF00
                FF000000000000000000FFFFFF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
                FF00FF00FF00FF00FF00000000000000000000000000FFFFFF00FF00FF000000
                000000000000FFFFFF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
                FF00FF00FF00FF00FF00FF00FF00000000000000000000000000000000000000
                0000FFFFFF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
                FF00FF00FF00FF00FF00FF00FF00FF00FF00000000000000000000000000FFFF
                FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
                FF00FF00FF00FF00FF00FF00FF00000000000000000000000000000000000000
                0000FFFFFF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
                FF00FF00FF00FF00FF00000000000000000000000000FFFFFF00FF00FF000000
                000000000000FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
                FF00FF00FF00000000000000000000000000FFFFFF00FF00FF00FF00FF00FF00
                FF00000000000000000000000000FF00FF00FF00FF00FF00FF00FF00FF000000
                0000000000000000000000000000FFFFFF00FF00FF00FF00FF00FF00FF00FF00
                FF00FF00FF000000000000000000FFFFFF00FF00FF00FF00FF00FF00FF000000
                000000000000FFFFFF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
                FF00FF00FF00FF00FF00000000000000000000000000FF00FF00FF00FF00FF00
                FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
                FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
                FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
                FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00}
              OnClick = btnRemoverVinculoExternoClick
              ExplicitTop = 62
            end
            object btnAdicionarVinculoExterno: TSpeedButton
              Left = 0
              Top = 0
              Width = 24
              Height = 22
              Align = alTop
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
              OnClick = btnAdicionarVinculoExternoClick
              ExplicitLeft = 6
              ExplicitTop = 6
            end
            object btnAlterarVinculoExterno: TSpeedButton
              Left = 0
              Top = 22
              Width = 24
              Height = 22
              Align = alTop
              Flat = True
              Glyph.Data = {
                36040000424D3604000000000000360000002800000010000000100000000100
                2000000000000004000000000000000000000000000000000000FF00FF00FF00
                FF00FF00FF00FF00FF00FF00FF00FF00FF000000000000000000000000000000
                0000000000000000000000000000000000000000000000000000FF00FF00FF00
                FF00FF00FF00FF00FF00FF00FF00FF00FF0000000000FFFFFF00FFFFFF00FFFF
                FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF0000000000000000000000
                0000FF00FF000000000000000000000000000000000000000000FFFFFF00FFFF
                FF0000000000FFFFFF000000000000000000FFFFFF0000000000FFFF00000000
                00000000000000FFFF00FFFFFF0000FFFF00FFFFFF0000FFFF0000000000FFFF
                FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF0000000000FFFF00000000
                000000FFFF00FFFFFF0000FFFF00FFFFFF00000000000000000000000000FFFF
                FF00FFFFFF00FFFFFF00FFFFFF0000000000FFFFFF0000000000FFFF00000000
                0000FFFFFF0000FFFF00FFFFFF0000FFFF00FFFFFF0000FFFF00FFFFFF000000
                0000FFFFFF000000000000000000FFFFFF00FFFFFF0000000000FFFF00000000
                000000FFFF00FFFFFF0000FFFF00FFFFFF000000000000000000000000000000
                00000000000000FFFF0000000000FFFFFF00FFFFFF0000000000FFFF00000000
                0000FFFFFF0000FFFF00FFFFFF0000FFFF00FFFFFF0000FFFF00FFFFFF0000FF
                FF00FFFFFF0000000000FFFFFF00FFFFFF00FFFFFF0000000000FFFF00000000
                000000FFFF00FFFFFF0000000000000000000000000000000000000000000000
                000000000000FFFFFF00FFFFFF00FFFFFF00FFFFFF0000000000000000000000
                00000000000000FFFF00FFFFFF0000FFFF00000000000000000000FFFF000000
                0000FFFFFF00FFFFFF000000000000000000FFFFFF0000000000FF00FF00FF00
                FF00FF00FF000000000000000000000000000000000000FFFF0000000000FFFF
                FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF0000000000FF00FF00FF00
                FF00FF00FF00FF00FF00FF00FF000000000000FFFF0000000000FFFFFF00FFFF
                FF00FFFFFF00FFFFFF0000000000000000000000000000000000FF00FF00FF00
                FF00FF00FF00FF00FF000000000000FFFF0000000000FFFFFF00FFFFFF000000
                000000000000FFFFFF0000000000FFFFFF00FFFFFF0000000000FF00FF00FF00
                FF00FF00FF000000000000FFFF000000000000000000FFFFFF00FFFFFF00FFFF
                FF00FFFFFF00FFFFFF0000000000FFFFFF0000000000FF00FF00FF00FF00FF00
                FF00000000000000FF0000000000FF00FF0000000000FFFFFF00FFFFFF00FFFF
                FF00FFFFFF00FFFFFF000000000000000000FF00FF00FF00FF00FF00FF00FF00
                FF00FF00FF0000000000FF00FF00FF00FF000000000000000000000000000000
                0000000000000000000000000000FF00FF00FF00FF00FF00FF00}
              OnClick = btnAlterarVinculoExternoClick
              ExplicitTop = 40
              ExplicitWidth = 23
            end
          end
          object grVinculosExterno: TDBGrid
            Left = 0
            Top = 0
            Width = 889
            Height = 96
            Align = alClient
            DataSource = dsVinculoExterno
            Options = [dgTitles, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgConfirmDelete, dgCancelOnExit]
            TabOrder = 1
            TitleFont.Charset = DEFAULT_CHARSET
            TitleFont.Color = clWindowText
            TitleFont.Height = -11
            TitleFont.Name = 'MS Sans Serif'
            TitleFont.Style = []
            OnKeyDown = grVinculosExternoKeyDown
            Columns = <
              item
                Expanded = False
                FieldName = 'ds_sistema'
                ReadOnly = True
                Title.Caption = 'Sistema Externo'
                Width = 489
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'cd_pessoa_externa'
                Title.Caption = 'C'#243'digo identificador externo da Pessoa'
                Width = 238
                Visible = True
              end>
          end
        end
      end
    end
    object tsParentes: TTabSheet
      Caption = 'OUTRAS PESSOAS'
      ImageIndex = 2
      inline frParentes1: TfrParentes
        Left = 0
        Top = 0
        Width = 917
        Height = 501
        Align = alClient
        TabOrder = 0
        TabStop = True
        ExplicitWidth = 917
        ExplicitHeight = 501
        inherited Bevel1: TBevel
          Height = 405
          ExplicitHeight = 274
        end
        inherited Bevel2: TBevel
          Left = 899
          Height = 405
          ExplicitLeft = 762
          ExplicitHeight = 274
        end
        inherited Bevel3: TBevel
          Top = 494
          Width = 917
          ExplicitTop = 363
          ExplicitWidth = 780
        end
        inherited Bevel4: TBevel
          Top = 462
          Width = 917
          ExplicitTop = 331
          ExplicitWidth = 780
        end
        inherited DBGrid1: TDBGrid
          Width = 881
          Height = 405
          TitleFont.Name = 'MS Sans Serif'
          Columns = <
            item
              Expanded = False
              FieldName = 'cd_pessoa'
              Title.Caption = 'C'#243'digo'
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'nm_pessoa'
              Title.Caption = 'Nome'
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'ds_cpf'
              Title.Caption = 'CPF'
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'ds_pessoa_desc'
              Title.Caption = 'Tipo pessoa'
              Visible = True
            end>
        end
        inherited Panel1: TPanel
          Width = 917
          ExplicitLeft = 0
          ExplicitTop = 0
          ExplicitWidth = 917
          inherited Buscar: TBitBtn
            Left = 577
            ExplicitLeft = 577
          end
        end
        inherited toolPessoa: TToolBar
          Top = 469
          Width = 917
          ButtonWidth = 73
          ExplicitTop = 469
          ExplicitWidth = 917
          inherited DBNavigator1: TDBNavigator
            Hints.Strings = ()
          end
          inherited btIncluir_Pessoa: TToolButton
            OnClick = frParentes1btIncluir_PessoaClick
            ExplicitWidth = 74
          end
          inherited btAlterar_Pessoa: TToolButton
            Left = 138
            OnClick = frParentes1btAlterar_PessoaClick
            ExplicitLeft = 138
            ExplicitWidth = 76
          end
          inherited btExcluir_Pessoa: TToolButton
            Left = 214
            OnClick = frParentes1btExcluir_PessoaClick
            ExplicitLeft = 214
            ExplicitWidth = 77
          end
          inherited ToolButton4: TToolButton
            Left = 291
            ExplicitLeft = 291
          end
          inherited ToolButton2: TToolButton
            Left = 299
            ExplicitLeft = 299
          end
        end
      end
    end
  end
  object ImageList1: TImageList
    Left = 784
    Top = 352
    Bitmap = {
      494C01010A000E00040010001000FFFFFFFFFF10FFFFFFFFFFFFFFFF424D3600
      0000000000003600000028000000400000004000000001002000000000000040
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000052A58C0000730800007B
      0800087B1000088418001084180010842100187B2900187B2900187B2900187B
      2900187B2900107318005AA5940000000000000000005AA5940010731800187B
      2900187B2900187B2900187B2900187B2900108421001084180008841800087B
      1000007B08000073080052A58C00000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000006B000000940000009C
      000008A5080010A5100018A51800219C2100299C290029942900299429002994
      290029942900188C180010842100000000000000000010841000188C18002994
      2900299429002994290029942900299C2900219C210018A5180010A5100008A5
      0800009C00000094000000730800000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000007B0000009C000008AD
      080010B5100018B5180021AD2100FFFFFF00A5D6A50039A53900399C3900399C
      3900319C310029942900188C29000000000000000000188C180029942900319C
      3100399C3900399C390039A53900A5D6A500FFFFFF0021AD210018B5180010B5
      100008AD0800009C0000007B0800000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000007B000008A5080008B5
      080018B5180021B52100FFFFFF00FFFFFF00FFFFFF0042A5420042A542004AA5
      4A0042A54200399C390021943900000000000000000021942100399C390042A5
      42004AA54A0042A5420042A54200FFFFFF00FFFFFF00FFFFFF0021B5210018B5
      180008B5080008A5080008841000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000884080008A5080010AD
      100018B51800FFFFFF00FFFFFF00FFFFFF0042AD420042A542004AA54A004AA5
      4A004AA54A0042A542002994420000000000000000002994290042A542004AA5
      4A004AA54A004AA54A0042A5420042AD4200FFFFFF00FFFFFF00FFFFFF0018B5
      180010AD100008A5080008841800000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000001084100018A5180018AD
      1800FFFFFF00FFFFFF00FFFFFF0039AD390042AD42004AA54A004AAD4A0052AD
      520052AD52004AA54A00319C52000000000000000000319C31004AA54A0052AD
      520052AD52004AAD4A004AA54A0042AD420039AD3900FFFFFF00FFFFFF00FFFF
      FF0018AD180018A5180010842100000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000018841800189C1800FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF0052AD5200399C5A000000000000000000399C390052AD5200FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00189C180018842900000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000187B1800219C2100FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF005AAD5A00399C6300000000000000000042A542005AAD5A00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00219C210021843100000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000217B210029942900219C
      2100FFFFFF00FFFFFF00FFFFFF00319C3100399C39004AA54A0052A552005AAD
      5A0063AD630063B5630042A56B0000000000000000004AA54A0063B5630063AD
      63005AAD5A0052A552004AA54A00399C3900319C3100FFFFFF00FFFFFF00FFFF
      FF00219C21002994290021843100000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000217B210029942900299C
      290029942900FFFFFF00FFFFFF00FFFFFF00429C42004AA54A0052AD52005AAD
      5A006BB56B006BB56B0042A56B00000000000000000052AD52006BB56B006BB5
      6B005AAD5A0052AD52004AA54A00429C4200FFFFFF00FFFFFF00FFFFFF002994
      2900299C29002994290021843900000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000217B210029942900319C
      3100319C3100319C3100FFFFFF00FFFFFF00FFFFFF0052A552005AAD5A0063B5
      630073BD73007BBD7B004AA5730000000000000000005AAD5A007BBD7B0073BD
      730063B563005AAD5A0052A55200FFFFFF00FFFFFF00FFFFFF00319C3100319C
      3100319C31002994290021843900000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000187B180031943100399C
      390042A542004AA54A004AA54A00FFFFFF00B5DEB50063AD630063B563006BB5
      6B0084C684008CC68C0052AD840000000000000000006BB56B008CC68C0084C6
      84006BB56B0063B5630063AD6300B5DEB500FFFFFF004AA54A004AA54A0042A5
      4200399C390031943100217B3100000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000187318002994290042A5
      42004AA54A0052AD52005AAD5A0063B5630063B563006BB56B0073BD73007BBD
      7B008CC68C009CCE9C0052AD8C00000000000000000073BD73009CCE9C008CC6
      8C007BBD7B0073BD73006BB56B0063B5630063B563005AAD5A0052AD52004AA5
      4A0042A5420029942900187B2900000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000008CBD8C00218C2100319C
      3100399C390039A5390042A542004AA54A004AA54A004AA54A0052AD52005AAD
      5A0063B5630073BD730052ADA5000000000000000000B5DEB50073BD730063B5
      63005AAD5A0052AD52004AA54A004AA54A004AA54A0042A5420039A53900399C
      3900319C3100218C21005AAD9400000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
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
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      FF000000FF000000FF000000FF000000FF000000FF000000FF000000FF000000
      FF00000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000007B7B7B0000000000000000000000
      00007B7B7B000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000848484008484840000000000000000000000
      0000000000000000000000000000000000000000000000000000000000003163
      9C0031639C000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000000000000000FF000000
      FF000000000000000000000000000000000000000000000000000000FF000000
      FF000000FF000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000ADB5AD000000000073737300000000000000000084848400737373000000
      0000000000000000000000000000000000000052630031639C0031639C003163
      9C0031639C000000000000526300005263000052630000526300005263000052
      630000000000000000000000000000000000000000000000FF000000FF000000
      FF000000FF000000000000000000000000000000000000000000000000000000
      FF000000FF000000FF0000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000848484007373
      7300CECECE00CECECE0000000000A59C9C009494940094949400848484000000
      00007373730000000000000000000000000000526300316B9C00316B9C003163
      9C0031639C000000000000CEFF0000CEFF0000CEFF0000000000000000000000
      000000000000000000000000000000000000000000000000FF00000000000000
      FF000000FF000000FF0000000000000000000000000000000000000000000000
      00000000FF000000FF0000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000008484840073737300D6D6
      D600CECECE000000000000000000A59C9C009494940094949400949494008484
      84000000000000000000000000000000000000526300296BA500296BA500296B
      9C00296B9C000000000000CEFF0000CEFF0000CEFF000000000000000000FF00
      0000000000000000000000000000000000000000FF000000FF00000000000000
      00000000FF000000FF000000FF00000000000000000000000000000000000000
      0000000000000000FF000000FF00000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000084848400F7F7F700CECE
      CE000000000000000000F7F7F70094949400A59C9C0094949400848484008484
      840084848400737373000000000000000000005263002173AD002173A5002173
      A5002973A5000000000010CEFF0000CEFF0000CEFF0000000000FF000000FF00
      0000000000000000000000000000000000000000FF000000FF00000000000000
      0000000000000000FF000000FF000000FF000000000000000000000000000000
      0000000000000000FF000000FF00000000000000000000000000000000000000
      00000000000000000000000000000000000000000000000000007B7B7B000000
      0000000000000000000000000000000000000000000084848400F7F7F7000000
      0000F7F7F700F7F7F700CECECE00CECECE00CECECE0094949400949494008484
      84007373730073737300000000000000000000526300187BAD00187BAD00FFFF
      FF002173AD000000000031D6FF0029D6FF0018D6FF00FF000000FF000000FF00
      0000000000000000000000000000000000000000FF000000FF00000000000000
      000000000000000000000000FF000000FF000000FF0000000000000000000000
      0000000000000000FF000000FF00000000000000000000000000FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF000000000000000000FFFFFF00000000000000
      0000000000000000000000000000000000000000000084848400F7F7F700F7F7
      F700D6D6D600D6D6D6000000FF002900CE00CECECE00CECECE00000000008484
      840084848400737373000000000000000000005263001084B5001884B5001884
      B500187BB5000000000063DEFF0052DEFF00FF000000FF000000FF000000FF00
      0000FF000000FF000000FF000000000000000000FF000000FF00000000000000
      00000000000000000000000000000000FF000000FF000000FF00000000000000
      0000000000000000FF000000FF00000000000000000000000000FFFFFF000000
      00000000000000000000FFFFFF000000000000000000FFFFFF00000000000000
      0000000000000000000000000000000000000000000084848400F7F7F700DEDE
      DE0000FF000000946300CECECE00CECECE00D6D6D60073737300848484000000
      00007373730073737300000000000000000000526300088CBD00108CBD001084
      BD001084B500000000008CE7FF00FF000000FF000000FF000000FF000000FF00
      0000FF000000FF000000FF000000000000000000FF000000FF00000000000000
      0000000000000000000000000000000000000000FF000000FF000000FF000000
      0000000000000000FF000000FF00000000000000000000000000FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF000000000000000000FFFFFF00000000000000
      0000000000000000000000000000000000000000000000000000848484008484
      8400DEDEDE00D6D6D600D6D6D600848484007373730000000000000000000000
      000073737300737373000000000000000000005263000894C600088CC600088C
      C600088CBD0000000000B5EFFF00A5EFFF00FF000000FF000000FF000000FF00
      0000FF000000FF000000FF00000000000000000000000000FF000000FF000000
      000000000000000000000000000000000000000000000000FF000000FF000000
      FF00000000000000FF0000000000000000000000000000000000FFFFFF000000
      0000000000000000000000000000FFFFFF00FFFFFF00FFFFFF00000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000084848400F7F7F700737373000000000000000000DEDEDE00DEE7DE00DEDE
      DE0000000000000000000000000000000000005263000094CE000094CE000094
      C6000094C60000000000DEF7FF00CEF7FF00C6EFFF00FF000000FF000000FF00
      000000000000000000000000000000000000000000000000FF000000FF000000
      FF000000000000000000000000000000000000000000000000000000FF000000
      FF000000FF000000FF0000000000000000000000000000000000FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000084848400DEE7DE00E7EFE700EFEFEF00F7F7
      F700DEDEDE0000000000000000000000000000526300009CCE00009CCE00009C
      CE000094CE0000000000FFFFFF00F7F7FF00E7F7FF0000000000FF000000FF00
      00000000000000000000000000000000000000000000000000000000FF000000
      FF000000FF000000000000000000000000000000000000000000000000000000
      FF000000FF00000000000000000000000000000000007B0000007B0000007B00
      00007B0000007B0000007B0000007B0000007B0000007B0000007B0000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000084848400EFEFEF00EFEFEF00F7F7
      F7008484840000000000000000000000000000526300009CCE00009CCE00009C
      CE00009CCE0000000000FFFFFF00FFFFFF00FFFFFF000000000000000000FF00
      0000000000000000000000000000000000000000000000000000000000000000
      FF000000FF000000FF000000FF000000FF000000FF000000FF000000FF000000
      FF0000000000000000000000000000000000000000007B0000007B0000007B00
      00007B0000007B0000007B0000007B0000007B0000007B0000007B0000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000084848400848484008484
      840000000000000000000000000000000000000000000052630000526300009C
      CE00009CCE000000000000526300005263000052630000526300000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000FF000000FF000000FF000000FF000000FF00000000000000
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
      0000000000000000000000000000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000FFFFFF00FFFFFF0000000000FFFF
      FF000000000000000000FFFFFF00000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000FFFFFF00000000000000000000000000008484000084
      8400000000000000000000000000000000000000000000000000000000000000
      0000000000000084840000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000FFFF0000000000000000000000FF
      FF00FFFFFF0000FFFF00FFFFFF0000FFFF0000000000FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00000000000000000000000000000000000000
      000000000000FFFFFF0000000000000000000000000000000000000000000000
      000000000000FFFFFF0000000000000000000000000000000000008484000084
      8400000000000000000000000000000000000000000000000000000000000000
      0000000000000084840000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000FFFF00000000000000FFFF00FFFF
      FF0000FFFF00FFFFFF00000000000000000000000000FFFFFF00FFFFFF00FFFF
      FF00FFFFFF0000000000FFFFFF00000000000000000000000000000000000000
      000000000000FFFFFF0000000000000000000000000000000000000000000000
      000000000000FFFFFF0000000000000000000000000000000000008484000084
      8400000000000000000000000000000000000000000000000000000000000000
      0000000000000084840000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000FFFF000000000000FFFFFF0000FF
      FF00FFFFFF0000FFFF00FFFFFF0000FFFF00FFFFFF0000000000FFFFFF000000
      000000000000FFFFFF00FFFFFF00000000000000000000000000000000000000
      00000000000000000000FFFFFF00000000000000000000000000000000000000
      0000FFFFFF000000000000000000000000000000000000000000008484000084
      8400000000000000000000000000000000000000000000000000000000000000
      0000000000000084840000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000FFFF00000000000000FFFF00FFFF
      FF0000FFFF00FFFFFF00000000000000000000000000000000000000000000FF
      FF0000000000FFFFFF00FFFFFF00000000000000000000000000000000000000
      0000000000000000000000000000FFFFFF00000000000000000000000000FFFF
      FF00000000000000000000000000000000000000000000000000008484000084
      8400008484000084840000848400008484000084840000848400008484000084
      8400008484000084840000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000FFFF000000000000FFFFFF0000FF
      FF00FFFFFF0000FFFF00FFFFFF0000FFFF00FFFFFF0000FFFF00FFFFFF000000
      0000FFFFFF00FFFFFF00FFFFFF00000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000FFFFFF000000
      0000000000000000000000000000000000000000000000000000008484000084
      8400000000000000000000000000000000000000000000000000000000000000
      0000008484000084840000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000FFFF00000000000000FFFF00FFFF
      FF0000000000000000000000000000000000000000000000000000000000FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00000000000000000000000000000000000000
      00000000000000000000000000000000000000000000FFFFFF00000000000000
      0000000000000000000000000000000000000000000000000000008484000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000084840000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000000000000000000000FF
      FF00FFFFFF0000FFFF00000000000000000000FFFF0000000000FFFFFF00FFFF
      FF000000000000000000FFFFFF00000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000FFFFFF000000
      0000000000000000000000000000000000000000000000000000008484000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000084840000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000FFFF0000000000FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00000000000000000000000000000000000000
      0000000000000000000000000000FFFFFF000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000008484000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000084840000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000FFFF0000000000FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00000000000000000000000000000000000000000000000000000000000000
      00000000000000000000FFFFFF00000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000008484000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000084840000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000FFFF0000000000FFFFFF00FFFFFF000000000000000000FFFF
      FF0000000000FFFFFF00FFFFFF00000000000000000000000000000000000000
      000000000000FFFFFF0000000000000000000000000000000000000000000000
      000000000000FFFFFF0000000000000000000000000000000000008484000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000FFFF000000000000000000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF0000000000FFFFFF000000000000000000000000000000000000000000FFFF
      FF00000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000008484000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      FF00000000000000000000000000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000424D3E000000000000003E000000
      2800000040000000400000000100010000000000000200000000000000000000
      000000000000000000000000FFFFFF0000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000FFFFFFFF000000008001800100000000
      8001800100000000800180010000000080018001000000008001800100000000
      8001800100000000800180010000000080018001000000008001800100000000
      8001800100000000800180010000000080018001000000008001800100000000
      8001800100000000FFFFFFFF00000000FFFFF8F8FFFFFFFFF83FFAFAFC7FE3FF
      E00FF870F21F83FFCFC7F800E40F000F87E3FA10C203003FA3F3FA108603002F
      31F9F8008C01000F38F980019001000F3C798013802100013E39801380010001
      3F198013C06300019F8B801FF18F000F8FC3801FFE01000FC7E7801FFF07002F
      E00F801FFF8F803FF83FFFFFFFFFE3FFFFFFFC00FFFFFFFFFFFFFC00FFF9C001
      FFFF2000FFF98031FFFF0000E3F38031FC7F0000E3F38031FD7F0000E1C78001
      FD7F0000F08F8001E10F0000F81F8001EFEF0000FC3F8FF1E10F0000F81F8FF1
      FD7FE000F09F8FF1FD7FF800E1C78FF1FC7FF00083E38FF1FFFFE0018FF18FF5
      FFFFC403FFFF8001FFFFEC07FFFFFFFF00000000000000000000000000000000
      000000000000}
  end
  object tblPessoa: TUMZQuery
    Connection = DM.db
    AfterOpen = tblPessoaAfterOpen
    AfterInsert = tblPessoaAfterInsert
    BeforePost = tblPessoaBeforePost
    AfterPost = tblPessoaAfterPost
    AfterCancel = tblPessoaAfterCancel
    BeforeDelete = tblPessoaBeforeDelete
    OnNewRecord = tblPessoaNewRecord
    SQL.Strings = (
      'select * from pessoas')
    Params = <>
    Left = 755
    Top = 27
    object tblPessoacd_pessoa: TIntegerField
      FieldName = 'cd_pessoa'
      Origin = 'WMESTRE12.pessoas.cd_pessoa'
      DisplayFormat = '00000-0'
    end
    object tblPessoacd_resp_finan: TIntegerField
      FieldName = 'cd_resp_finan'
      Origin = 'WMESTRE12.pessoas.cd_resp_finan'
    end
    object tblPessoacd_resp_acad: TIntegerField
      FieldName = 'cd_resp_acad'
      Origin = 'WMESTRE12.pessoas.cd_resp_acad'
    end
    object tblPessoanm_pessoa: TStringField
      DisplayLabel = 'Nome'
      FieldName = 'nm_pessoa'
      Origin = 'WMESTRE12.pessoas.nm_pessoa'
      Size = 60
    end
    object tblPessoads_cidade_nascimento: TStringField
      DisplayLabel = 'Cidade Nascimento'
      FieldName = 'ds_cidade_nascimento'
      Origin = 'WMESTRE12.pessoas.ds_cidade_nascimento'
      Size = 50
    end
    object tblPessoads_estado_nascimento: TStringField
      DisplayLabel = 'Estado Nascimento'
      FieldName = 'ds_estado_nascimento'
      Origin = 'WMESTRE12.pessoas.ds_estado_nascimento'
      OnChange = tblPessoads_estado_nascimentoChange
      Size = 3
    end
    object tblPessoads_complemento: TStringField
      DisplayLabel = 'Complemento'
      DisplayWidth = 150
      FieldName = 'ds_complemento'
      Origin = 'WMESTRE12.pessoas.ds_complemento'
      Size = 150
    end
    object tblPessoads_cep: TStringField
      DisplayLabel = 'Cep'
      FieldName = 'ds_cep'
      Origin = 'WMESTRE12.pessoas.ds_cep'
      EditMask = '00000\-000;0;_'
      Size = 8
    end
    object tblPessoads_bairro: TStringField
      DisplayLabel = 'Bairro'
      FieldName = 'ds_bairro'
      Origin = 'WMESTRE12.pessoas.ds_bairro'
      Size = 50
    end
    object tblPessoads_cidade: TStringField
      DisplayLabel = 'Cidade'
      FieldName = 'ds_cidade'
      Origin = 'WMESTRE12.pessoas.ds_cidade'
      Size = 50
    end
    object tblPessoads_estado: TStringField
      DisplayLabel = 'Estado'
      FieldName = 'ds_estado'
      Origin = 'WMESTRE12.pessoas.ds_estado'
      OnChange = tblPessoads_estadoChange
      Size = 3
    end
    object tblPessoads_pais: TStringField
      FieldName = 'ds_pais'
      Origin = 'WMESTRE12.pessoas.ds_pais'
      Size = 50
    end
    object tblPessoads_sexo: TStringField
      DisplayLabel = 'Sexo'
      FieldName = 'ds_sexo'
      Origin = 'WMESTRE12.pessoas.ds_sexo'
      OnGetText = tblPessoads_sexoGetText
      OnSetText = tblPessoads_sexoSetText
      FixedChar = True
      Size = 1
    end
    object tblPessoads_nacionalidade: TStringField
      DisplayLabel = 'Nacionalidade'
      FieldName = 'ds_nacionalidade'
      Origin = 'WMESTRE12.pessoas.ds_nacionalidade'
      Size = 50
    end
    object tblPessoads_identidade: TStringField
      DisplayLabel = 'Identidade'
      FieldName = 'ds_identidade'
      Origin = 'WMESTRE12.pessoas.ds_identidade'
    end
    object tblPessoads_cpf: TStringField
      DisplayLabel = 'CPF'
      FieldName = 'ds_cpf'
      Origin = 'WMESTRE12.pessoas.ds_cpf'
      EditMask = '000\.000\.000\-00;0;_'
      Size = 11
    end
    object tblPessoads_titulo_numero: TStringField
      DisplayLabel = 'T'#237'tulo Eleitor'
      FieldName = 'ds_titulo_numero'
      Origin = 'WMESTRE12.pessoas.ds_titulo_numero'
    end
    object tblPessoads_titulo_secao: TStringField
      DisplayLabel = 'Se'#231#227'o'
      FieldName = 'ds_titulo_secao'
      Origin = 'WMESTRE12.pessoas.ds_titulo_secao'
      Size = 10
    end
    object tblPessoads_titulo_zona: TStringField
      DisplayLabel = 'Zona'
      FieldName = 'ds_titulo_zona'
      Origin = 'WMESTRE12.pessoas.ds_titulo_zona'
      Size = 10
    end
    object tblPessoanm_pai: TStringField
      DisplayLabel = 'Nome do Pai'
      FieldName = 'nm_pai'
      Origin = 'WMESTRE12.pessoas.nm_pai'
      Size = 80
    end
    object tblPessoanm_mae: TStringField
      DisplayLabel = 'Nome da M'#227'e'
      FieldName = 'nm_mae'
      Origin = 'WMESTRE12.pessoas.nm_mae'
      Size = 80
    end
    object tblPessoanm_conjuge: TStringField
      DisplayLabel = 'Nome do Conjuge'
      FieldName = 'nm_conjuge'
      Origin = 'WMESTRE12.pessoas.nm_conjuge'
      Size = 80
    end
    object tblPessoacd_usuario: TIntegerField
      FieldName = 'cd_usuario'
      Origin = 'WMESTRE12.pessoas.cd_usuario'
    end
    object tblPessoanm_sem_acento: TStringField
      DisplayLabel = 'Nome sem Acento'
      FieldName = 'nm_sem_acento'
      Origin = 'WMESTRE12.pessoas.nm_sem_acento'
      Size = 80
    end
    object tblPessoads_arquivo_documento: TStringField
      DisplayLabel = 'Arquivo Documento'
      FieldName = 'ds_arquivo_documento'
      Origin = 'WMESTRE12.pessoas.ds_arquivo_documento'
      Size = 100
    end
    object tblPessoads_observacao: TBlobField
      DisplayLabel = 'Observa'#231#227'o'
      FieldName = 'ds_observacao'
      Origin = 'WMESTRE12.pessoas.ds_observacao'
      Size = 1
    end
    object tblPessoacd_empresa: TIntegerField
      DisplayLabel = 'Cod. Empresa'
      FieldName = 'cd_empresa'
      Origin = 'WMESTRE12.pessoas.cd_empresa'
    end
    object tblPessoads_cargo: TStringField
      DisplayLabel = 'Cargo/Fun'#231#227'o:'
      FieldName = 'ds_cargo'
      Origin = 'WMESTRE12.pessoas.ds_cargo'
      Size = 80
    end
    object tblPessoadescEmpresa: TStringField
      DisplayLabel = 'Nome da Empresa'
      FieldKind = fkLookup
      FieldName = 'descEmpresa'
      LookupDataSet = DM.tblEmpresa
      LookupKeyFields = 'cd_empresa'
      LookupResultField = 'nm_empresa'
      KeyFields = 'cd_empresa'
      Size = 80
      Lookup = True
    end
    object tblPessoads_pais_nascimento: TStringField
      DisplayLabel = 'Pa'#237's Nasc.'
      FieldName = 'ds_pais_nascimento'
      Origin = 'WMESTRE12.pessoas.ds_pais_nascimento'
      Size = 50
    end
    object tblPessoads_logradouro: TStringField
      DisplayWidth = 150
      FieldName = 'ds_logradouro'
      Origin = 'WMESTRE12.pessoas.ds_logradouro'
      Size = 150
    end
    object tblPessoads_logradouro_nro: TStringField
      DisplayLabel = 'N'#250'mero'
      FieldName = 'ds_logradouro_nro'
      Origin = 'WMESTRE12.pessoas.ds_logradouro_nro'
      Size = 10
    end
    object tblPessoadescEstadoNasc: TStringField
      DisplayLabel = 'Estado Nasc.'
      FieldKind = fkLookup
      FieldName = 'descEstadoNasc'
      LookupDataSet = DM.tblEstados
      LookupKeyFields = 'ds_uf'
      LookupResultField = 'ds_estado'
      KeyFields = 'ds_estado_nascimento'
      Size = 50
      Lookup = True
    end
    object tblPessoadescEstado: TStringField
      DisplayLabel = 'Estado'
      FieldKind = fkLookup
      FieldName = 'descEstado'
      LookupDataSet = DM.tblEstados2
      LookupKeyFields = 'ds_uf'
      LookupResultField = 'ds_estado'
      KeyFields = 'ds_estado'
      Size = 50
      Lookup = True
    end
    object tblPessoads_identidade_orgao_exp: TStringField
      FieldName = 'ds_identidade_orgao_exp'
      Origin = 'WMESTRE12.pessoas.ds_identidade_orgao_exp'
      Size = 50
    end
    object tblPessoads_rm_corporacao: TStringField
      DisplayLabel = 'Corpora'#231#227'o'
      FieldName = 'ds_rm_corporacao'
      Origin = 'WMESTRE12.pessoas.ds_rm_corporacao'
    end
    object tblPessoads_rm_orgao: TStringField
      DisplayLabel = 'Org'#227'o S.M.'
      FieldName = 'ds_rm_orgao'
      Origin = 'WMESTRE12.pessoas.ds_rm_orgao'
    end
    object tblPessoads_rm_org_numero: TStringField
      DisplayLabel = 'N'#250'mero do Org'#227'o'
      FieldName = 'ds_rm_org_numero'
      Origin = 'WMESTRE12.pessoas.ds_rm_org_numero'
    end
    object tblPessoads_rm_doc_numero: TStringField
      DisplayLabel = 'N'#250'mero Doc.'
      FieldName = 'ds_rm_doc_numero'
      Origin = 'WMESTRE12.pessoas.ds_rm_doc_numero'
    end
    object tblPessoads_rm_doc_tipo: TStringField
      DisplayLabel = 'Documento S.M.'
      DisplayWidth = 100
      FieldName = 'ds_rm_doc_tipo'
      Origin = 'WMESTRE12.pessoas.ds_rm_doc_tipo'
      Size = 100
    end
    object tblPessoadt_nascimento: TDateTimeField
      FieldName = 'dt_nascimento'
      Origin = 'WMESTRE12.pessoas.dt_nascimento'
      DisplayFormat = 'dd/mm/yyyy'
      EditMask = '99/99/9999;1;_'
    end
    object tblPessoadt_rm_exp: TDateTimeField
      FieldName = 'dt_rm_exp'
      Origin = 'WMESTRE12.pessoas.dt_rm_exp'
      DisplayFormat = 'dd/mm/yyyy'
      EditMask = '!99/99/9999;1;_'
    end
    object tblPessoadt_identidade_expedicao: TDateTimeField
      FieldName = 'dt_identidade_expedicao'
      Origin = 'WMESTRE12.pessoas.dt_identidade_expedicao'
      DisplayFormat = 'dd/mm/yyyy'
      EditMask = '!99/99/9999;1;_'
    end
    object tblPessoadt_revisao: TDateTimeField
      FieldName = 'dt_revisao'
      Origin = 'WMESTRE12.pessoas.dt_revisao'
      DisplayFormat = 'dd/mm/yyyy'
      EditMask = '!99/99/9999;1;_'
    end
    object tblPessoadt_cadastro: TDateTimeField
      FieldName = 'dt_cadastro'
      Origin = 'WMESTRE12.pessoas.dt_cadastro'
      DisplayFormat = 'dd/mm/yyyy'
      EditMask = '!99/99/9999;1;_'
    end
    object tblPessoacd_estado_civil: TSmallintField
      FieldName = 'cd_estado_civil'
      Origin = 'WMESTRE12.pessoas.cd_estado_civil'
    end
    object tblPessoads_senha: TStringField
      FieldName = 'ds_senha'
      Origin = 'WMESTRE12.pessoas.ds_senha'
      Size = 32
    end
    object tblPessoasn_senha_provisoria: TStringField
      FieldName = 'sn_senha_provisoria'
      Origin = 'WMESTRE12.pessoas.sn_senha_provisoria'
      Size = 1
    end
    object tblPessoadescEstadoCivil: TStringField
      FieldKind = fkLookup
      FieldName = 'descEstadoCivil'
      LookupDataSet = tblEstadosCivis
      LookupKeyFields = 'cd_estado_civil'
      LookupResultField = 'ds_estado_civil'
      KeyFields = 'cd_estado_civil'
      Size = 40
      Lookup = True
    end
    object tblPessoadt_titulo_emissao: TDateTimeField
      FieldName = 'dt_titulo_emissao'
      Origin = 'WMESTRE12.pessoas.dt_titulo_emissao'
      DisplayFormat = 'dd/mm/yyyy'
      EditMask = '!99/99/9900;1;_'
    end
    object tblPessoadescPais: TStringField
      FieldKind = fkLookup
      FieldName = 'descPais'
      LookupDataSet = tblPaises
      LookupKeyFields = 'cd_pais'
      LookupResultField = 'ds_pais'
      KeyFields = 'cd_pais'
      Size = 40
      Lookup = True
    end
    object tblPessoasn_bloqueto_empresa: TStringField
      FieldName = 'sn_bloqueto_empresa'
      Origin = 'WMESTRE12.pessoas.sn_bloqueto_empresa'
      FixedChar = True
      Size = 1
    end
    object tblPessoaim_pessoa: TBlobField
      FieldName = 'im_pessoa'
      Origin = 'WMESTRE12.pessoas.im_pessoa'
      Size = 1
    end
    object tblPessoads_login: TStringField
      FieldName = 'ds_login'
      Origin = 'WMESTRE12.pessoas.ds_login'
      Size = 100
    end
    object tblPessoatp_cert: TSmallintField
      DisplayLabel = 'Tipo de Certid'#227'o'
      FieldName = 'tp_cert'
      Origin = 'WMESTRE12.pessoas.tp_cert'
      OnGetText = tblPessoatp_certGetText
      OnSetText = tblPessoatp_certSetText
    end
    object tblPessoanr_cert_termo: TStringField
      DisplayLabel = 'N'#250'mero do Termo'
      FieldName = 'nr_cert_termo'
      Origin = 'WMESTRE12.pessoas.nr_cert_termo'
      Size = 50
    end
    object tblPessoads_cert_folha: TStringField
      FieldName = 'ds_cert_folha'
      Origin = 'WMESTRE12.pessoas.ds_cert_folha'
      Size = 8
    end
    object tblPessoads_cert_livro: TStringField
      DisplayLabel = 'Livro'
      FieldName = 'ds_cert_livro'
      Origin = 'WMESTRE12.pessoas.ds_cert_livro'
      Size = 8
    end
    object tblPessoadt_cert: TDateTimeField
      DisplayLabel = 'Data de Emiss'#227'o'
      FieldName = 'dt_cert'
      Origin = 'WMESTRE12.pessoas.dt_cert'
      DisplayFormat = 'dd/mm/yyyy'
      EditMask = '!99/99/0000;1;_'
    end
    object tblPessoads_cert_uf: TStringField
      DisplayLabel = 'UF Cart'#243'rio'
      FieldName = 'ds_cert_uf'
      Origin = 'WMESTRE12.pessoas.ds_cert_uf'
      FixedChar = True
      Size = 2
    end
    object tblPessoads_cert_orgao: TStringField
      DisplayLabel = 'Org'#227'o Emissor'
      FieldName = 'ds_cert_orgao'
      Origin = 'WMESTRE12.pessoas.ds_cert_orgao'
      Size = 100
    end
    object tblPessoadesLogradouro: TStringField
      FieldKind = fkLookup
      FieldName = 'desLogradouro'
      LookupDataSet = tblTpLogradouro
      LookupKeyFields = 'cd_logradouro'
      LookupResultField = 'ds_logradouro'
      KeyFields = 'cd_logradouro'
      Size = 40
      Lookup = True
    end
    object tblPessoadescMunicipio: TStringField
      FieldKind = fkLookup
      FieldName = 'descMunicipio'
      LookupDataSet = tblMunicipios
      LookupKeyFields = 'cd_municipio'
      LookupResultField = 'ds_municipio'
      KeyFields = 'cd_municipio_nasc'
      Size = 50
      Lookup = True
    end
    object tblPessoadescPaisNasc: TStringField
      FieldKind = fkLookup
      FieldName = 'descPaisNasc'
      LookupDataSet = tblPaises
      LookupKeyFields = 'cd_pais'
      LookupResultField = 'ds_pais'
      KeyFields = 'cd_pais_nascimento'
      Size = 40
      Lookup = True
    end
    object tblPessoadescMunicipioAtual: TStringField
      FieldKind = fkLookup
      FieldName = 'descMunicipioAtual'
      LookupDataSet = tblMunicipioAtual
      LookupKeyFields = 'cd_municipio'
      LookupResultField = 'ds_municipio'
      KeyFields = 'cd_municipio'
      Size = 50
      Lookup = True
    end
    object tblPessoadescOrgao: TStringField
      FieldKind = fkLookup
      FieldName = 'descOrgao'
      LookupDataSet = tblOrgaos
      LookupKeyFields = 'cd_orgao_emissor'
      LookupResultField = 'ds_orgao_emissor'
      KeyFields = 'cd_orgao_emissor'
      Size = 50
      Lookup = True
    end
    object tblPessoacd_raca: TSmallintField
      FieldName = 'cd_raca'
      Origin = 'WMESTRE12.pessoas.cd_raca'
    end
    object tblPessoasn_foto: TStringField
      FieldName = 'sn_foto'
      Origin = 'WMESTRE12.pessoas.sn_foto'
      Size = 1
    end
    object tblPessoanr_dia_vencimento: TLargeintField
      FieldName = 'nr_dia_vencimento'
    end
    object tblPessoacd_pessoa_alteracao: TLargeintField
      FieldName = 'cd_pessoa_alteracao'
    end
    object tblPessoacd_municipio_nasc: TLargeintField
      FieldName = 'cd_municipio_nasc'
    end
    object tblPessoanr_praca: TLargeintField
      FieldName = 'nr_praca'
    end
    object tblPessoacd_orgao_emissor: TLargeintField
      FieldName = 'cd_orgao_emissor'
    end
    object tblPessoacd_municipio: TLargeintField
      FieldName = 'cd_municipio'
    end
    object tblPessoacd_pais: TLargeintField
      FieldName = 'cd_pais'
    end
    object tblPessoacd_logradouro: TLargeintField
      FieldName = 'cd_logradouro'
    end
    object tblPessoasn_bloqueado: TSmallintField
      FieldName = 'sn_bloqueado'
      Origin = 'WMESTRE12.pessoas.sn_bloqueado'
    end
    object tblPessoasn_naturalizado: TSmallintField
      FieldName = 'sn_naturalizado'
    end
    object tblPessoacd_mae: TLargeintField
      FieldName = 'cd_mae'
    end
    object tblPessoacd_pai: TLargeintField
      FieldName = 'cd_pai'
    end
    object tblPessoanm_contato: TStringField
      FieldName = 'nm_contato'
      Size = 100
    end
    object tblPessoacd_pais_nascimento: TLargeintField
      FieldName = 'cd_pais_nascimento'
    end
    object tblPessoasn_nao_bloquear_financeiro: TSmallintField
      FieldName = 'sn_nao_bloquear_financeiro'
    end
    object tblPessoads_estado_civil: TStringField
      FieldName = 'ds_estado_civil'
      Size = 1
    end
    object tblPessoads_senha_md4: TStringField
      FieldName = 'ds_senha_md4'
      Size = 32
    end
    object tblPessoasn_foto_publica: TStringField
      FieldName = 'sn_foto_publica'
      Size = 1
    end
    object tblPessoasn_pai: TStringField
      FieldName = 'sn_pai'
      Size = 1
    end
    object tblPessoasn_mae: TStringField
      FieldName = 'sn_mae'
      Size = 1
    end
    object tblPessoatp_pessoa: TStringField
      FieldName = 'tp_pessoa'
      Size = 1
    end
    object tblPessoads_cnpj: TStringField
      FieldName = 'ds_cnpj'
      Size = 14
    end
    object tblPessoads_inscri_estadual: TStringField
      FieldName = 'ds_inscri_estadual'
      Size = 50
    end
    object tblPessoacd_estado_nascimento: TSmallintField
      FieldName = 'cd_estado_nascimento'
    end
    object tblPessoacd_estado: TLargeintField
      FieldName = 'cd_estado'
    end
    object tblPessoacd_convenio: TLargeintField
      FieldName = 'cd_convenio'
      Required = True
    end
    object tblPessoasn_pai_resp: TSmallintField
      FieldName = 'sn_pai_resp'
      Required = True
    end
    object tblPessoasn_mae_resp: TSmallintField
      FieldName = 'sn_mae_resp'
      Required = True
    end
    object tblPessoacd_cert_uf: TSmallintField
      FieldName = 'cd_cert_uf'
    end
    object tblPessoacd_localidade: TIntegerField
      FieldName = 'cd_localidade'
    end
    object tblPessoacd_localidade_nasc: TIntegerField
      FieldName = 'cd_localidade_nasc'
    end
    object tblPessoasn_pais_como_resp: TSmallintField
      FieldName = 'sn_pais_como_resp'
      Required = True
    end
    object tblPessoasn_obito: TSmallintField
      FieldName = 'sn_obito'
      Required = True
    end
    object tblPessoasn_requerimentos_email: TStringField
      FieldName = 'sn_requerimentos_email'
      Size = 1
    end
    object tblPessoacd_instituicao_ensino: TSmallintField
      FieldName = 'cd_instituicao_ensino'
    end
    object tblPessoacd_mec: TStringField
      FieldName = 'cd_mec'
      Size = 30
    end
    object tblPessoads_inscri_municipal: TStringField
      FieldName = 'ds_inscri_municipal'
      Size = 50
    end
    object tblPessoacd_bairro: TIntegerField
      FieldName = 'cd_bairro'
    end
    object tblPessoacd_usuario_pessoa: TLargeintField
      FieldName = 'cd_usuario_pessoa'
    end
    object tblPessoasn_bloq_emails: TSmallintField
      FieldName = 'sn_bloq_emails'
    end
    object tblPessoasn_bloq_cartas: TSmallintField
      FieldName = 'sn_bloq_cartas'
    end
    object tblPessoadescNacionalidades: TStringField
      FieldKind = fkLookup
      FieldName = 'descNacionalidades'
      LookupDataSet = qyPais
      LookupKeyFields = 'ds_nacionalidade'
      LookupResultField = 'ds_nacionalidade'
      KeyFields = 'ds_nacionalidade'
      Size = 255
      Lookup = True
    end
    object tblPessoads_matricula: TStringField
      FieldName = 'ds_matricula'
      EditMask = '###### ## ## #### # ##### ### ####### ##;1;_'
      Size = 40
    end
    object tblPessoasn_pode_retirar_material: TSmallintField
      FieldName = 'sn_pode_retirar_material'
    end
    object tblPessoadt_identidade_expiracao: TDateTimeField
      FieldName = 'dt_identidade_expiracao'
    end
    object tblPessoads_passaporte: TStringField
      FieldName = 'ds_passaporte'
      Size = 50
    end
    object tblPessoanm_pessoa_oficial: TStringField
      DisplayLabel = 'Nome Oficial'
      FieldName = 'nm_pessoa_oficial'
      Size = 60
    end
    object tblPessoasn_nome_social: TSmallintField
      FieldName = 'sn_nome_social'
    end
    object tblPessoads_forma_conheceu: TStringField
      FieldName = 'ds_forma_conheceu'
      Size = 255
    end
  end
  object dsPessoa: TDataSource
    DataSet = tblPessoa
    OnStateChange = dsPessoaStateChange
    OnDataChange = dsPessoaDataChange
    Left = 787
    Top = 28
  end
  object tblEstadosCivis: TZTable
    Connection = DM.db
    TableName = 'pessoas_estados_civis'
    Left = 720
    Top = 27
    object tblEstadosCiviscd_estado_civil: TSmallintField
      FieldName = 'cd_estado_civil'
    end
    object tblEstadosCivisds_estado_civil: TStringField
      FieldName = 'ds_estado_civil'
      Size = 40
    end
  end
  object AbrirFoto: TSavePictureDialog
    Filter = 'JPEG Image File (*.jpg)|*.jpg'
    FilterIndex = 0
    Title = 'Selecionar foto da pessoa'
    Left = 800
    Top = 96
  end
  object tblTpLogradouro: TUMZQuery
    Connection = DM.db
    SQL.Strings = (
      'SELECT * FROM logradouros '
      'ORDER by ds_logradouro')
    Params = <>
    Left = 720
    Top = 56
    object tblTpLogradourocd_logradouro: TIntegerField
      FieldName = 'cd_logradouro'
      Origin = 'WMESTRE12.logradouros.cd_logradouro'
    end
    object tblTpLogradourods_logradouro: TStringField
      FieldName = 'ds_logradouro'
      Origin = 'WMESTRE12.logradouros.ds_logradouro'
      Size = 120
    end
  end
  object tblMunicipios: TUMZQuery
    Connection = DM.db
    SQL.Strings = (
      'SELECT cd_municipio, ds_municipio FROM municipios'
      'WHERE uf = :uf_nascimento'
      'ORDER by ds_municipio')
    Params = <
      item
        DataType = ftUnknown
        Name = 'uf_nascimento'
        ParamType = ptUnknown
      end>
    DataSource = dsPessoa
    Left = 752
    Top = 56
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'uf_nascimento'
        ParamType = ptUnknown
      end>
    object tblMunicipiosds_municipio: TStringField
      FieldName = 'ds_municipio'
      Origin = 'WMESTRE12.municipios.ds_municipio'
      Size = 120
    end
    object tblMunicipioscd_municipio: TLargeintField
      FieldName = 'cd_municipio'
      Required = True
    end
  end
  object tblMunicipioAtual: TUMZQuery
    Connection = DM.db
    SQL.Strings = (
      'SELECT cd_municipio, ds_municipio, nr_praca FROM municipios'
      'WHERE uf = :uf_atual'
      'ORDER by ds_municipio')
    Params = <
      item
        DataType = ftUnknown
        Name = 'uf_atual'
        ParamType = ptUnknown
      end>
    DataSource = dsPessoa
    Left = 816
    Top = 56
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'uf_atual'
        ParamType = ptUnknown
      end>
    object tblMunicipioAtualds_municipio: TStringField
      FieldName = 'ds_municipio'
      Origin = 'WMESTRE12.municipios.ds_municipio'
      Size = 120
    end
    object tblMunicipioAtualcd_municipio: TLargeintField
      FieldName = 'cd_municipio'
      Required = True
    end
    object tblMunicipioAtualnr_praca: TLargeintField
      FieldName = 'nr_praca'
    end
  end
  object tblPaises: TZTable
    Connection = DM.db
    SortedFields = 'ds_pais'
    TableName = 'paises'
    IndexFieldNames = 'ds_pais Asc'
    Left = 784
    Top = 56
  end
  object tblContatosPadroes: TUMZQuery
    Connection = DM.db
    Params = <>
    Left = 720
    Top = 104
  end
  object tblOrgaos: TUMZQuery
    Connection = DM.db
    SQL.Strings = (
      'SELECT * FROM ORGAOS_EMISSORES')
    Params = <>
    DataSource = dsPessoa
    Left = 848
    Top = 56
    object Query1cd_orgao_emissor: TIntegerField
      FieldName = 'cd_orgao_emissor'
    end
    object Query1ds_orgao_emissor: TStringField
      FieldName = 'ds_orgao_emissor'
      Size = 120
    end
  end
  object qryPessoaUpdatePraca: TUMZQuery
    Connection = DM.db
    SQL.Strings = (
      'UPDATE'
      '   PESSOAS'
      'SET'
      '   NR_PRACA = NR_PRACA'
      'WHERE'
      '   CD_PESSOA = :CD_PESSOA')
    Params = <
      item
        DataType = ftUnknown
        Name = 'CD_PESSOA'
        ParamType = ptUnknown
      end>
    SQLList.Strings = (
      
        'mysql-5=UPDATE'#13#10'   PESSOAS P'#13#10'      JOIN MUNICIPIOS M ON'#13#10'      ' +
        '   (P.DS_CIDADE = M.DS_MUNICIPIO) AND'#13#10'         (P.DS_ESTADO = M' +
        '.UF)'#13#10'SET'#13#10'   P.NR_PRACA = M.NR_PRACA'#13#10'WHERE'#13#10'   P.CD_PESSOA = :' +
        'CD_PESSOA'
      
        'oracle=MERGE INTO PESSOAS P USING ('#13#10'   SELECT'#13#10'      P.CD_PESSO' +
        'A,'#13#10'      M.NR_PRACA'#13#10'   FROM'#13#10'      PESSOAS P'#13#10'         JOIN MU' +
        'NICIPIOS M ON'#13#10'            (P.DS_CIDADE = M.DS_MUNICIPIO) AND'#13#10' ' +
        '           (P.DS_ESTADO = M.UF)'#13#10'   WHERE'#13#10'      P.CD_PESSOA = :' +
        'CD_PESSOA'#13#10') P2 ON'#13#10'   (P.CD_PESSOA = P2.CD_PESSOA)'#13#10'WHEN MATCHE' +
        'D THEN'#13#10'   UPDATE SET P.NR_PRACA = P2.NR_PRACA')
    Left = 280
    Top = 408
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'CD_PESSOA'
        ParamType = ptUnknown
      end>
  end
  object qryPessoaUpdateMunicipio: TUMZQuery
    Connection = DM.db
    SQL.Strings = (
      'UPDATE'
      '  PESSOAS'
      'SET'
      '  DS_CIDADE = DS_CIDADE'
      'WHERE'
      '  CD_PESSOA = :CD_PESSOA')
    Params = <
      item
        DataType = ftUnknown
        Name = 'CD_PESSOA'
        ParamType = ptUnknown
      end>
    SQLList.Strings = (
      
        'mysql-5=UPDATE'#13#10'   PESSOAS P'#13#10'      LEFT JOIN MUNICIPIOS M ON'#13#10' ' +
        '        (P.CD_MUNICIPIO = M.CD_MUNICIPIO)'#13#10'SET'#13#10'   P.DS_CIDADE =' +
        ' M.DS_MUNICIPIO'#13#10'WHERE'#13#10'   P.CD_PESSOA = :CD_PESSOA'
      
        'oracle=MERGE INTO PESSOAS P USING ('#13#10'   SELECT'#13#10'      P.CD_PESSO' +
        'A,'#13#10'      M.DS_MUNICIPIO'#13#10'   FROM'#13#10'      PESSOAS P'#13#10'         JOI' +
        'N MUNICIPIOS M ON'#13#10'            (P.CD_MUNICIPIO = M.CD_MUNICIPIO)' +
        #13#10'   WHERE'#13#10'      P.CD_PESSOA = :CD_PESSOA'#13#10') P2 ON'#13#10'   (P.CD_PE' +
        'SSOA = P2.CD_PESSOA)'#13#10'WHEN MATCHED THEN'#13#10'   UPDATE SET P.DS_CIDA' +
        'DE = P2.DS_MUNICIPIO')
    Left = 248
    Top = 408
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'CD_PESSOA'
        ParamType = ptUnknown
      end>
  end
  object qryPessoaUpdateMunNasc: TUMZQuery
    Connection = DM.db
    SQL.Strings = (
      'UPDATE'
      '   PESSOAS'
      'SET'
      '   DS_CIDADE_NASCIMENTO = DS_CIDADE_NASCIMENTO'
      'WHERE'
      '   CD_PESSOA = :CD_PESSOA')
    Params = <
      item
        DataType = ftUnknown
        Name = 'CD_PESSOA'
        ParamType = ptUnknown
      end>
    SQLList.Strings = (
      
        'mysql-5=UPDATE'#13#10'   PESSOAS P'#13#10'      LEFT JOIN MUNICIPIOS M ON'#13#10' ' +
        '        (P.CD_MUNICIPIO_NASC = M.CD_MUNICIPIO)'#13#10'SET'#13#10'   P.DS_CID' +
        'ADE_NASCIMENTO = M.DS_MUNICIPIO'#13#10'WHERE'#13#10'   P.CD_PESSOA = :CD_PES' +
        'SOA'
      
        'oracle=MERGE INTO PESSOAS P USING ('#13#10'   SELECT'#13#10'      P.CD_PESSO' +
        'A,'#13#10'      M.DS_MUNICIPIO'#13#10'   FROM'#13#10'      PESSOAS P'#13#10'         LEF' +
        'T JOIN MUNICIPIOS M ON'#13#10'            (P.CD_MUNICIPIO_NASC = M.CD_' +
        'MUNICIPIO)'#13#10'   WHERE'#13#10'      P.CD_PESSOA = :CD_PESSOA'#13#10') P2 ON'#13#10' ' +
        '  (P.CD_PESSOA = P2.CD_PESSOA)'#13#10'WHEN MATCHED THEN'#13#10'   UPDATE SET' +
        ' P.DS_CIDADE_NASCIMENTO = P2.DS_MUNICIPIO')
    Left = 216
    Top = 408
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'CD_PESSOA'
        ParamType = ptUnknown
      end>
  end
  object imgListFoto: TImageList
    Left = 776
    Top = 168
    Bitmap = {
      494C010106000900040010001000FFFFFFFFFF10FFFFFFFFFFFFFFFF424D3600
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
      000000000000000000000000000000000000000000000000000000000000FAFA
      FA00EFEFEF00DFDFDF00D4D4D400CACACA00C9C9C900C9C9C900D1D1D100E3E3
      E300F4F4F400FDFDFD00FEFEFE00000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000FFFFFF00FFFFFF000000000000000000000000000000
      00000000000000000000000000000000000000000000E8E9E900A6A8A700989B
      9B00919594008A8C8B0084888700828484008284840082848400848686008C8F
      8D00959897009A9D9C00CFD0CF00FDFDFD000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000007F7F7F007F7F7F00FFFFFF00FFFFFF0000000000000000000000
      00000000000000000000000000000000000000000000B8B9B900A9AAAA00B4B4
      B400B6B6B600B7B7B700B7B7B700B5B5B500B4B4B400B4B4B400B1B3B300B0B3
      B200AFB1B100AAAAAA0090939100EBEBEB000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00007F7F7F007F7F7F007F7F7F007F7F7F00FFFFFF0000000000000000000000
      00000000000000000000000000000000000000000000999A9A00B7B8B700989B
      9A009497960092949400919393009092920091939200909292008F9191008E90
      90008D8F8F009D9D9D0097989800D2D3D3000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00007F7F7F007F7F7F007F7F7F007F7F7F00FFFFFF00FFFFFF00000000000000
      0000000000000000000000000000000000000000000096989800BCBDBD00AAAB
      AC009C9E9F009D9E9F009D9E9E00999B9B008C8E8F0084868700858888008789
      8900878989008C8E8F00A5A6A500CDCECE000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000007F7F
      7F007F7F7F007F7F7F007F7F7F007F7F7F007F7F7F00FFFFFF00000000000000
      000000000000000000000000000000000000000000009C9E9E00A4A4A4009193
      9300868888008E8F8F00909191008F9090008F9191008D9090008D8E8F008D8D
      8F008F919100797B7B00A7A8A700CDCECE000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000000000007F7F7F007F7F
      7F007F7F7F007F7F7F007F7F7F007F7F7F007F7F7F00FFFFFF00FFFFFF000000
      00000000000000000000000000000000000000000000A2A4A400B6B6B600EAEB
      EB00D9D9D900EDEDED00F2F2F200F3F3F300F1F1F100EFEFEF00EDEEEE00EEEE
      EF00ECEDED008F929200ABADAC00CDCECE000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000007F7F7F007F7F7F007F7F
      7F007F7F7F00000000007F7F7F007F7F7F007F7F7F007F7F7F00FFFFFF000000
      00000000000000000000000000000000000000000000ADAEAE0000000000F8F8
      F800000000000000000000000000000000000000000000000000000000000000
      0000F4F4F400E9E9E900BDBEBE00CDCECE000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000007F7F7F007F7F7F007F7F7F000000
      00000000000000000000000000007F7F7F007F7F7F007F7F7F00FFFFFF00FFFF
      FF000000000000000000000000000000000000000000C7C7C700C0C2C200ECED
      EE00A6A8A800989A9A009899990098999900989999009899990098999900ADAF
      AF00BABDBC00B0B2B200ACADAD00F4F4F4000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000007F7F7F007F7F7F007F7F7F007F7F7F00FFFF
      FF000000000000000000000000000000000000000000FAFAFA00C9CACA009EA0
      A000D5D6D600E8E8E800E7E7E700D8D8D800CFCFCF00EBEBEB00EDEDED00F2F2
      F2009A9C9B00B4B5B500F5F6F600000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000007F7F7F007F7F7F007F7F7F00FFFF
      FF00FFFFFF00000000000000000000000000000000000000000000000000E1E1
      E100D7D8D700E7E7E700D0D0D000ADAEAE00A2A3A300EBEBEB00EEEEEE00F5F5
      F500CBCCCC00FDFDFD0000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000007F7F7F007F7F7F007F7F
      7F00FFFFFF00FFFFFF000000000000000000000000000000000000000000F5F5
      F500D7D8D700E6E6E600B7B8B8009D9F9F008E909000BABBBB00E0E0E000F5F5
      F500D5D6D600FEFEFE0000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000000000007F7F7F007F7F
      7F007F7F7F00FFFFFF00FFFFFF0000000000000000000000000000000000F5F5
      F500D7D8D700E5E5E500C5C5C5009092920090929200ADAFAF00E7E7E700F5F5
      F500D5D6D6000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000007F7F
      7F007F7F7F007F7F7F00FFFFFF00FFFFFF00000000000000000000000000F5F5
      F500D7D8D700EBEBEB00D8D8D800B8B9B900A6A8A800D9D9D900E9E9E900F5F5
      F500D6D7D7000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000007F7F7F007F7F7F007F7F7F00000000000000000000000000F7F7
      F700C6C7C600CCCDCC00CCCDCC00CCCDCC00CCCDCC00CCCDCC00CCCDCC00C9CB
      CA00DFE0DF000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000E6E6E6FF787878FF7A7A7AFFABAB
      AAFFBBBBBBFFC4C4C4FFCACACAFFCECECEFFCECECEFFCACACAFFC4C4C4FFBBBB
      BBFFABABAAFF7A7A7AFF787878FFE6E6E6FFE6E6E6FF797979FF7B7B7BFFABAB
      AAFFBBBBBBFFC4C4C4FFCACACAFFCECECEFFCECECEFFCACACAFFC4C4C4FFBBBB
      BBFFABABAAFF7B7B7BFF797979FFE6E6E6FF0000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000E2E2E2FF565656FF252424FF1E1D
      1CFF282726FF353433FF414040FF4E4E4EFF4E4E4EFF424040FF353433FF2827
      26FF1E1D1CFF272625FF565555FFE2E2E2FF92918EFF36342EFF36342EFF3634
      2EFF36342EFF36342EFF36342EFF36342EFF36342EFF36342EFF36342EFF3634
      2EFF36342EFF36342EFF36342EFF767571FF0000000000000000000000000000
      0000000000000000FF000000FF000000FF000000FF000000FF00000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000FFFFFFFFC5C5C5FF605E5DFF4745
      44FF6A6968FF9D9C9CFFBBBABBFFC7C7C7FFC7C7C7FFBBBBBBFF9E9D9DFF6B69
      69FF474544FF5F5E5CFFC5C4C4FFFFFFFFFF36342EFF828785FF7F8482FF777C
      7AFF727674FF696D6BFF616563FF4E514FFF4D504EFF464948FF424544FF696D
      6BFF767977FF8A8F8DFF878D8AFF36342EFF0000000000000000000000000000
      FF000000FF000000FF000000FF000000FF000000FF000000FF000000FF000000
      FF00000000000000000000000000000000000000000000000000000000000000
      0000000000000000FF0000000000000000000000000000000000000000000000
      000000000000000000000000000000000000FFFFFFFFFFFFFFFFCECECEFF9D9B
      9BFFCDCDCDFFDEDEDEFFE2E2E2FFE1E1E1FFE1E1E1FFE2E2E2FFDEDEDEFFCECD
      CDFF9D9B9CFFCECDCDFFFFFFFFFFFFFFFFFF36342EFFA2A9A6FF666A68FF666A
      68FF525654FF595E5CFF717675FF818684FF818684FF5A5E5DFF343736FF282A
      29FF525654FF666A68FF767A78FF36342EFF00000000000000000000FF000000
      FF000000000000000000000000000000000000000000000000000000FF000000
      FF000000FF000000000000000000000000000000000000000000000000000000
      00000000FF000000FF000000FF00000000000000000000000000000000000000
      000000000000000000000000000000000000FFFFFFFFFCFCFDFFE2E2E3FFDAD9
      DAFFE3E3E3FFE5E5E5FFDBDBDBFFC6C6C6FFC6C6C6FFDBDBDBFFE5E5E5FFE3E3
      E3FFDAD9DAFFE2E2E3FFFCFCFDFFFFFFFFFF36342EFFA5ABA8FF5D615FFF5559
      57FF767B79FF868A88FF464745FF282724FF2D2C27FF4D4F4CFF828785FF3B3D
      3CFF292B2AFF626664FF767A78FF36342EFF000000000000FF000000FF000000
      FF000000FF000000000000000000000000000000000000000000000000000000
      FF000000FF000000FF0000000000000000000000000000000000000000000000
      00000000FF000000FF000000FF00000000000000000000000000000000000000
      000000000000000000000000000000000000FFFFFFFFEDEDEEFFD9D9D9FFE4E4
      E4FFE5E5E5FFB3B3B3FF4F4F50FF2A2724FF2A2724FF4F4F50FFB3B3B3FFE5E5
      E5FFE4E4E4FFD9D9D9FFEDEDEEFFFFFFFFFF36342EFFA5ACA9FF5E6260FF5559
      57FF898C8BFF424442FF1D1B18FF262520FF302D29FF949390FF4D4E4CFF7A7F
      7DFF363837FF636765FF868B89FF36342EFF000000000000FF00000000000000
      FF000000FF000000FF0000000000000000000000000000000000000000000000
      00000000FF000000FF0000000000000000000000000000000000000000000000
      FF000000FF000000FF000000FF000000FF000000000000000000000000000000
      000000000000000000000000000000000000FFFFFFFFDFDFE0FFE3E3E3FFE8E8
      E8FFBFBFBFFF363432FF452E07FF7F5204FF7F5204FF452E07FF363432FFBFBF
      BFFFE8E8E8FFE3E3E3FFDFDFE0FFFFFFFFFF36342EFFA7ADAAFF5F6361FF686C
      6AFF868B89FF1A1A18FF1C1B18FFA8A7A6FF2F2D28FF2E2C28FF2D2C27FF8488
      86FF3F4140FF6E7270FF878C8AFF36342EFF0000FF000000FF00000000000000
      00000000FF000000FF000000FF00000000000000000000000000000000000000
      0000000000000000FF000000FF000000000000000000000000000000FF000000
      FF000000FF000000FF000000FF000000FF000000000000000000000000000000
      000000000000000000000000000000000000F7F7F7FFDEDEDEFFE8E8E8FFE8E8
      E8FF747576FF42300EFFAC7403FFBA7E02FFBA7E02FFAC7403FF42300EFF7475
      76FFE8E8E8FFE8E8E8FFDEDEDEFFF7F7F7FF36342EFFA7ADAAFF5D615FFF5F63
      61FF878C8AFF181716FF181715FFDBDBDAFFA8A7A5FF262420FF272624FF858A
      88FF545856FF767A78FF868B89FF36342EFF0000FF000000FF00000000000000
      0000000000000000FF000000FF000000FF000000000000000000000000000000
      0000000000000000FF000000FF0000000000000000007F7F7F000000FF000000
      FF0000000000000000000000FF000000FF000000FF0000000000000000000000
      000000000000000000000000000000000000F3F3F3FFD8D8D8FFDEDDDEFFDADA
      DAFF595859FF725312FFC79009FFC58E09FFC58E09FFC79009FF725312FF5958
      59FFDADADAFFDEDDDEFFD8D8D8FFF3F3F3FF36342EFFA7ADAAFF5E6260FF4E52
      50FF8E9290FF3D3F3DFF12110FFF181715FF1C1B18FF1C1A17FF454744FF8589
      87FF515553FF828684FF868B89FF36342EFF0000FF000000FF00000000000000
      000000000000000000000000FF000000FF000000FF0000000000000000000000
      0000000000000000FF000000FF00000000007F7F7F000000FF00000000000000
      00000000000000000000000000000000FF000000FF0000000000000000000000
      000000000000000000000000000000000000F5F4F5FFE0DFE0FFE5E5E5FFE3E3
      E3FF706F70FF715B2EFFD3AB4BFFD4AB44FFD4AB44FFD3AB4BFF715B2EFF706F
      70FFE3E3E3FFE5E5E5FFE0DFE0FFF5F4F5FF36342EFFA7ADAAFF5F6361FF565A
      58FF696C6BFF888D8BFF3D3F3EFF171816FF1A1A18FF424341FF868A88FF666B
      69FF535755FF848886FF878C8AFF36342EFF0000FF000000FF00000000000000
      00000000000000000000000000000000FF000000FF000000FF00000000000000
      0000000000000000FF000000FF00000000000000000000000000000000000000
      00000000000000000000000000000000FF000000FF000000FF00000000000000
      000000000000000000000000000000000000F9F9F9FFE6E6E6FFECECECFFEDED
      EDFFAEAEAEFF5F584CFFA99162FFD8C08BFFD8C08BFFA99162FF5F584CFFAEAE
      AEFFEDEDEDFFECECECFFE6E6E6FFF9F9F9FF36342EFFAEB4B1FFABB1AFFFABB1
      AFFF878B89FF8B8F8DFFA4A7A5FFA3A5A4FFA3A5A3FFA3A4A3FF7A7E7CFF797D
      7BFF9DA3A0FFA0A6A4FFA0A6A4FF36342EFF0000FF000000FF00000000000000
      0000000000000000000000000000000000000000FF000000FF000000FF000000
      0000000000000000FF000000FF00000000000000000000000000000000000000
      0000000000000000000000000000000000000000FF000000FF00000000000000
      000000000000000000000000000000000000FFFFFFFFEAE9EAFFEEEEEEFFECEC
      ECFFE7E7E7FF9B9A9AFF726D65FF867A66FF867A66FF726D65FF9B9A9AFFE7E7
      E7FFECECECFFEEEEEEFFEAE9EAFFFFFFFFFF6B6A65FF36342EFF36342EFF6A6E
      6CFFAAB0ADFF7D817FFF737775FF717573FF707472FF6E7270FF6C706EFF9FA5
      A2FF36342EFF36342EFF36342EFF6B6A65FF000000000000FF000000FF000000
      000000000000000000000000000000000000000000000000FF000000FF000000
      FF00000000000000FF0000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000FF000000FF000000
      000000000000000000000000000000000000FFFFFFFFF5F5F5FFE9E9E9FFF3F3
      F3FFEEEEEEFFEBEBEBFFC8C8C8FFA9A9A9FFA9A9A9FFC8C8C8FFEBEBEBFFEEEE
      EEFFF3F3F3FFE9E9E9FFF5F5F5FFFFFFFFFFFFFFFFFFF2F2F2FF7E7D7AFF5553
      4EFF36342EFF858A88FFFDFDFDFFFDFDFDFFFDFDFDFFFFFFFFFF858A88FF3634
      2EFFB0B0AEFFE9E9E9FFF5F5F5FFFFFFFFFF000000000000FF000000FF000000
      FF000000000000000000000000000000000000000000000000000000FF000000
      FF000000FF000000FF0000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000000000007F7F7F000000
      FF0000000000000000000000000000000000FFFFFFFFFFFFFFFFEEEEEEFFEDED
      EDFFF6F6F6FFF1F1F1FFF1F1F1FFF1F1F1FFF1F1F1FFF1F1F1FFF1F1F1FFF6F6
      F6FFEDEDEDFFEEEEEEFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFE0E0E0FFDDDD
      DDFFB9B9B9FF858A88FFECECECFFEBEBEBFFEBEBEBFFF9F9F9FF858A88FFA8A8
      A5FFD8D8D8FFEEEEEEFFFFFFFFFFFFFFFFFF00000000000000000000FF000000
      FF000000FF000000000000000000000000000000000000000000000000000000
      FF000000FF000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000007F7F
      7F000000FF00000000000000000000000000FFFFFFFFFFFFFFFFFFFFFFFFEFEE
      EFFFEAEAEAFFF5F5F5FFF9F9F9FFF8F8F8FFF8F8F8FFF9F9F9FFF5F5F5FFEAEA
      EAFFEFEEEFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFEFEE
      EFFFEAEAEAFFBCBEBDFF858A88FF858A88FF858A88FF858A88FFB4B7B6FFD9D9
      D9FFEFEEEFFFFFFFFFFFFFFFFFFFFFFFFFFF0000000000000000000000000000
      FF000000FF000000FF000000FF000000FF000000FF000000FF000000FF000000
      FF00000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000FF000000FF0000000000FFFFFF00FFFFFFFFFFFFFFFFFFFF
      FFFFF6F6F6FFE9E9E9FFE6E6E7FFE8E8E8FFE8E8E8FFE6E6E7FFE9E9E9FFF6F6
      F6FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFF6F6F6FFE9E9E9FFE6E6E7FFE8E8E8FFE8E8E8FFE6E6E7FFE9E9E9FFF6F6
      F6FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF0000000000000000000000000000
      0000000000000000FF000000FF000000FF000000FF000000FF00000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000424D3E000000000000003E000000
      2800000040000000300000000100010000000000800100000000000000000000
      000000000000000000000000FFFFFF0000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000FFFFE00100000000FCFF800000000000
      F87F800000000000F07F800000000000F03F800000000000E03F800000000000
      C01F800000000000841FAFF0000000001E0F800000000000FE0F800100000000
      FF07E00300000000FF83E00300000000FFC1E00700000000FFE0E00700000000
      FFF8E00700000000FFFFFFFF0000000000000000FFFFFFFF00000000F83FFFFF
      00000000E00FF9FF00000000CFC7F0FF0000000087E3F0FF00000000A3F3E07F
      0000000031F9C07F0000000038F9843F000000003C791E3F000000003E39FE1F
      000000003F19FF1F000000009F8BFF8F000000008FC3FFC700000000C7E7FFE3
      00000000E00FFFF800000000F83FFFFF00000000000000000000000000000000
      000000000000}
  end
  object pmFoto: TPopupMenu
    Left = 720
    Top = 136
    object miExcluir: TMenuItem
      Caption = 'Excluir imagem'
      OnClick = miExcluirClick
    end
  end
  object dsObsGerais: TDataSource
    DataSet = qryObsGerais
    OnStateChange = dsObsGeraisStateChange
    Left = 776
    Top = 256
  end
  object qryObsGerais: TUMZQuery
    Connection = DM.db
    SQL.Strings = (
      'SELECT'
      '   cd_pessoa,'
      '   ds_observacao'
      'FROM'
      '   pessoas'
      'WHERE'
      '   cd_pessoa = :cd_pessoa')
    Params = <
      item
        DataType = ftUnknown
        Name = 'cd_pessoa'
        ParamType = ptUnknown
      end>
    Left = 808
    Top = 256
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'cd_pessoa'
        ParamType = ptUnknown
      end>
    object qryObsGeraiscd_pessoa: TIntegerField
      FieldName = 'cd_pessoa'
      Required = True
    end
    object qryObsGeraisds_observacao: TMemoField
      FieldName = 'ds_observacao'
      BlobType = ftMemo
    end
  end
  object DelphiTwain1: TDelphiTwain
    OnAcquireCancel = DelphiTwain1AcquireCancel
    OnTwainAcquire = DelphiTwain1TwainAcquire
    OnAcquireError = DelphiTwain1AcquireError
    TransferMode = ttmMemory
    SourceCount = 0
    Info.MajorVersion = 1
    Info.MinorVersion = 0
    Info.Language = tlUserLocale
    Info.CountryCode = 1
    Info.Groups = [tgControl, tgImage]
    Info.VersionInfo = 'Application name'
    Info.Manufacturer = 'Application manufacturer'
    Info.ProductFamily = 'App product family'
    Info.ProductName = 'App product name'
    LibraryLoaded = False
    SourceManagerLoaded = False
    Left = 830
    Top = 92
  end
  object qyPais: TUMZQuery
    Connection = DM.db
    AfterOpen = tblPessoaAfterOpen
    AfterInsert = tblPessoaAfterInsert
    BeforePost = tblPessoaBeforePost
    AfterPost = tblPessoaAfterPost
    AfterCancel = tblPessoaAfterCancel
    BeforeDelete = tblPessoaBeforeDelete
    OnNewRecord = tblPessoaNewRecord
    SQL.Strings = (
      'select distinct(ds_nacionalidade) '
      'from paises '
      'WHERE ds_nacionalidade IS NOT NULL'
      'order by ds_nacionalidade')
    Params = <>
    Left = 683
    Top = 27
    object qyPaisds_nacionalidade: TStringField
      FieldName = 'ds_nacionalidade'
      Size = 100
    end
  end
  object qryNacionalidade: TUMZQuery
    Connection = DM.db
    SQL.Strings = (
      'SELECT DISTINCT(ds_nacionalidade), cd_pais'
      'FROM paises '
      'GROUP BY ds_nacionalidade')
    Params = <>
    Left = 800
    Top = 128
  end
  object qyVinculosExterno: TUMZQuery
    Connection = DM.db
    AfterOpen = qyVinculosExternoAfterOpen
    SQL.Strings = (
      'SELECT'
      '  nie.cd_sistema,'
      '  nie.ds_sistema,'
      '  pie.cd_pessoa_externa,'
      '  :cd_pessoa AS cd_pessoa'
      'FROM'
      '  nu_integracao_externa nie'
      '  INNER JOIN pessoas_integracao_externa pie ON ('
      '    pie.cd_sistema = nie.cd_sistema AND'
      '    pie.cd_pessoa = :cd_pessoa'
      '  )')
    Params = <
      item
        DataType = ftUnknown
        Name = 'cd_pessoa'
        ParamType = ptUnknown
      end>
    DataSource = dsPessoa
    Left = 680
    Top = 416
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'cd_pessoa'
        ParamType = ptUnknown
      end>
    object qyVinculosExternocd_sistema: TSmallintField
      FieldName = 'cd_sistema'
      Required = True
    end
    object qyVinculosExternods_sistema: TStringField
      FieldName = 'ds_sistema'
      Required = True
      Size = 150
    end
    object qyVinculosExternocd_pessoa_externa: TIntegerField
      FieldName = 'cd_pessoa_externa'
      Required = True
    end
    object qyVinculosExternocd_pessoa: TLargeintField
      FieldName = 'cd_pessoa'
      ReadOnly = True
    end
  end
  object dsVinculoExterno: TDataSource
    DataSet = qyVinculosExterno
    OnDataChange = dsVinculoExternoDataChange
    Left = 712
    Top = 416
  end
end
