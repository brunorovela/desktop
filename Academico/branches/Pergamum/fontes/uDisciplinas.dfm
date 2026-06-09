object frmDisciplinas: TfrmDisciplinas
  Left = 237
  Top = 240
  Caption = 'Cadastro de Disciplinas Mestras'
  ClientHeight = 653
  ClientWidth = 784
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  FormStyle = fsMDIChild
  KeyPreview = True
  OldCreateOrder = True
  Position = poScreenCenter
  Visible = True
  WindowState = wsMaximized
  OnClose = FormClose
  OnCreate = FormCreate
  OnKeyDown = FormKeyDown
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object bvlSep1: TBevel
    Left = 0
    Top = 20
    Width = 784
    Height = 3
    Align = alTop
    Shape = bsTopLine
    ExplicitWidth = 1057
  end
  object bvlSep4: TBevel
    Left = 0
    Top = 628
    Width = 784
    Height = 3
    Align = alBottom
    Shape = bsSpacer
    ExplicitTop = 531
  end
  object pnlTitulo: TPanel
    Left = 0
    Top = 0
    Width = 784
    Height = 20
    Align = alTop
    BevelOuter = bvLowered
    Caption = 'DISCIPLINAS MESTRAS'
    Color = clBlue
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindow
    Font.Height = -13
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 0
  end
  object tlbOpcoes: TToolBar
    Left = 0
    Top = 631
    Width = 784
    Height = 22
    Align = alBottom
    ButtonWidth = 84
    Caption = 'tlbOpcoes'
    Images = ilOpcoes
    List = True
    ShowCaptions = True
    TabOrder = 1
    object btnSep1: TToolButton
      Left = 0
      Top = 0
      Width = 8
      Caption = 'btnSep1'
      ImageIndex = 9
      Style = tbsSeparator
    end
    object btnIncluir: TToolButton
      Left = 8
      Top = 0
      Caption = 'F2 Incluir'
      ImageIndex = 0
      OnClick = btnIncluirClick
    end
    object btnAlterar: TToolButton
      Left = 92
      Top = 0
      Caption = 'F3 Alterar'
      ImageIndex = 1
      OnClick = btnAlterarClick
    end
    object btnExcluir: TToolButton
      Left = 176
      Top = 0
      Caption = 'F9 Excluir'
      ImageIndex = 2
      OnClick = btnExcluirClick
    end
    object btnSep2: TToolButton
      Left = 260
      Top = 0
      Width = 8
      Caption = 'btnSep2'
      ImageIndex = 3
      Style = tbsSeparator
    end
    object btnSalvar: TToolButton
      Left = 268
      Top = 0
      Caption = 'F5 Salvar'
      ImageIndex = 3
      OnClick = btnSalvarClick
    end
    object btnCancelar: TToolButton
      Left = 352
      Top = 0
      Caption = 'F6 Cancelar'
      ImageIndex = 4
      OnClick = btnCancelarClick
    end
    object btnSep3: TToolButton
      Left = 436
      Top = 0
      Width = 8
      Caption = 'btnSep3'
      ImageIndex = 6
      Style = tbsSeparator
    end
    object btnFechar: TToolButton
      Left = 444
      Top = 0
      Caption = 'F12 Fechar'
      ImageIndex = 7
      OnClick = btnFecharClick
    end
    object btnSep4: TToolButton
      Left = 528
      Top = 0
      Width = 8
      Caption = 'btnSep4'
      ImageIndex = 8
      Style = tbsSeparator
    end
  end
  object pgcTabs: TPageControl
    Left = 0
    Top = 23
    Width = 784
    Height = 605
    ActivePage = tbsDisciplinas
    Align = alClient
    Style = tsFlatButtons
    TabOrder = 2
    OnChange = pgcTabsChange
    OnChanging = pgcTabsChanging
    object tbsCategorias: TTabSheet
      Caption = 'Categorias'
      ExplicitLeft = 0
      ExplicitTop = 0
      ExplicitWidth = 0
      ExplicitHeight = 0
      object splSep1: TSplitter
        Left = 393
        Top = 0
        Height = 574
        ExplicitLeft = 448
        ExplicitTop = 160
        ExplicitHeight = 100
      end
      object pnlCategoriasDados: TPanel
        Left = 0
        Top = 0
        Width = 393
        Height = 574
        Align = alLeft
        BevelOuter = bvNone
        TabOrder = 0
        object lblCategoriaCod: TLabel
          Left = 8
          Top = 1
          Width = 33
          Height = 13
          Caption = 'C'#243'digo'
          FocusControl = dbeCategoriaCod
        end
        object lblCategoriaChave: TLabel
          Left = 8
          Top = 44
          Width = 31
          Height = 13
          Caption = 'Chave'
          FocusControl = dbeCategoriaChave
        end
        object lblCategoriaDesc: TLabel
          Left = 8
          Top = 87
          Width = 46
          Height = 13
          Caption = 'Descri'#231#227'o'
          FocusControl = dbeCategoriaDesc
        end
        object dbeCategoriaCod: TDBEdit
          Left = 8
          Top = 17
          Width = 113
          Height = 21
          DataField = 'CD_CATEGORIA'
          DataSource = dsCategorias
          TabOrder = 0
        end
        object dbeCategoriaChave: TDBEdit
          Left = 8
          Top = 60
          Width = 264
          Height = 21
          DataField = 'DS_CHAVE'
          DataSource = dsCategorias
          TabOrder = 1
        end
        object dbeCategoriaDesc: TDBEdit
          Left = 8
          Top = 103
          Width = 369
          Height = 21
          DataField = 'DS_CATEGORIA'
          DataSource = dsCategorias
          TabOrder = 2
        end
        object dbchCategoriaOcultar: TDBCheckBox
          Left = 8
          Top = 130
          Width = 303
          Height = 17
          Caption = 'Ocultar do hist'#243'rico escolar se a disciplina n'#227'o for cursada.'
          DataField = 'SN_OCULTAR_DO_HISTORICO'
          DataSource = dsCategorias
          TabOrder = 3
          ValueChecked = '1'
          ValueUnchecked = '0'
        end
      end
      object dbgCategorias: TDBGrid
        Left = 396
        Top = 0
        Width = 380
        Height = 574
        Align = alClient
        DataSource = dsCategorias
        Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgConfirmDelete, dgCancelOnExit]
        ReadOnly = True
        TabOrder = 1
        TitleFont.Charset = DEFAULT_CHARSET
        TitleFont.Color = clWindowText
        TitleFont.Height = -11
        TitleFont.Name = 'Tahoma'
        TitleFont.Style = []
        OnTitleClick = dbgCategoriasTitleClick
        Columns = <
          item
            Expanded = False
            FieldName = 'CD_CATEGORIA'
            Title.Caption = 'C'#243'digo'
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'DS_CHAVE'
            Title.Caption = 'Chave'
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'DS_CATEGORIA'
            Title.Caption = 'Descri'#231#227'o'
            Title.Font.Charset = DEFAULT_CHARSET
            Title.Font.Color = clGreen
            Title.Font.Height = -11
            Title.Font.Name = 'Tahoma'
            Title.Font.Style = [fsBold]
            Width = 263
            Visible = True
          end>
      end
    end
    object tbsDisciplinas: TTabSheet
      Caption = 'Disciplinas'
      ImageIndex = 1
      ExplicitLeft = 0
      ExplicitTop = 0
      ExplicitWidth = 0
      ExplicitHeight = 0
      object splSep4: TSplitter
        Left = 369
        Top = 0
        Height = 574
        ExplicitLeft = 688
        ExplicitTop = 336
        ExplicitHeight = 100
      end
      object sbxDisciplinasDados: TScrollBox
        Left = 0
        Top = 0
        Width = 369
        Height = 574
        Align = alLeft
        TabOrder = 0
        object splSep3: TSplitter
          Left = 0
          Top = 369
          Width = 365
          Height = 3
          Cursor = crVSplit
          Align = alTop
          ExplicitTop = 313
          ExplicitWidth = 279
        end
        object pnlDiscDados: TPanel
          Left = 0
          Top = 0
          Width = 365
          Height = 156
          Align = alTop
          BevelOuter = bvNone
          TabOrder = 0
          object lblDiscCodPai: TLabel
            Left = 5
            Top = 5
            Width = 69
            Height = 13
            Caption = 'C'#243'digo mestre'
            FocusControl = dbeDiscCodPai
          end
          object lblDiscSigla: TLabel
            Left = 183
            Top = 5
            Width = 22
            Height = 13
            Caption = 'Sigla'
            FocusControl = dbeDiscSigla
          end
          object lblDiscDesc: TLabel
            Left = 5
            Top = 48
            Width = 46
            Height = 13
            Caption = 'Descri'#231#227'o'
            FocusControl = dbeDiscDesc
          end
          object lblDiscCodMec: TLabel
            Left = 5
            Top = 91
            Width = 57
            Height = 13
            Caption = 'C'#243'digo MEC'
            FocusControl = dbeDiscCodMec
          end
          object lblDiscOrdem: TLabel
            Left = 183
            Top = 91
            Width = 32
            Height = 13
            Caption = 'Ordem'
            FocusControl = dbeDiscOrdem
          end
          object dbeDiscCodPai: TDBEdit
            Left = 5
            Top = 21
            Width = 172
            Height = 21
            DataField = 'CD_DISCIPLINA_PAI'
            DataSource = dsDisciplinasMestra
            TabOrder = 0
          end
          object dbeDiscSigla: TDBEdit
            Left = 183
            Top = 21
            Width = 165
            Height = 21
            DataField = 'DS_SIGLA'
            DataSource = dsDisciplinasMestra
            TabOrder = 1
          end
          object dbeDiscDesc: TDBEdit
            Left = 4
            Top = 64
            Width = 343
            Height = 21
            DataField = 'DS_DISCIPLINA'
            DataSource = dsDisciplinasMestra
            TabOrder = 2
            OnExit = dbeDiscDescExit
            OnKeyPress = dbeDiscDescKeyPress
          end
          object dbeDiscCodMec: TDBEdit
            Left = 5
            Top = 107
            Width = 172
            Height = 21
            DataField = 'CD_DISC_MEC'
            DataSource = dsDisciplinasMestra
            TabOrder = 3
          end
          object dbeDiscOrdem: TDBEdit
            Left = 183
            Top = 107
            Width = 110
            Height = 21
            DataField = 'NR_ORDEM'
            DataSource = dsDisciplinasMestra
            TabOrder = 4
          end
          object dbchDiscAtiva: TDBCheckBox
            Left = 299
            Top = 109
            Width = 49
            Height = 17
            Caption = 'Ativa'
            DataField = 'SN_ATIVA'
            DataSource = dsDisciplinasMestra
            TabOrder = 5
            ValueChecked = '1'
            ValueUnchecked = '0'
          end
          object dbchExportaMoodle: TDBCheckBox
            Left = 8
            Top = 134
            Width = 193
            Height = 17
            Caption = 'Exportar disciplina para o MOODLE'
            DataField = 'SN_EXPORTA_MOODLE'
            DataSource = dsDisciplinasMestra
            TabOrder = 6
            ValueChecked = '1'
            ValueUnchecked = '0'
          end
        end
        object pnlDiscEmentas: TPanel
          Left = 0
          Top = 372
          Width = 365
          Height = 198
          Align = alClient
          BevelOuter = bvNone
          BorderWidth = 2
          TabOrder = 1
          object lblEmentas: TLabel
            Left = 2
            Top = 2
            Width = 361
            Height = 13
            Align = alTop
            Caption = 'Ementas'
            ExplicitWidth = 41
          end
          object bvlSep3: TBevel
            Left = 2
            Top = 15
            Width = 361
            Height = 5
            Align = alTop
            Shape = bsTopLine
            ExplicitLeft = 21
            ExplicitTop = 271
            ExplicitWidth = 372
          end
          object pnlDiscEmentasFiltros: TPanel
            Left = 2
            Top = 20
            Width = 361
            Height = 30
            Align = alTop
            BevelOuter = bvNone
            TabOrder = 0
            object lblDiscEmentaAnoSem: TLabel
              Left = 231
              Top = 9
              Width = 74
              Height = 13
              Caption = 'Ano/sem. inicial'
              FocusControl = dbeDiscEmentaAnoSem
            end
            object sbBibNegrito: TSpeedButton
              Left = 153
              Top = 5
              Width = 23
              Height = 22
              AllowAllUp = True
              GroupIndex = 1
              Enabled = False
              Flat = True
              Glyph.Data = {
                36060000424D3606000000000000360000002800000020000000100000000100
                18000000000000060000C30A0000C30A00000000000000000000FF00FFFF00FF
                FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
                FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
                00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
                FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
                FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
                00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
                FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
                FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
                00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
                FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
                FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
                00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
                FF00FF000000000000000000000000000000000000000000000000000000FF00
                FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF9E9E9E9E9E9E9E9E9E9E9E9E9E
                9E9E9E9E9E9E9E9E9E9E9E9E9E9EFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
                FF00FFFF00FF000000000000000000FF00FFFF00FFFF00FF0000000000000000
                00FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF9E9E9E9E9E9E9E9E9EFF
                00FFFF00FFFF00FF9E9E9E9E9E9E9E9E9EFF00FFFF00FFFF00FFFF00FFFF00FF
                FF00FFFF00FF000000000000000000FF00FFFF00FFFF00FF0000000000000000
                00FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF9E9E9E9E9E9E9E9E9EFF
                00FFFF00FFFF00FF9E9E9E9E9E9E9E9E9EFF00FFFF00FFFF00FFFF00FFFF00FF
                FF00FFFF00FF000000000000000000FF00FFFF00FFFF00FF0000000000000000
                00FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF9E9E9E9E9E9E9E9E9EFF
                00FFFF00FFFF00FF9E9E9E9E9E9E9E9E9EFF00FFFF00FFFF00FFFF00FFFF00FF
                FF00FFFF00FF000000000000000000000000000000000000000000000000FF00
                FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF9E9E9E9E9E9E9E9E9E9E
                9E9E9E9E9E9E9E9E9E9E9E9E9E9EFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
                FF00FFFF00FF000000000000000000FF00FFFF00FFFF00FF0000000000000000
                00FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF9E9E9E9E9E9E9E9E9EFF
                00FFFF00FFFF00FF9E9E9E9E9E9E9E9E9EFF00FFFF00FFFF00FFFF00FFFF00FF
                FF00FFFF00FF000000000000000000FF00FFFF00FFFF00FF0000000000000000
                00FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF9E9E9E9E9E9E9E9E9EFF
                00FFFF00FFFF00FF9E9E9E9E9E9E9E9E9EFF00FFFF00FFFF00FFFF00FFFF00FF
                FF00FFFF00FF000000000000000000FF00FFFF00FFFF00FF0000000000000000
                00FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF9E9E9E9E9E9E9E9E9EFF
                00FFFF00FFFF00FF9E9E9E9E9E9E9E9E9EFF00FFFF00FFFF00FFFF00FFFF00FF
                FF00FF000000000000000000000000000000000000000000000000000000FF00
                FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF9E9E9E9E9E9E9E9E9E9E9E9E9E
                9E9E9E9E9E9E9E9E9E9E9E9E9E9EFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
                FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
                FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
                00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
                FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
                FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
                00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
                FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
                FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
                00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF}
              NumGlyphs = 2
              Visible = False
              OnClick = sbBibNegritoClick
            end
            object sbBibItalico: TSpeedButton
              Left = 176
              Top = 5
              Width = 23
              Height = 22
              AllowAllUp = True
              GroupIndex = 2
              Enabled = False
              Flat = True
              Glyph.Data = {
                36060000424D3606000000000000360000002800000020000000100000000100
                18000000000000060000C30A0000C30A00000000000000000000FF00FFFF00FF
                FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
                FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
                00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
                FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
                FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
                00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
                FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
                FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
                00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
                FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
                FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
                00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
                FF00FF000000000000000000000000000000000000000000FF00FFFF00FFFF00
                FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF9E9E9E9E9E9E9E9E9E9E9E9E9E
                9E9E9E9E9E9E9E9EFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
                FF00FFFF00FFFF00FFFF00FF000000000000FF00FFFF00FFFF00FFFF00FFFF00
                FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF9E9E9E9E
                9E9EFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
                FF00FFFF00FFFF00FFFF00FF000000000000FF00FFFF00FFFF00FFFF00FFFF00
                FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF9E9E9E9E
                9E9EFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
                FF00FFFF00FFFF00FFFF00FFFF00FF000000000000FF00FFFF00FFFF00FFFF00
                FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF9E
                9E9E9E9E9EFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
                FF00FFFF00FFFF00FFFF00FFFF00FF000000000000FF00FFFF00FFFF00FFFF00
                FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF9E
                9E9E9E9E9EFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
                FF00FFFF00FFFF00FFFF00FFFF00FF000000000000FF00FFFF00FFFF00FFFF00
                FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF9E
                9E9E9E9E9EFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
                FF00FFFF00FFFF00FFFF00FFFF00FFFF00FF000000000000FF00FFFF00FFFF00
                FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
                00FF9E9E9E9E9E9EFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
                FF00FFFF00FFFF00FFFF00FFFF00FFFF00FF000000000000FF00FFFF00FFFF00
                FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
                00FF9E9E9E9E9E9EFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
                FF00FFFF00FFFF00FFFF00FF0000000000000000000000000000000000000000
                00FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF9E9E9E9E
                9E9E9E9E9E9E9E9E9E9E9E9E9E9E9E9E9EFF00FFFF00FFFF00FFFF00FFFF00FF
                FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
                FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
                00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
                FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
                FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
                00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
                FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
                FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
                00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF}
              NumGlyphs = 2
              Visible = False
              OnClick = sbBibItalicoClick
            end
            object sbBibSublinhado: TSpeedButton
              Left = 199
              Top = 5
              Width = 23
              Height = 22
              AllowAllUp = True
              GroupIndex = 3
              Enabled = False
              Flat = True
              Glyph.Data = {
                36060000424D3606000000000000360000002800000020000000100000000100
                18000000000000060000C30A0000C30A00000000000000000000FF00FFFF00FF
                FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
                FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
                00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
                FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
                FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
                00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
                FF00FF000000000000000000000000000000000000000000000000000000FF00
                FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF9E9E9E9E9E9E9E9E9E9E9E9E9E
                9E9E9E9E9E9E9E9E9E9E9E9E9E9EFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
                FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
                FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
                00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
                FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
                FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
                00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
                FF00FFFF00FFFF00FF000000000000000000000000000000FF00FFFF00FFFF00
                FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF9E9E9E9E9E9E9E
                9E9E9E9E9E9E9E9EFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
                FF00FFFF00FF000000000000FF00FFFF00FFFF00FF000000000000FF00FFFF00
                FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF9E9E9E9E9E9EFF00FFFF
                00FFFF00FF9E9E9E9E9E9EFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
                FF00FFFF00FF000000000000FF00FFFF00FFFF00FF000000000000FF00FFFF00
                FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF9E9E9E9E9E9EFF00FFFF
                00FFFF00FF9E9E9E9E9E9EFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
                FF00FFFF00FF000000000000FF00FFFF00FFFF00FF000000000000FF00FFFF00
                FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF9E9E9E9E9E9EFF00FFFF
                00FFFF00FF9E9E9E9E9E9EFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
                FF00FFFF00FF000000000000FF00FFFF00FFFF00FF000000000000FF00FFFF00
                FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF9E9E9E9E9E9EFF00FFFF
                00FFFF00FF9E9E9E9E9E9EFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
                FF00FFFF00FF000000000000FF00FFFF00FFFF00FF000000000000FF00FFFF00
                FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF9E9E9E9E9E9EFF00FFFF
                00FFFF00FF9E9E9E9E9E9EFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
                FF00FFFF00FF000000000000FF00FFFF00FFFF00FF000000000000FF00FFFF00
                FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF9E9E9E9E9E9EFF00FFFF
                00FFFF00FF9E9E9E9E9E9EFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
                FF00FFFF00FF000000000000FF00FFFF00FFFF00FF000000000000FF00FFFF00
                FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF9E9E9E9E9E9EFF00FFFF
                00FFFF00FF9E9E9E9E9E9EFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
                FF00FF000000000000000000000000FF00FF000000000000000000000000FF00
                FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF9E9E9E9E9E9E9E9E9E9E9E9EFF
                00FF9E9E9E9E9E9E9E9E9E9E9E9EFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
                FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
                FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
                00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
                FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
                FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
                00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF}
              NumGlyphs = 2
              Visible = False
              OnClick = sbBibSublinhadoClick
            end
            object dbnEmentas: TDBNavigator
              Left = 6
              Top = 6
              Width = 140
              Height = 21
              DataSource = dsEmentas
              VisibleButtons = [nbPrior, nbNext, nbInsert, nbDelete, nbEdit, nbPost, nbCancel]
              Flat = True
              TabOrder = 0
            end
            object dbeDiscEmentaAnoSem: TDBEdit
              Left = 311
              Top = 6
              Width = 50
              Height = 21
              DataField = 'NR_ANOSEMESTRE'
              DataSource = dsEmentas
              TabOrder = 1
            end
          end
          object pgcEmentas: TPageControl
            Left = 2
            Top = 50
            Width = 361
            Height = 146
            ActivePage = tbsEmenta
            Align = alClient
            TabOrder = 1
            OnChange = pgcEmentasChange
            ExplicitTop = 48
            object tbsEmenta: TTabSheet
              Caption = 'Ementa'
              object dbmEmenta: TDBMemo
                Left = 0
                Top = 0
                Width = 353
                Height = 118
                Align = alClient
                DataField = 'ME_EMENTA'
                DataSource = dsEmentas
                ScrollBars = ssBoth
                TabOrder = 0
              end
            end
            object tbsBibBasica: TTabSheet
              Caption = 'Bibliografia b'#225'sica'
              ImageIndex = 1
              object dbreBibBasica: TDBRichEdit
                Left = 0
                Top = 0
                Width = 353
                Height = 118
                Align = alClient
                DataField = 'ME_BIBLIOGRAFIA_BASICA'
                DataSource = dsEmentas
                TabOrder = 0
                OnSelectionChange = dbreBibBasicaSelectionChange
              end
            end
            object tbsBibComp: TTabSheet
              Caption = 'Bibliografia complementar'
              ImageIndex = 2
              object dbreBibComp: TDBRichEdit
                Left = 0
                Top = 0
                Width = 353
                Height = 118
                Align = alClient
                DataField = 'ME_BIBLIOGRAFIA_COMPLEMENTAR'
                DataSource = dsEmentas
                TabOrder = 0
                OnSelectionChange = dbreBibBasicaSelectionChange
                ExplicitLeft = 4
                ExplicitTop = 8
              end
            end
            object tbsBibSup: TTabSheet
              Caption = 'Bibliografia Suplementar'
              ImageIndex = 2
              object dbreBibSup: TDBRichEdit
                Left = 0
                Top = 0
                Width = 353
                Height = 118
                Align = alClient
                DataField = 'ME_BIBLIOGRAFIA_SUPLEMENTAR'
                DataSource = dsEmentas
                TabOrder = 0
                OnSelectionChange = dbreBibBasicaSelectionChange
                ExplicitLeft = 4
                ExplicitTop = 8
              end
            end
            object tbsObjetivos: TTabSheet
              Caption = 'Objetivos'
              ImageIndex = 3
              object dbmObjetivo: TDBMemo
                Left = 0
                Top = 0
                Width = 353
                Height = 118
                Align = alClient
                DataField = 'ME_OBJETIVO'
                DataSource = dsEmentas
                ScrollBars = ssBoth
                TabOrder = 0
              end
            end
            object tbsJustificativa: TTabSheet
              Caption = 'Justificativa'
              ImageIndex = 5
              object dbreJustiticativa: TDBRichEdit
                Left = 0
                Top = 0
                Width = 353
                Height = 118
                Align = alClient
                DataField = 'ME_JUSTIFICATIVA'
                DataSource = dsEmentas
                TabOrder = 0
                OnSelectionChange = dbreBibBasicaSelectionChange
              end
            end
            object tbsHabilidadesCompetencias: TTabSheet
              Caption = 'Habilidades/Compet'#234'ncias'
              ImageIndex = 6
              object dbreHabilidadesCompetencias: TDBRichEdit
                Left = 0
                Top = 0
                Width = 353
                Height = 118
                Align = alClient
                DataField = 'ME_HABILIDADES_COMPET'
                DataSource = dsEmentas
                TabOrder = 0
                OnSelectionChange = dbreBibBasicaSelectionChange
                ExplicitLeft = 4
                ExplicitTop = 8
              end
            end
          end
        end
        object Panel1: TPanel
          Left = 0
          Top = 156
          Width = 365
          Height = 213
          Align = alTop
          BevelOuter = bvNone
          TabOrder = 2
          object GroupBox1: TGroupBox
            Left = 0
            Top = 0
            Width = 365
            Height = 213
            Align = alClient
            Caption = '  Cursos  '
            TabOrder = 0
            object pnlDiscCursos: TPanel
              Left = 2
              Top = 97
              Width = 361
              Height = 114
              Align = alClient
              BevelOuter = bvNone
              BorderWidth = 2
              TabOrder = 0
              object clbCursos: TCheckListBox
                Left = 2
                Top = 2
                Width = 332
                Height = 110
                OnClickCheck = clbCursosClickCheck
                Align = alClient
                ItemHeight = 13
                TabOrder = 0
              end
              object pnlDiscCursosBtns: TPanel
                Left = 334
                Top = 2
                Width = 25
                Height = 110
                Align = alRight
                BevelOuter = bvNone
                TabOrder = 1
                object sbDiscSelCursos: TSpeedButton
                  Left = 0
                  Top = 0
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
                  Transparent = False
                  OnClick = sbDiscSelCursosClick
                end
                object sbDiscDesSelCursos: TSpeedButton
                  Left = 0
                  Top = 23
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
                  Transparent = False
                  OnClick = sbDiscDesSelCursosClick
                end
              end
            end
            object Panel2: TPanel
              Left = 2
              Top = 15
              Width = 361
              Height = 82
              Align = alTop
              BevelOuter = bvNone
              TabOrder = 1
              object Label2: TLabel
                Left = 5
                Top = 2
                Width = 88
                Height = 13
                Caption = 'Unidade de Ensino'
              end
              object Label1: TLabel
                Left = 190
                Top = 2
                Width = 73
                Height = 13
                Caption = 'Departamento:'
              end
              object Label3: TLabel
                Left = 112
                Top = 40
                Width = 56
                Height = 13
                Caption = 'Nome curso'
              end
              object lblCodCurso: TLabel
                Left = 5
                Top = 40
                Width = 62
                Height = 13
                Caption = 'C'#243'digo curso'
              end
              object cbColigada: TComboBox
                Left = 4
                Top = 17
                Width = 180
                Height = 21
                Style = csDropDownList
                ItemHeight = 13
                TabOrder = 0
                OnChange = cbColigadaChange
                Items.Strings = (
                  'Todas unidades de ensino')
              end
              object cbDepartamentos: TComboBox
                Left = 189
                Top = 17
                Width = 172
                Height = 21
                Align = alCustom
                Style = csDropDownList
                ItemHeight = 13
                ItemIndex = 0
                TabOrder = 1
                Text = 'Todos'
                OnChange = cbDepartamentosChange
                Items.Strings = (
                  'Todos')
              end
              object edNmCurso: TEdit
                Left = 110
                Top = 55
                Width = 251
                Height = 21
                TabOrder = 2
                OnKeyDown = edNmCursoKeyDown
              end
              object edCdCurso: TEdit
                Left = 4
                Top = 55
                Width = 101
                Height = 21
                TabOrder = 3
                OnKeyDown = edCdCursoKeyDown
              end
            end
          end
        end
      end
      object pnlDiscListagem: TPanel
        Left = 372
        Top = 0
        Width = 404
        Height = 574
        Align = alClient
        BevelOuter = bvNone
        TabOrder = 1
        object pnlDiscFiltros: TPanel
          Left = 0
          Top = 0
          Width = 404
          Height = 71
          Align = alTop
          BevelOuter = bvNone
          TabOrder = 0
          object lblResultadoBusca: TLabel
            Left = 251
            Top = 48
            Width = 3
            Height = 13
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clGreen
            Font.Height = -11
            Font.Name = 'Tahoma'
            Font.Style = [fsBold]
            ParentFont = False
          end
          object gbDiscFiltros: TGroupBox
            Left = 5
            Top = -1
            Width = 244
            Height = 68
            Caption = 'Filtro:'
            TabOrder = 0
            object sbDiscBusca: TSpeedButton
              Left = 188
              Top = 38
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
              OnClick = sbDiscBuscaClick
            end
            object sbDiscLimpa: TSpeedButton
              Left = 211
              Top = 38
              Width = 23
              Height = 21
              Flat = True
              Glyph.Data = {
                36060000424D3606000000000000360000002800000020000000100000000100
                18000000000000060000600F0000600F00000000000000000000FFFFFFFFFFFF
                FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
                FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
                FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
                FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
                FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
                FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
                FFFFFFF5F5F28D8DB0737391D5D6D2FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
                FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF8F8F8B7B7B7A5A5A5E3E3E3FF
                FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFEFEFA
                AFAFA83A3995302FF0312FE625259D7C7C8ED3D4CEFDFDFDFFFFFFFFFFFFFFFF
                FFFFFFFFFFFFFFFFFFFFFFFFFFFEFEFEC7C7C78686868E8E8E8C8C8C7C7C7CA9
                A9A9E1E1E1FEFEFEFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF8F8F57C7C9F
                1F1EBD4140FF4140F23837DD4342FB3230E321208C454549C8C8C5FFFFFFFFFF
                FFFFFFFFFFFFFFFFFFFFFAFAFAACACAC7D7D7D9A9A9A9797978F8F8F9A9A9A8D
                8D8D777777818181D9D9D9FFFFFFFFFFFFFFFFFFFFFFFFFFFFFF7A7AA33130E5
                4746FF4241FF4947FF2A28A22D2CB34746FF3F3EF421206D5B5B498E8E91EAEB
                EAFFFFFFFFFFFFFFFFFFABABAB8C8C8C9C9C9C9A9A9A9F9F9F7F7F7F8383839D
                9D9D9797977373738D8D8DB3B3B3F1F1F1FFFFFFFFFFFFFFFFFF6C6CAD3E3DFF
                4342FF4544FF3D3CEF302FC41F1F822929A34241FF2C2BD57C7C8BE9EADD6463
                6AA0A0A3FCFCFCFFFFFFA5A5A59898989A9A9A9C9C9C9494948888887575757F
                7F7F9A9A9A888888A8A8A8EFEFEF979797BFBFBFFDFDFDFFFFFFBEBFCA3D3CDE
                4241FE3231C72F2EBF4241F74645FF2C2BAF1C1C752322B95151BEEDEDE2FFFF
                FFA3A3A7818184ECEDEDD5D5D59292929A9A9A8989898686869898989D9D9D83
                83837272727F7F7F999999F1F1F1FFFFFFC1C1C1AAAAAAF2F2F2F8F8F87070BF
                2120CC3736DD4644FF4341FF4241FF4544FF4240F82524A802024298989AFFFF
                FFFFFFFFDCDCDEA6A6A9FAFAFAAAAAAA8181818F8F8F9D9D9D9A9A9A9999999B
                9B9B9898987D7D7D5D5D5DB9B9B9FFFFFFFFFFFFE8E8E8C3C3C3FFFFFFE6E6E5
                7A79B44140E63A39FF4140FF4241FF4443FF4241FF2827DE373782C6C6BBCECE
                CDCFCFD1FFFFFF9E9EA1FFFFFFEEEEEEADADAD9595959696969999999A9A9A9B
                9B9B9A9A9A878787828282D7D7D7DDDDDDDEDEDEFFFFFFBEBEBEFFFFFFFFFFFF
                FFFFFFEBEBE79191BB4544D53B3AFC2929C52F2F7D9796A4F2F2E8FFFFFFEAEA
                EBA5A5A689898B86868AFFFFFFFFFFFFFFFFFFF0F0F0BABABA95959595959585
                85857D7D7DBABABAF5F5F5FFFFFFF1F1F1C2C2C2B0B0B0ADADADFFFFFFFFFFFF
                FFFFFFFFFFFFFFFFFFECECECA2A2B4969698E5E5DCFFFFFFFFFFFFFFFFFFFFFF
                FFFFFFFF999A9EC2C1C3FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF2F2F2C3C3C3B8
                B8B8ECECECFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFBBBBBBD5D5D5FFFFFFFFFFFF
                FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF3F3F3D0D0D1CACACBEBEBEBF1F1F2B6B6
                B9B2B1B4F1F1F2FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF7
                F7F7DFDFDFDCDCDCF1F1F1F6F6F6CECECECACACAF6F6F6FFFFFFFFFFFFFFFFFF
                FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFEEEEEEC3C3C5AEAEB1DADA
                DBFDFDFDFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
                FFFFFFFFFFF4F4F4D7D7D7C8C8C8E7E7E7FEFEFEFFFFFFFFFFFFFFFFFFFFFFFF
                FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
                FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
                FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
                FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
                FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
                FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF}
              NumGlyphs = 2
              OnClick = sbDiscLimpaClick
            end
            object edtDiscBusca: TEdit
              Left = 8
              Top = 38
              Width = 177
              Height = 21
              TabOrder = 3
              OnChange = edtDiscBuscaChange
              OnKeyPress = edtDiscBuscaKeyPress
            end
            object rbDiscFiltroCod: TRadioButton
              Left = 8
              Top = 20
              Width = 70
              Height = 15
              Caption = 'C'#243'digo'
              TabOrder = 0
            end
            object rbDiscFiltroSigla: TRadioButton
              Left = 84
              Top = 20
              Width = 70
              Height = 15
              Caption = 'Sigla'
              TabOrder = 1
            end
            object rbDiscFiltroDesc: TRadioButton
              Left = 160
              Top = 20
              Width = 70
              Height = 15
              Caption = 'Descri'#231#227'o'
              Checked = True
              TabOrder = 2
              TabStop = True
            end
          end
        end
        object dbgDisciplinas: TDBGrid
          Left = 0
          Top = 71
          Width = 404
          Height = 503
          Align = alClient
          DataSource = dsDisciplinasMestra
          Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgConfirmDelete, dgCancelOnExit]
          ReadOnly = True
          TabOrder = 1
          TitleFont.Charset = DEFAULT_CHARSET
          TitleFont.Color = clWindowText
          TitleFont.Height = -11
          TitleFont.Name = 'Tahoma'
          TitleFont.Style = []
          OnDrawColumnCell = dbgDisciplinasDrawColumnCell
          Columns = <
            item
              Expanded = False
              FieldName = 'CD_DISCIPLINA_PAI'
              Title.Caption = 'C'#243'digo'
              Width = 109
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'DS_DISCIPLINA'
              Title.Caption = 'Descri'#231#227'o'
              Width = 321
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'NR_ORDEM'
              Title.Caption = 'Ordem'
              Width = 71
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'DS_SIGLA'
              Title.Caption = 'Sigla'
              Width = 94
              Visible = True
            end>
        end
      end
    end
  end
  object ilOpcoes: TImageList
    Left = 424
    Top = 296
    Bitmap = {
      494C010108000900040010001000FFFFFFFFFF10FFFFFFFFFFFFFFFF424D3600
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
      2800000040000000300000000100010000000000800100000000000000000000
      000000000000000000000000FFFFFF0000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000FFFFF8F8FFFFFFFFF83FFAFAFC7FE3FF
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
  object qryCategorias: TUMZQuery
    Connection = DM.db
    SortedFields = 'DS_CATEGORIA'
    SQL.Strings = (
      'SELECT'
      '   CD_CATEGORIA,'
      '   DS_CHAVE,'
      '   DS_CATEGORIA,'
      '   SN_OCULTAR_DO_HISTORICO'
      'FROM'
      '   DISCIPLINAS_CATEGORIAS')
    Params = <>
    IndexFieldNames = 'DS_CATEGORIA Asc'
    Left = 472
    Top = 104
    object qryCategoriasCD_CATEGORIA: TIntegerField
      FieldName = 'CD_CATEGORIA'
      Required = True
    end
    object qryCategoriasDS_CHAVE: TStringField
      FieldName = 'DS_CHAVE'
    end
    object qryCategoriasDS_CATEGORIA: TStringField
      FieldName = 'DS_CATEGORIA'
      Size = 255
    end
    object qryCategoriasSN_OCULTAR_DO_HISTORICO: TSmallintField
      FieldName = 'SN_OCULTAR_DO_HISTORICO'
    end
  end
  object dsCategorias: TDataSource
    DataSet = qryCategorias
    OnStateChange = dsCategoriasStateChange
    Left = 520
    Top = 104
  end
  object qryDisciplinasMestra: TUMZQuery
    Connection = DM.db
    SortedFields = 'DS_DISCIPLINA'
    AfterInsert = qryDisciplinasMestraAfterInsert
    BeforePost = qryDisciplinasMestraBeforePost
    AfterPost = qryDisciplinasMestraAfterPost
    BeforeDelete = qryDisciplinasMestraBeforeDelete
    SQL.Strings = (
      'SELECT'
      '   CD_DISCIPLINA_PAI,'
      '   DS_DISCIPLINA,'
      '   NR_ORDEM,'
      '   DS_SIGLA,'
      '   DS_DESCRICAO,'
      '   CD_DISC_MEC,'
      '   SN_ATIVA,'
      '   SN_EXPORTA_MOODLE'
      'FROM'
      '   DISCIPLINAS_MESTRE')
    Params = <>
    IndexFieldNames = 'DS_DISCIPLINA Asc'
    Left = 472
    Top = 152
    object qryDisciplinasMestraCD_DISCIPLINA_PAI: TStringField
      FieldName = 'CD_DISCIPLINA_PAI'
      Size = 255
    end
    object qryDisciplinasMestraDS_DISCIPLINA: TStringField
      FieldName = 'DS_DISCIPLINA'
      Size = 255
    end
    object qryDisciplinasMestraNR_ORDEM: TSmallintField
      FieldName = 'NR_ORDEM'
    end
    object qryDisciplinasMestraDS_SIGLA: TStringField
      FieldName = 'DS_SIGLA'
      Size = 10
    end
    object qryDisciplinasMestraDS_DESCRICAO: TStringField
      FieldName = 'DS_DESCRICAO'
      Size = 255
    end
    object qryDisciplinasMestraCD_DISC_MEC: TLargeintField
      FieldName = 'CD_DISC_MEC'
    end
    object qryDisciplinasMestraSN_ATIVA: TIntegerField
      FieldName = 'SN_ATIVA'
    end
    object qryDisciplinasMestraSN_EXPORTA_MOODLE: TSmallintField
      FieldName = 'SN_EXPORTA_MOODLE'
      Required = True
    end
  end
  object dsDisciplinasMestra: TDataSource
    DataSet = qryDisciplinasMestra
    OnStateChange = dsDisciplinasMestraStateChange
    OnDataChange = dsDisciplinasMestraDataChange
    Left = 520
    Top = 152
  end
  object qryCursosDisciplinas: TUMZQuery
    Connection = DM.db
    SortedFields = 'DS_CURSO'
    UpdateObject = updCursosDisciplinas
    SQL.Strings = (
      'SELECT'
      '   D.CODIGO CD_DISCIPLINA,'
      '   D.ORDEM NR_ORDEM,'
      '   D.SIGLA DS_SIGLA,'
      '   D.DESCRICAO DS_DESCRICAO,'
      '   D.CD_DISC_MEC,'
      '   D.SN_BLOQUEADO,'
      '   D.SN_EMENTA_PADRAO,'
      '   D.CD_DISCIPLINA_PAI,'
      '   C.CD_CURSO,'
      '   C.DS_CURSO,'
      '   cc.CD_DEPTO'
      'FROM'
      '   CURSOS_MESTRE C'
      '   INNER JOIN cursos_coligadas cc ON (cc.CD_CURSO = c.CD_CURSO)'
      '      LEFT JOIN DISCIPLINAS D ON'
      '         (C.CD_CURSO = D.CURSO) AND'
      '         (D.CD_DISCIPLINA_PAI = :CD_DISCIPLINA_PAI)'
      'WHERE'
      '   C.SN_ATIVO = '#39'S'#39
      '   AND CC.CD_COLIGADA IN (%s)'
      'GROUP BY '
      '   c.CD_CURSO')
    Params = <
      item
        DataType = ftUnknown
        Name = 'CD_DISCIPLINA_PAI'
        ParamType = ptUnknown
      end>
    DataSource = dsDisciplinasMestra
    IndexFieldNames = 'DS_CURSO Asc'
    Left = 472
    Top = 248
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'CD_DISCIPLINA_PAI'
        ParamType = ptUnknown
      end>
    object qryCursosDisciplinasCD_DISCIPLINA: TIntegerField
      FieldName = 'CD_DISCIPLINA'
      Required = True
    end
    object qryCursosDisciplinasNR_ORDEM: TSmallintField
      FieldName = 'NR_ORDEM'
    end
    object qryCursosDisciplinasDS_SIGLA: TStringField
      FieldName = 'DS_SIGLA'
      Required = True
      Size = 10
    end
    object qryCursosDisciplinasDS_DESCRICAO: TStringField
      FieldName = 'DS_DESCRICAO'
      Size = 150
    end
    object qryCursosDisciplinasCD_DISC_MEC: TIntegerField
      FieldName = 'CD_DISC_MEC'
    end
    object qryCursosDisciplinasSN_BLOQUEADO: TSmallintField
      FieldName = 'SN_BLOQUEADO'
    end
    object qryCursosDisciplinasSN_EMENTA_PADRAO: TSmallintField
      FieldName = 'SN_EMENTA_PADRAO'
    end
    object qryCursosDisciplinasCD_DISCIPLINA_PAI: TStringField
      FieldName = 'CD_DISCIPLINA_PAI'
      Required = True
      Size = 255
    end
    object qryCursosDisciplinasCD_CURSO: TStringField
      FieldName = 'CD_CURSO'
      Required = True
      Size = 15
    end
    object qryCursosDisciplinasDS_CURSO: TStringField
      FieldName = 'DS_CURSO'
      Size = 255
    end
    object qryCursosDisciplinasCD_DEPTO: TSmallintField
      FieldName = 'CD_DEPTO'
    end
  end
  object updCursosDisciplinas: TZUpdateSQL
    InsertSQL.Strings = (
      'INSERT INTO DISCIPLINAS'
      
        '   (CODIGO, CD_DISCIPLINA_PAI, ORDEM, CURSO, SIGLA, DESCRICAO, C' +
        'D_DISC_MEC, SN_BLOQUEADO)'
      'VALUES'
      
        '   (:CD_DISCIPLINA, :CD_DISCIPLINA_PAI, :NR_ORDEM, :CD_CURSO, :D' +
        'S_SIGLA, :DS_DESCRICAO, :CD_DISC_MEC, :SN_BLOQUEADO)')
    UseSequenceFieldForRefreshSQL = False
    Left = 424
    Top = 248
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'CD_DISCIPLINA'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'CD_DISCIPLINA_PAI'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'NR_ORDEM'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'CD_CURSO'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'DS_SIGLA'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'DS_DESCRICAO'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'CD_DISC_MEC'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'SN_BLOQUEADO'
        ParamType = ptUnknown
      end>
  end
  object qryEmentas: TUMZQuery
    Connection = DM.db
    SortedFields = 'NR_ANOSEMESTRE'
    SortType = stDescending
    BeforePost = qryEmentasBeforePost
    AfterPost = qryEmentasAfterPost
    OnNewRecord = qryEmentasNewRecord
    SQL.Strings = (
      'SELECT'
      '   CD_DISCIPLINA_PAI,'
      '   NR_ANOSEMESTRE,'
      '   ME_EMENTA,'
      '   ME_BIBLIOGRAFIA_BASICA,'
      '   ME_BIBLIOGRAFIA_COMPLEMENTAR,'
      '   ME_BIBLIOGRAFIA_SUPLEMENTAR,'
      '   ME_OBJETIVO,'
      '   TX_BIB_BASICA_HTML,'
      '   TX_BIB_COMP_HTML,'
      '   TX_BIB_SUP_HTML,'
      '   ME_JUSTIFICATIVA,'
      '   TX_JUSTIFICATIVA_HTML,'
      '   ME_HABILIDADES_COMPET,'
      '   TX_HABILIDADES_COMPET_HTML'
      'FROM'
      '   DISCIPLINAS_MESTRE_EMENTAS'
      'WHERE'
      '   CD_DISCIPLINA_PAI = :CD_DISCIPLINA_PAI')
    Params = <
      item
        DataType = ftUnknown
        Name = 'CD_DISCIPLINA_PAI'
        ParamType = ptUnknown
      end>
    DataSource = dsDisciplinasMestra
    IndexFieldNames = 'NR_ANOSEMESTRE Desc'
    Left = 472
    Top = 200
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'CD_DISCIPLINA_PAI'
        ParamType = ptUnknown
      end>
    object qryEmentasCD_DISCIPLINA_PAI: TStringField
      FieldName = 'CD_DISCIPLINA_PAI'
      Required = True
      Size = 255
    end
    object qryEmentasNR_ANOSEMESTRE: TSmallintField
      FieldName = 'NR_ANOSEMESTRE'
      Required = True
      DisplayFormat = '0000/0'
    end
    object qryEmentasME_EMENTA: TMemoField
      FieldName = 'ME_EMENTA'
      BlobType = ftMemo
    end
    object qryEmentasME_BIBLIOGRAFIA_BASICA: TBlobField
      FieldName = 'ME_BIBLIOGRAFIA_BASICA'
    end
    object qryEmentasME_BIBLIOGRAFIA_COMPLEMENTAR: TBlobField
      FieldName = 'ME_BIBLIOGRAFIA_COMPLEMENTAR'
    end
    object qryEmentasME_BIBLIOGRAFIA_SUPLEMENTAR: TBlobField
      FieldName = 'ME_BIBLIOGRAFIA_SUPLEMENTAR'
    end
    object qryEmentasME_OBJETIVO: TMemoField
      FieldName = 'ME_OBJETIVO'
      BlobType = ftMemo
    end
    object qryEmentasTX_BIB_BASICA_HTML: TMemoField
      FieldName = 'TX_BIB_BASICA_HTML'
      BlobType = ftMemo
    end
    object qryEmentasTX_BIB_COMP_HTML: TMemoField
      FieldName = 'TX_BIB_COMP_HTML'
      BlobType = ftMemo
    end
    object qryEmentasTX_BIB_SUP_HTML: TMemoField
      FieldName = 'TX_BIB_SUP_HTML'
      BlobType = ftMemo
    end
    object qryEmentasME_JUSTIFICATIVA: TBlobField
      FieldName = 'ME_JUSTIFICATIVA'
    end
    object qryEmentasTX_JUSTIFICATIVA_HTML: TMemoField
      FieldName = 'TX_JUSTIFICATIVA_HTML'
      BlobType = ftMemo
    end
    object qryEmentasME_HABILIDADES_COMPET: TBlobField
      FieldName = 'ME_HABILIDADES_COMPET'
    end
    object qryEmentasTX_HABILIDADES_COMPET_HTML: TMemoField
      FieldName = 'TX_HABILIDADES_COMPET_HTML'
      BlobType = ftMemo
    end
  end
  object dsEmentas: TDataSource
    DataSet = qryEmentas
    OnStateChange = dsEmentasStateChange
    Left = 520
    Top = 200
  end
  object qryDepartamentos: TUMZQuery
    Connection = DM.db
    AfterOpen = qryDepartamentosAfterOpen
    SQL.Strings = (
      'SELECT'
      #9'*'
      'FROM'
      #9'DEPARTAMENTOS'
      'WHERE'
      #9'cd_coligada IN (%s)'
      'ORDER BY'
      '  DESCRICAO')
    Params = <>
    Left = 472
    Top = 352
    object qryDepartamentoscodigo: TSmallintField
      FieldName = 'codigo'
    end
    object qryDepartamentosdescricao: TStringField
      FieldName = 'descricao'
      Size = 50
    end
  end
  object dsDepartamentos: TDataSource
    DataSet = qryDepartamentos
    Left = 520
    Top = 352
  end
  object qyColigadas: TUMZQuery
    Connection = DM.db
    SQL.Strings = (
      'SELECT'
      #9'*'
      'FROM'
      #9'coligadas'
      'WHERE'
      #9'cd_coligada IN (:coligadasFilhas)'
      'ORDER BY'
      #9'nm_coligada;')
    Params = <
      item
        DataType = ftUnknown
        Name = 'coligadasFilhas'
        ParamType = ptUnknown
      end>
    Left = 472
    Top = 304
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'coligadasFilhas'
        ParamType = ptUnknown
      end>
  end
end
