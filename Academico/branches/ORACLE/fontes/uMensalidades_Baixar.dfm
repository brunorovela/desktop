object frmMensalidadesBaixar: TfrmMensalidadesBaixar
  Left = 0
  Top = 0
  AutoSize = True
  BorderIcons = [biSystemMenu, biMinimize]
  BorderStyle = bsSingle
  Caption = 'Mensalidade'
  ClientHeight = 827
  ClientWidth = 872
  Color = clBtnFace
  Font.Charset = ANSI_CHARSET
  Font.Color = clBlack
  Font.Height = -13
  Font.Name = 'Tahoma'
  Font.Style = []
  KeyPreview = True
  OldCreateOrder = False
  Position = poMainFormCenter
  ShowHint = True
  OnClose = FormClose
  OnCreate = FormCreate
  OnKeyDown = FormKeyDown
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 16
  object pnTitulo: TPanel
    Left = 0
    Top = 0
    Width = 872
    Height = 30
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
    Top = 30
    Width = 872
    Height = 283
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
      Left = 644
      Top = 195
      Width = 38
      Height = 16
      Caption = 'Troco:'
    end
    object lbVlTotal: TLabel
      Left = 644
      Top = 120
      Width = 130
      Height = 16
      Caption = 'Valor Total a Receber:'
    end
    object lbDataBaixa: TLabel
      Left = 644
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
      Left = 644
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
      Width = 409
      Height = 72
      BevelInner = bvLowered
      TabOrder = 3
      object lblTD: TLabel
        Left = 378
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
        Width = 168
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
        Width = 168
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
        Left = 381
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
      Left = 423
      Top = 187
      Width = 215
      Height = 72
      BevelInner = bvLowered
      TabOrder = 4
      object chkCartao: TCheckBox
        Left = 18
        Top = 9
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
        Top = 27
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
      Width = 630
      Height = 163
      Cursor = crHandPoint
      Font.Charset = ANSI_CHARSET
      Font.Color = clBlack
      Font.Height = -12
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
      ParentShowHint = False
      ShowHint = False
      TabOrder = 0
      OnChange = tabParcelasChange
      OnMouseDown = tabParcelasMouseDown
      object edObservacao: TEdit
        Left = 4
        Top = 6
        Width = 622
        Height = 153
        Align = alClient
        TabOrder = 1
        ExplicitHeight = 22
      end
      object sgGridParcelas: TStringGrid
        Tag = -1
        Left = 4
        Top = 6
        Width = 622
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
      Left = 644
      Top = 212
      Width = 218
      Height = 41
      AutoSize = False
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
      Left = 644
      Top = 142
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
      OnChange = txtVlTotalChange
      OnExit = txtVlTotalExit
      OnKeyPress = txtVlTotalKeyPress
      Mascara = '###,###,##0.00'
      CasasDecimais = 2
      EnterProximoCampo = True
    end
    object txtDataBaixa: TMaskEdit
      Left = 644
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
      Left = 644
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
    Top = 313
    Width = 872
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
      Left = 696
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
      Width = 763
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
      TabOrder = 10
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
      Left = 777
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
      TabOrder = 8
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
      Left = 777
      Top = 103
      Width = 85
      Height = 25
      Caption = '&Excluir'
      Font.Charset = ANSI_CHARSET
      Font.Color = clBlack
      Font.Height = -13
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
      TabOrder = 9
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
      Width = 79
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
      Width = 870
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
      Left = 696
      Top = 43
      Width = 166
      Height = 21
      Font.Charset = ANSI_CHARSET
      Font.Color = clBlack
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
      TabOrder = 7
      OnKeyPress = txtNrChequeKeyPress
    end
  end
  object pnBotoes: TPanel
    Left = 0
    Top = 777
    Width = 872
    Height = 50
    Align = alTop
    TabOrder = 5
    object btnCancelar: TPanel
      Left = 446
      Top = 1
      Width = 425
      Height = 48
      Align = alRight
      Caption = 'CANCELAR (F12)'
      Font.Charset = ANSI_CHARSET
      Font.Color = clBlack
      Font.Height = -27
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
      TabOrder = 0
      OnClick = Panel1Click
      OnMouseEnter = Panel1MouseEnter
      OnMouseLeave = Panel1MouseLeave
    end
    object btnBaixar: TPanel
      Left = 1
      Top = 1
      Width = 445
      Height = 48
      Align = alClient
      Caption = 'BAIXAR (F9)'
      Font.Charset = ANSI_CHARSET
      Font.Color = clBlack
      Font.Height = -27
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
      TabOrder = 1
      OnClick = btnBaixarClick
      object UMAjuda1: TUMAjuda
        Left = 277
        Top = 14
        Width = 24
        Height = 25
        Picture.Data = {
          07544269746D6170F6060000424DF60600000000000036000000280000001800
          0000180000000100180000000000C0060000C40E0000C40E0000000000000000
          0000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFCFCFCF6F6F6F4F4F4FAFAFA
          FCFCFCFEFEFEFEFEFEFCFCFCFAFAFAF4F4F4F6F6F6FCFCFCFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF7F7F7E9EAEADD
          DDDDC7C5C4A8A294968F798D83698D8369968F79A8A294C7C5C4DDDDDDE9EAEA
          F7F7F7FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFEFE
          FEFBFBFBCDCCC996875F967523C0911AD6A422E5B22DE5B22DD6A422C0911A96
          752396875FCDCCC9FBFBFBFEFEFEFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFC4BBADB1923DD0A321EBC03EE3BB3EDEB73FDCB442DCB4
          42DEB73FE3BB3EEBC03ED0A321B1923DC4BBADFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFDACEABA87F06DFBB3DE0BD46D0A639C99732
          C59031C48E31C48E31C59031C99732D0A639E0BD46DFBB3DA87F06DACEABFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFE1DAC19C7600DEC045D8B342C9
          9733C68F31C69031C38C28C0871FC0871FC38C28C69031C68F31C99733D8B342
          DEC0459C7600E1DAC1FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFEFEFDB09341D6B8
          43D8B447CB9836C99234CB9537C38C27B78523BE9441BE9441B78523C38C27CB
          9537C99234CB9836D8B447D6B843B09341FEFEFDFFFFFFFFFFFFFFFFFFFFFFFF
          D6C9A6B4921ADEBF53D1A13CCC9738CC9737D09D41BB800FD5BC86FFFFFFFFFF
          FFD5BC86BB8010D09D41CC9737CC9738D1A13CDEBF53B4921AD6C9A6FFFFFFFF
          FFFFFFFFFFFEFEFEAB903AD7B84DD9B24AD19F3ECE9B3BCE9B3AD1A043C08819
          D0B26EFBF9F4FCFAF5D0B16DC08717D1A043CE9B3ACE9B3BD19F3ED9B24AD7B8
          4DAB903AFEFEFEFFFFFFFFFFFFEFEADDA88516E0C05DDAB04BD3A23FD29E3DD2
          9E3ED3A041CB9630BF912CC7A14AC69F47C19435CD9938D3A040D29E3DD29E3D
          D3A23FDAB04BE0C05DA88516EFEADDFFFFFFFFFFFFE6DFCAB9982FE9CC77DEB8
          5FD9AD52D6A548D4A13FD7A647C78F1FD6B97DFFFFFFFFFFFFF0E8DCBF8C26D1
          9D37D5A343D6A548D9AD52DEB85FE9CC77B9982FE6DFCAFFFFFFFFFFFFE0D7BD
          C5A841EED27DE1BD66DFB762DDB25CDBAD56DCAE56DAAB4EC79636E8D9BEFFFF
          FFFFFFFFE1CDA5C28F27DBAD54DDB25CDFB762E1BD66EED27DC5A841E0D7BDFF
          FFFFFFFFFFDFD6BDCAAF51F2DB87E5C36BE2BC66E1B763DFB35FD3A23FD09C36
          CD982EC69738EEE3CFFFFFFFFFFFFFD9BB84D3A342E3BA69E2BC65E5C36BF2DB
          87CAAF51DFD6BDFFFFFFFFFFFFE5DDC8C9B25EF6E291E9CC74E7C46CE7C270D2
          A440D2B268DFC894CFAB5BCB9627CEA552FEFFFFFFFFFFEADCBCCD9E35E8C473
          E7C46CE9CC74F6E291C9B25EE5DDC8FFFFFFFFFFFFEEE9DBBEA658FAEAA3EED4
          7BEBCD76EDCD7BD3A73CEFE5CBFFFFFFF5EFE4CDA44BD8B974FFFFFFFFFFFFED
          E2C5D2A63CEDCD7BEBCD76EED47BFAEAA3BEA658EEE9DBFFFFFFFFFFFFFEFEFE
          B49D58F9EFBCF4DF8AEFD780F0D480E0BC58E1CB94FEFEFFFEFEFDFDFCFAFDFD
          FCFEFEFDFFFFFFE8D7AFDCB750F0D582EFD77FF4DF8AF9EFBCB49D58FEFEFEFF
          FFFFFFFFFFFFFFFFD6CAA6D1BE83FFF4BCF1DD84F2DB87F0D57BDCBD61F5EFE1
          FFFFFFFFFFFFFFFFFFFFFFFFF9F5EFDABD68EED277F2DB88F1DD83FFF4BCD1BE
          83D6CAA6FFFFFFFFFFFFFFFFFFFFFFFFFEFEFDB69E5BFAF3D2F9ECADF4E18AF6
          E18EEED579E0C772ECE0BBF8F6ECF9F6EDEEE4C3E0C978E7CD6DF7E28FF3E08A
          F9ECADFAF3D2B69E5BFEFEFDFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFE1D8BFAD93
          3FFFFFE8FBF0B9F6E694F7E591F4DF85E7D072DFC96CDFC96CE6CF72F3DD83F7
          E692F6E694FBF0B9FFFFE9AD933FE1D8BFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFD6CAA6AB903DFAF5DDFFFEDBFBF0B5F9ECA6F9EA9DF9E895F9E8
          95F9EA9DF9ECA6FBF0B6FFFEDBFAF5DDAB903DD6CAA6FFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFE4DBC3B7A160D4C699FDF9E4FFFFE5
          FFFFDEFFFFDBFFFFDBFFFFDEFFFFE5FDF9E4D6C79AB7A060E4DBC2FFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFEFEFDD5
          C9A4B19A57BEAA6DCFBF8BD6C798D6C798CFBF8BBEAB6EB19A56D5C8A3FEFEFD
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFEFEBDDE7E0CBE0D6BBE0D6BBE7E0CBEFEBDDFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFF}
        Transparent = True
        Visible = False
        Caption = 
          'Voc'#234' dever'#225' selecionar as parcelas que far'#227'o parte da baixa.'#13#10'O ' +
          'soma das parcelas selecionadas deve ser igual ao valor da baixa.' +
          ' '#13#10'Voc'#234' pode alterar os valores de Descontos, Juros ou Valor Pag' +
          'o na grade de parcelas.'
        Titulo = 'AJUDA'
      end
    end
  end
  object pnlTalaoDepos: TPanel
    Left = 0
    Top = 475
    Width = 872
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
      Width = 870
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
    Top = 559
    Width = 872
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
      Left = 518
      Top = 81
      Width = 81
      Height = 16
      Caption = 'Qtd. Parcelas:'
      Visible = False
    end
    object Label6: TLabel
      Left = 213
      Top = 79
      Width = 25
      Height = 16
      Caption = 'TID:'
      Font.Charset = ANSI_CHARSET
      Font.Color = clBlack
      Font.Height = -13
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
    end
    object Panel2: TPanel
      Left = 1
      Top = 1
      Width = 870
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
      TabOrder = 7
    end
    object Panel3: TPanel
      Left = 1
      Top = 26
      Width = 870
      Height = 47
      Align = alTop
      BevelOuter = bvNone
      TabOrder = 8
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
      Left = 444
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
      TabOrder = 3
      OnClick = rbCreditoClick
    end
    object rbDebito: TRadioButton
      Left = 379
      Top = 105
      Width = 59
      Height = 17
      Caption = 'D'#233'bito'
      Enabled = False
      TabOrder = 2
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
      TabOrder = 0
      OnChange = cbAdministradorasChange
      TamanhoMaximo = 0
    end
    object sgParcelasCartao: TStringGrid
      Left = 1
      Top = 132
      Width = 870
      Height = 85
      Align = alBottom
      DefaultColWidth = 105
      DefaultRowHeight = 20
      FixedCols = 0
      RowCount = 2
      TabOrder = 6
      OnDrawCell = sgGridChequesDrawCell
      OnKeyDown = sgGridChequesKeyDown
      OnKeyPress = sgGridChequesKeyPress
      OnSelectCell = sgGridChequesSelectCell
      OnSetEditText = sgGridChequesSetEditText
    end
    object edQtdParcelas: TEdit
      Left = 518
      Top = 101
      Width = 68
      Height = 24
      TabOrder = 4
      Text = '0'
      Visible = False
      OnChange = edQtdParcelasChange
      OnKeyDown = edQtdParcelasKeyDown
      OnKeyPress = edQtdParcelasKeyPress
    end
    object udQtdParcelas: TUpDown
      Left = 586
      Top = 101
      Width = 16
      Height = 24
      Associate = edQtdParcelas
      Max = 32767
      TabOrder = 5
      Visible = False
      OnClick = udQtdParcelasClick
    end
    object edTID: TEdit
      Left = 213
      Top = 101
      Width = 160
      Height = 24
      TabOrder = 1
    end
  end
  object qryControleCaixa: TUMZQuery
    Connection = DM.db
    SQL.Strings = (
      'SELECT'
      '   *'
      'FROM'
      '  fin_controle_caixa'
      'WHERE'
      '  cd_conta_banco = :cd_conta_banco'
      'ORDER By'
      '  cd_abertura_caixa DESC limit 1')
    Params = <
      item
        DataType = ftUnknown
        Name = 'cd_conta_banco'
        ParamType = ptUnknown
      end>
    Left = 616
    Top = 656
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'cd_conta_banco'
        ParamType = ptUnknown
      end>
  end
end
