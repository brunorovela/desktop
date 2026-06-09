object frmMatriculas: TfrmMatriculas
  Left = 147
  Top = 137
  Caption = 'Matr'#237'culas'
  ClientHeight = 518
  ClientWidth = 965
  Color = clBtnFace
  Font.Charset = ANSI_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Arial'
  Font.Style = []
  FormStyle = fsMDIChild
  KeyPreview = True
  OldCreateOrder = True
  Position = poScreenCenter
  ShowHint = True
  Visible = True
  WindowState = wsMaximized
  OnClose = FormClose
  OnCreate = FormCreate
  OnDestroy = FormDestroy
  OnKeyDown = FormKeyDown
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 14
  object Bevel4: TBevel
    Left = 0
    Top = 25
    Width = 965
    Height = 10
    Align = alTop
    Shape = bsSpacer
    ExplicitWidth = 867
  end
  object Bevel6: TBevel
    Left = 0
    Top = 35
    Width = 8
    Height = 401
    Align = alLeft
    Shape = bsSpacer
    ExplicitHeight = 406
  end
  object Bevel7: TBevel
    Left = 958
    Top = 35
    Width = 7
    Height = 401
    Align = alRight
    Shape = bsSpacer
    ExplicitLeft = 860
    ExplicitHeight = 406
  end
  object ultimoseparador: TBevel
    Left = 0
    Top = 436
    Width = 965
    Height = 10
    Align = alBottom
    Shape = bsSpacer
    ExplicitTop = 441
    ExplicitWidth = 867
  end
  object PageControl1: TPageControl
    Left = 8
    Top = 35
    Width = 950
    Height = 401
    ActivePage = tabAlunos
    Align = alClient
    TabOrder = 0
    OnChange = PageControl1Change
    object tabAlunos: TTabSheet
      Caption = 'Alunos'
      object grd: TZSortedGrid
        Left = 0
        Top = 0
        Width = 942
        Height = 372
        Align = alClient
        DataSource = dtcMatriculas
        Options = [dgTitles, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgConfirmDelete, dgCancelOnExit]
        PopupMenu = pmQtdMatriculas
        TabOrder = 0
        TitleFont.Charset = ANSI_CHARSET
        TitleFont.Color = clWindowText
        TitleFont.Height = -11
        TitleFont.Name = 'Arial'
        TitleFont.Style = []
        OnDblClick = grdDblClick
        OnKeyDown = grdKeyDown
        Columns = <
          item
            Expanded = False
            FieldName = 'nr_aluno'
            Width = 20
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'CODIGOALUNO'
            Width = 63
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'Nome'
            Width = 200
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'TurmaCalc'
            Width = 87
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'AnoSemestre'
            Width = 55
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'dataemissao'
            Title.Caption = 'Dt.Entrada'
            Width = 75
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'DataSaida'
            Width = 63
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'QualSituacao'
            Width = 50
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'ds_ingresso'
            Width = 110
            Visible = True
          end>
      end
    end
    object tabDisciplinas: TTabSheet
      Caption = 'Disciplinas'
      object Splitter1: TSplitter
        Left = 426
        Top = 0
        Width = 1
        Height = 372
        ExplicitHeight = 377
      end
      object Panel1: TPanel
        Left = 0
        Top = 0
        Width = 426
        Height = 372
        Align = alLeft
        BevelOuter = bvNone
        TabOrder = 0
        object grdDisci: TDBGrid
          Left = 0
          Top = 25
          Width = 426
          Height = 347
          Align = alClient
          DataSource = dtcMatriculas
          Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgConfirmDelete, dgCancelOnExit]
          PopupMenu = pmQtdMatriculas
          TabOrder = 0
          TitleFont.Charset = ANSI_CHARSET
          TitleFont.Color = clWindowText
          TitleFont.Height = -11
          TitleFont.Name = 'Arial'
          TitleFont.Style = []
          OnColExit = grdDisciColExit
          OnKeyDown = grdKeyDown
          OnTitleClick = grdDisciTitleClick
          Columns = <
            item
              Expanded = False
              FieldName = 'CODIGOALUNO'
              Width = 59
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'Nome'
              Width = 169
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'TurmaCalc'
              Width = 95
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'AnoSemestre'
              Width = 55
              Visible = True
            end>
        end
        object Panel2: TPanel
          Left = 0
          Top = 0
          Width = 426
          Height = 25
          Align = alTop
          BevelOuter = bvLowered
          Caption = 'ALUNOS'
          TabOrder = 1
        end
      end
      object Panel4: TPanel
        Left = 427
        Top = 0
        Width = 515
        Height = 372
        Align = alClient
        BevelOuter = bvNone
        TabOrder = 1
        object Panel5: TPanel
          Left = 0
          Top = 0
          Width = 515
          Height = 25
          Align = alTop
          BevelOuter = bvLowered
          Caption = 'DISCIPLINAS'
          TabOrder = 0
        end
        object DBGrid2: TDBGrid
          Left = 0
          Top = 25
          Width = 515
          Height = 321
          Align = alClient
          DataSource = dtcFichaIndividual
          PopupMenu = pmQtdFichaIndividual
          ReadOnly = True
          TabOrder = 1
          TitleFont.Charset = ANSI_CHARSET
          TitleFont.Color = clWindowText
          TitleFont.Height = -11
          TitleFont.Name = 'Arial'
          TitleFont.Style = []
          OnCellClick = DBGrid2CellClick
          OnDrawColumnCell = DBGrid2DrawColumnCell
          Columns = <
            item
              DropDownRows = 10
              Expanded = False
              FieldName = 'Sigla'
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'DescricaoDisciplina'
              Width = 255
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'DescricaoSituacao'
              Width = 50
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'dt_saida'
              Width = 63
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'Turma'
              Width = 91
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'nr_creditos_academicos'
              Width = 40
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'nr_aulas_mask'
              Width = 55
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'VL_VALOR'
              Width = 40
              Visible = True
            end
            item
              Alignment = taCenter
              Expanded = False
              FieldName = 'sn_possui_compl_calc'
              Width = 40
              Visible = True
            end
            item
              Alignment = taCenter
              Expanded = False
              FieldName = 'sn_possui_adap_calc'
              Width = 60
              Visible = True
            end
            item
              Alignment = taCenter
              Expanded = False
              FieldName = 'sn_possui_depen_calc'
              Width = 60
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'nm_grupo'
              Visible = False
            end
            item
              Expanded = False
              FieldName = 'nm_disciplina_generica'
              Visible = False
            end>
        end
        object Panel10: TPanel
          Left = 0
          Top = 346
          Width = 515
          Height = 26
          Align = alBottom
          BevelOuter = bvLowered
          TabOrder = 2
          object Label1: TLabel
            Left = 5
            Top = 6
            Width = 119
            Height = 14
            Caption = 'Totais (Disciplina ativas):'
          end
          object lblHR_A: TLabel
            Left = 280
            Top = 6
            Width = 25
            Height = 14
            Caption = 'Hr/A:'
          end
          object lblCR_F: TLabel
            Left = 369
            Top = 6
            Width = 31
            Height = 14
            Caption = 'Cr/Fin:'
          end
          object lblCH: TLabel
            Left = 470
            Top = 6
            Width = 23
            Height = 14
            Caption = 'C.H.:'
          end
          object lblDisciplinas: TLabel
            Left = 136
            Top = 6
            Width = 77
            Height = 14
            Caption = 'Qtd. Disciplinas:'
          end
          object DBText1: TDBText
            Left = 219
            Top = 6
            Width = 40
            Height = 14
            AutoSize = True
            DataField = 'QTD_DISCIPLINAS'
            DataSource = dtcResumoFicha
          end
          object DBText2: TDBText
            Left = 311
            Top = 6
            Width = 40
            Height = 14
            AutoSize = True
            DataField = 'SOMA_CR_ACAD'
            DataSource = dtcResumoFicha
          end
          object DBText3: TDBText
            Left = 406
            Top = 6
            Width = 40
            Height = 14
            AutoSize = True
            DataField = 'SOMA_CR_FINAN'
            DataSource = dtcResumoFicha
          end
          object DBText4: TDBText
            Left = 499
            Top = 6
            Width = 40
            Height = 14
            AutoSize = True
            DataField = 'SOMA_CH'
            DataSource = dtcResumoFicha
          end
        end
      end
    end
    object tsDoc: TTabSheet
      Caption = 'Documenta'#231#227'o'
      ImageIndex = 2
      object Splitter2: TSplitter
        Left = 392
        Top = 0
        Height = 372
        ExplicitHeight = 377
      end
      object Panel6: TPanel
        Left = 0
        Top = 0
        Width = 392
        Height = 372
        Align = alLeft
        BevelOuter = bvNone
        TabOrder = 0
        object grdDoc: TDBGrid
          Left = 0
          Top = 25
          Width = 392
          Height = 347
          Align = alClient
          BorderStyle = bsNone
          DataSource = dtcMatriculas
          Options = [dgTitles, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgAlwaysShowSelection, dgConfirmDelete, dgCancelOnExit]
          PopupMenu = pmQtdMatriculas
          TabOrder = 0
          TitleFont.Charset = ANSI_CHARSET
          TitleFont.Color = clWindowText
          TitleFont.Height = -11
          TitleFont.Name = 'Arial'
          TitleFont.Style = []
          OnKeyDown = grdKeyDown
          OnTitleClick = grdDocTitleClick
          Columns = <
            item
              Expanded = False
              FieldName = 'CODIGOALUNO'
              Width = 60
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'Nome'
              Width = 169
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'TurmaCalc'
              Width = 90
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'AnoSemestre'
              Width = 50
              Visible = True
            end>
        end
        object Panel8: TPanel
          Left = 0
          Top = 0
          Width = 392
          Height = 25
          Align = alTop
          BevelOuter = bvLowered
          Caption = 'ALUNOS'
          TabOrder = 1
        end
      end
      object pgDocumentos: TPageControl
        Left = 395
        Top = 0
        Width = 547
        Height = 372
        ActivePage = TabSheet1
        Align = alClient
        TabOrder = 1
        OnChange = pgDocumentosChange
        object TabSheet1: TTabSheet
          Caption = 'Curso'
          object Panel7: TPanel
            Left = 0
            Top = 0
            Width = 539
            Height = 343
            Align = alClient
            BevelOuter = bvNone
            TabOrder = 0
            object Bevel3: TBevel
              Left = 345
              Top = -5
              Width = 5
              Height = 297
              Style = bsRaised
            end
            object DBGrid4: TDBGrid
              Left = 0
              Top = 25
              Width = 539
              Height = 318
              Align = alClient
              BorderStyle = bsNone
              DataSource = dtcDoc
              Options = [dgTitles, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgAlwaysShowSelection, dgConfirmDelete, dgCancelOnExit]
              PopupMenu = popDocumentacao
              TabOrder = 0
              TitleFont.Charset = ANSI_CHARSET
              TitleFont.Color = clWindowText
              TitleFont.Height = -11
              TitleFont.Name = 'Arial'
              TitleFont.Style = []
              OnDblClick = DBGrid4DblClick
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
                  Width = 160
                  Visible = True
                end
                item
                  Expanded = False
                  FieldName = 'dt_entrega'
                  Title.Caption = 'Data Entrega'
                  Width = 90
                  Visible = True
                end
                item
                  Expanded = False
                  FieldName = 'observacao'
                  Title.Caption = 'Observa'#231#227'o'
                  Width = 114
                  Visible = True
                end
                item
                  Alignment = taCenter
                  Expanded = False
                  FieldName = 'sn_obrigatorio'
                  Title.Alignment = taCenter
                  Title.Caption = 'Obrig.'
                  Width = 30
                  Visible = True
                end
                item
                  Alignment = taCenter
                  Expanded = False
                  FieldName = 'nr_grupo'
                  Title.Caption = 'Grupo'
                  Width = 30
                  Visible = True
                end
                item
                  Alignment = taCenter
                  Expanded = False
                  FieldName = 'Digitalizou'
                  Title.Alignment = taCenter
                  Title.Caption = 'Dig'
                  Visible = True
                end>
            end
            object Panel9: TPanel
              Left = 0
              Top = 0
              Width = 539
              Height = 25
              Align = alTop
              BevelOuter = bvLowered
              Caption = 'DOCUMENTA'#199#195'O PARA O CURSO'
              TabOrder = 1
            end
          end
        end
        object TabSheet2: TTabSheet
          Caption = 'Todos'
          ImageIndex = 1
          object Panel11: TPanel
            Left = 0
            Top = 0
            Width = 539
            Height = 343
            Align = alClient
            BevelOuter = bvNone
            TabOrder = 0
            object Bevel1: TBevel
              Left = 345
              Top = -5
              Width = 5
              Height = 297
              Style = bsRaised
            end
            object DBGrid1: TDBGrid
              Left = 0
              Top = 25
              Width = 539
              Height = 318
              Align = alClient
              BorderStyle = bsNone
              DataSource = dtcDoc
              Options = [dgTitles, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgAlwaysShowSelection, dgConfirmDelete, dgCancelOnExit]
              PopupMenu = popDocumentacao
              TabOrder = 0
              TitleFont.Charset = ANSI_CHARSET
              TitleFont.Color = clWindowText
              TitleFont.Height = -11
              TitleFont.Name = 'Arial'
              TitleFont.Style = []
              OnDblClick = DBGrid4DblClick
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
                  Width = 160
                  Visible = True
                end
                item
                  Expanded = False
                  FieldName = 'dt_entrega'
                  Title.Caption = 'Data Entrega'
                  Width = 90
                  Visible = True
                end
                item
                  Expanded = False
                  FieldName = 'observacao'
                  Title.Caption = 'Observa'#231#227'o'
                  Width = 114
                  Visible = True
                end
                item
                  Alignment = taCenter
                  Expanded = False
                  FieldName = 'sn_obrigatorio'
                  Title.Alignment = taCenter
                  Title.Caption = 'Obrig.'
                  Width = 30
                  Visible = True
                end
                item
                  Alignment = taCenter
                  Expanded = False
                  FieldName = 'nr_grupo'
                  Title.Caption = 'Grupo'
                  Width = 30
                  Visible = True
                end
                item
                  Alignment = taCenter
                  Expanded = False
                  FieldName = 'Digitalizou'
                  Title.Alignment = taCenter
                  Title.Caption = 'Dig'
                  Visible = True
                end>
            end
            object Panel12: TPanel
              Left = 0
              Top = 0
              Width = 539
              Height = 25
              Align = alTop
              BevelOuter = bvLowered
              Caption = 'TODOS DOCUMENTOS'
              TabOrder = 1
            end
          end
        end
      end
    end
  end
  object Panel3: TPanel
    Left = 0
    Top = 0
    Width = 965
    Height = 25
    Align = alTop
    BevelOuter = bvLowered
    Caption = 'MATR'#205'CULAS'
    Color = clBlue
    Font.Charset = ANSI_CHARSET
    Font.Color = clWhite
    Font.Height = -12
    Font.Name = 'Arial'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 1
  end
  object ToolBar3: TToolBar
    Left = 0
    Top = 436
    Width = 965
    Height = 0
    Align = alBottom
    AutoSize = True
    ButtonWidth = 43
    Caption = 'ToolBar1'
    Images = ImageList1
    List = True
    ShowCaptions = True
    TabOrder = 2
    object ToolButton9: TToolButton
      Left = 0
      Top = 0
      Width = 8
      Caption = 'ToolButton1'
      Style = tbsSeparator
    end
    object ToolButton12: TToolButton
      Left = 8
      Top = 0
      Width = 8
      Caption = 'ToolButton4'
      ImageIndex = 1
      Style = tbsSeparator
    end
  end
  object toolDoc: TToolBar
    Left = 0
    Top = 446
    Width = 965
    Height = 24
    Align = alBottom
    ButtonWidth = 109
    Caption = 'ToolBar1'
    Images = ImageList1
    List = True
    ShowCaptions = True
    TabOrder = 3
    Visible = False
    object ToolButton10: TToolButton
      Left = 0
      Top = 0
      Width = 6
      Caption = 'ToolButton1'
      Style = tbsSeparator
    end
    object DBNavigator2: TDBNavigator
      Left = 6
      Top = 0
      Width = 96
      Height = 22
      DataSource = dtcMatriculas
      VisibleButtons = [nbFirst, nbPrior, nbNext, nbLast]
      Flat = True
      Hints.Strings = (
        'Primeiro'
        'Anterior'
        'Pr'#243'ximo'
        #218'ltimo')
      TabOrder = 0
      Visible = False
    end
    object btnMarcar: TToolButton
      Left = 102
      Top = 0
      Hint = 'Marcar o documento como entregue'
      AutoSize = True
      Caption = 'F3 - &Marcar'
      OnClick = btnMarcarClick
    end
    object btnDesmarcar: TToolButton
      Left = 169
      Top = 0
      Hint = 'Desmarcar a entrega do documento'
      AutoSize = True
      Caption = 'F4 - De&smarcar'
      OnClick = btnDesmarcarClick
    end
    object ToolButton2: TToolButton
      Left = 255
      Top = 0
      Width = 20
      Caption = 'ToolButton2'
      ImageIndex = 3
      Style = tbsSeparator
    end
    object btnIncluirDoc: TToolButton
      Left = 275
      Top = 0
      Hint = 'Incluir um documento extra'
      AutoSize = True
      Caption = 'F2 Incluir'
      ImageIndex = 3
      OnClick = btnIncluirDocClick
    end
    object btnExcluirDoc: TToolButton
      Left = 349
      Top = 0
      Hint = 'Excluir o documento selecionado'
      AutoSize = True
      Caption = 'Excluir'
      ImageIndex = 4
      OnClick = btnExcluirDocClick
    end
    object ToolButton4: TToolButton
      Left = 412
      Top = 0
      Width = 20
      Caption = 'ToolButton4'
      ImageIndex = 3
      Style = tbsSeparator
    end
    object btnObsDoc: TToolButton
      Left = 432
      Top = 0
      Hint = 'Aplicar observa'#231#245'es sobre o documento'
      AutoSize = True
      Caption = 'F5 - Observa'#231#227'o'
      OnClick = btnObsDocClick
    end
    object btnDigitalizar: TToolButton
      Left = 525
      Top = 0
      Hint = 'Digitalizar o documento selecionado'
      AutoSize = True
      Caption = 'F6 - Digitalizar'
      OnClick = btnDigitalizarClick
    end
    object ToolButton3: TToolButton
      Left = 604
      Top = 0
      Width = 20
      Caption = 'ToolButton3'
      ImageIndex = 3
      Style = tbsSeparator
    end
    object btnImpDoc: TToolButton
      Left = 624
      Top = 0
      Hint = 'Imprimir o documento'
      AutoSize = True
      Caption = ' Imprimir'
      ImageIndex = 1
      Visible = False
      OnClick = btnImpDocClick
    end
    object ToolButton6: TToolButton
      Left = 694
      Top = 0
      Hint = 'Exportar os documentos para arquivo'
      AutoSize = True
      Caption = 'Exportar...'
      ImageIndex = 5
      OnClick = ToolButton6Click
    end
    object ToolButton11: TToolButton
      Left = 774
      Top = 0
      Width = 8
      Caption = 'ToolButton11'
      ImageIndex = 3
      Style = tbsSeparator
    end
    object btnFecharDoc: TToolButton
      Left = 782
      Top = 0
      Hint = 'Fechar a planilha de matr'#237'culas'
      AutoSize = True
      Caption = 'F12 Fechar'
      ImageIndex = 2
      OnClick = btnFecharDocClick
    end
  end
  object toolDisciplinas: TToolBar
    Left = 0
    Top = 470
    Width = 965
    Height = 24
    Align = alBottom
    ButtonWidth = 167
    Caption = 'toolDisciplinas'
    Images = ImageList1
    List = True
    ShowCaptions = True
    TabOrder = 4
    Visible = False
    object ToolButton1: TToolButton
      Left = 0
      Top = 0
      Width = 6
      Caption = 'ToolButton1'
      Style = tbsSeparator
    end
    object btnTurmas: TToolButton
      Left = 6
      Top = 0
      Hint = 'Buscar uma turma'
      AutoSize = True
      Caption = 'F9 Turma'
      ImageIndex = 0
      OnClick = btnTurmasClick
    end
    object btnAlunos: TToolButton
      Left = 82
      Top = 0
      Hint = 'Buscar um aluno'
      AutoSize = True
      Caption = 'F8 Aluno'
      ImageIndex = 0
      OnClick = btnAlunosClick
    end
    object btnAlterarSituacaoDisciplina: TToolButton
      Left = 155
      Top = 0
      Hint = 'Alterar a situa'#231#227'o da disciplina'
      AutoSize = True
      Caption = 'Alterar situa'#231#227'o da Disciplina'
      OnClick = btnAlterarSituacaoDisciplinaClick
    end
    object btnMatricularGrade: TToolButton
      Left = 306
      Top = 0
      Hint = 'Matricular a grade para toda a turma'
      AutoSize = True
      Caption = 'Matricular &Grade'
      OnClick = btnMatricularGradeClick
    end
    object btnMatricularDisc: TToolButton
      Left = 397
      Top = 0
      Hint = 'Matricular disciplina para o aluno selecionado'
      AutoSize = True
      Caption = '&Matricular Disciplina'
      DropdownMenu = popMatricularDisciplina
    end
    object btnRemover: TToolButton
      Left = 503
      Top = 0
      Hint = 'Remover a disciplina selecionada'
      AutoSize = True
      Caption = '&Remover Disc.'
      DropdownMenu = popRemoverDisciplina
    end
    object btnImprimir: TToolButton
      Left = 584
      Top = 0
      AutoSize = True
      Caption = ' Imprimir'
      ImageIndex = 1
      Visible = False
      OnClick = btnImprimirClick
    end
    object btnObservacao: TToolButton
      Left = 654
      Top = 0
      AutoSize = True
      Caption = 'F5 -Observa'#231#227'o'
      OnClick = btnObservacaoClick
    end
    object sbSelecionarColunaDisc: TSpeedButton
      Left = 744
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
      ParentShowHint = False
      ShowHint = True
      OnClick = sbSelecionarColunaDiscClick
    end
    object SpeedButton6: TToolButton
      Left = 769
      Top = 0
      Hint = 'Fechar a planilha de matr'#237'culas'
      AutoSize = True
      Caption = 'F12 Fechar'
      ImageIndex = 2
      OnClick = SpeedButton6Click
    end
  end
  object toolAlunos1: TToolBar
    Left = 0
    Top = 494
    Width = 965
    Height = 24
    Align = alBottom
    ButtonWidth = 110
    Caption = 'ToolBar1'
    Images = ImageList1
    List = True
    ShowCaptions = True
    TabOrder = 5
    object ToolButton5: TToolButton
      Left = 0
      Top = 0
      Width = 6
      Caption = 'ToolButton1'
      Style = tbsSeparator
    end
    object btnFiltroData: TToolButton
      Left = 6
      Top = 0
      Caption = 'F10 Data entrada'
      ImageIndex = 0
      OnClick = btnFiltroDataClick
    end
    object SpeedButton2: TToolButton
      Left = 116
      Top = 0
      Hint = 'Buscar uma turma'
      AutoSize = True
      Caption = 'F9 Turma'
      ImageIndex = 0
      OnClick = btnTurmasClick
    end
    object SpeedButton1: TToolButton
      Left = 192
      Top = 0
      Hint = 'Buscar um aluno'
      AutoSize = True
      Caption = 'F8 Aluno'
      ImageIndex = 0
      OnClick = btnAlunosClick
    end
    object tbnBuscaDisciplina: TToolButton
      Left = 265
      Top = 0
      AutoSize = True
      Caption = 'F7 Disciplina'
      ImageIndex = 0
      OnClick = buscaDisciplina
    end
    object btnAlterarSituacaoMatriculas: TToolButton
      Left = 356
      Top = 0
      Hint = 'Alterar a situa'#231#227'o da matr'#237'cula'
      AutoSize = True
      Caption = 'Situa'#231#227'o'
      OnClick = btnAlterarSituacaoMatriculasClick
    end
    object btnTransferencias: TToolButton
      Left = 409
      Top = 0
      Hint = 'Transferir o aluno de turma ou de institui'#231#227'o'
      AutoSize = True
      Caption = 'Transfer'#234'ncia'
      OnClick = btnTransferenciasClick
    end
    object btnMotivos: TToolButton
      Left = 488
      Top = 0
      Hint = 'Visualizar motivos de cancelamentos ou transfer'#234'ncias'
      AutoSize = True
      Caption = '&Motivo'
      OnClick = btnMotivosClick
    end
    object btnObs: TToolButton
      Left = 530
      Top = 0
      Hint = 'Aplicar observa'#231#245'es de secretaria'
      AutoSize = True
      Caption = 'Observa'#231#245'es'
      OnClick = btnObsClick
    end
    object btnFormaIngresso: TToolButton
      Left = 607
      Top = 0
      Hint = 'Alterar informa'#231#245'es de ingresso'
      AutoSize = True
      Caption = '&Alt. Matr'#237'cula'
      OnClick = btnFormaIngressoClick
    end
    object btnOutrasAcoes: TToolButton
      Left = 680
      Top = 0
      Hint = 'Outras a'#231#245'es para o aluno selecionado'
      AutoSize = True
      Caption = 'Mais A'#231#245'es'
      DropdownMenu = popOutrasAcoes
    end
    object btnRenumerar: TToolButton
      Left = 747
      Top = 0
      Hint = 'Re-organizar a turma e aplicar numera'#231#227'o de matr'#237'cula'
      AutoSize = True
      Caption = 'Re-Numerar'
      OnClick = btnRenumerarClick
    end
    object sbSelecionarColuna: TSpeedButton
      Left = 816
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
      ParentShowHint = False
      ShowHint = True
      OnClick = sbSelecionarColunaClick
    end
    object SpeedButton3: TToolButton
      Left = 841
      Top = 0
      Hint = 'Fechar a planilha de matr'#237'culas'
      AutoSize = True
      Caption = 'F12 Fechar'
      ImageIndex = 2
      OnClick = SpeedButton3Click
    end
  end
  object dtcMatriculas: TDataSource
    DataSet = tblMatriculas
    OnDataChange = dtcMatriculasDataChange
    Left = 688
    Top = 296
  end
  object qryUpdate: TUMZQuery
    Connection = DM.db
    SQL.Strings = (
      'update Mensalidades '
      'set Situacao = :Situacao'
      'where'
      'CodigoAluno = :CodigoAluno and'
      'Turma = :Turma and'
      'AnoSemestre = :AnoSemestre and'
      'Situacao = 2 and'
      'DataVencimento >= :DataVencimento and'
      'Parcela <= 20')
    Params = <
      item
        DataType = ftInteger
        Name = 'Situacao'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'CodigoAluno'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'Turma'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'AnoSemestre'
        ParamType = ptUnknown
      end
      item
        DataType = ftDateTime
        Name = 'DataVencimento'
        ParamType = ptUnknown
      end>
    Left = 624
    Top = 264
    ParamData = <
      item
        DataType = ftInteger
        Name = 'Situacao'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'CodigoAluno'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'Turma'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'AnoSemestre'
        ParamType = ptUnknown
      end
      item
        DataType = ftDateTime
        Name = 'DataVencimento'
        ParamType = ptUnknown
      end>
  end
  object qryAlterarTurma: TUMZQuery
    Connection = DM.db
    SQL.Strings = (
      'update Mensalidades '
      'set Turma = :NovaTurma'
      'where'
      'CodigoAluno = :CodigoAluno and'
      'Turma = :Turma and'
      'AnoSemestre = :AnoSemestre')
    Params = <
      item
        DataType = ftString
        Name = 'NovaTurma'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'CodigoAluno'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'Turma'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'AnoSemestre'
        ParamType = ptUnknown
      end>
    Left = 592
    Top = 264
    ParamData = <
      item
        DataType = ftString
        Name = 'NovaTurma'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'CodigoAluno'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'Turma'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'AnoSemestre'
        ParamType = ptUnknown
      end>
  end
  object qryCancelar: TUMZQuery
    Connection = DM.db
    SQL.Strings = (
      'delete from Mensalidades'
      'where'
      'CodigoAluno = :CodigoAluno and'
      'Turma = :Turma and'
      'AnoSemestre = :AnoSemestre')
    Params = <
      item
        DataType = ftInteger
        Name = 'CodigoAluno'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'Turma'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'AnoSemestre'
        ParamType = ptUnknown
      end>
    Left = 560
    Top = 264
    ParamData = <
      item
        DataType = ftInteger
        Name = 'CodigoAluno'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'Turma'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'AnoSemestre'
        ParamType = ptUnknown
      end>
  end
  object qryReativar: TUMZQuery
    Connection = DM.db
    SQL.Strings = (
      'update Mensalidades'
      'set Situacao = 2'
      'where '
      'CodigoAluno = :CodigoAluno and'
      'Turma = :Turma and'
      'AnoSemestre = :AnoSemestre and'
      'Situacao = :Situacao')
    Params = <
      item
        DataType = ftInteger
        Name = 'CodigoAluno'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'Turma'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'AnoSemestre'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'Situacao'
        ParamType = ptUnknown
      end>
    Left = 528
    Top = 264
    ParamData = <
      item
        DataType = ftInteger
        Name = 'CodigoAluno'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'Turma'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'AnoSemestre'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'Situacao'
        ParamType = ptUnknown
      end>
  end
  object qryPendentes: TUMZQuery
    Connection = DM.db
    SQL.Strings = (
      'select CodigoAluno, Situacao, DataVencimento from [Mensalidades]'
      'where'
      'CodigoAluno = :CodigoAluno and '
      'Situacao = 2')
    Params = <
      item
        DataType = ftInteger
        Name = 'CodigoAluno'
        ParamType = ptUnknown
      end>
    Left = 496
    Top = 264
    ParamData = <
      item
        DataType = ftInteger
        Name = 'CodigoAluno'
        ParamType = ptUnknown
      end>
  end
  object tblMatriculas: TUMZQuery
    Connection = DM.db
    SortedFields = 'AnoSemestre'
    OnCalcFields = tblMatriculasCalcFields
    SQL.Strings = (
      'SELECT'
      
        '  matriculas.*, pessoas.nm_pessoa as nome, matriculas_ingresso.d' +
        's_ingresso,  matriculas_curso.*,'
      
        '  situacoes.ds_valor dsSituacao, situacoes.ds_sigla dsSituacaoSi' +
        'gla,'
      
        '  CASE WHEN matriculas.sn_matricula_internet = 0 THEN pes_matric' +
        'ulou.nm_pessoa ELSE '#39'INTERNET'#39' END nm_pessoa_matriculou,'
      
        '  CASE WHEN M.situacao = 8 THEN CASE WHEN ((Select curso from ma' +
        'triculas m2 where m2.cd_turma_anterior = M.turma AND m2.anosemes' +
        'tre = M.anosemestre AND m2.codigoaluno = M.codigoaluno) = M.curs' +
        'o) OR'
      
        '  ((Select curso from matriculas m2 where m2.cd_turma_anterior =' +
        ' M.turma AND m2.anosemestre = M.anosemestre AND m2.codigoaluno =' +
        ' M.codigoaluno) is null) THEN M.situacao ELSE '#39'-8'#39' END ELSE M.si' +
        'tuacao END AS CD_SITUACAO_ALTERADO,'
      '  departamentos.codigo AS cd_departamento'
      'FROM'
      
        '  matriculas INNER JOIN pessoas ON (matriculas.codigoaluno = pes' +
        'soas.cd_pessoa)'
      
        '  LEFT JOIN pessoas pes_matriculou ON (matriculas.cd_pessoa_matr' +
        'iculou = pes_matriculou.cd_pessoa)'
      
        '  LEFT JOIN matriculas_ingresso ON (matriculas.cd_ingresso = mat' +
        'riculas_ingresso.cd_ingresso)'
      
        '  LEFT JOIN matriculas_curso ON (matriculas.cd_matricula_curso =' +
        ' matriculas_curso.cd_matricula_curso)'
      
        '  LEFT JOIN situacoes ON (matriculas_curso.cd_situacao = situaco' +
        'es.cd_situacao AND situacoes.cd_modulo = 1019)'
      
        '  LEFT JOIN departamentos ON ( turmas.cd_coligada = departamento' +
        's.cd_coligada )'
      'WHERE DataEmissao = :DataEmissao')
    Params = <
      item
        DataType = ftUnknown
        Name = 'DataEmissao'
        ParamType = ptUnknown
      end>
    IndexFieldNames = 'AnoSemestre Asc'
    SQLList.Strings = (
      
        'oracle=select matriculas.*, pessoas.nm_pessoa as nome, matricula' +
        's_ingresso.ds_ingresso,  matriculas_curso.*, situacoes.ds_valor ' +
        'dsSituacao, situacoes.ds_sigla dsSituacaoSigla'#13#10'From '#13#10'  matricu' +
        'las INNER JOIN pessoas ON (matriculas.codigoaluno = pessoas.cd_p' +
        'essoa)'#13#10'  LEFT JOIN matriculas_ingresso ON (matriculas.cd_ingres' +
        'so = matriculas_ingresso.cd_ingresso)'#13#10'  LEFT JOIN matriculas_cu' +
        'rso ON (matriculas.cd_matricula_curso = matriculas_curso.cd_matr' +
        'icula_curso)'#13#10'  LEFT JOIN situacoes ON (matriculas_curso.cd_situ' +
        'acao = situacoes.cd_situacao AND situacoes.cd_modulo = 1019)'#13#10'WH' +
        'ERE TO_CHAR(DataEmissao, '#39'YYYY-MM-DD'#39') = :DataEmissao'
      
        'mysql-5=select '#13#10'   matriculas.*, pessoas.nm_pessoa as nome, mat' +
        'riculas_ingresso.ds_ingresso,  matriculas_curso.*, '#13#10'   situacoe' +
        's.ds_valor dsSituacao, situacoes.ds_sigla dsSituacaoSigla, '#13#10'   ' +
        'CASE WHEN matriculas.sn_matricula_internet = 0 THEN pes_matricul' +
        'ou.nm_pessoa ELSE '#39'INTERNET'#39' END nm_pessoa_matriculou, '#13#10'   CASE' +
        ' WHEN M.situacao = 8 THEN CASE WHEN ((Select curso from matricul' +
        'as m2 where m2.cd_turma_anterior = M.turma AND m2.anosemestre = ' +
        'M.anosemestre AND m2.codigoaluno = M.codigoaluno) = M.curso) OR'#13 +
        #10'   ((Select curso from matriculas m2 where m2.cd_turma_anterior' +
        ' = M.turma AND m2.anosemestre = M.anosemestre AND m2.codigoaluno' +
        ' = M.codigoaluno) is null) THEN M.situacao ELSE -8 END ELSE M.si' +
        'tuacao END AS CD_SITUACAO_ALTERADO'#13#10'From '#13#10'  matriculas INNER JO' +
        'IN pessoas ON (matriculas.codigoaluno = pessoas.cd_pessoa)'#13#10'  LE' +
        'FT JOIN pessoas pes_matriculou ON (matriculas.cd_pessoa_matricul' +
        'ou = pes_matriculou.cd_pessoa)'#13#10'  LEFT JOIN matriculas_ingresso ' +
        'ON (matriculas.cd_ingresso = matriculas_ingresso.cd_ingresso)'#13#10' ' +
        ' LEFT JOIN matriculas_curso ON (matriculas.cd_matricula_curso = ' +
        'matriculas_curso.cd_matricula_curso)'#13#10'  LEFT JOIN situacoes ON (' +
        'matriculas_curso.cd_situacao = situacoes.cd_situacao AND situaco' +
        'es.cd_modulo = 1019)'#13#10'WHERE date_format(DataEmissao, '#39'%Y-%m-%d'#39')' +
        ' = :DataEmissao')
    Left = 688
    Top = 264
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'DataEmissao'
        ParamType = ptUnknown
      end>
    object tblMatriculasCODIGOALUNO: TIntegerField
      Tag = 1
      DisplayLabel = 'Cod.Aluno'
      FieldName = 'CODIGOALUNO'
      Origin = 'Matriculas.CodigoAluno'
      DisplayFormat = '00000-0'
    end
    object tblMatriculasTurma: TStringField
      Alignment = taCenter
      DisplayWidth = 50
      FieldName = 'Turma'
      Origin = 'Matriculas.Turma'
      Size = 50
    end
    object tblMatriculasAnoSemestre: TSmallintField
      Tag = 1
      Alignment = taCenter
      DisplayLabel = 'Ano/Sem.'
      DisplayWidth = 7
      FieldName = 'AnoSemestre'
      Origin = 'Matriculas.CodigoAluno'
      DisplayFormat = '0000/0'
    end
    object tblMatriculasDataEmissao: TDateTimeField
      Tag = 1
      DisplayLabel = 'Dt.Emiss'#227'o'
      DisplayWidth = 10
      FieldName = 'dataemissao'
      Origin = 'Matriculas.DataEmissao'
      DisplayFormat = 'dd/mm/yyyy hh:nn:ss'
    end
    object tblMatriculasUsuario: TStringField
      Tag = 1
      DisplayLabel = 'Usu'#225'rio'
      DisplayWidth = 10
      FieldName = 'Usuario'
      Origin = 'Matriculas.Usuario'
      Size = 30
    end
    object tblMatriculasnr_aluno: TSmallintField
      Tag = 1
      DisplayLabel = 'N'#186
      DisplayWidth = 3
      FieldName = 'nr_aluno'
    end
    object tblMatriculasPlanoPagamento: TIntegerField
      DisplayLabel = 'Pl.Pagto.'
      FieldName = 'PlanoPagamento'
      Origin = 'Matriculas.PlanoPagamento'
    end
    object tblMatriculasSituacao: TSmallintField
      FieldName = 'Situacao'
      Origin = 'Matriculas.Situacao'
    end
    object tblMatriculasDataSaida: TDateTimeField
      Tag = 1
      DisplayLabel = 'Dt.Sa'#237'da'
      DisplayWidth = 10
      FieldName = 'DataSaida'
      Origin = 'Matriculas.DataSaida'
    end
    object tblMatriculasPlanoDesconto: TIntegerField
      FieldName = 'PlanoDesconto'
      Origin = 'Matriculas.PlanoDesconto'
    end
    object tblMatriculasnr_media_curso: TFloatField
      Tag = 1
      DisplayLabel = 'M'#233'd.Curso'
      FieldName = 'nr_media_curso'
    end
    object tblMatriculasNome: TStringField
      Tag = 1
      DisplayWidth = 40
      FieldName = 'Nome'
      Origin = 'Alunos.Nome'
      Size = 45
    end
    object tblMatriculasTurmaDependencia: TStringField
      DisplayWidth = 50
      FieldName = 'TurmaDependencia'
      Origin = 'Matriculas.CodigoAluno'
      Size = 50
    end
    object tblMatriculasTurmaCalc: TStringField
      Tag = 1
      Alignment = taCenter
      DisplayLabel = 'Turma'
      DisplayWidth = 50
      FieldKind = fkCalculated
      FieldName = 'TurmaCalc'
      Size = 50
      Calculated = True
    end
    object tblMatriculasCurso: TStringField
      Tag = 1
      DisplayLabel = 'Curso da Turma'
      DisplayWidth = 20
      FieldName = 'Curso'
      Origin = 'Matriculas.AnoSemestre'
    end
    object tblMatriculasImpresso: TStringField
      FieldName = 'Impresso'
      Origin = 'WMESTRE12.matriculas.Impresso'
      Size = 1
    end
    object tblMatriculascd_ingresso: TIntegerField
      FieldName = 'cd_ingresso'
      Origin = 'WMESTRE12.matriculas.cd_ingresso'
    end
    object tblMatriculasds_ingresso: TStringField
      Tag = 1
      DisplayLabel = 'Forma de Ingresso'
      DisplayWidth = 20
      FieldName = 'ds_ingresso'
      Size = 50
    end
    object tblMatriculasdiploma: TStringField
      FieldName = 'diploma'
      FixedChar = True
      Size = 1
    end
    object tblMatriculascd_instituicao_origem: TIntegerField
      FieldName = 'cd_instituicao_origem'
    end
    object tblMatriculascd_matricula: TStringField
      Tag = 1
      DisplayLabel = 'N'#186' Matr'#237'cula'
      DisplayWidth = 10
      FieldName = 'cd_matricula'
    end
    object tblMatriculasfrequencia_global: TFloatField
      Tag = 1
      DisplayLabel = '% Freq.'
      DisplayWidth = 5
      FieldName = 'frequencia_global'
      DisplayFormat = '0.00'
    end
    object tblMatriculascd_turno: TStringField
      Tag = 1
      DisplayLabel = 'Turno'
      DisplayWidth = 5
      FieldName = 'cd_turno'
      FixedChar = True
      Size = 1
    end
    object tblMatriculasdt_ingresso: TDateTimeField
      Tag = 1
      DisplayLabel = 'Dt Ingresso'
      DisplayWidth = 10
      FieldName = 'dt_ingresso'
    end
    object tblMatriculasdt_conclusao: TDateTimeField
      Tag = 1
      DisplayLabel = 'Dt Conclus'#227'o'
      DisplayWidth = 10
      FieldName = 'dt_conclusao'
    end
    object tblMatriculasdt_colacao: TDateTimeField
      Tag = 1
      DisplayLabel = 'Dt Cola'#231#227'o'
      DisplayWidth = 10
      FieldName = 'dt_colacao'
    end
    object tblMatriculasdt_exp_diploma: TDateTimeField
      Tag = 1
      DisplayLabel = 'Dt Exp Dip'
      DisplayWidth = 10
      FieldName = 'dt_exp_diploma'
    end
    object tblMatriculasdt_saida: TDateTimeField
      Tag = 1
      DisplayLabel = 'Dt Sa'#237'da'
      DisplayWidth = 10
      FieldName = 'dt_saida'
    end
    object tblMatriculasds_obs: TStringField
      Tag = 1
      DisplayLabel = 'Obs.'
      DisplayWidth = 30
      FieldName = 'ds_obs'
      Size = 150
    end
    object tblMatriculasdsSituacao: TStringField
      Tag = 1
      DisplayLabel = 'Situa'#231#227'o'
      DisplayWidth = 15
      FieldName = 'dsSituacao'
      Size = 255
    end
    object tblMatriculasdsSituacaoSigla: TStringField
      Tag = 1
      DisplayLabel = 'Sigla Sit. Curso'
      DisplayWidth = 6
      FieldName = 'dsSituacaoSigla'
      Size = 50
    end
    object tblMatriculascd_grade: TLargeintField
      Tag = 1
      DisplayLabel = 'Grade'
      FieldName = 'cd_grade'
    end
    object tblMatriculasnr_anosem_ingresso: TLargeintField
      Tag = 1
      DisplayLabel = 'Ingresso'
      FieldName = 'nr_anosem_ingresso'
    end
    object tblMatriculasnr_anosem_conclusao: TLargeintField
      Tag = 1
      DisplayLabel = 'Conclus'#227'o'
      DisplayWidth = 7
      FieldName = 'nr_anosem_conclusao'
    end
    object tblMatriculasNR_DIA_PGTO: TLargeintField
      FieldName = 'NR_DIA_PGTO'
    end
    object tblMatriculascd_matricula_curso: TLargeintField
      FieldName = 'cd_matricula_curso'
    end
    object tblMatriculasQualSituacao: TStringField
      Tag = 1
      DisplayLabel = 'Sit. Matr'#237'cula'
      FieldKind = fkLookup
      FieldName = 'QualSituacao'
      LookupDataSet = qrySituacaoMatricula
      LookupKeyFields = 'CD_SITUACAO'
      LookupResultField = 'DS_SIGLA_SITUACAO'
      KeyFields = 'CD_SITUACAO_ALTERADO'
      Lookup = True
    end
    object tblMatriculasSituacaoMatricula: TStringField
      FieldKind = fkLookup
      FieldName = 'SituacaoMatricula'
      LookupDataSet = qrySituacaoMatricula
      LookupKeyFields = 'CD_SITUACAO'
      LookupResultField = 'DS_SITUACAO'
      KeyFields = 'Situacao'
      Lookup = True
    end
    object tblMatriculasCD_SITUACAO_PAI: TIntegerField
      FieldKind = fkLookup
      FieldName = 'CD_SITUACAO_PAI'
      LookupDataSet = qrySituacaoMatricula
      LookupKeyFields = 'CD_SITUACAO'
      LookupResultField = 'CD_SITUACAO_PAI'
      KeyFields = 'Situacao'
      Lookup = True
    end
    object tblMatriculasnr_matricula: TStringField
      FieldName = 'nr_matricula'
    end
    object tblMatriculascd_curso: TStringField
      Tag = 1
      DisplayLabel = 'Curso do Aluno'
      DisplayWidth = 20
      FieldName = 'cd_curso'
      Required = True
    end
    object tblMatriculasnm_pessoa_matriculou: TStringField
      Tag = 1
      DisplayLabel = 'Matriculado por'
      DisplayWidth = 20
      FieldName = 'nm_pessoa_matriculou'
      Size = 255
    end
    object tblMatriculascd_turma_anterior: TStringField
      Tag = 1
      Alignment = taCenter
      DisplayLabel = 'Turma Anterior'
      FieldName = 'cd_turma_anterior'
      Size = 50
    end
    object tblMatriculasCD_SITUACAO_ALTERADO: TStringField
      FieldName = 'CD_SITUACAO_ALTERADO'
    end
  end
  object qryDelete: TUMZQuery
    Connection = DM.db
    SQL.Strings = (
      'delete from Matriculas where'
      'CodigoAluno = :CodigoAluno and'
      'Turma = :Turma and'
      'AnoSemestre = :AnoSemestre')
    Params = <
      item
        DataType = ftInteger
        Name = 'CodigoAluno'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'Turma'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'AnoSemestre'
        ParamType = ptUnknown
      end>
    Left = 464
    Top = 264
    ParamData = <
      item
        DataType = ftInteger
        Name = 'CodigoAluno'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'Turma'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'AnoSemestre'
        ParamType = ptUnknown
      end>
  end
  object qryCodigo: TUMZQuery
    Connection = DM.db
    Params = <>
    Left = 400
    Top = 264
  end
  object tblFichaIndividual: TUMZQuery
    Connection = DM.db
    OnCalcFields = tblFichaIndividualCalcFields
    SQL.Strings = (
      'SELECT'
      '   CAST(GROUP_CONCAT(dg.cd_grupo) AS CHAR(255)) as cd_grupo,'
      '   CAST(GROUP_CONCAT(dg.nm_grupo) AS CHAR(255)) as nm_grupo,'
      '   fio.serie nr_serie_generica,'
      '   fio.cd_disciplina_generica cd_disciplina_generica,'
      '   dop.descricao nm_disciplina_generica,'
      
        '   CASE WHEN LENGTH(COALESCE(fichaindividual.NR_CR_FIN, '#39#39')) > 0' +
        ' THEN fichaindividual.NR_CR_FIN ELSE grades_disciplinas.NR_AULAS' +
        ' END AS nr_aulas,'
      
        '   CASE WHEN LENGTH(COALESCE(fichaindividual.NR_CR_FIN, '#39#39')) > 0' +
        ' THEN TRUNCATE(fichaindividual.NR_CR_FIN,4) ELSE TRUNCATE(grades' +
        '_disciplinas.NR_AULAS,4) END AS nr_aulas_mask,'
      '   Disciplinas.*, FichaIndividual.*, grades_disciplinas.*,'
      '   CASE WHEN (turmas.codigo = :Turma) THEN 1 ELSE 2 END ord,'
      '   si.sn_final'
      'FROM'
      '   FichaIndividual'
      
        '   INNER JOIN Turmas ON (Turmas.Codigo = FichaIndividual.Turma A' +
        'ND Turmas.AnoSemestre = FichaIndividual.AnoSemestre )'
      
        '   INNER JOIN Disciplinas ON (FichaIndividual.Disciplina = Disci' +
        'plinas.Codigo AND FichaIndividual.Curso = Disciplinas.Curso)'
      
        '   INNER JOIN situacao si ON ('#9'si.cd_situacao = FichaIndividual.' +
        'situacao )'
      
        '   LEFT JOIN GRADES ON (GRADES.cd_grade = Turmas.cd_grade and Tu' +
        'rmas.curso = GRADES.CD_CURSO)'
      
        '   LEFT JOIN grades_disciplinas ON (grades_disciplinas.CD_GRADE ' +
        '= GRADES.CD_GRADE AND grades_disciplinas.CD_CURSO = FichaIndivid' +
        'ual.curso AND grades_disciplinas.CD_DISCIPLINA = FichaIndividual' +
        '.disciplina AND grades_disciplinas.NR_SERIE = turmas.serie)'
      
        '   LEFT JOIN diario_grupos_pessoas dgp ON (dgp.cd_pessoa = ficha' +
        'individual.codigoaluno AND dgp.dt_saida IS NULL)'
      '   LEFT JOIN diario_grupos dg ON ('
      '      dg.nr_anosemestre = fichaindividual.anosemestre'
      '      AND dg.cd_curso = fichaindividual.curso'
      '      AND dg.cd_turma = fichaindividual.turma'
      '      AND dg.cd_disciplina = fichaindividual.disciplina'
      '      AND dg.sn_ativo = 1'
      '      AND dg.cd_grupo = dgp.cd_grupo'
      '   )'
      '   LEFT JOIN fichaindividual_optativas fio ON ('
      '      fio.anosemestre = fichaindividual.anosemestre AND'
      '      fio.turma = fichaindividual.turma AND'
      '      fio.codigoaluno = fichaindividual.codigoaluno AND'
      '      fio.disciplina = fichaindividual.disciplina'
      '   )'
      
        '   LEFT JOIN disciplinas dop ON (fio.cd_disciplina_generica = do' +
        'p.codigo AND fichaindividual.curso = dop.curso)'
      'WHERE'
      '   FichaIndividual.CodigoAluno=:CodigoAluno AND'
      '   FichaIndividual.TurmaMatricula=:Turma AND'
      '   FichaIndividual.AnoSemestre=:AnoSemestre'
      'GROUP BY'
      '   FichaIndividual.anosemestre,'
      '   FichaIndividual.turma,'
      #9' FichaIndividual.codigoaluno,'
      #9' FichaIndividual.curso,'
      #9' FichaIndividual.disciplina'
      'ORDER BY'
      '   Disciplinas.ordem,'
      '   Disciplinas.descricao,'
      '   ord')
    Params = <
      item
        DataType = ftString
        Name = 'Turma'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'CodigoAluno'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'AnoSemestre'
        ParamType = ptUnknown
      end>
    Left = 432
    Top = 264
    ParamData = <
      item
        DataType = ftString
        Name = 'Turma'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'CodigoAluno'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'AnoSemestre'
        ParamType = ptUnknown
      end>
    object tblFichaIndividualCodigo: TSmallintField
      Tag = 1
      DisplayLabel = 'C'#243'digo'
      DisplayWidth = 5
      FieldName = 'Codigo'
      Origin = 'Disciplinas.Codigo'
    end
    object tblFichaIndividualSigla: TStringField
      Tag = 1
      DisplayWidth = 11
      FieldName = 'Sigla'
      Origin = 'Disciplinas.Sigla'
      Size = 10
    end
    object tblFichaIndividualDescricao: TStringField
      FieldName = 'Descricao'
      Origin = 'Disciplinas.Descricao'
      Size = 255
    end
    object tblFichaIndividualCodigoAluno: TIntegerField
      FieldName = 'CodigoAluno'
      Origin = 'FichaIndividual.CodigoAluno'
    end
    object tblFichaIndividualTurma: TStringField
      Tag = 1
      DisplayWidth = 15
      FieldName = 'Turma'
      Origin = 'FichaIndividual.Turma'
      Size = 50
    end
    object tblFichaIndividualAnoSemestre: TSmallintField
      FieldName = 'AnoSemestre'
      Origin = 'FichaIndividual.AnoSemestre'
    end
    object tblFichaIndividualNota1: TFloatField
      FieldName = 'Nota1'
      Origin = 'FichaIndividual.Nota1'
    end
    object tblFichaIndividualNota2: TFloatField
      FieldName = 'Nota2'
      Origin = 'FichaIndividual.Nota2'
    end
    object tblFichaIndividualNota3: TFloatField
      FieldName = 'Nota3'
      Origin = 'FichaIndividual.Nota3'
    end
    object tblFichaIndividualNota4: TFloatField
      FieldName = 'Nota4'
      Origin = 'FichaIndividual.Nota4'
    end
    object tblFichaIndividualNotaExame: TFloatField
      FieldName = 'NotaExame'
      Origin = 'FichaIndividual.NotaExame'
    end
    object tblFichaIndividualSituacao: TSmallintField
      DisplayLabel = 'Situa'#231#227'o'
      FieldName = 'Situacao'
      Origin = 'FichaIndividual.Situacao'
    end
    object tblFichaIndividualCurso: TStringField
      FieldName = 'Curso'
      Origin = 'GradeCurricular.Curso'
      Size = 15
    end
    object tblFichaIndividualSerie: TSmallintField
      FieldName = 'Serie'
      Origin = 'GradeCurricular.Serie'
    end
    object tblFichaIndividualDescricaoDisciplina: TStringField
      Tag = 1
      DisplayLabel = 'Disciplina'
      DisplayWidth = 42
      FieldKind = fkCalculated
      FieldName = 'DescricaoDisciplina'
      Size = 255
      Calculated = True
    end
    object tblFichaIndividualDescricaoSituacao: TStringField
      Tag = 1
      DisplayLabel = 'Situa'#231#227'o'
      DisplayWidth = 8
      FieldKind = fkCalculated
      FieldName = 'DescricaoSituacao'
      Size = 10
      Calculated = True
    end
    object tblFichaIndividualCodigoGrade: TStringField
      FieldName = 'CodigoGrade'
      Origin = 'Disciplinas.Codigo'
      Size = 50
    end
    object tblFichaIndividualTurmaMatricula: TStringField
      FieldName = 'TurmaMatricula'
      Origin = 'WMESTRE12.Disciplinas.Ementa'
      Size = 50
    end
    object tblFichaIndividualSegunda_Epoca: TFloatField
      FieldName = 'Segunda_Epoca'
      Origin = 'WMESTRE12.fichaindividual.Usuario'
    end
    object tblFichaIndividualdisciplina: TIntegerField
      FieldName = 'disciplina'
    end
    object tblFichaIndividualnr_creditos_academicos: TLargeintField
      Tag = 1
      DisplayLabel = 'Hr/A'
      DisplayWidth = 7
      FieldName = 'nr_creditos_academicos'
    end
    object tblFichaIndividualVL_VALOR: TFloatField
      Tag = 1
      DisplayLabel = 'C.H.'
      DisplayWidth = 7
      FieldName = 'VL_VALOR'
      DisplayFormat = '0.0'
    end
    object tblFichaIndividualnr_aulas: TFloatField
      FieldName = 'nr_aulas'
    end
    object tblFichaIndividualsn_possui_compl: TIntegerField
      FieldName = 'sn_possui_compl'
    end
    object tblFichaIndividualsn_possui_compl_calc: TStringField
      Tag = 1
      DisplayLabel = 'Compl.'
      DisplayWidth = 7
      FieldKind = fkCalculated
      FieldName = 'sn_possui_compl_calc'
      Calculated = True
    end
    object tblFichaIndividualsn_possui_adap: TSmallintField
      FieldName = 'sn_possui_adap'
    end
    object tblFichaIndividualsn_possui_depen: TSmallintField
      FieldName = 'sn_possui_depen'
    end
    object tblFichaIndividualsn_possui_adap_calc: TStringField
      Tag = 1
      DisplayLabel = 'Adapta'#231#227'o'
      DisplayWidth = 10
      FieldKind = fkCalculated
      FieldName = 'sn_possui_adap_calc'
      Size = 255
      Calculated = True
    end
    object tblFichaIndividualsn_possui_depen_calc: TStringField
      Tag = 1
      DisplayLabel = 'Depend'#234'ncia'
      DisplayWidth = 10
      FieldKind = fkCalculated
      FieldName = 'sn_possui_depen_calc'
      Size = 255
      Calculated = True
    end
    object tblFichaIndividualFalta1: TFloatField
      FieldName = 'Falta1'
    end
    object tblFichaIndividualFalta2: TFloatField
      FieldName = 'Falta2'
    end
    object tblFichaIndividualFalta3: TFloatField
      FieldName = 'Falta3'
    end
    object tblFichaIndividualFalta4: TFloatField
      FieldName = 'Falta4'
    end
    object tblFichaIndividualdt_saida: TDateTimeField
      Tag = 1
      DisplayLabel = 'Dt.Sa'#237'da'
      DisplayWidth = 10
      FieldName = 'dt_saida'
      DisplayFormat = 'dd/mm/yyyy'
    end
    object tblFichaIndividualNR_CR_FIN: TFloatField
      FieldName = 'NR_CR_FIN'
    end
    object tblFichaIndividualnr_aulas_mask: TFloatField
      Tag = 1
      DisplayLabel = 'CR.Fin.'
      DisplayWidth = 9
      FieldName = 'nr_aulas_mask'
    end
    object tblFichaIndividualnm_disciplina_generica: TStringField
      Tag = 1
      DisplayLabel = 'Disc. Gen'#233'rica'
      DisplayWidth = 42
      FieldName = 'nm_disciplina_generica'
      Size = 255
    end
    object tblFichaIndividualcd_disciplina_generica: TIntegerField
      FieldName = 'cd_disciplina_generica'
    end
    object tblFichaIndividualnr_serie_generica: TSmallintField
      FieldName = 'nr_serie_generica'
    end
    object tblFichaIndividualcd_grupo: TStringField
      FieldName = 'cd_grupo'
      ReadOnly = True
      Size = 255
    end
    object tblFichaIndividualnm_grupo: TStringField
      Tag = 1
      DisplayLabel = 'Grupo'
      FieldName = 'nm_grupo'
      ReadOnly = True
      Size = 255
    end
    object tblFichaIndividualsn_final: TIntegerField
      FieldName = 'sn_final'
    end
  end
  object dtcFichaIndividual: TDataSource
    DataSet = tblFichaIndividual
    OnDataChange = dtcFichaIndividualDataChange
    Left = 432
    Top = 296
  end
  object qryDeleteAluno: TUMZQuery
    Connection = DM.db
    SQL.Strings = (
      'delete from Alunos where Codigo = :CodigoAluno')
    Params = <
      item
        DataType = ftInteger
        Name = 'CodigoAluno'
        ParamType = ptUnknown
      end>
    Left = 368
    Top = 264
    ParamData = <
      item
        DataType = ftInteger
        Name = 'CodigoAluno'
        ParamType = ptUnknown
      end>
  end
  object qryFichaUpdate: TUMZQuery
    Connection = DM.db
    SQL.Strings = (
      'update FichaIndividual set Situacao = :Situacao '
      'where '
      'CodigoAluno = :CodigoAluno and'
      'Turma = :Turma and'
      'AnoSemestre = :AnoSemestre')
    Params = <
      item
        DataType = ftInteger
        Name = 'Situacao'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'CodigoAluno'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'Turma'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'AnoSemestre'
        ParamType = ptUnknown
      end>
    Left = 336
    Top = 264
    ParamData = <
      item
        DataType = ftInteger
        Name = 'Situacao'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'CodigoAluno'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'Turma'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'AnoSemestre'
        ParamType = ptUnknown
      end>
  end
  object qryFichaDelete: TUMZQuery
    Connection = DM.db
    SQL.Strings = (
      'delete from FichaIndividual'
      'where'
      'CodigoAluno = :CodigoAluno and'
      'TurmaMatricula = :Turma and'
      'AnoSemestre = :AnoSemestre')
    Params = <
      item
        DataType = ftInteger
        Name = 'CodigoAluno'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'Turma'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'AnoSemestre'
        ParamType = ptUnknown
      end>
    Left = 304
    Top = 264
    ParamData = <
      item
        DataType = ftInteger
        Name = 'CodigoAluno'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'Turma'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'AnoSemestre'
        ParamType = ptUnknown
      end>
  end
  object qryAlterarFicha: TUMZQuery
    Connection = DM.db
    SQL.Strings = (
      'update FichaIndividual'
      'set Turma = :NovaTurma'
      'where'
      'CodigoAluno = :CodigoAluno and'
      'Turma = :Turma and'
      'AnoSemestre = :AnoSemestre')
    Params = <
      item
        DataType = ftString
        Name = 'NovaTurma'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'CodigoAluno'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'Turma'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'AnoSemestre'
        ParamType = ptUnknown
      end>
    Left = 272
    Top = 264
    ParamData = <
      item
        DataType = ftString
        Name = 'NovaTurma'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'CodigoAluno'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'Turma'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'AnoSemestre'
        ParamType = ptUnknown
      end>
  end
  object qryReativarFicha: TUMZQuery
    Connection = DM.db
    SQL.Strings = (
      'update FichaIndividual'
      'set Situacao = 1, dt_saida = null'
      'where '
      'CodigoAluno = :CodigoAluno and'
      'turmamatricula = :Turma and'
      'AnoSemestre = :AnoSemestre and'
      'Situacao = :Situacao')
    Params = <
      item
        DataType = ftInteger
        Name = 'CodigoAluno'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'Turma'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'AnoSemestre'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'Situacao'
        ParamType = ptUnknown
      end>
    Left = 528
    Top = 296
    ParamData = <
      item
        DataType = ftInteger
        Name = 'CodigoAluno'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'Turma'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'AnoSemestre'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'Situacao'
        ParamType = ptUnknown
      end>
  end
  object qryAlterarDependencia: TUMZQuery
    Connection = DM.db
    SQL.Strings = (
      'update Matriculas'
      'set TurmaDependencia = :TurmaNova'
      'where'
      'CodigoAluno = :CodigoAluno and'
      'TurmaDependencia = :TurmaDependencia and'
      'AnoSemestre = :AnoSemestre')
    Params = <
      item
        DataType = ftString
        Name = 'TurmaNova'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'CodigoAluno'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'TurmaDependencia'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'AnoSemestre'
        ParamType = ptUnknown
      end>
    Left = 592
    Top = 296
    ParamData = <
      item
        DataType = ftString
        Name = 'TurmaNova'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'CodigoAluno'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'TurmaDependencia'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'AnoSemestre'
        ParamType = ptUnknown
      end>
  end
  object tblDoc: TUMZQuery
    Connection = DM.db
    OnCalcFields = tblDocCalcFields
    SQL.Strings = (
      'SELECT'
      '   dd.curso,'
      '   dd.sn_obrigatorio,'
      '   dd.nr_grupo, '
      '   d.codigo,'
      '   d.documento,'
      '   d.sigla,'
      '   da.apresentou,'
      '   da.observacao,'
      '   da.sn_digitalizado,'
      '   d.nr_dpi,'
      '   d.nr_largura,'
      '   d.nr_altura,'
      '   da.dt_entrega,'
      '  d.cd_siga'
      'FROM'
      '  documentos_alunos da'
      '  INNER JOIN pessoas pe ON (da.codigoaluno = pe.cd_pessoa)'
      
        '  LEFT OUTER JOIN documentos_necessarios dd ON (da.cod_documento' +
        ' = dd.cod_documento AND dd.curso = :curso)'
      '  INNER JOIN documentos d ON (da.cod_documento = d.codigo)'
      'WHERE'
      '  (da.codigoaluno = :codigoaluno)'
      '  AND (d.ds_sexo = '#39'A'#39' OR d.ds_sexo = pe.ds_sexo)'
      '  AND (d.cd_tipo_pessoa = 1 OR d.cd_tipo_pessoa = 2)'
      'ORDER BY'
      '  d.ordem, d.documento')
    Params = <
      item
        DataType = ftString
        Name = 'Curso'
        ParamType = ptUnknown
        Size = 6
      end
      item
        DataType = ftInteger
        Name = 'CodigoAluno'
        ParamType = ptUnknown
        Size = 4
      end>
    DataSource = dtcMatriculas
    Left = 200
    Top = 256
    ParamData = <
      item
        DataType = ftString
        Name = 'Curso'
        ParamType = ptUnknown
        Size = 6
      end
      item
        DataType = ftInteger
        Name = 'CodigoAluno'
        ParamType = ptUnknown
        Size = 4
      end>
    object tblDocCurso: TStringField
      FieldName = 'Curso'
      Origin = 'WMESTRE12.documentos_necessarios.Curso'
      Size = 15
    end
    object tblDocCodigo: TSmallintField
      FieldName = 'Codigo'
      Origin = 'WMESTRE12.documentos.Codigo'
    end
    object tblDocDocumento: TStringField
      FieldName = 'Documento'
      Origin = 'WMESTRE12.documentos.Documento'
      Size = 50
    end
    object tblDocSigla: TStringField
      FieldName = 'Sigla'
      Origin = 'WMESTRE12.documentos.Sigla'
      Size = 8
    end
    object tblDocExiste: TBooleanField
      FieldKind = fkCalculated
      FieldName = 'Existe'
      DisplayValues = 'X; '
      Calculated = True
    end
    object tblDocapresentou: TStringField
      FieldName = 'apresentou'
      FixedChar = True
      Size = 1
    end
    object tblDocobservacao: TStringField
      FieldName = 'observacao'
      FixedChar = True
      Size = 100
    end
    object tblDocsn_obrigatorio: TStringField
      DisplayLabel = 'Necess'#225'rio'
      FieldName = 'sn_obrigatorio'
      FixedChar = True
      Size = 1
    end
    object tblDocsn_digitalizado: TStringField
      FieldName = 'sn_digitalizado'
      FixedChar = True
      Size = 1
    end
    object tblDocDigitalizou: TBooleanField
      FieldKind = fkCalculated
      FieldName = 'Digitalizou'
      DisplayValues = 'X; '
      Calculated = True
    end
    object tblDocnr_dpi: TSmallintField
      FieldName = 'nr_dpi'
    end
    object tblDocnr_largura: TSmallintField
      FieldName = 'nr_largura'
    end
    object tblDocnr_altura: TSmallintField
      FieldName = 'nr_altura'
    end
    object tblDocnr_grupo: TIntegerField
      FieldName = 'nr_grupo'
    end
    object tblDocdt_entrega: TDateTimeField
      FieldName = 'dt_entrega'
      DisplayFormat = 'dd/mm/yyyy hh:nn'
    end
    object tblDoccd_siga: TIntegerField
      FieldName = 'cd_siga'
    end
  end
  object dtcDoc: TDataSource
    DataSet = tblDoc
    Left = 200
    Top = 288
  end
  object qAux: TUMZQuery
    Connection = DM.db
    Params = <>
    Left = 152
    Top = 256
  end
  object popSituacaoMatricula: TPopupMenu
    Left = 288
    Top = 173
    object ReativarMatrculaCursando1: TMenuItem
      Tag = 1
      Caption = 'Ativar Matr'#237'cula'
      OnClick = ReativarMatrculaCursando1Click
    end
    object CancelarMatrcula1: TMenuItem
      Tag = 3
      Caption = 'Cancelar Matr'#237'cula'
      OnClick = CancelarMatrcula1Click
    end
    object MarcarcomoReserva1: TMenuItem
      Tag = 10
      Caption = 'Marcar como Reserva'
      OnClick = CancelarMatrcula1Click
    end
    object RegistrarAbandono1: TMenuItem
      Tag = 6
      Caption = 'Registrar Abandono'
      OnClick = CancelarMatrcula1Click
    end
    object RegistrarDesistncia1: TMenuItem
      Tag = 5
      Caption = 'Registrar Desist'#234'ncia'
      OnClick = CancelarMatrcula1Click
    end
    object TrancarMatrcula1: TMenuItem
      Tag = 4
      Caption = 'Trancar Matr'#237'cula'
      OnClick = CancelarMatrcula1Click
    end
  end
  object popTransferencia: TPopupMenu
    Left = 333
    Top = 173
    object TransferenciaExterna1: TMenuItem
      Tag = 7
      Caption = 'Transfer'#234'ncia Externa'
      OnClick = CancelarMatrcula1Click
    end
    object rocadeTurma1: TMenuItem
      Caption = 'Transfer'#234'ncia de Turma'
      OnClick = rocadeTurma1Click
    end
    object ransfernciadeCurso1: TMenuItem
      Caption = 'Transfer'#234'ncia de Curso'
      OnClick = ranferenciadeCurso1Click
    end
  end
  object popSituacaoDisciplina: TPopupMenu
    Left = 397
    Top = 173
    object MenuItem1: TMenuItem
      Tag = 1
      Caption = 'Ativar Disciplina'
      OnClick = MenuItem1Click
    end
    object MenuItem2: TMenuItem
      Tag = 3
      Caption = 'Cancelar Disciplina'
      OnClick = MenuItem2Click
    end
    object MenuItem3: TMenuItem
      Tag = 10
      Caption = 'Marcar como Reserva'
      OnClick = MenuItem2Click
    end
    object MenuItem4: TMenuItem
      Tag = 6
      Caption = 'Registrar Abandono'
      OnClick = MenuItem2Click
    end
    object RegistrarDesistncia2: TMenuItem
      Tag = 5
      Caption = 'Registrar Desist'#234'ncia'
      OnClick = MenuItem2Click
    end
    object MenuItem5: TMenuItem
      Tag = 4
      Caption = 'Trancar Disciplina'
      OnClick = MenuItem2Click
    end
  end
  object ImageList1: TImageList
    Left = 61
    Top = 301
    Bitmap = {
      494C010106000900040010001000FFFFFFFFFF10FFFFFFFFFFFFFFFF424D3600
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
      000000000000000000000000B5000000B5000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000B5000000B5000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000B5000000B500000000000000000000000000842929008429
      2900B5848400B5848400B5848400B5848400B5848400B5848400B58484007B18
      1800842929000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000B5000000B5000000
      B500000000000000000000000000000000000000000000000000000000000000
      00000000B5000000B50000000000000000000000000084292900BD4A4A00B54A
      4A00DED6DE007B1010007B101000DEDEE700DEDEDE00DED6DE00BDBDBD007B10
      1000842929008429290000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000B5000000B5000000
      B5000000B5000000000000000000000000000000000000000000000000000000
      B5000000B5000000000000000000000000000000000084292900BD4A4A00B542
      4200DEDEDE007B1010007B101000DEDEDE00DEDEE700DEDEDE00BDBDBD007B10
      1000842929008429290000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000000000000000DE000000
      BD000000B5000000B500000000000000000000000000000000000000B5000000
      B500000000000000000000000000000000000000000084292900BD4A4A00B542
      4200DEDEDE007B1010007B101000DED6DE00DEDEE700DEDEDE00BDBDBD007B10
      1000842929008429290000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000B5000000B5000000B500000000000000B5000000B5000000B5000000
      0000000000000000000000000000000000000000000084292900BD4A4A00B542
      4200DEDEE700DEDEDE00DED6DE00DED6DE00DEDEDE00DEDEDE00BDBDBD007B10
      1000842929008429290000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000B5000000CE000000CE000000CE000000B500000000000000
      0000000000000000000000000000000000000000000084292900BD4A4A00BD4A
      4A00BD4A4A00B5525200B5525200BD4A4A00B54A4A00BD525200BD4A4A00B54A
      4A00BD4A4A008429290000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000C6000000C6000000DE0000000000000000000000
      0000000000000000000000000000000000000000000084292900A54A4A00B55A
      5A00BD848400BD948C00BD948C00BD948C00BD8C8C00BD8C8C00BD949400BD94
      9400BD4A4A008429290000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000B5000000DE000000CE000000DE000000E700000000000000
      0000000000000000000000000000000000000000000084292900BD4A4A00F7F7
      F700F7F7F700F7F7F700F7F7F700F7F7F700F7F7F700F7F7F700F7F7F700F7F7
      F700BD4A4A008429290000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000E7000000DE000000D60000000000000000000000E7000000EF000000
      0000000000000000000000000000000000000000000084292900BD4A4A00F7F7
      F700F7F7F700F7F7F700F7F7F700F7F7F700F7F7F700F7F7F700F7F7F700F7F7
      F700BD4A4A008429290000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      F7000000DE000000EF00000000000000000000000000000000000000F7000000
      F700000000000000000000000000000000000000000084292900BD4A4A00F7F7
      F700BDBDBD00BDBDBD00BDBDBD00BDBDBD00BDBDBD00BDBDBD00BDBDBD00F7F7
      F700BD4A4A008429290000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000000000000000F7000000
      F7000000F7000000000000000000000000000000000000000000000000000000
      F7000000F7000000000000000000000000000000000084292900BD4A4A00F7F7
      F700F7F7F700F7F7F700F7F7F700F7F7F700F7F7F700F7F7F700F7F7F700F7F7
      F700BD4A4A008429290000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000F7000000F7000000
      F700000000000000000000000000000000000000000000000000000000000000
      0000000000000000F70000000000000000000000000084292900BD4A4A00F7F7
      F700BDBDBD00BDBDBD00BDBDBD00BDBDBD00BDBDBD00BDBDBD00BDBDBD00F7F7
      F700BD4A4A008429290000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000F7000000F7000000F7000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000084292900BD4A4A00F7F7
      F700F7F7F700F7F7F700F7F7F700F7F7F700F7F7F700F7F7F700F7F7F700F7F7
      F700BD4A4A008429290000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000F7000000F700000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000084292900F7F7
      F700F7F7F700F7F7F700F7F7F700F7F7F700F7F7F700F7F7F700F7F7F700F7F7
      F700842929000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000088CBD00088CBD00088C
      BD00088CBD00088CBD00088CBD00088CBD00088CBD00088CBD0008841800088C
      BD00088CBD00088CBD0000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000088CBD00299CB50073CEF70084DE
      F70063CEF70063CEF70063CEF70063CEF70063CEF70063CEF700088418000884
      180039ADB500088CBD00000000000000000000000000FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF000000
      0000000000000000000000000000000000000000000000000000C6C6C600C6C6
      C600C6C6C600C6C6C600C6C6C600C6C6C600C6C6C600C6C6C600C6C6C6000000
      0000C6C6C6000000000000000000000000000000000000000000000000003163
      9C0031639C000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000088CBD0063CEF70039ADB5009CD6
      EF006BD6F7006BD6F7006BD6F7006BD6F7006BD6F7006BD6F7000884180031B5
      4A000884180084D6EF00088CBD000000000000000000FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF000000000000000000000000000000
      0000848484000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000C6C6C60000000000000000000052630031639C0031639C003163
      9C0031639C000000000000526300005263000052630000526300005263000052
      630000000000000000000000000000000000088CBD0073D6F700088CBD00B5DE
      E7007BD6F70008841800088418000884180008841800088418000884180031BD
      4A0031B54A0008841800088CBD000000000000000000FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF000000000084848400C6C6C600C6C6C6008484
      84000000000084848400000000000000000000000000C6C6C600C6C6C600C6C6
      C600C6C6C600C6C6C600C6C6C60000FFFF0000FFFF0000FFFF00C6C6C600C6C6
      C6000000000000000000000000000000000000526300316B9C00316B9C003163
      9C0031639C000000000000CEFF0000CEFF0000CEFF0000000000000000000000
      000000000000000000000000000000000000088CBD007BD6F7001894BD00ADC6
      9C00ADC69C00088418005ADE8C005ADE8C005ADE8C0052D68C0042B5520039BD
      520031BD4A0031B54A00088418000000000000000000FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF000000000084848400C6C6C600C6C6C600FFFF00008484
      84008484840000000000000000000000000000000000C6C6C600C6C6C600C6C6
      C600C6C6C600C6C6C600C6C6C600848484008484840084848400C6C6C600C6C6
      C60000000000C6C6C600000000000000000000526300296BA500296BA500296B
      9C00296B9C000000000000CEFF0000CEFF0000CEFF000000000000000000FF00
      000000000000000000000000000000000000088CBD0084D6F700528452007BBD
      F700FFEFDE00088418005ADE8C005ADE8C005ADE8C005ADE8C0052D68C0042B5
      520039BD520031BD4A0031B54A000884180000000000FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF0000000000C6C6C600C6C6C600C6C6C600C6C6C6008484
      8400C6C6C6000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000C6C6C600C6C6C60000000000005263002173AD002173A5002173
      A5002973A5000000000010CEFF0000CEFF0000CEFF0000000000FF000000FF00
      000000000000000000000000000000000000088CBD0084DEF700AD848400299C
      B500FFFFFF00088418005ADE8C005ADE8C005ADE8C005ADE8C005ADE8C0052D6
      8C0042B5520039BD520008841800088CBD0000000000FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF0000000000C6C6C600FFFF0000C6C6C600C6C6C6008484
      8400C6C6C60000000000000000000000000000000000C6C6C600C6C6C600C6C6
      C600C6C6C600C6C6C600C6C6C600C6C6C600C6C6C600C6C6C600C6C6C6000000
      0000C6C6C60000000000C6C6C6000000000000526300187BAD00187BAD00FFFF
      FF002173AD000000000031D6FF0029D6FF0018D6FF00FF000000FF000000FF00
      000000000000000000000000000000000000088CBD0094D6EF00AD847B001894
      BD00088CBD000884180008841800088418000884180008841800088418005ADE
      8C0052D68C0008841800088CBD00088CBD0000000000FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF000000000084848400FFFF0000FFFF0000C6C6C6008484
      8400848484000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000000000C6C6
      C60000000000C6C6C6000000000000000000005263001084B5001884B5001884
      B500187BB5000000000063DEFF0052DEFF00FF000000FF000000FF000000FF00
      0000FF000000FF000000FF00000000000000088CBD009CD6EF00AD848400FFEF
      DE00FFF7EF00FFEFDE00FFE7D600FFE7CE00FFE7CE00F7DEC600088418005ADE
      8C000884180000000000000000000000000000000000FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF000000000084848400C6C6C600C6C6C6008484
      840000000000000000000000000000000000000000000000000000000000FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF000000
      0000C6C6C60000000000C6C6C6000000000000526300088CBD00108CBD001084
      BD001084B500000000008CE7FF00FF000000FF000000FF000000FF000000FF00
      0000FF000000FF000000FF00000000000000088CBD00FFFFFF00AD848400FFF7
      EF00FFFFF700FFF7EF00FFEFE700FFEFDE00FFE7D600FFE7CE00088418000884
      1800088CBD0000000000000000000000000000000000FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000FFFFFF000000000000000000000000000000000000000000FFFFFF000000
      000000000000000000000000000000000000005263000894C600088CC600088C
      C600088CBD0000000000B5EFFF00A5EFFF00FF000000FF000000FF000000FF00
      0000FF000000FF000000FF0000000000000000000000088CBD00D6B59400FFF7
      F700FFFFFF00FFFFF700FFF7EF00FFF7EF00FFF7EF00FFEFDE0008841800088C
      BD000000000000000000000000000000000000000000FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF0000000000000000000000000000000000005263000094CE000094CE000094
      C6000094C60000000000DEF7FF00CEF7FF00C6EFFF00FF000000FF000000FF00
      0000000000000000000000000000000000000000000000000000D6B59400FFFF
      F700FFFFFF00FFFFFF00FFFFFF00F7DEC600EFD6B500C6B59C007B5252000000
      00000000000000000000000000000000000000000000FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000FFFFFF000000000000000000000000000000000000000000FFFF
      FF000000000000000000000000000000000000526300009CCE00009CCE00009C
      CE000094CE0000000000FFFFFF00F7F7FF00E7F7FF0000000000FF000000FF00
      0000000000000000000000000000000000000000000000000000DEB58C00FFFF
      F700FFFFFF00FFFFFF00FFFFFF00AD847300AD847300AD847300AD8473000000
      00000000000000000000000000000000000000000000FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF0000000000C6C6C600000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF0000000000000000000000000000526300009CCE00009CCE00009C
      CE00009CCE0000000000FFFFFF00FFFFFF00FFFFFF000000000000000000FF00
      0000000000000000000000000000000000000000000000000000E7BD9400FFF7
      F700FFFFFF00FFFFFF00FFFFFF00AD847300E7B58C00E7B58C00000000000000
      00000000000000000000000000000000000000000000FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000052630000526300009C
      CE00009CCE000000000000526300005263000052630000526300000000000000
      0000000000000000000000000000000000000000000000000000E7BD9400DEB5
      8C00DEB58C00DEB58C00DEB58C00AD847300DEB58C0000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000052
      6300005263000052630000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000424D3E000000000000003E000000
      2800000040000000300000000100010000000000800100000000000000000000
      000000000000000000000000FFFFFF0000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000FFFCFFFF000000009FF9C00700000000
      8FF380030000000087E7800300000000C3CF800300000000F11F800300000000
      F83F800300000000FC7F800300000000F83F800300000000F19F800300000000
      E3CF800300000000C7E78003000000008FFB8003000000001FFF800300000000
      3FFFC00700000000FFFFFFFF00000000FFFFFFFFFFFF8003000CC007E3FF0003
      0008800383FF000100010001000F000100030001003F000100030001002F0000
      00030000000F000000030000000F000000038000000100070007C00000010007
      000FE0010001800F000FE007000FC01F000FF007000FC01F001FF003002FC03F
      003FF803803FC07F007FFFFFE3FFFFFF00000000000000000000000000000000
      000000000000}
  end
  object qryAtual: TUMZQuery
    Connection = DM.db
    Params = <>
    Left = 560
    Top = 104
  end
  object qryNova: TUMZQuery
    Connection = DM.db
    Params = <>
    Left = 608
    Top = 104
  end
  object qryGRade: TUMZQuery
    Connection = DM.db
    Params = <>
    Left = 640
    Top = 104
  end
  object xFicha: TUMZQuery
    Connection = DM.db
    Params = <>
    Left = 672
    Top = 104
  end
  object xUpd: TUMZQuery
    Connection = DM.db
    Params = <>
    Left = 704
    Top = 104
  end
  object xDel: TUMZQuery
    Connection = DM.db
    Params = <>
    Left = 736
    Top = 112
  end
  object xIns: TUMZQuery
    Connection = DM.db
    Params = <>
    Left = 584
    Top = 136
  end
  object pmQtdMatriculas: TPopupMenu
    OnPopup = pmQtdMatriculasPopup
    Left = 688
    Top = 232
  end
  object pmQtdFichaIndividual: TPopupMenu
    OnPopup = pmQtdFichaIndividualPopup
    Left = 432
    Top = 232
    object creditoFinan: TMenuItem
      Caption = 'Alterar cr'#233'dito financeiro da disciplina neste aluno'
      OnClick = alteraCreditosFinanceiroPorAluno
    end
    object discGenerica: TMenuItem
      Caption = 'Trocar a disciplina gen'#233'rica'
      OnClick = trocarDisciplinaGenerica
    end
    object Line: TMenuItem
      Caption = '-'
    end
  end
  object pmQtdDoc: TPopupMenu
    OnPopup = pmQtdDocPopup
    Left = 200
    Top = 224
  end
  object popDocumentacao: TPopupMenu
    OnPopup = popDocumentacaoPopup
    Left = 608
    Top = 213
    object AlunoEntregouDocumento1: TMenuItem
      Caption = 'Aluno entregou o documento'
      Checked = True
      OnClick = AlunoEntregouDocumento1Click
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
  object qyDocDigital: TUMZQuery
    Connection = DM.dbDocs
    Params = <>
    Left = 293
    Top = 229
  end
  object popNumerarAlunos: TPopupMenu
    OnPopup = popNumerarAlunosPopup
    Left = 480
    Top = 112
    object GerarNumeraodaTurmaXXXX200511: TMenuItem
      Tag = 1
      Caption = 'Gerar Numera'#231#227'o da Turma XXXX (2005/1)'
      OnClick = GerarNumeraodaTurmaXXXX200511Click
    end
    object GerarNumeraodoCursoXXXX200511: TMenuItem
      Tag = 2
      Caption = 'Gerar Numera'#231#227'o do Curso XXXX (2005/1)'
      OnClick = GerarNumeraodoCursoXXXX200511Click
    end
  end
  object popFormaIngresso: TPopupMenu
    Left = 456
    Top = 176
    object MatrculanoCurso1: TMenuItem
      Caption = 'Matr'#237'cula no Curso'
      OnClick = MatrculanoCurso1Click
    end
    object MatrculanaEtapa1: TMenuItem
      Caption = 'Matr'#237'cula na Etapa'
      OnClick = MatrculanaEtapa1Click
    end
    object MatrculanoCursoTurma1: TMenuItem
      Caption = 'Matr'#237'cula no Curso por Turma'
      OnClick = MatrculanoCursoTurma1Click
    end
  end
  object qryTurmasLotacaoVagas: TUMZQuery
    Connection = DM.db
    SQL.Strings = (
      'SELECT'
      '   fi.anosemestre nr_anosemestre,'
      '   fi.turma cd_turma,'
      '   fi.disciplina cd_disciplina,'
      '   fi.curso cd_curso,'
      '   t.sn_bloquear_vagas,'
      '   t.vagas nr_vagas,'
      '   d.descricao ds_disciplina,'
      '   COUNT(*) nr_matriculados'
      'FROM'
      '   fichaindividual fi'
      '      JOIN situacao s ON'
      '         (fi.situacao = s.cd_situacao)'
      '      JOIN turmas t ON'
      '         (fi.turma = t.codigo) AND'
      '         (fi.anosemestre = t.anosemestre)'
      '      JOIN disciplinas d ON'
      '         (fi.disciplina = d.codigo) AND'
      '         (fi.curso = d.curso)'
      'WHERE'
      '   s.cd_situacao_pai NOT IN (3, 4, 6, 7, 8)'
      'GROUP BY'
      '   fi.turma, fi.disciplina, fi.anosemestre')
    Params = <>
    Left = 200
    Top = 320
    object qryTurmasLotacaoVagasnr_anosemestre: TSmallintField
      FieldName = 'nr_anosemestre'
    end
    object qryTurmasLotacaoVagascd_turma: TStringField
      FieldName = 'cd_turma'
      Size = 50
    end
    object qryTurmasLotacaoVagascd_disciplina: TIntegerField
      FieldName = 'cd_disciplina'
    end
    object qryTurmasLotacaoVagascd_curso: TStringField
      FieldName = 'cd_curso'
      Size = 15
    end
    object qryTurmasLotacaoVagassn_bloquear_vagas: TSmallintField
      FieldName = 'sn_bloquear_vagas'
    end
    object qryTurmasLotacaoVagasnr_vagas: TSmallintField
      FieldName = 'nr_vagas'
    end
    object qryTurmasLotacaoVagasds_disciplina: TStringField
      FieldName = 'ds_disciplina'
      Size = 150
    end
    object qryTurmasLotacaoVagasnr_matriculados: TLargeintField
      FieldName = 'nr_matriculados'
    end
  end
  object qryQtdMatriculas: TUMZQuery
    Connection = DM.db
    SQL.Strings = (
      'SELECT'
      #9'COUNT(*) qtd_matriculas'
      'FROM '
      #9'matriculas m'
      'WHERE'
      #9'm.situacao != :cd_situacao AND'
      #9'm.turma = :cd_turma AND'
      #9'm.anosemestre = :nr_anosemestre')
    Params = <
      item
        DataType = ftUnknown
        Name = 'cd_situacao'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'cd_turma'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'nr_anosemestre'
        ParamType = ptUnknown
      end>
    Left = 728
    Top = 264
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'cd_situacao'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'cd_turma'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'nr_anosemestre'
        ParamType = ptUnknown
      end>
    object qryQtdMatriculasqtd_matriculas: TLargeintField
      FieldName = 'qtd_matriculas'
      ReadOnly = True
    end
  end
  object qryQtdAlunosSituacao: TUMZQuery
    Connection = DM.db
    SQL.Strings = (
      'SELECT'
      '  s.ds_situacao,'
      '  COUNT(m.codigoaluno) qtd_matriculas'
      'FROM matriculas m'
      
        '  INNER JOIN fichaindividual fi ON (m.turma = fi.turmamatricula ' +
        'AND m.codigoaluno = fi.codigoaluno AND fi.anosemestre = m.anosem' +
        'estre)'
      '  INNER JOIN situacao s ON (s.cd_situacao = m.situacao)'
      'WHERE'
      '  fi.disciplina = :cd_disciplina AND'
      '  m.curso LIKE :cd_curso AND'
      '  m.anosemestre = :nr_anosemestre'
      'GROUP BY'
      '  m.situacao')
    Params = <
      item
        DataType = ftUnknown
        Name = 'cd_disciplina'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'cd_curso'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'nr_anosemestre'
        ParamType = ptUnknown
      end>
    Left = 728
    Top = 296
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'cd_disciplina'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'cd_curso'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'nr_anosemestre'
        ParamType = ptUnknown
      end>
    object qryQtdAlunosSituacaods_situacao: TStringField
      FieldName = 'ds_situacao'
      Size = 15
    end
    object qryQtdAlunosSituacaoqtd_matriculas: TLargeintField
      FieldName = 'qtd_matriculas'
      ReadOnly = True
    end
  end
  object qryTotalAlunosAtivos: TUMZQuery
    Connection = DM.db
    SQL.Strings = (
      'SELECT'
      '  COUNT(m.codigoaluno) qtd_matriculas'
      'FROM '
      #9'matriculas m'
      
        '  INNER JOIN fichaindividual fi ON (m.turma = fi.turmamatricula ' +
        'AND m.codigoaluno = fi.codigoaluno AND fi.anosemestre = m.anosem' +
        'estre)'
      '  INNER JOIN situacao s ON (s.cd_situacao = m.situacao)'
      'WHERE'
      #9's.cd_situacao_pai IN (3,4,5,6,7,8) AND'
      '  fi.disciplina = :cd_disciplina AND'
      '  m.curso LIKE :cd_curso AND'
      '  m.anosemestre = :nr_anosemestre'
      'GROUP BY'
      '  m.situacao')
    Params = <
      item
        DataType = ftUnknown
        Name = 'cd_disciplina'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'cd_curso'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'nr_anosemestre'
        ParamType = ptUnknown
      end>
    Left = 728
    Top = 328
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'cd_disciplina'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'cd_curso'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'nr_anosemestre'
        ParamType = ptUnknown
      end>
    object qryTotalAlunosAtivosqtd_matriculas: TLargeintField
      FieldName = 'qtd_matriculas'
      ReadOnly = True
    end
  end
  object qryReservas: TUMZQuery
    Connection = DM.db
    SQL.Strings = (
      'SELECT'
      '  COUNT(m.codigoaluno) qtd_matriculas'
      'FROM '
      #9'matriculas m'
      
        '  INNER JOIN fichaindividual fi ON (m.turma = fi.turmamatricula ' +
        'AND m.codigoaluno = fi.codigoaluno AND fi.anosemestre = m.anosem' +
        'estre)'
      '  INNER JOIN situacao s ON (s.cd_situacao = m.situacao)'
      'WHERE'
      '  fi.disciplina = :cd_disciplina AND'
      '  m.curso LIKE :cd_curso AND'
      '  m.anosemestre = :nr_anosemestre'
      'GROUP BY'
      '  m.situacao')
    Params = <
      item
        DataType = ftUnknown
        Name = 'cd_disciplina'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'cd_curso'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'nr_anosemestre'
        ParamType = ptUnknown
      end>
    Left = 728
    Top = 360
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'cd_disciplina'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'cd_curso'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'nr_anosemestre'
        ParamType = ptUnknown
      end>
    object qryReservasqtd_matriculas: TLargeintField
      FieldName = 'qtd_matriculas'
      ReadOnly = True
    end
  end
  object tblResumoFicha: TUMZQuery
    Connection = DM.db
    OnCalcFields = tblFichaIndividualCalcFields
    Params = <>
    SQLList.Strings = (
      
        'mysql-5=SELECT COUNT(*) QTD_DISCIPLINAS'#13#10'     , TRUNCATE(SUM(COA' +
        'LESCE((CASE WHEN LENGTH(COALESCE(fichaindividual.NR_CR_FIN, '#39#39'))' +
        ' > 0 THEN fichaindividual.NR_CR_FIN ELSE grades_disciplinas.NR_A' +
        'ULAS END),0)),4) SOMA_CR_FINAN'#13#10#9'  , SUM(COALESCE(grades_discipl' +
        'inas.NR_CREDITOS_ACADEMICOS,0)) SOMA_CR_ACAD'#13#10' '#9'  , SUM(COALESCE' +
        '(grades_disciplinas.VL_VALOR,0)) SOMA_CH'#13#10'FROM '#13#10'FichaIndividual' +
        #13#10'INNER JOIN Turmas ON (Turmas.Codigo = FichaIndividual.Turma AN' +
        'D Turmas.AnoSemestre = FichaIndividual.AnoSemestre )'#13#10'INNER JOIN' +
        ' Disciplinas ON (FichaIndividual.Disciplina = Disciplinas.Codigo' +
        ' AND FichaIndividual.Curso = Disciplinas.Curso)'#13#10'INNER JOIN situ' +
        'acao ON(situacao.cd_situacao = fichaindividual.situacao)'#13#10'LEFT J' +
        'OIN GRADES ON (GRADES.cd_grade = Turmas.cd_grade and Turmas.curs' +
        'o = GRADES.CD_CURSO)'#13#10'LEFT JOIN grades_disciplinas ON (grades_di' +
        'sciplinas.CD_GRADE = GRADES.CD_GRADE AND grades_disciplinas.CD_C' +
        'URSO = FichaIndividual.curso AND grades_disciplinas.CD_DISCIPLIN' +
        'A = FichaIndividual.disciplina AND grades_disciplinas.NR_SERIE =' +
        ' turmas.serie)'#13#10'WHERE  '#13#10'FichaIndividual.CodigoAluno=:CodigoAlun' +
        'o AND '#13#10'FichaIndividual.TurmaMatricula=:Turma AND '#13#10'FichaIndivid' +
        'ual.AnoSemestre=:AnoSemestre AND '#13#10'situacao.cd_situacao_pai NOT ' +
        'IN ( 3,6,4,5 ) '#13#10'ORDER BY Disciplinas.ordem'
      
        'oracle=SELECT CAST(COUNT(*) AS NUMBER(19)) QTD_DISCIPLINAS'#13#10'    ' +
        ' , TRUNCATE(SUM(COALESCE((CASE WHEN LENGTH(COALESCE(fichaindivid' +
        'ual.NR_CR_FIN, '#39#39')) > 0 THEN fichaindividual.NR_CR_FIN ELSE grad' +
        'es_disciplinas.NR_AULAS END),0)),4) SOMA_CR_FINAN'#13#10#9'  , CAST(SUM' +
        '(COALESCE(grades_disciplinas.NR_CREDITOS_ACADEMICOS,0)) AS NUMBE' +
        'R(19)) SOMA_CR_ACAD'#13#10' '#9'  , SUM(COALESCE(grades_disciplinas.VL_VA' +
        'LOR,0)) SOMA_CH'#13#10'FROM '#13#10'FichaIndividual'#13#10'INNER JOIN Turmas ON (T' +
        'urmas.Codigo = FichaIndividual.Turma AND Turmas.AnoSemestre = Fi' +
        'chaIndividual.AnoSemestre )'#13#10'INNER JOIN Disciplinas ON (FichaInd' +
        'ividual.Disciplina = Disciplinas.Codigo AND FichaIndividual.Curs' +
        'o = Disciplinas.Curso)'#13#10'LEFT JOIN GRADES ON (GRADES.cd_grade = T' +
        'urmas.cd_grade and Turmas.curso = GRADES.CD_CURSO)'#13#10'LEFT JOIN gr' +
        'ades_disciplinas ON (grades_disciplinas.CD_GRADE = GRADES.CD_GRA' +
        'DE AND grades_disciplinas.CD_CURSO = FichaIndividual.curso AND g' +
        'rades_disciplinas.CD_DISCIPLINA = FichaIndividual.disciplina AND' +
        ' grades_disciplinas.NR_SERIE = turmas.serie)'#13#10'WHERE  '#13#10'FichaIndi' +
        'vidual.CodigoAluno=:CodigoAluno AND '#13#10'FichaIndividual.TurmaMatri' +
        'cula=:Turma AND '#13#10'FichaIndividual.AnoSemestre=:AnoSemestre '#13#10'ORD' +
        'ER BY Disciplinas.ordem')
    Left = 336
    Top = 312
    object tblResumoFichaQTD_DISCIPLINAS: TLargeintField
      FieldName = 'QTD_DISCIPLINAS'
      ReadOnly = True
    end
    object tblResumoFichaSOMA_CR_FINAN: TFloatField
      FieldName = 'SOMA_CR_FINAN'
      ReadOnly = True
    end
    object tblResumoFichaSOMA_CR_ACAD: TLargeintField
      FieldName = 'SOMA_CR_ACAD'
      ReadOnly = True
    end
    object tblResumoFichaSOMA_CH: TFloatField
      FieldName = 'SOMA_CH'
      ReadOnly = True
    end
  end
  object dtcResumoFicha: TDataSource
    DataSet = tblResumoFicha
    Left = 336
    Top = 344
  end
  object popOutrasAcoes: TPopupMenu
    OnPopup = popOutrasAcoesPopup
    Left = 560
    Top = 328
    object CadastrodeTurmas1: TMenuItem
      Caption = 'Cadastro de Turmas'
      OnClick = CadastrodeTurmas1Click
    end
    object Cronograma1: TMenuItem
      Caption = 'Cronograma'
      OnClick = Cronograma1Click
    end
    object PlanilhadeRecebimentos1: TMenuItem
      Caption = 'Planilha de Recebimentos'
      OnClick = PlanilhadeRecebimentos1Click
    end
    object CadastrodeAlunos1: TMenuItem
      Caption = 'Cadastro de Alunos'
      OnClick = CadastrodeAlunos1Click
    end
  end
  object qryTurmas: TUMZQuery
    Connection = DM.db
    SQL.Strings = (
      'SELECT '
      '   codigo,'
      '   anosemestre '
      'FROM '
      '   turmas '
      'WHERE '
      '   CURSO = :CURSO and '
      '   ANOSEMESTRE = :ANOSEMESTRE '
      'ORDER BY '
      '   serie,'
      '   CODIGO')
    Params = <
      item
        DataType = ftUnknown
        Name = 'CURSO'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'ANOSEMESTRE'
        ParamType = ptUnknown
      end>
    Left = 656
    Top = 264
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'CURSO'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'ANOSEMESTRE'
        ParamType = ptUnknown
      end>
    object qryTurmascodigo: TStringField
      FieldName = 'codigo'
      Required = True
      Size = 50
    end
    object qryTurmasanosemestre: TSmallintField
      FieldName = 'anosemestre'
    end
  end
  object qryPendenciasBib: TUMZQuery
    Connection = DM.db
    SQL.Strings = (
      'SELECT'
      '   replace(group_concat(bt.ds_titulo),'#39','#39','#39', #13'#39' )  as obras'
      'FROM'
      '   bib_emprestimos be'
      
        '   INNER JOIN bib_titulos_exemplares bte ON (bte.cd_exemplar = b' +
        'e.cd_exemplar)'
      '   INNER JOIN bib_titulos bt ON (bt.cd_titulo = bte.cd_titulo)'
      'WHERE'
      '   be.cd_pessoa = :cd_pessoa AND'
      '   be.cd_situacao  = 1'
      'GROUP BY'
      '   be.cd_pessoa')
    Params = <
      item
        DataType = ftUnknown
        Name = 'cd_pessoa'
        ParamType = ptUnknown
      end>
    Left = 272
    Top = 32
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'cd_pessoa'
        ParamType = ptUnknown
      end>
  end
  object qryPendenciasFinanceirasBib: TUMZQuery
    Connection = DM.db
    SQL.Strings = (
      'SELECT'
      
        '    COALESCE(sum(db_valor),0) -  COALESCE(sum(db_valor_pago),0) ' +
        'as valor_total'
      'FROM'
      '    bib_multas bm'
      
        '    INNER JOIN bib_emprestimos be ON (bm.cd_emprestimo = be.cd_e' +
        'mprestimo)'
      'where'
      '     bm.cd_situacao IN(1,8) AND'
      '     be.cd_pessoa = :cd_pessoa'
      'GROUP BY '
      '    be.cd_pessoa'
      #9'  '
      '    ')
    Params = <
      item
        DataType = ftUnknown
        Name = 'cd_pessoa'
        ParamType = ptUnknown
      end>
    Left = 304
    Top = 32
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'cd_pessoa'
        ParamType = ptUnknown
      end>
  end
  object qrySituacaoMatricula: TUMZReadOnlyQuery
    Connection = DM.db
    SQL.Strings = (
      'SELECT'
      '   CD_SITUACAO,'
      '   DS_SITUACAO,'
      '   DS_SIGLA_SITUACAO,'
      '   CD_SITUACAO_PAI,'
      '   NR_ORDEM_FINAL'
      'FROM'
      '   SITUACAO')
    Params = <>
    Left = 872
    Top = 56
    object qrySituacaoMatriculaCD_SITUACAO: TIntegerField
      FieldName = 'CD_SITUACAO'
    end
    object qrySituacaoMatriculaDS_SITUACAO: TStringField
      FieldName = 'DS_SITUACAO'
      Size = 15
    end
    object qrySituacaoMatriculaDS_SIGLA_SITUACAO: TStringField
      FieldName = 'DS_SIGLA_SITUACAO'
      Size = 10
    end
    object qrySituacaoMatriculaCD_SITUACAO_PAI: TIntegerField
      FieldName = 'CD_SITUACAO_PAI'
    end
    object qrySituacaoMatriculaNR_ORDEM_FINAL: TIntegerField
      FieldName = 'NR_ORDEM_FINAL'
    end
  end
  object qryExtras: TUMZQuery
    Connection = DM.db
    SQL.Strings = (
      'SELECT'
      #9'*'
      'FROM'
      #9'fichaindividual_extras AS fe'
      'WHERE'
      #9'fe.anosemestre = :anosemestre'
      #9'AND fe.codigoaluno = :codigoaluno'
      #9'AND fe.disciplina = :disciplina'
      #9'AND fe.serie = :serie'
      #9'AND fe.turma = :turma')
    Params = <
      item
        DataType = ftUnknown
        Name = 'anosemestre'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'codigoaluno'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'disciplina'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'serie'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'turma'
        ParamType = ptUnknown
      end>
    Left = 432
    Top = 328
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'anosemestre'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'codigoaluno'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'disciplina'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'serie'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'turma'
        ParamType = ptUnknown
      end>
    object qryExtrasserie: TIntegerField
      FieldName = 'serie'
    end
    object qryExtrasdisciplina: TLargeintField
      FieldName = 'disciplina'
    end
    object qryExtrascodigoaluno: TLargeintField
      FieldName = 'codigoaluno'
    end
    object qryExtrasanosemestre: TIntegerField
      FieldName = 'anosemestre'
    end
    object qryExtrasturma: TStringField
      FieldName = 'turma'
      Size = 255
    end
    object qryExtrasds_observacao: TStringField
      FieldName = 'ds_observacao'
      Size = 255
    end
  end
  object dtcExtras: TDataSource
    DataSet = qryExtras
    Left = 432
    Top = 360
  end
  object QryAlterarCrFinanPDisc: TUMZQuery
    Connection = DM.db
    SQL.Strings = (
      'UPDATE '
      '   FICHAINDIVIDUAL'
      'SET '
      '   NR_CR_FIN = :CRFIN '
      'WHERE'
      '   CODIGOALUNO = :CODIGOALUNO'
      'AND '
      '  DISCIPLINA = :DISICPLINA'
      'AND'
      ' ANOSEMESTRE = :ANOSEMESTRE')
    Params = <
      item
        DataType = ftUnknown
        Name = 'CRFIN'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'CODIGOALUNO'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'DISICPLINA'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'ANOSEMESTRE'
        ParamType = ptUnknown
      end>
    Left = 760
    Top = 264
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'CRFIN'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'CODIGOALUNO'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'DISICPLINA'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'ANOSEMESTRE'
        ParamType = ptUnknown
      end>
  end
  object QryLogGeral: TUMZQuery
    Connection = DM.db
    SQL.Strings = (
      'INSERT INTO log_geral ('
      #9'CD_PESSOA,'
      #9'CD_USUARIO,'
      #9'DT_LOG,'
      #9'CD_MODULO,'
      #9'CD_CHAVE,'
      #9'CD_ACAO,'
      #9'CD_OPERACAO,'
      #9'CD_COLIGADA,'
      #9'DS_OBSERVACOES'
      ') VALUES ('
      #9':PESSOA,'
      #9':USUARIO,'
      #9':DATALOG,'
      #9':MODULO,'
      #9':CHAVE,'
      #9':ACAO,'
      #9':OPERACAO,'
      #9':COLIGADA,'
      #9':OBSERVACAO'
      ')')
    Params = <
      item
        DataType = ftUnknown
        Name = 'PESSOA'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'USUARIO'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'DATALOG'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'MODULO'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'CHAVE'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'ACAO'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'OPERACAO'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'COLIGADA'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'OBSERVACAO'
        ParamType = ptUnknown
      end>
    Left = 792
    Top = 264
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'PESSOA'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'USUARIO'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'DATALOG'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'MODULO'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'CHAVE'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'ACAO'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'OPERACAO'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'COLIGADA'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'OBSERVACAO'
        ParamType = ptUnknown
      end>
  end
  object qyGruposAtividadesAluno: TUMZQuery
    Connection = DM.db
    SQL.Strings = (
      'SELECT'
      '  dg.cd_grupo,'
      #9'dg.nm_grupo,'
      '  dgp.cd_pessoa,'
      '  d.descricao nm_disciplina,'
      '  p.nm_pessoa'
      'FROM'
      '  diario_grupos dg'
      #9'INNER JOIN diario_grupos_pessoas dgp ON ('
      #9#9'dgp.cd_grupo =  dg.cd_grupo AND'
      '    dgp.dt_saida IS NULL'
      #9')'
      '  INNER JOIN disciplinas d ON ('
      #9#9'dg.cd_disciplina = d.codigo AND'
      #9#9'dg.cd_curso = d.curso'
      #9')'
      '  INNER JOIN pessoas p ON (p.cd_pessoa = dgp.cd_pessoa)'
      'WHERE'
      #9'dg.nr_anosemestre = :nr_anosemestre AND'
      #9'dg.cd_curso LIKE :cd_curso AND'
      #9'dg.cd_turma LIKE :cd_turma AND'
      #9'dg.sn_ativo = 1 AND'
      #9'dgp.cd_pessoa = :cd_pessoa')
    Params = <
      item
        DataType = ftUnknown
        Name = 'nr_anosemestre'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'cd_curso'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'cd_turma'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'cd_pessoa'
        ParamType = ptUnknown
      end>
    Left = 248
    Top = 136
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'nr_anosemestre'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'cd_curso'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'cd_turma'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'cd_pessoa'
        ParamType = ptUnknown
      end>
  end
  object qyInativarAluno: TUMZQuery
    Connection = DM.db
    SQL.Strings = (
      'UPDATE'
      '  diario_grupos_pessoas'
      'SET'
      
        '  dt_saida = CASE WHEN :dt_saida >= dt_entrada THEN :dt_saida EL' +
        'SE NOW() END'
      'WHERE'
      '  cd_pessoa = :cd_pessoa AND'
      '  cd_grupo = :cd_grupo AND'
      '  dt_saida IS NULL')
    Params = <
      item
        DataType = ftUnknown
        Name = 'dt_saida'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'cd_pessoa'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'cd_grupo'
        ParamType = ptUnknown
      end>
    Left = 280
    Top = 136
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'dt_saida'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'cd_pessoa'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'cd_grupo'
        ParamType = ptUnknown
      end>
  end
  object qyPossuiGruposAtividades: TUMZQuery
    Connection = DM.db
    SQL.Strings = (
      'SELECT'
      '  dg.cd_grupo,'
      #9'dg.nm_grupo'
      'FROM'
      '  diario_grupos dg'
      'WHERE'
      #9'dg.nr_anosemestre = :nr_anosemestre AND'
      #9'dg.cd_curso LIKE :cd_curso AND'
      #9'dg.cd_turma LIKE :cd_turma AND'
      #9'dg.sn_ativo = 1')
    Params = <
      item
        DataType = ftUnknown
        Name = 'nr_anosemestre'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'cd_curso'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'cd_turma'
        ParamType = ptUnknown
      end>
    Left = 216
    Top = 136
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'nr_anosemestre'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'cd_curso'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'cd_turma'
        ParamType = ptUnknown
      end>
  end
  object qyInserirDiscGenerica: TUMZQuery
    Connection = DM.db
    SQL.Strings = (
      'INSERT INTO fichaindividual_optativas ('
      '  anosemestre,'
      '  turma,'
      '  codigoaluno,'
      '  disciplina,'
      '  serie,'
      '  cd_turma_generica,'
      '  cd_disciplina_generica'
      ') VALUES ('
      '  :anosemestre,'
      '  :turma,'
      '  :codigoaluno,'
      '  :disciplina,'
      '  :serie,'
      '  :cd_turma_generica,'
      '  :cd_disciplina_generica'
      ')')
    Params = <
      item
        DataType = ftUnknown
        Name = 'ANOSEMESTRE'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'TURMA'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'CODIGOALUNO'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'disciplina'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'serie'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'cd_turma_generica'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'cd_disciplina_generica'
        ParamType = ptUnknown
      end>
    Left = 96
    Top = 144
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'ANOSEMESTRE'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'TURMA'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'CODIGOALUNO'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'disciplina'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'serie'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'cd_turma_generica'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'cd_disciplina_generica'
        ParamType = ptUnknown
      end>
  end
  object qyTrocarDiscGenerica: TUMZQuery
    Connection = DM.db
    SQL.Strings = (
      'UPDATE'
      '  fichaindividual_optativas'
      'SET'
      '  serie = :nr_serie_nova,'
      '  cd_disciplina_generica = :cd_disciplina_generica_nova'
      'WHERE'
      '  anosemestre = :anosemestre AND'
      '  turma = :turma AND'
      '  codigoaluno = :codigoaluno AND'
      '  disciplina = :disciplina AND'
      '  serie = :nr_serie AND'
      '  cd_disciplina_generica = :cd_disciplina_generica')
    Params = <
      item
        DataType = ftUnknown
        Name = 'nr_serie_nova'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'cd_disciplina_generica_nova'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'ANOSEMESTRE'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'TURMA'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'CODIGOALUNO'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'disciplina'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'nr_serie'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'cd_disciplina_generica'
        ParamType = ptUnknown
      end>
    Left = 128
    Top = 144
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'nr_serie_nova'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'cd_disciplina_generica_nova'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'ANOSEMESTRE'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'TURMA'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'CODIGOALUNO'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'disciplina'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'nr_serie'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'cd_disciplina_generica'
        ParamType = ptUnknown
      end>
  end
  object popMatricularDisciplina: TPopupMenu
    Left = 477
    Top = 357
    object menuAdicionarDisciplinaVariosAlunos: TMenuItem
      Tag = 7
      Caption = 'Matricular disciplina para v'#225'rios alunos'
      OnClick = menuAdicionarDisciplinaVariosAlunosClick
    end
    object menuAdicionarDisciplinaAluno: TMenuItem
      Caption = 'Matricular disciplina para esse aluno'
      OnClick = menuAdicionarDisciplinaAlunoClick
    end
  end
  object popRemoverDisciplina: TPopupMenu
    Left = 517
    Top = 357
    object menuRemoverDisciplinaVariosAlunos: TMenuItem
      Tag = 7
      Caption = 'Remover disciplina de v'#225'rios alunos'
      OnClick = menuRemoverDisciplinaVariosAlunosClick
    end
    object menuRemoverDisciplinaAluno: TMenuItem
      Caption = 'Remover disciplina desse aluno'
      OnClick = menuRemoverDisciplinaAlunoClick
    end
  end
  object qryVerificaGrupos: TUMZQuery
    Connection = DM.db
    SQL.Strings = (
      'SELECT'
      '  count(cd_grupo) as nr_alunos'
      'from diario_grupos_pessoas'
      'where'
      '  cd_grupo = :grupo and'
      '  dt_saida is null')
    Params = <
      item
        DataType = ftUnknown
        Name = 'grupo'
        ParamType = ptUnknown
      end>
    Left = 312
    Top = 136
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'grupo'
        ParamType = ptUnknown
      end>
  end
  object qryInativaGrupo: TUMZQuery
    Connection = DM.db
    SQL.Strings = (
      'UPDATE diario_grupos'
      'SET sn_ativo = 0'
      'WHERE cd_grupo = :grupo')
    Params = <
      item
        DataType = ftUnknown
        Name = 'grupo'
        ParamType = ptUnknown
      end>
    Left = 344
    Top = 136
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'grupo'
        ParamType = ptUnknown
      end>
  end
end
