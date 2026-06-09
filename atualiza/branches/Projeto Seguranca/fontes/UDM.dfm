object DM: TDM
  OldCreateOrder = False
  OnCreate = DataModuleCreate
  OnDestroy = DataModuleDestroy
  Height = 218
  Width = 421
  object connUnimestre: TZConnection
    TransactIsolationLevel = tiReadCommitted
    SQLHourGlass = True
    Left = 48
    Top = 32
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
    Connection = connUnimestre
    Persistent = True
    UnimestreUser = 'atualizacao'
    Left = 168
    Top = 32
  end
  object connMySQL: TZConnection
    TransactIsolationLevel = tiReadCommitted
    SQLHourGlass = True
    Left = 48
    Top = 104
  end
  object startConnMy: TUMZStartConnection
    Active = True
    IniProps.SectionName = 'Atualiza'
    IniProps.ProtocolIdent = 'Protocolo'
    IniProps.HostNameIdent = 'Servidor'
    IniProps.PortIdent = 'Porta'
    IniProps.DatabaseIdent = 'Banco'
    IniProps.StartDatabaseIdent = 'Start.Banco'
    IniProps.UserIdent = 'Usuario'
    IniProps.PasswordIdent = 'Senha'
    IniProps.ClientKeyIdent = 'Chave'
    Connection = connMySQL
    UnimestreUser = 'atualizacao'
    Left = 168
    Top = 104
  end
end
