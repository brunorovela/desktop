object DM: TDM
  OldCreateOrder = False
  OnCreate = DMCreate
  OnDestroy = DataModuleDestroy
  Height = 736
  Width = 1042
  object db: TZConnection
    Properties.Strings = (
      'CLIENT_MULTI_STATEMENTS=1'
      'CLIENT_MULTI_RESULTS=1')
    TransactIsolationLevel = tiReadCommitted
    Left = 16
    Top = 8
  end
  object tblModulos: TZTable
    Connection = db
    ReadOnly = True
    TableName = 'Modulos'
    Left = 536
    Top = 309
    object tblModulosCodigo: TSmallintField
      FieldName = 'Codigo'
    end
  end
  object tblMatriculas: TUMZQuery
    Connection = db
    OnCalcFields = tblMatriculasCalcFields
    AfterPost = tblMatriculasAfterPost
    OnPostError = tblMensalidadesPostError
    SQL.Strings = (
      'select * from Matriculas where'
      '(CodigoAluno = :CodigoAluno) and'
      '(AnoSemestre = :AnoSemestre) and'
      '(Turma = :Turma)'
      'order by AnoSemestre')
    Params = <
      item
        DataType = ftInteger
        Name = 'CodigoAluno'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'AnoSemestre'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'Turma'
        ParamType = ptUnknown
      end>
    Left = 765
    Top = 200
    ParamData = <
      item
        DataType = ftInteger
        Name = 'CodigoAluno'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'AnoSemestre'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'Turma'
        ParamType = ptUnknown
      end>
    object tblMatriculasCodigoAluno: TIntegerField
      FieldName = 'CodigoAluno'
      Origin = 'Matriculas.CodigoAluno'
    end
    object tblMatriculasTurma: TStringField
      DisplayWidth = 50
      FieldName = 'Turma'
      Origin = 'Matriculas.Turma'
      Size = 50
    end
    object tblMatriculasAnoSemestre: TSmallintField
      FieldName = 'AnoSemestre'
      Origin = 'Matriculas.CodigoAluno'
    end
    object tblMatriculasDataEmissao: TDateTimeField
      FieldName = 'DataEmissao'
      Origin = 'Matriculas.DataEmissao'
    end
    object tblMatriculasUsuario: TStringField
      FieldName = 'Usuario'
      Origin = 'Matriculas.Usuario'
      Size = 30
    end
    object tblMatriculasPlanoPagamento: TIntegerField
      FieldName = 'PlanoPagamento'
      Origin = 'Matriculas.PlanoPagamento'
    end
    object tblMatriculasSituacao: TSmallintField
      FieldName = 'Situacao'
      Origin = 'Matriculas.Situacao'
    end
    object tblMatriculasImpresso: TStringField
      FieldName = 'Impresso'
      Origin = 'Matriculas.Impresso'
    end
    object tblMatriculasDataSaida: TDateTimeField
      FieldName = 'DataSaida'
      Origin = 'Matriculas.DataSaida'
    end
    object tblMatriculasPlanoDesconto: TIntegerField
      FieldName = 'PlanoDesconto'
      Origin = 'Matriculas.PlanoDesconto'
    end
    object tblMatriculasDiploma: TStringField
      FieldName = 'Diploma'
      Origin = 'Matriculas.Diploma'
    end
    object tblMatriculasTurmaDependencia: TStringField
      FieldName = 'TurmaDependencia'
      Origin = 'Matriculas.CodigoAluno'
      Size = 15
    end
    object tblMatriculasCurso: TStringField
      FieldName = 'Curso'
      Origin = 'Matriculas.AnoSemestre'
      Size = 15
    end
    object tblMatriculasDataEntrada: TDateTimeField
      FieldName = 'DataEntrada'
      Origin = 'Matriculas.Turma'
    end
    object tblMatriculasQualSituacao: TStringField
      FieldKind = fkCalculated
      FieldName = 'QualSituacao'
      Size = 15
      Calculated = True
    end
  end
  object dtcMatriculas: TDataSource
    DataSet = tblMatriculas
    Left = 765
    Top = 248
  end
  object dtcMensalidades: TDataSource
    DataSet = tblMensalidades
    Left = 680
    Top = 344
  end
  object dtcAlunoMens: TDataSource
    Left = 536
    Top = 664
  end
  object dtcMotivos: TDataSource
    DataSet = tblMotivos
    Left = 765
    Top = 344
  end
  object tblBonus: TZTable
    Connection = db
    SortedFields = 'AlunoBeneficiado;AnoSemestre'
    TableName = 'Bonus'
    IndexFieldNames = 'AlunoBeneficiado Asc;AnoSemestre Asc'
    Left = 536
    Top = 359
    object tblBonusAlunoBeneficiado: TIntegerField
      FieldName = 'AlunoBeneficiado'
    end
    object tblBonusAlunoIndicado: TIntegerField
      FieldName = 'AlunoIndicado'
    end
    object tblBonusAnoSemestre: TIntegerField
      FieldName = 'AnoSemestre'
    end
    object tblBonusValorBonus: TFloatField
      FieldName = 'ValorBonus'
    end
    object tblBonusPercentualBonus: TFloatField
      FieldName = 'PercentualBonus'
    end
    object tblBonusDescontoAplicado: TStringField
      FieldName = 'DescontoAplicado'
    end
  end
  object tblMensBloq: TUMZQuery
    Connection = db
    SQL.Strings = (
      'select * from Mensalidades where'
      '(CodigoAluno = :Codigo) and'
      '(Parcela = :Parcela) and'
      '(DataVencimento = :Data) and'
      '(Turma = :Turma)')
    Params = <
      item
        DataType = ftInteger
        Name = 'Codigo'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'Parcela'
        ParamType = ptUnknown
      end
      item
        DataType = ftDateTime
        Name = 'Data'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'Turma'
        ParamType = ptUnknown
      end>
    Left = 192
    Top = 159
    ParamData = <
      item
        DataType = ftInteger
        Name = 'Codigo'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'Parcela'
        ParamType = ptUnknown
      end
      item
        DataType = ftDateTime
        Name = 'Data'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'Turma'
        ParamType = ptUnknown
      end>
    object tblMensBloqCodigoAluno: TIntegerField
      FieldName = 'CodigoAluno'
      Origin = 'Mensalidades.CodigoAluno'
    end
    object tblMensBloqParcela: TSmallintField
      FieldName = 'Parcela'
      Origin = 'Mensalidades.Parcela'
    end
    object tblMensBloqDataVencimento: TDateTimeField
      FieldName = 'DataVencimento'
      Origin = 'Mensalidades.DataVencimento'
    end
    object tblMensBloqTurma: TStringField
      FieldName = 'Turma'
      Origin = 'Mensalidades.Turma'
      Size = 50
    end
    object tblMensBloqDataEmissao: TDateTimeField
      FieldName = 'DataEmissao'
      Origin = 'Mensalidades.DataEmissao'
    end
    object tblMensBloqNossoNumero: TStringField
      FieldName = 'NossoNumero'
      Origin = 'Mensalidades.NossoNumero'
      Size = 30
    end
    object tblMensBloqValorBruto: TFloatField
      FieldName = 'ValorBruto'
      Origin = 'Mensalidades.ValorBruto'
    end
    object tblMensBloqValorDesconto: TFloatField
      FieldName = 'ValorDesconto'
      Origin = 'Mensalidades.ValorDesconto'
    end
    object tblMensBloqDescontoExtra: TFloatField
      FieldName = 'DescontoExtra'
      Origin = 'Mensalidades.DescontoExtra'
    end
    object tblMensBloqValorExtra: TFloatField
      FieldName = 'ValorExtra'
      Origin = 'Mensalidades.ValorExtra'
    end
    object tblMensBloqValorTotal: TFloatField
      FieldName = 'ValorTotal'
      Origin = 'Mensalidades.ValorTotal'
    end
    object tblMensBloqValorJuros: TFloatField
      FieldName = 'ValorJuros'
      Origin = 'Mensalidades.ValorJuros'
    end
    object tblMensBloqValorPago: TFloatField
      FieldName = 'ValorPago'
      Origin = 'Mensalidades.ValorPago'
    end
    object tblMensBloqDataPagamento: TDateTimeField
      FieldName = 'DataPagamento'
      Origin = 'Mensalidades.DataPagamento'
    end
    object tblMensBloqSituacao: TSmallintField
      FieldName = 'Situacao'
      Origin = 'Mensalidades.Situacao'
    end
    object tblMensBloqUsuario: TStringField
      FieldName = 'Usuario'
      Origin = 'Mensalidades.Usuario'
      Size = 30
    end
    object tblMensBloqBloqueto: TStringField
      FieldName = 'Bloqueto'
      Origin = 'Mensalidades.Bloqueto'
    end
    object tblMensBloqAnoSemestre: TSmallintField
      FieldName = 'AnoSemestre'
      Origin = 'Mensalidades.AnoSemestre'
    end
    object tblMensBloqDataBaseCorrecao: TDateTimeField
      FieldName = 'DataBaseCorrecao'
      Origin = 'Mensalidades.DataBaseCorrecao'
    end
    object tblMensBloqIndiceCorrecao: TFloatField
      FieldName = 'IndiceCorrecao'
      Origin = 'Mensalidades.IndiceCorrecao'
    end
  end
  object tblPoupanca: TUMZQuery
    Connection = db
    SQL.Strings = (
      'SELECT * FROM POUPANCA ORDER BY DATA')
    Params = <>
    Left = 88
    Top = 613
    object tblPoupancaData: TDateTimeField
      FieldName = 'Data'
    end
    object tblPoupancaIndiceCorrigido: TFloatField
      FieldName = 'IndiceCorrigido'
    end
    object tblPoupancaINDICEPOUPANCA: TFloatField
      FieldName = 'INDICEPOUPANCA'
    end
  end
  object tblControle: TUMZQuery
    Connection = db
    SQL.Strings = (
      'select * from '
      '    fin_controle_caixa'
      'Where '
      '   ds_situacao = :situacao AND '
      '   cd_conta_banco = :codcaixadepto')
    Params = <
      item
        DataType = ftString
        Name = 'Situacao'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'codcaixadepto'
        ParamType = ptUnknown
      end>
    Left = 192
    Top = 108
    ParamData = <
      item
        DataType = ftString
        Name = 'Situacao'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'codcaixadepto'
        ParamType = ptUnknown
      end>
    object tblControlecd_abertura_caixa: TIntegerField
      FieldName = 'cd_abertura_caixa'
      Origin = 'WMESTRE12.fin_controle_caixa.cd_abertura_caixa'
    end
    object tblControledt_abertura: TDateTimeField
      FieldName = 'dt_abertura'
      Origin = 'WMESTRE12.fin_controle_caixa.dt_abertura'
    end
    object tblControledt_fechamento: TDateTimeField
      FieldName = 'dt_fechamento'
      Origin = 'WMESTRE12.fin_controle_caixa.dt_fechamento'
    end
    object tblControlecd_conta_banco: TIntegerField
      FieldName = 'cd_conta_banco'
      Origin = 'WMESTRE12.fin_controle_caixa.cd_conta_banco'
    end
    object tblControlevl_saldo_abertura: TFloatField
      FieldName = 'vl_saldo_abertura'
      Origin = 'WMESTRE12.fin_controle_caixa.vl_saldo_abertura'
    end
    object tblControlevl_saldo_fechamento: TFloatField
      FieldName = 'vl_saldo_fechamento'
      Origin = 'WMESTRE12.fin_controle_caixa.vl_saldo_fechamento'
    end
    object tblControleds_situacao: TStringField
      FieldName = 'ds_situacao'
      Origin = 'WMESTRE12.fin_controle_caixa.ds_situacao'
      FixedChar = True
      Size = 1
    end
    object tblControlecd_usuario: TIntegerField
      FieldName = 'cd_usuario'
      Origin = 'WMESTRE12.fin_controle_caixa.cd_usuario'
    end
  end
  object tblCaixa: TUMZQuery
    Connection = db
    BeforePost = tblCaixaBeforePost
    SQL.Strings = (
      'select * from fin_mov_tesouraria'
      'where'
      'cd_abertura_caixa = :CodigoCaixa')
    Params = <
      item
        DataType = ftInteger
        Name = 'CodigoCaixa'
        ParamType = ptUnknown
      end>
    Left = 189
    Top = 8
    ParamData = <
      item
        DataType = ftInteger
        Name = 'CodigoCaixa'
        ParamType = ptUnknown
      end>
    object tblCaixacd_movimento_te: TIntegerField
      FieldName = 'cd_movimento_te'
      Origin = 'WMESTRE12.fin_mov_tesouraria.cd_movimento_te'
    end
    object tblCaixacd_caixa: TIntegerField
      FieldName = 'cd_caixa'
      Origin = 'WMESTRE12.fin_mov_tesouraria.cd_caixa'
    end
    object tblCaixacd_abertura_caixa: TIntegerField
      FieldName = 'cd_abertura_caixa'
      Origin = 'WMESTRE12.fin_mov_tesouraria.cd_abertura_caixa'
    end
    object tblCaixadt_movimento: TDateTimeField
      FieldName = 'dt_movimento'
      Origin = 'WMESTRE12.fin_mov_tesouraria.dt_movimento'
    end
    object tblCaixacd_acao: TIntegerField
      FieldName = 'cd_acao'
      Origin = 'WMESTRE12.fin_mov_tesouraria.cd_acao'
    end
    object tblCaixanr_documento: TStringField
      FieldName = 'nr_documento'
      Origin = 'WMESTRE12.fin_mov_tesouraria.nr_documento'
      Size = 50
    end
    object tblCaixads_movimento: TStringField
      FieldName = 'ds_movimento'
      Origin = 'WMESTRE12.fin_mov_tesouraria.ds_movimento'
      Size = 100
    end
    object tblCaixadt_liberacao: TDateTimeField
      FieldName = 'dt_liberacao'
      Origin = 'WMESTRE12.fin_mov_tesouraria.dt_liberacao'
    end
    object tblCaixacd_origem: TSmallintField
      FieldName = 'cd_origem'
      Origin = 'WMESTRE12.fin_mov_tesouraria.cd_origem'
    end
    object tblCaixads_observacao: TMemoField
      FieldName = 'ds_observacao'
      Origin = 'WMESTRE12.fin_mov_tesouraria.ds_observacao'
      BlobType = ftMemo
      Size = 1
    end
    object tblCaixatp_entrada_saida: TSmallintField
      FieldName = 'tp_entrada_saida'
      Origin = 'WMESTRE12.fin_mov_tesouraria.tp_entrada_saida'
    end
    object tblCaixavl_movimento: TFloatField
      FieldName = 'vl_movimento'
      Origin = 'WMESTRE12.fin_mov_tesouraria.vl_movimento'
    end
    object tblCaixavl_saldo: TFloatField
      FieldName = 'vl_saldo'
      Origin = 'WMESTRE12.fin_mov_tesouraria.vl_saldo'
    end
    object tblCaixavl_dinheiro: TFloatField
      FieldName = 'vl_dinheiro'
      Origin = 'WMESTRE12.fin_mov_tesouraria.vl_dinheiro'
    end
    object tblCaixavl_cheque: TFloatField
      FieldName = 'vl_cheque'
      Origin = 'WMESTRE12.fin_mov_tesouraria.vl_cheque'
    end
    object tblCaixacd_mensalidade: TIntegerField
      FieldName = 'cd_mensalidade'
      Origin = 'WMESTRE12.fin_mov_tesouraria.cd_mensalidade'
    end
    object tblCaixacd_usuario: TIntegerField
      FieldName = 'cd_usuario'
      Origin = 'WMESTRE12.fin_mov_tesouraria.cd_usuario'
    end
    object tblCaixacd_coligada: TSmallintField
      FieldName = 'cd_coligada'
      Origin = 'WMESTRE12.fin_mov_tesouraria.cd_coligada'
    end
    object tblCaixasn_compensado: TSmallintField
      FieldName = 'sn_compensado'
      Origin = 'WMESTRE12.fin_mov_tesouraria.sn_compensado'
    end
    object tblCaixacd_forma_pgto: TIntegerField
      FieldName = 'cd_forma_pgto'
      Origin = 'WMESTRE12.fin_mov_tesouraria.cd_forma_pgto'
    end
    object tblCaixadt_registro: TDateTimeField
      FieldName = 'dt_registro'
      Origin = 'WMESTRE12.fin_mov_tesouraria.dt_registro'
    end
    object tblCaixanr_cheque: TIntegerField
      FieldName = 'nr_cheque'
      Origin = 'WMESTRE12.fin_mov_tesouraria.nr_cheque'
    end
  end
  object tblFichaIndividual: TUMZQuery
    Connection = db
    AfterOpen = tblFichaIndividualAfterOpen
    BeforePost = tblFichaIndividualBeforePost
    SQL.Strings = (
      'select * from FichaIndividual'
      'WHERE codigoaluno = 0')
    Params = <>
    Left = 936
    Top = 8
    object tblFichaIndividualCodigoAluno: TIntegerField
      FieldName = 'CodigoAluno'
      Origin = 'FichaIndividual.CodigoAluno'
      DisplayFormat = '00000-0'
    end
    object tblFichaIndividualTurma: TStringField
      DisplayWidth = 50
      FieldName = 'Turma'
      Origin = 'FichaIndividual.Turma'
      Size = 50
    end
    object tblFichaIndividualCodigoGrade: TStringField
      DisplayWidth = 50
      FieldName = 'CodigoGrade'
      Origin = 'FichaIndividual.CodigoGrade'
      Size = 50
    end
    object tblFichaIndividualAnoSemestre: TSmallintField
      FieldName = 'AnoSemestre'
      Origin = 'FichaIndividual.AnoSemestre'
      DisplayFormat = '0000/0'
    end
    object tblFichaIndividualCurso: TStringField
      DisplayWidth = 15
      FieldName = 'Curso'
      Origin = 'FichaIndividual.Curso'
      Size = 15
    end
    object tblFichaIndividualNota1: TFloatField
      FieldName = 'Nota1'
      Origin = 'FichaIndividual.Nota1'
      OnGetText = tblFichaIndividualNota1GetText
      DisplayFormat = '#0.0'
    end
    object tblFichaIndividualNota2: TFloatField
      FieldName = 'Nota2'
      Origin = 'FichaIndividual.Nota2'
      OnGetText = tblFichaIndividualNota1GetText
      DisplayFormat = '#0.0'
    end
    object tblFichaIndividualNota3: TFloatField
      FieldName = 'Nota3'
      Origin = 'FichaIndividual.Nota3'
      OnGetText = tblFichaIndividualNota1GetText
      DisplayFormat = '#0.0'
    end
    object tblFichaIndividualNota4: TFloatField
      FieldName = 'Nota4'
      Origin = 'FichaIndividual.Nota4'
      OnGetText = tblFichaIndividualNota1GetText
      DisplayFormat = '#0.0'
    end
    object tblFichaIndividualNotaExame: TFloatField
      FieldName = 'NotaExame'
      Origin = 'FichaIndividual.NotaExame'
      OnGetText = tblFichaIndividualNotaExameGetText
      DisplayFormat = '#0.0'
    end
    object tblFichaIndividualSituacao: TSmallintField
      FieldName = 'Situacao'
      Origin = 'FichaIndividual.Situacao'
      DisplayFormat = '#0.0'
    end
    object tblFichaIndividualExame1: TFloatField
      FieldName = 'Exame1'
      Origin = 'FichaIndividual.Exame1'
      DisplayFormat = '#0.0'
    end
    object tblFichaIndividualExame2: TFloatField
      FieldName = 'Exame2'
      Origin = 'FichaIndividual.Exame2'
      DisplayFormat = '#0.0'
    end
    object tblFichaIndividualExame3: TFloatField
      FieldName = 'Exame3'
      Origin = 'FichaIndividual.Exame3'
      DisplayFormat = '#0.0'
    end
    object tblFichaIndividualExame4: TFloatField
      FieldName = 'Exame4'
      Origin = 'FichaIndividual.Exame4'
      DisplayFormat = '#0.0'
    end
    object tblFichaIndividualUsuario: TIntegerField
      FieldName = 'Usuario'
      Origin = 'FichaIndividual.Usuario'
    end
    object tblFichaIndividualGrau: TSmallintField
      FieldName = 'Grau'
      Origin = 'FichaIndividual.Grau'
    end
    object tblFichaIndividualSerie: TSmallintField
      FieldName = 'Serie'
      Origin = 'FichaIndividual.Serie'
    end
    object tblFichaIndividualMediaFinal: TFloatField
      FieldName = 'MediaFinal'
      Origin = 'FichaIndividual.MediaFinal'
      OnGetText = tblFichaIndividualNota1GetText
      DisplayFormat = '#0.0'
    end
    object tblFichaIndividualCodigoEscola: TSmallintField
      FieldName = 'CodigoEscola'
      Origin = 'FichaIndividual.CodigoEscola'
    end
    object tblFichaIndividualMediaAnual: TFloatField
      FieldName = 'MediaAnual'
      Origin = 'WMESTRE12.FichaIndividual.MediaAnual'
      OnGetText = tblFichaIndividualNota1GetText
    end
    object tblFichaIndividualAproveitamento: TStringField
      FieldName = 'Aproveitamento'
      Origin = 'WMESTRE12.FichaIndividual.Aproveitamento'
    end
    object tblFichaIndividualTurmaMatricula: TStringField
      DisplayWidth = 50
      FieldName = 'TurmaMatricula'
      Origin = 'WMESTRE12.FichaIndividual.TurmaMatricula'
      Size = 50
    end
    object tblFichaIndividualNota5: TFloatField
      FieldName = 'Nota5'
      Origin = 'WMESTRE12.FichaIndividual.Nota5'
      OnGetText = tblFichaIndividualNota1GetText
    end
    object tblFichaIndividualExame5: TFloatField
      FieldName = 'Exame5'
      Origin = 'WMESTRE12.FichaIndividual.Exame5'
    end
    object tblFichaIndividualNota6: TFloatField
      FieldName = 'Nota6'
      Origin = 'WMESTRE12.FichaIndividual.Nota6'
      OnGetText = tblFichaIndividualNota1GetText
    end
    object tblFichaIndividualExame6: TFloatField
      FieldName = 'Exame6'
      Origin = 'WMESTRE12.FichaIndividual.Exame6'
    end
    object tblFichaIndividualNota7: TFloatField
      FieldName = 'Nota7'
      Origin = 'WMESTRE12.FichaIndividual.Nota7'
      OnGetText = tblFichaIndividualNota1GetText
    end
    object tblFichaIndividualExame7: TFloatField
      FieldName = 'Exame7'
      Origin = 'WMESTRE12.FichaIndividual.Exame7'
    end
    object tblFichaIndividualNota8: TFloatField
      FieldName = 'Nota8'
      Origin = 'WMESTRE12.FichaIndividual.Nota8'
      OnGetText = tblFichaIndividualNota1GetText
    end
    object tblFichaIndividualExame8: TFloatField
      FieldName = 'Exame8'
      Origin = 'WMESTRE12.FichaIndividual.Exame8'
    end
    object tblFichaIndividualNota9: TFloatField
      FieldName = 'Nota9'
      Origin = 'WMESTRE12.FichaIndividual.Nota9'
      OnGetText = tblFichaIndividualNota1GetText
    end
    object tblFichaIndividualExame9: TFloatField
      FieldName = 'Exame9'
      Origin = 'WMESTRE12.FichaIndividual.Exame9'
    end
    object tblFichaIndividualNota10: TFloatField
      FieldName = 'Nota10'
      Origin = 'WMESTRE12.FichaIndividual.Nota10'
      OnGetText = tblFichaIndividualNota1GetText
    end
    object tblFichaIndividualExame10: TFloatField
      FieldName = 'Exame10'
      Origin = 'WMESTRE12.FichaIndividual.Exame10'
    end
    object tblFichaIndividualArrumarDiario: TStringField
      FieldName = 'ArrumarDiario'
      Origin = 'WMESTRE12.FichaIndividual.ArrumarDiario'
    end
    object tblFichaIndividualSegunda_Epoca: TFloatField
      FieldName = 'Segunda_Epoca'
      Origin = 'WMESTRE12.fichaindividual.Segunda_Epoca'
      OnGetText = tblFichaIndividualNotaExameGetText
    end
    object tblFichaIndividualnota_d1: TFloatField
      FieldName = 'nota_d1'
      Origin = 'WMESTRE12.fichaindividual.nota_d1'
      OnGetText = tblFichaIndividualnota_d1GetText
    end
    object tblFichaIndividualnota_d2: TFloatField
      FieldName = 'nota_d2'
      Origin = 'WMESTRE12.fichaindividual.nota_d2'
      OnGetText = tblFichaIndividualnota_d1GetText
    end
    object tblFichaIndividualnota_d3: TFloatField
      FieldName = 'nota_d3'
      Origin = 'WMESTRE12.fichaindividual.nota_d3'
      OnGetText = tblFichaIndividualnota_d1GetText
    end
    object tblFichaIndividualnota_d4: TFloatField
      FieldName = 'nota_d4'
      Origin = 'WMESTRE12.fichaindividual.nota_d4'
      OnGetText = tblFichaIndividualnota_d1GetText
    end
    object tblFichaIndividualnota_d5: TFloatField
      FieldName = 'nota_d5'
      Origin = 'WMESTRE12.fichaindividual.nota_d5'
      OnGetText = tblFichaIndividualnota_d1GetText
    end
    object tblFichaIndividualnota_d6: TFloatField
      FieldName = 'nota_d6'
      Origin = 'WMESTRE12.fichaindividual.nota_d6'
      OnGetText = tblFichaIndividualnota_d1GetText
    end
    object tblFichaIndividualnota_d7: TFloatField
      FieldName = 'nota_d7'
      Origin = 'WMESTRE12.fichaindividual.nota_d7'
      OnGetText = tblFichaIndividualnota_d1GetText
    end
    object tblFichaIndividualnota_d8: TFloatField
      FieldName = 'nota_d8'
      Origin = 'WMESTRE12.fichaindividual.nota_d8'
      OnGetText = tblFichaIndividualnota_d1GetText
    end
    object tblFichaIndividualnota_d9: TFloatField
      FieldName = 'nota_d9'
      Origin = 'WMESTRE12.fichaindividual.nota_d9'
      OnGetText = tblFichaIndividualnota_d1GetText
    end
    object tblFichaIndividualnota_d10: TFloatField
      FieldName = 'nota_d10'
      Origin = 'WMESTRE12.fichaindividual.nota_d10'
      OnGetText = tblFichaIndividualnota_d1GetText
    end
    object tblFichaIndividualsn_bloqueado1: TSmallintField
      FieldName = 'sn_bloqueado1'
      Origin = 'WMESTRE12.fichaindividual.sn_bloqueado1'
    end
    object tblFichaIndividualsn_bloqueado2: TSmallintField
      FieldName = 'sn_bloqueado2'
      Origin = 'WMESTRE12.fichaindividual.sn_bloqueado2'
    end
    object tblFichaIndividualsn_bloqueado3: TSmallintField
      FieldName = 'sn_bloqueado3'
      Origin = 'WMESTRE12.fichaindividual.sn_bloqueado3'
    end
    object tblFichaIndividualsn_bloqueado4: TSmallintField
      FieldName = 'sn_bloqueado4'
      Origin = 'WMESTRE12.fichaindividual.sn_bloqueado4'
    end
    object tblFichaIndividualsn_bloqueado5: TSmallintField
      FieldName = 'sn_bloqueado5'
      Origin = 'WMESTRE12.fichaindividual.sn_bloqueado5'
    end
    object tblFichaIndividualsn_bloqueado6: TSmallintField
      FieldName = 'sn_bloqueado6'
      Origin = 'WMESTRE12.fichaindividual.sn_bloqueado6'
    end
    object tblFichaIndividualsn_bloqueado7: TSmallintField
      FieldName = 'sn_bloqueado7'
      Origin = 'WMESTRE12.fichaindividual.sn_bloqueado7'
    end
    object tblFichaIndividualsn_bloqueado8: TSmallintField
      FieldName = 'sn_bloqueado8'
      Origin = 'WMESTRE12.fichaindividual.sn_bloqueado8'
    end
    object tblFichaIndividualsn_bloqueado9: TSmallintField
      FieldName = 'sn_bloqueado9'
      Origin = 'WMESTRE12.fichaindividual.sn_bloqueado9'
    end
    object tblFichaIndividualsn_bloqueado10: TSmallintField
      FieldName = 'sn_bloqueado10'
      Origin = 'WMESTRE12.fichaindividual.sn_bloqueado10'
    end
    object tblFichaIndividualfrequencia: TFloatField
      FieldName = 'frequencia'
      Origin = 'WMESTRE12.fichaindividual.frequencia'
      DisplayFormat = '##0.0'
    end
    object tblFichaIndividualds_media: TStringField
      FieldName = 'ds_media'
      Origin = 'WMESTRE12.fichaindividual.ds_media'
      Size = 10
    end
    object tblFichaIndividualdisciplina: TIntegerField
      FieldName = 'disciplina'
      Origin = 'WMESTRE12.fichaindividual.disciplina'
    end
    object tblFichaIndividualsn_bloq_freq_global: TSmallintField
      FieldName = 'sn_bloq_freq_global'
      Origin = 'WMESTRE12.fichaindividual.sn_bloq_freq_global'
    end
    object tblFichaIndividualsn_bloq_freq1: TSmallintField
      FieldName = 'sn_bloq_freq1'
      Origin = 'WMESTRE12.fichaindividual.sn_bloq_freq1'
    end
    object tblFichaIndividualsn_bloq_freq2: TSmallintField
      FieldName = 'sn_bloq_freq2'
      Origin = 'WMESTRE12.fichaindividual.sn_bloq_freq2'
    end
    object tblFichaIndividualsn_bloq_freq3: TSmallintField
      FieldName = 'sn_bloq_freq3'
      Origin = 'WMESTRE12.fichaindividual.sn_bloq_freq3'
    end
    object tblFichaIndividualsn_bloq_freq4: TSmallintField
      FieldName = 'sn_bloq_freq4'
      Origin = 'WMESTRE12.fichaindividual.sn_bloq_freq4'
    end
    object tblFichaIndividualsn_bloq_freq5: TSmallintField
      FieldName = 'sn_bloq_freq5'
      Origin = 'WMESTRE12.fichaindividual.sn_bloq_freq5'
    end
    object tblFichaIndividualsn_bloq_freq6: TSmallintField
      FieldName = 'sn_bloq_freq6'
      Origin = 'WMESTRE12.fichaindividual.sn_bloq_freq6'
    end
    object tblFichaIndividualsn_bloq_freq7: TSmallintField
      FieldName = 'sn_bloq_freq7'
      Origin = 'WMESTRE12.fichaindividual.sn_bloq_freq7'
    end
    object tblFichaIndividualsn_bloq_freq8: TSmallintField
      FieldName = 'sn_bloq_freq8'
      Origin = 'WMESTRE12.fichaindividual.sn_bloq_freq8'
    end
    object tblFichaIndividualsn_bloq_freq9: TSmallintField
      FieldName = 'sn_bloq_freq9'
      Origin = 'WMESTRE12.fichaindividual.sn_bloq_freq9'
    end
    object tblFichaIndividualsn_bloq_freq10: TSmallintField
      FieldName = 'sn_bloq_freq10'
      Origin = 'WMESTRE12.fichaindividual.sn_bloq_freq10'
    end
    object tblFichaIndividualcarga_horaria: TFloatField
      FieldName = 'carga_horaria'
    end
    object tblFichaIndividualsn_faltou_exame: TSmallintField
      FieldName = 'sn_faltou_exame'
    end
    object tblFichaIndividualsn_faltou_2epoca: TSmallintField
      FieldName = 'sn_faltou_2epoca'
      Required = True
    end
    object tblFichaIndividualsn_possui_adap: TSmallintField
      FieldName = 'sn_possui_adap'
    end
    object tblFichaIndividualsn_possui_depen: TSmallintField
      FieldName = 'sn_possui_depen'
    end
    object tblFichaIndividualTotalFaltas: TFloatField
      FieldName = 'TotalFaltas'
    end
    object tblFichaIndividualfalta1: TFloatField
      FieldName = 'falta1'
      OnGetText = tblFichaIndividualFalta1GetText
      DisplayFormat = '#0.0'
    end
    object tblFichaIndividualfalta2: TFloatField
      FieldName = 'falta2'
      OnGetText = tblFichaIndividualFalta1GetText
      DisplayFormat = '#0.0'
    end
    object tblFichaIndividualfalta3: TFloatField
      FieldName = 'falta3'
      OnGetText = tblFichaIndividualFalta1GetText
      DisplayFormat = '#0.0'
    end
    object tblFichaIndividualfalta4: TFloatField
      FieldName = 'falta4'
      OnGetText = tblFichaIndividualFalta1GetText
      DisplayFormat = '#0.0'
    end
    object tblFichaIndividualfalta5: TFloatField
      FieldName = 'falta5'
      OnGetText = tblFichaIndividualFalta1GetText
      DisplayFormat = '#0.0'
    end
    object tblFichaIndividualfalta6: TFloatField
      FieldName = 'falta6'
      OnGetText = tblFichaIndividualFalta1GetText
      DisplayFormat = '#0.0'
    end
    object tblFichaIndividualfalta7: TFloatField
      FieldName = 'falta7'
      OnGetText = tblFichaIndividualFalta1GetText
      DisplayFormat = '#0.0'
    end
    object tblFichaIndividualfalta8: TFloatField
      FieldName = 'falta8'
      OnGetText = tblFichaIndividualFalta1GetText
      DisplayFormat = '#0.0'
    end
    object tblFichaIndividualfalta9: TFloatField
      FieldName = 'falta9'
      OnGetText = tblFichaIndividualFalta1GetText
      DisplayFormat = '#0.0'
    end
    object tblFichaIndividualfalta10: TFloatField
      FieldName = 'falta10'
      OnGetText = tblFichaIndividualFalta1GetText
      DisplayFormat = '#0.0'
    end
    object tblFichaIndividualsn_bloqueio_nota_exame: TIntegerField
      FieldName = 'sn_bloqueio_nota_exame'
    end
    object tblFichaIndividualsn_bloqueio_2epoca: TIntegerField
      FieldName = 'sn_bloqueio_2epoca'
    end
    object tblFichaIndividualsn_bloqueio_ds_media: TIntegerField
      FieldName = 'sn_bloqueio_ds_media'
    end
    object tblFichaIndividualsn_dispensado_pi: TSmallintField
      FieldName = 'sn_dispensado_pi'
    end
    object tblFichaIndividualdt_matricula: TDateTimeField
      FieldName = 'dt_matricula'
    end
    object tblFichaIndividualdt_saida: TDateTimeField
      FieldName = 'dt_saida'
    end
    object tblFichaIndividualdt_inclusao: TDateTimeField
      FieldName = 'dt_inclusao'
    end
  end
  object tblCursosTurma: TUMZQuery
    Connection = db
    SQL.Strings = (
      
        'SELECT T.ANOSEMESTRE, c.CD_CURSO, C.DS_CONTRATO, C.DS_REQUERIMEN' +
        'TO FROM TURMAS T'
      
        'INNER JOIN CURSOS_COLIGADAS AS C ON (T.CURSO = C.CD_CURSO AND T.' +
        'CD_COLIGADA = C.CD_COLIGADA)')
    Params = <>
    Left = 287
    Top = 159
    object tblCursosTurmaANOSEMESTRE: TSmallintField
      FieldName = 'ANOSEMESTRE'
    end
    object tblCursosTurmaCD_CURSO: TStringField
      FieldName = 'CD_CURSO'
      Required = True
      Size = 15
    end
    object tblCursosTurmaDS_CONTRATO: TStringField
      FieldName = 'DS_CONTRATO'
      Size = 30
    end
    object tblCursosTurmaDS_REQUERIMENTO: TStringField
      FieldName = 'DS_REQUERIMENTO'
      Size = 50
    end
  end
  object tblProfessores: TUMZQuery
    Connection = db
    SQL.Strings = (
      'select * from Pessoas Pes, Professores Prof'
      'where Pes.cd_pessoa = Prof.cd_pessoa'
      'order by Prof.nm_apelido')
    Params = <>
    Left = 287
    Top = 260
    object tblProfessorescd_pessoa: TIntegerField
      FieldName = 'cd_pessoa'
      Origin = 'WMESTRE12.pessoas.cd_pessoa'
    end
    object tblProfessoresnm_pessoa: TStringField
      FieldName = 'nm_pessoa'
      Origin = 'WMESTRE12.pessoas.nm_pessoa'
      Size = 60
    end
    object tblProfessoresnm_apelido: TStringField
      FieldName = 'nm_apelido'
      Origin = 'WMESTRE12.pessoas.sn_senha_provisoria'
    end
  end
  object tblProfessoresDisciplinas: TUMZQuery
    Connection = db
    SQL.Strings = (
      
        'select ProfessoresDisciplinas.*, Disciplinas.* from ProfessoresD' +
        'isciplinas '
      'INNER JOIN Disciplinas ON '
      'ProfessoresDisciplinas.Disciplina = Disciplinas.Codigo'
      'where Professor = :Codigo')
    Params = <
      item
        DataType = ftInteger
        Name = 'Codigo'
        ParamType = ptUnknown
      end>
    Left = 287
    Top = 310
    ParamData = <
      item
        DataType = ftInteger
        Name = 'Codigo'
        ParamType = ptUnknown
      end>
    object tblProfessoresDisciplinasProfessor: TIntegerField
      FieldName = 'Professor'
      Origin = 'WMESTRE12.ProfessoresDisciplinas.Professor'
    end
    object tblProfessoresDisciplinasDisciplina: TSmallintField
      FieldName = 'Disciplina'
      Origin = 'WMESTRE12.ProfessoresDisciplinas.Disciplina'
    end
    object tblProfessoresDisciplinasCurso: TStringField
      FieldName = 'Curso'
      Origin = 'WMESTRE12.ProfessoresDisciplinas.Curso'
      Size = 15
    end
    object tblProfessoresDisciplinasCodigo: TSmallintField
      FieldName = 'Codigo'
      Origin = 'WMESTRE12.Disciplinas.Codigo'
    end
    object tblProfessoresDisciplinasOrdem: TSmallintField
      FieldName = 'Ordem'
      Origin = 'WMESTRE12.Disciplinas.Ordem'
    end
    object tblProfessoresDisciplinasCurso_1: TStringField
      FieldName = 'Curso_1'
      Origin = 'WMESTRE12.Disciplinas.Curso'
      Size = 15
    end
    object tblProfessoresDisciplinasSigla: TStringField
      FieldName = 'Sigla'
      Origin = 'WMESTRE12.Disciplinas.Sigla'
      Size = 10
    end
    object tblProfessoresDisciplinasDescricao: TStringField
      FieldName = 'Descricao'
      Origin = 'WMESTRE12.Disciplinas.Descricao'
      Size = 50
    end
  end
  object tblTurmas: TUMZQuery
    Connection = db
    SQL.Strings = (
      'select * from Turmas')
    Params = <>
    Left = 287
    Top = 108
    object tblTurmasCodigo: TStringField
      DisplayLabel = 'Turma'
      DisplayWidth = 50
      FieldName = 'Codigo'
      Origin = 'Turmas.Codigo'
      Size = 50
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
      Size = 15
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
    Left = 192
    Top = 260
    object tblCursosCodigo: TStringField
      DisplayLabel = 'Curso'
      DisplayWidth = 10
      FieldName = 'Codigo'
      Origin = 'Cursos.Codigo'
      Size = 15
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
  object tblDeptoCursoTurma: TUMZQuery
    Connection = db
    SQL.Strings = (
      
        'SELECT Turmas.Codigo, Turmas.AnoSemestre, Turmas.Curso, Turmas.S' +
        'erie, '
      
        'Turmas.Turno, CM.NR_GRAU Grau, Cursos.CD_DEPTO Depto, Turmas.cd_' +
        'centro, Turmas.cd_coligada'
      'FROM Turmas'
      
        'INNER JOIN cursos_coligadas Cursos ON (Cursos.cd_curso = Turmas.' +
        'Curso AND Turmas.cd_coligada = Cursos.CD_COLIGADA)'
      'INNER JOIN cursos_mestre CM ON (CM.CD_CURSO = Cursos.CD_CURSO)'
      'WHERE'
      'Turmas.AnoSemestre = :AnoSemestre and'
      'Turmas.Codigo = :Turma')
    Params = <
      item
        DataType = ftInteger
        Name = 'AnoSemestre'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'Turma'
        ParamType = ptUnknown
      end>
    Left = 287
    Top = 58
    ParamData = <
      item
        DataType = ftInteger
        Name = 'AnoSemestre'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'Turma'
        ParamType = ptUnknown
      end>
    object tblDeptoCursoTurmaCodigo: TStringField
      FieldName = 'Codigo'
      Origin = 'Turmas.Codigo'
      Size = 50
    end
    object tblDeptoCursoTurmaAnoSemestre: TSmallintField
      FieldName = 'AnoSemestre'
      Origin = 'Turmas.AnoSemestre'
    end
    object tblDeptoCursoTurmaCurso: TStringField
      FieldName = 'Curso'
      Origin = 'Turmas.Curso'
      Size = 15
    end
    object tblDeptoCursoTurmaDepto: TSmallintField
      FieldName = 'Depto'
      Origin = 'Cursos.Depto'
    end
    object tblDeptoCursoTurmaSerie: TSmallintField
      FieldName = 'Serie'
      Origin = 'Turmas.Codigo'
    end
    object tblDeptoCursoTurmaTurno: TStringField
      FieldName = 'Turno'
      Origin = 'Turmas.Codigo'
      Size = 1
    end
    object tblDeptoCursoTurmaGrau: TSmallintField
      FieldName = 'Grau'
      Origin = 'WMESTRE12.Cursos.Grau'
    end
    object tblDeptoCursoTurmacd_centro: TLargeintField
      FieldName = 'cd_centro'
    end
    object tblDeptoCursoTurmacd_coligada: TIntegerField
      FieldName = 'cd_coligada'
    end
  end
  object qryMatricularProvas: TUMZQuery
    Connection = db
    SQL.Strings = (
      'INSERT INTO Provas '
      '( AnoSemestre, CodigoAluno, Turma, Disciplina, Bimestre )'
      'SELECT DISTINCTROW '
      'Matriculas.AnoSemestre, Matriculas.CodigoAluno, '
      'Matriculas.Turma, GradeCurricular.Disciplina, :Bimestre'
      'FROM Matriculas '
      'INNER JOIN '
      '(Turmas INNER JOIN (GradeCurricular '
      'INNER JOIN Cursos ON '
      '(GradeCurricular.AnoSemestre = Cursos.AnoSemestre) AND'
      '(GradeCurricular.Curso = Cursos.Codigo)) '
      'ON (Turmas.Turno = GradeCurricular.Turno) AND '
      '(Turmas.Curso = GradeCurricular.Curso)) ON '
      '(Matriculas.Turma = Turmas.Codigo) AND '
      '(Matriculas.AnoSemestre = Turmas.AnoSemestre)'
      'WHERE '
      'Matriculas.CodigoAluno = :CodigoAluno and'
      'Matriculas.Turma = :Turma and'
      'Matriculas.AnoSemestre = :AnoSemestre and'
      'Cursos.GradePadrao=True')
    Params = <
      item
        DataType = ftInteger
        Name = 'Bimestre'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'CodigoAluno'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'Turma'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'AnoSemestre'
        ParamType = ptUnknown
      end>
    Left = 192
    Top = 462
    ParamData = <
      item
        DataType = ftInteger
        Name = 'Bimestre'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'CodigoAluno'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'Turma'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'AnoSemestre'
        ParamType = ptUnknown
      end>
  end
  object tblDisciplinas: TUMZQuery
    Connection = db
    SQL.Strings = (
      'select * from Disciplinas'
      'where Codigo = :Codigo'
      'and Curso = :Curso')
    Params = <
      item
        DataType = ftInteger
        Name = 'Codigo'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'Curso'
        ParamType = ptUnknown
      end>
    Left = 192
    Top = 563
    ParamData = <
      item
        DataType = ftInteger
        Name = 'Codigo'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'Curso'
        ParamType = ptUnknown
      end>
    object tblDisciplinasCodigo: TSmallintField
      DisplayLabel = 'C'#243'd'
      DisplayWidth = 6
      FieldName = 'Codigo'
      Origin = 'Disciplinas.Codigo'
    end
    object tblDisciplinasDescricao: TStringField
      DisplayWidth = 20
      FieldName = 'Descricao'
      Origin = 'Disciplinas.Descricao'
      Size = 50
    end
    object tblDisciplinasSigla: TStringField
      DisplayWidth = 10
      FieldName = 'Sigla'
      Origin = 'Disciplinas.Sigla'
      Size = 10
    end
    object tblDisciplinasCurso: TStringField
      DisplayWidth = 5
      FieldName = 'Curso'
      Origin = 'Disciplinas.Codigo'
      Size = 15
    end
  end
  object dtcFichaIndividual: TDataSource
    DataSet = tblFichaIndividual
    Left = 936
    Top = 56
  end
  object tblNotas: TUMZQuery
    Connection = db
    SQL.Strings = (
      'select * from Provas')
    Params = <>
    Left = 850
    Top = 200
    object tblNotasAnoSemestre: TSmallintField
      FieldName = 'AnoSemestre'
      Origin = 'Provas.AnoSemestre'
    end
    object tblNotasCodigoAluno: TIntegerField
      FieldName = 'CodigoAluno'
      Origin = 'Provas.CodigoAluno'
    end
    object tblNotasTurma: TStringField
      DisplayWidth = 50
      FieldName = 'Turma'
      Origin = 'Provas.Turma'
      Size = 50
    end
    object tblNotasDisciplina: TSmallintField
      FieldName = 'Disciplina'
      Origin = 'Provas.Disciplina'
    end
    object tblNotasBimestre: TSmallintField
      FieldName = 'Bimestre'
      Origin = 'Provas.Bimestre'
    end
    object tblNotasN1: TFloatField
      FieldName = 'N1'
      Origin = 'Provas.N1'
    end
    object tblNotasN2: TFloatField
      FieldName = 'N2'
      Origin = 'Provas.N2'
    end
    object tblNotasN3: TFloatField
      FieldName = 'N3'
      Origin = 'Provas.N3'
    end
    object tblNotasN4: TFloatField
      FieldName = 'N4'
      Origin = 'Provas.N4'
    end
    object tblNotasN5: TFloatField
      FieldName = 'N5'
      Origin = 'Provas.N5'
    end
    object tblNotasN6: TFloatField
      FieldName = 'N6'
      Origin = 'Provas.N6'
    end
    object tblNotasN7: TFloatField
      FieldName = 'N7'
      Origin = 'Provas.N7'
    end
    object tblNotasN8: TFloatField
      FieldName = 'N8'
      Origin = 'Provas.N8'
    end
    object tblNotasN9: TFloatField
      FieldName = 'N9'
      Origin = 'Provas.N9'
    end
    object tblNotasN10: TFloatField
      FieldName = 'N10'
      Origin = 'Provas.N10'
    end
    object tblNotasNAdicional: TFloatField
      FieldName = 'NAdicional'
      Origin = 'Provas.NAdicional'
    end
  end
  object dtcNotas: TDataSource
    DataSet = tblNotas
    Left = 850
    Top = 248
  end
  object dtcEscolas: TDataSource
    Left = 536
    Top = 613
  end
  object tblPlanos: TUMZQuery
    Connection = db
    SQL.Strings = (
      'select * from PlanosPagamento where'
      'Codigo = :Codigo')
    Params = <
      item
        DataType = ftInteger
        Name = 'Codigo'
        ParamType = ptUnknown
      end>
    Left = 850
    Top = 104
    ParamData = <
      item
        DataType = ftInteger
        Name = 'Codigo'
        ParamType = ptUnknown
      end>
    object tblPlanosCodigo: TIntegerField
      FieldName = 'Codigo'
      Origin = 'PlanosPagamento.Codigo'
    end
    object tblPlanosAnoSemestre: TSmallintField
      FieldName = 'AnoSemestre'
      Origin = 'PlanosPagamento.AnoSemestre'
    end
    object tblPlanosDescricao: TStringField
      FieldName = 'Descricao'
      Origin = 'PlanosPagamento.Descricao'
    end
    object tblPlanosTurma: TStringField
      FieldName = 'Turma'
      Origin = 'PlanosPagamento.Turma'
      Size = 50
    end
    object tblPlanosParcelas: TSmallintField
      FieldName = 'Parcelas'
      Origin = 'PlanosPagamento.Parcelas'
    end
    object tblPlanosValorCobrado: TFloatField
      FieldName = 'ValorCobrado'
      Origin = 'PlanosPagamento.ValorCobrado'
    end
    object tblPlanosValorContrato: TFloatField
      FieldName = 'ValorContrato'
      Origin = 'PlanosPagamento.ValorContrato'
    end
    object tblPlanosTaxaMaterial: TFloatField
      FieldName = 'TaxaMaterial'
      Origin = 'PlanosPagamento.TaxaMaterial'
    end
    object tblPlanosTaxaApostila: TFloatField
      FieldName = 'TaxaApostila'
      Origin = 'PlanosPagamento.TaxaApostila'
    end
    object tblPlanosDesconto: TFloatField
      FieldName = 'Desconto'
      Origin = 'PlanosPagamento.Desconto'
    end
    object tblPlanosMatricula: TFloatField
      FieldName = 'Matricula'
      Origin = 'PlanosPagamento.Matricula'
    end
    object tblPlanosApartir: TDateTimeField
      FieldName = 'Apartir'
      Origin = 'PlanosPagamento.Apartir'
    end
    object tblPlanosNumeroTaxasMaterial: TSmallintField
      FieldName = 'NumeroTaxasMaterial'
      Origin = 'PlanosPagamento.NumeroTaxasMaterial'
    end
    object tblPlanoscurso: TStringField
      FieldName = 'curso'
      Origin = 'WMESTRE12.planospagamento.curso'
      Size = 15
    end
    object tblPlanossn_creditos: TStringField
      FieldName = 'sn_creditos'
      Origin = 'WMESTRE12.planospagamento.sn_creditos'
      FixedChar = True
      Size = 1
    end
    object tblPlanosnr_creditos_base: TFloatField
      FieldName = 'nr_creditos_base'
      Origin = 'WMESTRE12.planospagamento.nr_creditos_base'
    end
  end
  object tblItensPagamento: TUMZQuery
    Connection = db
    SQL.Strings = (
      'SELECT'
      #9'fpi.CD_PLANO_ITEM AS codigoplano,'
      #9'fp.CD_COLIGADA AS cd_coligada,'
      #9'fpi.NR_MES AS mes,'
      #9'fpi.NR_PARCELA AS parcela,'
      #9'fpi.VL_BRUTO AS valorbruto,'
      #9'fpi.VL_DESCONTO AS valordesconto,'
      #9'fpi.VL_EXTRA AS valorextra,'
      #9'fpi.VL_DESCONTO_EXTRA AS descontoextra,'
      #9'fpi.VL_TOTAL AS valortotal,'
      #9'fpi.NR_DIA AS nr_dia,'
      #9'fpi.NR_ANO AS nr_ano,'
      #9'fpi.NR_CREDITOS_MINIMOS AS nr_creditos_minimos,'
      #9'CASE WHEN fpi.SN_CREDITO_PARCELA = 1 THEN'
      #9#9#39'S'#39
      #9'ELSE'
      #9#9#39'N'#39
      #9'END AS sn_credito_parcela,'
      #9'fpi.CD_TIPO_PARCELA AS cd_tipo_parcela,'
      #9'fpi.CD_PLANO_ITEM AS cd_item_plano'
      'FROM'
      #9'fin_planos_itens fpi'
      #9'INNER JOIN fin_planos fp ON (fp.CD_PLANO = fpi.CD_PLANO)'
      'WHERE'
      #9'fpi.CD_PLANO = :Codigo'
      'ORDER BY fpi.NR_PARCELA')
    Params = <
      item
        DataType = ftInteger
        Name = 'Codigo'
        ParamType = ptUnknown
        Size = 4
      end>
    Left = 192
    Top = 512
    ParamData = <
      item
        DataType = ftInteger
        Name = 'Codigo'
        ParamType = ptUnknown
        Size = 4
      end>
    object tblItensPagamentoCodigoPlano: TIntegerField
      FieldName = 'CodigoPlano'
      Origin = 'ItensPlanosPagamento.CodigoPlano'
    end
    object tblItensPagamentoMes: TSmallintField
      FieldName = 'Mes'
      Origin = 'ItensPlanosPagamento.Mes'
    end
    object tblItensPagamentoParcela: TSmallintField
      FieldName = 'Parcela'
      Origin = 'ItensPlanosPagamento.Parcela'
    end
    object tblItensPagamentoValorBruto: TFloatField
      FieldName = 'ValorBruto'
      Origin = 'ItensPlanosPagamento.ValorBruto'
    end
    object tblItensPagamentoValorDesconto: TFloatField
      FieldName = 'ValorDesconto'
      Origin = 'ItensPlanosPagamento.ValorDesconto'
    end
    object tblItensPagamentoValorExtra: TFloatField
      FieldName = 'ValorExtra'
      Origin = 'ItensPlanosPagamento.ValorExtra'
    end
    object tblItensPagamentoDescontoExtra: TFloatField
      FieldName = 'DescontoExtra'
      Origin = 'ItensPlanosPagamento.DescontoExtra'
    end
    object tblItensPagamentoValorTotal: TFloatField
      FieldName = 'ValorTotal'
      Origin = 'ItensPlanosPagamento.ValorTotal'
    end
    object tblItensPagamentonr_dia: TSmallintField
      FieldName = 'nr_dia'
      Origin = 'WMESTRE12.itensplanospagamento.nr_dia'
    end
    object tblItensPagamentonr_ano: TSmallintField
      FieldName = 'nr_ano'
      Origin = 'WMESTRE12.itensplanospagamento.nr_ano'
    end
    object tblItensPagamentonr_creditos_minimos: TFloatField
      FieldName = 'nr_creditos_minimos'
      Origin = 'WMESTRE12.itensplanospagamento.nr_creditos_minimos'
    end
    object tblItensPagamentosn_credito_parcela: TStringField
      FieldName = 'sn_credito_parcela'
      Origin = 'WMESTRE12.itensplanospagamento.sn_credito_parcela'
      FixedChar = True
      Size = 1
    end
  end
  object dtcPlanos: TDataSource
    DataSet = tblPlanos
    Left = 850
    Top = 152
  end
  object tblDeptos: TUMZQuery
    Connection = db
    SQL.Strings = (
      'select * from Departamentos')
    Params = <>
    Left = 765
    Top = 104
    object tblDeptosDescricao: TStringField
      DisplayLabel = 'Descri'#231#227'o'
      DisplayWidth = 20
      FieldName = 'Descricao'
      Origin = 'Departamentos.Descricao'
      Size = 50
    end
    object tblDeptosCodigo: TSmallintField
      DisplayLabel = 'C'#243'digo'
      DisplayWidth = 10
      FieldName = 'Codigo'
      Origin = 'Departamentos.Codigo'
      Visible = False
    end
  end
  object dtcDeptos: TDataSource
    DataSet = tblDeptos
    Left = 765
    Top = 152
  end
  object qryUpdate: TUMZQuery
    Connection = db
    Params = <>
    Left = 287
    Top = 411
  end
  object qrySum: TUMZQuery
    Connection = db
    Params = <>
    Left = 287
    Top = 462
  end
  object tblGrade: TUMZQuery
    Connection = db
    SQL.Strings = (
      'select '
      '  CAST(:AnoSemestre AS SIGNED) as AnoSemestre, '
      '  gd.CD_CURSO as Curso,'
      '  :Turno as Turno,'
      '  gd.CD_DISCIPLINA as Disciplina,'
      '  gd.NR_SERIE as Serie,'
      '  `gd`.`NR_AULAS` AS `NUMEROAULAS`,'
      '  `gd`.`VL_VALOR` AS `VALOR`,'
      
        '  CAST(CONCAT(:AnoSemestre,`gd`.`CD_GRADE`,`gd`.`CD_CURSO`, CONV' +
        'ERT(LPAD(`gd`.`NR_SERIE`,2,0) USING latin1),:Turno, CONVERT(LPAD' +
        '(`gd`.`CD_DISCIPLINA`,10,0) USING latin1)) AS CHAR CHARSET latin' +
        '1) AS `CODIGO`'
      'FROM'
      '  grades_disciplinas as gd '
      'WHERE'
      '  :AnoSemestre = :AnoSemestre AND'
      '  gd.CD_CURSO = :Curso AND'
      '  gd.NR_SERIE = :Serie AND'
      '  :Turno = :Turno AND'
      '  gd.CD_DISCIPLINA = :Disciplina')
    Params = <
      item
        DataType = ftInteger
        Name = 'AnoSemestre'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'Turno'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'Curso'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'Serie'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'Disciplina'
        ParamType = ptUnknown
      end>
    Left = 288
    Top = 512
    ParamData = <
      item
        DataType = ftInteger
        Name = 'AnoSemestre'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'Turno'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'Curso'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'Serie'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'Disciplina'
        ParamType = ptUnknown
      end>
    object tblGradeAnoSemestre: TLargeintField
      FieldName = 'AnoSemestre'
    end
    object tblGradeCurso: TStringField
      FieldName = 'Curso'
      Origin = 'GradeCurricular.Curso'
      Size = 15
    end
    object tblGradeTurno: TStringField
      FieldName = 'Turno'
      Origin = 'GradeCurricular.AnoSemestre'
      Size = 1
    end
    object tblGradeDisciplina: TSmallintField
      FieldName = 'Disciplina'
      Origin = 'GradeCurricular.Disciplina'
    end
    object tblGradeSerie: TSmallintField
      FieldName = 'Serie'
      Origin = 'GradeCurricular.Serie'
    end
    object tblGradeNumeroAulas: TFloatField
      FieldName = 'NumeroAulas'
      Origin = 'GradeCurricular.NumeroAulas'
    end
    object tblGradeValor: TFloatField
      FieldName = 'Valor'
      Origin = 'GradeCurricular.Valor'
    end
    object tblGradeCodigo: TStringField
      FieldName = 'Codigo'
      Origin = 'GradeCurricular.AnoSemestre'
    end
  end
  object qryMax: TUMZQuery
    Connection = db
    Params = <>
    Left = 392
    Top = 8
  end
  object tblUsuarios: TUMZQuery
    Connection = db
    SQL.Strings = (
      'SELECT'
      '   CD_PESSOA CODIGO,'
      '   DS_LOGIN NOME,'
      '   DS_SENHA SENHA'
      'FROM'
      '   PESSOAS'
      'WHERE'
      '   DS_LOGIN LIKE :DS_LOGIN')
    Params = <
      item
        DataType = ftUnknown
        Name = 'DS_LOGIN'
        ParamType = ptUnknown
      end>
    Left = 88
    Top = 260
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'DS_LOGIN'
        ParamType = ptUnknown
      end>
    object tblUsuariosCODIGO: TIntegerField
      DisplayLabel = 'Codigo'
      FieldName = 'CODIGO'
    end
    object tblUsuariosNome2: TStringField
      FieldName = 'Nome'
      Size = 30
    end
    object tblUsuariosSenha: TStringField
      FieldName = 'Senha'
      Size = 10
    end
    object tblUsuariosCD_PESSOA: TIntegerField
      FieldName = 'CD_PESSOA'
    end
    object tblUsuariosSN_ONLINE: TStringField
      FieldName = 'SN_ONLINE'
      Size = 1
    end
  end
  object tblFeriadosFilha: TUMZQuery
    Connection = db
    SQL.Strings = (
      'SELECT'
      '   NR_DIA,'
      '   NR_MES,'
      '   NR_ANO,'
      '   DESCRICAO,'
      '   SN_BIBLIOTECA,'
      '   SN_FINANCEIRO,'
      '   SN_SECRETARIA'
      'FROM'
      '   CALENDARIO'
      'WHERE'
      '   NR_DIA = :DIA AND'
      '   NR_MES = :MES AND'
      '   NR_ANO = :ANO AND'
      '   CD_COLIGADA = :COLIGADA AND'
      '   SN_FINANCEIRO = '#39'N'#39)
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
      end
      item
        DataType = ftUnknown
        Name = 'COLIGADA'
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
      end
      item
        DataType = ftUnknown
        Name = 'COLIGADA'
        ParamType = ptUnknown
      end>
  end
  object tblMotivos: TUMZQuery
    Connection = db
    AfterInsert = tblMotivosAfterInsert
    AfterPost = tblMotivosAfterPost
    SQL.Strings = (
      'select * from MotivosMensalidades'
      'where '
      'CodigoAluno = :CodigoAluno and'
      'Parcela = :Parcela and'
      'DataMotivo = :DataMotivo and'
      'Turma = :Turma')
    Params = <
      item
        DataType = ftInteger
        Name = 'CodigoAluno'
        ParamType = ptUnknown
      end
      item
        DataType = ftSmallint
        Name = 'Parcela'
        ParamType = ptUnknown
      end
      item
        DataType = ftDateTime
        Name = 'DataMotivo'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'Turma'
        ParamType = ptUnknown
      end>
    SQLList.Strings = (
      
        'mysql-5=select * from MotivosMensalidades'#13#10'where '#13#10'CodigoAluno =' +
        ' :CodigoAluno and'#13#10'Parcela = :Parcela and'#13#10'DataMotivo = :DataMot' +
        'ivo and'#13#10'Turma = :Turma'
      
        'oracle=select * from MotivosMensalidades'#13#10'where '#13#10'CodigoAluno = ' +
        ':CodigoAluno and'#13#10'Parcela = :Parcela and'#13#10'DataMotivo = TO_DATE(:' +
        'DataMotivo, '#39'YYYY-MM-DD'#39') and'#13#10'Turma = :Turma')
    Left = 765
    Top = 297
    ParamData = <
      item
        DataType = ftInteger
        Name = 'CodigoAluno'
        ParamType = ptUnknown
      end
      item
        DataType = ftSmallint
        Name = 'Parcela'
        ParamType = ptUnknown
      end
      item
        DataType = ftDateTime
        Name = 'DataMotivo'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'Turma'
        ParamType = ptUnknown
      end>
    object tblMotivosCodigoAluno: TIntegerField
      FieldName = 'CodigoAluno'
      Origin = 'MotivosMensalidades.CodigoAluno'
      DisplayFormat = '00000-0'
    end
    object tblMotivosParcela: TSmallintField
      FieldName = 'Parcela'
      Origin = 'MotivosMensalidades.Parcela'
    end
    object tblMotivosDataMotivo: TDateTimeField
      FieldName = 'DataMotivo'
      Origin = 'MotivosMensalidades.DataMotivo'
      DisplayFormat = 'dd/mm/yyyy'
    end
    object tblMotivosAutorizadoPor: TIntegerField
      FieldName = 'AutorizadoPor'
      Origin = 'MotivosMensalidades.AutorizadoPor'
    end
    object tblMotivosMotivo: TMemoField
      FieldName = 'Motivo'
      Origin = 'WMESTRE12.MotivosMensalidades.Motivo'
      BlobType = ftMemo
      Size = 1
    end
    object tblMotivosturma: TStringField
      FieldName = 'turma'
      Origin = 'WMESTRE12.motivosmensalidades.turma'
      Size = 50
    end
  end
  object tblControleBonus: TUMZQuery
    Connection = db
    SQL.Strings = (
      'select * from ControleBonus')
    Params = <>
    Left = 290
    Top = 8
    object tblControleBonusCodigo: TIntegerField
      FieldName = 'Codigo'
      Origin = 'ControleBonus.Codigo'
    end
    object tblControleBonusDataCalculo: TDateTimeField
      FieldName = 'DataCalculo'
      Origin = 'ControleBonus.DataCalculo'
    end
    object tblControleBonusUsuario: TStringField
      FieldName = 'Usuario'
      Origin = 'ControleBonus.Usuario'
      Size = 30
    end
  end
  object tblDiscGrade: TUMZQuery
    Connection = db
    SQL.Strings = (
      'SELECT DISTINCTROW GradeCurricular.Codigo, Turmas.Turno, '
      'Turmas.Serie, Turmas.Curso, Turmas.Grau'
      'FROM (GradeCurricular INNER JOIN Turmas ON '
      '(GradeCurricular.Curso = Turmas.Curso) AND '
      '(GradeCurricular.AnoSemestre = Turmas.AnoSemestre) AND '
      '(GradeCurricular.Serie = Turmas.Serie) AND '
      '(GradeCurricular.Turno = Turmas.Turno)) INNER JOIN '
      
        'Disciplinas ON (GradeCurricular.Disciplina = Disciplinas.Codigo)' +
        ' AND '
      '(GradeCurricular.Curso = Disciplinas.Curso)'
      'where'
      'GradeCurricular.AnoSemestre = :AnoSemestre and'
      'Disciplinas.Sigla = :Sigla and'
      'Turmas.Codigo = :Turma')
    Params = <
      item
        DataType = ftInteger
        Name = 'AnoSemestre'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'Sigla'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'Turma'
        ParamType = ptUnknown
      end>
    Left = 87
    Top = 108
    ParamData = <
      item
        DataType = ftInteger
        Name = 'AnoSemestre'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'Sigla'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'Turma'
        ParamType = ptUnknown
      end>
    object tblDiscGradeCodigo: TStringField
      FieldName = 'Codigo'
    end
    object tblDiscGradeTurno: TStringField
      FieldName = 'Turno'
      Size = 1
    end
    object tblDiscGradeSerie: TSmallintField
      FieldName = 'Serie'
    end
    object tblDiscGradeCurso: TStringField
      FieldName = 'Curso'
      Size = 15
    end
    object tblDiscGradeGrau: TSmallintField
      FieldName = 'Grau'
    end
  end
  object tblNNBB: TUMZQuery
    Connection = db
    SQL.Strings = (
      'select * from NossoNumeroBB')
    Params = <>
    Left = 192
    Top = 209
    object tblNNBBNumeroBB: TIntegerField
      FieldName = 'NumeroBB'
      Origin = 'NossoNumeroBB.NumeroBB'
    end
  end
  object tblPI: TUMZQuery
    Connection = db
    BeforePost = tblFichaIndividualBeforePost
    SQL.Strings = (
      'select * '
      'from ProvaInstitucional'
      'WHERE'
      '   CodigoAluno = :CodigoAluno AND '
      '   Turma = :Turma AND'
      '    AnoSemestre = :AnoSemestre'
      '    ')
    Params = <
      item
        DataType = ftUnknown
        Name = 'CodigoAluno'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'Turma'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'AnoSemestre'
        ParamType = ptUnknown
      end>
    Left = 88
    Top = 411
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'CodigoAluno'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'Turma'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'AnoSemestre'
        ParamType = ptUnknown
      end>
    object tblPICodigoAluno: TIntegerField
      FieldName = 'CodigoAluno'
      Origin = 'WMESTRE12.ProvaInstitucional.CodigoAluno'
    end
    object tblPITurma: TStringField
      FieldName = 'Turma'
      Origin = 'WMESTRE12.ProvaInstitucional.Turma'
      Size = 50
    end
    object tblPIAnoSemestre: TSmallintField
      FieldName = 'AnoSemestre'
      Origin = 'WMESTRE12.ProvaInstitucional.AnoSemestre'
    end
    object tblPINotaRedacao: TFloatField
      FieldName = 'NotaRedacao'
      Origin = 'WMESTRE12.ProvaInstitucional.NotaRedacao'
    end
    object tblPINotaProva: TFloatField
      FieldName = 'NotaProva'
      Origin = 'WMESTRE12.ProvaInstitucional.NotaProva'
    end
    object tblPIMediaInstitucional: TFloatField
      FieldName = 'MediaInstitucional'
      Origin = 'WMESTRE12.ProvaInstitucional.MediaInstitucional'
    end
  end
  object quReprovaFreq: TUMZQuery
    Connection = db
    Params = <>
    Left = 191
    Top = 613
  end
  object quReprova2aEp: TUMZQuery
    Connection = db
    Params = <>
    Left = 192
    Top = 664
  end
  object tblMensalidades: TUMZQuery
    Connection = db
    BeforeOpen = tblMensalidadesBeforeOpen
    OnCalcFields = tblMensalidadesCalcFields
    BeforePost = tblMensalidadesBeforePost
    OnPostError = tblMensalidadesPostError
    SQL.Strings = (
      'select * from Mensalidades')
    Params = <>
    Left = 680
    Top = 296
    object tblMensalidadesCodigoAluno: TIntegerField
      DisplayLabel = 'C'#243'd.Aluno'
      FieldName = 'CodigoAluno'
      Origin = 'Mensalidades.CodigoAluno'
      DisplayFormat = '00000-0'
    end
    object tblMensalidadesParcela: TSmallintField
      Alignment = taLeftJustify
      FieldName = 'Parcela'
      Origin = 'Mensalidades.Parcela'
    end
    object tblMensalidadesDataVencimento: TDateTimeField
      Alignment = taCenter
      DisplayLabel = 'Vencimento'
      FieldName = 'DataVencimento'
      Origin = 'Mensalidades.DataVencimento'
      EditMask = '!99/99/0000;1;_'
    end
    object tblMensalidadesTurma: TStringField
      Alignment = taCenter
      DisplayWidth = 50
      FieldName = 'Turma'
      Origin = 'Mensalidades.Turma'
      Size = 50
    end
    object tblMensalidadesDataEmissao: TDateTimeField
      FieldName = 'DataEmissao'
      Origin = 'Mensalidades.DataEmissao'
    end
    object tblMensalidadesNossoNumero: TStringField
      FieldName = 'NossoNumero'
      Origin = 'Mensalidades.NossoNumero'
      Size = 30
    end
    object tblMensalidadesValorBruto: TFloatField
      FieldName = 'ValorBruto'
      Origin = 'Mensalidades.ValorBruto'
      DisplayFormat = '###,###,##0.00'
    end
    object tblMensalidadesValorDesconto: TFloatField
      FieldName = 'ValorDesconto'
      Origin = 'Mensalidades.ValorDesconto'
      DisplayFormat = '###,###,##0.00'
    end
    object tblMensalidadesDescontoExtra: TFloatField
      FieldName = 'DescontoExtra'
      Origin = 'Mensalidades.DescontoExtra'
      DisplayFormat = '###,###,##0.00'
    end
    object tblMensalidadesValorExtra: TFloatField
      FieldName = 'ValorExtra'
      Origin = 'Mensalidades.ValorExtra'
      DisplayFormat = '###,###,##0.00'
    end
    object tblMensalidadesValorTotal: TFloatField
      FieldName = 'ValorTotal'
      Origin = 'Mensalidades.ValorTotal'
      DisplayFormat = '###,###,##0.00'
    end
    object tblMensalidadesValorJuros: TFloatField
      FieldName = 'ValorJuros'
      Origin = 'Mensalidades.ValorJuros'
      DisplayFormat = '###,###,##0.00'
    end
    object tblMensalidadesValorPago: TFloatField
      FieldName = 'ValorPago'
      Origin = 'Mensalidades.ValorPago'
      DisplayFormat = '###,###,##0.00'
      EditFormat = '########0.00'
    end
    object tblMensalidadesDataPagamento: TDateTimeField
      Alignment = taCenter
      FieldName = 'DataPagamento'
      Origin = 'Mensalidades.DataPagamento'
      EditMask = '!99/99/0000;1;_'
    end
    object tblMensalidadesSituacao: TSmallintField
      FieldName = 'Situacao'
      Origin = 'Mensalidades.Situacao'
    end
    object tblMensalidadesUsuario: TStringField
      FieldName = 'Usuario'
      Origin = 'Mensalidades.Usuario'
      Size = 30
    end
    object tblMensalidadesBloqueto: TStringField
      FieldName = 'Bloqueto'
      Origin = 'Mensalidades.Bloqueto'
    end
    object tblMensalidadesAnoSemestre: TSmallintField
      DisplayLabel = 'Ano/Sem.'
      FieldName = 'AnoSemestre'
      Origin = 'Mensalidades.AnoSemestre'
      DisplayFormat = '0000/0'
      EditFormat = '0000/0;0;_'
    end
    object tblMensalidadesDataBaseCorrecao: TDateTimeField
      FieldName = 'DataBaseCorrecao'
      Origin = 'Mensalidades.DataBaseCorrecao'
    end
    object tblMensalidadesIndiceCorrecao: TFloatField
      FieldName = 'IndiceCorrecao'
      Origin = 'Mensalidades.IndiceCorrecao'
      DisplayFormat = '###,###,##0.00'
    end
    object tblMensalidadesValorTotalCalc: TFloatField
      FieldKind = fkCalculated
      FieldName = 'ValorTotalCalc'
      DisplayFormat = '###,###,##0.00'
      Calculated = True
    end
    object tblMensalidadesCurso: TStringField
      DisplayWidth = 15
      FieldName = 'Curso'
      Origin = 'Mensalidades.CodigoAluno'
      Size = 15
    end
    object tblMensalidadesDepto: TSmallintField
      FieldName = 'Depto'
      Origin = 'Mensalidades.Parcela'
    end
    object tblMensalidadesValorJurosCalc: TFloatField
      FieldKind = fkCalculated
      FieldName = 'ValorJurosCalc'
      Calculated = True
    end
    object tblMensalidadestipoparcela: TSmallintField
      FieldName = 'tipoparcela'
      Origin = 'WMESTRE12.mensalidades.tipoparcela'
    end
    object tblMensalidadesocorrencia_remessa: TSmallintField
      FieldName = 'ocorrencia_remessa'
      Origin = 'WMESTRE12.mensalidades.ocorrencia_remessa'
    end
    object tblMensalidadesocorrencia_retorno: TSmallintField
      FieldName = 'ocorrencia_retorno'
      Origin = 'WMESTRE12.mensalidades.ocorrencia_retorno'
    end
    object tblMensalidadessn_credito_parcela: TStringField
      FieldName = 'sn_credito_parcela'
      Origin = 'WMESTRE12.mensalidades.sn_credito_parcela'
      FixedChar = True
      Size = 1
    end
    object tblMensalidadesnr_creditos: TFloatField
      FieldName = 'nr_creditos'
      Origin = 'WMESTRE12.mensalidades.nr_creditos'
    end
    object tblMensalidadescd_mensalidade: TIntegerField
      FieldName = 'cd_mensalidade'
      Origin = 'WMESTRE12.mensalidades.cd_mensalidade'
    end
    object tblMensalidadescd_mensalidade_origem: TIntegerField
      FieldName = 'cd_mensalidade_origem'
      Origin = 'WMESTRE12.mensalidades.cd_mensalidade_origem'
    end
    object tblMensalidadesvalorjuros_fixo: TFloatField
      FieldName = 'valorjuros_fixo'
      Origin = 'WMESTRE12.mensalidades.valorjuros_fixo'
    end
    object tblMensalidadescd_coligada: TSmallintField
      FieldName = 'cd_coligada'
      Origin = 'WMESTRE12.mensalidades.cd_coligada'
    end
    object tblMensalidadescd_tipo_titulo: TSmallintField
      FieldName = 'cd_tipo_titulo'
      Origin = 'WMESTRE12.mensalidades.cd_tipo_titulo'
    end
    object tblMensalidadesds_tipo_titulo: TStringField
      FieldKind = fkLookup
      FieldName = 'ds_tipo_titulo'
      LookupDataSet = qyTitulosReceita
      LookupKeyFields = 'cd_tipo_titulo'
      LookupResultField = 'ds_tipo_titulo'
      KeyFields = 'cd_tipo_titulo'
      Size = 50
      Lookup = True
    end
    object tblMensalidadesdt_competencia: TDateTimeField
      Alignment = taCenter
      DisplayLabel = 'Compet'#234'ncia'
      DisplayWidth = 10
      FieldName = 'dt_competencia'
      Origin = 'WMESTRE12.mensalidades.dt_competencia'
    end
    object tblMensalidadesds_historico: TStringField
      FieldName = 'ds_historico'
      Origin = 'WMESTRE12.mensalidades.ds_historico'
      Size = 150
    end
    object tblMensalidadeshr_atual: TStringField
      FieldKind = fkCalculated
      FieldName = 'hr_atual'
      Calculated = True
    end
    object tblMensalidadesdt_atual: TStringField
      FieldKind = fkCalculated
      FieldName = 'dt_atual'
      Calculated = True
    end
    object tblMensalidadescd_caixa: TIntegerField
      FieldName = 'cd_caixa'
      Origin = 'WMESTRE12.mensalidades.cd_caixa'
    end
    object tblMensalidadescd_resp: TIntegerField
      FieldName = 'cd_resp'
      Origin = 'WMESTRE12.mensalidades.cd_resp'
    end
    object tblMensalidadesvl_pago_moeda: TFloatField
      FieldName = 'vl_pago_moeda'
      Origin = 'WMESTRE12.mensalidades.vl_pago_moeda'
      DisplayFormat = '###,###,##0.00'
      EditFormat = '########0.00'
    end
    object tblMensalidadesvl_credito: TFloatField
      FieldName = 'vl_credito'
    end
    object tblMensalidadesdt_credito: TDateTimeField
      FieldName = 'dt_credito'
      Origin = 'WMESTRE12.mensalidades.dt_credito'
    end
    object tblMensalidadessn_liberar_juros: TSmallintField
      FieldName = 'sn_liberar_juros'
      Origin = 'WMESTRE12.mensalidades.sn_liberar_juros'
    end
    object tblMensalidadessn_liberar_descontos: TSmallintField
      FieldName = 'sn_liberar_descontos'
      Origin = 'WMESTRE12.mensalidades.sn_liberar_descontos'
    end
    object tblMensalidadesds_deposito: TStringField
      FieldName = 'ds_deposito'
      Origin = 'WMESTRE12.mensalidades.ds_deposito'
      Size = 50
    end
    object tblMensalidadesValorDescontoCalc: TCurrencyField
      Tag = 1
      DisplayLabel = 'Desc.Cond.'
      FieldKind = fkCalculated
      FieldName = 'ValorDescontoCalc'
      DisplayFormat = '###,###,##0.00'
      Calculated = True
    end
    object tblMensalidadescd_centro_custo: TLargeintField
      FieldName = 'cd_centro_custo'
      Required = True
    end
    object tblMensalidadescd_plano_conta: TLargeintField
      FieldName = 'cd_plano_conta'
      Required = True
    end
    object tblMensalidadescd_usuario: TLargeintField
      FieldName = 'cd_usuario'
    end
    object tblMensalidadescd_moeda: TLargeintField
      FieldName = 'cd_moeda'
    end
    object tblMensalidadescd_moeda_pgto: TLargeintField
      FieldName = 'cd_moeda_pgto'
    end
    object tblMensalidadescd_cheque_devolvido: TLargeintField
      FieldName = 'cd_cheque_devolvido'
    end
    object tblMensalidadessn_nfe_gerada: TIntegerField
      FieldName = 'sn_nfe_gerada'
    end
    object tblMensalidadesvalordesconto_fixo: TFloatField
      FieldName = 'valordesconto_fixo'
    end
    object tblMensalidadescd_autenticacao: TStringField
      FieldName = 'cd_autenticacao'
      Size = 50
    end
  end
  object tblEmpresa: TUMZQuery
    Connection = db
    SQL.Strings = (
      'select * from Empresas'
      'Order by nm_empresa')
    Params = <>
    Left = 88
    Top = 361
    object tblEmpresacd_empresa: TIntegerField
      FieldName = 'cd_empresa'
      Origin = 'WMESTRE12.empresas.cd_empresa'
    end
    object tblEmpresanm_empresa: TStringField
      FieldName = 'nm_empresa'
      Origin = 'WMESTRE12.empresas.nm_empresa'
      Size = 80
    end
    object tblEmpresanm_razao_social: TStringField
      FieldName = 'nm_razao_social'
      Origin = 'WMESTRE12.empresas.nm_razao_social'
      Size = 80
    end
    object tblEmpresads_endereco: TStringField
      FieldName = 'ds_endereco'
      Origin = 'WMESTRE12.empresas.ds_endereco'
      Size = 80
    end
    object tblEmpresads_complemento: TStringField
      FieldName = 'ds_complemento'
      Origin = 'WMESTRE12.empresas.ds_complemento'
      Size = 50
    end
    object tblEmpresads_bairro: TStringField
      FieldName = 'ds_bairro'
      Origin = 'WMESTRE12.empresas.ds_bairro'
      Size = 50
    end
    object tblEmpresads_cidade: TStringField
      FieldName = 'ds_cidade'
      Origin = 'WMESTRE12.empresas.ds_cidade'
      Size = 50
    end
    object tblEmpresads_estado: TStringField
      FieldName = 'ds_estado'
      Origin = 'WMESTRE12.empresas.ds_estado'
      FixedChar = True
      Size = 3
    end
    object tblEmpresads_cep: TStringField
      FieldName = 'ds_cep'
      Origin = 'WMESTRE12.empresas.ds_cep'
      Size = 8
    end
    object tblEmpresanm_contato: TStringField
      FieldName = 'nm_contato'
      Origin = 'WMESTRE12.empresas.nm_contato'
      Size = 80
    end
    object tblEmpresads_telefone1: TStringField
      FieldName = 'ds_telefone1'
      Origin = 'WMESTRE12.empresas.ds_telefone1'
      Size = 25
    end
    object tblEmpresads_telefone2: TStringField
      FieldName = 'ds_telefone2'
      Origin = 'WMESTRE12.empresas.ds_telefone2'
      Size = 25
    end
    object tblEmpresads_email: TStringField
      FieldName = 'ds_email'
      Origin = 'WMESTRE12.empresas.ds_email'
      Size = 100
    end
    object tblEmpresads_site: TStringField
      FieldName = 'ds_site'
      Origin = 'WMESTRE12.empresas.ds_site'
      Size = 100
    end
    object tblEmpresacd_area_atuacao: TIntegerField
      FieldName = 'cd_area_atuacao'
      Origin = 'WMESTRE12.empresas.cd_area_atuacao'
    end
  end
  object tblTitulacoes: TZTable
    Connection = db
    TableName = 'mec_titulacoes'
    Left = 536
    Top = 259
    object tblTitulacoescd_titulacao: TIntegerField
      DisplayLabel = 'Cod. Titula'#231#227'o'
      FieldName = 'cd_titulacao'
      Required = True
    end
    object tblTitulacoesds_titulacao: TStringField
      DisplayLabel = 'Titula'#231#227'o'
      FieldName = 'ds_titulacao'
      Size = 30
    end
  end
  object tblFuncTipoAtuacao: TZTable
    Connection = db
    TableName = 'funcionarios_tipos_atuacao'
    Left = 536
    Top = 208
    object tblFuncTipoAtuacaocd_tipo_atuacao: TSmallintField
      FieldName = 'cd_tipo_atuacao'
      Required = True
    end
    object tblFuncTipoAtuacaods_tipo_atuacao: TStringField
      FieldName = 'ds_tipo_atuacao'
      Size = 50
    end
  end
  object tblEmpresas: TZTable
    Connection = db
    TableName = 'empresas'
    Left = 536
    Top = 409
    object tblEmpresascd_empresa: TIntegerField
      FieldName = 'cd_empresa'
      Required = True
    end
    object tblEmpresasnm_empresa: TStringField
      FieldName = 'nm_empresa'
      Size = 80
    end
    object tblEmpresasnm_razao_social: TStringField
      FieldName = 'nm_razao_social'
      Size = 80
    end
    object tblEmpresasds_endereco: TStringField
      FieldName = 'ds_endereco'
      Size = 80
    end
    object tblEmpresasds_complemento: TStringField
      FieldName = 'ds_complemento'
      Size = 50
    end
    object tblEmpresasds_bairro: TStringField
      FieldName = 'ds_bairro'
      Size = 50
    end
    object tblEmpresasds_cidade: TStringField
      FieldName = 'ds_cidade'
      Size = 50
    end
    object tblEmpresasds_estado: TStringField
      FieldName = 'ds_estado'
      FixedChar = True
      Size = 3
    end
    object tblEmpresasds_cep: TStringField
      FieldName = 'ds_cep'
      Size = 8
    end
    object tblEmpresasnm_contato: TStringField
      FieldName = 'nm_contato'
      Size = 80
    end
    object tblEmpresasds_telefone1: TStringField
      FieldName = 'ds_telefone1'
      Size = 25
    end
    object tblEmpresasds_telefone2: TStringField
      FieldName = 'ds_telefone2'
      Size = 25
    end
    object tblEmpresasds_email: TStringField
      FieldName = 'ds_email'
      Size = 100
    end
    object tblEmpresasds_site: TStringField
      FieldName = 'ds_site'
      Size = 100
    end
    object tblEmpresascd_area_atuacao: TIntegerField
      FieldName = 'cd_area_atuacao'
    end
  end
  object tblRegimeTrabalho: TZTable
    Connection = db
    TableName = 'funcionarios_tipos_regimes'
    Left = 536
    Top = 158
    object tblRegimeTrabalhocd_regime: TIntegerField
      DisplayLabel = 'Cod. Regime'
      FieldName = 'cd_regime'
      Required = True
    end
    object tblRegimeTrabalhods_regime: TStringField
      DisplayLabel = 'Descri'#231#227'o'
      FieldName = 'ds_regime'
      Size = 50
    end
  end
  object tblProf_Ativ_Evento: TZTable
    Connection = db
    TableName = 'professores_ativ_evento'
    Left = 536
    Top = 108
    object tblProf_Ativ_Eventocd_tipo_participa: TIntegerField
      FieldName = 'cd_tipo_participa'
      Required = True
    end
    object tblProf_Ativ_Eventods_tipo_participa: TStringField
      FieldName = 'ds_tipo_participa'
      Size = 50
    end
  end
  object tblProf_Tipo_Atividade: TZTable
    Connection = db
    TableName = 'professores_tipos_atividades'
    Left = 536
    Top = 58
    object tblProf_Tipo_Atividadecd_ativadade: TSmallintField
      FieldName = 'cd_ativadade'
      Required = True
    end
    object tblProf_Tipo_Atividadeds_atividade: TStringField
      FieldName = 'ds_atividade'
      Size = 50
    end
  end
  object tblContatosTipos: TUMZQuery
    Connection = db
    SQL.Strings = (
      'select * from contatos_tipos')
    Params = <>
    Left = 287
    Top = 361
    object tblContatosTiposcd_contato: TIntegerField
      FieldName = 'cd_contato'
      Origin = 'WMESTRE12.contatos_tipos.cd_contato'
    end
    object tblContatosTiposds_contato: TStringField
      FieldName = 'ds_contato'
      Origin = 'WMESTRE12.contatos_tipos.ds_contato'
    end
    object tblContatosTipossn_padrao: TStringField
      FieldName = 'sn_padrao'
      Origin = 'WMESTRE12.contatos_tipos.sn_padrao'
      FixedChar = True
      Size = 1
    end
  end
  object tblEditoras: TZTable
    Connection = db
    TableName = 'BIBLIOTECAEDITORA'
    Left = 536
    Top = 8
    object tblEditorasCODIGOEDITORA: TIntegerField
      FieldName = 'CODIGOEDITORA'
    end
    object tblEditorasEDITORA: TStringField
      FieldName = 'EDITORA'
      Size = 50
    end
  end
  object tblFuncFuncoes: TUMZQuery
    Connection = db
    SQL.Strings = (
      'select * from pessoas_ocupacoes order by ds_funcao')
    Params = <>
    Left = 192
    Top = 411
    object tblFuncFuncoescd_funcao: TSmallintField
      FieldName = 'cd_funcao'
      Origin = 'WMESTRE12.pessoas_ocupacoes.cd_funcao'
    end
    object tblFuncFuncoesds_funcao: TStringField
      FieldName = 'ds_funcao'
      Origin = 'WMESTRE12.pessoas_ocupacoes.ds_funcao'
      Size = 150
    end
  end
  object tblIngressos: TZTable
    Connection = db
    TableName = 'matriculas_ingresso'
    Left = 536
    Top = 460
    object tblIngressoscd_ingresso: TIntegerField
      FieldName = 'cd_ingresso'
    end
    object tblIngressosds_ingresso: TStringField
      FieldName = 'ds_ingresso'
      Size = 50
    end
  end
  object tblPlanoDesc: TUMZQuery
    Connection = db
    SQL.Strings = (
      'select * from PlanosDesconto'
      'ORDER BY DescricaoPlano')
    Params = <>
    Left = 850
    Top = 8
    object tblPlanoDesccodigo: TIntegerField
      FieldName = 'codigo'
      Origin = 'WMESTRE12.planosdesconto.codigo'
    end
    object tblPlanoDescdescricaoplano: TStringField
      FieldName = 'descricaoplano'
      Origin = 'WMESTRE12.planosdesconto.descricaoplano'
      Size = 40
    end
    object tblPlanoDescpercentualdesconto: TFloatField
      FieldName = 'percentualdesconto'
      Origin = 'WMESTRE12.planosdesconto.percentualdesconto'
    end
    object tblPlanoDescvalordesconto: TFloatField
      FieldName = 'valordesconto'
      Origin = 'WMESTRE12.planosdesconto.valordesconto'
    end
  end
  object tblModulosUsuarios: TUMZQuery
    Connection = db
    SQL.Strings = (
      
        'select * from modulos LEFT JOIN modulosusuarios ON (codigomodulo' +
        ' = codigo AND codigousuario = :codigousuario)'
      'where codigo = :codigomodulo')
    Params = <
      item
        DataType = ftInteger
        Name = 'codigousuario'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'codigomodulo'
        ParamType = ptUnknown
      end>
    Left = 88
    Top = 664
    ParamData = <
      item
        DataType = ftInteger
        Name = 'codigousuario'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'codigomodulo'
        ParamType = ptUnknown
      end>
    object tblModulosUsuarioscodigousuario: TIntegerField
      FieldName = 'codigousuario'
      Origin = 'WMESTRE12.modulosusuarios.codigousuario'
    end
    object tblModulosUsuarioscodigomodulo: TSmallintField
      FieldName = 'codigomodulo'
      Origin = 'WMESTRE12.modulosusuarios.codigomodulo'
    end
    object tblModulosUsuariosincluir: TStringField
      FieldName = 'incluir'
      Origin = 'WMESTRE12.modulosusuarios.incluir'
      FixedChar = True
      Size = 1
    end
    object tblModulosUsuariosalterar: TStringField
      FieldName = 'alterar'
      Origin = 'WMESTRE12.modulosusuarios.alterar'
      FixedChar = True
      Size = 1
    end
    object tblModulosUsuariosdeletar: TStringField
      FieldName = 'deletar'
      Origin = 'WMESTRE12.modulosusuarios.deletar'
      FixedChar = True
      Size = 1
    end
    object tblModulosUsuariosacessar: TStringField
      FieldName = 'acessar'
      Origin = 'WMESTRE12.modulosusuarios.acessar'
      FixedChar = True
      Size = 1
    end
    object tblModulosUsuariosespecial: TStringField
      FieldName = 'especial'
      Origin = 'WMESTRE12.modulosusuarios.especial'
      FixedChar = True
      Size = 1
    end
    object tblModulosUsuariosmodulo: TStringField
      FieldName = 'modulo'
      Origin = 'WMESTRE12.modulosusuarios.codigousuario'
      Size = 100
    end
  end
  object tblProf_Categorias: TUMZQuery
    Connection = db
    SQL.Strings = (
      'select * from professores_categorias')
    Params = <>
    Left = 88
    Top = 209
    object tblProf_Categoriascd_categoria: TSmallintField
      FieldName = 'cd_categoria'
      Origin = 'WMESTRE12.professores_categorias.cd_categoria'
    end
    object tblProf_Categoriasds_categoria: TStringField
      FieldName = 'ds_categoria'
      Origin = 'WMESTRE12.professores_categorias.ds_categoria'
      Size = 30
    end
    object tblProf_Categoriasds_ascensao: TStringField
      FieldName = 'ds_ascensao'
      Origin = 'WMESTRE12.professores_categorias.ds_ascensao'
      FixedChar = True
      Size = 1
    end
  end
  object tblAvaliacao: TUMZQuery
    Connection = db
    SQL.Strings = (
      
        'select a.*, t.codigo, t.anosemestre, p.ds_periodo_abreviado, p.d' +
        's_periodicidade'
      
        'from avaliacoes_parametros a, turmas t, cursos_periodos_avaliaco' +
        'es p'
      
        'where a.cd_avaliacao = t.cd_avaliacao and a.cd_periodo_avaliacao' +
        ' = p.cd_periodo_avaliacao'
      'and t.codigo = :turma and t.anosemestre = :anosemestre')
    Params = <
      item
        DataType = ftString
        Name = 'Turma'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'AnoSemestre'
        ParamType = ptUnknown
      end>
    Left = 392
    Top = 562
    ParamData = <
      item
        DataType = ftString
        Name = 'Turma'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'AnoSemestre'
        ParamType = ptUnknown
      end>
    object tblAvaliacaocd_avaliacao: TSmallintField
      FieldName = 'cd_avaliacao'
      Origin = 'WMESTRE12.avaliacoes_parametros.cd_avaliacao'
    end
    object tblAvaliacaods_avaliacao: TStringField
      FieldName = 'ds_avaliacao'
      Origin = 'WMESTRE12.avaliacoes_parametros.ds_avaliacao'
      Size = 100
    end
    object tblAvaliacaonr_avaliacoes: TSmallintField
      FieldName = 'nr_avaliacoes'
      Origin = 'WMESTRE12.avaliacoes_parametros.nr_avaliacoes'
    end
    object tblAvaliacaocd_periodo_avaliacao: TSmallintField
      FieldName = 'cd_periodo_avaliacao'
      Origin = 'WMESTRE12.avaliacoes_parametros.cd_periodo_avaliacao'
    end
    object tblAvaliacaods_cond_aprov_direta: TStringField
      FieldName = 'ds_cond_aprov_direta'
      Origin = 'WMESTRE12.avaliacoes_parametros.ds_cond_aprov_direta'
      Size = 250
    end
    object tblAvaliacaods_cond_repro_direta: TStringField
      FieldName = 'ds_cond_repro_direta'
      Origin = 'WMESTRE12.avaliacoes_parametros.ds_cond_repro_direta'
      Size = 250
    end
    object tblAvaliacaods_formula_media_exame: TStringField
      FieldName = 'ds_formula_media_exame'
      Origin = 'WMESTRE12.avaliacoes_parametros.ds_formula_media_exame'
      Size = 250
    end
    object tblAvaliacaods_formula_media_segunda: TStringField
      FieldName = 'ds_formula_media_segunda'
      Origin = 'WMESTRE12.avaliacoes_parametros.ds_formula_media_segunda'
      Size = 250
    end
    object tblAvaliacaods_cond_aprov_exame: TStringField
      FieldName = 'ds_cond_aprov_exame'
      Origin = 'WMESTRE12.avaliacoes_parametros.ds_cond_aprov_exame'
      Size = 250
    end
    object tblAvaliacaods_cond_aprov_segunda: TStringField
      FieldName = 'ds_cond_aprov_segunda'
      Origin = 'WMESTRE12.avaliacoes_parametros.ds_cond_aprov_segunda'
      Size = 250
    end
    object tblAvaliacaonr_max_disci_exame: TSmallintField
      FieldName = 'nr_max_disci_exame'
      Origin = 'WMESTRE12.avaliacoes_parametros.nr_max_disci_exame'
    end
    object tblAvaliacaonr_max_disci_segunda: TSmallintField
      FieldName = 'nr_max_disci_segunda'
      Origin = 'WMESTRE12.avaliacoes_parametros.nr_max_disci_segunda'
    end
    object tblAvaliacaosn_notas: TStringField
      FieldName = 'sn_notas'
      Origin = 'WMESTRE12.avaliacoes_parametros.sn_notas'
      FixedChar = True
      Size = 3
    end
    object tblAvaliacaosn_conceitos: TStringField
      FieldName = 'sn_conceitos'
      Origin = 'WMESTRE12.avaliacoes_parametros.sn_conceitos'
      FixedChar = True
      Size = 3
    end
    object tblAvaliacaosn_descricao: TStringField
      FieldName = 'sn_descricao'
      Origin = 'WMESTRE12.avaliacoes_parametros.sn_descricao'
      FixedChar = True
      Size = 3
    end
    object tblAvaliacaosn_exame: TStringField
      FieldName = 'sn_exame'
      Origin = 'WMESTRE12.avaliacoes_parametros.sn_exame'
      FixedChar = True
      Size = 3
    end
    object tblAvaliacaosn_pi: TStringField
      FieldName = 'sn_pi'
      Origin = 'WMESTRE12.avaliacoes_parametros.sn_pi'
      FixedChar = True
      Size = 3
    end
    object tblAvaliacaosn_segunda_epoca: TStringField
      FieldName = 'sn_segunda_epoca'
      Origin = 'WMESTRE12.avaliacoes_parametros.sn_segunda_epoca'
      FixedChar = True
      Size = 3
    end
    object tblAvaliacaosn_frequencia_global: TStringField
      FieldName = 'sn_frequencia_global'
      Origin = 'WMESTRE12.avaliacoes_parametros.sn_frequencia_global'
      FixedChar = True
      Size = 1
    end
    object tblAvaliacaods_frequencia_tipo: TStringField
      FieldName = 'ds_frequencia_tipo'
      Origin = 'WMESTRE12.avaliacoes_parametros.ds_frequencia_tipo'
      FixedChar = True
      Size = 1
    end
    object tblAvaliacaosn_recuperacao: TStringField
      FieldName = 'sn_recuperacao'
      Origin = 'WMESTRE12.avaliacoes_parametros.sn_recuperacao'
      FixedChar = True
      Size = 1
    end
    object tblAvaliacaods_formula_recuperacao: TStringField
      FieldName = 'ds_formula_recuperacao'
      Origin = 'WMESTRE12.avaliacoes_parametros.ds_formula_recuperacao'
      Size = 250
    end
    object tblAvaliacaocodigo: TStringField
      FieldName = 'codigo'
      Origin = 'WMESTRE12.turmas.codigo'
      Size = 15
    end
    object tblAvaliacaoanosemestre: TSmallintField
      FieldName = 'anosemestre'
      Origin = 'WMESTRE12.turmas.anosemestre'
    end
    object tblAvaliacaods_formula_media_final: TStringField
      FieldName = 'ds_formula_media_final'
      Origin = 'WMESTRE12.avaliacoes_parametros.ds_formula_media_final'
      Size = 250
    end
    object tblAvaliacaonr_casas_decimais: TSmallintField
      FieldName = 'nr_casas_decimais'
      Origin = 'WMESTRE12.avaliacoes_parametros.nr_casas_decimais'
    end
    object tblAvaliacaods_cond_recuperacao: TStringField
      FieldName = 'ds_cond_recuperacao'
      Origin = 'WMESTRE12.avaliacoes_parametros.ds_cond_recuperacao'
      Size = 250
    end
    object tblAvaliacaovl_arredondamento: TFloatField
      FieldName = 'vl_arredondamento'
      Origin = 'WMESTRE12.avaliacoes_parametros.vl_arredondamento'
    end
    object tblAvaliacaods_periodo_abreviado: TStringField
      FieldName = 'ds_periodo_abreviado'
      Origin = 'WMESTRE12.cursos_periodos_avaliacoes.ds_periodo_abreviado'
      Size = 10
    end
    object tblAvaliacaods_periodicidade: TStringField
      FieldName = 'ds_periodicidade'
      Origin = 'WMESTRE12.cursos_periodos_avaliacoes.ds_periodicidade'
    end
    object tblAvaliacaods_formula_media_anual: TMemoField
      FieldName = 'ds_formula_media_anual'
      Origin = 'WMESTRE12.avaliacoes_parametros.ds_formula_media_anual'
      BlobType = ftMemo
      Size = 1
    end
    object tblAvaliacaosn_notas_diario_online: TStringField
      FieldName = 'sn_notas_diario_online'
      Origin = 'WMESTRE12.avaliacoes_parametros.sn_notas_diario_online'
      FixedChar = True
      Size = 1
    end
    object tblAvaliacaosn_notas_diario: TStringField
      FieldName = 'sn_notas_diario'
      Origin = 'WMESTRE12.avaliacoes_parametros.sn_notas_diario'
      FixedChar = True
      Size = 1
    end
    object tblAvaliacaosn_desblo_coorde: TStringField
      FieldName = 'sn_desblo_coorde'
      Origin = 'WMESTRE12.avaliacoes_parametros.sn_desblo_coorde'
      FixedChar = True
      Size = 1
    end
    object tblAvaliacaosn_diario_imp_notas: TStringField
      FieldName = 'sn_diario_imp_notas'
      Origin = 'WMESTRE12.avaliacoes_parametros.sn_diario_imp_notas'
      FixedChar = True
      Size = 1
    end
    object tblAvaliacaosn_diario_imp_freqs: TStringField
      FieldName = 'sn_diario_imp_freqs'
      Origin = 'WMESTRE12.avaliacoes_parametros.sn_diario_imp_freqs'
      FixedChar = True
      Size = 1
    end
    object tblAvaliacaosn_notas_truncar: TStringField
      FieldName = 'sn_notas_truncar'
      Origin = 'WMESTRE12.avaliacoes_parametros.sn_notas_truncar'
      FixedChar = True
      Size = 1
    end
    object tblAvaliacaosn_diario_imp_contprog: TStringField
      FieldName = 'sn_diario_imp_contprog'
      Origin = 'WMESTRE12.avaliacoes_parametros.sn_diario_imp_contprog'
      FixedChar = True
      Size = 1
    end
    object tblAvaliacaods_nota_exame: TStringField
      FieldName = 'ds_nota_exame'
      Origin = 'WMESTRE12.avaliacoes_parametros.ds_nota_exame'
      Size = 255
    end
    object tblAvaliacaods_nota_segunda: TStringField
      FieldName = 'ds_nota_segunda'
      Origin = 'WMESTRE12.avaliacoes_parametros.ds_nota_segunda'
      Size = 255
    end
    object tblAvaliacaosn_medias_truncar: TStringField
      FieldName = 'sn_medias_truncar'
      Origin = 'WMESTRE12.avaliacoes_parametros.sn_medias_truncar'
      FixedChar = True
      Size = 1
    end
    object tblAvaliacaosn_anual_truncar: TStringField
      FieldName = 'sn_anual_truncar'
      Origin = 'WMESTRE12.avaliacoes_parametros.sn_anual_truncar'
      FixedChar = True
      Size = 1
    end
    object tblAvaliacaosn_diario_online: TSmallintField
      FieldName = 'sn_diario_online'
      Origin = 'WMESTRE12.avaliacoes_parametros.sn_diario_online'
    end
    object tblAvaliacaosn_diario_eletro: TIntegerField
      FieldName = 'sn_diario_eletro'
      Origin = 'WMESTRE12.avaliacoes_parametros.sn_diario_eletro'
    end
    object tblAvaliacaosn_diario_online_provas: TSmallintField
      FieldName = 'sn_diario_online_provas'
      Origin = 'WMESTRE12.avaliacoes_parametros.sn_diario_online_provas'
    end
    object tblAvaliacaosn_diario_online_aulas: TSmallintField
      FieldName = 'sn_diario_online_aulas'
      Origin = 'WMESTRE12.avaliacoes_parametros.sn_diario_online_aulas'
    end
    object tblAvaliacaosn_diario_online_recalc_medias: TSmallintField
      FieldName = 'sn_diario_online_recalc_medias'
      Origin = 'WMESTRE12.avaliacoes_parametros.sn_diario_online_recalc_medias'
    end
    object tblAvaliacaosn_diario_online_bloque_aulas: TIntegerField
      FieldName = 'sn_diario_online_bloque_aulas'
      Origin = 'WMESTRE12.avaliacoes_parametros.sn_diario_online_bloque_aulas'
    end
    object tblAvaliacaosn_diario_online_bloque_provas: TIntegerField
      FieldName = 'sn_diario_online_bloque_provas'
      Origin = 'WMESTRE12.avaliacoes_parametros.sn_diario_online_bloque_provas'
    end
    object tblAvaliacaonr_casas_decimais_forcado: TIntegerField
      FieldName = 'nr_casas_decimais_forcado'
      Origin = 'WMESTRE12.avaliacoes_parametros.nr_casas_decimais_forcado'
    end
    object tblAvaliacaosn_altera_notas_direta: TIntegerField
      FieldName = 'sn_altera_notas_direta'
      Origin = 'WMESTRE12.avaliacoes_parametros.sn_altera_notas_direta'
    end
    object tblAvaliacaosn_converter_notas_nulas: TIntegerField
      FieldName = 'sn_converter_notas_nulas'
      Origin = 'WMESTRE12.avaliacoes_parametros.sn_converter_notas_nulas'
    end
    object tblAvaliacaoNR_CASAS_FORCADO_MEDIA: TIntegerField
      FieldName = 'NR_CASAS_FORCADO_MEDIA'
    end
    object tblAvaliacaosn_copiar_conteudo_pordata: TSmallintField
      FieldName = 'sn_copiar_conteudo_pordata'
      Origin = 'WMESTRE12.avaliacoes_parametros.sn_copiar_conteudo_pordata'
    end
    object tblAvaliacaosn_ajuste_apos_recuperacao: TSmallintField
      FieldName = 'sn_ajuste_apos_recuperacao'
      Origin = 'WMESTRE12.avaliacoes_parametros.sn_ajuste_apos_recuperacao'
    end
    object tblAvaliacaotp_ajuste_forcado: TSmallintField
      FieldName = 'tp_ajuste_forcado'
      Origin = 'WMESTRE12.avaliacoes_parametros.tp_ajuste_forcado'
    end
    object tblAvaliacaotp_ajuste_forcado_media: TSmallintField
      FieldName = 'tp_ajuste_forcado_media'
      Origin = 'WMESTRE12.avaliacoes_parametros.tp_ajuste_forcado_media'
    end
    object tblAvaliacaosn_mostrar_alunos_curs_padrao: TSmallintField
      FieldName = 'sn_mostrar_alunos_curs_padrao'
      Origin = 'WMESTRE12.avaliacoes_parametros.sn_mostrar_alunos_curs_padrao'
    end
    object tblAvaliacaosn_ins_aulas_semhorario: TSmallintField
      FieldName = 'sn_ins_aulas_semhorario'
      Origin = 'WMESTRE12.avaliacoes_parametros.sn_ins_aulas_semhorario'
    end
    object tblAvaliacaods_formula_padrao: TStringField
      FieldName = 'ds_formula_padrao'
      Origin = 'WMESTRE12.avaliacoes_parametros.ds_formula_padrao'
      Size = 255
    end
    object tblAvaliacaosn_obrigar_formula_padrao: TSmallintField
      FieldName = 'sn_obrigar_formula_padrao'
      Origin = 'WMESTRE12.avaliacoes_parametros.sn_obrigar_formula_padrao'
    end
    object tblAvaliacaods_formula_media_sem_pi: TStringField
      FieldName = 'ds_formula_media_sem_pi'
      Origin = 'WMESTRE12.avaliacoes_parametros.ds_formula_media_sem_pi'
      Size = 250
    end
    object tblAvaliacaods_criterio_recuperacao: TStringField
      FieldName = 'ds_criterio_recuperacao'
      Origin = 'WMESTRE12.avaliacoes_parametros.ds_criterio_recuperacao'
      Size = 100
    end
    object tblAvaliacaods_formula_periodo: TStringField
      FieldName = 'ds_formula_periodo'
      Origin = 'WMESTRE12.avaliacoes_parametros.ds_formula_periodo'
      Size = 255
    end
    object tblAvaliacaosn_diario_online_mostra_ajuste: TSmallintField
      FieldName = 'sn_diario_online_mostra_ajuste'
      Origin = 'WMESTRE12.avaliacoes_parametros.sn_diario_online_mostra_ajuste'
    end
    object tblAvaliacaods_condicao_situacao_periodo: TStringField
      FieldName = 'ds_condicao_situacao_periodo'
      Origin = 'WMESTRE12.avaliacoes_parametros.ds_condicao_situacao_periodo'
      Size = 255
    end
    object tblAvaliacaosn_usar_media_curso: TSmallintField
      FieldName = 'sn_usar_media_curso'
      Origin = 'WMESTRE12.avaliacoes_parametros.sn_usar_media_curso'
    end
    object tblAvaliacaods_formula_media_curso: TStringField
      FieldName = 'ds_formula_media_curso'
      Origin = 'WMESTRE12.avaliacoes_parametros.ds_formula_media_curso'
      Size = 255
    end
    object tblAvaliacaods_sigla: TMemoField
      FieldName = 'ds_sigla'
      Origin = 'WMESTRE12.avaliacoes_parametros.ds_sigla'
      BlobType = ftMemo
      Size = 1
    end
    object tblAvaliacaosn_extra_classe: TSmallintField
      FieldName = 'sn_extra_classe'
      Origin = 'WMESTRE12.avaliacoes_parametros.sn_extra_classe'
    end
    object tblAvaliacaosn_descricao_fixa: TStringField
      FieldName = 'sn_descricao_fixa'
      Origin = 'WMESTRE12.avaliacoes_parametros.sn_descricao_fixa'
      FixedChar = True
      Size = 1
    end
    object tblAvaliacaosn_freque_pergunta: TSmallintField
      FieldName = 'sn_freque_pergunta'
      Origin = 'WMESTRE12.avaliacoes_parametros.sn_freque_pergunta'
    end
    object tblAvaliacaosn_freque_pergunta_padrao: TSmallintField
      FieldName = 'sn_freque_pergunta_padrao'
      Origin = 'WMESTRE12.avaliacoes_parametros.sn_freque_pergunta_padrao'
    end
    object tblAvaliacaosn_professor_fecha_diario: TSmallintField
      FieldName = 'sn_professor_fecha_diario'
      Origin = 'WMESTRE12.avaliacoes_parametros.sn_professor_fecha_diario'
    end
    object tblAvaliacaosn_profes_digita_peso: TStringField
      FieldName = 'sn_profes_digita_peso'
      Origin = 'WMESTRE12.avaliacoes_parametros.sn_profes_digita_peso'
      FixedChar = True
      Size = 50
    end
    object tblAvaliacaonr_qtd_aulas_impressao: TSmallintField
      FieldName = 'nr_qtd_aulas_impressao'
      Origin = 'WMESTRE12.avaliacoes_parametros.nr_qtd_aulas_impressao'
    end
    object tblAvaliacaods_formula_pi: TStringField
      FieldName = 'ds_formula_pi'
      Origin = 'WMESTRE12.avaliacoes_parametros.ds_formula_pi'
      Size = 250
    end
    object tblAvaliacaocd_situacao_aprov_direta: TIntegerField
      FieldName = 'cd_situacao_aprov_direta'
      Origin = 'WMESTRE12.avaliacoes_parametros.cd_situacao_aprov_direta'
    end
    object tblAvaliacaocd_situacao_aprov_exame: TIntegerField
      FieldName = 'cd_situacao_aprov_exame'
      Origin = 'WMESTRE12.avaliacoes_parametros.cd_situacao_aprov_exame'
    end
    object tblAvaliacaocd_situacao_aprov_2epoca: TIntegerField
      FieldName = 'cd_situacao_aprov_2epoca'
      Origin = 'WMESTRE12.avaliacoes_parametros.cd_situacao_aprov_2epoca'
    end
    object tblAvaliacaonr_media_proficiencia: TFloatField
      FieldName = 'nr_media_proficiencia'
      Origin = 'WMESTRE12.avaliacoes_parametros.nr_media_proficiencia'
    end
    object tblAvaliacaoSN_GERAR_TAXA_RECORRENCIA: TSmallintField
      FieldName = 'SN_GERAR_TAXA_RECORRENCIA'
    end
    object tblAvaliacaosn_falta_exame_forca_2epoca: TSmallintField
      FieldName = 'sn_falta_exame_forca_2epoca'
      Origin = 'WMESTRE12.avaliacoes_parametros.sn_falta_exame_forca_2epoca'
    end
    object tblAvaliacaocd_disci_frequencia: TLargeintField
      FieldName = 'cd_disci_frequencia'
    end
    object tblAvaliacaonr_maximo_aulas: TLargeintField
      FieldName = 'nr_maximo_aulas'
      Required = True
    end
    object tblAvaliacaonr_periodos: TLargeintField
      FieldName = 'nr_periodos'
      Required = True
    end
    object tblAvaliacaocd_situacao_concluida: TLargeintField
      FieldName = 'cd_situacao_concluida'
    end
    object tblAvaliacaonr_inicio_aulas_extras: TLargeintField
      FieldName = 'nr_inicio_aulas_extras'
    end
    object tblAvaliacaonr_dias_diario_bloq_provas: TLargeintField
      FieldName = 'nr_dias_diario_bloq_provas'
    end
    object tblAvaliacaosn_conceitos_parciais: TStringField
      FieldName = 'sn_conceitos_parciais'
      Size = 3
    end
    object tblAvaliacaonr_casas_decimais_frequencia: TSmallintField
      FieldName = 'nr_casas_decimais_frequencia'
    end
    object tblAvaliacaosn_diario_online_bloque_cont: TIntegerField
      FieldName = 'sn_diario_online_bloque_cont'
      Origin = 'WMESTRE12.avaliacoes_parametros.sn_diario_online_cont'
    end
    object tblAvaliacaosn_diario_online_freq_bloq_cont: TSmallintField
      FieldName = 'sn_diario_online_freq_bloq_cont'
    end
    object tblAvaliacaosn_diario_online_freq_bloq_digi: TSmallintField
      FieldName = 'sn_diario_online_freq_bloq_digi'
    end
    object tblAvaliacaosn_diario_online_compart_aula: TSmallintField
      FieldName = 'sn_diario_online_compart_aula'
    end
    object tblAvaliacaosn_diario_online_mostra_resp: TIntegerField
      FieldName = 'sn_diario_online_mostra_resp'
    end
    object tblAvaliacaods_cond_repro_falta: TStringField
      FieldName = 'ds_cond_repro_falta'
      Size = 255
    end
    object tblAvaliacaocd_situacao_reprov_falta: TIntegerField
      FieldName = 'cd_situacao_reprov_falta'
    end
  end
  object tblCalc: TUMZQuery
    Connection = db
    Params = <>
    Left = 287
    Top = 613
  end
  object qAux1: TUMZQuery
    Connection = db
    Params = <>
    Left = 392
    Top = 106
  end
  object qAux2: TUMZQuery
    Connection = db
    Params = <>
    Left = 392
    Top = 207
  end
  object tblMensa: TUMZQuery
    Connection = db
    Params = <>
    Left = 192
    Top = 58
  end
  object tblParametros: TUMZQuery
    Connection = db
    Params = <>
    Left = 392
    Top = 460
  end
  object tblSituacoes: TUMZQuery
    Connection = db
    SQL.Strings = (
      'select * from situacao'
      'order by ds_situacao')
    Params = <>
    Left = 680
    Top = 104
    object tblSituacoescd_situacao: TIntegerField
      FieldName = 'cd_situacao'
      Origin = 'WMESTRE12.situacao.cd_situacao'
    end
    object tblSituacoesds_situacao: TStringField
      FieldName = 'ds_situacao'
      Origin = 'WMESTRE12.situacao.ds_situacao'
      Size = 15
    end
    object tblSituacoesds_sigla_situacao: TStringField
      FieldName = 'ds_sigla_situacao'
      Origin = 'WMESTRE12.situacao.ds_sigla_situacao'
      Size = 10
    end
    object tblSituacoescd_situacao_pai: TIntegerField
      FieldName = 'cd_situacao_pai'
      Origin = 'WMESTRE12.situacao.cd_situacao_pai'
    end
  end
  object dsSituacao: TDataSource
    DataSet = tblSituacoes
    Left = 680
    Top = 152
  end
  object qryInsert: TUMZQuery
    Connection = db
    SQL.Strings = (
      'insert into Mensalidades'
      
        '(CodigoAluno, cd_resp, Parcela, DataVencimento, dt_competencia, ' +
        'Turma, DataEmissao, NossoNumero, '
      
        'ValorBruto, ValorDesconto, DescontoExtra, ValorExtra, ValorTotal' +
        ', ValorJuros, valorjuros_fixo, '
      'ValorPago, DataPagamento, Situacao, Usuario, Bloqueto, '
      
        'AnoSemestre, DataBaseCorrecao, IndiceCorrecao, Curso, Depto, Tip' +
        'oParcela, sn_credito_parcela, cd_mensalidade_origem, nr_creditos' +
        ','
      
        'ds_historico, cd_tipo_titulo, cd_plano_conta, cd_centro_custo, c' +
        'd_caixa, vl_credito, cd_item_plano, cd_cheque_devolvido, cd_coli' +
        'gada, SN_NFE_GERADA, NR_NF,'
      
        'ds_autentica_impressao, VL_PERCENTUAL_DIVISAO, cd_desc_condicion' +
        'al, ds_obs_desc, sn_liberar_descontos, cd_resp_nfse'
      ')'
      'VALUES'
      '('
      
        ':CodigoAluno,  :cd_resp, :Parcela, :DataVencimento, :dt_competen' +
        'cia, :Turma, :DataEmissao,'
      
        ':NossoNumero, :ValorBruto, :ValorDesconto, :DescontoExtra, :Valo' +
        'rExtra,'
      
        ':ValorTotal, :ValorJuros, :valorjuros_fixo, :ValorPago, :DataPag' +
        'amento, :Situacao,'
      ':Usuario, :Bloqueto, :AnoSemestre, '
      
        ':DataBaseCorrecao, :IndiceCorrecao, :Curso, :Depto, :Tipo, :sn_c' +
        'redito_parcela, :cd_mensalidade_origem, :nr_creditos,'
      
        ':ds_historico, :cd_tipo_titulo, :cd_plano_conta, :cd_centro_cust' +
        'o, :cd_caixa, :ValorCredito, :CodItemPlano, :cd_cheque_devolvido' +
        ', :cd_coligada, :SN_NFE_GERADA, :NR_NF,'
      
        ':ds_autentica_impressao, :VL_PERCENTUAL_DIVISAO, :cd_desc_condic' +
        'ional, :ds_obs_desc, :sn_liberar_descontos, :cd_resp_nfse'
      ')')
    Params = <
      item
        DataType = ftUnknown
        Name = 'CodigoAluno'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'cd_resp'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'Parcela'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'DataVencimento'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'dt_competencia'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'Turma'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'DataEmissao'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'NossoNumero'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'ValorBruto'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'ValorDesconto'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'DescontoExtra'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'ValorExtra'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'ValorTotal'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'ValorJuros'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'valorjuros_fixo'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'ValorPago'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'DataPagamento'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'Situacao'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'Usuario'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'Bloqueto'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'AnoSemestre'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'DataBaseCorrecao'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'IndiceCorrecao'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'Curso'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
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
      end
      item
        DataType = ftUnknown
        Name = 'SN_NFE_GERADA'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'NR_NF'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'ds_autentica_impressao'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'VL_PERCENTUAL_DIVISAO'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'cd_desc_condicional'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'ds_obs_desc'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'sn_liberar_descontos'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'cd_resp_nfse'
        ParamType = ptUnknown
      end>
    Left = 192
    Top = 310
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'CodigoAluno'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'cd_resp'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'Parcela'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'DataVencimento'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'dt_competencia'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'Turma'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'DataEmissao'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'NossoNumero'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'ValorBruto'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'ValorDesconto'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'DescontoExtra'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'ValorExtra'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'ValorTotal'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'ValorJuros'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'valorjuros_fixo'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'ValorPago'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'DataPagamento'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'Situacao'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'Usuario'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'Bloqueto'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'AnoSemestre'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'DataBaseCorrecao'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'IndiceCorrecao'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'Curso'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
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
      end
      item
        DataType = ftUnknown
        Name = 'SN_NFE_GERADA'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'NR_NF'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'ds_autentica_impressao'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'VL_PERCENTUAL_DIVISAO'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'cd_desc_condicional'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'ds_obs_desc'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'sn_liberar_descontos'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'cd_resp_nfse'
        ParamType = ptUnknown
      end>
  end
  object dsInstituicoes: TDataSource
    DataSet = tblInstituicoes
    Left = 850
    Top = 344
  end
  object dtcPlanoDesc: TDataSource
    DataSet = tblPlanoDesc
    Left = 850
    Top = 56
  end
  object tblInstituicoes: TUMZQuery
    Connection = db
    BeforePost = tblInstituicoesBeforePost
    SQL.Strings = (
      'SELECT'
      ''
      'cd_instituicao,'
      'nm_instituicao,'
      'ds_credenciamento,'
      'nm_fantasia,'
      'ds_endereco,'
      'ds_complemento,'
      'ds_bairro,'
      'COALESCE(ds_cidade,'#39#39') ds_cidade,'
      'ds_estado,'
      'ds_cep,'
      'ds_diretor,'
      'ds_tipo,'
      'ds_telefone1,'
      'ds_telefone2,'
      'ds_email,'
      'ds_site,'
      'sn_educacao_infantil,'
      'sn_ensino_fundamental,'
      'sn_ensino_medio,'
      'sn_ensino_superior,'
      'sn_cursos_profissionalizantes,'
      'sn_ensino_especial,'
      'sn_unidade_certificadora,'
      'sn_convenio,'
      'sn_irregular,'
      
        'CONCAT(nm_instituicao,'#39' ('#39',ds_cidade,'#39'/'#39',ds_estado,'#39')'#39') nm_insti' +
        'tuicao_formatado'
      'FROM'
      #9'instituicoes_ensino'
      'WHERE'
      '  trim(nm_instituicao) <> '#39#39
      'ORDER BY'
      #9'nm_instituicao')
    Params = <>
    SQLList.Strings = (
      
        'oracle=SELECT'#13#10#13#10'cd_instituicao,'#13#10'nm_instituicao,'#13#10'ds_credenciam' +
        'ento,'#13#10'nm_fantasia,'#13#10'ds_endereco,'#13#10'ds_complemento,'#13#10'ds_bairro,'#13#10 +
        'COALESCE(ds_cidade,'#39#39') ds_cidade,'#13#10'ds_estado,'#13#10'ds_cep,'#13#10'ds_diret' +
        'or,'#13#10'ds_tipo,'#13#10'ds_telefone1,'#13#10'ds_telefone2,'#13#10'ds_email,'#13#10'ds_site,' +
        #13#10'sn_educacao_infantil,'#13#10'sn_ensino_fundamental,'#13#10'sn_ensino_medio' +
        ','#13#10'sn_ensino_superior,'#13#10'sn_cursos_profissionalizantes,'#13#10'sn_ensin' +
        'o_especial,'#13#10'sn_unidade_certificadora,'#13#10'sn_convenio,'#13#10'nm_institu' +
        'icao ||'#39' ('#39' || COALESCE(ds_cidade,'#39#39') || '#39'/'#39' || COALESCE(ds_esta' +
        'do,'#39#39') || '#39')'#39' nm_instituicao_formatado'#13#10'FROM'#13#10#9'instituicoes_ensi' +
        'no'#13#10'ORDER BY'#13#10#9'nm_instituicao'
      
        'mysql-5=SELECT'#13#10#13#10'cd_instituicao,'#13#10'nm_instituicao,'#13#10'ds_credencia' +
        'mento,'#13#10'nm_fantasia,'#13#10'ds_endereco,'#13#10'ds_complemento,'#13#10'ds_bairro,'#13 +
        #10'COALESCE(ds_cidade,'#39#39') ds_cidade,'#13#10'ds_estado,'#13#10'ds_cep,'#13#10'ds_dire' +
        'tor,'#13#10'ds_tipo,'#13#10'ds_telefone1,'#13#10'ds_telefone2,'#13#10'ds_email,'#13#10'ds_site' +
        ','#13#10'sn_educacao_infantil,'#13#10'sn_ensino_fundamental,'#13#10'sn_ensino_medi' +
        'o,'#13#10'sn_ensino_superior,'#13#10'sn_cursos_profissionalizantes,'#13#10'sn_ensi' +
        'no_especial,'#13#10'sn_unidade_certificadora,'#13#10'sn_convenio,'#13#10'sn_irregu' +
        'lar,'#13#10'CONCAT(nm_instituicao,'#39' ('#39',COALESCE(ds_cidade,'#39#39'),'#39'/'#39',COAL' +
        'ESCE(ds_estado,'#39#39'),'#39')'#39') nm_instituicao_formatado'#13#10'FROM'#13#10#9'institu' +
        'icoes_ensino'#13#10'WHERE'#13#10'   trim(nm_instituicao) <> '#39#39#13#10'ORDER BY'#13#10#9'n' +
        'm_instituicao')
    Left = 850
    Top = 296
    object tblInstituicoesnm_instituicao: TStringField
      FieldName = 'nm_instituicao'
      Origin = 'WMESTRE12.instituicoes_ensino.nm_instituicao'
      Size = 80
    end
    object tblInstituicoesds_endereco: TStringField
      FieldName = 'ds_endereco'
      Origin = 'WMESTRE12.instituicoes_ensino.ds_endereco'
      Size = 80
    end
    object tblInstituicoesds_complemento: TStringField
      FieldName = 'ds_complemento'
      Origin = 'WMESTRE12.instituicoes_ensino.ds_complemento'
      Size = 50
    end
    object tblInstituicoesds_bairro: TStringField
      FieldName = 'ds_bairro'
      Origin = 'WMESTRE12.instituicoes_ensino.ds_bairro'
      Size = 50
    end
    object tblInstituicoesds_cidade: TStringField
      FieldName = 'ds_cidade'
      Origin = 'WMESTRE12.instituicoes_ensino.ds_cidade'
      Size = 50
    end
    object tblInstituicoesds_estado: TStringField
      FieldName = 'ds_estado'
      Origin = 'WMESTRE12.instituicoes_ensino.ds_estado'
      FixedChar = True
      Size = 3
    end
    object tblInstituicoesds_cep: TStringField
      FieldName = 'ds_cep'
      Origin = 'WMESTRE12.instituicoes_ensino.ds_cep'
      Size = 8
    end
    object tblInstituicoesds_diretor: TStringField
      FieldName = 'ds_diretor'
      Origin = 'WMESTRE12.instituicoes_ensino.ds_diretor'
      Size = 80
    end
    object tblInstituicoesds_tipo: TStringField
      FieldName = 'ds_tipo'
      Origin = 'WMESTRE12.instituicoes_ensino.ds_tipo'
      FixedChar = True
      Size = 1
    end
    object tblInstituicoesds_telefone1: TStringField
      FieldName = 'ds_telefone1'
      Origin = 'WMESTRE12.instituicoes_ensino.ds_telefone1'
      Size = 25
    end
    object tblInstituicoesds_telefone2: TStringField
      FieldName = 'ds_telefone2'
      Origin = 'WMESTRE12.instituicoes_ensino.ds_telefone2'
      Size = 25
    end
    object tblInstituicoesds_email: TStringField
      FieldName = 'ds_email'
      Origin = 'WMESTRE12.instituicoes_ensino.ds_email'
      Size = 100
    end
    object tblInstituicoesds_site: TStringField
      FieldName = 'ds_site'
      Origin = 'WMESTRE12.instituicoes_ensino.ds_site'
      Size = 100
    end
    object tblInstituicoessn_educacao_infantil: TStringField
      FieldName = 'sn_educacao_infantil'
      Origin = 'WMESTRE12.instituicoes_ensino.sn_educacao_infantil'
      FixedChar = True
      Size = 1
    end
    object tblInstituicoessn_ensino_fundamental: TStringField
      FieldName = 'sn_ensino_fundamental'
      Origin = 'WMESTRE12.instituicoes_ensino.sn_ensino_fundamental'
      FixedChar = True
      Size = 1
    end
    object tblInstituicoessn_ensino_medio: TStringField
      FieldName = 'sn_ensino_medio'
      Origin = 'WMESTRE12.instituicoes_ensino.sn_ensino_medio'
      FixedChar = True
      Size = 1
    end
    object tblInstituicoessn_ensino_superior: TStringField
      FieldName = 'sn_ensino_superior'
      Origin = 'WMESTRE12.instituicoes_ensino.sn_ensino_superior'
      FixedChar = True
      Size = 1
    end
    object tblInstituicoessn_cursos_profissionalizantes: TStringField
      FieldName = 'sn_cursos_profissionalizantes'
      Origin = 'WMESTRE12.instituicoes_ensino.sn_cursos_profissionalizantes'
      FixedChar = True
      Size = 1
    end
    object tblInstituicoessn_ensino_especial: TStringField
      FieldName = 'sn_ensino_especial'
      Origin = 'WMESTRE12.instituicoes_ensino.sn_ensino_especial'
      FixedChar = True
      Size = 1
    end
    object tblInstituicoescd_instituicao: TIntegerField
      FieldName = 'cd_instituicao'
      Required = True
    end
    object tblInstituicoesnm_instituicao__formatado: TStringField
      FieldName = 'nm_instituicao_formatado'
      ReadOnly = True
      Size = 136
    end
    object tblInstituicoessn_irregular: TSmallintField
      FieldName = 'sn_irregular'
    end
  end
  object dbDocs: TZConnection
    TransactIsolationLevel = tiReadCommitted
    BeforeConnect = dbDocsBeforeConnect
    Left = 15
    Top = 108
  end
  object dtcMoticos2: TDataSource
    DataSet = qyMotivos
    Left = 680
    Top = 56
  end
  object qyMotivos: TUMZQuery
    Connection = db
    Filtered = True
    SQL.Strings = (
      'select * from bibliotecamotivosmulta')
    Params = <>
    Left = 680
    Top = 8
    object qyMotivoscd_aluno: TIntegerField
      FieldName = 'cd_aluno'
      Origin = 'DBACADEMICO.bibliotecamotivosmulta.cd_aluno'
    end
    object qyMotivoscd_multa: TIntegerField
      FieldName = 'cd_multa'
      Origin = 'DBACADEMICO.bibliotecamotivosmulta.cd_multa'
    end
    object qyMotivosdt_motivo: TDateTimeField
      FieldName = 'dt_motivo'
      Origin = 'DBACADEMICO.bibliotecamotivosmulta.dt_motivo'
    end
    object qyMotivosmotivo: TMemoField
      FieldName = 'motivo'
      Origin = 'DBACADEMICO.bibliotecamotivosmulta.motivo'
      BlobType = ftMemo
      Size = 1
    end
    object qyMotivoscd_autorizadopor: TIntegerField
      FieldName = 'cd_autorizadopor'
      Origin = 'DBACADEMICO.bibliotecamotivosmulta.cd_autorizadopor'
    end
  end
  object tblNomeAcervo: TUMZQuery
    Connection = db
    SQL.Strings = (
      'select '
      '   L.CODIGOLIVRO, L.TITULO, R.EMPRESTADO, R.SN_EMPRESTIMO, T.*'
      'From '
      '   BIBLIOTECALIVROS L, BIBLIOTECAREGISTRO R, BIBLIOTECATIPOS T'
      'WHERE '
      '   L.CODIGOLIVRO = R.CODIGOLIVRO'
      '   AND L.CODIGOTIPO = T.CODIGOTIPO'
      '   AND R.REGISTRO = :REGISTRO')
    Params = <
      item
        DataType = ftInteger
        Name = 'REGISTRO'
        ParamType = ptUnknown
      end>
    Left = 288
    Top = 562
    ParamData = <
      item
        DataType = ftInteger
        Name = 'REGISTRO'
        ParamType = ptUnknown
      end>
    object tblNomeAcervoCODIGOLIVRO: TIntegerField
      FieldName = 'CODIGOLIVRO'
    end
    object tblNomeAcervoTITULO: TStringField
      FieldName = 'TITULO'
      Size = 100
    end
    object tblNomeAcervoEMPRESTADO: TStringField
      FieldName = 'EMPRESTADO'
      FixedChar = True
      Size = 1
    end
    object tblNomeAcervoEMPRESTIMO: TStringField
      FieldName = 'EMPRESTIMO'
      FixedChar = True
      Size = 1
    end
    object tblNomeAcervoTIPO: TStringField
      FieldName = 'TIPO'
      Size = 50
    end
    object tblNomeAcervocodigotipo: TStringField
      FieldName = 'codigotipo'
      Size = 15
    end
    object tblNomeAcervoqt_dias_emp_aluno: TIntegerField
      FieldName = 'qt_dias_emp_aluno'
    end
    object tblNomeAcervoqt_dias_emp_professor: TIntegerField
      FieldName = 'qt_dias_emp_professor'
    end
    object tblNomeAcervoqt_dias_emp_funcionario: TIntegerField
      FieldName = 'qt_dias_emp_funcionario'
    end
    object tblNomeAcervoqt_dias_emp_pessoa: TIntegerField
      FieldName = 'qt_dias_emp_pessoa'
    end
    object tblNomeAcervovl_multa_dia: TFloatField
      FieldName = 'vl_multa_dia'
    end
    object tblNomeAcervoSN_EMPRESTIMO: TStringField
      FieldName = 'SN_EMPRESTIMO'
      FixedChar = True
      Size = 1
    end
    object tblNomeAcervoqt_emp_aluno: TIntegerField
      FieldName = 'qt_emp_aluno'
    end
    object tblNomeAcervoqt_emp_professor: TIntegerField
      FieldName = 'qt_emp_professor'
    end
    object tblNomeAcervoqt_emp_funcionario: TIntegerField
      FieldName = 'qt_emp_funcionario'
    end
    object tblNomeAcervoqt_emp_pessoa: TIntegerField
      FieldName = 'qt_emp_pessoa'
    end
  end
  object dsSituacoesFinanceiras: TDataSource
    DataSet = tblSituacoesFinanceiras
    Left = 680
    Top = 440
  end
  object tblSituacoesFinanceiras: TUMZQuery
    Connection = db
    SQL.Strings = (
      'select * from situacoes_financeiras'
      'order by ds_situacao')
    Params = <>
    Left = 680
    Top = 392
    object tblSituacoesFinanceirassn_protesto: TSmallintField
      FieldName = 'sn_protesto'
      Origin = 'WMESTRE12.situacoes_financeiras.sn_protesto'
    end
    object tblSituacoesFinanceirascd_situacao: TIntegerField
      FieldName = 'cd_situacao'
      Origin = 'WMESTRE12.situacoes_financeiras.cd_situacao'
    end
    object tblSituacoesFinanceirasds_situacao: TStringField
      FieldName = 'ds_situacao'
      Origin = 'WMESTRE12.situacoes_financeiras.ds_situacao'
      Size = 15
    end
    object tblSituacoesFinanceirasds_sigla_situacao: TStringField
      FieldName = 'ds_sigla_situacao'
      Origin = 'WMESTRE12.situacoes_financeiras.ds_sigla_situacao'
      Size = 10
    end
  end
  object qyAux: TUMZQuery
    Connection = db
    Params = <>
    Left = 392
    Top = 56
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
    Left = 392
    Top = 511
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
  object qyAreasAtuacao: TUMZQuery
    Connection = db
    SQL.Strings = (
      'SELECT'
      '  *'
      'FROM'
      '   empresas_areas_atuacao')
    Params = <>
    Left = 936
    Top = 392
    object qyAreasAtuacaocd_area_atuacao: TIntegerField
      FieldName = 'cd_area_atuacao'
      Origin = 'WMESTRE12.empresas_areas_atuacao.cd_area_atuacao'
    end
    object qyAreasAtuacaods_area_atuacao: TStringField
      FieldName = 'ds_area_atuacao'
      Origin = 'WMESTRE12.empresas_areas_atuacao.ds_area_atuacao'
      Size = 50
    end
  end
  object srcAreasAtuacao: TDataSource
    DataSet = qyAreasAtuacao
    Left = 936
    Top = 440
  end
  object qyAux1: TUMZQuery
    Connection = db
    Params = <>
    Left = 392
    Top = 157
  end
  object qyAux2: TUMZQuery
    Connection = db
    Params = <>
    Left = 392
    Top = 258
  end
  object qyTiposConta: TUMZQuery
    Connection = db
    SQL.Strings = (
      'SELECT'
      '   *'
      'FROM'
      '   fin_cadastro_contas_tipos'
      'ORDER BY'
      '   ds_tipo')
    Params = <>
    Left = 936
    Top = 200
    object qyTiposContacd_tipo: TSmallintField
      FieldName = 'cd_tipo'
      Origin = 'WMESTRE12.cadastro_contas_tipos.cd_tipo'
    end
    object qyTiposContads_tipo: TStringField
      FieldName = 'ds_tipo'
      Origin = 'WMESTRE12.cadastro_contas_tipos.ds_tipo'
      Size = 255
    end
  end
  object srcTiposConta: TDataSource
    DataSet = qyTiposConta
    Left = 936
    Top = 248
  end
  object qyTiposAcoes: TUMZQuery
    Connection = db
    SQL.Strings = (
      'SELECT'
      '   *'
      'FROM'
      '   fin_acoes_tipos'
      'WHERE'
      '  cd_tipo_acao in (2,3)'
      'ORDER BY'
      '   ds_tipo_acao')
    Params = <>
    Left = 936
    Top = 104
    object qyTiposAcoescd_tipo_acao: TSmallintField
      FieldName = 'cd_tipo_acao'
      Origin = 'WMESTRE12.fin_acoes_tipos.cd_tipo_acao'
    end
    object qyTiposAcoesds_tipo_acao: TStringField
      FieldName = 'ds_tipo_acao'
      Origin = 'WMESTRE12.fin_acoes_tipos.ds_tipo_acao'
      Size = 255
    end
  end
  object srcTiposAcoes: TDataSource
    DataSet = qyTiposAcoes
    Left = 936
    Top = 152
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
    Left = 287
    Top = 664
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
  object qyTiposTitulo: TUMZQuery
    Connection = db
    SQL.Strings = (
      'SELECT'
      '   *'
      'FROM'
      '   fin_tipos_titulo')
    Params = <>
    Left = 765
    Top = 8
    object qyTiposTitulods_tipo_titulo: TStringField
      FieldName = 'ds_tipo_titulo'
      Origin = 'WMESTRE12.tipos_titulo.ds_tipo_titulo'
      Size = 255
    end
    object qyTiposTituloct_tipo_titulo: TSmallintField
      FieldName = 'ct_tipo_titulo'
      Origin = 'WMESTRE12.tipos_titulo.ct_tipo_titulo'
    end
    object qyTiposTitulocd_coligada: TSmallintField
      FieldName = 'cd_coligada'
      Origin = 'WMESTRE12.fin_tipos_titulo.cd_coligada'
    end
    object qyTiposTitulocd_conta: TLargeintField
      FieldName = 'cd_conta'
    end
    object qyTiposTitulocd_tipo_titulo: TIntegerField
      FieldName = 'cd_tipo_titulo'
      Required = True
    end
  end
  object srcTiposTitulo: TDataSource
    DataSet = qyTiposTitulo
    Left = 765
    Top = 56
  end
  object qyRecalculoFreq: TUMZQuery
    Connection = db
    Params = <>
    Left = 136
    Top = 675
  end
  object qyTitulosReceita: TUMZQuery
    Connection = db
    SQL.Strings = (
      'SELECT'
      '  *'
      'FROM'
      '  fin_config_tipos_titulo'
      'WHERE'
      
        '  ct_tipo_titulo = 1 AND cd_coligada_matriz = :cd_coligada_matri' +
        'z'
      'ORDER BY'
      '  ds_tipo_titulo')
    Params = <
      item
        DataType = ftUnknown
        Name = 'cd_coligada_matriz'
        ParamType = ptUnknown
      end>
    Left = 392
    Top = 359
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'cd_coligada_matriz'
        ParamType = ptUnknown
      end>
    object SmallintField1: TSmallintField
      FieldName = 'cd_tipo_titulo'
      Origin = 'WMESTRE12.tipos_titulo.cd_tipo_titulo'
    end
    object StringField3: TStringField
      FieldName = 'ds_tipo_titulo'
      Origin = 'WMESTRE12.tipos_titulo.ds_tipo_titulo'
      Size = 255
    end
    object SmallintField2: TSmallintField
      FieldName = 'ct_tipo_titulo'
      Origin = 'WMESTRE12.tipos_titulo.ct_tipo_titulo'
    end
    object qyTitulosReceitacd_conta: TLargeintField
      FieldName = 'cd_conta'
    end
  end
  object tblEstados: TUMZQuery
    Connection = db
    SQL.Strings = (
      'SELECT * FROM estados '
      'ORDER BY ds_estado ')
    Params = <>
    Left = 88
    Top = 310
  end
  object tblEstados2: TUMZQuery
    Connection = db
    SQL.Strings = (
      'SELECT * FROM estados WHERE cd_pais = 10 '
      'ORDER BY ds_estado ')
    Params = <>
    Left = 88
    Top = 512
  end
  object qyLastInsert: TUMZQuery
    Connection = db
    Params = <>
    Left = 392
    Top = 309
  end
  object tblEscolas: TUMZQuery
    Connection = db
    SQL.Strings = (
      'select * from instituicoes_ensino order by nm_instituicao')
    Params = <>
    Left = 287
    Top = 209
    object tblEscolasnm_instituicao: TStringField
      FieldName = 'nm_instituicao'
      Origin = 'WMESTRE12.instituicoes_ensino.nm_instituicao'
      Size = 80
    end
    object tblEscolasds_endereco: TStringField
      FieldName = 'ds_endereco'
      Origin = 'WMESTRE12.instituicoes_ensino.ds_endereco'
      Size = 80
    end
    object tblEscolasds_complemento: TStringField
      FieldName = 'ds_complemento'
      Origin = 'WMESTRE12.instituicoes_ensino.ds_complemento'
      Size = 50
    end
    object tblEscolasds_bairro: TStringField
      FieldName = 'ds_bairro'
      Origin = 'WMESTRE12.instituicoes_ensino.ds_bairro'
      Size = 50
    end
    object tblEscolasds_cidade: TStringField
      FieldName = 'ds_cidade'
      Origin = 'WMESTRE12.instituicoes_ensino.ds_cidade'
      Size = 50
    end
    object tblEscolasds_estado: TStringField
      FieldName = 'ds_estado'
      Origin = 'WMESTRE12.instituicoes_ensino.ds_estado'
      FixedChar = True
      Size = 3
    end
    object tblEscolasds_cep: TStringField
      FieldName = 'ds_cep'
      Origin = 'WMESTRE12.instituicoes_ensino.ds_cep'
      Size = 8
    end
    object tblEscolasds_diretor: TStringField
      FieldName = 'ds_diretor'
      Origin = 'WMESTRE12.instituicoes_ensino.ds_diretor'
      Size = 80
    end
    object tblEscolasds_tipo: TStringField
      FieldName = 'ds_tipo'
      Origin = 'WMESTRE12.instituicoes_ensino.ds_tipo'
      FixedChar = True
      Size = 1
    end
    object tblEscolasds_telefone1: TStringField
      FieldName = 'ds_telefone1'
      Origin = 'WMESTRE12.instituicoes_ensino.ds_telefone1'
      Size = 25
    end
    object tblEscolasds_telefone2: TStringField
      FieldName = 'ds_telefone2'
      Origin = 'WMESTRE12.instituicoes_ensino.ds_telefone2'
      Size = 25
    end
    object tblEscolasds_email: TStringField
      FieldName = 'ds_email'
      Origin = 'WMESTRE12.instituicoes_ensino.ds_email'
      Size = 100
    end
    object tblEscolasds_site: TStringField
      FieldName = 'ds_site'
      Origin = 'WMESTRE12.instituicoes_ensino.ds_site'
      Size = 100
    end
    object tblEscolassn_educacao_infantil: TStringField
      FieldName = 'sn_educacao_infantil'
      Origin = 'WMESTRE12.instituicoes_ensino.sn_educacao_infantil'
      FixedChar = True
      Size = 1
    end
    object tblEscolassn_ensino_fundamental: TStringField
      FieldName = 'sn_ensino_fundamental'
      Origin = 'WMESTRE12.instituicoes_ensino.sn_ensino_fundamental'
      FixedChar = True
      Size = 1
    end
    object tblEscolassn_ensino_medio: TStringField
      FieldName = 'sn_ensino_medio'
      Origin = 'WMESTRE12.instituicoes_ensino.sn_ensino_medio'
      FixedChar = True
      Size = 1
    end
    object tblEscolassn_ensino_superior: TStringField
      FieldName = 'sn_ensino_superior'
      Origin = 'WMESTRE12.instituicoes_ensino.sn_ensino_superior'
      FixedChar = True
      Size = 1
    end
    object tblEscolassn_cursos_profissionalizantes: TStringField
      FieldName = 'sn_cursos_profissionalizantes'
      Origin = 'WMESTRE12.instituicoes_ensino.sn_cursos_profissionalizantes'
      FixedChar = True
      Size = 1
    end
    object tblEscolassn_ensino_especial: TStringField
      FieldName = 'sn_ensino_especial'
      Origin = 'WMESTRE12.instituicoes_ensino.sn_ensino_especial'
      FixedChar = True
      Size = 1
    end
    object tblEscolascd_instituicao: TIntegerField
      FieldName = 'cd_instituicao'
      Required = True
    end
  end
  object qyAreasConhecimento: TUMZQuery
    Connection = db
    SQL.Strings = (
      'SELECT'
      '   *'
      'FROM '
      '   mec_areas'
      'ORDER BY '
      '   ds_area')
    Params = <>
    Left = 392
    Top = 613
    object qyAreasConhecimentocd_area: TIntegerField
      FieldName = 'cd_area'
      Required = True
    end
    object qyAreasConhecimentods_area: TStringField
      FieldName = 'ds_area'
      Size = 50
    end
  end
  object qTemp: TUMZQuery
    Connection = db
    SQL.Strings = (
      '')
    Params = <>
    Left = 448
    Top = 106
  end
  object QyProvas: TUMZQuery
    Connection = db
    SQL.Strings = (
      'SELECT'
      
        #9'COALESCE(GROUP_CONCAT(CONCAT('#39'nota'#39', nro_nota)), '#39'NULL'#39') as pro' +
        'vas'
      'FROM'
      #9'diario_provas'
      'WHERE'
      #9'turma = :turma AND'
      #9'anosemestre = :anosemestre AND'
      #9'disciplina = :disciplina AND'
      #9'bimestre = :bimestre AND'
      '  sn_especial <> 1 AND'
      '  sn_proficiencia <> 1 AND '
      '  nro_nota > 0')
    Params = <
      item
        DataType = ftUnknown
        Name = 'turma'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'anosemestre'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'disciplina'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'bimestre'
        ParamType = ptUnknown
      end>
    SQLList.Strings = (
      
        'oracle=SELECT'#13#10#9'COALESCE(GROUP_CONCAT(CONCAT('#39'nota'#39', nro_nota)),' +
        ' '#39'NULL'#39') as provas'#13#10'FROM'#13#10#9'diario_provas'#13#10'WHERE'#13#10#9'turma = :turma' +
        ' AND'#13#10#9'anosemestre = :anosemestre AND'#13#10#9'disciplina = :disciplina' +
        ' AND'#13#10#9'bimestre = :bimestre AND'#13#10'                sn_especial <> ' +
        '1 AND'#13#10'                sn_proficiencia <> 1 AND '#13#10'              ' +
        '  nro_nota > 0'
      
        'mysql-5=SELECT'#13#10#9'IFNULL(GROUP_CONCAT(CONCAT('#39'nota'#39', nro_nota)), ' +
        #39'NULL'#39') as provas'#13#10'FROM'#13#10#9'diario_provas'#13#10'WHERE'#13#10#9'turma = :turma ' +
        'AND'#13#10#9'anosemestre = :anosemestre AND'#13#10#9'disciplina = :disciplina ' +
        'AND'#13#10#9'bimestre = :bimestre AND'#13#10'                sn_especial <> 1' +
        ' AND'#13#10'                sn_proficiencia <> 1 AND '#13#10'               ' +
        ' nro_nota > 0')
    Left = 536
    Top = 520
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'turma'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'anosemestre'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'disciplina'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'bimestre'
        ParamType = ptUnknown
      end>
  end
  object qryTaxaRecorrencia: TUMZQuery
    Connection = db
    SQL.Strings = (
      'SELECT'
      '   fi.codigoaluno,'
      '   fi.disciplina,'
      '   fi.curso,'
      '   fi.codigograde,'
      '   tt.cd_tipo_titulo,'
      '   tt.cd_conta,'
      '   tt.vl_padrao,'
      '   tt.nr_parcela,'
      '   c.depto,'
      '   d.descricao,'
      '   t.cd_centro,'
      
        '   STR_TO_DATE(CONCAT(LAST_DAY(CURDATE()), " 00:00:00"), "%Y-%m-' +
        '%d %T") dt_vencto'
      'FROM'
      '   fichaindividual fi'
      '      JOIN turmas t ON'
      '         (fi.turma = t.codigo) AND'
      '         (fi.anosemestre = t.anosemestre)'
      '      JOIN cursos c ON'
      '         (t.curso = c.codigo) AND'
      '         (t.anosemestre = c.anosemestre)'
      '      JOIN disciplinas d ON'
      '         (fi.disciplina = d.codigo) AND'
      '         (fi.curso = d.curso)'
      '      JOIN avaliacoes_parametros ap ON'
      '         (t.cd_avaliacao = ap.cd_avaliacao)'
      '         JOIN fin_tipos_titulo tt ON'
      '            (ap.cd_titulo_2epoca = tt.cd_tipo_titulo)'
      'WHERE'
      '   fi.turma = :cd_turma AND'
      '   fi.anosemestre = :nr_anosemestre AND'
      '   fi.codigoaluno = :cd_pessoa AND'
      '   fi.situacao = 11 AND'
      '   fi.cd_mensalidade_exame IS NULL'
      '   ')
    Params = <
      item
        DataType = ftUnknown
        Name = 'cd_turma'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'nr_anosemestre'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'cd_pessoa'
        ParamType = ptUnknown
      end>
    Left = 680
    Top = 584
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'cd_turma'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'nr_anosemestre'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'cd_pessoa'
        ParamType = ptUnknown
      end>
    object qryTaxaRecorrenciacodigoaluno: TIntegerField
      FieldName = 'codigoaluno'
    end
    object qryTaxaRecorrenciadisciplina: TIntegerField
      FieldName = 'disciplina'
    end
    object qryTaxaRecorrenciacurso: TStringField
      FieldName = 'curso'
      Size = 15
    end
    object qryTaxaRecorrenciacd_tipo_titulo: TSmallintField
      FieldName = 'cd_tipo_titulo'
    end
    object qryTaxaRecorrenciacd_conta: TIntegerField
      FieldName = 'cd_conta'
    end
    object qryTaxaRecorrenciavl_padrao: TFloatField
      FieldName = 'vl_padrao'
    end
    object qryTaxaRecorrencianr_parcela: TSmallintField
      FieldName = 'nr_parcela'
    end
    object qryTaxaRecorrenciadepto: TSmallintField
      FieldName = 'depto'
    end
    object qryTaxaRecorrenciadt_vencto: TDateTimeField
      FieldName = 'dt_vencto'
    end
    object qryTaxaRecorrenciadescricao: TStringField
      FieldName = 'descricao'
      Size = 150
    end
    object qryTaxaRecorrenciacodigograde: TStringField
      FieldName = 'codigograde'
      Size = 50
    end
    object qryTaxaRecorrenciacd_centro: TIntegerField
      FieldName = 'cd_centro'
    end
  end
  object qryUpdFichaIndividual: TUMZQuery
    Connection = db
    SQL.Strings = (
      'UPDATE'
      '   fichaindividual'
      'SET'
      '   cd_mensalidade_exame = :cd_mensalidade_exame'
      'WHERE'
      '   anosemestre = :nr_anosemestre AND'
      '   turma = :cd_turma AND'
      '   codigograde = :codigograde AND'
      '   disciplina = :cd_disciplina AND'
      '   codigoaluno = :cd_pessoa')
    Params = <
      item
        DataType = ftUnknown
        Name = 'cd_mensalidade_exame'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'nr_anosemestre'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'cd_turma'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'codigograde'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'cd_disciplina'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'cd_pessoa'
        ParamType = ptUnknown
      end>
    Left = 680
    Top = 528
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'cd_mensalidade_exame'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'nr_anosemestre'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'cd_turma'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'codigograde'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'cd_disciplina'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'cd_pessoa'
        ParamType = ptUnknown
      end>
  end
  object qyDataHoraAtual: TUMZQuery
    Connection = db
    Params = <>
    SQLList.Strings = (
      'mysql-5=SELECT NOW() AS data'
      'oracle=SELECT SYSDATE AS data FROM DUAL')
    Left = 392
    Top = 664
  end
  object qyUsuariosParametros: TUMZQuery
    Connection = db
    SQL.Strings = (
      'SELECT'
      '  :cd_usuario,'
      '  :ds_parametro,'
      '  :ds_valor'
      'FROM'
      '  DUAL')
    Params = <
      item
        DataType = ftUnknown
        Name = 'cd_usuario'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'ds_parametro'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'ds_valor'
        ParamType = ptUnknown
      end>
    SQLList.Strings = (
      
        'mysql-5=REPLACE INTO usuarios_parametros(cd_usuario,ds_parametro' +
        ',ds_valor) VALUES(:cd_usuario,:ds_parametro,:ds_valor)'
      
        'oracle=MERGE INTO usuarios_parametros up USING '#13#10'   (SELECT '#13#10'  ' +
        '     :cd_usuario AS cd_usuario, '#13#10'       :ds_parametro AS ds_par' +
        'ametro, '#13#10'       :ds_valor AS ds_valor FROM dual) up2 ON '#13#10'     ' +
        '     (up.cd_usuario = up2.cd_usuario AND '#13#10'           up.ds_para' +
        'metro = up2.ds_parametro) '#13#10'    WHEN MATCHED THEN '#13#10'       UPDAT' +
        'E SET up.ds_valor = up2.ds_valor '#13#10'    WHEN NOT MATCHED THEN '#13#10' ' +
        '      INSERT (up.cd_usuario, up.ds_parametro, up.ds_valor) VALUE' +
        'S (up2.cd_usuario, up2.ds_parametro, up2.ds_valor)')
    Left = 680
    Top = 656
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'cd_usuario'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'ds_parametro'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'ds_valor'
        ParamType = ptUnknown
      end>
  end
  object qryInsertHist: TUMZReadOnlyQuery
    Connection = db
    SQL.Strings = (
      'INSERT INTO HISTORICO_ESCOLAS_SERIES'
      
        '   (CODIGOALUNO, GRAU, SERIE, ANO, DS_ESCOLA, DS_ESCOLA_CIDADE, ' +
        'DS_ESCOLA_ESTADO, CD_INSTITUICAO)'
      'VALUES'
      
        '   (:CODIGOALUNO, :GRAU, :SERIE, :ANO, :DS_ESCOLA, :DS_CIDADE, :' +
        'DS_ESTADO, :CD_INSTITUICAO)')
    Params = <
      item
        DataType = ftUnknown
        Name = 'CODIGOALUNO'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'GRAU'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'SERIE'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'ANO'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'DS_ESCOLA'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'DS_CIDADE'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'DS_ESTADO'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'CD_INSTITUICAO'
        ParamType = ptUnknown
      end>
    SQLList.Strings = (
      
        'oracle=MERGE INTO HISTORICO_ESCOLAS_SERIES H USING'#13#10'('#13#10'   SELECT' +
        #13#10'      :CODIGOALUNO CODIGOALUNO,'#13#10'      :GRAU GRAU,'#13#10'      :SER' +
        'IE SERIE,'#13#10'      :ANO ANO,'#13#10'      :DS_ESCOLA DS_ESCOLA,'#13#10'      :' +
        'DS_CIDADE DS_CIDADE,'#13#10'      :DS_ESTADO DS_ESTADO,'#13#10'      :CD_INS' +
        'TITUICAO CD_INSTITUICAO'#13#10'   FROM'#13#10'      DUAL'#13#10') UP ON'#13#10'   (H.COD' +
        'IGOALUNO = UP.CODIGOALUNO) AND'#13#10'   (H.GRAU = UP.GRAU) AND'#13#10'   (H' +
        '.SERIE = UP.SERIE)'#13#10'WHEN MATCHED THEN'#13#10'   UPDATE SET'#13#10'      H.CO' +
        'DIGOALUNO = UP.CODIGOALUNO,'#13#10'      H.GRAU = UP.GRAU,'#13#10'      H.SE' +
        'RIE = UP.SERIE,'#13#10'      H.ANO = UP.ANO,'#13#10'      H.DS_ESCOLA = UP.D' +
        'S_ESCOLA,'#13#10'      H.DS_ESCOLA_CIDADE = UP.DS_CIDADE,'#13#10'      H.DS_' +
        'ESCOLA_ESTADO = UP.DS_ESTADO,'#13#10'      H.CD_INSTITUICAO = UP.CD_IN' +
        'STITUICAO'#13#10'WHEN NOT MATCHED THEN'#13#10'   INSERT'#13#10'      (H.CODIGOALUN' +
        'O, H.GRAU, H.SERIE, H.ANO, H.DS_ESCOLA, H.DS_ESCOLA_CIDADE, H.DS' +
        '_ESCOLA_ESTADO, H.CD_INSTITUICAO)'#13#10'   VALUES'#13#10'      (UP.CODIGOAL' +
        'UNO, UP.GRAU, UP.SERIE, UP.ANO, UP.DS_ESCOLA, UP.DS_CIDADE, UP.D' +
        'S_ESTADO, UP.CD_INSTITUICAO)'
      
        'mysql-5=REPLACE INTO HISTORICO_ESCOLAS_SERIES'#13#10'   (CODIGOALUNO, ' +
        'GRAU, SERIE, ANO, DS_ESCOLA, DS_ESCOLA_CIDADE, DS_ESCOLA_ESTADO,' +
        ' CD_INSTITUICAO, NR_MES_INICIO, NR_MES_CONCLUSAO, NR_ANO_INICIO)' +
        #13#10'VALUES'#13#10'   (:CODIGOALUNO, :GRAU, :SERIE, :ANO, :DS_ESCOLA, :DS' +
        '_CIDADE, :DS_ESTADO, :CD_INSTITUICAO, :NR_MES_INICIO, :NR_MES_CO' +
        'NCLUSAO, :NR_ANO_INICIO)')
    Left = 24
    Top = 512
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'CODIGOALUNO'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'GRAU'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'SERIE'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'ANO'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'DS_ESCOLA'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'DS_CIDADE'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'DS_ESTADO'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'CD_INSTITUICAO'
        ParamType = ptUnknown
      end>
  end
  object qrySelectDescontos: TUMZReadOnlyQuery
    Connection = db
    SQL.Strings = (
      
        'SELECT GET_DESCONTOS(:CD_MENSALIDADE, :DT_BASE) DECONTO FROM DUA' +
        'L')
    Params = <
      item
        DataType = ftUnknown
        Name = 'CD_MENSALIDADE'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'DT_BASE'
        ParamType = ptUnknown
      end>
    SQLList.Strings = (
      
        'oracle=SELECT GET_DESCONTOS(:CD_MENSALIDADE, :DT_BASE) DECONTO F' +
        'ROM DUAL'#13#10
      'mysql-5=SELECT GET_DESCONTOS(:CD_MENSALIDADE, :DT_BASE) DECONTO')
    Left = 448
    Top = 160
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'CD_MENSALIDADE'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'DT_BASE'
        ParamType = ptUnknown
      end>
    object qrySelectDescontosDECONTO: TFloatField
      FieldName = 'DECONTO'
      ReadOnly = True
    end
  end
  object qrySelectAcresc: TUMZReadOnlyQuery
    Connection = db
    SQL.Strings = (
      'SELECT'
      '   GET_ACRESCIMOS(:CD_MENSALIDADE, :DT_BASE) ACRESCIMO'
      'FROM'
      '   DUAL')
    Params = <
      item
        DataType = ftUnknown
        Name = 'CD_MENSALIDADE'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'DT_BASE'
        ParamType = ptUnknown
      end>
    SQLList.Strings = (
      
        'oracle=SELECT'#13#10'   GET_ACRESCIMOS(:CD_MENSALIDADE, :DT_BASE) ACRE' +
        'SCIMO'#13#10'FROM'#13#10'   DUAL'
      
        'mysql-5=SELECT'#13#10'   GET_ACRESCIMOS(:CD_MENSALIDADE, :DT_BASE) ACR' +
        'ESCIMO')
    Left = 448
    Top = 208
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'CD_MENSALIDADE'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'DT_BASE'
        ParamType = ptUnknown
      end>
    object qrySelectAcrescACRESCIMO: TFloatField
      FieldName = 'ACRESCIMO'
      ReadOnly = True
    end
  end
  object qrySelectCheques: TUMZReadOnlyQuery
    Connection = db
    SQL.Strings = (
      'SELECT DISTINCT'
      '   C.CD_CHEQUE,'
      '   C.NR_VALOR,'
      '   C.DS_CHEQUE,'
      '   C.CD_SITUACAO,'
      '   C.CD_CAIXA,'
      
        '   LEFT(LISTAGG(NVL(P.NM_PESSOA, '#39#39'), '#39' / '#39') WITHIN GROUP (ORDER' +
        ' BY P.NM_PESSOA), 240) NM_PESSOA'
      'FROM'
      '   FIN_CHEQUES C'
      '      JOIN SITUACOES S ON'
      '         (S.CD_MODULO = 2050) AND'
      '         (S.CD_SITUACAO = C.CD_SITUACAO)'
      '      LEFT JOIN FIN_CHEQUES_MENSALIDADES CM ON'
      '         (C.CD_CHEQUE = CM.CD_CHEQUE)'
      '         LEFT OUTER JOIN MENSALIDADES M ON'
      '            (CM.CD_MENSALIDADE = M.CD_MENSALIDADE)'
      '            LEFT OUTER JOIN PESSOAS P ON'
      '               (M.CODIGOALUNO = P.CD_PESSOA)'
      'WHERE'
      '   C.CD_CHEQUE = :CD_CHEQUE'
      'GROUP BY'
      '   C.CD_CHEQUE,'
      '   C.NR_VALOR,'
      '   C.DS_CHEQUE,'
      '   C.CD_SITUACAO,'
      '   C.CD_CAIXA')
    Params = <
      item
        DataType = ftUnknown
        Name = 'CD_CHEQUE'
        ParamType = ptUnknown
      end>
    SQLList.Strings = (
      
        'mysql-5=SELECT'#13#10'   C.CD_CHEQUE,'#13#10'   C.NR_VALOR,'#13#10'   C.DS_CHEQUE,' +
        #13#10'   C.CD_SITUACAO,'#13#10'   C.CD_CAIXA,'#13#10'   LEFT(GROUP_CONCAT(DISTIN' +
        'CT IFNULL(P.NM_PESSOA, '#39#39') SEPARATOR '#39' / '#39'), 240) NM_PESSOA'#13#10'FRO' +
        'M'#13#10'   FIN_CHEQUES C'#13#10'      JOIN SITUACOES S ON'#13#10'         (S.CD_M' +
        'ODULO = 2050) AND'#13#10'         (S.CD_SITUACAO = C.CD_SITUACAO)'#13#10'   ' +
        '   LEFT JOIN FIN_CHEQUES_MENSALIDADES CM ON'#13#10'         (C.CD_CHEQ' +
        'UE = CM.CD_CHEQUE)'#13#10'         LEFT OUTER JOIN MENSALIDADES M ON'#13#10 +
        '            (CM.CD_MENSALIDADE = M.CD_MENSALIDADE)'#13#10'            ' +
        'LEFT OUTER JOIN PESSOAS P ON'#13#10'               (M.CODIGOALUNO = P.' +
        'CD_PESSOA)'#13#10'WHERE'#13#10'   C.CD_CHEQUE = :CD_CHEQUE'#13#10'GROUP BY'#13#10'   C.C' +
        'D_CHEQUE'
      
        'oracle=SELECT DISTINCT'#13#10'   C.CD_CHEQUE,'#13#10'   C.NR_VALOR,'#13#10'   C.DS' +
        '_CHEQUE,'#13#10'   C.CD_SITUACAO,'#13#10'   C.CD_CAIXA,'#13#10'   LEFT(LISTAGG(NVL' +
        '(P.NM_PESSOA, '#39#39'), '#39' / '#39') WITHIN GROUP (ORDER BY P.NM_PESSOA), 2' +
        '40) NM_PESSOA'#13#10'FROM'#13#10'   FIN_CHEQUES C'#13#10'      JOIN SITUACOES S ON' +
        #13#10'         (S.CD_MODULO = 2050) AND'#13#10'         (S.CD_SITUACAO = C' +
        '.CD_SITUACAO)'#13#10'      LEFT JOIN FIN_CHEQUES_MENSALIDADES CM ON'#13#10' ' +
        '        (C.CD_CHEQUE = CM.CD_CHEQUE)'#13#10'         LEFT OUTER JOIN M' +
        'ENSALIDADES M ON'#13#10'            (CM.CD_MENSALIDADE = M.CD_MENSALID' +
        'ADE)'#13#10'            LEFT OUTER JOIN PESSOAS P ON'#13#10'               (' +
        'M.CODIGOALUNO = P.CD_PESSOA)'#13#10'WHERE'#13#10'   C.CD_CHEQUE = :CD_CHEQUE' +
        #13#10'GROUP BY'#13#10'   C.CD_CHEQUE,'#13#10'   C.NR_VALOR,'#13#10'   C.DS_CHEQUE,'#13#10'  ' +
        ' C.CD_SITUACAO,'#13#10'   C.CD_CAIXA')
    Left = 456
    Top = 264
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'CD_CHEQUE'
        ParamType = ptUnknown
      end>
    object qrySelectChequesCD_CHEQUE: TIntegerField
      FieldName = 'CD_CHEQUE'
    end
    object qrySelectChequesNR_VALOR: TFloatField
      FieldName = 'NR_VALOR'
    end
    object qrySelectChequesDS_CHEQUE: TStringField
      FieldName = 'DS_CHEQUE'
      Size = 30
    end
    object qrySelectChequesCD_SITUACAO: TLargeintField
      FieldName = 'CD_SITUACAO'
    end
    object qrySelectChequesCD_CAIXA: TLargeintField
      FieldName = 'CD_CAIXA'
    end
    object qrySelectChequesNM_PESSOA: TStringField
      FieldName = 'NM_PESSOA'
      ReadOnly = True
      Size = 4000
    end
  end
  object qrySelectEqui: TUMZReadOnlyQuery
    Connection = db
    SQL.Strings = (
      'SELECT'
      '   CASE'
      
        '      WHEN (FIRST_OCCURRENCE(F2.CODIGOALUNO) IS NULL) AND (COUNT' +
        '(FI.CODIGOALUNO) < COUNT(*)) THEN '#39'N'#195'O'#39
      '      ELSE '#39'EQUI'#39
      '   END RESULTADO'
      
        '   --IF(ISNULL(F2.CODIGOALUNO), IF(COUNT(FI.CODIGOALUNO) < COUNT' +
        '(*), '#39'N'#195'O'#39', '#39'EQUI'#39'), '#39'EQUI'#39') RESULTADO'
      'FROM'
      '   DISCIPLINAS D'
      '      LEFT JOIN DISCIPLINAS_EQUIV_INTERNA EQ ON'
      '         (D.CODIGO = EQ.CD_DISCIPLINA) AND'
      '         (D.CURSO = EQ.CD_CURSO)'
      '         LEFT JOIN DISCIPLINAS_EQUIV_GRUPOS GR ON'
      '            (EQ.CD_GRUPO = GR.CD_GRUPO1)'
      '            LEFT JOIN DISCIPLINAS_EQUIV_INTERNA EQ2 ON'
      '               (EQ2.CD_GRUPO = GR.CD_GRUPO2)'
      '                  LEFT JOIN FICHAINDIVIDUAL FI ON'
      '                     (EQ2.CD_CURSO = FI.CURSO) AND'
      '                     (EQ2.CD_DISCIPLINA = FI.DISCIPLINA) AND'
      '                     (FI.CODIGOALUNO = :CD_ALUNO) AND'
      
        '                     (FI.SITUACAO in (SELECT CD_SITUACAO FROM SI' +
        'TUACAO WHERE CD_SITUACAO_PAI IN(0,12)))'
      '   LEFT JOIN FICHAINDIVIDUAL F2 ON'
      '      (F2.DISCIPLINA = :CD_DISCIPLINA) AND'
      '      (F2.CURSO = :CD_CURSO) AND'
      '      (F2.CODIGOALUNO = :CD_ALUNO) AND'
      '      ((F2.GRAU NOT IN (1,2)) OR (F2.SERIE = :ETAPA)) AND'
      
        '      (F2.SITUACAO IN (SELECT CD_SITUACAO FROM SITUACAO WHERE CD' +
        '_SITUACAO_PAI IN(0,12)))'
      'WHERE'
      '   D.CODIGO = :CD_DISCIPLINA AND'
      '   D.CURSO = :CD_CURSO'
      'GROUP BY'
      '   EQ.CD_GRUPO'
      'HAVING RESULTADO = '#39'EQUI'#39)
    Params = <
      item
        DataType = ftUnknown
        Name = 'CD_ALUNO'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'CD_DISCIPLINA'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'CD_CURSO'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'ETAPA'
        ParamType = ptUnknown
      end>
    SQLList.Strings = (
      
        'oracle=SELECT'#13#10'   CASE'#13#10'      WHEN (FIRST_OCCURRENCE(F2.CODIGOAL' +
        'UNO) IS NULL) AND (COUNT(FI.CODIGOALUNO) < COUNT(*)) THEN '#39'N'#195'O'#39#13 +
        #10'      ELSE '#39'EQUI'#39#13#10'   END RESULTADO'#13#10'FROM'#13#10'   DISCIPLINAS D'#13#10'  ' +
        '    LEFT JOIN DISCIPLINAS_EQUIV_INTERNA EQ ON'#13#10'         (D.CODIG' +
        'O = EQ.CD_DISCIPLINA) AND'#13#10'         (D.CURSO = EQ.CD_CURSO)'#13#10'   ' +
        '      LEFT JOIN DISCIPLINAS_EQUIV_GRUPOS GR ON'#13#10'            (EQ.' +
        'CD_GRUPO = GR.CD_GRUPO1)'#13#10'            LEFT JOIN DISCIPLINAS_EQUI' +
        'V_INTERNA EQ2 ON'#13#10'               (EQ2.CD_GRUPO = GR.CD_GRUPO2)'#13#10 +
        '                  LEFT JOIN FICHAINDIVIDUAL FI ON'#13#10'             ' +
        '        (EQ2.CD_CURSO = FI.CURSO) AND'#13#10'                     (EQ2' +
        '.CD_DISCIPLINA = FI.DISCIPLINA) AND'#13#10'                     (FI.CO' +
        'DIGOALUNO = :CD_ALUNO) AND'#13#10'                     (FI.SITUACAO in' +
        ' (SELECT CD_SITUACAO FROM SITUACAO WHERE CD_SITUACAO_PAI IN(0,12' +
        ')))'#13#10'   LEFT JOIN FICHAINDIVIDUAL F2 ON'#13#10'      (F2.DISCIPLINA = ' +
        ':CD_DISCIPLINA) AND'#13#10'      (F2.CURSO = :CD_CURSO) AND'#13#10'      (F2' +
        '.CODIGOALUNO = :CD_ALUNO) AND'#13#10'      ((F2.GRAU NOT IN (1,2)) OR ' +
        '(F2.SERIE = :ETAPA)) AND'#13#10'      (F2.SITUACAO IN (SELECT CD_SITUA' +
        'CAO FROM SITUACAO WHERE CD_SITUACAO_PAI IN(0,12)))'#13#10'WHERE'#13#10'   D.' +
        'CODIGO = :CD_DISCIPLINA AND'#13#10'   D.CURSO = :CD_CURSO'#13#10'GROUP BY'#13#10' ' +
        '  EQ.CD_GRUPO'
      
        'mysql-5=SELECT'#13#10'   IF(ISNULL(F2.CODIGOALUNO), IF(COUNT(FI.CODIGO' +
        'ALUNO) < COUNT(*), '#39'N'#195'O'#39', '#39'EQUI'#39'), '#39'EQUI'#39') RESULTADO'#13#10'FROM'#13#10'   D' +
        'ISCIPLINAS D'#13#10'      LEFT JOIN DISCIPLINAS_EQUIV_INTERNA EQ ON'#13#10' ' +
        '        (D.CODIGO = EQ.CD_DISCIPLINA) AND'#13#10'         (D.CURSO = E' +
        'Q.CD_CURSO)'#13#10'         LEFT JOIN DISCIPLINAS_EQUIV_GRUPOS GR ON'#13#10 +
        '            (EQ.CD_GRUPO = GR.CD_GRUPO1)'#13#10'            LEFT JOIN ' +
        'DISCIPLINAS_EQUIV_INTERNA EQ2 ON'#13#10'               (EQ2.CD_GRUPO =' +
        ' GR.CD_GRUPO2)'#13#10'                  LEFT JOIN FICHAINDIVIDUAL FI O' +
        'N'#13#10'                     (EQ2.CD_CURSO = FI.CURSO) AND'#13#10'         ' +
        '            (EQ2.CD_DISCIPLINA = FI.DISCIPLINA) AND'#13#10'           ' +
        '          (FI.CODIGOALUNO = :CD_ALUNO) AND'#13#10'                    ' +
        ' (FI.SITUACAO in (SELECT CD_SITUACAO FROM SITUACAO WHERE CD_SITU' +
        'ACAO_PAI IN(0,12)))'#13#10'   LEFT JOIN FICHAINDIVIDUAL F2 ON'#13#10'      (' +
        'F2.DISCIPLINA = :CD_DISCIPLINA) AND'#13#10'      (F2.CURSO = :CD_CURSO' +
        ') AND'#13#10'      (F2.CODIGOALUNO = :CD_ALUNO) AND'#13#10'      ((F2.GRAU N' +
        'OT IN (1,2)) OR (F2.SERIE = :ETAPA)) AND'#13#10'      (F2.SITUACAO IN ' +
        '(SELECT CD_SITUACAO FROM SITUACAO WHERE CD_SITUACAO_PAI IN(0,12)' +
        '))'#13#10'WHERE'#13#10'   D.CODIGO = :CD_DISCIPLINA AND'#13#10'   D.CURSO = :CD_CU' +
        'RSO'#13#10'GROUP BY'#13#10'   EQ.CD_GRUPO'#13#10'HAVING RESULTADO = '#39'EQUI'#39)
    Left = 456
    Top = 320
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'CD_ALUNO'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'CD_DISCIPLINA'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'CD_CURSO'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'ETAPA'
        ParamType = ptUnknown
      end>
    object qrySelectEquiRESULTADO: TStringField
      FieldName = 'RESULTADO'
      ReadOnly = True
      Size = 4
    end
  end
  object qryUpdFreqCH: TUMZQuery
    Connection = db
    SQL.Strings = (
      'UPDATE'
      '   FICHAINDIVIDUAL F,'
      '   GRADECURRICULAR G,'
      '   TURMAS T'
      'SET'
      
        '   F.FREQUENCIA = ROUND(100 - (F.TOTALFALTAS / G.VALOR * 100 ), ' +
        '0)'
      'WHERE'
      '   F.SN_BLOQ_FREQ_GLOBAL = 0 AND'
      '   F.CODIGOGRADE = G.CODIGO AND'
      '   F.ANOSEMESTRE = T.ANOSEMESTRE AND'
      '   F.TURMA = T.CODIGO AND'
      '   F.CODIGOALUNO = :CODIGOALUNO AND'
      '   F.TURMA = :TURMA AND'
      '   F.ANOSEMESTRE = :ANOSEMESTRE')
    Params = <
      item
        DataType = ftUnknown
        Name = 'CODIGOALUNO'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'TURMA'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'ANOSEMESTRE'
        ParamType = ptUnknown
      end>
    SQLList.Strings = (
      
        'mysql-5=UPDATE'#13#10'   FICHAINDIVIDUAL F,'#13#10'   GRADECURRICULAR G,'#13#10'  ' +
        ' TURMAS T'#13#10'SET'#13#10'   F.FREQUENCIA = ROUND(100 - (F.TOTALFALTAS / G' +
        '.VALOR * 100 ), 0)'#13#10'WHERE'#13#10'   F.SN_BLOQ_FREQ_GLOBAL = 0 AND'#13#10'   ' +
        'F.CODIGOGRADE = G.CODIGO AND'#13#10'   F.ANOSEMESTRE = T.ANOSEMESTRE A' +
        'ND'#13#10'   F.TURMA = T.CODIGO AND'#13#10'   F.CODIGOALUNO = :CODIGOALUNO A' +
        'ND'#13#10'   F.TURMA = :TURMA AND'#13#10'   F.ANOSEMESTRE = :ANOSEMESTRE'
      
        'oracle=MERGE INTO FICHAINDIVIDUAL F USING'#13#10'('#13#10'   SELECT'#13#10'      C' +
        'ODIGO,'#13#10'      VALOR'#13#10'   FROM'#13#10'      GRADECURRICULAR'#13#10') UP ON'#13#10'  ' +
        ' (F.SN_BLOQ_FREQ_GLOBAL = 0 AND'#13#10'    F.CODIGOGRADE = UP.CODIGO A' +
        'ND'#13#10'    F.ANOSEMESTRE = :ANOSEMESTRE AND'#13#10'    F.TURMA = :TURMA A' +
        'ND'#13#10'    F.CODIGOALUNO = :CODIGOALUNO)'#13#10'WHEN MATCHED THEN'#13#10'   UPD' +
        'ATE SET'#13#10'      F.FREQUENCIA = ROUND(100 - (F.TOTALFALTAS / UP.VA' +
        'LOR * 100 ), 0)')
    Left = 464
    Top = 376
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'CODIGOALUNO'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'TURMA'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'ANOSEMESTRE'
        ParamType = ptUnknown
      end>
  end
  object qryUpdFreqA: TUMZQuery
    Connection = db
    SQL.Strings = (
      'UPDATE'
      '   fichaindividual fia'
      '   INNER JOIN ('
      '      SELECT'
      '         fi.codigoaluno,'
      '         fi.anosemestre,'
      '         fi.turma,'
      '         fi.disciplina,'
      '         fi.serie,'
      
        '         LENGTH(REPLACE(REPLACE(REPLACE(REPLACE(GROUP_CONCAT(COA' +
        'LESCE(daa.ds_freq, '#39#39')), '#39','#39', '#39#39'), '#39'C'#39', '#39#39'), '#39'P'#39', '#39#39'), '#39'-'#39', '#39#39'))' +
        ' nr_faltas,'
      '         SUM(da.qtd_aulas) qtd_aulas,'
      
        '         CASE WHEN SUM(da.qtd_aulas) = SUM(LENGTH(TRIM(daa.ds_fr' +
        'eq))) THEN 1 ELSE 0 END sn_calcular_frequencia'
      '      FROM'
      '         diario_aulas_alunos daa'
      '         INNER JOIN diario_aulas da ON ('
      '            da.anosemestre = daa.nr_anosem AND'
      '            da.turma = daa.cd_turma AND'
      '            da.disciplina = daa.cd_disciplina AND'
      '            da.bimestre = daa.cd_bimestre AND'
      '            da.nro_aula = daa.nr_aula'
      '         )'
      '         INNER JOIN fichaindividual fi ON ('
      '            fi.codigoaluno = daa.cd_pessoa AND'
      '            fi.anosemestre = da.anosemestre AND'
      '            fi.turma = da.turma AND'
      '            fi.disciplina = da.disciplina'
      '         )'
      '      WHERE'
      '         fi.sn_bloq_freq_global = 0 AND'
      '         fi.turma = :turma AND'
      '         fi.anosemestre = :anosemestre AND'
      '         fi.codigoaluno = :codigoaluno AND'
      '         daa.ds_freq IS NOT NULL AND'
      '         da.data <= NOW()'
      '      GROUP BY'
      '         fi.anosemestre, fi.turma, fi.disciplina, fi.codigoaluno'
      '   ) fic ON ('
      '      fia.anosemestre = fic.anosemestre AND'
      '      fia.turma = fic.turma AND'
      '      fia.disciplina = fic.disciplina AND'
      '      fia.serie = fic.serie AND'
      '      fia.codigoaluno = fic.codigoaluno'
      '   )'
      'SET'
      
        '   fia.frequencia = CASE WHEN fic.sn_calcular_frequencia = 0 THE' +
        'N NULL'
      
        '                         WHEN fia.sn_bloq_freq_global = 0 THEN R' +
        'OUND(100 - ((fic.nr_faltas*100)/fic.qtd_aulas), COALESCE(:nr_cas' +
        'as_decimais_frequencia, 0))'
      '                         ELSE fia.frequencia'
      '                    END,'
      '   fia.totalfaltas = fic.nr_faltas'
      '')
    Params = <
      item
        DataType = ftUnknown
        Name = 'turma'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'anosemestre'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'codigoaluno'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'nr_casas_decimais_frequencia'
        ParamType = ptUnknown
      end>
    Left = 464
    Top = 432
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'turma'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'anosemestre'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'codigoaluno'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'nr_casas_decimais_frequencia'
        ParamType = ptUnknown
      end>
  end
  object qryDelRemDados: TUMZQuery
    Connection = db
    Params = <>
    SQLList.Strings = (
      
        'oracle=DELETE FROM REM_DADOS D'#13#10'WHERE EXISTS ('#13#10'   SELECT'#13#10'     ' +
        ' O.CD_OCORRENCIA'#13#10'   FROM'#13#10'      REM_OCORRENCIAS O'#13#10'   WHERE'#13#10'  ' +
        '    D.CD_OCORRENCIA = O.CD_OCORRENCIA AND'#13#10'      D.CD_LAYOUT = O' +
        '.CD_LAYOUT AND'#13#10'      D.CD_MENSALIDADE = :CD_MENSALIDADE AND'#13#10'  ' +
        '    D.SN_ENVIADO = :SN_ENVIADO AND'#13#10'      O.CD_ACAO = :CD_ACAO'
      
        'mysql-5=DELETE D.*'#13#10'FROM REM_DADOS D'#13#10'JOIN REM_OCORRENCIAS O ON'#13 +
        #10'   (D.CD_OCORRENCIA = O.CD_OCORRENCIA) AND'#13#10'   (D.CD_LAYOUT = O' +
        '.CD_LAYOUT)'#13#10'WHERE'#13#10'   D.CD_MENSALIDADE = :CD_MENSALIDADE AND'#13#10' ' +
        '  D.SN_ENVIADO = :SN_ENVIADO AND'#13#10'   O.CD_ACAO = :CD_ACAO')
    Left = 800
    Top = 568
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
    Left = 800
    Top = 624
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
  object qryColigadas: TUMZQuery
    Connection = db
    SQL.Strings = (
      'SELECT CD_COLIGADA, NM_COLIGADA FROM COLIGADAS')
    Params = <>
    Left = 920
    Top = 522
    object qryColigadasCD_COLIGADA: TIntegerField
      FieldName = 'CD_COLIGADA'
    end
    object qryColigadasNM_COLIGADA: TStringField
      FieldName = 'NM_COLIGADA'
      Size = 100
    end
  end
  object qryColigadasTodas: TUMZQuery
    Connection = db
    SQL.Strings = (
      'SELECT CAST(0 AS SIGNED)  AS CD_COLIGADA,'
      '"Todas as Unidades de Ensino" AS NM_COLIGADA')
    Params = <>
    Left = 920
    Top = 578
  end
  object qyTurmasProfessores: TUMZQuery
    Connection = db
    SQL.Strings = (
      'SELECT'
      #9'anosemestre, curso, turma, disciplina, professor'
      'FROM'
      #9'turmasprofessores'
      'WHERE'
      #9'anosemestre = :anosemestre')
    Params = <
      item
        DataType = ftUnknown
        Name = 'anosemestre'
        ParamType = ptUnknown
      end>
    Left = 920
    Top = 642
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'anosemestre'
        ParamType = ptUnknown
      end>
    object qyTurmasProfessoresanosemestre: TSmallintField
      FieldName = 'anosemestre'
      Required = True
    end
    object qyTurmasProfessorescurso: TStringField
      FieldName = 'curso'
      Required = True
      Size = 15
    end
    object qyTurmasProfessoresturma: TStringField
      FieldName = 'turma'
      Required = True
      Size = 50
    end
    object qyTurmasProfessoresdisciplina: TIntegerField
      FieldName = 'disciplina'
      Required = True
    end
    object qyTurmasProfessoresprofessor: TIntegerField
      FieldName = 'professor'
      Required = True
    end
  end
  object SQLMonitor: TZSQLMonitor
    MaxTraceCount = 100
    OnLogTrace = SQLMonitorLogTrace
    Left = 16
    Top = 208
  end
  object qyValidaQtdAvaliacoes: TUMZQuery
    Connection = db
    SQL.Strings = (
      
        'SELECT  DIA_VALIDA_QTD_AVALIACOES(:cd_curso, :cd_turma, :nr_anos' +
        'emestre, :cd_disciplina, :nr_etapa, :cd_grupo) mensagem_retorno')
    Params = <
      item
        DataType = ftUnknown
        Name = 'cd_curso'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'cd_turma'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'nr_anosemestre'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'cd_disciplina'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'nr_etapa'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'cd_grupo'
        ParamType = ptUnknown
      end>
    Left = 936
    Top = 304
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'cd_curso'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'cd_turma'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'nr_anosemestre'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'cd_disciplina'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'nr_etapa'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'cd_grupo'
        ParamType = ptUnknown
      end>
    object qyValidaQtdAvaliacoesmensagem_retorno: TMemoField
      FieldName = 'mensagem_retorno'
      BlobType = ftMemo
    end
  end
  object qyVerificaNotasLancada: TUMZQuery
    Connection = db
    SQL.Strings = (
      
        'SELECT  DIA_VERIFICA_NOTAS_LANCADAS(:cd_curso, :cd_turma, :nr_an' +
        'osemestre, :cd_disciplina, :nr_etapa, :cd_grupo, :cd_pessoa) ret' +
        'orno')
    Params = <
      item
        DataType = ftUnknown
        Name = 'cd_curso'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'cd_turma'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'nr_anosemestre'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'cd_disciplina'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'nr_etapa'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'cd_grupo'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'cd_pessoa'
        ParamType = ptUnknown
      end>
    Left = 936
    Top = 352
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'cd_curso'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'cd_turma'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'nr_anosemestre'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'cd_disciplina'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'nr_etapa'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'cd_grupo'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'cd_pessoa'
        ParamType = ptUnknown
      end>
    object qyVerificaNotasLancadaretorno: TSmallintField
      FieldName = 'retorno'
    end
  end
  object qryMensaNegociacao: TUMZQuery
    Connection = db
    OnCalcFields = tblMensalidadesCalcFields
    SQL.Strings = (
      'select * from Mensalidades'
      'WHERE'
      'cd_mensalidade =:cd_mensalidade')
    Params = <
      item
        DataType = ftUnknown
        Name = 'cd_mensalidade'
        ParamType = ptUnknown
      end>
    Left = 680
    Top = 248
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'cd_mensalidade'
        ParamType = ptUnknown
      end>
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
    Left = 16
    Top = 64
  end
  object qyVerificaPermissaoLite: TUMZQuery
    Connection = db
    SQL.Strings = (
      'SELECT'
      #9'NMA.*,'
      #9'nm.ds_chave AS chave'
      'FROM'
      #9'NU_MODULOS_ACOES AS NMA'
      'INNER JOIN nu_modulos AS nm ON (nm.cd_modulo = NMA.cd_modulo)')
    Params = <>
    Left = 608
    Top = 16
  end
  object StartConnDocs: TUMZStartConnection
    DefaultConnection = StartConnDocsDefaultConnection
    IniProps.SectionName = 'Conexao.docs'
    IniProps.ProtocolIdent = 'Protocolo'
    IniProps.HostNameIdent = 'Servidor'
    IniProps.PortIdent = 'Porta'
    IniProps.DatabaseIdent = 'Banco'
    IniProps.StartDatabaseIdent = 'Start.Banco'
    IniProps.UserIdent = 'Usuario'
    IniProps.PasswordIdent = 'Senha'
    IniProps.ClientKeyIdent = 'Chave'
    Connection = dbDocs
    UnimestreUser = 'umsistema'
    Left = 16
    Top = 160
  end
  object qyStoredProc: TUMZQuery
    Connection = db
    Params = <>
    Left = 464
    Top = 570
  end
  object qryPreRequisitoEspecial: TUMZQuery
    Connection = db
    SQL.Strings = (
      'SELECT'
      '  t.ds_tipo_req,'
      '  t.me_tipo_sql'
      'FROM'
      #9'disciplinas_prereq_especial p'
      
        #9'INNER JOIN disciplinas_tipos_req t ON (t.cd_tipo_req = p.cd_tip' +
        'o_req)'
      'WHERE'
      #9'p.cd_curso = :CD_CURSO AND'
      #9'p.cd_grade = :CD_GRADE AND'
      #9'p.cd_disciplina = :CD_DISCIPLINA')
    Params = <
      item
        DataType = ftUnknown
        Name = 'CD_CURSO'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'CD_GRADE'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'CD_DISCIPLINA'
        ParamType = ptUnknown
      end>
    Left = 848
    Top = 400
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'CD_CURSO'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'CD_GRADE'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'CD_DISCIPLINA'
        ParamType = ptUnknown
      end>
    object qryPreRequisitoEspecialds_tipo_req: TStringField
      FieldName = 'ds_tipo_req'
      Size = 100
    end
    object qryPreRequisitoEspecialme_tipo_sql: TMemoField
      FieldName = 'me_tipo_sql'
      BlobType = ftMemo
    end
  end
  object tblFeriadosMatriz: TUMZQuery
    Connection = db
    SQL.Strings = (
      'SELECT'
      '   COUNT(*)'
      'FROM'
      '   CALENDARIO ca'
      'INNER JOIN coligadas c on (c.cd_coligada = ca.cd_coligada)'
      
        'INNER JOIN coligadas_matriz cm on(c.CD_COLIGADA_MATRIZ = CM.cd_c' +
        'oligada)'
      'WHERE'
      '   ca.nr_dia = :DIA AND'
      '   ca.nr_mes = :MES AND'
      '   ca.nr_ano = :ANO AND'
      '   ca.sn_financeiro = '#39'N'#39' AND'
      '   cm.cd_coligada  = :COLIGADA'
      'GROUP BY nr_dia,nr_mes,nr_ano'
      'HAVING'
      
        '   COUNT(ca.cd_coligada) = (SELECT COUNT(*) FROM coligadas WHERE' +
        ' CD_COLIGADA_MATRIZ = :COLIGADA)')
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
      end
      item
        DataType = ftUnknown
        Name = 'COLIGADA'
        ParamType = ptUnknown
      end>
    Left = 88
    Top = 56
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
      end
      item
        DataType = ftUnknown
        Name = 'COLIGADA'
        ParamType = ptUnknown
      end>
  end
  object TTempoOcioso: TTimer
    OnTimer = TTempoOciosoTimer
    Left = 16
    Top = 264
  end
  object tblAvaliacaoDisciplina: TUMZQuery
    Connection = db
    SQL.Strings = (
      'SELECT'
      #9'apm.*, '
      #9't.codigo, '
      #9't.anosemestre, '
      #9'gd.cd_disciplina,'
      #9'p.ds_periodo_abreviado, '
      #9'p.ds_periodicidade'
      'FROM'
      #9'turmas t'
      
        #9'INNER JOIN grades_disciplinas gd ON (gd.cd_curso = t.curso AND ' +
        'gd.cd_grade = t.cd_grade AND gd.nr_serie = t.serie)'
      
        #9'INNER JOIN avaliacoes_parametros_matriz apm ON (apm.cd_avaliaca' +
        'o = COALESCE(gd.cd_avaliacao, t.cd_avaliacao))'
      
        #9'INNER JOIN cursos_periodos_avaliacoes p ON (p.cd_periodo_avalia' +
        'cao = apm.cd_periodo_avaliacao)'
      'WHERE'
      #9't.anosemestre = :nr_anosemestre AND'
      #9't.codigo = :cd_turma AND'
      #9'gd.cd_disciplina = :cd_disciplina')
    Params = <
      item
        DataType = ftUnknown
        Name = 'nr_anosemestre'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'cd_turma'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'cd_disciplina'
        ParamType = ptUnknown
      end>
    Left = 464
    Top = 614
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'nr_anosemestre'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'cd_turma'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'cd_disciplina'
        ParamType = ptUnknown
      end>
    object SmallintField3: TSmallintField
      FieldName = 'cd_avaliacao'
      Origin = 'WMESTRE12.avaliacoes_parametros.cd_avaliacao'
    end
    object StringField1: TStringField
      FieldName = 'ds_avaliacao'
      Origin = 'WMESTRE12.avaliacoes_parametros.ds_avaliacao'
      Size = 100
    end
    object SmallintField4: TSmallintField
      FieldName = 'nr_avaliacoes'
      Origin = 'WMESTRE12.avaliacoes_parametros.nr_avaliacoes'
    end
    object SmallintField5: TSmallintField
      FieldName = 'cd_periodo_avaliacao'
      Origin = 'WMESTRE12.avaliacoes_parametros.cd_periodo_avaliacao'
    end
    object StringField2: TStringField
      FieldName = 'ds_cond_aprov_direta'
      Origin = 'WMESTRE12.avaliacoes_parametros.ds_cond_aprov_direta'
      Size = 250
    end
    object StringField4: TStringField
      FieldName = 'ds_cond_repro_direta'
      Origin = 'WMESTRE12.avaliacoes_parametros.ds_cond_repro_direta'
      Size = 250
    end
    object StringField5: TStringField
      FieldName = 'ds_formula_media_exame'
      Origin = 'WMESTRE12.avaliacoes_parametros.ds_formula_media_exame'
      Size = 250
    end
    object StringField6: TStringField
      FieldName = 'ds_formula_media_segunda'
      Origin = 'WMESTRE12.avaliacoes_parametros.ds_formula_media_segunda'
      Size = 250
    end
    object StringField7: TStringField
      FieldName = 'ds_cond_aprov_exame'
      Origin = 'WMESTRE12.avaliacoes_parametros.ds_cond_aprov_exame'
      Size = 250
    end
    object StringField8: TStringField
      FieldName = 'ds_cond_aprov_segunda'
      Origin = 'WMESTRE12.avaliacoes_parametros.ds_cond_aprov_segunda'
      Size = 250
    end
    object SmallintField6: TSmallintField
      FieldName = 'nr_max_disci_exame'
      Origin = 'WMESTRE12.avaliacoes_parametros.nr_max_disci_exame'
    end
    object SmallintField7: TSmallintField
      FieldName = 'nr_max_disci_segunda'
      Origin = 'WMESTRE12.avaliacoes_parametros.nr_max_disci_segunda'
    end
    object StringField9: TStringField
      FieldName = 'sn_notas'
      Origin = 'WMESTRE12.avaliacoes_parametros.sn_notas'
      FixedChar = True
      Size = 3
    end
    object StringField10: TStringField
      FieldName = 'sn_conceitos'
      Origin = 'WMESTRE12.avaliacoes_parametros.sn_conceitos'
      FixedChar = True
      Size = 3
    end
    object StringField11: TStringField
      FieldName = 'sn_descricao'
      Origin = 'WMESTRE12.avaliacoes_parametros.sn_descricao'
      FixedChar = True
      Size = 3
    end
    object StringField12: TStringField
      FieldName = 'sn_exame'
      Origin = 'WMESTRE12.avaliacoes_parametros.sn_exame'
      FixedChar = True
      Size = 3
    end
    object StringField13: TStringField
      FieldName = 'sn_pi'
      Origin = 'WMESTRE12.avaliacoes_parametros.sn_pi'
      FixedChar = True
      Size = 3
    end
    object StringField14: TStringField
      FieldName = 'sn_segunda_epoca'
      Origin = 'WMESTRE12.avaliacoes_parametros.sn_segunda_epoca'
      FixedChar = True
      Size = 3
    end
    object StringField15: TStringField
      FieldName = 'sn_frequencia_global'
      Origin = 'WMESTRE12.avaliacoes_parametros.sn_frequencia_global'
      FixedChar = True
      Size = 1
    end
    object StringField16: TStringField
      FieldName = 'ds_frequencia_tipo'
      Origin = 'WMESTRE12.avaliacoes_parametros.ds_frequencia_tipo'
      FixedChar = True
      Size = 1
    end
    object StringField17: TStringField
      FieldName = 'sn_recuperacao'
      Origin = 'WMESTRE12.avaliacoes_parametros.sn_recuperacao'
      FixedChar = True
      Size = 1
    end
    object StringField18: TStringField
      FieldName = 'ds_formula_recuperacao'
      Origin = 'WMESTRE12.avaliacoes_parametros.ds_formula_recuperacao'
      Size = 250
    end
    object StringField19: TStringField
      FieldName = 'codigo'
      Origin = 'WMESTRE12.turmas.codigo'
      Size = 15
    end
    object SmallintField8: TSmallintField
      FieldName = 'anosemestre'
      Origin = 'WMESTRE12.turmas.anosemestre'
    end
    object StringField20: TStringField
      FieldName = 'ds_formula_media_final'
      Origin = 'WMESTRE12.avaliacoes_parametros.ds_formula_media_final'
      Size = 250
    end
    object SmallintField9: TSmallintField
      FieldName = 'nr_casas_decimais'
      Origin = 'WMESTRE12.avaliacoes_parametros.nr_casas_decimais'
    end
    object StringField21: TStringField
      FieldName = 'ds_cond_recuperacao'
      Origin = 'WMESTRE12.avaliacoes_parametros.ds_cond_recuperacao'
      Size = 250
    end
    object FloatField1: TFloatField
      FieldName = 'vl_arredondamento'
      Origin = 'WMESTRE12.avaliacoes_parametros.vl_arredondamento'
    end
    object StringField22: TStringField
      FieldName = 'ds_periodo_abreviado'
      Origin = 'WMESTRE12.cursos_periodos_avaliacoes.ds_periodo_abreviado'
      Size = 10
    end
    object StringField23: TStringField
      FieldName = 'ds_periodicidade'
      Origin = 'WMESTRE12.cursos_periodos_avaliacoes.ds_periodicidade'
    end
    object MemoField1: TMemoField
      FieldName = 'ds_formula_media_anual'
      Origin = 'WMESTRE12.avaliacoes_parametros.ds_formula_media_anual'
      BlobType = ftMemo
      Size = 1
    end
    object StringField24: TStringField
      FieldName = 'sn_notas_diario_online'
      Origin = 'WMESTRE12.avaliacoes_parametros.sn_notas_diario_online'
      FixedChar = True
      Size = 1
    end
    object StringField25: TStringField
      FieldName = 'sn_notas_diario'
      Origin = 'WMESTRE12.avaliacoes_parametros.sn_notas_diario'
      FixedChar = True
      Size = 1
    end
    object StringField26: TStringField
      FieldName = 'sn_desblo_coorde'
      Origin = 'WMESTRE12.avaliacoes_parametros.sn_desblo_coorde'
      FixedChar = True
      Size = 1
    end
    object StringField27: TStringField
      FieldName = 'sn_diario_imp_notas'
      Origin = 'WMESTRE12.avaliacoes_parametros.sn_diario_imp_notas'
      FixedChar = True
      Size = 1
    end
    object StringField28: TStringField
      FieldName = 'sn_diario_imp_freqs'
      Origin = 'WMESTRE12.avaliacoes_parametros.sn_diario_imp_freqs'
      FixedChar = True
      Size = 1
    end
    object StringField29: TStringField
      FieldName = 'sn_notas_truncar'
      Origin = 'WMESTRE12.avaliacoes_parametros.sn_notas_truncar'
      FixedChar = True
      Size = 1
    end
    object StringField30: TStringField
      FieldName = 'sn_diario_imp_contprog'
      Origin = 'WMESTRE12.avaliacoes_parametros.sn_diario_imp_contprog'
      FixedChar = True
      Size = 1
    end
    object StringField31: TStringField
      FieldName = 'ds_nota_exame'
      Origin = 'WMESTRE12.avaliacoes_parametros.ds_nota_exame'
      Size = 255
    end
    object StringField32: TStringField
      FieldName = 'ds_nota_segunda'
      Origin = 'WMESTRE12.avaliacoes_parametros.ds_nota_segunda'
      Size = 255
    end
    object StringField33: TStringField
      FieldName = 'sn_medias_truncar'
      Origin = 'WMESTRE12.avaliacoes_parametros.sn_medias_truncar'
      FixedChar = True
      Size = 1
    end
    object StringField34: TStringField
      FieldName = 'sn_anual_truncar'
      Origin = 'WMESTRE12.avaliacoes_parametros.sn_anual_truncar'
      FixedChar = True
      Size = 1
    end
    object SmallintField10: TSmallintField
      FieldName = 'sn_diario_online'
      Origin = 'WMESTRE12.avaliacoes_parametros.sn_diario_online'
    end
    object IntegerField1: TIntegerField
      FieldName = 'sn_diario_eletro'
      Origin = 'WMESTRE12.avaliacoes_parametros.sn_diario_eletro'
    end
    object SmallintField11: TSmallintField
      FieldName = 'sn_diario_online_provas'
      Origin = 'WMESTRE12.avaliacoes_parametros.sn_diario_online_provas'
    end
    object SmallintField12: TSmallintField
      FieldName = 'sn_diario_online_aulas'
      Origin = 'WMESTRE12.avaliacoes_parametros.sn_diario_online_aulas'
    end
    object SmallintField13: TSmallintField
      FieldName = 'sn_diario_online_recalc_medias'
      Origin = 'WMESTRE12.avaliacoes_parametros.sn_diario_online_recalc_medias'
    end
    object IntegerField2: TIntegerField
      FieldName = 'sn_diario_online_bloque_aulas'
      Origin = 'WMESTRE12.avaliacoes_parametros.sn_diario_online_bloque_aulas'
    end
    object IntegerField3: TIntegerField
      FieldName = 'sn_diario_online_bloque_provas'
      Origin = 'WMESTRE12.avaliacoes_parametros.sn_diario_online_bloque_provas'
    end
    object IntegerField4: TIntegerField
      FieldName = 'nr_casas_decimais_forcado'
      Origin = 'WMESTRE12.avaliacoes_parametros.nr_casas_decimais_forcado'
    end
    object IntegerField5: TIntegerField
      FieldName = 'sn_altera_notas_direta'
      Origin = 'WMESTRE12.avaliacoes_parametros.sn_altera_notas_direta'
    end
    object IntegerField6: TIntegerField
      FieldName = 'sn_converter_notas_nulas'
      Origin = 'WMESTRE12.avaliacoes_parametros.sn_converter_notas_nulas'
    end
    object IntegerField7: TIntegerField
      FieldName = 'NR_CASAS_FORCADO_MEDIA'
    end
    object SmallintField14: TSmallintField
      FieldName = 'sn_copiar_conteudo_pordata'
      Origin = 'WMESTRE12.avaliacoes_parametros.sn_copiar_conteudo_pordata'
    end
    object SmallintField15: TSmallintField
      FieldName = 'sn_ajuste_apos_recuperacao'
      Origin = 'WMESTRE12.avaliacoes_parametros.sn_ajuste_apos_recuperacao'
    end
    object SmallintField16: TSmallintField
      FieldName = 'tp_ajuste_forcado'
      Origin = 'WMESTRE12.avaliacoes_parametros.tp_ajuste_forcado'
    end
    object SmallintField17: TSmallintField
      FieldName = 'tp_ajuste_forcado_media'
      Origin = 'WMESTRE12.avaliacoes_parametros.tp_ajuste_forcado_media'
    end
    object SmallintField18: TSmallintField
      FieldName = 'sn_mostrar_alunos_curs_padrao'
      Origin = 'WMESTRE12.avaliacoes_parametros.sn_mostrar_alunos_curs_padrao'
    end
    object SmallintField19: TSmallintField
      FieldName = 'sn_ins_aulas_semhorario'
      Origin = 'WMESTRE12.avaliacoes_parametros.sn_ins_aulas_semhorario'
    end
    object StringField35: TStringField
      FieldName = 'ds_formula_padrao'
      Origin = 'WMESTRE12.avaliacoes_parametros.ds_formula_padrao'
      Size = 255
    end
    object SmallintField20: TSmallintField
      FieldName = 'sn_obrigar_formula_padrao'
      Origin = 'WMESTRE12.avaliacoes_parametros.sn_obrigar_formula_padrao'
    end
    object StringField36: TStringField
      FieldName = 'ds_formula_media_sem_pi'
      Origin = 'WMESTRE12.avaliacoes_parametros.ds_formula_media_sem_pi'
      Size = 250
    end
    object StringField37: TStringField
      FieldName = 'ds_criterio_recuperacao'
      Origin = 'WMESTRE12.avaliacoes_parametros.ds_criterio_recuperacao'
      Size = 100
    end
    object StringField38: TStringField
      FieldName = 'ds_formula_periodo'
      Origin = 'WMESTRE12.avaliacoes_parametros.ds_formula_periodo'
      Size = 255
    end
    object SmallintField21: TSmallintField
      FieldName = 'sn_diario_online_mostra_ajuste'
      Origin = 'WMESTRE12.avaliacoes_parametros.sn_diario_online_mostra_ajuste'
    end
    object StringField39: TStringField
      FieldName = 'ds_condicao_situacao_periodo'
      Origin = 'WMESTRE12.avaliacoes_parametros.ds_condicao_situacao_periodo'
      Size = 255
    end
    object SmallintField22: TSmallintField
      FieldName = 'sn_usar_media_curso'
      Origin = 'WMESTRE12.avaliacoes_parametros.sn_usar_media_curso'
    end
    object StringField40: TStringField
      FieldName = 'ds_formula_media_curso'
      Origin = 'WMESTRE12.avaliacoes_parametros.ds_formula_media_curso'
      Size = 255
    end
    object MemoField2: TMemoField
      FieldName = 'ds_sigla'
      Origin = 'WMESTRE12.avaliacoes_parametros.ds_sigla'
      BlobType = ftMemo
      Size = 1
    end
    object SmallintField23: TSmallintField
      FieldName = 'sn_extra_classe'
      Origin = 'WMESTRE12.avaliacoes_parametros.sn_extra_classe'
    end
    object StringField41: TStringField
      FieldName = 'sn_descricao_fixa'
      Origin = 'WMESTRE12.avaliacoes_parametros.sn_descricao_fixa'
      FixedChar = True
      Size = 1
    end
    object SmallintField24: TSmallintField
      FieldName = 'sn_freque_pergunta'
      Origin = 'WMESTRE12.avaliacoes_parametros.sn_freque_pergunta'
    end
    object SmallintField25: TSmallintField
      FieldName = 'sn_freque_pergunta_padrao'
      Origin = 'WMESTRE12.avaliacoes_parametros.sn_freque_pergunta_padrao'
    end
    object SmallintField26: TSmallintField
      FieldName = 'sn_professor_fecha_diario'
      Origin = 'WMESTRE12.avaliacoes_parametros.sn_professor_fecha_diario'
    end
    object StringField42: TStringField
      FieldName = 'sn_profes_digita_peso'
      Origin = 'WMESTRE12.avaliacoes_parametros.sn_profes_digita_peso'
      FixedChar = True
      Size = 50
    end
    object SmallintField27: TSmallintField
      FieldName = 'nr_qtd_aulas_impressao'
      Origin = 'WMESTRE12.avaliacoes_parametros.nr_qtd_aulas_impressao'
    end
    object StringField43: TStringField
      FieldName = 'ds_formula_pi'
      Origin = 'WMESTRE12.avaliacoes_parametros.ds_formula_pi'
      Size = 250
    end
    object IntegerField8: TIntegerField
      FieldName = 'cd_situacao_aprov_direta'
      Origin = 'WMESTRE12.avaliacoes_parametros.cd_situacao_aprov_direta'
    end
    object IntegerField9: TIntegerField
      FieldName = 'cd_situacao_aprov_exame'
      Origin = 'WMESTRE12.avaliacoes_parametros.cd_situacao_aprov_exame'
    end
    object IntegerField10: TIntegerField
      FieldName = 'cd_situacao_aprov_2epoca'
      Origin = 'WMESTRE12.avaliacoes_parametros.cd_situacao_aprov_2epoca'
    end
    object FloatField2: TFloatField
      FieldName = 'nr_media_proficiencia'
      Origin = 'WMESTRE12.avaliacoes_parametros.nr_media_proficiencia'
    end
    object SmallintField28: TSmallintField
      FieldName = 'SN_GERAR_TAXA_RECORRENCIA'
    end
    object SmallintField29: TSmallintField
      FieldName = 'sn_falta_exame_forca_2epoca'
      Origin = 'WMESTRE12.avaliacoes_parametros.sn_falta_exame_forca_2epoca'
    end
    object LargeintField1: TLargeintField
      FieldName = 'cd_disci_frequencia'
    end
    object LargeintField2: TLargeintField
      FieldName = 'nr_maximo_aulas'
      Required = True
    end
    object LargeintField3: TLargeintField
      FieldName = 'nr_periodos'
      Required = True
    end
    object LargeintField4: TLargeintField
      FieldName = 'cd_situacao_concluida'
    end
    object LargeintField5: TLargeintField
      FieldName = 'nr_inicio_aulas_extras'
    end
    object LargeintField6: TLargeintField
      FieldName = 'nr_dias_diario_bloq_provas'
    end
    object StringField44: TStringField
      FieldName = 'sn_conceitos_parciais'
      Size = 3
    end
    object SmallintField30: TSmallintField
      FieldName = 'nr_casas_decimais_frequencia'
    end
    object IntegerField11: TIntegerField
      FieldName = 'sn_diario_online_bloque_cont'
      Origin = 'WMESTRE12.avaliacoes_parametros.sn_diario_online_cont'
    end
  end
  object qryUpdateMultas: TUMZQuery
    Connection = db
    SQL.Strings = (
      'UPDATE'
      '  bib_multas AS bm'
      'INNER JOIN mensalidades m ON ('
      #9'bm.cd_mensalidade = m.cd_mensalidade'
      ')'
      'INNER JOIN bib_emprestimos be ON('
      '  bm.cd_emprestimo = be.cd_emprestimo'
      ')'
      'LEFT JOIN bib_multas AS bm2 ON('
      '  bm.cd_mensalidade = bm2.cd_mensalidade AND'
      '  bm.cd_multa <> bm2.cd_multa AND'
      '  bm2.cd_multa IS NULL'
      ')'
      
        'LEFT JOIN bib_emprestimos be2 ON(bm2.cd_emprestimo = be2.cd_empr' +
        'estimo AND be.cd_pessoa <> be2.cd_pessoa)'
      'SET '
      '   bm.db_valor = m.valorbruto,'
      '   bm.cd_situacao = '
      '      CASE m.situacao '
      '         WHEN 0 THEN 4 '
      '         WHEN 1 THEN 8 '
      '         WHEN 2 THEN 1 '
      '         WHEN 3 THEN 12 '
      '         WHEN 4 THEN 9 '
      '         WHEN 5 THEN 9 '
      '         WHEN 6 THEN 9 '
      '         WHEN 7 THEN 9 '
      '         ELSE 1 '
      '      END,'
      
        '   bm.db_valor_pago = IF(bm.cd_situacao = 12, NULL, m.valorpago)' +
        ','
      
        '   bm.dt_pagamento = IF(bm.cd_situacao = 12, NULL, m.datapagamen' +
        'to),'
      '   bm.cd_usuario_pagamento = m.cd_usuario '
      'WHERE bm.cd_multa = :cd_multa')
    Params = <
      item
        DataType = ftUnknown
        Name = 'cd_multa'
        ParamType = ptUnknown
      end>
    Left = 800
    Top = 512
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'cd_multa'
        ParamType = ptUnknown
      end>
  end
  object tiRemessa: TTrayIcon
    Animate = True
    Hint = 
      'O gerador autom'#225'tico de remessa banc'#225'ria do Unimestre est'#225' habil' +
      'itado.'
    BalloonHint = 
      'O gerador autom'#225'tico de remessa banc'#225'ria do Unimestre est'#225' habil' +
      'itado.'
    BalloonTitle = 'Remessa'
    BalloonFlags = bfInfo
    Icon.Data = {
      0000010001002020000001001800A80C00001600000028000000200000004000
      00000100180000000000800C0000000000000000000000000000000000000000
      00000000000000C3A0A88E4B5975213370192C71192C71192C71192C71192C71
      192C71192C71192C71192C71192C71192C71192C71192C71192C71192C71192C
      71192C71192C71192C70192C7521338E4B59C3A0A80000000000000000000000
      000000008C47566E1628564E475552485552485551486232376E16296F16296F
      1629642D355552485552485552485550486D16296F16296F16296F16296F1629
      6726314C65524A6B565E3C3D6E16286F16296E16298C47560000000000000000
      008C47566E16296E162837976D26C28526C28526C2853D87656E16286F16296F
      16295F373A25C18526C28526C28525C2855F383B6F16296F16296F16296B1D2C
      2EAD7925C28425C28425C1843C8A6669202E6F16296E16298C4756000000C3A0
      A86E16296F16296E16294C655325C28526C28526C2852AB67E6D18296F16296F
      16296D16292CB17B26C28526C28525C284496B566E15296F16296F16295F373A
      25C28526C28526C28526C28527BD82349E716A1D2C6F16296E1629C3A0A88E4A
      596F16296F16296F162961333825C18426C28526C28525C2855D3C3D6F16296F
      16296E152840816126C28526C28526C285349E716E16286F16296F162968222F
      26C18426C28526C28525C28452574B496C564081616E16286F16298E4B597521
      336F16296F16296F16296E16282EAC7926C28526C28525C284496D576E16296F
      16296F162955504725C18526C28526C28526C0846626316F16296F16296E1628
      31A37426C28526C28526C28544785D6E16283D89655F373A6F16297521337019
      2C6F16296F16296F16296E1628437B5E25C28526C28526C28533A0726E16286F
      16296F162969212E26BF8326C28526C28525C2844F5D4E6E16296F16296E1628
      46725A25C28426C28526C2852FA9776E16286C1B2B6E16286F162970192C7119
      2C6F16296F16296F16296F162958484325C28426C28526C28525C1845B413F6F
      16296F16296E162836996E26C28526C28526C285349D716E15286F16296F1629
      5B413F25C28426C28526C28525C1846231376F16296F16296F162971192C7119
      2C6F16296F16296F16296F16296B1C2B28BB8126C28526C28526C285359A6F6E
      16296F16296E15294B685425C28526C28526C28525C1845A43406E16296F1629
      6C192A2AB77F26C28526C28526C2844C64526E15296F16296F162971192C7119
      2C6F16296F16296F16296F16296E16283A906926C28526C28526C28525C28455
      50476E16296F162960373A25C18526C28526C28526C28532A4746C192A6F1629
      6E16283D896626C28526C28526C28536976D6E16296F16296F162971192C7119
      2C6F16296F16296F16296F16296E16294F5E4E25C28426C28526C28526BF8332
      A27369202E6F16296D16292CB07B26C28526C28526C2852CB07B4A6B566E1628
      6F162952574B25C28526C28526C28526BF8368212E6F16296F162971192C7119
      2C6F16296F16296F16296F16296F1629642C3425C18426C28526C28525C28445
      765B4082626E15286E162840806126C28526C28526C28531A4743C8C675F383A
      6F162966263126C08426C28526C28525C2845452486F16296F162971192C7119
      2C6F16296F16296F16296F16296F16296E152831A57526C28526C28525C28547
      71593F856353554A6E1628554F4725C28526C28526C28526C1845D3B3B359C70
      6A1F2D6E162833A07226C28526C28526C2853E85646E16296F162971192C7119
      2C6F16296F16296F16296F16296F16296E162845755B26C28526C28526C28531
      A47469212E30A7765C3F3E68212E26C08426C28526C28525C28452574B554F47
      3B8E686C192A46735A26C28426C28526C2852BB37C6E16296F162971192C7119
      2C6F16296F16296F16296F16296F16296F1629554F4625C28526C28526C28526
      C184642B345D3C3D2AB67E486D5727BD8226C28526C28526C285417E606E1528
      437A5E37976D39926B25C28526C28526C28525C184652A336F162971192C7119
      2C6F16296F16296F16296F16296E16286E1628505B4D25C18526C28526C28526
      C2844E5F4F6E152854514826C08326C28526C28526C28526C28539926B6E1629
      6C182A3A8E6925C28526C28526C28526C28525C2855F393B6F162971192C7119
      2C6F16296F16296F16296F16296D16283A906929BA8025C28525C28525C28526
      C28539926A6E15286E152853524828BC8126C28426C28525C2844772596F1628
      6F16296C1A2B3E886525C28426C28526C28529B87F691F2D6F162971192C7119
      2C6F16296F16296F16296F16296F16296E16286D1729642D35574B454A69553E
      876539926B6C18296F16296E152863303644785D38956C437A5D6A1E2D6F1629
      6F16296F16296E16285551483B8C683B8D685D3D3D6E16296F162971192C7119
      2C6F16296F16296F16296F16296F16296F16296F16296E16296F16296F16286E
      16296F16296E16286F16296F16296F16296E16296E16296F15296F16296F1629
      6F16296F16296F16296E16296E16296E16286E16296F16296F162971192C7119
      2C6F16296F16296F16296F1629711A2C965765B38790C19CA4C4A1A9C4A2A9C4
      A2A9C3A0A7BC949DA875808033446E16296F16296F16296B192D4753723D6285
      3E63853E63853E63853E63853D62854656756A1C306F16296F162971192C7119
      2C6F16296F16296F1629813444E8DBDEFEFEFFFEFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFEFFFFFCFBFBAB79836E16296E15282589B200C2F701C3F7
      01C3F701C3F701C3F701C3F701C3F700C3F71F93BF6E15286F162971192C7119
      2C6F16296F16296E1629CBACB3FFFFFFFEFEFEDAC6CAC5A3AAC29EA6C29FA6C2
      9EA6C3A0A7CFB2B8F6F1F2FFFFFFFAF8F87521336B172A03C0F401C3F801C3F8
      01C3F801C3F801C3F801C3F801C3F801C3F801C2F76720346F162971192C7119
      2C6F16296F16296F1629DECCD0FFFFFFD8C3C76E16296F16296F16296F16296F
      16296F16296E1629A7737EFFFFFFFFFFFF8337476B182C02C2F701C3F801C3F8
      01C3F801C3F801C3F801C3F801C3F801C3F801C3F86623386F162971192C7119
      2C6F16296F16296F1629DFCDD1FFFFFFD5BDC26F16296F16296F16296F16296F
      16296F16296F1629A56F7AFFFFFFFFFFFF8338486B192C02C2F701C3F801C3F8
      01C3F801C3F801C3F801C3F801C3F801C3F801C3F86623386F162971192C7119
      2C6F16296F16296F1629DFCDD1FFFFFFD5BDC26F16296F16296F16296F16296F
      16296F16296F1629A56F7AFFFFFFFFFFFF8338486B192C02C2F701C3F801C3F8
      01C3F801C3F801C3F801C3F801C3F801C3F801C3F86623386F162971192C7019
      2C6F16296F16296F1629DFCDD1FFFFFFD5BDC26F16296F16296F16296F16296F
      16296F16296F1629A56F7AFFFFFFFFFFFF8338486B192C02C2F701C3F801C3F8
      01C3F801C3F801C3F801C3F801C3F801C3F801C3F86623386F162970192C7521
      336F16296F16296F1629DFCDD1FFFFFFD5BDC26F16296F16296F16296F16296F
      16296F16296F1629A56F7AFFFFFFFFFFFF8338486B192C02C2F701C3F801C3F8
      01C3F801C3F801C3F801C3F801C3F801C3F801C3F86623386F16297521338E4A
      596F16296F16296F1629DFCDD1FFFFFFD5BDC26F16296F16296F16296F16296F
      16296F16296F1629A56F7AFFFFFFFFFFFF8338486B182B02C2F601C3F801C3F8
      01C3F801C3F801C3F801C3F801C3F801C3F801C2F76622376F16298E4B59C3A0
      A86E16296F16296E1629CDB2B8E9DDE0C5A4AB6F16296F16296F16296F16296F
      16296F16296F16299C626EE9DDE0E9DDE07F33436E1528189DCA00C3F701C3F8
      01C3F801C3F801C3F801C3F801C3F801C3F712A7D66D16296E1629C3A0A80000
      008C47566E16296E16296E16296F16296F16296F16296F16296F16296F16296F
      16296F16296F16296E16296F16296F16296F16296E162963263C31759B2885AE
      2885AE2885AE2885AE2885AE2785AE2F789E602A416E16298C47560000000000
      000000008C47566E16296F16296F16296F16296F16296F16296F16296F16296F
      16296F16296F16296F16296F16296F16296F16296F16296F16296F16296E1628
      6E16286E16286E16286E16286E16286E16286E16298C47560000000000000000
      00000000000000C3A0A88E4B5975213370192C71192C71192C71192C71192C71
      192C71192C71192C71192C71192C71192C71192C71192C71192C71192C71192C
      71192C71192C71192C70192C7521338E4B59C3A0A8000000000000000000E000
      0007C00000038000000100000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000080000001C0000003E0000007}
    Left = 16
    Top = 328
  end
  object qryBuscaHistorico: TUMZQuery
    Connection = db
    SQL.Strings = (
      'SELECT'
      '  ds_escola'
      'FROM'
      '  HISTORICO_ESCOLAS_SERIES'
      'WHERE'
      '  CODIGOALUNO = :CODIGOALUNO AND'
      '  GRAU = :GRAU AND'
      '  SERIE = :SERIE')
    Params = <
      item
        DataType = ftUnknown
        Name = 'CODIGOALUNO'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'GRAU'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'SERIE'
        ParamType = ptUnknown
      end>
    Left = 24
    Top = 568
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'CODIGOALUNO'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'GRAU'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'SERIE'
        ParamType = ptUnknown
      end>
    object qryBuscaHistoricods_escola: TStringField
      FieldName = 'ds_escola'
    end
  end
  object qryDeletaHistorico: TUMZQuery
    Connection = db
    SQL.Strings = (
      'DELETE'
      'FROM'
      '  HISTORICO_ESCOLAS_SERIES'
      'WHERE'
      '  CODIGOALUNO = :CODIGOALUNO AND'
      '  GRAU = :GRAU AND'
      '  SERIE = :SERIE  AND'
      '  (ds_escola = '#39#39' or ds_escola IS NULL)')
    Params = <
      item
        DataType = ftUnknown
        Name = 'CODIGOALUNO'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'GRAU'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'SERIE'
        ParamType = ptUnknown
      end>
    Left = 24
    Top = 616
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'CODIGOALUNO'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'GRAU'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'SERIE'
        ParamType = ptUnknown
      end>
  end
end
