object frmFinanciamentoEstudantil: TfrmFinanciamentoEstudantil
  Left = 0
  Top = 0
  BorderIcons = [biSystemMenu, biMinimize]
  BorderStyle = bsSingle
  Caption = 'Financiamento Estudantil'
  ClientHeight = 544
  ClientWidth = 504
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  FormStyle = fsStayOnTop
  KeyPreview = True
  OldCreateOrder = False
  Position = poScreenCenter
  Visible = True
  OnClose = FormClose
  OnKeyDown = FormKeyDown
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object pgFinanciamento: TPageControl
    Left = 0
    Top = 25
    Width = 504
    Height = 494
    ActivePage = tsTiposBolsa
    Align = alClient
    Style = tsFlatButtons
    TabOrder = 0
    OnChange = pgFinanciamentoChange
    ExplicitWidth = 505
    ExplicitHeight = 511
    object tsTiposBolsa: TTabSheet
      Caption = 'TIPOS DE BOLSA'
      ExplicitWidth = 497
      ExplicitHeight = 480
      object GroupBox1: TGroupBox
        Left = 0
        Top = 65
        Width = 496
        Height = 168
        Align = alClient
        Caption = 'Tipo de bolsa/financiamento estudantil reembols'#225'vel'
        Enabled = False
        TabOrder = 0
        ExplicitWidth = 497
        object dbcbReFies: TDBCheckBox
          Left = 326
          Top = 22
          Width = 49
          Height = 17
          Alignment = taLeftJustify
          Caption = 'FIES'
          DataField = 'sn_re_fies'
          DataSource = dsPessoa
          TabOrder = 0
          ValueChecked = '1'
          ValueUnchecked = '0'
        end
        object dbcbReGovernoEstadual: TDBCheckBox
          Left = 114
          Top = 45
          Width = 261
          Height = 17
          Alignment = taLeftJustify
          Caption = 'Programa de financiamento do Governo Estadual'
          DataField = 'sn_re_governo_estadual'
          DataSource = dsPessoa
          TabOrder = 1
          ValueChecked = '1'
          ValueUnchecked = '0'
        end
        object dbcbReGovernoMunicipal: TDBCheckBox
          Left = 112
          Top = 68
          Width = 263
          Height = 17
          Alignment = taLeftJustify
          Caption = 'Programa de financiamento do Governo Municipal'
          DataField = 'sn_re_governo_municipal'
          DataSource = dsPessoa
          TabOrder = 2
          ValueChecked = '1'
          ValueUnchecked = '0'
        end
        object dbcbReIes: TDBCheckBox
          Left = 184
          Top = 91
          Width = 191
          Height = 17
          Alignment = taLeftJustify
          Caption = 'Programa de financiamento da IES'
          DataField = 'sn_re_ies'
          DataSource = dsPessoa
          TabOrder = 3
          ValueChecked = '1'
          ValueUnchecked = '0'
        end
        object dbcbReEntidadesExternas: TDBCheckBox
          Left = 107
          Top = 114
          Width = 268
          Height = 17
          Alignment = taLeftJustify
          Caption = 'Programa de financiamento de entidades externas'
          DataField = 'sn_re_entidades_externas'
          DataSource = dsPessoa
          TabOrder = 4
          ValueChecked = '1'
          ValueUnchecked = '0'
        end
        object dbcbReOutros: TDBCheckBox
          Left = 316
          Top = 137
          Width = 59
          Height = 17
          Alignment = taLeftJustify
          Caption = 'Outros'
          DataField = 'sn_re_outros'
          DataSource = dsPessoa
          TabOrder = 5
          ValueChecked = '1'
          ValueUnchecked = '0'
        end
      end
      object GroupBox2: TGroupBox
        Left = 0
        Top = 233
        Width = 496
        Height = 230
        Align = alBottom
        Caption = 'Tipo de bolsa/financiamento estudantil n'#227'o reembols'#225'vel'
        Enabled = False
        TabOrder = 1
        ExplicitTop = 250
        ExplicitWidth = 497
        object dbcbNreProUniIntegral: TDBCheckBox
          Left = 276
          Top = 22
          Width = 101
          Height = 17
          Alignment = taLeftJustify
          Caption = 'ProUNI Integral'
          DataField = 'sn_nre_prouni_integral'
          DataSource = dsPessoa
          TabOrder = 0
          ValueChecked = '1'
          ValueUnchecked = '0'
        end
        object dbcbNreProUniParcial: TDBCheckBox
          Left = 283
          Top = 45
          Width = 94
          Height = 17
          Alignment = taLeftJustify
          Caption = 'ProUNI Parcial'
          DataField = 'sn_nre_prouni_parcial'
          DataSource = dsPessoa
          TabOrder = 1
          ValueChecked = '1'
          ValueUnchecked = '0'
        end
        object dbcbNreIes: TDBCheckBox
          Left = 187
          Top = 68
          Width = 190
          Height = 17
          Alignment = taLeftJustify
          Caption = 'Programa de financiamento da IES'
          DataField = 'sn_nre_ies'
          DataSource = dsPessoa
          TabOrder = 2
          ValueChecked = '1'
          ValueUnchecked = '0'
        end
        object dbcbNreGovernoEstadual: TDBCheckBox
          Left = 117
          Top = 91
          Width = 260
          Height = 17
          Alignment = taLeftJustify
          Caption = 'Programa de financiamento do Governo Estadual'
          DataField = 'sn_nre_governo_estadual'
          DataSource = dsPessoa
          TabOrder = 3
          ValueChecked = '1'
          ValueUnchecked = '0'
        end
        object dbcbNreGovernoMunicipal: TDBCheckBox
          Left = 115
          Top = 114
          Width = 262
          Height = 17
          Alignment = taLeftJustify
          Caption = 'Programa de financiamento do Governo Municipal'
          DataField = 'sn_nre_governo_municipal'
          DataSource = dsPessoa
          TabOrder = 4
          ValueChecked = '1'
          ValueUnchecked = '0'
        end
        object dbcbNreEntidadesExternas: TDBCheckBox
          Left = 109
          Top = 137
          Width = 268
          Height = 17
          Alignment = taLeftJustify
          Caption = 'Programa de financiamento de entidades externas'
          DataField = 'sn_nre_entidades_externas'
          DataSource = dsPessoa
          TabOrder = 5
          ValueChecked = '1'
          ValueUnchecked = '0'
        end
        object dbcbNreOutros: TDBCheckBox
          Left = 318
          Top = 206
          Width = 59
          Height = 17
          Alignment = taLeftJustify
          Caption = 'Outros'
          DataField = 'sn_nre_outros'
          DataSource = dsPessoa
          TabOrder = 6
          ValueChecked = '1'
          ValueUnchecked = '0'
        end
        object DBCheckBox1: TDBCheckBox
          Left = 9
          Top = 160
          Width = 368
          Height = 17
          Alignment = taLeftJustify
          Caption = 
            'Plano Nacional de Forma'#231#227'o de Professores da Educa'#231#227'o B'#225'sica PAR' +
            'FOR'
          DataField = 'sn_parfor'
          DataSource = dsPessoa
          TabOrder = 7
          ValueChecked = '1'
          ValueUnchecked = '0'
        end
        object DBCheckBox3: TDBCheckBox
          Left = 168
          Top = 183
          Width = 209
          Height = 17
          Alignment = taLeftJustify
          Caption = 'Bolsa do governo federal EDUCA+Brasil '
          DataField = 'sn_bolsa_educa_mais_brasil'
          DataSource = dsPessoa
          TabOrder = 8
          ValueChecked = '1'
          ValueUnchecked = '0'
        end
      end
      object pnFiltro: TPanel
        Left = 0
        Top = 0
        Width = 496
        Height = 33
        Align = alTop
        BevelOuter = bvNone
        TabOrder = 2
        ExplicitWidth = 497
        object Label2: TLabel
          Left = 4
          Top = 11
          Width = 57
          Height = 13
          Caption = 'Ano/Censo:'
        end
        object Label1: TLabel
          Left = 288
          Top = 10
          Width = 32
          Height = 13
          Caption = 'Curso:'
        end
        object dbnAnos: TDBNavigator
          Left = 134
          Top = 6
          Width = 144
          Height = 21
          DataSource = dsPessoa
          VisibleButtons = [nbPrior, nbNext, nbInsert, nbDelete, nbPost, nbCancel]
          Flat = True
          Hints.Strings = (
            'registro'
            'Registro anterior'
            'Pr'#243'ximo registro'
            'registro'
            'Incluir um registro'
            'Excluir este registro'
            'registro'
            'Confirmar Altera'#231#245'es'
            'Cancelar Altera'#231#245'es')
          ParentShowHint = False
          ConfirmDelete = False
          ShowHint = True
          TabOrder = 0
          BeforeAction = dbnAnosBeforeAction
        end
        object dbAnoCenso: TDBEdit
          Left = 71
          Top = 6
          Width = 57
          Height = 21
          DataField = 'nr_ano_censo'
          DataSource = dsPessoa
          TabOrder = 1
        end
        object cbCategoria: TUMLookupComboBox
          Left = 326
          Top = 6
          Width = 165
          Height = 21
          DataField = 'ds_curso'
          DataSource = dsPessoa
          TabOrder = 2
        end
      end
      object pnCopia: TPanel
        Left = 0
        Top = 33
        Width = 496
        Height = 32
        Align = alTop
        BevelOuter = bvNone
        TabOrder = 3
        ExplicitWidth = 497
        object Label3: TLabel
          Left = 5
          Top = 9
          Width = 144
          Height = 13
          Caption = 'Copiar de outro ano/semestre'
        end
        object btnCopiar: TSpeedButton
          Left = 160
          Top = 3
          Width = 121
          Height = 26
          Caption = 'Copiar'
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
          OnClick = btnCopiarClick
        end
      end
    end
    object tsTiposAtividade: TTabSheet
      Caption = 'TIPOS DE ATIVIDADE'
      ImageIndex = 1
      ExplicitWidth = 497
      ExplicitHeight = 480
      object GroupBox3: TGroupBox
        Left = 0
        Top = 276
        Width = 496
        Height = 187
        Align = alBottom
        Caption = 'Tipos de atividade de forma'#231#227'o complementar'
        Enabled = False
        TabOrder = 0
        ExplicitTop = 293
        ExplicitWidth = 497
        object dbcbAtPesquisa: TDBCheckBox
          Left = 168
          Top = 29
          Width = 69
          Height = 17
          Alignment = taLeftJustify
          Caption = 'Pesquisa'
          DataField = 'sn_at_pesquisa'
          DataSource = dsPessoa
          TabOrder = 0
          ValueChecked = '1'
          ValueUnchecked = '0'
          OnClick = dbcbAtPesquisaClick
        end
        object dbcbAtExtensao: TDBCheckBox
          Left = 165
          Top = 68
          Width = 72
          Height = 17
          Alignment = taLeftJustify
          Caption = 'Extens'#227'o'
          DataField = 'sn_at_extensao'
          DataSource = dsPessoa
          TabOrder = 1
          ValueChecked = '1'
          ValueUnchecked = '0'
          OnClick = dbcbAtExtensaoClick
        end
        object dbcbAtMonitoria: TDBCheckBox
          Left = 166
          Top = 107
          Width = 71
          Height = 17
          Alignment = taLeftJustify
          Caption = 'Monitoria'
          DataField = 'sn_at_monitoria'
          DataSource = dsPessoa
          TabOrder = 2
          ValueChecked = '1'
          ValueUnchecked = '0'
          OnClick = dbcbAtMonitoriaClick
        end
        object dbcbAtExtraCurricular: TDBCheckBox
          Left = 13
          Top = 146
          Width = 224
          Height = 17
          Alignment = taLeftJustify
          Caption = 'Est'#225'gio n'#227'o obrigat'#243'rio (Extra Curricular)'
          DataField = 'sn_at_extracurricular'
          DataSource = dsPessoa
          TabOrder = 3
          ValueChecked = '1'
          ValueUnchecked = '0'
          OnClick = dbcbAtExtraCurricularClick
        end
        object dbrgPesquisa: TDBRadioGroup
          Left = 257
          Top = 21
          Width = 185
          Height = 33
          Caption = 'Possui Bolsa/remunera'#231#227'o'
          Columns = 2
          DataField = 'sn_at_re_pesquisa'
          DataSource = dsPessoa
          Enabled = False
          Items.Strings = (
            'Sim'
            'N'#227'o')
          ParentBackground = True
          TabOrder = 4
          Values.Strings = (
            '1'
            '0')
          Visible = False
        end
        object dbrgExtensao: TDBRadioGroup
          Left = 257
          Top = 60
          Width = 185
          Height = 33
          Caption = 'Possui Bolsa/remunera'#231#227'o'
          Columns = 2
          DataField = 'sn_at_re_extensao'
          DataSource = dsPessoa
          Enabled = False
          Items.Strings = (
            'Sim'
            'N'#227'o')
          ParentBackground = True
          TabOrder = 5
          Values.Strings = (
            '1'
            '0')
          Visible = False
        end
        object dbrgMonitoria: TDBRadioGroup
          Left = 257
          Top = 99
          Width = 185
          Height = 33
          Caption = 'Possui Bolsa/remunera'#231#227'o'
          Columns = 2
          DataField = 'sn_at_re_monitoria'
          DataSource = dsPessoa
          Enabled = False
          Items.Strings = (
            'Sim'
            'N'#227'o')
          ParentBackground = True
          TabOrder = 6
          Values.Strings = (
            '1'
            '0')
          Visible = False
        end
        object dbrgExtraCurricular: TDBRadioGroup
          Left = 257
          Top = 138
          Width = 185
          Height = 33
          Caption = 'Possui Bolsa/remunera'#231#227'o'
          Columns = 2
          DataField = 'sn_at_re_extracurricular'
          DataSource = dsPessoa
          Enabled = False
          Items.Strings = (
            'Sim'
            'N'#227'o')
          ParentBackground = True
          TabOrder = 7
          Values.Strings = (
            '1'
            '0')
          Visible = False
        end
      end
      object gbTipoSocial: TGroupBox
        Left = 0
        Top = 0
        Width = 496
        Height = 276
        Align = alClient
        Caption = 'Tipo de apoio social'
        Enabled = False
        TabOrder = 1
        ExplicitWidth = 497
        ExplicitHeight = 293
        object dbcbAlimentacao: TDBCheckBox
          Left = 13
          Top = 24
          Width = 97
          Height = 17
          BiDiMode = bdLeftToRight
          Caption = 'Alimenta'#231#227'o'
          DataField = 'sn_as_alimentacao'
          DataSource = dsPessoa
          ParentBiDiMode = False
          TabOrder = 0
          ValueChecked = '1'
          ValueUnchecked = '0'
        end
        object dbcbMoradia: TDBCheckBox
          Left = 13
          Top = 47
          Width = 97
          Height = 17
          BiDiMode = bdLeftToRight
          Caption = 'Moradia'
          DataField = 'sn_as_moradia'
          DataSource = dsPessoa
          ParentBiDiMode = False
          TabOrder = 1
          ValueChecked = '1'
          ValueUnchecked = '0'
        end
        object dbcbTransporte: TDBCheckBox
          Left = 13
          Top = 70
          Width = 97
          Height = 17
          BiDiMode = bdLeftToRight
          Caption = 'Transporte'
          DataField = 'sn_as_transporte'
          DataSource = dsPessoa
          ParentBiDiMode = False
          TabOrder = 2
          ValueChecked = '1'
          ValueUnchecked = '0'
        end
        object dbcbMatDidatico: TDBCheckBox
          Left = 13
          Top = 93
          Width = 97
          Height = 17
          BiDiMode = bdLeftToRight
          Caption = 'Material did'#225'tico'
          DataField = 'sn_as_mat_didatico'
          DataSource = dsPessoa
          ParentBiDiMode = False
          TabOrder = 3
          ValueChecked = '1'
          ValueUnchecked = '0'
        end
        object dbcbBolsaTrab: TDBCheckBox
          Left = 13
          Top = 116
          Width = 97
          Height = 17
          BiDiMode = bdLeftToRight
          Caption = 'Bolsa trabalho'
          DataField = 'sn_as_bolsa_trabalho'
          DataSource = dsPessoa
          ParentBiDiMode = False
          TabOrder = 4
          ValueChecked = '1'
          ValueUnchecked = '0'
        end
        object dbcbBolsaPerm: TDBCheckBox
          Left = 13
          Top = 139
          Width = 121
          Height = 17
          BiDiMode = bdLeftToRight
          Caption = 'Bolsa perman'#234'ncia'
          DataField = 'sn_as_bolsa_permanencia'
          DataSource = dsPessoa
          ParentBiDiMode = False
          TabOrder = 5
          ValueChecked = '1'
          ValueUnchecked = '0'
        end
        object dbcbAtivFormacao: TDBCheckBox
          Left = 13
          Top = 162
          Width = 209
          Height = 17
          Caption = 'Atividade de forma'#231#227'o complementar'
          DataField = 'sn_at_complementar'
          DataSource = dsPessoa
          TabOrder = 6
          ValueChecked = '1'
          ValueUnchecked = '0'
          OnClick = dbcbAtivFormacaoClick
        end
      end
    end
  end
  object toolFinanciamento: TToolBar
    Left = 0
    Top = 519
    Width = 504
    Height = 25
    Align = alBottom
    ButtonWidth = 84
    Caption = 'toolFinanciamento'
    EdgeBorders = [ebTop, ebBottom]
    Images = ImageList1
    List = True
    ShowCaptions = True
    TabOrder = 1
    ExplicitTop = 536
    ExplicitWidth = 505
    object ToolButton1: TToolButton
      Left = 0
      Top = 0
      Width = 8
      Caption = 'ToolButton1'
      Style = tbsSeparator
    end
    object btSalvar: TToolButton
      Left = 8
      Top = 0
      AutoSize = True
      Caption = 'F5 Salvar'
      Enabled = False
      ImageIndex = 0
      OnClick = btSalvarClick
    end
    object btCancelar: TToolButton
      Left = 84
      Top = 0
      AutoSize = True
      Caption = 'F6 Cancelar'
      Enabled = False
      ImageIndex = 1
      OnClick = btCancelarClick
    end
    object ToolButton4: TToolButton
      Left = 172
      Top = 0
      Width = 8
      Caption = 'ToolButton4'
      ImageIndex = 2
      Style = tbsSeparator
    end
    object btBuscar: TToolButton
      Left = 180
      Top = 0
      AutoSize = True
      Caption = 'F8 Buscar'
      ImageIndex = 2
      OnClick = btBuscarClick
    end
    object ToolButton6: TToolButton
      Left = 258
      Top = 0
      Width = 8
      Caption = 'ToolButton6'
      ImageIndex = 3
      Style = tbsSeparator
    end
    object btFechar: TToolButton
      Left = 266
      Top = 0
      AutoSize = True
      Caption = 'F12 Fechar'
      ImageIndex = 3
      OnClick = btFecharClick
    end
  end
  object Panel3: TPanel
    Left = 0
    Top = 0
    Width = 504
    Height = 25
    Align = alTop
    Alignment = taLeftJustify
    BevelOuter = bvLowered
    Color = clBlue
    Font.Charset = ANSI_CHARSET
    Font.Color = clWhite
    Font.Height = -16
    Font.Name = 'Arial'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 2
    ExplicitWidth = 505
    object DBText1: TDBText
      Left = 95
      Top = 2
      Width = 367
      Height = 19
      DataField = 'nm_pessoa'
      DataSource = dsNomePessoa
    end
    object DBText2: TDBText
      Left = 0
      Top = 2
      Width = 89
      Height = 19
      Alignment = taRightJustify
      DataField = 'cd_pessoa'
      DataSource = dsPessoa
    end
    object lbSelecione: TLabel
      Left = 8
      Top = 3
      Width = 182
      Height = 19
      Caption = 'SELECIONE O ALUNO...'
    end
  end
  object ImageList1: TImageList
    Left = 528
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
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
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
      0000000000000000000000000000000000000000000000000000008484000084
      8400000000000000000000000000000000000000000000000000000000000000
      0000000000000084840000000000000000000000000000000000000000000000
      FF000000FF000000FF000000FF000000FF000000FF000000FF000000FF000000
      FF00000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000007B7B7B0000000000000000000000
      00007B7B7B000000000000000000000000000000000000000000000000003163
      9C0031639C000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000008484000084
      8400000000000000000000000000000000000000000000000000000000000000
      00000000000000848400000000000000000000000000000000000000FF000000
      FF000000000000000000000000000000000000000000000000000000FF000000
      FF000000FF000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000052630031639C0031639C003163
      9C0031639C000000000000526300005263000052630000526300005263000052
      6300000000000000000000000000000000000000000000000000008484000084
      8400000000000000000000000000000000000000000000000000000000000000
      000000000000008484000000000000000000000000000000FF000000FF000000
      FF000000FF000000000000000000000000000000000000000000000000000000
      FF000000FF000000FF0000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000526300316B9C00316B9C003163
      9C0031639C000000000000CEFF0000CEFF0000CEFF0000000000000000000000
      0000000000000000000000000000000000000000000000000000008484000084
      8400000000000000000000000000000000000000000000000000000000000000
      000000000000008484000000000000000000000000000000FF00000000000000
      FF000000FF000000FF0000000000000000000000000000000000000000000000
      00000000FF000000FF0000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000526300296BA500296BA500296B
      9C00296B9C000000000000CEFF0000CEFF0000CEFF000000000000000000FF00
      0000000000000000000000000000000000000000000000000000008484000084
      8400008484000084840000848400008484000084840000848400008484000084
      8400008484000084840000000000000000000000FF000000FF00000000000000
      00000000FF000000FF000000FF00000000000000000000000000000000000000
      0000000000000000FF000000FF00000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000005263002173AD002173A5002173
      A5002973A5000000000010CEFF0000CEFF0000CEFF0000000000FF000000FF00
      0000000000000000000000000000000000000000000000000000008484000084
      8400000000000000000000000000000000000000000000000000000000000000
      0000008484000084840000000000000000000000FF000000FF00000000000000
      0000000000000000FF000000FF000000FF000000000000000000000000000000
      0000000000000000FF000000FF00000000000000000000000000000000000000
      00000000000000000000000000000000000000000000000000007B7B7B000000
      00000000000000000000000000000000000000526300187BAD00187BAD00FFFF
      FF002173AD000000000031D6FF0029D6FF0018D6FF00FF000000FF000000FF00
      0000000000000000000000000000000000000000000000000000008484000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000084840000000000000000000000FF000000FF00000000000000
      000000000000000000000000FF000000FF000000FF0000000000000000000000
      0000000000000000FF000000FF00000000000000000000000000FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF000000000000000000FFFFFF00000000000000
      000000000000000000000000000000000000005263001084B5001884B5001884
      B500187BB5000000000063DEFF0052DEFF00FF000000FF000000FF000000FF00
      0000FF000000FF000000FF000000000000000000000000000000008484000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000084840000000000000000000000FF000000FF00000000000000
      00000000000000000000000000000000FF000000FF000000FF00000000000000
      0000000000000000FF000000FF00000000000000000000000000FFFFFF000000
      00000000000000000000FFFFFF000000000000000000FFFFFF00000000000000
      00000000000000000000000000000000000000526300088CBD00108CBD001084
      BD001084B500000000008CE7FF00FF000000FF000000FF000000FF000000FF00
      0000FF000000FF000000FF000000000000000000000000000000008484000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000084840000000000000000000000FF000000FF00000000000000
      0000000000000000000000000000000000000000FF000000FF000000FF000000
      0000000000000000FF000000FF00000000000000000000000000FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF000000000000000000FFFFFF00000000000000
      000000000000000000000000000000000000005263000894C600088CC600088C
      C600088CBD0000000000B5EFFF00A5EFFF00FF000000FF000000FF000000FF00
      0000FF000000FF000000FF000000000000000000000000000000008484000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000008484000000000000000000000000000000FF000000FF000000
      000000000000000000000000000000000000000000000000FF000000FF000000
      FF00000000000000FF0000000000000000000000000000000000FFFFFF000000
      0000000000000000000000000000FFFFFF00FFFFFF00FFFFFF00000000000000
      000000000000000000000000000000000000005263000094CE000094CE000094
      C6000094C60000000000DEF7FF00CEF7FF00C6EFFF00FF000000FF000000FF00
      0000000000000000000000000000000000000000000000000000008484000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000FF000000FF000000
      FF000000000000000000000000000000000000000000000000000000FF000000
      FF000000FF000000FF0000000000000000000000000000000000FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00000000000000
      00000000000000000000000000000000000000526300009CCE00009CCE00009C
      CE000094CE0000000000FFFFFF00F7F7FF00E7F7FF0000000000FF000000FF00
      0000000000000000000000000000000000000000000000000000008484000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000000000000000FF000000
      FF000000FF000000000000000000000000000000000000000000000000000000
      FF000000FF00000000000000000000000000000000007B0000007B0000007B00
      00007B0000007B0000007B0000007B0000007B0000007B0000007B0000000000
      00000000000000000000000000000000000000526300009CCE00009CCE00009C
      CE00009CCE0000000000FFFFFF00FFFFFF00FFFFFF000000000000000000FF00
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      FF000000FF000000FF000000FF000000FF000000FF000000FF000000FF000000
      FF0000000000000000000000000000000000000000007B0000007B0000007B00
      00007B0000007B0000007B0000007B0000007B0000007B0000007B0000000000
      000000000000000000000000000000000000000000000052630000526300009C
      CE00009CCE000000000000526300005263000052630000526300000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000FF000000FF000000FF000000FF000000FF00000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000052
      6300005263000052630000000000000000000000000000000000000000000000
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
      00000000000000000000000000000000FFFFFFFFF8F8FFFFC001F83FFAFAE3FF
      8031E00FF87083FF8031CFC7F800000F803187E3FA10003F8001A3F3FA10002F
      800131F9F800000F800138F98001000F8FF13C79801300018FF13E3980130001
      8FF13F19801300018FF19F8B801F000F8FF18FC3801F000F8FF5C7E7801F002F
      8001E00F801F803FFFFFF83FFFFFE3FF00000000000000000000000000000000
      000000000000}
  end
  object dsPessoa: TDataSource
    DataSet = tblPessoa
    OnStateChange = dsPessoaStateChange
    OnDataChange = dsPessoaDataChange
    Left = 419
    Top = 140
  end
  object tblPessoa: TUMZQuery
    Connection = DM.db
    SortedFields = 'nr_ano_censo'
    BeforeInsert = tblPessoaBeforeInsert
    BeforeEdit = tblPessoaBeforeEdit
    BeforePost = tblPessoaBeforePost
    BeforeCancel = tblPessoaBeforeCancel
    SQL.Strings = (
      'SELECT'
      '  *'
      'FROM'
      '  pessoas_bolsas')
    Params = <>
    IndexFieldNames = 'nr_ano_censo Asc'
    Left = 419
    Top = 107
    object tblPessoacd_pessoa: TIntegerField
      FieldName = 'cd_pessoa'
      Origin = 'WMESTRE12.pessoas_bolsas.cd_pessoa'
    end
    object tblPessoasn_re_fies: TSmallintField
      FieldName = 'sn_re_fies'
      Origin = 'WMESTRE12.pessoas_bolsas.sn_re_fies'
    end
    object tblPessoasn_re_governo_estadual: TSmallintField
      FieldName = 'sn_re_governo_estadual'
      Origin = 'WMESTRE12.pessoas_bolsas.sn_re_governo_estadual'
    end
    object tblPessoasn_re_governo_municipal: TSmallintField
      FieldName = 'sn_re_governo_municipal'
      Origin = 'WMESTRE12.pessoas_bolsas.sn_re_governo_municipal'
    end
    object tblPessoasn_re_ies: TSmallintField
      FieldName = 'sn_re_ies'
      Origin = 'WMESTRE12.pessoas_bolsas.sn_re_ies'
    end
    object tblPessoasn_re_entidades_externas: TSmallintField
      FieldName = 'sn_re_entidades_externas'
      Origin = 'WMESTRE12.pessoas_bolsas.sn_re_entidades_externas'
    end
    object tblPessoasn_re_outros: TSmallintField
      FieldName = 'sn_re_outros'
      Origin = 'WMESTRE12.pessoas_bolsas.sn_re_outros'
    end
    object tblPessoasn_nre_prouni_integral: TSmallintField
      FieldName = 'sn_nre_prouni_integral'
      Origin = 'WMESTRE12.pessoas_bolsas.sn_nre_prouni_integral'
    end
    object tblPessoasn_nre_prouni_parcial: TSmallintField
      FieldName = 'sn_nre_prouni_parcial'
      Origin = 'WMESTRE12.pessoas_bolsas.sn_nre_prouni_parcial'
    end
    object tblPessoasn_nre_ies: TSmallintField
      FieldName = 'sn_nre_ies'
      Origin = 'WMESTRE12.pessoas_bolsas.sn_nre_ies'
    end
    object tblPessoasn_nre_governo_estadual: TSmallintField
      FieldName = 'sn_nre_governo_estadual'
      Origin = 'WMESTRE12.pessoas_bolsas.sn_nre_governo_estadual'
    end
    object tblPessoasn_nre_governo_municipal: TSmallintField
      FieldName = 'sn_nre_governo_municipal'
      Origin = 'WMESTRE12.pessoas_bolsas.sn_nre_governo_municipal'
    end
    object tblPessoasn_nre_entidades_externas: TSmallintField
      FieldName = 'sn_nre_entidades_externas'
      Origin = 'WMESTRE12.pessoas_bolsas.sn_nre_entidades_externas'
    end
    object tblPessoasn_nre_outros: TSmallintField
      FieldName = 'sn_nre_outros'
      Origin = 'WMESTRE12.pessoas_bolsas.sn_nre_outros'
    end
    object tblPessoasn_as_alimentacao: TSmallintField
      FieldName = 'sn_as_alimentacao'
      Origin = 'WMESTRE12.pessoas_bolsas.sn_as_alimentacao'
    end
    object tblPessoasn_as_moradia: TSmallintField
      FieldName = 'sn_as_moradia'
      Origin = 'WMESTRE12.pessoas_bolsas.sn_as_moradia'
    end
    object tblPessoasn_as_transporte: TSmallintField
      FieldName = 'sn_as_transporte'
      Origin = 'WMESTRE12.pessoas_bolsas.sn_as_transporte'
    end
    object tblPessoasn_as_mat_didatico: TSmallintField
      FieldName = 'sn_as_mat_didatico'
      Origin = 'WMESTRE12.pessoas_bolsas.sn_as_mat_didatico'
    end
    object tblPessoasn_as_bolsa_trabalho: TSmallintField
      FieldName = 'sn_as_bolsa_trabalho'
      Origin = 'WMESTRE12.pessoas_bolsas.sn_as_bolsa_trabalho'
    end
    object tblPessoasn_as_bolsa_permanencia: TSmallintField
      FieldName = 'sn_as_bolsa_permanencia'
      Origin = 'WMESTRE12.pessoas_bolsas.sn_as_bolsa_permanencia'
    end
    object tblPessoasn_at_complementar: TSmallintField
      FieldName = 'sn_at_complementar'
      Origin = 'WMESTRE12.pessoas_bolsas.sn_at_complementar'
    end
    object tblPessoasn_at_pesquisa: TSmallintField
      FieldName = 'sn_at_pesquisa'
      Origin = 'WMESTRE12.pessoas_bolsas.sn_at_pesquisa'
    end
    object tblPessoasn_at_extensao: TSmallintField
      FieldName = 'sn_at_extensao'
      Origin = 'WMESTRE12.pessoas_bolsas.sn_at_extensao'
    end
    object tblPessoasn_at_monitoria: TSmallintField
      FieldName = 'sn_at_monitoria'
      Origin = 'WMESTRE12.pessoas_bolsas.sn_at_monitoria'
    end
    object tblPessoasn_at_extracurricular: TSmallintField
      FieldName = 'sn_at_extracurricular'
      Origin = 'WMESTRE12.pessoas_bolsas.sn_at_extracurricular'
    end
    object tblPessoasn_at_re_pesquisa: TSmallintField
      FieldName = 'sn_at_re_pesquisa'
      Origin = 'WMESTRE12.pessoas_bolsas.sn_at_re_pesquisa'
    end
    object tblPessoasn_at_re_extensao: TSmallintField
      FieldName = 'sn_at_re_extensao'
      Origin = 'WMESTRE12.pessoas_bolsas.sn_at_re_extensao'
    end
    object tblPessoasn_at_re_monitoria: TSmallintField
      FieldName = 'sn_at_re_monitoria'
      Origin = 'WMESTRE12.pessoas_bolsas.sn_at_re_monitoria'
    end
    object tblPessoasn_at_re_extracurricular: TSmallintField
      FieldName = 'sn_at_re_extracurricular'
      Origin = 'WMESTRE12.pessoas_bolsas.sn_at_re_extracurricular'
    end
    object tblPessoanr_ano_censo: TIntegerField
      FieldName = 'nr_ano_censo'
    end
    object tblPessoacd_curso: TStringField
      FieldName = 'cd_curso'
      Size = 15
    end
    object tblPessoads_curso: TStringField
      FieldKind = fkLookup
      FieldName = 'ds_curso'
      LookupDataSet = qyCursos
      LookupKeyFields = 'cd_curso'
      LookupResultField = 'ds_curso'
      KeyFields = 'cd_curso'
      Size = 30
      Lookup = True
    end
    object tblPessoacd_pessoa_bolsa: TIntegerField
      FieldName = 'cd_pessoa_bolsa'
      Required = True
    end
    object tblPessoasn_parfor: TSmallintField
      FieldName = 'sn_parfor'
    end
    object tblPessoasn_bolsa_educa_mais_brasil: TIntegerField
      FieldName = 'sn_bolsa_educa_mais_brasil'
    end
  end
  object dsNomePessoa: TDataSource
    DataSet = tblNomePessoa
    Left = 419
    Top = 212
  end
  object tblNomePessoa: TUMZQuery
    Connection = DM.db
    SQL.Strings = (
      'SELECT'
      '  nm_pessoa'
      'FROM'
      '  pessoas'
      'WHERE'
      '  cd_pessoa = :cd_pessoa'
      'LIMIT 1')
    Params = <
      item
        DataType = ftUnknown
        Name = 'cd_pessoa'
        ParamType = ptUnknown
      end>
    Left = 419
    Top = 179
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'cd_pessoa'
        ParamType = ptUnknown
      end>
    object tblNomePessoanm_pessoa: TStringField
      FieldName = 'nm_pessoa'
    end
  end
  object dsCursos: TDataSource
    DataSet = qyCursos
    Left = 419
    Top = 284
  end
  object qyCursos: TUMZQuery
    Connection = DM.db
    SQL.Strings = (
      'SELECT'
      '  cm.cd_curso, cm.ds_curso'
      'FROM'
      '  matriculas_curso mc'
      'INNER JOIN cursos_mestre CM ON (CM.CD_CURSO = mc.cd_curso)'
      'WHERE cd_pessoa = :cd_pessoa')
    Params = <
      item
        DataType = ftUnknown
        Name = 'cd_pessoa'
        ParamType = ptUnknown
      end>
    Left = 419
    Top = 251
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'cd_pessoa'
        ParamType = ptUnknown
      end>
    object qyCursoscd_curso: TStringField
      FieldName = 'cd_curso'
      Size = 15
    end
    object qyCursosds_curso: TStringField
      FieldName = 'ds_curso'
      Size = 30
    end
  end
end
