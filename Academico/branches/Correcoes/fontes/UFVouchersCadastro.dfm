object frmVouchersCadastro: TfrmVouchersCadastro
  Left = 0
  Top = 0
  BorderStyle = bsDialog
  Caption = 'Cadastro de Lote de Vouchers'
  ClientHeight = 520
  ClientWidth = 489
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  Padding.Left = 8
  Padding.Top = 3
  Padding.Right = 8
  Padding.Bottom = 3
  OldCreateOrder = False
  Position = poScreenCenter
  OnClose = FormClose
  OnCloseQuery = FormCloseQuery
  PixelsPerInch = 96
  TextHeight = 13
  object pnlDados: TPanel
    Left = 8
    Top = 3
    Width = 473
    Height = 510
    Align = alTop
    TabOrder = 0
    ExplicitLeft = 5
    ExplicitTop = 4
    object lblCodigo: TLabel
      Left = 6
      Top = 3
      Width = 33
      Height = 13
      Caption = 'C'#243'digo'
      FocusControl = dbeCodigo
    end
    object lblFornecedor: TLabel
      Left = 6
      Top = 43
      Width = 98
      Height = 13
      Caption = 'Fornecedor/Parceiro'
      FocusControl = dbeFornecedor
    end
    object lblDescricao: TLabel
      Left = 6
      Top = 83
      Width = 85
      Height = 13
      Caption = 'Descri'#231#227'o do Lote'
      FocusControl = dbeDescricao
    end
    object lblVencto: TLabel
      Left = 327
      Top = 82
      Width = 96
      Height = 13
      Caption = 'Data de Vencimento'
    end
    object lblPrefixo: TLabel
      Left = 6
      Top = 126
      Width = 142
      Height = 13
      Caption = 'Prefixo no C'#243'digo do Voucher'
      FocusControl = dbePrefixo
    end
    object lblSufixo: TLabel
      Left = 267
      Top = 126
      Width = 138
      Height = 13
      Caption = 'Sufixo no C'#243'digo do Voucher'
      FocusControl = dbeSufixo
    end
    object lbDescontoP: TLabel
      Left = 7
      Top = 196
      Width = 97
      Height = 13
      Caption = 'Desconto Prazo (%)'
      FocusControl = dbeDesconto
    end
    object lblQuantidade: TLabel
      Left = 267
      Top = 196
      Width = 56
      Height = 13
      Caption = 'Quantidade'
    end
    object sbBuscarFornecedor: TSpeedButton
      Left = 436
      Top = 59
      Width = 23
      Height = 21
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
      OnClick = sbBuscarFornecedorClick
    end
    object lbDesconto: TLabel
      Left = 136
      Top = 196
      Width = 67
      Height = 13
      Caption = 'Desconto (%)'
      FocusControl = dbDescontoVista
    end
    object Label1: TLabel
      Left = 7
      Top = 348
      Width = 146
      Height = 13
      Caption = 'Parcelas para aplicar desconto'
    end
    object Label2: TLabel
      Left = 7
      Top = 389
      Width = 182
      Height = 13
      Caption = 'Regras de defini'#231#227'o de parcelas:'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label3: TLabel
      Left = 7
      Top = 406
      Width = 169
      Height = 13
      Caption = '- Separe cada parcela com v'#237'rgula. '
      WordWrap = True
    end
    object Label4: TLabel
      Left = 6
      Top = 419
      Width = 318
      Height = 13
      Caption = 
        '- Para filtrar um intervalo de parcelas, use: 2-5 (Parcelas de 2' +
        ' '#225' 5)'
      WordWrap = True
    end
    object Label5: TLabel
      Left = 6
      Top = 449
      Width = 394
      Height = 13
      Caption = 
        '- Se nenhuma parcela for informada, o desconto ser'#225' aplicado a t' +
        'odas as parcelas'
      WordWrap = True
    end
    object Label6: TLabel
      Left = 6
      Top = 434
      Width = 391
      Height = 13
      Caption = 
        '- Utilize parcelas e intervalo, por exemplo: 1-3,5-7,12 (Parcela' +
        's 1,2,3,5,6,7 e 12)'
      WordWrap = True
    end
    object lbTipoVoucher: TLabel
      Left = 7
      Top = 302
      Width = 453
      Height = 13
      Caption = 'Ser'#227'o gerados 25 vouchers com os c'#243'digos:'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object lbTipoVoucherCodigos: TLabel
      Left = 7
      Top = 319
      Width = 452
      Height = 13
      Caption = 'CUPOM1, CUPOM2, ..., CUPOMN'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
    end
    object dbeCodigo: TDBEdit
      Left = 6
      Top = 19
      Width = 64
      Height = 21
      Color = clBtnFace
      DataField = 'CD_LOTE'
      DataSource = dsLote
      ReadOnly = True
      TabOrder = 0
    end
    object dbeFornecedor: TDBEdit
      Left = 6
      Top = 59
      Width = 424
      Height = 21
      DataField = 'NM_FORNECEDOR'
      DataSource = dsLote
      ReadOnly = True
      TabOrder = 1
    end
    object dbeDescricao: TDBEdit
      Left = 6
      Top = 99
      Width = 315
      Height = 21
      DataField = 'DS_LOTE'
      DataSource = dsLote
      TabOrder = 2
    end
    object dbePrefixo: TDBEdit
      Left = 6
      Top = 142
      Width = 248
      Height = 21
      DataField = 'DS_PREFIXO'
      DataSource = dsLote
      TabOrder = 4
      OnExit = rgTipoVoucherChange
    end
    object dbeSufixo: TDBEdit
      Left = 267
      Top = 142
      Width = 192
      Height = 21
      DataField = 'DS_SUFIXO'
      DataSource = dsLote
      TabOrder = 5
      OnExit = rgTipoVoucherChange
    end
    object dbeDesconto: TDBEdit
      Left = 6
      Top = 215
      Width = 107
      Height = 21
      DataField = 'VL_DESCONTO'
      DataSource = dsLote
      TabOrder = 6
    end
    object dtpVencto: TDateTimePicker
      Left = 327
      Top = 98
      Width = 133
      Height = 21
      Date = 42796.550770578690000000
      Time = 42796.550770578690000000
      ShowCheckbox = True
      Checked = False
      TabOrder = 3
    end
    object speQuantidade: TSpinEdit
      Left = 267
      Top = 213
      Width = 96
      Height = 22
      MaxValue = 65535
      MinValue = 1
      TabOrder = 8
      Value = 1
      OnChange = rgTipoVoucherChange
    end
    object dbDescontoVista: TDBEdit
      Left = 136
      Top = 214
      Width = 107
      Height = 21
      DataField = 'VL_DESCONTO_VISTA'
      DataSource = dsLote
      TabOrder = 7
    end
    object rbDescontoFixo: TRadioButton
      Left = 191
      Top = 173
      Width = 179
      Height = 17
      Caption = 'Desconto em valor Fixo'
      TabOrder = 10
      OnClick = rbDescontoFixoClick
    end
    object rbDescontoPercentual: TRadioButton
      Left = 6
      Top = 172
      Width = 179
      Height = 17
      Caption = 'Desconto em valor Percentual'
      Checked = True
      TabOrder = 11
      TabStop = True
      OnClick = rbDescontoPercentualClick
    end
    object dbeRangeParcela: TDBEdit
      Left = 7
      Top = 365
      Width = 177
      Height = 21
      DataField = 'DS_PARCELA_RANGE'
      DataSource = dsLote
      TabOrder = 9
    end
    object rgTipoVoucher: TDBRadioGroup
      Left = 7
      Top = 245
      Width = 247
      Height = 52
      Caption = 'Tipo de voucher'
      DataField = 'nr_tipo_voucher'
      DataSource = dsLote
      Items.Strings = (
        'Gerar vouchers com c'#243'digo de uso individual'
        'Gerar vouchers com c'#243'digo de uso coletivo')
      ParentBackground = True
      TabOrder = 12
      Values.Strings = (
        '1'
        '2')
      OnChange = rgTipoVoucherChange
    end
  end
  object bbtnConfirmar: TBitBtn
    Left = 165
    Top = 481
    Width = 75
    Height = 25
    Caption = 'Confirmar'
    TabOrder = 1
    Kind = bkOK
  end
  object bbtnCancelar: TBitBtn
    Left = 248
    Top = 481
    Width = 75
    Height = 25
    Caption = 'Cancelar'
    TabOrder = 2
    Kind = bkCancel
  end
  object qryLote: TUMZQuery
    Connection = DM.db
    SQL.Strings = (
      'SELECT'
      '  `CD_LOTE`,'
      '  `CD_FORNECEDOR`,'
      '  `DS_LOTE`,'
      '  `DT_VENCIMENTO`,'
      '  `DS_PREFIXO`,'
      '  `DS_SUFIXO`,'
      '  `VL_DESCONTO`,'
      '  `NR_QUANTIDADE`,'
      '   `VL_DESCONTO_VISTA`,'
      '   `TP_DESCONTO`,'
      '   `DS_PARCELA_RANGE`,'
      '   `nr_tipo_voucher`'
      'FROM'
      '  `UNIM_VOUCHER_LOTE`'
      'WHERE'
      '  `CD_LOTE` = :CD_LOTE')
    Params = <
      item
        DataType = ftUnknown
        Name = 'CD_LOTE'
        ParamType = ptUnknown
      end>
    Left = 200
    Top = 16
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'CD_LOTE'
        ParamType = ptUnknown
      end>
    object qryLoteCD_LOTE: TLargeintField
      FieldName = 'CD_LOTE'
      Required = True
    end
    object qryLoteCD_FORNECEDOR: TIntegerField
      FieldName = 'CD_FORNECEDOR'
      Required = True
      OnChange = qryLoteCD_FORNECEDORChange
    end
    object qryLoteDS_LOTE: TStringField
      FieldName = 'DS_LOTE'
      Required = True
      OnChange = qryLoteDS_LOTEChange
      Size = 255
    end
    object qryLoteDT_VENCIMENTO: TDateField
      FieldName = 'DT_VENCIMENTO'
    end
    object qryLoteDS_PREFIXO: TStringField
      FieldName = 'DS_PREFIXO'
      Size = 64
    end
    object qryLoteDS_SUFIXO: TStringField
      FieldName = 'DS_SUFIXO'
      Size = 64
    end
    object qryLoteVL_DESCONTO: TFloatField
      FieldName = 'VL_DESCONTO'
      Required = True
      OnChange = qryLoteVL_DESCONTOChange
    end
    object qryLoteNR_QUANTIDADE: TLargeintField
      FieldName = 'NR_QUANTIDADE'
      Required = True
    end
    object qryLoteNM_FORNECEDOR: TStringField
      FieldKind = fkLookup
      FieldName = 'NM_FORNECEDOR'
      LookupDataSet = qryFornecedor
      LookupKeyFields = 'CD_PESSOA'
      LookupResultField = 'NM_PESSOA'
      KeyFields = 'CD_FORNECEDOR'
      Size = 255
      Lookup = True
    end
    object qryLoteVL_DESCONTO_VISTA: TFloatField
      FieldName = 'VL_DESCONTO_VISTA'
      Required = True
      OnChange = qryLoteVL_DESCONTO_VISTAChange
    end
    object qryLoteTP_DESCONTO: TStringField
      FieldName = 'TP_DESCONTO'
      Size = 1
    end
    object qryLoteDS_PARCELA_RANGE: TStringField
      FieldName = 'DS_PARCELA_RANGE'
      Size = 64
    end
    object qryLotenr_tipo_voucher: TSmallintField
      FieldName = 'nr_tipo_voucher'
    end
  end
  object qryFornecedor: TUMZReadOnlyQuery
    Connection = DM.db
    SQL.Strings = (
      'SELECT'
      '  `CD_PESSOA`,'
      '  `NM_PESSOA`'
      'FROM'
      '  `PESSOAS`'
      'WHERE'
      '  `CD_PESSOA` = :CD_FORNECEDOR')
    Params = <
      item
        DataType = ftUnknown
        Name = 'CD_FORNECEDOR'
        ParamType = ptUnknown
      end>
    Left = 200
    Top = 48
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'CD_FORNECEDOR'
        ParamType = ptUnknown
      end>
    object qryFornecedorCD_PESSOA: TIntegerField
      FieldName = 'CD_PESSOA'
      Required = True
    end
    object qryFornecedorNM_PESSOA: TStringField
      FieldName = 'NM_PESSOA'
      Size = 60
    end
  end
  object dsLote: TDataSource
    AutoEdit = False
    DataSet = qryLote
    Left = 232
    Top = 16
  end
  object qryTotalizadores: TUMZReadOnlyQuery
    Connection = DM.db
    SQL.Strings = (
      'SELECT'
      '  COUNT(*) nr_total,'
      '  COUNT(COALESCE(v.cd_pessoa, vp.cd_pessoa)) nr_utilizados,'
      '  MAX(v.nr_sequencial) nr_ultimo'
      'FROM'
      '  unim_voucher v'
      
        #9'LEFT JOIN unim_voucher_pessoa vp ON (vp.cd_voucher = v.cd_vouch' +
        'er)'
      'WHERE'
      '  v.cd_lote = :CD_LOTE'
      'GROUP BY'
      #9'v.cd_lote')
    Params = <
      item
        DataType = ftUnknown
        Name = 'CD_LOTE'
        ParamType = ptUnknown
      end>
    Left = 200
    Top = 112
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'CD_LOTE'
        ParamType = ptUnknown
      end>
    object qryTotalizadoresNR_TOTAL: TLargeintField
      FieldName = 'NR_TOTAL'
      ReadOnly = True
    end
    object qryTotalizadoresNR_UTILIZADOS: TLargeintField
      FieldName = 'NR_UTILIZADOS'
      ReadOnly = True
    end
    object qryTotalizadoresNR_ULTIMO: TLargeintField
      FieldName = 'NR_ULTIMO'
      ReadOnly = True
    end
  end
  object qryDeleteVouchers: TUMZQuery
    Connection = DM.db
    SQL.Strings = (
      'DELETE FROM `UNIM_VOUCHER` WHERE `CD_LOTE` = :CD_LOTE')
    Params = <
      item
        DataType = ftUnknown
        Name = 'CD_LOTE'
        ParamType = ptUnknown
      end>
    Left = 264
    Top = 120
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'CD_LOTE'
        ParamType = ptUnknown
      end>
  end
  object qryVouchers: TUMZQuery
    Connection = DM.db
    SQL.Strings = (
      'SELECT'
      '  `CD_VOUCHER`,'
      '  `CD_LOTE`,'
      '  `CD_PESSOA`,'
      '  `NR_SEQUENCIAL`,'
      '  `DS_VOUCHER`,'
      '  `DT_VENCIMENTO`,'
      '  `VL_DESCONTO`,'
      '  `VL_DESCONTO_VISTA`,'
      '  `TP_DESCONTO`,'
      '  `DS_PARCELA_RANGE`'
      'FROM'
      '  `UNIM_VOUCHER`'
      'WHERE'
      '  `CD_LOTE` = :CD_LOTE')
    Params = <
      item
        DataType = ftUnknown
        Name = 'CD_LOTE'
        ParamType = ptUnknown
      end>
    Left = 200
    Top = 80
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'CD_LOTE'
        ParamType = ptUnknown
      end>
    object qryVouchersCD_VOUCHER: TLargeintField
      FieldName = 'CD_VOUCHER'
      Required = True
    end
    object qryVouchersCD_LOTE: TLargeintField
      FieldName = 'CD_LOTE'
      Required = True
    end
    object qryVouchersCD_PESSOA: TIntegerField
      FieldName = 'CD_PESSOA'
    end
    object qryVouchersNR_SEQUENCIAL: TLargeintField
      FieldName = 'NR_SEQUENCIAL'
      Required = True
    end
    object qryVouchersDS_VOUCHER: TStringField
      FieldName = 'DS_VOUCHER'
      Required = True
      Size = 255
    end
    object qryVouchersDT_VENCIMENTO: TDateField
      FieldName = 'DT_VENCIMENTO'
    end
    object qryVouchersVL_DESCONTO: TFloatField
      FieldName = 'VL_DESCONTO'
      Required = True
    end
    object qryVouchersVL_DESCONTO_VISTA: TFloatField
      FieldName = 'VL_DESCONTO_VISTA'
      Required = True
    end
    object qryVouchersTP_DESCONTO: TStringField
      FieldName = 'TP_DESCONTO'
      Size = 1
    end
    object qryVouchersDS_PARCELA_RANGE: TStringField
      FieldName = 'DS_PARCELA_RANGE'
    end
  end
end
