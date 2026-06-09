object frmRepReserva: TfrmRepReserva
  Left = 200
  Top = 103
  Width = 177
  Height = 143
  Caption = 'frmRepReserva'
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  PixelsPerInch = 96
  TextHeight = 13
  object Report: TppReport
    DataPipeline = ppMatriculas
    PrinterSetup.BinName = 'Default'
    PrinterSetup.DocumentName = 'Requerimento de Matrícula'
    PrinterSetup.PaperName = 'A4 (210 x 297 mm)'
    PrinterSetup.PrinterName = 'Default'
    PrinterSetup.mmMarginBottom = 2000
    PrinterSetup.mmMarginLeft = 6350
    PrinterSetup.mmMarginRight = 6350
    PrinterSetup.mmMarginTop = 2000
    PrinterSetup.mmPaperHeight = 297000
    PrinterSetup.mmPaperWidth = 210000
    Template.FileName = 'C:\Desenv\Universitario\repReserva.RTM'
    Units = utMillimeters
    Device = dvPrinter
    Language = lgPortugueseBrazil
    Left = 112
    Top = 8
    Version = '3.52'
    mmColumnWidth = 0
    object ppReport1HeaderBand1: TppHeaderBand
      mmBottomOffset = 0
      mmHeight = 0
      mmPrintPosition = 0
    end
    object ppReport1DetailBand1: TppDetailBand
      DataPipeline = ppAlunos
      mmBottomOffset = 0
      mmHeight = 292894
      mmPrintPosition = 0
      object ReportShape16: TppShape
        mmHeight = 150813
        mmLeft = 1323
        mmTop = 34660
        mmWidth = 193146
        BandType = 4
      end
      object ReportShape19: TppShape
        Shape = stRoundRect
        mmHeight = 10319
        mmLeft = 140759
        mmTop = 173038
        mmWidth = 39423
        BandType = 4
      end
      object ReportShape18: TppShape
        Shape = stRoundRect
        mmHeight = 11377
        mmLeft = 171186
        mmTop = 21960
        mmWidth = 23548
        BandType = 4
      end
      object ReportShape15: TppShape
        mmHeight = 64294
        mmLeft = 1323
        mmTop = 187325
        mmWidth = 193146
        BandType = 4
      end
      object ReportShape13: TppShape
        Shape = stRoundRect
        mmHeight = 10319
        mmLeft = 141023
        mmTop = 129382
        mmWidth = 48683
        BandType = 4
      end
      object ReportShape12: TppShape
        Shape = stRoundRect
        mmHeight = 10319
        mmLeft = 80698
        mmTop = 129382
        mmWidth = 38100
        BandType = 4
      end
      object ReportShape8: TppShape
        Shape = stRoundRect
        mmHeight = 10319
        mmLeft = 29633
        mmTop = 119327
        mmWidth = 33338
        BandType = 4
      end
      object ReportShape5: TppShape
        Shape = stRoundRect
        mmHeight = 10319
        mmLeft = 140759
        mmTop = 152929
        mmWidth = 38894
        BandType = 4
      end
      object ReportShape4: TppShape
        Shape = stRoundRect
        mmHeight = 10319
        mmLeft = 29633
        mmTop = 152929
        mmWidth = 89165
        BandType = 4
      end
      object ReportShape1: TppShape
        Shape = stRoundRect
        mmHeight = 11377
        mmLeft = 29633
        mmTop = 75936
        mmWidth = 160073
        BandType = 4
      end
      object ppReport1Shape4: TppShape
        Shape = stRoundRect
        mmHeight = 11377
        mmLeft = 173302
        mmTop = 53711
        mmWidth = 16140
        BandType = 4
      end
      object ppReport1Shape2: TppShape
        Shape = stRoundRect
        mmHeight = 11377
        mmLeft = 29633
        mmTop = 53711
        mmWidth = 32279
        BandType = 4
      end
      object ppReport1Shape3: TppShape
        Shape = stRoundRect
        mmHeight = 11377
        mmLeft = 82286
        mmTop = 53711
        mmWidth = 71702
        BandType = 4
      end
      object ReportShape3: TppShape
        Shape = stRoundRect
        mmHeight = 11377
        mmLeft = 160338
        mmTop = 64823
        mmWidth = 29104
        BandType = 4
      end
      object ppReport1Shape7: TppShape
        Shape = stRoundRect
        mmHeight = 11377
        mmLeft = 100013
        mmTop = 64823
        mmWidth = 41804
        BandType = 4
      end
      object ppReport1Shape5: TppShape
        Shape = stRoundRect
        mmHeight = 11377
        mmLeft = 29633
        mmTop = 64823
        mmWidth = 60061
        BandType = 4
      end
      object ppReport1Shape1: TppShape
        Shape = stRoundRect
        mmHeight = 11642
        mmLeft = 29633
        mmTop = 42333
        mmWidth = 124354
        BandType = 4
      end
      object ReportShape2: TppShape
        Shape = stRoundRect
        mmHeight = 11377
        mmLeft = 173302
        mmTop = 42333
        mmWidth = 16140
        BandType = 4
      end
      object ppReport1Shape14: TppShape
        Shape = stRoundRect
        mmHeight = 11377
        mmLeft = 140759
        mmTop = 98161
        mmWidth = 22754
        BandType = 4
      end
      object ppReport1Shape12: TppShape
        Shape = stRoundRect
        mmHeight = 11377
        mmLeft = 140759
        mmTop = 87048
        mmWidth = 48683
        BandType = 4
      end
      object ppReport1Shape11: TppShape
        Shape = stRoundRect
        mmHeight = 11377
        mmLeft = 29633
        mmTop = 87048
        mmWidth = 89165
        BandType = 4
      end
      object ppReport1Shape9: TppShape
        Shape = stRoundRect
        mmHeight = 10319
        mmLeft = 140759
        mmTop = 142875
        mmWidth = 38894
        BandType = 4
      end
      object ppReport1Memo1: TppMemo
        Caption = 'ppReport1Memo1'
        CharWrap = False
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = [fsBold]
        Lines.Strings = (
          
            'Autorizado pelos Pareceres CEE Nº 318/92 Portaria E/072/93 e CEE' +
            ' Nº 236/95  Portaria E/005/95'
          'BLUMENAU - SANTA CATARINA')
        Transparent = True
        mmHeight = 9260
        mmLeft = 4233
        mmTop = 11377
        mmWidth = 191294
        BandType = 4
        mmBottomOffset = 0
        mmOverFlowOffset = 0
        mmLeading = 0
      end
      object ppReport1Label1: TppLabel
        Caption = 'COLÉGIO BLUMENAUENSE'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 14
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 5821
        mmLeft = 4233
        mmTop = 5027
        mmWidth = 67204
        BandType = 4
      end
      object ppReport1Label2: TppLabel
        Caption = ' RESERVA DE VAGA '
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 16
        Font.Style = [fsBold]
        mmHeight = 6350
        mmLeft = 69850
        mmTop = 22490
        mmWidth = 56092
        BandType = 4
      end
      object ppReport1Label4: TppLabel
        Caption = 'Nome do Aluno:'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        Transparent = True
        mmHeight = 4233
        mmLeft = 3440
        mmTop = 43127
        mmWidth = 24606
        BandType = 4
      end
      object ppReport1DBText2: TppDBText
        DataField = 'Nome'
        DataPipeline = ppAlunos
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        ParentDataPipeline = False
        Transparent = True
        mmHeight = 4233
        mmLeft = 31750
        mmTop = 43127
        mmWidth = 105304
        BandType = 4
      end
      object ppReport1DBText3: TppDBText
        Alignment = taRightJustify
        AutoSize = True
        DataField = 'Codigo'
        DataPipeline = ppAlunos
        DisplayFormat = '00000-0'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 14
        Font.Style = [fsBold]
        ParentDataPipeline = False
        Transparent = True
        mmHeight = 5821
        mmLeft = 173567
        mmTop = 24077
        mmWidth = 19050
        BandType = 4
      end
      object ppReport1Label5: TppLabel
        Caption = 'Sexo:'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        Transparent = True
        mmHeight = 4233
        mmLeft = 163513
        mmTop = 43127
        mmWidth = 8996
        BandType = 4
      end
      object ppReport1Label6: TppLabel
        Caption = 'Data Nasc.:'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        Transparent = True
        mmHeight = 4233
        mmLeft = 9790
        mmTop = 54504
        mmWidth = 18256
        BandType = 4
      end
      object ppReport1DBText4: TppDBText
        DataField = 'DataNascimento'
        DataPipeline = ppAlunos
        DisplayFormat = 'dd/mm/yyyy'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        ParentDataPipeline = False
        Transparent = True
        mmHeight = 4233
        mmLeft = 31750
        mmTop = 54504
        mmWidth = 25400
        BandType = 4
      end
      object ppReport1Label7: TppLabel
        Caption = 'Município:'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        Transparent = True
        mmHeight = 4233
        mmLeft = 65352
        mmTop = 54504
        mmWidth = 15610
        BandType = 4
      end
      object ppReport1DBText5: TppDBText
        DataField = 'CidadeNascimento'
        DataPipeline = ppAlunos
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        ParentDataPipeline = False
        Transparent = True
        mmHeight = 4233
        mmLeft = 84402
        mmTop = 54504
        mmWidth = 67469
        BandType = 4
      end
      object ppReport1Label8: TppLabel
        Caption = 'UF:'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        Transparent = True
        mmHeight = 4233
        mmLeft = 166952
        mmTop = 54504
        mmWidth = 5556
        BandType = 4
      end
      object ppReport1DBText6: TppDBText
        Alignment = taCenter
        DataField = 'EstadoNascimento'
        DataPipeline = ppAlunos
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        ParentDataPipeline = False
        Transparent = True
        mmHeight = 4233
        mmLeft = 175419
        mmTop = 54504
        mmWidth = 11642
        BandType = 4
      end
      object ppReport1Label9: TppLabel
        Caption = 'R.G.:'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        Transparent = True
        mmHeight = 4233
        mmLeft = 19844
        mmTop = 65617
        mmWidth = 8202
        BandType = 4
      end
      object ppReport1DBText7: TppDBText
        AutoSize = True
        DataField = 'Identidade'
        DataPipeline = ppAlunos
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        ParentDataPipeline = False
        Transparent = True
        mmHeight = 4233
        mmLeft = 31750
        mmTop = 65617
        mmWidth = 15610
        BandType = 4
      end
      object ppReport1DBText8: TppDBText
        DataField = 'OrgaoExp'
        DataPipeline = ppAlunos
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        ParentDataPipeline = False
        Transparent = True
        mmHeight = 4233
        mmLeft = 67733
        mmTop = 65881
        mmWidth = 18256
        BandType = 4
      end
      object ppReport1Label11: TppLabel
        Caption = 'CPF:'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        Transparent = True
        mmHeight = 4233
        mmLeft = 91017
        mmTop = 65881
        mmWidth = 7938
        BandType = 4
      end
      object ppReport1DBText9: TppDBText
        AutoSize = True
        DataField = 'CPF'
        DataPipeline = ppAlunos
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        ParentDataPipeline = False
        Transparent = True
        mmHeight = 4233
        mmLeft = 102659
        mmTop = 65881
        mmWidth = 6879
        BandType = 4
      end
      object ppReport1Label12: TppLabel
        Caption = 'Nome Resp.:'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        Transparent = True
        mmHeight = 4233
        mmLeft = 7938
        mmTop = 143934
        mmWidth = 20108
        BandType = 4
      end
      object ppReport1Shape8: TppShape
        Shape = stRoundRect
        mmHeight = 10319
        mmLeft = 29633
        mmTop = 142875
        mmWidth = 89165
        BandType = 4
      end
      object ppReport1DBText10: TppDBText
        DataField = 'Responsavel'
        DataPipeline = ppAlunos
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        ParentDataPipeline = False
        Transparent = True
        mmHeight = 4233
        mmLeft = 31750
        mmTop = 143934
        mmWidth = 85196
        BandType = 4
      end
      object ppReport1Label13: TppLabel
        Caption = 'CPF Resp.:'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        Transparent = True
        mmHeight = 4233
        mmLeft = 121973
        mmTop = 143934
        mmWidth = 17992
        BandType = 4
      end
      object ppReport1DBText11: TppDBText
        DataField = 'CPF_Responsavel'
        DataPipeline = ppAlunos
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        ParentDataPipeline = False
        Transparent = True
        mmHeight = 4233
        mmLeft = 142875
        mmTop = 143934
        mmWidth = 33867
        BandType = 4
      end
      object ppReport1Label14: TppLabel
        Caption = 'Filiação:'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        Transparent = True
        mmHeight = 4233
        mmLeft = 15081
        mmTop = 77258
        mmWidth = 12965
        BandType = 4
      end
      object ppReport1DBText12: TppDBText
        AutoSize = True
        DataField = 'Pai'
        DataPipeline = ppAlunos
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        ParentDataPipeline = False
        Transparent = True
        mmHeight = 4233
        mmLeft = 42598
        mmTop = 77258
        mmWidth = 40746
        BandType = 4
      end
      object ppReport1Label15: TppLabel
        Caption = 'Mãe:'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        Transparent = True
        mmHeight = 4233
        mmLeft = 32015
        mmTop = 81756
        mmWidth = 7673
        BandType = 4
      end
      object ppReport1DBText13: TppDBText
        AutoSize = True
        DataField = 'Mae'
        DataPipeline = ppAlunos
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        ParentDataPipeline = False
        Transparent = True
        mmHeight = 4233
        mmLeft = 42598
        mmTop = 81756
        mmWidth = 39952
        BandType = 4
      end
      object ppReport1Label16: TppLabel
        Caption = 'Endereço:'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        Transparent = True
        mmHeight = 4233
        mmLeft = 12435
        mmTop = 88106
        mmWidth = 15610
        BandType = 4
      end
      object ppReport1DBText14: TppDBText
        DataField = 'Endereco'
        DataPipeline = ppAlunos
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        ParentDataPipeline = False
        Transparent = True
        mmHeight = 4233
        mmLeft = 31750
        mmTop = 88106
        mmWidth = 84667
        BandType = 4
      end
      object ppReport1Label17: TppLabel
        Caption = 'Compl.:'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        Transparent = True
        mmHeight = 4233
        mmLeft = 127000
        mmTop = 88106
        mmWidth = 11906
        BandType = 4
      end
      object ppReport1DBText15: TppDBText
        DataField = 'Complemento'
        DataPipeline = ppAlunos
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        ParentDataPipeline = False
        Transparent = True
        mmHeight = 4233
        mmLeft = 142875
        mmTop = 88106
        mmWidth = 43921
        BandType = 4
      end
      object ppReport1Label18: TppLabel
        Caption = 'Cidade:'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        Transparent = True
        mmHeight = 4233
        mmLeft = 16404
        mmTop = 99219
        mmWidth = 11642
        BandType = 4
      end
      object ppReport1Shape13: TppShape
        Shape = stRoundRect
        mmHeight = 11377
        mmLeft = 29633
        mmTop = 98161
        mmWidth = 89165
        BandType = 4
      end
      object ppReport1DBText16: TppDBText
        DataField = 'Cidade'
        DataPipeline = ppAlunos
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        ParentDataPipeline = False
        Transparent = True
        mmHeight = 4233
        mmLeft = 31750
        mmTop = 99219
        mmWidth = 84667
        BandType = 4
      end
      object ppReport1Label19: TppLabel
        Caption = 'UF:'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        Transparent = True
        mmHeight = 4233
        mmLeft = 133350
        mmTop = 98954
        mmWidth = 5556
        BandType = 4
      end
      object ppReport1DBText17: TppDBText
        DataField = 'Estado'
        DataPipeline = ppAlunos
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        ParentDataPipeline = False
        Transparent = True
        mmHeight = 4233
        mmLeft = 142875
        mmTop = 98954
        mmWidth = 18521
        BandType = 4
      end
      object ppReport1Label20: TppLabel
        Caption = 'Telefone:'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        Transparent = True
        mmHeight = 4233
        mmLeft = 14288
        mmTop = 110331
        mmWidth = 13758
        BandType = 4
      end
      object ppReport1Shape15: TppShape
        Shape = stRoundRect
        mmHeight = 10319
        mmLeft = 29633
        mmTop = 109273
        mmWidth = 89165
        BandType = 4
      end
      object ppReport1DBText18: TppDBText
        DataField = 'Telefone1'
        DataPipeline = ppAlunos
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        ParentDataPipeline = False
        Transparent = True
        mmHeight = 4233
        mmLeft = 31750
        mmTop = 110331
        mmWidth = 84667
        BandType = 4
      end
      object ReportLabel1: TppLabel
        Caption = 'Pai:'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        Transparent = True
        mmHeight = 4233
        mmLeft = 33602
        mmTop = 77258
        mmWidth = 6085
        BandType = 4
      end
      object ReportLabel2: TppLabel
        Caption = 'Est. Civil.:'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        Transparent = True
        mmHeight = 4233
        mmLeft = 143404
        mmTop = 65881
        mmWidth = 15610
        BandType = 4
      end
      object ReportDBText1: TppDBText
        DataField = 'EstadoCivil'
        DataPipeline = ppAlunos
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        ParentDataPipeline = False
        Transparent = True
        mmHeight = 4233
        mmLeft = 162984
        mmTop = 65881
        mmWidth = 23813
        BandType = 4
      end
      object ReportLabel3: TppLabel
        Caption = 'Endereço Resp.:'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        Transparent = True
        mmHeight = 4233
        mmLeft = 2381
        mmTop = 153988
        mmWidth = 25665
        BandType = 4
      end
      object ReportDBText2: TppDBText
        DataField = 'EnderecoResponsavel'
        DataPipeline = ppAlunos
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        ParentDataPipeline = False
        Transparent = True
        mmHeight = 4233
        mmLeft = 31750
        mmTop = 153988
        mmWidth = 85196
        BandType = 4
      end
      object ReportLabel4: TppLabel
        Caption = 'Compl.:'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        Transparent = True
        mmHeight = 4233
        mmLeft = 128059
        mmTop = 153988
        mmWidth = 11906
        BandType = 4
      end
      object ReportDBText3: TppDBText
        DataField = 'ComplementoResponsavel'
        DataPipeline = ppAlunos
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        ParentDataPipeline = False
        Transparent = True
        mmHeight = 4233
        mmLeft = 142875
        mmTop = 153988
        mmWidth = 33867
        BandType = 4
      end
      object ReportLabel5: TppLabel
        Caption = 'Cidade Resp.:'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        Transparent = True
        mmHeight = 4233
        mmLeft = 6350
        mmTop = 164042
        mmWidth = 21696
        BandType = 4
      end
      object ReportShape6: TppShape
        Shape = stRoundRect
        mmHeight = 10319
        mmLeft = 29633
        mmTop = 162984
        mmWidth = 89165
        BandType = 4
      end
      object ReportDBText4: TppDBText
        DataField = 'CidadeResponsavel'
        DataPipeline = ppAlunos
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        ParentDataPipeline = False
        Transparent = True
        mmHeight = 4233
        mmLeft = 31750
        mmTop = 164042
        mmWidth = 85196
        BandType = 4
      end
      object ReportLabel6: TppLabel
        Caption = 'UF:'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        Transparent = True
        mmHeight = 4233
        mmLeft = 134409
        mmTop = 164042
        mmWidth = 5556
        BandType = 4
      end
      object ReportShape7: TppShape
        Shape = stRoundRect
        mmHeight = 10319
        mmLeft = 140759
        mmTop = 162984
        mmWidth = 22754
        BandType = 4
      end
      object ReportDBText5: TppDBText
        DataField = 'UFResponsavel'
        DataPipeline = ppAlunos
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        ParentDataPipeline = False
        Transparent = True
        mmHeight = 4233
        mmLeft = 142875
        mmTop = 164042
        mmWidth = 17727
        BandType = 4
      end
      object ReportLabel7: TppLabel
        Caption = 'RM/CSM:'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        Transparent = True
        mmHeight = 4233
        mmLeft = 12965
        mmTop = 120386
        mmWidth = 15081
        BandType = 4
      end
      object ReportDBText6: TppDBText
        DataField = 'RM_CSM'
        DataPipeline = ppAlunos
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        ParentDataPipeline = False
        Transparent = True
        mmHeight = 4233
        mmLeft = 31750
        mmTop = 120386
        mmWidth = 28046
        BandType = 4
      end
      object ReportLabel8: TppLabel
        Caption = 'Núm.:'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        Transparent = True
        mmHeight = 4233
        mmLeft = 69586
        mmTop = 120386
        mmWidth = 9260
        BandType = 4
      end
      object ReportShape9: TppShape
        Shape = stRoundRect
        mmHeight = 10319
        mmLeft = 80698
        mmTop = 119327
        mmWidth = 38100
        BandType = 4
      end
      object ReportDBText7: TppDBText
        DataField = 'NumeroMilitar'
        DataPipeline = ppAlunos
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        ParentDataPipeline = False
        Transparent = True
        mmHeight = 4233
        mmLeft = 82815
        mmTop = 120386
        mmWidth = 33338
        BandType = 4
      end
      object ReportLabel9: TppLabel
        Caption = 'Orgão:'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        Transparent = True
        mmHeight = 4233
        mmLeft = 128588
        mmTop = 120386
        mmWidth = 10319
        BandType = 4
      end
      object ReportShape10: TppShape
        Shape = stRoundRect
        mmHeight = 10319
        mmLeft = 140759
        mmTop = 119327
        mmWidth = 40217
        BandType = 4
      end
      object ReportDBText8: TppDBText
        DataField = 'OrganizacaoMilitar'
        DataPipeline = ppAlunos
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        ParentDataPipeline = False
        Transparent = True
        mmHeight = 4233
        mmLeft = 142875
        mmTop = 120386
        mmWidth = 34131
        BandType = 4
      end
      object ReportShape11: TppShape
        Shape = stRoundRect
        mmHeight = 10319
        mmLeft = 29633
        mmTop = 129382
        mmWidth = 33338
        BandType = 4
      end
      object ReportLabel10: TppLabel
        Caption = 'Data:'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        Transparent = True
        mmHeight = 4233
        mmLeft = 19844
        mmTop = 130440
        mmWidth = 8202
        BandType = 4
      end
      object ReportDBText9: TppDBText
        DataField = 'DataExpMilitar'
        DataPipeline = ppAlunos
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        ParentDataPipeline = False
        Transparent = True
        mmHeight = 4233
        mmLeft = 31750
        mmTop = 130440
        mmWidth = 28046
        BandType = 4
      end
      object ReportLabel11: TppLabel
        Caption = 'Série:'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        Transparent = True
        mmHeight = 4233
        mmLeft = 69586
        mmTop = 130440
        mmWidth = 8996
        BandType = 4
      end
      object ReportDBText10: TppDBText
        DataField = 'SerieMilitar'
        DataPipeline = ppAlunos
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        ParentDataPipeline = False
        Transparent = True
        mmHeight = 4233
        mmLeft = 82815
        mmTop = 130440
        mmWidth = 33338
        BandType = 4
      end
      object ReportLabel12: TppLabel
        Caption = 'Local:'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        Transparent = True
        mmHeight = 4233
        mmLeft = 130704
        mmTop = 130440
        mmWidth = 9260
        BandType = 4
      end
      object ReportDBText11: TppDBText
        DataField = 'LocalExpMilitar'
        DataPipeline = ppAlunos
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        ParentDataPipeline = False
        Transparent = True
        mmHeight = 4233
        mmLeft = 143140
        mmTop = 130440
        mmWidth = 44450
        BandType = 4
      end
      object ReportRichText1: TppRichText
        Caption = 'ReportRichText1'
        RichText = 
          '{\rtf1\ansi\deff0\deftab720{\fonttbl{\f0\fswiss MS Sans Serif;}{' +
          '\f1\froman\fcharset2 Symbol;}{\f2\fswiss\fcharset1 MS Sans Serif' +
          ';}{\f3\froman\fprq2 Times New Roman;}{\f4\fmodern\fcharset1 Cour' +
          'ier New;}{\f5\fswiss\fcharset1 Arial;}}'#13#10'{\colortbl\red0\green0\' +
          'blue0;}'#13#10'\deflang1046\pard\li200\ri520\fi-200\plain\f5\fs20\cf0 ' +
          '1. Este formul\'#39'e1rio de \plain\f5\fs20\cf0\b RESERVA DE VAGA\pl' +
          'ain\f5\fs20\cf0  dever\'#39'e1 ser entregue, assinado, at\'#39'e9 dia \p' +
          'lain\f5\fs20\cf0\b 03 DE JULHO\plain\f5\fs20\cf0  na secretaria.' +
          ' Isto tornar\'#39'e1 mais r\'#39'e1pida sua \plain\f5\fs20\cf0\b CONFIRM' +
          'A\'#39'c7\'#39'c3O DE MATR\'#39'cdCULA\plain\f5\fs20\cf0 .'#13#10'\par \pard\li200' +
          '\ri300\fi-200\plain\f5\fs20\cf0 2. A \plain\f5\fs20\cf0\b RESERV' +
          'A DE VAGA\plain\f5\fs20\cf0  ter\'#39'e1 validade somente at\'#39'e9 o d' +
          'ia \plain\f5\fs20\cf0\b 15 DE JULHO\plain\f5\fs20\cf0 , ou seja,' +
          ' at\'#39'e9 esta data sua vaga estar\'#39'e1 garantida.'#13#10'\par 3. A \plai' +
          'n\f5\fs20\cf0\b CONFIRMA\'#39'c7\'#39'c3O DE MATR\'#39'cdCULA\plain\f5\fs20\' +
          'cf0  se dar\'#39'e1 com o pagamento da taxa de material,  a assinatu' +
          'ra do contrato e do requerimento de matr\'#39'edcula.'#13#10'\par 5. Os da' +
          'dos desatualizados ou que n\'#39'e3o constarem neste formul\'#39'e1rio d' +
          'e \plain\f5\fs20\cf0\b RESERVA DE VAGA,\plain\f5\fs20\cf0  dever' +
          '\'#39'e3o ser corrigidos ou inclu\'#39'eddos.'#13#10'\par 6. Dever\'#39'e3o ser ap' +
          'resentados para \plain\f5\fs20\cf0\b CONFIRMA\'#39'c7\'#39'c3O DE MATR\'#39 +
          'cdCULA\plain\f5\fs20\cf0 :'#13#10'\par '#13#10'\par     a) CARTEIRA DE IDENT' +
          'IDADE (C\'#39'd3PIA);'#13#10'\par     b) CERTID\'#39'c3O DE NASCIMENTO OU DE C' +
          'ASAMENTO (C\'#39'd3PIA);'#13#10'\par     c) COMPROVANTE DE RESID\'#39'caNCIA A' +
          'TUAL ( CONTA DE LUZ, \'#39'c1GUA ou TELEFONE );'#13#10'\par     d) CPF DO ' +
          'ALUNO E/OU DO RESPONS\'#39'c1VEL. (C\'#39'd3PIA).\plain\f2\fs20 '#13#10'\par }' +
          #13#10
        mmHeight = 57150
        mmLeft = 12965
        mmTop = 191030
        mmWidth = 179388
        BandType = 4
        mmBottomOffset = 0
        mmOverFlowOffset = 0
      end
      object ReportLabel13: TppLabel
        Caption = 
          'Solicito Reserva de Matrícula no Curso: ________________________' +
          '______ Turma : _________'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 12
        Font.Style = []
        Transparent = True
        mmHeight = 4763
        mmLeft = 11906
        mmTop = 256646
        mmWidth = 182034
        BandType = 4
      end
      object ReportLabel14: TppLabel
        Caption = 'Telefone Resp.:'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        Transparent = True
        mmHeight = 4233
        mmLeft = 4233
        mmTop = 174096
        mmWidth = 23813
        BandType = 4
      end
      object ReportShape14: TppShape
        Shape = stRoundRect
        mmHeight = 10319
        mmLeft = 29633
        mmTop = 173038
        mmWidth = 89165
        BandType = 4
      end
      object ReportDBText12: TppDBText
        DataField = 'TelefoneResponsavel'
        DataPipeline = ppAlunos
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        ParentDataPipeline = False
        Transparent = True
        mmHeight = 4233
        mmLeft = 31750
        mmTop = 174096
        mmWidth = 85196
        BandType = 4
      end
      object ReportLabel15: TppLabel
        Caption = ' DADOS CADASTRAIS DO ALUNO '
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 12
        Font.Style = [fsBold]
        mmHeight = 5027
        mmLeft = 62971
        mmTop = 33073
        mmWidth = 69850
        BandType = 4
      end
      object ReportLabel16: TppLabel
        Caption = 'Blumenau:  _______ / _______ / __________'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        Transparent = True
        mmHeight = 4233
        mmLeft = 11906
        mmTop = 273844
        mmWidth = 69321
        BandType = 4
      end
      object ReportLine1: TppLine
        Weight = 0.750000000000000000
        mmHeight = 3969
        mmLeft = 105834
        mmTop = 275961
        mmWidth = 82286
        BandType = 4
      end
      object ReportLabel17: TppLabel
        Caption = 'Assinatura do Aluno'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        Transparent = True
        mmHeight = 4233
        mmLeft = 131498
        mmTop = 278078
        mmWidth = 30956
        BandType = 4
      end
      object ReportLabel18: TppLabel
        Caption = 'CEP:'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        Transparent = True
        mmHeight = 4233
        mmLeft = 130704
        mmTop = 110331
        mmWidth = 8202
        BandType = 4
      end
      object ReportShape17: TppShape
        Shape = stRoundRect
        mmHeight = 10319
        mmLeft = 140759
        mmTop = 109273
        mmWidth = 40217
        BandType = 4
      end
      object ReportDBText13: TppDBText
        DataField = 'CEP'
        DataPipeline = ppAlunos
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        ParentDataPipeline = False
        Transparent = True
        mmHeight = 4233
        mmLeft = 142875
        mmTop = 110331
        mmWidth = 18521
        BandType = 4
      end
      object ReportDBText14: TppDBText
        Alignment = taCenter
        DataField = 'Sexo'
        DataPipeline = ppAlunos
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        ParentDataPipeline = False
        Transparent = True
        mmHeight = 4233
        mmLeft = 175684
        mmTop = 43127
        mmWidth = 11642
        BandType = 4
      end
      object ReportLabel19: TppLabel
        Caption = 'CEP:'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        Transparent = True
        mmHeight = 4233
        mmLeft = 131763
        mmTop = 174096
        mmWidth = 8202
        BandType = 4
      end
      object ReportDBText15: TppDBText
        AutoSize = True
        DataField = 'CEPResponsavel'
        DataPipeline = ppAlunos
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        ParentDataPipeline = False
        Transparent = True
        mmHeight = 4233
        mmLeft = 142875
        mmTop = 174096
        mmWidth = 26458
        BandType = 4
      end
      object ReportDBText16: TppDBText
        Alignment = taRightJustify
        AutoSize = True
        DataField = 'Turma'
        DataPipeline = ppMatriculas
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        ParentDataPipeline = False
        Transparent = True
        mmHeight = 4233
        mmLeft = 141817
        mmTop = 43127
        mmWidth = 10848
        BandType = 4
      end
    end
    object ppReport1FooterBand1: TppFooterBand
      mmBottomOffset = 0
      mmHeight = 0
      mmPrintPosition = 0
    end
  end
  object ppAlunos: TppBDEPipeline
    DataSource = dtcAlunos
    Left = 80
    Top = 8
  end
  object tblAlunos: TZTable
    Active = True
    Filtered = True
    Connection = db
    
    IndexFieldNames = 'Codigo'
    MasterFields = 'CodigoAluno'
    MasterSource = dtcMatriculas
    TableName = 'Alunos'
    Left = 48
    Top = 8
    object tblAlunosCodigo: TIntegerField
      FieldName = 'Codigo'
    end
    object tblAlunosNome: TStringField
      FieldName = 'Nome'
      Size = 45
    end
    object tblAlunosDataNascimento: TDateTimeField
      FieldName = 'DataNascimento'
    end
    object tblAlunosCidadeNascimento: TStringField
      FieldName = 'CidadeNascimento'
      Size = 22
    end
    object tblAlunosEstadoNascimento: TStringField
      FieldName = 'EstadoNascimento'
      Size = 2
    end
    object tblAlunosEndereco: TStringField
      FieldName = 'Endereco'
      Size = 40
    end
    object tblAlunosComplemento: TStringField
      FieldName = 'Complemento'
      Size = 10
    end
    object tblAlunosCEP: TStringField
      FieldName = 'CEP'
      Size = 9
    end
    object tblAlunosBairro: TStringField
      FieldName = 'Bairro'
    end
    object tblAlunosCidade: TStringField
      FieldName = 'Cidade'
    end
    object tblAlunosEstado: TStringField
      FieldName = 'Estado'
      Size = 2
    end
    object tblAlunosTelefone1: TStringField
      FieldName = 'Telefone1'
      Size = 25
    end
    object tblAlunosSexo: TStringField
      FieldName = 'Sexo'
      Size = 1
    end
    object tblAlunosNacionalidade: TStringField
      FieldName = 'Nacionalidade'
      Size = 15
    end
    object tblAlunosIdentidade: TStringField
      FieldName = 'Identidade'
      Size = 15
    end
    object tblAlunosOrgaoExp: TStringField
      FieldName = 'OrgaoExp'
      Size = 10
    end
    object tblAlunosTurma: TStringField
      FieldName = 'Turma'
      Size = 30
    end
    object tblAlunosCPF: TStringField
      FieldName = 'CPF'
      Size = 15
    end
    object tblAlunosRM_CSM: TStringField
      FieldName = 'RM_CSM'
      Size = 15
    end
    object tblAlunosNumeroMilitar: TStringField
      FieldName = 'NumeroMilitar'
      Size = 12
    end
    object tblAlunosSerieMilitar: TStringField
      FieldName = 'SerieMilitar'
      Size = 1
    end
    object tblAlunosDataExpMilitar: TDateTimeField
      FieldName = 'DataExpMilitar'
    end
    object tblAlunosLocalExpMilitar: TStringField
      FieldName = 'LocalExpMilitar'
      Size = 15
    end
    object tblAlunosOrganizacaoMilitar: TStringField
      FieldName = 'OrganizacaoMilitar'
      Size = 10
    end
    object tblAlunosTipoDocumento: TStringField
      FieldName = 'TipoDocumento'
      Size = 10
    end
    object tblAlunosPai: TStringField
      FieldName = 'Pai'
      Size = 45
    end
    object tblAlunosMae: TStringField
      FieldName = 'Mae'
      Size = 40
    end
    object tblAlunosResponsavel: TStringField
      FieldName = 'Responsavel'
      Size = 30
    end
    object tblAlunosCPF_Responsavel: TStringField
      FieldName = 'CPF_Responsavel'
    end
    object tblAlunosEnderecoResponsavel: TStringField
      FieldName = 'EnderecoResponsavel'
      Size = 40
    end
    object tblAlunosComplementoResponsavel: TStringField
      FieldName = 'ComplementoResponsavel'
      Size = 40
    end
    object tblAlunosCidadeResponsavel: TStringField
      FieldName = 'CidadeResponsavel'
      Size = 30
    end
    object tblAlunosCEPResponsavel: TStringField
      FieldName = 'CEPResponsavel'
      Size = 9
    end
    object tblAlunosUFResponsavel: TStringField
      FieldName = 'UFResponsavel'
      Size = 2
    end
    object tblAlunosTelefoneResponsavel: TStringField
      FieldName = 'TelefoneResponsavel'
      Size = 30
    end
    object tblAlunosTelefone2: TStringField
      FieldName = 'Telefone2'
      Size = 25
    end
    object tblAlunosFuncionario: TStringField
      FieldName = 'Funcionario'
    end
    object tblAlunosVersaoCracha: TIntegerField
      FieldName = 'VersaoCracha'
    end
    object tblAlunosCodigoAlunoIndicado: TIntegerField
      FieldName = 'CodigoAlunoIndicado'
    end
    object tblAlunosEstadoCivil: TStringField
      FieldName = 'EstadoCivil'
    end
    object tblAlunosTemp: TStringField
      FieldName = 'Temp'
      Calculated = True
    end
  end
  object dtcAlunos: TDataSource
    DataSet = tblAlunos
    Left = 16
    Top = 8
  end
  object tblMatriculas: TZTable
    Active = True
    Filtered = True
    Connection = db
    
    IndexFieldNames = 'CodigoAluno'
    TableName = 'Matriculas'
    Left = 48
    Top = 40
    object tblMatriculasCodigoAluno: TIntegerField
      FieldName = 'CodigoAluno'
    end
    object tblMatriculasTurma: TStringField
      FieldName = 'Turma'
      Size = 15
    end
    object tblMatriculasDataEmissao: TDateTimeField
      FieldName = 'DataEmissao'
      DisplayFormat = 'dd/mm/yyyy'
    end
    object tblMatriculasUsuario: TStringField
      FieldName = 'Usuario'
      Size = 30
    end
    object tblMatriculasPlanoPagamento: TIntegerField
      FieldName = 'PlanoPagamento'
    end
    object tblMatriculasPeriodo: TSmallintField
      FieldName = 'Periodo'
    end
    object tblMatriculasSequencia: TSmallintField
      FieldName = 'Sequencia'
    end
    object tblMatriculasSituacao: TSmallintField
      FieldName = 'Situacao'
    end
    object tblMatriculasImpresso: TBooleanField
      FieldName = 'Impresso'
    end
    object tblMatriculasAnoSemestre: TStringField
      FieldName = 'AnoSemestre'
      Size = 10
      Calculated = True
    end
  end
  object dtcMatriculas: TDataSource
    DataSet = tblMatriculas
    Left = 16
    Top = 40
  end
  object ppMatriculas: TppBDEPipeline
    DataSource = dtcMatriculas
    Left = 80
    Top = 40
  end
  object tblTurmas: TZTable
    Active = True
    Connection = db
    
    IndexFieldNames = 'Turma'
    MasterFields = 'Turma'
    MasterSource = dtcMatriculas
    TableName = 'Turmas'
    Left = 48
    Top = 72
    object tblTurmasTurma: TStringField
      FieldName = 'Turma'
      Size = 15
    end
    object tblTurmasDescricao: TStringField
      FieldName = 'Descricao'
      Size = 40
    end
    object tblTurmasContrato: TStringField
      FieldName = 'Contrato'
      Size = 50
    end
    object tblTurmasVagas: TSmallintField
      FieldName = 'Vagas'
    end
    object tblTurmasHoraInicial: TDateTimeField
      FieldName = 'HoraInicial'
    end
    object tblTurmasHoraFinal: TDateTimeField
      FieldName = 'HoraFinal'
    end
    object tblTurmasDataInicio: TDateTimeField
      FieldName = 'DataInicio'
    end
    object tblTurmasDataTermino: TDateTimeField
      FieldName = 'DataTermino'
    end
    object tblTurmasTurno: TStringField
      FieldName = 'Turno'
    end
  end
  object dtcTurmas: TDataSource
    DataSet = tblTurmas
    Left = 16
    Top = 72
  end
end

