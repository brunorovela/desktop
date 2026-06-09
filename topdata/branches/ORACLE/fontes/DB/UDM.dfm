object DM: TDM
  OldCreateOrder = False
  OnCreate = DataModuleCreate
  OnDestroy = DataModuleDestroy
  Height = 318
  Width = 493
  object db: TZConnection
    TransactIsolationLevel = tiReadCommitted
    Left = 72
    Top = 16
  end
  object startConn: TUMZStartConnection
    DefaultConnection = startConnDefaultConnection
    IniProps.SectionName = 'Conexao.Local'
    IniProps.ProtocolIdent = 'Protocolo'
    IniProps.HostNameIdent = 'Servidor'
    IniProps.PortIdent = 'Porta'
    IniProps.DatabaseIdent = 'Banco'
    IniProps.StartDatabaseIdent = 'Start.Banco'
    IniProps.UserIdent = 'Usuario'
    IniProps.PasswordIdent = 'Senha'
    Connection = db
    UnimestreUser = 'umsistema'
    Left = 72
    Top = 72
  end
  object SQLMonitor: TZSQLMonitor
    MaxTraceCount = 100
    OnLogTrace = SQLMonitorLogTrace
    Left = 72
    Top = 128
  end
  object dbRemote: TZConnection
    TransactIsolationLevel = tiReadCommitted
    Left = 152
    Top = 16
  end
  object startConnRemote: TUMZStartConnection
    DefaultConnection = startConnRemoteDefaultConnection
    IniProps.SectionName = 'Conexao.Remoto'
    IniProps.ProtocolIdent = 'Protocolo'
    IniProps.HostNameIdent = 'Servidor'
    IniProps.PortIdent = 'Porta'
    IniProps.DatabaseIdent = 'Banco'
    IniProps.StartDatabaseIdent = 'Start.Banco'
    IniProps.UserIdent = 'Usuario'
    IniProps.PasswordIdent = 'Senha'
    Connection = dbRemote
    UnimestreUser = 'umsistema'
    Left = 152
    Top = 72
  end
end
