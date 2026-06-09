object fMatricularDivisaoParcelas: TfMatricularDivisaoParcelas
  Left = 0
  Top = 0
  BorderStyle = bsToolWindow
  BorderWidth = 3
  Caption = 'Altera'#231#227'o da quantidade de parcelas'
  ClientHeight = 393
  ClientWidth = 622
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  OnClose = FormClose
  OnCreate = FormCreate
  OnDestroy = FormDestroy
  PixelsPerInch = 96
  TextHeight = 13
  object splSep1: TSplitter
    Left = 0
    Top = 149
    Width = 622
    Height = 3
    Cursor = crVSplit
    Align = alTop
    ExplicitTop = 153
    ExplicitWidth = 220
  end
  object bvlSep1: TBevel
    Left = 0
    Top = 361
    Width = 622
    Height = 3
    Align = alBottom
    Shape = bsBottomLine
    ExplicitLeft = 160
    ExplicitTop = 416
    ExplicitWidth = 50
  end
  object pnlDivisiveis: TPanel
    Left = 0
    Top = 20
    Width = 622
    Height = 129
    Align = alTop
    BevelOuter = bvNone
    TabOrder = 1
    object pnlDivisiveisTit: TPanel
      Left = 0
      Top = 0
      Width = 622
      Height = 22
      Align = alTop
      Alignment = taLeftJustify
      BevelOuter = bvNone
      Caption = 'T'#237'tulos pass'#237'veis de divis'#227'o'
      TabOrder = 0
    end
    object dbgParcelasDivisao: TDBGrid
      Left = 0
      Top = 22
      Width = 622
      Height = 107
      Align = alClient
      DataSource = dsParcelasDivisao
      TabOrder = 1
      TitleFont.Charset = DEFAULT_CHARSET
      TitleFont.Color = clWindowText
      TitleFont.Height = -11
      TitleFont.Name = 'Tahoma'
      TitleFont.Style = []
      Columns = <
        item
          Expanded = False
          FieldName = 'DS_TIPO_TITULO'
          ReadOnly = True
          Title.Caption = 'Tipo de t'#237'tulo'
          Width = 113
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'VL_BRUTO_TOTAL'
          ReadOnly = True
          Title.Caption = 'Total bruto'
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'VL_DESCONTO_TOTAL'
          ReadOnly = True
          Title.Caption = 'Total descontos'
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'VL_BOLSA_TOTAL'
          ReadOnly = True
          Title.Caption = 'Total bolsas'
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'VL_EXTRA_TOTAL'
          ReadOnly = True
          Title.Caption = 'Total extra'
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'NR_PARCELAS'
          ReadOnly = True
          Title.Caption = 'Parcelas'
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'NR_NOVAS_PARCELAS'
          Title.Caption = 'Dividir em'
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'VL_ENTRADA'
          Title.Caption = 'Entrada'
          Visible = True
        end>
    end
  end
  object pnlDivididas: TPanel
    Left = 0
    Top = 152
    Width = 622
    Height = 209
    Align = alClient
    BevelOuter = bvNone
    TabOrder = 2
    object pnlDividir: TPanel
      Left = 0
      Top = 0
      Width = 622
      Height = 28
      Align = alTop
      Alignment = taLeftJustify
      BevelOuter = bvNone
      Caption = 'Resultado da divis'#227'o'
      TabOrder = 0
      object sbAplicar: TSpeedButton
        Left = 543
        Top = 3
        Width = 75
        Height = 22
        Caption = 'Calcular'
        Flat = True
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
        OnClick = sbAplicarClick
      end
    end
    object dbgParcelasDivididas: TDBGrid
      Left = 0
      Top = 28
      Width = 622
      Height = 181
      Align = alClient
      DataSource = dsParcelasDivididas
      TabOrder = 1
      TitleFont.Charset = DEFAULT_CHARSET
      TitleFont.Color = clWindowText
      TitleFont.Height = -11
      TitleFont.Name = 'Tahoma'
      TitleFont.Style = []
      Columns = <
        item
          Expanded = False
          FieldName = 'DS_TIPO_TITULO'
          ReadOnly = True
          Title.Caption = 'Tipo de t'#237'tulo'
          Width = 179
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'NR_PARCELA'
          ReadOnly = True
          Title.Caption = 'Parcela'
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'VL_BRUTO'
          Title.Caption = 'Valor bruto'
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'VL_DESCONTO'
          ReadOnly = True
          Title.Caption = 'Desconto'
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'VL_DESC_EXTRA'
          ReadOnly = True
          Title.Caption = 'Bolsa'
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'VL_EXTRA'
          ReadOnly = True
          Title.Caption = 'Valor extra'
          Visible = True
        end>
    end
  end
  object pnlBotoes: TPanel
    Left = 0
    Top = 364
    Width = 622
    Height = 29
    Align = alBottom
    BevelOuter = bvNone
    TabOrder = 3
    object btnCancelar: TBitBtn
      Left = 535
      Top = 3
      Width = 83
      Height = 25
      Caption = 'Cancelar'
      TabOrder = 0
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
    object btnConfirmar: TBitBtn
      Left = 434
      Top = 3
      Width = 95
      Height = 25
      Caption = '&Confirmar'
      TabOrder = 1
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
  end
  object pnlTitulo: TPanel
    Left = 0
    Top = 0
    Width = 622
    Height = 20
    Align = alTop
    BevelOuter = bvNone
    Caption = 'ALTERA'#199#195'O DA QUANTIDADE DE PARCELAS'
    Color = clBlue
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindow
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 0
  end
  object dsParcelasDivisao: TDataSource
    DataSet = cdsParcelasDivisao
    Left = 256
    Top = 80
  end
  object cdsParcelasDivisao: TClientDataSet
    Active = True
    Aggregates = <>
    FieldDefs = <
      item
        Name = 'CD_TIPO_TITULO'
        DataType = ftInteger
      end
      item
        Name = 'DS_TIPO_TITULO'
        DataType = ftString
        Size = 100
      end
      item
        Name = 'VL_BRUTO_TOTAL'
        DataType = ftCurrency
      end
      item
        Name = 'VL_DESCONTO_TOTAL'
        DataType = ftCurrency
      end
      item
        Name = 'VL_BOLSA_TOTAL'
        DataType = ftCurrency
      end
      item
        Name = 'VL_EXTRA_TOTAL'
        DataType = ftCurrency
      end
      item
        Name = 'NR_PARCELAS'
        DataType = ftInteger
      end
      item
        Name = 'NR_NOVAS_PARCELAS'
        DataType = ftInteger
      end
      item
        Name = 'NR_PARCELA_INICIO'
        DataType = ftInteger
      end
      item
        Name = 'CD_CONTA'
        DataType = ftInteger
      end
      item
        Name = 'DT_VENCTO'
        DataType = ftDate
      end
      item
        Name = 'VL_ENTRADA'
        DataType = ftFloat
      end
      item
        Name = 'VL_CREDITO'
        DataType = ftCurrency
      end
      item
        Name = 'SN_MANTER_NUMERO_PARCELA'
        DataType = ftBoolean
      end>
    IndexDefs = <>
    IndexFieldNames = 'DS_TIPO_TITULO'
    Params = <>
    StoreDefs = True
    Left = 200
    Top = 80
    Data = {
      C90100009619E0BD01000000180000000E000000000003000000C9010E43445F
      5449504F5F544954554C4F04000100000000000E44535F5449504F5F54495455
      4C4F01004900000001000557494454480200020064000E564C5F425255544F5F
      544F54414C080004000000010007535542545950450200490006004D6F6E6579
      0011564C5F444553434F4E544F5F544F54414C08000400000001000753554254
      5950450200490006004D6F6E6579000E564C5F424F4C53415F544F54414C0800
      04000000010007535542545950450200490006004D6F6E6579000E564C5F4558
      5452415F544F54414C080004000000010007535542545950450200490006004D
      6F6E6579000B4E525F50415243454C41530400010000000000114E525F4E4F56
      41535F50415243454C41530400010000000000114E525F50415243454C415F49
      4E4943494F04000100000000000843445F434F4E544104000100000000000944
      545F56454E43544F04000600000000000A564C5F454E54524144410800040000
      0000000A564C5F4352454449544F080004000000010007535542545950450200
      490006004D6F6E65790018534E5F4D414E5445525F4E554D45524F5F50415243
      454C4102000300000000000000}
    object cdsParcelasDivisaoCD_TIPO_TITULO: TIntegerField
      FieldName = 'CD_TIPO_TITULO'
    end
    object cdsParcelasDivisaoDS_TIPO_TITULO: TStringField
      DisplayWidth = 100
      FieldName = 'DS_TIPO_TITULO'
      Size = 100
    end
    object cdsParcelasDivisaoVL_BRUTO_TOTAL: TCurrencyField
      FieldName = 'VL_BRUTO_TOTAL'
      DisplayFormat = '###,###,##0.00'
    end
    object cdsParcelasDivisaoVL_DESCONTO_TOTAL: TCurrencyField
      FieldName = 'VL_DESCONTO_TOTAL'
      DisplayFormat = '###,###,##0.00'
    end
    object cdsParcelasDivisaoVL_BOLSA_TOTAL: TCurrencyField
      FieldName = 'VL_BOLSA_TOTAL'
      DisplayFormat = '###,###,##0.00'
    end
    object cdsParcelasDivisaoVL_EXTRA_TOTAL: TCurrencyField
      FieldName = 'VL_EXTRA_TOTAL'
      DisplayFormat = '###,###,##0.00'
    end
    object cdsParcelasDivisaoNR_PARCELAS: TIntegerField
      FieldName = 'NR_PARCELAS'
    end
    object cdsParcelasDivisaoNR_NOVAS_PARCELAS: TIntegerField
      FieldName = 'NR_NOVAS_PARCELAS'
    end
    object cdsParcelasDivisaoNR_PARCELA_INICIO: TIntegerField
      FieldName = 'NR_PARCELA_INICIO'
    end
    object cdsParcelasDivisaoCD_CONTA: TIntegerField
      FieldName = 'CD_CONTA'
    end
    object cdsParcelasDivisaoDT_VENCTO: TDateField
      FieldName = 'DT_VENCTO'
    end
    object cdsParcelasDivisaoVL_ENTRADA: TFloatField
      FieldName = 'VL_ENTRADA'
      OnChange = cdsParcelasDivisaoVL_ENTRADAChange
    end
    object cdsParcelasDivisaoVL_CREDITO: TCurrencyField
      FieldName = 'VL_CREDITO'
    end
    object cdsParcelasDivisaoSN_MANTER_NUMERO_PARCELA: TBooleanField
      FieldName = 'SN_MANTER_NUMERO_PARCELA'
    end
  end
  object cdsParcelasDivididas: TClientDataSet
    Active = True
    Aggregates = <>
    FieldDefs = <
      item
        Name = 'CD_TIPO_TITULO'
        DataType = ftInteger
      end
      item
        Name = 'DS_TIPO_TITULO'
        DataType = ftString
        Size = 100
      end
      item
        Name = 'NR_PARCELA'
        DataType = ftInteger
      end
      item
        Name = 'VL_BRUTO'
        DataType = ftFloat
      end
      item
        Name = 'VL_DESCONTO'
        DataType = ftCurrency
      end
      item
        Name = 'VL_DESC_EXTRA'
        DataType = ftCurrency
      end
      item
        Name = 'VL_EXTRA'
        DataType = ftCurrency
      end
      item
        Name = 'CD_CONTA'
        DataType = ftInteger
      end
      item
        Name = 'DT_VENCTO'
        DataType = ftDate
      end
      item
        Name = 'VL_CREDITO'
        DataType = ftCurrency
      end
      item
        Name = 'IDX_PARCELA'
        DataType = ftInteger
      end>
    IndexDefs = <
      item
        Name = 'DEFAULT_ORDER'
      end
      item
        Name = 'CHANGEINDEX'
      end>
    IndexFieldNames = 'CD_TIPO_TITULO;NR_PARCELA;IDX_PARCELA'
    Params = <>
    StoreDefs = True
    Left = 200
    Top = 256
    Data = {
      630100009619E0BD01000000180000000B00000000000300000063010E43445F
      5449504F5F544954554C4F04000100000000000E44535F5449504F5F54495455
      4C4F01004900000001000557494454480200020064000A4E525F50415243454C
      41040001000000000008564C5F425255544F08000400000000000B564C5F4445
      53434F4E544F080004000000010007535542545950450200490006004D6F6E65
      79000D564C5F444553435F455854524108000400000001000753554254595045
      0200490006004D6F6E65790008564C5F45585452410800040000000100075355
      42545950450200490006004D6F6E6579000843445F434F4E5441040001000000
      00000944545F56454E43544F04000600000000000A564C5F4352454449544F08
      0004000000010007535542545950450200490006004D6F6E6579000B4944585F
      50415243454C41040001000000000001000D44454641554C545F4F5244455202
      00820000000000}
    object cdsParcelasDivididasCD_TIPO_TITULO: TIntegerField
      FieldName = 'CD_TIPO_TITULO'
    end
    object cdsParcelasDivididasDS_TIPO_TITULO: TStringField
      DisplayWidth = 100
      FieldName = 'DS_TIPO_TITULO'
      Size = 100
    end
    object cdsParcelasDivididasNR_PARCELA: TIntegerField
      FieldName = 'NR_PARCELA'
    end
    object cdsParcelasDivididasVL_BRUTO: TCurrencyField
      FieldName = 'VL_BRUTO'
      DisplayFormat = '###,###,##0.00'
    end
    object cdsParcelasDivididasVL_DESCONTO: TCurrencyField
      FieldName = 'VL_DESCONTO'
      DisplayFormat = '###,###,##0.00'
    end
    object cdsParcelasDivididasVL_DESC_EXTRA: TCurrencyField
      FieldName = 'VL_DESC_EXTRA'
      DisplayFormat = '###,###,##0.00'
    end
    object cdsParcelasDivididasVL_EXTRA: TCurrencyField
      FieldName = 'VL_EXTRA'
      DisplayFormat = '###,###,##0.00'
    end
    object cdsParcelasDivididasCD_CONTA: TIntegerField
      FieldName = 'CD_CONTA'
    end
    object cdsParcelasDivididasDT_VENCTO: TDateField
      FieldName = 'DT_VENCTO'
    end
    object cdsParcelasDivididasVL_CREDITO: TCurrencyField
      FieldName = 'VL_CREDITO'
    end
    object cdsParcelasDivididasIDX_PARCELA: TIntegerField
      FieldName = 'IDX_PARCELA'
    end
  end
  object dsParcelasDivididas: TDataSource
    DataSet = cdsParcelasDivididas
    OnUpdateData = dsParcelasDivididasUpdateData
    Left = 264
    Top = 248
  end
  object cdsDescontosDivisao: TClientDataSet
    Active = True
    Aggregates = <>
    FieldDefs = <
      item
        Name = 'VL_DESCONTO'
        DataType = ftCurrency
      end
      item
        Name = 'CD_ACAO_MOVIMENTO'
        DataType = ftInteger
      end
      item
        Name = 'CD_TIPO_DESCONTO'
        DataType = ftInteger
      end
      item
        Name = 'CD_TIPO_COMPORTAMENTO'
        DataType = ftInteger
      end
      item
        Name = 'DS_OBSERVACAO'
        DataType = ftString
        Size = 255
      end
      item
        Name = 'IDX_PARCELA'
        DataType = ftInteger
      end
      item
        Name = 'SN_DESCONTO_PLANO'
        DataType = ftInteger
      end
      item
        Name = 'CD_TIPO_TITULO'
        DataType = ftInteger
      end>
    IndexDefs = <>
    Params = <>
    StoreDefs = True
    Left = 200
    Top = 112
    Data = {
      FA0000009619E0BD010000001800000008000000000003000000FA000B564C5F
      444553434F4E544F080004000000010007535542545950450200490006004D6F
      6E6579001143445F4143414F5F4D4F56494D454E544F04000100000000001043
      445F5449504F5F444553434F4E544F04000100000000001543445F5449504F5F
      434F4D504F5254414D454E544F04000100000000000D44535F4F425345525641
      43414F020049000000010005574944544802000200FF000B4944585F50415243
      454C41040001000000000011534E5F444553434F4E544F5F504C414E4F040001
      00000000000E43445F5449504F5F544954554C4F04000100000000000000}
    object cdsDescontosDivisaoVL_DESCONTO: TCurrencyField
      FieldName = 'VL_DESCONTO'
      DisplayFormat = '###,###,##0.00'
    end
    object cdsDescontosDivisaoCD_ACAO_MOVIMENTO: TIntegerField
      FieldName = 'CD_ACAO_MOVIMENTO'
    end
    object cdsDescontosDivisaoCD_TIPO_DESCONTO: TIntegerField
      FieldName = 'CD_TIPO_DESCONTO'
    end
    object cdsDescontosDivisaoCD_TIPO_COMPORTAMENTO: TIntegerField
      FieldName = 'CD_TIPO_COMPORTAMENTO'
    end
    object cdsDescontosDivisaoDS_OBSERVACAO: TStringField
      FieldName = 'DS_OBSERVACAO'
      Size = 255
    end
    object cdsDescontosDivisaoSN_DESCONTO_PLANO: TIntegerField
      FieldName = 'SN_DESCONTO_PLANO'
    end
    object cdsDescontosDivisaoCD_TIPO_TITULO: TIntegerField
      FieldName = 'CD_TIPO_TITULO'
    end
  end
  object cdsDescontosDivididos: TClientDataSet
    Active = True
    Aggregates = <>
    FieldDefs = <
      item
        Name = 'CD_ACAO_MOVIMENTO'
        DataType = ftInteger
      end
      item
        Name = 'CD_TIPO_DESCONTO'
        DataType = ftInteger
      end
      item
        Name = 'CD_TIPO_COMPORTAMENTO'
        DataType = ftInteger
      end
      item
        Name = 'DS_OBSERVACAO'
        DataType = ftString
        Size = 255
      end
      item
        Name = 'IDX_PARCELA'
        DataType = ftInteger
      end
      item
        Name = 'SN_DESCONTO_PLANO'
        DataType = ftInteger
      end
      item
        Name = 'CD_TIPO_TITULO'
        DataType = ftInteger
      end
      item
        Name = 'VL_DESCONTO'
        DataType = ftCurrency
      end>
    IndexDefs = <>
    Params = <>
    StoreDefs = True
    Left = 200
    Top = 296
    Data = {
      FA0000009619E0BD010000001800000008000000000003000000FA001143445F
      4143414F5F4D4F56494D454E544F04000100000000001043445F5449504F5F44
      4553434F4E544F04000100000000001543445F5449504F5F434F4D504F525441
      4D454E544F04000100000000000D44535F4F42534552564143414F0200490000
      00010005574944544802000200FF000B4944585F50415243454C410400010000
      00000011534E5F444553434F4E544F5F504C414E4F04000100000000000E4344
      5F5449504F5F544954554C4F04000100000000000B564C5F444553434F4E544F
      080004000000010007535542545950450200490006004D6F6E6579000000}
    object cdsDescontosDivididosVL_DESCONTO: TCurrencyField
      FieldName = 'VL_DESCONTO'
    end
    object cdsDescontosDivididosCD_ACAO_MOVIMENTO: TIntegerField
      FieldName = 'CD_ACAO_MOVIMENTO'
    end
    object cdsDescontosDivididosCD_TIPO_DESCONTO: TIntegerField
      FieldName = 'CD_TIPO_DESCONTO'
    end
    object cdsDescontosDivididosCD_TIPO_COMPORTAMENTO: TIntegerField
      FieldName = 'CD_TIPO_COMPORTAMENTO'
    end
    object cdsDescontosDivididosDS_OBSERVACAO: TStringField
      DisplayWidth = 255
      FieldName = 'DS_OBSERVACAO'
      Size = 255
    end
    object cdsDescontosDivididosSN_DESCONTO_PLANO: TIntegerField
      FieldName = 'SN_DESCONTO_PLANO'
    end
    object cdsDescontosDivididosCD_TIPO_TITULO: TIntegerField
      FieldName = 'CD_TIPO_TITULO'
    end
    object cdsDescontosDivididosIDX_PARCELA: TIntegerField
      FieldName = 'IDX_PARCELA'
    end
  end
end
