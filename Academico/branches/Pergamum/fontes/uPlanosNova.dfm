object frmPlanosNova: TfrmPlanosNova
  Left = 0
  Top = 0
  Caption = 'Plano de Pagamento'
  ClientHeight = 839
  ClientWidth = 1227
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  FormStyle = fsMDIChild
  KeyPreview = True
  OldCreateOrder = False
  Visible = True
  WindowState = wsMaximized
  OnClose = FormClose
  OnCreate = FormCreate
  OnDestroy = FormDestroy
  OnKeyDown = FormKeyDown
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object sdfsad: TLabel
    Left = 208
    Top = 640
    Width = 32
    Height = 13
    Caption = 'sdfsad'
  end
  object Label18: TLabel
    Left = 304
    Top = 624
    Width = 37
    Height = 13
    Caption = 'Label18'
  end
  object Label2: TLabel
    Left = 5
    Top = 99
    Width = 57
    Height = 13
    Caption = 'Valor Extra:'
    Enabled = False
  end
  object pnTitulo: TPanel
    Left = 0
    Top = 0
    Width = 1227
    Height = 20
    Align = alTop
    BevelOuter = bvLowered
    Caption = 'PLANOS DE PAGAMENTO'
    Color = clBlue
    Font.Charset = ANSI_CHARSET
    Font.Color = clWhite
    Font.Height = -13
    Font.Name = 'Arial'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 0
  end
  object pnCadastro: TPanel
    Left = 0
    Top = 20
    Width = 609
    Height = 794
    Align = alLeft
    BevelOuter = bvNone
    TabOrder = 1
    object Panel1: TPanel
      Left = 0
      Top = 0
      Width = 609
      Height = 33
      Align = alTop
      TabOrder = 0
      object Label1: TLabel
        Left = 10
        Top = 8
        Width = 47
        Height = 13
        Caption = 'Ano/Sem:'
      end
      object sbSelecionaUnidadeEnsino: TSpeedButton
        Left = 413
        Top = 5
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
        OnClick = sbSelecionaUnidadeEnsinoClick
      end
      object lbUnidadeEnsino: TLabel
        Left = 143
        Top = 8
        Width = 92
        Height = 13
        Caption = 'Unidade de Ensino:'
      end
      object Label11: TLabel
        Left = 454
        Top = 9
        Width = 32
        Height = 13
        Caption = 'Curso:'
      end
      object sbFiltroCurso: TSpeedButton
        Left = 584
        Top = 6
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
        OnClick = sbFiltroCursoClick
      end
      object edAnosemestre: TMaskEdit
        Left = 63
        Top = 5
        Width = 52
        Height = 21
        EditMask = '9999/9;0;_'
        MaxLength = 6
        TabOrder = 1
      end
      object UpDown1: TUpDown
        Left = 114
        Top = 5
        Width = 17
        Height = 21
        Min = -100
        TabOrder = 0
        OnClick = UpDown1Click
      end
      object edUnidadeEnsino: TEdit
        Left = 239
        Top = 6
        Width = 174
        Height = 21
        ReadOnly = True
        TabOrder = 2
      end
      object edCurso: TEdit
        Left = 493
        Top = 6
        Width = 91
        Height = 21
        ReadOnly = True
        TabOrder = 3
      end
    end
    object ScrollBox1: TScrollBox
      Left = 0
      Top = 33
      Width = 609
      Height = 761
      VertScrollBar.Range = 550
      Align = alClient
      AutoScroll = False
      TabOrder = 1
      object Panel4: TPanel
        Left = 0
        Top = 397
        Width = 605
        Height = 360
        Align = alClient
        BevelOuter = bvNone
        TabOrder = 0
        object Panel6: TPanel
          Left = 600
          Top = 0
          Width = 5
          Height = 360
          Align = alRight
          BevelOuter = bvNone
          TabOrder = 0
        end
        object pcInformacoes: TPageControl
          Left = 0
          Top = 0
          Width = 600
          Height = 360
          ActivePage = tsParcelas
          Align = alClient
          TabOrder = 1
          OnChange = pcInformacoesChange
          OnChanging = pcInformacoesChanging
          object tsParcelas: TTabSheet
            Caption = 'Parcelas'
            object Panel8: TPanel
              Left = 0
              Top = 0
              Width = 592
              Height = 34
              Align = alTop
              BevelOuter = bvNone
              TabOrder = 0
              object btnCalcularParcelas: TSpeedButton
                Left = 2
                Top = 0
                Width = 143
                Height = 28
                Hint = 'Calcular as parcelas para o plano de pagamento'
                Caption = 'F11 Calcular Parcelas'
                Glyph.Data = {
                  76010000424D7601000000000000760000002800000020000000100000000100
                  04000000000000010000120B0000120B00001000000000000000000000000000
                  800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
                  FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00337000000000
                  73333337777777773F333308888888880333337F3F3F3FFF7F33330808089998
                  0333337F737377737F333308888888880333337F3F3F3F3F7F33330808080808
                  0333337F737373737F333308888888880333337F3F3F3F3F7F33330808080808
                  0333337F737373737F333308888888880333337F3F3F3F3F7F33330808080808
                  0333337F737373737F333308888888880333337F3FFFFFFF7F33330800000008
                  0333337F7777777F7F333308000E0E080333337F7FFFFF7F7F33330800000008
                  0333337F777777737F333308888888880333337F333333337F33330888888888
                  03333373FFFFFFFF733333700000000073333337777777773333}
                NumGlyphs = 2
                OnClick = btnCalcularParcelasClick
              end
            end
            object Panel9: TPanel
              Left = 0
              Top = 34
              Width = 592
              Height = 19
              Align = alTop
              BevelOuter = bvLowered
              Caption = 'Parcelas'
              Color = clBlue
              Font.Charset = ANSI_CHARSET
              Font.Color = clWhite
              Font.Height = -11
              Font.Name = 'Arial'
              Font.Style = [fsBold]
              ParentFont = False
              TabOrder = 1
            end
            object grdParcelas: TDBGrid
              Left = 0
              Top = 53
              Width = 592
              Height = 245
              Align = alClient
              DataSource = dsPlanosItens
              Options = [dgEditing, dgTitles, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgConfirmDelete, dgCancelOnExit]
              TabOrder = 2
              TitleFont.Charset = DEFAULT_CHARSET
              TitleFont.Color = clWindowText
              TitleFont.Height = -11
              TitleFont.Name = 'Tahoma'
              TitleFont.Style = []
              OnColExit = grdParcelasColExit
              OnDrawColumnCell = grdParcelasDrawColumnCell
              OnEnter = grdParcelasEnter
              OnKeyDown = grdParcelasKeyDown
              OnKeyPress = grdParcelasKeyPress
              Columns = <
                item
                  Expanded = False
                  FieldName = 'NR_DIA'
                  Title.Caption = 'Dia'
                  Width = 24
                  Visible = True
                end
                item
                  Expanded = False
                  FieldName = 'NR_MES'
                  Title.Caption = 'M'#234's'
                  Width = 27
                  Visible = True
                end
                item
                  Expanded = False
                  FieldName = 'NR_ANO'
                  Title.Caption = 'Ano'
                  Width = 32
                  Visible = True
                end
                item
                  Expanded = False
                  FieldName = 'NR_PARCELA'
                  Title.Caption = 'Parc.'
                  Width = 33
                  Visible = True
                end
                item
                  Expanded = False
                  FieldName = 'VL_BRUTO'
                  Title.Caption = 'Vl. Bruto'
                  Width = 47
                  Visible = True
                end
                item
                  Expanded = False
                  FieldName = 'VL_DESCONTO'
                  Title.Caption = 'Vl. Desc.'
                  Width = 47
                  Visible = True
                end
                item
                  Expanded = False
                  FieldName = 'VL_EXTRA'
                  Title.Caption = 'Vl. Extra'
                  Width = 48
                  Visible = True
                end
                item
                  Expanded = False
                  FieldName = 'VL_DESCONTO_EXTRA'
                  Title.Caption = 'Desc. Extra'
                  Width = 61
                  Visible = True
                end
                item
                  Expanded = False
                  FieldName = 'VL_TOTAL'
                  Title.Caption = 'Vl. Total'
                  Width = 48
                  Visible = True
                end
                item
                  Expanded = False
                  FieldName = 'DS_CREDITO_PARCELA'
                  Title.Caption = 'CR'
                  Width = 19
                  Visible = True
                end
                item
                  Expanded = False
                  FieldName = 'NR_CREDITOS_MINIMOS'
                  Title.Caption = 'CR Min.'
                  Width = 41
                  Visible = True
                end
                item
                  Expanded = False
                  FieldName = 'DS_TIPO_TITULO'
                  Title.Caption = 'Tipo Tit.'
                  Width = 65
                  Visible = True
                end
                item
                  Expanded = False
                  FieldName = 'DS_DIVISIVEL'
                  Title.Caption = 'Div.'
                  Visible = True
                end>
            end
            object dblcTipoTitulo: TDBLookupComboBox
              Left = 257
              Top = 26
              Width = 109
              Height = 21
              DataField = 'DS_TIPO_TITULO'
              DataSource = dsPlanosItens
              TabOrder = 3
              Visible = False
            end
            object pnNaoPodeExcluirItens: TPanel
              Left = 0
              Top = 298
              Width = 592
              Height = 34
              Align = alBottom
              BevelOuter = bvNone
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clRed
              Font.Height = -11
              Font.Name = 'Tahoma'
              Font.Style = []
              ParentFont = False
              TabOrder = 4
              object Label19: TLabel
                Left = 30
                Top = 6
                Width = 3
                Height = 13
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clRed
                Font.Height = -11
                Font.Name = 'Tahoma'
                Font.Style = [fsBold]
                ParentFont = False
              end
            end
          end
          object tsTurmas: TTabSheet
            AlignWithMargins = True
            Caption = 'Turmas'
            ImageIndex = 1
            object ScrollBox3: TScrollBox
              Left = 0
              Top = 0
              Width = 586
              Height = 326
              HorzScrollBar.Visible = False
              VertScrollBar.Tracking = True
              Align = alClient
              TabOrder = 0
              object grdTurmas: TDBGrid
                Left = 0
                Top = 19
                Width = 582
                Height = 260
                Align = alClient
                DataSource = dsPlanosTurmas
                Options = [dgTitles, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgConfirmDelete, dgCancelOnExit, dgMultiSelect]
                TabOrder = 0
                TitleFont.Charset = DEFAULT_CHARSET
                TitleFont.Color = clWindowText
                TitleFont.Height = -11
                TitleFont.Name = 'Tahoma'
                TitleFont.Style = []
                Columns = <
                  item
                    Expanded = False
                    FieldName = 'CD_CURSO'
                    Title.Caption = 'C'#243'd. Curso'
                    Visible = True
                  end
                  item
                    Expanded = False
                    FieldName = 'CD_TURMA'
                    Title.Caption = 'C'#243'd. Turma'
                    Width = 104
                    Visible = True
                  end
                  item
                    Expanded = False
                    FieldName = 'DS_TURMA'
                    Title.Caption = 'Desc. Turma'
                    Width = 200
                    Visible = True
                  end>
              end
              object Panel10: TPanel
                Left = 0
                Top = 279
                Width = 582
                Height = 19
                Align = alBottom
                BevelOuter = bvNone
                Caption = 'Mantenha o CTRL selecionado para marcar mais de uma turma'
                TabOrder = 1
              end
              object ToolBar1: TToolBar
                Left = 0
                Top = 298
                Width = 582
                Height = 24
                Align = alBottom
                ButtonWidth = 195
                Caption = 'toolPessoa'
                Customizable = True
                EdgeBorders = [ebTop]
                Images = ImageList2
                List = True
                ShowCaptions = True
                TabOrder = 2
                Wrapable = False
                object btnAddCurso: TToolButton
                  AlignWithMargins = True
                  Left = 0
                  Top = 0
                  Caption = 'Vincular todas Turmas de um Curso'
                  ImageIndex = 0
                  OnClick = btnAddCursoClick
                end
                object btnAddTurma: TToolButton
                  AlignWithMargins = True
                  Left = 195
                  Top = 0
                  AutoSize = True
                  Caption = 'Vincular Turma'
                  ImageIndex = 0
                  OnClick = btnAddTurmaClick
                end
                object ToolButton3: TToolButton
                  AlignWithMargins = True
                  Left = 296
                  Top = 0
                  Width = 8
                  Caption = 'ToolButton1'
                  ImageIndex = 3
                  Style = tbsSeparator
                end
                object ToolButton5: TToolButton
                  AlignWithMargins = True
                  Left = 304
                  Top = 0
                  AutoSize = True
                  Caption = ' Selecionar Todos'
                  ImageIndex = 3
                  OnClick = ToolButton5Click
                end
                object ToolButton6: TToolButton
                  AlignWithMargins = True
                  Left = 419
                  Top = 0
                  AutoSize = True
                  Caption = 'Retirar Selecionados'
                  ImageIndex = 1
                  OnClick = ToolButton6Click
                end
              end
              object Panel11: TPanel
                Left = 0
                Top = 0
                Width = 582
                Height = 19
                Align = alTop
                BevelOuter = bvLowered
                Caption = 'Turmas'
                Color = clBlue
                Font.Charset = ANSI_CHARSET
                Font.Color = clWhite
                Font.Height = -11
                Font.Name = 'Arial'
                Font.Style = [fsBold]
                ParentFont = False
                TabOrder = 3
              end
            end
          end
          object tsDistrato: TTabSheet
            Caption = 'Distrato'
            ImageIndex = 2
            object ScrollBox2: TScrollBox
              Left = 0
              Top = 0
              Width = 592
              Height = 332
              Align = alClient
              BevelInner = bvNone
              BevelOuter = bvNone
              BorderStyle = bsNone
              TabOrder = 0
              object Label13: TLabel
                Left = 5
                Top = 5
                Width = 77
                Height = 13
                Caption = 'Valor Cobran'#231'a:'
              end
              object Label15: TLabel
                Left = 6
                Top = 96
                Width = 211
                Height = 13
                Caption = 'Gerar cobran'#231'a de distrato no tipo de t'#237'tulo:'
              end
              object Label16: TLabel
                Left = 6
                Top = 135
                Width = 283
                Height = 13
                Caption = 'Cobrar o acordo quando o estudante entrar nas situa'#231#245'es:'
              end
              object lbContabilizarTiposTitulo: TLabel
                Left = 6
                Top = 226
                Width = 128
                Height = 13
                Caption = 'Contabilizar tipos de t'#237'tulo:'
              end
              object Label14: TLabel
                Left = 302
                Top = 5
                Width = 82
                Height = 13
                Caption = 'Dias Vencimento:'
              end
              object edValorCobranca: TDBEdit
                Left = 5
                Top = 20
                Width = 98
                Height = 21
                DataField = 'VL_COBRANCA'
                DataSource = dsPlanosDistratos
                TabOrder = 0
                OnKeyUp = edValorCobrancaKeyUp
              end
              object rgTipoValor: TRadioGroup
                Left = 120
                Top = 2
                Width = 166
                Height = 39
                Caption = 'Valor'
                Columns = 2
                Items.Strings = (
                  'Fixo'
                  'Percentual')
                TabOrder = 1
                OnClick = rgTipoValorClick
              end
              object cbTipoTitulo: TDBLookupComboBox
                Left = 6
                Top = 113
                Width = 515
                Height = 21
                DataField = 'DS_TIPO_TITULO'
                DataSource = dsPlanosDistratos
                TabOrder = 3
              end
              object ckbSituacoesEstudante: TCheckListBox
                Left = 5
                Top = 152
                Width = 515
                Height = 73
                OnClickCheck = ckbSituacoesEstudanteClickCheck
                ItemHeight = 13
                TabOrder = 4
              end
              object ckbContabilizarTiposTitulo: TCheckListBox
                Left = 5
                Top = 243
                Width = 515
                Height = 76
                OnClickCheck = ckbContabilizarTiposTituloClickCheck
                ItemHeight = 13
                TabOrder = 5
              end
              object edDiasVencimento: TDBEdit
                Left = 302
                Top = 20
                Width = 98
                Height = 21
                DataField = 'NR_DIAS_VENCIMENTO'
                DataSource = dsPlanosDistratos
                TabOrder = 2
              end
              object rgTipoParcelas: TRadioGroup
                Left = 5
                Top = 43
                Width = 357
                Height = 50
                Caption = 'Tipo de parcelas'
                Columns = 2
                ItemIndex = 0
                Items.Strings = (
                  'Todas as parcelas'
                  'Apenas Vencidas'
                  'Apenas a vencer '
                  'Proporcinal do m'#234's + a vencer')
                TabOrder = 6
                OnClick = rgTipoParcelasClick
              end
            end
          end
        end
      end
      object Panel2: TPanel
        Left = 0
        Top = 0
        Width = 605
        Height = 397
        Align = alTop
        BevelOuter = bvNone
        TabOrder = 1
        object Label3: TLabel
          Left = 3
          Top = 6
          Width = 50
          Height = 13
          Caption = 'Descri'#231#227'o:'
        end
        object Label4: TLabel
          Left = 211
          Top = 83
          Width = 44
          Height = 13
          Caption = 'Parcelas:'
        end
        object lbQtdCreditosBase: TLabel
          Left = 315
          Top = 83
          Width = 90
          Height = 13
          Caption = 'Qtd. Cr'#233'dito Base:'
          Enabled = False
        end
        object Label5: TLabel
          Left = 419
          Top = 80
          Width = 28
          Height = 13
          Caption = 'Valor:'
        end
        object lbValorExtra: TLabel
          Left = 3
          Top = 126
          Width = 57
          Height = 13
          Caption = 'Valor Extra:'
          Enabled = False
        end
        object Label7: TLabel
          Left = 107
          Top = 126
          Width = 63
          Height = 13
          Caption = 'Desc. Cond.:'
        end
        object Label6: TLabel
          Left = 211
          Top = 126
          Width = 69
          Height = 13
          Caption = 'Vl. Parc. Zero:'
        end
        object Label8: TLabel
          Left = 315
          Top = 126
          Width = 77
          Height = 13
          Caption = 'Dias Parc. Zero:'
        end
        object Label9: TLabel
          Left = 419
          Top = 126
          Width = 55
          Height = 13
          Caption = 'A partir de:'
        end
        object Label10: TLabel
          Left = 3
          Top = 240
          Width = 113
          Height = 13
          Caption = 'Observa'#231#245'es Especiais:'
        end
        object btnCopiarPlano: TSpeedButton
          Left = 397
          Top = 19
          Width = 120
          Height = 27
          Hint = 'Copiar o plano selecionado para outro per'#237'odo'
          Caption = 'F10 Copiar Plano'
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
          OnClick = btnCopiarPlanoClick
        end
        object lblDiasVencto: TLabel
          Left = 35
          Top = 290
          Width = 142
          Height = 13
          Caption = 'Poss'#237'veis dias de vencimento:'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
        end
        object LblDtInicio: TLabel
          Left = 152
          Top = 44
          Width = 72
          Height = 13
          Caption = 'Vig'#234'ncia - in'#237'cio'
        end
        object LblDtFim: TLabel
          Left = 260
          Top = 44
          Width = 63
          Height = 13
          Caption = 'Vig'#234'ncia - fim'
        end
        object sbExpandeCalendario: TSpeedButton
          Left = 5
          Top = 286
          Width = 23
          Height = 20
          AllowAllUp = True
          GroupIndex = 7
          Flat = True
          Glyph.Data = {
            36030000424D3603000000000000360000002800000010000000100000000100
            1800000000000003000000000000000000000000000000000000D8E9ECD8E9EC
            D8E9EC9BA0B99CA3BDA1A6BEA0A2B9A8A8B9ABA5B2A59FAAA7A6B893A0BD789E
            C78CA5B5C0B39ED8E9ECD8E9ECC6DBF29EBBDC86AAD27BA1CB799EC67FA0C688
            A6C78CA6C58FABCA809EC27DA3CC6DA0D090ACBFB5AB98BCB0A487DFF64AA2E2
            3A95D53B9AE13192DD3698E2409DE23C95D93C95DC3A95DF3C97E14399DF4D95
            D483A5BDAEAA9BB3A99E279AEC309CE43297D839A0E6339DE9309BE83A9EE235
            97DD389DEB37A1F5349AEA3E99DF51A0E278A1C0A6A69DB5AEA63490D67CCAEE
            BDFAFF84C1DBB8F9FF86C8E8B5EDFBA5DDF195D5F1A0E7FC87C5EFBEF3FF75BB
            F170A3C9A0A7A5B0ADA74AA5F27BBFE2D1FEFF91BDD1BFF0FF94C6DFCFF4FABA
            E1F3ABDEF3B0ECFD98C7F2D4F7FF6FB3EB629DCC9FADAEADADAB1887F050A2E7
            81B5D77FB0D279B0DD6FA7DB8BB6DB7DABD869A5E9549CF1639BDE89B0DB5DA8
            ED599BD098ABB2A0A5A5158FFE66C1FCBAF3FF8EC2E6B7F2FF85C1EFC0EEFCA4
            D7F72F72C3084DB373AFF3C8F2FF6CBAFD539AD292A9B3A5ABAD138FFF64BEFF
            BBF4FF8BC0EBB0ECFF85C4FCBDEDFE9ED1F7286BC80648B864A3F0C2EEFF62B4
            FA549BD790A9B4A3ABAD1D8AF94898EC80B1E26F9ECF82B6F3679DE088B0E581
            ACE9528CDF3076DB659AED8AB1EB58A5F45095D28BA1AD9CA3A64B99EE8FC6EF
            D8F7FFAAC7DFD4F5FFA5C9EAD2E9FCBDD6F7B5DBF7B4E3FEA4C6F9D4EEFF6FB6
            F75D9FD99AADB8ACB1B3438CD788C3E9CDF9FF99C5E3C5F5FF91C1E7C8F0FBB4
            DAF3A9D8F3AFE6FD97C4F1CCF5FF6EB7F7609ED293A4AC9EA2A5379DF241A1EC
            49A4E646A2EA4BABF83C9BEB50A9F14DA3ED4CA7F641A0F74DA7F94FA2ED479E
            ED659BCB9BA6AAA6A6A63196EE2E94EB1F87DD2691EF1D8BED1C8AEC2992EF1E
            83DF2A90ED1F86E7238BEC2184E12A83D771A2CDC9D0D1E5E2E2458BDC4491E9
            287DDE2D88F1207BE72681EB3B92F92B7FE13A8AE92B7CDD3086EB2F86EB3B8C
            E08EBBE2EAF0F0D8E9ECB5EDFF80C0F9317DE269BBFD3084F15DAFF43B8AF14F
            9AEA62A8F33D83DF6DB9FE2D7EE779C6F7C4EFFFD8E9ECD8E9EC}
          Transparent = False
          OnClick = sbExpandeCalendarioClick
        end
        object Label21: TLabel
          Left = 4
          Top = 170
          Width = 225
          Height = 13
          Caption = 'A'#231#227'o de Movimento para desconto condicional:'
        end
        object Label22: TLabel
          Left = 267
          Top = 170
          Width = 191
          Height = 13
          Caption = 'A'#231#227'o de Movimento para desconto fixo:'
        end
        object edDescricao: TDBEdit
          Left = 3
          Top = 19
          Width = 388
          Height = 21
          DataField = 'DS_PLANO'
          DataSource = dsPlanos
          TabOrder = 0
        end
        object edParcelas: TDBEdit
          Left = 211
          Top = 99
          Width = 98
          Height = 21
          DataField = 'NR_PARCELAS'
          DataSource = dsPlanos
          TabOrder = 5
        end
        object rgTipoPlano: TRadioGroup
          Left = 3
          Top = 83
          Width = 202
          Height = 37
          Caption = 'Tipo de Plano'
          Columns = 2
          Items.Strings = (
            'Valor Fixo'
            'Por Cr'#233'dito')
          TabOrder = 4
          OnClick = rgTipoPlanoClick
        end
        object edQtdCreditosBase: TDBEdit
          Left = 315
          Top = 99
          Width = 98
          Height = 21
          DataField = 'NR_CREDITOS_BASE'
          DataSource = dsPlanos
          Enabled = False
          TabOrder = 6
        end
        object edValor: TDBEdit
          Left = 419
          Top = 99
          Width = 98
          Height = 21
          DataField = 'VL_COBRADO'
          DataSource = dsPlanos
          TabOrder = 7
        end
        object edValorExtra: TDBEdit
          Left = 3
          Top = 142
          Width = 98
          Height = 21
          DataField = 'VL_TAXAAPOSTILA'
          DataSource = dsPlanos
          Enabled = False
          TabOrder = 8
        end
        object edDescCond: TDBEdit
          Left = 107
          Top = 142
          Width = 98
          Height = 21
          DataField = 'VL_DESCONTO'
          DataSource = dsPlanos
          TabOrder = 9
        end
        object edVlParcZero: TDBEdit
          Left = 211
          Top = 142
          Width = 98
          Height = 21
          DataField = 'VL_MATRICULA'
          DataSource = dsPlanos
          TabOrder = 10
        end
        object edDiasParcZero: TDBEdit
          Left = 315
          Top = 142
          Width = 98
          Height = 21
          DataField = 'NR_DIAS_PARCELA_ZERO'
          DataSource = dsPlanos
          TabOrder = 11
        end
        object edAPartirDe: TDBEdit
          Left = 419
          Top = 142
          Width = 98
          Height = 21
          DataField = 'DT_APARTIR'
          DataSource = dsPlanos
          TabOrder = 12
        end
        object edObservacoesEspeciais: TDBEdit
          Left = 3
          Top = 258
          Width = 541
          Height = 21
          DataField = 'DS_PARAGRAFO3'
          DataSource = dsPlanos
          TabOrder = 17
        end
        object DBCheckBox1: TDBCheckBox
          Left = 3
          Top = 214
          Width = 70
          Height = 17
          Caption = 'Dias '#250'teis'
          DataField = 'SN_DIAS_UTEIS'
          DataSource = dsPlanos
          TabOrder = 13
          ValueChecked = '1'
          ValueUnchecked = '0'
        end
        object dbchPularSabados: TDBCheckBox
          Left = 78
          Top = 214
          Width = 89
          Height = 17
          Caption = 'Pular s'#225'bados'
          DataField = 'SN_PULAR_SABADOS'
          DataSource = dsPlanos
          TabOrder = 14
          ValueChecked = '1'
          ValueUnchecked = '0'
        end
        object dbchPularDomingos: TDBCheckBox
          Left = 174
          Top = 214
          Width = 94
          Height = 17
          Caption = 'Pular domingos'
          DataField = 'SN_PULAR_DOMINGOS'
          DataSource = dsPlanos
          TabOrder = 15
          ValueChecked = '1'
          ValueUnchecked = '0'
        end
        object dbchPularFeriados: TDBCheckBox
          Left = 278
          Top = 214
          Width = 89
          Height = 17
          Caption = 'Pular feriados'
          DataField = 'SN_PULAR_FERIADOS'
          DataSource = dsPlanos
          TabOrder = 16
          ValueChecked = '1'
          ValueUnchecked = '0'
        end
        object DBEdit1: TDBEdit
          Left = 152
          Top = 60
          Width = 98
          Height = 21
          DataField = 'DT_VIGENCIA_INICIO'
          DataSource = dsPlanos
          TabOrder = 2
        end
        object DBEdit2: TDBEdit
          Left = 260
          Top = 60
          Width = 98
          Height = 21
          DataField = 'DT_VIGENCIA_FIM'
          DataSource = dsPlanos
          TabOrder = 3
        end
        object snVigencia: TDBCheckBox
          Left = 5
          Top = 60
          Width = 141
          Height = 17
          Caption = 'Usar per'#237'odo de vig'#234'ncia'
          DataField = 'SN_VIGENCIA'
          DataSource = dsPlanos
          TabOrder = 1
          ValueChecked = '1'
          ValueUnchecked = '0'
          OnClick = snVigenciaClick
        end
        object pnCalendario: TPanel
          Left = 0
          Top = 314
          Width = 605
          Height = 83
          Align = alBottom
          BevelOuter = bvNone
          Caption = 'pnCalendario'
          TabOrder = 18
          object tspe: TSpeedButton
            Left = 526
            Top = 49
            Width = 23
            Height = 34
            Flat = True
            Glyph.Data = {
              76030000424D7603000000000000360000002800000011000000100000000100
              18000000000040030000C30E0000C30E00000000000000000000FFFFFF999999
              999999999999999999999999999999999999FFFFFFFFFFFFFFFFFFFFFFFFFFFF
              FFFFFFFFFFFFFFFFFFFFFFFFFF00FFFFFF999999FFFFFFFFFFFFFFFFFFFFFFFF
              FFFFFF999999FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
              FF00FFFFFF999999FFFFFFFFFFFFFFFFFFFFFFFFFFFFFF999999FFFFFFFFFFFF
              FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF00FFFFFF999999FFFFFFFF
              FFFFFFFFFFFFFFFFFFFFFF999999FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
              FFFFFFFFFFFFFFFFFF00FFFFFF999999FFFFFFFFFFFFFFFFFFFFFFFFFFFFFF99
              9999FFFFFF999999999999999999999999999999999999999999FFFFFF00FFFF
              FF999999FFFFFFFFFFFFFFFFFFFFFFFFFFFFFF999999FFFFFF999999FFFFFFFF
              FFFFFFFFFFFFFFFFFFFFFF999999FFFFFF00FFFFFF9999999999999999999999
              99999999999999999999FFFFFF999999FFFFFFFFFFFFFFFFFFFFFFFFFFFFFF99
              9999FFFFFF00FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
              FF999999FFFFFFFFFFFFFFFFFFFFFFFFFFFFFF999999FFFFFF00FFFFFFFFFFFF
              FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF999999FFFFFFFFFFFFFFFF
              FFFFFFFFFFFFFF999999FFFFFF00FFFFFF999999999999999999999999999999
              999999999999FFFFFF999999FFFFFFFFFFFFFFFFFFFFFFFFFFFFFF999999FFFF
              FF00FFFFFF999999FFFFFFFFFFFFFFFFFFFFFFFFFFFFFF999999FFFFFF999999
              999999999999999999999999999999999999FFFFFF00FFFFFF999999FFFFFFFF
              FFFFFFFFFFFFFFFFFFFFFF999999FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
              FFFFFFFFFFFFFFFFFF00FFFFFF999999FFFFFFFFFFFFFFFFFFFFFFFFFFFFFF99
              9999FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF00FFFF
              FF999999FFFFFFFFFFFFFFFFFFFFFFFFFFFFFF999999FFFFFFFFFFFFFFFFFFFF
              FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF00FFFFFF999999FFFFFFFFFFFFFFFF
              FFFFFFFFFFFFFF999999FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
              FFFFFFFFFF00FFFFFF999999999999999999999999999999999999999999FFFF
              FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF00}
            OnClick = tspeClick
          end
          object sbSelDias: TSpeedButton
            Left = 526
            Top = 4
            Width = 23
            Height = 31
            Flat = True
            Glyph.Data = {
              82020000424D8202000000000000420000002800000011000000100000000100
              10000300000040020000C30E0000C30E00000000000000000000007C0000E003
              00001F000000FF7F734E734E734E734E734E734E734EFF7FFF7FFF7FFF7FFF7F
              FF7FFF7FFF7FFF7F0000FF7F734EFF7FFF7FFF7FFF7FFF7F734EFF7FFF7FFF7F
              FF7FFF7FFF7FFF7FFF7FFF7F0000FF7F734EFF7FFF7F0000FF7FFF7F734EFF7F
              FF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7F0000FF7F734EFF7F0000FF7F0000FF7F
              734EFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7F0000FF7F734EFF7FFF7FFF7F
              FF7F0000734EFF7F734E734E734E734E734E734E734EFF7F0000FF7F734EFF7F
              FF7FFF7FFF7FFF7F734EFF7F734EFF7FFF7FFF7FFF7FFF7F734EFF7F0000FF7F
              734E734E734E734E734E734E734EFF7F734EFF7FFF7F0000FF7FFF7F734EFF7F
              0000FF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7F734EFF7F0000FF7F0000FF7F
              734EFF7F0000FF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7F734EFF7FFF7FFF7F
              FF7F0000734EFF7F0000FF7F734E734E734E734E734E734E734EFF7F734EFF7F
              FF7FFF7FFF7FFF7F734EFF7F0000FF7F734EFF7FFF7FFF7FFF7FFF7F734EFF7F
              734E734E734E734E734E734E734EFF7F0000FF7F734EFF7FFF7F0000FF7FFF7F
              734EFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7F0000FF7F734EFF7F0000FF7F
              0000FF7F734EFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7F0000FF7F734EFF7F
              FF7FFF7FFF7F0000734EFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7F0000FF7F
              734EFF7FFF7FFF7FFF7FFF7F734EFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7F
              0000FF7F734E734E734E734E734E734E734EFF7FFF7FFF7FFF7FFF7FFF7FFF7F
              FF7FFF7F0000}
            OnClick = sbSelDiasClick
          end
          object clbDiasVencto: TCheckListBox
            Left = 5
            Top = 0
            Width = 515
            Height = 83
            OnClickCheck = clbDiasVenctoClickCheck
            Columns = 7
            ItemHeight = 13
            Items.Strings = (
              '01'
              '02'
              '03'
              '04'
              '05'
              '06'
              '07'
              '08'
              '09'
              '10'
              '11'
              '12'
              '13'
              '14'
              '15'
              '16'
              '17'
              '18'
              '19'
              '20'
              '21'
              '22'
              '23'
              '24'
              '25'
              '26'
              '27'
              '28'
              '29'
              '30'
              '31')
            TabOrder = 0
          end
        end
        object DBLookupComboBox1: TDBLookupComboBox
          Left = 267
          Top = 186
          Width = 250
          Height = 21
          DataField = 'AcaoMovimentoDescFixo'
          DataSource = dsPlanos
          TabOrder = 19
        end
        object DBLookupComboBox2: TDBLookupComboBox
          Left = 3
          Top = 186
          Width = 250
          Height = 21
          DataField = 'AcaoMovimentoDescCondicional'
          DataSource = dsPlanos
          TabOrder = 20
        end
      end
    end
  end
  object pnListagem: TPanel
    Left = 609
    Top = 20
    Width = 618
    Height = 794
    Align = alClient
    BevelOuter = bvNone
    TabOrder = 2
    object Label17: TLabel
      Left = 112
      Top = 488
      Width = 37
      Height = 13
      Caption = 'Label17'
    end
    object Panel3: TPanel
      Left = 0
      Top = 0
      Width = 618
      Height = 67
      Align = alTop
      TabOrder = 0
      object pnAlinhamentoCurso: TPanel
        Left = 2
        Top = 4
        Width = 247
        Height = 29
        Align = alCustom
        BevelOuter = bvNone
        TabOrder = 0
        object Label12: TLabel
          Left = 22
          Top = 7
          Width = 34
          Height = 13
          Caption = 'Turma:'
        end
        object sbFiltroTurma: TSpeedButton
          Left = 219
          Top = 4
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
          OnClick = sbFiltroTurmaClick
        end
        object edTurma: TEdit
          Left = 62
          Top = 4
          Width = 158
          Height = 21
          ReadOnly = True
          TabOrder = 0
        end
      end
      object pnAlinhamentoTurma: TPanel
        Left = 9
        Top = 30
        Width = 237
        Height = 31
        BevelOuter = bvNone
        TabOrder = 1
        object Label20: TLabel
          Left = 0
          Top = 7
          Width = 50
          Height = 13
          Caption = 'Descri'#231#227'o:'
        end
        object edFiltroDesc: TEdit
          Left = 55
          Top = 5
          Width = 158
          Height = 21
          TabOrder = 0
        end
      end
      object pnAlinhamentoBotoes: TPanel
        Left = 222
        Top = 31
        Width = 182
        Height = 31
        BevelOuter = bvNone
        TabOrder = 2
        object btnLimpar: TButton
          Left = 85
          Top = 1
          Width = 69
          Height = 25
          Caption = 'Limpar'
          TabOrder = 0
          OnClick = btnLimparClick
        end
        object btnFiltrar: TButton
          Left = 6
          Top = 1
          Width = 69
          Height = 25
          Caption = 'Filtrar'
          TabOrder = 1
          OnClick = btnFiltrarClick
        end
      end
    end
    object grdPlanos: TDBGrid
      Left = 0
      Top = 67
      Width = 618
      Height = 727
      Align = alClient
      DataSource = dsPlanos
      Options = [dgTitles, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgConfirmDelete, dgCancelOnExit]
      TabOrder = 1
      TitleFont.Charset = DEFAULT_CHARSET
      TitleFont.Color = clWindowText
      TitleFont.Height = -11
      TitleFont.Name = 'Tahoma'
      TitleFont.Style = []
      OnDrawColumnCell = grdPlanosDrawColumnCell
      Columns = <
        item
          Expanded = False
          FieldName = 'DS_PLANO'
          Title.Caption = 'Descri'#231#227'o'
          Width = 99
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'NR_PARCELAS'
          Title.Caption = 'Parcelas'
          Width = 45
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'DS_TIPO_PLANO'
          Title.Caption = 'Tipo de Plano'
          Width = 70
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'NR_CREDITOS_BASE'
          Title.Caption = 'Qtd. Cr'#233'dito Base'
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'VL_COBRADO'
          Title.Caption = 'Vl. Bruto'
          Width = 69
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'VL_MATRICULA'
          Title.Caption = 'Vl. Parc. Zero'
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'DT_APARTIR'
          Title.Caption = 'A partir de'
          Width = 66
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'NR_TOTAL_TURMAS'
          Title.Caption = 'Turmas (Total)'
          Width = 76
          Visible = True
        end>
    end
  end
  object toolPessoa: TToolBar
    Left = 0
    Top = 814
    Width = 1227
    Height = 25
    Align = alBottom
    ButtonWidth = 84
    Caption = 'toolPlanos'
    EdgeBorders = [ebTop, ebBottom]
    Images = ImageList1
    List = True
    ShowCaptions = True
    TabOrder = 3
    object ToolButton1: TToolButton
      Left = 0
      Top = 0
      Width = 8
      Caption = 'ToolButton1'
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
    object btnExcluir: TToolButton
      Left = 176
      Top = 0
      Caption = 'F9 Excluir'
      ImageIndex = 2
      OnClick = btnExcluirClick
    end
    object ToolButton4: TToolButton
      Left = 260
      Top = 0
      Width = 8
      Caption = 'ToolButton4'
      ImageIndex = 3
      Style = tbsSeparator
    end
    object btnSalvar: TToolButton
      Left = 268
      Top = 0
      Caption = 'F5 Salvar'
      ImageIndex = 3
      OnClick = btnSalvarClick
    end
    object btnCancelar: TToolButton
      Left = 352
      Top = 0
      Caption = 'F6 Cancelar'
      ImageIndex = 4
      OnClick = btnCancelarClick
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
  object ImageList1: TImageList
    Left = 584
    Top = 464
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
  object qyPlanos: TUMZQuery
    Connection = DM.db
    OnCalcFields = qyPlanosCalcFields
    UpdateObject = updPlanos
    BeforePost = qyPlanosBeforePost
    AfterPost = qyPlanosAfterPost
    BeforeDelete = qyPlanosBeforeDelete
    OnNewRecord = qyPlanosNewRecord
    SQL.Strings = (
      'SELECT'
      '   CD_PLANO,'
      '   CD_COLIGADA,'
      '   CD_TIPO_PLANO,'
      '   DS_PLANO,'
      '   NR_ANOSEMESTRE,'
      '   NR_PARCELAS,'
      '   VL_COBRADO,'
      '   VL_CONTRATO,'
      '   VL_TAXAMATERIAL,'
      '   VL_TAXAAPOSTILA,'
      '   VL_DESCONTO,'
      '   VL_MATRICULA,'
      '   DT_APARTIR,'
      '   NR_TAXASMATERIAL,'
      '   DS_PARAGRAFO3,'
      '   NR_DIAS_PARCELA_ZERO,'
      '   SN_DIAS_UTEIS,'
      '   SN_CREDITOS,'
      '   NR_CREDITOS_BASE,'
      '   NR_MAX_DISCIPLINAS,'
      '   DS_DIAS_VENCTO,'
      '   SN_PULAR_SABADOS,'
      '   SN_PULAR_DOMINGOS,'
      '   SN_PULAR_FERIADOS,'
      '   DT_VIGENCIA_INICIO,'
      '   DT_VIGENCIA_FIM,'
      '   SN_VIGENCIA,'
      '   ('
      '      SELECT'
      #9#9#9'   COUNT(T.CODIGO)'
      #9#9'  FROM'
      #9#9#9'   TURMAS T'
      '      WHERE'
      #9#9#9'   T.ANOSEMESTRE = FP.NR_ANOSEMESTRE AND'
      
        #9#9#9'  (T.CURSO, T.CODIGO) IN (SELECT FPT.CD_CURSO, FPT.CD_TURMA F' +
        'ROM FIN_PLANOS_TURMAS FPT WHERE FPT.CD_PLANO = FP.CD_PLANO)'
      #9')'
      '  NR_TOTAL_TURMAS,'
      '  cd_acao_movimento_desc_cond,'
      '  cd_acao_movimento_desc_fixo'
      'FROM'
      #9'FIN_PLANOS FP')
    Params = <>
    Left = 656
    Top = 224
    object qyPlanosCD_PLANO: TIntegerField
      FieldName = 'CD_PLANO'
    end
    object qyPlanosCD_COLIGADA: TIntegerField
      FieldName = 'CD_COLIGADA'
      Required = True
    end
    object qyPlanosCD_TIPO_PLANO: TIntegerField
      FieldName = 'CD_TIPO_PLANO'
      Required = True
    end
    object qyPlanosDS_PLANO: TStringField
      FieldName = 'DS_PLANO'
      Size = 50
    end
    object qyPlanosNR_ANOSEMESTRE: TSmallintField
      FieldName = 'NR_ANOSEMESTRE'
      DisplayFormat = '0000/0'
      EditFormat = '0000/0'
    end
    object qyPlanosNR_PARCELAS: TSmallintField
      FieldName = 'NR_PARCELAS'
    end
    object qyPlanosVL_COBRADO: TFloatField
      FieldName = 'VL_COBRADO'
      DisplayFormat = '###,###,##0.000'
      EditFormat = '0.000'
    end
    object qyPlanosVL_CONTRATO: TFloatField
      FieldName = 'VL_CONTRATO'
      DisplayFormat = '###,###,##0.000'
      EditFormat = '0.000'
    end
    object qyPlanosVL_TAXAMATERIAL: TFloatField
      FieldName = 'VL_TAXAMATERIAL'
    end
    object qyPlanosVL_TAXAAPOSTILA: TFloatField
      FieldName = 'VL_TAXAAPOSTILA'
      DisplayFormat = '###,###,##0.000'
      EditFormat = '0.000'
    end
    object qyPlanosVL_DESCONTO: TFloatField
      FieldName = 'VL_DESCONTO'
      DisplayFormat = '###,###,##0.000'
      EditFormat = '0.000'
    end
    object qyPlanosVL_MATRICULA: TFloatField
      FieldName = 'VL_MATRICULA'
      DisplayFormat = '###,###,##0.000'
      EditFormat = '0.000'
    end
    object qyPlanosDT_APARTIR: TDateTimeField
      FieldName = 'DT_APARTIR'
      DisplayFormat = 'dd/mm/yyyy'
      EditMask = '!99/99/0000;1;_'
    end
    object qyPlanosNR_TAXASMATERIAL: TSmallintField
      FieldName = 'NR_TAXASMATERIAL'
    end
    object qyPlanosDS_PARAGRAFO3: TStringField
      FieldName = 'DS_PARAGRAFO3'
      Size = 150
    end
    object qyPlanosNR_DIAS_PARCELA_ZERO: TSmallintField
      FieldName = 'NR_DIAS_PARCELA_ZERO'
    end
    object qyPlanosSN_DIAS_UTEIS: TSmallintField
      FieldName = 'SN_DIAS_UTEIS'
      Required = True
    end
    object qyPlanosSN_CREDITOS: TSmallintField
      FieldName = 'SN_CREDITOS'
      Required = True
    end
    object qyPlanosNR_CREDITOS_BASE: TFloatField
      FieldName = 'NR_CREDITOS_BASE'
      Required = True
      DisplayFormat = '##0.000'
      EditFormat = '0.000'
    end
    object qyPlanosNR_MAX_DISCIPLINAS: TLargeintField
      FieldName = 'NR_MAX_DISCIPLINAS'
    end
    object qyPlanosDS_TIPO_TITULO: TStringField
      FieldName = 'DS_TIPO_TITULO'
      Size = 255
    end
    object qyPlanosNR_TOTAL_TURMAS: TLargeintField
      FieldName = 'NR_TOTAL_TURMAS'
      ReadOnly = True
    end
    object qyPlanosDS_DIAS_VENCTO: TStringField
      FieldName = 'DS_DIAS_VENCTO'
      Required = True
      Size = 31
    end
    object qyPlanosDS_TIPO_PLANO: TStringField
      FieldKind = fkCalculated
      FieldName = 'DS_TIPO_PLANO'
      Calculated = True
    end
    object qyPlanosSN_PULAR_SABADOS: TSmallintField
      FieldName = 'SN_PULAR_SABADOS'
      Required = True
    end
    object qyPlanosSN_PULAR_DOMINGOS: TSmallintField
      FieldName = 'SN_PULAR_DOMINGOS'
      Required = True
    end
    object qyPlanosSN_PULAR_FERIADOS: TSmallintField
      FieldName = 'SN_PULAR_FERIADOS'
      Required = True
    end
    object qyPlanosDT_VIGENCIA_INICIO: TDateTimeField
      FieldName = 'DT_VIGENCIA_INICIO'
      DisplayFormat = 'dd/mm/yyyy'
      EditMask = '!99/99/0000;1;_'
    end
    object qyPlanosDT_VIGENCIA_FIM: TDateTimeField
      FieldName = 'DT_VIGENCIA_FIM'
      DisplayFormat = 'dd/mm/yyyy'
      EditMask = '!99/99/0000;1;_'
    end
    object qyPlanosSN_VIGENCIA: TSmallintField
      FieldName = 'SN_VIGENCIA'
      Required = True
    end
    object qyPlanoscd_acao_movimento_desc_cond: TLargeintField
      FieldName = 'cd_acao_movimento_desc_cond'
    end
    object qyPlanoscd_acao_movimento_desc_fixo: TLargeintField
      FieldName = 'cd_acao_movimento_desc_fixo'
    end
    object qyPlanosAcaoMovimentoDescCondicional: TStringField
      FieldKind = fkLookup
      FieldName = 'AcaoMovimentoDescCondicional'
      LookupDataSet = qyAcoesDescontoCondicional
      LookupKeyFields = 'cd_acao'
      LookupResultField = 'ds_acao'
      KeyFields = 'cd_acao_movimento_desc_cond'
      Size = 50
      Lookup = True
    end
    object qyPlanosAcaoMovimentoDescFixo: TStringField
      FieldKind = fkLookup
      FieldName = 'AcaoMovimentoDescFixo'
      LookupDataSet = qyAcoesDescontoFixo
      LookupKeyFields = 'cd_acao'
      LookupResultField = 'ds_acao'
      KeyFields = 'cd_acao_movimento_desc_fixo'
      Size = 50
      Lookup = True
    end
  end
  object dsPlanos: TDataSource
    DataSet = qyPlanos
    OnStateChange = dsPlanosStateChange
    OnDataChange = dsPlanosDataChange
    Left = 688
    Top = 224
  end
  object updPlanos: TZUpdateSQL
    DeleteSQL.Strings = (
      'DELETE FROM FIN_PLANOS WHERE CD_PLANO = :CD_PLANO')
    InsertSQL.Strings = (
      'INSERT FIN_PLANOS('
      
        '   CD_PLANO, CD_COLIGADA, DS_PLANO, NR_PARCELAS, NR_CREDITOS_BAS' +
        'E, VL_COBRADO,'
      
        '   VL_TAXAAPOSTILA, VL_DESCONTO, VL_MATRICULA, NR_DIAS_PARCELA_Z' +
        'ERO, DT_APARTIR,'
      
        '   DS_PARAGRAFO3, CD_TIPO_PLANO, SN_CREDITOS, NR_ANOSEMESTRE, DS' +
        '_DIAS_VENCTO,'
      
        '   SN_PULAR_SABADOS, SN_PULAR_DOMINGOS, SN_PULAR_FERIADOS, SN_DI' +
        'AS_UTEIS, DT_VIGENCIA_INICIO, DT_VIGENCIA_FIM, SN_VIGENCIA,'
      '   cd_acao_movimento_desc_cond, cd_acao_movimento_desc_fixo'
      ') VALUES ('
      
        '   NULL, :CD_COLIGADA, :DS_PLANO, :NR_PARCELAS, :NR_CREDITOS_BAS' +
        'E, :VL_COBRADO,'
      
        '   :VL_TAXAAPOSTILA, :VL_DESCONTO, :VL_MATRICULA, :NR_DIAS_PARCE' +
        'LA_ZERO, :DT_APARTIR,'
      
        '   :DS_PARAGRAFO3, :CD_TIPO_PLANO, :SN_CREDITOS, :NR_ANOSEMESTRE' +
        ', :DS_DIAS_VENCTO,'
      
        '   :SN_PULAR_SABADOS, :SN_PULAR_DOMINGOS, :SN_PULAR_FERIADOS, :S' +
        'N_DIAS_UTEIS, :DT_VIGENCIA_INICIO, :DT_VIGENCIA_FIM, :SN_VIGENCI' +
        'A,'
      '   :cd_acao_movimento_desc_cond, :cd_acao_movimento_desc_fixo'
      ')')
    ModifySQL.Strings = (
      'UPDATE FIN_PLANOS'
      'SET CD_COLIGADA = :CD_COLIGADA,'
      '    CD_TIPO_PLANO = :CD_TIPO_PLANO,'
      '    DS_PLANO = :DS_PLANO,'
      '    NR_ANOSEMESTRE = :NR_ANOSEMESTRE,'
      '    NR_PARCELAS = :NR_PARCELAS,'
      '    VL_COBRADO = :VL_COBRADO,'
      '    VL_CONTRATO = :VL_CONTRATO,'
      '    VL_TAXAMATERIAL = :VL_TAXAMATERIAL,'
      '    VL_TAXAAPOSTILA = :VL_TAXAAPOSTILA,'
      '    VL_DESCONTO = :VL_DESCONTO,'
      '    VL_MATRICULA = :VL_MATRICULA,'
      '    DT_APARTIR = :DT_APARTIR,'
      '    NR_TAXASMATERIAL = :NR_TAXASMATERIAL,'
      '    DS_PARAGRAFO3 = :DS_PARAGRAFO3,'
      '    NR_DIAS_PARCELA_ZERO = :NR_DIAS_PARCELA_ZERO,'
      '    SN_DIAS_UTEIS = :SN_DIAS_UTEIS,'
      '    SN_CREDITOS = :SN_CREDITOS,'
      '    NR_CREDITOS_BASE = :NR_CREDITOS_BASE,'
      '    NR_MAX_DISCIPLINAS = :NR_MAX_DISCIPLINAS,'
      '    DS_DIAS_VENCTO = :DS_DIAS_VENCTO,'
      '    SN_PULAR_SABADOS = :SN_PULAR_SABADOS,'
      '    SN_PULAR_DOMINGOS = :SN_PULAR_DOMINGOS,'
      '    SN_PULAR_FERIADOS = :SN_PULAR_FERIADOS,'
      '    DT_VIGENCIA_INICIO = :DT_VIGENCIA_INICIO, '
      '    DT_VIGENCIA_FIM = :DT_VIGENCIA_FIM,'
      '    SN_VIGENCIA = :SN_VIGENCIA,'
      '    cd_acao_movimento_desc_cond = :cd_acao_movimento_desc_cond,'
      '    cd_acao_movimento_desc_fixo = :cd_acao_movimento_desc_fixo'
      'WHERE CD_PLANO = :CD_PLANO')
    RefreshSQL.Strings = (
      '')
    UseSequenceFieldForRefreshSQL = False
    Left = 656
    Top = 256
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'CD_COLIGADA'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'CD_TIPO_PLANO'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'DS_PLANO'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'NR_ANOSEMESTRE'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'NR_PARCELAS'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'VL_COBRADO'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'VL_CONTRATO'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'VL_TAXAMATERIAL'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'VL_TAXAAPOSTILA'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'VL_DESCONTO'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'VL_MATRICULA'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'DT_APARTIR'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'NR_TAXASMATERIAL'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'DS_PARAGRAFO3'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'NR_DIAS_PARCELA_ZERO'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'SN_DIAS_UTEIS'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'SN_CREDITOS'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'NR_CREDITOS_BASE'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'NR_MAX_DISCIPLINAS'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'DS_DIAS_VENCTO'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'SN_PULAR_SABADOS'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'SN_PULAR_DOMINGOS'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'SN_PULAR_FERIADOS'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'DT_VIGENCIA_INICIO'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'DT_VIGENCIA_FIM'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'SN_VIGENCIA'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'cd_acao_movimento_desc_cond'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'cd_acao_movimento_desc_fixo'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'CD_PLANO'
        ParamType = ptUnknown
      end>
  end
  object qyPlanosItens: TUMZQuery
    Connection = DM.db
    UpdateObject = updPlanosItens
    BeforePost = qyPlanosItensBeforePost
    BeforeDelete = qyPlanosItensBeforeDelete
    SQL.Strings = (
      'SELECT'
      '   CD_PLANO_ITEM,'
      '   CD_PLANO,'
      '   NR_PARCELA,'
      '   VL_BRUTO,'
      '   VL_DESCONTO,'
      '   VL_EXTRA,'
      '   VL_DESCONTO_EXTRA,'
      '   VL_TOTAL,'
      '   NR_DIA,'
      '   NR_MES,'
      '   NR_ANO,'
      '   NR_CREDITOS_MINIMOS,'
      '   SN_CREDITO_PARCELA,'
      '   CD_TIPO_PARCELA,'
      '   SN_DIVISIVEL,'
      '   CASE SN_CREDITO_PARCELA'
      '      WHEN 1 THEN '#39'S'#39
      '      WHEN 2 THEN '#39'F'#39
      '      WHEN 0 THEN '#39'N'#39
      '      ELSE '#39'N'#39
      '   END DS_CREDITO_PARCELA,'
      '   CASE SN_DIVISIVEL'
      '      WHEN 1 THEN '#39'S'#39
      '      ELSE '#39'N'#39
      '   END DS_DIVISIVEL'
      'FROM'
      '   FIN_PLANOS_ITENS'
      'WHERE'
      '   CD_PLANO = :CD_PLANO')
    Params = <
      item
        DataType = ftUnknown
        Name = 'CD_PLANO'
        ParamType = ptUnknown
      end>
    Left = 784
    Top = 360
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'CD_PLANO'
        ParamType = ptUnknown
      end>
    object qyPlanosItensCD_PLANO_ITEM: TIntegerField
      FieldName = 'CD_PLANO_ITEM'
    end
    object qyPlanosItensCD_PLANO: TIntegerField
      FieldName = 'CD_PLANO'
      Required = True
    end
    object qyPlanosItensNR_PARCELA: TSmallintField
      FieldName = 'NR_PARCELA'
      Required = True
    end
    object qyPlanosItensVL_BRUTO: TFloatField
      FieldName = 'VL_BRUTO'
      DisplayFormat = '###,###,##0.000'
    end
    object qyPlanosItensVL_DESCONTO: TFloatField
      FieldName = 'VL_DESCONTO'
      DisplayFormat = '###,###,##0.000'
    end
    object qyPlanosItensVL_EXTRA: TFloatField
      FieldName = 'VL_EXTRA'
      DisplayFormat = '###,###,##0.000'
    end
    object qyPlanosItensVL_DESCONTO_EXTRA: TFloatField
      FieldName = 'VL_DESCONTO_EXTRA'
      DisplayFormat = '###,###,##0.000'
    end
    object qyPlanosItensVL_TOTAL: TFloatField
      FieldName = 'VL_TOTAL'
      DisplayFormat = '###,###,##0.000'
    end
    object qyPlanosItensNR_DIA: TSmallintField
      FieldName = 'NR_DIA'
      Required = True
    end
    object qyPlanosItensNR_MES: TIntegerField
      FieldName = 'NR_MES'
      Required = True
    end
    object qyPlanosItensNR_ANO: TSmallintField
      FieldName = 'NR_ANO'
      Required = True
    end
    object qyPlanosItensNR_CREDITOS_MINIMOS: TFloatField
      FieldName = 'NR_CREDITOS_MINIMOS'
    end
    object qyPlanosItensSN_CREDITO_PARCELA: TSmallintField
      FieldName = 'SN_CREDITO_PARCELA'
      Required = True
    end
    object qyPlanosItensCD_TIPO_PARCELA: TIntegerField
      FieldName = 'CD_TIPO_PARCELA'
      Required = True
    end
    object qyPlanosItensDS_TIPO_TITULO: TStringField
      FieldKind = fkLookup
      FieldName = 'DS_TIPO_TITULO'
      LookupDataSet = qyTiposTitulo
      LookupKeyFields = 'cd_tipo_titulo'
      LookupResultField = 'ds_tipo_titulo'
      KeyFields = 'CD_TIPO_PARCELA'
      Lookup = True
    end
    object qyPlanosItensSN_DIVISIVEL: TSmallintField
      FieldName = 'SN_DIVISIVEL'
      Required = True
    end
    object qyPlanosItensDS_CREDITO_PARCELA: TStringField
      FieldName = 'DS_CREDITO_PARCELA'
      OnSetText = qyPlanosItensDS_CREDITO_PARCELASetText
      Size = 1
    end
    object qyPlanosItensDS_DIVISIVEL: TStringField
      FieldName = 'DS_DIVISIVEL'
      OnSetText = qyPlanosItensDS_DIVISIVELSetText
      Size = 1
    end
  end
  object dsPlanosItens: TDataSource
    DataSet = qyPlanosItens
    Left = 784
    Top = 392
  end
  object updPlanosItens: TZUpdateSQL
    DeleteSQL.Strings = (
      'DELETE FROM fin_planos_itens'
      'WHERE'
      '    CD_PLANO_ITEM = :cd_plano_item')
    InsertSQL.Strings = (
      'INSERT INTO FIN_PLANOS_ITENS ('
      
        '        CD_PLANO_ITEM, CD_PLANO, NR_PARCELA, VL_BRUTO, VL_DESCON' +
        'TO, VL_EXTRA,'
      
        '        VL_DESCONTO_EXTRA, VL_TOTAL, NR_DIA, NR_MES, NR_ANO, NR_' +
        'CREDITOS_MINIMOS,'
      '        SN_CREDITO_PARCELA, CD_TIPO_PARCELA, SN_DIVISIVEL'
      ') VALUES ('
      
        '        NULL, :CD_PLANO, :NR_PARCELA, :VL_BRUTO, :VL_DESCONTO, :' +
        'VL_EXTRA,'
      
        '        :VL_DESCONTO_EXTRA, :VL_TOTAL, :NR_DIA, :NR_MES, :NR_ANO' +
        ', :NR_CREDITOS_MINIMOS,'
      '        :SN_CREDITO_PARCELA, :CD_TIPO_PARCELA, :SN_DIVISIVEL'
      ')')
    ModifySQL.Strings = (
      'UPDATE'
      '   FIN_PLANOS_ITENS'
      'SET'
      '   NR_PARCELA = :NR_PARCELA,'
      '   VL_BRUTO = :VL_BRUTO,'
      '   VL_DESCONTO = :VL_DESCONTO,'
      '   VL_EXTRA = :VL_EXTRA,'
      '   VL_DESCONTO_EXTRA = :VL_DESCONTO_EXTRA,'
      '   VL_TOTAL = :VL_TOTAL,'
      '   NR_DIA = :NR_DIA,'
      '   NR_MES = :NR_MES,'
      '   NR_ANO = :NR_ANO,'
      '   NR_CREDITOS_MINIMOS = :NR_CREDITOS_MINIMOS,'
      '   SN_CREDITO_PARCELA = :SN_CREDITO_PARCELA,'
      '   CD_TIPO_PARCELA = :CD_TIPO_PARCELA,'
      '   SN_DIVISIVEL = :SN_DIVISIVEL'
      'WHERE'
      '    CD_PLANO_ITEM = :CD_PLANO_ITEM')
    UseSequenceFieldForRefreshSQL = False
    Left = 784
    Top = 424
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'NR_PARCELA'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'VL_BRUTO'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'VL_DESCONTO'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'VL_EXTRA'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'VL_DESCONTO_EXTRA'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'VL_TOTAL'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'NR_DIA'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'NR_MES'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'NR_ANO'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'NR_CREDITOS_MINIMOS'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'SN_CREDITO_PARCELA'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'CD_TIPO_PARCELA'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'SN_DIVISIVEL'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'CD_PLANO_ITEM'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'CD_PLANO'
        ParamType = ptUnknown
      end>
  end
  object qyTiposTitulo: TUMZReadOnlyQuery
    Connection = DM.db
    AfterOpen = qyTiposTituloAfterOpen
    SQL.Strings = (
      'SELECT'
      '   cd_tipo_titulo, ds_tipo_titulo'
      'FROM'
      '   fin_config_tipos_titulo'
      'WHERE'
      '   cd_coligada_matriz = :cd_coligada'
      '   and sn_ativo = 1'
      'ORDER BY'
      '   ds_tipo_titulo')
    Params = <
      item
        DataType = ftUnknown
        Name = 'cd_coligada'
        ParamType = ptUnknown
      end>
    Left = 784
    Top = 456
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'cd_coligada'
        ParamType = ptUnknown
      end>
    object qyTiposTitulocd_tipo_titulo: TIntegerField
      FieldName = 'cd_tipo_titulo'
      Required = True
    end
    object qyTiposTitulods_tipo_titulo: TStringField
      FieldName = 'ds_tipo_titulo'
      Size = 255
    end
  end
  object ImageList2: TImageList
    Left = 568
    Top = 104
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
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000009C9C9C009C9C9C009C9C
      9C009C9C9C009C9C9C009C9C9C009C9C9C000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000009C9C9C00000000000000
      00000000000000000000000000009C9C9C000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000FFFFFF00000000000000000000000000000000003163
      9C0031639C000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000009C9C9C00000000000000
      00000000000000000000000000009C9C9C000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000FFFFFF0000000000000000000000000000000000000000000000
      000000000000FFFFFF0000000000000000000052630031639C0031639C003163
      9C0031639C000000000000526300005263000052630000526300005263000052
      630000000000000000000000000000000000000000009C9C9C00000000000000
      00000000000000000000000000009C9C9C000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000FFFFFF0000000000000000000000000000000000000000000000
      000000000000FFFFFF00000000000000000000526300316B9C00316B9C003163
      9C0031639C000000000000CEFF0000CEFF0000CEFF0000000000000000000000
      000000000000000000000000000000000000000000009C9C9C00000000000000
      00000000000000000000000000009C9C9C00000000009C9C9C009C9C9C009C9C
      9C009C9C9C009C9C9C009C9C9C009C9C9C000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000FFFFFF00000000000000000000000000000000000000
      0000FFFFFF0000000000000000000000000000526300296BA500296BA500296B
      9C00296B9C000000000000CEFF0000CEFF0000CEFF000000000000000000FF00
      000000000000000000000000000000000000000000009C9C9C00000000000000
      00000000000000000000000000009C9C9C00000000009C9C9C00000000000000
      00000000000000000000000000009C9C9C000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000FFFFFF00000000000000000000000000FFFF
      FF0000000000000000000000000000000000005263002173AD002173A5002173
      A5002973A5000000000010CEFF0000CEFF0000CEFF0000000000FF000000FF00
      000000000000000000000000000000000000000000009C9C9C009C9C9C009C9C
      9C009C9C9C009C9C9C009C9C9C009C9C9C00000000009C9C9C00000000000000
      00000000000000000000000000009C9C9C000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000FFFFFF000000
      00000000000000000000000000000000000000526300187BAD00187BAD00FFFF
      FF002173AD000000000031D6FF0029D6FF0018D6FF00FF000000FF000000FF00
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000009C9C9C00000000000000
      00000000000000000000000000009C9C9C000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000FFFFFF00000000000000
      000000000000000000000000000000000000005263001084B5001884B5001884
      B500187BB5000000000063DEFF0052DEFF00FF000000FF000000FF000000FF00
      0000FF000000FF000000FF000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000009C9C9C00000000000000
      00000000000000000000000000009C9C9C000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000FFFFFF000000
      00000000000000000000000000000000000000526300088CBD00108CBD001084
      BD001084B500000000008CE7FF00FF000000FF000000FF000000FF000000FF00
      0000FF000000FF000000FF00000000000000000000009C9C9C009C9C9C009C9C
      9C009C9C9C009C9C9C009C9C9C009C9C9C00000000009C9C9C00000000000000
      00000000000000000000000000009C9C9C000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000FFFFFF000000000000000000000000000000
      000000000000000000000000000000000000005263000894C600088CC600088C
      C600088CBD0000000000B5EFFF00A5EFFF00FF000000FF000000FF000000FF00
      0000FF000000FF000000FF00000000000000000000009C9C9C00000000000000
      00000000000000000000000000009C9C9C00000000009C9C9C009C9C9C009C9C
      9C009C9C9C009C9C9C009C9C9C009C9C9C000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000FFFFFF00000000000000000000000000000000000000
      000000000000000000000000000000000000005263000094CE000094CE000094
      C6000094C60000000000DEF7FF00CEF7FF00C6EFFF00FF000000FF000000FF00
      000000000000000000000000000000000000000000009C9C9C00000000000000
      00000000000000000000000000009C9C9C000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000FFFFFF0000000000000000000000000000000000000000000000
      000000000000FFFFFF00000000000000000000526300009CCE00009CCE00009C
      CE000094CE0000000000FFFFFF00F7F7FF00E7F7FF0000000000FF000000FF00
      000000000000000000000000000000000000000000009C9C9C00000000000000
      00000000000000000000000000009C9C9C000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000000000FFFF
      FF00000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000526300009CCE00009CCE00009C
      CE00009CCE0000000000FFFFFF00FFFFFF00FFFFFF000000000000000000FF00
      000000000000000000000000000000000000000000009C9C9C00000000000000
      00000000000000000000000000009C9C9C000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000052630000526300009C
      CE00009CCE000000000000526300005263000052630000526300000000000000
      000000000000000000000000000000000000000000009C9C9C00000000000000
      00000000000000000000000000009C9C9C000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000052
      6300005263000052630000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000009C9C9C009C9C9C009C9C
      9C009C9C9C009C9C9C009C9C9C009C9C9C000000000000000000000000000000
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
      00000000000000000000000000000000FFFFFFFFFFFF80FFFFFFFFF9E3FFBEFF
      FFFFFFF983FFB6FFFFFFE3F3000FAAFFFC7FE3F3003FBC80FD7FE1C7002FBEBE
      FD7FF08F000F80B6E10FF81F000FFFAAEFEFFC3F0001FFBCE10FF81F000180BE
      FD7FF09F0001BE80FD7FE1C7000FB6FFFC7F83E3000FAAFFFFFF8FF1002FBCFF
      FFFFFFFF803FBEFFFFFFFFFFE3FF80FF00000000000000000000000000000000
      FFFFFFFFFFFF}
  end
  object qyPlanosTurmas: TUMZQuery
    Connection = DM.db
    SQL.Strings = (
      'SELECT'
      '   fpt.CD_CURSO, fpt.CD_TURMA, t.descricao AS DS_TURMA'
      'FROM'
      '   fin_planos fp'
      
        '   INNER JOIN fin_planos_turmas fpt ON ( fpt.CD_PLANO = fp.CD_PL' +
        'ANO )'
      
        '   INNER JOIN turmas t ON ( t.codigo = fpt.CD_TURMA AND t.anosem' +
        'estre = fp.NR_ANOSEMESTRE)'
      'WHERE'
      '   fp.CD_PLANO = :CD_PLANO')
    Params = <
      item
        DataType = ftUnknown
        Name = 'CD_PLANO'
        ParamType = ptUnknown
      end>
    Left = 840
    Top = 360
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'CD_PLANO'
        ParamType = ptUnknown
      end>
    object qyPlanosTurmasCD_CURSO: TStringField
      FieldName = 'CD_CURSO'
      Required = True
      Size = 15
    end
    object qyPlanosTurmasCD_TURMA: TStringField
      FieldName = 'CD_TURMA'
      Required = True
      Size = 50
    end
    object qyPlanosTurmasDS_TURMA: TStringField
      FieldName = 'DS_TURMA'
      Size = 255
    end
  end
  object dsPlanosTurmas: TDataSource
    DataSet = qyPlanosTurmas
    Left = 840
    Top = 392
  end
  object qyPlanosDistratos: TUMZQuery
    Connection = DM.db
    AfterOpen = qyPlanosDistratosAfterOpen
    BeforePost = qyPlanosDistratosBeforePost
    SQL.Strings = (
      'SELECT'
      #9'*'
      'FROM'
      #9'FIN_PLANOS_DISTRATOS'
      'WHERE'
      #9'CD_PLANO = :CD_PLANO')
    Params = <
      item
        DataType = ftUnknown
        Name = 'CD_PLANO'
        ParamType = ptUnknown
      end>
    Left = 888
    Top = 360
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'CD_PLANO'
        ParamType = ptUnknown
      end>
    object qyPlanosDistratosCD_DISTRATO: TIntegerField
      FieldName = 'CD_DISTRATO'
      Required = True
    end
    object qyPlanosDistratosCD_PLANO: TIntegerField
      FieldName = 'CD_PLANO'
      Required = True
    end
    object qyPlanosDistratosVL_COBRANCA: TFloatField
      FieldName = 'VL_COBRANCA'
    end
    object qyPlanosDistratosSN_ATIVO: TSmallintField
      FieldName = 'SN_ATIVO'
      Required = True
    end
    object qyPlanosDistratosCD_TIPO_VALOR: TSmallintField
      FieldName = 'CD_TIPO_VALOR'
      Required = True
    end
    object qyPlanosDistratosNR_DIAS_VENCIMENTO: TSmallintField
      FieldName = 'NR_DIAS_VENCIMENTO'
      Required = True
    end
    object qyPlanosDistratosCD_TIPO_TITULO: TIntegerField
      FieldName = 'CD_TIPO_TITULO'
      Required = True
    end
    object qyPlanosDistratosDS_TIPO_TITULO: TStringField
      FieldKind = fkLookup
      FieldName = 'DS_TIPO_TITULO'
      LookupDataSet = qyTiposTitulo
      LookupKeyFields = 'cd_tipo_titulo'
      LookupResultField = 'ds_tipo_titulo'
      KeyFields = 'CD_TIPO_TITULO'
      Lookup = True
    end
    object qyPlanosDistratosSN_TIPO_PARCELA: TSmallintField
      FieldName = 'SN_TIPO_PARCELA'
      Required = True
    end
  end
  object dsPlanosDistratos: TDataSource
    DataSet = qyPlanosDistratos
    OnStateChange = dsPlanosDistratosStateChange
    Left = 888
    Top = 392
  end
  object qyAcoesDescontoCondicional: TUMZQuery
    Connection = DM.db
    SQL.Strings = (
      'SELECT'
      '  cd_acao,'
      '  ds_acao'
      'FROM'
      '  fin_acoes_movimento'
      'WHERE'
      '  sn_ativo = '#39'S'#39' AND'
      '  cd_tipo_acao = 3'
      'ORDER BY'
      '  ds_acao')
    Params = <>
    Left = 656
    Top = 184
    object qyAcoesDescontoCondicionalcd_acao: TLargeintField
      FieldName = 'cd_acao'
    end
    object qyAcoesDescontoCondicionalds_acao: TStringField
      FieldName = 'ds_acao'
      Size = 255
    end
  end
  object qyAcoesDescontoFixo: TUMZQuery
    Connection = DM.db
    SQL.Strings = (
      'SELECT'
      '  cd_acao,'
      '  ds_acao'
      'FROM'
      '  fin_acoes_movimento'
      'WHERE'
      '  sn_ativo = '#39'S'#39' AND'
      '  cd_tipo_acao = 3'
      'ORDER BY'
      '  ds_acao')
    Params = <>
    Left = 688
    Top = 184
    object LargeintField1: TLargeintField
      FieldName = 'cd_acao'
    end
    object StringField1: TStringField
      FieldName = 'ds_acao'
      Size = 255
    end
  end
end
