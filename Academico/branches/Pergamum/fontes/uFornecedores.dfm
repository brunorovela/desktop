object frm_Fornecedores: Tfrm_Fornecedores
  Left = 179
  Top = 110
  Caption = 'Cadastro de Fornecedores'
  ClientHeight = 482
  ClientWidth = 761
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
  Visible = True
  WindowState = wsMaximized
  OnClose = FormClose
  OnCreate = FormCreate
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
    Width = 761
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
    ExplicitWidth = 1055
    object DBText1: TDBText
      Left = 100
      Top = 2
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
    end
  end
  object toolPessoa: TToolBar
    Left = 0
    Top = 457
    Width = 761
    Height = 25
    Align = alBottom
    ButtonWidth = 90
    Caption = 'toolPessoa'
    EdgeBorders = [ebTop, ebBottom]
    Images = ImageList1
    List = True
    ShowCaptions = True
    TabOrder = 1
    ExplicitWidth = 1055
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
    object ToolButton3: TToolButton
      Left = 463
      Top = 0
      Caption = 'Observa'#231#245'es'
      ImageIndex = 1
      OnClick = ToolButton3Click
    end
    object ToolButton8: TToolButton
      Left = 553
      Top = 0
      Width = 8
      Caption = 'ToolButton8'
      ImageIndex = 6
      Style = tbsSeparator
    end
    object ToolButton5: TToolButton
      Left = 561
      Top = 0
      Width = 8
      Caption = 'ToolButton5'
      ImageIndex = 9
      Style = tbsSeparator
    end
    object btBuscar_Pessoa: TToolButton
      Left = 569
      Top = 0
      AutoSize = True
      Caption = 'F8 Buscar'
      ImageIndex = 5
      OnClick = btBuscar_PessoaClick
    end
    object ToolButton11: TToolButton
      Left = 648
      Top = 0
      Width = 8
      Caption = 'ToolButton11'
      ImageIndex = 7
      Style = tbsSeparator
    end
    object btFechar_Pessoa: TToolButton
      Left = 656
      Top = 0
      AutoSize = True
      Caption = 'F12 Fechar'
      ImageIndex = 7
      OnClick = btFechar_PessoaClick
    end
    object ToolButton2: TToolButton
      Left = 741
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
    Width = 761
    Height = 432
    ActivePage = TabSheet1
    Align = alClient
    Style = tsFlatButtons
    TabOrder = 2
    OnChange = pgPessoaChange
    OnChanging = pgPessoaChanging
    ExplicitWidth = 1055
    object TabSheet1: TTabSheet
      Caption = 'DADOS'
      ExplicitWidth = 1047
      object ScrollBox1: TScrollBox
        Left = 0
        Top = 0
        Width = 753
        Height = 401
        Align = alClient
        BorderStyle = bsNone
        TabOrder = 0
        ExplicitLeft = 3
        ExplicitTop = -2
        ExplicitWidth = 1047
        object Label1: TLabel
          Left = 6
          Top = 0
          Width = 127
          Height = 13
          Caption = 'Nome da Empresa/Pessoa'
          FocusControl = dbNome
        end
        object Label3: TLabel
          Left = 160
          Top = 40
          Width = 52
          Height = 13
          Caption = 'CNPJ/CPF'
          FocusControl = dbCpfCnpj
        end
        object Label7: TLabel
          Left = 6
          Top = 96
          Width = 19
          Height = 13
          Caption = 'Cep'
          FocusControl = dbCep
        end
        object Label13: TLabel
          Left = 108
          Top = 96
          Width = 22
          Height = 13
          Caption = 'Pa'#237's'
          FocusControl = dbPais
        end
        object sbCep: TSpeedButton
          Left = 80
          Top = 112
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
        object Label9: TLabel
          Left = 6
          Top = 136
          Width = 54
          Height = 13
          Caption = 'Logradouro'
          FocusControl = dbEndereco
        end
        object Label10: TLabel
          Left = 478
          Top = 136
          Width = 64
          Height = 13
          Caption = 'Complemento'
          FocusControl = dbComplemento
        end
        object Label38: TLabel
          Left = 392
          Top = 136
          Width = 37
          Height = 13
          Caption = 'N'#250'mero'
          FocusControl = DBEdit2
        end
        object Label11: TLabel
          Left = 558
          Top = 97
          Width = 27
          Height = 13
          Caption = 'Bairro'
          FocusControl = dbBairro
        end
        object Label8: TLabel
          Left = 392
          Top = 96
          Width = 33
          Height = 13
          Caption = 'Cidade'
          FocusControl = dbCidade
        end
        object Label4: TLabel
          Left = 230
          Top = 96
          Width = 33
          Height = 13
          Caption = 'Estado'
          FocusControl = DBLookupComboBox3
        end
        object Label5: TLabel
          Left = 318
          Top = 40
          Width = 90
          Height = 13
          Caption = 'Inscri'#231#227'o Estadual:'
          FocusControl = dbInscriEstadual
        end
        object Label2: TLabel
          Left = 397
          Top = 0
          Width = 83
          Height = 13
          Caption = 'Nome do Contato'
          FocusControl = DBEdit1
        end
        object Bevel2: TBevel
          Left = 8
          Top = 88
          Width = 641
          Height = 2
          Shape = bsTopLine
        end
        object sbMaisInformacoes: TSpeedButton
          Left = 600
          Top = 349
          Width = 145
          Height = 25
          Caption = 'F10   Mais Informa'#231#245'es >>'
          Flat = True
          NumGlyphs = 2
          OnClick = sbMaisInformacoesClick
        end
        object sbSelecionaResponsavel: TSpeedButton
          Left = 722
          Top = 55
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
          OnClick = sbSelecionaResponsavelClick
        end
        object lbRespFinan: TLabel
          Left = 469
          Top = 40
          Width = 91
          Height = 13
          Caption = 'Respons'#225'vel Legal'
        end
        object Label6: TLabel
          Left = 8
          Top = 296
          Width = 215
          Height = 13
          Caption = 'Conta de resultado padr'#227'o para o fornecedor:'
          FocusControl = DBEdit3
        end
        object Label12: TLabel
          Left = 8
          Top = 339
          Width = 154
          Height = 13
          Caption = 'Conta do fornecedor no passivo:'
          FocusControl = DBEdit4
        end
        object sbConta: TSpeedButton
          Left = 392
          Top = 311
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
          OnClick = sbContaClick
        end
        object SpeedButton3: TSpeedButton
          Left = 392
          Top = 352
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
          OnClick = SpeedButton3Click
        end
        object dbNome: TDBEdit
          Left = 10
          Top = 16
          Width = 367
          Height = 21
          CharCase = ecUpperCase
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
        object DBRadioGroup1: TDBRadioGroup
          Left = 8
          Top = 40
          Width = 145
          Height = 38
          Caption = 'Tipo de Pessoa:'
          Columns = 2
          DataField = 'tp_pessoa'
          DataSource = dsPessoa
          Items.Strings = (
            'F'#237'sica'
            'Jur'#237'dica')
          ParentBackground = True
          TabOrder = 2
          Values.Strings = (
            'F'
            'J')
          OnChange = DBRadioGroup1Change
        end
        object dbCpfCnpj: TDBEdit
          Left = 160
          Top = 56
          Width = 135
          Height = 21
          CharCase = ecUpperCase
          DataField = 'ds_cpf'
          DataSource = dsPessoa
          TabOrder = 3
          OnKeyPress = dbNomeKeyPress
        end
        object dbCep: TDBEdit
          Left = 6
          Top = 112
          Width = 75
          Height = 21
          CharCase = ecUpperCase
          DataField = 'ds_cep'
          DataSource = dsPessoa
          TabOrder = 6
          OnKeyPress = dbNomeKeyPress
        end
        object dbPais: TDBEdit
          Left = 108
          Top = 112
          Width = 117
          Height = 21
          CharCase = ecUpperCase
          DataField = 'ds_pais'
          DataSource = dsPessoa
          TabOrder = 7
          OnKeyPress = dbNomeKeyPress
        end
        object dbEndereco: TDBEdit
          Left = 6
          Top = 152
          Width = 371
          Height = 21
          CharCase = ecUpperCase
          DataField = 'ds_logradouro'
          DataSource = dsPessoa
          TabOrder = 11
          OnKeyPress = dbNomeKeyPress
        end
        object grdAreasAtuacao: TDBGrid
          Left = 392
          Top = 184
          Width = 353
          Height = 103
          BorderStyle = bsNone
          DataSource = srcAreasAtuacao
          Options = [dgEditing, dgTitles, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgConfirmDelete, dgCancelOnExit]
          PopupMenu = pmAreasAtuacao
          TabOrder = 14
          TitleFont.Charset = DEFAULT_CHARSET
          TitleFont.Color = clWindowText
          TitleFont.Height = -11
          TitleFont.Name = 'MS Sans Serif'
          TitleFont.Style = []
          OnCellClick = grdAreasAtuacaoCellClick
          Columns = <
            item
              Expanded = False
              FieldName = 'DS_NOMEAREAATUACAO'
              Title.Caption = #193'rea de atua'#231#227'o'
              Width = 349
              Visible = True
            end>
        end
        object dbComplemento: TDBEdit
          Left = 479
          Top = 152
          Width = 266
          Height = 21
          CharCase = ecUpperCase
          DataField = 'ds_complemento'
          DataSource = dsPessoa
          TabOrder = 13
          OnKeyPress = dbNomeKeyPress
        end
        object DBEdit2: TDBEdit
          Left = 392
          Top = 152
          Width = 82
          Height = 21
          CharCase = ecUpperCase
          DataField = 'ds_logradouro_nro'
          DataSource = dsPessoa
          TabOrder = 12
          OnKeyPress = dbNomeKeyPress
        end
        object dbBairro: TDBEdit
          Left = 557
          Top = 112
          Width = 188
          Height = 21
          CharCase = ecUpperCase
          DataField = 'ds_bairro'
          DataSource = dsPessoa
          TabOrder = 10
          OnKeyPress = dbNomeKeyPress
        end
        object dbCidade: TDBEdit
          Left = 392
          Top = 112
          Width = 153
          Height = 21
          CharCase = ecUpperCase
          DataField = 'ds_cidade'
          DataSource = dsPessoa
          TabOrder = 9
          OnKeyPress = dbNomeKeyPress
        end
        object DBLookupComboBox3: TDBLookupComboBox
          Left = 230
          Top = 112
          Width = 147
          Height = 21
          DataField = 'descEstado'
          DataSource = dsPessoa
          TabOrder = 8
          OnKeyPress = dbNomeKeyPress
        end
        object dbInscriEstadual: TDBEdit
          Left = 317
          Top = 56
          Width = 132
          Height = 21
          DataField = 'ds_inscri_estadual'
          DataSource = dsPessoa
          TabOrder = 4
        end
        object DBEdit1: TDBEdit
          Left = 397
          Top = 16
          Width = 348
          Height = 21
          CharCase = ecUpperCase
          DataField = 'nm_contato'
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
        object txtResponsavelFinanceiro: TEdit
          Left = 469
          Top = 56
          Width = 242
          Height = 22
          ReadOnly = True
          TabOrder = 5
        end
        object DBEdit3: TDBEdit
          Left = 8
          Top = 312
          Width = 65
          Height = 21
          DataField = 'cd_conta'
          DataSource = dsPlanoFornecedor
          TabOrder = 15
        end
        object DBEdit4: TDBEdit
          Left = 8
          Top = 355
          Width = 65
          Height = 21
          DataField = 'cd_conta_passivo'
          DataSource = dsPlanoFornecedor
          TabOrder = 17
        end
        object dbContaPassivo: TDBLookupComboBox
          Left = 79
          Top = 355
          Width = 298
          Height = 21
          DataField = 'cd_conta_passivo'
          DataSource = dsPlanoFornecedor
          KeyField = 'CD_CONTA'
          ListField = 'DS_CONTA'
          ListSource = dsContas
          TabOrder = 18
        end
        object dbConta: TDBLookupComboBox
          Left = 79
          Top = 312
          Width = 298
          Height = 21
          DataField = 'cd_conta'
          DataSource = dsPlanoFornecedor
          KeyField = 'CD_CONTA'
          ListField = 'DS_CONTA'
          ListSource = dsContas
          TabOrder = 16
        end
        object VSTContatos: TVirtualStringTree
          Left = 6
          Top = 179
          Width = 371
          Height = 111
          Header.AutoSizeIndex = 0
          Header.Font.Charset = DEFAULT_CHARSET
          Header.Font.Color = clWindowText
          Header.Font.Height = -11
          Header.Font.Name = 'Tahoma'
          Header.Font.Style = []
          Header.MainColumn = -1
          TabOrder = 19
          Columns = <>
        end
      end
    end
    object TabSheet5: TTabSheet
      Caption = 'COMPLEMENTARES'
      ImageIndex = 1
      ExplicitWidth = 1047
      object Panel1: TPanel
        Left = 0
        Top = 0
        Width = 753
        Height = 89
        Align = alTop
        BevelOuter = bvNone
        TabOrder = 0
        ExplicitWidth = 1047
        object Label109: TLabel
          Left = 316
          Top = 4
          Width = 80
          Height = 13
          Caption = 'Redigite a senha'
        end
        object Label108: TLabel
          Left = 145
          Top = 4
          Width = 159
          Height = 13
          Caption = 'Senha (digite apenas para alterar)'
        end
        object Label33: TLabel
          Left = 6
          Top = 4
          Width = 26
          Height = 13
          Caption = 'Login'
        end
        object Label207: TLabel
          Left = 6
          Top = 58
          Width = 103
          Height = 13
          Caption = 'Data de cadastro:'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object lbDTCadastro: TLabel
          Left = 113
          Top = 58
          Width = 3
          Height = 13
        end
        object Label210: TLabel
          Left = 185
          Top = 58
          Width = 144
          Height = 13
          Caption = 'Data da '#250'ltima altera'#231#227'o:'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object lbDTAlteracao: TLabel
          Left = 335
          Top = 58
          Width = 3
          Height = 13
        end
        object Label211: TLabel
          Left = 407
          Top = 58
          Width = 199
          Height = 13
          Caption = 'Usu'#225'rio que fez a '#250'ltima altera'#231#227'o:'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object lbUsuario: TLabel
          Left = 612
          Top = 58
          Width = 3
          Height = 13
        end
        object Bevel1: TBevel
          Left = -4
          Top = 50
          Width = 761
          Height = 3
          Shape = bsBottomLine
        end
        object Bevel3: TBevel
          Left = -4
          Top = 78
          Width = 761
          Height = 3
          Shape = bsBottomLine
        end
        object edLogin: TEdit
          Left = 8
          Top = 23
          Width = 131
          Height = 21
          TabOrder = 0
          OnKeyPress = edLoginKeyPress
        end
        object edSenha1: TEdit
          Left = 145
          Top = 23
          Width = 163
          Height = 21
          ParentShowHint = False
          PasswordChar = '*'
          ShowHint = True
          TabOrder = 1
          OnKeyPress = edSenha1KeyPress
        end
        object edSenha2: TEdit
          Left = 314
          Top = 23
          Width = 163
          Height = 21
          PasswordChar = '*'
          TabOrder = 2
          OnKeyPress = edSenha2KeyPress
        end
      end
      object Panel2: TPanel
        Left = 0
        Top = 89
        Width = 753
        Height = 312
        Align = alClient
        Caption = 'Panel2'
        TabOrder = 1
        ExplicitWidth = 1047
        object Panel4: TPanel
          Left = 1
          Top = 1
          Width = 751
          Height = 24
          Align = alTop
          Caption = 'OBSERVA'#199#213'ES GERAIS'
          TabOrder = 0
          ExplicitWidth = 1045
          object btnCancelarObs: TBitBtn
            Left = 727
            Top = 1
            Width = 23
            Height = 22
            Hint = 'Cancelar Observa'#231#245'es Gerais'
            Align = alRight
            TabOrder = 0
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
            ExplicitLeft = 1021
          end
          object btnSalvarObs: TBitBtn
            Left = 704
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
            ExplicitLeft = 998
          end
          object btnAlterarObs: TBitBtn
            Left = 681
            Top = 1
            Width = 23
            Height = 22
            Hint = 'Editar Observa'#231#245'es Gerais'
            Align = alRight
            TabOrder = 2
            Visible = False
            OnClick = btnAlterarObsClick
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
            ExplicitLeft = 975
          end
        end
        object dbObs: TDBMemo
          Left = 1
          Top = 25
          Width = 751
          Height = 286
          Align = alClient
          DataField = 'ds_observacao'
          DataSource = dsPessoa
          TabOrder = 1
          ExplicitWidth = 1045
        end
      end
    end
  end
  object ImageList1: TImageList
    Left = 712
    Top = 240
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
    BeforeInsert = tblPessoaBeforeInsert
    AfterInsert = tblPessoaAfterInsert
    BeforeEdit = tblPessoaBeforeEdit
    BeforePost = tblPessoaBeforePost
    BeforeDelete = tblPessoaBeforeDelete
    OnNewRecord = tblPessoaNewRecord
    SQL.Strings = (
      'select * from pessoas')
    Params = <>
    Left = 595
    Top = 3
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
      FixedChar = True
      Size = 3
    end
    object tblPessoads_complemento: TStringField
      DisplayLabel = 'Complemento'
      FieldName = 'ds_complemento'
      Origin = 'WMESTRE12.pessoas.ds_complemento'
      Size = 50
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
    object tblPessoads_pais_nascimento: TStringField
      DisplayLabel = 'Pa'#237's Nasc.'
      FieldName = 'ds_pais_nascimento'
      Origin = 'WMESTRE12.pessoas.ds_pais_nascimento'
      Size = 50
    end
    object tblPessoads_logradouro: TStringField
      FieldName = 'ds_logradouro'
      Origin = 'WMESTRE12.pessoas.ds_logradouro'
      Size = 80
    end
    object tblPessoads_logradouro_nro: TStringField
      DisplayLabel = 'N'#250'mero'
      FieldName = 'ds_logradouro_nro'
      Origin = 'WMESTRE12.pessoas.ds_logradouro_nro'
      Size = 10
    end
    object tblPessoadescEstado: TStringField
      DisplayLabel = 'Estado'
      FieldKind = fkLookup
      FieldName = 'descEstado'
      LookupDataSet = DM.tblEstados
      LookupKeyFields = 'ds_uf'
      LookupResultField = 'ds_estado'
      KeyFields = 'ds_estado'
      Size = 50
      Lookup = True
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
      FieldName = 'ds_rm_doc_tipo'
      Origin = 'WMESTRE12.pessoas.ds_rm_doc_tipo'
    end
    object tblPessoadt_nascimento: TDateTimeField
      FieldName = 'dt_nascimento'
      Origin = 'WMESTRE12.pessoas.dt_nascimento'
      DisplayFormat = 'dd/mm/yyyy'
      EditMask = '!99/99/0000;1;_'
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
      Size = 1
    end
    object tblPessoads_estado_civil: TStringField
      FieldName = 'ds_estado_civil'
      Origin = 'WMESTRE12.pessoas.ds_estado_civil'
      Size = 10
    end
    object tblPessoasn_foto_publica: TStringField
      FieldName = 'sn_foto_publica'
      Origin = 'WMESTRE12.pessoas.sn_foto_publica'
      FixedChar = True
      Size = 1
    end
    object tblPessoasn_pai: TStringField
      FieldName = 'sn_pai'
      Origin = 'WMESTRE12.pessoas.sn_pai'
      FixedChar = True
      Size = 1
    end
    object tblPessoasn_mae: TStringField
      FieldName = 'sn_mae'
      Origin = 'WMESTRE12.pessoas.sn_mae'
      FixedChar = True
      Size = 1
    end
    object tblPessoanm_contato: TStringField
      FieldName = 'nm_contato'
      Origin = 'WMESTRE12.pessoas.nm_contato'
      Size = 100
    end
    object tblPessoatp_pessoa: TStringField
      FieldName = 'tp_pessoa'
      Origin = 'WMESTRE12.pessoas.tp_pessoa'
      FixedChar = True
      Size = 1
    end
    object tblPessoads_cnpj: TStringField
      FieldName = 'ds_cnpj'
      Origin = 'WMESTRE12.pessoas.ds_cnpj'
      EditMask = '00\.000\.000\/0000\-00;0;_'
      Size = 14
    end
    object tblPessoads_inscri_estadual: TStringField
      FieldName = 'ds_inscri_estadual'
      Origin = 'WMESTRE12.pessoas.ds_inscri_estadual'
      Size = 50
    end
    object tblPessoacd_mae: TLargeintField
      FieldName = 'cd_mae'
    end
    object tblPessoacd_pai: TLargeintField
      FieldName = 'cd_pai'
    end
    object tblPessoacd_municipio: TLargeintField
      FieldName = 'cd_municipio'
    end
    object tblPessoacd_pais: TLargeintField
      FieldName = 'cd_pais'
    end
    object tblPessoacd_pais_nascimento: TLargeintField
      FieldName = 'cd_pais_nascimento'
    end
    object tblPessoacd_logradouro: TLargeintField
      FieldName = 'cd_logradouro'
    end
    object tblPessoacd_orgao_emissor: TLargeintField
      FieldName = 'cd_orgao_emissor'
    end
    object tblPessoanr_dia_vencimento: TLargeintField
      FieldName = 'nr_dia_vencimento'
    end
    object tblPessoasn_nao_bloquear_financeiro: TSmallintField
      FieldName = 'sn_nao_bloquear_financeiro'
    end
    object tblPessoacd_pessoa_alteracao: TLargeintField
      FieldName = 'cd_pessoa_alteracao'
    end
    object tblPessoads_login: TStringField
      FieldName = 'ds_login'
      Size = 100
    end
    object tblPessoads_senha_md4: TStringField
      FieldName = 'ds_senha_md4'
      Size = 32
    end
    object tblPessoatp_cert: TSmallintField
      FieldName = 'tp_cert'
    end
    object tblPessoanr_cert_termo: TStringField
      FieldName = 'nr_cert_termo'
      Size = 50
    end
    object tblPessoads_cert_folha: TStringField
      FieldName = 'ds_cert_folha'
      Size = 8
    end
    object tblPessoads_cert_livro: TStringField
      FieldName = 'ds_cert_livro'
      Size = 8
    end
    object tblPessoadt_cert: TDateTimeField
      FieldName = 'dt_cert'
    end
    object tblPessoads_cert_uf: TStringField
      FieldName = 'ds_cert_uf'
      Size = 3
    end
    object tblPessoads_cert_orgao: TStringField
      FieldName = 'ds_cert_orgao'
      Size = 100
    end
    object tblPessoacd_municipio_nasc: TLargeintField
      FieldName = 'cd_municipio_nasc'
    end
    object tblPessoanr_praca: TLargeintField
      FieldName = 'nr_praca'
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
    object tblPessoacd_raca: TSmallintField
      FieldName = 'cd_raca'
    end
    object tblPessoacd_mec: TStringField
      FieldName = 'cd_mec'
      Size = 30
    end
    object tblPessoasn_foto: TStringField
      FieldName = 'sn_foto'
      Size = 1
    end
    object tblPessoasn_bloqueado: TSmallintField
      FieldName = 'sn_bloqueado'
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
    object tblPessoasn_bloq_cartas: TSmallintField
      FieldName = 'sn_bloq_cartas'
    end
    object tblPessoasn_bloq_emails: TSmallintField
      FieldName = 'sn_bloq_emails'
    end
    object tblPessoasn_naturalizado: TSmallintField
      FieldName = 'sn_naturalizado'
    end
    object tblPessoadt_identidade_expiracao: TDateTimeField
      FieldName = 'dt_identidade_expiracao'
    end
    object tblPessoads_matricula: TStringField
      FieldName = 'ds_matricula'
      Size = 40
    end
    object tblPessoasn_pode_retirar_material: TSmallintField
      FieldName = 'sn_pode_retirar_material'
    end
    object tblPessoads_passaporte: TStringField
      FieldName = 'ds_passaporte'
      Size = 50
    end
    object tblPessoads_forma_conheceu: TStringField
      FieldName = 'ds_forma_conheceu'
      Size = 255
    end
    object tblPessoads_formacao_academica: TStringField
      FieldName = 'ds_formacao_academica'
      Size = 255
    end
    object tblPessoanm_pessoa_oficial: TStringField
      FieldName = 'nm_pessoa_oficial'
      Size = 60
    end
    object tblPessoasn_nome_social: TSmallintField
      FieldName = 'sn_nome_social'
      Required = True
    end
  end
  object dsPessoa: TDataSource
    DataSet = tblPessoa
    OnStateChange = dsPessoaStateChange
    OnDataChange = dsPessoaDataChange
    Left = 627
    Top = 4
  end
  object pmContatos: TPopupMenu
    Left = 676
    Top = 236
    object AdicionarContato1: TMenuItem
      Caption = 'Adicionar Contato'
    end
    object ExcluirContato1: TMenuItem
      Caption = 'Excluir Contato'
    end
    object N1: TMenuItem
      Caption = '-'
    end
    object Cancelar1: TMenuItem
      Caption = 'Cancelar'
    end
  end
  object qyAreasAtuacao: TUMZQuery
    Connection = DM.db
    AfterPost = qyAreasAtuacaoAfterPost
    OnNewRecord = qyAreasAtuacaoNewRecord
    SQL.Strings = (
      'SELECT'
      '   *'
      'FROM'
      '   FIN_PESSOASAREASATUACAO'
      'WHERE'
      '   CD_PESSOA = :cd_pessoa')
    Params = <
      item
        DataType = ftUnknown
        Name = 'cd_pessoa'
        ParamType = ptUnknown
      end>
    DataSource = dsPessoa
    Left = 472
    Top = 16
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'cd_pessoa'
        ParamType = ptUnknown
      end>
    object qyAreasAtuacaoCD_PESSOA: TIntegerField
      FieldName = 'CD_PESSOA'
      Origin = 'WMESTRE12.fin_pessoasareasatuacao.CD_PESSOA'
    end
    object qyAreasAtuacaoCD_AREAATUACAO: TIntegerField
      FieldName = 'CD_AREAATUACAO'
      Origin = 'WMESTRE12.fin_pessoasareasatuacao.CD_AREAATUACAO'
    end
    object qyAreasAtuacaoDS_NOMEAREAATUACAO: TStringField
      FieldKind = fkLookup
      FieldName = 'DS_NOMEAREAATUACAO'
      LookupDataSet = DM.qyAreasAtuacao
      LookupKeyFields = 'cd_area_atuacao'
      LookupResultField = 'ds_area_atuacao'
      KeyFields = 'CD_AREAATUACAO'
      Size = 50
      Lookup = True
    end
  end
  object srcAreasAtuacao: TDataSource
    DataSet = qyAreasAtuacao
    Left = 504
    Top = 16
  end
  object pmAreasAtuacao: TPopupMenu
    Left = 548
    Top = 364
    object Adicionarrea1: TMenuItem
      Caption = 'Adicionar '#225'rea'
      OnClick = Adicionarrea1Click
    end
    object Excluirrea1: TMenuItem
      Caption = 'Excluir '#225'rea'
      OnClick = Excluirrea1Click
    end
    object N2: TMenuItem
      Caption = '-'
    end
    object Cancelar2: TMenuItem
      Caption = 'Cancelar'
    end
  end
  object qyPlanoFornecedor: TUMZQuery
    Connection = DM.db
    OnNewRecord = qyPlanoFornecedorNewRecord
    SQL.Strings = (
      'SELECT'
      '   *'
      'FROM'
      '   FIN_PLANO_CONTAS_FORNECEDOR '
      'WHERE'
      '   CD_PESSOA = :CD_PESSOA'
      '   AND CD_COLIGADA = :CD_COLIGADA')
    Params = <
      item
        DataType = ftInteger
        Name = 'cd_pessoa'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'CD_COLIGADA'
        ParamType = ptUnknown
      end>
    Left = 680
    Top = 136
    ParamData = <
      item
        DataType = ftInteger
        Name = 'cd_pessoa'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'CD_COLIGADA'
        ParamType = ptUnknown
      end>
    object qyPlanoFornecedorcd_conta: TLargeintField
      FieldName = 'cd_conta'
      Required = True
    end
    object qyPlanoFornecedorcd_pessoa: TLargeintField
      FieldName = 'cd_pessoa'
      Required = True
    end
    object qyPlanoFornecedords_conta_calc: TStringField
      FieldKind = fkLookup
      FieldName = 'ds_conta_calc'
      LookupDataSet = qryPlanoContas
      LookupKeyFields = 'cd_conta'
      LookupResultField = 'ds_conta'
      KeyFields = 'cd_conta'
      Size = 50
      Lookup = True
    end
    object qyPlanoFornecedorcd_conta_passivo: TLargeintField
      FieldName = 'cd_conta_passivo'
      Required = True
    end
    object qyPlanoFornecedords_conta_passivo: TStringField
      FieldKind = fkLookup
      FieldName = 'ds_conta_passivo'
      LookupDataSet = qryPlanoContas
      LookupKeyFields = 'CD_CONTA'
      LookupResultField = 'DS_CONTA'
      KeyFields = 'cd_conta_passivo'
      Size = 50
      Lookup = True
    end
    object qyPlanoFornecedorcd_coligada: TLargeintField
      FieldName = 'cd_coligada'
      Required = True
    end
  end
  object dsPlanoFornecedor: TDataSource
    DataSet = qyPlanoFornecedor
    OnStateChange = dsPessoaStateChange
    Left = 712
    Top = 136
  end
  object qyTemp1: TUMZQuery
    Connection = DM.db
    Params = <>
    Left = 624
    Top = 344
  end
  object qryUpdPlanoContasFor: TUMZQuery
    Connection = DM.db
    SQL.Strings = (
      'INSERT INTO FIN_PLANO_CONTAS_FORNECEDOR'
      '   (CD_PESSOA, CD_CONTA, CD_COLIGADA)'
      'VALUES'
      '   (:CD_PESSOA, :DESC_CONTA, CD_COLIGADA)')
    Params = <
      item
        DataType = ftUnknown
        Name = 'CD_PESSOA'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'desc_conta'
        ParamType = ptUnknown
      end>
    SQLList.Strings = (
      
        'mysql-5=REPLACE INTO FIN_PLANO_CONTAS_FORNECEDOR'#13#10'   (CD_PESSOA,' +
        ' CD_CONTA, CD_COLIGADA)'#13#10'SELECT'#13#10'   :CD_PESSOA,'#13#10'   PC.CD_CONTA,' +
        #13#10'   PC.CD_COLIGADA'#13#10'FROM'#13#10'   FIN_PLANO_CONTAS PC'#13#10'      JOIN CO' +
        'LIGADAS C ON'#13#10'         (PC.CD_COLIGADA = C.CD_COLIGADA)'#13#10'WHERE'#13#10 +
        '   PC.TP_CONTA = 1 AND'#13#10'   LEFT(CONCAT(C.NM_COLIGADA, '#39' - '#39', PC.' +
        'DS_CONTA), 150) = :DESC_CONTA'
      
        'oracle=MERGE INTO FIN_PLANO_CONTAS_FORNECEDOR PCF USING'#13#10'('#13#10'   S' +
        'ELECT'#13#10'      :CD_PESSOA CD_PESSOA,'#13#10'      PC.CD_CONTA,'#13#10'      PC' +
        '.CD_COLIGADA'#13#10'   FROM'#13#10'      FIN_PLANO_CONTAS PC'#13#10'         JOIN ' +
        'COLIGADAS C ON'#13#10'            (PC.CD_COLIGADA = C.CD_COLIGADA)'#13#10'  ' +
        ' WHERE'#13#10'      PC.TP_CONTA = 1 AND'#13#10'      LEFT(C.NM_COLIGADA || '#39 +
        ' - '#39' || PC.DS_CONTA, 150) = :DESC_CONTA'#13#10') UP ON'#13#10'   (PCF.CD_PES' +
        'SOA = UP.CD_PESSOA AND'#13#10'    PCF.CD_COLIGADA = UP.CD_COLIGADA)'#13#10'W' +
        'HEN MATCHED THEN'#13#10'   UPDATE SET PCF.CD_CONTA = UP.CD_CONTA'#13#10'WHEN' +
        ' NOT MATCHED THEN'#13#10'   INSERT (PCF.CD_PESSOA, PCF.CD_CONTA, PCF.C' +
        'D_COLIGADA)'#13#10'   VALUES (UP.CD_PESSOA, UP.CD_CONTA, UP.CD_COLIGAD' +
        'A)')
    Left = 408
    Top = 416
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'CD_PESSOA'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'desc_conta'
        ParamType = ptUnknown
      end>
  end
  object dsObsGerais: TDataSource
    DataSet = qryObsGerais
    OnStateChange = dsObsGeraisStateChange
    Left = 392
    Top = 248
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
    Left = 424
    Top = 248
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
  object tblContatosPadroes: TUMZQuery
    Connection = DM.db
    Params = <>
    Left = 672
    Top = 408
  end
  object qryPlanoContas: TUMZQuery
    Connection = DM.db
    SQL.Strings = (
      'SELECT CD_CONTA'
      '          , CD_COLIGADA_MATRIZ'
      '          , DS_CONTA '
      '   FROM FIN_CONFIG_PLANO_CONTAS'
      'WHERE TP_CONTA = 1 AND CD_COLIGADA_MATRIZ = :CD_COLIGADA'
      'ORDER BY cd_classificacao')
    Params = <
      item
        DataType = ftUnknown
        Name = 'CD_COLIGADA'
        ParamType = ptUnknown
      end>
    Left = 680
    Top = 173
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'CD_COLIGADA'
        ParamType = ptUnknown
      end>
    object qryPlanoContasCD_CONTA: TLargeintField
      FieldName = 'CD_CONTA'
      Required = True
    end
    object qryPlanoContasCD_COLIGADA_MATRIZ: TIntegerField
      FieldName = 'CD_COLIGADA_MATRIZ'
      Required = True
    end
    object qryPlanoContasDS_CONTA: TStringField
      FieldName = 'DS_CONTA'
      Size = 255
    end
  end
  object dsContas: TDataSource
    DataSet = qryPlanoContas
    OnStateChange = dsPessoaStateChange
    Left = 712
    Top = 173
  end
end
