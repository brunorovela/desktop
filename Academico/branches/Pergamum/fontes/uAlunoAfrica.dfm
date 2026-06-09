inherited fAlunosAfrica: TfAlunosAfrica
  Left = 227
  Top = 99
  Caption = 'Cadastro de Alunos'
  ClientHeight = 590
  OldCreateOrder = True
  ExplicitWidth = 1011
  ExplicitHeight = 628
  PixelsPerInch = 96
  TextHeight = 13
  inherited Panel3: TPanel
    inherited DBText1: TDBText
      Left = 108
      Top = 3
      Width = 490
      ExplicitLeft = 108
      ExplicitTop = 3
      ExplicitWidth = 490
    end
    inherited DBText2: TDBText
      Left = 509
      Visible = False
      ExplicitLeft = 509
    end
    object dbCodigo: TDBEdit
      Left = 5
      Top = 3
      Width = 96
      Height = 21
      BorderStyle = bsNone
      Color = clBlue
      DataField = 'cd_pessoa'
      DataSource = dsPessoa
      TabOrder = 0
      OnDblClick = DBText2Click
    end
  end
  inherited toolPessoa: TToolBar
    Top = 515
    ExplicitTop = 515
    inherited DBNavigator1: TDBNavigator
      Hints.Strings = ()
    end
    inherited btIncluir_Pessoa: TToolButton
      ExplicitWidth = 74
    end
    inherited btAlterar_Pessoa: TToolButton
      ExplicitWidth = 76
    end
    inherited btExcluir_Pessoa: TToolButton
      ExplicitWidth = 77
    end
    inherited btSalvar_Pessoa: TToolButton
      ExplicitWidth = 76
    end
    inherited btCancelar_Pessoa: TToolButton
      ExplicitWidth = 88
    end
    inherited btnObservacoes: TToolButton
      OnClick = btnObservacoesClick
    end
    inherited btBuscar_Pessoa: TToolButton
      ExplicitWidth = 79
    end
    inherited btFechar_Pessoa: TToolButton
      ExplicitWidth = 85
    end
    object btImprimir_Pessoa: TToolButton
      Left = 790
      Top = 0
      OnClick = btImprimir_PessoaClick
    end
  end
  inherited pgPessoa: TPageControl
    Height = 490
    ActivePage = tsDadosPessoais
    TabOrder = 3
    ExplicitHeight = 490
    inherited tsDadosPessoais: TTabSheet
      ExplicitLeft = 4
      ExplicitTop = 27
      ExplicitWidth = 987
      ExplicitHeight = 459
      object sbBuscarPai: TSpeedButton [23]
        Left = 347
        Top = 287
        Width = 23
        Height = 22
        Hint = 'Buscar do Cadastro'
        Flat = True
        Glyph.Data = {
          F6000000424DF600000000000000760000002800000010000000100000000100
          04000000000080000000CE0E0000D80E00001000000000000000000000000000
          80000080000000808000800000008000800080800000C0C0C000808080000000
          FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00222222222222
          222200000000000022000FFFFFFFFFF020000FFFFFFF000080020FFFFFF08778
          08220FFFFF0877E880220FFFFF07777870220FFFFF07E77870220FFFFF08EE78
          80220FFFFFF0877802220FFFFFFF000022220FFFFFFFFFF022220FFFFFFF0000
          22220FFFFFFF070222220FFFFFFF002222220000000002222222}
        OnClick = sbBuscarPaiClick
      end
      object sbBuscarMae: TSpeedButton [24]
        Left = 347
        Top = 327
        Width = 23
        Height = 22
        Hint = 'Buscar do Cadastro'
        Flat = True
        Glyph.Data = {
          F6000000424DF600000000000000760000002800000010000000100000000100
          04000000000080000000CE0E0000D80E00001000000000000000000000000000
          80000080000000808000800000008000800080800000C0C0C000808080000000
          FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00222222222222
          222200000000000022000FFFFFFFFFF020000FFFFFFF000080020FFFFFF08778
          08220FFFFF0877E880220FFFFF07777870220FFFFF07E77870220FFFFF08EE78
          80220FFFFFF0877802220FFFFFFF000022220FFFFFFFFFF022220FFFFFFF0000
          22220FFFFFFF070222220FFFFFFF002222220000000002222222}
        OnClick = sbBuscarMaeClick
      end
      inherited pcDocumentos: TPageControl
        inherited TabSheet2: TTabSheet
          ExplicitLeft = 4
          ExplicitTop = 27
          ExplicitWidth = 753
          ExplicitHeight = 37
        end
      end
      inherited dbPai: TDBEdit
        Width = 341
        ExplicitWidth = 341
      end
      inherited dbMae: TDBEdit
        Width = 341
        ExplicitWidth = 341
      end
      inherited dbConjuge: TDBEdit
        Top = 245
        ExplicitTop = 245
      end
      inherited ToolBar1: TToolBar
        TabOrder = 22
      end
      inherited Panel1: TPanel
        TabOrder = 23
      end
      inherited gradeContato: TDBGrid
        TabOrder = 24
      end
    end
    inherited tsComplementares: TTabSheet
      ExplicitLeft = 4
      ExplicitTop = 27
      ExplicitWidth = 987
      ExplicitHeight = 459
      inherited dbObs: TDBMemo
        Top = 224
        Height = 142
        ExplicitTop = 224
        ExplicitHeight = 142
      end
      inherited Panel2: TPanel
        Height = 200
        ExplicitHeight = 200
        inherited Label74: TLabel
          Left = 4
          Top = 108
          ExplicitLeft = 4
          ExplicitTop = 108
        end
        inherited Bevel2: TBevel
          Top = 148
          ExplicitTop = 148
        end
        inherited Label33: TLabel
          Left = 4
          Top = 154
          ExplicitLeft = 4
          ExplicitTop = 154
        end
        inherited Label108: TLabel
          Top = 154
          ExplicitTop = 154
        end
        inherited Label109: TLabel
          Left = 314
          Top = 154
          ExplicitLeft = 314
          ExplicitTop = 154
        end
        object Label227: TLabel [8]
          Left = 4
          Top = 69
          Width = 106
          Height = 13
          Caption = 'Forma'#231#227'o Acad'#234'mica:'
        end
        object Label62: TLabel [9]
          Left = 772
          Top = 6
          Width = 46
          Height = 13
          Caption = 'Profiss'#227'o:'
          FocusControl = DBEdit1
        end
        inherited lbFormaConheceuInst: TLabel
          Left = 330
          Top = 69
          ExplicitLeft = 330
          ExplicitTop = 69
        end
        inherited lbInformeFicouSabendo: TLabel
          Left = 566
          Top = 69
          ExplicitLeft = 566
          ExplicitTop = 69
        end
        inherited DBEdit1: TDBEdit
          OnKeyPress = dbNomeKeyPress
        end
        inherited DBLookupComboBox1: TDBLookupComboBox
          Left = 3
          OnKeyPress = dbNomeKeyPress
          ExplicitLeft = 3
        end
        inherited DBEdit13: TDBEdit
          Left = 3
          Top = 123
          TabOrder = 8
          OnKeyPress = dbNomeKeyPress
          ExplicitLeft = 3
          ExplicitTop = 123
        end
        inherited DBCheckBox1: TDBCheckBox
          Left = 156
          Top = 49
          TabOrder = 4
          ExplicitLeft = 156
          ExplicitTop = 49
        end
        inherited edLogin: TEdit
          Left = 4
          Top = 173
          TabOrder = 9
          ExplicitLeft = 4
          ExplicitTop = 173
        end
        inherited edSenha1: TEdit
          Top = 173
          TabOrder = 10
          ExplicitTop = 173
        end
        inherited edSenha2: TEdit
          Left = 314
          Top = 173
          TabOrder = 11
          ExplicitLeft = 314
          ExplicitTop = 173
        end
        object dbCheckInMemorian: TDBCheckBox [19]
          Left = 4
          Top = 46
          Width = 97
          Height = 17
          Caption = 'In Memorian'
          DataField = 'sn_obito'
          DataSource = dsPessoa
          TabOrder = 3
          ValueChecked = '1'
          ValueUnchecked = '0'
        end
        object ds_forma_academica: TDBEdit [20]
          Left = 4
          Top = 85
          Width = 309
          Height = 21
          DataField = 'ds_formacao_academica'
          DataSource = dsPessoa
          TabOrder = 5
        end
        object ds_profissao: TDBEdit [21]
          Left = 772
          Top = 22
          Width = 174
          Height = 21
          DataField = 'ds_profissao'
          DataSource = dsPessoa
          TabOrder = 2
        end
        inherited btnNecessidaEspecial: TButton
          TabOrder = 12
        end
        inherited cbFormaConhece: TComboBox
          Left = 330
          Top = 85
          TabOrder = 6
          ExplicitLeft = 330
          ExplicitTop = 85
        end
        inherited edFormaConheceuOutro: TEdit
          Left = 566
          Top = 85
          TabOrder = 7
          ExplicitLeft = 566
          ExplicitTop = 85
        end
      end
      inherited Panel4: TPanel
        Top = 200
        ExplicitTop = 200
      end
      inherited gradeVinculosExterno: TDBGrid
        Top = 390
      end
      inherited lbVinculoExterno: TPanel
        Top = 366
        ExplicitTop = 366
      end
    end
    inherited tsParentes: TTabSheet
      ExplicitHeight = 459
      inherited frParentes1: TfrParentes
        Height = 459
        ExplicitHeight = 459
        inherited Bevel1: TBevel
          Height = 363
          ExplicitHeight = 310
        end
        inherited Bevel2: TBevel
          Height = 363
          ExplicitHeight = 310
        end
        inherited Bevel3: TBevel
          Top = 445
          ExplicitTop = 392
        end
        inherited Bevel4: TBevel
          Top = 452
          ExplicitTop = 399
        end
        inherited DBGrid1: TDBGrid
          Height = 363
        end
        inherited toolPessoa: TToolBar
          Top = 420
          ExplicitTop = 420
          inherited DBNavigator1: TDBNavigator
            Hints.Strings = ()
          end
        end
      end
    end
    object tsPai: TTabSheet
      Caption = 'PAI'
      ImageIndex = 5
      object Label110: TLabel
        Left = 6
        Top = 0
        Width = 28
        Height = 13
        Caption = 'Nome'
        FocusControl = dbNomePai
      end
      object Label111: TLabel
        Left = 561
        Top = 0
        Width = 82
        Height = 13
        Caption = 'Data Nascimento'
        FocusControl = DBEdit57
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
      end
      object Label113: TLabel
        Left = 337
        Top = 0
        Width = 24
        Height = 13
        Caption = 'Sexo'
      end
      object Label121: TLabel
        Left = 422
        Top = 0
        Width = 55
        Height = 13
        Caption = 'Estado Civil'
      end
      object Label122: TLabel
        Left = 6
        Top = 272
        Width = 61
        Height = 13
        Caption = 'Nome do Pai'
        FocusControl = DBEdit66
      end
      object Label123: TLabel
        Left = 6
        Top = 312
        Width = 67
        Height = 13
        Caption = 'Nome da M'#227'e'
        FocusControl = DBEdit67
      end
      object Label124: TLabel
        Left = 6
        Top = 232
        Width = 85
        Height = 13
        Caption = 'Nome do Conjuge'
        FocusControl = DBEdit68
      end
      object sbCopiarAluno: TSpeedButton
        Left = 84
        Top = 96
        Width = 20
        Height = 22
        Hint = 'Copiar o Endere'#231'o do Aluno'
        Caption = '...'
        Flat = True
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        NumGlyphs = 2
        ParentFont = False
        ParentShowHint = False
        ShowHint = True
        OnClick = sbCopiarAlunoClick
      end
      object Label18: TLabel
        Left = 126
        Top = 40
        Width = 75
        Height = 13
        Caption = 'Provincia Nasc.'
        FocusControl = DBLookupComboBox6
      end
      object Label19: TLabel
        Left = 257
        Top = 40
        Width = 63
        Height = 13
        Caption = 'Distrito Nasc.'
        Transparent = True
      end
      object Label20: TLabel
        Left = 463
        Top = 40
        Width = 52
        Height = 13
        Caption = 'Localidade'
      end
      object Label21: TLabel
        Left = 498
        Top = 80
        Width = 52
        Height = 13
        Caption = 'Localidade'
      end
      object Label22: TLabel
        Left = 339
        Top = 80
        Width = 32
        Height = 13
        Caption = 'Distrito'
      end
      object Label23: TLabel
        Left = 231
        Top = 80
        Width = 44
        Height = 13
        Caption = 'Provincia'
        FocusControl = DBLookupComboBox14
      end
      object Label24: TLabel
        Left = 108
        Top = 80
        Width = 22
        Height = 13
        Caption = 'Pa'#237's'
      end
      object Label25: TLabel
        Left = 6
        Top = 80
        Width = 65
        Height = 13
        Caption = 'C'#243'digo Postal'
        FocusControl = DBEdit6
      end
      object Label26: TLabel
        Left = 6
        Top = 120
        Width = 60
        Height = 13
        Caption = 'Tipo Morada'
        FocusControl = DBEdit8
      end
      object Label30: TLabel
        Left = 118
        Top = 120
        Width = 36
        Height = 13
        Caption = 'Morada'
        FocusControl = DBEdit8
      end
      object Label34: TLabel
        Left = 400
        Top = 120
        Width = 37
        Height = 13
        Caption = 'N'#250'mero'
        FocusControl = DBEdit9
      end
      object Label43: TLabel
        Left = 471
        Top = 120
        Width = 64
        Height = 13
        Caption = 'Complemento'
        FocusControl = DBEdit11
      end
      object Label17: TLabel
        Left = 6
        Top = 40
        Width = 53
        Height = 13
        Caption = 'Pa'#237's Nasc.'
      end
      object dbNomePai: TDBEdit
        Left = 6
        Top = 16
        Width = 326
        Height = 21
        DataField = 'nm_pessoa'
        DataSource = dsResponsavel
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
        TabOrder = 0
        OnExit = dbNomeRespFinanExit
        OnKeyPress = dbNomeKeyPress
      end
      object DBEdit57: TDBEdit
        Left = 561
        Top = 16
        Width = 91
        Height = 21
        DataField = 'dt_nascimento'
        DataSource = dsResponsavel
        TabOrder = 3
        OnKeyPress = dbNomeKeyPress
      end
      object DBComboBox1: TDBComboBox
        Left = 337
        Top = 16
        Width = 81
        Height = 22
        Style = csOwnerDrawFixed
        DataField = 'ds_sexo'
        DataSource = dsResponsavel
        ItemHeight = 16
        Items.Strings = (
          'Masculino'
          'Feminino')
        TabOrder = 1
        OnKeyPress = dbNomeKeyPress
      end
      object DBEdit66: TDBEdit
        Left = 6
        Top = 288
        Width = 363
        Height = 21
        DataField = 'nm_pai'
        DataSource = dsResponsavel
        TabOrder = 6
        OnKeyPress = dbNomeKeyPress
      end
      object DBEdit67: TDBEdit
        Left = 6
        Top = 328
        Width = 363
        Height = 21
        DataField = 'nm_mae'
        DataSource = dsResponsavel
        TabOrder = 7
        OnKeyPress = dbNomeKeyPress
      end
      object DBEdit68: TDBEdit
        Left = 6
        Top = 248
        Width = 363
        Height = 21
        DataField = 'nm_conjuge'
        DataSource = dsResponsavel
        TabOrder = 5
        OnKeyPress = dbNomeKeyPress
      end
      object DBGrid5: TDBGrid
        Left = 375
        Top = 233
        Width = 377
        Height = 118
        BorderStyle = bsNone
        DataSource = dsContatoResponsavel
        Options = [dgEditing, dgTitles, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgConfirmDelete, dgCancelOnExit]
        PopupMenu = popContatoResp
        TabOrder = 8
        TitleFont.Charset = DEFAULT_CHARSET
        TitleFont.Color = clWindowText
        TitleFont.Height = -11
        TitleFont.Name = 'MS Sans Serif'
        TitleFont.Style = []
        OnExit = DBGrid1Exit
        OnKeyDown = DBGrid1KeyDown
        Columns = <
          item
            Expanded = False
            FieldName = 'descContato'
            Title.Caption = 'Tipo Contato'
            Width = 105
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'ds_contato'
            Title.Caption = 'Descri'#231#227'o do Contato'
            Width = 250
            Visible = True
          end>
      end
      object DBLookupComboBox13: TDBLookupComboBox
        Left = 422
        Top = 16
        Width = 135
        Height = 21
        DataField = 'descEstadoCivil'
        DataSource = dsResponsavel
        TabOrder = 2
        OnKeyPress = dbNomeKeyPress
      end
      object Panel12: TPanel
        Left = 658
        Top = 15
        Width = 107
        Height = 122
        PopupMenu = pmFoto
        TabOrder = 9
        object Image1: TImage
          Left = 1
          Top = 1
          Width = 105
          Height = 120
          Hint = 'Duplo clique para procurar a foto.'
          Align = alClient
          PopupMenu = pmFoto
          Proportional = True
          Stretch = True
        end
        object Label129: TLabel
          Left = 36
          Top = 52
          Width = 35
          Height = 16
          Caption = 'FOTO'
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          ParentFont = False
          PopupMenu = pmFoto
          Transparent = True
          Visible = False
        end
      end
      object pgDocPai: TPageControl
        Left = 0
        Top = 163
        Width = 761
        Height = 68
        ActivePage = TabSheet6
        MultiLine = True
        Style = tsFlatButtons
        TabOrder = 4
        object TabSheet6: TTabSheet
          Caption = 'Documenta'#231#227'o'
          object Label150: TLabel
            Left = 1
            Top = 0
            Width = 70
            Height = 13
            Caption = 'N. Contribuinte'
            FocusControl = dbCPFPai
          end
          object Label151: TLabel
            Left = 161
            Top = 0
            Width = 100
            Height = 13
            Caption = 'Bilhete de Identidade'
            FocusControl = DBEdit87
          end
          object Label153: TLabel
            Left = 474
            Top = 0
            Width = 88
            Height = 13
            Caption = 'Data de Expira'#231#227'o'
            FocusControl = DBEdit89
          end
          object SpeedButton5: TSpeedButton
            Left = 600
            Top = 8
            Width = 145
            Height = 25
            Caption = 'F10   Mais Informa'#231#245'es >>'
            Flat = True
            NumGlyphs = 2
            OnClick = sbMaisInformacoesClick
          end
          object Label57: TLabel
            Left = 320
            Top = 0
            Width = 110
            Height = 13
            Caption = 'Sector de Identifica'#231#227'o'
          end
          object dbCPFPai: TDBEdit
            Left = 1
            Top = 16
            Width = 150
            Height = 21
            DataField = 'ds_cpf'
            DataSource = dsResponsavel
            TabOrder = 0
            OnKeyPress = dbNomeKeyPress
          end
          object DBEdit87: TDBEdit
            Left = 161
            Top = 16
            Width = 150
            Height = 21
            DataField = 'ds_identidade'
            DataSource = dsResponsavel
            TabOrder = 1
            OnKeyPress = dbNomeKeyPress
          end
          object DBEdit89: TDBEdit
            Left = 474
            Top = 16
            Width = 113
            Height = 21
            DataField = 'dt_identidade_expedicao'
            DataSource = dsResponsavel
            TabOrder = 2
            OnKeyPress = dbNomeKeyPress
          end
          object DBEdit19: TDBEdit
            Left = 320
            Top = 16
            Width = 145
            Height = 21
            DataField = 'ds_identidade_orgao_exp'
            DataSource = dsResponsavel
            TabOrder = 3
          end
        end
        object Complementares: TTabSheet
          Caption = 'Complementares'
          ImageIndex = 4
          object Label106: TLabel
            Left = 3
            Top = 1
            Width = 72
            Height = 13
            Caption = 'Cargo/Fun'#231#227'o:'
            FocusControl = dbedSector
          end
        end
      end
      object DBLookupComboBox5: TDBLookupComboBox
        Left = 6
        Top = 56
        Width = 113
        Height = 21
        DataField = 'descPaisNasc'
        DataSource = dsResponsavel
        DropDownWidth = 150
        TabOrder = 10
        OnKeyPress = dbNomeKeyPress
      end
      object DBLookupComboBox6: TDBLookupComboBox
        Left = 125
        Top = 56
        Width = 126
        Height = 21
        DataField = 'descProvinciaNasc'
        DataSource = dsResponsavel
        TabOrder = 11
        OnKeyPress = dbNomeKeyPress
      end
      object DBLookupComboBox7: TDBLookupComboBox
        Left = 257
        Top = 53
        Width = 202
        Height = 21
        DataField = 'descDistritoNasc'
        DataSource = dsResponsavel
        TabOrder = 12
        OnKeyPress = dbNomeKeyPress
      end
      object DBLookupComboBox10: TDBLookupComboBox
        Left = 463
        Top = 53
        Width = 189
        Height = 21
        DataField = 'descLocalidadeNasc'
        DataSource = dsResponsavel
        TabOrder = 13
        TabStop = False
        OnKeyPress = dbNomeKeyPress
      end
      object DBLookupComboBox11: TDBLookupComboBox
        Left = 497
        Top = 95
        Width = 155
        Height = 21
        DataField = 'descLocalidade'
        DataSource = dsResponsavel
        TabOrder = 14
        TabStop = False
        OnKeyPress = dbNomeKeyPress
      end
      object DBLookupComboBox12: TDBLookupComboBox
        Left = 340
        Top = 96
        Width = 151
        Height = 21
        DataField = 'descDistrito'
        DataSource = dsResponsavel
        TabOrder = 15
        TabStop = False
        OnKeyPress = dbNomeKeyPress
      end
      object DBLookupComboBox14: TDBLookupComboBox
        Left = 230
        Top = 96
        Width = 106
        Height = 21
        DataField = 'descProvincia'
        DataSource = dsResponsavel
        DropDownWidth = 150
        TabOrder = 16
        OnKeyPress = dbNomeKeyPress
      end
      object DBLookupComboBox15: TDBLookupComboBox
        Left = 108
        Top = 96
        Width = 116
        Height = 21
        DataField = 'descPaisAtual'
        DataSource = dsResponsavel
        DropDownWidth = 150
        TabOrder = 17
        OnKeyPress = dbNomeKeyPress
      end
      object DBEdit6: TDBEdit
        Left = 6
        Top = 96
        Width = 75
        Height = 21
        DataField = 'ds_cep'
        DataSource = dsResponsavel
        TabOrder = 18
        OnKeyPress = dbNomeKeyPress
      end
      object DBLookupComboBox17: TDBLookupComboBox
        Left = 6
        Top = 136
        Width = 105
        Height = 21
        DataField = 'desLogradouro'
        DataSource = dsResponsavel
        DropDownWidth = 150
        TabOrder = 19
        OnKeyPress = dbNomeKeyPress
      end
      object DBEdit8: TDBEdit
        Left = 118
        Top = 136
        Width = 276
        Height = 21
        DataField = 'ds_logradouro'
        DataSource = dsResponsavel
        TabOrder = 20
        OnKeyPress = dbNomeKeyPress
      end
      object DBEdit9: TDBEdit
        Left = 400
        Top = 136
        Width = 65
        Height = 21
        DataField = 'ds_logradouro_nro'
        DataSource = dsResponsavel
        TabOrder = 21
        OnKeyPress = dbNomeKeyPress
      end
      object DBEdit11: TDBEdit
        Left = 472
        Top = 136
        Width = 181
        Height = 21
        DataField = 'ds_complemento'
        DataSource = dsResponsavel
        TabOrder = 22
        OnKeyPress = dbComplementoKeyPress
      end
    end
    object tsMae: TTabSheet
      Caption = 'M'#195'E'
      ImageIndex = 3
      object Label130: TLabel
        Left = 6
        Top = 0
        Width = 28
        Height = 13
        Caption = 'Nome'
        FocusControl = dbNomeMae
      end
      object Label131: TLabel
        Left = 561
        Top = 0
        Width = 82
        Height = 13
        Caption = 'Data Nascimento'
        FocusControl = DBEdit72
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
      end
      object Label133: TLabel
        Left = 337
        Top = 0
        Width = 24
        Height = 13
        Caption = 'Sexo'
      end
      object Label141: TLabel
        Left = 422
        Top = 0
        Width = 55
        Height = 13
        Caption = 'Estado Civil'
      end
      object Label142: TLabel
        Left = 6
        Top = 272
        Width = 61
        Height = 13
        Caption = 'Nome do Pai'
        FocusControl = DBEdit81
      end
      object Label143: TLabel
        Left = 6
        Top = 312
        Width = 67
        Height = 13
        Caption = 'Nome da M'#227'e'
        FocusControl = DBEdit82
      end
      object Label144: TLabel
        Left = 6
        Top = 232
        Width = 85
        Height = 13
        Caption = 'Nome do Conjuge'
        FocusControl = DBEdit83
      end
      object SpeedButton3: TSpeedButton
        Left = 86
        Top = 96
        Width = 20
        Height = 22
        Hint = 'Copiar o Endere'#231'o do Aluno'
        Caption = '...'
        Flat = True
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        NumGlyphs = 2
        ParentFont = False
        ParentShowHint = False
        ShowHint = True
        OnClick = sbCopiarAlunoClick
      end
      object Label31: TLabel
        Left = 6
        Top = 40
        Width = 53
        Height = 13
        Caption = 'Pa'#237's Nasc.'
      end
      object Label44: TLabel
        Left = 126
        Top = 40
        Width = 75
        Height = 13
        Caption = 'Provincia Nasc.'
        FocusControl = DBLookupComboBox19
      end
      object Label48: TLabel
        Left = 257
        Top = 40
        Width = 63
        Height = 13
        Caption = 'Distrito Nasc.'
        Transparent = True
      end
      object Label49: TLabel
        Left = 463
        Top = 40
        Width = 52
        Height = 13
        Caption = 'Localidade'
      end
      object Label50: TLabel
        Left = 498
        Top = 80
        Width = 52
        Height = 13
        Caption = 'Localidade'
      end
      object Label51: TLabel
        Left = 339
        Top = 80
        Width = 32
        Height = 13
        Caption = 'Distrito'
      end
      object Label52: TLabel
        Left = 231
        Top = 80
        Width = 44
        Height = 13
        Caption = 'Provincia'
        FocusControl = DBLookupComboBox24
      end
      object Label53: TLabel
        Left = 108
        Top = 80
        Width = 22
        Height = 13
        Caption = 'Pa'#237's'
      end
      object Label54: TLabel
        Left = 6
        Top = 80
        Width = 65
        Height = 13
        Caption = 'C'#243'digo Postal'
        FocusControl = DBEdit7
      end
      object Label73: TLabel
        Left = 6
        Top = 120
        Width = 60
        Height = 13
        Caption = 'Tipo Morada'
        FocusControl = DBEdit12
      end
      object Label75: TLabel
        Left = 118
        Top = 120
        Width = 36
        Height = 13
        Caption = 'Morada'
        FocusControl = DBEdit12
      end
      object Label76: TLabel
        Left = 400
        Top = 120
        Width = 37
        Height = 13
        Caption = 'N'#250'mero'
        FocusControl = DBEdit14
      end
      object Label77: TLabel
        Left = 471
        Top = 120
        Width = 64
        Height = 13
        Caption = 'Complemento'
        FocusControl = DBEdit15
      end
      object dbNomeMae: TDBEdit
        Left = 6
        Top = 16
        Width = 326
        Height = 21
        DataField = 'nm_pessoa'
        DataSource = dsResponsavel
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
        TabOrder = 0
        OnExit = dbNomeRespFinanExit
        OnKeyPress = dbNomeKeyPress
      end
      object DBEdit72: TDBEdit
        Left = 561
        Top = 16
        Width = 91
        Height = 21
        DataField = 'dt_nascimento'
        DataSource = dsResponsavel
        TabOrder = 3
        OnKeyPress = dbNomeKeyPress
      end
      object DBComboBox3: TDBComboBox
        Left = 337
        Top = 16
        Width = 81
        Height = 22
        Style = csOwnerDrawFixed
        DataField = 'ds_sexo'
        DataSource = dsResponsavel
        ItemHeight = 16
        Items.Strings = (
          'Masculino'
          'Feminino')
        TabOrder = 1
        OnKeyPress = dbNomeKeyPress
      end
      object DBEdit81: TDBEdit
        Left = 6
        Top = 288
        Width = 363
        Height = 21
        DataField = 'nm_pai'
        DataSource = dsResponsavel
        TabOrder = 6
        OnKeyPress = dbNomeKeyPress
      end
      object DBEdit82: TDBEdit
        Left = 6
        Top = 328
        Width = 363
        Height = 21
        DataField = 'nm_mae'
        DataSource = dsResponsavel
        TabOrder = 7
        OnKeyPress = dbNomeKeyPress
      end
      object DBEdit83: TDBEdit
        Left = 6
        Top = 248
        Width = 363
        Height = 21
        DataField = 'nm_conjuge'
        DataSource = dsResponsavel
        TabOrder = 5
        OnKeyPress = dbNomeKeyPress
      end
      object DBGrid6: TDBGrid
        Left = 376
        Top = 231
        Width = 377
        Height = 118
        BorderStyle = bsNone
        DataSource = dsContatoResponsavel
        Options = [dgEditing, dgTitles, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgConfirmDelete, dgCancelOnExit]
        PopupMenu = popContatoResp
        TabOrder = 8
        TitleFont.Charset = DEFAULT_CHARSET
        TitleFont.Color = clWindowText
        TitleFont.Height = -11
        TitleFont.Name = 'MS Sans Serif'
        TitleFont.Style = []
        OnExit = DBGrid1Exit
        OnKeyDown = DBGrid1KeyDown
        Columns = <
          item
            Expanded = False
            FieldName = 'descContato'
            Title.Caption = 'Tipo Contato'
            Width = 105
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'ds_contato'
            Title.Caption = 'Descri'#231#227'o do Contato'
            Width = 250
            Visible = True
          end>
      end
      object DBLookupComboBox16: TDBLookupComboBox
        Left = 422
        Top = 16
        Width = 135
        Height = 21
        DataField = 'descEstadoCivil'
        DataSource = dsResponsavel
        TabOrder = 2
        OnKeyPress = dbNomeKeyPress
      end
      object Panel13: TPanel
        Left = 658
        Top = 15
        Width = 107
        Height = 122
        PopupMenu = pmFoto
        TabOrder = 9
        object Image2: TImage
          Left = 1
          Top = 1
          Width = 105
          Height = 120
          Hint = 'Duplo clique para procurar a foto.'
          Align = alClient
          PopupMenu = pmFoto
          Proportional = True
          Stretch = True
        end
        object Label149: TLabel
          Left = 36
          Top = 52
          Width = 35
          Height = 16
          Caption = 'FOTO'
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          ParentFont = False
          PopupMenu = pmFoto
          Transparent = True
          Visible = False
        end
      end
      object pgDocMae: TPageControl
        Left = 0
        Top = 163
        Width = 761
        Height = 68
        ActivePage = TabSheet17
        MultiLine = True
        Style = tsFlatButtons
        TabOrder = 4
        object TabSheet17: TTabSheet
          Caption = 'Documenta'#231#227'o'
          object Label170: TLabel
            Left = 1
            Top = 0
            Width = 70
            Height = 13
            Caption = 'N. Contribuinte'
            FocusControl = dbCPFMae
          end
          object Label171: TLabel
            Left = 161
            Top = 0
            Width = 100
            Height = 13
            Caption = 'Bilhete de Identidade'
            FocusControl = DBEdit103
          end
          object Label173: TLabel
            Left = 474
            Top = 0
            Width = 88
            Height = 13
            Caption = 'Data de Expira'#231#227'o'
            FocusControl = DBEdit105
          end
          object SpeedButton6: TSpeedButton
            Left = 600
            Top = 8
            Width = 145
            Height = 25
            Caption = 'F10   Mais Informa'#231#245'es >>'
            Flat = True
            NumGlyphs = 2
            OnClick = sbMaisInformacoesClick
          end
          object Label59: TLabel
            Left = 320
            Top = 0
            Width = 110
            Height = 13
            Caption = 'Sector de Identifica'#231#227'o'
          end
          object dbCPFMae: TDBEdit
            Left = 1
            Top = 16
            Width = 150
            Height = 21
            DataField = 'ds_cpf'
            DataSource = dsResponsavel
            TabOrder = 0
            OnKeyPress = dbNomeKeyPress
          end
          object DBEdit103: TDBEdit
            Left = 161
            Top = 16
            Width = 150
            Height = 21
            DataField = 'ds_identidade'
            DataSource = dsResponsavel
            TabOrder = 1
            OnKeyPress = dbNomeKeyPress
          end
          object DBEdit105: TDBEdit
            Left = 474
            Top = 16
            Width = 113
            Height = 21
            DataField = 'dt_identidade_expedicao'
            DataSource = dsResponsavel
            TabOrder = 2
            OnKeyPress = dbNomeKeyPress
          end
          object DBEdit21: TDBEdit
            Left = 320
            Top = 16
            Width = 145
            Height = 21
            DataField = 'ds_identidade_orgao_exp'
            DataSource = dsResponsavel
            TabOrder = 3
          end
        end
        object TabSheet1: TTabSheet
          Caption = 'Complementares'
          ImageIndex = 4
          object Label204: TLabel
            Left = 3
            Top = 1
            Width = 72
            Height = 13
            Caption = 'Cargo/Fun'#231#227'o:'
            FocusControl = dbedExpiracao
          end
        end
      end
      object DBLookupComboBox18: TDBLookupComboBox
        Left = 6
        Top = 56
        Width = 113
        Height = 21
        DataField = 'descPaisNasc'
        DataSource = dsResponsavel
        DropDownWidth = 150
        TabOrder = 10
        OnKeyPress = dbNomeKeyPress
      end
      object DBLookupComboBox19: TDBLookupComboBox
        Left = 125
        Top = 56
        Width = 126
        Height = 21
        DataField = 'descProvinciaNasc'
        DataSource = dsResponsavel
        TabOrder = 11
        OnKeyPress = dbNomeKeyPress
      end
      object DBLookupComboBox20: TDBLookupComboBox
        Left = 257
        Top = 56
        Width = 202
        Height = 21
        DataField = 'descDistritoNasc'
        DataSource = dsResponsavel
        TabOrder = 12
        OnKeyPress = dbNomeKeyPress
      end
      object DBLookupComboBox21: TDBLookupComboBox
        Left = 463
        Top = 55
        Width = 189
        Height = 21
        DataField = 'descLocalidadeNasc'
        DataSource = dsResponsavel
        TabOrder = 13
        TabStop = False
        OnKeyPress = dbNomeKeyPress
      end
      object DBLookupComboBox22: TDBLookupComboBox
        Left = 497
        Top = 95
        Width = 155
        Height = 21
        DataField = 'descLocalidade'
        DataSource = dsResponsavel
        TabOrder = 14
        TabStop = False
        OnKeyPress = dbNomeKeyPress
      end
      object DBLookupComboBox23: TDBLookupComboBox
        Left = 340
        Top = 96
        Width = 151
        Height = 21
        DataField = 'descDistrito'
        DataSource = dsResponsavel
        TabOrder = 15
        TabStop = False
        OnKeyPress = dbNomeKeyPress
      end
      object DBLookupComboBox24: TDBLookupComboBox
        Left = 230
        Top = 96
        Width = 106
        Height = 21
        DataField = 'descProvincia'
        DataSource = dsResponsavel
        DropDownWidth = 150
        TabOrder = 16
        OnKeyPress = dbNomeKeyPress
      end
      object DBLookupComboBox25: TDBLookupComboBox
        Left = 108
        Top = 96
        Width = 116
        Height = 21
        DataField = 'descPaisAtual'
        DataSource = dsResponsavel
        DropDownWidth = 150
        TabOrder = 17
        OnKeyPress = dbNomeKeyPress
      end
      object DBEdit7: TDBEdit
        Left = 6
        Top = 96
        Width = 75
        Height = 21
        DataField = 'ds_cep'
        DataSource = dsResponsavel
        TabOrder = 18
        OnKeyPress = dbNomeKeyPress
      end
      object DBLookupComboBox26: TDBLookupComboBox
        Left = 6
        Top = 136
        Width = 105
        Height = 21
        DataField = 'desLogradouro'
        DataSource = dsResponsavel
        DropDownWidth = 150
        TabOrder = 19
        OnKeyPress = dbNomeKeyPress
      end
      object DBEdit12: TDBEdit
        Left = 118
        Top = 136
        Width = 276
        Height = 21
        DataField = 'ds_logradouro'
        DataSource = dsResponsavel
        TabOrder = 20
        OnKeyPress = dbNomeKeyPress
      end
      object DBEdit14: TDBEdit
        Left = 400
        Top = 136
        Width = 65
        Height = 21
        DataField = 'ds_logradouro_nro'
        DataSource = dsResponsavel
        TabOrder = 21
        OnKeyPress = dbNomeKeyPress
      end
      object DBEdit15: TDBEdit
        Left = 472
        Top = 136
        Width = 181
        Height = 21
        DataField = 'ds_complemento'
        DataSource = dsResponsavel
        TabOrder = 22
        OnKeyPress = dbComplementoKeyPress
      end
    end
    object tsRespAcademico: TTabSheet
      Caption = 'RESP. ACAD'#202'MICO'
      ImageIndex = 2
      object Label27: TLabel
        Left = 6
        Top = 0
        Width = 28
        Height = 13
        Caption = 'Nome'
        FocusControl = dbNomeRespAcad
      end
      object Label45: TLabel
        Left = 337
        Top = 0
        Width = 24
        Height = 13
        Caption = 'Sexo'
      end
      object Label47: TLabel
        Left = 561
        Top = 0
        Width = 82
        Height = 13
        Caption = 'Data Nascimento'
        FocusControl = DBEdit10
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
      end
      object Label68: TLabel
        Left = 6
        Top = 232
        Width = 85
        Height = 13
        Caption = 'Nome do Conjuge'
        FocusControl = DBEdit27
      end
      object Label69: TLabel
        Left = 6
        Top = 272
        Width = 61
        Height = 13
        Caption = 'Nome do Pai'
        FocusControl = DBEdit28
      end
      object Label70: TLabel
        Left = 6
        Top = 312
        Width = 67
        Height = 13
        Caption = 'Nome da M'#227'e'
        FocusControl = DBEdit29
      end
      object Label46: TLabel
        Left = 422
        Top = 0
        Width = 55
        Height = 13
        Caption = 'Estado Civil'
      end
      object SpeedButton7: TSpeedButton
        Left = 87
        Top = 96
        Width = 20
        Height = 22
        Hint = 'Copiar o Endere'#231'o do Aluno'
        Caption = '...'
        Flat = True
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        NumGlyphs = 2
        ParentFont = False
        ParentShowHint = False
        ShowHint = True
        OnClick = sbCopiarAlunoClick
      end
      object Label81: TLabel
        Left = 6
        Top = 40
        Width = 53
        Height = 13
        Caption = 'Pa'#237's Nasc.'
      end
      object Label82: TLabel
        Left = 126
        Top = 40
        Width = 75
        Height = 13
        Caption = 'Provincia Nasc.'
        FocusControl = DBLookupComboBox28
      end
      object Label83: TLabel
        Left = 257
        Top = 40
        Width = 63
        Height = 13
        Caption = 'Distrito Nasc.'
        Transparent = True
      end
      object Label84: TLabel
        Left = 463
        Top = 40
        Width = 52
        Height = 13
        Caption = 'Localidade'
      end
      object Label85: TLabel
        Left = 498
        Top = 80
        Width = 52
        Height = 13
        Caption = 'Localidade'
      end
      object Label86: TLabel
        Left = 339
        Top = 80
        Width = 32
        Height = 13
        Caption = 'Distrito'
      end
      object Label87: TLabel
        Left = 231
        Top = 80
        Width = 44
        Height = 13
        Caption = 'Provincia'
        FocusControl = DBLookupComboBox33
      end
      object Label107: TLabel
        Left = 108
        Top = 80
        Width = 22
        Height = 13
        Caption = 'Pa'#237's'
      end
      object Label112: TLabel
        Left = 6
        Top = 80
        Width = 65
        Height = 13
        Caption = 'C'#243'digo Postal'
        FocusControl = DBEdit16
      end
      object Label114: TLabel
        Left = 6
        Top = 120
        Width = 60
        Height = 13
        Caption = 'Tipo Morada'
        FocusControl = DBEdit31
      end
      object Label115: TLabel
        Left = 118
        Top = 120
        Width = 36
        Height = 13
        Caption = 'Morada'
        FocusControl = DBEdit31
      end
      object Label116: TLabel
        Left = 400
        Top = 120
        Width = 37
        Height = 13
        Caption = 'N'#250'mero'
        FocusControl = DBEdit32
      end
      object Label117: TLabel
        Left = 471
        Top = 120
        Width = 64
        Height = 13
        Caption = 'Complemento'
        FocusControl = DBEdit33
      end
      object dbNomeRespAcad: TDBEdit
        Left = 5
        Top = 13
        Width = 326
        Height = 21
        DataField = 'nm_pessoa'
        DataSource = dsResponsavel
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
        TabOrder = 0
        OnExit = dbNomeRespFinanExit
        OnKeyPress = dbNomeKeyPress
      end
      object DBComboBox2: TDBComboBox
        Left = 337
        Top = 16
        Width = 81
        Height = 22
        Style = csOwnerDrawFixed
        DataField = 'ds_sexo'
        DataSource = dsResponsavel
        ItemHeight = 16
        Items.Strings = (
          'Masculino'
          'Feminino')
        TabOrder = 1
        OnKeyPress = dbNomeKeyPress
      end
      object DBEdit10: TDBEdit
        Left = 561
        Top = 16
        Width = 91
        Height = 21
        DataField = 'dt_nascimento'
        DataSource = dsResponsavel
        TabOrder = 3
        OnKeyPress = dbNomeKeyPress
      end
      object pgDocAcad: TPageControl
        Left = 0
        Top = 163
        Width = 761
        Height = 68
        ActivePage = TabSheet9
        MultiLine = True
        Style = tsFlatButtons
        TabOrder = 4
        object TabSheet9: TTabSheet
          Caption = 'Documenta'#231#227'o'
          object Label55: TLabel
            Left = 1
            Top = 0
            Width = 70
            Height = 13
            Caption = 'N. Contribuinte'
            FocusControl = dbCPFAcad
          end
          object Label56: TLabel
            Left = 161
            Top = 0
            Width = 100
            Height = 13
            Caption = 'Bilhete de Identidade'
            FocusControl = DBEdit18
          end
          object Label58: TLabel
            Left = 473
            Top = 0
            Width = 88
            Height = 13
            Caption = 'Data de Expira'#231#227'o'
            FocusControl = DBEdit20
          end
          object sbMaisInformacoesAcademico: TSpeedButton
            Left = 600
            Top = 8
            Width = 145
            Height = 25
            Caption = 'Mais Informa'#231#245'es >>'
            Flat = True
            NumGlyphs = 2
            OnClick = sbMaisInformacoesAcademicoClick
          end
          object Label60: TLabel
            Left = 320
            Top = 0
            Width = 110
            Height = 13
            Caption = 'Sector de Identifica'#231#227'o'
          end
          object dbCPFAcad: TDBEdit
            Left = 1
            Top = 16
            Width = 150
            Height = 21
            DataField = 'ds_cpf'
            DataSource = dsResponsavel
            TabOrder = 0
            OnKeyPress = dbNomeKeyPress
          end
          object DBEdit18: TDBEdit
            Left = 161
            Top = 16
            Width = 150
            Height = 21
            DataField = 'ds_identidade'
            DataSource = dsResponsavel
            TabOrder = 1
            OnKeyPress = dbNomeKeyPress
          end
          object DBEdit20: TDBEdit
            Left = 474
            Top = 16
            Width = 113
            Height = 21
            DataField = 'dt_identidade_expedicao'
            DataSource = dsResponsavel
            TabOrder = 2
            OnKeyPress = dbNomeKeyPress
          end
          object DBEdit22: TDBEdit
            Left = 320
            Top = 16
            Width = 145
            Height = 21
            DataField = 'ds_identidade_orgao_exp'
            DataSource = dsResponsavel
            TabOrder = 3
          end
        end
        object TabSheet5: TTabSheet
          Caption = 'Complementares'
          ImageIndex = 4
          object Label205: TLabel
            Left = 3
            Top = 1
            Width = 72
            Height = 13
            Caption = 'Cargo/Fun'#231#227'o:'
            FocusControl = DBEdit17
          end
          object DBEdit17: TDBEdit
            Left = 2
            Top = 16
            Width = 310
            Height = 21
            DataField = 'ds_cargo'
            DataSource = dsResponsavel
            TabOrder = 0
            OnKeyPress = dbNomeKeyPress
          end
        end
      end
      object DBEdit27: TDBEdit
        Left = 6
        Top = 248
        Width = 363
        Height = 21
        DataField = 'nm_conjuge'
        DataSource = dsResponsavel
        TabOrder = 5
        OnKeyPress = dbNomeKeyPress
      end
      object DBEdit28: TDBEdit
        Left = 6
        Top = 288
        Width = 363
        Height = 21
        DataField = 'nm_pai'
        DataSource = dsResponsavel
        TabOrder = 6
        OnKeyPress = dbNomeKeyPress
      end
      object DBEdit29: TDBEdit
        Left = 6
        Top = 328
        Width = 363
        Height = 21
        DataField = 'nm_mae'
        DataSource = dsResponsavel
        TabOrder = 7
        OnKeyPress = dbNomeKeyPress
      end
      object DBGrid1: TDBGrid
        Left = 376
        Top = 231
        Width = 377
        Height = 118
        BorderStyle = bsNone
        DataSource = dsContatoResponsavel
        Options = [dgEditing, dgTitles, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgConfirmDelete, dgCancelOnExit]
        PopupMenu = popContatoResp
        TabOrder = 8
        TitleFont.Charset = DEFAULT_CHARSET
        TitleFont.Color = clWindowText
        TitleFont.Height = -11
        TitleFont.Name = 'MS Sans Serif'
        TitleFont.Style = []
        OnExit = DBGrid1Exit
        OnKeyDown = DBGrid1KeyDown
        Columns = <
          item
            Expanded = False
            FieldName = 'descContato'
            Title.Caption = 'Tipo Contato'
            Width = 105
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'ds_contato'
            Title.Caption = 'Descri'#231#227'o do Contato'
            Width = 250
            Visible = True
          end>
      end
      object Panel5: TPanel
        Left = 658
        Top = 15
        Width = 107
        Height = 122
        TabOrder = 9
        object imageFotoAcad: TImage
          Left = 1
          Top = 1
          Width = 105
          Height = 120
          Align = alClient
          Stretch = True
        end
        object lbFotoAcad: TLabel
          Left = 36
          Top = 52
          Width = 35
          Height = 16
          Caption = 'FOTO'
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          ParentFont = False
          Transparent = True
          Visible = False
        end
      end
      object DBLookupComboBox8: TDBLookupComboBox
        Left = 422
        Top = 16
        Width = 135
        Height = 21
        DataField = 'descEstadoCivil'
        DataSource = dsResponsavel
        TabOrder = 2
        OnKeyPress = dbNomeKeyPress
      end
      object DBLookupComboBox27: TDBLookupComboBox
        Left = 6
        Top = 56
        Width = 113
        Height = 21
        DataField = 'descPaisNasc'
        DataSource = dsResponsavel
        DropDownWidth = 150
        TabOrder = 10
        OnKeyPress = dbNomeKeyPress
      end
      object DBLookupComboBox28: TDBLookupComboBox
        Left = 125
        Top = 56
        Width = 126
        Height = 21
        DataField = 'descProvinciaNasc'
        DataSource = dsResponsavel
        TabOrder = 11
        OnKeyPress = dbNomeKeyPress
      end
      object DBLookupComboBox29: TDBLookupComboBox
        Left = 257
        Top = 56
        Width = 202
        Height = 21
        DataField = 'descDistritoNasc'
        DataSource = dsResponsavel
        TabOrder = 12
        OnKeyPress = dbNomeKeyPress
      end
      object DBLookupComboBox30: TDBLookupComboBox
        Left = 463
        Top = 55
        Width = 189
        Height = 21
        DataField = 'descLocalidadeNasc'
        DataSource = dsResponsavel
        TabOrder = 13
        TabStop = False
        OnKeyPress = dbNomeKeyPress
      end
      object DBLookupComboBox31: TDBLookupComboBox
        Left = 497
        Top = 95
        Width = 155
        Height = 21
        DataField = 'descLocalidade'
        DataSource = dsResponsavel
        TabOrder = 14
        TabStop = False
        OnKeyPress = dbNomeKeyPress
      end
      object DBLookupComboBox32: TDBLookupComboBox
        Left = 340
        Top = 96
        Width = 151
        Height = 21
        DataField = 'descDistrito'
        DataSource = dsResponsavel
        TabOrder = 15
        TabStop = False
        OnKeyPress = dbNomeKeyPress
      end
      object DBLookupComboBox33: TDBLookupComboBox
        Left = 230
        Top = 96
        Width = 106
        Height = 21
        DataField = 'descProvincia'
        DataSource = dsResponsavel
        DropDownWidth = 150
        TabOrder = 16
        OnKeyPress = dbNomeKeyPress
      end
      object DBLookupComboBox34: TDBLookupComboBox
        Left = 108
        Top = 93
        Width = 116
        Height = 21
        DataField = 'descPaisAtual'
        DataSource = dsResponsavel
        DropDownWidth = 150
        TabOrder = 17
        OnKeyPress = dbNomeKeyPress
      end
      object DBEdit16: TDBEdit
        Left = 6
        Top = 96
        Width = 75
        Height = 21
        DataField = 'ds_cep'
        DataSource = dsResponsavel
        TabOrder = 18
        OnKeyPress = dbNomeKeyPress
      end
      object DBLookupComboBox35: TDBLookupComboBox
        Left = 6
        Top = 136
        Width = 105
        Height = 21
        DataField = 'desLogradouro'
        DataSource = dsResponsavel
        DropDownWidth = 150
        TabOrder = 19
        OnKeyPress = dbNomeKeyPress
      end
      object DBEdit31: TDBEdit
        Left = 118
        Top = 136
        Width = 276
        Height = 21
        DataField = 'ds_logradouro'
        DataSource = dsResponsavel
        TabOrder = 20
        OnKeyPress = dbNomeKeyPress
      end
      object DBEdit32: TDBEdit
        Left = 400
        Top = 136
        Width = 65
        Height = 21
        DataField = 'ds_logradouro_nro'
        DataSource = dsResponsavel
        TabOrder = 21
        OnKeyPress = dbNomeKeyPress
      end
      object DBEdit33: TDBEdit
        Left = 472
        Top = 136
        Width = 181
        Height = 21
        DataField = 'ds_complemento'
        DataSource = dsResponsavel
        TabOrder = 22
        OnKeyPress = dbComplementoKeyPress
      end
    end
    object tsRespFinanceiro: TTabSheet
      Caption = 'RESP. FINANCEIRO'
      ImageIndex = 3
      object Label72: TLabel
        Left = 6
        Top = 0
        Width = 28
        Height = 13
        Caption = 'Nome'
        FocusControl = dbNomeRespFinan
      end
      object Label78: TLabel
        Left = 337
        Top = 0
        Width = 24
        Height = 13
        Caption = 'Sexo'
      end
      object Label80: TLabel
        Left = 561
        Top = 0
        Width = 82
        Height = 13
        Caption = 'Data Nascimento'
        FocusControl = DBEdit35
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
      end
      object Label101: TLabel
        Left = 6
        Top = 232
        Width = 85
        Height = 13
        Caption = 'Nome do Conjuge'
        FocusControl = DBEdit52
      end
      object Label102: TLabel
        Left = 6
        Top = 272
        Width = 61
        Height = 13
        Caption = 'Nome do Pai'
        FocusControl = DBEdit53
      end
      object Label103: TLabel
        Left = 6
        Top = 312
        Width = 67
        Height = 13
        Caption = 'Nome da M'#227'e'
        FocusControl = DBEdit54
      end
      object Label79: TLabel
        Left = 422
        Top = 0
        Width = 55
        Height = 13
        Caption = 'Estado Civil'
      end
      object SpeedButton8: TSpeedButton
        Left = 86
        Top = 96
        Width = 20
        Height = 22
        Hint = 'Copiar o Endere'#231'o do Aluno'
        Caption = '...'
        Flat = True
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        NumGlyphs = 2
        ParentFont = False
        ParentShowHint = False
        ShowHint = True
        OnClick = sbCopiarAlunoClick
      end
      object Label118: TLabel
        Left = 6
        Top = 40
        Width = 53
        Height = 13
        Caption = 'Pa'#237's Nasc.'
      end
      object Label119: TLabel
        Left = 126
        Top = 40
        Width = 75
        Height = 13
        Caption = 'Provincia Nasc.'
        FocusControl = DBLookupComboBox37
      end
      object Label120: TLabel
        Left = 257
        Top = 40
        Width = 63
        Height = 13
        Caption = 'Distrito Nasc.'
        Transparent = True
      end
      object Label125: TLabel
        Left = 463
        Top = 40
        Width = 52
        Height = 13
        Caption = 'Localidade'
      end
      object Label126: TLabel
        Left = 498
        Top = 80
        Width = 52
        Height = 13
        Caption = 'Localidade'
      end
      object Label127: TLabel
        Left = 339
        Top = 80
        Width = 32
        Height = 13
        Caption = 'Distrito'
      end
      object Label128: TLabel
        Left = 231
        Top = 80
        Width = 44
        Height = 13
        Caption = 'Provincia'
        FocusControl = DBLookupComboBox42
      end
      object Label132: TLabel
        Left = 108
        Top = 80
        Width = 22
        Height = 13
        Caption = 'Pa'#237's'
      end
      object Label134: TLabel
        Left = 6
        Top = 80
        Width = 65
        Height = 13
        Caption = 'C'#243'digo Postal'
        FocusControl = DBEdit34
      end
      object Label135: TLabel
        Left = 6
        Top = 120
        Width = 60
        Height = 13
        Caption = 'Tipo Morada'
        FocusControl = DBEdit36
      end
      object Label136: TLabel
        Left = 118
        Top = 120
        Width = 36
        Height = 13
        Caption = 'Morada'
        FocusControl = DBEdit36
      end
      object Label137: TLabel
        Left = 400
        Top = 120
        Width = 37
        Height = 13
        Caption = 'N'#250'mero'
        FocusControl = DBEdit37
      end
      object Label138: TLabel
        Left = 471
        Top = 120
        Width = 64
        Height = 13
        Caption = 'Complemento'
        FocusControl = DBEdit38
      end
      object dbNomeRespFinan: TDBEdit
        Left = 6
        Top = 16
        Width = 326
        Height = 21
        DataField = 'nm_pessoa'
        DataSource = dsResponsavel
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
        TabOrder = 0
        OnExit = dbNomeRespFinanExit
        OnKeyPress = dbNomeKeyPress
      end
      object DBComboBox7: TDBComboBox
        Left = 338
        Top = 16
        Width = 81
        Height = 22
        Style = csOwnerDrawFixed
        DataField = 'ds_sexo'
        DataSource = dsResponsavel
        ItemHeight = 16
        Items.Strings = (
          'Masculino'
          'Feminino')
        TabOrder = 1
        OnKeyPress = dbNomeKeyPress
      end
      object DBEdit35: TDBEdit
        Left = 561
        Top = 16
        Width = 91
        Height = 21
        DataField = 'dt_nascimento'
        DataSource = dsResponsavel
        TabOrder = 3
        OnKeyPress = dbNomeKeyPress
      end
      object pgDocFinan: TPageControl
        Left = 1
        Top = 163
        Width = 761
        Height = 68
        ActivePage = TabSheet12
        MultiLine = True
        Style = tsFlatButtons
        TabOrder = 4
        object TabSheet12: TTabSheet
          Caption = 'Documenta'#231#227'o'
          object Label88: TLabel
            Left = 1
            Top = 0
            Width = 70
            Height = 13
            Caption = 'N. Contribuinte'
            FocusControl = dbCPFFinan
          end
          object Label89: TLabel
            Left = 160
            Top = 0
            Width = 100
            Height = 13
            Caption = 'Bilhete de Identidade'
            FocusControl = DBEdit43
          end
          object Label91: TLabel
            Left = 473
            Top = 0
            Width = 88
            Height = 13
            Caption = 'Data de Expira'#231#227'o'
            FocusControl = DBEdit45
          end
          object sbMaisInformacoesFinanceiro: TSpeedButton
            Left = 600
            Top = 8
            Width = 145
            Height = 25
            Caption = 'Mais Informa'#231#245'es >>'
            Flat = True
            NumGlyphs = 2
            OnClick = sbMaisInformacoesFinanceiroClick
          end
          object Label61: TLabel
            Left = 319
            Top = 0
            Width = 110
            Height = 13
            Caption = 'Sector de Identifica'#231#227'o'
          end
          object dbCPFFinan: TDBEdit
            Left = 1
            Top = 16
            Width = 149
            Height = 21
            DataField = 'ds_cpf'
            DataSource = dsResponsavel
            TabOrder = 0
            OnKeyPress = dbNomeKeyPress
          end
          object DBEdit43: TDBEdit
            Left = 160
            Top = 16
            Width = 150
            Height = 21
            DataField = 'ds_identidade'
            DataSource = dsResponsavel
            TabOrder = 1
            OnKeyPress = dbNomeKeyPress
          end
          object DBEdit45: TDBEdit
            Left = 473
            Top = 16
            Width = 113
            Height = 21
            DataField = 'dt_identidade_expedicao'
            DataSource = dsResponsavel
            TabOrder = 2
            OnKeyPress = dbNomeKeyPress
          end
          object DBEdit23: TDBEdit
            Left = 319
            Top = 16
            Width = 145
            Height = 21
            DataField = 'ds_identidade_orgao_exp'
            DataSource = dsResponsavel
            TabOrder = 3
          end
        end
        object TabSheet8: TTabSheet
          Caption = 'Complementares'
          ImageIndex = 4
          object Label206: TLabel
            Left = 3
            Top = 1
            Width = 72
            Height = 13
            Caption = 'Cargo/Fun'#231#227'o:'
            FocusControl = DBEdit30
          end
          object DBEdit30: TDBEdit
            Left = 2
            Top = 16
            Width = 310
            Height = 21
            DataField = 'ds_cargo'
            DataSource = dsResponsavel
            TabOrder = 0
            OnKeyPress = dbNomeKeyPress
          end
        end
      end
      object DBEdit52: TDBEdit
        Left = 6
        Top = 248
        Width = 363
        Height = 21
        DataField = 'nm_conjuge'
        DataSource = dsResponsavel
        TabOrder = 5
        OnKeyPress = dbNomeKeyPress
      end
      object DBEdit53: TDBEdit
        Left = 6
        Top = 288
        Width = 363
        Height = 21
        DataField = 'nm_pai'
        DataSource = dsResponsavel
        TabOrder = 6
        OnKeyPress = dbNomeKeyPress
      end
      object DBEdit54: TDBEdit
        Left = 6
        Top = 328
        Width = 363
        Height = 21
        DataField = 'nm_mae'
        DataSource = dsResponsavel
        TabOrder = 7
        OnKeyPress = dbNomeKeyPress
      end
      object DBGrid2: TDBGrid
        Left = 376
        Top = 231
        Width = 377
        Height = 118
        BorderStyle = bsNone
        DataSource = dsContatoResponsavel
        Options = [dgEditing, dgTitles, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgConfirmDelete, dgCancelOnExit]
        PopupMenu = popContatoResp
        TabOrder = 8
        TitleFont.Charset = DEFAULT_CHARSET
        TitleFont.Color = clWindowText
        TitleFont.Height = -11
        TitleFont.Name = 'MS Sans Serif'
        TitleFont.Style = []
        OnExit = DBGrid1Exit
        OnKeyDown = DBGrid1KeyDown
        Columns = <
          item
            Expanded = False
            FieldName = 'descContato'
            Title.Caption = 'Tipo Contato'
            Width = 105
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'ds_contato'
            Title.Caption = 'Descri'#231#227'o do Contato'
            Width = 250
            Visible = True
          end>
      end
      object Panel6: TPanel
        Left = 658
        Top = 15
        Width = 107
        Height = 122
        TabOrder = 9
        object imageFotoResp: TImage
          Left = 1
          Top = 1
          Width = 105
          Height = 120
          Align = alClient
          Stretch = True
        end
        object lbFotoResp: TLabel
          Left = 36
          Top = 52
          Width = 35
          Height = 16
          Caption = 'FOTO'
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          ParentFont = False
          Transparent = True
          Visible = False
        end
      end
      object DBLookupComboBox9: TDBLookupComboBox
        Left = 422
        Top = 16
        Width = 135
        Height = 21
        DataField = 'descEstadoCivil'
        DataSource = dsResponsavel
        TabOrder = 2
        OnKeyPress = dbNomeKeyPress
      end
      object DBLookupComboBox36: TDBLookupComboBox
        Left = 6
        Top = 55
        Width = 113
        Height = 21
        DataField = 'descPaisNasc'
        DataSource = dsResponsavel
        DropDownWidth = 150
        TabOrder = 10
        OnKeyPress = dbNomeKeyPress
      end
      object DBLookupComboBox37: TDBLookupComboBox
        Left = 125
        Top = 55
        Width = 126
        Height = 21
        DataField = 'descProvinciaNasc'
        DataSource = dsResponsavel
        TabOrder = 11
        OnKeyPress = dbNomeKeyPress
      end
      object DBLookupComboBox38: TDBLookupComboBox
        Left = 257
        Top = 55
        Width = 202
        Height = 21
        DataField = 'descDistritoNasc'
        DataSource = dsResponsavel
        TabOrder = 12
        OnKeyPress = dbNomeKeyPress
      end
      object DBLookupComboBox39: TDBLookupComboBox
        Left = 463
        Top = 53
        Width = 189
        Height = 21
        DataField = 'descLocalidadeNasc'
        DataSource = dsResponsavel
        TabOrder = 13
        OnKeyPress = dbNomeKeyPress
      end
      object DBLookupComboBox40: TDBLookupComboBox
        Left = 498
        Top = 93
        Width = 155
        Height = 21
        DataField = 'descLocalidade'
        DataSource = dsResponsavel
        TabOrder = 14
        TabStop = False
        OnKeyPress = dbNomeKeyPress
      end
      object DBLookupComboBox41: TDBLookupComboBox
        Left = 340
        Top = 96
        Width = 151
        Height = 21
        DataField = 'descDistrito'
        DataSource = dsResponsavel
        TabOrder = 15
        TabStop = False
        OnKeyPress = dbNomeKeyPress
      end
      object DBLookupComboBox42: TDBLookupComboBox
        Left = 230
        Top = 96
        Width = 106
        Height = 21
        DataField = 'descProvincia'
        DataSource = dsResponsavel
        DropDownWidth = 150
        TabOrder = 16
        OnKeyPress = dbNomeKeyPress
      end
      object DBLookupComboBox43: TDBLookupComboBox
        Left = 108
        Top = 96
        Width = 116
        Height = 21
        DataField = 'descPaisAtual'
        DataSource = dsResponsavel
        DropDownWidth = 150
        TabOrder = 17
        OnKeyPress = dbNomeKeyPress
      end
      object DBEdit34: TDBEdit
        Left = 6
        Top = 96
        Width = 75
        Height = 21
        DataField = 'ds_cep'
        DataSource = dsResponsavel
        TabOrder = 18
        OnKeyPress = dbNomeKeyPress
      end
      object DBLookupComboBox44: TDBLookupComboBox
        Left = 7
        Top = 136
        Width = 105
        Height = 21
        DataField = 'desLogradouro'
        DataSource = dsResponsavel
        DropDownWidth = 150
        TabOrder = 19
        OnKeyPress = dbNomeKeyPress
      end
      object DBEdit36: TDBEdit
        Left = 118
        Top = 136
        Width = 276
        Height = 21
        DataField = 'ds_logradouro'
        DataSource = dsResponsavel
        TabOrder = 20
        OnKeyPress = dbNomeKeyPress
      end
      object DBEdit37: TDBEdit
        Left = 400
        Top = 136
        Width = 65
        Height = 21
        DataField = 'ds_logradouro_nro'
        DataSource = dsResponsavel
        TabOrder = 21
        OnKeyPress = dbNomeKeyPress
      end
      object DBEdit38: TDBEdit
        Left = 472
        Top = 136
        Width = 181
        Height = 21
        DataField = 'ds_complemento'
        DataSource = dsResponsavel
        TabOrder = 22
        OnKeyPress = dbComplementoKeyPress
      end
    end
    object tsMatricula: TTabSheet
      Caption = 'MATR'#205'CULAS'
      ImageIndex = 4
      object Bevel1: TBevel
        Left = 386
        Top = 0
        Width = 8
        Height = 459
        Align = alLeft
        Shape = bsSpacer
        ExplicitHeight = 386
      end
      object Panel7: TPanel
        Left = 0
        Top = 0
        Width = 386
        Height = 459
        Align = alLeft
        BevelOuter = bvNone
        TabOrder = 0
        object DBGrid3: TDBGrid
          Left = 0
          Top = 25
          Width = 386
          Height = 324
          Align = alClient
          BorderStyle = bsNone
          DataSource = dsMatriculasCurso
          Options = [dgTitles, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgAlwaysShowSelection, dgConfirmDelete, dgCancelOnExit]
          TabOrder = 0
          TitleFont.Charset = DEFAULT_CHARSET
          TitleFont.Color = clWindowText
          TitleFont.Height = -11
          TitleFont.Name = 'MS Sans Serif'
          TitleFont.Style = []
          OnDblClick = DBGrid3DblClick
          OnKeyDown = DBGrid3KeyDown
          Columns = <
            item
              Expanded = False
              FieldName = 'descricao'
              Width = 310
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'nr_anosem_ingresso'
              Width = 48
              Visible = True
            end>
        end
        object Panel8: TPanel
          Left = 0
          Top = 349
          Width = 386
          Height = 110
          Align = alBottom
          BevelOuter = bvNone
          TabOrder = 1
          object Label71: TLabel
            Left = 44
            Top = 8
            Width = 33
            Height = 13
            Alignment = taRightJustify
            Caption = 'Curso: '
          end
          object Label104: TLabel
            Left = 8
            Top = 43
            Width = 69
            Height = 13
            Alignment = taRightJustify
            Caption = 'Data Ingresso:'
          end
          object Label105: TLabel
            Left = 1
            Top = 25
            Width = 76
            Height = 13
            Alignment = taRightJustify
            Caption = 'Institui'#231#227'o Orig.:'
          end
          object DBText3: TDBText
            Left = 83
            Top = 8
            Width = 300
            Height = 13
            DataField = 'descricao'
            DataSource = dsMatriculasCurso
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = [fsBold]
            ParentFont = False
          end
          object DBText4: TDBText
            Left = 83
            Top = 43
            Width = 87
            Height = 17
            DataField = 'dt_ingresso'
            DataSource = dsMatriculasCurso
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = [fsBold]
            ParentFont = False
          end
          object DBText5: TDBText
            Left = 83
            Top = 25
            Width = 300
            Height = 17
            DataField = 'descInstituicao'
            DataSource = dsMatriculasCurso
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = [fsBold]
            ParentFont = False
          end
          object Label208: TLabel
            Left = -1
            Top = 61
            Width = 78
            Height = 13
            Alignment = taRightJustify
            Caption = 'N'#186' de Matr'#237'cula:'
          end
          object Label209: TLabel
            Left = 221
            Top = 43
            Width = 58
            Height = 13
            Alignment = taRightJustify
            Caption = 'Data Sa'#237'da:'
          end
          object DBText6: TDBText
            Left = 285
            Top = 43
            Width = 91
            Height = 17
            DataField = 'dt_saida'
            DataSource = dsMatriculasCurso
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = [fsBold]
            ParentFont = False
          end
          object DBText7: TDBText
            Left = 83
            Top = 61
            Width = 105
            Height = 17
            DataField = 'nr_matricula'
            DataSource = dsMatriculasCurso
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = [fsBold]
            ParentFont = False
          end
          object sbHistorico: TSpeedButton
            Left = 0
            Top = 80
            Width = 134
            Height = 27
            Caption = 'Hist'#243'rico anterior'
            Flat = True
            Glyph.Data = {
              36040000424D3604000000000000360000002800000010000000100000000100
              2000000000000004000000000000000000000000000000000000000000000000
              000000000000E0DEDD0130303009242525332526266627282881272828812526
              26662526263331313109DCD9D901000000000000000000000000000000000000
              00007272721F888889854F5050AC313131E22C2D2DFA2C2D2DFE2C2D2DFE2C2D
              2DFA313232E2515151AC888888857171711F0000000000000000000000000000
              0000414141523C3C3DFA323232FF313131FF2D2E2EFF2C2D2DFF2C2D2DFF2D2E
              2EFF313132FF333333FF3C3C3CFB3F3F3F550000000000000000000000000000
              00002E2E2E472E2E2FF82F2F30FF2E2E2EFF343434FF444445FF444445FF3434
              34FF2E2E2EFF2F3030FF2E2E2FF82D2D2E470000000000000000000000000000
              00003130313A302F30F3333333FF6D6D6EFFBDBDBDFFD2D2D2FFD2D2D2FFBDBD
              BDFF6D6D6EFF333333FF302F30F33130313A0000000000000000000000000000
              00002B2A2B18414041C4949495FFF1F1F1FFFAFAFAFFD3D5D7FFD2D5D7FFFCFC
              FCFFF1F1F1FF949495FF414041C42B2A2B180000000000000000000000000000
              00000000000098979824EEEEEE7EF4F4F4D3DDE0E2F1AACEEBFFA8CCEBFFE1E4
              E6F2F5F5F5D3EEEEEE7E98979824000000000000000000000000000000000000
              00000000000000000000DADEE201F9E8DB1587B2D47E86BBE6FF86BBE6FF86B2
              D484FCEBDE15D4D9DD0100000000000000000000000000000000000000000000
              000000000000000000000000000043A6DC1B5EB3DBB68AC6F8FF8BC6FAFF6EB6
              F3B44AA5EF1A0000000000000000000000000000000000000000000000000000
              00000000000000000000000000005BB0EA9076C2E4FF7AC8FDFF79C7FEFF6CBD
              F9FF59AFEF900000000000000000000000000000000000000000000000000000
              00000000000000000000000000003D7A9E8958B6D3FF67B9E6FF68B9E7FF63B6
              E7FF4984AB8D0000000000000000000000000000000000000000000000000000
              000000000000000000000000000023373C553E7E89FC3B4C53FF3B4951FF3A50
              5DFB272E36540000000000000000000000000000000000000000000000000000
              00000000000025252B102C2C2E632E3133CB576E70FF383938FF353434FF3331
              31FF2A292BC82C2C2F6124242A0F000000000000000000000000000000000000
              0000000000003131361E3F3F41A4383B3CF7496065FF424444FF414142FF3B3B
              3CFF373738F63F3F41A12F2F341C000000000000000000000000000000000000
              0000000000000000000068686D095357594E4D5F63C0393A3AFA393939F94343
              44BA5151534C67676D0800000000000000000000000000000000000000000000
              0000000000000000000000000000000000005B737616515153715151536E6060
              6412000000000000000000000000000000000000000000000000}
            OnClick = sbHistoricoClick
          end
        end
        object Panel9: TPanel
          Left = 0
          Top = 0
          Width = 386
          Height = 25
          Align = alTop
          BevelOuter = bvNone
          Caption = 'MATR'#205'CULAS NO CURSO'
          Color = clBlue
          Font.Charset = ANSI_CHARSET
          Font.Color = clWhite
          Font.Height = -12
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          ParentFont = False
          TabOrder = 2
        end
      end
      object Panel10: TPanel
        Left = 394
        Top = 0
        Width = 593
        Height = 459
        Align = alClient
        BevelOuter = bvNone
        TabOrder = 1
        object Panel11: TPanel
          Left = 0
          Top = 0
          Width = 593
          Height = 25
          Align = alTop
          BevelOuter = bvNone
          Caption = 'MATR'#205'CULAS NAS ETAPAS'
          Color = clBlue
          Font.Charset = ANSI_CHARSET
          Font.Color = clWhite
          Font.Height = -12
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          ParentFont = False
          TabOrder = 0
        end
        object DBGrid4: TDBGrid
          Left = 0
          Top = 25
          Width = 593
          Height = 434
          Align = alClient
          BorderStyle = bsNone
          DataSource = dsMatriculasEtapa
          Options = [dgTitles, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgAlwaysShowSelection, dgConfirmDelete, dgCancelOnExit]
          TabOrder = 1
          TitleFont.Charset = DEFAULT_CHARSET
          TitleFont.Color = clWindowText
          TitleFont.Height = -11
          TitleFont.Name = 'MS Sans Serif'
          TitleFont.Style = []
          OnDblClick = DBGrid4DblClick
          Columns = <
            item
              Expanded = False
              FieldName = 'anosemestre'
              Title.Caption = 'Ano/Sem.'
              Width = 52
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'turma'
              Title.Caption = 'Turma'
              Width = 130
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'ds_situacao'
              Title.Caption = 'Situa'#231#227'o'
              Width = 100
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'ds_ingresso'
              Title.Caption = 'Forma de Ingresso'
              Visible = True
            end>
        end
      end
    end
  end
  object toolAcademico: TToolBar [4]
    Left = 0
    Top = 540
    Width = 995
    Height = 25
    Align = alBottom
    ButtonWidth = 85
    Caption = 'ToolBar1'
    EdgeBorders = [ebTop, ebBottom]
    Images = ImageList1
    List = True
    ShowCaptions = True
    TabOrder = 2
    Visible = False
    object ToolButton3: TToolButton
      Left = 0
      Top = 0
      Width = 8
      Caption = 'ToolButton1'
      ImageIndex = 9
      Style = tbsSeparator
    end
    object btAcad_Novo: TToolButton
      Left = 8
      Top = 0
      Caption = 'Novo Cad.'
      ImageIndex = 0
      OnClick = btAcad_NovoClick
    end
    object btAcad_Busca: TToolButton
      Left = 93
      Top = 0
      Caption = 'Buscar Cad.'
      ImageIndex = 5
      OnClick = btAcad_BuscaClick
    end
    object ToolButton16: TToolButton
      Left = 178
      Top = 0
      Width = 8
      Caption = 'ToolButton9'
      ImageIndex = 6
      Style = tbsSeparator
    end
    object btAcad_Aluno: TToolButton
      Left = 186
      Top = 0
      Caption = '= Aluno'
      ImageIndex = 8
      OnClick = btAcad_AlunoClick
    end
    object btAcad_Pai: TToolButton
      Left = 271
      Top = 0
      Caption = '= Pai'
      ImageIndex = 8
      OnClick = btAcad_PaiClick
    end
    object btAcad_Mae: TToolButton
      Left = 356
      Top = 0
      Caption = '= M'#227'e'
      ImageIndex = 8
      OnClick = btAcad_MaeClick
    end
    object ToolButton10: TToolButton
      Left = 441
      Top = 0
      Width = 8
      Caption = 'ToolButton4'
      ImageIndex = 3
      Style = tbsSeparator
    end
    object btAcad_Salvar: TToolButton
      Left = 449
      Top = 0
      Caption = 'F5 Salvar'
      ImageIndex = 3
      OnClick = btAcad_SalvarClick
    end
    object ToolButton9: TToolButton
      Left = 534
      Top = 0
      Width = 8
      Caption = 'ToolButton9'
      ImageIndex = 9
      Style = tbsSeparator
    end
    object btAcad_Cancelar: TToolButton
      Left = 542
      Top = 0
      Caption = 'F6 Cancelar'
      ImageIndex = 4
      OnClick = btAcad_CancelarClick
    end
    object ToolButton18: TToolButton
      Left = 627
      Top = 0
      Width = 8
      Caption = 'ToolButton11'
      ImageIndex = 7
      Style = tbsSeparator
    end
    object btDesvincular: TToolButton
      Left = 635
      Top = 0
      Caption = 'Desvincular'
      ImageIndex = 8
      Visible = False
      OnClick = btDesvincularClick
    end
    object btAcad_Fechar: TToolButton
      Left = 720
      Top = 0
      Caption = 'F12 Fechar'
      ImageIndex = 7
      OnClick = btAcad_FecharClick
    end
    object ToolButton20: TToolButton
      Left = 805
      Top = 0
      Width = 8
      Caption = 'ToolButton2'
      ImageIndex = 8
      Style = tbsSeparator
    end
  end
  object toolMatricula: TToolBar [5]
    Left = 0
    Top = 565
    Width = 995
    Height = 25
    Align = alBottom
    ButtonWidth = 139
    Caption = 'toolFinanceiro'
    EdgeBorders = [ebTop, ebBottom]
    Images = ImageList1
    List = True
    ShowCaptions = True
    TabOrder = 4
    Visible = False
    Wrapable = False
    object ToolButton5: TToolButton
      Left = 0
      Top = 0
      Width = 8
      Caption = 'ToolButton1'
      ImageIndex = 9
      Style = tbsSeparator
    end
    object btnMatricular: TToolButton
      Left = 8
      Top = 0
      AutoSize = True
      Caption = 'Matricular'
      ImageIndex = 0
      OnClick = btnMatricularClick
    end
    object ToolButton7: TToolButton
      Left = 85
      Top = 0
      AutoSize = True
      Caption = 'Rematricular'
      ImageIndex = 0
      OnClick = ToolButton7Click
    end
    object ToolButton12: TToolButton
      Left = 175
      Top = 0
      Width = 8
      Caption = 'ToolButton9'
      ImageIndex = 6
      Style = tbsSeparator
    end
    object btnDocumentos: TToolButton
      Left = 183
      Top = 0
      AutoSize = True
      Caption = 'Documentos'
      ImageIndex = 1
      OnClick = btnDocumentosClick
    end
    object ToolButton19: TToolButton
      Left = 274
      Top = 0
      Width = 8
      Caption = 'ToolButton4'
      ImageIndex = 3
      Style = tbsSeparator
    end
    object btnOrientacao: TToolButton
      Left = 282
      Top = 0
      AutoSize = True
      Caption = 'Orienta'#231#227'o Pedag'#243'gica'
      ImageIndex = 1
      OnClick = btnOrientacaoClick
    end
    object btnFinanceiro: TToolButton
      Left = 425
      Top = 0
      AutoSize = True
      Caption = 'Financeiro'
      ImageIndex = 9
      OnClick = btnFinanceiroClick
    end
    object btn_Imprimir: TToolButton
      Left = 505
      Top = 0
      AutoSize = True
      Caption = 'F7 Imprimir'
      ImageIndex = 6
      OnClick = btImprimir_PessoaClick
    end
    object btnFechar: TToolButton
      Left = 586
      Top = 0
      AutoSize = True
      Caption = 'F12 Fechar'
      ImageIndex = 7
      OnClick = btFin_FecharClick
    end
  end
  inherited ImageList1: TImageList
    Top = 376
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
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000FFFF0000FFFF000084840000FFFF000084
      8400000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000006B6B6B006B6B6B006B6B
      6B006B6B6B006B6B6B0000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000008484000000000000FFFF0000FFFF000084840000848400000000000084
      8400008484000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000B5523100D64A2100E75A3900FF63
      5200FF635200D64A2100A53918006B524A006B6B6B006B6B6B006B6B6B006B6B
      6B006B6B6B006B6B6B006B6B6B00000000000000000000000000000000000084
      84000000000000FFFF0000FFFF000000000000FFFF000084840000FFFF000084
      8400008484000084840000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000C6421000EF5A4200FF735A00FF7B
      6300C6522900D68C5200FF6B5200EF5A420042B54200299C290052C652004ABD
      4A0039B5390029AD290018731800000000000000000000000000000000000084
      84000084840000FFFF0000FFFF0000FFFF0000FFFF0000848400008484000084
      8400008484000084840000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000CE5A2900FF6B5A00FF846B00EF84
      5A00FFDEA500FFDEA500FF846B00FF6352006BCE6B00BDDEAD004A9C42006BCE
      6B0052C6520039B539001873180000000000000000000000000000FFFF000084
      840000FFFF000084840000FFFF0000FFFF000084840000FFFF0000FFFF000084
      840000FFFF000084840000848400000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000D6633100FF8C6B00EF9C
      7B00BD8C8400FFBD9400FF8C7300B54218007BD67B00000000000000000063C6
      63006BCE6B00299C29000000000000000000000000000000000000FFFF000084
      840000FFFF00008484000084840000FFFF0000FFFF0000FFFF0000FFFF0000FF
      FF00008484000084840000848400000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000004A4A4A00000000000821
      7B001029940000187B00635A5A00399C39008CE78C00DED6BD00398CB5009CB5
      A50042A54200000000000000000000000000000000000000000000FFFF000084
      840000FFFF00008484000084840000FFFF0000FFFF0000FFFF0000FFFF0000FF
      FF000084840000FFFF0000848400000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000181818001010100008296B00184A
      AD00184AB500184AAD0008186B0000000000000000002994F7002994F7002994
      F700105A8C006B6B6B000000000000000000000000000000000000FFFF000084
      840000FFFF0000848400008484000084840000FFFF0000FFFF000000000000FF
      FF00008484000084840000FFFF00000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000018181800212121002163C600216B
      CE00216BD6002163CE0010429C0000000000218CE70039A5FF0039A5FF0039A5
      FF00319CFF005A6363000000000000000000000000000000000000FFFF000084
      84000084840000848400008484000084840000FFFF0000FFFF0000FFFF000084
      840000FFFF000084840000FFFF00000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000029292900313131002163B500298C
      F7003194FF00298CF700185AC6000000000042ADFF004AB5FF004AB5FF004AAD
      FF0042ADFF00216384000000000000000000000000000000000000FFFF0000FF
      FF00008484000084840000848400008484000084840000848400008484000084
      840000FFFF0000FFFF0000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000001818180042424200292929001042
      9C00216BDE003194F700105AA5000000000052B5FF0052BDFF0052BDFF0052BD
      FF004AB5FF00107BBD00000000000000000000000000000000000000000000FF
      FF00008484000084840000FFFF000084840000848400008484000084840000FF
      FF0000FFFF000084840000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000052525200636363009494
      940073737300292929003939390000000000107BBD002184C600398CB5001884
      CE002184C60010638C00000000000000000000000000000000000000000000FF
      FF0000FFFF00008484000084840000848400008484000000000000FFFF0000FF
      FF0000FFFF000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000636363009494
      94006B6B6B002929290000000000000000001073A50052ADD60084C6E7009CCE
      E7003994C6000000000000000000000000000000000000000000000000000000
      000000FFFF0000FFFF00008484000084840000FFFF000084840000FFFF0000FF
      FF00000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000001073A5001073A5001073
      A500000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000FFFF00008484000084840000848400008484000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
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
      00000000000000000000000000000000FFFFFE0F00000000FFFFF00700000000
      83FFE003000000000001C001000000000001C001000000000001800000000000
      8063800000000000800780000000000001838000000000000103800000000000
      01038001000000000103C001000000008103C00300000000C307E00700000000
      FF8FF00F00000000FFFFFC1F00000000FFFFF8F8FFFFFFFFF83FFAFAFC7FE3FF
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
  inherited tblPessoa: TUMZQuery
    Left = 891
    Top = 132
    inherited tblPessoacd_pessoa: TIntegerField
      DisplayFormat = '000000-0'
      EditFormat = '0000000'
    end
    object tblPessoacd_mae: TLargeintField [81]
      FieldName = 'cd_mae'
    end
    object tblPessoacd_pai: TLargeintField [82]
      FieldName = 'cd_pai'
    end
    object tblPessoasn_obito: TIntegerField
      FieldName = 'sn_obito'
    end
    object tblPessoads_profissao: TStringField
      FieldName = 'ds_profissao'
      Size = 255
    end
    object tblPessoads_formacao_academica: TStringField
      FieldName = 'ds_formacao_academica'
      Size = 255
    end
  end
  inherited dsPessoa: TDataSource
    Left = 923
    Top = 132
  end
  inherited dsContatoPessoa: TDataSource
    Left = 925
    Top = 99
  end
  inherited tblEstadosCivis: TZTable
    Left = 184
    Top = 48
  end
  inherited tblContatoPessoa: TUMZQuery
    Left = 894
    Top = 99
  end
  inherited pmContatos: TPopupMenu
    Left = 716
  end
  inherited tblTpLogradouro: TUMZQuery
    Left = 216
    Top = 48
  end
  inherited tblMunicipios: TUMZQuery
    Left = 248
    Top = 48
  end
  inherited tblMunicipioAtual: TUMZQuery
    Top = 40
  end
  inherited tblOrgaos: TZTable
    Top = 40
  end
  inherited tblPais: TUMZQuery
    Left = 880
    Top = 24
  end
  inherited qyTemp1: TUMZQuery
    Left = 416
    Top = 280
  end
  object tblResponsavel: TUMZQuery [27]
    Connection = DM.db
    AfterOpen = tblResponsavelAfterOpen
    AfterInsert = tblResponsavelAfterInsert
    BeforePost = tblResponsavelBeforePost
    OnNewRecord = tblResponsavelNewRecord
    SQL.Strings = (
      'select * from pessoas where cd_pessoa = :cd_responsavel')
    Params = <
      item
        DataType = ftInteger
        Name = 'cd_responsavel'
        ParamType = ptUnknown
      end>
    Left = 427
    Top = 65532
    ParamData = <
      item
        DataType = ftInteger
        Name = 'cd_responsavel'
        ParamType = ptUnknown
      end>
    object tblResponsavelcd_pessoa: TIntegerField
      FieldName = 'cd_pessoa'
      Origin = 'WMESTRE12.pessoas.cd_pessoa'
    end
    object tblResponsavelcd_resp_finan: TIntegerField
      FieldName = 'cd_resp_finan'
      Origin = 'WMESTRE12.pessoas.cd_resp_finan'
    end
    object tblResponsavelcd_resp_acad: TIntegerField
      FieldName = 'cd_resp_acad'
      Origin = 'WMESTRE12.pessoas.cd_resp_acad'
    end
    object tblResponsavelnm_pessoa: TStringField
      FieldName = 'nm_pessoa'
      Origin = 'WMESTRE12.pessoas.nm_pessoa'
      Size = 60
    end
    object tblResponsavelds_cidade_nascimento: TStringField
      FieldName = 'ds_cidade_nascimento'
      Origin = 'WMESTRE12.pessoas.ds_cidade_nascimento'
      Size = 50
    end
    object tblResponsavelds_estado_nascimento: TStringField
      FieldName = 'ds_estado_nascimento'
      Origin = 'WMESTRE12.pessoas.ds_estado_nascimento'
      FixedChar = True
      Size = 3
    end
    object tblResponsavelds_pais_nascimento: TStringField
      FieldName = 'ds_pais_nascimento'
      Origin = 'WMESTRE12.pessoas.ds_pais_nascimento'
      Size = 50
    end
    object tblResponsavelds_logradouro: TStringField
      FieldName = 'ds_logradouro'
      Origin = 'WMESTRE12.pessoas.ds_logradouro'
      Size = 80
    end
    object tblResponsavelds_logradouro_nro: TStringField
      FieldName = 'ds_logradouro_nro'
      Origin = 'WMESTRE12.pessoas.ds_logradouro_nro'
      Size = 10
    end
    object tblResponsavelds_complemento: TStringField
      FieldName = 'ds_complemento'
      Origin = 'WMESTRE12.pessoas.ds_complemento'
      Size = 50
    end
    object tblResponsavelds_cep: TStringField
      FieldName = 'ds_cep'
      Origin = 'WMESTRE12.pessoas.ds_cep'
      EditMask = '00000\-000;0;_'
      Size = 8
    end
    object tblResponsavelds_bairro: TStringField
      FieldName = 'ds_bairro'
      Origin = 'WMESTRE12.pessoas.ds_bairro'
      Size = 50
    end
    object tblResponsavelds_cidade: TStringField
      FieldName = 'ds_cidade'
      Origin = 'WMESTRE12.pessoas.ds_cidade'
      Size = 50
    end
    object tblResponsavelds_estado: TStringField
      FieldName = 'ds_estado'
      Origin = 'WMESTRE12.pessoas.ds_estado'
      FixedChar = True
      Size = 3
    end
    object tblResponsavelds_pais: TStringField
      FieldName = 'ds_pais'
      Origin = 'WMESTRE12.pessoas.ds_pais'
      Size = 50
    end
    object tblResponsavelds_sexo: TStringField
      FieldName = 'ds_sexo'
      Origin = 'WMESTRE12.pessoas.ds_sexo'
      OnGetText = tblResponsavelds_sexoGetText
      OnSetText = tblResponsavelds_sexoSetText
      FixedChar = True
      Size = 1
    end
    object tblResponsavelds_nacionalidade: TStringField
      FieldName = 'ds_nacionalidade'
      Origin = 'WMESTRE12.pessoas.ds_nacionalidade'
      Size = 50
    end
    object tblResponsavelds_identidade: TStringField
      FieldName = 'ds_identidade'
      Origin = 'WMESTRE12.pessoas.ds_identidade'
    end
    object tblResponsavelds_identidade_orgao_exp: TStringField
      FieldName = 'ds_identidade_orgao_exp'
      Origin = 'WMESTRE12.pessoas.ds_identidade_orgao_exp'
      Size = 10
    end
    object tblResponsavelds_cpf: TStringField
      FieldName = 'ds_cpf'
      Origin = 'WMESTRE12.pessoas.ds_cpf'
      EditMask = '000\.000\.000\-00;0;_'
      Size = 11
    end
    object tblResponsavelds_rm_corporacao: TStringField
      FieldName = 'ds_rm_corporacao'
      Origin = 'WMESTRE12.pessoas.ds_rm_corporacao'
    end
    object tblResponsavelds_rm_org_numero: TStringField
      FieldName = 'ds_rm_org_numero'
      Origin = 'WMESTRE12.pessoas.ds_rm_org_numero'
    end
    object tblResponsavelds_rm_doc_numero: TStringField
      FieldName = 'ds_rm_doc_numero'
      Origin = 'WMESTRE12.pessoas.ds_rm_doc_numero'
    end
    object tblResponsavelds_rm_orgao: TStringField
      FieldName = 'ds_rm_orgao'
      Origin = 'WMESTRE12.pessoas.ds_rm_orgao'
    end
    object tblResponsavelds_rm_doc_tipo: TStringField
      FieldName = 'ds_rm_doc_tipo'
      Origin = 'WMESTRE12.pessoas.ds_rm_doc_tipo'
    end
    object tblResponsavelds_titulo_numero: TStringField
      FieldName = 'ds_titulo_numero'
      Origin = 'WMESTRE12.pessoas.ds_titulo_numero'
    end
    object tblResponsavelds_titulo_secao: TStringField
      FieldName = 'ds_titulo_secao'
      Origin = 'WMESTRE12.pessoas.ds_titulo_secao'
      Size = 10
    end
    object tblResponsavelds_titulo_zona: TStringField
      FieldName = 'ds_titulo_zona'
      Origin = 'WMESTRE12.pessoas.ds_titulo_zona'
      Size = 10
    end
    object tblResponsavelnm_pai: TStringField
      FieldName = 'nm_pai'
      Origin = 'WMESTRE12.pessoas.nm_pai'
      Size = 80
    end
    object tblResponsavelnm_mae: TStringField
      FieldName = 'nm_mae'
      Origin = 'WMESTRE12.pessoas.nm_mae'
      Size = 80
    end
    object tblResponsavelnm_conjuge: TStringField
      FieldName = 'nm_conjuge'
      Origin = 'WMESTRE12.pessoas.nm_conjuge'
      Size = 80
    end
    object tblResponsavelcd_usuario: TIntegerField
      FieldName = 'cd_usuario'
      Origin = 'WMESTRE12.pessoas.cd_usuario'
    end
    object tblResponsavelnm_sem_acento: TStringField
      FieldName = 'nm_sem_acento'
      Origin = 'WMESTRE12.pessoas.nm_sem_acento'
      Size = 80
    end
    object tblResponsavelds_arquivo_documento: TStringField
      FieldName = 'ds_arquivo_documento'
      Origin = 'WMESTRE12.pessoas.ds_arquivo_documento'
      Size = 100
    end
    object tblResponsavelcd_empresa: TIntegerField
      FieldName = 'cd_empresa'
      Origin = 'WMESTRE12.pessoas.cd_empresa'
    end
    object tblResponsavelds_cargo: TStringField
      FieldName = 'ds_cargo'
      Origin = 'WMESTRE12.pessoas.ds_cargo'
      Size = 80
    end
    object tblResponsavelds_observacao: TBlobField
      FieldName = 'ds_observacao'
      Origin = 'WMESTRE12.pessoas.ds_observacao'
      Size = 1
    end
    object tblResponsaveldescEstadoNasc: TStringField
      FieldKind = fkLookup
      FieldName = 'descEstadoNasc'
      LookupDataSet = DM.tblEstados
      LookupKeyFields = 'ds_uf'
      LookupResultField = 'ds_estado'
      KeyFields = 'ds_estado_nascimento'
      Size = 50
      Lookup = True
    end
    object tblResponsaveldescEstado: TStringField
      FieldKind = fkLookup
      FieldName = 'descEstado'
      LookupDataSet = DM.tblEstados
      LookupKeyFields = 'ds_uf'
      LookupResultField = 'ds_estado'
      KeyFields = 'ds_estado'
      Size = 50
      Lookup = True
    end
    object tblResponsavelcd_estado_civil: TSmallintField
      FieldName = 'cd_estado_civil'
      Origin = 'WMESTRE12.pessoas.cd_estado_civil'
    end
    object tblResponsavelds_senha: TStringField
      FieldName = 'ds_senha'
      Origin = 'WMESTRE12.pessoas.ds_senha'
      Size = 32
    end
    object tblResponsavelsn_senha_provisoria: TStringField
      FieldName = 'sn_senha_provisoria'
      Origin = 'WMESTRE12.pessoas.sn_senha_provisoria'
      Size = 1
    end
    object tblResponsaveldescEstadoCivil: TStringField
      FieldKind = fkLookup
      FieldName = 'descEstadoCivil'
      LookupDataSet = tblEstadosCivis
      LookupKeyFields = 'cd_estado_civil'
      LookupResultField = 'ds_estado_civil'
      KeyFields = 'cd_estado_civil'
      Size = 40
      Lookup = True
    end
    object tblResponsaveldt_nascimento: TDateTimeField
      FieldName = 'dt_nascimento'
      Origin = 'WMESTRE12.pessoas.dt_nascimento'
      DisplayFormat = 'dd/mm/yyyy'
      EditMask = '!99/99/9999;1;_'
    end
    object tblResponsaveldt_identidade_expedicao: TDateTimeField
      FieldName = 'dt_identidade_expedicao'
      Origin = 'WMESTRE12.pessoas.dt_identidade_expedicao'
      DisplayFormat = 'dd/mm/yyyy'
      EditMask = '!99/99/9999;1;_'
    end
    object tblResponsaveldt_rm_exp: TDateTimeField
      FieldName = 'dt_rm_exp'
      Origin = 'WMESTRE12.pessoas.dt_rm_exp'
      DisplayFormat = 'dd/mm/yyyy'
      EditMask = '!99/99/9999;1;_'
    end
    object tblResponsaveldt_titulo_emissao: TDateTimeField
      FieldName = 'dt_titulo_emissao'
      Origin = 'WMESTRE12.pessoas.dt_titulo_emissao'
      DisplayFormat = 'dd/mm/yyyy'
      EditMask = '!99/99/9999;1;_'
    end
    object tblResponsaveldt_revisao: TDateTimeField
      FieldName = 'dt_revisao'
      Origin = 'WMESTRE12.pessoas.dt_revisao'
      DisplayFormat = 'dd/mm/yyyy'
      EditMask = '!99/99/9999;1;_'
    end
    object tblResponsaveldt_cadastro: TDateTimeField
      FieldName = 'dt_cadastro'
      Origin = 'WMESTRE12.pessoas.dt_cadastro'
      DisplayFormat = 'dd/mm/yyyy'
      EditMask = '!99/99/9999;1;_'
    end
    object tblResponsavelsn_bloqueto_empresa: TStringField
      FieldName = 'sn_bloqueto_empresa'
      Origin = 'WMESTRE12.pessoas.sn_bloqueto_empresa'
      FixedChar = True
      Size = 1
    end
    object tblResponsavelim_pessoa: TBlobField
      FieldName = 'im_pessoa'
      Origin = 'WMESTRE12.pessoas.im_pessoa'
      Size = 1
    end
    object tblResponsavelsn_foto_publica: TStringField
      FieldName = 'sn_foto_publica'
      Origin = 'WMESTRE12.pessoas.sn_foto_publica'
      FixedChar = True
      Size = 1
    end
    object tblResponsavelsn_pai: TStringField
      FieldName = 'sn_pai'
      Origin = 'WMESTRE12.pessoas.sn_pai'
      FixedChar = True
      Size = 1
    end
    object tblResponsavelsn_mae: TStringField
      FieldName = 'sn_mae'
      Origin = 'WMESTRE12.pessoas.sn_mae'
      FixedChar = True
      Size = 1
    end
    object tblResponsaveltp_cert: TSmallintField
      FieldName = 'tp_cert'
      Origin = 'WMESTRE12.pessoas.tp_cert'
    end
    object tblResponsavelds_cert_folha: TStringField
      FieldName = 'ds_cert_folha'
      Origin = 'WMESTRE12.pessoas.ds_cert_folha'
      Size = 4
    end
    object tblResponsavelds_cert_livro: TStringField
      FieldName = 'ds_cert_livro'
      Origin = 'WMESTRE12.pessoas.ds_cert_livro'
      Size = 8
    end
    object tblResponsaveldt_cert: TDateTimeField
      FieldName = 'dt_cert'
      Origin = 'WMESTRE12.pessoas.dt_cert'
    end
    object tblResponsaveldescDistritoNasc: TStringField
      FieldKind = fkLookup
      FieldName = 'descDistritoNasc'
      LookupDataSet = qyDistritos
      LookupKeyFields = 'cd_distrito'
      LookupResultField = 'ds_distrito'
      KeyFields = 'cd_municipio_nasc'
      Size = 50
      Lookup = True
    end
    object tblResponsaveldescProvincia: TStringField
      FieldKind = fkLookup
      FieldName = 'descProvincia'
      LookupDataSet = qyProvincias
      LookupKeyFields = 'cd_provincia'
      LookupResultField = 'ds_provincia'
      KeyFields = 'cd_estado'
      Size = 50
      Lookup = True
    end
    object tblResponsaveldescDistrito: TStringField
      FieldKind = fkLookup
      FieldName = 'descDistrito'
      LookupDataSet = qyDistritos
      LookupKeyFields = 'cd_distrito'
      LookupResultField = 'ds_distrito'
      KeyFields = 'cd_municipio'
      Size = 50
      Lookup = True
    end
    object tblResponsaveldescLocalidade: TStringField
      FieldKind = fkLookup
      FieldName = 'descLocalidade'
      LookupDataSet = qyLocalidades
      LookupKeyFields = 'cd_localidade'
      LookupResultField = 'ds_localidade'
      KeyFields = 'cd_localidade'
      Size = 50
      Lookup = True
    end
    object tblResponsavelds_cert_uf: TStringField
      FieldName = 'ds_cert_uf'
      Origin = 'WMESTRE12.pessoas.ds_cert_uf'
      FixedChar = True
      Size = 2
    end
    object tblResponsavelds_cert_orgao: TStringField
      FieldName = 'ds_cert_orgao'
      Origin = 'WMESTRE12.pessoas.ds_cert_orgao'
    end
    object tblResponsaveldesLogradouro: TStringField
      FieldKind = fkLookup
      FieldName = 'desLogradouro'
      LookupDataSet = tblTpLogradouro
      LookupKeyFields = 'cd_logradouro'
      LookupResultField = 'ds_logradouro'
      KeyFields = 'cd_logradouro'
      Size = 40
      Lookup = True
    end
    object tblResponsaveldescPaisAtual: TStringField
      FieldKind = fkLookup
      FieldName = 'descPaisAtual'
      LookupDataSet = tblPaisAtual
      LookupKeyFields = 'cd_pais'
      LookupResultField = 'ds_pais'
      KeyFields = 'cd_pais'
      Size = 50
      Lookup = True
    end
    object tblResponsaveldescProvinciaNasc: TStringField
      FieldKind = fkLookup
      FieldName = 'descProvinciaNasc'
      LookupDataSet = qyProvincias
      LookupKeyFields = 'cd_provincia'
      LookupResultField = 'ds_provincia'
      KeyFields = 'cd_estado_nascimento'
      Size = 50
      Lookup = True
    end
    object tblResponsaveldescPaisNasc: TStringField
      FieldKind = fkLookup
      FieldName = 'descPaisNasc'
      LookupDataSet = tblPais
      LookupKeyFields = 'cd_pais'
      LookupResultField = 'ds_pais'
      KeyFields = 'cd_pais'
      Size = 50
      Lookup = True
    end
    object tblResponsavelcd_municipio: TLargeintField
      FieldName = 'cd_municipio'
    end
    object tblResponsavelcd_pais: TLargeintField
      FieldName = 'cd_pais'
    end
    object tblResponsavelcd_pais_nascimento: TLargeintField
      FieldName = 'cd_pais_nascimento'
    end
    object tblResponsavelcd_logradouro: TLargeintField
      FieldName = 'cd_logradouro'
    end
    object tblResponsavelcd_municipio_nasc: TLargeintField
      FieldName = 'cd_municipio_nasc'
    end
    object tblResponsavelcd_estado_nascimento: TSmallintField
      FieldName = 'cd_estado_nascimento'
    end
    object tblResponsavelcd_estado: TLargeintField
      FieldName = 'cd_estado'
    end
    object tblResponsavelcd_localidade: TIntegerField
      FieldName = 'cd_localidade'
    end
    object tblResponsavelcd_localidade_nasc: TIntegerField
      FieldName = 'cd_localidade_nasc'
    end
    object tblResponsavelnr_cert_termo: TStringField
      FieldName = 'nr_cert_termo'
      Size = 50
    end
    object tblResponsaveldescNacionalidade: TStringField
      FieldKind = fkLookup
      FieldName = 'descNacionalidade'
      LookupDataSet = qyNacionalidade
      LookupKeyFields = 'ds_nacionalidade'
      LookupResultField = 'ds_nacionalidade'
      KeyFields = 'ds_nacionalidade'
      Size = 0
      Lookup = True
    end
    object tblResponsaveldescLocalidadeNasc: TStringField
      FieldKind = fkLookup
      FieldName = 'descLocalidadeNasc'
      LookupDataSet = qyLocalidades
      LookupKeyFields = 'cd_localidade'
      LookupResultField = 'ds_localidade'
      KeyFields = 'cd_localidade_nasc'
      Lookup = True
    end
  end
  object dsResponsavel: TDataSource [28]
    DataSet = tblResponsavel
    OnStateChange = dsResponsavelStateChange
    Left = 456
    Top = 65532
  end
  object dsContatoResponsavel: TDataSource [29]
    DataSet = tblContatoResponsavel
    Left = 397
    Top = 65531
  end
  object tblMatriculaCurso: TUMZQuery [30]
    Connection = DM.db
    SQL.Strings = (
      
        'SELECT mc.cd_matricula_curso, p.cd_pessoa, c.CD_CURSO cd_curso, ' +
        'c.DS_CURSO AS descricao, mc.nr_anosem_ingresso, mc.dt_ingresso, ' +
        'mc.cd_instituicao, mc.nr_matricula, mc.dt_saida, '
      'e.nm_instituicao'
      
        'FROM matriculas_curso mc INNER JOIN pessoas p ON (p.cd_pessoa = ' +
        'mc.cd_pessoa) '
      'INNER JOIN cursos_mestre c ON (c.cd_curso = mc.cd_curso)'
      
        'LEFT JOIN instituicoes_ensino e ON (e.cd_instituicao = mc.cd_ins' +
        'tituicao)'
      'WHERE '
      '   mc.cd_pessoa = :cd_pessoa'
      'ORDER BY mc.nr_anosem_ingresso DESC')
    Params = <
      item
        DataType = ftInteger
        Name = 'cd_pessoa'
        ParamType = ptUnknown
        Size = 4
      end>
    DataSource = dsPessoa
    Left = 716
    Top = 292
    ParamData = <
      item
        DataType = ftInteger
        Name = 'cd_pessoa'
        ParamType = ptUnknown
        Size = 4
      end>
    object tblMatriculaCursocd_curso: TStringField
      DisplayLabel = 'C'#243'd. Curso'
      FieldName = 'cd_curso'
      Size = 50
    end
    object tblMatriculaCursodescricao: TStringField
      DisplayLabel = 'Curso'
      FieldName = 'descricao'
      Size = 100
    end
    object tblMatriculaCursonr_matricula: TStringField
      DisplayLabel = 'N'#186' Matr'#237'cula'
      FieldName = 'nr_matricula'
    end
    object tblMatriculaCursodt_saida: TDateTimeField
      DisplayLabel = 'Data Sa'#237'da'
      FieldName = 'dt_saida'
      DisplayFormat = 'dd/mm/yyyy'
    end
    object tblMatriculaCursodt_ingresso: TDateTimeField
      FieldName = 'dt_ingresso'
      DisplayFormat = 'dd/mm/yyyy'
    end
    object tblMatriculaCursodescInstituicao: TStringField
      FieldKind = fkLookup
      FieldName = 'descInstituicao'
      LookupDataSet = DM.tblInstituicoes
      LookupKeyFields = 'cd_instituicao'
      LookupResultField = 'nm_instituicao'
      KeyFields = 'cd_instituicao'
      Size = 50
      Lookup = True
    end
    object tblMatriculaCursonr_anosem_ingresso: TLargeintField
      DisplayLabel = 'Ano/Sem'
      FieldName = 'nr_anosem_ingresso'
      DisplayFormat = '0000/0'
    end
    object tblMatriculaCursocd_instituicao: TLargeintField
      DisplayLabel = 'C'#243'd. Inst.'
      FieldName = 'cd_instituicao'
    end
    object tblMatriculaCursocd_matricula_curso: TLargeintField
      FieldName = 'cd_matricula_curso'
      Required = True
    end
    object tblMatriculaCursocd_pessoa: TIntegerField
      DisplayLabel = 'C'#243'd. Pessoa'
      FieldName = 'cd_pessoa'
      Required = True
    end
  end
  object dsMatriculasCurso: TDataSource [31]
    AutoEdit = False
    DataSet = tblMatriculaCurso
    Left = 748
    Top = 292
  end
  object tblMatriculasEtapa: TUMZQuery [32]
    Connection = DM.db
    SQL.Strings = (
      
        'select m.codigoaluno, m.situacao, m.turma, m.anosemestre, m.data' +
        'emissao, s.ds_situacao, i.*, t.serie'
      'from matriculas m, situacao s, matriculas_ingresso i, turmas t'
      'where m.situacao = s.cd_situacao '
      '   and i.cd_ingresso = m.cd_ingresso'
      '   and t.codigo = m.turma and t.anosemestre = m.anosemestre'
      '   and m.cd_matricula_curso = :cd_matricula_curso'
      'order by m.AnoSemestre')
    Params = <
      item
        DataType = ftUnknown
        Name = 'cd_matricula_curso'
        ParamType = ptUnknown
      end>
    DataSource = dsMatriculasCurso
    Left = 717
    Top = 324
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'cd_matricula_curso'
        ParamType = ptUnknown
      end>
    object tblMatriculasEtapacodigoaluno: TIntegerField
      FieldName = 'codigoaluno'
      Origin = 'WMESTRE12.matriculas_ingresso.cd_ingresso'
    end
    object tblMatriculasEtapasituacao: TSmallintField
      FieldName = 'situacao'
      Origin = 'WMESTRE12.matriculas_ingresso.ds_ingresso'
    end
    object tblMatriculasEtapaturma: TStringField
      FieldName = 'turma'
      Origin = 'WMESTRE12.matriculas.codigoaluno'
      Size = 50
    end
    object tblMatriculasEtapaanosemestre: TSmallintField
      FieldName = 'anosemestre'
      Origin = 'WMESTRE12.matriculas.situacao'
    end
    object tblMatriculasEtapads_situacao: TStringField
      FieldName = 'ds_situacao'
      Origin = 'WMESTRE12.matriculas.turma'
      Size = 50
    end
    object tblMatriculasEtapacd_ingresso: TIntegerField
      FieldName = 'cd_ingresso'
      Origin = 'WMESTRE12.matriculas.anosemestre'
    end
    object tblMatriculasEtapads_ingresso: TStringField
      FieldName = 'ds_ingresso'
      Origin = 'WMESTRE12.situacao.ds_situacao'
      Size = 50
    end
    object tblMatriculasEtapaserie: TSmallintField
      FieldName = 'serie'
      Origin = 'WMESTRE12.turmas.serie'
    end
    object tblMatriculasEtapadataemissao: TDateTimeField
      FieldName = 'dataemissao'
      Origin = 'WMESTRE12.matriculas.turma'
    end
  end
  object dsMatriculasEtapa: TDataSource [33]
    AutoEdit = False
    DataSet = tblMatriculasEtapa
    Left = 749
    Top = 324
  end
  object qryMensalidades: TUMZQuery [34]
    Connection = DM.db
    SQL.Strings = (
      'select CodigoAluno, Situacao, DataVencimento from Mensalidades'
      'where'
      'CodigoAluno = :CodigoAluno and '
      'Situacao = 2 and'
      'DataVencimento <= :Hoje')
    Params = <
      item
        DataType = ftInteger
        Name = 'CodigoAluno'
        ParamType = ptUnknown
      end
      item
        DataType = ftDate
        Name = 'Hoje'
        ParamType = ptUnknown
      end>
    Left = 528
    Top = 304
    ParamData = <
      item
        DataType = ftInteger
        Name = 'CodigoAluno'
        ParamType = ptUnknown
      end
      item
        DataType = ftDate
        Name = 'Hoje'
        ParamType = ptUnknown
      end>
  end
  object tblContatosPadroes: TUMZQuery [35]
    Connection = DM.db
    Params = <>
    Left = 896
    Top = 200
  end
  object tblContatos: TUMZQuery [36]
    Connection = DM.db
    Params = <>
    Left = 896
    Top = 168
  end
  object qyDocumentos: TUMZQuery [37]
    Connection = DM.db
    SQL.Strings = (
      'SELECT'
      #9'COUNT(da.apresentou) AS qtde'
      'FROM'
      #9'documentos d,'
      #9'documentos_necessarios dn,'
      #9'documentos_alunos da,'
      #9'matriculas m'
      'WHERE'
      #9'dn.cod_documento = d.codigo AND'
      #9'da.cod_documento = d.codigo AND'
      #9'm.codigoaluno = da.codigoaluno AND'
      #9'dn.sn_obrigatorio = '#39'S'#39' AND'
      #9'da.apresentou <> '#39'S'#39' AND'
      #9'dn.curso = m.curso AND'
      #9'da.codigoaluno = :cd_pessoa')
    Params = <
      item
        DataType = ftUnknown
        Name = 'cd_pessoa'
        ParamType = ptUnknown
      end>
    Left = 526
    Top = 332
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'cd_pessoa'
        ParamType = ptUnknown
      end>
  end
  object qyDocumentosNaoNecessarios: TUMZQuery [38]
    Connection = DM.db
    SQL.Strings = (
      'SELECT'
      #9'COUNT(da.apresentou) AS qtde'
      'FROM'
      #9'documentos d,'
      #9'documentos_necessarios dn,'
      #9'documentos_alunos da,'
      #9'matriculas m'
      'WHERE'
      #9'dn.cod_documento = d.codigo AND'
      #9'da.cod_documento = d.codigo AND'
      #9'm.codigoaluno = da.codigoaluno AND'
      #9'da.apresentou <> '#39'S'#39' AND'
      #9'dn.curso = m.curso AND'
      #9'da.codigoaluno = :cd_pessoa')
    Params = <
      item
        DataType = ftUnknown
        Name = 'cd_pessoa'
        ParamType = ptUnknown
      end>
    Left = 526
    Top = 364
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'cd_pessoa'
        ParamType = ptUnknown
      end>
  end
  object popContatoResp: TPopupMenu [39]
    Left = 748
    Top = 356
    object MenuItem5: TMenuItem
      Caption = 'Adicionar Contato'
      OnClick = MenuItem5Click
    end
    object MenuItem6: TMenuItem
      Caption = 'Excluir Contato'
      OnClick = MenuItem6Click
    end
    object MenuItem7: TMenuItem
      Caption = '-'
    end
    object MenuItem8: TMenuItem
      Caption = 'Cancelar'
    end
  end
  object tblContatoResponsavel: TUMZQuery [40]
    Connection = DM.db
    BeforePost = tblContatoResponsavelBeforePost
    OnNewRecord = tblContatoResponsavelNewRecord
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
    DataSource = dsResponsavel
    Left = 368
    ParamData = <
      item
        DataType = ftInteger
        Name = 'cd_pessoa'
        ParamType = ptUnknown
        Size = 4
      end>
    object tblContatoResponsavelcd_pessoa: TIntegerField
      FieldName = 'cd_pessoa'
      Origin = 'WMESTRE12.contatos_pessoas.cd_pessoa'
    end
    object tblContatoResponsavelcd_contato: TIntegerField
      FieldName = 'cd_contato'
      Origin = 'WMESTRE12.contatos_pessoas.cd_contato'
    end
    object tblContatoResponsavelds_contato: TStringField
      FieldName = 'ds_contato'
      Origin = 'WMESTRE12.contatos_pessoas.ds_contato'
      Size = 100
    end
    object tblContatoResponsaveldescContato: TStringField
      FieldKind = fkLookup
      FieldName = 'descContato'
      LookupDataSet = DM.tblContatosTipos
      LookupKeyFields = 'cd_contato'
      LookupResultField = 'ds_contato'
      KeyFields = 'cd_contato'
      Size = 30
      Lookup = True
    end
  end
  inherited qyTemp2: TUMZQuery
    Left = 448
    Top = 280
  end
  inherited pmFoto: TPopupMenu
    Left = 376
    Top = 280
  end
  inherited imgListFoto: TImageList
    Left = 856
    Top = 104
  end
  inherited DelphiTwain1: TDelphiTwain
    Left = 918
    Top = 28
  end
  inherited tblPaises: TZTable
    Left = 848
    Top = 24
  end
  inherited qyPais: TUMZQuery
    Top = 27
  end
  object qyDesvincularPessoa: TUMZQuery
    Connection = DM.db
    Params = <>
    Left = 712
    Top = 448
  end
end
