object uFrmListarMovimentosCaixas: TuFrmListarMovimentosCaixas
  Left = 0
  Top = 0
  Caption = 'Filtro de Lan'#231'amentos'
  ClientHeight = 509
  ClientWidth = 964
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  FormStyle = fsMDIChild
  KeyPreview = True
  OldCreateOrder = False
  Position = poDefault
  Visible = True
  WindowState = wsMaximized
  OnClose = FormClose
  OnKeyDown = FormKeyDown
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object pnlGrid: TPanel
    Left = 0
    Top = 25
    Width = 964
    Height = 461
    Align = alClient
    TabOrder = 0
    object grd: TDBGrid
      Left = 1
      Top = 1
      Width = 962
      Height = 459
      Align = alClient
      BorderStyle = bsNone
      DataSource = dsMovimentacoesCaixas
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Arial'
      Font.Style = []
      Options = [dgTitles, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgAlwaysShowSelection, dgConfirmDelete, dgCancelOnExit, dgMultiSelect]
      ParentFont = False
      ReadOnly = True
      TabOrder = 0
      TitleFont.Charset = DEFAULT_CHARSET
      TitleFont.Color = clWindowText
      TitleFont.Height = -11
      TitleFont.Name = 'MS Sans Serif'
      TitleFont.Style = []
      OnDblClick = grdDblClick
    end
  end
  object pnTitulo: TPanel
    Left = 0
    Top = 0
    Width = 964
    Height = 25
    Align = alTop
    BevelOuter = bvLowered
    Caption = 'Filtro de Lan'#231'amentos'
    Color = clBlue
    Font.Charset = ANSI_CHARSET
    Font.Color = clWhite
    Font.Height = -13
    Font.Name = 'Arial'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 1
  end
  object pnRodape: TPanel
    Left = 0
    Top = 486
    Width = 964
    Height = 23
    Align = alBottom
    BevelOuter = bvNone
    TabOrder = 2
    object sbFechar: TSpeedButton
      Left = 125
      Top = 0
      Width = 100
      Height = 23
      Align = alLeft
      Caption = 'F12 Fechar'
      Flat = True
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
      OnClick = sbFecharClick
    end
    object sbPlanilhaCaixa: TSpeedButton
      Left = 0
      Top = 0
      Width = 125
      Height = 23
      Align = alLeft
      Caption = 'Abrir planilha'
      Flat = True
      Glyph.Data = {
        76010000424D7601000000000000760000002800000020000000100000000100
        04000000000000010000120B0000120B00001000000000000000000000000000
        800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333333000000
        000033333377777777773333330FFFFFFFF03FF3FF7FF33F3FF700300000FF0F
        00F077F777773F737737E00BFBFB0FFFFFF07773333F7F3333F7E0BFBF000FFF
        F0F077F3337773F3F737E0FBFBFBF0F00FF077F3333FF7F77F37E0BFBF00000B
        0FF077F3337777737337E0FBFBFBFBF0FFF077F33FFFFFF73337E0BF0000000F
        FFF077FF777777733FF7000BFB00B0FF00F07773FF77373377373330000B0FFF
        FFF03337777373333FF7333330B0FFFF00003333373733FF777733330B0FF00F
        0FF03333737F37737F373330B00FFFFF0F033337F77F33337F733309030FFFFF
        00333377737FFFFF773333303300000003333337337777777333}
      NumGlyphs = 2
      OnClick = sbPlanilhaCaixaClick
      ExplicitLeft = 218
    end
    object sbSelecionarColuna: TSpeedButton
      Left = 225
      Top = 0
      Width = 30
      Height = 23
      Hint = 'Selecionar Colunas'
      Align = alLeft
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
      Transparent = False
      OnClick = sbSelecionarColunaClick
      ExplicitLeft = 566
      ExplicitTop = 1
      ExplicitHeight = 22
    end
  end
  object dsMovimentacoesCaixas: TDataSource
    AutoEdit = False
    DataSet = qryListaMov
    Left = 488
    Top = 120
  end
  object qryListaMov: TUMZQuery
    Connection = DM.db
    OnCalcFields = qryListaMovCalcFields
    SQL.Strings = (
      'SELECT'
      #9'M.DS_MOEDA,'
      #9'M.DS_SIGLA,'
      #9'T.CD_MOVIMENTO_TE,'
      #9'T.CD_COLIGADA,'
      #9'T.CD_CAIXA,'
      #9'T.CD_ABERTURA_CAIXA,'
      #9'T.DT_MOVIMENTO,'
      #9'T.CD_ACAO,'
      #9'T.NR_DOCUMENTO,'
      #9'T.DS_MOVIMENTO,'
      #9'T.DT_LIBERACAO,'
      #9'T.CD_ORIGEM,'
      #9'T.TP_ENTRADA_SAIDA,'
      #9'T.VL_MOVIMENTO,'
      #9'T.CD_MOEDA,'
      #9'T.VL_MOEDA,'
      #9'T.VL_SALDO,'
      #9'T.VL_DINHEIRO,'
      #9'T.VL_CHEQUE,'
      #9'T.CD_MENSALIDADE,'
      #9'T.CD_USUARIO,'
      #9'T.SN_COMPENSADO,'
      #9'T.DT_COMPENSACAO,'
      #9'T.CD_FORMA_PGTO,'
      #9'T.DT_REGISTRO,'
      #9'T.NR_CHEQUE,'
      #9'T.VL_SALDO_COMPENSADO,'
      #9'T.CD_TITULO,'
      #9'T.NR_ESTORNO,'
      #9'T.CD_TRANSFERE,'
      #9'T.CD_CHEQUE,'
      #9'T.DS_OBSERVACAO,'
      #9'T.DS_OBSERVACAO,'
      #9'PE.NM_PESSOA NM_FORNECEDOR,'
      #9'CASE'
      'WHEN T.CD_ORIGEM = 1 THEN'
      #9#39'CR'#39
      'WHEN T.CD_ORIGEM = 2 THEN'
      #9#39'CP'#39
      'WHEN T.CD_ORIGEM = 3 THEN'
      #9#39'TE'#39
      'WHEN T.CD_ORIGEM = 4 THEN'
      #9#39'CE'#39
      'ELSE'
      #9#39#39
      'END desOrigem,'
      ' CASE'
      'WHEN T.TP_ENTRADA_SAIDA = 1 THEN'
      #9'T.VL_MOVIMENTO'
      'ELSE'
      #9'- T.VL_MOVIMENTO'
      'END ValMovimento,'
      ' CASE'
      'WHEN T.TP_ENTRADA_SAIDA = 1 THEN'
      #9'T.VL_MOVIMENTO'
      'ELSE'
      #9'0.0'
      'END ValEntradasBanco,'
      ' CASE'
      'WHEN T.TP_ENTRADA_SAIDA = 2 THEN'
      #9'T.VL_MOVIMENTO'
      'ELSE'
      #9'0.0'
      'END ValSaidasBanco,'
      ' CASE'
      'WHEN T.TP_ENTRADA_SAIDA = 1 THEN'
      #9#39'E'#39
      'ELSE'
      #9#39'S'#39
      'END desES,'
      ' CASE'
      'WHEN T.VL_DINHEIRO <= 0 THEN'
      #9#39'C'#39
      'WHEN T.VL_CHEQUE > 0 THEN'
      #9#39'A'#39
      'ELSE'
      #9#39'D'#39
      'END desDinCh,'
      ' CASE'
      'WHEN TRIM(C.DS_CHEQUE) <> '#39#39' THEN'
      #9'C.DS_CHEQUE'
      'WHEN T.VL_DINHEIRO > 0 THEN'
      #9#39#39
      'ELSE'
      #9#39'-'#39
      'END desCh,'
      ' CASE'
      'WHEN TRIM(C.DS_CHEQUE) <> '#39#39' THEN'
      #9'S.DS_VALOR'
      'WHEN T.VL_DINHEIRO > 0 THEN'
      #9#39#39
      'ELSE'
      #9#39'-'#39
      'END desChSit,'
      ' CASE'
      'WHEN TRIM(C.DS_CHEQUE) <> '#39#39' THEN'
      #9'S.DS_SIGLA'
      'WHEN T.VL_DINHEIRO > 0 THEN'
      #9#39#39
      'ELSE'
      #9#39'-'#39
      'END desChSitSigla,'
      ' CASE'
      'WHEN TRIM(C.DS_CHEQUE) <> '#39#39' THEN'
      #9'CC.DS_CAIXA'
      'WHEN T.VL_DINHEIRO > 0 THEN'
      #9#39#39
      'ELSE'
      #9#39'-'#39
      'END desChCaixa,'
      ' US.NM_PESSOA AS NM_USUARIO'
      'FROM'
      #9'FIN_MOV_TESOURARIA T'
      'LEFT JOIN FIN_MOEDAS M ON (T.CD_MOEDA = M.CD_MOEDA)'
      'LEFT JOIN FIN_CHEQUES C ON (T.CD_CHEQUE = C.CD_CHEQUE)'
      'LEFT JOIN FIN_CADASTRO_CONTAS CC ON (C.CD_CAIXA = CC.CD_CAIXA)'
      'AND ('
      #9'T.CD_COLIGADA = CC.CD_COLIGADA'
      ')'
      'LEFT JOIN SITUACOES S ON ('
      #9'C.CD_SITUACAO = S.CD_SITUACAO'
      ')'
      'AND (S.CD_MODULO = 2050)'
      'LEFT JOIN FIN_CONTAS_PAGAR CP ON ('
      #9'CP.CD_TITULO = T.CD_TITULO'
      #9'AND CP.CD_COLIGADA = T.CD_COLIGADA'
      ')'
      'LEFT JOIN PESSOAS AS PE ON (PE.CD_PESSOA = CP.CD_PESSOA)'
      'LEFT JOIN PESSOAS AS US ON (US.CD_PESSOA = T.CD_USUARIO)'
      'WHERE'
      #9'T.CD_CAIXA = 3'
      'AND T.CD_COLIGADA = 1 '
      'AND T.CD_MOVIMENTO_TE = 1025;')
    Params = <>
    Left = 456
    Top = 120
    object qryListaMovDS_MOEDA: TStringField
      Tag = 1
      FieldName = 'DS_MOEDA'
      Size = 50
    end
    object qryListaMovDS_SIGLA: TStringField
      Tag = 1
      DisplayLabel = 'Moeda'
      DisplayWidth = 5
      FieldName = 'DS_SIGLA'
      Size = 30
    end
    object qryListaMovCD_MOVIMENTO_TE: TLargeintField
      Tag = 1
      DisplayLabel = 'Cod. Mov.'
      FieldName = 'CD_MOVIMENTO_TE'
    end
    object qryListaMovCD_COLIGADA: TIntegerField
      Tag = 1
      DisplayLabel = 'U.E.'
      FieldName = 'CD_COLIGADA'
    end
    object qryListaMovCD_CAIXA: TIntegerField
      Tag = 1
      DisplayLabel = 'C'#243'd. Conta'
      FieldName = 'CD_CAIXA'
    end
    object qryListaMovDS_CAIXA: TStringField
      Tag = 1
      DisplayLabel = 'Nome do caixa'
      FieldName = 'DS_CAIXA'
      Size = 70
    end
    object qryListaMovCD_ABERTURA_CAIXA: TIntegerField
      DisplayLabel = 'Cod. Abertura'
      FieldName = 'CD_ABERTURA_CAIXA'
    end
    object qryListaMovDT_MOVIMENTO: TDateTimeField
      Tag = 1
      DisplayLabel = 'Data'
      DisplayWidth = 10
      FieldName = 'DT_MOVIMENTO'
    end
    object qryListaMovCD_ACAO: TIntegerField
      FieldName = 'CD_ACAO'
    end
    object qryListaMovNR_DOCUMENTO: TStringField
      Tag = 1
      DisplayLabel = 'Nr. Doc.'
      DisplayWidth = 10
      FieldName = 'NR_DOCUMENTO'
      Size = 50
    end
    object qryListaMovDS_MOVIMENTO: TStringField
      Tag = 1
      DisplayLabel = 'Hist'#243'rico'
      DisplayWidth = 60
      FieldName = 'DS_MOVIMENTO'
      Size = 255
    end
    object qryListaMovDT_LIBERACAO: TDateTimeField
      Tag = 1
      DisplayLabel = 'Dt. Libera'#231#227'o'
      DisplayWidth = 10
      FieldName = 'DT_LIBERACAO'
    end
    object qryListaMovCD_ORIGEM: TSmallintField
      Tag = 1
      DisplayLabel = 'Cod. Origem'
      FieldName = 'CD_ORIGEM'
    end
    object qryListaMovTP_ENTRADA_SAIDA: TSmallintField
      Tag = 1
      DisplayLabel = 'E/S'
      FieldName = 'TP_ENTRADA_SAIDA'
    end
    object qryListaMovVL_MOVIMENTO: TFloatField
      FieldName = 'VL_MOVIMENTO'
      DisplayFormat = '###,##0.00'
    end
    object qryListaMovCD_MOEDA: TLargeintField
      FieldName = 'CD_MOEDA'
    end
    object qryListaMovVL_MOEDA: TFloatField
      Tag = 1
      DisplayLabel = 'Valor na Moeda'
      FieldName = 'VL_MOEDA'
      DisplayFormat = '###,##0.00'
    end
    object qryListaMovVL_SALDO: TFloatField
      DisplayLabel = 'Saldo'
      FieldName = 'VL_SALDO'
      Visible = False
    end
    object qryListaMovVL_DINHEIRO: TFloatField
      Tag = 1
      DisplayLabel = 'Valor Dinheiro'
      FieldName = 'VL_DINHEIRO'
      DisplayFormat = '###,##0.00'
    end
    object qryListaMovVL_CHEQUE: TFloatField
      Tag = 1
      DisplayLabel = 'Valor Cheque'
      FieldName = 'VL_CHEQUE'
      DisplayFormat = '###,##0.00'
    end
    object qryListaMovCD_MENSALIDADE: TLargeintField
      Tag = 1
      DisplayLabel = 'C'#243'd. Mens.'
      FieldName = 'CD_MENSALIDADE'
    end
    object qryListaMovCD_USUARIO: TLargeintField
      FieldName = 'CD_USUARIO'
    end
    object qryListaMovSN_COMPENSADO: TSmallintField
      Tag = 1
      Alignment = taCenter
      DisplayLabel = 'C?'
      DisplayWidth = 2
      FieldName = 'SN_COMPENSADO'
    end
    object qryListaMovDT_COMPENSACAO: TDateTimeField
      Tag = 1
      DisplayLabel = 'Data Comp.'
      DisplayWidth = 10
      FieldName = 'DT_COMPENSACAO'
    end
    object qryListaMovCD_FORMA_PGTO: TLargeintField
      Tag = 1
      DisplayLabel = 'Forma Pgto'
      FieldName = 'CD_FORMA_PGTO'
    end
    object qryListaMovDT_REGISTRO: TDateTimeField
      Tag = 1
      DisplayLabel = 'Registro'
      DisplayWidth = 14
      FieldName = 'DT_REGISTRO'
    end
    object qryListaMovNR_CHEQUE: TIntegerField
      Tag = 1
      DisplayLabel = 'N'#186' Cheque'
      FieldName = 'NR_CHEQUE'
    end
    object qryListaMovVL_SALDO_COMPENSADO: TFloatField
      FieldName = 'VL_SALDO_COMPENSADO'
    end
    object qryListaMovCD_TITULO: TLargeintField
      Tag = 1
      DisplayLabel = 'C'#243'd. T'#237'tulo'
      FieldName = 'CD_TITULO'
    end
    object qryListaMovNR_ESTORNO: TLargeintField
      Tag = 1
      DisplayLabel = 'Estorno'
      FieldName = 'NR_ESTORNO'
    end
    object qryListaMovCD_TRANSFERE: TLargeintField
      FieldName = 'CD_TRANSFERE'
    end
    object qryListaMovCD_CHEQUE: TLargeintField
      FieldName = 'CD_CHEQUE'
    end
    object qryListaMovDS_OBSERVACAO: TMemoField
      DisplayLabel = 'OBS.'
      FieldName = 'DS_OBSERVACAO'
      BlobType = ftMemo
    end
    object qryListaMovDS_OBSERVACAO_1: TMemoField
      FieldName = 'DS_OBSERVACAO_1'
      BlobType = ftMemo
    end
    object qryListaMovDESORIGEM: TStringField
      Tag = 1
      Alignment = taCenter
      DisplayLabel = 'Origem'
      FieldName = 'DESORIGEM'
      ReadOnly = True
      Size = 2
    end
    object qryListaMovVALMOVIMENTO: TFloatField
      Tag = 1
      DisplayLabel = 'Valor'
      FieldName = 'VALMOVIMENTO'
      ReadOnly = True
      DisplayFormat = '###,##0.00'
    end
    object qryListaMovDESES: TStringField
      Tag = 1
      DisplayLabel = 'E/S'
      FieldName = 'DESES'
      ReadOnly = True
      Size = 1
    end
    object qryListaMovDESDINCH: TStringField
      Tag = 1
      Alignment = taCenter
      DisplayLabel = 'Din/Ch'
      FieldName = 'DESDINCH'
      ReadOnly = True
      Size = 1
    end
    object qryListaMovDESCH: TStringField
      Tag = 1
      DisplayLabel = 'Nr. Cheque'
      DisplayWidth = 15
      FieldName = 'DESCH'
      ReadOnly = True
      Size = 30
    end
    object qryListaMovDESCHSIT: TStringField
      Tag = 1
      DisplayLabel = 'Ch Situa'#231#227'o'
      DisplayWidth = 15
      FieldName = 'DESCHSIT'
      ReadOnly = True
      Size = 255
    end
    object qryListaMovDESCHSITSIGLA: TStringField
      Tag = 1
      DisplayLabel = 'Ch Sigla'
      DisplayWidth = 15
      FieldName = 'DESCHSITSIGLA'
      ReadOnly = True
      Size = 50
    end
    object qryListaMovDESCHCAIXA: TStringField
      Tag = 1
      DisplayLabel = 'Ch Conta'
      DisplayWidth = 30
      FieldName = 'DESCHCAIXA'
      ReadOnly = True
      Size = 255
    end
    object qryListaMovValEntradas: TStringField
      Tag = 1
      Alignment = taRightJustify
      DisplayLabel = 'Entradas'
      FieldKind = fkCalculated
      FieldName = 'ValEntradas'
      Calculated = True
    end
    object qryListaMovValSaidas: TStringField
      Tag = 1
      Alignment = taRightJustify
      DisplayLabel = 'Saidas'
      FieldKind = fkCalculated
      FieldName = 'ValSaidas'
      Calculated = True
    end
    object qryListaMovValSaidasBanco: TFloatField
      FieldName = 'ValSaidasBanco'
      ReadOnly = True
    end
    object qryListaMovValEntradasBanco: TFloatField
      FieldName = 'ValEntradasBanco'
      ReadOnly = True
    end
    object qryListaMovVLSALDO: TFloatField
      DisplayLabel = 'Saldo'
      DisplayWidth = 20
      FieldKind = fkCalculated
      FieldName = 'VLSALDO'
      Visible = False
      DisplayFormat = '###,###,##0.00'
      Calculated = True
    end
    object qryListaMovVLSALDOCOMP: TFloatField
      DisplayLabel = 'Saldo Comp.'
      DisplayWidth = 20
      FieldKind = fkCalculated
      FieldName = 'VLSALDOCOMP'
      DisplayFormat = '###,###,##0.00'
      Calculated = True
    end
    object qryListaMovNM_FORNECEDOR: TStringField
      Tag = 1
      DisplayLabel = 'Nome do Fornecedor'
      DisplayWidth = 40
      FieldName = 'NM_FORNECEDOR'
      Size = 60
    end
    object qryListaMovNM_USUARIO: TStringField
      Tag = 1
      DisplayLabel = 'Nome do Usu'#225'rio'
      DisplayWidth = 40
      FieldName = 'NM_USUARIO'
      Size = 60
    end
    object qryListaMovCentroCusto: TStringField
      Tag = 1
      DisplayLabel = 'Centros de Custos'
      DisplayWidth = 20
      FieldKind = fkCalculated
      FieldName = 'CentroCusto'
      Size = 150
      Calculated = True
    end
    object qryListaMovPlanoContas: TStringField
      DisplayLabel = 'Plano de Contas'
      DisplayWidth = 35
      FieldKind = fkCalculated
      FieldName = 'PlanoContas'
      Size = 150
      Calculated = True
    end
    object qryListaMovContasCod: TStringField
      Alignment = taRightJustify
      DisplayLabel = 'Cod. Plano de Contas'
      DisplayWidth = 10
      FieldKind = fkCalculated
      FieldName = 'ContasCod'
      Size = 100
      Calculated = True
    end
    object qryListaMovCentrosCod: TStringField
      Tag = 1
      Alignment = taRightJustify
      DisplayLabel = 'Cod. Centros de Custos'
      DisplayWidth = 10
      FieldKind = fkCalculated
      FieldName = 'CentrosCod'
      Size = 100
      Calculated = True
    end
  end
end
