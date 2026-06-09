object DM: TDM
  OldCreateOrder = True
  OnCreate = DataModuleCreate
  OnDestroy = DataModuleDestroy
  Height = 487
  Width = 675
  object db: TZConnection
    Left = 16
    Top = 8
  end
  object qyUsuariosNome: TUMZQuery
    Connection = db
    SQL.Strings = (
      'select'
      #9'p.cd_usuario_pessoa,'
      #9'p.cd_pessoa CODIGO,'
      #9'CASE '
      '  '#9'WHEN (p.sn_bloqueado =1) THEN '#39'N'#39' '
      '    ELSE '#39'S'#39
      #9'END SN_ONLINE,'
      #9'CAST(UPPER(COALESCE(p.ds_login,p.cd_pessoa)) AS CHAR) NOME,'
      #9'p.ds_senha SENHA,'
      #9'CASE '
      '  '#9'WHEN (p.sn_bloqueado =1) THEN '#39'N'#39' '
      '    ELSE '#39'S'#39
      #9'END ONLINE,'
      #9'p.cd_pessoa'
      'FROM'
      #9'pessoas p'
      'WHERE'
      '  p.ds_login = :Nome'
      'GROUP BY'
      #9'p.cd_pessoa')
    Params = <
      item
        DataType = ftString
        Name = 'Nome'
        ParamType = ptUnknown
      end>
    Left = 240
    Top = 8
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
    Left = 160
    Top = 8
    object tbModulosCodigo: TSmallintField
      FieldName = 'Codigo'
    end
  end
  object qyUsuarios: TUMZQuery
    Connection = db
    SQL.Strings = (
      'select'
      #9'p.cd_usuario_pessoa,'
      #9'np.cd_pessoa CODIGO,'
      #9'CASE '
      
        '  '#9'WHEN (p.sn_bloqueado =1 || COALESCE(ngp.nr_permissao,0) = 0) ' +
        'THEN '#39'N'#39' '
      '    ELSE '#39'S'#39
      #9'END SN_ONLINE,'
      #9'CAST(UPPER(COALESCE(p.ds_login,p.cd_pessoa)) AS CHAR) NOME,'
      #9'p.ds_senha SENHA,'
      #9'CASE '
      
        '  '#9'WHEN (p.sn_bloqueado =1 || COALESCE(ngp.nr_permissao,0) = 0) ' +
        'THEN '#39'N'#39' '
      '    ELSE '#39'S'#39
      #9'END ONLINE,'
      #9'np.cd_pessoa CD_PESSOA'
      'FROM'
      #9'pessoas p'
      #9'LEFT JOIN nu_grupos_pessoas np ON (p.cd_pessoa = np.cd_pessoa)'
      
        #9'LEFT JOIN nu_modulos_acoes nma ON ( nma.ds_chave = '#39'1'#39' AND nma.' +
        'cd_modulo = (select cd_modulo from nu_modulos where ds_chave = '#39 +
        'Academico'#39'))'
      
        #9'LEFT JOIN nu_grupos_permissoes ngp ON (ngp.cd_acao = nma.cd_aca' +
        'o AND np.cd_grupo = ngp.cd_grupo)'
      'WHERE '
      #9'p.cd_usuario_pessoa is not null AND'
      '  p.cd_pessoa = :Codigo'
      'GROUP BY'
      #9'p.cd_pessoa;')
    Params = <
      item
        DataType = ftInteger
        Name = 'Codigo'
        ParamType = ptUnknown
      end>
    Left = 312
    Top = 8
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
      Size = 32
    end
    object qyUsuariosOnLine: TStringField
      FieldName = 'OnLine'
      Origin = 'WMESTRE12.Usuarios.OnLine'
      Size = 1
    end
  end
  object qyAux1: TUMZQuery
    Connection = db
    Params = <>
    Left = 400
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
      'SELECT ds_valor FROM parametros WHERE ds_variavel = :variavel')
    Params = <
      item
        DataType = ftUnknown
        Name = 'variavel'
        ParamType = ptUnknown
      end>
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
      'where DataFeriado = :Data')
    Params = <
      item
        DataType = ftDateTime
        Name = 'Data'
        ParamType = ptUnknown
      end>
    Left = 64
    Top = 56
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
  object qyModulosUsuarios: TUMZQuery
    Connection = db
    SQL.Strings = (
      'select * from modulosusuarios'
      
        'where codigousuario = :codigousuario and codigomodulo = :codigom' +
        'odulo')
    Params = <
      item
        DataType = ftUnknown
        Name = 'codigousuario'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'codigomodulo'
        ParamType = ptUnknown
      end>
    Left = 160
    Top = 56
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'codigousuario'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'codigomodulo'
        ParamType = ptUnknown
      end>
    object qyModulosUsuarioscodigousuario: TIntegerField
      FieldName = 'codigousuario'
      Origin = 'WMESTRE12.modulosusuarios.codigousuario'
    end
    object qyModulosUsuarioscodigomodulo: TSmallintField
      FieldName = 'codigomodulo'
      Origin = 'WMESTRE12.modulosusuarios.codigomodulo'
    end
    object qyModulosUsuariosincluir: TStringField
      FieldName = 'incluir'
      Origin = 'WMESTRE12.modulosusuarios.incluir'
      FixedChar = True
      Size = 1
    end
    object qyModulosUsuariosalterar: TStringField
      FieldName = 'alterar'
      Origin = 'WMESTRE12.modulosusuarios.alterar'
      FixedChar = True
      Size = 1
    end
    object qyModulosUsuariosdeletar: TStringField
      FieldName = 'deletar'
      Origin = 'WMESTRE12.modulosusuarios.deletar'
      FixedChar = True
      Size = 1
    end
    object qyModulosUsuariosacessar: TStringField
      FieldName = 'acessar'
      Origin = 'WMESTRE12.modulosusuarios.acessar'
      FixedChar = True
      Size = 1
    end
    object qyModulosUsuariosespecial: TStringField
      FieldName = 'especial'
      Origin = 'WMESTRE12.modulosusuarios.especial'
      FixedChar = True
      Size = 1
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
    Left = 240
    Top = 56
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
    Left = 312
    Top = 56
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
  object qyPessoas: TUMZQuery
    Connection = db
    SQL.Strings = (
      'SELECT cd_pessoa, nm_pessoa FROM pessoas'
      'WHERE cd_pessoa = :cd_pessoa')
    Params = <
      item
        DataType = ftUnknown
        Name = 'cd_pessoa'
        ParamType = ptUnknown
      end>
    Left = 24
    Top = 184
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'cd_pessoa'
        ParamType = ptUnknown
      end>
    object qyPessoascd_pessoa: TIntegerField
      FieldName = 'cd_pessoa'
      Origin = 'WMESTRE12.pessoas.cd_pessoa'
    end
    object qyPessoasnm_pessoa: TStringField
      FieldName = 'nm_pessoa'
      Origin = 'WMESTRE12.pessoas.nm_pessoa'
      Size = 60
    end
  end
  object qyTiposPessoa: TUMZQuery
    Connection = db
    SQL.Strings = (
      'SELECT'
      '   *'
      'FROM'
      '   extra_tipos_pessoas')
    Params = <>
    Left = 168
    Top = 184
    object qyTiposPessoacd_tipo_pessoa: TIntegerField
      FieldName = 'cd_tipo_pessoa'
      Origin = 'WMESTRE12.extra_tipos_pessoas.cd_tipo_pessoa'
    end
    object qyTiposPessoads_tipo_pessoa: TStringField
      FieldName = 'ds_tipo_pessoa'
      Origin = 'WMESTRE12.extra_tipos_pessoas.ds_tipo_pessoa'
      Size = 50
    end
    object qyTiposPessoads_observacao: TMemoField
      FieldName = 'ds_observacao'
      Origin = 'WMESTRE12.extra_tipos_pessoas.ds_observacao'
      BlobType = ftMemo
      Size = 1
    end
  end
  object srcTipoPessoa: TDataSource
    DataSet = qyTiposPessoa
    Left = 168
    Top = 232
  end
  object qyAtividades: TUMZQuery
    Connection = db
    SQL.Strings = (
      'SELECT'
      '   *'
      'FROM'
      '   extra_atividades'
      'WHERE'
      '   nr_anosemestre = :nr_anosemestre')
    Params = <
      item
        DataType = ftUnknown
        Name = 'nr_anosemestre'
        ParamType = ptUnknown
      end>
    Left = 272
    Top = 184
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'nr_anosemestre'
        ParamType = ptUnknown
      end>
    object qyAtividadescd_atividade: TIntegerField
      FieldName = 'cd_atividade'
      Origin = 'WMESTRE12.extra_atividades.cd_atividade'
    end
    object qyAtividadesnr_anosemestre: TIntegerField
      FieldName = 'nr_anosemestre'
      Origin = 'WMESTRE12.extra_atividades.nr_anosemestre'
    end
    object qyAtividadescd_professor: TIntegerField
      FieldName = 'cd_professor'
      Origin = 'WMESTRE12.extra_atividades.cd_professor'
    end
    object qyAtividadesds_atividade: TStringField
      FieldName = 'ds_atividade'
      Origin = 'WMESTRE12.extra_atividades.ds_atividade'
      Size = 50
    end
    object qyAtividadesds_observacao: TMemoField
      FieldName = 'ds_observacao'
      Origin = 'WMESTRE12.extra_atividades.ds_observacao'
      BlobType = ftMemo
      Size = 1
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
      '   qt_atividades = :qt_atividades')
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
      end>
    object qyPlanosDescontosnr_anosemestre: TIntegerField
      FieldName = 'nr_anosemestre'
      Origin = 'WMESTRE12.extra_plano_descontos.nr_anosemestre'
    end
    object qyPlanosDescontosqt_atividades: TIntegerField
      FieldName = 'qt_atividades'
      Origin = 'WMESTRE12.extra_plano_descontos.qt_atividades'
    end
    object qyPlanosDescontosvl_percentual: TFloatField
      FieldName = 'vl_percentual'
      Origin = 'WMESTRE12.extra_plano_descontos.vl_percentual'
    end
    object qyPlanosDescontosvl_desconto: TFloatField
      FieldName = 'vl_desconto'
      Origin = 'WMESTRE12.extra_plano_descontos.vl_desconto'
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
      '   EA.cd_atividade = :cd_atividade')
    Params = <
      item
        DataType = ftString
        Name = 'nr_anosemestre'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'cd_tipo_pessoa'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'cd_atividade'
        ParamType = ptUnknown
      end>
    Left = 464
    Top = 184
    ParamData = <
      item
        DataType = ftString
        Name = 'nr_anosemestre'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
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
      Origin = 'WMESTRE12.extra_valores_pessoas.vl_atividade'
    end
  end
  object qyAux3: TUMZQuery
    Connection = db
    Params = <>
    Left = 432
    Top = 56
  end
  object qryPermissoes: TUMZReadOnlyQuery
    Connection = db
    SortType = stDescending
    SQL.Strings = (
      'SELECT * FROM'
      '('
      '   SELECT'
      '      G.CD_GRUPO,'
      '      G.DS_NOME_GRUPO,'
      '      GP.CD_COLIGADA,'
      '      P.DS_LOGIN,'
      '      P.DS_SENHA,'
      '      P.CD_PESSOA,'
      '      PERM.NR_PERMISSAO,'
      '      A.DS_CHAVE DS_CHAVE_ACAO,'
      '      A.DS_NOME_ACAO,'
      '      M.DS_NOME_MODULO,'
      '      M.DS_CHAVE DS_CHAVE_MODULO'
      '   FROM'
      '      PESSOAS P'
      '      INNER JOIN NU_GRUPOS_PESSOAS GP ON'
      '            (P.CD_PESSOA = GP.CD_PESSOA)'
      '      INNER JOIN NU_GRUPOS G ON'
      '               (GP.CD_GRUPO = G.CD_GRUPO)'
      '      INNER JOIN NU_GRUPOS_PERMISSOES PERM ON'
      '                  (G.CD_GRUPO = PERM.CD_GRUPO)'
      '      INNER JOIN NU_MODULOS_ACOES A ON'
      '                     (PERM.CD_ACAO = A.CD_ACAO)'
      '      INNER JOIN NU_MODULOS M ON'
      '                        (A.CD_MODULO = M.CD_MODULO)'
      '   WHERE'
      '     P.CD_PESSOA = :cd_pessoa'
      ')   tbl'
      'WHERE'
      '1=1')
    Params = <
      item
        DataType = ftUnknown
        Name = 'cd_pessoa'
        ParamType = ptUnknown
      end>
    Left = 512
    Top = 112
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'cd_pessoa'
        ParamType = ptUnknown
      end>
    object qryPermissoesCD_GRUPO: TIntegerField
      FieldName = 'CD_GRUPO'
    end
    object qryPermissoesDS_NOME_GRUPO: TStringField
      FieldName = 'DS_NOME_GRUPO'
      Size = 50
    end
    object qryPermissoesCD_COLIGADA: TIntegerField
      FieldName = 'CD_COLIGADA'
      Required = True
    end
    object qryPermissoesDS_LOGIN: TStringField
      FieldName = 'DS_LOGIN'
      Size = 25
    end
    object qryPermissoesDS_SENHA: TStringField
      FieldName = 'DS_SENHA'
      Size = 32
    end
    object qryPermissoesCD_PESSOA: TIntegerField
      FieldName = 'CD_PESSOA'
    end
    object qryPermissoesNR_PERMISSAO: TIntegerField
      FieldName = 'NR_PERMISSAO'
    end
    object qryPermissoesDS_NOME_ACAO: TStringField
      FieldName = 'DS_NOME_ACAO'
      Size = 100
    end
    object qryPermissoesDS_NOME_MODULO: TStringField
      FieldName = 'DS_NOME_MODULO'
      Size = 100
    end
    object qryPermissoesDS_CHAVE_ACAO: TStringField
      FieldName = 'DS_CHAVE_ACAO'
      Size = 50
    end
    object qryPermissoesDS_CHAVE_MODULO: TStringField
      FieldName = 'DS_CHAVE_MODULO'
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
    Left = 128
    Top = 136
  end
  object sqlMonitor: TZSQLMonitor
    MaxTraceCount = 100
    OnLogTrace = sqlMonitorLogTrace
    Left = 384
    Top = 128
  end
end
