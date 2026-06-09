object DMCatracas: TDMCatracas
  OldCreateOrder = False
  OnCreate = DataModuleCreate
  OnDestroy = DataModuleDestroy
  Height = 229
  Width = 246
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
    Left = 48
    Top = 64
  end
  object conn: TZConnection
    Properties.Strings = (
      'MYSQL_OPT_RECONNECT=true')
    TransactIsolationLevel = tiReadCommitted
    Left = 48
    Top = 16
  end
  object sqlMonitor: TZSQLMonitor
    MaxTraceCount = 100
    OnLogTrace = sqlMonitorLogTrace
    Left = 48
    Top = 112
  end
end
