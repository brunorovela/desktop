object fNFSeWS: TfNFSeWS
  Left = 0
  Top = 0
  Caption = 'Nota Fiscal de Servi'#231'os Eletr'#244'nica'
  ClientHeight = 562
  ClientWidth = 784
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  FormStyle = fsMDIChild
  KeyPreview = True
  OldCreateOrder = False
  Visible = True
  WindowState = wsMaximized
  OnClose = FormClose
  OnCreate = FormCreate
  OnKeyDown = FormKeyDown
  PixelsPerInch = 96
  TextHeight = 13
  object qryWebServices: TUMZQuery
    Connection = DM.db
    SQL.Strings = (
      'SELECT'
      '   CD_SERVICO,'
      '   NM_SERVICO,'
      '   DS_REQUEST_URL'
      'FROM'
      '   FIN_NFSE_WS_SERVICO')
    Params = <>
    Left = 16
    Top = 8
    object qryWebServicesCD_SERVICO: TSmallintField
      FieldName = 'CD_SERVICO'
    end
    object qryWebServicesNM_SERVICO: TStringField
      FieldName = 'NM_SERVICO'
      Size = 35
    end
    object qryWebServicesDS_REQUEST_URL: TStringField
      FieldName = 'DS_REQUEST_URL'
      Size = 255
    end
  end
  object qryInsereMsg: TUMZQuery
    Connection = DM.db
    SQL.Strings = (
      'INSERT INTO FIN_NFSE_WS_RETORNO'
      
        '   (CD_LOTE, CD_SERVICO, DT_CONSULTA, DS_CODIGO, DS_MENSAGEM, DS' +
        '_CORRECAO)'
      'VALUES'
      
        '   (:CD_LOTE, :CD_SERVICO, :DT_CONSULTA, :DS_CODIGO, :DS_MENSAGE' +
        'M, :DS_CORRECAO)')
    Params = <
      item
        DataType = ftUnknown
        Name = 'CD_LOTE'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'CD_SERVICO'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'DT_CONSULTA'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'DS_CODIGO'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'DS_MENSAGEM'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'DS_CORRECAO'
        ParamType = ptUnknown
      end>
    Left = 80
    Top = 8
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'CD_LOTE'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'CD_SERVICO'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'DT_CONSULTA'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'DS_CODIGO'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'DS_MENSAGEM'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'DS_CORRECAO'
        ParamType = ptUnknown
      end>
  end
  object qryInsereConsulta: TUMZQuery
    Connection = DM.db
    SQL.Strings = (
      'INSERT INTO FIN_NFSE_WS_CONSULTA'
      '   (CD_LOTE, CD_SERVICO, DT_CONSULTA)'
      'VALUES'
      '   (:CD_LOTE, :CD_SERVICO, :DT_CONSULTA)')
    Params = <
      item
        DataType = ftUnknown
        Name = 'CD_LOTE'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'CD_SERVICO'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'DT_CONSULTA'
        ParamType = ptUnknown
      end>
    Left = 48
    Top = 8
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'CD_LOTE'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'CD_SERVICO'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'DT_CONSULTA'
        ParamType = ptUnknown
      end>
  end
  object qryVariaveis: TUMZQuery
    Connection = DM.db
    SQL.Strings = (
      'SELECT'
      '   NM_VARIAVEL,'
      '   DS_VALOR'
      'FROM'
      '   FIN_NFSE_RPS_VARIAVEIS')
    Params = <>
    Left = 112
    Top = 8
    object qryVariaveisNM_VARIAVEL: TStringField
      FieldName = 'NM_VARIAVEL'
      FixedChar = True
      Size = 30
    end
    object qryVariaveisDS_VALOR: TStringField
      FieldName = 'DS_VALOR'
      Size = 100
    end
  end
  object HTTPReqResp: THTTPReqResp
    InvokeOptions = [soIgnoreInvalidCerts, soAutoCheckAccessPointViaUDDI]
    Left = 144
    Top = 48
  end
  object XMLSendReq: TXMLDocument
    Active = True
    NodeIndentStr = #9
    Left = 16
    Top = 48
    DOMVendorDesc = 'MSXML'
  end
  object XMLSendResp: TXMLDocument
    Active = True
    NodeIndentStr = #9
    Options = [doNodeAutoIndent]
    ParseOptions = [poPreserveWhiteSpace]
    Left = 48
    Top = 48
    DOMVendorDesc = 'MSXML'
  end
  object qryInsereLote: TUMZQuery
    Connection = DM.db
    SQL.Strings = (
      'INSERT INTO FIN_NFSE_WS_LOTE'
      
        '   (CD_LOTE, NR_LOTE, NR_PROTOCOLO, DT_RECEBIMENTO, DT_ENVIO, DT' +
        '_CRIACAO)'
      'VALUES'
      
        '   (:CD_LOTE, :NR_LOTE, :NR_PROTOCOLO, :DT_RECEBIMENTO, NOW(), N' +
        'OW())')
    Params = <
      item
        DataType = ftUnknown
        Name = 'CD_LOTE'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'NR_LOTE'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'NR_PROTOCOLO'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'DT_RECEBIMENTO'
        ParamType = ptUnknown
      end>
    Left = 144
    Top = 8
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'CD_LOTE'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'NR_LOTE'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'NR_PROTOCOLO'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'DT_RECEBIMENTO'
        ParamType = ptUnknown
      end>
  end
  object qryAtuTitulos: TUMZQuery
    Connection = DM.db
    Params = <>
    Left = 176
    Top = 8
  end
  object qryTitulos: TUMZQuery
    Connection = DM.db
    SQL.Strings = (
      'SELECT'
      '   M.CODIGOALUNO,'
      '   M.TURMA,'
      '   M.CURSO,'
      '   M.CD_MENSALIDADE,'
      '   M.CD_TIPO_TITULO,'
      '   M.DESCONTOEXTRA ValorDeducoes,'
      '   M.VALORPAGO,'
      '   A.NM_PESSOA RazaoSocial,'
      '   M.DS_HISTORICO Discriminacao,'
      '   M.VALORBRUTO + M.VALOREXTRA ValorServicos,'
      
        '   M.VALORBRUTO + M.VALOREXTRA - M.DESCONTOEXTRA ValorLiquidoNfs' +
        'e,'
      '   M.DESCONTOEXTRA DescontoIncondicionado,'
      '   M.VALORDESCONTO DescontoCondicionado,'
      '   CONCAT(L.DS_LOGRADOURO, '#39' '#39', P.DS_LOGRADOURO) Endereco,'
      '   P.DS_LOGRADOURO_NRO Numero,'
      '   P.DS_COMPLEMENTO Complemento,'
      '   P.DS_BAIRRO Bairro,'
      '   N.CH_MUNICIPIO CodigoMunicipio,'
      '   P.DS_ESTADO Uf,'
      '   P.DS_CEP Cep,'
      '   IF(P.TP_PESSOA = '#39'J'#39', P.DS_CNPJ, '#39#39') Cnpj,'
      '   IF(P.TP_PESSOA = '#39'F'#39', P.DS_CPF, '#39#39') Cpf,'
      '   P.TP_PESSOA TipoPessoa,'
      '   TEL.DS_CONTATO Telefone,'
      '   EMAIL.DS_CONTATO Email'
      'FROM'
      '   MENSALIDADES M'
      '      JOIN PESSOAS A ON'
      '         (M.CODIGOALUNO = A.CD_PESSOA)'
      '      JOIN PESSOAS P ON'
      '         (M.CD_RESP = P.CD_PESSOA)'
      '         LEFT JOIN CONTATOS_PESSOAS TEL ON'
      '            (P.CD_PESSOA = TEl.CD_PESSOA) AND'
      '            (TEL.CD_CONTATO = 1)'
      '         LEFT JOIN CONTATOS_PESSOAS EMAIL ON'
      '            (P.CD_PESSOA = EMAIL.CD_PESSOA) AND'
      '            (EMAIL.CD_CONTATO = 4)'
      '         LEFT JOIN MUNICIPIOS N ON'
      '            (P.CD_MUNICIPIO = N.CD_MUNICIPIO)'
      '         LEFT JOIN LOGRADOUROS L ON'
      '            (P.CD_LOGRADOURO = L.CD_LOGRADOURO)'
      '         LEFT JOIN ESTADOS E ON'
      '            (P.DS_ESTADO = E.DS_UF)'
      '      LEFT JOIN fin_tipos_titulo TP ON'
      '         (M.CD_TIPO_TITULO = TP.CD_TIPO_TITULO)'
      '      LEFT JOIN CURSOS C ON'
      '         (M.CURSO = C.CODIGO) AND'
      '         (M.ANOSEMESTRE = C.ANOSEMESTRE)'
      'WHERE'
      '   (M.NR_NF IS NULL OR M.NR_NF = 0)'
      'GROUP BY'
      '   M.CD_MENSALIDADE'
      'HAVING'
      '   ValorServicos > 0'
      'ORDER BY'
      '   A.NM_PESSOA')
    Params = <>
    Left = 208
    Top = 8
    object qryTitulosCODIGOALUNO: TIntegerField
      FieldName = 'CODIGOALUNO'
    end
    object qryTitulosTURMA: TStringField
      FieldName = 'TURMA'
      Size = 50
    end
    object qryTitulosCURSO: TStringField
      FieldName = 'CURSO'
      Size = 15
    end
    object qryTitulosCD_MENSALIDADE: TIntegerField
      FieldName = 'CD_MENSALIDADE'
    end
    object qryTitulosCD_TIPO_TITULO: TSmallintField
      FieldName = 'CD_TIPO_TITULO'
    end
    object qryTitulosValorDeducoes: TFloatField
      FieldName = 'ValorDeducoes'
    end
    object qryTitulosVALORPAGO: TFloatField
      FieldName = 'VALORPAGO'
    end
    object qryTitulosRazaoSocial: TStringField
      FieldName = 'RazaoSocial'
      Size = 60
    end
    object qryTitulosDiscriminacao: TStringField
      FieldName = 'Discriminacao'
      Size = 150
    end
    object qryTitulosValorServicos: TFloatField
      FieldName = 'ValorServicos'
    end
    object qryTitulosValorLiquidoNfse: TFloatField
      FieldName = 'ValorLiquidoNfse'
    end
    object qryTitulosDescontoIncondicionado: TFloatField
      FieldName = 'DescontoIncondicionado'
    end
    object qryTitulosDescontoCondicionado: TFloatField
      FieldName = 'DescontoCondicionado'
    end
    object qryTitulosNumero: TStringField
      FieldName = 'Numero'
      Size = 10
    end
    object qryTitulosComplemento: TStringField
      FieldName = 'Complemento'
      Size = 150
    end
    object qryTitulosBairro: TStringField
      FieldName = 'Bairro'
      Size = 50
    end
    object qryTitulosCodigoMunicipio: TLargeintField
      FieldName = 'CodigoMunicipio'
    end
    object qryTitulosEndereco: TStringField
      FieldName = 'Endereco'
    end
    object qryTitulosUf: TStringField
      FieldName = 'Uf'
      FixedChar = True
      Size = 2
    end
    object qryTitulosCep: TStringField
      FieldName = 'Cep'
      Size = 8
    end
    object qryTitulosCnpj: TStringField
      FieldName = 'Cnpj'
      Size = 14
    end
    object qryTitulosCpf: TStringField
      FieldName = 'Cpf'
      Size = 11
    end
    object qryTitulosTipoPessoa: TStringField
      FieldName = 'TipoPessoa'
      FixedChar = True
      Size = 1
    end
    object qryTitulosTelefone: TStringField
      FieldName = 'Telefone'
      Size = 100
    end
    object qryTitulosEmail: TStringField
      FieldName = 'Email'
      Size = 100
    end
  end
  object XMLQueryReq: TXMLDocument
    Active = True
    NodeIndentStr = #9
    Options = [doNodeAutoIndent]
    ParseOptions = [poPreserveWhiteSpace]
    XML.Strings = (
      '<?xml version="1.0"?>'
      
        '<soapenv:Envelope xmlns:soapenv="http://schemas.xmlsoap.org/soap' +
        '/envelope/">'
      #9'<soapenv:Header/>'
      #9'<soapenv:Body>'
      
        #9#9'<e:ConsultarSituacaoLoteRpsEnvio xmlns:e="http://www.betha.com' +
        '.br/e-nota-contribuinte-ws">'
      #9#9#9'<Prestador>'
      #9#9#9#9'<Cnpj/>'
      #9#9#9'</Prestador>'
      #9#9#9'<Protocolo/>'
      #9#9'</e:ConsultarSituacaoLoteRpsEnvio>'
      #9'</soapenv:Body>'
      '</soapenv:Envelope>')
    Left = 80
    Top = 48
    DOMVendorDesc = 'MSXML'
  end
  object XMLQueryResp: TXMLDocument
    Active = True
    NodeIndentStr = #9
    Options = [doNodeAutoIndent]
    ParseOptions = [poPreserveWhiteSpace]
    Left = 112
    Top = 48
    DOMVendorDesc = 'MSXML'
  end
  object qryConsulta: TUMZQuery
    Connection = DM.db
    SQL.Strings = (
      'SELECT'
      '   CD_CONSULTA,'
      '   NM_CONSULTA,'
      '   TX_CONSULTA'
      'FROM'
      '   FIN_NFSE_CONSULTA')
    Params = <>
    Left = 240
    Top = 8
    object qryConsultaCD_CONSULTA: TSmallintField
      FieldName = 'CD_CONSULTA'
      Origin = 'WMESTRE12.FIN_NFSE_CONSULTA.CD_CONSULTA'
    end
    object qryConsultaNM_CONSULTA: TStringField
      FieldName = 'NM_CONSULTA'
      Origin = 'WMESTRE12.FIN_NFSE_CONSULTA.NM_CONSULTA'
      FixedChar = True
      Size = 50
    end
    object qryConsultaTX_CONSULTA: TMemoField
      FieldName = 'TX_CONSULTA'
      Origin = 'WMESTRE12.FIN_NFSE_CONSULTA.TX_CONSULTA'
      BlobType = ftMemo
      Size = 1
    end
  end
end
