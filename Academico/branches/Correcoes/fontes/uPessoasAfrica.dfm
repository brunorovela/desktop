object fPessoasAfrica: TfPessoasAfrica
  Left = 185
  Top = 123
  Caption = 'Cadastro de Pessoas'
  ClientHeight = 579
  ClientWidth = 995
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
  object SpeedButton2: TSpeedButton
    Left = 672
    Top = 40
    Width = 23
    Height = 22
  end
  object Panel3: TPanel
    Left = 0
    Top = 0
    Width = 995
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
    TabOrder = 0
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
      OnDblClick = DBText2Click
    end
    object LMensagemDesativacaoUnimestre: TLabel
      Left = 602
      Top = 0
      Width = 96
      Height = 19
      Caption = '                        '
    end
  end
  object toolPessoa: TToolBar
    Left = 0
    Top = 554
    Width = 995
    Height = 25
    Align = alBottom
    ButtonWidth = 139
    Caption = 'toolPessoa'
    EdgeBorders = [ebTop, ebBottom]
    Images = ImageList1
    List = True
    ShowCaptions = True
    TabOrder = 1
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
    end
    object btBuscar_Pessoa: TToolButton
      Left = 610
      Top = 0
      AutoSize = True
      Caption = 'F8 Buscar'
      ImageIndex = 5
      OnClick = btBuscar_PessoaClick
    end
    object ToolButton11: TToolButton
      Left = 689
      Top = 0
      Width = 8
      Caption = 'ToolButton11'
      ImageIndex = 7
      Style = tbsSeparator
    end
    object btFechar_Pessoa: TToolButton
      Left = 697
      Top = 0
      AutoSize = True
      Caption = 'F12 Fechar'
      ImageIndex = 7
      OnClick = btFechar_PessoaClick
    end
    object ToolButton2: TToolButton
      Left = 782
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
    Width = 995
    Height = 529
    ActivePage = tsDadosPessoais
    Align = alClient
    Style = tsFlatButtons
    TabOrder = 2
    OnChange = pgPessoaChange
    OnChanging = pgPessoaChanging
    object tsDadosPessoais: TTabSheet
      Caption = 'DADOS PESSOAIS'
      object Label1: TLabel
        Left = 670
        Top = 152
        Width = 31
        Height = 13
        Caption = 'Nome:'
        FocusControl = dbNome
      end
      object Label2: TLabel
        Left = 561
        Top = 0
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
        Left = 340
        Top = 40
        Width = 63
        Height = 13
        Caption = 'Distrito Nasc.'
        Transparent = True
      end
      object Label5: TLabel
        Left = 337
        Top = 0
        Width = 24
        Height = 13
        Caption = 'Sexo'
      end
      object Label7: TLabel
        Left = 6
        Top = 80
        Width = 65
        Height = 13
        Caption = 'C'#243'digo Postal'
        FocusControl = dblcCep
      end
      object Label8: TLabel
        Left = 339
        Top = 80
        Width = 32
        Height = 13
        Caption = 'Distrito'
      end
      object Label9: TLabel
        Left = 118
        Top = 120
        Width = 36
        Height = 13
        Caption = 'Morada'
        FocusControl = dbEndereco
      end
      object Label10: TLabel
        Left = 471
        Top = 120
        Width = 64
        Height = 13
        Caption = 'Complemento'
        FocusControl = dbComplemento
      end
      object Label11: TLabel
        Left = 498
        Top = 80
        Width = 52
        Height = 13
        Caption = 'Localidade'
      end
      object Label14: TLabel
        Left = 422
        Top = 0
        Width = 55
        Height = 13
        Caption = 'Estado Civil'
      end
      object Label28: TLabel
        Left = 504
        Top = 184
        Width = 50
        Height = 13
        Caption = 'Local Exp.'
      end
      object Label29: TLabel
        Left = 384
        Top = 184
        Width = 50
        Height = 13
        Caption = 'Local Exp.'
      end
      object Label32: TLabel
        Left = 0
        Top = 200
        Width = 79
        Height = 13
        Caption = 'Tipo Documento'
      end
      object Label35: TLabel
        Left = 6
        Top = 272
        Width = 61
        Height = 13
        Caption = 'Nome do Pai'
        FocusControl = dbPai
      end
      object Label36: TLabel
        Left = 6
        Top = 312
        Width = 67
        Height = 13
        Caption = 'Nome da M'#227'e'
        FocusControl = dbMae
      end
      object Label37: TLabel
        Left = 6
        Top = 232
        Width = 85
        Height = 13
        Caption = 'Nome do Conjuge'
        FocusControl = dbConjuge
      end
      object Label38: TLabel
        Left = 400
        Top = 120
        Width = 37
        Height = 13
        Caption = 'N'#250'mero'
        FocusControl = DBEdit2
      end
      object Label41: TLabel
        Left = 6
        Top = 40
        Width = 53
        Height = 13
        Caption = 'Pa'#237's Nasc.'
      end
      object Label42: TLabel
        Left = 231
        Top = 40
        Width = 75
        Height = 13
        Caption = 'Provincia Nasc.'
        FocusControl = dblcProvinciaNasc
      end
      object Label4: TLabel
        Left = 231
        Top = 80
        Width = 44
        Height = 13
        Caption = 'Provincia'
        FocusControl = dblcProvincia
      end
      object lbTipoLogradouro: TLabel
        Left = 6
        Top = 120
        Width = 60
        Height = 13
        Caption = 'Tipo Morada'
        FocusControl = dbEndereco
      end
      object Label13: TLabel
        Left = 108
        Top = 80
        Width = 22
        Height = 13
        Caption = 'Pa'#237's'
      end
      object Label6: TLabel
        Left = 497
        Top = 40
        Width = 52
        Height = 13
        Caption = 'Localidade'
      end
      object lbNacionalidade: TLabel
        Left = 123
        Top = 40
        Width = 68
        Height = 13
        Caption = 'Nacionalidade'
      end
      object Label90: TLabel
        Left = 6
        Top = -1
        Width = 31
        Height = 13
        Caption = 'Nome '
        FocusControl = dbNome
      end
      object dblcCidadeAtual: TDBLookupComboBox
        Left = 341
        Top = 96
        Width = 151
        Height = 21
        DataField = 'descDistrito'
        DataSource = dsPessoa
        TabOrder = 12
        OnKeyPress = dbNomeKeyPress
      end
      object dblcCidadeNascimento: TDBLookupComboBox
        Left = 340
        Top = 56
        Width = 151
        Height = 21
        DataField = 'descDistritoNasc'
        DataSource = dsPessoa
        TabOrder = 7
        OnKeyPress = dbNomeKeyPress
      end
      object dbNome: TDBEdit
        Left = 6
        Top = 16
        Width = 326
        Height = 21
        DataField = 'nm_pessoa'
        DataSource = dsPessoa
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
        TabOrder = 0
        OnExit = dbNomeExit
        OnKeyPress = dbNomeKeyPress
      end
      object dbNasc: TDBEdit
        Left = 561
        Top = 16
        Width = 91
        Height = 21
        DataField = 'dt_nascimento'
        DataSource = dsPessoa
        TabOrder = 3
        OnKeyPress = dbNomeKeyPress
      end
      object dbSexo: TDBComboBox
        Left = 337
        Top = 16
        Width = 81
        Height = 22
        Style = csOwnerDrawFixed
        DataField = 'ds_sexo'
        DataSource = dsPessoa
        ItemHeight = 16
        Items.Strings = (
          'Masculino'
          'Feminino')
        TabOrder = 1
        OnKeyPress = dbNomeKeyPress
      end
      object dblcCep: TDBEdit
        Left = 6
        Top = 96
        Width = 96
        Height = 21
        DataField = 'ds_cep'
        DataSource = dsPessoa
        TabOrder = 9
        OnKeyPress = dbNomeKeyPress
      end
      object dbEndereco: TDBEdit
        Left = 118
        Top = 136
        Width = 276
        Height = 21
        DataField = 'ds_logradouro'
        DataSource = dsPessoa
        TabOrder = 15
        OnKeyPress = dbNomeKeyPress
      end
      object dbComplemento: TDBEdit
        Left = 472
        Top = 136
        Width = 181
        Height = 21
        DataField = 'ds_complemento'
        DataSource = dsPessoa
        TabOrder = 17
        OnKeyPress = dbComplementoKeyPress
      end
      object pcDocumentos: TPageControl
        Left = 0
        Top = 163
        Width = 761
        Height = 68
        ActivePage = TabSheet2
        MultiLine = True
        Style = tsFlatButtons
        TabOrder = 18
        object TabSheet2: TTabSheet
          Caption = 'Documenta'#231#227'o'
          object Label15: TLabel
            Left = 1
            Top = 0
            Width = 70
            Height = 13
            Caption = 'N. Contribuinte'
            FocusControl = dbCpf
          end
          object Label16: TLabel
            Left = 145
            Top = 0
            Width = 100
            Height = 13
            Caption = 'Bilhete de Identidade'
            FocusControl = dbIdentidade
          end
          object Label12: TLabel
            Left = 413
            Top = 0
            Width = 80
            Height = 13
            Caption = 'Data de Emiss'#227'o'
            FocusControl = DBEdit4
          end
          object sbMaisInformacoes: TSpeedButton
            Left = 600
            Top = 8
            Width = 145
            Height = 25
            Caption = 'F10   Mais Informa'#231#245'es >>'
            Flat = True
            NumGlyphs = 2
            OnClick = sbMaisInformacoesClick
          end
          object Label92: TLabel
            Left = 283
            Top = 0
            Width = 110
            Height = 13
            Caption = 'Sector de Identifica'#231#227'o'
          end
          object lbExpiracao: TLabel
            Left = 508
            Top = 0
            Width = 88
            Height = 13
            Caption = 'Data de Expira'#231#227'o'
            FocusControl = dbedExpiracao
          end
          object dbCpf: TDBEdit
            Left = 1
            Top = 16
            Width = 136
            Height = 21
            CharCase = ecUpperCase
            DataField = 'ds_cpf'
            DataSource = dsPessoa
            TabOrder = 0
            OnKeyPress = dbNomeKeyPress
          end
          object dbIdentidade: TDBEdit
            Left = 146
            Top = 16
            Width = 128
            Height = 21
            CharCase = ecUpperCase
            DataField = 'ds_identidade'
            DataSource = dsPessoa
            TabOrder = 1
            OnKeyPress = dbNomeKeyPress
          end
          object DBEdit4: TDBEdit
            Left = 413
            Top = 16
            Width = 89
            Height = 21
            DataField = 'dt_identidade_expedicao'
            DataSource = dsPessoa
            TabOrder = 3
            OnKeyPress = dbNomeKeyPress
          end
          object dbedSector: TDBEdit
            Left = 283
            Top = 16
            Width = 121
            Height = 21
            DataField = 'ds_identidade_orgao_exp'
            DataSource = dsPessoa
            TabOrder = 2
          end
          object dbedExpiracao: TDBEdit
            Left = 508
            Top = 16
            Width = 89
            Height = 21
            DataField = 'dt_identidade_expiracao'
            DataSource = dsPessoa
            TabOrder = 4
            OnKeyPress = dbNomeKeyPress
          end
        end
      end
      object dbPai: TDBEdit
        Left = 6
        Top = 288
        Width = 363
        Height = 21
        DataField = 'nm_pai'
        DataSource = dsPessoa
        TabOrder = 20
        OnKeyPress = dbNomeKeyPress
      end
      object dbMae: TDBEdit
        Left = 6
        Top = 328
        Width = 363
        Height = 21
        DataField = 'nm_mae'
        DataSource = dsPessoa
        TabOrder = 21
        OnKeyPress = dbNomeKeyPress
      end
      object dbConjuge: TDBEdit
        Left = 6
        Top = 248
        Width = 363
        Height = 21
        DataField = 'nm_conjuge'
        DataSource = dsPessoa
        TabOrder = 19
        OnKeyPress = dbNomeKeyPress
      end
      object DBEdit2: TDBEdit
        Left = 400
        Top = 136
        Width = 65
        Height = 21
        DataField = 'ds_logradouro_nro'
        DataSource = dsPessoa
        TabOrder = 16
        OnKeyPress = dbNomeKeyPress
      end
      object dblcProvinciaNasc: TDBLookupComboBox
        Left = 230
        Top = 56
        Width = 106
        Height = 21
        DataField = 'descProvinciaNasc'
        DataSource = dsPessoa
        TabOrder = 6
        OnKeyPress = dbNomeKeyPress
      end
      object dblcProvincia: TDBLookupComboBox
        Left = 230
        Top = 96
        Width = 106
        Height = 21
        DataField = 'descProvincia'
        DataSource = dsPessoa
        DropDownWidth = 150
        TabOrder = 11
        OnKeyPress = dbNomeKeyPress
      end
      object dbEstadoCivil: TDBLookupComboBox
        Left = 422
        Top = 16
        Width = 135
        Height = 21
        DataField = 'descEstadoCivil'
        DataSource = dsPessoa
        TabOrder = 2
        OnKeyPress = dbNomeKeyPress
      end
      object dbTipoLogradouro: TDBLookupComboBox
        Left = 6
        Top = 136
        Width = 105
        Height = 21
        DataField = 'desLogradouro'
        DataSource = dsPessoa
        DropDownWidth = 150
        TabOrder = 14
        OnKeyPress = dbNomeKeyPress
      end
      object sbPaisCombo: TDBLookupComboBox
        Left = 6
        Top = 56
        Width = 113
        Height = 21
        DataField = 'descPais'
        DataSource = dsPessoa
        DropDownWidth = 150
        PopupMenu = pmContatos
        TabOrder = 4
        OnExit = sbPaisComboExit
        OnKeyPress = dbNomeKeyPress
      end
      object dblcLocalidade2: TDBLookupComboBox
        Left = 497
        Top = 96
        Width = 155
        Height = 21
        DataField = 'descLocalidade'
        DataSource = dsPessoa
        TabOrder = 13
        OnKeyPress = dbNomeKeyPress
      end
      object dblcPaisAtual: TDBLookupComboBox
        Left = 108
        Top = 96
        Width = 116
        Height = 21
        DataField = 'descPaisAtual'
        DataSource = dsPessoa
        DropDownWidth = 150
        TabOrder = 10
        OnKeyPress = dbNomeKeyPress
      end
      object dblcLocalidade: TDBLookupComboBox
        Left = 497
        Top = 56
        Width = 155
        Height = 21
        DataField = 'descLocalidadeNasc'
        DataSource = dsPessoa
        TabOrder = 8
        OnKeyPress = dbNomeKeyPress
      end
      object ToolBar1: TToolBar
        Left = 664
        Top = 152
        Width = 115
        Height = 22
        Align = alNone
        Caption = 'ToolBar1'
        Images = imgListFoto
        TabOrder = 23
        object btnConectar: TToolButton
          Left = 0
          Top = 0
          Hint = 'Webcam'
          Caption = 'btnConectar'
          ImageIndex = 0
          ParentShowHint = False
          ShowHint = True
          Visible = False
          OnClick = btnConectarClick
        end
        object btnCapturar: TToolButton
          Left = 23
          Top = 0
          Hint = 'Capturar'
          Caption = 'btnCapturar'
          ImageIndex = 1
          Visible = False
          OnClick = btnCapturarClick
        end
        object btnAplicar: TToolButton
          Left = 46
          Top = 0
          Hint = 'Aplicar'
          Caption = 'btnAplicar'
          ImageIndex = 3
          Visible = False
          OnClick = btnAplicarClick
        end
        object btnCancelar: TToolButton
          Left = 69
          Top = 0
          Hint = 'Cancelar'
          Caption = 'btnCancelar'
          ImageIndex = 2
          Visible = False
          OnClick = btnCancelarClick
        end
        object btnDigitalizar: TToolButton
          Left = 92
          Top = 0
          Hint = 'Digitalizar'
          Caption = 'btnDigitalizar'
          ImageIndex = 5
          ParentShowHint = False
          ShowHint = True
          Visible = False
          OnClick = btnDigitalizarClick
        end
      end
      object Panel1: TPanel
        Left = 667
        Top = 24
        Width = 107
        Height = 122
        TabOrder = 24
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
          DragCursor = crHourGlass
          ParentShowHint = False
          PopupMenu = pmFoto
          ShowHint = True
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
      object cbNacionalidade: TUMComboBox
        Left = 124
        Top = 56
        Width = 99
        Height = 21
        Style = csDropDownList
        ItemHeight = 13
        TabOrder = 5
        OnExit = cbNacionalidadeExit
        OnKeyDown = cbNacionalidadeKeyDown
        TamanhoMaximo = 0
      end
      object gradeContato: TDBGrid
        Left = 396
        Top = 237
        Width = 377
        Height = 118
        BorderStyle = bsNone
        DataSource = dsContatoPessoa
        Options = [dgEditing, dgTitles, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgConfirmDelete, dgCancelOnExit]
        PopupMenu = pmContatos
        TabOrder = 22
        TitleFont.Charset = DEFAULT_CHARSET
        TitleFont.Color = clWindowText
        TitleFont.Height = -11
        TitleFont.Name = 'MS Sans Serif'
        TitleFont.Style = []
        OnDrawColumnCell = gradeContatoDrawColumnCell
        OnEnter = gradeContatoEnter
        OnKeyDown = gradeContatoKeyDown
        Columns = <
          item
            Expanded = False
            FieldName = 'desContato'
            Title.Caption = 'Tipo Contato'
            Width = 105
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'ds_contato_formatado'
            Title.Caption = 'Descri'#231#227'o do Contato'
            Width = 163
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'ds_observacao'
            Title.Caption = 'Observa'#231#227'o'
            Width = 163
            Visible = True
          end>
      end
      object medCampoContato: TMaskEdit
        Left = 472
        Top = 267
        Width = 121
        Height = 21
        BorderStyle = bsNone
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
        TabOrder = 25
        Text = 'Campo contato'
        Visible = False
        OnEnter = medCampoContatoEnter
        OnExit = medCampoContatoExit
        OnKeyDown = medCampoContatoKeyDown
      end
    end
    object tsComplementares: TTabSheet
      Caption = 'COMPLEMENTARES'
      ImageIndex = 1
      object dbObs: TDBMemo
        Left = 0
        Top = 225
        Width = 987
        Height = 180
        Align = alClient
        DataField = 'ds_observacao'
        DataSource = dsPessoa
        ScrollBars = ssVertical
        TabOrder = 1
      end
      object Panel2: TPanel
        Left = 0
        Top = 0
        Width = 987
        Height = 201
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
          Left = 457
          Top = 6
          Width = 72
          Height = 13
          Caption = 'Cargo/Fun'#231#227'o:'
          FocusControl = DBEdit1
        end
        object SpeedButton1: TSpeedButton
          Left = 419
          Top = 22
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
          Left = 458
          Top = 48
          Width = 94
          Height = 13
          Caption = 'Arquivo Documento'
          FocusControl = DBEdit13
        end
        object Bevel2: TBevel
          Left = 0
          Top = 135
          Width = 761
          Height = 3
          Shape = bsBottomLine
        end
        object Label33: TLabel
          Left = 3
          Top = 79
          Width = 26
          Height = 13
          Caption = 'Login'
        end
        object Label108: TLabel
          Left = 141
          Top = 79
          Width = 159
          Height = 13
          Caption = 'Senha (digite apenas para alterar)'
        end
        object Label109: TLabel
          Left = 310
          Top = 79
          Width = 83
          Height = 13
          Caption = 'Re-digite a senha'
        end
        object lbFormaConheceuInst: TLabel
          Left = 3
          Top = 144
          Width = 191
          Height = 13
          Caption = 'Forma que ficou sabendo da institui'#231#227'o: '
        end
        object lbInformeFicouSabendo: TLabel
          Left = 242
          Top = 144
          Width = 137
          Height = 13
          Caption = 'Informe como ficou sabendo:'
          Visible = False
        end
        object DBEdit1: TDBEdit
          Left = 456
          Top = 22
          Width = 310
          Height = 21
          DataField = 'ds_cargo'
          DataSource = dsPessoa
          TabOrder = 1
        end
        object DBLookupComboBox1: TDBLookupComboBox
          Left = 2
          Top = 22
          Width = 415
          Height = 21
          DataField = 'descEmpresa'
          DataSource = dsPessoa
          TabOrder = 0
        end
        object DBEdit13: TDBEdit
          Left = 456
          Top = 64
          Width = 310
          Height = 21
          DataField = 'ds_arquivo_documento'
          DataSource = dsPessoa
          TabOrder = 3
        end
        object DBCheckBox1: TDBCheckBox
          Left = 3
          Top = 56
          Width = 281
          Height = 17
          Caption = 'Imprimir Bloqueto em nome da Empresa Selecionada.'
          DataField = 'sn_bloqueto_empresa'
          DataSource = dsPessoa
          TabOrder = 2
          ValueChecked = 'S'
          ValueUnchecked = 'N'
        end
        object edLogin: TEdit
          Left = 3
          Top = 99
          Width = 131
          Height = 21
          TabOrder = 4
          OnKeyPress = edLoginKeyPress
        end
        object edSenha1: TEdit
          Left = 141
          Top = 99
          Width = 163
          Height = 21
          PasswordChar = '*'
          TabOrder = 5
          OnKeyPress = edSenha1KeyPress
        end
        object edSenha2: TEdit
          Left = 310
          Top = 98
          Width = 163
          Height = 21
          PasswordChar = '*'
          TabOrder = 6
          OnKeyPress = edSenha2KeyPress
        end
        object btnNecessidaEspecial: TButton
          Left = 479
          Top = 91
          Width = 121
          Height = 28
          Caption = 'Necessidade Especial'
          TabOrder = 7
          OnClick = btnNecessidaEspecialClick
        end
        object cbFormaConhece: TComboBox
          Left = 2
          Top = 163
          Width = 230
          Height = 21
          ItemHeight = 13
          TabOrder = 8
          OnChange = cbFormaConheceChange
        end
        object edFormaConheceuOutro: TEdit
          Left = 242
          Top = 163
          Width = 238
          Height = 21
          TabOrder = 9
          Visible = False
        end
        object btnLiberarAcesso: TButton
          Left = 606
          Top = 91
          Width = 127
          Height = 28
          Caption = 'Liberar acesso on-line'
          TabOrder = 10
          OnClick = btnLiberarAcessoClick
        end
        object btnBloquearOnline: TButton
          Left = 606
          Top = 91
          Width = 127
          Height = 28
          Caption = 'Bloquear acesso on-line'
          TabOrder = 11
          OnClick = btnBloquearOnlineClick
        end
      end
      object Panel4: TPanel
        Left = 0
        Top = 201
        Width = 987
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
        TabOrder = 4
      end
      object gradeVinculosExterno: TDBGrid
        Left = 0
        Top = 429
        Width = 987
        Height = 69
        Align = alBottom
        DataSource = dsVinculoExterno
        TabOrder = 3
        TitleFont.Charset = DEFAULT_CHARSET
        TitleFont.Color = clWindowText
        TitleFont.Height = -11
        TitleFont.Name = 'MS Sans Serif'
        TitleFont.Style = []
        OnKeyDown = gradeVinculosExternoKeyDown
        Columns = <
          item
            Expanded = False
            FieldName = 'ds_sistema'
            Title.Caption = 'Sistema Externo'
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'cd_pessoa_externa'
            Title.Caption = 'C'#243'digo identificador externo da Pessoa'
            Width = 288
            Visible = True
          end>
      end
      object lbVinculoExterno: TPanel
        Left = 0
        Top = 405
        Width = 987
        Height = 24
        Align = alBottom
        Caption = 'CADASTRO DE V'#205'NCULO EXTERNO (OUTROS SISTEMAS)'
        Color = clBlue
        Font.Charset = ANSI_CHARSET
        Font.Color = clWhite
        Font.Height = -11
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        ParentFont = False
        TabOrder = 2
        object BitBtn1: TBitBtn
          Left = 917
          Top = 1
          Width = 23
          Height = 22
          Hint = 'Alterar Observa'#231#245'es Gerais'
          Align = alRight
          TabOrder = 0
          Visible = False
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
        object BitBtn2: TBitBtn
          Left = 940
          Top = 1
          Width = 23
          Height = 22
          Hint = 'Salvar Observa'#231#245'es Gerais'
          Align = alRight
          TabOrder = 1
          Visible = False
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
        object BitBtn3: TBitBtn
          Left = 963
          Top = 1
          Width = 23
          Height = 22
          Hint = 'Cancelar Observa'#231#245'es Gerais'
          Align = alRight
          TabOrder = 2
          Visible = False
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
    end
    object tsParentes: TTabSheet
      Caption = 'OUTRAS PESSOAS'
      ImageIndex = 2
      inline frParentes1: TfrParentes
        Left = 0
        Top = 0
        Width = 987
        Height = 498
        Align = alClient
        TabOrder = 0
        TabStop = True
        ExplicitWidth = 987
        ExplicitHeight = 498
        inherited Bevel1: TBevel
          Height = 402
          ExplicitHeight = 293
        end
        inherited Bevel2: TBevel
          Left = 969
          Height = 402
          ExplicitLeft = 765
          ExplicitHeight = 293
        end
        inherited Bevel3: TBevel
          Top = 484
          Width = 987
          ExplicitTop = 358
          ExplicitWidth = 783
        end
        inherited Bevel4: TBevel
          Top = 491
          Width = 987
          ExplicitTop = 359
          ExplicitWidth = 783
        end
        inherited DBGrid1: TDBGrid
          Width = 951
          Height = 402
          TitleFont.Name = 'MS Sans Serif'
        end
        inherited Panel1: TPanel
          Width = 987
          ExplicitLeft = 0
          ExplicitTop = 0
          ExplicitWidth = 987
          inherited Buscar: TBitBtn
            OnClick = frParentes1BuscarClick
          end
        end
        inherited toolPessoa: TToolBar
          Top = 459
          Width = 987
          ExplicitTop = 459
          ExplicitWidth = 987
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
          inherited btnFechar: TToolButton
            Left = 291
            OnClick = btFechar_PessoaClick
            ExplicitLeft = 291
          end
          inherited ToolButton2: TToolButton
            Left = 372
            ExplicitLeft = 372
          end
          inherited ToolButton4: TToolButton
            Left = 380
            ExplicitLeft = 380
          end
        end
      end
    end
  end
  object ImageList1: TImageList
    Left = 560
    Top = 384
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
    Left = 851
    Top = 43
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
      FixedChar = True
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
      FixedChar = True
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
      DisplayWidth = 20
      FieldName = 'ds_cpf'
      Origin = 'WMESTRE12.pessoas.ds_cpf'
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
    object tblPessoads_identidade_orgao_exp: TStringField
      FieldName = 'ds_identidade_orgao_exp'
      Origin = 'WMESTRE12.pessoas.ds_identidade_orgao_exp'
      Size = 10
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
    object tblPessoasn_bloqueto_empresa: TStringField
      FieldName = 'sn_bloqueto_empresa'
      Origin = 'WMESTRE12.pessoas.sn_bloqueto_empresa'
      FixedChar = True
      Size = 1
    end
    object tblPessoaim_pessoa: TBlobField
      FieldName = 'im_pessoa'
      Origin = 'WMESTRE12.pessoas.im_pessoa'
    end
    object tblPessoads_login: TStringField
      FieldName = 'ds_login'
      Origin = 'WMESTRE12.pessoas.ds_login'
      Size = 25
    end
    object tblPessoatp_cert: TSmallintField
      DisplayLabel = 'Tipo de Certid'#227'o'
      FieldName = 'tp_cert'
      Origin = 'WMESTRE12.pessoas.tp_cert'
      OnGetText = tblPessoatp_certGetText
      OnSetText = tblPessoatp_certSetText
    end
    object tblPessoads_cert_folha: TStringField
      DisplayLabel = 'Folha'
      FieldName = 'ds_cert_folha'
      Origin = 'WMESTRE12.pessoas.ds_cert_folha'
      Size = 4
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
    object tblPessoadescPais: TStringField
      FieldKind = fkLookup
      FieldName = 'descPais'
      LookupDataSet = tblPais
      LookupKeyFields = 'cd_pais'
      LookupResultField = 'ds_pais'
      KeyFields = 'cd_pais_nascimento'
      Size = 40
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
    object tblPessoadescProvinciaNasc: TStringField
      FieldKind = fkLookup
      FieldName = 'descProvinciaNasc'
      LookupDataSet = qyProvincias
      LookupKeyFields = 'cd_provincia'
      LookupResultField = 'ds_provincia'
      KeyFields = 'cd_estado_nascimento'
      Size = 50
      Lookup = True
    end
    object tblPessoadescDistritoNasc: TStringField
      FieldKind = fkLookup
      FieldName = 'descDistritoNasc'
      LookupDataSet = qyDistritos
      LookupKeyFields = 'cd_distrito'
      LookupResultField = 'ds_distrito'
      KeyFields = 'cd_municipio_nasc'
      Size = 50
      Lookup = True
    end
    object tblPessoadescProvincia: TStringField
      FieldKind = fkLookup
      FieldName = 'descProvincia'
      LookupDataSet = qyProvincias
      LookupKeyFields = 'cd_provincia'
      LookupResultField = 'ds_provincia'
      KeyFields = 'cd_estado'
      Size = 50
      Lookup = True
    end
    object tblPessoadescDistrito: TStringField
      FieldKind = fkLookup
      FieldName = 'descDistrito'
      LookupDataSet = qyDistritos
      LookupKeyFields = 'cd_distrito'
      LookupResultField = 'ds_distrito'
      KeyFields = 'cd_municipio'
      Size = 50
      Lookup = True
    end
    object tblPessoadescLocalidade: TStringField
      FieldKind = fkLookup
      FieldName = 'descLocalidade'
      LookupDataSet = qyLocalidades
      LookupKeyFields = 'cd_localidade'
      LookupResultField = 'ds_localidade'
      KeyFields = 'cd_localidade'
      Size = 50
      Lookup = True
    end
    object tblPessoadescPaisAtual: TStringField
      FieldKind = fkLookup
      FieldName = 'descPaisAtual'
      LookupDataSet = tblPaisAtual
      LookupKeyFields = 'cd_pais'
      LookupResultField = 'ds_pais'
      KeyFields = 'cd_pais'
      Size = 50
      Lookup = True
    end
    object tblPessoadescLocalidadeNasc: TStringField
      FieldKind = fkLookup
      FieldName = 'descLocalidadeNasc'
      LookupDataSet = qyLocalidades
      LookupKeyFields = 'cd_localidade'
      LookupResultField = 'ds_localidade'
      KeyFields = 'cd_localidade_nasc'
      Size = 50
      Lookup = True
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
    object tblPessoacd_orgao_emissor: TLargeintField
      FieldName = 'cd_orgao_emissor'
    end
    object tblPessoacd_municipio_nasc: TLargeintField
      FieldName = 'cd_municipio_nasc'
    end
    object tblPessoacd_estado_nascimento: TSmallintField
      FieldName = 'cd_estado_nascimento'
    end
    object tblPessoacd_pais_nascimento: TLargeintField
      FieldName = 'cd_pais_nascimento'
    end
    object tblPessoacd_estado: TLargeintField
      FieldName = 'cd_estado'
    end
    object tblPessoacd_localidade: TIntegerField
      FieldName = 'cd_localidade'
    end
    object tblPessoanr_praca: TLargeintField
      FieldName = 'nr_praca'
    end
    object tblPessoacd_localidade_nasc: TIntegerField
      FieldName = 'cd_localidade_nasc'
    end
    object tblPessoanr_cert_termo: TStringField
      DisplayLabel = 'N'#250'mero do Termo'
      FieldName = 'nr_cert_termo'
      Size = 50
    end
    object tblPessoasn_foto: TStringField
      FieldName = 'sn_foto'
      Size = 1
    end
    object tblPessoadt_identidade_expiracao: TDateTimeField
      FieldName = 'dt_identidade_expiracao'
      DisplayFormat = 'dd/mm/yyyy'
      EditMask = '!99/99/9999;1;_'
    end
    object tblPessoads_forma_conheceu: TStringField
      FieldName = 'ds_forma_conheceu'
    end
    object tblPessoasn_bloqueado: TSmallintField
      FieldName = 'sn_bloqueado'
    end
  end
  object dsPessoa: TDataSource
    DataSet = tblPessoa
    OnStateChange = dsPessoaStateChange
    OnDataChange = dsPessoaDataChange
    Left = 891
    Top = 44
  end
  object dsContatoPessoa: TDataSource
    DataSet = tblContatoPessoa
    OnStateChange = dsContatoPessoaStateChange
    OnDataChange = dsContatoPessoaDataChange
    Left = 449
    Top = 339
  end
  object tblEstadosCivis: TZTable
    Connection = DM.db
    TableName = 'pessoas_estados_civis'
    Left = 560
    Top = 3
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
    Left = 816
    Top = 8
  end
  object tblContatoPessoa: TUMZQuery
    Connection = DM.db
    BeforeScroll = tblContatoPessoaBeforeScroll
    OnCalcFields = tblContatoPessoaCalcFields
    BeforePost = tblContatoPessoaBeforePost
    OnNewRecord = tblContatoPessoaNewRecord
    SQL.Strings = (
      'select * from contatos_pessoas'
      'where cd_pessoa = :cd_pessoa'
      'order by cd_contato')
    Params = <
      item
        DataType = ftInteger
        Name = 'cd_pessoa'
        ParamType = ptUnknown
        Size = 4
      end>
    DataSource = dsPessoa
    Left = 416
    Top = 339
    ParamData = <
      item
        DataType = ftInteger
        Name = 'cd_pessoa'
        ParamType = ptUnknown
        Size = 4
      end>
    object tblContatoPessoacd_pessoa: TIntegerField
      FieldName = 'cd_pessoa'
      Origin = 'WMESTRE12.contatos_pessoas.cd_pessoa'
    end
    object tblContatoPessoacd_contato: TIntegerField
      FieldName = 'cd_contato'
      Origin = 'WMESTRE12.contatos_pessoas.cd_contato'
    end
    object tblContatoPessoads_contato: TStringField
      FieldName = 'ds_contato'
      Origin = 'WMESTRE12.contatos_pessoas.ds_contato'
      Size = 100
    end
    object tblContatoPessoadescContato: TStringField
      FieldKind = fkLookup
      FieldName = 'desContato'
      LookupDataSet = DM.tblContatosTipos
      LookupKeyFields = 'cd_contato'
      LookupResultField = 'ds_contato'
      KeyFields = 'cd_contato'
      Size = 30
      Lookup = True
    end
    object tblContatoPessoads_contato_formatado: TStringField
      FieldKind = fkCalculated
      FieldName = 'ds_contato_formatado'
      Size = 100
      Calculated = True
    end
    object tblContatoPessoads_observacao: TStringField
      FieldName = 'ds_observacao'
      OnChange = tblContatoPessoads_observacaoChange
      Size = 500
    end
  end
  object pmContatos: TPopupMenu
    Left = 708
    Top = 356
    object AdicionarContato1: TMenuItem
      Caption = 'Adicionar Contato'
      OnClick = AdicionarContato1Click
    end
    object ExcluirContato1: TMenuItem
      Caption = 'Excluir Contato'
      OnClick = ExcluirContato1Click
    end
    object N1: TMenuItem
      Caption = '-'
    end
    object Cancelar1: TMenuItem
      Caption = 'Cancelar'
    end
  end
  object tblTpLogradouro: TUMZQuery
    Connection = DM.db
    SQL.Strings = (
      'SELECT * FROM logradouros '
      'ORDER by ds_logradouro')
    Params = <>
    Left = 560
    Top = 32
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
      'WHERE uf = :ds_estado_nascimento'
      'ORDER by ds_municipio')
    Params = <
      item
        DataType = ftUnknown
        Name = 'ds_estado_nascimento'
        ParamType = ptUnknown
      end>
    DataSource = dsPessoa
    Left = 592
    Top = 32
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'ds_estado_nascimento'
        ParamType = ptUnknown
      end>
    object tblMunicipioscd_municipio: TIntegerField
      FieldName = 'cd_municipio'
      Origin = 'WMESTRE12.municipios.cd_municipio'
    end
    object tblMunicipiosds_municipio: TStringField
      FieldName = 'ds_municipio'
      Origin = 'WMESTRE12.municipios.ds_municipio'
      Size = 120
    end
  end
  object tblMunicipioAtual: TUMZQuery
    Connection = DM.db
    SQL.Strings = (
      'SELECT cd_municipio, ds_municipio, nr_praca FROM municipios'
      'WHERE uf = :ds_estado'
      'ORDER by ds_municipio')
    Params = <
      item
        DataType = ftFixedChar
        Name = 'ds_estado'
        ParamType = ptUnknown
        Size = 3
      end>
    DataSource = dsPessoa
    Left = 656
    Top = 32
    ParamData = <
      item
        DataType = ftFixedChar
        Name = 'ds_estado'
        ParamType = ptUnknown
        Size = 3
      end>
    object IntegerField1: TIntegerField
      FieldName = 'cd_municipio'
      Origin = 'WMESTRE12.municipios.cd_municipio'
    end
    object StringField1: TStringField
      FieldName = 'ds_municipio'
      Origin = 'WMESTRE12.municipios.ds_municipio'
      Size = 120
    end
    object tblMunicipioAtualnr_praca: TIntegerField
      FieldName = 'nr_praca'
      Origin = 'WMESTRE12.municipios.nr_praca'
    end
  end
  object tblOrgaos: TZTable
    Connection = DM.db
    TableName = 'orgaos_emissores'
    Left = 688
    Top = 32
  end
  object qyProvincias: TUMZQuery
    Connection = DM.db
    SQL.Strings = (
      'SELECT * FROM provincias '
      'ORDER by ds_provincia')
    Params = <>
    DataSource = dsPessoa
    Left = 560
    Top = 280
    object qyProvinciascd_provincia: TIntegerField
      FieldName = 'cd_provincia'
      Origin = 'WMESTRE12.provincias.cd_provincia'
    end
    object qyProvinciascd_codigo: TIntegerField
      FieldName = 'cd_codigo'
      Origin = 'WMESTRE12.provincias.cd_codigo'
    end
    object qyProvinciasds_provincia: TStringField
      FieldName = 'ds_provincia'
      Origin = 'WMESTRE12.provincias.ds_provincia'
      Size = 50
    end
  end
  object qyDistritos: TUMZQuery
    Connection = DM.db
    SQL.Strings = (
      'SELECT * FROM distritos_afr'
      'WHERE cd_provincia = :cd_provincia'
      'ORDER by ds_distrito')
    Params = <
      item
        DataType = ftInteger
        Name = 'cd_provincia'
        ParamType = ptUnknown
        Size = 4
      end>
    DataSource = dtcProvincias
    Left = 560
    Top = 312
    ParamData = <
      item
        DataType = ftInteger
        Name = 'cd_provincia'
        ParamType = ptUnknown
        Size = 4
      end>
    object qyDistritoscd_distrito: TIntegerField
      FieldName = 'cd_distrito'
      Origin = 'WMESTRE12.distritos_afr.cd_distrito'
    end
    object qyDistritoscd_codigo: TIntegerField
      FieldName = 'cd_codigo'
      Origin = 'WMESTRE12.distritos_afr.cd_codigo'
    end
    object qyDistritoscd_provincia: TIntegerField
      FieldName = 'cd_provincia'
      Origin = 'WMESTRE12.distritos_afr.cd_provincia'
    end
    object qyDistritosds_distrito: TStringField
      FieldName = 'ds_distrito'
      Origin = 'WMESTRE12.distritos_afr.ds_distrito'
      Size = 100
    end
  end
  object qyLocalidades: TUMZQuery
    Connection = DM.db
    SQL.Strings = (
      'SELECT * FROM localidades_afr '
      'WHERE cd_distrito = :cd_distrito'
      'ORDER by ds_localidade')
    Params = <
      item
        DataType = ftInteger
        Name = 'cd_distrito'
        ParamType = ptUnknown
        Size = 4
      end>
    DataSource = dtcDistritos
    Left = 560
    Top = 344
    ParamData = <
      item
        DataType = ftInteger
        Name = 'cd_distrito'
        ParamType = ptUnknown
        Size = 4
      end>
    object qyLocalidadescd_localidade: TIntegerField
      FieldName = 'cd_localidade'
      Origin = 'WMESTRE12.localidades_afr.cd_localidade'
    end
    object qyLocalidadescd_codigo: TStringField
      FieldName = 'cd_codigo'
      Origin = 'WMESTRE12.localidades_afr.cd_codigo'
      Size = 15
    end
    object qyLocalidadesds_bairro: TStringField
      FieldName = 'ds_bairro'
      Origin = 'WMESTRE12.localidades_afr.ds_bairro'
      Size = 50
    end
    object qyLocalidadesds_localidade: TStringField
      FieldName = 'ds_localidade'
      Origin = 'WMESTRE12.localidades_afr.ds_localidade'
      Size = 100
    end
    object qyLocalidadesds_posto: TStringField
      FieldName = 'ds_posto'
      Origin = 'WMESTRE12.localidades_afr.ds_posto'
      Size = 100
    end
    object qyLocalidadescd_distrito: TIntegerField
      FieldName = 'cd_distrito'
      Origin = 'WMESTRE12.localidades_afr.cd_distrito'
    end
    object qyLocalidadescd_provincia: TIntegerField
      FieldName = 'cd_provincia'
      Origin = 'WMESTRE12.localidades_afr.cd_provincia'
    end
  end
  object dtcProvincias: TDataSource
    AutoEdit = False
    DataSet = qyProvincias
    OnStateChange = dsPessoaStateChange
    OnDataChange = dsPessoaDataChange
    Left = 595
    Top = 284
  end
  object dtcDistritos: TDataSource
    AutoEdit = False
    DataSet = qyDistritos
    OnStateChange = dsPessoaStateChange
    OnDataChange = dsPessoaDataChange
    Left = 595
    Top = 316
  end
  object dtcLocalidades: TDataSource
    AutoEdit = False
    DataSet = qyLocalidades
    OnStateChange = dsPessoaStateChange
    OnDataChange = dsPessoaDataChange
    Left = 595
    Top = 356
  end
  object tblPaisAtual: TUMZQuery
    Connection = DM.db
    SQL.Strings = (
      'SELECT * FROM paises ORDER BY ds_pais')
    Params = <>
    Left = 816
    Top = 40
  end
  object tblPais: TUMZQuery
    Connection = DM.db
    SQL.Strings = (
      'SELECT * FROM paises ORDER BY ds_pais')
    Params = <>
    Left = 816
    Top = 72
  end
  object qyTemp1: TUMZQuery
    Connection = DM.db
    Params = <>
    Left = 648
    Top = 208
  end
  object qyTemp2: TUMZQuery
    Connection = DM.db
    Params = <>
    Left = 616
    Top = 208
  end
  object qryProcuraNUIT: TUMZReadOnlyQuery
    Connection = DM.db
    SQL.Strings = (
      'SELECT'
      '   CD_PESSOA'
      'FROM'
      '   PESSOAS'
      'WHERE'
      '   DS_CPF = :DS_CPF AND'
      '   CD_PESSOA != :CD_PESSOA')
    Params = <
      item
        DataType = ftUnknown
        Name = 'DS_CPF'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'CD_PESSOA'
        ParamType = ptUnknown
      end>
    Left = 480
    Top = 24
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'DS_CPF'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'CD_PESSOA'
        ParamType = ptUnknown
      end>
    object qryProcuraNUITCD_PESSOA: TIntegerField
      FieldName = 'CD_PESSOA'
      Required = True
    end
  end
  object pmFoto: TPopupMenu
    Left = 720
    Top = 136
    object miExcluir: TMenuItem
      Caption = 'Excluir imagem'
      OnClick = miExcluirClick
    end
  end
  object imgListFoto: TImageList
    Left = 784
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
    Left = 774
    Top = 68
  end
  object qyNacionalidade: TUMZQuery
    Connection = DM.db
    SQL.Strings = (
      'SELECT DISTINCT(ds_nacionalidade)'
      'FROM paises'
      'WHERE ds_nacionalidade IS NOT NULL'
      'order by ds_nacionalidade')
    Params = <>
    Left = 520
    Top = 32
    object qyNacionalidadeds_nacionalidade: TStringField
      FieldName = 'ds_nacionalidade'
      Size = 100
    end
  end
  object tblPaises: TZTable
    Connection = DM.db
    SortedFields = 'ds_pais'
    TableName = 'paises'
    IndexFieldNames = 'ds_pais Asc'
    Left = 888
    Top = 8
  end
  object qyPais: TUMZQuery
    Connection = DM.db
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
    Left = 851
    Top = 11
    object qyPaisds_nacionalidade: TStringField
      FieldName = 'ds_nacionalidade'
      Size = 100
    end
  end
  object qryDeleteContato: TUMZQuery
    Connection = DM.db
    OnNewRecord = tblContatoPessoaNewRecord
    SQL.Strings = (
      'delete '
      'from contatos_pessoas'
      'where cd_pessoa = :cd_pessoa')
    Params = <
      item
        DataType = ftInteger
        Name = 'cd_pessoa'
        ParamType = ptUnknown
        Size = 4
      end>
    Left = 416
    Top = 374
    ParamData = <
      item
        DataType = ftInteger
        Name = 'cd_pessoa'
        ParamType = ptUnknown
        Size = 4
      end>
  end
  object qryContatosTipos: TUMZQuery
    Connection = DM.db
    SQL.Strings = (
      'SELECT '
      '   ds_mascara'
      'FROM '
      '   contatos_tipos '
      'WHERE '
      '   cd_contato = :contato')
    Params = <
      item
        DataType = ftUnknown
        Name = 'contato'
        ParamType = ptUnknown
      end>
    Left = 456
    Top = 375
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'contato'
        ParamType = ptUnknown
      end>
    object qryContatosTiposds_mascara: TStringField
      FieldName = 'ds_mascara'
      Size = 50
    end
  end
  object updVinculoExterno: TZUpdateSQL
    DeleteSQL.Strings = (
      'DELETE FROM pessoas_integracao_externa'
      'WHERE'
      '        cd_pessoa = :cd_pessoa AND'
      '        cd_pessoa_externa = :cd_pessoa_externa AND'
      '        cd_sistema = :cd_sistema')
    InsertSQL.Strings = (
      
        'REPLACE INTO pessoas_integracao_externa (cd_pessoa, cd_pessoa_ex' +
        'terna, cd_sistema)'
      'VALUES (:cd_pessoa, :cd_pessoa_externa, :cd_sistema)')
    ModifySQL.Strings = (
      
        'REPLACE INTO pessoas_integracao_externa (cd_pessoa, cd_pessoa_ex' +
        'terna, cd_sistema)'
      'VALUES (:cd_pessoa, :cd_pessoa_externa, :cd_sistema)')
    UseSequenceFieldForRefreshSQL = False
    Left = 680
    Top = 448
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'cd_pessoa'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'cd_pessoa_externa'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'cd_sistema'
        ParamType = ptUnknown
      end>
  end
  object dsVinculoExterno: TDataSource
    DataSet = qyVinculosExterno
    OnStateChange = dsVinculoExternoStateChange
    Left = 712
    Top = 416
  end
  object qyVinculosExterno: TUMZQuery
    Connection = DM.db
    AfterOpen = qyVinculosExternoAfterOpen
    UpdateObject = updVinculoExterno
    SQL.Strings = (
      'SELECT'
      '  nie.cd_sistema,'
      '  nie.ds_sistema,'
      '  pie.cd_pessoa_externa,'
      '  :cd_pessoa AS cd_pessoa'
      'FROM'
      '  nu_integracao_externa nie'
      '  LEFT JOIN pessoas_integracao_externa pie ON ('
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
    object qyVinculosExternocd_sistema: TIntegerField
      FieldName = 'cd_sistema'
    end
    object qyVinculosExternods_sistema: TStringField
      FieldName = 'ds_sistema'
      Size = 50
    end
    object qyVinculosExternocd_pessoa_externa: TIntegerField
      FieldName = 'cd_pessoa_externa'
    end
    object qyVinculosExternocd_pessoa: TIntegerField
      FieldName = 'cd_pessoa'
    end
  end
  object qyEncontra_dsIdentidade: TUMZQuery
    Connection = DM.db
    SQL.Strings = (
      'SELECT'
      '  p.cd_pessoa cd_pessoa,'
      '  ('
      '    SELECT'
      '      count(p2.cd_pessoa)'
      '    FROM'
      '      pessoas p2'
      '    WHERE'
      '      p2.ds_identidade = :DS_IDENTIDADE'
      '  ) AS contador1,'
      '  ('
      '    SELECT'
      '      count(p2.cd_pessoa)'
      '    FROM'
      '      pessoas p2'
      '    WHERE'
      '      p2.ds_identidade = :DS_IDENTIDADE'
      '    AND'
      '      p2.cd_pessoa = :CD_PESSOA'
      '  ) AS contador2'
      ' FROM'
      #9'pessoas p'
      'WHERE'
      #9'p.ds_identidade = :DS_IDENTIDADE')
    Params = <
      item
        DataType = ftUnknown
        Name = 'DS_IDENTIDADE'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'CD_PESSOA'
        ParamType = ptUnknown
      end>
    Left = 816
    Top = 112
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'DS_IDENTIDADE'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'CD_PESSOA'
        ParamType = ptUnknown
      end>
  end
end
