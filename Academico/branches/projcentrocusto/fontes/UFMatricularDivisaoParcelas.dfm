object fMatricularDivisaoParcelas: TfMatricularDivisaoParcelas
  Left = 0
  Top = 0
  BorderStyle = bsToolWindow
  BorderWidth = 3
  Caption = 'Altera'#231#227'o da quantidade de parcelas'
  ClientHeight = 384
  ClientWidth = 618
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  OnClose = FormClose
  OnDestroy = FormDestroy
  PixelsPerInch = 96
  TextHeight = 13
  object splSep1: TSplitter
    Left = 0
    Top = 149
    Width = 618
    Height = 3
    Cursor = crVSplit
    Align = alTop
    ExplicitTop = 153
    ExplicitWidth = 220
  end
  object bvlSep1: TBevel
    Left = 0
    Top = 352
    Width = 618
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
    Width = 618
    Height = 129
    Align = alTop
    BevelOuter = bvNone
    TabOrder = 1
    object pnlDivisiveisTit: TPanel
      Left = 0
      Top = 0
      Width = 618
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
      Width = 618
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
        end>
    end
  end
  object pnlDivididas: TPanel
    Left = 0
    Top = 152
    Width = 618
    Height = 200
    Align = alClient
    BevelOuter = bvNone
    TabOrder = 2
    object pnlDividir: TPanel
      Left = 0
      Top = 0
      Width = 618
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
      Width = 618
      Height = 172
      Align = alClient
      DataSource = dsParcelasDivididas
      ReadOnly = True
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
          Title.Caption = 'Tipo de t'#237'tulo'
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'NR_PARCELA'
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
          Title.Caption = 'Desconto'
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'VL_DESC_EXTRA'
          Title.Caption = 'Bolsa'
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'VL_EXTRA'
          Title.Caption = 'Valor extra'
          Visible = True
        end>
    end
  end
  object pnlBotoes: TPanel
    Left = 0
    Top = 355
    Width = 618
    Height = 29
    Align = alBottom
    BevelOuter = bvNone
    TabOrder = 3
    object bbtnConfirmar: TBitBtn
      Left = 452
      Top = 3
      Width = 83
      Height = 25
      Caption = 'Confirmar'
      TabOrder = 0
      Kind = bkOK
    end
    object bbtnCancelar: TBitBtn
      Left = 535
      Top = 3
      Width = 83
      Height = 25
      Caption = 'Cancelar'
      TabOrder = 1
      Kind = bkCancel
    end
  end
  object pnlTitulo: TPanel
    Left = 0
    Top = 0
    Width = 618
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
        Size = 20
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
      end>
    IndexDefs = <
      item
        Name = 'DEFAULT_ORDER'
      end
      item
        Name = 'CHANGEINDEX'
      end>
    IndexFieldNames = 'DS_TIPO_TITULO'
    Params = <>
    StoreDefs = True
    Left = 200
    Top = 80
    Data = {
      840100009619E0BD01000000180000000B00000000000300000084010E43445F
      5449504F5F544954554C4F04000100000000000E44535F5449504F5F54495455
      4C4F01004900000001000557494454480200020014000E564C5F425255544F5F
      544F54414C080004000000010007535542545950450200490006004D6F6E6579
      0011564C5F444553434F4E544F5F544F54414C08000400000001000753554254
      5950450200490006004D6F6E6579000E564C5F424F4C53415F544F54414C0800
      04000000010007535542545950450200490006004D6F6E6579000E564C5F4558
      5452415F544F54414C080004000000010007535542545950450200490006004D
      6F6E6579000B4E525F50415243454C41530400010000000000114E525F4E4F56
      41535F50415243454C41530400010000000000114E525F50415243454C415F49
      4E4943494F04000100000000000843445F434F4E544104000100000000000944
      545F56454E43544F040006000000000001000D44454641554C545F4F52444552
      0200820000000000}
    object cdsParcelasDivisaoCD_TIPO_TITULO: TIntegerField
      FieldName = 'CD_TIPO_TITULO'
    end
    object cdsParcelasDivisaoDS_TIPO_TITULO: TStringField
      FieldName = 'DS_TIPO_TITULO'
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
        Size = 20
      end
      item
        Name = 'NR_PARCELA'
        DataType = ftInteger
      end
      item
        Name = 'VL_BRUTO'
        DataType = ftCurrency
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
      end>
    IndexDefs = <>
    IndexFieldNames = 'CD_TIPO_TITULO;NR_PARCELA'
    Params = <>
    StoreDefs = True
    Left = 200
    Top = 256
    Data = {
      260100009619E0BD01000000180000000900000000000300000026010E43445F
      5449504F5F544954554C4F04000100000000000E44535F5449504F5F54495455
      4C4F01004900000001000557494454480200020014000A4E525F50415243454C
      41040001000000000008564C5F425255544F0800040000000100075355425459
      50450200490006004D6F6E6579000B564C5F444553434F4E544F080004000000
      010007535542545950450200490006004D6F6E6579000D564C5F444553435F45
      58545241080004000000010007535542545950450200490006004D6F6E657900
      08564C5F4558545241080004000000010007535542545950450200490006004D
      6F6E6579000843445F434F4E544104000100000000000944545F56454E43544F
      04000600000000000000}
    object cdsParcelasDivididasCD_TIPO_TITULO: TIntegerField
      FieldName = 'CD_TIPO_TITULO'
    end
    object cdsParcelasDivididasDS_TIPO_TITULO: TStringField
      FieldName = 'DS_TIPO_TITULO'
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
  end
  object dsParcelasDivididas: TDataSource
    DataSet = cdsParcelasDivididas
    Left = 272
    Top = 256
  end
end
