object frmLGTCDespesasResumo: TfrmLGTCDespesasResumo
  Left = 0
  Top = 0
  BorderStyle = bsDialog
  Caption = 'Resumo de despesas'
  ClientHeight = 288
  ClientWidth = 562
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
  PixelsPerInch = 96
  TextHeight = 13
  object pnlDados: TPanel
    Left = 8
    Top = 3
    Width = 546
    Height = 254
    Align = alTop
    Padding.Left = 8
    Padding.Top = 3
    Padding.Right = 8
    Padding.Bottom = 3
    TabOrder = 0
    object lblOrientacao: TLabel
      Left = 9
      Top = 4
      Width = 528
      Height = 39
      Align = alTop
      Caption = 
        'A situa'#231#227'o selecionada est'#225' configurada para gerar compromissos ' +
        'para as despesas vinculadas com a aula. Ao salvar a altera'#231#227'o de' +
        'sta aula o sistema ir'#225' lan'#231'ar automaticamente os compromissos pa' +
        'ra as suas despesas. Confira abaixo um resumo com as despesas co' +
        'nfirmadas para esta aula:'
      WordWrap = True
      ExplicitWidth = 517
    end
    object bvlSep1: TBevel
      Left = 9
      Top = 43
      Width = 528
      Height = 3
      Align = alTop
      Shape = bsSpacer
      ExplicitLeft = 168
      ExplicitTop = 80
      ExplicitWidth = 50
    end
    object dbgDespesas: TSortedDBGrid
      Left = 9
      Top = 46
      Width = 528
      Height = 204
      Align = alClient
      DataSource = dsDespesas
      Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgConfirmDelete, dgCancelOnExit]
      ReadOnly = True
      TabOrder = 0
      TitleFont.Charset = DEFAULT_CHARSET
      TitleFont.Color = clWindowText
      TitleFont.Height = -11
      TitleFont.Name = 'Tahoma'
      TitleFont.Style = []
      Columns = <
        item
          Expanded = False
          FieldName = 'DS_TIPO_DESPESA'
          Title.Caption = 'Tipo de despesa'
          Width = 128
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'NM_PESSOA'
          Title.Caption = 'Benefici'#225'rio'
          Width = 256
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'VL_TOTAL'
          Title.Caption = 'Valor total (R$)'
          Width = 96
          Visible = True
        end>
    end
  end
  object bbtnConfirmar: TBitBtn
    Left = 401
    Top = 260
    Width = 75
    Height = 25
    Caption = 'Confirmar'
    TabOrder = 1
    Kind = bkOK
  end
  object bbtnCancelar: TBitBtn
    Left = 479
    Top = 260
    Width = 75
    Height = 25
    Caption = 'Cancelar'
    TabOrder = 2
    Kind = bkCancel
  end
  object qryAulas: TUMZReadOnlyQuery
    Connection = DM.db
    SortedFields = 'DT_AULA'
    SQL.Strings = (
      'SELECT'
      '  A1.`CD_DIARIO_AULA`,'
      '  A1.`DATA` `DT_AULA`'
      'FROM'
      '  `DIARIO_AULAS` A1'
      'WHERE'
      '  EXISTS ('
      '    SELECT'
      '      A2.`CD_DIARIO_AULA`'
      '    FROM'
      '      `DIARIO_AULAS` A2'
      '    WHERE'
      '      A1.`TURMA` = A2.`TURMA` AND'
      '      A1.`ANOSEMESTRE` = A2.`ANOSEMESTRE` AND'
      '      A1.`DISCIPLINA` = A2.`DISCIPLINA` AND'
      '      A1.`BIMESTRE` = A2.`BIMESTRE` AND'
      '      A2.`CD_DIARIO_AULA` = :CD_DIARIO_AULA'
      '  )')
    Params = <
      item
        DataType = ftUnknown
        Name = 'CD_DIARIO_AULA'
        ParamType = ptUnknown
      end>
    IndexFieldNames = 'DT_AULA Asc'
    Left = 160
    Top = 112
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'CD_DIARIO_AULA'
        ParamType = ptUnknown
      end>
    object qryAulasCD_DIARIO_AULA: TLargeintField
      FieldName = 'CD_DIARIO_AULA'
      Required = True
    end
    object qryAulasDT_AULA: TDateTimeField
      FieldName = 'DT_AULA'
      ReadOnly = True
    end
  end
  object dspAulas: TDataSetProvider
    DataSet = qryAulas
    Left = 160
    Top = 144
  end
  object cdsAulas: TClientDataSet
    Aggregates = <>
    Filter = 'SN_GERAR'
    Params = <
      item
        DataType = ftUnknown
        Name = 'CD_DIARIO_AULA'
        ParamType = ptUnknown
      end>
    ProviderName = 'dspAulas'
    Left = 160
    Top = 176
    object cdsAulasCD_DIARIO_AULA: TLargeintField
      FieldName = 'CD_DIARIO_AULA'
      Required = True
    end
    object cdsAulasDT_AULA: TDateTimeField
      FieldName = 'DT_AULA'
      ReadOnly = True
    end
    object cdsAulasSN_GERAR: TBooleanField
      FieldKind = fkInternalCalc
      FieldName = 'SN_GERAR'
    end
  end
  object qryDespesas: TUMZQuery
    Connection = DM.db
    UpdateObject = updDespesas
    SQL.Strings = (
      'SELECT'
      '  D.`CD_DESPESA`,'
      '  D.`CD_DIARIO_AULA`,'
      '  U.`CD_COLIGADA`,'
      '  U.`CD_CENTRO`,'
      '  D.`CD_FORNECEDOR`,'
      '  D.`CD_CONTA`,'
      '  D.`CD_COLIGADA_MATRIZ`,'
      '  D.`CD_TIPO_TITULO`,'
      '  D.`DS_OBSERVACAO`,'
      '  D.`VL_TOTAL`,'
      '  D.`CD_TITULO`,'
      '  D.`CD_SITUACAO`,'
      '  I.`DS_CHAVE`,'
      '  A.`TURMA` `CD_TURMA`,'
      '  A.`DISCIPLINA` `CD_DISCIPLINA`,'
      '  A.`ANOSEMESTRE` `NR_ANOSEMESTRE`,'
      '  P.`CD_FORMA_PGTO`,'
      '  T.`DS_TIPO_DESPESA`,'
      '  F.`NM_PESSOA`,'
      '  A.`CD_PROFESSOR`,'
      '  A.`DATA` `DT_AULA` '
      'FROM'
      ''
      '  `LGTC_DESPESA_AULA` D'
      ''
      '    JOIN `PESSOAS` F ON'
      '      (D.`CD_FORNECEDOR` = F.`CD_PESSOA`)'
      ''
      '    JOIN `LGTC_DESPESA_SITUACAO` S ON'
      '      (D.`CD_SITUACAO` = S.`CD_SITUACAO`)'
      ''
      '    JOIN `LGTC_TIPO_DESPESA` T ON'
      '      (D.`CD_TIPO_DESPESA` = T.`CD_TIPO_DESPESA`)'
      ''
      '      JOIN `LGTC_TD_TIPO` I ON'
      '        (T.`CD_TIPO` = I.`CD_TIPO`)'
      ''
      '    JOIN `DIARIO_AULAS` A ON'
      '      (D.`CD_DIARIO_AULA` = A.`CD_DIARIO_AULA`)'
      ''
      '      JOIN `TURMAS` U ON'
      '        (A.`TURMA` = U.`CODIGO`) AND'
      '        (A.`ANOSEMESTRE` = U.`ANOSEMESTRE`)'
      ''
      '        JOIN `COLIGADAS` C ON'
      '          (U.`CD_COLIGADA` = C.`CD_COLIGADA`)'
      ''
      '          JOIN `FIN_CONFIG_FORMAS_PGTO` P ON'
      '            (C.`CD_COLIGADA_MATRIZ` = P.`CD_COLIGADA_MATRIZ`)  '
      ''
      'WHERE'
      '  P.`SN_PADRAO_COMPROMISSO_AULA` = 1 AND'
      '  S.`DS_CHAVE` = '#39'confirmado'#39' AND'
      '  EXISTS ('
      '    SELECT'
      '      A2.`CD_DIARIO_AULA`'
      '    FROM'
      '      `DIARIO_AULAS` A2'
      '    WHERE'
      '      A.`TURMA` = A2.`TURMA` AND'
      '      A.`ANOSEMESTRE` = A2.`ANOSEMESTRE` AND'
      '      A.`DISCIPLINA` = A2.`DISCIPLINA` AND'
      '      A.`BIMESTRE` = A2.`BIMESTRE` AND'
      '      A2.`CD_DIARIO_AULA` = :CD_DIARIO_AULA'
      '  )'
      'ORDER BY'
      '  A.`DATA`')
    Params = <
      item
        DataType = ftUnknown
        Name = 'CD_DIARIO_AULA'
        ParamType = ptUnknown
      end>
    Left = 192
    Top = 112
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'CD_DIARIO_AULA'
        ParamType = ptUnknown
      end>
    object qryDespesasCD_DESPESA: TLargeintField
      FieldName = 'CD_DESPESA'
      Required = True
    end
    object qryDespesasCD_DIARIO_AULA: TLargeintField
      FieldName = 'CD_DIARIO_AULA'
      Required = True
    end
    object qryDespesasCD_COLIGADA: TIntegerField
      FieldName = 'CD_COLIGADA'
      Required = True
    end
    object qryDespesasCD_CENTRO: TLargeintField
      FieldName = 'CD_CENTRO'
    end
    object qryDespesasCD_FORNECEDOR: TIntegerField
      FieldName = 'CD_FORNECEDOR'
      Required = True
    end
    object qryDespesasCD_CONTA: TLargeintField
      FieldName = 'CD_CONTA'
      Required = True
    end
    object qryDespesasCD_COLIGADA_MATRIZ: TIntegerField
      FieldName = 'CD_COLIGADA_MATRIZ'
      Required = True
    end
    object qryDespesasCD_TIPO_TITULO: TIntegerField
      FieldName = 'CD_TIPO_TITULO'
    end
    object qryDespesasDS_OBSERVACAO: TStringField
      FieldName = 'DS_OBSERVACAO'
      Size = 255
    end
    object qryDespesasVL_TOTAL: TFloatField
      FieldName = 'VL_TOTAL'
    end
    object qryDespesasCD_TITULO: TLargeintField
      FieldName = 'CD_TITULO'
    end
    object qryDespesasCD_SITUACAO: TLargeintField
      FieldName = 'CD_SITUACAO'
      Required = True
    end
    object qryDespesasDS_CHAVE: TStringField
      FieldName = 'DS_CHAVE'
      Required = True
      Size = 16
    end
    object qryDespesasCD_TURMA: TStringField
      FieldName = 'CD_TURMA'
      ReadOnly = True
      Size = 50
    end
    object qryDespesasCD_DISCIPLINA: TIntegerField
      FieldName = 'CD_DISCIPLINA'
      ReadOnly = True
    end
    object qryDespesasNR_ANOSEMESTRE: TSmallintField
      FieldName = 'NR_ANOSEMESTRE'
      ReadOnly = True
    end
    object qryDespesasCD_FORMA_PGTO: TLargeintField
      FieldName = 'CD_FORMA_PGTO'
      Required = True
    end
    object qryDespesasDS_TIPO_DESPESA: TStringField
      FieldName = 'DS_TIPO_DESPESA'
      Required = True
      Size = 64
    end
    object qryDespesasNM_PESSOA: TStringField
      FieldName = 'NM_PESSOA'
      Size = 60
    end
    object qryDespesasCD_PROFESSOR: TIntegerField
      FieldName = 'CD_PROFESSOR'
      Required = True
    end
    object qryDespesasDT_AULA: TDateTimeField
      FieldName = 'DT_AULA'
      ReadOnly = True
    end
  end
  object dsAulas: TDataSource
    DataSet = cdsAulas
    Left = 160
    Top = 208
  end
  object qryContaPagar: TUMZQuery
    Connection = DM.db
    SQL.Strings = (
      'SELECT'
      '  `CD_TITULO`,'
      '  `CD_TITULO_PRINCIPAL`,'
      '  `CD_COLIGADA`,'
      '  `CD_PESSOA`,'
      '  `DS_DESPESA`,'
      '  `NR_PARCELA`,'
      '  `DT_LANCAMENTO`,'
      '  `DT_COMPETENCIA`,'
      '  `DT_VENCIMENTO`,'
      '  `DT_PROVAVEL_PGTO`,'
      '  `VL_DESPESA`,'
      '  `CD_SITUACAO`,'
      '  `SN_PREVISAO`,'
      '  `CD_TIPO_TITULO`,'
      '  `TP_ENTRADA_SAIDA`,'
      '  `CD_FORMA_PGTO`,'
      '  `DS_OBSERVACAO`,'
      '  `VL_ABATIMENTO`,'
      '  `VL_DESCONTO`,'
      '  `VL_MORA`,'
      '  `VL_MULTA`,'
      '  `VL_PREVISTO_PGTO_INSS`,'
      '  `VL_OUTRAS_ENTIDADES`,'
      '  `VL_ATUALIZACAO_MOTENARIA`,'
      '  `VL_TOTAL_DESPESA`,'
      '  `CD_TURMA`,'
      '  `CD_DISCIPLINA`,'
      '  `NR_ANOSEMESTRE_DISCIPLINA`,'
      '  `NR_DOCUMENTO`,'
      '  `CD_CAIXA`,'
      '  `DT_EMISSAO_NOTA`'
      'FROM'
      '  `FIN_CONTAS_PAGAR`'
      'WHERE'
      '  `CD_TITULO` = :CD_TITULO')
    Params = <
      item
        DataType = ftUnknown
        Name = 'CD_TITULO'
        ParamType = ptUnknown
      end>
    Left = 224
    Top = 112
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'CD_TITULO'
        ParamType = ptUnknown
      end>
    object qryContaPagarCD_TITULO: TLargeintField
      FieldName = 'CD_TITULO'
      Required = True
    end
    object qryContaPagarCD_TITULO_PRINCIPAL: TLargeintField
      FieldName = 'CD_TITULO_PRINCIPAL'
    end
    object qryContaPagarCD_COLIGADA: TSmallintField
      FieldName = 'CD_COLIGADA'
      Required = True
    end
    object qryContaPagarCD_PESSOA: TIntegerField
      FieldName = 'CD_PESSOA'
    end
    object qryContaPagarDS_DESPESA: TStringField
      FieldName = 'DS_DESPESA'
      Size = 255
    end
    object qryContaPagarNR_PARCELA: TIntegerField
      FieldName = 'NR_PARCELA'
    end
    object qryContaPagarDT_LANCAMENTO: TDateTimeField
      FieldName = 'DT_LANCAMENTO'
    end
    object qryContaPagarDT_COMPETENCIA: TDateTimeField
      FieldName = 'DT_COMPETENCIA'
    end
    object qryContaPagarDT_VENCIMENTO: TDateTimeField
      FieldName = 'DT_VENCIMENTO'
    end
    object qryContaPagarDT_PROVAVEL_PGTO: TDateTimeField
      FieldName = 'DT_PROVAVEL_PGTO'
    end
    object qryContaPagarVL_DESPESA: TFloatField
      FieldName = 'VL_DESPESA'
    end
    object qryContaPagarCD_SITUACAO: TSmallintField
      FieldName = 'CD_SITUACAO'
    end
    object qryContaPagarSN_PREVISAO: TStringField
      FieldName = 'SN_PREVISAO'
      Size = 1
    end
    object qryContaPagarCD_TIPO_TITULO: TSmallintField
      FieldName = 'CD_TIPO_TITULO'
    end
    object qryContaPagarTP_ENTRADA_SAIDA: TSmallintField
      FieldName = 'TP_ENTRADA_SAIDA'
    end
    object qryContaPagarCD_FORMA_PGTO: TIntegerField
      FieldName = 'CD_FORMA_PGTO'
    end
    object qryContaPagarDS_OBSERVACAO: TMemoField
      FieldName = 'DS_OBSERVACAO'
      BlobType = ftMemo
    end
    object qryContaPagarVL_ABATIMENTO: TFloatField
      FieldName = 'VL_ABATIMENTO'
    end
    object qryContaPagarVL_DESCONTO: TFloatField
      FieldName = 'VL_DESCONTO'
    end
    object qryContaPagarVL_MORA: TFloatField
      FieldName = 'VL_MORA'
    end
    object qryContaPagarVL_MULTA: TFloatField
      FieldName = 'VL_MULTA'
    end
    object qryContaPagarVL_PREVISTO_PGTO_INSS: TFloatField
      FieldName = 'VL_PREVISTO_PGTO_INSS'
    end
    object qryContaPagarVL_OUTRAS_ENTIDADES: TFloatField
      FieldName = 'VL_OUTRAS_ENTIDADES'
    end
    object qryContaPagarVL_ATUALIZACAO_MOTENARIA: TFloatField
      FieldName = 'VL_ATUALIZACAO_MOTENARIA'
    end
    object qryContaPagarVL_TOTAL_DESPESA: TFloatField
      FieldName = 'VL_TOTAL_DESPESA'
    end
    object qryContaPagarCD_TURMA: TStringField
      FieldName = 'CD_TURMA'
      Size = 50
    end
    object qryContaPagarCD_DISCIPLINA: TIntegerField
      FieldName = 'CD_DISCIPLINA'
    end
    object qryContaPagarNR_ANOSEMESTRE_DISCIPLINA: TSmallintField
      FieldName = 'NR_ANOSEMESTRE_DISCIPLINA'
    end
    object qryContaPagarNR_DOCUMENTO: TStringField
      FieldName = 'NR_DOCUMENTO'
      Size = 50
    end
    object qryContaPagarCD_CAIXA: TLargeintField
      FieldName = 'CD_CAIXA'
    end
    object qryContaPagarDT_EMISSAO_NOTA: TDateTimeField
      FieldName = 'DT_EMISSAO_NOTA'
    end
  end
  object dspContaPagar: TDataSetProvider
    DataSet = qryContaPagar
    Left = 224
    Top = 144
  end
  object cdsContaPagar: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspContaPagar'
    Left = 224
    Top = 176
    object cdsContaPagarCD_TITULO: TLargeintField
      FieldName = 'CD_TITULO'
      Required = True
    end
    object cdsContaPagarCD_TITULO_PRINCIPAL: TLargeintField
      FieldName = 'CD_TITULO_PRINCIPAL'
    end
    object cdsContaPagarCD_COLIGADA: TSmallintField
      FieldName = 'CD_COLIGADA'
      Required = True
    end
    object cdsContaPagarCD_PESSOA: TIntegerField
      FieldName = 'CD_PESSOA'
    end
    object cdsContaPagarDS_DESPESA: TStringField
      FieldName = 'DS_DESPESA'
      Size = 255
    end
    object cdsContaPagarNR_PARCELA: TIntegerField
      FieldName = 'NR_PARCELA'
    end
    object cdsContaPagarDT_LANCAMENTO: TDateTimeField
      FieldName = 'DT_LANCAMENTO'
    end
    object cdsContaPagarDT_COMPETENCIA: TDateTimeField
      FieldName = 'DT_COMPETENCIA'
    end
    object cdsContaPagarDT_VENCIMENTO: TDateTimeField
      FieldName = 'DT_VENCIMENTO'
    end
    object cdsContaPagarDT_PROVAVEL_PGTO: TDateTimeField
      FieldName = 'DT_PROVAVEL_PGTO'
    end
    object cdsContaPagarVL_DESPESA: TFloatField
      FieldName = 'VL_DESPESA'
    end
    object cdsContaPagarCD_SITUACAO: TSmallintField
      FieldName = 'CD_SITUACAO'
    end
    object cdsContaPagarSN_PREVISAO: TStringField
      FieldName = 'SN_PREVISAO'
      Size = 1
    end
    object cdsContaPagarCD_TIPO_TITULO: TSmallintField
      FieldName = 'CD_TIPO_TITULO'
    end
    object cdsContaPagarTP_ENTRADA_SAIDA: TSmallintField
      FieldName = 'TP_ENTRADA_SAIDA'
    end
    object cdsContaPagarCD_FORMA_PGTO: TIntegerField
      FieldName = 'CD_FORMA_PGTO'
    end
    object cdsContaPagarDS_OBSERVACAO: TMemoField
      FieldName = 'DS_OBSERVACAO'
      BlobType = ftMemo
    end
    object cdsContaPagarVL_ABATIMENTO: TFloatField
      FieldName = 'VL_ABATIMENTO'
    end
    object cdsContaPagarVL_DESCONTO: TFloatField
      FieldName = 'VL_DESCONTO'
    end
    object cdsContaPagarVL_MORA: TFloatField
      FieldName = 'VL_MORA'
    end
    object cdsContaPagarVL_MULTA: TFloatField
      FieldName = 'VL_MULTA'
    end
    object cdsContaPagarVL_PREVISTO_PGTO_INSS: TFloatField
      FieldName = 'VL_PREVISTO_PGTO_INSS'
    end
    object cdsContaPagarVL_OUTRAS_ENTIDADES: TFloatField
      FieldName = 'VL_OUTRAS_ENTIDADES'
    end
    object cdsContaPagarVL_ATUALIZACAO_MOTENARIA: TFloatField
      FieldName = 'VL_ATUALIZACAO_MOTENARIA'
    end
    object cdsContaPagarVL_TOTAL_DESPESA: TFloatField
      FieldName = 'VL_TOTAL_DESPESA'
    end
    object cdsContaPagarCD_TURMA: TStringField
      FieldName = 'CD_TURMA'
      Size = 50
    end
    object cdsContaPagarCD_DISCIPLINA: TIntegerField
      FieldName = 'CD_DISCIPLINA'
    end
    object cdsContaPagarNR_ANOSEMESTRE_DISCIPLINA: TSmallintField
      FieldName = 'NR_ANOSEMESTRE_DISCIPLINA'
    end
    object cdsContaPagarCD_CENTRO: TLargeintField
      FieldKind = fkInternalCalc
      FieldName = 'CD_CENTRO'
    end
    object cdsContaPagarCD_COLIGADA_MATRIZ: TSmallintField
      FieldKind = fkInternalCalc
      FieldName = 'CD_COLIGADA_MATRIZ'
    end
    object cdsContaPagarCD_CONTA: TLargeintField
      FieldKind = fkInternalCalc
      FieldName = 'CD_CONTA'
    end
    object cdsContaPagarNR_DOCUMENTO: TStringField
      FieldName = 'NR_DOCUMENTO'
      Size = 50
    end
    object cdsContaPagarCD_CAIXA: TLargeintField
      FieldName = 'CD_CAIXA'
    end
    object cdsContaPagarDT_EMISSAO_NOTA: TDateTimeField
      FieldName = 'DT_EMISSAO_NOTA'
    end
  end
  object qryMovimentoCP: TUMZQuery
    Connection = DM.db
    SQL.Strings = (
      'INSERT INTO FIN_MOV_CP ('
      '  CD_TITULO,'
      '  CD_COLIGADA,'
      '  NR_SEQUENCIA,'
      '  CD_ACAO,'
      '  DT_MOVIMENTO,'
      '  VL_ENTRADA,'
      '  CD_USUARIO'
      ') VALUES ('
      '  :CD_TITULO,'
      '  :CD_COLIGADA,'
      '  :NR_SEQUENCIA,'
      '  :CD_ACAO,'
      '  :DT_MOVIMENTO,'
      '  :VL_ENTRADA,'
      '  :CD_USUARIO'
      ')')
    Params = <
      item
        DataType = ftUnknown
        Name = 'CD_TITULO'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'CD_COLIGADA'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'NR_SEQUENCIA'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'CD_ACAO'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'DT_MOVIMENTO'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'VL_ENTRADA'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'CD_USUARIO'
        ParamType = ptUnknown
      end>
    Left = 256
    Top = 112
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'CD_TITULO'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'CD_COLIGADA'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'NR_SEQUENCIA'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'CD_ACAO'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'DT_MOVIMENTO'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'VL_ENTRADA'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'CD_USUARIO'
        ParamType = ptUnknown
      end>
  end
  object qryApropriacao: TUMZQuery
    Connection = DM.db
    SQL.Strings = (
      'INSERT INTO `FIN_APROPRIA_CP` ('
      '  `CD_TITULO`,'
      '  `CD_COLIGADA`,'
      '  `CD_CONTA`,'
      '  `CD_CENTRO`,'
      '  `VL_MOVIMENTO`'
      ') VALUES ('
      '  :CD_TITULO,'
      '  :CD_COLIGADA,'
      '  :CD_CONTA,'
      '  :CD_CENTRO,'
      '  :VL_MOVIMENTO'
      ')')
    Params = <
      item
        DataType = ftUnknown
        Name = 'CD_TITULO'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'CD_COLIGADA'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'CD_CONTA'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'CD_CENTRO'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'VL_MOVIMENTO'
        ParamType = ptUnknown
      end>
    Left = 256
    Top = 144
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'CD_TITULO'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'CD_COLIGADA'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'CD_CONTA'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'CD_CENTRO'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'VL_MOVIMENTO'
        ParamType = ptUnknown
      end>
  end
  object cdsCompromissos: TClientDataSet
    Aggregates = <>
    Params = <>
    Left = 192
    Top = 240
    object cdsCompromissosCD_DIARIO_AULA: TLargeintField
      FieldName = 'CD_DIARIO_AULA'
    end
    object cdsCompromissosCD_COLIGADA: TIntegerField
      FieldName = 'CD_COLIGADA'
    end
    object cdsCompromissosCD_CENTRO: TLargeintField
      FieldName = 'CD_CENTRO'
    end
    object cdsCompromissosCD_FORNECEDOR: TIntegerField
      FieldName = 'CD_FORNECEDOR'
    end
    object cdsCompromissosCD_CONTA: TLargeintField
      FieldName = 'CD_CONTA'
    end
    object cdsCompromissosCD_COLIGADA_MATRIZ: TIntegerField
      FieldName = 'CD_COLIGADA_MATRIZ'
    end
    object cdsCompromissosDS_OBSERVACAO: TStringField
      FieldName = 'DS_OBSERVACAO'
    end
    object cdsCompromissosVL_TOTAL: TFloatField
      FieldName = 'VL_TOTAL'
    end
    object cdsCompromissosDS_CHAVE: TStringField
      FieldName = 'DS_CHAVE'
    end
    object cdsCompromissosCD_TURMA: TStringField
      FieldName = 'CD_TURMA'
    end
    object cdsCompromissosCD_DISCIPLINA: TIntegerField
      FieldName = 'CD_DISCIPLINA'
    end
    object cdsCompromissosNR_ANOSEMESTRE: TSmallintField
      FieldName = 'NR_ANOSEMESTRE'
    end
    object cdsCompromissosCD_TIPO_TITULO: TIntegerField
      FieldName = 'CD_TIPO_TITULO'
    end
    object cdsCompromissosCD_DESPESA: TLargeintField
      FieldName = 'CD_DESPESA'
    end
    object cdsCompromissosCD_FORMA_PGTO: TLargeintField
      FieldName = 'CD_FORMA_PGTO'
    end
    object cdsCompromissosDT_VENCIMENTO: TDateField
      FieldName = 'DT_VENCIMENTO'
    end
  end
  object updDespesas: TZUpdateSQL
    ModifySQL.Strings = (
      'UPDATE `LGTC_DESPESA_AULA`'
      'SET'
      '   `CD_SITUACAO` = :CD_SITUACAO,'
      '   `CD_TITULO` = :CD_TITULO'
      'WHERE'
      '   `CD_DESPESA` = :CD_DESPESA')
    UseSequenceFieldForRefreshSQL = False
    Left = 192
    Top = 80
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'CD_SITUACAO'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'CD_TITULO'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'CD_DESPESA'
        ParamType = ptUnknown
      end>
  end
  object dspDespesas: TDataSetProvider
    DataSet = qryDespesas
    Left = 192
    Top = 144
  end
  object cdsDespesas: TClientDataSet
    Aggregates = <>
    Filter = 'SN_MOSTRAR'
    Params = <
      item
        DataType = ftUnknown
        Name = 'CD_DIARIO_AULA'
        ParamType = ptUnknown
      end>
    ProviderName = 'dspDespesas'
    Left = 192
    Top = 176
    object cdsDespesasCD_DESPESA: TLargeintField
      FieldName = 'CD_DESPESA'
      Required = True
    end
    object cdsDespesasCD_DIARIO_AULA: TLargeintField
      FieldName = 'CD_DIARIO_AULA'
      Required = True
    end
    object cdsDespesasCD_COLIGADA: TIntegerField
      FieldName = 'CD_COLIGADA'
      Required = True
    end
    object cdsDespesasCD_CENTRO: TLargeintField
      FieldName = 'CD_CENTRO'
    end
    object cdsDespesasCD_FORNECEDOR: TIntegerField
      FieldName = 'CD_FORNECEDOR'
      Required = True
    end
    object cdsDespesasCD_CONTA: TLargeintField
      FieldName = 'CD_CONTA'
      Required = True
    end
    object cdsDespesasCD_COLIGADA_MATRIZ: TIntegerField
      FieldName = 'CD_COLIGADA_MATRIZ'
      Required = True
    end
    object cdsDespesasCD_TIPO_TITULO: TIntegerField
      FieldName = 'CD_TIPO_TITULO'
    end
    object cdsDespesasDS_OBSERVACAO: TStringField
      FieldName = 'DS_OBSERVACAO'
      Size = 255
    end
    object cdsDespesasVL_TOTAL: TFloatField
      FieldName = 'VL_TOTAL'
      DisplayFormat = '###,###,##0.00'
    end
    object cdsDespesasCD_TITULO: TLargeintField
      FieldName = 'CD_TITULO'
    end
    object cdsDespesasCD_SITUACAO: TLargeintField
      FieldName = 'CD_SITUACAO'
      Required = True
    end
    object cdsDespesasDS_CHAVE: TStringField
      FieldName = 'DS_CHAVE'
      Required = True
      Size = 16
    end
    object cdsDespesasCD_TURMA: TStringField
      FieldName = 'CD_TURMA'
      ReadOnly = True
      Size = 50
    end
    object cdsDespesasCD_DISCIPLINA: TIntegerField
      FieldName = 'CD_DISCIPLINA'
      ReadOnly = True
    end
    object cdsDespesasNR_ANOSEMESTRE: TSmallintField
      FieldName = 'NR_ANOSEMESTRE'
      ReadOnly = True
    end
    object cdsDespesasCD_FORMA_PGTO: TLargeintField
      FieldName = 'CD_FORMA_PGTO'
      Required = True
    end
    object cdsDespesasDS_TIPO_DESPESA: TStringField
      FieldName = 'DS_TIPO_DESPESA'
      Required = True
      Size = 64
    end
    object cdsDespesasNM_PESSOA: TStringField
      FieldName = 'NM_PESSOA'
      Size = 60
    end
    object cdsDespesasSN_MOSTRAR: TBooleanField
      FieldKind = fkInternalCalc
      FieldName = 'SN_MOSTRAR'
    end
    object cdsDespesasCD_PROFESSOR: TIntegerField
      FieldName = 'CD_PROFESSOR'
      Required = True
    end
    object cdsDespesasDT_AULA: TDateTimeField
      FieldName = 'DT_AULA'
      ReadOnly = True
    end
  end
  object dsDespesas: TDataSource
    AutoEdit = False
    DataSet = cdsDespesas
    Left = 192
    Top = 208
  end
  object qryFormaPgto: TUMZReadOnlyQuery
    Connection = DM.db
    SQL.Strings = (
      'SELECT'
      '  C.`DS_CONTEUDO`'
      'FROM'
      '  PESSOAS_CADASTRO C'
      'WHERE'
      '  C.`CD_PESSOA` = :CD_PESSOA AND'
      '  C.`CD_CAMPO` = :CD_CAMPO')
    Params = <
      item
        DataType = ftUnknown
        Name = 'CD_PESSOA'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'CD_CAMPO'
        ParamType = ptUnknown
      end>
    Left = 256
    Top = 176
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'CD_PESSOA'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'CD_CAMPO'
        ParamType = ptUnknown
      end>
    object qryFormaPgtoDS_CONTEUDO: TStringField
      FieldName = 'DS_CONTEUDO'
      Size = 100
    end
  end
end
