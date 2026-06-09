object FControlePerm: TFControlePerm
  Left = 0
  Top = 0
  Caption = 'Controle de permiss'#245'es'
  ClientHeight = 601
  ClientWidth = 1264
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  FormStyle = fsMDIChild
  KeyPreview = True
  OldCreateOrder = False
  Visible = True
  WindowState = wsMaximized
  OnClose = FormClose
  OnCreate = FormCreate
  OnKeyDown = FormKeyDown
  PixelsPerInch = 96
  TextHeight = 13
  object bvlSep1: TBevel
    Left = 0
    Top = 22
    Width = 1264
    Height = 3
    Align = alTop
    Shape = bsSpacer
    ExplicitWidth = 807
  end
  object bvlSep2: TBevel
    Left = 0
    Top = 97
    Width = 1264
    Height = 3
    Align = alTop
    Shape = bsSpacer
    ExplicitWidth = 1010
  end
  object splSeparador: TSplitter
    Left = 225
    Top = 100
    Height = 476
    ExplicitLeft = 648
    ExplicitTop = 392
    ExplicitHeight = 100
  end
  object pnlTitulo: TPanel
    Left = 0
    Top = 0
    Width = 1264
    Height = 22
    Align = alTop
    BevelOuter = bvLowered
    Caption = 'CONTROLE DE PERMISS'#213'ES'
    Color = clBlue
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWhite
    Font.Height = -12
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 0
  end
  object pnlGrupo: TPanel
    Left = 0
    Top = 25
    Width = 1264
    Height = 72
    Align = alTop
    BevelOuter = bvNone
    TabOrder = 1
    object sbBuscaGrupo: TSpeedButton
      Left = 316
      Top = 40
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
      OnClick = sbBuscaGrupoClick
    end
    object sbAdicionarGrupos: TSpeedButton
      Left = 345
      Top = 40
      Width = 82
      Height = 21
      Caption = 'Gerenciar'
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
      OnClick = sbAdicionarGruposClick
    end
    object pnlGrupoTit: TPanel
      Left = 0
      Top = 0
      Width = 1264
      Height = 18
      Align = alTop
      BevelOuter = bvLowered
      Caption = 'GRUPO SELECIONADO'
      Color = clGray
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindow
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
      TabOrder = 0
    end
    object ledGrupo: TLabeledEdit
      Left = 10
      Top = 40
      Width = 300
      Height = 21
      EditLabel.Width = 29
      EditLabel.Height = 13
      EditLabel.Caption = 'Grupo'
      TabOrder = 1
    end
    object lbBusca: TLabeledEdit
      Left = 465
      Top = 40
      Width = 300
      Height = 21
      EditLabel.Width = 83
      EditLabel.Height = 13
      EditLabel.Caption = 'Buscar permiss'#227'o'
      TabOrder = 2
      OnChange = lbBuscaChange
      OnKeyPress = lbBuscaKeyPress
    end
  end
  object pnlModulos: TPanel
    Left = 0
    Top = 100
    Width = 225
    Height = 476
    Align = alLeft
    BevelOuter = bvNone
    TabOrder = 2
    object bvlSep3: TBevel
      Left = 0
      Top = 18
      Width = 225
      Height = 3
      Align = alTop
      Shape = bsSpacer
      ExplicitLeft = 88
      ExplicitTop = 144
      ExplicitWidth = 50
    end
    object pnlModulosTit: TPanel
      Left = 0
      Top = 0
      Width = 225
      Height = 18
      Align = alTop
      BevelOuter = bvLowered
      Caption = 'M'#211'DULOS'
      Color = clGray
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindow
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
      TabOrder = 0
    end
    object dbgModulos: TDBGrid
      Left = 0
      Top = 21
      Width = 225
      Height = 455
      Align = alClient
      DataSource = dsModulos
      Enabled = False
      Options = [dgTitles, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgConfirmDelete, dgCancelOnExit]
      ReadOnly = True
      TabOrder = 1
      TitleFont.Charset = DEFAULT_CHARSET
      TitleFont.Color = clWindowText
      TitleFont.Height = -11
      TitleFont.Name = 'Tahoma'
      TitleFont.Style = []
      OnDrawColumnCell = dbgModulosDrawColumnCell
      Columns = <
        item
          Expanded = False
          FieldName = 'DS_NOME_MODULO'
          Title.Caption = 'Nome'
          Visible = True
        end>
    end
  end
  object pnlGeral: TPanel
    Left = 228
    Top = 100
    Width = 1036
    Height = 476
    Align = alClient
    BevelOuter = bvNone
    TabOrder = 3
    object pgcOpcoes: TPageControl
      Left = 0
      Top = 0
      Width = 1036
      Height = 476
      ActivePage = tbsColigadas
      Align = alClient
      MultiLine = True
      TabOrder = 0
      TabPosition = tpBottom
      OnChange = pgcOpcoesChange
      OnChanging = pgcOpcoesChanging
      object tbsPermissoes: TTabSheet
        Caption = 'PERMISS'#213'ES'
        object pnTitulo: TPanel
          Left = 0
          Top = 0
          Width = 1028
          Height = 17
          Align = alTop
          TabOrder = 0
          object pnlPermissoesTit: TPanel
            Left = 1
            Top = 1
            Width = 1026
            Height = 18
            Align = alTop
            BevelOuter = bvLowered
            Caption = 'PERMISS'#213'ES'
            Color = clGray
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindow
            Font.Height = -11
            Font.Name = 'Tahoma'
            Font.Style = []
            ParentFont = False
            TabOrder = 0
          end
        end
        object pnPermissoes: TPanel
          Left = 0
          Top = 41
          Width = 1028
          Height = 409
          Align = alClient
          TabOrder = 1
          Visible = False
          object dbcPermissoes: TDBCtrlGrid
            Left = 1
            Top = 1
            Width = 1026
            Height = 407
            Align = alClient
            AllowDelete = False
            AllowInsert = False
            DataSource = dsPermissoes
            PanelHeight = 22
            PanelWidth = 1009
            TabOrder = 0
            RowCount = 18
            Visible = False
            object dbTexto: TDBText
              Left = 6
              Top = 4
              Width = 641
              Height = 13
              Anchors = [akLeft]
              DataField = 'Nome'
              DataSource = dsPermissoes
            end
            object dbAcesso: TDBCheckBox
              Tag = 1
              Left = 655
              Top = 4
              Width = 13
              Height = 13
              Anchors = [akLeft]
              DataField = 'ACESSO'
              DataSource = dsPermissoes
              TabOrder = 0
              ValueChecked = '1'
              ValueUnchecked = '0'
              OnClick = dbPermissaoClick
            end
            object dbAlteracao: TDBCheckBox
              Tag = 4
              Left = 759
              Top = 4
              Width = 13
              Height = 13
              Anchors = [akLeft]
              DataField = 'ALTERACAO'
              DataSource = dsPermissoes
              TabOrder = 3
              ValueChecked = '1'
              ValueUnchecked = '0'
              OnClick = dbPermissaoClick
            end
            object dbInclusao: TDBCheckBox
              Tag = 2
              Left = 707
              Top = 4
              Width = 13
              Height = 13
              Anchors = [akLeft]
              DataField = 'INCLUSAO'
              DataSource = dsPermissoes
              TabOrder = 1
              ValueChecked = '1'
              ValueUnchecked = '0'
              OnClick = dbPermissaoClick
            end
            object dbExclusao: TDBCheckBox
              Tag = 8
              Left = 811
              Top = 4
              Width = 13
              Height = 13
              Anchors = [akLeft]
              DataField = 'EXCLUSAO'
              DataSource = dsPermissoes
              TabOrder = 2
              ValueChecked = '1'
              ValueUnchecked = '0'
              OnClick = dbPermissaoClick
            end
            object dbEspecial: TDBCheckBox
              Tag = 16
              Left = 863
              Top = 4
              Width = 13
              Height = 13
              Anchors = [akLeft]
              DataField = 'ESPECIAL'
              DataSource = dsPermissoes
              TabOrder = 4
              ValueChecked = '1'
              ValueUnchecked = '0'
              OnClick = dbPermissaoClick
            end
            object dbTodas: TDBCheckBox
              Left = 915
              Top = 4
              Width = 13
              Height = 13
              Anchors = [akLeft]
              DataField = 'TODAS'
              DataSource = dsPermissoes
              TabOrder = 5
              ValueChecked = '1'
              ValueUnchecked = '0'
              OnClick = dbTodasClick
            end
          end
        end
        object pnHeader: TPanel
          Left = 0
          Top = 17
          Width = 1028
          Height = 24
          Align = alTop
          TabOrder = 2
          Visible = False
          object Label1: TLabel
            Left = 639
            Top = 6
            Width = 46
            Height = 13
            Alignment = taCenter
            AutoSize = False
            Caption = 'Acesso'
          end
          object Label2: TLabel
            Left = 691
            Top = 6
            Width = 46
            Height = 13
            Alignment = taCenter
            AutoSize = False
            Caption = 'Inclus'#227'o'
          end
          object Label3: TLabel
            Left = 743
            Top = 6
            Width = 46
            Height = 13
            Alignment = taCenter
            AutoSize = False
            Caption = 'Altera'#231#227'o'
          end
          object Label4: TLabel
            Left = 795
            Top = 6
            Width = 46
            Height = 13
            Alignment = taCenter
            AutoSize = False
            Caption = 'Exclus'#227'o'
          end
          object Label5: TLabel
            Left = 847
            Top = 6
            Width = 46
            Height = 13
            Alignment = taCenter
            AutoSize = False
            Caption = 'Especial'
          end
          object Label6: TLabel
            Left = 899
            Top = 6
            Width = 81
            Height = 13
            Caption = 'Selecionar Todas'
          end
        end
      end
      object tbsColigadas: TTabSheet
        Caption = 'Usu'#225'rios do grupo'
        ImageIndex = 1
        object bvlSep4: TBevel
          Left = 0
          Top = 81
          Width = 1028
          Height = 3
          Align = alTop
          Shape = bsSpacer
          ExplicitTop = 113
          ExplicitWidth = 686
        end
        object pnlColigadas: TPanel
          Left = 0
          Top = 0
          Width = 1028
          Height = 81
          Align = alTop
          BevelOuter = bvNone
          TabOrder = 0
          object lblColigadas: TLabel
            Left = 16
            Top = 24
            Width = 50
            Height = 13
            Caption = 'Coligadas:'
          end
          object sbAdicionar: TSpeedButton
            Left = 313
            Top = 40
            Width = 82
            Height = 21
            Caption = 'Adicionar'
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
            OnClick = sbAdicionarClick
          end
          object sbExcluir: TSpeedButton
            Left = 405
            Top = 40
            Width = 82
            Height = 21
            Caption = 'Excluir'
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
            OnClick = sbExcluirClick
          end
          object pnlColigadasTit: TPanel
            Left = 0
            Top = 0
            Width = 1028
            Height = 18
            Align = alTop
            BevelOuter = bvLowered
            Caption = 'COLIGADAS'
            Color = clGray
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindow
            Font.Height = -11
            Font.Name = 'Tahoma'
            Font.Style = []
            ParentFont = False
            TabOrder = 0
          end
          object cbColigadas: TUMComboBox
            Left = 16
            Top = 40
            Width = 291
            Height = 21
            Style = csDropDownList
            ItemHeight = 13
            TabOrder = 1
            OnChange = cbColigadasChange
            TamanhoMaximo = 0
            SelecionarUnicoAutomatico = False
          end
        end
        object pnlUsuarios: TPanel
          Left = 0
          Top = 84
          Width = 1028
          Height = 253
          Align = alClient
          BevelOuter = bvNone
          TabOrder = 1
          object bvlSep6: TBevel
            Left = 0
            Top = 18
            Width = 1028
            Height = 3
            Align = alTop
            Shape = bsSpacer
            ExplicitWidth = 686
          end
          object pnlUsuariosTit: TPanel
            Left = 0
            Top = 0
            Width = 1028
            Height = 18
            Align = alTop
            BevelOuter = bvLowered
            Caption = 'USU'#193'RIOS VINCULADOS'
            Color = clGray
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindow
            Font.Height = -11
            Font.Name = 'Tahoma'
            Font.Style = []
            ParentFont = False
            TabOrder = 0
          end
          object dbgUsuarios: TDBGrid
            Left = 0
            Top = 21
            Width = 1028
            Height = 232
            Align = alClient
            DataSource = dsPessoasColigadas
            Options = [dgTitles, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgConfirmDelete, dgCancelOnExit]
            ReadOnly = True
            TabOrder = 1
            TitleFont.Charset = DEFAULT_CHARSET
            TitleFont.Color = clWindowText
            TitleFont.Height = -11
            TitleFont.Name = 'Tahoma'
            TitleFont.Style = []
            OnTitleClick = dbgUsuariosTitleClick
            Columns = <
              item
                Expanded = False
                FieldName = 'CD_PESSOA'
                Title.Caption = 'C'#243'digo'
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'NM_PESSOA'
                Title.Caption = 'Nome'
                Width = 470
                Visible = True
              end>
          end
        end
        object pnlBuscaUsuario: TPanel
          Left = 0
          Top = 337
          Width = 1028
          Height = 113
          Align = alBottom
          BevelOuter = bvNone
          TabOrder = 2
          object sbFiltrar: TSpeedButton
            Left = 263
            Top = 48
            Width = 82
            Height = 21
            Caption = 'Buscar'
            Flat = True
            Glyph.Data = {
              36040000424D3604000000000000360000002800000010000000100000000100
              2000000000000004000000000000000000000000000000000000FF00FF00FF00
              FF00FF00FF00FF00FF00FF00FF00000000000000000000000000FF00FF00FF00
              FF00FF00FF00FF00FF00FF00FF00000000000000000000000000FF00FF00FF00
              FF00FF00FF00FF00FF00FF00FF0000000000FF00FF0000000000FF00FF00FF00
              FF00FF00FF00FF00FF00FF00FF0000000000FF00FF0000000000FF00FF00FF00
              FF00FF00FF00FF00FF00FF00FF000000000000000000000000007B7B7B00FF00
              FF00FF00FF00FF00FF007B7B7B00000000000000000000000000FF00FF00FF00
              FF00FF00FF00FF00FF00FF00FF00000000000000000000000000000000000000
              0000000000000000000000000000000000000000000000000000FF00FF00FF00
              FF00FF00FF00FF00FF00FF00FF0000000000FF00FF0000000000000000000000
              000000000000FF00FF0000000000000000000000000000000000FF00FF00FF00
              FF00FF00FF00FF00FF00FF00FF0000000000FF00FF0000000000000000000000
              000000000000FF00FF0000000000000000000000000000000000FF00FF00FF00
              FF00FF00FF00FF00FF00FF00FF00000000000000000000000000000000000000
              0000000000000000000000000000000000000000000000000000FF00FF000000
              0000000000000000000000000000000000000000000000000000000000000000
              00007B7B7B0000000000000000000000000000000000FF00FF00FF00FF000000
              0000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF000000000000000000FFFF
              FF0000000000FF00FF000000000000000000FF00FF00FF00FF00FF00FF000000
              0000FFFFFF00000000000000000000000000FFFFFF000000000000000000FFFF
              FF0000000000FF00FF000000000000000000FF00FF00FF00FF00FF00FF000000
              0000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF000000000000000000FFFF
              FF0000000000FF00FF000000000000000000FF00FF00FF00FF00FF00FF000000
              0000FFFFFF0000000000000000000000000000000000FFFFFF00FFFFFF00FFFF
              FF0000000000FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF000000
              0000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
              FF0000000000FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF007B00
              00007B0000007B0000007B0000007B0000007B0000007B0000007B0000007B00
              00007B000000FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF007B00
              00007B0000007B0000007B0000007B0000007B0000007B0000007B0000007B00
              00007B000000FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
              FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
              FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00}
            OnClick = sbFiltrarClick
          end
          object pnlOpcoes: TPanel
            Left = 0
            Top = 0
            Width = 1028
            Height = 18
            Align = alTop
            BevelOuter = bvLowered
            Caption = 'OP'#199#213'ES'
            Color = clGray
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindow
            Font.Height = -11
            Font.Name = 'Tahoma'
            Font.Style = []
            ParentFont = False
            TabOrder = 0
          end
          object ledUsuario: TLabeledEdit
            Left = 16
            Top = 48
            Width = 241
            Height = 21
            EditLabel.Width = 40
            EditLabel.Height = 13
            EditLabel.Caption = 'Usu'#225'rio:'
            TabOrder = 1
            OnKeyPress = ledUsuarioKeyPress
          end
        end
      end
    end
  end
  object toolPessoa: TToolBar
    Left = 0
    Top = 576
    Width = 1264
    Height = 25
    Align = alBottom
    ButtonWidth = 110
    Caption = 'toolRodape'
    EdgeBorders = [ebTop, ebBottom]
    Images = ilMenu
    List = True
    ShowCaptions = True
    TabOrder = 4
    object btnSep1: TToolButton
      Left = 0
      Top = 0
      Width = 8
      Caption = 'btnSep1'
      ImageIndex = 11
      Style = tbsSeparator
    end
    object btnCopiarPriv: TToolButton
      Left = 8
      Top = 0
      AutoSize = True
      Caption = 'Copiar Privil'#233'gios'
      ImageIndex = 0
      OnClick = btnCopiarPrivClick
    end
    object btnSep2: TToolButton
      Left = 120
      Top = 0
      Width = 8
      Caption = 'btnSep2'
      ImageIndex = 11
      Style = tbsSeparator
    end
    object btnMarcar: TToolButton
      Left = 128
      Top = 0
      AutoSize = True
      Caption = 'Marcar Todos'
      ImageIndex = 1
      OnClick = btnMarcarClick
    end
    object btnDesmarcar: TToolButton
      Left = 224
      Top = 0
      AutoSize = True
      Caption = 'Desmarcar Todos'
      ImageIndex = 2
      OnClick = btnDesmarcarClick
    end
    object ToolButton11: TToolButton
      Left = 338
      Top = 0
      Width = 8
      Caption = 'ToolButton11'
      ImageIndex = 7
      Style = tbsSeparator
    end
    object btnFechar: TToolButton
      Left = 346
      Top = 0
      AutoSize = True
      Caption = 'F12 Fechar'
      ImageIndex = 3
      OnClick = btnFecharClick
    end
    object ToolButton2: TToolButton
      Left = 431
      Top = 0
      Width = 8
      Caption = 'ToolButton2'
      ImageIndex = 8
      Style = tbsSeparator
    end
  end
  object dsModulos: TDataSource
    DataSet = qryModulos
    OnDataChange = dsModulosDataChange
    Left = 56
    Top = 160
  end
  object qryModulos: TUMZQuery
    Connection = DM.db
    SQL.Strings = (
      '(SELECT '
      '  cd_modulo, ds_nome_modulo'
      'FROM'
      '   NU_MODULOS'
      'WHERE'
      '   DS_CHAVE NOT LIKE '#39'Impressao.%'#39
      '   AND SN_ATIVO = 1'
      ') UNION ('
      'SELECT'#9
      '              -1 as cd_modulo,'
      #9#39'- Selecione um m'#243'dulo'#39' as ds_nome_modulo'
      ')'
      'ORDER BY'
      '   DS_NOME_MODULO ASC')
    Params = <>
    Left = 24
    Top = 160
    object qryModulosDS_NOME_MODULO: TStringField
      FieldName = 'DS_NOME_MODULO'
      Size = 100
    end
    object qryModulosCD_MODULO: TLargeintField
      FieldName = 'CD_MODULO'
    end
  end
  object qryPermissoes: TUMZQuery
    Connection = DM.db
    AfterOpen = qryPermissoesAfterOpen
    Filtered = True
    SQL.Strings = (
      'SELECT'
      
        '  NG.CD_ACAO codigo , nma.DS_NOME_ACAO  nome , ng.NR_PERMISSAO p' +
        'ermissao , nma.CD_ACAO cd_acao, CONCAT(NM.DS_CHAVE,CONCAT('#39'.'#39',NM' +
        'A.ds_chave)) chave,'
      
        '  CASE WHEN MOD(ng.NR_PERMISSAO, 2) = 1 THEN 1 ELSE 0 END AS '#39'AC' +
        'ESSO'#39','
      
        '  CASE WHEN 2  & ng.NR_PERMISSAO = 2  THEN 1 ELSE 0 END AS '#39'INCL' +
        'USAO'#39','
      
        '  CASE WHEN 4  & ng.NR_PERMISSAO = 4  THEN 1 ELSE 0 END AS '#39'ALTE' +
        'RACAO'#39','
      
        '  CASE WHEN 8  & ng.NR_PERMISSAO = 8  THEN 1 ELSE 0 END AS '#39'EXCL' +
        'USAO'#39','
      
        '  CASE WHEN 16 & ng.NR_PERMISSAO = 16 THEN 1 ELSE 0 END AS '#39'ESPE' +
        'CIAL'#39','
      '  CASE WHEN ng.NR_PERMISSAO = 31 THEN 1 ELSE 0 END AS '#39'TODAS'#39
      'FROM'
      '  NU_MODULOS_ACOES nma'
      
        '  LEFT JOIN NU_GRUPOS_PERMISSOES ng ON (nma.CD_ACAO = NG.CD_ACAO' +
        ' AND  NG.CD_GRUPO = :cd_grupo)'
      '  JOIN NU_MODULOS nm ON (NM.cd_modulo = NMA.CD_MODULO)'
      'WHERE'
      '  NMA.CD_MODULO = :cd_modulo'
      'order by'
      ' nma.DS_NOME_ACAO')
    Params = <
      item
        DataType = ftUnknown
        Name = 'cd_grupo'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'cd_modulo'
        ParamType = ptUnknown
      end>
    Left = 264
    Top = 144
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'cd_grupo'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'cd_modulo'
        ParamType = ptUnknown
      end>
    object qryPermissoesCODIGO: TIntegerField
      FieldName = 'CODIGO'
    end
    object qryPermissoesNOME: TStringField
      FieldName = 'NOME'
      Size = 255
    end
    object qryPermissoesPERMISSAO: TIntegerField
      FieldName = 'PERMISSAO'
    end
    object qryPermissoesCD_ACAO: TIntegerField
      FieldName = 'CD_ACAO'
    end
    object qryPermissoesCHAVE: TStringField
      FieldName = 'CHAVE'
      ReadOnly = True
      Size = 101
    end
    object qryPermissoesACESSO: TLargeintField
      FieldName = 'ACESSO'
    end
    object qryPermissoesINCLUSAO: TLargeintField
      FieldName = 'INCLUSAO'
    end
    object qryPermissoesALTERACAO: TLargeintField
      FieldName = 'ALTERACAO'
    end
    object qryPermissoesEXCLUSAO: TLargeintField
      FieldName = 'EXCLUSAO'
    end
    object qryPermissoesESPECIAL: TLargeintField
      FieldName = 'ESPECIAL'
    end
    object qryPermissoesTODAS: TLargeintField
      FieldName = 'TODAS'
    end
  end
  object dsPermissoes: TDataSource
    DataSet = cdsPermissoes
    Left = 328
    Top = 144
  end
  object qryPessoasColigadas: TUMZQuery
    Connection = DM.db
    SQL.Strings = (
      '')
    Params = <>
    Left = 265
    Top = 272
    object qryPessoasColigadasCD_PESSOA: TIntegerField
      FieldName = 'CD_PESSOA'
    end
    object qryPessoasColigadasNM_PESSOA: TStringField
      FieldName = 'NM_PESSOA'
      Size = 60
    end
    object qryPessoasColigadasCD_COLIGADA: TIntegerField
      FieldName = 'CD_COLIGADA'
      Required = True
    end
  end
  object dsPessoasColigadas: TDataSource
    DataSet = qryPessoasColigadas
    Left = 296
    Top = 272
  end
  object ilMenu: TImageList
    Left = 448
    Top = 570
    Bitmap = {
      494C010104000900040010001000FFFFFFFFFF10FFFFFFFFFFFFFFFF424D3600
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
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000FFFF007F7F7F00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF0000FFFF0000000000000000009C9C9C009C9C9C009C9C
      9C009C9C9C009C9C9C009C9C9C009C9C9C000000000000000000000000000000
      0000000000000000000000000000000000000000000099999900999999009999
      9900999999009999990099999900999999000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000FFFF007F7F7F00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF0000FFFF0000000000000000009C9C9C00000000000000
      00000000000000000000000000009C9C9C000000000000000000000000000000
      0000000000000000000000000000000000000000000099999900000000000000
      0000000000000000000000000000999999000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000FFFF007F7F7F00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF0000FFFF0000000000000000009C9C9C00000000000000
      00000000000000000000000000009C9C9C000000000000000000000000000000
      0000000000000000000000000000000000000000000099999900000000000000
      0000000000000000000000000000999999000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000003163
      9C0031639C000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000FFFF007F7F7F00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF0000FFFF0000000000000000009C9C9C00000000000000
      00000000000000000000000000009C9C9C000000000000000000000000000000
      0000000000000000000000000000000000000000000099999900000000000000
      0000000000000000000000000000999999000000000000000000000000000000
      0000000000000000000000000000000000000052630031639C0031639C003163
      9C0031639C000000000000526300005263000052630000526300005263000052
      6300000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000000000007F7F7F007F7F
      7F0000000000000000007F7F7F0000000000000000009C9C9C00000000000000
      00000000000000000000000000009C9C9C00000000009C9C9C009C9C9C009C9C
      9C009C9C9C009C9C9C009C9C9C009C9C9C000000000099999900000000000000
      0000000000000000000000000000999999000000000099999900999999009999
      99009999990099999900999999009999990000526300316B9C00316B9C003163
      9C0031639C000000000000CEFF0000CEFF0000CEFF0000000000000000000000
      00000000000000000000000000000000000000000000FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF0000000000000000000000
      00007F7F7F007F7F7F0000FFFF0000000000000000009C9C9C00000000000000
      00000000000000000000000000009C9C9C00000000009C9C9C00000000000000
      00000000000000000000000000009C9C9C000000000099999900000000000000
      0000000000000000000000000000999999000000000099999900000000000000
      00000000000000000000000000009999990000526300296BA500296BA500296B
      9C00296B9C000000000000CEFF0000CEFF0000CEFF000000000000000000FF00
      00000000000000000000000000000000000000000000FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF0000000000000000000000
      00007F7F7F0000FFFF0000FFFF0000000000000000009C9C9C009C9C9C009C9C
      9C009C9C9C009C9C9C009C9C9C009C9C9C00000000009C9C9C00000000000000
      00000000000000000000000000009C9C9C000000000099999900999999009999
      9900999999009999990099999900999999000000000099999900000000000000
      000000000000000000000000000099999900005263002173AD002173A5002173
      A5002973A5000000000010CEFF0000CEFF0000CEFF0000000000FF000000FF00
      00000000000000000000000000000000000000000000FFFFFF00000000000000
      0000FFFFFF00000000000000000000000000FFFFFF0000000000000000000000
      00000000FF0000000000000000007F7F7F000000000000000000000000000000
      000000000000000000000000000000000000000000009C9C9C00000000000000
      00000000000000000000000000009C9C9C000000000000000000000000000000
      0000000000000000000000000000000000000000000099999900000000000000
      00000000000000000000000000009999990000526300187BAD00187BAD00FFFF
      FF002173AD000000000031D6FF0029D6FF0018D6FF00FF000000FF000000FF00
      00000000000000000000000000000000000000000000FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF0000000000000000000000
      FF000000FF000000FF0000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000009C9C9C00000000000000
      00000000000000000000000000009C9C9C000000000000000000000000000000
      0000000000000000000000000000000000000000000099999900000000000000
      000000000000000000000000000099999900005263001084B5001884B5001884
      B500187BB5000000000063DEFF0052DEFF00FF000000FF000000FF000000FF00
      0000FF000000FF000000FF0000000000000000000000FFFFFF00000000000000
      00000000000000000000FFFFFF0000000000FFFFFF00000000000000FF000000
      FF000000FF000000FF000000FF0000000000000000009C9C9C009C9C9C009C9C
      9C009C9C9C009C9C9C009C9C9C009C9C9C00000000009C9C9C00000000000000
      00000000000000000000000000009C9C9C000000000099999900999999009999
      9900999999009999990099999900999999000000000099999900000000000000
      00000000000000000000000000009999990000526300088CBD00108CBD001084
      BD001084B500000000008CE7FF00FF000000FF000000FF000000FF000000FF00
      0000FF000000FF000000FF0000000000000000000000FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF000000FF000000FF000000
      FF000000FF000000FF000000FF000000FF00000000009C9C9C00000000000000
      00000000000000000000000000009C9C9C00000000009C9C9C009C9C9C009C9C
      9C009C9C9C009C9C9C009C9C9C009C9C9C000000000099999900000000000000
      0000000000000000000000000000999999000000000099999900999999009999
      990099999900999999009999990099999900005263000894C600088CC600088C
      C600088CBD0000000000B5EFFF00A5EFFF00FF000000FF000000FF000000FF00
      0000FF000000FF000000FF0000000000000000000000FFFFFF00000000000000
      0000FFFFFF000000000000000000000000000000000000000000000000000000
      FF000000FF000000FF000000000000000000000000009C9C9C00000000000000
      00000000000000000000000000009C9C9C000000000000000000000000000000
      0000000000000000000000000000000000000000000099999900000000000000
      0000000000000000000000000000999999000000000000000000000000000000
      000000000000000000000000000000000000005263000094CE000094CE000094
      C6000094C60000000000DEF7FF00CEF7FF00C6EFFF00FF000000FF000000FF00
      00000000000000000000000000000000000000000000FFFFFF00FFFFFF00FFFF
      FF00FFFFFF0000000000FFFFFF00FFFFFF000000000000000000000000000000
      FF000000FF000000FF000000000000000000000000009C9C9C00000000000000
      00000000000000000000000000009C9C9C000000000000000000000000000000
      0000000000000000000000000000000000000000000099999900000000000000
      0000000000000000000000000000999999000000000000000000000000000000
      00000000000000000000000000000000000000526300009CCE00009CCE00009C
      CE000094CE0000000000FFFFFF00F7F7FF00E7F7FF0000000000FF000000FF00
      00000000000000000000000000000000000000000000FFFFFF0000000000BFBF
      BF00FFFFFF0000000000FFFFFF000000000000000000000000007F7F7F000000
      FF000000FF000000FF000000000000000000000000009C9C9C00000000000000
      00000000000000000000000000009C9C9C000000000000000000000000000000
      0000000000000000000000000000000000000000000099999900000000000000
      0000000000000000000000000000999999000000000000000000000000000000
      00000000000000000000000000000000000000526300009CCE00009CCE00009C
      CE00009CCE0000000000FFFFFF00FFFFFF00FFFFFF000000000000000000FF00
      00000000000000000000000000000000000000000000FFFFFF00FFFFFF00FFFF
      FF00FFFFFF000000000000000000000000000000FF000000FF000000FF000000
      FF000000FF00000000000000000000000000000000009C9C9C00000000000000
      00000000000000000000000000009C9C9C000000000000000000000000000000
      0000000000000000000000000000000000000000000099999900000000000000
      0000000000000000000000000000999999000000000000000000000000000000
      000000000000000000000000000000000000000000000052630000526300009C
      CE00009CCE000000000000526300005263000052630000526300000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000009C9C9C009C9C9C009C9C
      9C009C9C9C009C9C9C009C9C9C009C9C9C000000000000000000000000000000
      0000000000000000000000000000000000000000000099999900999999009999
      9900999999009999990099999900999999000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000052
      6300005263000052630000000000000000000000000000000000000000000000
      000000000000000000000000000000000000424D3E000000000000003E000000
      2800000040000000300000000100010000000000800100000000000000000000
      000000000000000000000000FFFFFF0000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000FC0080FF80FFFFFFFC00BEFFBEFFE3FF
      FC00B6FFBEFF83FFFC00AAFFBEFF000F0000BC80BE80003F0000BEBEBEBE002F
      000080B680BE000F0000FFAAFFBE000F0023FFBCFFBE0001000180BE80BE0001
      0000BE80BE8000010023B6FFBEFF000F0063AAFFBEFF000F00C3BCFFBEFF002F
      0107BEFFBEFF803F03FF80FF80FFE3FF00000000000000000000000000000000
      000000000000}
  end
  object cdsPermissoes: TClientDataSet
    Active = True
    Aggregates = <>
    FieldDefs = <
      item
        Name = 'Codigo'
        DataType = ftInteger
      end
      item
        Name = 'Nome'
        DataType = ftString
        Size = 255
      end
      item
        Name = 'Permissao'
        DataType = ftInteger
      end
      item
        Name = 'Cd_acao'
        DataType = ftInteger
      end
      item
        Name = 'Chave'
        DataType = ftString
        Size = 255
      end
      item
        Name = 'Acesso'
        DataType = ftLargeint
      end
      item
        Name = 'Inclusao'
        DataType = ftLargeint
      end
      item
        Name = 'Alteracao'
        DataType = ftLargeint
      end
      item
        Name = 'Exclusao'
        DataType = ftLargeint
      end
      item
        Name = 'Especial'
        DataType = ftLargeint
      end
      item
        Name = 'Todas'
        DataType = ftLargeint
      end>
    IndexDefs = <>
    Params = <>
    StoreDefs = True
    Left = 296
    Top = 144
    Data = {
      E00000009619E0BD01000000180000000B000000000003000000E00006436F64
      69676F0400010000000000044E6F6D6502004900000001000557494454480200
      0200FF00095065726D697373616F04000100000000000743645F6163616F0400
      010000000000054368617665020049000000010005574944544802000200FF00
      0641636573736F080001000000000008496E636C7573616F0800010000000000
      09416C7465726163616F0800010000000000084578636C7573616F0800010000
      00000008457370656369616C080001000000000005546F646173080001000000
      00000000}
    object cdsPermissoesCODIGO: TIntegerField
      FieldName = 'Codigo'
    end
    object cdsPermissoesPERMISSAO: TIntegerField
      FieldName = 'Permissao'
    end
    object cdsPermissoesACAO: TIntegerField
      FieldName = 'Cd_acao'
    end
    object cdsPermissoesCHAVE: TStringField
      FieldName = 'Chave'
      Size = 255
    end
    object cdsPermissoesACESSO: TLargeintField
      FieldName = 'Acesso'
    end
    object cdsPermissoesINCLUSAO: TLargeintField
      FieldName = 'Inclusao'
    end
    object cdsPermissoesALTERACAO: TLargeintField
      FieldName = 'Alteracao'
    end
    object cdsPermissoesEXCLUSAO: TLargeintField
      FieldName = 'Exclusao'
    end
    object cdsPermissoesESPECIAL: TLargeintField
      FieldName = 'Especial'
    end
    object cdsPermissoesTODAS: TLargeintField
      FieldName = 'Todas'
    end
    object cdsPermissoesNome: TStringField
      FieldName = 'Nome'
      Size = 255
    end
  end
  object qryUpdatePermissao: TUMZQuery
    Connection = DM.db
    SQL.Strings = (
      'UPDATE'
      '  nu_grupos_permissoes'
      'SET'
      '  nr_permissao = :permissao'
      'WHERE'
      '  cd_grupo = :grupo AND'
      '  cd_acao = :acao')
    Params = <
      item
        DataType = ftUnknown
        Name = 'permissao'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'grupo'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'acao'
        ParamType = ptUnknown
      end>
    Left = 264
    Top = 176
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'permissao'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'grupo'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'acao'
        ParamType = ptUnknown
      end>
  end
  object qryUpdateTodasPermissoes: TUMZQuery
    Connection = DM.db
    SQL.Strings = (
      'UPDATE NU_GRUPOS_PERMISSOES ng'
      
        'INNER JOIN NU_MODULOS_ACOES nma ON (nma.CD_ACAO = NG.CD_ACAO AND' +
        '  NG.CD_GRUPO = :grupo)'
      'SET'
      '   ng.nr_permissao = :permissao'
      'WHERE'
      '   NMA.cd_modulo = :modulo')
    Params = <
      item
        DataType = ftUnknown
        Name = 'grupo'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'permissao'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'modulo'
        ParamType = ptUnknown
      end>
    Left = 264
    Top = 208
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'grupo'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'permissao'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'modulo'
        ParamType = ptUnknown
      end>
  end
  object qryInserePermissao: TUMZQuery
    Connection = DM.db
    SQL.Strings = (
      
        'INSERT IGNORE INTO NU_GRUPOS_PERMISSOES (cd_grupo,cd_acao,nr_per' +
        'missao)'
      'VALUES (:grupo,:cd_acao,:nr_permissao)')
    Params = <
      item
        DataType = ftUnknown
        Name = 'grupo'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'cd_acao'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'nr_permissao'
        ParamType = ptUnknown
      end>
    Left = 296
    Top = 176
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'grupo'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'cd_acao'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'nr_permissao'
        ParamType = ptUnknown
      end>
  end
  object qryInsereTodasPermissoes: TUMZQuery
    Connection = DM.db
    SQL.Strings = (
      'INSERT INTO NU_GRUPOS_PERMISSOES (cd_grupo,cd_acao,nr_permissao)'
      'SELECT'
      #9':grupo, nma.cd_acao, :permissao'
      'FROM'
      #9'NU_MODULOS_ACOES nma'
      'LEFT JOIN NU_GRUPOS_PERMISSOES ng ON ('
      #9'nma.CD_ACAO = NG.CD_ACAO'
      #9'AND NG.CD_GRUPO = :grupo'
      ')'
      'WHERE'
      #9'NMA.CD_MODULO = :modulo AND ng.cd_acao IS NULL'
      'ORDER BY'
      #9'nma.DS_NOME_ACAO')
    Params = <
      item
        DataType = ftUnknown
        Name = 'grupo'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'permissao'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'modulo'
        ParamType = ptUnknown
      end>
    Left = 296
    Top = 208
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'grupo'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'permissao'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'modulo'
        ParamType = ptUnknown
      end>
  end
  object qryVerificaPermissaoFaltando: TUMZQuery
    Connection = DM.db
    SQL.Strings = (
      'SELECT'
      #9'count(nma.cd_acao) as contAcao'
      'FROM'
      #9'NU_MODULOS_ACOES nma'
      'LEFT JOIN NU_GRUPOS_PERMISSOES ng ON ('
      #9'nma.CD_ACAO = NG.CD_ACAO'
      #9'AND NG.CD_GRUPO = :grupo'
      ')'
      'WHERE'
      #9'NMA.CD_MODULO = :modulo AND ng.cd_acao IS NULL'
      'ORDER BY'
      #9'nma.DS_NOME_ACAO')
    Params = <
      item
        DataType = ftUnknown
        Name = 'grupo'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'modulo'
        ParamType = ptUnknown
      end>
    Left = 328
    Top = 208
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'grupo'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'modulo'
        ParamType = ptUnknown
      end>
  end
end
