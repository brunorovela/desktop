inherited frm_Alunos: Tfrm_Alunos
  Left = 221
  Top = 93
  Caption = 'Cadastro de Alunos'
  ClientHeight = 759
  ClientWidth = 1093
  OldCreateOrder = True
  Position = poDesigned
  ExplicitWidth = 1101
  ExplicitHeight = 786
  PixelsPerInch = 96
  TextHeight = 13
  inherited Panel3: TPanel
    Width = 1093
    TabOrder = 0
    ExplicitWidth = 1093
    inherited DBText1: TDBText
      Left = 103
      Top = 3
      Width = 490
      ExplicitLeft = 103
      ExplicitTop = 3
      ExplicitWidth = 490
    end
    inherited DBText2: TDBText
      Left = 538
      Visible = False
      ExplicitLeft = 538
    end
    inherited LMensagemDesativacaoUnimestre: TLabel
      Left = 636
      ExplicitLeft = 636
    end
    object dbCodigo: TDBEdit
      Left = 1
      Top = 3
      Width = 96
      Height = 21
      BorderStyle = bsNone
      Color = clBlue
      DataField = 'cd_pessoa'
      DataSource = dsPessoa
      TabOrder = 0
      OnDblClick = DBText2DblClick
    end
  end
  inherited toolPessoa: TToolBar
    Top = 684
    Width = 1093
    ExplicitTop = 684
    ExplicitWidth = 1093
    inherited DBNavigator1: TDBNavigator
      Hints.Strings = ()
    end
    inherited btnObservacoes: TToolButton
      Visible = True
    end
    inherited btn_ImprimirAcade: TToolButton
      Visible = True
      OnClick = btn_ImprimirAcadeClick
    end
  end
  inherited pgPessoa: TPageControl
    Width = 1093
    Height = 659
    TabOrder = 3
    ExplicitWidth = 1093
    ExplicitHeight = 659
    inherited tsDadosPessoais: TTabSheet
      ExplicitWidth = 1085
      ExplicitHeight = 628
      inherited Label3: TLabel [0]
        Left = 452
        Top = 77
        ExplicitLeft = 452
        ExplicitTop = 77
      end
      inherited Label42: TLabel [1]
        Top = 77
        ExplicitTop = 77
      end
      inherited Label6: TLabel [2]
        Left = 126
        Top = 77
        ExplicitLeft = 126
        ExplicitTop = 77
      end
      inherited Label41: TLabel [3]
        Top = 77
        ExplicitTop = 77
      end
      inherited lbNomeSocialInfo: TLabel [4]
        Top = 38
        ExplicitTop = 38
      end
      inherited lbNomeOficial: TLabel [5]
      end
      inherited Label2: TLabel [6]
      end
      inherited Label5: TLabel [7]
      end
      inherited Label7: TLabel [8]
        Top = 115
        ExplicitTop = 115
      end
      inherited Label8: TLabel [9]
        Left = 345
        Top = 115
        ExplicitLeft = 345
        ExplicitTop = 115
      end
      inherited Label9: TLabel [10]
        Left = 122
        ExplicitLeft = 122
      end
      inherited Label10: TLabel [11]
        Left = 475
        ExplicitLeft = 475
      end
      inherited Label11: TLabel [12]
        Top = 115
        ExplicitTop = 115
      end
      inherited Label13: TLabel [13]
        Left = 132
        Top = 115
        ExplicitLeft = 132
        ExplicitTop = 115
      end
      inherited Label14: TLabel [14]
        Top = 38
        ExplicitTop = 38
      end
      inherited Label38: TLabel [15]
        Left = 404
        ExplicitLeft = 404
      end
      inherited Label4: TLabel [16]
        Top = 115
        ExplicitTop = 115
      end
      inherited sbCep: TSpeedButton [17]
        Left = 84
        Top = 127
        ExplicitLeft = 84
        ExplicitTop = 127
      end
      object sbBuscarPai: TSpeedButton [18]
        Left = 356
        Top = 309
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
      object sbBuscarMae: TSpeedButton [19]
        Left = 355
        Top = 349
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
      object sbCopiarResp: TSpeedButton [20]
        Left = 107
        Top = 127
        Width = 20
        Height = 22
        Hint = 'Copiar o Endere'#231'o do Respons'#225'vel Financeiro'
        Caption = '...'
        Flat = True
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -15
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        NumGlyphs = 2
        ParentFont = False
        ParentShowHint = False
        ShowHint = True
        OnClick = sbCopiarRespClick
      end
      inherited lbTipoLogradouro: TLabel [21]
        Left = 5
        ExplicitLeft = 5
      end
      inherited lbNomeSocial: TLabel [22]
        Top = 38
        ExplicitTop = 38
      end
      inherited umAjuda: TUMAjuda
        Top = 50
        ExplicitTop = 50
      end
      inherited dbNomeOficial: TDBEdit
        Top = 16
        ExplicitTop = 16
      end
      inherited DBLookupComboBox2: TDBLookupComboBox [26]
        Left = 318
        Top = 93
        ExplicitLeft = 318
        ExplicitTop = 93
      end
      inherited dbNacionalidade: TUMComboBox [27]
        Left = 124
        Top = 93
        ExplicitLeft = 124
        ExplicitTop = 93
      end
      inherited dbCidadeAtual: TDBLookupComboBox [28]
        Top = 128
        ExplicitTop = 128
      end
      inherited dbNome: TDBEdit [29]
      end
      inherited dbNasc: TDBEdit [30]
      end
      inherited dbSexo: TDBComboBox [31]
      end
      inherited Panel1: TPanel [32]
        inherited imageFoto: TImage
          ExplicitWidth = 106
          ExplicitHeight = 121
        end
      end
      inherited dbCep: TDBEdit [33]
        Top = 128
        ExplicitTop = 128
      end
      inherited dbEndereco: TDBEdit [34]
        Left = 122
        ExplicitLeft = 122
      end
      inherited dbComplemento: TDBEdit [35]
        Left = 476
        ExplicitLeft = 476
      end
      inherited dbBairro: TDBEdit [36]
        Top = 128
        ExplicitTop = 128
      end
      inherited pcDocumentos: TPageControl [37]
        Left = 7
        Height = 103
        ExplicitLeft = 7
        ExplicitHeight = 103
        inherited TabSheet2: TTabSheet
          ExplicitHeight = 72
          inherited lblPassaporte: TLabel
            Top = 36
            ExplicitTop = 36
          end
          inherited dbPassaporte: TDBEdit
            Top = 51
            ExplicitTop = 51
          end
        end
        inherited TabSheet3: TTabSheet
          ExplicitHeight = 72
        end
        inherited TabSheet4: TTabSheet
          ExplicitHeight = 72
          inherited DBDOCNUME: TDBEdit
            Top = 52
            ExplicitTop = 52
          end
        end
        inherited tsCertidao: TTabSheet
          ExplicitHeight = 72
          inherited lbEmissaoCertidao: TLabel
            Top = -2
            ExplicitTop = -2
          end
          inherited lbOrgamCertidao: TLabel
            Top = -2
            ExplicitTop = -2
          end
          inherited lbMatricula: TLabel
            Top = 34
            ExplicitTop = 34
          end
          inherited lbLivro: TLabel
            Top = 34
            ExplicitTop = 34
          end
          inherited lbFolha: TLabel
            Top = 34
            ExplicitTop = 34
          end
          inherited lbNumeroTermo: TLabel
            Top = 34
            ExplicitTop = 34
          end
          inherited dbEmissaoCertidao: TDBEdit
            Top = 13
            ExplicitTop = 13
          end
          inherited dbUFCertidao: TDBEdit
            Top = 13
            ExplicitTop = 13
          end
          inherited dbOrgaoCertidao: TDBEdit
            Top = 13
            ExplicitTop = 13
          end
          inherited dbTipoCertidao: TDBComboBox
            Top = 13
            ExplicitTop = 13
          end
          inherited dbMatricula: TDBEdit
            Top = 49
            ExplicitTop = 49
          end
          inherited dbLivro: TDBEdit
            Top = 49
            ExplicitTop = 49
          end
          inherited dbFolha: TDBEdit
            Top = 49
            ExplicitTop = 49
          end
          inherited dbNumeroTErmo: TDBEdit
            Top = 49
            ExplicitTop = 49
          end
        end
      end
      inherited DBEdit2: TDBEdit [38]
        Left = 404
        ExplicitLeft = 404
      end
      inherited DBLookupComboBox3: TDBLookupComboBox
        Top = 128
        ExplicitTop = 128
      end
      inherited DBLookupComboBox4: TDBLookupComboBox
        Top = 54
        ExplicitTop = 54
      end
      inherited dbTipoLogradouro: TDBLookupComboBox
        Top = 167
        ExplicitTop = 167
      end
      inherited sbPaisCombo: TDBLookupComboBox
        Top = 93
        ExplicitTop = 93
      end
      inherited pnFotoBtn: TPanel
        Left = 653
        Top = 393
        ExplicitLeft = 653
        ExplicitTop = 393
      end
      inherited dbcUtilizaImagem: TDBCheckBox
        Top = 175
        ExplicitTop = 175
      end
      inherited DBCheckBox10: TDBCheckBox
        Top = 56
        ExplicitTop = 56
      end
      inherited dbCidadeNascimento: TDBLookupComboBox [47]
        Left = 452
        Top = 93
        OnDropDown = dbCidadeNascimentoDropDown
        ExplicitLeft = 452
        ExplicitTop = 93
      end
      inherited dbPais: TDBLookupComboBox [48]
        Left = 133
        Top = 127
        Width = 95
        ExplicitLeft = 133
        ExplicitTop = 127
        ExplicitWidth = 95
      end
      inherited pnContato: TPanel
        Top = 291
        Height = 320
        ExplicitTop = 291
        ExplicitHeight = 320
        inherited Label36: TLabel
          Left = 7
          Top = 0
          ExplicitLeft = 7
          ExplicitTop = 0
        end
        inherited Label35: TLabel
          Left = 7
          Top = 42
          ExplicitLeft = 7
          ExplicitTop = 42
        end
        inherited Label37: TLabel
          Left = 7
          Top = 82
          ExplicitLeft = 7
          ExplicitTop = 82
        end
        inherited lblMensagemHierarquia: TLabel
          Left = 388
          Top = 201
          ExplicitLeft = 388
          ExplicitTop = 201
        end
        inherited Label229: TLabel
          Left = 7
          Top = 122
          ExplicitLeft = 7
          ExplicitTop = 122
        end
        inherited Label230: TLabel
          Left = 7
          Top = 162
          ExplicitLeft = 7
          ExplicitTop = 162
        end
        inherited dbMae: TDBEdit
          Left = 7
          Top = 18
          ExplicitLeft = 7
          ExplicitTop = 18
        end
        inherited dbPai: TDBEdit
          Left = 7
          Top = 58
          ExplicitLeft = 7
          ExplicitTop = 58
        end
        inherited dbConjuge: TDBEdit
          Left = 7
          Top = 98
          ExplicitLeft = 7
          ExplicitTop = 98
        end
        inherited VSTContatos: TVirtualStringTree
          Left = 388
          Top = 18
          Height = 181
          TabOrder = 5
          ExplicitLeft = 388
          ExplicitTop = 18
          ExplicitHeight = 181
        end
        inherited DBEdit52: TDBEdit
          Left = 7
          Top = 138
          TabOrder = 3
          ExplicitLeft = 7
          ExplicitTop = 138
        end
        inherited DBEdit53: TDBEdit
          Left = 7
          Top = 178
          TabOrder = 4
          ExplicitLeft = 7
          ExplicitTop = 178
        end
      end
      inherited cbNomeOficial: TDBCheckBox
        Left = 7
        Top = 56
        ExplicitLeft = 7
        ExplicitTop = 56
      end
    end
    inherited tsComplementares: TTabSheet
      ExplicitWidth = 1085
      ExplicitHeight = 628
      inherited ScrollBox1: TScrollBox
        Width = 1085
        Height = 628
        ExplicitWidth = 1085
        ExplicitHeight = 628
        inherited Panel2: TPanel
          Width = 1081
          Height = 377
          ExplicitWidth = 1081
          ExplicitHeight = 377
          inherited Label39: TLabel
            Top = 1
            ExplicitTop = 1
          end
          inherited Label40: TLabel
            Left = 3
            Top = 126
            ExplicitLeft = 3
            ExplicitTop = 126
          end
          inherited SpeedButton1: TSpeedButton
            Top = 16
            ExplicitTop = 16
          end
          inherited Label74: TLabel
            Left = 109
            Top = 168
            ExplicitLeft = 109
            ExplicitTop = 168
          end
          inherited Bevel2: TBevel
            Left = 5
            Top = 215
            Width = 769
            Height = 5
            ExplicitLeft = 5
            ExplicitTop = 215
            ExplicitWidth = 769
            ExplicitHeight = 5
          end
          inherited Label33: TLabel
            Left = 552
            Top = 40
            Visible = False
            ExplicitLeft = 552
            ExplicitTop = 40
          end
          inherited Label108: TLabel
            Left = 691
            Top = 40
            Visible = False
            ExplicitLeft = 691
            ExplicitTop = 40
          end
          inherited Label109: TLabel
            Left = 863
            Top = 40
            Visible = False
            ExplicitLeft = 863
            ExplicitTop = 40
          end
          inherited lbVencimento: TLabel
            Top = 168
            ExplicitTop = 168
          end
          inherited Bevel3: TBevel
            Left = 4
            Top = 238
            ExplicitLeft = 4
            ExplicitTop = 238
          end
          inherited Label207: TLabel
            Left = 1
            Top = 360
            ExplicitLeft = 1
            ExplicitTop = 360
          end
          inherited Label210: TLabel
            Left = 183
            Top = 360
            ExplicitLeft = 183
            ExplicitTop = 360
          end
          inherited Label211: TLabel
            Left = 454
            Top = 360
            ExplicitLeft = 454
            ExplicitTop = 360
          end
          inherited lbDTCadastro: TLabel
            Left = 109
            Top = 360
            ExplicitLeft = 109
            ExplicitTop = 360
          end
          inherited lbDTAlteracao: TLabel
            Left = 378
            Top = 360
            ExplicitLeft = 378
            ExplicitTop = 360
          end
          inherited lbUsuario: TLabel
            Left = 703
            Top = 360
            ExplicitLeft = 703
            ExplicitTop = 360
          end
          object lbRaca: TLabel [16]
            Left = 401
            Top = -1
            Width = 26
            Height = 13
            Caption = 'Ra'#231'a'
          end
          object lblCodigoMec: TLabel [17]
            Left = 553
            Top = 0
            Width = 74
            Height = 13
            Caption = 'C'#243'digo do MEC'
          end
          object Label213: TLabel [18]
            Left = 20
            Top = 252
            Width = 80
            Height = 13
            Caption = 'Redigite a senha'
          end
          inherited sbDesvinculaEmpresa: TSpeedButton
            Top = 16
            ExplicitTop = 16
          end
          object Label227: TLabel [20]
            Left = 3
            Top = 88
            Width = 106
            Height = 13
            Caption = 'Forma'#231#227'o Acad'#234'mica:'
          end
          object Label1: TLabel [21]
            Left = 296
            Top = 126
            Width = 46
            Height = 13
            Caption = 'Profiss'#227'o:'
            FocusControl = DBEdit1
          end
          inherited lbFormaConheceuInst: TLabel
            Left = 296
            Top = 88
            ExplicitLeft = 296
            ExplicitTop = 88
          end
          inherited lbInformeFicouSabendo: TLabel
            Left = 542
            Top = 88
            ExplicitLeft = 542
            ExplicitTop = 88
          end
          inherited DBEdit1: TDBEdit
            Left = 3
            Top = 144
            TabOrder = 13
            OnKeyPress = dbNomeKeyPress
            ExplicitLeft = 3
            ExplicitTop = 144
          end
          inherited DBLookupComboBox1: TDBLookupComboBox
            Top = 17
            OnKeyPress = dbNomeKeyPress
            ExplicitTop = 17
          end
          inherited DBEdit13: TDBEdit
            Left = 109
            Top = 187
            TabOrder = 16
            OnKeyPress = dbNomeKeyPress
            ExplicitLeft = 109
            ExplicitTop = 187
          end
          inherited edLogin: TEdit
            Left = 552
            Top = 56
            Width = 133
            TabOrder = 7
            Visible = False
            ExplicitLeft = 552
            ExplicitTop = 56
            ExplicitWidth = 133
          end
          inherited edSenha1: TEdit
            Left = 691
            Top = 56
            TabOrder = 8
            Visible = False
            ExplicitLeft = 691
            ExplicitTop = 56
          end
          inherited edSenha2: TEdit
            Left = 862
            Top = 56
            TabOrder = 9
            Visible = False
            ExplicitLeft = 862
            ExplicitTop = 56
          end
          inherited dbDiaVencimento: TDBEdit
            Left = 3
            Top = 187
            TabOrder = 15
            ExplicitLeft = 3
            ExplicitTop = 187
          end
          inherited Button1: TButton
            Left = 478
            Top = 184
            TabOrder = 17
            ExplicitLeft = 478
            ExplicitTop = 184
          end
          inherited btnLiberarAcesso: TButton
            Left = 606
            Top = 184
            Width = 125
            TabOrder = 19
            ExplicitLeft = 606
            ExplicitTop = 184
            ExplicitWidth = 125
          end
          object pcAcessoOnline: TPageControl [33]
            Left = 3
            Top = 220
            Width = 762
            Height = 138
            ActivePage = tsAcessoOnline
            MultiLine = True
            TabOrder = 20
            object tsAcessoOnline: TTabSheet
              Caption = 'ACESSO ON-LINE'
              object sbAcessoOnline: TScrollBox
                AlignWithMargins = True
                Left = 3
                Top = 3
                Width = 748
                Height = 104
                Align = alClient
                TabOrder = 0
                object lbLoginAluno: TLabel
                  Left = 143
                  Top = 0
                  Width = 32
                  Height = 13
                  Caption = 'Login'
                  Font.Charset = DEFAULT_CHARSET
                  Font.Color = clWindowText
                  Font.Height = -11
                  Font.Name = 'MS Sans Serif'
                  Font.Style = [fsBold]
                  ParentFont = False
                end
                object lbSenhaAluno: TLabel
                  Left = 240
                  Top = 2
                  Width = 194
                  Height = 13
                  Caption = 'Senha (digite apenas para alterar)'
                  Font.Charset = DEFAULT_CHARSET
                  Font.Color = clWindowText
                  Font.Height = -11
                  Font.Name = 'MS Sans Serif'
                  Font.Style = [fsBold]
                  ParentFont = False
                end
                object lbRedgAluno: TLabel
                  Left = 440
                  Top = 2
                  Width = 97
                  Height = 13
                  Caption = 'Redigite a senha'
                  Font.Charset = DEFAULT_CHARSET
                  Font.Color = clWindowText
                  Font.Height = -11
                  Font.Name = 'MS Sans Serif'
                  Font.Style = [fsBold]
                  ParentFont = False
                end
                object lbAluno: TLabel
                  Left = 5
                  Top = 19
                  Width = 37
                  Height = 13
                  Caption = 'Aluno:'
                  Font.Charset = DEFAULT_CHARSET
                  Font.Color = clWindowText
                  Font.Height = -11
                  Font.Name = 'MS Sans Serif'
                  Font.Style = [fsBold]
                  ParentFont = False
                end
                object lbPai: TLabel
                  Left = 5
                  Top = 62
                  Width = 23
                  Height = 13
                  Caption = 'Pai:'
                  Font.Charset = DEFAULT_CHARSET
                  Font.Color = clWindowText
                  Font.Height = -11
                  Font.Name = 'MS Sans Serif'
                  Font.Style = [fsBold]
                  ParentFont = False
                end
                object lbMae: TLabel
                  Left = 5
                  Top = 101
                  Width = 29
                  Height = 13
                  Caption = 'M'#227'e:'
                  Font.Charset = DEFAULT_CHARSET
                  Font.Color = clWindowText
                  Font.Height = -11
                  Font.Name = 'MS Sans Serif'
                  Font.Style = [fsBold]
                  ParentFont = False
                end
                object lbResponAcad: TLabel
                  Left = 5
                  Top = 143
                  Width = 144
                  Height = 13
                  Caption = 'Respons'#225'vel Acad'#234'mico:'
                  Font.Charset = DEFAULT_CHARSET
                  Font.Color = clWindowText
                  Font.Height = -11
                  Font.Name = 'MS Sans Serif'
                  Font.Style = [fsBold]
                  ParentFont = False
                end
                object lbRespFinan: TLabel
                  Left = 5
                  Top = 187
                  Width = 141
                  Height = 13
                  Caption = 'Respons'#225'vel Financeiro:'
                  Font.Charset = DEFAULT_CHARSET
                  Font.Color = clWindowText
                  Font.Height = -11
                  Font.Name = 'MS Sans Serif'
                  Font.Style = [fsBold]
                  ParentFont = False
                end
                object lbNomeRespAcad: TLabel
                  Left = 155
                  Top = 143
                  Width = 80
                  Height = 13
                  Caption = 'Nome da pessoa'
                end
                object lbNomeRespFinan: TLabel
                  Left = 155
                  Top = 187
                  Width = 80
                  Height = 13
                  Caption = 'Nome da pessoa'
                end
                object lbNomeMae: TLabel
                  Left = 47
                  Top = 101
                  Width = 80
                  Height = 13
                  Caption = 'Nome da pessoa'
                  Font.Charset = DEFAULT_CHARSET
                  Font.Color = clWindowText
                  Font.Height = -11
                  Font.Name = 'MS Sans Serif'
                  Font.Style = []
                  ParentFont = False
                end
                object lbNomePai: TLabel
                  Left = 47
                  Top = 62
                  Width = 80
                  Height = 13
                  Caption = 'Nome da pessoa'
                end
                object lbNomeAluno: TLabel
                  Left = 47
                  Top = 19
                  Width = 80
                  Height = 13
                  Caption = 'Nome da pessoa'
                end
                object lbCodigoAluno: TLabel
                  Left = 5
                  Top = 0
                  Width = 40
                  Height = 13
                  Caption = 'C'#243'digo'
                  Font.Charset = DEFAULT_CHARSET
                  Font.Color = clWindowText
                  Font.Height = -11
                  Font.Name = 'MS Sans Serif'
                  Font.Style = [fsBold]
                  ParentFont = False
                end
                object Label212: TLabel
                  Left = 587
                  Top = 2
                  Width = 97
                  Height = 13
                  Caption = 'Senha Provis'#243'ria'
                  Font.Charset = DEFAULT_CHARSET
                  Font.Color = clWindowText
                  Font.Height = -11
                  Font.Name = 'MS Sans Serif'
                  Font.Style = [fsBold]
                  ParentFont = False
                end
                object edLoginAluno: TEdit
                  Left = 142
                  Top = 35
                  Width = 93
                  Height = 21
                  TabOrder = 1
                  OnExit = edLoginAlunoExit
                  OnKeyPress = edLoginKeyPress
                end
                object edSenhaAluno: TEdit
                  Left = 240
                  Top = 35
                  Width = 194
                  Height = 21
                  ParentShowHint = False
                  PasswordChar = '*'
                  ShowHint = True
                  TabOrder = 2
                  OnKeyPress = edSenha1KeyPress
                end
                object edRedgAluno: TEdit
                  Left = 440
                  Top = 35
                  Width = 181
                  Height = 21
                  PasswordChar = '*'
                  TabOrder = 3
                  OnKeyPress = edSenha2KeyPress
                end
                object edSenhaPai: TEdit
                  Left = 240
                  Top = 78
                  Width = 194
                  Height = 21
                  ParentShowHint = False
                  PasswordChar = '*'
                  ShowHint = True
                  TabOrder = 7
                  OnKeyPress = edSenha1KeyPress
                end
                object edRedgPai: TEdit
                  Left = 440
                  Top = 78
                  Width = 181
                  Height = 21
                  PasswordChar = '*'
                  TabOrder = 8
                  OnKeyPress = edSenha2KeyPress
                end
                object edLoginPai: TEdit
                  Left = 142
                  Top = 78
                  Width = 93
                  Height = 21
                  TabOrder = 6
                  OnKeyPress = edLoginKeyPress
                end
                object edLoginMae: TEdit
                  Left = 142
                  Top = 118
                  Width = 93
                  Height = 21
                  TabOrder = 11
                  OnKeyPress = edLoginKeyPress
                end
                object edSenhaMae: TEdit
                  Left = 240
                  Top = 118
                  Width = 192
                  Height = 21
                  ParentShowHint = False
                  PasswordChar = '*'
                  ShowHint = True
                  TabOrder = 12
                  OnKeyPress = edSenha1KeyPress
                end
                object edRedgMae: TEdit
                  Left = 440
                  Top = 118
                  Width = 181
                  Height = 21
                  PasswordChar = '*'
                  TabOrder = 13
                  OnKeyPress = edSenha2KeyPress
                end
                object edLoginRespAcad: TEdit
                  Left = 142
                  Top = 160
                  Width = 93
                  Height = 21
                  TabOrder = 16
                  OnKeyPress = edLoginKeyPress
                end
                object edSenhaRespAcad: TEdit
                  Left = 240
                  Top = 160
                  Width = 194
                  Height = 21
                  ParentShowHint = False
                  PasswordChar = '*'
                  ShowHint = True
                  TabOrder = 17
                  OnKeyPress = edSenha1KeyPress
                end
                object edRedgRespAcad: TEdit
                  Left = 440
                  Top = 160
                  Width = 181
                  Height = 21
                  PasswordChar = '*'
                  TabOrder = 18
                  OnKeyPress = edSenha2KeyPress
                end
                object edLoginRespFinan: TEdit
                  Left = 142
                  Top = 204
                  Width = 93
                  Height = 21
                  TabOrder = 21
                  OnKeyPress = edLoginKeyPress
                end
                object edSenhaRespFinan: TEdit
                  Left = 240
                  Top = 204
                  Width = 194
                  Height = 21
                  ParentShowHint = False
                  PasswordChar = '*'
                  ShowHint = True
                  TabOrder = 22
                  OnKeyPress = edSenha1KeyPress
                end
                object edRedgRespFinan: TEdit
                  Left = 440
                  Top = 203
                  Width = 181
                  Height = 21
                  PasswordChar = '*'
                  TabOrder = 23
                  OnKeyPress = edSenha2KeyPress
                end
                object edCodigoAluno: TEdit
                  Left = 5
                  Top = 35
                  Width = 131
                  Height = 21
                  Color = cl3DLight
                  Enabled = False
                  Font.Charset = DEFAULT_CHARSET
                  Font.Color = clWindowText
                  Font.Height = -11
                  Font.Name = 'MS Sans Serif'
                  Font.Style = []
                  ParentFont = False
                  ReadOnly = True
                  TabOrder = 0
                  OnKeyPress = edLoginKeyPress
                end
                object edCodigoPai: TEdit
                  Left = 5
                  Top = 78
                  Width = 131
                  Height = 21
                  Color = cl3DLight
                  Enabled = False
                  ReadOnly = True
                  TabOrder = 5
                  OnKeyPress = edLoginKeyPress
                end
                object edCodigoMae: TEdit
                  Left = 5
                  Top = 118
                  Width = 131
                  Height = 21
                  Color = cl3DLight
                  Enabled = False
                  ReadOnly = True
                  TabOrder = 10
                  OnKeyPress = edLoginKeyPress
                end
                object edCodigoRespAcad: TEdit
                  Left = 5
                  Top = 160
                  Width = 131
                  Height = 21
                  Color = cl3DLight
                  Enabled = False
                  ReadOnly = True
                  TabOrder = 15
                  OnKeyPress = edLoginKeyPress
                end
                object edCodigoRespFinan: TEdit
                  Left = 5
                  Top = 203
                  Width = 131
                  Height = 21
                  Color = cl3DLight
                  Enabled = False
                  ReadOnly = True
                  TabOrder = 20
                  OnKeyPress = edLoginKeyPress
                end
                object cbProvAluno: TCheckBox
                  Left = 634
                  Top = 36
                  Width = 16
                  Height = 17
                  Checked = True
                  State = cbChecked
                  TabOrder = 4
                  OnClick = cbProvAlunoClick
                  OnMouseDown = cbProvAlunoMouseDown
                end
                object cbProvPai: TCheckBox
                  Left = 634
                  Top = 82
                  Width = 16
                  Height = 17
                  Checked = True
                  State = cbChecked
                  TabOrder = 9
                  OnClick = cbProvPaiClick
                  OnMouseDown = cbProvPaiMouseDown
                end
                object cbProvMae: TCheckBox
                  Left = 634
                  Top = 120
                  Width = 16
                  Height = 17
                  Checked = True
                  Enabled = False
                  State = cbChecked
                  TabOrder = 14
                  OnClick = cbProvMaeClick
                  OnMouseDown = cbProvMaeMouseDown
                end
                object cbProvRespAcad: TCheckBox
                  Left = 634
                  Top = 162
                  Width = 16
                  Height = 17
                  Checked = True
                  Enabled = False
                  State = cbChecked
                  TabOrder = 19
                  OnClick = cbProvRespAcadClick
                  OnMouseDown = cbProvRespAcadMouseDown
                end
                object cbProvRespFinan: TCheckBox
                  Left = 634
                  Top = 204
                  Width = 16
                  Height = 17
                  Checked = True
                  Enabled = False
                  State = cbChecked
                  TabOrder = 24
                  OnClick = cbProvRespFinanClick
                  OnMouseDown = cbProvRespFinanMouseDown
                end
              end
            end
          end
          object dbclRacas: TDBLookupComboBox [34]
            Left = 401
            Top = 18
            Width = 145
            Height = 21
            DataField = 'descRaca'
            DataSource = dsPessoa
            TabOrder = 1
          end
          object dbeMec: TDBEdit [35]
            Left = 552
            Top = 19
            Width = 121
            Height = 21
            DataField = 'cd_mec'
            DataSource = dsPessoa
            TabOrder = 2
          end
          inherited btnBloquearOnline: TButton
            Left = 604
            Top = 184
            Width = 125
            TabOrder = 18
            ExplicitLeft = 604
            ExplicitTop = 184
            ExplicitWidth = 125
          end
          inherited cbRetiraMaterial: TDBCheckBox
            TabOrder = 6
          end
          object DBCheckBox6: TDBCheckBox [38]
            Left = 3
            Top = 69
            Width = 222
            Height = 17
            Caption = 'Bloquear envio de cartas de ocorr'#234'ncias'
            DataField = 'sn_bloq_cartas'
            DataSource = dsPessoa
            TabOrder = 4
            ValueChecked = '1'
            ValueUnchecked = '0'
          end
          object DBCheckBox7: TDBCheckBox [39]
            Left = 220
            Top = 69
            Width = 235
            Height = 17
            Caption = 'Bloquear envio de e-mails sobre ocorr'#234'ncias'
            DataField = 'sn_bloq_emails'
            DataSource = dsPessoa
            TabOrder = 5
            ValueChecked = '1'
            ValueUnchecked = '0'
          end
          object DBCheckBox8: TDBCheckBox [40]
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
          object DBEdit42: TDBEdit [41]
            Left = 3
            Top = 103
            Width = 245
            Height = 21
            DataField = 'ds_formacao_academica'
            DataSource = dsPessoa
            TabOrder = 10
          end
          object dbProfissao: TDBEdit [42]
            Left = 295
            Top = 145
            Width = 241
            Height = 21
            DataField = 'ds_profissao'
            DataSource = dsPessoa
            TabOrder = 14
            OnKeyPress = dbNomeKeyPress
          end
          inherited cbFormaConhece: TComboBox
            Left = 295
            Top = 103
            Width = 241
            Style = csDropDownList
            TabOrder = 11
            ExplicitLeft = 295
            ExplicitTop = 103
            ExplicitWidth = 241
          end
          inherited edFormaConheceuOutro: TEdit
            Left = 540
            Top = 103
            Width = 187
            TabOrder = 12
            Visible = False
            ExplicitLeft = 540
            ExplicitTop = 103
            ExplicitWidth = 187
          end
          object btnAddProfissao: TBitBtn
            Left = 553
            Top = 145
            Width = 26
            Height = 21
            TabOrder = 21
            Visible = False
            OnClick = btnAddProfissaoClick
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
          end
        end
        inherited Panel4: TPanel
          Top = 377
          Width = 1081
          ExplicitTop = 377
          ExplicitWidth = 1081
          inherited btnAlteraObs: TBitBtn
            Left = 1011
            ExplicitLeft = 1011
          end
          inherited btnSalvarObs: TBitBtn
            Left = 1034
            ExplicitLeft = 1034
          end
          inherited btnCancelarObs: TBitBtn
            Left = 1057
            ExplicitLeft = 1057
          end
        end
        inherited dbObs: TDBMemo
          Top = 401
          Width = 1081
          Height = 102
          ExplicitTop = 401
          ExplicitWidth = 1081
          ExplicitHeight = 102
        end
        inherited lbVinculoExterno: TPanel
          Top = 503
          Width = 1081
          ExplicitTop = 503
          ExplicitWidth = 1081
        end
        inherited pnVinculosExterno: TPanel
          Top = 528
          Width = 1081
          ExplicitTop = 528
          ExplicitWidth = 1081
          inherited pnAcoesVinculoExterno: TPanel
            Left = 1057
            ExplicitLeft = 1057
          end
          inherited grVinculosExterno: TDBGrid
            Width = 1057
          end
        end
      end
    end
    object tsPai: TTabSheet [2]
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
        Font.Height = -12
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
      end
      object Label113: TLabel
        Left = 335
        Top = 0
        Width = 24
        Height = 13
        Caption = 'Sexo'
      end
      object Label115: TLabel
        Left = 6
        Top = 80
        Width = 19
        Height = 13
        Caption = 'Cep'
        FocusControl = DBEdit60
      end
      object Label116: TLabel
        Left = 339
        Top = 80
        Width = 33
        Height = 13
        Caption = 'Cidade'
      end
      object Label117: TLabel
        Left = 118
        Top = 120
        Width = 54
        Height = 13
        Caption = 'Logradouro'
        FocusControl = DBEdit62
      end
      object Label118: TLabel
        Left = 472
        Top = 120
        Width = 64
        Height = 13
        Caption = 'Complemento'
        FocusControl = DBEdit63
      end
      object Label119: TLabel
        Left = 497
        Top = 81
        Width = 27
        Height = 13
        Caption = 'Bairro'
        FocusControl = DBEdit64
      end
      object Label120: TLabel
        Left = 128
        Top = 80
        Width = 22
        Height = 13
        Caption = 'Pa'#237's'
      end
      object Label121: TLabel
        Left = 422
        Top = -1
        Width = 55
        Height = 13
        Caption = 'Estado Civil'
      end
      object Label125: TLabel
        Left = 401
        Top = 120
        Width = 37
        Height = 13
        Caption = 'N'#250'mero'
        FocusControl = DBEdit69
      end
      object Label128: TLabel
        Left = 230
        Top = 80
        Width = 33
        Height = 13
        Caption = 'Estado'
      end
      object sbCepPai: TSpeedButton
        Left = 80
        Top = 96
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
        OnClick = sbCepPaiClick
      end
      object sbCopiarAluno: TSpeedButton
        Left = 103
        Top = 96
        Width = 20
        Height = 22
        Hint = 'Copiar o Endere'#231'o do Aluno'
        Caption = '...'
        Flat = True
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -15
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        NumGlyphs = 2
        ParentFont = False
        ParentShowHint = False
        ShowHint = True
        OnClick = sbCopiarAlunoClick
      end
      object Label112: TLabel
        Left = 322
        Top = 40
        Width = 64
        Height = 13
        Caption = 'Estado Nasc.'
        FocusControl = DBLookupComboBox11
      end
      object Label114: TLabel
        Left = 453
        Top = 40
        Width = 64
        Height = 13
        Caption = 'Cidade Nasc.'
        Transparent = True
      end
      object Label126: TLabel
        Left = 7
        Top = 40
        Width = 53
        Height = 13
        Caption = 'Pa'#237's Nasc.'
      end
      object Label127: TLabel
        Left = 127
        Top = 40
        Width = 68
        Height = 13
        Caption = 'Nacionalidade'
      end
      object Label216: TLabel
        Left = 5
        Top = 121
        Width = 78
        Height = 13
        Caption = 'Tipo Logradouro'
      end
      object dbNomePai: TDBEdit
        Left = 6
        Top = 13
        Width = 326
        Height = 21
        DataField = 'nm_pessoa'
        DataSource = dsResponsavel
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -12
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
        TabOrder = 0
        OnExit = dbNomeRespFinanExit
        OnKeyPress = dbNomeKeyPress
      end
      object DBEdit57: TDBEdit
        Left = 561
        Top = 13
        Width = 91
        Height = 21
        DataField = 'dt_nascimento'
        DataSource = dsResponsavel
        TabOrder = 3
        OnKeyPress = dbNomeKeyPress
      end
      object DBComboBox1: TDBComboBox
        Left = 335
        Top = 13
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
      object DBEdit60: TDBEdit
        Left = 6
        Top = 96
        Width = 75
        Height = 21
        DataField = 'ds_cep'
        DataSource = dsResponsavel
        TabOrder = 8
        OnKeyPress = dbNomeKeyPress
      end
      object DBEdit62: TDBEdit
        Left = 118
        Top = 136
        Width = 273
        Height = 21
        DataField = 'ds_logradouro'
        DataSource = dsResponsavel
        TabOrder = 14
        OnKeyPress = dbNomeKeyPress
      end
      object DBEdit63: TDBEdit
        Left = 472
        Top = 136
        Width = 181
        Height = 21
        DataField = 'ds_complemento'
        DataSource = dsResponsavel
        TabOrder = 16
        OnKeyPress = DBEdit63KeyPress
      end
      object DBEdit64: TDBEdit
        Left = 496
        Top = 96
        Width = 157
        Height = 21
        DataField = 'ds_bairro'
        DataSource = dsResponsavel
        TabOrder = 12
        OnKeyPress = dbNomeKeyPress
      end
      object DBEdit69: TDBEdit
        Left = 400
        Top = 136
        Width = 65
        Height = 21
        DataField = 'ds_logradouro_nro'
        DataSource = dsResponsavel
        TabOrder = 15
        OnKeyPress = dbNomeKeyPress
      end
      object DBLookupComboBox13: TDBLookupComboBox
        Left = 422
        Top = 13
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
        TabOrder = 18
        Visible = False
        OnDblClick = imageFotoDblClick
        object Image1: TImage
          Left = 1
          Top = 1
          Width = 105
          Height = 120
          Hint = 'Duplo clique para procurar a foto.'
          Align = alClient
          Enabled = False
          Proportional = True
          Stretch = True
          Visible = False
          OnDblClick = imageFotoDblClick
          ExplicitHeight = 121
        end
        object Label129: TLabel
          Left = 36
          Top = 52
          Width = 42
          Height = 17
          Caption = 'FOTO'
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -15
          Font.Name = 'Arial'
          Font.Style = []
          ParentFont = False
          Transparent = True
          Visible = False
          OnDblClick = imageFotoDblClick
        end
      end
      object pgDocPai: TPageControl
        Left = 6
        Top = 163
        Width = 761
        Height = 70
        ActivePage = TabSheet6
        MultiLine = True
        Style = tsFlatButtons
        TabOrder = 17
        OnChange = pgDocPaiChange
        object TabSheet6: TTabSheet
          Caption = 'Documenta'#231#227'o'
          object Label150: TLabel
            Left = 1
            Top = 0
            Width = 20
            Height = 13
            Caption = 'CPF'
            FocusControl = dbCPFPai
          end
          object Label151: TLabel
            Left = 161
            Top = 0
            Width = 50
            Height = 13
            Caption = 'Identidade'
            FocusControl = DBEdit87
          end
          object Label152: TLabel
            Left = 321
            Top = 0
            Width = 67
            Height = 13
            Caption = 'Org'#227'o/Estado'
            FocusControl = DBEdit88
          end
          object Label153: TLabel
            Left = 480
            Top = 0
            Width = 76
            Height = 13
            Caption = 'Data Expedi'#231#227'o'
            FocusControl = DBEdit89
          end
          object SpeedButton5: TSpeedButton
            Left = 599
            Top = 12
            Width = 145
            Height = 25
            Caption = 'F10   Mais Informa'#231#245'es >>'
            Flat = True
            NumGlyphs = 2
            OnClick = sbMaisInformacoesAcademicoClick
          end
          object Label222: TLabel
            Left = 1
            Top = 39
            Width = 53
            Height = 13
            Caption = 'Passaporte'
            FocusControl = dbPassaportePai
          end
          object dbCPFPai: TDBEdit
            Left = 0
            Top = 15
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
          object DBEdit88: TDBEdit
            Left = 321
            Top = 16
            Width = 150
            Height = 21
            DataField = 'ds_identidade_orgao_exp'
            DataSource = dsResponsavel
            TabOrder = 2
            OnKeyPress = dbNomeKeyPress
          end
          object DBEdit89: TDBEdit
            Left = 480
            Top = 16
            Width = 113
            Height = 21
            DataField = 'dt_identidade_expedicao'
            DataSource = dsResponsavel
            TabOrder = 3
            OnKeyPress = dbNomeKeyPress
          end
          object dbPassaportePai: TDBEdit
            Left = 0
            Top = 54
            Width = 150
            Height = 21
            DataField = 'ds_passaporte'
            DataSource = dsResponsavel
            TabOrder = 4
            OnKeyPress = dbNomeKeyPress
          end
        end
        object TabSheet7: TTabSheet
          Caption = 'T'#237'tulo Eleitoral'
          ImageIndex = 1
          object Label154: TLabel
            Left = 0
            Top = -1
            Width = 51
            Height = 13
            Caption = 'Nro. T'#237'tulo'
            FocusControl = DBEdit90
          end
          object Label155: TLabel
            Left = 471
            Top = 0
            Width = 65
            Height = 13
            Caption = 'Data Emiss'#227'o'
            FocusControl = DBEdit91
          end
          object Label156: TLabel
            Left = 157
            Top = 0
            Width = 31
            Height = 13
            Caption = 'Se'#231#227'o'
            FocusControl = DBEdit92
          end
          object Label157: TLabel
            Left = 314
            Top = 0
            Width = 25
            Height = 13
            Caption = 'Zona'
            FocusControl = DBEdit93
          end
          object DBEdit90: TDBEdit
            Left = 0
            Top = 16
            Width = 150
            Height = 21
            DataField = 'ds_titulo_numero'
            DataSource = dsResponsavel
            TabOrder = 0
          end
          object DBEdit91: TDBEdit
            Left = 471
            Top = 16
            Width = 150
            Height = 21
            DataField = 'dt_titulo_emissao'
            DataSource = dsResponsavel
            TabOrder = 3
          end
          object DBEdit92: TDBEdit
            Left = 157
            Top = 16
            Width = 150
            Height = 21
            DataField = 'ds_titulo_secao'
            DataSource = dsResponsavel
            TabOrder = 1
          end
          object DBEdit93: TDBEdit
            Left = 314
            Top = 16
            Width = 150
            Height = 21
            DataField = 'ds_titulo_zona'
            DataSource = dsResponsavel
            TabOrder = 2
          end
        end
        object TabSheet15: TTabSheet
          Caption = 'Servi'#231'o Militar'
          ImageIndex = 2
          object Label158: TLabel
            Left = 2
            Top = 0
            Width = 55
            Height = 13
            Caption = 'Corpora'#231#227'o'
          end
          object Label159: TLabel
            Left = 146
            Top = 0
            Width = 54
            Height = 13
            Caption = 'Org'#227'o S.M.'
          end
          object Label160: TLabel
            Left = 270
            Top = 0
            Width = 84
            Height = 13
            Caption = 'N'#250'mero do Org'#227'o'
            FocusControl = DBEdit94
          end
          object Label161: TLabel
            Left = 396
            Top = 0
            Width = 80
            Height = 13
            Caption = 'Documento S.M.'
          end
          object Label162: TLabel
            Left = 628
            Top = 0
            Width = 63
            Height = 13
            Caption = 'N'#250'mero Doc.'
            FocusControl = DBEdit95
          end
          object DBEdit94: TDBEdit
            Left = 270
            Top = 16
            Width = 121
            Height = 21
            DataField = 'ds_rm_org_numero'
            DataSource = dsResponsavel
            TabOrder = 2
          end
          object DBEdit95: TDBEdit
            Left = 627
            Top = 16
            Width = 121
            Height = 21
            DataField = 'ds_rm_doc_numero'
            DataSource = dsResponsavel
            TabOrder = 4
          end
          object DBComboBox8: TDBComboBox
            Left = 2
            Top = 16
            Width = 137
            Height = 21
            DataField = 'ds_rm_corporacao'
            DataSource = dsResponsavel
            ItemHeight = 13
            Items.Strings = (
              'EX'#201'RCITO'
              'MARINHA'
              'AERON'#193'UTICA')
            TabOrder = 0
          end
          object DBComboBox12: TDBComboBox
            Left = 144
            Top = 16
            Width = 121
            Height = 21
            DataField = 'ds_rm_orgao'
            DataSource = dsResponsavel
            ItemHeight = 13
            Items.Strings = (
              'SSMR'
              'CSM'
              'SDR'
              'SERMOB'
              'SMOB')
            TabOrder = 1
          end
          object DBComboBox13: TDBComboBox
            Left = 396
            Top = 16
            Width = 222
            Height = 21
            DataField = 'ds_rm_doc_tipo'
            DataSource = dsResponsavel
            ItemHeight = 13
            Items.Strings = (
              'Certificado de Alistamento Militar'
              'Certificado de Reservista;'
              'Certificado de Dispensa de Incorpora'#231#227'o;'
              'Certificado de Isen'#231#227'o;'
              'Certid'#227'o de Situa'#231#227'o Militar'
              'Carta Patente '
              'Provis'#227'o de Reforma'
              'Atestado de Situa'#231#227'o Militar'
              'Atestado de Desobrigado do Servi'#231'o Militar')
            TabOrder = 3
          end
        end
        object TabSheet16: TTabSheet
          Caption = 'Certid'#227'o Civil'
          ImageIndex = 3
          object Label163: TLabel
            Left = 0
            Top = 0
            Width = 78
            Height = 13
            Caption = 'Tipo de Certid'#227'o'
          end
          object Label164: TLabel
            Left = 144
            Top = 0
            Width = 85
            Height = 13
            Caption = 'N'#250'mero do Termo'
            FocusControl = DBEdit96
          end
          object Label165: TLabel
            Left = 240
            Top = 0
            Width = 26
            Height = 13
            Caption = 'Folha'
            FocusControl = DBEdit97
          end
          object Label166: TLabel
            Left = 320
            Top = 0
            Width = 23
            Height = 13
            Caption = 'Livro'
            FocusControl = DBEdit98
          end
          object Label167: TLabel
            Left = 424
            Top = 0
            Width = 80
            Height = 13
            Caption = 'Data de Emiss'#227'o'
            FocusControl = DBEdit99
          end
          object Label168: TLabel
            Left = 528
            Top = 0
            Width = 53
            Height = 13
            Caption = 'UF Cart'#243'rio'
            FocusControl = DBEdit100
          end
          object Label169: TLabel
            Left = 592
            Top = 0
            Width = 82
            Height = 13
            Caption = 'Nome do Cart'#243'rio'
            FocusControl = DBEdit101
          end
          object DBEdit96: TDBEdit
            Left = 144
            Top = 16
            Width = 89
            Height = 21
            DataField = 'nr_cert_termo'
            DataSource = dsResponsavel
            TabOrder = 1
            OnKeyPress = dbNomeKeyPress
          end
          object DBEdit97: TDBEdit
            Left = 240
            Top = 16
            Width = 73
            Height = 21
            DataField = 'ds_cert_folha'
            DataSource = dsResponsavel
            TabOrder = 2
            OnKeyPress = dbNomeKeyPress
          end
          object DBEdit98: TDBEdit
            Left = 320
            Top = 16
            Width = 97
            Height = 21
            DataField = 'ds_cert_livro'
            DataSource = dsResponsavel
            TabOrder = 3
            OnKeyPress = dbNomeKeyPress
          end
          object DBEdit99: TDBEdit
            Left = 424
            Top = 16
            Width = 97
            Height = 21
            DataField = 'dt_cert'
            DataSource = dsResponsavel
            TabOrder = 4
            OnKeyPress = dbNomeKeyPress
          end
          object DBEdit100: TDBEdit
            Left = 528
            Top = 16
            Width = 57
            Height = 21
            DataField = 'ds_cert_uf'
            DataSource = dsResponsavel
            TabOrder = 5
            OnKeyPress = dbNomeKeyPress
          end
          object DBEdit101: TDBEdit
            Left = 592
            Top = 16
            Width = 136
            Height = 21
            DataField = 'ds_cert_orgao'
            DataSource = dsResponsavel
            TabOrder = 6
            OnKeyPress = dbNomeKeyPress
          end
          object DBComboBox14: TDBComboBox
            Left = 0
            Top = 16
            Width = 138
            Height = 21
            DataField = 'tp_cert'
            DataSource = dsResponsavel
            ItemHeight = 13
            Items.Strings = (
              'Nascimento'
              'Casamento'
              'Div'#243'rcio')
            TabOrder = 0
            OnKeyPress = dbNomeKeyPress
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
            FocusControl = DBEdit3
          end
          object DBEdit3: TDBEdit
            Left = 2
            Top = 16
            Width = 310
            Height = 21
            DataField = 'ds_cargo'
            DataSource = dsResponsavel
            TabOrder = 0
            OnKeyPress = dbNomeKeyPress
          end
          object DBCheckBox2: TDBCheckBox
            Left = 329
            Top = 1
            Width = 287
            Height = 13
            Caption = 'Permitir o acesso do pai como respons'#225'vel acad'#234'mico.'
            DataField = 'sn_pai_resp'
            DataSource = dsPessoa
            TabOrder = 1
            ValueChecked = '1'
            ValueUnchecked = '0'
            OnClick = DBCheckBox2Click
          end
          object DBCheckBox4: TDBCheckBox
            Left = 566
            Top = 21
            Width = 97
            Height = 17
            Caption = 'In Memorian'
            DataField = 'sn_obito'
            DataSource = dsResponsavel
            TabOrder = 3
            ValueChecked = '1'
            ValueUnchecked = '0'
          end
          object DBCheckBox1: TDBCheckBox
            Left = 329
            Top = 21
            Width = 231
            Height = 13
            Caption = 'Bloquear envio de e-mails sobre ocorr'#234'ncias'
            DataField = 'sn_bloq_emails'
            DataSource = dsResponsavel
            TabOrder = 2
            ValueChecked = '1'
            ValueUnchecked = '0'
            OnClick = DBCheckBox2Click
          end
        end
      end
      object DBLookupComboBox11: TDBLookupComboBox
        Left = 321
        Top = 53
        Width = 126
        Height = 21
        DataField = 'descEstadoNasc'
        DataSource = dsResponsavel
        TabOrder = 6
        OnKeyPress = dbNomeKeyPress
      end
      object DBLookupComboBox17: TDBLookupComboBox
        Left = 453
        Top = 53
        Width = 202
        Height = 21
        DataField = 'descMunicipio'
        DataSource = dsResponsavel
        TabOrder = 7
        OnKeyPress = dbNomeKeyPress
      end
      object DBLookupComboBox18: TDBLookupComboBox
        Left = 7
        Top = 53
        Width = 113
        Height = 21
        DataField = 'descPaisNasc'
        DataSource = dsResponsavel
        DropDownWidth = 150
        TabOrder = 4
        OnCloseUp = DBLookupComboBox18CloseUp
        OnExit = DBLookupComboBox18Exit
        OnKeyPress = dbNomeKeyPress
      end
      object DBLookupComboBox12: TDBLookupComboBox
        Left = 339
        Top = 93
        Width = 151
        Height = 21
        DataField = 'descMunicipioAtual'
        DataSource = dsResponsavel
        TabOrder = 11
        OnKeyPress = dbNomeKeyPress
      end
      object DBLookupComboBox23: TDBLookupComboBox
        Left = 229
        Top = 96
        Width = 106
        Height = 21
        DataField = 'descEstado'
        DataSource = dsResponsavel
        DropDownWidth = 150
        TabOrder = 10
        OnKeyPress = dbNomeKeyPress
      end
      object dblbTpLogradouros: TDBLookupComboBox
        Left = 6
        Top = 136
        Width = 105
        Height = 21
        DataField = 'desLogradouro'
        DataSource = dsResponsavel
        TabOrder = 13
        OnCloseUp = dblbTpLogradourosCloseUp
      end
      object DBLookupComboBox31: TDBLookupComboBox
        Left = 129
        Top = 96
        Width = 95
        Height = 21
        DataField = 'descPais'
        DataSource = dsResponsavel
        DropDownWidth = 150
        TabOrder = 9
        OnCloseUp = DBLookupComboBox31CloseUp
        OnExit = DBLookupComboBox31Exit
        OnKeyPress = dbNomeKeyPress
      end
      object cbNacionalidadePai: TUMComboBox
        Left = 126
        Top = 53
        Width = 189
        Height = 21
        ItemHeight = 13
        TabOrder = 5
        OnCloseUp = cbNacionalidadePaiCloseUp
        OnExit = cbNacionalidadePaiExit
        OnKeyDown = cbNacionalidadePaiKeyDown
        OnKeyPress = cbNacionalidadePaiKeyPress
        TamanhoMaximo = 0
      end
      object pnl1: TPanel
        Left = 0
        Top = 233
        Width = 904
        Height = 272
        BevelOuter = bvNone
        TabOrder = 19
        object lblMensagemHierarquiaPai: TLabel
          Left = 375
          Top = 218
          Width = 375
          Height = 26
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
        object Label124: TLabel
          Left = 6
          Top = 0
          Width = 85
          Height = 13
          Caption = 'Nome do Conjuge'
          FocusControl = DBEdit68
        end
        object Label122: TLabel
          Left = 6
          Top = 40
          Width = 61
          Height = 13
          Caption = 'Nome do Pai'
          FocusControl = DBEdit66
        end
        object Label123: TLabel
          Left = 6
          Top = 80
          Width = 67
          Height = 13
          Caption = 'Nome da M'#227'e'
          FocusControl = DBEdit67
        end
        object Label28: TLabel
          Left = 7
          Top = 126
          Width = 46
          Height = 13
          Caption = 'Profiss'#227'o:'
          FocusControl = DBEdit66
        end
        object Label29: TLabel
          Left = 7
          Top = 172
          Width = 85
          Height = 13
          Caption = 'Local de trabalho:'
          FocusControl = DBEdit66
        end
        object DBEdit67: TDBEdit
          Left = 7
          Top = 99
          Width = 363
          Height = 21
          DataField = 'nm_mae'
          DataSource = dsResponsavel
          TabOrder = 2
          OnKeyPress = dbNomeKeyPress
        end
        object DBEdit68: TDBEdit
          Left = 6
          Top = 16
          Width = 363
          Height = 21
          DataField = 'nm_conjuge'
          DataSource = dsResponsavel
          TabOrder = 0
          OnKeyPress = dbNomeKeyPress
        end
        object DBEdit66: TDBEdit
          Left = 6
          Top = 56
          Width = 363
          Height = 21
          DataField = 'nm_pai'
          DataSource = dsResponsavel
          TabOrder = 1
          OnKeyPress = dbNomeKeyPress
        end
        object VSTContatosPai: TVirtualStringTree
          Left = 376
          Top = 14
          Width = 377
          Height = 198
          Header.AutoSizeIndex = 0
          Header.Font.Charset = DEFAULT_CHARSET
          Header.Font.Color = clWindowText
          Header.Font.Height = -11
          Header.Font.Name = 'Tahoma'
          Header.Font.Style = []
          Header.MainColumn = -1
          TabOrder = 5
          Columns = <>
        end
        object db_pessoa_profissao: TDBEdit
          Left = 7
          Top = 145
          Width = 363
          Height = 21
          DataField = 'ds_profissao'
          DataSource = dsResponsavel
          TabOrder = 3
          OnKeyPress = dbNomeKeyPress
        end
        object db_local_trabalho: TDBEdit
          Left = 6
          Top = 191
          Width = 363
          Height = 21
          DataField = 'ds_local_trabalho'
          DataSource = dsResponsavel
          TabOrder = 4
          OnKeyPress = dbNomeKeyPress
        end
      end
    end
    object tsMae: TTabSheet [3]
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
        Font.Height = -12
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
      object Label135: TLabel
        Left = 6
        Top = 80
        Width = 19
        Height = 13
        Caption = 'Cep'
        FocusControl = DBEdit75
      end
      object Label137: TLabel
        Left = 118
        Top = 120
        Width = 54
        Height = 13
        Caption = 'Logradouro'
        FocusControl = DBEdit77
      end
      object Label138: TLabel
        Left = 474
        Top = 120
        Width = 64
        Height = 13
        Caption = 'Complemento'
        FocusControl = DBEdit78
      end
      object Label141: TLabel
        Left = 422
        Top = 0
        Width = 55
        Height = 13
        Caption = 'Estado Civil'
      end
      object Label145: TLabel
        Left = 400
        Top = 120
        Width = 37
        Height = 13
        Caption = 'N'#250'mero'
        FocusControl = DBEdit84
      end
      object SpeedButton4: TSpeedButton
        Left = 80
        Top = 96
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
        OnClick = sbCepPaiClick
      end
      object SpeedButton3: TSpeedButton
        Left = 103
        Top = 96
        Width = 20
        Height = 22
        Hint = 'Copiar o Endere'#231'o do Aluno'
        Caption = '...'
        Flat = True
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -15
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        NumGlyphs = 2
        ParentFont = False
        ParentShowHint = False
        ShowHint = True
        OnClick = sbCopiarAlunoClick
      end
      object Label132: TLabel
        Left = 321
        Top = 40
        Width = 64
        Height = 13
        Caption = 'Estado Nasc.'
      end
      object Label134: TLabel
        Left = 452
        Top = 40
        Width = 64
        Height = 13
        Caption = 'Cidade Nasc.'
        Transparent = True
      end
      object Label146: TLabel
        Left = 7
        Top = 40
        Width = 53
        Height = 13
        Caption = 'Pa'#237's Nasc.'
      end
      object Label147: TLabel
        Left = 126
        Top = 40
        Width = 68
        Height = 13
        Caption = 'Nacionalidade'
      end
      object Label136: TLabel
        Left = 128
        Top = 80
        Width = 22
        Height = 13
        Caption = 'Pa'#237's'
      end
      object Label139: TLabel
        Left = 230
        Top = 80
        Width = 33
        Height = 13
        Caption = 'Estado'
      end
      object Label140: TLabel
        Left = 339
        Top = 80
        Width = 33
        Height = 13
        Caption = 'Cidade'
      end
      object Label148: TLabel
        Left = 497
        Top = 81
        Width = 27
        Height = 13
        Caption = 'Bairro'
        FocusControl = DBEdit34
      end
      object Label214: TLabel
        Left = 7
        Top = 120
        Width = 78
        Height = 13
        Caption = 'Tipo Logradouro'
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
        Font.Height = -12
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
        Left = 338
        Top = 15
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
      object DBEdit75: TDBEdit
        Left = 6
        Top = 96
        Width = 75
        Height = 21
        CharCase = ecUpperCase
        DataField = 'ds_cep'
        DataSource = dsResponsavel
        TabOrder = 8
        OnKeyPress = dbNomeKeyPress
      end
      object DBEdit77: TDBEdit
        Left = 118
        Top = 136
        Width = 273
        Height = 21
        DataField = 'ds_logradouro'
        DataSource = dsResponsavel
        TabOrder = 14
        OnKeyPress = dbNomeKeyPress
      end
      object DBEdit78: TDBEdit
        Left = 472
        Top = 136
        Width = 181
        Height = 21
        DataField = 'ds_complemento'
        DataSource = dsResponsavel
        TabOrder = 16
        OnKeyPress = DBEdit78KeyPress
      end
      object DBEdit84: TDBEdit
        Left = 400
        Top = 136
        Width = 65
        Height = 21
        DataField = 'ds_logradouro_nro'
        DataSource = dsResponsavel
        TabOrder = 15
        OnKeyPress = dbNomeKeyPress
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
        TabOrder = 18
        Visible = False
        OnDblClick = imageFotoDblClick
        object Image2: TImage
          Left = 1
          Top = 1
          Width = 105
          Height = 120
          Hint = 'Duplo clique para procurar a foto.'
          Align = alClient
          Proportional = True
          Stretch = True
          Visible = False
          OnDblClick = imageFotoDblClick
          ExplicitHeight = 121
        end
        object Label149: TLabel
          Left = 36
          Top = 52
          Width = 42
          Height = 17
          Caption = 'FOTO'
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -15
          Font.Name = 'Arial'
          Font.Style = []
          ParentFont = False
          Transparent = True
          OnDblClick = imageFotoDblClick
        end
      end
      object pgDocMae: TPageControl
        Left = 6
        Top = 163
        Width = 761
        Height = 70
        ActivePage = TabSheet17
        MultiLine = True
        Style = tsFlatButtons
        TabOrder = 17
        OnChange = pgDocMaeChange
        object TabSheet17: TTabSheet
          Caption = 'Documenta'#231#227'o'
          object Label170: TLabel
            Left = 1
            Top = 0
            Width = 20
            Height = 13
            Caption = 'CPF'
            FocusControl = dbCPFMae
          end
          object Label171: TLabel
            Left = 161
            Top = 0
            Width = 50
            Height = 13
            Caption = 'Identidade'
            FocusControl = DBEdit103
          end
          object Label172: TLabel
            Left = 321
            Top = 0
            Width = 67
            Height = 13
            Caption = 'Org'#227'o/Estado'
            FocusControl = DBEdit104
          end
          object Label173: TLabel
            Left = 480
            Top = 0
            Width = 76
            Height = 13
            Caption = 'Data Expedi'#231#227'o'
            FocusControl = DBEdit105
          end
          object SpeedButton6: TSpeedButton
            Left = 599
            Top = 12
            Width = 145
            Height = 25
            Caption = 'F10   Mais Informa'#231#245'es >>'
            Flat = True
            NumGlyphs = 2
            OnClick = sbMaisInformacoesAcademicoClick
          end
          object Label223: TLabel
            Left = 1
            Top = 40
            Width = 53
            Height = 13
            Caption = 'Passaporte'
            FocusControl = dbPassaporteMae
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
          object DBEdit104: TDBEdit
            Left = 321
            Top = 16
            Width = 150
            Height = 21
            DataField = 'ds_identidade_orgao_exp'
            DataSource = dsResponsavel
            TabOrder = 2
            OnKeyPress = dbNomeKeyPress
          end
          object DBEdit105: TDBEdit
            Left = 480
            Top = 16
            Width = 113
            Height = 21
            DataField = 'dt_identidade_expedicao'
            DataSource = dsResponsavel
            TabOrder = 3
            OnKeyPress = dbNomeKeyPress
          end
          object dbPassaporteMae: TDBEdit
            Left = 1
            Top = 56
            Width = 150
            Height = 21
            DataField = 'ds_passaporte'
            DataSource = dsResponsavel
            TabOrder = 4
            OnKeyPress = dbNomeKeyPress
          end
        end
        object TabSheet18: TTabSheet
          Caption = 'T'#237'tulo Eleitoral'
          ImageIndex = 1
          object Label174: TLabel
            Left = 0
            Top = -1
            Width = 51
            Height = 13
            Caption = 'Nro. T'#237'tulo'
            FocusControl = DBEdit106
          end
          object Label175: TLabel
            Left = 471
            Top = 0
            Width = 65
            Height = 13
            Caption = 'Data Emiss'#227'o'
            FocusControl = DBEdit107
          end
          object Label176: TLabel
            Left = 157
            Top = 0
            Width = 31
            Height = 13
            Caption = 'Se'#231#227'o'
            FocusControl = DBEdit108
          end
          object Label177: TLabel
            Left = 314
            Top = 0
            Width = 25
            Height = 13
            Caption = 'Zona'
            FocusControl = DBEdit109
          end
          object DBEdit106: TDBEdit
            Left = 0
            Top = 16
            Width = 150
            Height = 21
            DataField = 'ds_titulo_numero'
            DataSource = dsResponsavel
            TabOrder = 0
          end
          object DBEdit107: TDBEdit
            Left = 471
            Top = 16
            Width = 150
            Height = 21
            DataField = 'dt_titulo_emissao'
            DataSource = dsResponsavel
            TabOrder = 3
          end
          object DBEdit108: TDBEdit
            Left = 157
            Top = 16
            Width = 150
            Height = 21
            DataField = 'ds_titulo_secao'
            DataSource = dsResponsavel
            TabOrder = 1
          end
          object DBEdit109: TDBEdit
            Left = 314
            Top = 16
            Width = 150
            Height = 21
            DataField = 'ds_titulo_zona'
            DataSource = dsResponsavel
            TabOrder = 2
          end
        end
        object TabSheet19: TTabSheet
          Caption = 'Servi'#231'o Militar'
          ImageIndex = 2
          object Label178: TLabel
            Left = 2
            Top = 0
            Width = 55
            Height = 13
            Caption = 'Corpora'#231#227'o'
          end
          object Label179: TLabel
            Left = 146
            Top = 0
            Width = 54
            Height = 13
            Caption = 'Org'#227'o S.M.'
          end
          object Label180: TLabel
            Left = 270
            Top = 0
            Width = 84
            Height = 13
            Caption = 'N'#250'mero do Org'#227'o'
            FocusControl = DBEdit110
          end
          object Label181: TLabel
            Left = 396
            Top = 0
            Width = 80
            Height = 13
            Caption = 'Documento S.M.'
          end
          object Label182: TLabel
            Left = 628
            Top = 0
            Width = 63
            Height = 13
            Caption = 'N'#250'mero Doc.'
            FocusControl = DBEdit111
          end
          object DBEdit110: TDBEdit
            Left = 270
            Top = 16
            Width = 121
            Height = 21
            DataField = 'ds_rm_org_numero'
            DataSource = dsResponsavel
            TabOrder = 2
          end
          object DBEdit111: TDBEdit
            Left = 627
            Top = 16
            Width = 121
            Height = 21
            DataField = 'ds_rm_doc_numero'
            DataSource = dsResponsavel
            TabOrder = 4
          end
          object DBComboBox15: TDBComboBox
            Left = 2
            Top = 16
            Width = 137
            Height = 21
            DataField = 'ds_rm_corporacao'
            DataSource = dsResponsavel
            ItemHeight = 13
            Items.Strings = (
              'EX'#201'RCITO'
              'MARINHA'
              'AERON'#193'UTICA')
            TabOrder = 0
          end
          object DBComboBox16: TDBComboBox
            Left = 144
            Top = 16
            Width = 121
            Height = 21
            DataField = 'ds_rm_orgao'
            DataSource = dsResponsavel
            ItemHeight = 13
            Items.Strings = (
              'SSMR'
              'CSM'
              'SDR'
              'SERMOB'
              'SMOB')
            TabOrder = 1
          end
          object DBComboBox17: TDBComboBox
            Left = 396
            Top = 16
            Width = 222
            Height = 21
            DataField = 'ds_rm_doc_tipo'
            DataSource = dsResponsavel
            ItemHeight = 13
            Items.Strings = (
              'Certificado de Alistamento Militar'
              'Certificado de Reservista;'
              'Certificado de Dispensa de Incorpora'#231#227'o;'
              'Certificado de Isen'#231#227'o;'
              'Certid'#227'o de Situa'#231#227'o Militar'
              'Carta Patente '
              'Provis'#227'o de Reforma'
              'Atestado de Situa'#231#227'o Militar'
              'Atestado de Desobrigado do Servi'#231'o Militar')
            TabOrder = 3
          end
        end
        object TabSheet20: TTabSheet
          Caption = 'Certid'#227'o Civil'
          ImageIndex = 3
          object Label183: TLabel
            Left = 0
            Top = 0
            Width = 78
            Height = 13
            Caption = 'Tipo de Certid'#227'o'
          end
          object Label184: TLabel
            Left = 144
            Top = 0
            Width = 85
            Height = 13
            Caption = 'N'#250'mero do Termo'
            FocusControl = DBEdit112
          end
          object Label185: TLabel
            Left = 240
            Top = 0
            Width = 26
            Height = 13
            Caption = 'Folha'
            FocusControl = DBEdit113
          end
          object Label186: TLabel
            Left = 320
            Top = 0
            Width = 23
            Height = 13
            Caption = 'Livro'
            FocusControl = DBEdit114
          end
          object Label187: TLabel
            Left = 424
            Top = 0
            Width = 80
            Height = 13
            Caption = 'Data de Emiss'#227'o'
            FocusControl = DBEdit115
          end
          object Label188: TLabel
            Left = 528
            Top = 0
            Width = 53
            Height = 13
            Caption = 'UF Cart'#243'rio'
            FocusControl = DBEdit116
          end
          object Label189: TLabel
            Left = 592
            Top = 0
            Width = 82
            Height = 13
            Caption = 'Nome do Cart'#243'rio'
            FocusControl = DBEdit117
          end
          object DBEdit112: TDBEdit
            Left = 144
            Top = 16
            Width = 89
            Height = 21
            DataField = 'nr_cert_termo'
            DataSource = dsResponsavel
            TabOrder = 1
            OnKeyPress = dbNomeKeyPress
          end
          object DBEdit113: TDBEdit
            Left = 240
            Top = 16
            Width = 73
            Height = 21
            DataField = 'ds_cert_folha'
            DataSource = dsResponsavel
            TabOrder = 2
            OnKeyPress = dbNomeKeyPress
          end
          object DBEdit114: TDBEdit
            Left = 320
            Top = 16
            Width = 97
            Height = 21
            DataField = 'ds_cert_livro'
            DataSource = dsResponsavel
            TabOrder = 3
            OnKeyPress = dbNomeKeyPress
          end
          object DBEdit115: TDBEdit
            Left = 424
            Top = 16
            Width = 97
            Height = 21
            DataField = 'dt_cert'
            DataSource = dsResponsavel
            TabOrder = 4
            OnKeyPress = dbNomeKeyPress
          end
          object DBEdit116: TDBEdit
            Left = 528
            Top = 16
            Width = 57
            Height = 21
            DataField = 'ds_cert_uf'
            DataSource = dsResponsavel
            TabOrder = 5
            OnKeyPress = dbNomeKeyPress
          end
          object DBEdit117: TDBEdit
            Left = 592
            Top = 16
            Width = 136
            Height = 21
            DataField = 'ds_cert_orgao'
            DataSource = dsResponsavel
            TabOrder = 6
            OnKeyPress = dbNomeKeyPress
          end
          object DBComboBox18: TDBComboBox
            Left = 0
            Top = 16
            Width = 138
            Height = 21
            DataField = 'tp_cert'
            DataSource = dsResponsavel
            ItemHeight = 13
            Items.Strings = (
              'Nascimento'
              'Casamento'
              'Div'#243'rcio')
            TabOrder = 0
            OnKeyPress = dbNomeKeyPress
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
            FocusControl = DBEdit5
          end
          object DBEdit5: TDBEdit
            Left = 2
            Top = 16
            Width = 310
            Height = 21
            DataField = 'ds_cargo'
            DataSource = dsResponsavel
            TabOrder = 0
            OnKeyPress = dbNomeKeyPress
          end
          object DBCheckBox3: TDBCheckBox
            Left = 329
            Top = 1
            Width = 287
            Height = 17
            Caption = 'Permitir o acesso da m'#227'e como respons'#225'vel acad'#234'mico.'
            DataField = 'sn_mae_resp'
            DataSource = dsPessoa
            TabOrder = 1
            ValueChecked = '1'
            ValueUnchecked = '0'
            OnClick = DBCheckBox3Click
          end
          object DBCheckBox5: TDBCheckBox
            Left = 571
            Top = 21
            Width = 97
            Height = 17
            Caption = 'In Memorian'
            DataField = 'sn_obito'
            DataSource = dsResponsavel
            TabOrder = 3
            ValueChecked = '1'
            ValueUnchecked = '0'
          end
          object DBCheckBox9: TDBCheckBox
            Left = 329
            Top = 21
            Width = 231
            Height = 13
            Caption = 'Bloquear envio de e-mails sobre ocorr'#234'ncias'
            DataField = 'sn_bloq_emails'
            DataSource = dsResponsavel
            TabOrder = 2
            ValueChecked = '1'
            ValueUnchecked = '0'
            OnClick = DBCheckBox2Click
          end
        end
      end
      object DBLookupComboBox20: TDBLookupComboBox
        Left = 7
        Top = 56
        Width = 113
        Height = 21
        DataField = 'descPaisNasc'
        DataSource = dsResponsavel
        DropDownWidth = 150
        TabOrder = 4
        OnCloseUp = DBLookupComboBox20CloseUp
        OnExit = DBLookupComboBox20Exit
        OnKeyPress = dbNomeKeyPress
      end
      object DBLookupComboBox15: TDBLookupComboBox
        Left = 229
        Top = 96
        Width = 106
        Height = 21
        DataField = 'descEstado'
        DataSource = dsResponsavel
        DropDownWidth = 150
        TabOrder = 10
        OnKeyPress = dbNomeKeyPress
      end
      object DBLookupComboBox26: TDBLookupComboBox
        Left = 339
        Top = 96
        Width = 151
        Height = 21
        DataField = 'descMunicipioAtual'
        DataSource = dsResponsavel
        TabOrder = 11
        OnKeyPress = dbNomeKeyPress
      end
      object DBEdit34: TDBEdit
        Left = 496
        Top = 96
        Width = 157
        Height = 21
        DataField = 'ds_bairro'
        DataSource = dsResponsavel
        TabOrder = 12
        OnKeyPress = dbNomeKeyPress
      end
      object DBLookupComboBox14: TDBLookupComboBox
        Left = 320
        Top = 56
        Width = 126
        Height = 21
        DataField = 'descEstadoNasc'
        DataSource = dsResponsavel
        TabOrder = 6
        OnKeyPress = dbNomeKeyPress
      end
      object DBLookupComboBox19: TDBLookupComboBox
        Left = 451
        Top = 56
        Width = 202
        Height = 21
        DataField = 'descMunicipio'
        DataSource = dsResponsavel
        TabOrder = 7
        OnKeyPress = dbNomeKeyPress
      end
      object dblbTpLogradouro: TDBLookupComboBox
        Left = 6
        Top = 136
        Width = 105
        Height = 21
        DataField = 'desLogradouro'
        DataSource = dsResponsavel
        TabOrder = 13
        OnCloseUp = dblbTpLogradouroCloseUp
      end
      object DBLookupComboBox32: TDBLookupComboBox
        Left = 129
        Top = 96
        Width = 95
        Height = 21
        DataField = 'descPais'
        DataSource = dsResponsavel
        DropDownWidth = 150
        TabOrder = 9
        OnCloseUp = DBLookupComboBox32CloseUp
        OnExit = DBLookupComboBox32Exit
        OnKeyPress = dbNomeKeyPress
      end
      object cbNacionalidadeMae: TUMComboBox
        Left = 126
        Top = 56
        Width = 189
        Height = 21
        ItemHeight = 13
        TabOrder = 5
        OnExit = cbNacionalidadePaiExit
        OnKeyDown = cbNacionalidadePaiKeyDown
        TamanhoMaximo = 0
      end
      object pnl2: TPanel
        Left = 0
        Top = 233
        Width = 904
        Height = 280
        BevelOuter = bvNone
        TabOrder = 19
        object lblMensagemHierarquiaMae: TLabel
          Left = 375
          Top = 215
          Width = 351
          Height = 26
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
        object Label143: TLabel
          Left = 6
          Top = 0
          Width = 85
          Height = 13
          Caption = 'Nome do Conjuge'
          FocusControl = DBEdit31
        end
        object Label144: TLabel
          Left = 6
          Top = 40
          Width = 61
          Height = 13
          Caption = 'Nome do Pai'
          FocusControl = DBEdit36
        end
        object Label219: TLabel
          Left = 6
          Top = 80
          Width = 67
          Height = 13
          Caption = 'Nome da M'#227'e'
          FocusControl = DBEdit8
        end
        object Label68: TLabel
          Left = 7
          Top = 126
          Width = 46
          Height = 13
          Caption = 'Profiss'#227'o:'
          FocusControl = DBEdit66
        end
        object Label101: TLabel
          Left = 7
          Top = 172
          Width = 85
          Height = 13
          Caption = 'Local de trabalho:'
          FocusControl = DBEdit66
        end
        object DBEdit8: TDBEdit
          Left = 7
          Top = 99
          Width = 363
          Height = 21
          DataField = 'nm_mae'
          DataSource = dsResponsavel
          TabOrder = 2
          OnKeyPress = dbNomeKeyPress
        end
        object DBEdit31: TDBEdit
          Left = 6
          Top = 16
          Width = 363
          Height = 21
          DataField = 'nm_conjuge'
          DataSource = dsResponsavel
          TabOrder = 0
          OnKeyPress = dbNomeKeyPress
        end
        object DBEdit36: TDBEdit
          Left = 6
          Top = 56
          Width = 363
          Height = 21
          DataField = 'nm_pai'
          DataSource = dsResponsavel
          TabOrder = 1
          OnKeyPress = dbNomeKeyPress
        end
        object VSTContatosMae: TVirtualStringTree
          Left = 376
          Top = 16
          Width = 377
          Height = 196
          Header.AutoSizeIndex = 0
          Header.Font.Charset = DEFAULT_CHARSET
          Header.Font.Color = clWindowText
          Header.Font.Height = -11
          Header.Font.Name = 'Tahoma'
          Header.Font.Style = []
          Header.MainColumn = -1
          TabOrder = 5
          Columns = <>
        end
        object db_pessoa_profissao_mae: TDBEdit
          Left = 7
          Top = 145
          Width = 363
          Height = 21
          DataField = 'ds_profissao'
          DataSource = dsResponsavel
          TabOrder = 3
          OnKeyPress = dbNomeKeyPress
        end
        object db_local_trabalho_mae: TDBEdit
          Left = 6
          Top = 191
          Width = 363
          Height = 21
          DataField = 'ds_local_trabalho'
          DataSource = dsResponsavel
          TabOrder = 4
          OnKeyPress = dbNomeKeyPress
        end
      end
    end
    object tsRespAcademico: TTabSheet [4]
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
      object Label31: TLabel
        Left = 6
        Top = 77
        Width = 19
        Height = 13
        Caption = 'Cep'
        FocusControl = DBEdit7
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
        Font.Height = -12
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
      end
      object Label52: TLabel
        Left = 118
        Top = 117
        Width = 54
        Height = 13
        Caption = 'Logradouro'
        FocusControl = DBEdit14
      end
      object Label53: TLabel
        Left = 400
        Top = 117
        Width = 37
        Height = 13
        Caption = 'N'#250'mero'
        FocusControl = DBEdit15
      end
      object Label54: TLabel
        Left = 471
        Top = 117
        Width = 64
        Height = 13
        Caption = 'Complemento'
        FocusControl = DBEdit16
      end
      object Label46: TLabel
        Left = 422
        Top = 0
        Width = 55
        Height = 13
        Caption = 'Estado Civil'
      end
      object sbCepAcedemico: TSpeedButton
        Left = 80
        Top = 93
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
        OnClick = sbCepPaiClick
      end
      object SpeedButton7: TSpeedButton
        Left = 103
        Top = 93
        Width = 20
        Height = 22
        Hint = 'Copiar o Endere'#231'o do Aluno'
        Caption = '...'
        Flat = True
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -15
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        NumGlyphs = 2
        ParentFont = False
        ParentShowHint = False
        ShowHint = True
        OnClick = sbCopiarAlunoClick
      end
      object Label30: TLabel
        Left = 320
        Top = 40
        Width = 64
        Height = 13
        Caption = 'Estado Nasc.'
        FocusControl = DBLookupComboBox5
      end
      object Label44: TLabel
        Left = 451
        Top = 40
        Width = 64
        Height = 13
        Caption = 'Cidade Nasc.'
        Transparent = True
      end
      object Label48: TLabel
        Left = 6
        Top = 40
        Width = 53
        Height = 13
        Caption = 'Pa'#237's Nasc.'
      end
      object Label49: TLabel
        Left = 125
        Top = 40
        Width = 68
        Height = 13
        Caption = 'Nacionalidade'
      end
      object Label34: TLabel
        Left = 128
        Top = 77
        Width = 22
        Height = 13
        Caption = 'Pa'#237's'
      end
      object Label43: TLabel
        Left = 230
        Top = 77
        Width = 33
        Height = 13
        Caption = 'Estado'
      end
      object Label50: TLabel
        Left = 339
        Top = 77
        Width = 33
        Height = 13
        Caption = 'Cidade'
      end
      object Label51: TLabel
        Left = 497
        Top = 78
        Width = 27
        Height = 13
        Caption = 'Bairro'
        FocusControl = DBEdit11
      end
      object Label215: TLabel
        Left = 7
        Top = 117
        Width = 78
        Height = 13
        Caption = 'Tipo Logradouro'
      end
      object dbNomeRespAcad: TDBEdit
        Left = 7
        Top = 15
        Width = 326
        Height = 21
        DataField = 'nm_pessoa'
        DataSource = dsResponsavel
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -12
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
        TabOrder = 0
        OnExit = dbNomeRespFinanExit
        OnKeyPress = dbNomeKeyPress
      end
      object DBEdit7: TDBEdit
        Left = 6
        Top = 93
        Width = 75
        Height = 21
        DataField = 'ds_cep'
        DataSource = dsResponsavel
        TabOrder = 8
        OnKeyPress = dbNomeKeyPress
      end
      object DBComboBox2: TDBComboBox
        Left = 337
        Top = 15
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
      object DBEdit14: TDBEdit
        Left = 118
        Top = 133
        Width = 273
        Height = 21
        DataField = 'ds_logradouro'
        DataSource = dsResponsavel
        TabOrder = 14
        OnKeyPress = dbNomeKeyPress
      end
      object DBEdit15: TDBEdit
        Left = 400
        Top = 133
        Width = 65
        Height = 21
        DataField = 'ds_logradouro_nro'
        DataSource = dsResponsavel
        TabOrder = 15
        OnKeyPress = dbNomeKeyPress
      end
      object DBEdit16: TDBEdit
        Left = 472
        Top = 133
        Width = 181
        Height = 21
        DataField = 'ds_complemento'
        DataSource = dsResponsavel
        TabOrder = 16
        OnKeyPress = DBEdit16KeyPress
      end
      object pgDocAcad: TPageControl
        Left = 7
        Top = 156
        Width = 761
        Height = 70
        ActivePage = TabSheet9
        MultiLine = True
        Style = tsFlatButtons
        TabOrder = 17
        OnChange = pgDocAcadChange
        object TabSheet9: TTabSheet
          Caption = 'Documenta'#231#227'o'
          object Label55: TLabel
            Left = 1
            Top = 0
            Width = 20
            Height = 13
            Caption = 'CPF'
            FocusControl = dbCPFAcad
          end
          object Label56: TLabel
            Left = 161
            Top = 0
            Width = 50
            Height = 13
            Caption = 'Identidade'
            FocusControl = DBEdit18
          end
          object Label57: TLabel
            Left = 321
            Top = 0
            Width = 67
            Height = 13
            Caption = 'Org'#227'o/Estado'
            FocusControl = DBEdit19
          end
          object Label58: TLabel
            Left = 480
            Top = 0
            Width = 76
            Height = 13
            Caption = 'Data Expedi'#231#227'o'
            FocusControl = DBEdit20
          end
          object sbMaisInformacoesAcademico: TSpeedButton
            Left = 599
            Top = 12
            Width = 145
            Height = 25
            Caption = 'F10   Mais Informa'#231#245'es >>'
            Flat = True
            NumGlyphs = 2
            OnClick = sbMaisInformacoesAcademicoClick
          end
          object Label224: TLabel
            Left = 1
            Top = 40
            Width = 53
            Height = 13
            Caption = 'Passaporte'
            FocusControl = dbPassaporteRespAcad
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
          object DBEdit19: TDBEdit
            Left = 322
            Top = 16
            Width = 150
            Height = 21
            DataField = 'ds_identidade_orgao_exp'
            DataSource = dsResponsavel
            TabOrder = 2
            OnKeyPress = dbNomeKeyPress
          end
          object DBEdit20: TDBEdit
            Left = 480
            Top = 16
            Width = 113
            Height = 21
            DataField = 'dt_identidade_expedicao'
            DataSource = dsResponsavel
            TabOrder = 3
            OnKeyPress = dbNomeKeyPress
          end
          object dbPassaporteRespAcad: TDBEdit
            Left = 1
            Top = 56
            Width = 150
            Height = 21
            DataField = 'ds_passaporte'
            DataSource = dsResponsavel
            TabOrder = 4
            OnKeyPress = dbNomeKeyPress
          end
        end
        object TabSheet10: TTabSheet
          Caption = 'T'#237'tulo Eleitoral'
          ImageIndex = 1
          object Label59: TLabel
            Left = 0
            Top = -1
            Width = 51
            Height = 13
            Caption = 'Nro. T'#237'tulo'
            FocusControl = DBEdit21
          end
          object Label60: TLabel
            Left = 471
            Top = 0
            Width = 65
            Height = 13
            Caption = 'Data Emiss'#227'o'
            FocusControl = DBEdit22
          end
          object Label61: TLabel
            Left = 157
            Top = 0
            Width = 31
            Height = 13
            Caption = 'Se'#231#227'o'
            FocusControl = DBEdit23
          end
          object Label62: TLabel
            Left = 314
            Top = 0
            Width = 25
            Height = 13
            Caption = 'Zona'
            FocusControl = DBEdit24
          end
          object DBEdit21: TDBEdit
            Left = 0
            Top = 16
            Width = 150
            Height = 21
            DataField = 'ds_titulo_numero'
            DataSource = dsResponsavel
            TabOrder = 0
            OnKeyPress = dbNomeKeyPress
          end
          object DBEdit22: TDBEdit
            Left = 471
            Top = 16
            Width = 150
            Height = 21
            DataField = 'dt_titulo_emissao'
            DataSource = dsResponsavel
            TabOrder = 3
            OnKeyPress = dbNomeKeyPress
          end
          object DBEdit23: TDBEdit
            Left = 157
            Top = 16
            Width = 150
            Height = 21
            DataField = 'ds_titulo_secao'
            DataSource = dsResponsavel
            TabOrder = 1
            OnKeyPress = dbNomeKeyPress
          end
          object DBEdit24: TDBEdit
            Left = 314
            Top = 16
            Width = 150
            Height = 21
            DataField = 'ds_titulo_zona'
            DataSource = dsResponsavel
            TabOrder = 2
            OnKeyPress = dbNomeKeyPress
          end
        end
        object TabSheet11: TTabSheet
          Caption = 'Servi'#231'o Militar'
          ImageIndex = 2
          object Label63: TLabel
            Left = 2
            Top = 0
            Width = 55
            Height = 13
            Caption = 'Corpora'#231#227'o'
          end
          object Label64: TLabel
            Left = 146
            Top = 0
            Width = 54
            Height = 13
            Caption = 'Org'#227'o S.M.'
          end
          object Label65: TLabel
            Left = 270
            Top = 0
            Width = 84
            Height = 13
            Caption = 'N'#250'mero do Org'#227'o'
            FocusControl = DBEdit25
          end
          object Label66: TLabel
            Left = 396
            Top = 0
            Width = 80
            Height = 13
            Caption = 'Documento S.M.'
          end
          object Label67: TLabel
            Left = 628
            Top = 0
            Width = 63
            Height = 13
            Caption = 'N'#250'mero Doc.'
            FocusControl = DBEdit26
          end
          object DBEdit25: TDBEdit
            Left = 270
            Top = 16
            Width = 121
            Height = 21
            DataField = 'ds_rm_org_numero'
            DataSource = dsResponsavel
            TabOrder = 2
            OnKeyPress = dbNomeKeyPress
          end
          object DBEdit26: TDBEdit
            Left = 627
            Top = 16
            Width = 121
            Height = 21
            DataField = 'ds_rm_doc_numero'
            DataSource = dsResponsavel
            TabOrder = 4
            OnKeyPress = dbNomeKeyPress
          end
          object DBComboBox4: TDBComboBox
            Left = 2
            Top = 16
            Width = 137
            Height = 21
            DataField = 'ds_rm_corporacao'
            DataSource = dsResponsavel
            ItemHeight = 13
            Items.Strings = (
              'EX'#201'RCITO'
              'MARINHA'
              'AERON'#193'UTICA')
            TabOrder = 0
            OnKeyPress = dbNomeKeyPress
          end
          object DBComboBox5: TDBComboBox
            Left = 144
            Top = 16
            Width = 121
            Height = 21
            DataField = 'ds_rm_orgao'
            DataSource = dsResponsavel
            ItemHeight = 13
            Items.Strings = (
              'SSMR'
              'CSM'
              'SDR'
              'SERMOB'
              'SMOB')
            TabOrder = 1
            OnKeyPress = dbNomeKeyPress
          end
          object DBComboBox6: TDBComboBox
            Left = 396
            Top = 16
            Width = 222
            Height = 21
            DataField = 'ds_rm_doc_tipo'
            DataSource = dsResponsavel
            ItemHeight = 13
            Items.Strings = (
              'Certificado de Alistamento Militar'
              'Certificado de Reservista;'
              'Certificado de Dispensa de Incorpora'#231#227'o;'
              'Certificado de Isen'#231#227'o;'
              'Certid'#227'o de Situa'#231#227'o Militar'
              'Carta Patente '
              'Provis'#227'o de Reforma'
              'Atestado de Situa'#231#227'o Militar'
              'Atestado de Desobrigado do Servi'#231'o Militar')
            TabOrder = 3
            OnKeyPress = dbNomeKeyPress
          end
        end
        object TabSheet22: TTabSheet
          Caption = 'Certid'#227'o Civil'
          ImageIndex = 3
          object Label197: TLabel
            Left = 0
            Top = 0
            Width = 78
            Height = 13
            Caption = 'Tipo de Certid'#227'o'
          end
          object Label198: TLabel
            Left = 144
            Top = 0
            Width = 85
            Height = 13
            Caption = 'N'#250'mero do Termo'
            FocusControl = DBEdit124
          end
          object Label199: TLabel
            Left = 240
            Top = 0
            Width = 26
            Height = 13
            Caption = 'Folha'
            FocusControl = DBEdit125
          end
          object Label200: TLabel
            Left = 320
            Top = 0
            Width = 23
            Height = 13
            Caption = 'Livro'
            FocusControl = DBEdit126
          end
          object Label201: TLabel
            Left = 424
            Top = 0
            Width = 80
            Height = 13
            Caption = 'Data de Emiss'#227'o'
            FocusControl = DBEdit127
          end
          object Label202: TLabel
            Left = 528
            Top = 0
            Width = 53
            Height = 13
            Caption = 'UF Cart'#243'rio'
            FocusControl = DBEdit128
          end
          object Label203: TLabel
            Left = 592
            Top = 0
            Width = 82
            Height = 13
            Caption = 'Nome do Cart'#243'rio'
            FocusControl = DBEdit129
          end
          object DBComboBox20: TDBComboBox
            Left = 0
            Top = 16
            Width = 138
            Height = 21
            DataField = 'tp_cert'
            DataSource = dsResponsavel
            ItemHeight = 13
            Items.Strings = (
              'Nascimento'
              'Casamento'
              'Div'#243'rcio')
            TabOrder = 0
            OnKeyPress = dbNomeKeyPress
          end
          object DBEdit124: TDBEdit
            Left = 144
            Top = 16
            Width = 89
            Height = 21
            DataField = 'nr_cert_termo'
            DataSource = dsResponsavel
            TabOrder = 1
            OnKeyPress = dbNomeKeyPress
          end
          object DBEdit125: TDBEdit
            Left = 240
            Top = 16
            Width = 73
            Height = 21
            DataField = 'ds_cert_folha'
            DataSource = dsResponsavel
            TabOrder = 2
            OnKeyPress = dbNomeKeyPress
          end
          object DBEdit126: TDBEdit
            Left = 320
            Top = 16
            Width = 97
            Height = 21
            DataField = 'ds_cert_livro'
            DataSource = dsResponsavel
            TabOrder = 3
            OnKeyPress = dbNomeKeyPress
          end
          object DBEdit127: TDBEdit
            Left = 424
            Top = 16
            Width = 97
            Height = 21
            DataField = 'dt_cert'
            DataSource = dsResponsavel
            TabOrder = 4
            OnKeyPress = dbNomeKeyPress
          end
          object DBEdit128: TDBEdit
            Left = 528
            Top = 16
            Width = 57
            Height = 21
            DataField = 'ds_cert_uf'
            DataSource = dsResponsavel
            TabOrder = 5
            OnKeyPress = dbNomeKeyPress
          end
          object DBEdit129: TDBEdit
            Left = 592
            Top = 16
            Width = 136
            Height = 21
            DataField = 'ds_cert_orgao'
            DataSource = dsResponsavel
            TabOrder = 6
            OnKeyPress = dbNomeKeyPress
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
      object Panel5: TPanel
        Left = 658
        Top = 15
        Width = 107
        Height = 122
        TabOrder = 18
        Visible = False
        object imageFotoAcad: TImage
          Left = 1
          Top = 1
          Width = 105
          Height = 120
          Align = alClient
          Stretch = True
          Visible = False
          ExplicitHeight = 121
        end
        object lbFotoAcad: TLabel
          Left = 36
          Top = 52
          Width = 42
          Height = 17
          Caption = 'FOTO'
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -15
          Font.Name = 'Arial'
          Font.Style = []
          ParentFont = False
          Transparent = True
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
      object DBLookupComboBox5: TDBLookupComboBox
        Left = 319
        Top = 56
        Width = 126
        Height = 21
        DataField = 'descEstadoNasc'
        DataSource = dsResponsavel
        TabOrder = 6
        OnKeyPress = dbNomeKeyPress
      end
      object DBLookupComboBox22: TDBLookupComboBox
        Left = 7
        Top = 56
        Width = 113
        Height = 21
        DataField = 'descPaisNasc'
        DataSource = dsResponsavel
        DropDownWidth = 150
        TabOrder = 4
        OnCloseUp = DBLookupComboBox22CloseUp
        OnExit = DBLookupComboBox18Exit
        OnKeyPress = dbNomeKeyPress
      end
      object DBLookupComboBox10: TDBLookupComboBox
        Left = 229
        Top = 93
        Width = 106
        Height = 21
        DataField = 'descEstado'
        DataSource = dsResponsavel
        DropDownWidth = 150
        TabOrder = 10
        OnKeyPress = dbNomeKeyPress
      end
      object DBLookupComboBox27: TDBLookupComboBox
        Left = 339
        Top = 93
        Width = 151
        Height = 21
        DataField = 'descMunicipioAtual'
        DataSource = dsResponsavel
        TabOrder = 11
        OnKeyPress = dbNomeKeyPress
      end
      object DBEdit11: TDBEdit
        Left = 496
        Top = 93
        Width = 157
        Height = 21
        DataField = 'ds_bairro'
        DataSource = dsResponsavel
        TabOrder = 12
        OnKeyPress = dbNomeKeyPress
      end
      object DBLookupComboBox21: TDBLookupComboBox
        Left = 451
        Top = 56
        Width = 202
        Height = 21
        DataField = 'descMunicipio'
        DataSource = dsResponsavel
        TabOrder = 7
        OnKeyPress = dbNomeKeyPress
      end
      object DBLookupComboBox29: TDBLookupComboBox
        Left = 7
        Top = 133
        Width = 105
        Height = 21
        DataField = 'desLogradouro'
        DataSource = dsResponsavel
        TabOrder = 13
        OnCloseUp = DBLookupComboBox29CloseUp
      end
      object DBLookupComboBox33: TDBLookupComboBox
        Left = 129
        Top = 93
        Width = 95
        Height = 21
        DataField = 'descPais'
        DataSource = dsResponsavel
        DropDownWidth = 150
        TabOrder = 9
        OnKeyPress = dbNomeKeyPress
      end
      object cbNacionalidadeRespAcad: TUMComboBox
        Left = 125
        Top = 56
        Width = 189
        Height = 21
        ItemHeight = 13
        TabOrder = 5
        OnExit = cbNacionalidadePaiExit
        OnKeyDown = cbNacionalidadePaiKeyDown
        TamanhoMaximo = 0
      end
      object pnl3: TPanel
        Left = 4
        Top = 270
        Width = 904
        Height = 280
        BevelOuter = bvNone
        TabOrder = 19
        object lblMensagemHierarquiaRespAcad: TLabel
          Left = 375
          Top = 218
          Width = 375
          Height = 26
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
        object Label69: TLabel
          Left = 6
          Top = 0
          Width = 85
          Height = 13
          Caption = 'Nome do Conjuge'
          FocusControl = DBEdit27
        end
        object Label70: TLabel
          Left = 6
          Top = 40
          Width = 61
          Height = 13
          Caption = 'Nome do Pai'
          FocusControl = DBEdit28
        end
        object Label220: TLabel
          Left = 6
          Top = 80
          Width = 67
          Height = 13
          Caption = 'Nome da M'#227'e'
          FocusControl = DBEdit6
        end
        object Label142: TLabel
          Left = 7
          Top = 126
          Width = 46
          Height = 13
          Caption = 'Profiss'#227'o:'
          FocusControl = DBEdit66
        end
        object Label218: TLabel
          Left = 7
          Top = 172
          Width = 85
          Height = 13
          Caption = 'Local de trabalho:'
          FocusControl = DBEdit66
        end
        object DBEdit6: TDBEdit
          Left = 7
          Top = 99
          Width = 363
          Height = 21
          DataField = 'nm_mae'
          DataSource = dsResponsavel
          TabOrder = 2
          OnKeyPress = dbNomeKeyPress
        end
        object DBEdit27: TDBEdit
          Left = 7
          Top = 16
          Width = 363
          Height = 21
          DataField = 'nm_conjuge'
          DataSource = dsResponsavel
          TabOrder = 0
          OnKeyPress = dbNomeKeyPress
        end
        object DBEdit28: TDBEdit
          Left = 6
          Top = 56
          Width = 363
          Height = 21
          DataField = 'nm_pai'
          DataSource = dsResponsavel
          TabOrder = 1
          OnKeyPress = dbNomeKeyPress
        end
        object VSTContatosRespAcad: TVirtualStringTree
          Left = 376
          Top = 16
          Width = 377
          Height = 196
          Header.AutoSizeIndex = 0
          Header.Font.Charset = DEFAULT_CHARSET
          Header.Font.Color = clWindowText
          Header.Font.Height = -11
          Header.Font.Name = 'Tahoma'
          Header.Font.Style = []
          Header.MainColumn = -1
          TabOrder = 5
          Columns = <>
        end
        object db_pessoa_profissao_respAcad: TDBEdit
          Left = 7
          Top = 145
          Width = 363
          Height = 21
          DataField = 'ds_profissao'
          DataSource = dsResponsavel
          TabOrder = 3
          OnKeyPress = dbNomeKeyPress
        end
        object db_local_trabalho_respAcad: TDBEdit
          Left = 6
          Top = 191
          Width = 363
          Height = 21
          DataField = 'ds_local_trabalho'
          DataSource = dsResponsavel
          TabOrder = 4
          OnKeyPress = dbNomeKeyPress
        end
      end
    end
    object tsRespFinanceiro: TTabSheet [5]
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
        Font.Height = -12
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
      end
      object Label85: TLabel
        Left = 118
        Top = 120
        Width = 54
        Height = 13
        Caption = 'Logradouro'
        FocusControl = DBEdit39
      end
      object Label86: TLabel
        Left = 400
        Top = 120
        Width = 37
        Height = 13
        Caption = 'N'#250'mero'
        FocusControl = DBEdit40
      end
      object Label87: TLabel
        Left = 471
        Top = 120
        Width = 64
        Height = 13
        Caption = 'Complemento'
        FocusControl = DBEdit41
      end
      object Label79: TLabel
        Left = 422
        Top = 0
        Width = 55
        Height = 13
        Caption = 'Estado Civil'
      end
      object Label107: TLabel
        Left = 7
        Top = 80
        Width = 19
        Height = 13
        Caption = 'Cep'
      end
      object sbCepFinanc: TSpeedButton
        Left = 81
        Top = 96
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
        OnClick = sbCepPaiClick
      end
      object SpeedButton8: TSpeedButton
        Left = 104
        Top = 96
        Width = 20
        Height = 22
        Hint = 'Copiar o Endere'#231'o do Aluno'
        Caption = '...'
        Flat = True
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -15
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        NumGlyphs = 2
        ParentFont = False
        ParentShowHint = False
        ShowHint = True
        OnClick = sbCopiarAlunoClick
      end
      object Label73: TLabel
        Left = 126
        Top = 40
        Width = 68
        Height = 13
        Caption = 'Nacionalidade'
      end
      object Label77: TLabel
        Left = 321
        Top = 40
        Width = 64
        Height = 13
        Caption = 'Estado Nasc.'
        FocusControl = DBLookupComboBox7
      end
      object Label81: TLabel
        Left = 452
        Top = 40
        Width = 64
        Height = 13
        Caption = 'Cidade Nasc.'
        Transparent = True
      end
      object Label82: TLabel
        Left = 6
        Top = 40
        Width = 53
        Height = 13
        Caption = 'Pa'#237's Nasc.'
      end
      object Label75: TLabel
        Left = 128
        Top = 80
        Width = 22
        Height = 13
        Caption = 'Pa'#237's'
      end
      object Label76: TLabel
        Left = 230
        Top = 80
        Width = 33
        Height = 13
        Caption = 'Estado'
      end
      object Label83: TLabel
        Left = 339
        Top = 80
        Width = 33
        Height = 13
        Caption = 'Cidade'
      end
      object Label84: TLabel
        Left = 497
        Top = 81
        Width = 27
        Height = 13
        Caption = 'Bairro'
        FocusControl = DBEdit33
      end
      object Label217: TLabel
        Left = 9
        Top = 120
        Width = 78
        Height = 13
        Caption = 'Tipo Logradouro'
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
        Font.Height = -12
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
        TabOrder = 0
        OnExit = dbNomeRespFinanExit
        OnKeyPress = dbNomeKeyPress
      end
      object DBEdit32: TDBEdit
        Left = 6
        Top = 96
        Width = 75
        Height = 21
        DataField = 'ds_cep'
        DataSource = dsResponsavel
        TabOrder = 8
        OnKeyPress = dbNomeKeyPress
      end
      object DBComboBox7: TDBComboBox
        Left = 337
        Top = 15
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
        Top = 15
        Width = 91
        Height = 21
        DataField = 'dt_nascimento'
        DataSource = dsResponsavel
        TabOrder = 3
        OnKeyPress = dbNomeKeyPress
      end
      object DBEdit39: TDBEdit
        Left = 118
        Top = 136
        Width = 273
        Height = 21
        DataField = 'ds_logradouro'
        DataSource = dsResponsavel
        TabOrder = 14
        OnKeyPress = dbNomeKeyPress
      end
      object DBEdit40: TDBEdit
        Left = 400
        Top = 136
        Width = 65
        Height = 21
        DataField = 'ds_logradouro_nro'
        DataSource = dsResponsavel
        TabOrder = 15
        OnKeyPress = dbNomeKeyPress
      end
      object DBEdit41: TDBEdit
        Left = 472
        Top = 136
        Width = 181
        Height = 21
        DataField = 'ds_complemento'
        DataSource = dsResponsavel
        TabOrder = 16
        OnKeyPress = DBEdit41KeyPress
      end
      object pgDocFinan: TPageControl
        Left = 6
        Top = 163
        Width = 761
        Height = 70
        ActivePage = TabSheet12
        MultiLine = True
        Style = tsFlatButtons
        TabOrder = 17
        OnChange = pgDocFinanChange
        object TabSheet12: TTabSheet
          Caption = 'Documenta'#231#227'o'
          object Label88: TLabel
            Left = 1
            Top = 0
            Width = 20
            Height = 13
            Caption = 'CPF'
            FocusControl = dbCPFFinan
          end
          object Label89: TLabel
            Left = 161
            Top = 0
            Width = 50
            Height = 13
            Caption = 'Identidade'
            FocusControl = DBEdit43
          end
          object Label90: TLabel
            Left = 321
            Top = 0
            Width = 67
            Height = 13
            Caption = 'Org'#227'o/Estado'
            FocusControl = DBEdit44
          end
          object Label91: TLabel
            Left = 480
            Top = 0
            Width = 76
            Height = 13
            Caption = 'Data Expedi'#231#227'o'
            FocusControl = DBEdit45
          end
          object sbMaisInformacoesFinanceiro: TSpeedButton
            Left = 599
            Top = 12
            Width = 145
            Height = 25
            Caption = 'F10   Mais Informa'#231#245'es >>'
            Flat = True
            NumGlyphs = 2
            OnClick = sbMaisInformacoesAcademicoClick
          end
          object Label225: TLabel
            Left = 1
            Top = 40
            Width = 53
            Height = 13
            Caption = 'Passaporte'
            FocusControl = dbPassaporteRespFinan
          end
          object dbCPFFinan: TDBEdit
            Left = 1
            Top = 16
            Width = 150
            Height = 21
            DataField = 'ds_cpf'
            DataSource = dsResponsavel
            TabOrder = 0
            OnKeyPress = dbNomeKeyPress
          end
          object DBEdit43: TDBEdit
            Left = 161
            Top = 16
            Width = 150
            Height = 21
            DataField = 'ds_identidade'
            DataSource = dsResponsavel
            TabOrder = 1
            OnKeyPress = dbNomeKeyPress
          end
          object DBEdit44: TDBEdit
            Left = 321
            Top = 16
            Width = 150
            Height = 21
            DataField = 'ds_identidade_orgao_exp'
            DataSource = dsResponsavel
            TabOrder = 2
            OnKeyPress = dbNomeKeyPress
          end
          object DBEdit45: TDBEdit
            Left = 480
            Top = 16
            Width = 113
            Height = 21
            DataField = 'dt_identidade_expedicao'
            DataSource = dsResponsavel
            TabOrder = 3
            OnKeyPress = dbNomeKeyPress
          end
          object dbPassaporteRespFinan: TDBEdit
            Left = 1
            Top = 56
            Width = 150
            Height = 21
            DataField = 'ds_passaporte'
            DataSource = dsResponsavel
            TabOrder = 4
            OnKeyPress = dbNomeKeyPress
          end
        end
        object TabSheet13: TTabSheet
          Caption = 'T'#237'tulo Eleitoral'
          ImageIndex = 1
          object Label92: TLabel
            Left = 0
            Top = -1
            Width = 51
            Height = 13
            Caption = 'Nro. T'#237'tulo'
            FocusControl = DBEdit46
          end
          object Label93: TLabel
            Left = 471
            Top = 0
            Width = 65
            Height = 13
            Caption = 'Data Emiss'#227'o'
            FocusControl = DBEdit47
          end
          object Label94: TLabel
            Left = 157
            Top = 0
            Width = 31
            Height = 13
            Caption = 'Se'#231#227'o'
            FocusControl = DBEdit48
          end
          object Label95: TLabel
            Left = 314
            Top = 0
            Width = 25
            Height = 13
            Caption = 'Zona'
            FocusControl = DBEdit49
          end
          object DBEdit46: TDBEdit
            Left = 0
            Top = 16
            Width = 150
            Height = 21
            DataField = 'ds_titulo_numero'
            DataSource = dsResponsavel
            TabOrder = 0
            OnKeyPress = dbNomeKeyPress
          end
          object DBEdit47: TDBEdit
            Left = 471
            Top = 16
            Width = 150
            Height = 21
            DataField = 'dt_titulo_emissao'
            DataSource = dsResponsavel
            TabOrder = 3
            OnKeyPress = dbNomeKeyPress
          end
          object DBEdit48: TDBEdit
            Left = 157
            Top = 16
            Width = 150
            Height = 21
            DataField = 'ds_titulo_secao'
            DataSource = dsResponsavel
            TabOrder = 1
            OnKeyPress = dbNomeKeyPress
          end
          object DBEdit49: TDBEdit
            Left = 314
            Top = 16
            Width = 150
            Height = 21
            DataField = 'ds_titulo_zona'
            DataSource = dsResponsavel
            TabOrder = 2
            OnKeyPress = dbNomeKeyPress
          end
        end
        object TabSheet14: TTabSheet
          Caption = 'Servi'#231'o Militar'
          ImageIndex = 2
          object Label96: TLabel
            Left = 2
            Top = 0
            Width = 55
            Height = 13
            Caption = 'Corpora'#231#227'o'
          end
          object Label97: TLabel
            Left = 146
            Top = 0
            Width = 54
            Height = 13
            Caption = 'Org'#227'o S.M.'
          end
          object Label98: TLabel
            Left = 270
            Top = 0
            Width = 84
            Height = 13
            Caption = 'N'#250'mero do Org'#227'o'
            FocusControl = DBEdit50
          end
          object Label99: TLabel
            Left = 396
            Top = 0
            Width = 80
            Height = 13
            Caption = 'Documento S.M.'
          end
          object Label100: TLabel
            Left = 628
            Top = 0
            Width = 63
            Height = 13
            Caption = 'N'#250'mero Doc.'
            FocusControl = DBEdit51
          end
          object DBEdit50: TDBEdit
            Left = 270
            Top = 16
            Width = 121
            Height = 21
            DataField = 'ds_rm_org_numero'
            DataSource = dsResponsavel
            TabOrder = 2
            OnKeyPress = dbNomeKeyPress
          end
          object DBEdit51: TDBEdit
            Left = 627
            Top = 16
            Width = 121
            Height = 21
            DataField = 'ds_rm_doc_numero'
            DataSource = dsResponsavel
            TabOrder = 4
            OnKeyPress = dbNomeKeyPress
          end
          object DBComboBox9: TDBComboBox
            Left = 2
            Top = 16
            Width = 137
            Height = 21
            DataField = 'ds_rm_corporacao'
            DataSource = dsResponsavel
            ItemHeight = 13
            Items.Strings = (
              'EX'#201'RCITO'
              'MARINHA'
              'AERON'#193'UTICA')
            TabOrder = 0
            OnKeyPress = dbNomeKeyPress
          end
          object DBComboBox10: TDBComboBox
            Left = 144
            Top = 16
            Width = 121
            Height = 21
            DataField = 'ds_rm_orgao'
            DataSource = dsResponsavel
            ItemHeight = 13
            Items.Strings = (
              'SSMR'
              'CSM'
              'SDR'
              'SERMOB'
              'SMOB')
            TabOrder = 1
            OnKeyPress = dbNomeKeyPress
          end
          object DBComboBox11: TDBComboBox
            Left = 396
            Top = 16
            Width = 222
            Height = 21
            DataField = 'ds_rm_doc_tipo'
            DataSource = dsResponsavel
            ItemHeight = 13
            Items.Strings = (
              'Certificado de Alistamento Militar'
              'Certificado de Reservista;'
              'Certificado de Dispensa de Incorpora'#231#227'o;'
              'Certificado de Isen'#231#227'o;'
              'Certid'#227'o de Situa'#231#227'o Militar'
              'Carta Patente '
              'Provis'#227'o de Reforma'
              'Atestado de Situa'#231#227'o Militar'
              'Atestado de Desobrigado do Servi'#231'o Militar')
            TabOrder = 3
            OnKeyPress = dbNomeKeyPress
          end
        end
        object TabSheet21: TTabSheet
          Caption = 'Certid'#227'o Civil'
          ImageIndex = 3
          object Label190: TLabel
            Left = 0
            Top = 0
            Width = 78
            Height = 13
            Caption = 'Tipo de Certid'#227'o'
          end
          object Label191: TLabel
            Left = 144
            Top = 0
            Width = 85
            Height = 13
            Caption = 'N'#250'mero do Termo'
            FocusControl = DBEdit118
          end
          object Label192: TLabel
            Left = 240
            Top = 0
            Width = 26
            Height = 13
            Caption = 'Folha'
            FocusControl = DBEdit119
          end
          object Label193: TLabel
            Left = 320
            Top = 0
            Width = 23
            Height = 13
            Caption = 'Livro'
            FocusControl = DBEdit120
          end
          object Label194: TLabel
            Left = 424
            Top = 0
            Width = 80
            Height = 13
            Caption = 'Data de Emiss'#227'o'
            FocusControl = DBEdit121
          end
          object Label195: TLabel
            Left = 528
            Top = 0
            Width = 53
            Height = 13
            Caption = 'UF Cart'#243'rio'
            FocusControl = DBEdit122
          end
          object Label196: TLabel
            Left = 592
            Top = 0
            Width = 82
            Height = 13
            Caption = 'Nome do Cart'#243'rio'
            FocusControl = DBEdit123
          end
          object DBComboBox19: TDBComboBox
            Left = 0
            Top = 16
            Width = 138
            Height = 21
            DataField = 'tp_cert'
            DataSource = dsResponsavel
            ItemHeight = 13
            Items.Strings = (
              'Nascimento'
              'Casamento'
              'Div'#243'rcio')
            TabOrder = 0
            OnKeyPress = dbNomeKeyPress
          end
          object DBEdit118: TDBEdit
            Left = 144
            Top = 16
            Width = 89
            Height = 21
            DataField = 'nr_cert_termo'
            DataSource = dsResponsavel
            TabOrder = 1
            OnKeyPress = dbNomeKeyPress
          end
          object DBEdit119: TDBEdit
            Left = 240
            Top = 16
            Width = 73
            Height = 21
            DataField = 'ds_cert_folha'
            DataSource = dsResponsavel
            TabOrder = 2
            OnKeyPress = dbNomeKeyPress
          end
          object DBEdit120: TDBEdit
            Left = 320
            Top = 16
            Width = 97
            Height = 21
            DataField = 'ds_cert_livro'
            DataSource = dsResponsavel
            TabOrder = 3
            OnKeyPress = dbNomeKeyPress
          end
          object DBEdit121: TDBEdit
            Left = 424
            Top = 16
            Width = 97
            Height = 21
            DataField = 'dt_cert'
            DataSource = dsResponsavel
            TabOrder = 4
            OnKeyPress = dbNomeKeyPress
          end
          object DBEdit122: TDBEdit
            Left = 528
            Top = 16
            Width = 57
            Height = 21
            DataField = 'ds_cert_uf'
            DataSource = dsResponsavel
            TabOrder = 5
            OnKeyPress = dbNomeKeyPress
          end
          object DBEdit123: TDBEdit
            Left = 592
            Top = 16
            Width = 136
            Height = 21
            DataField = 'ds_cert_orgao'
            DataSource = dsResponsavel
            TabOrder = 6
            OnKeyPress = dbNomeKeyPress
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
      object Panel6: TPanel
        Left = 658
        Top = 15
        Width = 107
        Height = 122
        TabOrder = 18
        Visible = False
        object imageFotoResp: TImage
          Left = 1
          Top = 1
          Width = 105
          Height = 120
          Align = alClient
          Stretch = True
          Visible = False
          ExplicitHeight = 121
        end
        object lbFotoResp: TLabel
          Left = 36
          Top = 52
          Width = 42
          Height = 17
          Caption = 'FOTO'
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -15
          Font.Name = 'Arial'
          Font.Style = []
          ParentFont = False
          Transparent = True
          Visible = False
        end
      end
      object DBLookupComboBox9: TDBLookupComboBox
        Left = 424
        Top = 15
        Width = 135
        Height = 21
        DataField = 'descEstadoCivil'
        DataSource = dsResponsavel
        TabOrder = 2
        OnKeyPress = dbNomeKeyPress
      end
      object DBLookupComboBox7: TDBLookupComboBox
        Left = 320
        Top = 53
        Width = 126
        Height = 21
        DataField = 'descEstadoNasc'
        DataSource = dsResponsavel
        TabOrder = 6
        OnKeyPress = dbNomeKeyPress
      end
      object DBLookupComboBox25: TDBLookupComboBox
        Left = 6
        Top = 53
        Width = 113
        Height = 21
        DataField = 'descPaisNasc'
        DataSource = dsResponsavel
        DropDownWidth = 150
        TabOrder = 4
        OnCloseUp = DBLookupComboBox25CloseUp
        OnExit = DBLookupComboBox18Exit
        OnKeyPress = dbNomeKeyPress
      end
      object DBLookupComboBox6: TDBLookupComboBox
        Left = 229
        Top = 96
        Width = 106
        Height = 21
        DataField = 'descEstado'
        DataSource = dsResponsavel
        DropDownWidth = 150
        TabOrder = 10
        OnKeyPress = dbNomeKeyPress
      end
      object DBLookupComboBox28: TDBLookupComboBox
        Left = 339
        Top = 96
        Width = 151
        Height = 21
        DataField = 'descMunicipioAtual'
        DataSource = dsResponsavel
        TabOrder = 11
        OnKeyPress = dbNomeKeyPress
      end
      object DBEdit33: TDBEdit
        Left = 496
        Top = 96
        Width = 157
        Height = 21
        DataField = 'ds_bairro'
        DataSource = dsResponsavel
        TabOrder = 12
        OnKeyPress = dbNomeKeyPress
      end
      object DBLookupComboBox24: TDBLookupComboBox
        Left = 452
        Top = 53
        Width = 202
        Height = 21
        DataField = 'descMunicipio'
        DataSource = dsResponsavel
        TabOrder = 7
        OnKeyPress = dbNomeKeyPress
      end
      object DBLookupComboBox30: TDBLookupComboBox
        Left = 6
        Top = 136
        Width = 105
        Height = 21
        DataField = 'desLogradouro'
        DataSource = dsResponsavel
        TabOrder = 13
        OnCloseUp = DBLookupComboBox30CloseUp
      end
      object DBEdit12: TDBLookupComboBox
        Left = 129
        Top = 96
        Width = 95
        Height = 21
        DataField = 'descPais'
        DataSource = dsResponsavel
        DropDownWidth = 150
        TabOrder = 9
        OnKeyPress = dbNomeKeyPress
      end
      object dbEdit9: TUMComboBox
        Left = 126
        Top = 53
        Width = 189
        Height = 21
        ItemHeight = 13
        TabOrder = 5
        OnExit = cbNacionalidadePaiExit
        OnKeyDown = cbNacionalidadePaiKeyDown
        TamanhoMaximo = 0
      end
      object pnl4: TPanel
        Left = 0
        Top = 233
        Width = 904
        Height = 288
        BevelOuter = bvNone
        TabOrder = 19
        object lblMensagemHierarquiaRespFinan: TLabel
          Left = 375
          Top = 218
          Width = 375
          Height = 26
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
        object Label102: TLabel
          Left = 6
          Top = 0
          Width = 85
          Height = 13
          Caption = 'Nome do Conjuge'
          FocusControl = DBEdit37
        end
        object Label103: TLabel
          Left = 6
          Top = 40
          Width = 61
          Height = 13
          Caption = 'Nome do Pai'
          FocusControl = DBEdit38
        end
        object Label221: TLabel
          Left = 6
          Top = 80
          Width = 67
          Height = 13
          Caption = 'Nome da M'#227'e'
          FocusControl = DBEdit38
        end
        object Label226: TLabel
          Left = 7
          Top = 126
          Width = 46
          Height = 13
          Caption = 'Profiss'#227'o:'
          FocusControl = DBEdit66
        end
        object Label228: TLabel
          Left = 7
          Top = 172
          Width = 85
          Height = 13
          Caption = 'Local de trabalho:'
          FocusControl = DBEdit66
        end
        object DBEdit29: TDBEdit
          Left = 7
          Top = 96
          Width = 363
          Height = 21
          DataField = 'nm_mae'
          DataSource = dsResponsavel
          TabOrder = 2
          OnKeyPress = dbNomeKeyPress
        end
        object DBEdit37: TDBEdit
          Left = 6
          Top = 16
          Width = 363
          Height = 21
          DataField = 'nm_conjuge'
          DataSource = dsResponsavel
          TabOrder = 0
          OnKeyPress = dbNomeKeyPress
        end
        object DBEdit38: TDBEdit
          Left = 6
          Top = 56
          Width = 363
          Height = 21
          DataField = 'nm_pai'
          DataSource = dsResponsavel
          TabOrder = 1
          OnKeyPress = dbNomeKeyPress
        end
        object VSTContatosRespFinan: TVirtualStringTree
          Left = 376
          Top = 16
          Width = 377
          Height = 196
          Header.AutoSizeIndex = 0
          Header.Font.Charset = DEFAULT_CHARSET
          Header.Font.Color = clWindowText
          Header.Font.Height = -11
          Header.Font.Name = 'Tahoma'
          Header.Font.Style = []
          Header.MainColumn = -1
          TabOrder = 5
          Columns = <>
        end
        object db_pessoa_profissao_respFinan: TDBEdit
          Left = 7
          Top = 145
          Width = 363
          Height = 21
          DataField = 'ds_profissao'
          DataSource = dsResponsavel
          TabOrder = 3
          OnKeyPress = dbNomeKeyPress
        end
        object db_local_trabalho_respFinan: TDBEdit
          Left = 6
          Top = 191
          Width = 363
          Height = 21
          DataField = 'ds_local_trabalho'
          DataSource = dsResponsavel
          TabOrder = 4
          OnKeyPress = dbNomeKeyPress
        end
      end
    end
    inherited tsParentes: TTabSheet
      ExplicitWidth = 1085
      ExplicitHeight = 628
      inherited frParentes1: TfrParentes
        Width = 1085
        Height = 628
        ExplicitWidth = 1085
        ExplicitHeight = 628
        inherited Bevel1: TBevel
          Height = 532
          ExplicitLeft = 0
          ExplicitTop = 57
          ExplicitHeight = 335
        end
        inherited Bevel2: TBevel
          Left = 1067
          Height = 532
          ExplicitLeft = 777
          ExplicitTop = 57
          ExplicitHeight = 335
        end
        inherited Bevel3: TBevel
          Top = 596
          Width = 1085
          ExplicitLeft = 0
          ExplicitTop = 418
          ExplicitWidth = 795
        end
        inherited Bevel4: TBevel
          Top = 589
          Width = 1085
          ExplicitLeft = 0
          ExplicitTop = 412
          ExplicitWidth = 795
        end
        inherited DBGrid1: TDBGrid
          Width = 1049
          Height = 532
        end
        inherited Panel1: TPanel
          Width = 1085
          ExplicitWidth = 1085
          inherited Buscar: TBitBtn
            Left = 529
            ExplicitLeft = 529
          end
        end
        inherited toolPessoa: TToolBar
          Top = 603
          Width = 1085
          ExplicitTop = 603
          ExplicitWidth = 1085
          inherited DBNavigator1: TDBNavigator
            Hints.Strings = ()
          end
        end
      end
    end
    object tsMatricula: TTabSheet
      Caption = 'MATR'#205'CULAS'
      ImageIndex = 4
      object Bevel1: TBevel
        Left = 386
        Top = 0
        Width = 5
        Height = 628
        Align = alLeft
        Shape = bsSpacer
        ExplicitHeight = 445
      end
      object Panel7: TPanel
        Left = 0
        Top = 0
        Width = 386
        Height = 628
        Align = alLeft
        BevelOuter = bvNone
        TabOrder = 0
        object DBGrid3: TDBGrid
          Left = 0
          Top = 21
          Width = 386
          Height = 498
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
              Title.Caption = 'Curso'
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
          Top = 519
          Width = 386
          Height = 109
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
            Font.Height = -12
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
            Font.Height = -12
            Font.Name = 'MS Sans Serif'
            Font.Style = [fsBold]
            ParentFont = False
          end
          object DBText5: TDBText
            Left = 83
            Top = 25
            Width = 300
            Height = 17
            DataField = 'nm_instituicao'
            DataSource = dsMatriculasCurso
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -12
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
            Font.Height = -12
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
            Font.Height = -12
            Font.Name = 'MS Sans Serif'
            Font.Style = [fsBold]
            ParentFont = False
          end
          object sbHistorico: TSpeedButton
            Left = -1
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
          Height = 21
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
        Left = 391
        Top = 0
        Width = 694
        Height = 628
        Align = alClient
        BevelOuter = bvNone
        TabOrder = 1
        object Panel11: TPanel
          Left = 0
          Top = 0
          Width = 694
          Height = 21
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
          Top = 21
          Width = 694
          Height = 607
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
              ReadOnly = True
              Visible = False
            end
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
  object toolAcademico: TToolBar [3]
    Left = 0
    Top = 709
    Width = 1093
    Height = 25
    Align = alBottom
    ButtonWidth = 85
    Caption = 'ToolBar1'
    EdgeBorders = [ebTop, ebBottom]
    Images = ImageList1
    List = True
    ShowCaptions = True
    TabOrder = 1
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
    object btAcad_Cancelar: TToolButton
      Left = 534
      Top = 0
      Caption = 'F6 Cancelar'
      ImageIndex = 4
      OnClick = btAcad_CancelarClick
    end
    object ToolButton18: TToolButton
      Left = 619
      Top = 0
      Width = 8
      Caption = 'ToolButton11'
      ImageIndex = 7
      Style = tbsSeparator
    end
    object btBuscarPessoaAcad: TToolButton
      Left = 627
      Top = 0
      Caption = 'F8 Buscar'
      ImageIndex = 5
      OnClick = btBuscarPessoaAcadClick
    end
    object btDesvincular: TToolButton
      Left = 712
      Top = 0
      Caption = 'Desvincular'
      ImageIndex = 8
      Visible = False
      OnClick = btDesvincularClick
    end
    object btAcad_Fechar: TToolButton
      Left = 797
      Top = 0
      Caption = 'F12 Fechar'
      ImageIndex = 7
      OnClick = btFechar_PessoaClick
    end
    object ToolButton20: TToolButton
      Left = 882
      Top = 0
      Width = 8
      Caption = 'ToolButton2'
      ImageIndex = 8
      Style = tbsSeparator
    end
  end
  object toolMatricula: TToolBar [4]
    Left = 0
    Top = 734
    Width = 1093
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
      Caption = 'Nova Matricula'
      ImageIndex = 0
      OnClick = btnMatricularClick
    end
    object btnRematricular: TToolButton
      Left = 111
      Top = 0
      AutoSize = True
      Caption = 'Rematr'#237'cula'
      ImageIndex = 0
      OnClick = btnRematricularClick
    end
    object ToolButton12: TToolButton
      Left = 200
      Top = 0
      Width = 8
      Caption = 'ToolButton9'
      ImageIndex = 6
      Style = tbsSeparator
    end
    object btnDocumentos: TToolButton
      Left = 208
      Top = 0
      AutoSize = True
      Caption = 'Documentos'
      ImageIndex = 1
      OnClick = btnDocumentosClick
    end
    object ToolButton19: TToolButton
      Left = 299
      Top = 0
      Width = 8
      Caption = 'ToolButton4'
      ImageIndex = 3
      Style = tbsSeparator
    end
    object btnOrientacao: TToolButton
      Left = 307
      Top = 0
      AutoSize = True
      Caption = 'Orienta'#231#227'o Pedag'#243'gica'
      ImageIndex = 1
      OnClick = btnOrientacaoClick
    end
    object btnFinanceiro: TToolButton
      Left = 450
      Top = 0
      AutoSize = True
      Caption = 'Financeiro'
      ImageIndex = 9
      OnClick = btnFinanceiroClick
    end
    object btn_Imprimir: TToolButton
      Left = 530
      Top = 0
      AutoSize = True
      Caption = 'F7 Imprimir'
      ImageIndex = 6
      OnClick = btImprimir_PessoaClick
    end
    object btnFechar: TToolButton
      Left = 611
      Top = 0
      AutoSize = True
      Caption = 'F12 Fechar'
      ImageIndex = 7
      OnClick = btFechar_PessoaClick
    end
  end
  inherited ImageList1: TImageList
    Left = 544
    Top = 634
    Bitmap = {
      494C01010B000E00040010001000FFFFFFFFFF10FFFFFFFFFFFFFFFF424D3600
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
      0000E9E9E900E3E3E300F2F2F200000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000FFFF0000FFFF000084840000FFFF000084
      840000000000000000000000000000000000000000000000000000000000BAC0
      C3004E9EBB003086A600426C7A007B828600C1C1C100F4F4F400000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000006B6B6B006B6B6B006B6B
      6B006B6B6B006B6B6B0000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000008484000000000000FFFF0000FFFF000084840000848400000000000084
      84000084840000000000000000000000000000000000000000009ABECA000AA4
      DB00C5F6FF0070D7FF0075D8FF0071DCFF005DD1FD002789AC00777A7C00EAEA
      EA00000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000B5523100D64A2100E75A3900FF63
      5200FF635200D64A2100A53918006B524A006B6B6B006B6B6B006B6B6B006B6B
      6B006B6B6B006B6B6B006B6B6B00000000000000000000000000000000000084
      84000000000000FFFF0000FFFF000000000000FFFF000084840000FFFF000084
      840000848400008484000000000000000000000000000000000037B0DB0020A9
      DE00ACF9FF0079DFFF0079DFFF0076DCFF0060C8F6007BE0FF0078E6FF002773
      8E00D7D7D7000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000C6421000EF5A4200FF735A00FF7B
      6300C6522900D68C5200FF6B5200EF5A420042B54200299C290052C652004ABD
      4A0039B5390029AD290018731800000000000000000000000000000000000084
      84000084840000FFFF0000FFFF0000FFFF0000FFFF0000848400008484000084
      84000084840000848400000000000000000000000000000000003EB4DE0036B3
      E800A1F9FF0084E9FF0084E9FF0081E7FC003F9AC70085EBFF0084E9FF006CE5
      FF00BABABA000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000CE5A2900FF6B5A00FF846B00EF84
      5A00FFDEA500FFDEA500FF846B00FF6352006BCE6B00BDDEAD004A9C42006BCE
      6B0052C6520039B539001873180000000000000000000000000000FFFF000084
      840000FFFF000084840000FFFF0000FFFF000084840000FFFF0000FFFF000084
      840000FFFF00008484000084840000000000000000000000000045B7E10048BE
      F200BFF8FF008DF3FF008DF3FF007FD0D900337DA30093FBFF008DF3FF0070EB
      FF00BBBBBB000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000D6633100FF8C6B00EF9C
      7B00BD8C8400FFBD9400FF8C7300B54218007BD67B00000000000000000063C6
      63006BCE6B00299C29000000000000000000000000000000000000FFFF000084
      840000FFFF00008484000084840000FFFF0000FFFF0000FFFF0000FFFF0000FF
      FF000084840000848400008484000000000000000000000000004BB9E5005BC7
      FC00CBFEFF0097FDFF0097FDFF0094FBFF0057788A0098FFFF0097FDFF0078F2
      FF00BBBBBB000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000004A4A4A00000000000821
      7B001029940000187B00635A5A00399C39008CE78C00DED6BD00398CB5009CB5
      A50042A54200000000000000000000000000000000000000000000FFFF000084
      840000FFFF00008484000084840000FFFF0000FFFF0000FFFF0000FFFF0000FF
      FF000084840000FFFF000084840000000000000000000000000050BEE5006CD7
      FE00ECFFFF00C3FFFF00B8FEFF00A8FDFF007EDCFA00ACFFFF00A9FFFF0087F4
      FF00BBBBBB000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000181818001010100008296B00184A
      AD00184AB500184AAD0008186B0000000000000000002994F7002994F7002994
      F700105A8C006B6B6B000000000000000000000000000000000000FFFF000084
      840000FFFF0000848400008484000084840000FFFF0000FFFF000000000000FF
      FF00008484000084840000FFFF0000000000000000000000000056C5E50044C5
      E4002E89B30048B1E20045B8E50085D0EA00CEEDF600E9FFFF00CAFFFF00A0F4
      FF00BBBBBB000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000018181800212121002163C600216B
      CE00216BD6002163CE0010429C0000000000218CE70039A5FF0039A5FF0039A5
      FF00319CFF005A6363000000000000000000000000000000000000FFFF000084
      84000084840000848400008484000084840000FFFF0000FFFF0000FFFF000084
      840000FFFF000084840000FFFF000000000000000000000000008AD0E7009EFD
      FE00059ED5003DAACD006DD3FF0055C3F7002FB2E6000F80AF007ECCE500C9F7
      FF00BABABA000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000029292900313131002163B500298C
      F7003194FF00298CF700185AC6000000000042ADFF004AB5FF004AB5FF004AAD
      FF0042ADFF00216384000000000000000000000000000000000000FFFF0000FF
      FF00008484000084840000848400008484000084840000848400008484000084
      840000FFFF0000FFFF000000000000000000000000000000000000000000FCFE
      FE002CAFE20062DDF00097FBFF0078DDFF0057B6E8001EB0E3001993C30005A3
      DA00EBEBEB000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000001818180042424200292929001042
      9C00216BDE003194F700105AA5000000000052B5FF0052BDFF0052BDFF0052BD
      FF004AB5FF00107BBD00000000000000000000000000000000000000000000FF
      FF00008484000084840000FFFF000084840000848400008484000084840000FF
      FF0000FFFF000084840000000000000000000000000000000000000000000000
      000047BCEF004D6A7500A4D7E90052BEDE0044BDE3003FB6E60026B2E80097B5
      BF00000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000052525200636363009494
      940073737300292929003939390000000000107BBD002184C600398CB5001884
      CE002184C60010638C00000000000000000000000000000000000000000000FF
      FF0000FFFF00008484000084840000848400008484000000000000FFFF0000FF
      FF0000FFFF000000000000000000000000000000000000000000000000000000
      00004DC0E900288FB300E9E9E90000000000000000005BC7F9006B7B81000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000636363009494
      94006B6B6B002929290000000000000000001073A50052ADD60084C6E7009CCE
      E7003994C6000000000000000000000000000000000000000000000000000000
      000000FFFF0000FFFF00008484000084840000FFFF000084840000FFFF0000FF
      FF00000000000000000000000000000000000000000000000000000000000000
      0000ABDBEB009AFEFF004F606700E9E9E900D6D8D9008BF0FF00829096000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000001073A5001073A5001073
      A500000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000FFFF00008484000084840000848400008484000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000004EBDDD00A2FFFF003CB4CF007BEEF90071ECFA00F3F3F3000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000B5DFEE0062CFE7004CB0CC00EEEFF000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
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
      00000000000000000000000000000000FFFFFE0FF1FF0000FFFFF007E03F0000
      83FFE003C00F00000001C001C00700000001C001C007000000018000C0070000
      80638000C007000080078000C007000001838000C007000001038000C0070000
      01038001E00700000103C001F00F00008103C003F19F0000C307E007F01F0000
      FF8FF00FF81F0000FFFFFC1FFC3F0000FFFFF8F8FFFFFFFFF83FFAFAFC7FE3FF
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
    Left = 814
    Top = 414
    inherited tblPessoacd_pessoa: TIntegerField
      DisplayFormat = '000000-0'
      EditFormat = '0000000'
    end
    object tblPessoadescRaca: TStringField [117]
      FieldKind = fkLookup
      FieldName = 'descRaca'
      LookupDataSet = qyRacas
      LookupKeyFields = 'cd_situacao'
      LookupResultField = 'ds_valor'
      KeyFields = 'cd_raca'
      Lookup = True
    end
    object tblPessoads_formacao_academica: TStringField [118]
      FieldName = 'ds_formacao_academica'
      Size = 255
    end
  end
  inherited dsPessoa: TDataSource
    Left = 849
    Top = 408
  end
  inherited tblEstadosCivis: TZTable
    Left = 808
    Top = 624
  end
  inherited AbrirFoto: TSavePictureDialog
    Top = 24
  end
  inherited tblTpLogradouro: TUMZQuery
    Left = 776
    Top = 624
  end
  inherited tblMunicipios: TUMZQuery
    Left = 777
    Top = 587
  end
  inherited tblMunicipioAtual: TUMZQuery
    Left = 809
    Top = 587
  end
  inherited tblPaises: TZTable
    Left = 624
    Top = 632
  end
  inherited tblContatosPadroes: TUMZQuery
    Left = 848
    Top = 480
  end
  inherited tblOrgaos: TUMZQuery
    Left = 792
    Top = 488
  end
  inherited qryPessoaUpdatePraca: TUMZQuery
    Left = 256
    Top = 576
  end
  inherited qryPessoaUpdateMunicipio: TUMZQuery
    Left = 224
    Top = 576
  end
  inherited qryPessoaUpdateMunNasc: TUMZQuery
    Left = 192
    Top = 576
  end
  object tblResponsavel: TUMZQuery [19]
    Connection = DM.db
    AfterOpen = tblResponsavelAfterOpen
    AfterInsert = tblResponsavelAfterInsert
    BeforePost = tblResponsavelBeforePost
    AfterPost = tblResponsavelAfterPost
    OnNewRecord = tblResponsavelNewRecord
    SQL.Strings = (
      'select * from pessoas where cd_pessoa = :cd_responsavel')
    Params = <
      item
        DataType = ftInteger
        Name = 'cd_responsavel'
        ParamType = ptUnknown
      end>
    DataSource = DM.dsInstituicoes
    Left = 667
    Top = 636
    ParamData = <
      item
        DataType = ftInteger
        Name = 'cd_responsavel'
        ParamType = ptUnknown
      end>
    object tblResponsaveldescMunicipio: TStringField
      FieldKind = fkLookup
      FieldName = 'descMunicipio'
      LookupDataSet = tblMunicipioResp
      LookupKeyFields = 'cd_municipio'
      LookupResultField = 'ds_municipio'
      KeyFields = 'cd_municipio_nasc'
      Size = 50
      Lookup = True
    end
    object tblResponsaveldescPais: TStringField
      FieldKind = fkLookup
      FieldName = 'descPaisNasc'
      LookupDataSet = tblPaises
      LookupKeyFields = 'cd_pais'
      LookupResultField = 'ds_pais'
      KeyFields = 'cd_pais_nascimento'
      Size = 40
      Lookup = True
    end
    object tblResponsavelcd_pessoa: TIntegerField
      FieldName = 'cd_pessoa'
      Origin = 'WMESTRE12.pessoas.cd_pessoa'
    end
    object tblResponsaveldescPais2: TStringField
      FieldKind = fkLookup
      FieldName = 'descPais'
      LookupDataSet = tblPaises
      LookupKeyFields = 'cd_pais'
      LookupResultField = 'ds_pais'
      KeyFields = 'cd_pais'
      Size = 40
      Lookup = True
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
      OnChange = tblResponsavelds_estado_nascimentoChange
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
      OnChange = tblResponsavelds_estadoChange
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
      LookupDataSet = DM.tblEstados2
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
    object tblResponsaveldescMunicipioAtual: TStringField
      FieldKind = fkLookup
      FieldName = 'descMunicipioAtual'
      LookupDataSet = tblMunicipioAtualResp
      LookupKeyFields = 'cd_municipio'
      LookupResultField = 'ds_municipio'
      KeyFields = 'cd_municipio'
      Size = 50
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
      OnGetText = tblResponsaveltp_certGetText
      OnSetText = tblResponsaveltp_certSetText
    end
    object tblResponsavelnr_cert_termo2: TStringField
      Alignment = taRightJustify
      DisplayWidth = 10
      FieldName = 'nr_cert_termo'
      Origin = 'WMESTRE12.pessoas.nr_cert_termo'
      Size = 50
    end
    object tblResponsavelds_cert_folha: TStringField
      FieldName = 'ds_cert_folha'
      Origin = 'WMESTRE12.pessoas.ds_cert_folha'
      Size = 8
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
    object tblResponsavelds_cert_uf: TStringField
      FieldName = 'ds_cert_uf'
      Origin = 'WMESTRE12.pessoas.ds_cert_uf'
      FixedChar = True
      Size = 3
    end
    object tblResponsavelds_cert_orgao: TStringField
      FieldName = 'ds_cert_orgao'
      Origin = 'WMESTRE12.pessoas.ds_cert_orgao'
    end
    object tblResponsavelds_estado_civil: TStringField
      FieldName = 'ds_estado_civil'
      Origin = 'WMESTRE12.pessoas.ds_estado_civil'
      FixedChar = True
      Size = 1
    end
    object tblResponsavelds_login: TStringField
      FieldName = 'ds_login'
      Origin = 'WMESTRE12.pessoas.ds_login'
      Size = 100
    end
    object tblResponsaveltp_pessoa: TStringField
      FieldName = 'tp_pessoa'
      Origin = 'WMESTRE12.pessoas.tp_pessoa'
      FixedChar = True
      Size = 1
    end
    object tblResponsavelds_cnpj: TStringField
      FieldName = 'ds_cnpj'
      Origin = 'WMESTRE12.pessoas.ds_cnpj'
      Size = 14
    end
    object tblResponsavelds_inscri_estadual: TStringField
      FieldName = 'ds_inscri_estadual'
      Origin = 'WMESTRE12.pessoas.ds_inscri_estadual'
      Size = 50
    end
    object tblResponsavelsn_obito: TSmallintField
      FieldName = 'sn_obito'
      Origin = 'WMESTRE12.pessoas.sn_obito'
    end
    object tblResponsavelsn_pai_resp: TSmallintField
      FieldName = 'sn_pai_resp'
      Origin = 'WMESTRE12.pessoas.sn_pai_resp'
    end
    object tblResponsavelsn_mae_resp: TSmallintField
      FieldName = 'sn_mae_resp'
      Origin = 'WMESTRE12.pessoas.sn_mae_resp'
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
    object tblResponsavelcd_orgao_emissor: TLargeintField
      FieldName = 'cd_orgao_emissor'
    end
    object tblResponsavelcd_municipio_nasc: TLargeintField
      FieldName = 'cd_municipio_nasc'
    end
    object tblResponsavelnr_praca: TLargeintField
      FieldName = 'nr_praca'
    end
    object tblResponsavelcd_estado_nascimento: TSmallintField
      FieldName = 'cd_estado_nascimento'
    end
    object tblResponsavelcd_estado: TLargeintField
      FieldName = 'cd_estado'
    end
    object d: TSmallintField
      FieldName = 'cd_cert_uf'
      Origin = 'WMESTRE12.pessoas.cd_cert_uf'
    end
    object tblResponsavelcd_convenio: TLargeintField
      FieldName = 'cd_convenio'
    end
    object tblResponsavelCD_LOCALIDADE: TIntegerField
      FieldName = 'CD_LOCALIDADE'
    end
    object tblResponsavelcd_localidade_nasc: TIntegerField
      FieldName = 'cd_localidade_nasc'
    end
    object tblResponsaveldesLogradouro: TStringField
      FieldKind = fkLookup
      FieldName = 'desLogradouro'
      LookupDataSet = tblTpLogradouro
      LookupKeyFields = 'cd_logradouro'
      LookupResultField = 'ds_logradouro'
      KeyFields = 'cd_logradouro'
      Lookup = True
    end
    object tblResponsavelcd_mae: TLargeintField
      FieldName = 'cd_mae'
    end
    object tblResponsavelcd_pai: TLargeintField
      FieldName = 'cd_pai'
    end
    object tblResponsavelnm_contato: TStringField
      FieldName = 'nm_contato'
      Size = 100
    end
    object tblResponsavelnr_dia_vencimento: TLargeintField
      FieldName = 'nr_dia_vencimento'
    end
    object tblResponsavelsn_nao_bloquear_financeiro: TSmallintField
      FieldName = 'sn_nao_bloquear_financeiro'
    end
    object tblResponsavelcd_pessoa_alteracao: TLargeintField
      FieldName = 'cd_pessoa_alteracao'
    end
    object tblResponsavelds_senha_md4: TStringField
      FieldName = 'ds_senha_md4'
      Size = 32
    end
    object tblResponsavelsn_pais_como_resp: TSmallintField
      FieldName = 'sn_pais_como_resp'
      Required = True
    end
    object tblResponsavelsn_requerimentos_email: TStringField
      FieldName = 'sn_requerimentos_email'
      Size = 1
    end
    object tblResponsavelcd_instituicao_ensino: TSmallintField
      FieldName = 'cd_instituicao_ensino'
    end
    object tblResponsavelcd_raca: TSmallintField
      FieldName = 'cd_raca'
    end
    object tblResponsavelcd_mec: TStringField
      FieldName = 'cd_mec'
      Size = 30
    end
    object tblResponsavelsn_foto: TStringField
      FieldName = 'sn_foto'
      Size = 1
    end
    object tblResponsavelsn_bloqueado: TSmallintField
      FieldName = 'sn_bloqueado'
    end
    object tblResponsavelds_inscri_municipal: TStringField
      FieldName = 'ds_inscri_municipal'
      Size = 50
    end
    object tblResponsavelcd_bairro: TIntegerField
      FieldName = 'cd_bairro'
    end
    object tblResponsavelcd_usuario_pessoa: TLargeintField
      FieldName = 'cd_usuario_pessoa'
    end
    object tblResponsavelsn_bloq_cartas: TSmallintField
      FieldName = 'sn_bloq_cartas'
    end
    object tblResponsavelsn_bloq_emails: TSmallintField
      FieldName = 'sn_bloq_emails'
    end
    object tblResponsavelsn_naturalizado: TSmallintField
      FieldName = 'sn_naturalizado'
    end
    object tblResponsaveldt_identidade_expiracao: TDateTimeField
      FieldName = 'dt_identidade_expiracao'
    end
    object tblResponsavelds_matricula: TStringField
      FieldName = 'ds_matricula'
      Size = 40
    end
    object tblResponsavelsn_pode_retirar_material: TSmallintField
      FieldName = 'sn_pode_retirar_material'
    end
    object tblResponsavelds_passaporte: TStringField
      FieldName = 'ds_passaporte'
      Size = 50
    end
    object tblResponsavelds_profissao: TStringField
      FieldName = 'ds_profissao'
      Size = 255
    end
    object tblResponsavelds_local_trabalho: TStringField
      FieldName = 'ds_local_trabalho'
      Size = 255
    end
  end
  object dsResponsavel: TDataSource [20]
    DataSet = tblResponsavel
    OnStateChange = dsResponsavelStateChange
    OnDataChange = dsResponsavelDataChange
    Left = 696
    Top = 636
  end
  object tblMatriculaCurso: TUMZQuery [21]
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
      'ORDER BY mc.nr_anosem_ingresso DESC,mc.cd_matricula_curso DESC')
    Params = <
      item
        DataType = ftInteger
        Name = 'cd_pessoa'
        ParamType = ptUnknown
        Size = 4
      end>
    DataSource = dsPessoa
    Left = 628
    Top = 604
    ParamData = <
      item
        DataType = ftInteger
        Name = 'cd_pessoa'
        ParamType = ptUnknown
        Size = 4
      end>
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
    object tblMatriculaCursonr_anosem_ingresso: TLargeintField
      DisplayLabel = 'Ano/Sem'
      FieldName = 'nr_anosem_ingresso'
      DisplayFormat = '0000/0'
    end
    object tblMatriculaCursoCD_MATRICULA_CURSO: TLargeintField
      FieldName = 'CD_MATRICULA_CURSO'
    end
    object tblMatriculaCursocd_pessoa: TIntegerField
      FieldName = 'cd_pessoa'
      Required = True
    end
    object tblMatriculaCursocd_curso: TStringField
      FieldName = 'cd_curso'
      Required = True
      Size = 15
    end
    object tblMatriculaCursodescricao: TStringField
      FieldName = 'descricao'
      Size = 255
    end
    object tblMatriculaCursocd_instituicao: TLargeintField
      FieldName = 'cd_instituicao'
    end
    object tblMatriculaCursonm_instituicao: TStringField
      FieldName = 'nm_instituicao'
      Size = 100
    end
  end
  object dsMatriculasCurso: TDataSource [22]
    AutoEdit = False
    DataSet = tblMatriculaCurso
    Left = 596
    Top = 604
  end
  object tblMatriculasEtapa: TUMZQuery [23]
    Connection = DM.db
    SQL.Strings = (
      'select'
      
        '  m.codigoaluno, m.situacao, m.turma, m.anosemestre, m.dataemiss' +
        'ao,s.cd_situacao, s.ds_situacao, i.*, t.serie,'
      
        '  m.cd_matricula_curso, sn_proximo_curso, cd_proximo_curso, t.cu' +
        'rso as cd_curso_atual'
      'from matriculas m, situacao s, matriculas_ingresso i, turmas t'
      'where m.situacao = s.cd_situacao '
      '   and i.cd_ingresso = m.cd_ingresso'
      '   and t.codigo = m.turma and t.anosemestre = m.anosemestre'
      '   and m.cd_matricula_curso = :cd_matricula_curso'
      'order by m.AnoSemestre,  m.cd_matricula_curso ')
    Params = <
      item
        DataType = ftInteger
        Name = 'cd_matricula_curso'
        ParamType = ptUnknown
        Size = 4
      end>
    DataSource = dsMatriculasCurso
    Left = 693
    Top = 604
    ParamData = <
      item
        DataType = ftInteger
        Name = 'cd_matricula_curso'
        ParamType = ptUnknown
        Size = 4
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
      Size = 15
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
    object tblMatriculasEtapacd_matricula_curso: TLargeintField
      FieldName = 'cd_matricula_curso'
    end
    object tblMatriculasEtapasn_proximo_curso: TSmallintField
      FieldName = 'sn_proximo_curso'
    end
    object tblMatriculasEtapacd_proximo_curso: TStringField
      FieldName = 'cd_proximo_curso'
      Size = 15
    end
    object tblMatriculasEtapacd_curso_atual: TStringField
      FieldName = 'cd_curso_atual'
      Size = 0
    end
  end
  object dsMatriculasEtapa: TDataSource [24]
    AutoEdit = False
    DataSet = tblMatriculasEtapa
    Left = 661
    Top = 604
  end
  object qryMensalidades: TUMZQuery [25]
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
    Left = 845
    Top = 548
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
  object tblContatos: TUMZQuery [26]
    Connection = DM.db
    Params = <>
    Left = 848
    Top = 448
  end
  object qyDocumentos: TUMZQuery [27]
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
    Left = 814
    Top = 378
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'cd_pessoa'
        ParamType = ptUnknown
      end>
  end
  object qyDocumentosNaoNecessarios: TUMZQuery [28]
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
    Left = 846
    Top = 516
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'cd_pessoa'
        ParamType = ptUnknown
      end>
  end
  inherited pmFoto: TPopupMenu
    Left = 832
    Top = 128
  end
  object qyRacas: TUMZQuery [31]
    Connection = DM.db
    SQL.Strings = (
      'SELECT'
      '   codigo,'
      '   cd_situacao,'
      '   ds_valor,'
      '   ds_sigla'
      'FROM'
      '   situacoes'
      'WHERE'
      '   cd_modulo = 1021'
      'ORDER BY'
      '   ds_valor')
    Params = <>
    DataSource = dsPessoa
    Left = 816
    Top = 344
  end
  object qyMunicipiosResp: TUMZQuery [32]
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
    Left = 744
    Top = 624
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'ds_estado_nascimento'
        ParamType = ptUnknown
      end>
    object qyMunicipiosRespcd_municipio: TLargeintField
      FieldName = 'cd_municipio'
    end
    object qyMunicipiosRespds_municipio: TStringField
      FieldName = 'ds_municipio'
      Size = 120
    end
  end
  object tblMunicipioResp: TUMZQuery [33]
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
    Left = 840
    Top = 624
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'ds_estado_nascimento'
        ParamType = ptUnknown
      end>
    object StringField2: TStringField
      FieldName = 'ds_municipio'
    end
    object tblMunicipioRespCD_MUNICIPIO: TLargeintField
      FieldName = 'CD_MUNICIPIO'
    end
  end
  object tblMunicipioAtualResp: TUMZQuery [34]
    Connection = DM.db
    SQL.Strings = (
      'SELECT cd_municipio, ds_municipio, nr_praca FROM municipios'
      'WHERE uf = :ds_estado'
      'ORDER by ds_municipio')
    Params = <
      item
        DataType = ftUnknown
        Name = 'ds_estado'
        ParamType = ptUnknown
      end>
    Left = 841
    Top = 587
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'ds_estado'
        ParamType = ptUnknown
      end>
    object tblMunicipioAtualRespCD_MUNICIPIO: TLargeintField
      FieldName = 'CD_MUNICIPIO'
    end
    object tblMunicipioAtualRespNR_PRACA: TLargeintField
      FieldName = 'NR_PRACA'
    end
    object tblMunicipioAtualRespds_municipio: TStringField
      FieldName = 'ds_municipio'
      Size = 120
    end
  end
  inherited DelphiTwain1: TDelphiTwain
    Left = 838
    Top = 100
  end
  inherited qyPais: TUMZQuery
    AfterOpen = nil
    AfterInsert = nil
    BeforePost = nil
    AfterPost = nil
    AfterCancel = nil
    BeforeDelete = nil
    OnNewRecord = nil
    ParamCheck = False
  end
  inherited qyVinculosExterno: TUMZQuery
    Left = 696
    Top = 328
  end
  inherited dsVinculoExterno: TDataSource
    Left = 728
    Top = 328
  end
  object qryUpdateMat: TUMZQuery
    Connection = DM.db
    SQL.Strings = (
      'UPDATE MATRICULAS'
      'SET'
      '   CD_MATRICULA = NR_MATRICULA'
      'WHERE'
      '   CD_MATRICULA_CURSO = :CD_MATRICULA_CURSO')
    Params = <
      item
        DataType = ftUnknown
        Name = 'CD_MATRICULA_CURSO'
        ParamType = ptUnknown
      end>
    SQLList.Strings = (
      
        'mysql-5=UPDATE'#13#10'   MATRICULAS MA'#13#10'      JOIN MATRICULAS_CURSO MC' +
        ' ON'#13#10'         (MA.CD_MATRICULA_CURSO = MC.CD_MATRICULA_CURSO)'#13#10'S' +
        'ET'#13#10'   MA.CD_MATRICULA = MC.NR_MATRICULA'#13#10'WHERE'#13#10'   MC.CD_MATRIC' +
        'ULA_CURSO = :CD_MATRICULA_CURSO'
      
        'oracle=MERGE INTO MATRICULAS MA USING'#13#10'('#13#10'   SELECT'#13#10'      CD_MA' +
        'TRICULA_CURSO,'#13#10'      NR_MATRICULA'#13#10'   FROM'#13#10'      MATRICULAS_CU' +
        'RSO'#13#10'   WHERE'#13#10'      CD_MATRICULA_CURSO = :CD_MATRICULA_CURSO'#13#10')' +
        ' MC ON'#13#10'   (MA.CD_MATRICULA_CURSO = MC.CD_MATRICULA_CURSO)'#13#10'WHEN' +
        ' MATCHED THEN'#13#10'   UPDATE SET MA.CD_MATRICULA = MC.NR_MATRICULA')
    Left = 16
    Top = 592
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'CD_MATRICULA_CURSO'
        ParamType = ptUnknown
      end>
  end
  object qyCampos: TUMZQuery
    Connection = DM.db
    SQL.Strings = (
      'SELECT'
      #9'  CD_CAMPO,'
      #9'  DS_CAMPO,'
      #9'  DS_CAMPO_DESCRICAO,'
      #9'  DS_TIPO,'
      #9'  DS_PESSOA,'
      #9'  NR_ORDEM,'
      #9'  DS_CATEGORIA,'
      #9'  CD_OPCAO,'
      #9'  DS_CHAVE  '
      'FROM'
      #9'  PESSOAS_CAMPOS_ADICIONAIS  '
      'WHERE'
      #9'DS_PESSOA = '#39'A'#39
      'AND '
      #9'ds_chave = '#39'profissao'#39
      'ORDER BY'
      #9'  DS_CATEGORIA,'
      #9'  NR_ORDEM')
    Params = <>
    Left = 296
    Top = 224
    object qyCamposCD_CAMPO: TIntegerField
      FieldName = 'CD_CAMPO'
    end
    object qyCamposDS_CAMPO: TStringField
      FieldName = 'DS_CAMPO'
      Size = 30
    end
    object qyCamposDS_CAMPO_DESCRICAO: TStringField
      FieldName = 'DS_CAMPO_DESCRICAO'
      Size = 255
    end
    object qyCamposDS_TIPO: TStringField
      FieldName = 'DS_TIPO'
      Size = 1
    end
    object qyCamposDS_PESSOA: TStringField
      FieldName = 'DS_PESSOA'
      Size = 1
    end
    object qyCamposNR_ORDEM: TIntegerField
      FieldName = 'NR_ORDEM'
    end
    object qyCamposDS_CATEGORIA: TStringField
      FieldName = 'DS_CATEGORIA'
      Size = 255
    end
    object qyCamposcd_opcao: TIntegerField
      FieldName = 'cd_opcao'
    end
    object qyCamposDS_CHAVE: TStringField
      FieldName = 'DS_CHAVE'
      Size = 256
    end
  end
  object qyCadastroCampos_Opcoes: TUMZQuery
    Connection = DM.db
    SQL.Strings = (
      'SELECT'
      '  ctu.*,'
      '  ctc.ds_conteudo'
      'FROM'
      '  pessoas_campos_opcoes ctu'
      
        '  INNER JOIN pessoas_campos_adicionais ctca on(ctu.cd_opcao = ct' +
        'ca.cd_opcao)'
      
        '  LEFT JOIN  pessoas_cadastro ctc on (ctc.cd_campo = ctca.cd_cam' +
        'po)  '
      'WHERE'
      '  ctu.cd_opcao = :cd_opcao'
      '  and ctca.cd_campo = :cd_campo')
    Params = <
      item
        DataType = ftUnknown
        Name = 'cd_opcao'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'cd_campo'
        ParamType = ptUnknown
      end>
    Left = 328
    Top = 224
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'cd_opcao'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'cd_campo'
        ParamType = ptUnknown
      end>
    object qyCadastroCampos_Opcoescd_opcao: TIntegerField
      FieldName = 'cd_opcao'
    end
    object qyCadastroCampos_Opcoesds_opcao: TStringField
      FieldName = 'ds_opcao'
      Size = 255
    end
    object qyCadastroCampos_Opcoesme_sql: TMemoField
      FieldName = 'me_sql'
      BlobType = ftMemo
      Size = 1
    end
    object qyCadastroCampos_Opcoesme_opcoes: TMemoField
      FieldName = 'me_opcoes'
      BlobType = ftMemo
      Size = 1
    end
    object qyCadastroCampos_Opcoesds_conteudo: TStringField
      FieldName = 'ds_conteudo'
      Size = 100
    end
  end
  object qyCategorias: TUMZQuery
    Connection = DM.db
    SQL.Strings = (
      'SELECT'
      #9'COALESCE(pca.ds_categoria, '#39'Geral'#39') AS ds_categoria,'
      #9'pcc.cd_acao cd_acao'
      'FROM'
      #9'pessoas_campos_adicionais AS pca'
      'INNER JOIN pessoas_campos_categorias AS pcc ON ('
      #9'pcc.nm_categoria = pca.DS_CATEGORIA'
      ')'
      'WHERE'
      #9'pca.ds_pessoa = '#39'A'#39
      'AND '
      #9'pca.ds_chave = '#39'profissao'#39
      'GROUP BY'
      #9'pca.ds_categoria')
    Params = <>
    Left = 360
    Top = 224
    object qyCategoriasCD_ACAO: TSmallintField
      FieldName = 'CD_ACAO'
    end
  end
  object qyRetornaCodCampo: TUMZQuery
    Connection = DM.db
    SQL.Strings = (
      'SELECT '
      '  CD_CAMPO'
      'FROM '
      '  PESSOAS_CAMPOS_ADICIONAIS'
      'WHERE '
      '  DS_CHAVE = "profissao"')
    Params = <>
    Left = 776
    Top = 288
    object qyRetornaCodCampoCD_CAMPO: TIntegerField
      FieldName = 'CD_CAMPO'
    end
  end
  object qyProfissao: TUMZQuery
    Connection = DM.db
    SQL.Strings = (
      'SELECT'
      #9'*'
      'FROM'
      #9'pessoas_cadastro')
    Params = <>
    Left = 776
    Top = 216
  end
  object qyBuscaProfissaoContatos: TUMZQuery
    Connection = DM.db
    SQL.Strings = (
      'SELECT'
      #9'cc.ds_conteudo ds_conteudo,'
      #9'pcaa.cd_campo cd_campo_pessoa'
      'FROM'
      #9'contatos_cadastro cc'
      'INNER JOIN pessoas_campos_adicionais pcac ON ('
      #9'pcac.cd_campo = cc.cd_campo'
      #9'AND pcac.ds_pessoa = "C"'
      ')'
      'INNER JOIN pessoas_campos_adicionais pcaa ON ('
      #9'pcac.ds_chave = pcaa.ds_chave'
      #9'AND pcaa.ds_pessoa = "A"'
      ')'
      'WHERE'
      #9'pcac.ds_chave IS NOT NULL'
      'AND cc.cd_informacao = :cd_informacao')
    Params = <
      item
        DataType = ftUnknown
        Name = 'cd_informacao'
        ParamType = ptUnknown
      end>
    Left = 848
    Top = 376
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'cd_informacao'
        ParamType = ptUnknown
      end>
  end
  object qyDesvincularPessoa: TUMZQuery
    Connection = DM.db
    Params = <>
    Left = 848
    Top = 344
  end
end
