object DM: TDM
  OldCreateOrder = False
  OnCreate = DataModuleCreate
  OnDestroy = DataModuleDestroy
  Height = 579
  Width = 822
  object srcTipoPessoa: TDataSource
    Left = 168
    Top = 232
  end
  object db: TZConnection
    TransactIsolationLevel = tiReadCommitted
    BeforeDisconnect = dbBeforeDisconnect
    SQLHourGlass = True
    Left = 16
    Top = 8
  end
  object qyAux1: TUMZQuery
    Connection = db
    Params = <>
    Left = 392
    Top = 8
  end
  object qyAux2: TUMZQuery
    Connection = db
    Params = <>
    Left = 440
    Top = 8
  end
  object qyRS_VAR: TUMZQuery
    Connection = db
    SQL.Strings = (
      'SELECT ds_valor FROM parametros WHERE ds_variavel = :variavel'
      '')
    Params = <
      item
        DataType = ftUnknown
        Name = 'variavel'
        ParamType = ptUnknown
      end>
    UpdateMode = umUpdateAll
    Left = 512
    Top = 8
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'variavel'
        ParamType = ptUnknown
      end>
  end
  object qyMax: TUMZQuery
    Connection = db
    SQL.Strings = (
      'SELECT LAST_INSERT_ID(:cd) AS id FROM :tabela')
    Params = <
      item
        DataType = ftUnknown
        Name = 'cd'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'tabela'
        ParamType = ptUnknown
      end>
    UpdateMode = umUpdateAll
    Left = 16
    Top = 56
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'cd'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'tabela'
        ParamType = ptUnknown
      end>
  end
  object qyFeriados: TUMZQuery
    Connection = db
    SQL.Strings = (
      'select * from Feriados'
      'where DataFeriado = :Data'
      '')
    Params = <
      item
        DataType = ftUnknown
        Name = 'Data'
        ParamType = ptUnknown
      end>
    UpdateMode = umUpdateAll
    Left = 64
    Top = 56
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'Data'
        ParamType = ptUnknown
      end>
    object qyFeriadosdataferiado: TDateTimeField
      FieldName = 'dataferiado'
    end
    object qyFeriadosferiado: TStringField
      FieldName = 'feriado'
      Size = 30
    end
  end
  object qyLogs: TUMZQuery
    Connection = db
    AfterInsert = qyLogsAfterInsert
    SQL.Strings = (
      'SELECT'
      '   *'
      'FROM'
      '   logs_financeiro'
      'WHERE'
      '   cd_usuario = :cd_usuario'
      '')
    Params = <
      item
        DataType = ftUnknown
        Name = 'cd_usuario'
        ParamType = ptUnknown
      end>
    Left = 240
    Top = 56
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'cd_usuario'
        ParamType = ptUnknown
      end>
  end
  object qyLogsAcessos: TUMZQuery
    Connection = db
    AfterInsert = qyLogsAcessosAfterInsert
    SQL.Strings = (
      'SELECT'
      '   *'
      'FROM'
      '   logs_acessos'
      'WHERE'
      '   cd_usuario = :cd_usuario'
      '')
    Params = <
      item
        DataType = ftUnknown
        Name = 'cd_usuario'
        ParamType = ptUnknown
      end>
    UpdateMode = umUpdateAll
    Left = 312
    Top = 56
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'cd_usuario'
        ParamType = ptUnknown
      end>
    object qyLogsAcessoscd_modulo: TIntegerField
      FieldName = 'cd_modulo'
      Required = True
    end
    object qyLogsAcessosdt_log: TDateTimeField
      FieldName = 'dt_log'
      Required = True
    end
    object qyLogsAcessoshr_log: TTimeField
      FieldName = 'hr_log'
      Required = True
    end
    object qyLogsAcessoscd_usuario: TIntegerField
      FieldName = 'cd_usuario'
      Required = True
    end
    object qyLogsAcessossn_acessou: TStringField
      FieldName = 'sn_acessou'
      Size = 1
    end
    object qyLogsAcessossn_incluiu: TStringField
      FieldName = 'sn_incluiu'
      Size = 1
    end
    object qyLogsAcessossn_alterou: TStringField
      FieldName = 'sn_alterou'
      Size = 1
    end
    object qyLogsAcessossn_excluiu: TStringField
      FieldName = 'sn_excluiu'
      Size = 1
    end
  end
  object qyPessoas: TUMZQuery
    Connection = db
    SQL.Strings = (
      'SELECT cd_pessoa, nm_pessoa FROM pessoas')
    Params = <>
    UpdateMode = umUpdateAll
    Left = 24
    Top = 200
    object qyPessoascd_pessoa: TIntegerField
      FieldName = 'cd_pessoa'
      Required = True
    end
    object qyPessoasnm_pessoa: TStringField
      FieldName = 'nm_pessoa'
      Size = 60
    end
  end
  object qyAtividades: TUMZQuery
    Connection = db
    SQL.Strings = (
      'SELECT'
      '   *'
      'FROM'
      '   extra_atividades'
      'WHERE'
      '   nr_anosemestre = :nr_anosemestre'
      '')
    Params = <
      item
        DataType = ftUnknown
        Name = 'nr_anosemestre'
        ParamType = ptUnknown
      end>
    UpdateMode = umUpdateAll
    Left = 248
    Top = 184
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'nr_anosemestre'
        ParamType = ptUnknown
      end>
    object qyAtividadescd_atividade: TIntegerField
      FieldName = 'cd_atividade'
      Required = True
    end
    object qyAtividadesnr_anosemestre: TIntegerField
      FieldName = 'nr_anosemestre'
      Required = True
    end
    object qyAtividadescd_professor: TIntegerField
      FieldName = 'cd_professor'
      Required = True
    end
    object qyAtividadescd_tipo_titulo: TIntegerField
      FieldName = 'cd_tipo_titulo'
      Required = True
    end
    object qyAtividadescd_centro: TLargeintField
      FieldName = 'cd_centro'
    end
    object qyAtividadescd_coligada: TIntegerField
      FieldName = 'cd_coligada'
    end
    object qyAtividadesds_atividade: TStringField
      FieldName = 'ds_atividade'
      Size = 50
    end
    object qyAtividadesds_observacao: TMemoField
      FieldName = 'ds_observacao'
      BlobType = ftMemo
    end
    object qyAtividadesds_sigla: TStringField
      FieldName = 'ds_sigla'
    end
  end
  object qyPlanosDescontos: TUMZQuery
    Connection = db
    SQL.Strings = (
      'SELECT'
      '   *'
      'FROM'
      '   extra_plano_descontos'
      'WHERE'
      '   nr_anosemestre = :nr_anosemestre AND'
      '   qt_atividades = :qt_atividades AND'
      '   cd_tipo_pessoa = :cd_tipo_pessoa'
      '')
    Params = <
      item
        DataType = ftUnknown
        Name = 'nr_anosemestre'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'qt_atividades'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'cd_tipo_pessoa'
        ParamType = ptUnknown
      end>
    Left = 360
    Top = 184
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'nr_anosemestre'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'qt_atividades'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'cd_tipo_pessoa'
        ParamType = ptUnknown
      end>
    object qyPlanosDescontosnr_anosemestre: TIntegerField
      FieldName = 'nr_anosemestre'
      Required = True
    end
    object qyPlanosDescontosqt_atividades: TIntegerField
      FieldName = 'qt_atividades'
      Required = True
    end
    object qyPlanosDescontosvl_percentual: TFloatField
      FieldName = 'vl_percentual'
    end
    object qyPlanosDescontosvl_desconto: TFloatField
      FieldName = 'vl_desconto'
    end
    object qyPlanosDescontosvl_desconto_fixo: TFloatField
      FieldName = 'vl_desconto_fixo'
    end
    object qyPlanosDescontoscd_tipo_pessoa: TIntegerField
      FieldName = 'cd_tipo_pessoa'
      Required = True
    end
  end
  object qyAtividadesValores: TUMZQuery
    Connection = db
    SQL.Strings = (
      'SELECT'
      '   EVP.vl_atividade'
      'FROM'
      '   extra_atividades EA,'
      '   extra_valores_pessoas EVP'
      'WHERE'
      '   EVP.cd_atividade = EA.cd_atividade AND'
      '   EA.nr_anosemestre = :nr_anosemestre AND'
      '   EVP.cd_tipo_pessoa = :cd_tipo_pessoa AND'
      '   EA.cd_atividade = :cd_atividade'
      '')
    Params = <
      item
        DataType = ftUnknown
        Name = 'nr_anosemestre'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'cd_tipo_pessoa'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'cd_atividade'
        ParamType = ptUnknown
      end>
    UpdateMode = umUpdateAll
    Left = 352
    Top = 136
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'nr_anosemestre'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'cd_tipo_pessoa'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'cd_atividade'
        ParamType = ptUnknown
      end>
    object qyAtividadesValoresvl_atividade: TFloatField
      FieldName = 'vl_atividade'
    end
  end
  object qyAux: TUMZQuery
    Connection = db
    Params = <>
    Left = 544
    Top = 296
  end
  object qryAux: TUMZQuery
    Connection = db
    Params = <>
    Left = 552
    Top = 184
  end
  object qyParametrosUsuarios: TUMZQuery
    Connection = db
    SQL.Strings = (
      
        'SELECT :cd_usuario as cd_usuario, :ds_parametro as ds_parametro,' +
        ' :ds_valor as ds_valor FROM dual')
    Params = <
      item
        DataType = ftUnknown
        Name = 'cd_usuario'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'ds_parametro'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'ds_valor'
        ParamType = ptUnknown
      end>
    SQLList.Strings = (
      
        'mysql-5=REPLACE INTO usuarios_parametros '#13#10'   (cd_usuario,ds_par' +
        'ametro,ds_valor) '#13#10'VALUES'#13#10'   (:cd_usuario, :ds_parametro, :ds_v' +
        'alor)'
      
        'oracle=MERGE INTO usuarios_parametros up USING '#13#10'   (SELECT :cd_' +
        'usuario as cd_usuario, :ds_parametro as ds_parametro, :ds_valor ' +
        'as ds_valor FROM dual) up2 ON (up.cd_usuario = up2.cd_usuario AN' +
        'D up.ds_parametro = up2.ds_parametro) '#13#10'   WHEN MATCHED THEN '#13#10' ' +
        '     UPDATE SET up.ds_valor = up2.ds_valor '#13#10'   WHEN NOT MATCHED' +
        ' THEN '#13#10'      INSERT (up.cd_usuario, up.ds_parametro, up.ds_valo' +
        'r) VALUES (up2.cd_usuario, up2.ds_parametro, up2.ds_valor)')
    Left = 408
    Top = 57
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'cd_usuario'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'ds_parametro'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'ds_valor'
        ParamType = ptUnknown
      end>
  end
  object qryLogon: TUMZReadOnlyQuery
    Connection = db
    SQL.Strings = (
      'SELECT'
      '   CD_PESSOA,'
      '   DS_LOGIN,'
      '   DS_SENHA'
      'FROM'
      '   PESSOAS'
      'WHERE'
      '   (UPPER(DS_LOGIN) = :DS_LOGIN OR'
      '   CD_PESSOA = :DS_LOGIN) AND'
      '   DS_SENHA = MD5(:DS_SENHA)')
    Params = <
      item
        DataType = ftUnknown
        Name = 'DS_LOGIN'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'DS_SENHA'
        ParamType = ptUnknown
      end>
    SQLList.Strings = (
      
        'mysql-5=SELECT'#13#10'   CD_PESSOA,'#13#10'   DS_LOGIN,'#13#10'   DS_SENHA'#13#10'FROM'#13#10 +
        '   PESSOAS'#13#10'WHERE'#13#10'   (UPPER(DS_LOGIN) = :DS_LOGIN OR'#13#10'   CD_PES' +
        'SOA = :DS_LOGIN) AND'#13#10'   DS_SENHA = MD5(:DS_SENHA)'
      
        'oracle=SELECT'#13#10'   CD_PESSOA,'#13#10'   DS_LOGIN,'#13#10'   DS_SENHA'#13#10'FROM'#13#10' ' +
        '  PESSOAS'#13#10'WHERE'#13#10'   (UPPER(DS_LOGIN) = :DS_LOGIN OR'#13#10'   TO_CHAR' +
        '(CD_PESSOA) = :DS_LOGIN) AND'#13#10'   DS_SENHA = MD5(:DS_SENHA)')
    Left = 144
    Top = 304
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'DS_LOGIN'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'DS_SENHA'
        ParamType = ptUnknown
      end>
    object qryLogonCD_PESSOA: TIntegerField
      FieldName = 'CD_PESSOA'
    end
    object qryLogonDS_LOGIN: TStringField
      FieldName = 'DS_LOGIN'
      Size = 25
    end
    object qryLogonDS_SENHA: TStringField
      FieldName = 'DS_SENHA'
      Size = 32
    end
  end
  object qryPermissoes: TUMZReadOnlyQuery
    Connection = db
    SQL.Strings = (
      'SELECT'
      '   P.CD_PESSOA,'
      '   P.DS_LOGIN,'
      '   A.DS_CHAVE,'
      '   PR.NR_PERMISSAO,'
      '   GP.CD_COLIGADA,'
      '   A.DS_NOME_ACAO'
      'FROM'
      '   NU_MODULOS M'
      '      JOIN NU_MODULOS_ACOES A ON'
      '         (M.CD_MODULO = A.CD_MODULO)'
      '         JOIN NU_GRUPOS_PERMISSOES PR ON'
      '            (A.CD_ACAO = PR.CD_ACAO)'
      '            JOIN NU_GRUPOS_PESSOAS GP ON'
      '               (PR.CD_GRUPO = GP.CD_GRUPO)'
      '               JOIN PESSOAS P ON'
      '                  (GP.CD_PESSOA = P.CD_PESSOA)'
      'WHERE'
      '   M.DS_CHAVE = '#39'ExtraCurriculares'#39' AND'
      '   (UPPER(P.DS_LOGIN) = UPPER(:DS_LOGIN)'
      '    OR TO_CHAR(P.CD_PESSOA) = :DS_LOGIN)   ')
    Params = <
      item
        DataType = ftUnknown
        Name = 'DS_LOGIN'
        ParamType = ptUnknown
      end>
    SQLList.Strings = (
      
        'oracle=SELECT'#13#10'   P.CD_PESSOA,'#13#10'   P.DS_LOGIN,'#13#10'   A.DS_CHAVE,'#13#10 +
        '   PR.NR_PERMISSAO,'#13#10'   GP.CD_COLIGADA,'#13#10'   A.DS_NOME_ACAO'#13#10'FROM' +
        #13#10'   NU_MODULOS M'#13#10'      JOIN NU_MODULOS_ACOES A ON'#13#10'         (M' +
        '.CD_MODULO = A.CD_MODULO)'#13#10'         JOIN NU_GRUPOS_PERMISSOES PR' +
        ' ON'#13#10'            (A.CD_ACAO = PR.CD_ACAO)'#13#10'            JOIN NU_G' +
        'RUPOS_PESSOAS GP ON'#13#10'               (PR.CD_GRUPO = GP.CD_GRUPO)'#13 +
        #10'               JOIN PESSOAS P ON'#13#10'                  (GP.CD_PESS' +
        'OA = P.CD_PESSOA)'#13#10'WHERE'#13#10'   M.DS_CHAVE = '#39'ExtraCurriculares'#39' AN' +
        'D'#13#10'   (UPPER(P.DS_LOGIN) = UPPER(:DS_LOGIN)'#13#10'    OR TO_CHAR(P.CD' +
        '_PESSOA) = :DS_LOGIN)'
      
        'mysql-5=SELECT'#13#10'   P.CD_PESSOA,'#13#10'   P.DS_LOGIN,'#13#10'   A.DS_CHAVE,'#13 +
        #10'   PR.NR_PERMISSAO,'#13#10'   GP.CD_COLIGADA,'#13#10'   A.DS_NOME_ACAO'#13#10'FRO' +
        'M'#13#10'   NU_MODULOS M'#13#10'      JOIN NU_MODULOS_ACOES A ON'#13#10'         (' +
        'M.CD_MODULO = A.CD_MODULO)'#13#10'         JOIN NU_GRUPOS_PERMISSOES P' +
        'R ON'#13#10'            (A.CD_ACAO = PR.CD_ACAO)'#13#10'            JOIN NU_' +
        'GRUPOS_PESSOAS GP ON'#13#10'               (PR.CD_GRUPO = GP.CD_GRUPO)' +
        #13#10'               JOIN PESSOAS P ON'#13#10'                  (GP.CD_PES' +
        'SOA = P.CD_PESSOA)'#13#10'WHERE'#13#10'   M.DS_CHAVE = '#39'ExtraCurriculares'#39' A' +
        'ND'#13#10'   (UPPER(P.DS_LOGIN) = UPPER(:DS_LOGIN)'#13#10'    OR P.CD_PESSOA' +
        ' = :DS_LOGIN)')
    Left = 344
    Top = 312
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'DS_LOGIN'
        ParamType = ptUnknown
      end>
    object qryPermissoesCD_PESSOA: TIntegerField
      FieldName = 'CD_PESSOA'
      Required = True
    end
    object qryPermissoesDS_LOGIN: TStringField
      FieldName = 'DS_LOGIN'
      Size = 25
    end
    object qryPermissoesDS_CHAVE: TStringField
      FieldName = 'DS_CHAVE'
      Required = True
      Size = 50
    end
    object qryPermissoesNR_PERMISSAO: TIntegerField
      FieldName = 'NR_PERMISSAO'
      Required = True
    end
    object qryPermissoesCD_COLIGADA: TIntegerField
      FieldName = 'CD_COLIGADA'
      Required = True
    end
    object qryPermissoesDS_NOME_ACAO: TStringField
      FieldName = 'DS_NOME_ACAO'
      Required = True
      Size = 100
    end
  end
  object qryResgataPgtos: TUMZReadOnlyQuery
    Connection = db
    SQL.Strings = (
      'SELECT'
      '   NR_ANOSEMESTRE,'
      '   CD_PESSOA,'
      '   NR_MES,'
      '   MAX(DATAPAGAMENTO) DT_PAGAMENTO,'
      '   SUM(COALESCE(VALORPAGO, 0)) VL_PAGO'
      'FROM'
      '('
      'SELECT DISTINCT'
      '   MA.NR_ANOSEMESTRE,'
      '   MA.CD_PESSOA,'
      '   MA.NR_MES,'
      '   ME.DATAPAGAMENTO,'
      '   ME.VALORPAGO'
      'FROM'
      '   EXTRA_MATRICULAS_ATIVIDADES MA'
      '      JOIN MENSALIDADES ME ON'
      '         (MA.CD_MENSALIDADE = ME.CD_MENSALIDADE)'
      'WHERE'
      '   ME.DEPTO = :CD_DEPTO'
      ') A'
      'GROUP BY'
      '   NR_ANOSEMESTRE,'
      '   CD_PESSOA,'
      '   NR_MES')
    Params = <
      item
        DataType = ftUnknown
        Name = 'CD_DEPTO'
        ParamType = ptUnknown
      end>
    Left = 64
    Top = 368
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'CD_DEPTO'
        ParamType = ptUnknown
      end>
    object qryResgataPgtosNR_ANOSEMESTRE: TIntegerField
      FieldName = 'NR_ANOSEMESTRE'
      Required = True
    end
    object qryResgataPgtosCD_PESSOA: TIntegerField
      FieldName = 'CD_PESSOA'
      Required = True
    end
    object qryResgataPgtosNR_MES: TIntegerField
      FieldName = 'NR_MES'
      Required = True
    end
    object qryResgataPgtosDT_PAGAMENTO: TDateTimeField
      FieldName = 'DT_PAGAMENTO'
      ReadOnly = True
    end
    object qryResgataPgtosVL_PAGO: TFloatField
      FieldName = 'VL_PAGO'
      ReadOnly = True
    end
  end
  object qryExtraMatriculas: TUMZQuery
    Connection = db
    SQL.Strings = (
      'SELECT'
      '   CD_PESSOA,'
      '   NR_ANOSEMESTRE,'
      '   NR_MES,'
      '   VL_PAGO,'
      '   DT_PAGAMENTO'
      'FROM'
      '   EXTRA_MATRICULAS'
      'WHERE'
      '   NR_ANOSEMESTRE = :NR_ANOSEMESTRE AND'
      '   NR_MES = :NR_MES AND'
      '   CD_PESSOA = :CD_PESSOA')
    Params = <
      item
        DataType = ftUnknown
        Name = 'NR_ANOSEMESTRE'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'NR_MES'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'CD_PESSOA'
        ParamType = ptUnknown
      end>
    Left = 160
    Top = 360
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'NR_ANOSEMESTRE'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'NR_MES'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'CD_PESSOA'
        ParamType = ptUnknown
      end>
    object qryExtraMatriculasCD_PESSOA: TIntegerField
      FieldName = 'CD_PESSOA'
      Required = True
    end
    object qryExtraMatriculasNR_ANOSEMESTRE: TIntegerField
      FieldName = 'NR_ANOSEMESTRE'
      Required = True
    end
    object qryExtraMatriculasNR_MES: TIntegerField
      FieldName = 'NR_MES'
      Required = True
    end
    object qryExtraMatriculasVL_PAGO: TFloatField
      FieldName = 'VL_PAGO'
    end
    object qryExtraMatriculasDT_PAGAMENTO: TDateTimeField
      FieldName = 'DT_PAGAMENTO'
    end
  end
  object qryNNTurma: TUMZReadOnlyQuery
    Connection = db
    SQL.Strings = (
      'SELECT'
      '   CC.DS_NN_PREFIXO,'
      '   CC.NR_NN_ULTIMO'
      'FROM'
      '   FIN_CADASTRO_CONTAS CC'
      '      JOIN TURMAS T ON'
      '         (CC.CD_CAIXA = T.CD_CAIXA) AND'
      '         (CC.CD_COLIGADA = T.CD_COLIGADA)'
      'WHERE'
      '   T.CODIGO = :CD_TURMA AND'
      '   T.ANOSEMESTRE = :NR_ANOSEMESTRE')
    Params = <
      item
        DataType = ftUnknown
        Name = 'CD_TURMA'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'NR_ANOSEMESTRE'
        ParamType = ptUnknown
      end>
    Left = 440
    Top = 248
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'CD_TURMA'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'NR_ANOSEMESTRE'
        ParamType = ptUnknown
      end>
    object qryNNTurmaDS_NN_PREFIXO: TStringField
      FieldName = 'DS_NN_PREFIXO'
    end
    object qryNNTurmaNR_NN_ULTIMO: TIntegerField
      FieldName = 'NR_NN_ULTIMO'
    end
  end
  object qryNNDepto: TUMZReadOnlyQuery
    Connection = db
    SQL.Strings = (
      'SELECT'
      '   CC.DS_NN_PREFIXO,'
      '   CC.NR_NN_ULTIMO'
      'FROM'
      '   FIN_CADASTRO_CONTAS CC'
      '      JOIN DEPARTAMENTOS D ON'
      '         (CC.CD_CAIXA = D.CD_BOLETO_PADRAO) AND'
      '         (CC.CD_COLIGADA = D.CD_COLIGADA)'
      'WHERE'
      '   D.CODIGO = :CD_DEPTO')
    Params = <
      item
        DataType = ftUnknown
        Name = 'CD_DEPTO'
        ParamType = ptUnknown
      end>
    Left = 440
    Top = 304
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'CD_DEPTO'
        ParamType = ptUnknown
      end>
    object qryNNDeptoDS_NN_PREFIXO: TStringField
      FieldName = 'DS_NN_PREFIXO'
    end
    object qryNNDeptoNR_NN_ULTIMO: TIntegerField
      FieldName = 'NR_NN_ULTIMO'
    end
  end
  object qryNNUpd: TUMZQuery
    Connection = db
    SQL.Strings = (
      'UPDATE'
      '   FIN_CADASTRO_CONTAS'
      'SET'
      '   NR_NN_ULTIMO = :NR_NN_ULTIMO'
      'WHERE'
      '   DS_NN_PREFIXO = :DS_NN_PREFIXO')
    Params = <
      item
        DataType = ftUnknown
        Name = 'NR_NN_ULTIMO'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'DS_NN_PREFIXO'
        ParamType = ptUnknown
      end>
    Left = 440
    Top = 360
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'NR_NN_ULTIMO'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'DS_NN_PREFIXO'
        ParamType = ptUnknown
      end>
  end
  object qryUpdNN: TUMZQuery
    Connection = db
    SQL.Strings = (
      'UPDATE'
      '   FIN_CADASTRO_CONTAS'
      'SET'
      '   NR_NN_ULTIMO = :NR_NN_ULTIMO'
      'WHERE'
      '   DS_NN_PREFIXO = :DS_NN_PREFIXO')
    Params = <
      item
        DataType = ftUnknown
        Name = 'NR_NN_ULTIMO'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'DS_NN_PREFIXO'
        ParamType = ptUnknown
      end>
    Left = 440
    Top = 200
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'NR_NN_ULTIMO'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'DS_NN_PREFIXO'
        ParamType = ptUnknown
      end>
  end
  object startConn: TUMZStartConnection
    DefaultConnection = startConnDefaultConnection
    IniProps.SectionName = 'Conexao'
    IniProps.ProtocolIdent = 'Protocolo'
    IniProps.HostNameIdent = 'Servidor'
    IniProps.PortIdent = 'Porta'
    IniProps.DatabaseIdent = 'Banco'
    IniProps.StartDatabaseIdent = 'Start.Banco'
    IniProps.UserIdent = 'Usuario'
    IniProps.PasswordIdent = 'Senha'
    IniProps.ClientKeyIdent = 'Chave'
    Connection = db
    UnimestreUser = 'umsistema'
    Left = 64
    Top = 8
  end
  object sqlMonitor: TZSQLMonitor
    MaxTraceCount = 100
    OnLogTrace = sqlMonitorLogTrace
    Left = 120
    Top = 176
  end
end
