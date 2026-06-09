object frmImportarDados: TfrmImportarDados
  Left = 0
  Top = 129
  Caption = 'Importa'#231#227'o de dados e classifica'#231#227'o'
  ClientHeight = 648
  ClientWidth = 895
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  FormStyle = fsMDIChild
  KeyPreview = True
  OldCreateOrder = False
  Position = poDesigned
  Visible = True
  WindowState = wsMaximized
  OnClose = FormClose
  OnCreate = FormCreate
  OnDestroy = FormDestroy
  OnKeyDown = FormKeyDown
  PixelsPerInch = 96
  TextHeight = 13
  object SpeedButton12: TSpeedButton
    Left = 1
    Top = 3
    Width = 87
    Height = 22
    Caption = 'Voltar'
    Flat = True
    Glyph.Data = {
      DA010000424DDA010000000000003600000028000000090000000F0000000100
      180000000000A4010000C30E0000C30E00000000000000000000E3DFE0E3DFE0
      E3DFE0E3DFE0E3DFE0E3DFE04B4B4B4B4B4BE3DFE000E3DFE0E3DFE0E3DFE0E3
      DFE0E3DFE04B4B4B00BF2A00DF00007F0000E3DFE0E3DFE0E3DFE0E3DFE04B4B
      4B00BF2A00DF0000DF00007F0000E3DFE0E3DFE0E3DFE04B4B4B00BF2A00DF00
      00DF0000DF00007F0000E3DFE0E3DFE04B4B4B00BF2A00DF0000DF0000FF0900
      DF00007F0000E3DFE04B4B4B00BF2A00DF0000DF0000FF0900DF0000FF2A007F
      00004B4B4B00BF2A00DF0000DF0000FF0900DF0000FF2A55FF00007F0000007F
      0000DF0000DF0000FF0900DF0000FF2A00FF0955FFAA007F0000E3DFE0007F00
      55FFAA00DF0000FF2A00FF0900FF0955FFAA007F0000E3DFE0E3DFE0007F0000
      FF2A00FF0900FF0900FF09AAFF2A007F0000E3DFE0E3DFE0E3DFE0007F00AAFF
      2A00FF0900FF09AAFF2A007F0000E3DFE0E3DFE0E3DFE0E3DFE0007F00AAFF2A
      00FF09AAFFAA007F0000E3DFE0E3DFE0E3DFE0E3DFE0E3DFE0007F00AAFFAAAA
      FFAA007F0000E3DFE0E3DFE0E3DFE0E3DFE0E3DFE0E3DFE0007F00AAFFAA007F
      0000E3DFE0E3DFE0E3DFE0E3DFE0E3DFE0E3DFE0E3DFE0007F00E3DFE000}
  end
  object SpeedButton1: TSpeedButton
    Left = 448
    Top = 336
    Width = 23
    Height = 22
  end
  object Panel3: TPanel
    Left = 0
    Top = 0
    Width = 895
    Height = 25
    Align = alTop
    BevelOuter = bvLowered
    Caption = 'IMPORTAR DADOS E CLASSIFICAR'
    Color = clBlue
    Font.Charset = ANSI_CHARSET
    Font.Color = clWhite
    Font.Height = -13
    Font.Name = 'Arial'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 0
  end
  object pcImportarDados: TPageControl
    Left = 0
    Top = 25
    Width = 895
    Height = 623
    ActivePage = tsSelecionarArquivo
    Align = alClient
    TabOrder = 1
    OnChange = pcImportarDadosChange
    OnChanging = pcImportarDadosChanging
    object tsSelecionarArquivo: TTabSheet
      Caption = 'Passo 1 - Selecionar Arquivo'
      OnShow = tsSelecionarArquivoShow
      object Label1: TLabel
        Left = 24
        Top = 46
        Width = 292
        Height = 16
        Caption = 'Selecione o arquivo contendo a lista de aprovados.'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
      end
      object Label2: TLabel
        Left = 24
        Top = 10
        Width = 258
        Height = 22
        Caption = 'Passo 1 - Selecionar o arquivo'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -19
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
      end
      object Label3: TLabel
        Left = 24
        Top = 68
        Width = 442
        Height = 16
        Align = alCustom
        Caption = 
          'Os aprovados ser'#227'o lidos pelo sistema e organizados para o pr'#243'xi' +
          'mo passo.'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
      end
      object Panel2: TPanel
        Left = 0
        Top = 0
        Width = 887
        Height = 209
        Align = alTop
        BevelOuter = bvNone
        TabOrder = 0
        object Label7: TLabel
          Left = 24
          Top = 5
          Width = 176
          Height = 16
          Caption = 'Passo 1 - Selecionar o arquivo'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          ParentFont = False
        end
        object Label8: TLabel
          Left = 24
          Top = 27
          Width = 247
          Height = 14
          Caption = 'Selecione o arquivo contendo a lista de aprovados.'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = []
          ParentFont = False
        end
        object Label9: TLabel
          Left = 24
          Top = 49
          Width = 371
          Height = 14
          Align = alCustom
          Caption = 
            'Os aprovados ser'#227'o lidos pelo sistema e organizados para o pr'#243'xi' +
            'mo passo.'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = []
          ParentFont = False
        end
        object Label13: TLabel
          Left = 24
          Top = 71
          Width = 401
          Height = 14
          Caption = 
            'Voc'#234' pode importar v'#225'rios arquivos. Para cada arquivo use o bot'#227 +
            'o "Ler arquivos".'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = []
          ParentFont = False
        end
        object sbProcurar: TSpeedButton
          Left = 500
          Top = 94
          Width = 100
          Height = 24
          Caption = 'Procurar...'
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
          OnClick = sbProcurarClick
        end
        object Label14: TLabel
          Left = 24
          Top = 127
          Width = 178
          Height = 14
          Caption = 'Selecione o prop'#243'sito da importa'#231#227'o:'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = []
          ParentFont = False
        end
        object lblPorcentagem: TLabel
          Left = 24
          Top = 187
          Width = 140
          Height = 14
          Caption = 'Aguarde a leitura do arquivo:'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = []
          ParentFont = False
          Visible = False
        end
        object sbLerArquivos: TSpeedButton
          Left = 24
          Top = 147
          Width = 113
          Height = 34
          Caption = 'Ler Arquivos'
          Glyph.Data = {
            F6000000424DF600000000000000760000002800000010000000100000000100
            04000000000080000000CE0E0000D80E00001000000000000000000000000000
            80000080000000808000800000008000800080800000C0C0C000808080000000
            FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00222222222222
            222200000000000022000FFFFFFFFFF020000FFFFFFF000080020FFFFFF08778
            08220FFFFF0877E880220FFFFF07777870220FFFFF07E77870220FFFFF08EE78
            80220FFFFFF0877802220FFFFFFF000022220FFFFFFFFFF022220FFFFFFF0000
            22220FFFFFFF070222220FFFFFFF002222220000000002222222}
          OnClick = sbLerArquivosClick
        end
        object lblOutros: TLabel
          Left = 429
          Top = 127
          Width = 119
          Height = 14
          Caption = 'Prop'#243'sito da importa'#231#227'o:'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = []
          ParentFont = False
          Visible = False
        end
        object txtBuscar: TEdit
          Left = 24
          Top = 94
          Width = 470
          Height = 24
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          ParentFont = False
          TabOrder = 0
        end
        object cbPropositoImportacao: TComboBox
          Left = 208
          Top = 124
          Width = 215
          Height = 21
          Style = csDropDownList
          ItemHeight = 13
          TabOrder = 1
          OnChange = cbPropositoImportacaoChange
        end
        object prgLeituraArquivo: TProgressBar
          Left = 170
          Top = 183
          Width = 547
          Height = 20
          Max = 1000
          TabOrder = 2
          Visible = False
        end
        object txtOutros: TEdit
          Left = 554
          Top = 122
          Width = 202
          Height = 24
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          ParentFont = False
          TabOrder = 3
          Visible = False
        end
      end
      object Panel1: TPanel
        Left = 0
        Top = 209
        Width = 887
        Height = 386
        Align = alClient
        BevelOuter = bvNone
        TabOrder = 1
        object Panel4: TPanel
          Left = 0
          Top = 25
          Width = 887
          Height = 32
          Align = alTop
          BevelOuter = bvNone
          TabOrder = 0
          object Label16: TLabel
            Left = 24
            Top = 8
            Width = 153
            Height = 14
            Caption = 'Total de registros encontrados: '
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'Arial'
            Font.Style = []
            ParentFont = False
          end
          object lblQtdRegistros: TLabel
            Left = 183
            Top = 8
            Width = 6
            Height = 14
            Caption = '0'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'Arial'
            Font.Style = []
            ParentFont = False
          end
        end
        object gridRegistrosEncontrados: TDBGrid
          Left = 0
          Top = 57
          Width = 887
          Height = 299
          Align = alClient
          DataSource = dtPessoasImportadas
          Options = [dgTitles, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgConfirmDelete, dgCancelOnExit]
          TabOrder = 1
          TitleFont.Charset = DEFAULT_CHARSET
          TitleFont.Color = clWindowText
          TitleFont.Height = -11
          TitleFont.Name = 'Tahoma'
          TitleFont.Style = []
          OnKeyDown = gridRegistrosEncontradosKeyDown
          OnTitleClick = gridRegistrosEncontradosTitleClick
          Columns = <
            item
              Expanded = False
              FieldName = 'DS_NOME'
              Title.Caption = 'Nome Pessoa'
              Width = 260
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'NR_CLASSIFICACAO'
              Title.Caption = 'Classifica'#231#227'o'
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'DS_CURSO'
              Title.Caption = 'Curso'
              Width = 300
              Visible = True
            end>
        end
        object Panel5: TPanel
          Left = 0
          Top = 356
          Width = 887
          Height = 30
          Align = alBottom
          BevelOuter = bvNone
          TabOrder = 2
          object btnAvancarPasso01: TSpeedButton
            Left = 786
            Top = 0
            Width = 101
            Height = 30
            Align = alRight
            Caption = 'Avan'#231'ar'
            Flat = True
            Glyph.Data = {
              DA010000424DDA010000000000003600000028000000090000000F0000000100
              180000000000A4010000C30E0000C30E00000000000000000000E3DFE04B4B4B
              4B4B4BE3DFE0E3DFE0E3DFE0E3DFE0E3DFE0E3DFE000007F0000DF0000BF2A4B
              4B4BE3DFE0E3DFE0E3DFE0E3DFE0E3DFE000007F0000DF0000DF0000BF2A4B4B
              4BE3DFE0E3DFE0E3DFE0E3DFE000007F0000DF0000DF0000DF0000BF2A4B4B4B
              E3DFE0E3DFE0E3DFE000007F0000DF0000FF0900DF0000DF0000BF2A4B4B4BE3
              DFE0E3DFE000007F0000FF2A00DF0000FF0900DF0000DF0000BF2A4B4B4BE3DF
              E000007F0055FF0000FF2A00DF0000FF0900DF0000DF0000BF2A4B4B4B00007F
              0055FFAA00FF0900FF2A00DF0000FF0900DF0000DF00007F0000007F0055FFAA
              00FF0900FF0900FF2A00DF0055FFAA007F00E3DFE000007F00AAFF2A00FF0900
              FF0900FF0900FF2A007F00E3DFE0E3DFE000007F00AAFF2A00FF0900FF09AAFF
              2A007F00E3DFE0E3DFE0E3DFE000007F00AAFFAA00FF09AAFF2A007F00E3DFE0
              E3DFE0E3DFE0E3DFE000007F00AAFFAAAAFFAA007F00E3DFE0E3DFE0E3DFE0E3
              DFE0E3DFE000007F00AAFFAA007F00E3DFE0E3DFE0E3DFE0E3DFE0E3DFE0E3DF
              E000E3DFE0007F00E3DFE0E3DFE0E3DFE0E3DFE0E3DFE0E3DFE0E3DFE000}
            Layout = blGlyphRight
            OnClick = btnAvancarPasso01Click
            ExplicitLeft = 811
          end
        end
        object Panel6: TPanel
          Left = 0
          Top = 0
          Width = 887
          Height = 25
          Align = alTop
          BevelOuter = bvNone
          Caption = 'REGISTROS ENCONTRADOS'
          Color = clBlue
          Font.Charset = ANSI_CHARSET
          Font.Color = clWhite
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          ParentFont = False
          TabOrder = 3
        end
      end
    end
    object tsGruposAlunos: TTabSheet
      Caption = 'Passo 2 - Selecionar grupos de alunos'
      ImageIndex = 1
      OnShow = tsGruposAlunosShow
      object Panel7: TPanel
        Left = 0
        Top = 0
        Width = 887
        Height = 97
        Align = alTop
        BevelOuter = bvNone
        TabOrder = 0
        object Label6: TLabel
          Left = 20
          Top = 47
          Width = 351
          Height = 14
          Align = alCustom
          Caption = 
            'Voc'#234' pode adicionar apenas o Curso ou mesmo apenas o ano/semestr' +
            'e.'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = []
          ParentFont = False
        end
        object Label5: TLabel
          Left = 20
          Top = 27
          Width = 410
          Height = 14
          Caption = 
            'Adicione na lista abaixo Cursos e Turmas para servirem de filtro' +
            ' na busca de alunos.'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = []
          ParentFont = False
        end
        object Label4: TLabel
          Left = 20
          Top = 5
          Width = 217
          Height = 16
          Caption = 'Passo 2 - Selecionar grupo de alunos'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          ParentFont = False
        end
        object btnRemover: TButton
          Left = 146
          Top = 68
          Width = 120
          Height = 25
          Caption = 'Remover'
          TabOrder = 0
          OnClick = btnRemoverClick
        end
        object btnAddFiltros: TButton
          Left = 20
          Top = 68
          Width = 120
          Height = 25
          Caption = 'Adicionar Filtros'
          TabOrder = 1
          OnClick = btnAddFiltrosClick
        end
      end
      object Panel8: TPanel
        Left = 0
        Top = 97
        Width = 887
        Height = 498
        Align = alClient
        TabOrder = 1
        object panel: TPanel
          Left = 1
          Top = 467
          Width = 885
          Height = 30
          Align = alBottom
          TabOrder = 0
          object btnAvancarPasso02: TSpeedButton
            Left = 784
            Top = 1
            Width = 100
            Height = 28
            Align = alRight
            Caption = 'Avan'#231'ar'
            Flat = True
            Glyph.Data = {
              DA010000424DDA010000000000003600000028000000090000000F0000000100
              180000000000A4010000C30E0000C30E00000000000000000000E3DFE04B4B4B
              4B4B4BE3DFE0E3DFE0E3DFE0E3DFE0E3DFE0E3DFE000007F0000DF0000BF2A4B
              4B4BE3DFE0E3DFE0E3DFE0E3DFE0E3DFE000007F0000DF0000DF0000BF2A4B4B
              4BE3DFE0E3DFE0E3DFE0E3DFE000007F0000DF0000DF0000DF0000BF2A4B4B4B
              E3DFE0E3DFE0E3DFE000007F0000DF0000FF0900DF0000DF0000BF2A4B4B4BE3
              DFE0E3DFE000007F0000FF2A00DF0000FF0900DF0000DF0000BF2A4B4B4BE3DF
              E000007F0055FF0000FF2A00DF0000FF0900DF0000DF0000BF2A4B4B4B00007F
              0055FFAA00FF0900FF2A00DF0000FF0900DF0000DF00007F0000007F0055FFAA
              00FF0900FF0900FF2A00DF0055FFAA007F00E3DFE000007F00AAFF2A00FF0900
              FF0900FF0900FF2A007F00E3DFE0E3DFE000007F00AAFF2A00FF0900FF09AAFF
              2A007F00E3DFE0E3DFE0E3DFE000007F00AAFFAA00FF09AAFF2A007F00E3DFE0
              E3DFE0E3DFE0E3DFE000007F00AAFFAAAAFFAA007F00E3DFE0E3DFE0E3DFE0E3
              DFE0E3DFE000007F00AAFFAA007F00E3DFE0E3DFE0E3DFE0E3DFE0E3DFE0E3DF
              E000E3DFE0007F00E3DFE0E3DFE0E3DFE0E3DFE0E3DFE0E3DFE0E3DFE000}
            Layout = blGlyphRight
            OnClick = btnAvancarPasso02Click
            ExplicitLeft = 809
            ExplicitHeight = 30
          end
          object btnRetornarPasso01: TSpeedButton
            Left = 684
            Top = 1
            Width = 100
            Height = 28
            Align = alRight
            Caption = 'Retornar'
            Flat = True
            Glyph.Data = {
              DA010000424DDA010000000000003600000028000000090000000F0000000100
              180000000000A4010000C30E0000C30E00000000000000000000E3DFE0E3DFE0
              E3DFE0E3DFE0E3DFE0E3DFE04B4B4B4B4B4BE3DFE000E3DFE0E3DFE0E3DFE0E3
              DFE0E3DFE04B4B4B00BF2A00DF00007F0000E3DFE0E3DFE0E3DFE0E3DFE04B4B
              4B00BF2A00DF0000DF00007F0000E3DFE0E3DFE0E3DFE04B4B4B00BF2A00DF00
              00DF0000DF00007F0000E3DFE0E3DFE04B4B4B00BF2A00DF0000DF0000FF0900
              DF00007F0000E3DFE04B4B4B00BF2A00DF0000DF0000FF0900DF0000FF2A007F
              00004B4B4B00BF2A00DF0000DF0000FF0900DF0000FF2A55FF00007F0000007F
              0000DF0000DF0000FF0900DF0000FF2A00FF0955FFAA007F0000E3DFE0007F00
              55FFAA00DF0000FF2A00FF0900FF0955FFAA007F0000E3DFE0E3DFE0007F0000
              FF2A00FF0900FF0900FF09AAFF2A007F0000E3DFE0E3DFE0E3DFE0007F00AAFF
              2A00FF0900FF09AAFF2A007F0000E3DFE0E3DFE0E3DFE0E3DFE0007F00AAFF2A
              00FF09AAFFAA007F0000E3DFE0E3DFE0E3DFE0E3DFE0E3DFE0007F00AAFFAAAA
              FFAA007F0000E3DFE0E3DFE0E3DFE0E3DFE0E3DFE0E3DFE0007F00AAFFAA007F
              0000E3DFE0E3DFE0E3DFE0E3DFE0E3DFE0E3DFE0E3DFE0007F00E3DFE000}
            OnClick = btnRetornarPasso01Click
            ExplicitLeft = 709
            ExplicitHeight = 30
          end
        end
        object vstCursos: TVirtualStringTree
          Left = 1
          Top = 1
          Width = 885
          Height = 428
          Align = alClient
          BevelOuter = bvNone
          BevelKind = bkSoft
          BorderStyle = bsNone
          Colors.BorderColor = clWindowText
          Header.AutoSizeIndex = -1
          Header.Font.Charset = DEFAULT_CHARSET
          Header.Font.Color = clWindowText
          Header.Font.Height = -11
          Header.Font.Name = 'Tahoma'
          Header.Font.Style = []
          Header.MainColumn = 1
          Header.Options = [hoColumnResize, hoDrag, hoShowImages, hoVisible]
          Header.Style = hsFlatButtons
          LineMode = lmBands
          TabOrder = 1
          TreeOptions.AnimationOptions = [toAnimatedToggle]
          TreeOptions.AutoOptions = [toAutoDropExpand, toAutoExpand, toAutoScroll, toAutoSpanColumns, toAutoHideButtons]
          TreeOptions.SelectionOptions = [toFullRowSelect]
          OnExpanding = vstCursosExpanding
          OnGetText = vstCursosGetText
          Columns = <
            item
              Position = 0
            end
            item
              Color = clWindow
              Options = [coAllowClick, coDraggable, coEnabled, coParentBidiMode, coResizable, coShowDropMark, coVisible]
              Position = 1
              Width = 500
              WideText = 'Curso/Turma'
            end
            item
              Position = 2
              Width = 200
              WideText = 'Situa'#231#227'o'
            end
            item
              Position = 3
              Width = 220
              WideText = 'Total de Alunos'
            end>
        end
        object Panel9: TPanel
          Left = 1
          Top = 429
          Width = 885
          Height = 38
          Align = alBottom
          BevelOuter = bvNone
          TabOrder = 2
          object Label10: TLabel
            Left = 50
            Top = 12
            Width = 105
            Height = 14
            Align = alCustom
            Caption = 'Total Geral de Alunos:'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'Arial'
            Font.Style = []
            ParentFont = False
          end
          object lblQtdGeral: TLabel
            Left = 161
            Top = 12
            Width = 6
            Height = 14
            Align = alCustom
            Caption = '0'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'Arial'
            Font.Style = []
            ParentFont = False
          end
        end
      end
    end
    object tsMetodosComparacao: TTabSheet
      Caption = 'Passo 3 - M'#233'todos de compara'#231#227'o'
      ImageIndex = 2
      OnShow = tsMetodosComparacaoShow
      object Panel10: TPanel
        Left = 0
        Top = 0
        Width = 887
        Height = 49
        Align = alTop
        BevelOuter = bvNone
        TabOrder = 0
        object Label12: TLabel
          Left = 20
          Top = 27
          Width = 312
          Height = 14
          Caption = 'Verifique nas abas os modos de compara'#231#227'o a serem utilizados:'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = []
          ParentFont = False
        end
        object Label15: TLabel
          Left = 20
          Top = 5
          Width = 203
          Height = 16
          Caption = 'Passo 3 - M'#233'todos de compara'#231#227'o'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          ParentFont = False
        end
      end
      object pa: TPanel
        Left = 0
        Top = 49
        Width = 887
        Height = 516
        Align = alClient
        BevelOuter = bvNone
        TabOrder = 1
        object pcMetodosBusca: TPageControl
          Left = 0
          Top = 0
          Width = 887
          Height = 480
          ActivePage = tsMetodo1
          Align = alClient
          TabOrder = 0
          OnChange = pcMetodosBuscaChange
          object tsMetodo1: TTabSheet
            Caption = 'M'#233'todo 1'
            object Panel11: TPanel
              Left = 0
              Top = 0
              Width = 879
              Height = 51
              Align = alTop
              BevelOuter = bvNone
              TabOrder = 0
              object Label11: TLabel
                Left = 16
                Top = 30
                Width = 280
                Height = 14
                Caption = 'Os nomes nas duas listas dever'#227'o ser exatamente iguais.'
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clWindowText
                Font.Height = -11
                Font.Name = 'Arial'
                Font.Style = []
                ParentFont = False
              end
              object ckbMetodo1: TCheckBox
                Left = 16
                Top = 7
                Width = 489
                Height = 17
                Caption = '1 - Nomes exatos'
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clWindowText
                Font.Height = -15
                Font.Name = 'Tahoma'
                Font.Style = []
                ParentFont = False
                TabOrder = 0
                OnClick = ckbMetodo1Click
              end
            end
            object Panel13: TPanel
              Left = 0
              Top = 51
              Width = 879
              Height = 25
              Align = alTop
              BevelOuter = bvLowered
              Caption = ' EXEMPLOS DE NOMES EXATOS'
              Color = clBlue
              Font.Charset = ANSI_CHARSET
              Font.Color = clWhite
              Font.Height = -13
              Font.Name = 'Arial'
              Font.Style = [fsBold]
              ParentFont = False
              TabOrder = 1
            end
            object Panel14: TPanel
              Left = 0
              Top = 76
              Width = 879
              Height = 376
              Align = alClient
              BevelOuter = bvNone
              TabOrder = 2
              object Panel15: TPanel
                Left = 0
                Top = 0
                Width = 879
                Height = 25
                Align = alTop
                BevelOuter = bvNone
                TabOrder = 0
                object Label19: TLabel
                  Left = 17
                  Top = 6
                  Width = 43
                  Height = 14
                  Caption = 'Exemplo:'
                  Font.Charset = DEFAULT_CHARSET
                  Font.Color = clWindowText
                  Font.Height = -11
                  Font.Name = 'Arial'
                  Font.Style = []
                  ParentFont = False
                end
              end
              object gridMetodo1: TDBGrid
                Left = 0
                Top = 25
                Width = 879
                Height = 351
                Align = alClient
                DataSource = dtsExemplos
                Options = [dgTitles, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgConfirmDelete, dgCancelOnExit]
                TabOrder = 1
                TitleFont.Charset = DEFAULT_CHARSET
                TitleFont.Color = clWindowText
                TitleFont.Height = -11
                TitleFont.Name = 'Tahoma'
                TitleFont.Style = []
                OnKeyDown = gridMetodo1KeyDown
                Columns = <
                  item
                    Expanded = False
                    FieldName = 'CD_EXEMPLO'
                    Visible = False
                  end
                  item
                    Expanded = False
                    FieldName = 'DS_NOME'
                    Title.Caption = 'Nome'
                    Width = 255
                    Visible = True
                  end
                  item
                    Expanded = False
                    FieldName = 'DS_COMPARAR'
                    Title.Caption = 'Nome compara'#231#227'o'
                    Width = 255
                    Visible = True
                  end
                  item
                    Expanded = False
                    FieldName = 'SN_OK'
                    Title.Caption = 'Compara'#231#227'o'
                    Width = 155
                    Visible = True
                  end
                  item
                    Expanded = False
                    FieldName = 'DS_MODO'
                    Visible = False
                  end
                  item
                    Expanded = False
                    FieldName = 'VL_PERCENTUAL'
                    Visible = False
                  end>
              end
            end
          end
          object tsMetodo2: TTabSheet
            Caption = 'M'#233'todo 2'
            ImageIndex = 1
            object Panel17: TPanel
              Left = 0
              Top = 0
              Width = 879
              Height = 49
              Align = alTop
              BevelOuter = bvNone
              TabOrder = 0
              object Label18: TLabel
                Left = 16
                Top = 30
                Width = 366
                Height = 14
                Caption = 
                  'Apenas o primeiro nome e o '#250'ltimo nome dever'#227'o ser iguais nas du' +
                  'as listas.'
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clWindowText
                Font.Height = -11
                Font.Name = 'Arial'
                Font.Style = []
                ParentFont = False
              end
              object ckbMetodo2: TCheckBox
                Left = 16
                Top = 7
                Width = 489
                Height = 17
                Caption = '2 - Primeiro nome e '#250'ltimo nome iguais'
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clWindowText
                Font.Height = -15
                Font.Name = 'Tahoma'
                Font.Style = []
                ParentFont = False
                TabOrder = 0
                OnClick = ckbMetodo2Click
              end
            end
            object Panel18: TPanel
              Left = 0
              Top = 49
              Width = 879
              Height = 25
              Align = alTop
              BevelOuter = bvLowered
              Caption = 'EXEMPLOS DE PRIMEIRO NOME E '#218'LTIMO NOME IGUAIS'
              Color = clBlue
              Font.Charset = ANSI_CHARSET
              Font.Color = clWhite
              Font.Height = -13
              Font.Name = 'Arial'
              Font.Style = [fsBold]
              ParentFont = False
              TabOrder = 1
            end
            object Panel19: TPanel
              Left = 0
              Top = 74
              Width = 879
              Height = 378
              Align = alClient
              BevelOuter = bvNone
              BorderStyle = bsSingle
              TabOrder = 2
              object Panel20: TPanel
                Left = 0
                Top = 0
                Width = 875
                Height = 27
                Align = alTop
                BevelOuter = bvNone
                TabOrder = 0
                object Label23: TLabel
                  Left = 16
                  Top = 7
                  Width = 43
                  Height = 14
                  Caption = 'Exemplo:'
                  Font.Charset = DEFAULT_CHARSET
                  Font.Color = clWindowText
                  Font.Height = -11
                  Font.Name = 'Arial'
                  Font.Style = []
                  ParentFont = False
                end
              end
              object gridMetodo2: TDBGrid
                Left = 0
                Top = 27
                Width = 875
                Height = 347
                Align = alClient
                DataSource = dtsExemplos
                Options = [dgTitles, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgConfirmDelete, dgCancelOnExit]
                TabOrder = 1
                TitleFont.Charset = DEFAULT_CHARSET
                TitleFont.Color = clWindowText
                TitleFont.Height = -11
                TitleFont.Name = 'Tahoma'
                TitleFont.Style = []
                OnKeyDown = gridMetodo2KeyDown
                Columns = <
                  item
                    Expanded = False
                    FieldName = 'CD_EXEMPLO'
                    Visible = False
                  end
                  item
                    Expanded = False
                    FieldName = 'DS_NOME'
                    Title.Caption = 'Nome'
                    Width = 255
                    Visible = True
                  end
                  item
                    Expanded = False
                    FieldName = 'DS_COMPARAR'
                    Title.Caption = 'Nome compara'#231#227'o'
                    Width = 255
                    Visible = True
                  end
                  item
                    Expanded = False
                    FieldName = 'SN_OK'
                    Title.Caption = 'Compara'#231#227'o'
                    Width = 155
                    Visible = True
                  end
                  item
                    Expanded = False
                    FieldName = 'DS_MODO'
                    Visible = False
                  end
                  item
                    Expanded = False
                    FieldName = 'VL_PERCENTUAL'
                    Visible = False
                  end>
              end
            end
          end
          object tsMetodo3: TTabSheet
            Caption = 'M'#233'todo 3'
            ImageIndex = 2
            object Panel22: TPanel
              Left = 0
              Top = 0
              Width = 879
              Height = 51
              Align = alTop
              BevelOuter = bvNone
              TabOrder = 0
              object Label22: TLabel
                Left = 16
                Top = 30
                Width = 280
                Height = 14
                Caption = 'Apenas as consoantes ser'#227'o verificadas nas duas listas.'
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clWindowText
                Font.Height = -11
                Font.Name = 'Arial'
                Font.Style = []
                ParentFont = False
              end
              object ckbMetodo3: TCheckBox
                Left = 16
                Top = 7
                Width = 489
                Height = 17
                Caption = '3 - Consoantes dos nomes iguais'
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clWindowText
                Font.Height = -15
                Font.Name = 'Tahoma'
                Font.Style = []
                ParentFont = False
                TabOrder = 0
                OnClick = ckbMetodo3Click
              end
            end
            object Panel23: TPanel
              Left = 0
              Top = 51
              Width = 879
              Height = 25
              Align = alTop
              BevelOuter = bvLowered
              Caption = 'EXEMPLOS DE CONSOANTES DOS NOMES IGUAIS'
              Color = clBlue
              Font.Charset = ANSI_CHARSET
              Font.Color = clWhite
              Font.Height = -13
              Font.Name = 'Arial'
              Font.Style = [fsBold]
              ParentFont = False
              TabOrder = 1
            end
            object Panel24: TPanel
              Left = 0
              Top = 76
              Width = 879
              Height = 376
              Align = alClient
              BevelOuter = bvNone
              BorderStyle = bsSingle
              TabOrder = 2
              object Panel25: TPanel
                Left = 0
                Top = 0
                Width = 875
                Height = 25
                Align = alTop
                BevelOuter = bvNone
                TabOrder = 0
                object Label24: TLabel
                  Left = 16
                  Top = 6
                  Width = 43
                  Height = 14
                  Caption = 'Exemplo:'
                  Font.Charset = DEFAULT_CHARSET
                  Font.Color = clWindowText
                  Font.Height = -11
                  Font.Name = 'Arial'
                  Font.Style = []
                  ParentFont = False
                end
              end
              object gridMetodo3: TDBGrid
                Left = 0
                Top = 25
                Width = 875
                Height = 347
                Align = alClient
                DataSource = dtsExemplos
                Options = [dgTitles, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgConfirmDelete, dgCancelOnExit]
                TabOrder = 1
                TitleFont.Charset = DEFAULT_CHARSET
                TitleFont.Color = clWindowText
                TitleFont.Height = -11
                TitleFont.Name = 'Tahoma'
                TitleFont.Style = []
                OnKeyDown = gridMetodo3KeyDown
                Columns = <
                  item
                    Expanded = False
                    FieldName = 'CD_EXEMPLO'
                    Visible = False
                  end
                  item
                    Expanded = False
                    FieldName = 'DS_NOME'
                    Title.Caption = 'Nome'
                    Width = 255
                    Visible = True
                  end
                  item
                    Expanded = False
                    FieldName = 'DS_COMPARAR'
                    Title.Caption = 'Nome compara'#231#227'o'
                    Width = 255
                    Visible = True
                  end
                  item
                    Expanded = False
                    FieldName = 'SN_OK'
                    Title.Caption = 'Compara'#231#227'o'
                    Width = 155
                    Visible = True
                  end
                  item
                    Expanded = False
                    FieldName = 'DS_MODO'
                    Visible = False
                  end
                  item
                    Expanded = False
                    FieldName = 'VL_PERCENTUAL'
                    Visible = False
                  end>
              end
            end
          end
          object tsMetodo4: TTabSheet
            Caption = 'M'#233'todo 4'
            ImageIndex = 3
            object Panel16: TPanel
              Left = 0
              Top = 0
              Width = 879
              Height = 51
              Align = alTop
              BevelOuter = bvNone
              TabOrder = 0
              object Label20: TLabel
                Left = 16
                Top = 30
                Width = 283
                Height = 14
                Caption = 'Um algoritmo ir'#225' testar os nomes baseado na sua fon'#233'tica.'
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clWindowText
                Font.Height = -11
                Font.Name = 'Arial'
                Font.Style = []
                ParentFont = False
              end
              object ckbMetodo4: TCheckBox
                Left = 16
                Top = 7
                Width = 489
                Height = 17
                Caption = '4 -Soundex'
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clWindowText
                Font.Height = -15
                Font.Name = 'Tahoma'
                Font.Style = []
                ParentFont = False
                TabOrder = 0
                OnClick = ckbMetodo4Click
              end
            end
            object Panel27: TPanel
              Left = 0
              Top = 51
              Width = 879
              Height = 25
              Align = alTop
              BevelOuter = bvLowered
              Caption = 'EXEMPLOS DE SOUNDEX'
              Color = clBlue
              Font.Charset = ANSI_CHARSET
              Font.Color = clWhite
              Font.Height = -13
              Font.Name = 'Arial'
              Font.Style = [fsBold]
              ParentFont = False
              TabOrder = 1
            end
            object Panel28: TPanel
              Left = 0
              Top = 76
              Width = 879
              Height = 376
              Align = alClient
              BevelOuter = bvNone
              BorderStyle = bsSingle
              TabOrder = 2
              object Panel29: TPanel
                Left = 0
                Top = 0
                Width = 875
                Height = 25
                Align = alTop
                BevelOuter = bvNone
                TabOrder = 0
                object Label21: TLabel
                  Left = 16
                  Top = 6
                  Width = 43
                  Height = 14
                  Caption = 'Exemplo:'
                  Font.Charset = DEFAULT_CHARSET
                  Font.Color = clWindowText
                  Font.Height = -11
                  Font.Name = 'Arial'
                  Font.Style = []
                  ParentFont = False
                end
              end
              object gridMetodo4: TDBGrid
                Left = 0
                Top = 25
                Width = 875
                Height = 347
                Align = alClient
                DataSource = dtsExemplos
                Options = [dgTitles, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgConfirmDelete, dgCancelOnExit]
                TabOrder = 1
                TitleFont.Charset = DEFAULT_CHARSET
                TitleFont.Color = clWindowText
                TitleFont.Height = -11
                TitleFont.Name = 'Tahoma'
                TitleFont.Style = []
                OnKeyDown = gridMetodo4KeyDown
                Columns = <
                  item
                    Expanded = False
                    FieldName = 'CD_EXEMPLO'
                    Visible = False
                  end
                  item
                    Expanded = False
                    FieldName = 'DS_NOME'
                    Title.Caption = 'Nome'
                    Width = 255
                    Visible = True
                  end
                  item
                    Expanded = False
                    FieldName = 'DS_COMPARAR'
                    Title.Caption = 'Nome compara'#231#227'o'
                    Width = 255
                    Visible = True
                  end
                  item
                    Expanded = False
                    FieldName = 'SN_OK'
                    Title.Caption = 'Compara'#231#227'o'
                    Width = 155
                    Visible = True
                  end
                  item
                    Expanded = False
                    FieldName = 'DS_MODO'
                    Visible = False
                  end
                  item
                    Expanded = False
                    FieldName = 'VL_PERCENTUAL'
                    Visible = False
                  end>
              end
            end
          end
        end
        object Panel31: TPanel
          Left = 0
          Top = 480
          Width = 887
          Height = 36
          Align = alBottom
          BevelOuter = bvNone
          TabOrder = 1
          object Label25: TLabel
            Left = 24
            Top = 20
            Width = 433
            Height = 14
            Caption = 
              'Tempo de processamento ir'#225' variar de acordo com a sua velocidade' +
              ' de conex'#227'o de rede.'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'Arial'
            Font.Style = []
            ParentFont = False
          end
          object lblQtdPessoas: TLabel
            Left = 24
            Top = 5
            Width = 116
            Height = 14
            Caption = 'Quantidade de registros'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'Arial'
            Font.Style = []
            ParentFont = False
          end
        end
      end
      object Panel12: TPanel
        Left = 0
        Top = 565
        Width = 887
        Height = 30
        Align = alBottom
        BevelOuter = bvNone
        TabOrder = 2
        object btnAvancarPasso03: TSpeedButton
          Left = 787
          Top = 0
          Width = 100
          Height = 30
          Align = alRight
          Caption = 'Avan'#231'ar'
          Flat = True
          Glyph.Data = {
            DA010000424DDA010000000000003600000028000000090000000F0000000100
            180000000000A4010000C30E0000C30E00000000000000000000E3DFE04B4B4B
            4B4B4BE3DFE0E3DFE0E3DFE0E3DFE0E3DFE0E3DFE000007F0000DF0000BF2A4B
            4B4BE3DFE0E3DFE0E3DFE0E3DFE0E3DFE000007F0000DF0000DF0000BF2A4B4B
            4BE3DFE0E3DFE0E3DFE0E3DFE000007F0000DF0000DF0000DF0000BF2A4B4B4B
            E3DFE0E3DFE0E3DFE000007F0000DF0000FF0900DF0000DF0000BF2A4B4B4BE3
            DFE0E3DFE000007F0000FF2A00DF0000FF0900DF0000DF0000BF2A4B4B4BE3DF
            E000007F0055FF0000FF2A00DF0000FF0900DF0000DF0000BF2A4B4B4B00007F
            0055FFAA00FF0900FF2A00DF0000FF0900DF0000DF00007F0000007F0055FFAA
            00FF0900FF0900FF2A00DF0055FFAA007F00E3DFE000007F00AAFF2A00FF0900
            FF0900FF0900FF2A007F00E3DFE0E3DFE000007F00AAFF2A00FF0900FF09AAFF
            2A007F00E3DFE0E3DFE0E3DFE000007F00AAFFAA00FF09AAFF2A007F00E3DFE0
            E3DFE0E3DFE0E3DFE000007F00AAFFAAAAFFAA007F00E3DFE0E3DFE0E3DFE0E3
            DFE0E3DFE000007F00AAFFAA007F00E3DFE0E3DFE0E3DFE0E3DFE0E3DFE0E3DF
            E000E3DFE0007F00E3DFE0E3DFE0E3DFE0E3DFE0E3DFE0E3DFE0E3DFE000}
          Layout = blGlyphRight
          OnClick = btnAvancarPasso03Click
          ExplicitLeft = 795
          ExplicitTop = 6
          ExplicitHeight = 28
        end
        object btnRetornarPasso02: TSpeedButton
          Left = 687
          Top = 0
          Width = 100
          Height = 30
          Align = alRight
          Caption = 'Retornar'
          Flat = True
          Glyph.Data = {
            DA010000424DDA010000000000003600000028000000090000000F0000000100
            180000000000A4010000C30E0000C30E00000000000000000000E3DFE0E3DFE0
            E3DFE0E3DFE0E3DFE0E3DFE04B4B4B4B4B4BE3DFE000E3DFE0E3DFE0E3DFE0E3
            DFE0E3DFE04B4B4B00BF2A00DF00007F0000E3DFE0E3DFE0E3DFE0E3DFE04B4B
            4B00BF2A00DF0000DF00007F0000E3DFE0E3DFE0E3DFE04B4B4B00BF2A00DF00
            00DF0000DF00007F0000E3DFE0E3DFE04B4B4B00BF2A00DF0000DF0000FF0900
            DF00007F0000E3DFE04B4B4B00BF2A00DF0000DF0000FF0900DF0000FF2A007F
            00004B4B4B00BF2A00DF0000DF0000FF0900DF0000FF2A55FF00007F0000007F
            0000DF0000DF0000FF0900DF0000FF2A00FF0955FFAA007F0000E3DFE0007F00
            55FFAA00DF0000FF2A00FF0900FF0955FFAA007F0000E3DFE0E3DFE0007F0000
            FF2A00FF0900FF0900FF09AAFF2A007F0000E3DFE0E3DFE0E3DFE0007F00AAFF
            2A00FF0900FF09AAFF2A007F0000E3DFE0E3DFE0E3DFE0E3DFE0007F00AAFF2A
            00FF09AAFFAA007F0000E3DFE0E3DFE0E3DFE0E3DFE0E3DFE0007F00AAFFAAAA
            FFAA007F0000E3DFE0E3DFE0E3DFE0E3DFE0E3DFE0E3DFE0007F00AAFFAA007F
            0000E3DFE0E3DFE0E3DFE0E3DFE0E3DFE0E3DFE0E3DFE0007F00E3DFE000}
          OnClick = btnRetornarPasso02Click
          ExplicitLeft = 712
          ExplicitTop = 6
        end
      end
    end
    object tsConfirmarResultados: TTabSheet
      Caption = 'Passo 4 - Confirmar resultados'
      ImageIndex = 3
      OnShow = tsConfirmarResultadosShow
      object Panel32: TPanel
        Left = 0
        Top = 0
        Width = 887
        Height = 193
        Align = alTop
        BevelOuter = bvNone
        TabOrder = 0
        object Label26: TLabel
          Left = 24
          Top = 5
          Width = 179
          Height = 16
          Caption = 'Passo 4 - Confirmar resultados'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          ParentFont = False
        end
        object Label17: TLabel
          Left = 24
          Top = 27
          Width = 298
          Height = 14
          Caption = 'Nesse processo todos os classificados j'#225' foram selecionado.'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = []
          ParentFont = False
        end
        object GroupBox1: TGroupBox
          Left = 24
          Top = 47
          Width = 849
          Height = 136
          Caption = '  Filtros  '
          TabOrder = 0
          object Label27: TLabel
            Left = 33
            Top = 24
            Width = 38
            Height = 16
            Caption = 'Nome:'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -13
            Font.Name = 'Arial'
            Font.Style = []
            ParentFont = False
          end
          object Label28: TLabel
            Left = 24
            Top = 62
            Width = 47
            Height = 16
            Caption = 'Met'#243'do:'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -13
            Font.Name = 'Arial'
            Font.Style = []
            ParentFont = False
          end
          object txtNomeUnimestre: TEdit
            Left = 77
            Top = 21
            Width = 285
            Height = 24
            Font.Charset = ANSI_CHARSET
            Font.Color = clWindowText
            Font.Height = -13
            Font.Name = 'Arial'
            Font.Style = []
            ParentFont = False
            TabOrder = 0
          end
          object cbMetodo: TComboBox
            Left = 77
            Top = 61
            Width = 285
            Height = 21
            Style = csDropDownList
            ItemHeight = 13
            TabOrder = 1
          end
          object btnFiltrar: TBitBtn
            Left = 93
            Top = 97
            Width = 100
            Height = 25
            Caption = 'Filtrar'
            TabOrder = 2
            OnClick = btnFiltrarClick
            Glyph.Data = {
              76010000424D7601000000000000760000002800000020000000100000000100
              04000000000000010000130B0000130B00001000000000000000000000000000
              800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
              FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333333333333
              333333333333333333FF33333333333330003FF3FFFFF3333777003000003333
              300077F777773F333777E00BFBFB033333337773333F7F33333FE0BFBF000333
              330077F3337773F33377E0FBFBFBF033330077F3333FF7FFF377E0BFBF000000
              333377F3337777773F3FE0FBFBFBFBFB039977F33FFFFFFF7377E0BF00000000
              339977FF777777773377000BFB03333333337773FF733333333F333000333333
              3300333777333333337733333333333333003333333333333377333333333333
              333333333333333333FF33333333333330003333333333333777333333333333
              3000333333333333377733333333333333333333333333333333}
            NumGlyphs = 2
          end
          object btnLimparFiltros: TBitBtn
            Left = 199
            Top = 97
            Width = 100
            Height = 25
            Caption = 'Limpar Filtros'
            TabOrder = 3
            OnClick = btnLimparFiltrosClick
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
          end
        end
      end
      object Panel33: TPanel
        Left = 0
        Top = 193
        Width = 887
        Height = 402
        Align = alClient
        TabOrder = 1
        object Panel34: TPanel
          Left = 1
          Top = 26
          Width = 885
          Height = 28
          Align = alTop
          BevelOuter = bvNone
          TabOrder = 0
          object Label29: TLabel
            Left = 33
            Top = 7
            Width = 471
            Height = 14
            Caption = 
              'Os candidatos selecionados ser'#227'o enviados para o relat'#243'rio final' +
              '. Confira os nomes comparados.'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'Arial'
            Font.Style = []
            ParentFont = False
          end
        end
        object gridPasso4: TDBGrid
          Left = 1
          Top = 54
          Width = 885
          Height = 277
          Align = alClient
          DataSource = dtsFiltrarResultados
          Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgAlwaysShowSelection, dgConfirmDelete, dgCancelOnExit]
          ParentShowHint = False
          ReadOnly = True
          ShowHint = False
          TabOrder = 1
          TitleFont.Charset = DEFAULT_CHARSET
          TitleFont.Color = clWindowText
          TitleFont.Height = -11
          TitleFont.Name = 'Tahoma'
          TitleFont.Style = []
          OnCellClick = gridPasso4CellClick
          OnDrawColumnCell = gridPasso4DrawColumnCell
          OnKeyDown = gridPasso4KeyDown
          OnTitleClick = gridPasso4TitleClick
          Columns = <
            item
              Expanded = False
              FieldName = 'SELECAO'
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'NOME_IMPORTADA'
              Title.Caption = 'Nome Importado'
              Width = 300
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'NOME_UNIMESTRE'
              Title.Caption = 'Nome Aluno'
              Width = 300
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'METODO_BUSCA'
              Title.Caption = 'M'#233'todo'
              Width = 200
              Visible = True
            end>
        end
        object Panel36: TPanel
          Left = 1
          Top = 331
          Width = 885
          Height = 70
          Align = alBottom
          TabOrder = 2
          object Label30: TLabel
            Left = 27
            Top = 8
            Width = 157
            Height = 14
            Align = alCustom
            Caption = 'Total de registros - Encontrados:'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'Arial'
            Font.Style = []
            ParentFont = False
          end
          object lblTotalRegistrosEncontrados: TLabel
            Left = 190
            Top = 8
            Width = 6
            Height = 14
            Align = alCustom
            Caption = '0'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'Arial'
            Font.Style = []
            ParentFont = False
          end
          object Label31: TLabel
            Left = 65
            Top = 28
            Width = 119
            Height = 14
            Align = alCustom
            Caption = 'Total de registros - Filtro:'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'Arial'
            Font.Style = []
            ParentFont = False
          end
          object lblTotalRegistrosFiltro: TLabel
            Left = 190
            Top = 28
            Width = 6
            Height = 14
            Align = alCustom
            Caption = '0'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'Arial'
            Font.Style = []
            ParentFont = False
          end
          object lblTotalRegistrosMarcados: TLabel
            Left = 190
            Top = 48
            Width = 6
            Height = 14
            Align = alCustom
            Caption = '0'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'Arial'
            Font.Style = []
            ParentFont = False
          end
          object Label32: TLabel
            Left = 93
            Top = 48
            Width = 91
            Height = 14
            Align = alCustom
            Caption = 'Total de Marcados:'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'Arial'
            Font.Style = []
            ParentFont = False
          end
          object Panel35: TPanel
            Left = 677
            Top = 1
            Width = 207
            Height = 68
            Align = alRight
            BevelOuter = bvNone
            TabOrder = 0
            object btnAvancarPassoFinal: TSpeedButton
              Left = 104
              Top = 35
              Width = 100
              Height = 30
              Align = alCustom
              Caption = 'Concluir'
              Flat = True
              Glyph.Data = {
                DA010000424DDA010000000000003600000028000000090000000F0000000100
                180000000000A4010000C30E0000C30E00000000000000000000E3DFE04B4B4B
                4B4B4BE3DFE0E3DFE0E3DFE0E3DFE0E3DFE0E3DFE000007F0000DF0000BF2A4B
                4B4BE3DFE0E3DFE0E3DFE0E3DFE0E3DFE000007F0000DF0000DF0000BF2A4B4B
                4BE3DFE0E3DFE0E3DFE0E3DFE000007F0000DF0000DF0000DF0000BF2A4B4B4B
                E3DFE0E3DFE0E3DFE000007F0000DF0000FF0900DF0000DF0000BF2A4B4B4BE3
                DFE0E3DFE000007F0000FF2A00DF0000FF0900DF0000DF0000BF2A4B4B4BE3DF
                E000007F0055FF0000FF2A00DF0000FF0900DF0000DF0000BF2A4B4B4B00007F
                0055FFAA00FF0900FF2A00DF0000FF0900DF0000DF00007F0000007F0055FFAA
                00FF0900FF0900FF2A00DF0055FFAA007F00E3DFE000007F00AAFF2A00FF0900
                FF0900FF0900FF2A007F00E3DFE0E3DFE000007F00AAFF2A00FF0900FF09AAFF
                2A007F00E3DFE0E3DFE0E3DFE000007F00AAFFAA00FF09AAFF2A007F00E3DFE0
                E3DFE0E3DFE0E3DFE000007F00AAFFAAAAFFAA007F00E3DFE0E3DFE0E3DFE0E3
                DFE0E3DFE000007F00AAFFAA007F00E3DFE0E3DFE0E3DFE0E3DFE0E3DFE0E3DF
                E000E3DFE0007F00E3DFE0E3DFE0E3DFE0E3DFE0E3DFE0E3DFE0E3DFE000}
              Layout = blGlyphRight
              OnClick = btnAvancarPassoFinalClick
            end
            object btnVoltarPasso03: TSpeedButton
              Left = -2
              Top = 35
              Width = 100
              Height = 30
              Align = alCustom
              Caption = 'Retornar'
              Flat = True
              Glyph.Data = {
                DA010000424DDA010000000000003600000028000000090000000F0000000100
                180000000000A4010000C30E0000C30E00000000000000000000E3DFE0E3DFE0
                E3DFE0E3DFE0E3DFE0E3DFE04B4B4B4B4B4BE3DFE000E3DFE0E3DFE0E3DFE0E3
                DFE0E3DFE04B4B4B00BF2A00DF00007F0000E3DFE0E3DFE0E3DFE0E3DFE04B4B
                4B00BF2A00DF0000DF00007F0000E3DFE0E3DFE0E3DFE04B4B4B00BF2A00DF00
                00DF0000DF00007F0000E3DFE0E3DFE04B4B4B00BF2A00DF0000DF0000FF0900
                DF00007F0000E3DFE04B4B4B00BF2A00DF0000DF0000FF0900DF0000FF2A007F
                00004B4B4B00BF2A00DF0000DF0000FF0900DF0000FF2A55FF00007F0000007F
                0000DF0000DF0000FF0900DF0000FF2A00FF0955FFAA007F0000E3DFE0007F00
                55FFAA00DF0000FF2A00FF0900FF0955FFAA007F0000E3DFE0E3DFE0007F0000
                FF2A00FF0900FF0900FF09AAFF2A007F0000E3DFE0E3DFE0E3DFE0007F00AAFF
                2A00FF0900FF09AAFF2A007F0000E3DFE0E3DFE0E3DFE0E3DFE0007F00AAFF2A
                00FF09AAFFAA007F0000E3DFE0E3DFE0E3DFE0E3DFE0E3DFE0007F00AAFFAAAA
                FFAA007F0000E3DFE0E3DFE0E3DFE0E3DFE0E3DFE0E3DFE0007F00AAFFAA007F
                0000E3DFE0E3DFE0E3DFE0E3DFE0E3DFE0E3DFE0E3DFE0007F00E3DFE000}
              OnClick = btnVoltarPasso03Click
            end
          end
        end
        object Panel37: TPanel
          Left = 1
          Top = 1
          Width = 885
          Height = 25
          Align = alTop
          BevelOuter = bvLowered
          Caption = 'RESULTADOS DO FILTRO'
          Color = clBlue
          Font.Charset = ANSI_CHARSET
          Font.Color = clWhite
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          ParentFont = False
          TabOrder = 3
        end
      end
    end
    object tsPassoFinal: TTabSheet
      Caption = 'Passo Final'
      ImageIndex = 4
      OnShow = tsPassoFinalShow
      object Panel21: TPanel
        Left = 0
        Top = 0
        Width = 887
        Height = 147
        Align = alTop
        BevelOuter = bvNone
        TabOrder = 0
        object Label33: TLabel
          Left = 24
          Top = 5
          Width = 62
          Height = 16
          Caption = 'Resultado:'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          ParentFont = False
        end
        object GroupBox2: TGroupBox
          Left = 24
          Top = 27
          Width = 849
          Height = 102
          Caption = '  Filtros  '
          TabOrder = 0
          object Label34: TLabel
            Left = 33
            Top = 24
            Width = 38
            Height = 16
            Caption = 'Nome:'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -13
            Font.Name = 'Arial'
            Font.Style = []
            ParentFont = False
          end
          object Label35: TLabel
            Left = 413
            Top = 24
            Width = 38
            Height = 16
            Caption = 'Curso:'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -13
            Font.Name = 'Arial'
            Font.Style = []
            ParentFont = False
          end
          object btnLimparCurso: TSpeedButton
            Left = 777
            Top = 21
            Width = 33
            Height = 24
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
            OnClick = btnLimparCursoClick
          end
          object btnCurso: TSpeedButton
            Left = 738
            Top = 21
            Width = 33
            Height = 25
            Hint = 'Selecionar uma disciplina Espec'#237'fica'
            AllowAllUp = True
            GroupIndex = 1
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
            OnClick = btnCursoClick
          end
          object txtNomeFinal: TEdit
            Left = 77
            Top = 21
            Width = 276
            Height = 24
            Font.Charset = ANSI_CHARSET
            Font.Color = clWindowText
            Font.Height = -13
            Font.Name = 'Arial'
            Font.Style = []
            ParentFont = False
            TabOrder = 0
          end
          object btnFiltrarFinal: TBitBtn
            Left = 33
            Top = 63
            Width = 100
            Height = 25
            Caption = 'Filtrar'
            TabOrder = 2
            OnClick = btnFiltrarFinalClick
            Glyph.Data = {
              76010000424D7601000000000000760000002800000020000000100000000100
              04000000000000010000130B0000130B00001000000000000000000000000000
              800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
              FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333333333333
              333333333333333333FF33333333333330003FF3FFFFF3333777003000003333
              300077F777773F333777E00BFBFB033333337773333F7F33333FE0BFBF000333
              330077F3337773F33377E0FBFBFBF033330077F3333FF7FFF377E0BFBF000000
              333377F3337777773F3FE0FBFBFBFBFB039977F33FFFFFFF7377E0BF00000000
              339977FF777777773377000BFB03333333337773FF733333333F333000333333
              3300333777333333337733333333333333003333333333333377333333333333
              333333333333333333FF33333333333330003333333333333777333333333333
              3000333333333333377733333333333333333333333333333333}
            NumGlyphs = 2
          end
          object btnLimparFiltroFinal: TBitBtn
            Left = 139
            Top = 63
            Width = 100
            Height = 25
            Caption = 'Limpar Filtros'
            TabOrder = 3
            OnClick = btnLimparFiltroFinalClick
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
          end
          object txtCursoFinal: TEdit
            Left = 457
            Top = 21
            Width = 276
            Height = 24
            Font.Charset = ANSI_CHARSET
            Font.Color = clWindowText
            Font.Height = -13
            Font.Name = 'Arial'
            Font.Style = []
            ParentFont = False
            TabOrder = 1
          end
        end
      end
      object Panel26: TPanel
        Left = 0
        Top = 147
        Width = 887
        Height = 389
        Align = alClient
        BevelOuter = bvNone
        TabOrder = 1
        object gridPassoFinal: TDBGrid
          Left = 0
          Top = 0
          Width = 887
          Height = 389
          TabStop = False
          Align = alClient
          DataSource = dtsFiltroFinal
          Options = [dgTitles, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgConfirmDelete, dgCancelOnExit, dgMultiSelect]
          TabOrder = 0
          TitleFont.Charset = DEFAULT_CHARSET
          TitleFont.Color = clWindowText
          TitleFont.Height = -11
          TitleFont.Name = 'Tahoma'
          TitleFont.Style = []
          OnKeyDown = gridPassoFinalKeyDown
          OnTitleClick = gridPassoFinalTitleClick
          Columns = <
            item
              Expanded = False
              FieldName = 'DS_NOME'
              Title.Caption = ' Nome'
              Width = 280
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'DS_CLASSIFICACAO'
              Title.Caption = ' Classifica'#231#227'o'
              Width = 80
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'DS_CURSO'
              Title.Caption = ' Curso'
              Width = 250
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'DS_TURMA'
              Width = 190
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'DS_PROPOSITO_IMPORTACAO'
              Title.Caption = ' Prop'#243'sito da Importa'#231#227'o'
              Width = 220
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'DS_EMAIL'
              Width = 260
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'DS_TELEFONE'
              Width = 180
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'CD_PESSOA'
              Width = 85
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'NR_ANOSEMESTRE'
              Width = 85
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'dt_nascimento'
              Width = 120
              Visible = True
            end>
        end
      end
      object Panel30: TPanel
        Left = 0
        Top = 536
        Width = 887
        Height = 59
        Align = alBottom
        BevelOuter = bvNone
        TabOrder = 2
        object Label36: TLabel
          Left = 24
          Top = 8
          Width = 86
          Height = 14
          Align = alCustom
          Caption = 'Total de registros:'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = []
          ParentFont = False
        end
        object lblQtdTotalFiltro: TLabel
          Left = 116
          Top = 8
          Width = 6
          Height = 14
          Align = alCustom
          Caption = '0'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = []
          ParentFont = False
        end
        object toolPassoFinal: TToolBar
          Left = 0
          Top = 31
          Width = 887
          Height = 28
          Align = alBottom
          ButtonWidth = 186
          Caption = 'toolPassoFinal'
          EdgeBorders = [ebTop, ebBottom]
          Images = ImageList2
          List = True
          ShowCaptions = True
          TabOrder = 0
          Wrapable = False
          object sbSelecionarColuna: TSpeedButton
            Left = 0
            Top = 0
            Width = 25
            Height = 22
            Hint = 'Selecionar Colunas'
            Flat = True
            Glyph.Data = {
              36030000424D3603000000000000360000002800000010000000100000000100
              1800000000000003000000000000000000000000000000000000FFFFFFFFFFFF
              FFFFFFDFDFDFDFDFDFBFBFBFBFBFBFBFBFBFBFBFBFA0A0A0CFCFCFDFDFDFDFDF
              DFDFDFDFFFFFFFFFFFFFFFFFFFDFDFDFDFDFDFBFBFBF70707020202000000000
              0000000000505050909090A0A0A0CFCFCFDFDFDFEFEFEFEFEFEFDFDFDFCFCFCF
              808080404040000000505050606060A0A0A0A0A0A0A0A0A04040405050509090
              90B0B0B0DFDFDFEFEFEFBFBFBF505050202020808080A0A0806060608F8F6F6F
              6F6F6060607F7F3F606060606040404040A0A0A0B0B0B0DFDFDF9F9F9F606020
              9090505050306F6F6FBFBFBF8F6F30400000400000BF9F9FDFDFDF8F8F6F7050
              50402020A0A0A0B0B0B09F9F9F808060303030C0C0C0B0B0B0BF9F20DF7F00FF
              3F00FF00009F0000CFCFCFDFDFDFDFDFDF907050402020A0A0A0404020602020
              A080609030307F7F40DFBF00BF0000000000BF0000FF0000A06060CFCFCFBFBF
              9F806000402000808080808020202000600000804000804020FF7F00BF000000
              00009F3F3FDF5F3F705030B0B090804000606040303030BFBFBFA0A060606040
              2020006000008060009F2000FF0000FF0000FF0000DFDF3F8040008020007070
              702020209F9F9FFFFFFF909030A0A080B0B09020200000000040000040000040
              0000400000400000202020A0A0802020209F9F9FFFFFFFFFFFFFCFCFCFA0A060
              A0A080A0A0A0A0A0A08080606F6F6F6F6F6F8F8F6FA0A0A0A0A0A02020209F9F
              9FFFFFFFFFFFFFFFFFFF7F7F3FBFBF9FA0A080909070909070AFAF8F80806080
              8080808060808060606060DFDFDFFFFFFFFFFFFFDFDFDFC0C0C0303030202000
              707030909070A0A0A0909090909070A0A060CFCFCFDFDFDFFFFFFFFFFFFFDFDF
              DF808060705030CFAFAFEFEFEF303030000000202000404020A0A060B0B090DF
              DFDFDFDFDFDFDFDFBFBF9F606060202000303030EFEFEFFFFFFFFFFFFFFFFFFF
              AFAFAF303030000000000000000000000000000000000000000000303030AFAF
              AFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFAFAFAF7F7F7F7F7F7F7F
              7F7F7F7F7F7F7F7FEFEFEFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF}
            Transparent = False
            OnClick = sbSelecionarColunaClick
          end
          object btnImprimir: TToolButton
            Left = 25
            Top = 0
            AutoSize = True
            Caption = 'F7 Imprimir'
            ImageIndex = 6
            OnClick = btnImprimirClick
          end
          object separador2: TToolButton
            Left = 109
            Top = 0
            Width = 8
            ImageIndex = 8
            Style = tbsSeparator
          end
          object btnCopiarSelecionados: TToolButton
            Left = 117
            Top = 0
            AutoSize = True
            Caption = 'Copiar Informa'#231#245'es Selecionadas'
            ImageIndex = 10
            OnClick = btnCopiarSelecionadosClick
          end
          object separador4: TToolButton
            Left = 307
            Top = 0
            Width = 8
            Caption = 'separador4'
            ImageIndex = 8
            Style = tbsSeparator
          end
          object separador1: TToolButton
            Left = 315
            Top = 0
            AutoSize = True
            Caption = 'Copiar Todas as Informa'#231#245'es'
            ImageIndex = 10
            OnClick = separador1Click
          end
          object separador3: TToolButton
            Left = 486
            Top = 0
            Width = 7
            Caption = 'separador3'
            ImageIndex = 8
            Style = tbsSeparator
          end
          object btFechar: TToolButton
            Left = 493
            Top = 0
            AutoSize = True
            Caption = 'F12 Fechar'
            ImageIndex = 7
            OnClick = btFecharClick
          end
        end
      end
    end
  end
  object dtPessoasImportadas: TDataSource
    DataSet = qryPessoasImportadas
    Left = 42
    Top = 456
  end
  object qryPessoasImportadas: TUMZQuery
    Connection = DM.db
    SQL.Strings = (
      'SELECT '
      '   cd_importada,'
      '   cd_pessoa_unimestre,'
      '   ds_nome,'
      '   ds_curso,'
      '   nr_classificacao,ds_proposito '
      'FROM                       '
      '    pessoas_importadas')
    Params = <>
    Left = 42
    Top = 424
    object qryPessoasImportadasCD_PESSOA_UNIMESTRE: TIntegerField
      FieldName = 'CD_PESSOA_UNIMESTRE'
    end
    object qryPessoasImportadasDS_NOME: TStringField
      FieldName = 'DS_NOME'
      Size = 260
    end
    object qryPessoasImportadasDS_CURSO: TStringField
      FieldName = 'DS_CURSO'
      Size = 260
    end
    object qryPessoasImportadasDS_PROPOSITO: TStringField
      FieldName = 'DS_PROPOSITO'
    end
    object qryPessoasImportadasNR_CLASSIFICACAO: TIntegerField
      FieldName = 'NR_CLASSIFICACAO'
    end
    object qryPessoasImportadasCD_IMPORTADA: TIntegerField
      FieldName = 'CD_IMPORTADA'
    end
  end
  object odArquivoTXT: TOpenDialog
    Filter = 'Arquivo de texto sem formata'#231#227'o (TXT)|*.txt'
    Title = 'Selecione o arquivo contendo a lista de classificados'
    Left = 12
    Top = 425
  end
  object ilBotoes: TImageList
    Left = 12
    Top = 456
    Bitmap = {
      494C010103000400040010001000FFFFFFFFFF10FFFFFFFFFFFFFFFF424D3600
      0000000000003600000028000000400000001000000001002000000000000010
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000004B4B4B004B4B4B00000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000D9A77D00A376
      0000A3760000A3760000D9A77D000000000000000000D9A77D00A3760000A376
      0000A3760000D9A77D0000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000007F000000DF000000BF2A004B4B4B000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000A3760000D9A7
      7D00CB8C4400CB8C4400A37600000000000000000000A3760000FF9F7F00CB8C
      4400CB8C4400A376000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000007F000000DF000000DF000000BF2A004B4B4B0000000000000000000000
      0000000000000000000000000000000000000000000000000000AA7F5500FF9F
      7F00D9A77D00CB8C4400A37600000000000000000000AA7F5500FF9F7F00D9A7
      7D00CB8C4400A376000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000FFFFFF00000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000007F000000DF000000DF000000DF000000BF2A004B4B4B00000000000000
      0000000000000000000000000000000000000000000000000000AA7F5500FFFF
      CC00D9A77D00CB8C4400A37600000000000000000000AA7F5500FFFFCC00D9A7
      7D00CB8C4400A376000000000000000000000000000000000000000000000000
      000000000000FFFFFF0000000000000000000000000000000000000000000000
      000000000000FFFFFF0000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000007F000000DF000000FF090000DF000000DF000000BF2A004B4B4B000000
      0000000000000000000000000000000000000000000000000000AA7F5500FFFF
      CC00D9A77D00CB8C4400A37600000000000000000000AA7F5500FFFFCC00D9A7
      7D00CB8C4400A376000000000000000000000000000000000000000000000000
      000000000000FFFFFF0000000000000000000000000000000000000000000000
      000000000000FFFFFF0000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000007F000000FF2A0000DF000000FF090000DF000000DF000000BF2A004B4B
      4B00000000000000000000000000000000000000000000000000AA7F5500FFFF
      CC00D9A77D00CB8C4400A37600000000000000000000AA7F5500FFFFCC00D9A7
      7D00CB8C4400A376000000000000000000000000000000000000000000000000
      00000000000000000000FFFFFF00000000000000000000000000000000000000
      0000FFFFFF000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000007F000055FF000000FF2A0000DF000000FF090000DF000000DF000000BF
      2A004B4B4B000000000000000000000000000000000000000000AA7F5500FFFF
      CC00D9A77D00CB8C4400A37600000000000000000000AA7F5500FFFFCC00D9A7
      7D00CB8C4400A376000000000000000000000000000000000000000000000000
      0000000000000000000000000000FFFFFF00000000000000000000000000FFFF
      FF00000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000007F000055FFAA0000FF090000FF2A0000DF000000FF090000DF000000DF
      0000007F00000000000000000000000000000000000000000000AA7F5500FFFF
      CC00D9A77D00CB8C4400A37600000000000000000000AA7F5500FFFFCC00D9A7
      7D00CB8C4400A376000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000FFFFFF000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000007F000055FFAA0000FF090000FF090000FF2A0000DF000055FFAA00007F
      0000000000000000000000000000000000000000000000000000AA7F5500FFFF
      CC00D9A77D00CB8C4400A37600000000000000000000AA7F5500FFFFCC00D9A7
      7D00CB8C4400A376000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000FFFFFF00000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000007F0000AAFF2A0000FF090000FF090000FF090000FF2A00007F00000000
      0000000000000000000000000000000000000000000000000000AA7F5500FFFF
      CC00D9A77D00CB8C4400A37600000000000000000000AA7F5500FFFFCC00D9A7
      7D00CB8C4400A376000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000FFFFFF000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000007F0000AAFF2A0000FF090000FF0900AAFF2A00007F0000000000000000
      0000000000000000000000000000000000000000000000000000AA7F5500FFFF
      CC00D9A77D00CB8C4400A37600000000000000000000AA7F5500FFFFCC00D9A7
      7D00CB8C4400A376000000000000000000000000000000000000000000000000
      0000000000000000000000000000FFFFFF000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000007F0000AAFFAA0000FF0900AAFF2A00007F000000000000000000000000
      0000000000000000000000000000000000000000000000000000AA7F5500FFFF
      CC00D9A77D00CB8C4400A37600000000000000000000AA7F5500FFFFCC00D9A7
      7D00CB8C4400A376000000000000000000000000000000000000000000000000
      00000000000000000000FFFFFF00000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000007F0000AAFFAA00AAFFAA00007F00000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000AA7F5500FFFF
      CC00D9A77D00CB8C4400A37600000000000000000000AA7F5500FFFFCC00D9A7
      7D00CB8C4400A376000000000000000000000000000000000000000000000000
      000000000000FFFFFF0000000000000000000000000000000000000000000000
      000000000000FFFFFF0000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000007F0000AAFFAA00007F0000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000AA7F5500FFFF
      CC00D9A77D00CB8C4400A37600000000000000000000AA7F5500FFFFCC00D9A7
      7D00CB8C4400A37600000000000000000000000000000000000000000000FFFF
      FF00000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000007F000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000AA7F5500FFFF
      CC00FFFFCC00D9A77D00A37600000000000000000000AA7F5500FFFFCC00FFFF
      CC00FF9F7F00A376000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000D9A77D00AA7F
      5500AA7F5500AA7F5500D9A77D000000000000000000D9A77D00AA7F5500AA7F
      5500AA7F5500D9A77D0000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000424D3E000000000000003E000000
      2800000040000000100000000100010000000000800000000000000000000000
      000000000000000000000000FFFFFF00F9FFC183FFFF0000F0FFC183FFF90000
      F07FC183FFF90000F03FC183E3F30000F01FC183E3F30000F00FC183E1C70000
      F007C183F08F0000F007C183F81F0000F00FC183FC3F0000F01FC183F81F0000
      F03FC183F09F0000F07FC183E1C70000F0FFC18383E30000F1FFC1838FF10000
      FBFFC183FFFF0000FFFFC183FFFF000000000000000000000000000000000000
      000000000000}
  end
  object qryExemplos: TUMZQuery
    Connection = DM.db
    SQL.Strings = (
      'SELECT'
      '     cd_exemplo, '
      '      ds_nome,'
      '      ds_comparar,'
      '      sn_ok,'
      '      ds_modo,'
      '     vl_percentual'
      ''
      'FROM'#9'cand_exemplos')
    Params = <>
    DataSource = dtPessoasImportadas
    Left = 74
    Top = 424
    object qryExemplosDS_NOME: TStringField
      FieldName = 'DS_NOME'
      Size = 255
    end
    object qryExemplosDS_COMPARAR: TStringField
      FieldName = 'DS_COMPARAR'
      Size = 255
    end
    object qryExemplosSN_OK: TSmallintField
      FieldName = 'SN_OK'
      OnGetText = qryExemplosSN_OKGetText
    end
    object qryExemplosDS_MODO: TStringField
      FieldName = 'DS_MODO'
      Size = 255
    end
    object qryExemplosVL_PERCENTUAL: TIntegerField
      FieldName = 'VL_PERCENTUAL'
    end
    object qryExemplosCD_EXEMPLO: TLargeintField
      FieldName = 'CD_EXEMPLO'
    end
  end
  object dtsExemplos: TDataSource
    DataSet = qryExemplos
    Left = 74
    Top = 456
  end
  object qryFiltrarResultados: TUMZQuery
    Connection = DM.db
    SQL.Strings = (
      'SELECT'
      #9'pi.cd_importada codigo,'
      ''
      'IF ('
      #9'pu.ds_nome IS NOT NULL,'
      #9'pu.ds_nome,'
      #9'p.nm_pessoa'
      ') AS nome_unimestre,'
      ' pi.ds_nome nome_importada,'
      ' pi.ds_metodo metodo_busca,'
      ' pi.sn_encontrado encontrado'
      'FROM'
      #9'pessoas_importadas pi'
      'LEFT JOIN pessoas p ON ('
      #9'p.cd_pessoa = pi.cd_pessoa_unimestre'
      ')'
      'LEFT JOIN pessoas_unimestre pu ON ('
      #9'pu.cd_pessoa_unimestre = pi.cd_pessoa_unimestre'
      ')'
      'WHERE'
      #9'sn_encontrado = :sn_encontrado'
      'GROUP BY'
      #9'pi.ds_nome')
    Params = <
      item
        DataType = ftUnknown
        Name = 'sn_encontrado'
        ParamType = ptUnknown
      end>
    Left = 105
    Top = 425
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'sn_encontrado'
        ParamType = ptUnknown
      end>
    object qryFiltrarResultadosNOME_UNIMESTRE: TStringField
      FieldName = 'NOME_UNIMESTRE'
      Size = 255
    end
    object qryFiltrarResultadosNOME_IMPORTADA: TStringField
      FieldName = 'NOME_IMPORTADA'
      Size = 255
    end
    object qryFiltrarResultadosMETODO_BUSCA: TStringField
      FieldName = 'METODO_BUSCA'
      Size = 255
    end
    object qryFiltrarResultadosCODIGO: TIntegerField
      FieldName = 'CODIGO'
    end
    object qryFiltrarResultadosENCONTRADO: TIntegerField
      FieldName = 'ENCONTRADO'
    end
  end
  object dtsFiltrarResultados: TDataSource
    DataSet = qryFiltrarResultados
    Left = 106
    Top = 456
  end
  object qryQtdEncontrados: TUMZQuery
    Connection = DM.db
    SQL.Strings = (
      'SELECT'
      #9'COUNT( DISTINCT pi.ds_nome) qtdPessoasImportadas'
      'FROM '
      #9'pessoas_importadas pi '
      'WHERE'
      #9'pi.sn_encontrado = :sn_encontrado'
      '')
    Params = <
      item
        DataType = ftInteger
        Name = 'sn_encontrado'
        ParamType = ptInputOutput
      end>
    Left = 136
    Top = 425
    ParamData = <
      item
        DataType = ftInteger
        Name = 'sn_encontrado'
        ParamType = ptInputOutput
      end>
  end
  object qryMarcados: TUMZQuery
    Connection = DM.db
    SQL.Strings = (
      'SELECT'
      #9'COUNT( DISTINCT pi.ds_nome) qtdMarcados'
      'FROM'
      #9'pessoas_importadas pi'
      'WHERE'
      #9'pi.sn_encontrado = 1')
    Params = <>
    Left = 168
    Top = 426
  end
  object qryFiltroFinal: TUMZQuery
    Connection = DM.db
    SQL.Strings = (
      'SELECT'
      #9'mt.anosemestre,'
      #9'pi.cd_pessoa_unimestre cd_pessoa,'
      #9'pi.ds_nome ds_nome,'
      #9'pi.nr_classificacao ds_classificacao,'
      #9'pi.ds_curso ds_curso,'
      #9'pi.ds_proposito ds_proposito_importacao,'
      '  COALESCE(CONCAT('
      #9#9#9'substr(p.ds_cpf,1,3), '#39'.'#39','
      #9#9#9'substr(p.ds_cpf,4,3),'
      #9#9#9#39'.'#39','
      #9#9#9'substr(p.ds_cpf,7,3),'
      #9#9#9#39'-'#39','
      #9#9#9'substr(p.ds_cpf,10,2)'
      '  ), '#39'N'#227'o informado'#39') ds_cpf,'
      #9'COALESCE(p.ds_identidade, '#39'N'#227'o informado'#39') ds_identidade,'
      #9'p_pai.nm_pessoa nm_pai,'
      #9'p_mae.nm_pessoa nm_mae,'
      'IF ('
      #9'pu.ds_turma IS NOT NULL,'
      #9'pu.ds_turma,'
      #9'('
      #9#9'SELECT'
      #9#9#9'm.turma'
      #9#9'FROM'
      #9#9#9'matriculas m'
      #9#9'WHERE'
      #9#9#9'm.codigoaluno = pi.cd_pessoa_unimestre'
      #9#9'ORDER BY'
      #9#9#9'm.anosemestre DESC'
      #9#9'LIMIT 1'
      #9')'
      ') ds_turma,'
      ' ('
      #9'SELECT'
      #9#9't.anosemestre'
      #9'FROM'
      #9#9'matriculas t'
      #9'WHERE'
      #9#9'pu.cd_pessoa_unimestre = t.codigoaluno'
      #9'ORDER BY'
      #9#9't.anosemestre DESC'
      #9'LIMIT 1'
      ') nr_anosemestre,'
      'IF ('
      #9'pu.ds_email IS NOT NULL,'
      #9'pu.ds_email,'
      #9'('
      #9#9'SELECT'
      #9#9#9'cp.ds_contato'
      #9#9'FROM'
      #9#9#9'contatos_pessoas cp'
      #9#9'WHERE'
      #9#9#9'cp.cd_pessoa = pi.cd_pessoa_unimestre'
      #9#9'AND cp.cd_contato = 4'
      #9#9'LIMIT 1'
      #9')'
      ') ds_email,'
      ''
      'IF ('
      #9'pu.ds_telefone IS NOT NULL,'
      #9'pu.ds_telefone,'
      #9'('
      #9#9'SELECT'
      #9#9#9'cp.ds_contato'
      #9#9'FROM'
      #9#9#9'contatos_pessoas cp'
      #9#9'WHERE'
      #9#9#9'cp.cd_pessoa = pi.cd_pessoa_unimestre'
      #9#9'AND cp.cd_contato = 1'
      #9#9'LIMIT 1'
      #9')'
      ') ds_telefone,'
      ' ('
      #9'SELECT'
      #9#9'p.dt_nascimento'
      #9'FROM'
      #9#9'pessoas p'
      #9'WHERE'
      #9#9'p.cd_pessoa = pi.cd_pessoa_unimestre'
      #9'LIMIT 1'
      ') dt_nascimento,'
      ''
      ' ('
      #9'SELECT'
      #9#9'cp.ds_contato'
      #9'FROM'
      #9#9'contatos_pessoas cp'
      #9'WHERE'
      #9#9'cp.cd_pessoa = pi.cd_pessoa_unimestre'
      #9'AND cp.cd_contato = 3'
      #9'LIMIT 1'
      ') ds_celular,'
      '('
      #9'SELECT'
      #9#9'cp.ds_contato '
      #9'FROM'
      #9#9'contatos_pessoas cp'
      #9'WHERE'
      #9#9'cp.cd_pessoa = p.cd_pai'
      #9'AND cp.cd_contato = 3'
      #9'LIMIT 1'
      ') ds_celular_pai,'
      '('
      #9'SELECT'
      #9#9'cp.ds_contato'
      #9'FROM'
      #9#9'contatos_pessoas cp'
      #9'WHERE'
      #9#9'cp.cd_pessoa = p.cd_mae'
      #9'AND cp.cd_contato = 3'
      #9'LIMIT 1'
      ') ds_celular_mae,'
      '('
      #9'SELECT'
      #9#9'cp.ds_contato'
      #9'FROM'
      #9#9'contatos_pessoas cp'
      #9'WHERE'
      #9#9'cp.cd_pessoa = p.cd_resp_acad'
      #9'AND cp.cd_contato = 3'
      #9'LIMIT 1'
      ') ds_celular_resp_acad,'
      '('
      #9#9'SELECT'
      '      m.anosemestre'
      #9#9'FROM'
      #9#9#9'matriculas m'
      #9#9#9'INNER JOIN cursos_mestre cm ON ( cm.CD_CURSO = m.curso )'
      #9#9'WHERE'
      
        #9#9#9'm.codigoaluno = pi.cd_pessoa_unimestre AND m.anosemestre <> m' +
        't.anosemestre'
      #9#9'ORDER BY'
      #9#9#9'm.anosemestre DESC , cm.NR_RELEVANCIA DESC'
      #9#9'LIMIT 1'
      ') anosemestre_anterior,'
      '('
      #9#9'SELECT'
      #9#9#9'COALESCE(m.turma, '#39'N'#227'o informado'#39' )'
      #9#9'FROM'
      #9#9#9'matriculas m'
      #9#9#9'INNER Join cursos_mestre cm ON ( cm.CD_CURSO = m.curso )'
      #9#9'WHERE'
      
        #9#9#9'm.codigoaluno = pi.cd_pessoa_unimestre AND m.anosemestre <> m' +
        't.anosemestre'
      #9#9'ORDER BY'
      #9#9#9'm.anosemestre DESC , cm.NR_RELEVANCIA DESC'
      #9#9'LIMIT 1'
      ') turma_anterior'
      ''
      'FROM'
      #9'pessoas_importadas pi'
      'LEFT JOIN pessoas_unimestre pu ON ('
      #9'pi.cd_pessoa_unimestre = pu.cd_pessoa_unimestre'
      ')'
      'LEFT JOIN pessoas p ON ('
      #9'p.cd_pessoa = pi.cd_pessoa_unimestre'
      ') '
      ''
      'LEFT JOIN pessoas p_pai ON ('
      #9'p_pai.cd_pessoa = p.cd_pai'
      ')'
      ''
      'LEFT JOIN pessoas p_mae ON ('
      #9'p_mae.cd_pessoa = p.cd_mae'
      ')'
      ''
      'LEFT JOIN matriculas mt ON ('
      #9'mt.codigoaluno = pi.cd_pessoa_unimestre AND'
      #9'mt.turma = pu.ds_turma'
      ')'
      ''
      'WHERE'
      #9'pi.sn_encontrado = 1 '
      'GROUP BY'
      #9'pi.ds_nome')
    Params = <>
    Left = 200
    Top = 426
    object qryFiltroFinalCD_PESSOA: TIntegerField
      Tag = 1
      DisplayLabel = 'Cod. Pessoa'
      FieldName = 'CD_PESSOA'
    end
    object qryFiltroFinalDS_NOME: TStringField
      Tag = 1
      DisplayLabel = 'Nome'
      FieldName = 'DS_NOME'
      Size = 255
    end
    object qryFiltroFinalDS_CURSO: TStringField
      Tag = 1
      DisplayLabel = 'Curso'
      FieldName = 'DS_CURSO'
      Size = 255
    end
    object qryFiltroFinalDS_TURMA: TStringField
      Tag = 1
      DisplayLabel = 'Turma'
      FieldName = 'DS_TURMA'
      Size = 255
    end
    object qryFiltroFinalDS_PROPOSITO_IMPORTACAO: TStringField
      Tag = 1
      DisplayLabel = 'Prop'#243'sito da importa'#231#227'o'
      FieldName = 'DS_PROPOSITO_IMPORTACAO'
      Size = 255
    end
    object qryFiltroFinalDS_EMAIL: TStringField
      Tag = 1
      DisplayLabel = 'E-mail'
      FieldName = 'DS_EMAIL'
      Size = 255
    end
    object qryFiltroFinalDS_FONE: TStringField
      Tag = 1
      DisplayLabel = 'Telefone'
      FieldName = 'DS_TELEFONE'
      Size = 255
    end
    object qryFiltroFinalDS_CLASSIFICACAO: TIntegerField
      Tag = 1
      DisplayLabel = 'Classifica'#231#227'o'
      FieldName = 'DS_CLASSIFICACAO'
    end
    object qryFiltroFinalNR_ANOSEMESTRE: TIntegerField
      Tag = 1
      DisplayLabel = 'Ano/Semestre'
      FieldName = 'NR_ANOSEMESTRE'
      DisplayFormat = '0000/0'
    end
    object qryFiltroFinaldt_nascimento: TDateTimeField
      Tag = 1
      DisplayLabel = 'Data de Nascimento'
      FieldName = 'dt_nascimento'
    end
    object qryFiltroFinalDS_CELULAR: TStringField
      Tag = 1
      DisplayLabel = 'Celular'
      FieldName = 'DS_CELULAR'
      Size = 255
    end
    object qryFiltroFinalDS_CPF: TStringField
      Tag = 1
      DisplayLabel = 'Cpf'
      FieldName = 'DS_CPF'
      Size = 80
    end
    object qryFiltroFinalDS_IDENTIDADE: TStringField
      Tag = 1
      DisplayLabel = 'Identidade'
      FieldName = 'DS_IDENTIDADE'
      Size = 80
    end
    object qryFiltroFinalNM_PAI: TStringField
      Tag = 1
      DisplayLabel = 'Nome do pai'
      FieldName = 'NM_PAI'
      Size = 255
    end
    object qryFiltroFinalNM_MAE: TStringField
      Tag = 1
      DisplayLabel = 'Nome da m'#227'e'
      FieldName = 'NM_MAE'
      Size = 255
    end
    object qryFiltroFinalDS_CELULAR_PAI: TStringField
      Tag = 1
      DisplayLabel = 'Celular pai'
      FieldName = 'DS_CELULAR_PAI'
      Size = 252
    end
    object qryFiltroFinalDS_CELULAR_MAE: TStringField
      Tag = 1
      DisplayLabel = 'Celular m'#227'e'
      FieldName = 'DS_CELULAR_MAE'
      Size = 253
    end
    object qryFiltroFinalDS_CELULAR_RESP_ACAD: TStringField
      Tag = 1
      DisplayLabel = 'Celular Resp. Acad'#234'mico'
      FieldName = 'DS_CELULAR_RESP_ACAD'
      Size = 249
    end
    object qryFiltroFinalTURMA_ANTERIOR: TStringField
      Tag = 1
      DisplayLabel = 'Turma Anterior'
      FieldName = 'TURMA_ANTERIOR'
      Size = 250
    end
    object qryFiltroFinalANOSEMESTRE_ANTERIOR: TIntegerField
      Tag = 1
      DisplayLabel = 'Ano/Semestre Anterior'
      FieldName = 'ANOSEMESTRE_ANTERIOR'
      DisplayFormat = '0000/0'
    end
  end
  object dtsFiltroFinal: TDataSource
    DataSet = qryFiltroFinal
    Left = 200
    Top = 456
  end
  object qryQtdFiltroFinal: TUMZQuery
    Connection = DM.db
    SQL.Strings = (
      'SELECT'
      #9'COUNT( DISTINCT pi.ds_nome)  qtd_total_filtro'
      'FROM'
      #9'pessoas_importadas pi'
      'LEFT JOIN pessoas_unimestre pu ON ('
      #9'pi.cd_pessoa_unimestre = pu.cd_pessoa_unimestre'
      ')'
      'WHERE'
      #9'pi.sn_encontrado = 1')
    Params = <>
    Left = 232
    Top = 426
  end
  object ImageList2: TImageList
    Left = 12
    Top = 486
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
      0000000000000000FF0000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000093605900FCE9D600FEDFBF00FEDCBA00FED3A800FECFA100FEC6
      8F00FDC38B00FBC08700FBC08700000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000FF000000FF000000FF00000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000A0675E00FDF5ED00FEEEDE00FCE9D600FEDFBF00FEDAB600FED1
      A500FECC9B00FEC68F00FDC38B00000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000FF000000FF000000FF00000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000008D5D59008D5D59008D5D
      59008D5D5900A2696100FDFAF700FDF3E900FEEEDE00FAE6D100FEDFBF00FED7
      AF00FED3A800FECA9700FEC89300000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      FF000000FF000000FF000000FF000000FF000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000001FFF00000000000000
      00000000000000000000000000000000000000000000F6E1CC00FEDFBF00FED7
      AF00FED1A500B2796300FEFDFE00FDFBF900FDF8F300FDF0E300FEEEDE00FAE6
      D100FEDFBF00FED5AB00FED1A500000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000000000000000FF000000
      FF000000FF000000FF000000FF000000FF000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000001FFF00001FFF00001FFF000000
      00000000000000000000000000000000000000000000FCE9D600FAE6D100FEDC
      BA00FED7AF00BA7F6100FEFDFE00FEFDFE00FDFCFA00FDF5ED00FDF3E900FCE9
      D600FAE6D100FEDCBA00FED7AF00000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000007F7F7F000000FF000000
      FF0000000000000000000000FF000000FF000000FF0000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000001FFF00001FFF00001FFF00001FFF00001F
      FF000000000000000000000000000000000000000000FDF5ED00FDF0E300FCE9
      D600FAE6D100D3946C00FEFDFE00FEFDFE00FEFDFE00FEFDFE00FDFBF900FDF5
      ED00FDF0E300FCE9D600F6E1CC00000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000007F7F7F000000FF00000000000000
      00000000000000000000000000000000FF000000FF0000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000001FFF00000000000000
      00000000000000000000000000000000000000000000FDFAF700FDF7F100FEEE
      DE00FCE9D600D4976F00FEFDFE00FEFDFE00FEFDFE00FEFDFE00FEFDFE00FDF3
      E900F3DEC800C0A69000BEA38D00000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000FF000000FF000000FF00000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000FEFDFE00FEFDFE00FDF8
      F300FDF5ED00D89F7600FEFDFE00FEFDFE00FEFDFE00FEFDFE00FEFDFE00FEFD
      FE00A0675E00DF924000DE903C00000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000FF000000FF00000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000001FFF0000000000000000000000
      00000000000000000000000000000000000000000000FEFDFE00FEFDFE00FDFC
      FA00FDFAF700D89F7600FEFDFE00FEFDFE00FEFDFE00FEFDFE00FEFDFE00FEFD
      FE00A0675E00DE944400DE903C00000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000FF000000FF000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000001FFF0000000000001FFF00000000000000000000000000000000000000
      00000000000000000000000000000000000000000000FEFDFE00FEFDFE00FEFD
      FE00FEFDFE00D89F7600D3946C00D3946C00D3946C00D3946C00D3946C00D394
      6C00A0675E000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000000000007F7F7F000000
      FF00000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000FEFDFE00FEFDFE00FEFD
      FE00FEFDFE00FEFDFE00FDFCFA00F3DEC800C6AD9500BEA38D00724241000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000007F7F
      7F000000FF000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000FEFDFE00FEFDFE00FEFD
      FE00FEFDFE00FEFDFE00FEFDFE00A0675E00DC9B5C00DE903C00A56C64000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000FF000000FF00000000000000000000000000000000000000
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
      00000000000000000000000000000000FFFFFFFFF8010000FFFFFFFFF8010000
      F9FFFFFFF8010000F0FFFFFFF8010000F0FFFFFF80010000E07FFFBF80010000
      C07FFF1F80010000843FFE0F800100001E3FFFBF80010000FE1FFFFF80010000
      FF1FFF7F80010000FF8FF5FF80070000FFC7FFFF801F0000FFE3FFFF801F0000
      FFF8FFFF803F0000FFFFFFFF807F0000FFFFF8F8FFFFFFFFF83FFAFAFC7FE3FF
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
  object Crpe1: TCrpe
    About = 'Version and Credits...'
    DesignControls = 'Design-Time Window Controls'
    Version.Crpe.Major = 0
    Version.Crpe.Minor = 0
    Version.Crpe.Release = 0
    Version.Crpe.Build = 0
    Version.Report.Major = 0
    Version.Report.Minor = 0
    Version.Report.Letter = #0
    Version.Windows.Platform = 'NT'
    Version.Windows.Major = 6
    Version.Windows.Minor = 1
    Version.Windows.Build = '7601'
    TempPath = 'C:\Users\ESTAGI~1\AppData\Local\Temp\'
    PrintDate.Day = 0
    PrintDate.Month = 0
    PrintDate.Year = 0
    Subreports.Number = 0
    Subreports.Item.Top = -1
    Subreports.Item.Left = -1
    Subreports.Item.Width = -1
    Subreports.Item.Height = -1
    Subreports.Item.Border.Left = lsNone
    Subreports.Item.Border.Right = lsNone
    Subreports.Item.Border.Top = lsNone
    Subreports.Item.Border.Bottom = lsNone
    Subreports.Item.Border.TightHorizontal = False
    Subreports.Item.Border.DropShadow = False
    Subreports.Item.Border.ForeColor = clNone
    Subreports.Item.Border.BackgroundColor = clNone
    Subreports.Item.NLinks = 0
    GroupSortFields.Number = -1
    Groups.Number = -1
    Groups.Item.CustomizeGroupName = False
    ParamFields.AllowDialog = True
    ParamFields.Item.Top = -1
    ParamFields.Item.Left = -1
    ParamFields.Item.Width = -1
    ParamFields.Item.Height = -1
    ParamFields.Item.Border.Left = lsNone
    ParamFields.Item.Border.Right = lsNone
    ParamFields.Item.Border.Top = lsNone
    ParamFields.Item.Border.Bottom = lsNone
    ParamFields.Item.Border.TightHorizontal = False
    ParamFields.Item.Border.DropShadow = False
    ParamFields.Item.Border.ForeColor = clNone
    ParamFields.Item.Border.BackgroundColor = clNone
    ParamFields.Item.Format.Alignment = haDefault
    ParamFields.Item.Format.SuppressIfDuplicated = False
    ParamFields.Item.Format.CanGrow = False
    ParamFields.Item.Format.MaxNLines = 0
    ParamFields.Item.Format.Field.Number.CurrencySymbol = '$'
    ParamFields.Item.Format.Field.Number.ThousandSymbol = ','
    ParamFields.Item.Format.Field.Number.DecimalSymbol = '.'
    ParamFields.Item.Format.Field.Number.ShowZeroValueAs = '0'
    ParamFields.Item.Format.Field.Date.FirstSeparator = '/'
    ParamFields.Item.Format.Field.Date.SecondSeparator = '/'
    ParamFields.Item.Format.Field.Time.AMString = 'AM'
    ParamFields.Item.Format.Field.Time.PMString = 'PM'
    ParamFields.Item.Format.Field.Time.HourMinSeparator = ':'
    ParamFields.Item.Format.Field.Time.MinSecSeparator = ':'
    ParamFields.Item.Format.Field.Paragraph.LineSpacing = 1.000000000000000000
    ParamFields.Item.Font.Charset = DEFAULT_CHARSET
    ParamFields.Item.Font.Color = clWindowText
    ParamFields.Item.Font.Height = -11
    ParamFields.Item.Font.Name = 'Tahoma'
    ParamFields.Item.Font.Style = []
    ParamFields.Item.HiliteConditions.Item.FontColor = clNone
    ParamFields.Item.HiliteConditions.Item.Background = clNone
    ParamFields.Item.ParamType = pfNoValue
    ParamFields.Item.ParamSource = psReport
    ParamFields.Item.Info.AllowNull = True
    ParamFields.Item.Info.AllowEditing = True
    ParamFields.Item.Info.AllowMultipleValues = False
    ParamFields.Item.Info.ValueType = vtDiscrete
    ParamFields.Item.Info.PartOfGroup = False
    ParamFields.Item.Info.MutuallyExclusiveGroup = True
    ParamFields.Item.Info.GroupNum = -1
    ParamFields.Item.ValueLimit = False
    ParamFields.Item.Ranges.Item.Bounds = IncludeStartAndEnd
    ParamFields.Item.NeedsCurrentValue = False
    ParamFields.Item.IsLinked = False
    Formulas.Item.Top = -1
    Formulas.Item.Left = -1
    Formulas.Item.Width = -1
    Formulas.Item.Height = -1
    Formulas.Item.Border.Left = lsNone
    Formulas.Item.Border.Right = lsNone
    Formulas.Item.Border.Top = lsNone
    Formulas.Item.Border.Bottom = lsNone
    Formulas.Item.Border.TightHorizontal = False
    Formulas.Item.Border.DropShadow = False
    Formulas.Item.Border.ForeColor = clNone
    Formulas.Item.Border.BackgroundColor = clNone
    Formulas.Item.Format.Alignment = haDefault
    Formulas.Item.Format.SuppressIfDuplicated = False
    Formulas.Item.Format.CanGrow = False
    Formulas.Item.Format.MaxNLines = 0
    Formulas.Item.Format.Field.Number.CurrencySymbol = '$'
    Formulas.Item.Format.Field.Number.ThousandSymbol = ','
    Formulas.Item.Format.Field.Number.DecimalSymbol = '.'
    Formulas.Item.Format.Field.Number.ShowZeroValueAs = '0'
    Formulas.Item.Format.Field.Date.FirstSeparator = '/'
    Formulas.Item.Format.Field.Date.SecondSeparator = '/'
    Formulas.Item.Format.Field.Time.AMString = 'AM'
    Formulas.Item.Format.Field.Time.PMString = 'PM'
    Formulas.Item.Format.Field.Time.HourMinSeparator = ':'
    Formulas.Item.Format.Field.Time.MinSecSeparator = ':'
    Formulas.Item.Format.Field.Paragraph.LineSpacing = 1.000000000000000000
    Formulas.Item.Font.Charset = DEFAULT_CHARSET
    Formulas.Item.Font.Color = clWindowText
    Formulas.Item.Font.Height = -11
    Formulas.Item.Font.Name = 'Tahoma'
    Formulas.Item.Font.Style = []
    Formulas.Item.HiliteConditions.Item.FontColor = clNone
    Formulas.Item.HiliteConditions.Item.Background = clNone
    AreaFormat.Item.NSections = 0
    SectionSize.Item.Height = -1
    SectionSize.Item.Width = -1
    SQLExpressions.Item.Top = -1
    SQLExpressions.Item.Left = -1
    SQLExpressions.Item.Width = -1
    SQLExpressions.Item.Height = -1
    SQLExpressions.Item.Border.Left = lsNone
    SQLExpressions.Item.Border.Right = lsNone
    SQLExpressions.Item.Border.Top = lsNone
    SQLExpressions.Item.Border.Bottom = lsNone
    SQLExpressions.Item.Border.TightHorizontal = False
    SQLExpressions.Item.Border.DropShadow = False
    SQLExpressions.Item.Border.ForeColor = clNone
    SQLExpressions.Item.Border.BackgroundColor = clNone
    SQLExpressions.Item.Format.Alignment = haDefault
    SQLExpressions.Item.Format.SuppressIfDuplicated = False
    SQLExpressions.Item.Format.CanGrow = False
    SQLExpressions.Item.Format.MaxNLines = 0
    SQLExpressions.Item.Format.Field.Number.CurrencySymbol = '$'
    SQLExpressions.Item.Format.Field.Number.ThousandSymbol = ','
    SQLExpressions.Item.Format.Field.Number.DecimalSymbol = '.'
    SQLExpressions.Item.Format.Field.Number.ShowZeroValueAs = '0'
    SQLExpressions.Item.Format.Field.Date.FirstSeparator = '/'
    SQLExpressions.Item.Format.Field.Date.SecondSeparator = '/'
    SQLExpressions.Item.Format.Field.Time.AMString = 'AM'
    SQLExpressions.Item.Format.Field.Time.PMString = 'PM'
    SQLExpressions.Item.Format.Field.Time.HourMinSeparator = ':'
    SQLExpressions.Item.Format.Field.Time.MinSecSeparator = ':'
    SQLExpressions.Item.Format.Field.Paragraph.LineSpacing = 1.000000000000000000
    SQLExpressions.Item.Font.Charset = DEFAULT_CHARSET
    SQLExpressions.Item.Font.Color = clWindowText
    SQLExpressions.Item.Font.Height = -11
    SQLExpressions.Item.Font.Name = 'Tahoma'
    SQLExpressions.Item.Font.Style = []
    SQLExpressions.Item.HiliteConditions.Item.FontColor = clNone
    SQLExpressions.Item.HiliteConditions.Item.Background = clNone
    LogOnInfo.Item.Table = -1
    SessionInfo.Table = -1
    SessionInfo.Item.Propagate = True
    ExportOptions.Excel.Constant = 36.000000000000000000
    ExportOptions.Excel.WorksheetFunctions = False
    ExportOptions.Excel.FirstPage = 1
    ExportOptions.Excel.LastPage = 1
    ExportOptions.HTML.PageNavigator = True
    ExportOptions.HTML.SeparatePages = True
    ExportOptions.HTML.FirstPage = 1
    ExportOptions.HTML.LastPage = 1
    ExportOptions.RTF.FirstPage = 1
    ExportOptions.RTF.LastPage = 1
    ExportOptions.Word.FirstPage = 1
    ExportOptions.Word.LastPage = 1
    ExportOptions.PDF.FirstPage = 1
    ExportOptions.PDF.LastPage = 1
    ExportOptions.Text.StringDelimiter = '"'
    ExportOptions.Text.FieldSeparator = ','
    Lines.Item.LineStyle = lsNone
    Lines.Item.Left = -1
    Lines.Item.Right = -1
    Lines.Item.Width = -1
    Lines.Item.Top = -1
    Lines.Item.Bottom = -1
    Lines.Item.Color = clNone
    Lines.Item.Extend = False
    Lines.Item.Suppress = False
    Boxes.Number = -1
    Pictures.Item.Top = -1
    Pictures.Item.Left = -1
    Pictures.Item.Width = -1
    Pictures.Item.Height = -1
    Pictures.Item.Border.Left = lsNone
    Pictures.Item.Border.Right = lsNone
    Pictures.Item.Border.Top = lsNone
    Pictures.Item.Border.Bottom = lsNone
    Pictures.Item.Border.TightHorizontal = False
    Pictures.Item.Border.DropShadow = False
    Pictures.Item.Border.ForeColor = clNone
    Pictures.Item.Border.BackgroundColor = clNone
    Pictures.Item.CropLeft = -1
    Pictures.Item.CropRight = -1
    Pictures.Item.CropTop = -1
    Pictures.Item.CropBottom = -1
    TextObjects.Item.Top = -1
    TextObjects.Item.Left = -1
    TextObjects.Item.Width = -1
    TextObjects.Item.Height = -1
    TextObjects.Item.Border.Left = lsNone
    TextObjects.Item.Border.Right = lsNone
    TextObjects.Item.Border.Top = lsNone
    TextObjects.Item.Border.Bottom = lsNone
    TextObjects.Item.Border.TightHorizontal = False
    TextObjects.Item.Border.DropShadow = False
    TextObjects.Item.Border.ForeColor = clNone
    TextObjects.Item.Border.BackgroundColor = clNone
    TextObjects.Item.Format.Alignment = haDefault
    TextObjects.Item.Format.SuppressIfDuplicated = False
    TextObjects.Item.Format.CanGrow = False
    TextObjects.Item.Format.MaxNLines = 0
    TextObjects.Item.Format.Paragraph.LineSpacing = 1.000000000000000000
    TextObjects.Item.Font.Charset = DEFAULT_CHARSET
    TextObjects.Item.Font.Color = clWindowText
    TextObjects.Item.Font.Height = -11
    TextObjects.Item.Font.Name = 'Tahoma'
    TextObjects.Item.Font.Style = []
    TextObjects.Item.Paragraphs.Item.Alignment = haDefault
    TextObjects.Item.Paragraphs.Item.IndentFirstLine = 0
    TextObjects.Item.Paragraphs.Item.IndentLeft = 0
    TextObjects.Item.Paragraphs.Item.IndentRight = 0
    TextObjects.Item.Paragraphs.Item.TextStart = 0
    TextObjects.Item.Paragraphs.Item.TextEnd = 0
    TextObjects.Item.Paragraphs.Item.TabStops.Item.Alignment = haDefault
    TextObjects.Item.Paragraphs.Item.TabStops.Item.Offset = -1
    TextObjects.Item.EmbeddedFields.Item.FieldObjectType = oftNone
    TextObjects.Item.EmbeddedFields.Item.FieldType = fvUnknown
    TextObjects.Item.EmbeddedFields.Item.TextStart = 0
    TextObjects.Item.EmbeddedFields.Item.TextEnd = 0
    TextObjects.Item.EmbeddedFields.Item.Format.Alignment = haDefault
    TextObjects.Item.EmbeddedFields.Item.Format.SuppressIfDuplicated = False
    TextObjects.Item.EmbeddedFields.Item.Format.CanGrow = False
    TextObjects.Item.EmbeddedFields.Item.Format.MaxNLines = 0
    TextObjects.Item.EmbeddedFields.Item.Format.Field.Number.CurrencySymbol = '$'
    TextObjects.Item.EmbeddedFields.Item.Format.Field.Number.ThousandSymbol = ','
    TextObjects.Item.EmbeddedFields.Item.Format.Field.Number.DecimalSymbol = '.'
    TextObjects.Item.EmbeddedFields.Item.Format.Field.Number.ShowZeroValueAs = '0'
    TextObjects.Item.EmbeddedFields.Item.Format.Field.Date.FirstSeparator = '/'
    TextObjects.Item.EmbeddedFields.Item.Format.Field.Date.SecondSeparator = '/'
    TextObjects.Item.EmbeddedFields.Item.Format.Field.Time.AMString = 'AM'
    TextObjects.Item.EmbeddedFields.Item.Format.Field.Time.PMString = 'PM'
    TextObjects.Item.EmbeddedFields.Item.Format.Field.Time.HourMinSeparator = ':'
    TextObjects.Item.EmbeddedFields.Item.Format.Field.Time.MinSecSeparator = ':'
    TextObjects.Item.EmbeddedFields.Item.Format.Field.Paragraph.LineSpacing = 1.000000000000000000
    TextObjects.Item.EmbeddedFields.Item.Border.Left = lsNone
    TextObjects.Item.EmbeddedFields.Item.Border.Right = lsNone
    TextObjects.Item.EmbeddedFields.Item.Border.Top = lsNone
    TextObjects.Item.EmbeddedFields.Item.Border.Bottom = lsNone
    TextObjects.Item.EmbeddedFields.Item.Border.TightHorizontal = False
    TextObjects.Item.EmbeddedFields.Item.Border.DropShadow = False
    TextObjects.Item.EmbeddedFields.Item.Border.ForeColor = clNone
    TextObjects.Item.EmbeddedFields.Item.Border.BackgroundColor = clNone
    TextObjects.Item.TextSize = -1
    TextObjects.Item.TextHeight = -1
    OleObjects.Item.Top = -1
    OleObjects.Item.Left = -1
    OleObjects.Item.Width = -1
    OleObjects.Item.Height = -1
    OleObjects.Item.Border.Left = lsNone
    OleObjects.Item.Border.Right = lsNone
    OleObjects.Item.Border.Top = lsNone
    OleObjects.Item.Border.Bottom = lsNone
    OleObjects.Item.Border.TightHorizontal = False
    OleObjects.Item.Border.DropShadow = False
    OleObjects.Item.Border.ForeColor = clNone
    OleObjects.Item.Border.BackgroundColor = clNone
    CrossTabs.Item.Top = -1
    CrossTabs.Item.Left = -1
    CrossTabs.Item.Width = -1
    CrossTabs.Item.Height = -1
    CrossTabs.Item.Border.Left = lsNone
    CrossTabs.Item.Border.Right = lsNone
    CrossTabs.Item.Border.Top = lsNone
    CrossTabs.Item.Border.Bottom = lsNone
    CrossTabs.Item.Border.TightHorizontal = False
    CrossTabs.Item.Border.DropShadow = False
    CrossTabs.Item.Border.ForeColor = clNone
    CrossTabs.Item.Border.BackgroundColor = clNone
    Maps.Item.Top = -1
    Maps.Item.Left = -1
    Maps.Item.Width = -1
    Maps.Item.Height = -1
    Maps.Item.Border.Left = lsNone
    Maps.Item.Border.Right = lsNone
    Maps.Item.Border.Top = lsNone
    Maps.Item.Border.Bottom = lsNone
    Maps.Item.Border.TightHorizontal = False
    Maps.Item.Border.DropShadow = False
    Maps.Item.Border.ForeColor = clNone
    Maps.Item.Border.BackgroundColor = clNone
    OLAPCubes.Item.Top = -1
    OLAPCubes.Item.Left = -1
    OLAPCubes.Item.Width = -1
    OLAPCubes.Item.Height = -1
    OLAPCubes.Item.Border.Left = lsNone
    OLAPCubes.Item.Border.Right = lsNone
    OLAPCubes.Item.Border.Top = lsNone
    OLAPCubes.Item.Border.Bottom = lsNone
    OLAPCubes.Item.Border.TightHorizontal = False
    OLAPCubes.Item.Border.DropShadow = False
    OLAPCubes.Item.Border.ForeColor = clNone
    OLAPCubes.Item.Border.BackgroundColor = clNone
    DatabaseFields.Item.Top = -1
    DatabaseFields.Item.Left = -1
    DatabaseFields.Item.Width = -1
    DatabaseFields.Item.Height = -1
    DatabaseFields.Item.Border.Left = lsNone
    DatabaseFields.Item.Border.Right = lsNone
    DatabaseFields.Item.Border.Top = lsNone
    DatabaseFields.Item.Border.Bottom = lsNone
    DatabaseFields.Item.Border.TightHorizontal = False
    DatabaseFields.Item.Border.DropShadow = False
    DatabaseFields.Item.Border.ForeColor = clNone
    DatabaseFields.Item.Border.BackgroundColor = clNone
    DatabaseFields.Item.Format.Alignment = haDefault
    DatabaseFields.Item.Format.SuppressIfDuplicated = False
    DatabaseFields.Item.Format.CanGrow = False
    DatabaseFields.Item.Format.MaxNLines = 0
    DatabaseFields.Item.Format.Field.Number.CurrencySymbol = '$'
    DatabaseFields.Item.Format.Field.Number.ThousandSymbol = ','
    DatabaseFields.Item.Format.Field.Number.DecimalSymbol = '.'
    DatabaseFields.Item.Format.Field.Number.ShowZeroValueAs = '0'
    DatabaseFields.Item.Format.Field.Date.FirstSeparator = '/'
    DatabaseFields.Item.Format.Field.Date.SecondSeparator = '/'
    DatabaseFields.Item.Format.Field.Time.AMString = 'AM'
    DatabaseFields.Item.Format.Field.Time.PMString = 'PM'
    DatabaseFields.Item.Format.Field.Time.HourMinSeparator = ':'
    DatabaseFields.Item.Format.Field.Time.MinSecSeparator = ':'
    DatabaseFields.Item.Format.Field.Paragraph.LineSpacing = 1.000000000000000000
    DatabaseFields.Item.Font.Charset = DEFAULT_CHARSET
    DatabaseFields.Item.Font.Color = clWindowText
    DatabaseFields.Item.Font.Height = -11
    DatabaseFields.Item.Font.Name = 'Tahoma'
    DatabaseFields.Item.Font.Style = []
    DatabaseFields.Item.HiliteConditions.Item.FontColor = clNone
    DatabaseFields.Item.HiliteConditions.Item.Background = clNone
    SummaryFields.Item.Top = -1
    SummaryFields.Item.Left = -1
    SummaryFields.Item.Width = -1
    SummaryFields.Item.Height = -1
    SummaryFields.Item.Border.Left = lsNone
    SummaryFields.Item.Border.Right = lsNone
    SummaryFields.Item.Border.Top = lsNone
    SummaryFields.Item.Border.Bottom = lsNone
    SummaryFields.Item.Border.TightHorizontal = False
    SummaryFields.Item.Border.DropShadow = False
    SummaryFields.Item.Border.ForeColor = clNone
    SummaryFields.Item.Border.BackgroundColor = clNone
    SummaryFields.Item.Format.Alignment = haDefault
    SummaryFields.Item.Format.SuppressIfDuplicated = False
    SummaryFields.Item.Format.CanGrow = False
    SummaryFields.Item.Format.MaxNLines = 0
    SummaryFields.Item.Format.Field.Number.CurrencySymbol = '$'
    SummaryFields.Item.Format.Field.Number.ThousandSymbol = ','
    SummaryFields.Item.Format.Field.Number.DecimalSymbol = '.'
    SummaryFields.Item.Format.Field.Number.ShowZeroValueAs = '0'
    SummaryFields.Item.Format.Field.Date.FirstSeparator = '/'
    SummaryFields.Item.Format.Field.Date.SecondSeparator = '/'
    SummaryFields.Item.Format.Field.Time.AMString = 'AM'
    SummaryFields.Item.Format.Field.Time.PMString = 'PM'
    SummaryFields.Item.Format.Field.Time.HourMinSeparator = ':'
    SummaryFields.Item.Format.Field.Time.MinSecSeparator = ':'
    SummaryFields.Item.Format.Field.Paragraph.LineSpacing = 1.000000000000000000
    SummaryFields.Item.Font.Charset = DEFAULT_CHARSET
    SummaryFields.Item.Font.Color = clWindowText
    SummaryFields.Item.Font.Height = -11
    SummaryFields.Item.Font.Name = 'Tahoma'
    SummaryFields.Item.Font.Style = []
    SummaryFields.Item.HiliteConditions.Item.FontColor = clNone
    SummaryFields.Item.HiliteConditions.Item.Background = clNone
    SpecialFields.Number = -1
    SpecialFields.Item.Top = -1
    SpecialFields.Item.Left = -1
    SpecialFields.Item.Width = -1
    SpecialFields.Item.Height = -1
    SpecialFields.Item.Border.Left = lsNone
    SpecialFields.Item.Border.Right = lsNone
    SpecialFields.Item.Border.Top = lsNone
    SpecialFields.Item.Border.Bottom = lsNone
    SpecialFields.Item.Border.TightHorizontal = False
    SpecialFields.Item.Border.DropShadow = False
    SpecialFields.Item.Border.ForeColor = clNone
    SpecialFields.Item.Border.BackgroundColor = clNone
    SpecialFields.Item.Format.Alignment = haDefault
    SpecialFields.Item.Format.SuppressIfDuplicated = False
    SpecialFields.Item.Format.CanGrow = False
    SpecialFields.Item.Format.MaxNLines = 0
    SpecialFields.Item.Format.Field.Number.CurrencySymbol = '$'
    SpecialFields.Item.Format.Field.Number.ThousandSymbol = ','
    SpecialFields.Item.Format.Field.Number.DecimalSymbol = '.'
    SpecialFields.Item.Format.Field.Number.ShowZeroValueAs = '0'
    SpecialFields.Item.Format.Field.Date.FirstSeparator = '/'
    SpecialFields.Item.Format.Field.Date.SecondSeparator = '/'
    SpecialFields.Item.Format.Field.Time.AMString = 'AM'
    SpecialFields.Item.Format.Field.Time.PMString = 'PM'
    SpecialFields.Item.Format.Field.Time.HourMinSeparator = ':'
    SpecialFields.Item.Format.Field.Time.MinSecSeparator = ':'
    SpecialFields.Item.Format.Field.Paragraph.LineSpacing = 1.000000000000000000
    SpecialFields.Item.Font.Charset = DEFAULT_CHARSET
    SpecialFields.Item.Font.Color = clWindowText
    SpecialFields.Item.Font.Height = -11
    SpecialFields.Item.Font.Name = 'Tahoma'
    SpecialFields.Item.Font.Style = []
    SpecialFields.Item.HiliteConditions.Item.FontColor = clNone
    SpecialFields.Item.HiliteConditions.Item.Background = clNone
    GroupNameFields.Number = -1
    GroupNameFields.Item.Top = -1
    GroupNameFields.Item.Left = -1
    GroupNameFields.Item.Width = -1
    GroupNameFields.Item.Height = -1
    GroupNameFields.Item.Border.Left = lsNone
    GroupNameFields.Item.Border.Right = lsNone
    GroupNameFields.Item.Border.Top = lsNone
    GroupNameFields.Item.Border.Bottom = lsNone
    GroupNameFields.Item.Border.TightHorizontal = False
    GroupNameFields.Item.Border.DropShadow = False
    GroupNameFields.Item.Border.ForeColor = clNone
    GroupNameFields.Item.Border.BackgroundColor = clNone
    GroupNameFields.Item.Format.Alignment = haDefault
    GroupNameFields.Item.Format.SuppressIfDuplicated = False
    GroupNameFields.Item.Format.CanGrow = False
    GroupNameFields.Item.Format.MaxNLines = 0
    GroupNameFields.Item.Format.Field.Number.CurrencySymbol = '$'
    GroupNameFields.Item.Format.Field.Number.ThousandSymbol = ','
    GroupNameFields.Item.Format.Field.Number.DecimalSymbol = '.'
    GroupNameFields.Item.Format.Field.Number.ShowZeroValueAs = '0'
    GroupNameFields.Item.Format.Field.Date.FirstSeparator = '/'
    GroupNameFields.Item.Format.Field.Date.SecondSeparator = '/'
    GroupNameFields.Item.Format.Field.Time.AMString = 'AM'
    GroupNameFields.Item.Format.Field.Time.PMString = 'PM'
    GroupNameFields.Item.Format.Field.Time.HourMinSeparator = ':'
    GroupNameFields.Item.Format.Field.Time.MinSecSeparator = ':'
    GroupNameFields.Item.Format.Field.Paragraph.LineSpacing = 1.000000000000000000
    GroupNameFields.Item.Font.Charset = DEFAULT_CHARSET
    GroupNameFields.Item.Font.Color = clWindowText
    GroupNameFields.Item.Font.Height = -11
    GroupNameFields.Item.Font.Name = 'Tahoma'
    GroupNameFields.Item.Font.Style = []
    GroupNameFields.Item.HiliteConditions.Item.FontColor = clNone
    GroupNameFields.Item.HiliteConditions.Item.Background = clNone
    RunningTotals.Number = -1
    RunningTotals.Item.Top = -1
    RunningTotals.Item.Left = -1
    RunningTotals.Item.Width = -1
    RunningTotals.Item.Height = -1
    RunningTotals.Item.Border.Left = lsNone
    RunningTotals.Item.Border.Right = lsNone
    RunningTotals.Item.Border.Top = lsNone
    RunningTotals.Item.Border.Bottom = lsNone
    RunningTotals.Item.Border.TightHorizontal = False
    RunningTotals.Item.Border.DropShadow = False
    RunningTotals.Item.Border.ForeColor = clNone
    RunningTotals.Item.Border.BackgroundColor = clNone
    RunningTotals.Item.Format.Alignment = haDefault
    RunningTotals.Item.Format.SuppressIfDuplicated = False
    RunningTotals.Item.Format.CanGrow = False
    RunningTotals.Item.Format.MaxNLines = 0
    RunningTotals.Item.Format.Field.Number.CurrencySymbol = '$'
    RunningTotals.Item.Format.Field.Number.ThousandSymbol = ','
    RunningTotals.Item.Format.Field.Number.DecimalSymbol = '.'
    RunningTotals.Item.Format.Field.Number.ShowZeroValueAs = '0'
    RunningTotals.Item.Format.Field.Date.FirstSeparator = '/'
    RunningTotals.Item.Format.Field.Date.SecondSeparator = '/'
    RunningTotals.Item.Format.Field.Time.AMString = 'AM'
    RunningTotals.Item.Format.Field.Time.PMString = 'PM'
    RunningTotals.Item.Format.Field.Time.HourMinSeparator = ':'
    RunningTotals.Item.Format.Field.Time.MinSecSeparator = ':'
    RunningTotals.Item.Format.Field.Paragraph.LineSpacing = 1.000000000000000000
    RunningTotals.Item.Font.Charset = DEFAULT_CHARSET
    RunningTotals.Item.Font.Color = clWindowText
    RunningTotals.Item.Font.Height = -11
    RunningTotals.Item.Font.Name = 'Tahoma'
    RunningTotals.Item.Font.Style = []
    RunningTotals.Item.HiliteConditions.Item.FontColor = clNone
    RunningTotals.Item.HiliteConditions.Item.Background = clNone
    WindowZoom.Preview = pwDefault
    WindowZoom.Magnification = -1
    WindowCursor.GroupArea = wcDefault
    WindowCursor.GroupAreaField = wcDefault
    WindowCursor.DetailArea = wcDefault
    WindowCursor.DetailAreaField = wcDefault
    WindowCursor.Graph = wcDefault
    WindowCursor.OnDemandSubreport = wcMagnify
    WindowCursor.HyperLink = wcDefault
    Graphs.Number = -1
    Graphs.Item.Top = -1
    Graphs.Item.Left = -1
    Graphs.Item.Width = -1
    Graphs.Item.Height = -1
    Graphs.Item.Border.Left = lsNone
    Graphs.Item.Border.Right = lsNone
    Graphs.Item.Border.Top = lsNone
    Graphs.Item.Border.Bottom = lsNone
    Graphs.Item.Border.TightHorizontal = False
    Graphs.Item.Border.DropShadow = False
    Graphs.Item.Border.ForeColor = clNone
    Graphs.Item.Border.BackgroundColor = clNone
    Graphs.Item.Style = unknownGraphType
    Graphs.Item.Text.TitleFont.Charset = DEFAULT_CHARSET
    Graphs.Item.Text.TitleFont.Color = clWindowText
    Graphs.Item.Text.TitleFont.Height = -11
    Graphs.Item.Text.TitleFont.Name = 'Tahoma'
    Graphs.Item.Text.TitleFont.Style = []
    Graphs.Item.Text.SubTitleFont.Charset = DEFAULT_CHARSET
    Graphs.Item.Text.SubTitleFont.Color = clWindowText
    Graphs.Item.Text.SubTitleFont.Height = -11
    Graphs.Item.Text.SubTitleFont.Name = 'Tahoma'
    Graphs.Item.Text.SubTitleFont.Style = []
    Graphs.Item.Text.FootNoteFont.Charset = DEFAULT_CHARSET
    Graphs.Item.Text.FootNoteFont.Color = clWindowText
    Graphs.Item.Text.FootNoteFont.Height = -11
    Graphs.Item.Text.FootNoteFont.Name = 'Tahoma'
    Graphs.Item.Text.FootNoteFont.Style = []
    Graphs.Item.Text.GroupsTitleFont.Charset = DEFAULT_CHARSET
    Graphs.Item.Text.GroupsTitleFont.Color = clWindowText
    Graphs.Item.Text.GroupsTitleFont.Height = -11
    Graphs.Item.Text.GroupsTitleFont.Name = 'Tahoma'
    Graphs.Item.Text.GroupsTitleFont.Style = []
    Graphs.Item.Text.DataTitleFont.Charset = DEFAULT_CHARSET
    Graphs.Item.Text.DataTitleFont.Color = clWindowText
    Graphs.Item.Text.DataTitleFont.Height = -11
    Graphs.Item.Text.DataTitleFont.Name = 'Tahoma'
    Graphs.Item.Text.DataTitleFont.Style = []
    Graphs.Item.Text.LegendFont.Charset = DEFAULT_CHARSET
    Graphs.Item.Text.LegendFont.Color = clWindowText
    Graphs.Item.Text.LegendFont.Height = -11
    Graphs.Item.Text.LegendFont.Name = 'Tahoma'
    Graphs.Item.Text.LegendFont.Style = []
    Graphs.Item.Text.GroupLabelsFont.Charset = DEFAULT_CHARSET
    Graphs.Item.Text.GroupLabelsFont.Color = clWindowText
    Graphs.Item.Text.GroupLabelsFont.Height = -11
    Graphs.Item.Text.GroupLabelsFont.Name = 'Tahoma'
    Graphs.Item.Text.GroupLabelsFont.Style = []
    Graphs.Item.Text.DataLabelsFont.Charset = DEFAULT_CHARSET
    Graphs.Item.Text.DataLabelsFont.Color = clWindowText
    Graphs.Item.Text.DataLabelsFont.Height = -11
    Graphs.Item.Text.DataLabelsFont.Name = 'Tahoma'
    Graphs.Item.Text.DataLabelsFont.Style = []
    Graphs.Item.Axis.GridLineX = gglNone
    Graphs.Item.Axis.GridLineY = gglMajor
    Graphs.Item.Axis.GridLineY2 = gglNone
    Graphs.Item.Axis.GridLineZ = gglNone
    Graphs.Item.Axis.DataValuesY = gdvAutomatic
    Graphs.Item.Axis.DataValuesY2 = gdvAutomatic
    Graphs.Item.Axis.DataValuesZ = gdvAutomatic
    Graphs.Item.Axis.MinY = -1.000000000000000000
    Graphs.Item.Axis.MaxY = -1.000000000000000000
    Graphs.Item.Axis.MinY2 = -1.000000000000000000
    Graphs.Item.Axis.MaxY2 = -1.000000000000000000
    Graphs.Item.Axis.MinZ = -1.000000000000000000
    Graphs.Item.Axis.MaxZ = -1.000000000000000000
    Graphs.Item.Axis.NumberFormatY = gnfNoDecimal
    Graphs.Item.Axis.NumberFormatY2 = gnfNoDecimal
    Graphs.Item.Axis.NumberFormatZ = gnfNoDecimal
    Graphs.Item.Axis.DivisionTypeY = gdvAutomatic
    Graphs.Item.Axis.DivisionTypeY2 = gdvAutomatic
    Graphs.Item.Axis.DivisionTypeZ = gdvAutomatic
    Graphs.Item.Axis.DivisionsY = -1
    Graphs.Item.Axis.DivisionsY2 = -1
    Graphs.Item.Axis.DivisionsZ = -1
    SummaryInfo.SavePreviewPicture = False
    Left = 43
    Top = 487
  end
  object qryQtdCursosFiltros: TUMZQuery
    Connection = DM.db
    SQL.Strings = (
      'SELECT '
      '    cd_filtro, '
      '    cd_coligada,'
      '    cd_departamento,'
      '    nr_anosemestre,'
      '    cd_curso,'
      '    cd_turma,'
      '    ds_situacoes,'
      '    nr_total_alunos'
      'FROM'
      '    cand_filtros')
    Params = <>
    Left = 264
    Top = 426
  end
  object qryMetodo1: TUMZQuery
    Connection = DM.db
    SQL.Strings = (
      'SELECT SQL_NO_CACHE * From '
      '   pessoas_importadas pi'
      'INNER JOIN pessoas_unimestre pu'
      'WHERE '
      '   TRIM(pi.ds_nome) = TRIM(pu.ds_nome) '
      #9' AND pi.sn_encontrado = 0 LIMIT 2'
      ''
      #9)
    Params = <>
    Left = 568
    Top = 303
  end
  object qryMetodo2: TUMZQuery
    Connection = DM.db
    SQL.Strings = (
      'SELECT SQL_NO_CACHE * from '
      '    pessoas_importadas as p_imp'
      ''
      '    INNER JOIN pessoas_unimestre p_unim ON ('
      '        CONCAT('
      '            SUBSTRING_INDEX('
      '                    TRIM(p_imp.ds_nome), '#39' '#39', 1'
      '            ),'
      '            '#39'-'#39',        '
      '            SUBSTRING_INDEX('
      '                TRIM(p_imp.ds_nome), '#39' '#39', - 1'
      '            )'
      '        ) '
      '        = '
      '        CONCAT(        '
      '            SUBSTRING_INDEX('
      '                TRIM(p_unim.ds_nome), '#39' '#39', 1'
      '            ),'
      '            '#39'-'#39','
      '            SUBSTRING_INDEX('
      '                TRIM(p_unim.ds_nome), '#39' '#39', - 1'
      '            )'
      '        )'
      '    )'
      ''
      ''
      'WHERE'
      '    p_imp.sn_encontrado = 0'
      'limit 2')
    Params = <>
    Left = 568
    Top = 336
  end
  object qryMetodo3: TUMZQuery
    Connection = DM.db
    SQL.Strings = (
      'select  SQL_NO_CACHE * from '
      '  pessoas_importadas pi'
      'INNER JOIN pessoas_unimestre pu'
      ''
      'WHERE '
      #9'TRIM(pi.ds_consoantes_nome) = TRIM(pu.ds_consoantes_nome) AND '
      #9'pi.sn_encontrado = 0'
      'LIMIT 2')
    Params = <>
    Left = 568
    Top = 368
  end
  object qryMetodo4: TUMZQuery
    Connection = DM.db
    SQL.Strings = (
      'select SQL_NO_CACHE  * from '
      '  pessoas_importadas pi'
      #9'INNER JOIN pessoas_unimestre pu'
      ''
      'WHERE '
      '  SOUNDEX(TRIM(pi.ds_nome)) = SOUNDEX(TRIM(pu.ds_nome)) AND '
      #9'pi.sn_encontrado = 0'
      ''
      'LIMIT 2')
    Params = <>
    Left = 568
    Top = 400
  end
end
