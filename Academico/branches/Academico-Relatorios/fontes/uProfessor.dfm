inherited frm_Professores: Tfrm_Professores
  Left = 132
  Top = 93
  Caption = 'Cadastro de Professores e Funcion'#225'rios'
  ClientHeight = 744
  ClientWidth = 1028
  OldCreateOrder = True
  Position = poDesigned
  ExplicitWidth = 1036
  ExplicitHeight = 778
  PixelsPerInch = 96
  TextHeight = 13
  inherited Panel3: TPanel
    Width = 1028
    ExplicitWidth = 1028
    inherited DBText1: TDBText
      Top = 2
      ExplicitTop = 2
    end
  end
  inherited toolPessoa: TToolBar
    Top = 719
    Width = 1028
    ButtonWidth = 90
    ExplicitTop = 719
    ExplicitWidth = 1028
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
      Caption = 'Observa'#231#245'es'
      Visible = True
      ExplicitWidth = 90
    end
    inherited btn_ImprimirAcade: TToolButton
      Left = 561
      ExplicitLeft = 561
      ExplicitWidth = 81
    end
    inherited btBuscar_Pessoa: TToolButton
      Left = 642
      ExplicitLeft = 642
      ExplicitWidth = 79
    end
    inherited ToolButton11: TToolButton
      Left = 721
      ExplicitLeft = 721
    end
    inherited btFechar_Pessoa: TToolButton
      Left = 729
      ExplicitLeft = 729
      ExplicitWidth = 85
    end
    inherited ToolButton2: TToolButton
      Left = 814
      ExplicitLeft = 814
    end
  end
  inherited pgPessoa: TPageControl
    Width = 1028
    Height = 544
    ActivePage = TabSheet9
    ExplicitWidth = 1028
    ExplicitHeight = 544
    inherited tsDadosPessoais: TTabSheet
      ExplicitLeft = 4
      ExplicitTop = 27
      ExplicitWidth = 1020
      ExplicitHeight = 513
      inherited lbNomeSocialInfo: TLabel [0]
      end
      inherited Label14: TLabel [1]
      end
      inherited lbNomeSocial: TLabel [2]
      end
      inherited lbNomeOficial: TLabel [3]
      end
      inherited Label2: TLabel [4]
      end
      inherited Label3: TLabel [5]
      end
      inherited Label5: TLabel [6]
      end
      inherited Label6: TLabel [7]
      end
      inherited Label7: TLabel [8]
      end
      inherited Label8: TLabel [9]
      end
      inherited Label9: TLabel [10]
      end
      inherited Label10: TLabel [11]
      end
      inherited Label11: TLabel [12]
      end
      inherited Label13: TLabel [13]
      end
      inherited Label38: TLabel [14]
      end
      inherited Label41: TLabel [15]
      end
      inherited Label42: TLabel [16]
      end
      inherited Label4: TLabel [17]
      end
      inherited sbCep: TSpeedButton [18]
      end
      inherited lbTipoLogradouro: TLabel [19]
      end
      inherited pcDocumentos: TPageControl
        inherited TabSheet2: TTabSheet
          ExplicitLeft = 4
          ExplicitTop = 27
          ExplicitWidth = 757
          ExplicitHeight = 69
        end
        inherited TabSheet3: TTabSheet
          ExplicitLeft = 4
          ExplicitTop = 27
          ExplicitWidth = 757
          ExplicitHeight = 69
        end
        inherited TabSheet4: TTabSheet
          ExplicitLeft = 4
          ExplicitTop = 27
          ExplicitWidth = 757
          ExplicitHeight = 69
        end
        inherited tsCertidao: TTabSheet
          ExplicitLeft = 4
          ExplicitTop = 27
          ExplicitWidth = 757
          ExplicitHeight = 69
        end
      end
    end
    inherited tsComplementares: TTabSheet
      OnShow = tsComplementaresShow
      ExplicitLeft = 4
      ExplicitTop = 27
      ExplicitWidth = 1020
      ExplicitHeight = 513
      inherited ScrollBox1: TScrollBox
        Width = 1020
        Height = 513
        ExplicitWidth = 1020
        ExplicitHeight = 513
        inherited Panel2: TPanel
          Width = 999
          Height = 402
          ExplicitWidth = 999
          ExplicitHeight = 402
          inherited Label40: TLabel
            Left = 554
            ExplicitLeft = 554
          end
          object Label60: TLabel [3]
            Left = 5
            Top = 111
            Width = 35
            Height = 13
            Caption = 'Apelido'
            FocusControl = DBEdit5
          end
          object Label61: TLabel [4]
            Left = 2
            Top = 60
            Width = 44
            Height = 13
            Caption = 'Titula'#231#227'o'
            FocusControl = DBLookupComboBox4
          end
          object Label62: TLabel [5]
            Left = 409
            Top = 60
            Width = 108
            Height = 13
            Caption = #193'rea do Conhecimento'
            FocusControl = dblcAreaConhecimento
          end
          inherited Label74: TLabel
            Left = 411
            Top = 111
            ExplicitLeft = 411
            ExplicitTop = 111
          end
          inherited Bevel2: TBevel
            Top = 106
            Width = 769
            ExplicitTop = 106
            ExplicitWidth = 769
          end
          inherited Label33: TLabel
            Left = 5
            Top = 158
            ExplicitLeft = 5
            ExplicitTop = 158
          end
          inherited Label108: TLabel
            Left = 144
            Top = 158
            ExplicitLeft = 144
            ExplicitTop = 158
          end
          inherited Label109: TLabel
            Left = 315
            Top = 158
            ExplicitLeft = 315
            ExplicitTop = 158
          end
          inherited lbVencimento: TLabel
            Left = 278
            Top = 61
            Visible = False
            ExplicitLeft = 278
            ExplicitTop = 61
          end
          inherited Bevel3: TBevel
            Top = 152
            Width = 769
            ExplicitTop = 152
            ExplicitWidth = 769
          end
          inherited Label207: TLabel
            Left = 0
            Top = 204
            ExplicitLeft = 0
            ExplicitTop = 204
          end
          inherited Label210: TLabel
            Left = 183
            Top = 204
            ExplicitLeft = 183
            ExplicitTop = 204
          end
          inherited Label211: TLabel
            Left = 482
            Top = 204
            ExplicitLeft = 482
            ExplicitTop = 204
          end
          inherited lbDTCadastro: TLabel
            Left = 107
            Top = 204
            ExplicitLeft = 107
            ExplicitTop = 204
          end
          inherited lbDTAlteracao: TLabel
            Left = 378
            Top = 204
            ExplicitLeft = 378
            ExplicitTop = 204
          end
          inherited lbUsuario: TLabel
            Left = 731
            Top = 204
            ExplicitLeft = 731
            ExplicitTop = 204
          end
          object lbRaca: TLabel [19]
            Left = 389
            Top = 3
            Width = 26
            Height = 13
            Caption = 'Ra'#231'a'
          end
          object lblColigada: TLabel [21]
            Left = 484
            Top = 159
            Width = 102
            Height = 13
            Caption = 'Coligada do professor'
          end
          object DBEdit5: TDBEdit [24]
            Left = 5
            Top = 127
            Width = 395
            Height = 21
            CharCase = ecUpperCase
            DataField = 'nm_apelido'
            DataSource = dsProfessor
            TabOrder = 6
          end
          inherited DBEdit1: TDBEdit
            Left = 554
            Top = 22
            Width = 218
            TabOrder = 2
            ExplicitLeft = 554
            ExplicitTop = 22
            ExplicitWidth = 218
          end
          inherited DBEdit13: TDBEdit
            Left = 410
            Top = 127
            Width = 358
            TabOrder = 7
            ExplicitLeft = 410
            ExplicitTop = 127
            ExplicitWidth = 358
          end
          inherited edLogin: TEdit
            Left = 5
            Top = 177
            TabOrder = 8
            ExplicitLeft = 5
            ExplicitTop = 177
          end
          inherited edSenha1: TEdit
            Left = 144
            Top = 177
            TabOrder = 9
            ExplicitLeft = 144
            ExplicitTop = 177
          end
          inherited edSenha2: TEdit
            Left = 315
            Top = 177
            TabOrder = 10
            ExplicitLeft = 315
            ExplicitTop = 177
          end
          inherited dbDiaVencimento: TDBEdit
            Top = 79
            TabOrder = 13
            Visible = False
            ExplicitTop = 79
          end
          inherited Button1: TButton
            Left = 654
            Top = 48
            TabOrder = 3
            ExplicitLeft = 654
            ExplicitTop = 48
          end
          inherited btnLiberarAcesso: TButton
            Left = 641
            Top = 175
            ExplicitLeft = 641
            ExplicitTop = 175
          end
          inherited btnBloquearOnline: TButton
            Left = 641
            Top = 175
            TabOrder = 18
            ExplicitLeft = 641
            ExplicitTop = 175
          end
          inherited cbRetiraMaterial: TDBCheckBox
            Left = 533
            Top = 56
            Enabled = False
            TabOrder = 17
            Visible = False
            ExplicitLeft = 533
            ExplicitTop = 56
          end
          inherited cbFormaConhece: TComboBox
            TabOrder = 20
          end
          inherited edFormaConheceuOutro: TEdit
            TabOrder = 19
          end
          object dblcAreaConhecimento: TDBLookupComboBox
            Left = 410
            Top = 79
            Width = 359
            Height = 21
            DataField = 'descArea'
            DataSource = dsProfessor
            TabOrder = 5
          end
          object DBLookupComboBox6: TDBLookupComboBox
            Left = 4
            Top = 79
            Width = 399
            Height = 21
            DataField = 'descTitulacao'
            DataSource = dsProfessor
            TabOrder = 4
          end
          object dbclRacas: TDBLookupComboBox
            Left = 389
            Top = 22
            Width = 145
            Height = 21
            DataField = 'descRaca'
            DataSource = dsPessoa
            TabOrder = 1
          end
          object pnl: TPanel
            Left = 0
            Top = 312
            Width = 999
            Height = 24
            Align = alBottom
            BevelOuter = bvLowered
            Caption = #193'REAS DO CONHECIMENTO'
            TabOrder = 14
          end
          object pnlAreas: TPanel
            Left = 0
            Top = 336
            Width = 999
            Height = 66
            Align = alBottom
            BevelOuter = bvNone
            TabOrder = 16
            object pnlButtons: TPanel
              Left = 963
              Top = 0
              Width = 36
              Height = 66
              Align = alRight
              BevelOuter = bvNone
              TabOrder = 0
              object btnAdd: TBitBtn
                Left = 6
                Top = 6
                Width = 26
                Height = 22
                TabOrder = 0
                OnClick = btnAddClick
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
              object btnDell: TBitBtn
                Left = 6
                Top = 34
                Width = 26
                Height = 22
                TabOrder = 1
                OnClick = btnDellClick
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
              end
            end
            object dbgAreasProfessor: TDBGrid
              Left = 0
              Top = 0
              Width = 963
              Height = 66
              Align = alClient
              DataSource = dsAreasProfessores
              Options = [dgColumnResize, dgColLines, dgRowLines, dgTabs, dgConfirmDelete, dgCancelOnExit]
              TabOrder = 1
              TitleFont.Charset = DEFAULT_CHARSET
              TitleFont.Color = clWindowText
              TitleFont.Height = -11
              TitleFont.Name = 'MS Sans Serif'
              TitleFont.Style = []
              OnDragDrop = dbgAreasProfessorDragDrop
              OnDragOver = dbgAreasProfessorDragOver
              Columns = <
                item
                  Expanded = False
                  FieldName = 'ds_area'
                  Width = 700
                  Visible = True
                end>
            end
          end
          object dblProfessor: TDBLookupComboBox
            Left = 484
            Top = 178
            Width = 145
            Height = 21
            DataField = 'nm_coligadas'
            DataSource = dsProfessor
            TabOrder = 11
          end
          object Panel14: TPanel
            Left = 0
            Top = 223
            Width = 999
            Height = 89
            Align = alBottom
            BevelOuter = bvNone
            Caption = 'Panel14'
            TabOrder = 15
            object sbCheckFuncionario: TSpeedButton
              Left = 13
              Top = 61
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
            object sbCheckOrientador: TSpeedButton
              Left = 108
              Top = 59
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
            object sbCheckProfessor: TSpeedButton
              Left = 215
              Top = 59
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
            object sbUnCheckFuncionario: TSpeedButton
              Left = 42
              Top = 59
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
            object sbUnCheckOrientador: TSpeedButton
              Left = 137
              Top = 59
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
            object sbUnCheckProfessor: TSpeedButton
              Left = 244
              Top = 59
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
            object dbgUnidadesCargos: TDBGrid
              Left = 0
              Top = 0
              Width = 999
              Height = 59
              Align = alTop
              DataSource = dsProfessorUnidade
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
                  Width = 106
                  Visible = True
                end
                item
                  Expanded = False
                  FieldName = 'sn_professor'
                  Title.Caption = 'Professor'
                  Width = 100
                  Visible = True
                end
                item
                  Expanded = False
                  FieldName = 'nm_coligada'
                  Title.Caption = 'Unidade de ensino'
                  Width = 163
                  Visible = True
                end>
            end
          end
        end
        inherited Panel4: TPanel
          Top = 402
          Width = 999
          BevelOuter = bvLowered
          ExplicitTop = 402
          ExplicitWidth = 999
          inherited btnAlteraObs: TBitBtn
            Left = 929
            ExplicitLeft = 929
          end
          inherited btnSalvarObs: TBitBtn
            Left = 952
            ExplicitLeft = 952
          end
          inherited btnCancelarObs: TBitBtn
            Left = 975
            ExplicitLeft = 975
          end
        end
        inherited dbObs: TDBMemo
          Top = 426
          Width = 999
          Height = 0
          ExplicitTop = 426
          ExplicitWidth = 999
          ExplicitHeight = 0
        end
        inherited lbVinculoExterno: TPanel
          Top = 426
          Width = 999
          ExplicitTop = 426
          ExplicitWidth = 999
        end
        inherited pnVinculosExterno: TPanel
          Top = 451
          Width = 999
          ExplicitTop = 451
          ExplicitWidth = 999
          inherited pnAcoesVinculoExterno: TPanel
            Left = 975
            ExplicitLeft = 975
          end
          inherited grVinculosExterno: TDBGrid
            Width = 975
          end
        end
      end
    end
    inherited tsParentes: TTabSheet
      ExplicitWidth = 1020
      ExplicitHeight = 513
      inherited frParentes1: TfrParentes
        Width = 1020
        Height = 513
        ExplicitWidth = 1020
        ExplicitHeight = 513
        inherited Bevel1: TBevel
          Height = 417
          ExplicitHeight = 149
        end
        inherited Bevel2: TBevel
          Left = 1002
          Height = 417
          ExplicitLeft = 889
          ExplicitHeight = 149
        end
        inherited Bevel3: TBevel
          Top = 506
          Width = 1020
          ExplicitTop = 238
          ExplicitWidth = 907
        end
        inherited Bevel4: TBevel
          Top = 474
          Width = 1020
          ExplicitTop = 206
          ExplicitWidth = 907
        end
        inherited DBGrid1: TDBGrid
          Width = 984
          Height = 417
        end
        inherited Panel1: TPanel
          Width = 1020
          ExplicitWidth = 1020
        end
        inherited toolPessoa: TToolBar
          Top = 481
          Width = 1020
          ExplicitTop = 481
          ExplicitWidth = 1020
          inherited DBNavigator1: TDBNavigator
            Hints.Strings = ()
          end
        end
      end
    end
    object TabSheet6: TTabSheet
      Caption = 'EXPERI'#202'NCIA'
      ImageIndex = 2
      object Panel5: TPanel
        Left = 0
        Top = 365
        Width = 1020
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
          Left = 512
          Top = 8
          Width = 60
          Height = 13
          Caption = 'Tempo Anos'
          FocusControl = dbTempoAnos
        end
        object Label31: TLabel
          Left = 603
          Top = 8
          Width = 67
          Height = 13
          Caption = 'Tempo Meses'
          FocusControl = dbTempoMeses
        end
        object Label34: TLabel
          Left = 251
          Top = 56
          Width = 98
          Height = 13
          Caption = 'Institui'#231#227'o de Ensino'
          FocusControl = dbInstituicao
        end
        object Label43: TLabel
          Left = 568
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
          Left = 8
          Top = 56
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
        object Label1: TLabel
          Left = 283
          Top = 8
          Width = 107
          Height = 13
          Caption = 'Data Inicial do Periodo'
          FocusControl = dbdtinicialperiodo
        end
        object Label28: TLabel
          Left = 396
          Top = 8
          Width = 102
          Height = 13
          Caption = 'Data Final do Periodo'
          FocusControl = dbdtfinalperiodo
        end
        object dbAtuacao: TDBLookupComboBox
          Left = 8
          Top = 24
          Width = 264
          Height = 21
          DataField = 'descTipoAtuacao'
          DataSource = dsExperiencia
          TabOrder = 0
          OnKeyPress = dbNomeKeyPress
        end
        object dbTempoAnos: TDBEdit
          Left = 512
          Top = 24
          Width = 84
          Height = 21
          CharCase = ecUpperCase
          DataField = 'vl_tempo_anos'
          DataSource = dsExperiencia
          TabOrder = 3
          OnKeyPress = dbNomeKeyPress
        end
        object dbTempoMeses: TDBEdit
          Left = 602
          Top = 24
          Width = 84
          Height = 21
          CharCase = ecUpperCase
          DataField = 'vl_tempo_meses'
          DataSource = dsExperiencia
          TabOrder = 4
          OnKeyPress = dbNomeKeyPress
        end
        object dbInstituicao: TDBLookupComboBox
          Left = 251
          Top = 72
          Width = 306
          Height = 21
          DataField = 'descInstituicoes'
          DataSource = dsExperiencia
          TabOrder = 6
          OnKeyPress = dbNomeKeyPress
        end
        object dbEmpresa: TDBLookupComboBox
          Left = 567
          Top = 72
          Width = 243
          Height = 21
          DataField = 'descEmpresa'
          DataSource = dsExperiencia
          TabOrder = 7
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
          TabOrder = 8
          OnKeyPress = dbNomeKeyPress
        end
        object dbEstado: TDBLookupComboBox
          Left = 200
          Top = 117
          Width = 210
          Height = 21
          DataField = 'descEstado'
          DataSource = dsExperiencia
          TabOrder = 9
          OnKeyPress = dbNomeKeyPress
        end
        object dbFuncao: TDBLookupComboBox
          Left = 8
          Top = 72
          Width = 233
          Height = 21
          DataField = 'descFuncoes'
          DataSource = dsExperiencia
          TabOrder = 5
          OnKeyPress = dbNomeKeyPress
        end
        object dbAreaConhecimento: TDBLookupComboBox
          Left = 416
          Top = 117
          Width = 309
          Height = 21
          DataField = 'descAreas'
          DataSource = dsExperiencia
          TabOrder = 10
          OnKeyPress = dbNomeKeyPress
        end
        object dbdtinicialperiodo: TDBEdit
          Left = 283
          Top = 24
          Width = 107
          Height = 21
          CharCase = ecUpperCase
          DataField = 'dt_inicial_periodo'
          DataSource = dsExperiencia
          TabOrder = 1
          OnExit = dbdtinicialperiodoExit
          OnKeyPress = dbNomeKeyPress
        end
        object dbdtfinalperiodo: TDBEdit
          Left = 396
          Top = 24
          Width = 101
          Height = 21
          CharCase = ecUpperCase
          DataField = 'dt_final_periodo'
          DataSource = dsExperiencia
          TabOrder = 2
          OnExit = dbdtfinalperiodoExit
          OnKeyPress = dbNomeKeyPress
        end
      end
      object DBGrid1: TDBGrid
        Left = 0
        Top = 22
        Width = 1020
        Height = 343
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
          end
          item
            Expanded = False
            FieldName = 'dt_inicial_periodo'
            Title.Caption = 'Data Inicial Periodo'
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'dt_final_periodo'
            Title.Caption = 'Data Final Periodo'
            Visible = True
          end>
      end
      object Panel7: TPanel
        Left = 0
        Top = 0
        Width = 1020
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
      object DBGrid2: TDBGrid
        Left = 0
        Top = 22
        Width = 1020
        Height = 348
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
            Title.Caption = 'Atua'#231#227'o'
            Width = 222
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'descCurso'
            Title.Caption = 'Descri'#231#227'o do curso'
            Width = 186
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'ds_atividade'
            Title.Caption = 'Descri'#231#227'o da atividade'
            Width = 158
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
          end
          item
            Expanded = False
            FieldName = 'descInstituicao'
            Title.Caption = 'Institui'#231#227'o'
            Width = 142
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'descAtividade'
            Title.Caption = 'Atividade'
            Width = 143
            Visible = True
          end>
      end
      object Panel6: TPanel
        Left = 0
        Top = 370
        Width = 1020
        Height = 143
        Align = alBottom
        BevelOuter = bvLowered
        TabOrder = 1
        object Label48: TLabel
          Left = 7
          Top = 96
          Width = 40
          Height = 13
          Caption = 'Atua'#231#227'o'
          FocusControl = dbAtuacaoDedicacao
        end
        object Label49: TLabel
          Left = 174
          Top = 53
          Width = 93
          Height = 13
          Caption = 'Descri'#231#227'o do Curso'
          FocusControl = dbDescCurso
        end
        object Label50: TLabel
          Left = 8
          Top = 53
          Width = 52
          Height = 13
          Caption = 'Cod. Curso'
          FocusControl = dbCurso
        end
        object Label51: TLabel
          Left = 288
          Top = 96
          Width = 110
          Height = 13
          Caption = 'Descri'#231#227'o da Atividade'
          FocusControl = dbDescAtividade
        end
        object Label52: TLabel
          Left = 568
          Top = 96
          Width = 77
          Height = 13
          Caption = 'Horas Semanais'
          FocusControl = dbHorasSemanais
        end
        object Label53: TLabel
          Left = 690
          Top = 96
          Width = 68
          Height = 13
          Caption = 'Ano/Semestre'
          FocusControl = dbAnoSemestre
        end
        object Label29: TLabel
          Left = 8
          Top = 9
          Width = 44
          Height = 13
          Caption = 'Atividade'
          FocusControl = Frame_Prof_Ativ_011.dbAtividade
        end
        object Label77: TLabel
          Left = 233
          Top = 9
          Width = 48
          Height = 13
          Caption = 'Institui'#231#227'o'
          FocusControl = Frame_Prof_Ativ_011.DBLookupComboBox3
        end
        object Label78: TLabel
          Left = 520
          Top = 9
          Width = 26
          Height = 13
          Caption = 'Local'
          FocusControl = dbeditlocal
        end
        object Label80: TLabel
          Left = 684
          Top = 53
          Width = 102
          Height = 13
          Caption = 'Data Final do Periodo'
          FocusControl = DBEdit14
        end
        object Label79: TLabel
          Left = 551
          Top = 53
          Width = 107
          Height = 13
          Caption = 'Data Inicial do Periodo'
          FocusControl = DBEdit3
        end
        object dbAtuacaoDedicacao: TDBLookupComboBox
          Left = 8
          Top = 112
          Width = 273
          Height = 21
          DataField = 'descAtuacao'
          DataSource = dsDedicacao
          TabOrder = 7
        end
        object dbDescCurso: TDBLookupComboBox
          Left = 174
          Top = 69
          Width = 371
          Height = 21
          DataField = 'descCurso'
          DataSource = dsDedicacao
          TabOrder = 4
        end
        object dbCurso: TDBEdit
          Left = 8
          Top = 69
          Width = 151
          Height = 21
          CharCase = ecUpperCase
          DataField = 'cd_curso'
          DataSource = dsDedicacao
          TabOrder = 3
        end
        object dbDescAtividade: TDBEdit
          Left = 288
          Top = 112
          Width = 273
          Height = 21
          CharCase = ecUpperCase
          DataField = 'ds_atividade'
          DataSource = dsDedicacao
          TabOrder = 8
        end
        object dbHorasSemanais: TDBEdit
          Left = 567
          Top = 112
          Width = 106
          Height = 21
          CharCase = ecUpperCase
          DataField = 'vl_horas'
          DataSource = dsDedicacao
          TabOrder = 9
        end
        object dbAnoSemestre: TDBEdit
          Left = 690
          Top = 112
          Width = 95
          Height = 21
          CharCase = ecUpperCase
          DataField = 'vl_anosemestre'
          DataSource = dsDedicacao
          MaxLength = 5
          TabOrder = 10
        end
        object dbAtividade: TDBLookupComboBox
          Left = 8
          Top = 28
          Width = 217
          Height = 21
          DataField = 'descAtividade'
          DataSource = dsDedicacao
          TabOrder = 0
        end
        object DBLookupComboBox10: TUMLookupComboBox
          Left = 233
          Top = 28
          Width = 280
          Height = 21
          DataField = 'descInstituicao'
          DataSource = dsDedicacao
          TabOrder = 1
        end
        object dbeditlocal: TDBEdit
          Left = 519
          Top = 28
          Width = 266
          Height = 21
          CharCase = ecUpperCase
          DataField = 'ds_local'
          DataSource = dsDedicacao
          TabOrder = 2
        end
        object DBEdit14: TDBEdit
          Left = 684
          Top = 69
          Width = 101
          Height = 21
          CharCase = ecUpperCase
          DataField = 'dt_final_periodo'
          DataSource = dsDedicacao
          TabOrder = 6
          OnExit = DBEdit3Exit
          OnKeyPress = dbNomeKeyPress
        end
        object DBEdit3: TDBEdit
          Left = 551
          Top = 69
          Width = 123
          Height = 21
          CharCase = ecUpperCase
          DataField = 'dt_inicial_periodo'
          DataSource = dsDedicacao
          TabOrder = 5
          OnExit = DBEdit3Exit
          OnKeyPress = dbNomeKeyPress
        end
      end
      object Panel8: TPanel
        Left = 0
        Top = 0
        Width = 1020
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
      object Panel9: TPanel
        Left = 0
        Top = 0
        Width = 1020
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
        Width = 1020
        Height = 346
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
        Top = 368
        Width = 1020
        Height = 145
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
        object Label75: TLabel
          Left = 653
          Top = 8
          Width = 164
          Height = 13
          Caption = 'Situa'#231#227'o do Docente/Funcion'#225'rio:'
        end
        object SpeedButton2: TSpeedButton
          Left = 473
          Top = 105
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
          OnClick = SpeedButton2Click
        end
        object SpeedButton3: TSpeedButton
          Left = 621
          Top = 105
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
          OnClick = SpeedButton3Click
        end
        object dbRegime: TDBLookupComboBox
          Left = 8
          Top = 24
          Width = 330
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
          OnExit = dbAdmiExit
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
          OnExit = dbAdmiExit
        end
        object dbFuncaoAdmi: TDBLookupComboBox
          Left = 8
          Top = 72
          Width = 329
          Height = 21
          DataField = 'descFuncao'
          DataSource = dsAdmissoes
          TabOrder = 5
        end
        object dbObsFuncao: TDBEdit
          Left = 343
          Top = 72
          Width = 297
          Height = 21
          CharCase = ecUpperCase
          DataField = 'ds_funcao'
          DataSource = dsAdmissoes
          TabOrder = 6
        end
        object DBRadioGroup1: TDBRadioGroup
          Left = 8
          Top = 99
          Width = 108
          Height = 31
          Caption = 'Docente Substituto'
          Columns = 2
          DataField = 'sn_temporario'
          DataSource = dsAdmissoes
          Items.Strings = (
            'Sim'
            'N'#227'o')
          ParentBackground = True
          TabOrder = 7
          TabStop = True
          Values.Strings = (
            '1'
            '0')
        end
        object DBRadioGroup2: TDBRadioGroup
          Left = 128
          Top = 99
          Width = 108
          Height = 31
          Caption = 'Bolsa de Pesquisa'
          Columns = 2
          DataField = 'sn_bolsa_pesquisa'
          DataSource = dsAdmissoes
          Items.Strings = (
            'Sim'
            'N'#227'o')
          ParentBackground = True
          TabOrder = 8
          TabStop = True
          Values.Strings = (
            '1'
            '0')
        end
        object DBLookupComboBox5: TDBLookupComboBox
          Left = 647
          Top = 25
          Width = 364
          Height = 21
          DataField = 'cd_situacao_doc'
          DataSource = dsAdmissoes
          KeyField = 'cd_situacao'
          ListField = 'ds_valor'
          ListFieldIndex = 1
          ListSource = dsSituacoes
          TabOrder = 4
        end
        object pnSituacaoDocente: TPanel
          Left = 650
          Top = 52
          Width = 363
          Height = 96
          BevelOuter = bvNone
          TabOrder = 12
          object Label76: TLabel
            Left = 3
            Top = 4
            Width = 30
            Height = 13
            Caption = #193'reas:'
            FocusControl = dbObsFuncao
          end
          object dbcbSequencial: TDBCheckBox
            Left = 4
            Top = 21
            Width = 97
            Height = 17
            Caption = 'Sequencial'
            DataField = 'sn_sequencial'
            DataSource = dsAdmissoes
            TabOrder = 0
            ValueChecked = '1'
            ValueUnchecked = '0'
          end
          object dbcbPosDistancia: TDBCheckBox
            Left = 164
            Top = 21
            Width = 153
            Height = 17
            Caption = 'P'#243's '#224' Dist'#226'ncia'
            DataField = 'sn_pos_distancia'
            DataSource = dsAdmissoes
            TabOrder = 1
            ValueChecked = '1'
            ValueUnchecked = '0'
          end
          object dbcbGraduacaoPresencial: TDBCheckBox
            Left = 4
            Top = 40
            Width = 129
            Height = 17
            Caption = 'Gradua'#231#227'o Presencial'
            DataField = 'sn_graduacao_presencial'
            DataSource = dsAdmissoes
            TabOrder = 2
            ValueChecked = '1'
            ValueUnchecked = '0'
          end
          object dbcbPesquisa: TDBCheckBox
            Left = 164
            Top = 40
            Width = 153
            Height = 17
            Caption = 'Pesquisa'
            DataField = 'sn_pesquisa'
            DataSource = dsAdmissoes
            TabOrder = 3
            ValueChecked = '1'
            ValueUnchecked = '0'
          end
          object dbcbGraduacaoDistancia: TDBCheckBox
            Left = 4
            Top = 58
            Width = 129
            Height = 17
            Caption = 'Gradua'#231#227'o '#224' Dist'#226'ncia'
            DataField = 'sn_graduacao_distancia'
            DataSource = dsAdmissoes
            TabOrder = 4
            ValueChecked = '1'
            ValueUnchecked = '0'
          end
          object dbcbExtensao: TDBCheckBox
            Left = 164
            Top = 58
            Width = 153
            Height = 17
            Caption = 'Extens'#227'o'
            DataField = 'sn_extensao'
            DataSource = dsAdmissoes
            TabOrder = 5
            ValueChecked = '1'
            ValueUnchecked = '0'
          end
          object dbcbPosPresencial: TDBCheckBox
            Left = 4
            Top = 75
            Width = 97
            Height = 17
            Caption = 'P'#243's Presencial'
            DataField = 'sn_pos_presencial'
            DataSource = dsAdmissoes
            TabOrder = 6
            ValueChecked = '1'
            ValueUnchecked = '0'
          end
          object dbcbGestao: TDBCheckBox
            Left = 164
            Top = 75
            Width = 153
            Height = 17
            Caption = 'Gest'#227'o'
            DataField = 'sn_gestao'
            DataSource = dsAdmissoes
            TabOrder = 7
            ValueChecked = '1'
            ValueUnchecked = '0'
          end
        end
        object DBRadioGroup4: TDBRadioGroup
          Left = 242
          Top = 99
          Width = 108
          Height = 31
          Caption = 'Membro CPA'
          Columns = 2
          DataField = 'sn_membro_cpa'
          DataSource = dsAdmissoes
          Items.Strings = (
            'Sim'
            'N'#227'o')
          ParentBackground = True
          TabOrder = 9
          TabStop = True
          Values.Strings = (
            '1'
            '0')
        end
        object DBRadioGroup3: TDBRadioGroup
          Left = 359
          Top = 99
          Width = 108
          Height = 31
          Caption = 'Membro NDE'
          Columns = 2
          DataField = 'sn_membro_nde'
          DataSource = dsAdmissoes
          Items.Strings = (
            'Sim'
            'N'#227'o')
          ParentBackground = True
          TabOrder = 10
          TabStop = True
          Values.Strings = (
            '1'
            '0')
        end
        object DBRadioGroup5: TDBRadioGroup
          Left = 508
          Top = 99
          Width = 108
          Height = 31
          Caption = 'Coordena'#231#227'o'
          Columns = 2
          DataField = 'sn_coordenacao_nde'
          DataSource = dsAdmissoes
          Items.Strings = (
            'Sim'
            'N'#227'o')
          ParentBackground = True
          TabOrder = 11
          TabStop = True
          Values.Strings = (
            '1'
            '0')
        end
      end
    end
    object tbsAdmissoes: TTabSheet
      Caption = 'CONTRATA'#199#195'O'
      ImageIndex = 8
    end
    object TabSheet8: TTabSheet
      Caption = 'FORMA'#199#195'O ACAD'#202'MICA'
      ImageIndex = 4
      object pgFormacao: TPageControl
        Left = 0
        Top = 22
        Width = 1020
        Height = 491
        ActivePage = TabSheet10
        Align = alClient
        MultiLine = True
        TabOrder = 0
        TabPosition = tpBottom
        TabWidth = 120
        OnChange = pgFormacaoChange
        object TabSheet10: TTabSheet
          Caption = 'T'#237'tulos Acad'#234'micos'
          object DBGrid4: TDBGrid
            Left = 0
            Top = 0
            Width = 1012
            Height = 328
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
                Title.Caption = 'Ano Conclus'#227'o'
                Width = 88
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'descArea'
                Title.Caption = #193'rea do Conhecimento'
                Width = 216
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'vl_horas'
                Title.Caption = 'Carga Hor'#225'ria'
                Visible = True
              end>
          end
          object Panel12: TPanel
            Left = 0
            Top = 328
            Width = 1012
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
              TabOrder = 9
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
              TabOrder = 8
            end
            object DBLookupComboBox9: TDBLookupComboBox
              Left = 608
              Top = 104
              Width = 145
              Height = 21
              DataField = 'descEstado'
              DataSource = dsProfTitulos
              TabOrder = 10
            end
            object DBEdit10: TDBEdit
              Left = 680
              Top = 64
              Width = 73
              Height = 21
              DataField = 'vl_horas'
              DataSource = dsProfTitulos
              TabOrder = 6
            end
            object DBEdit11: TDBEdit
              Left = 8
              Top = 104
              Width = 304
              Height = 21
              DataField = 'ds_titulo_trabalho'
              DataSource = dsProfTitulos
              TabOrder = 7
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
            Top = 328
            Width = 1012
            Height = 137
            Align = alBottom
            BevelOuter = bvLowered
            TabOrder = 0
            inline Frame_Prof_Ativ_031: Tfrm_Professores_Ativ_03
              Left = 1
              Top = 1
              Width = 1010
              Height = 135
              Align = alClient
              TabOrder = 1
              TabStop = True
              ExplicitLeft = 1
              ExplicitTop = 1
              ExplicitWidth = 1010
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
              Width = 1010
              Height = 135
              Align = alClient
              TabOrder = 2
              TabStop = True
              ExplicitLeft = 1
              ExplicitTop = 1
              ExplicitWidth = 1010
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
              Width = 1010
              Height = 135
              Align = alClient
              TabOrder = 3
              TabStop = True
              ExplicitLeft = 1
              ExplicitTop = 1
              ExplicitWidth = 1010
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
              Width = 1010
              Height = 135
              Align = alClient
              TabOrder = 4
              TabStop = True
              ExplicitLeft = 1
              ExplicitTop = 1
              ExplicitWidth = 1010
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
              Width = 1010
              Height = 135
              Align = alClient
              TabOrder = 5
              TabStop = True
              ExplicitLeft = 1
              ExplicitTop = 1
              ExplicitWidth = 1010
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
              Width = 1010
              Height = 135
              Align = alClient
              TabOrder = 6
              TabStop = True
              ExplicitLeft = 1
              ExplicitTop = 1
              ExplicitWidth = 1010
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
              Width = 1010
              Height = 135
              Align = alClient
              TabOrder = 7
              TabStop = True
              ExplicitLeft = 1
              ExplicitTop = 1
              ExplicitWidth = 1010
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
              Width = 1010
              Height = 135
              Align = alClient
              TabOrder = 8
              TabStop = True
              ExplicitLeft = 1
              ExplicitTop = 1
              ExplicitWidth = 1010
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
              Width = 1010
              Height = 135
              Align = alClient
              TabOrder = 9
              TabStop = True
              ExplicitLeft = 1
              ExplicitTop = 1
              ExplicitWidth = 1010
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
              Width = 1010
              Height = 135
              Align = alClient
              TabOrder = 0
              TabStop = True
              ExplicitLeft = 1
              ExplicitTop = 1
              ExplicitWidth = 1010
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
            Width = 1012
            Height = 328
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
        Width = 1020
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
      object dbgDocumentos: TDBGrid
        Left = 0
        Top = 22
        Width = 1020
        Height = 491
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
        Width = 1020
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
  object toolExperiencia: TToolBar [3]
    Left = 0
    Top = 694
    Width = 1028
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
    Top = 669
    Width = 1028
    Height = 25
    Align = alBottom
    ButtonWidth = 84
    EdgeBorders = [ebTop, ebBottom]
    Images = ImageList1
    List = True
    ShowCaptions = True
    TabOrder = 4
    Visible = False
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
    Top = 644
    Width = 1028
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
    Top = 619
    Width = 1028
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
    Top = 594
    Width = 1028
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
  object toolDocumentos: TToolBar [8]
    Left = 0
    Top = 569
    Width = 1028
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
    Left = 944
    Top = 456
  end
  inherited tblPessoa: TUMZQuery
    Left = 51
    Top = 483
    object tblPessoadescRaca: TStringField
      FieldKind = fkLookup
      FieldName = 'descRaca'
      LookupDataSet = qyRacas
      LookupKeyFields = 'cd_situacao'
      LookupResultField = 'ds_valor'
      KeyFields = 'cd_raca'
      Lookup = True
    end
  end
  inherited dsPessoa: TDataSource
    Left = 83
    Top = 484
  end
  inherited tblEstadosCivis: TZTable
    Left = 51
    Top = 387
  end
  inherited AbrirFoto: TSavePictureDialog
    Left = 944
    Top = 424
  end
  inherited tblTpLogradouro: TUMZQuery
    Left = 51
    Top = 360
  end
  inherited tblMunicipios: TUMZQuery
    Left = 80
    Top = 360
  end
  inherited tblMunicipioAtual: TUMZQuery
    Left = 112
    Top = 360
  end
  inherited tblPaises: TZTable
    Left = 144
    Top = 360
  end
  inherited tblContatosPadroes: TUMZQuery
    Left = 844
  end
  inherited tblOrgaos: TUMZQuery
    Left = 775
    Top = 413
  end
  inherited qryPessoaUpdatePraca: TUMZQuery
    Left = 816
    Top = 48
  end
  inherited qryPessoaUpdateMunicipio: TUMZQuery
    Left = 852
    Top = 48
  end
  inherited qryPessoaUpdateMunNasc: TUMZQuery
    Left = 784
    Top = 48
  end
  inherited imgListFoto: TImageList
    Left = 944
    Top = 496
  end
  object tblExperiencia: TZTable [24]
    Connection = DM.db
    SortedFields = 'cd_pessoa'
    AfterPost = tblExperienciaAfterPost
    OnNewRecord = tblExperienciaNewRecord
    TableName = 'funcionarios_experiencia'
    MasterFields = 'cd_pessoa'
    MasterSource = dsPessoa
    LinkedFields = 'CD_PESSOA'
    IndexFieldNames = 'cd_pessoa Asc'
    Left = 893
    Top = 76
    object tblExperienciacd_experiencia: TIntegerField
      FieldName = 'cd_experiencia'
    end
    object tblExperienciacd_pessoa: TIntegerField
      DisplayLabel = 'Cod. Pessoa'
      FieldName = 'cd_pessoa'
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
    object tblExperienciadt_inicial_periodo: TDateTimeField
      FieldName = 'dt_inicial_periodo'
      DisplayFormat = 'dd/mm/yyyy'
      EditMask = '!99/99/9999;1;_'
    end
    object tblExperienciadt_final_periodo: TDateTimeField
      FieldName = 'dt_final_periodo'
      DisplayFormat = 'dd/mm/yyyy'
      EditMask = '!99/99/9999;1;_'
    end
  end
  object dsExperiencia: TDataSource [25]
    DataSet = tblExperiencia
    OnStateChange = dsExperienciaStateChange
    OnDataChange = dsExperienciaDataChange
    Left = 927
    Top = 76
  end
  object dsDedicacao: TDataSource [26]
    DataSet = tblDedicacao
    OnStateChange = dsDedicacaoStateChange
    Left = 927
    Top = 104
  end
  object tblAdmissoes: TZTable [27]
    Connection = DM.db
    SortedFields = 'cd_pessoa'
    AfterPost = tblAdmissoesAfterPost
    OnNewRecord = tblAdmissoesNewRecord
    TableName = 'funcionarios_admissoes'
    MasterFields = 'cd_pessoa'
    MasterSource = dsPessoa
    LinkedFields = 'CD_PESSOA'
    IndexFieldNames = 'cd_pessoa Asc'
    Left = 891
    Top = 132
    object tblAdmissoescd_admissao: TIntegerField
      FieldName = 'cd_admissao'
    end
    object tblAdmissoescd_pessoa: TIntegerField
      DisplayLabel = 'Cod. Pessoa'
      FieldName = 'cd_pessoa'
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
      EditMask = '!99/99/0000;1;_'
    end
    object tblAdmissoesdt_saida: TDateTimeField
      DisplayLabel = 'Data Sa'#237'da'
      FieldName = 'dt_saida'
      DisplayFormat = 'dd/mm/yyyy'
      EditMask = '!99/99/0000;1;_'
    end
    object tblAdmissoessn_temporario: TSmallintField
      FieldName = 'sn_temporario'
    end
    object tblAdmissoessn_bolsa_pesquisa: TSmallintField
      FieldName = 'sn_bolsa_pesquisa'
    end
    object tblAdmissoescd_situacao_doc: TIntegerField
      FieldName = 'cd_situacao_doc'
    end
    object tblAdmissoessn_sequencial: TSmallintField
      FieldName = 'sn_sequencial'
    end
    object tblAdmissoessn_graduacao_presencial: TSmallintField
      FieldName = 'sn_graduacao_presencial'
    end
    object tblAdmissoessn_graduacao_distancia: TSmallintField
      FieldName = 'sn_graduacao_distancia'
    end
    object tblAdmissoessn_pos_presencial: TSmallintField
      FieldName = 'sn_pos_presencial'
    end
    object tblAdmissoessn_pos_distancia: TSmallintField
      FieldName = 'sn_pos_distancia'
    end
    object tblAdmissoessn_pesquisa: TSmallintField
      FieldName = 'sn_pesquisa'
    end
    object tblAdmissoessn_extensao: TSmallintField
      FieldName = 'sn_extensao'
    end
    object tblAdmissoessn_gestao: TIntegerField
      FieldName = 'sn_gestao'
    end
    object tblAdmissoessn_membro_cpa: TSmallintField
      FieldName = 'sn_membro_cpa'
    end
    object tblAdmissoessn_membro_nde: TSmallintField
      FieldName = 'sn_membro_nde'
    end
    object tblAdmissoessn_coordenacao_nde: TSmallintField
      FieldName = 'sn_coordenacao_nde'
    end
  end
  object dsAdmissoes: TDataSource [28]
    DataSet = tblAdmissoes
    OnStateChange = dsAdmissoesStateChange
    OnDataChange = dsAdmissoesDataChange
    Left = 927
    Top = 132
  end
  object tblProfessor: TUMZQuery [29]
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
    Left = 739
    Top = 414
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
    object tblProfessorsn_coordena_ativo: TStringField
      FieldName = 'sn_coordena_ativo'
      Origin = 'WMESTRE12.professores.sn_coordena_ativo'
      FixedChar = True
      Size = 1
    end
    object tblProfessorcd_coligada: TSmallintField
      FieldName = 'cd_coligada'
    end
    object tblProfessornm_pessoa: TStringField
      FieldKind = fkLookup
      FieldName = 'nm_coligadas'
      LookupDataSet = DM.qryColigadas
      LookupKeyFields = 'CD_COLIGADA'
      LookupResultField = 'NM_COLIGADA'
      KeyFields = 'cd_coligada'
      Size = 150
      Lookup = True
    end
  end
  object dsProfessor: TDataSource [30]
    DataSet = tblProfessor
    OnStateChange = dsProfessorStateChange
    Left = 740
    Top = 378
  end
  object dsProfTitulos: TDataSource [31]
    DataSet = tblProfTitulos
    OnStateChange = dsProfTitulosStateChange
    Left = 844
    Top = 232
  end
  object tblProfAtividades: TZTable [32]
    Connection = DM.db
    SortedFields = 'cd_pessoa'
    AfterPost = tblProfAtividadesAfterPost
    OnNewRecord = tblProfAtividadesNewRecord
    TableName = 'professores_atividades'
    MasterFields = 'cd_pessoa'
    MasterSource = dsPessoa
    LinkedFields = 'CD_PESSOA'
    IndexFieldNames = 'cd_pessoa Asc'
    Left = 808
    Top = 302
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
  object dsProfAtividades: TDataSource [33]
    DataSet = tblProfAtividades
    OnStateChange = dsProfAtividadesStateChange
    OnDataChange = dsProfAtividadesDataChange
    Left = 844
    Top = 271
  end
  object tblCursos: TUMZQuery [34]
    Connection = DM.db
    SQL.Strings = (
      
        'select codigo, cast(descricao as char) as descricao from cursos ' +
        'group by codigo, descricao order by descricao')
    Params = <>
    SQLList.Strings = (
      
        'mysql=select codigo, cast(descricao as char) as descricao from c' +
        'ursos group by codigo, descricao order by descricao'#13#10
      
        'oracle=select codigo, cast(descricao as varchar(255)) as descric' +
        'ao from cursos group by codigo, descricao order by descricao')
    Left = 676
    Top = 334
    object tblCursoscodigo: TStringField
      FieldName = 'codigo'
      Required = True
      Size = 15
    end
    object tblCursosdescricao: TStringField
      FieldName = 'descricao'
      ReadOnly = True
      Size = 255
    end
  end
  object pmQtdExperiencia: TPopupMenu [35]
    OnPopup = pmQtdExperienciaPopup
    Left = 720
    Top = 264
  end
  object pmQtdDedicacao: TPopupMenu [36]
    OnPopup = pmQtdDedicacaoPopup
    Left = 809
    Top = 168
  end
  object pmQtdAdmissoes: TPopupMenu [37]
    OnPopup = pmQtdAdmissoesPopup
    Left = 776
    Top = 200
  end
  object pmQtdProfTitulos: TPopupMenu [38]
    OnPopup = pmQtdProfTitulosPopup
    Left = 776
    Top = 232
  end
  object pmQtdProfAtividades: TPopupMenu [39]
    OnPopup = pmQtdProfAtividadesPopup
    Left = 720
    Top = 230
  end
  inherited dsObsGerais: TDataSource
    Top = 272
  end
  inherited qryObsGerais: TUMZQuery
    Top = 272
  end
  inherited DelphiTwain1: TDelphiTwain
    Left = 723
    Top = 166
  end
  inherited qyPais: TUMZQuery
    Left = 691
    Top = 43
  end
  inherited qryNacionalidade: TUMZQuery
    Left = 640
    Top = 336
  end
  inherited qyVinculosExterno: TUMZQuery
    Left = 740
    Top = 336
  end
  inherited dsVinculoExterno: TDataSource
    Left = 776
    Top = 336
  end
  object qyRacas: TUMZQuery
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
    Left = 51
    Top = 452
  end
  object qryFuncionarioUpdateColigada: TUMZQuery
    Connection = DM.db
    SQL.Strings = (
      'UPDATE'
      '   PROFESSORES'
      'SET'
      '   CD_COLIGADA = :CD_COLIGADA'
      'WHERE'
      '   CD_PESSOA = :CD_PESSOA')
    Params = <
      item
        DataType = ftUnknown
        Name = 'CD_COLIGADA'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'CD_PESSOA'
        ParamType = ptUnknown
      end>
    Left = 844
    Top = 416
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'CD_COLIGADA'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'CD_PESSOA'
        ParamType = ptUnknown
      end>
  end
  object qryAreasProfessor: TUMZQuery
    Connection = DM.db
    SQL.Strings = (
      'SELECT'
      '   *'
      'FROM'
      '  professores_areas  pas'
      
        '  INNER JOIN professores_areas_escolhidas pae ON (pas.cd_area = ' +
        'pae.cd_area)'
      'WHERE '
      '  pae.cd_pessoa = :cd_pessoa'
      'ORDER BY'
      '  pas.ds_area')
    Params = <
      item
        DataType = ftUnknown
        Name = 'cd_pessoa'
        ParamType = ptUnknown
      end>
    Left = 844
    Top = 378
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'cd_pessoa'
        ParamType = ptUnknown
      end>
    object qryAreasProfessorcd_area: TIntegerField
      FieldName = 'cd_area'
      Required = True
    end
    object qryAreasProfessords_area: TStringField
      FieldName = 'ds_area'
      Required = True
      Size = 255
    end
    object qryAreasProfessorcd_pessoa: TLargeintField
      FieldName = 'cd_pessoa'
    end
  end
  object dsAreasProfessores: TDataSource
    DataSet = qryAreasProfessor
    Left = 775
    Top = 376
  end
  object qryInsereAreas: TUMZQuery
    Connection = DM.db
    SQL.Strings = (
      'SELECT'
      '  *'
      'FROM'
      '   professores_areas_escolhidas')
    Params = <>
    Left = 808
    Top = 376
    object qryInsereAreascd_pessoa: TLargeintField
      FieldName = 'cd_pessoa'
    end
    object qryInsereAreascd_area: TLargeintField
      FieldName = 'cd_area'
    end
  end
  object tblProfTitulos: TUMZQuery
    Connection = DM.db
    OnNewRecord = tblProfTitulosNewRecord
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
        DataType = ftUnknown
        Name = 'cd_pessoa'
        ParamType = ptUnknown
      end>
    Left = 808
    Top = 235
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'cd_pessoa'
        ParamType = ptUnknown
      end>
    object tblProfTituloscd_titulo_professor: TIntegerField
      FieldName = 'cd_titulo_professor'
    end
    object tblProfTituloscd_pessoa: TIntegerField
      FieldName = 'cd_pessoa'
    end
    object tblProfTituloscd_titulacao: TSmallintField
      FieldName = 'cd_titulacao'
    end
    object tblProfTitulosds_curso: TStringField
      FieldName = 'ds_curso'
      Size = 100
    end
    object tblProfTitulosvl_ano: TSmallintField
      FieldName = 'vl_ano'
    end
    object tblProfTituloscd_instituicao: TIntegerField
      FieldName = 'cd_instituicao'
    end
    object tblProfTituloscd_area: TSmallintField
      FieldName = 'cd_area'
    end
    object tblProfTitulosds_titulo_trabalho: TStringField
      FieldName = 'ds_titulo_trabalho'
      Size = 200
    end
    object tblProfTitulosds_conceito: TStringField
      FieldName = 'ds_conceito'
      Size = 10
    end
    object tblProfTitulosds_habilitacao: TStringField
      FieldName = 'ds_habilitacao'
      Size = 50
    end
    object tblProfTitulosds_local: TStringField
      FieldName = 'ds_local'
      Size = 100
    end
    object tblProfTitulosds_estado: TStringField
      FieldName = 'ds_estado'
      Size = 3
    end
    object tblProfTitulosvl_horas: TFloatField
      FieldName = 'vl_horas'
    end
    object tblProfTitulosdescEstado: TStringField
      FieldKind = fkLookup
      FieldName = 'descEstado'
      LookupDataSet = DM.tblEstados
      LookupKeyFields = 'ds_uf'
      LookupResultField = 'ds_estado'
      KeyFields = 'ds_estado'
      Size = 255
      Lookup = True
    end
    object tblProfTitulosdescTitulacao: TStringField
      FieldKind = fkLookup
      FieldName = 'descTitulacao'
      LookupDataSet = DM.tblTitulacoes
      LookupKeyFields = 'cd_titulacao'
      LookupResultField = 'ds_titulacao'
      KeyFields = 'cd_titulacao'
      Size = 255
      Lookup = True
    end
    object tblProfTitulosdescInstituicao: TStringField
      FieldKind = fkLookup
      FieldName = 'descInstituicao'
      LookupDataSet = DM.tblInstituicoes
      LookupKeyFields = 'cd_instituicao'
      LookupResultField = 'nm_instituicao'
      KeyFields = 'cd_instituicao'
      Size = 255
      Lookup = True
    end
    object tblProfTitulosdescArea: TStringField
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
  object tblDedicacao: TUMZQuery
    Connection = DM.db
    OnNewRecord = tblDedicacaoNewRecord
    SQL.Strings = (
      'SELECT'
      '   cd_pessoa,'
      '   cd_dedicacao,'
      '   cd_tipo_atuacao,'
      '   cd_curso,'
      '   ds_atividade,'
      '   vl_horas,'
      '   vl_anosemestre,'
      '   cd_atividade,'
      '   cd_instituicao,'
      '   ds_local,'
      '   dt_inicial_periodo,'
      '   dt_final_periodo'
      'FROM'
      '   funcionarios_dedicacao'
      'WHERE'
      '   cd_pessoa = :cd_pessoa'
      'ORDER BY '
      '   cd_pessoa ASC')
    Params = <
      item
        DataType = ftUnknown
        Name = 'cd_pessoa'
        ParamType = ptUnknown
      end>
    Left = 892
    Top = 103
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'cd_pessoa'
        ParamType = ptUnknown
      end>
    object tblDedicacaocd_pessoa: TIntegerField
      FieldName = 'cd_pessoa'
    end
    object tblDedicacaocd_dedicacao: TIntegerField
      FieldName = 'cd_dedicacao'
    end
    object tblDedicacaocd_tipo_atuacao: TSmallintField
      FieldName = 'cd_tipo_atuacao'
    end
    object tblDedicacaocd_curso: TStringField
      FieldName = 'cd_curso'
      Size = 15
    end
    object tblDedicacaods_atividade: TStringField
      FieldName = 'ds_atividade'
      Size = 50
    end
    object tblDedicacaovl_horas: TFloatField
      FieldName = 'vl_horas'
    end
    object tblDedicacaovl_anosemestre: TSmallintField
      DisplayWidth = 5
      FieldName = 'vl_anosemestre'
    end
    object tblDedicacaodescCursos: TStringField
      FieldKind = fkLookup
      FieldName = 'descCurso'
      LookupDataSet = tblCursos
      LookupKeyFields = 'codigo'
      LookupResultField = 'descricao'
      KeyFields = 'cd_curso'
      Size = 255
      Lookup = True
    end
    object tblDedicacaodescAtuacao: TStringField
      FieldKind = fkLookup
      FieldName = 'descAtuacao'
      LookupDataSet = DM.tblFuncTipoAtuacao
      LookupKeyFields = 'cd_tipo_atuacao'
      LookupResultField = 'ds_tipo_atuacao'
      KeyFields = 'cd_tipo_atuacao'
      Size = 255
      Lookup = True
    end
    object tblDedicacaocd_atividade: TIntegerField
      FieldName = 'cd_atividade'
    end
    object tblDedicacaodescAtividade: TStringField
      FieldKind = fkLookup
      FieldName = 'descAtividade'
      LookupDataSet = DM.tblProf_Tipo_Atividade
      LookupKeyFields = 'cd_ativadade'
      LookupResultField = 'ds_atividade'
      KeyFields = 'cd_atividade'
      Lookup = True
    end
    object tblDedicacaocd_instituicao: TIntegerField
      FieldName = 'cd_instituicao'
    end
    object tblDedicacaodescInstituicao: TStringField
      FieldKind = fkLookup
      FieldName = 'descInstituicao'
      LookupDataSet = DM.tblInstituicoes
      LookupKeyFields = 'cd_instituicao'
      LookupResultField = 'nm_instituicao'
      KeyFields = 'cd_instituicao'
      Size = 255
      Lookup = True
    end
    object tblDedicacaods_local: TStringField
      FieldName = 'ds_local'
      Size = 100
    end
    object tblDedicacaodt_final_periodo: TDateField
      FieldName = 'dt_final_periodo'
      DisplayFormat = 'dd/mm/yyyy'
      EditMask = '!99/99/9999;1;_'
    end
    object tblDedicacaodt_inicial_periodo: TDateField
      FieldName = 'dt_inicial_periodo'
      DisplayFormat = 'dd/mm/yyyy'
      EditMask = '!99/99/9999;1;_'
    end
  end
  object qryProfessoresUnidades: TUMZQuery
    Connection = DM.db
    BeforeOpen = qryProfessoresUnidadesBeforeOpen
    SQL.Strings = (
      'SELECT'
      
        '   pu.cd_professor , pu.sn_funcionario, pu.sn_professor , pu.sn_' +
        'orientador, c.cd_coligada,c.nm_coligada'
      'FROM'
      '   coligadas c '
      
        '   LEFT JOIN professores_unidades pu ON (c.cd_coligada = pu.cd_c' +
        'oligada and cd_professor = :cd_professor)'
      'WHERE'
      '  c.cd_coligada in (%s)'
      'ORDER BY'
      '   c.nm_coligada')
    Params = <
      item
        DataType = ftUnknown
        Name = 'cd_professor'
        ParamType = ptUnknown
      end>
    Left = 844
    Top = 344
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'cd_professor'
        ParamType = ptUnknown
      end>
    object qryProfessoresUnidadescd_professor: TIntegerField
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
    object qryProfessoresUnidadescd_coligada: TSmallintField
      FieldName = 'cd_coligada'
      Required = True
    end
    object qryProfessoresUnidadesnm_coligada: TStringField
      FieldName = 'nm_coligada'
      Size = 50
    end
  end
  object dsProfessorUnidade: TDataSource
    DataSet = qryProfessoresUnidades
    Left = 843
    Top = 304
  end
  object tblSituacoes: TUMZQuery
    Connection = DM.db
    SQL.Strings = (
      'SELECT'
      '   *'
      'FROM'
      '   situacoes'
      'WHERE'
      '   cd_modulo = 1057')
    Params = <>
    Left = 709
    Top = 336
    object tblSituacoescd_situacao: TIntegerField
      FieldName = 'cd_situacao'
      Origin = 'WMESTRE12.situacoes.cd_situacao'
    end
    object tblSituacoesds_valor: TStringField
      FieldName = 'ds_valor'
      Origin = 'WMESTRE12.situacoes.ds_valor'
      Size = 255
    end
  end
  object dsSituacoes: TDataSource
    DataSet = tblSituacoes
    Left = 709
    Top = 376
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
    Left = 720
    Top = 197
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
