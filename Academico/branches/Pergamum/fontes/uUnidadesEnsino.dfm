object frmUnidadesEnsino: TfrmUnidadesEnsino
  Left = 177
  Top = 140
  Caption = 'Cadastro de Unidades de Ensino'
  ClientHeight = 569
  ClientWidth = 932
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
  OnMouseWheel = FormMouseWheel
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 14
  object Bevel9: TBevel
    Left = 0
    Top = 562
    Width = 932
    Height = 7
    Align = alBottom
    Shape = bsSpacer
    ExplicitTop = 553
    ExplicitWidth = 804
  end
  object pcGeral: TPageControl
    Left = 0
    Top = 0
    Width = 932
    Height = 537
    ActivePage = tsDeptos
    Align = alClient
    Style = tsFlatButtons
    TabOrder = 0
    OnChange = pcGeralChange
    OnChanging = pcGeralChanging
    object tsColigadas: TTabSheet
      Caption = 'Unidade de Ensino'
      ImageIndex = 6
      object pnUnidadeEnsino: TPanel
        Left = 0
        Top = 0
        Width = 924
        Height = 505
        Align = alClient
        TabOrder = 0
        object pnColigadas: TPanel
          Left = 394
          Top = 27
          Width = 529
          Height = 477
          Align = alClient
          DragMode = dmAutomatic
          TabOrder = 0
          object ScrollBox2: TScrollBox
            Left = 1
            Top = 1
            Width = 527
            Height = 475
            Align = alClient
            TabOrder = 0
            object Panel2: TPanel
              Left = 0
              Top = 1184
              Width = 506
              Height = 502
              Align = alBottom
              BevelOuter = bvNone
              TabOrder = 5
              object Label14: TLabel
                Left = 5
                Top = 448
                Width = 59
                Height = 14
                Caption = 'Longitude:'
                FocusControl = DBEdit13
                Font.Charset = ANSI_CHARSET
                Font.Color = clWindowText
                Font.Height = -11
                Font.Name = 'Arial'
                Font.Style = [fsBold]
                ParentFont = False
              end
              object Label13: TLabel
                Left = 5
                Top = 400
                Width = 48
                Height = 14
                Caption = 'Latitude:'
                FocusControl = DBEdit12
                Font.Charset = ANSI_CHARSET
                Font.Color = clWindowText
                Font.Height = -11
                Font.Name = 'Arial'
                Font.Style = [fsBold]
                ParentFont = False
              end
              object Label8: TLabel
                Left = 5
                Top = 352
                Width = 47
                Height = 14
                Caption = 'N'#250'mero:'
                FocusControl = DBEdit7
                Font.Charset = ANSI_CHARSET
                Font.Color = clWindowText
                Font.Height = -11
                Font.Name = 'Arial'
                Font.Style = [fsBold]
                ParentFont = False
              end
              object Label10: TLabel
                Left = 5
                Top = 304
                Width = 36
                Height = 14
                Caption = 'Bairro:'
                FocusControl = DBEdit9
                Font.Charset = ANSI_CHARSET
                Font.Color = clWindowText
                Font.Height = -11
                Font.Name = 'Arial'
                Font.Style = [fsBold]
                ParentFont = False
              end
              object Label11: TLabel
                Left = 5
                Top = 256
                Width = 24
                Height = 14
                Caption = 'CEP:'
                FocusControl = DBEdit10
                Font.Charset = ANSI_CHARSET
                Font.Color = clWindowText
                Font.Height = -11
                Font.Name = 'Arial'
                Font.Style = [fsBold]
                ParentFont = False
              end
              object Label7: TLabel
                Left = 5
                Top = 208
                Width = 55
                Height = 14
                Caption = 'Endereco:'
                FocusControl = DBEdit5
                Font.Charset = ANSI_CHARSET
                Font.Color = clWindowText
                Font.Height = -11
                Font.Name = 'Arial'
                Font.Style = [fsBold]
                ParentFont = False
              end
              object Label9: TLabel
                Left = 5
                Top = 160
                Width = 82
                Height = 14
                Caption = 'Complemento:'
                FocusControl = DBEdit8
                Font.Charset = ANSI_CHARSET
                Font.Color = clWindowText
                Font.Height = -11
                Font.Name = 'Arial'
                Font.Style = [fsBold]
                ParentFont = False
              end
              object lblMunicipio: TLabel
                Left = 5
                Top = 112
                Width = 56
                Height = 14
                Caption = 'Munic'#237'pio:'
                Font.Charset = ANSI_CHARSET
                Font.Color = clWindowText
                Font.Height = -11
                Font.Name = 'Arial'
                Font.Style = [fsBold]
                ParentFont = False
              end
              object lblEstado: TLabel
                Left = 5
                Top = 64
                Width = 40
                Height = 14
                Align = alCustom
                Caption = 'Estado:'
                Font.Charset = ANSI_CHARSET
                Font.Color = clWindowText
                Font.Height = -11
                Font.Name = 'Arial'
                Font.Style = [fsBold]
                ParentFont = False
              end
              object lblPais: TLabel
                Left = 5
                Top = 16
                Width = 23
                Height = 14
                Caption = 'Pa'#237's'
                Font.Charset = ANSI_CHARSET
                Font.Color = clWindowText
                Font.Height = -11
                Font.Name = 'Arial'
                Font.Style = [fsBold]
                ParentFont = False
              end
              object DBEdit13: TDBEdit
                Left = 5
                Top = 468
                Width = 244
                Height = 22
                DataField = 'ds_longitude'
                DataSource = dtcColigadas
                TabOrder = 9
                OnKeyPress = DBEdit13KeyPress
              end
              object DBEdit12: TDBEdit
                Left = 5
                Top = 420
                Width = 244
                Height = 22
                DataField = 'ds_latitude'
                DataSource = dtcColigadas
                TabOrder = 8
                OnKeyPress = DBEdit12KeyPress
              end
              object DBEdit7: TDBEdit
                Left = 5
                Top = 372
                Width = 244
                Height = 22
                DataField = 'ds_numero'
                DataSource = dtcColigadas
                TabOrder = 7
              end
              object DBEdit9: TDBEdit
                Left = 5
                Top = 324
                Width = 244
                Height = 22
                DataField = 'ds_bairro'
                DataSource = dtcColigadas
                TabOrder = 6
              end
              object DBEdit10: TDBEdit
                Left = 5
                Top = 276
                Width = 244
                Height = 22
                DataField = 'ds_cep'
                DataSource = dtcColigadas
                TabOrder = 5
              end
              object DBEdit5: TDBEdit
                Left = 5
                Top = 228
                Width = 244
                Height = 22
                DataField = 'ds_endereco'
                DataSource = dtcColigadas
                TabOrder = 4
              end
              object DBEdit8: TDBEdit
                Left = 5
                Top = 180
                Width = 239
                Height = 22
                DataField = 'ds_complemento'
                DataSource = dtcColigadas
                TabOrder = 3
              end
              object dblcMunicipio: TDBLookupComboBox
                Left = 5
                Top = 132
                Width = 244
                Height = 22
                DataField = 'descMunicipio'
                DataSource = dtcColigadas
                TabOrder = 2
              end
              object dblcEstado: TDBLookupComboBox
                Left = 5
                Top = 84
                Width = 244
                Height = 22
                DataField = 'descEstado'
                DataSource = dtcColigadas
                TabOrder = 1
              end
              object cmbPais: TComboBox
                Left = 5
                Top = 36
                Width = 244
                Height = 22
                ItemHeight = 14
                TabOrder = 0
                OnSelect = cmbPaisSelect
              end
            end
            object Panel3: TPanel
              Left = 0
              Top = 1160
              Width = 506
              Height = 24
              Align = alBottom
              BevelOuter = bvLowered
              Caption = 'Endere'#231'o'
              Font.Charset = ANSI_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'Arial'
              Font.Style = [fsBold]
              ParentFont = False
              TabOrder = 0
            end
            object Panel4: TPanel
              Left = 0
              Top = 926
              Width = 506
              Height = 24
              Align = alBottom
              BevelOuter = bvLowered
              Caption = 'Testemunhas'
              Font.Charset = ANSI_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'Arial'
              Font.Style = [fsBold]
              ParentFont = False
              TabOrder = 4
            end
            object Panel5: TPanel
              Left = 0
              Top = 950
              Width = 506
              Height = 210
              Align = alBottom
              BevelOuter = bvNone
              Font.Charset = ANSI_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'Arial'
              Font.Style = []
              ParentFont = False
              TabOrder = 3
              object Label72: TLabel
                Left = 5
                Top = 160
                Width = 163
                Height = 14
                Align = alCustom
                Caption = 'CPF da Segunda Testemunha:'
                Font.Charset = ANSI_CHARSET
                Font.Color = clWindowText
                Font.Height = -11
                Font.Name = 'Arial'
                Font.Style = [fsBold]
                ParentFont = False
              end
              object Label71: TLabel
                Left = 5
                Top = 112
                Width = 123
                Height = 14
                Align = alCustom
                Caption = 'Segunda Testemunha:'
                Font.Charset = ANSI_CHARSET
                Font.Color = clWindowText
                Font.Height = -11
                Font.Name = 'Arial'
                Font.Style = [fsBold]
                ParentFont = False
              end
              object Label70: TLabel
                Left = 5
                Top = 64
                Width = 162
                Height = 14
                Align = alCustom
                Caption = 'CPF da Primeira Testemunha:'
                Font.Charset = ANSI_CHARSET
                Font.Color = clWindowText
                Font.Height = -11
                Font.Name = 'Arial'
                Font.Style = [fsBold]
                ParentFont = False
              end
              object Label69: TLabel
                Left = 5
                Top = 16
                Width = 122
                Height = 14
                Align = alCustom
                Caption = 'Primeira Testemunha:'
                Font.Charset = ANSI_CHARSET
                Font.Color = clWindowText
                Font.Height = -11
                Font.Name = 'Arial'
                Font.Style = [fsBold]
                ParentFont = False
              end
              object DBEdit28: TDBEdit
                Tag = 2
                Left = 5
                Top = 180
                Width = 244
                Height = 22
                DataField = 'DS_CPF_TEST2'
                DataSource = dtcColigadas
                TabOrder = 3
              end
              object DBEdit27: TDBEdit
                Left = 5
                Top = 132
                Width = 244
                Height = 22
                DataField = 'NM_TESTEMUNHA2'
                DataSource = dtcColigadas
                TabOrder = 2
              end
              object DBEdit26: TDBEdit
                Left = 5
                Top = 84
                Width = 244
                Height = 22
                DataField = 'DS_CPF_TEST1'
                DataSource = dtcColigadas
                TabOrder = 1
              end
              object DBEdit25: TDBEdit
                Left = 5
                Top = 36
                Width = 244
                Height = 22
                DataField = 'NM_TESTEMUNHA1'
                DataSource = dtcColigadas
                TabOrder = 0
              end
            end
            object Panel6: TPanel
              Left = 0
              Top = 500
              Width = 506
              Height = 24
              Align = alBottom
              BevelOuter = bvLowered
              Caption = 'Diretores'
              Font.Charset = ANSI_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'Arial'
              Font.Style = [fsBold]
              ParentFont = False
              TabOrder = 6
            end
            object Panel8: TPanel
              Left = 0
              Top = 524
              Width = 506
              Height = 402
              Align = alBottom
              BevelOuter = bvNone
              Font.Charset = ANSI_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'Arial'
              Font.Style = []
              ParentFont = False
              TabOrder = 2
              object Label68: TLabel
                Left = 5
                Top = 354
                Width = 142
                Height = 14
                Align = alCustom
                Caption = 'CPF do Diretor Financeiro:'
                Font.Charset = ANSI_CHARSET
                Font.Color = clWindowText
                Font.Height = -11
                Font.Name = 'Arial'
                Font.Style = [fsBold]
                ParentFont = False
              end
              object Label67: TLabel
                Left = 5
                Top = 306
                Width = 101
                Height = 14
                Align = alCustom
                Caption = 'Diretor Financeiro:'
                Font.Charset = ANSI_CHARSET
                Font.Color = clWindowText
                Font.Height = -11
                Font.Name = 'Arial'
                Font.Style = [fsBold]
                ParentFont = False
              end
              object Label5: TLabel
                Left = 5
                Top = 258
                Width = 146
                Height = 14
                Caption = 'CPF do Diretor Acad'#234'mico:'
                Font.Charset = ANSI_CHARSET
                Font.Color = clWindowText
                Font.Height = -11
                Font.Name = 'Arial'
                Font.Style = [fsBold]
                ParentFont = False
              end
              object Label3: TLabel
                Left = 5
                Top = 210
                Width = 105
                Height = 14
                Caption = 'Diretor Acad'#234'mico:'
                Font.Charset = ANSI_CHARSET
                Font.Color = clWindowText
                Font.Height = -11
                Font.Name = 'Arial'
                Font.Style = [fsBold]
                ParentFont = False
              end
              object Label66: TLabel
                Left = 5
                Top = 18
                Width = 70
                Height = 14
                Align = alCustom
                Caption = 'Diretor Geral'
                Font.Charset = ANSI_CHARSET
                Font.Color = clWindowText
                Font.Height = -11
                Font.Name = 'Arial'
                Font.Style = [fsBold]
                ParentFont = False
              end
              object Label75: TLabel
                Left = 5
                Top = 66
                Width = 114
                Height = 14
                Align = alCustom
                Caption = 'CPF do Diretor Geral:'
                Font.Charset = ANSI_CHARSET
                Font.Color = clWindowText
                Font.Height = -11
                Font.Name = 'Arial'
                Font.Style = [fsBold]
                ParentFont = False
              end
              object Label12: TLabel
                Left = 5
                Top = 162
                Width = 126
                Height = 14
                Caption = 'E-mail do Diretor Geral:'
                FocusControl = DBEdit11
                Font.Charset = ANSI_CHARSET
                Font.Color = clWindowText
                Font.Height = -11
                Font.Name = 'Arial'
                Font.Style = [fsBold]
                ParentFont = False
              end
              object Label17: TLabel
                Left = 5
                Top = 114
                Width = 80
                Height = 14
                Caption = 'Ato do diretor:'
                FocusControl = DBEdit16
                Font.Charset = ANSI_CHARSET
                Font.Color = clWindowText
                Font.Height = -11
                Font.Name = 'Arial'
                Font.Style = [fsBold]
                ParentFont = False
              end
              object DBEdit24: TDBEdit
                Left = 5
                Top = 374
                Width = 244
                Height = 22
                DataField = 'DS_CPF_FINAN'
                DataSource = dtcColigadas
                TabOrder = 7
              end
              object DBEdit22: TDBEdit
                Left = 5
                Top = 326
                Width = 244
                Height = 22
                DataField = 'NM_DIRETOR_FINAN'
                DataSource = dtcColigadas
                TabOrder = 6
              end
              object DBEdit4: TDBEdit
                Left = 5
                Top = 278
                Width = 244
                Height = 22
                DataField = 'ds_cpf_acad'
                DataSource = dtcColigadas
                TabOrder = 5
              end
              object DBEdit3: TDBEdit
                Left = 5
                Top = 230
                Width = 244
                Height = 22
                DataField = 'nm_diretor_acad'
                DataSource = dtcColigadas
                TabOrder = 4
              end
              object DBEdit21: TDBEdit
                Left = 5
                Top = 38
                Width = 244
                Height = 22
                DataField = 'NM_DIRETOR_GERAL'
                DataSource = dtcColigadas
                TabOrder = 0
              end
              object DBEdit23: TDBEdit
                Left = 5
                Top = 86
                Width = 244
                Height = 22
                DataField = 'DS_CPF_GERAL'
                DataSource = dtcColigadas
                TabOrder = 1
              end
              object DBEdit11: TDBEdit
                Left = 5
                Top = 182
                Width = 244
                Height = 22
                DataField = 'ds_email_geral'
                DataSource = dtcColigadas
                TabOrder = 3
              end
              object DBEdit16: TDBEdit
                Left = 5
                Top = 134
                Width = 244
                Height = 22
                DataField = 'ds_ato_direto'
                DataSource = dtcColigadas
                TabOrder = 2
              end
            end
            object Panel9: TPanel
              Left = 0
              Top = 0
              Width = 506
              Height = 500
              Align = alBottom
              BevelOuter = bvNone
              Font.Charset = ANSI_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'Arial'
              Font.Style = []
              Locked = True
              ParentFont = False
              TabOrder = 1
              object Label62: TLabel
                Left = 5
                Top = 6
                Width = 42
                Height = 14
                Caption = '&C'#243'digo:'
                Font.Charset = ANSI_CHARSET
                Font.Color = clWindowText
                Font.Height = -11
                Font.Name = 'Arial'
                Font.Style = [fsBold]
                ParentFont = False
              end
              object Label63: TLabel
                Left = 5
                Top = 54
                Width = 104
                Height = 14
                Align = alCustom
                Caption = 'Unidade de Ensino:'
                Font.Charset = ANSI_CHARSET
                Font.Color = clWindowText
                Font.Height = -11
                Font.Name = 'Arial'
                Font.Style = [fsBold]
                ParentFont = False
              end
              object Label64: TLabel
                Left = 5
                Top = 102
                Width = 70
                Height = 14
                Align = alCustom
                Caption = 'Raz'#227'o Social:'
                Font.Charset = ANSI_CHARSET
                Font.Color = clWindowText
                Font.Height = -11
                Font.Name = 'Arial'
                Font.Style = [fsBold]
                ParentFont = False
              end
              object Label65: TLabel
                Left = 5
                Top = 150
                Width = 31
                Height = 14
                Align = alCustom
                Caption = 'CNPJ:'
                Font.Charset = ANSI_CHARSET
                Font.Color = clWindowText
                Font.Height = -11
                Font.Name = 'Arial'
                Font.Style = [fsBold]
                ParentFont = False
              end
              object Label6: TLabel
                Left = 5
                Top = 198
                Width = 162
                Height = 14
                Caption = 'C'#243'digo da Institui'#231#227'o no MEC:'
                FocusControl = dbedCdInstMec
                Font.Charset = ANSI_CHARSET
                Font.Color = clWindowText
                Font.Height = -11
                Font.Name = 'Arial'
                Font.Style = [fsBold]
                ParentFont = False
              end
              object Label15: TLabel
                Left = 5
                Top = 246
                Width = 143
                Height = 14
                Caption = 'C'#243'digo do munic'#237'pio MEC:'
                Font.Charset = ANSI_CHARSET
                Font.Color = clWindowText
                Font.Height = -11
                Font.Name = 'Arial'
                Font.Style = [fsBold]
                ParentFont = False
              end
              object Label16: TLabel
                Left = 5
                Top = 294
                Width = 23
                Height = 14
                Caption = 'NRE:'
                FocusControl = DBEdit15
                Font.Charset = ANSI_CHARSET
                Font.Color = clWindowText
                Font.Height = -11
                Font.Name = 'Arial'
                Font.Style = [fsBold]
                ParentFont = False
              end
              object Label18: TLabel
                Left = 5
                Top = 342
                Width = 110
                Height = 14
                Caption = 'Nome da secret'#225'ria:'
                FocusControl = DBEdit29
                Font.Charset = ANSI_CHARSET
                Font.Color = clWindowText
                Font.Height = -11
                Font.Name = 'Arial'
                Font.Style = [fsBold]
                ParentFont = False
              end
              object Label19: TLabel
                Left = 5
                Top = 390
                Width = 97
                Height = 14
                Caption = 'Ato da secretaria:'
                FocusControl = DBEdit30
                Font.Charset = ANSI_CHARSET
                Font.Color = clWindowText
                Font.Height = -11
                Font.Name = 'Arial'
                Font.Style = [fsBold]
                ParentFont = False
              end
              object Label20: TLabel
                Left = 5
                Top = 438
                Width = 170
                Height = 14
                Caption = 'Ato oficial do estabelecimento:'
                FocusControl = DBEdit31
                Font.Charset = ANSI_CHARSET
                Font.Color = clWindowText
                Font.Height = -11
                Font.Name = 'Arial'
                Font.Style = [fsBold]
                ParentFont = False
              end
              object DBEdit17: TDBEdit
                Tag = 1
                Left = 5
                Top = 26
                Width = 244
                Height = 22
                DataField = 'cd_coligada'
                DataSource = dtcColigadas
                Enabled = False
                TabOrder = 0
              end
              object DBEdit18: TDBEdit
                Left = 5
                Top = 74
                Width = 380
                Height = 22
                DataField = 'nm_coligada'
                DataSource = dtcColigadas
                Enabled = False
                TabOrder = 2
              end
              object DBEdit19: TDBEdit
                Left = 5
                Top = 122
                Width = 380
                Height = 22
                DataField = 'NM_RAZAO_SOCIAL'
                DataSource = dtcColigadas
                Enabled = False
                TabOrder = 3
              end
              object DBEdit20: TDBEdit
                Left = 5
                Top = 170
                Width = 244
                Height = 22
                DataField = 'DS_CNPJ'
                DataSource = dtcColigadas
                Enabled = False
                TabOrder = 4
              end
              object dbedCdInstMec: TDBEdit
                Left = 5
                Top = 218
                Width = 244
                Height = 22
                Hint = 'C'#243'digo da Institui'#231#227'o no MEC'
                DataField = 'cd_instituicao_mec'
                DataSource = dtcColigadas
                TabOrder = 5
              end
              object DBEdit14: TDBEdit
                Left = 5
                Top = 266
                Width = 244
                Height = 22
                DataField = 'cd_municipio'
                DataSource = dtcColigadas
                TabOrder = 6
              end
              object btMaisInformacoes: TButton
                Left = 255
                Top = 26
                Width = 130
                Height = 22
                Caption = 'Mais informa'#231#245'es >>'
                Font.Charset = ANSI_CHARSET
                Font.Color = clWindowText
                Font.Height = -11
                Font.Name = 'Arial'
                Font.Style = []
                ParentFont = False
                TabOrder = 1
                OnClick = btMaisInformacoesClick
              end
              object DBEdit15: TDBEdit
                Left = 5
                Top = 314
                Width = 244
                Height = 22
                DataField = 'ds_nre'
                DataSource = dtcColigadas
                TabOrder = 7
              end
              object DBEdit29: TDBEdit
                Left = 5
                Top = 362
                Width = 244
                Height = 22
                DataField = 'me_secretaria'
                DataSource = dtcColigadas
                TabOrder = 8
              end
              object DBEdit30: TDBEdit
                Left = 5
                Top = 410
                Width = 244
                Height = 22
                DataField = 'ds_ato_secretaria'
                DataSource = dtcColigadas
                TabOrder = 9
              end
              object DBEdit31: TDBEdit
                Left = 5
                Top = 458
                Width = 243
                Height = 22
                DataField = 'ds_ato_ofic_estab'
                DataSource = dtcColigadas
                TabOrder = 10
              end
            end
          end
        end
        object Panel10: TPanel
          Left = 1
          Top = 1
          Width = 922
          Height = 26
          Align = alTop
          BevelOuter = bvLowered
          Caption = 'UNIDADES DE ENSINO'
          Color = clBlue
          Font.Charset = ANSI_CHARSET
          Font.Color = clWhite
          Font.Height = -17
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          ParentFont = False
          TabOrder = 2
        end
        object grdColigadas: TDBGrid
          Left = 1
          Top = 27
          Width = 393
          Height = 477
          Align = alLeft
          DataSource = dtcColigadas
          Options = [dgTitles, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgConfirmDelete, dgCancelOnExit, dgMultiSelect]
          ReadOnly = True
          TabOrder = 1
          TitleFont.Charset = ANSI_CHARSET
          TitleFont.Color = clWindowText
          TitleFont.Height = -11
          TitleFont.Name = 'Arial'
          TitleFont.Style = []
          OnDblClick = grdColigadasDblClick
          Columns = <
            item
              Expanded = False
              FieldName = 'cd_coligada'
              Title.Caption = 'C'#243'd.'
              Width = 36
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'nm_coligada'
              Title.Caption = 'Coligada'
              Width = 222
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'DS_CNPJ'
              Title.Caption = 'CNPJ'
              Width = 93
              Visible = True
            end>
        end
      end
    end
    object tsDeptos: TTabSheet
      Caption = 'Departamentos'
      object pnDepartamentos: TPanel
        Left = 0
        Top = 0
        Width = 924
        Height = 505
        Align = alClient
        TabOrder = 0
        object Panel11: TPanel
          Left = 395
          Top = 27
          Width = 528
          Height = 477
          Align = alClient
          BevelOuter = bvNone
          TabOrder = 0
          object Label31: TLabel
            Left = 10
            Top = 49
            Width = 42
            Height = 14
            Caption = '&C'#243'digo:'
            FocusControl = dbeCodigoDepto
            Font.Charset = ANSI_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'Arial'
            Font.Style = [fsBold]
            ParentFont = False
          end
          object Label32: TLabel
            Left = 10
            Top = 95
            Width = 52
            Height = 14
            Caption = 'Descri'#231#227'o:'
            FocusControl = DBEdit1
          end
          object Label38: TLabel
            Left = 10
            Top = 148
            Width = 66
            Height = 14
            Caption = 'Raz'#227'o Social:'
            FocusControl = DBEdit2
          end
          object Label4: TLabel
            Left = 10
            Top = 237
            Width = 247
            Height = 14
            Caption = 'Selecione a conta padr'#227'o para emiss'#227'o de boletos:'
            FocusControl = DBLookupComboBox8
          end
          object Label41: TLabel
            Left = 10
            Top = 305
            Width = 315
            Height = 14
            Hint = 'Selecione a conta caixa padr'#227'o para recebimentos na tesouraria.'
            Caption = 'Selecione a conta caixa padr'#227'o para recebimentos na tesouraria:'
            FocusControl = DBLookupComboBox9
          end
          object sbLimparBoletoDepto: TSpeedButton
            Left = 432
            Top = 253
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
            OnClick = sbLimparBoletoDeptoClick
          end
          object sbLimparCaixaDepto: TSpeedButton
            Left = 432
            Top = 321
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
            OnClick = sbLimparCaixaDeptoClick
          end
          object Label46: TLabel
            Left = 10
            Top = 193
            Width = 28
            Height = 14
            Caption = 'CNPJ:'
            FocusControl = DBEdit6
          end
          object Label2: TLabel
            Left = 10
            Top = 349
            Width = 98
            Height = 14
            Caption = 'Institui'#231#227'o de ensino'
          end
          object lbChefeDepartamento: TLabel
            Left = 10
            Top = 350
            Width = 116
            Height = 14
            Caption = 'Chefe de departamento:'
          end
          object btnChefeDepartamento: TSpeedButton
            Left = 109
            Top = 366
            Width = 24
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
            OnClick = btnChefeDepartamentoClick
          end
          object SpeedButton1: TSpeedButton
            Left = 432
            Top = 366
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
            OnClick = sbLimparChefeDepartamentoClick
          end
          object DBEdit2: TDBEdit
            Left = 10
            Top = 165
            Width = 373
            Height = 22
            Hint = 'Raz'#227'o Social do Departamento'
            DataField = 'RazaoSocial'
            DataSource = dtcDeptos
            TabOrder = 2
            OnEnter = dbeCodigoDeptoEnter
          end
          object DBEdit1: TDBEdit
            Left = 13
            Top = 115
            Width = 373
            Height = 22
            Hint = 'Descri'#231#227'o do Departamento'
            CharCase = ecUpperCase
            DataField = 'Descricao'
            DataSource = dtcDeptos
            TabOrder = 1
            OnEnter = dbeCodigoDeptoEnter
          end
          object dbeCodigoDepto: TDBEdit
            Left = 10
            Top = 66
            Width = 107
            Height = 22
            Hint = 'C'#243'digo do Departamento'
            CharCase = ecUpperCase
            DataField = 'Codigo'
            DataSource = dtcDeptos
            Enabled = False
            ReadOnly = True
            TabOrder = 0
            OnEnter = dbeCodigoDeptoEnter
          end
          object DBCheckBox2: TDBCheckBox
            Left = 10
            Top = 440
            Width = 217
            Height = 17
            Caption = 'Acesso atrav'#233's do m'#243'dulo on-line'
            DataField = 'sn_online'
            DataSource = dtcDeptos
            TabOrder = 10
            ValueChecked = 'S'
            ValueUnchecked = 'N'
          end
          object DBLookupComboBox8: TDBLookupComboBox
            Left = 10
            Top = 253
            Width = 421
            Height = 22
            Hint = 
              'Selecione a conta padr'#227'o para emiss'#227'o de boletos. Se a turma tiv' +
              'er uma conta selecionada essa op'#231#227'o ser'#225' ignorada.'
            DataField = 'descConta'
            DataSource = dtcDeptos
            TabOrder = 4
          end
          object DBLookupComboBox9: TDBLookupComboBox
            Left = 10
            Top = 321
            Width = 421
            Height = 22
            DataField = 'descCaixa'
            DataSource = dtcDeptos
            TabOrder = 6
          end
          object DBEdit6: TDBEdit
            Left = 10
            Top = 209
            Width = 373
            Height = 22
            DataField = 'ds_cnpj'
            DataSource = dtcDeptos
            TabOrder = 3
          end
          object Panel1: TPanel
            Left = 0
            Top = 0
            Width = 528
            Height = 30
            Align = alTop
            BevelOuter = bvNone
            TabOrder = 11
            object lbColigada: TLabel
              Left = 86
              Top = 7
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
            object Label1: TLabel
              Left = 10
              Top = 8
              Width = 42
              Height = 14
              Caption = 'Unidade:'
            end
          end
          object Panel27: TPanel
            Left = 0
            Top = 30
            Width = 528
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
            TabOrder = 12
          end
          object dblInstEnsino: TDBLookupComboBox
            Left = 10
            Top = 412
            Width = 421
            Height = 22
            DataField = 'descInstituicao'
            DataSource = dtcDeptos
            TabOrder = 9
          end
          object DBCheckBox1: TDBCheckBox
            Left = 10
            Top = 284
            Width = 151
            Height = 17
            Caption = 'A conta pode ser alterada'
            DataField = 'SN_ALTERAR_BOLETO'
            DataSource = dtcDeptos
            TabOrder = 5
            ValueChecked = '1'
            ValueUnchecked = '0'
          end
          object dbeCodigoPessoa: TDBEdit
            Left = 10
            Top = 366
            Width = 98
            Height = 22
            DataField = 'cd_pessoa'
            DataSource = dtcDeptos
            ReadOnly = True
            TabOrder = 7
          end
          object dbeNomePessoa: TDBEdit
            Left = 139
            Top = 366
            Width = 290
            Height = 22
            Color = 15066597
            DataField = 'nm_pessoa'
            DataSource = dsChefeDepartamento
            Enabled = False
            ReadOnly = True
            TabOrder = 8
          end
        end
        object Panel7: TPanel
          Left = 1
          Top = 1
          Width = 922
          Height = 26
          Align = alTop
          BevelOuter = bvLowered
          Caption = 'DEPARTAMENTOS'
          Color = clBlue
          Font.Charset = ANSI_CHARSET
          Font.Color = clWhite
          Font.Height = -17
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          ParentFont = False
          TabOrder = 1
        end
        object grdDeptos: TDBGrid
          Left = 1
          Top = 27
          Width = 394
          Height = 477
          Align = alLeft
          BorderStyle = bsNone
          DataSource = dtcDeptos
          Options = [dgTitles, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgAlwaysShowSelection, dgConfirmDelete, dgCancelOnExit]
          PopupMenu = pmQtdDeptos
          ReadOnly = True
          TabOrder = 2
          TitleFont.Charset = ANSI_CHARSET
          TitleFont.Color = clWindowText
          TitleFont.Height = -11
          TitleFont.Name = 'Arial'
          TitleFont.Style = []
          OnDblClick = grdDeptosDblClick
          Columns = <
            item
              Expanded = False
              FieldName = 'Codigo'
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'Descricao'
              Width = 255
              Visible = True
            end
            item
              Alignment = taCenter
              Expanded = False
              FieldName = 'online'
              Title.Caption = 'On-line'
              Visible = True
            end>
        end
      end
    end
  end
  object toolPessoa: TToolBar
    Left = 0
    Top = 537
    Width = 932
    Height = 25
    Align = alBottom
    ButtonWidth = 85
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
      Enabled = False
      ImageIndex = 0
      OnClick = btnIncluirClick
    end
    object btnAlterar: TToolButton
      Left = 82
      Top = 0
      AutoSize = True
      Caption = 'F3 Alterar'
      Enabled = False
      ImageIndex = 1
      OnClick = btnAlterarClick
    end
    object btnExcluir: TToolButton
      Left = 160
      Top = 0
      AutoSize = True
      Caption = 'F9 Excluir'
      Enabled = False
      ImageIndex = 2
      OnClick = btnExcluirClick
    end
    object ToolButton4: TToolButton
      Left = 238
      Top = 0
      Width = 8
      Caption = 'ToolButton4'
      ImageIndex = 3
      Style = tbsSeparator
    end
    object btnSalvar: TToolButton
      Left = 246
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
    object ToolButton8: TToolButton
      Left = 412
      Top = 0
      Width = 8
      Caption = 'ToolButton8'
      ImageIndex = 9
      Style = tbsSeparator
    end
    object btnSair: TToolButton
      Left = 420
      Top = 0
      AutoSize = True
      Caption = 'F12 Fechar'
      ImageIndex = 7
      OnClick = btnSairClick
    end
    object ToolButton2: TToolButton
      Left = 506
      Top = 0
      Width = 8
      Caption = 'ToolButton2'
      ImageIndex = 8
      Style = tbsSeparator
    end
  end
  object tblDeptos: TUMZQuery
    Connection = DM.db
    OnCalcFields = tblDeptosCalcFields
    BeforeInsert = tblDeptosBeforeInsert
    BeforeEdit = tblDeptosBeforeEdit
    BeforePost = tblDeptosBeforePost
    AfterPost = tblDeptosAfterPost
    BeforeDelete = tblDeptosBeforeDelete
    OnNewRecord = tblDeptosNewRecord
    SQL.Strings = (
      'SELECT'
      '   CODIGO,'
      '   DESCRICAO,'
      '   RAZAOSOCIAL,'
      '   SN_ONLINE,'
      '   CD_CAIXA,'
      '   CD_COLIGADA,'
      '   CD_BOLETO_PADRAO,'
      '   DS_CNPJ,'
      '   CD_BOLETO_ONLINE,'
      '   CD_INSTITUICAO,'
      '   SN_ALTERAR_BOLETO,'
      '   cd_pessoa'
      'FROM'
      '   DEPARTAMENTOS'
      'WHERE'
      '   cd_coligada = :cd_coligada')
    Params = <
      item
        DataType = ftUnknown
        Name = 'cd_coligada'
        ParamType = ptUnknown
      end>
    Left = 32
    Top = 168
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
    object tblDeptossn_online: TStringField
      FieldName = 'sn_online'
      Origin = 'WMESTRE12.departamentos.sn_online'
      FixedChar = True
      Size = 1
    end
    object tblDeptosonline: TStringField
      FieldKind = fkCalculated
      FieldName = 'online'
      Size = 1
      Calculated = True
    end
    object tblDeptoscd_caixa: TIntegerField
      FieldName = 'cd_caixa'
      Origin = 'WMESTRE12.departamentos.cd_caixa'
    end
    object tblDeptoscd_coligada: TSmallintField
      FieldName = 'cd_coligada'
      Origin = 'WMESTRE12.departamentos.cd_coligada'
    end
    object tblDeptoscd_boleto_padrao: TIntegerField
      FieldName = 'cd_boleto_padrao'
      Origin = 'WMESTRE12.departamentos.cd_boleto_padrao'
    end
    object tblDeptoscd_boleto_online: TIntegerField
      FieldName = 'cd_boleto_online'
      Origin = 'WMESTRE12.departamentos.cd_boleto_online'
    end
    object tblDeptosdescConta: TStringField
      FieldKind = fkLookup
      FieldName = 'descConta'
      LookupDataSet = qyConta
      LookupKeyFields = 'cd_caixa'
      LookupResultField = 'ds_caixa'
      KeyFields = 'cd_boleto_padrao'
      Size = 50
      Lookup = True
    end
    object tblDeptosdescCaixa: TStringField
      FieldKind = fkLookup
      FieldName = 'descCaixa'
      LookupDataSet = qyConta
      LookupKeyFields = 'cd_caixa'
      LookupResultField = 'ds_caixa'
      KeyFields = 'cd_caixa'
      Size = 50
      Lookup = True
    end
    object tblDeptosds_cnpj: TStringField
      DisplayLabel = 'CNPJ:'
      FieldName = 'ds_cnpj'
      Origin = 'WMESTRE12.departamentos.ds_cnpj'
      Size = 30
    end
    object tblDeptosCD_INSTITUICAO: TIntegerField
      FieldName = 'CD_INSTITUICAO'
    end
    object tblDeptosdescInstituicao: TStringField
      FieldKind = fkLookup
      FieldName = 'descInstituicao'
      LookupDataSet = qryInstituicao
      LookupKeyFields = 'cd_instituicao'
      LookupResultField = 'nm_instituicao'
      KeyFields = 'CD_INSTITUICAO'
      Size = 255
      Lookup = True
    end
    object tblDeptosSN_ALTERAR_BOLETO: TSmallintField
      FieldName = 'SN_ALTERAR_BOLETO'
    end
    object tblDeptosDESCRICAO: TStringField
      DisplayLabel = 'Descri'#231#227'o'
      FieldName = 'Descricao'
      Size = 255
    end
    object tblDeptosRAZAOSOCIAL: TStringField
      FieldName = 'RazaoSocial'
      Size = 255
    end
    object tblDeptoscd_pessoa: TIntegerField
      FieldName = 'cd_pessoa'
    end
  end
  object dtcDeptos: TDataSource
    DataSet = tblDeptos
    OnStateChange = dtcDeptosStateChange
    OnDataChange = dtcDeptosDataChange
    Left = 64
    Top = 168
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
    Left = 720
    Top = 502
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
  object pmQtdDeptos: TPopupMenu
    OnPopup = pmQtdDeptosPopup
    Left = 376
    Top = 168
  end
  object qyCampus: TUMZQuery
    Connection = DM.db
    SQL.Strings = (
      'SELECT'
      '   *'
      'FROM'
      '   campus')
    Params = <>
    Left = 32
    Top = 136
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
    Left = 64
    Top = 136
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
      '   ds_caixa, cd_caixa')
    Params = <
      item
        DataType = ftInteger
        Name = 'cd_coligada'
        ParamType = ptUnknown
      end>
    Left = 680
    Top = 499
    ParamData = <
      item
        DataType = ftInteger
        Name = 'cd_coligada'
        ParamType = ptUnknown
      end>
    object qyContads_caixa: TStringField
      FieldName = 'ds_caixa'
      Origin = 'WMESTRE12.fin_cadastro_contas.ds_caixa'
      Size = 255
    end
    object qyContacd_caixa: TIntegerField
      FieldName = 'cd_caixa'
    end
  end
  object qyColigada: TUMZQuery
    Connection = DM.db
    OnCalcFields = qyColigadaCalcFields
    BeforePost = qyColigadaBeforePost
    OnNewRecord = qyColigadaNewRecord
    SQL.Strings = (
      'SELECT'
      '  c.cd_coligada,c. nm_coligada,c. nm_razao_social,'
      '  c.ds_cnpj, c.nm_diretor_geral, c.nm_diretor_acad,'
      '  c.nm_diretor_finan,c. nm_testemunha1,'
      '  c.nm_testemunha2, c.ds_cpf_geral,c. ds_cpf_acad,'
      
        '  c.ds_cpf_finan, c.ds_cpf_test1, c.ds_cpf_test2,c.ds_estado,c.d' +
        's_cidade,c.cd_municipio,'
      
        '  c.cd_instituicao_mec, c.ds_endereco, c.ds_numero, c.ds_complem' +
        'ento,'
      
        '  c.ds_bairro, c.ds_cep, c.ds_email_geral, c.ds_latitude, c.ds_l' +
        'ongitude,'
      
        '  c.ds_nre, c.ds_ato_direto, c.me_secretaria, c.ds_ato_secretari' +
        'a, '
      '  c.ds_ato_ofic_estab, c.cd_coligada_matriz'
      'FROM '
      '  coligadas c'
      'ORDER BY '
      '  nm_coligada')
    Params = <>
    Left = 32
    Top = 99
    object qyColigadacd_coligada: TSmallintField
      FieldName = 'cd_coligada'
      Origin = 'WMESTRE12.coligadas.cd_coligada'
    end
    object qyColigadanm_coligada: TStringField
      FieldName = 'nm_coligada'
      Origin = 'WMESTRE12.coligadas.nm_coligada'
      Size = 255
    end
    object qyColigadaNM_RAZAO_SOCIAL: TStringField
      FieldName = 'NM_RAZAO_SOCIAL'
      Size = 100
    end
    object qyColigadaDS_CNPJ: TStringField
      FieldName = 'DS_CNPJ'
    end
    object qyColigadaNM_DIRETOR_GERAL: TStringField
      FieldName = 'NM_DIRETOR_GERAL'
      Size = 100
    end
    object qyColigadaNM_DIRETOR_FINAN: TStringField
      FieldName = 'NM_DIRETOR_FINAN'
      Size = 100
    end
    object qyColigadaNM_TESTEMUNHA1: TStringField
      FieldName = 'NM_TESTEMUNHA1'
      Size = 100
    end
    object qyColigadaNM_TESTEMUNHA2: TStringField
      FieldName = 'NM_TESTEMUNHA2'
      Size = 100
    end
    object qyColigadaDS_CPF_GERAL: TStringField
      FieldName = 'DS_CPF_GERAL'
    end
    object qyColigadaDS_CPF_FINAN: TStringField
      FieldName = 'DS_CPF_FINAN'
    end
    object qyColigadaDS_CPF_TEST1: TStringField
      FieldName = 'DS_CPF_TEST1'
    end
    object qyColigadaDS_CPF_TEST2: TStringField
      FieldName = 'DS_CPF_TEST2'
    end
    object qyColigadadescEstado: TStringField
      FieldKind = fkLookup
      FieldName = 'descEstado'
      LookupDataSet = tblEstados
      LookupKeyFields = 'ds_uf'
      LookupResultField = 'ds_estado'
      KeyFields = 'ds_estado'
      OnChange = qyColigadadescEstadoChange
      Size = 255
      Lookup = True
    end
    object qyColigadads_estado: TStringField
      FieldName = 'ds_estado'
      Size = 255
    end
    object qyColigadads_cidade: TStringField
      FieldName = 'ds_cidade'
      Size = 255
    end
    object qyColigadacd_municipio: TLargeintField
      FieldName = 'cd_municipio'
    end
    object qyColigadadescMunicipio: TStringField
      FieldKind = fkLookup
      FieldName = 'descMunicipio'
      LookupDataSet = qryMunicipio
      LookupKeyFields = 'ds_municipio'
      LookupResultField = 'ds_municipio'
      KeyFields = 'ds_cidade'
      Size = 255
      Lookup = True
    end
    object qyColigadacd_pais: TIntegerField
      FieldKind = fkCalculated
      FieldName = 'cd_pais'
      Calculated = True
    end
    object qyColigadanm_diretor_acad: TStringField
      FieldName = 'nm_diretor_acad'
      Size = 100
    end
    object qyColigadads_cpf_acad: TStringField
      FieldName = 'ds_cpf_acad'
    end
    object qyColigadacd_instituicao_mec: TIntegerField
      Alignment = taLeftJustify
      FieldName = 'cd_instituicao_mec'
    end
    object qyColigadads_endereco: TStringField
      FieldName = 'ds_endereco'
      Size = 255
    end
    object qyColigadads_numero: TStringField
      FieldName = 'ds_numero'
      Size = 255
    end
    object qyColigadads_complemento: TStringField
      FieldName = 'ds_complemento'
      Size = 255
    end
    object qyColigadads_bairro: TStringField
      FieldName = 'ds_bairro'
      Size = 255
    end
    object qyColigadads_cep: TStringField
      FieldName = 'ds_cep'
      EditMask = '00000\-000;0;_'
      Size = 8
    end
    object qyColigadads_email_geral: TStringField
      FieldName = 'ds_email_geral'
      Size = 255
    end
    object qyColigadads_latitude: TStringField
      FieldName = 'ds_latitude'
      Size = 255
    end
    object qyColigadads_longitude: TStringField
      FieldName = 'ds_longitude'
      Size = 255
    end
    object qyColigadads_ato_direto: TStringField
      FieldName = 'ds_ato_direto'
      Size = 240
    end
    object qyColigadame_secretaria: TStringField
      FieldName = 'me_secretaria'
      Size = 240
    end
    object qyColigadads_ato_secretaria: TStringField
      FieldName = 'ds_ato_secretaria'
      Size = 240
    end
    object qyColigadads_ato_ofic_estab: TStringField
      FieldName = 'ds_ato_ofic_estab'
      Size = 240
    end
    object qyColigadads_nre: TStringField
      FieldName = 'ds_nre'
      Size = 50
    end
    object qyColigadacd_coligada_matriz: TIntegerField
      FieldName = 'cd_coligada_matriz'
    end
  end
  object qUnidadesCertificadoras: TUMZQuery
    Connection = DM.db
    SQL.Strings = (
      
        'select * from instituicoes_ensino where sn_unidade_certificadora' +
        ' = 1')
    Params = <>
    Left = 152
    Top = 312
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
    Left = 187
    Top = 312
  end
  object dtcColigadas: TDataSource
    DataSet = qyColigada
    OnStateChange = dtcColigadasStateChange
    OnDataChange = dtcColigadasDataChange
    Left = 64
    Top = 100
  end
  object qryMunicipio: TUMZQuery
    Connection = DM.db
    SQL.Strings = (
      'SELECT'
      '  m.cd_municipio,m.ds_municipio,m.uf, e.cd_pais'
      'from'
      '   municipios m'
      '   LEFT JOIN estados e ON (e.ds_uf = m.uf )'
      'WHERE'
      '  m.uf like :uf')
    Params = <
      item
        DataType = ftUnknown
        Name = 'uf'
        ParamType = ptUnknown
      end>
    Left = 32
    Top = 216
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'uf'
        ParamType = ptUnknown
      end>
    object qryMunicipiods_municipio: TStringField
      FieldName = 'ds_municipio'
      Size = 120
    end
    object qryMunicipiouf: TStringField
      FieldName = 'uf'
      Size = 2
    end
    object qryMunicipiocd_municipio: TLargeintField
      FieldName = 'cd_municipio'
      Required = True
    end
    object qryMunicipiocd_pais: TIntegerField
      FieldName = 'cd_pais'
    end
  end
  object dsMunicipio: TDataSource
    DataSet = qryMunicipio
    Left = 66
    Top = 217
  end
  object qryPaises: TUMZQuery
    Connection = DM.db
    SQL.Strings = (
      'SELECT'
      '   cd_pais,'
      '   ds_pais'
      'FROM'
      '   paises'
      'ORDER BY '
      '   ds_pais')
    Params = <>
    Left = 32
    Top = 253
    object qryPaisescd_pais: TLargeintField
      FieldName = 'cd_pais'
      Required = True
    end
    object qryPaisesds_pais: TStringField
      FieldName = 'ds_pais'
      Size = 50
    end
  end
  object tblEstados: TUMZQuery
    Connection = DM.db
    SQL.Strings = (
      'SELECT '
      '   * '
      'FROM '
      '   estados '
      'WHERE'
      '    cd_pais =:cd_pais'
      'ORDER BY'
      '   ds_estado')
    Params = <
      item
        DataType = ftUnknown
        Name = 'cd_pais'
        ParamType = ptUnknown
      end>
    Left = 88
    Top = 310
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'cd_pais'
        ParamType = ptUnknown
      end>
  end
  object qryInstituicao: TUMZQuery
    Connection = DM.db
    SQL.Strings = (
      'SELECT'
      
        '   cd_instituicao,CONCAT(nm_instituicao,'#39' - '#39',ds_cidade,'#39'/'#39',ds_e' +
        'stado) as nm_instituicao'
      ' FROM'
      '   instituicoes_ensino'
      'ORDER BY'
      '   nm_instituicao')
    Params = <>
    Left = 88
    Top = 352
    object qryInstituicaocd_instituicao: TIntegerField
      FieldName = 'cd_instituicao'
      Required = True
    end
    object qryInstituicaonm_instituicao: TStringField
      FieldName = 'nm_instituicao'
      Size = 80
    end
  end
  object qryChefeDepartamento: TUMZQuery
    Connection = DM.db
    SQL.Strings = (
      'SELECT'
      '   nm_pessoa'
      'FROM'
      '   pessoas'
      'WHERE'
      '  cd_pessoa = :cd_pessoa')
    Params = <
      item
        DataType = ftUnknown
        Name = 'cd_pessoa'
        ParamType = ptUnknown
      end>
    Left = 368
    Top = 413
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'cd_pessoa'
        ParamType = ptUnknown
      end>
    object qryChefeDepartamentonm_pessoa: TStringField
      FieldName = 'nm_pessoa'
      Size = 255
    end
  end
  object dsChefeDepartamento: TDataSource
    DataSet = qryChefeDepartamento
    Left = 337
    Top = 413
  end
end
