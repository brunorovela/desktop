object frm_historico_anterior: Tfrm_historico_anterior
  Left = 0
  Top = 0
  Caption = 'Hist'#243'rico Anterior'
  ClientHeight = 561
  ClientWidth = 919
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  FormStyle = fsMDIChild
  KeyPreview = True
  OldCreateOrder = False
  Position = poDesigned
  ShowHint = True
  Visible = True
  WindowState = wsMaximized
  OnClose = FormClose
  OnKeyDown = FormKeyDown
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object Bevel3: TBevel
    Left = 0
    Top = 25
    Width = 919
    Height = 8
    Align = alTop
    Shape = bsSpacer
    ExplicitWidth = 777
  end
  object Bevel1: TBevel
    Left = 0
    Top = 66
    Width = 919
    Height = 8
    Align = alTop
    Shape = bsSpacer
    ExplicitWidth = 777
  end
  object Bevel2: TBevel
    Left = 0
    Top = 528
    Width = 919
    Height = 8
    Align = alBottom
    Shape = bsSpacer
    ExplicitTop = 510
    ExplicitWidth = 777
  end
  object Panel3: TPanel
    Left = 0
    Top = 0
    Width = 919
    Height = 25
    Align = alTop
    BevelOuter = bvLowered
    Caption = 'HIST'#211'RICO ANTERIOR DO ALUNO'
    Color = clBlue
    Font.Charset = ANSI_CHARSET
    Font.Color = clWhite
    Font.Height = -16
    Font.Name = 'Arial'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 0
  end
  object Panel1: TPanel
    Left = 0
    Top = 33
    Width = 919
    Height = 33
    Align = alTop
    BevelOuter = bvLowered
    Color = clBlue
    TabOrder = 1
    object lbl: TLabel
      Left = 12
      Top = 9
      Width = 56
      Height = 18
      Caption = 'ALUNO:'
      Font.Charset = ANSI_CHARSET
      Font.Color = clWhite
      Font.Height = -15
      Font.Name = 'Arial'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label1: TLabel
      Left = 459
      Top = 9
      Width = 59
      Height = 18
      Caption = 'CURSO:'
      Font.Charset = ANSI_CHARSET
      Font.Color = clWhite
      Font.Height = -15
      Font.Name = 'Arial'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object btnCurso: TSpeedButton
      Left = 613
      Top = 6
      Width = 39
      Height = 22
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
    object SpeedButton2: TSpeedButton
      Left = 388
      Top = 7
      Width = 39
      Height = 22
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
    object txtCurso: TEdit
      Left = 523
      Top = 6
      Width = 91
      Height = 21
      ReadOnly = True
      TabOrder = 0
    end
    object txtAluno: TEdit
      Left = 76
      Top = 6
      Width = 313
      Height = 21
      ReadOnly = True
      TabOrder = 1
    end
  end
  object toolPessoa: TToolBar
    Left = 0
    Top = 536
    Width = 919
    Height = 25
    Align = alBottom
    ButtonWidth = 84
    Caption = 'toolPessoa'
    EdgeBorders = [ebTop, ebBottom]
    Images = ImageList2
    List = True
    ShowCaptions = True
    TabOrder = 2
    object ToolButton5: TToolButton
      Left = 0
      Top = 0
      Width = 8
      Caption = 'ToolButton5'
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
      Left = 92
      Top = 0
      Caption = 'F3 Alterar'
      ImageIndex = 1
      OnClick = btnAlterarClick
    end
    object ToolButton4: TToolButton
      Left = 176
      Top = 0
      Width = 8
      Caption = 'ToolButton4'
      ImageIndex = 3
      Style = tbsSeparator
    end
    object btnSalvar: TToolButton
      Left = 184
      Top = 0
      Caption = 'F5 Salvar'
      ImageIndex = 3
      OnClick = btnSalvarClick
    end
    object btnCancelar: TToolButton
      Left = 268
      Top = 0
      Caption = 'F6 Cancelar'
      ImageIndex = 4
      OnClick = btnCancelarClick
    end
    object btnExcluir: TToolButton
      Left = 352
      Top = 0
      Caption = 'F9 Excluir'
      ImageIndex = 2
      OnClick = btnExcluirClick
    end
    object ToolButton8: TToolButton
      Left = 436
      Top = 0
      Width = 8
      Caption = 'ToolButton8'
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
    object ToolButton2: TToolButton
      Left = 528
      Top = 0
      Width = 8
      Caption = 'ToolButton2'
      ImageIndex = 8
      Style = tbsSeparator
    end
  end
  object PageControl1: TPageControl
    Left = 0
    Top = 74
    Width = 919
    Height = 454
    ActivePage = TabSheet1
    Align = alClient
    TabOrder = 3
    object TabSheet1: TTabSheet
      Caption = 'Disciplinas Anteriores'
      object pnCad: TPanel
        Left = 0
        Top = 0
        Width = 911
        Height = 94
        Align = alTop
        BevelOuter = bvNone
        TabOrder = 0
        object Label3: TLabel
          Left = 8
          Top = 52
          Width = 49
          Height = 13
          Caption = 'Cod. Disc.'
          FocusControl = DBEdit2
        end
        object Label4: TLabel
          Left = 67
          Top = 52
          Width = 111
          Height = 13
          Caption = 'Descri'#231#227'o da Disciplina'
          FocusControl = DBLookupComboBox1
        end
        object Label5: TLabel
          Left = 330
          Top = 52
          Width = 54
          Height = 13
          Caption = 'M'#233'dia Final'
          FocusControl = DBEdit3
        end
        object Label6: TLabel
          Left = 497
          Top = 52
          Width = 53
          Height = 13
          Caption = 'Frequ'#234'ncia'
          FocusControl = DBEdit4
        end
        object Label7: TLabel
          Left = 174
          Top = 2
          Width = 32
          Height = 13
          Caption = 'Escola'
        end
        object Label8: TLabel
          Left = 8
          Top = 2
          Width = 24
          Height = 13
          Caption = 'S'#233'rie'
          FocusControl = dbSerie
        end
        object Label9: TLabel
          Left = 95
          Top = 2
          Width = 57
          Height = 13
          Caption = 'C'#243'd. Escola'
          FocusControl = DBEdit6
        end
        object Label10: TLabel
          Left = 500
          Top = 2
          Width = 48
          Height = 13
          Caption = 'Ano/Sem.'
          FocusControl = DBEdit5
        end
        object Label29: TLabel
          Left = 559
          Top = 52
          Width = 45
          Height = 13
          Caption = 'Carga Hr.'
          FocusControl = DBEdit21
        end
        object Label30: TLabel
          Left = 609
          Top = 52
          Width = 48
          Height = 13
          Caption = 'Simb.Obs.'
          FocusControl = DBEdit22
        end
        object Label31: TLabel
          Left = 664
          Top = 52
          Width = 42
          Height = 13
          Caption = 'Situa'#231#227'o'
          FocusControl = DBLookupComboBox3
        end
        object Label42: TLabel
          Left = 393
          Top = 52
          Width = 42
          Height = 13
          Caption = 'Conceito'
          FocusControl = DBEdit32
        end
        object SpeedButton1: TSpeedButton
          Left = 470
          Top = 17
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
        object Bevel7: TBevel
          Left = 8
          Top = 45
          Width = 758
          Height = 3
          Shape = bsTopLine
        end
        object btnIncluirGrade: TSpeedButton
          Left = 568
          Top = 11
          Width = 197
          Height = 27
          Caption = 'Incluir todas as disciplinas da grade'
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
          OnClick = btnIncluirGradeClick
        end
        object Label44: TLabel
          Left = 439
          Top = 52
          Width = 51
          Height = 13
          Caption = 'Qtd. Faltas'
          FocusControl = DBEdit33
        end
        object DBEdit2: TDBEdit
          Left = 8
          Top = 67
          Width = 56
          Height = 21
          DataField = 'disciplina'
          DataSource = dsHistorico
          TabOrder = 3
          OnKeyPress = DBEdit1KeyPress
        end
        object DBLookupComboBox1: TDBLookupComboBox
          Left = 67
          Top = 67
          Width = 259
          Height = 21
          DataField = 'DescDisciplina'
          DataSource = dsHistorico
          TabOrder = 4
          OnKeyPress = DBEdit1KeyPress
        end
        object DBEdit3: TDBEdit
          Left = 330
          Top = 67
          Width = 60
          Height = 21
          DataField = 'mediafinal'
          DataSource = dsHistorico
          TabOrder = 5
          OnKeyPress = DBEdit1KeyPress
        end
        object DBEdit4: TDBEdit
          Left = 497
          Top = 67
          Width = 58
          Height = 21
          DataField = 'frequencia'
          DataSource = dsHistorico
          TabOrder = 8
          OnKeyPress = DBEdit1KeyPress
        end
        object dbSerie: TDBEdit
          Left = 8
          Top = 18
          Width = 81
          Height = 21
          DataField = 'serie'
          DataSource = dsHistorico
          TabOrder = 0
          OnKeyPress = DBEdit1KeyPress
        end
        object DBEdit6: TDBEdit
          Left = 95
          Top = 17
          Width = 73
          Height = 21
          DataField = 'codigoescola'
          DataSource = dsHistorico
          ReadOnly = True
          TabOrder = 1
          OnKeyPress = DBEdit1KeyPress
        end
        object DBEdit5: TDBEdit
          Left = 500
          Top = 17
          Width = 56
          Height = 21
          DataField = 'anosemestre'
          DataSource = dsHistorico
          TabOrder = 2
          OnKeyPress = DBEdit1KeyPress
        end
        object DBEdit21: TDBEdit
          Left = 559
          Top = 67
          Width = 49
          Height = 21
          DataField = 'carga_horaria'
          DataSource = dsHistorico
          TabOrder = 9
          OnKeyPress = DBEdit1KeyPress
        end
        object DBEdit22: TDBEdit
          Left = 609
          Top = 67
          Width = 48
          Height = 21
          DataField = 'simbolo_obs'
          DataSource = dsHistorico
          TabOrder = 10
        end
        object DBLookupComboBox3: TDBLookupComboBox
          Left = 664
          Top = 67
          Width = 118
          Height = 21
          DataField = 'descSituacao'
          DataSource = dsHistorico
          TabOrder = 11
          OnKeyPress = DBEdit1KeyPress
        end
        object DBEdit32: TDBEdit
          Left = 393
          Top = 67
          Width = 42
          Height = 21
          DataField = 'ds_media'
          DataSource = dsHistorico
          TabOrder = 6
          OnKeyPress = DBEdit1KeyPress
        end
        object DBEdit33: TDBEdit
          Left = 439
          Top = 67
          Width = 54
          Height = 21
          DataField = 'totalfaltas'
          DataSource = dsHistorico
          TabOrder = 7
        end
        object edEscola: TEdit
          Left = 174
          Top = 17
          Width = 290
          Height = 21
          ReadOnly = True
          TabOrder = 12
        end
      end
      object tcSeries: TTabControl
        Left = 0
        Top = 94
        Width = 911
        Height = 332
        Align = alClient
        MultiLine = True
        TabOrder = 1
        TabPosition = tpBottom
        Tabs.Strings = (
          'Todas')
        TabIndex = 0
        OnChange = tcSeriesChange
        object DBGrid1: TDBGrid
          Left = 4
          Top = 4
          Width = 903
          Height = 306
          Align = alClient
          Color = clWhite
          DataSource = dsHistorico
          Options = [dgEditing, dgTitles, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgAlwaysShowSelection]
          PopupMenu = pmQtdHistorico
          TabOrder = 0
          TitleFont.Charset = DEFAULT_CHARSET
          TitleFont.Color = clWindowText
          TitleFont.Height = -11
          TitleFont.Name = 'MS Sans Serif'
          TitleFont.Style = []
          OnDrawColumnCell = DBGrid1DrawColumnCell
          OnTitleClick = DBGrid1TitleClick
          Columns = <
            item
              Expanded = False
              FieldName = 'serie'
              Width = 50
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'descEscola'
              Title.Caption = 'Escola'
              Width = 300
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'DescDisciplina'
              Width = 250
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'mediafinal'
              Width = 70
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'ds_media'
              Title.Caption = 'Conceito'
              Width = 70
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'frequencia'
              Title.Caption = 'Freq'#252#234'ncia'
              Width = 60
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'carga_horaria'
              Title.Caption = 'Carga Hr.'
              Width = 60
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'descSituacao'
              Title.Caption = 'Situa'#231#227'o'
              Width = 130
              Visible = True
            end>
        end
        object cbInstituicoes: TUMComboBox
          Left = 109
          Top = 72
          Width = 155
          Height = 21
          Style = csDropDownList
          ItemHeight = 13
          TabOrder = 1
          Visible = False
          OnChange = cbInstituicoesChange
          OnDrawItem = cbInstituicoesDrawItem
          OnExit = cbInstituicoesExit
          TamanhoMaximo = 0
        end
      end
    end
    object TabSheet3: TTabSheet
      Caption = 'Col'#233'gios'
      ImageIndex = 2
      object pnEnsFundMedio: TPanel
        Left = 0
        Top = 0
        Width = 911
        Height = 179
        Align = alTop
        BevelOuter = bvNone
        TabOrder = 0
        object Label19: TLabel
          Left = 6
          Top = 0
          Width = 115
          Height = 13
          Caption = 'Ensino Fundamental'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object Bevel4: TBevel
          Left = 125
          Top = 7
          Width = 653
          Height = 6
          Shape = bsTopLine
        end
        object Label12: TLabel
          Left = 200
          Top = 17
          Width = 97
          Height = 13
          Caption = 'Institui'#231#227'o de ensino'
          FocusControl = dbEscolaG1
        end
        object Label11: TLabel
          Left = 104
          Top = 17
          Width = 87
          Height = 13
          Caption = 'Ano de Conclus'#227'o'
          FocusControl = DBEdit7
        end
        object Label20: TLabel
          Left = 6
          Top = 59
          Width = 77
          Height = 13
          Caption = 'Ensino M'#233'dio'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object Label15: TLabel
          Left = 104
          Top = 75
          Width = 87
          Height = 13
          Caption = 'Ano de Conclus'#227'o'
          FocusControl = DBEdit11
        end
        object Label16: TLabel
          Left = 202
          Top = 75
          Width = 97
          Height = 13
          Caption = 'Institui'#231#227'o de ensino'
          FocusControl = dbEscolaG2
        end
        object Bevel5: TBevel
          Left = 87
          Top = 65
          Width = 691
          Height = 6
          Shape = bsTopLine
        end
        object Label13: TLabel
          Left = 534
          Top = 17
          Width = 33
          Height = 13
          Caption = 'Cidade'
          FocusControl = dbCidadeG1
        end
        object Label17: TLabel
          Left = 534
          Top = 75
          Width = 33
          Height = 13
          Caption = 'Cidade'
          FocusControl = dbCidadeG2
        end
        object Label18: TLabel
          Left = 676
          Top = 75
          Width = 33
          Height = 13
          Caption = 'Estado'
          FocusControl = dbEstadoG2
        end
        object Label14: TLabel
          Left = 676
          Top = 17
          Width = 33
          Height = 13
          Caption = 'Estado'
          FocusControl = dbEstadoG1
        end
        object Label40: TLabel
          Left = 713
          Top = 75
          Width = 66
          Height = 13
          Caption = 'Tipo de Curso'
          FocusControl = DBEdit30
        end
        object btnEscolaFundamental: TSpeedButton
          Left = 506
          Top = 31
          Width = 26
          Height = 23
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
          OnClick = btnEscolaFundamentalClick
        end
        object btEscolaMedio: TSpeedButton
          Left = 506
          Top = 89
          Width = 26
          Height = 23
          AllowAllUp = True
          GroupIndex = 2
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
          OnClick = btEscolaMedioClick
        end
        object Label46: TLabel
          Left = 6
          Top = 118
          Width = 90
          Height = 13
          Caption = 'Ensino Superior'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object Bevel8: TBevel
          Left = 102
          Top = 125
          Width = 691
          Height = 6
          Shape = bsTopLine
        end
        object Label47: TLabel
          Left = 104
          Top = 134
          Width = 87
          Height = 13
          Caption = 'Ano de Conclus'#227'o'
        end
        object Label48: TLabel
          Left = 200
          Top = 134
          Width = 97
          Height = 13
          Caption = 'Institui'#231#227'o de ensino'
          FocusControl = dbEscolaG2
        end
        object Label49: TLabel
          Left = 534
          Top = 134
          Width = 33
          Height = 13
          Caption = 'Cidade'
          FocusControl = dbCidadeG2
        end
        object Label50: TLabel
          Left = 676
          Top = 134
          Width = 33
          Height = 13
          Caption = 'Estado'
          FocusControl = dbEstadoG1
        end
        object Label51: TLabel
          Left = 713
          Top = 134
          Width = 72
          Height = 13
          Caption = 'Nome do curso'
          FocusControl = DBEdit30
        end
        object btnEscolaSuperior: TSpeedButton
          Left = 506
          Top = 148
          Width = 26
          Height = 23
          AllowAllUp = True
          GroupIndex = 2
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
          OnClick = btnEscolaSuperiorClick
        end
        object btnRemover1: TSpeedButton
          Left = 716
          Top = 33
          Width = 23
          Height = 21
          Hint = 'Remover'
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
          OnClick = btnRemover1Click
        end
        object btnRemover2: TSpeedButton
          Left = 884
          Top = 91
          Width = 23
          Height = 21
          Hint = 'Remover'
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
          OnClick = btnRemover2Click
        end
        object btnRemover3: TSpeedButton
          Left = 884
          Top = 152
          Width = 23
          Height = 21
          Hint = 'Remover'
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
          OnClick = btnRemover3Click
        end
        object lblFundamentalMesConclusao: TLabel
          Left = 6
          Top = 17
          Width = 88
          Height = 13
          Caption = 'M'#234's de Conclus'#227'o'
          FocusControl = dbeFundamentalMesConclusao
        end
        object lblMedioMesConclusao: TLabel
          Left = 6
          Top = 75
          Width = 88
          Height = 13
          Caption = 'M'#234's de Conclus'#227'o'
          FocusControl = dbeMedioMesConclusao
        end
        object lblSuperiorMesConclusao: TLabel
          Left = 6
          Top = 134
          Width = 88
          Height = 13
          Caption = 'M'#234's de Conclus'#227'o'
          FocusControl = dbeSuperiorMesConclusao
        end
        object DBEdit7: TDBEdit
          Left = 104
          Top = 33
          Width = 89
          Height = 21
          DataField = 'ano'
          DataSource = dsColegiosGrau1
          TabOrder = 1
        end
        object DBEdit11: TDBEdit
          Left = 104
          Top = 91
          Width = 89
          Height = 21
          DataField = 'ano'
          DataSource = dsColegiosGrau2
          TabOrder = 6
        end
        object dbEscolaG2: TDBEdit
          Left = 200
          Top = 91
          Width = 305
          Height = 21
          DataField = 'ds_escola'
          DataSource = dsColegiosGrau2
          ReadOnly = True
          TabOrder = 7
        end
        object dbEscolaG1: TDBEdit
          Left = 200
          Top = 33
          Width = 305
          Height = 21
          DataField = 'ds_escola'
          DataSource = dsColegiosGrau1
          ReadOnly = True
          TabOrder = 2
        end
        object dbCidadeG1: TDBEdit
          Left = 534
          Top = 33
          Width = 138
          Height = 21
          DataField = 'ds_escola_cidade'
          DataSource = dsColegiosGrau1
          ReadOnly = True
          TabOrder = 3
        end
        object dbCidadeG2: TDBEdit
          Left = 534
          Top = 91
          Width = 138
          Height = 21
          DataField = 'ds_escola_cidade'
          DataSource = dsColegiosGrau2
          ReadOnly = True
          TabOrder = 8
        end
        object dbEstadoG2: TDBEdit
          Left = 676
          Top = 91
          Width = 33
          Height = 21
          DataField = 'ds_escola_estado'
          DataSource = dsColegiosGrau2
          ReadOnly = True
          TabOrder = 9
        end
        object dbEstadoG1: TDBEdit
          Left = 676
          Top = 33
          Width = 33
          Height = 21
          DataField = 'ds_escola_estado'
          DataSource = dsColegiosGrau1
          ReadOnly = True
          TabOrder = 4
        end
        object DBEdit30: TDBEdit
          Left = 713
          Top = 91
          Width = 165
          Height = 21
          DataField = 'ds_curso'
          DataSource = dsColegiosGrau2
          TabOrder = 10
        end
        object DBEdit1: TDBEdit
          Left = 104
          Top = 150
          Width = 89
          Height = 21
          DataField = 'ano'
          DataSource = dsColegiosGrau3
          TabOrder = 12
        end
        object dbEscolaG3: TDBEdit
          Left = 200
          Top = 150
          Width = 305
          Height = 21
          DataField = 'ds_escola'
          DataSource = dsColegiosGrau3
          ReadOnly = True
          TabOrder = 13
        end
        object dbCidadeG3: TDBEdit
          Left = 534
          Top = 152
          Width = 138
          Height = 21
          DataField = 'ds_escola_cidade'
          DataSource = dsColegiosGrau3
          ReadOnly = True
          TabOrder = 14
        end
        object dbEstadoG3: TDBEdit
          Left = 676
          Top = 152
          Width = 33
          Height = 21
          DataField = 'ds_escola_estado'
          DataSource = dsColegiosGrau3
          ReadOnly = True
          TabOrder = 15
        end
        object DBEdit12: TDBEdit
          Left = 713
          Top = 152
          Width = 163
          Height = 21
          DataField = 'ds_curso'
          DataSource = dsColegiosGrau3
          TabOrder = 16
        end
        object dbeFundamentalMesConclusao: TDBEdit
          Left = 6
          Top = 33
          Width = 95
          Height = 21
          DataField = 'NR_MES_CONCLUSAO'
          DataSource = dsColegiosGrau1
          TabOrder = 0
        end
        object dbeMedioMesConclusao: TDBEdit
          Left = 6
          Top = 91
          Width = 95
          Height = 21
          DataField = 'NR_MES_CONCLUSAO'
          DataSource = dsColegiosGrau2
          TabOrder = 5
        end
        object dbeSuperiorMesConclusao: TDBEdit
          Left = 6
          Top = 150
          Width = 95
          Height = 21
          DataField = 'NR_MES_CONCLUSAO'
          DataSource = dsColegiosGrau3
          TabOrder = 11
        end
      end
      object pnSeries: TPanel
        Left = 0
        Top = 179
        Width = 911
        Height = 247
        Align = alClient
        BevelOuter = bvNone
        TabOrder = 1
        object Panel7: TPanel
          Left = 0
          Top = 0
          Width = 911
          Height = 247
          Align = alClient
          BevelOuter = bvNone
          TabOrder = 0
          object GroupBox1: TGroupBox
            Left = 0
            Top = 0
            Width = 911
            Height = 247
            Align = alClient
            Caption = 'Conclus'#227'o das S'#233'ries'
            TabOrder = 0
            object pnGrid: TPanel
              Left = 2
              Top = 105
              Width = 907
              Height = 140
              Align = alClient
              BevelOuter = bvNone
              Caption = 'pnGrid'
              TabOrder = 0
              object DBGrid3: TDBGrid
                Left = 0
                Top = 0
                Width = 907
                Height = 140
                Align = alClient
                DataSource = dsColegiosSeries
                Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgConfirmDelete, dgCancelOnExit]
                PopupMenu = pmQtdColegiosSeries
                TabOrder = 0
                TitleFont.Charset = DEFAULT_CHARSET
                TitleFont.Color = clWindowText
                TitleFont.Height = -11
                TitleFont.Name = 'MS Sans Serif'
                TitleFont.Style = []
                OnTitleClick = DBGrid3TitleClick
                Columns = <
                  item
                    Expanded = False
                    FieldName = 'inicio'
                    ReadOnly = True
                    Title.Caption = 'In'#237'cio'
                    Width = 58
                    Visible = True
                  end
                  item
                    Expanded = False
                    FieldName = 'conclusao'
                    ReadOnly = True
                    Title.Caption = 'Conclus'#227'o'
                    Width = 58
                    Visible = True
                  end
                  item
                    Expanded = False
                    FieldName = 'ds_escola'
                    Title.Caption = 'Institui'#231#227'o de Ensino'
                    Width = 304
                    Visible = True
                  end
                  item
                    Expanded = False
                    FieldName = 'ds_escola_cidade'
                    Width = 160
                    Visible = True
                  end
                  item
                    Expanded = False
                    FieldName = 'ds_escola_estado'
                    Width = 48
                    Visible = True
                  end
                  item
                    Expanded = False
                    FieldName = 'serie'
                    Width = 42
                    Visible = True
                  end
                  item
                    Expanded = False
                    FieldName = 'grau'
                    Width = 39
                    Visible = True
                  end
                  item
                    Expanded = False
                    FieldName = 'NR_DIAS_LETIVOS'
                    Title.Caption = 'Dias. Let.'
                    Visible = True
                  end
                  item
                    Expanded = False
                    FieldName = 'nr_total_carga_horaria'
                    Title.Caption = 'C.H.T.'
                    Width = 45
                    Visible = True
                  end>
              end
            end
            object pnDados: TPanel
              Left = 2
              Top = 15
              Width = 907
              Height = 90
              Align = alTop
              BevelOuter = bvNone
              TabOrder = 1
              object Label22: TLabel
                Left = 76
                Top = 44
                Width = 23
                Height = 13
                Caption = 'Grau'
              end
              object Label23: TLabel
                Left = 4
                Top = 44
                Width = 24
                Height = 13
                Caption = 'S'#233'rie'
                FocusControl = DBEdit16
              end
              object Label27: TLabel
                Left = 750
                Top = 5
                Width = 33
                Height = 13
                Caption = 'Estado'
                FocusControl = dbEstadoSerie
              end
              object Label26: TLabel
                Left = 607
                Top = 5
                Width = 33
                Height = 13
                Caption = 'Cidade'
                FocusControl = dbCidadeSerie
              end
              object btEscolaSerie: TSpeedButton
                Left = 567
                Top = 18
                Width = 26
                Height = 23
                AllowAllUp = True
                GroupIndex = 3
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
                OnClick = btEscolaSerieClick
              end
              object Label25: TLabel
                Left = 258
                Top = 5
                Width = 98
                Height = 13
                Caption = 'Institui'#231#227'o de Ensino'
                FocusControl = dbEscolaSerie
              end
              object Label24: TLabel
                Left = 137
                Top = 5
                Width = 112
                Height = 13
                Caption = 'M'#234's/Ano de Conclus'#227'o'
                FocusControl = DBEdit17
              end
              object Label43: TLabel
                Left = 226
                Top = 43
                Width = 42
                Height = 13
                Caption = 'Dias Let.'
                FocusControl = dbeDiasLetivo
              end
              object Label45: TLabel
                Left = 324
                Top = 44
                Width = 92
                Height = 13
                Caption = 'Carga Hor'#225'ria Total'
                FocusControl = dbeTotalCargaHorario
              end
              object Label2: TLabel
                Left = 434
                Top = 44
                Width = 63
                Height = 13
                Caption = 'Observa'#231#245'es'
                FocusControl = DBEdit81
              end
              object Label21: TLabel
                Left = 4
                Top = 5
                Width = 89
                Height = 13
                Caption = 'M'#234's/Ano de In'#237'cio'
                FocusControl = DBEdit10
              end
              object DBEdit16: TDBEdit
                Left = 4
                Top = 60
                Width = 66
                Height = 21
                DataField = 'serie'
                DataSource = dsColegiosSeries
                TabOrder = 7
              end
              object dbEstadoSerie: TDBEdit
                Left = 750
                Top = 20
                Width = 33
                Height = 21
                DataField = 'ds_escola_estado'
                DataSource = dsColegiosSeries
                ReadOnly = True
                TabOrder = 6
              end
              object dbCidadeSerie: TDBEdit
                Left = 606
                Top = 20
                Width = 138
                Height = 21
                DataField = 'ds_escola_cidade'
                DataSource = dsColegiosSeries
                ReadOnly = True
                TabOrder = 5
              end
              object dbEscolaSerie: TDBEdit
                Left = 258
                Top = 20
                Width = 303
                Height = 21
                DataField = 'ds_escola'
                DataSource = dsColegiosSeries
                ReadOnly = True
                TabOrder = 4
              end
              object DBEdit17: TDBEdit
                Left = 182
                Top = 20
                Width = 70
                Height = 21
                DataField = 'ano'
                DataSource = dsColegiosSeries
                TabOrder = 3
                OnKeyPress = DBEdit9KeyPress
              end
              object dbeDiasLetivo: TDBEdit
                Left = 226
                Top = 60
                Width = 89
                Height = 21
                DataField = 'nr_dias_letivos'
                DataSource = dsColegiosSeries
                TabOrder = 9
              end
              object dbeTotalCargaHorario: TDBEdit
                Left = 321
                Top = 60
                Width = 105
                Height = 21
                DataField = 'nr_total_carga_horaria'
                DataSource = dsColegiosSeries
                TabOrder = 10
              end
              object DBEdit81: TDBEdit
                Left = 434
                Top = 60
                Width = 349
                Height = 21
                DataField = 'ds_escola_observacao'
                DataSource = dsColegiosSeries
                TabOrder = 11
              end
              object DBEdit9: TDBEdit
                Left = 138
                Top = 20
                Width = 38
                Height = 21
                DataField = 'nr_mes_conclusao'
                DataSource = dsColegiosSeries
                TabOrder = 2
                OnExit = DBEdit9Exit
                OnKeyPress = DBEdit9KeyPress
              end
              object DBEdit10: TDBEdit
                Left = 50
                Top = 20
                Width = 70
                Height = 21
                DataField = 'nr_ano_inicio'
                DataSource = dsColegiosSeries
                TabOrder = 1
                OnKeyPress = DBEdit9KeyPress
              end
              object DBEdit13: TDBEdit
                Left = 4
                Top = 20
                Width = 38
                Height = 21
                DataField = 'nr_mes_inicio'
                DataSource = dsColegiosSeries
                TabOrder = 0
                OnExit = DBEdit13Exit
                OnKeyPress = DBEdit9KeyPress
              end
              object cbSituacoes: TComboBox
                Left = 76
                Top = 61
                Width = 144
                Height = 20
                Style = csOwnerDrawFixed
                ItemHeight = 14
                TabOrder = 8
                OnChange = cbSituacoesChange
              end
            end
          end
        end
      end
    end
    object tsVestibular: TTabSheet
      Caption = 'Exames/Sele'#231#227'o'
      ImageIndex = 3
      object Panel4: TPanel
        Left = 0
        Top = 0
        Width = 911
        Height = 178
        Align = alTop
        BevelOuter = bvNone
        TabOrder = 0
        object Label32: TLabel
          Left = 8
          Top = 8
          Width = 68
          Height = 13
          Caption = 'Ano/Semestre'
          FocusControl = DBEdit23
        end
        object Label33: TLabel
          Left = 9
          Top = 48
          Width = 52
          Height = 13
          Caption = 'C'#243'd. Curso'
        end
        object Label34: TLabel
          Left = 84
          Top = 48
          Width = 85
          Height = 13
          Caption = 'Nota da Reda'#231#227'o'
          FocusControl = DBEdit25
        end
        object Label35: TLabel
          Left = 180
          Top = 48
          Width = 69
          Height = 13
          Caption = 'Nota da Prova'
          FocusControl = DBEdit26
        end
        object Label36: TLabel
          Left = 258
          Top = 48
          Width = 29
          Height = 13
          Caption = 'M'#233'dia'
          FocusControl = DBEdit27
        end
        object Label37: TLabel
          Left = 8
          Top = 88
          Width = 61
          Height = 13
          Caption = 'Classif. Geral'
          FocusControl = DBEdit28
        end
        object Label38: TLabel
          Left = 84
          Top = 88
          Width = 63
          Height = 13
          Caption = 'Classif. Curso'
          FocusControl = DBEdit29
        end
        object Label39: TLabel
          Left = 85
          Top = 8
          Width = 48
          Height = 13
          Caption = 'Institui'#231#227'o'
        end
        object Label28: TLabel
          Left = 328
          Top = 48
          Width = 114
          Height = 13
          Caption = 'Descri'#231#227'o do Resultado'
          FocusControl = DBMemo2
        end
        object Label41: TLabel
          Left = 9
          Top = 126
          Width = 82
          Height = 13
          Caption = 'Forma/Descri'#231#227'o'
          FocusControl = DBEdit31
        end
        object Label52: TLabel
          Left = 524
          Top = 8
          Width = 76
          Height = 13
          Caption = 'Nome do Curso:'
          FocusControl = DBEdit8
        end
        object SpeedButton3: TSpeedButton
          Left = 446
          Top = 23
          Width = 26
          Height = 23
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
          OnClick = SpeedButton3Click
        end
        object SpeedButton4: TSpeedButton
          Left = 478
          Top = 23
          Width = 23
          Height = 23
          Hint = 'Remover'
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
          OnClick = SpeedButton4Click
        end
        object DBEdit23: TDBEdit
          Left = 8
          Top = 24
          Width = 68
          Height = 21
          DataField = 'anosemestre'
          DataSource = dsVestibular
          TabOrder = 0
        end
        object DBEdit25: TDBEdit
          Left = 84
          Top = 64
          Width = 70
          Height = 21
          DataField = 'notaredacao'
          DataSource = dsVestibular
          TabOrder = 1
        end
        object DBEdit26: TDBEdit
          Left = 180
          Top = 65
          Width = 69
          Height = 21
          DataField = 'notaprova'
          DataSource = dsVestibular
          TabOrder = 2
        end
        object DBEdit27: TDBEdit
          Left = 258
          Top = 64
          Width = 65
          Height = 21
          DataField = 'media'
          DataSource = dsVestibular
          TabOrder = 3
        end
        object DBEdit28: TDBEdit
          Left = 8
          Top = 104
          Width = 68
          Height = 21
          DataField = 'classificacaogeral'
          DataSource = dsVestibular
          TabOrder = 4
        end
        object DBEdit29: TDBEdit
          Left = 84
          Top = 104
          Width = 68
          Height = 21
          DataField = 'classificacaocurso'
          DataSource = dsVestibular
          TabOrder = 5
        end
        object DBMemo2: TDBMemo
          Left = 328
          Top = 64
          Width = 431
          Height = 91
          DataField = 'ds_resultado'
          DataSource = dsVestibular
          TabOrder = 7
        end
        object DBEdit31: TDBEdit
          Left = 9
          Top = 142
          Width = 313
          Height = 21
          DataField = 'tipo'
          DataSource = dsVestibular
          TabOrder = 6
        end
        object DBEdit24: TDBEdit
          Left = 8
          Top = 64
          Width = 68
          Height = 21
          DataField = 'curso_inscricao'
          DataSource = dsVestibular
          TabOrder = 8
        end
        object DBEdit8: TDBEdit
          Left = 524
          Top = 24
          Width = 284
          Height = 21
          DataField = 'curso_nome'
          DataSource = dsVestibular
          TabOrder = 9
        end
        object edEscolaVest: TEdit
          Left = 84
          Top = 24
          Width = 358
          Height = 21
          ReadOnly = True
          TabOrder = 10
        end
      end
      object Panel5: TPanel
        Left = 0
        Top = 178
        Width = 911
        Height = 248
        Align = alClient
        BevelOuter = bvNone
        TabOrder = 1
        object DBGrid2: TDBGrid
          Left = 0
          Top = 0
          Width = 911
          Height = 248
          Align = alClient
          DataSource = dsVestibular
          Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgConfirmDelete, dgCancelOnExit]
          PopupMenu = pmQtdVersibular
          TabOrder = 0
          TitleFont.Charset = DEFAULT_CHARSET
          TitleFont.Color = clWindowText
          TitleFont.Height = -11
          TitleFont.Name = 'MS Sans Serif'
          TitleFont.Style = []
          OnTitleClick = DBGrid2TitleClick
          Columns = <
            item
              Expanded = False
              FieldName = 'anosem'
              Title.Caption = 'Ano/Semestre'
              Width = 78
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'notaredacao'
              Title.Caption = 'Nota reda'#231#227'o'
              Width = 78
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'notaprova'
              Title.Caption = 'Nota Prova'
              Width = 69
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'media'
              Title.Caption = 'M'#233'dia'
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'classificacaogeral'
              Title.Caption = 'Class. Geral'
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'classificacaocurso'
              Title.Caption = 'Class. Curso'
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'instituicao'
              Title.Caption = 'Institui'#231#227'o'
              Visible = True
            end>
        end
      end
    end
    object TabSheet2: TTabSheet
      Caption = 'Observa'#231#245'es para o Hist'#243'rico'
      ImageIndex = 1
      object DBMemo1: TDBMemo
        Left = 0
        Top = 0
        Width = 911
        Height = 426
        Align = alClient
        DataField = 'observacao'
        DataSource = dsObs
        TabOrder = 0
      end
    end
  end
  object tblHistorico: TUMZQuery
    Connection = DM.db
    OnNewRecord = tblHistoricoNewRecord
    SQL.Strings = (
      
        'select simbolo_obs, codigograde, grau, carga_horaria, anosemestr' +
        'e, situacao, mediafinal, codigoaluno, disciplina, frequencia, cu' +
        'rso, turma, serie, aproveitamento, codigoescola, ds_media, total' +
        'faltas'
      'from fichaindividual '
      'where codigoaluno = :codigoaluno  and curso = :curso'
      'and turma = '#39'HISTORICO'#39
      'order by curso, serie')
    Params = <
      item
        DataType = ftInteger
        Name = 'codigoaluno'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'curso'
        ParamType = ptUnknown
      end>
    Left = 656
    Top = 160
    ParamData = <
      item
        DataType = ftInteger
        Name = 'codigoaluno'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'curso'
        ParamType = ptUnknown
      end>
    object tblHistoricocodigoaluno: TIntegerField
      DisplayLabel = 'C'#243'd. Aluno'
      FieldName = 'codigoaluno'
      Origin = 'WMESTRE12.fichaindividual.codigoaluno'
    end
    object tblHistoricodisciplina: TIntegerField
      DisplayLabel = 'Cod. Disc.'
      FieldName = 'disciplina'
      Origin = 'WMESTRE12.fichaindividual.disciplina'
    end
    object tblHistoricocurso: TStringField
      DisplayLabel = 'Curso'
      FieldName = 'curso'
      Origin = 'WMESTRE12.fichaindividual.curso'
      Size = 15
    end
    object tblHistoricoturma: TStringField
      DisplayLabel = 'Turma'
      FieldName = 'turma'
      Origin = 'WMESTRE12.fichaindividual.turma'
      Size = 50
    end
    object tblHistoricoserie: TSmallintField
      DisplayLabel = 'S'#233'rie'
      FieldName = 'serie'
      Origin = 'WMESTRE12.fichaindividual.serie'
    end
    object tblHistoricoaproveitamento: TStringField
      DisplayLabel = 'Aproveitamento'
      FieldName = 'aproveitamento'
      Origin = 'WMESTRE12.fichaindividual.aproveitamento'
      FixedChar = True
      Size = 1
    end
    object tblHistoricoDescDisciplina: TStringField
      DisplayLabel = 'Descri'#231#227'o da Disciplina'
      FieldKind = fkLookup
      FieldName = 'DescDisciplina'
      LookupDataSet = tblDisciplina
      LookupKeyFields = 'codigo'
      LookupResultField = 'descricao'
      KeyFields = 'disciplina'
      Size = 50
      Lookup = True
    end
    object tblHistoricomediafinal: TFloatField
      DisplayLabel = 'M'#233'dia Final'
      FieldName = 'mediafinal'
      DisplayFormat = '0.00'
      EditFormat = '0.00'
    end
    object tblHistoricoanosemestre: TSmallintField
      DisplayLabel = 'Ano/Sem.'
      FieldName = 'anosemestre'
      DisplayFormat = '0000/0'
    end
    object tblHistoricosituacao: TSmallintField
      FieldName = 'situacao'
    end
    object tblHistoricocarga_horaria: TFloatField
      FieldName = 'carga_horaria'
    end
    object tblHistoricograu: TSmallintField
      FieldName = 'grau'
    end
    object tblHistoricocodigograde: TStringField
      FieldName = 'codigograde'
      Size = 30
    end
    object tblHistoricosimbolo_obs: TStringField
      FieldName = 'simbolo_obs'
      Size = 5
    end
    object tblHistoricodescSituacao: TStringField
      FieldKind = fkLookup
      FieldName = 'descSituacao'
      LookupDataSet = DM.tblSituacoes
      LookupKeyFields = 'cd_situacao'
      LookupResultField = 'ds_situacao'
      KeyFields = 'situacao'
      Size = 30
      Lookup = True
    end
    object tblHistoricofrequencia: TFloatField
      FieldName = 'frequencia'
      DisplayFormat = '0.00'
      EditFormat = '0.00'
    end
    object tblHistoricods_media: TStringField
      FieldName = 'ds_media'
      Size = 10
    end
    object tblHistoricototalfaltas: TFloatField
      FieldName = 'totalfaltas'
    end
    object tblHistoricocodigoescola: TIntegerField
      DisplayLabel = 'C'#243'd. Escola'
      FieldName = 'codigoescola'
      Origin = 'WMESTRE12.fichaindividual.codigoescola'
    end
    object tblHistoricodescEscola: TStringField
      FieldKind = fkLookup
      FieldName = 'descEscola'
      LookupDataSet = DM.tblInstituicoes
      LookupKeyFields = 'cd_instituicao'
      LookupResultField = 'nm_instituicao_formatado'
      KeyFields = 'codigoescola'
      Size = 200
      Lookup = True
    end
  end
  object dsHistorico: TDataSource
    DataSet = tblHistorico
    OnStateChange = dsHistoricoStateChange
    OnDataChange = dsHistoricoDataChange
    Left = 688
    Top = 160
  end
  object ImageList1: TImageList
    Left = 440
    Top = 488
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
  object tblDisciplina: TUMZQuery
    Connection = DM.db
    SQL.Strings = (
      'select * from disciplinas where curso = :curso'
      'order by descricao')
    Params = <
      item
        DataType = ftString
        Name = 'curso'
        ParamType = ptUnknown
      end>
    Left = 656
    Top = 192
    ParamData = <
      item
        DataType = ftString
        Name = 'curso'
        ParamType = ptUnknown
      end>
    object tblDisciplinacodigo: TIntegerField
      FieldName = 'codigo'
      Origin = 'WMESTRE12.disciplinas.codigo'
    end
    object tblDisciplinacurso: TStringField
      FieldName = 'curso'
      Origin = 'WMESTRE12.disciplinas.curso'
      Size = 15
    end
    object tblDisciplinasigla: TStringField
      FieldName = 'sigla'
      Origin = 'WMESTRE12.disciplinas.sigla'
      Size = 10
    end
    object tblDisciplinadescricao: TStringField
      FieldName = 'descricao'
      Origin = 'WMESTRE12.disciplinas.descricao'
      Size = 50
    end
  end
  object ImageList2: TImageList
    Left = 440
    Top = 456
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
  object tblObsHistorico: TUMZQuery
    Connection = DM.db
    OnNewRecord = tblObsHistoricoNewRecord
    SQL.Strings = (
      'select * from historico_obs'
      'where codigoaluno = :codigoaluno and curso = :curso')
    Params = <
      item
        DataType = ftInteger
        Name = 'codigoaluno'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'curso'
        ParamType = ptUnknown
      end>
    Left = 728
    Top = 96
    ParamData = <
      item
        DataType = ftInteger
        Name = 'codigoaluno'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'curso'
        ParamType = ptUnknown
      end>
    object tblObsHistoricocurso: TStringField
      FieldName = 'curso'
      Required = True
      Size = 15
    end
    object tblObsHistoricoobservacao: TMemoField
      FieldName = 'observacao'
      BlobType = ftMemo
    end
    object tblObsHistoricocodigoaluno: TLargeintField
      FieldName = 'codigoaluno'
      Required = True
    end
  end
  object dsObs: TDataSource
    DataSet = tblObsHistorico
    OnStateChange = dsObsStateChange
    OnDataChange = dsObsDataChange
    Left = 760
    Top = 96
  end
  object tblColegiosGrau1: TUMZQuery
    Connection = DM.db
    AfterOpen = tblColegiosGrau1AfterOpen
    OnFilterRecord = tblColegiosGrau1FilterRecord
    OnNewRecord = tblColegiosGrau1NewRecord
    SQL.Strings = (
      'select * from historico_escolas_grau where '
      'grau = 1 and codigoaluno = :codigoaluno'
      'order by grau')
    Params = <
      item
        DataType = ftInteger
        Name = 'codigoaluno'
        ParamType = ptUnknown
      end>
    Left = 729
    Top = 128
    ParamData = <
      item
        DataType = ftInteger
        Name = 'codigoaluno'
        ParamType = ptUnknown
      end>
    object tblColegiosGrau1codigoaluno: TLargeintField
      FieldName = 'codigoaluno'
      Required = True
    end
    object tblColegiosGrau1grau: TSmallintField
      FieldName = 'grau'
      Required = True
    end
    object tblColegiosGrau1ano: TIntegerField
      FieldName = 'ano'
    end
    object tblColegiosGrau1ds_escola: TStringField
      FieldName = 'ds_escola'
      Size = 150
    end
    object tblColegiosGrau1ds_escola_cidade: TStringField
      FieldName = 'ds_escola_cidade'
      Size = 40
    end
    object tblColegiosGrau1ds_escola_estado: TStringField
      FieldName = 'ds_escola_estado'
      Size = 2
    end
    object tblColegiosGrau1cd_instituicao: TLargeintField
      FieldName = 'cd_instituicao'
    end
    object tblColegiosGrau1ds_curso: TStringField
      FieldName = 'ds_curso'
      Size = 100
    end
    object tblColegiosGrau1NR_MES_CONCLUSAO: TSmallintField
      FieldName = 'NR_MES_CONCLUSAO'
    end
  end
  object dsColegiosGrau1: TDataSource
    DataSet = tblColegiosGrau1
    OnStateChange = dsColegiosGrau1StateChange
    OnDataChange = dsColegiosGrau1DataChange
    Left = 760
    Top = 128
  end
  object tblColegiosGrau2: TUMZQuery
    Connection = DM.db
    AfterOpen = tblColegiosGrau2AfterOpen
    OnNewRecord = tblColegiosGrau2NewRecord
    SQL.Strings = (
      'select * from historico_escolas_grau where '
      'grau = 2 and codigoaluno = :codigoaluno'
      'order by grau')
    Params = <
      item
        DataType = ftInteger
        Name = 'codigoaluno'
        ParamType = ptUnknown
      end>
    Left = 729
    Top = 160
    ParamData = <
      item
        DataType = ftInteger
        Name = 'codigoaluno'
        ParamType = ptUnknown
      end>
    object tblColegiosGrau2codigoaluno: TLargeintField
      FieldName = 'codigoaluno'
      Required = True
    end
    object tblColegiosGrau2grau: TSmallintField
      FieldName = 'grau'
      Required = True
    end
    object tblColegiosGrau2ano: TIntegerField
      FieldName = 'ano'
    end
    object tblColegiosGrau2ds_escola: TStringField
      FieldName = 'ds_escola'
      Size = 150
    end
    object tblColegiosGrau2ds_escola_cidade: TStringField
      FieldName = 'ds_escola_cidade'
      Size = 40
    end
    object tblColegiosGrau2ds_escola_estado: TStringField
      FieldName = 'ds_escola_estado'
      Size = 2
    end
    object tblColegiosGrau2ds_curso: TStringField
      FieldName = 'ds_curso'
      Size = 100
    end
    object tblColegiosGrau2cd_instituicao: TLargeintField
      FieldName = 'cd_instituicao'
    end
    object tblColegiosGrau2NR_MES_CONCLUSAO: TSmallintField
      FieldName = 'NR_MES_CONCLUSAO'
    end
  end
  object dsColegiosGrau2: TDataSource
    DataSet = tblColegiosGrau2
    OnStateChange = dsColegiosGrau2StateChange
    OnDataChange = dsColegiosGrau2DataChange
    Left = 760
    Top = 160
  end
  object tblColegiosSeries: TUMZQuery
    Connection = DM.db
    BeforePost = tblColegiosSeriesBeforePost
    SQL.Strings = (
      'SELECT'
      '  codigoaluno,'
      '  grau,'
      '  serie,'
      '  ano,'
      '  ds_escola,'
      '  ds_escola_cidade,'
      '  ds_escola_estado,'
      '  ds_escola_observacao,'
      '  nr_dias_letivos,'
      '  nr_total_carga_horaria,'
      '  cd_instituicao,'
      '  nr_mes_inicio,'
      '  nr_ano_inicio,'
      '  nr_mes_conclusao,'
      '  CONCAT(nr_mes_inicio, '#39'/'#39', nr_ano_inicio) AS inicio,'
      '  CONCAT(nr_mes_conclusao, '#39'/'#39', ano) AS conclusao'
      'FROM historico_escolas_series'
      'WHERE'
      '  codigoaluno = :codigoaluno'
      'ORDER BY grau')
    Params = <
      item
        DataType = ftString
        Name = 'codigoaluno'
        ParamType = ptUnknown
        Value = '0'
      end>
    Left = 729
    Top = 192
    ParamData = <
      item
        DataType = ftString
        Name = 'codigoaluno'
        ParamType = ptUnknown
        Value = '0'
      end>
    object tblColegiosSeriescodigoaluno: TLargeintField
      FieldName = 'codigoaluno'
      Origin = 'WMESTRE12.historico_escolas_series.codigoaluno'
    end
    object tblColegiosSeriesgrau: TSmallintField
      DisplayLabel = 'Grau'
      FieldName = 'grau'
      Origin = 'WMESTRE12.historico_escolas_series.grau'
    end
    object tblColegiosSeriesserie: TSmallintField
      DisplayLabel = 'S'#233'rie'
      FieldName = 'serie'
      Origin = 'WMESTRE12.historico_escolas_series.serie'
    end
    object tblColegiosSeriesano: TSmallintField
      DisplayLabel = 'Ano'
      FieldName = 'ano'
      Origin = 'WMESTRE12.historico_escolas_series.ano'
    end
    object tblColegiosSeriesds_escola: TStringField
      DisplayLabel = 'Escola'
      DisplayWidth = 150
      FieldName = 'ds_escola'
      Origin = 'WMESTRE12.historico_escolas_series.ds_escola'
      FixedChar = True
      Size = 150
    end
    object tblColegiosSeriesds_escola_cidade: TStringField
      DisplayLabel = 'Cidade'
      FieldName = 'ds_escola_cidade'
      Origin = 'WMESTRE12.historico_escolas_series.ds_escola_cidade'
      FixedChar = True
      Size = 40
    end
    object tblColegiosSeriesds_escola_estado: TStringField
      DisplayLabel = 'Estado'
      FieldName = 'ds_escola_estado'
      Origin = 'WMESTRE12.historico_escolas_series.ds_escola_estado'
      FixedChar = True
      Size = 2
    end
    object tblColegiosSeriesds_escola_observacao: TStringField
      FieldName = 'ds_escola_observacao'
      Origin = 'WMESTRE12.historico_escolas_series.ds_escola_observacao'
      Size = 250
    end
    object tblColegiosSeriesNR_DIAS_LETIVOS: TLargeintField
      FieldName = 'NR_DIAS_LETIVOS'
    end
    object tblColegiosSeriesnr_total_carga_horaria: TFloatField
      FieldName = 'nr_total_carga_horaria'
      Origin = 'WMESTRE12.historico_escolas_series.nr_total_carga_horaria'
    end
    object tblColegiosSeriescd_instituicao: TLargeintField
      FieldName = 'cd_instituicao'
      Origin = 'WMESTRE12.historico_escolas_series.cd_instituicao'
    end
    object tblColegiosSeriesnr_mes_inicio: TSmallintField
      FieldName = 'nr_mes_inicio'
    end
    object tblColegiosSeriesnr_ano_inicio: TSmallintField
      FieldName = 'nr_ano_inicio'
    end
    object tblColegiosSeriesnr_mes_conclusao: TSmallintField
      FieldName = 'nr_mes_conclusao'
    end
    object tblColegiosSeriesconclusao: TStringField
      FieldName = 'conclusao'
    end
    object tblColegiosSeriesinicio: TStringField
      FieldName = 'inicio'
    end
  end
  object dsColegiosSeries: TDataSource
    DataSet = tblColegiosSeries
    OnStateChange = dsColegiosSeriesStateChange
    OnDataChange = dsColegiosSeriesDataChange
    Left = 760
    Top = 192
  end
  object qyVestibular: TUMZQuery
    Connection = DM.db
    AfterOpen = qyVestibularAfterOpen
    OnCalcFields = qyVestibularCalcFields
    OnNewRecord = qyVestibularNewRecord
    SQL.Strings = (
      'SELECT'
      '   *'
      'FROM'
      '   vestibular'
      'WHERE'
      '   codigoaluno = :cd_aluno'
      'AND curso = :curso')
    Params = <
      item
        DataType = ftInteger
        Name = 'cd_aluno'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'curso'
        ParamType = ptUnknown
      end>
    Left = 728
    Top = 224
    ParamData = <
      item
        DataType = ftInteger
        Name = 'cd_aluno'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'curso'
        ParamType = ptUnknown
      end>
    object qyVestibularanosemestre: TIntegerField
      FieldName = 'anosemestre'
      Origin = 'WMESTRE12.vestibular.anosemestre'
      DisplayFormat = '0000/0'
      EditFormat = '0000'
    end
    object qyVestibularnotaredacao: TFloatField
      FieldName = 'notaredacao'
      Origin = 'WMESTRE12.vestibular.notaredacao'
      DisplayFormat = '0.00'
    end
    object qyVestibularnotaprova: TFloatField
      FieldName = 'notaprova'
      Origin = 'WMESTRE12.vestibular.notaprova'
      DisplayFormat = '0.00'
    end
    object qyVestibularmedia: TFloatField
      FieldName = 'media'
      Origin = 'WMESTRE12.vestibular.media'
      DisplayFormat = '0.00'
    end
    object qyVestibularclassificacaogeral: TIntegerField
      FieldName = 'classificacaogeral'
      Origin = 'WMESTRE12.vestibular.classificacaogeral'
    end
    object qyVestibularclassificacaocurso: TIntegerField
      FieldName = 'classificacaocurso'
      Origin = 'WMESTRE12.vestibular.classificacaocurso'
    end
    object qyVestibularanosem: TStringField
      FieldKind = fkCalculated
      FieldName = 'anosem'
      Size = 6
      Calculated = True
    end
    object qyVestibularinstituicao: TStringField
      FieldKind = fkLookup
      FieldName = 'instituicao'
      LookupDataSet = DM.tblInstituicoes
      LookupKeyFields = 'cd_instituicao'
      LookupResultField = 'nm_instituicao_formatado'
      KeyFields = 'cd_instituicao'
      Size = 200
      Lookup = True
    end
    object qyVestibularnome: TStringField
      FieldName = 'nome'
      Origin = 'WMESTRE12.vestibular.nome'
      Size = 50
    end
    object qyVestibularcodigoaluno: TIntegerField
      FieldName = 'codigoaluno'
      Origin = 'WMESTRE12.vestibular.codigoaluno'
    end
    object qyVestibulards_resultado: TMemoField
      FieldName = 'ds_resultado'
      Origin = 'WMESTRE12.vestibular.ds_resultado'
      BlobType = ftMemo
    end
    object qyVestibulartipo: TStringField
      DisplayLabel = 'Forma/Descri'#231#227'o'
      FieldName = 'tipo'
      Origin = 'WMESTRE12.vestibular.tipo'
      Size = 40
    end
    object qyVestibularcd_instituicao: TLargeintField
      FieldName = 'cd_instituicao'
    end
    object qyVestibularcurso: TStringField
      FieldName = 'curso'
      Required = True
      Size = 255
    end
    object qyVestibularcurso_inscricao: TStringField
      FieldName = 'curso_inscricao'
      Size = 255
    end
    object qyVestibularcurso_nome: TStringField
      FieldKind = fkLookup
      FieldName = 'curso_nome'
      LookupDataSet = qyCursos
      LookupKeyFields = 'cd_curso'
      LookupResultField = 'ds_apelido'
      KeyFields = 'curso'
      Size = 100
      Lookup = True
    end
  end
  object dsVestibular: TDataSource
    DataSet = qyVestibular
    OnDataChange = dsVestibularDataChange
    Left = 760
    Top = 224
  end
  object pmQtdHistorico: TPopupMenu
    OnPopup = pmQtdHistoricoPopup
    Left = 688
    Top = 128
  end
  object pmQtdColegiosSeries: TPopupMenu
    OnPopup = pmQtdColegiosSeriesPopup
    Left = 727
    Top = 254
  end
  object pmQtdVersibular: TPopupMenu
    OnPopup = pmQtdVersibularPopup
    Left = 759
    Top = 254
  end
  object qryMaxAnosem: TUMZReadOnlyQuery
    Connection = DM.db
    SQL.Strings = (
      'SELECT'
      '   CAST(MAX(ANOSEMESTRE) AS NUMBER(9)) ANOSEMESTRE'
      'FROM'
      '   MATRICULAS'
      'WHERE'
      '   CURSO = :CD_CURSO AND'
      '   CODIGOALUNO = :CD_ALUNO')
    Params = <
      item
        DataType = ftUnknown
        Name = 'CD_CURSO'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'CD_ALUNO'
        ParamType = ptUnknown
      end>
    SQLList.Strings = (
      
        'mysql-5=SELECT'#13#10'   MAX(ANOSEMESTRE) ANOSEMESTRE'#13#10'FROM'#13#10'   MATRIC' +
        'ULAS'#13#10'WHERE'#13#10'   CURSO = :CD_CURSO AND'#13#10'   CODIGOALUNO = :CD_ALUN' +
        'O'
      
        'oracle=SELECT'#13#10'   CAST(MAX(ANOSEMESTRE) AS NUMBER(9)) ANOSEMESTR' +
        'E'#13#10'FROM'#13#10'   MATRICULAS'#13#10'WHERE'#13#10'   CURSO = :CD_CURSO AND'#13#10'   CODI' +
        'GOALUNO = :CD_ALUNO')
    Left = 48
    Top = 424
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'CD_CURSO'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'CD_ALUNO'
        ParamType = ptUnknown
      end>
    object qryMaxAnosemANOSEMESTRE: TIntegerField
      FieldName = 'ANOSEMESTRE'
      ReadOnly = True
    end
  end
  object qryInsertFicha: TUMZQuery
    Connection = DM.db
    SQL.Strings = (
      'INSERT INTO FICHAINDIVIDUAL'
      '('
      '                 CODIGOALUNO, '
      #9' CURSO, '
      #9' ANOSEMESTRE, '
      #9' SERIE, '
      #9' DISCIPLINA, '
      #9' CODIGOESCOLA, '
      #9' TURMA,'
      #9' SITUACAO, '
      #9' GRAU, '
      #9' CODIGOGRADE'
      ')'
      'SELECT '
      #9':CD_ALUNO CODIGOLAUNO,'
      #9':CD_CURSO CURSO, '
      #9':NR_ANOSEMESTRE ANOSEMESTRE, '
      #9'NR_SERIE SERIE, '
      #9'GD.CD_DISCIPLINA, '
      #9':CD_ESCOLA ESCOLA, '
      #9#39'HISTORICO'#39' TURMA,'
      #9'0 SITUACAO,'
      #9':NR_GRAU GRAU, '
      #9#39#39' CODIGOGRADE'
      'FROM'
      #9'cursos_mestre cm'
      
        #9'INNER JOIN cursos_coligadas as cc ON (cc.CD_CURSO = cm.CD_CURSO' +
        ' )'
      
        #9'INNER JOIN GRADES G ON (G.cd_grade= cc.CD_GRADE AND G.CD_CURSO ' +
        '= cc.CD_CURSO)'
      
        #9'INNER JOIN GRADES_DISCIPLINAS GD ON (GD.CD_GRADE = G.CD_GRADE A' +
        'ND GD.CD_CURSO = G.CD_CURSO)'
      'WHERE'
      '  '#9'cm.CD_CURSO = :CD_CURSO AND GD.nr_serie = :nr_serie'
      'GROUP BY GD.CD_DISCIPLINA, GD.NR_SERIE')
    Params = <
      item
        DataType = ftUnknown
        Name = 'CD_ALUNO'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'CD_CURSO'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'NR_ANOSEMESTRE'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'CD_ESCOLA'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'NR_GRAU'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'NR_SERIE'
        ParamType = ptUnknown
      end>
    Left = 48
    Top = 456
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'CD_ALUNO'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'CD_CURSO'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'NR_ANOSEMESTRE'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'CD_ESCOLA'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'NR_GRAU'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'NR_SERIE'
        ParamType = ptUnknown
      end>
  end
  object qryInsertHist: TUMZQuery
    Connection = DM.db
    SQL.Strings = (
      'REPLACE INTO HISTORICO_ESCOLAS_SERIES'
      
        '   (CODIGOALUNO, GRAU, SERIE, ANO, DS_ESCOLA, DS_ESCOLA_CIDADE, ' +
        'DS_ESCOLA_ESTADO)'
      'SELECT DISTINCT'
      '   :CD_ALUNO CODIGOALUNO,'
      '   :NR_GRAU GRAU,'
      '   :NR_SERIE SERIE,'
      '   :NR_ANO ANO,'
      '   NM_INSTITUICAO,'
      '   DS_CIDADE,'
      '   DS_ESTADO'
      'FROM'
      '   INSTITUICOES_ENSINO'
      'WHERE'
      '   CD_INSTITUICAO = :CD_INSTITUICAO')
    Params = <
      item
        DataType = ftUnknown
        Name = 'CD_ALUNO'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'NR_GRAU'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'NR_SERIE'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'NR_ANO'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'CD_INSTITUICAO'
        ParamType = ptUnknown
      end>
    SQLList.Strings = (
      
        'mysql-5=REPLACE INTO HISTORICO_ESCOLAS_SERIES'#13#10'   (CODIGOALUNO, ' +
        'GRAU, SERIE, ANO, DS_ESCOLA, DS_ESCOLA_CIDADE, DS_ESCOLA_ESTADO)' +
        #13#10'SELECT DISTINCT'#13#10'   :CD_ALUNO CODIGOALUNO,'#13#10'   :NR_GRAU GRAU,'#13 +
        #10'   :NR_SERIE SERIE,'#13#10'   :NR_ANO ANO,'#13#10'   NM_INSTITUICAO,'#13#10'   DS' +
        '_CIDADE,'#13#10'   DS_ESTADO'#13#10'FROM'#13#10'   INSTITUICOES_ENSINO'#13#10'WHERE'#13#10'   ' +
        'CD_INSTITUICAO = :CD_INSTITUICAO'
      
        'oracle=MERGE INTO HISTORICO_ESCOLAS_SERIES H USING'#13#10'('#13#10'  SELECT ' +
        'DISTINCT'#13#10'     :CD_ALUNO CODIGOALUNO,'#13#10'     :NR_GRAU GRAU,'#13#10'    ' +
        ' :NR_SERIE SERIE,'#13#10'     :NR_ANO ANO,'#13#10'     NM_INSTITUICAO,'#13#10'    ' +
        ' DS_CIDADE,'#13#10'     DS_ESTADO'#13#10'  FROM'#13#10'     INSTITUICOES_ENSINO'#13#10' ' +
        ' WHERE'#13#10'     CD_INSTITUICAO = :CD_INSTITUICAO'#13#10') UP ON'#13#10'   (H.CO' +
        'DIGOALUNO = UP.CODIGOALUNO AND'#13#10'    H.GRAU = UP.GRAU AND'#13#10'    H.' +
        'SERIE = UP.SERIE)'#13#10'WHEN MATCHED THEN'#13#10'   UPDATE SET'#13#10'      H.ANO' +
        ' = UP.ANO,'#13#10'      H.DS_ESCOLA = UP.NM_INSTITUICAO,'#13#10'      H.DS_E' +
        'SCOLA_CIDADE = UP.DS_CIDADE,'#13#10'      H.DS_ESCOLA_ESTADO = UP.DS_E' +
        'STADO'#13#10'WHEN NOT MATCHED THEN'#13#10'   INSERT'#13#10'      (H.CODIGOALUNO, H' +
        '.GRAU, H.SERIE, H.ANO, H.DS_ESCOLA, H.DS_ESCOLA_CIDADE,'#13#10'       ' +
        'H.DS_ESCOLA_ESTADO)'#13#10'   VALUES'#13#10'      (UP.CODIGOALUNO, UP.GRAU, ' +
        'UP.SERIE, UP.ANO, UP.NM_INSTITUICAO, UP.DS_CIDADE,'#13#10'       UP.DS' +
        '_ESTADO)')
    Left = 48
    Top = 488
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'CD_ALUNO'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'NR_GRAU'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'NR_SERIE'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'NR_ANO'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'CD_INSTITUICAO'
        ParamType = ptUnknown
      end>
  end
  object qryColegiosGrau3: TUMZQuery
    Connection = DM.db
    AfterOpen = qryColegiosGrau3AfterOpen
    OnFilterRecord = qryColegiosGrau3FilterRecord
    OnNewRecord = qryColegiosGrau3NewRecord
    SQL.Strings = (
      'select * from historico_escolas_grau where '
      'grau = 3 and codigoaluno = :codigoaluno'
      'order by grau')
    Params = <
      item
        DataType = ftInteger
        Name = 'codigoaluno'
        ParamType = ptUnknown
      end>
    Left = 657
    Top = 96
    ParamData = <
      item
        DataType = ftInteger
        Name = 'codigoaluno'
        ParamType = ptUnknown
      end>
    object qryColegiosGrau3codigoaluno: TLargeintField
      FieldName = 'codigoaluno'
      Required = True
    end
    object qryColegiosGrau3grau: TSmallintField
      FieldName = 'grau'
      Required = True
    end
    object qryColegiosGrau3ano: TIntegerField
      FieldName = 'ano'
      Required = True
    end
    object qryColegiosGrau3ds_escola: TStringField
      FieldName = 'ds_escola'
      Size = 150
    end
    object qryColegiosGrau3ds_escola_cidade: TStringField
      FieldName = 'ds_escola_cidade'
      Required = True
      Size = 40
    end
    object qryColegiosGrau3ds_escola_estado: TStringField
      FieldName = 'ds_escola_estado'
      Required = True
      Size = 2
    end
    object qryColegiosGrau3ds_curso: TStringField
      FieldName = 'ds_curso'
      Size = 100
    end
    object qryColegiosGrau3cd_instituicao: TLargeintField
      FieldName = 'cd_instituicao'
    end
    object qryColegiosGrau3NR_MES_CONCLUSAO: TSmallintField
      FieldName = 'NR_MES_CONCLUSAO'
    end
  end
  object dsColegiosGrau3: TDataSource
    DataSet = qryColegiosGrau3
    OnStateChange = dsColegiosGrau3StateChange
    OnDataChange = dsColegiosGrau3DataChange
    Left = 688
    Top = 96
  end
  object qyCursos: TUMZQuery
    Connection = DM.db
    SQL.Strings = (
      'SELECT'
      '   *'
      'FROM'
      '   cursos_mestre')
    Params = <>
    Left = 728
    Top = 64
    object qyCursoscd_curso: TStringField
      FieldName = 'cd_curso'
      Size = 100
    end
    object qyCursosds_curso: TStringField
      FieldName = 'ds_curso'
    end
    object qyCursosds_apelido: TStringField
      FieldName = 'ds_apelido'
      Size = 100
    end
  end
end
