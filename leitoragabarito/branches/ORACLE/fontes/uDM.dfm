object DM: TDM
  OldCreateOrder = True
  OnCreate = DataModuleCreate
  OnDestroy = DataModuleDestroy
  Height = 421
  Width = 513
  object db: TZConnection
    Properties.Strings = (
      'CLIENT_MULTI_STATEMENTS=1'
      'CLIENT_MULTI_RESULTS=1')
    TransactIsolationLevel = tiReadCommitted
    Left = 16
    Top = 8
  end
  object qyUsuariosNome: TUMZQuery
    Connection = db
    SQL.Strings = (
      'SELECT'
      '  cd_pessoa AS codigo,'
      '  ds_login AS nome,'
      '  ds_senha AS senha,'
      '  CAST(CASE WHEN sn_bloqueado = 1 THEN'
      '    '#39'N'#39
      '  ELSE'
      '    '#39'S'#39
      '  END AS CHAR) AS Online'
      'FROM'
      '  pessoas'
      'WHERE'
      '  ds_login = :Nome')
    Params = <
      item
        DataType = ftString
        Name = 'Nome'
        ParamType = ptUnknown
      end>
    Left = 256
    Top = 128
    ParamData = <
      item
        DataType = ftString
        Name = 'Nome'
        ParamType = ptUnknown
      end>
    object qyUsuariosNomeCodigo: TIntegerField
      FieldName = 'Codigo'
      Origin = 'Usuarios.Codigo'
    end
    object qyUsuariosNomeNome: TStringField
      FieldName = 'Nome'
      Origin = 'Usuarios.Nome'
      Size = 30
    end
    object qyUsuariosNomeSenha: TStringField
      FieldName = 'Senha'
      Origin = 'Usuarios.Senha'
      Size = 32
    end
    object qyUsuariosNomeOnLine: TStringField
      FieldName = 'OnLine'
      Origin = 'Usuarios.OnLine'
    end
  end
  object tbModulos: TZTable
    Connection = db
    ReadOnly = True
    TableName = 'Modulos'
    Left = 64
    Top = 240
    object tbModulosCodigo: TSmallintField
      FieldName = 'Codigo'
    end
  end
  object qyUsuarios: TUMZQuery
    Connection = db
    SQL.Strings = (
      'select * from Usuarios'
      'where Codigo = :Codigo')
    Params = <
      item
        DataType = ftInteger
        Name = 'Codigo'
        ParamType = ptUnknown
      end>
    Left = 256
    Top = 72
    ParamData = <
      item
        DataType = ftInteger
        Name = 'Codigo'
        ParamType = ptUnknown
      end>
    object qyUsuariosCodigo: TIntegerField
      FieldName = 'Codigo'
      Origin = 'Usuarios.Codigo'
    end
    object qyUsuariosNome2: TStringField
      FieldName = 'Nome'
      Origin = 'Usuarios.Nome'
      Size = 30
    end
    object qyUsuariosSenha: TStringField
      FieldName = 'Senha'
      Origin = 'Usuarios.Senha'
      Size = 10
    end
    object qyUsuariosOnLine: TStringField
      FieldName = 'OnLine'
      Origin = 'WMESTRE12.Usuarios.OnLine'
      Size = 1
    end
  end
  object qyAux: TUMZQuery
    Connection = db
    SQL.Strings = (
      'SELECT ds_valor FROM parametros WHERE ds_variavel = :variavel')
    Params = <
      item
        DataType = ftUnknown
        Name = 'variavel'
        ParamType = ptUnknown
      end>
    Left = 64
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
    Left = 64
    Top = 128
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
      'where DataFeriado = :Data')
    Params = <
      item
        DataType = ftDateTime
        Name = 'Data'
        ParamType = ptUnknown
      end>
    Left = 64
    Top = 72
    ParamData = <
      item
        DataType = ftDateTime
        Name = 'Data'
        ParamType = ptUnknown
      end>
    object qyFeriadosDataFeriado: TDateTimeField
      FieldName = 'DataFeriado'
      Origin = 'Feriados.DataFeriado'
    end
    object qyFeriadosFeriado: TStringField
      FieldName = 'Feriado'
      Origin = 'Feriados.Feriado'
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
      '   cd_usuario = :cd_usuario')
    Params = <
      item
        DataType = ftString
        Name = 'cd_usuario'
        ParamType = ptUnknown
      end>
    Left = 160
    Top = 72
    ParamData = <
      item
        DataType = ftString
        Name = 'cd_usuario'
        ParamType = ptUnknown
      end>
    object qyLogscd_modulo: TIntegerField
      FieldName = 'cd_modulo'
      Origin = 'WMESTRE12.logs_financeiro.cd_modulo'
    end
    object qyLogsdt_log: TDateTimeField
      FieldName = 'dt_log'
      Origin = 'WMESTRE12.logs_financeiro.dt_log'
    end
    object qyLogshr_log: TTimeField
      FieldName = 'hr_log'
      Origin = 'WMESTRE12.logs_financeiro.hr_log'
    end
    object qyLogscd_usuario: TIntegerField
      FieldName = 'cd_usuario'
      Origin = 'WMESTRE12.logs_financeiro.cd_usuario'
    end
    object qyLogscd_titulo: TIntegerField
      FieldName = 'cd_titulo'
      Origin = 'WMESTRE12.logs_financeiro.cd_titulo'
    end
    object qyLogscd_caixa: TIntegerField
      FieldName = 'cd_caixa'
      Origin = 'WMESTRE12.logs_financeiro.cd_caixa'
    end
    object qyLogsdt_movimento: TDateTimeField
      FieldName = 'dt_movimento'
      Origin = 'WMESTRE12.logs_financeiro.dt_movimento'
    end
    object qyLogsnr_sequencia: TIntegerField
      FieldName = 'nr_sequencia'
      Origin = 'WMESTRE12.logs_financeiro.nr_sequencia'
    end
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
      '   cd_usuario = :cd_usuario')
    Params = <
      item
        DataType = ftString
        Name = 'cd_usuario'
        ParamType = ptUnknown
      end>
    Left = 160
    Top = 120
    ParamData = <
      item
        DataType = ftString
        Name = 'cd_usuario'
        ParamType = ptUnknown
      end>
    object qyLogsAcessoscd_modulo: TIntegerField
      FieldName = 'cd_modulo'
      Origin = 'WMESTRE12.logs_financeiro_acessos.cd_modulo'
    end
    object qyLogsAcessosdt_log: TDateTimeField
      FieldName = 'dt_log'
      Origin = 'WMESTRE12.logs_acessos.dt_log'
    end
    object qyLogsAcessoshr_log: TTimeField
      FieldName = 'hr_log'
      Origin = 'WMESTRE12.logs_acessos.hr_log'
    end
    object qyLogsAcessoscd_usuario: TIntegerField
      FieldName = 'cd_usuario'
      Origin = 'WMESTRE12.logs_financeiro_acessos.cd_usuario'
    end
    object qyLogsAcessossn_acessou: TStringField
      FieldName = 'sn_acessou'
      Origin = 'WMESTRE12.logs_financeiro_acessos.sn_acessou'
      FixedChar = True
      Size = 1
    end
    object qyLogsAcessossn_incluiu: TStringField
      FieldName = 'sn_incluiu'
      Origin = 'WMESTRE12.logs_financeiro_acessos.sn_incluiu'
      FixedChar = True
      Size = 1
    end
    object qyLogsAcessossn_alterou: TStringField
      FieldName = 'sn_alterou'
      Origin = 'WMESTRE12.logs_financeiro_acessos.sn_alterou'
      FixedChar = True
      Size = 1
    end
    object qyLogsAcessossn_excluiu: TStringField
      FieldName = 'sn_excluiu'
      Origin = 'WMESTRE12.logs_financeiro_acessos.sn_excluiu'
      FixedChar = True
      Size = 1
    end
  end
  object qyAux2: TUMZQuery
    Connection = db
    Params = <>
    Left = 112
    Top = 8
  end
  object qyAux3: TUMZQuery
    Connection = db
    Params = <>
    Left = 160
    Top = 8
  end
  object qyAux4: TUMZQuery
    Connection = db
    Params = <>
    Left = 208
    Top = 8
  end
  object qyAux5: TUMZQuery
    Connection = db
    Params = <>
    Left = 256
    Top = 8
  end
  object qyAlunosRespostasSituacoes: TUMZQuery
    Connection = db
    SQL.Strings = (
      'SELECT'
      '   *'
      'FROM'
      '   leitora_provas_alunos_resp_sit')
    Params = <>
    Left = 256
    Top = 240
    object qyAlunosRespostasSituacoescd_situacao: TSmallintField
      FieldName = 'cd_situacao'
      Origin = 'WMESTRE12.leitora_provas_alunos_resp_sit.cd_situacao'
    end
    object qyAlunosRespostasSituacoesds_situacao: TStringField
      FieldName = 'ds_situacao'
      Origin = 'WMESTRE12.leitora_provas_alunos_resp_sit.ds_situacao'
      Size = 50
    end
  end
  object qyLastInsert: TUMZQuery
    Connection = db
    SQL.Strings = (
      'SELECT ds_valor FROM parametros WHERE ds_variavel = :variavel')
    Params = <
      item
        DataType = ftUnknown
        Name = 'variavel'
        ParamType = ptUnknown
      end>
    Left = 64
    Top = 184
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'variavel'
        ParamType = ptUnknown
      end>
  end
  object qyPermissoes: TUMZQuery
    Connection = db
    SQL.Strings = (
      'SELECT'
      '   G.CD_GRUPO,'
      '   G.DS_NOME_GRUPO,'
      '   GP.CD_COLIGADA,'
      '   P.DS_LOGIN,'
      '   P.DS_SENHA,'
      '   P.CD_PESSOA,'
      '   PERM.NR_PERMISSAO,'
      '   A.DS_CHAVE DS_CHAVE_ACAO,'
      '   A.DS_NOME_ACAO,'
      '   M.DS_NOME_MODULO,'
      '   M.DS_CHAVE DS_CHAVE_MODULO'
      'FROM'
      '   PESSOAS P'
      '      LEFT JOIN NU_GRUPOS_PESSOAS GP ON'
      '         (P.CD_PESSOA = GP.CD_PESSOA)'
      '         LEFT JOIN NU_GRUPOS G ON'
      '            (GP.CD_GRUPO = G.CD_GRUPO)'
      '            LEFT JOIN NU_GRUPOS_PERMISSOES PERM ON'
      '               (G.CD_GRUPO = PERM.CD_GRUPO)'
      '               LEFT JOIN NU_MODULOS_ACOES A ON'
      '                  (PERM.CD_ACAO = A.CD_ACAO)'
      '                  LEFT JOIN NU_MODULOS M ON'
      '                     (A.CD_MODULO = M.CD_MODULO)'
      'WHERE'
      '   P.DS_LOGIN = :DS_LOGIN OR'
      '   P.CD_PESSOA = :DS_LOGIN')
    Params = <
      item
        DataType = ftUnknown
        Name = 'DS_LOGIN'
        ParamType = ptUnknown
      end>
    Left = 256
    Top = 184
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'DS_LOGIN'
        ParamType = ptUnknown
      end>
    object qyPermissoesCD_GRUPO: TIntegerField
      FieldName = 'CD_GRUPO'
      Required = True
    end
    object qyPermissoesDS_NOME_GRUPO: TStringField
      FieldName = 'DS_NOME_GRUPO'
      Required = True
      Size = 50
    end
    object qyPermissoesCD_COLIGADA: TIntegerField
      FieldName = 'CD_COLIGADA'
      Required = True
    end
    object qyPermissoesDS_LOGIN: TStringField
      FieldName = 'DS_LOGIN'
      Size = 25
    end
    object qyPermissoesDS_SENHA: TStringField
      FieldName = 'DS_SENHA'
      Size = 32
    end
    object qyPermissoesCD_PESSOA: TIntegerField
      FieldName = 'CD_PESSOA'
      Required = True
    end
    object qyPermissoesNR_PERMISSAO: TIntegerField
      FieldName = 'NR_PERMISSAO'
      Required = True
    end
    object qyPermissoesDS_CHAVE_ACAO: TStringField
      FieldName = 'DS_CHAVE_ACAO'
      Required = True
      Size = 50
    end
    object qyPermissoesDS_NOME_ACAO: TStringField
      FieldName = 'DS_NOME_ACAO'
      Required = True
      Size = 100
    end
    object qyPermissoesDS_NOME_MODULO: TStringField
      FieldName = 'DS_NOME_MODULO'
      Required = True
      Size = 100
    end
    object qyPermissoesDS_CHAVE_MODULO: TStringField
      FieldName = 'DS_CHAVE_MODULO'
      Required = True
      Size = 50
    end
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
    Top = 288
  end
  object sqlMonitor: TZSQLMonitor
    MaxTraceCount = 100
    OnLogTrace = sqlMonitorLogTrace
    Left = 360
    Top = 16
  end
  object qryInsertAlunoProva: TUMZQuery
    Connection = db
    SQL.Strings = (
      
        'INSERT INTO diario_provas_alunos ( cd_pessoa, cd_turma, nr_anose' +
        'm, cd_disciplina, cd_bimestre, nr_prova, vl_nota ) '
      'SELECT'
      
        #9'f.codigoaluno, p.turma, p.anosemestre, p.disciplina, p.bimestre' +
        ', p.nro_nota, null'
      'FROM'
      #9'fichaindividual f'
      
        #9'INNER JOIN diario_provas p ON (f.turma = p.turma AND f.discipli' +
        'na = p.disciplina and f.anosemestre = p.anosemestre)'
      #9'LEFT JOIN diario_provas_alunos a ON '
      #9'('
      #9#9'p.turma = a.cd_turma AND'
      #9#9'p.anosemestre = a. nr_anosem AND'
      #9#9'p.disciplina = a.cd_disciplina AND'
      #9#9'p.bimestre = a.cd_bimestre AND'
      #9#9'p.nro_nota = a.nr_prova AND'
      #9#9'f.codigoaluno = a.cd_pessoa'
      #9')'
      'WHERE'
      #9'f.turma = :turma'
      #9'AND f.anosemestre = :anosem'
      #9'AND f.disciplina = :disciplina '
      #9'AND p.bimestre = :bimestre'
      #9'AND A.cd_pessoa is null')
    Params = <
      item
        DataType = ftUnknown
        Name = 'turma'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'anosem'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'disciplina'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'bimestre'
        ParamType = ptUnknown
      end>
    Left = 360
    Top = 72
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'turma'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'anosem'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'disciplina'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'bimestre'
        ParamType = ptUnknown
      end>
  end
end
