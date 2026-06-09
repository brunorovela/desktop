object frmAtivComplementares: TfrmAtivComplementares
  Left = 0
  Top = 0
  Caption = 'Atividades Complementares'
  ClientHeight = 616
  ClientWidth = 797
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  FormStyle = fsMDIChild
  KeyPreview = True
  OldCreateOrder = False
  Position = poDesktopCenter
  Visible = True
  WindowState = wsMaximized
  OnClose = FormClose
  OnCreate = FormCreate
  OnKeyDown = FormKeyDown
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object pcGeral: TPageControl
    Left = 0
    Top = 0
    Width = 797
    Height = 591
    ActivePage = tsCadAtividades
    Align = alClient
    Style = tsFlatButtons
    TabOrder = 0
    OnChange = pcGeralChange
    object tsCadAreas: TTabSheet
      Caption = #193'reas'
      object pnTopoAreas: TPanel
        Left = 0
        Top = 0
        Width = 789
        Height = 26
        Align = alTop
        BevelOuter = bvLowered
        Caption = 'CADASTRO DE '#193'REAS'
        Color = clBlue
        Font.Charset = ANSI_CHARSET
        Font.Color = clWhite
        Font.Height = -17
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        ParentFont = False
        TabOrder = 0
      end
      object pnCadAreaDir: TPanel
        Left = 400
        Top = 26
        Width = 389
        Height = 534
        Align = alClient
        TabOrder = 1
        object dbgrdAreas: TDBGrid
          Left = 1
          Top = 1
          Width = 387
          Height = 532
          Align = alClient
          BorderStyle = bsNone
          DataSource = dsAreas
          Options = [dgTitles, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgAlwaysShowSelection, dgConfirmDelete, dgCancelOnExit]
          TabOrder = 0
          TitleFont.Charset = DEFAULT_CHARSET
          TitleFont.Color = clWindowText
          TitleFont.Height = -11
          TitleFont.Name = 'Tahoma'
          TitleFont.Style = []
          Columns = <
            item
              Expanded = False
              FieldName = 'ds_ge_area'
              Title.Caption = 'Descri'#231#227'o'
              Width = 223
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'nr_horas'
              Title.Caption = 'Horas'
              Visible = True
            end>
        end
      end
      object pnCadAreaEsq: TPanel
        Left = 0
        Top = 26
        Width = 400
        Height = 534
        Align = alLeft
        TabOrder = 2
        object lbAreaCodigo: TLabel
          Left = 16
          Top = 6
          Width = 33
          Height = 13
          Caption = 'C'#243'digo'
          FocusControl = dbAreaCodigo
        end
        object lbAreaDescricao: TLabel
          Left = 16
          Top = 45
          Width = 46
          Height = 13
          Caption = 'Descri'#231#227'o'
        end
        object lbAreaHoras: TLabel
          Left = 16
          Top = 91
          Width = 55
          Height = 13
          Caption = 'M'#225'x. Horas'
          FocusControl = dbAreaHoras
        end
        object Label4: TLabel
          Left = 156
          Top = 113
          Width = 150
          Height = 13
          Caption = '(utilizado apenas em relat'#243'rios)'
          FocusControl = dbAreaHoras
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = [fsItalic]
          ParentFont = False
        end
        object dbAreaCodigo: TDBEdit
          Left = 16
          Top = 22
          Width = 134
          Height = 21
          DataField = 'cd_ge_area'
          DataSource = dsAreas
          MaxLength = 11
          TabOrder = 0
          OnKeyPress = dbAreaCodigoKeyPress
        end
        object dbAreaHoras: TDBEdit
          Left = 16
          Top = 110
          Width = 134
          Height = 21
          DataField = 'nr_horas'
          DataSource = dsAreas
          MaxLength = 3
          TabOrder = 1
          OnKeyPress = dbAreaHorasKeyPress
        end
      end
      object DBEdit1: TDBEdit
        Left = 16
        Top = 90
        Width = 303
        Height = 21
        DataField = 'ds_ge_area'
        DataSource = dsAreas
        TabOrder = 3
      end
    end
    object tsCadGrupos: TTabSheet
      Caption = 'Grupos'
      object pnTopoGrupos: TPanel
        Left = 0
        Top = 0
        Width = 789
        Height = 26
        Align = alTop
        BevelOuter = bvLowered
        Caption = 'CADASTRO DE GRUPOS'
        Color = clBlue
        Font.Charset = ANSI_CHARSET
        Font.Color = clWhite
        Font.Height = -17
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        ParentFont = False
        TabOrder = 0
      end
      object pnCadGruposEsq: TPanel
        Left = 0
        Top = 57
        Width = 400
        Height = 503
        Align = alLeft
        TabOrder = 1
        object lbGruposCodigo: TLabel
          Left = 16
          Top = 8
          Width = 33
          Height = 13
          Caption = 'C'#243'digo'
          FocusControl = dbGruposCodigo
        end
        object lbGruposDescricao: TLabel
          Left = 16
          Top = 48
          Width = 46
          Height = 13
          Caption = 'Descri'#231#227'o'
        end
        object Label1: TLabel
          Left = 16
          Top = 162
          Width = 55
          Height = 13
          Caption = 'M'#225'x. Horas'
          FocusControl = DBEdit2
        end
        object Label5: TLabel
          Left = 156
          Top = 182
          Width = 150
          Height = 13
          Caption = '(utilizado apenas em relat'#243'rios)'
          FocusControl = dbAreaHoras
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = [fsItalic]
          ParentFont = False
        end
        object dbGruposCodigo: TDBEdit
          Left = 16
          Top = 24
          Width = 89
          Height = 21
          DataField = 'cd_ge_grupo'
          DataSource = dsGrupos
          MaxLength = 11
          TabOrder = 0
          OnKeyPress = dbGruposCodigoKeyPress
        end
        object dbGruposDescricao: TDBMemo
          Left = 16
          Top = 67
          Width = 369
          Height = 89
          DataField = 'ds_ge_grupo'
          DataSource = dsGrupos
          ScrollBars = ssVertical
          TabOrder = 1
        end
        object DBEdit2: TDBEdit
          Left = 16
          Top = 179
          Width = 134
          Height = 21
          DataField = 'nr_horas'
          DataSource = dsGrupos
          TabOrder = 2
        end
      end
      object pnCadGruposDir: TPanel
        Left = 400
        Top = 57
        Width = 389
        Height = 503
        Align = alClient
        TabOrder = 2
        object dbgrdGrupos: TDBGrid
          Left = 1
          Top = 1
          Width = 387
          Height = 501
          Align = alClient
          BorderStyle = bsNone
          DataSource = dsGrupos
          Options = [dgTitles, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgAlwaysShowSelection, dgConfirmDelete, dgCancelOnExit]
          TabOrder = 0
          TitleFont.Charset = DEFAULT_CHARSET
          TitleFont.Color = clWindowText
          TitleFont.Height = -11
          TitleFont.Name = 'Tahoma'
          TitleFont.Style = []
          Columns = <
            item
              Expanded = False
              FieldName = 'ds_observacao'
              Title.Caption = 'Descri'#231#227'o'
              Visible = True
            end>
        end
      end
      object Panel1: TPanel
        Left = 0
        Top = 26
        Width = 789
        Height = 31
        Align = alTop
        Alignment = taLeftJustify
        BevelOuter = bvLowered
        Caption = '   '#193'REA SELECIONADA:'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
        TabOrder = 3
        object DBText1: TDBText
          Left = 133
          Top = 9
          Width = 48
          Height = 13
          AutoSize = True
          DataField = 'ds_ge_area'
          DataSource = dsAreas
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = [fsBold]
          ParentFont = False
        end
      end
    end
    object tsCadAtividades: TTabSheet
      Caption = 'Atividades'
      object pnTopoAtividades: TPanel
        Left = 0
        Top = 0
        Width = 789
        Height = 26
        Align = alTop
        BevelOuter = bvLowered
        Caption = 'CADASTRO DE ATIVIDADES'
        Color = clBlue
        Font.Charset = ANSI_CHARSET
        Font.Color = clWhite
        Font.Height = -17
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        ParentFont = False
        TabOrder = 0
      end
      object pnCadAtivEsq: TPanel
        Left = 0
        Top = 57
        Width = 400
        Height = 503
        Align = alLeft
        TabOrder = 1
        object lbAtividadesCodigo: TLabel
          Left = 16
          Top = 6
          Width = 33
          Height = 13
          Caption = 'C'#243'digo'
          FocusControl = dbAtividadesCodigo
        end
        object lbAtividadesGrupo: TLabel
          Left = 16
          Top = 49
          Width = 29
          Height = 13
          Caption = 'Grupo'
        end
        object lbAtividadesDescricao: TLabel
          Left = 16
          Top = 92
          Width = 46
          Height = 13
          Caption = 'Descri'#231#227'o'
          FocusControl = dbAtividadesDescricao
        end
        object lbAtividadesHoras: TLabel
          Left = 16
          Top = 215
          Width = 129
          Height = 13
          Caption = 'Horas m'#225'xima da atividade'
          FocusControl = dbAtividadesHoras
        end
        object lbAtividadesHrCurso: TLabel
          Left = 16
          Top = 295
          Width = 115
          Height = 13
          Caption = 'Horas m'#225'xima por curso'
          FocusControl = dbAtividadesHrCurso
        end
        object lbAtividadesHrAtividade: TLabel
          Left = 16
          Top = 374
          Width = 133
          Height = 13
          Caption = 'Horas m'#225'xima por atividade'
          FocusControl = dbAtividadesHrAtividade
        end
        object Label3: TLabel
          Left = 16
          Top = 135
          Width = 66
          Height = 13
          Caption = 'Caracter'#237'stica'
        end
        object Label9: TLabel
          Left = 16
          Top = 255
          Width = 307
          Height = 26
          Caption = 
            'Obs.: Total de horas que o aluno pode possuir nessa atividade. (' +
            'validado pelo sistema)'
          FocusControl = dbAreaHoras
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = [fsItalic]
          ParentFont = False
          WordWrap = True
        end
        object Label7: TLabel
          Left = 16
          Top = 335
          Width = 347
          Height = 26
          Caption = 
            'Obs.: Total de horas que o aluno pode possuir nessa atividade ao' +
            ' longo do curso. (validado pelo sistema)'
          FocusControl = dbAreaHoras
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = [fsItalic]
          ParentFont = False
          WordWrap = True
        end
        object Label8: TLabel
          Left = 16
          Top = 413
          Width = 339
          Height = 26
          Caption = 
            'Obs.: Total de horas limite que ser'#225' permitido informar no cadas' +
            'tro de uma '#250'nica atividade desse tipo. (validado pelo sistema)'
          FocusControl = dbAreaHoras
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = [fsItalic]
          ParentFont = False
          WordWrap = True
        end
        object Label10: TLabel
          Left = 16
          Top = 175
          Width = 62
          Height = 13
          Caption = 'Tabela Siga: '
        end
        object dbAtividadesCodigo: TDBEdit
          Left = 16
          Top = 22
          Width = 134
          Height = 21
          DataField = 'cd_ge_atividade'
          DataSource = dsAtividades
          MaxLength = 11
          TabOrder = 0
          OnKeyPress = dbAtividadesCodigoKeyPress
        end
        object dbAtividadesDescricao: TDBEdit
          Left = 16
          Top = 108
          Width = 350
          Height = 21
          DataField = 'ds_ge_atividade'
          DataSource = dsAtividades
          TabOrder = 2
          OnKeyPress = dbAtividadesDescricaoKeyPress
        end
        object dbAtividadesHoras: TDBEdit
          Left = 16
          Top = 231
          Width = 133
          Height = 21
          DataField = 'nr_horas'
          DataSource = dsAtividades
          MaxLength = 3
          TabOrder = 3
          OnKeyPress = dbAtividadesHorasKeyPress
        end
        object dbAtividadesHrCurso: TDBEdit
          Left = 16
          Top = 311
          Width = 133
          Height = 21
          DataField = 'nr_horas_curso'
          DataSource = dsAtividades
          MaxLength = 3
          TabOrder = 4
          OnKeyPress = dbAtividadesHrCursoKeyPress
        end
        object dbAtividadesHrAtividade: TDBEdit
          Left = 16
          Top = 390
          Width = 133
          Height = 21
          DataField = 'nr_horas_atividade'
          DataSource = dsAtividades
          MaxLength = 3
          TabOrder = 5
          OnKeyPress = dbAtividadesHrAtividadeKeyPress
        end
        object dblcbAtividadesGrupo: TDBLookupComboBox
          Left = 16
          Top = 64
          Width = 350
          Height = 21
          DataField = 'cd_ge_grupo'
          DataSource = dsAtividades
          KeyField = 'cd_ge_grupo'
          ListField = 'ds_observacao'
          ListSource = dsGrupos
          TabOrder = 1
          OnKeyPress = dblcbAtividadesGrupoKeyPress
        end
        object dbcbSelecaoOnline: TDBCheckBox
          Left = 16
          Top = 452
          Width = 227
          Height = 17
          Caption = 'Permitir sele'#231#227'o pelo estudante no online'
          DataField = 'sn_selecao_online'
          DataSource = dsAtividades
          TabOrder = 6
          ValueChecked = '1'
          ValueUnchecked = '0'
        end
        object dbeCaracteristicas: TDBEdit
          Left = 16
          Top = 151
          Width = 350
          Height = 21
          DataField = 'ds_caracteristica'
          DataSource = dsAtividades
          TabOrder = 7
        end
        object cbTabelaSiga: TUMComboBox
          Left = 16
          Top = 190
          Width = 145
          Height = 21
          Style = csDropDownList
          ItemHeight = 13
          TabOrder = 8
          OnCloseUp = cbTabelaSigaCloseUp
          OnKeyDown = cbTabelaSigaKeyDown
          OnKeyPress = cbTabelaSigaKeyPress
          OnKeyUp = cbTabelaSigaKeyUp
          TamanhoMaximo = 0
        end
      end
      object pnCadAtivDir: TPanel
        Left = 400
        Top = 57
        Width = 389
        Height = 503
        Align = alClient
        TabOrder = 2
        object dbgrdAtividades: TDBGrid
          Left = 1
          Top = 1
          Width = 387
          Height = 501
          Align = alClient
          BorderStyle = bsNone
          DataSource = dsAtividades
          Options = [dgTitles, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgAlwaysShowSelection, dgConfirmDelete, dgCancelOnExit]
          TabOrder = 0
          TitleFont.Charset = DEFAULT_CHARSET
          TitleFont.Color = clWindowText
          TitleFont.Height = -11
          TitleFont.Name = 'Tahoma'
          TitleFont.Style = []
          Columns = <
            item
              Expanded = False
              FieldName = 'ds_ge_atividade'
              Title.Caption = 'Atividade'
              Width = 295
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'cd_ge_grupo'
              Title.Caption = 'Grupo'
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'nr_horas'
              Title.Caption = 'Horas'
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'nr_horas_curso'
              Title.Caption = 'Horas por Curso'
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'nr_horas_atividade'
              Title.Caption = 'Horas por Atividade'
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'ds_caracteristica'
              Title.Caption = 'Caracter'#237'stica'
              Width = 255
              Visible = True
            end>
        end
      end
      object Panel2: TPanel
        Left = 0
        Top = 26
        Width = 789
        Height = 31
        Align = alTop
        Alignment = taLeftJustify
        BevelOuter = bvLowered
        Caption = '   GRUPO SELECIONADO:'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
        TabOrder = 3
        object DBText3: TDBText
          Left = 133
          Top = 9
          Width = 48
          Height = 13
          AutoSize = True
          DataField = 'ds_observacao'
          DataSource = dsAtividades
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = [fsBold]
          ParentFont = False
        end
      end
    end
    object tsCadAtivCurso: TTabSheet
      Caption = 'Atividades por Curso'
      object pnTopoAtivCurso: TPanel
        Left = 0
        Top = 0
        Width = 789
        Height = 26
        Align = alTop
        BevelOuter = bvLowered
        Caption = 'CADASTRO DE ATIVIDADES POR CURSO'
        Color = clBlue
        Font.Charset = ANSI_CHARSET
        Font.Color = clWhite
        Font.Height = -17
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        ParentFont = False
        TabOrder = 0
      end
      object pnCadAtivCursoEsq: TPanel
        Left = 0
        Top = 57
        Width = 400
        Height = 503
        Align = alLeft
        TabOrder = 1
        object lbAtivCursoCodigo: TLabel
          Left = 16
          Top = 55
          Width = 32
          Height = 13
          Caption = 'Curso:'
          FocusControl = dbAtivCursoCodigo
        end
        object lbAtivCursoAnoSemestre: TLabel
          Left = 16
          Top = 12
          Width = 68
          Height = 13
          Caption = 'Ano/Semestre'
          FocusControl = dbAtivCursoAnoSemestre
        end
        object lbAtivCursoEtapa: TLabel
          Left = 16
          Top = 138
          Width = 28
          Height = 13
          Caption = 'Etapa'
          FocusControl = dbAtivCursoEtapa
        end
        object lbAtivCursoAtividade: TLabel
          Left = 16
          Top = 181
          Width = 45
          Height = 13
          Caption = 'Atividade'
        end
        object lbAtivCursoGrade: TLabel
          Left = 16
          Top = 95
          Width = 29
          Height = 13
          Caption = 'Grade'
          FocusControl = dbAtivCursoGrade
        end
        object bvAtivCursoCopia: TBevel
          Left = 265
          Top = 6
          Width = 129
          Height = 34
        end
        object btnCopiarCurso: TSpeedButton
          Left = 269
          Top = 9
          Width = 121
          Height = 28
          Caption = 'F11 Copiar Curso'
          Glyph.Data = {
            76010000424D7601000000000000760000002800000020000000100000000100
            04000000000000010000130B0000130B00001000000000000000000000000000
            800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
            FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF003333330B7FFF
            FFB0333333777F3333773333330B7FFFFFB0333333777F3333773333330B7FFF
            FFB0333333777F3333773333330B7FFFFFB03FFFFF777FFFFF77000000000077
            007077777777777777770FFFFFFFF00077B07F33333337FFFF770FFFFFFFF000
            7BB07F3FF3FFF77FF7770F00F000F00090077F77377737777F770FFFFFFFF039
            99337F3FFFF3F7F777FF0F0000F0F09999937F7777373777777F0FFFFFFFF999
            99997F3FF3FFF77777770F00F000003999337F773777773777F30FFFF0FF0339
            99337F3FF7F3733777F30F08F0F0337999337F7737F73F7777330FFFF0039999
            93337FFFF7737777733300000033333333337777773333333333}
          NumGlyphs = 2
          OnClick = btnCopiarCursoClick
        end
        object btnCodigoCurso: TSpeedButton
          Left = 119
          Top = 66
          Width = 33
          Height = 23
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
          OnClick = btnCodigoCursoClick
        end
        object Label2: TLabel
          Left = 16
          Top = 224
          Width = 55
          Height = 13
          Caption = 'M'#225'x. Horas'
          FocusControl = DBEdit3
        end
        object Label6: TLabel
          Left = 128
          Top = 243
          Width = 150
          Height = 13
          Caption = '(utilizado apenas em relat'#243'rios)'
          FocusControl = dbAreaHoras
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = [fsItalic]
          ParentFont = False
        end
        object dbAtivCursoCodigo: TDBEdit
          Left = 16
          Top = 68
          Width = 105
          Height = 21
          DataField = 'cd_curso'
          DataSource = dsAtivCursos
          MaxLength = 10
          ReadOnly = True
          TabOrder = 1
          OnKeyPress = dbAtivCursoCodigoKeyPress
        end
        object dbAtivCursoAnoSemestre: TDBEdit
          Left = 16
          Top = 28
          Width = 105
          Height = 21
          DataField = 'nr_anosem'
          DataSource = dsAtivCursos
          MaxLength = 6
          TabOrder = 0
          OnKeyPress = dbAtivCursoAnoSemestreKeyPress
        end
        object dbAtivCursoEtapa: TDBEdit
          Left = 16
          Top = 154
          Width = 105
          Height = 21
          DataField = 'nr_etapa'
          DataSource = dsAtivCursos
          MaxLength = 3
          TabOrder = 3
          OnKeyPress = dbAtivCursoEtapaKeyPress
        end
        object dbAtivCursoGrade: TDBEdit
          Left = 16
          Top = 111
          Width = 105
          Height = 21
          DataField = 'cd_grade'
          DataSource = dsAtivCursos
          MaxLength = 11
          TabOrder = 2
          OnKeyPress = dbAtivCursoGradeKeyPress
        end
        object dbAtividade: TDBLookupComboBox
          Left = 16
          Top = 197
          Width = 374
          Height = 21
          DataField = 'ds_atividade'
          DataSource = dsAtivCursos
          TabOrder = 4
        end
        object DBEdit3: TDBEdit
          Left = 16
          Top = 240
          Width = 105
          Height = 21
          DataField = 'nr_horas'
          DataSource = dsAtivCursos
          TabOrder = 5
        end
        object checkvalidaHora: TDBCheckBox
          Left = 16
          Top = 270
          Width = 142
          Height = 17
          Caption = 'Validar horas da grade'
          DataField = 'sn_validar_horas_grade'
          DataSource = dsAtivCursos
          TabOrder = 6
          ValueChecked = '1'
          ValueUnchecked = '0'
        end
      end
      object pnCadAtivCursoDir: TPanel
        Left = 400
        Top = 57
        Width = 389
        Height = 503
        Align = alClient
        TabOrder = 2
        object dbgrdAtivCursos: TDBGrid
          Left = 1
          Top = 37
          Width = 387
          Height = 465
          Align = alClient
          BorderStyle = bsNone
          DataSource = dsAtivCursos
          Options = [dgTitles, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgAlwaysShowSelection, dgConfirmDelete, dgCancelOnExit]
          TabOrder = 0
          TitleFont.Charset = DEFAULT_CHARSET
          TitleFont.Color = clWindowText
          TitleFont.Height = -11
          TitleFont.Name = 'Tahoma'
          TitleFont.Style = []
          OnCellClick = dbgrdAtivCursosCellClick
          Columns = <
            item
              Expanded = False
              FieldName = 'cd_curso'
              Title.Caption = 'Curso'
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'nr_anosem'
              Title.Caption = 'Ano/Semestre'
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'nr_etapa'
              Title.Caption = 'Etapa'
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'ds_atividade'
              Title.Caption = 'Atividade'
              Width = 350
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'cd_grade'
              Title.Caption = 'Grade'
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'nr_horas'
              Title.Caption = 'Horas'
              Visible = True
            end>
        end
        object pnFiltroAnoSemestre: TPanel
          Left = 1
          Top = 1
          Width = 387
          Height = 36
          Align = alTop
          TabOrder = 1
          object cbAnoSemestre: TCheckBox
            Left = 16
            Top = 9
            Width = 93
            Height = 17
            Caption = 'Ano/Semestre:'
            Checked = True
            State = cbChecked
            TabOrder = 0
            OnClick = cbAnoSemestreClick
          end
          object txtAnoSemestreCursos: TMaskEdit
            Left = 113
            Top = 5
            Width = 55
            Height = 22
            EditMask = '9999/9;0;_'
            Font.Charset = ANSI_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'Arial'
            Font.Style = []
            MaxLength = 6
            ParentFont = False
            TabOrder = 1
            Text = '20072'
            OnKeyPress = txtAnoSemestreCursosKeyPress
          end
          object UpDownCursos: TUpDown
            Left = 167
            Top = 5
            Width = 17
            Height = 22
            Min = -100
            TabOrder = 2
            OnClick = UpDownCursosClick
          end
        end
      end
      object Panel3: TPanel
        Left = 0
        Top = 26
        Width = 789
        Height = 31
        Align = alTop
        Alignment = taLeftJustify
        BevelOuter = bvLowered
        Caption = '   '#193'REA SELECIONADA:'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
        TabOrder = 3
        object DBText2: TDBText
          Left = 133
          Top = 9
          Width = 48
          Height = 13
          AutoSize = True
          DataField = 'ds_ge_area'
          DataSource = dsAreas
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = [fsBold]
          ParentFont = False
        end
      end
    end
  end
  object tbBotoesAcao: TToolBar
    Left = 0
    Top = 591
    Width = 797
    Height = 25
    Align = alBottom
    ButtonWidth = 84
    Caption = 'tbBotoesAcao'
    EdgeBorders = [ebTop, ebBottom]
    Images = imgBotoes
    List = True
    ShowCaptions = True
    TabOrder = 1
    object tpSeparador1: TToolButton
      Left = 0
      Top = 0
      Width = 8
      Caption = 'tpSeparador1'
      ImageIndex = 9
      Style = tbsSeparator
    end
    object btnIncluir: TToolButton
      Left = 8
      Top = 0
      AutoSize = True
      Caption = 'F2 Incluir'
      ImageIndex = 0
      OnClick = btnIncluirClick
    end
    object btnAlterar: TToolButton
      Left = 83
      Top = 0
      AutoSize = True
      Caption = 'F3 Alterar'
      ImageIndex = 1
      OnClick = btnAlterarClick
    end
    object btnExcluir: TToolButton
      Left = 162
      Top = 0
      AutoSize = True
      Caption = 'F9 Excluir'
      ImageIndex = 2
      OnClick = btnExcluirClick
    end
    object tpSeparador2: TToolButton
      Left = 239
      Top = 0
      Width = 8
      Caption = 'tpSeparador2'
      ImageIndex = 3
      Style = tbsSeparator
    end
    object btnSalvar: TToolButton
      Left = 247
      Top = 0
      AutoSize = True
      Caption = 'F5 Salvar'
      Enabled = False
      ImageIndex = 3
      OnClick = btnSalvarClick
    end
    object btnCancelar: TToolButton
      Left = 323
      Top = 0
      AutoSize = True
      Caption = 'F6 Cancelar'
      Enabled = False
      ImageIndex = 4
      OnClick = btnCancelarClick
    end
    object btnSair: TToolButton
      Left = 411
      Top = 0
      AutoSize = True
      Caption = 'F12 Fechar'
      ImageIndex = 7
      OnClick = btnSairClick
    end
    object tpSeparador3: TToolButton
      Left = 496
      Top = 0
      Width = 8
      Caption = 'tpSeparador3'
      ImageIndex = 9
      Style = tbsSeparator
    end
  end
  object imgBotoes: TImageList
    Left = 328
    Top = 224
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
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000FFFFFF007F7F7F007F7F7F007F7F7F007F7F7F007F7F7F007F7F
      7F007F7F7F007F7F7F007F7F7F007F7F7F000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF0000000000000000000000000000000000FFFF
      FF007F7F7F007F7F7F007F7F7F00FFFFFF0000000000FFFFFF00FFFFFF00FFFF
      FF00FFFFFF0000000000000000007F7F7F000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000FFFFFF0000000000FFFFFF000000000000000000000000000000
      0000FFFFFF00FFFFFF00FFFFFF000000000000000000FFFFFF007F7F7F007F7F
      7F007F7F7F00FFFFFF007F7F7F00FFFFFF007F7F7F007F7F7F007F7F7F007F7F
      7F000000000000000000000000007F7F7F000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000000000FFFF
      FF0000000000FFFFFF0000000000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00000000007F7F7F007F7F7F007F7F7F00FFFF
      FF007F7F7F00FFFFFF007F7F7F00FFFFFF0000000000FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF007F7F7F000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000FFFFFF0000000000FFFF
      FF0000000000FFFFFF0000000000FFFFFF000000000000000000000000000000
      00000000000000000000FFFFFF00000000007F7F7F00FFFFFF007F7F7F00FFFF
      FF007F7F7F00FFFFFF007F7F7F00FFFFFF007F7F7F007F7F7F007F7F7F007F7F
      7F007F7F7F007F7F7F00000000007F7F7F000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000FFFFFF0000000000FFFF
      FF0000000000FFFFFF0000000000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00000000007F7F7F00FFFFFF007F7F7F00FFFF
      FF007F7F7F00FFFFFF007F7F7F00FFFFFF0000000000FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF007F7F7F000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000FFFFFF0000000000FFFF
      FF0000000000FFFFFF0000000000FFFFFF000000000000000000000000000000
      00000000000000000000FFFFFF00000000007F7F7F00FFFFFF007F7F7F00FFFF
      FF007F7F7F00FFFFFF007F7F7F00FFFFFF007F7F7F007F7F7F007F7F7F007F7F
      7F007F7F7F007F7F7F00000000007F7F7F000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000FFFFFF0000000000FFFF
      FF0000000000FFFFFF0000000000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00000000007F7F7F00FFFFFF007F7F7F00FFFF
      FF007F7F7F00FFFFFF007F7F7F00FFFFFF0000000000FFFFFF00FFFFFF00FFFF
      FF000000000000000000000000007F7F7F000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000FFFFFF0000000000FFFF
      FF0000000000FFFFFF0000000000FFFFFF00000000000000000000000000FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00000000007F7F7F00FFFFFF007F7F7F00FFFF
      FF007F7F7F00FFFFFF007F7F7F00FFFFFF007F7F7F007F7F7F007F7F7F000000
      000000000000FFFFFF00FFFFFF007F7F7F000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000FFFFFF0000000000FFFF
      FF0000000000FFFFFF0000000000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00000000000000000000000000000000007F7F7F00FFFFFF007F7F7F00FFFF
      FF007F7F7F00FFFFFF007F7F7F00FFFFFF0000000000FFFFFF00FFFFFF000000
      00007F7F7F007F7F7F007F7F7F007F7F7F000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000FFFFFF0000000000FFFF
      FF0000000000FFFFFF0000000000FFFFFF000000000000000000FFFFFF00FFFF
      FF0000000000FFFFFF0000000000000000007F7F7F00FFFFFF007F7F7F00FFFF
      FF007F7F7F00FFFFFF007F7F7F00FFFFFF007F7F7F007F7F7F00000000000000
      00007F7F7F00FFFFFF007F7F7F00000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000FFFFFF0000000000FFFF
      FF0000000000FFFFFF0000000000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00000000000000000000000000000000007F7F7F00FFFFFF007F7F7F00FFFF
      FF007F7F7F00FFFFFF007F7F7F00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF007F7F7F007F7F7F0000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000FFFFFF0000000000FFFF
      FF0000000000FFFFFF0000000000000000000000000000000000000000000000
      0000000000000000000000000000000000007F7F7F00FFFFFF007F7F7F00FFFF
      FF007F7F7F00FFFFFF007F7F7F007F7F7F007F7F7F007F7F7F007F7F7F007F7F
      7F007F7F7F000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000FFFFFF0000000000FFFF
      FF00000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000007F7F7F00FFFFFF007F7F7F00FFFF
      FF007F7F7F007F7F7F007F7F7F007F7F7F007F7F7F007F7F7F007F7F7F000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000FFFFFF00000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000007F7F7F00FFFFFF007F7F7F007F7F
      7F007F7F7F007F7F7F007F7F7F007F7F7F007F7F7F0000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000007F7F7F007F7F7F007F7F7F007F7F
      7F007F7F7F007F7F7F007F7F7F00000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
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
      00000000000000000000000000000000FC00F80000000000F000E08600000000
      C000800E00000000000000800000000000000002000000000000008000000000
      00000002000000000000008E0000000000000018000000000000009000000000
      000100310000000000030003000000000007000700000000001F001F00000000
      007F007F0000000001FF01FF00000000FFFFF8F8FFFFFFFFF83FFAFAFC7FE3FF
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
  object qyAreas: TUMZQuery
    Connection = DM.db
    BeforeEdit = qyAreasBeforeEdit
    BeforeDelete = qyAreasBeforeDelete
    OnNewRecord = qyAreasNewRecord
    SQL.Strings = (
      'SELECT'
      '   *'
      'FROM'
      '   ge_areas'
      'ORDER BY '
      '   ds_ge_area')
    Params = <>
    Left = 328
    Top = 256
    object qyAreascd_ge_area: TLargeintField
      FieldName = 'cd_ge_area'
      Required = True
    end
    object qyAreasds_ge_area: TStringField
      FieldName = 'ds_ge_area'
      Size = 255
    end
    object qyAreasnr_horas: TFloatField
      FieldName = 'nr_horas'
    end
  end
  object dsAreas: TDataSource
    DataSet = qyAreas
    OnDataChange = dsAreasDataChange
    Left = 360
    Top = 256
  end
  object qyGrupos: TUMZQuery
    Connection = DM.db
    OnCalcFields = qyGruposCalcFields
    BeforeEdit = qyGruposBeforeEdit
    BeforeDelete = qyGruposBeforeDelete
    OnNewRecord = qyGruposNewRecord
    SQL.Strings = (
      'SELECT'
      '   *'
      'FROM'
      '   ge_grupos'
      'WHERE '
      '   cd_ge_area = :cd_ge_area'
      'ORDER BY'
      '   ds_ge_grupo')
    Params = <
      item
        DataType = ftInteger
        Name = 'cd_ge_area'
        ParamType = ptUnknown
        Size = 4
      end>
    Left = 328
    Top = 288
    ParamData = <
      item
        DataType = ftInteger
        Name = 'cd_ge_area'
        ParamType = ptUnknown
        Size = 4
      end>
    object qyGruposcd_ge_grupo: TLargeintField
      FieldName = 'cd_ge_grupo'
      Required = True
    end
    object qyGruposcd_ge_area: TLargeintField
      FieldName = 'cd_ge_area'
    end
    object qyGruposnr_horas: TFloatField
      FieldName = 'nr_horas'
    end
    object qyGruposds_ge_grupo: TMemoField
      FieldName = 'ds_ge_grupo'
      BlobType = ftMemo
    end
    object qyGruposds_observacao: TStringField
      FieldKind = fkCalculated
      FieldName = 'ds_observacao'
      Size = 255
      Calculated = True
    end
  end
  object dsGrupos: TDataSource
    DataSet = qyGrupos
    Left = 360
    Top = 288
  end
  object qyAtividades: TUMZQuery
    Connection = DM.db
    OnCalcFields = qyAtividadesCalcFields
    BeforeEdit = qyAtividadesBeforeEdit
    BeforeDelete = qyAtividadesBeforeDelete
    OnNewRecord = qyAtividadesNewRecord
    SQL.Strings = (
      'SELECT'
      '   * '
      'FROM '
      '   ge_atividades'
      'WHERE '
      '  cd_ge_grupo = :cd_ge_grupo'
      'ORDER BY'
      '   ds_ge_atividade')
    Params = <
      item
        DataType = ftInteger
        Name = 'cd_ge_grupo'
        ParamType = ptUnknown
        Size = 4
      end>
    Left = 328
    Top = 320
    ParamData = <
      item
        DataType = ftInteger
        Name = 'cd_ge_grupo'
        ParamType = ptUnknown
        Size = 4
      end>
    object qyAtividadescd_ge_atividade: TLargeintField
      FieldName = 'cd_ge_atividade'
      Required = True
    end
    object qyAtividadescd_ge_grupo: TLargeintField
      FieldName = 'cd_ge_grupo'
    end
    object qyAtividadesds_ge_atividade: TStringField
      FieldName = 'ds_ge_atividade'
      Size = 255
    end
    object qyAtividadesnr_horas: TFloatField
      FieldName = 'nr_horas'
    end
    object qyAtividadesnr_horas_curso: TFloatField
      FieldName = 'nr_horas_curso'
    end
    object qyAtividadesnr_horas_atividade: TFloatField
      FieldName = 'nr_horas_atividade'
    end
    object qyAtividadesds_observacao: TStringField
      FieldKind = fkCalculated
      FieldName = 'ds_observacao'
      Size = 255
      Calculated = True
    end
    object qyAtividadessn_selecao_online: TSmallintField
      FieldName = 'sn_selecao_online'
    end
    object qyAtividadesds_caracteristica: TStringField
      FieldName = 'ds_caracteristica'
      Size = 255
    end
    object qyAtividadescd_siga: TIntegerField
      FieldName = 'cd_siga'
    end
  end
  object dsAtividades: TDataSource
    DataSet = qyAtividades
    OnDataChange = dsAtividadesDataChange
    Left = 360
    Top = 320
  end
  object qyAtivCursos: TUMZQuery
    Connection = DM.db
    UpdateObject = updCursos
    BeforeEdit = qyAtivCursosBeforeEdit
    AfterPost = qyAtivCursosAfterPost
    BeforeDelete = qyAtivCursosBeforeDelete
    OnNewRecord = qyAtivCursosNewRecord
    SQL.Strings = (
      'select c.* from ge_cursos c '
      
        'INNER JOIN ge_atividades a ON (c.cd_ge_atividade = a.cd_ge_ativi' +
        'dade)'
      'INNER JOIN ge_grupos g ON (a.cd_ge_grupo = g.cd_ge_grupo)'
      'WHERE g.cd_ge_area=:cd_ge_area'
      'ORDER BY c.cd_curso, c.cd_grade, a.ds_ge_atividade')
    Params = <
      item
        DataType = ftInteger
        Name = 'cd_ge_area'
        ParamType = ptUnknown
        Size = 11
        Value = '0'
      end>
    Left = 328
    Top = 352
    ParamData = <
      item
        DataType = ftInteger
        Name = 'cd_ge_area'
        ParamType = ptUnknown
        Size = 11
        Value = '0'
      end>
    object qyAtivCursoscd_curso: TStringField
      FieldName = 'cd_curso'
      Required = True
      Size = 15
    end
    object qyAtivCursosnr_anosem: TSmallintField
      FieldName = 'nr_anosem'
      Required = True
    end
    object qyAtivCursosnr_etapa: TIntegerField
      FieldName = 'nr_etapa'
      Required = True
    end
    object qyAtivCursoscd_ge_atividade: TLargeintField
      FieldName = 'cd_ge_atividade'
      Required = True
    end
    object qyAtivCursosnr_horas: TFloatField
      FieldName = 'nr_horas'
    end
    object qyAtivCursosds_atividade: TStringField
      FieldKind = fkLookup
      FieldName = 'ds_atividade'
      LookupDataSet = qyAtivSelecao
      LookupKeyFields = 'cd_ge_atividade'
      LookupResultField = 'ds_ge_atividade'
      KeyFields = 'cd_ge_atividade'
      Size = 255
      Lookup = True
    end
    object qyAtivCursoscd_grade: TIntegerField
      FieldName = 'cd_grade'
    end
    object qyAtivCursossn_validar_horas_grade: TSmallintField
      FieldName = 'sn_validar_horas_grade'
    end
  end
  object dsAtivCursos: TDataSource
    DataSet = qyAtivCursos
    Left = 360
    Top = 352
  end
  object updCursos: TZUpdateSQL
    DeleteSQL.Strings = (
      'delete from ge_cursos'
      'where'
      '  cd_curso = :OLD_cd_curso and'
      '  nr_anosem = :OLD_nr_anosem and'
      '  nr_etapa = :OLD_nr_etapa and'
      '  cd_ge_atividade = :OLD_cd_ge_atividade and'
      '  cd_grade = :OLD_cd_grade')
    InsertSQL.Strings = (
      'insert into ge_cursos'
      
        '  (cd_curso, nr_anosem, nr_etapa, cd_ge_atividade, cd_grade, nr_' +
        'horas, sn_validar_horas_grade)'
      'values'
      
        '  (:cd_curso, :nr_anosem, :nr_etapa, :cd_ge_atividade, :cd_grade' +
        ', :nr_horas, :sn_validar_horas_grade)')
    ModifySQL.Strings = (
      'update ge_cursos'
      'set'
      '  cd_curso = :cd_curso,'
      '  nr_anosem = :nr_anosem,'
      '  nr_etapa = :nr_etapa,'
      '  cd_ge_atividade = :cd_ge_atividade,'
      '  cd_grade = :cd_grade,'
      '  nr_horas = :nr_horas,'
      '  sn_validar_horas_grade = :sn_validar_horas_grade'
      'where'
      '  cd_curso = :OLD_cd_curso and'
      '  nr_anosem = :OLD_nr_anosem and'
      '  nr_etapa = :OLD_nr_etapa and'
      '  cd_ge_atividade = :OLD_cd_ge_atividade and'
      '  ('
      '     ( :OLD_cd_grade IS NULL AND cd_grade IS NULL ) OR'
      '     ( :OLD_cd_grade IS NOT NULL AND cd_grade = :OLD_cd_grade )'
      '  )')
    UseSequenceFieldForRefreshSQL = False
    Left = 296
    Top = 352
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'cd_curso'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'nr_anosem'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'nr_etapa'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'cd_ge_atividade'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'cd_grade'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'nr_horas'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'sn_validar_horas_grade'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'OLD_cd_curso'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'OLD_nr_anosem'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'OLD_nr_etapa'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'OLD_cd_ge_atividade'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'OLD_cd_grade'
        ParamType = ptUnknown
      end>
  end
  object qyAtivSelecao: TUMZQuery
    Connection = DM.db
    BeforeEdit = qyAtividadesBeforeEdit
    BeforeDelete = qyAtividadesBeforeDelete
    OnNewRecord = qyAtividadesNewRecord
    SQL.Strings = (
      'select a.cd_ge_atividade, a.ds_ge_atividade'
      'FROM ge_atividades a '
      'INNER JOIN ge_grupos g ON (a.cd_ge_grupo = g.cd_ge_grupo)'
      'WHERE g.cd_ge_area=:cd_ge_area'
      'ORDER BY a.ds_ge_atividade')
    Params = <
      item
        DataType = ftString
        Name = 'cd_ge_area'
        ParamType = ptUnknown
        Value = '0'
      end>
    Left = 256
    Top = 352
    ParamData = <
      item
        DataType = ftString
        Name = 'cd_ge_area'
        ParamType = ptUnknown
        Value = '0'
      end>
    object qyAtivSelecaocd_ge_atividade: TLargeintField
      FieldName = 'cd_ge_atividade'
      Required = True
    end
    object qyAtivSelecaods_ge_atividade: TStringField
      FieldName = 'ds_ge_atividade'
      Size = 255
    end
  end
  object qryTabelaSiga: TUMZQuery
    Connection = DM.db
    SQL.Strings = (
      'SELECT'
      #9'*'
      'FROM'
      #9'siga_tabela st'
      'INNER JOIN siga_tipo_tabela stt ON ('
      #9'st.cd_tipo = stt.cd_tipo'
      #9'AND stt.ds_chave = '#39'analitico'#39
      ');')
    Params = <>
    Left = 328
    Top = 384
    object qryTabelaSigacd_siga: TLargeintField
      FieldName = 'cd_siga'
      Required = True
    end
    object qryTabelaSigacd_siga_pai: TLargeintField
      FieldName = 'cd_siga_pai'
      Required = True
    end
    object qryTabelaSigacd_tipo: TLargeintField
      FieldName = 'cd_tipo'
      Required = True
    end
    object qryTabelaSigacd_local: TLargeintField
      FieldName = 'cd_local'
      Required = True
    end
    object qryTabelaSigads_codigo_siga: TStringField
      FieldName = 'ds_codigo_siga'
      Size = 255
    end
    object qryTabelaSigads_assunto: TStringField
      FieldName = 'ds_assunto'
      Size = 255
    end
    object qryTabelaSigads_fase_corrente: TStringField
      FieldName = 'ds_fase_corrente'
      Size = 255
    end
    object qryTabelaSigads_fase_intermediaria: TStringField
      FieldName = 'ds_fase_intermediaria'
      Size = 255
    end
    object qryTabelaSigads_fase_final: TStringField
      FieldName = 'ds_fase_final'
      Size = 255
    end
    object qryTabelaSigads_destinacao_final: TStringField
      FieldName = 'ds_destinacao_final'
      Size = 255
    end
    object qryTabelaSigame_observacao: TStringField
      FieldName = 'me_observacao'
      Size = 255
    end
    object qryTabelaSigasn_mec: TSmallintField
      FieldName = 'sn_mec'
    end
    object qryTabelaSigadt_cadastro: TDateTimeField
      FieldName = 'dt_cadastro'
    end
  end
  object dsTabelasiga: TDataSource
    DataSet = qryTabelaSiga
    Left = 360
    Top = 384
  end
  object qryModuloSiga: TUMZQuery
    Connection = DM.db
    SQL.Strings = (
      'select'
      '  sn_ativo'
      'from nu_modulos'
      'where'
      '  ds_chave = '#39'Siga'#39)
    Params = <>
    Left = 296
    Top = 384
  end
end
