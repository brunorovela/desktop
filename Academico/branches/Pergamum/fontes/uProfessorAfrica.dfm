inherited fProfessoresAfrica: TfProfessoresAfrica
  Left = 130
  Top = 78
  Caption = 'Cadastro de Professores e Funcion'#225'rios'
  ClientHeight = 716
  ClientWidth = 974
  OldCreateOrder = True
  ExplicitWidth = 990
  ExplicitHeight = 754
  PixelsPerInch = 96
  TextHeight = 13
  inherited Panel3: TPanel
    Width = 974
    ExplicitWidth = 974
  end
  inherited toolPessoa: TToolBar
    Top = 691
    Width = 974
    ExplicitTop = 691
    ExplicitWidth = 974
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
    inherited btBuscar_Pessoa: TToolButton
      ExplicitWidth = 79
    end
    inherited btFechar_Pessoa: TToolButton
      ExplicitWidth = 85
    end
  end
  object toolExperiencia: TToolBar [3]
    Left = 0
    Top = 666
    Width = 974
    Height = 25
    Align = alBottom
    ButtonWidth = 84
    EdgeBorders = [ebTop, ebBottom]
    Images = ImageList1
    List = True
    ShowCaptions = True
    TabOrder = 3
    Visible = False
    object Experiencia: TToolButton
      Left = 0
      Top = 0
      Caption = 'Experi'#234'ncia'
    end
    object ToolButton3: TToolButton
      Left = 84
      Top = 0
      Width = 8
      Caption = 'ToolButton1'
      ImageIndex = 9
      Style = tbsSeparator
    end
    object btExp_Incluir: TToolButton
      Left = 92
      Top = 0
      Caption = 'F2 Incluir'
      ImageIndex = 0
      OnClick = btExp_IncluirClick
    end
    object btExp_Alterar: TToolButton
      Left = 176
      Top = 0
      Caption = 'F3 Alterar'
      ImageIndex = 1
      OnClick = btExp_AlterarClick
    end
    object btExp_Excluir: TToolButton
      Left = 260
      Top = 0
      Caption = 'F9 Excluir'
      ImageIndex = 2
      OnClick = btExp_ExcluirClick
    end
    object ToolButton10: TToolButton
      Left = 344
      Top = 0
      Width = 8
      Caption = 'ToolButton4'
      ImageIndex = 3
      Style = tbsSeparator
    end
    object btExp_Salvar: TToolButton
      Left = 352
      Top = 0
      Caption = 'F5 Salvar'
      ImageIndex = 3
      OnClick = btExp_SalvarClick
    end
    object btExp_Cancelar: TToolButton
      Left = 436
      Top = 0
      Caption = 'F6 Cancelar'
      ImageIndex = 4
      OnClick = btExp_CancelarClick
    end
    object ToolButton14: TToolButton
      Left = 520
      Top = 0
      Width = 8
      Caption = 'ToolButton8'
      ImageIndex = 6
      Style = tbsSeparator
    end
    object btExp_Fechar: TToolButton
      Left = 528
      Top = 0
      Caption = 'F12 Fechar'
      ImageIndex = 7
      OnClick = btExp_FecharClick
    end
    object ToolButton20: TToolButton
      Left = 612
      Top = 0
      Width = 8
      Caption = 'ToolButton2'
      ImageIndex = 8
      Style = tbsSeparator
    end
  end
  object toolDedicacao: TToolBar [4]
    Left = 0
    Top = 641
    Width = 974
    Height = 25
    Align = alBottom
    ButtonWidth = 84
    EdgeBorders = [ebTop, ebBottom]
    Images = ImageList1
    List = True
    ShowCaptions = True
    TabOrder = 4
    Visible = False
    OnClick = toolDedicacaoClick
    object Dedicacao: TToolButton
      Left = 0
      Top = 0
      Caption = 'Dedica'#231#227'o'
    end
    object ToolButton5: TToolButton
      Left = 84
      Top = 0
      Width = 9
      Caption = 'ToolButton1'
      ImageIndex = 9
      Style = tbsSeparator
    end
    object btDed_Incluir: TToolButton
      Left = 93
      Top = 0
      Caption = 'F2 Incluir'
      ImageIndex = 0
      OnClick = btDed_IncluirClick
    end
    object btDed_Alterar: TToolButton
      Left = 177
      Top = 0
      Caption = 'F3 Alterar'
      ImageIndex = 1
      OnClick = btDed_AlterarClick
    end
    object btDed_Excluir: TToolButton
      Left = 261
      Top = 0
      Caption = 'F9 Excluir'
      ImageIndex = 2
      OnClick = btDed_ExcluirClick
    end
    object ToolButton13: TToolButton
      Left = 345
      Top = 0
      Width = 8
      Caption = 'ToolButton4'
      ImageIndex = 3
      Style = tbsSeparator
    end
    object btDed_Salvar: TToolButton
      Left = 353
      Top = 0
      Caption = 'F5 Salvar'
      ImageIndex = 3
      OnClick = btDed_SalvarClick
    end
    object btDed_Cancelar: TToolButton
      Left = 437
      Top = 0
      Caption = 'F6 Cancelar'
      ImageIndex = 4
      OnClick = btDed_CancelarClick
    end
    object ToolButton19: TToolButton
      Left = 521
      Top = 0
      Width = 8
      Caption = 'ToolButton8'
      ImageIndex = 6
      Style = tbsSeparator
    end
    object btDed_Fechar: TToolButton
      Left = 529
      Top = 0
      Caption = 'F12 Fechar'
      ImageIndex = 7
      OnClick = btDed_FecharClick
    end
    object ToolButton26: TToolButton
      Left = 613
      Top = 0
      Width = 8
      Caption = 'ToolButton2'
      ImageIndex = 8
      Style = tbsSeparator
    end
  end
  object toolAdmissoes: TToolBar [5]
    Left = 0
    Top = 616
    Width = 974
    Height = 25
    Align = alBottom
    ButtonWidth = 84
    EdgeBorders = [ebTop, ebBottom]
    Images = ImageList1
    List = True
    ShowCaptions = True
    TabOrder = 5
    Visible = False
    object Admissoes: TToolButton
      Left = 0
      Top = 0
      Caption = 'Admiss'#245'es'
    end
    object ToolButton15: TToolButton
      Left = 84
      Top = 0
      Width = 9
      Caption = 'ToolButton1'
      ImageIndex = 9
      Style = tbsSeparator
    end
    object btCont_Incluir: TToolButton
      Left = 93
      Top = 0
      Caption = 'F2 Incluir'
      ImageIndex = 0
      OnClick = btCont_IncluirClick
    end
    object btCont_Alterar: TToolButton
      Left = 177
      Top = 0
      Caption = 'F3 Alterar'
      ImageIndex = 1
      OnClick = btCont_AlterarClick
    end
    object btCont_Excluir: TToolButton
      Left = 261
      Top = 0
      Caption = 'F9 Excluir'
      ImageIndex = 2
      OnClick = btCont_ExcluirClick
    end
    object ToolButton21: TToolButton
      Left = 345
      Top = 0
      Width = 8
      Caption = 'ToolButton4'
      ImageIndex = 3
      Style = tbsSeparator
    end
    object btCont_Salvar: TToolButton
      Left = 353
      Top = 0
      Caption = 'F5 Salvar'
      ImageIndex = 3
      OnClick = btCont_SalvarClick
    end
    object btCont_Cancelar: TToolButton
      Left = 437
      Top = 0
      Caption = 'F6 Cancelar'
      ImageIndex = 4
      OnClick = btCont_CancelarClick
    end
    object ToolButton24: TToolButton
      Left = 521
      Top = 0
      Width = 8
      Caption = 'ToolButton8'
      ImageIndex = 6
      Style = tbsSeparator
    end
    object btCont_Fechar: TToolButton
      Left = 529
      Top = 0
      Caption = 'F12 Fechar'
      ImageIndex = 7
      OnClick = btCont_FecharClick
    end
    object ToolButton27: TToolButton
      Left = 613
      Top = 0
      Width = 8
      Caption = 'ToolButton2'
      ImageIndex = 8
      Style = tbsSeparator
    end
  end
  object toolTitulos: TToolBar [6]
    Left = 0
    Top = 591
    Width = 974
    Height = 25
    Align = alBottom
    ButtonWidth = 84
    EdgeBorders = [ebTop, ebBottom]
    Images = ImageList1
    List = True
    ShowCaptions = True
    TabOrder = 6
    Visible = False
    object Titulos: TToolButton
      Left = 0
      Top = 0
      Caption = 'T'#237'tulos'
    end
    object ToolButton17: TToolButton
      Left = 84
      Top = 0
      Width = 9
      Caption = 'ToolButton1'
      ImageIndex = 9
      Style = tbsSeparator
    end
    object btTit_Incluir: TToolButton
      Left = 93
      Top = 0
      Caption = 'F2 Incluir'
      ImageIndex = 0
      OnClick = btTit_IncluirClick
    end
    object btTit_Alterar: TToolButton
      Left = 177
      Top = 0
      Caption = 'F3 Alterar'
      ImageIndex = 1
      OnClick = btTit_AlterarClick
    end
    object btTit_Excluir: TToolButton
      Left = 261
      Top = 0
      Caption = 'F9 Excluir'
      ImageIndex = 2
      OnClick = btTit_ExcluirClick
    end
    object ToolButton25: TToolButton
      Left = 345
      Top = 0
      Width = 8
      Caption = 'ToolButton4'
      ImageIndex = 3
      Style = tbsSeparator
    end
    object btTit_Salvar: TToolButton
      Left = 353
      Top = 0
      Caption = 'F5 Salvar'
      ImageIndex = 3
      OnClick = btTit_SalvarClick
    end
    object btTit_Cancelar: TToolButton
      Left = 437
      Top = 0
      Caption = 'F6 Cancelar'
      ImageIndex = 4
      OnClick = btTit_CancelarClick
    end
    object ToolButton30: TToolButton
      Left = 521
      Top = 0
      Width = 8
      Caption = 'ToolButton8'
      ImageIndex = 6
      Style = tbsSeparator
    end
    object btTit_Fechar: TToolButton
      Left = 529
      Top = 0
      Caption = 'F12 Fechar'
      ImageIndex = 7
      OnClick = btTit_FecharClick
    end
    object ToolButton32: TToolButton
      Left = 613
      Top = 0
      Width = 8
      Caption = 'ToolButton2'
      ImageIndex = 8
      Style = tbsSeparator
    end
  end
  object toolAtividades: TToolBar [7]
    Left = 0
    Top = 566
    Width = 974
    Height = 25
    Align = alBottom
    ButtonWidth = 84
    EdgeBorders = [ebTop, ebBottom]
    Images = ImageList1
    List = True
    ShowCaptions = True
    TabOrder = 7
    Visible = False
    object Atividades: TToolButton
      Left = 0
      Top = 0
      Caption = 'Atividades'
    end
    object ToolButton22: TToolButton
      Left = 84
      Top = 0
      Width = 9
      Caption = 'ToolButton1'
      ImageIndex = 9
      Style = tbsSeparator
    end
    object btAtiv_Incluir: TToolButton
      Left = 93
      Top = 0
      Caption = 'F2 Incluir'
      ImageIndex = 0
      OnClick = btAtiv_IncluirClick
    end
    object btAtiv_Alterar: TToolButton
      Left = 177
      Top = 0
      Caption = 'F3 Alterar'
      ImageIndex = 1
      OnClick = btAtiv_AlterarClick
    end
    object btAtiv_Excluir: TToolButton
      Left = 261
      Top = 0
      Caption = 'F9 Excluir'
      ImageIndex = 2
      OnClick = btAtiv_ExcluirClick
    end
    object ToolButton31: TToolButton
      Left = 345
      Top = 0
      Width = 8
      Caption = 'ToolButton4'
      ImageIndex = 3
      Style = tbsSeparator
    end
    object btAtiv_Salvar: TToolButton
      Left = 353
      Top = 0
      Caption = 'F5 Salvar'
      ImageIndex = 3
      OnClick = btAtiv_SalvarClick
    end
    object btAtiv_Cancelar: TToolButton
      Left = 437
      Top = 0
      Caption = 'F6 Cancelar'
      ImageIndex = 4
      OnClick = btAtiv_CancelarClick
    end
    object ToolButton35: TToolButton
      Left = 521
      Top = 0
      Width = 8
      Caption = 'ToolButton8'
      ImageIndex = 6
      Style = tbsSeparator
    end
    object btAtiv_Fechar: TToolButton
      Left = 529
      Top = 0
      Caption = 'F12 Fechar'
      ImageIndex = 7
      OnClick = btAtiv_FecharClick
    end
    object ToolButton37: TToolButton
      Left = 613
      Top = 0
      Width = 8
      Caption = 'ToolButton2'
      ImageIndex = 8
      Style = tbsSeparator
    end
  end
  inherited pgPessoa: TPageControl
    Width = 974
    Height = 516
    ActivePage = tsDadosPessoais
    ExplicitWidth = 974
    ExplicitHeight = 516
    inherited tsDadosPessoais: TTabSheet
      ExplicitLeft = 4
      ExplicitTop = 27
      ExplicitWidth = 966
      ExplicitHeight = 485
      inherited pcDocumentos: TPageControl
        inherited TabSheet2: TTabSheet
          ExplicitLeft = 4
          ExplicitTop = 27
          ExplicitWidth = 753
          ExplicitHeight = 37
        end
      end
    end
    inherited tsComplementares: TTabSheet
      OnExit = tsComplementaresExit
      OnShow = tsComplementaresShow
      ExplicitLeft = 4
      ExplicitTop = 27
      ExplicitWidth = 966
      ExplicitHeight = 485
      inherited dbObs: TDBMemo
        Top = 381
        Width = 966
        Height = 11
        ExplicitTop = 381
        ExplicitWidth = 966
        ExplicitHeight = 11
      end
      inherited Panel2: TPanel
        Width = 966
        ExplicitWidth = 966
        object Label60: TLabel [3]
          Left = 7
          Top = 104
          Width = 35
          Height = 13
          Caption = 'Apelido'
          FocusControl = DBEdit5
        end
        object Label61: TLabel [4]
          Left = 3
          Top = 48
          Width = 44
          Height = 13
          Caption = 'Titula'#231#227'o'
        end
        object Label62: TLabel [5]
          Left = 410
          Top = 48
          Width = 108
          Height = 13
          Caption = #193'rea do Conhecimento'
          FocusControl = DBLookupComboBox5
        end
        inherited Label74: TLabel
          Left = 412
          Top = 104
          ExplicitLeft = 412
          ExplicitTop = 104
        end
        inherited Bevel2: TBevel
          Top = 91
          ExplicitTop = 91
        end
        inherited Label33: TLabel
          Top = 148
          ExplicitTop = 148
        end
        inherited Label108: TLabel
          Top = 148
          ExplicitTop = 148
        end
        inherited Label109: TLabel
          Top = 148
          ExplicitTop = 148
        end
        object DBEdit5: TDBEdit [13]
          Left = 6
          Top = 120
          Width = 395
          Height = 21
          CharCase = ecUpperCase
          DataField = 'nm_apelido'
          DataSource = dsProfessor
          TabOrder = 12
        end
        inherited DBEdit13: TDBEdit
          Left = 411
          Top = 120
          Width = 358
          ExplicitLeft = 411
          ExplicitTop = 120
          ExplicitWidth = 358
        end
        inherited DBCheckBox1: TDBCheckBox
          Left = 88
          Top = 48
          Visible = False
          ExplicitLeft = 88
          ExplicitTop = 48
        end
        inherited edLogin: TEdit
          Top = 164
          TabOrder = 10
          ExplicitTop = 164
        end
        inherited edSenha1: TEdit
          Top = 164
          TabOrder = 11
          ExplicitTop = 164
        end
        inherited edSenha2: TEdit
          Top = 164
          ExplicitTop = 164
        end
        inherited btnNecessidaEspecial: TButton
          Left = 485
          ExplicitLeft = 485
        end
        object DBLookupComboBox5: TDBLookupComboBox
          Left = 410
          Top = 64
          Width = 359
          Height = 21
          DataField = 'descArea'
          DataSource = dsProfessor
          TabOrder = 4
        end
        object DBLookupComboBox6: TDBLookupComboBox
          Left = 2
          Top = 64
          Width = 399
          Height = 21
          DataField = 'descTitulacao'
          DataSource = dsProfessor
          TabOrder = 5
        end
      end
      inherited Panel4: TPanel
        Top = 357
        Width = 966
        BevelOuter = bvLowered
        TabOrder = 4
        ExplicitTop = 357
        ExplicitWidth = 966
      end
      inherited gradeVinculosExterno: TDBGrid
        Top = 416
        Width = 966
        TabOrder = 5
      end
      inherited lbVinculoExterno: TPanel
        Top = 392
        Width = 966
        TabOrder = 3
        ExplicitTop = 392
        ExplicitWidth = 966
        inherited BitBtn1: TBitBtn
          Left = 896
          ExplicitLeft = 896
        end
        inherited BitBtn2: TBitBtn
          Left = 919
          ExplicitLeft = 919
        end
        inherited BitBtn3: TBitBtn
          Left = 942
          ExplicitLeft = 942
        end
      end
      object Panel14: TPanel
        Left = 0
        Top = 201
        Width = 966
        Height = 156
        Align = alTop
        BevelOuter = bvNone
        TabOrder = 2
        object sbUnCheckProfessor: TSpeedButton
          Left = 216
          Top = 128
          Width = 23
          Height = 22
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
          OnClick = sbUnCheckProfessorClick
        end
        object sbCheckProfessor: TSpeedButton
          Left = 187
          Top = 128
          Width = 23
          Height = 22
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
          OnClick = sbCheckProfessorClick
        end
        object sbUnCheckOrientador: TSpeedButton
          Left = 125
          Top = 128
          Width = 23
          Height = 22
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
          OnClick = sbUnCheckOrientadorClick
        end
        object sbCheckOrientador: TSpeedButton
          Left = 96
          Top = 129
          Width = 23
          Height = 22
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
          OnClick = sbCheckOrientadorClick
        end
        object sbCheckFuncionario: TSpeedButton
          Left = 13
          Top = 128
          Width = 23
          Height = 22
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
          OnClick = sbCheckFuncionarioClick
        end
        object sbUnCheckFuncionario: TSpeedButton
          Left = 42
          Top = 128
          Width = 23
          Height = 22
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
          OnClick = sbUnCheckFuncionarioClick
        end
        object dbgUnidadesCargos: TDBGrid
          Left = 0
          Top = 0
          Width = 966
          Height = 122
          Align = alTop
          DataSource = dsProfessorUnidades
          Options = [dgTitles, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgConfirmDelete, dgCancelOnExit]
          ReadOnly = True
          TabOrder = 0
          TitleFont.Charset = DEFAULT_CHARSET
          TitleFont.Color = clWindowText
          TitleFont.Height = -11
          TitleFont.Name = 'MS Sans Serif'
          TitleFont.Style = []
          OnCellClick = dbgUnidadesCargosCellClick
          OnDrawColumnCell = dbgUnidadesCargosDrawColumnCell
          Columns = <
            item
              Expanded = False
              FieldName = 'sn_funcionario'
              Title.Caption = 'Funcion'#225'rio'
              Width = 83
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'sn_orientador'
              Title.Caption = 'Orientador'
              Width = 83
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'sn_professor'
              Title.Caption = 'Professor'
              Width = 94
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'nm_coligada'
              Title.Caption = 'Unidade de ensino'
              Visible = True
            end>
        end
      end
    end
    inherited tsParentes: TTabSheet
      ExplicitWidth = 966
      ExplicitHeight = 485
      inherited frParentes1: TfrParentes
        Width = 966
        Height = 485
        ExplicitWidth = 966
        ExplicitHeight = 485
        inherited Bevel1: TBevel
          Height = 389
          ExplicitHeight = 145
        end
        inherited Bevel2: TBevel
          Left = 948
          Height = 389
          ExplicitLeft = 861
          ExplicitHeight = 145
        end
        inherited Bevel3: TBevel
          Top = 471
          Width = 966
          ExplicitTop = 227
          ExplicitWidth = 879
        end
        inherited Bevel4: TBevel
          Top = 478
          Width = 966
          ExplicitTop = 234
          ExplicitWidth = 879
        end
        inherited DBGrid1: TDBGrid
          Width = 930
          Height = 389
        end
        inherited Panel1: TPanel
          Width = 966
          ExplicitWidth = 966
        end
        inherited toolPessoa: TToolBar
          Top = 446
          Width = 966
          ExplicitTop = 446
          ExplicitWidth = 966
          inherited DBNavigator1: TDBNavigator
            Hints.Strings = ()
          end
        end
      end
    end
    object TabSheet6: TTabSheet
      Caption = 'EXPERI'#202'NCIA'
      ImageIndex = 2
      ExplicitLeft = 0
      ExplicitTop = 0
      ExplicitWidth = 0
      ExplicitHeight = 0
      object Panel5: TPanel
        Left = 0
        Top = 337
        Width = 966
        Height = 148
        Align = alBottom
        BevelOuter = bvLowered
        TabOrder = 0
        object Label27: TLabel
          Left = 8
          Top = 8
          Width = 40
          Height = 13
          Caption = 'Atua'#231#227'o'
          FocusControl = dbAtuacao
        end
        object Label30: TLabel
          Left = 288
          Top = 8
          Width = 60
          Height = 13
          Caption = 'Tempo Anos'
          FocusControl = dbTempoAnos
        end
        object Label31: TLabel
          Left = 376
          Top = 8
          Width = 67
          Height = 13
          Caption = 'Tempo Meses'
          FocusControl = dbTempoMeses
        end
        object Label34: TLabel
          Left = 8
          Top = 56
          Width = 98
          Height = 13
          Caption = 'Institui'#231#227'o de Ensino'
          FocusControl = dbInstituicao
        end
        object Label43: TLabel
          Left = 379
          Top = 56
          Width = 87
          Height = 13
          Caption = 'Nome da Empresa'
          FocusControl = dbEmpresa
        end
        object Label44: TLabel
          Left = 8
          Top = 101
          Width = 33
          Height = 13
          Caption = 'Cidade'
          FocusControl = dbLocal
        end
        object Label45: TLabel
          Left = 200
          Top = 101
          Width = 33
          Height = 13
          Caption = 'Estado'
          FocusControl = dbEstado
        end
        object Label46: TLabel
          Left = 464
          Top = 8
          Width = 91
          Height = 13
          Caption = 'Fun'#231#227'o/Ocupa'#231#227'o'
          FocusControl = dbFuncao
        end
        object Label47: TLabel
          Left = 416
          Top = 101
          Width = 108
          Height = 13
          Caption = #193'rea do Conhecimento'
          FocusControl = dbAreaConhecimento
        end
        object SpeedButton3: TSpeedButton
          Left = 696
          Top = 24
          Width = 23
          Height = 22
          Flat = True
        end
        object dbAtuacao: TDBLookupComboBox
          Left = 8
          Top = 24
          Width = 249
          Height = 21
          DataField = 'descTipoAtuacao'
          DataSource = dsExperiencia
          TabOrder = 0
          OnKeyPress = dbNomeKeyPress
        end
        object dbTempoAnos: TDBEdit
          Left = 288
          Top = 24
          Width = 80
          Height = 21
          CharCase = ecUpperCase
          DataField = 'vl_tempo_anos'
          DataSource = dsExperiencia
          TabOrder = 1
          OnKeyPress = dbNomeKeyPress
        end
        object dbTempoMeses: TDBEdit
          Left = 376
          Top = 24
          Width = 80
          Height = 21
          CharCase = ecUpperCase
          DataField = 'vl_tempo_meses'
          DataSource = dsExperiencia
          TabOrder = 2
          OnKeyPress = dbNomeKeyPress
        end
        object dbInstituicao: TDBLookupComboBox
          Left = 8
          Top = 72
          Width = 364
          Height = 21
          DataField = 'descInstituicoes'
          DataSource = dsExperiencia
          TabOrder = 4
          OnKeyPress = dbNomeKeyPress
        end
        object dbEmpresa: TDBLookupComboBox
          Left = 378
          Top = 72
          Width = 341
          Height = 21
          DataField = 'descEmpresa'
          DataSource = dsExperiencia
          TabOrder = 5
          OnKeyPress = dbNomeKeyPress
        end
        object dbLocal: TDBEdit
          Left = 8
          Top = 117
          Width = 185
          Height = 21
          CharCase = ecUpperCase
          DataField = 'ds_local'
          DataSource = dsExperiencia
          TabOrder = 6
          OnKeyPress = dbNomeKeyPress
        end
        object dbEstado: TDBLookupComboBox
          Left = 200
          Top = 117
          Width = 210
          Height = 21
          DataField = 'descEstado'
          DataSource = dsExperiencia
          TabOrder = 7
          OnKeyPress = dbNomeKeyPress
        end
        object dbFuncao: TDBLookupComboBox
          Left = 464
          Top = 24
          Width = 233
          Height = 21
          DataField = 'descFuncoes'
          DataSource = dsExperiencia
          TabOrder = 3
          OnKeyPress = dbNomeKeyPress
        end
        object dbAreaConhecimento: TDBLookupComboBox
          Left = 416
          Top = 117
          Width = 303
          Height = 21
          DataField = 'descAreas'
          DataSource = dsExperiencia
          TabOrder = 8
          OnKeyPress = dbNomeKeyPress
        end
      end
      object DBGrid1: TDBGrid
        Left = 0
        Top = 22
        Width = 966
        Height = 315
        Align = alClient
        BorderStyle = bsNone
        DataSource = dsExperiencia
        Options = [dgTitles, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgAlwaysShowSelection, dgConfirmDelete, dgCancelOnExit]
        PopupMenu = pmQtdExperiencia
        TabOrder = 1
        TitleFont.Charset = DEFAULT_CHARSET
        TitleFont.Color = clWindowText
        TitleFont.Height = -11
        TitleFont.Name = 'MS Sans Serif'
        TitleFont.Style = []
        Columns = <
          item
            Expanded = False
            FieldName = 'descTipoAtuacao'
            Width = 200
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'vl_tempo_anos'
            Title.Caption = 'Anos'
            Width = 45
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'vl_tempo_meses'
            Title.Caption = 'Meses'
            Width = 45
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'ds_local'
            Width = 140
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'ds_estado'
            Width = 40
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'descFuncoes'
            Title.Caption = 'Fun'#231#227'o/Ocupa'#231#227'o'
            Width = 150
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'descAreas'
            Width = 140
            Visible = True
          end>
      end
      object Panel7: TPanel
        Left = 0
        Top = 0
        Width = 966
        Height = 22
        Align = alTop
        BevelOuter = bvLowered
        Caption = 'EXPERI'#202'NCIA PROFISSIONAL'
        Color = clBlue
        Font.Charset = ANSI_CHARSET
        Font.Color = clWhite
        Font.Height = -13
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
        TabOrder = 2
      end
    end
    object TabSheet7: TTabSheet
      Caption = 'DEDICA'#199#195'O'
      ImageIndex = 3
      ExplicitLeft = 0
      ExplicitTop = 0
      ExplicitWidth = 0
      ExplicitHeight = 0
      object DBGrid2: TDBGrid
        Left = 0
        Top = 22
        Width = 966
        Height = 354
        Align = alClient
        BorderStyle = bsNone
        DataSource = dsDedicacao
        Options = [dgTitles, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgAlwaysShowSelection, dgConfirmDelete, dgCancelOnExit]
        PopupMenu = pmQtdDedicacao
        TabOrder = 0
        TitleFont.Charset = DEFAULT_CHARSET
        TitleFont.Color = clWindowText
        TitleFont.Height = -11
        TitleFont.Name = 'MS Sans Serif'
        TitleFont.Style = []
        Columns = <
          item
            Expanded = False
            FieldName = 'descAtuacao'
            Width = 230
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'descCurso'
            Width = 260
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'ds_atividade'
            Width = 150
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'vl_horas'
            Title.Caption = 'Hr. Sem.'
            Width = 50
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'vl_anosemestre'
            Title.Caption = 'Ano/Sem.'
            Width = 55
            Visible = True
          end>
      end
      object Panel6: TPanel
        Left = 0
        Top = 376
        Width = 966
        Height = 109
        Align = alBottom
        BevelOuter = bvLowered
        TabOrder = 1
        object Label48: TLabel
          Left = 8
          Top = 8
          Width = 40
          Height = 13
          Caption = 'Atua'#231#227'o'
          FocusControl = dbAtuacaoDedicacao
        end
        object Label49: TLabel
          Left = 424
          Top = 8
          Width = 93
          Height = 13
          Caption = 'Descri'#231#227'o do Curso'
          FocusControl = dbDescCurso
        end
        object Label50: TLabel
          Left = 288
          Top = 8
          Width = 52
          Height = 13
          Caption = 'Cod. Curso'
          FocusControl = dbCurso
        end
        object Label51: TLabel
          Left = 8
          Top = 56
          Width = 110
          Height = 13
          Caption = 'Descri'#231#227'o da Atividade'
          FocusControl = dbDescAtividade
        end
        object Label52: TLabel
          Left = 520
          Top = 56
          Width = 77
          Height = 13
          Caption = 'Horas Semanais'
          FocusControl = dbHorasSemanais
        end
        object Label53: TLabel
          Left = 624
          Top = 56
          Width = 68
          Height = 13
          Caption = 'Ano/Semestre'
          FocusControl = dbAnoSemestre
        end
        object dbAtuacaoDedicacao: TDBLookupComboBox
          Left = 8
          Top = 24
          Width = 273
          Height = 21
          DataField = 'descAtuacao'
          DataSource = dsDedicacao
          TabOrder = 0
        end
        object dbDescCurso: TDBLookupComboBox
          Left = 424
          Top = 24
          Width = 289
          Height = 21
          DataField = 'descCurso'
          DataSource = dsDedicacao
          TabOrder = 2
        end
        object dbCurso: TDBEdit
          Left = 288
          Top = 24
          Width = 129
          Height = 21
          CharCase = ecUpperCase
          DataField = 'cd_curso'
          DataSource = dsDedicacao
          TabOrder = 1
        end
        object dbDescAtividade: TDBEdit
          Left = 8
          Top = 72
          Width = 505
          Height = 21
          CharCase = ecUpperCase
          DataField = 'ds_atividade'
          DataSource = dsDedicacao
          TabOrder = 3
        end
        object dbHorasSemanais: TDBEdit
          Left = 520
          Top = 72
          Width = 97
          Height = 21
          CharCase = ecUpperCase
          DataField = 'vl_horas'
          DataSource = dsDedicacao
          TabOrder = 4
        end
        object dbAnoSemestre: TDBEdit
          Left = 624
          Top = 72
          Width = 89
          Height = 21
          CharCase = ecUpperCase
          DataField = 'vl_anosemestre'
          DataSource = dsDedicacao
          TabOrder = 5
        end
      end
      object Panel8: TPanel
        Left = 0
        Top = 0
        Width = 966
        Height = 22
        Align = alTop
        BevelOuter = bvLowered
        Caption = 'DEDICA'#199#195'O AO CURSO OU INSTITUI'#199#195'O'
        Color = clBlue
        Font.Charset = ANSI_CHARSET
        Font.Color = clWhite
        Font.Height = -13
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
        TabOrder = 2
      end
    end
    object TabSheet9: TTabSheet
      Caption = 'CONTRATA'#199#195'O'
      ImageIndex = 5
      ExplicitLeft = 0
      ExplicitTop = 0
      ExplicitWidth = 0
      ExplicitHeight = 0
      object Panel9: TPanel
        Left = 0
        Top = 0
        Width = 966
        Height = 22
        Align = alTop
        BevelOuter = bvLowered
        Caption = 'CONTRATA'#199#213'ES NA INSTITUI'#199#195'O E REGIME DE TRABALHO'
        Color = clBlue
        Font.Charset = ANSI_CHARSET
        Font.Color = clWhite
        Font.Height = -13
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
        TabOrder = 0
      end
      object DBGrid3: TDBGrid
        Left = 0
        Top = 22
        Width = 966
        Height = 354
        Align = alClient
        BorderStyle = bsNone
        DataSource = dsAdmissoes
        Options = [dgTitles, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgAlwaysShowSelection, dgConfirmDelete, dgCancelOnExit]
        PopupMenu = pmQtdAdmissoes
        TabOrder = 1
        TitleFont.Charset = DEFAULT_CHARSET
        TitleFont.Color = clWindowText
        TitleFont.Height = -11
        TitleFont.Name = 'MS Sans Serif'
        TitleFont.Style = []
        Columns = <
          item
            Expanded = False
            FieldName = 'descRegime'
            Width = 180
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'dt_admissao'
            Width = 76
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'dt_saida'
            Width = 76
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'descFuncao'
            Title.Caption = 'Fun'#231#227'o/Ocupa'#231#227'o'
            Width = 160
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'ds_funcao'
            Width = 200
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'vl_horas_semanais'
            Title.Caption = 'Hr. Sem.'
            Width = 50
            Visible = True
          end>
      end
      object Panel11: TPanel
        Left = 0
        Top = 376
        Width = 966
        Height = 109
        Align = alBottom
        BevelOuter = bvLowered
        TabOrder = 2
        object Label54: TLabel
          Left = 8
          Top = 8
          Width = 96
          Height = 13
          Caption = 'Regime de Trabalho'
          FocusControl = dbRegime
        end
        object Label55: TLabel
          Left = 344
          Top = 8
          Width = 77
          Height = 13
          Caption = 'Horas Semanais'
          FocusControl = dbHoras
        end
        object Label56: TLabel
          Left = 456
          Top = 8
          Width = 71
          Height = 13
          Caption = 'Data Admiss'#227'o'
          FocusControl = dbAdmi
        end
        object Label57: TLabel
          Left = 552
          Top = 8
          Width = 55
          Height = 13
          Caption = 'Data Sa'#237'da'
          FocusControl = dbSaida
        end
        object Label58: TLabel
          Left = 8
          Top = 56
          Width = 91
          Height = 13
          Caption = 'Fun'#231#227'o/Ocupa'#231#227'o'
          FocusControl = dbFuncaoAdmi
        end
        object Label59: TLabel
          Left = 344
          Top = 56
          Width = 112
          Height = 13
          Caption = 'Observa'#231#227'o da Fun'#231#227'o'
          FocusControl = dbObsFuncao
        end
        object dbRegime: TDBLookupComboBox
          Left = 8
          Top = 24
          Width = 329
          Height = 21
          DataField = 'descRegime'
          DataSource = dsAdmissoes
          TabOrder = 0
        end
        object dbHoras: TDBEdit
          Left = 344
          Top = 24
          Width = 105
          Height = 21
          CharCase = ecUpperCase
          DataField = 'vl_horas_semanais'
          DataSource = dsAdmissoes
          TabOrder = 1
        end
        object dbAdmi: TDBEdit
          Left = 456
          Top = 24
          Width = 89
          Height = 21
          CharCase = ecUpperCase
          DataField = 'dt_admissao'
          DataSource = dsAdmissoes
          MaxLength = 10
          TabOrder = 2
        end
        object dbSaida: TDBEdit
          Left = 552
          Top = 24
          Width = 89
          Height = 21
          CharCase = ecUpperCase
          DataField = 'dt_saida'
          DataSource = dsAdmissoes
          MaxLength = 10
          TabOrder = 3
        end
        object dbFuncaoAdmi: TDBLookupComboBox
          Left = 8
          Top = 72
          Width = 329
          Height = 21
          DataField = 'descFuncao'
          DataSource = dsAdmissoes
          TabOrder = 4
        end
        object dbObsFuncao: TDBEdit
          Left = 344
          Top = 72
          Width = 297
          Height = 21
          CharCase = ecUpperCase
          DataField = 'ds_funcao'
          DataSource = dsAdmissoes
          TabOrder = 5
        end
      end
    end
    object TabSheet8: TTabSheet
      Caption = 'FORMA'#199#195'O ACAD'#202'MICA'
      ImageIndex = 4
      object pgFormacao: TPageControl
        Left = 0
        Top = 22
        Width = 966
        Height = 463
        ActivePage = TabSheet10
        Align = alClient
        MultiLine = True
        TabOrder = 0
        TabPosition = tpBottom
        TabWidth = 120
        OnChange = pgFormacaoChange
        object TabSheet10: TTabSheet
          Caption = 'T'#237'tulos Acad'#234'micos'
          ExplicitLeft = 0
          ExplicitTop = 0
          ExplicitWidth = 0
          ExplicitHeight = 0
          object DBGrid4: TDBGrid
            Left = 0
            Top = 0
            Width = 958
            Height = 300
            Align = alClient
            BorderStyle = bsNone
            DataSource = dsProfTitulos
            Options = [dgTitles, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgAlwaysShowSelection, dgConfirmDelete, dgCancelOnExit]
            PopupMenu = pmQtdProfTitulos
            TabOrder = 0
            TitleFont.Charset = DEFAULT_CHARSET
            TitleFont.Color = clWindowText
            TitleFont.Height = -11
            TitleFont.Name = 'MS Sans Serif'
            TitleFont.Style = []
            Columns = <
              item
                Expanded = False
                FieldName = 'descTitulacao'
                Title.Caption = 'Titula'#231#227'o'
                Width = 160
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'ds_curso'
                Title.Caption = 'Curso'
                Width = 260
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'vl_ano'
                Title.Caption = 'Ano'
                Width = 80
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'descArea'
                Title.Caption = 'Area'
                Width = 170
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'vl_horas'
                Title.Caption = 'Horas'
                Visible = True
              end>
          end
          object Panel12: TPanel
            Left = 0
            Top = 300
            Width = 958
            Height = 137
            Align = alBottom
            BevelOuter = bvLowered
            TabOrder = 1
            object Label63: TLabel
              Left = 8
              Top = 8
              Width = 44
              Height = 13
              Caption = 'Titula'#231#227'o'
              FocusControl = dbTitulacao
            end
            object Label64: TLabel
              Left = 198
              Top = 8
              Width = 108
              Height = 13
              Caption = #193'rea do Conhecimento'
              FocusControl = DBLookupComboBox7
            end
            object Label65: TLabel
              Left = 516
              Top = 88
              Width = 72
              Height = 13
              Caption = 'Ano Conclus'#227'o'
              FocusControl = DBEdit6
            end
            object Label66: TLabel
              Left = 412
              Top = 48
              Width = 48
              Height = 13
              Caption = 'Institui'#231#227'o'
              FocusControl = DBLookupComboBox8
            end
            object Label67: TLabel
              Left = 8
              Top = 48
              Width = 53
              Height = 13
              Caption = 'Habilita'#231#227'o'
              FocusControl = DBEdit7
            end
            object Label68: TLabel
              Left = 320
              Top = 48
              Width = 80
              Height = 13
              Caption = 'Conceito CAPES'
              FocusControl = DBEdit8
            end
            object Label69: TLabel
              Left = 320
              Top = 88
              Width = 33
              Height = 13
              Caption = 'Cidade'
              FocusControl = DBEdit9
            end
            object Label70: TLabel
              Left = 608
              Top = 88
              Width = 33
              Height = 13
              Caption = 'Estado'
              FocusControl = DBLookupComboBox9
            end
            object Label71: TLabel
              Left = 680
              Top = 48
              Width = 65
              Height = 13
              Caption = 'Carga Hor'#225'ria'
              FocusControl = DBEdit10
            end
            object Label72: TLabel
              Left = 8
              Top = 88
              Width = 201
              Height = 13
              Caption = 'T'#237'tulo do Trabalho de Conclus'#227'o de Curso'
              FocusControl = DBEdit11
            end
            object Label73: TLabel
              Left = 421
              Top = 8
              Width = 27
              Height = 13
              Caption = 'Curso'
              FocusControl = DBEdit12
            end
            object dbTitulacao: TDBLookupComboBox
              Left = 8
              Top = 24
              Width = 185
              Height = 21
              DataField = 'descTitulacao'
              DataSource = dsProfTitulos
              TabOrder = 0
            end
            object DBLookupComboBox7: TDBLookupComboBox
              Left = 198
              Top = 24
              Width = 217
              Height = 21
              DataField = 'descArea'
              DataSource = dsProfTitulos
              TabOrder = 1
            end
            object DBEdit6: TDBEdit
              Left = 516
              Top = 104
              Width = 85
              Height = 21
              DataField = 'vl_ano'
              DataSource = dsProfTitulos
              TabOrder = 8
            end
            object DBLookupComboBox8: TDBLookupComboBox
              Left = 412
              Top = 64
              Width = 262
              Height = 21
              DataField = 'descInstituicao'
              DataSource = dsProfTitulos
              TabOrder = 5
            end
            object DBEdit7: TDBEdit
              Left = 8
              Top = 64
              Width = 304
              Height = 21
              DataField = 'ds_habilitacao'
              DataSource = dsProfTitulos
              TabOrder = 3
            end
            object DBEdit8: TDBEdit
              Left = 320
              Top = 64
              Width = 85
              Height = 21
              DataField = 'ds_conceito'
              DataSource = dsProfTitulos
              TabOrder = 4
            end
            object DBEdit9: TDBEdit
              Left = 320
              Top = 104
              Width = 187
              Height = 21
              DataField = 'ds_local'
              DataSource = dsProfTitulos
              TabOrder = 7
            end
            object DBLookupComboBox9: TDBLookupComboBox
              Left = 608
              Top = 104
              Width = 145
              Height = 21
              DataField = 'descEstado'
              DataSource = dsProfTitulos
              TabOrder = 9
            end
            object DBEdit10: TDBEdit
              Left = 680
              Top = 64
              Width = 73
              Height = 21
              DataField = 'vl_horas'
              DataSource = dsProfTitulos
              TabOrder = 10
            end
            object DBEdit11: TDBEdit
              Left = 8
              Top = 104
              Width = 304
              Height = 21
              DataField = 'ds_titulo_trabalho'
              DataSource = dsProfTitulos
              TabOrder = 6
            end
            object DBEdit12: TDBEdit
              Left = 421
              Top = 24
              Width = 332
              Height = 21
              DataField = 'ds_Curso'
              DataSource = dsProfTitulos
              TabOrder = 2
            end
          end
        end
        object TabSheet11: TTabSheet
          Caption = 'Atividades'
          ImageIndex = 1
          object Panel13: TPanel
            Left = 0
            Top = 300
            Width = 958
            Height = 137
            Align = alBottom
            BevelOuter = bvLowered
            TabOrder = 0
            inline Frame_Prof_Ativ_031: Tfrm_Professores_Ativ_03
              Left = 1
              Top = 1
              Width = 956
              Height = 135
              Align = alClient
              TabOrder = 1
              TabStop = True
              ExplicitLeft = 1
              ExplicitTop = 1
              ExplicitWidth = 956
              ExplicitHeight = 135
              inherited Label1: TLabel
                Width = 44
                ExplicitWidth = 44
              end
              inherited Label2: TLabel
                Width = 110
                ExplicitWidth = 110
              end
              inherited Label4: TLabel
                Width = 48
                ExplicitWidth = 48
              end
              inherited Label7: TLabel
                Width = 49
                ExplicitWidth = 49
              end
              inherited Label3: TLabel
                Width = 80
                ExplicitWidth = 80
              end
              inherited dbAtividade: TDBLookupComboBox
                DataSource = dsProfAtividades
              end
              inherited DBEdit1: TDBEdit
                DataSource = dsProfAtividades
              end
              inherited DBLookupComboBox4: TDBLookupComboBox
                DataSource = dsProfAtividades
              end
              inherited DBEdit2: TDBEdit
                DataSource = dsProfAtividades
              end
              inherited DBLookupComboBox3: TDBLookupComboBox
                DataSource = dsProfAtividades
              end
              inherited DBEdit3: TDBEdit
                DataSource = dsProfAtividades
              end
              inherited DBEdit4: TDBEdit
                DataSource = dsProfAtividades
              end
              inherited DBLookupComboBox1: TDBLookupComboBox
                DataSource = dsProfAtividades
              end
            end
            inline Frame_Prof_Ativ_041: Tfrm_Professores_Ativ_04
              Left = 1
              Top = 1
              Width = 956
              Height = 135
              Align = alClient
              TabOrder = 2
              TabStop = True
              ExplicitLeft = 1
              ExplicitTop = 1
              ExplicitWidth = 956
              ExplicitHeight = 135
              inherited Label1: TLabel
                Width = 44
                ExplicitWidth = 44
              end
              inherited Label2: TLabel
                Width = 110
                ExplicitWidth = 110
              end
              inherited Label4: TLabel
                Width = 48
                ExplicitWidth = 48
              end
              inherited Label7: TLabel
                Width = 49
                ExplicitWidth = 49
              end
              inherited Label3: TLabel
                Width = 122
                ExplicitWidth = 122
              end
              inherited Label9: TLabel
                Width = 80
                ExplicitWidth = 80
              end
              inherited dbAtividade: TDBLookupComboBox
                DataSource = dsProfAtividades
              end
              inherited DBEdit1: TDBEdit
                DataSource = dsProfAtividades
              end
              inherited DBLookupComboBox3: TDBLookupComboBox
                DataSource = dsProfAtividades
              end
              inherited DBEdit2: TDBEdit
                DataSource = dsProfAtividades
              end
              inherited DBLookupComboBox4: TDBLookupComboBox
                DataSource = dsProfAtividades
              end
              inherited DBEdit3: TDBEdit
                DataSource = dsProfAtividades
              end
              inherited DBEdit4: TDBEdit
                DataSource = dsProfAtividades
              end
              inherited DBLookupComboBox1: TDBLookupComboBox
                DataSource = dsProfAtividades
              end
              inherited DBEdit5: TDBEdit
                DataSource = dsProfAtividades
              end
            end
            inline Frame_Prof_Ativ_051: Tfrm_Professores_Ativ_05
              Left = 1
              Top = 1
              Width = 956
              Height = 135
              Align = alClient
              TabOrder = 3
              TabStop = True
              ExplicitLeft = 1
              ExplicitTop = 1
              ExplicitWidth = 956
              ExplicitHeight = 135
              inherited Label2: TLabel
                Width = 27
                ExplicitWidth = 27
              end
              inherited Label1: TLabel
                Width = 44
                ExplicitWidth = 44
              end
              inherited Label4: TLabel
                Width = 48
                ExplicitWidth = 48
              end
              inherited Label7: TLabel
                Width = 49
                ExplicitWidth = 49
              end
              inherited DBEdit1: TDBEdit
                DataSource = dsProfAtividades
              end
              inherited dbAtividade: TDBLookupComboBox
                DataSource = dsProfAtividades
              end
              inherited DBLookupComboBox3: TDBLookupComboBox
                DataSource = dsProfAtividades
              end
              inherited DBEdit2: TDBEdit
                DataSource = dsProfAtividades
              end
              inherited DBLookupComboBox4: TDBLookupComboBox
                DataSource = dsProfAtividades
              end
              inherited DBEdit3: TDBEdit
                DataSource = dsProfAtividades
              end
              inherited DBEdit4: TDBEdit
                DataSource = dsProfAtividades
              end
              inherited DBEdit5: TDBEdit
                DataSource = dsProfAtividades
              end
            end
            inline Frame_Prof_Ativ_061: Tfrm_Professores_Ativ_06
              Left = 1
              Top = 1
              Width = 956
              Height = 135
              Align = alClient
              TabOrder = 4
              TabStop = True
              ExplicitLeft = 1
              ExplicitTop = 1
              ExplicitWidth = 956
              ExplicitHeight = 135
              inherited Label1: TLabel
                Width = 44
                ExplicitWidth = 44
              end
              inherited Label2: TLabel
                Width = 33
                ExplicitWidth = 33
              end
              inherited Label4: TLabel
                Width = 33
                ExplicitWidth = 33
              end
              inherited Label3: TLabel
                Width = 28
                ExplicitWidth = 28
              end
              inherited dbAtividade: TDBLookupComboBox
                DataSource = dsProfAtividades
              end
              inherited DBEdit1: TDBEdit
                DataSource = dsProfAtividades
              end
              inherited DBEdit2: TDBEdit
                DataSource = dsProfAtividades
              end
              inherited DBEdit3: TDBEdit
                DataSource = dsProfAtividades
              end
              inherited DBEdit4: TDBEdit
                DataSource = dsProfAtividades
              end
            end
            inline Frame_Prof_Ativ_071: Tfrm_Professores_Ativ_07
              Left = 1
              Top = 1
              Width = 956
              Height = 135
              Align = alClient
              TabOrder = 5
              TabStop = True
              ExplicitLeft = 1
              ExplicitTop = 1
              ExplicitWidth = 956
              ExplicitHeight = 135
              inherited Label1: TLabel
                Width = 44
                ExplicitWidth = 44
              end
              inherited Label3: TLabel
                Width = 71
                ExplicitWidth = 71
              end
              inherited Label2: TLabel
                Width = 33
                ExplicitWidth = 33
              end
              inherited Label7: TLabel
                Width = 69
                ExplicitWidth = 69
              end
              inherited Label4: TLabel
                Width = 38
                ExplicitWidth = 38
              end
              inherited dbAtividade: TDBLookupComboBox
                DataSource = dsProfAtividades
              end
              inherited DBEdit4: TDBEdit
                DataSource = dsProfAtividades
              end
              inherited DBEdit1: TDBEdit
                DataSource = dsProfAtividades
              end
              inherited DBEdit5: TDBEdit
                DataSource = dsProfAtividades
              end
              inherited DBEdit3: TDBEdit
                DataSource = dsProfAtividades
              end
              inherited DBEdit2: TDBEdit
                DataSource = dsProfAtividades
              end
              inherited DBEdit6: TDBEdit
                DataSource = dsProfAtividades
              end
            end
            inline Frame_Prof_Ativ_081: Tfrm_Professores_Ativ_08
              Left = 1
              Top = 1
              Width = 956
              Height = 135
              Align = alClient
              TabOrder = 6
              TabStop = True
              ExplicitLeft = 1
              ExplicitTop = 1
              ExplicitWidth = 956
              ExplicitHeight = 135
              inherited Label1: TLabel
                Width = 44
                ExplicitWidth = 44
              end
              inherited Label3: TLabel
                Width = 28
                ExplicitWidth = 28
              end
              inherited Label2: TLabel
                Width = 33
                ExplicitWidth = 33
              end
              inherited Label5: TLabel
                Width = 48
                ExplicitWidth = 48
              end
              inherited Label7: TLabel
                Width = 94
                ExplicitWidth = 94
              end
              inherited dbAtividade: TDBLookupComboBox
                DataSource = dsProfAtividades
              end
              inherited dbTitulo: TDBEdit
                DataSource = dsProfAtividades
              end
              inherited dbAutoria: TDBEdit
                DataSource = dsProfAtividades
              end
              inherited dbLocal: TDBEdit
                DataSource = dsProfAtividades
              end
              inherited dbAno: TDBEdit
                DataSource = dsProfAtividades
              end
              inherited dbFolhas: TDBEdit
                DataSource = dsProfAtividades
              end
              inherited dbInstituicao: TDBLookupComboBox
                DataSource = dsProfAtividades
              end
              inherited dbTipoDoc: TDBComboBox
                DataSource = dsProfAtividades
              end
            end
            inline Frame_Prof_Ativ_091: Tfrm_Professores_Ativ_09
              Left = 1
              Top = 1
              Width = 956
              Height = 135
              Align = alClient
              TabOrder = 7
              TabStop = True
              ExplicitLeft = 1
              ExplicitTop = 1
              ExplicitWidth = 956
              ExplicitHeight = 135
              inherited Label1: TLabel
                Width = 44
                ExplicitWidth = 44
              end
              inherited Label3: TLabel
                Width = 28
                ExplicitWidth = 28
              end
              inherited Label2: TLabel
                Width = 33
                ExplicitWidth = 33
              end
              inherited Label6: TLabel
                Width = 75
                ExplicitWidth = 75
              end
              inherited Label4: TLabel
                Width = 130
                ExplicitWidth = 130
              end
              inherited Label5: TLabel
                Width = 90
                ExplicitWidth = 90
              end
              inherited Label7: TLabel
                Width = 76
                ExplicitWidth = 76
              end
              inherited dbAtividade: TDBLookupComboBox
                DataSource = dsProfAtividades
              end
              inherited dbTitulo: TDBEdit
                DataSource = dsProfAtividades
              end
              inherited dbAutoria: TDBEdit
                DataSource = dsProfAtividades
              end
              inherited dbLocal: TDBEdit
                DataSource = dsProfAtividades
              end
              inherited dbAno: TDBEdit
                DataSource = dsProfAtividades
              end
              inherited dbFolhas: TDBEdit
                DataSource = dsProfAtividades
              end
              inherited DBEdit1: TDBEdit
                DataSource = dsProfAtividades
              end
              inherited DBEdit2: TDBEdit
                DataSource = dsProfAtividades
              end
            end
            inline Frame_Prof_Ativ_101: Tfrm_Professores_Ativ_10
              Left = 1
              Top = 1
              Width = 956
              Height = 135
              Align = alClient
              TabOrder = 8
              TabStop = True
              ExplicitLeft = 1
              ExplicitTop = 1
              ExplicitWidth = 956
              ExplicitHeight = 135
              inherited Label2: TLabel
                Width = 33
                ExplicitWidth = 33
              end
              inherited Label1: TLabel
                Width = 44
                ExplicitWidth = 44
              end
              inherited Label3: TLabel
                Width = 88
                ExplicitWidth = 88
              end
              inherited Label5: TLabel
                Width = 60
                ExplicitWidth = 60
              end
              inherited Label4: TLabel
                Width = 38
                ExplicitWidth = 38
              end
              inherited Label6: TLabel
                Width = 75
                ExplicitWidth = 75
              end
              inherited Label9: TLabel
                Width = 80
                ExplicitWidth = 80
              end
              inherited dbLocal: TDBEdit
                DataSource = dsProfAtividades
              end
              inherited dbAutoria: TDBEdit
                DataSource = dsProfAtividades
              end
              inherited dbAtividade: TDBLookupComboBox
                DataSource = dsProfAtividades
              end
              inherited dbTitulo: TDBEdit
                DataSource = dsProfAtividades
              end
              inherited dbAnais: TDBEdit
                DataSource = dsProfAtividades
              end
              inherited dbFolhas: TDBEdit
                DataSource = dsProfAtividades
              end
              inherited dbAno: TDBEdit
                DataSource = dsProfAtividades
              end
              inherited dbEventos: TDBEdit
                DataSource = dsProfAtividades
              end
            end
            inline Frame_Prof_Ativ_111: Tfrm_Professores_Ativ_11
              Left = 1
              Top = 1
              Width = 956
              Height = 135
              Align = alClient
              TabOrder = 9
              TabStop = True
              ExplicitLeft = 1
              ExplicitTop = 1
              ExplicitWidth = 956
              ExplicitHeight = 135
              inherited Label1: TLabel
                Width = 44
                ExplicitWidth = 44
              end
              inherited Label3: TLabel
                Width = 28
                ExplicitWidth = 28
              end
              inherited Label2: TLabel
                Width = 110
                ExplicitWidth = 110
              end
              inherited dbAtividade: TDBLookupComboBox
                DataSource = dsProfAtividades
              end
              inherited dbTitulo: TDBEdit
                DataSource = dsProfAtividades
              end
              inherited DBMemo1: TDBMemo
                DataSource = dsProfAtividades
              end
            end
            inline Frame_Prof_Ativ_011: Tfrm_Professores_Ativ_01
              Left = 1
              Top = 1
              Width = 956
              Height = 135
              Align = alClient
              TabOrder = 0
              TabStop = True
              ExplicitLeft = 1
              ExplicitTop = 1
              ExplicitWidth = 956
              ExplicitHeight = 135
              inherited Label2: TLabel
                Width = 110
                ExplicitWidth = 110
              end
              inherited Label1: TLabel
                Width = 44
                ExplicitWidth = 44
              end
              inherited Label3: TLabel
                Width = 108
                ExplicitWidth = 108
              end
              inherited Label4: TLabel
                Width = 48
                ExplicitWidth = 48
              end
              inherited Label7: TLabel
                Width = 49
                ExplicitWidth = 49
              end
              inherited DBEdit1: TDBEdit
                DataSource = dsProfAtividades
              end
              inherited dbAtividade: TDBLookupComboBox
                DataSource = dsProfAtividades
              end
              inherited DBLookupComboBox2: TDBLookupComboBox
                DataSource = dsProfAtividades
              end
              inherited DBLookupComboBox3: TDBLookupComboBox
                DataSource = dsProfAtividades
              end
              inherited DBEdit2: TDBEdit
                DataSource = dsProfAtividades
              end
              inherited DBLookupComboBox4: TDBLookupComboBox
                DataSource = dsProfAtividades
              end
              inherited DBEdit3: TDBEdit
                DataSource = dsProfAtividades
              end
              inherited DBEdit4: TDBEdit
                DataSource = dsProfAtividades
              end
            end
          end
          object DBGrid5: TDBGrid
            Left = 0
            Top = 0
            Width = 958
            Height = 300
            Align = alClient
            BorderStyle = bsNone
            DataSource = dsProfAtividades
            Options = [dgTitles, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgAlwaysShowSelection, dgConfirmDelete, dgCancelOnExit]
            PopupMenu = pmQtdProfAtividades
            TabOrder = 1
            TitleFont.Charset = DEFAULT_CHARSET
            TitleFont.Color = clWindowText
            TitleFont.Height = -11
            TitleFont.Name = 'MS Sans Serif'
            TitleFont.Style = []
            Columns = <
              item
                Expanded = False
                FieldName = 'descAtividade'
                Width = 180
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'ds_atividade'
                Width = 200
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'ds_local'
                Width = 200
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'vl_ano_inicio'
                Width = 70
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'vl_ano_fim'
                Width = 70
                Visible = True
              end>
          end
        end
      end
      object Panel10: TPanel
        Left = 0
        Top = 0
        Width = 966
        Height = 22
        Align = alTop
        BevelOuter = bvLowered
        Caption = 'FORMA'#199#195'O E PRODU'#199#195'O ACAD'#202'MICA'
        Color = clBlue
        Font.Charset = ANSI_CHARSET
        Font.Color = clWhite
        Font.Height = -13
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
        TabOrder = 1
      end
    end
    object tsDocumentos: TTabSheet
      Caption = 'DOCUMENTOS'
      ImageIndex = 7
      ExplicitLeft = 0
      ExplicitTop = 0
      ExplicitWidth = 0
      ExplicitHeight = 0
      object dbgDocumentos: TDBGrid
        Left = 0
        Top = 22
        Width = 966
        Height = 463
        Align = alClient
        BorderStyle = bsNone
        DataSource = dsDocumentos
        Options = [dgTitles, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgAlwaysShowSelection, dgConfirmDelete, dgCancelOnExit]
        PopupMenu = popDocumentacao
        TabOrder = 0
        TitleFont.Charset = DEFAULT_CHARSET
        TitleFont.Color = clWindowText
        TitleFont.Height = -11
        TitleFont.Name = 'MS Sans Serif'
        TitleFont.Style = []
        OnDblClick = dbgDocumentosDblClick
        Columns = <
          item
            Alignment = taCenter
            Expanded = False
            FieldName = 'Existe'
            Title.Alignment = taCenter
            Title.Caption = '?'
            Width = 23
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'Documento'
            Width = 196
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'dt_entrega'
            Title.Caption = 'Data Entrega'
            Width = 101
            Visible = True
          end
          item
            Alignment = taCenter
            Expanded = False
            FieldName = 'Digitalizou'
            Title.Alignment = taCenter
            Title.Caption = 'Dig'
            Width = 32
            Visible = True
          end>
      end
      object Panel15: TPanel
        Left = 0
        Top = 0
        Width = 966
        Height = 22
        Align = alTop
        BevelOuter = bvLowered
        Caption = 'DOCUMENTOS DO PROFESSOR'
        Color = clBlue
        Font.Charset = ANSI_CHARSET
        Font.Color = clWhite
        Font.Height = -13
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
        TabOrder = 1
      end
    end
  end
  object toolDocumentos: TToolBar [9]
    Left = 0
    Top = 541
    Width = 974
    Height = 25
    Align = alBottom
    ButtonWidth = 99
    EdgeBorders = [ebTop, ebBottom]
    Images = ImageList1
    List = True
    ShowCaptions = True
    TabOrder = 8
    Visible = False
    object btDocMarcar: TToolButton
      Left = 0
      Top = 0
      Hint = 'Marcar o documento como entregue'
      AutoSize = True
      Caption = 'F3 &Marcar'
      OnClick = btDocMarcarClick
    end
    object btDocDesmarcar: TToolButton
      Left = 59
      Top = 0
      Hint = 'Desmarcar a entrega do documento'
      AutoSize = True
      Caption = 'F4 De&smarcar'
      OnClick = btDocDesmarcarClick
    end
    object tbDocSeparador1: TToolButton
      Left = 136
      Top = 0
      Width = 8
      Caption = 'tbDocSeparador1'
      ImageIndex = 3
      Style = tbsSeparator
    end
    object btDocDigitalizar: TToolButton
      Left = 144
      Top = 0
      Hint = 'Digitalizar o documento selecionado'
      AutoSize = True
      Caption = 'F6 Digitalizar'
      OnClick = btDocDigitalizarClick
    end
    object tbDocSeparador2: TToolButton
      Left = 215
      Top = 0
      Width = 8
      Caption = 'tbDocSeparador2'
      ImageIndex = 6
      Style = tbsSeparator
    end
    object btDocFechar: TToolButton
      Left = 223
      Top = 0
      AutoSize = True
      Caption = 'F12 Fechar'
      ImageIndex = 7
      OnClick = btDocFecharClick
    end
    object tbDocSeparador3: TToolButton
      Left = 308
      Top = 0
      Width = 8
      Caption = 'tbDocSeparador3'
      ImageIndex = 8
      Style = tbsSeparator
    end
  end
  inherited ImageList1: TImageList
    Left = 608
    Top = 216
  end
  inherited tblPessoa: TUMZQuery
    Left = 723
    Top = 395
  end
  inherited dsPessoa: TDataSource
    Left = 755
    Top = 395
  end
  inherited dsContatoPessoa: TDataSource
    Left = 755
    Top = 363
  end
  inherited tblEstadosCivis: TZTable
    Left = 656
    Top = 395
  end
  inherited AbrirFoto: TSavePictureDialog
    Left = 576
    Top = 216
  end
  inherited tblContatoPessoa: TUMZQuery
    Left = 723
    Top = 363
  end
  inherited pmContatos: TPopupMenu
    Left = 692
    Top = 364
  end
  inherited tblTpLogradouro: TUMZQuery
    Top = 328
  end
  inherited tblMunicipios: TUMZQuery
    Top = 328
  end
  inherited tblMunicipioAtual: TUMZQuery
    Left = 688
    Top = 328
  end
  inherited tblOrgaos: TZTable
    Left = 656
    Top = 68
  end
  inherited qyProvincias: TUMZQuery
    Left = 723
    Top = 264
  end
  inherited qyDistritos: TUMZQuery
    Left = 723
    Top = 296
  end
  inherited qyLocalidades: TUMZQuery
    Left = 723
    Top = 328
  end
  inherited dtcProvincias: TDataSource
    Left = 755
    Top = 268
  end
  inherited dtcDistritos: TDataSource
    Left = 755
    Top = 300
  end
  inherited dtcLocalidades: TDataSource
    Left = 755
    Top = 328
  end
  inherited tblPaisAtual: TUMZQuery
    Left = 624
    Top = 328
  end
  inherited qyTemp1: TUMZQuery
    Left = 512
    Top = 216
  end
  inherited qyTemp2: TUMZQuery
    Left = 480
    Top = 216
  end
  inherited pmFoto: TPopupMenu
    Left = 544
    Top = 216
  end
  object tblExperiencia: TZTable
    Connection = DM.db
    SortedFields = 'cd_pessoa'
    AfterPost = tblExperienciaAfterPost
    OnNewRecord = tblExperienciaNewRecord
    TableName = 'funcionarios_experiencia'
    MasterFields = 'cd_pessoa'
    MasterSource = dsPessoa
    LinkedFields = 'cd_pessoa'
    IndexFieldNames = 'cd_pessoa Asc'
    Left = 723
    Top = 100
    object tblExperienciacd_experiencia: TIntegerField
      FieldName = 'cd_experiencia'
    end
    object tblExperienciacd_pessoa: TIntegerField
      DisplayLabel = 'Cod. Pessoa'
      FieldName = 'cd_pessoa'
      Required = True
    end
    object tblExperienciacd_tipo_atuacao: TSmallintField
      DisplayLabel = 'Cod. Atuacao'
      FieldName = 'cd_tipo_atuacao'
    end
    object tblExperienciadescTipoAtuacao: TStringField
      DisplayLabel = 'Atua'#231#227'o'
      FieldKind = fkLookup
      FieldName = 'descTipoAtuacao'
      LookupDataSet = DM.tblFuncTipoAtuacao
      LookupKeyFields = 'cd_tipo_atuacao'
      LookupResultField = 'ds_tipo_atuacao'
      KeyFields = 'cd_tipo_atuacao'
      Size = 50
      Lookup = True
    end
    object tblExperienciavl_tempo_anos: TSmallintField
      DisplayLabel = 'Tempo Anos'
      FieldName = 'vl_tempo_anos'
    end
    object tblExperienciavl_tempo_meses: TSmallintField
      DisplayLabel = 'Tempo Meses'
      FieldName = 'vl_tempo_meses'
    end
    object tblExperienciacd_instituicao: TIntegerField
      DisplayLabel = 'Cod. Instituicao'
      FieldName = 'cd_instituicao'
    end
    object tblExperienciacd_empresa: TIntegerField
      DisplayLabel = 'Cod. Empresa'
      FieldName = 'cd_empresa'
    end
    object tblExperienciads_local: TStringField
      DisplayLabel = 'Local'
      FieldName = 'ds_local'
      Size = 50
    end
    object tblExperienciadescEstado: TStringField
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
    object tblExperienciads_estado: TStringField
      DisplayLabel = 'Estado'
      FieldName = 'ds_estado'
      FixedChar = True
      Size = 3
    end
    object tblExperienciacd_funcao: TSmallintField
      DisplayLabel = 'Cod. Fumcao'
      FieldName = 'cd_funcao'
    end
    object tblExperienciadescFuncoes: TStringField
      DisplayLabel = 'Fun'#231#227'o'
      FieldKind = fkLookup
      FieldName = 'descFuncoes'
      LookupDataSet = DM.tblFuncFuncoes
      LookupKeyFields = 'cd_funcao'
      LookupResultField = 'ds_funcao'
      KeyFields = 'cd_funcao'
      Size = 50
      Lookup = True
    end
    object tblExperienciacd_area: TSmallintField
      DisplayLabel = 'Cod. Area'
      FieldName = 'cd_area'
    end
    object tblExperienciadescAreas: TStringField
      DisplayLabel = #193'rea do Conhecimento'
      FieldKind = fkLookup
      FieldName = 'descAreas'
      LookupDataSet = DM.qyAreasConhecimento
      LookupKeyFields = 'cd_area'
      LookupResultField = 'ds_area'
      KeyFields = 'cd_area'
      Size = 50
      Lookup = True
    end
    object tblExperienciadescInstituicoes: TStringField
      DisplayLabel = 'Institui'#231#227'o de Ensino'
      FieldKind = fkLookup
      FieldName = 'descInstituicoes'
      LookupDataSet = DM.tblInstituicoes
      LookupKeyFields = 'cd_instituicao'
      LookupResultField = 'nm_instituicao'
      KeyFields = 'cd_instituicao'
      Size = 50
      Lookup = True
    end
    object tblExperienciadescEmpresa: TStringField
      DisplayLabel = 'Nome da Empresa'
      FieldKind = fkLookup
      FieldName = 'descEmpresa'
      LookupDataSet = DM.tblEmpresas
      LookupKeyFields = 'cd_empresa'
      LookupResultField = 'nm_empresa'
      KeyFields = 'cd_empresa'
      Size = 50
      Lookup = True
    end
  end
  object dsExperiencia: TDataSource
    DataSet = tblExperiencia
    OnStateChange = dsExperienciaStateChange
    Left = 755
    Top = 100
  end
  object tblDedicacao: TZTable
    Connection = DM.db
    SortedFields = 'cd_pessoa'
    AfterPost = tblDedicacaoAfterPost
    OnNewRecord = tblDedicacaoNewRecord
    TableName = 'funcionarios_dedicacao'
    MasterFields = 'cd_pessoa'
    MasterSource = dsPessoa
    LinkedFields = 'CD_PESSOA'
    IndexFieldNames = 'cd_pessoa Asc'
    Left = 723
    Top = 132
    object tblDedicacaocd_dedicacao: TIntegerField
      DisplayLabel = 'Cod. Dedica'#231#227'o'
      FieldName = 'cd_dedicacao'
    end
    object tblDedicacaocd_pessoa: TIntegerField
      DisplayLabel = 'Cod. Pessoa'
      FieldName = 'cd_pessoa'
      Required = True
    end
    object tblDedicacaocd_tipo_atuacao: TSmallintField
      DisplayLabel = 'Cod. Atua'#231#227'o'
      FieldName = 'cd_tipo_atuacao'
    end
    object tblDedicacaodescAtuacao: TStringField
      DisplayLabel = 'Atua'#231#227'o'
      FieldKind = fkLookup
      FieldName = 'descAtuacao'
      LookupDataSet = DM.tblFuncTipoAtuacao
      LookupKeyFields = 'cd_tipo_atuacao'
      LookupResultField = 'ds_tipo_atuacao'
      KeyFields = 'cd_tipo_atuacao'
      Size = 50
      Lookup = True
    end
    object tblDedicacaocd_curso: TStringField
      DisplayLabel = 'Cod. Curso'
      FieldName = 'cd_curso'
      Required = True
      Size = 15
    end
    object tblDedicacaodescCurso: TStringField
      DisplayLabel = 'Descri'#231#227'o do Curso'
      FieldKind = fkLookup
      FieldName = 'descCurso'
      LookupDataSet = tblCursos
      LookupKeyFields = 'Codigo'
      LookupResultField = 'Descricao'
      KeyFields = 'cd_curso'
      Size = 50
      Lookup = True
    end
    object tblDedicacaods_atividade: TStringField
      DisplayLabel = 'Descri'#231#227'o da Atividade'
      FieldName = 'ds_atividade'
      Size = 50
    end
    object tblDedicacaovl_horas: TFloatField
      DisplayLabel = 'Horas Semanais'
      FieldName = 'vl_horas'
    end
    object tblDedicacaovl_anosemestre: TSmallintField
      DisplayLabel = 'Ano/Semestre'
      FieldName = 'vl_anosemestre'
      Required = True
      DisplayFormat = '0000/0'
      EditFormat = '0000/0'
    end
  end
  object dsDedicacao: TDataSource
    DataSet = tblDedicacao
    OnStateChange = dsDedicacaoStateChange
    Left = 755
    Top = 140
  end
  object tblAdmissoes: TZTable
    Connection = DM.db
    SortedFields = 'cd_pessoa'
    AfterPost = tblAdmissoesAfterPost
    OnNewRecord = tblAdmissoesNewRecord
    TableName = 'funcionarios_admissoes'
    MasterFields = 'cd_pessoa'
    MasterSource = dsPessoa
    LinkedFields = 'cd_pessoa'
    IndexFieldNames = 'cd_pessoa Asc'
    Left = 723
    Top = 164
    object tblAdmissoescd_admissao: TIntegerField
      FieldName = 'cd_admissao'
    end
    object tblAdmissoescd_pessoa: TIntegerField
      DisplayLabel = 'Cod. Pessoa'
      FieldName = 'cd_pessoa'
      Required = True
    end
    object tblAdmissoescd_funcao: TSmallintField
      DisplayLabel = 'Cod. Fun'#231#227'o'
      FieldName = 'cd_funcao'
      Required = True
    end
    object tblAdmissoesdescFuncao: TStringField
      DisplayLabel = 'Fun'#231#227'o'
      FieldKind = fkLookup
      FieldName = 'descFuncao'
      LookupDataSet = DM.tblFuncFuncoes
      LookupKeyFields = 'cd_funcao'
      LookupResultField = 'ds_funcao'
      KeyFields = 'cd_funcao'
      Size = 50
      Lookup = True
    end
    object tblAdmissoesds_funcao: TStringField
      DisplayLabel = 'Obs. da Fun'#231#227'o'
      FieldName = 'ds_funcao'
      Size = 50
    end
    object tblAdmissoescd_regime_trabalho: TSmallintField
      DisplayLabel = 'Cod. Regime '
      FieldName = 'cd_regime_trabalho'
    end
    object tblAdmissoesvl_horas_semanais: TFloatField
      DisplayLabel = 'Horas Semanais'
      FieldName = 'vl_horas_semanais'
    end
    object tblAdmissoesdescRegime: TStringField
      DisplayLabel = 'Regime de Trabalho'
      FieldKind = fkLookup
      FieldName = 'descRegime'
      LookupDataSet = DM.tblRegimeTrabalho
      LookupKeyFields = 'cd_regime'
      LookupResultField = 'ds_regime'
      KeyFields = 'cd_regime_trabalho'
      Size = 50
      Lookup = True
    end
    object tblAdmissoesdt_admissao: TDateTimeField
      DisplayLabel = 'Data Admiss'#227'o'
      FieldName = 'dt_admissao'
      DisplayFormat = 'dd/mm/yyyy'
      EditMask = '!99/99/00;1;_'
    end
    object tblAdmissoesdt_saida: TDateTimeField
      DisplayLabel = 'Data Sa'#237'da'
      FieldName = 'dt_saida'
      DisplayFormat = 'dd/mm/yyyy'
      EditMask = '!99/99/00;1;_'
    end
  end
  object dsAdmissoes: TDataSource
    DataSet = tblAdmissoes
    OnStateChange = dsAdmissoesStateChange
    Left = 755
    Top = 172
  end
  object tblProfessor: TUMZQuery
    Connection = DM.db
    BeforeEdit = tblProfessorBeforeEdit
    OnNewRecord = tblProfessorNewRecord
    SQL.Strings = (
      'select * from professores where cd_pessoa = :cd_pessoa')
    Params = <
      item
        DataType = ftInteger
        Name = 'cd_pessoa'
        ParamType = ptUnknown
        Size = 4
      end>
    DataSource = dsPessoa
    Left = 723
    Top = 68
    ParamData = <
      item
        DataType = ftInteger
        Name = 'cd_pessoa'
        ParamType = ptUnknown
        Size = 4
      end>
    object tblProfessorcd_pessoa: TIntegerField
      DisplayLabel = 'Cod. Pessoa'
      FieldName = 'cd_pessoa'
      Origin = 'WMESTRE12.professores.cd_pessoa'
    end
    object tblProfessornm_apelido: TStringField
      DisplayLabel = 'Apelido do Professor'
      FieldName = 'nm_apelido'
      Origin = 'WMESTRE12.professores.nm_apelido'
    end
    object tblProfessorcd_titulacao: TIntegerField
      DisplayLabel = 'Cod. Titulacao'
      FieldName = 'cd_titulacao'
      Origin = 'WMESTRE12.professores.cd_titulacao'
    end
    object tblProfessordescTitulacao: TStringField
      FieldKind = fkLookup
      FieldName = 'descTitulacao'
      LookupDataSet = DM.tblTitulacoes
      LookupKeyFields = 'cd_titulacao'
      LookupResultField = 'ds_titulacao'
      KeyFields = 'cd_titulacao'
      Size = 50
      Lookup = True
    end
    object tblProfessorcd_area: TIntegerField
      DisplayLabel = #193'rea do Conhecimento'
      FieldName = 'cd_area'
      Origin = 'WMESTRE12.professores.cd_area'
    end
    object tblProfessordescArea: TStringField
      DisplayLabel = #193'rea do Conhecimento'
      FieldKind = fkLookup
      FieldName = 'descArea'
      LookupDataSet = DM.qyAreasConhecimento
      LookupKeyFields = 'cd_area'
      LookupResultField = 'ds_area'
      KeyFields = 'cd_area'
      Size = 50
      Lookup = True
    end
    object tblProfessorsn_funcionario: TStringField
      FieldName = 'sn_funcionario'
      Origin = 'WMESTRE12.professores.sn_funcionario'
      FixedChar = True
      Size = 1
    end
    object tblProfessorsn_professor: TStringField
      FieldName = 'sn_professor'
      Origin = 'WMESTRE12.professores.sn_professor'
      FixedChar = True
      Size = 1
    end
  end
  object dsProfessor: TDataSource
    DataSet = tblProfessor
    OnStateChange = dsProfessorStateChange
    Left = 755
    Top = 68
  end
  object tblProfTitulos: TZTable
    Connection = DM.db
    SortedFields = 'cd_pessoa'
    AfterPost = tblProfTitulosAfterPost
    OnNewRecord = tblProfTitulosNewRecord
    TableName = 'professores_titulos'
    MasterFields = 'cd_pessoa'
    MasterSource = dsPessoa
    LinkedFields = 'cd_pessoa'
    IndexFieldNames = 'cd_pessoa Asc'
    Left = 787
    Top = 232
    object tblProfTituloscd_titulo_professor: TIntegerField
      FieldName = 'cd_titulo_professor'
    end
    object tblProfTitulosdescTitulacao: TStringField
      DisplayLabel = 'Titula'#231#227'o'
      FieldKind = fkLookup
      FieldName = 'descTitulacao'
      LookupDataSet = DM.tblTitulacoes
      LookupKeyFields = 'cd_titulacao'
      LookupResultField = 'ds_titulacao'
      KeyFields = 'cd_titulacao'
      Size = 50
      Lookup = True
    end
    object tblProfTitulosds_Curso: TStringField
      DisplayLabel = 'Curso'
      FieldName = 'ds_Curso'
      Size = 100
    end
    object tblProfTituloscd_pessoa: TIntegerField
      DisplayLabel = 'Cod. Pessoa'
      FieldName = 'cd_pessoa'
      Required = True
    end
    object tblProfTituloscd_titulacao: TSmallintField
      DisplayLabel = 'Cod. Titulacao'
      FieldName = 'cd_titulacao'
      Required = True
    end
    object tblProfTitulosvl_ano: TSmallintField
      DisplayLabel = 'Ano Conclus'#227'o'
      FieldName = 'vl_ano'
      Required = True
    end
    object tblProfTituloscd_instituicao: TIntegerField
      DisplayLabel = 'Cod. Institui'#231#227'o'
      FieldName = 'cd_instituicao'
    end
    object tblProfTitulosdescInstituicao: TStringField
      DisplayLabel = 'Institui'#231#227'o'
      FieldKind = fkLookup
      FieldName = 'descInstituicao'
      LookupDataSet = DM.tblInstituicoes
      LookupKeyFields = 'cd_instituicao'
      LookupResultField = 'nm_instituicao'
      KeyFields = 'cd_instituicao'
      Size = 50
      Lookup = True
    end
    object tblProfTituloscd_area: TSmallintField
      DisplayLabel = 'Cod. '#193'rea'
      FieldName = 'cd_area'
    end
    object tblProfTitulosdescArea: TStringField
      DisplayLabel = #193'rea do Conhecimento'
      FieldKind = fkLookup
      FieldName = 'descArea'
      LookupDataSet = DM.qyAreasConhecimento
      LookupKeyFields = 'cd_area'
      LookupResultField = 'ds_area'
      KeyFields = 'cd_area'
      Size = 50
      Lookup = True
    end
    object tblProfTitulosds_titulo_trabalho: TStringField
      DisplayLabel = 'T'#237'tulo do TCC'
      FieldName = 'ds_titulo_trabalho'
      Size = 200
    end
    object tblProfTitulosds_conceito: TStringField
      DisplayLabel = 'Conceito'
      FieldName = 'ds_conceito'
      Size = 10
    end
    object tblProfTitulosds_habilitacao: TStringField
      DisplayLabel = 'Habilita'#231#227'o'
      FieldName = 'ds_habilitacao'
      Size = 50
    end
    object tblProfTitulosds_local: TStringField
      DisplayLabel = 'Local'
      FieldName = 'ds_local'
      Size = 100
    end
    object tblProfTitulosds_estado: TStringField
      DisplayLabel = 'Estado'
      FieldName = 'ds_estado'
      FixedChar = True
      Size = 3
    end
    object tblProfTitulosdescEstado: TStringField
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
    object tblProfTitulosvl_horas: TFloatField
      DisplayLabel = 'Carga Hor'#225'ria'
      FieldName = 'vl_horas'
    end
  end
  object dsProfTitulos: TDataSource
    DataSet = qryProfTitulos
    OnStateChange = dsProfTitulosStateChange
    Left = 787
    Top = 200
  end
  object tblProfAtividades: TZTable
    Connection = DM.db
    SortedFields = 'cd_pessoa'
    AfterPost = tblProfAtividadesAfterPost
    OnNewRecord = tblProfAtividadesNewRecord
    TableName = 'professores_atividades'
    MasterFields = 'cd_pessoa'
    MasterSource = dsPessoa
    LinkedFields = 'cd_pessoa'
    IndexFieldNames = 'cd_pessoa Asc'
    Left = 723
    Top = 232
    object tblProfAtividadescd_professores_atividades: TIntegerField
      FieldName = 'cd_professores_atividades'
    end
    object tblProfAtividadescd_pessoa: TIntegerField
      FieldName = 'cd_pessoa'
    end
    object tblProfAtividadescd_atividade: TSmallintField
      DisplayLabel = 'Cod. Atividade'
      FieldName = 'cd_atividade'
    end
    object tblProfAtividadesdescAtividade: TStringField
      DisplayLabel = 'Atividade'
      FieldKind = fkLookup
      FieldName = 'descAtividade'
      LookupDataSet = DM.tblProf_Tipo_Atividade
      LookupKeyFields = 'cd_ativadade'
      LookupResultField = 'ds_atividade'
      KeyFields = 'cd_atividade'
      Size = 50
      Lookup = True
    end
    object tblProfAtividadesds_atividade: TStringField
      DisplayLabel = 'Descri'#231#227'o da Atividade'
      FieldName = 'ds_atividade'
      Size = 100
    end
    object tblProfAtividadescd_area: TSmallintField
      DisplayLabel = 'Cod. '#193'rea'
      FieldName = 'cd_area'
    end
    object tblProfAtividadesdescAreaConhecimento: TStringField
      DisplayLabel = #193'rea do Conhecimento'
      FieldKind = fkLookup
      FieldName = 'descAreaConhecimento'
      LookupDataSet = DM.qyAreasConhecimento
      LookupKeyFields = 'cd_area'
      LookupResultField = 'ds_area'
      KeyFields = 'cd_area'
      Size = 50
      Lookup = True
    end
    object tblProfAtividadescd_instituicao: TIntegerField
      DisplayLabel = 'Cod. Institui'#231#227'o'
      FieldName = 'cd_instituicao'
    end
    object tblProfAtividadesdescInstituicao: TStringField
      DisplayLabel = 'Institui'#231#227'o'
      FieldKind = fkLookup
      FieldName = 'descInstituicao'
      LookupDataSet = DM.tblInstituicoes
      LookupKeyFields = 'cd_instituicao'
      LookupResultField = 'nm_instituicao'
      KeyFields = 'cd_instituicao'
      Size = 50
      Lookup = True
    end
    object tblProfAtividadesds_local: TStringField
      DisplayLabel = 'Local'
      FieldName = 'ds_local'
      Size = 100
    end
    object tblProfAtividadesds_estado: TStringField
      DisplayLabel = 'Estado'
      FieldName = 'ds_estado'
      FixedChar = True
      Size = 3
    end
    object tblProfAtividadesdescEstado: TStringField
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
    object tblProfAtividadesvl_ano_inicio: TSmallintField
      DisplayLabel = 'Ano In'#237'cio'
      FieldName = 'vl_ano_inicio'
    end
    object tblProfAtividadesvl_ano_fim: TSmallintField
      DisplayLabel = 'Ano Fim'
      FieldName = 'vl_ano_fim'
    end
    object tblProfAtividadescd_funcao: TSmallintField
      DisplayLabel = 'Cod. Fun'#231#227'o'
      FieldName = 'cd_funcao'
    end
    object tblProfAtividadesdescFuncao: TStringField
      DisplayLabel = 'Fun'#231#227'o'
      FieldKind = fkLookup
      FieldName = 'descFuncao'
      LookupDataSet = DM.tblFuncFuncoes
      LookupKeyFields = 'cd_funcao'
      LookupResultField = 'ds_funcao'
      KeyFields = 'cd_funcao'
      Size = 50
      Lookup = True
    end
    object tblProfAtividadescd_tipo_evento: TSmallintField
      DisplayLabel = 'Cod. Tipo Evento'
      FieldName = 'cd_tipo_evento'
    end
    object tblProfAtividadesdescTipoEvento: TStringField
      DisplayLabel = 'Categoria da Participa'#231#227'o'
      FieldKind = fkLookup
      FieldName = 'descTipoEvento'
      LookupDataSet = DM.tblProf_Ativ_Evento
      LookupKeyFields = 'cd_tipo_participa'
      LookupResultField = 'ds_tipo_participa'
      KeyFields = 'cd_tipo_evento'
      Size = 50
      Lookup = True
    end
    object tblProfAtividadesnm_evento: TStringField
      DisplayLabel = 'Nome do Evento'
      FieldName = 'nm_evento'
      Size = 100
    end
    object tblProfAtividadesvl_horas: TFloatField
      DisplayLabel = 'Horas'
      FieldName = 'vl_horas'
    end
    object tblProfAtividadesds_autoria: TStringField
      DisplayLabel = 'Autoria'
      FieldName = 'ds_autoria'
      Size = 100
    end
    object tblProfAtividadesds_titulo_obra: TStringField
      DisplayLabel = 'T'#237'tulo da Obra'
      FieldName = 'ds_titulo_obra'
      Size = 100
    end
    object tblProfAtividadesds_edicao: TStringField
      DisplayLabel = 'Edi'#231#227'o'
      FieldName = 'ds_edicao'
    end
    object tblProfAtividadescd_editora: TIntegerField
      DisplayLabel = 'Cod. Editora'
      FieldName = 'cd_editora'
    end
    object tblProfAtividadesvl_paginas: TStringField
      DisplayLabel = 'Qtd. P'#225'ginas'
      FieldName = 'vl_paginas'
    end
    object tblProfAtividadesvl_mes: TSmallintField
      DisplayLabel = 'M'#234's'
      FieldName = 'vl_mes'
    end
    object tblProfAtividadesds_outras_publicacoes: TBlobField
      DisplayLabel = 'Outras Publica'#231#245'es'
      FieldName = 'ds_outras_publicacoes'
      Size = 1
    end
    object tblProfAtividadesds_tipo_tcc: TStringField
      DisplayLabel = 'Tipo do Documento'
      FieldName = 'ds_tipo_tcc'
    end
  end
  object dsProfAtividades: TDataSource
    DataSet = tblProfAtividades
    OnStateChange = dsProfAtividadesStateChange
    OnDataChange = dsProfAtividadesDataChange
    Left = 755
    Top = 231
  end
  object tblCursos: TUMZQuery
    Connection = DM.db
    SQL.Strings = (
      
        'select codigo, descricao from cursos group by codigo, descricao ' +
        'order by descricao')
    Params = <>
    Left = 692
    Top = 68
    object tblCursoscodigo: TStringField
      FieldName = 'codigo'
      Size = 15
    end
    object tblCursosdescricao: TStringField
      FieldName = 'descricao'
      Size = 100
    end
  end
  object pmQtdExperiencia: TPopupMenu
    OnPopup = pmQtdExperienciaPopup
    Left = 696
    Top = 104
  end
  object pmQtdDedicacao: TPopupMenu
    OnPopup = pmQtdDedicacaoPopup
    Left = 696
    Top = 136
  end
  object pmQtdAdmissoes: TPopupMenu
    OnPopup = pmQtdAdmissoesPopup
    Left = 696
    Top = 168
  end
  object pmQtdProfTitulos: TPopupMenu
    OnPopup = pmQtdProfTitulosPopup
    Left = 664
    Top = 232
  end
  object pmQtdProfAtividades: TPopupMenu
    OnPopup = pmQtdProfAtividadesPopup
    Left = 696
    Top = 232
  end
  object tblContatosPadroes: TUMZQuery
    Connection = DM.db
    Params = <>
    Left = 688
    Top = 395
  end
  object qryProfTitulos: TUMZQuery
    Connection = DM.db
    OnNewRecord = qryProfTitulosNewRecord
    SQL.Strings = (
      'SELECT'
      '   cd_titulo_professor,'
      '   cd_pessoa,'
      '   cd_titulacao,'
      '   ds_curso,'
      '   vl_ano,'
      '   cd_instituicao,'
      '   cd_area,'
      '   ds_titulo_trabalho,'
      '   ds_conceito,'
      '   ds_habilitacao,'
      '   ds_local,'
      '   ds_estado,'
      '   vl_horas'
      'FROM '
      '   professores_titulos'
      'WHERE'
      '   cd_pessoa = :cd_pessoa'
      'ORDER BY '
      '   cd_pessoa')
    Params = <
      item
        DataType = ftInteger
        Name = 'cd_pessoa'
        ParamType = ptUnknown
        Value = '0'
      end>
    Left = 632
    Top = 192
    ParamData = <
      item
        DataType = ftInteger
        Name = 'cd_pessoa'
        ParamType = ptUnknown
        Value = '0'
      end>
    object qryProfTituloscd_titulo_professor: TIntegerField
      FieldName = 'cd_titulo_professor'
    end
    object qryProfTituloscd_pessoa: TIntegerField
      FieldName = 'cd_pessoa'
    end
    object qryProfTituloscd_titulacao: TSmallintField
      FieldName = 'cd_titulacao'
    end
    object qryProfTitulosds_curso: TStringField
      FieldName = 'ds_curso'
      Size = 100
    end
    object qryProfTitulosvl_ano: TSmallintField
      FieldName = 'vl_ano'
    end
    object qryProfTituloscd_instituicao: TIntegerField
      FieldName = 'cd_instituicao'
    end
    object qryProfTituloscd_area: TSmallintField
      FieldName = 'cd_area'
    end
    object qryProfTitulosds_titulo_trabalho: TStringField
      FieldName = 'ds_titulo_trabalho'
      Size = 200
    end
    object qryProfTitulosds_conceito: TStringField
      FieldName = 'ds_conceito'
      Size = 10
    end
    object qryProfTitulosds_habilitacao: TStringField
      FieldName = 'ds_habilitacao'
      Size = 50
    end
    object qryProfTitulosds_local: TStringField
      FieldName = 'ds_local'
      Size = 100
    end
    object qryProfTitulosds_estado: TStringField
      FieldName = 'ds_estado'
      Size = 3
    end
    object qryProfTitulosvl_horas: TFloatField
      FieldName = 'vl_horas'
    end
    object qryProfTitulosdescEstados: TStringField
      DisplayWidth = 255
      FieldKind = fkLookup
      FieldName = 'descEstado'
      LookupDataSet = DM.tblEstados
      LookupKeyFields = 'ds_uf'
      LookupResultField = 'ds_estado'
      KeyFields = 'ds_estado'
      Size = 255
      Lookup = True
    end
    object qryProfTitulosdescTitulacao: TStringField
      DisplayWidth = 255
      FieldKind = fkLookup
      FieldName = 'descTitulacao'
      LookupDataSet = DM.tblTitulacoes
      LookupKeyFields = 'cd_titulacao'
      LookupResultField = 'ds_titulacao'
      KeyFields = 'cd_titulacao'
      Size = 255
      Lookup = True
    end
    object qryProfTitulosdescInstituicao: TStringField
      DisplayWidth = 255
      FieldKind = fkLookup
      FieldName = 'descInstituicao'
      LookupDataSet = DM.tblInstituicoes
      LookupKeyFields = 'cd_instituicao'
      LookupResultField = 'nm_instituicao'
      KeyFields = 'cd_instituicao'
      Size = 255
      Lookup = True
    end
    object qryProfTitulosdescArea: TStringField
      DisplayWidth = 255
      FieldKind = fkLookup
      FieldName = 'descArea'
      LookupDataSet = DM.qyAreasConhecimento
      LookupKeyFields = 'cd_area'
      LookupResultField = 'ds_area'
      KeyFields = 'cd_area'
      Size = 255
      Lookup = True
    end
  end
  object qryProfessoresUnidades: TUMZQuery
    Connection = DM.db
    SQL.Strings = (
      'SELECT'
      
        '   pu.cd_professor , pu.sn_funcionario, pu.sn_professor , pu.sn_' +
        'orientador, c.cd_coligada,c.nm_coligada'
      'FROM'
      '   coligadas c '
      
        '   LEFT JOIN professores_unidades pu ON (c.cd_coligada = pu.cd_c' +
        'oligada and cd_professor = :cd_professor)'
      'ORDER BY'
      '   c.nm_coligada')
    Params = <
      item
        DataType = ftUnknown
        Name = 'cd_professor'
        ParamType = ptUnknown
      end>
    Left = 16
    Top = 216
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'cd_professor'
        ParamType = ptUnknown
      end>
    object qryProfessoresUnidadescd_professor: TLargeintField
      FieldName = 'cd_professor'
      Required = True
    end
    object qryProfessoresUnidadessn_funcionario: TSmallintField
      FieldName = 'sn_funcionario'
    end
    object qryProfessoresUnidadessn_professor: TSmallintField
      FieldName = 'sn_professor'
    end
    object qryProfessoresUnidadessn_orientador: TSmallintField
      FieldName = 'sn_orientador'
    end
    object qryProfessoresUnidadescd_coligada: TIntegerField
      FieldName = 'cd_coligada'
      Required = True
    end
    object qryProfessoresUnidadesnm_coligada: TStringField
      FieldName = 'nm_coligada'
      Size = 50
    end
  end
  object dsProfessorUnidades: TDataSource
    DataSet = qryProfessoresUnidades
    Left = 48
    Top = 216
  end
  object dsDocumentos: TDataSource
    DataSet = qyDocumentos
    Left = 200
    Top = 192
  end
  object qyDocumentos: TUMZQuery
    Connection = DM.db
    OnCalcFields = qyDocumentosCalcFields
    SQL.Strings = (
      'SELECT'
      '   d.codigo,'
      '   d.documento,'
      '   d.sigla,'
      '   da.apresentou,'
      '   da.observacao,'
      '   da.sn_digitalizado,'
      '   d.nr_dpi,'
      '   d.nr_largura,'
      '   d.nr_altura,'
      '   da.dt_entrega'
      'FROM'
      '  documentos d'
      
        '  LEFT JOIN documentos_alunos da ON (da.cod_documento = d.codigo' +
        ')'
      '  LEFT JOIN pessoas pe ON (da.codigoaluno = pe.cd_pessoa)'
      'WHERE'
      '  (da.codigoaluno = :cd_professor) AND'
      '  (d.ds_sexo = '#39'A'#39' OR d.ds_sexo = pe.ds_sexo) AND'
      '  (d.cd_tipo_pessoa = 1 OR d.cd_tipo_pessoa = 3)'
      'ORDER BY'
      '  d.ordem, d.documento')
    Params = <
      item
        DataType = ftUnknown
        Name = 'cd_professor'
        ParamType = ptUnknown
      end>
    Left = 200
    Top = 160
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'cd_professor'
        ParamType = ptUnknown
      end>
    object qyDocumentosCodigo: TSmallintField
      FieldName = 'Codigo'
      Origin = 'WMESTRE12.documentos.Codigo'
    end
    object qyDocumentosDocumento: TStringField
      FieldName = 'Documento'
      Origin = 'WMESTRE12.documentos.Documento'
      Size = 50
    end
    object qyDocumentosSigla: TStringField
      FieldName = 'Sigla'
      Origin = 'WMESTRE12.documentos.Sigla'
      Size = 8
    end
    object qyDocumentosExiste: TBooleanField
      FieldKind = fkCalculated
      FieldName = 'Existe'
      DisplayValues = 'X; '
      Calculated = True
    end
    object qyDocumentosapresentou: TStringField
      FieldName = 'apresentou'
      FixedChar = True
      Size = 1
    end
    object qyDocumentosobservacao: TStringField
      FieldName = 'observacao'
      FixedChar = True
      Size = 100
    end
    object qyDocumentossn_digitalizado: TStringField
      FieldName = 'sn_digitalizado'
      FixedChar = True
      Size = 1
    end
    object qyDocumentosDigitalizou: TBooleanField
      FieldKind = fkCalculated
      FieldName = 'Digitalizou'
      DisplayValues = 'X; '
      Calculated = True
    end
    object qyDocumentosnr_dpi: TSmallintField
      FieldName = 'nr_dpi'
    end
    object qyDocumentosnr_largura: TSmallintField
      FieldName = 'nr_largura'
    end
    object qyDocumentosnr_altura: TSmallintField
      FieldName = 'nr_altura'
    end
    object qyDocumentosdt_entrega: TDateTimeField
      FieldName = 'dt_entrega'
      DisplayFormat = 'dd/mm/yyyy hh:nn'
    end
  end
  object popDocumentacao: TPopupMenu
    OnPopup = popDocumentacaoPopup
    Left = 235
    Top = 175
    object ProfessorEntregouDocumento1: TMenuItem
      Caption = 'Professor entregou o documento'
      Checked = True
      OnClick = ProfessorEntregouDocumento1Click
    end
    object Digitalizardocumento1: TMenuItem
      Caption = 'Digitalizar documento'
      OnClick = Digitalizardocumento1Click
    end
    object Limparadigitalizao1: TMenuItem
      Caption = 'Excluir o documento digitalizado'
      OnClick = Limparadigitalizao1Click
    end
  end
end
