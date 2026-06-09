object frm_compromisso_autorizar: Tfrm_compromisso_autorizar
  Left = 0
  Top = 0
  BorderStyle = bsSingle
  Caption = 'Autoriza'#231#227'o de Pagamento'
  ClientHeight = 620
  ClientWidth = 651
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -15
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  OnClose = FormClose
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 18
  object Label7: TLabel
    Left = 8
    Top = 407
    Width = 59
    Height = 18
    Alignment = taRightJustify
    Caption = 'Hist'#243'rico:'
  end
  object sbNovo: TSpeedButton
    Left = 75
    Top = 407
    Width = 36
    Height = 23
    Hint = 'Registrar autoriza'#231#227'o para pagamento de compromisso'
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
    OnClick = sbNovoClick
  end
  object pnTitulo: TPanel
    Left = 0
    Top = 0
    Width = 651
    Height = 25
    Align = alTop
    BevelOuter = bvLowered
    Caption = 'AUTORIZA'#199#195'O DE PAGAMENTO'
    Color = clBlue
    Font.Charset = ANSI_CHARSET
    Font.Color = clWhite
    Font.Height = -13
    Font.Name = 'Arial'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 0
  end
  object btnAutorizar: TBitBtn
    Left = 8
    Top = 581
    Width = 182
    Height = 32
    Caption = '&Autorizar Pagamento'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 1
    OnClick = btnAutorizarClick
    Glyph.Data = {
      76010000424D7601000000000000760000002800000020000000100000000100
      04000000000000010000120B0000120B00001000000000000000000000000000
      800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
      FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00555555555555
      555555555555555555555555555555555555555555FF55555555555559055555
      55555555577FF5555555555599905555555555557777F5555555555599905555
      555555557777FF5555555559999905555555555777777F555555559999990555
      5555557777777FF5555557990599905555555777757777F55555790555599055
      55557775555777FF5555555555599905555555555557777F5555555555559905
      555555555555777FF5555555555559905555555555555777FF55555555555579
      05555555555555777FF5555555555557905555555555555777FF555555555555
      5990555555555555577755555555555555555555555555555555}
    NumGlyphs = 2
  end
  object btnAnterior: TBitBtn
    Left = 342
    Top = 581
    Width = 98
    Height = 32
    Caption = 'An&terior'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
    TabOrder = 2
    OnClick = btnAnteriorClick
    Glyph.Data = {
      76010000424D7601000000000000760000002800000020000000100000000100
      04000000000000010000120B0000120B00001000000000000000000000000000
      800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
      FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333333333333
      3333333333333333333333333333333333333333333333333333333333333333
      3333333333333FF3333333333333003333333333333F77F33333333333009033
      333333333F7737F333333333009990333333333F773337FFFFFF330099999000
      00003F773333377777770099999999999990773FF33333FFFFF7330099999000
      000033773FF33777777733330099903333333333773FF7F33333333333009033
      33333333337737F3333333333333003333333333333377333333333333333333
      3333333333333333333333333333333333333333333333333333333333333333
      3333333333333333333333333333333333333333333333333333}
    NumGlyphs = 2
  end
  object btnProximo: TBitBtn
    Left = 439
    Top = 581
    Width = 98
    Height = 32
    Caption = '&Pr'#243'ximo'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
    TabOrder = 3
    OnClick = btnProximoClick
    Glyph.Data = {
      76010000424D7601000000000000760000002800000020000000100000000100
      04000000000000010000120B0000120B00001000000000000000000000000000
      800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
      FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333333333333
      3333333333333333333333333333333333333333333333333333333333333333
      3333333333333333333333333333333333333333333FF3333333333333003333
      3333333333773FF3333333333309003333333333337F773FF333333333099900
      33333FFFFF7F33773FF30000000999990033777777733333773F099999999999
      99007FFFFFFF33333F7700000009999900337777777F333F7733333333099900
      33333333337F3F77333333333309003333333333337F77333333333333003333
      3333333333773333333333333333333333333333333333333333333333333333
      3333333333333333333333333333333333333333333333333333}
    Layout = blGlyphRight
    NumGlyphs = 2
  end
  object btnNaoAutorizar: TBitBtn
    Left = 190
    Top = 581
    Width = 152
    Height = 32
    Caption = '&N'#227'o Autorizar'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
    TabOrder = 4
    OnClick = btnNaoAutorizarClick
    Glyph.Data = {
      76010000424D7601000000000000760000002800000020000000100000000100
      04000000000000010000130B0000130B00001000000000000000000000000000
      800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
      FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333333333333
      333333333333333333333333333333333333333FFF33FF333FFF339993370733
      999333777FF37FF377733339993000399933333777F777F77733333399970799
      93333333777F7377733333333999399933333333377737773333333333990993
      3333333333737F73333333333331013333333333333777FF3333333333910193
      333333333337773FF3333333399000993333333337377737FF33333399900099
      93333333773777377FF333399930003999333337773777F777FF339993370733
      9993337773337333777333333333333333333333333333333333333333333333
      3333333333333333333333333333333333333333333333333333}
    NumGlyphs = 2
  end
  object btnFechar: TBitBtn
    Left = 536
    Top = 581
    Width = 108
    Height = 32
    Caption = '&Fechar'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
    TabOrder = 5
    OnClick = btnFecharClick
    Glyph.Data = {
      42020000424D4202000000000000420000002800000010000000100000000100
      1000030000000002000000000000000000000000000000000000007C0000E003
      00001F0000001F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C
      1F7C1F7C1F7C1F7C1F7C1F7C0000000000001F7C1F7C1F7C1F7C1F7C1F7C1F7C
      1F7C1F7C1F7C1F7C00000000864D864D00001F7C1F7C1F7C1F7C1F7C1F7C1F7C
      1F7C1F7C1F7C4031864D864D864D864D00004031403140314031403140311F7C
      1F7C1F7C1F7C4031A64DA64D864D864D0000207F207F207F00001F7C1F7C1F7C
      1F7C1F7C1F7C4031A551A551A54DA54D0000207F207F207F00001F7C1F001F7C
      1F7C1F7C1F7C4031C455C451C451C5510000227F207F207F00001F001F001F7C
      1F7C1F7C1F7C4031E355E355FF7FC4550000467F457F437F1F001F001F001F7C
      1F7C1F7C1F7C4031025A035A035AE35900006C7F6A7F1F001F001F001F001F00
      1F001F001F7C4031215E225E025E025A0000917F1F001F001F001F001F001F00
      1F001F001F7C4031416221622162215E0000B67FB47F1F001F001F001F001F00
      1F001F001F7C403140664066406240620000DB7FD97FB87F1F001F001F001F7C
      1F7C1F7C1F7C403160666066606640660000FF7FDE7FDC7F00001F001F001F7C
      1F7C1F7C1F7C403160666066606660660000FF7FFF7FFF7F00001F7C1F001F7C
      1F7C1F7C1F7C1F7C4031403160666066000040314031403140311F7C1F7C1F7C
      1F7C1F7C1F7C1F7C1F7C1F7C4031403140311F7C1F7C1F7C1F7C1F7C1F7C1F7C
      1F7C1F7C1F7C}
  end
  object GroupBox1: TGroupBox
    Left = 7
    Top = 31
    Width = 636
    Height = 267
    Caption = ' Dados do Compromisso '
    TabOrder = 6
    object Label1: TLabel
      Left = 67
      Top = 32
      Width = 78
      Height = 18
      Alignment = taRightJustify
      Caption = 'Fornecedor:'
    end
    object Label2: TLabel
      Left = 78
      Top = 58
      Width = 67
      Height = 18
      Alignment = taRightJustify
      Caption = 'Descri'#231#227'o:'
    end
    object Label3: TLabel
      Left = 334
      Top = 124
      Width = 57
      Height = 18
      Alignment = taRightJustify
      Caption = 'N'#186' Doc.:'
    end
    object Label4: TLabel
      Left = 75
      Top = 124
      Width = 70
      Height = 18
      Alignment = taRightJustify
      Caption = 'Data Pgto:'
    end
    object Label5: TLabel
      Left = 108
      Top = 148
      Width = 37
      Height = 18
      Alignment = taRightJustify
      Caption = 'Valor:'
    end
    object Label6: TLabel
      Left = 43
      Top = 172
      Width = 102
      Height = 18
      Alignment = taRightJustify
      Caption = 'Utilizar a Conta:'
    end
    object Label8: TLabel
      Left = 315
      Top = 148
      Width = 76
      Height = 18
      Alignment = taRightJustify
      Caption = 'N'#186' Cheque:'
    end
    object DBText1: TDBText
      Left = 152
      Top = 32
      Width = 64
      Height = 18
      AutoSize = True
      DataField = 'NM_PESSOA'
      DataSource = dsCompromisso
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -15
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object DBText2: TDBText
      Left = 152
      Top = 58
      Width = 472
      Height = 69
      DataField = 'DS_DESPESA'
      DataSource = dsCompromisso
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -15
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
      WordWrap = True
    end
    object DBText3: TDBText
      Left = 417
      Top = 124
      Width = 64
      Height = 18
      AutoSize = True
      DataField = 'NR_DOCUMENTO'
      DataSource = dsCompromisso
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -15
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object DBText4: TDBText
      Left = 152
      Top = 124
      Width = 64
      Height = 18
      AutoSize = True
      DataField = 'DT_PROVAVEL_PGTO'
      DataSource = dsCompromisso
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -15
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object DBText5: TDBText
      Left = 152
      Top = 148
      Width = 64
      Height = 18
      AutoSize = True
      DataField = 'VL_DESPESA'
      DataSource = dsCompromisso
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -15
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object DBText6: TDBText
      Left = 152
      Top = 172
      Width = 64
      Height = 18
      AutoSize = True
      DataField = 'DS_CAIXA'
      DataSource = dsCompromisso
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -15
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object DBText7: TDBText
      Left = 417
      Top = 148
      Width = 64
      Height = 18
      AutoSize = True
      DataField = 'NR_CHEQUE'
      DataSource = dsCompromisso
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -15
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label10: TLabel
      Left = 35
      Top = 196
      Width = 110
      Height = 18
      Alignment = taRightJustify
      Caption = 'Plano de Contas:'
    end
    object DBText8: TDBText
      Left = 152
      Top = 196
      Width = 64
      Height = 18
      AutoSize = True
      DataField = 'PlanoContas'
      DataSource = dsCompromisso
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -15
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label11: TLabel
      Left = 91
      Top = 236
      Width = 282
      Height = 18
      Alignment = taRightJustify
      Caption = 'Saldo dispon'#237'vel em or'#231'amento para o ano:'
    end
    object lbOrcamento: TLabel
      Left = 383
      Top = 236
      Width = 132
      Height = 18
      Caption = 'conta n'#227'o or'#231'ada.'
      Color = clBtnFace
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -15
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentColor = False
      ParentFont = False
    end
    object Bevel1: TBevel
      Left = 13
      Top = 224
      Width = 604
      Height = 6
      Shape = bsTopLine
    end
  end
  object GroupBox2: TGroupBox
    Left = 8
    Top = 434
    Width = 636
    Height = 141
    Caption = ' Observa'#231#245'es '
    TabOrder = 7
    object Label9: TLabel
      Left = 318
      Top = 0
      Width = 70
      Height = 18
      Caption = ' Resposta '
    end
    object me_autoriza: TMemo
      Left = 12
      Top = 22
      Width = 300
      Height = 107
      TabOrder = 0
    end
    object me_resposta: TMemo
      Left = 324
      Top = 22
      Width = 300
      Height = 107
      TabOrder = 1
    end
  end
  object cbAutoriza: TComboBox
    Left = 112
    Top = 407
    Width = 531
    Height = 24
    Style = csOwnerDrawFixed
    ItemHeight = 18
    TabOrder = 8
    OnChange = cbAutorizaChange
  end
  object Panel1: TPanel
    Left = 7
    Top = 304
    Width = 636
    Height = 97
    BevelOuter = bvLowered
    TabOrder = 9
    object DBGrid1: TDBGrid
      Left = 1
      Top = 1
      Width = 634
      Height = 95
      Align = alClient
      DataSource = dsApropriacoes
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -15
      Font.Name = 'Tahoma'
      Font.Style = []
      Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgConfirmDelete, dgCancelOnExit]
      ParentFont = False
      TabOrder = 0
      TitleFont.Charset = ANSI_CHARSET
      TitleFont.Color = clWindowText
      TitleFont.Height = -13
      TitleFont.Name = 'Arial'
      TitleFont.Style = []
      Columns = <
        item
          Expanded = False
          FieldName = 'ds_conta'
          Title.Caption = 'Plano de Contas'
          Width = 230
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'ds_centro'
          Title.Caption = 'Centro de Custos'
          Width = 230
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'vl_movimento'
          Title.Caption = 'Valor'
          Visible = True
        end>
    end
  end
  object qyAutoriza: TUMZQuery
    Connection = DM.db
    SQL.Strings = (
      'SELECT'
      '   A.CD_AUTORIZA,'
      '   A.CD_TITULO,'
      '   A.CD_COLIGADA,'
      '   A.CD_AUTORIZA_SITU,'
      '   A.CD_AUTORIZA_USUARIO,'
      '   A.DT_AUTORIZA,'
      '   A.ME_AUTORIZA,'
      '   A.ME_RESPOSTA,'
      '    U.NM_PESSOA NM_USUARIO_AUTORIZA'
      'FROM'
      '   FIN_CONTAS_PAGAR_AUTORIZA A'
      '   LEFT JOIN PESSOAS U ON (A.cd_autoriza_usuario = U.CD_PESSOA)'
      'WHERE'
      '   CD_TITULO = :CD_TITULO AND'
      '   CD_COLIGADA = :CD_COLIGADA'
      'ORDER BY'
      '   A.CD_AUTORIZA')
    Params = <
      item
        DataType = ftUnknown
        Name = 'cd_titulo'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'cd_coligada'
        ParamType = ptUnknown
      end>
    Left = 616
    Top = 64
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'cd_titulo'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'cd_coligada'
        ParamType = ptUnknown
      end>
  end
  object dsCompromisso: TDataSource
    DataSet = frm_Compromisso_Planilha.qryContasPagar
    OnDataChange = dsCompromissoDataChange
    Left = 616
    Top = 32
  end
  object qyAcao: TUMZQuery
    Connection = DM.db
    Params = <>
    Left = 616
  end
  object dsApropriacoes: TDataSource
    DataSet = qyApropriacoes
    Left = 560
    Top = 328
  end
  object qyApropriacoes: TUMZQuery
    Connection = DM.db
    SQL.Strings = (
      'SELECT'
      '   pc.ds_conta,'
      '   pcc.ds_centro,'
      '   a.vl_movimento'
      'FROM'
      '   fin_apropria_cp a,'
      '   fin_centro_custos pcc,'
      '   fin_plano_contas pc'
      'WHERE'
      '   pc.cd_conta = a.cd_conta AND'
      '   pc.cd_coligada = a.cd_coligada AND'
      '   pcc.cd_centro = a.cd_centro AND'
      '   pcc.cd_coligada = a.cd_coligada AND'
      '   a.cd_titulo = :cd_titulo AND'
      '   a.cd_coligada = :cd_coligada'
      'ORDER by pc.ds_conta, pcc.ds_centro')
    Params = <
      item
        DataType = ftUnknown
        Name = 'cd_titulo'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'cd_coligada'
        ParamType = ptUnknown
      end>
    Left = 592
    Top = 328
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'cd_titulo'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'cd_coligada'
        ParamType = ptUnknown
      end>
    object qyApropriacoesds_conta: TStringField
      FieldName = 'ds_conta'
      Size = 255
    end
    object qyApropriacoesds_centro: TStringField
      FieldName = 'ds_centro'
      Size = 255
    end
    object qyApropriacoesvl_movimento: TFloatField
      FieldName = 'vl_movimento'
      DisplayFormat = '###,###,##0.00'
    end
  end
end
