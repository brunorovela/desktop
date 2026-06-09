object DiarioView: TDiarioView
  Left = 193
  Top = 54
  Cursor = crArrow
  Caption = 'Di'#225'rio de Classe Eletr'#244'nico'
  ClientHeight = 534
  ClientWidth = 1008
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
  ShowHint = True
  Visible = True
  WindowState = wsMaximized
  OnClose = FormClose
  OnCloseQuery = FormCloseQuery
  OnCreate = FormCreate
  OnKeyDown = FormKeyDown
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object Panel1: TPanel
    Left = 0
    Top = 25
    Width = 1008
    Height = 73
    Align = alTop
    BevelInner = bvRaised
    BevelOuter = bvLowered
    Color = clHotLight
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWhite
    Font.Height = -13
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentFont = False
    TabOrder = 0
    object Label2: TLabel
      Left = 427
      Top = 30
      Width = 61
      Height = 16
      Caption = 'Professor:'
    end
    object DBText1: TDBText
      Left = 496
      Top = 30
      Width = 263
      Height = 17
      Color = clBlack
      DataField = 'NOME'
      DataSource = DMDiario.dsTurmas
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWhite
      Font.Height = -13
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentColor = False
      ParentFont = False
      Transparent = True
    end
    object Label9: TLabel
      Left = 65
      Top = 30
      Width = 42
      Height = 16
      Caption = 'Turma:'
    end
    object DBText5: TDBText
      Left = 114
      Top = 30
      Width = 305
      Height = 16
      Color = clBlack
      DataField = 'TURMA'
      DataSource = DMDiario.dsTurmas
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWhite
      Font.Height = -13
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentColor = False
      ParentFont = False
      Transparent = True
    end
    object Label10: TLabel
      Left = 45
      Top = 50
      Width = 62
      Height = 16
      Caption = 'Disciplina:'
    end
    object DBText6: TDBText
      Left = 114
      Top = 50
      Width = 305
      Height = 19
      Color = clBlack
      DataField = 'DESCRICAO'
      DataSource = DMDiario.dsTurmas
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWhite
      Font.Height = -13
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentColor = False
      ParentFont = False
      Transparent = True
    end
    object Label3: TLabel
      Left = 765
      Top = 11
      Width = 89
      Height = 16
      Caption = 'Ano/Semestre:'
    end
    object DBText2: TDBText
      Left = 860
      Top = 11
      Width = 295
      Height = 18
      Color = clBlack
      DataField = 'ANOSEMESTRE'
      DataSource = DMDiario.dsTurmas
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWhite
      Font.Height = -13
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentColor = False
      ParentFont = False
      Transparent = True
    end
    object DBText7: TDBText
      Left = 114
      Top = 11
      Width = 305
      Height = 16
      Color = clBlack
      DataField = 'CURSO'
      DataSource = DMDiario.dsTurmas
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWhite
      Font.Height = -13
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentColor = False
      ParentFont = False
      Transparent = True
    end
    object Label1: TLabel
      Left = 69
      Top = 11
      Width = 38
      Height = 16
      Caption = 'Curso:'
    end
    object Label11: TLabel
      Left = 449
      Top = 11
      Width = 39
      Height = 16
      Caption = 'Etapa:'
      OnClick = btnAbrirWordClick
    end
    object DBText3: TDBText
      Left = 496
      Top = 11
      Width = 75
      Height = 19
      Color = clBlack
      DataField = 'BIMESTRE'
      DataSource = DMDiario.dsTurmas
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWhite
      Font.Height = -13
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentColor = False
      ParentFont = False
      Transparent = True
    end
    object DBText4: TDBText
      Left = 496
      Top = 50
      Width = 263
      Height = 19
      Color = clBlack
      DataField = 'GRUPO'
      DataSource = DMDiario.dsTurmas
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWhite
      Font.Height = -13
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentColor = False
      ParentFont = False
      Transparent = True
    end
    object Label4: TLabel
      Left = 448
      Top = 50
      Width = 40
      Height = 16
      Caption = 'Grupo:'
      OnClick = btnAbrirWordClick
    end
    object lblProva: TLabel
      Left = 765
      Top = 30
      Width = 42
      Height = 16
      Caption = 'Prova: '
      Visible = False
    end
    object nm_prova: TLabel
      Left = 813
      Top = 30
      Width = 69
      Height = 16
      Caption = 'nm_prova'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWhite
      Font.Height = -13
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
      Visible = False
    end
  end
  object pgPrincipal: TPageControl
    Left = 0
    Top = 98
    Width = 1008
    Height = 436
    ActivePage = tsDiarioFrequencias
    Align = alClient
    Style = tsFlatButtons
    TabOrder = 1
    OnChange = pgPrincipalChange
    OnChanging = pgPrincipalChanging
    object tsTurmas: TTabSheet
      Caption = 'Turmas do Professor'
      ImageIndex = 1
      ExplicitLeft = 0
      ExplicitTop = 0
      ExplicitWidth = 0
      ExplicitHeight = 0
      object DBGrid1: TDBGrid
        Left = 0
        Top = 73
        Width = 1000
        Height = 307
        Align = alClient
        DataSource = DMDiario.dsTurmas
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        Options = [dgTitles, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgAlwaysShowSelection, dgConfirmDelete, dgCancelOnExit]
        ParentFont = False
        PopupMenu = pmQtdTurmas
        TabOrder = 0
        TitleFont.Charset = DEFAULT_CHARSET
        TitleFont.Color = clWindowText
        TitleFont.Height = -11
        TitleFont.Name = 'MS Sans Serif'
        TitleFont.Style = []
        Columns = <
          item
            Expanded = False
            FieldName = 'CURSO'
            Width = 70
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'TURMA'
            Width = 130
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'ANOSEMESTRE'
            Width = 60
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'DISCIPLINA'
            Width = 65
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'DESCRICAO'
            Width = 250
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'NOME'
            Width = 218
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'GRUPO'
            Width = 194
            Visible = True
          end>
      end
      object Panel8: TPanel
        Left = 0
        Top = 0
        Width = 1000
        Height = 73
        Align = alTop
        BevelOuter = bvLowered
        TabOrder = 1
        object Label5: TLabel
          Left = 8
          Top = 10
          Width = 71
          Height = 13
          Caption = 'Ano/Semestre:'
        end
        object lblProfessor: TLabel
          Left = 387
          Top = 10
          Width = 47
          Height = 13
          Caption = 'Professor:'
        end
        object btn: TSpeedButton
          Left = 567
          Top = 6
          Width = 33
          Height = 23
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
          OnClick = btnClick
        end
        object SpeedButton1: TSpeedButton
          Left = 567
          Top = 41
          Width = 33
          Height = 23
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
        object lblDisciplina: TLabel
          Left = 387
          Top = 46
          Width = 48
          Height = 13
          Caption = 'Disciplina:'
        end
        object lblCurso: TLabel
          Left = 172
          Top = 10
          Width = 30
          Height = 13
          Caption = 'Curso:'
        end
        object lblTurma: TLabel
          Left = 169
          Top = 46
          Width = 33
          Height = 13
          Caption = 'Turma:'
        end
        object Label8: TLabel
          Left = 48
          Top = 46
          Width = 31
          Height = 13
          Caption = 'Etapa:'
        end
        object lbGrupo: TLabel
          Left = 625
          Top = 10
          Width = 32
          Height = 13
          Caption = 'Grupo:'
        end
        object btnGrupo: TSpeedButton
          Left = 779
          Top = 6
          Width = 33
          Height = 23
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
          OnClick = btnGrupoClick
        end
        object btnTurmas: TSpeedButton
          Left = 333
          Top = 41
          Width = 33
          Height = 23
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
          OnClick = btnTurmasClick
        end
        object btnCurso: TSpeedButton
          Left = 333
          Top = 5
          Width = 33
          Height = 23
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
        object txtAnoSemestreCursos: TMaskEdit
          Left = 85
          Top = 8
          Width = 48
          Height = 22
          EditMask = '9999/9;0;_'
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = []
          MaxLength = 6
          ParentFont = False
          TabOrder = 0
          Text = '20072'
          OnChange = txtAnoSemestreCursosChange
        end
        object UpDownCursos: TUpDown
          Left = 133
          Top = 7
          Width = 17
          Height = 22
          Min = -100
          TabOrder = 5
          OnClick = UpDownCursosClick
        end
        object txtProfessor: TEdit
          Left = 442
          Top = 7
          Width = 125
          Height = 21
          ReadOnly = True
          TabOrder = 3
          OnKeyDown = txtProfessorKeyDown
        end
        object txtDisciplina: TEdit
          Left = 442
          Top = 43
          Width = 125
          Height = 21
          ReadOnly = True
          TabOrder = 4
          OnKeyDown = txtDisciplinaKeyDown
        end
        object txtCurso: TEdit
          Left = 208
          Top = 7
          Width = 125
          Height = 21
          CharCase = ecUpperCase
          TabOrder = 1
          OnKeyDown = txtCursoKeyDown
          OnKeyPress = txtCursoKeyPress
        end
        object txtTurma: TEdit
          Left = 208
          Top = 43
          Width = 125
          Height = 21
          CharCase = ecUpperCase
          TabOrder = 2
          OnKeyDown = txtTurmaKeyDown
          OnKeyPress = txtTurmaKeyPress
        end
        object txtBimestre: TEdit
          Left = 85
          Top = 43
          Width = 48
          Height = 21
          TabOrder = 6
          Text = '1'
        end
        object UpDown1: TUpDown
          Left = 133
          Top = 43
          Width = 17
          Height = 21
          Min = -100
          TabOrder = 7
          OnClick = l
        end
        object txtGrupo: TEdit
          Left = 665
          Top = 7
          Width = 114
          Height = 21
          ReadOnly = True
          TabOrder = 8
          OnKeyDown = txtGrupoKeyDown
          OnKeyPress = txtGrupoKeyPress
        end
        object btLimpar: TBitBtn
          Left = 835
          Top = 6
          Width = 105
          Height = 38
          Caption = 'Limpar Filtros'
          TabOrder = 9
          OnClick = SpeedButton2Click
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
      object tbTurmasProfessor: TToolBar
        Left = 0
        Top = 380
        Width = 1000
        Height = 25
        Align = alBottom
        ButtonWidth = 93
        Caption = 'toolTurmasProfessores'
        EdgeBorders = [ebTop, ebBottom]
        Images = ilAcoes
        List = True
        ShowCaptions = True
        TabOrder = 2
        Wrapable = False
        object sbOlhoTurmasProf: TSpeedButton
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
          ParentShowHint = False
          ShowHint = True
          OnClick = sbOlhoTurmasProfClick
        end
        object separador1: TToolButton
          Left = 25
          Top = 0
          Width = 8
          Style = tbsSeparator
        end
        object btIniciarDiarios: TToolButton
          Left = 33
          Top = 0
          AutoSize = True
          Caption = 'Iniciar di'#225'rios'
          ImageIndex = 8
          OnClick = SpeedButton4Click
        end
        object btnOrdernarAulas: TToolButton
          Left = 125
          Top = 0
          Caption = 'Ordenar aulas'
          ImageIndex = 13
          Visible = False
          OnClick = btnOrdernarAulasClick
        end
        object btnObs: TToolButton
          Left = 218
          Top = 0
          AutoSize = True
          Caption = 'Observa'#231#245'es'
          OnClick = btnObsClick
        end
        object separador2: TToolButton
          Left = 292
          Top = 0
          Width = 8
          ImageIndex = 9
          Style = tbsSeparator
        end
        object btFechaTurmasProf: TToolButton
          Left = 300
          Top = 0
          AutoSize = True
          Caption = 'F12 Fechar'
          ImageIndex = 7
          OnClick = btnFecharClick
        end
      end
    end
    object tsAlunos: TTabSheet
      Caption = 'Alunos'
      ImageIndex = 4
      ExplicitLeft = 0
      ExplicitTop = 0
      ExplicitWidth = 0
      ExplicitHeight = 0
      object DBGrid4: TDBGrid
        Left = 0
        Top = 0
        Width = 1000
        Height = 339
        Align = alClient
        DataSource = DMDiario.dsAlunos
        Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgAlwaysShowSelection, dgConfirmDelete, dgCancelOnExit]
        PopupMenu = pmQtdAlunos
        TabOrder = 0
        TitleFont.Charset = DEFAULT_CHARSET
        TitleFont.Color = clWindowText
        TitleFont.Height = -11
        TitleFont.Name = 'MS Sans Serif'
        TitleFont.Style = []
        Columns = <
          item
            Expanded = False
            FieldName = 'CODALUNO'
            Title.Caption = 'COD. ALUNO'
            Width = 69
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'NOME'
            Title.Caption = 'NOME DO ALUNO'
            Width = 350
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'SITUACAO'
            Title.Caption = 'SITUA'#199#195'O'
            Width = 128
            Visible = True
          end>
      end
      object pnAluno: TPanel
        Left = 0
        Top = 339
        Width = 1000
        Height = 41
        Align = alBottom
        TabOrder = 1
        object SpeedButton3: TSpeedButton
          Left = 8
          Top = 8
          Width = 123
          Height = 27
          Caption = 'Situa'#231#227'o do Aluno'
          OnClick = SpeedButton3Click
        end
      end
      object tbAlunos: TToolBar
        Left = 0
        Top = 380
        Width = 1000
        Height = 25
        Align = alBottom
        ButtonWidth = 81
        Caption = 'toolAlunos'
        EdgeBorders = [ebTop, ebBottom]
        Images = ilAcoes
        List = True
        ShowCaptions = True
        TabOrder = 2
        Wrapable = False
        object btFechaAlunos: TToolButton
          Left = 0
          Top = 0
          AutoSize = True
          Caption = 'F12 Fechar'
          ImageIndex = 7
          OnClick = btnFecharClick
        end
      end
    end
    object tsDescricoes: TTabSheet
      Caption = 'Descri'#231#245'es'
      ImageIndex = 5
      ExplicitLeft = 0
      ExplicitTop = 0
      ExplicitWidth = 0
      ExplicitHeight = 0
      object DBGrid5: TDBGrid
        Left = 0
        Top = 0
        Width = 243
        Height = 380
        Align = alLeft
        DataSource = DMDiario.dsDescricoes
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -9
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        Options = [dgTitles, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgAlwaysShowSelection, dgConfirmDelete, dgCancelOnExit]
        ParentFont = False
        PopupMenu = pmQtdFreq
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
            Title.Caption = 'Cod. Aluno'
            Width = 60
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'NOME'
            Title.Caption = 'Nome do Aluno'
            Width = 187
            Visible = True
          end>
      end
      object Panel5: TPanel
        Left = 243
        Top = 0
        Width = 757
        Height = 380
        Align = alClient
        BevelOuter = bvNone
        BorderWidth = 3
        TabOrder = 1
        object Panel6: TPanel
          Left = 3
          Top = 3
          Width = 751
          Height = 22
          Align = alTop
          Alignment = taLeftJustify
          BevelOuter = bvNone
          Caption = 'AVALIA'#199#195'O'
          TabOrder = 1
          object lbSituacaoDescricoes: TLabel
            Left = 70
            Top = 4
            Width = 127
            Height = 13
            Caption = '(SITUA'#199#195'O: CURSANDO)'
          end
        end
        object Memo1: TMemo
          Left = 3
          Top = 25
          Width = 751
          Height = 352
          Align = alClient
          Lines.Strings = (
            'Memo1')
          TabOrder = 0
          OnChange = Memo1Change
        end
      end
      object tbDescricoes: TToolBar
        Left = 0
        Top = 380
        Width = 1000
        Height = 25
        Align = alBottom
        ButtonWidth = 84
        Caption = 'toolDescricoes'
        EdgeBorders = [ebTop, ebBottom]
        Images = ilAcoes
        List = True
        ShowCaptions = True
        TabOrder = 2
        Wrapable = False
        object tbSalvarDescricoes: TToolButton
          Left = 0
          Top = 0
          AutoSize = True
          Caption = 'F5 Salvar'
          ImageIndex = 3
          OnClick = sbSalvaAvaClick
        end
        object tbCancelarDescricoes: TToolButton
          Left = 76
          Top = 0
          AutoSize = True
          Caption = 'F6 Cancelar'
          ImageIndex = 4
          OnClick = sbCancelAvaClick
        end
        object ToolButton4: TToolButton
          Left = 164
          Top = 0
          Width = 8
          Caption = 'ToolButton4'
          ImageIndex = 10
          Style = tbsSeparator
        end
        object btFechaDescricoes: TToolButton
          Left = 172
          Top = 0
          AutoSize = True
          Caption = 'F12 Fechar'
          ImageIndex = 7
          OnClick = btnFecharClick
        end
      end
    end
    object tsDiarioNotas: TTabSheet
      Caption = 'Di'#225'rio de Notas'
      ImageIndex = 5
      ExplicitLeft = 0
      ExplicitTop = 0
      ExplicitWidth = 0
      ExplicitHeight = 0
      object PageControl1: TPageControl
        Left = 0
        Top = 0
        Width = 1000
        Height = 380
        ActivePage = TabSheet2
        Align = alClient
        MultiLine = True
        TabOrder = 0
        TabPosition = tpLeft
        OnChanging = PageControl1Changing
        object TabSheet1: TTabSheet
          Caption = 'AVALIA'#199#213'ES'
          ExplicitLeft = 0
          ExplicitTop = 0
          ExplicitWidth = 0
          ExplicitHeight = 0
          object DBGrid6: TDBGrid
            Left = 0
            Top = 0
            Width = 973
            Height = 307
            Align = alClient
            DataSource = DMDiario.dsProvas
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -13
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            Options = [dgTitles, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgAlwaysShowSelection, dgConfirmDelete, dgCancelOnExit]
            ParentFont = False
            PopupMenu = pmQtdNotasAvaliacoes
            TabOrder = 0
            TitleFont.Charset = DEFAULT_CHARSET
            TitleFont.Color = clWindowText
            TitleFont.Height = -11
            TitleFont.Name = 'MS Sans Serif'
            TitleFont.Style = []
            Columns = <
              item
                Color = clWhite
                Expanded = False
                FieldName = 'DS_NOTA'
                Title.Font.Charset = DEFAULT_CHARSET
                Title.Font.Color = clBlack
                Title.Font.Height = -11
                Title.Font.Name = 'MS Sans Serif'
                Title.Font.Style = []
                Width = 60
                Visible = True
              end
              item
                Color = clWhite
                Expanded = False
                FieldName = 'DATA'
                Title.Font.Charset = DEFAULT_CHARSET
                Title.Font.Color = clBlack
                Title.Font.Height = -11
                Title.Font.Name = 'MS Sans Serif'
                Title.Font.Style = []
                Width = 100
                Visible = True
              end
              item
                Color = clWhite
                Expanded = False
                FieldName = 'ASSUNTO'
                Title.Font.Charset = DEFAULT_CHARSET
                Title.Font.Color = clBlack
                Title.Font.Height = -11
                Title.Font.Name = 'MS Sans Serif'
                Title.Font.Style = []
                Width = 497
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'ds_avaliacao'
                Width = 227
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'ds_chave_tipo'
                Width = 78
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'vl_peso'
                Width = 50
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'id_atividade_moodle'
                Visible = True
              end>
          end
          object Panel7: TPanel
            Left = 0
            Top = 307
            Width = 973
            Height = 65
            Align = alBottom
            BevelOuter = bvNone
            TabOrder = 1
            object Bevel2: TBevel
              Left = 160
              Top = 18
              Width = 585
              Height = 41
            end
            object DBText8: TDBText
              Left = 168
              Top = 29
              Width = 561
              Height = 17
              DataField = 'FORMULA_MEDIA'
              DataSource = DMDiario.dsTurmas
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -13
              Font.Name = 'MS Sans Serif'
              Font.Style = []
              ParentFont = False
            end
            object Label12: TLabel
              Left = 16
              Top = 28
              Width = 130
              Height = 16
              Caption = 'F'#243'rmula da M'#233'dia:'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -13
              Font.Name = 'MS Sans Serif'
              Font.Style = [fsBold]
              ParentFont = False
            end
          end
        end
        object TabSheet2: TTabSheet
          Caption = 'DIGITA'#199#195'O DE NOTAS'
          ImageIndex = 1
          ExplicitLeft = 0
          ExplicitTop = 0
          ExplicitWidth = 0
          ExplicitHeight = 0
          object UMGridNotas2: TUMGrid
            Left = 0
            Top = 0
            Width = 973
            Height = 372
            Align = alClient
            PopupMenu = pmQtdNotas_LogsNovo
            TabOrder = 0
            TitleFont.Charset = DEFAULT_CHARSET
            TitleFont.Color = clWindowText
            TitleFont.Height = -11
            TitleFont.Name = 'MS Sans Serif'
            TitleFont.Style = []
            OnCellClick = UMGridNotas2CellClick
            OnDrawColumnCell = UMGridNotas2DrawColumnCell
            OnKeyDown = UMGridNotas2KeyDown
            OnKeyPress = UMGridNotas2KeyPress
            OnMouseDown = UMGridNotas2MouseDown
            OnBeforeUpdateColumn = UMGridNotas2BeforeUpdateColumn
            OnAfterUpdateColumn = UMGridNotas2AfterUpdateColumn
            DoVerificacoesBeforeUpdates = UMGridNotas2DoVerificacoesBeforeUpdates
          end
        end
      end
      object tbNotas: TToolBar
        Left = 0
        Top = 380
        Width = 1000
        Height = 25
        Align = alBottom
        ButtonWidth = 179
        Caption = 'toolNotas'
        EdgeBorders = [ebTop, ebBottom]
        Images = ilAcoes
        List = True
        ShowCaptions = True
        TabOrder = 1
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
          ParentShowHint = False
          ShowHint = True
          OnClick = sbSelecionarColunaClick
        end
        object ToolButton1: TToolButton
          Left = 25
          Top = 0
          Width = 8
          Caption = 'ToolButton1'
          Style = tbsSeparator
        end
        object btnAplicarAlteracoesNotas: TToolButton
          Left = 33
          Top = 0
          AutoSize = True
          Caption = 'F5 Salvar'
          ImageIndex = 3
          OnClick = btnAplicarAlteracoesNotasClick
        end
        object btnCancelarNotas: TToolButton
          Left = 109
          Top = 0
          AutoSize = True
          Caption = 'F6 Cancelar'
          ImageIndex = 4
          OnClick = btnCancelarNotasClick
        end
        object btnCalcularAluno: TToolButton
          Tag = 1
          Left = 197
          Top = 0
          AutoSize = True
          Caption = 'F7 Calcular m'#233'dia  do aluno '
          ImageIndex = 11
          OnClick = sbCalcularMediaAlunoClick
        end
        object ToolButton2: TToolButton
          Left = 362
          Top = 0
          Width = 8
          Caption = 'ToolButton2'
          ImageIndex = 5
          Style = tbsSeparator
        end
        object btnCalcularTurma: TToolButton
          Tag = 99
          Left = 370
          Top = 0
          AutoSize = True
          Caption = 'F8 Calcular m'#233'dia de toda turma'
          ImageIndex = 11
          OnClick = sbCalcularMediaAlunoClick
        end
        object ToolButton3: TToolButton
          Left = 553
          Top = 0
          Width = 8
          Caption = 'ToolButton3'
          ImageIndex = 9
          Style = tbsSeparator
        end
        object ckbInativosNovo: TCheckBox
          Left = 561
          Top = 0
          Width = 171
          Height = 22
          Caption = 'Apresentar estudantes inativos.'
          TabOrder = 0
          OnClick = ckbInativosNovoClick
        end
        object ToolButton5: TToolButton
          Left = 732
          Top = 0
          Width = 8
          Caption = 'ToolButton5'
          ImageIndex = 10
          Style = tbsSeparator
        end
        object btFechaNotas: TToolButton
          Left = 740
          Top = 0
          AutoSize = True
          Caption = 'F12 Fechar'
          ImageIndex = 7
          OnClick = btnFecharClick
        end
      end
    end
    object tsDiarioFrequencias: TTabSheet
      Caption = 'Di'#225'rio de Frequ'#234'ncias'
      ImageIndex = 6
      object PageControl2: TPageControl
        Left = 0
        Top = 0
        Width = 1000
        Height = 380
        ActivePage = TabSheet5
        Align = alClient
        MultiLine = True
        TabOrder = 0
        TabPosition = tpLeft
        OnChanging = PageControl2Changing
        object TabSheet4: TTabSheet
          Caption = 'AULAS'
          ExplicitLeft = 0
          ExplicitTop = 0
          ExplicitWidth = 0
          ExplicitHeight = 0
          object DBGrid7: TDBGrid
            Left = 0
            Top = 0
            Width = 528
            Height = 372
            Align = alClient
            DataSource = DMDiario.dsAulas
            Options = [dgTitles, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgAlwaysShowSelection, dgConfirmDelete, dgCancelOnExit]
            PopupMenu = pmQtdFreqAulas
            TabOrder = 0
            TitleFont.Charset = DEFAULT_CHARSET
            TitleFont.Color = clWindowText
            TitleFont.Height = -11
            TitleFont.Name = 'MS Sans Serif'
            TitleFont.Style = []
            Columns = <
              item
                Alignment = taCenter
                Expanded = False
                FieldName = 'NRO_AULA'
                Title.Alignment = taCenter
                Title.Caption = 'Aula'
                Width = 40
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'DATA'
                Width = 120
                Visible = True
              end
              item
                Alignment = taCenter
                Expanded = False
                FieldName = 'QTD_AULAS'
                Title.Alignment = taCenter
                Width = 70
                Visible = True
              end>
          end
          object Panel11: TPanel
            Left = 528
            Top = 0
            Width = 445
            Height = 372
            Align = alRight
            BevelInner = bvRaised
            BevelOuter = bvLowered
            TabOrder = 1
            object DBMemo3: TDBMemo
              Left = 2
              Top = 22
              Width = 441
              Height = 323
              Align = alClient
              DataField = 'CONTEUDO'
              DataSource = DMDiario.dsAulas
              TabOrder = 0
            end
            object Panel12: TPanel
              Left = 2
              Top = 2
              Width = 441
              Height = 20
              Align = alTop
              BevelOuter = bvNone
              Caption = 'CONTE'#218'DO PROGRAM'#193'TICO'
              TabOrder = 1
            end
            object DBNavigator2: TDBNavigator
              Left = 2
              Top = 345
              Width = 441
              Height = 25
              DataSource = DMDiario.dsAulas
              VisibleButtons = [nbFirst, nbPrior, nbNext, nbLast]
              Align = alBottom
              TabOrder = 2
            end
          end
        end
        object TabSheet5: TTabSheet
          Caption = 'FREQU'#202'NCIAS'
          ImageIndex = 1
          object UMGridAulas2: TUMGrid
            Left = 0
            Top = 0
            Width = 973
            Height = 372
            Align = alClient
            Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgConfirmDelete, dgCancelOnExit]
            TabOrder = 0
            TitleFont.Charset = DEFAULT_CHARSET
            TitleFont.Color = clWindowText
            TitleFont.Height = -11
            TitleFont.Name = 'MS Sans Serif'
            TitleFont.Style = []
            OnCellClick = UMGridAulas2CellClick
            OnColEnter = UMGridAulas2ColEnter
            OnColExit = UMGridAulas2ColExit
            OnDrawColumnCell = UMGridAulas2DrawColumnCell
            OnDblClick = UMGridAulas2DblClick
            OnKeyDown = UMGridAulas2KeyDown
            OnKeyPress = UMGridAulas2KeyPress
            OnMouseUp = UMGridAulas2MouseUp
            OnAfterUpdateColumn = UMGridAulas2AfterUpdateColumn
          end
        end
      end
      object tbFrequencias: TToolBar
        Left = 0
        Top = 380
        Width = 1000
        Height = 25
        Align = alBottom
        ButtonWidth = 229
        Caption = 'toolFrequencia'
        EdgeBorders = [ebTop, ebBottom]
        Images = ilAcoes
        List = True
        ShowCaptions = True
        TabOrder = 1
        Wrapable = False
        object btnAplicarAlteracoesFrequencias: TToolButton
          Left = 0
          Top = 0
          AutoSize = True
          Caption = 'F5 Salvar'
          ImageIndex = 3
          OnClick = btnAplicarAlteracoesFrequenciasClick
        end
        object btnCancelarFrequencias: TToolButton
          Left = 76
          Top = 0
          AutoSize = True
          Caption = 'F6 Cancelar'
          ImageIndex = 4
          OnClick = btnCancelarFrequenciasClick
        end
        object btAtualizarFreqAluno: TToolButton
          Tag = 1
          Left = 164
          Top = 0
          AutoSize = True
          Caption = 'Atualizar frequ'#234'ncias do aluno selecionado'
          ImageIndex = 12
          OnClick = btnAtualizaFrequenciaClick
        end
        object ToolButton6: TToolButton
          Left = 397
          Top = 0
          Width = 8
          Caption = 'ToolButton6'
          ImageIndex = 5
          Style = tbsSeparator
        end
        object btAtualizarFreqTurma: TToolButton
          Tag = 99
          Left = 405
          Top = 0
          AutoSize = True
          Caption = 'Atualizar frequ'#234'ncias da turma'
          ImageIndex = 12
          OnClick = btnAtualizaFrequenciaClick
        end
        object btAplicarPresenca: TToolButton
          Tag = 1
          Left = 578
          Top = 0
          AutoSize = True
          Caption = 'Aplicar presen'#231'a'
          ImageIndex = 8
          OnClick = sbAplicarPresencaClick
        end
        object ToolButton7: TToolButton
          Left = 688
          Top = 0
          Width = 8
          Caption = 'ToolButton7'
          ImageIndex = 9
          Style = tbsSeparator
        end
        object CheckBox2: TCheckBox
          Left = 696
          Top = 0
          Width = 179
          Height = 22
          Caption = 'Apresentar estudantes inativos.'
          TabOrder = 0
          OnClick = CheckBox2Click
        end
        object ToolButton9: TToolButton
          Left = 875
          Top = 0
          Width = 8
          Caption = 'ToolButton9'
          ImageIndex = 10
          Style = tbsSeparator
        end
        object btFechaFrequencias: TToolButton
          Left = 883
          Top = 0
          AutoSize = True
          Caption = 'F12 Fechar'
          ImageIndex = 7
          OnClick = btnFecharClick
        end
      end
    end
  end
  object pnTitulo: TPanel
    Left = 0
    Top = 0
    Width = 1008
    Height = 25
    Align = alTop
    BevelOuter = bvLowered
    Caption = 'VISUALIZAR DI'#193'RIOS'
    Color = clBlue
    Font.Charset = ANSI_CHARSET
    Font.Color = clWhite
    Font.Height = -13
    Font.Name = 'Arial'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 2
  end
  object pmQtdTurmas: TPopupMenu
    OnPopup = pmQtdTurmasPopup
    Left = 8
    Top = 216
  end
  object pmQtdAlunos: TPopupMenu
    OnPopup = pmQtdAlunosPopup
    Left = 40
    Top = 216
  end
  object pmQtdNotasDigitacao: TPopupMenu
    OnPopup = pmQtdNotasDigitacaoPopup
    Left = 72
    Top = 216
  end
  object pmQtdNotasAvaliacoes: TPopupMenu
    OnPopup = pmQtdNotasAvaliacoesPopup
    Left = 72
    Top = 248
  end
  object pmQtdFreqAulas: TPopupMenu
    OnPopup = pmQtdFreqAulasPopup
    Left = 104
    Top = 248
  end
  object pmQtdFreq: TPopupMenu
    OnPopup = pmQtdFreqPopup
    Left = 104
    Top = 216
  end
  object pmQtdNotas_Logs: TPopupMenu
    OnPopup = pmQtdNotas_LogsPopup
    Left = 168
    Top = 216
  end
  object pmQtdNotas_LogsNovo: TPopupMenu
    OnPopup = pmQtdNotas_LogsNovoPopup
    Left = 200
    Top = 216
  end
  object qryInsert: TUMZQuery
    Connection = DM.db
    SQL.Strings = (
      
        'INSERT INTO diario_provas_alunos ( cd_pessoa, cd_turma, nr_anose' +
        'm, cd_disciplina, cd_bimestre, nr_prova, vl_nota ) '
      'SELECT'
      
        #9'f.codigoaluno, p.turma, p.anosemestre, p.disciplina, p.bimestre' +
        ', p.nro_nota, null'
      'FROM'
      #9'fichaindividual f'
      
        #9'INNER JOIN diario_provas p ON (f.turma = p.turma AND f.discipli' +
        'na = p.disciplina and f.anosemestre = p.anosemestre)'
      #9'LEFT JOIN diario_provas_alunos a ON '
      #9'('
      #9#9'p.turma = a.cd_turma AND'
      #9#9'p.anosemestre = a. nr_anosem AND'
      #9#9'p.disciplina = a.cd_disciplina AND'
      #9#9'p.bimestre = a.cd_bimestre AND'
      #9#9'p.nro_nota = a.nr_prova AND'
      #9#9'f.codigoaluno = a.cd_pessoa'
      #9')'
      'WHERE'
      #9'f.turma = :turma'
      #9'AND f.anosemestre = :anosem'
      #9'AND f.disciplina = :disciplina '
      #9'AND p.bimestre = :bimestre'
      #9'AND A.cd_pessoa is null')
    Params = <
      item
        DataType = ftUnknown
        Name = 'turma'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'anosem'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'disciplina'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'bimestre'
        ParamType = ptUnknown
      end>
    Left = 352
    Top = 200
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'turma'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'anosem'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'disciplina'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'bimestre'
        ParamType = ptUnknown
      end>
  end
  object qyVerificaTipoDigitacao: TUMZQuery
    Connection = DM.db
    SQL.Strings = (
      'SELECT'
      #9'ap.cd_avaliacao'
      'FROM'
      #9'diario_provas dp'
      
        #9'INNER JOIN turmas t ON (t.codigo = dp.turma AND t.anosemestre =' +
        ' dp.anosemestre)'
      
        '  INNER JOIN grades_disciplinas gd ON ( t.cd_grade = gd.CD_GRADE' +
        ' AND t.curso = gd.CD_CURSO AND t.serie = gd.NR_SERIE AND dp.disc' +
        'iplina = gd.CD_DISCIPLINA)'
      
        #9'INNER JOIN avaliacoes_parametros ap ON (ap.cd_avaliacao = COALE' +
        'SCE(gd.cd_avaliacao, t.cd_avaliacao))'
      
        #9'INNER JOIN avaliacoes_conceitos ac ON (ac.cd_avaliacao = ap.cd_' +
        'avaliacao)'
      'WHERE'
      #9'dp.turma = :turma AND'
      #9'dp.anosemestre = :anosemestre AND'
      #9'dp.disciplina = :disciplina AND'
      #9'dp.bimestre = :bimestre AND'
      #9'dp.nro_nota = :nro_nota AND'
      
        #9'( (ap.sn_conceitos_parciais = '#39'S'#39' AND ap.sn_notas = '#39'S'#39' AND dp.' +
        'nr_tipo_digitacao = 1) OR'
      '    (ap.sn_conceitos_parciais = '#39'S'#39' AND ap.sn_notas = '#39'N'#39') )'
      'LIMIT 1')
    Params = <
      item
        DataType = ftUnknown
        Name = 'turma'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'anosemestre'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'disciplina'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'bimestre'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'nro_nota'
        ParamType = ptUnknown
      end>
    Left = 352
    Top = 232
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'turma'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'anosemestre'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'disciplina'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'bimestre'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'nro_nota'
        ParamType = ptUnknown
      end>
    object qyVerificaTipoDigitacaocd_avaliacao: TIntegerField
      FieldName = 'cd_avaliacao'
    end
  end
  object qyAtualizaAtividadesDomiciliares: TUMZQuery
    Connection = DM.db
    SQL.Strings = (
      
        'REPLACE INTO diario_aulas_alunos (cd_pessoa, cd_turma, nr_anosem' +
        ', cd_disciplina, cd_bimestre, nr_aula, ds_freq)'
      'SELECT'
      
        #9'ad.cd_pessoa, da.turma, da.anosemestre, da.disciplina, da.bimes' +
        'tre, da.nro_aula, LPAD('#39#39', da.qtd_aulas, '#39'-'#39') ds_freq'
      'FROM'
      #9'atd_atividades_domiciliares ad'
      #9'INNER JOIN diario_aulas da ON ('
      #9#9'ad.cd_turma = da.turma AND'
      #9#9'ad.nr_anosemestre = da.anosemestre AND'
      #9#9'da.data BETWEEN ad.dt_inicio AND ad.dt_fim'
      #9')'
      #9'INNER JOIN fichaindividual fi ON ('
      #9#9'fi.anosemestre = ad.nr_anosemestre AND'
      #9#9'fi.turma = da.turma AND'
      #9#9'fi.disciplina = da.disciplina AND'
      #9#9'fi.codigoaluno = ad.cd_pessoa'
      #9')'
      'WHERE'
      #9'ad.nr_anosemestre = :nr_anosemestre'
      #9'AND ad.cd_turma LIKE :cd_turma')
    Params = <
      item
        DataType = ftUnknown
        Name = 'nr_anosemestre'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'cd_turma'
        ParamType = ptUnknown
      end>
    Left = 384
    Top = 200
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'nr_anosemestre'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'cd_turma'
        ParamType = ptUnknown
      end>
  end
  object ilAcoes: TImageList
    Left = 416
    Top = 416
    Bitmap = {
      494C01010E001300040010001000FFFFFFFFFF10FFFFFFFFFFFFFFFF424D3600
      0000000000003600000028000000400000005000000001002000000000000050
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000FF000000FF000000FF0000
      00FF000000FF000000FF000000FF000000FF000000FF000000FF000000FF0000
      00FF000000FF000000FF000000FF000000FF0000000000000000000000000000
      00009C9C9C009C9C9C0000000000000000000000000000000000BBBBD2000000
      5700000057000000570000005700000057000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000FF000000FF000000FF1C1F
      29FF141722FFEDEDEEFF000000FF000000FF000000FF000000FF000000FF0000
      00FF000000FF000000FF000000FF000000FF0000000000000000000000009C9C
      9C003B3B3B003B3B3B009C9C9C00000000000000000000000000EEEEF3003333
      78008888B0000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000FF000000FFFEFEFEFF1719
      24FF171A24FF2C2F38FF000000FF000000FF000000FF000000FFA9AAADFF181B
      25FF181B25FF65676EFF000000FF000000FF00000000000000009C9C9C003B3B
      3B003B3B3B003B3B3B003B3B3B009C9C9C00000000000000000000000000DDDD
      E80011116200BBBBD20000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000FF000000FF000000FF4547
      4FFF1B1E27FF1B1E27FFB3B4B7FF000000FF000000FFECECEDFF1B1E27FF8889
      8EFFD2D2D4FF1B1E27FF9A9B9FFF000000FF000000009C9C9C003B3B3B003B3B
      3B003B3B3B003B3B3B003B3B3B003B3B3B009C9C9C0000000000000000000000
      0000BBBBD20011116200CCCCDD00000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000FF000000FF000000FFFEFE
      FEFF1F212AFF1F222AFF1F222AFFFAFAFAFF000000FF7E7F84FF1F222AFFF8F8
      F9FF000000FF1F212AFF20222BFF000000FF9C9C9C003B3B3B003B3B3B003B3B
      3B003B3B3B003B3B3B003B3B3B003B3B3B003B3B3B009C9C9C00000000000000
      0000000000009999BB0033337800EEEEF3000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000FF000000FF000000FF0000
      00FF909196FF24262EFF24262EFF5F6066FF000000FF6D6F74FF23262EFF0000
      00FF000000FF33353DFF24262FFF000000FF0000000000000000000000003B3B
      3B003B3B3B003B3B3B003B3B3B00000000000000000000000000EEEEF300BBBB
      D200BBBBD200BBBBD2003333780055558F000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000FF000000FF000000FF0000
      00FF000000FF383840FF282A31FF282A31FFDBDBDDFF9FA0A3FF282A31FFEDED
      EEFF000000FF282A31FF47484FFF000000FF0000000000000000000000003B3B
      3B003B3B3B003B3B3B003B3B3B00000000000000000000000000CCCCDD004444
      8300444483004444830044448300444483000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000FF000000FF000000FF0000
      00FF000000FFE7E7E7FF2C2E34FF2C2E35FF2D2F36FFFEFEFEFF2E2F36FF393A
      40FF56575CFF2C2D34FFD4D4D6FF000000FF0000000000000000000000003B3B
      3B003B3B3B003B3B3B003B3B3B00000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000FFF9F9F9FF5F6066FF3233
      3AFF57585EFFF6F6F7FF707075FF303238FF303238FF97989BFFF8F8F8FF8182
      86FF7B7C80FFE7E8E8FF000000FF000000FF0000000000000000000000003B3B
      3B003B3B3B003B3B3B003B3B3B0000000000000000000000000000000000F3F0
      EE00CFC5BE00F3F0EE0000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000FF4A4B50FF38393EFFD9D9
      DAFF414247FF3B3C42FFFEFEFEFF37383EFF35363BFF34353BFFF3F3F4FF0000
      00FF000000FF000000FF000000FF000000FF0000000000000000000000003B3B
      3B003B3B3B003B3B3B003B3B3B00000000000000000000000000E7E2DE005737
      1D009F8C7D00937E6D00937E6D006F533D000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000FF393A3FFF96969AFF0000
      00FF8C8C90FF383A3FFFF9F9F9FFC5C5C6FF393A3FFF393A3FFF505156FF0000
      00FF000000FF000000FF000000FF000000FF0000000000000000000000003B3B
      3B003B3B3B003B3B3B003B3B3B00000000000000000000000000CFC5BE006345
      2D000000000000000000AB9B8E007B624D000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000FEFEFEFF3D3E42FF9E9EA0FF0000
      00FF9D9EA0FF3D3E42FFEEEEEFFF000000FF5A5A5EFF3D3E42FF3D3E42FFC4C4
      C5FF000000FF000000FF000000FF000000FF0000000000000000000000003B3B
      3B003B3B3B003B3B3B003B3B3B00000000000000000000000000E7E2DE005737
      1D00AB9B8E00E7E2DE00CFC5BE007B624D000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000FF414245FF8E8E90FF0000
      00FF89898BFF414145FF000000FF000000FFF8F8F9FF414145FF414246FF4142
      46FFFCFCFCFF000000FF000000FF000000FF0000000000000000000000003B3B
      3B003B3B3B003B3B3B003B3B3B0000000000000000000000000000000000F3F0
      EE00AB9B8E007B624D0057371D007B624D000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000FF616164FF454549FFAFAF
      B1FF454549FF5B5B5FFF000000FF000000FF000000FF9C9D9EFF464649FF4646
      49FF88888BFF000000FF000000FF000000FF0000000000000000000000003B3B
      3B003B3B3B003B3B3B003B3B3B00000000000000000000000000F3F0EE00CFC5
      BE000000000000000000CFC5BE007B624D000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000FF000000FF929293FF7778
      79FF949495FF000000FF000000FF000000FF000000FF000000FF525355FF4A4A
      4CFF7A7A7CFF000000FF000000FF000000FF0000000000000000000000003B3B
      3B003B3B3B003B3B3B003B3B3B00000000000000000000000000E7E2DE005737
      1D00CFC5BE0000000000AB9B8E0087705D000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000FF000000FF000000FF0000
      00FF000000FF000000FF000000FF000000FF000000FF000000FF000000FFCCCC
      CDFF000000FF000000FF000000FF000000FF0000000000000000000000003B3B
      3B003B3B3B003B3B3B003B3B3B0000000000000000000000000000000000DBD4
      CE00937E6D007B624D00937E6D00F3F0EE000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000008D5D59008D5D59008D5D59008D5D59008D5D59008D5D59008D5D
      59008D5D59008D5D59008D5D590000000000000000FFE7D4BAFFA15B00FFA15B
      00FFA15B00FFA15B00FFA15B00FFA15B00FFA15B00FFA15B00FFA15B00FFA15B
      00FFA15B00FFE7D4BAFF000000FF000000FF0000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000008D5D5900F6E1CC00FEDAB600FED7AF00FECD9D00FECA9700FDC3
      8B00FBC08700FBC08700FBC0870000000000000000FFA15B00FFCF9E52FFF8D9
      9AFFF8D99AFFF9D89AFFF8D99AFFF8D999FFF9D999FFF8D99AFFF9D999FFF8D8
      9AFFCF9E52FFA15B00FF000000FF000000FF0000000000000000000000000000
      0000000000000000FF0000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000093605900FCE9D600FEDFBF00FEDCBA00FED3A800FECFA100FEC6
      8F00FDC38B00FBC08700FBC0870000000000000000FFA35C00FFF9DB9FFFF8DB
      9FFFF9DBA0FFF8DBA0FFF9DBA0FFF8DBA0FFF8DBA0FFF9DB9FFFF8DBA0FFF9DA
      9FFFF8DB9FFFA35C00FF000000FF000000FF0000000000000000000000000000
      00000000FF000000FF000000FF00000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000A0675E00FDF5ED00FEEEDE00FCE9D600FEDFBF00FEDAB600FED1
      A500FECC9B00FEC68F00FDC38B0000000000000000FFA45E00FFF9DEA6FFF9DD
      A7FFB36C00FFF9DDA7FFB36C00FFF9DDA7FFB36C00FFF9DDA7FFB36C00FFF9DE
      A6FFFADEA7FFA55F00FF000000FF000000FF0000000000000000000000000000
      00000000FF000000FF000000FF00000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000008D5D59008D5D59008D5D
      59008D5D5900A2696100FDFAF700FDF3E900FEEEDE00FAE6D100FEDFBF00FED7
      AF00FED3A800FECA9700FEC8930000000000000000FFA76100FFF9E1AEFFF9E1
      AEFFFAE1AFFFFAE1AFFFFAE1AFFFFAE1AFFFFAE1AFFFFAE1AFFFFAE1AFFFFAE1
      AFFFFAE1AEFFA76100FF000000FF000000FF0000000000000000000000000000
      FF000000FF000000FF000000FF000000FF000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000001FFF00000000000000
      00000000000000000000000000000000000000000000F6E1CC00FEDFBF00FED7
      AF00FED1A500B2796300FEFDFE00FDFBF900FDF8F300FDF0E300FEEEDE00FAE6
      D100FEDFBF00FED5AB00FED1A50000000000000000FFA96300FFFBE4B8FFFAE4
      B7FFB36C00FFFAE4B7FFB36C00FFFAE4B7FFB36C00FFFAE4B7FFB36C00FFFAE4
      B7FFFBE4B8FFAA6300FF000000FF000000FF00000000000000000000FF000000
      FF000000FF000000FF000000FF000000FF000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000001FFF00001FFF00001FFF000000
      00000000000000000000000000000000000000000000FCE9D600FAE6D100FEDC
      BA00FED7AF00BA7F6100FEFDFE00FEFDFE00FDFCFA00FDF5ED00FDF3E900FCE9
      D600FAE6D100FEDCBA00FED7AF0000000000000000FFAD6600FFFBE8C0FFFBE7
      C1FFFBE8C0FFFBE8C0FFFBE8C0FFFBE8C0FFFBE8C0FFFBE8C0FFFBE8C0FFFBE8
      C0FFFBE7C1FFAC6600FF000000FF000000FF000000007F7F7F000000FF000000
      FF0000000000000000000000FF000000FF000000FF0000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000001FFF00001FFF00001FFF00001FFF00001F
      FF000000000000000000000000000000000000000000FDF5ED00FDF0E300FCE9
      D600FAE6D100D3946C00FEFDFE00FEFDFE00FEFDFE00FEFDFE00FDFBF900FDF5
      ED00FDF0E300FCE9D600F6E1CC0000000000000000FFAF6900FFFCEBCAFFFBEB
      CAFFB36C00FFFBEBCAFFB36C00FFFBEBCAFFB36C00FFFBEBCAFFB36C00FFFBEB
      CAFFFCEBCAFFB06900FF000000FF000000FF7F7F7F000000FF00000000000000
      00000000000000000000000000000000FF000000FF0000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000001FFF00000000000000
      00000000000000000000000000000000000000000000FDFAF700FDF7F100FEEE
      DE00FCE9D600D4976F00FEFDFE00FEFDFE00FEFDFE00FEFDFE00FEFDFE00FDF3
      E900F3DEC800C0A69000BEA38D0000000000000000FFB36C00FFFCEED4FFFCEE
      D3FFFCEED3FFFCEFD4FFFCEED3FFFCEED4FFFCEFD3FFFCEFD3FFFCEFD4FFFCEE
      D4FFFCEED3FFB36C00FF000000FF000000FF0000000000000000000000000000
      00000000000000000000000000000000FF000000FF000000FF00000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000FEFDFE00FEFDFE00FDF8
      F300FDF5ED00D89F7600FEFDFE00FEFDFE00FEFDFE00FEFDFE00FEFDFE00FEFD
      FE00A0675E00DF924000DE903C0000000000000000FFB66E00FFFDF2DCFFFCF2
      DDFFFDF2DCFFFDF2DDFFFDF2DCFFFDF2DCFFFDF2DDFFFDF2DCFFFDF2DCFFFDF2
      DDFFFCF2DCFFB56F00FF000000FF000000FF0000000000000000000000000000
      0000000000000000000000000000000000000000FF000000FF00000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000001FFF0000000000000000000000
      00000000000000000000000000000000000000000000FEFDFE00FEFDFE00FDFC
      FA00FDFAF700D89F7600FEFDFE00FEFDFE00FEFDFE00FEFDFE00FEFDFE00FEFD
      FE00A0675E00DE944400DE903C0000000000000000FFB87200FFFEF5E5FFFEF6
      E6FF3C970DFF3C970DFF3C970DFF3C970DFF3C970DFF3C970DFF3C970DFFFEF5
      E5FFFDF6E5FFB87100FF000000FF000000FF0000000000000000000000000000
      000000000000000000000000000000000000000000000000FF000000FF000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000001FFF0000000000001FFF00000000000000000000000000000000000000
      00000000000000000000000000000000000000000000FEFDFE00FEFDFE00FEFD
      FE00FEFDFE00D89F7600D3946C00D3946C00D3946C00D3946C00D3946C00D394
      6C00A0675E00000000000000000000000000000000FFBB7400FFFEF8EEFFFEF8
      EDFF30AE4CFF30AE4CFF30AE4CFF30AE4CFF30AE4CFF30AE4CFF30AE4CFFFEF8
      EEFFFEF8EEFFBA7400FF000000FF000000FF0000000000000000000000000000
      00000000000000000000000000000000000000000000000000007F7F7F000000
      FF00000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000FEFDFE00FEFDFE00FEFD
      FE00FEFDFE00FEFDFE00FDFCFA00F3DEC800C6AD9500BEA38D00724241000000
      000000000000000000000000000000000000000000FFBC7600FFFFFBF5FFFEFB
      F4FF25C284FF25C284FF25C284FF25C284FF25C284FF25C284FF25C284FFFEFC
      F5FFFEFBF4FFBD7500FF000000FF000000FF0000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000007F7F
      7F000000FF000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000FEFDFE00FEFDFE00FEFD
      FE00FEFDFE00FEFDFE00FEFDFE00A0675E00DC9B5C00DE903C00A56C64000000
      000000000000000000000000000000000000000000FFBE7700FFFFFEFAFFFFFD
      FAFFFEFDFBFFFFFDFBFFFFFEFBFFFEFEFBFFFEFDFBFFFFFEFBFFFFFDFBFFFFFD
      FAFFFFFDFBFFBE7700FF000000FF000000FF0000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000FF000000FF00000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000FEFDFE00FEFDFE00FEFD
      FE00FEFDFE00FEFDFE00FEFDFE00A0675E00DB9D6300DE903C00000000000000
      000000000000000000000000000000000000000000FFBE7700FFE6D3BAFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFE6D3BAFFBE7700FF000000FF000000FF0000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000D3946C00D3946C00D394
      6C00D3946C00D3946C00D3946C00A0675E00DB9D630000000000000000000000
      000000000000000000000000000000000000000000FFE7D4BAFFBE7700FFBE77
      00FFBE7700FFBE7700FFBE7700FFBE7700FFBE7700FFBE7700FFBE7700FFBE77
      00FFBE7700FFE7D4BAFF000000FF000000FF0000000000000000000000000000
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
      2800000040000000500000000100010000000000800200000000000000000000
      000000000000000000000000FFFFFF0000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000FFFFF3C000000000E3FFE1C700000000
      C3C3C0E300000000E181807100000000E089003800000000F099E1C000000000
      F809E1C000000000F801E1FF000000008003E1E300000000801FE1C000000000
      901FE1CC00000000110FE1C0000000009307E1E0000000008387E1CC00000000
      C7C7E1C400000000FFEFE1E000000000FFFFFFFFF8018003FFFFFFFFF8018003
      F9FFFFFFF8018003F0FFFFFFF8018003F0FFFFFF80018003E07FFFBF80018003
      C07FFF1F80018003843FFE0F800180031E3FFFBF80018003FE1FFFFF80018003
      FF1FFF7F80018003FF8FF5FF80078003FFC7FFFF801F8003FFE3FFFF801F8003
      FFF8FFFF803F8003FFFFFFFF807F8003FFFFF8F8FFFFFFFFF83FFAFAFC7FE3FF
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
  object pmJustificarFaltas: TPopupMenu
    AutoPopup = False
    Left = 168
    Top = 248
    object Justificativadefaltas1: TMenuItem
      Caption = 'Justificativa de faltas'
      OnClick = Justificativadefaltas1Click
    end
  end
  object qryInsertDescricao: TUMZQuery
    Connection = DM.db
    SQL.Strings = (
      'INSERT IGNORE INTO diarios_descricoes ('
      '   nr_anosemestre,'
      '   cd_turma,'
      '   nr_disciplina,'
      '   cd_pessoa,'
      '   nr_avaliacao'
      ')'
      'SELECT DISTINCT'
      '   fi.anosemestre  nr_anosem,'
      '   fi.turma        cd_turma,'
      '   fi.disciplina   cd_disciplina,'
      '   fi.codigoaluno  cd_pessoa,'
      '   :cd_bimestre nr_avaliacao'
      'FROM'
      '   fichaindividual fi'
      '      LEFT JOIN diarios_descricoes dd ON ('
      '         dd.nr_anosemestre = fi.anosemestre AND'
      '         dd.cd_turma = fi.turma AND'
      '         dd.nr_disciplina = fi.disciplina AND'
      '         dd.cd_pessoa = fi.codigoaluno'
      '      )'
      'WHERE'
      '  fi.anosemestre = :anosemestre AND'
      '  fi.turma = :turma AND'
      '  fi.disciplina = :disciplina')
    Params = <
      item
        DataType = ftUnknown
        Name = 'cd_bimestre'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'anosemestre'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'turma'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'disciplina'
        ParamType = ptUnknown
      end>
    Left = 320
    Top = 200
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'cd_bimestre'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'anosemestre'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'turma'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'disciplina'
        ParamType = ptUnknown
      end>
  end
end
