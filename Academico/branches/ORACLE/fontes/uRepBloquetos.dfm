object frmRepBloquetos: TfrmRepBloquetos
  Left = 469
  Top = 233
  Caption = 'frmRepBloquetos'
  ClientHeight = 106
  ClientWidth = 212
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = True
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object tblBloquetos: TUMZQuery
    Connection = DM.db
    SQL.Strings = (
      'SELECT'
      '   M.CD_MENSALIDADE'
      '   M.CODIGOALUNO'
      '   M.PARCELA'
      '   M.DATAVENCIMENTO'
      '   M.DT_COMPETENCIA'
      '   M.TURMA'
      '   M.CD_BOLSA'
      '   M.DATAEMISSAO'
      '   M.NOSSONUMERO'
      '   M.CD_DESC_CONDICIONAL'
      '   M.VALORBRUTO'
      '   M.CD_TIPO_TITULO'
      '   M.VALORDESCONTO'
      '   M.DS_OBS_DESC'
      '   M.DESCONTOEXTRA'
      '   M.VALOREXTRA'
      '   M.VALORTOTAL'
      '   M.VALORJUROS'
      '   M.VALORJUROS_FIXO'
      '   M.VALORPAGO'
      '   M.VL_FATURAMENTO'
      '   M.DATAPAGAMENTO'
      '   M.DT_CREDITO'
      '   M.SITUACAO'
      '   M.USUARIO'
      '   M.CD_USUARIO'
      '   M.BLOQUETO'
      '   M.ANOSEMESTRE'
      '   M.DATABASECORRECAO'
      '   M.INDICECORRECAO'
      '   M.CURSO'
      '   M.DEPTO'
      '   M.TIPOPARCELA'
      '   M.OCORRENCIA_REMESSA'
      '   M.OCORRENCIA_RETORNO'
      '   M.SN_CREDITO_PARCELA'
      '   M.NR_CREDITOS'
      '   M.CD_MENSALIDADE_ORIGEM'
      '   M.CD_COLIGADA'
      '   M.CD_CENTRO_CUSTO'
      '   M.CD_PLANO_CONTA'
      '   M.DS_HISTORICO'
      '   M.SN_LIBERAR_JUROS'
      '   M.SN_LIBERAR_DESCONTOS'
      '   M.CD_BOLETO'
      '   M.CD_CAIXA'
      '   M.CD_MOEDA'
      '   M.CD_MOEDA_PGTO'
      '   M.VL_PAGO_MOEDA'
      '   M.CD_RESP'
      '   M.CD_ITEM_PLANO'
      '   M.VL_CREDITO'
      '   M.CD_RECIBO'
      '   M.NR_NF'
      '   M.CODIGOCARTA'
      '   M.CD_CHEQUE_DEVOLVIDO'
      '   M.DS_DEPOSITO'
      '   A.DS_CPF CPF,'
      '   R.DS_CPF'
      '   CPF_RESPONSAVEL,'
      '   A.NM_PESSOA NOME,'
      '   R.NM_PESSOA RESPONSAVEL,'
      '   D.CODIGO'
      '   D.DESCRICAO'
      '   D.RAZAOSOCIAL'
      '   D.SN_ONLINE'
      '   D.CD_CAIXA'
      '   D.CD_COLIGADA'
      '   D.CD_BOLETO_PADRAO'
      '   D.DS_CNPJ'
      '   D.CD_BOLETO_ONLINE'
      '   C.NR_BANCO BANCO,'
      '   C.NM_BANCO,'
      '   C.NR_AGENCIA AGENCIA,'
      '   C.NR_CONTA CONTACORRENTE,'
      '   C.DS_MENSAGEM_BLOQUETO,'
      '   C.NR_USO_BANCO,'
      '   C.NR_CARTEIRA,'
      '   A.SN_BLOQUETO_EMPRESA,'
      '   A.CD_EMPRESA,'
      '   M.CD_MENSALIDADE,'
      '   A.CD_RESP_FINAN,'
      '   C.CD_CAIXA,'
      '   '#39'AA'#39' DS_GRUPO_BOLETO'
      'FROM'
      '   MENSALIDADES M'
      '      JOIN PESSOAS A ON'
      '         (M.CODIGOALUNO = A.CD_PESSOA)'
      '         JOIN PESSOAS R ON'
      '            (A.CD_RESP_FINAN = R.CD_PESSOA)'
      '      JOIN TURMAS T ON'
      '         (T.CODIGO = M.TURMA) AND'
      '         (T.ANOSEMESTRE = M.ANOSEMESTRE)'
      '      JOIN DEPARTAMENTOS D ON'
      '         (M.DEPTO = D.CODIGO)'
      '         JOIN FIN_CADASTRO_CONTAS C ON'
      
        '            ((C.CD_CAIXA = T.CD_CAIXA AND C.CD_COLIGADA = T.CD_C' +
        'OLIGADA) OR'
      '             (C.CD_CAIXA = D.CD_BOLETO_PADRAO AND'
      '              C.CD_COLIGADA = D.CD_COLIGADA AND'
      '              (T.CD_CAIXA = 0 OR T.CD_CAIXA IS NULL)))'
      'WHERE'
      '   C.SN_ATIVA = '#39'S'#39' AND'
      '   M.SITUACAO IN (2,10) AND'
      '   M.NOSSONUMERO = "XXXX"'
      'ORDER BY'
      '   M.CODIGOALUNO,'
      '   M.DATAVENCIMENTO,'
      '   M.VALORBRUTO DESC')
    Params = <>
    Left = 8
    Top = 8
  end
  object qryUpdate: TUMZQuery
    Connection = DM.db
    SQL.Strings = (
      'update mensalidades set bloqueto = :bloqueto'
      'where'
      'codigoAluno = :codigoAluno and'
      'parcela = :parcela and'
      'turma = :turma and'
      'datavencimento = :datavencimento')
    Params = <
      item
        DataType = ftBoolean
        Name = 'Bloqueto'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'CodigoAluno'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'Parcela'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'Turma'
        ParamType = ptUnknown
      end
      item
        DataType = ftDateTime
        Name = 'DataVencimento'
        ParamType = ptUnknown
      end>
    Left = 8
    Top = 48
    ParamData = <
      item
        DataType = ftBoolean
        Name = 'Bloqueto'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'CodigoAluno'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'Parcela'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'Turma'
        ParamType = ptUnknown
      end
      item
        DataType = ftDateTime
        Name = 'DataVencimento'
        ParamType = ptUnknown
      end>
  end
  object tblInserir: TUMZQuery
    Connection = DM.db
    SQL.Strings = (
      'INSERT INTO bloquetos '
      
        '(cd_aluno, nr_parcela, dt_vencimento, cd_turma, ds_agencia_ceden' +
        'te, '
      'ds_cod_numerico, ds_cod_barra, ds_banco, sn_bloqueto_empresa, '
      'nm_empresa, ds_cnpj, cd_mensalidade) '
      
        'VALUES (:cd_aluno, :nr_parcela, :dt_vencimento, :cd_turma, :ds_a' +
        'gencia_cedente, '
      
        ':ds_cod_numerico, :ds_cod_barra, :ds_banco, :sn_bloqueto_empresa' +
        ', '
      ':nm_empresa, :ds_cnpj, :cd_mensalidade )')
    Params = <
      item
        DataType = ftUnknown
        Name = 'cd_aluno'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'nr_parcela'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'dt_vencimento'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'cd_turma'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'ds_agencia_cedente'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'ds_cod_numerico'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'ds_cod_barra'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'ds_banco'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'sn_bloqueto_empresa'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'nm_empresa'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'ds_cnpj'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'cd_mensalidade'
        ParamType = ptUnknown
      end>
    Left = 48
    Top = 8
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'cd_aluno'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'nr_parcela'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'dt_vencimento'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'cd_turma'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'ds_agencia_cedente'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'ds_cod_numerico'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'ds_cod_barra'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'ds_banco'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'sn_bloqueto_empresa'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'nm_empresa'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'ds_cnpj'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'cd_mensalidade'
        ParamType = ptUnknown
      end>
  end
  object tblAux: TUMZQuery
    Connection = DM.db
    SQL.Strings = (
      'INSERT INTO bloquetos '
      
        '(cd_aluno, nr_parcela, dt_vencimento, cd_turma, ds_agencia_ceden' +
        'te, '
      'ds_cod_numerico, ds_cod_barra, ds_banco, sn_bloqueto_empresa, '
      'nm_empresa, ds_cnpj) '
      
        'VALUES (:cd_aluno, :nr_parcela, :dt_vencimento, :cd_turma, :ds_a' +
        'gencia_cedente, '
      
        ':ds_cod_numerico, :ds_cod_barra, :ds_banco, :sn_bloqueto_empresa' +
        ', '
      ':nm_empresa, :ds_cnpj )')
    Params = <
      item
        DataType = ftUnknown
        Name = 'cd_aluno'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'nr_parcela'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'dt_vencimento'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'cd_turma'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'ds_agencia_cedente'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'ds_cod_numerico'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'ds_cod_barra'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'ds_banco'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'sn_bloqueto_empresa'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'nm_empresa'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'ds_cnpj'
        ParamType = ptUnknown
      end>
    Left = 88
    Top = 8
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'cd_aluno'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'nr_parcela'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'dt_vencimento'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'cd_turma'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'ds_agencia_cedente'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'ds_cod_numerico'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'ds_cod_barra'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'ds_banco'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'sn_bloqueto_empresa'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'nm_empresa'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'ds_cnpj'
        ParamType = ptUnknown
      end>
  end
  object tblEmpresas: TUMZQuery
    Connection = DM.db
    SQL.Strings = (
      'select * from empresas where cd_empresa = :empresa')
    Params = <
      item
        DataType = ftUnknown
        Name = 'empresa'
        ParamType = ptUnknown
      end>
    Left = 48
    Top = 48
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'empresa'
        ParamType = ptUnknown
      end>
  end
  object tblBloquetosAgrupados: TUMZQuery
    Connection = DM.db
    SQL.Strings = (
      'INSERT INTO bloquetos '
      
        '(cd_aluno, nr_parcela, dt_vencimento, cd_turma, ds_agencia_ceden' +
        'te, '
      'ds_cod_numerico, ds_cod_barra, ds_banco, sn_bloqueto_empresa, '
      'nm_empresa, ds_cnpj) '
      
        'VALUES (:cd_aluno, :nr_parcela, :dt_vencimento, :cd_turma, :ds_a' +
        'gencia_cedente, '
      
        ':ds_cod_numerico, :ds_cod_barra, :ds_banco, :sn_bloqueto_empresa' +
        ', '
      ':nm_empresa, :ds_cnpj )')
    Params = <
      item
        DataType = ftUnknown
        Name = 'cd_aluno'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'nr_parcela'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'dt_vencimento'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'cd_turma'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'ds_agencia_cedente'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'ds_cod_numerico'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'ds_cod_barra'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'ds_banco'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'sn_bloqueto_empresa'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'nm_empresa'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'ds_cnpj'
        ParamType = ptUnknown
      end>
    Left = 128
    Top = 8
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'cd_aluno'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'nr_parcela'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'dt_vencimento'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'cd_turma'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'ds_agencia_cedente'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'ds_cod_numerico'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'ds_cod_barra'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'ds_banco'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'sn_bloqueto_empresa'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'nm_empresa'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'ds_cnpj'
        ParamType = ptUnknown
      end>
  end
  object tblAux2: TUMZQuery
    Connection = DM.db
    SQL.Strings = (
      'INSERT INTO bloquetos '
      
        '(cd_aluno, nr_parcela, dt_vencimento, cd_turma, ds_agencia_ceden' +
        'te, '
      'ds_cod_numerico, ds_cod_barra, ds_banco, sn_bloqueto_empresa, '
      'nm_empresa, ds_cnpj) '
      
        'VALUES (:cd_aluno, :nr_parcela, :dt_vencimento, :cd_turma, :ds_a' +
        'gencia_cedente, '
      
        ':ds_cod_numerico, :ds_cod_barra, :ds_banco, :sn_bloqueto_empresa' +
        ', '
      ':nm_empresa, :ds_cnpj )')
    Params = <
      item
        DataType = ftUnknown
        Name = 'cd_aluno'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'nr_parcela'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'dt_vencimento'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'cd_turma'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'ds_agencia_cedente'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'ds_cod_numerico'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'ds_cod_barra'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'ds_banco'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'sn_bloqueto_empresa'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'nm_empresa'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'ds_cnpj'
        ParamType = ptUnknown
      end>
    Left = 160
    Top = 56
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'cd_aluno'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'nr_parcela'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'dt_vencimento'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'cd_turma'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'ds_agencia_cedente'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'ds_cod_numerico'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'ds_cod_barra'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'ds_banco'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'sn_bloqueto_empresa'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'nm_empresa'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'ds_cnpj'
        ParamType = ptUnknown
      end>
  end
  object updMensalidade: TZUpdateSQL
    ModifySQL.Strings = (
      'UPDATE'
      '        MENSALIDADES'
      'SET'
      '        DATAVENCIMENTO = :DATAVENCIMENTO'
      'WHERE'
      '        CD_MENSALIDADE = :CD_MENSALIDADE')
    RefreshSQL.Strings = (
      '')
    UseSequenceFieldForRefreshSQL = False
    Left = 96
    Top = 64
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'DATAVENCIMENTO'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'CD_MENSALIDADE'
        ParamType = ptUnknown
      end>
  end
  object updMensalidadeBoleto: TZUpdateSQL
    ModifySQL.Strings = (
      'UPDATE'
      '        MENSALIDADES'
      'SET'
      '        DATAVENCIMENTO = :DATAVENCIMENTO,'
      '        CD_CAIXA = :CD_CAIXA,'
      '        CD_BOLETO = :CD_BOLETO,'
      '        NOSSONUMERO = :NOSSONUMERO'
      'WHERE'
      '        CD_MENSALIDADE = :CD_MENSALIDADE')
    RefreshSQL.Strings = (
      '')
    UseSequenceFieldForRefreshSQL = False
    Left = 128
    Top = 64
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'DATAVENCIMENTO'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'CD_CAIXA'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'CD_BOLETO'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'NOSSONUMERO'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'CD_MENSALIDADE'
        ParamType = ptUnknown
      end>
  end
end
