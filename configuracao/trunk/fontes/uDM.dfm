object DM: TDM
  OldCreateOrder = False
  OnCreate = DataModuleCreate
  Height = 289
  Width = 610
  object db: TDatabase
    AliasName = 'unimestre'
    DatabaseName = 'unimestre'
    LoginPrompt = False
    Params.Strings = (
      'USER NAME=academico'
      'PASSWORD=UniMestreProSurf')
    SessionName = 'Default'
    Left = 40
    Top = 8
  end
  object tblOnlineParam: TQuery
    DatabaseName = 'unimestre'
    RequestLive = True
    SQL.Strings = (
      'SELECT *'
      'FROM online_parametros'
      'WHERE sn_restrito='#39'N'#39
      'ORDER BY ds_variavel')
    UpdateMode = upWhereKeyOnly
    Left = 192
    Top = 144
    object tblOnlineParamds_variavel: TStringField
      FieldName = 'ds_variavel'
      Origin = 'UNIMESTRE.online_parametros.ds_variavel'
      Size = 100
    end
    object tblOnlineParamds_valor: TStringField
      FieldName = 'ds_valor'
      Origin = 'UNIMESTRE.online_parametros.ds_valor'
      Size = 150
    end
  end
  object dsOnlineParam: TDataSource
    DataSet = tblOnlineParam
    Left = 192
    Top = 192
  end
  object tblUsuariosNome: TQuery
    DatabaseName = 'unimestre'
    SQL.Strings = (
      'SELECT * '
      'FROM usuarios'
      'WHERE nome = :NOME')
    Left = 40
    Top = 64
    ParamData = <
      item
        DataType = ftString
        Name = 'NOME'
        ParamType = ptUnknown
      end>
    object tblUsuariosNomecodigo: TIntegerField
      FieldName = 'codigo'
      Origin = 'UNIMESTRE.usuarios.codigo'
    end
    object tblUsuariosNomenome: TStringField
      FieldName = 'nome'
      Origin = 'UNIMESTRE.usuarios.nome'
      Size = 30
    end
    object tblUsuariosNomesenha: TStringField
      FieldName = 'senha'
      Origin = 'UNIMESTRE.usuarios.senha'
      Size = 32
    end
    object tblUsuariosNomeonline: TStringField
      FieldName = 'online'
      Origin = 'UNIMESTRE.usuarios.online'
      FixedChar = True
      Size = 1
    end
  end
  object tblModulosUsuarios: TQuery
    DatabaseName = 'unimestre'
    SQL.Strings = (
      'SELECT * '
      'FROM modulosusuarios'
      'WHERE codigousuario = :codigousuario'
      'AND codigomodulo = :codigomodulo')
    Left = 144
    Top = 64
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
    object tblModulosUsuarioscodigousuario: TIntegerField
      FieldName = 'codigousuario'
      Origin = 'UNIMESTRE.modulosusuarios.codigousuario'
    end
    object tblModulosUsuarioscodigomodulo: TSmallintField
      FieldName = 'codigomodulo'
      Origin = 'UNIMESTRE.modulosusuarios.codigomodulo'
    end
    object tblModulosUsuariosincluir: TStringField
      FieldName = 'incluir'
      Origin = 'UNIMESTRE.modulosusuarios.incluir'
      FixedChar = True
      Size = 1
    end
    object tblModulosUsuariosalterar: TStringField
      FieldName = 'alterar'
      Origin = 'UNIMESTRE.modulosusuarios.alterar'
      FixedChar = True
      Size = 1
    end
    object tblModulosUsuariosdeletar: TStringField
      FieldName = 'deletar'
      Origin = 'UNIMESTRE.modulosusuarios.deletar'
      FixedChar = True
      Size = 1
    end
    object tblModulosUsuariosacessar: TStringField
      FieldName = 'acessar'
      Origin = 'UNIMESTRE.modulosusuarios.acessar'
      FixedChar = True
      Size = 1
    end
    object tblModulosUsuariosespecial: TStringField
      FieldName = 'especial'
      Origin = 'UNIMESTRE.modulosusuarios.especial'
      FixedChar = True
      Size = 1
    end
  end
  object tblOnlineParamRest: TQuery
    DatabaseName = 'unimestre'
    RequestLive = True
    SQL.Strings = (
      'SELECT *'
      'FROM online_parametros'
      'WHERE sn_restrito='#39'S'#39
      'ORDER BY ds_variavel')
    UpdateMode = upWhereKeyOnly
    Left = 288
    Top = 144
    object tblOnlineParamRestds_variavel: TStringField
      FieldName = 'ds_variavel'
      Origin = 'UNIMESTRE.online_parametros.ds_variavel'
      Size = 100
    end
    object tblOnlineParamRestds_valor: TStringField
      FieldName = 'ds_valor'
      Origin = 'UNIMESTRE.online_parametros.ds_valor'
      Size = 150
    end
  end
  object dsOnlineParamRest: TDataSource
    DataSet = tblOnlineParamRest
    Left = 288
    Top = 192
  end
  object tblUsuarios: TQuery
    DatabaseName = 'unimestre'
    SQL.Strings = (
      'SELECT *'
      'FROM usuarios'
      'WHERE codigo = :codigo')
    Left = 248
    Top = 64
    ParamData = <
      item
        DataType = ftInteger
        Name = 'codigo'
        ParamType = ptUnknown
      end>
    object tblUsuarioscodigo: TIntegerField
      FieldName = 'codigo'
      Origin = 'UNIMESTRE.usuarios.codigo'
    end
    object tblUsuariosnome2: TStringField
      FieldName = 'nome'
      Origin = 'UNIMESTRE.usuarios.nome'
      Size = 30
    end
    object tblUsuariossenha: TStringField
      FieldName = 'senha'
      Origin = 'UNIMESTRE.usuarios.senha'
      Size = 32
    end
    object tblUsuariosonline: TStringField
      FieldName = 'online'
      Origin = 'UNIMESTRE.usuarios.online'
      FixedChar = True
      Size = 1
    end
  end
  object dsParamRest: TDataSource
    DataSet = tblParamRest
    Left = 104
    Top = 192
  end
  object tblParamRest: TQuery
    DatabaseName = 'unimestre'
    RequestLive = True
    SQL.Strings = (
      'SELECT *'
      'FROM parametros'
      'WHERE sn_restrito = '#39'S'#39
      'ORDER BY ds_variavel')
    UpdateMode = upWhereKeyOnly
    Left = 104
    Top = 144
    object StringField1: TStringField
      DisplayLabel = 'Vari'#225'vel'
      DisplayWidth = 25
      FieldName = 'ds_variavel'
      Origin = 'UNIMESTRE.parametros.ds_variavel'
      Size = 50
    end
    object StringField2: TStringField
      DisplayLabel = 'Valor'
      DisplayWidth = 25
      FieldName = 'ds_valor'
      Origin = 'UNIMESTRE.parametros.ds_valor'
      Size = 150
    end
  end
  object tblCenso_Cursos: TQuery
    DatabaseName = 'unimestre'
    UpdateMode = upWhereKeyOnly
    Left = 496
    Top = 120
  end
  object tblCenso_Resultado: TQuery
    DatabaseName = 'unimestre'
    UpdateMode = upWhereKeyOnly
    Left = 496
    Top = 176
  end
  object tblCenso_Quadros: TQuery
    DatabaseName = 'unimestre'
    RequestLive = True
    SQL.Strings = (
      'select * from censo_quadro'
      'order by cd_quadro')
    UpdateMode = upWhereKeyOnly
    Left = 496
    Top = 64
    object tblCenso_Quadroscd_quadro: TSmallintField
      FieldName = 'cd_quadro'
      Origin = 'UNIMESTRE.censo_quadro.cd_quadro'
    end
    object tblCenso_Quadrosds_quadro: TMemoField
      FieldName = 'ds_quadro'
      Origin = 'UNIMESTRE.censo_quadro.ds_quadro'
      BlobType = ftMemo
      Size = 1
    end
    object tblCenso_Quadrossn_instituicao: TStringField
      FieldName = 'sn_instituicao'
      Origin = 'UNIMESTRE.censo_quadro.sn_instituicao'
      FixedChar = True
      Size = 1
    end
    object tblCenso_Quadrossn_curso: TStringField
      FieldName = 'sn_curso'
      Origin = 'UNIMESTRE.censo_quadro.sn_curso'
      FixedChar = True
      Size = 1
    end
    object tblCenso_Quadrossn_habilitacao: TStringField
      FieldName = 'sn_habilitacao'
      Origin = 'UNIMESTRE.censo_quadro.sn_habilitacao'
      FixedChar = True
      Size = 1
    end
    object tblCenso_Quadrossn_grau: TStringField
      FieldName = 'sn_grau'
      Origin = 'UNIMESTRE.censo_quadro.sn_grau'
      FixedChar = True
      Size = 1
    end
  end
  object tblCenso_Campos: TQuery
    OnNewRecord = tblCenso_CamposNewRecord
    DatabaseName = 'unimestre'
    DataSource = dsCenso_Quadros
    RequestLive = True
    SQL.Strings = (
      'select * from censo_campos'
      'where cd_quadro = :cd_quadro'
      'order by cd_campo')
    UpdateMode = upWhereKeyOnly
    Left = 496
    Top = 16
    ParamData = <
      item
        DataType = ftSmallint
        Name = 'cd_quadro'
        ParamType = ptUnknown
        Size = 2
      end>
    object tblCenso_Camposcd_campo: TStringField
      FieldName = 'cd_campo'
      Origin = 'UNIMESTRE.censo_campos.cd_campo'
      Size = 10
    end
    object tblCenso_Camposcd_quadro: TSmallintField
      FieldName = 'cd_quadro'
      Origin = 'UNIMESTRE.censo_campos.cd_quadro'
    end
    object tblCenso_Camposds_campo: TStringField
      FieldName = 'ds_campo'
      Origin = 'UNIMESTRE.censo_campos.ds_campo'
      Size = 100
    end
    object tblCenso_Camposds_sql: TMemoField
      FieldName = 'ds_sql'
      Origin = 'UNIMESTRE.censo_campos.ds_sql'
      BlobType = ftMemo
      Size = 1
    end
    object tblCenso_Camposnr_semestre: TSmallintField
      FieldName = 'nr_semestre'
      Origin = 'UNIMESTRE.censo_campos.nr_semestre'
    end
    object tblCenso_Campossn_num_registros: TStringField
      FieldName = 'sn_num_registros'
      Origin = 'UNIMESTRE.censo_campos.sn_num_registros'
      FixedChar = True
      Size = 1
    end
  end
  object dsCenso_Campos: TDataSource
    DataSet = tblCenso_Campos
    Left = 400
    Top = 16
  end
  object dsCenso_Quadros: TDataSource
    DataSet = tblCenso_Quadros
    Left = 400
    Top = 64
  end
  object dsCenso_Cursos: TDataSource
    DataSet = tblCenso_Cursos
    Left = 400
    Top = 120
  end
  object dsCenso_Resultado: TDataSource
    DataSet = tblCenso_Resultado
    Left = 400
    Top = 176
  end
  object qyAux: TQuery
    DatabaseName = 'unimestre'
    Left = 232
    Top = 8
  end
end
