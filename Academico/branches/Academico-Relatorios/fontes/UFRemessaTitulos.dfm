object frmRemessaTitulos: TfrmRemessaTitulos
  Left = 0
  Top = 0
  BorderStyle = bsDialog
  Caption = 'Rela'#231#227'o de t'#237'tulos da remessa'
  ClientHeight = 571
  ClientWidth = 794
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
  PixelsPerInch = 96
  TextHeight = 13
  object bvlSep1: TBevel
    Left = 0
    Top = 24
    Width = 794
    Height = 3
    Align = alTop
    Shape = bsSpacer
    ExplicitLeft = 64
    ExplicitTop = 176
    ExplicitWidth = 50
  end
  object bvlSep2: TBevel
    Left = 0
    Top = 537
    Width = 794
    Height = 3
    Align = alBottom
    Shape = bsBottomLine
    ExplicitLeft = 432
    ExplicitTop = 400
    ExplicitWidth = 50
  end
  object pnlTitulo: TPanel
    Left = 0
    Top = 0
    Width = 794
    Height = 24
    Align = alTop
    BevelOuter = bvNone
    Caption = 'T'#205'TULOS FINANCEIROS RELACIONADOS COM A REMESSA'
    Color = clBlue
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindow
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    Locked = True
    ParentFont = False
    TabOrder = 0
    ExplicitTop = -3
    object sbColunas: TSpeedButton
      Left = 766
      Top = 1
      Width = 23
      Height = 22
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
      OnClick = sbColunasClick
    end
  end
  object dbgTitulos: TSortedDBGrid
    Left = 0
    Top = 27
    Width = 794
    Height = 510
    Align = alClient
    DataSource = dsTitulos
    Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgConfirmDelete, dgCancelOnExit]
    ReadOnly = True
    TabOrder = 1
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'Tahoma'
    TitleFont.Style = []
    DescFields.Strings = (
      'DATAEMISSAO')
    Columns = <
      item
        Expanded = False
        FieldName = 'CD_MENSALIDADE'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'PARCELA'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'CODIGOALUNO'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'TURMA'
        Width = 96
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'DATAEMISSAO'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'DATAPAGAMENTO'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'DATAVENCIMENTO'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'DESCONTOEXTRA'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'DS_SITUACAO'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'VALORBRUTO'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'VALOREXTRA'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'VALORPAGO'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'VL_DESCONTO'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'VL_JUROS'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'VL_PERCENTUAL_DESC_EXTRA'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'VL_PERCENTUAL_DESC'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'VL_TOTAL'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'DS_TIPO_TITULO'
        Width = 128
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'DS_HISTORICO'
        Width = 128
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'NOSSONUMERO'
        Width = 96
        Visible = True
      end>
  end
  object pnlBotoes: TPanel
    Left = 0
    Top = 540
    Width = 794
    Height = 31
    Align = alBottom
    BevelOuter = bvNone
    TabOrder = 2
    object bbtnFechar: TBitBtn
      Left = 714
      Top = 3
      Width = 75
      Height = 25
      Caption = 'Fechar'
      TabOrder = 0
      OnClick = bbtnFecharClick
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
  end
  object qryTitulos: TUMZReadOnlyQuery
    Connection = DM.db
    SQL.Strings = (
      'SELECT'
      '  m.ANOSEMESTRE,'
      '  m.BLOQUETO,'
      '  m.CD_AUTENTICACAO,'
      '  m.CD_BOLETO,'
      '  m.CD_BOLSA,'
      '  m.CD_CAIXA,'
      '  m.CD_CENTRO_CUSTO,'
      '  m.CD_CHEQUE_DEVOLVIDO,'
      '  m.CD_COLIGADA,'
      '  m.CD_DESC_CONDICIONAL,'
      '  m.CD_ITEM_PLANO,'
      '  m.CD_MENSALIDADE,'
      '  m.CD_MENSALIDADE_ORIGEM,'
      '  m.CD_MOEDA,'
      '  m.CD_MOEDA_PGTO,'
      '  m.CD_PLANO_CONTA,'
      '  m.CD_RECIBO,'
      '  m.CD_RESP,'
      '  m.CD_RESP_NFSE,'
      '  m.CD_TIPO_TITULO,'
      '  m.CD_USUARIO,'
      '  m.CODIGOALUNO,'
      '  m.CODIGOCARTA,'
      '  m.CURSO,'
      '  m.DATABASECORRECAO,'
      '  m.DATAEMISSAO,'
      '  m.DATAPAGAMENTO,'
      '  m.DATAVENCIMENTO,'
      '  m.DEPTO,'
      '  m.DESCONTOEXTRA,'
      '  m.DS_AUTENTICA_IMPRESSAO,'
      '  m.DS_DEPOSITO,'
      '  m.DS_HISTORICO,'
      '  m.DS_OBS_DESC,'
      '  m.DT_BASE,'
      '  m.DT_COMPETENCIA,'
      '  m.DT_CREDITO,'
      '  m.INDICECORRECAO,'
      '  m.NOSSONUMERO,'
      '  m.NR_CREDITOS,'
      '  m.NR_NF,'
      '  m.OCORRENCIA_REMESSA,'
      '  m.OCORRENCIA_RETORNO,'
      '  m.PARCELA,'
      '  m.SITUACAO,'
      '  m.SN_CREDITO_PARCELA,'
      '  m.SN_LIBERAR_DESCONTOS,'
      '  m.SN_LIBERAR_JUROS,'
      '  m.SN_NFE_GERADA,'
      '  m.SN_TIPO_NOTA,'
      '  m.TIPOPARCELA,'
      '  m.TURMA,'
      '  m.USUARIO,'
      '  m.VALORBRUTO,'
      '  m.VALORDESCONTO,'
      '  m.VALORDESCONTO_FIXO,'
      '  m.VALOREXTRA,'
      '  m.VALORJUROS,'
      '  m.VALORJUROS_FIXO,'
      '  m.VALORPAGO,'
      '  m.VALORTOTAL,'
      '  m.VL_CREDITO,'
      '  m.VL_FATURAMENTO,'
      '  m.VL_PAGO_MOEDA,'
      '  m.VL_PERC_DESC_COND,'
      '  m.VL_PERC_DESC_FIXO,'
      '  m.VL_PERCENTUAL_DIVISAO,'
      '  t.DS_TIPO_TITULO,'
      '  CASE'
      '    WHEN m.BLOQUETO = '#39'S'#39' THEN '#39'X'#39
      '    ELSE '#39#39
      '  END SN_BLOQUETO,'
      '  GET_ACRESCIMOS(m.CD_MENSALIDADE, NULL) VL_JUROS,'
      '  GET_DESCONTOS(m.CD_MENSALIDADE, NULL) VL_DESCONTO,'
      
        '  COALESCE(m.DESCONTOEXTRA, 0) / m.VALORBRUTO * 100 VL_PERCENTUA' +
        'L_DESC_EXTRA,'
      
        '  GET_DESCONTOS(m.CD_MENSALIDADE, NULL) / (m.VALORBRUTO - COALES' +
        'CE(m.DESCONTOEXTRA, 0)) * 100 VL_PERCENTUAL_DESC,'
      '  CASE'
      '    WHEN M.SITUACAO IN (0, 1) THEN'
      '      CASE'
      '        WHEN'
      '          EXISTS ('
      '            SELECT'
      '            '#9'1'
      '            FROM'
      '            '#9'fin_cheques c'
      '            '#9'JOIN fin_cheques_mensalidades cm ON'
      '            '#9#9'(c.CD_CHEQUE = cm.CD_CHEQUE)'
      '            WHERE'
      '            '#9'c.CD_SITUACAO = 0 AND'
      '            '#9'cm.CD_MENSALIDADE = m.CD_MENSALIDADE'
      '          )'
      '        THEN'
      '          CONCAT(s.DS_SIGLA_SITUACAO, '#39'(C)'#39')'
      '        ELSE'
      '          s.DS_SIGLA_SITUACAO'
      '      END'
      '    WHEN'
      '      m.SITUACAO = 2 AND m.DATAVENCIMENTO < CURRENT_DATE'
      '    THEN'
      '      '#39'VENC'#39
      '    ELSE'
      '      s.DS_SIGLA_SITUACAO'
      '  END DS_SITUACAO,'
      '  CASE'
      '    WHEN m.SITUACAO IN (2, 10) OR s.SN_PROTESTO = 1 THEN'
      '      m.VALORBRUTO'
      '      + COALESCE(m.VALOREXTRA, 0)'
      '      - COALESCE(m.DESCONTOEXTRA, 0)'
      '      - GET_DESCONTOS(m.CD_MENSALIDADE, NULL)'
      '      + GET_ACRESCIMOS(m.CD_MENSALIDADE, NULL)'
      '    WHEN m.SITUACAO IN (0, 1, 3) THEN'
      '      m.VALORTOTAL'
      '    ELSE'
      '      m.VALORBRUTO'
      '      + COALESCE(m.VALOREXTRA, 0)'
      '      - COALESCE(m.VALORDESCONTO, 0)'
      '      - COALESCE(m.DESCONTOEXTRA, 0)'
      '      + COALESCE(m.VALORJUROS, 0)'
      '  END VL_TOTAL'
      'FROM'
      '  mensalidades m'
      '    JOIN coligadas c ON'
      '      (m.CD_COLIGADA = c.CD_COLIGADA)'
      '    JOIN fin_config_tipos_titulo t ON'
      '      (m.CD_TIPO_TITULO = t.CD_TIPO_TITULO) AND'
      '      (c.CD_COLIGADA_MATRIZ = t.CD_COLIGADA_MATRIZ)'
      '    JOIN situacoes_financeiras s ON'
      '      (m.situacao = s.cd_situacao)'
      'WHERE'
      '  EXISTS ('
      '    SELECT'
      '      e.CD_ENVIO'
      '    FROM'
      '      rem_envios_mensalidades e'
      '    WHERE'
      '      m.CD_MENSALIDADE = e.CD_MENSALIDADE AND'
      '      e.CD_ENVIO = :CD_ENVIO'
      '  )')
    Params = <
      item
        DataType = ftUnknown
        Name = 'CD_ENVIO'
        ParamType = ptUnknown
      end>
    Left = 128
    Top = 344
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'CD_ENVIO'
        ParamType = ptUnknown
      end>
    object qryTitulosANOSEMESTRE: TSmallintField
      FieldName = 'ANOSEMESTRE'
    end
    object qryTitulosBLOQUETO: TStringField
      FieldName = 'BLOQUETO'
      Size = 1
    end
    object qryTitulosCD_AUTENTICACAO: TStringField
      FieldName = 'CD_AUTENTICACAO'
      Size = 50
    end
    object qryTitulosCD_BOLETO: TLargeintField
      FieldName = 'CD_BOLETO'
    end
    object qryTitulosCD_BOLSA: TIntegerField
      FieldName = 'CD_BOLSA'
    end
    object qryTitulosCD_CAIXA: TIntegerField
      FieldName = 'CD_CAIXA'
    end
    object qryTitulosCD_CENTRO_CUSTO: TLargeintField
      FieldName = 'CD_CENTRO_CUSTO'
      Required = True
    end
    object qryTitulosCD_CHEQUE_DEVOLVIDO: TLargeintField
      FieldName = 'CD_CHEQUE_DEVOLVIDO'
    end
    object qryTitulosCD_COLIGADA: TIntegerField
      FieldName = 'CD_COLIGADA'
      Required = True
    end
    object qryTitulosCD_DESC_CONDICIONAL: TLargeintField
      FieldName = 'CD_DESC_CONDICIONAL'
    end
    object qryTitulosCD_ITEM_PLANO: TLargeintField
      FieldName = 'CD_ITEM_PLANO'
    end
    object qryTitulosCD_MENSALIDADE: TIntegerField
      FieldName = 'CD_MENSALIDADE'
      Required = True
    end
    object qryTitulosCD_MENSALIDADE_ORIGEM: TIntegerField
      FieldName = 'CD_MENSALIDADE_ORIGEM'
    end
    object qryTitulosCD_MOEDA: TLargeintField
      FieldName = 'CD_MOEDA'
    end
    object qryTitulosCD_MOEDA_PGTO: TLargeintField
      FieldName = 'CD_MOEDA_PGTO'
    end
    object qryTitulosCD_PLANO_CONTA: TLargeintField
      FieldName = 'CD_PLANO_CONTA'
      Required = True
    end
    object qryTitulosCD_RECIBO: TIntegerField
      FieldName = 'CD_RECIBO'
    end
    object qryTitulosCD_RESP: TIntegerField
      FieldName = 'CD_RESP'
    end
    object qryTitulosCD_RESP_NFSE: TIntegerField
      FieldName = 'CD_RESP_NFSE'
    end
    object qryTitulosCD_TIPO_TITULO: TSmallintField
      FieldName = 'CD_TIPO_TITULO'
    end
    object qryTitulosCD_USUARIO: TLargeintField
      FieldName = 'CD_USUARIO'
    end
    object qryTitulosCODIGOALUNO: TIntegerField
      FieldName = 'CODIGOALUNO'
    end
    object qryTitulosCODIGOCARTA: TLargeintField
      FieldName = 'CODIGOCARTA'
    end
    object qryTitulosCURSO: TStringField
      FieldName = 'CURSO'
      Size = 15
    end
    object qryTitulosDATABASECORRECAO: TDateTimeField
      FieldName = 'DATABASECORRECAO'
    end
    object qryTitulosDATAEMISSAO: TDateTimeField
      FieldName = 'DATAEMISSAO'
    end
    object qryTitulosDATAPAGAMENTO: TDateTimeField
      FieldName = 'DATAPAGAMENTO'
    end
    object qryTitulosDATAVENCIMENTO: TDateTimeField
      FieldName = 'DATAVENCIMENTO'
    end
    object qryTitulosDEPTO: TSmallintField
      FieldName = 'DEPTO'
    end
    object qryTitulosDESCONTOEXTRA: TFloatField
      FieldName = 'DESCONTOEXTRA'
    end
    object qryTitulosDS_AUTENTICA_IMPRESSAO: TStringField
      FieldName = 'DS_AUTENTICA_IMPRESSAO'
      Size = 50
    end
    object qryTitulosDS_DEPOSITO: TStringField
      FieldName = 'DS_DEPOSITO'
      Size = 50
    end
    object qryTitulosDS_HISTORICO: TStringField
      FieldName = 'DS_HISTORICO'
      Required = True
      Size = 150
    end
    object qryTitulosDS_OBS_DESC: TMemoField
      FieldName = 'DS_OBS_DESC'
      BlobType = ftMemo
    end
    object qryTitulosDT_BASE: TDateTimeField
      FieldName = 'DT_BASE'
      Required = True
    end
    object qryTitulosDT_COMPETENCIA: TDateTimeField
      FieldName = 'DT_COMPETENCIA'
    end
    object qryTitulosDT_CREDITO: TDateTimeField
      FieldName = 'DT_CREDITO'
    end
    object qryTitulosINDICECORRECAO: TFloatField
      FieldName = 'INDICECORRECAO'
    end
    object qryTitulosNOSSONUMERO: TStringField
      FieldName = 'NOSSONUMERO'
      Size = 30
    end
    object qryTitulosNR_CREDITOS: TFloatField
      FieldName = 'NR_CREDITOS'
    end
    object qryTitulosNR_NF: TLargeintField
      FieldName = 'NR_NF'
    end
    object qryTitulosOCORRENCIA_REMESSA: TSmallintField
      FieldName = 'OCORRENCIA_REMESSA'
    end
    object qryTitulosOCORRENCIA_RETORNO: TIntegerField
      FieldName = 'OCORRENCIA_RETORNO'
    end
    object qryTitulosPARCELA: TSmallintField
      FieldName = 'PARCELA'
    end
    object qryTitulosSITUACAO: TSmallintField
      FieldName = 'SITUACAO'
    end
    object qryTitulosSN_CREDITO_PARCELA: TStringField
      FieldName = 'SN_CREDITO_PARCELA'
      Size = 1
    end
    object qryTitulosSN_LIBERAR_DESCONTOS: TSmallintField
      FieldName = 'SN_LIBERAR_DESCONTOS'
      Required = True
    end
    object qryTitulosSN_LIBERAR_JUROS: TSmallintField
      FieldName = 'SN_LIBERAR_JUROS'
      Required = True
    end
    object qryTitulosSN_NFE_GERADA: TSmallintField
      FieldName = 'SN_NFE_GERADA'
    end
    object qryTitulosSN_TIPO_NOTA: TSmallintField
      FieldName = 'SN_TIPO_NOTA'
    end
    object qryTitulosTIPOPARCELA: TSmallintField
      FieldName = 'TIPOPARCELA'
    end
    object qryTitulosTURMA: TStringField
      FieldName = 'TURMA'
      Required = True
      Size = 50
    end
    object qryTitulosUSUARIO: TStringField
      FieldName = 'USUARIO'
      Size = 30
    end
    object qryTitulosVALORBRUTO: TFloatField
      FieldName = 'VALORBRUTO'
    end
    object qryTitulosVALORDESCONTO: TFloatField
      FieldName = 'VALORDESCONTO'
    end
    object qryTitulosVALORDESCONTO_FIXO: TFloatField
      FieldName = 'VALORDESCONTO_FIXO'
    end
    object qryTitulosVALOREXTRA: TFloatField
      FieldName = 'VALOREXTRA'
    end
    object qryTitulosVALORJUROS: TFloatField
      FieldName = 'VALORJUROS'
    end
    object qryTitulosVALORJUROS_FIXO: TFloatField
      FieldName = 'VALORJUROS_FIXO'
    end
    object qryTitulosVALORPAGO: TFloatField
      FieldName = 'VALORPAGO'
    end
    object qryTitulosVALORTOTAL: TFloatField
      FieldName = 'VALORTOTAL'
    end
    object qryTitulosVL_CREDITO: TFloatField
      FieldName = 'VL_CREDITO'
    end
    object qryTitulosVL_FATURAMENTO: TFloatField
      FieldName = 'VL_FATURAMENTO'
    end
    object qryTitulosVL_PAGO_MOEDA: TFloatField
      FieldName = 'VL_PAGO_MOEDA'
    end
    object qryTitulosVL_PERC_DESC_COND: TFloatField
      FieldName = 'VL_PERC_DESC_COND'
    end
    object qryTitulosVL_PERC_DESC_FIXO: TFloatField
      FieldName = 'VL_PERC_DESC_FIXO'
    end
    object qryTitulosVL_PERCENTUAL_DIVISAO: TFloatField
      FieldName = 'VL_PERCENTUAL_DIVISAO'
      Required = True
    end
    object qryTitulosDS_TIPO_TITULO: TStringField
      FieldName = 'DS_TIPO_TITULO'
      Size = 255
    end
    object qryTitulosDS_SITUACAO: TStringField
      FieldName = 'DS_SITUACAO'
      ReadOnly = True
      Size = 13
    end
    object qryTitulosSN_BLOQUETO: TStringField
      FieldName = 'SN_BLOQUETO'
      ReadOnly = True
      Size = 1
    end
    object qryTitulosVL_JUROS: TFloatField
      FieldName = 'VL_JUROS'
      ReadOnly = True
    end
    object qryTitulosVL_DESCONTO: TFloatField
      FieldName = 'VL_DESCONTO'
      ReadOnly = True
    end
    object qryTitulosVL_PERCENTUAL_DESC_EXTRA: TFloatField
      FieldName = 'VL_PERCENTUAL_DESC_EXTRA'
      ReadOnly = True
    end
    object qryTitulosVL_PERCENTUAL_DESC: TFloatField
      FieldName = 'VL_PERCENTUAL_DESC'
      ReadOnly = True
    end
    object qryTitulosVL_TOTAL: TFloatField
      FieldName = 'VL_TOTAL'
      ReadOnly = True
    end
  end
  object dspTitulos: TDataSetProvider
    DataSet = qryTitulos
    Left = 160
    Top = 344
  end
  object cdsTitulos: TClientDataSet
    Aggregates = <>
    Params = <
      item
        DataType = ftUnknown
        Name = 'CD_ENVIO'
        ParamType = ptUnknown
      end>
    ProviderName = 'dspTitulos'
    Left = 192
    Top = 344
    object cdsTitulosANOSEMESTRE: TSmallintField
      Tag = 1
      DisplayLabel = 'Ano/Sem.'
      FieldName = 'ANOSEMESTRE'
      DisplayFormat = '0000/0'
    end
    object cdsTitulosBLOQUETO: TStringField
      FieldName = 'BLOQUETO'
      Size = 1
    end
    object cdsTitulosCD_AUTENTICACAO: TStringField
      Tag = 1
      DisplayLabel = 'C'#243'd. Autentica'#231#227'o'
      FieldName = 'CD_AUTENTICACAO'
      Size = 50
    end
    object cdsTitulosCD_BOLETO: TLargeintField
      FieldName = 'CD_BOLETO'
    end
    object cdsTitulosCD_BOLSA: TIntegerField
      FieldName = 'CD_BOLSA'
    end
    object cdsTitulosCD_CAIXA: TIntegerField
      FieldName = 'CD_CAIXA'
    end
    object cdsTitulosCD_CENTRO_CUSTO: TLargeintField
      FieldName = 'CD_CENTRO_CUSTO'
      Required = True
    end
    object cdsTitulosCD_CHEQUE_DEVOLVIDO: TLargeintField
      FieldName = 'CD_CHEQUE_DEVOLVIDO'
    end
    object cdsTitulosCD_COLIGADA: TIntegerField
      Tag = 1
      DisplayLabel = 'U.E.'
      FieldName = 'CD_COLIGADA'
      Required = True
    end
    object cdsTitulosCD_DESC_CONDICIONAL: TLargeintField
      FieldName = 'CD_DESC_CONDICIONAL'
    end
    object cdsTitulosCD_ITEM_PLANO: TLargeintField
      FieldName = 'CD_ITEM_PLANO'
    end
    object cdsTitulosCD_MENSALIDADE: TIntegerField
      Tag = 1
      DisplayLabel = 'C'#243'd. T'#237'tulo'
      FieldName = 'CD_MENSALIDADE'
      Required = True
    end
    object cdsTitulosCD_MENSALIDADE_ORIGEM: TIntegerField
      FieldName = 'CD_MENSALIDADE_ORIGEM'
    end
    object cdsTitulosCD_MOEDA: TLargeintField
      FieldName = 'CD_MOEDA'
    end
    object cdsTitulosCD_MOEDA_PGTO: TLargeintField
      FieldName = 'CD_MOEDA_PGTO'
    end
    object cdsTitulosCD_PLANO_CONTA: TLargeintField
      FieldName = 'CD_PLANO_CONTA'
      Required = True
    end
    object cdsTitulosCD_RECIBO: TIntegerField
      FieldName = 'CD_RECIBO'
    end
    object cdsTitulosCD_RESP: TIntegerField
      FieldName = 'CD_RESP'
    end
    object cdsTitulosCD_RESP_NFSE: TIntegerField
      FieldName = 'CD_RESP_NFSE'
    end
    object cdsTitulosCD_TIPO_TITULO: TSmallintField
      FieldName = 'CD_TIPO_TITULO'
    end
    object cdsTitulosCD_USUARIO: TLargeintField
      FieldName = 'CD_USUARIO'
    end
    object cdsTitulosCODIGOALUNO: TIntegerField
      Tag = 1
      DisplayLabel = 'C'#243'd.'
      FieldName = 'CODIGOALUNO'
    end
    object cdsTitulosCODIGOCARTA: TLargeintField
      FieldName = 'CODIGOCARTA'
    end
    object cdsTitulosCURSO: TStringField
      Tag = 1
      DisplayLabel = 'C'#243'd. Curso'
      FieldName = 'CURSO'
      Size = 15
    end
    object cdsTitulosDATABASECORRECAO: TDateTimeField
      FieldName = 'DATABASECORRECAO'
    end
    object cdsTitulosDATAEMISSAO: TDateTimeField
      Tag = 1
      DisplayLabel = 'Emiss'#227'o'
      FieldName = 'DATAEMISSAO'
      DisplayFormat = 'dd/mm/yyyy'
    end
    object cdsTitulosDATAPAGAMENTO: TDateTimeField
      Tag = 1
      DisplayLabel = 'Pagto.'
      FieldName = 'DATAPAGAMENTO'
      DisplayFormat = 'dd/mm/yyyy'
    end
    object cdsTitulosDATAVENCIMENTO: TDateTimeField
      Tag = 1
      DisplayLabel = 'Vencimento'
      FieldName = 'DATAVENCIMENTO'
      DisplayFormat = 'dd/mm/yyyy'
    end
    object cdsTitulosDEPTO: TSmallintField
      Tag = 1
      DisplayLabel = 'Depto.'
      FieldName = 'DEPTO'
    end
    object cdsTitulosDESCONTOEXTRA: TFloatField
      Tag = 1
      DisplayLabel = 'Desc. Extra'
      FieldName = 'DESCONTOEXTRA'
      DisplayFormat = '###,###,##0.00'
    end
    object cdsTitulosDS_AUTENTICA_IMPRESSAO: TStringField
      FieldName = 'DS_AUTENTICA_IMPRESSAO'
      Size = 50
    end
    object cdsTitulosDS_DEPOSITO: TStringField
      DisplayWidth = 30
      FieldName = 'DS_DEPOSITO'
      Size = 50
    end
    object cdsTitulosDS_HISTORICO: TStringField
      Tag = 1
      DisplayLabel = 'Hist'#243'rico'
      DisplayWidth = 30
      FieldName = 'DS_HISTORICO'
      Required = True
      Size = 150
    end
    object cdsTitulosDS_OBS_DESC: TMemoField
      FieldName = 'DS_OBS_DESC'
      BlobType = ftMemo
    end
    object cdsTitulosDT_BASE: TDateTimeField
      FieldName = 'DT_BASE'
      Required = True
    end
    object cdsTitulosDT_COMPETENCIA: TDateTimeField
      Tag = 1
      DisplayLabel = 'Compet'#234'ncia'
      FieldName = 'DT_COMPETENCIA'
      DisplayFormat = 'dd/mm/yyyy'
    end
    object cdsTitulosDT_CREDITO: TDateTimeField
      Tag = 1
      DisplayLabel = 'Dt. Cr'#233'dito'
      FieldName = 'DT_CREDITO'
      DisplayFormat = 'dd/mm/yyyy'
    end
    object cdsTitulosINDICECORRECAO: TFloatField
      FieldName = 'INDICECORRECAO'
    end
    object cdsTitulosNOSSONUMERO: TStringField
      Tag = 1
      DisplayLabel = 'Nosso N'#250'm.'
      FieldName = 'NOSSONUMERO'
      Size = 30
    end
    object cdsTitulosNR_CREDITOS: TFloatField
      Tag = 1
      DisplayLabel = 'N'#186' CR.'
      FieldName = 'NR_CREDITOS'
    end
    object cdsTitulosNR_NF: TLargeintField
      Tag = 1
      DisplayLabel = 'NF'
      FieldName = 'NR_NF'
    end
    object cdsTitulosOCORRENCIA_REMESSA: TSmallintField
      FieldName = 'OCORRENCIA_REMESSA'
    end
    object cdsTitulosOCORRENCIA_RETORNO: TIntegerField
      FieldName = 'OCORRENCIA_RETORNO'
    end
    object cdsTitulosPARCELA: TSmallintField
      Tag = 1
      DisplayLabel = 'Parc.'
      FieldName = 'PARCELA'
    end
    object cdsTitulosSITUACAO: TSmallintField
      FieldName = 'SITUACAO'
    end
    object cdsTitulosSN_CREDITO_PARCELA: TStringField
      Tag = 1
      DisplayLabel = 'CR'
      FieldName = 'SN_CREDITO_PARCELA'
      Size = 1
    end
    object cdsTitulosSN_LIBERAR_DESCONTOS: TSmallintField
      Tag = 1
      DisplayLabel = 'Conc. Desc.'
      FieldName = 'SN_LIBERAR_DESCONTOS'
      Required = True
    end
    object cdsTitulosSN_LIBERAR_JUROS: TSmallintField
      Tag = 1
      DisplayLabel = 'Lib. Juros'
      FieldName = 'SN_LIBERAR_JUROS'
      Required = True
    end
    object cdsTitulosSN_NFE_GERADA: TSmallintField
      FieldName = 'SN_NFE_GERADA'
    end
    object cdsTitulosSN_TIPO_NOTA: TSmallintField
      FieldName = 'SN_TIPO_NOTA'
    end
    object cdsTitulosTIPOPARCELA: TSmallintField
      Tag = 1
      DisplayLabel = 'Tipo Parc.'
      FieldName = 'TIPOPARCELA'
    end
    object cdsTitulosTURMA: TStringField
      Tag = 1
      DisplayLabel = 'C'#243'd. Turma'
      DisplayWidth = 30
      FieldName = 'TURMA'
      Required = True
      Size = 50
    end
    object cdsTitulosUSUARIO: TStringField
      Tag = 1
      DisplayLabel = 'Usu'#225'rio'
      FieldName = 'USUARIO'
      Size = 30
    end
    object cdsTitulosVALORBRUTO: TFloatField
      Tag = 1
      DisplayLabel = 'Vl. Bruto'
      FieldName = 'VALORBRUTO'
      DisplayFormat = '###,###,##0.00'
    end
    object cdsTitulosVALORDESCONTO: TFloatField
      Tag = 1
      DisplayLabel = 'Vl. Desc.'
      FieldName = 'VALORDESCONTO'
      DisplayFormat = '###,###,##0.00'
    end
    object cdsTitulosVALORDESCONTO_FIXO: TFloatField
      FieldName = 'VALORDESCONTO_FIXO'
    end
    object cdsTitulosVALOREXTRA: TFloatField
      Tag = 1
      DisplayLabel = 'Vl. Extra'
      FieldName = 'VALOREXTRA'
      DisplayFormat = '###,###,##0.00'
    end
    object cdsTitulosVALORJUROS: TFloatField
      FieldName = 'VALORJUROS'
    end
    object cdsTitulosVALORJUROS_FIXO: TFloatField
      FieldName = 'VALORJUROS_FIXO'
    end
    object cdsTitulosVALORPAGO: TFloatField
      Tag = 1
      DisplayLabel = 'Vl. Pago'
      FieldName = 'VALORPAGO'
      DisplayFormat = '###,###,##0.00'
    end
    object cdsTitulosVALORTOTAL: TFloatField
      FieldName = 'VALORTOTAL'
    end
    object cdsTitulosVL_CREDITO: TFloatField
      Tag = 1
      DisplayLabel = 'Vl. Cr'#233'dito'
      FieldName = 'VL_CREDITO'
      DisplayFormat = '###,###,##0.00'
    end
    object cdsTitulosVL_FATURAMENTO: TFloatField
      FieldName = 'VL_FATURAMENTO'
    end
    object cdsTitulosVL_PAGO_MOEDA: TFloatField
      Tag = 1
      DisplayLabel = 'Vl.Moeda Pgto'
      FieldName = 'VL_PAGO_MOEDA'
      DisplayFormat = '###,###,##0.00'
    end
    object cdsTitulosVL_PERC_DESC_COND: TFloatField
      FieldName = 'VL_PERC_DESC_COND'
    end
    object cdsTitulosVL_PERC_DESC_FIXO: TFloatField
      FieldName = 'VL_PERC_DESC_FIXO'
    end
    object cdsTitulosVL_PERCENTUAL_DIVISAO: TFloatField
      FieldName = 'VL_PERCENTUAL_DIVISAO'
      Required = True
    end
    object cdsTitulosDS_TIPO_TITULO: TStringField
      Tag = 1
      DisplayLabel = 'Tipo Tit.'
      DisplayWidth = 30
      FieldName = 'DS_TIPO_TITULO'
      Size = 255
    end
    object cdsTitulosDS_SITUACAO: TStringField
      Tag = 1
      DisplayLabel = 'Sit.'
      FieldName = 'DS_SITUACAO'
      ReadOnly = True
      Size = 13
    end
    object cdsTitulosSN_BLOQUETO: TStringField
      Tag = 1
      DisplayLabel = 'Bloq.'
      FieldName = 'SN_BLOQUETO'
      ReadOnly = True
      Size = 1
    end
    object cdsTitulosVL_JUROS: TFloatField
      Tag = 1
      DisplayLabel = 'Vl. Juros'
      FieldName = 'VL_JUROS'
      ReadOnly = True
      DisplayFormat = '###,###,##0.00'
    end
    object cdsTitulosVL_DESCONTO: TFloatField
      Tag = 1
      DisplayLabel = 'Desc. Cond.'
      FieldName = 'VL_DESCONTO'
      ReadOnly = True
      DisplayFormat = '###,###,##0.00'
    end
    object cdsTitulosVL_PERCENTUAL_DESC_EXTRA: TFloatField
      Tag = 1
      DisplayLabel = '% Desc. Fixo'
      FieldName = 'VL_PERCENTUAL_DESC_EXTRA'
      ReadOnly = True
      DisplayFormat = '##0.00 %'
    end
    object cdsTitulosVL_PERCENTUAL_DESC: TFloatField
      Tag = 1
      DisplayLabel = '% Desc. Cond.'
      FieldName = 'VL_PERCENTUAL_DESC'
      ReadOnly = True
      DisplayFormat = '##0.00 %'
    end
    object cdsTitulosVL_TOTAL: TFloatField
      Tag = 1
      DisplayLabel = 'Vl. Total'
      FieldName = 'VL_TOTAL'
      ReadOnly = True
      DisplayFormat = '###,###,##0.00'
    end
  end
  object dsTitulos: TDataSource
    DataSet = cdsTitulos
    Left = 224
    Top = 344
  end
end
