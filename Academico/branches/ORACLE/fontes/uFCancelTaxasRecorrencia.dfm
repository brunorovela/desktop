object fCancelTaxasRecorrencia: TfCancelTaxasRecorrencia
  Left = 0
  Top = 0
  BorderStyle = bsDialog
  Caption = 'Cancelamento de Taxas de Exame de 2'#170' '#201'poca'
  ClientHeight = 349
  ClientWidth = 464
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  KeyPreview = True
  OldCreateOrder = False
  Position = poScreenCenter
  OnClose = FormClose
  OnCreate = FormCreate
  OnKeyDown = FormKeyDown
  PixelsPerInch = 96
  TextHeight = 13
  object bvlSep1: TBevel
    Left = 0
    Top = 22
    Width = 464
    Height = 3
    Align = alTop
    Shape = bsSpacer
    ExplicitWidth = 590
  end
  object lblAcaoMovimento: TLabel
    Left = 8
    Top = 31
    Width = 98
    Height = 13
    Caption = 'A'#231#227'o do Movimento:'
  end
  object lblObservacoes: TLabel
    Left = 8
    Top = 88
    Width = 374
    Height = 13
    Caption = 
      'Oberva'#231#245'es (as observa'#231#245'es ser'#227'o armazenadas na parcela e na tes' +
      'ouraria):'
  end
  object bvlSep2: TBevel
    Left = 0
    Top = 323
    Width = 464
    Height = 3
    Align = alBottom
    Shape = bsSpacer
    ExplicitTop = 329
    ExplicitWidth = 594
  end
  object lblStatus: TLabel
    Left = 8
    Top = 268
    Width = 179
    Height = 13
    Caption = 'Cancelando parcelas. Aguarde...'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clRed
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
    Visible = False
  end
  object pnlTitulo: TPanel
    Left = 0
    Top = 0
    Width = 464
    Height = 22
    Align = alTop
    BevelOuter = bvLowered
    Caption = 'CANCELAMENTO DE TAXAS DE EXAME DE 2'#170' '#201'POCA'
    Color = clBlue
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindow
    Font.Height = -13
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 0
  end
  object memObservacoes: TMemo
    Left = 0
    Top = 107
    Width = 441
    Height = 155
    ScrollBars = ssVertical
    TabOrder = 1
  end
  object tlbAcoes: TToolBar
    Left = 0
    Top = 326
    Width = 464
    Height = 23
    Align = alBottom
    ButtonWidth = 89
    Images = ilImagens
    List = True
    ShowCaptions = True
    TabOrder = 2
    object btnSep1: TToolButton
      Left = 0
      Top = 0
      Width = 8
      Style = tbsSeparator
    end
    object btnConfirmar: TToolButton
      Left = 8
      Top = 0
      Caption = 'F5 Confirmar'
      Enabled = False
      ImageIndex = 2
      OnClick = btnConfirmarClick
    end
    object btnSep2: TToolButton
      Left = 97
      Top = 0
      Width = 8
      ImageIndex = 1
      Style = tbsSeparator
    end
    object btnSair: TToolButton
      Left = 105
      Top = 0
      Caption = 'F12 Sair'
      ImageIndex = 0
      OnClick = btnSairClick
    end
    object btnSep3: TToolButton
      Left = 194
      Top = 0
      Width = 8
      ImageIndex = 2
      Style = tbsSeparator
    end
  end
  object prbStatus: TProgressBar
    Left = 8
    Top = 287
    Width = 441
    Height = 30
    Step = 1
    TabOrder = 3
    Visible = False
  end
  object cbAcoesMovimento: TComboBox
    Left = 8
    Top = 50
    Width = 441
    Height = 22
    Style = csOwnerDrawFixed
    ItemHeight = 16
    TabOrder = 4
    OnSelect = cbAcoesMovimentoSelect
  end
  object qryAcoesMovimento: TUMZQuery
    Connection = DM.db
    AfterOpen = qryAcoesMovimentoAfterOpen
    SQL.Strings = (
      'SELECT'
      '   cd_acao,'
      '   ds_acao,'
      '   cd_tipo_acao,'
      '   cd_movimento_caixa,'
      '   sn_ativo,'
      '   cd_origem,'
      '   tp_entrada_saida,'
      '   cd_movimento_estorno,'
      '   cd_acao_automatica,'
      '   cd_plano_conta'
      'FROM'
      '   fin_acoes_movimento'
      'WHERE'
      '   cd_tipo_acao = 2 AND'
      '   cd_origem = 1 AND'
      '   sn_ativo = '#39'S'#39
      'ORDER BY'
      '   ds_acao')
    Params = <>
    Left = 344
    Top = 56
    object qryAcoesMovimentods_acao: TStringField
      FieldName = 'ds_acao'
      Origin = 'WMESTRE12.fin_acoes_movimento.ds_acao'
      Size = 255
    end
    object qryAcoesMovimentocd_tipo_acao: TSmallintField
      FieldName = 'cd_tipo_acao'
      Origin = 'WMESTRE12.fin_acoes_movimento.cd_tipo_acao'
    end
    object qryAcoesMovimentosn_ativo: TStringField
      FieldName = 'sn_ativo'
      Origin = 'WMESTRE12.fin_acoes_movimento.sn_ativo'
      FixedChar = True
      Size = 1
    end
    object qryAcoesMovimentocd_origem: TSmallintField
      FieldName = 'cd_origem'
      Origin = 'WMESTRE12.fin_acoes_movimento.cd_origem'
    end
    object qryAcoesMovimentotp_entrada_saida: TSmallintField
      FieldName = 'tp_entrada_saida'
      Origin = 'WMESTRE12.fin_acoes_movimento.tp_entrada_saida'
    end
    object qryAcoesMovimentocd_acao: TLargeintField
      FieldName = 'cd_acao'
      Required = True
    end
    object qryAcoesMovimentocd_movimento_caixa: TLargeintField
      FieldName = 'cd_movimento_caixa'
    end
    object qryAcoesMovimentocd_movimento_estorno: TLargeintField
      FieldName = 'cd_movimento_estorno'
    end
    object qryAcoesMovimentocd_acao_automatica: TIntegerField
      FieldName = 'cd_acao_automatica'
    end
    object qryAcoesMovimentocd_plano_conta: TLargeintField
      FieldName = 'cd_plano_conta'
    end
  end
  object dsAcoesMovimento: TDataSource
    AutoEdit = False
    DataSet = qryAcoesMovimento
    Left = 312
    Top = 56
  end
  object ilImagens: TImageList
    Left = 352
    Top = 136
    Bitmap = {
      494C010103000400040010001000FFFFFFFFFF10FFFFFFFFFFFFFFFF424D3600
      0000000000003600000028000000400000001000000001002000000000000010
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000004B4B4B004B4B4B00000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000007F000000DF000000BF2A004B4B4B000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000003163
      9C0031639C000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000007F000000DF000000DF000000BF2A004B4B4B0000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000FF0000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000052630031639C0031639C003163
      9C0031639C000000000000526300005263000052630000526300005263000052
      6300000000000000000000000000000000000000000000000000000000000000
      0000007F000000DF000000DF000000DF000000BF2A004B4B4B00000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000FF000000FF000000FF00000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000526300316B9C00316B9C003163
      9C0031639C000000000000CEFF0000CEFF0000CEFF0000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000007F000000DF000000FF090000DF000000DF000000BF2A004B4B4B000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000FF000000FF000000FF00000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000526300296BA500296BA500296B
      9C00296B9C000000000000CEFF0000CEFF0000CEFF000000000000000000FF00
      0000000000000000000000000000000000000000000000000000000000000000
      0000007F000000FF2A0000DF000000FF090000DF000000DF000000BF2A004B4B
      4B00000000000000000000000000000000000000000000000000000000000000
      FF000000FF000000FF000000FF000000FF000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000005263002173AD002173A5002173
      A5002973A5000000000010CEFF0000CEFF0000CEFF0000000000FF000000FF00
      0000000000000000000000000000000000000000000000000000000000000000
      0000007F000055FF000000FF2A0000DF000000FF090000DF000000DF000000BF
      2A004B4B4B0000000000000000000000000000000000000000000000FF000000
      FF000000FF000000FF000000FF000000FF000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000526300187BAD00187BAD00FFFF
      FF002173AD000000000031D6FF0029D6FF0018D6FF00FF000000FF000000FF00
      0000000000000000000000000000000000000000000000000000000000000000
      0000007F000055FFAA0000FF090000FF2A0000DF000000FF090000DF000000DF
      0000007F0000000000000000000000000000000000007F7F7F000000FF000000
      FF0000000000000000000000FF000000FF000000FF0000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000005263001084B5001884B5001884
      B500187BB5000000000063DEFF0052DEFF00FF000000FF000000FF000000FF00
      0000FF000000FF000000FF000000000000000000000000000000000000000000
      0000007F000055FFAA0000FF090000FF090000FF2A0000DF000055FFAA00007F
      0000000000000000000000000000000000007F7F7F000000FF00000000000000
      00000000000000000000000000000000FF000000FF0000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000526300088CBD00108CBD001084
      BD001084B500000000008CE7FF00FF000000FF000000FF000000FF000000FF00
      0000FF000000FF000000FF000000000000000000000000000000000000000000
      0000007F0000AAFF2A0000FF090000FF090000FF090000FF2A00007F00000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000FF000000FF000000FF00000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000005263000894C600088CC600088C
      C600088CBD0000000000B5EFFF00A5EFFF00FF000000FF000000FF000000FF00
      0000FF000000FF000000FF000000000000000000000000000000000000000000
      0000007F0000AAFF2A0000FF090000FF0900AAFF2A00007F0000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000FF000000FF00000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000005263000094CE000094CE000094
      C6000094C60000000000DEF7FF00CEF7FF00C6EFFF00FF000000FF000000FF00
      0000000000000000000000000000000000000000000000000000000000000000
      0000007F0000AAFFAA0000FF0900AAFF2A00007F000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000FF000000FF000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000526300009CCE00009CCE00009C
      CE000094CE0000000000FFFFFF00F7F7FF00E7F7FF0000000000FF000000FF00
      0000000000000000000000000000000000000000000000000000000000000000
      0000007F0000AAFFAA00AAFFAA00007F00000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000000000007F7F7F000000
      FF00000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000526300009CCE00009CCE00009C
      CE00009CCE0000000000FFFFFF00FFFFFF00FFFFFF000000000000000000FF00
      0000000000000000000000000000000000000000000000000000000000000000
      0000007F0000AAFFAA00007F0000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000007F7F
      7F000000FF000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000052630000526300009C
      CE00009CCE000000000000526300005263000052630000526300000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000007F000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000FF000000FF00000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000052
      6300005263000052630000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000424D3E000000000000003E000000
      2800000040000000100000000100010000000000800000000000000000000000
      000000000000000000000000FFFFFF00FFFFF9FFFFFF0000E3FFF0FFFFFF0000
      83FFF07FF9FF0000000FF03FF0FF0000003FF01FF0FF0000002FF00FE07F0000
      000FF007C07F0000000FF007843F00000001F00F1E3F00000001F01FFE1F0000
      0001F03FFF1F0000000FF07FFF8F0000000FF0FFFFC70000002FF1FFFFE30000
      803FFBFFFFF80000E3FFFFFFFFFF000000000000000000000000000000000000
      000000000000}
  end
  object qrySelectParcelas: TUMZQuery
    Connection = DM.db
    SQL.Strings = (
      'SELECT'
      '   m.cd_mensalidade_origem,'
      '   m.cd_mensalidade,'
      '   m.codigoaluno,'
      '   p.nm_pessoa,'
      '   fi.turma,'
      '   fi.turmamatricula, '
      '   fi.curso,'
      '   fi.disciplina,'
      '   m.anosemestre,'
      '   m.datavencimento,'
      '   m.parcela,'
      '   m.valorbruto,'
      '   m.valorjuros,'
      '   m.dt_competencia,'
      '   m.cd_coligada,'
      '   m.nossonumero,'
      '   (SUM(mc.vl_entrada) - SUM(mc.vl_saida)) vl_pendente'
      'FROM'
      '   fichaindividual fi'
      '      JOIN mensalidades m ON'
      '         (fi.cd_mensalidade_exame = m.cd_mensalidade)'
      '      JOIN pessoas p ON'
      '         (fi.codigoaluno = p.cd_pessoa)'
      '      LEFT JOIN fin_mov_cr mc ON'
      '         (m.cd_mensalidade_origem = mc.cd_mensalidade)'
      'WHERE'
      '   m.situacao IN (10, 2)'
      'GROUP BY'
      '   m.cd_mensalidade_origem,'
      '   m.cd_coligada')
    Params = <>
    SQLList.Strings = (
      
        'mysql=SELECT'#13#10'   m.cd_mensalidade_origem,'#13#10'   m.cd_mensalidade,'#13 +
        #10'   m.codigoaluno,'#13#10'   p.nm_pessoa,'#13#10'   fi.turma,'#13#10'   fi.turmama' +
        'tricula,'#13#10'   fi.curso,'#13#10'   fi.disciplina, '#13#10'   m.anosemestre,'#13#10' ' +
        '  m.datavencimento,'#13#10'   m.parcela,'#13#10'   m.valorbruto,'#13#10'   m.valor' +
        'juros,'#13#10'   m.dt_competencia,'#13#10'   m.cd_coligada,'#13#10'   m.nossonumer' +
        'o,'#13#10'   (SUM(mc.vl_entrada) - SUM(mc.vl_saida)) vl_pendente'#13#10'FROM' +
        #13#10'   fichaindividual fi'#13#10'      JOIN mensalidades m ON'#13#10'         ' +
        '(fi.cd_mensalidade_exame = m.cd_mensalidade)'#13#10'      JOIN pessoas' +
        ' p ON'#13#10'         (fi.codigoaluno = p.cd_pessoa)'#13#10'      LEFT JOIN ' +
        'fin_mov_cr mc ON'#13#10'         (m.cd_mensalidade_origem = mc.cd_mens' +
        'alidade)'#13#10'WHERE'#13#10'   m.situacao = 10'#13#10'GROUP BY'#13#10'   m.cd_mensalida' +
        'de_origem,'#13#10'   m.cd_coligada'
      
        'oracle=SELECT'#13#10'   m.cd_mensalidade_origem,'#13#10'   m.cd_mensalidade,' +
        #13#10'   m.codigoaluno,'#13#10'   p.nm_pessoa,'#13#10'   fi.turma,'#13#10'   fi.turmam' +
        'atricula, '#13#10'   fi.curso,'#13#10'   fi.disciplina,'#13#10'   m.anosemestre,'#13#10 +
        '   m.datavencimento,'#13#10'   m.parcela,'#13#10'   m.valorbruto,'#13#10'   m.valo' +
        'rjuros,'#13#10'   m.dt_competencia,'#13#10'   m.cd_coligada,'#13#10'   m.nossonume' +
        'ro,'#13#10#9' AGRUPADO.vl_pendente'#13#10'FROM'#13#10'(SELECT '#13#10#9' M.cd_mensalidade_' +
        'origem, '#13#10#9' M.cd_coligada, '#13#10#9' FIRST_OCCURRENCE(M.CD_MENSALIDADE' +
        ') AS CD_MENSALIDADE,'#13#10#9' (SUM(mc.vl_entrada) - SUM(mc.vl_saida)) ' +
        'AS vl_pendente'#13#10' FROM '#13#10#9' MENSALIDADES M'#13#10#9' LEFT JOIN fin_mov_cr' +
        ' mc ON'#13#10'         (M.cd_mensalidade_origem = mc.cd_mensalidade)'#13#10 +
        ' WHERE'#13#10#9' M.SITUACAO = 10'#13#10' GROUP BY'#13#10#9' M.cd_mensalidade_origem,' +
        ' M.cd_coligada) AGRUPADO'#13#10'INNER JOIN mensalidades m ON (AGRUPADO' +
        '.CD_MENSALIDADE = m.CD_MENSALIDADE)'#13#10'INNER JOIN fichaindividual ' +
        'fi ON (fi.cd_mensalidade_exame = m.cd_mensalidade)'#13#10'INNER JOIN p' +
        'essoas p ON (fi.codigoaluno = p.cd_pessoa)')
    Left = 168
    Top = 120
    object qrySelectParcelasnm_pessoa: TStringField
      FieldName = 'nm_pessoa'
      Size = 60
    end
    object qrySelectParcelasturma: TStringField
      FieldName = 'turma'
      Size = 15
    end
    object qrySelectParcelasanosemestre: TSmallintField
      FieldName = 'anosemestre'
    end
    object qrySelectParcelasdatavencimento: TDateTimeField
      FieldName = 'datavencimento'
    end
    object qrySelectParcelasparcela: TSmallintField
      FieldName = 'parcela'
    end
    object qrySelectParcelasvalorbruto: TFloatField
      FieldName = 'valorbruto'
    end
    object qrySelectParcelasvalorjuros: TFloatField
      FieldName = 'valorjuros'
    end
    object qrySelectParcelasdt_competencia: TDateTimeField
      FieldName = 'dt_competencia'
    end
    object qrySelectParcelasvl_pendente: TFloatField
      FieldName = 'vl_pendente'
    end
    object qrySelectParcelascd_coligada: TSmallintField
      FieldName = 'cd_coligada'
    end
    object qrySelectParcelasturmamatricula: TStringField
      FieldName = 'turmamatricula'
      Size = 15
    end
    object qrySelectParcelascd_mensalidade_origem: TIntegerField
      FieldName = 'cd_mensalidade_origem'
    end
    object qrySelectParcelascd_mensalidade: TIntegerField
      FieldName = 'cd_mensalidade'
      Required = True
    end
    object qrySelectParcelascodigoaluno: TIntegerField
      FieldName = 'codigoaluno'
    end
    object qrySelectParcelasnossonumero: TStringField
      FieldName = 'nossonumero'
    end
  end
  object qryCancelaParcelas: TUMZQuery
    Connection = DM.db
    SQL.Strings = (
      'UPDATE'
      #9'mensalidades m,'
      #9'fichaindividual fi'
      'SET'
      '   fi.situacao = 9,'
      '   fi.notaexame = -3,'
      '   fi.cd_mensalidade_exame = NULL,'
      #9'm.valordesconto = 0,'
      #9'm.valortotal = 0,'
      #9'm.situacao = 5,'
      #9'm.datapagamento = ('
      '      IF('
      
        '         (CURDATE() < m.datavencimento OR (SELECT ds_valor FROM ' +
        'parametros WHERE ds_variavel = "mensalidades_data_baixa") = "[VE' +
        'NCIMENTO]") AND'
      
        '         (SELECT ds_valor FROM parametros WHERE ds_variavel = "m' +
        'ensalidades_data_baixa") <> "[BAIXA]" AND'
      
        '         (SELECT IF(sn_bloquear_financeiro = 0, 1, IF(m.datavenc' +
        'imento > dt_bloqueio_financeiro, 1, 0)) FROM coligadas WHERE cd_' +
        'coligada = :cd_coligada) AND'
      
        '         (SELECT IF(sn_bloquear_financeiro = 0, 1, IF(m.dt_compe' +
        'tencia > dt_bloqueio_financeiro, 1, 0)) FROM coligadas WHERE cd_' +
        'coligada = :cd_coligada)'
      '         , m.datavencimento, CURDATE()'
      '      )'
      '   )'
      'WHERE'
      #9'm.situacao = 5 AND'
      #9'm.cd_mensalidade = fi.cd_mensalidade_exame')
    Params = <
      item
        DataType = ftUnknown
        Name = 'cd_coligada'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'cd_coligada'
        ParamType = ptUnknown
      end>
    SQLList.Strings = (
      
        'mysql-5=UPDATE'#13#10#9'mensalidades m,'#13#10#9'fichaindividual fi'#13#10'SET'#13#10'   f' +
        'i.situacao = 9,'#13#10'   fi.notaexame = -3,'#13#10'   fi.cd_mensalidade_exa' +
        'me = NULL,'#13#10#9'm.valordesconto = 0,'#13#10#9'm.valortotal = 0,'#13#10#9'm.situac' +
        'ao = 5,'#13#10#9'm.datapagamento = ('#13#10'      IF('#13#10'         (CURDATE() < ' +
        'm.datavencimento OR (SELECT ds_valor FROM parametros WHERE ds_va' +
        'riavel = "mensalidades_data_baixa") = "[VENCIMENTO]") AND'#13#10'     ' +
        '    (SELECT ds_valor FROM parametros WHERE ds_variavel = "mensal' +
        'idades_data_baixa") <> "[BAIXA]" AND'#13#10'         (SELECT IF(sn_blo' +
        'quear_financeiro = 0, 1, IF(m.datavencimento > dt_bloqueio_finan' +
        'ceiro, 1, 0)) FROM coligadas WHERE cd_coligada = :cd_coligada) A' +
        'ND'#13#10'         (SELECT IF(sn_bloquear_financeiro = 0, 1, IF(m.dt_c' +
        'ompetencia > dt_bloqueio_financeiro, 1, 0)) FROM coligadas WHERE' +
        ' cd_coligada = :cd_coligada)'#13#10'         , m.datavencimento, CURDA' +
        'TE()'#13#10'      )'#13#10'   )'#13#10'WHERE'#13#10#9'm.situacao = 5 AND'#13#10#9'm.cd_mensalida' +
        'de = fi.cd_mensalidade_exame'
      
        'oracle=MERGE INTO fichaindividual fi USING'#13#10'   (SELECT '#13#10#9#9#9'fi.A' +
        'NOSEMESTRE AS ANOSEMESTRE,'#13#10#9#9#9'fi.TURMA AS TURMA,'#13#10#9#9#9'fi.CODIGOA' +
        'LUNO AS CODIGOALUNO,'#13#10#9#9#9'fi.CURSO AS CURSO,'#13#10' '#9#9'   fi.DISCIPLINA' +
        ' AS DISCIPLINA,'#13#10#9#9#9'fi.SERIE AS SERIE,'#13#10#9#9#9'fi.SITUACAO AS SITUAC' +
        'AO'#13#10'    FROM'#13#10#9#9#9'mensalidades m,'#13#10#9#9#9'fichaindividual fi'#13#10'    WHE' +
        'RE'#13#10#9#9#9'm.situacao = 5 AND'#13#10#9#9#9'm.cd_mensalidade = fi.cd_mensalida' +
        'de_exame) f2 ON (fi.ANOSEMESTRE = f2.ANOSEMESTRE AND'#13#10#9#9#9#9#9#9#9#9#9#9 +
        #9#9#9#9#9#9#9#9#9#9'fi.TURMA = f2.TURMA AND'#13#10#9#9#9#9#9#9#9#9#9#9#9#9#9#9#9#9#9#9#9#9'fi.CODIGO' +
        'ALUNO = f2.CODIGOALUNO AND'#13#10#9#9#9#9#9#9#9#9#9#9#9#9#9#9#9#9#9#9#9#9'fi.CURSO = f2.CU' +
        'RSO AND'#13#10#9#9#9#9#9#9#9#9#9#9#9#9#9#9#9#9#9#9#9#9'fi.DISCIPLINA = f2.DISCIPLINA AND'#13#10 +
        #9#9#9#9#9#9#9#9#9#9#9#9#9#9#9#9#9#9#9#9'fi.SERIE = f2.SERIE'#13#10#9#9#9#9#9#9#9#9#9#9#9#9#9#9#9#9#9#9#9'  ) ' +
        #13#10'WHEN MATCHED THEN '#13#10#9#9'UPDATE SET fi.situacao = 9,'#13#10#9#9#9#9#9'  fi.n' +
        'otaexame = -3,'#13#10#9#9#9#9#9'  fi.cd_mensalidade_exame = NULL')
    Left = 224
    Top = 120
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'cd_coligada'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'cd_coligada'
        ParamType = ptUnknown
      end>
  end
  object qryCancelaParcelas2: TUMZQuery
    Connection = DM.db
    SQL.Strings = (
      'MERGE INTO mensalidades m USING'
      '   (SELECT '
      #9#9#9'm.CD_MENSALIDADE AS CD_MENSALIDADE,'
      #9#9#9'm.datavencimento AS datavencimento,'
      #9#9#9'm.dt_competencia AS dt_competencia,'
      
        #9'  '#9'                (SELECT CASE WHEN (sn_bloquear_financeiro = ' +
        '0) THEN 1 ELSE (CASE WHEN (datavencimento > dt_bloqueio_financei' +
        'ro) THEN 1 ELSE 0 END) END FROM coligadas_matriz WHERE cd_coliga' +
        'da = :cd_coligada) AS CONDICAO1,'
      
        #9#9#9'(SELECT CASE WHEN (sn_bloquear_financeiro = 0) THEN 1 ELSE (C' +
        'ASE WHEN (dt_competencia > dt_bloqueio_financeiro) THEN 1 ELSE 0' +
        ' END) END FROM coligadas_matriz WHERE cd_coligada = :cd_coligada' +
        ') AS CONDICAO2'
      '    FROM'
      #9#9#9'mensalidades m,'
      #9#9#9'fichaindividual fi'
      '    WHERE'
      #9#9#9'm.situacao = 5 AND'
      
        #9#9#9'm.cd_mensalidade = fi.cd_mensalidade_exame) m2 ON (m.CD_MENSA' +
        'LIDADE = m2.CD_MENSALIDADE) '
      'WHEN MATCHED THEN '
      #9#9'UPDATE SET m.valordesconto = 0,'
      ' '#9#9#9#9#9'  m.valortotal = 0,'
      #9#9#9#9#9'  m.situacao = 5,'
      
        #9#9#9#9#9'  m.datapagamento = CASE WHEN ( (SYSDATE < m2.datavenciment' +
        'o) OR ((SELECT ds_valor FROM parametros WHERE ds_variavel = '#39'men' +
        'salidades_data_baixa'#39') = '#39'[VENCIMENTO]'#39') AND'
      
        #9#9#9#9#9#9#9#9#9#9#9#9#9#9#9'  ((SELECT ds_valor FROM parametros WHERE ds_vari' +
        'avel = '#39'mensalidades_data_baixa'#39') <> '#39'[BAIXA]'#39') AND'
      #9#9#9#9#9#9#9#9#9#9#9#9#9#9#9'  m2.CONDICAO1 = 1 AND m2.CONDICAO2 = 1'
      #9#9#9#9#9#9#9#9#9#9#9#9#9#9#9') THEN m2.datavencimento ELSE SYSDATE END')
    Params = <
      item
        DataType = ftUnknown
        Name = 'cd_coligada'
        ParamType = ptUnknown
      end>
    SQLList.Strings = (
      
        'oracle=MERGE INTO mensalidades m USING'#13#10'   (SELECT '#13#10#9#9#9'm.CD_MEN' +
        'SALIDADE AS CD_MENSALIDADE,'#13#10#9#9#9'm.datavencimento AS datavencimen' +
        'to,'#13#10#9#9#9'm.dt_competencia AS dt_competencia,'#13#10#9'  '#9'   (SELECT CASE' +
        ' WHEN (sn_bloquear_financeiro = 0) THEN 1 ELSE (CASE WHEN (datav' +
        'encimento > dt_bloqueio_financeiro) THEN 1 ELSE 0 END) END FROM ' +
        'coligadas WHERE cd_coligada = :cd_coligada) AS CONDICAO1,'#13#10#9#9#9'(S' +
        'ELECT CASE WHEN (sn_bloquear_financeiro = 0) THEN 1 ELSE (CASE W' +
        'HEN (dt_competencia > dt_bloqueio_financeiro) THEN 1 ELSE 0 END)' +
        ' END FROM coligadas WHERE cd_coligada = :cd_coligada) AS CONDICA' +
        'O2'#13#10'    FROM'#13#10#9#9#9'mensalidades m,'#13#10#9#9#9'fichaindividual fi'#13#10'    WHE' +
        'RE'#13#10#9#9#9'm.situacao = 5 AND'#13#10#9#9#9'm.cd_mensalidade = fi.cd_mensalida' +
        'de_exame) m2 ON (m.CD_MENSALIDADE = m2.CD_MENSALIDADE) '#13#10'WHEN MA' +
        'TCHED THEN '#13#10#9#9'UPDATE SET m.valordesconto = 0,'#13#10' '#9#9#9#9#9'  m.valort' +
        'otal = 0,'#13#10#9#9#9#9#9'  m.situacao = 5,'#13#10#9#9#9#9#9'  m.datapagamento = CASE' +
        ' WHEN ( (SYSDATE < m2.datavencimento) OR ((SELECT ds_valor FROM ' +
        'parametros WHERE ds_variavel = '#39'mensalidades_data_baixa'#39') = '#39'[VE' +
        'NCIMENTO]'#39') AND'#13#10#9#9#9#9#9#9#9#9#9#9#9#9#9#9#9'  ((SELECT ds_valor FROM paramet' +
        'ros WHERE ds_variavel = '#39'mensalidades_data_baixa'#39') <> '#39'[BAIXA]'#39')' +
        ' AND'#13#10#9#9#9#9#9#9#9#9#9#9#9#9#9#9#9'  m2.CONDICAO1 = 1 AND m2.CONDICAO2 = 1'#13#10#9#9 +
        #9#9#9#9#9#9#9#9#9#9#9#9#9') THEN m2.datavencimento ELSE SYSDATE END')
    Left = 224
    Top = 152
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'cd_coligada'
        ParamType = ptUnknown
      end>
  end
end
