object fMatricularPlanoDesconto: TfMatricularPlanoDesconto
  Left = 0
  Top = 0
  BorderStyle = bsToolWindow
  BorderWidth = 3
  Caption = 'Aplicar plano de desconto'
  ClientHeight = 422
  ClientWidth = 718
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  OnClose = FormClose
  OnCloseQuery = FormCloseQuery
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object bvlSep1: TBevel
    Left = 0
    Top = 199
    Width = 718
    Height = 3
    Align = alTop
    Shape = bsTopLine
    ExplicitLeft = 168
    ExplicitTop = 335
    ExplicitWidth = 50
  end
  object pnlParcelasOrigem: TPanel
    Left = 0
    Top = 20
    Width = 718
    Height = 179
    Align = alTop
    BevelOuter = bvNone
    TabOrder = 0
    object pnlParcelasOrigemTit: TPanel
      Left = 0
      Top = 0
      Width = 718
      Height = 22
      Align = alTop
      Alignment = taLeftJustify
      BevelOuter = bvNone
      Caption = 
        'Selecione as parcelas para as quais deseja aplicar o plano de de' +
        'sconto'
      TabOrder = 0
    end
    object dbgParcelasOrigem: TDBGrid
      Left = 0
      Top = 22
      Width = 718
      Height = 157
      Align = alClient
      DataSource = dsParcelasOrigem
      ReadOnly = True
      TabOrder = 1
      TitleFont.Charset = DEFAULT_CHARSET
      TitleFont.Color = clWindowText
      TitleFont.Height = -11
      TitleFont.Name = 'Tahoma'
      TitleFont.Style = []
      OnCellClick = dbgParcelasOrigemCellClick
      OnDrawColumnCell = dbgParcelasOrigemDrawColumnCell
      OnTitleClick = dbgParcelasOrigemTitleClick
      Columns = <
        item
          Expanded = False
          FieldName = 'SN_SELECIONADA'
          ReadOnly = False
          Title.Alignment = taCenter
          Title.Caption = 'S'
          Width = 21
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'DS_TIPO_TITULO'
          Title.Caption = 'Tipo de t'#237'tulo'
          Width = 101
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
          FieldName = 'DT_VENCTO'
          Title.Caption = 'Vencimento'
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
          FieldName = 'VL_BOLSA'
          Title.Caption = 'Bolsa'
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'VL_EXTRA'
          Title.Caption = 'Valor extra'
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'NM_RESPONSAVEL'
          Title.Caption = 'Respons'#225'vel'
          Width = 147
          Visible = True
        end>
    end
  end
  object pnlPlanosDesconto: TPanel
    Left = 0
    Top = 202
    Width = 718
    Height = 142
    Align = alClient
    BevelOuter = bvNone
    TabOrder = 1
    object pnlPlanosDescontoTit: TPanel
      Left = 0
      Top = 0
      Width = 718
      Height = 22
      Align = alTop
      Alignment = taLeftJustify
      BevelOuter = bvNone
      Caption = 'Selecione o plano de desconto desejado'
      TabOrder = 0
    end
    object dbgPlanosDesconto: TDBGrid
      Left = 0
      Top = 22
      Width = 718
      Height = 120
      Align = alClient
      DataSource = dsPlanosDesconto
      TabOrder = 1
      TitleFont.Charset = DEFAULT_CHARSET
      TitleFont.Color = clWindowText
      TitleFont.Height = -11
      TitleFont.Name = 'Tahoma'
      TitleFont.Style = []
      Columns = <
        item
          Expanded = False
          FieldName = 'DS_PLANO'
          ReadOnly = True
          Title.Caption = 'Descri'#231#227'o'
          Width = 248
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'VL_PERCENTUAL'
          Title.Caption = 'Percentual'
          Width = 90
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'VL_FIXO'
          Title.Caption = 'Valor fixo'
          Width = 70
          Visible = True
        end>
    end
  end
  object pnlBotoes: TPanel
    Left = 0
    Top = 344
    Width = 718
    Height = 78
    Align = alBottom
    BevelOuter = bvNone
    TabOrder = 2
    object sbSimular: TSpeedButton
      Left = 345
      Top = 49
      Width = 62
      Height = 25
      AllowAllUp = True
      GroupIndex = 1
      Caption = 'Simular'
      Flat = True
      Glyph.Data = {
        36030000424D3603000000000000360000002800000010000000100000000100
        18000000000000030000120B0000120B00000000000000000000FFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFA2A2A28F908F7776778787888A8A8B8E
        8E8E8C8C8C8B8B8B888787757476A1A1A1A3A3A4FFFFFFFFFFFFFFFFFFFFFFFF
        8D8C8CDEDDDDA6A4A3AAA7A78C8B8B9999989E9D9E9892949291907F7C7AC8C7
        C8949493FFFFFFFFFFFFFFFFFFFFFFFF888888E1E0DEBBB7BAD3D3D4BEBEBECD
        CBCDC8CAC7CBCAC9787875585654B5B2B2929092FFFFFFFFFFFFFFFFFFFFFFFF
        848383DCDADB9F9E9EBFBFC3A2A2A3B9B8B8B2B0B3A5A1A6C0BEC0959391D6D6
        D68E8E8EFFFFFFFFFFFFFFFFFFFFFFFF838182DDDEDD9B9E9ABEBCBE949390B0
        ADAFAFB4B38F8E8DBABFBD858587D8D7D78A8B8BFFFFFFFFFFFFFFFFFFFFFFFF
        807F7FE8E9E8C9C8C5EDECEDD1CFCCE6E7E9EAE5EAC6C6CAE3E2E2AFACAFE3E0
        E0888989FFFFFFFFFFFFFFFFFFFFFFFF838281E0DFDE7E797CAFAFB27C7B7899
        979B989391747279ACACAC82827FD6D7D68C8A8AFFFFFFFFFFFFFFFFFFFFFFFF
        838383EBEBEDC8C8C7F3F2F2D6D4D4ECEEEDECECE8CBCFD1E5E4E7B5B3B1E4E3
        E58D8D8CFFFFFFFFFFFFFFFFFFFFFFFF8B8A8AE2E4E39A9799CACACBAAA7A9BD
        C0C0C4BFC2A8AAABC4C6C5948F90DDDDDC929091FFFFFFFFFFFFFFFFFFFFFFFF
        8C8E8DE3E1E2A7A6AAD0CDD0ADA9A9BCBDBCC0BFC09C9B9CCBCCCC9A9696DCDA
        D9979797FFFFFFFFFFFFFFFFFFFFFFFF949493ECECEBD9D5D6EBE2E8DED3DAE6
        D9E2E3D8DDD9CDD3E3D8DDCDC6CAE6E5E59D9E9EFFFFFFFFFFFFFFFFFFFFFFFF
        98979789868853605962756C5B6F665C6E645D6E6762736D596B6346524D9894
        959F9E9EFFFFFFFFFFFFFFFFFFFFFFFF999998766F7291C1A6D9FFF0C8FFE3BD
        FFDFB7FED8AFFDD597E6BA558C6C8C8286A3A2A3FFFFFFFFFFFFFFFFFFFFFFFF
        8E8C8C837E8247544E6171685F6C635E6F655F6D645C6D625A70633D4F458F89
        8D979797FFFFFFFFFFFFFFFFFFFFFFFF8E8E8EC8C7C7B9B3B6B3ACAFB3ACAFB3
        AAAFB2AAAEB3A9AFB2A8ADB1AAAEC5C5C49A9999FFFFFFFFFFFF}
      OnClick = sbSimularClick
    end
    object Label1: TLabel
      Left = 0
      Top = 8
      Width = 86
      Height = 13
      Caption = 'Tipo de desconto:'
    end
    object bbtnConfirmar: TBitBtn
      Left = 538
      Top = 49
      Width = 83
      Height = 25
      Caption = 'Confirmar'
      ModalResult = 1
      TabOrder = 0
      OnClick = bbtnConfirmarClick
      Glyph.Data = {
        DE010000424DDE01000000000000760000002800000024000000120000000100
        0400000000006801000000000000000000001000000000000000000000000000
        80000080000000808000800000008000800080800000C0C0C000808080000000
        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333333333333
        3333333333333333333333330000333333333333333333333333F33333333333
        00003333344333333333333333388F3333333333000033334224333333333333
        338338F3333333330000333422224333333333333833338F3333333300003342
        222224333333333383333338F3333333000034222A22224333333338F338F333
        8F33333300003222A3A2224333333338F3838F338F33333300003A2A333A2224
        33333338F83338F338F33333000033A33333A222433333338333338F338F3333
        0000333333333A222433333333333338F338F33300003333333333A222433333
        333333338F338F33000033333333333A222433333333333338F338F300003333
        33333333A222433333333333338F338F00003333333333333A22433333333333
        3338F38F000033333333333333A223333333333333338F830000333333333333
        333A333333333333333338330000333333333333333333333333333333333333
        0000}
      NumGlyphs = 2
    end
    object bbtnCancelar: TBitBtn
      Left = 621
      Top = 49
      Width = 83
      Height = 25
      Caption = 'Cancelar'
      TabOrder = 1
      OnClick = bbtnCancelarClick
      Kind = bkCancel
    end
    object rbDescontoCondicional: TRadioButton
      Left = 0
      Top = 54
      Width = 184
      Height = 17
      Caption = 'Aplicar como desconto condicional'
      Checked = True
      TabOrder = 2
      TabStop = True
      OnClick = rbDescontoCondicionalClick
    end
    object rbDescontoFixo: TRadioButton
      Left = 190
      Top = 54
      Width = 151
      Height = 17
      Caption = 'Aplicar como desconto fixo'
      TabOrder = 3
      OnClick = rbDescontoFixoClick
    end
    object cbTipoDesconto: TUMComboBox
      Left = 0
      Top = 27
      Width = 409
      Height = 21
      Style = csDropDownList
      ItemHeight = 13
      TabOrder = 4
      OnChange = cbTipoDescontoChange
      Items.Strings = (
        
          'Soma: Utilize esta op'#231#227'o para que o desconto seja somado ao desc' +
          'onto do plano.'
        
          'Proporcional: Utilize esta op'#231#227'o para que o sistema recalcule o ' +
          'desconto do plano de pagamento proporcionalmente AP'#211'S a aplica'#231#227 +
          'o do desconto de plano de bolsa.'
        
          'Sobrepor: Utilize esta op'#231#227'o para que o desconto do plano de pag' +
          'amento seja substitu'#237'do pelo desconto do plano de bolsas.')
      TamanhoMaximo = 0
    end
  end
  object pnlTitulo: TPanel
    Left = 0
    Top = 0
    Width = 718
    Height = 20
    Align = alTop
    BevelOuter = bvNone
    Caption = 'APLICAR PLANO DE DESCONTO'
    Color = clBlue
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindow
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 3
  end
  object qryPlanosDesconto: TUMZReadOnlyQuery
    Connection = DM.db
    SQL.Strings = (
      'SELECT'
      '   CODIGO CD_PLANO,'
      '   DESCRICAOPLANO DS_PLANO,'
      '   PERCENTUALDESCONTO VL_PERCENTUAL,'
      '   VALORDESCONTO VL_FIXO,'
      '   CD_ACAO_MOVIMENTO,'
      '   CD_TIPO_DESCONTO,'
      '   SN_CONDICIONAL'
      'FROM'
      '   PLANOSDESCONTO'
      'WHERE'
      '   COALESCE(CD_ACAO_MOVIMENTO, 0) != 0')
    Params = <>
    Left = 408
    Top = 296
    object qryPlanosDescontoCD_PLANO: TIntegerField
      FieldName = 'CD_PLANO'
    end
    object qryPlanosDescontoDS_PLANO: TStringField
      FieldName = 'DS_PLANO'
      Size = 255
    end
    object qryPlanosDescontoVL_PERCENTUAL: TFloatField
      FieldName = 'VL_PERCENTUAL'
      DisplayFormat = '###,###,##0.00'
    end
    object qryPlanosDescontoVL_FIXO: TFloatField
      FieldName = 'VL_FIXO'
      DisplayFormat = '###,###,##0.00'
    end
    object qryPlanosDescontoCD_ACAO_MOVIMENTO: TLargeintField
      FieldName = 'CD_ACAO_MOVIMENTO'
    end
    object qryPlanosDescontoCD_TIPO_DESCONTO: TSmallintField
      FieldName = 'CD_TIPO_DESCONTO'
    end
    object qryPlanosDescontoSN_CONDICIONAL: TSmallintField
      FieldName = 'SN_CONDICIONAL'
    end
  end
  object dsPlanosDesconto: TDataSource
    DataSet = cdsPlanosDesconto
    OnDataChange = dsPlanosDescontoDataChange
    Left = 456
    Top = 296
  end
  object cdsParcelasOrigem: TClientDataSet
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
        Name = 'DT_VENCTO'
        DataType = ftDate
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
        Name = 'VL_BOLSA'
        DataType = ftCurrency
      end
      item
        Name = 'VL_EXTRA'
        DataType = ftCurrency
      end
      item
        Name = 'CD_RESPONSAVEL'
        DataType = ftInteger
      end
      item
        Name = 'NM_RESPONSAVEL'
        DataType = ftString
        Size = 64
      end
      item
        Name = 'SN_DIVISIVEL'
        DataType = ftBoolean
      end
      item
        Name = 'SN_SELECIONADA'
        DataType = ftBoolean
      end
      item
        Name = 'SN_SIMULADO'
        DataType = ftBoolean
      end
      item
        Name = 'CD_CONTA'
        DataType = ftInteger
      end
      item
        Name = 'PtrItemPlano'
        DataType = ftInteger
      end
      item
        Name = 'CD_ACAO_MOVIMENTO'
        DataType = ftLargeint
      end
      item
        Name = 'CD_DESC_CONDICIONAL'
        DataType = ftLargeint
      end
      item
        Name = 'VL_DESC_EXTRA'
        DataType = ftCurrency
      end>
    IndexDefs = <>
    IndexFieldNames = 'NR_PARCELA'
    Params = <>
    StoreDefs = True
    Left = 176
    Top = 128
    object cdsParcelasOrigemCD_TIPO_TITULO: TIntegerField
      FieldName = 'CD_TIPO_TITULO'
    end
    object cdsParcelasOrigemDS_TIPO_TITULO: TStringField
      FieldName = 'DS_TIPO_TITULO'
    end
    object cdsParcelasOrigemNR_PARCELA: TIntegerField
      FieldName = 'NR_PARCELA'
    end
    object cdsParcelasOrigemDT_VENCTO: TDateField
      FieldName = 'DT_VENCTO'
    end
    object cdsParcelasOrigemVL_BRUTO: TCurrencyField
      FieldName = 'VL_BRUTO'
      DisplayFormat = '###,###,##0.00'
    end
    object cdsParcelasOrigemVL_DESCONTO: TCurrencyField
      FieldName = 'VL_DESCONTO'
      DisplayFormat = '###,###,##0.00'
    end
    object cdsParcelasOrigemVL_BOLSA: TCurrencyField
      FieldName = 'VL_BOLSA'
      DisplayFormat = '###,###,##0.00'
    end
    object cdsParcelasOrigemVL_EXTRA: TCurrencyField
      FieldName = 'VL_EXTRA'
      DisplayFormat = '###,###,##0.00'
    end
    object cdsParcelasOrigemCD_RESPONSAVEL: TIntegerField
      FieldName = 'CD_RESPONSAVEL'
    end
    object cdsParcelasOrigemNM_RESPONSAVEL: TStringField
      FieldName = 'NM_RESPONSAVEL'
      Size = 64
    end
    object cdsParcelasOrigemSN_DIVISIVEL: TBooleanField
      FieldName = 'SN_DIVISIVEL'
    end
    object cdsParcelasOrigemSN_SELECIONADA: TBooleanField
      FieldName = 'SN_SELECIONADA'
    end
    object cdsParcelasOrigemSN_SIMULADO: TBooleanField
      FieldName = 'SN_SIMULADO'
    end
    object cdsParcelasOrigemCD_CONTA: TIntegerField
      FieldName = 'CD_CONTA'
    end
    object cdsParcelasOrigemPtrItemPlano: TIntegerField
      FieldName = 'PtrItemPlano'
    end
    object cdsParcelasOrigemCD_ACAO_MOVIMENTO: TLargeintField
      FieldName = 'CD_ACAO_MOVIMENTO'
    end
    object cdsParcelasOrigemCD_DESC_CONDICIONAL: TLargeintField
      FieldName = 'CD_DESC_CONDICIONAL'
    end
    object cdsParcelasOrigemVL_DESC_EXTRA: TCurrencyField
      FieldName = 'VL_DESC_EXTRA'
      DisplayFormat = '###,###,##0.00'
    end
  end
  object dsParcelasOrigem: TDataSource
    DataSet = cdsParcelasOrigem
    Left = 232
    Top = 128
  end
  object cdsPlanosDesconto: TClientDataSet
    Aggregates = <>
    IndexFieldNames = 'DS_PLANO;VL_PERCENTUAL'
    Params = <>
    ProviderName = 'dspPlanosDesconto'
    Left = 464
    Top = 232
    object cdsPlanosDescontoCD_PLANO: TIntegerField
      FieldName = 'CD_PLANO'
      ProviderFlags = []
    end
    object cdsPlanosDescontoDS_PLANO: TStringField
      FieldName = 'DS_PLANO'
      ProviderFlags = []
      Size = 255
    end
    object cdsPlanosDescontoVL_PERCENTUAL: TFloatField
      FieldName = 'VL_PERCENTUAL'
      ProviderFlags = []
      OnChange = cdsPlanosDescontoVL_PERCENTUALChange
    end
    object cdsPlanosDescontoVL_FIXO: TFloatField
      FieldName = 'VL_FIXO'
      ProviderFlags = []
      OnChange = cdsPlanosDescontoVL_PERCENTUALChange
    end
    object cdsPlanosDescontoCD_ACAO_MOVIMENTO: TLargeintField
      FieldName = 'CD_ACAO_MOVIMENTO'
      ProviderFlags = []
    end
    object cdsPlanosDescontoCD_TIPO_DESCONTO: TSmallintField
      FieldName = 'CD_TIPO_DESCONTO'
      ProviderFlags = []
    end
    object cdsPlanosDescontoSN_CONDICIONAL: TSmallintField
      FieldName = 'SN_CONDICIONAL'
    end
  end
  object dspPlanosDesconto: TDataSetProvider
    DataSet = qryPlanosDesconto
    Left = 448
    Top = 184
  end
end
