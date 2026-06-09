object DM: TDM
  OldCreateOrder = False
  OnCreate = DataModuleCreate
  OnDestroy = DataModuleDestroy
  Height = 511
  Width = 705
  object conn: TZConnection
    Properties.Strings = (
      'CLIENT_MULTI_STATEMENTS=1'
      'CLIENT_MULTI_RESULTS=1')
    TransactIsolationLevel = tiReadCommitted
    Left = 80
    Top = 48
  end
  object qryUsuario: TUMZReadOnlyQuery
    Connection = conn
    Filtered = True
    SQL.Strings = (
      'SELECT'
      '   P.CD_PESSOA,'
      '   P.NM_PESSOA,'
      '   P.DS_LOGIN,'
      '   R.NR_PERMISSAO,'
      '   A.DS_CHAVE DS_CHAVE_ACAO,'
      '   M.DS_CHAVE DS_CHAVE_MODULO'
      'FROM'
      '   PESSOAS P'
      '      JOIN NU_GRUPOS_PESSOAS G ON'
      '         (P.CD_PESSOA = G.CD_PESSOA)'
      '      JOIN NU_GRUPOS_PERMISSOES R ON'
      '         (G.CD_GRUPO = R.CD_GRUPO)'
      '         JOIN NU_MODULOS_ACOES A ON'
      '            (R.CD_ACAO = A.CD_ACAO)'
      '            JOIN NU_MODULOS M ON'
      '               (A.CD_MODULO = M.CD_MODULO)'
      'WHERE'
      '   ('
      '   UPPER(P.DS_LOGIN) = UPPER(:DS_LOGIN) OR'
      '   P.CD_PESSOA = :DS_LOGIN'
      '   )'
      '   AND'
      '   M.DS_CHAVE = '#39'ProvaOnline'#39)
    Params = <
      item
        DataType = ftUnknown
        Name = 'DS_LOGIN'
        ParamType = ptUnknown
      end>
    SQLList.Strings = (
      
        'mysql-5=SELECT'#13#10'   P.CD_PESSOA,'#13#10'   P.NM_PESSOA,'#13#10'   P.DS_LOGIN,' +
        #13#10'   R.NR_PERMISSAO,'#13#10'   A.DS_CHAVE DS_CHAVE_ACAO,'#13#10'   M.DS_CHAV' +
        'E DS_CHAVE_MODULO'#13#10'FROM'#13#10'   PESSOAS P'#13#10'      JOIN NU_GRUPOS_PESS' +
        'OAS G ON'#13#10'         (P.CD_PESSOA = G.CD_PESSOA)'#13#10'      JOIN NU_GR' +
        'UPOS_PERMISSOES R ON'#13#10'         (G.CD_GRUPO = R.CD_GRUPO)'#13#10'      ' +
        '   JOIN NU_MODULOS_ACOES A ON'#13#10'            (R.CD_ACAO = A.CD_ACA' +
        'O)'#13#10'            JOIN NU_MODULOS M ON'#13#10'               (A.CD_MODUL' +
        'O = M.CD_MODULO)'#13#10'WHERE'#13#10'   ('#13#10'   UPPER(P.DS_LOGIN) = UPPER(:DS_' +
        'LOGIN) OR'#13#10'   P.CD_PESSOA = :DS_LOGIN'#13#10'   )'#13#10'   AND'#13#10'   M.DS_CHA' +
        'VE = '#39'ProvaOnline'#39
      
        'oracle=SELECT'#13#10'   P.CD_PESSOA,'#13#10'   P.NM_PESSOA,'#13#10'   P.DS_LOGIN,'#13 +
        #10'   R.NR_PERMISSAO,'#13#10'   A.DS_CHAVE DS_CHAVE_ACAO,'#13#10'   M.DS_CHAVE' +
        ' DS_CHAVE_MODULO'#13#10'FROM'#13#10'   PESSOAS P'#13#10'      JOIN NU_GRUPOS_PESSO' +
        'AS G ON'#13#10'         (P.CD_PESSOA = G.CD_PESSOA)'#13#10'      JOIN NU_GRU' +
        'POS_PERMISSOES R ON'#13#10'         (G.CD_GRUPO = R.CD_GRUPO)'#13#10'       ' +
        '  JOIN NU_MODULOS_ACOES A ON'#13#10'            (R.CD_ACAO = A.CD_ACAO' +
        ')'#13#10'            JOIN NU_MODULOS M ON'#13#10'               (A.CD_MODULO' +
        ' = M.CD_MODULO)'#13#10'WHERE'#13#10'   ('#13#10'   UPPER(P.DS_LOGIN) = UPPER(:DS_L' +
        'OGIN) OR'#13#10'   TO_CHAR(P.CD_PESSOA) = :DS_LOGIN'#13#10'   )'#13#10'   AND'#13#10'   ' +
        'M.DS_CHAVE = '#39'ProvaOnline'#39)
    Left = 80
    Top = 104
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'DS_LOGIN'
        ParamType = ptUnknown
      end>
    object qryUsuarioCD_PESSOA: TIntegerField
      FieldName = 'CD_PESSOA'
      Required = True
    end
    object qryUsuarioNM_PESSOA: TStringField
      FieldName = 'NM_PESSOA'
      Size = 60
    end
    object qryUsuarioDS_LOGIN: TStringField
      FieldName = 'DS_LOGIN'
      Size = 25
    end
    object qryUsuarioNR_PERMISSAO: TIntegerField
      FieldName = 'NR_PERMISSAO'
      Required = True
    end
    object qryUsuarioDS_CHAVE_ACAO: TStringField
      FieldName = 'DS_CHAVE_ACAO'
      Required = True
      Size = 50
    end
    object qryUsuarioDS_CHAVE_MODULO: TStringField
      FieldName = 'DS_CHAVE_MODULO'
      Required = True
      Size = 50
    end
  end
  object qryLogon: TUMZReadOnlyQuery
    Connection = conn
    SQL.Strings = (
      'SELECT'
      '   CD_PESSOA'
      'FROM'
      '   PESSOAS'
      'WHERE'
      '   ('
      '   CD_PESSOA = :DS_LOGIN OR UPPER(DS_LOGIN) = UPPER(:DS_LOGIN)'
      '   )'
      '   AND'
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
      
        'mysql-5=SELECT'#13#10'   CD_PESSOA,'#13#10'   DS_SENHA'#13#10'FROM'#13#10'   PESSOAS'#13#10'WH' +
        'ERE'#13#10'   ('#13#10'   CD_PESSOA = :DS_LOGIN OR UPPER(DS_LOGIN) = UPPER(:' +
        'DS_LOGIN)'#13#10'   )'#13#10'   AND'#13#10'   DS_SENHA = MD5(:DS_SENHA)'
      
        'oracle=SELECT'#13#10'   CD_PESSOA,'#13#10'   DS_SENHA'#13#10'FROM'#13#10'   PESSOAS'#13#10'WHE' +
        'RE'#13#10'   ('#13#10'   TO_CHAR(CD_PESSOA) = :DS_LOGIN OR UPPER(DS_LOGIN) =' +
        ' UPPER(:DS_LOGIN)'#13#10'   )'#13#10'   AND'#13#10'   DS_SENHA = MD5(:DS_SENHA)')
    Left = 80
    Top = 160
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
      Required = True
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
    Connection = conn
    UnimestreUser = 'umsistema'
    Left = 80
    Top = 216
  end
  object sqlMonitor: TZSQLMonitor
    MaxTraceCount = 100
    OnLogTrace = sqlMonitorLogTrace
    Left = 176
    Top = 208
  end
end
