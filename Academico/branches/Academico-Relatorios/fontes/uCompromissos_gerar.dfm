object frm_Compromisso_Gerar: Tfrm_Compromisso_Gerar
  Left = 229
  Top = 154
  Caption = 'Gerar Compromissos'
  ClientHeight = 448
  ClientWidth = 752
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  OnClose = FormClose
  OnCreate = FormCreate
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object Bevel7: TBevel
    Left = 240
    Top = 48
    Width = 483
    Height = 22
  end
  object Label1: TLabel
    Left = 8
    Top = 32
    Width = 53
    Height = 13
    Caption = 'Cod. T'#237'tulo'
    FocusControl = DBEdit1
  end
  object Label2: TLabel
    Left = 96
    Top = 32
    Width = 79
    Height = 13
    Caption = 'C'#243'd. Fornecedor'
    FocusControl = dbFornecedor
  end
  object lbNomeFornecedor: TLabel
    Left = 245
    Top = 51
    Width = 32
    Height = 16
    Caption = '        '
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Arial'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object Label3: TLabel
    Left = 240
    Top = 32
    Width = 100
    Height = 13
    Caption = 'Nome do Fornecedor'
  end
  object sbFornecedor: TSpeedButton
    Left = 208
    Top = 48
    Width = 24
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
    OnClick = sbFornecedorClick
  end
  object Label4: TLabel
    Left = 8
    Top = 128
    Width = 53
    Height = 13
    Caption = 'Cod. Conta'
    FocusControl = dbConta
  end
  object Label5: TLabel
    Left = 88
    Top = 128
    Width = 94
    Height = 13
    Caption = 'Descri'#231#227'o da Conta'
    FocusControl = dbDescConta
  end
  object Label6: TLabel
    Left = 376
    Top = 128
    Width = 120
    Height = 13
    Caption = 'Hist'#243'rico do compromisso'
    FocusControl = dbHistorico
  end
  object Label7: TLabel
    Left = 8
    Top = 75
    Width = 67
    Height = 13
    Caption = 'Tipo do T'#237'tulo'
    FocusControl = dbTipoTitulo
  end
  object Label8: TLabel
    Left = 216
    Top = 75
    Width = 109
    Height = 13
    Caption = 'N'#186' Doc. (Nota/Recibo)'
    FocusControl = dbDocumento
  end
  object Label9: TLabel
    Left = 448
    Top = 75
    Width = 36
    Height = 13
    Caption = 'Parcela'
    FocusControl = dbParcela
  end
  object Label10: TLabel
    Left = 592
    Top = 75
    Width = 80
    Height = 13
    Caption = 'Emiss'#227'o da Nota'
    FocusControl = dbDataEmissao
  end
  object Label12: TLabel
    Left = 121
    Top = 176
    Width = 62
    Height = 13
    Caption = 'Compet'#234'ncia'
    FocusControl = dbDataCompetencia
  end
  object Label13: TLabel
    Left = 221
    Top = 176
    Width = 56
    Height = 13
    Caption = 'Vencimento'
    FocusControl = dbDataVencimento
  end
  object Label14: TLabel
    Left = 321
    Top = 176
    Width = 67
    Height = 13
    Caption = 'Prov'#225'vel Pgto'
    FocusControl = dbDataProvavel
  end
  object Label22: TLabel
    Left = 8
    Top = 176
    Width = 104
    Height = 13
    Caption = 'Valor do Compromisso'
    FocusControl = dbValor
  end
  object Bevel1: TBevel
    Left = 5
    Top = 120
    Width = 723
    Height = 8
    Shape = bsTopLine
  end
  object Label11: TLabel
    Left = 420
    Top = 176
    Width = 151
    Height = 13
    Caption = 'Forma Prevista para Pagamento'
    FocusControl = dbDataProvavel
  end
  object Label16: TLabel
    Left = 584
    Top = 176
    Width = 56
    Height = 13
    Caption = 'Conta Pgto.'
    FocusControl = DBLookupComboBox2
  end
  object sbConta: TSpeedButton
    Left = 352
    Top = 143
    Width = 24
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
    OnClick = sbContaClick
  end
  object pnTitulo: TPanel
    Left = 0
    Top = 0
    Width = 752
    Height = 25
    Align = alTop
    BevelOuter = bvLowered
    Caption = 'COMPROMISSO A PAGAR'
    Color = clBlue
    Font.Charset = ANSI_CHARSET
    Font.Color = clWhite
    Font.Height = -13
    Font.Name = 'Arial'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 16
  end
  object DBEdit1: TDBEdit
    Left = 9
    Top = 48
    Width = 81
    Height = 21
    DataField = 'cd_titulo'
    DataSource = scrCompromisso
    Enabled = False
    ReadOnly = True
    TabOrder = 0
    OnKeyPress = DBEdit1KeyPress
  end
  object dbFornecedor: TDBEdit
    Left = 95
    Top = 48
    Width = 113
    Height = 21
    DataField = 'cd_pessoa'
    DataSource = scrCompromisso
    TabOrder = 1
    OnExit = dbFornecedorExit
    OnKeyPress = DBEdit1KeyPress
  end
  object dbConta: TDBEdit
    Left = 8
    Top = 144
    Width = 73
    Height = 21
    DataField = 'cd_conta'
    DataSource = srcApropriacao
    TabOrder = 6
    OnClick = dbContaClick
    OnKeyPress = DBEdit1KeyPress
  end
  object dbDescConta: TDBLookupComboBox
    Left = 88
    Top = 144
    Width = 265
    Height = 21
    DataField = 'descPlanoConta'
    DataSource = srcApropriacao
    NullValueKey = 46
    TabOrder = 7
    OnEnter = dbDescContaEnter
    OnExit = dbDescContaExit
    OnKeyPress = DBEdit1KeyPress
  end
  object dbHistorico: TDBEdit
    Left = 376
    Top = 144
    Width = 345
    Height = 21
    DataField = 'ds_despesa'
    DataSource = scrCompromisso
    TabOrder = 8
    OnKeyPress = DBEdit1KeyPress
  end
  object dbTipoTitulo: TDBLookupComboBox
    Left = 8
    Top = 91
    Width = 201
    Height = 21
    DataField = 'descTipoTitulo'
    DataSource = scrCompromisso
    TabOrder = 2
    OnExit = dbTipoTituloExit
    OnKeyPress = DBEdit1KeyPress
  end
  object dbDocumento: TDBEdit
    Left = 216
    Top = 91
    Width = 217
    Height = 21
    DataField = 'nr_documento'
    DataSource = scrCompromisso
    TabOrder = 3
    OnExit = dbDocumentoExit
    OnKeyPress = DBEdit1KeyPress
  end
  object dbParcela: TDBEdit
    Left = 448
    Top = 91
    Width = 134
    Height = 21
    DataField = 'nr_parcela'
    DataSource = scrCompromisso
    TabOrder = 4
    OnExit = dbParcelaExit
    OnKeyPress = DBEdit1KeyPress
  end
  object dbDataEmissao: TDBEdit
    Left = 592
    Top = 91
    Width = 129
    Height = 21
    DataField = 'dt_emissao_nota'
    DataSource = scrCompromisso
    TabOrder = 5
    OnKeyPress = DBEdit1KeyPress
  end
  object dbDataCompetencia: TDBEdit
    Left = 121
    Top = 192
    Width = 90
    Height = 21
    DataField = 'dt_competencia'
    DataSource = scrCompromisso
    TabOrder = 10
    OnKeyPress = DBEdit1KeyPress
  end
  object dbDataVencimento: TDBEdit
    Left = 221
    Top = 192
    Width = 90
    Height = 21
    DataField = 'dt_vencimento'
    DataSource = scrCompromisso
    TabOrder = 11
    OnKeyPress = DBEdit1KeyPress
  end
  object dbDataProvavel: TDBEdit
    Left = 321
    Top = 192
    Width = 90
    Height = 21
    DataField = 'dt_provavel_pgto'
    DataSource = scrCompromisso
    TabOrder = 12
    OnKeyPress = DBEdit1KeyPress
  end
  object pgApropriacao: TPageControl
    Left = 0
    Top = 225
    Width = 752
    Height = 191
    ActivePage = tsComApropriacao
    Align = alBottom
    MultiLine = True
    Style = tsFlatButtons
    TabOrder = 15
    OnChange = pgApropriacaoChange
    OnEnter = pgApropriacaoEnter
    object tsSemApropriacao: TTabSheet
      Caption = 'Sem Apropria'#231#227'o'
      object Label20: TLabel
        Left = 2
        Top = 2
        Width = 56
        Height = 13
        Caption = 'Cod. Centro'
        FocusControl = dbCodCentro
      end
      object Label21: TLabel
        Left = 67
        Top = 2
        Width = 81
        Height = 13
        Caption = 'Centro de Custos'
        FocusControl = DBLookupComboBox5
      end
      object dbCodCentro: TDBEdit
        Left = 2
        Top = 18
        Width = 63
        Height = 21
        DataField = 'cd_centro'
        DataSource = srcApropriacao
        TabOrder = 0
        OnKeyPress = DBEdit1KeyPress
      end
      object DBLookupComboBox5: TDBLookupComboBox
        Left = 67
        Top = 18
        Width = 257
        Height = 21
        DataField = 'descCentroCusto'
        DataSource = srcApropriacao
        DropDownWidth = 400
        NullValueKey = 46
        TabOrder = 1
        OnKeyPress = DBEdit1KeyPress
      end
    end
    object tsComApropriacao: TTabSheet
      Caption = 'Com Apropria'#231#227'o'
      object Label15: TLabel
        Left = 8
        Top = 4
        Width = 110
        Height = 13
        Caption = 'Crit'#233'rio de Apropria'#231#227'o:'
      end
      object sbAdicionarApropriacao: TSpeedButton
        Left = 577
        Top = 0
        Width = 76
        Height = 22
        Hint = 'Incluir Plano de Contas'
        Caption = 'Adicionar'
        Flat = True
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
        OnClick = sbAdicionarApropriacaoClick
      end
      object sbRemoverApropriacao: TSpeedButton
        Left = 653
        Top = 0
        Width = 76
        Height = 22
        Hint = 'Incluir Plano de Contas'
        Caption = 'Remover'
        Flat = True
        Glyph.Data = {
          42020000424D4202000000000000420000002800000010000000100000000100
          1000030000000002000000000000000000000000000000000000007C0000E003
          00001F0000001F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C
          1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C
          000000001F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C
          0000FF7F1F7C1F7C1F7C1F7C00000000FF7F1F7C1F7C1F7C1F7C1F7C1F7C0000
          FF7F1F7C1F7C1F7C1F7C1F7C00000000FF7F1F7C1F7C1F7C1F7C1F7C1F7C0000
          FF7F1F7C1F7C1F7C1F7C1F7C000000000000FF7F1F7C1F7C1F7C00000000FF7F
          1F7C1F7C1F7C1F7C1F7C1F7C1F7C000000000000FF7F1F7C00000000FF7F1F7C
          1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C00000000000000000000FF7F1F7C1F7C
          1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C000000000000FF7F1F7C1F7C1F7C
          1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C00000000000000000000FF7F1F7C1F7C
          1F7C1F7C1F7C1F7C1F7C1F7C1F7C000000000000FF7F1F7C000000001F7C1F7C
          1F7C1F7C1F7C1F7C1F7C1F7C000000000000FF7F1F7C1F7C1F7C000000000000
          1F7C1F7C1F7C1F7C0000000000000000FF7F1F7C1F7C1F7C1F7C1F7C00000000
          FF7F1F7C1F7C1F7C00000000FF7F1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C0000
          000000001F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C
          1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C
          1F7C1F7C1F7C}
        OnClick = sbRemoverApropriacaoClick
      end
      object grdApropria: TDBGrid
        Left = 3
        Top = 27
        Width = 721
        Height = 126
        BorderStyle = bsNone
        DataSource = srcApropriacao
        Options = [dgEditing, dgTitles, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgConfirmDelete, dgCancelOnExit]
        TabOrder = 0
        TitleFont.Charset = DEFAULT_CHARSET
        TitleFont.Color = clWindowText
        TitleFont.Height = -11
        TitleFont.Name = 'MS Sans Serif'
        TitleFont.Style = []
        OnKeyDown = grdApropriaKeyDown
        Columns = <
          item
            Expanded = False
            FieldName = 'cd_conta'
            Width = 65
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'descPlanoConta'
            Width = 240
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'cd_centro'
            Width = 65
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'descCentroCusto'
            Width = 240
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'vl_movimento'
            Visible = True
          end>
      end
      object cbApropria: TComboBox
        Left = 124
        Top = -1
        Width = 390
        Height = 22
        Style = csOwnerDrawFixed
        ItemHeight = 16
        TabOrder = 1
        OnChange = cbApropriaChange
      end
    end
    object tsObservacao: TTabSheet
      Caption = 'Observa'#231#245'es'
      ImageIndex = 2
      object dbmObservacao: TDBMemo
        Left = 0
        Top = 0
        Width = 744
        Height = 160
        Align = alClient
        DataField = 'ds_observacao'
        DataSource = scrCompromisso
        ScrollBars = ssVertical
        TabOrder = 0
      end
    end
  end
  object Panel1: TPanel
    Left = 0
    Top = 416
    Width = 752
    Height = 32
    Align = alBottom
    BevelOuter = bvNone
    TabOrder = 17
    object btnConfirmar: TBitBtn
      Left = 531
      Top = 2
      Width = 107
      Height = 25
      Caption = 'Confirmar'
      TabOrder = 0
      OnClick = btnConfirmarClick
      Glyph.Data = {
        F2010000424DF201000000000000760000002800000024000000130000000100
        0400000000007C01000000000000000000001000000000000000000000000000
        80000080000000808000800000008000800080800000C0C0C000808080000000
        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333334433333
        3333333333388F3333333333000033334224333333333333338338F333333333
        0000333422224333333333333833338F33333333000033422222243333333333
        83333338F3333333000034222A22224333333338F33F33338F33333300003222
        A2A2224333333338F383F3338F33333300003A2A222A222433333338F8333F33
        38F33333000034A22222A22243333338833333F3338F333300004222A2222A22
        2433338F338F333F3338F3330000222A3A2224A22243338F3838F338F3338F33
        0000A2A333A2224A2224338F83338F338F3338F300003A33333A2224A2224338
        333338F338F3338F000033333333A2224A2243333333338F338F338F00003333
        33333A2224A2233333333338F338F83300003333333333A2224A333333333333
        8F338F33000033333333333A222433333333333338F338F30000333333333333
        A224333333333333338F38F300003333333333333A223333333333333338F8F3
        000033333333333333A3333333333333333383330000}
      NumGlyphs = 2
    end
    object btnCancelar: TBitBtn
      Left = 644
      Top = 2
      Width = 83
      Height = 25
      Cancel = True
      Caption = 'Cancelar'
      TabOrder = 1
      OnClick = btnCancelarClick
      Glyph.Data = {
        DE010000424DDE01000000000000760000002800000024000000120000000100
        0400000000006801000000000000000000001000000000000000000000000000
        80000080000000808000800000008000800080800000C0C0C000808080000000
        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333333333333
        333333333333333333333333000033338833333333333333333F333333333333
        0000333911833333983333333388F333333F3333000033391118333911833333
        38F38F333F88F33300003339111183911118333338F338F3F8338F3300003333
        911118111118333338F3338F833338F3000033333911111111833333338F3338
        3333F8330000333333911111183333333338F333333F83330000333333311111
        8333333333338F3333383333000033333339111183333333333338F333833333
        00003333339111118333333333333833338F3333000033333911181118333333
        33338333338F333300003333911183911183333333383338F338F33300003333
        9118333911183333338F33838F338F33000033333913333391113333338FF833
        38F338F300003333333333333919333333388333338FFF830000333333333333
        3333333333333333333888330000333333333333333333333333333333333333
        0000}
      NumGlyphs = 2
    end
    object dbPrevisao: TDBCheckBox
      Left = 8
      Top = 5
      Width = 361
      Height = 17
      TabStop = False
      Caption = 'Considerar somente como previs'#227'o de despesa'
      DataField = 'sn_previsao'
      DataSource = scrCompromisso
      TabOrder = 2
      ValueChecked = 'S'
      ValueUnchecked = 'N'
    end
    object btnAdicionar: TBitBtn
      Left = 319
      Top = 2
      Width = 165
      Height = 23
      Caption = 'Adicionar Parcela'
      TabOrder = 3
      OnClick = btnAdicionarClick
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
  end
  object dbValor: TDBEdit
    Left = 8
    Top = 192
    Width = 105
    Height = 21
    DataField = 'vl_despesa'
    DataSource = scrCompromisso
    TabOrder = 9
    OnKeyPress = DBEdit1KeyPress
  end
  object DBLookupComboBox1: TDBLookupComboBox
    Left = 421
    Top = 192
    Width = 153
    Height = 21
    DataField = 'descFormaPgto'
    DataSource = scrCompromisso
    DropDownWidth = 170
    TabOrder = 13
    OnKeyPress = DBLookupComboBox1KeyPress
  end
  object DBLookupComboBox2: TDBLookupComboBox
    Left = 584
    Top = 192
    Width = 137
    Height = 21
    DataField = 'descCaixa'
    DataSource = scrCompromisso
    DropDownWidth = 170
    NullValueKey = 46
    TabOrder = 14
    OnKeyPress = DBLookupComboBox2KeyPress
  end
  object qyCompromisso: TUMZQuery
    Connection = DM.db
    AfterOpen = qyCompromissoAfterOpen
    AfterInsert = qyCompromissoAfterInsert
    BeforePost = qyCompromissoBeforePost
    AfterPost = qyCompromissoAfterPost
    SQL.Strings = (
      'SELECT'
      '   CD_TITULO,'
      '   CD_COLIGADA,'
      '   CD_PESSOA,'
      '   DS_DESPESA,'
      '   NR_DOCUMENTO,'
      '   NR_PARCELA,'
      '   DT_EMISSAO_NOTA,'
      '   DT_LANCAMENTO,'
      '   DT_COMPETENCIA,'
      '   DT_VENCIMENTO,'
      '   DT_PROVAVEL_PGTO,'
      '   DT_PAGAMENTO,'
      '   VL_DESPESA,'
      '   CD_SITUACAO,'
      '   SN_PREVISAO,'
      '   CD_TIPO_TITULO,'
      '   TP_ENTRADA_SAIDA,'
      '   CD_FORMA_PGTO,'
      '   NR_CHEQUE,'
      '   CD_CAIXA,'
      '   CD_TITULO_ORIGEM,'
      '   CD_AUTORIZA,'
      '   DS_OBSERVACAO,'
      '   CD_TITULO_PRINCIPAL'
      'FROM'
      '   FIN_CONTAS_PAGAR'
      'WHERE'
      '   CD_TITULO = :CD_TITULO AND'
      '   CD_COLIGADA = :CD_COLIGADA'
      ''
      '   '
      '   '
      '   '
      '   '
      '')
    Params = <
      item
        DataType = ftInteger
        Name = 'cd_titulo'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'cd_coligada'
        ParamType = ptUnknown
      end>
    ParamData = <
      item
        DataType = ftInteger
        Name = 'cd_titulo'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'cd_coligada'
        ParamType = ptUnknown
      end>
    object qyCompromissocd_titulo: TLargeintField
      DisplayLabel = 'Cod. T'#237'tulo'
      FieldName = 'cd_titulo'
      Origin = 'WMESTRE12.fin_contas_pagar.cd_titulo'
    end
    object qyCompromissocd_pessoa: TIntegerField
      DisplayLabel = 'C'#243'd. Fornecedor'
      FieldName = 'cd_pessoa'
      Origin = 'WMESTRE12.fin_contas_pagar.cd_pessoa'
    end
    object qyCompromissods_despesa: TStringField
      DisplayLabel = 'Hist'#243'rico do compromisso'
      FieldName = 'ds_despesa'
      Origin = 'WMESTRE12.fin_contas_pagar.ds_despesa'
      Size = 255
    end
    object qyCompromissodescTipoTitulo: TStringField
      DisplayLabel = 'Tipo do T'#237'tulo'
      FieldKind = fkLookup
      FieldName = 'descTipoTitulo'
      LookupDataSet = DM.qyTiposTitulo
      LookupKeyFields = 'cd_tipo_titulo'
      LookupResultField = 'ds_tipo_titulo'
      KeyFields = 'cd_tipo_titulo'
      Size = 40
      Lookup = True
    end
    object qyCompromissocd_tipo_titulo: TSmallintField
      FieldName = 'cd_tipo_titulo'
      Origin = 'WMESTRE12.fin_contas_pagar.cd_tipo_titulo'
    end
    object qyCompromissonr_documento: TStringField
      DisplayLabel = 'N'#186' Doc. (Nota/Recibo)'
      FieldName = 'nr_documento'
      Origin = 'WMESTRE12.fin_contas_pagar.nr_documento'
      Size = 50
    end
    object qyCompromissonr_parcela: TSmallintField
      DisplayLabel = 'Parcela'
      FieldName = 'nr_parcela'
      Origin = 'WMESTRE12.fin_contas_pagar.dt_emissao_nota'
    end
    object qyCompromissodt_emissao_nota: TDateTimeField
      DisplayLabel = 'Data de Emiss'#227'o da Nota'
      FieldName = 'dt_emissao_nota'
      Origin = 'WMESTRE12.fin_contas_pagar.dt_emissao_nota'
      DisplayFormat = 'dd/mm/yyyy'
      EditMask = '!99/99/9999;1;_'
    end
    object qyCompromissodt_lancamento: TDateTimeField
      DisplayLabel = 'Data Lan'#231'amento'
      FieldName = 'dt_lancamento'
      Origin = 'WMESTRE12.fin_contas_pagar.dt_lancamento'
      DisplayFormat = 'dd/mm/yyyy'
      EditMask = '!99/99/9999;1;_'
    end
    object qyCompromissodt_competencia: TDateTimeField
      DisplayLabel = 'Data da Compet'#234'ncia'
      FieldName = 'dt_competencia'
      Origin = 'WMESTRE12.fin_contas_pagar.dt_competencia'
      OnChange = qyCompromissodt_competenciaChange
      DisplayFormat = 'dd/mm/yyyy'
      EditMask = '!99/99/9999;1;_'
    end
    object qyCompromissodt_vencimento: TDateTimeField
      DisplayLabel = 'Data de Vencimento'
      FieldName = 'dt_vencimento'
      Origin = 'WMESTRE12.fin_contas_pagar.dt_vencimento'
      OnChange = qyCompromissodt_vencimentoChange
      DisplayFormat = 'dd/mm/yyyy'
      EditMask = '!99/99/9999;1;_'
    end
    object qyCompromissodt_provavel_pgto: TDateTimeField
      DisplayLabel = 'Data para Prov'#225'vel Pgto'
      FieldName = 'dt_provavel_pgto'
      Origin = 'WMESTRE12.fin_contas_pagar.dt_provavel_pgto'
      DisplayFormat = 'dd/mm/yyyy'
      EditMask = '!99/99/9999;1;_'
    end
    object qyCompromissovl_despesa: TFloatField
      DisplayLabel = 'Valor do Compromisso'
      FieldName = 'vl_despesa'
      Origin = 'WMESTRE12.fin_contas_pagar.vl_despesa'
      OnChange = qyCompromissovl_despesaChange
      DisplayFormat = '###,###,##0.00'
      EditFormat = '0.00'
    end
    object qyCompromissocd_situacao: TSmallintField
      FieldName = 'cd_situacao'
      Origin = 'WMESTRE12.fin_contas_pagar.cd_situacao'
    end
    object qyCompromissosn_previsao: TStringField
      DisplayLabel = 'Somente Previs'#227'o'
      FieldName = 'sn_previsao'
      Origin = 'WMESTRE12.fin_contas_pagar.sn_previsao'
      FixedChar = True
      Size = 1
    end
    object qyCompromissotp_entrada_saida: TSmallintField
      FieldName = 'tp_entrada_saida'
      Origin = 'WMESTRE12.fin_contas_pagar.tp_entrada_saida'
    end
    object qyCompromissocd_coligada: TSmallintField
      FieldName = 'cd_coligada'
      Origin = 'WMESTRE12.fin_contas_pagar.cd_coligada'
    end
    object qyCompromissodescFormaPgto: TStringField
      FieldKind = fkLookup
      FieldName = 'descFormaPgto'
      LookupDataSet = qyFormas
      LookupKeyFields = 'cd_forma_pgto'
      LookupResultField = 'ds_forma_pgto'
      KeyFields = 'cd_forma_pgto'
      Size = 50
      Lookup = True
    end
    object qyCompromissocd_caixa: TLargeintField
      FieldName = 'cd_caixa'
      Origin = 'WMESTRE12.fin_contas_pagar.cd_caixa'
    end
    object qyCompromissodescCaixa: TStringField
      FieldKind = fkLookup
      FieldName = 'descCaixa'
      LookupDataSet = qyContas
      LookupKeyFields = 'cd_caixa'
      LookupResultField = 'ds_caixa'
      KeyFields = 'cd_caixa'
      Size = 50
      Lookup = True
    end
    object qyCompromissods_observacao: TMemoField
      FieldName = 'ds_observacao'
      Origin = 'WMESTRE12.fin_contas_pagar.ds_observacao'
      BlobType = ftMemo
      Size = 1
    end
    object qyCompromissoCD_FORMA_PGTO: TLargeintField
      FieldName = 'CD_FORMA_PGTO'
    end
    object qyCompromissoNR_CHEQUE: TLargeintField
      FieldName = 'NR_CHEQUE'
    end
    object qyCompromissoCD_TITULO_ORIGEM: TLargeintField
      FieldName = 'CD_TITULO_ORIGEM'
    end
    object qyCompromissoCD_AUTORIZA: TLargeintField
      FieldName = 'CD_AUTORIZA'
    end
    object qyCompromissoCD_TITULO_PRINCIPAL: TLargeintField
      FieldName = 'CD_TITULO_PRINCIPAL'
    end
  end
  object scrCompromisso: TDataSource
    DataSet = qyCompromisso
    Left = 32
  end
  object qyApropriacao: TUMZQuery
    Connection = DM.db
    AfterInsert = qyApropriacaoAfterInsert
    BeforePost = qyApropriacaoBeforePost
    AfterPost = qyApropriacaoAfterPost
    OnNewRecord = qyApropriacaoNewRecord
    SQL.Strings = (
      'SELECT '
      '   CD_TITULO,'
      '   CD_COLIGADA,'
      '   CD_CONTA,'
      '   CD_CENTRO,'
      '   VL_MOVIMENTO'
      'FROM '
      '   FIN_APROPRIA_CP'
      'WHERE '
      '   CD_TITULO = :CD_TITULO AND'
      '   CD_COLIGADA = :CD_COLIGADA')
    Params = <
      item
        DataType = ftInteger
        Name = 'cd_titulo'
        ParamType = ptUnknown
        Size = 4
      end
      item
        DataType = ftUnknown
        Name = 'cd_coligada'
        ParamType = ptUnknown
      end>
    DataSource = scrCompromisso
    Left = 96
    ParamData = <
      item
        DataType = ftInteger
        Name = 'cd_titulo'
        ParamType = ptUnknown
        Size = 4
      end
      item
        DataType = ftUnknown
        Name = 'cd_coligada'
        ParamType = ptUnknown
      end>
    object qyApropriacaocd_titulo: TIntegerField
      DisplayLabel = 'Cod. T'#237'tulo'
      FieldName = 'cd_titulo'
      Origin = 'WMESTRE12.fin_apropria_cp.cd_titulo'
    end
    object qyApropriacaocd_conta: TIntegerField
      DisplayLabel = 'Cod. Conta'
      FieldName = 'cd_conta'
      Origin = 'WMESTRE12.fin_apropria_cp.cd_conta'
    end
    object qyApropriacaocd_centro: TIntegerField
      DisplayLabel = 'Cod. Centro'
      FieldName = 'cd_centro'
      Origin = 'WMESTRE12.fin_apropria_cp.cd_centro'
    end
    object qyApropriacaovl_movimento: TFloatField
      DisplayLabel = 'Valor Apropriado'
      FieldName = 'vl_movimento'
      Origin = 'WMESTRE12.fin_apropria_cp.vl_movimento'
      DisplayFormat = '###,###,##0.00'
      EditFormat = '0.00'
    end
    object qyApropriacaodescPlanoConta: TStringField
      DisplayLabel = 'Plano de Contas'
      FieldKind = fkLookup
      FieldName = 'descPlanoConta'
      LookupDataSet = qyPlano_Contas
      LookupKeyFields = 'cd_conta'
      LookupResultField = 'ds_conta'
      KeyFields = 'cd_conta'
      Size = 50
      Lookup = True
    end
    object qyApropriacaodescCentroCusto: TStringField
      DisplayLabel = 'Centro de Custos'
      FieldKind = fkLookup
      FieldName = 'descCentroCusto'
      LookupDataSet = qyCentro_Custos
      LookupKeyFields = 'cd_centro'
      LookupResultField = 'desClassificacaoDesc'
      KeyFields = 'cd_centro'
      Size = 50
      Lookup = True
    end
    object qyApropriacaocd_coligada: TSmallintField
      FieldName = 'cd_coligada'
      Origin = 'WMESTRE12.fin_apropria_cp.cd_coligada'
    end
  end
  object srcApropriacao: TDataSource
    DataSet = qyApropriacao
    Left = 128
  end
  object qyPlano_Contas: TUMZQuery
    Connection = DM.db
    SQL.Strings = (
      'SELECT'
      '   CD_CONTA,'
      '   CD_COLIGADA,'
      '   DS_CONTA,'
      '   CD_CLASSIFICACAO,'
      '   CD_APROPRIACAO,'
      '   TP_CONTA,'
      '   TP_ENTRADA_SAIDA,'
      '   SN_ATIVO,'
      '   CD_CONTA_CONTABIL,'
      '   CD_CLASS1,'
      '   CD_CLASS2,'
      '   CD_CLASS3,'
      '   CD_CLASS4,'
      '   CD_CLASS5,'
      '   CD_CLASS6,'
      '   CD_CLASS7,'
      '   CD_CLASS8,'
      '   CD_CLASS9,'
      '   CD_GRUPO_PRINCIPAL,'
      '   CD_CRITERIO,'
      '   SN_CUSTEIO,'
      '   DS_FORMULA_CALCULO,'
      '   CD_GRUPO_CUSTEIO,'
      '   DS_OBSERVACAO'
      'FROM'
      '   FIN_PLANO_CONTAS'
      'WHERE'
      '   TP_CONTA = 1 AND'
      '   CD_COLIGADA = :CD_COLIGADA AND'
      '   SN_ATIVO = 1 AND'
      '   TP_ENTRADA_SAIDA IN (0,2)'
      'ORDER BY'
      '   DS_CONTA')
    Params = <
      item
        DataType = ftUnknown
        Name = 'cd_coligada'
        ParamType = ptUnknown
      end>
    Left = 216
    Top = 40
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'cd_coligada'
        ParamType = ptUnknown
      end>
  end
  object qyCentro_Custos: TUMZQuery
    Connection = DM.db
    OnCalcFields = qyCentro_CustosCalcFields
    SQL.Strings = (
      'SELECT'
      '   CD_CENTRO,'
      '   CD_COLIGADA,'
      '   DS_CENTRO,'
      '   CD_CLASSIFICACAO,'
      '   TP_CENTRO,'
      '   CD_GRUPO,'
      '   SN_ATIVO,'
      '   DS_OBSERVACAO'
      'FROM'
      '   FIN_CENTRO_CUSTOS'
      'WHERE'
      '   TP_CENTRO  = 1 AND'
      '   CD_COLIGADA = :CD_COLIGADA'
      'ORDER BY'
      '   CD_CLASSIFICACAO,'
      '   DS_CENTRO')
    Params = <
      item
        DataType = ftInteger
        Name = 'cd_coligada'
        ParamType = ptUnknown
      end>
    Left = 248
    Top = 40
    ParamData = <
      item
        DataType = ftInteger
        Name = 'cd_coligada'
        ParamType = ptUnknown
      end>
    object qyCentro_Custoscd_centro: TLargeintField
      FieldName = 'cd_centro'
      Origin = 'WMESTRE12.fin_centro_custos.cd_centro'
    end
    object qyCentro_Custosds_centro: TStringField
      FieldName = 'ds_centro'
      Origin = 'WMESTRE12.fin_centro_custos.ds_centro'
      Size = 255
    end
    object qyCentro_Custosds_observacao: TMemoField
      FieldName = 'ds_observacao'
      Origin = 'WMESTRE12.fin_centro_custos.ds_observacao'
      BlobType = ftMemo
      Size = 1
    end
    object qyCentro_Custoscd_classificacao: TStringField
      FieldName = 'cd_classificacao'
      Origin = 'WMESTRE12.fin_centro_custos.cd_classificacao'
    end
    object qyCentro_Custostp_centro: TSmallintField
      FieldName = 'tp_centro'
      Origin = 'WMESTRE12.fin_centro_custos.tp_centro'
    end
    object qyCentro_Custoscd_grupo: TLargeintField
      FieldName = 'cd_grupo'
      Origin = 'WMESTRE12.fin_centro_custos.cd_grupo'
    end
    object qyCentro_Custoscd_coligada: TSmallintField
      FieldName = 'cd_coligada'
      Origin = 'WMESTRE12.fin_centro_custos.cd_coligada'
    end
    object qyCentro_CustosdesClassificacaoDesc: TStringField
      FieldKind = fkCalculated
      FieldName = 'desClassificacaoDesc'
      Size = 100
      Calculated = True
    end
  end
  object qyFormas: TUMZQuery
    Connection = DM.db
    SQL.Strings = (
      'SELECT'
      '   CD_FORMA_PGTO,'
      '   CD_COLIGADA,'
      '   DS_FORMA_PGTO,'
      '   SN_CADASTRA_CHEQUE,'
      '   SN_ATIVO,'
      '   SN_COMPENSA_AUTO'
      'FROM '
      '   FIN_FORMAS_PGTO'
      'WHERE'
      '   CD_COLIGADA = :CD_COLIGADA'
      'ORDER BY'
      '   DS_FORMA_PGTO')
    Params = <
      item
        DataType = ftSmallint
        Name = 'cd_coligada'
        ParamType = ptUnknown
      end>
    Left = 280
    Top = 40
    ParamData = <
      item
        DataType = ftSmallint
        Name = 'cd_coligada'
        ParamType = ptUnknown
      end>
  end
  object qyContas: TUMZQuery
    Connection = DM.db
    SQL.Strings = (
      'SELECT'
      '   C.CD_CAIXA,'
      '   C.CD_COLIGADA,'
      '   C.DS_CAIXA,'
      '   C.TP_CONTA,'
      '   C.NM_BANCO,'
      '   C.NR_BANCO,'
      '   C.NR_AGENCIA,'
      '   C.NM_AGENCIA,'
      '   C.NR_CONTA,'
      '   C.NR_FLOAT_BANCARIO,'
      '   C.DT_CRIACAO,'
      '   C.VL_SALDO_INICIO,'
      '   C.SN_ATIVA,'
      '   C.NR_USO_BANCO,'
      '   C.SN_MULTA,'
      '   C.SN_JUROS,'
      '   C.SN_CORRECAO,'
      '   C.SN_JUROS_MENSAL,'
      '   C.VL_MULTA_PERCENT,'
      '   C.VL_JUROS_PERCENT,'
      '   C.VL_JUROS_MENSAL,'
      '   C.NR_DIAS_DESCONTO,'
      '   C.VL_DIAS_DESC_PERC,'
      '   C.NR_DIAS_ACRESCIMO,'
      '   C.NR_CARTEIRA,'
      '   C.NR_CONVENIO,'
      '   C.NR_TRANSACAO,'
      '   C.DS_IDENTIFICACAO_RETORNO,'
      '   C.NM_ARQUIVO_BLOQUETO,'
      '   C.DS_NN_PREFIXO,'
      '   C.NR_ULTIMO_CHEQUE,'
      '   C.DT_SALDO_BASE,'
      '   C.NR_NN_ULTIMO,'
      '   C.NR_NN_TAMANHO,'
      '   C.CD_BOLETO_ONLINE,'
      '   C.CD_PLANO_CONTA,'
      '   C.CD_CONTA_DESCONTO,'
      '   C.CD_CONTA_ACRESCIMO,'
      '   C.SN_SALDO_DISPONIVEL,'
      '   C.DS_CATEGORIA,'
      '   C.DS_GRUPO_CATEGORIA,'
      '   C.CD_CONTA_TARIFA,'
      '   C.CD_CENTRO_TARIFA,'
      '   C.DS_OBSERVACAO,'
      '   C.DS_MENSAGEM_BLOQUETO'
      'FROM '
      '   FIN_CADASTRO_CONTAS C'
      '      JOIN FIN_CONTAS_USUARIOS U ON'
      '         (C.CD_CAIXA = U.CD_CAIXA) AND'
      '         (C.CD_COLIGADA = U.CD_COLIGADA)'
      'WHERE'
      '   C.CD_COLIGADA = :CD_COLIGADA AND'
      '   U.CD_USUARIO = :CD_USUARIO'
      'ORDER BY'
      '   C.DS_CAIXA')
    Params = <
      item
        DataType = ftSmallint
        Name = 'cd_coligada'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'cd_usuario'
        ParamType = ptUnknown
      end>
    Left = 312
    Top = 40
    ParamData = <
      item
        DataType = ftSmallint
        Name = 'cd_coligada'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'cd_usuario'
        ParamType = ptUnknown
      end>
  end
  object qyMaxParcela: TUMZQuery
    Connection = DM.db
    SQL.Strings = (
      'SELECT'
      '   CAST(COUNT(NR_PARCELA) AS NUMBER(19)) PARCELA'
      'FROM'
      '   FIN_CONTAS_PAGAR'
      'WHERE'
      '   CD_TITULO_PRINCIPAL = :CD_TITULO_PRINCIPAL ')
    Params = <
      item
        DataType = ftInteger
        Name = 'cd_titulo_principal'
        ParamType = ptInputOutput
      end>
    SQLList.Strings = (
      
        'oracle=SELECT'#13#10'   CAST(COUNT(NR_PARCELA) AS NUMBER(19)) PARCELA'#13 +
        #10'FROM'#13#10'   FIN_CONTAS_PAGAR'#13#10'WHERE'#13#10'   CD_TITULO_PRINCIPAL = :CD_' +
        'TITULO_PRINCIPAL'
      
        'mysql-5=SELECT'#13#10'   CAST(COUNT(NR_PARCELA) AS SIGNED) PARCELA'#13#10'FR' +
        'OM'#13#10'   FIN_CONTAS_PAGAR'#13#10'WHERE'#13#10'   CD_TITULO_PRINCIPAL = :CD_TIT' +
        'ULO_PRINCIPAL '#13#10)
    Left = 344
    Top = 40
    ParamData = <
      item
        DataType = ftInteger
        Name = 'cd_titulo_principal'
        ParamType = ptInputOutput
      end>
    object qyMaxParcelaPARCELA: TLargeintField
      FieldName = 'PARCELA'
      ReadOnly = True
    end
  end
end
