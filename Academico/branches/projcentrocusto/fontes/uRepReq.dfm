object frmRepReq: TfrmRepReq
  Left = 271
  Top = 147
  Width = 183
  Height = 140
  Caption = 'frmRepReq'
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  PixelsPerInch = 96
  TextHeight = 13
  object Report: TppReport
    DataPipeline = ppAlunos
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
    Template.FileName = 'C:\Desenv\WMestre13\repRequerimento.RTM'
    Units = utMillimeters
    Device = dvPrinter
    Language = lgPortugueseBrazil
    ShowPrintDialog = False
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
        Caption = 'DADOS CADASTRAIS DO ALUNO'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 12
        Font.Style = [fsBold, fsUnderline]
        Transparent = True
        mmHeight = 5027
        mmLeft = 65881
        mmTop = 26194
        mmWidth = 67733
        BandType = 4
      end
      object ppReport1Label3: TppLabel
        Caption = 'Ano Letivo:'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        Transparent = True
        mmHeight = 4233
        mmLeft = 11113
        mmTop = 35454
        mmWidth = 16933
        BandType = 4
      end
      object ppReport1DBText1: TppDBText
        AutoSize = True
        DataField = 'AnoSemestre'
        DataPipeline = ppAlunos
        DisplayFormat = '0000/0'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = [fsBold]
        ParentDataPipeline = False
        Transparent = True
        mmHeight = 4233
        mmLeft = 29633
        mmTop = 35454
        mmWidth = 22490
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
        mmTop = 43921
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
        mmLeft = 29633
        mmTop = 43921
        mmWidth = 120386
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
        Font.Size = 10
        Font.Style = [fsBold]
        ParentDataPipeline = False
        Transparent = True
        mmHeight = 4233
        mmLeft = 175948
        mmTop = 43921
        mmWidth = 11906
        BandType = 4
      end
      object ppReport1Label5: TppLabel
        Caption = 'Código:'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 4233
        mmLeft = 159544
        mmTop = 43921
        mmWidth = 12965
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
        mmTop = 52388
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
        mmLeft = 29633
        mmTop = 52388
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
        mmTop = 52388
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
        mmTop = 52388
        mmWidth = 67469
        BandType = 4
      end
      object ppReport1Label8: TppLabel
        Caption = 'Estado:'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        Transparent = True
        mmHeight = 4233
        mmLeft = 160602
        mmTop = 52388
        mmWidth = 11906
        BandType = 4
      end
      object ppReport1DBText6: TppDBText
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
        mmTop = 52388
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
        mmLeft = 20108
        mmTop = 60854
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
        mmLeft = 29633
        mmTop = 60854
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
        mmLeft = 61383
        mmTop = 60854
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
        mmLeft = 96309
        mmTop = 60854
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
        mmLeft = 105834
        mmTop = 60854
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
        mmTop = 102923
        mmWidth = 20108
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
        mmLeft = 29633
        mmTop = 102923
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
        mmTop = 102923
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
        mmTop = 102923
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
        mmTop = 68527
        mmWidth = 12965
        BandType = 4
      end
      object ppReport1DBText12: TppDBText
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
        mmLeft = 38100
        mmTop = 68527
        mmWidth = 147373
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
        mmLeft = 28575
        mmTop = 74877
        mmWidth = 7673
        BandType = 4
      end
      object ppReport1DBText13: TppDBText
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
        mmLeft = 38100
        mmTop = 74877
        mmWidth = 146844
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
        mmTop = 82286
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
        mmLeft = 29633
        mmTop = 82286
        mmWidth = 84667
        BandType = 4
      end
      object ppReport1Label17: TppLabel
        Caption = 'Complemento:'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        Transparent = True
        mmHeight = 4233
        mmLeft = 119592
        mmTop = 82286
        mmWidth = 22225
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
        mmTop = 82286
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
        mmTop = 89165
        mmWidth = 11642
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
        mmLeft = 29633
        mmTop = 89165
        mmWidth = 84667
        BandType = 4
      end
      object ppReport1Label19: TppLabel
        Caption = 'Estado:'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        Transparent = True
        mmHeight = 4233
        mmLeft = 128059
        mmTop = 89165
        mmWidth = 11906
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
        mmTop = 89165
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
        mmTop = 96044
        mmWidth = 13758
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
        mmLeft = 29633
        mmTop = 96044
        mmWidth = 84667
        BandType = 4
      end
      object ppReport1Label21: TppLabel
        Alignment = taCenter
        Caption = 'REQUERIMENTO DE MATRÍCULA'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 12
        Font.Style = [fsBold, fsUnderline]
        Transparent = True
        mmHeight = 5027
        mmLeft = 65617
        mmTop = 123561
        mmWidth = 68263
        BandType = 4
      end
      object ppReport1Label22: TppLabel
        Alignment = taRightJustify
        Caption = 'Ilmo. Sr. Diretor do COLÉGIO BLUMENAUENSE'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        Transparent = True
        mmHeight = 4233
        mmLeft = 9790
        mmTop = 135996
        mmWidth = 74877
        BandType = 4
      end
      object Memo: TppMemo
        Caption = 'Memo'
        CharWrap = False
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        Transparent = True
        mmHeight = 31750
        mmLeft = 6350
        mmTop = 142346
        mmWidth = 183886
        BandType = 4
        mmBottomOffset = 0
        mmOverFlowOffset = 0
        mmLeading = 1000
      end
      object ReportRichText1: TppRichText
        Caption = 'ReportRichText1'
        RichText = 
          '{\rtf1\ansi\deff0\deftab720{\fonttbl{\f0\fswiss MS Sans Serif;}{' +
          '\f1\froman\fcharset2 Symbol;}{\f2\fswiss\fcharset1 MS Sans Serif' +
          ';}{\f3\fmodern\fcharset1 Courier New;}}'#13#10'{\colortbl\red0\green0\' +
          'blue0;}'#13#10'\deflang1046\pard\plain\f3\fs18\cf0 DOCUMENTOS:'#13#10'\par '#13 +
          #10'\par  1 (   ) Certid\'#39'e3o de Nascimento ou Casamento (c\'#39'f3pia)' +
          '                  - no ato da matr\'#39'edcula'#13#10'\par  2 (   ) Cartei' +
          'ra de Identidade (c\'#39'f3pia)                               - no a' +
          'to da matr\'#39'edcula'#13#10'\par  3 (   ) Atestado de Frequ\'#39'eancia ou E' +
          'scolaridade (original)            - no ato da matr\'#39'edcula'#13#10'\par' +
          '  4 (   ) Comprovante de resid\'#39'eancia atual (c\'#39'f3pia)         ' +
          '             - no ato da matr\'#39'edcula'#13#10'\par  5 (   ) CPF do Alun' +
          'o e/ou Respons\'#39'e1vel (c\'#39'f3pia)                        - no ato' +
          ' da matr\'#39'edcula'#13#10'\par  6 (   ) Comprovante do Servi\'#39'e7o Milita' +
          'r (c\'#39'f3pia)                       - no ato da matr\'#39'edcula'#13#10'\pa' +
          'r  7 (   ) Hist\'#39'f3rico Escolar de 1\'#39'ba Grau (original e c\'#39'f3p' +
          'ia)              -    at\'#39'e9 30 dias ap\'#39'f3s'#13#10'\par  8 (   ) Hist' +
          '\'#39'f3rico Escolar de 2\'#39'ba Grau (original e c\'#39'f3pia)            ' +
          '  -    at\'#39'e9 30 dias ap\'#39'f3s'#13#10'\par  9 (   ) Certificado de Conc' +
          'lus\'#39'e3o de 1\'#39'ba Grau                          -    at\'#39'e9 30 d' +
          'ias ap\'#39'f3s'#13#10'\par 10 (   ) Uma Foto 3x4 recente                 ' +
          '                        -    at\'#39'e9 30 dias ap\'#39'f3s'#13#10'\par '#13#10'\par' +
          ' ---------------------------------------------------------------' +
          '-----------------------------'#13#10'\par Declaro estar ciente de que ' +
          'a n\'#39'e3o apresenta\'#39'e7\'#39'e3o de quaisquer dos documentos solicita' +
          'dos, no'#13#10'\par prazo m\'#39'e1ximo de 30 dias ap\'#39'f3s a data da matr\' +
          #39'edcula, implicar\'#39'e1 na perda do direito de frequen-'#13#10'\par tar ' +
          'a s\'#39'e9rie pretendida. ( Art. 60 do Reg. Escolar )'#13#10'\par }'#13#10
        mmHeight = 59002
        mmLeft = 7144
        mmTop = 221986
        mmWidth = 184150
        BandType = 4
        mmBottomOffset = 0
        mmOverFlowOffset = 0
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
        mmLeft = 30163
        mmTop = 68527
        mmWidth = 6085
        BandType = 4
      end
      object ReportLabel2: TppLabel
        Caption = 'Estado. Civil.:'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        Transparent = True
        mmHeight = 4233
        mmLeft = 132027
        mmTop = 60854
        mmWidth = 21167
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
        mmLeft = 154517
        mmTop = 60854
        mmWidth = 31750
        BandType = 4
      end
      object ReportLine1: TppLine
        Weight = 0.750000000000000000
        mmHeight = 3969
        mmLeft = 7673
        mmTop = 186796
        mmWidth = 62971
        BandType = 4
      end
      object ReportLabel3: TppLabel
        Caption = 'Funcionário'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        Transparent = True
        mmHeight = 4233
        mmLeft = 30427
        mmTop = 188648
        mmWidth = 17727
        BandType = 4
      end
      object ReportLine2: TppLine
        Weight = 0.750000000000000000
        mmHeight = 3969
        mmLeft = 7673
        mmTop = 210873
        mmWidth = 62971
        BandType = 4
      end
      object ReportLabel4: TppLabel
        Caption = 'Aluno / Responsável'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        Transparent = True
        mmHeight = 4233
        mmLeft = 23548
        mmTop = 212725
        mmWidth = 31221
        BandType = 4
      end
      object ReportLabel5: TppLabel
        Caption = 'Deferido em: _______ / _______ / __________'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        Transparent = True
        mmHeight = 4233
        mmLeft = 113771
        mmTop = 184415
        mmWidth = 71173
        BandType = 4
      end
      object ReportLine3: TppLine
        Weight = 0.750000000000000000
        mmHeight = 3969
        mmLeft = 117740
        mmTop = 210873
        mmWidth = 62971
        BandType = 4
      end
      object ReportLabel6: TppLabel
        Alignment = taCenter
        Caption = 'Diretor Geral'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        Transparent = True
        mmHeight = 4233
        mmLeft = 139700
        mmTop = 212725
        mmWidth = 19315
        BandType = 4
      end
      object ReportLabel7: TppLabel
        Caption = 'Escola Origem:'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        Transparent = True
        mmHeight = 4233
        mmLeft = 4233
        mmTop = 110331
        mmWidth = 23813
        BandType = 4
      end
      object ReportDBText2: TppDBText
        DataField = 'EscolaOrigem'
        DataPipeline = ppAlunos
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        ParentDataPipeline = False
        Transparent = True
        mmHeight = 4233
        mmLeft = 29633
        mmTop = 110331
        mmWidth = 111125
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
  object dtcAlunos: TDataSource
    DataSet = tblAlunos
    Left = 16
    Top = 8
  end
  object tblAlunos: TUMZQuery
    OnCalcFields = tblAlunosCalcFields
    Connection = db
    
    SQL.Strings = (
      'select Alunos.*, Matriculas.*, Turmas.* from'
      '(Alunos INNER JOIN Matriculas ON'
      'Alunos.Codigo = Matriculas.CodigoAluno)'
      'INNER JOIN Turmas ON'
      '(Matriculas.Turma = Turmas.Codigo AND'
      ' Matriculas.AnoSemestre = Turmas.AnoSemestre)'
      'where '
      '(Matriculas.CodigoAluno = :Codigo) and'
      '(Matriculas.Turma = :Turma) and'
      '(Matriculas.AnoSemestre = :AnoSemestre)')
    Params.Data = {
      0100030006436F6469676F00030400542200000001055475726D610001060031
      414D53320000010B416E6F53656D657374726500030400174E00000001}
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
    object tblAlunosDataNascimentoResponsavel: TDateTimeField
      FieldName = 'DataNascimentoResponsavel'
    end
    object tblAlunosNaturalidadeResponsavel: TStringField
      FieldName = 'NaturalidadeResponsavel'
      Size = 30
    end
    object tblAlunosUFNaturalidadeResponsavel: TStringField
      FieldName = 'UFNaturalidadeResponsavel'
      Size = 2
    end
    object tblAlunosSexoResponsavel: TStringField
      FieldName = 'SexoResponsavel'
      Size = 1
    end
    object tblAlunosPaiResponsavel: TStringField
      FieldName = 'PaiResponsavel'
      Size = 45
    end
    object tblAlunosMaeResponsavel: TStringField
      FieldName = 'MaeResponsavel'
      Size = 45
    end
    object tblAlunosEstadoCivilResponsavel: TStringField
      FieldName = 'EstadoCivilResponsavel'
    end
    object tblAlunosNomeConjuge: TStringField
      FieldName = 'NomeConjuge'
      Size = 30
    end
    object tblAlunosDataNascimentoConjuge: TDateTimeField
      FieldName = 'DataNascimentoConjuge'
    end
    object tblAlunosCPF_Responsavel: TStringField
      FieldName = 'CPF_Responsavel'
    end
    object tblAlunosRGResponsavel: TStringField
      FieldName = 'RGResponsavel'
      Size = 15
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
    object tblAlunosDataRevisao: TDateTimeField
      FieldName = 'DataRevisao'
    end
    object tblAlunosNomeSemAcento: TStringField
      FieldName = 'NomeSemAcento'
      Size = 45
    end
    object tblAlunosEmail: TStringField
      FieldName = 'Email'
      Size = 255
    end
    object tblAlunosEscolaOrigem: TStringField
      FieldName = 'EscolaOrigem'
      Size = 50
    end
    object tblAlunosSituacao: TSmallintField
      FieldName = 'Situacao'
    end
    object tblAlunosCodigoAluno: TIntegerField
      FieldName = 'CodigoAluno'
    end
    object tblAlunosTurma_1: TStringField
      FieldName = 'Turma_1'
      Size = 15
    end
    object tblAlunosDataEmissao: TDateTimeField
      FieldName = 'DataEmissao'
    end
    object tblAlunosUsuario: TStringField
      FieldName = 'Usuario'
      Size = 30
    end
    object tblAlunosPlanoPagamento: TIntegerField
      FieldName = 'PlanoPagamento'
    end
    object tblAlunosSituacao_1: TSmallintField
      FieldName = 'Situacao_1'
    end
    object tblAlunosImpresso: TBooleanField
      FieldName = 'Impresso'
    end
    object tblAlunosDataSaida: TDateTimeField
      FieldName = 'DataSaida'
    end
    object tblAlunosPlanoDesconto: TIntegerField
      FieldName = 'PlanoDesconto'
    end
    object tblAlunosDiploma: TBooleanField
      FieldName = 'Diploma'
    end
    object tblAlunosCodigo_1: TStringField
      FieldName = 'Codigo_1'
      Size = 15
    end
    object tblAlunosSerie: TSmallintField
      FieldName = 'Serie'
    end
    object tblAlunosCurso: TStringField
      FieldName = 'Curso'
      Size = 15
    end
    object tblAlunosTurno: TStringField
      FieldName = 'Turno'
      Size = 1
    end
    object tblAlunosDescricao: TStringField
      FieldName = 'Descricao'
      Size = 40
    end
    object tblAlunosContrato: TStringField
      FieldName = 'Contrato'
      Size = 50
    end
    object tblAlunosVagas: TSmallintField
      FieldName = 'Vagas'
    end
    object tblAlunosHoraInicio: TDateTimeField
      FieldName = 'HoraInicio'
    end
    object tblAlunosHoraFim: TDateTimeField
      FieldName = 'HoraFim'
    end
    object tblAlunosDataInicio: TDateTimeField
      FieldName = 'DataInicio'
    end
    object tblAlunosDataFim: TDateTimeField
      FieldName = 'DataFim'
    end
    object tblAlunosIdadeConclusao: TSmallintField
      FieldName = 'IdadeConclusao'
    end
    object tblAlunosDataConclusao: TDateTimeField
      FieldName = 'DataConclusao'
    end
    object tblAlunosAnoSemestre: TSmallintField
      FieldName = 'AnoSemestre'
      DisplayFormat = '0000/0'
    end
    object tblAlunosAnoSemestre_1: TSmallintField
      FieldName = 'AnoSemestre_1'
      DisplayFormat = '0000/0'
    end
    object tblAlunosTeste: TStringField
      FieldName = 'Teste'
      Calculated = True
    end
  end
end

