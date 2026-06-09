object frmCursos: TfrmCursos
  Left = 177
  Top = 140
  Caption = 'Cadastro de Cursos'
  ClientHeight = 746
  ClientWidth = 1264
  Color = clBtnFace
  Font.Charset = ANSI_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Arial'
  Font.Style = []
  FormStyle = fsMDIChild
  KeyPreview = True
  OldCreateOrder = True
  Position = poDesigned
  ShowHint = True
  Visible = True
  WindowState = wsMaximized
  OnClose = FormClose
  OnCloseQuery = FormCloseQuery
  OnCreate = FormCreate
  OnDestroy = FormDestroy
  OnKeyDown = FormKeyDown
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 14
  object Bevel9: TBevel
    Left = 0
    Top = 739
    Width = 1264
    Height = 7
    Align = alBottom
    Shape = bsSpacer
    ExplicitTop = 553
    ExplicitWidth = 804
  end
  object Label66: TLabel
    Left = 52
    Top = 157
    Width = 48
    Height = 14
    Caption = 'CH curso:'
  end
  object pcGeral: TPageControl
    Left = 0
    Top = 0
    Width = 1264
    Height = 714
    ActivePage = tsCursos
    Align = alClient
    PopupMenu = pmQtdDisc
    Style = tsFlatButtons
    TabOrder = 0
    OnChange = pcGeralChange
    OnChanging = pcGeralChanging
    object tsCursos: TTabSheet
      Caption = 'Cursos'
      object pnCursos: TPanel
        Left = 0
        Top = 0
        Width = 1256
        Height = 682
        Align = alClient
        TabOrder = 0
        object Panel12: TPanel
          Left = 297
          Top = 27
          Width = 958
          Height = 654
          Align = alClient
          BevelOuter = bvNone
          TabOrder = 0
          object ScrollBox3: TScrollBox
            Left = 0
            Top = 359
            Width = 958
            Height = 273
            Align = alClient
            TabOrder = 0
            object Panel29: TPanel
              Left = 0
              Top = 0
              Width = 954
              Height = 233
              Align = alTop
              TabOrder = 0
              object Label36: TLabel
                Left = 11
                Top = 135
                Width = 69
                Height = 14
                Caption = 'Observa'#231#245'es:'
                FocusControl = dbmeObservacoes
              end
              object Label33: TLabel
                Left = 360
                Top = 97
                Width = 69
                Height = 14
                Caption = 'Requerimento:'
                FocusControl = dbeRequerimento
              end
              object Label7: TLabel
                Left = 360
                Top = 58
                Width = 44
                Height = 14
                Caption = 'Contrato:'
                FocusControl = dbeContrato
              end
              object Label10: TLabel
                Left = 11
                Top = 59
                Width = 79
                Height = 14
                Caption = 'Dura'#231#227'o da H. A'
                FocusControl = dbeDuracaoHorasAula
              end
              object Label13: TLabel
                Left = 106
                Top = 59
                Width = 72
                Height = 14
                Caption = 'Nome da Etapa'
                FocusControl = dbeNomeEtapa
              end
              object Label29: TLabel
                Left = 287
                Top = 96
                Width = 52
                Height = 14
                Caption = 'Nr. Etapas:'
                FocusControl = dbeQtdEtapas
              end
              object Label2: TLabel
                Left = 581
                Top = 16
                Width = 90
                Height = 14
                Caption = 'Curso Equivalente:'
                FocusControl = dbeCursosEquivalentes
              end
              object Label9: TLabel
                Left = 510
                Top = 16
                Width = 59
                Height = 14
                Caption = 'Dias Letivos'
                FocusControl = dbeDiasLetivos
              end
              object Label8: TLabel
                Left = 438
                Top = 16
                Width = 20
                Height = 14
                Caption = 'C. H'
                FocusControl = dbeCargaHoraria
              end
              object Label3: TLabel
                Left = 307
                Top = 16
                Width = 33
                Height = 14
                Caption = 'Grade:'
              end
              object Label37: TLabel
                Left = 11
                Top = 97
                Width = 46
                Height = 14
                Caption = 'C'#243'd. MEC'
                FocusControl = dbeCodigoMec
              end
              object Label43: TLabel
                Left = 79
                Top = 96
                Width = 51
                Height = 14
                Caption = 'Grau MEC:'
                FocusControl = dbeGrauMec
              end
              object Label45: TLabel
                Left = 170
                Top = 97
                Width = 46
                Height = 14
                Caption = 'Hab. MEC'
                FocusControl = dbeHabilitacaoMec
              end
              object Label78: TLabel
                Left = 11
                Top = 16
                Width = 70
                Height = 14
                Caption = 'Departamento:'
              end
              object dbmeObservacoes: TDBMemo
                Left = 18
                Top = 155
                Width = 670
                Height = 73
                DataField = 'ME_OBSERVACOES'
                DataSource = dtcCursosColigadas
                Enabled = False
                ScrollBars = ssVertical
                TabOrder = 14
              end
              object dbeRequerimento: TDBEdit
                Left = 360
                Top = 112
                Width = 321
                Height = 22
                DataField = 'DS_REQUERIMENTO'
                DataSource = dtcCursosColigadas
                Enabled = False
                TabOrder = 13
              end
              object dbeContrato: TDBEdit
                Left = 360
                Top = 73
                Width = 321
                Height = 22
                DataField = 'DS_CONTRATO'
                DataSource = dtcCursosColigadas
                Enabled = False
                TabOrder = 8
              end
              object dbeDuracaoHorasAula: TDBEdit
                Left = 11
                Top = 74
                Width = 89
                Height = 22
                DataField = 'NR_DURACAO_AULA'
                DataSource = dtcCursosColigadas
                Enabled = False
                TabOrder = 6
              end
              object dbeNomeEtapa: TDBEdit
                Left = 106
                Top = 74
                Width = 239
                Height = 22
                DataField = 'DS_NOME_ETAPA'
                DataSource = dtcCursosColigadas
                Enabled = False
                TabOrder = 7
              end
              object dbeQtdEtapas: TDBEdit
                Left = 287
                Top = 112
                Width = 58
                Height = 22
                DataField = 'NR_SERIES'
                DataSource = dtcCursosColigadas
                Enabled = False
                TabOrder = 12
              end
              object dbeCursosEquivalentes: TDBEdit
                Left = 581
                Top = 31
                Width = 100
                Height = 22
                DataField = 'CD_CURSO_EQUIVALENTE'
                DataSource = dtcCursosColigadas
                Enabled = False
                TabOrder = 5
              end
              object dbeDiasLetivos: TDBEdit
                Left = 510
                Top = 31
                Width = 60
                Height = 22
                DataField = 'NR_DIAS_LETIVOS'
                DataSource = dtcCursosColigadas
                Enabled = False
                TabOrder = 4
              end
              object dbeCargaHoraria: TDBEdit
                Left = 438
                Top = 31
                Width = 64
                Height = 22
                DataField = 'NR_CARGA_HORARIA'
                DataSource = dtcCursosColigadas
                Enabled = False
                TabOrder = 3
              end
              object ckbUtilizarCurso: TCheckBox
                Left = 7
                Top = 1
                Width = 172
                Height = 17
                Caption = 'Utilizar este curso na Unidade'
                TabOrder = 0
                OnClick = ckbUtilizarCursoClick
              end
              object dbeCodigoMec: TDBEdit
                Left = 11
                Top = 112
                Width = 54
                Height = 22
                DataField = 'CD_CURSO_MEC'
                DataSource = dtcCursosColigadas
                TabOrder = 9
              end
              object dbeGrauMec: TDBEdit
                Left = 79
                Top = 112
                Width = 79
                Height = 22
                DataField = 'CD_GRAU_MEC'
                DataSource = dtcCursosColigadas
                Enabled = False
                TabOrder = 10
              end
              object dbeHabilitacaoMec: TDBEdit
                Left = 170
                Top = 112
                Width = 106
                Height = 22
                DataField = 'CD_HABILITACAO_MEC'
                DataSource = dtcCursosColigadas
                Enabled = False
                TabOrder = 11
              end
              object dbcbGrade: TDBLookupComboBox
                Left = 307
                Top = 31
                Width = 94
                Height = 22
                DataField = 'CD_GRADE_LK'
                DataSource = dtcCursosColigadas
                Enabled = False
                TabOrder = 2
              end
              object btnMostrarGradeCurso: TButton
                Left = 403
                Top = 29
                Width = 26
                Height = 23
                Caption = '...'
                Font.Charset = ANSI_CHARSET
                Font.Color = clWindowText
                Font.Height = -17
                Font.Name = 'Arial'
                Font.Style = [fsBold]
                ParentFont = False
                TabOrder = 15
                OnClick = btnMostrarGradeCursoClick
              end
              object dbcbDepartamento: TUMLookupComboBox
                Left = 11
                Top = 31
                Width = 280
                Height = 22
                DataField = 'DS_DEPTO_LK'
                DataSource = dtcCursosColigadas
                Enabled = False
                TabOrder = 1
              end
            end
          end
          object Panel34: TPanel
            Left = 0
            Top = 24
            Width = 958
            Height = 169
            Align = alTop
            BevelOuter = bvNone
            TabOrder = 1
            object Label73: TLabel
              Left = 6
              Top = 4
              Width = 36
              Height = 14
              Caption = 'C'#243'digo:'
              FocusControl = dbeCCodigo
            end
            object Label76: TLabel
              Left = 335
              Top = 4
              Width = 77
              Height = 14
              Caption = 'Nome do Curso:'
              FocusControl = dbeCApelido
            end
            object Label1: TLabel
              Left = 7
              Top = 42
              Width = 153
              Height = 14
              Caption = 'Descri'#231#227'o oficial da Habilita'#231#227'o:'
              FocusControl = dbeCHabilitacao
            end
            object Label74: TLabel
              Left = 6
              Top = 85
              Width = 130
              Height = 14
              Caption = 'Descri'#231#227'o oficial do Curso:'
              FocusControl = dbeCNome
            end
            object Label77: TLabel
              Left = 335
              Top = 85
              Width = 27
              Height = 14
              Caption = 'Grau:'
              FocusControl = dbeCGrau
            end
            object Label60: TLabel
              Left = 404
              Top = 85
              Width = 56
              Height = 14
              Caption = 'Relev'#226'ncia:'
              FocusControl = dbeCRelevancia
            end
            object SpeedButton2: TSpeedButton
              Left = 497
              Top = 98
              Width = 128
              Height = 25
              Caption = 'F10  Mais Informa'#231#245'es >>'
              Flat = True
              NumGlyphs = 2
              OnClick = SpeedButton2Click
            end
            object lblTitulacao: TLabel
              Left = 335
              Top = 41
              Width = 46
              Height = 14
              Caption = 'Titula'#231#227'o:'
            end
            object Label46: TLabel
              Left = 6
              Top = 128
              Width = 84
              Height = 14
              Caption = #193'rea de atua'#231#227'o:'
            end
            object dbeCCodigo: TDBEdit
              Left = 6
              Top = 19
              Width = 214
              Height = 22
              DataField = 'CD_CURSO'
              DataSource = dtcCursosMestre
              Enabled = False
              TabOrder = 0
            end
            object btnRenomearCurso: TButton
              Left = 226
              Top = 18
              Width = 23
              Height = 20
              Caption = '...'
              Enabled = False
              Font.Charset = ANSI_CHARSET
              Font.Color = clWindowText
              Font.Height = -17
              Font.Name = 'Arial'
              Font.Style = [fsBold]
              ParentFont = False
              TabOrder = 9
              OnClick = btnRenomearCursoClick
            end
            object DBCheckBox8: TDBCheckBox
              Left = 262
              Top = 22
              Width = 47
              Height = 17
              Caption = 'Ativo'
              DataField = 'SN_ATIVO'
              DataSource = dtcCursosMestre
              TabOrder = 1
              ValueChecked = 'S'
              ValueUnchecked = 'N'
            end
            object dbeCApelido: TDBEdit
              Left = 335
              Top = 19
              Width = 331
              Height = 22
              DataField = 'DS_APELIDO'
              DataSource = dtcCursosMestre
              TabOrder = 2
            end
            object dbeCHabilitacao: TDBEdit
              Left = 6
              Top = 57
              Width = 315
              Height = 22
              DataField = 'DS_HABILITACAO'
              DataSource = dtcCursosMestre
              TabOrder = 3
            end
            object dbeCNome: TDBEdit
              Left = 6
              Top = 100
              Width = 315
              Height = 22
              DataField = 'DS_CURSO'
              DataSource = dtcCursosMestre
              TabOrder = 6
            end
            object dbeCGrau: TDBEdit
              Left = 335
              Top = 101
              Width = 63
              Height = 22
              DataField = 'NR_GRAU'
              DataSource = dtcCursosMestre
              TabOrder = 7
            end
            object dbeCRelevancia: TDBEdit
              Left = 405
              Top = 100
              Width = 63
              Height = 22
              DataField = 'NR_RELEVANCIA'
              DataSource = dtcCursosMestre
              TabOrder = 8
            end
            object dblbTitulacao: TDBLookupComboBox
              Left = 335
              Top = 57
              Width = 145
              Height = 22
              DataField = 'DS_TITULACAO'
              DataSource = dtcCursosMestre
              TabOrder = 4
            end
            object rgPeriodoTurmas: TDBRadioGroup
              Left = 486
              Top = 41
              Width = 179
              Height = 51
              Caption = 'Periodo de divis'#227'o de turmas'
              DataField = 'NR_INCREMENTO'
              DataSource = dtcCursosMestre
              Items.Strings = (
                'Ano'
                'Semestre')
              ParentBackground = True
              TabOrder = 5
              Values.Strings = (
                '2'
                '1')
            end
            object dblcbAreasAtuacao: TDBLookupComboBox
              Left = 6
              Top = 143
              Width = 315
              Height = 22
              DataField = 'AREA_ATUACAO'
              DataSource = dtcCursosMestre
              TabOrder = 10
            end
            object BitBtn1: TBitBtn
              Left = 327
              Top = 143
              Width = 21
              Height = 21
              TabOrder = 11
              OnClick = BitBtn1Click
              Glyph.Data = {
                46030000424D46030000000000003600000028000000120000000E0000000100
                18000000000010030000C40E0000C40E00000000000000000000FFFFFFFFFFFF
                FFFFFFFDFDFCCCCCD36C6D9D95959FE5E6E2FFFFFFFFFFFFFFFFFFFFFFFFFFFF
                FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF0000FFFFFFFEFEFED0D0CA5A5A7F3130
                D43736ED2C2BD32B2B91868691CFD0CAF9FAF9FFFFFFFFFFFFFFFFFFFFFFFFFF
                FFFFFFFFFFFFFFFF0000FDFDFC9090A42423A93836F34544FF3A39E33A39E344
                43FF302EDE24239A3434419E9E9DF8F8F8FFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
                000081819F2D2CDF4544FF4342FF4241FF4543FF1F1E803635D24746FF4746FF
                19188454544A6F7072BBBBBBFBFCFBFFFFFFFFFFFFFFFFFF00007070A63E3DFF
                4241FF4342FF4342FF3635D82D2CB71D1D7A2B2AAA4342FB3D3CFF36366CEBEC
                E2A1A1A3616066C8C9C9FEFEFEFFFFFF0000C9CACB3C3BD54342FF3A39E02D2C
                B73737DA4544FF4342FE2A29A81A1A6E2E2DB22B2BC3B5B5C4FFFFFFEBEAEC8A
                8A8E88888AF4F5F50000FFFFFE8080BB2928D22F2EC94241FD4442FF4241FF42
                41FF4544FF4241FC302FBA11116B35354BFFFFFEFFFFFFFFFFFFD5D5D7A4A4A7
                0000FFFFFFF2F2F29191B45352D43C3BF83F3EFF4241FF4241FF4443FF4342FF
                3433F124249B83838DE8E8E6B1B1B4E5E5E6FFFFFF9595980000FFFFFFFFFFFF
                FFFFFFF6F6F5C1C1CF6A69BE4140E73C3BF92929C02A2A7B81809ADCDCD2FFFF
                FFFDFDFDD1D1D39898998B8B8D86868A0000FFFFFFFFFFFFFFFFFFFFFFFFFFFF
                FFFDFDFDD9D9DC9797AB989897E4E4DAFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFA
                FAFA87888CCBCACC0000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
                FFFFF2F2F2D1D1D3C8C8C9DDDDDEF5F5F5D9D9DAAAAAADC2C1C4F9F9FAFFFFFF
                0000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
                F2F2F2D6D6D7AFAFB2C3C3C5EAEAEAFFFFFFFFFFFFFFFFFF0000FFFFFFFFFFFF
                FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
                FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF0000FFFFFFFFFFFFFFFFFFFFFFFFFFFF
                FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
                FFFFFFFFFFFFFFFF0000}
            end
            object DBCheckBox10: TDBCheckBox
              Left = 405
              Top = 136
              Width = 260
              Height = 24
              Caption = 'Desabilitar verifica'#231#227'o de disciplinas aprovadas na Rematr'#237'cula.'
              DataField = 'SN_NAO_VERIF_DISC_APROVADAS'
              DataSource = dtcCursosMestre
              TabOrder = 12
              ValueChecked = '1'
              ValueUnchecked = '0'
              WordWrap = True
            end
          end
          object Panel22: TPanel
            Left = 0
            Top = 332
            Width = 958
            Height = 27
            Align = alTop
            BevelOuter = bvNone
            TabOrder = 2
            object Label4: TLabel
              Left = 18
              Top = 6
              Width = 92
              Height = 14
              Caption = 'Unidade de Ensino:'
            end
            object cbColigadas: TUMComboBox
              Left = 116
              Top = 2
              Width = 300
              Height = 20
              Align = alCustom
              Style = csOwnerDrawFixed
              ItemHeight = 14
              TabOrder = 0
              OnChange = cbColigadasChange
              OnDrawItem = cbColigadasDrawItem
              TamanhoMaximo = 0
            end
          end
          object Panel36: TPanel
            Left = 0
            Top = 0
            Width = 958
            Height = 24
            Align = alTop
            Alignment = taLeftJustify
            Caption = '  CADASTRO B'#193'SICO DO CURSO'
            Color = clBlue
            Font.Charset = ANSI_CHARSET
            Font.Color = clWhite
            Font.Height = -11
            Font.Name = 'Arial'
            Font.Style = [fsBold]
            ParentFont = False
            TabOrder = 3
          end
          object Panel35: TPanel
            Left = 0
            Top = 308
            Width = 958
            Height = 24
            Align = alTop
            Alignment = taLeftJustify
            Caption = '  INFORMA'#199#213'ES ADICIONAIS DO CURSO PARA A UNIDADE DE ENSINO'
            Color = clBlue
            Font.Charset = ANSI_CHARSET
            Font.Color = clWhite
            Font.Height = -11
            Font.Name = 'Arial'
            Font.Style = [fsBold]
            ParentFont = False
            TabOrder = 4
          end
          object Panel26: TPanel
            Left = 0
            Top = 217
            Width = 958
            Height = 64
            Align = alTop
            BevelOuter = bvNone
            TabOrder = 5
            object grdAtosOficiais: TDBGrid
              Left = 0
              Top = 0
              Width = 958
              Height = 64
              Align = alClient
              DataSource = srcAtosOficiais
              Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgConfirmDelete, dgCancelOnExit]
              PopupMenu = pmQtdAtosOficiais
              TabOrder = 0
              TitleFont.Charset = ANSI_CHARSET
              TitleFont.Color = clWindowText
              TitleFont.Height = -11
              TitleFont.Name = 'Arial'
              TitleFont.Style = []
              OnDblClick = grdAtosOficiaisDblClick
              Columns = <
                item
                  Expanded = False
                  FieldName = 'dt_ato'
                  Title.Caption = 'Data'
                  Width = 71
                  Visible = True
                end
                item
                  Expanded = False
                  FieldName = 'ds_titulo_ato'
                  Title.Caption = 'T'#237'tulo'
                  Width = 400
                  Visible = True
                end
                item
                  Expanded = False
                  FieldName = 'nr_anosemestre'
                  Title.Caption = 'Anosem. In'#237'cio'
                  Visible = True
                end
                item
                  Expanded = False
                  FieldName = 'nm_coligada'
                  Title.Caption = 'Unidade de Ensino'
                  Visible = True
                end>
            end
          end
          object Panel31: TPanel
            Left = 0
            Top = 281
            Width = 958
            Height = 27
            Align = alTop
            TabOrder = 6
            object dbnAtosOficiais: TUMNavigator
              Left = 1
              Top = 1
              Width = 160
              Height = 25
              DataSource = srcAtosOficiais
              VisibleButtons = [nbInsert, nbDelete, nbEdit]
              Align = alLeft
              ParentShowHint = False
              ConfirmDelete = False
              ShowHint = True
              TabOrder = 0
              OnClick = dbnAtosOficiaisClick
            end
          end
          object Panel30: TPanel
            Left = 0
            Top = 193
            Width = 958
            Height = 24
            Align = alTop
            Alignment = taLeftJustify
            Caption = '  ATOS OFICIAIS'
            Color = clBlue
            Font.Charset = ANSI_CHARSET
            Font.Color = clWhite
            Font.Height = -11
            Font.Name = 'Arial'
            Font.Style = [fsBold]
            ParentFont = False
            TabOrder = 7
          end
          object Panel7: TPanel
            Left = 0
            Top = 632
            Width = 958
            Height = 22
            Align = alBottom
            BevelOuter = bvNone
            TabOrder = 8
            object dbnCursosColigadas: TUMNavigator
              Left = 0
              Top = 0
              Width = 156
              Height = 22
              DataSource = dtcCursosColigadas
              VisibleButtons = [nbEdit, nbPost, nbCancel]
              Align = alLeft
              Enabled = False
              ParentShowHint = False
              ShowHint = True
              TabOrder = 0
              OnClick = dbnCursosColigadasClick
            end
          end
        end
        object Panel4: TPanel
          Left = 1
          Top = 27
          Width = 296
          Height = 654
          Align = alLeft
          BevelOuter = bvNone
          TabOrder = 1
          object grdCursos: TDBGrid
            Left = 0
            Top = 286
            Width = 296
            Height = 368
            Align = alClient
            BorderStyle = bsNone
            DataSource = dtcCursosMestre
            Options = [dgTitles, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgAlwaysShowSelection, dgConfirmDelete, dgCancelOnExit]
            ReadOnly = True
            TabOrder = 0
            TitleFont.Charset = ANSI_CHARSET
            TitleFont.Color = clWindowText
            TitleFont.Height = -11
            TitleFont.Name = 'Arial'
            TitleFont.Style = []
            OnDblClick = grdCursosDblClick
            Columns = <
              item
                Expanded = False
                FieldName = 'CD_CURSO'
                Title.Caption = 'C'#243'd.'
                Width = 48
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'DS_CURSO'
                Title.Caption = 'Curso'
                Width = 230
                Visible = True
              end>
          end
          object Panel33: TPanel
            Left = 0
            Top = 0
            Width = 296
            Height = 286
            Align = alTop
            TabOrder = 1
            object grdColigadas: TDBGrid
              Left = 1
              Top = 72
              Width = 294
              Height = 90
              Align = alClient
              BorderStyle = bsNone
              DataSource = dtcColigadas
              Options = [dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgAlwaysShowSelection, dgConfirmDelete, dgCancelOnExit]
              ReadOnly = True
              TabOrder = 0
              TitleFont.Charset = ANSI_CHARSET
              TitleFont.Color = clWindowText
              TitleFont.Height = -11
              TitleFont.Name = 'Arial'
              TitleFont.Style = []
              Columns = <
                item
                  Expanded = False
                  FieldName = 'nm_coligada'
                  Title.Caption = 'Todas as Unidades de Ensino'
                  Width = 273
                  Visible = True
                end>
            end
            object Panel10: TPanel
              Left = 1
              Top = 162
              Width = 294
              Height = 123
              Align = alBottom
              BevelOuter = bvNone
              TabOrder = 1
              object Label62: TLabel
                Left = 5
                Top = 7
                Width = 70
                Height = 14
                Caption = 'Departamento:'
              end
              object rgFiltroCursosMestres: TRadioGroup
                Left = 5
                Top = 48
                Width = 276
                Height = 41
                Caption = 'Filtro:'
                Columns = 3
                ItemIndex = 0
                Items.Strings = (
                  'Ativos'
                  'Inativos'
                  'Todos')
                TabOrder = 1
                OnClick = rgFiltroCursosMestresClick
              end
              object cbDepartamento: TUMComboBox
                Left = 5
                Top = 23
                Width = 276
                Height = 22
                Style = csDropDownList
                ItemHeight = 14
                TabOrder = 0
                OnChange = cbDepartamentoChange
                TamanhoMaximo = 0
                SelecionarUnicoAutomatico = False
              end
              object lbedPesquisaCurso: TLabeledEdit
                Left = 5
                Top = 95
                Width = 276
                Height = 22
                EditLabel.Width = 93
                EditLabel.Height = 14
                EditLabel.Caption = 'lbedPesquisaCurso'
                LabelPosition = lpLeft
                TabOrder = 2
                OnKeyPress = lbedPesquisaCursoKeyPress
              end
            end
            object Panel28: TPanel
              Left = 1
              Top = 1
              Width = 294
              Height = 22
              Align = alTop
              Alignment = taLeftJustify
              BevelOuter = bvNone
              Caption = '  UNIDADES DE ENSINO'
              Color = clBlue
              Font.Charset = ANSI_CHARSET
              Font.Color = clWhite
              Font.Height = -11
              Font.Name = 'Arial'
              Font.Style = [fsBold]
              ParentFont = False
              TabOrder = 2
            end
            object pnFiltroColigada: TPanel
              Left = 1
              Top = 23
              Width = 294
              Height = 49
              Align = alTop
              BevelOuter = bvNone
              TabOrder = 3
              object lbFiltroColigada: TLabel
                Left = 5
                Top = 2
                Width = 68
                Height = 14
                Caption = 'Filtro Unidade:'
              end
              object edFiltroUnidade: TEdit
                Left = 5
                Top = 22
                Width = 276
                Height = 22
                Align = alCustom
                TabOrder = 0
                OnKeyDown = edFiltroUnidadeKeyDown
              end
            end
          end
        end
        object paCabecalho: TPanel
          Left = 1
          Top = 1
          Width = 1254
          Height = 26
          Align = alTop
          BevelOuter = bvLowered
          Caption = 'CURSOS'
          Color = clBlue
          Font.Charset = ANSI_CHARSET
          Font.Color = clWhite
          Font.Height = -17
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          ParentFont = False
          TabOrder = 2
        end
      end
    end
    object tsTurmas: TTabSheet
      Caption = 'Turmas'
      object pnTurmas: TPanel
        Left = 0
        Top = 0
        Width = 1256
        Height = 682
        Align = alClient
        TabOrder = 0
        object Panel8: TPanel
          Left = 394
          Top = 27
          Width = 861
          Height = 654
          Align = alClient
          BevelOuter = bvNone
          Caption = 'Panel8'
          TabOrder = 0
          object grdTurmas: TDBGrid
            Left = 0
            Top = 0
            Width = 861
            Height = 654
            Align = alClient
            BorderStyle = bsNone
            DataSource = dtcTurmas
            Options = [dgTitles, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgAlwaysShowSelection, dgConfirmDelete, dgCancelOnExit]
            PopupMenu = pmQtdTurmas
            ReadOnly = True
            TabOrder = 0
            TitleFont.Charset = ANSI_CHARSET
            TitleFont.Color = clWindowText
            TitleFont.Height = -11
            TitleFont.Name = 'Arial'
            TitleFont.Style = []
            Columns = <
              item
                Expanded = False
                FieldName = 'AnoSemestre'
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'Codigo'
                Width = 162
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'Curso'
                Width = 80
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'descricao'
                Width = 180
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'descSituacao'
                Title.Caption = 'Situa'#231#227'o'
                Width = 138
                Visible = True
              end>
          end
        end
        object Panel13: TPanel
          Left = 1
          Top = 27
          Width = 393
          Height = 654
          Align = alLeft
          BevelOuter = bvNone
          TabOrder = 1
          object pgTurmas: TPageControl
            Left = 0
            Top = 462
            Width = 393
            Height = 192
            Hint = 'Op'#231#245'es da turma'
            ActivePage = TabSheet4
            Align = alBottom
            Style = tsFlatButtons
            TabOrder = 1
            OnChange = pgTurmasChange
            OnChanging = pgTurmasChanging
            object TabSheet4: TTabSheet
              Caption = 'Informa'#231#245'es da Grade'
              object lbTurmaEtapa: TLabel
                Left = 127
                Top = 3
                Width = 27
                Height = 14
                Caption = 'Etapa'
              end
              object Label26: TLabel
                Left = 230
                Top = 45
                Width = 138
                Height = 14
                Caption = 'N'#250'mero de Semanas Letivas'
                FocusControl = dbeDiasSemLetivos
              end
              object Label24: TLabel
                Left = 13
                Top = 45
                Width = 31
                Height = 14
                Caption = '&Vagas'
                FocusControl = dbeVagas
              end
              object Label17: TLabel
                Left = 221
                Top = 3
                Width = 28
                Height = 14
                Caption = 'T&urno'
              end
              object Label35: TLabel
                Left = 138
                Top = 85
                Width = 98
                Height = 14
                Caption = 'Forma de Avalia'#231#227'o:'
              end
              object Label52: TLabel
                Left = 12
                Top = 3
                Width = 55
                Height = 14
                Caption = 'C'#243'd. Grade'
              end
              object sbMaisInformacoes: TSpeedButton
                Left = 12
                Top = 128
                Width = 203
                Height = 25
                Caption = 'F10   Mais Informa'#231#245'es >>'
                Flat = True
                NumGlyphs = 2
                OnClick = sbMaisInformacoesClick
              end
              object Label28: TLabel
                Left = 10
                Top = 85
                Width = 103
                Height = 14
                Caption = 'Horas Aula/Semanais'
                FocusControl = DBEHorasAula
              end
              object Label67: TLabel
                Left = 88
                Top = 45
                Width = 89
                Height = 14
                Caption = 'Bloqueio de vagas'
              end
              object dbeDiasSemLetivos: TDBEdit
                Left = 230
                Top = 62
                Width = 142
                Height = 22
                Hint = 'N'#250'mero de semanas letivas da turma'
                CharCase = ecUpperCase
                DataField = 'DiasSemanaisLetivos'
                DataSource = dtcTurmas
                TabOrder = 6
                OnKeyPress = dbeDescricaoKeyPress
              end
              object dbeVagas: TDBEdit
                Left = 11
                Top = 62
                Width = 67
                Height = 22
                Hint = 'Quantidade de vagas'
                CharCase = ecUpperCase
                DataField = 'Vagas'
                DataSource = dtcTurmas
                TabOrder = 4
                OnKeyPress = dbeDescricaoKeyPress
              end
              object cmbTurnosTurmas: TDBLookupComboBox
                Left = 221
                Top = 20
                Width = 153
                Height = 22
                Hint = 'Turno da turma'
                DataField = 'Turno'
                DataSource = dtcTurmas
                KeyField = 'Codigo'
                ListField = 'Descricao'
                ListSource = dtcTurnos
                TabOrder = 3
                OnKeyPress = dbeDescricaoKeyPress
              end
              object DBLookupComboBox5: TDBLookupComboBox
                Left = 12
                Top = 20
                Width = 82
                Height = 22
                DataField = 'cd_grade_lk'
                DataSource = dtcTurmas
                TabOrder = 0
              end
              object btnMostrarGradeTurma: TButton
                Left = 94
                Top = 18
                Width = 26
                Height = 23
                Caption = '...'
                Font.Charset = ANSI_CHARSET
                Font.Color = clWindowText
                Font.Height = -17
                Font.Name = 'Arial'
                Font.Style = [fsBold]
                ParentFont = False
                TabOrder = 1
                OnClick = btnMostrarGradeTurmaClick
              end
              object cbFormaAvaliacao: TUMLookupComboBox
                AlignWithMargins = True
                Left = 139
                Top = 101
                Width = 206
                Height = 22
                DataField = 'cd_avaliacao_lk'
                DataSource = dtcTurmas
                DropDownRows = 4
                TabOrder = 8
              end
              object cbNrEtapas: TUMComboBox
                Left = 126
                Top = 20
                Width = 89
                Height = 22
                Hint = 'N'#250'mero seq'#252'encial da etapa'
                Style = csDropDownList
                ItemHeight = 14
                TabOrder = 2
                OnChange = cbNrEtapasChange
                TamanhoMaximo = 0
                SelecionarUnicoAutomatico = False
              end
              object btnMostrarParametroAvaliacao: TButton
                Left = 346
                Top = 99
                Width = 26
                Height = 23
                Caption = '...'
                Font.Charset = ANSI_CHARSET
                Font.Color = clWindowText
                Font.Height = -17
                Font.Name = 'Arial'
                Font.Style = [fsBold]
                ParentFont = False
                TabOrder = 9
                OnClick = btnMostrarParametroAvaliacaoClick
              end
              object DBEHorasAula: TDBEdit
                Left = 9
                Top = 102
                Width = 123
                Height = 22
                Hint = 'Quantidade de horas aulas semanais'
                CharCase = ecUpperCase
                DataField = 'HorasAula'
                DataSource = dtcTurmas
                TabOrder = 7
                OnKeyPress = DBEHorasAulaKeyPress
              end
              object cbBloqueioVagas: TUMComboBox
                Left = 87
                Top = 62
                Width = 137
                Height = 22
                Hint = 'Bloqueio de Vagas'
                Style = csDropDownList
                ItemHeight = 14
                TabOrder = 5
                OnChange = cbBloqueioVagasChange
                Items.Strings = (
                  'N'#227'o bloquear'
                  'Por turma'
                  'Por disciplina')
                TamanhoMaximo = 0
                SelecionarUnicoAutomatico = False
              end
            end
            object TabSheet5: TTabSheet
              Caption = 'Agenda / Local'
              ImageIndex = 1
              object Label18: TLabel
                Left = 3
                Top = 38
                Width = 53
                Height = 14
                Caption = '&Hora Inicio:'
                FocusControl = dbeHoraInicio
              end
              object Label19: TLabel
                Left = 123
                Top = 38
                Width = 45
                Height = 14
                Caption = 'Ho&ra Fim:'
                FocusControl = dbeHoraFim
              end
              object Label23: TLabel
                Left = 243
                Top = 79
                Width = 79
                Height = 14
                Caption = 'Data Co&nclus'#227'o:'
                FocusControl = dbeDataConclusao
              end
              object Label21: TLabel
                Left = 123
                Top = -2
                Width = 100
                Height = 14
                Caption = 'Data &Fim Acad'#234'mico:'
                FocusControl = dbeDataFim
              end
              object Label20: TLabel
                Left = 3
                Top = -2
                Width = 108
                Height = 14
                Caption = 'Data I&n'#237'cio Acad'#234'mico:'
                FocusControl = dbeDatainicio
              end
              object Label61: TLabel
                Left = 243
                Top = -2
                Width = 89
                Height = 14
                Caption = 'Sala - Localiza'#231#227'o'
              end
              object Label6: TLabel
                Left = 3
                Top = 79
                Width = 109
                Height = 14
                Caption = 'Data In'#237'cio Monografia:'
                FocusControl = dbedt_inicio_monografia
              end
              object Label25: TLabel
                Left = 123
                Top = 79
                Width = 101
                Height = 14
                Caption = 'Data Fim Monografia:'
                FocusControl = dbedt_fim_monografia
              end
              object Label64: TLabel
                Left = 3
                Top = 120
                Width = 105
                Height = 14
                Caption = 'Data I&n'#237'cio Financeiro:'
                FocusControl = dbeDatainicio
              end
              object Label65: TLabel
                Left = 123
                Top = 120
                Width = 97
                Height = 14
                Caption = 'Data &Fim Financeiro:'
                FocusControl = dbeDataFim
              end
              object sbBuscaSala: TSpeedButton
                Left = 360
                Top = 15
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
                OnClick = sbBuscaSalaClick
              end
              object dbeHoraInicio: TDBEdit
                Left = 3
                Top = 55
                Width = 110
                Height = 22
                Hint = 'Hor'#225'rio de in'#237'cio'
                CharCase = ecUpperCase
                DataField = 'HoraInicio'
                DataSource = dtcTurmas
                TabOrder = 3
                OnKeyPress = dbeDescricaoKeyPress
              end
              object dbeHoraFim: TDBEdit
                Left = 123
                Top = 55
                Width = 111
                Height = 22
                Hint = 'Hor'#225'rio de fim'
                CharCase = ecUpperCase
                DataField = 'HoraFim'
                DataSource = dtcTurmas
                TabOrder = 4
                OnKeyPress = dbeHoraFimKeyPress
              end
              object dbeDataConclusao: TDBEdit
                Left = 239
                Top = 95
                Width = 110
                Height = 22
                Hint = 'Data de conclus'#227'o (para diploma)'
                CharCase = ecUpperCase
                DataField = 'DataConclusao'
                DataSource = dtcTurmas
                TabOrder = 8
                OnKeyPress = dbeDescricaoKeyPress
              end
              object dbeDataFim: TDBEdit
                Left = 123
                Top = 15
                Width = 110
                Height = 22
                Hint = 'Data de t'#233'rmino da turma'
                CharCase = ecUpperCase
                DataField = 'DataFim'
                DataSource = dtcTurmas
                TabOrder = 1
                OnExit = dbeDataFimExit
                OnKeyPress = dbeDescricaoKeyPress
              end
              object dbeDatainicio: TDBEdit
                Left = 3
                Top = 15
                Width = 110
                Height = 22
                Hint = 'Data de in'#237'cio da turma'
                CharCase = ecUpperCase
                DataField = 'DataInicio'
                DataSource = dtcTurmas
                TabOrder = 0
                OnKeyPress = dbeDescricaoKeyPress
              end
              object dbedt_inicio_monografia: TDBEdit
                Left = 3
                Top = 95
                Width = 110
                Height = 22
                Hint = 'Data de in'#237'cio da monografia'
                CharCase = ecUpperCase
                DataField = 'dt_inicio_monografia'
                DataSource = dtcTurmas
                TabOrder = 6
                OnKeyPress = dbeDescricaoKeyPress
              end
              object dbedt_fim_monografia: TDBEdit
                Left = 123
                Top = 95
                Width = 110
                Height = 22
                Hint = 'Data de t'#233'rmino da monografia'
                CharCase = ecUpperCase
                DataField = 'dt_fim_monografia'
                DataSource = dtcTurmas
                TabOrder = 7
                OnKeyPress = dbeDescricaoKeyPress
              end
              object dbeDatainicioFinanceiro: TDBEdit
                Left = 3
                Top = 136
                Width = 109
                Height = 22
                Hint = 'Data de in'#237'cio do Financeiro da turma'
                CharCase = ecUpperCase
                DataField = 'dt_inicio_financeiro'
                DataSource = dtcTurmas
                TabOrder = 9
              end
              object dbeDataFimFinanceiro: TDBEdit
                Left = 123
                Top = 136
                Width = 110
                Height = 22
                Hint = 'Data de t'#233'rmino do Financeiro da turma'
                CharCase = ecUpperCase
                DataField = 'dt_fim_financeiro'
                DataSource = dtcTurmas
                TabOrder = 10
              end
              object dbchDataInicioFimCronograma: TDBCheckBox
                Left = 243
                Top = 49
                Width = 116
                Height = 26
                Caption = 'Data definida pelo cronograma'
                DataField = 'sn_cronograma_geren_inicio_fim'
                DataSource = dtcTurmas
                TabOrder = 5
                ValueChecked = '1'
                ValueUnchecked = '0'
                WordWrap = True
                OnClick = dbchDataInicioFimCronogramaClick
              end
              object dblcSalas: TDBLookupComboBox
                Left = 243
                Top = 15
                Width = 116
                Height = 22
                DataField = 'DS_UNI_SALA'
                DataSource = dtcTurmas
                TabOrder = 2
              end
            end
            object TabSheet6: TTabSheet
              Caption = 'Observa'#231#245'es'
              ImageIndex = 2
              object ScrollBox4: TScrollBox
                Left = 0
                Top = 0
                Width = 385
                Height = 160
                Align = alClient
                TabOrder = 0
                object laHistturma: TLabel
                  Left = 11
                  Top = 1
                  Width = 126
                  Height = 14
                  Caption = 'Observa'#231#245'es de Hist'#243'rico'
                  FocusControl = mmHistTurma
                end
                object Label48: TLabel
                  Left = 12
                  Top = 119
                  Width = 125
                  Height = 14
                  Caption = 'Observa'#231#245'es de Contrato'
                  FocusControl = mmContratoTurma
                end
                object Label56: TLabel
                  Left = 11
                  Top = 237
                  Width = 149
                  Height = 14
                  Caption = 'Observa'#231#245'es Gerais da Turma'
                  FocusControl = mmGeraisTurma
                end
                object mmHistTurma: TDBMemo
                  Left = 11
                  Top = 18
                  Width = 349
                  Height = 95
                  DataField = 'ObsHistorico'
                  DataSource = dtcTurmas
                  ScrollBars = ssVertical
                  TabOrder = 0
                end
                object mmContratoTurma: TDBMemo
                  Left = 11
                  Top = 136
                  Width = 349
                  Height = 95
                  DataField = 'obscontrato'
                  DataSource = dtcTurmas
                  ScrollBars = ssVertical
                  TabOrder = 1
                end
                object mmGeraisTurma: TDBMemo
                  Left = 11
                  Top = 254
                  Width = 349
                  Height = 95
                  DataField = 'obsgerais'
                  DataSource = dtcTurmas
                  ScrollBars = ssVertical
                  TabOrder = 2
                end
              end
            end
            object tsFinanceiro: TTabSheet
              Caption = 'Financeiro'
              ImageIndex = 3
              object pnTurmasFinanceiro: TPanel
                Left = 0
                Top = 0
                Width = 385
                Height = 160
                Align = alClient
                TabOrder = 0
                Visible = False
                object sbLimparConta: TSpeedButton
                  Left = 341
                  Top = 66
                  Width = 23
                  Height = 22
                  Flat = True
                  Glyph.Data = {
                    76010000424D7601000000000000760000002800000020000000100000000100
                    04000000000000010000120B0000120B00001000000000000000000000000000
                    800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
                    FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00555555555555
                    55555FFFFFFF5F55FFF5777777757559995777777775755777F7555555555550
                    305555555555FF57F7F555555550055BB0555555555775F777F55555550FB000
                    005555555575577777F5555550FB0BF0F05555555755755757F555550FBFBF0F
                    B05555557F55557557F555550BFBF0FB005555557F55575577F555500FBFBFB0
                    B05555577F555557F7F5550E0BFBFB00B055557575F55577F7F550EEE0BFB0B0
                    B05557FF575F5757F7F5000EEE0BFBF0B055777FF575FFF7F7F50000EEE00000
                    B0557777FF577777F7F500000E055550805577777F7555575755500000555555
                    05555777775555557F5555000555555505555577755555557555}
                  NumGlyphs = 2
                  OnClick = sbLimparContaClick
                end
                object Label42: TLabel
                  Left = 12
                  Top = 31
                  Width = 267
                  Height = 28
                  Caption = 
                    'Selecione a conta para emiss'#227'o de boletos.  Deixe em branco para' +
                    ' assumir a conta definida no departamento.'
                  FocusControl = DBLookupComboBox10
                  WordWrap = True
                end
                object Label63: TLabel
                  Left = 12
                  Top = 111
                  Width = 137
                  Height = 14
                  Caption = 'Plano de Pagamento Padr'#227'o:'
                end
                object DBLookupComboBox10: TDBLookupComboBox
                  Left = 12
                  Top = 67
                  Width = 325
                  Height = 22
                  DataField = 'descCaixa'
                  DataSource = dtcTurmas
                  NullValueKey = 46
                  TabOrder = 1
                end
                object DBCheckBox2: TDBCheckBox
                  Left = 12
                  Top = 6
                  Width = 353
                  Height = 17
                  Hint = 'Faz com que a turma fique como ativa.'
                  Caption = 'Esta turma utiliza Plano de Pagamento'
                  DataField = 'sn_usar_plano'
                  DataSource = dtcTurmas
                  TabOrder = 0
                  ValueChecked = '1'
                  ValueUnchecked = '0'
                end
                object DBLookupComboBox4: TDBLookupComboBox
                  Left = 12
                  Top = 131
                  Width = 326
                  Height = 22
                  DataField = 'descPlanoPadrao'
                  DataSource = dtcTurmas
                  TabOrder = 3
                end
                object DBCheckBox5: TDBCheckBox
                  Left = 12
                  Top = 93
                  Width = 148
                  Height = 17
                  Caption = 'A conta pode ser alterada'
                  DataField = 'sn_alterar_boleto'
                  DataSource = dtcTurmas
                  TabOrder = 2
                  ValueChecked = '1'
                  ValueUnchecked = '0'
                end
              end
            end
            object TabSheet10: TTabSheet
              Caption = 'Rematr'#237'cula'
              ImageIndex = 4
              object sbBuscaProxTurmaOutroCurso: TSpeedButton
                Left = 304
                Top = 129
                Width = 22
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
                OnClick = sbBuscaProxTurmaOutroCursoClick
              end
              object sbLimpaProxTurmaOutroCurso: TSpeedButton
                Left = 329
                Top = 129
                Width = 22
                Height = 21
                AllowAllUp = True
                Flat = True
                Glyph.Data = {
                  46030000424D46030000000000003600000028000000120000000E0000000100
                  18000000000010030000C40E0000C40E00000000000000000000FFFFFFFFFFFF
                  FFFFFFFDFDFCCCCCD36C6D9D95959FE5E6E2FFFFFFFFFFFFFFFFFFFFFFFFFFFF
                  FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF0000FFFFFFFEFEFED0D0CA5A5A7F3130
                  D43736ED2C2BD32B2B91868691CFD0CAF9FAF9FFFFFFFFFFFFFFFFFFFFFFFFFF
                  FFFFFFFFFFFFFFFF0000FDFDFC9090A42423A93836F34544FF3A39E33A39E344
                  43FF302EDE24239A3434419E9E9DF8F8F8FFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
                  000081819F2D2CDF4544FF4342FF4241FF4543FF1F1E803635D24746FF4746FF
                  19188454544A6F7072BBBBBBFBFCFBFFFFFFFFFFFFFFFFFF00007070A63E3DFF
                  4241FF4342FF4342FF3635D82D2CB71D1D7A2B2AAA4342FB3D3CFF36366CEBEC
                  E2A1A1A3616066C8C9C9FEFEFEFFFFFF0000C9CACB3C3BD54342FF3A39E02D2C
                  B73737DA4544FF4342FE2A29A81A1A6E2E2DB22B2BC3B5B5C4FFFFFFEBEAEC8A
                  8A8E88888AF4F5F50000FFFFFE8080BB2928D22F2EC94241FD4442FF4241FF42
                  41FF4544FF4241FC302FBA11116B35354BFFFFFEFFFFFFFFFFFFD5D5D7A4A4A7
                  0000FFFFFFF2F2F29191B45352D43C3BF83F3EFF4241FF4241FF4443FF4342FF
                  3433F124249B83838DE8E8E6B1B1B4E5E5E6FFFFFF9595980000FFFFFFFFFFFF
                  FFFFFFF6F6F5C1C1CF6A69BE4140E73C3BF92929C02A2A7B81809ADCDCD2FFFF
                  FFFDFDFDD1D1D39898998B8B8D86868A0000FFFFFFFFFFFFFFFFFFFFFFFFFFFF
                  FFFDFDFDD9D9DC9797AB989897E4E4DAFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFA
                  FAFA87888CCBCACC0000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
                  FFFFF2F2F2D1D1D3C8C8C9DDDDDEF5F5F5D9D9DAAAAAADC2C1C4F9F9FAFFFFFF
                  0000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
                  F2F2F2D6D6D7AFAFB2C3C3C5EAEAEAFFFFFFFFFFFFFFFFFF0000FFFFFFFFFFFF
                  FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
                  FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF0000FFFFFFFFFFFFFFFFFFFFFFFFFFFF
                  FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
                  FFFFFFFFFFFFFFFF0000}
                OnClick = sbLimpaProxTurmaOutroCursoClick
              end
              object LabelProxTurmaMesmoCurso: TLabel
                Left = 11
                Top = 69
                Width = 154
                Height = 14
                Caption = 'Pr'#243'xima turma no mesmo curso:'
              end
              object Label55: TLabel
                Left = 11
                Top = 113
                Width = 145
                Height = 14
                Caption = 'Pr'#243'xima turma de outro curso:'
              end
              object dbcbProximaTurma: TDBLookupComboBox
                Left = 11
                Top = 85
                Width = 290
                Height = 22
                DataField = 'cd_proxima_turma_lk'
                DataSource = dtcTurmas
                TabOrder = 1
              end
              object dbeProxCurso: TDBEdit
                Left = 11
                Top = 129
                Width = 95
                Height = 22
                DataField = 'cd_proximo_curso'
                DataSource = dtcTurmas
                ReadOnly = True
                TabOrder = 2
              end
              object dbeProxTurmaOutroCurso: TDBEdit
                Left = 112
                Top = 129
                Width = 189
                Height = 22
                DataField = 'cd_proxima_turma'
                DataSource = dtcTurmas
                ReadOnly = True
                TabOrder = 3
              end
              object dbrgProxTurma: TDBRadioGroup
                Left = 12
                Top = 0
                Width = 290
                Height = 63
                Caption = 'Tipo pr'#243'xima turma: '
                DataField = 'sn_proximo_curso'
                DataSource = dtcTurmas
                Items.Strings = (
                  'Pr'#243'xima turma pertence ao mesmo curso'
                  'Pr'#243'xima turma pertence a outro curso')
                ParentBackground = True
                TabOrder = 0
                Values.Strings = (
                  '0'
                  '1')
                OnChange = dbrgProxTurmaChange
              end
            end
            object tsConvenios: TTabSheet
              Caption = 'Conv'#234'nios'
              ImageIndex = 5
              object TDBGTurmasConvenios: TDBGrid
                Left = 13
                Top = 3
                Width = 341
                Height = 94
                DataSource = dsTurmasConvenios
                TabOrder = 0
                TitleFont.Charset = ANSI_CHARSET
                TitleFont.Color = clWindowText
                TitleFont.Height = -11
                TitleFont.Name = 'Arial'
                TitleFont.Style = []
                OnDragDrop = TDBGTurmasConveniosDragDrop
                OnDragOver = TDBGTurmasConveniosDragOver
                OnKeyDown = TDBGTurmasConveniosKeyDown
                Columns = <
                  item
                    Expanded = False
                    FieldName = 'nm_instituicao'
                    Title.Caption = 'Conveniado'
                    Visible = True
                  end>
              end
              object TBConveniosIncluir: TButton
                Left = 12
                Top = 95
                Width = 137
                Height = 25
                Caption = 'Incluir Conv'#234'nio'
                TabOrder = 1
                OnClick = TBConveniosIncluirClick
              end
              object btExcluir: TButton
                Left = 155
                Top = 95
                Width = 137
                Height = 25
                Caption = 'Excluir Conv'#234'nio'
                TabOrder = 2
                OnClick = btExcluirClick
              end
            end
            object Optativas: TTabSheet
              Caption = 'Optativas'
              ImageIndex = 6
              object TDBGTurmasDisciplinasOptativas: TDBGrid
                Left = 13
                Top = 3
                Width = 341
                Height = 130
                DataSource = dsTurmasDiscilinasOptativas
                TabOrder = 0
                TitleFont.Charset = ANSI_CHARSET
                TitleFont.Color = clWindowText
                TitleFont.Height = -11
                TitleFont.Name = 'Arial'
                TitleFont.Style = []
                OnDragDrop = TDBGTurmasDisciplinasOptativasDragDrop
                OnDragOver = TDBGTurmasDisciplinasOptativasDragOver
                OnKeyDown = TDBGTurmasDisciplinasOptativasKeyDown
                Columns = <
                  item
                    Expanded = False
                    FieldName = 'descricao_optativa'
                    Title.Caption = 'Disciplina Optativa'
                    Width = 100
                    Visible = True
                  end
                  item
                    Expanded = False
                    FieldName = 'descricao_generica'
                    Title.Caption = 'Disciplina Gen'#233'rica'
                    Width = 100
                    Visible = True
                  end>
              end
              object btIncluirOptativa: TButton
                Left = 12
                Top = 135
                Width = 137
                Height = 25
                Caption = 'Incluir Optativa'
                TabOrder = 1
                OnClick = btIncluirOptativaClick
              end
              object Button2: TButton
                Left = 155
                Top = 135
                Width = 137
                Height = 25
                Caption = 'Remover Optativa'
                TabOrder = 2
                OnClick = Button2Click
              end
            end
          end
          object Panel23: TPanel
            Left = 0
            Top = 0
            Width = 393
            Height = 462
            Align = alClient
            BevelOuter = bvNone
            TabOrder = 0
            object ScrollBox1: TScrollBox
              Left = 0
              Top = 143
              Width = 393
              Height = 316
              HorzScrollBar.Visible = False
              Align = alClient
              BevelInner = bvNone
              BevelOuter = bvNone
              BorderStyle = bsNone
              TabOrder = 2
              object Label39: TLabel
                Left = 16
                Top = -3
                Width = 100
                Height = 14
                Caption = 'Descri'#231#227'o da Turma:'
              end
              object LabelunidadeCertificadora: TLabel
                Left = 17
                Top = 111
                Width = 107
                Height = 14
                Caption = 'Unidade Certificadora:'
              end
              object lblSituacao: TLabel
                Left = 16
                Top = 147
                Width = 42
                Height = 14
                Caption = 'Situa'#231#227'o'
              end
              object sbLimpa: TSpeedButton
                Left = 164
                Top = 163
                Width = 23
                Height = 22
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
                OnClick = sbLimpaClick
              end
              object dbeDescricaoTurma: TDBEdit
                Left = 15
                Top = 14
                Width = 354
                Height = 22
                Hint = 'Descri'#231#227'o da turma'
                DataField = 'Descricao'
                DataSource = dtcTurmas
                TabOrder = 0
                OnKeyPress = dbeDescricaoKeyPress
              end
              object DBCheckBox3: TDBCheckBox
                Left = 16
                Top = 193
                Width = 289
                Height = 17
                Caption = 'Esta turma utiliza o Terminal de Acesso'
                DataField = 'sn_terminal_acesso'
                DataSource = dtcTurmas
                TabOrder = 4
                ValueChecked = '1'
                ValueUnchecked = '0'
              end
              object DBCheckBox4: TDBCheckBox
                Left = 16
                Top = 212
                Width = 353
                Height = 17
                Hint = 
                  'Se habilitar, o estudante deve ter aproveitamento em todas as di' +
                  'sciplinas de turmas anteriores.'
                Caption = 'Bloquear matr'#237'cula quando houver disciplinas pendentes.'
                DataField = 'sn_bloquear_disc_pendentes'
                DataSource = dtcTurmas
                TabOrder = 5
                ValueChecked = '1'
                ValueUnchecked = '0'
              end
              object DBLCunidadeCertificadora: TDBLookupComboBox
                Left = 16
                Top = 126
                Width = 353
                Height = 22
                DataField = 'cd_unidade_certificadora'
                DataSource = dtcTurmas
                KeyField = 'cd_instituicao'
                ListField = 'nm_instituicao'
                ListSource = dsUnidadesCertificadoras
                TabOrder = 2
              end
              object dbchTurmaEspecial: TDBCheckBox
                Left = 16
                Top = 234
                Width = 353
                Height = 17
                Hint = 
                  'Faz com que a turma n'#227'o seja considerada nos resultados da avali' +
                  'a'#231#227'o institucional.'
                Caption = 'Esta turma '#233' especial'
                DataField = 'sn_turma_especial'
                DataSource = dtcTurmas
                TabOrder = 6
                ValueChecked = '1'
                ValueUnchecked = '0'
              end
              object DBCheckBox7: TDBCheckBox
                Left = 16
                Top = 255
                Width = 353
                Height = 17
                Hint = 'Faz com que a turma fique como ativa.'
                Caption = 'Esta turma '#233' ativa'
                DataField = 'SN_ATIVA'
                DataSource = dtcTurmas
                TabOrder = 7
                ValueChecked = '1'
                ValueUnchecked = '0'
              end
              object dblSituacao: TDBLookupComboBox
                Left = 16
                Top = 164
                Width = 145
                Height = 22
                DataField = 'cd_situacao'
                DataSource = dtcTurmas
                KeyField = 'cd_situacao'
                ListField = 'ds_valor'
                ListSource = dsSituacoes
                TabOrder = 3
              end
              object pcProfessoresResponsaveis: TPageControl
                Left = 13
                Top = 42
                Width = 360
                Height = 72
                ActivePage = ts1ProfessorResponsavel
                Style = tsFlatButtons
                TabOrder = 1
                object ts1ProfessorResponsavel: TTabSheet
                  Caption = '1'#186' Respons'#225'vel'
                  object Label54: TLabel
                    Left = 1
                    Top = -2
                    Width = 80
                    Height = 14
                    Caption = '1'#186' Respons'#225'vel:'
                    FocusControl = DBLookupComboBox2
                  end
                  object DBLookupComboBox2: TDBLookupComboBox
                    Left = 0
                    Top = 14
                    Width = 353
                    Height = 22
                    Hint = '1'#186' Respons'#225'vel pela turma'
                    DataField = 'descProfessor'
                    DataSource = dtcTurmas
                    TabOrder = 0
                  end
                end
                object ts2ProfessorResponsavel: TTabSheet
                  Caption = '2'#186' Respons'#225'vel'
                  ImageIndex = 1
                  object Label41: TLabel
                    Left = 2
                    Top = -2
                    Width = 80
                    Height = 14
                    Caption = '2'#186' Respons'#225'vel:'
                    FocusControl = DBLookupComboBox3
                  end
                  object DBLookupComboBox3: TDBLookupComboBox
                    Left = 0
                    Top = 14
                    Width = 353
                    Height = 22
                    Hint = '2'#186' Respons'#225'vel pela turma'
                    DataField = 'descProfessor2'
                    DataSource = dtcTurmas
                    TabOrder = 0
                  end
                end
              end
              object dbcbExportaTurmaMOODLE: TDBCheckBox
                Left = 16
                Top = 276
                Width = 353
                Height = 17
                Hint = 'Define se a turma deve ser exportada para o MOODLE.'
                Caption = 'Exportar turma para o MOODLE'
                DataField = 'sn_exporta_moodle'
                DataSource = dtcTurmas
                TabOrder = 8
                ValueChecked = '1'
                ValueUnchecked = '0'
              end
            end
            object Panel25: TPanel
              Left = 0
              Top = 93
              Width = 393
              Height = 50
              Align = alTop
              BevelOuter = bvNone
              TabOrder = 1
              object Bevel2: TBevel
                Left = 261
                Top = 18
                Width = 129
                Height = 32
              end
              object btnCopiarTurma: TSpeedButton
                Left = 266
                Top = 18
                Width = 121
                Height = 26
                Caption = 'F11 Copiar Turma'
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
                OnClick = btnCopiarTurmaClick
              end
              object Label11: TLabel
                Left = 16
                Top = 3
                Width = 38
                Height = 14
                Caption = '&Turma:'
                FocusControl = dbeTurma
                Font.Charset = ANSI_CHARSET
                Font.Color = clWindowText
                Font.Height = -11
                Font.Name = 'Arial'
                Font.Style = [fsBold]
                ParentFont = False
              end
              object Label53: TLabel
                Left = 179
                Top = 3
                Width = 62
                Height = 14
                Caption = 'Etapa (MEC):'
              end
              object dbeTurma: TDBEdit
                Left = 16
                Top = 23
                Width = 119
                Height = 22
                Hint = 'C'#243'digo da turma'
                CharCase = ecUpperCase
                DataField = 'Codigo'
                DataSource = dtcTurmas
                Enabled = False
                TabOrder = 0
                OnChange = dbeTurmaChange
                OnKeyDown = dbeTurmaKeyDown
                OnKeyPress = dbeDescricaoKeyPress
              end
              object btnRenomearTurma: TButton
                Left = 141
                Top = 24
                Width = 23
                Height = 20
                Caption = '...'
                Font.Charset = ANSI_CHARSET
                Font.Color = clWindowText
                Font.Height = -17
                Font.Name = 'Arial'
                Font.Style = [fsBold]
                ParentFont = False
                TabOrder = 1
                OnClick = btnRenomearTurmaClick
              end
              object DBEdit12: TDBEdit
                Left = 179
                Top = 24
                Width = 66
                Height = 22
                Hint = 'C'#243'digo da Etapa no MEC'
                CharCase = ecUpperCase
                DataField = 'cd_etapa_mec'
                DataSource = dtcTurmas
                TabOrder = 2
                OnKeyPress = dbeDescricaoKeyPress
              end
            end
            object Panel11: TPanel
              Left = 0
              Top = 0
              Width = 393
              Height = 86
              Align = alTop
              BevelOuter = bvNone
              TabOrder = 0
              object UMFiltroDataAnoSem: TUMFiltroDataAnoSem
                Left = 0
                Top = 0
                Width = 393
                Height = 86
                Align = alClient
                BevelOuter = bvNone
                TabOrder = 0
                UsaAnoSemestre = True
                PanelComAnosemestre = UMSubPanelComAnosemestre.Owner
                PanelSemAnosemestre = UMSubPanelSemAnosemestre.Owner
                FiltroAnosemestreMaskEdit.Left = 86
                FiltroAnosemestreMaskEdit.Top = 2
                FiltroAnosemestreMaskEdit.Width = 70
                FiltroAnosemestreMaskEdit.Height = 22
                FiltroAnosemestreMaskEdit.EditMask = '9999/9;0;_'
                FiltroAnosemestreMaskEdit.MaxLength = 6
                FiltroAnosemestreMaskEdit.TabOrder = 0
                FiltroAnosemestreMaskEdit.Text = '0'
                FiltroAnosemestreMaskEdit.OnChange = UMFiltroDataAnoSemUMSubMaskEditmeAnoSemestreChange
                FiltroAnosemestreLabel.Left = 2
                FiltroAnosemestreLabel.Top = 4
                FiltroAnosemestreLabel.Width = 72
                FiltroAnosemestreLabel.Height = 14
                FiltroAnosemestreLabel.Caption = 'Ano/Semestre:'
                FiltroAnosemestreUpDown.Left = 156
                FiltroAnosemestreUpDown.Top = 2
                FiltroAnosemestreUpDown.Width = 17
                FiltroAnosemestreUpDown.Height = 22
                FiltroAnosemestreUpDown.Associate.Left = 86
                FiltroAnosemestreUpDown.Associate.Top = 2
                FiltroAnosemestreUpDown.Associate.Width = 70
                FiltroAnosemestreUpDown.Associate.Height = 22
                FiltroAnosemestreUpDown.Associate.EditMask = '9999/9;0;_'
                FiltroAnosemestreUpDown.Associate.MaxLength = 6
                FiltroAnosemestreUpDown.Associate.TabOrder = 0
                FiltroAnosemestreUpDown.Associate.Text = '0'
                FiltroAnosemestreUpDown.Associate.OnChange = UMFiltroDataAnoSemUMSubMaskEditmeAnoSemestreChange
                FiltroAnosemestreUpDown.Max = 30000
                FiltroAnosemestreUpDown.Increment = 10
                FiltroAnosemestreUpDown.Position = 0
                FiltroAnosemestreUpDown.TabOrder = 1
                FiltroDataCheckBoxTurmaAtiva.Left = 10
                FiltroDataCheckBoxTurmaAtiva.Top = 3
                FiltroDataCheckBoxTurmaAtiva.Width = 97
                FiltroDataCheckBoxTurmaAtiva.Height = 17
                FiltroDataCheckBoxTurmaAtiva.Caption = 'Turmas ativas'
                FiltroDataCheckBoxTurmaAtiva.Checked = True
                FiltroDataCheckBoxTurmaAtiva.State = cbChecked
                FiltroDataCheckBoxTurmaAtiva.TabOrder = 0
                FiltroDataCheckBoxTurmaAtiva.OnClick = UMFiltroDataAnoSemUMSubCheckBoxckTurmaAtivaClick
                FiltroDataLabelDataInicio.Left = 110
                FiltroDataLabelDataInicio.Top = 4
                FiltroDataLabelDataInicio.Width = 27
                FiltroDataLabelDataInicio.Height = 14
                FiltroDataLabelDataInicio.Caption = 'In'#237'cio:'
                FiltroDataLabelDataFim.Left = 250
                FiltroDataLabelDataFim.Top = 4
                FiltroDataLabelDataFim.Width = 19
                FiltroDataLabelDataFim.Height = 14
                FiltroDataLabelDataFim.Caption = 'Fim:'
                FiltroDataDateTimePickerDataInicio.Left = 143
                FiltroDataDateTimePickerDataInicio.Top = 1
                FiltroDataDateTimePickerDataInicio.Width = 81
                FiltroDataDateTimePickerDataInicio.Height = 22
                FiltroDataDateTimePickerDataInicio.Date = 40626.720425601850000000
                FiltroDataDateTimePickerDataInicio.Time = 40626.720425601850000000
                FiltroDataDateTimePickerDataInicio.TabOrder = 3
                FiltroDataDateTimePickerDataInicio.OnChange = UMFiltroDataAnoSemUMSubDateTimePickerdtpDataInicioChange
                FiltroDataDateTimePickerDataFim.Left = 276
                FiltroDataDateTimePickerDataFim.Top = 1
                FiltroDataDateTimePickerDataFim.Width = 81
                FiltroDataDateTimePickerDataFim.Height = 22
                FiltroDataDateTimePickerDataFim.Date = 40626.720425601850000000
                FiltroDataDateTimePickerDataFim.Time = 40626.720425601850000000
                FiltroDataDateTimePickerDataFim.TabOrder = 4
                FiltroDataDateTimePickerDataFim.OnChange = UMFiltroDataAnoSemUMSubDateTimePickerdtpDataFimChange
                FiltroDataCheckBoxDataInicio.Left = 226
                FiltroDataCheckBoxDataInicio.Top = 3
                FiltroDataCheckBoxDataInicio.Width = 14
                FiltroDataCheckBoxDataInicio.Height = 17
                FiltroDataCheckBoxDataInicio.Checked = True
                FiltroDataCheckBoxDataInicio.State = cbChecked
                FiltroDataCheckBoxDataInicio.TabOrder = 1
                FiltroDataCheckBoxDataInicio.OnClick = UMFiltroDataAnoSemUMSubCheckBoxckDataInicioClick
                FiltroDataCheckBoxDataFim.Left = 360
                FiltroDataCheckBoxDataFim.Top = 3
                FiltroDataCheckBoxDataFim.Width = 14
                FiltroDataCheckBoxDataFim.Height = 17
                FiltroDataCheckBoxDataFim.Checked = True
                FiltroDataCheckBoxDataFim.State = cbChecked
                FiltroDataCheckBoxDataFim.TabOrder = 2
                FiltroDataCheckBoxDataFim.OnClick = UMFiltroDataAnoSemUMSubCheckBoxckDataFimClick
                OnChangeAnoSemestre = UMFiltroDataAnoSemChangeAnoSemestre
                object Label31: TLabel
                  Left = 13
                  Top = 27
                  Width = 42
                  Height = 14
                  Caption = 'Unidade:'
                end
                object lbColigada: TLabel
                  Left = 89
                  Top = 26
                  Width = 49
                  Height = 15
                  Caption = 'Coligada'
                  Font.Charset = ANSI_CHARSET
                  Font.Color = clWindowText
                  Font.Height = -12
                  Font.Name = 'Arial'
                  Font.Style = [fsBold]
                  ParentFont = False
                end
                object Label32: TLabel
                  Left = 13
                  Top = 49
                  Width = 70
                  Height = 14
                  Caption = 'Departamento:'
                end
                object lbDepartamento: TLabel
                  Left = 89
                  Top = 49
                  Width = 81
                  Height = 15
                  Caption = 'Departamento'
                  Font.Charset = ANSI_CHARSET
                  Font.Color = clWindowText
                  Font.Height = -12
                  Font.Name = 'Arial'
                  Font.Style = [fsBold]
                  ParentFont = False
                end
                object Label38: TLabel
                  Left = 13
                  Top = 69
                  Width = 32
                  Height = 14
                  Caption = 'Curso:'
                end
                object lbCurso: TLabel
                  Left = 89
                  Top = 69
                  Width = 34
                  Height = 15
                  Caption = 'Curso'
                  Font.Charset = ANSI_CHARSET
                  Font.Color = clWindowText
                  Font.Height = -12
                  Font.Name = 'Arial'
                  Font.Style = [fsBold]
                  ParentFont = False
                end
                object dbcbColigadas: TDBLookupComboBox
                  Left = 86
                  Top = 27
                  Width = 283
                  Height = 22
                  DataField = 'cd_coligada_lk'
                  DataSource = dtcTurmas
                  TabOrder = 2
                end
              end
            end
            object Panel27: TPanel
              Left = 0
              Top = 86
              Width = 393
              Height = 7
              Align = alTop
              BevelOuter = bvLowered
              Color = clBlue
              Font.Charset = ANSI_CHARSET
              Font.Color = clWhite
              Font.Height = -17
              Font.Name = 'Arial'
              Font.Style = [fsBold]
              ParentFont = False
              TabOrder = 3
            end
            object Panel37: TPanel
              Left = 0
              Top = 459
              Width = 393
              Height = 3
              Align = alBottom
              BevelOuter = bvLowered
              Color = clGray
              Font.Charset = ANSI_CHARSET
              Font.Color = clWhite
              Font.Height = -17
              Font.Name = 'Arial'
              Font.Style = [fsBold]
              ParentFont = False
              TabOrder = 4
            end
          end
        end
        object Panel1: TPanel
          Left = 1
          Top = 1
          Width = 1254
          Height = 26
          Align = alTop
          BevelOuter = bvLowered
          Caption = 'TURMAS'
          Color = clBlue
          Font.Charset = ANSI_CHARSET
          Font.Color = clWhite
          Font.Height = -17
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          ParentFont = False
          TabOrder = 2
        end
      end
    end
    object tsDisciplinas: TTabSheet
      Caption = 'Disciplinas'
      object pnDisciplinas: TPanel
        Left = 0
        Top = 0
        Width = 1256
        Height = 682
        Align = alClient
        TabOrder = 0
        object Panel16: TPanel
          Left = 1
          Top = 27
          Width = 1254
          Height = 654
          Align = alClient
          BevelOuter = bvNone
          TabOrder = 0
          object Bevel14: TBevel
            Left = 0
            Top = 0
            Width = 1254
            Height = 3
            Align = alTop
            Shape = bsSpacer
            ExplicitWidth = 1018
          end
          object Bevel15: TBevel
            Left = 1247
            Top = 32
            Width = 7
            Height = 622
            Align = alRight
            Shape = bsSpacer
            ExplicitLeft = 789
            ExplicitTop = 39
            ExplicitHeight = 434
          end
          object Bevel18: TBevel
            Left = 0
            Top = 29
            Width = 1254
            Height = 3
            Align = alTop
            Shape = bsSpacer
            ExplicitWidth = 1018
          end
          object grdDisc: TDBGrid
            Left = 369
            Top = 32
            Width = 878
            Height = 622
            Align = alClient
            BorderStyle = bsNone
            DataSource = dtcDisc
            Options = [dgTitles, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgAlwaysShowSelection, dgConfirmDelete, dgCancelOnExit]
            PopupMenu = pmQtdDisc
            TabOrder = 0
            TitleFont.Charset = ANSI_CHARSET
            TitleFont.Color = clWindowText
            TitleFont.Height = -11
            TitleFont.Name = 'Arial'
            TitleFont.Style = []
            OnTitleClick = grdDiscTitleClick
            Columns = <
              item
                Alignment = taCenter
                Expanded = False
                FieldName = 'codigo'
                Width = 65
                Visible = True
              end
              item
                Alignment = taCenter
                Expanded = False
                FieldName = 'sigla'
                Width = 65
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'Descricao'
                Width = 310
                Visible = True
              end>
          end
          object Panel17: TPanel
            Left = 0
            Top = 3
            Width = 1254
            Height = 26
            Align = alTop
            BevelOuter = bvLowered
            Color = clBlue
            TabOrder = 1
            object Label44: TLabel
              Left = 8
              Top = 4
              Width = 37
              Height = 15
              Caption = 'Curso:'
              Font.Charset = ANSI_CHARSET
              Font.Color = clWhite
              Font.Height = -12
              Font.Name = 'Arial'
              Font.Style = [fsBold]
              ParentFont = False
            end
            object DBText1: TDBText
              Left = 56
              Top = 4
              Width = 47
              Height = 15
              AutoSize = True
              DataField = 'DS_CURSO'
              DataSource = dtcCursosMestre
              Font.Charset = ANSI_CHARSET
              Font.Color = clWhite
              Font.Height = -12
              Font.Name = 'Arial'
              Font.Style = [fsBold]
              ParentFont = False
              Transparent = True
            end
          end
          object Panel15: TPanel
            Left = 0
            Top = 32
            Width = 369
            Height = 622
            Align = alLeft
            BevelOuter = bvNone
            TabOrder = 2
            object tpan: TPanel
              Left = 0
              Top = 0
              Width = 369
              Height = 228
              Align = alTop
              BevelOuter = bvNone
              TabOrder = 0
              object Label40: TLabel
                Left = 8
                Top = 0
                Width = 33
                Height = 14
                Caption = 'C'#243'digo'
                FocusControl = dbCodDisc
              end
              object Label49: TLabel
                Left = 136
                Top = 3
                Width = 80
                Height = 14
                Caption = 'C'#243'digo do Curso'
                FocusControl = dbCursoDis
              end
              object Label50: TLabel
                Left = 8
                Top = 40
                Width = 49
                Height = 14
                Caption = 'Descri'#231#227'o'
                FocusControl = dbDescDisc
              end
              object Label51: TLabel
                Left = 8
                Top = 80
                Width = 23
                Height = 14
                Caption = 'Sigla'
                FocusControl = dbSiglaDisc
              end
              object Label57: TLabel
                Left = 95
                Top = 80
                Width = 32
                Height = 14
                Caption = 'Ordem'
                FocusControl = dbOrdemDisc
              end
              object Label58: TLabel
                Left = 183
                Top = 80
                Width = 73
                Height = 14
                Caption = 'C'#243'd. Disc. MEC'
                FocusControl = dbCdMECDisc
              end
              object Label59: TLabel
                Left = 183
                Top = 122
                Width = 60
                Height = 14
                Caption = 'Novo c'#243'digo'
                FocusControl = dbSiglaDisc
                Visible = False
              end
              object Label5: TLabel
                Left = 9
                Top = 122
                Width = 103
                Height = 14
                Caption = 'Disciplina Mestra(Pai)'
                FocusControl = cbDisciplinaPai
              end
              object dbCursoDis: TDBEdit
                Left = 136
                Top = 16
                Width = 177
                Height = 22
                Hint = 'C'#243'digo do Curso'
                DataField = 'Curso'
                DataSource = dtcDisc
                Enabled = False
                ReadOnly = True
                TabOrder = 1
                OnKeyPress = dbeDescricaoKeyPress
              end
              object dbCodDisc: TDBEdit
                Left = 8
                Top = 16
                Width = 69
                Height = 22
                Hint = 'C'#243'digo da Disciplina'
                DataField = 'Codigo'
                DataSource = dtcDisc
                Enabled = False
                ReadOnly = True
                TabOrder = 0
                OnKeyPress = dbeDescricaoKeyPress
              end
              object dbDescDisc: TDBEdit
                Left = 8
                Top = 56
                Width = 305
                Height = 22
                Hint = 'Descri'#231#227'o da disciplina'
                DataField = 'Descricao'
                DataSource = dtcDisc
                TabOrder = 2
                OnKeyPress = dbeDescricaoKeyPress
              end
              object dbSiglaDisc: TDBEdit
                Left = 8
                Top = 96
                Width = 73
                Height = 22
                Hint = 'Sigla da disciplina'
                DataField = 'Sigla'
                DataSource = dtcDisc
                TabOrder = 3
                OnKeyPress = dbeDescricaoKeyPress
              end
              object dbOrdemDisc: TDBEdit
                Left = 95
                Top = 96
                Width = 80
                Height = 22
                Hint = 'Ordem da disciplina'
                DataField = 'ordem'
                DataSource = dtcDisc
                TabOrder = 4
                OnKeyPress = dbeDescricaoKeyPress
              end
              object dbCdMECDisc: TDBEdit
                Left = 183
                Top = 96
                Width = 129
                Height = 22
                Hint = 'C'#243'digo MEC'
                DataField = 'cd_disc_mec'
                DataSource = dtcDisc
                TabOrder = 5
                OnKeyPress = dbeDescricaoKeyPress
              end
              object dbCodDiscPai: TDBEdit
                Left = 183
                Top = 137
                Width = 129
                Height = 22
                Hint = 'C'#243'digo da disciplina pai'
                CharCase = ecUpperCase
                DataField = 'CD_DISCIPLINA_PAI'
                DataSource = dtcDisc
                TabOrder = 7
                Visible = False
                OnEnter = dbCodDiscPaiEnter
                OnKeyPress = dbCodDiscPaiKeyPress
              end
              object cbDisciplinaPai: TUMComboBox
                Left = 8
                Top = 137
                Width = 164
                Height = 22
                Style = csDropDownList
                ItemHeight = 14
                TabOrder = 6
                OnSelect = cbDisciplinaPaiSelect
                TamanhoMaximo = 0
                SelecionarUnicoAutomatico = False
              end
              object pnOpcoesEmenta: TPanel
                Left = 0
                Top = 181
                Width = 369
                Height = 47
                Align = alBottom
                BevelOuter = bvNone
                TabOrder = 8
                object Label34: TLabel
                  Left = 9
                  Top = 4
                  Width = 38
                  Height = 14
                  Caption = 'Ementa:'
                end
                object sbBloqueiaValor: TSpeedButton
                  Left = 13
                  Top = 22
                  Width = 23
                  Height = 21
                  AllowAllUp = True
                  GroupIndex = 5
                  Down = True
                  Glyph.Data = {
                    76010000424D7601000000000000760000002800000020000000100000000100
                    04000000000000010000120B0000120B00001000000000000000000000000000
                    800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
                    FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333333000003
                    333333333F777773FF333333008888800333333377333F3773F3333077870787
                    7033333733337F33373F3308888707888803337F33337F33337F330777880887
                    7703337F33337FF3337F3308888000888803337F333777F3337F330777700077
                    7703337F33377733337F33088888888888033373FFFFFFFFFF73333000000000
                    00333337777777777733333308033308033333337F7F337F7F33333308033308
                    033333337F7F337F7F33333308033308033333337F73FF737F33333377800087
                    7333333373F77733733333333088888033333333373FFFF73333333333000003
                    3333333333777773333333333333333333333333333333333333}
                  NumGlyphs = 2
                  OnClick = sbBloqueiaValorClick
                end
                object Bevel12: TBevel
                  Left = 68
                  Top = 15
                  Width = 257
                  Height = 3
                  Shape = bsTopLine
                end
                object sbBibNegrito: TSpeedButton
                  Left = 142
                  Top = 21
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
                  Left = 165
                  Top = 21
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
                  Left = 188
                  Top = 21
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
                object Label27: TLabel
                  Left = 217
                  Top = 29
                  Width = 79
                  Height = 14
                  Caption = 'Ano/Sem. Inicial:'
                  FocusControl = DBEdit5
                end
                object DBNavigator1: TDBNavigator
                  Left = 44
                  Top = 21
                  Width = 92
                  Height = 22
                  DataSource = dsEmentas
                  VisibleButtons = [nbPrior, nbNext, nbInsert, nbDelete]
                  Flat = True
                  ConfirmDelete = False
                  TabOrder = 0
                end
                object DBEdit5: TDBEdit
                  Left = 299
                  Top = 21
                  Width = 64
                  Height = 22
                  DataField = 'anosemestre'
                  DataSource = dsEmentas
                  TabOrder = 1
                end
              end
              object dbchExportaDisciplinaMoodle: TDBCheckBox
                Left = 8
                Top = 164
                Width = 193
                Height = 17
                Caption = 'Exportar disciplina para o MOODLE'
                DataField = 'sn_exporta_moodle'
                DataSource = dtcDisc
                TabOrder = 9
                ValueChecked = '1'
                ValueUnchecked = '0'
              end
            end
            object Panel24: TPanel
              Left = 0
              Top = 228
              Width = 369
              Height = 394
              Align = alClient
              BevelOuter = bvNone
              TabOrder = 1
              object Bevel5: TBevel
                Left = 0
                Top = 0
                Width = 3
                Height = 394
                Align = alLeft
                Shape = bsSpacer
                ExplicitHeight = 419
              end
              object Bevel13: TBevel
                Left = 366
                Top = 0
                Width = 3
                Height = 394
                Align = alRight
                Shape = bsSpacer
                ExplicitLeft = 316
                ExplicitHeight = 419
              end
              object pcEmenta: TPageControl
                Left = 3
                Top = 0
                Width = 363
                Height = 394
                ActivePage = TabSheet2
                Align = alClient
                Font.Charset = ANSI_CHARSET
                Font.Color = clWindowText
                Font.Height = -9
                Font.Name = 'Arial'
                Font.Style = []
                ParentFont = False
                TabOrder = 0
                OnChange = pcEmentaChange
                object TabSheet2: TTabSheet
                  Caption = 'Ementa'
                  object dbEmentaDisc: TDBMemo
                    Left = 0
                    Top = 0
                    Width = 355
                    Height = 367
                    Hint = 'Ementa atual da disciplina'
                    Align = alClient
                    DataField = 'ementa'
                    DataSource = dsEmentas
                    Font.Charset = ANSI_CHARSET
                    Font.Color = clWindowText
                    Font.Height = -11
                    Font.Name = 'Arial'
                    Font.Style = []
                    ParentFont = False
                    TabOrder = 0
                  end
                end
                object TabSheet7: TTabSheet
                  Caption = 'Bibliografia B'#225'sica'
                  ImageIndex = 1
                  object dbreBibBasica: TDBRichEdit
                    Left = 0
                    Top = 0
                    Width = 355
                    Height = 367
                    Align = alClient
                    DataField = 'BIBLIOGRAFIA_BASICA'
                    DataSource = dsEmentas
                    Font.Charset = ANSI_CHARSET
                    Font.Color = clWindowText
                    Font.Height = -11
                    Font.Name = 'Arial'
                    Font.Style = []
                    ParentFont = False
                    ScrollBars = ssBoth
                    TabOrder = 0
                    OnSelectionChange = dbreBibBasicaSelectionChange
                  end
                end
                object TabSheet8: TTabSheet
                  Caption = 'Bibliografia Complementar'
                  ImageIndex = 2
                  object dbreBibComp: TDBRichEdit
                    Left = 0
                    Top = 0
                    Width = 355
                    Height = 367
                    Align = alClient
                    DataField = 'BIBLIOGRAFIA_COMPLEMENTAR'
                    DataSource = dsEmentas
                    Font.Charset = ANSI_CHARSET
                    Font.Color = clWindowText
                    Font.Height = -11
                    Font.Name = 'Arial'
                    Font.Style = []
                    ParentFont = False
                    ScrollBars = ssBoth
                    TabOrder = 0
                    OnSelectionChange = dbreBibBasicaSelectionChange
                  end
                end
                object TabSheet1: TTabSheet
                  Caption = 'Bibliografia Suplementar'
                  ImageIndex = 2
                  object dbreBibSup: TDBRichEdit
                    Left = 0
                    Top = 0
                    Width = 355
                    Height = 367
                    Align = alClient
                    DataField = 'BIBLIOGRAFIA_SUPLEMENTAR'
                    DataSource = dsEmentas
                    Font.Charset = ANSI_CHARSET
                    Font.Color = clWindowText
                    Font.Height = -11
                    Font.Name = 'Arial'
                    Font.Style = []
                    ParentFont = False
                    ScrollBars = ssBoth
                    TabOrder = 0
                    OnSelectionChange = dbreBibBasicaSelectionChange
                  end
                end
                object TabSheet11: TTabSheet
                  Caption = 'Objetivo'
                  ImageIndex = 3
                  object dbObjetivo: TDBMemo
                    Left = 0
                    Top = 0
                    Width = 355
                    Height = 367
                    Hint = 'Objetivo da Disciplina'
                    Align = alClient
                    DataField = 'objetivo'
                    DataSource = dsEmentas
                    Font.Charset = ANSI_CHARSET
                    Font.Color = clWindowText
                    Font.Height = -11
                    Font.Name = 'Arial'
                    Font.Style = []
                    ParentFont = False
                    TabOrder = 0
                  end
                end
              end
            end
          end
        end
        object Panel19: TPanel
          Left = 1
          Top = 1
          Width = 1254
          Height = 26
          Align = alTop
          BevelOuter = bvLowered
          Caption = 'DISCIPLINAS'
          Color = clBlue
          Font.Charset = ANSI_CHARSET
          Font.Color = clWhite
          Font.Height = -17
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          ParentFont = False
          TabOrder = 1
        end
      end
    end
    object tsGrade: TTabSheet
      Caption = 'Grade Curricular'
      object pnGradeCurricular: TPanel
        Left = 0
        Top = 0
        Width = 1256
        Height = 682
        Align = alClient
        TabOrder = 0
        object Bevel4: TBevel
          Left = 293
          Top = 27
          Width = 10
          Height = 654
          Align = alLeft
          Shape = bsSpacer
          ExplicitLeft = 494
          ExplicitTop = 26
          ExplicitHeight = 472
        end
        object Panel2: TPanel
          Left = 303
          Top = 27
          Width = 952
          Height = 654
          Align = alClient
          BevelOuter = bvNone
          TabOrder = 0
          object Bevel7: TBevel
            Left = 0
            Top = 0
            Width = 952
            Height = 10
            Align = alTop
            Shape = bsSpacer
            ExplicitWidth = 494
          end
          object Bevel8: TBevel
            Left = 0
            Top = 36
            Width = 952
            Height = 9
            Align = alTop
            Shape = bsSpacer
            ExplicitWidth = 494
          end
          object grdGrade: TDBGrid
            Left = 0
            Top = 45
            Width = 952
            Height = 561
            Align = alClient
            BorderStyle = bsNone
            DataSource = dsGradesDisciplinas
            Options = [dgEditing, dgTitles, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgConfirmDelete, dgCancelOnExit]
            PopupMenu = pmQtdGrade
            TabOrder = 0
            TitleFont.Charset = ANSI_CHARSET
            TitleFont.Color = clWindowText
            TitleFont.Height = -11
            TitleFont.Name = 'Arial'
            TitleFont.Style = []
            OnColEnter = grdGradeColEnter
            OnDrawColumnCell = grdGradeDrawColumnCell
            OnDragDrop = grdGradeDragDrop
            OnDragOver = grdGradeDragOver
            OnKeyDown = grdGradeKeyDown
            Columns = <
              item
                Alignment = taCenter
                Expanded = False
                FieldName = 'DS_SERIE'
                ReadOnly = True
                Width = 40
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'CD_DISCIPLINA'
                ReadOnly = True
                Visible = True
              end
              item
                Alignment = taCenter
                Expanded = False
                FieldName = 'SIGLA'
                Width = 50
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'DESCRICAO'
                Width = 180
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'DS_DISCIPLINA_CATEGORIA'
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'DS_OPTATIVA'
                Width = 43
                Visible = True
              end
              item
                Alignment = taCenter
                Expanded = False
                FieldName = 'NR_AULAS'
                Width = 35
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'NR_CREDITOS_ACADEMICOS'
                Width = 69
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'VL_VALOR'
                Width = 50
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'NR_CARGA_HORARIA_TEORICA'
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'NR_CARGA_HORARIA_PRATICA'
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'SN_COMPARTILHADA'
                Width = 48
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'CD_DISCIPLINA_CATEGORIA'
                Visible = False
              end
              item
                Expanded = False
                FieldName = 'CODIGO'
                Visible = False
              end
              item
                Expanded = False
                FieldName = 'CD_CURSO'
                Visible = False
              end
              item
                Expanded = False
                FieldName = 'CD_GRADE'
                Visible = False
              end
              item
                Expanded = False
                FieldName = 'PRE_REQUISITO'
                Title.Alignment = taCenter
                Width = 18
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'PRE_REQUISITO_ESPECIAL'
                Title.Alignment = taCenter
                Width = 18
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'DS_AVALIACAO'
                Width = 75
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'DS_DISCIPLINA_FRENTE'
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'DS_EXTRA'
                Width = 43
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'NR_QTD_DIAS_INICIO_MOODLE'
                Visible = True
              end>
          end
          object Panel14: TPanel
            Left = 0
            Top = 10
            Width = 952
            Height = 26
            Align = alTop
            BevelOuter = bvLowered
            Caption = 'DISCIPLINAS'
            Color = clBlue
            Font.Charset = ANSI_CHARSET
            Font.Color = clWhite
            Font.Height = -13
            Font.Name = 'Arial'
            Font.Style = [fsBold]
            ParentFont = False
            TabOrder = 1
          end
          object blementa: TToolBar
            Left = 0
            Top = 632
            Width = 952
            Height = 22
            Align = alBottom
            AutoSize = True
            ButtonWidth = 134
            Caption = 'blementa'
            Images = ImageList1
            List = True
            ShowCaptions = True
            TabOrder = 2
            object sbSelecionarColuna: TSpeedButton
              Left = 0
              Top = 0
              Width = 25
              Height = 22
              Hint = 'Selecionar Colunas'
              Align = alLeft
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
            object ToolButton9: TToolButton
              Left = 25
              Top = 0
              Width = 8
              Caption = 'ToolButton9'
              ImageIndex = 3
              Style = tbsSeparator
            end
            object btnCopiarGrade: TToolButton
              Left = 33
              Top = 0
              Hint = 'Copiar a grade selecionada para outro per'#237'odo'
              AutoSize = True
              Caption = 'F11 Copiar Grade'
              ImageIndex = 0
              OnClick = btnCopiarGradeClick
            end
            object btnMostrarDisciplinas: TToolButton
              Left = 148
              Top = 0
              Hint = 'Mostrar as disciplinas relacionadas ao curso'
              AutoSize = True
              Caption = 'Mostrar Disciplinas'
              ImageIndex = 1
              OnClick = btnMostrarDisciplinasClick
            end
            object ToolButton3: TToolButton
              Left = 270
              Top = 0
              AutoSize = True
              Caption = 'Professor'
              ImageIndex = 5
              Visible = False
              OnClick = ToolButton3Click
            end
            object ToolButton6: TToolButton
              Left = 349
              Top = 0
              AutoSize = True
              Caption = 'Hor'#225'rio'
              ImageIndex = 6
              Visible = False
              OnClick = ToolButton6Click
            end
            object ToolButton5: TToolButton
              Left = 415
              Top = 0
              Width = 8
              Caption = 'ToolButton5'
              ImageIndex = 6
              Style = tbsSeparator
            end
            object btnPreRequisito: TToolButton
              Left = 423
              Top = 0
              AutoSize = True
              Caption = 'Pr'#233'-Requisito'
              DropdownMenu = popPreRequisito
              ImageIndex = 2
            end
            object btnPreRequisitoEspecial: TToolButton
              Left = 518
              Top = 0
              AutoSize = True
              Caption = 'Pr'#233'-Requisito Especial'
              DropdownMenu = popPreRequisitoEspecial
              ImageIndex = 2
            end
          end
          object Panel38: TPanel
            Left = 0
            Top = 606
            Width = 952
            Height = 26
            Align = alBottom
            BevelOuter = bvLowered
            TabOrder = 3
            object lbTotais: TLabel
              Left = 1
              Top = 1
              Width = 64
              Height = 24
              Align = alLeft
              Alignment = taRightJustify
              AutoSize = False
              Caption = 'Totais:'
              Layout = tlCenter
            end
            object lblHR_A: TLabel
              Left = 313
              Top = 1
              Width = 64
              Height = 24
              Align = alLeft
              Alignment = taRightJustify
              AutoSize = False
              Caption = 'C.H Semanal:'
              Layout = tlCenter
              ExplicitLeft = 299
              ExplicitHeight = 14
            end
            object lblCR_F: TLabel
              Left = 216
              Top = 1
              Width = 34
              Height = 24
              Margins.Top = 5
              Align = alLeft
              Alignment = taRightJustify
              AutoSize = False
              Caption = 'Cr/Fin:'
              Layout = tlCenter
              ExplicitLeft = 222
            end
            object lblCH: TLabel
              Left = 431
              Top = 1
              Width = 56
              Height = 24
              Align = alLeft
              Alignment = taRightJustify
              AutoSize = False
              Caption = 'Carga Hr.:'
              Layout = tlCenter
              ExplicitLeft = 387
            end
            object lblDisciplinas: TLabel
              Left = 65
              Top = 1
              Width = 102
              Height = 24
              Align = alLeft
              Alignment = taRightJustify
              AutoSize = False
              Caption = 'Qtd. Disciplinas:'
              Layout = tlCenter
              ExplicitLeft = 115
            end
            object dbqtd: TDBText
              AlignWithMargins = True
              Left = 172
              Top = 6
              Width = 41
              Height = 16
              Margins.Left = 5
              Margins.Top = 5
              Align = alLeft
              DataField = 'qtd_disciplinas'
              DataSource = dsTotal
              ExplicitLeft = 178
            end
            object dbhra: TDBText
              AlignWithMargins = True
              Left = 382
              Top = 6
              Width = 46
              Height = 16
              Margins.Left = 5
              Margins.Top = 5
              Align = alLeft
              DataField = 'hora_aula'
              DataSource = dsTotal
              ExplicitLeft = 338
            end
            object dbCrFin: TDBText
              AlignWithMargins = True
              Left = 255
              Top = 6
              Width = 55
              Height = 16
              Margins.Left = 5
              Margins.Top = 5
              Align = alLeft
              DataField = 'credito_fin'
              DataSource = dsTotal
              ExplicitLeft = 261
            end
            object dbCh: TDBText
              AlignWithMargins = True
              Left = 492
              Top = 6
              Width = 25
              Height = 16
              Margins.Left = 5
              Margins.Top = 5
              Align = alLeft
              DataField = 'carga_horaria'
              DataSource = dsTotal
              ExplicitLeft = 449
              ExplicitHeight = 14
            end
            object cbFiltroEtapas: TUMComboBox
              AlignWithMargins = True
              Left = 530
              Top = 2
              Width = 257
              Height = 22
              Margins.Left = 10
              Margins.Top = 1
              Margins.Right = 0
              Margins.Bottom = 0
              Align = alLeft
              Style = csDropDownList
              ItemHeight = 14
              TabOrder = 0
              OnChange = cbFiltroEtapasChange
              TamanhoMaximo = 0
              SelecionarUnicoAutomatico = False
            end
          end
          object cbAvaliacao: TUMComboBox
            Left = 704
            Top = 95
            Width = 145
            Height = 20
            Style = csDropDownList
            Font.Charset = ANSI_CHARSET
            Font.Color = clWindowText
            Font.Height = -9
            Font.Name = 'Arial'
            Font.Style = []
            ItemHeight = 12
            ParentFont = False
            TabOrder = 4
            Visible = False
            OnChange = cbAvaliacaoChange
            TamanhoMaximo = 0
            SelecionarUnicoAutomatico = False
          end
          object cbSnExtra: TUMComboBox
            Left = 704
            Top = 104
            Width = 145
            Height = 20
            Style = csDropDownList
            Font.Charset = ANSI_CHARSET
            Font.Color = clWindowText
            Font.Height = -9
            Font.Name = 'Arial'
            Font.Style = []
            ItemHeight = 12
            ParentFont = False
            TabOrder = 6
            OnChange = cbSnExtraChange
            Items.Strings = (
              'Sim'
              'N'#227'o')
            TamanhoMaximo = 0
            SelecionarUnicoAutomatico = False
          end
          object cbFrentes: TUMComboBox
            Left = 704
            Top = 121
            Width = 145
            Height = 20
            Style = csDropDownList
            Font.Charset = ANSI_CHARSET
            Font.Color = clWindowText
            Font.Height = -9
            Font.Name = 'Arial'
            Font.Style = []
            ItemHeight = 12
            ParentFont = False
            TabOrder = 7
            Visible = False
            OnChange = cbFrentesChange
            TamanhoMaximo = 0
            SelecionarUnicoAutomatico = False
          end
          object cbSnOptativa: TUMComboBox
            Left = 704
            Top = 140
            Width = 145
            Height = 20
            Style = csDropDownList
            Font.Charset = ANSI_CHARSET
            Font.Color = clWindowText
            Font.Height = -9
            Font.Name = 'Arial'
            Font.Style = []
            ItemHeight = 12
            ParentFont = False
            TabOrder = 5
            Visible = False
            OnChange = cbSnOptativaChange
            Items.Strings = (
              'Sim'
              'N'#227'o')
            TamanhoMaximo = 0
            SelecionarUnicoAutomatico = False
          end
        end
        object Panel5: TPanel
          Left = 1
          Top = 27
          Width = 292
          Height = 654
          Align = alLeft
          BevelOuter = bvNone
          Caption = 'Panel5'
          TabOrder = 1
          object Bevel10: TBevel
            Left = 0
            Top = 36
            Width = 292
            Height = 9
            Align = alTop
            Shape = bsSpacer
          end
          object Bevel11: TBevel
            Left = 0
            Top = 0
            Width = 292
            Height = 10
            Align = alTop
            Shape = bsSpacer
          end
          object grdGrades: TDBGrid
            Left = 0
            Top = 70
            Width = 292
            Height = 354
            Align = alClient
            BorderStyle = bsNone
            DataSource = dsGrades
            Options = [dgTitles, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgAlwaysShowSelection, dgConfirmDelete, dgCancelOnExit]
            PopupMenu = pmQtdGrades
            TabOrder = 0
            TitleFont.Charset = ANSI_CHARSET
            TitleFont.Color = clWindowText
            TitleFont.Height = -11
            TitleFont.Name = 'Arial'
            TitleFont.Style = []
            OnKeyDown = grdGradesKeyDown
            Columns = <
              item
                Expanded = False
                FieldName = 'CD_GRADE'
                Title.Caption = 'Grade'
                Width = 40
                Visible = True
              end
              item
                Alignment = taCenter
                Expanded = False
                FieldName = 'CD_CURSO'
                Title.Caption = 'Curso'
                Width = 80
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'DS_GRADE'
                Title.Caption = 'Descri'#231#227'o'
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'NR_ANO_INICIAL'
                Title.Caption = 'Ano Inicial'
                Visible = True
              end>
          end
          object Panel6: TPanel
            Left = 0
            Top = 10
            Width = 292
            Height = 26
            Align = alTop
            BevelOuter = bvLowered
            Caption = 'GRADES CADASTRADAS'
            Color = clBlue
            Font.Charset = ANSI_CHARSET
            Font.Color = clWhite
            Font.Height = -13
            Font.Name = 'Arial'
            Font.Style = [fsBold]
            ParentFont = False
            TabOrder = 1
          end
          object pnCadastroGrade: TPanel
            Left = 0
            Top = 424
            Width = 292
            Height = 230
            Align = alBottom
            BevelOuter = bvNone
            TabOrder = 2
            object Bevel1: TBevel
              Left = 0
              Top = 0
              Width = 292
              Height = 10
              Align = alTop
              Shape = bsSpacer
            end
            object Label14: TLabel
              Left = 64
              Top = 45
              Width = 36
              Height = 14
              Caption = 'C'#243'digo:'
            end
            object Label15: TLabel
              Left = 69
              Top = 73
              Width = 32
              Height = 14
              Caption = 'Curso:'
            end
            object Label16: TLabel
              Left = 49
              Top = 101
              Width = 52
              Height = 14
              Caption = 'Descri'#231#227'o:'
            end
            object Label47: TLabel
              Left = 3
              Top = 129
              Width = 97
              Height = 14
              Caption = 'Anosemestre Inicial:'
            end
            object lblCargaHorariaCurso: TLabel
              Left = 52
              Top = 157
              Width = 48
              Height = 14
              Caption = 'CH curso:'
            end
            object lblCargaHorariaComplementar: TLabel
              Left = 67
              Top = 185
              Width = 34
              Height = 14
              Caption = 'CH AC:'
            end
            object Panel32: TPanel
              Left = 0
              Top = 10
              Width = 292
              Height = 26
              Align = alTop
              BevelOuter = bvLowered
              Caption = 'CADASTRO'
              Color = clBlue
              Font.Charset = ANSI_CHARSET
              Font.Color = clWhite
              Font.Height = -13
              Font.Name = 'Arial'
              Font.Style = [fsBold]
              ParentFont = False
              TabOrder = 0
            end
            object edGradeCodigo: TDBEdit
              Left = 107
              Top = 42
              Width = 179
              Height = 22
              DataField = 'CD_GRADE'
              DataSource = dsGrades
              TabOrder = 1
            end
            object edGradeCurso: TDBEdit
              Left = 107
              Top = 70
              Width = 179
              Height = 22
              DataField = 'CD_CURSO'
              DataSource = dsGrades
              Enabled = False
              TabOrder = 2
            end
            object edGradeDescricao: TDBEdit
              Left = 107
              Top = 98
              Width = 179
              Height = 22
              DataField = 'DS_GRADE'
              DataSource = dsGrades
              TabOrder = 3
            end
            object edGradeAnoSemestreInicial: TDBEdit
              Left = 107
              Top = 126
              Width = 179
              Height = 22
              DataField = 'NR_ANO_INICIAL'
              DataSource = dsGrades
              TabOrder = 4
            end
            object DBCheckBox9: TDBCheckBox
              Left = 107
              Top = 210
              Width = 80
              Height = 17
              Caption = 'Ativo'
              DataField = 'SN_ATIVO'
              DataSource = dsGrades
              TabOrder = 7
              ValueChecked = 'S'
              ValueUnchecked = 'N'
            end
            object dbeCargaHorariaCurso: TDBEdit
              Left = 107
              Top = 154
              Width = 179
              Height = 22
              DataField = 'NR_CARGA_CURSO'
              DataSource = dsGrades
              TabOrder = 5
            end
            object dbeCargaHorariaComplementar: TDBEdit
              Left = 107
              Top = 182
              Width = 179
              Height = 22
              DataField = 'NR_CARGA_ATIVIDADES'
              DataSource = dsGrades
              TabOrder = 6
            end
            object dbcbGradePadrao: TDBCheckBox
              Left = 176
              Top = 210
              Width = 97
              Height = 17
              Caption = 'Grade Padr'#227'o'
              DataField = 'SN_PADRAO'
              DataSource = dsGrades
              TabOrder = 8
              ValueChecked = '1'
              ValueUnchecked = '0'
            end
          end
          object btnMostraGradesAtivas: TButton
            Left = 0
            Top = 45
            Width = 292
            Height = 25
            Align = alTop
            Caption = 'Mostrar todas as grades'
            TabOrder = 3
            OnClick = btnMostraGradesAtivasClick
          end
        end
        object Panel3: TPanel
          Left = 1
          Top = 1
          Width = 1254
          Height = 26
          Align = alTop
          BevelOuter = bvLowered
          Caption = 'GRADE CURRICULAR'
          Color = clBlue
          Font.Charset = ANSI_CHARSET
          Font.Color = clWhite
          Font.Height = -17
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          ParentFont = False
          TabOrder = 2
        end
      end
    end
    object tsDocumentos: TTabSheet
      Caption = 'Documentos Necess'#225'rios'
      ImageIndex = 5
      object pnDocumentosNecessarios: TPanel
        Left = 0
        Top = 0
        Width = 1256
        Height = 682
        Align = alClient
        TabOrder = 0
        object Bevel16: TBevel
          Left = 1
          Top = 27
          Width = 1254
          Height = 8
          Align = alTop
          Shape = bsSpacer
          ExplicitLeft = 0
          ExplicitTop = 26
          ExplicitWidth = 796
        end
        object Bevel17: TBevel
          Left = 1
          Top = 35
          Width = 13
          Height = 646
          Align = alLeft
          Shape = bsSpacer
          ExplicitLeft = 0
          ExplicitTop = 34
          ExplicitHeight = 465
        end
        object Panel20: TPanel
          Left = 14
          Top = 35
          Width = 652
          Height = 646
          Align = alLeft
          BevelOuter = bvNone
          TabOrder = 0
          object grdDoc: TDBGrid
            Left = 0
            Top = 138
            Width = 652
            Height = 508
            Align = alClient
            BorderStyle = bsNone
            DataSource = dsDocumentosNecessarios
            Options = [dgTitles, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgAlwaysShowSelection, dgConfirmDelete, dgCancelOnExit]
            PopupMenu = pmQtdDocumentosNecessarios
            TabOrder = 0
            TitleFont.Charset = ANSI_CHARSET
            TitleFont.Color = clWindowText
            TitleFont.Height = -11
            TitleFont.Name = 'Arial'
            TitleFont.Style = []
            OnCellClick = grdDocCellClick
            OnTitleClick = grdDocTitleClick
            Columns = <
              item
                Expanded = False
                FieldName = 'Codigo'
                Title.Caption = 'C'#243'digo'
                Width = 40
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'Documento'
                Width = 250
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'Prazo'
                Width = 120
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'Sigla'
                Width = 70
                Visible = True
              end
              item
                Alignment = taCenter
                Expanded = False
                FieldName = 'nr_grupo'
                Title.Alignment = taCenter
                Width = 50
                Visible = True
              end
              item
                Alignment = taCenter
                Expanded = False
                FieldName = 'sn_obrigatorio'
                Title.Alignment = taCenter
                Title.Caption = 'Necess'#225'rio'
                Width = 60
                Visible = True
              end>
          end
          object Panel21: TPanel
            Left = 0
            Top = 0
            Width = 652
            Height = 33
            Align = alTop
            BevelOuter = bvLowered
            Color = clBlue
            TabOrder = 1
            object Label22: TLabel
              Left = 8
              Top = 9
              Width = 37
              Height = 15
              Caption = 'Curso:'
              Font.Charset = ANSI_CHARSET
              Font.Color = clWhite
              Font.Height = -12
              Font.Name = 'Arial'
              Font.Style = [fsBold]
              ParentFont = False
            end
            object DBText3: TDBText
              Left = 56
              Top = 9
              Width = 47
              Height = 15
              AutoSize = True
              DataField = 'DS_CURSO'
              DataSource = dtcCursosMestre
              Font.Charset = ANSI_CHARSET
              Font.Color = clWhite
              Font.Height = -12
              Font.Name = 'Arial'
              Font.Style = [fsBold]
              ParentFont = False
              Transparent = True
            end
          end
          object pnDoc: TPanel
            Left = 0
            Top = 33
            Width = 652
            Height = 105
            Align = alTop
            BevelOuter = bvNone
            TabOrder = 2
            object Label30: TLabel
              Left = 0
              Top = 11
              Width = 116
              Height = 14
              Caption = 'Selecione o Documento:'
            end
            object Label12: TLabel
              Left = 0
              Top = 56
              Width = 45
              Height = 14
              Caption = 'N'#186' Grupo'
              FocusControl = DBEdit4
            end
            object DBLookupComboBox1: TDBLookupComboBox
              Left = 0
              Top = 32
              Width = 521
              Height = 22
              Hint = 'Selecione o documento requerido para o curso'
              DataField = 'Cod_Documento'
              DataSource = dsDocumentosNecessarios
              KeyField = 'Codigo'
              ListField = 'Documento'
              ListSource = dsDocumentos
              TabOrder = 0
            end
            object DBEdit4: TDBEdit
              Left = 0
              Top = 72
              Width = 144
              Height = 22
              Hint = 
                'Defina um n'#250'mero igual a de outros documentos (e diferente de ze' +
                'ro) para os documentos substitutivos. '
              DataField = 'nr_grupo'
              DataSource = dsDocumentosNecessarios
              TabOrder = 1
            end
            object DBCheckBox1: TDBCheckBox
              Left = 168
              Top = 72
              Width = 257
              Height = 17
              Caption = 'Necess'#225'rio para Ativa'#231#227'o da Matr'#237'cula'
              DataField = 'sn_obrigatorio'
              DataSource = dsDocumentosNecessarios
              TabOrder = 2
              ValueChecked = 'S'
              ValueUnchecked = 'N'
            end
          end
        end
        object Panel9: TPanel
          Left = 1
          Top = 1
          Width = 1254
          Height = 26
          Align = alTop
          BevelOuter = bvLowered
          Caption = 'DOCUMENTOS NECESS'#193'RIOS'
          Color = clBlue
          Font.Charset = ANSI_CHARSET
          Font.Color = clWhite
          Font.Height = -17
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          ParentFont = False
          TabOrder = 1
        end
      end
    end
  end
  object toolPessoa: TToolBar
    Left = 0
    Top = 714
    Width = 1264
    Height = 25
    Align = alBottom
    ButtonWidth = 173
    Caption = 'toolPessoa'
    EdgeBorders = [ebTop, ebBottom]
    Images = ImageList2
    List = True
    ShowCaptions = True
    TabOrder = 1
    object ToolButton1: TToolButton
      Left = 0
      Top = 0
      Width = 8
      Caption = 'ToolButton1'
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
      Left = 82
      Top = 0
      AutoSize = True
      Caption = 'F3 Alterar'
      ImageIndex = 1
      OnClick = btnAlterarClick
    end
    object btnExcluir: TToolButton
      Left = 160
      Top = 0
      AutoSize = True
      Caption = 'F9 Excluir'
      ImageIndex = 2
      OnClick = btnExcluirClick
    end
    object btnSalvar: TToolButton
      Left = 238
      Top = 0
      AutoSize = True
      Caption = 'F5 Salvar'
      Enabled = False
      ImageIndex = 3
      OnClick = btnSalvarClick
    end
    object ToolButton4: TToolButton
      Left = 315
      Top = 0
      Width = 8
      Caption = 'ToolButton4'
      ImageIndex = 3
      Style = tbsSeparator
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
    object ToolButton8: TToolButton
      Left = 412
      Top = 0
      Width = 8
      Caption = 'ToolButton8'
      ImageIndex = 9
      Style = tbsSeparator
    end
    object ToolButton7: TToolButton
      Left = 420
      Top = 0
      Hint = 
        'Utilize este comando sempre que houver altera'#231#227'o na grade ap'#243's m' +
        'atr'#237'culas.'
      Caption = 'Atualizar Grades Matriculadas'
      ImageIndex = 8
      ParentShowHint = False
      ShowHint = True
      OnClick = ToolButton7Click
    end
    object ToolButton11: TToolButton
      Left = 593
      Top = 0
      Width = 8
      Caption = 'ToolButton11'
      ImageIndex = 7
      Style = tbsSeparator
    end
    object btnSair: TToolButton
      Left = 601
      Top = 0
      AutoSize = True
      Caption = 'F12 Fechar'
      ImageIndex = 7
      OnClick = btnSairClick
    end
    object ToolButton2: TToolButton
      Left = 687
      Top = 0
      Width = 8
      Caption = 'ToolButton2'
      ImageIndex = 8
      Style = tbsSeparator
    end
  end
  object qryInsertCursos: TUMZQuery
    Connection = DM.db
    SQL.Strings = (
      
        'insert into Cursos (cd_grade, AnoSemestre, Codigo, Descricao, Ap' +
        'elido, ds_habilitacao, Grau, '
      'ParecerAutorizacao, DataCEE, CargaHorariaTotal, '
      'DiasLetivos, SemanasLetivas, DiasSemanasLetivas, '
      'HorarioLetivo, DuracaoHoraAula, DiasLetivosSemanais, '
      
        'NumerodeSeries, Observacoes, Contrato, Requerimento, Depto, senh' +
        'a, senhaprovisoria)'
      'VALUES'
      
        '(:cd_grade, :AnoSemestre, :Codigo, :Descricao, :apelido, :ds_hab' +
        'ilitacao, :Grau, '
      ':ParecerAutorizacao, :DataCEE, :CargaHorariaTotal, '
      ':DiasLetivos, :SemanasLetivas, :DiasSemanasLetivas, '
      ':HorarioLetivo, :DuracaoHoraAula, :DiasLetivosSemanais, '
      
        ':NumerodeSeries, :Observacoes, :Contrato, :Requerimento, :Depto,' +
        ' :senha, :senhaprovisoria)')
    Params = <
      item
        DataType = ftUnknown
        Name = 'cd_grade'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'AnoSemestre'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'Codigo'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'Descricao'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'apelido'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'ds_habilitacao'
        ParamType = ptUnknown
      end
      item
        DataType = ftSmallint
        Name = 'Grau'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'ParecerAutorizacao'
        ParamType = ptUnknown
      end
      item
        DataType = ftDateTime
        Name = 'DataCEE'
        ParamType = ptUnknown
      end
      item
        DataType = ftFloat
        Name = 'CargaHorariaTotal'
        ParamType = ptUnknown
      end
      item
        DataType = ftFloat
        Name = 'DiasLetivos'
        ParamType = ptUnknown
      end
      item
        DataType = ftFloat
        Name = 'SemanasLetivas'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'DiasSemanasLetivas'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'HorarioLetivo'
        ParamType = ptUnknown
      end
      item
        DataType = ftFloat
        Name = 'DuracaoHoraAula'
        ParamType = ptUnknown
      end
      item
        DataType = ftFloat
        Name = 'DiasLetivosSemanais'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'NumerodeSeries'
        ParamType = ptUnknown
      end
      item
        DataType = ftMemo
        Name = 'Observacoes'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'Contrato'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'Requerimento'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'Depto'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'senha'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'senhaprovisoria'
        ParamType = ptUnknown
      end>
    Left = 720
    Top = 424
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'cd_grade'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'AnoSemestre'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'Codigo'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'Descricao'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'apelido'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'ds_habilitacao'
        ParamType = ptUnknown
      end
      item
        DataType = ftSmallint
        Name = 'Grau'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'ParecerAutorizacao'
        ParamType = ptUnknown
      end
      item
        DataType = ftDateTime
        Name = 'DataCEE'
        ParamType = ptUnknown
      end
      item
        DataType = ftFloat
        Name = 'CargaHorariaTotal'
        ParamType = ptUnknown
      end
      item
        DataType = ftFloat
        Name = 'DiasLetivos'
        ParamType = ptUnknown
      end
      item
        DataType = ftFloat
        Name = 'SemanasLetivas'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'DiasSemanasLetivas'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'HorarioLetivo'
        ParamType = ptUnknown
      end
      item
        DataType = ftFloat
        Name = 'DuracaoHoraAula'
        ParamType = ptUnknown
      end
      item
        DataType = ftFloat
        Name = 'DiasLetivosSemanais'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'NumerodeSeries'
        ParamType = ptUnknown
      end
      item
        DataType = ftMemo
        Name = 'Observacoes'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'Contrato'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'Requerimento'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'Depto'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'senha'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'senhaprovisoria'
        ParamType = ptUnknown
      end>
  end
  object dtcTurmas: TDataSource
    DataSet = tblTurmas
    OnStateChange = dtcTurmasStateChange
    OnDataChange = dtcTurmasDataChange
    Left = 734
    Top = 516
  end
  object tblTurmas: TUMZQuery
    Connection = DM.db
    BeforeInsert = tblTurmasBeforeInsert
    AfterInsert = tblTurmasAfterInsert
    BeforeEdit = tblTurmasBeforeEdit
    BeforePost = tblTurmasBeforePost
    AfterPost = tblTurmasAfterPost
    BeforeDelete = tblTurmasBeforeDelete
    OnPostError = tblTurmasPostError
    SQL.Strings = (
      'Select * From Turmas where '
      'Curso = :Codigo and'
      'AnoSemestre = :AnoSemestre'
      'Order By AnoSemestre,Codigo')
    Params = <
      item
        DataType = ftString
        Name = 'Codigo'
        ParamType = ptUnknown
      end
      item
        DataType = ftSmallint
        Name = 'AnoSemestre'
        ParamType = ptUnknown
      end>
    Left = 702
    Top = 516
    ParamData = <
      item
        DataType = ftString
        Name = 'Codigo'
        ParamType = ptUnknown
      end
      item
        DataType = ftSmallint
        Name = 'AnoSemestre'
        ParamType = ptUnknown
      end>
    object tblTurmasAnoSemestre: TSmallintField
      DisplayLabel = 'Ano/Sem.'
      DisplayWidth = 8
      FieldName = 'AnoSemestre'
      Origin = 'Turmas.AnoSemestre'
      DisplayFormat = '0000/0'
      EditFormat = '0000/0'
    end
    object tblTurmasCodigo: TStringField
      Alignment = taCenter
      DisplayLabel = 'C'#243'digo'
      DisplayWidth = 50
      FieldName = 'Codigo'
      Origin = 'Turmas.Codigo'
      Size = 50
    end
    object tblTurmasCurso: TStringField
      DisplayWidth = 15
      FieldName = 'Curso'
      Origin = 'Turmas.Curso'
      Size = 15
    end
    object tblTurmasDataInicio: TDateTimeField
      DisplayWidth = 10
      FieldName = 'DataInicio'
      Origin = 'Turmas.DataInicio'
      DisplayFormat = 'dd/mm/yyyy'
      EditMask = '!99/99/9999;1;_'
    end
    object tblTurmasDataFim: TDateTimeField
      DisplayWidth = 10
      FieldName = 'DataFim'
      Origin = 'Turmas.DataFim'
      DisplayFormat = 'dd/mm/yyyy'
      EditMask = '!99/99/9999;1;_'
    end
    object tblTurmasDataConclusao: TDateTimeField
      DisplayLabel = 'Data Conclus'#227'o'
      DisplayWidth = 13
      FieldName = 'DataConclusao'
      Origin = 'Turmas.DataConclusao'
      DisplayFormat = 'dd/mm/yyyy'
      EditMask = '!99/99/9999;1;_'
    end
    object tblTurmasIdadeConclusao: TSmallintField
      DisplayLabel = 'Idade Conclus'#227'o'
      DisplayWidth = 14
      FieldName = 'IdadeConclusao'
      Origin = 'Turmas.IdadeConclusao'
    end
    object tblTurmasSerie: TSmallintField
      DisplayLabel = 'S'#233'rie'
      DisplayWidth = 6
      FieldName = 'Serie'
      Origin = 'Turmas.Serie'
    end
    object tblTurmasTurno: TStringField
      DisplayWidth = 5
      FieldName = 'Turno'
      Origin = 'Turmas.Turno'
      Size = 1
    end
    object tblTurmasVagas: TSmallintField
      DisplayWidth = 7
      FieldName = 'Vagas'
      Origin = 'Turmas.Vagas'
    end
    object tblTurmasContrato: TStringField
      DisplayWidth = 15
      FieldName = 'Contrato'
      Origin = 'Turmas.Contrato'
      Visible = False
      Size = 50
    end
    object tblTurmasHorarioLetivo: TStringField
      FieldName = 'HorarioLetivo'
      Origin = 'Turmas.Codigo'
      Visible = False
      Size = 50
    end
    object tblTurmasHorasAula: TStringField
      FieldName = 'HorasAula'
      Origin = 'Turmas.AnoSemestre'
      Visible = False
    end
    object tblTurmasGrau: TSmallintField
      FieldName = 'Grau'
      Origin = 'Turmas.AnoSemestre'
      Visible = False
    end
    object tblTurmasdescProfessor: TStringField
      FieldKind = fkLookup
      FieldName = 'descProfessor'
      LookupDataSet = tblProfessores
      LookupKeyFields = 'cd_pessoa'
      LookupResultField = 'nm_pessoa'
      KeyFields = 'professor_responsavel'
      Size = 50
      Lookup = True
    end
    object tblTurmasdescProfessor2: TStringField
      FieldKind = fkLookup
      FieldName = 'descProfessor2'
      LookupDataSet = tblProfessores
      LookupKeyFields = 'cd_pessoa'
      LookupResultField = 'nm_pessoa'
      KeyFields = 'professor_responsavel2'
      Size = 255
      Lookup = True
    end
    object tblTurmasObsHistorico: TMemoField
      FieldName = 'ObsHistorico'
      Origin = 'Turmas.AnoSemestre'
      BlobType = ftMemo
      Size = 1
    end
    object tblTurmassn_inscricao_online: TStringField
      FieldName = 'sn_inscricao_online'
      Origin = 'WMESTRE12.turmas.sn_inscricao_online'
      FixedChar = True
      Size = 1
    end
    object tblTurmascd_avaliacao: TSmallintField
      FieldName = 'cd_avaliacao'
      Origin = 'WMESTRE12.turmas.cd_avaliacao'
    end
    object tblTurmasvl_ordem: TSmallintField
      FieldName = 'vl_ordem'
      Origin = 'WMESTRE12.turmas.vl_ordem'
    end
    object tblTurmascd_proxima_turma: TStringField
      DisplayWidth = 50
      FieldName = 'cd_proxima_turma'
      Origin = 'WMESTRE12.turmas.cd_proxima_turma'
      Size = 50
    end
    object tblTurmassn_terminal_acesso: TSmallintField
      FieldName = 'sn_terminal_acesso'
      Origin = 'WMESTRE12.turmas.sn_terminal_acesso'
    end
    object tblTurmascd_coligada: TSmallintField
      FieldName = 'cd_coligada'
      Origin = 'WMESTRE12.turmas.cd_coligada'
    end
    object tblTurmasdescCaixa: TStringField
      FieldKind = fkLookup
      FieldName = 'descCaixa'
      LookupDataSet = qyConta
      LookupKeyFields = 'cd_caixa'
      LookupResultField = 'ds_caixa'
      KeyFields = 'cd_caixa'
      Size = 50
      Lookup = True
    end
    object tblTurmassn_bloquear_disc_pendentes: TSmallintField
      FieldName = 'sn_bloquear_disc_pendentes'
      Origin = 'WMESTRE12.turmas.sn_bloquear_disc_pendentes'
    end
    object tblTurmascd_etapa_mec: TIntegerField
      FieldName = 'cd_etapa_mec'
      Origin = 'WMESTRE12.turmas.cd_etapa_mec'
    end
    object tblTurmasdescricao: TStringField
      DisplayLabel = 'Descri'#231#227'o'
      FieldName = 'descricao'
      Origin = 'WMESTRE12.turmas.descricao'
      Size = 255
    end
    object tblTurmasprofessor_responsavel: TIntegerField
      FieldName = 'professor_responsavel'
      Origin = 'WMESTRE12.turmas.professor_responsavel'
    end
    object tblTurmasprofessor_responsavel2: TIntegerField
      FieldName = 'professor_responsavel2'
    end
    object tblTurmassn_bloquear_vagas: TSmallintField
      FieldName = 'sn_bloquear_vagas'
      Origin = 'WMESTRE12.turmas.sn_bloquear_vagas'
    end
    object tblTurmassn_turma_especial: TSmallintField
      FieldName = 'sn_turma_especial'
      Origin = 'WMESTRE12.turmas.sn_turma_especial'
    end
    object tblTurmasDIASSEMANAISLETIVOS: TFloatField
      FieldName = 'DIASSEMANAISLETIVOS'
    end
    object tblTurmasCD_CAMPUS: TLargeintField
      FieldName = 'CD_CAMPUS'
    end
    object tblTurmasCD_CENTRO: TLargeintField
      FieldName = 'CD_CENTRO'
    end
    object tblTurmasCD_CAIXA: TLargeintField
      FieldName = 'CD_CAIXA'
    end
    object tblTurmasCD_GRADE: TLargeintField
      FieldName = 'CD_GRADE'
    end
    object tblTurmasHORAFIM: TDateTimeField
      DisplayLabel = 'Hora Fim'
      FieldName = 'HORAFIM'
      DisplayFormat = 't'
      EditMask = '!90:00;1;_'
    end
    object tblTurmasHORAINICIO: TDateTimeField
      DisplayLabel = 'Hora In'#237'cio'
      FieldName = 'HORAINICIO'
      DisplayFormat = 't'
      EditMask = '!90:00;1;_'
    end
    object tblTurmasSN_ATIVA: TIntegerField
      FieldName = 'SN_ATIVA'
    end
    object tblTurmascd_grade_lk: TLargeintField
      FieldKind = fkLookup
      FieldName = 'cd_grade_lk'
      LookupDataSet = qyListaGrades
      LookupKeyFields = 'CD_GRADE'
      LookupResultField = 'CD_GRADE'
      KeyFields = 'CD_GRADE'
      Lookup = True
    end
    object tblTurmasobscontrato: TMemoField
      FieldName = 'obscontrato'
      BlobType = ftMemo
    end
    object tblTurmasobsgerais: TMemoField
      FieldName = 'obsgerais'
      BlobType = ftMemo
    end
    object tblTurmascd_proxima_turma_lk: TStringField
      FieldKind = fkLookup
      FieldName = 'cd_proxima_turma_lk'
      LookupDataSet = qyListaProximaTurma
      LookupKeyFields = 'codigo'
      LookupResultField = 'codigo'
      KeyFields = 'cd_proxima_turma'
      Size = 0
      Lookup = True
    end
    object tblTurmascd_avaliacao_lk: TStringField
      FieldKind = fkLookup
      FieldName = 'cd_avaliacao_lk'
      LookupDataSet = tblAvaliacoes_Parametros
      LookupKeyFields = 'cd_avaliacao'
      LookupResultField = 'ds_avaliacao'
      KeyFields = 'cd_avaliacao'
      Size = 50
      Lookup = True
    end
    object tblTurmascd_situacao: TSmallintField
      FieldName = 'cd_situacao'
    end
    object tblTurmasdt_inicio_monografia: TDateTimeField
      DisplayWidth = 10
      FieldName = 'dt_inicio_monografia'
      DisplayFormat = 'dd/mm/yyyy'
      EditMask = '!99/99/9999;1;_'
    end
    object tblTurmasdt_fim_monografia: TDateTimeField
      DisplayWidth = 10
      FieldName = 'dt_fim_monografia'
      DisplayFormat = 'dd/mm/yyyy'
      EditMask = '!99/99/9999;1;_'
    end
    object tblTurmascd_coligada_lk: TStringField
      FieldKind = fkLookup
      FieldName = 'cd_coligada_lk'
      LookupDataSet = qyColigadasCadastroTurma
      LookupKeyFields = 'cd_coligada'
      LookupResultField = 'nm_coligada'
      KeyFields = 'cd_coligada'
      Size = 100
      Lookup = True
    end
    object tblTurmassn_usar_plano: TSmallintField
      FieldName = 'sn_usar_plano'
      Required = True
    end
    object tblTurmasdescSituacao: TStringField
      FieldKind = fkLookup
      FieldName = 'descSituacao'
      LookupDataSet = qrySituacoes
      LookupKeyFields = 'cd_situacao'
      LookupResultField = 'ds_valor'
      KeyFields = 'cd_situacao'
      Size = 255
      Lookup = True
    end
    object tblTurmascd_unidade_certificadora: TLargeintField
      FieldName = 'cd_unidade_certificadora'
    end
    object tblTurmasCD_PLANO_PADRAO: TIntegerField
      FieldName = 'CD_PLANO_PADRAO'
    end
    object tblTurmasdescPlanoPadrao: TStringField
      FieldKind = fkLookup
      FieldName = 'descPlanoPadrao'
      LookupDataSet = qyPlanos
      LookupKeyFields = 'CD_PLANO'
      LookupResultField = 'DS_PLANO'
      KeyFields = 'CD_PLANO_PADRAO'
      Lookup = True
    end
    object tblTurmasdt_inicio_financeiro: TDateTimeField
      DisplayWidth = 10
      FieldName = 'dt_inicio_financeiro'
      DisplayFormat = 'dd/mm/yyyy'
      EditMask = '!99/99/9999;1;_'
    end
    object tblTurmasdt_fim_financeiro: TDateTimeField
      DisplayWidth = 10
      FieldName = 'dt_fim_financeiro'
      DisplayFormat = 'dd/mm/yyyy'
      EditMask = '!99/99/9999;1;_'
    end
    object tblTurmassn_alterar_boleto: TSmallintField
      FieldName = 'sn_alterar_boleto'
    end
    object tblTurmassn_cronograma_geren_inicio_fim: TSmallintField
      FieldName = 'sn_cronograma_geren_inicio_fim'
      Required = True
    end
    object tblTurmascd_sala: TLargeintField
      FieldName = 'cd_sala'
    end
    object tblTurmasDS_UNI_SALA: TStringField
      FieldKind = fkLookup
      FieldName = 'DS_UNI_SALA'
      LookupDataSet = qrySalas
      LookupKeyFields = 'CD_SALA'
      LookupResultField = 'DS_SALA'
      KeyFields = 'cd_sala'
      Lookup = True
    end
    object tblTurmassn_exporta_moodle: TSmallintField
      FieldName = 'sn_exporta_moodle'
      Required = True
    end
    object tblTurmascd_proximo_curso: TStringField
      FieldName = 'cd_proximo_curso'
      Size = 15
    end
    object tblTurmassn_proximo_curso: TSmallintField
      FieldName = 'sn_proximo_curso'
    end
  end
  object dtcTurnos: TDataSource
    DataSet = tblTurnos
    Left = 724
    Top = 1
  end
  object tblTurnos: TUMZQuery
    Connection = DM.db
    SQL.Strings = (
      'Select * From Turnos'
      'Order By Descricao')
    Params = <>
    Left = 756
    Top = 1
    object tblTurnosDescricao: TStringField
      DisplayWidth = 10
      FieldName = 'Descricao'
      Origin = 'Turnos.Descricao'
      Size = 10
    end
    object tblTurnosCodigo: TStringField
      DisplayWidth = 1
      FieldName = 'Codigo'
      Origin = 'Turnos.Codigo'
      Visible = False
      Size = 1
    end
  end
  object tblGradeGroup: TUMZQuery
    Connection = DM.db
    SQL.Strings = (
      'Select '
      'GradeCurricular.cd_grade, '
      'GradeCurricular.AnoSemestre,'
      'GradeCurricular.Curso,'
      'GradeCurricular.Turno, '
      'GradeCurricular.Serie '
      'From GradeCurricular'
      'where '
      'GradeCurricular.AnoSemestre = :AnoSemestre and'
      'GradeCurricular.Curso = :Codigo'
      'group by '
      
        'GradeCurricular.cd_grade, GradeCurricular.AnoSemestre, GradeCurr' +
        'icular.Curso,  '
      'GradeCurricular.Turno, GradeCurricular.Serie'
      'ORDER BY '
      
        'GradeCurricular.cd_grade, GradeCurricular.AnoSemestre, GradeCurr' +
        'icular.Curso,  '
      'GradeCurricular.Turno, GradeCurricular.Serie')
    Params = <
      item
        DataType = ftSmallint
        Name = 'AnoSemestre'
        ParamType = ptUnknown
        Size = 2
      end
      item
        DataType = ftString
        Name = 'Codigo'
        ParamType = ptUnknown
        Size = 16
      end>
    Left = 701
    Top = 549
    ParamData = <
      item
        DataType = ftSmallint
        Name = 'AnoSemestre'
        ParamType = ptUnknown
        Size = 2
      end
      item
        DataType = ftString
        Name = 'Codigo'
        ParamType = ptUnknown
        Size = 16
      end>
    object tblGradeGroupcd_grade: TLargeintField
      DisplayLabel = 'Grade'
      FieldName = 'cd_grade'
    end
    object tblGradeGroupAnoSemestre: TSmallintField
      DisplayLabel = 'Ano/Sem.'
      DisplayWidth = 10
      FieldName = 'AnoSemestre'
      Origin = 'GradeCurricular.AnoSemestre'
      DisplayFormat = '0000/0'
    end
    object tblGradeGroupCurso: TStringField
      Alignment = taCenter
      DisplayWidth = 15
      FieldName = 'Curso'
      Origin = 'GradeCurricular.Curso'
      Size = 15
    end
    object tblGradeGroupTurno: TStringField
      Alignment = taCenter
      FieldName = 'Turno'
      Origin = 'GradeCurricular.AnoSemestre'
      Size = 1
    end
    object tblGradeGroupSerie: TSmallintField
      FieldName = 'Serie'
      Origin = 'WMESTRE12.GradeCurricular.Serie'
    end
  end
  object dtcGradeGroup: TDataSource
    DataSet = tblGradeGroup
    Left = 734
    Top = 549
  end
  object tblDeptos: TUMZQuery
    Connection = DM.db
    SQL.Strings = (
      'SELECT'
      '   CODIGO,'
      '   DESCRICAO'
      'FROM'
      '   DEPARTAMENTOS'
      'WHERE'
      '   cd_coligada = :cd_coligada'
      'ORDER BY DESCRICAO')
    Params = <
      item
        DataType = ftUnknown
        Name = 'cd_coligada'
        ParamType = ptUnknown
      end>
    Left = 560
    Top = 632
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'cd_coligada'
        ParamType = ptUnknown
      end>
    object tblDeptosCodigo: TSmallintField
      DisplayWidth = 12
      FieldName = 'Codigo'
      Origin = 'Departamentos.Codigo'
    end
    object tblDeptosDescricao: TStringField
      DisplayLabel = 'Descri'#231#227'o'
      FieldName = 'Descricao'
      Size = 255
    end
  end
  object dtcDeptos: TDataSource
    DataSet = tblDeptos
    Left = 592
    Top = 632
  end
  object dtcDisc: TDataSource
    DataSet = tblDisc
    OnStateChange = dtcDiscStateChange
    OnDataChange = dtcDiscDataChange
    Left = 733
    Top = 581
  end
  object tblDisc: TUMZQuery
    Connection = DM.db
    BeforeInsert = tblDiscBeforeInsert
    AfterInsert = tblDiscAfterInsert
    BeforeEdit = tblDiscBeforeEdit
    BeforePost = tblDiscBeforePost
    BeforeDelete = tblDiscBeforeDelete
    OnNewRecord = tblDiscNewRecord
    SQL.Strings = (
      'Select * From Disciplinas'
      'where Curso = :Codigo'
      'Order By Descricao')
    Params = <
      item
        DataType = ftString
        Name = 'Codigo'
        ParamType = ptUnknown
      end>
    Left = 701
    Top = 581
    ParamData = <
      item
        DataType = ftString
        Name = 'Codigo'
        ParamType = ptUnknown
      end>
    object tblDiscDescricao: TStringField
      DisplayLabel = 'Descri'#231#227'o'
      DisplayWidth = 100
      FieldName = 'Descricao'
      Origin = 'Disciplinas.Descricao'
      Size = 255
    end
    object tblDiscCurso: TStringField
      DisplayWidth = 15
      FieldName = 'Curso'
      Origin = 'Disciplinas.Curso'
      Visible = False
      Size = 15
    end
    object tblDiscordem: TSmallintField
      FieldName = 'ordem'
      Origin = 'WMESTRE12.disciplinas.ordem'
    end
    object tblDiscsigla: TStringField
      DisplayLabel = 'Sigla'
      FieldName = 'sigla'
      Origin = 'WMESTRE12.disciplinas.sigla'
      Size = 10
    end
    object tblDisccodigo: TIntegerField
      DisplayLabel = 'C'#243'digo'
      FieldName = 'codigo'
      Origin = 'WMESTRE12.disciplinas.codigo'
    end
    object tblDiscCD_DISCIPLINA_PAI: TStringField
      FieldName = 'CD_DISCIPLINA_PAI'
      Size = 255
    end
    object tblDisccd_disc_mec: TIntegerField
      FieldName = 'cd_disc_mec'
    end
    object tblDiscsn_ementa_padrao: TSmallintField
      FieldName = 'sn_ementa_padrao'
    end
    object tblDiscsn_exporta_moodle: TSmallintField
      FieldName = 'sn_exporta_moodle'
      Required = True
    end
  end
  object tblDisciplinas: TUMZQuery
    Connection = DM.db
    SQL.Strings = (
      'Select * From Disciplinas '
      'Order By Descricao')
    Params = <>
    Left = 884
    Top = 36
    object tblDisciplinasCodigo: TSmallintField
      FieldName = 'Codigo'
      Origin = 'Disciplinas.Codigo'
    end
    object tblDisciplinasCurso: TStringField
      FieldName = 'Curso'
      Origin = 'Disciplinas.Curso'
      Size = 15
    end
    object tblDisciplinasSigla: TStringField
      FieldName = 'Sigla'
      Origin = 'Disciplinas.Sigla'
      Size = 5
    end
    object tblDisciplinasDescricao: TStringField
      FieldName = 'Descricao'
      Origin = 'Disciplinas.Descricao'
      Size = 50
    end
    object tblDisciplinassn_bloqueado: TSmallintField
      FieldName = 'sn_bloqueado'
    end
    object tblDisciplinassn_ementa_padrao: TSmallintField
      FieldName = 'sn_ementa_padrao'
    end
  end
  object dtcDisciplinas: TDataSource
    DataSet = tblDisciplinas
    OnStateChange = dtcDisciplinasStateChange
    Left = 852
    Top = 36
  end
  object qDocumentos: TUMZQuery
    Connection = DM.db
    SQL.Strings = (
      'Select * From Documentos'
      'WHERE'
      'cd_tipo_pessoa IN (1, 2)'
      'ORDER BY documento')
    Params = <>
    Left = 972
    Top = 89
  end
  object qDocumentosNecessarios: TUMZQuery
    Connection = DM.db
    UpdateObject = updDoc
    CachedUpdates = True
    BeforeInsert = qDocumentosNecessariosBeforeInsert
    AfterInsert = qDocumentosNecessariosAfterInsert
    BeforeEdit = qDocumentosNecessariosBeforeEdit
    BeforePost = qDocumentosNecessariosBeforePost
    AfterPost = qDocumentosNecessariosAfterPost
    BeforeDelete = qDocumentosNecessariosBeforeDelete
    SQL.Strings = (
      'Select * '
      'From Documentos_Necessarios, Documentos'
      'WHERE Documentos_Necessarios.Cod_Documento = Documentos.Codigo'
      'AND Documentos.cd_tipo_pessoa IN (1, 2)'
      'AND CURSO = :CD_CURSO')
    Params = <
      item
        DataType = ftUnknown
        Name = 'CD_CURSO'
        ParamType = ptUnknown
      end>
    DataSource = dtcCursosMestre
    Left = 972
    Top = 230
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'CD_CURSO'
        ParamType = ptUnknown
      end>
    object qDocumentosNecessariosCod_Documento: TIntegerField
      FieldName = 'Cod_Documento'
      Origin = 'WMESTRE12.Documentos_Necessarios.Cod_Documento'
    end
    object qDocumentosNecessariosCurso: TStringField
      FieldName = 'Curso'
      Origin = 'WMESTRE12.Documentos_Necessarios.Curso'
      Size = 15
    end
    object qDocumentosNecessariosCodigo: TSmallintField
      FieldName = 'Codigo'
      Origin = 'WMESTRE12.Documentos_Necessarios.Curso'
    end
    object qDocumentosNecessariosDocumento: TStringField
      FieldName = 'Documento'
      Origin = 'WMESTRE12.Documentos_Necessarios.Curso'
      Size = 50
    end
    object qDocumentosNecessariosPrazo: TStringField
      FieldName = 'Prazo'
      Origin = 'WMESTRE12.Documentos_Necessarios.Curso'
      Size = 50
    end
    object qDocumentosNecessariosSigla: TStringField
      FieldName = 'Sigla'
      Origin = 'WMESTRE12.Documentos_Necessarios.Curso'
      Size = 8
    end
    object qDocumentosNecessariossn_obrigatorio: TStringField
      DisplayLabel = 'Necess'#225'rio para Ativa'#231#227'o da Matr'#237'cula'
      FieldName = 'sn_obrigatorio'
      Origin = 'WMESTRE12.documentos_necessarios.sn_obrigatorio'
      FixedChar = True
      Size = 1
    end
    object qDocumentosNecessariosnr_grupo: TSmallintField
      DisplayLabel = 'N'#186' Grupo'
      FieldName = 'nr_grupo'
      Origin = 'WMESTRE12.documentos_necessarios.nr_grupo'
    end
  end
  object dsDocumentos: TDataSource
    DataSet = qDocumentos
    Left = 1004
    Top = 89
  end
  object dsDocumentosNecessarios: TDataSource
    DataSet = qDocumentosNecessarios
    OnStateChange = dsDocumentosNecessariosStateChange
    Left = 1006
    Top = 230
  end
  object updDoc: TZUpdateSQL
    DeleteSQL.Strings = (
      'delete from Documentos_Necessarios'
      'where'
      '  cod_documento = :OLD_cod_documento and'
      '  curso = :OLD_curso')
    InsertSQL.Strings = (
      'insert into Documentos_Necessarios'
      '  (cod_documento, curso, sn_obrigatorio, nr_grupo)'
      'values'
      '  (:cod_documento, :curso, :sn_obrigatorio, :nr_grupo)')
    ModifySQL.Strings = (
      'update Documentos_Necessarios'
      'set'
      '  cod_documento = :cod_documento,'
      '  curso = :curso,'
      '  sn_obrigatorio = :sn_obrigatorio,'
      '  nr_grupo = :nr_grupo'
      'where'
      '  cod_documento = :OLD_cod_documento and'
      '  curso = :OLD_curso')
    UseSequenceFieldForRefreshSQL = False
    Left = 1156
    Top = 113
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'cod_documento'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'curso'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'sn_obrigatorio'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'nr_grupo'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'OLD_cod_documento'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'OLD_curso'
        ParamType = ptUnknown
      end>
  end
  object ImageList1: TImageList
    Left = 276
    Top = 473
    Bitmap = {
      494C010107000900040010001000FFFFFFFFFF10FFFFFFFFFFFFFFFF424D3600
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
      00000000000000000000000000000000000000000000DEE7FF00000000000000
      000000000000736363007B7B7B00949494008C8C8C00A5A5A500D6D6D6000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00009C948C00736B6B0094848400AD9C9C00B59C9C0084737300393939008C8C
      8C00BDBDBD000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000FF000000000000000000000000000000
      000000000000000000000000000000000000000000006B6B6B006B6B6B006B6B
      6B006B6B6B006B6B6B0000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000F7D6BD008484
      84009C9C9C006B6B6B0063635A00A59C84006B6B63006B636300F7C6C600A58C
      8C0031313100A5A5A50000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000FF000000000000000000000000000000
      000000000000000000000000000000000000B5523100D64A2100E75A3900FF63
      5200FF635200D64A2100A53918006B524A006B6B6B006B6B6B006B6B6B006B6B
      6B006B6B6B006B6B6B006B6B6B000000000000000000ADA5D600949494008C8C
      8C007B7B7300FFEFBD00FFF7D600527BFF00DEE7FF00FFF7E700E7E7B500A584
      8400F7C6C60031313100BDBDBD00000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000FF000000FF000000FF0000000000000000000000
      000000000000000000000000000000000000C6421000EF5A4200FF735A00FF7B
      6300C6522900D68C5200FF6B5200EF5A420042B54200299C290052C652004ABD
      4A0039B5390029AD29001873180000000000ADBDFF008C9CCE00BDBDBD009C94
      8400FFEFB500FFFFE700FFF7D600EFE7CE00FFF7E700FFFFFF00FFFFEF008484
      6B00A5848400A58C8C008C8C8C00000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000FF000000FF000000FF0000000000000000000000
      000000000000000000000000000000000000CE5A2900FF6B5A00FF846B00EF84
      5A00FFDEA500FFDEA500FF846B00FF6352006BCE6B00BDDEAD004A9C42006BCE
      6B0052C6520039B539001873180000000000BDBDC600B5B5B50084848400FFF7
      BD00FFF7C600FFE7B500FFE7B500FFE7AD00FFDEAD00FFDEA500FFFFF700FFFF
      F700F7EFC600F7C6C60039393900CECECE000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000FF000000FF000000FF000000FF000000FF00000000000000
      00000000000000000000000000000000000000000000D6633100FF8C6B00EF9C
      7B00BD8C8400FFBD9400FF8C7300B54218007BD67B00000000000000000063C6
      63006BCE6B00299C29000000000000000000A5A5A500D6D6D600EFD6A500FFF7
      C600FFF7C600FFF7C600FFF7BD00FFEFBD00FFE7B500FFDEAD00FFDEA500FFFF
      FF00FFF7EF005A525200947B7B009C9C9C000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000FF000000FF000000FF000000FF000000FF00000000000000
      000000000000000000000000000000000000000000004A4A4A00000000000821
      7B001029940000187B00635A5A00399C39008CE78C00DED6BD00398CB5009CB5
      A50042A54200000000000000000000000000D6D6D600CECECE00FFEFBD00FFFF
      CE00FFFFCE00FFFFCE00FFFFCE00CEBD9400F7C69400FFE7B500FFDEAD00FFF7
      DE00FFFFFF009C9C8400D6B5B500848484000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000FF000000FF000000FF000000FF000000FF000000FF000000FF000000
      000000000000000000000000000000000000181818001010100008296B00184A
      AD00184AB500184AAD0008186B0000000000000000002994F7002994F7002994
      F700105A8C006B6B6B000000000000000000EFEFEF00CECECE0073ADEF00DEEF
      FF0000000000FFFFDE00FFFFD600ADADAD00313131003131310031313100FFE7
      BD00C6CEF7002139A500D6B5B5008C8C8C000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000FF000000000000000000000000000000
      00000000000000000000000000000000000018181800212121002163C600216B
      CE00216BD6002163CE0010429C0000000000218CE70039A5FF0039A5FF0039A5
      FF00319CFF005A6363000000000000000000DEDEDE00EFEFEF00FFEFCE000000
      000000000000FFFFE700FFFFDE00FFFFDE005A5A5200846B5A00FFEFB500FFEF
      CE00FFFFE7007B736B00A5949400ADADAD000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000FF000000000000000000000000000000
      00000000000000000000000000000000000029292900313131002163B500298C
      F7003194FF00298CF700185AC6000000000042ADFF004AB5FF004AB5FF004AAD
      FF0042ADFF00216384000000000000000000DEDEDE00F7F7F700FFD6AD000000
      000000000000FFFFE700FFFFE700FFFFDE00F7F7CE0031313100FFD69C00FFF7
      DE00FFEFC6006363630084848400C6C6C6000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000FF000000000000000000000000000000
      0000000000000000000000000000000000001818180042424200292929001042
      9C00216BDE003194F700105AA5000000000052B5FF0052BDFF0052BDFF0052BD
      FF004AB5FF00107BBD000000000000000000FFFFFF00B5B5B500D6D6D600FFEF
      D60000000000000000000000000000000000FFFFE700FFFFCE005A5A4A00FFE7
      B500A59C84009C9C9C0084848400000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000FF000000000000000000000000000000
      0000000000000000000000000000000000000000000052525200636363009494
      940073737300292929003939390000000000107BBD002184C600398CB5001884
      CE002184C60010638C00000000000000000000000000D6D6D600FFFFFF00DEBD
      9C00FFEFDE0000000000000000000000000000000000FFFFCE00FFF7BD00C6B5
      94007B7B7B008C8C8C00E7E7E700000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000FF000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000636363009494
      94006B6B6B002929290000000000000000001073A50052ADD60084C6E7009CCE
      E7003994C6000000000000000000000000000000000000000000B5B5B500FFFF
      FF00D6D6D600FFDEBD00FFEFD600A5CEEF00F7EFE700FFE7AD0084847B00BDBD
      BD00ADADAD00CECECE0000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000FF000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000001073A5001073A5001073
      A50000000000000000000000000000000000000000000000000000000000CECE
      CE00BDBDBD00F7F7F700DEDEDE00BDBDBD00BDBDBD00D6D6D600BDBDBD00A5A5
      A500E7E7E7000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000F7F7F700EFEFEF00E7E7E700EFEFEF00E7E7E700B5B5B500A5A5A5000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000FFFF007B7B7B00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF0000FFFF00000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000FFFF007B7B7B00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF0000FFFF000000000000000000BDBDBD00BDBDBD00BDBD
      BD00BDBDBD00BDBDBD00BDBDBD00BDBDBD00BDBDBD00BDBDBD00BDBDBD00BDBD
      BD00BDBDBD000000000000000000000000000000000000000000000000000000
      0000000000000000FF000000FF000000FF000000FF000000FF00000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000FF000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000FFFF007B7B7B00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF0000FFFF000000000000000000BDBDBD00000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000BDBDBD00BDBDBD0000000000000000000000000000000000000000000000
      FF000000FF000000FF000000FF000000FF000000FF000000FF000000FF000000
      FF00000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000FF000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000FFFF007B7B7B00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF0000FFFF00000000000000000000000000BDBDBD000000
      0000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00000000000000
      000000000000BDBDBD00BDBDBD000000000000000000000000000000FF000000
      FF000000FF00000000007B7B7B00000000007B7B7B00000000000000FF000000
      FF000000FF000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000FF000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000000000007B7B7B007B7B
      7B0000000000000000007B7B7B00000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000FFFFFF000000
      0000FFFFFF0000000000BDBDBD0000000000000000000000FF000000FF000000
      FF00000000000000000000000000000000000000000000000000000000000000
      FF000000FF000000FF0000000000000000000000000000000000000000000000
      00000000000000000000000000000000FF000000000000000000000000000000
      00000000000000000000000000000000000000000000FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF0000000000000000000000
      00007B7B7B007B7B7B0000FFFF000000000000000000FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF0000000000FFFF
      FF000000000000000000BDBDBD0000000000000000000000FF000000FF000000
      000000000000000000007B7B7B00000000007B7B7B0000000000000000000000
      00000000FF000000FF0000000000000000000000000000000000000000000000
      00000000000000000000000000000000FF000000000000000000000000000000
      00000000000000000000000000000000000000000000FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF0000000000000000000000
      00007B7B7B0000FFFF0000FFFF00000000000000000000000000FFFFFF000000
      000000000000FFFFFF000000000000000000FFFFFF00FFFFFF00FFFFFF000000
      0000FFFFFF0000000000BDBDBD00000000000000FF000000FF00000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000FF000000FF00000000000000000000000000000000000000
      00000000000000000000000000000000FF000000000000000000000000000000
      00000000000000000000000000000000000000000000FFFFFF00000000000000
      0000FFFFFF00000000000000000000000000FFFFFF0000000000000000000000
      00000000FF0000000000000000007B7B7B000000000000000000FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF000000
      0000FFFFFF0000000000BDBDBD00000000000000FF000000FF00000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000FF000000FF00000000000000000000000000000000000000
      00000000FF000000FF000000FF000000FF000000FF000000FF000000FF000000
      00000000000000000000000000000000000000000000FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF0000000000000000000000
      FF000000FF000000FF000000000000000000000000000000000000000000FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00000000000000000000000000000000000000FF000000FF00000000000000
      000000000000000000007B7B7B00000000007B7B7B0000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000FF000000FF000000FF000000FF000000FF00000000000000
      00000000000000000000000000000000000000000000FFFFFF00000000000000
      00000000000000000000FFFFFF0000000000FFFFFF00000000000000FF000000
      FF000000FF000000FF000000FF0000000000000000000000FF00000000000000
      0000FFFFFF000000000000000000000000000000000000000000FFFFFF000000
      000000000000000000000000FF00000000000000FF000000FF00000000000000
      0000000000000000000000008400000000000000840000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000FF000000FF000000FF000000FF000000FF00000000000000
      00000000000000000000000000000000000000000000FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF000000FF000000FF000000
      FF000000FF000000FF000000FF000000FF00000000000000FF0000000000FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF0000000000000000000000FF00000000000000FF000000FF00000000000000
      00000000000000000000000000000000000000000000000000000000FF000000
      FF000000FF000000FF000000FF00000000000000000000000000000000000000
      000000000000000000000000FF000000FF000000FF0000000000000000000000
      00000000000000000000000000000000000000000000FFFFFF00000000000000
      0000FFFFFF000000000000000000000000000000000000000000000000000000
      FF000000FF000000FF000000000000000000000000000000000000000000FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF0000000000FFFFFF000000000000000000000000000000FF000000FF000000
      0000000000000000000000000000000000000000000000000000000000000000
      FF000000FF000000FF000000FF00000000000000000000000000000000000000
      000000000000000000000000FF000000FF000000FF0000000000000000000000
      00000000000000000000000000000000000000000000FFFFFF00FFFFFF00FFFF
      FF00FFFFFF0000000000FFFFFF00FFFFFF000000000000000000000000000000
      FF000000FF000000FF000000000000000000000000000000000000000000FFFF
      FF00000000000000000000000000FFFFFF000000000000000000FFFFFF00FFFF
      FF0000000000FFFFFF000000000000000000000000000000FF000000FF000000
      FF00000000000000000000000000000000000000000000000000000000000000
      00000000FF000000FF000000FF00000000000000000000000000000000000000
      00000000000000000000000000000000FF000000000000000000000000000000
      00000000000000000000000000000000000000000000FFFFFF0000000000BDBD
      BD00FFFFFF0000000000FFFFFF000000000000000000000000007B7B7B000000
      FF000000FF000000FF000000000000000000000000000000000000000000FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF000000000000000000000000000000000000000000000000000000FF000000
      FF000000FF00000000007B7B7B00000000007B7B7B00000000000000FF000000
      FF000000FF000000FF000000FF00000000000000000000000000000000000000
      00000000000000000000000000000000FF000000000000000000000000000000
      00000000000000000000000000000000000000000000FFFFFF00FFFFFF00FFFF
      FF00FFFFFF000000000000000000000000000000FF000000FF000000FF000000
      FF000000FF00000000000000000000000000000000000000000000000000FFFF
      FF00FFFFFF00FFFFFF0000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      FF000000FF000000FF000000FF000000FF000000FF000000FF000000FF000000
      FF0000000000000000000000FF00000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000FF000000FF000000FF000000FF000000FF00000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000424D3E000000000000003E000000
      2800000040000000300000000100010000000000800100000000000000000000
      000000000000000000000000FFFFFF0000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000FEFFFFFFB81F0000FEFFFFFFF0070000
      FC7F83FFC0030000FC7F000180010000F83F000100010000F83F000100000000
      F01F806300000000F01F800700000000E00F018308000000E00F010318000000
      FC7F010318000000FC7F01030F010000FC7F810387810000FC7FC307C0030000
      FC7FFF8FE0070000FC7FFFFFF01F0000FC008007FFFFFC7FFC000003F83FFC7F
      FC000001E00FFC7FFC008010C447FC7F000000008C63FC7F000000009C73FC7F
      000080003FF9E00F000080003EF9E00F002300003C7FF01F000100003C7FF01F
      000000003C41F83F002300009C61F83F0063C0018C71FC7F00C3C001C441FC7F
      0107C007E00DFEFF03FFE3FFF83FFEFF00000000000000000000000000000000
      000000000000}
  end
  object ImageList2: TImageList
    Left = 408
    Top = 398
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
  object tblProfessores: TUMZQuery
    Connection = DM.db
    SQL.Strings = (
      'select p.nm_pessoa, prof.* '
      'from  pessoas p, professores prof'
      'where '
      '  p.cd_pessoa = prof.cd_pessoa'
      'order by nm_pessoa')
    Params = <>
    Left = 749
    Top = 422
    object tblProfessoresnm_pessoa: TStringField
      FieldName = 'nm_pessoa'
      Origin = 'WMESTRE12.professores.cd_pessoa'
      Size = 60
    end
    object tblProfessorescd_pessoa: TIntegerField
      FieldName = 'cd_pessoa'
      Origin = 'WMESTRE12.professores.nm_apelido'
    end
    object tblProfessoresnm_apelido: TStringField
      FieldName = 'nm_apelido'
      Origin = 'WMESTRE12.professores.cd_titulacao'
    end
    object tblProfessorescd_titulacao: TIntegerField
      FieldName = 'cd_titulacao'
      Origin = 'WMESTRE12.professores.cd_area'
    end
    object tblProfessorescd_area: TIntegerField
      FieldName = 'cd_area'
      Origin = 'WMESTRE12.professores.ds_obs_sistema'
    end
    object tblProfessoresds_obs_sistema: TMemoField
      FieldName = 'ds_obs_sistema'
      Origin = 'WMESTRE12.pessoas.nm_pessoa'
      BlobType = ftMemo
      Size = 1
    end
  end
  object updGrade: TZUpdateSQL
    DeleteSQL.Strings = (
      'delete from GradeCurricular'
      'where'
      '  anosemestre = :OLD_anosemestre and'
      '  curso = :OLD_curso and'
      '  disciplina = :OLD_disciplina and'
      '  serie = :OLD_serie and'
      '  turno = :OLD_turno and'
      '  cd_grade = :OLD_cd_grade')
    InsertSQL.Strings = (
      'insert into GradeCurricular'
      
        '  (anosemestre, curso, disciplina, serie, turno, numeroaulas, va' +
        'lor, codigo, '
      
        '   sn_compartilhada, nr_creditos_academicos, cd_grade, cd_disc_c' +
        'ategoria, '
      '   nr_ch_pratica, nr_ch_teorica)'
      'values'
      
        '  (:anosemestre, :curso, :disciplina, :serie, :turno, :numeroaul' +
        'as, :valor, '
      
        '   :codigo, :sn_compartilhada, :nr_creditos_academicos, :cd_grad' +
        'e, :cd_disc_categoria, '
      '   :nr_ch_pratica, :nr_ch_teorica)')
    ModifySQL.Strings = (
      'update GradeCurricular'
      'set'
      '  anosemestre = :anosemestre,'
      '  curso = :curso,'
      '  disciplina = :disciplina,'
      '  serie = :serie,'
      '  turno = :turno,'
      '  numeroaulas = :numeroaulas,'
      '  valor = :valor,'
      '  codigo = :codigo,'
      '  sn_compartilhada = :sn_compartilhada,'
      '  nr_creditos_academicos = :nr_creditos_academicos,'
      '  cd_grade = :cd_grade,'
      '  cd_disc_categoria = :cd_disc_categoria,'
      '  nr_ch_pratica = :nr_ch_pratica,'
      '  nr_ch_teorica = :nr_ch_teorica'
      'where'
      '  anosemestre = :OLD_anosemestre and'
      '  curso = :OLD_curso and'
      '  disciplina = :OLD_disciplina and'
      '  serie = :OLD_serie and'
      '  turno = :OLD_turno and'
      '  cd_grade = :OLD_cd_grade')
    UseSequenceFieldForRefreshSQL = False
    Left = 536
    Top = 224
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'anosemestre'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'curso'
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
        Name = 'turno'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'numeroaulas'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'valor'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'codigo'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'sn_compartilhada'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'nr_creditos_academicos'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'cd_grade'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'cd_disc_categoria'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'nr_ch_pratica'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'nr_ch_teorica'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'OLD_anosemestre'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'OLD_curso'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'OLD_disciplina'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'OLD_serie'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'OLD_turno'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'OLD_cd_grade'
        ParamType = ptUnknown
      end>
  end
  object tblEmentas: TUMZQuery
    Connection = DM.db
    SortedFields = 'ANOSEMESTRE'
    SortType = stDescending
    AfterInsert = tblEmentasAfterInsert
    BeforeEdit = tblEmentasBeforeEdit
    BeforePost = tblEmentasBeforePost
    BeforeDelete = tblEmentasBeforeDelete
    OnNewRecord = tblEmentasNewRecord
    SQL.Strings = (
      'SELECT'
      '   CODIGO,'
      '   CURSO,'
      '   ANOSEMESTRE,'
      '   EMENTA,'
      '   BIBLIOGRAFIA_BASICA,'
      '   BIBLIOGRAFIA_COMPLEMENTAR,'
      '   BIBLIOGRAFIA_SUPLEMENTAR,'
      '   OBJETIVO,'
      '   TX_BIB_BASICA_HTML,'
      '   TX_BIB_COMP_HTML,'
      '   TX_BIB_SUP_HTML'
      'FROM'
      '   DISCIPLINAS_EMENTAS'
      'WHERE'
      '   CODIGO = :CODIGO AND'
      '   CURSO = :CURSO')
    Params = <
      item
        DataType = ftInteger
        Name = 'Codigo'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'Curso'
        ParamType = ptUnknown
      end>
    DataSource = dtcDisc
    IndexFieldNames = 'ANOSEMESTRE Desc'
    Left = 1120
    ParamData = <
      item
        DataType = ftInteger
        Name = 'Codigo'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'Curso'
        ParamType = ptUnknown
      end>
    object tblEmentasCODIGO: TLargeintField
      FieldName = 'CODIGO'
      Required = True
    end
    object tblEmentasCURSO: TStringField
      FieldName = 'CURSO'
      Required = True
      Size = 15
    end
    object tblEmentasANOSEMESTRE: TSmallintField
      FieldName = 'ANOSEMESTRE'
      Required = True
      DisplayFormat = '0000/0'
    end
    object tblEmentasEMENTA: TMemoField
      FieldName = 'EMENTA'
      BlobType = ftMemo
    end
    object tblEmentasBIBLIOGRAFIA_BASICA: TBlobField
      FieldName = 'BIBLIOGRAFIA_BASICA'
    end
    object tblEmentasBIBLIOGRAFIA_COMPLEMENTAR: TBlobField
      FieldName = 'BIBLIOGRAFIA_COMPLEMENTAR'
    end
    object tblEmentasBIBLIOGRAFIA_SUPLEMENTAR: TBlobField
      FieldName = 'BIBLIOGRAFIA_SUPLEMENTAR'
    end
    object tblEmentasOBJETIVO: TMemoField
      FieldName = 'OBJETIVO'
      BlobType = ftMemo
    end
    object tblEmentasTX_BIB_BASICA_HTML: TMemoField
      FieldName = 'TX_BIB_BASICA_HTML'
      BlobType = ftMemo
    end
    object tblEmentasTX_BIB_COMP_HTML: TMemoField
      FieldName = 'TX_BIB_COMP_HTML'
      BlobType = ftMemo
    end
    object tblEmentasTX_BIB_SUP_HTML: TMemoField
      FieldName = 'TX_BIB_SUP_HTML'
      BlobType = ftMemo
    end
  end
  object dsEmentas: TDataSource
    DataSet = tblEmentas
    OnStateChange = dsEmentasStateChange
    Left = 1096
  end
  object tblAvaliacoes_Parametros: TUMZQuery
    Connection = DM.db
    BeforeOpen = tblAvaliacoes_ParametrosBeforeOpen
    SQL.Strings = (
      
        'select * from avaliacoes_parametros where cd_coligada_matriz = :' +
        'cd_coligada_matriz'
      'order by ds_avaliacao')
    Params = <
      item
        DataType = ftUnknown
        Name = 'cd_coligada_matriz'
        ParamType = ptUnknown
      end>
    Left = 396
    Top = 438
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'cd_coligada_matriz'
        ParamType = ptUnknown
      end>
    object tblAvaliacoes_Parametroscd_avaliacao: TSmallintField
      FieldName = 'cd_avaliacao'
      Origin = 'WMESTRE12.avaliacoes_parametros.cd_avaliacao'
    end
    object tblAvaliacoes_Parametrosds_avaliacao: TStringField
      FieldName = 'ds_avaliacao'
      Origin = 'WMESTRE12.avaliacoes_parametros.ds_avaliacao'
      Size = 100
    end
    object tblAvaliacoes_Parametrosnr_avaliacoes: TSmallintField
      FieldName = 'nr_avaliacoes'
      Origin = 'WMESTRE12.avaliacoes_parametros.nr_avaliacoes'
    end
    object tblAvaliacoes_Parametroscd_periodo_avaliacao: TSmallintField
      FieldName = 'cd_periodo_avaliacao'
      Origin = 'WMESTRE12.avaliacoes_parametros.cd_periodo_avaliacao'
    end
    object tblAvaliacoes_Parametrosds_cond_aprov_direta: TStringField
      FieldName = 'ds_cond_aprov_direta'
      Origin = 'WMESTRE12.avaliacoes_parametros.ds_cond_aprov_direta'
      Size = 250
    end
    object tblAvaliacoes_Parametrosds_cond_repro_direta: TStringField
      FieldName = 'ds_cond_repro_direta'
      Origin = 'WMESTRE12.avaliacoes_parametros.ds_cond_repro_direta'
      Size = 250
    end
    object tblAvaliacoes_Parametrosds_formula_media_exame: TStringField
      FieldName = 'ds_formula_media_exame'
      Origin = 'WMESTRE12.avaliacoes_parametros.ds_formula_media_exame'
      Size = 250
    end
    object tblAvaliacoes_Parametrosds_formula_media_segunda: TStringField
      FieldName = 'ds_formula_media_segunda'
      Origin = 'WMESTRE12.avaliacoes_parametros.ds_formula_media_segunda'
      Size = 250
    end
    object tblAvaliacoes_Parametrosds_cond_aprov_exame: TStringField
      FieldName = 'ds_cond_aprov_exame'
      Origin = 'WMESTRE12.avaliacoes_parametros.ds_cond_aprov_exame'
      Size = 250
    end
    object tblAvaliacoes_Parametrosds_cond_aprov_segunda: TStringField
      FieldName = 'ds_cond_aprov_segunda'
      Origin = 'WMESTRE12.avaliacoes_parametros.ds_cond_aprov_segunda'
      Size = 250
    end
    object tblAvaliacoes_Parametrosnr_max_disci_exame: TSmallintField
      FieldName = 'nr_max_disci_exame'
      Origin = 'WMESTRE12.avaliacoes_parametros.nr_max_disci_exame'
    end
    object tblAvaliacoes_Parametrosnr_max_disci_segunda: TSmallintField
      FieldName = 'nr_max_disci_segunda'
      Origin = 'WMESTRE12.avaliacoes_parametros.nr_max_disci_segunda'
    end
    object tblAvaliacoes_Parametrossn_notas: TStringField
      FieldName = 'sn_notas'
      Origin = 'WMESTRE12.avaliacoes_parametros.sn_notas'
      FixedChar = True
      Size = 3
    end
    object tblAvaliacoes_Parametrossn_conceitos: TStringField
      FieldName = 'sn_conceitos'
      Origin = 'WMESTRE12.avaliacoes_parametros.sn_conceitos'
      FixedChar = True
      Size = 3
    end
    object tblAvaliacoes_Parametrossn_descricao: TStringField
      FieldName = 'sn_descricao'
      Origin = 'WMESTRE12.avaliacoes_parametros.sn_descricao'
      FixedChar = True
      Size = 3
    end
    object tblAvaliacoes_Parametrossn_exame: TStringField
      FieldName = 'sn_exame'
      Origin = 'WMESTRE12.avaliacoes_parametros.sn_exame'
      FixedChar = True
      Size = 3
    end
    object tblAvaliacoes_Parametrossn_pi: TStringField
      FieldName = 'sn_pi'
      Origin = 'WMESTRE12.avaliacoes_parametros.sn_pi'
      FixedChar = True
      Size = 3
    end
    object tblAvaliacoes_Parametrossn_segunda_epoca: TStringField
      FieldName = 'sn_segunda_epoca'
      Origin = 'WMESTRE12.avaliacoes_parametros.sn_segunda_epoca'
      FixedChar = True
      Size = 3
    end
    object tblAvaliacoes_Parametrossn_frequencia_global: TStringField
      FieldName = 'sn_frequencia_global'
      Origin = 'WMESTRE12.avaliacoes_parametros.sn_frequencia_global'
      FixedChar = True
      Size = 1
    end
    object tblAvaliacoes_Parametrosds_frequencia_tipo: TStringField
      FieldName = 'ds_frequencia_tipo'
      Origin = 'WMESTRE12.avaliacoes_parametros.ds_frequencia_tipo'
      FixedChar = True
      Size = 1
    end
    object tblAvaliacoes_Parametrosds_formula_media_anual: TMemoField
      FieldName = 'ds_formula_media_anual'
      Origin = 'WMESTRE12.avaliacoes_parametros.ds_formula_media_anual'
      BlobType = ftMemo
      Size = 1
    end
    object tblAvaliacoes_Parametrosds_formula_media_final: TStringField
      FieldName = 'ds_formula_media_final'
      Origin = 'WMESTRE12.avaliacoes_parametros.ds_formula_media_final'
      Size = 250
    end
    object tblAvaliacoes_Parametrossn_recuperacao: TStringField
      FieldName = 'sn_recuperacao'
      Origin = 'WMESTRE12.avaliacoes_parametros.sn_recuperacao'
      FixedChar = True
      Size = 1
    end
    object tblAvaliacoes_Parametrosds_formula_recuperacao: TStringField
      FieldName = 'ds_formula_recuperacao'
      Origin = 'WMESTRE12.avaliacoes_parametros.ds_formula_recuperacao'
      Size = 250
    end
    object tblAvaliacoes_Parametrosnr_casas_decimais: TSmallintField
      FieldName = 'nr_casas_decimais'
      Origin = 'WMESTRE12.avaliacoes_parametros.nr_casas_decimais'
    end
    object tblAvaliacoes_Parametrosds_cond_recuperacao: TStringField
      FieldName = 'ds_cond_recuperacao'
      Origin = 'WMESTRE12.avaliacoes_parametros.ds_cond_recuperacao'
      Size = 250
    end
    object tblAvaliacoes_Parametrosvl_arredondamento: TFloatField
      FieldName = 'vl_arredondamento'
      Origin = 'WMESTRE12.avaliacoes_parametros.vl_arredondamento'
    end
    object tblAvaliacoes_Parametrossn_notas_diario_online: TStringField
      FieldName = 'sn_notas_diario_online'
      Origin = 'WMESTRE12.avaliacoes_parametros.sn_notas_diario_online'
      FixedChar = True
      Size = 1
    end
    object tblAvaliacoes_Parametrossn_notas_diario: TStringField
      FieldName = 'sn_notas_diario'
      Origin = 'WMESTRE12.avaliacoes_parametros.sn_notas_diario'
      FixedChar = True
      Size = 1
    end
    object tblAvaliacoes_Parametrossn_desblo_coorde: TStringField
      FieldName = 'sn_desblo_coorde'
      Origin = 'WMESTRE12.avaliacoes_parametros.sn_desblo_coorde'
      FixedChar = True
      Size = 1
    end
    object tblAvaliacoes_Parametrossn_diario_imp_notas: TStringField
      FieldName = 'sn_diario_imp_notas'
      Origin = 'WMESTRE12.avaliacoes_parametros.sn_diario_imp_notas'
      FixedChar = True
      Size = 1
    end
    object tblAvaliacoes_Parametrossn_diario_imp_freqs: TStringField
      FieldName = 'sn_diario_imp_freqs'
      Origin = 'WMESTRE12.avaliacoes_parametros.sn_diario_imp_freqs'
      FixedChar = True
      Size = 1
    end
    object tblAvaliacoes_Parametrossn_diario_imp_contprog: TStringField
      FieldName = 'sn_diario_imp_contprog'
      Origin = 'WMESTRE12.avaliacoes_parametros.sn_diario_imp_contprog'
      FixedChar = True
      Size = 1
    end
    object tblAvaliacoes_Parametrossn_notas_truncar: TStringField
      FieldName = 'sn_notas_truncar'
      Origin = 'WMESTRE12.avaliacoes_parametros.sn_notas_truncar'
      FixedChar = True
      Size = 1
    end
    object tblAvaliacoes_Parametrosds_nota_exame: TStringField
      FieldName = 'ds_nota_exame'
      Origin = 'WMESTRE12.avaliacoes_parametros.ds_nota_exame'
      Size = 255
    end
    object tblAvaliacoes_Parametrosds_nota_segunda: TStringField
      FieldName = 'ds_nota_segunda'
      Origin = 'WMESTRE12.avaliacoes_parametros.ds_nota_segunda'
      Size = 255
    end
    object tblAvaliacoes_Parametrossn_medias_truncar: TStringField
      FieldName = 'sn_medias_truncar'
      Origin = 'WMESTRE12.avaliacoes_parametros.sn_medias_truncar'
      FixedChar = True
      Size = 1
    end
    object tblAvaliacoes_Parametrossn_anual_truncar: TStringField
      FieldName = 'sn_anual_truncar'
      Origin = 'WMESTRE12.avaliacoes_parametros.sn_anual_truncar'
      FixedChar = True
      Size = 1
    end
    object tblAvaliacoes_Parametroscd_disci_frequencia: TLargeintField
      FieldName = 'cd_disci_frequencia'
      Origin = 'WMESTRE12.avaliacoes_parametros.cd_disci_frequencia'
    end
    object tblAvaliacoes_Parametroscd_coligada: TIntegerField
      FieldName = 'cd_coligada'
      Required = True
    end
  end
  object dtcAvaliacoes_padroes: TDataSource
    AutoEdit = False
    DataSet = tblAvaliacoes_Parametros
    Left = 429
    Top = 438
  end
  object pmQtdDeptos: TPopupMenu
    OnPopup = pmQtdDeptosPopup
    Left = 400
    Top = 160
  end
  object pmQtdTurmas: TPopupMenu
    OnPopup = pmQtdTurmasPopup
    Left = 432
    Top = 244
  end
  object pmQtdGrade: TPopupMenu
    OnPopup = pmQtdGradePopup
    Left = 400
    Top = 264
  end
  object pmQtdDisc: TPopupMenu
    OnPopup = pmQtdDiscPopup
    Left = 760
    Top = 328
  end
  object pmQtdDocumentosNecessarios: TPopupMenu
    OnPopup = pmQtdDocumentosNecessariosPopup
    Left = 640
    Top = 320
  end
  object pmQtdGrades: TPopupMenu
    OnPopup = pmQtdGradesPopup
    Left = 280
    Top = 304
  end
  object qyAtosOficiais: TUMZQuery
    Connection = DM.db
    BeforeEdit = qyAtosOficiaisBeforeEdit
    BeforePost = qyAtosOficiaisBeforePost
    BeforeDelete = qyAtosOficiaisBeforeDelete
    OnNewRecord = qyAtosOficiaisNewRecord
    SQL.Strings = (
      'SELECT'
      #9'*'
      'FROM'
      #9'cursos_atos_oficiais'
      'WHERE'
      #9'cd_curso = :curso'
      'ORDER BY'
      '                 nr_anosemestre DESC')
    Params = <
      item
        DataType = ftUnknown
        Name = 'curso'
        ParamType = ptUnknown
      end>
    Left = 464
    Top = 336
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'curso'
        ParamType = ptUnknown
      end>
    object qyAtosOficiaiscd_curso: TStringField
      FieldName = 'cd_curso'
      Origin = 'WMESTRE12.cursos_atos_oficiais.cd_curso'
      Size = 15
    end
    object qyAtosOficiaisdt_ato: TDateTimeField
      FieldName = 'dt_ato'
      Origin = 'WMESTRE12.cursos_atos_oficiais.dt_ato'
      DisplayFormat = 'dd/mm/yyyy'
    end
    object qyAtosOficiaisds_titulo_ato: TStringField
      DisplayWidth = 255
      FieldName = 'ds_titulo_ato'
      Origin = 'WMESTRE12.cursos_atos_oficiais.ds_titulo_ato'
      Size = 255
    end
    object qyAtosOficiaisds_ato: TMemoField
      DisplayWidth = 10000
      FieldName = 'ds_ato'
      Origin = 'WMESTRE12.cursos_atos_oficiais.ds_ato'
      BlobType = ftMemo
    end
    object qyAtosOficiaissn_impressao: TStringField
      FieldName = 'sn_impressao'
      Origin = 'WMESTRE12.cursos_atos_oficiais.sn_impressao'
      FixedChar = True
      Size = 1
    end
    object qyAtosOficiaisnr_anosemestre: TLargeintField
      FieldName = 'nr_anosemestre'
      Origin = 'WMESTRE12.cursos_atos_oficiais.nr_anosemestre'
    end
    object qyAtosOficiaiscd_coligada: TSmallintField
      FieldName = 'cd_coligada'
    end
    object qyAtosOficiaisnm_coligada: TStringField
      FieldKind = fkLookup
      FieldName = 'nm_coligada'
      LookupDataSet = qyColigadasAtosOficiais
      LookupKeyFields = 'cd_coligada'
      LookupResultField = 'nm_coligada'
      KeyFields = 'cd_coligada'
      Size = 255
      Lookup = True
    end
  end
  object srcAtosOficiais: TDataSource
    DataSet = qyAtosOficiais
    Left = 496
    Top = 336
  end
  object pmQtdAtosOficiais: TPopupMenu
    OnPopup = pmQtdAtosOficiaisPopup
    Left = 360
    Top = 459
  end
  object qyCampus: TUMZQuery
    Connection = DM.db
    SQL.Strings = (
      'SELECT'
      '   *'
      'FROM'
      '   campus')
    Params = <>
    Left = 560
    Top = 600
    object qyCampuscd_campus: TIntegerField
      FieldName = 'cd_campus'
      Origin = 'WMESTRE12.campus.cd_campus'
    end
    object qyCampusds_endereco: TStringField
      FieldName = 'ds_endereco'
      Origin = 'WMESTRE12.campus.ds_endereco'
      Size = 255
    end
    object qyCampusnr_numero: TIntegerField
      FieldName = 'nr_numero'
      Origin = 'WMESTRE12.campus.nr_numero'
    end
    object qyCampusds_bairro: TStringField
      FieldName = 'ds_bairro'
      Origin = 'WMESTRE12.campus.ds_bairro'
      Size = 100
    end
    object qyCampusds_cidade: TStringField
      FieldName = 'ds_cidade'
      Origin = 'WMESTRE12.campus.ds_cidade'
      Size = 100
    end
    object qyCampusds_estado: TStringField
      FieldName = 'ds_estado'
      Origin = 'WMESTRE12.campus.ds_estado'
      FixedChar = True
      Size = 3
    end
    object qyCampuscd_pessoa_coordenador: TIntegerField
      FieldName = 'cd_pessoa_coordenador'
      Origin = 'WMESTRE12.campus.cd_pessoa_coordenador'
    end
    object qyCampusds_codigo: TStringField
      FieldName = 'ds_codigo'
      Origin = 'WMESTRE12.campus.ds_codigo'
      Size = 50
    end
  end
  object srcCampus: TDataSource
    DataSet = qyCampus
    Left = 592
    Top = 600
  end
  object popPreRequisito: TPopupMenu
    OnPopup = popPreRequisitoPopup
    Left = 416
    Top = 544
  end
  object qyInstru: TUMZQuery
    Connection = DM.db
    SQL.Strings = (
      'SELECT'
      '   cd_doc,'
      '   ds_titulo'
      'FROM'
      '   cursos_docs_online'
      'WHERE'
      '   nr_anosemestre = :anosemestre AND'
      '   cd_tipo_doc = '#39'I'#39)
    Params = <
      item
        DataType = ftUnknown
        Name = 'anosemestre'
        ParamType = ptUnknown
      end>
    Left = 560
    Top = 160
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'anosemestre'
        ParamType = ptUnknown
      end>
    object qyInstrucd_doc: TSmallintField
      FieldName = 'cd_doc'
      Origin = 'WMESTRE12.cursos_docs_online.cd_doc'
    end
    object qyInstruds_titulo: TStringField
      FieldName = 'ds_titulo'
      Origin = 'WMESTRE12.cursos_docs_online.ds_titulo'
      Size = 200
    end
  end
  object qyEdital: TUMZQuery
    Connection = DM.db
    SQL.Strings = (
      'SELECT'
      '   cd_doc,'
      '   ds_titulo'
      'FROM'
      '   cursos_docs_online'
      'WHERE'
      '   nr_anosemestre = :anosemestre AND'
      '   cd_tipo_doc = '#39'E'#39)
    Params = <
      item
        DataType = ftUnknown
        Name = 'anosemestre'
        ParamType = ptUnknown
      end>
    Left = 528
    Top = 160
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'anosemestre'
        ParamType = ptUnknown
      end>
    object qyEditalcd_doc: TSmallintField
      FieldName = 'cd_doc'
      Origin = 'WMESTRE12.cursos_docs_online.cd_doc'
    end
    object qyEditalds_titulo: TStringField
      FieldName = 'ds_titulo'
      Origin = 'WMESTRE12.cursos_docs_online.ds_titulo'
      Size = 200
    end
  end
  object qyRegimento: TUMZQuery
    Connection = DM.db
    SQL.Strings = (
      'SELECT'
      '   cd_doc,'
      '   ds_titulo'
      'FROM'
      '   cursos_docs_online'
      'WHERE'
      '   nr_anosemestre = :anosemestre AND'
      '   cd_tipo_doc = '#39'R'#39)
    Params = <
      item
        DataType = ftUnknown
        Name = 'anosemestre'
        ParamType = ptUnknown
      end>
    Left = 496
    Top = 160
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'anosemestre'
        ParamType = ptUnknown
      end>
    object qyRegimentocd_doc: TSmallintField
      FieldName = 'cd_doc'
      Origin = 'WMESTRE12.cursos_docs_online.cd_doc'
    end
    object qyRegimentods_titulo: TStringField
      FieldName = 'ds_titulo'
      Origin = 'WMESTRE12.cursos_docs_online.ds_titulo'
      Size = 200
    end
  end
  object dsInstru: TDataSource
    DataSet = qyInstru
    Left = 968
    Top = 144
  end
  object dsEdital: TDataSource
    DataSet = qyEdital
    Left = 968
    Top = 168
  end
  object dsRegimento: TDataSource
    DataSet = qyRegimento
    Left = 968
    Top = 120
  end
  object qyConta: TUMZQuery
    Connection = DM.db
    SQL.Strings = (
      'SELECT '
      '   cd_caixa, ds_caixa'
      'FROM'
      '   fin_cadastro_contas'
      'WHERE'
      
        '  ((cd_coligada = :cd_coligada) OR (sn_todas_coligadas = 1) ) AN' +
        'D (sn_ativa like '#39'S'#39')'
      'ORDER BY'
      '   ds_caixa')
    Params = <
      item
        DataType = ftInteger
        Name = 'cd_coligada'
        ParamType = ptUnknown
      end>
    DataSource = dtcTurmas
    Left = 528
    Top = 387
    ParamData = <
      item
        DataType = ftInteger
        Name = 'cd_coligada'
        ParamType = ptUnknown
      end>
    object qyContacd_caixa: TIntegerField
      FieldName = 'cd_caixa'
    end
    object qyContads_caixa: TStringField
      FieldName = 'ds_caixa'
      Origin = 'WMESTRE12.fin_cadastro_contas.ds_caixa'
      Size = 255
    end
  end
  object qyColigada: TUMZQuery
    Connection = DM.db
    SQL.Strings = (
      'SELECT'
      '  *'
      'FROM'
      ' (SELECT'
      '    0 AS cd_coligada,'
      '    '#39'Todas as Unidades de Ensino'#39' AS nm_coligada,'
      '    0 AS nr_ordem'
      '  FROM dual'
      '  UNION'
      '  SELECT'
      '    cd_coligada, nm_coligada, 1'
      '  FROM'
      '    coligadas ) tabela'
      'ORDER BY nr_ordem, nm_coligada')
    Params = <>
    Left = 80
    Top = 163
    object qyColigadanm_coligada: TStringField
      FieldName = 'nm_coligada'
      Origin = 'WMESTRE12.coligadas.nm_coligada'
      Size = 50
    end
    object qyColigadacd_coligada: TLargeintField
      FieldName = 'cd_coligada'
    end
  end
  object qyDiscCat: TUMZQuery
    Connection = DM.db
    BeforeEdit = qyAtosOficiaisBeforeEdit
    BeforePost = qyAtosOficiaisBeforePost
    OnNewRecord = qyAtosOficiaisNewRecord
    SQL.Strings = (
      'SELECT'
      #9'*'
      'FROM'
      #9'disciplinas_categorias'
      'ORDER BY'
      '   ds_categoria')
    Params = <>
    Left = 632
    Top = 384
    object qyDiscCatcd_categoria: TIntegerField
      FieldName = 'cd_categoria'
      Origin = 'WMESTRE12.disciplinas_categorias.cd_categoria'
    end
    object qyDiscCatds_categoria: TStringField
      FieldName = 'ds_categoria'
      Origin = 'WMESTRE12.disciplinas_categorias.ds_categoria'
      Size = 255
    end
  end
  object dtcDisCat: TDataSource
    DataSet = qyDiscCat
    Left = 600
    Top = 424
  end
  object qUnidadesCertificadoras: TUMZQuery
    Connection = DM.db
    SQL.Strings = (
      'select'
      '  nm_instituicao,'
      '  ds_endereco,'
      '  ds_complemento,'
      '  ds_bairro,'
      '  ds_cidade,'
      '  ds_estado,'
      '  ds_cep,'
      '  ds_diretor,'
      '  ds_tipo,'
      '  ds_telefone1,'
      '  ds_telefone2,'
      '  ds_email,'
      '  ds_site,'
      '  sn_educacao_infantil,'
      '  sn_ensino_fundamental,'
      '  sn_ensino_medio,'
      '  sn_ensino_superior,'
      '  sn_cursos_profissionalizantes,'
      '  sn_ensino_especial,'
      '  sn_unidade_certificadora,'
      '  cd_instituicao'
      'from'
      '  instituicoes_ensino'
      'where'
      '  sn_unidade_certificadora = 1')
    Params = <>
    Left = 288
    Top = 536
    object qUnidadesCertificadorasnm_instituicao: TStringField
      FieldName = 'nm_instituicao'
      Origin = 'WMESTRE12.instituicoes_ensino.nm_instituicao'
      Size = 80
    end
    object qUnidadesCertificadorasds_endereco: TStringField
      FieldName = 'ds_endereco'
      Origin = 'WMESTRE12.instituicoes_ensino.ds_endereco'
      Size = 80
    end
    object qUnidadesCertificadorasds_complemento: TStringField
      FieldName = 'ds_complemento'
      Origin = 'WMESTRE12.instituicoes_ensino.ds_complemento'
      Size = 50
    end
    object qUnidadesCertificadorasds_bairro: TStringField
      FieldName = 'ds_bairro'
      Origin = 'WMESTRE12.instituicoes_ensino.ds_bairro'
      Size = 50
    end
    object qUnidadesCertificadorasds_cidade: TStringField
      FieldName = 'ds_cidade'
      Origin = 'WMESTRE12.instituicoes_ensino.ds_cidade'
      Size = 50
    end
    object qUnidadesCertificadorasds_estado: TStringField
      FieldName = 'ds_estado'
      Origin = 'WMESTRE12.instituicoes_ensino.ds_estado'
      FixedChar = True
      Size = 3
    end
    object qUnidadesCertificadorasds_cep: TStringField
      FieldName = 'ds_cep'
      Origin = 'WMESTRE12.instituicoes_ensino.ds_cep'
      Size = 8
    end
    object qUnidadesCertificadorasds_diretor: TStringField
      FieldName = 'ds_diretor'
      Origin = 'WMESTRE12.instituicoes_ensino.ds_diretor'
      Size = 80
    end
    object qUnidadesCertificadorasds_tipo: TStringField
      FieldName = 'ds_tipo'
      Origin = 'WMESTRE12.instituicoes_ensino.ds_tipo'
      FixedChar = True
      Size = 1
    end
    object qUnidadesCertificadorasds_telefone1: TStringField
      FieldName = 'ds_telefone1'
      Origin = 'WMESTRE12.instituicoes_ensino.ds_telefone1'
      Size = 25
    end
    object qUnidadesCertificadorasds_telefone2: TStringField
      FieldName = 'ds_telefone2'
      Origin = 'WMESTRE12.instituicoes_ensino.ds_telefone2'
      Size = 25
    end
    object qUnidadesCertificadorasds_email: TStringField
      FieldName = 'ds_email'
      Origin = 'WMESTRE12.instituicoes_ensino.ds_email'
      Size = 100
    end
    object qUnidadesCertificadorasds_site: TStringField
      FieldName = 'ds_site'
      Origin = 'WMESTRE12.instituicoes_ensino.ds_site'
      Size = 100
    end
    object qUnidadesCertificadorassn_educacao_infantil: TStringField
      FieldName = 'sn_educacao_infantil'
      Origin = 'WMESTRE12.instituicoes_ensino.sn_educacao_infantil'
      FixedChar = True
      Size = 1
    end
    object qUnidadesCertificadorassn_ensino_fundamental: TStringField
      FieldName = 'sn_ensino_fundamental'
      Origin = 'WMESTRE12.instituicoes_ensino.sn_ensino_fundamental'
      FixedChar = True
      Size = 1
    end
    object qUnidadesCertificadorassn_ensino_medio: TStringField
      FieldName = 'sn_ensino_medio'
      Origin = 'WMESTRE12.instituicoes_ensino.sn_ensino_medio'
      FixedChar = True
      Size = 1
    end
    object qUnidadesCertificadorassn_ensino_superior: TStringField
      FieldName = 'sn_ensino_superior'
      Origin = 'WMESTRE12.instituicoes_ensino.sn_ensino_superior'
      FixedChar = True
      Size = 1
    end
    object qUnidadesCertificadorassn_cursos_profissionalizantes: TStringField
      FieldName = 'sn_cursos_profissionalizantes'
      Origin = 'WMESTRE12.instituicoes_ensino.sn_cursos_profissionalizantes'
      FixedChar = True
      Size = 1
    end
    object qUnidadesCertificadorassn_ensino_especial: TStringField
      FieldName = 'sn_ensino_especial'
      Origin = 'WMESTRE12.instituicoes_ensino.sn_ensino_especial'
      FixedChar = True
      Size = 1
    end
    object qUnidadesCertificadorassn_unidade_certificadora: TSmallintField
      FieldName = 'sn_unidade_certificadora'
      Origin = 'WMESTRE12.instituicoes_ensino.sn_unidade_certificadora'
    end
    object qUnidadesCertificadorascd_instituicao: TIntegerField
      FieldName = 'cd_instituicao'
      Required = True
    end
  end
  object dsUnidadesCertificadoras: TDataSource
    DataSet = qUnidadesCertificadoras
    Left = 323
    Top = 536
  end
  object qTurmasConvenios: TUMZQuery
    Connection = DM.db
    SQL.Strings = (
      'select ie.nm_instituicao, tc.* from'
      'turmas_convenios tc'
      'inner join turmas on ( '
      'tc.turma = turmas.codigo and '
      'tc.anosemestre=turmas.anosemestre and  '
      'tc.curso=turmas.curso'
      ')'
      
        'inner join instituicoes_ensino ie on ( tc.cd_instituicao = ie.cd' +
        '_instituicao )'
      'where turmas.codigo=:turma and '
      'turmas.anosemestre=:anosemestre and'
      'turmas.curso=:curso'
      'order by  ie.nm_instituicao asc')
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
        Name = 'curso'
        ParamType = ptUnknown
      end>
    Left = 1096
    Top = 304
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
        Name = 'curso'
        ParamType = ptUnknown
      end>
  end
  object dsTurmasConvenios: TDataSource
    AutoEdit = False
    DataSet = qTurmasConvenios
    Left = 1072
    Top = 304
  end
  object qConvenios: TUMZQuery
    Connection = DM.db
    Params = <>
    Left = 1128
    Top = 216
  end
  object popPreRequisitoEspecial: TPopupMenu
    OnPopup = popPreRequisitoEspecialPopup
    Left = 464
    Top = 568
  end
  object qyAtualizarColigadasTurmas: TUMZQuery
    Connection = DM.db
    Params = <>
    SQLList.Strings = (
      
        'mysql-5=UPDATE '#13#10'    turmas t '#13#10'    INNER JOIN cursos c ON (t.cu' +
        'rso = c.codigo AND t.anosemestre = c.anosemestre)'#13#10'    INNER JOI' +
        'N departamentos d ON (d.codigo = c.depto)'#13#10'SET '#13#10'    t.cd_coliga' +
        'da = d.cd_coligada'
      
        'oracle=DECLARE'#13#10'   CURSOR curTurmas IS SELECT CODIGO, ANOSEMESTR' +
        'E, CURSO FROM TURMAS;'#13#10'BEGIN'#13#10'   FOR linha IN curTurmas LOOP'#13#10'  ' +
        '    UPDATE TURMAS'#13#10'      SET CD_COLIGADA = ('#13#10'         SELECT D.' +
        'CD_COLIGADA'#13#10'         FROM'#13#10'            CURSOS C,'#13#10'            D' +
        'EPARTAMENTOS D'#13#10'         WHERE'#13#10'            C.DEPTO = D.CODIGO A' +
        'ND'#13#10'            C.CODIGO = linha.CURSO AND'#13#10'            C.ANOSEM' +
        'ESTRE = linha.ANOSEMESTRE AND'#13#10'            ROWNUM < 2'#13#10'      )'#13#10 +
        '      WHERE'#13#10'         CODIGO = linha.CODIGO AND'#13#10'         ANOSEM' +
        'ESTRE = linha.ANOSEMESTRE;'#13#10'   END LOOP;'#13#10'END;')
    Left = 344
    Top = 424
  end
  object qyAtualizarColigadasMensalidades: TUMZQuery
    Connection = DM.db
    Params = <>
    SQLList.Strings = (
      
        'mysql-5=UPDATE '#13#10'   mensalidades m'#13#10'   INNER JOIN cursos c ON (m' +
        '.curso = c.codigo AND m.anosemestre = c.anosemestre)'#13#10'   INNER J' +
        'OIN departamentos d ON (d.codigo = c.depto)'#13#10'SET'#13#10'   m.cd_coliga' +
        'da = d.cd_coligada'#13#10'WHERE '#13#10'   m.situacao in (2, 10)'
      
        'oracle=MERGE INTO mensalidades m USING'#13#10'   (SELECT '#13#10#9#9#9'm.cd_men' +
        'salidade as cd_mensalidade,'#13#10#9#9#9'd.cd_coligada as cd_coligada'#13#10#9' ' +
        ' FROM'#13#10#9#9#9'mensalidades m, '#13#10#9#9#9'cursos c,'#13#10#9#9#9'departamentos d'#13#10#9#9 +
        'WHERE'#13#10#9#9#9'd.codigo = c.depto AND'#13#10#9#9#9'm.curso = c.codigo AND '#13#10#9#9 +
        #9'm.anosemestre = c.anosemestre AND'#13#10#9#9#9'm.situacao IN (2, 10)) m2' +
        ' ON (m.cd_mensalidade = m2.cd_mensalidade) '#13#10'    WHEN MATCHED TH' +
        'EN '#13#10'       UPDATE SET m.cd_coligada = m2.cd_coligada')
    Left = 312
    Top = 424
  end
  object qryUpdateGrade: TUMZQuery
    Connection = DM.db
    Params = <>
    SQLList.Strings = (
      
        'oracle=MERGE INTO FICHAINDIVIDUAL F USING ('#13#10#9'SELECT'#13#10#9#9'F.ID_FIC' +
        'HAINDIVIDUAL,'#13#10#9#9'G.NR_ANO_INICIAL||G.CD_CURSO||lpad(GD.NR_SERIE,' +
        '2,0)||T.TURNO||lpad(GD.CD_DISCIPLINA,5,0) CODIGO'#9#9#13#10#9'FROM'#13#10#9#9'FIC' +
        'HAINDIVIDUAL F'#13#10#9'  INNER JOIN TURMAS T ON (T.CODIGO = F.TURMA an' +
        'd F.ANOSEMESTRE = T.ANOSEMESTRE)'#13#10#9'  INNER JOIN GRADES G ON (G.C' +
        'D_GRADE = T.CD_GRADE and T.CURSO = G.CD_CURSO)'#13#10#9'  INNER JOIN GR' +
        'ADES_DISCIPLINAS GD ON (GD.CD_GRADE = G.CD_GRADE AND GD.CD_CURSO' +
        ' = F.CURSO AND GD.CD_DISCIPLINA = F.DISCIPLINA)'#13#10#9'WHERE'#13#10#9#9'F.COD' +
        'IGOGRADE <> CODIGO'#13#10') F2 ON (F.ID_FICHAINDIVIDUAL = F2.ID_FICHAI' +
        'NDIVIDUAL)'#13#10#9'WHEN MATCHED THEN'#13#10#9#9'UPDATE SET F.CODIGOGRADE = F2.' +
        'CODIGO'
      
        'mysql-5=UPDATE IGNORE'#13#10#9'fichaindividual as f'#13#10#9'INNER JOIN turmas' +
        ' as t ON (f.turma = t.codigo and f.anosemestre = t.anosemestre)'#13 +
        #10#9'INNER JOIN GRADES g ON (g.cd_grade = t.cd_grade and t.curso = ' +
        'g.CD_CURSO)'#13#10#9'INNER JOIN grades_disciplinas gd ON (gd.CD_GRADE =' +
        ' g.CD_GRADE AND gd.CD_CURSO = f.curso AND gd.CD_DISCIPLINA = f.d' +
        'isciplina)'#13#10'SET'#13#10#9'f.codigograde = CONCAT(t.anosemestre, t.cd_gra' +
        'de, f.CURSO, LPAD(t.serie,2,0),t.turno, LPAD(f.DISCIPLINA,10,0))' +
        #13#10'WHERE'#13#10#9'f.codigograde != CONCAT(t.anosemestre, t.cd_grade, f.C' +
        'URSO, LPAD(t.serie,2,0),t.turno, LPAD(f.DISCIPLINA,10,0))')
    Left = 336
    Top = 176
  end
  object dtcColigadas: TDataSource
    DataSet = qyColigada
    OnDataChange = dtcColigadasDataChange
    Left = 112
    Top = 164
  end
  object qyCursosMestre: TUMZQuery
    Connection = DM.db
    SortedFields = 'DS_CURSO'
    UpdateObject = updCursosMestre
    BeforeInsert = qyCursosMestreBeforeInsert
    BeforeEdit = qyCursosMestreBeforeEdit
    BeforePost = qyCursosMestreBeforePost
    BeforeDelete = qyCursosMestreBeforeDelete
    SQL.Strings = (
      'SELECT'
      '  DISTINCT CM.CD_CURSO,'
      #9'CM.DS_CURSO,'
      #9'CM.DS_APELIDO,'
      #9'CM.NR_GRAU,'
      #9'CM.DS_HABILITACAO,'
      #9'CM.SN_ATIVO,'
      #9'CM.NR_RELEVANCIA,'
      #9'CM.CD_TITULACAO,'
      '  CM.NR_INCREMENTO,'
      '  CC.CD_COLIGADA,'
      '  CC.CD_DEPTO,'
      '  CC.SN_ATIVO SN_ATIVO_COLIGADA,'
      '  CM.CD_AREA,'
      '  CM.SN_NAO_VERIF_DISC_APROVADAS'
      'FROM'
      #9'CURSOS_MESTRE CM'
      #9
      #9#9'LEFT JOIN CURSOS_COLIGADAS CC ON'
      #9#9#9'(CM.CD_CURSO = CC.CD_CURSO)'
      ''
      #9#9#9'JOIN NU_GRUPOS_PESSOAS GP ON'
      '            (CC.CD_COLIGADA = GP.CD_COLIGADA)'
      'WHERE'
      #9'GP.CD_PESSOA = :CD_PESSOA AND'
      #9'('
      '      CC.CD_COLIGADA IS NULL'
      #9#9' OR'
      #9#9'EXISTS ('
      #9#9#9'SELECT'
      #9#9#9#9'C.CD_COLIGADA'
      #9#9#9'FROM'
      #9#9#9#9'COLIGADAS C'
      #9#9#9'WHERE'
      #9#9#9#9'CC.CD_COLIGADA = C.CD_COLIGADA OR'
      #9#9#9#9'GP.CD_COLIGADA = C.CD_COLIGADA_MATRIZ'
      #9#9')'
      #9')'
      'GROUP BY'
      '   CM.CD_CURSO')
    Params = <
      item
        DataType = ftUnknown
        Name = 'CD_PESSOA'
        ParamType = ptUnknown
      end>
    IndexFieldNames = 'DS_CURSO Asc'
    Left = 21
    Top = 425
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'CD_PESSOA'
        ParamType = ptUnknown
      end>
    object qyCursosMestreCD_CURSO: TStringField
      FieldName = 'CD_CURSO'
      Size = 15
    end
    object qyCursosMestreDS_CURSO: TStringField
      FieldName = 'DS_CURSO'
      Size = 255
    end
    object qyCursosMestreDS_APELIDO: TStringField
      FieldName = 'DS_APELIDO'
      Size = 255
    end
    object qyCursosMestreNR_GRAU: TSmallintField
      FieldName = 'NR_GRAU'
    end
    object qyCursosMestreDS_HABILITACAO: TStringField
      FieldName = 'DS_HABILITACAO'
      Size = 255
    end
    object qyCursosMestreSN_ATIVO: TStringField
      FieldName = 'SN_ATIVO'
      Size = 1
    end
    object qyCursosMestreNR_RELEVANCIA: TSmallintField
      FieldName = 'NR_RELEVANCIA'
      Required = True
    end
    object qyCursosMestreCD_TITULACAO: TIntegerField
      FieldName = 'CD_TITULACAO'
    end
    object qyCursosMestreDS_TITULACAO: TStringField
      FieldKind = fkLookup
      FieldName = 'DS_TITULACAO'
      LookupDataSet = qyTitulacao
      LookupKeyFields = 'cd_titulacao'
      LookupResultField = 'ds_titulacao'
      KeyFields = 'CD_TITULACAO'
      Lookup = True
    end
    object qyCursosMestreCD_COLIGADA: TSmallintField
      FieldName = 'CD_COLIGADA'
    end
    object qyCursosMestreCD_DEPTO: TSmallintField
      FieldName = 'CD_DEPTO'
    end
    object qyCursosMestreSN_ATIVO_COLIGADA: TSmallintField
      FieldName = 'SN_ATIVO_COLIGADA'
      Required = True
    end
    object qyCursosMestreNR_INCREMENTO: TIntegerField
      FieldName = 'NR_INCREMENTO'
    end
    object qyCursosMestreCD_AREA: TIntegerField
      FieldName = 'CD_AREA'
    end
    object qyCursosMestreAREA_ATUACAO: TStringField
      FieldKind = fkLookup
      FieldName = 'AREA_ATUACAO'
      LookupDataSet = qryAreasAtuacao
      LookupKeyFields = 'cd_area'
      LookupResultField = 'ds_area'
      KeyFields = 'CD_AREA'
      Size = 255
      Lookup = True
    end
    object qyCursosMestreSN_NAO_VERIF_DISC_APROVADAS: TSmallintField
      FieldName = 'SN_NAO_VERIF_DISC_APROVADAS'
    end
  end
  object dtcCursosMestre: TDataSource
    DataSet = qyCursosMestre
    OnStateChange = dtcCursosMestreStateChange
    OnDataChange = dtcCursosMestreDataChange
    Left = 93
    Top = 425
  end
  object qyCursosColigadas: TUMZQuery
    Connection = DM.db
    BeforeInsert = qyCursosColigadasBeforeInsert
    BeforeEdit = qyCursosColigadasBeforeEdit
    AfterPost = qyCursosColigadasAfterPost
    BeforeDelete = qyCursosColigadasBeforeDelete
    SQL.Strings = (
      'SELECT '
      '   * '
      'FROM '
      '   CURSOS_COLIGADAS'
      'WHERE'
      '   CD_COLIGADA = :COLIGADA AND'
      '   CD_CURSO = :CURSO')
    Params = <
      item
        DataType = ftUnknown
        Name = 'COLIGADA'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'CURSO'
        ParamType = ptUnknown
      end>
    Left = 229
    Top = 91
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'COLIGADA'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'CURSO'
        ParamType = ptUnknown
      end>
    object qyCursosColigadasCD_CURSO: TStringField
      FieldName = 'CD_CURSO'
      Required = True
      Size = 15
    end
    object qyCursosColigadasCD_CURSO_EQUIVALENTE: TStringField
      FieldName = 'CD_CURSO_EQUIVALENTE'
      Size = 15
    end
    object qyCursosColigadasCD_GRADE: TIntegerField
      FieldName = 'CD_GRADE'
    end
    object qyCursosColigadasDS_CONTRATO: TStringField
      FieldName = 'DS_CONTRATO'
      Size = 30
    end
    object qyCursosColigadasNR_CARGA_HORARIA: TFloatField
      FieldName = 'NR_CARGA_HORARIA'
    end
    object qyCursosColigadasCD_COLIGADA: TIntegerField
      FieldName = 'CD_COLIGADA'
      Required = True
    end
    object qyCursosColigadasCD_DEPTO: TIntegerField
      FieldName = 'CD_DEPTO'
      Required = True
    end
    object qyCursosColigadasNR_DIAS_LETIVOS: TFloatField
      FieldName = 'NR_DIAS_LETIVOS'
    end
    object qyCursosColigadasNR_DURACAO_AULA: TFloatField
      FieldName = 'NR_DURACAO_AULA'
    end
    object qyCursosColigadasCD_CURSO_MEC: TIntegerField
      FieldName = 'CD_CURSO_MEC'
    end
    object qyCursosColigadasCD_GRAU_MEC: TStringField
      FieldName = 'CD_GRAU_MEC'
    end
    object qyCursosColigadasCD_HABILITACAO_MEC: TIntegerField
      FieldName = 'CD_HABILITACAO_MEC'
    end
    object qyCursosColigadasDS_NOME_ETAPA: TStringField
      FieldName = 'DS_NOME_ETAPA'
    end
    object qyCursosColigadasNR_SERIES: TIntegerField
      FieldName = 'NR_SERIES'
    end
    object qyCursosColigadasME_OBSERVACOES: TMemoField
      FieldName = 'ME_OBSERVACOES'
      BlobType = ftMemo
    end
    object qyCursosColigadasDS_REQUERIMENTO: TStringField
      FieldName = 'DS_REQUERIMENTO'
      Size = 50
    end
    object qyCursosColigadasCD_GRADE_LK: TLargeintField
      FieldKind = fkLookup
      FieldName = 'CD_GRADE_LK'
      LookupDataSet = qyListaGrades
      LookupKeyFields = 'CD_GRADE'
      LookupResultField = 'CD_GRADE'
      KeyFields = 'CD_GRADE'
      Lookup = True
    end
    object qyCursosColigadasSN_ACADEMICO: TIntegerField
      FieldName = 'SN_ACADEMICO'
    end
    object qyCursosColigadasSN_ATIVO: TSmallintField
      FieldName = 'SN_ATIVO'
    end
    object qyCursosColigadasDS_DEPTO_LK: TStringField
      FieldKind = fkLookup
      FieldName = 'DS_DEPTO_LK'
      LookupDataSet = qyListaDeptos
      LookupKeyFields = 'codigo'
      LookupResultField = 'descricao'
      KeyFields = 'CD_DEPTO'
      Lookup = True
    end
  end
  object dtcCursosColigadas: TDataSource
    DataSet = qyCursosColigadas
    OnStateChange = dtcCursosColigadasStateChange
    Left = 261
    Top = 91
  end
  object qyGrades: TUMZQuery
    Connection = DM.db
    AfterOpen = qyGradesAfterOpen
    BeforeInsert = qyGradesBeforeInsert
    BeforeEdit = qyGradesBeforeEdit
    AfterPost = qyGradesAfterPost
    BeforeDelete = qyGradesBeforeDelete
    SQL.Strings = (
      '  SELECT'
      '  CD_GRADE,'
      '  CD_CURSO,'
      '  DS_GRADE,'
      '  NR_ANO_INICIAL,'
      '  SN_ATIVO,'
      '  NR_CARGA_CURSO,'
      '  NR_CARGA_ATIVIDADES,'
      '  SN_PADRAO'
      'FROM'
      '  GRADES'
      'WHERE'
      '  CD_CURSO = :CD_CURSO AND SN_ATIVO = '#39'S'#39'  '
      'ORDER BY'
      '  CD_GRADE, DS_GRADE')
    Params = <
      item
        DataType = ftUnknown
        Name = 'CD_CURSO'
        ParamType = ptUnknown
      end>
    DataSource = dtcCursosMestre
    SQLList.Strings = (
      
        'mysql-5=SELECT'#13#10'  CD_GRADE,'#13#10'  CD_CURSO,'#13#10'  DS_GRADE,'#13#10'  NR_ANO_' +
        'INICIAL,'#13#10'  SN_ATIVO,'#13#10'  NR_CARGA_CURSO,'#13#10'  NR_CARGA_ATIVIDADES,' +
        #13#10'  SN_PADRAO'#13#10'FROM'#13#10'  GRADES'#13#10'WHERE'#13#10'  CD_CURSO = :CD_CURSO AND' +
        ' SN_ATIVO = '#39'S'#39'  '#13#10'ORDER BY'#13#10'  CD_GRADE, DS_GRADE'
      
        'oracle=SELECT'#13#10'  CD_GRADE,'#13#10'  CD_CURSO,'#13#10'  DS_GRADE,'#13#10'  NR_ANO_I' +
        'NICIAL,'#13#10'  SN_ATIVO,'#13#10'  NR_CARGA_CURSO,'#13#10'  NR_CARGA_ATIVIDADES'#13#10 +
        '  SN_PADRAO'#13#10'FROM'#13#10'  GRADES'#13#10'WHERE'#13#10'  CD_CURSO = :CD_CURSO AND S' +
        'N_ATIVO = '#39'S'#39'  '#13#10'ORDER BY'#13#10'  CD_GRADE, DS_GRADE')
    Left = 770
    Top = 524
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'CD_CURSO'
        ParamType = ptUnknown
      end>
    object qyGradesCD_GRADE: TLargeintField
      FieldName = 'CD_GRADE'
      Required = True
    end
    object qyGradesCD_CURSO: TStringField
      FieldName = 'CD_CURSO'
      Required = True
      Size = 15
    end
    object qyGradesDS_GRADE: TStringField
      FieldName = 'DS_GRADE'
      Size = 255
    end
    object qyGradesNR_ANO_INICIAL: TIntegerField
      FieldName = 'NR_ANO_INICIAL'
      DisplayFormat = '####/#'
    end
    object qyGradesSN_ATIVO: TStringField
      FieldName = 'SN_ATIVO'
      Required = True
      Size = 1
    end
    object qyGradesNR_CARGA_CURSO: TLargeintField
      FieldName = 'NR_CARGA_CURSO'
    end
    object qyGradesNR_CARGA_ATIVIDADES: TLargeintField
      FieldName = 'NR_CARGA_ATIVIDADES'
    end
    object qyGradesSN_PADRAO: TSmallintField
      FieldName = 'SN_PADRAO'
    end
  end
  object dsGrades: TDataSource
    DataSet = qyGrades
    OnStateChange = dsGradesStateChange
    OnDataChange = dsGradesDataChange
    Left = 802
    Top = 524
  end
  object qyGradesDisciplinas: TUMZQuery
    Tag = 1
    Connection = DM.db
    AfterOpen = qyGradesDisciplinasAfterOpen
    AfterRefresh = qyGradesDisciplinasAfterRefresh
    Filtered = True
    UpdateObject = updGradesDisciplinas
    BeforePost = qyGradesDisciplinasBeforePost
    AfterPost = qyGradesDisciplinasAfterPost
    AfterDelete = qyGradesDisciplinasAfterDelete
    SQL.Strings = (
      'SELECT'
      
        '  GD.*, CASE WHEN GD.SN_EXTRA = 1 THEN '#39'Sim'#39' ELSE '#39'N'#227'o'#39' END AS D' +
        'S_EXTRA, D.SIGLA, D.DESCRICAO, AP.DS_AVALIACAO,'
      '  CASE'
      
        '        WHEN (SELECT COUNT(*) AS registro FROM DISCIPLINAS_PRERE' +
        'Q DPR WHERE DPR.cd_curso = GD.CD_CURSO AND DPR.cd_discipli = GD.' +
        'CD_DISCIPLINA AND DPR.cd_grade = GD.CD_GRADE) > 0 THEN'
      '           '#39'X'#39
      
        '        WHEN (SELECT COUNT(*) AS registro FROM DISCIPLINAS_PRERE' +
        'Q_ESPECIAL DPRE WHERE DPRE.cd_curso = GD.CD_CURSO AND DPRE.cd_di' +
        'sciplina = GD.CD_DISCIPLINA AND DPRE.cd_grade = GD.CD_GRADE) > 0' +
        ' THEN'
      '           '#39'X'#39
      '   ELSE'
      '      '#39#39
      '   END AS PRE_REQUISITO'
      'FROM'
      '  GRADES G'
      
        '  INNER JOIN GRADES_DISCIPLINAS GD ON (GD.CD_GRADE = G.CD_GRADE ' +
        'AND GD.CD_CURSO = G.CD_CURSO)'
      
        '  INNER JOIN DISCIPLINAS D ON (D.CODIGO = GD.CD_DISCIPLINA AND D' +
        '.CURSO = GD.CD_CURSO)'
      
        '  LEFT JOIN AVALIACOES_PARAMETROS AP ON (AP.CD_AVALIACAO = GD.CD' +
        '_AVALIACAO)'
      'WHERE'
      '  G.CD_GRADE = :CD_GRADE AND'
      '  G.CD_CURSO = :CD_CURSO'
      'ORDER BY'
      '  GD.NR_SERIE,'
      '  D.DESCRICAO')
    Params = <
      item
        DataType = ftUnknown
        Name = 'CD_GRADE'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'CD_CURSO'
        ParamType = ptUnknown
      end>
    DataSource = dsGrades
    SQLList.Strings = (
      
        'oracle=SELECT'#13#10'   GD.CD_GRADE,'#13#10'   GD.CD_CURSO,'#13#10'   GD.CD_DISCIP' +
        'LINA,'#13#10'   GD.NR_SERIE,'#13#10'   GD.NR_AULAS,'#13#10'   GD.VL_VALOR,'#13#10'   GD.' +
        'SN_COMPARTILHADA,'#13#10'   GD.NR_CREDITOS_ACADEMICOS,'#13#10'   GD.CD_DISCI' +
        'PLINA_CATEGORIA,'#13#10'   GD.NR_CARGA_HORARIA_PRATICA,'#13#10'   GD.NR_CARG' +
        'A_HORARIA_TEORICA,'#13#10'   GD.CD_AVALIACAO,'#13#10'   GD.SN_EXTRA,     '#13#10' ' +
        '  GD.NR_QTD_DIAS_INICIO_MOODLE,'#13#10'   CASE WHEN GD.SN_EXTRA = 1 TH' +
        'EN '#39'Sim'#39' ELSE '#39'N'#227'o'#39' END AS DS_EXTRA, '#13#10'   D.SIGLA, '#13#10'   D.DESCRI' +
        'CAO,'#13#10'   AP.DS_AVALIACAO,'#13#10'   CASE WHEN (SELECT COUNT(*) AS regi' +
        'stro FROM DISCIPLINAS_PREREQ DPR WHERE DPR.cd_curso = GD.CD_CURS' +
        'O AND DPR.cd_discipli = GD.CD_DISCIPLINA AND DPR.cd_grade = GD.C' +
        'D_GRADE) > 0 THEN'#13#10'      '#39'X'#39#13#10'   ELSE'#13#10'      '#39#39#13#10'   END AS PRE_R' +
        'EQUISITO,'#13#10'   CASE WHEN (SELECT COUNT(*) AS registro FROM DISCIP' +
        'LINAS_PREREQ_ESPECIAL DPRE WHERE DPRE.cd_curso = GD.CD_CURSO AND' +
        ' DPRE.cd_disciplina = GD.CD_DISCIPLINA AND DPRE.cd_grade = GD.CD' +
        '_GRADE) > 0 THEN'#13#10'      '#39'X'#39#13#10'   ELSE'#13#10'      '#39#39#13#10'   END AS PRE_RE' +
        'QUISITO_ESPECIAL'#13#10'FROM'#13#10'  GRADES G'#13#10'  INNER JOIN GRADES_DISCIPLI' +
        'NAS GD ON (GD.CD_GRADE = G.CD_GRADE AND GD.CD_CURSO = G.CD_CURSO' +
        ')'#13#10'  INNER JOIN DISCIPLINAS D ON (D.CODIGO = GD.CD_DISCIPLINA AN' +
        'D D.CURSO = GD.CD_CURSO)'#13#10'  LEFT JOIN AVALIACOES_PARAMETROS AP O' +
        'N (AP.CD_AVALIACAO = GD.CD_AVALIACAO)'#13#10'WHERE'#13#10'  G.CD_GRADE = :CD' +
        '_GRADE AND'#13#10'  G.CD_CURSO = :CD_CURSO'#13#10'ORDER BY'#13#10'  GD.NR_SERIE'
      
        'mysql-5=SELECT'#13#10'   GD.CD_GRADE,'#13#10'   GD.CD_CURSO,'#13#10'   GD.CD_DISCI' +
        'PLINA,'#13#10'   GD.NR_CH_TEORICA_PRATICA,'#13#10'   GD.NR_SERIE,   '#13#10'   CAS' +
        'E WHEN GD.NR_SERIE = -100 THEN '#39'OPT'#39' ELSE GD.NR_SERIE END DS_SER' +
        'IE,'#13#10'   GD.NR_AULAS,'#13#10'   GD.VL_VALOR,'#13#10'   GD.SN_COMPARTILHADA,'#13#10 +
        '   GD.NR_CREDITOS_ACADEMICOS,'#13#10'   GD.CD_DISCIPLINA_CATEGORIA,'#13#10' ' +
        '  GD.NR_CARGA_HORARIA_PRATICA,'#13#10'   GD.NR_CARGA_HORARIA_TEORICA,'#13 +
        #10'   GD.CD_AVALIACAO,'#13#10'   GD.SN_EXTRA,'#13#10'   GD.NR_QTD_DIAS_INICIO_' +
        'MOODLE,'#13#10'   CASE WHEN GD.SN_EXTRA = 1 THEN '#39'Sim'#39' ELSE '#39'N'#227'o'#39' END ' +
        'AS DS_EXTRA, '#13#10'   D.SIGLA, '#13#10'   D.DESCRICAO,'#13#10'   AP.DS_AVALIACAO' +
        ','#13#10'   GD.SN_OPTATIVA,'#13#10'   CASE WHEN GD.SN_OPTATIVA = 1 THEN '#39'Sim' +
        #39' ELSE '#39'N'#227'o'#39' END AS DS_OPTATIVA,'#13#10'   GD.CD_DISCIPLINA_FRENTE,'#13#10' ' +
        '  COALESCE(D2.DESCRICAO, '#39#39') AS DS_DISCIPLINA_FRENTE,'#13#10'   CASE W' +
        'HEN (SELECT COUNT(*) AS registro FROM DISCIPLINAS_PREREQ DPR WHE' +
        'RE DPR.cd_curso = GD.CD_CURSO AND DPR.cd_discipli = GD.CD_DISCIP' +
        'LINA AND DPR.cd_grade = GD.CD_GRADE) > 0 THEN'#13#10'      '#39'X'#39#13#10'   ELS' +
        'E'#13#10'      '#39#39#13#10'   END AS PRE_REQUISITO,'#13#10'   CASE WHEN (SELECT COUN' +
        'T(*) AS registro FROM DISCIPLINAS_PREREQ_ESPECIAL DPRE WHERE DPR' +
        'E.cd_curso = GD.CD_CURSO AND DPRE.cd_disciplina = GD.CD_DISCIPLI' +
        'NA AND DPRE.cd_grade = GD.CD_GRADE) > 0 THEN'#13#10'      '#39'X'#39#13#10'   ELSE' +
        #13#10'      '#39#39#13#10'   END AS PRE_REQUISITO_ESPECIAL'#13#10'FROM'#13#10'  GRADES G'#13#10 +
        '  INNER JOIN GRADES_DISCIPLINAS GD ON (GD.CD_GRADE = G.CD_GRADE ' +
        'AND GD.CD_CURSO = G.CD_CURSO)'#13#10'  INNER JOIN DISCIPLINAS D ON (D.' +
        'CODIGO = GD.CD_DISCIPLINA AND D.CURSO = GD.CD_CURSO)'#13#10'  LEFT JOI' +
        'N AVALIACOES_PARAMETROS AP ON (AP.CD_AVALIACAO = GD.CD_AVALIACAO' +
        ')'#13#10'  LEFT JOIN DISCIPLINAS D2 ON (D2.CODIGO = GD.CD_DISCIPLINA_F' +
        'RENTE AND D2.CURSO = GD.CD_CURSO)'#13#10'WHERE'#13#10'  G.CD_GRADE = :CD_GRA' +
        'DE AND'#13#10'  G.CD_CURSO = :CD_CURSO'#13#10'ORDER BY'#13#10'  CASE WHEN GD.NR_SE' +
        'RIE = -100 THEN 99999 ELSE GD.NR_SERIE END, D.DESCRICAO;')
    Left = 770
    Top = 556
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'CD_GRADE'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'CD_CURSO'
        ParamType = ptUnknown
      end>
    object qyGradesDisciplinasCD_GRADE: TLargeintField
      FieldName = 'CD_GRADE'
      Required = True
    end
    object qyGradesDisciplinasCD_CURSO: TStringField
      FieldName = 'CD_CURSO'
      Required = True
      Size = 15
    end
    object qyGradesDisciplinasSIGLA: TStringField
      Tag = 1
      DisplayLabel = 'Sigla'
      DisplayWidth = 10
      FieldName = 'SIGLA'
    end
    object qyGradesDisciplinasCD_DISCIPLINA: TIntegerField
      Tag = 1
      DisplayLabel = 'C'#243'd. Disc.'
      FieldName = 'CD_DISCIPLINA'
      Required = True
    end
    object qyGradesDisciplinasNR_SERIE: TIntegerField
      FieldName = 'NR_SERIE'
    end
    object qyGradesDisciplinasDS_SERIE: TStringField
      Tag = 1
      DisplayLabel = 'Etapa'
      DisplayWidth = 7
      FieldName = 'DS_SERIE'
    end
    object qyGradesDisciplinasNR_AULAS: TFloatField
      Tag = 1
      DisplayLabel = 'CR/Fin'
      FieldName = 'NR_AULAS'
    end
    object qyGradesDisciplinasVL_VALOR: TFloatField
      Tag = 1
      DisplayLabel = 'Carga Hr.'
      FieldName = 'VL_VALOR'
    end
    object qyGradesDisciplinasSN_COMPARTILHADA: TSmallintField
      Tag = 1
      DisplayLabel = 'Compart.'
      FieldName = 'SN_COMPARTILHADA'
    end
    object qyGradesDisciplinasCD_DISCIPLINA_CATEGORIA: TIntegerField
      FieldName = 'CD_DISCIPLINA_CATEGORIA'
    end
    object qyGradesDisciplinasNR_CARGA_HORARIA_PRATICA: TFloatField
      Tag = 1
      DisplayLabel = 'C.H. Pr'#225'tica'
      FieldName = 'NR_CARGA_HORARIA_PRATICA'
    end
    object qyGradesDisciplinasNR_CARGA_HORARIA_TEORICA: TFloatField
      Tag = 1
      DisplayLabel = 'C.H. Te'#243'rica'
      FieldName = 'NR_CARGA_HORARIA_TEORICA'
    end
    object qyGradesDisciplinasDS_DISCIPLINA_CATEGORIA: TStringField
      Tag = 1
      DisplayLabel = 'Categoria'
      FieldKind = fkLookup
      FieldName = 'DS_DISCIPLINA_CATEGORIA'
      LookupDataSet = qyDiscCat
      LookupKeyFields = 'cd_categoria'
      LookupResultField = 'ds_categoria'
      KeyFields = 'CD_DISCIPLINA_CATEGORIA'
      Lookup = True
    end
    object qyGradesDisciplinasDESCRICAO: TStringField
      Tag = 1
      DisplayLabel = 'Descri'#231#227'o da disciplina'
      DisplayWidth = 40
      FieldName = 'DESCRICAO'
      Size = 100
    end
    object qyGradesDisciplinasNR_CREDITOS_ACADEMICOS: TLargeintField
      Tag = 1
      DisplayLabel = 'C.H Semanal'
      FieldName = 'NR_CREDITOS_ACADEMICOS'
    end
    object qyGradesDisciplinasCD_AVALIACAO: TIntegerField
      FieldName = 'CD_AVALIACAO'
      Visible = False
    end
    object qyGradesDisciplinasDS_AVALIACAO: TStringField
      Tag = 1
      DisplayLabel = 'Avalia'#231#227'o'
      DisplayWidth = 40
      FieldName = 'DS_AVALIACAO'
      Size = 100
    end
    object qyGradesDisciplinasPRE_REQUISITO: TStringField
      Tag = 1
      DisplayLabel = 'PR'
      FieldName = 'PRE_REQUISITO'
      ReadOnly = True
      Size = 1
    end
    object qyGradesDisciplinasPRE_REQUISITO_ESPECIAL: TStringField
      Tag = 1
      DisplayLabel = 'PRE'
      FieldName = 'PRE_REQUISITO_ESPECIAL'
      ReadOnly = True
      Size = 1
    end
    object qyGradesDisciplinasSN_EXTRA: TSmallintField
      FieldName = 'SN_EXTRA'
    end
    object qyGradesDisciplinasDS_EXTRA: TStringField
      Tag = 1
      DisplayLabel = 'Extra'
      FieldName = 'DS_EXTRA'
      ReadOnly = True
      Size = 3
    end
    object qyGradesDisciplinasDS_DISCIPLINA_FRENTE: TStringField
      Tag = 1
      DisplayLabel = 'Faz Frente'
      FieldName = 'DS_DISCIPLINA_FRENTE'
    end
    object qyGradesDisciplinasCD_DISCIPLINA_FRENTE: TIntegerField
      FieldName = 'CD_DISCIPLINA_FRENTE'
    end
    object qyGradesDisciplinasNR_QTD_DIAS_INICIO_MOODLE: TSmallintField
      Tag = 1
      DisplayLabel = 'In'#237'cio MOODLE'
      FieldName = 'NR_QTD_DIAS_INICIO_MOODLE'
    end
    object qyGradesDisciplinasSN_OPTATIVA: TSmallintField
      FieldName = 'SN_OPTATIVA'
    end
    object qyGradesDisciplinasDS_OPTATIVA: TStringField
      Tag = 1
      DisplayLabel = 'Optativa'
      FieldName = 'DS_OPTATIVA'
      ReadOnly = True
      Size = 3
    end
    object qyGradesDisciplinasNR_CH_TEORICA_PRATICA: TFloatField
      Tag = 1
      DisplayLabel = 'CH. Te'#243'rica e Pr'#225'tica'
      FieldName = 'NR_CH_TEORICA_PRATICA'
    end
  end
  object dsGradesDisciplinas: TDataSource
    DataSet = qyGradesDisciplinas
    OnDataChange = dsGradesDisciplinasDataChange
    Left = 802
    Top = 556
  end
  object updGradesDisciplinas: TZUpdateSQL
    DeleteSQL.Strings = (
      'DELETE FROM GRADES_DISCIPLINAS'
      'WHERE'
      '        CD_GRADE = :OLD_CD_GRADE AND'
      '        CD_CURSO = :OLD_CD_CURSO AND'
      '        CD_DISCIPLINA = :OLD_CD_DISCIPLINA AND'
      '        NR_SERIE = :OLD_NR_SERIE')
    InsertSQL.Strings = (
      'INSERT INTO GRADES_DISCIPLINAS ('
      
        '        CD_GRADE, CD_CURSO, CD_DISCIPLINA, NR_SERIE, NR_AULAS, V' +
        'L_VALOR,'
      
        '        SN_COMPARTILHADA, NR_CREDITOS_ACADEMICOS, CD_DISCIPLINA_' +
        'CATEGORIA,'
      
        '        NR_CARGA_HORARIA_PRATICA, NR_CARGA_HORARIA_TEORICA, NR_C' +
        'H_TEORICA_PRATICA'
      ') VALUES ('
      
        '        :CD_GRADE, :CD_CURSO, :CD_DISCIPLINA, :NR_SERIE, :NR_AUL' +
        'AS, :VL_VALOR,'
      
        '        :SN_COMPARTILHADA, :NR_CREDITOS_ACADEMICOS, :CD_DISCIPLI' +
        'NA_CATEGORIA,'
      
        '        :NR_CARGA_HORARIA_PRATICA, :NR_CARGA_HORARIA_TEORICA, :N' +
        'R_CH_TEORICA_PRATICA'
      ')')
    ModifySQL.Strings = (
      'UPDATE'
      '        GRADES_DISCIPLINAS'
      'SET'
      '        NR_AULAS = :NR_AULAS,'
      '        VL_VALOR = :VL_VALOR,'
      '        SN_COMPARTILHADA = :SN_COMPARTILHADA,'
      '        NR_CREDITOS_ACADEMICOS = :NR_CREDITOS_ACADEMICOS,'
      '        CD_DISCIPLINA_CATEGORIA = :CD_DISCIPLINA_CATEGORIA,'
      '        NR_CARGA_HORARIA_PRATICA = :NR_CARGA_HORARIA_PRATICA,'
      '        NR_CARGA_HORARIA_TEORICA = :NR_CARGA_HORARIA_TEORICA,'
      '        NR_QTD_DIAS_INICIO_MOODLE = :NR_QTD_DIAS_INICIO_MOODLE,'
      '        NR_CH_TEORICA_PRATICA = :NR_CH_TEORICA_PRATICA'
      'WHERE'
      '        CD_GRADE = :CD_GRADE AND'
      '        CD_CURSO = :CD_CURSO AND'
      '        NR_SERIE = :NR_SERIE AND'
      '        CD_DISCIPLINA = :CD_DISCIPLINA')
    RefreshSQL.Strings = (
      'SELECT'
      '   GD.CD_GRADE,'
      '   GD.CD_CURSO,'
      '   G.DS_GRADE,'
      '   G.NR_ANO_INICIAL,'
      '   G.SN_ATIVO,'
      '   G.NR_CARGA_CURSO,'
      '   G.NR_CARGA_ATIVIDADES,'
      
        '   CASE WHEN GD.SN_EXTRA = 1 THEN '#39'Sim'#39' ELSE '#39'N'#227'o'#39' END AS DS_EXT' +
        'RA,'
      '   D.SIGLA,'
      '   D.DESCRICAO,'
      '   AP.DS_AVALIACAO,'
      '   CASE'
      
        '      WHEN (SELECT COUNT(*) AS registro FROM DISCIPLINAS_PREREQ ' +
        'DPR WHERE DPR.cd_curso = GD.CD_CURSO AND DPR.cd_discipli = GD.CD' +
        '_DISCIPLINA AND DPR.cd_grade = GD.CD_GRADE) > 0 THEN'
      '         '#39'X'#39
      
        '      WHEN (SELECT COUNT(*) AS registro FROM DISCIPLINAS_PREREQ_' +
        'ESPECIAL DPRE WHERE DPRE.cd_curso = GD.CD_CURSO AND DPRE.cd_disc' +
        'iplina = GD.CD_DISCIPLINA AND DPRE.cd_grade = GD.CD_GRADE) > 0 T' +
        'HEN'
      '         '#39'X'#39
      '      ELSE'
      '         '#39#39
      '   END AS PRE_REQUISITO'
      'FROM'
      '  GRADES G'
      '     JOIN GRADES_DISCIPLINAS GD ON'
      '        (GD.CD_GRADE = G.CD_GRADE) AND'
      '        (GD.CD_CURSO = G.CD_CURSO)'
      '        JOIN DISCIPLINAS D ON'
      '           (D.CODIGO = GD.CD_DISCIPLINA) AND'
      '           (D.CURSO = GD.CD_CURSO)'
      '        LEFT JOIN AVALIACOES_PARAMETROS AP ON'
      '           (AP.CD_AVALIACAO = GD.CD_AVALIACAO)'
      'WHERE'
      '   G.CD_GRADE = :CD_GRADE AND'
      '   G.CD_CURSO = :CD_CURSO'
      'ORDER BY'
      '   GD.NR_SERIE')
    UseSequenceFieldForRefreshSQL = False
    AfterDeleteSQL = updGradesDisciplinasAfterDeleteSQL
    AfterInsertSQL = updGradesDisciplinasAfterModifySQL
    AfterModifySQL = updGradesDisciplinasAfterModifySQL
    Left = 834
    Top = 540
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'NR_AULAS'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'VL_VALOR'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'sn_compartilhada'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'nr_creditos_academicos'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'CD_DISCIPLINA_CATEGORIA'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'NR_CARGA_HORARIA_PRATICA'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'NR_CARGA_HORARIA_TEORICA'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'NR_QTD_DIAS_INICIO_MOODLE'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'NR_CH_TEORICA_PRATICA'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'cd_grade'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'CD_CURSO'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'NR_SERIE'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'CD_DISCIPLINA'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'OLD_CD_GRADE'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'OLD_CD_CURSO'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'OLD_CD_DISCIPLINA'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'OLD_NR_SERIE'
        ParamType = ptUnknown
      end>
  end
  object qyListaGrades: TUMZQuery
    Connection = DM.db
    SQL.Strings = (
      'SELECT'
      '   CD_GRADE,'
      '   CD_CURSO,'
      '   DS_GRADE,'
      '   NR_ANO_INICIAL,'
      '   SN_ATIVO SN_ATIVO'
      'FROM'
      '  grades'
      'WHERE'
      '  cd_curso = :CD_CURSO'
      'ORDER BY'
      '  cd_grade DESC')
    Params = <
      item
        DataType = ftUnknown
        Name = 'CD_CURSO'
        ParamType = ptUnknown
      end>
    DataSource = dtcCursosMestre
    SQLList.Strings = (
      
        'oracle=SELECT'#13#10'   CD_GRADE,'#13#10'   CD_CURSO,'#13#10'   DS_GRADE,'#13#10'   NR_A' +
        'NO_INICIAL,'#13#10'   SN_ATIVO'#13#10'FROM'#13#10'  grades'#13#10'WHERE'#13#10'  cd_curso = :C' +
        'D_CURSO'#13#10'ORDER BY'#13#10'  cd_grade DESC'
      
        'mysql-5=SELECT'#13#10'   CD_GRADE,'#13#10'   CD_CURSO,'#13#10'   DS_GRADE,'#13#10'   NR_' +
        'ANO_INICIAL,'#13#10'   SN_ATIVO'#13#10'FROM'#13#10'  grades'#13#10'WHERE'#13#10'  cd_curso = :' +
        'CD_CURSO'#13#10'ORDER BY'#13#10'  cd_grade DESC')
    Left = 336
    Top = 152
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'CD_CURSO'
        ParamType = ptUnknown
      end>
    object qyListaGradesDS_GRADE: TStringField
      FieldName = 'DS_GRADE'
      Size = 255
    end
    object qyListaGradesCD_GRADE: TLargeintField
      FieldName = 'CD_GRADE'
      Required = True
    end
    object qyListaGradesCD_CURSO: TStringField
      FieldName = 'CD_CURSO'
      Required = True
      Size = 15
    end
    object qyListaGradesNR_ANO_INICIAL: TIntegerField
      FieldName = 'NR_ANO_INICIAL'
    end
    object qyListaGradesSN_ATIVO: TStringField
      FieldName = 'SN_ATIVO'
      Required = True
      Size = 1
    end
  end
  object qyListaProximaTurma: TUMZQuery
    Connection = DM.db
    ReadOnly = True
    SQL.Strings = (
      'SELECT'
      
        #9'DISTINCT(codigo) AS codigo, CONCAT(descricao, '#39' ('#39' || codigo ||' +
        ' '#39')'#39') AS descricao'
      'FROM'
      #9'TURMAS'
      'WHERE'
      #9'CURSO = :curso AND'
      #9'CD_COLIGADA = :cd_coligada AND'
      #9'ANOSEMESTRE = :nr_anosemestre'
      'ORDER BY'
      '  CONCAT(descricao, '#39' ('#39' || codigo || '#39')'#39')')
    Params = <
      item
        DataType = ftUnknown
        Name = 'Curso'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'cd_coligada'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'nr_anosemestre'
        ParamType = ptUnknown
      end>
    Left = 1088
    Top = 344
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'Curso'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'cd_coligada'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'nr_anosemestre'
        ParamType = ptUnknown
      end>
  end
  object qrySituacoesTurmas: TUMZQuery
    Connection = DM.db
    SQL.Strings = (
      'SELECT'
      '*'
      'FROM'
      'situacoes'
      'where'
      'cd_modulo=1148')
    Params = <>
    Left = 488
    Top = 504
    object qrySituacoesTurmascodigo: TLargeintField
      FieldName = 'codigo'
      Required = True
    end
    object qrySituacoesTurmascd_modulo: TLargeintField
      FieldName = 'cd_modulo'
    end
    object qrySituacoesTurmascd_situacao: TIntegerField
      FieldName = 'cd_situacao'
    end
    object qrySituacoesTurmasds_valor: TStringField
      FieldName = 'ds_valor'
      Size = 255
    end
    object qrySituacoesTurmasds_sigla: TStringField
      FieldName = 'ds_sigla'
      Size = 50
    end
    object qrySituacoesTurmasme_descricao: TMemoField
      FieldName = 'me_descricao'
      BlobType = ftMemo
    end
    object qrySituacoesTurmascd_auxiliar: TLargeintField
      FieldName = 'cd_auxiliar'
    end
  end
  object dsSituacoes: TDataSource
    DataSet = qrySituacoesTurmas
    Left = 520
    Top = 504
  end
  object qyListaDeptos: TUMZReadOnlyQuery
    Connection = DM.db
    SQL.Strings = (
      'SELECT'
      '  *'
      'FROM'
      '  departamentos'
      'WHERE '
      '  codigo = :DEPTO')
    Params = <
      item
        DataType = ftUnknown
        Name = 'DEPTO'
        ParamType = ptUnknown
      end>
    Left = 293
    Top = 91
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'DEPTO'
        ParamType = ptUnknown
      end>
    object qyListaDeptoscodigo: TSmallintField
      FieldName = 'codigo'
    end
    object qyListaDeptosdescricao: TStringField
      FieldName = 'descricao'
      Size = 255
    end
  end
  object qryColigadasComboCreate: TUMZQuery
    Connection = DM.db
    SQL.Strings = (
      'SELECT'
      '  cd_coligada,'
      '  nm_coligada,'
      '  1'
      'FROM coligadas'
      'ORDER BY  nm_coligada')
    Params = <>
    Left = 640
    Top = 555
    object qryColigadasComboCreatenm_coligada: TStringField
      FieldName = 'nm_coligada'
      ReadOnly = True
      Size = 50
    end
    object qryColigadasComboCreatecd_coligada: TLargeintField
      FieldName = 'cd_coligada'
    end
  end
  object qyColigadasCadastroTurma: TUMZReadOnlyQuery
    Connection = DM.db
    SQL.Strings = (
      'SELECT'
      '  cd_coligada,'
      '  nm_coligada'
      'FROM'
      '  coligadas'
      'ORDER BY'
      '  nm_coligada')
    Params = <>
    Left = 904
    Top = 328
    object qyColigadasCadastroTurmacd_coligada: TIntegerField
      FieldName = 'cd_coligada'
      Required = True
    end
    object qyColigadasCadastroTurmanm_coligada: TStringField
      FieldName = 'nm_coligada'
      Size = 50
    end
  end
  object qyGetDepto: TUMZReadOnlyQuery
    Connection = DM.db
    SQL.Strings = (
      'SELECT'
      '  D.descricao'
      'FROM'
      '  cursos_coligadas C'
      
        '  INNER JOIN departamentos D ON (C.CD_DEPTO = D.codigo AND C.cd_' +
        'coligada = D.cd_coligada) '
      'WHERE '
      '  C.CD_CURSO = :CURSO'
      '  AND '
      '  C.cd_coligada = :COLIGADA')
    Params = <
      item
        DataType = ftUnknown
        Name = 'CURSO'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'COLIGADA'
        ParamType = ptUnknown
      end>
    Left = 925
    Top = 507
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'CURSO'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'COLIGADA'
        ParamType = ptUnknown
      end>
  end
  object qrySituacoes: TUMZQuery
    Connection = DM.db
    SQL.Strings = (
      'SELECT'
      '*'
      'FROM'
      'situacoes'
      'where'
      'cd_modulo=1148')
    Params = <>
    Left = 448
    Top = 504
    object LargeintField1: TLargeintField
      FieldName = 'codigo'
      Required = True
    end
    object LargeintField2: TLargeintField
      FieldName = 'cd_modulo'
    end
    object IntegerField1: TIntegerField
      FieldName = 'cd_situacao'
    end
    object StringField1: TStringField
      FieldName = 'ds_valor'
      Size = 255
    end
    object StringField2: TStringField
      FieldName = 'ds_sigla'
      Size = 50
    end
    object MemoField1: TMemoField
      FieldName = 'me_descricao'
      BlobType = ftMemo
    end
    object LargeintField3: TLargeintField
      FieldName = 'cd_auxiliar'
    end
  end
  object qryTotais: TUMZQuery
    Connection = DM.db
    SQL.Strings = (
      'SELECT'
      
        '  sum(gd.vl_valor) carga_horaria,count(GD.CD_DISCIPLINA) qtd_dis' +
        'ciplinas ,sum(gd.nr_aulas) credito_fin,sum(gd.nr_creditos_academ' +
        'icos) hora_aula'
      'FROM'
      '  GRADES G'
      
        '  INNER JOIN GRADES_DISCIPLINAS GD ON (GD.CD_GRADE = G.CD_GRADE ' +
        'AND GD.CD_CURSO = G.CD_CURSO)'
      
        '  INNER JOIN DISCIPLINAS D ON (D.CODIGO = GD.CD_DISCIPLINA AND D' +
        '.CURSO = GD.CD_CURSO)'
      'WHERE'
      '  G.CD_GRADE = :CD_GRADE AND'
      '  G.CD_CURSO = :CD_CURSO'
      'ORDER BY'
      '  GD.NR_SERIE')
    Params = <
      item
        DataType = ftUnknown
        Name = 'CD_GRADE'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'CD_CURSO'
        ParamType = ptUnknown
      end>
    SQLList.Strings = (
      
        'mysql-5=SELECT'#13#10'  sum(gd.vl_valor) carga_horaria,count(GD.CD_DIS' +
        'CIPLINA) qtd_disciplinas ,sum(gd.nr_aulas) credito_fin,sum(gd.nr' +
        '_creditos_academicos) hora_aula'#13#10'FROM'#13#10'  GRADES G'#13#10'  INNER JOIN ' +
        'GRADES_DISCIPLINAS GD ON (GD.CD_GRADE = G.CD_GRADE AND GD.CD_CUR' +
        'SO = G.CD_CURSO)'#13#10'  INNER JOIN DISCIPLINAS D ON (D.CODIGO = GD.C' +
        'D_DISCIPLINA AND D.CURSO = GD.CD_CURSO)'#13#10'WHERE'#13#10'  G.CD_GRADE = :' +
        'CD_GRADE AND'#13#10'  G.CD_CURSO = :CD_CURSO'#13#10'ORDER BY'#13#10'  GD.NR_SERIE'
      
        'oracle=SELECT'#13#10'  sum(gd.vl_valor) carga_horaria,'#13#10'  CAST(count(G' +
        'D.CD_DISCIPLINA) AS NUMBER(19)) qtd_disciplinas,'#13#10'  sum(gd.nr_au' +
        'las) credito_fin,'#13#10'  CAST(sum(gd.nr_creditos_academicos) AS NUMB' +
        'ER(19)) hora_aula'#13#10'FROM'#13#10'  GRADES G'#13#10'  INNER JOIN GRADES_DISCIPL' +
        'INAS GD ON (GD.CD_GRADE = G.CD_GRADE AND GD.CD_CURSO = G.CD_CURS' +
        'O)'#13#10'  INNER JOIN DISCIPLINAS D ON (D.CODIGO = GD.CD_DISCIPLINA A' +
        'ND D.CURSO = GD.CD_CURSO)'#13#10'WHERE'#13#10'  G.CD_GRADE = :CD_GRADE AND'#13#10 +
        '  G.CD_CURSO = :CD_CURSO'#13#10'ORDER BY'#13#10'  GD.NR_SERIE')
    Left = 416
    Top = 616
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'CD_GRADE'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'CD_CURSO'
        ParamType = ptUnknown
      end>
    object qryTotaiscarga_horaria: TFloatField
      FieldName = 'carga_horaria'
      ReadOnly = True
    end
    object qryTotaisqtd_disciplinas: TLargeintField
      FieldName = 'qtd_disciplinas'
      ReadOnly = True
    end
    object qryTotaiscredito_fin: TFloatField
      FieldName = 'credito_fin'
      ReadOnly = True
    end
    object qryTotaishora_aula: TLargeintField
      FieldName = 'hora_aula'
      ReadOnly = True
    end
  end
  object dsTotal: TDataSource
    DataSet = qryTotais
    Left = 448
    Top = 616
  end
  object qryGetDptoByColigada: TUMZReadOnlyQuery
    Connection = DM.db
    SQL.Strings = (
      'SELECT'
      '    CODIGO'
      'FROM'
      '    DEPARTAMENTOS'
      'WHERE'
      '    CD_COLIGADA = :coligada')
    Params = <
      item
        DataType = ftUnknown
        Name = 'coligada'
        ParamType = ptUnknown
      end>
    Left = 384
    Top = 616
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'coligada'
        ParamType = ptUnknown
      end>
  end
  object qyColigadasCadastroTurmaInsert: TUMZQuery
    Connection = DM.db
    UpdateObject = updDoc
    CachedUpdates = True
    BeforeInsert = qDocumentosNecessariosBeforeInsert
    AfterInsert = qDocumentosNecessariosAfterInsert
    BeforeEdit = qDocumentosNecessariosBeforeEdit
    BeforePost = qDocumentosNecessariosBeforePost
    AfterPost = qDocumentosNecessariosAfterPost
    BeforeDelete = qDocumentosNecessariosBeforeDelete
    Params = <>
    DataSource = dtcCursosMestre
    SQLList.Strings = (
      
        'mysql-5=INSERT IGNORE INTO disciplinas_mestre (cd_disciplina_pai' +
        ', ds_disciplina, nr_ordem, ds_sigla, cd_disc_mec) VALUES (:cd_di' +
        'sciplina_pai, :ds_disciplina, :nr_ordem, :ds_sigla, :cd_disc_mec' +
        ')'
      
        'oracle=MERGE INTO disciplinas_mestre dm USING'#13#10'            (SELE' +
        'CT'#13#10'                :cd_disciplina_pai AS cd_disciplina_pai,'#13#10'  ' +
        '              :ds_disciplina AS ds_disciplina,'#13#10'                ' +
        ':nr_ordem AS nr_ordem,'#13#10'                   :ds_sigla AS ds_sigla' +
        ','#13#10'                   :cd_disc_mec AS cd_disc_mec FROM dual) dm2' +
        ' ON'#13#10'                   (dm.CD_DISCIPLINA_PAI = dm2.CD_DISCIPLIN' +
        'A_PAI)'#13#10'             WHEN NOT MATCHED THEN'#13#10'                INSE' +
        'RT (cd_disciplina_pai, ds_disciplina, nr_ordem, ds_sigla, cd_dis' +
        'c_mec) VALUES (dm2.cd_disciplina_pai, dm2.ds_disciplina, dm2.nr_' +
        'ordem, dm2.ds_sigla, dm2.cd_disc_mec)')
    Left = 940
    Top = 326
    object IntegerField2: TIntegerField
      FieldName = 'Cod_Documento'
      Origin = 'WMESTRE12.Documentos_Necessarios.Cod_Documento'
    end
    object StringField3: TStringField
      FieldName = 'Curso'
      Origin = 'WMESTRE12.Documentos_Necessarios.Curso'
      Size = 15
    end
    object SmallintField1: TSmallintField
      FieldName = 'Codigo'
      Origin = 'WMESTRE12.Documentos_Necessarios.Curso'
    end
    object StringField4: TStringField
      FieldName = 'Documento'
      Origin = 'WMESTRE12.Documentos_Necessarios.Curso'
      Size = 50
    end
    object StringField5: TStringField
      FieldName = 'Prazo'
      Origin = 'WMESTRE12.Documentos_Necessarios.Curso'
      Size = 50
    end
    object StringField6: TStringField
      FieldName = 'Sigla'
      Origin = 'WMESTRE12.Documentos_Necessarios.Curso'
      Size = 8
    end
    object StringField7: TStringField
      DisplayLabel = 'Necess'#225'rio para Ativa'#231#227'o da Matr'#237'cula'
      FieldName = 'sn_obrigatorio'
      Origin = 'WMESTRE12.documentos_necessarios.sn_obrigatorio'
      FixedChar = True
      Size = 1
    end
    object SmallintField2: TSmallintField
      DisplayLabel = 'N'#186' Grupo'
      FieldName = 'nr_grupo'
      Origin = 'WMESTRE12.documentos_necessarios.nr_grupo'
    end
  end
  object qyPlanos: TUMZQuery
    Connection = DM.db
    SQL.Strings = (
      'SELECT'
      '  CD_PLANO, DS_PLANO'
      'FROM'
      '  fin_planos'
      'WHERE'
      '  NR_ANOSEMESTRE = :NR_ANOSEMESTRE')
    Params = <
      item
        DataType = ftUnknown
        Name = 'NR_ANOSEMESTRE'
        ParamType = ptUnknown
      end>
    Left = 544
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'NR_ANOSEMESTRE'
        ParamType = ptUnknown
      end>
    object qyPlanosCD_PLANO: TIntegerField
      FieldName = 'CD_PLANO'
      Required = True
    end
    object qyPlanosDS_PLANO: TStringField
      FieldName = 'DS_PLANO'
      Size = 50
    end
  end
  object qyColigadasAtosOficiais: TUMZQuery
    Connection = DM.db
    SQL.Strings = (
      'SELECT'
      '  *'
      'FROM'
      ' (SELECT'
      '    null AS cd_coligada,'
      '    '#39'Todas as Unidades de Ensino'#39' AS nm_coligada,'
      '    0 AS nr_ordem'
      '  FROM dual'
      '  UNION'
      '  SELECT'
      '    cd_coligada, nm_coligada, 1'
      '  FROM'
      '    coligadas ) tabela'
      'ORDER BY nr_ordem, nm_coligada')
    Params = <>
    Left = 680
    Top = 491
    object StringField8: TStringField
      FieldName = 'nm_coligada'
      Origin = 'WMESTRE12.coligadas.nm_coligada'
      Size = 50
    end
    object qyColigadasAtosOficiaiscd_coligada: TSmallintField
      FieldName = 'cd_coligada'
    end
  end
  object qyTitulacao: TUMZQuery
    Connection = DM.db
    SQL.Strings = (
      'SELECT'
      '   *'
      'FROM'
      '   pessoas_titulacoes')
    Params = <>
    Left = 1056
    Top = 96
    object qyTitulacaocd_titulacao: TIntegerField
      FieldName = 'cd_titulacao'
      Required = True
    end
    object qyTitulacaods_titulacao: TStringField
      FieldName = 'ds_titulacao'
      Size = 255
    end
    object qyTitulacaods_titulacao_masculino: TStringField
      FieldName = 'ds_titulacao_masculino'
      Size = 255
    end
    object qyTitulacaods_titulacao_feminino: TStringField
      FieldName = 'ds_titulacao_feminino'
      Size = 255
    end
    object qyTitulacaods_chave: TStringField
      FieldName = 'ds_chave'
      Size = 255
    end
  end
  object dsTitulacao: TDataSource
    DataSet = qyTitulacao
    Left = 1088
    Top = 96
  end
  object qrySalas: TUMZReadOnlyQuery
    Connection = DM.db
    SortedFields = 'DS_SALA'
    SQL.Strings = (
      'SELECT'
      '   id as CD_SALA,'
      '   DS_SALA'
      'FROM'
      '   unim_sala')
    Params = <>
    IndexFieldNames = 'DS_SALA Asc'
    Left = 120
    Top = 504
    object qrySalasCD_SALA: TLargeintField
      FieldName = 'CD_SALA'
      Required = True
    end
    object qrySalasDS_SALA: TStringField
      FieldName = 'DS_SALA'
      Size = 255
    end
  end
  object qyGradesDisciplinasFrentes: TUMZQuery
    Connection = DM.db
    Filtered = True
    SQL.Strings = (
      'SELECT'
      '  GD.CD_DISCIPLINA, D.DESCRICAO, D.SIGLA'
      'FROM'
      '  GRADES G'
      
        '  INNER JOIN GRADES_DISCIPLINAS GD ON (GD.CD_GRADE = G.CD_GRADE ' +
        'AND GD.CD_CURSO = G.CD_CURSO)'
      
        '  INNER JOIN DISCIPLINAS D ON (D.CODIGO = GD.CD_DISCIPLINA AND D' +
        '.CURSO = GD.CD_CURSO)'
      'WHERE'
      '  GD.NR_SERIE = :NR_SERIE AND'
      '  G.CD_GRADE = :CD_GRADE AND'
      '  G.CD_CURSO = :CD_CURSO'
      'ORDER BY'
      '  GD.NR_SERIE')
    Params = <
      item
        DataType = ftUnknown
        Name = 'NR_SERIE'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'CD_GRADE'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'CD_CURSO'
        ParamType = ptUnknown
      end>
    Left = 770
    Top = 585
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'NR_SERIE'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'CD_GRADE'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'CD_CURSO'
        ParamType = ptUnknown
      end>
    object qyGradesDisciplinasFrentesSIGLA: TStringField
      FieldName = 'SIGLA'
    end
    object qyGradesDisciplinasFrentesDESCRICAO: TStringField
      FieldName = 'DESCRICAO'
    end
    object qyGradesDisciplinasFrentesCD_DISCIPLINA: TIntegerField
      FieldName = 'CD_DISCIPLINA'
    end
  end
  object updCursosMestre: TZUpdateSQL
    DeleteSQL.Strings = (
      'DELETE FROM CURSOS_MESTRE WHERE CD_CURSO = :CD_CURSO')
    InsertSQL.Strings = (
      
        'INSERT INTO CURSOS_MESTRE (CD_CURSO, DS_CURSO, DS_APELIDO, NR_GR' +
        'AU, DS_HABILITACAO, SN_ATIVO, NR_RELEVANCIA, CD_TITULACAO, NR_IN' +
        'CREMENTO, CD_AREA, SN_NAO_VERIF_DISC_APROVADAS)'
      
        'VALUES (:CD_CURSO, :DS_CURSO, :DS_APELIDO, :NR_GRAU, :DS_HABILIT' +
        'ACAO, :SN_ATIVO, :NR_RELEVANCIA, :CD_TITULACAO, :NR_INCREMENTO, ' +
        ':CD_AREA, :SN_NAO_VERIF_DISC_APROVADAS)')
    ModifySQL.Strings = (
      'UPDATE CURSOS_MESTRE'
      'SET'
      '   CD_CURSO = :CD_CURSO,'
      '   DS_CURSO = :DS_CURSO,'
      '   DS_APELIDO = :DS_APELIDO,'
      '   NR_GRAU = :NR_GRAU,'
      '   DS_HABILITACAO = :DS_HABILITACAO,'
      '   SN_ATIVO = :SN_ATIVO,'
      '   NR_RELEVANCIA = :NR_RELEVANCIA,'
      '   CD_TITULACAO = :CD_TITULACAO,'
      '   NR_INCREMENTO = :NR_INCREMENTO,'
      '   CD_AREA = :CD_AREA,'
      '   SN_NAO_VERIF_DISC_APROVADAS = :SN_NAO_VERIF_DISC_APROVADAS'
      'WHERE'
      '   CD_CURSO = :CD_CURSO')
    RefreshSQL.Strings = (
      '')
    UseSequenceFieldForRefreshSQL = False
    Left = 56
    Top = 424
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'CD_CURSO'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'DS_CURSO'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'DS_APELIDO'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'NR_GRAU'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'DS_HABILITACAO'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'SN_ATIVO'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'NR_RELEVANCIA'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'CD_TITULACAO'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'NR_INCREMENTO'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'CD_AREA'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'SN_NAO_VERIF_DISC_APROVADAS'
        ParamType = ptUnknown
      end>
  end
  object dsTurmasDiscilinasOptativas: TDataSource
    AutoEdit = False
    DataSet = qTurmasDisciplinasOptativas
    Left = 1072
    Top = 392
  end
  object qTurmasDisciplinasOptativas: TUMZQuery
    Connection = DM.db
    SQL.Strings = (
      'SELECT'
      '  tdo.nr_anosemestre,'
      '  tdo.cd_curso,'
      '  tdo.cd_turma,'
      '  tdo.cd_disciplina_generica,'
      '  tdo.cd_disciplina_optativa,'
      '  disc_generica.descricao descricao_generica,'
      #9'disc_optativa.descricao descricao_optativa'
      'FROM'
      #9'turmas_disciplinas_optativas tdo'
      #9'INNER JOIN turmas t ON ( '
      #9#9'tdo.cd_turma = t.codigo AND'
      #9#9'tdo.nr_anosemestre = t.anosemestre AND'
      #9#9'tdo.cd_curso = t.curso'
      #9')'
      '  INNER JOIN disciplinas disc_optativa ON ('
      '    disc_optativa.codigo = tdo.cd_disciplina_optativa AND'
      '    disc_optativa.curso = t.curso'
      '  )'
      '  INNER JOIN disciplinas disc_generica ON ('
      '    disc_generica.codigo = tdo.cd_disciplina_generica AND'
      '    disc_generica.curso = t.curso'
      '  )'
      'WHERE'
      #9't.codigo LIKE :cd_turma AND'
      #9't.anosemestre = :nr_anosemestre and'
      #9't.curso LIKE :cd_curso'
      'ORDER BY'
      '  disc_generica.descricao,'
      #9'disc_optativa.descricao')
    Params = <
      item
        DataType = ftUnknown
        Name = 'cd_turma'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'nr_anosemestre'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'cd_curso'
        ParamType = ptUnknown
      end>
    Left = 1095
    Top = 392
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'cd_turma'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'nr_anosemestre'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'cd_curso'
        ParamType = ptUnknown
      end>
    object qTurmasDisciplinasOptativasnr_anosemestre: TIntegerField
      FieldName = 'nr_anosemestre'
    end
    object qTurmasDisciplinasOptativascd_curso: TStringField
      FieldName = 'cd_curso'
      Size = 15
    end
    object qTurmasDisciplinasOptativascd_turma: TStringField
      FieldName = 'cd_turma'
      Size = 50
    end
    object qTurmasDisciplinasOptativascd_disciplina_generica: TIntegerField
      FieldName = 'cd_disciplina_generica'
    end
    object qTurmasDisciplinasOptativascd_disciplina_optativa: TIntegerField
      FieldName = 'cd_disciplina_optativa'
    end
    object qTurmasDisciplinasOptativasdescricao_optativa: TStringField
      FieldName = 'descricao_optativa'
      Size = 150
    end
    object qTurmasDisciplinasOptativasdescricao_generica: TStringField
      FieldName = 'descricao_generica'
      Size = 150
    end
  end
  object qDisciplinasOptativas: TUMZQuery
    Connection = DM.db
    SQL.Strings = (
      'SELECT'
      #9'COUNT(*) total'
      'FROM '
      #9'turmas t'
      #9'INNER JOIN grades_disciplinas gd ON ('
      #9#9'gd.cd_grade = t.cd_grade AND'
      #9#9'gd.nr_serie = t.serie AND'
      #9#9'gd.cd_curso = t.curso'
      #9')'
      'WHERE'
      #9't.codigo LIKE :cd_turma AND'
      #9't.anosemestre = :nr_anosemestre AND'
      #9'gd.sn_optativa = 1')
    Params = <
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
    Left = 1128
    Top = 440
    ParamData = <
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
    Left = 776
    Top = 672
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
    Left = 808
    Top = 672
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'cd_pessoa'
        ParamType = ptUnknown
      end>
  end
  object UMZQuery1: TUMZQuery
    Params = <>
    Left = 360
    Top = 88
  end
  object qryAreasAtuacao: TUMZQuery
    Connection = DM.db
    SQL.Strings = (
      'SELECT'
      '  cd_area,'
      '  ds_area,'
      '  me_observacoes'
      'FROM'
      '  cursos_areas_atuacao')
    Params = <>
    Left = 744
    Top = 208
    object qryAreasAtuacaocd_area: TLargeintField
      FieldName = 'cd_area'
      Required = True
    end
    object qryAreasAtuacaods_area: TStringField
      FieldName = 'ds_area'
      Size = 255
    end
  end
  object qyVerificarFinanceiro: TUMZQuery
    Connection = DM.db
    SQL.Strings = (
      'SELECT'
      '  fi.codigoaluno,'
      '  fi.anosemestre,'
      '  fi.turmamatricula'
      'FROM'
      '  fichaindividual fi'
      '  INNER JOIN grades_disciplinas gdn ON ('
      '      gdn.cd_disciplina = fi.disciplina AND'
      '      gdn.nr_serie = fi.serie AND'
      '      gdn.cd_curso = fi.curso AND'
      '      gdn.cd_grade = :cd_grade_nova'
      '  )'
      '  INNER JOIN grades_disciplinas gda ON ('
      '      gda.cd_curso = gdn.cd_curso AND'
      '      gda.nr_serie = gdn.nr_serie AND'
      '      gda.cd_disciplina = gdn.cd_disciplina AND'
      '      gda.cd_grade = :cd_grade_antiga'
      '  )'
      'WHERE'
      '  fi.anosemestre = :nr_anosemestre AND'
      '  fi.turma LIKE :cd_turma AND'
      '  gdn.nr_aulas <> gda.nr_aulas AND'
      
        '  (SELECT COUNT(*) FROM mensalidades m WHERE m.codigoaluno = fi.' +
        'codigoaluno AND m.turma = fi.turma AND m.anosemestre = fi.anosem' +
        'estre AND sn_credito_parcela = "S") > 0'
      'GROUP BY'
      #9'fi.codigoaluno, fi.anosemestre, fi.turmamatricula')
    Params = <
      item
        DataType = ftUnknown
        Name = 'cd_grade_nova'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'cd_grade_antiga'
        ParamType = ptUnknown
      end
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
    Left = 664
    Top = 656
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'cd_grade_nova'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'cd_grade_antiga'
        ParamType = ptUnknown
      end
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
    object qyVerificarFinanceirocodigoaluno: TIntegerField
      FieldName = 'codigoaluno'
    end
    object qyVerificarFinanceiroanosemestre: TSmallintField
      FieldName = 'anosemestre'
    end
    object qyVerificarFinanceiroturmamatricula: TStringField
      FieldName = 'turmamatricula'
      Size = 50
    end
  end
  object qyVerificaAlunoVinculadoGrade: TUMZQuery
    Connection = DM.db
    SQL.Strings = (
      'SELECT'
      '  COUNT(*) qtd'
      'FROM'
      #9'grades_disciplinas gd'
      #9'INNER JOIN turmas t ON ('
      #9#9#9't.cd_grade = gd.cd_grade'
      #9')'
      '  INNER JOIN fichaindividual fi ON ('
      #9#9#9'fi.anosemestre = t.anosemestre AND'
      #9#9#9'fi.turma = t.codigo AND'
      '      fi.disciplina = gd.cd_disciplina AND'
      '      fi.serie = gd.nr_serie AND'
      '      fi.curso = gd.cd_curso'
      '  )'
      #9'INNER JOIN mensalidades m ON ('
      #9#9#9'm.codigoaluno = fi.codigoaluno AND '
      #9#9#9'm.turma = fi.turma AND '
      #9#9#9'm.anosemestre = fi.anosemestre AND '
      #9#9#9'sn_credito_parcela = "S"'
      #9')'
      'WHERE'
      '  gd.cd_grade = :cd_grade AND'
      '  gd.cd_disciplina = :cd_disciplina AND'
      '  gd.cd_curso LIKE :cd_curso AND'
      '  gd.nr_serie = :nr_serie')
    Params = <
      item
        DataType = ftUnknown
        Name = 'cd_grade'
        ParamType = ptUnknown
      end
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
        Name = 'nr_serie'
        ParamType = ptUnknown
      end>
    Left = 696
    Top = 656
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'cd_grade'
        ParamType = ptUnknown
      end
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
        Name = 'nr_serie'
        ParamType = ptUnknown
      end>
    object qyVerificaAlunoVinculadoGradeqtd: TLargeintField
      FieldName = 'qtd'
    end
  end
end
