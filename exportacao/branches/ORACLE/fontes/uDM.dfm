object DM: TDM
  OldCreateOrder = False
  OnCreate = DataModuleCreate
  OnDestroy = DataModuleDestroy
  Height = 378
  Width = 533
  object ZConn: TZConnection
    Protocol = 'mysql-5'
    Properties.Strings = (
      'Database=unimestre')
    Left = 8
    Top = 8
  end
  object qyQuantidade: TUMZQuery
    Connection = ZConn
    Params = <>
    Left = 120
    Top = 8
  end
  object qyLastInsert: TUMZQuery
    Connection = ZConn
    Params = <>
    Left = 120
    Top = 64
  end
  object qyModulosUsuarios: TUMZQuery
    Connection = ZConn
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
    Left = 448
    Top = 16
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
    end
    object qyModulosUsuarioscodigomodulo: TSmallintField
      FieldName = 'codigomodulo'
    end
    object qyModulosUsuariosincluir: TStringField
      FieldName = 'incluir'
      Size = 1
    end
    object qyModulosUsuariosalterar: TStringField
      FieldName = 'alterar'
      Size = 1
    end
    object qyModulosUsuariosdeletar: TStringField
      FieldName = 'deletar'
      Size = 1
    end
    object qyModulosUsuariosacessar: TStringField
      FieldName = 'acessar'
      Size = 1
    end
    object qyModulosUsuariosespecial: TStringField
      FieldName = 'especial'
      Size = 1
    end
  end
  object qyUsuarios: TUMZQuery
    Connection = ZConn
    SQL.Strings = (
      'select cd_pessoa AS codigo, nm_pessoa as nome from pessoas'
      'where cd_pessoa = :codigo')
    Params = <
      item
        DataType = ftUnknown
        Name = 'codigo'
        ParamType = ptUnknown
      end>
    Left = 448
    Top = 72
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'codigo'
        ParamType = ptUnknown
      end>
    object qyUsuarioscodigo: TIntegerField
      FieldName = 'codigo'
    end
    object qyUsuariosnome2: TStringField
      FieldName = 'nome'
      Size = 30
    end
    object qyUsuariossenha: TStringField
      FieldName = 'senha'
      Size = 32
    end
    object qyUsuariosonline: TStringField
      FieldName = 'online'
      Size = 1
    end
  end
  object qyAux: TUMZQuery
    Connection = ZConn
    Params = <>
    Left = 8
    Top = 184
  end
  object qyUsuariosNome: TUMZQuery
    Connection = ZConn
    SQL.Strings = (
      'select'
      #9'np.cd_pessoa CODIGO,'
      #9'CAST(UPPER(COALESCE(p.ds_login,p.cd_pessoa)) AS CHAR) NOME,'
      #9'p.ds_senha SENHA,'
      #9'CASE'
      
        '  '#9'WHEN (p.sn_bloqueado =1 || COALESCE( MAX(ngp.nr_permissao) ,0' +
        ') = 0) THEN '#39'N'#39
      '    ELSE '#39'S'#39
      #9'END ONLINE'
      'FROM'
      #9'pessoas as p'
      
        #9'LEFT JOIN nu_grupos_pessoas as np ON (p.cd_pessoa = np.cd_pesso' +
        'a)'
      
        #9'LEFT JOIN nu_modulos_acoes as nma ON ( nma.ds_chave = '#39'12000'#39' A' +
        'ND nma.cd_modulo = (select cd_modulo from nu_modulos where ds_ch' +
        'ave = '#39'Exportacao'#39'))'
      
        #9'LEFT JOIN nu_grupos_permissoes as ngp ON (ngp.cd_acao = nma.cd_' +
        'acao AND np.cd_grupo = ngp.cd_grupo)'
      'WHERE'
      '                p.ds_login = :nome'
      'GROUP BY'
      #9'p.cd_pessoa;')
    Params = <
      item
        DataType = ftUnknown
        Name = 'Nome'
        ParamType = ptUnknown
      end>
    Properties.Strings = (
      'select * from usuarios'
      'where nome = :nome')
    Left = 448
    Top = 128
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'Nome'
        ParamType = ptUnknown
      end>
    object qyUsuariosNomecodigo: TIntegerField
      FieldName = 'codigo'
    end
    object qyUsuariosNomenome: TStringField
      FieldName = 'nome'
      Size = 30
    end
    object qyUsuariosNomesenha: TStringField
      FieldName = 'senha'
      Size = 32
    end
    object qyUsuariosNomeonline: TStringField
      FieldName = 'online'
      Size = 1
    end
  end
  object qyRAux: TUMZQuery
    Connection = ZConn
    Params = <>
    Left = 8
    Top = 248
  end
  object qyRAux2: TUMZQuery
    Connection = ZConn
    Params = <>
    Left = 16
    Top = 312
  end
  object qryPermissoes: TUMZReadOnlyQuery
    Connection = ZConn
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
    Left = 312
    Top = 208
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
    Connection = ZConn
    UnimestreUser = 'umsistema'
    Left = 360
    Top = 312
  end
  object sqlMonitor: TZSQLMonitor
    MaxTraceCount = 100
    OnLogTrace = sqlMonitorLogTrace
    Left = 192
    Top = 232
  end
end
