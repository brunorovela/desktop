object FormEasyInnerOnLine: TFormEasyInnerOnLine
  Left = 278
  Top = 243
  Caption = 'Configura'#231#227'o do Equipamento'
  ClientHeight = 572
  ClientWidth = 1267
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  FormStyle = fsMDIChild
  OldCreateOrder = False
  Position = poScreenCenter
  Visible = True
  OnClose = FormClose
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object PRodapeFundo: TPanel
    Left = 0
    Top = 516
    Width = 1267
    Height = 56
    Align = alBottom
    TabOrder = 0
    object PRodapeEsquerda: TPanel
      Left = 1
      Top = 1
      Width = 1008
      Height = 35
      Align = alClient
      BevelOuter = bvNone
      TabOrder = 0
      ExplicitHeight = 37
      object cmdSaida: TButton
        Left = 88
        Top = 5
        Width = 75
        Height = 25
        Caption = 'Sa'#237'da'
        TabOrder = 0
        OnClick = cmdSaidaClick
      end
      object cmdEntrada: TButton
        Left = 8
        Top = 5
        Width = 75
        Height = 25
        Caption = 'Entrada'
        TabOrder = 1
        OnClick = cmdEntradaClick
      end
      object cmdLimpar: TButton
        Left = 168
        Top = 5
        Width = 75
        Height = 25
        Caption = 'Limpar'
        TabOrder = 2
        OnClick = cmdLimparClick
      end
    end
    object PRodapeClient: TPanel
      Left = 1009
      Top = 1
      Width = 257
      Height = 35
      Align = alRight
      BevelOuter = bvNone
      BiDiMode = bdLeftToRight
      ParentBiDiMode = False
      TabOrder = 1
      ExplicitHeight = 39
      object cmdParar: TButton
        Left = 96
        Top = 4
        Width = 74
        Height = 26
        Caption = 'Parar'
        TabOrder = 0
        OnClick = cmdPararClick
      end
      object cmdIniciar: TButton
        Left = 174
        Top = 4
        Width = 71
        Height = 26
        Caption = 'Iniciar'
        TabOrder = 1
        OnClick = cmdIniciarClick
      end
    end
    object TStatus: TStatusBar
      Left = 1
      Top = 36
      Width = 1265
      Height = 19
      BiDiMode = bdLeftToRight
      Panels = <
        item
          Alignment = taRightJustify
          BiDiMode = bdLeftToRight
          ParentBiDiMode = False
          Width = 500
        end>
      ParentBiDiMode = False
      ExplicitTop = 38
    end
  end
  object PGeralLeft: TPanel
    Left = 0
    Top = 0
    Width = 641
    Height = 516
    Align = alLeft
    TabOrder = 1
    ExplicitHeight = 509
    object PFundoOpcoes: TPanel
      Left = 1
      Top = 1
      Width = 639
      Height = 291
      Align = alTop
      BevelOuter = bvNone
      TabOrder = 0
      object GroupBox1: TGroupBox
        Left = 0
        Top = 0
        Width = 639
        Height = 291
        Align = alClient
        Caption = 'Configura'#231#245'es'
        TabOrder = 0
        object lblInners: TLabel
          Left = 9
          Top = 19
          Width = 87
          Height = 13
          Caption = 'N'#250'mero de Inners:'
        end
        object lblNumDig: TLabel
          Left = 9
          Top = 43
          Width = 92
          Height = 13
          Caption = 'N'#250'mero de D'#237'gitos:'
        end
        object lblPorta: TLabel
          Left = 9
          Top = 68
          Width = 28
          Height = 13
          Caption = 'Porta:'
        end
        object Label1: TLabel
          Left = 9
          Top = 93
          Width = 69
          Height = 13
          Caption = 'Tipo Conex'#227'o:'
        end
        object Label2: TLabel
          Left = 277
          Top = 98
          Width = 53
          Height = 13
          Caption = 'Tipo Leitor:'
        end
        object Label3: TLabel
          Left = 26
          Top = 172
          Width = 56
          Height = 13
          Caption = 'Par'#226'metros:'
        end
        object lblCatraca: TLabel
          Left = 11
          Top = 149
          Width = 194
          Height = 13
          Caption = 'Ao entrar, a catraca est'#225' instalada '#224' sua:'
          Enabled = False
        end
        object imgCatraca: TImage
          Left = 347
          Top = 145
          Width = 65
          Height = 57
          Stretch = True
        end
        object lblTipoEquipamento: TLabel
          Left = 10
          Top = 120
          Width = 89
          Height = 13
          Caption = 'Tipo Equipamento:'
        end
        object cboTipoConexao: TComboBox
          Left = 104
          Top = 92
          Width = 145
          Height = 21
          Style = csDropDownList
          ItemHeight = 0
          TabOrder = 0
          OnChange = cboTipoConexaoChange
        end
        object txtPorta: TEdit
          Left = 104
          Top = 68
          Width = 49
          Height = 21
          MaxLength = 5
          TabOrder = 1
          Text = '3570'
        end
        object txtNumInners: TEdit
          Left = 104
          Top = 19
          Width = 49
          Height = 21
          MaxLength = 5
          TabOrder = 2
          Text = '1'
        end
        object txtNumDigitos: TEdit
          Left = 104
          Top = 43
          Width = 49
          Height = 21
          MaxLength = 2
          TabOrder = 3
          Text = '14'
        end
        object chkBiometrico: TCheckBox
          Left = 179
          Top = 187
          Width = 65
          Height = 17
          Caption = 'Biometria'
          TabOrder = 4
          OnClick = chkBiometricoClick
        end
        object chkVerificacao: TCheckBox
          Left = 180
          Top = 223
          Width = 74
          Height = 17
          Caption = 'Verifica'#231#227'o'
          Enabled = False
          TabOrder = 5
          OnClick = chkVerificacaoClick
        end
        object chkIdentificacao: TCheckBox
          Left = 180
          Top = 241
          Width = 82
          Height = 17
          Caption = 'Identifica'#231#227'o'
          Enabled = False
          TabOrder = 6
        end
        object chkTeclado: TCheckBox
          Left = 96
          Top = 206
          Width = 60
          Height = 17
          Caption = 'Teclado'
          Checked = True
          State = cbChecked
          TabOrder = 7
        end
        object cboTipoLeitor: TComboBox
          Left = 336
          Top = 92
          Width = 185
          Height = 21
          ItemHeight = 0
          TabOrder = 8
          OnChange = cboTipoLeitorChange
        end
        object chkDoisLeitores: TCheckBox
          Left = 536
          Top = 95
          Width = 81
          Height = 17
          Caption = '2 Leitores?'
          Enabled = False
          TabOrder = 9
        end
        object chkLista: TCheckBox
          Left = 96
          Top = 188
          Width = 79
          Height = 17
          Caption = 'Lista OffLine'
          TabOrder = 10
        end
        object chkListaBio: TCheckBox
          Left = 180
          Top = 204
          Width = 120
          Height = 17
          Caption = 'Lista sem Bio OffLine'
          Enabled = False
          TabOrder = 11
          OnClick = chkListaBioClick
        end
        object GroupBox3: TGroupBox
          Left = 416
          Top = 128
          Width = 193
          Height = 137
          Caption = 'Vers'#227'o'
          TabOrder = 12
          Visible = False
          object lblVersao: TLabel
            Left = 8
            Top = 16
            Width = 177
            Height = 113
            AutoSize = False
            Caption = 'lblVersao'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -7
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ParentFont = False
            WordWrap = True
          end
        end
        object rdbPadraoLivre: TRadioButton
          Left = 193
          Top = 23
          Width = 84
          Height = 17
          Caption = 'Padr'#227'o &Livre'
          Checked = True
          TabOrder = 13
          TabStop = True
        end
        object rdbPadraoTopdata: TRadioButton
          Left = 193
          Top = 47
          Width = 99
          Height = 17
          Caption = 'Padr'#227'o &Topdata'
          TabOrder = 14
          OnClick = rdbPadraoTopdataClick
        end
        object TGroupBox
          Left = 206
          Top = 140
          Width = 136
          Height = 33
          Color = clBtnFace
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clMenuText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentColor = False
          ParentFont = False
          TabOrder = 15
          object optEsquerda: TRadioButton
            Left = 4
            Top = 11
            Width = 73
            Height = 17
            Caption = 'Esquerda'
            Enabled = False
            TabOrder = 0
            OnClick = optEsquerdaClick
          end
          object optDireita: TRadioButton
            Left = 79
            Top = 11
            Width = 55
            Height = 17
            Caption = 'Direita'
            Enabled = False
            TabOrder = 1
            OnClick = optDireitaClick
          end
        end
        object cboEquipamento: TComboBox
          Left = 104
          Top = 117
          Width = 205
          Height = 21
          Style = csDropDownList
          ItemHeight = 13
          TabOrder = 16
          OnChange = cboEquipamentoChange
          Items.Strings = (
            'Coletor'
            'Catraca 2 Sentidos'
            'Catraca para Entrada'
            'Catraca para Sa'#237'da'
            'Catraca Sa'#237'da Liberada'
            'Catraca Entrada Liberada'
            'Catraca Liberada 2 Sentidos'
            'Catraca Sentido Giro')
        end
        object chkCartaoMaster: TCheckBox
          Left = 24
          Top = 235
          Width = 97
          Height = 14
          Caption = 'Cart'#227'o Master'
          TabOrder = 17
          OnClick = chkCartaoMasterClick
        end
        object txtCatraoMaster: TEdit
          Left = 24
          Top = 252
          Width = 105
          Height = 21
          Enabled = False
          TabOrder = 18
          Text = '0'
        end
      end
    end
    object PLogsCatracas: TPanel
      Left = 1
      Top = 292
      Width = 639
      Height = 223
      Align = alClient
      BevelOuter = bvNone
      TabOrder = 1
      ExplicitHeight = 216
      object lstBilhetes: TListBox
        Left = 0
        Top = 24
        Width = 639
        Height = 199
        Align = alClient
        ItemHeight = 13
        TabOrder = 0
      end
      object Panel1: TPanel
        Left = 0
        Top = 0
        Width = 639
        Height = 24
        Align = alTop
        BevelKind = bkTile
        BevelOuter = bvNone
        Caption = 'Logs'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
        TabOrder = 1
      end
    end
  end
  object PGeralAll: TPanel
    Left = 641
    Top = 0
    Width = 626
    Height = 516
    Align = alClient
    TabOrder = 2
    ExplicitHeight = 509
    object GBCatracas: TGroupBox
      Left = 1
      Top = 1
      Width = 624
      Height = 514
      Align = alClient
      Caption = 'Catracas'
      TabOrder = 0
      ExplicitHeight = 507
      object TGridCatraca: TStringGrid
        Left = 2
        Top = 15
        Width = 620
        Height = 497
        Align = alClient
        ColCount = 2
        FixedCols = 0
        RowCount = 2
        TabOrder = 0
        ExplicitHeight = 490
      end
    end
  end
  object TTimerBanco: TTimer
    Interval = 600000
    OnTimer = TTimerBancoTimer
    Left = 576
    Top = 360
  end
  object TTimerCatracas: TTimer
    Enabled = False
    Interval = 1
    OnTimer = TTimerCatracasTimer
    Left = 544
    Top = 360
  end
  object TTimerStatusBanco: TTimer
    Interval = 5000
    OnTimer = TTimerStatusBancoTimer
    Left = 608
    Top = 360
  end
end
