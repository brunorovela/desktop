object frmMensalidadesBaixar: TfrmMensalidadesBaixar
  Left = 0
  Top = 0
  AutoSize = True
  BorderIcons = [biSystemMenu, biMinimize]
  BorderStyle = bsSingle
  Caption = 'Mensalidade'
  ClientHeight = 803
  ClientWidth = 827
  Color = clBtnFace
  Font.Charset = ANSI_CHARSET
  Font.Color = clBlack
  Font.Height = -13
  Font.Name = 'Tahoma'
  Font.Style = []
  KeyPreview = True
  OldCreateOrder = False
  Position = poMainFormCenter
  OnClose = FormClose
  OnCreate = FormCreate
  OnKeyDown = FormKeyDown
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 16
  object pnTitulo: TPanel
    Left = 0
    Top = 0
    Width = 827
    Height = 25
    Align = alTop
    Caption = 'BAIXA DE T'#205'TULOS'
    Color = clBlue
    Font.Charset = ANSI_CHARSET
    Font.Color = clWhite
    Font.Height = -15
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 1
  end
  object pnParcelas: TPanel
    Left = 0
    Top = 25
    Width = 827
    Height = 264
    Align = alTop
    BevelOuter = bvNone
    Font.Charset = ANSI_CHARSET
    Font.Color = clBlack
    Font.Height = -13
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
    TabOrder = 0
    object lbinfoSelecioneTitulos: TLabel
      Left = 8
      Top = 3
      Width = 221
      Height = 16
      Caption = 'Selecione os t'#237'tulos que deseja baixar:'
      Font.Charset = ANSI_CHARSET
      Font.Color = clBlack
      Font.Height = -13
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
    end
    object lbTroco: TLabel
      Left = 599
      Top = 195
      Width = 38
      Height = 16
      Caption = 'Troco:'
    end
    object lbVlTotal: TLabel
      Left = 599
      Top = 120
      Width = 130
      Height = 16
      Caption = 'Valor Total a Receber:'
    end
    object lbDataBaixa: TLabel
      Left = 599
      Top = 51
      Width = 83
      Height = 16
      Caption = 'Data da Baixa:'
      Font.Charset = ANSI_CHARSET
      Font.Color = clBlack
      Font.Height = -13
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
    end
    object lbContaCaixa: TLabel
      Left = 599
      Top = 5
      Width = 118
      Height = 16
      Caption = 'Conta da Baixa (F3):'
      Font.Charset = ANSI_CHARSET
      Font.Color = clBlack
      Font.Height = -13
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
    end
    object pnPgtoDinheiroCheque: TPanel
      Left = 8
      Top = 187
      Width = 384
      Height = 72
      BevelInner = bvLowered
      TabOrder = 3
      object lblTD: TLabel
        Left = 359
        Top = 45
        Width = 16
        Height = 16
        Hint = 'Tal'#227'o de Dep'#243'sito'
        Caption = 'TD'
        ParentShowHint = False
        ShowHint = True
      end
      object chkDinheiro: TCheckBox
        Left = 195
        Top = 7
        Width = 150
        Height = 17
        Caption = 'Dinheiro (F5)'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Height = -13
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
        TabOrder = 2
        OnClick = chkDinheiroClick
        OnKeyPress = chkDinheiroKeyPress
      end
      object txtDinheiro: TUMEditMonetario
        Left = 195
        Top = 25
        Width = 158
        Height = 39
        BevelKind = bkFlat
        BorderStyle = bsNone
        Enabled = False
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Height = -29
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
        TabOrder = 3
        Text = '0,00'
        OnExit = txtDinheiroExit
        Mascara = '###,###,##0.00'
        CasasDecimais = 2
        EnterProximoCampo = True
      end
      object chkCheque: TCheckBox
        Left = 13
        Top = 7
        Width = 150
        Height = 17
        Caption = 'Cheque (F4)'
        Color = clBtnFace
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Height = -13
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentColor = False
        ParentFont = False
        TabOrder = 0
        OnClick = chkChequeClick
        OnKeyPress = chkChequeKeyPress
      end
      object txtCheque: TUMEditMonetario
        Left = 13
        Top = 25
        Width = 158
        Height = 39
        BevelKind = bkFlat
        BorderStyle = bsNone
        Enabled = False
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Height = -29
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
        ReadOnly = True
        TabOrder = 1
        Text = '0,00'
        OnExit = txtChequeExit
        Mascara = '###,###,##0.00'
        CasasDecimais = 2
        EnterProximoCampo = True
      end
      object chkTD: TCheckBox
        Left = 362
        Top = 27
        Width = 16
        Height = 17
        Hint = 'Tal'#227'o de Dep'#243'sito'
        ParentShowHint = False
        ShowHint = True
        TabOrder = 4
        OnClick = chkTDClick
      end
    end
    object pnPgtoCartao: TPanel
      Left = 398
      Top = 187
      Width = 185
      Height = 72
      BevelInner = bvLowered
      TabOrder = 4
      object chkCartao: TCheckBox
        Left = 18
        Top = 7
        Width = 150
        Height = 17
        Caption = 'Cart'#227'o'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Height = -13
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
        TabOrder = 0
        OnClick = chkCartaoClick
        OnKeyPress = chkCartaoKeyPress
      end
      object txtCartao: TUMEditMonetario
        Left = 18
        Top = 25
        Width = 150
        Height = 39
        BevelKind = bkFlat
        BorderStyle = bsNone
        Enabled = False
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Height = -29
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
        TabOrder = 1
        Text = '0,00'
        Mascara = '###,###,##0.00'
        CasasDecimais = 2
        EnterProximoCampo = True
      end
    end
    object tabParcelas: TTabControl
      Left = 8
      Top = 20
      Width = 575
      Height = 163
      Cursor = crHandPoint
      Font.Charset = ANSI_CHARSET
      Font.Color = clBlack
      Font.Height = -12
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
      ParentShowHint = False
      PopupMenu = popMnuMenuGridPessoa
      ShowHint = False
      TabOrder = 0
      OnChange = tabParcelasChange
      OnMouseDown = tabParcelasMouseDown
      object edObservacao: TEdit
        Left = 4
        Top = 6
        Width = 567
        Height = 153
        Align = alClient
        TabOrder = 1
        ExplicitHeight = 22
      end
      object sgGridParcelas: TStringGrid
        Tag = -1
        Left = 4
        Top = 6
        Width = 567
        Height = 153
        Align = alClient
        ColCount = 9
        DefaultColWidth = 50
        DefaultRowHeight = 20
        FixedCols = 0
        RowCount = 2
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = []
        Options = [goFixedVertLine, goFixedHorzLine, goVertLine, goHorzLine, goRangeSelect, goEditing, goTabs]
        ParentFont = False
        TabOrder = 0
        OnClick = sgGridParcelasClick
        OnDrawCell = sgGridParcelasDrawCell
        OnExit = sgGridParcelasExit
        OnKeyDown = sgGridParcelasKeyDown
        OnKeyPress = sgGridParcelasKeyPress
        OnSelectCell = sgGridParcelasSelectCell
        OnSetEditText = sgGridParcelasSetEditText
      end
    end
    object txtTroco: TUMEditMonetario
      Left = 599
      Top = 212
      Width = 218
      Height = 41
      BevelKind = bkFlat
      BorderStyle = bsNone
      Color = clSilver
      Enabled = False
      Font.Charset = ANSI_CHARSET
      Font.Color = clBlack
      Font.Height = -29
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
      ReadOnly = True
      TabOrder = 6
      Text = '0,00'
      OnKeyPress = txtTrocoKeyPress
      Mascara = '###,###,##0.00'
      CasasDecimais = 2
      EnterProximoCampo = True
    end
    object txtVlTotal: TUMEditMonetario
      Left = 599
      Top = 139
      Width = 218
      Height = 42
      BevelKind = bkFlat
      BorderStyle = bsNone
      Color = 16771538
      Font.Charset = ANSI_CHARSET
      Font.Color = clBlack
      Font.Height = -29
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
      ReadOnly = True
      TabOrder = 5
      Text = '0,00'
      OnExit = txtVlTotalExit
      OnKeyPress = txtVlTotalKeyPress
      Mascara = '###,###,##0.00'
      CasasDecimais = 2
      EnterProximoCampo = True
    end
    object txtDataBaixa: TMaskEdit
      Left = 599
      Top = 71
      Width = 218
      Height = 43
      BevelKind = bkSoft
      EditMask = '!99/99/9999;1; '
      Font.Charset = ANSI_CHARSET
      Font.Color = clBlack
      Font.Height = -29
      Font.Name = 'Tahoma'
      Font.Style = []
      MaxLength = 10
      ParentFont = False
      TabOrder = 2
      Text = '  /  /    '
      OnExit = txtDataBaixaExit
      OnKeyPress = txtDataBaixaKeyPress
    end
    object cmbContaCaixa: TUMComboBox
      Left = 599
      Top = 21
      Width = 218
      Height = 24
      Style = csDropDownList
      ItemHeight = 16
      TabOrder = 1
      OnChange = cmbContaCaixaChange
      OnClick = cmbContaCaixaClick
      OnKeyPress = cmbContaCaixaKeyPress
      OnMouseEnter = cmbContaCaixaMouseEnter
      TamanhoMaximo = 0
      SelecionarUnicoAutomatico = False
    end
  end
  object pnCheques: TPanel
    Left = 0
    Top = 289
    Width = 827
    Height = 162
    Align = alTop
    Enabled = False
    Font.Charset = ANSI_CHARSET
    Font.Color = clBlack
    Font.Height = -13
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentFont = False
    TabOrder = 2
    object lbNrBanco: TLabel
      Left = 8
      Top = 28
      Width = 63
      Height = 13
      Caption = 'N'#186' do Banco:'
      Font.Charset = ANSI_CHARSET
      Font.Color = clBlack
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
    end
    object lbNrAgencia: TLabel
      Left = 135
      Top = 28
      Width = 72
      Height = 13
      Caption = 'N'#186' da Ag'#234'ncia:'
      Font.Charset = ANSI_CHARSET
      Font.Color = clBlack
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
    end
    object lbNrCC: TLabel
      Left = 262
      Top = 28
      Width = 48
      Height = 13
      Caption = 'N'#186' da CC:'
      Font.Charset = ANSI_CHARSET
      Font.Color = clBlack
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
    end
    object lbNrCheque: TLabel
      Left = 389
      Top = 28
      Width = 71
      Height = 13
      Caption = 'N'#186' do Cheque:'
      Font.Charset = ANSI_CHARSET
      Font.Color = clBlack
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
    end
    object lbVlCheque: TLabel
      Left = 516
      Top = 28
      Width = 83
      Height = 13
      Caption = 'Valor do Cheque:'
      Font.Charset = ANSI_CHARSET
      Font.Color = clBlack
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
    end
    object lbDtCompensacao: TLabel
      Left = 611
      Top = 28
      Width = 71
      Height = 13
      Caption = 'Compensa'#231#227'o:'
      Font.Charset = ANSI_CHARSET
      Font.Color = clBlack
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
    end
    object Label1: TLabel
      Left = 688
      Top = 28
      Width = 79
      Height = 13
      Caption = 'Nome do Titular:'
      Font.Charset = ANSI_CHARSET
      Font.Color = clBlack
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
    end
    object sgGridCheques: TStringGrid
      Left = 8
      Top = 72
      Width = 664
      Height = 85
      ColCount = 7
      DefaultColWidth = 105
      DefaultRowHeight = 20
      FixedCols = 0
      RowCount = 2
      Font.Charset = ANSI_CHARSET
      Font.Color = clBlack
      Font.Height = -13
      Font.Name = 'Tahoma'
      Font.Style = []
      Options = [goFixedVertLine, goFixedHorzLine, goVertLine, goHorzLine, goRangeSelect, goEditing, goTabs]
      ParentFont = False
      TabOrder = 9
      OnDrawCell = sgGridChequesDrawCell
      OnKeyDown = sgGridChequesKeyDown
      OnKeyPress = sgGridChequesKeyPress
      OnSelectCell = sgGridChequesSelectCell
      OnSetEditText = sgGridChequesSetEditText
    end
    object txtNrBanco: TEdit
      Left = 8
      Top = 43
      Width = 121
      Height = 21
      Font.Charset = ANSI_CHARSET
      Font.Color = clBlack
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
      TabOrder = 1
      OnKeyPress = txtNrBancoKeyPress
    end
    object txtNrAgencia: TEdit
      Left = 135
      Top = 43
      Width = 121
      Height = 21
      Font.Charset = ANSI_CHARSET
      Font.Color = clBlack
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
      TabOrder = 2
      OnKeyPress = txtNrAgenciaKeyPress
    end
    object txtNrCC: TEdit
      Left = 262
      Top = 43
      Width = 121
      Height = 21
      Font.Charset = ANSI_CHARSET
      Font.Color = clBlack
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
      TabOrder = 3
      OnKeyPress = txtNrCCKeyPress
    end
    object txtNrCheque: TEdit
      Left = 389
      Top = 43
      Width = 121
      Height = 21
      Font.Charset = ANSI_CHARSET
      Font.Color = clBlack
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
      TabOrder = 4
      OnKeyPress = txtNrChequeKeyPress
    end
    object txtVlCheque: TUMEditMonetario
      Left = 516
      Top = 43
      Width = 83
      Height = 21
      Font.Charset = ANSI_CHARSET
      Font.Color = clBlack
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
      TabOrder = 5
      Text = '0,00'
      Mascara = '###,###,##0.00'
      CasasDecimais = 2
      EnterProximoCampo = True
    end
    object btnInserir: TBitBtn
      Left = 678
      Top = 72
      Width = 85
      Height = 25
      Caption = '&Inserir'
      Font.Charset = ANSI_CHARSET
      Font.Color = clBlack
      Font.Height = -13
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
      TabOrder = 7
      OnClick = btnInserirClick
      Glyph.Data = {
        76010000424D7601000000000000760000002800000020000000100000000100
        04000000000000010000130B0000130B00001000000000000000000000000000
        800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333333333333
        33333333FF33333333FF333993333333300033377F3333333777333993333333
        300033F77FFF3333377739999993333333333777777F3333333F399999933333
        33003777777333333377333993333333330033377F3333333377333993333333
        3333333773333333333F333333333333330033333333F33333773333333C3333
        330033333337FF3333773333333CC333333333FFFFF77FFF3FF33CCCCCCCCCC3
        993337777777777F77F33CCCCCCCCCC3993337777777777377333333333CC333
        333333333337733333FF3333333C333330003333333733333777333333333333
        3000333333333333377733333333333333333333333333333333}
      NumGlyphs = 2
    end
    object btnExcluir: TBitBtn
      Left = 678
      Top = 102
      Width = 85
      Height = 25
      Caption = '&Excluir'
      Font.Charset = ANSI_CHARSET
      Font.Color = clBlack
      Font.Height = -13
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
      TabOrder = 8
      OnClick = btnExcluirClick
      Glyph.Data = {
        76010000424D7601000000000000760000002800000020000000100000000100
        04000000000000010000130B0000130B00001000000000000000000000000000
        800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333333333333
        333333333333333333FF33333333333330003333333333333777333333333333
        300033FFFFFF3333377739999993333333333777777F3333333F399999933333
        3300377777733333337733333333333333003333333333333377333333333333
        3333333333333333333F333333333333330033333F33333333773333C3333333
        330033337F3333333377333CC3333333333333F77FFFFFFF3FF33CCCCCCCCCC3
        993337777777777F77F33CCCCCCCCCC399333777777777737733333CC3333333
        333333377F33333333FF3333C333333330003333733333333777333333333333
        3000333333333333377733333333333333333333333333333333}
      NumGlyphs = 2
    end
    object txtDtCompensacao: TMaskEdit
      Left = 611
      Top = 43
      Width = 71
      Height = 21
      EditMask = '!99/99/9999;1; '
      Font.Charset = ANSI_CHARSET
      Font.Color = clBlack
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = []
      MaxLength = 10
      ParentFont = False
      TabOrder = 6
      Text = '  /  /    '
      OnKeyPress = txtDtCompensacaoKeyPress
      OnKeyUp = txtDtCompensacaoKeyUp
    end
    object pnTituloCheque: TPanel
      Left = 1
      Top = 1
      Width = 825
      Height = 25
      Align = alTop
      Caption = 'DADOS DO CHEQUE'
      Color = clBlue
      Font.Charset = ANSI_CHARSET
      Font.Color = clWhite
      Font.Height = -15
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 0
    end
    object ednm_titular: TEdit
      Left = 688
      Top = 43
      Width = 129
      Height = 21
      Font.Charset = ANSI_CHARSET
      Font.Color = clBlack
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
      TabOrder = 10
      OnKeyPress = txtNrChequeKeyPress
    end
  end
  object pnBotoes: TPanel
    Left = 0
    Top = 753
    Width = 827
    Height = 50
    Align = alTop
    TabOrder = 5
    object btnBaixar: TBitBtn
      Left = 1
      Top = 1
      Width = 400
      Height = 48
      Align = alLeft
      Caption = 'BAIXAR (F9)'
      Enabled = False
      Font.Charset = ANSI_CHARSET
      Font.Color = clBlack
      Font.Height = -27
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
      TabOrder = 0
      OnClick = btnBaixarClick
    end
    object btnCancelar: TBitBtn
      Left = 401
      Top = 1
      Width = 425
      Height = 48
      Align = alClient
      Caption = 'CANCELAR (F12)'
      Font.Charset = ANSI_CHARSET
      Font.Color = clBlack
      Font.Height = -27
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
      TabOrder = 1
      OnClick = btnCancelarClick
      OnMouseEnter = btnCancelarMouseEnter
      OnMouseLeave = btnCancelarMouseLeave
    end
  end
  object pnlTalaoDepos: TPanel
    Left = 0
    Top = 451
    Width = 827
    Height = 84
    Align = alTop
    TabOrder = 3
    object lblTalaoDepos: TLabel
      Left = 8
      Top = 32
      Width = 117
      Height = 13
      Caption = 'N'#186' do tal'#227'o de dep'#243'sito:'
      Font.Charset = ANSI_CHARSET
      Font.Color = clBlack
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
    end
    object pnlTalaoDeposTit: TPanel
      Left = 1
      Top = 1
      Width = 825
      Height = 25
      Align = alTop
      Caption = 'DADOS DO TAL'#195'O DE DEP'#211'SITO'
      Color = clBlue
      Font.Charset = ANSI_CHARSET
      Font.Color = clWhite
      Font.Height = -15
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 0
    end
    object edtTalaoDepos: TEdit
      Left = 8
      Top = 47
      Width = 281
      Height = 21
      Font.Charset = ANSI_CHARSET
      Font.Color = clBlack
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
      TabOrder = 1
    end
  end
  object pnCartao: TPanel
    Left = 0
    Top = 535
    Width = 827
    Height = 218
    Align = alTop
    Enabled = False
    TabOrder = 4
    object Label4: TLabel
      Left = 8
      Top = 79
      Width = 150
      Height = 16
      Caption = 'Administradora de cart'#227'o:'
      Font.Charset = ANSI_CHARSET
      Font.Color = clBlack
      Font.Height = -13
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
    end
    object Label5: TLabel
      Left = 352
      Top = 79
      Width = 81
      Height = 16
      Caption = 'Qtd. Parcelas:'
      Visible = False
    end
    object Panel2: TPanel
      Left = 1
      Top = 1
      Width = 825
      Height = 25
      Align = alTop
      Caption = 'DADOS DO CART'#195'O'
      Color = clBlue
      Font.Charset = ANSI_CHARSET
      Font.Color = clWhite
      Font.Height = -15
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 0
    end
    object Panel3: TPanel
      Left = 1
      Top = 26
      Width = 825
      Height = 47
      Align = alTop
      BevelOuter = bvNone
      TabOrder = 1
      object Label2: TLabel
        Left = 43
        Top = 6
        Width = 747
        Height = 16
        Caption = 
          'Antes de realizar a baixa de cart'#227'o pelo Unimestre '#233' necess'#225'rio ' +
          'que o processo j'#225' tenha sido realizado na m'#225'quina'
        Font.Charset = ANSI_CHARSET
        Font.Color = clRed
        Font.Height = -13
        Font.Name = 'Tahoma'
        Font.Style = [fsBold, fsItalic]
        ParentFont = False
      end
      object Label3: TLabel
        Left = 174
        Top = 28
        Width = 425
        Height = 16
        Caption = 'de cart'#227'o oferecida pela sua operadora para este tipo de servi'#231'o'
        Font.Charset = ANSI_CHARSET
        Font.Color = clRed
        Font.Height = -13
        Font.Name = 'Tahoma'
        Font.Style = [fsBold, fsItalic]
        ParentFont = False
      end
    end
    object rbCredito: TRadioButton
      Left = 278
      Top = 105
      Width = 68
      Height = 17
      Caption = 'Cr'#233'dito'
      Enabled = False
      Font.Charset = ANSI_CHARSET
      Font.Color = clBlack
      Font.Height = -13
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
      TabOrder = 2
      OnClick = rbCreditoClick
    end
    object rbDebito: TRadioButton
      Left = 213
      Top = 103
      Width = 59
      Height = 17
      Caption = 'D'#233'bito'
      Enabled = False
      TabOrder = 3
      OnClick = rbDebitoClick
    end
    object cbAdministradoras: TUMComboBox
      Left = 8
      Top = 101
      Width = 199
      Height = 24
      Style = csDropDownList
      Font.Charset = ANSI_CHARSET
      Font.Color = clBlack
      Font.Height = -13
      Font.Name = 'Tahoma'
      Font.Style = []
      ItemHeight = 16
      ParentFont = False
      TabOrder = 4
      OnChange = cbAdministradorasChange
      TamanhoMaximo = 0
    end
    object sgParcelasCartao: TStringGrid
      Left = 1
      Top = 132
      Width = 825
      Height = 85
      Align = alBottom
      DefaultColWidth = 105
      DefaultRowHeight = 20
      FixedCols = 0
      RowCount = 2
      TabOrder = 5
      OnDrawCell = sgGridChequesDrawCell
      OnKeyDown = sgGridChequesKeyDown
      OnKeyPress = sgGridChequesKeyPress
      OnSelectCell = sgGridChequesSelectCell
      OnSetEditText = sgGridChequesSetEditText
    end
    object edQtdParcelas: TEdit
      Left = 352
      Top = 101
      Width = 68
      Height = 24
      TabOrder = 6
      Text = '0'
      Visible = False
      OnChange = edQtdParcelasChange
      OnKeyDown = edQtdParcelasKeyDown
      OnKeyPress = edQtdParcelasKeyPress
    end
    object udQtdParcelas: TUpDown
      Left = 420
      Top = 101
      Width = 16
      Height = 24
      Associate = edQtdParcelas
      Max = 32767
      TabOrder = 7
      Visible = False
      OnClick = udQtdParcelasClick
    end
  end
  object popMnuMenuGridPessoa: TPopupMenu
    Left = 520
    Top = 64
    object popmnuRemovePessoa: TMenuItem
      Caption = 'Fechar t'#237'tulos desta pessoa'
      OnClick = popmnuRemovePessoaClick
    end
  end
end
