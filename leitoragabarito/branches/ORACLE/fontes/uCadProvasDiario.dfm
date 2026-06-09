object frmCadProvasDiario: TfrmCadProvasDiario
  Left = 108
  Top = 84
  Caption = 'T'#205'TULO'
  ClientHeight = 532
  ClientWidth = 792
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
  OnCloseQuery = FormCloseQuery
  OnKeyDown = FormKeyDown
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object Bevel3: TBevel
    Left = 0
    Top = 25
    Width = 11
    Height = 473
    Align = alLeft
    Shape = bsSpacer
  end
  object Bevel7: TBevel
    Left = 0
    Top = 498
    Width = 792
    Height = 9
    Align = alBottom
    Shape = bsSpacer
  end
  object Label3: TLabel
    Left = 336
    Top = 80
    Width = 48
    Height = 13
    Caption = 'Descri'#231#227'o'
  end
  object pnTitulo: TPanel
    Left = 0
    Top = 0
    Width = 792
    Height = 25
    Align = alTop
    BevelOuter = bvLowered
    Caption = 'Provas'
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
    Width = 366
    Height = 473
    Align = alLeft
    BevelOuter = bvNone
    TabOrder = 1
    object Bevel5: TBevel
      Left = 0
      Top = 0
      Width = 366
      Height = 5
      Align = alTop
      Shape = bsSpacer
      ExplicitWidth = 310
    end
    object grd: TDBGrid
      Left = 0
      Top = 166
      Width = 366
      Height = 307
      Align = alClient
      BorderStyle = bsNone
      DataSource = dsProvasDiario
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
          Alignment = taCenter
          Expanded = False
          FieldName = 'bimestre'
          Title.Alignment = taCenter
          Title.Caption = 'Bim.'
          Width = 30
          Visible = True
        end
        item
          Alignment = taCenter
          Expanded = False
          FieldName = 'nro_nota'
          Title.Alignment = taCenter
          Title.Caption = 'Nro.'
          Width = 30
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'data'
          Title.Caption = 'Data'
          Width = 76
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'assunto'
          Title.Caption = 'Assunto'
          Width = 150
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'turma'
          Title.Caption = 'Turma'
          Width = 50
          Visible = True
        end>
    end
    object Panel2: TPanel
      Left = 0
      Top = 5
      Width = 366
      Height = 25
      Align = alTop
      BevelOuter = bvLowered
      Caption = 'PROVAS DO DI'#193'RIO'
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
      Width = 366
      Height = 5
      Align = alTop
      BevelOuter = bvNone
      TabOrder = 2
    end
    object Panel1: TPanel
      Left = 0
      Top = 35
      Width = 366
      Height = 131
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
      object Label8: TLabel
        Left = 44
        Top = 42
        Width = 33
        Height = 13
        Alignment = taRightJustify
        Caption = 'Turma:'
      end
      object Label9: TLabel
        Left = 29
        Top = 70
        Width = 48
        Height = 13
        Alignment = taRightJustify
        Caption = 'Disciplina:'
      end
      object SpeedButton1: TSpeedButton
        Left = 279
        Top = 66
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
      object SpeedButton2: TSpeedButton
        Left = 279
        Top = 38
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
      object Label12: TLabel
        Left = 34
        Top = 99
        Width = 43
        Height = 13
        Caption = 'Bimestre:'
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
        TabOrder = 4
        OnClick = UpDown3Click
      end
      object cbAnoSemextre: TCheckBox
        Left = 83
        Top = 12
        Width = 17
        Height = 17
        Checked = True
        State = cbChecked
        TabOrder = 5
        OnClick = cbAnoSemextreClick
      end
      object edTurma: TMaskEdit
        Tag = 1
        Left = 104
        Top = 38
        Width = 175
        Height = 22
        TabStop = False
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
        TabOrder = 1
      end
      object edDisciplina: TMaskEdit
        Tag = 1
        Left = 104
        Top = 66
        Width = 175
        Height = 22
        TabStop = False
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
        TabOrder = 2
      end
      object UpDown2: TUpDown
        Left = 137
        Top = 94
        Width = 14
        Height = 24
        Min = -100
        TabOrder = 6
        OnClick = UpDown2Click
      end
      object txtBimestre: TMaskEdit
        Tag = 1
        Left = 104
        Top = 94
        Width = 33
        Height = 22
        TabStop = False
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
        TabOrder = 3
        Text = '1'
      end
      object cbSimulado: TCheckBox
        Left = 184
        Top = 94
        Width = 118
        Height = 27
        Caption = 'SIMULADO'
        TabOrder = 7
        OnClick = cbSimuladoClick
      end
    end
  end
  object toolPessoa: TToolBar
    Left = 0
    Top = 507
    Width = 792
    Height = 25
    Align = alBottom
    ButtonWidth = 121
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
    object Panel3: TPanel
      Left = 8
      Top = 0
      Width = 217
      Height = 22
      TabOrder = 0
      object ckbSobreescrever: TCheckBox
        Left = 11
        Top = 3
        Width = 198
        Height = 17
        Caption = 'Sobreescrever resultados em branco'
        Checked = True
        State = cbChecked
        TabOrder = 0
      end
    end
    object ToolButton3: TToolButton
      Left = 225
      Top = 0
      Caption = 'Importar Gabaritos'
      ImageIndex = 8
      OnClick = ToolButton3Click
    end
    object ToolButton5: TToolButton
      Left = 346
      Top = 0
      Caption = 'Importar Resultados'
      ImageIndex = 9
      OnClick = ToolButton5Click
    end
    object ToolButton4: TToolButton
      Left = 467
      Top = 0
      Width = 8
      Caption = 'ToolButton4'
      ImageIndex = 9
      Style = tbsSeparator
    end
    object btnFechar: TToolButton
      Left = 475
      Top = 0
      AutoSize = True
      Caption = 'F12 Fechar'
      ImageIndex = 7
      OnClick = btnFecharClick
    end
    object ToolButton2: TToolButton
      Left = 560
      Top = 0
      Width = 8
      Caption = 'ToolButton2'
      ImageIndex = 8
      Style = tbsSeparator
    end
  end
  object Panel4: TPanel
    Left = 377
    Top = 25
    Width = 415
    Height = 473
    Align = alClient
    BevelOuter = bvNone
    TabOrder = 3
    object Bevel6: TBevel
      Left = 0
      Top = 0
      Width = 415
      Height = 5
      Align = alTop
      Shape = bsSpacer
      ExplicitWidth = 471
    end
    object Panel5: TPanel
      Left = 0
      Top = 5
      Width = 415
      Height = 468
      Align = alClient
      Caption = 'Panel5'
      TabOrder = 0
      object Bevel1: TBevel
        Left = 32
        Top = 6
        Width = 417
        Height = 338
      end
      object pgDisciplinas: TPageControl
        Left = 1
        Top = 1
        Width = 413
        Height = 466
        ActivePage = tsInformacoes
        Align = alClient
        Images = ilDisciplinas
        Style = tsFlatButtons
        TabOrder = 0
        OnChanging = pgDisciplinasChanging
        object tsInformacoes: TTabSheet
          Caption = 'Informa'#231#245'es da Prova'
          object Label1: TLabel
            Left = 10
            Top = 3
            Width = 128
            Height = 13
            Caption = 'N'#250'mero da prova no di'#225'rio:'
            FocusControl = DBEdit1
          end
          object Label2: TLabel
            Left = 158
            Top = 48
            Width = 33
            Height = 13
            Caption = 'Turma:'
            FocusControl = DBEdit2
          end
          object Label4: TLabel
            Left = 10
            Top = 48
            Width = 71
            Height = 13
            Caption = 'Ano/Semestre:'
            FocusControl = DBEdit3
          end
          object Label5: TLabel
            Left = 10
            Top = 159
            Width = 48
            Height = 13
            Caption = 'Disciplina:'
            FocusControl = DBEdit4
          end
          object Label6: TLabel
            Left = 307
            Top = 48
            Width = 43
            Height = 13
            Caption = 'Bimestre:'
            FocusControl = DBEdit5
          end
          object Label10: TLabel
            Left = 10
            Top = 92
            Width = 26
            Height = 13
            Caption = 'Data:'
            FocusControl = DBEdit6
          end
          object Label11: TLabel
            Left = 158
            Top = 92
            Width = 87
            Height = 13
            Caption = 'Assunto da Prova:'
            FocusControl = DBEdit7
          end
          object Label16: TLabel
            Left = 10
            Top = 224
            Width = 47
            Height = 13
            Caption = 'Professor:'
            FocusControl = DBEdit12
          end
          object bev: TBevel
            Left = 10
            Top = 146
            Width = 392
            Height = 2
            Shape = bsBottomLine
          end
          object Bevel2: TBevel
            Left = 10
            Top = 213
            Width = 431
            Height = 2
            Shape = bsBottomLine
          end
          object Bevel4: TBevel
            Left = 10
            Top = 278
            Width = 392
            Height = 2
            Shape = bsBottomLine
          end
          object Bevel8: TBevel
            Left = 10
            Top = 374
            Width = 392
            Height = 2
            Shape = bsBottomLine
          end
          object DBEdit1: TDBEdit
            Left = 10
            Top = 19
            Width = 134
            Height = 21
            Color = clScrollBar
            DataField = 'nro_nota'
            DataSource = dsProvasDiario
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = [fsBold]
            ParentFont = False
            ReadOnly = True
            TabOrder = 0
          end
          object DBEdit2: TDBEdit
            Left = 158
            Top = 64
            Width = 135
            Height = 21
            Color = clScrollBar
            DataField = 'turma'
            DataSource = dsProvasDiario
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = [fsBold]
            ParentFont = False
            ReadOnly = True
            TabOrder = 1
          end
          object DBEdit3: TDBEdit
            Left = 10
            Top = 64
            Width = 134
            Height = 21
            Color = clScrollBar
            DataField = 'anosemestre'
            DataSource = dsProvasDiario
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = [fsBold]
            ParentFont = False
            ReadOnly = True
            TabOrder = 2
          end
          object DBEdit4: TDBEdit
            Left = 10
            Top = 175
            Width = 389
            Height = 21
            Color = clScrollBar
            DataField = 'ds_disciplina'
            DataSource = dsProvasDiario
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = [fsBold]
            ParentFont = False
            ReadOnly = True
            TabOrder = 3
          end
          object DBEdit5: TDBEdit
            Left = 307
            Top = 64
            Width = 92
            Height = 21
            Color = clScrollBar
            DataField = 'bimestre'
            DataSource = dsProvasDiario
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = [fsBold]
            ParentFont = False
            ReadOnly = True
            TabOrder = 4
          end
          object DBEdit6: TDBEdit
            Left = 10
            Top = 108
            Width = 134
            Height = 21
            Color = clScrollBar
            DataField = 'data'
            DataSource = dsProvasDiario
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = [fsBold]
            ParentFont = False
            ReadOnly = True
            TabOrder = 5
          end
          object DBEdit7: TDBEdit
            Left = 158
            Top = 108
            Width = 241
            Height = 21
            Color = clScrollBar
            DataField = 'assunto'
            DataSource = dsProvasDiario
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = [fsBold]
            ParentFont = False
            ReadOnly = True
            TabOrder = 6
          end
          object DBEdit12: TDBEdit
            Left = 160
            Top = 240
            Width = 239
            Height = 21
            Color = clScrollBar
            DataField = 'nm_professor'
            DataSource = dsProvasDiario
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = [fsBold]
            ParentFont = False
            ReadOnly = True
            TabOrder = 7
          end
          object DBCheckBox1: TDBCheckBox
            Left = 10
            Top = 298
            Width = 220
            Height = 17
            AllowGrayed = True
            Caption = 'Comp'#245'e nota substitu'#237'vel'
            Color = clBtnFace
            DataField = 'sn_compoe'
            DataSource = dsProvasDiario
            ParentColor = False
            ReadOnly = True
            TabOrder = 8
            ValueChecked = '1'
            ValueUnchecked = '0'
          end
          object DBCheckBox2: TDBCheckBox
            Left = 10
            Top = 321
            Width = 196
            Height = 17
            AllowGrayed = True
            Caption = 'Nota Especial (Recupera'#231#227'o)'
            Color = clBtnFace
            DataField = 'sn_especial'
            DataSource = dsProvasDiario
            ParentColor = False
            ReadOnly = True
            TabOrder = 9
            ValueChecked = '1'
            ValueUnchecked = '0'
          end
          object DBCheckBox3: TDBCheckBox
            Left = 10
            Top = 344
            Width = 284
            Height = 17
            AllowGrayed = True
            Caption = 'Prova Bloqueada para digita'#231#227'o do professor'
            Color = clBtnFace
            DataField = 'sn_bloqueado'
            DataSource = dsProvasDiario
            ParentColor = False
            ReadOnly = True
            TabOrder = 10
            ValueChecked = '1'
            ValueUnchecked = '0'
          end
          object DBCheckBox4: TDBCheckBox
            Left = 10
            Top = 392
            Width = 392
            Height = 17
            AllowGrayed = True
            Caption = 'Gabarito j'#225' importado para a leitora'
            Color = clBtnFace
            DataField = 'sn_leitora'
            DataSource = dsProvasDiario
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -16
            Font.Name = 'MS Sans Serif'
            Font.Style = [fsBold]
            ParentColor = False
            ParentFont = False
            ReadOnly = True
            TabOrder = 11
            ValueChecked = '1'
            ValueUnchecked = '0'
          end
          object DBEdit9: TDBEdit
            Left = 10
            Top = 240
            Width = 131
            Height = 21
            Color = clScrollBar
            DataField = 'cd_professor'
            DataSource = dsProvasDiario
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = [fsBold]
            ParentFont = False
            ReadOnly = True
            TabOrder = 12
          end
        end
        object tsGabaritos: TTabSheet
          Caption = 'Gabaritos'
          ImageIndex = 2
          object grdGabaritos: TDBGrid
            Left = 0
            Top = 0
            Width = 405
            Height = 434
            Align = alClient
            BorderStyle = bsNone
            Color = clBtnFace
            DataSource = srcGabaritos
            Options = [dgTitles, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgConfirmDelete, dgCancelOnExit, dgMultiSelect]
            TabOrder = 0
            TitleFont.Charset = DEFAULT_CHARSET
            TitleFont.Color = clWindowText
            TitleFont.Height = -11
            TitleFont.Name = 'MS Sans Serif'
            TitleFont.Style = []
            OnDblClick = grdGabaritosDblClick
            Columns = <
              item
                Expanded = False
                FieldName = 'ds_nome_gabarito'
                Title.Caption = 'Gabarito'
                Width = 160
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'cd_prova_gabarito'
                Title.Caption = 'C'#243'd. Gabarito'
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
            Width = 405
            Height = 434
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
            Columns = <
              item
                Expanded = False
                FieldName = 'cd_pessoa'
                Title.Caption = 'C'#243'd.Pessoa'
                Width = 85
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'nm_pessoa'
                Title.Caption = 'Pessoa'
                Width = 220
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'nr_acertos'
                Title.Caption = 'Acertos'
                Visible = True
              end>
          end
        end
      end
    end
  end
  object ImageList1: TImageList
    Left = 440
    Top = 400
    Bitmap = {
      494C01010A000E00040010001000FFFFFFFFFF10FFFFFFFFFFFFFFFF424D3600
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
      000000000000000000000000000000000000000000000073AD000073AD000073
      AD000073AD000073AD000073AD000073AD000073AD000073AD000073AD000073
      AD000073AD000073AD0000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000009C636B009C636B009C636B009C63
      6B009C636B009C636B007342420063CEF70063CEF70063CEF70063CEF70063CE
      F7001084A5000073AD0000000000000000009B9C9B009B9C9B00636563006365
      6300636563006365630063656300636563006365630063656300636563006365
      6300636563009B9C9B0000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000009C636B00FFF7DE00FFE7C600FFE7
      C600F7DEBD00FFE7C60021392100006B0800006B0800006B08004ACEA50063CE
      F7001084A50063CEE7000073AD000000000063656300CECFCE00000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000CECFCE00636563009B9C9B00000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000009C6B6B00FFFFEF00FFEFCE00F7DE
      BD00EFD6B500FFE7C6007342420052CED600006B0800006B0800006B080042BD
      7B001084A50094EFF7000073AD000000000063656300CECFCE00636563006365
      6300636563006365630063656300636563006365630063656300636563006365
      6300CECFCE006365630063656300000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000094737300FFFFF700FFEFD600FFEF
      CE00F7DEBD00FFE7C600734242006BD6F7006BD6F700006B080018523100006B
      0800187B8C00A5EFF7000073AD000000000063656300CECFCE00CECFCE00CECF
      CE00CECFCE00CECFCE00CECFCE00CECFCE00CECFCE00CECFCE00CECFCE00CECF
      CE00CECFCE006365630063656300000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000CE946B00FFFFF700FFF7E700FFEF
      D600FFE7C600FFEFD6007342420073DEF70073DEF70042C68C00006B080039BD
      6300006B080094EFF70052CED6000073AD0063656300CECFCE00CECFCE00CECF
      CE00CECFCE00CECFCE00CECFCE00CECFCE00CECFCE00CECFCE00CECFCE00009A
      000000FF00006365630063656300000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000CE946B00FFFFF700FFFFEF00FFF7
      E700FFF7E700FFF7E7007342420094EFF70052CEBD006B946B00006B080039BD
      6300006B08006B9C6B0094948C000073AD009B9C9B0000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000006365630063656300000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000D69C7300FFFFF700FFFFF700FFFF
      EF00EFCEAD00B5A58C0073424200086B6B00006B0800006B080039BD630039BD
      6B0039BD6300006B0800006B08000073AD00000000009B9C9B00F3F3F300CECF
      CE00CECFCE00CECFCE00CECFCE00CECFCE00CECFCE00CECFCE00CECFCE00CECF
      CE00CECFCE00CECFCE009B9C9B00000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000DEA57B00FFFFF700FFFFF700FFF7
      DE009C636B009C636B00D69C730084E7F70042C68C00006B080042BD730042C6
      8C0039BD6300006B0800EFD6B5007342420000000000000000009B9C9B009B9C
      9B009B9C9B009B9C9B009B9C9B009B9C9B00000000009B9C9B009B9C9B009B9C
      9B009B9C9B009B9C9B009B9C9B00000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000DEA57B00CE946B00CE946B00CE94
      6B009C636B00C6A584008CEFF7008CEFF7008CEFF7005A524200006B080039BD
      6300006B0800EFCEAD00FFE7C600734242000000000000000000000000000000
      00000000000000000000000000003EB3FF0000CFFF0000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000073AD00FFFFF7008CEF
      F7008CEFF7008CEFF7000073AD000073AD000073AD00CE946B006B9C6B00006B
      0800F7E7C600FFE7C600FFEFD600734242000000000000000000000000000000
      000000000000000000003EB3FF0046DDFF0000CFFF0046DDFF00000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000000000000073AD000073
      AD000073AD000073AD00000000000000000000000000CE946B00FFFFF700FFFF
      EF00FFF7E700FFF7E700FFF7E700734242000000000000000000000000000000
      0000000000003EB3FF003EB3FF003EB3FF0000CFFF0000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000D69C7300FFFFF700FFFF
      F700FFFFEF00EFCEAD00B5A58C00734242000000000000000000000000000000
      00000000000000000000000000003EB3FF0000CFFF0000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000DEA57B00FFFFF700FFFF
      F700FFF7DE009C636B009C636B00D69C73000000000000000000000000000000
      00000000000000000000000000003EB3FF0000CFFF0000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000DEA57B00CE946B00CE94
      6B00CE946B009C636B00D69C7300000000000000000000000000000000000000
      00000000000000000000000000003EB3FF0000CFFF0000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
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
      0000000000000000000000000000000080038003000000000003000100000000
      00013FF000000000000100000000000000010000000000000000000000000000
      00007FF80000000000008000000000000000C001000000000000FE3F00000000
      8000FC1F00000000C380F80F00000000FF80FE3F00000000FF80FE3F00000000
      FF81FE3F00000000FFFFFE3F00000000FFFFF8F8FFFFFFFFF83FFAFAFC7FE3FF
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
  object qyProvasDiario: TUMZQuery
    Connection = DM.db
    OnCalcFields = qyProvasDiarioCalcFields
    AfterEdit = qyProvasDiarioAfterEdit
    OnNewRecord = qyProvasDiarioNewRecord
    SQL.Strings = (
      'SELECT'
      '   lp.nr_prova,'
      '   dp.cd_prova,'
      '   dp.cd_prova_leitora,'
      '   dp.nro_nota,'
      '   dp.turma,'
      '   dp.anosemestre,'
      '   dp.disciplina,'
      '   dp.bimestre,'
      '   DATE_FORMAT(dp.data,'#39'%d/%m/%Y'#39') AS data,'
      '   dp.assunto,'
      '   dp.sn_bloqueado,'
      '   dp.cd_professor,'
      '   dp.sn_compoe,'
      '   dp.sn_especial,'
      '   p.nm_pessoa AS nm_professor,'
      '   d.sigla AS ds_disciplina_sigla,'
      '   d.descricao AS ds_disciplina,'
      '   IF(isNull(lp.nr_prova),0,1) AS sn_leitora,'
      '   lp.cd_chave,'
      '   t.curso AS cd_curso,'
      '   t.serie AS nr_serie'
      'FROM'
      '   diario_provas dp      '
      
        '      INNER JOIN turmas t ON (t.anosemestre = dp.anosemestre AND' +
        ' t.codigo = dp.turma)'
      
        '      INNER JOIN disciplinas d ON (d.codigo = dp.disciplina AND ' +
        'd.curso = t.curso)'
      '      LEFT JOIN leitora_provas lp ON (lp.cd_chave = dp.cd_prova)'
      '      LEFT JOIN pessoas p ON (p.cd_pessoa = dp.cd_professor)'
      'WHERE'
      '   1=1'
      'ORDER BY'
      '   dp.nro_nota')
    Params = <>
    Left = 196
    Top = 193
    object qyProvasDiarionro_nota: TSmallintField
      FieldName = 'nro_nota'
    end
    object qyProvasDiarioturma: TStringField
      FieldName = 'turma'
      Size = 15
    end
    object qyProvasDiarioanosemestre: TSmallintField
      FieldName = 'anosemestre'
    end
    object qyProvasDiariodisciplina: TIntegerField
      FieldName = 'disciplina'
    end
    object qyProvasDiariobimestre: TSmallintField
      FieldName = 'bimestre'
    end
    object qyProvasDiariodata: TStringField
      FieldName = 'data'
      Size = 10
    end
    object qyProvasDiarioassunto: TStringField
      FieldName = 'assunto'
      Size = 200
    end
    object qyProvasDiariosn_bloqueado: TSmallintField
      FieldName = 'sn_bloqueado'
    end
    object qyProvasDiariocd_professor: TIntegerField
      FieldName = 'cd_professor'
    end
    object qyProvasDiariosn_compoe: TSmallintField
      FieldName = 'sn_compoe'
    end
    object qyProvasDiariosn_especial: TSmallintField
      FieldName = 'sn_especial'
    end
    object qyProvasDiarionm_professor: TStringField
      FieldName = 'nm_professor'
      Size = 60
    end
    object qyProvasDiariods_disciplina_sigla: TStringField
      FieldName = 'ds_disciplina_sigla'
      Size = 5
    end
    object qyProvasDiariods_disciplina: TStringField
      FieldName = 'ds_disciplina'
      Size = 100
    end
    object qyProvasDiariocd_prova: TIntegerField
      FieldName = 'cd_prova'
    end
    object qyProvasDiariocd_chave: TIntegerField
      FieldName = 'cd_chave'
    end
    object qyProvasDiariocd_curso: TStringField
      FieldName = 'cd_curso'
      Size = 15
    end
    object qyProvasDiarionr_serie: TSmallintField
      FieldName = 'nr_serie'
    end
    object qyProvasDiariocd_prova_leitora: TIntegerField
      FieldName = 'cd_prova_leitora'
    end
    object qyProvasDiariosn_leitora: TIntegerField
      FieldKind = fkCalculated
      FieldName = 'sn_leitora'
      Calculated = True
    end
    object qyProvasDiarionr_prova: TSmallintField
      FieldName = 'nr_prova'
    end
  end
  object dsProvasDiario: TDataSource
    DataSet = qyProvasDiario
    OnDataChange = dsProvasDiarioDataChange
    Left = 228
    Top = 193
  end
  object pmQtd: TPopupMenu
    OnPopup = pmQtdPopup
    Left = 232
    Top = 256
  end
  object ilDisciplinas: TImageList
    Left = 472
    Top = 400
    Bitmap = {
      494C010103000400040010001000FFFFFFFFFF10FFFFFFFFFFFFFFFF424D3600
      0000000000003600000028000000400000001000000001002000000000000010
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
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000BD4A00000000
      0000000000000000000084210000842100008421000084210000842100000000
      0000000000000000000000000000000000000063000000630000006B00000873
      0800087308004ABD630000730800006B00000063000063291000632910006329
      1000632910006329100063291000000000000000000073CEF700ADF7FF007BDE
      FF007BDEFF0063D6F70031ADE700009CCE00009CCE00009CCE00000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000BD4A00000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000006300000063000039BD5A0039BD
      5A0052AD8400CECEC60042BD5A00007308000063000063311000F76B5200EF63
      4A00EF634A00EF5A4200E75A3900632910000000000029ADDE007BD6FF006BDE
      FF0073DEFF0073DEFF0073DEFF0073DEFF007BDEFF007BE7FF007BDEFF007BDE
      FF00009CCE000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000BD4A00000000
      0000000000000000000084210000842100008421000084210000842100000000
      000000000000000000000000000000000000006300000063000039BD5A000873
      0800CECEC600CECEC60052BD630039BD5A0000630000E75A3900DEC6C600E7DE
      D600E75A3900EF634A00EF5A4200632910000000000031ADE70039B5E7007BDE
      FF007BDEFF007BDEFF009C3100009C3100009C3100009C3100007BDEFF007BE7
      FF0063D6F7000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000BD4A0000BD4A
      0000BD4A0000BD4A000084210000DEC6A500DE843100CE6B1800842100000000
      000000000000000000000000000000000000000000000063000000630000184A
      4200104A84004AAD9400184A4A000873080031520800EF634A00DECECE00E7DE
      D600FF8C9C00E75A3900EF63420063291000000000005ACEF70029ADDE00BDFF
      FF007BE7FF0084E7FF009C3100000039FF00185AFF008431210084E7FF0084EF
      FF005ACEF700009CCE0000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000BD4A00000000
      0000000000000000000084210000842100008421000084210000842100000000
      0000000000000000000000000000000000000000000010101000101010001018
      180008429C0008429C0008429C0000000000E75A3900EF634A00FF8C9C00E7DE
      D600E7DED600EF634A0063291000000000000000000063CEF70039B5E700C6FF
      FF008CF7FF0084EFFF009C3100007BBDFF00E7FFFF000039FF0084EFFF0084EF
      FF0063D6F700009CCE0000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000BD4A00000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000001010100010101000101818000842
      9C0008429C0008429C0008429C0008429C00000000000852AD001063CE001063
      CE001063CE00085294000000000000000000000000007BD6FF005ACEF70029AD
      DE00B5F7FF00D6FFFF009C3100009C3100009C31000084312100185AFF007BD6
      FF0073DEFF00A5F7FF0042BDE700000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000BD4A00000000
      0000000000000000000084210000842100008421000084210000842100000000
      0000000000000000000000000000000000001010100010101000104263001052
      BD001052BD001052BD001052BD001052BD000852AD00298CF700298CF700298C
      F700298CF700298CF7000852940000000000000000007BDEFF005ACEF70031AD
      E700009CD600009CD600009CD6007BD6FF00E7FFFF00A5F7FF007BCEFF00297B
      EF0084E7FF00BDFFFF00B5F7FF00000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000BD4A0000BD4A
      0000BD4A0000BD4A000084210000DEC6A500DE843100CE6B1800842100000000
      000000000000000000000000000000000000101010001010100010425A001063
      CE001063CE001063CE001063CE001063CE002184E700299CFF00299CFF00299C
      FF00299CFF00299CFF00299CFF0008529400000000009CF7FF0073DEFF007BDE
      FF007BDEFF007BDEFF009C3100009C3100009C3100009C310000EFFFFF00EFFF
      FF00D6FFFF00F7FFFF00FFFFFF00009CCE000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000BD4A00000000
      0000000000000000000084210000842100008421000084210000842100000000
      0000186B1000186B100000000000000000001010100010101000101818001873
      D600218CF700218CF700218CF7001873D600299CFF00319CFF00319CFF00319C
      FF00319CFF00319CFF00319CFF000852940000000000ADF7FF007BE7FF007BE7
      FF007BE7FF007BE7FF009C310000FFFFFF000039FF009C310000009CCE00009C
      CE00009CCE00009CCE00009CCE00009CCE000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000008421000084210000842100008421
      0000842100000000000000000000000000000000000000000000000000000000
      0000186B1000186B100000000000000000001010100010101000639C6B001018
      180010425A00184A7B00184A7B0010212100429CBD00319CEF00319CFF00319C
      FF00319CFF00319CFF00319CE70010425A0000000000CEFFFF0084EFFF008CF7
      FF008CF7FF008CF7FF009C3100007BBDFF00E7FFFF000039FF00A5F7FF00B5F7
      FF00009CCE000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000084210000DEC6A500DE843100CE6B
      1800842100000000000000000000000000000000000000000000186B10001873
      10001873100018731000186B1000186B1000000000001010100010101000639C
      6B00639C6B0010101000101010000000000008529400217BD60010425A001042
      5A0010425A00217BD600104A840010426B0000000000A5F7FF00A5F7FF008CF7
      FF008CF7FF0094F7FF009C310000FFFFFF00FFFFFF000039FF000063EF00009C
      CE00000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000008421000084210000842100008421
      0000842100000000000000000000000000000000000000000000186B10001873
      10001873100018731000186B1000186B10000000000000000000101010001010
      1000101010001010100000000000000000000000000008529400085294000852
      94000852940010425A0010425A00000000000000000000000000009CCE00009C
      CE00009CCE00009CCE0000000000000000000000000000000000000000000039
      FF00000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000187310001873100000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000085294000852
      940008529400104A840000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000186B1000186B100000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000424D3E000000000000003E000000
      2800000040000000100000000100010000000000800000000000000000000000
      000000000000000000000000FFFFFF00DC1FFFFFFFFF0000C01F80FF81FF0000
      DC1F0001803F0000DFFF000080070000DC1F000080070000C01F800080030000
      DC1F810180030000DFFF008380010000DC1F000180010000C01F000080000000
      DC1300008000000007F300008007000007C08100800F000007C0C381C3EF0000
      FFF3FFC3FFFF0000FFF3FFFFFFFF000000000000000000000000000000000000
      000000000000}
  end
  object qyAlunos: TUMZQuery
    Connection = DM.db
    BeforeOpen = qyAlunosBeforeOpen
    SQL.Strings = (
      'SELECT'
      #9'a.nr_anosemestre,'
      #9'a.cd_turma,'
      #9'a.cd_pessoa,'
      #9'p.nm_pessoa,'
      '                a.nr_acertos'
      '           '
      'FROM'
      #9'leitora_provas_alunos a'
      #9#9'LEFT JOIN pessoas p ON (p.cd_pessoa = a.cd_pessoa)'
      'WHERE'
      #9'a.cd_prova_gabarito = :cd_prova_gabarito AND '
      '                a.cd_turma = :cd_turma'
      'ORDER BY'
      #9'p.nm_pessoa')
    Params = <
      item
        DataType = ftInteger
        Name = 'cd_prova_gabarito'
        ParamType = ptUnknown
        Size = 4
      end
      item
        DataType = ftUnknown
        Name = 'cd_turma'
        ParamType = ptUnknown
      end>
    DataSource = srcGabaritos
    Left = 576
    Top = 56
    ParamData = <
      item
        DataType = ftInteger
        Name = 'cd_prova_gabarito'
        ParamType = ptUnknown
        Size = 4
      end
      item
        DataType = ftUnknown
        Name = 'cd_turma'
        ParamType = ptUnknown
      end>
    object qyAlunosnr_anosemestre: TSmallintField
      FieldName = 'nr_anosemestre'
      Origin = 'WMESTRE12.leitora_provas_alunos.nr_anosemestre'
    end
    object qyAlunoscd_turma: TStringField
      FieldName = 'cd_turma'
      Origin = 'WMESTRE12.leitora_provas_alunos.cd_turma'
      Size = 15
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
    end
  end
  object srcAlunos: TDataSource
    DataSet = qyAlunos
    Left = 600
    Top = 56
  end
  object srcGabaritos: TDataSource
    DataSet = qyGabaritos
    OnDataChange = srcGabaritosDataChange
    Left = 504
    Top = 64
  end
  object qyGabaritos: TUMZQuery
    Connection = DM.db
    SQL.Strings = (
      'SELECT'
      '  g.cd_prova, '
      #9'g.cd_prova_gabarito,'
      #9'g.ds_nome_gabarito,'
      #9'CAST(COUNT(gr.nr_questao) AS SIGNED) AS nr_questoes'
      'FROM'
      '  leitora_provas p '
      '  INNER JOIN '
      #9'leitora_provas_gabaritos g ON (p.cd_prova = g.cd_prova)'
      
        #9#9'LEFT JOIN leitora_provas_gabaritos_resp gr ON (gr.cd_prova_gab' +
        'arito = g.cd_prova_gabarito)'
      'WHERE'
      #9'(g.cd_prova = :cd_prova_leitora OR p.cd_chave = :cd_prova)'
      'GROUP BY'
      #9'g.cd_prova_gabarito'
      'ORDER BY'
      #9'g.ds_nome_gabarito')
    Params = <
      item
        DataType = ftInteger
        Name = 'cd_prova_leitora'
        ParamType = ptUnknown
        Size = 4
      end
      item
        DataType = ftInteger
        Name = 'cd_prova'
        ParamType = ptUnknown
        Size = 4
      end>
    DataSource = dsProvasDiario
    Left = 480
    Top = 64
    ParamData = <
      item
        DataType = ftInteger
        Name = 'cd_prova_leitora'
        ParamType = ptUnknown
        Size = 4
      end
      item
        DataType = ftInteger
        Name = 'cd_prova'
        ParamType = ptUnknown
        Size = 4
      end>
    object qyGabaritoscd_prova_gabarito: TIntegerField
      FieldName = 'cd_prova_gabarito'
      Origin = 'WMESTRE12.leitora_provas_gabaritos.cd_prova_gabarito'
    end
    object qyGabaritosds_nome_gabarito: TStringField
      FieldName = 'ds_nome_gabarito'
      Origin = 'WMESTRE12.leitora_provas_gabaritos.ds_nome_gabarito'
      Size = 15
    end
    object qyGabaritoscd_prova: TIntegerField
      FieldName = 'cd_prova'
      Origin = 'WMESTRE12.leitora_provas_gabaritos.cd_prova'
    end
    object qyGabaritosnr_questoes: TLargeintField
      FieldName = 'nr_questoes'
    end
  end
end
