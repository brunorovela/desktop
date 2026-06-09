object DM: TDM
  OldCreateOrder = True
  OnCreate = DMCreate
  OnDestroy = DataModuleDestroy
  Height = 432
  Width = 594
  object db: TZConnection
    Properties.Strings = (
      'CLIENT_MULTI_STATEMENTS=1'
      'CLIENT_MULTI_RESULTS=1')
    TransactIsolationLevel = tiReadCommitted
    SQLHourGlass = True
    Left = 16
    Top = 8
  end
  object tblTurmas: TUMZQuery
    Connection = db
    SQL.Strings = (
      'select * from Turmas')
    Params = <>
    Left = 175
    Top = 12
    object tblTurmasCodigo: TStringField
      DisplayLabel = 'Turma'
      DisplayWidth = 15
      FieldName = 'Codigo'
      Origin = 'Turmas.Codigo'
      Size = 15
    end
    object tblTurmasAnoSemestre: TSmallintField
      DisplayLabel = 'Ano/Sem.'
      DisplayWidth = 8
      FieldName = 'AnoSemestre'
      Origin = 'Turmas.AnoSemestre'
      DisplayFormat = '0000/0'
    end
    object tblTurmasSerie: TSmallintField
      DisplayLabel = 'S'#233'rie'
      DisplayWidth = 6
      FieldName = 'Serie'
      Origin = 'Turmas.Serie'
    end
    object tblTurmasCurso: TStringField
      DisplayWidth = 8
      FieldName = 'Curso'
      Origin = 'Turmas.Curso'
      Size = 5
    end
    object tblTurmasTurno: TStringField
      DisplayWidth = 6
      FieldName = 'Turno'
      Origin = 'Turmas.Turno'
      Size = 1
    end
    object tblTurmasDescricao: TStringField
      DisplayWidth = 40
      FieldName = 'Descricao'
      Origin = 'Turmas.Descricao'
      Visible = False
      Size = 40
    end
    object tblTurmasContrato: TStringField
      DisplayWidth = 50
      FieldName = 'Contrato'
      Origin = 'Turmas.Contrato'
      Visible = False
      Size = 50
    end
    object tblTurmasVagas: TSmallintField
      DisplayWidth = 10
      FieldName = 'Vagas'
      Origin = 'Turmas.Vagas'
      Visible = False
    end
    object tblTurmasHoraInicio: TDateTimeField
      DisplayWidth = 10
      FieldName = 'HoraInicio'
      Origin = 'Turmas.HoraInicio'
      Visible = False
    end
    object tblTurmasHoraFim: TDateTimeField
      DisplayWidth = 10
      FieldName = 'HoraFim'
      Origin = 'Turmas.HoraFim'
      Visible = False
    end
    object tblTurmasDataInicio: TDateTimeField
      DisplayWidth = 10
      FieldName = 'DataInicio'
      Origin = 'Turmas.DataInicio'
      Visible = False
    end
    object tblTurmasDataFim: TDateTimeField
      DisplayWidth = 10
      FieldName = 'DataFim'
      Origin = 'Turmas.DataFim'
      Visible = False
    end
    object tblTurmasIdadeConclusao: TSmallintField
      DisplayWidth = 10
      FieldName = 'IdadeConclusao'
      Origin = 'Turmas.IdadeConclusao'
      Visible = False
    end
    object tblTurmasDataConclusao: TDateTimeField
      DisplayWidth = 10
      FieldName = 'DataConclusao'
      Origin = 'Turmas.DataConclusao'
      Visible = False
    end
    object tblTurmasDiasSemanaisLetivos: TStringField
      DisplayWidth = 50
      FieldName = 'DiasSemanaisLetivos'
      Origin = 'Turmas.DiasSemanaisLetivos'
      Visible = False
      Size = 50
    end
    object tblTurmasHorarioLetivo: TStringField
      DisplayWidth = 50
      FieldName = 'HorarioLetivo'
      Origin = 'Turmas.HorarioLetivo'
      Visible = False
      Size = 50
    end
    object tblTurmasHorasAula: TStringField
      DisplayWidth = 20
      FieldName = 'HorasAula'
      Origin = 'Turmas.HorasAula'
      Visible = False
    end
  end
  object tblCursos: TUMZQuery
    Connection = db
    AutoCalcFields = False
    SQL.Strings = (
      'select * from Cursos')
    Params = <>
    Left = 176
    Top = 60
    object tblCursosCodigo: TStringField
      DisplayLabel = 'Curso'
      DisplayWidth = 10
      FieldName = 'Codigo'
      Origin = 'Cursos.Codigo'
      Size = 5
    end
    object tblCursosAnoSemestre: TSmallintField
      DisplayLabel = 'Ano/Sem.'
      DisplayWidth = 10
      FieldName = 'AnoSemestre'
      Origin = 'Cursos.AnoSemestre'
      DisplayFormat = '0000/0'
    end
    object tblCursosDescricao: TStringField
      DisplayWidth = 30
      FieldName = 'Descricao'
      Origin = 'Cursos.Descricao'
      Size = 50
    end
    object tblCursosDepto: TSmallintField
      FieldName = 'Depto'
      Origin = 'Cursos.NumerodeSeries'
    end
  end
  object qryUpdate: TUMZQuery
    Connection = db
    Params = <>
    Left = 175
    Top = 163
  end
  object tblUsuariosNome: TUMZQuery
    Connection = db
    SQL.Strings = (
      'SELECT'
      #9'cd_pessoa AS CODIGO,'
      #9'CASE WHEN sn_bloqueado = 1 THEN '#39'N'#39' ELSE '#39'S'#39' END AS SN_ONLINE,'
      #9'CASE WHEN sn_bloqueado = 1 THEN '#39'N'#39' ELSE '#39'S'#39' END AS ONLINE,'
      #9'ds_login AS NOME,'
      #9'ds_senha AS SENHA,'
      '  cd_pessoa AS CD_PESSOA'
      'FROM'
      #9'pessoas'
      'WHERE'
      #9'ds_login = :Nome')
    Params = <
      item
        DataType = ftString
        Name = 'Nome'
        ParamType = ptUnknown
      end>
    Left = 88
    Top = 58
    ParamData = <
      item
        DataType = ftString
        Name = 'Nome'
        ParamType = ptUnknown
      end>
    object tblUsuariosNomeCODIGO: TIntegerField
      FieldName = 'CODIGO'
      Required = True
    end
    object tblUsuariosNomeSN_ONLINE: TStringField
      FieldName = 'SN_ONLINE'
      ReadOnly = True
      Size = 1
    end
    object tblUsuariosNomeONLINE: TStringField
      FieldName = 'ONLINE'
      ReadOnly = True
      Size = 1
    end
    object tblUsuariosNomeNOME: TStringField
      FieldName = 'NOME'
      Size = 25
    end
    object tblUsuariosNomeSENHA: TStringField
      FieldName = 'SENHA'
      Size = 32
    end
    object tblUsuariosNomeCD_PESSOA: TIntegerField
      FieldName = 'CD_PESSOA'
      Required = True
    end
  end
  object tblFeriados: TUMZQuery
    Connection = db
    SQL.Strings = (
      'SELECT * FROM calendario '
      'WHERE nr_dia = :dia AND nr_mes = :mes AND nr_ano = :ano '
      'AND sn_financeiro = '#39'N'#39)
    Params = <
      item
        DataType = ftUnknown
        Name = 'dia'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'mes'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'ano'
        ParamType = ptUnknown
      end>
    Left = 88
    Top = 8
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'dia'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'mes'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'ano'
        ParamType = ptUnknown
      end>
  end
  object RS_VAR: TUMZQuery
    Connection = db
    SQL.Strings = (
      'SELECT ds_valor FROM parametros WHERE ds_variavel = :variavel')
    Params = <
      item
        DataType = ftUnknown
        Name = 'variavel'
        ParamType = ptUnknown
      end>
    Left = 304
    Top = 10
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'variavel'
        ParamType = ptUnknown
      end>
  end
  object qAux1: TUMZQuery
    Connection = db
    Params = <>
    Left = 240
    Top = 58
  end
  object qAux2: TUMZQuery
    Connection = db
    Params = <>
    Left = 240
    Top = 159
  end
  object tblParametros: TUMZQuery
    Connection = db
    Params = <>
    Left = 304
    Top = 60
  end
  object qryInsert: TUMZQuery
    Connection = db
    SQL.Strings = (
      'insert into Mensalidades'
      
        '(CodigoAluno, cd_resp, Parcela, DataVencimento, dt_competencia, ' +
        'Turma, DataEmissao, NossoNumero, '
      
        'ValorBruto, ValorDesconto, DescontoExtra, ValorExtra, ValorTotal' +
        ', ValorJuros, '
      'ValorPago, DataPagamento, Situacao, Usuario, Bloqueto, '
      
        'AnoSemestre, DataBaseCorrecao, IndiceCorrecao, Curso, Depto, Tip' +
        'oParcela, sn_credito_parcela, cd_mensalidade_origem, nr_creditos' +
        ','
      
        'ds_historico, cd_tipo_titulo, cd_plano_conta, cd_centro_custo, c' +
        'd_caixa, vl_credito, cd_item_plano, cd_cheque_devolvido, cd_coli' +
        'gada'
      ')'
      'VALUES'
      '('
      
        ':CodigoAluno,  :cd_resp, :Parcela, :DataVencimento, :dt_competen' +
        'cia, :Turma, :DataEmissao,'
      
        ':NossoNumero, :ValorBruto, :ValorDesconto, :DescontoExtra, :Valo' +
        'rExtra,'
      ':ValorTotal, :ValorJuros, :ValorPago, :DataPagamento, :Situacao,'
      ':Usuario, :Bloqueto, :AnoSemestre, '
      
        ':DataBaseCorrecao, :IndiceCorrecao, :Curso, :Depto, :Tipo, :sn_c' +
        'redito_parcela, :cd_mensalidade_origem, :nr_creditos,'
      
        ':ds_historico, :cd_tipo_titulo, :cd_plano_conta, :cd_centro_cust' +
        'o, :cd_caixa, :ValorCredito, :CodItemPlano, :cd_cheque_devolvido' +
        ', :cd_coligada'
      ')')
    Params = <
      item
        DataType = ftInteger
        Name = 'CodigoAluno'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'cd_resp'
        ParamType = ptUnknown
      end
      item
        DataType = ftSmallint
        Name = 'Parcela'
        ParamType = ptUnknown
      end
      item
        DataType = ftDateTime
        Name = 'DataVencimento'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'dt_competencia'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'Turma'
        ParamType = ptUnknown
      end
      item
        DataType = ftDateTime
        Name = 'DataEmissao'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'NossoNumero'
        ParamType = ptUnknown
      end
      item
        DataType = ftFloat
        Name = 'ValorBruto'
        ParamType = ptUnknown
      end
      item
        DataType = ftFloat
        Name = 'ValorDesconto'
        ParamType = ptUnknown
      end
      item
        DataType = ftFloat
        Name = 'DescontoExtra'
        ParamType = ptUnknown
      end
      item
        DataType = ftFloat
        Name = 'ValorExtra'
        ParamType = ptUnknown
      end
      item
        DataType = ftFloat
        Name = 'ValorTotal'
        ParamType = ptUnknown
      end
      item
        DataType = ftFloat
        Name = 'ValorJuros'
        ParamType = ptUnknown
      end
      item
        DataType = ftFloat
        Name = 'ValorPago'
        ParamType = ptUnknown
      end
      item
        DataType = ftDateTime
        Name = 'DataPagamento'
        ParamType = ptUnknown
      end
      item
        DataType = ftSmallint
        Name = 'Situacao'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'Usuario'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'Bloqueto'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'AnoSemestre'
        ParamType = ptUnknown
      end
      item
        DataType = ftDateTime
        Name = 'DataBaseCorrecao'
        ParamType = ptUnknown
      end
      item
        DataType = ftFloat
        Name = 'IndiceCorrecao'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'Curso'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'Depto'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'Tipo'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'sn_credito_parcela'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'cd_mensalidade_origem'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'nr_creditos'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'ds_historico'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'cd_tipo_titulo'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'cd_plano_conta'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'cd_centro_custo'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'cd_caixa'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'ValorCredito'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'CodItemPlano'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'cd_cheque_devolvido'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'cd_coligada'
        ParamType = ptUnknown
      end>
    Left = 176
    Top = 110
    ParamData = <
      item
        DataType = ftInteger
        Name = 'CodigoAluno'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'cd_resp'
        ParamType = ptUnknown
      end
      item
        DataType = ftSmallint
        Name = 'Parcela'
        ParamType = ptUnknown
      end
      item
        DataType = ftDateTime
        Name = 'DataVencimento'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'dt_competencia'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'Turma'
        ParamType = ptUnknown
      end
      item
        DataType = ftDateTime
        Name = 'DataEmissao'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'NossoNumero'
        ParamType = ptUnknown
      end
      item
        DataType = ftFloat
        Name = 'ValorBruto'
        ParamType = ptUnknown
      end
      item
        DataType = ftFloat
        Name = 'ValorDesconto'
        ParamType = ptUnknown
      end
      item
        DataType = ftFloat
        Name = 'DescontoExtra'
        ParamType = ptUnknown
      end
      item
        DataType = ftFloat
        Name = 'ValorExtra'
        ParamType = ptUnknown
      end
      item
        DataType = ftFloat
        Name = 'ValorTotal'
        ParamType = ptUnknown
      end
      item
        DataType = ftFloat
        Name = 'ValorJuros'
        ParamType = ptUnknown
      end
      item
        DataType = ftFloat
        Name = 'ValorPago'
        ParamType = ptUnknown
      end
      item
        DataType = ftDateTime
        Name = 'DataPagamento'
        ParamType = ptUnknown
      end
      item
        DataType = ftSmallint
        Name = 'Situacao'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'Usuario'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'Bloqueto'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'AnoSemestre'
        ParamType = ptUnknown
      end
      item
        DataType = ftDateTime
        Name = 'DataBaseCorrecao'
        ParamType = ptUnknown
      end
      item
        DataType = ftFloat
        Name = 'IndiceCorrecao'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'Curso'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'Depto'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'Tipo'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'sn_credito_parcela'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'cd_mensalidade_origem'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'nr_creditos'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'ds_historico'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'cd_tipo_titulo'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'cd_plano_conta'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'cd_centro_custo'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'cd_caixa'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'ValorCredito'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'CodItemPlano'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'cd_cheque_devolvido'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'cd_coligada'
        ParamType = ptUnknown
      end>
  end
  object qyAux: TUMZQuery
    Connection = db
    Params = <>
    Left = 240
    Top = 8
  end
  object qyPessoas: TUMZQuery
    Connection = db
    SQL.Strings = (
      'SELECT'
      '   cd_pessoa,'
      '   nm_pessoa'
      'FROM'
      '   pessoas')
    Params = <>
    Left = 304
    Top = 111
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
  object qyAux1: TUMZQuery
    Connection = db
    Params = <>
    Left = 240
    Top = 109
  end
  object qyAux2: TUMZQuery
    Connection = db
    Params = <>
    Left = 240
    Top = 218
  end
  object qyUsuariosParametros: TUMZQuery
    Connection = db
    Params = <>
    SQLList.Strings = (
      
        'mysql-5=REPLACE INTO usuarios_parametros (cd_usuario, ds_paramet' +
        'ro, ds_valor) VALUES (:cd_usuario, :ds_parametro, :ds_valor)'
      
        'oracle=MERGE INTO usuarios_parametros up USING '#13#10'   (SELECT '#13#10'  ' +
        '     :cd_usuario AS cd_usuario, '#13#10'       :ds_parametro AS ds_par' +
        'ametro, '#13#10'       :ds_valor AS ds_valor FROM dual) up2 ON '#13#10'     ' +
        '     (up.cd_usuario = up2.cd_usuario AND '#13#10'           up.ds_para' +
        'metro = up2.ds_parametro) '#13#10'    WHEN MATCHED THEN '#13#10'       UPDAT' +
        'E SET up.ds_valor = up2.ds_valor '#13#10'    WHEN NOT MATCHED THEN '#13#10' ' +
        '      INSERT (up.cd_usuario, up.ds_parametro, up.ds_valor) VALUE' +
        'S (up2.cd_usuario, up2.ds_parametro, up2.ds_valor)')
    Left = 320
    Top = 160
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
    Left = 320
    Top = 224
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
    Left = 96
    Top = 192
  end
  object sqlMonitor: TZSQLMonitor
    MaxTraceCount = 100
    OnLogTrace = sqlMonitorLogTrace
    Left = 56
    Top = 136
  end
end
