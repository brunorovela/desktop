object frmRepResumo: TfrmRepResumo
  Left = 245
  Top = 172
  Width = 178
  Height = 176
  Caption = 'frmRepResumo'
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  PixelsPerInch = 96
  TextHeight = 13
  object tblControle: TZTable
    Active = True
    Filtered = True
    Connection = db
    
    IndexName = 'CodigoCaixa'
    TableName = 'ControleCaixa'
    Left = 48
    Top = 48
    object tblControleDataAbertura: TDateTimeField
      FieldName = 'DataAbertura'
    end
    object tblControleDataFechamento: TDateTimeField
      FieldName = 'DataFechamento'
    end
    object tblControleValorAbertura: TFloatField
      FieldName = 'ValorAbertura'
    end
    object tblControleValorFechamento: TFloatField
      FieldName = 'ValorFechamento'
    end
    object tblControleSituacao: TStringField
      FieldName = 'Situacao'
      Size = 1
    end
    object tblControleUsuario: TIntegerField
      FieldName = 'Usuario'
    end
    object tblControleNomeUsuario: TStringField
      FieldName = 'NomeUsuario'
      LookupDataSet = tblUsuarios
      LookupKeyFields = 'Codigo'
      LookupResultField = 'Nome'
      KeyFields = 'Usuario'
      LookupCache = True
      Size = 30
      Lookup = True
    end
    object tblControleCodigoCaixa: TAutoIncField
      FieldName = 'CodigoCaixa'
    end
    object tblControlePago: TFloatField
      FieldName = 'Pago'
    end
    object tblControleRecebido: TFloatField
      FieldName = 'Recebido'
    end
    object tblControleMensalidade: TFloatField
      FieldName = 'Mensalidade'
    end
    object tblControleDinheiro: TFloatField
      FieldName = 'Dinheiro'
    end
    object tblControleCheque: TFloatField
      FieldName = 'Cheque'
    end
  end
  object dtcControle: TDataSource
    DataSet = tblControle
    Left = 16
    Top = 48
  end
  object tblCaixa: TZTable
    Active = True
    Filtered = True
    OnCalcFields = tblCaixaCalcFields
    Connection = db
    
    IndexFieldNames = 'CodigoCaixa'
    MasterFields = 'CodigoCaixa'
    MasterSource = dtcControle
    TableName = 'Caixa'
    Left = 48
    Top = 16
    object tblCaixaDataLcto: TDateTimeField
      FieldName = 'DataLcto'
    end
    object tblCaixaUsuario: TIntegerField
      FieldName = 'Usuario'
    end
    object tblCaixaDescricao: TStringField
      FieldName = 'Descricao'
      Size = 30
    end
    object tblCaixaValor: TFloatField
      FieldName = 'Valor'
    end
    object tblCaixaDebitoCredito: TStringField
      FieldName = 'DebitoCredito'
      Size = 1
    end
    object tblCaixaDinheiroCheque: TStringField
      FieldName = 'DinheiroCheque'
      Size = 1
    end
    object tblCaixaCodigoAluno: TIntegerField
      FieldName = 'CodigoAluno'
    end
    object tblCaixaParcela: TSmallintField
      FieldName = 'Parcela'
    end
    object tblCaixaDataVencimento: TDateTimeField
      FieldName = 'DataVencimento'
    end
    object tblCaixaTurma: TStringField
      FieldName = 'Turma'
      Size = 15
    end
    object tblCaixaCodigoCaixa: TIntegerField
      FieldName = 'CodigoCaixa'
    end
    object tblCaixaMensalidade: TFloatField
      FieldName = 'Mensalidade'
      Calculated = True
    end
    object tblCaixaRecebido: TFloatField
      FieldName = 'Recebido'
      Calculated = True
    end
    object tblCaixaPago: TFloatField
      FieldName = 'Pago'
      Calculated = True
    end
    object tblCaixaDinheiro: TFloatField
      FieldName = 'Dinheiro'
      Calculated = True
    end
    object tblCaixaCheque: TFloatField
      FieldName = 'Cheque'
      Calculated = True
    end
    object tblCaixaDinCh: TStringField
      FieldName = 'DinCh'
      Size = 2
      Calculated = True
    end
    object tblCaixaNomeUsuario: TStringField
      FieldName = 'NomeUsuario'
      LookupDataSet = tblUsuarios2
      LookupKeyFields = 'Codigo'
      LookupResultField = 'Nome'
      KeyFields = 'Usuario'
      LookupCache = True
      Size = 30
      Lookup = True
    end
  end
  object dtcCaixa: TDataSource
    DataSet = tblCaixa
    Left = 16
    Top = 16
  end
  object ppCaixa: TppBDEPipeline
    DataSource = dtcCaixa
    Left = 80
    Top = 16
  end
  object ppControle: TppBDEPipeline
    DataSource = dtcControle
    OnNext = ppControleNext
    Left = 80
    Top = 48
  end
  object Report: TppReport
    DataPipeline = ppControle
    PrinterSetup.BinName = 'Default'
    PrinterSetup.DocumentName = 'Report'
    PrinterSetup.PaperName = 'A4 (210 x 297 mm)'
    PrinterSetup.PrinterName = 'Default'
    PrinterSetup.mmMarginBottom = 3000
    PrinterSetup.mmMarginLeft = 6350
    PrinterSetup.mmMarginRight = 6350
    PrinterSetup.mmMarginTop = 3000
    PrinterSetup.mmPaperHeight = 297000
    PrinterSetup.mmPaperWidth = 210000
    Template.FileName = 'C:\Desenv\Universitario\repResumo.RTM'
    Units = utMillimeters
    Device = dvPrinter
    Language = lgPortugueseBrazil
    Left = 112
    Top = 16
    Version = '3.52'
    mmColumnWidth = 0
    object ppReport1HeaderBand1: TppHeaderBand
      mmBottomOffset = 0
      mmHeight = 28046
      mmPrintPosition = 0
      object ppReport1Line1: TppLine
        Style = lsDouble
        Weight = 0.750000000000000000
        mmHeight = 2910
        mmLeft = 1588
        mmTop = 24077
        mmWidth = 189177
        BandType = 0
      end
      object ReportLabel6: TppLabel
        Caption = 'Data Lcto.'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        Transparent = True
        mmHeight = 4233
        mmLeft = 8467
        mmTop = 19050
        mmWidth = 15875
        BandType = 0
      end
      object ReportLine2: TppLine
        Style = lsDouble
        Weight = 0.750000000000000000
        mmHeight = 1588
        mmLeft = 1588
        mmTop = 17463
        mmWidth = 189177
        BandType = 0
      end
      object ReportLabel7: TppLabel
        Caption = 'CH/$'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        Transparent = True
        mmHeight = 4233
        mmLeft = 32544
        mmTop = 19050
        mmWidth = 7673
        BandType = 0
      end
      object ReportLabel8: TppLabel
        Caption = 'C/D'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        Transparent = True
        mmHeight = 4233
        mmLeft = 42333
        mmTop = 19050
        mmWidth = 5821
        BandType = 0
      end
      object ReportLabel9: TppLabel
        Caption = 'HISTÓRICO'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        Transparent = True
        mmHeight = 4233
        mmLeft = 52123
        mmTop = 19050
        mmWidth = 18256
        BandType = 0
      end
      object ReportLabel10: TppLabel
        Caption = 'VALOR'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        Transparent = True
        mmHeight = 4233
        mmLeft = 138642
        mmTop = 19050
        mmWidth = 11642
        BandType = 0
      end
      object ReportLabel11: TppLabel
        Caption = 'FUNCIONÁRIO'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        Transparent = True
        mmHeight = 4233
        mmLeft = 157957
        mmTop = 19050
        mmWidth = 23283
        BandType = 0
      end
      object ppReport1Label1: TppLabel
        Caption = 'COLÉGIO UNIVERSITÁRIO'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 14
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 5821
        mmLeft = 1588
        mmTop = 794
        mmWidth = 63765
        BandType = 0
      end
      object lblResumo: TppLabel
        Caption = 'RESUMO DO CAIXA'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 12
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 5027
        mmLeft = 1588
        mmTop = 7144
        mmWidth = 40217
        BandType = 0
      end
      object ReportCalc2: TppCalc
        Alignment = taRightJustify
        CalcType = ctDateTime
        CustomType = dtDateTime
        DisplayFormat = 'dd/mm/yyyy hh:nn'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 4233
        mmLeft = 162984
        mmTop = 7144
        mmWidth = 26458
        BandType = 0
      end
      object ReportCalc1: TppCalc
        Alignment = taRightJustify
        CalcType = ctPageNo
        CustomType = dtInteger
        DisplayFormat = 'Página: ##0'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 4233
        mmLeft = 173567
        mmTop = 794
        mmWidth = 15875
        BandType = 0
      end
    end
    object ppReport1DetailBand1: TppDetailBand
      DataPipeline = ppCaixa
      mmBottomOffset = 0
      mmHeight = 5821
      mmPrintPosition = 0
      object ppReport1DBText5: TppDBText
        Alignment = taRightJustify
        DataField = 'DataLcto'
        DataPipeline = ppCaixa
        DisplayFormat = 'dd/mm/yyyy hh:nn'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = []
        ParentDataPipeline = False
        Transparent = True
        mmHeight = 3969
        mmLeft = 2117
        mmTop = 529
        mmWidth = 29104
        BandType = 4
      end
      object ppReport1DBText6: TppDBText
        Alignment = taCenter
        DataField = 'DinCh'
        DataPipeline = ppCaixa
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = []
        ParentDataPipeline = False
        Transparent = True
        mmHeight = 3969
        mmLeft = 33338
        mmTop = 529
        mmWidth = 6350
        BandType = 4
      end
      object ppReport1DBText7: TppDBText
        DataField = 'Descricao'
        DataPipeline = ppCaixa
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = []
        ParentDataPipeline = False
        Transparent = True
        mmHeight = 3969
        mmLeft = 52123
        mmTop = 529
        mmWidth = 79111
        BandType = 4
      end
      object ppReport1DBText8: TppDBText
        Alignment = taCenter
        DataField = 'DebitoCredito'
        DataPipeline = ppCaixa
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = []
        ParentDataPipeline = False
        Transparent = True
        mmHeight = 3969
        mmLeft = 42333
        mmTop = 529
        mmWidth = 5821
        BandType = 4
      end
      object ppReport1DBText9: TppDBText
        Alignment = taRightJustify
        DataField = 'Valor'
        DataPipeline = ppCaixa
        DisplayFormat = '###,###,##0.00'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = []
        ParentDataPipeline = False
        Transparent = True
        mmHeight = 3969
        mmLeft = 133086
        mmTop = 529
        mmWidth = 22754
        BandType = 4
      end
      object ReportDBText1: TppDBText
        DataField = 'NomeUsuario'
        DataPipeline = ppCaixa
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = []
        ParentDataPipeline = False
        Transparent = True
        mmHeight = 3969
        mmLeft = 157957
        mmTop = 529
        mmWidth = 30956
        BandType = 4
      end
      object ReportLine7: TppLine
        Position = lpRight
        Weight = 0.750000000000000000
        mmHeight = 8731
        mmLeft = 188384
        mmTop = 0
        mmWidth = 1852
        BandType = 4
      end
      object ReportLine10: TppLine
        Position = lpLeft
        Weight = 0.750000000000000000
        mmHeight = 8731
        mmLeft = 1058
        mmTop = 0
        mmWidth = 1852
        BandType = 4
      end
    end
    object ppReport1FooterBand1: TppFooterBand
      mmBottomOffset = 0
      mmHeight = 0
      mmPrintPosition = 0
    end
    object ReportGroup1: TppGroup
      BreakName = 'CodigoCaixa'
      DataPipeline = ppCaixa
      mmNewColumnThreshold = 0
      mmNewPageThreshold = 0
      object ReportGroupHeaderBand1: TppGroupHeaderBand
        mmBottomOffset = 0
        mmHeight = 15081
        mmPrintPosition = 0
        object ppReport1DBText1: TppDBText
          Alignment = taRightJustify
          DataField = 'DataAbertura'
          DataPipeline = ppControle
          DisplayFormat = 'dd/mm/yyyy hh:nn'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 10
          Font.Style = []
          ParentDataPipeline = False
          Transparent = True
          mmHeight = 4233
          mmLeft = 44450
          mmTop = 3440
          mmWidth = 33338
          BandType = 3
          GroupNo = 0
        end
        object ppReport1Label3: TppLabel
          Caption = 'Data/Hora Abertura:'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 10
          Font.Style = []
          Transparent = True
          mmHeight = 4233
          mmLeft = 4763
          mmTop = 3440
          mmWidth = 30427
          BandType = 3
          GroupNo = 0
        end
        object ppReport1Label5: TppLabel
          Caption = 'Valor Abertura:'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 10
          Font.Style = []
          Transparent = True
          mmHeight = 3969
          mmLeft = 11642
          mmTop = 8202
          mmWidth = 23019
          BandType = 3
          GroupNo = 0
        end
        object ppReport1DBText3: TppDBText
          Alignment = taRightJustify
          DataField = 'ValorAbertura'
          DataPipeline = ppControle
          DisplayFormat = 'R$ ###,###,##0.00'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 10
          Font.Style = []
          ParentDataPipeline = False
          Transparent = True
          mmHeight = 4233
          mmLeft = 51329
          mmTop = 8202
          mmWidth = 26458
          BandType = 3
          GroupNo = 0
        end
        object ReportLine4: TppLine
          Weight = 0.750000000000000000
          mmHeight = 1588
          mmLeft = 1058
          mmTop = 14817
          mmWidth = 189177
          BandType = 3
          GroupNo = 0
        end
        object ReportLine5: TppLine
          Pen.Width = 2
          Weight = 1.500000000000000000
          mmHeight = 1588
          mmLeft = 1058
          mmTop = 794
          mmWidth = 189177
          BandType = 3
          GroupNo = 0
        end
        object ReportLine6: TppLine
          Position = lpRight
          Weight = 0.750000000000000000
          mmHeight = 13758
          mmLeft = 187325
          mmTop = 1058
          mmWidth = 2910
          BandType = 3
          GroupNo = 0
        end
        object ReportLine9: TppLine
          Position = lpLeft
          Weight = 0.750000000000000000
          mmHeight = 13758
          mmLeft = 1058
          mmTop = 1058
          mmWidth = 2910
          BandType = 3
          GroupNo = 0
        end
        object ReportDBText2: TppDBText
          Alignment = taRightJustify
          AutoSize = True
          DataField = 'NomeUsuario'
          DataPipeline = ppControle
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 12
          Font.Style = [fsBold, fsUnderline]
          Transparent = True
          mmHeight = 5027
          mmLeft = 170127
          mmTop = 2910
          mmWidth = 18521
          BandType = 3
          GroupNo = 0
        end
        object lblSimples: TppLabel
          Caption = 'SIMPLES CONFERÊNCIA'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 12
          Font.Style = [fsBold]
          Transparent = True
          Visible = False
          mmHeight = 5027
          mmLeft = 97367
          mmTop = 5027
          mmWidth = 51329
          BandType = 3
          GroupNo = 0
        end
      end
      object ReportGroupFooterBand1: TppGroupFooterBand
        mmBottomOffset = 0
        mmHeight = 29369
        mmPrintPosition = 0
        object ppReport1Label4: TppLabel
          Caption = 'Data/Hora Fechamento:'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 10
          Font.Style = []
          Transparent = True
          mmHeight = 4233
          mmLeft = 3969
          mmTop = 3969
          mmWidth = 36513
          BandType = 5
          GroupNo = 0
        end
        object ppReport1Label6: TppLabel
          Caption = 'Valor Fechamento:'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 10
          Font.Style = []
          Transparent = True
          mmHeight = 4233
          mmLeft = 11377
          mmTop = 8731
          mmWidth = 29104
          BandType = 5
          GroupNo = 0
        end
        object ppReport1DBText2: TppDBText
          Alignment = taRightJustify
          DataField = 'DataFechamento'
          DataPipeline = ppControle
          DisplayFormat = 'dd/mm/yyyy hh:nn'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 10
          Font.Style = []
          ParentDataPipeline = False
          Transparent = True
          mmHeight = 4233
          mmLeft = 44186
          mmTop = 3969
          mmWidth = 33338
          BandType = 5
          GroupNo = 0
        end
        object ppReport1DBText4: TppDBText
          Alignment = taRightJustify
          DataField = 'ValorFechamento'
          DataPipeline = ppControle
          DisplayFormat = 'R$ ###,###,##0.00'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 10
          Font.Style = []
          ParentDataPipeline = False
          Transparent = True
          mmHeight = 4233
          mmLeft = 51065
          mmTop = 8731
          mmWidth = 26458
          BandType = 5
          GroupNo = 0
        end
        object ReportLine1: TppLine
          Weight = 0.750000000000000000
          mmHeight = 2910
          mmLeft = 1058
          mmTop = 1852
          mmWidth = 189177
          BandType = 5
          GroupNo = 0
        end
        object ReportLabel1: TppLabel
          Caption = 'Pago:'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 10
          Font.Style = []
          Transparent = True
          mmHeight = 4233
          mmLeft = 93663
          mmTop = 3969
          mmWidth = 8996
          BandType = 5
          GroupNo = 0
        end
        object ReportLabel2: TppLabel
          Caption = 'Recebido:'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 10
          Font.Style = []
          Transparent = True
          mmHeight = 4233
          mmLeft = 87313
          mmTop = 8996
          mmWidth = 15346
          BandType = 5
          GroupNo = 0
        end
        object ReportLabel3: TppLabel
          Caption = 'Mensalidades:'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 10
          Font.Style = []
          Transparent = True
          mmHeight = 4233
          mmLeft = 80433
          mmTop = 13758
          mmWidth = 22225
          BandType = 5
          GroupNo = 0
        end
        object ReportLabel4: TppLabel
          Caption = 'Cheque:'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 10
          Font.Style = []
          Transparent = True
          mmHeight = 4233
          mmLeft = 137848
          mmTop = 3969
          mmWidth = 12700
          BandType = 5
          GroupNo = 0
        end
        object ReportLabel5: TppLabel
          Caption = 'Dinheiro:'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 10
          Font.Style = []
          Transparent = True
          mmHeight = 4233
          mmLeft = 137054
          mmTop = 8996
          mmWidth = 13494
          BandType = 5
          GroupNo = 0
        end
        object ReportDBText3: TppDBText
          Alignment = taRightJustify
          DataField = 'Pago'
          DataPipeline = ppControle
          DisplayFormat = 'R$ ###,###,##0.00'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 10
          Font.Style = []
          Transparent = True
          mmHeight = 4233
          mmLeft = 103452
          mmTop = 3969
          mmWidth = 26723
          BandType = 5
          GroupNo = 0
        end
        object ReportDBText4: TppDBText
          Alignment = taRightJustify
          DataField = 'Recebido'
          DataPipeline = ppControle
          DisplayFormat = 'R$ ###,###,##0.00'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 10
          Font.Style = []
          Transparent = True
          mmHeight = 4233
          mmLeft = 103452
          mmTop = 8996
          mmWidth = 26723
          BandType = 5
          GroupNo = 0
        end
        object ReportDBText5: TppDBText
          Alignment = taRightJustify
          DataField = 'Mensalidade'
          DataPipeline = ppControle
          DisplayFormat = 'R$ ###,###,##0.00'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 10
          Font.Style = []
          Transparent = True
          mmHeight = 4233
          mmLeft = 103452
          mmTop = 13758
          mmWidth = 26723
          BandType = 5
          GroupNo = 0
        end
        object ReportDBText6: TppDBText
          Alignment = taRightJustify
          DataField = 'Cheque'
          DataPipeline = ppControle
          DisplayFormat = 'R$ ###,###,##0.00'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 10
          Font.Style = []
          Transparent = True
          mmHeight = 4233
          mmLeft = 151342
          mmTop = 3969
          mmWidth = 26723
          BandType = 5
          GroupNo = 0
        end
        object ReportDBText7: TppDBText
          Alignment = taRightJustify
          DataField = 'Dinheiro'
          DataPipeline = ppControle
          DisplayFormat = 'R$ ###,###,##0.00'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 10
          Font.Style = []
          Transparent = True
          mmHeight = 4233
          mmLeft = 151342
          mmTop = 8996
          mmWidth = 26723
          BandType = 5
          GroupNo = 0
        end
        object ReportLine3: TppLine
          Pen.Width = 2
          Weight = 1.500000000000000000
          mmHeight = 2910
          mmLeft = 1058
          mmTop = 19315
          mmWidth = 189177
          BandType = 5
          GroupNo = 0
        end
        object ReportLine8: TppLine
          Position = lpRight
          Weight = 0.750000000000000000
          mmHeight = 17992
          mmLeft = 188913
          mmTop = 1852
          mmWidth = 1323
          BandType = 5
          GroupNo = 0
        end
        object ReportLine11: TppLine
          Position = lpLeft
          Weight = 0.750000000000000000
          mmHeight = 17992
          mmLeft = 1058
          mmTop = 1852
          mmWidth = 1323
          BandType = 5
          GroupNo = 0
        end
      end
    end
  end
  object tblUsuarios: TZTable
    Active = True
    Connection = db
    
    TableName = 'Usuarios'
    Left = 48
    Top = 80
    object tblUsuariosCodigo: TIntegerField
      FieldName = 'Codigo'
    end
    object tblUsuariosNome: TStringField
      FieldName = 'Nome'
      Size = 30
    end
  end
  object dtcUsuarios: TDataSource
    DataSet = tblUsuarios
    Left = 16
    Top = 80
  end
  object dtcUsuarios2: TDataSource
    DataSet = tblUsuarios2
    Left = 16
    Top = 112
  end
  object tblUsuarios2: TZTable
    Active = True
    Connection = db
    
    TableName = 'Usuarios'
    Left = 48
    Top = 112
    object IntegerField1: TIntegerField
      FieldName = 'Codigo'
    end
    object StringField1: TStringField
      FieldName = 'Nome'
      Size = 30
    end
  end
end

