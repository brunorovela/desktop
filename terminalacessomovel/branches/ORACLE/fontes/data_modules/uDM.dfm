object DM: TDM
  OldCreateOrder = False
  OnCreate = FormCreate
  Height = 330
  Width = 565
  object tblUsuarios: TUMZQuery
    Connection = ZConnTAM
    SQL.Strings = (
      'SELECT'
      '     p.cd_pessoa as codigo,'
      '     p.nm_pessoa as nome,'
      '     p.ds_senha as senha,'
      '     1 as online,'
      '     p.cd_pessoa '
      'FROM'
      '     pessoas p'
      
        '     INNER JOIN nu_grupos_pessoas ngp      ON ( p.cd_pessoa    =' +
        ' ngp.cd_pessoa )'
      
        '     INNER JOIN nu_grupos_permissoes perms ON ( perms.cd_grupo =' +
        ' ngp.cd_grupo )'
      
        '     INNER JOIN nu_modulos_acoes nma'#9#9'  ON ( nma.cd_acao    = pe' +
        'rms.cd_acao )'
      'WHERE'
      '     nma.ds_chave like '#39'AcessoTerminalMovel'#39' AND'
      '     p.cd_pessoa = :cd_pessoa      ')
    Params = <
      item
        DataType = ftUnknown
        Name = 'cd_pessoa'
        ParamType = ptUnknown
      end>
    Left = 24
    Top = 8
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'cd_pessoa'
        ParamType = ptUnknown
      end>
    object tblUsuarioscodigo: TIntegerField
      FieldName = 'codigo'
      Required = True
    end
    object tblUsuariosnome: TStringField
      FieldName = 'nome'
      Size = 60
    end
    object tblUsuariossenha: TStringField
      FieldName = 'senha'
      Size = 32
    end
    object tblUsuarioscd_pessoa: TIntegerField
      FieldName = 'cd_pessoa'
      Required = True
    end
    object tblUsuariosonline: TLargeintField
      FieldName = 'online'
      ReadOnly = True
    end
  end
  object tblParametros: TUMZQuery
    Connection = ZConnTAM
    SQL.Strings = (
      'SELECT ds_valor FROM parametros WHERE ds_variavel = :variavel')
    Params = <
      item
        DataType = ftUnknown
        Name = 'variavel'
        ParamType = ptUnknown
      end>
    Left = 24
    Top = 72
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'variavel'
        ParamType = ptUnknown
      end>
    object tblParametrosds_valor: TMemoField
      FieldName = 'ds_valor'
      BlobType = ftMemo
    end
  end
  object tblUsuariosPorNome: TUMZQuery
    Connection = ZConnTAM
    SQL.Strings = (
      'SELECT'
      '     p.cd_pessoa as codigo,'
      '     p.nm_pessoa as nome,'
      '     p.ds_senha as senha,'
      '     1 as online,'
      '     p.cd_pessoa '
      'FROM'
      '     pessoas p'
      'WHERE'
      '     p.ds_login like :nome')
    Params = <
      item
        DataType = ftUnknown
        Name = 'Nome'
        ParamType = ptUnknown
      end>
    Left = 104
    Top = 8
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'Nome'
        ParamType = ptUnknown
      end>
    object tblUsuariosPorNomecodigo: TIntegerField
      FieldName = 'codigo'
      Required = True
    end
    object tblUsuariosPorNomenome: TStringField
      FieldName = 'nome'
      Size = 60
    end
    object tblUsuariosPorNomesenha: TStringField
      FieldName = 'senha'
      Size = 32
    end
    object tblUsuariosPorNomeonline: TLargeintField
      FieldName = 'online'
      ReadOnly = True
    end
    object tblUsuariosPorNomecd_pessoa: TIntegerField
      FieldName = 'cd_pessoa'
      Required = True
    end
  end
  object ZConnTAM: TZConnection
    SQLHourGlass = True
    Left = 104
    Top = 72
  end
  object qryPermAcesso: TUMZQuery
    Connection = ZConnTAM
    SQL.Strings = (
      'SELECT'
      '     perms.nr_permissao'
      'FROM'
      '     pessoas p'
      
        '     INNER JOIN nu_grupos_pessoas ngp      ON ( p.cd_pessoa    =' +
        ' ngp.cd_pessoa )'
      
        '     INNER JOIN nu_grupos_permissoes perms ON ( perms.cd_grupo =' +
        ' ngp.cd_grupo )'
      
        '     INNER JOIN nu_modulos_acoes nma'#9#9'  ON ( nma.cd_acao    = pe' +
        'rms.cd_acao )'
      'WHERE'
      '     nma.ds_chave like '#39'AcessoTerminalMovel'#39' AND'
      '     p.ds_login  like :ds_login')
    Params = <
      item
        DataType = ftUnknown
        Name = 'ds_login'
        ParamType = ptUnknown
      end>
    Left = 192
    Top = 8
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'ds_login'
        ParamType = ptUnknown
      end>
    object qryPermAcessonr_permissao: TIntegerField
      FieldName = 'nr_permissao'
      Required = True
    end
  end
  object startConn: TUMZStartConnection
    DefaultConnection = DMCreate
    IniProps.SectionName = 'Conexao'
    IniProps.ProtocolIdent = 'Protocolo'
    IniProps.HostNameIdent = 'Servidor'
    IniProps.PortIdent = 'Porta'
    IniProps.DatabaseIdent = 'Banco'
    IniProps.StartDatabaseIdent = 'Start.Banco'
    IniProps.UserIdent = 'Usuario'
    IniProps.PasswordIdent = 'Senha'
    IniProps.ClientKeyIdent = 'Chave'
    Connection = ZConnTAM
    UnimestreUser = 'umsistema'
    Left = 168
    Top = 80
  end
end
