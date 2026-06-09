object fCadLayout: TfCadLayout
  Left = 199
  Top = 133
  Caption = 'Cadastro de Layouts'
  ClientHeight = 553
  ClientWidth = 800
  Color = clBtnFace
  Font.Charset = ANSI_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  FormStyle = fsMDIChild
  KeyPreview = True
  OldCreateOrder = True
  Position = poDefault
  ShowHint = True
  Visible = True
  WindowState = wsMaximized
  OnClose = FormClose
  OnCreate = FormCreate
  OnKeyDown = FormKeyDown
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object bvEspaco: TBevel
    Left = 0
    Top = 522
    Width = 800
    Height = 6
    Align = alBottom
    Shape = bsSpacer
  end
  object pnTitulo: TPanel
    Left = 0
    Top = 0
    Width = 800
    Height = 22
    Align = alTop
    BevelOuter = bvLowered
    Color = clBlue
    Font.Charset = ANSI_CHARSET
    Font.Color = clWhite
    Font.Height = -13
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 0
  end
  object pcCadastro: TPageControl
    Left = 0
    Top = 22
    Width = 800
    Height = 500
    ActivePage = tsLayout
    Align = alClient
    Style = tsFlatButtons
    TabOrder = 1
    OnChange = pcCadastroChange
    OnChanging = pcCadastroChanging
    object tsLayout: TTabSheet
      Caption = '        Layout        '
      ImageIndex = 1
      ExplicitLeft = 0
      ExplicitTop = 0
      ExplicitWidth = 0
      ExplicitHeight = 0
      object pnConteudo: TPanel
        Left = 0
        Top = 0
        Width = 792
        Height = 469
        Align = alClient
        BevelOuter = bvNone
        TabOrder = 0
        object Bevel1: TBevel
          Left = 393
          Top = 0
          Width = 6
          Height = 469
          Align = alLeft
          Shape = bsFrame
        end
        object Panel2: TPanel
          Left = 399
          Top = 0
          Width = 393
          Height = 469
          Align = alClient
          BevelOuter = bvNone
          TabOrder = 0
          object pnAnoSemestre: TPanel
            Left = 0
            Top = 20
            Width = 393
            Height = 17
            Align = alTop
            BevelOuter = bvNone
            TabOrder = 0
          end
          object Panel3: TPanel
            Left = 0
            Top = 0
            Width = 393
            Height = 20
            Align = alTop
            BevelOuter = bvLowered
            Caption = 'LAYOUTS CADASTRADOS'
            Color = clGray
            Font.Charset = ANSI_CHARSET
            Font.Color = clWhite
            Font.Height = -11
            Font.Name = 'Tahoma'
            Font.Style = []
            ParentFont = False
            TabOrder = 1
          end
          object grd: TDBGrid
            Left = 0
            Top = 37
            Width = 393
            Height = 432
            Align = alClient
            BorderStyle = bsNone
            DataSource = dsLayouts
            Font.Charset = ANSI_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'Arial'
            Font.Style = []
            Options = [dgTitles, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgAlwaysShowSelection, dgConfirmDelete, dgCancelOnExit]
            ParentFont = False
            TabOrder = 2
            TitleFont.Charset = ANSI_CHARSET
            TitleFont.Color = clWindowText
            TitleFont.Height = -11
            TitleFont.Name = 'Arial'
            TitleFont.Style = []
            Columns = <
              item
                Alignment = taCenter
                Expanded = False
                FieldName = 'cd_layout'
                Title.Alignment = taCenter
                Title.Caption = 'C'#243'digo'
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'ds_layout'
                Title.Alignment = taCenter
                Title.Caption = 'Descri'#231#227'o'
                Width = 300
                Visible = True
              end
              item
                Alignment = taCenter
                Expanded = False
                FieldName = 'sn_ativo'
                Title.Alignment = taCenter
                Title.Caption = 'Ativo'
                Visible = True
              end>
          end
        end
        object Panel1: TPanel
          Left = 0
          Top = 0
          Width = 393
          Height = 469
          Align = alLeft
          BevelOuter = bvNone
          TabOrder = 1
          object Panel6: TPanel
            Left = 0
            Top = 0
            Width = 393
            Height = 20
            Align = alTop
            BevelOuter = bvLowered
            Caption = 'DADOS B'#193'SICOS'
            Color = clGray
            Font.Charset = ANSI_CHARSET
            Font.Color = clWhite
            Font.Height = -11
            Font.Name = 'Tahoma'
            Font.Style = []
            ParentFont = False
            TabOrder = 0
          end
          object Panel7: TPanel
            Left = 0
            Top = 20
            Width = 393
            Height = 231
            Align = alTop
            BevelOuter = bvLowered
            Font.Charset = ANSI_CHARSET
            Font.Color = clBlack
            Font.Height = -11
            Font.Name = 'Tahoma'
            Font.Style = []
            ParentFont = False
            TabOrder = 1
            object Panel27: TPanel
              Left = 1
              Top = 1
              Width = 391
              Height = 44
              Align = alTop
              BevelOuter = bvNone
              TabOrder = 0
              object Label2: TLabel
                Left = 9
                Top = 3
                Width = 37
                Height = 13
                Caption = 'Codigo:'
                FocusControl = DBEdit2
              end
              object DBEdit2: TDBEdit
                Left = 8
                Top = 17
                Width = 105
                Height = 21
                DataField = 'cd_layout'
                DataSource = dsLayouts
                Enabled = False
                TabOrder = 0
                OnKeyPress = DBEdit2KeyPress
              end
              object DBCheckBox2: TDBCheckBox
                Left = 119
                Top = 19
                Width = 76
                Height = 17
                Caption = 'Exporta'#231#227'o'
                DataField = 'sn_exportacao'
                DataSource = dsLayouts
                TabOrder = 1
                ValueChecked = '1'
                ValueUnchecked = '0'
                OnClick = DBCheckBox2Click
              end
              object DBCheckBox3: TDBCheckBox
                Left = 216
                Top = 12
                Width = 171
                Height = 32
                Caption = 'Habilitar o uso de CH e Situa'#231#245'es do Aluno para Filtro'
                DataField = 'SN_USAR_CH_SIT'
                DataSource = dsLayouts
                TabOrder = 2
                ValueChecked = '1'
                ValueUnchecked = '0'
                WordWrap = True
              end
            end
            object pnEscondeUsaAnosemestre: TPanel
              Left = 1
              Top = 45
              Width = 391
              Height = 41
              Align = alTop
              BevelOuter = bvNone
              TabOrder = 1
              object Panel29: TPanel
                Left = 0
                Top = 0
                Width = 9
                Height = 41
                Align = alLeft
                BevelOuter = bvNone
                TabOrder = 0
              end
              object DBCheckBox5: TDBCheckBox
                Left = 9
                Top = 0
                Width = 382
                Height = 41
                Align = alClient
                Caption = 
                  'Assinale esta op'#231#227'o para que os filtros de cursos no v'#237'nculo de ' +
                  'alunos ao processo de exporta'#231#227'o funcionem por ano/semestre. Cas' +
                  'o desmarcada, ser'#225' considerado apenas o valor do ano.'
                DataField = 'SN_USAR_ANOSEMESTRE'
                DataSource = dsLayouts
                TabOrder = 1
                ValueChecked = '1'
                ValueUnchecked = '0'
                WordWrap = True
                ExplicitWidth = 304
              end
            end
            object Panel30: TPanel
              Left = 1
              Top = 86
              Width = 391
              Height = 144
              Align = alClient
              BevelOuter = bvNone
              TabOrder = 2
              object Label6: TLabel
                Left = 11
                Top = 6
                Width = 50
                Height = 13
                Caption = 'Descri'#231#227'o:'
                FocusControl = DBEdit4
              end
              object Label1: TLabel
                Left = 11
                Top = 50
                Width = 44
                Height = 13
                Caption = 'Formato:'
              end
              object Label18: TLabel
                Left = 11
                Top = 97
                Width = 174
                Height = 13
                Caption = 'Caminho e nome do arquivo padrao:'
                FocusControl = DBEdit10
              end
              object DBEdit4: TDBEdit
                Left = 11
                Top = 23
                Width = 361
                Height = 21
                DataField = 'ds_layout'
                DataSource = dsLayouts
                TabOrder = 0
              end
              object cbLkFormato: TDBLookupComboBox
                Left = 11
                Top = 67
                Width = 256
                Height = 24
                DataField = 'cd_formato'
                DataSource = dsLayouts
                Font.Charset = ANSI_CHARSET
                Font.Color = clWindowText
                Font.Height = -13
                Font.Name = 'Tahoma'
                Font.Style = []
                KeyField = 'cd_tipo_limite'
                ListField = 'ds_descricao'
                ParentFont = False
                TabOrder = 1
              end
              object DBCheckBox4: TDBCheckBox
                Left = 281
                Top = 69
                Width = 53
                Height = 17
                Caption = 'Ativo'
                DataField = 'sn_ativo'
                DataSource = dsLayouts
                TabOrder = 2
                ValueChecked = '1'
                ValueUnchecked = '0'
              end
              object DBEdit10: TDBEdit
                Left = 11
                Top = 114
                Width = 361
                Height = 21
                DataField = 'nm_arquivo_padrao'
                DataSource = dsLayouts
                TabOrder = 3
              end
            end
          end
          object pgTurmas: TPageControl
            Left = 0
            Top = 271
            Width = 393
            Height = 198
            ActivePage = tsObs
            Align = alClient
            Style = tsFlatButtons
            TabOrder = 2
            object tsObs: TTabSheet
              Caption = '  Descri'#231#227'o Completa  '
              ImageIndex = 1
              ExplicitLeft = 0
              ExplicitTop = 0
              ExplicitWidth = 0
              ExplicitHeight = 0
              object DBMemo1: TDBMemo
                Left = 0
                Top = 0
                Width = 385
                Height = 167
                Align = alClient
                DataField = 'me_layout'
                DataSource = dsLayouts
                Font.Charset = ANSI_CHARSET
                Font.Color = clWindowText
                Font.Height = -13
                Font.Name = 'Courier New'
                Font.Style = []
                ParentFont = False
                ScrollBars = ssVertical
                TabOrder = 0
                WantTabs = True
                WordWrap = False
              end
            end
            object TabSheet1: TTabSheet
              Caption = '  Ajuda  '
              ImageIndex = 2
              ExplicitLeft = 0
              ExplicitTop = 0
              ExplicitWidth = 0
              ExplicitHeight = 0
              object Memo1: TMemo
                Left = 0
                Top = 0
                Width = 385
                Height = 167
                Align = alClient
                BorderStyle = bsNone
                Color = clBtnFace
                Font.Charset = ANSI_CHARSET
                Font.Color = clWindowText
                Font.Height = -13
                Font.Name = 'Courier New'
                Font.Style = []
                ParentFont = False
                ReadOnly = True
                TabOrder = 0
              end
            end
          end
          object Panel26: TPanel
            Left = 0
            Top = 251
            Width = 393
            Height = 20
            Align = alTop
            BevelOuter = bvLowered
            Caption = 'DADOS ADICIONAIS'
            Color = clGray
            Font.Charset = ANSI_CHARSET
            Font.Color = clWhite
            Font.Height = -11
            Font.Name = 'Tahoma'
            Font.Style = []
            ParentFont = False
            TabOrder = 3
          end
        end
      end
    end
    object tsItens: TTabSheet
      Caption = '    Itens de Layout    '
      ImageIndex = 2
      ExplicitLeft = 0
      ExplicitTop = 0
      ExplicitWidth = 0
      ExplicitHeight = 0
      object Panel4: TPanel
        Left = 0
        Top = 0
        Width = 792
        Height = 469
        Align = alClient
        BevelOuter = bvNone
        TabOrder = 0
        object Bevel2: TBevel
          Left = 346
          Top = 0
          Width = 6
          Height = 469
          Align = alRight
          Shape = bsFrame
          ExplicitLeft = 379
          ExplicitTop = -2
        end
        object Panel5: TPanel
          Left = 352
          Top = 0
          Width = 440
          Height = 469
          Align = alRight
          BevelOuter = bvNone
          TabOrder = 0
          object Panel8: TPanel
            Left = 0
            Top = 20
            Width = 440
            Height = 5
            Align = alTop
            BevelOuter = bvNone
            TabOrder = 0
          end
          object Panel9: TPanel
            Left = 0
            Top = 0
            Width = 440
            Height = 20
            Align = alTop
            BevelOuter = bvLowered
            Caption = 'ITENS CADASTRADOS'
            Color = clGray
            Font.Charset = ANSI_CHARSET
            Font.Color = clWhite
            Font.Height = -11
            Font.Name = 'Tahoma'
            Font.Style = []
            ParentFont = False
            TabOrder = 1
          end
          object DBGrid1: TDBGrid
            Left = 0
            Top = 25
            Width = 440
            Height = 444
            Align = alClient
            BorderStyle = bsNone
            DataSource = dsLayoutItens
            Font.Charset = ANSI_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'Arial'
            Font.Style = []
            Options = [dgTitles, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgAlwaysShowSelection, dgConfirmDelete, dgCancelOnExit]
            ParentFont = False
            TabOrder = 2
            TitleFont.Charset = ANSI_CHARSET
            TitleFont.Color = clWindowText
            TitleFont.Height = -11
            TitleFont.Name = 'Arial'
            TitleFont.Style = []
            Columns = <
              item
                Expanded = False
                FieldName = 'cd_layout_item'
                Title.Caption = 'C'#243'digo'
                Width = 40
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'nm_consulta'
                Title.Caption = 'Nome da Consulta'
                Width = 120
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'ds_item'
                Title.Caption = 'Descri'#231#227'o do Item'
                Width = 150
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'nr_ordem'
                Title.Caption = 'Ordem'
                Width = 60
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'sn_ativo'
                Title.Caption = 'Ativo'
                Width = 60
                Visible = True
              end>
          end
        end
        object Panel10: TPanel
          Left = 0
          Top = 0
          Width = 346
          Height = 469
          Align = alClient
          BevelOuter = bvNone
          TabOrder = 1
          object Panel11: TPanel
            Left = 0
            Top = 0
            Width = 346
            Height = 20
            Align = alTop
            BevelOuter = bvLowered
            Caption = 'DADOS B'#193'SICOS'
            Color = clGray
            Font.Charset = ANSI_CHARSET
            Font.Color = clWhite
            Font.Height = -11
            Font.Name = 'Tahoma'
            Font.Style = []
            ParentFont = False
            TabOrder = 0
          end
          object Panel12: TPanel
            Left = 0
            Top = 20
            Width = 346
            Height = 173
            Align = alTop
            BevelOuter = bvLowered
            Font.Charset = ANSI_CHARSET
            Font.Color = clBlack
            Font.Height = -11
            Font.Name = 'Tahoma'
            Font.Style = []
            ParentFont = False
            TabOrder = 1
            object Label4: TLabel
              Left = 8
              Top = 5
              Width = 44
              Height = 13
              Caption = 'C'#243'd Item'
              FocusControl = DBEdit3
            end
            object Label8: TLabel
              Left = 10
              Top = 87
              Width = 46
              Height = 13
              Caption = 'Consulta:'
            end
            object Label3: TLabel
              Left = 273
              Top = 86
              Width = 36
              Height = 13
              Caption = 'Ordem:'
            end
            object Label14: TLabel
              Left = 9
              Top = 46
              Width = 50
              Height = 13
              Caption = 'Descri'#231#227'o:'
              FocusControl = DBEdit5
            end
            object Label16: TLabel
              Left = 10
              Top = 129
              Width = 54
              Height = 13
              Caption = 'Separador:'
              FocusControl = DBEdit9
            end
            object Label17: TLabel
              Left = 98
              Top = 130
              Width = 90
              Height = 13
              Caption = 'Item do Layout Pai'
            end
            object DBEdit3: TDBEdit
              Left = 8
              Top = 19
              Width = 97
              Height = 21
              DataField = 'cd_layout_item'
              DataSource = dsLayoutItens
              Enabled = False
              ReadOnly = True
              TabOrder = 0
            end
            object cbItensConsulta: TDBLookupComboBox
              Left = 10
              Top = 100
              Width = 247
              Height = 24
              DataField = 'nm_consulta'
              DataSource = dsLayoutItens
              Font.Charset = ANSI_CHARSET
              Font.Color = clBlack
              Font.Height = -13
              Font.Name = 'Tahoma'
              Font.Style = []
              KeyField = 'nm_consulta'
              ListField = 'ds_consulta'
              ListSource = dsConsultas
              ParentFont = False
              TabOrder = 1
            end
            object DBCheckBox1: TDBCheckBox
              Left = 132
              Top = 20
              Width = 53
              Height = 17
              Caption = 'Ativo'
              DataField = 'sn_ativo'
              DataSource = dsLayoutItens
              TabOrder = 2
              ValueChecked = '1'
              ValueUnchecked = '0'
            end
            object dbEdItemOrdem: TDBEdit
              Left = 272
              Top = 100
              Width = 51
              Height = 21
              DataField = 'nr_ordem'
              DataSource = dsLayoutItens
              Enabled = False
              ReadOnly = True
              TabOrder = 3
            end
            object udItemOrdem: TUpDown
              Left = 324
              Top = 99
              Width = 14
              Height = 23
              Max = 32000
              Position = 16000
              TabOrder = 4
              OnClick = udItemOrdemClick
            end
            object DBEdit5: TDBEdit
              Left = 9
              Top = 60
              Width = 328
              Height = 21
              DataField = 'ds_item'
              DataSource = dsLayoutItens
              TabOrder = 5
            end
            object DBEdit9: TDBEdit
              Left = 9
              Top = 143
              Width = 77
              Height = 21
              DataField = 'chr_separador'
              DataSource = dsLayoutItens
              TabOrder = 6
            end
            object DBLookupComboBox2: TDBLookupComboBox
              Left = 98
              Top = 143
              Width = 239
              Height = 21
              DataField = 'cd_layout_item_pai'
              DataSource = dsLayoutItens
              KeyField = 'cd_layout_item'
              ListField = 'ds_item'
              ListSource = dsRItensPai
              NullValueKey = 46
              TabOrder = 7
            end
          end
          object Panel20: TPanel
            Left = 0
            Top = 193
            Width = 346
            Height = 20
            Align = alTop
            BevelOuter = bvLowered
            Caption = 'FILTROS DO ITEM'
            Color = clGray
            Font.Charset = ANSI_CHARSET
            Font.Color = clWhite
            Font.Height = -11
            Font.Name = 'Tahoma'
            Font.Style = []
            ParentFont = False
            TabOrder = 2
          end
          object PageControl1: TPageControl
            Left = 0
            Top = 213
            Width = 346
            Height = 256
            ActivePage = tsFiltroCampos
            Align = alClient
            Style = tsFlatButtons
            TabOrder = 3
            object tsFiltroCampos: TTabSheet
              Caption = 'Campos do Filtro'
              ImageIndex = 1
              ExplicitLeft = 0
              ExplicitTop = 0
              ExplicitWidth = 0
              ExplicitHeight = 0
              object Panel21: TPanel
                Left = 0
                Top = 0
                Width = 338
                Height = 25
                Align = alTop
                BevelOuter = bvNone
                TabOrder = 0
                object Label19: TLabel
                  Left = 11
                  Top = 4
                  Width = 370
                  Height = 13
                  Caption = 
                    'Defina abaixo, o filtro para o item ativo. (Bot'#227'o direito para I' +
                    'nserir e Apagar)'
                end
              end
              object Panel22: TPanel
                Left = 328
                Top = 25
                Width = 10
                Height = 200
                Align = alRight
                BevelOuter = bvNone
                TabOrder = 1
              end
              object Panel23: TPanel
                Left = 0
                Top = 25
                Width = 10
                Height = 200
                Align = alLeft
                BevelOuter = bvNone
                TabOrder = 2
              end
              object dgListaFiltros: TDBGrid
                Left = 10
                Top = 25
                Width = 318
                Height = 200
                Hint = 'Dois cliques para mais informa'#231#245'es'
                Align = alClient
                DataSource = dsItensFiltro
                Options = [dgEditing, dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgAlwaysShowSelection, dgConfirmDelete, dgCancelOnExit]
                TabOrder = 3
                TitleFont.Charset = ANSI_CHARSET
                TitleFont.Color = clWindowText
                TitleFont.Height = -11
                TitleFont.Name = 'Tahoma'
                TitleFont.Style = []
                OnEditButtonClick = dgListaFiltrosEditButtonClick
                Columns = <
                  item
                    Expanded = False
                    FieldName = 'lk_ligacao'
                    Title.Caption = 'Liga'#231#227'o'
                    Width = 60
                    Visible = True
                  end
                  item
                    Expanded = False
                    FieldName = 'ds_grupo1'
                    PickList.Strings = (
                      ''
                      '('
                      ')')
                    Title.Caption = 'Grupo'
                    Width = 40
                    Visible = True
                  end
                  item
                    ButtonStyle = cbsEllipsis
                    Expanded = False
                    FieldName = 'ds_campo'
                    Title.Caption = 'Campo'
                    Width = 180
                    Visible = True
                  end
                  item
                    Expanded = False
                    FieldName = 'lk_operador'
                    Title.Caption = 'Operador'
                    Width = 80
                    Visible = True
                  end
                  item
                    Expanded = False
                    FieldName = 'ds_valor'
                    Title.Caption = 'Valor'
                    Width = 180
                    Visible = True
                  end
                  item
                    Expanded = False
                    FieldName = 'ds_grupo2'
                    PickList.Strings = (
                      ''
                      ')'
                      '(')
                    Title.Caption = 'Grupo'
                    Width = 40
                    Visible = True
                  end
                  item
                    Expanded = False
                    FieldName = 'sn_fixo'
                    Title.Caption = 'Fixo'
                    Width = 40
                    Visible = True
                  end
                  item
                    Expanded = False
                    FieldName = 'ds_chave'
                    Width = 100
                    Visible = True
                  end
                  item
                    Expanded = False
                    FieldName = 'ds_dialogo'
                    Width = 150
                    Visible = True
                  end
                  item
                    Expanded = False
                    FieldName = 'descTipo'
                    Title.Caption = 'Tipo'
                    Visible = True
                  end>
              end
            end
            object TabSheet3: TTabSheet
              Caption = '  Ajuda  '
              ImageIndex = 2
              ExplicitLeft = 0
              ExplicitTop = 0
              ExplicitWidth = 0
              ExplicitHeight = 0
              object Memo2: TMemo
                Left = 0
                Top = 0
                Width = 338
                Height = 225
                Align = alClient
                BorderStyle = bsNone
                Color = clBtnFace
                Font.Charset = ANSI_CHARSET
                Font.Color = clWindowText
                Font.Height = -13
                Font.Name = 'Courier New'
                Font.Style = []
                ParentFont = False
                ReadOnly = True
                TabOrder = 0
              end
            end
            object tsConsultas: TTabSheet
              Caption = '  SQL Antes  '
              ImageIndex = 2
              ExplicitLeft = 0
              ExplicitTop = 0
              ExplicitWidth = 0
              ExplicitHeight = 0
              object DBMemo3: TDBMemo
                Left = 0
                Top = 0
                Width = 338
                Height = 225
                Align = alClient
                DataField = 'me_sqls_antes'
                DataSource = dsLayoutItens
                TabOrder = 0
              end
            end
            object TabSheet5: TTabSheet
              Caption = 'SQL Depois'
              ImageIndex = 3
              ExplicitLeft = 0
              ExplicitTop = 0
              ExplicitWidth = 0
              ExplicitHeight = 0
              object DBMemo4: TDBMemo
                Left = 0
                Top = 0
                Width = 338
                Height = 225
                Align = alClient
                DataField = 'me_sqls_depois'
                DataSource = dsLayoutItens
                TabOrder = 0
              end
            end
          end
        end
      end
    end
    object tsEspec: TTabSheet
      Caption = '    Especifica'#231#245'es do Item    '
      ImageIndex = 3
      ExplicitLeft = 0
      ExplicitTop = 0
      ExplicitWidth = 0
      ExplicitHeight = 0
      object Panel13: TPanel
        Left = 0
        Top = 0
        Width = 792
        Height = 469
        Align = alClient
        BevelOuter = bvNone
        TabOrder = 0
        object Bevel3: TBevel
          Left = 385
          Top = 0
          Width = 6
          Height = 469
          Align = alLeft
          Shape = bsFrame
        end
        object Panel14: TPanel
          Left = 391
          Top = 0
          Width = 401
          Height = 469
          Align = alClient
          BevelOuter = bvNone
          TabOrder = 0
          object Panel15: TPanel
            Left = 0
            Top = 20
            Width = 401
            Height = 5
            Align = alTop
            BevelOuter = bvNone
            TabOrder = 0
          end
          object Panel16: TPanel
            Left = 0
            Top = 0
            Width = 401
            Height = 20
            Align = alTop
            BevelOuter = bvLowered
            Caption = 'PERMISS'#213'ES CADASTRADAS'
            Color = clGray
            Font.Charset = ANSI_CHARSET
            Font.Color = clWhite
            Font.Height = -11
            Font.Name = 'Tahoma'
            Font.Style = []
            ParentFont = False
            TabOrder = 1
          end
          object DBGrid2: TDBGrid
            Left = 0
            Top = 25
            Width = 401
            Height = 444
            Align = alClient
            BorderStyle = bsNone
            DataSource = dsItensEspec
            Font.Charset = ANSI_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'Arial'
            Font.Style = []
            Options = [dgTitles, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgAlwaysShowSelection, dgConfirmDelete, dgCancelOnExit]
            ParentFont = False
            TabOrder = 2
            TitleFont.Charset = ANSI_CHARSET
            TitleFont.Color = clWindowText
            TitleFont.Height = -11
            TitleFont.Name = 'Arial'
            TitleFont.Style = []
            Columns = <
              item
                Alignment = taCenter
                Expanded = False
                FieldName = 'cd_layout_espec'
                Title.Alignment = taCenter
                Title.Caption = 'C'#243'digo'
                Width = 50
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'ds_descricao'
                Title.Alignment = taCenter
                Title.Caption = 'Descri'#231#227'o'
                Width = 200
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'valor'
                Title.Alignment = taCenter
                Title.Caption = 'Valor'
                Width = 200
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'chr_preenche'
                Title.Alignment = taCenter
                Title.Caption = 'Preench.'
                Width = 40
                Visible = True
              end
              item
                Alignment = taCenter
                Expanded = False
                FieldName = 'nr_tamanho'
                Title.Alignment = taCenter
                Title.Caption = 'Tamanho'
                Width = 40
                Visible = True
              end
              item
                Alignment = taCenter
                Expanded = False
                FieldName = 'nr_ordem'
                Title.Alignment = taCenter
                Title.Caption = 'Ordem'
                Width = 40
                Visible = True
              end>
          end
        end
        object Panel17: TPanel
          Left = 0
          Top = 0
          Width = 385
          Height = 469
          Align = alLeft
          BevelOuter = bvNone
          TabOrder = 1
          object Panel18: TPanel
            Left = 0
            Top = 0
            Width = 385
            Height = 20
            Align = alTop
            BevelOuter = bvLowered
            Caption = 'DADOS B'#193'SICOS'
            Color = clGray
            Font.Charset = ANSI_CHARSET
            Font.Color = clWhite
            Font.Height = -11
            Font.Name = 'Tahoma'
            Font.Style = []
            ParentFont = False
            TabOrder = 0
          end
          object Panel19: TPanel
            Left = 0
            Top = 20
            Width = 385
            Height = 141
            Align = alTop
            BevelOuter = bvLowered
            Font.Charset = ANSI_CHARSET
            Font.Color = clBlack
            Font.Height = -11
            Font.Name = 'Tahoma'
            Font.Style = []
            ParentFont = False
            TabOrder = 1
            object Label9: TLabel
              Left = 8
              Top = 13
              Width = 101
              Height = 13
              Caption = 'C'#243'd da Especifica'#231#227'o'
              FocusControl = DBEdit1
            end
            object Label7: TLabel
              Left = 9
              Top = 54
              Width = 50
              Height = 13
              Caption = 'Descri'#231#227'o:'
              FocusControl = DBEdit6
            end
            object Label5: TLabel
              Left = 9
              Top = 96
              Width = 48
              Height = 13
              Caption = 'Tamanho:'
              FocusControl = DBEdit7
            end
            object Label10: TLabel
              Left = 85
              Top = 96
              Width = 75
              Height = 13
              Caption = 'Preenchimento:'
              FocusControl = DBEdit8
            end
            object Label12: TLabel
              Left = 281
              Top = 95
              Width = 36
              Height = 13
              Caption = 'Ordem:'
            end
            object Label13: TLabel
              Left = 120
              Top = 12
              Width = 24
              Height = 13
              Caption = 'Tipo:'
            end
            object Label15: TLabel
              Left = 173
              Top = 96
              Width = 40
              Height = 13
              Caption = 'Posi'#231#227'o:'
            end
            object DBEdit1: TDBEdit
              Left = 8
              Top = 27
              Width = 97
              Height = 21
              DataField = 'cd_layout_espec'
              DataSource = dsItensEspec
              Enabled = False
              ReadOnly = True
              TabOrder = 0
            end
            object DBEdit6: TDBEdit
              Left = 8
              Top = 68
              Width = 361
              Height = 21
              DataField = 'ds_descricao'
              DataSource = dsItensEspec
              TabOrder = 1
            end
            object DBEdit7: TDBEdit
              Left = 8
              Top = 110
              Width = 65
              Height = 21
              DataField = 'nr_tamanho'
              DataSource = dsItensEspec
              TabOrder = 2
              OnKeyPress = DBEdit7KeyPress
            end
            object DBEdit8: TDBEdit
              Left = 84
              Top = 110
              Width = 77
              Height = 21
              DataField = 'chr_preenche'
              DataSource = dsItensEspec
              TabOrder = 3
            end
            object dbEdEspecFiltro: TDBEdit
              Left = 280
              Top = 109
              Width = 75
              Height = 21
              DataField = 'nr_ordem'
              DataSource = dsItensEspec
              Enabled = False
              ReadOnly = True
              TabOrder = 4
            end
            object udEspecOrdem: TUpDown
              Left = 356
              Top = 108
              Width = 14
              Height = 23
              Max = 32000
              Position = 16000
              TabOrder = 5
              OnClick = udEspecOrdemClick
            end
            object cbEspecTipo: TDBLookupComboBox
              Left = 118
              Top = 27
              Width = 253
              Height = 21
              DataField = 'cd_tipo'
              DataSource = dsItensEspec
              Font.Charset = ANSI_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'Tahoma'
              Font.Style = []
              KeyField = 'cd_situacao'
              ListField = 'ds_valor'
              ListSource = dsREspecTipos
              ParentFont = False
              TabOrder = 6
            end
            object DBLookupComboBox1: TDBLookupComboBox
              Left = 171
              Top = 109
              Width = 102
              Height = 21
              DataField = 'chr_posicao'
              DataSource = dsItensEspec
              KeyField = 'cd_situacao'
              ListField = 'ds_valor'
              ListSource = dsRPosicoes
              TabOrder = 7
            end
          end
          object Panel24: TPanel
            Left = 0
            Top = 161
            Width = 385
            Height = 20
            Align = alTop
            BevelOuter = bvLowered
            Caption = 'VALOR DO CAMPO'
            Color = clGray
            Font.Charset = ANSI_CHARSET
            Font.Color = clWhite
            Font.Height = -11
            Font.Name = 'Tahoma'
            Font.Style = []
            ParentFont = False
            TabOrder = 2
          end
          object PageControl2: TPageControl
            Left = 0
            Top = 181
            Width = 385
            Height = 288
            ActivePage = TabSheet2
            Align = alClient
            Style = tsFlatButtons
            TabOrder = 3
            object TabSheet2: TTabSheet
              Caption = '  Descri'#231#227'o Completa  '
              ImageIndex = 1
              ExplicitLeft = 0
              ExplicitTop = 0
              ExplicitWidth = 0
              ExplicitHeight = 0
              object DBMemo2: TDBMemo
                Left = 0
                Top = 57
                Width = 377
                Height = 200
                Align = alClient
                DataField = 'ds_valor'
                DataSource = dsItensEspec
                Font.Charset = ANSI_CHARSET
                Font.Color = clWindowText
                Font.Height = -13
                Font.Name = 'Courier New'
                Font.Style = []
                ParentFont = False
                ScrollBars = ssVertical
                TabOrder = 0
                WantTabs = True
                WordWrap = False
                OnDragDrop = DBMemo2DragDrop
                OnDragOver = DBMemo2DragOver
                OnKeyPress = DBMemo2KeyPress
              end
              object Panel25: TPanel
                Left = 0
                Top = 0
                Width = 377
                Height = 57
                Align = alTop
                BevelOuter = bvNone
                TabOrder = 1
                object Label11: TLabel
                  Left = 1
                  Top = 4
                  Width = 209
                  Height = 13
                  Caption = 'Defina o conte'#250'do da especifica'#231#227'o abaixo:'
                end
                object btnCampos: TBitBtn
                  Left = 1
                  Top = 24
                  Width = 80
                  Height = 24
                  Caption = 'Campos'
                  TabOrder = 0
                  OnClick = btnCamposClick
                end
                object btnFuncoes: TBitBtn
                  Left = 89
                  Top = 24
                  Width = 80
                  Height = 24
                  Caption = 'Fun'#231#245'es'
                  TabOrder = 1
                  OnClick = btnFuncoesClick
                end
                object btnLimpar: TBitBtn
                  Left = 297
                  Top = 24
                  Width = 80
                  Height = 24
                  Caption = 'Limpar'
                  TabOrder = 2
                  OnClick = btnLimparClick
                end
              end
            end
            object TabSheet4: TTabSheet
              Caption = '  Ajuda  '
              ImageIndex = 2
              ExplicitLeft = 0
              ExplicitTop = 0
              ExplicitWidth = 0
              ExplicitHeight = 0
              object Memo3: TMemo
                Left = 0
                Top = 0
                Width = 377
                Height = 257
                Align = alClient
                BorderStyle = bsNone
                Color = clBtnFace
                Font.Charset = ANSI_CHARSET
                Font.Color = clWindowText
                Font.Height = -13
                Font.Name = 'Courier New'
                Font.Style = []
                ParentFont = False
                ReadOnly = True
                TabOrder = 0
              end
            end
          end
        end
      end
    end
  end
  object toolPessoa: TToolBar
    Left = 0
    Top = 528
    Width = 800
    Height = 25
    Align = alBottom
    ButtonWidth = 99
    Caption = 'tbAcoes'
    EdgeBorders = [ebTop, ebBottom]
    Images = ilAcoes
    List = True
    ShowCaptions = True
    TabOrder = 2
    object tlbSep1: TToolButton
      Left = 0
      Top = 0
      Width = 8
      Caption = 'tlbSep1'
      ImageIndex = 9
      Style = tbsSeparator
    end
    object dbNav: TDBNavigator
      Left = 8
      Top = 0
      Width = 104
      Height = 22
      VisibleButtons = [nbFirst, nbPrior, nbNext, nbLast]
      Flat = True
      TabOrder = 0
    end
    object tlbSep2: TToolButton
      Left = 112
      Top = 0
      Width = 8
      Caption = 'tlbSep2'
      ImageIndex = 9
      Style = tbsSeparator
    end
    object btnInserir: TToolButton
      Left = 120
      Top = 0
      AutoSize = True
      Caption = 'F2 Incluir'
      ImageIndex = 0
      OnClick = btnInserirClick
    end
    object btnAlterar: TToolButton
      Left = 195
      Top = 0
      AutoSize = True
      Caption = 'F3 Alterar'
      ImageIndex = 1
      OnClick = btnAlterarClick
    end
    object btnExcluir: TToolButton
      Left = 274
      Top = 0
      AutoSize = True
      Caption = 'F4 Excluir'
      ImageIndex = 2
      OnClick = btnExcluirClick
    end
    object tlbSep3: TToolButton
      Left = 351
      Top = 0
      Width = 8
      Caption = 'tlbSep3'
      ImageIndex = 3
      Style = tbsSeparator
    end
    object btnSalvar: TToolButton
      Left = 359
      Top = 0
      AutoSize = True
      Caption = 'F5 Salvar'
      ImageIndex = 3
      OnClick = btnSalvarClick
    end
    object btnCancelar: TToolButton
      Left = 435
      Top = 0
      AutoSize = True
      Caption = 'Cancelar'
      ImageIndex = 4
      OnClick = btnCancelarClick
    end
    object tlbSep5: TToolButton
      Left = 508
      Top = 0
      Width = 8
      Caption = 'tlbSep5'
      ImageIndex = 8
      Style = tbsSeparator
    end
    object btnExpLayout: TToolButton
      Left = 516
      Top = 0
      AutoSize = True
      Caption = 'Export. Layout'
      ImageIndex = 9
      Visible = False
      OnClick = btnExpLayoutClick
    end
    object btnImpLayout: TToolButton
      Left = 619
      Top = 0
      AutoSize = True
      Caption = 'Import. Layout'
      ImageIndex = 8
      Visible = False
    end
    object tlbSep4: TToolButton
      Left = 722
      Top = 0
      Width = 8
      Caption = 'tlbSep4'
      ImageIndex = 6
      Style = tbsSeparator
    end
    object btnFechar: TToolButton
      Left = 730
      Top = 0
      Caption = 'F12 Fechar'
      ImageIndex = 7
      OnClick = btnFecharClick
    end
  end
  object ilAcoes: TImageList
    Left = 672
    Top = 504
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
      00000000000000000000000000000000000000000000C8CFD300C8D0D400C8D1
      D700D1D8DC00D1D7DB00CACDCF00B9BABB00B6B7B800C7CCCE00D2D9DC00D3DB
      DE00D1D8DC00CAD3D700C8D0D400C8D0D4000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000009B9C9B009B9C9B00636563006365
      6300636563006365630063656300636563006365630063656300636563006365
      6300636563009B9C9B000000000000000000C8D0D400C9D2D600D1D8DC00D1D8
      DB00C5C8C9008E837F00686261006662610051494700534B460074646100B0AE
      AE00C7CBCC00D1D6DA00D1D8DC00CAD4D8000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000063656300CECFCE00000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000CECFCE00636563009B9C9B0000000000D1D8DC00D2D9DC00C5C8C9007C79
      79006863620073727100A1A6A500BFBCBD004F4848003A363500413735004539
      3400544A440083787000BDBEBF00D1D6DA000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000063656300CECFCE00636563006365
      6300636563006365630063656300636563006365630063656300636563006365
      6300CECFCE00636563006365630000000000C5C9CA00807F7E00716D6C008885
      8300C4C5C500C7C8C800ACAFAF00A7A7A7003E3C3C0043434300727579008381
      84006E646300504540004D433D00807E79000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000063656300CECFCE00CECFCE00CECF
      CE00CECFCE00CECFCE00CECFCE00CECFCE00CECFCE00CECFCE00CECFCE00CECF
      CE00CECFCE006365630063656300000000007C7D7F00A19C9D00CBCBCB00C4C4
      C400A4A2A20096959500BCBCBC00BEBEBE0065646500565555005B5B5B008B91
      9100ABA8A800C4A8A800C7ADAD00574D48000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000063656300CECFCE00CECFCE00CECF
      CE00CECFCE00CECFCE00CECFCE00CECFCE00CECFCE00CECFCE00CECFCE00009A
      000000FF000063656300636563000000000088909700C1C1C100B9BAB900BEBE
      BE00D1D1D100DEDEDE00DEDEDE00B6B4B300B4B0AE00BAB6B600A8A8A8006A68
      68006A67670097737400DABFBF00645751000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000009B9C9B0000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000636563006365630000000000ADB2BC00B0B7B500A1AAAA00B8BF
      BF00D0D1D100D6D8D800D8CDCD006F49460052403B0057504A006F666200CBC5
      C100D1C5C3008B81790095B0DC00A8A695000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000009B9C9B00F3F3F300CECF
      CE00CECFCE00CECFCE00CECFCE00CECFCE00CECFCE00CECFCE00CECFCE00CECF
      CE00CECFCE00CECFCE009B9C9B0000000000A9B3B700978E8D007F5A5A00A283
      83007763630071696900A0999900CF555600C2A0A000D1BFBE00A49D7900A3A1
      A800B4AF9E00A78C660089A9EF00BAC5ED000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000000000009B9C9B009B9C
      9B009B9C9B009B9C9B009B9C9B009B9C9B00000000009B9C9B009B9C9B009B9C
      9B009B9C9B009B9C9B009B9C9B00000000009DB1B500C3B4B400D06C6C00CBA6
      A700B78B8B00C19C9C00C7A2A200CC585800906E7100D16A6800DBDBF5003051
      FF002748F300304DF000284CFF00CCD3E5000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000003EB3FF0000CFFF0000000000000000000000
      0000000000000000000000000000000000009DB1B500C0B3B100BC6D6D00B591
      8F00A28A8700936F7100C58D8D00C8575700C6A2A200AA595700BCBBD6003253
      FF004768F900849CEF00C0C6E500D5D6C7000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000003EB3FF0046DDFF0000CFFF0046DDFF00000000000000
      0000000000000000000000000000000000009DAEB200C4B6B4009A6D6D007662
      5E007B71630077707400BD989800CD595900A6929300CCB9B900C3C3BE00C0CB
      E500CAAFC000B9594E0086897900CFD4D6000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000003EB3FF003EB3FF003EB3FF0000CFFF0000000000000000000000
      000000000000000000000000000000000000A4B3B700C9BFBF00C8A2A2008D7A
      7C0074696A007E73740099868600D15D5D009D4E4E00A45555008B5454008A5D
      5B00B35C5A0088413F007E8C8700D1D9DC000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000003EB3FF0000CFFF0000000000000000000000
      000000000000000000000000000000000000AEB6BA0074757600AA929100B8A8
      A800BBACAC00D6C3C300D1B6B600C75757009A989800D1C7C700C9ABAC00BD80
      8000BD575800934441007F928B00D2D9DC000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000003EB3FF0000CFFF0000000000000000000000
      000000000000000000000000000000000000CDD2D60090989900707373006466
      6800626366006665650083848400C95858009F919100D4D7D700D0D7D700DCE4
      E400B8A3A300893F3C007F938C00D1D8DC000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000003EB3FF0000CFFF0000000000000000000000
      000000000000000000000000000000000000CED7DB00D2D9DC00D1D6D900CFD3
      D600C7CBCC00ABB7B700ABABAC00C9595900A17F7F00D8D9D900CFCECE00DCDF
      DF00BC939500843D3A007E898100D1D8DC000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000003EB3FF00009AFF0000000000000000000000
      000000000000000000000000000000000000C8D0D400C8D0D400C8D0D600C9D4
      D800CFD7DB00D2DADD00CECED000C3AEAC00B3B7B700B9B6B700AFA5A500CECC
      CC00B2969900A05756009FB3B100D1D6DA000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
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
      0000000000000000000000000000000080038000000000000001000000000000
      3FF0000000000000000000000000000000000000000000000000000000000000
      7FF80000000000008000000000000000C001000000000000FE3F000000000000
      FC1F000000000000F80F000000000000FE3F000000000000FE3F000000000000
      FE3F000000000000FE3F000000000000FFFFF8F8FFFFFFFFF83FFAFAFC7FE3FF
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
  object qyLayouts: TUMZQuery
    Connection = DM.ZConn
    AfterOpen = qyLayoutsAfterOpen
    SQL.Strings = (
      'SELECT * FROM expo_layouts ORDER BY ds_layout')
    Params = <>
    Left = 728
    Top = 96
    object qyLayoutsds_layout: TStringField
      FieldName = 'ds_layout'
      Size = 255
    end
    object qyLayoutsme_layout: TBlobField
      FieldName = 'me_layout'
    end
    object qyLayoutscd_formato: TIntegerField
      FieldName = 'cd_formato'
    end
    object qyLayoutssn_ativo: TSmallintField
      FieldName = 'sn_ativo'
    end
    object qyLayoutscd_layout: TIntegerField
      FieldName = 'cd_layout'
    end
    object qyLayoutsnm_arquivo_padrao: TStringField
      FieldName = 'nm_arquivo_padrao'
      Size = 240
    end
    object qyLayoutssn_exportacao: TSmallintField
      FieldName = 'sn_exportacao'
      Required = True
    end
    object qyLayoutsSN_USAR_CH_SIT: TSmallintField
      FieldName = 'SN_USAR_CH_SIT'
      Required = True
    end
    object qyLayoutsSN_USAR_ANOSEMESTRE: TSmallintField
      FieldName = 'SN_USAR_ANOSEMESTRE'
      Required = True
    end
  end
  object dsLayouts: TDataSource
    AutoEdit = False
    DataSet = qyLayouts
    OnStateChange = dsLayoutsStateChange
    OnDataChange = dsLayoutsDataChange
    Left = 760
    Top = 96
  end
  object qyItensFiltro: TUMZQuery
    Connection = DM.ZConn
    AfterOpen = qyItensFiltroAfterOpen
    BeforePost = qyItensFiltroBeforePost
    SQL.Strings = (
      'SELECT'
      '  *'
      'FROM'
      '   expo_layout_filtros'
      'WHERE'
      '  cd_item = :cd_layout_item'
      'ORDER BY'
      '  nr_ordem')
    Params = <
      item
        DataType = ftUnknown
        Name = 'cd_layout_item'
        ParamType = ptUnknown
      end>
    DataSource = dsLayoutItens
    Left = 728
    Top = 464
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'cd_layout_item'
        ParamType = ptUnknown
      end>
    object qyItensFiltrocd_layout_filtro: TLargeintField
      FieldName = 'cd_layout_filtro'
    end
    object qyItensFiltrods_ligacao: TStringField
      FieldName = 'ds_ligacao'
      Size = 10
    end
    object qyItensFiltrods_grupo1: TStringField
      FieldName = 'ds_grupo1'
      Size = 10
    end
    object qyItensFiltrods_campo: TStringField
      FieldName = 'ds_campo'
      Required = True
      Size = 255
    end
    object qyItensFiltrods_operador: TStringField
      FieldName = 'ds_operador'
      Required = True
      Size = 50
    end
    object qyItensFiltrods_valor: TStringField
      FieldName = 'ds_valor'
      Required = True
      Size = 255
    end
    object qyItensFiltrods_grupo2: TStringField
      FieldName = 'ds_grupo2'
      Size = 10
    end
    object qyItensFiltronr_ordem: TLargeintField
      FieldName = 'nr_ordem'
    end
    object qyItensFiltrolk_ligacao: TStringField
      FieldKind = fkLookup
      FieldName = 'lk_ligacao'
      LookupDataSet = qyRFilLigacao
      LookupKeyFields = 'ds_sigla'
      LookupResultField = 'ds_valor'
      KeyFields = 'ds_ligacao'
      Size = 50
      Lookup = True
    end
    object qyItensFiltrolk_operador: TStringField
      FieldKind = fkLookup
      FieldName = 'lk_operador'
      LookupDataSet = qyRFilOper
      LookupKeyFields = 'ds_sigla'
      LookupResultField = 'ds_valor'
      KeyFields = 'ds_operador'
      Size = 50
      Lookup = True
    end
    object qyItensFiltrosn_fixo: TSmallintField
      FieldName = 'sn_fixo'
    end
    object qyItensFiltrocd_item: TLargeintField
      FieldName = 'cd_item'
    end
    object qyItensFiltrods_chave: TStringField
      DisplayLabel = 'Chave Di'#225'logo'
      FieldName = 'ds_chave'
      Size = 30
    end
    object qyItensFiltrods_dialogo: TStringField
      DisplayLabel = 'Texto Di'#225'logo'
      FieldName = 'ds_dialogo'
      Size = 100
    end
    object qyItensFiltrods_tipo: TStringField
      FieldName = 'ds_tipo'
      Size = 3
    end
    object qyItensFiltrodescTipo: TStringField
      FieldKind = fkLookup
      FieldName = 'descTipo'
      LookupDataSet = qyRFilTipo
      LookupKeyFields = 'ds_sigla'
      LookupResultField = 'ds_valor'
      KeyFields = 'ds_tipo'
      Lookup = True
    end
  end
  object qyLayoutItens: TUMZQuery
    Connection = DM.ZConn
    AfterOpen = qyLayoutItensAfterOpen
    BeforeClose = qyLayoutItensBeforeClose
    BeforePost = qyLayoutItensBeforePost
    SQL.Strings = (
      'SELECT'
      '  *'
      'FROM'
      '  expo_layout_itens'
      'WHERE'
      '  cd_layout = :cd_layout'
      'ORDER BY'
      '  nr_ordem')
    Params = <
      item
        DataType = ftUnknown
        Name = 'cd_layout'
        ParamType = ptUnknown
      end>
    DataSource = dsLayouts
    Left = 728
    Top = 124
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'cd_layout'
        ParamType = ptUnknown
      end>
    object qyLayoutItensnm_consulta: TStringField
      FieldName = 'nm_consulta'
      Size = 50
    end
    object qyLayoutItensds_item: TStringField
      FieldName = 'ds_item'
      Size = 100
    end
    object qyLayoutItensnr_ordem: TLargeintField
      FieldName = 'nr_ordem'
    end
    object qyLayoutItenssn_ativo: TSmallintField
      FieldName = 'sn_ativo'
    end
    object qyLayoutItenschr_separador: TStringField
      FieldName = 'chr_separador'
    end
    object qyLayoutItenscd_layout_item: TIntegerField
      FieldName = 'cd_layout_item'
    end
    object qyLayoutItenscd_layout: TIntegerField
      FieldName = 'cd_layout'
    end
    object qyLayoutItenscd_layout_item_pai: TIntegerField
      FieldName = 'cd_layout_item_pai'
    end
    object qyLayoutItensme_sqls_antes: TMemoField
      FieldName = 'me_sqls_antes'
      BlobType = ftMemo
    end
    object qyLayoutItensme_sqls_depois: TMemoField
      FieldName = 'me_sqls_depois'
      BlobType = ftMemo
    end
  end
  object dsItensFiltro: TDataSource
    DataSet = qyItensFiltro
    Left = 760
    Top = 464
  end
  object dsLayoutItens: TDataSource
    AutoEdit = False
    DataSet = qyLayoutItens
    OnStateChange = dsLayoutItensStateChange
    Left = 760
    Top = 124
  end
  object dsConsultas: TDataSource
    AutoEdit = False
    DataSet = qyRConsultas
    Left = 760
    Top = 208
  end
  object pmFuncoes: TPopupMenu
    Left = 344
    Top = 472
    object N1: TMenuItem
      Caption = '-'
      OnClick = MenuItemClick
    end
  end
  object qyRConsultas: TUMZQuery
    Connection = DM.ZConn
    SQL.Strings = (
      'SELECT nm_consulta, ds_consulta'
      'FROM expo_consultas WHERE sn_ativo = 1 ORDER BY ds_consulta')
    Params = <>
    DataSource = dsLayoutItens
    Left = 728
    Top = 208
    object qyRConsultasnm_consulta: TStringField
      FieldName = 'nm_consulta'
      Size = 50
    end
    object qyRConsultasds_consulta: TStringField
      FieldName = 'ds_consulta'
      Size = 255
    end
  end
  object qyRFormatos: TUMZQuery
    Connection = DM.ZConn
    SQL.Strings = (
      'SELECT nm_consulta, ds_consulta'
      'FROM expo_consultas WHERE sn_ativo = 1 ORDER BY ds_consulta')
    Params = <>
    DataSource = dsLayoutItens
    Left = 728
    Top = 236
    object StringField3: TStringField
      FieldName = 'nm_consulta'
      Size = 50
    end
    object StringField4: TStringField
      FieldName = 'ds_consulta'
      Size = 255
    end
  end
  object dsRFormatos: TDataSource
    AutoEdit = False
    DataSet = qyRFormatos
    Left = 760
    Top = 236
  end
  object qyRFilLigacao: TUMZQuery
    Connection = DM.ZConn
    SQL.Strings = (
      'SELECT '
      '       ds_sigla, ds_valor '
      'FROM '
      '       situacoes'
      'WHERE'
      '       cd_modulo = 15001'
      'ORDER BY'
      '       cd_situacao')
    Params = <>
    DataSource = dsLayoutItens
    Left = 728
    Top = 328
    object qyRFilLigacaods_sigla: TStringField
      FieldName = 'ds_sigla'
      Size = 50
    end
    object qyRFilLigacaods_valor: TStringField
      FieldName = 'ds_valor'
      Size = 255
    end
  end
  object dsRFilLigacao: TDataSource
    AutoEdit = False
    DataSet = qyRFilLigacao
    Left = 760
    Top = 328
  end
  object qyRFilOper: TUMZQuery
    Connection = DM.ZConn
    SQL.Strings = (
      'SELECT '
      '       ds_sigla, ds_valor '
      'FROM '
      '       situacoes'
      'WHERE'
      '       cd_modulo = 15002'
      'ORDER BY'
      '       cd_situacao')
    Params = <>
    DataSource = dsLayoutItens
    Left = 728
    Top = 356
    object StringField1: TStringField
      FieldName = 'ds_sigla'
      Size = 50
    end
    object StringField2: TStringField
      FieldName = 'ds_valor'
      Size = 255
    end
  end
  object dsRFilOper: TDataSource
    AutoEdit = False
    DataSet = qyRFilOper
    Left = 760
    Top = 356
  end
  object qyItensEspec: TUMZQuery
    Connection = DM.ZConn
    AfterOpen = qyItensEspecAfterOpen
    BeforeClose = qyItensEspecBeforeClose
    OnCalcFields = qyItensEspecCalcFields
    BeforePost = qyItensEspecBeforePost
    SQL.Strings = (
      'SELECT'
      '  *'
      'FROM'
      '  expo_layout_espec'
      'WHERE'
      '  cd_item = :cd_layout_item'
      'ORDER BY'
      '  nr_ordem')
    Params = <
      item
        DataType = ftUnknown
        Name = 'cd_layout_item'
        ParamType = ptUnknown
      end>
    DataSource = dsLayoutItens
    Left = 728
    Top = 152
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'cd_layout_item'
        ParamType = ptUnknown
      end>
    object qyItensEspecds_descricao: TStringField
      FieldName = 'ds_descricao'
      Required = True
      Size = 255
    end
    object qyItensEspecnr_tamanho: TLargeintField
      FieldName = 'nr_tamanho'
      Required = True
    end
    object qyItensEspecchr_preenche: TStringField
      FieldName = 'chr_preenche'
      Size = 10
    end
    object qyItensEspecnr_ordem: TLargeintField
      FieldName = 'nr_ordem'
    end
    object qyItensEspecds_valor: TMemoField
      FieldName = 'ds_valor'
      BlobType = ftMemo
    end
    object qyItensEspecvalor: TStringField
      FieldKind = fkCalculated
      FieldName = 'valor'
      Size = 50
      Calculated = True
    end
    object qyItensEspecchr_posicao: TIntegerField
      FieldName = 'chr_posicao'
    end
    object qyItensEspeccd_tipo: TIntegerField
      FieldName = 'cd_tipo'
    end
    object qyItensEspeccd_item: TIntegerField
      FieldName = 'cd_item'
    end
    object qyItensEspeccd_layout_espec: TIntegerField
      FieldName = 'cd_layout_espec'
    end
  end
  object dsItensEspec: TDataSource
    AutoEdit = False
    DataSet = qyItensEspec
    OnStateChange = dsItensEspecStateChange
    Left = 760
    Top = 152
  end
  object qyREspecTipos: TUMZQuery
    Connection = DM.ZConn
    SQL.Strings = (
      'SELECT '
      '       cd_situacao, ds_valor '
      'FROM '
      '       situacoes'
      'WHERE'
      '       cd_modulo = 15004'
      'ORDER BY'
      '       cd_situacao')
    Params = <>
    DataSource = dsLayoutItens
    Left = 728
    Top = 264
    object qyREspecTiposcd_situacao: TIntegerField
      FieldName = 'cd_situacao'
    end
    object qyREspecTiposds_valor: TStringField
      FieldName = 'ds_valor'
      Size = 255
    end
  end
  object dsREspecTipos: TDataSource
    AutoEdit = False
    DataSet = qyREspecTipos
    Left = 760
    Top = 264
  end
  object qyRPosicoes: TUMZQuery
    Connection = DM.ZConn
    SQL.Strings = (
      'SELECT '
      '       cd_situacao, ds_valor '
      'FROM '
      '       situacoes'
      'WHERE'
      '       cd_modulo = 15005'
      'ORDER BY'
      '       cd_situacao')
    Params = <>
    DataSource = dsLayoutItens
    Left = 728
    Top = 396
    object qyRPosicoescd_situacao: TIntegerField
      FieldName = 'cd_situacao'
    end
    object qyRPosicoesds_valor: TStringField
      FieldName = 'ds_valor'
      Size = 255
    end
  end
  object dsRPosicoes: TDataSource
    AutoEdit = False
    DataSet = qyRPosicoes
    Left = 760
    Top = 396
  end
  object qyRItensPai: TUMZQuery
    Connection = DM.ZConn
    SQL.Strings = (
      'SELECT'
      '       cd_layout_item, ds_item'
      'FROM'
      '       expo_layout_itens'
      'WHERE'
      '   cd_layout = :cd_layout'
      'ORDER BY'
      '       ds_item')
    Params = <
      item
        DataType = ftUnknown
        Name = 'cd_layout'
        ParamType = ptUnknown
      end>
    DataSource = dsLayouts
    Left = 728
    Top = 428
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'cd_layout'
        ParamType = ptUnknown
      end>
    object qyRItensPaids_item: TStringField
      FieldName = 'ds_item'
      Size = 100
    end
    object qyRItensPaicd_layout_item: TIntegerField
      FieldName = 'cd_layout_item'
    end
  end
  object dsRItensPai: TDataSource
    AutoEdit = False
    DataSet = qyRItensPai
    Left = 760
    Top = 428
  end
  object qyRExpo: TUMZQuery
    Connection = DM.ZConn
    Params = <>
    Left = 472
    Top = 420
  end
  object qyRFilTipo: TUMZQuery
    Connection = DM.ZConn
    SQL.Strings = (
      'SELECT '
      '       ds_sigla, ds_valor '
      'FROM '
      '       situacoes'
      'WHERE'
      '       cd_modulo = 15006'
      'ORDER BY'
      '       cd_situacao')
    Params = <>
    DataSource = dsLayoutItens
    Left = 672
    Top = 356
    object StringField5: TStringField
      FieldName = 'ds_sigla'
      Size = 50
    end
    object StringField6: TStringField
      FieldName = 'ds_valor'
      Size = 255
    end
  end
  object dsRFilTipo: TDataSource
    AutoEdit = False
    DataSet = qyRFilTipo
    Left = 704
    Top = 356
  end
end
