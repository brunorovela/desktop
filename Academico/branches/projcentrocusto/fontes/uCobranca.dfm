object frmCobranca: TfrmCobranca
  Left = 0
  Top = 0
  Caption = 'Cobran'#231'a'
  ClientHeight = 657
  ClientWidth = 1216
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  FormStyle = fsMDIChild
  KeyPreview = True
  OldCreateOrder = False
  Position = poScreenCenter
  Visible = True
  WindowState = wsMaximized
  OnClose = FormClose
  OnCreate = FormCreate
  OnKeyDown = FormKeyDown
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object Bevel6: TBevel
    Left = 0
    Top = 25
    Width = 1216
    Height = 4
    Align = alTop
    Shape = bsSpacer
    Style = bsRaised
    ExplicitWidth = 779
  end
  object Bevel1: TBevel
    Left = 0
    Top = 29
    Width = 1216
    Height = 3
    Align = alTop
    Shape = bsTopLine
    Style = bsRaised
    ExplicitWidth = 779
  end
  object Panel3: TPanel
    Left = 0
    Top = 0
    Width = 1216
    Height = 25
    Align = alTop
    BevelOuter = bvLowered
    Caption = 'PLANILHA DE COBRAN'#199'A'
    Color = clBlue
    Font.Charset = ANSI_CHARSET
    Font.Color = clWhite
    Font.Height = -17
    Font.Name = 'Arial'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 0
  end
  object toolPessoa: TToolBar
    Left = 0
    Top = 632
    Width = 1216
    Height = 25
    Align = alBottom
    ButtonWidth = 104
    Caption = 'toolPessoa'
    EdgeBorders = [ebTop, ebBottom]
    Images = ImageList1
    List = True
    ShowCaptions = True
    TabOrder = 2
    object DBNavigator1: TDBNavigator
      Left = 0
      Top = 0
      Width = 48
      Height = 22
      DataSource = dtcCobranca
      VisibleButtons = [nbPrior, nbNext]
      Flat = True
      TabOrder = 0
    end
    object ToolButton4: TToolButton
      Left = 48
      Top = 0
      Width = 8
      Caption = 'ToolButton4'
      ImageIndex = 8
      Style = tbsSeparator
    end
    object ToolButton2: TToolButton
      Left = 56
      Top = 0
      Caption = 'Editar Cobran'#231'a'
      ImageIndex = 1
      OnClick = ToolButton2Click
    end
    object ToolButton1: TToolButton
      Left = 160
      Top = 0
      Width = 8
      Caption = 'ToolButton1'
      Style = tbsSeparator
    end
    object sbSelecionarColuna: TSpeedButton
      Left = 168
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
      Transparent = False
      OnClick = sbSelecionarColunaClick
    end
    object ToolButton3: TToolButton
      Left = 193
      Top = 0
      Width = 8
      Caption = 'ToolButton3'
      ImageIndex = 8
      Style = tbsSeparator
    end
    object btnImprimirListaCobranca: TToolButton
      Left = 201
      Top = 0
      AutoSize = True
      Caption = 'F7 Imprimir'
      ImageIndex = 6
      OnClick = btnImprimirListaCobrancaClick
    end
    object ToolButton5: TToolButton
      Left = 285
      Top = 0
      Width = 8
      Caption = 'ToolButton5'
      ImageIndex = 8
      Style = tbsSeparator
    end
    object sbFechar: TToolButton
      Left = 293
      Top = 0
      Caption = 'Fechar'
      ImageIndex = 7
      OnClick = sbFecharClick
    end
  end
  object pgCobranca: TPageControl
    Left = 0
    Top = 32
    Width = 1216
    Height = 600
    ActivePage = tsLista
    Align = alClient
    Style = tsFlatButtons
    TabOrder = 1
    OnChange = pgCobrancaChange
    object tsLista: TTabSheet
      Caption = 'LISTA COBRAN'#199'A'
      object Bevel2: TBevel
        Left = 0
        Top = 137
        Width = 1208
        Height = 4
        Align = alTop
        Shape = bsSpacer
        Style = bsRaised
        ExplicitTop = 118
        ExplicitWidth = 772
      end
      object grd: TDBGrid
        Left = 0
        Top = 141
        Width = 1208
        Height = 428
        Align = alClient
        BorderStyle = bsNone
        DataSource = dtcCobranca
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Arial'
        Font.Style = []
        Options = [dgTitles, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgAlwaysShowSelection, dgConfirmDelete, dgCancelOnExit, dgMultiSelect]
        ParentFont = False
        TabOrder = 0
        TitleFont.Charset = DEFAULT_CHARSET
        TitleFont.Color = clWindowText
        TitleFont.Height = -11
        TitleFont.Name = 'MS Sans Serif'
        TitleFont.Style = []
        OnDrawColumnCell = grdDrawColumnCell
        OnDblClick = grdDblClick
        OnTitleClick = grdTitleClick
      end
      object Panel1: TPanel
        Left = 0
        Top = 0
        Width = 1208
        Height = 137
        Align = alTop
        BevelOuter = bvLowered
        TabOrder = 1
        ExplicitTop = -2
        object Label1: TLabel
          Left = 292
          Top = 85
          Width = 45
          Height = 13
          Caption = 'Situa'#231#227'o:'
        end
        object sbAtualizarLista: TSpeedButton
          Left = 587
          Top = 87
          Width = 161
          Height = 26
          Caption = 'Atualizar Lista de Cobran'#231'a'
          OnClick = sbAtualizarListaClick
        end
        object btnCodigoDepartamento: TSpeedButton
          Left = 451
          Top = 30
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
          OnClick = btnCodigoDepartamentoClick
        end
        object btnCodigoCurso: TSpeedButton
          Left = 715
          Top = 28
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
        object btnCodigoTurma: TSpeedButton
          Left = 715
          Top = 53
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
          OnClick = btnCodigoTurmaClick
        end
        object btnCodigoAluno: TSpeedButton
          Left = 251
          Top = 80
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
          OnClick = btnCodigoAlunoClick
        end
        object Label23: TLabel
          Left = 480
          Top = 9
          Width = 46
          Height = 13
          Caption = 'Por Data:'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
        end
        object Label25: TLabel
          Left = 15
          Top = 110
          Width = 99
          Height = 13
          Caption = 'Data de pagamento:'
        end
        object rbPorVencimento: TRadioButton
          Left = 532
          Top = 11
          Width = 78
          Height = 12
          Caption = 'Vencimento'
          TabOrder = 4
          TabStop = True
          OnClick = rbPorVencimentoClick
        end
        object rdbPorRetorno: TRadioButton
          Left = 611
          Top = 11
          Width = 83
          Height = 12
          Caption = 'Retorno'
          TabOrder = 5
          TabStop = True
          OnClick = rbPorVencimentoClick
        end
        object ckbDe: TCheckBox
          Left = 15
          Top = 9
          Width = 34
          Height = 17
          Caption = 'De:'
          Enabled = False
          TabOrder = 0
          OnClick = ckbDeClick
        end
        object ckbAte: TCheckBox
          Left = 226
          Top = 10
          Width = 42
          Height = 17
          Caption = 'At'#233':'
          Enabled = False
          TabOrder = 2
          OnClick = ckbAteClick
        end
        object dtpDataInicial: TDateTimePicker
          Left = 116
          Top = 4
          Width = 90
          Height = 21
          Date = 39288.396374375000000000
          Time = 39288.396374375000000000
          TabOrder = 1
        end
        object dtpDataFinal: TDateTimePicker
          Left = 321
          Top = 4
          Width = 124
          Height = 21
          Date = 39288.396374375000000000
          Time = 39288.396374375000000000
          TabOrder = 3
        end
        object ckbPorAnoSemestre: TCheckBox
          Left = 15
          Top = 32
          Width = 114
          Height = 17
          Caption = 'Ano/Semestre:'
          TabOrder = 6
          OnClick = ckbPorAnoSemestreClick
        end
        object txtAnoSemestre: TMaskEdit
          Left = 116
          Top = 31
          Width = 73
          Height = 22
          EditMask = '9999/9;0;_'
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = []
          MaxLength = 6
          ParentFont = False
          TabOrder = 8
          Text = '20051'
        end
        object UpDownAnoSem: TUpDown
          Left = 188
          Top = 29
          Width = 18
          Height = 24
          Min = -100
          TabOrder = 10
          OnClick = UpDownAnoSemClick
        end
        object ckbResponsavel: TCheckBox
          Left = 15
          Top = 56
          Width = 114
          Height = 17
          Caption = 'Usu'#225'rio:'
          TabOrder = 13
          OnClick = ckbResponsavelClick
        end
        object cbResponsavel: TComboBox
          Left = 116
          Top = 54
          Width = 329
          Height = 22
          Style = csOwnerDrawFixed
          ItemHeight = 16
          TabOrder = 14
        end
        object cbSituacao: TComboBox
          Left = 346
          Top = 81
          Width = 232
          Height = 22
          Style = csOwnerDrawFixed
          ItemHeight = 16
          TabOrder = 20
        end
        object ckbDepartamento: TCheckBox
          Left = 226
          Top = 33
          Width = 89
          Height = 17
          Caption = 'Departamento:'
          TabOrder = 7
          OnClick = ckbResponsavelClick
        end
        object ckbCurso: TCheckBox
          Left = 527
          Top = 32
          Width = 54
          Height = 17
          Caption = 'Curso:'
          TabOrder = 11
          OnClick = ckbResponsavelClick
        end
        object ckbTurma: TCheckBox
          Left = 527
          Top = 55
          Width = 54
          Height = 17
          Caption = 'Turma:'
          TabOrder = 15
          OnClick = ckbResponsavelClick
        end
        object txtDepartamento: TEdit
          Left = 321
          Top = 31
          Width = 124
          Height = 21
          TabOrder = 9
        end
        object txtCurso: TEdit
          Left = 587
          Top = 30
          Width = 124
          Height = 21
          CharCase = ecUpperCase
          TabOrder = 12
        end
        object txtTurma: TEdit
          Left = 587
          Top = 54
          Width = 124
          Height = 21
          CharCase = ecUpperCase
          TabOrder = 16
        end
        object ckbAluno: TCheckBox
          Left = 15
          Top = 82
          Width = 48
          Height = 17
          Caption = 'Aluno:'
          TabOrder = 17
          OnClick = ckbResponsavelClick
        end
        object txtAluno: TEdit
          Left = 164
          Top = 82
          Width = 88
          Height = 21
          TabOrder = 19
        end
        object ckbAlunoResponsavel: TCheckBox
          Left = 76
          Top = 82
          Width = 82
          Height = 17
          Caption = 'Respons'#225'vel:'
          TabOrder = 18
          OnClick = ckbResponsavelClick
        end
        object GroupBox1: TGroupBox
          Left = 754
          Top = 4
          Width = 295
          Height = 111
          Caption = '   Cobran'#231'a inclusa em:    '
          TabOrder = 21
          object Label24: TLabel
            Left = 13
            Top = 23
            Width = 58
            Height = 13
            Caption = 'Incluso em: '
          end
          object cbInclusoDe: TCheckBox
            Left = 13
            Top = 52
            Width = 34
            Height = 17
            Caption = 'De:'
            Enabled = False
            TabOrder = 0
            OnClick = ckbDeClick
          end
          object dtInclusoDe: TDateTimePicker
            Left = 53
            Top = 49
            Width = 90
            Height = 21
            Date = 39288.396374375000000000
            Time = 39288.396374375000000000
            TabOrder = 1
          end
          object cbInclusoAte: TCheckBox
            Left = 149
            Top = 51
            Width = 42
            Height = 17
            Caption = 'At'#233':'
            Enabled = False
            TabOrder = 2
            OnClick = ckbAteClick
          end
          object dtInclusoAte: TDateTimePicker
            Left = 193
            Top = 49
            Width = 90
            Height = 21
            Date = 39288.396374375000000000
            Time = 39288.396374375000000000
            TabOrder = 3
          end
          object comboIncluso: TUMComboBox
            Left = 73
            Top = 21
            Width = 209
            Height = 21
            ItemHeight = 13
            TabOrder = 4
            OnCloseUp = comboInclusoCloseUp
            Items.Strings = (
              ''
              'SPC'
              'JUR'#205'DICO'
              'SERASA'
              'CART'#211'RIO')
            TamanhoMaximo = 0
          end
        end
        object cbDePagamento: TCheckBox
          Left = 120
          Top = 109
          Width = 34
          Height = 17
          Caption = 'De:'
          TabOrder = 22
          OnClick = ckbDeClick
        end
        object dtpDePagamento: TDateTimePicker
          Left = 165
          Top = 106
          Width = 90
          Height = 21
          Date = 39288.396374375000000000
          Time = 39288.396374375000000000
          TabOrder = 23
        end
        object cbAtePagamento: TCheckBox
          Left = 261
          Top = 109
          Width = 42
          Height = 17
          Caption = 'At'#233':'
          TabOrder = 24
          OnClick = ckbAteClick
        end
        object dtpAtePagamento: TDateTimePicker
          Left = 309
          Top = 104
          Width = 124
          Height = 21
          Date = 39288.396374375000000000
          Time = 39288.396374375000000000
          TabOrder = 25
        end
      end
    end
    object tsDadosDevedor: TTabSheet
      Caption = 'DADOS DO DEVEDOR'
      ImageIndex = 1
      object Panel2: TPanel
        Left = 0
        Top = 0
        Width = 1208
        Height = 199
        Align = alTop
        BevelOuter = bvLowered
        TabOrder = 0
        object Label2: TLabel
          Left = 512
          Top = 8
          Width = 37
          Height = 13
          Caption = 'C'#243'digo:'
        end
        object Label3: TLabel
          Left = 16
          Top = 30
          Width = 110
          Height = 13
          Caption = 'Nome do Respons'#225'vel:'
        end
        object Label4: TLabel
          Left = 16
          Top = 8
          Width = 98
          Height = 13
          Caption = 'Nome do Estudante:'
        end
        object Label5: TLabel
          Left = 512
          Top = 30
          Width = 23
          Height = 13
          Caption = 'CPF:'
        end
        object Label6: TLabel
          Left = 16
          Top = 52
          Width = 49
          Height = 13
          Caption = 'Endere'#231'o:'
        end
        object Label7: TLabel
          Left = 16
          Top = 118
          Width = 48
          Height = 13
          Caption = 'Contatos:'
        end
        object Bevel11: TBevel
          Left = 1
          Top = 191
          Width = 1206
          Height = 7
          Align = alBottom
          Shape = bsSpacer
          Style = bsRaised
          ExplicitTop = 184
          ExplicitWidth = 769
        end
        object txtNome: TEdit
          Left = 136
          Top = 8
          Width = 355
          Height = 18
          TabStop = False
          BorderStyle = bsNone
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
          ReadOnly = True
          TabOrder = 0
        end
        object txtResponsavel: TEdit
          Left = 136
          Top = 30
          Width = 355
          Height = 18
          TabStop = False
          BorderStyle = bsNone
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
          ReadOnly = True
          TabOrder = 1
        end
        object txtCodigoEstudante: TEdit
          Left = 558
          Top = 8
          Width = 153
          Height = 18
          TabStop = False
          BorderStyle = bsNone
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
          ReadOnly = True
          TabOrder = 2
        end
        object txtCPF: TEdit
          Left = 558
          Top = 30
          Width = 153
          Height = 18
          TabStop = False
          BorderStyle = bsNone
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
          ReadOnly = True
          TabOrder = 3
        end
        object meEndereco: TMemo
          Left = 136
          Top = 52
          Width = 575
          Height = 61
          TabStop = False
          BorderStyle = bsNone
          ReadOnly = True
          TabOrder = 4
        end
        object txtContato1: TEdit
          Left = 136
          Top = 118
          Width = 283
          Height = 18
          TabStop = False
          BorderStyle = bsNone
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
          ReadOnly = True
          TabOrder = 5
        end
        object txtContato2: TEdit
          Left = 428
          Top = 118
          Width = 283
          Height = 18
          TabStop = False
          BorderStyle = bsNone
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
          ReadOnly = True
          TabOrder = 6
        end
        object txtContato3: TEdit
          Left = 136
          Top = 140
          Width = 283
          Height = 18
          TabStop = False
          BorderStyle = bsNone
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
          ReadOnly = True
          TabOrder = 7
        end
        object txtContato4: TEdit
          Left = 428
          Top = 140
          Width = 283
          Height = 18
          TabStop = False
          BorderStyle = bsNone
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
          ReadOnly = True
          TabOrder = 8
        end
        object txtContato5: TEdit
          Left = 136
          Top = 162
          Width = 283
          Height = 18
          TabStop = False
          BorderStyle = bsNone
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
          ReadOnly = True
          TabOrder = 9
        end
        object txtContato6: TEdit
          Left = 428
          Top = 162
          Width = 283
          Height = 18
          TabStop = False
          BorderStyle = bsNone
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
          ReadOnly = True
          TabOrder = 10
        end
      end
      object Panel4: TPanel
        Left = 0
        Top = 369
        Width = 1208
        Height = 200
        Align = alClient
        BevelOuter = bvLowered
        TabOrder = 1
        object Bevel5: TBevel
          Left = 1192
          Top = 1
          Width = 15
          Height = 198
          Align = alRight
          Shape = bsSpacer
          ExplicitLeft = 756
          ExplicitHeight = 190
        end
        object Panel6: TPanel
          Left = 1
          Top = 1
          Width = 136
          Height = 198
          Align = alLeft
          BevelOuter = bvNone
          TabOrder = 0
          object Label13: TLabel
            Left = 15
            Top = 9
            Width = 63
            Height = 26
            Caption = 'Observa'#231#245'es Financeiras:'
            WordWrap = True
          end
        end
        object pgOBS: TPageControl
          Left = 137
          Top = 1
          Width = 1055
          Height = 198
          ActivePage = tsRestrita
          Align = alClient
          MultiLine = True
          TabOrder = 1
          object tsGeral: TTabSheet
            Caption = 'Observa'#231#245'es Gerais'
            object meObservacoes: TMemo
              Left = 0
              Top = 0
              Width = 1047
              Height = 170
              Align = alClient
              BorderStyle = bsNone
              ReadOnly = True
              ScrollBars = ssVertical
              TabOrder = 0
            end
          end
          object tsRestrita: TTabSheet
            Caption = 'Observa'#231#245'es Restritas'
            ImageIndex = 1
            object meRestritas: TMemo
              Left = 0
              Top = 0
              Width = 1047
              Height = 170
              Align = alClient
              BorderStyle = bsNone
              ReadOnly = True
              ScrollBars = ssVertical
              TabOrder = 0
            end
          end
        end
      end
      object Panel5: TPanel
        Left = 0
        Top = 313
        Width = 1208
        Height = 56
        Align = alTop
        BevelOuter = bvLowered
        TabOrder = 2
        object Label10: TLabel
          Left = 16
          Top = 9
          Width = 23
          Height = 13
          Caption = 'SPC:'
        end
        object Label11: TLabel
          Left = 275
          Top = 9
          Width = 85
          Height = 13
          Caption = 'Data da Inclus'#227'o:'
        end
        object Label12: TLabel
          Left = 499
          Top = 9
          Width = 86
          Height = 13
          Caption = 'Data da Retirada:'
        end
        object Label8: TLabel
          Left = 16
          Top = 31
          Width = 40
          Height = 13
          Caption = 'Jur'#237'dico:'
        end
        object D: TLabel
          Left = 275
          Top = 31
          Width = 85
          Height = 13
          Caption = 'Data da Inclus'#227'o:'
        end
        object Label9: TLabel
          Left = 499
          Top = 31
          Width = 86
          Height = 13
          Caption = 'Data da Retirada:'
        end
        object txtSPC: TEdit
          Left = 137
          Top = 9
          Width = 117
          Height = 18
          TabStop = False
          BorderStyle = bsNone
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
          ReadOnly = True
          TabOrder = 0
        end
        object txtJuridico: TEdit
          Left = 137
          Top = 31
          Width = 117
          Height = 18
          TabStop = False
          BorderStyle = bsNone
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
          ReadOnly = True
          TabOrder = 1
        end
        object txtSPCInclusao: TEdit
          Left = 366
          Top = 9
          Width = 117
          Height = 18
          TabStop = False
          BorderStyle = bsNone
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
          ReadOnly = True
          TabOrder = 2
        end
        object txtJurInclusao: TEdit
          Left = 366
          Top = 31
          Width = 117
          Height = 18
          TabStop = False
          BorderStyle = bsNone
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
          ReadOnly = True
          TabOrder = 3
        end
        object txtSPCRetirada: TEdit
          Left = 594
          Top = 9
          Width = 117
          Height = 18
          TabStop = False
          BorderStyle = bsNone
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
          ReadOnly = True
          TabOrder = 4
        end
        object txtJurRetirada: TEdit
          Left = 594
          Top = 31
          Width = 117
          Height = 18
          TabStop = False
          BorderStyle = bsNone
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
          ReadOnly = True
          TabOrder = 5
        end
      end
      object pnEmpresa: TPanel
        Left = 0
        Top = 199
        Width = 1208
        Height = 114
        Align = alTop
        BevelOuter = bvLowered
        TabOrder = 3
        object lblEmpresa: TLabel
          Left = 16
          Top = 8
          Width = 41
          Height = 13
          Caption = 'Empresa'
        end
        object lblNome: TLabel
          Left = 118
          Top = 8
          Width = 31
          Height = 13
          Caption = 'Nome:'
        end
        object lblEnderecoEmpresa: TLabel
          Left = 118
          Top = 35
          Width = 49
          Height = 13
          Caption = 'Endere'#231'o:'
        end
        object lblcargo: TLabel
          Left = 428
          Top = 8
          Width = 79
          Height = 13
          Caption = 'Cargo Ocupado:'
        end
        object lblEmail: TLabel
          Left = 428
          Top = 35
          Width = 28
          Height = 13
          Caption = 'Email:'
        end
        object lblTelefone: TLabel
          Left = 428
          Top = 61
          Width = 46
          Height = 13
          Caption = 'Telefone:'
        end
        object lblSite: TLabel
          Left = 428
          Top = 86
          Width = 22
          Height = 13
          Caption = 'Site:'
        end
        object dbeNome_Empresa: TDBEdit
          Left = 174
          Top = 5
          Width = 245
          Height = 21
          BorderStyle = bsNone
          DataField = 'nm_empresa'
          DataSource = dsEmpresa
          TabOrder = 0
        end
        object dbeCargo: TDBEdit
          Left = 511
          Top = 5
          Width = 202
          Height = 21
          BorderStyle = bsNone
          DataField = 'cargo'
          DataSource = dtcCobranca
          TabOrder = 1
        end
        object dbeEmail: TDBEdit
          Left = 511
          Top = 32
          Width = 202
          Height = 21
          BorderStyle = bsNone
          DataField = 'ds_email'
          DataSource = dsEmpresa
          TabOrder = 2
        end
        object dbetelefone: TDBEdit
          Left = 511
          Top = 59
          Width = 203
          Height = 21
          BorderStyle = bsNone
          DataField = 'ds_telefone1'
          DataSource = dsEmpresa
          TabOrder = 3
        end
        object dbeSite: TDBEdit
          Left = 511
          Top = 86
          Width = 203
          Height = 21
          BorderStyle = bsNone
          DataField = 'ds_site'
          DataSource = dsEmpresa
          TabOrder = 4
        end
        object dbmEnderecoCompleto: TDBMemo
          Left = 173
          Top = 32
          Width = 246
          Height = 74
          BorderStyle = bsNone
          DataField = 'ds_endereco_completo'
          DataSource = dsEmpresa
          TabOrder = 5
        end
      end
    end
    object tsTitulos: TTabSheet
      Caption = 'T'#205'TULOS'
      ImageIndex = 2
      object Panel7: TPanel
        Left = 0
        Top = 0
        Width = 1208
        Height = 569
        Align = alClient
        BevelOuter = bvLowered
        TabOrder = 0
        object Bevel7: TBevel
          Left = 1
          Top = 33
          Width = 1206
          Height = 7
          Align = alTop
          Shape = bsSpacer
          Style = bsRaised
          ExplicitWidth = 770
        end
        object Bevel10: TBevel
          Left = 1
          Top = 538
          Width = 1206
          Height = 6
          Align = alBottom
          Shape = bsSpacer
          Style = bsRaised
          ExplicitTop = 419
          ExplicitWidth = 770
        end
        object grdMensalidades: TDBGrid
          Left = 1
          Top = 40
          Width = 1206
          Height = 498
          Align = alClient
          Color = clWhite
          DataSource = dtcMensalidades
          Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgTabs, dgRowSelect, dgAlwaysShowSelection, dgCancelOnExit]
          TabOrder = 0
          TitleFont.Charset = DEFAULT_CHARSET
          TitleFont.Color = clWindowText
          TitleFont.Height = -11
          TitleFont.Name = 'Tahoma'
          TitleFont.Style = []
          OnTitleClick = grdTitleClick
        end
        object Panel8: TPanel
          Left = 1
          Top = 1
          Width = 1206
          Height = 32
          Align = alTop
          BevelOuter = bvLowered
          TabOrder = 1
          object Label15: TLabel
            Left = 418
            Top = 8
            Width = 65
            Height = 13
            Caption = 'Respons'#225'vel:'
          end
          object Label16: TLabel
            Left = 16
            Top = 8
            Width = 98
            Height = 13
            Caption = 'Nome do Estudante:'
          end
          object txtTituloNome: TEdit
            Left = 136
            Top = 8
            Width = 270
            Height = 18
            TabStop = False
            BorderStyle = bsNone
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -13
            Font.Name = 'Tahoma'
            Font.Style = []
            ParentFont = False
            ReadOnly = True
            TabOrder = 0
          end
          object txtTituloResponsa: TEdit
            Left = 489
            Top = 8
            Width = 270
            Height = 18
            TabStop = False
            BorderStyle = bsNone
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -13
            Font.Name = 'Tahoma'
            Font.Style = []
            ParentFont = False
            ReadOnly = True
            TabOrder = 1
          end
        end
        object pnBotoes: TPanel
          Left = 1
          Top = 544
          Width = 1206
          Height = 24
          Align = alBottom
          BevelOuter = bvLowered
          TabOrder = 2
          object sbVencidos: TSpeedButton
            Left = 51
            Top = 2
            Width = 82
            Height = 22
            GroupIndex = 1
            Down = True
            Caption = 'Vencidos'
            Flat = True
            OnClick = sbVencidosClick
          end
          object sbPendentes: TSpeedButton
            Left = 133
            Top = 2
            Width = 82
            Height = 22
            GroupIndex = 1
            Caption = 'Pendentes'
            Flat = True
            OnClick = sbPendentesClick
          end
          object sbPagos: TSpeedButton
            Left = 215
            Top = 2
            Width = 82
            Height = 22
            GroupIndex = 1
            Caption = 'Pagos'
            Flat = True
            OnClick = sbPagosClick
          end
          object sbNegociados: TSpeedButton
            Left = 297
            Top = 2
            Width = 82
            Height = 22
            GroupIndex = 1
            Caption = 'Negociados'
            Flat = True
            OnClick = sbNegociadosClick
          end
          object sbCancelados: TSpeedButton
            Left = 379
            Top = 2
            Width = 82
            Height = 22
            GroupIndex = 1
            Caption = 'Cancelados'
            Flat = True
            OnClick = sbCanceladosClick
          end
          object sbTodos: TSpeedButton
            Left = 461
            Top = 2
            Width = 82
            Height = 22
            GroupIndex = 1
            Caption = 'Todos'
            Flat = True
            OnClick = sbTodosClick
          end
          object Label21: TLabel
            Left = 6
            Top = 4
            Width = 35
            Height = 13
            Caption = 'T'#237'tulos:'
          end
          object btnImprimir: TSpeedButton
            Left = 1114
            Top = 1
            Width = 91
            Height = 22
            Hint = 'Imprimir extratos, bloquetos ou recibos'
            Align = alRight
            Caption = 'F7 Imprimir'
            Enabled = False
            Flat = True
            Glyph.Data = {
              F6000000424DF600000000000000760000002800000010000000100000000100
              04000000000080000000CE0E0000D80E00001000000000000000000000000000
              8000008000000080800080000000800080008080000080808000C0C0C0000000
              FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00222222222222
              22222200000000000222208888888880802200000000000008020888888BBB88
              0002088888877788080200000000000008800888888888808080200000000008
              0800220FFFFFFFF080802220F00000F000022220FFFFFFFF022222220F00000F
              022222220FFFFFFFF02222222000000000222222222222222222}
            OnClick = btnImprimirClick
            ExplicitLeft = 594
            ExplicitTop = -1
            ExplicitHeight = 25
          end
          object btnNegociar: TSpeedButton
            Left = 1023
            Top = 1
            Width = 91
            Height = 22
            Hint = 'Negociar t'#237'tulos pendentes'
            Align = alRight
            Caption = '&Negociar'
            Flat = True
            OnClick = btnNegociarClick
            ExplicitLeft = 791
            ExplicitTop = 0
          end
          object btnVisualizar: TSpeedButton
            Left = 932
            Top = 1
            Width = 91
            Height = 22
            Hint = 'Visualizar os t'#237'tulos em protesto'
            Align = alRight
            Caption = '&Visualizar Prot.'
            Flat = True
            OnClick = btnVisualizarClick
            ExplicitLeft = 569
          end
          object btnProtesto: TSpeedButton
            Left = 841
            Top = 1
            Width = 91
            Height = 22
            Hint = 'Protestar o t'#237'tulo selecionado'
            Align = alRight
            Caption = 'Gerar P&rotesto'
            Flat = True
            OnClick = btnProtestoClick
            ExplicitLeft = 646
          end
        end
      end
    end
    object tsHistorico: TTabSheet
      Caption = 'HIST'#211'RICO'
      ImageIndex = 3
      OnShow = tsHistoricoShow
      object Bevel8: TBevel
        Left = 0
        Top = 32
        Width = 1208
        Height = 3
        Align = alTop
        Shape = bsSpacer
        Style = bsRaised
        ExplicitWidth = 982
      end
      object Bevel9: TBevel
        Left = 0
        Top = 169
        Width = 1208
        Height = 4
        Align = alTop
        Shape = bsSpacer
        Style = bsRaised
        ExplicitWidth = 772
      end
      object DBGrid1: TDBGrid
        Left = 0
        Top = 173
        Width = 1208
        Height = 396
        Align = alClient
        BorderStyle = bsNone
        DataSource = dtcContatos
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -12
        Font.Name = 'Arial'
        Font.Style = []
        Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgConfirmDelete, dgCancelOnExit]
        ParentFont = False
        ReadOnly = True
        TabOrder = 0
        TitleFont.Charset = DEFAULT_CHARSET
        TitleFont.Color = clWindowText
        TitleFont.Height = -11
        TitleFont.Name = 'MS Sans Serif'
        TitleFont.Style = []
        OnDrawColumnCell = DBGrid1DrawColumnCell
        OnDblClick = DBGrid1DblClick
        OnTitleClick = grdTitleClick
        Columns = <
          item
            Expanded = False
            FieldName = 'DT_REGISTRO'
            Width = 110
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'NOME'
            Width = 150
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'DS_RESUMO'
            Title.Caption = 'Hist'#243'rico'
            Width = 360
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'DT_RETORNO'
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'DS_TELEFONE'
            Title.Caption = 'Telefone'
            Width = 150
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'NM_CONTATO'
            Width = 200
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'Anexo'
            Visible = True
          end>
      end
      object Panel9: TPanel
        Left = 0
        Top = 35
        Width = 1208
        Height = 134
        Align = alTop
        BevelOuter = bvLowered
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
        TabOrder = 1
        object Label14: TLabel
          Left = 9
          Top = 6
          Width = 53
          Height = 14
          Caption = 'Telefone:'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -12
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
        end
        object Label17: TLabel
          Left = 216
          Top = 5
          Width = 49
          Height = 16
          Caption = 'Contato:'
        end
        object Label20: TLabel
          Left = 12
          Top = 31
          Width = 50
          Height = 14
          Caption = 'Hist'#243'rico:'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -12
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
        end
        object Label22: TLabel
          Left = 12
          Top = 102
          Width = 50
          Height = 14
          Caption = 'Situa'#231#227'o:'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -12
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
        end
        object cbTelefone: TComboBox
          Left = 65
          Top = 3
          Width = 145
          Height = 22
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -12
          Font.Name = 'Tahoma'
          Font.Style = []
          ItemHeight = 14
          ParentFont = False
          Sorted = True
          TabOrder = 0
        end
        object cbContato: TComboBox
          Left = 268
          Top = 3
          Width = 169
          Height = 22
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -12
          Font.Name = 'Tahoma'
          Font.Style = []
          ItemHeight = 14
          ParentFont = False
          Sorted = True
          TabOrder = 1
        end
        object ckbRetorno: TCheckBox
          Left = 443
          Top = 6
          Width = 74
          Height = 17
          Caption = 'Retornar:'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -12
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
          TabOrder = 2
          OnClick = ckbRetornoClick
        end
        object dtRetorno: TDateTimePicker
          Left = 520
          Top = 3
          Width = 105
          Height = 22
          Date = 39289.000000000000000000
          Time = 39289.000000000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -12
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
          TabOrder = 3
        end
        object meHistorico: TMemo
          Left = 65
          Top = 31
          Width = 560
          Height = 62
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -12
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
          TabOrder = 4
        end
        object btnIncluir: TBitBtn
          Left = 554
          Top = 99
          Width = 71
          Height = 25
          Caption = 'Incluir'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -12
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
          TabOrder = 5
          OnClick = btnIncluirClick
          Glyph.Data = {
            36040000424D3604000000000000360000002800000010000000100000000100
            2000000000000004000000000000000000000000000000000000FF00FF00FF00
            FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
            FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
            FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
            FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
            FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
            FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
            FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
            FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
            FF00FF00FF00FF00FF00FF00FF00FF00FF00000000000000000000000000FF00
            FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
            FF00FF00FF00FF00FF00FF00FF00FF00FF0000000000FF00FF0000000000FF00
            FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
            FF00FF00FF00FF00FF00FF00FF00FF00FF0000000000FF00FF0000000000FF00
            FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
            FF00FF00FF0000000000000000000000000000000000FF00FF00000000000000
            00000000000000000000FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
            FF00FF00FF0000000000FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
            FF00FF00FF0000000000FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
            FF00FF00FF0000000000000000000000000000000000FF00FF00000000000000
            00000000000000000000FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
            FF00FF00FF00FF00FF00FF00FF00FF00FF0000000000FF00FF0000000000FF00
            FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
            FF00FF00FF00FF00FF00FF00FF00FF00FF0000000000FF00FF0000000000FF00
            FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
            FF00FF00FF00FF00FF00FF00FF00FF00FF00000000000000000000000000FF00
            FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
            FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
            FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
            FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
            FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
            FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
            FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00}
        end
        object cbSituacaoFinal: TComboBox
          Left = 65
          Top = 99
          Width = 486
          Height = 22
          Style = csOwnerDrawFixed
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -12
          Font.Name = 'Tahoma'
          Font.Style = []
          ItemHeight = 16
          ParentFont = False
          Sorted = True
          TabOrder = 6
        end
        object bbtnAnexar: TBitBtn
          Left = 631
          Top = 71
          Width = 121
          Height = 25
          Caption = 'Anexar'
          TabOrder = 7
          OnClick = bbtnAnexarClick
          Glyph.Data = {
            36030000424D3603000000000000360000002800000010000000100000000100
            18000000000000030000120B0000120B00000000000000000000FFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF84B094257341196B
            3725734184B094FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFF88B297288C5364BA8D95D2B264BA8D288C5381AE91FFFFFFFFFFFF
            F7F7F7CFCFCF7171715B5B5BAFAFAFF3F3F3FFFFFF22713F62BA8B60BA87FFFF
            FF60B98767BC8F20703DFFFFFFF9F9F9989898929292E7E7E7D7D7D76868685D
            5D5DEAEAEA317B4C9CD4B6FFFFFFFFFFFFFFFFFF95D2B2196B37FFFFFFE8E8E8
            848484F3F3F3FFFFFFFFFFFFE6E6E68C8C8C62626248896090D3B192D6B1FFFF
            FF65BC8C67BC8F20703DFFFFFFDFDFDF929292F3F3F3FFFFFFFFFFFFA9A9A9C2
            C2C294949459776461AB8195D4B4BAE6D06ABB8F2D8F5781AE91FFFFFFEFEFEF
            969696AFAFAFFEFEFEA1A1A1818181707070ABABAB9191915774615F98744F8E
            664A8A6199BDA6FFFFFFFFFFFFFFFFFFF2F2F29E9E9EB8B8B8B9B9B9D7D7D7FA
            FAFA7A7A7AACACAC909090575757E8E8E8FFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFF0F0F09E9E9EB6B6B6B4B4B4CDCDCDFAFAFA7A7A7AA7A7A79292925E5E
            5EEDEDEDFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF3F3F39C9C9CAFAFAFB4
            B4B4CACACAF5F5F5898989A9A9A99B9B9B666666F0F0F0FFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFF6F6F69B9B9BAEAEAEB2B2B2D5D5D5F9F9F98D8D8DACAC
            AC8787875D5D5DFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF7F7F7A5
            A5A5B0B0B0ABABABD7D7D7FFFFFFFFFFFFE4E4E4686868FFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF5F5F5A6A6A6B3B3B39D9D9DD6D6D6FFFF
            FFDFDFDF696969FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFF3F3F3A4A4A4A3A3A3979797A5A5A58E8E8EB7B7B7FFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF5F5F5A5A5A5AAAAAAE4E4
            E4E7E7E7FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF}
        end
        object bbtnDelAnexo: TBitBtn
          Left = 631
          Top = 99
          Width = 121
          Height = 25
          Caption = 'Remover anexo'
          TabOrder = 8
          OnClick = bbtnDelAnexoClick
          Glyph.Data = {
            36030000424D3603000000000000360000002800000010000000100000000100
            18000000000000030000120B0000120B00000000000000000000FFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF95B0E3235CC20543
            BC1F59C186A6DDFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFF8CABE12866CA2177E60579EA0164DD074FBE86A6DDFFFFFFFFFFFF
            F7F7F7CFCFCF7171715B5B5BAFAFAFF3F3F3FFFFFF1F59C1639DF4187FFF0076
            F80076EE0368E11E59C0FFFFFFF9F9F9989898929292E7E7E7D7D7D76868685D
            5D5DEAEAEA0543BCAECDFEFFFFFFFFFFFFFFFFFF187FEF0543BCFFFFFFE8E8E8
            848484F3F3F3FFFFFFFFFFFFE6E6E68C8C8C626262225AC08DB5F64D92FF1177
            FF2186FF408AEB245CC2FFFFFFDFDFDF929292F3F3F3FFFFFFFFFFFFA9A9A9C2
            C2C2949494415C8F3D76D28DB5F7B8D6FE72A8F52F6DCC94AFE2FFFFFFEFEFEF
            969696AFAFAFFEFEFEA1A1A1818181707070ABABAB9191913B56892860C50543
            BC205AC188A7DEFFFFFFFFFFFFFFFFFFF2F2F29E9E9EB8B8B8B9B9B9D7D7D7FA
            FAFA7A7A7AACACAC909090575757E8E8E8FFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFF0F0F09E9E9EB6B6B6B4B4B4CDCDCDFAFAFA7A7A7AA7A7A79292925E5E
            5EEDEDEDFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF3F3F39C9C9CAFAFAFB4
            B4B4CACACAF5F5F5898989A9A9A99B9B9B666666F0F0F0FFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFF6F6F69B9B9BAEAEAEB2B2B2D5D5D5F9F9F98D8D8DACAC
            AC8787875D5D5DFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF7F7F7A5
            A5A5B0B0B0ABABABD7D7D7FFFFFFFFFFFFE4E4E4686868FFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF5F5F5A6A6A6B3B3B39D9D9DD6D6D6FFFF
            FFDFDFDF696969FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFF3F3F3A4A4A4A3A3A3979797A5A5A58E8E8EB7B7B7FFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF5F5F5A5A5A5AAAAAAE4E4
            E4E7E7E7FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF}
        end
      end
      object Panel10: TPanel
        Left = 0
        Top = 0
        Width = 1208
        Height = 32
        Align = alTop
        BevelOuter = bvLowered
        TabOrder = 2
        object Label18: TLabel
          Left = 418
          Top = 8
          Width = 65
          Height = 13
          Caption = 'Respons'#225'vel:'
        end
        object Label19: TLabel
          Left = 16
          Top = 8
          Width = 98
          Height = 13
          Caption = 'Nome do Estudante:'
        end
        object txtHisNome: TEdit
          Left = 136
          Top = 8
          Width = 270
          Height = 18
          TabStop = False
          BorderStyle = bsNone
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
          ReadOnly = True
          TabOrder = 0
        end
        object txtHistResponsavel: TEdit
          Left = 489
          Top = 8
          Width = 270
          Height = 18
          TabStop = False
          BorderStyle = bsNone
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
          ReadOnly = True
          TabOrder = 1
        end
      end
    end
  end
  object qyCobranca: TUMZQuery
    Connection = DM.db
    AfterOpen = qyCobrancaAfterOpen
    OnCalcFields = qyCobrancaCalcFields
    SQL.Strings = (
      'SELECT'
      '   P.CD_PESSOA,'
      '   FIRST_OCCURRENCE(P.NM_PESSOA) NM_PESSOA,'
      '   FIRST_OCCURRENCE(P.DS_CARGO) CARGO,'
      '   FIRST_OCCURRENCE(R.NM_PESSOA) NM_RESP,'
      
        '   COALESCE(FIRST_OCCURRENCE(UP.NM_PESSOA), FIRST_OCCURRENCE(US.' +
        'NOME)) NM_USUARIO,'
      
        '   SUM(COALESCE(ME.VALORBRUTO, 0) + COALESCE(ME.VALOREXTRA, 0)) ' +
        'VL_BRUTO,'
      '   SUM(COALESCE(ME.DESCONTOEXTRA, 0)) VL_DESC_FIXO,'
      
        '   SUM(COALESCE(ME.VALORBRUTO, 0) + COALESCE(ME.VALOREXTRA, 0) +' +
        ' COALESCE(ME.VALORJUROS, 0) - COALESCE(ME.DESCONTOEXTRA, 0)) VL_' +
        'LIQUIDO,'
      
        '   SUM(COALESCE(ME.VALORBRUTO, 0) + COALESCE(ME.VALOREXTRA, 0) +' +
        ' COALESCE(ME.VALORJUROS, 0) - COALESCE(ME.DESCONTOEXTRA, 0) + CO' +
        'ALESCE(GET_ACRESCIMOS(ME.CD_MENSALIDADE, NULL), 0) - COALESCE(GE' +
        'T_DESCONTOS(ME.CD_MENSALIDADE, NULL), 0)) VL_ATUALIZADO,'
      
        '   CAST(FIRST_OCCURRENCE(CO.CD_COBRANCA) AS NUMBER(19)) CD_COBRA' +
        'NCA,'
      '   CAST(FIRST_OCCURRENCE(CO.CD_PESSOA) AS NUMBER(9)) CD_PESSOA,'
      
        '   CAST(FIRST_OCCURRENCE(CO.DT_REGISTRO) AS TIMESTAMP(2)) DT_REG' +
        'ISTRO,'
      
        '   CAST(FIRST_OCCURRENCE(CO.CD_SITUACAO) AS NUMBER(19)) CD_SITUA' +
        'CAO,'
      '   CAST(FIRST_OCCURRENCE(CO.SN_SPC) AS NUMBER(4)) SN_SPC,'
      
        '   CAST(FIRST_OCCURRENCE(CO.DT_SPC_INCLUSAO) AS TIMESTAMP(2)) DT' +
        '_SPC_INCLUSAO,'
      
        '   CAST(FIRST_OCCURRENCE(CO.DT_SPC_RETIRADA) AS TIMESTAMP(2)) DT' +
        '_SPC_RETIRADA,'
      
        '   CAST(FIRST_OCCURRENCE(CO.SN_JURIDICO) AS NUMBER(4)) SN_JURIDI' +
        'CO,'
      
        '   CAST(FIRST_OCCURRENCE(CO.DT_JURIDICO_INCLUSAO) AS TIMESTAMP(2' +
        ')) DT_JURIDICO_INCLUSAO,'
      
        '   CAST(FIRST_OCCURRENCE(CO.DT_JURIDICO_RETIRADA) AS TIMESTAMP(2' +
        ')) DT_JURIDICO_RETIRADA,'
      
        '   CAST(FIRST_OCCURRENCE(CO.CD_RESPONSAVEL) AS NUMBER(19)) CD_RE' +
        'SPONSAVEL,'
      
        '   CAST(FIRST_OCCURRENCE(CO.DT_RETORNO) AS TIMESTAMP(2)) DT_RETO' +
        'RNO,'
      '   FIRST_OCCURRENCE(SI.DS_VALOR) DS_SITUACAO,'
      '   FIRST_OCCURRENCE(SI.DS_SIGLA) DS_SIGLA,'
      '   CAST(MAX(ANOSEMESTRE) AS NUMBER(4)) ULTIMOANOSEMESTRE,'
      '   CAST(MIN(ANOSEMESTRE) AS NUMBER(4)) PRIMEIROANOSEMESTRE,'
      '   MAX(DATAVENCIMENTO) ULTIMOVENCIMENTO,'
      '   MIN(DATAVENCIMENTO) PRIMEIROVENCIMENTO,'
      '   CAST(COUNT(*) AS NUMBER(19)) QTDTITULOS'
      'FROM'
      '   PESSOAS P'
      '      JOIN FIN_COBRANCA CO ON'
      '         (P.CD_PESSOA = CO.CD_PESSOA)'
      '         JOIN SITUACOES SI ON'
      '            (CO.CD_SITUACAO = SI.CD_SITUACAO) AND'
      '            (SI.CD_MODULO = 2053)'
      '      LEFT JOIN MENSALIDADES ME ON'
      '         (P.CD_PESSOA = ME.CODIGOALUNO) AND'
      '         (ME.SITUACAO IN(2, 9))'
      
        '      LEFT JOIN TURMAS T ON (ME.turma = T.codigo and me.anosemes' +
        'tre = t.anosemestre)'
      '      LEFT JOIN PESSOAS R ON'
      '         (P.CD_RESP_FINAN = R.CD_PESSOA)'
      '         LEFT JOIN USUARIOS US ON'
      '            (US.CODIGO = CO.CD_RESPONSAVEL)'
      '            LEFT JOIN PESSOAS UP ON(US.CD_PESSOA = UP.CD_PESSOA)'
      'WHERE'
      '   1 = 1 AND'
      '   ME.DATAVENCIMENTO >= TO_DATE('#39'2011-01-01'#39', '#39'YYYY-MM-DD'#39') AND'
      '   ME.DATAVENCIMENTO <= TO_DATE('#39'2011-01-21'#39', '#39'YYYY-MM-DD'#39')'
      'GROUP BY'
      '   P.CD_PESSOA')
    Params = <>
    SQLList.Strings = (
      
        'oracle=SELECT'#13#10'   P.CD_PESSOA,'#13#10'   FIRST_OCCURRENCE(P.NM_PESSOA)' +
        ' NM_PESSOA,'#13#10'   FIRST_OCCURRENCE(P.DS_CARGO) CARGO,'#13#10'   FIRST_OC' +
        'CURRENCE(R.NM_PESSOA) NM_RESP,'#13#10'   COALESCE(FIRST_OCCURRENCE(UP.' +
        'NM_PESSOA), FIRST_OCCURRENCE(US.NOME)) NM_USUARIO,'#13#10'   SUM(COALE' +
        'SCE(ME.VALORBRUTO, 0) + COALESCE(ME.VALOREXTRA, 0)) VL_BRUTO,'#13#10' ' +
        '  SUM(COALESCE(ME.DESCONTOEXTRA, 0)) VL_DESC_FIXO,'#13#10'   SUM(COALE' +
        'SCE(ME.VALORBRUTO, 0) + COALESCE(ME.VALOREXTRA, 0) + COALESCE(ME' +
        '.VALORJUROS, 0) - COALESCE(ME.DESCONTOEXTRA, 0)) VL_LIQUIDO,'#13#10'  ' +
        ' SUM(COALESCE(ME.VALORBRUTO, 0) + COALESCE(ME.VALOREXTRA, 0) + C' +
        'OALESCE(ME.VALORJUROS, 0) - COALESCE(ME.DESCONTOEXTRA, 0) + COAL' +
        'ESCE(GET_ACRESCIMOS(ME.CD_MENSALIDADE, NULL), 0) - COALESCE(GET_' +
        'DESCONTOS(ME.CD_MENSALIDADE, NULL), 0)) VL_ATUALIZADO,'#13#10'   CAST(' +
        'FIRST_OCCURRENCE(CO.CD_COBRANCA) AS NUMBER(19)) CD_COBRANCA,'#13#10'  ' +
        ' CAST(FIRST_OCCURRENCE(CO.CD_PESSOA) AS NUMBER(9)) CD_PESSOA,'#13#10' ' +
        '  CAST(FIRST_OCCURRENCE(CO.DT_REGISTRO) AS TIMESTAMP(2)) DT_REGI' +
        'STRO,'#13#10'   CAST(FIRST_OCCURRENCE(CO.CD_SITUACAO) AS NUMBER(19)) C' +
        'D_SITUACAO,'#13#10'   CAST(FIRST_OCCURRENCE(CO.SN_SPC) AS NUMBER(4)) S' +
        'N_SPC,'#13#10'   CAST(FIRST_OCCURRENCE(CO.DT_SPC_INCLUSAO) AS TIMESTAM' +
        'P(2)) DT_SPC_INCLUSAO,'#13#10'   CAST(FIRST_OCCURRENCE(CO.DT_SPC_RETIR' +
        'ADA) AS TIMESTAMP(2)) DT_SPC_RETIRADA,'#13#10'   CAST(FIRST_OCCURRENCE' +
        '(CO.SN_JURIDICO) AS NUMBER(4)) SN_JURIDICO,'#13#10'   CAST(FIRST_OCCUR' +
        'RENCE(CO.DT_JURIDICO_INCLUSAO) AS TIMESTAMP(2)) DT_JURIDICO_INCL' +
        'USAO,'#13#10'   CAST(FIRST_OCCURRENCE(CO.DT_JURIDICO_RETIRADA) AS TIME' +
        'STAMP(2)) DT_JURIDICO_RETIRADA,'#13#10'   CAST(FIRST_OCCURRENCE(CO.CD_' +
        'RESPONSAVEL) AS NUMBER(19)) CD_RESPONSAVEL,'#13#10'   CAST(FIRST_OCCUR' +
        'RENCE(CO.DT_RETORNO) AS TIMESTAMP(2)) DT_RETORNO,'#13#10'   FIRST_OCCU' +
        'RRENCE(SI.DS_VALOR) DS_SITUACAO,'#13#10'   FIRST_OCCURRENCE(SI.DS_SIGL' +
        'A) DS_SIGLA,'#13#10'   MAX(ANOSEMESTRE) ULTIMOANOSEMESTRE,'#13#10'   MIN(ANO' +
        'SEMESTRE) PRIMEIROANOSEMESTRE,'#13#10'   MAX(DATAVENCIMENTO) ULTIMOVEN' +
        'CIMENTO,'#13#10'   MIN(DATAVENCIMENTO) PRIMEIROVENCIMENTO,'#13#10'   COUNT(*' +
        ') QTDTITULOS'#13#10'FROM'#13#10'   PESSOAS P'#13#10'      JOIN FIN_COBRANCA CO ON'#13 +
        #10'         (P.CD_PESSOA = CO.CD_PESSOA)'#13#10'         JOIN SITUACOES ' +
        'SI ON'#13#10'            (CO.CD_SITUACAO = SI.CD_SITUACAO) AND'#13#10'      ' +
        '      (SI.CD_MODULO = 2053)'#13#10'      LEFT JOIN MENSALIDADES ME ON'#13 +
        #10'         (P.CD_PESSOA = ME.CODIGOALUNO) AND'#13#10'         (ME.SITUA' +
        'CAO IN(2, 9))'#13#10'      LEFT JOIN PESSOAS R ON'#13#10'         (P.CD_RESP' +
        '_FINAN = R.CD_PESSOA)'#13#10'         LEFT JOIN USUARIOS US ON'#13#10'      ' +
        '      (US.CODIGO = CO.CD_RESPONSAVEL)'#13#10'            LEFT JOIN PES' +
        'SOAS UP ON(US.CD_PESSOA = UP.CD_PESSOA)'#13#10'WHERE'#13#10'   $FILTRO$'#13#10'GRO' +
        'UP BY'#13#10'   P.CD_PESSOA'
      
        'mysql-5=SELECT'#13#10'   P.CD_PESSOA,'#13#10'   P.NM_PESSOA,'#13#10'   P.DS_CARGO,' +
        #13#10'   R.NM_PESSOA,'#13#10'   COALESCE(UP.NM_PESSOA, US.NOME) NM_USUARIO' +
        ','#13#10'   SUM(COALESCE(ME.VALORBRUTO, 0) + COALESCE(ME.VALOREXTRA, 0' +
        ')) VL_BRUTO,'#13#10'   SUM(COALESCE(ME.DESCONTOEXTRA, 0)) VL_DESC_FIXO' +
        ','#13#10'   SUM(COALESCE(ME.VALORBRUTO, 0) + COALESCE(ME.VALOREXTRA, 0' +
        ') + COALESCE(ME.VALORJUROS, 0) - COALESCE(ME.DESCONTOEXTRA, 0)) ' +
        'VL_LIQUIDO,'#13#10'   SUM(COALESCE(ME.VALORBRUTO, 0) + COALESCE(ME.VAL' +
        'OREXTRA, 0) + COALESCE(ME.VALORJUROS, 0) - COALESCE(ME.DESCONTOE' +
        'XTRA, 0) + COALESCE(GET_ACRESCIMOS(ME.CD_MENSALIDADE, NULL), 0) ' +
        '- COALESCE(GET_DESCONTOS(ME.CD_MENSALIDADE, NULL), 0)) VL_ATUALI' +
        'ZADO,'#13#10'   CO.CD_COBRANCA,'#13#10'   CO.CD_PESSOA,'#13#10'   CO.DT_REGISTRO,'#13 +
        #10'   CO.CD_SITUACAO,'#13#10'   CO.SN_SPC,'#13#10'   CO.DT_SPC_INCLUSAO,'#13#10'   C' +
        'O.DT_SPC_RETIRADA,'#13#10'   CO.SN_JURIDICO,'#13#10'   CO.DT_JURIDICO_INCLUS' +
        'AO,'#13#10'   CO.DT_JURIDICO_RETIRADA,'#13#10'   CO.CD_RESPONSAVEL,'#13#10'   CO.D' +
        'T_RETORNO,'#13#10'   SI.DS_VALOR DS_SITUACAO,'#13#10'   SI.DS_SIGLA,'#13#10'   MAX' +
        '(ME.ANOSEMESTRE) ULTIMOANOSEMESTRE,'#13#10'   MIN(ME.ANOSEMESTRE) PRIM' +
        'EIROANOSEMESTRE,'#13#10'   MAX(DATAVENCIMENTO) ULTIMOVENCIMENTO,'#13#10'   M' +
        'IN(DATAVENCIMENTO) PRIMEIROVENCIMENTO,'#13#10'   COUNT(*) QTDTITULOS,'#13 +
        #10'   T.curso'#13#10'FROM'#13#10'   PESSOAS P'#13#10'      JOIN FIN_COBRANCA CO ON'#13#10 +
        '         (P.CD_PESSOA = CO.CD_PESSOA)'#13#10'         JOIN SITUACOES S' +
        'I ON'#13#10'            (CO.CD_SITUACAO = SI.CD_SITUACAO) AND'#13#10'       ' +
        '     (SI.CD_MODULO = 2053)'#13#10'      LEFT JOIN MENSALIDADES ME ON'#13#10 +
        '         (P.CD_PESSOA = ME.CODIGOALUNO) AND'#13#10'         (ME.SITUAC' +
        'AO IN(2, 9))'#13#10'      LEFT JOIN TURMAS T ON (ME.turma = T.codigo a' +
        'nd me.anosemestre = t.anosemestre)'#13#10'      LEFT JOIN PESSOAS R ON' +
        #13#10'         (P.CD_RESP_FINAN = R.CD_PESSOA)'#13#10'         LEFT JOIN U' +
        'SUARIOS US ON'#13#10'            (US.CODIGO = CO.CD_RESPONSAVEL)'#13#10'    ' +
        '        LEFT JOIN PESSOAS UP ON(US.CD_PESSOA = UP.CD_PESSOA)'#13#10'WH' +
        'ERE'#13#10'   $FILTRO$'#13#10'GROUP BY'#13#10'   P.CD_PESSOA')
    Left = 48
    object qyCobrancaCD_PESSOA: TIntegerField
      DisplayLabel = 'C'#243'd. Pessoa'
      FieldName = 'CD_PESSOA'
    end
    object qyCobrancaNM_PESSOA: TStringField
      Tag = 1
      DisplayLabel = 'Nome Estudante'
      DisplayWidth = 30
      FieldName = 'NM_PESSOA'
      ReadOnly = True
      Size = 4000
    end
    object qyCobrancaCARGO: TStringField
      FieldName = 'CARGO'
      ReadOnly = True
      Size = 4000
    end
    object qyCobrancaNM_RESP: TStringField
      Tag = 1
      DisplayLabel = 'Nome Respons'#225'vel'
      DisplayWidth = 30
      FieldName = 'NM_RESP'
      ReadOnly = True
      Size = 4000
    end
    object qyCobrancaNM_USUARIO: TStringField
      Tag = 1
      DisplayLabel = 'Usu'#225'rio'
      DisplayWidth = 20
      FieldName = 'NM_USUARIO'
      ReadOnly = True
      Size = 4000
    end
    object qyCobrancaVL_BRUTO: TFloatField
      Tag = 1
      DisplayLabel = 'Vl. Bruto'
      FieldName = 'VL_BRUTO'
      ReadOnly = True
      DisplayFormat = '###,###,##0.00'
    end
    object qyCobrancaVL_DESC_FIXO: TFloatField
      Tag = 1
      DisplayLabel = 'Vl. Bolsa'
      FieldName = 'VL_DESC_FIXO'
      ReadOnly = True
      DisplayFormat = '###,###,##0.00'
    end
    object qyCobrancaVL_LIQUIDO: TFloatField
      Tag = 1
      DisplayLabel = 'Vl. L'#237'quido'
      FieldName = 'VL_LIQUIDO'
      ReadOnly = True
      DisplayFormat = '###,###,##0.00'
    end
    object qyCobrancaVL_ATUALIZADO: TFloatField
      Tag = 1
      DisplayLabel = 'Vl. Atualizado'
      FieldName = 'VL_ATUALIZADO'
      ReadOnly = True
      DisplayFormat = '###,###,##0.00'
    end
    object qyCobrancaCD_COBRANCA: TLargeintField
      FieldName = 'CD_COBRANCA'
      ReadOnly = True
    end
    object qyCobrancaDT_REGISTRO: TDateTimeField
      Tag = 1
      DisplayLabel = 'Dt. Registro'
      FieldName = 'DT_REGISTRO'
      ReadOnly = True
    end
    object qyCobrancaCD_SITUACAO: TLargeintField
      FieldName = 'CD_SITUACAO'
      ReadOnly = True
    end
    object qyCobrancaSN_SPC: TSmallintField
      Tag = 1
      DisplayLabel = 'SPC'
      FieldName = 'SN_SPC'
      ReadOnly = True
      OnGetText = qyCobrancasn_spcGetText
    end
    object qyCobrancaDT_SPC_INCLUSAO: TDateTimeField
      Tag = 1
      DisplayLabel = 'Inclus'#227'o SPC'
      FieldName = 'DT_SPC_INCLUSAO'
      ReadOnly = True
    end
    object qyCobrancaDT_SPC_RETIRADA: TDateTimeField
      Tag = 1
      DisplayLabel = 'Retirada SPC'
      FieldName = 'DT_SPC_RETIRADA'
      ReadOnly = True
    end
    object qyCobrancaSN_JURIDICO: TSmallintField
      Tag = 1
      DisplayLabel = 'Jur'#237'dico'
      FieldName = 'SN_JURIDICO'
      ReadOnly = True
      OnGetText = qyCobrancasn_juridicoGetText
    end
    object qyCobrancaDT_JURIDICO_INCLUSAO: TDateTimeField
      Tag = 1
      DisplayLabel = 'Inclus'#227'o Jur'#237'dico'
      FieldName = 'DT_JURIDICO_INCLUSAO'
      ReadOnly = True
    end
    object qyCobrancaDT_JURIDICO_RETIRADA: TDateTimeField
      Tag = 1
      DisplayLabel = 'Retirada Jur'#237'dico'
      FieldName = 'DT_JURIDICO_RETIRADA'
      ReadOnly = True
    end
    object qyCobrancaCD_RESPONSAVEL: TLargeintField
      Tag = 1
      DisplayLabel = 'C'#243'digo do Resp.'
      FieldName = 'CD_RESPONSAVEL'
      ReadOnly = True
    end
    object qyCobrancaDT_RETORNO: TDateTimeField
      Tag = 1
      DisplayLabel = 'Dt. Retorno'
      FieldName = 'DT_RETORNO'
      ReadOnly = True
    end
    object qyCobrancaDS_SITUACAO: TStringField
      Tag = 1
      DisplayLabel = 'Situa'#231#227'o'
      DisplayWidth = 15
      FieldName = 'DS_SITUACAO'
      ReadOnly = True
      Size = 4000
    end
    object qyCobrancaDS_SIGLA: TStringField
      DisplayLabel = 'Sit.'
      DisplayWidth = 10
      FieldName = 'DS_SIGLA'
      ReadOnly = True
      Visible = False
      Size = 4000
    end
    object qyCobrancaULTIMOANOSEMESTRE: TSmallintField
      Tag = 1
      DisplayLabel = #218'ltimo Ano/Sem'
      FieldName = 'ULTIMOANOSEMESTRE'
      ReadOnly = True
    end
    object qyCobrancaPRIMEIROANOSEMESTRE: TSmallintField
      Tag = 1
      DisplayLabel = 'Primeiro Ano/Sem'
      FieldName = 'PRIMEIROANOSEMESTRE'
      ReadOnly = True
    end
    object qyCobrancaULTIMOVENCIMENTO: TDateTimeField
      Tag = 1
      DisplayLabel = #218'ltimo Vencimento'
      FieldName = 'ULTIMOVENCIMENTO'
      ReadOnly = True
    end
    object qyCobrancaPRIMEIROVENCIMENTO: TDateTimeField
      Tag = 1
      DisplayLabel = 'Primeiro Vencimento'
      FieldName = 'PRIMEIROVENCIMENTO'
      ReadOnly = True
    end
    object qyCobrancaQTDTITULOS: TLargeintField
      DisplayLabel = 'Qtd. T'#237'tulos'
      FieldName = 'QTDTITULOS'
      ReadOnly = True
    end
    object qyCobrancaDS_SERASA: TStringField
      DisplayLabel = 'SERASA.'
      FieldKind = fkCalculated
      FieldName = 'DS_SERASA'
      Size = 10
      Calculated = True
    end
    object qyCobrancasn_serasa: TSmallintField
      Tag = 1
      DisplayLabel = 'SERASA'
      FieldName = 'sn_serasa'
      OnGetText = qyCobrancasn_serasaGetText
    end
    object qyCobrancasn_cartorio: TIntegerField
      Tag = 1
      DisplayLabel = 'Cart'#243'rio'
      FieldName = 'sn_cartorio'
      OnGetText = qyCobrancasn_cartorioGetText
    end
    object qyCobrancaDT_SERASA_INCLUSAO: TDateField
      Tag = 1
      DisplayLabel = 'Inclus'#227'o SERASA'
      FieldName = 'DT_SERASA_INCLUSAO'
    end
    object qyCobrancaDT_SERASA_RETIRADA: TDateField
      Tag = 1
      DisplayLabel = 'Retirada SERASA'
      FieldName = 'DT_SERASA_RETIRADA'
    end
    object qyCobrancaDT_CARTORIO_INCLUSAO: TDateField
      Tag = 1
      DisplayLabel = 'Inclus'#227'o Cart'#243'rio'
      FieldName = 'DT_CARTORIO_INCLUSAO'
    end
    object qyCobrancaDT_CARTORIO_RETIRADA: TDateField
      Tag = 1
      DisplayLabel = 'Retirada Cart'#243'rio'
      FieldName = 'DT_CARTORIO_RETIRADA'
    end
    object qyCobrancaSERASA: TSmallintField
      FieldName = 'SERASA'
    end
    object qyCobrancacurso: TStringField
      Tag = 1
      DisplayLabel = 'Curso do Aluno'
      FieldName = 'curso'
      Size = 15
    end
  end
  object dtcCobranca: TDataSource
    AutoEdit = False
    DataSet = qyCobranca
    OnDataChange = dtcCobrancaDataChange
    Left = 80
  end
  object ImageList1: TImageList
    Left = 40
    Top = 416
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
      000000000000000000000000000000000000000000003F3F3F001F1F1F002222
      22001F1F1F008D8D8D00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000052A58C0000730800007B
      0800087B1000088418001084180010842100187B2900187B2900187B2900187B
      2900187B2900107318005AA5940000000000000000005AA5940010731800187B
      2900187B2900187B2900187B2900187B2900108421001084180008841800087B
      1000007B08000073080052A58C00000000003939390022222200FFFFFF00FFFF
      FF00FFFFFF002525250080808000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000006B000000940000009C
      000008A5080010A5100018A51800219C2100299C290029942900299429002994
      290029942900188C180010842100000000000000000010841000188C18002994
      2900299429002994290029942900299C2900219C210018A5180010A5100008A5
      0800009C00000094000000730800000000001C1C1C00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF002525250080808000FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000007B0000009C000008AD
      080010B5100018B5180021AD2100FFFFFF00A5D6A50039A53900399C3900399C
      3900319C310029942900188C29000000000000000000188C180029942900319C
      3100399C3900399C390039A53900A5D6A500FFFFFF0021AD210018B5180010B5
      100008AD0800009C0000007B0800000000001F1F1F00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF002626260080808000FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000007B000008A5080008B5
      080018B5180021B52100FFFFFF00FFFFFF00FFFFFF0042A5420042A542004AA5
      4A0042A54200399C390021943900000000000000000021942100399C390042A5
      42004AA54A0042A5420042A54200FFFFFF00FFFFFF00FFFFFF0021B5210018B5
      180008B5080008A5080008841000000000001F1F1F00FFFFFF00FFFFFF00FFFF
      FF006D6D6D00202020001B1B1B00FFFFFF002424240080808000FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000884080008A5080010AD
      100018B51800FFFFFF00FFFFFF00FFFFFF0042AD420042A542004AA54A004AA5
      4A004AA54A0042A542002994420000000000000000002994290042A542004AA5
      4A004AA54A004AA54A0042A5420042AD4200FFFFFF00FFFFFF00FFFFFF0018B5
      180010AD100008A5080008841800000000006F6F6F0020202000FFFFFF000000
      00001F1F1F00E5E5E5009E9E9E0018181800FFFFFF002424240080808000FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000001084100018A5180018AD
      1800FFFFFF00FFFFFF00FFFFFF0039AD390042AD42004AA54A004AAD4A0052AD
      520052AD52004AA54A00319C52000000000000000000319C31004AA54A0052AD
      520052AD52004AAD4A004AA54A0042AD420039AD3900FFFFFF00FFFFFF00FFFF
      FF0018AD180018A518001084210000000000FFFFFF006B6B6B001F1F1F00FFFF
      FF0029292900A0A0A000FFFFFF009191910018181800FFFFFF00222222007E7E
      7E00FFFFFF00FFFFFF00FFFFFF00FFFFFF000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000018841800189C1800FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF0052AD5200399C5A000000000000000000399C390052AD5200FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00189C18001884290000000000FFFFFF00FFFFFF006B6B6B001F1F
      1F00FFFFFF001F1F1F00A0A0A000FFFFFF00919191001E1E1E00FFFFFF002222
      22007E7E7E00FFFFFF00FFFFFF00FFFFFF000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000187B1800219C2100FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF005AAD5A00399C6300000000000000000042A542005AAD5A00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00219C21002184310000000000FFFFFF00FFFFFF00FFFFFF006B6B
      6B0020202000FFFFFF0022222200A0A0A000FFFFFF00919191001C1C1C00FFFF
      FF00222222007E7E7E00FFFFFF00FFFFFF000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000217B210029942900219C
      2100FFFFFF00FFFFFF00FFFFFF00319C3100399C39004AA54A0052A552005AAD
      5A0063AD630063B5630042A56B0000000000000000004AA54A0063B5630063AD
      63005AAD5A0052A552004AA54A00399C3900319C3100FFFFFF00FFFFFF00FFFF
      FF00219C2100299429002184310000000000FFFFFF00FFFFFF00FFFFFF00FFFF
      FF006B6B6B0024242400FFFFFF0022222200A0A0A000FFFFFF00919191001C1C
      1C00FFFFFF00222222008B8B8B00FFFFFF000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000217B210029942900299C
      290029942900FFFFFF00FFFFFF00FFFFFF00429C42004AA54A0052AD52005AAD
      5A006BB56B006BB56B0042A56B00000000000000000052AD52006BB56B006BB5
      6B005AAD5A0052AD52004AA54A00429C4200FFFFFF00FFFFFF00FFFFFF002994
      2900299C2900299429002184390000000000FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF006B6B6B0024242400FFFFFF0022222200A0A0A000FFFFFF009191
      91001C1C1C00FFFFFF0019191900FFFFFF000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000217B210029942900319C
      3100319C3100319C3100FFFFFF00FFFFFF00FFFFFF0052A552005AAD5A0063B5
      630073BD73007BBD7B004AA5730000000000000000005AAD5A007BBD7B0073BD
      730063B563005AAD5A0052A55200FFFFFF00FFFFFF00FFFFFF00319C3100319C
      3100319C3100299429002184390000000000FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF006B6B6B0024242400FFFFFF0022222200A0A0A000FFFF
      FF00919191001D1D1D00FFFFFF00FFFFFF000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000187B180031943100399C
      390042A542004AA54A004AA54A00FFFFFF00B5DEB50063AD630063B563006BB5
      6B0084C684008CC68C0052AD840000000000000000006BB56B008CC68C0084C6
      84006BB56B0063B5630063AD6300B5DEB500FFFFFF004AA54A004AA54A0042A5
      4200399C390031943100217B310000000000FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF007171710024242400FFFFFF0022222200FFFF
      FF00FFFFFF00818181001E1E1E00FFFFFF000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000187318002994290042A5
      42004AA54A0052AD52005AAD5A0063B5630063B563006BB56B0073BD73007BBD
      7B008CC68C009CCE9C0052AD8C00000000000000000073BD73009CCE9C008CC6
      8C007BBD7B0073BD73006BB56B0063B5630063B563005AAD5A0052AD52004AA5
      4A0042A5420029942900187B290000000000FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF007171710024242400FFFFFF00FFFF
      FF00FFFFFF00A0A0A0001F1F1F00FFFFFF000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000008CBD8C00218C2100319C
      3100399C390039A5390042A542004AA54A004AA54A004AA54A0052AD52005AAD
      5A0063B5630073BD730052ADA5000000000000000000B5DEB50073BD730063B5
      63005AAD5A0052AD52004AA54A004AA54A004AA54A0042A5420039A53900399C
      3900319C3100218C21005AAD940000000000FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF0046464600292929000000
      0000FFFFFF006D6D6D001F1F1F00FFFFFF000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00515151001F1F
      1F001F1F1F001F1F1F00B1B1B100FFFFFF000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
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
      00000000000000000000000000000000FFFFFFFF800000008001800100000000
      8001800100000000800180010000000080018001000000008001800110000000
      8001800100000000800180010000000080018001000000008001800100000000
      8001800100000000800180010000000080018001000000008001800100000000
      8001800100100000FFFFFFFF00000000FFFFF8F8FFFFFFFFF83FFAFAFC7FE3FF
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
  object qyAux: TUMZQuery
    Connection = DM.db
    SQL.Strings = (
      '')
    Params = <>
    Left = 128
  end
  object qyContatos: TUMZQuery
    Connection = DM.db
    SortedFields = 'DT_REGISTRO'
    SortType = stDescending
    UpdateObject = updContatos
    SQL.Strings = (
      'SELECT'
      '   C.CD_COBRANCA_CONTATO,'
      '   C.CD_COBRANCA,'
      '   C.DT_REGISTRO,'
      '   C.DT_RETORNO,'
      '   C.DS_CONTATO,'
      '   C.CD_USUARIO,'
      '   C.SN_RETORNO,'
      '   C.NM_CONTATO,'
      '   C.DS_TELEFONE,'
      '   C.BB_ANEXO,'
      '   U.NM_PESSOA NOME,'
      '   LEFT(DS_CONTATO, 240) DS_RESUMO'
      'FROM'
      '   FIN_COBRANCA_CONTATOS C'
      '      JOIN PESSOAS U ON'
      '         (C.CD_USUARIO = U.CD_PESSOA)'
      'WHERE'
      '   C.CD_COBRANCA = :CD_COBRANCA')
    Params = <
      item
        DataType = ftInteger
        Name = 'cd_cobranca'
        ParamType = ptUnknown
        Size = 4
      end>
    DataSource = dtcCobranca
    IndexFieldNames = 'DT_REGISTRO Desc'
    Left = 168
    ParamData = <
      item
        DataType = ftInteger
        Name = 'cd_cobranca'
        ParamType = ptUnknown
        Size = 4
      end>
    object qyContatosCD_COBRANCA_CONTATO: TLargeintField
      FieldName = 'CD_COBRANCA_CONTATO'
      Required = True
    end
    object qyContatosCD_COBRANCA: TLargeintField
      FieldName = 'CD_COBRANCA'
    end
    object qyContatosDT_REGISTRO: TDateTimeField
      DisplayLabel = 'Data de registro'
      FieldName = 'DT_REGISTRO'
      DisplayFormat = 'dd/mm/yyyy hh:nn'
    end
    object qyContatosDT_RETORNO: TDateTimeField
      DisplayLabel = 'Data de retorno'
      FieldName = 'DT_RETORNO'
      DisplayFormat = 'dd/mm/yyyy'
    end
    object qyContatosDS_CONTATO: TMemoField
      DisplayLabel = 'Hist'#243'rico do contato'
      FieldName = 'DS_CONTATO'
      BlobType = ftMemo
    end
    object qyContatosCD_USUARIO: TLargeintField
      FieldName = 'CD_USUARIO'
    end
    object qyContatosSN_RETORNO: TSmallintField
      FieldName = 'SN_RETORNO'
    end
    object qyContatosNM_CONTATO: TStringField
      DisplayLabel = 'Contato'
      FieldName = 'NM_CONTATO'
      Size = 50
    end
    object qyContatosDS_TELEFONE: TStringField
      FieldName = 'DS_TELEFONE'
      Size = 50
    end
    object qyContatosBB_ANEXO: TBlobField
      FieldName = 'BB_ANEXO'
    end
    object qyContatosNOME: TStringField
      DisplayLabel = 'Usu'#225'rio'
      FieldName = 'NOME'
      Size = 60
    end
    object qyContatosDS_RESUMO: TStringField
      FieldName = 'DS_RESUMO'
      ReadOnly = True
      Size = 240
    end
  end
  object dtcContatos: TDataSource
    AutoEdit = False
    DataSet = qyContatos
    OnStateChange = dtcContatosStateChange
    OnDataChange = dtcContatosDataChange
    Left = 200
  end
  object tblMensalidades: TUMZQuery
    Connection = DM.db
    AfterOpen = tblMensalidadesAfterOpen
    OnCalcFields = tblMensalidadesCalcFields
    SQL.Strings = (
      'select me.*'
      '     , LEFT(me.ds_obs_desc, 150) as ds_obs'
      '     , pe.nm_pessoa as NomeAluno'
      
        '     , CAST(COALESCE(me.cd_resp, pe.cd_resp_finan) AS  CHAR) as ' +
        'cd_resp_finan'
      '     , Resp.nm_pessoa as NomeResponsavel'
      '     , tt.ds_tipo_titulo'
      '     , pc.ds_conta'
      '     , cc.ds_centro'
      '     , bt.ds_bolsa'
      '     , mo.ds_sigla'
      '     , mp.ds_sigla as MoedaPgto'
      '     , sf.sn_protesto'
      '     , am.ds_acao'
      '     , GET_ACRESCIMOS(me.cd_mensalidade, NULL) as juros_calc'
      '     , GET_DESCONTOS(me.cd_mensalidade, NULL) as desconto_calc'
      '  FROM mensalidades me'
      ' INNER JOIN fin_moedas mo ON (me.cd_moeda = mo.cd_moeda)'
      
        ' INNER JOIN situacoes_financeiras sf ON ( me.situacao =  sf.cd_s' +
        'ituacao )'
      
        ' INNER JOIN Pessoas pe ON (me.CodigoAluno = pe.cd_pessoa ) LEFT ' +
        'JOIN pessoas Resp ON (COALESCE(me.cd_resp, pe.cd_resp_finan) = R' +
        'esp.cd_pessoa)'
      
        '  LEFT JOIN fin_tipos_titulo tt ON (me.cd_tipo_titulo = tt.cd_ti' +
        'po_titulo AND me.cd_coligada = tt.cd_coligada)'
      
        '  LEFT JOIN fin_plano_contas pc ON (me.cd_plano_conta = pc.cd_co' +
        'nta AND me.cd_coligada = pc.cd_coligada)'
      
        '  LEFT JOIN fin_centro_custos cc ON (me.cd_centro_custo = cc.cd_' +
        'centro AND me.cd_coligada = cc.cd_coligada)'
      '  LEFT JOIN fin_bolsas_tipos bt ON (me.cd_bolsa = bt.cd_bolsa)'
      '  LEFT JOIN fin_moedas mp ON (me.cd_moeda_pgto = mp.cd_moeda)'
      
        '  LEFT JOIN fin_acoes_movimento am ON (me.cd_desc_condicional = ' +
        'am.cd_acao and am.cd_tipo_acao = 3 and am.cd_origem = 1)'
      ' WHERE me.anosemestre = 20091'
      ' LIMIT 1')
    Params = <>
    Left = 288
    object tblMensalidadesParcela: TSmallintField
      Tag = 1
      DisplayLabel = 'Parc.'
      DisplayWidth = 5
      FieldName = 'Parcela'
      Origin = 'Mensalidades.Parcela'
    end
    object tblMensalidadesDataVencimento: TDateTimeField
      Tag = 1
      Alignment = taCenter
      DisplayLabel = 'Vencimento'
      DisplayWidth = 10
      FieldName = 'DataVencimento'
      Origin = 'Mensalidades.DataVencimento'
      DisplayFormat = 'dd/mm/yyyy'
    end
    object tblMensalidadesTurma: TStringField
      Tag = 1
      DisplayWidth = 50
      FieldName = 'Turma'
      Origin = 'Mensalidades.Turma'
      Size = 50
    end
    object tblMensalidadesDataEmissao: TDateTimeField
      Tag = 1
      DisplayLabel = 'Emiss'#227'o'
      DisplayWidth = 10
      FieldName = 'DataEmissao'
      Origin = 'Mensalidades.DataEmissao'
      DisplayFormat = 'dd/mm/yyyy'
    end
    object tblMensalidadesNossoNumero: TStringField
      Tag = 1
      DisplayLabel = 'Nosso N'#250'm.'
      DisplayWidth = 12
      FieldName = 'nossonumero'
      Origin = 'Mensalidades.NossoNumero'
      Size = 30
    end
    object tblMensalidadesValorBruto: TFloatField
      Tag = 1
      DisplayLabel = 'Vl. Bruto'
      DisplayWidth = 10
      FieldName = 'ValorBruto'
      Origin = 'Mensalidades.ValorBruto'
      DisplayFormat = '###,###,##0.00'
    end
    object tblMensalidadesDescontoExtra: TFloatField
      Tag = 1
      DisplayLabel = 'Desc. Extra'
      DisplayWidth = 10
      FieldName = 'DescontoExtra'
      Origin = 'Mensalidades.DescontoExtra'
      DisplayFormat = '###,###,##0.00'
    end
    object tblMensalidadesValorExtra: TFloatField
      Tag = 1
      DisplayLabel = 'Vl. Extra'
      DisplayWidth = 10
      FieldName = 'ValorExtra'
      Origin = 'Mensalidades.ValorExtra'
      DisplayFormat = '###,###,##0.00'
    end
    object tblMensalidadesValorTotal: TFloatField
      DisplayLabel = 'Vl. Total'
      FieldName = 'ValorTotal'
      Origin = 'Mensalidades.ValorTotal'
      DisplayFormat = '###,###,##0.00'
    end
    object tblMensalidadesValorJuros: TFloatField
      FieldName = 'ValorJuros'
      Origin = 'Mensalidades.ValorJuros'
      DisplayFormat = '###,###,##0.00'
    end
    object tblMensalidadesValorPago: TFloatField
      Tag = 1
      DisplayLabel = 'Vl. Pago'
      DisplayWidth = 10
      FieldName = 'ValorPago'
      Origin = 'Mensalidades.ValorPago'
      DisplayFormat = '###,###,##0.00'
    end
    object tblMensalidadesDataPagamento: TDateTimeField
      Tag = 1
      Alignment = taCenter
      DisplayLabel = 'Pagto.'
      DisplayWidth = 10
      FieldName = 'DataPagamento'
      Origin = 'Mensalidades.DataPagamento'
      DisplayFormat = 'dd/mm/yyyy'
    end
    object tblMensalidadesSituacao: TSmallintField
      FieldName = 'Situacao'
      Origin = 'Mensalidades.Situacao'
    end
    object tblMensalidadesUsuario: TStringField
      Tag = 1
      DisplayLabel = 'Usu'#225'rio'
      DisplayWidth = 10
      FieldName = 'Usuario'
      Origin = 'Mensalidades.Usuario'
      Size = 30
    end
    object tblMensalidadesValorDesconto: TFloatField
      Tag = 1
      DisplayLabel = 'Vl. Desc.'
      DisplayWidth = 10
      FieldName = 'ValorDesconto'
      Origin = 'Mensalidades.ValorDesconto'
      DisplayFormat = '###,###,##0.00'
    end
    object tblMensalidadesAnoSemestre: TSmallintField
      Tag = 1
      DisplayLabel = 'Ano/Sem.'
      DisplayWidth = 8
      FieldName = 'AnoSemestre'
      Origin = 'Mensalidades.AnoSemestre'
      DisplayFormat = '0000/0'
    end
    object tblMensalidadesDataBaseCorrecao: TDateTimeField
      FieldName = 'DataBaseCorrecao'
      Origin = 'Mensalidades.DataBaseCorrecao'
    end
    object tblMensalidadesIndiceCorrecao: TFloatField
      FieldName = 'IndiceCorrecao'
      Origin = 'Mensalidades.IndiceCorrecao'
    end
    object tblMensalidadesDescricaoSituacao: TStringField
      Tag = 1
      Alignment = taCenter
      DisplayLabel = 'Sit.'
      DisplayWidth = 6
      FieldKind = fkCalculated
      FieldName = 'DescricaoSituacao'
      Size = 30
      Calculated = True
    end
    object tblMensalidadesValorTotalCalc: TFloatField
      Tag = 1
      DisplayLabel = 'Vl. Total'
      DisplayWidth = 10
      FieldKind = fkCalculated
      FieldName = 'ValorTotalCalc'
      DisplayFormat = '###,###,##0.00'
      Calculated = True
    end
    object tblMensalidadesBloquetoImpresso: TStringField
      Tag = 1
      Alignment = taCenter
      DisplayLabel = 'Bloq.'
      FieldKind = fkCalculated
      FieldName = 'BloquetoImpresso'
      Size = 1
      Calculated = True
    end
    object tblMensalidadesNomeAluno: TStringField
      Tag = 1
      DisplayLabel = 'Aluno'
      DisplayWidth = 30
      FieldName = 'NomeAluno'
      Origin = 'Mensalidades.CodigoAluno'
      Size = 45
    end
    object tblMensalidadesDepto: TSmallintField
      Tag = 1
      DisplayLabel = 'Depto.'
      DisplayWidth = 1
      FieldName = 'Depto'
      Origin = 'Mensalidades.Parcela'
    end
    object tblMensalidadesValorJurosCalc: TFloatField
      Tag = 1
      DisplayLabel = 'Vl. Juros'
      FieldKind = fkCalculated
      FieldName = 'ValorJurosCalc'
      DisplayFormat = '###,###,##0.00'
      Calculated = True
    end
    object tblMensalidadesBloqueto: TStringField
      FieldName = 'Bloqueto'
      Origin = 'WMESTRE12.mensalidades.Bloqueto'
      Size = 1
    end
    object tblMensalidadesocorrencia_remessa: TSmallintField
      FieldName = 'ocorrencia_remessa'
      Origin = 'WMESTRE12.mensalidades.ocorrencia_remessa'
    end
    object tblMensalidadesocorrencia_retorno: TSmallintField
      FieldName = 'ocorrencia_retorno'
      Origin = 'WMESTRE12.mensalidades.ocorrencia_retorno'
    end
    object tblMensalidadessn_credito_parcela: TStringField
      Tag = 1
      DisplayLabel = 'CR'
      FieldName = 'sn_credito_parcela'
      Origin = 'WMESTRE12.mensalidades.sn_credito_parcela'
      FixedChar = True
      Size = 1
    end
    object tblMensalidadesnr_creditos: TFloatField
      Tag = 1
      DisplayLabel = 'N'#186' CR.'
      DisplayWidth = 4
      FieldName = 'nr_creditos'
      Origin = 'WMESTRE12.mensalidades.nr_creditos'
    end
    object tblMensalidadestipoparcela: TSmallintField
      Tag = 1
      DisplayLabel = 'Tipo Parc.'
      DisplayWidth = 5
      FieldName = 'tipoparcela'
      Origin = 'WMESTRE12.mensalidades.tipoparcela'
    end
    object tblMensalidadescurso: TStringField
      Tag = 1
      DisplayLabel = 'Curso'
      DisplayWidth = 10
      FieldName = 'curso'
      Origin = 'WMESTRE12.mensalidades.curso'
      Size = 15
    end
    object tblMensalidadescd_coligada: TSmallintField
      Tag = 1
      DisplayLabel = 'U.E.'
      DisplayWidth = 3
      FieldName = 'cd_coligada'
    end
    object tblMensalidadesNomeResponsavel: TStringField
      Tag = 1
      DisplayLabel = 'Nome Respons'#225'vel'
      DisplayWidth = 30
      FieldName = 'NomeResponsavel'
      Size = 60
    end
    object tblMensalidadesds_tipo_titulo: TStringField
      Tag = 1
      DisplayLabel = 'Tipo Tit.'
      DisplayWidth = 15
      FieldName = 'ds_tipo_titulo'
      Size = 255
    end
    object tblMensalidadesdt_competencia: TDateTimeField
      Tag = 1
      DisplayLabel = 'Compet'#234'ncia'
      DisplayWidth = 10
      FieldName = 'dt_competencia'
      DisplayFormat = 'dd/mm/yyyy'
    end
    object tblMensalidadesds_historico: TStringField
      Tag = 1
      DisplayLabel = 'Hist'#243'rico'
      DisplayWidth = 30
      FieldName = 'ds_historico'
      Size = 150
    end
    object tblMensalidadesds_conta: TStringField
      Tag = 1
      DisplayLabel = 'Plano de Contas'
      DisplayWidth = 15
      FieldName = 'ds_conta'
      Size = 255
    end
    object tblMensalidadesds_centro: TStringField
      Tag = 1
      DisplayLabel = 'Centro de Custo'
      DisplayWidth = 15
      FieldName = 'ds_centro'
      Size = 255
    end
    object tblMensalidadescd_caixa: TIntegerField
      Tag = 1
      DisplayLabel = 'Conta Boleto'
      FieldName = 'cd_caixa'
    end
    object tblMensalidadescd_resp: TIntegerField
      DisplayLabel = 'C'#243'd. Resp'
      FieldName = 'cd_resp'
    end
    object tblMensalidadescd_bolsa: TIntegerField
      Tag = 1
      DisplayLabel = 'C'#243'd. Bolsa'
      FieldName = 'cd_bolsa'
    end
    object tblMensalidadesds_bolsa: TStringField
      Tag = 1
      DisplayLabel = 'Bolsa'
      DisplayWidth = 30
      FieldName = 'ds_bolsa'
      Size = 100
    end
    object tblMensalidadesMoedaPgto: TStringField
      Tag = 1
      DisplayLabel = 'Pg.$'
      DisplayWidth = 3
      FieldName = 'MoedaPgto'
      Size = 3
    end
    object tblMensalidadesvl_pago_moeda: TFloatField
      Tag = 1
      DisplayLabel = 'Vl.Moeda Pgto'
      FieldName = 'vl_pago_moeda'
      DisplayFormat = '###,###,##0.00'
    end
    object tblMensalidadescd_tipo_titulo: TSmallintField
      FieldName = 'cd_tipo_titulo'
    end
    object tblMensalidadesPercDescExtra: TCurrencyField
      Tag = 1
      DisplayLabel = '% Desc. Fixo'
      FieldKind = fkCalculated
      FieldName = 'PercDescExtra'
      DisplayFormat = '##0.00 %'
      Calculated = True
    end
    object tblMensalidadesPercDescCond: TCurrencyField
      Tag = 1
      DisplayLabel = '% Desc. Cond.'
      FieldKind = fkCalculated
      FieldName = 'PercDescCond'
      DisplayFormat = '##0.00 %'
      Calculated = True
    end
    object tblMensalidadesValorDescontoCalc: TCurrencyField
      Tag = 1
      DisplayLabel = 'Desc.Cond.'
      FieldKind = fkCalculated
      FieldName = 'ValorDescontoCalc'
      DisplayFormat = '###,###,##0.00'
      Calculated = True
    end
    object tblMensalidadessn_liberar_juros: TSmallintField
      FieldName = 'sn_liberar_juros'
    end
    object tblMensalidadessn_liberar_descontos: TSmallintField
      FieldName = 'sn_liberar_descontos'
    end
    object tblMensalidadesvl_credito: TFloatField
      Tag = 1
      DisplayLabel = 'Vl. Cr'#233'dito'
      FieldName = 'vl_credito'
    end
    object tblMensalidadesdesconto_calc: TFloatField
      FieldName = 'desconto_calc'
    end
    object tblMensalidadesjuros_calc: TFloatField
      FieldName = 'juros_calc'
    end
    object tblMensalidadescd_resp_finan: TStringField
      Tag = 1
      DisplayLabel = 'C'#243'd. Resp.'
      DisplayWidth = 10
      FieldName = 'cd_resp_finan'
      Size = 10
    end
    object tblMensalidadescd_recibo: TIntegerField
      FieldName = 'cd_recibo'
    end
    object tblMensalidadescodigoaluno: TIntegerField
      DisplayLabel = 'C'#243'd.'
      FieldName = 'codigoaluno'
      DisplayFormat = '00000-0'
    end
    object tblMensalidadescd_mensalidade: TIntegerField
      DisplayLabel = 'C'#243'd. T'#237'tulo'
      FieldName = 'cd_mensalidade'
      Required = True
    end
    object tblMensalidadescd_mensalidade_origem: TIntegerField
      DisplayLabel = 'T'#237't. Origem'
      FieldName = 'cd_mensalidade_origem'
    end
    object tblMensalidadescd_centro_custo: TLargeintField
      DisplayLabel = 'C'#243'd. Centro'
      FieldName = 'cd_centro_custo'
      Required = True
    end
    object tblMensalidadescd_plano_conta: TLargeintField
      DisplayLabel = 'C'#243'd. Conta'
      FieldName = 'cd_plano_conta'
      Required = True
    end
    object tblMensalidadesDS_SIGLA: TStringField
      FieldName = 'DS_SIGLA'
      Size = 30
    end
  end
  object dtcMensalidades: TDataSource
    DataSet = tblMensalidades
    Left = 8
    Top = 416
  end
  object dsEmpresa: TDataSource
    DataSet = qyEmpresa
    Left = 352
  end
  object qyEmpresa: TUMZQuery
    Connection = DM.db
    SQL.Strings = (
      'SELECT'
      '   E.CD_EMPRESA,'
      '   E.NM_EMPRESA,'
      '   E.NM_RAZAO_SOCIAL,'
      '   E.DS_ENDERECO,'
      '   E.DS_COMPLEMENTO,'
      '   E.DS_BAIRRO,'
      '   E.DS_CIDADE,'
      '   E.DS_ESTADO,'
      '   E.DS_CEP,'
      '   E.NM_CONTATO,'
      '   E.DS_TELEFONE1,'
      '   E.DS_TELEFONE2,'
      '   E.DS_EMAIL,'
      '   E.DS_SITE,'
      '   E.CD_AREA_ATUACAO,'
      '   E.DS_CNPJ,'
      '   E.SN_CONVENIO,'
      '   E.CD_PESSOA_EMPRESA,'
      
        '   (COALESCE(E.DS_ENDERECO, '#39#39') || '#39' '#39' || COALESCE(E.DS_COMPLEME' +
        'NTO, '#39#39') || '#39'\nBairro: '#39' || COALESCE(E.DS_BAIRRO, '#39#39') || '#39'\nCEP:' +
        ' '#39' || COALESCE(E.DS_CEP, '#39#39') || '#39'\n Cidade: '#39' || E.DS_CIDADE || ' +
        #39'/'#39' || E.DS_ESTADO) DS_ENDERECO_COMPLETO'
      'FROM'
      '  EMPRESAS E'
      'WHERE'
      '  CD_EMPRESA = :CD_EMPRESA')
    Params = <
      item
        DataType = ftInteger
        Name = 'cd_empresa'
        ParamType = ptUnknown
      end>
    SQLList.Strings = (
      
        'oracle=SELECT'#13#10'   E.CD_EMPRESA,'#13#10'   E.NM_EMPRESA,'#13#10'   E.NM_RAZAO' +
        '_SOCIAL,'#13#10'   E.DS_ENDERECO,'#13#10'   E.DS_COMPLEMENTO,'#13#10'   E.DS_BAIRR' +
        'O,'#13#10'   E.DS_CIDADE,'#13#10'   E.DS_ESTADO,'#13#10'   E.DS_CEP,'#13#10'   E.NM_CONT' +
        'ATO,'#13#10'   E.DS_TELEFONE1,'#13#10'   E.DS_TELEFONE2,'#13#10'   E.DS_EMAIL,'#13#10'  ' +
        ' E.DS_SITE,'#13#10'   E.CD_AREA_ATUACAO,'#13#10'   E.DS_CNPJ,'#13#10'   E.SN_CONVE' +
        'NIO,'#13#10'   E.CD_PESSOA_EMPRESA,'#13#10'   (COALESCE(E.DS_ENDERECO, '#39#39') |' +
        '| '#39' '#39' || COALESCE(E.DS_COMPLEMENTO, '#39#39') || '#39'\nBairro: '#39' || COALE' +
        'SCE(E.DS_BAIRRO, '#39#39') || '#39'\nCEP: '#39' || COALESCE(E.DS_CEP, '#39#39') || '#39 +
        '\n Cidade: '#39' || E.DS_CIDADE || '#39'/'#39' || E.DS_ESTADO) DS_ENDERECO_C' +
        'OMPLETO'#13#10'FROM'#13#10'  EMPRESAS E'#13#10'WHERE'#13#10'  CD_EMPRESA = :CD_EMPRESA'
      
        'mysql-5=SELECT'#13#10'   E.CD_EMPRESA,'#13#10'   E.NM_EMPRESA,'#13#10'   E.NM_RAZA' +
        'O_SOCIAL,'#13#10'   E.DS_ENDERECO,'#13#10'   E.DS_COMPLEMENTO,'#13#10'   E.DS_BAIR' +
        'RO,'#13#10'   E.DS_CIDADE,'#13#10'   E.DS_ESTADO,'#13#10'   E.DS_CEP,'#13#10'   E.NM_CON' +
        'TATO,'#13#10'   E.DS_TELEFONE1,'#13#10'   E.DS_TELEFONE2,'#13#10'   E.DS_EMAIL,'#13#10' ' +
        '  E.DS_SITE,'#13#10'   E.CD_AREA_ATUACAO,'#13#10'   E.DS_CNPJ,'#13#10'   E.SN_CONV' +
        'ENIO,'#13#10'   E.CD_PESSOA_EMPRESA,'#13#10'   CONCAT(COALESCE(E.DS_ENDERECO' +
        ', '#39#39'), '#39' '#39', COALESCE(E.DS_COMPLEMENTO, '#39#39'), '#39'\n'#39', '#39'Bairro: '#39', CO' +
        'ALESCE(E.DS_BAIRRO, '#39#39'), '#39'\n'#39', '#39'CEP: '#39', COALESCE(E.DS_CEP, '#39#39'), ' +
        #39'\n'#39', '#39'Cidade: '#39', CONCAT(E.DS_CIDADE, '#39'/'#39', E.DS_ESTADO)) DS_ENDE' +
        'RECO_COMPLETO'#13#10'FROM '#13#10'  EMPRESAS E'#13#10'WHERE'#13#10'  CD_EMPRESA = :CD_EM' +
        'PRESA')
    Left = 320
    ParamData = <
      item
        DataType = ftInteger
        Name = 'cd_empresa'
        ParamType = ptUnknown
      end>
    object qyEmpresaCD_EMPRESA: TIntegerField
      FieldName = 'CD_EMPRESA'
    end
    object qyEmpresaNM_EMPRESA: TStringField
      FieldName = 'NM_EMPRESA'
      Size = 80
    end
    object qyEmpresaNM_RAZAO_SOCIAL: TStringField
      FieldName = 'NM_RAZAO_SOCIAL'
      Size = 80
    end
    object qyEmpresaDS_ENDERECO: TStringField
      FieldName = 'DS_ENDERECO'
      Size = 80
    end
    object qyEmpresaDS_COMPLEMENTO: TStringField
      FieldName = 'DS_COMPLEMENTO'
      Size = 50
    end
    object qyEmpresaDS_BAIRRO: TStringField
      FieldName = 'DS_BAIRRO'
      Size = 50
    end
    object qyEmpresaDS_CIDADE: TStringField
      FieldName = 'DS_CIDADE'
      Size = 50
    end
    object qyEmpresaDS_ESTADO: TStringField
      FieldName = 'DS_ESTADO'
      Size = 3
    end
    object qyEmpresaDS_CEP: TStringField
      FieldName = 'DS_CEP'
      Size = 8
    end
    object qyEmpresaNM_CONTATO: TStringField
      FieldName = 'NM_CONTATO'
      Size = 80
    end
    object qyEmpresaDS_TELEFONE1: TStringField
      FieldName = 'DS_TELEFONE1'
      Size = 25
    end
    object qyEmpresaDS_TELEFONE2: TStringField
      FieldName = 'DS_TELEFONE2'
      Size = 25
    end
    object qyEmpresaDS_EMAIL: TStringField
      FieldName = 'DS_EMAIL'
      Size = 100
    end
    object qyEmpresaDS_SITE: TStringField
      FieldName = 'DS_SITE'
      Size = 100
    end
    object qyEmpresaCD_AREA_ATUACAO: TIntegerField
      FieldName = 'CD_AREA_ATUACAO'
    end
    object qyEmpresaDS_CNPJ: TStringField
      FieldName = 'DS_CNPJ'
      Size = 14
    end
    object qyEmpresaSN_CONVENIO: TSmallintField
      FieldName = 'SN_CONVENIO'
    end
    object qyEmpresaCD_PESSOA_EMPRESA: TIntegerField
      FieldName = 'CD_PESSOA_EMPRESA'
    end
    object qyEmpresaDS_ENDERECO_COMPLETO: TStringField
      FieldName = 'DS_ENDERECO_COMPLETO'
      ReadOnly = True
      Size = 270
    end
  end
  object qryDadosDevedor: TUMZReadOnlyQuery
    Connection = DM.db
    SQL.Strings = (
      'SELECT'
      '   P.CD_PESSOA,'
      '   P.NM_PESSOA,'
      '   R.CD_PESSOA CD_RESP_FINAN,'
      '   R.NM_PESSOA NM_RESP,'
      '   R.DS_CPF,'
      
        '   COALESCE(R.DS_LOGRADOURO, '#39#39') || '#39' '#39' || COALESCE(R.DS_LOGRADO' +
        'URO_NRO, '#39#39') || CHR(10) || '#39' Bairro: '#39' || COALESCE(R.DS_BAIRRO, ' +
        #39#39') || CHR(10) || '#39' Cidade: '#39' || COALESCE(R.DS_CIDADE, '#39#39') || '#39'/' +
        #39' || COALESCE(R.DS_ESTADO, '#39#39') || CHR(10) || '#39' CEP: '#39' || COALESC' +
        'E(R.DS_CEP, '#39#39') DS_ENDERECO,'
      '   P.CD_EMPRESA'
      'FROM'
      '   PESSOAS P'
      '      LEFT JOIN PESSOAS R ON'
      '         (P.CD_RESP_FINAN = R.CD_PESSOA)'
      'WHERE'
      '   P.CD_PESSOA = :CD_PESSOA')
    Params = <
      item
        DataType = ftUnknown
        Name = 'CD_PESSOA'
        ParamType = ptUnknown
      end>
    Properties.Strings = (
      '')
    SQLList.Strings = (
      
        'mysql-5=SELECT'#13#10'   P.CD_PESSOA,'#13#10'   P.NM_PESSOA,'#13#10'   R.CD_PESSOA' +
        ' CD_RESP_FINAN,'#13#10'   R.NM_PESSOA NM_RESP,'#13#10'   R.DS_CPF,'#13#10'   CONCA' +
        'T('#13#10#9#9'COALESCE(R.DS_LOGRADOURO, '#39#39'),'#13#10#9#9#39' '#39','#13#10#9#9'COALESCE(R.DS_LO' +
        'GRADOURO_NRO, '#39#39'),'#13#10#9#9#39' '#39','#13#10#9#9'COALESCE(R.ds_complemento,'#39#39'),'#13#10#9#9 +
        #39' \n'#39','#13#10#9#9#39'Bairro: '#39','#13#10#9#9'COALESCE(R.DS_BAIRRO, '#39#39'),'#13#10#9#9#39' \n'#39','#13#10#9 +
        #9#39'Cidade: '#39','#13#10#9#9'COALESCE(R.DS_CIDADE, '#39#39'),'#13#10#9#9#39'/'#39','#13#10#9#9'COALESCE(R' +
        '.DS_ESTADO, '#39#39'),'#13#10#9#9#39' \n'#39','#13#10#9#9#39'CEP: '#39','#13#10#9#9'COALESCE(R.DS_CEP, '#39#39')' +
        #13#10#9')DS_ENDERECO,'#13#10'   P.CD_EMPRESA'#13#10'FROM'#13#10'   PESSOAS P'#13#10'      LEF' +
        'T JOIN PESSOAS R ON'#13#10'         (P.CD_RESP_FINAN = R.CD_PESSOA)'#13#10'W' +
        'HERE'#13#10'   P.CD_PESSOA = :CD_PESSOA'
      
        'oracle=SELECT'#13#10'   P.CD_PESSOA,'#13#10'   P.NM_PESSOA,'#13#10'   R.CD_PESSOA ' +
        'CD_RESP_FINAN,'#13#10'   R.NM_PESSOA NM_RESP,'#13#10'   R.DS_CPF,'#13#10'   COALES' +
        'CE(R.DS_LOGRADOURO, '#39#39') || '#39' '#39' || COALESCE(R.DS_LOGRADOURO_NRO, ' +
        #39#39') || CHR(10) || '#39' Bairro: '#39' || COALESCE(R.DS_BAIRRO, '#39#39') || CH' +
        'R(10) || '#39' Cidade: '#39' || COALESCE(R.DS_CIDADE, '#39#39') || '#39'/'#39' || COAL' +
        'ESCE(R.DS_ESTADO, '#39#39') || CHR(10) || '#39' CEP: '#39' || COALESCE(R.DS_CE' +
        'P, '#39#39') DS_ENDERECO,'#13#10'   P.CD_EMPRESA'#13#10'FROM'#13#10'   PESSOAS P'#13#10'      ' +
        'LEFT JOIN PESSOAS R ON'#13#10'         (P.CD_RESP_FINAN = R.CD_PESSOA)' +
        #13#10'WHERE'#13#10'   P.CD_PESSOA = :CD_PESSOA')
    Left = 56
    Top = 272
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'CD_PESSOA'
        ParamType = ptUnknown
      end>
    object qryDadosDevedorCD_PESSOA: TIntegerField
      FieldName = 'CD_PESSOA'
    end
    object qryDadosDevedorNM_PESSOA: TStringField
      FieldName = 'NM_PESSOA'
      Size = 60
    end
    object qryDadosDevedorCD_RESP_FINAN: TIntegerField
      FieldName = 'CD_RESP_FINAN'
    end
    object qryDadosDevedorNM_RESP: TStringField
      FieldName = 'NM_RESP'
      Size = 60
    end
    object qryDadosDevedorDS_CPF: TStringField
      FieldName = 'DS_CPF'
      Size = 11
    end
    object qryDadosDevedorDS_ENDERECO: TStringField
      FieldName = 'DS_ENDERECO'
      ReadOnly = True
      Size = 302
    end
    object qryDadosDevedorCD_EMPRESA: TIntegerField
      FieldName = 'CD_EMPRESA'
    end
  end
  object qryContatosDevedor: TUMZReadOnlyQuery
    Connection = DM.db
    SQL.Strings = (
      'SELECT DISTINCT'
      '   CASE'
      '      WHEN C.CD_PESSOA = P.CD_PESSOA THEN '#39'Estudante: '#39
      '      ELSE '#39'Respons'#225'vel: '#39
      '   END'
      '   || T.DS_CONTATO || '#39':  '#39' || C.DS_CONTATO DS_CONTATO,'
      '   C.CD_PESSOA'
      'FROM'
      '   PESSOAS P'
      '      JOIN CONTATOS_PESSOAS C ON'
      '         (P.CD_PESSOA = C.CD_PESSOA) OR'
      '         (P.CD_RESP_FINAN = C.CD_PESSOA)'
      '         JOIN CONTATOS_TIPOS T ON'
      '            (C.CD_CONTATO = T.CD_CONTATO)'
      'WHERE'
      '   P.CD_PESSOA = :CD_PESSOA AND'
      '   TRIM(COALESCE(C.DS_CONTATO, '#39#39')) <> '#39#39
      'ORDER BY'
      '   (C.CD_PESSOA = P.CD_PESSOA)')
    Params = <
      item
        DataType = ftUnknown
        Name = 'CD_PESSOA'
        ParamType = ptUnknown
      end>
    SQLList.Strings = (
      
        'mysql-5=SELECT DISTINCT'#13#10#9'CASE'#13#10#9#9'WHEN C.CD_PESSOA = P.CD_PESSOA' +
        ' THEN'#13#10#9#9#9'CONCAT('#13#10#9#9#9#9#39'Estudante: '#39','#13#10#9#9#9#9'T.DS_CONTATO,'#13#10#9#9#9#9#39':' +
        '  '#39','#13#10#9#9#9#9'C.DS_CONTATO'#13#10#9#9#9')'#13#10#9#9'ELSE'#13#10#9#9'CONCAT('#13#10#9#9#9#9#39'Respons'#225've' +
        'l: '#39','#13#10#9#9#9#9'T.DS_CONTATO,'#13#10#9#9#9#9#39':  '#39','#13#10#9#9#9#9'C.DS_CONTATO'#13#10#9#9')'#13#10#9'EN' +
        'D DS_CONTATO,'#13#10#9'C.CD_PESSOA'#13#10'FROM'#13#10#9'PESSOAS P'#13#10'      JOIN CONTAT' +
        'OS_PESSOAS C ON'#13#10'         (P.CD_PESSOA = C.CD_PESSOA) OR'#13#10'      ' +
        '   (P.CD_RESP_FINAN = C.CD_PESSOA)'#13#10'         JOIN CONTATOS_TIPOS' +
        ' T ON'#13#10'            (C.CD_CONTATO = T.CD_CONTATO)'#13#10'WHERE'#13#10'   P.CD' +
        '_PESSOA = :CD_PESSOA AND'#13#10'   TRIM(COALESCE(C.DS_CONTATO, '#39#39')) <>' +
        ' '#39#39#13#10'AND T.CD_CONTATO <> 8'#13#10'ORDER BY'#13#10'   (C.CD_PESSOA = P.CD_PES' +
        'SOA)'
      
        'oracle=SELECT DISTINCT'#13#10'   CASE'#13#10'      WHEN C.CD_PESSOA = P.CD_P' +
        'ESSOA THEN '#39'Estudante: '#39#13#10'      ELSE '#39'Respons'#225'vel: '#39#13#10'   END'#13#10'  ' +
        ' || T.DS_CONTATO || '#39':  '#39' || C.DS_CONTATO DS_CONTATO,'#13#10'   C.CD_P' +
        'ESSOA,'#13#10'   P.CD_PESSOA CD_PESSOA_COMPARACAO_ORDER'#13#10'FROM'#13#10'   PESS' +
        'OAS P'#13#10'      JOIN CONTATOS_PESSOAS C ON'#13#10'         (P.CD_PESSOA =' +
        ' C.CD_PESSOA) OR'#13#10'         (P.CD_RESP_FINAN = C.CD_PESSOA)'#13#10'    ' +
        '     JOIN CONTATOS_TIPOS T ON'#13#10'            (C.CD_CONTATO = T.CD_' +
        'CONTATO)'#13#10'WHERE'#13#10'   P.CD_PESSOA = :CD_PESSOA AND'#13#10'   TRIM(COALES' +
        'CE(C.DS_CONTATO, '#39#39')) <> '#39#39#13#10'AND T.CD_CONTATO <> 8'#13#10'ORDER BY'#13#10'  ' +
        ' CASE WHEN (C.CD_PESSOA = P.CD_PESSOA) THEN'#13#10#9#9'1'#13#10#9'ELSE'#13#10#9#9'0'#13#10#9'E' +
        'ND')
    Left = 56
    Top = 304
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'CD_PESSOA'
        ParamType = ptUnknown
      end>
    object qryContatosDevedorDS_CONTATO: TStringField
      FieldName = 'DS_CONTATO'
      ReadOnly = True
      Size = 122
    end
  end
  object qryContatosTel: TUMZReadOnlyQuery
    Connection = DM.db
    SQL.Strings = (
      'SELECT'
      '   C.DS_CONTATO'
      'FROM'
      '   CONTATOS_PESSOAS C'
      '      JOIN CONTATOS_TIPOS T ON'
      '         (C.CD_CONTATO = T.CD_CONTATO)'
      'WHERE'
      '   C.CD_PESSOA = :CD_PESSOA AND'
      '   TRIM(COALESCE(C.DS_CONTATO, '#39#39')) <> '#39#39
      'ORDER BY'
      '   T.CD_CONTATO')
    Params = <
      item
        DataType = ftUnknown
        Name = 'CD_PESSOA'
        ParamType = ptUnknown
      end>
    Left = 56
    Top = 336
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'CD_PESSOA'
        ParamType = ptUnknown
      end>
    object qryContatosTelDS_CONTATO: TStringField
      FieldName = 'DS_CONTATO'
      Size = 100
    end
  end
  object pmProtestos: TPopupMenu
    OnPopup = pmProtestosPopup
    Left = 602
    Top = 480
  end
  object updContatos: TZUpdateSQL
    ModifySQL.Strings = (
      'UPDATE FIN_COBRANCA_CONTATOS'
      'SET'
      '   BB_ANEXO = :BB_ANEXO'
      'WHERE'
      '   CD_COBRANCA_CONTATO = :CD_COBRANCA_CONTATO')
    UseSequenceFieldForRefreshSQL = False
    Left = 432
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'BB_ANEXO'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'CD_COBRANCA_CONTATO'
        ParamType = ptUnknown
      end>
  end
end
