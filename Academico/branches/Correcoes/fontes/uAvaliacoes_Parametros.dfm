object frm_Avaliacoes_parametros: Tfrm_Avaliacoes_parametros
  Left = 192
  Top = 97
  Caption = 'Par'#226'metros de Avalia'#231#245'es'
  ClientHeight = 882
  ClientWidth = 956
  Color = clBtnFace
  Font.Charset = ANSI_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Arial'
  Font.Style = []
  FormStyle = fsMDIChild
  KeyPreview = True
  OldCreateOrder = True
  Position = poDefault
  ShowHint = True
  Visible = True
  WindowState = wsMaximized
  OnClose = FormClose
  OnCreate = FormCreate
  OnKeyDown = FormKeyDown
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 14
  object Bevel3: TBevel
    Left = 475
    Top = 25
    Width = 11
    Height = 823
    Align = alLeft
    Shape = bsSpacer
    ExplicitLeft = 473
    ExplicitTop = 28
    ExplicitHeight = 931
  end
  object Bevel7: TBevel
    Left = 0
    Top = 848
    Width = 956
    Height = 9
    Align = alBottom
    Shape = bsSpacer
    ExplicitTop = 507
    ExplicitWidth = 792
  end
  object Panel3: TPanel
    Left = 0
    Top = 0
    Width = 956
    Height = 25
    Align = alTop
    BevelOuter = bvLowered
    Caption = 'PAR'#194'METROS DE AVALIA'#199#213'ES'
    Color = clBlue
    Font.Charset = ANSI_CHARSET
    Font.Color = clWhite
    Font.Height = -13
    Font.Name = 'Arial'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 0
  end
  object Panel1: TPanel
    Left = 486
    Top = 25
    Width = 470
    Height = 823
    Align = alClient
    BevelOuter = bvNone
    Caption = 'Panel1'
    TabOrder = 1
    object Bevel5: TBevel
      Left = 0
      Top = 0
      Width = 470
      Height = 15
      Align = alTop
      Shape = bsSpacer
      ExplicitWidth = 324
    end
    object grd: TDBGrid
      Left = 0
      Top = 40
      Width = 470
      Height = 783
      Align = alClient
      BorderStyle = bsNone
      DataSource = dsAvaliacoes
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Arial'
      Font.Style = []
      Options = [dgTitles, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgAlwaysShowSelection, dgConfirmDelete, dgCancelOnExit]
      ParentFont = False
      PopupMenu = pmQtd
      TabOrder = 0
      TitleFont.Charset = ANSI_CHARSET
      TitleFont.Color = clWindowText
      TitleFont.Height = -11
      TitleFont.Name = 'Arial'
      TitleFont.Style = []
      OnCellClick = grdCellClick
      Columns = <
        item
          Expanded = False
          FieldName = 'cd_avaliacao'
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'ds_avaliacao'
          Width = 400
          Visible = True
        end>
    end
    object Panel2: TPanel
      Left = 0
      Top = 15
      Width = 470
      Height = 25
      Align = alTop
      BevelOuter = bvLowered
      Caption = 'AVALIA'#199#213'ES CADASTRADAS'
      Color = clBlue
      Font.Charset = ANSI_CHARSET
      Font.Color = clWhite
      Font.Height = -13
      Font.Name = 'Arial'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 1
    end
  end
  object toolPessoa: TToolBar
    Left = 0
    Top = 857
    Width = 956
    Height = 25
    Align = alBottom
    ButtonWidth = 110
    Caption = 'toolPessoa'
    EdgeBorders = [ebTop, ebBottom]
    Images = ImageList1
    List = True
    ShowCaptions = True
    TabOrder = 2
    object ToolButton1: TToolButton
      Left = 0
      Top = 0
      Width = 8
      Caption = 'ToolButton1'
      ImageIndex = 9
      Style = tbsSeparator
    end
    object btnInserir: TToolButton
      Left = 8
      Top = 0
      Caption = 'F2 Incluir'
      ImageIndex = 0
      OnClick = btnInserirClick
    end
    object btnAlterar: TToolButton
      Left = 118
      Top = 0
      Caption = 'F3 Alterar'
      ImageIndex = 1
      OnClick = btnAlterarClick
    end
    object btnExcluir: TToolButton
      Left = 228
      Top = 0
      Caption = 'F9 Excluir'
      ImageIndex = 2
      OnClick = btnExcluirClick
    end
    object ToolButton4: TToolButton
      Left = 338
      Top = 0
      Width = 8
      Caption = 'ToolButton4'
      ImageIndex = 3
      Style = tbsSeparator
    end
    object btnSalvar: TToolButton
      Left = 346
      Top = 0
      Caption = 'F5 Salvar'
      ImageIndex = 3
      OnClick = btnSalvarClick
    end
    object btnCancelar: TToolButton
      Left = 456
      Top = 0
      Caption = 'F6 Cancelar'
      ImageIndex = 4
      OnClick = btnCancelarClick
    end
    object ToolButton2: TToolButton
      Left = 566
      Top = 0
      Width = 8
      Caption = 'ToolButton2'
      ImageIndex = 8
      Style = tbsSeparator
    end
    object btnCopiaParametro: TToolButton
      Left = 574
      Top = 0
      Caption = 'Copiar par'#226'metro'
      ImageIndex = 8
      Style = tbsTextButton
      OnClick = btnCopiaParametroClick
    end
    object btnFechar: TToolButton
      Left = 684
      Top = 0
      Caption = 'F12 Fechar'
      ImageIndex = 7
      OnClick = btnFecharClick
    end
    object ToolButton5: TToolButton
      Left = 794
      Top = 0
      Width = 11
      Caption = 'ToolButton5'
      ImageIndex = 9
      Style = tbsSeparator
    end
  end
  object Panel5: TPanel
    Left = 0
    Top = 25
    Width = 475
    Height = 823
    Align = alLeft
    BevelOuter = bvNone
    TabOrder = 3
    object pgParametros: TPageControl
      Left = 0
      Top = 69
      Width = 475
      Height = 754
      ActivePage = tsDiarioOnline2
      Align = alClient
      TabOrder = 0
      object tsMedia1: TTabSheet
        Caption = 'M'#233'dia 1'
        object ScrollBox1: TScrollBox
          Left = 0
          Top = 0
          Width = 467
          Height = 725
          HorzScrollBar.Visible = False
          Align = alClient
          BevelInner = bvNone
          BevelOuter = bvNone
          TabOrder = 0
          object Label3: TLabel
            Left = 8
            Top = 8
            Width = 131
            Height = 14
            Caption = 'Nr. de Avalia'#231#245'es na Etapa'
            FocusControl = DBEdit3
          end
          object Label4: TLabel
            Left = 24
            Top = 144
            Width = 184
            Height = 14
            Caption = 'Condi'#231#227'o para Aplicar a Recupera'#231#227'o'
            FocusControl = DBEdit4
          end
          object Label5: TLabel
            Left = 24
            Top = 192
            Width = 121
            Height = 14
            Caption = 'F'#243'rmula da Recupera'#231#227'o'
            FocusControl = DBEdit5
          end
          object Label6: TLabel
            Left = 8
            Top = 240
            Width = 115
            Height = 14
            Caption = 'F'#243'rmula da M'#233'dia Anual'
          end
          object Label7: TLabel
            Left = 5
            Top = 400
            Width = 109
            Height = 14
            Caption = 'F'#243'rmula da M'#233'dia Final'
            FocusControl = DBEdit7
          end
          object Label12: TLabel
            Left = 164
            Top = 9
            Width = 64
            Height = 14
            Caption = 'Periodicidade'
          end
          object sbConceitos: TSpeedButton
            Left = 197
            Top = 82
            Width = 18
            Height = 18
            Hint = 'Intervalos de notas por conceito'
            Flat = True
            Glyph.Data = {
              DE000000424DDE00000000000000360000002800000008000000070000000100
              180000000000A8000000C30E0000C30E00000000000000000000E3DFE0E3DFE0
              E3DFE0E3DFE0E3DFE0001FFFE3DFE0E3DFE0E3DFE0E3DFE0E3DFE0E3DFE0001F
              FF001FFF001FFFE3DFE0E3DFE0E3DFE0E3DFE0001FFF001FFF001FFF001FFF00
              1FFFE3DFE0E3DFE0E3DFE0E3DFE0E3DFE0001FFFE3DFE0E3DFE0E3DFE0E3DFE0
              E3DFE0E3DFE0E3DFE0E3DFE0E3DFE0E3DFE0E3DFE0E3DFE0E3DFE0E3DFE0001F
              FFE3DFE0E3DFE0E3DFE0001FFFE3DFE0001FFFE3DFE0E3DFE0E3DFE0E3DFE0E3
              DFE0}
            ParentShowHint = False
            ShowHint = True
            OnClick = sbConceitosClick
          end
          object Label40: TLabel
            Left = 8
            Top = 356
            Width = 156
            Height = 14
            Caption = 'F'#243'rmula da Prova Interdisciplinar'
            FocusControl = DBEdit30
          end
          object Shape1: TShape
            Left = 0
            Top = 114
            Width = 465
            Height = 1
            Margins.Left = 0
            Margins.Top = 0
            Margins.Right = 0
            Margins.Bottom = 0
            Brush.Color = clBtnFace
            Pen.Color = clGray
          end
          object sbComportamentos: TSpeedButton
            Left = 425
            Top = 73
            Width = 18
            Height = 18
            Hint = 'Informar comportamentos'
            Flat = True
            Glyph.Data = {
              DE000000424DDE00000000000000360000002800000008000000070000000100
              180000000000A8000000C30E0000C30E00000000000000000000E3DFE0E3DFE0
              E3DFE0E3DFE0E3DFE0001FFFE3DFE0E3DFE0E3DFE0E3DFE0E3DFE0E3DFE0001F
              FF001FFF001FFFE3DFE0E3DFE0E3DFE0E3DFE0001FFF001FFF001FFF001FFF00
              1FFFE3DFE0E3DFE0E3DFE0E3DFE0E3DFE0001FFFE3DFE0E3DFE0E3DFE0E3DFE0
              E3DFE0E3DFE0E3DFE0E3DFE0E3DFE0E3DFE0E3DFE0E3DFE0E3DFE0E3DFE0001F
              FFE3DFE0E3DFE0E3DFE0001FFFE3DFE0001FFFE3DFE0E3DFE0E3DFE0E3DFE0E3
              DFE0}
            ParentShowHint = False
            ShowHint = True
            OnClick = sbComportamentosClick
          end
          object DBEdit3: TDBEdit
            Left = 8
            Top = 24
            Width = 145
            Height = 22
            DataField = 'nr_avaliacoes'
            DataSource = dsAvaliacoes
            TabOrder = 0
          end
          object DBCheckBox3: TDBCheckBox
            Left = 8
            Top = 56
            Width = 121
            Height = 17
            Caption = 'Avalia'#231#227'o por Notas'
            DataField = 'sn_notas'
            DataSource = dsAvaliacoes
            TabOrder = 1
            ValueChecked = 'S'
            ValueUnchecked = 'N'
          end
          object DBCheckBox1: TDBCheckBox
            Left = 8
            Top = 120
            Width = 225
            Height = 17
            Caption = 'Aplicar Nota de Recupera'#231#227'o por per'#237'odo'
            DataField = 'sn_recuperacao'
            DataSource = dsAvaliacoes
            TabOrder = 2
            ValueChecked = 'S'
            ValueUnchecked = 'N'
          end
          object DBEdit4: TDBEdit
            Left = 24
            Top = 160
            Width = 401
            Height = 22
            DataField = 'ds_cond_recuperacao'
            DataSource = dsAvaliacoes
            TabOrder = 3
          end
          object DBEdit5: TDBEdit
            Left = 24
            Top = 208
            Width = 401
            Height = 22
            DataField = 'ds_formula_recuperacao'
            DataSource = dsAvaliacoes
            TabOrder = 4
          end
          object DBMemo1: TDBMemo
            Left = 8
            Top = 256
            Width = 417
            Height = 22
            DataField = 'ds_formula_media_anual'
            DataSource = dsAvaliacoes
            TabOrder = 5
          end
          object DBCheckBox2: TDBCheckBox
            Left = 8
            Top = 288
            Width = 225
            Height = 17
            Caption = 'Frequencia Global para Aprova'#231#227'o'
            DataField = 'sn_frequencia_global'
            DataSource = dsAvaliacoes
            TabOrder = 6
            ValueChecked = 'S'
            ValueUnchecked = 'N'
          end
          object DBCheckBox4: TDBCheckBox
            Left = 8
            Top = 333
            Width = 201
            Height = 17
            Caption = 'Aplicar nota de Prova Interdisciplinar'
            DataField = 'sn_pi'
            DataSource = dsAvaliacoes
            TabOrder = 7
            ValueChecked = 'S'
            ValueUnchecked = 'N'
          end
          object DBEdit7: TDBEdit
            Left = 8
            Top = 416
            Width = 417
            Height = 22
            DataField = 'ds_formula_media_final'
            DataSource = dsAvaliacoes
            TabOrder = 9
          end
          object DBCheckBox5: TDBCheckBox
            Left = 8
            Top = 74
            Width = 177
            Height = 17
            Caption = 'Avalia'#231#227'o por Conceito - M'#233'dias'
            DataField = 'sn_conceitos'
            DataSource = dsAvaliacoes
            TabOrder = 10
            ValueChecked = 'S'
            ValueUnchecked = 'N'
          end
          object DBCheckBox6: TDBCheckBox
            Left = 255
            Top = 56
            Width = 129
            Height = 17
            Caption = 'Avalia'#231#227'o Descritiva'
            DataField = 'sn_descricao'
            DataSource = dsAvaliacoes
            TabOrder = 11
            ValueChecked = 'S'
            ValueUnchecked = 'N'
          end
          object DBLookupComboBox3: TDBLookupComboBox
            Left = 164
            Top = 24
            Width = 257
            Height = 22
            Hint = 'Periodicidade das avalia'#231#245'es por etapa'
            DataField = 'descPeriodoAvaliacoes'
            DataSource = dsAvaliacoes
            TabOrder = 12
          end
          object pnConceitos: TPanel
            Left = 30
            Top = 106
            Width = 185
            Height = 200
            BevelInner = bvLowered
            TabOrder = 13
            Visible = False
            object DBGrid1: TDBGrid
              Left = 2
              Top = 2
              Width = 181
              Height = 196
              Align = alClient
              DataSource = dsConceitos
              TabOrder = 0
              TitleFont.Charset = ANSI_CHARSET
              TitleFont.Color = clWindowText
              TitleFont.Height = -11
              TitleFont.Name = 'Arial'
              TitleFont.Style = []
              OnKeyDown = DBGrid1KeyDown
              Columns = <
                item
                  Expanded = False
                  FieldName = 'nr_inicial'
                  Title.Caption = 'Nt. inicial'
                  Width = 47
                  Visible = True
                end
                item
                  Expanded = False
                  FieldName = 'nr_final'
                  Title.Caption = 'Nt. final'
                  Width = 47
                  Visible = True
                end
                item
                  Expanded = False
                  FieldName = 'ds_conceito'
                  Title.Caption = 'Conceito'
                  Width = 47
                  Visible = True
                end>
            end
          end
          object DBEdit30: TDBEdit
            Left = 8
            Top = 372
            Width = 417
            Height = 22
            DataField = 'ds_formula_pi'
            DataSource = dsAvaliacoes
            TabOrder = 8
          end
          object DBCheckBox21: TDBCheckBox
            Left = 8
            Top = 92
            Width = 183
            Height = 17
            Caption = 'Avalia'#231#227'o por Conceito - Parciais'
            DataField = 'sn_conceitos_parciais'
            DataSource = dsAvaliacoes
            TabOrder = 14
            ValueChecked = 'S'
            ValueUnchecked = 'N'
          end
          object DBCheckBox25: TDBCheckBox
            Left = 24
            Top = 309
            Width = 249
            Height = 17
            Caption = 'N'#227'o agrupar as aulas na visualiza'#231#227'o on-line'
            DataField = 'sn_agrupar_aulas_online'
            DataSource = dsAvaliacoes
            TabOrder = 15
            ValueChecked = '1'
            ValueUnchecked = '0'
          end
          object DBCheckBox43: TDBCheckBox
            Left = 255
            Top = 74
            Width = 170
            Height = 17
            Caption = 'Avalia'#231#227'o por Comportamento'
            DataField = 'sn_comportamento'
            DataSource = dsAvaliacoes
            TabOrder = 16
            ValueChecked = '1'
            ValueUnchecked = '0'
            OnClick = DBCheckBox43Click
            OnKeyDown = DBCheckBox43KeyDown
          end
          object pnComportamentos: TPanel
            Left = 255
            Top = 95
            Width = 185
            Height = 200
            BevelInner = bvLowered
            TabOrder = 17
            Visible = False
            object DBGrid2: TDBGrid
              Left = 2
              Top = 2
              Width = 181
              Height = 196
              Align = alClient
              DataSource = dsComportamentos
              TabOrder = 0
              TitleFont.Charset = ANSI_CHARSET
              TitleFont.Color = clWindowText
              TitleFont.Height = -11
              TitleFont.Name = 'Arial'
              TitleFont.Style = []
              OnKeyDown = DBGrid2KeyDown
              Columns = <
                item
                  Expanded = False
                  FieldName = 'ds_comportamento'
                  Title.Caption = 'Comportamento'
                  Width = 100
                  Visible = True
                end
                item
                  Expanded = False
                  FieldName = 'nr_ordem'
                  Title.Caption = 'Ordem'
                  Width = 40
                  Visible = True
                end>
            end
          end
        end
      end
      object tsMedia2: TTabSheet
        Caption = 'M'#233'dia 2'
        ImageIndex = 1
        object ScrollBox2: TScrollBox
          Left = 0
          Top = 0
          Width = 467
          Height = 725
          HorzScrollBar.Visible = False
          Align = alClient
          TabOrder = 0
          object Label13: TLabel
            Left = 5
            Top = 5
            Width = 158
            Height = 14
            Caption = 'Condi'#231#227'o para Aprova'#231#227'o Direta'
            FocusControl = DBEdit12
          end
          object Label14: TLabel
            Left = 5
            Top = 53
            Width = 163
            Height = 14
            Caption = 'Condi'#231#227'o para Reprova'#231#227'o Direta'
            FocusControl = DBEdit13
          end
          object Label8: TLabel
            Left = 20
            Top = 268
            Width = 171
            Height = 14
            Caption = 'F'#243'rmula da M'#233'dia Final ap'#243's Exame'
          end
          object Label9: TLabel
            Left = 20
            Top = 316
            Width = 185
            Height = 14
            Caption = 'Condi'#231#227'o para Aprova'#231#227'o com Exame'
            FocusControl = DBEdit9
          end
          object Label17: TLabel
            Left = 292
            Top = 316
            Width = 122
            Height = 14
            Caption = 'Nr. M'#225'ximo de Disciplinas'
            FocusControl = DBEdit16
          end
          object Label10: TLabel
            Left = 20
            Top = 534
            Width = 192
            Height = 14
            Caption = 'F'#243'rmula da M'#233'dia Ap'#243's Segunda '#201'poca'
            FocusControl = DBEdit10
          end
          object Label11: TLabel
            Left = 20
            Top = 579
            Width = 229
            Height = 14
            Caption = 'Condi'#231#227'o para Aprova'#231#227'o com Segunda '#201'poca'
            FocusControl = DBEdit11
          end
          object Label18: TLabel
            Left = 292
            Top = 579
            Width = 122
            Height = 14
            Caption = 'Nr. M'#225'ximo de Disciplinas'
            FocusControl = DBEdit17
          end
          object Label20: TLabel
            Left = 20
            Top = 364
            Width = 244
            Height = 14
            Caption = 'F'#243'rmula para calcular a nota necess'#225'ria no exame'
            FocusControl = DBEdit6
          end
          object Label21: TLabel
            Left = 20
            Top = 627
            Width = 288
            Height = 14
            Caption = 'Formula para calcular a nota necess'#225'ria da Segunda '#201'poca'
            FocusControl = DBEdit19
          end
          object lbAproDireta: TLabel
            Left = 5
            Top = 138
            Width = 142
            Height = 14
            Caption = 'Situa'#231#227'o de aprova'#231#227'o direta'
          end
          object lbAproExame: TLabel
            Left = 20
            Top = 460
            Width = 174
            Height = 14
            Caption = 'Situa'#231#227'o de aprova'#231#227'o ap'#243's exame'
          end
          object lbAprovSEpoca: TLabel
            Left = 20
            Top = 723
            Width = 185
            Height = 14
            Caption = 'Situa'#231#227'o de aprova'#231#227'o ap'#243's 2'#170' '#233'poca'
          end
          object bvlSep1: TBevel
            Left = 0
            Top = 236
            Width = 457
            Height = 3
            Shape = bsTopLine
          end
          object lblNomeExameEtapa: TLabel
            Left = 20
            Top = 412
            Width = 122
            Height = 14
            Caption = 'Nome do exame da etapa'
          end
          object bvlSep2: TBevel
            Left = 8
            Top = 508
            Width = 457
            Height = 3
            Shape = bsTopLine
          end
          object lblNomeExameEspecial: TLabel
            Left = 20
            Top = 675
            Width = 120
            Height = 14
            Caption = 'Nome do exame especial'
          end
          object lblTipoTitulo: TLabel
            Left = 20
            Top = 840
            Width = 125
            Height = 14
            Caption = 'Selecione o Tipo de T'#237'tulo:'
          end
          object bvlSep3: TBevel
            Left = 0
            Top = 882
            Width = 465
            Height = 25
            Align = alBottom
            Shape = bsSpacer
            ExplicitTop = 881
          end
          object lbReproDireta: TLabel
            Left = 214
            Top = 138
            Width = 146
            Height = 14
            Caption = 'Situa'#231#227'o de reprova'#231#227'o direta'
          end
          object lbReproExame: TLabel
            Left = 224
            Top = 460
            Width = 178
            Height = 14
            Caption = 'Situa'#231#227'o de reprova'#231#227'o ap'#243's exame'
          end
          object lbReproSEpoca: TLabel
            Left = 224
            Top = 723
            Width = 189
            Height = 14
            Caption = 'Situa'#231#227'o de reprova'#231#227'o ap'#243's 2'#170' '#233'poca'
          end
          object Label66: TLabel
            Left = 5
            Top = 184
            Width = 110
            Height = 14
            Caption = 'Situa'#231#227'o de conclus'#227'o'
          end
          object Label70: TLabel
            Left = 5
            Top = 97
            Width = 183
            Height = 14
            Caption = 'Condi'#231#227'o para Reprova'#231#227'o por Faltas'
            FocusControl = DBEdit36
          end
          object Label71: TLabel
            Left = 214
            Top = 184
            Width = 167
            Height = 14
            Caption = 'Situa'#231#227'o de reprova'#231#227'o por Faltas'
          end
          object DBEdit12: TDBEdit
            Left = 5
            Top = 25
            Width = 417
            Height = 22
            DataField = 'ds_cond_aprov_direta'
            DataSource = dsAvaliacoes
            TabOrder = 0
          end
          object DBEdit13: TDBEdit
            Left = 5
            Top = 70
            Width = 417
            Height = 22
            DataField = 'ds_cond_repro_direta'
            DataSource = dsAvaliacoes
            TabOrder = 1
          end
          object DBCheckBox7: TDBCheckBox
            Left = 5
            Top = 245
            Width = 201
            Height = 17
            Caption = 'Aplicar nota de Exame da Etapa'
            DataField = 'sn_exame'
            DataSource = dsAvaliacoes
            TabOrder = 5
            ValueChecked = 'S'
            ValueUnchecked = 'N'
          end
          object DBEdit8: TDBEdit
            Left = 20
            Top = 288
            Width = 398
            Height = 22
            DataField = 'ds_formula_media_exame'
            DataSource = dsAvaliacoes
            TabOrder = 6
          end
          object DBEdit16: TDBEdit
            Left = 292
            Top = 336
            Width = 129
            Height = 22
            DataField = 'nr_max_disci_exame'
            DataSource = dsAvaliacoes
            TabOrder = 8
          end
          object DBEdit9: TDBEdit
            Left = 20
            Top = 336
            Width = 260
            Height = 22
            DataField = 'ds_cond_aprov_exame'
            DataSource = dsAvaliacoes
            TabOrder = 7
          end
          object DBCheckBox8: TDBCheckBox
            Left = 5
            Top = 517
            Width = 201
            Height = 17
            Caption = 'Aplicar nota de Segunda '#201'poca'
            DataField = 'sn_segunda_epoca'
            DataSource = dsAvaliacoes
            TabOrder = 13
            ValueChecked = 'S'
            ValueUnchecked = 'N'
          end
          object DBEdit10: TDBEdit
            Left = 20
            Top = 551
            Width = 398
            Height = 22
            DataField = 'ds_formula_media_segunda'
            DataSource = dsAvaliacoes
            TabOrder = 14
          end
          object DBEdit11: TDBEdit
            Left = 20
            Top = 599
            Width = 262
            Height = 22
            DataField = 'ds_cond_aprov_segunda'
            DataSource = dsAvaliacoes
            TabOrder = 15
          end
          object DBEdit17: TDBEdit
            Left = 292
            Top = 599
            Width = 129
            Height = 22
            DataField = 'nr_max_disci_segunda'
            DataSource = dsAvaliacoes
            TabOrder = 16
          end
          object DBEdit6: TDBEdit
            Left = 20
            Top = 384
            Width = 398
            Height = 22
            DataField = 'ds_nota_exame'
            DataSource = dsAvaliacoes
            TabOrder = 9
          end
          object DBEdit19: TDBEdit
            Left = 20
            Top = 647
            Width = 398
            Height = 22
            DataField = 'ds_nota_segunda'
            DataSource = dsAvaliacoes
            TabOrder = 17
          end
          object cbAprovDireta: TDBLookupComboBox
            Left = 5
            Top = 158
            Width = 200
            Height = 22
            DataField = 'lookupSitAprovDireta'
            DataSource = dsAvaliacoes
            TabOrder = 2
          end
          object cbAprovExame: TDBLookupComboBox
            Left = 20
            Top = 480
            Width = 190
            Height = 22
            DataField = 'lookupSitAprovExame'
            DataSource = dsAvaliacoes
            TabOrder = 11
          end
          object cbAprov2Epoca: TDBLookupComboBox
            Left = 26
            Top = 743
            Width = 190
            Height = 22
            DataField = 'lookupSitAprov2Epoca'
            DataSource = dsAvaliacoes
            TabOrder = 19
          end
          object dbeNomeExameEtapa: TDBEdit
            Left = 20
            Top = 432
            Width = 228
            Height = 22
            DataField = 'nm_nome_exame_etapa'
            DataSource = dsAvaliacoes
            TabOrder = 10
          end
          object dbeNomeExameEspecial: TDBEdit
            Left = 20
            Top = 695
            Width = 228
            Height = 22
            DataField = 'nm_nome_exame_especial'
            DataSource = dsAvaliacoes
            TabOrder = 18
          end
          object dbchRecorrencia: TDBCheckBox
            Left = 5
            Top = 794
            Width = 201
            Height = 17
            Caption = 'Gerar taxas de exame de 2'#170' '#233'poca'
            DataField = 'SN_GERAR_TAXA_RECORRENCIA'
            DataSource = dsAvaliacoes
            TabOrder = 22
            ValueChecked = '1'
            ValueUnchecked = '0'
          end
          object dblcTiposTitulo: TDBLookupComboBox
            Left = 20
            Top = 860
            Width = 286
            Height = 22
            DataField = 'lfTipoTiulo'
            DataSource = dsAvaliacoes
            TabOrder = 24
          end
          object dbchForcar2epoca: TDBCheckBox
            Left = 5
            Top = 771
            Width = 211
            Height = 17
            Caption = 'Falta no Exame Final For'#231'a a 2'#170' '#201'poca'
            DataField = 'sn_falta_exame_forca_2epoca'
            DataSource = dsAvaliacoes
            TabOrder = 21
            ValueChecked = '1'
            ValueUnchecked = '0'
          end
          object DBCheckBox31: TDBCheckBox
            Left = 5
            Top = 817
            Width = 372
            Height = 17
            Caption = 
              'Ao assinalar falta, cancelar a taxa de pagamento caso esteja pen' +
              'dente'
            DataField = 'sn_falta_cancela_taxa'
            DataSource = dsAvaliacoes
            TabOrder = 23
            ValueChecked = '1'
            ValueUnchecked = '0'
          end
          object cbReprovDireta: TDBLookupComboBox
            Left = 213
            Top = 158
            Width = 200
            Height = 22
            DataField = 'lookupSitReprovDireta'
            DataSource = dsAvaliacoes
            TabOrder = 3
          end
          object cbReprovExame: TDBLookupComboBox
            Left = 222
            Top = 480
            Width = 190
            Height = 22
            DataField = 'lookupSitReprovExame'
            DataSource = dsAvaliacoes
            TabOrder = 12
          end
          object cbReprov2Epoca: TDBLookupComboBox
            Left = 224
            Top = 743
            Width = 190
            Height = 22
            DataField = 'lookupSitReprov2Epoca'
            DataSource = dsAvaliacoes
            TabOrder = 20
          end
          object cbConclusao: TDBLookupComboBox
            Left = 5
            Top = 204
            Width = 200
            Height = 22
            DataField = 'lookupSitConclusao'
            DataSource = dsAvaliacoes
            TabOrder = 4
          end
          object DBEdit36: TDBEdit
            Left = 5
            Top = 110
            Width = 417
            Height = 22
            DataField = 'ds_cond_repro_falta'
            DataSource = dsAvaliacoes
            TabOrder = 25
          end
          object cbReprovaFalta: TDBLookupComboBox
            Left = 211
            Top = 204
            Width = 200
            Height = 22
            DataField = 'lookupSituacaoReprovaFalta'
            DataSource = dsAvaliacoes
            TabOrder = 26
          end
        end
      end
      object tsMedia3: TTabSheet
        Caption = 'M'#233'dia 3'
        ImageIndex = 2
        object ScrollBox3: TScrollBox
          Left = 0
          Top = 0
          Width = 467
          Height = 725
          HorzScrollBar.Visible = False
          Align = alClient
          TabOrder = 0
          object Label16: TLabel
            Left = 8
            Top = 5
            Width = 155
            Height = 14
            Caption = 'Nr. de Casas Decimais de Notas'
            FocusControl = DBEdit15
          end
          object Label15: TLabel
            Left = 8
            Top = 624
            Width = 189
            Height = 14
            Caption = 'Peso para arredondamento das M'#233'dias'
            FocusControl = DBEdit14
          end
          object Label19: TLabel
            Left = 8
            Top = 254
            Width = 217
            Height = 14
            Caption = 'Considerar Freq'#252#234'ncia somente da Disciplina'
            FocusControl = DBEdit18
          end
          object Label22: TLabel
            Left = 29
            Top = 416
            Width = 406
            Height = 14
            Caption = 
              '* Caso contr'#225'rio as notas/m'#233'dias ser'#227'o arredondadas para o n'#186' de' +
              ' casas decimais.'
          end
          object Label24: TLabel
            Left = 8
            Top = 540
            Width = 426
            Height = 42
            Caption = 
              'Utilizar arredondamento autom'#225'tico para 0 ou 5 nas M'#201'DIAS FINAIS' +
              '. Informe abaixo a partir de qual casa decimal esse arredondamen' +
              'to dever'#225' ser for'#231'ado. Deixe em Branco para n'#227'o utilizar.'
            FocusControl = DBEdit20
            WordWrap = True
          end
          object Label29: TLabel
            Left = 8
            Top = 464
            Width = 415
            Height = 42
            Caption = 
              'Utilizar arredondamento autom'#225'tico para 0 ou 5 nas M'#201'DIAS DAS ET' +
              'APAS. Informe abaixo a partir de qual casa decimal esse arredond' +
              'amento dever'#225' ser for'#231'ado. Deixe em Branco para n'#227'o utilizar.'
            FocusControl = dbeCasasArredondamentoForcado
            WordWrap = True
          end
          object lblNrProficiencia: TLabel
            Left = 8
            Top = 295
            Width = 180
            Height = 14
            Caption = 'Nota para aprova'#231#227'o por profici'#234'ncia'
          end
          object Label47: TLabel
            Left = 231
            Top = 295
            Width = 200
            Height = 14
            Caption = 'Situa'#231#227'o para aprova'#231#227'o por profici'#234'ncia'
          end
          object Label50: TLabel
            Left = 231
            Top = 5
            Width = 181
            Height = 14
            Caption = 'Nr. de Casas Decimais de Frequ'#234'ncia'
            FocusControl = DBEdit32
          end
          object Label61: TLabel
            Left = 231
            Top = 624
            Width = 204
            Height = 14
            Caption = 'M'#233'dia final do aluno ap'#243's arredondamento'
            FocusControl = DBEdit35
          end
          object lbArredondamentoExame: TLabel
            Left = 8
            Top = 667
            Width = 195
            Height = 14
            Caption = 'M'#233'dia com arredondamento ap'#243's Exame'
            FocusControl = dbArredondamentoExame
          end
          object Bevel4: TBevel
            Left = 5
            Top = 617
            Width = 457
            Height = 1
            Shape = bsTopLine
          end
          object lbArredondamento2Epoca: TLabel
            Left = 231
            Top = 667
            Width = 206
            Height = 14
            Caption = 'M'#233'dia com arredondamento ap'#243's 2'#170' '#201'poca'
            FocusControl = dbArredondamento2Epoca
          end
          object Bevel6: TBevel
            Left = 5
            Top = 459
            Width = 457
            Height = 1
            Shape = bsTopLine
          end
          object Bevel8: TBevel
            Left = 5
            Top = 343
            Width = 457
            Height = 1
            Shape = bsTopLine
          end
          object Label62: TLabel
            Left = 231
            Top = 254
            Width = 101
            Height = 14
            Caption = 'Valor de 1 hora/aula:'
            FocusControl = DBEdit18
          end
          object Bevel10: TBevel
            Left = 5
            Top = 183
            Width = 457
            Height = 1
            Shape = bsTopLine
          end
          object Bevel11: TBevel
            Left = 5
            Top = 248
            Width = 457
            Height = 1
            Shape = bsTopLine
          end
          object DBEdit15: TDBEdit
            Left = 8
            Top = 21
            Width = 154
            Height = 22
            DataField = 'nr_casas_decimais'
            DataSource = dsAvaliacoes
            TabOrder = 0
          end
          object DBEdit14: TDBEdit
            Left = 8
            Top = 640
            Width = 144
            Height = 22
            DataField = 'vl_arredondamento'
            DataSource = dsAvaliacoes
            TabOrder = 22
          end
          object DBRadioGroup1: TDBRadioGroup
            Left = 8
            Top = 49
            Width = 437
            Height = 42
            Caption = ' C'#225'lculo da Freq'#252#234'ncia '
            Columns = 2
            DataField = 'ds_frequencia_tipo'
            DataSource = dsAvaliacoes
            Items.Strings = (
              'Aulas Dadas'
              'Carga Hor'#225'ria da Disciplina')
            ParentBackground = True
            TabOrder = 2
            Values.Strings = (
              'A'
              'C')
          end
          object DBEdit18: TDBEdit
            Left = 8
            Top = 270
            Width = 217
            Height = 22
            DataField = 'cd_disci_frequencia'
            DataSource = dsAvaliacoes
            TabOrder = 8
          end
          object DBCheckBox13: TDBCheckBox
            Left = 8
            Top = 350
            Width = 425
            Height = 17
            Caption = 
              'Truncar as notas da etapa para o n'#250'mero de casas decimais estipu' +
              'lada. *'
            DataField = 'sn_notas_truncar'
            DataSource = dsAvaliacoes
            TabOrder = 12
            ValueChecked = 'S'
            ValueUnchecked = 'N'
          end
          object DBCheckBox15: TDBCheckBox
            Left = 8
            Top = 372
            Width = 425
            Height = 17
            Caption = 
              'Truncar a m'#233'dia anual para o n'#250'mero de casas decimais estipulada' +
              '. *'
            DataField = 'sn_anual_truncar'
            DataSource = dsAvaliacoes
            TabOrder = 13
            ValueChecked = 'S'
            ValueUnchecked = 'N'
          end
          object DBCheckBox16: TDBCheckBox
            Left = 8
            Top = 393
            Width = 425
            Height = 17
            Caption = 
              'Truncar a m'#233'dia final para o n'#250'mero de casas decimais estipulada' +
              '. *'
            DataField = 'sn_medias_truncar'
            DataSource = dsAvaliacoes
            TabOrder = 14
            ValueChecked = 'S'
            ValueUnchecked = 'N'
          end
          object DBCheckBox9: TDBCheckBox
            Left = 8
            Top = 437
            Width = 425
            Height = 17
            Caption = 
              'Converter notas n'#227'o digitadas para zero, durante o c'#225'lculo da m'#233 +
              'dia.'
            DataField = 'sn_converter_notas_nulas'
            DataSource = dsAvaliacoes
            TabOrder = 15
            ValueChecked = '1'
            ValueUnchecked = '0'
          end
          object DBEdit20: TDBEdit
            Left = 8
            Top = 588
            Width = 144
            Height = 22
            DataField = 'nr_casas_forcado_media'
            DataSource = dsAvaliacoes
            TabOrder = 19
          end
          object dbeCasasArredondamentoForcado: TDBEdit
            Left = 8
            Top = 512
            Width = 144
            Height = 22
            DataField = 'nr_casas_decimais_forcado'
            DataSource = dsAvaliacoes
            TabOrder = 16
          end
          object ckbForcadoCima: TCheckBox
            Tag = 1
            Left = 168
            Top = 512
            Width = 97
            Height = 17
            Caption = 'Para cima'
            TabOrder = 17
            OnClick = ckbForcadoCimaClick
            OnMouseDown = ckbForcadoCimaMouseDown
          end
          object ckbForcadoBaixo: TCheckBox
            Tag = 2
            Left = 258
            Top = 512
            Width = 97
            Height = 17
            Caption = 'Para Baixo'
            TabOrder = 18
            OnClick = ckbForcadoCimaClick
            OnMouseDown = ckbForcadoCimaMouseDown
          end
          object ckbForcadoMediaCima: TCheckBox
            Tag = 1
            Left = 168
            Top = 588
            Width = 97
            Height = 17
            Caption = 'Para cima'
            TabOrder = 20
            OnClick = ckbForcadoMediaCimaClick
            OnMouseDown = ckbForcadoCimaMouseDown
          end
          object ckbForcadoMediaBaixo: TCheckBox
            Tag = 2
            Left = 258
            Top = 588
            Width = 97
            Height = 17
            Caption = 'Para Baixo'
            TabOrder = 21
            OnClick = ckbForcadoMediaCimaClick
            OnMouseDown = ckbForcadoCimaMouseDown
          end
          object dbNrMediaProficiencia: TDBEdit
            Left = 8
            Top = 313
            Width = 217
            Height = 22
            DataField = 'nr_media_proficiencia'
            DataSource = dsAvaliacoes
            MaxLength = 4
            TabOrder = 10
          end
          object cbAprovSuficiencia: TUMLookupComboBox
            Left = 231
            Top = 313
            Width = 214
            Height = 22
            DataField = 'lookupSituacaoProficiencia'
            DataSource = dsAvaliacoes
            TabOrder = 11
          end
          object DBEdit32: TDBEdit
            Left = 231
            Top = 21
            Width = 180
            Height = 22
            DataField = 'nr_casas_decimais_frequencia'
            DataSource = dsAvaliacoes
            TabOrder = 1
          end
          object DBRadioGroup2: TDBRadioGroup
            Left = 8
            Top = 95
            Width = 437
            Height = 40
            Caption = ' Registro de Frequ'#234'ncia'
            Columns = 2
            DataField = 'ds_frequencia_registro'
            DataSource = dsAvaliacoes
            Items.Strings = (
              'Por Aulas'
              'Total de Faltas')
            ParentBackground = True
            TabOrder = 3
            Values.Strings = (
              'A'
              'T')
            OnChange = DBRadioGroup2Change
          end
          object DBEdit35: TDBEdit
            Left = 231
            Top = 640
            Width = 144
            Height = 22
            DataField = 'vl_media_arredondamento'
            DataSource = dsAvaliacoes
            TabOrder = 23
          end
          object dbArredondamentoExame: TDBEdit
            Left = 8
            Top = 683
            Width = 144
            Height = 22
            DataField = 'vl_media_arredondamento_exame'
            DataSource = dsAvaliacoes
            TabOrder = 24
          end
          object dbArredondamento2Epoca: TDBEdit
            Left = 231
            Top = 683
            Width = 144
            Height = 22
            DataField = 'vl_media_arredondamento_2epoca'
            DataSource = dsAvaliacoes
            TabOrder = 25
          end
          object dbedValorHoraAula: TDBEdit
            Left = 231
            Top = 270
            Width = 214
            Height = 22
            DataField = 'vl_hora_aula'
            DataSource = dsAvaliacoes
            TabOrder = 9
          end
          object DBCheckBox42: TDBCheckBox
            Left = 8
            Top = 141
            Width = 281
            Height = 17
            Caption = 'Permitir informar a quantidade de faltas justificadas'
            DataField = 'sn_faltas_justificadas'
            DataSource = dsAvaliacoes
            TabOrder = 4
            ValueChecked = '1'
            ValueUnchecked = '0'
          end
          object DBCheckBox50: TDBCheckBox
            Left = 8
            Top = 162
            Width = 415
            Height = 17
            Caption = 
              'Converter frequ'#234'ncias n'#227'o digitadas para presen'#231'a, durante o c'#225'l' +
              'culo da m'#233'dia.'
            DataField = 'sn_converter_frequencias_nulas'
            DataSource = dsAvaliacoes
            TabOrder = 5
            ValueChecked = '1'
            ValueUnchecked = '0'
          end
          object DBCheckBox33: TDBCheckBox
            Left = 8
            Top = 191
            Width = 426
            Height = 26
            Caption = 
              'Liberar visualiza'#231#227'o das frequ'#234'ncias parciais somente ap'#243's data ' +
              'de libera'#231#227'o dos resultados'
            DataField = 'sn_libera_freq_apos_fim_etapa'
            DataSource = dsAvaliacoes
            TabOrder = 6
            ValueChecked = '1'
            ValueUnchecked = '0'
            WordWrap = True
          end
          object DBCheckBox52: TDBCheckBox
            Left = 8
            Top = 219
            Width = 454
            Height = 26
            Caption = 
              'Liberar visualiza'#231#227'o das notas parciais somente ap'#243's data de lib' +
              'era'#231#227'o dos resultados'
            DataField = 'sn_libera_notas_apos_fim_etapa'
            DataSource = dsAvaliacoes
            TabOrder = 7
            ValueChecked = '1'
            ValueUnchecked = '0'
            WordWrap = True
          end
        end
      end
      object tsDiarioOnline: TTabSheet
        Caption = 'Di'#225'rio On-Line'
        ImageIndex = 3
        object ScrollBox4: TScrollBox
          Left = 0
          Top = 0
          Width = 467
          Height = 725
          HorzScrollBar.Visible = False
          VertScrollBar.Position = 72
          Align = alClient
          TabOrder = 0
          object Label23: TLabel
            Left = 34
            Top = 67
            Width = 407
            Height = 28
            Caption = 
              'OBS.: A coordena'#231#227'o pode desbloquear/bloquear aulas e provas atr' +
              'av'#233's do menu Cadastros - Aulas e Provas, do m'#243'dulo Acad'#234'mico.'
            Font.Charset = ANSI_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'Arial'
            Font.Style = [fsItalic]
            ParentFont = False
            WordWrap = True
          end
          object Label25: TLabel
            Left = 32
            Top = 661
            Width = 237
            Height = 14
            Caption = 'F'#243'rmula padr'#227'o (ser'#225' sugerida aos professores)'
            FocusControl = DBEdit15
          end
          object Label57: TLabel
            Left = 34
            Top = 315
            Width = 35
            Height = 14
            Caption = 'M'#237'nimo:'
            Font.Charset = ANSI_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'Arial'
            Font.Style = []
            ParentFont = False
            WordWrap = True
          end
          object Label60: TLabel
            Left = 152
            Top = 315
            Width = 39
            Height = 14
            Caption = 'M'#225'ximo:'
            Font.Charset = ANSI_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'Arial'
            Font.Style = []
            ParentFont = False
            WordWrap = True
          end
          object Label63: TLabel
            Left = 16
            Top = 95
            Width = 326
            Height = 14
            Caption = 
              'Ap'#243's digitar as notas de uma avalia'#231#227'o pelo di'#225'rio de classe onl' +
              'ine:'
            FocusControl = DBEdit12
          end
          object Label65: TLabel
            Left = 16
            Top = 160
            Width = 319
            Height = 14
            Caption = 
              'Ao digitar as frequ'#234'ncias de uma aula pelo di'#225'rio de classe onli' +
              'ne:'
            FocusControl = DBEdit12
          end
          object ckOnline: TDBCheckBox
            Left = 16
            Top = -53
            Width = 400
            Height = 17
            Caption = 'Utilizar o Di'#225'rio de Classe On-Line'
            DataField = 'sn_diario_online'
            DataSource = dsAvaliacoes
            TabOrder = 0
            ValueChecked = '1'
            ValueUnchecked = '0'
          end
          object ckOnlineRecalcMedias: TDBCheckBox
            Left = 16
            Top = -35
            Width = 414
            Height = 17
            Caption = 'Permitir que os professores calculem as m'#233'dias dos alunos.'
            DataField = 'sn_diario_online_recalc_medias'
            DataSource = dsAvaliacoes
            TabOrder = 1
            ValueChecked = '1'
            ValueUnchecked = '0'
          end
          object ckOnlineAulas: TDBCheckBox
            Left = 16
            Top = -15
            Width = 400
            Height = 16
            Caption = 
              'Permitir que os professores insiram novas aulas e alterem aulas ' +
              'n'#227'o bloqueadas.'
            DataField = 'sn_diario_online_aulas'
            DataSource = dsAvaliacoes
            TabOrder = 2
            ValueChecked = '1'
            ValueUnchecked = '0'
          end
          object ckOnlineProvas: TDBCheckBox
            Left = 16
            Top = 31
            Width = 414
            Height = 17
            Caption = 'Permitir que os professores insiram provas n'#227'o bloqueadas'
            DataField = 'sn_diario_online_provas'
            DataSource = dsAvaliacoes
            TabOrder = 4
            ValueChecked = '1'
            ValueUnchecked = '0'
          end
          object ckOnlineBloqueAulas: TDBCheckBox
            Left = 16
            Top = 2
            Width = 428
            Height = 27
            Caption = 
              'Ap'#243's digitar a freq'#252#234'ncia de uma aula, bloquear para que o profe' +
              'ssor n'#227'o possa mais alterar o conte'#250'do ou excluir a aula.'
            DataField = 'sn_diario_online_bloque_aulas'
            DataSource = dsAvaliacoes
            TabOrder = 3
            ValueChecked = '1'
            ValueUnchecked = '0'
            WordWrap = True
          end
          object ckOnlineBloqueProvas: TDBCheckBox
            Left = 16
            Top = 114
            Width = 428
            Height = 26
            Caption = 
              'Bloquear a digita'#231#227'o de notas j'#225' digitadas. (A altera'#231#227'o pode se' +
              'r feita pela op'#231#227'o Altera'#231#227'o de Notas).'
            DataField = 'sn_diario_online_bloque_provas'
            DataSource = dsAvaliacoes
            TabOrder = 6
            ValueChecked = '1'
            ValueUnchecked = '0'
            WordWrap = True
          end
          object ckOnlineAlteracaoDireta: TDBCheckBox
            Left = 16
            Top = 215
            Width = 424
            Height = 47
            Caption = 
              'Na altera'#231#227'o de uma nota pelo professor, DEFERIR automaticamente' +
              ', dispensando aprova'#231#227'o da coordena'#231#227'o.  (Se desabilitado o defe' +
              'rimento '#233' feito pela tela de Cadastro - Aulas e Provas).'
            DataField = 'sn_altera_notas_direta'
            DataSource = dsAvaliacoes
            TabOrder = 8
            ValueChecked = '1'
            ValueUnchecked = '0'
            WordWrap = True
          end
          object DBCheckBox10: TDBCheckBox
            Left = 16
            Top = 358
            Width = 400
            Height = 25
            Caption = 
              'Na digita'#231#227'o de notas e faltas do Di'#225'rio, mostrar como padr'#227'o ap' +
              'enas os alunos CURSANDO. Haver'#225' um bot'#227'o caso o professor queira' +
              ' mostrar todos.'
            DataField = 'sn_mostrar_alunos_curs_padrao'
            DataSource = dsAvaliacoes
            TabOrder = 12
            ValueChecked = '1'
            ValueUnchecked = '0'
            WordWrap = True
          end
          object DBCheckBox11: TDBCheckBox
            Left = 16
            Top = 391
            Width = 400
            Height = 25
            Caption = 
              'Permitir gera'#231#227'o de datas de aulas sem haver hor'#225'rios definidos.' +
              ' OBS.: Desta forma o professor define os dias da semana para a g' +
              'era'#231#227'o das datas.'
            DataField = 'sn_ins_aulas_semhorario'
            DataSource = dsAvaliacoes
            TabOrder = 13
            ValueChecked = '1'
            ValueUnchecked = '0'
            WordWrap = True
          end
          object DBCheckBox12: TDBCheckBox
            Left = 16
            Top = 445
            Width = 400
            Height = 41
            Caption = 
              'Na fun'#231#227'o de c'#243'pia do conte'#250'do program'#225'tico de uma turma para ou' +
              'tra o sistema deve relacionar as aulas pelas DATAS. Se desabilit' +
              'ada o sistema relacionar'#225' as aulas com o N'#218'MERO DA AULA equivale' +
              'nte.'
            DataField = 'sn_copiar_conteudo_pordata'
            DataSource = dsAvaliacoes
            TabOrder = 15
            ValueChecked = '1'
            ValueUnchecked = '0'
            WordWrap = True
          end
          object DBCheckBox14: TDBCheckBox
            Left = 16
            Top = 489
            Width = 429
            Height = 42
            Caption = 
              'Aplicar o ajuste de m'#233'dias ap'#243's a nota da RECUPERA'#199#195'O DA ETAPA. ' +
              'Se desabilitada o sistema aplicar'#225' o ajuste somente sobre a M'#201'DI' +
              'A DO PROFESSOR.'
            DataField = 'sn_ajuste_apos_recuperacao'
            DataSource = dsAvaliacoes
            TabOrder = 16
            ValueChecked = '1'
            ValueUnchecked = '0'
            WordWrap = True
          end
          object DBCheckBox18: TDBCheckBox
            Left = 280
            Top = 673
            Width = 165
            Height = 33
            Caption = 'Obrigar os professores a utilizarem a f'#243'rmula padr'#227'o'
            DataField = 'sn_obrigar_formula_padrao'
            DataSource = dsAvaliacoes
            TabOrder = 23
            ValueChecked = '1'
            ValueUnchecked = '0'
            WordWrap = True
          end
          object DBEdit21: TDBEdit
            Left = 32
            Top = 679
            Width = 242
            Height = 22
            DataField = 'ds_formula_padrao'
            DataSource = dsAvaliacoes
            TabOrder = 22
          end
          object DBCheckBox19: TDBCheckBox
            Left = 16
            Top = 289
            Width = 429
            Height = 22
            Caption = 'Permitir que os professores utilizem ajuste'
            DataField = 'sn_diario_online_mostra_ajuste'
            DataSource = dsAvaliacoes
            TabOrder = 10
            ValueChecked = '1'
            ValueUnchecked = '0'
            WordWrap = True
          end
          object dbchGerarAulasDatas: TDBCheckBox
            Left = 16
            Top = 421
            Width = 424
            Height = 17
            Caption = 'Ocultar a op'#231#227'o de gera'#231#227'o de aulas por intervalo de datas.'
            DataField = 'sn_aulas_datas'
            DataSource = dsAvaliacoes
            TabOrder = 14
            ValueChecked = '1'
            ValueUnchecked = '0'
          end
          object DBCheckBox24: TDBCheckBox
            Left = 16
            Top = 536
            Width = 318
            Height = 17
            Caption = 'Exibir a descri'#231#227'o da turma no Di'#225'rio de Classes.'
            DataField = 'sn_exibir_descricao'
            DataSource = dsAvaliacoes
            TabOrder = 17
            ValueChecked = '1'
            ValueUnchecked = '0'
          end
          object DBCheckBox27: TDBCheckBox
            Left = 16
            Top = 707
            Width = 424
            Height = 14
            Caption = 'Calcular as m'#233'dias automaticamente na inclus'#227'o de notas.'
            DataField = 'sn_calculo_media_automatico'
            DataSource = dsAvaliacoes
            TabOrder = 24
            ValueChecked = '1'
            ValueUnchecked = '0'
          end
          object DBCheckBox30: TDBCheckBox
            Left = 16
            Top = 559
            Width = 406
            Height = 25
            Caption = 
              'Todas as informa'#231#245'es de notas devem estar lan'#231'adas para permitir' +
              ' o c'#225'lculo de m'#233'dias'
            DataField = 'sn_notas_calcular_medias'
            DataSource = dsAvaliacoes
            TabOrder = 18
            ValueChecked = '1'
            ValueUnchecked = '0'
            WordWrap = True
          end
          object DBEdit33: TDBEdit
            Left = 75
            Top = 312
            Width = 54
            Height = 22
            DataField = 'vl_ajuste_min'
            DataSource = dsAvaliacoes
            TabOrder = 11
          end
          object DBEdit34: TDBEdit
            Left = 197
            Top = 312
            Width = 54
            Height = 22
            DataField = 'vl_ajuste_max'
            DataSource = dsAvaliacoes
            TabOrder = 25
          end
          object DBCheckBox32: TDBCheckBox
            Left = 16
            Top = 618
            Width = 436
            Height = 17
            Caption = 
              'Verificar data de matr'#237'cula do aluno para permitir preencher pre' +
              'sen'#231'as e notas'
            DataField = 'sn_verificar_data_matricula'
            DataSource = dsAvaliacoes
            TabOrder = 20
            ValueChecked = '1'
            ValueUnchecked = '0'
          end
          object DBCheckBox34: TDBCheckBox
            Left = 16
            Top = 261
            Width = 429
            Height = 27
            Caption = 
              'Preencher as notas n'#227'o digitadas pelo professor com valor zero. ' +
              '(Somente '#233' considerado para avalia'#231#245'es por notas)'
            DataField = 'sn_preencher_notas_nulas_zero'
            DataSource = dsAvaliacoes
            TabOrder = 9
            ValueChecked = '1'
            ValueUnchecked = '0'
            WordWrap = True
          end
          object DBCheckBox37: TDBCheckBox
            Left = 16
            Top = 50
            Width = 414
            Height = 17
            Caption = 'Permitir que os professores alterem provas n'#227'o bloqueadas'
            DataField = 'sn_alterar_provas'
            DataSource = dsAvaliacoes
            TabOrder = 5
            ValueChecked = '1'
            ValueUnchecked = '0'
          end
          object DBCheckBox39: TDBCheckBox
            Left = 16
            Top = 638
            Width = 436
            Height = 17
            Caption = 
              'Coordenador deve deferir as notas digitadas pelo professor no di' +
              #225'rio online'
            DataField = 'sn_deferir_notas_diario'
            DataSource = dsAvaliacoes
            TabOrder = 21
            ValueChecked = '1'
            ValueUnchecked = '0'
          end
          object ckOnlineBloqueCont: TDBCheckBox
            Left = 16
            Top = 139
            Width = 428
            Height = 21
            Caption = 'Bloquear a altera'#231#227'o de conte'#250'do e data da avalia'#231#227'o.'
            DataField = 'sn_diario_online_bloque_cont'
            DataSource = dsAvaliacoes
            TabOrder = 7
            ValueChecked = '1'
            ValueUnchecked = '0'
            WordWrap = True
          end
          object DBCheckBox44: TDBCheckBox
            Left = 16
            Top = 199
            Width = 428
            Height = 18
            Caption = 'Bloquear a altera'#231#227'o de conte'#250'do e data da aula.'
            DataField = 'sn_diario_online_freq_bloq_cont'
            DataSource = dsAvaliacoes
            TabOrder = 26
            ValueChecked = '1'
            ValueUnchecked = '0'
            WordWrap = True
          end
          object DBCheckBox45: TDBCheckBox
            Left = 16
            Top = 177
            Width = 428
            Height = 21
            Caption = 'Bloquear a digita'#231#227'o de frequ'#234'ncias j'#225' digitadas.'
            DataField = 'sn_diario_online_freq_bloq_digi'
            DataSource = dsAvaliacoes
            TabOrder = 27
            ValueChecked = '1'
            ValueUnchecked = '0'
            WordWrap = True
          end
          object DBCheckBox48: TDBCheckBox
            Left = 16
            Top = 337
            Width = 400
            Height = 15
            Caption = 'Professores devem informar o motivo do ajuste de m'#233'dia'
            DataField = 'sn_professor_informar_motivo_media'
            DataSource = dsAvaliacoes
            TabOrder = 28
            ValueChecked = '1'
            ValueUnchecked = '0'
            WordWrap = True
          end
          object dbchFrequenciaCalcularMedia: TDBCheckBox
            Left = 16
            Top = 587
            Width = 414
            Height = 32
            Caption = 
              'Todas as informa'#231#245'es de frequ'#234'ncias devem estar lan'#231'adas para pe' +
              'rmitir o c'#225'lculo de m'#233'dias'
            DataField = 'SN_FREQUENCIAS_CALCULAR_MEDIAS'
            DataSource = dsAvaliacoes
            TabOrder = 19
            ValueChecked = '1'
            ValueUnchecked = '0'
            WordWrap = True
          end
        end
      end
      object tsDiarioOnline2: TTabSheet
        Caption = 'Di'#225'rio On-Line 2'
        ImageIndex = 8
        object ScrollBox7: TScrollBox
          Left = 0
          Top = 0
          Width = 467
          Height = 725
          VertScrollBar.Position = 151
          Align = alClient
          TabOrder = 0
          object Label36: TLabel
            Left = 37
            Top = -113
            Width = 78
            Height = 14
            Caption = 'N'#250'mero de dias:'
            FocusControl = DBEdit26
          end
          object Label37: TLabel
            Left = 5
            Top = 437
            Width = 405
            Height = 14
            Caption = 
              'Quantidade de Aulas a serem impressas por p'#225'gina no Di'#225'rio de Fr' +
              'eq'#252#234'ncia on-line.'
            FocusControl = DBEdit27
          end
          object Label38: TLabel
            Left = 5
            Top = 475
            Width = 311
            Height = 14
            Caption = 
              'N'#250'mero da aula inicial para controle de aulas especiais no di'#225'ri' +
              'o.'
            FocusControl = DBEdit28
          end
          object Label39: TLabel
            Left = 5
            Top = 512
            Width = 332
            Height = 14
            Caption = 'Quantidade de altera'#231#245'es poss'#237'veis em uma mesma prova por aluno.'
            FocusControl = DBEdit29
          end
          object lbTipoHorario: TLabel
            Left = 5
            Top = 551
            Width = 73
            Height = 14
            Caption = 'Tipo de Hor'#225'rio'
            FocusControl = DBEdit29
          end
          object Label41: TLabel
            Left = 5
            Top = 587
            Width = 125
            Height = 14
            Caption = 'N'#250'mero M'#225'ximo de Aulas.'
            FocusControl = DBEdit29
          end
          object Label72: TLabel
            Left = 5
            Top = 668
            Width = 88
            Height = 14
            Caption = 'Nome da atividade'
            FocusControl = DBEdit29
          end
          object Label73: TLabel
            Left = 5
            Top = 629
            Width = 430
            Height = 14
            Caption = 
              'Condi'#231#227'o para permitir a digita'#231#227'o da nota de recupera'#231#227'o (em br' +
              'anco = sempre permitir)'
            FocusControl = DBEdit38
          end
          object DBEdit26: TDBEdit
            Left = 121
            Top = -116
            Width = 80
            Height = 22
            DataField = 'nr_dias_diario_bloq_provas'
            DataSource = dsAvaliacoes
            TabOrder = 1
          end
          object ckbBloqDigProf: TCheckBox
            Left = 8
            Top = -145
            Width = 418
            Height = 27
            Caption = 
              'Bloquear a digita'#231#227'o de notas de provas no on-line do professor ' +
              'caso ultrapasse o n'#250'mero de dias:'
            TabOrder = 0
            WordWrap = True
            OnClick = ckbBloqDigProfClick
          end
          object dbchkAulaExtra: TDBCheckBox
            Left = 8
            Top = -53
            Width = 414
            Height = 17
            Caption = 
              'Permitir inclus'#227'o de conte'#250'do de aulas extra classe pelo profess' +
              'or.'
            DataField = 'sn_extra_classe'
            DataSource = dsAvaliacoes
            TabOrder = 4
            ValueChecked = '1'
            ValueUnchecked = '0'
          end
          object DBEdit29: TDBEdit
            Left = 5
            Top = 528
            Width = 144
            Height = 22
            DataField = 'nr_notas_max_alteracoes'
            DataSource = dsAvaliacoes
            TabOrder = 28
          end
          object DBEdit27: TDBEdit
            Left = 5
            Top = 453
            Width = 144
            Height = 22
            DataField = 'nr_qtd_aulas_impressao'
            DataSource = dsAvaliacoes
            TabOrder = 26
          end
          object dbchkFechaDiarioAntes: TDBCheckBox
            Left = 8
            Top = -33
            Width = 414
            Height = 17
            Caption = 'Permitir o professor fechar o di'#225'rio antes do prazo.'
            DataField = 'sn_professor_fecha_diario'
            DataSource = dsAvaliacoes
            TabOrder = 5
            ValueChecked = '1'
            ValueUnchecked = '0'
          end
          object cbTipoHorario: TComboBox
            Left = 5
            Top = 567
            Width = 145
            Height = 22
            Style = csOwnerDrawFixed
            ItemHeight = 16
            TabOrder = 29
            OnClick = cbTipoHorarioClick
            Items.Strings = (
              'Aula'
              'Cronograma'
              'Ambos')
          end
          object DBEdit28: TDBEdit
            Left = 5
            Top = 491
            Width = 144
            Height = 22
            DataField = 'nr_inicio_aulas_extras'
            DataSource = dsAvaliacoes
            TabOrder = 27
          end
          object dbchkExtraClasse: TDBCheckBox
            Left = 8
            Top = 19
            Width = 414
            Height = 17
            Caption = 'Permitir o professor estabelecer pesos no cadastro da avalia'#231#227'o.'
            DataField = 'sn_profes_digita_peso'
            DataSource = dsAvaliacoes
            TabOrder = 7
            ValueChecked = 'S'
            ValueUnchecked = 'N'
          end
          object dbchkExameDiarioOnline: TDBCheckBox
            Left = 8
            Top = 56
            Width = 414
            Height = 17
            Caption = 'Permitir o professor digitar a nota do exame pelo di'#225'rio online.'
            DataField = 'sn_digita_exame_diario_online'
            DataSource = dsAvaliacoes
            TabOrder = 9
            ValueChecked = '1'
            ValueUnchecked = '0'
          end
          object dbckFrequenciaGlobal: TDBCheckBox
            Left = 8
            Top = 76
            Width = 402
            Height = 17
            Caption = 
              'Ao visualizar as freq'#252#234'ncias, exibir apenas o somat'#243'rio de falta' +
              's do per'#237'odo.'
            DataField = 'sn_frequencia_turma'
            DataSource = dsAvaliacoes
            TabOrder = 10
            ValueChecked = '1'
            ValueUnchecked = '0'
          end
          object dbSNAtividadesCad: TDBCheckBox
            Left = 8
            Top = 132
            Width = 385
            Height = 17
            Caption = 'Permitir o professor cadastrar atividades.'
            DataField = 'sn_diario_online_atividades'
            DataSource = dsAvaliacoes
            TabOrder = 13
            ValueChecked = '1'
            ValueUnchecked = '0'
          end
          object DBCheckBox22: TDBCheckBox
            Left = 8
            Top = -94
            Width = 385
            Height = 17
            Caption = 
              'Permitir a altera'#231#227'o da nota de exame ap'#243's o envio pelo professo' +
              'r.'
            DataField = 'sn_alterar_nota_exame'
            DataSource = dsAvaliacoes
            TabOrder = 2
            ValueChecked = '1'
            ValueUnchecked = '0'
          end
          object dbSNDigitaTodasNotas: TDBCheckBox
            Left = 8
            Top = 169
            Width = 429
            Height = 17
            Caption = 
              'Permitir o professor digitar todas as notas do aluno (Todas as A' +
              'valia'#231#245'es).'
            DataField = 'sn_digita_todas_notas'
            DataSource = dsAvaliacoes
            TabOrder = 15
            ValueChecked = '1'
            ValueUnchecked = '0'
          end
          object DBEdit31: TDBEdit
            Left = 5
            Top = 605
            Width = 144
            Height = 22
            DataField = 'nr_maximo_aulas'
            DataSource = dsAvaliacoes
            TabOrder = 30
          end
          object dbSnFreque: TDBCheckBox
            Left = 8
            Top = 186
            Width = 437
            Height = 29
            Caption = 
              'Permitir que durante a atribui'#231#227'o de frequ'#234'ncia ou edi'#231#227'o de uma' +
              ' aula, os registros que estiverem "Em branco" sejam substitu'#237'dos' +
              ' por "Presen'#231'a"'
            DataField = 'sn_freque_pergunta'
            DataSource = dsAvaliacoes
            TabOrder = 16
            ValueChecked = '1'
            ValueUnchecked = '0'
            WordWrap = True
          end
          object dbSnfrequePerguntaPadrao: TDBCheckBox
            Left = 8
            Top = 217
            Width = 437
            Height = 24
            Caption = 
              'Na altera'#231#227'o de uma aula, caso habilitado, os registros de frequ' +
              #234'ncia j'#225' vir'#227'o assinalados como presen'#231'a. Quando desmarcado, os ' +
              'registros estar'#227'o nulos.'
            DataField = 'sn_freque_pergunta_padrao'
            DataSource = dsAvaliacoes
            TabOrder = 17
            ValueChecked = '1'
            ValueUnchecked = '0'
            WordWrap = True
          end
          object DBCheckBox23: TDBCheckBox
            Left = 8
            Top = 243
            Width = 437
            Height = 24
            Caption = 
              'For'#231'ar o fechamento do di'#225'rio  no c'#225'lculo de m'#233'dia pelo di'#225'rio o' +
              'nline'
            DataField = 'calcular_media_fecha_diario'
            DataSource = dsAvaliacoes
            TabOrder = 18
            ValueChecked = '1'
            ValueUnchecked = '0'
            WordWrap = True
          end
          object DBCheckBox26: TDBCheckBox
            Left = 8
            Top = 265
            Width = 357
            Height = 17
            Caption = 'Disponibilizar op'#231#227'o de C'#225'lculo Aritm'#233'tico das Notas Digitadas'
            DataField = 'sn_calcular_media_aritmetica'
            DataSource = dsAvaliacoes
            TabOrder = 19
            ValueChecked = '1'
            ValueUnchecked = '0'
            WordWrap = True
          end
          object DBCheckBox28: TDBCheckBox
            Left = 8
            Top = 150
            Width = 385
            Height = 17
            Caption = 
              'Permitir ao professor atribuir uma observa'#231#227'o para notas digitad' +
              'as'
            DataField = 'sn_observacao_nota'
            DataSource = dsAvaliacoes
            TabOrder = 14
            ValueChecked = '1'
            ValueUnchecked = '0'
          end
          object DBCheckBox35: TDBCheckBox
            Left = 8
            Top = 287
            Width = 357
            Height = 24
            Caption = 
              'Bloquear di'#225'rio de classe On-line caso Plano de Ensino ainda n'#227'o' +
              ' esteja aprovado pela coordena'#231#227'o'
            DataField = 'sn_bloquear_diario'
            DataSource = dsAvaliacoes
            TabOrder = 20
            ValueChecked = '1'
            ValueUnchecked = '0'
            WordWrap = True
          end
          object DBCheckBox36: TDBCheckBox
            Left = 8
            Top = -12
            Width = 429
            Height = 26
            Caption = 
              'Todas as informa'#231#245'es de aulas, frequ'#234'ncias e notas devem estar l' +
              'an'#231'adas para permitir o fechamento do di'#225'rio.'
            DataField = 'sn_valida_fecha_diario'
            DataSource = dsAvaliacoes
            TabOrder = 6
            ValueChecked = '1'
            ValueUnchecked = '0'
            WordWrap = True
          end
          object DBCheckBox38: TDBCheckBox
            Left = 8
            Top = -74
            Width = 385
            Height = 17
            Caption = 
              'Permitir a altera'#231#227'o da nota de segunda '#233'poca ap'#243's o envio pelo ' +
              'professor.'
            DataField = 'sn_alterar_2epoca'
            DataSource = dsAvaliacoes
            TabOrder = 3
            ValueChecked = '1'
            ValueUnchecked = '0'
          end
          object DBCheckBox40: TDBCheckBox
            Left = 8
            Top = 312
            Width = 357
            Height = 17
            Caption = 'Agrupar aulas de mesma data no di'#225'rio de classe online.'
            DataField = 'sn_agrupar_aulas_mesma_data'
            DataSource = dsAvaliacoes
            TabOrder = 21
            ValueChecked = '1'
            ValueUnchecked = '0'
            WordWrap = True
          end
          object DBCheckBox41: TDBCheckBox
            Left = 8
            Top = 330
            Width = 454
            Height = 19
            Caption = 
              'Informar como faltantes no exame/segunda '#233'poca alunos que n'#227'o ti' +
              'verem notas digitadas'
            DataField = 'sn_falta_sem_nota_2epoca'
            DataSource = dsAvaliacoes
            TabOrder = 22
            ValueChecked = '1'
            ValueUnchecked = '0'
            WordWrap = True
          end
          object DBCheckBox46: TDBCheckBox
            Left = 8
            Top = 349
            Width = 454
            Height = 26
            Caption = 
              'Permitir que o professor crie aulas e provas compartilhadas entr' +
              'e professores da mesma turma/disciplina.'
            DataField = 'sn_diario_online_compart_aula'
            DataSource = dsAvaliacoes
            TabOrder = 23
            ValueChecked = '1'
            ValueUnchecked = '0'
            WordWrap = True
          end
          object DBCheckBox47: TDBCheckBox
            Left = 8
            Top = 376
            Width = 457
            Height = 32
            Caption = 
              'Apresentar professor respons'#225'vel pela aula/prova no detalhamento' +
              ' de notas e frequ'#234'ncias parciais do estudante no portal online. '
            DataField = 'sn_diario_online_mostra_resp'
            DataSource = dsAvaliacoes
            TabOrder = 24
            ValueChecked = '1'
            ValueUnchecked = '0'
            WordWrap = True
          end
          object DBCheckBox49: TDBCheckBox
            Left = 8
            Top = 114
            Width = 385
            Height = 17
            Caption = 'Permitir justificar faltas'
            DataField = 'sn_permitir_justificar'
            DataSource = dsAvaliacoes
            TabOrder = 12
            ValueChecked = '1'
            ValueUnchecked = '0'
          end
          object DBCheckBox51: TDBCheckBox
            Left = 8
            Top = 407
            Width = 457
            Height = 32
            Caption = 
              'Ocultar o conte'#250'do program'#225'tico das aulas para alunos e respons'#225 +
              'veis no portal online.'
            DataField = 'sn_ocultar_conteudo_portal'
            DataSource = dsAvaliacoes
            TabOrder = 25
            ValueChecked = '1'
            ValueUnchecked = '0'
            WordWrap = True
          end
          object DBCheckBox53: TDBCheckBox
            Left = 8
            Top = 38
            Width = 414
            Height = 17
            Caption = 
              'Permitir o professor estabelecer a nota m'#225'xima no cadastro da av' +
              'alia'#231#227'o.'
            DataField = 'sn_profes_digita_nota_max'
            DataSource = dsAvaliacoes
            TabOrder = 8
            ValueChecked = '1'
            ValueUnchecked = '0'
          end
          object DBCheckBox54: TDBCheckBox
            Left = 8
            Top = 96
            Width = 402
            Height = 17
            Caption = 'N'#227'o permitir alunos e respons'#225'veis visualizar notas parciais'
            DataField = 'sn_esconder_notas_parciais'
            DataSource = dsAvaliacoes
            TabOrder = 11
            ValueChecked = '1'
            ValueUnchecked = '0'
          end
          object DBEdit37: TDBEdit
            Left = 5
            Top = 682
            Width = 144
            Height = 22
            DataField = 'ds_nome_atividade'
            DataSource = dsAvaliacoes
            TabOrder = 31
          end
          object DBEdit38: TDBEdit
            Left = 5
            Top = 645
            Width = 329
            Height = 22
            DataField = 'ds_condicao_digitar_re'
            DataSource = dsAvaliacoes
            TabOrder = 32
          end
        end
      end
      object tsTiposProva: TTabSheet
        Caption = 'Tipos de Provas'
        ImageIndex = 9
        object ToolBar1: TToolBar
          Left = 0
          Top = 700
          Width = 467
          Height = 25
          Align = alBottom
          ButtonWidth = 70
          Caption = 'toolPessoa'
          EdgeBorders = [ebTop, ebBottom]
          Images = ImageList1
          List = True
          ShowCaptions = True
          TabOrder = 0
          object ToolButton3: TToolButton
            Left = 0
            Top = 0
            Width = 8
            Caption = 'ToolButton1'
            ImageIndex = 9
            Style = tbsSeparator
          end
          object btnSalvarTipoProva: TToolButton
            Left = 8
            Top = 0
            Caption = 'Salvar'
            ImageIndex = 3
            OnClick = btnSalvarTipoProvaClick
          end
          object btnCancelarTipoProva: TToolButton
            Left = 78
            Top = 0
            Caption = 'Cancelar'
            ImageIndex = 4
            OnClick = btnCancelarTipoProvaClick
          end
          object ToolButton15: TToolButton
            Left = 148
            Top = 0
            Width = 11
            Caption = 'ToolButton5'
            ImageIndex = 9
            Style = tbsSeparator
          end
        end
        object sbxTiposProva: TScrollBox
          Left = 0
          Top = 0
          Width = 467
          Height = 700
          Align = alClient
          TabOrder = 1
          object Label42: TLabel
            Left = 9
            Top = 196
            Width = 267
            Height = 14
            Caption = 'Tipos de Provas que o par'#226'metro de avalia'#231#227'o utilizar'#225':'
            FocusControl = DBMemo2
          end
          object Label43: TLabel
            Left = 8
            Top = 221
            Width = 122
            Height = 14
            Caption = 'Tipos de Prova usado:'
            Font.Charset = ANSI_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'Arial'
            Font.Style = [fsBold]
            ParentFont = False
          end
          object Label44: TLabel
            Left = 275
            Top = 221
            Width = 145
            Height = 14
            Caption = 'Tipos de Prova n'#227'o usado:'
            Font.Charset = ANSI_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'Arial'
            Font.Style = [fsBold]
            ParentFont = False
          end
          object Label56: TLabel
            Left = 8
            Top = 11
            Width = 97
            Height = 14
            Caption = 'Agrupar Avalia'#231#245'es'
          end
          object Bevel1: TBevel
            Left = 9
            Top = 27
            Width = 432
            Height = 5
            Shape = bsTopLine
          end
          object Bevel2: TBevel
            Left = 9
            Top = 123
            Width = 432
            Height = 5
            Shape = bsTopLine
          end
          object GroupBox3: TGroupBox
            Left = 8
            Top = 563
            Width = 433
            Height = 55
            Caption = 'Peso no c'#225'lculo da m'#233'dia:'
            TabOrder = 4
            object Label46: TLabel
              Left = 9
              Top = 23
              Width = 184
              Height = 14
              Caption = 'O peso total deste tipo de avalia'#231#227'o '#233':'
            end
            object edPeso: TDBEdit
              Left = 202
              Top = 20
              Width = 66
              Height = 22
              DataField = 'nr_peso'
              DataSource = dsProvasUsadas
              TabOrder = 0
            end
            object cbSemPesoFixo: TDBCheckBox
              Left = 274
              Top = 25
              Width = 97
              Height = 17
              Caption = 'Sem peso fixo'
              DataField = 'sn_sem_peso_fixo'
              DataSource = dsProvasUsadas
              Font.Charset = ANSI_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'Arial'
              Font.Style = [fsItalic]
              ParentFont = False
              TabOrder = 1
              ValueChecked = '1'
              ValueUnchecked = '0'
              OnClick = cbSemPesoFixoClick
            end
          end
          object GroupBox1: TGroupBox
            Left = 8
            Top = 414
            Width = 433
            Height = 80
            Caption = 'Quantidade de Avalia'#231#245'es por Etapa:'
            TabOrder = 6
            object Label48: TLabel
              Left = 9
              Top = 22
              Width = 35
              Height = 14
              Caption = 'M'#237'nima:'
            end
            object Label45: TLabel
              Left = 9
              Top = 50
              Width = 39
              Height = 14
              Caption = 'M'#225'xima:'
            end
            object edQuantidadeMinima: TDBEdit
              Left = 56
              Top = 19
              Width = 66
              Height = 22
              DataField = 'nr_qtd_minima'
              DataSource = dsProvasUsadas
              TabOrder = 0
            end
            object cbSemLimiteMinima: TDBCheckBox
              Left = 128
              Top = 24
              Width = 75
              Height = 17
              Caption = 'Sem limite'
              DataField = 'sn_sem_limite_minima'
              DataSource = dsProvasUsadas
              Font.Charset = ANSI_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'Arial'
              Font.Style = [fsItalic]
              ParentFont = False
              TabOrder = 1
              ValueChecked = '1'
              ValueUnchecked = '0'
              OnClick = cbSemLimiteMinimaClick
            end
            object edQuantidadeMaxima: TDBEdit
              Left = 56
              Top = 47
              Width = 66
              Height = 22
              DataField = 'nr_qtd_maxima'
              DataSource = dsProvasUsadas
              TabOrder = 2
            end
            object cbSemLimiteMaxima: TDBCheckBox
              Left = 128
              Top = 52
              Width = 75
              Height = 17
              Caption = 'Sem limite'
              DataField = 'sn_sem_limite_maxima'
              DataSource = dsProvasUsadas
              Font.Charset = ANSI_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'Arial'
              Font.Style = [fsItalic]
              ParentFont = False
              TabOrder = 3
              ValueChecked = '1'
              ValueUnchecked = '0'
              OnClick = cbSemLimiteMaximaClick
            end
          end
          object clbProvasTiposNaoUsado: TListBox
            Left = 275
            Top = 236
            Width = 166
            Height = 169
            ItemHeight = 14
            TabOrder = 0
          end
          object btnAdicionarProvaTipo: TButton
            Left = 189
            Top = 291
            Width = 69
            Height = 20
            Caption = '<< Adicionar'
            Font.Charset = ANSI_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'Arial'
            Font.Style = []
            ParentFont = False
            TabOrder = 1
            OnClick = btnAdicionarProvaTipoClick
          end
          object btnRemoverProvaTipo: TButton
            Left = 189
            Top = 317
            Width = 69
            Height = 20
            Caption = 'Remover >>'
            Font.Charset = ANSI_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'Arial'
            Font.Style = []
            ParentFont = False
            TabOrder = 2
            OnClick = btnRemoverProvaTipoClick
          end
          object clbProvasTiposUsado: TListBox
            Left = 8
            Top = 236
            Width = 166
            Height = 169
            ItemHeight = 14
            TabOrder = 3
            OnClick = clbProvasTiposUsadoClick
          end
          object dbrgPadraoBloqueado: TDBRadioGroup
            Left = 8
            Top = 502
            Width = 433
            Height = 51
            Caption = 'Inclus'#227'o Padr'#227'o Bloqueada?'
            Columns = 2
            DataField = 'sn_bloqueada'
            DataSource = dsProvasUsadas
            Items.Strings = (
              'Sim'
              'N'#227'o')
            ParentBackground = True
            TabOrder = 5
            Values.Strings = (
              '1'
              '0')
          end
          object DBCheckBox29: TDBCheckBox
            Left = 5
            Top = 31
            Width = 432
            Height = 28
            Caption = 
              'Agrupar as avalia'#231#245'es por tipo na visualiza'#231#227'o do di'#225'rio online ' +
              'e apresentar a m'#233'dia parcial dos resultados.'
            DataField = 'sn_agrupar_avaliacao_tipo'
            DataSource = dsAvaliacoes
            Font.Charset = ANSI_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'Arial'
            Font.Style = []
            ParentFont = False
            TabOrder = 7
            ValueChecked = '1'
            ValueUnchecked = '0'
            WordWrap = True
            OnClick = DBCheckBox29Click
          end
          object DBRadioGroup3: TDBRadioGroup
            Left = 8
            Top = 65
            Width = 432
            Height = 52
            Columns = 3
            DataField = 'sn_media_notas_digitadas'
            DataSource = dsAvaliacoes
            Items.Strings = (
              'M'#233'dia notas digitadas'
              'M'#233'dia todas notas'
              'M'#233'dia pesos'
              'Somar todas as notas')
            ParentBackground = True
            TabOrder = 8
            Values.Strings = (
              '1'
              '0'
              '2'
              '3')
          end
          object dbrgDiscFrenteMedia: TDBRadioGroup
            Left = 9
            Top = 130
            Width = 433
            Height = 59
            Caption = 'Na utiliza'#231#227'o de disciplinas m'#227'e, atribuir a nota com base:'
            Columns = 2
            DataField = 'sn_disc_frente_media'
            DataSource = dsAvaliacoes
            Items.Strings = (
              'Copiar cada prova para a m'#227'e'
              'Na soma das notas das provas do tipo'
              'N'#227'o fazer a'#231#227'o com as notas parciais')
            ParentBackground = True
            TabOrder = 9
            Values.Strings = (
              '1'
              '0'
              '2')
          end
          object DBCheckBox55: TDBCheckBox
            Left = 9
            Top = 624
            Width = 420
            Height = 17
            Caption = 'Considerar como nota de participa'#231#227'o'
            DataField = 'sn_considerar_participacao'
            DataSource = dsProvasUsadas
            Font.Charset = ANSI_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'Arial'
            Font.Style = []
            ParentFont = False
            TabOrder = 10
            ValueChecked = '1'
            ValueUnchecked = '0'
          end
          object DBCheckBox56: TDBCheckBox
            Left = 9
            Top = 647
            Width = 423
            Height = 17
            Caption = 'Ocultar este tipo de prova para o aluno'
            DataField = 'sn_ocultar_prova_aluno'
            DataSource = dsProvasUsadas
            Font.Charset = ANSI_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'Arial'
            Font.Style = []
            ParentFont = False
            TabOrder = 11
            ValueChecked = '1'
            ValueUnchecked = '0'
          end
        end
      end
      object TabSheet2: TTabSheet
        Caption = 'Tipos de Aulas'
        ImageIndex = 11
        object Label67: TLabel
          Left = 7
          Top = 34
          Width = 120
          Height = 14
          Caption = 'Tipos de aula usados:'
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object Label68: TLabel
          Left = 274
          Top = 34
          Width = 143
          Height = 14
          Caption = 'Tipos de aula n'#227'o usados:'
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object Label69: TLabel
          Left = 8
          Top = 9
          Width = 259
          Height = 14
          Caption = 'Tipos de aulas que o par'#226'metro de avalia'#231#227'o utilizar'#225':'
          FocusControl = DBMemo2
        end
        object lbNaoUsados: TListBox
          Left = 274
          Top = 49
          Width = 166
          Height = 169
          ItemHeight = 14
          TabOrder = 0
        end
        object lbUsados: TListBox
          Left = 7
          Top = 49
          Width = 166
          Height = 169
          ItemHeight = 14
          TabOrder = 1
          OnClick = lbUsadosClick
        end
        object btnRemover: TButton
          Left = 188
          Top = 130
          Width = 69
          Height = 20
          Caption = 'Remover >>'
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = []
          ParentFont = False
          TabOrder = 2
          OnClick = btnRemoverClick
        end
        object btnAdicionar: TButton
          Left = 188
          Top = 104
          Width = 69
          Height = 20
          Caption = '<< Adicionar'
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = []
          ParentFont = False
          TabOrder = 3
          OnClick = btnAdicionarClick
        end
        object cbAulaTipoPadrao: TCheckBox
          Left = 8
          Top = 224
          Width = 203
          Height = 17
          Caption = 'Utilizar esse tipo de aula como padr'#227'o'
          TabOrder = 4
          OnClick = cbAulaTipoPadraoClick
        end
      end
      object tsDiarioEletro: TTabSheet
        Caption = 'Di'#225'rio Eletr'#244'nico'
        ImageIndex = 4
        object ScrollBox5: TScrollBox
          Left = 0
          Top = 0
          Width = 467
          Height = 725
          HorzScrollBar.Visible = False
          Align = alClient
          TabOrder = 0
          object DBCheckBox17: TDBCheckBox
            Left = 8
            Top = 8
            Width = 433
            Height = 17
            Caption = 'Utilizar o Di'#225'rio de Classe Eletr'#244'nico'
            DataField = 'sn_diario_eletro'
            DataSource = dsAvaliacoes
            TabOrder = 0
            ValueChecked = '1'
            ValueUnchecked = '0'
          end
          object ckBaixar: TDBCheckBox
            Left = 16
            Top = 54
            Width = 361
            Height = 17
            Caption = 'Permitir baixar dados para o di'#225'rio de classe eletr'#244'nico.'
            DataField = 'sn_notas_diario'
            DataSource = dsAvaliacoes
            TabOrder = 1
            ValueChecked = 'S'
            ValueUnchecked = 'N'
          end
          object ckImportarFrequencia: TDBCheckBox
            Left = 16
            Top = 126
            Width = 361
            Height = 17
            Caption = 'Importar a freq'#252#234'ncia dos alunos do di'#225'rio de classe eletr'#244'nico.'
            DataField = 'sn_diario_imp_freqs'
            DataSource = dsAvaliacoes
            TabOrder = 2
            ValueChecked = 'S'
            ValueUnchecked = 'N'
          end
          object ckImportarConteudo: TDBCheckBox
            Left = 16
            Top = 102
            Width = 361
            Height = 17
            Caption = 'Importar o conte'#250'do program'#225'tico do di'#225'rio de classe eletr'#244'nico.'
            DataField = 'sn_diario_imp_contprog'
            DataSource = dsAvaliacoes
            TabOrder = 3
            ValueChecked = 'S'
            ValueUnchecked = 'N'
          end
          object ckImportarNotas: TDBCheckBox
            Left = 16
            Top = 78
            Width = 265
            Height = 17
            Caption = 'Importar notas do di'#225'rio de classe eletr'#244'nico.'
            DataField = 'sn_diario_imp_notas'
            DataSource = dsAvaliacoes
            TabOrder = 4
            ValueChecked = 'S'
            ValueUnchecked = 'N'
          end
          object ckDigitaMedias: TDBCheckBox
            Left = 16
            Top = 30
            Width = 353
            Height = 17
            Caption = 'Permitir digita'#231#227'o das m'#233'dias pelo professor no m'#243'dulo on-line.'
            DataField = 'sn_notas_diario_online'
            DataSource = dsAvaliacoes
            TabOrder = 5
            ValueChecked = 'S'
            ValueUnchecked = 'N'
          end
        end
      end
      object tsAvaliacaoPeriodica: TTabSheet
        Caption = 'Avalia'#231#227'o Peri'#243'dica'
        ImageIndex = 5
        object ScrollBox6: TScrollBox
          Left = 0
          Top = 0
          Width = 467
          Height = 725
          HorzScrollBar.Visible = False
          Align = alClient
          TabOrder = 0
          object Label26: TLabel
            Left = 8
            Top = 8
            Width = 97
            Height = 14
            Caption = 'N'#250'mero de Per'#237'odos'
            FocusControl = DBEdit22
          end
          object Label27: TLabel
            Left = 8
            Top = 56
            Width = 138
            Height = 14
            Caption = 'F'#243'rmula da m'#233'dia do per'#237'odo'
            FocusControl = DBEdit23
          end
          object Label28: TLabel
            Left = 8
            Top = 104
            Width = 168
            Height = 14
            Hint = 
              'Exemplo: SE(media_periodo>=7;1;2)  -> 1 = Transita (Aprovado), 2' +
              ' = N'#227'o Transita (Reprovado)'
            Caption = 'Condi'#231#227'o para situa'#231#227'o do per'#237'odo'
            FocusControl = DBEdit24
          end
          object DBEdit22: TDBEdit
            Left = 8
            Top = 24
            Width = 102
            Height = 22
            DataField = 'nr_periodos'
            DataSource = dsAvaliacoes
            TabOrder = 0
          end
          object DBEdit23: TDBEdit
            Left = 8
            Top = 72
            Width = 417
            Height = 22
            DataField = 'ds_formula_periodo'
            DataSource = dsAvaliacoes
            TabOrder = 1
          end
          object DBEdit24: TDBEdit
            Left = 8
            Top = 120
            Width = 417
            Height = 22
            Hint = 
              'Exemplo: SE(media_periodo>=7,1,2)   -->   1 = Transita (APROVADO' +
              '), 2 = N'#227'o Transita (REPROVADO)'
            DataField = 'ds_condicao_situacao_periodo'
            DataSource = dsAvaliacoes
            TabOrder = 2
          end
        end
      end
      object tsCurso: TTabSheet
        Caption = 'M'#233'dia Curso'
        ImageIndex = 6
        object Label30: TLabel
          Left = 13
          Top = 54
          Width = 130
          Height = 14
          Caption = 'F'#243'rmula da m'#233'dia do curso'
          FocusControl = DBEdit25
        end
        object Label31: TLabel
          Left = 13
          Top = 98
          Width = 417
          Height = 39
          AutoSize = False
          FocusControl = DBEdit25
        end
        object Label32: TLabel
          Left = 13
          Top = 98
          Width = 345
          Height = 28
          Caption = 
            'Para usar os grupos de disciplinas,  coloque CATEGORIA(CHAVE) '#233' ' +
            'a chave cadastrada na Categoria de disciplinas.'
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = [fsItalic]
          ParentFont = False
          WordWrap = True
        end
        object DBEdit25: TDBEdit
          Left = 13
          Top = 70
          Width = 417
          Height = 22
          DataField = 'ds_formula_media_curso'
          DataSource = dsAvaliacoes
          TabOrder = 0
        end
        object DBCheckBox20: TDBCheckBox
          Left = 11
          Top = 23
          Width = 425
          Height = 17
          Caption = 'Usar m'#233'dia do curso'
          DataField = 'sn_usar_media_curso'
          DataSource = dsAvaliacoes
          TabOrder = 1
          ValueChecked = '1'
          ValueUnchecked = '0'
        end
      end
      object TabSheet1: TTabSheet
        Caption = 'Diversos'
        ImageIndex = 7
        object Label33: TLabel
          Left = 4
          Top = 16
          Width = 410
          Height = 14
          Caption = 
            'Siglas para apresenta'#231#227'o na Ficha-Individual e no Desempenho pel' +
            'o Sistema On-line.'
          FocusControl = DBMemo2
        end
        object Label34: TLabel
          Left = 4
          Top = 33
          Width = 461
          Height = 14
          Caption = 
            'Exemplo de preenchimento: codigoaluno=Matr'#237'cula;nome=Aluno;sigla' +
            '=Discip.;nota1=1'#186'Bim;...'
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = [fsItalic]
          ParentFont = False
        end
        object Label35: TLabel
          Left = 4
          Top = 175
          Width = 448
          Height = 28
          Caption = 
            '* Se n'#227'o preencher o campo Siglas, o sistema assumir'#225' as descri'#231 +
            #245'es padr'#245'es. Se usar o campo, deve ser relacionado todos os camp' +
            'os necess'#225'rios. Os demais ser'#227'o ocultados.'
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = [fsItalic]
          ParentFont = False
          WordWrap = True
        end
        object Bevel9: TBevel
          Left = 5
          Top = 215
          Width = 457
          Height = 3
          Shape = bsTopLine
        end
        object Label64: TLabel
          Left = 3
          Top = 229
          Width = 42
          Height = 14
          Caption = 'S'#237'ntese: '
          FocusControl = DBMemo2
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = []
          ParentFont = False
        end
        object DBMemo2: TDBMemo
          Left = 3
          Top = 56
          Width = 453
          Height = 113
          DataField = 'ds_sigla'
          DataSource = dsAvaliacoes
          TabOrder = 0
        end
        object DBMemo3: TDBMemo
          Left = 3
          Top = 249
          Width = 453
          Height = 113
          DataField = 'ds_sintese_avaliacao'
          DataSource = dsAvaliacoes
          TabOrder = 1
        end
      end
      object pgPrazos: TTabSheet
        Caption = 'Prazos'
        ImageIndex = 10
        object Label49: TLabel
          Left = 6
          Top = 7
          Width = 450
          Height = 28
          Caption = 
            'A cria'#231#227'o dos prazos padr'#245'es apenas se aplicam para institui'#231#245'es' +
            ' que utilizam o cadastro de Cronogramas de Aulas.'
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = [fsItalic]
          ParentFont = False
          WordWrap = True
        end
        object GroupBox2: TGroupBox
          Left = 9
          Top = 43
          Width = 450
          Height = 91
          Caption = 'Prazo para professor poder visualizar o di'#225'rio'
          TabOrder = 0
          object Label51: TLabel
            Left = 16
            Top = 28
            Width = 27
            Height = 14
            Caption = 'In'#237'cio:'
          end
          object Label52: TLabel
            Left = 24
            Top = 56
            Width = 19
            Height = 14
            Caption = 'Fim:'
          end
          object DBEInicioDiario: TDBEdit
            Left = 64
            Top = 25
            Width = 369
            Height = 22
            DataField = 'ds_cronograma_visualiza_inicio'
            DataSource = dsAvaliacoes
            TabOrder = 0
          end
          object DBEFimDiario: TDBEdit
            Left = 64
            Top = 53
            Width = 369
            Height = 22
            DataField = 'ds_cronograma_visualiza_fim'
            DataSource = dsAvaliacoes
            TabOrder = 1
          end
        end
        object GroupBox7: TGroupBox
          Left = 9
          Top = 145
          Width = 450
          Height = 91
          Caption = 'Prazo para professor poder registrar notas'
          TabOrder = 1
          object Label58: TLabel
            Left = 16
            Top = 28
            Width = 27
            Height = 14
            Caption = 'In'#237'cio:'
          end
          object Label59: TLabel
            Left = 24
            Top = 56
            Width = 19
            Height = 14
            Caption = 'Fim:'
          end
          object DBEInicioNota: TDBEdit
            Left = 64
            Top = 25
            Width = 369
            Height = 22
            DataField = 'ds_cronograma_notas_inicio'
            DataSource = dsAvaliacoes
            TabOrder = 0
          end
          object DBEFimNota: TDBEdit
            Left = 64
            Top = 53
            Width = 369
            Height = 22
            DataField = 'ds_cronograma_notas_fim'
            DataSource = dsAvaliacoes
            TabOrder = 1
          end
        end
        object GroupBox4: TGroupBox
          Left = 9
          Top = 247
          Width = 450
          Height = 91
          Caption = 'Prazo para professor registrar aulas'
          TabOrder = 2
          object Label54: TLabel
            Left = 16
            Top = 28
            Width = 27
            Height = 14
            Caption = 'In'#237'cio:'
          end
          object Label55: TLabel
            Left = 24
            Top = 56
            Width = 19
            Height = 14
            Caption = 'Fim:'
          end
          object DBEInicioFrequencia: TDBEdit
            Left = 64
            Top = 25
            Width = 369
            Height = 22
            DataField = 'ds_cronograma_aulas_inicio'
            DataSource = dsAvaliacoes
            TabOrder = 0
          end
          object DBEFimFrequencia: TDBEdit
            Left = 64
            Top = 53
            Width = 369
            Height = 22
            DataField = 'ds_cronograma_aulas_fim'
            DataSource = dsAvaliacoes
            TabOrder = 1
          end
        end
        object GroupBox5: TGroupBox
          Left = 9
          Top = 349
          Width = 450
          Height = 65
          Caption = 'Prazo para libera'#231#227'o dos resultados'
          TabOrder = 3
          object Label53: TLabel
            Left = 18
            Top = 28
            Width = 25
            Height = 14
            Caption = 'Data:'
          end
          object DBELiberacaoResultado: TDBEdit
            Left = 64
            Top = 25
            Width = 369
            Height = 22
            DataField = 'ds_cronograma_liberacao'
            DataSource = dsAvaliacoes
            TabOrder = 0
          end
        end
      end
    end
    object Panel4: TPanel
      Left = 0
      Top = 0
      Width = 475
      Height = 69
      Align = alTop
      BevelOuter = bvNone
      TabOrder = 1
      object Label1: TLabel
        Left = 8
        Top = 1
        Width = 73
        Height = 14
        Caption = 'Cod. Avalia'#231#227'o'
        FocusControl = DBEdit1
      end
      object Label2: TLabel
        Left = 98
        Top = 1
        Width = 115
        Height = 14
        Caption = 'Descri'#231#227'o da Avalia'#231#227'o'
        FocusControl = DBEdit2
      end
      object DBEdit1: TDBEdit
        Left = 8
        Top = 17
        Width = 79
        Height = 22
        DataField = 'cd_avaliacao'
        DataSource = dsAvaliacoes
        Enabled = False
        TabOrder = 0
      end
      object DBEdit2: TDBEdit
        Left = 96
        Top = 17
        Width = 360
        Height = 22
        DataField = 'ds_avaliacao'
        DataSource = dsAvaliacoes
        TabOrder = 1
      end
    end
  end
  object ImageList1: TImageList
    Left = 672
    Top = 168
    Bitmap = {
      494C010109000E00040010001000FFFFFFFFFF10FFFFFFFFFFFFFFFF424D3600
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
      0000000000008D5D59008D5D59008D5D59008D5D59008D5D59008D5D59008D5D
      59008D5D59008D5D59008D5D5900000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000008D5D5900F6E1CC00FEDAB600FED7AF00FECD9D00FECA9700FDC3
      8B00FBC08700FBC08700FBC08700000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000093605900FCE9D600FEDFBF00FEDCBA00FED3A800FECFA100FEC6
      8F00FDC38B00FBC08700FBC08700000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000A0675E00FDF5ED00FEEEDE00FCE9D600FEDFBF00FEDAB600FED1
      A500FECC9B00FEC68F00FDC38B00000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000008D5D59008D5D59008D5D
      59008D5D5900A2696100FDFAF700FDF3E900FEEEDE00FAE6D100FEDFBF00FED7
      AF00FED3A800FECA9700FEC89300000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000F6E1CC00FEDFBF00FED7
      AF00FED1A500B2796300FEFDFE00FDFBF900FDF8F300FDF0E300FEEEDE00FAE6
      D100FEDFBF00FED5AB00FED1A500000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000FCE9D600FAE6D100FEDC
      BA00FED7AF00BA7F6100FEFDFE00FEFDFE00FDFCFA00FDF5ED00FDF3E900FCE9
      D600FAE6D100FEDCBA00FED7AF00000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000FDF5ED00FDF0E300FCE9
      D600FAE6D100D3946C00FEFDFE00FEFDFE00FEFDFE00FEFDFE00FDFBF900FDF5
      ED00FDF0E300FCE9D600F6E1CC00000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000FDFAF700FDF7F100FEEE
      DE00FCE9D600D4976F00FEFDFE00FEFDFE00FEFDFE00FEFDFE00FEFDFE00FDF3
      E900F3DEC800C0A69000BEA38D00000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000FEFDFE00FEFDFE00FDF8
      F300FDF5ED00D89F7600FEFDFE00FEFDFE00FEFDFE00FEFDFE00FEFDFE00FEFD
      FE00A0675E00DF924000DE903C00000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000FEFDFE00FEFDFE00FDFC
      FA00FDFAF700D89F7600FEFDFE00FEFDFE00FEFDFE00FEFDFE00FEFDFE00FEFD
      FE00A0675E00DE944400DE903C00000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000FEFDFE00FEFDFE00FEFD
      FE00FEFDFE00D89F7600D3946C00D3946C00D3946C00D3946C00D3946C00D394
      6C00A0675E000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000FEFDFE00FEFDFE00FEFD
      FE00FEFDFE00FEFDFE00FDFCFA00F3DEC800C6AD9500BEA38D00724241000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000FEFDFE00FEFDFE00FEFD
      FE00FEFDFE00FEFDFE00FEFDFE00A0675E00DC9B5C00DE903C00A56C64000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000FEFDFE00FEFDFE00FEFD
      FE00FEFDFE00FEFDFE00FEFDFE00A0675E00DB9D6300DE903C00000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000D3946C00D3946C00D394
      6C00D3946C00D3946C00D3946C00A0675E00DB9D630000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
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
      00000000000000000000000000000000F801000000000000F801000000000000
      F801000000000000F80100000000000080010000000000008001000000000000
      8001000000000000800100000000000080010000000000008001000000000000
      80010000000000008007000000000000801F000000000000801F000000000000
      803F000000000000807F000000000000FFFFF8F8FFFFFFFFF83FFAFAFC7FE3FF
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
  object tblAvaliacoes: TUMZQuery
    Connection = DM.db
    AfterOpen = tblAvaliacoesAfterOpen
    BeforeInsert = tblAvaliacoesBeforeInsert
    BeforeEdit = tblAvaliacoesBeforeEdit
    BeforePost = tblAvaliacoesBeforePost
    OnNewRecord = tblAvaliacoesNewRecord
    SQL.Strings = (
      'SELECT'
      '   *            '
      'FROM          '
      '    avaliacoes_parametros_matriz ')
    Params = <>
    Left = 741
    Top = 169
    object tblAvaliacoescd_avaliacao: TSmallintField
      DisplayLabel = 'Cod. Avalia'#231#227'o'
      FieldName = 'cd_avaliacao'
      Origin = 'WMESTRE12.avaliacoes_parametros.cd_avaliacao'
    end
    object tblAvaliacoesds_avaliacao: TStringField
      DisplayLabel = 'Descri'#231#227'o da Avalia'#231#227'o'
      FieldName = 'ds_avaliacao'
      Origin = 'WMESTRE12.avaliacoes_parametros.ds_avaliacao'
      Size = 100
    end
    object tblAvaliacoesnr_avaliacoes: TSmallintField
      DisplayLabel = 'Nr. de Avalia'#231#245'es '
      FieldName = 'nr_avaliacoes'
      Origin = 'WMESTRE12.avaliacoes_parametros.nr_avaliacoes'
    end
    object tblAvaliacoescd_periodo_avaliacao: TSmallintField
      DisplayLabel = 'Cod. Per'#237'odo de Avalia'#231#227'o'
      FieldName = 'cd_periodo_avaliacao'
      Origin = 'WMESTRE12.avaliacoes_parametros.cd_periodo_avaliacao'
    end
    object tblAvaliacoesds_cond_aprov_direta: TStringField
      DisplayLabel = 'Condi'#231#227'o para Aprova'#231#227'o Direta'
      FieldName = 'ds_cond_aprov_direta'
      Origin = 'WMESTRE12.avaliacoes_parametros.ds_cond_aprov_direta'
      Size = 250
    end
    object tblAvaliacoesds_cond_repro_direta: TStringField
      DisplayLabel = 'Condi'#231#227'o para Reprova'#231#227'o Direta'
      FieldName = 'ds_cond_repro_direta'
      Origin = 'WMESTRE12.avaliacoes_parametros.ds_cond_repro_direta'
      Size = 250
    end
    object tblAvaliacoesds_formula_media_final: TStringField
      DisplayLabel = 'F'#243'rmula da M'#233'dia Final'
      FieldName = 'ds_formula_media_final'
      Origin = 'WMESTRE12.avaliacoes_parametros.ds_formula_media_final'
      Size = 250
    end
    object tblAvaliacoesds_formula_media_exame: TStringField
      DisplayLabel = 'F'#243'rmula da M'#233'dia ap'#243's Exame'
      FieldName = 'ds_formula_media_exame'
      Origin = 'WMESTRE12.avaliacoes_parametros.ds_formula_media_exame'
      Size = 250
    end
    object tblAvaliacoesds_formula_media_segunda: TStringField
      DisplayLabel = 'F'#243'rmula da M'#233'dia Ap'#243's Segunda '#201'poca'
      FieldName = 'ds_formula_media_segunda'
      Origin = 'WMESTRE12.avaliacoes_parametros.ds_formula_media_segunda'
      Size = 250
    end
    object tblAvaliacoesds_cond_aprov_exame: TStringField
      DisplayLabel = 'Condi'#231#227'o para Aprova'#231#227'o com Exame'
      FieldName = 'ds_cond_aprov_exame'
      Origin = 'WMESTRE12.avaliacoes_parametros.ds_cond_aprov_exame'
      Size = 250
    end
    object tblAvaliacoesds_cond_aprov_segunda: TStringField
      DisplayLabel = 'Condi'#231#227'o para Aprova'#231#227'o com Segunda '#201'poca'
      FieldName = 'ds_cond_aprov_segunda'
      Origin = 'WMESTRE12.avaliacoes_parametros.ds_cond_aprov_segunda'
      Size = 250
    end
    object tblAvaliacoesnr_max_disci_exame: TSmallintField
      DisplayLabel = 'Nr. M'#225'ximo de Disciplinas em Exame'
      FieldName = 'nr_max_disci_exame'
      Origin = 'WMESTRE12.avaliacoes_parametros.nr_max_disci_exame'
    end
    object tblAvaliacoesnr_max_disci_segunda: TSmallintField
      DisplayLabel = 'Nr. M'#225'ximo de Disciplinas em Segunda '#201'poca'
      FieldName = 'nr_max_disci_segunda'
      Origin = 'WMESTRE12.avaliacoes_parametros.nr_max_disci_segunda'
    end
    object tblAvaliacoessn_conceitos: TStringField
      DisplayLabel = 'Avalia'#231#227'o por Conceito'
      FieldName = 'sn_conceitos'
      Origin = 'WMESTRE12.avaliacoes_parametros.sn_conceitos'
      FixedChar = True
      Size = 3
    end
    object tblAvaliacoessn_descricao: TStringField
      DisplayLabel = 'Avalia'#231#227'o Descritiva'
      FieldName = 'sn_descricao'
      Origin = 'WMESTRE12.avaliacoes_parametros.sn_descricao'
      FixedChar = True
      Size = 3
    end
    object tblAvaliacoessn_exame: TStringField
      DisplayLabel = 'Aplicar Exame'
      FieldName = 'sn_exame'
      Origin = 'WMESTRE12.avaliacoes_parametros.sn_exame'
      FixedChar = True
      Size = 3
    end
    object tblAvaliacoessn_pi: TStringField
      DisplayLabel = 'Aplicar Prova Institucional'
      FieldName = 'sn_pi'
      Origin = 'WMESTRE12.avaliacoes_parametros.sn_pi'
      FixedChar = True
      Size = 3
    end
    object tblAvaliacoessn_segunda_epoca: TStringField
      DisplayLabel = 'Aplicar Segunda '#201'poca'
      FieldName = 'sn_segunda_epoca'
      Origin = 'WMESTRE12.avaliacoes_parametros.sn_segunda_epoca'
      FixedChar = True
      Size = 3
    end
    object tblAvaliacoessn_frequencia_global: TStringField
      DisplayLabel = 'Frequencia Global para Aprova'#231#227'o'
      FieldName = 'sn_frequencia_global'
      Origin = 'WMESTRE12.avaliacoes_parametros.sn_frequencia_global'
      FixedChar = True
      Size = 1
    end
    object tblAvaliacoesds_frequencia_tipo: TStringField
      DisplayLabel = 'Controle de Frequencia'
      FieldName = 'ds_frequencia_tipo'
      Origin = 'WMESTRE12.avaliacoes_parametros.ds_frequencia_tipo'
      FixedChar = True
      Size = 1
    end
    object tblAvaliacoessn_recuperacao: TStringField
      DisplayLabel = 'Aplicar nota de Recupera'#231#227'o'
      FieldName = 'sn_recuperacao'
      Origin = 'WMESTRE12.avaliacoes_parametros.sn_recuperacao'
      FixedChar = True
      Size = 1
    end
    object tblAvaliacoesds_formula_recuperacao: TStringField
      DisplayLabel = 'F'#243'rmula da Recupera'#231#227'o'
      FieldName = 'ds_formula_recuperacao'
      Origin = 'WMESTRE12.avaliacoes_parametros.ds_formula_recuperacao'
      Size = 250
    end
    object tblAvaliacoesds_cond_recuperacao: TStringField
      DisplayLabel = 'Condi'#231#227'o para Aplicar a Recupera'#231#227'o'
      FieldName = 'ds_cond_recuperacao'
      Origin = 'WMESTRE12.avaliacoes_parametros.ds_cond_recuperacao'
      Size = 250
    end
    object tblAvaliacoesnr_casas_decimais: TSmallintField
      DisplayLabel = 'Nr. de Casas Decimais'
      FieldName = 'nr_casas_decimais'
      Origin = 'WMESTRE12.avaliacoes_parametros.nr_casas_decimais'
    end
    object tblAvaliacoesdescPeriodoAvaliacoes: TStringField
      FieldKind = fkLookup
      FieldName = 'descPeriodoAvaliacoes'
      LookupDataSet = tblPeriodicidade
      LookupKeyFields = 'cd_periodo_avaliacao'
      LookupResultField = 'ds_periodicidade'
      KeyFields = 'cd_periodo_avaliacao'
      Lookup = True
    end
    object tblAvaliacoesvl_arredondamento: TFloatField
      DisplayLabel = 'Peso para arredondamento'
      FieldName = 'vl_arredondamento'
      Origin = 'WMESTRE12.avaliacoes_parametros.vl_arredondamento'
    end
    object tblAvaliacoesds_formula_media_anual: TMemoField
      DisplayLabel = 'F'#243'rmula da M'#233'dia da Etapa'
      FieldName = 'ds_formula_media_anual'
      Origin = 'WMESTRE12.avaliacoes_parametros.ds_formula_media_anual'
      BlobType = ftMemo
    end
    object tblAvaliacoessn_notas_diario_online: TStringField
      FieldName = 'sn_notas_diario_online'
      Origin = 'WMESTRE12.avaliacoes_parametros.sn_notas_diario_online'
      FixedChar = True
      Size = 1
    end
    object tblAvaliacoessn_notas_diario: TStringField
      FieldName = 'sn_notas_diario'
      Origin = 'WMESTRE12.avaliacoes_parametros.sn_notas_diario'
      FixedChar = True
      Size = 1
    end
    object tblAvaliacoessn_desblo_coorde: TStringField
      FieldName = 'sn_desblo_coorde'
      Origin = 'WMESTRE12.avaliacoes_parametros.sn_desblo_coorde'
      FixedChar = True
      Size = 1
    end
    object tblAvaliacoessn_diario_imp_notas: TStringField
      FieldName = 'sn_diario_imp_notas'
      Origin = 'WMESTRE12.avaliacoes_parametros.sn_diario_imp_notas'
      FixedChar = True
      Size = 1
    end
    object tblAvaliacoessn_diario_imp_freqs: TStringField
      FieldName = 'sn_diario_imp_freqs'
      Origin = 'WMESTRE12.avaliacoes_parametros.sn_diario_imp_freqs'
      FixedChar = True
      Size = 1
    end
    object tblAvaliacoessn_notas_truncar: TStringField
      FieldName = 'sn_notas_truncar'
      Origin = 'WMESTRE12.avaliacoes_parametros.sn_notas_truncar'
      FixedChar = True
      Size = 1
    end
    object tblAvaliacoessn_diario_imp_contprog: TStringField
      FieldName = 'sn_diario_imp_contprog'
      Origin = 'WMESTRE12.avaliacoes_parametros.sn_diario_imp_contprog'
      FixedChar = True
      Size = 1
    end
    object tblAvaliacoesds_nota_exame: TStringField
      FieldName = 'ds_nota_exame'
      Origin = 'WMESTRE12.avaliacoes_parametros.ds_nota_exame'
      Size = 255
    end
    object tblAvaliacoesds_nota_segunda: TStringField
      FieldName = 'ds_nota_segunda'
      Origin = 'WMESTRE12.avaliacoes_parametros.ds_nota_segunda'
      Size = 255
    end
    object tblAvaliacoessn_medias_truncar: TStringField
      FieldName = 'sn_medias_truncar'
      Origin = 'WMESTRE12.avaliacoes_parametros.sn_medias_truncar'
      FixedChar = True
      Size = 1
    end
    object tblAvaliacoessn_anual_truncar: TStringField
      FieldName = 'sn_anual_truncar'
      Origin = 'WMESTRE12.avaliacoes_parametros.sn_anual_truncar'
      FixedChar = True
      Size = 1
    end
    object tblAvaliacoessn_diario_online_recalc_medias: TSmallintField
      FieldName = 'sn_diario_online_recalc_medias'
      Origin = 'WMESTRE12.avaliacoes_parametros.sn_diario_online_recalc_medias'
    end
    object tblAvaliacoessn_diario_online: TSmallintField
      FieldName = 'sn_diario_online'
      Origin = 'WMESTRE12.avaliacoes_parametros.sn_diario_online'
    end
    object tblAvaliacoessn_diario_eletro: TIntegerField
      FieldName = 'sn_diario_eletro'
      Origin = 'WMESTRE12.avaliacoes_parametros.sn_diario_eletro'
    end
    object tblAvaliacoessn_diario_online_aulas: TSmallintField
      FieldName = 'sn_diario_online_aulas'
      Origin = 'WMESTRE12.avaliacoes_parametros.sn_diario_online_aulas'
    end
    object tblAvaliacoessn_diario_online_provas: TSmallintField
      FieldName = 'sn_diario_online_provas'
      Origin = 'WMESTRE12.avaliacoes_parametros.sn_diario_online_provas'
    end
    object tblAvaliacoessn_diario_online_bloque_aulas: TIntegerField
      FieldName = 'sn_diario_online_bloque_aulas'
      Origin = 'WMESTRE12.avaliacoes_parametros.sn_diario_online_bloque_aulas'
    end
    object tblAvaliacoessn_diario_online_bloque_provas: TIntegerField
      FieldName = 'sn_diario_online_bloque_provas'
      Origin = 'WMESTRE12.avaliacoes_parametros.sn_diario_online_bloque_provas'
    end
    object tblAvaliacoesnr_casas_decimais_forcado: TIntegerField
      FieldName = 'nr_casas_decimais_forcado'
      Origin = 'WMESTRE12.avaliacoes_parametros.nr_casas_decimais_forcado'
    end
    object tblAvaliacoessn_altera_notas_direta: TIntegerField
      FieldName = 'sn_altera_notas_direta'
      Origin = 'WMESTRE12.avaliacoes_parametros.sn_altera_notas_direta'
    end
    object tblAvaliacoessn_converter_notas_nulas: TIntegerField
      FieldName = 'sn_converter_notas_nulas'
      Origin = 'WMESTRE12.avaliacoes_parametros.sn_converter_notas_nulas'
    end
    object tblAvaliacoessn_mostrar_alunos_curs_padrao: TSmallintField
      FieldName = 'sn_mostrar_alunos_curs_padrao'
      Origin = 'WMESTRE12.avaliacoes_parametros.sn_mostrar_alunos_curs_padrao'
    end
    object tblAvaliacoessn_ins_aulas_semhorario: TSmallintField
      FieldName = 'sn_ins_aulas_semhorario'
      Origin = 'WMESTRE12.avaliacoes_parametros.sn_ins_aulas_semhorario'
    end
    object tblAvaliacoessn_ajuste_apos_recuperacao: TSmallintField
      FieldName = 'sn_ajuste_apos_recuperacao'
      Origin = 'WMESTRE12.avaliacoes_parametros.sn_ajuste_apos_recuperacao'
    end
    object tblAvaliacoesds_formula_padrao: TStringField
      FieldName = 'ds_formula_padrao'
      Origin = 'WMESTRE12.avaliacoes_parametros.ds_formula_padrao'
      Size = 255
    end
    object tblAvaliacoessn_obrigar_formula_padrao: TSmallintField
      FieldName = 'sn_obrigar_formula_padrao'
      Origin = 'WMESTRE12.avaliacoes_parametros.sn_obrigar_formula_padrao'
    end
    object tblAvaliacoestp_ajuste_forcado: TSmallintField
      FieldName = 'tp_ajuste_forcado'
      Origin = 'WMESTRE12.avaliacoes_parametros.tp_ajuste_forcado'
    end
    object tblAvaliacoestp_ajuste_forcado_media: TSmallintField
      FieldName = 'tp_ajuste_forcado_media'
      Origin = 'WMESTRE12.avaliacoes_parametros.tp_ajuste_forcado_media'
    end
    object tblAvaliacoesds_criterio_recuperacao: TStringField
      FieldName = 'ds_criterio_recuperacao'
      Origin = 'WMESTRE12.avaliacoes_parametros.ds_criterio_recuperacao'
      Size = 100
    end
    object tblAvaliacoesds_formula_media_sem_pi: TStringField
      FieldName = 'ds_formula_media_sem_pi'
      Origin = 'WMESTRE12.avaliacoes_parametros.ds_formula_media_sem_pi'
      Size = 250
    end
    object tblAvaliacoessn_diario_online_mostra_ajuste: TSmallintField
      FieldName = 'sn_diario_online_mostra_ajuste'
      Origin = 'WMESTRE12.avaliacoes_parametros.sn_diario_online_mostra_ajuste'
    end
    object tblAvaliacoesds_formula_periodo: TStringField
      FieldName = 'ds_formula_periodo'
      Origin = 'WMESTRE12.avaliacoes_parametros.ds_formula_periodo'
      Size = 255
    end
    object tblAvaliacoesds_condicao_situacao_periodo: TStringField
      FieldName = 'ds_condicao_situacao_periodo'
      Origin = 'WMESTRE12.avaliacoes_parametros.ds_condicao_situacao_periodo'
      Size = 255
    end
    object tblAvaliacoesds_formula_media_curso: TStringField
      FieldName = 'ds_formula_media_curso'
      Origin = 'WMESTRE12.avaliacoes_parametros.ds_formula_media_curso'
      Size = 255
    end
    object tblAvaliacoessn_usar_media_curso: TSmallintField
      FieldName = 'sn_usar_media_curso'
      Origin = 'WMESTRE12.avaliacoes_parametros.sn_usar_media_curso'
    end
    object tblAvaliacoesds_sigla: TMemoField
      FieldName = 'ds_sigla'
      Origin = 'WMESTRE12.avaliacoes_parametros.ds_sigla'
      BlobType = ftMemo
    end
    object tblAvaliacoessn_extra_classe: TSmallintField
      FieldName = 'sn_extra_classe'
      Origin = 'WMESTRE12.avaliacoes_parametros.sn_extra_classe'
    end
    object tblAvaliacoessn_descricao_fixa: TStringField
      FieldName = 'sn_descricao_fixa'
      Origin = 'WMESTRE12.avaliacoes_parametros.sn_descricao_fixa'
      FixedChar = True
      Size = 1
    end
    object tblAvaliacoessn_freque_pergunta: TSmallintField
      FieldName = 'sn_freque_pergunta'
      Origin = 'WMESTRE12.avaliacoes_parametros.sn_freque_pergunta'
    end
    object tblAvaliacoessn_freque_pergunta_padrao: TSmallintField
      FieldName = 'sn_freque_pergunta_padrao'
      Origin = 'WMESTRE12.avaliacoes_parametros.sn_freque_pergunta_padrao'
    end
    object tblAvaliacoessn_professor_fecha_diario: TSmallintField
      FieldName = 'sn_professor_fecha_diario'
      Origin = 'WMESTRE12.avaliacoes_parametros.sn_professor_fecha_diario'
    end
    object tblAvaliacoesnr_qtd_aulas_impressao: TSmallintField
      FieldName = 'nr_qtd_aulas_impressao'
      Origin = 'WMESTRE12.avaliacoes_parametros.nr_qtd_aulas_impressao'
    end
    object tblAvaliacoesnr_notas_max_alteracoes: TSmallintField
      FieldName = 'nr_notas_max_alteracoes'
      Origin = 'WMESTRE12.avaliacoes_parametros.nr_notas_max_alteracoes'
    end
    object tblAvaliacoessn_digita_exame_diario_online: TSmallintField
      FieldName = 'sn_digita_exame_diario_online'
      Origin = 'WMESTRE12.avaliacoes_parametros.sn_digita_exame_diario_online'
    end
    object tblAvaliacoesds_formula_pi: TStringField
      FieldName = 'ds_formula_pi'
      Origin = 'WMESTRE12.avaliacoes_parametros.ds_formula_pi'
      Size = 250
    end
    object tblAvaliacoescd_tipo_horario: TSmallintField
      FieldName = 'cd_tipo_horario'
      Origin = 'WMESTRE12.avaliacoes_parametros.cd_tipo_horario'
    end
    object tblAvaliacoescd_situacao_aprov_direta: TIntegerField
      FieldName = 'cd_situacao_aprov_direta'
      Origin = 'WMESTRE12.avaliacoes_parametros.cd_situacao_aprov_direta'
    end
    object tblAvaliacoescd_situacao_aprov_exame: TIntegerField
      FieldName = 'cd_situacao_aprov_exame'
      Origin = 'WMESTRE12.avaliacoes_parametros.cd_situacao_aprov_exame'
    end
    object tblAvaliacoescd_situacao_aprov_2epoca: TIntegerField
      FieldName = 'cd_situacao_aprov_2epoca'
      Origin = 'WMESTRE12.avaliacoes_parametros.cd_situacao_aprov_2epoca'
    end
    object tblAvaliacoeslookupSitAprovDireta: TStringField
      FieldKind = fkLookup
      FieldName = 'lookupSitAprovDireta'
      LookupDataSet = qySituacoes
      LookupKeyFields = 'cd_situacao'
      LookupResultField = 'ds_situacao'
      KeyFields = 'cd_situacao_aprov_direta'
      Lookup = True
    end
    object tblAvaliacoeslookupSitAprovExame: TStringField
      FieldKind = fkLookup
      FieldName = 'lookupSitAprovExame'
      LookupDataSet = qySituacoes
      LookupKeyFields = 'cd_situacao'
      LookupResultField = 'ds_situacao'
      KeyFields = 'cd_situacao_aprov_exame'
      Lookup = True
    end
    object tblAvaliacoeslookupSitAprov2Epoca: TStringField
      FieldKind = fkLookup
      FieldName = 'lookupSitAprov2Epoca'
      LookupDataSet = qySituacoes
      LookupKeyFields = 'cd_situacao'
      LookupResultField = 'ds_situacao'
      KeyFields = 'cd_situacao_aprov_2epoca'
      Lookup = True
    end
    object tblAvaliacoessn_frequencia_turma: TSmallintField
      FieldName = 'sn_frequencia_turma'
      Origin = 'WMESTRE12.avaliacoes_parametros.sn_frequencia_turma'
    end
    object tblAvaliacoessn_diario_online_atividades: TSmallintField
      FieldName = 'sn_diario_online_atividades'
      Origin = 'WMESTRE12.avaliacoes_parametros.sn_diario_online_atividades'
    end
    object tblAvaliacoessn_conceitos_parciais: TStringField
      FieldName = 'sn_conceitos_parciais'
      Origin = 'WMESTRE12.avaliacoes_parametros.sn_conceitos_parciais'
      FixedChar = True
      Size = 3
    end
    object tblAvaliacoesnr_media_proficiencia: TFloatField
      FieldName = 'nr_media_proficiencia'
      Origin = 'WMESTRE12.avaliacoes_parametros.nr_media_proficiencia'
      DisplayFormat = '##.0#'
      EditFormat = '##.0#'
      MaxValue = 1000.000000000000000000
    end
    object tblAvaliacoessn_alterar_nota_exame: TIntegerField
      FieldName = 'sn_alterar_nota_exame'
    end
    object tblAvaliacoessn_digita_todas_notas: TSmallintField
      FieldName = 'sn_digita_todas_notas'
    end
    object tblAvaliacoesnm_nome_exame_etapa: TStringField
      FieldName = 'nm_nome_exame_etapa'
      Origin = 'WMESTRE12.avaliacoes_parametros.nm_nome_exame_etapa'
      FixedChar = True
      Size = 50
    end
    object tblAvaliacoesnm_nome_exame_especial: TStringField
      FieldName = 'nm_nome_exame_especial'
      Origin = 'WMESTRE12.avaliacoes_parametros.nm_nome_exame_especial'
      FixedChar = True
      Size = 50
    end
    object tblAvaliacoescd_titulo_2epoca: TSmallintField
      FieldName = 'cd_titulo_2epoca'
      Origin = 'WMESTRE12.avaliacoes_parametros.cd_titulo_2epoca'
    end
    object tblAvaliacoeslfTipoTiulo: TStringField
      FieldKind = fkLookup
      FieldName = 'lfTipoTiulo'
      LookupDataSet = qryTiposTitulo
      LookupKeyFields = 'cd_tipo_titulo'
      LookupResultField = 'ds_tipo_titulo'
      KeyFields = 'cd_titulo_2epoca'
      Size = 255
      Lookup = True
    end
    object tblAvaliacoessn_falta_exame_forca_2epoca: TSmallintField
      FieldName = 'sn_falta_exame_forca_2epoca'
      Origin = 'WMESTRE12.avaliacoes_parametros.sn_falta_exame_forca_2epoca'
    end
    object tblAvaliacoescd_disci_frequencia: TLargeintField
      DisplayLabel = 'Considerar Frequencia somente da Disciplina'
      FieldName = 'cd_disci_frequencia'
    end
    object tblAvaliacoesnr_maximo_aulas: TLargeintField
      FieldName = 'nr_maximo_aulas'
    end
    object tblAvaliacoesnr_periodos: TLargeintField
      FieldName = 'nr_periodos'
    end
    object tblAvaliacoesnr_dias_diario_bloq_provas: TLargeintField
      FieldName = 'nr_dias_diario_bloq_provas'
    end
    object tblAvaliacoescd_situacao_concluida: TLargeintField
      FieldName = 'cd_situacao_concluida'
    end
    object tblAvaliacoesnr_inicio_aulas_extras: TLargeintField
      FieldName = 'nr_inicio_aulas_extras'
    end
    object tblAvaliacoesSN_GERAR_TAXA_RECORRENCIA: TSmallintField
      FieldName = 'SN_GERAR_TAXA_RECORRENCIA'
    end
    object tblAvaliacoesNR_CASAS_FORCADO_MEDIA: TIntegerField
      FieldName = 'NR_CASAS_FORCADO_MEDIA'
    end
    object tblAvaliacoesSN_NOTAS: TStringField
      FieldName = 'SN_NOTAS'
      Size = 1
    end
    object tblAvaliacoesSN_COPIAR_CONTEUDO_PORDATA: TSmallintField
      FieldName = 'SN_COPIAR_CONTEUDO_PORDATA'
    end
    object tblAvaliacoesSN_PROFES_DIGITA_PESO: TStringField
      FieldName = 'SN_PROFES_DIGITA_PESO'
      Size = 1
    end
    object tblAvaliacoescalcular_media_fecha_diario: TSmallintField
      FieldName = 'calcular_media_fecha_diario'
    end
    object tblAvaliacoessn_aulas_datas: TSmallintField
      FieldName = 'sn_aulas_datas'
    end
    object tblAvaliacoessn_exibir_descricao: TSmallintField
      FieldName = 'sn_exibir_descricao'
    end
    object tblAvaliacoescd_situacao_proficiencia: TIntegerField
      FieldName = 'cd_situacao_proficiencia'
    end
    object tblAvaliacoeslookupSituacaoProficiencia: TStringField
      FieldKind = fkLookup
      FieldName = 'lookupSituacaoProficiencia'
      LookupDataSet = qySituacoes
      LookupKeyFields = 'cd_situacao'
      LookupResultField = 'ds_situacao'
      KeyFields = 'cd_situacao_proficiencia'
      Lookup = True
    end
    object tblAvaliacoessn_agrupar_aulas_online: TSmallintField
      FieldName = 'sn_agrupar_aulas_online'
    end
    object tblAvaliacoesds_cronograma_visualiza_inicio: TStringField
      FieldName = 'ds_cronograma_visualiza_inicio'
      Size = 100
    end
    object tblAvaliacoesds_cronograma_visualiza_fim: TStringField
      FieldName = 'ds_cronograma_visualiza_fim'
      Size = 100
    end
    object tblAvaliacoesds_cronograma_notas_inicio: TStringField
      FieldName = 'ds_cronograma_notas_inicio'
      Size = 100
    end
    object tblAvaliacoesds_cronograma_notas_fim: TStringField
      FieldName = 'ds_cronograma_notas_fim'
      Size = 100
    end
    object tblAvaliacoesds_cronograma_aulas_inicio: TStringField
      FieldName = 'ds_cronograma_aulas_inicio'
      Size = 100
    end
    object tblAvaliacoesds_cronograma_aulas_fim: TStringField
      FieldName = 'ds_cronograma_aulas_fim'
      Size = 100
    end
    object tblAvaliacoesds_cronograma_liberacao: TStringField
      FieldName = 'ds_cronograma_liberacao'
      Size = 100
    end
    object tblAvaliacoesnr_casas_decimais_frequencia: TSmallintField
      FieldName = 'nr_casas_decimais_frequencia'
    end
    object tblAvaliacoesds_frequencia_registro: TStringField
      FieldName = 'ds_frequencia_registro'
      Size = 1
    end
    object tblAvaliacoessn_calcular_media_aritmetica: TSmallintField
      FieldName = 'sn_calcular_media_aritmetica'
      Required = True
    end
    object tblAvaliacoessn_calculo_media_automatico: TSmallintField
      FieldName = 'sn_calculo_media_automatico'
      Required = True
    end
    object tblAvaliacoessn_observacao_nota: TSmallintField
      FieldName = 'sn_observacao_nota'
    end
    object tblAvaliacoessn_agrupar_avaliacao_tipo: TSmallintField
      FieldName = 'sn_agrupar_avaliacao_tipo'
    end
    object tblAvaliacoessn_media_notas_digitadas: TSmallintField
      FieldName = 'sn_media_notas_digitadas'
    end
    object tblAvaliacoessn_notas_calcular_medias: TSmallintField
      FieldName = 'sn_notas_calcular_medias'
    end
    object tblAvaliacoesvl_ajuste_min: TFloatField
      FieldName = 'vl_ajuste_min'
    end
    object tblAvaliacoesvl_ajuste_max: TFloatField
      FieldName = 'vl_ajuste_max'
    end
    object tblAvaliacoessn_falta_cancela_taxa: TSmallintField
      FieldName = 'sn_falta_cancela_taxa'
      Required = True
    end
    object tblAvaliacoessn_verificar_data_matricula: TSmallintField
      FieldName = 'sn_verificar_data_matricula'
    end
    object tblAvaliacoesvl_media_arredondamento: TFloatField
      FieldName = 'vl_media_arredondamento'
    end
    object tblAvaliacoesvl_media_arredondamento_exame: TFloatField
      FieldName = 'vl_media_arredondamento_exame'
    end
    object tblAvaliacoesvl_media_arredondamento_2epoca: TFloatField
      FieldName = 'vl_media_arredondamento_2epoca'
    end
    object tblAvaliacoessn_libera_freq_apos_fim_etapa: TSmallintField
      FieldName = 'sn_libera_freq_apos_fim_etapa'
    end
    object tblAvaliacoessn_libera_notas_apos_fim_etapa: TSmallintField
      FieldName = 'sn_libera_notas_apos_fim_etapa'
    end
    object tblAvaliacoessn_preencher_notas_nulas_zero: TSmallintField
      FieldName = 'sn_preencher_notas_nulas_zero'
    end
    object tblAvaliacoescd_coligada_matriz: TIntegerField
      FieldName = 'cd_coligada_matriz'
    end
    object tblAvaliacoesvl_hora_aula: TFloatField
      FieldName = 'vl_hora_aula'
    end
    object tblAvaliacoessn_bloquear_diario: TSmallintField
      FieldName = 'sn_bloquear_diario'
    end
    object tblAvaliacoessn_valida_fecha_diario: TSmallintField
      FieldName = 'sn_valida_fecha_diario'
    end
    object tblAvaliacoessn_alterar_provas: TSmallintField
      FieldName = 'sn_alterar_provas'
    end
    object tblAvaliacoessn_alterar_2epoca: TIntegerField
      FieldName = 'sn_alterar_2epoca'
    end
    object tblAvaliacoessn_ajuste_media: TStringField
      FieldName = 'sn_ajuste_media'
      Size = 1
    end
    object tblAvaliacoessn_digita_2epoca_diario_online: TSmallintField
      FieldName = 'sn_digita_2epoca_diario_online'
      Required = True
    end
    object tblAvaliacoessn_arred_forcado_antes_ajuste: TSmallintField
      FieldName = 'sn_arred_forcado_antes_ajuste'
      Required = True
    end
    object tblAvaliacoesds_sintese_avaliacao: TMemoField
      FieldName = 'ds_sintese_avaliacao'
      BlobType = ftMemo
    end
    object tblAvaliacoessn_deferir_notas_diario: TSmallintField
      FieldName = 'sn_deferir_notas_diario'
    end
    object tblAvaliacoessn_diario_online_bloque_cont: TIntegerField
      FieldName = 'sn_diario_online_bloque_cont'
      Origin = 'WMESTRE12.avaliacoes_parametros.sn_diario_online_bloque_cont'
    end
    object tblAvaliacoescd_situacao_reprov_direta: TIntegerField
      FieldName = 'cd_situacao_reprov_direta'
    end
    object tblAvaliacoescd_situacao_reprov_exame: TIntegerField
      FieldName = 'cd_situacao_reprov_exame'
    end
    object tblAvaliacoescd_situacao_reprov_2epoca: TIntegerField
      FieldName = 'cd_situacao_reprov_2epoca'
    end
    object tblAvaliacoeslookupSitReprovDireta: TStringField
      FieldKind = fkLookup
      FieldName = 'lookupSitReprovDireta'
      LookupDataSet = qySituacoes
      LookupKeyFields = 'cd_situacao'
      LookupResultField = 'ds_situacao'
      KeyFields = 'cd_situacao_reprov_direta'
      Lookup = True
    end
    object tblAvaliacoeslookupSitReprovExame: TStringField
      FieldKind = fkLookup
      FieldName = 'lookupSitReprovExame'
      LookupDataSet = qySituacoes
      LookupKeyFields = 'cd_situacao'
      LookupResultField = 'ds_situacao'
      KeyFields = 'cd_situacao_reprov_exame'
      Lookup = True
    end
    object tblAvaliacoeslookupSitReprov2Epoca: TStringField
      FieldKind = fkLookup
      FieldName = 'lookupSitReprov2Epoca'
      LookupDataSet = qySituacoes
      LookupKeyFields = 'cd_situacao'
      LookupResultField = 'ds_situacao'
      KeyFields = 'cd_situacao_reprov_2epoca'
      Lookup = True
    end
    object tblAvaliacoeslookupSitConclusao: TStringField
      FieldKind = fkLookup
      FieldName = 'lookupSitConclusao'
      LookupDataSet = qySituacoes
      LookupKeyFields = 'cd_situacao'
      LookupResultField = 'ds_situacao'
      KeyFields = 'cd_situacao_concluida'
      Lookup = True
    end
    object tblAvaliacoessn_agrupar_aulas_mesma_data: TSmallintField
      FieldName = 'sn_agrupar_aulas_mesma_data'
    end
    object tblAvaliacoessn_falta_sem_nota_2epoca: TSmallintField
      FieldName = 'sn_falta_sem_nota_2epoca'
    end
    object tblAvaliacoessn_faltas_justificadas: TSmallintField
      FieldName = 'sn_faltas_justificadas'
    end
    object tblAvaliacoessn_comportamento: TSmallintField
      FieldName = 'sn_comportamento'
    end
    object tblAvaliacoessn_diario_online_freq_bloq_cont: TSmallintField
      FieldName = 'sn_diario_online_freq_bloq_cont'
    end
    object tblAvaliacoessn_diario_online_freq_bloq_digi: TSmallintField
      FieldName = 'sn_diario_online_freq_bloq_digi'
    end
    object tblAvaliacoessn_diario_online_compart_aula: TSmallintField
      FieldName = 'sn_diario_online_compart_aula'
    end
    object tblAvaliacoessn_diario_online_mostra_resp: TIntegerField
      FieldName = 'sn_diario_online_mostra_resp'
    end
    object tblAvaliacoessn_professor_informar_motivo_media: TIntegerField
      FieldName = 'sn_professor_informar_motivo_media'
    end
    object tblAvaliacoessn_permitir_justificar: TSmallintField
      FieldName = 'sn_permitir_justificar'
    end
    object tblAvaliacoesds_cond_repro_falta: TStringField
      FieldName = 'ds_cond_repro_falta'
      Size = 255
    end
    object tblAvaliacoescd_situacao_reprov_falta: TIntegerField
      FieldName = 'cd_situacao_reprov_falta'
    end
    object tblAvaliacoeslookupSituacaoReprovaFalta: TStringField
      FieldKind = fkLookup
      FieldName = 'lookupSituacaoReprovaFalta'
      LookupDataSet = qySituacoes
      LookupKeyFields = 'cd_situacao'
      LookupResultField = 'ds_situacao'
      KeyFields = 'cd_situacao_reprov_falta'
      Lookup = True
    end
    object tblAvaliacoessn_converter_frequencias_nulas: TSmallintField
      FieldName = 'sn_converter_frequencias_nulas'
    end
    object tblAvaliacoessn_ocultar_conteudo_portal: TSmallintField
      FieldName = 'sn_ocultar_conteudo_portal'
    end
    object tblAvaliacoesSN_FREQUENCIAS_CALCULAR_MEDIAS: TSmallintField
      FieldName = 'SN_FREQUENCIAS_CALCULAR_MEDIAS'
      Required = True
    end
    object tblAvaliacoessn_profes_digita_nota_max: TSmallintField
      FieldName = 'sn_profes_digita_nota_max'
    end
    object tblAvaliacoessn_esconder_notas_parciais: TSmallintField
      FieldName = 'sn_esconder_notas_parciais'
      Required = True
    end
    object tblAvaliacoessn_disc_frente_media: TSmallintField
      FieldName = 'sn_disc_frente_media'
      Required = True
    end
    object tblAvaliacoesds_nome_atividade: TStringField
      FieldName = 'ds_nome_atividade'
      Size = 255
    end
    object tblAvaliacoesds_condicao_digitar_re: TStringField
      FieldName = 'ds_condicao_digitar_re'
      Size = 255
    end
  end
  object dsAvaliacoes: TDataSource
    DataSet = tblAvaliacoes
    OnStateChange = dsAvaliacoesStateChange
    OnDataChange = dsAvaliacoesDataChange
    Left = 776
    Top = 168
  end
  object tblPeriodicidade: TUMZQuery
    Connection = DM.db
    SQL.Strings = (
      'select * from cursos_periodos_avaliacoes'
      'order by cd_periodo_avaliacao')
    Params = <>
    DataSource = dsAvaliacoes
    Left = 741
    Top = 198
    object tblPeriodicidadecd_periodo_avaliacao: TSmallintField
      FieldName = 'cd_periodo_avaliacao'
      Origin = 'WMESTRE12.cursos_periodos_avaliacoes.cd_periodo_avaliacao'
    end
    object tblPeriodicidadeds_periodicidade: TStringField
      FieldName = 'ds_periodicidade'
      Origin = 'WMESTRE12.cursos_periodos_avaliacoes.ds_periodicidade'
    end
    object tblPeriodicidadeds_periodo_avaliacao: TStringField
      FieldName = 'ds_periodo_avaliacao'
      Origin = 'WMESTRE12.cursos_periodos_avaliacoes.ds_periodo_avaliacao'
      Size = 50
    end
    object tblPeriodicidadeds_periodo_abreviado: TStringField
      FieldName = 'ds_periodo_abreviado'
      Origin = 'WMESTRE12.cursos_periodos_avaliacoes.ds_periodo_abreviado'
      Size = 10
    end
  end
  object pmQtd: TPopupMenu
    OnPopup = pmQtdPopup
    Left = 632
    Top = 352
  end
  object dsConceitos: TDataSource
    DataSet = qyConceitos
    Left = 672
    Top = 96
  end
  object qyConceitos: TUMZQuery
    Connection = DM.db
    OnNewRecord = qyConceitosNewRecord
    SQL.Strings = (
      'SELECT'
      '   *'
      'FROM'
      '   avaliacoes_conceitos'
      'WHERE'
      '   cd_avaliacao = :cd_avaliacao'
      'ORDER BY'
      '   ds_conceito')
    Params = <
      item
        DataType = ftSmallint
        Name = 'cd_avaliacao'
        ParamType = ptUnknown
        Size = 2
      end>
    DataSource = dsAvaliacoes
    Left = 672
    Top = 128
    ParamData = <
      item
        DataType = ftSmallint
        Name = 'cd_avaliacao'
        ParamType = ptUnknown
        Size = 2
      end>
    object qyConceitosnr_inicial: TFloatField
      FieldName = 'nr_inicial'
      Origin = 'WMESTRE12.avaliacoes_conceitos.nr_inicial'
    end
    object qyConceitosnr_final: TFloatField
      FieldName = 'nr_final'
      Origin = 'WMESTRE12.avaliacoes_conceitos.nr_final'
    end
    object qyConceitosds_conceito: TStringField
      FieldName = 'ds_conceito'
      Origin = 'WMESTRE12.avaliacoes_conceitos.ds_conceito'
      Size = 45
    end
    object qyConceitoscd_avaliacao: TSmallintField
      FieldName = 'cd_avaliacao'
      Origin = 'WMESTRE12.avaliacoes_conceitos.cd_avaliacao'
    end
  end
  object dsSituacoes: TDataSource
    AutoEdit = False
    DataSet = qySituacoes
    Left = 672
    Top = 208
  end
  object qySituacoes: TUMZQuery
    Connection = DM.db
    SQL.Strings = (
      'SELECT'
      '   cd_situacao,'
      '   ds_situacao,'
      '   ds_sigla_situacao,'
      '   cd_situacao_pai'
      'FROM'
      '   situacao'
      'ORDER BY'
      '   ds_situacao')
    Params = <>
    Left = 672
    Top = 240
    object qySituacoescd_situacao: TIntegerField
      FieldName = 'cd_situacao'
      Origin = 'WMESTRE12.situacao.cd_situacao'
    end
    object qySituacoesds_situacao: TStringField
      FieldName = 'ds_situacao'
      Origin = 'WMESTRE12.situacao.ds_situacao'
      Size = 15
    end
    object qySituacoesds_sigla_situacao: TStringField
      FieldName = 'ds_sigla_situacao'
      Origin = 'WMESTRE12.situacao.ds_sigla_situacao'
      Size = 10
    end
    object qySituacoescd_situacao_pai: TIntegerField
      FieldName = 'cd_situacao_pai'
      Origin = 'WMESTRE12.situacao.cd_situacao_pai'
    end
  end
  object qryTiposTitulo: TUMZQuery
    Connection = DM.db
    SQL.Strings = (
      'SELECT'
      '   cd_tipo_titulo,'
      '   ds_tipo_titulo,'
      '   ct_tipo_titulo,'
      '   cd_conta,'
      '   cd_padrao,'
      '   vl_padrao,'
      '   cd_conta_debito,'
      '   nr_parcela,'
      '   sn_faturamento,'
      '   ds_grupo_boleto,'
      '   sn_libera_juros'
      'FROM'
      '   fin_config_tipos_titulo'
      'WHERE'
      '   ct_tipo_titulo = 1 '
      '   AND cd_coligada_matriz = :cd_coligada_matriz '
      '   AND sn_ativo = 1'
      'ORDER BY'
      '   ds_tipo_titulo')
    Params = <
      item
        DataType = ftUnknown
        Name = 'cd_coligada_matriz'
        ParamType = ptUnknown
      end>
    Left = 640
    Top = 448
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'cd_coligada_matriz'
        ParamType = ptUnknown
      end>
    object qryTiposTitulocd_tipo_titulo: TSmallintField
      FieldName = 'cd_tipo_titulo'
      Origin = 'WMESTRE12.fin_tipos_titulo.cd_tipo_titulo'
    end
    object qryTiposTitulods_tipo_titulo: TStringField
      FieldName = 'ds_tipo_titulo'
      Origin = 'WMESTRE12.fin_tipos_titulo.ds_tipo_titulo'
      Size = 255
    end
    object qryTiposTituloct_tipo_titulo: TSmallintField
      FieldName = 'ct_tipo_titulo'
      Origin = 'WMESTRE12.fin_tipos_titulo.ct_tipo_titulo'
    end
    object qryTiposTitulocd_padrao: TSmallintField
      FieldName = 'cd_padrao'
      Origin = 'WMESTRE12.fin_tipos_titulo.cd_padrao'
    end
    object qryTiposTitulovl_padrao: TFloatField
      FieldName = 'vl_padrao'
      Origin = 'WMESTRE12.fin_tipos_titulo.vl_padrao'
    end
    object qryTiposTitulonr_parcela: TSmallintField
      FieldName = 'nr_parcela'
      Origin = 'WMESTRE12.fin_tipos_titulo.nr_parcela'
    end
    object qryTiposTitulosn_faturamento: TSmallintField
      FieldName = 'sn_faturamento'
      Origin = 'WMESTRE12.fin_tipos_titulo.sn_faturamento'
    end
    object qryTiposTitulods_grupo_boleto: TStringField
      FieldName = 'ds_grupo_boleto'
      Origin = 'WMESTRE12.fin_tipos_titulo.ds_grupo_boleto'
      Size = 5
    end
    object qryTiposTitulosn_libera_juros: TSmallintField
      FieldName = 'sn_libera_juros'
      Origin = 'WMESTRE12.fin_tipos_titulo.sn_libera_juros'
    end
    object qryTiposTitulocd_conta: TLargeintField
      FieldName = 'cd_conta'
    end
    object qryTiposTitulocd_conta_debito: TLargeintField
      FieldName = 'cd_conta_debito'
    end
  end
  object dsTiposTitulo: TDataSource
    AutoEdit = False
    DataSet = qryTiposTitulo
    Left = 672
    Top = 448
  end
  object qyDuplicaRegistro: TUMZQuery
    Connection = DM.db
    SQL.Strings = (
      'INSERT INTO avaliacoes_parametros_matriz'
      '  (cd_coligada_matriz,'
      'ds_avaliacao,'
      'nr_avaliacoes,'
      'nr_maximo_aulas,'
      'cd_periodo_avaliacao,'
      'ds_cond_aprov_direta,'
      'ds_cond_repro_direta,'
      'ds_formula_media_anual,'
      'ds_formula_media_final,'
      'ds_formula_media_exame,'
      'ds_formula_media_segunda,'
      'ds_cond_aprov_exame,'
      'ds_cond_aprov_segunda,'
      'nr_max_disci_exame,'
      'nr_max_disci_segunda,'
      'sn_notas,'
      'sn_conceitos,'
      'sn_conceitos_parciais,'
      'sn_descricao,'
      'sn_exame,'
      'sn_pi,'
      'ds_formula_media_sem_pi,'
      'sn_segunda_epoca,'
      'sn_frequencia_global,'
      'ds_frequencia_tipo,'
      'cd_disci_frequencia,'
      'sn_recuperacao,'
      'ds_formula_recuperacao,'
      'ds_criterio_recuperacao,'
      'nr_casas_decimais,'
      'ds_cond_recuperacao,'
      'vl_arredondamento,'
      'sn_notas_diario_online,'
      'sn_notas_diario,'
      'sn_desblo_coorde,'
      'sn_diario_imp_notas,'
      'sn_diario_imp_freqs,'
      'sn_notas_truncar,'
      'sn_anual_truncar,'
      'sn_medias_truncar,'
      'sn_diario_imp_contprog,'
      'ds_nota_exame,'
      'ds_nota_segunda,'
      'sn_diario_online,'
      'sn_extra_classe,'
      'sn_diario_eletro,'
      'sn_diario_online_provas,'
      'sn_diario_online_aulas,'
      'sn_diario_online_recalc_medias,'
      'sn_diario_online_bloque_aulas,'
      'sn_diario_online_bloque_provas,'
      'nr_casas_decimais_forcado,'
      'tp_ajuste_forcado,'
      'nr_casas_forcado_media,'
      'tp_ajuste_forcado_media,'
      'sn_altera_notas_direta,'
      'sn_converter_notas_nulas,'
      'sn_mostrar_alunos_curs_padrao,'
      'sn_ins_aulas_semhorario,'
      'sn_copiar_conteudo_pordata,'
      'sn_ajuste_apos_recuperacao,'
      'ds_formula_padrao,'
      'sn_obrigar_formula_padrao,'
      'ds_formula_media_curso,'
      'nr_inicio_aulas_extras,'
      'sn_usar_media_curso,'
      'ds_sigla,'
      'ds_formula_periodo,'
      'nr_periodos,'
      'ds_condicao_situacao_periodo,'
      'sn_diario_online_mostra_ajuste,'
      'nr_dias_diario_bloq_provas,'
      'sn_descricao_fixa,'
      'sn_freque_pergunta,'
      'sn_freque_pergunta_padrao,'
      'sn_professor_fecha_diario,'
      'sn_profes_digita_peso,'
      'cd_situacao_concluida,'
      'nr_qtd_aulas_impressao,'
      'nr_notas_max_alteracoes,'
      'sn_digita_exame_diario_online,'
      'ds_formula_pi,'
      'cd_tipo_horario,'
      'cd_situacao_aprov_direta,'
      'cd_situacao_aprov_exame,'
      'cd_situacao_aprov_2epoca,'
      'sn_frequencia_turma,'
      'sn_diario_online_atividades,'
      'nr_media_proficiencia,'
      'sn_alterar_nota_exame,'
      'sn_digita_todas_notas,'
      'sn_ajuste_media,'
      'sn_alterar_2epoca,'
      'sn_calcular_media_aritmetica,'
      'sn_falta_exame_forca_2epoca,'
      'sn_digita_2epoca_diario_online,'
      'nm_nome_exame_etapa,'
      'nm_nome_exame_especial,'
      'sn_gerar_taxa_recorrencia,'
      'cd_titulo_2epoca,'
      'calcular_media_fecha_diario,'
      'sn_aulas_datas,'
      'sn_exibir_descricao,'
      'cd_situacao_proficiencia,'
      'sn_agrupar_aulas_online,'
      'ds_cronograma_visualiza_inicio,'
      'ds_cronograma_visualiza_fim,'
      'ds_cronograma_notas_inicio,'
      'ds_cronograma_notas_fim,'
      'ds_cronograma_aulas_inicio,'
      'ds_cronograma_aulas_fim,'
      'ds_cronograma_liberacao,'
      'nr_casas_decimais_frequencia,'
      'ds_frequencia_registro,'
      'sn_calculo_media_automatico,'
      'sn_observacao_nota,'
      'sn_agrupar_avaliacao_tipo,'
      'sn_media_notas_digitadas,'
      'sn_notas_calcular_medias,'
      'vl_ajuste_min,'
      'vl_ajuste_max,'
      'sn_falta_cancela_taxa,'
      'sn_verificar_data_matricula,'
      'sn_arred_forcado_antes_ajuste,'
      'vl_media_arredondamento,'
      'vl_media_arredondamento_exame,'
      'vl_media_arredondamento_2epoca,'
      'sn_libera_freq_apos_fim_etapa,'
      'sn_preencher_notas_nulas_zero,'
      'ds_sintese_avaliacao,'
      'vl_hora_aula,'
      'sn_bloquear_diario,'
      'sn_valida_fecha_diario,'
      'sn_alterar_provas,'
      'sn_falta_sem_nota_2epoca,'
      'cd_situacao_reprov_direta,'
      'cd_situacao_reprov_exame,'
      'cd_situacao_reprov_2epoca,'
      'sn_comportamento,'
      'sn_faltas_justificadas,'
      'sn_diario_online_freq_bloq_cont,'
      'sn_agrupar_aulas_mesma_data,'
      'sn_diario_online_compart_aula,'
      'sn_diario_online_freq_bloq_digi,'
      'sn_professor_informar_motivo_media,'
      'sn_deferir_notas_diario,'
      'sn_diario_online_mostra_resp,'
      'sn_converter_frequencias_nulas'
      ')'
      '(SELECT'
      ' cd_coligada_matriz,'
      ':ds_avaliacao,'
      'nr_avaliacoes,'
      'nr_maximo_aulas,'
      'cd_periodo_avaliacao,'
      'ds_cond_aprov_direta,'
      'ds_cond_repro_direta,'
      'ds_formula_media_anual,'
      'ds_formula_media_final,'
      'ds_formula_media_exame,'
      'ds_formula_media_segunda,'
      'ds_cond_aprov_exame,'
      'ds_cond_aprov_segunda,'
      'nr_max_disci_exame,'
      'nr_max_disci_segunda,'
      'sn_notas,'
      'sn_conceitos,'
      'sn_conceitos_parciais,'
      'sn_descricao,'
      'sn_exame,'
      'sn_pi,'
      'ds_formula_media_sem_pi,'
      'sn_segunda_epoca,'
      'sn_frequencia_global,'
      'ds_frequencia_tipo,'
      'cd_disci_frequencia,'
      'sn_recuperacao,'
      'ds_formula_recuperacao,'
      'ds_criterio_recuperacao,'
      'nr_casas_decimais,'
      'ds_cond_recuperacao,'
      'vl_arredondamento,'
      'sn_notas_diario_online,'
      'sn_notas_diario,'
      'sn_desblo_coorde,'
      'sn_diario_imp_notas,'
      'sn_diario_imp_freqs,'
      'sn_notas_truncar,'
      'sn_anual_truncar,'
      'sn_medias_truncar,'
      'sn_diario_imp_contprog,'
      'ds_nota_exame,'
      'ds_nota_segunda,'
      'sn_diario_online,'
      'sn_extra_classe,'
      'sn_diario_eletro,'
      'sn_diario_online_provas,'
      'sn_diario_online_aulas,'
      'sn_diario_online_recalc_medias,'
      'sn_diario_online_bloque_aulas,'
      'sn_diario_online_bloque_provas,'
      'nr_casas_decimais_forcado,'
      'tp_ajuste_forcado,'
      'nr_casas_forcado_media,'
      'tp_ajuste_forcado_media,'
      'sn_altera_notas_direta,'
      'sn_converter_notas_nulas,'
      'sn_mostrar_alunos_curs_padrao,'
      'sn_ins_aulas_semhorario,'
      'sn_copiar_conteudo_pordata,'
      'sn_ajuste_apos_recuperacao,'
      'ds_formula_padrao,'
      'sn_obrigar_formula_padrao,'
      'ds_formula_media_curso,'
      'nr_inicio_aulas_extras,'
      'sn_usar_media_curso,'
      'ds_sigla,'
      'ds_formula_periodo,'
      'nr_periodos,'
      'ds_condicao_situacao_periodo,'
      'sn_diario_online_mostra_ajuste,'
      'nr_dias_diario_bloq_provas,'
      'sn_descricao_fixa,'
      'sn_freque_pergunta,'
      'sn_freque_pergunta_padrao,'
      'sn_professor_fecha_diario,'
      'sn_profes_digita_peso,'
      'cd_situacao_concluida,'
      'nr_qtd_aulas_impressao,'
      'nr_notas_max_alteracoes,'
      'sn_digita_exame_diario_online,'
      'ds_formula_pi,'
      'cd_tipo_horario,'
      'cd_situacao_aprov_direta,'
      'cd_situacao_aprov_exame,'
      'cd_situacao_aprov_2epoca,'
      'sn_frequencia_turma,'
      'sn_diario_online_atividades,'
      'nr_media_proficiencia,'
      'sn_alterar_nota_exame,'
      'sn_digita_todas_notas,'
      'sn_ajuste_media,'
      'sn_alterar_2epoca,'
      'sn_calcular_media_aritmetica,'
      'sn_falta_exame_forca_2epoca,'
      'sn_digita_2epoca_diario_online,'
      'nm_nome_exame_etapa,'
      'nm_nome_exame_especial,'
      'sn_gerar_taxa_recorrencia,'
      'cd_titulo_2epoca,'
      'calcular_media_fecha_diario,'
      'sn_aulas_datas,'
      'sn_exibir_descricao,'
      'cd_situacao_proficiencia,'
      'sn_agrupar_aulas_online,'
      'ds_cronograma_visualiza_inicio,'
      'ds_cronograma_visualiza_fim,'
      'ds_cronograma_notas_inicio,'
      'ds_cronograma_notas_fim,'
      'ds_cronograma_aulas_inicio,'
      'ds_cronograma_aulas_fim,'
      'ds_cronograma_liberacao,'
      'nr_casas_decimais_frequencia,'
      'ds_frequencia_registro,'
      'sn_calculo_media_automatico,'
      'sn_observacao_nota,'
      'sn_agrupar_avaliacao_tipo,'
      'sn_media_notas_digitadas,'
      'sn_notas_calcular_medias,'
      'vl_ajuste_min,'
      'vl_ajuste_max,'
      'sn_falta_cancela_taxa,'
      'sn_verificar_data_matricula,'
      'sn_arred_forcado_antes_ajuste,'
      'vl_media_arredondamento,'
      'vl_media_arredondamento_exame,'
      'vl_media_arredondamento_2epoca,'
      'sn_libera_freq_apos_fim_etapa,'
      'sn_preencher_notas_nulas_zero,'
      'ds_sintese_avaliacao,'
      'vl_hora_aula,'
      'sn_bloquear_diario,'
      'sn_valida_fecha_diario,'
      'sn_alterar_provas,'
      'sn_falta_sem_nota_2epoca,'
      'cd_situacao_reprov_direta,'
      'cd_situacao_reprov_exame,'
      'cd_situacao_reprov_2epoca,'
      'sn_comportamento,'
      'sn_faltas_justificadas,'
      'sn_diario_online_freq_bloq_cont,'
      'sn_agrupar_aulas_mesma_data,'
      'sn_diario_online_compart_aula,'
      'sn_diario_online_freq_bloq_digi,'
      'sn_professor_informar_motivo_media,'
      'sn_deferir_notas_diario,'
      'sn_diario_online_mostra_resp,'
      'sn_converter_frequencias_nulas'
      'FROM'
      '   avaliacoes_parametros_matriz'
      ' WHERE'
      '   cd_avaliacao = :cd_avaliacao)')
    Params = <
      item
        DataType = ftUnknown
        Name = 'ds_avaliacao'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'cd_avaliacao'
        ParamType = ptUnknown
      end>
    Left = 741
    Top = 262
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'ds_avaliacao'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'cd_avaliacao'
        ParamType = ptUnknown
      end>
  end
  object qyProvasUsadas: TUMZQuery
    Connection = DM.db
    AfterOpen = qyProvasUsadasAfterOpen
    AfterRefresh = qyProvasUsadasAfterRefresh
    UpdateObject = qyProvasUsadasUpdate
    SQL.Strings = (
      'SELECT'
      #9'avtp.cd_avaliacao,'
      #9'avtp.cd_avaliacao_tipo,'
      #9'avtp.nr_peso,'
      #9'avtp.sn_bloqueada,'
      #9'avtp.nr_qtd_maxima,'
      #9'avtp.nr_qtd_minima,'
      #9'avtp.sn_sem_limite_maxima,'
      #9'avtp.sn_sem_limite_minima,'
      #9'avtp.sn_sem_peso_fixo,'
      #9'avt.ds_avaliacao,'
      #9'avt.cd_tipo,'
      #9'avt.ds_chave,'
      #9'avtp.sn_considerar_participacao,'
      #9'avtp.sn_ocultar_prova_aluno'
      'FROM'
      #9'avaliacoes_tipos_parametros avtp'
      
        #9'INNER JOIN avaliacoes_tipos avt ON (avt.cd_avaliacao_tipo = avt' +
        'p.cd_avaliacao_tipo)'
      'WHERE'
      #9'avtp.cd_avaliacao = :CD_AVALIACAO'
      'ORDER BY '
      #9'avt.ds_avaliacao')
    Params = <
      item
        DataType = ftUnknown
        Name = 'CD_AVALIACAO'
        ParamType = ptUnknown
      end>
    Left = 512
    Top = 360
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'CD_AVALIACAO'
        ParamType = ptUnknown
      end>
    object qyProvasUsadascd_avaliacao: TIntegerField
      FieldName = 'cd_avaliacao'
    end
    object qyProvasUsadascd_avaliacao_tipo: TIntegerField
      FieldName = 'cd_avaliacao_tipo'
    end
    object qyProvasUsadasnr_peso: TIntegerField
      FieldName = 'nr_peso'
    end
    object qyProvasUsadassn_sem_peso_fixo: TSmallintField
      FieldName = 'sn_sem_peso_fixo'
    end
    object qyProvasUsadassn_bloqueada: TSmallintField
      FieldName = 'sn_bloqueada'
    end
    object qyProvasUsadasnr_qtd_maxima: TIntegerField
      FieldName = 'nr_qtd_maxima'
    end
    object qyProvasUsadasnr_qtd_minima: TIntegerField
      FieldName = 'nr_qtd_minima'
    end
    object qyProvasUsadassn_sem_limite_maxima: TSmallintField
      FieldName = 'sn_sem_limite_maxima'
    end
    object qyProvasUsadassn_sem_limite_minima: TSmallintField
      FieldName = 'sn_sem_limite_minima'
    end
    object qyProvasUsadasds_avaliacao: TStringField
      FieldName = 'ds_avaliacao'
      Size = 255
    end
    object qyProvasUsadascd_tipo: TIntegerField
      FieldName = 'cd_tipo'
    end
    object qyProvasUsadasds_chave: TStringField
      FieldName = 'ds_chave'
      Size = 50
    end
    object qyProvasUsadassn_considerar_participacao: TSmallintField
      FieldName = 'sn_considerar_participacao'
    end
    object qyProvasUsadassn_ocultar_prova_aluno: TSmallintField
      FieldName = 'sn_ocultar_prova_aluno'
    end
  end
  object dsProvasUsadas: TDataSource
    DataSet = qyProvasUsadas
    OnStateChange = dsProvasUsadasStateChange
    OnDataChange = dsProvasUsadasDataChange
    Left = 544
    Top = 360
  end
  object qyProvasUsadasUpdate: TZUpdateSQL
    DeleteSQL.Strings = (
      'DELETE FROM avaliacoes_tipos_parametros'
      'WHERE cd_avaliacao = :CD_AVALIACAO AND'
      '      cd_avaliacao_tipo = :CD_AVALIACAO_TIPO')
    InsertSQL.Strings = (
      
        'INSERT INTO avaliacoes_tipos_parametros( cd_avaliacao, cd_avalia' +
        'cao_tipo, sn_sem_limite_minima, sn_sem_limite_maxima, nr_qtd_min' +
        'ima, nr_qtd_maxima, sn_considerar_participacao, sn_ocultar_prova' +
        '_aluno)'
      
        'VALUES ( :CD_AVALIACAO, :CD_AVALIACAO_TIPO, :SN_SEM_LIMITE_MINIM' +
        'A, :SN_SEM_LIMITE_MAXIMA, :NR_QTD_MINIMA, :NR_QTD_MAXIMA, :SN_CO' +
        'NSIDERAR_PARTICIPACAO, :SN_OCULTAR_PROVA_ALUNO )')
    ModifySQL.Strings = (
      'UPDATE avaliacoes_tipos_parametros'
      'SET nr_qtd_minima = :NR_QTD_MINIMA,'
      '    sn_sem_limite_minima = :SN_SEM_LIMITE_MINIMA,'
      '    nr_qtd_maxima = :NR_QTD_MAXIMA,'
      '    sn_sem_limite_maxima = :SN_SEM_LIMITE_MAXIMA,'
      '    sn_bloqueada = :SN_BLOQUEADA,'
      '    nr_peso = :NR_PESO,'
      '    sn_sem_peso_fixo = :SN_SEM_PESO_FIXO,'
      '    sn_considerar_participacao = :SN_CONSIDERAR_PARTICIPACAO,'
      '    sn_ocultar_prova_aluno = :SN_OCULTAR_PROVA_ALUNO'
      ''
      'WHERE '
      '    cd_avaliacao = :CD_AVALIACAO AND'
      '    cd_avaliacao_tipo = :CD_AVALIACAO_TIPO')
    UseSequenceFieldForRefreshSQL = False
    Left = 512
    Top = 392
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'NR_QTD_MINIMA'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'SN_SEM_LIMITE_MINIMA'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'NR_QTD_MAXIMA'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'SN_SEM_LIMITE_MAXIMA'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'SN_BLOQUEADA'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'NR_PESO'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'SN_SEM_PESO_FIXO'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'SN_CONSIDERAR_PARTICIPACAO'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'SN_OCULTAR_PROVA_ALUNO'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'CD_AVALIACAO'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'cd_avaliacao_tipo'
        ParamType = ptUnknown
      end>
  end
  object qyDuplicaTipoAvaliacaoParametro: TUMZQuery
    Connection = DM.db
    SQL.Strings = (
      'INSERT INTO avaliacoes_tipos_parametros'
      
        '   (cd_avaliacao, cd_avaliacao_tipo, nr_qtd_minima, sn_sem_limit' +
        'e_minima, nr_qtd_maxima, sn_sem_limite_maxima, sn_bloqueada, nr_' +
        'peso, sn_sem_peso_fixo)'
      '(SELECT'
      
        #9' :cd_avaliacao_inserida, cd_avaliacao_tipo, nr_qtd_minima, sn_s' +
        'em_limite_minima, nr_qtd_maxima, sn_sem_limite_maxima, sn_bloque' +
        'ada, nr_peso, sn_sem_peso_fixo'
      ' FROM'
      '   avaliacoes_tipos_parametros'
      ' WHERE'
      '   cd_avaliacao = :cd_avaliacao)')
    Params = <
      item
        DataType = ftUnknown
        Name = 'cd_avaliacao_inserida'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'cd_avaliacao'
        ParamType = ptUnknown
      end>
    Left = 741
    Top = 294
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'cd_avaliacao_inserida'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'cd_avaliacao'
        ParamType = ptUnknown
      end>
  end
  object dsComportamentos: TDataSource
    DataSet = qyComportamentos
    Left = 704
    Top = 96
  end
  object qyComportamentos: TUMZQuery
    Connection = DM.db
    OnNewRecord = qyComportamentosNewRecord
    SQL.Strings = (
      'SELECT'
      '   *'
      'FROM'
      '  avaliacoes_comportamento'
      'WHERE'
      '  cd_avaliacao = :cd_avaliacao'
      'ORDER BY'
      '  nr_ordem, ds_comportamento')
    Params = <
      item
        DataType = ftSmallint
        Name = 'cd_avaliacao'
        ParamType = ptUnknown
        Size = 2
      end>
    DataSource = dsAvaliacoes
    Left = 704
    Top = 128
    ParamData = <
      item
        DataType = ftSmallint
        Name = 'cd_avaliacao'
        ParamType = ptUnknown
        Size = 2
      end>
    object qyComportamentoscd_comportamento: TIntegerField
      FieldName = 'cd_comportamento'
    end
    object qyComportamentosds_comportamento: TStringField
      FieldName = 'ds_comportamento'
      Size = 255
    end
    object qyComportamentoscd_avaliacao: TSmallintField
      FieldName = 'cd_avaliacao'
    end
    object qyComportamentosnr_ordem: TLargeintField
      FieldName = 'nr_ordem'
    end
  end
  object qyRemoveTipoAula: TUMZQuery
    Connection = DM.db
    SQL.Strings = (
      'DELETE'
      'FROM'
      #9'aulas_tipos_parametros'
      'WHERE'
      #9'cd_avaliacao = :cd_avaliacao'
      #9'AND cd_aula_tipo = :cd_aula_tipo')
    Params = <
      item
        DataType = ftUnknown
        Name = 'cd_avaliacao'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'cd_aula_tipo'
        ParamType = ptUnknown
      end>
    Left = 317
    Top = 171
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'cd_avaliacao'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'cd_aula_tipo'
        ParamType = ptUnknown
      end>
  end
  object qyInsereTipoAula: TUMZQuery
    Connection = DM.db
    SQL.Strings = (
      'INSERT INTO aulas_tipos_parametros ('
      #9'cd_avaliacao,'
      #9'cd_aula_tipo,'
      #9'sn_padrao'
      ')'
      'VALUES'
      #9'('
      #9#9':cd_avaliacao,'
      #9#9':cd_aula_tipo,'
      #9#9':sn_padrao'
      #9')'
      '')
    Params = <
      item
        DataType = ftUnknown
        Name = 'cd_avaliacao'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'cd_aula_tipo'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'sn_padrao'
        ParamType = ptUnknown
      end>
    Left = 349
    Top = 171
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'cd_avaliacao'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'cd_aula_tipo'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'sn_padrao'
        ParamType = ptUnknown
      end>
  end
  object qyColocaMenorPadrao: TUMZQuery
    Connection = DM.db
    SQL.Strings = (
      'UPDATE '
      #9'aulas_tipos_parametros'
      'SET '
      #9'sn_padrao = 1'
      'WHERE'
      #9'cd_avaliacao = :cd_avaliacao'
      'LIMIT 1')
    Params = <
      item
        DataType = ftUnknown
        Name = 'cd_avaliacao'
        ParamType = ptUnknown
      end>
    Left = 381
    Top = 171
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'cd_avaliacao'
        ParamType = ptUnknown
      end>
  end
end
