object DM: TDM
  OldCreateOrder = False
  OnCreate = DataModuleCreate
  Height = 395
  Width = 567
  object db: TZConnection
    TransactIsolationLevel = tiReadCommitted
    SQLHourGlass = True
    Left = 32
    Top = 16
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
    Left = 32
    Top = 80
  end
end
