object frmMensalidades: TfrmMensalidades
  Left = 196
  Top = 111
  Caption = 'Recebimentos'
  ClientHeight = 667
  ClientWidth = 1068
  Color = clBtnFace
  Font.Charset = ANSI_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Arial'
  Font.Style = []
  FormStyle = fsMDIChild
  KeyPreview = True
  OldCreateOrder = True
  Position = poDefault
  Visible = True
  WindowState = wsMaximized
  OnActivate = FormActivate
  OnClose = FormClose
  OnCreate = FormCreate
  OnDestroy = FormDestroy
  OnKeyDown = FormKeyDown
  OnPaint = FormPaint
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 14
  object Bevel1: TBevel
    Left = 0
    Top = 567
    Width = 1068
    Height = 3
    Align = alBottom
    Shape = bsSpacer
    Style = bsRaised
    ExplicitTop = 443
    ExplicitWidth = 796
  end
  object Bevel3: TBevel
    Left = 0
    Top = 80
    Width = 1068
    Height = 4
    Align = alTop
    Shape = bsSpacer
    Style = bsRaised
    ExplicitTop = 58
    ExplicitWidth = 796
  end
  object Bevel4: TBevel
    Left = 0
    Top = 84
    Width = 3
    Height = 483
    Align = alLeft
    Shape = bsSpacer
    Style = bsRaised
    ExplicitTop = 62
    ExplicitHeight = 381
  end
  object Bevel5: TBevel
    Left = 1063
    Top = 84
    Width = 5
    Height = 483
    Align = alRight
    Shape = bsSpacer
    Style = bsRaised
    ExplicitLeft = 791
    ExplicitTop = 62
    ExplicitHeight = 381
  end
  object Bevel2: TBevel
    Left = 0
    Top = 21
    Width = 1068
    Height = 3
    Align = alTop
    Shape = bsSpacer
    Style = bsRaised
    ExplicitLeft = -8
    ExplicitTop = 34
    ExplicitWidth = 796
  end
  object Bevel6: TBevel
    Left = 0
    Top = 56
    Width = 1068
    Height = 3
    Align = alTop
    Shape = bsSpacer
    Style = bsRaised
    Visible = False
    ExplicitWidth = 796
  end
  object Panel7: TPanel
    Left = 0
    Top = 605
    Width = 1068
    Height = 62
    Align = alBottom
    BevelInner = bvLowered
    BorderWidth = 2
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Arial'
    Font.Style = []
    ParentFont = False
    TabOrder = 0
    object btnImprimir: TSpeedButton
      Left = 594
      Top = 31
      Width = 91
      Height = 25
      Hint = 'Imprimir extratos, bloquetos ou recibos'
      Caption = 'F7 Imprimir'
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
    end
    object btnFechar: TSpeedButton
      Left = 685
      Top = 31
      Width = 91
      Height = 25
      Hint = 'Fechar a planilha de Recebimentos'
      Caption = 'F12 &Fechar'
      Flat = True
      Glyph.Data = {
        F6000000424DF600000000000000760000002800000010000000100000000100
        04000000000080000000CE0E0000C40E00001000000000000000000000000000
        80000080000000808000800000008000800080800000C0C0C000808080000000
        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00777777777777
        7777777777777777777777777744447777777777444444447777777444777744
        4777777447777774477777447777777744777744777777774477774477777777
        4477774477777777447777744777747447777774477774444777777777777444
        7777777777777444477777777777777777777777777777777777}
      OnClick = btnFecharClick
    end
    object btnBaixar: TSpeedButton
      Left = 139
      Top = 6
      Width = 91
      Height = 25
      Hint = 'Baixar o t'#237'tulo selecionado'
      Caption = '&Baixar'
      Flat = True
      OnClick = btnBaixarClick
    end
    object btnPerdoar: TSpeedButton
      Left = 232
      Top = 6
      Width = 91
      Height = 25
      Hint = 'Cancelar o t'#237'tulo selecionado'
      Caption = '&Cancelar'
      Flat = True
      OnClick = btnPerdoarClick
    end
    object btnDesconto: TSpeedButton
      Left = 321
      Top = 6
      Width = 91
      Height = 25
      Hint = 'Aplicar desconto no t'#237'tulo selecionado'
      Caption = '&Desconto'
      Flat = True
      OnClick = btnDescontoClick
    end
    object btnMotivo: TSpeedButton
      Left = 321
      Top = 31
      Width = 91
      Height = 25
      Hint = 'Visualizar motivos de altera'#231#245'es do t'#237'tulo'
      Caption = '&Motivo'
      Flat = True
      OnClick = btnMotivoClick
    end
    object btnObservacoes: TSpeedButton
      Left = 412
      Top = 6
      Width = 91
      Height = 25
      Hint = 'Observa'#231#245'es financeiras'
      Caption = '&Observa'#231#245'es'
      Flat = True
      OnClick = btnObservacoesClick
    end
    object btnGerar: TSpeedButton
      Left = 139
      Top = 31
      Width = 91
      Height = 25
      Hint = 'Gerar um novo t'#237'tulo manualmente'
      Caption = '&Gerar'
      Flat = True
      OnClick = btnGerarClick
      OnMouseDown = btnGerarMouseDown
    end
    object btnAlterar: TSpeedButton
      Left = 232
      Top = 31
      Width = 91
      Height = 25
      Hint = 'Alterar o t'#237'tulo selecionado'
      Caption = '&Alterar'
      Flat = True
      OnClick = btnAlterarClick
    end
    object btnProtesto: TSpeedButton
      Left = 503
      Top = 6
      Width = 91
      Height = 25
      Hint = 'Protestar o t'#237'tulo selecionado'
      Caption = 'Gerar P&rotesto'
      Flat = True
      OnClick = btnProtestoClick
    end
    object btnVisualizar: TSpeedButton
      Left = 594
      Top = 6
      Width = 91
      Height = 25
      Hint = 'Visualizar os t'#237'tulos em protesto'
      Caption = '&Visualizar Prot.'
      Flat = True
      OnClick = btnVisualizarClick
    end
    object btnEstornar: TSpeedButton
      Left = 685
      Top = 6
      Width = 91
      Height = 25
      Hint = 'Estornar um t'#237'tulo baixado'
      Caption = '&Estornar'
      Flat = True
      OnClick = btnEstornarClick
    end
    object btnReajustar: TSpeedButton
      Left = 7
      Top = 31
      Width = 132
      Height = 25
      Hint = 'Outras Op'#231#245'es'
      Caption = 'Outras Op'#231#245'es'
      Flat = True
      OnClick = btnReajustarClick
    end
    object btnObsRestritas: TSpeedButton
      Left = 412
      Top = 31
      Width = 91
      Height = 25
      Hint = 'Registrar observa'#231#245'es restritas'
      Caption = 'Obs. Restritas'
      Flat = True
      OnClick = btnObsRestritasClick
    end
    object btnNegociar: TSpeedButton
      Left = 503
      Top = 31
      Width = 91
      Height = 25
      Hint = 'Negociar t'#237'tulos pendentes'
      Caption = '&Negociar'
      Flat = True
      OnClick = btnNegociarClick
    end
    object Navigator: TDBNavigator
      Left = 15
      Top = 6
      Width = 124
      Height = 25
      DataSource = dtcMensalidades
      VisibleButtons = [nbFirst, nbPrior, nbNext, nbLast]
      Flat = True
      Hints.Strings = (
        'Primeiro'
        'Anterior'
        'Pr'#243'ximo'
        #218'ltimo')
      TabOrder = 0
    end
  end
  object Panel2: TPanel
    Left = 0
    Top = 24
    Width = 1068
    Height = 32
    Align = alTop
    BevelOuter = bvLowered
    Color = clBlue
    TabOrder = 1
    object lbl: TLabel
      Left = 7
      Top = 7
      Width = 49
      Height = 16
      Caption = 'ALUNO:'
      Font.Charset = ANSI_CHARSET
      Font.Color = clWhite
      Font.Height = -13
      Font.Name = 'Arial'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Panel1: TPanel
      Left = 780
      Top = 1
      Width = 287
      Height = 30
      Align = alRight
      BevelOuter = bvNone
      Color = clBlue
      TabOrder = 0
      DesignSize = (
        287
        30)
      object Label1: TLabel
        Left = 14
        Top = 6
        Width = 54
        Height = 16
        Anchors = [akLeft]
        Caption = 'TURMA: '
        Font.Charset = ANSI_CHARSET
        Font.Color = clWhite
        Font.Height = -13
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object sbSelecionarColuna: TSpeedButton
        Left = 259
        Top = 5
        Width = 25
        Height = 20
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
        ParentShowHint = False
        ShowHint = True
        OnClick = sbSelecionarColunaClick
      end
      object cbTurma: TComboBox
        Left = 74
        Top = 5
        Width = 179
        Height = 20
        Style = csOwnerDrawFixed
        Anchors = [akLeft]
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Arial'
        Font.Style = []
        ItemHeight = 14
        ParentFont = False
        TabOrder = 0
        OnChange = cbTurmaChange
      end
    end
  end
  object grd: TDBGrid
    Left = 3
    Top = 84
    Width = 1060
    Height = 483
    Align = alClient
    Color = clWhite
    DataSource = dtcMensalidades
    Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgTabs, dgRowSelect, dgAlwaysShowSelection, dgCancelOnExit]
    PopupMenu = pmLogs
    TabOrder = 2
    TitleFont.Charset = ANSI_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'Arial'
    TitleFont.Style = []
    OnDrawColumnCell = grdDrawColumnCell
    OnDblClick = grdDblClick
    OnKeyDown = grdKeyDown
    OnTitleClick = grdTitleClick
    Columns = <
      item
        Expanded = False
        FieldName = 'NomeAluno'
        Width = 101
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'codigoaluno'
        Title.Alignment = taCenter
        Width = 50
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'Parcela'
        Title.Alignment = taRightJustify
        Width = 29
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'DataVencimento'
        PopupMenu = pmQtd
        Title.Alignment = taCenter
        Width = 63
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'ValorBruto'
        PopupMenu = pmQtd
        Title.Alignment = taRightJustify
        Width = 60
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'ValorDesconto'
        PopupMenu = pmQtd
        Title.Alignment = taRightJustify
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'ValorExtra'
        PopupMenu = pmQtd
        Title.Alignment = taRightJustify
        Width = 60
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'DescontoExtra'
        PopupMenu = pmQtd
        Title.Alignment = taRightJustify
        Width = 60
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'ValorJurosCalc'
        PopupMenu = pmQtd
        Title.Alignment = taRightJustify
        Width = 60
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'ValorTotalCalc'
        PopupMenu = pmQtd
        Title.Alignment = taRightJustify
        Width = 60
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'ValorPago'
        PopupMenu = pmQtd
        Title.Alignment = taRightJustify
        Width = 60
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'DataPagamento'
        PopupMenu = pmQtd
        Title.Alignment = taCenter
        Width = 63
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'DescricaoSituacao'
        PopupMenu = pmQtd
        Title.Alignment = taCenter
        Width = 42
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'BloquetoImpresso'
        PopupMenu = popImpresso
        Width = 26
        Visible = True
      end>
  end
  object Panel3: TPanel
    Left = 0
    Top = 0
    Width = 1068
    Height = 21
    Align = alTop
    BevelOuter = bvLowered
    Caption = 'PLANILHA DE RECEBIMENTOS'
    Color = clBlue
    Font.Charset = ANSI_CHARSET
    Font.Color = clWhite
    Font.Height = -13
    Font.Name = 'Arial'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 3
    ExplicitTop = -2
  end
  object Panel8: TPanel
    Left = 0
    Top = 570
    Width = 1068
    Height = 35
    Align = alBottom
    TabOrder = 4
    object btnAluno: TSpeedButton
      Left = 333
      Top = 3
      Width = 76
      Height = 28
      Hint = 'Buscar por aluno'
      Caption = 'F8 Aluno'
      Flat = True
      Glyph.Data = {
        F6000000424DF600000000000000760000002800000010000000100000000100
        04000000000080000000CE0E0000D80E00001000000000000000000000000000
        80000080000000808000800000008000800080800000C0C0C000808080000000
        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00222222222222
        222200000000000022000FFFFFFFFFF020000FFFFFFF000080020FFFFFF08778
        08220FFFFF0877E880220FFFFF07777870220FFFFF07E77870220FFFFF08EE78
        80220FFFFFF0877802220FFFFFFF000022220FFFFFFFFFF022220FFFFFFF0000
        22220FFFFFFF070222220FFFFFFF002222220000000002222222}
      OnClick = btnAlunoClick
    end
    object btnTurmas: TSpeedButton
      Left = 409
      Top = 4
      Width = 79
      Height = 28
      Hint = 'Buscar por Turma'
      Caption = 'F9 Turma'
      Flat = True
      Glyph.Data = {
        F6000000424DF600000000000000760000002800000010000000100000000100
        04000000000080000000CE0E0000D80E00001000000000000000000000000000
        80000080000000808000800000008000800080800000C0C0C000808080000000
        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00222222222222
        222200000000000022000FFFFFFFFFF020000FFFFFFF000080020FFFFFF08778
        08220FFFFF0877E880220FFFFF07777870220FFFFF07E77870220FFFFF08EE78
        80220FFFFFF0877802220FFFFFFF000022220FFFFFFFFFF022220FFFFFFF0000
        22220FFFFFFF070222220FFFFFFF002222220000000002222222}
      OnClick = btnTurmasClick
    end
    object btnResponsavel: TSpeedButton
      Left = 488
      Top = 4
      Width = 104
      Height = 28
      Hint = 'Buscar por aluno'
      Caption = 'Respons'#225'vel'
      Flat = True
      Glyph.Data = {
        F6000000424DF600000000000000760000002800000010000000100000000100
        04000000000080000000CE0E0000D80E00001000000000000000000000000000
        80000080000000808000800000008000800080800000C0C0C000808080000000
        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00222222222222
        222200000000000022000FFFFFFFFFF020000FFFFFFF000080020FFFFFF08778
        08220FFFFF0877E880220FFFFF07777870220FFFFF07E77870220FFFFF08EE78
        80220FFFFFF0877802220FFFFFFF000022220FFFFFFFFFF022220FFFFFFF0000
        22220FFFFFFF070222220FFFFFFF002222220000000002222222}
      OnClick = btnResponsavelClick
    end
    object btnOutras: TSpeedButton
      Left = 661
      Top = 4
      Width = 115
      Height = 28
      Hint = 'Buscar pelo Nosso N'#250'mero'
      Caption = 'Outras Buscas'
      Flat = True
      Glyph.Data = {
        F6000000424DF600000000000000760000002800000010000000100000000100
        04000000000080000000CE0E0000D80E00001000000000000000000000000000
        80000080000000808000800000008000800080800000C0C0C000808080000000
        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00222222222222
        222200000000000022000FFFFFFFFFF020000FFFFFFF000080020FFFFFF08778
        08220FFFFF0877E880220FFFFF07777870220FFFFF07E77870220FFFFF08EE78
        80220FFFFFF0877802220FFFFFFF000022220FFFFFFFFFF022220FFFFFFF0000
        22220FFFFFFF070222220FFFFFFF002222220000000002222222}
      OnClick = btnOutrasClick
    end
    object btnCheque: TSpeedButton
      Left = 592
      Top = 4
      Width = 69
      Height = 28
      Hint = 'Buscar pelo Cheque'
      Caption = 'Cheque'
      Flat = True
      Glyph.Data = {
        F6000000424DF600000000000000760000002800000010000000100000000100
        04000000000080000000CE0E0000D80E00001000000000000000000000000000
        80000080000000808000800000008000800080800000C0C0C000808080000000
        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00222222222222
        222200000000000022000FFFFFFFFFF020000FFFFFFF000080020FFFFFF08778
        08220FFFFF0877E880220FFFFF07777870220FFFFF07E77870220FFFFF08EE78
        80220FFFFFF0877802220FFFFFFF000022220FFFFFFFFFF022220FFFFFFF0000
        22220FFFFFFF070222220FFFFFFF002222220000000002222222}
      OnClick = btnChequeClick
    end
    object radPagos: TRadioButton
      Left = 8
      Top = 17
      Width = 73
      Height = 17
      Caption = 'Pagos'
      TabOrder = 5
      OnClick = radPagosClick
      OnKeyPress = radPagosKeyPress
    end
    object radParcial: TRadioButton
      Tag = 1
      Left = 167
      Top = 17
      Width = 73
      Height = 14
      Caption = 'Parcial'
      TabOrder = 1
      OnClick = radPagosClick
      OnKeyPress = radPagosKeyPress
    end
    object radPendentes: TRadioButton
      Tag = 2
      Left = 254
      Top = 1
      Width = 73
      Height = 17
      Caption = 'Pendentes'
      TabOrder = 4
      OnClick = radPagosClick
      OnKeyPress = radPagosKeyPress
    end
    object radCancelados: TRadioButton
      Tag = 3
      Left = 79
      Top = 1
      Width = 81
      Height = 17
      Caption = 'Cancelados'
      TabOrder = 3
      OnClick = radPagosClick
      OnKeyPress = radPagosKeyPress
    end
    object radNegociados: TRadioButton
      Tag = 4
      Left = 79
      Top = 17
      Width = 78
      Height = 15
      Caption = 'Negociados'
      TabOrder = 2
      OnClick = radPagosClick
      OnKeyPress = radPagosKeyPress
    end
    object radEmProtesto: TRadioButton
      Tag = 9
      Left = 167
      Top = 1
      Width = 81
      Height = 17
      Caption = 'Em protesto'
      TabOrder = 0
      OnClick = radPagosClick
      OnKeyPress = radPagosKeyPress
    end
    object radVencidos: TRadioButton
      Tag = 4
      Left = 254
      Top = 17
      Width = 73
      Height = 17
      Caption = 'Vencidos'
      TabOrder = 6
      OnClick = radPagosClick
      OnKeyPress = radPagosKeyPress
    end
    object radTodos: TRadioButton
      Tag = 4
      Left = 8
      Top = 1
      Width = 73
      Height = 17
      Caption = 'Todos'
      Checked = True
      TabOrder = 7
      TabStop = True
      OnClick = radPagosClick
      OnKeyPress = radPagosKeyPress
    end
  end
  object pnSituacaoCobranca: TPanel
    Left = 0
    Top = 59
    Width = 1068
    Height = 21
    Align = alTop
    BevelOuter = bvLowered
    Caption = 'pnSituacaoCobranca'
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Arial'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 5
    Visible = False
  end
  object dtcMensalidades: TDataSource
    DataSet = tblMensalidades
    OnDataChange = dtcMensalidadesDataChange
    Left = 24
    Top = 392
  end
  object popImpresso: TPopupMenu
    OnPopup = popImpressoPopup
    Left = 104
    Top = 296
    object mnuSim: TMenuItem
      Caption = 'Bloqueto Impresso'
      Checked = True
      OnClick = mnuSimClick
    end
    object mnuNao: TMenuItem
      Caption = 'Bloqueto n'#227'o impresso'
      OnClick = mnuNaoClick
    end
  end
  object qryDelete: TUMZQuery
    Connection = DM.db
    Params = <>
    Left = 72
    Top = 296
  end
  object tblMensalidades: TUMZQuery
    Connection = DM.db
    OnCalcFields = tblMensalidadesCalcFields
    BeforeEdit = tblMensalidadesBeforeEdit
    SQL.Strings = (
      'SELECT'
      '   me.*,'
      '   dp.descricao as depto_descricao,'
      '   LEFT(me.ds_obs_desc, 150) as ds_obs,'
      '   pe.nm_pessoa as NomeAluno,'
      
        '   CAST(IFNULL(me.cd_resp, pe.cd_resp_finan) AS CHAR) as cd_resp' +
        '_finan,'
      '   Resp.nm_pessoa as NomeResponsavel,'
      '   tt.ds_tipo_titulo,'
      '   pc.ds_conta,'
      '   cc.ds_centro,'
      '   bt.ds_bolsa,'
      '   mo.ds_sigla,'
      '   mp.ds_sigla as MoedaPgto,'
      '   sf.sn_protesto,'
      '   am.ds_acao,'
      '   GET_ACRESCIMOS(me.cd_mensalidade, NULL) as juros_calc,'
      '   GET_DESCONTOS(me.cd_mensalidade, NULL) as desconto_calc,'
      '   tc.ds_caixa,'
      '   sit.cd_auxiliar sn_cobranca,'
      '   sit.ds_sigla ds_cor_cobranca,'
      '   sit.ds_valor ds_situacao_cobranca,'
      '   c.sn_spc,'
      '   c.sn_serasa,'
      '   c.sn_juridico'
      'FROM'
      '   mensalidades as me'
      '      JOIN fin_moedas as mo ON'
      '         (me.cd_moeda = mo.cd_moeda)'
      '      JOIN situacoes_financeiras as sf ON'
      '         (me.situacao = sf.cd_situacao)'
      '      JOIN Pessoas as pe ON'
      '         (me.CodigoAluno = pe.cd_pessoa)'
      '      LEFT JOIN departamentos dp ON '
      '         (me.depto = dp.codigo)'
      '      LEFT JOIN pessoas Resp ON'
      '         (IFNULL(me.cd_resp, pe.cd_resp_finan) = Resp.cd_pessoa)'
      '      LEFT JOIN fin_tipos_titulo as tt ON'
      '         (me.cd_tipo_titulo = tt.cd_tipo_titulo) AND'
      '         (me.cd_coligada = tt.cd_coligada)'
      '      LEFT JOIN fin_plano_contas as pc ON'
      '         (me.cd_plano_conta = pc.cd_conta) AND'
      '         (me.cd_coligada = pc.cd_coligada)'
      '      LEFT JOIN fin_centro_custos as cc ON'
      '         (me.cd_centro_custo = cc.cd_centro) AND'
      '         (me.cd_coligada = cc.cd_coligada)'
      '      LEFT JOIN fin_bolsas_tipos as bt ON'
      '         (me.cd_bolsa = bt.cd_bolsa)'
      '      LEFT JOIN fin_moedas as mp ON'
      '         (me.cd_moeda_pgto = mp.cd_moeda)'
      '      LEFT JOIN fin_acoes_movimento as am ON'
      '         (me.cd_desc_condicional = am.cd_acao) AND'
      '         (am.cd_tipo_acao = 3) AND'
      '         (am.cd_origem = 1)'
      '      LEFT JOIN fin_mov_tesouraria as te ON'
      '         (te.cd_mensalidade = me.cd_mensalidade) AND'
      '         (te.nr_estorno = 0)'
      '      LEFT JOIN fin_cadastro_contas as tc ON'
      '         (tc.cd_caixa = te.cd_caixa) AND'
      '         (tc.cd_coligada = te.cd_coligada)'
      '      LEFT JOIN fin_cobranca AS c ON'
      '         (me.codigoaluno = c.cd_pessoa)'
      '      LEFT JOIN situacoes AS sit ON'
      '        (c.cd_situacao = sit.cd_situacao) AND'
      '        (sit.cd_modulo = 2053)'
      'WHERE'
      '   me.anosemestre = 20091'
      'GROUP BY'
      '   me.cd_mensalidade'
      '')
    Params = <>
    Left = 40
    Top = 296
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
      DisplayLabel = 'C'#243'd. Turma'
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
      DisplayWidth = 12
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
      DisplayWidth = 12
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
      DisplayWidth = 12
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
      DisplayWidth = 12
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
      DisplayFormat = '###,###,##0.00'
    end
    object tblMensalidadestipoparcela: TSmallintField
      Tag = 1
      DisplayLabel = 'Tipo Parc.'
      DisplayWidth = 5
      FieldName = 'tipoparcela'
      Origin = 'WMESTRE12.mensalidades.tipoparcela'
    end
    object tblMensalidadescd_coligada: TSmallintField
      Tag = 1
      DisplayLabel = 'U.E.'
      DisplayWidth = 3
      FieldName = 'cd_coligada'
    end
    object tblMensalidadescurso: TStringField
      Tag = 1
      DisplayLabel = 'C'#243'd. Curso'
      DisplayWidth = 10
      FieldName = 'curso'
      Origin = 'WMESTRE12.mensalidades.curso'
      Size = 15
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
    object tblMensalidadescd_bolsa: TIntegerField
      DisplayLabel = 'C'#243'd. Bolsa'
      FieldName = 'cd_bolsa'
    end
    object tblMensalidadesds_bolsa: TStringField
      DisplayLabel = 'Bolsa'
      DisplayWidth = 30
      FieldName = 'ds_bolsa'
      Size = 100
    end
    object tblMensalidadesds_sigla: TStringField
      Tag = 1
      DisplayLabel = 'Moeda'
      DisplayWidth = 3
      FieldName = 'ds_sigla'
      Size = 30
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
    object tblMensalidadesdt_credito: TDateTimeField
      Tag = 1
      DisplayLabel = 'Dt. Cr'#233'dito'
      DisplayWidth = 10
      FieldName = 'dt_credito'
      DisplayFormat = 'dd/mm/yyyy'
    end
    object tblMensalidadescd_recibo: TIntegerField
      FieldName = 'cd_recibo'
    end
    object tblMensalidadessn_protesto: TSmallintField
      FieldName = 'sn_protesto'
    end
    object tblMensalidadesds_acao: TStringField
      FieldName = 'ds_acao'
      Size = 255
    end
    object tblMensalidadesds_obs_desc: TMemoField
      FieldName = 'ds_obs_desc'
      BlobType = ftMemo
      Size = 1
    end
    object tblMensalidadessn_liberar_juros: TIntegerField
      Tag = 1
      Alignment = taCenter
      DisplayLabel = 'Lib. Juros'
      DisplayWidth = 1
      FieldName = 'sn_liberar_juros'
      Origin = 'mensalidades.sn_liberar_juros'
      OnGetText = tblMensalidadessn_liberar_jurosGetText
    end
    object tblMensalidadesValorDescontoCalc: TCurrencyField
      Tag = 1
      DisplayLabel = 'Desc. Cond.'
      FieldKind = fkCalculated
      FieldName = 'ValorDescontoCalc'
      DisplayFormat = '###,###,##0.00'
      Calculated = True
    end
    object tblMensalidadessn_liberar_descontos: TIntegerField
      Tag = 1
      Alignment = taCenter
      DisplayLabel = 'Conc. Desc.'
      DisplayWidth = 1
      FieldName = 'sn_liberar_descontos'
      Origin = 'mensalidades.sn_liberar_descontos'
      OnGetText = tblMensalidadessn_liberar_jurosGetText
    end
    object tblMensalidadesds_obs: TStringField
      Tag = 1
      DisplayLabel = 'Obs. Desc'
      DisplayWidth = 30
      FieldName = 'ds_obs'
      Size = 45
    end
    object tblMensalidadesvl_credito: TFloatField
      Tag = 1
      DisplayLabel = 'Vl. Cr'#233'dito'
      FieldName = 'vl_credito'
    end
    object tblMensalidadesdesconto_calc: TFloatField
      FieldName = 'desconto_calc'
    end
    object tblMensalidadesValorJurosCalc: TCurrencyField
      Tag = 1
      DisplayLabel = 'Vl. Juros'
      FieldKind = fkCalculated
      FieldName = 'ValorJurosCalc'
      DisplayFormat = '###,###,##0.00'
      Calculated = True
    end
    object tblMensalidadesds_caixa: TStringField
      Tag = 1
      DisplayLabel = 'Caixa da Baixa'
      DisplayWidth = 20
      FieldName = 'ds_caixa'
      Size = 255
    end
    object tblMensalidadescd_resp_finan: TStringField
      Tag = 1
      DisplayLabel = 'C'#243'd. Resp.'
      DisplayWidth = 10
      FieldName = 'cd_resp_finan'
      Size = 11
    end
    object tblMensalidadesjuros_calc: TFloatField
      FieldName = 'juros_calc'
    end
    object tblMensalidadesds_cor_cobranca: TStringField
      FieldName = 'ds_cor_cobranca'
      Size = 50
    end
    object tblMensalidadesds_situacao_cobranca: TStringField
      FieldName = 'ds_situacao_cobranca'
      Size = 255
    end
    object tblMensalidadescodigoaluno: TIntegerField
      Tag = 1
      DisplayLabel = 'C'#243'd.'
      FieldName = 'codigoaluno'
      DisplayFormat = '00000-0'
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
    object tblMensalidadescd_caixa: TIntegerField
      DisplayLabel = 'Conta Boleto'
      FieldName = 'cd_caixa'
    end
    object tblMensalidadescd_resp: TIntegerField
      DisplayLabel = 'C'#243'd. Resp'
      FieldName = 'cd_resp'
    end
    object tblMensalidadescd_desc_condicional: TLargeintField
      FieldName = 'cd_desc_condicional'
    end
    object tblMensalidadescd_cheque_devolvido: TLargeintField
      FieldName = 'cd_cheque_devolvido'
    end
    object tblMensalidadessn_cobranca: TLargeintField
      FieldName = 'sn_cobranca'
    end
    object tblMensalidadescd_boleto: TLargeintField
      FieldName = 'cd_boleto'
    end
    object tblMensalidadescd_mensalidade: TIntegerField
      Tag = 1
      DisplayLabel = 'C'#243'd. T'#237'tulo'
      FieldName = 'cd_mensalidade'
    end
    object tblMensalidadessn_spc: TSmallintField
      FieldName = 'sn_spc'
    end
    object tblMensalidadessn_serasa: TSmallintField
      FieldName = 'sn_serasa'
    end
    object tblMensalidadessn_juridico: TSmallintField
      FieldName = 'sn_juridico'
    end
    object tblMensalidadesnr_nf: TLargeintField
      Tag = 1
      DisplayLabel = 'NF'
      DisplayWidth = 10
      FieldName = 'nr_nf'
    end
    object tblMensalidadessn_nfe_gerada: TSmallintField
      FieldName = 'sn_nfe_gerada'
    end
    object tblMensalidadescd_autenticacao: TStringField
      Tag = 1
      DisplayLabel = 'C'#243'd. Autentica'#231#227'o'
      FieldName = 'cd_autenticacao'
      Size = 50
    end
    object tblMensalidadesDDA: TStringField
      Tag = 1
      DisplayLabel = 'D'#233'b. Aut.'
      FieldKind = fkCalculated
      FieldName = 'DDA'
      Size = 10
      Calculated = True
    end
    object tblMensalidadesvalorjuros_fixo: TFloatField
      FieldName = 'valorjuros_fixo'
    end
    object tblMensalidadesds_curso: TStringField
      Tag = 1
      DisplayLabel = 'Curso'
      DisplayWidth = 80
      FieldName = 'ds_curso'
      Size = 200
    end
    object tblMensalidadesds_turma: TStringField
      Tag = 1
      DisplayLabel = 'Turma'
      DisplayWidth = 80
      FieldName = 'ds_turma'
      Size = 200
    end
    object tblMensalidadesds_cor_background: TStringField
      FieldName = 'ds_cor_background'
      Size = 7
    end
    object tblMensalidadesds_cor_fonte: TStringField
      FieldName = 'ds_cor_fonte'
      Size = 7
    end
    object tblMensalidadesvalordesconto_fixo: TFloatField
      FieldName = 'valordesconto_fixo'
    end
    object tblMensalidadescd_moeda: TLargeintField
      FieldName = 'cd_moeda'
    end
    object tblMensalidadescd_moeda_pgto: TLargeintField
      FieldName = 'cd_moeda_pgto'
    end
    object tblMensalidadesds_deposito: TStringField
      FieldName = 'ds_deposito'
      Size = 50
    end
    object tblMensalidadesdepto_descricao: TStringField
      Tag = 1
      DisplayLabel = 'Nome Depto.'
      DisplayWidth = 30
      FieldName = 'depto_descricao'
      Size = 255
    end
  end
  object qryUpdate: TUMZQuery
    Connection = DM.db
    SQL.Strings = (
      'update Mensalidades set Bloqueto = :Bloqueto'
      'where'
      'CodigoAluno = :CodigoAluno and'
      'Parcela = :Parcela and'
      'Turma = :Turma and'
      'DataVencimento = :DataVencimento')
    Params = <
      item
        DataType = ftBoolean
        Name = 'Bloqueto'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'CodigoAluno'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'Parcela'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'Turma'
        ParamType = ptUnknown
      end
      item
        DataType = ftDateTime
        Name = 'DataVencimento'
        ParamType = ptUnknown
      end>
    Left = 136
    Top = 296
    ParamData = <
      item
        DataType = ftBoolean
        Name = 'Bloqueto'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'CodigoAluno'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'Parcela'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'Turma'
        ParamType = ptUnknown
      end
      item
        DataType = ftDateTime
        Name = 'DataVencimento'
        ParamType = ptUnknown
      end>
  end
  object popMensalidades: TPopupMenu
    Left = 168
    Top = 296
    object PorAluno1: TMenuItem
      Tag = 1
      Caption = 'Por Aluno...'
    end
    object PorTurma1: TMenuItem
      Tag = 2
      Caption = 'Por Turma...'
    end
    object PeloNossoNumero1: TMenuItem
      Caption = 'Pelo NossoNumero'
    end
    object PorCheque1: TMenuItem
      Caption = 'Por Cheque'
    end
    object PorResponsvel1: TMenuItem
      Caption = 'Por Respons'#225'vel'
    end
    object PorTalodeDepsito1: TMenuItem
      Caption = 'Por Tal'#227'o de Dep'#243'sito'
    end
    object PorCdigodeBarras1: TMenuItem
      Caption = 'Por C'#243'digo de Barras'
    end
  end
  object pmQtd: TPopupMenu
    OnPopup = pmQtdPopup
    Left = 664
    Top = 256
  end
  object pmLogs: TPopupMenu
    OnPopup = pmLogsPopup
    Left = 200
    Top = 296
  end
  object qyAux: TUMZQuery
    Connection = DM.db
    Params = <>
    Left = 736
    Top = 104
  end
  object pmProtestos: TPopupMenu
    OnPopup = pmProtestosPopup
    Left = 602
    Top = 464
  end
  object pmOutrasOpcoes: TPopupMenu
    MenuAnimation = [maBottomToTop]
    Left = 12
    Top = 533
    object pmoReajustar: TMenuItem
      Caption = 'Reajustar'
      OnClick = pmoReajustarClick
    end
    object pmoProrrogar: TMenuItem
      Caption = '&Prorrogar'
      OnClick = pmoProrrogarClick
    end
    object LiberarJurosDesc1: TMenuItem
      Caption = 'Liberar Juros/Desc.'
      OnClick = LiberarJurosDesc1Click
    end
    object DividirTtulos1: TMenuItem
      Caption = 'Dividir T'#237'tulos'
      OnClick = DividirTtulos1Click
    end
    object AlterarResponsveldoTtulo1: TMenuItem
      Caption = 'Alterar Respons'#225'vel do T'#237'tulo'
      OnClick = AlterarResponsveldoTtulo1Click
    end
    object CancelarTaxasdeExamede2poca1: TMenuItem
      Caption = 'Cancelar Taxas de Exame de 2'#170' '#201'poca'
      OnClick = CancelarTaxasdeExamede2poca1Click
    end
    object VendadeProdutos1: TMenuItem
      Caption = 'Venda de Produtos (F2)'
      OnClick = VendadeProdutos1Click
    end
    object Desagruparboleto1: TMenuItem
      Caption = 'Desagrupar boleto'
      OnClick = Desagruparboleto1Click
    end
    object N1: TMenuItem
      Caption = '-'
    end
    object NotificarresponsveisdaMensalidade1: TMenuItem
      Caption = 'Notificar respons'#225'veis da Mensalidade (Ctrl-N)'
      OnClick = NotificarresponsveisdaMensalidade1Click
    end
    object N2: TMenuItem
      Caption = '-'
    end
    object Gerarcrditoparaapessoa1: TMenuItem
      Caption = 'Gerar cr'#233'dito para a pessoa'
      OnClick = Gerarcrditoparaapessoa1Click
    end
    object Utilizarcrditosdisponveis1: TMenuItem
      Caption = 'Utilizar cr'#233'ditos dispon'#237'veis'
      OnClick = Utilizarcrditosdisponveis1Click
    end
    object N3: TMenuItem
      Caption = '-'
    end
    object PagarcomPagSeguro1: TMenuItem
      Caption = 'Pagar com PagSeguro'
      OnClick = PagarcomPagSeguro1Click
    end
  end
  object qryUpdateResp: TUMZQuery
    Connection = DM.db
    SQL.Strings = (
      'UPDATE MENSALIDADES'
      'SET'
      '   CD_RESP = :CD_RESP,'
      '   NOSSONUMERO = :NOSSONUMERO'
      'WHERE'
      '   CD_MENSALIDADE = :CD_MENSALIDADE')
    Params = <
      item
        DataType = ftUnknown
        Name = 'CD_RESP'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'NOSSONUMERO'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'CD_MENSALIDADE'
        ParamType = ptUnknown
      end>
    Left = 40
    Top = 336
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'CD_RESP'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'NOSSONUMERO'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'CD_MENSALIDADE'
        ParamType = ptUnknown
      end>
  end
  object qryDeleteBoleto: TUMZQuery
    Connection = DM.db
    SQL.Strings = (
      'DELETE FROM FIN_BOLETO'
      'WHERE'
      '   CD_BOLETO = :CD_BOLETO ')
    Params = <
      item
        DataType = ftUnknown
        Name = 'CD_BOLETO'
        ParamType = ptUnknown
      end>
    Left = 72
    Top = 336
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'CD_BOLETO'
        ParamType = ptUnknown
      end>
  end
end
