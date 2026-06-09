object frmCorrecoes: TfrmCorrecoes
  Left = 108
  Top = 84
  Caption = 'T'#205'TULO'
  ClientHeight = 552
  ClientWidth = 907
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
  OnKeyDown = FormKeyDown
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object Bevel3: TBevel
    Left = 0
    Top = 25
    Width = 11
    Height = 493
    Align = alLeft
    Shape = bsSpacer
    ExplicitHeight = 473
  end
  object Bevel7: TBevel
    Left = 0
    Top = 518
    Width = 907
    Height = 9
    Align = alBottom
    Shape = bsSpacer
    ExplicitTop = 498
    ExplicitWidth = 792
  end
  object pnTitulo: TPanel
    Left = 0
    Top = 0
    Width = 907
    Height = 25
    Align = alTop
    BevelOuter = bvLowered
    Caption = 'Corre'#231#245'es'
    Color = clBlue
    Font.Charset = ANSI_CHARSET
    Font.Color = clWhite
    Font.Height = -13
    Font.Name = 'Arial'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 0
  end
  object pnGrade: TPanel
    Left = 11
    Top = 25
    Width = 310
    Height = 493
    Align = alLeft
    BevelOuter = bvNone
    TabOrder = 1
    object Bevel5: TBevel
      Left = 0
      Top = 0
      Width = 310
      Height = 5
      Align = alTop
      Shape = bsSpacer
    end
    object grd: TDBGrid
      Left = 0
      Top = 76
      Width = 310
      Height = 417
      Align = alClient
      BorderStyle = bsNone
      DataSource = srcProvas
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
      OnTitleClick = grdTitleClick
      Columns = <
        item
          Expanded = False
          FieldName = 'cd_prova'
          Title.Caption = 'C'#243'digo'
          Width = 42
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'nr_prova'
          Title.Caption = 'N'#250'mero'
          Width = 42
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'ds_prova'
          Title.Caption = 'Descri'#231#227'o'
          Width = 200
          Visible = True
        end>
    end
    object Panel2: TPanel
      Left = 0
      Top = 5
      Width = 310
      Height = 25
      Align = alTop
      BevelOuter = bvLowered
      Caption = 'PROVAS CADASTRADAS'
      Color = clBlue
      Font.Charset = ANSI_CHARSET
      Font.Color = clWhite
      Font.Height = -13
      Font.Name = 'Arial'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 1
    end
    object pnAnoSemestre: TPanel
      Left = 0
      Top = 30
      Width = 310
      Height = 5
      Align = alTop
      BevelOuter = bvNone
      TabOrder = 2
    end
    object Panel5: TPanel
      Left = 0
      Top = 35
      Width = 310
      Height = 41
      Align = alTop
      TabOrder = 3
      object Label7: TLabel
        Left = 8
        Top = 14
        Width = 71
        Height = 13
        Alignment = taRightJustify
        Caption = 'Ano/Semestre:'
      end
      object txtAnoSemestre: TMaskEdit
        Tag = 1
        Left = 104
        Top = 10
        Width = 185
        Height = 22
        TabStop = False
        EditMask = '9999/9;0;_'
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Arial'
        Font.Style = []
        MaxLength = 6
        ParentFont = False
        TabOrder = 0
        Text = '19931'
      end
      object UpDown3: TUpDown
        Left = 286
        Top = 9
        Width = 16
        Height = 24
        Min = -100
        TabOrder = 1
        OnClick = UpDown3Click
      end
      object cbAnoSemextre: TCheckBox
        Left = 83
        Top = 12
        Width = 17
        Height = 17
        Checked = True
        State = cbChecked
        TabOrder = 2
        OnClick = cbAnoSemextreClick
      end
    end
  end
  object toolPessoa: TToolBar
    Left = 0
    Top = 527
    Width = 907
    Height = 25
    Align = alBottom
    ButtonWidth = 126
    Caption = 'toolPessoa'
    EdgeBorders = [ebTop, ebBottom]
    Images = ImageList1
    List = True
    ShowCaptions = True
    TabOrder = 2
    object ToolButton4: TToolButton
      Left = 0
      Top = 0
      Width = 8
      Caption = 'ToolButton4'
      ImageIndex = 9
      Style = tbsSeparator
    end
    object ToolButton8: TToolButton
      Left = 8
      Top = 0
      AutoSize = True
      Caption = 'Importar de Arquivo'
      ImageIndex = 10
      OnClick = ToolButton8Click
    end
    object ToolButton10: TToolButton
      Left = 131
      Top = 0
      Width = 8
      Caption = 'ToolButton10'
      ImageIndex = 9
      Style = tbsSeparator
    end
    object tbAtribuirNotas: TToolButton
      Left = 139
      Top = 0
      AutoSize = True
      Caption = 'Atribuir Notas'
      ImageIndex = 8
      OnClick = tbAtribuirNotasClick
    end
    object tbRecalcular: TToolButton
      Left = 233
      Top = 0
      Caption = 'Recalcular gabaritos'
      ImageIndex = 1
      OnClick = tbRecalcularClick
    end
    object ToolButton7: TToolButton
      Left = 359
      Top = 0
      Width = 8
      Caption = 'ToolButton7'
      ImageIndex = 9
      Style = tbsSeparator
    end
    object ToolButton6: TToolButton
      Left = 367
      Top = 0
      Caption = 'Atribui'#231#227'o Avan'#231'ada'
      ImageIndex = 8
      OnClick = ToolButton6Click
    end
    object ToolButton1: TToolButton
      Left = 493
      Top = 0
      Width = 8
      Caption = 'ToolButton1'
      ImageIndex = 9
      Style = tbsSeparator
    end
    object btnFechar: TToolButton
      Left = 501
      Top = 0
      AutoSize = True
      Caption = 'F12 Fechar'
      ImageIndex = 7
      OnClick = btnFecharClick
    end
    object ToolButton2: TToolButton
      Left = 586
      Top = 0
      Width = 8
      Caption = 'ToolButton2'
      ImageIndex = 8
      Style = tbsSeparator
    end
  end
  object Panel4: TPanel
    Left = 321
    Top = 25
    Width = 586
    Height = 493
    Align = alClient
    BevelOuter = bvNone
    TabOrder = 3
    object Bevel6: TBevel
      Left = 0
      Top = 0
      Width = 586
      Height = 5
      Align = alTop
      Shape = bsSpacer
      ExplicitWidth = 471
    end
    object Bevel1: TBevel
      Left = 16
      Top = 8
      Width = 449
      Height = 457
    end
  end
  object pgDisciplinas: TPageControl
    Left = 321
    Top = 25
    Width = 586
    Height = 493
    ActivePage = tsAlunos
    Align = alClient
    Images = ilDisciplinas
    Style = tsFlatButtons
    TabOrder = 4
    OnChange = pgDisciplinasChange
    object tsTurmas: TTabSheet
      Caption = 'Turmas'
      ImageIndex = 1
      object grdTurmas: TDBGrid
        Left = 0
        Top = 0
        Width = 578
        Height = 461
        Align = alClient
        BorderStyle = bsNone
        Color = clBtnFace
        DataSource = srcTurmas
        Options = [dgTitles, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgConfirmDelete, dgCancelOnExit, dgMultiSelect]
        TabOrder = 0
        TitleFont.Charset = DEFAULT_CHARSET
        TitleFont.Color = clWindowText
        TitleFont.Height = -11
        TitleFont.Name = 'MS Sans Serif'
        TitleFont.Style = []
        OnDblClick = grdTurmasDblClick
        Columns = <
          item
            Expanded = False
            FieldName = 'nr_anosemestre'
            Title.Caption = 'Ano/Semestre'
            Width = 127
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'cd_turma'
            Title.Caption = 'C'#243'd. Turma'
            Width = 250
            Visible = True
          end>
      end
    end
    object tsAlunos: TTabSheet
      Caption = 'Alunos'
      ImageIndex = 1
      object DBGrid1: TDBGrid
        Left = 0
        Top = 0
        Width = 578
        Height = 461
        Align = alClient
        BorderStyle = bsNone
        Color = clBtnFace
        DataSource = srcAlunos
        Options = [dgTitles, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgConfirmDelete, dgCancelOnExit, dgMultiSelect]
        TabOrder = 0
        TitleFont.Charset = DEFAULT_CHARSET
        TitleFont.Color = clWindowText
        TitleFont.Height = -11
        TitleFont.Name = 'MS Sans Serif'
        TitleFont.Style = []
        OnColEnter = DBGrid1ColEnter
        OnDblClick = DBGrid1DblClick
        OnMouseUp = DBGrid1MouseUp
        Columns = <
          item
            Expanded = False
            FieldName = 'cd_pessoa'
            Title.Caption = 'C'#243'd. Pessoa'
            Width = 73
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'nm_pessoa'
            Title.Caption = 'Nome'
            Width = 276
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'nr_acertos'
            Title.Caption = 'Acertos'
            Width = 50
            Visible = True
          end>
      end
    end
    object tsRespostas: TTabSheet
      Caption = 'Respostas'
      ImageIndex = 3
      object Bevel2: TBevel
        Left = 0
        Top = 105
        Width = 578
        Height = 5
        Align = alTop
        Shape = bsSpacer
        ExplicitWidth = 439
      end
      object Panel1: TPanel
        Left = 0
        Top = 0
        Width = 578
        Height = 41
        Align = alTop
        TabOrder = 0
        object Label1: TLabel
          Left = 14
          Top = 6
          Width = 58
          Height = 13
          Alignment = taRightJustify
          Caption = 'C'#243'd. Aluno: '
        end
        object Label2: TLabel
          Left = 310
          Top = 6
          Width = 84
          Height = 13
          Alignment = taRightJustify
          Caption = 'Total de Acertos: '
        end
        object DBText1: TDBText
          Left = 80
          Top = 6
          Width = 177
          Height = 14
          DataField = 'cd_pessoa'
          DataSource = srcAlunos
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object DBText2: TDBText
          Left = 392
          Top = 6
          Width = 41
          Height = 14
          DataField = 'nr_acertos'
          DataSource = srcAlunos
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object DBText3: TDBText
          Left = 80
          Top = 22
          Width = 353
          Height = 14
          DataField = 'nm_pessoa'
          DataSource = srcAlunos
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object Label3: TLabel
          Left = 11
          Top = 22
          Width = 61
          Height = 13
          Alignment = taRightJustify
          Caption = 'Nome Aluno:'
        end
        object Label4: TLabel
          Left = 172
          Top = 6
          Width = 43
          Height = 13
          Alignment = taRightJustify
          Caption = 'Gabarito:'
        end
        object DBText4: TDBText
          Left = 219
          Top = 6
          Width = 85
          Height = 14
          DataField = 'ds_nome_gabarito'
          DataSource = srcAlunos
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object SpeedButton1: TSpeedButton
          Left = 368
          Top = 24
          Width = 71
          Height = 16
          Caption = 'Gerar parciais'
          Flat = True
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -8
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
          OnClick = SpeedButton1Click
        end
      end
      object ToolBar1: TToolBar
        Left = 0
        Top = 436
        Width = 578
        Height = 25
        Align = alBottom
        ButtonWidth = 110
        Caption = 'toolPessoa'
        EdgeBorders = [ebTop, ebBottom]
        Images = ImageList1
        List = True
        ShowCaptions = True
        TabOrder = 1
        object ToolButton3: TToolButton
          Left = 0
          Top = 0
          Width = 8
          Caption = 'ToolButton4'
          ImageIndex = 9
          Style = tbsSeparator
        end
        object ToolButton5: TToolButton
          Left = 8
          Top = 0
          Caption = 'Digitar Respostas'
          ImageIndex = 8
          OnClick = ToolButton5Click
        end
        object ToolButton9: TToolButton
          Left = 118
          Top = 0
          Width = 8
          Caption = 'ToolButton2'
          ImageIndex = 8
          Style = tbsSeparator
        end
      end
      object Panel3: TPanel
        Left = 0
        Top = 41
        Width = 578
        Height = 64
        Align = alTop
        TabOrder = 2
        object DBGrid2: TDBGrid
          Left = 1
          Top = 1
          Width = 576
          Height = 62
          Align = alClient
          DataSource = srcAcertosEspecifico
          Options = [dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgConfirmDelete, dgCancelOnExit]
          TabOrder = 0
          TitleFont.Charset = DEFAULT_CHARSET
          TitleFont.Color = clWindowText
          TitleFont.Height = -11
          TitleFont.Name = 'MS Sans Serif'
          TitleFont.Style = []
          Columns = <
            item
              Expanded = False
              FieldName = 'ds_disciplina'
              Width = 350
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'nr_acertos'
              Width = 50
              Visible = True
            end>
        end
      end
      object pcQuestoes: TPageControl
        Left = 17
        Top = 110
        Width = 561
        Height = 326
        ActivePage = tsQuestoesNormais
        Align = alClient
        MultiLine = True
        TabOrder = 3
        object tsQuestoesNormais: TTabSheet
          Caption = 'Afirmativas e Somat'#243'rias'
          object grdRespostas: TDBGrid
            Left = 0
            Top = 0
            Width = 553
            Height = 298
            Align = alClient
            BorderStyle = bsNone
            Color = clBtnFace
            DataSource = srcRespostas
            Options = [dgTitles, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgConfirmDelete, dgCancelOnExit]
            TabOrder = 0
            TitleFont.Charset = DEFAULT_CHARSET
            TitleFont.Color = clWindowText
            TitleFont.Height = -11
            TitleFont.Name = 'MS Sans Serif'
            TitleFont.Style = []
            OnDblClick = grdRespostasDblClick
            Columns = <
              item
                Expanded = False
                FieldName = 'nr_parte'
                Title.Caption = 'Nr. Parte'
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'nr_questao'
                ReadOnly = True
                Title.Caption = 'Quest'#227'o'
                Width = 50
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'sigla'
                Title.Caption = 'Disc.'
                Width = 50
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'vl_peso'
                Title.Caption = 'Peso'
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'ds_resposta_aluno'
                Title.Caption = 'Resp. Aluno'
                Width = 80
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'ds_resposta_gabarito'
                ReadOnly = True
                Title.Caption = 'Resp. Gabarito'
                Width = 80
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'ds_situacao'
                ReadOnly = True
                Title.Caption = 'Situa'#231#227'o'
                Width = 90
                Visible = True
              end>
          end
        end
        object tsQuestoesDiscursivas: TTabSheet
          Caption = 'Discursivas'
          ImageIndex = 1
          object grdRespostasDiscursivas: TDBGrid
            Left = 0
            Top = 0
            Width = 553
            Height = 298
            Align = alClient
            BorderStyle = bsNone
            Color = clBtnFace
            DataSource = srcRespostasDiscursivas
            Options = [dgTitles, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgConfirmDelete, dgCancelOnExit]
            TabOrder = 0
            TitleFont.Charset = DEFAULT_CHARSET
            TitleFont.Color = clWindowText
            TitleFont.Height = -11
            TitleFont.Name = 'MS Sans Serif'
            TitleFont.Style = []
            OnDblClick = grdRespostasDiscursivasDblClick
            Columns = <
              item
                Expanded = False
                FieldName = 'nr_parte'
                Title.Caption = 'Nr. Parte'
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'nr_questao'
                ReadOnly = True
                Title.Caption = 'Quest'#227'o'
                Width = 50
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'sigla'
                Title.Caption = 'Disc.'
                Width = 50
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'vl_peso'
                Title.Caption = 'Peso'
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'db_pontuacao'
                Title.Caption = 'Pontua'#231#227'o Aluno'
                Width = 94
                Visible = True
              end>
          end
        end
      end
      object tsPartes: TTabSet
        Left = 0
        Top = 110
        Width = 17
        Height = 326
        Align = alLeft
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = []
        SoftTop = True
        Style = tsSoftTabs
        Tabs.Strings = (
          'Parte 1'
          'Parte 2')
        TabIndex = 0
        TabPosition = tpLeft
        OnChange = tsPartesChange
      end
    end
  end
  object ImageList1: TImageList
    Left = 440
    Top = 400
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
      000000000000000000000000000000000000000000000073AD000073AD000073
      AD000073AD000073AD000073AD000073AD000073AD000073AD000073AD000073
      AD000073AD000073AD0000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000AD7B7B00F7DEC600F7DE
      C600F7DEBD00F7D6AD00F7D6AD00EFCE9C00EFCE9C00EFCE9C00EFCE9C00EFCE
      9C00EFCE9C009C6B630000000000000000009B9C9B009B9C9B00636563006365
      6300636563006365630063656300636563006365630063656300636563006365
      6300636563009B9C9B0000000000000000009C636B009C636B009C636B009C63
      6B009C636B009C636B007342420063CEF70063CEF70063CEF70063CEF70063CE
      F7001084A5000073AD0000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000AD7B7B00F7DECE00F7DE
      C600F7DEBD00F7D6B500F7D6AD00F7D6A500EFCE9C00EFCE9400EFCE9400EFCE
      9400EFCE94009C6B6300000000000000000063656300CECFCE00000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000CECFCE00636563009B9C9B00000000009C636B00FFF7DE00FFE7C600FFE7
      C600F7DEBD00FFE7C60021392100006B0800006B0800006B08004ACEA50063CE
      F7001084A50063CEE7000073AD00000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000AD7B7B00F7E7CE00F7E7
      CE00F7DEC600F7DEBD00F7DEB500F7D6AD00F7D6A500EFCE9400EFCE9400EFCE
      9400EFCE94009C6B6300000000000000000063656300CECFCE00636563006365
      6300636563006365630063656300636563006365630063656300636563006365
      6300CECFCE006365630063656300000000009C6B6B00FFFFEF00FFEFCE00F7DE
      BD00EFD6B500FFE7C6007342420052CED600006B0800006B0800006B080042BD
      7B001084A50094EFF7000073AD00000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000AD7B7B00F7E7D6009C31
      00009C3100009C3100009C310000F7D6B500F7D6AD00F7D6A500EFCE9C00EFCE
      9400EFCE94009C6B6300000000000000000063656300CECFCE00CECFCE00CECF
      CE00CECFCE00CECFCE00CECFCE00CECFCE00CECFCE00CECFCE00CECFCE00CECF
      CE00CECFCE0063656300636563000000000094737300FFFFF700FFEFD600FFEF
      CE00F7DEBD00FFE7C600734242006BD6F7006BD6F700006B080018523100006B
      0800187B8C00A5EFF7000073AD00000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000B5847B00FFEFDE009C31
      0000CED6FF007B94F7005A5AF700F7DEBD00F7DEB500F7D6AD00F7D6A500EFCE
      9400EFCE94009C6B6300000000000000000063656300CECFCE00CECFCE00CECF
      CE00CECFCE00CECFCE00CECFCE00CECFCE00CECFCE00CECFCE00CECFCE00009A
      000000FF0000636563006365630000000000CE946B00FFFFF700FFF7E700FFEF
      D600FFE7C600FFEFD6007342420073DEF70073DEF70042C68C00006B080039BD
      6300006B080094EFF70052CED6000073AD000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000BD847B00FFEFE7009C31
      0000DEE7FF00FFFFFF007B94F700F7DEC600F7DEBD00F7D6B500F7D6AD00F7D6
      A500EFCE9C009C6B630000000000000000009B9C9B0000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000636563006365630000000000CE946B00FFFFF700FFFFEF00FFF7
      E700FFF7E700FFF7E7007342420094EFF70052CEBD006B946B00006B080039BD
      6300006B08006B9C6B0094948C000073AD000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000BD8C7B00FFF7F7009C31
      00009C3100009C3100009C3100005A5AF700636BF700F7DEBD00F7DEB500F7D6
      AD00F7D6A5009C6B63000000000000000000000000009B9C9B00F3F3F300CECF
      CE00CECFCE00CECFCE00CECFCE00CECFCE00CECFCE00CECFCE00CECFCE00CECF
      CE00CECFCE00CECFCE009B9C9B0000000000D69C7300FFFFF700FFFFF700FFFF
      EF00EFCEAD00B5A58C0073424200086B6B00006B0800006B080039BD630039BD
      6B0039BD6300006B0800006B08000073AD000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000BD8C7B00FFFFF700FFFF
      F700FFF7F700FFEFE700FFEFDE00F7E7D6007B94F700F7DEC600F7DEBD00F7D6
      B500F7D6AD009C6B6300000000000000000000000000000000009B9C9B009B9C
      9B009B9C9B009B9C9B009B9C9B009B9C9B00000000009B9C9B009B9C9B009B9C
      9B009B9C9B009B9C9B009B9C9B0000000000DEA57B00FFFFF700FFFFF700FFF7
      DE009C636B009C636B00D69C730084E7F70042C68C00006B080042BD730042C6
      8C0039BD6300006B0800EFD6B500734242000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000C68C7B00FFFFF7009C31
      00009C3100009C3100009C310000FFEFDE00FFEFDE00F7E7CE00F7DEC600F7DE
      BD00F7DEBD009C6B630000000000000000000000000000000000000000000000
      00000000000000000000000000003EB3FF0000CFFF0000000000000000000000
      000000000000000000000000000000000000DEA57B00CE946B00CE946B00CE94
      6B009C636B00C6A584008CEFF7008CEFF7008CEFF7005A524200006B080039BD
      6300006B0800EFCEAD00FFE7C600734242000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000CE947300FFFFF7009C31
      0000FFFFFF005A5AF700738CF700FFEFE700FFEFDE00F7E7D600F7E7CE00F7DE
      C600F7DEBD009C6B630000000000000000000000000000000000000000000000
      000000000000000000003EB3FF0046DDFF0000CFFF0046DDFF00000000000000
      000000000000000000000000000000000000000000000073AD00FFFFF7008CEF
      F7008CEFF7008CEFF7000073AD000073AD000073AD00CE946B006B9C6B00006B
      0800F7E7C600FFE7C600FFEFD600734242000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000DEAD8400FFFFF7009C31
      0000DEE7FF00FFFFFF007B94F700FFF7F700FFF7EF00FFEFDE00FFEFDE00D6BD
      9C00D6B594009C6B630000000000000000000000000000000000000000000000
      0000000000003EB3FF003EB3FF003EB3FF0000CFFF0000000000000000000000
      00000000000000000000000000000000000000000000000000000073AD000073
      AD000073AD000073AD00000000000000000000000000CE946B00FFFFF700FFFF
      EF00FFF7E700FFF7E700FFF7E700734242000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000DEAD8400FFFFF7009C31
      0000FFFFFF00FFFFFF00FFFFFF007B94F700FFF7F700F7DECE00B5847B00B584
      7B00B5847B00B5847B0000000000000000000000000000000000000000000000
      00000000000000000000000000003EB3FF0000CFFF0000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000D69C7300FFFFF700FFFF
      F700FFFFEF00EFCEAD00B5A58C00734242000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000DEAD8C00FFFFF700FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF008C9CF700F7DECE00B5847B00DEA5
      7300DEA573000000000000000000000000000000000000000000000000000000
      00000000000000000000000000003EB3FF0000CFFF0000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000DEA57B00FFFFF700FFFF
      F700FFF7DE009C636B009C636B00D69C73000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000DEAD8C00FFFFF700FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00F7DECE00B5847B00DEA5
      7300B5847B000000000000000000000000000000000000000000000000000000
      00000000000000000000000000003EB3FF0000CFFF0000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000DEA57B00CE946B00CE94
      6B00CE946B009C636B00D69C7300000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000DEA58400DEA58400DEA5
      8400DEA58400DEA58400DEA58400DEA58400DEA58400DEA58400B5847B000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000003EB3FF00009AFF0000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
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
      00000000000000000000000000000000FFFF8003800300008003000100030000
      80033FF000010000800300000001000080030000000100008003000000000000
      80037FF80000000080038000000000008003C001000000008003FE3F00000000
      8003FC1F800000008003F80FC38000008003FE3FFF8000008007FE3FFF800000
      8007FE3FFF810000801FFE3FFFFF0000FFFFF8F8FFFFFFFFF83FFAFAFC7FE3FF
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
  object qyProvas: TUMZQuery
    Connection = DM.db
    BeforeOpen = qyProvasBeforeOpen
    OnNewRecord = qyProvasNewRecord
    SQL.Strings = (
      'SELECT'
      '   *'
      'FROM'
      '   leitora_provas'
      'ORDER BY'
      '  cd_prova DESC')
    Params = <>
    Left = 124
    Top = 113
    object qyProvascd_prova: TIntegerField
      FieldName = 'cd_prova'
      Origin = 'WMESTRE12.leitora_provas.cd_prova'
    end
    object qyProvasnr_prova: TSmallintField
      FieldName = 'nr_prova'
      Origin = 'WMESTRE12.leitora_provas.nr_prova'
    end
    object qyProvasds_prova: TStringField
      FieldName = 'ds_prova'
      Origin = 'WMESTRE12.leitora_provas.ds_prova'
      Size = 100
    end
    object qyProvassn_permitir_maior: TSmallintField
      FieldName = 'sn_permitir_maior'
      Origin = 'WMESTRE12.leitora_provas.sn_permitir_maior'
    end
  end
  object srcProvas: TDataSource
    DataSet = qyProvas
    OnStateChange = srcProvasStateChange
    OnDataChange = srcProvasDataChange
    Left = 156
    Top = 113
  end
  object pmQtd: TPopupMenu
    OnPopup = pmQtdPopup
    Left = 184
    Top = 112
  end
  object ilDisciplinas: TImageList
    Left = 472
    Top = 400
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
      0000000000000000000000000000000000000000000000000000BD4A00000000
      0000000000000000000084210000842100008421000084210000842100000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000BD4A0000BD4A
      0000BD4A0000BD4A000084210000DEC6A500DE843100CE6B1800842100000000
      0000000000000000000000000000000000000000000000630000006300000063
      0000006300000063000000630000006300000000000000000000000000000000
      0000000000000000000000000000000000000000000073D6FF006BD6FF0031AD
      E700009CCE00009CCE00009CCE00000000000000000000000000000000000000
      00000000000000000000000000000000000000000000AD7B7B00F7DEC600F7DE
      C600F7DEBD00F7D6AD00F7D6AD00EFCE9C00EFCE9C00EFCE9C00EFCE9C00EFCE
      9C00EFCE9C009C6B630000000000000000000000000000000000BD4A00000000
      0000000000000000000084210000842100008421000084210000842100000000
      0000000000000000000000000000000000000063000000630000006B00000873
      0800087308004ABD630000730800006B00000063000063291000632910006329
      1000632910006329100063291000000000000000000073CEF700ADF7FF007BDE
      FF007BDEFF0063D6F70031ADE700009CCE00009CCE00009CCE00000000000000
      00000000000000000000000000000000000000000000AD7B7B00F7DECE00F7DE
      C600F7DEBD00F7D6B500F7D6AD00F7D6A500EFCE9C00EFCE9400EFCE9400EFCE
      9400EFCE94009C6B630000000000000000000000000000000000BD4A00000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000006300000063000039BD5A0039BD
      5A0052AD8400CECEC60042BD5A00007308000063000063311000F76B5200EF63
      4A00EF634A00EF5A4200E75A3900632910000000000029ADDE007BD6FF006BDE
      FF0073DEFF0073DEFF0073DEFF0073DEFF007BDEFF007BE7FF007BDEFF007BDE
      FF00009CCE0000000000000000000000000000000000AD7B7B00F7E7CE00F7E7
      CE00F7DEC600F7DEBD00F7DEB500F7D6AD00F7D6A500EFCE9400EFCE9400EFCE
      9400EFCE94009C6B630000000000000000000000000000000000BD4A00000000
      0000000000000000000084210000842100008421000084210000842100000000
      000000000000000000000000000000000000006300000063000039BD5A000873
      0800CECEC600CECEC60052BD630039BD5A0000630000E75A3900DEC6C600E7DE
      D600E75A3900EF634A00EF5A4200632910000000000031ADE70039B5E7007BDE
      FF007BDEFF007BDEFF009C3100009C3100009C3100009C3100007BDEFF007BE7
      FF0063D6F70000000000000000000000000000000000AD7B7B00F7E7D6009C31
      00009C3100009C3100009C310000F7D6B500F7D6AD00F7D6A500EFCE9C00EFCE
      9400EFCE94009C6B630000000000000000000000000000000000BD4A0000BD4A
      0000BD4A0000BD4A000084210000DEC6A500DE843100CE6B1800842100000000
      000000000000000000000000000000000000000000000063000000630000184A
      4200104A84004AAD9400184A4A000873080031520800EF634A00DECECE00E7DE
      D600FF8C9C00E75A3900EF63420063291000000000005ACEF70029ADDE00BDFF
      FF007BE7FF0084E7FF009C3100000039FF00185AFF008431210084E7FF0084EF
      FF005ACEF700009CCE00000000000000000000000000B5847B00FFEFDE009C31
      0000CED6FF007B94F7005A5AF700F7DEBD00F7DEB500F7D6AD00F7D6A500EFCE
      9400EFCE94009C6B630000000000000000000000000000000000BD4A00000000
      0000000000000000000084210000842100008421000084210000842100000000
      0000000000000000000000000000000000000000000010101000101010001018
      180008429C0008429C0008429C0000000000E75A3900EF634A00FF8C9C00E7DE
      D600E7DED600EF634A0063291000000000000000000063CEF70039B5E700C6FF
      FF008CF7FF0084EFFF009C3100007BBDFF00E7FFFF000039FF0084EFFF0084EF
      FF0063D6F700009CCE00000000000000000000000000BD847B00FFEFE7009C31
      0000DEE7FF00FFFFFF007B94F700F7DEC600F7DEBD00F7D6B500F7D6AD00F7D6
      A500EFCE9C009C6B630000000000000000000000000000000000BD4A00000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000001010100010101000101818000842
      9C0008429C0008429C0008429C0008429C00000000000852AD001063CE001063
      CE001063CE00085294000000000000000000000000007BD6FF005ACEF70029AD
      DE00B5F7FF00D6FFFF009C3100009C3100009C31000084312100185AFF007BD6
      FF0073DEFF00A5F7FF0042BDE7000000000000000000BD8C7B00FFF7F7009C31
      00009C3100009C3100009C3100005A5AF700636BF700F7DEBD00F7DEB500F7D6
      AD00F7D6A5009C6B630000000000000000000000000000000000BD4A00000000
      0000000000000000000084210000842100008421000084210000842100000000
      0000000000000000000000000000000000001010100010101000104263001052
      BD001052BD001052BD001052BD001052BD000852AD00298CF700298CF700298C
      F700298CF700298CF7000852940000000000000000007BDEFF005ACEF70031AD
      E700009CD600009CD600009CD6007BD6FF00E7FFFF00A5F7FF007BCEFF00297B
      EF0084E7FF00BDFFFF00B5F7FF000000000000000000BD8C7B00FFFFF700FFFF
      F700FFF7F700FFEFE700FFEFDE00F7E7D6007B94F700F7DEC600F7DEBD00F7D6
      B500F7D6AD009C6B630000000000000000000000000000000000BD4A0000BD4A
      0000BD4A0000BD4A000084210000DEC6A500DE843100CE6B1800842100000000
      000000000000000000000000000000000000101010001010100010425A001063
      CE001063CE001063CE001063CE001063CE002184E700299CFF00299CFF00299C
      FF00299CFF00299CFF00299CFF0008529400000000009CF7FF0073DEFF007BDE
      FF007BDEFF007BDEFF009C3100009C3100009C3100009C310000EFFFFF00EFFF
      FF00D6FFFF00F7FFFF00FFFFFF00009CCE0000000000C68C7B00FFFFF7009C31
      00009C3100009C3100009C310000FFEFDE00FFEFDE00F7E7CE00F7DEC600F7DE
      BD00F7DEBD009C6B630000000000000000000000000000000000BD4A00000000
      0000000000000000000084210000842100008421000084210000842100000000
      0000186B1000186B100000000000000000001010100010101000101818001873
      D600218CF700218CF700218CF7001873D600299CFF00319CFF00319CFF00319C
      FF00319CFF00319CFF00319CFF000852940000000000ADF7FF007BE7FF007BE7
      FF007BE7FF007BE7FF009C310000FFFFFF000039FF009C310000009CCE00009C
      CE00009CCE00009CCE00009CCE00009CCE0000000000CE947300FFFFF7009C31
      0000FFFFFF005A5AF700738CF700FFEFE700FFEFDE00F7E7D600F7E7CE00F7DE
      C600F7DEBD009C6B630000000000000000008421000084210000842100008421
      0000842100000000000000000000000000000000000000000000000000000000
      0000186B1000186B100000000000000000001010100010101000639C6B001018
      180010425A00184A7B00184A7B0010212100429CBD00319CEF00319CFF00319C
      FF00319CFF00319CFF00319CE70010425A0000000000CEFFFF0084EFFF008CF7
      FF008CF7FF008CF7FF009C3100007BBDFF00E7FFFF000039FF00A5F7FF00B5F7
      FF00009CCE0000000000000000000000000000000000DEAD8400FFFFF7009C31
      0000DEE7FF00FFFFFF007B94F700FFF7F700FFF7EF00FFEFDE00FFEFDE00D6BD
      9C00D6B594009C6B6300000000000000000084210000DEC6A500DE843100CE6B
      1800842100000000000000000000000000000000000000000000186B10001873
      10001873100018731000186B1000186B1000000000001010100010101000639C
      6B00639C6B0010101000101010000000000008529400217BD60010425A001042
      5A0010425A00217BD600104A840010426B0000000000A5F7FF00A5F7FF008CF7
      FF008CF7FF0094F7FF009C310000FFFFFF00FFFFFF000039FF000063EF00009C
      CE000000000000000000000000000000000000000000DEAD8400FFFFF7009C31
      0000FFFFFF00FFFFFF00FFFFFF007B94F700FFF7F700F7DECE00B5847B00B584
      7B00B5847B00B5847B0000000000000000008421000084210000842100008421
      0000842100000000000000000000000000000000000000000000186B10001873
      10001873100018731000186B1000186B10000000000000000000101010001010
      1000101010001010100000000000000000000000000008529400085294000852
      94000852940010425A0010425A00000000000000000000000000009CCE00009C
      CE00009CCE00009CCE0000000000000000000000000000000000000000000039
      FF000000000000000000000000000000000000000000DEAD8C00FFFFF700FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF008C9CF700F7DECE00B5847B00DEA5
      7300DEA573000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000187310001873100000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000085294000852
      940008529400104A840000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000DEAD8C00FFFFF700FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00F7DECE00B5847B00DEA5
      7300B5847B000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000186B1000186B100000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000DEA58400DEA58400DEA5
      8400DEA58400DEA58400DEA58400DEA58400DEA58400DEA58400B5847B000000
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
      00000000000000000000000000000000DC1FFFFFFFFFFFFFC01F80FF81FF8003
      DC1F0001803F8003DFFF000080078003DC1F000080078003C01F800080038003
      DC1F810180038003DFFF008380018003DC1F000180018003C01F000080008003
      DC1300008000800307F300008007800307C08100800F800307C0C381C3EF8007
      FFF3FFC3FFFF8007FFF3FFFFFFFF801F00000000000000000000000000000000
      000000000000}
  end
  object qyTurmas: TUMZQuery
    Connection = DM.db
    SQL.Strings = (
      'SELECT'
      #9'a.nr_anosemestre,'
      #9'a.cd_turma,'
      #9'g.cd_prova'
      'FROM'
      #9'leitora_provas_alunos a'
      
        #9#9'INNER JOIN leitora_provas_gabaritos g ON (g.cd_prova_gabarito ' +
        '= a.cd_prova_gabarito)'
      'WHERE'
      #9'g.cd_prova = :cd_prova'
      'GROUP BY'
      #9'a.nr_anosemestre,'
      #9'a.cd_turma')
    Params = <
      item
        DataType = ftInteger
        Name = 'cd_prova'
        ParamType = ptUnknown
        Size = 4
      end>
    DataSource = srcProvas
    Left = 344
    Top = 56
    ParamData = <
      item
        DataType = ftInteger
        Name = 'cd_prova'
        ParamType = ptUnknown
        Size = 4
      end>
    object qyTurmasnr_anosemestre: TSmallintField
      FieldName = 'nr_anosemestre'
      Origin = 'WMESTRE12.leitora_provas_alunos.nr_anosemestre'
    end
    object qyTurmascd_turma: TStringField
      FieldName = 'cd_turma'
      Origin = 'WMESTRE12.leitora_provas_alunos.cd_turma'
      Size = 50
    end
    object qyTurmascd_prova: TIntegerField
      FieldName = 'cd_prova'
      Origin = 'WMESTRE12.leitora_provas_gabaritos.cd_prova'
    end
  end
  object srcTurmas: TDataSource
    DataSet = qyTurmas
    OnDataChange = srcTurmasDataChange
    Left = 368
    Top = 56
  end
  object qyAlunos: TUMZQuery
    Connection = DM.db
    Filtered = True
    SQL.Strings = (
      'SELECT'
      '   pa.cd_prova_aluno,'
      '   pa.cd_pessoa,'
      '   p.nm_pessoa,'
      '   pa.nr_acertos,'
      '   pa.cd_prova_gabarito,'
      '   pg.ds_nome_gabarito'
      'FROM'
      '   pessoas p'
      
        '      INNER JOIN leitora_provas_alunos pa ON (pa.cd_pessoa = p.c' +
        'd_pessoa)'
      
        '         INNER JOIN leitora_provas_gabaritos pg ON (pg.cd_prova_' +
        'gabarito = pa.cd_prova_gabarito)'
      'WHERE'
      '   pa.cd_turma = :cd_turma AND'
      '   pa.nr_anosemestre = :nr_anosemestre AND'
      '   pg.cd_prova = :cd_prova'
      'GROUP BY'
      '   pa.cd_prova_aluno'
      'ORDER BY'
      '   p.nm_pessoa')
    Params = <
      item
        DataType = ftString
        Name = 'cd_turma'
        ParamType = ptUnknown
        Value = '0'
      end
      item
        DataType = ftString
        Name = 'nr_anosemestre'
        ParamType = ptUnknown
        Value = '0'
      end
      item
        DataType = ftInteger
        Name = 'cd_prova'
        ParamType = ptUnknown
        Size = 4
      end>
    DataSource = srcTurmas
    Left = 416
    Top = 56
    ParamData = <
      item
        DataType = ftString
        Name = 'cd_turma'
        ParamType = ptUnknown
        Value = '0'
      end
      item
        DataType = ftString
        Name = 'nr_anosemestre'
        ParamType = ptUnknown
        Value = '0'
      end
      item
        DataType = ftInteger
        Name = 'cd_prova'
        ParamType = ptUnknown
        Size = 4
      end>
    object qyAlunoscd_prova_aluno: TIntegerField
      FieldName = 'cd_prova_aluno'
      Origin = 'WMESTRE12.leitora_provas_alunos.cd_prova_aluno'
    end
    object qyAlunoscd_pessoa: TIntegerField
      FieldName = 'cd_pessoa'
    end
    object qyAlunosnm_pessoa: TStringField
      FieldName = 'nm_pessoa'
      Size = 60
    end
    object qyAlunosnr_acertos: TFloatField
      FieldName = 'nr_acertos'
      Origin = 'WMESTRE12.leitora_provas_alunos.nr_acertos'
      DisplayFormat = '0.000'
    end
    object qyAlunoscd_prova_gabarito: TIntegerField
      FieldName = 'cd_prova_gabarito'
    end
    object qyAlunosds_nome_gabarito: TStringField
      FieldName = 'ds_nome_gabarito'
      Size = 15
    end
  end
  object srcAlunos: TDataSource
    DataSet = qyAlunos
    OnDataChange = srcAlunosDataChange
    Left = 440
    Top = 56
  end
  object qyRespostas: TUMZQuery
    Connection = DM.db
    Filtered = True
    SQL.Strings = (
      'SELECT'
      #9'a.cd_prova_aluno,'
      #9'gr.cd_prova_disciplina,'
      #9'r.cd_prova_aluno_resposta,'
      #9'r.nr_questao,'
      #9'd.sigla,'
      #9'gr.vl_peso,'
      #9'r.ds_resposta AS ds_resposta_aluno,'
      #9'gr.ds_resposta AS ds_resposta_gabarito,'
      #9'r.cd_situacao,'
      '  r.nr_parte'
      'FROM'
      #9'leitora_provas_alunos_resp r'
      
        #9#9'INNER JOIN leitora_provas_alunos a ON (a.cd_prova_aluno = r.cd' +
        '_prova_aluno)'
      
        #9#9#9'INNER JOIN leitora_provas_gabaritos_resp gr ON (gr.cd_prova_g' +
        'abarito = a.cd_prova_gabarito AND gr.nr_questao = r.nr_questao A' +
        'ND gr.nr_parte = r.nr_parte)'
      
        #9#9#9#9'LEFT JOIN leitora_provas_disciplinas pd ON (pd.cd_prova_disc' +
        'iplina = gr.cd_prova_disciplina)'
      
        #9#9#9#9#9'LEFT JOIN disciplinas d ON (d.codigo = pd.cd_disciplina AND' +
        ' d.curso = pd.cd_curso)'
      'WHERE'
      #9'(r.nr_correcao = 1 OR isNull(r.nr_correcao)) AND'
      #9'gr.sn_discursiva <> 1 AND'
      #9'r.cd_prova_aluno = :cd_prova_aluno'
      'ORDER BY'
      #9'r.nr_parte, r.nr_questao')
    Params = <
      item
        DataType = ftInteger
        Name = 'cd_prova_aluno'
        ParamType = ptUnknown
        Size = 4
      end>
    DataSource = srcAlunos
    Left = 496
    Top = 56
    ParamData = <
      item
        DataType = ftInteger
        Name = 'cd_prova_aluno'
        ParamType = ptUnknown
        Size = 4
      end>
    object qyRespostascd_prova_aluno: TIntegerField
      FieldName = 'cd_prova_aluno'
    end
    object qyRespostascd_prova_disciplina: TIntegerField
      FieldName = 'cd_prova_disciplina'
    end
    object qyRespostascd_prova_aluno_resposta: TIntegerField
      FieldName = 'cd_prova_aluno_resposta'
    end
    object qyRespostasnr_questao: TSmallintField
      FieldName = 'nr_questao'
    end
    object qyRespostasds_resposta_aluno: TStringField
      FieldName = 'ds_resposta_aluno'
      FixedChar = True
      Size = 3
    end
    object qyRespostasds_resposta_gabarito: TStringField
      FieldName = 'ds_resposta_gabarito'
      FixedChar = True
      Size = 3
    end
    object qyRespostascd_situacao: TSmallintField
      FieldName = 'cd_situacao'
    end
    object qyRespostasds_situacao: TStringField
      FieldKind = fkLookup
      FieldName = 'ds_situacao'
      LookupDataSet = DM.qyAlunosRespostasSituacoes
      LookupKeyFields = 'cd_situacao'
      LookupResultField = 'ds_situacao'
      KeyFields = 'cd_situacao'
      Size = 50
      Lookup = True
    end
    object qyRespostassigla: TStringField
      FieldName = 'sigla'
      Size = 5
    end
    object qyRespostasvl_peso: TFloatField
      FieldName = 'vl_peso'
    end
    object qyRespostasnr_parte: TIntegerField
      FieldName = 'nr_parte'
    end
  end
  object srcRespostas: TDataSource
    DataSet = qyRespostas
    Left = 520
    Top = 56
  end
  object srcAcertosEspecifico: TDataSource
    DataSet = qyAcertosEspecifico
    Left = 520
    Top = 80
  end
  object qyAcertosEspecifico: TUMZQuery
    Connection = DM.db
    SQL.Strings = (
      'SELECT'
      #9'CONCAT('#39'Acertos na disciplina: '#39',d.descricao) AS ds_disciplina,'
      #9'pad.nr_acertos'
      'FROM'
      #9'leitora_provas_alunos_dis pad'
      
        #9#9'LEFT JOIN leitora_provas_disciplinas pd ON (pd.cd_prova_discip' +
        'lina = pad.cd_prova_disciplina)'
      
        #9#9#9'LEFT JOIN disciplinas d ON (d.codigo = pd.cd_disciplina AND d' +
        '.curso = pd.cd_curso)'
      'WHERE'
      #9'pad.cd_prova_aluno = :cd_prova_aluno'
      'ORDER BY'
      #9'pad.cd_prova_disciplina')
    Params = <
      item
        DataType = ftString
        Name = 'cd_prova_aluno'
        ParamType = ptUnknown
      end>
    DataSource = srcAlunos
    Left = 496
    Top = 80
    ParamData = <
      item
        DataType = ftString
        Name = 'cd_prova_aluno'
        ParamType = ptUnknown
      end>
    object qyAcertosEspecificods_disciplina: TStringField
      FieldName = 'ds_disciplina'
      Size = 100
    end
    object qyAcertosEspecificonr_acertos: TFloatField
      FieldName = 'nr_acertos'
      Origin = 'WMESTRE12.leitora_provas_alunos_dis.nr_acertos'
      DisplayFormat = '0.000'
    end
  end
  object psFormula: TPSScript
    CompilerOptions = []
    OnCompile = psFormulaCompile
    OnExecute = psFormulaExecute
    Plugins = <>
    UsePreProcessor = False
    Left = 136
    Top = 200
  end
  object qyRespostasDiscursivas: TUMZQuery
    Connection = DM.db
    Filtered = True
    SQL.Strings = (
      'SELECT'
      #9'a.cd_prova_aluno,'
      #9'gr.cd_prova_disciplina,'
      #9'r.cd_prova_aluno_resposta,'
      #9'r.nr_questao,'
      #9'd.sigla,'
      #9'gr.vl_peso,'
      #9'r.db_pontuacao,'
      '  r.nr_parte'
      'FROM'
      #9'leitora_provas_alunos_resp r'
      
        #9#9'INNER JOIN leitora_provas_alunos a ON (a.cd_prova_aluno = r.cd' +
        '_prova_aluno)'
      
        #9#9#9'INNER JOIN leitora_provas_gabaritos_resp gr ON (gr.cd_prova_g' +
        'abarito = a.cd_prova_gabarito AND gr.nr_questao = r.nr_questao A' +
        'ND gr.nr_parte = r.nr_parte)'
      
        #9#9#9#9'LEFT JOIN leitora_provas_disciplinas pd ON (pd.cd_prova_disc' +
        'iplina = gr.cd_prova_disciplina)'
      
        #9#9#9#9#9'LEFT JOIN disciplinas d ON (d.codigo = pd.cd_disciplina AND' +
        ' d.curso = pd.cd_curso)'
      'WHERE'
      #9'(r.nr_correcao = 1 OR isNull(r.nr_correcao)) AND'
      #9'gr.sn_discursiva = 1 AND'
      #9'r.cd_prova_aluno = :cd_prova_aluno'
      'ORDER BY'
      #9'r.nr_parte, r.nr_questao')
    Params = <
      item
        DataType = ftInteger
        Name = 'cd_prova_aluno'
        ParamType = ptUnknown
        Size = 4
      end>
    DataSource = srcAlunos
    Left = 560
    Top = 56
    ParamData = <
      item
        DataType = ftInteger
        Name = 'cd_prova_aluno'
        ParamType = ptUnknown
        Size = 4
      end>
    object qyRespostasDiscursivascd_prova_aluno: TIntegerField
      FieldName = 'cd_prova_aluno'
    end
    object qyRespostasDiscursivascd_prova_disciplina: TIntegerField
      FieldName = 'cd_prova_disciplina'
    end
    object qyRespostasDiscursivascd_prova_aluno_resposta: TIntegerField
      FieldName = 'cd_prova_aluno_resposta'
    end
    object qyRespostasDiscursivasnr_questao: TSmallintField
      FieldName = 'nr_questao'
    end
    object qyRespostasDiscursivassigla: TStringField
      FieldName = 'sigla'
      Size = 5
    end
    object qyRespostasDiscursivasvl_peso: TFloatField
      FieldName = 'vl_peso'
    end
    object qyRespostasDiscursivasdb_pontuacao: TFloatField
      FieldName = 'db_pontuacao'
    end
    object qyRespostasDiscursivasnr_parte: TIntegerField
      FieldName = 'nr_parte'
    end
  end
  object srcRespostasDiscursivas: TDataSource
    DataSet = qyRespostasDiscursivas
    Left = 584
    Top = 56
  end
  object pmInfoProva: TPopupMenu
    Left = 736
    Top = 56
    object hjgjhj1: TMenuItem
      Caption = 'Total de registros:'
    end
    object otaldealunoscomnotas1: TMenuItem
      Caption = 'Total de alunos com notas:'
    end
    object otaldealunoscomnotas2: TMenuItem
      Caption = 'Total de alunos sem notas:'
    end
  end
end
