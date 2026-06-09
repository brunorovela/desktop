object DMDiario: TDMDiario
  OldCreateOrder = False
  OnCreate = DataModuleCreate
  Height = 449
  Width = 526
  object qTurmas: TUMZQuery
    Connection = DM.db
    SQL.Strings = (
      'SELECT'
      '  DT.*,'
      '  P.NM_PESSOA AS NOME,'
      '  D.DESCRICAO,'
      '  C.DESCRICAO AS DSCURSO'
      'FROM'
      '  DIARIO_TURMAS DT,'
      '  PESSOAS P,'
      '  DISCIPLINAS D,'
      '  CURSOS C'
      'WHERE'
      '  DT.CURSO = D.CURSO AND'
      '  DT.DISCIPLINA = D.CODIGO AND'
      '  DT.PROFESSOR = P.CD_PESSOA AND'
      '  DT.CURSO = C.CODIGO AND'
      '  DT.ANOSEMESTRE = C.ANOSEMESTRE'
      'ORDER BY'
      '  DT.CURSO,'
      '  DT.TURMA,'
      '  D.DESCRICAO')
    Params = <>
    Left = 16
    Top = 128
    object qTurmasANOSEMESTRE: TSmallintField
      Tag = 1
      DisplayLabel = 'ANO/SEM.'
      DisplayWidth = 9
      FieldName = 'ANOSEMESTRE'
      DisplayFormat = '0000/0'
    end
    object qTurmasDISCIPLINA: TIntegerField
      Tag = 1
      DisplayLabel = 'COD. DISC.'
      FieldName = 'DISCIPLINA'
    end
    object qTurmasBIMESTRE: TSmallintField
      FieldName = 'BIMESTRE'
    end
    object qTurmasPROFESSOR: TIntegerField
      FieldName = 'PROFESSOR'
    end
    object qTurmasCURSO: TStringField
      Tag = 1
      DisplayWidth = 10
      FieldName = 'CURSO'
      Size = 15
    end
    object qTurmasDATAENTREGA: TDateTimeField
      FieldName = 'DATAENTREGA'
    end
    object qTurmasFormula_Media: TStringField
      FieldName = 'Formula_Media'
      Size = 200
    end
    object qTurmasDESCRICAO: TStringField
      Tag = 1
      DisplayLabel = 'DISCIPLINA'
      DisplayWidth = 38
      FieldName = 'DESCRICAO'
      Size = 255
    end
    object qTurmasTURMA: TStringField
      Tag = 1
      DisplayWidth = 20
      FieldName = 'TURMA'
      Size = 50
    end
    object qTurmasDSCURSO: TStringField
      FieldName = 'DSCURSO'
      Size = 50
    end
    object qTurmasNOME: TStringField
      Tag = 1
      DisplayWidth = 33
      FieldName = 'NOME'
      Size = 1000
    end
    object qTurmasCD_GRUPO: TIntegerField
      FieldName = 'CD_GRUPO'
    end
    object qTurmasGRUPO: TStringField
      Tag = 1
      DisplayWidth = 29
      FieldName = 'GRUPO'
      Size = 255
    end
  end
  object dsTurmas: TDataSource
    DataSet = qTurmas
    OnDataChange = dsTurmasDataChange
    Left = 64
    Top = 128
  end
  object qNotas: TUMZQuery
    Connection = DM.db
    BeforeOpen = qNotasBeforeOpen
    OnCalcFields = qNotasCalcFields
    UpdateObject = updNotas
    CachedUpdates = True
    BeforeInsert = qNotasBeforeInsert
    BeforePost = qNotasBeforePost
    AfterPost = qNotasAfterPost
    SQL.Strings = (
      'select'
      '   A.NM_PESSOA NOME,'
      '   M.NR_ALUNO, '
      '   DM.*,'
      '   FI.NOTA_D1,'
      '   FI.NOTA_D2,'
      '   FI.NOTA_D3,'
      '   FI.NOTA_D4,'
      '   FI.NOTA_D5,'
      '   FI.NOTA_D6,'
      '   FI.NOTA_D7,'
      '   FI.NOTA_D8,'
      '   FI.NOTA_D9,'
      '   FI.NOTA_D10'
      'from'
      
        '   DIARIO_MATRICULAS DM INNER JOIN FICHAINDIVIDUAL FI ON (FI.TUR' +
        'MA = DM.TURMA AND FI.DISCIPLINA = DM.DISCIPLINA AND FI.ANOSEMEST' +
        'RE = DM.ANOSEMESTRE AND FI.CODIGOALUNO = DM.CODALUNO)'
      '   INNER JOIN PESSOAS A ON (A.CD_PESSOA = DM.CODALUNO)'
      
        '   INNER JOIN MATRICULAS M ON (FI.CODIGOALUNO = M.CODIGOALUNO AN' +
        'D FI.TURMAMATRICULA = M.TURMA AND FI.ANOSEMESTRE = M.ANOSEMESTRE' +
        ')'
      'WHERE'
      '   DM.TURMA = :TURMA AND'
      '   DM.DISCIPLINA = :DISCIPLINA AND '
      '   BIMESTRE = :BIMESTRE AND '
      '   DM.ANOSEMESTRE = :ANOSEMESTRE'
      
        '   AND (FI.SITUACAO NOT IN (3,4,5,6,7,8,10) OR :MOSTRAR_TODOS = ' +
        '1)'
      'ORDER'
      '   BY A.NM_PESSOA')
    Params = <
      item
        DataType = ftString
        Name = 'TURMA'
        ParamType = ptUnknown
        Size = 16
      end
      item
        DataType = ftInteger
        Name = 'DISCIPLINA'
        ParamType = ptUnknown
        Size = 4
      end
      item
        DataType = ftSmallint
        Name = 'BIMESTRE'
        ParamType = ptUnknown
        Size = 2
      end
      item
        DataType = ftSmallint
        Name = 'ANOSEMESTRE'
        ParamType = ptUnknown
        Size = 2
      end
      item
        DataType = ftInteger
        Name = 'MOSTRAR_TODOS'
        ParamType = ptInput
        Value = '0'
      end>
    DataSource = dsTurmas
    Left = 16
    Top = 184
    ParamData = <
      item
        DataType = ftString
        Name = 'TURMA'
        ParamType = ptUnknown
        Size = 16
      end
      item
        DataType = ftInteger
        Name = 'DISCIPLINA'
        ParamType = ptUnknown
        Size = 4
      end
      item
        DataType = ftSmallint
        Name = 'BIMESTRE'
        ParamType = ptUnknown
        Size = 2
      end
      item
        DataType = ftSmallint
        Name = 'ANOSEMESTRE'
        ParamType = ptUnknown
        Size = 2
      end
      item
        DataType = ftInteger
        Name = 'MOSTRAR_TODOS'
        ParamType = ptInput
        Value = '0'
      end>
    object qNotasCODALUNO: TIntegerField
      DisplayLabel = 'Cod. Aluno'
      FieldName = 'CODALUNO'
      ReadOnly = True
      Required = True
      DisplayFormat = '#######-#'
    end
    object qNotasNOME: TStringField
      DisplayLabel = 'Nome do Aluno'
      FieldName = 'NOME'
      ReadOnly = True
      OnGetText = qNotasNOMEGetText
      Size = 100
    end
    object qNotasDISCIPLINA: TIntegerField
      FieldName = 'DISCIPLINA'
      ReadOnly = True
      Required = True
    end
    object qNotasTURMA: TStringField
      FieldName = 'TURMA'
      ReadOnly = True
      Required = True
      Size = 50
    end
    object qNotasNOTA1: TFloatField
      FieldName = 'NOTA1'
      OnGetText = qNotasNOTA1GetText
      DisplayFormat = '#0.00'
      EditFormat = '0.00'
      Precision = 9
    end
    object qNotasNOTA2: TFloatField
      FieldName = 'NOTA2'
      OnGetText = qNotasNOTA1GetText
      DisplayFormat = '#0.00'
      EditFormat = '0.00'
      Precision = 9
    end
    object qNotasNOTA3: TFloatField
      FieldName = 'NOTA3'
      OnGetText = qNotasNOTA1GetText
      DisplayFormat = '#0.00'
      EditFormat = '0.00'
      Precision = 9
    end
    object qNotasNOTA4: TFloatField
      FieldName = 'NOTA4'
      OnGetText = qNotasNOTA1GetText
      DisplayFormat = '#0.00'
      EditFormat = '0.00'
      Precision = 9
    end
    object qNotasNOTA5: TFloatField
      FieldName = 'NOTA5'
      OnGetText = qNotasNOTA1GetText
      DisplayFormat = '#0.00'
      EditFormat = '0.00'
      Precision = 9
    end
    object qNotasNOTA6: TFloatField
      FieldName = 'NOTA6'
      OnGetText = qNotasNOTA1GetText
      DisplayFormat = '#0.00'
      EditFormat = '0.00'
      Precision = 9
    end
    object qNotasNOTA7: TFloatField
      FieldName = 'NOTA7'
      OnGetText = qNotasNOTA1GetText
      DisplayFormat = '#0.00'
      EditFormat = '0.00'
      Precision = 9
    end
    object qNotasNOTA8: TFloatField
      FieldName = 'NOTA8'
      OnGetText = qNotasNOTA1GetText
      DisplayFormat = '#0.00'
      EditFormat = '0.00'
      Precision = 9
    end
    object qNotasNOTA9: TFloatField
      FieldName = 'NOTA9'
      OnGetText = qNotasNOTA1GetText
      DisplayFormat = '#0.00'
      EditFormat = '0.00'
      Precision = 9
    end
    object qNotasNOTA10: TFloatField
      FieldName = 'NOTA10'
      OnGetText = qNotasNOTA1GetText
      DisplayFormat = '#0.00'
      EditFormat = '0.00'
      Precision = 9
    end
    object qNotasANOSEMESTRE: TSmallintField
      FieldName = 'ANOSEMESTRE'
      Required = True
    end
    object qNotasAJUSTE: TFloatField
      FieldName = 'AJUSTE'
      OnGetText = qNotasAJUSTEGetText
      Precision = 9
    end
    object qNotasSITUACAO: TSmallintField
      FieldName = 'SITUACAO'
    end
    object qNotasBIMESTRE: TSmallintField
      FieldName = 'BIMESTRE'
    end
    object qNotasnota_especial: TFloatField
      FieldName = 'nota_especial'
      OnGetText = qNotasNOTA1GetText
    end
    object qNotasnota11: TFloatField
      FieldName = 'nota11'
      OnGetText = qNotasNOTA1GetText
      DisplayFormat = '#0.00'
      EditFormat = '0.00'
    end
    object qNotasnota12: TFloatField
      FieldName = 'nota12'
      OnGetText = qNotasNOTA1GetText
      DisplayFormat = '#0.00'
      EditFormat = '0.00'
    end
    object qNotasnota13: TFloatField
      FieldName = 'nota13'
      OnGetText = qNotasNOTA1GetText
      DisplayFormat = '#0.00'
      EditFormat = '0.00'
    end
    object qNotasnota14: TFloatField
      FieldName = 'nota14'
      OnGetText = qNotasNOTA1GetText
      DisplayFormat = '#0.00'
      EditFormat = '0.00'
    end
    object qNotasnota15: TFloatField
      FieldName = 'nota15'
      OnGetText = qNotasNOTA1GetText
      DisplayFormat = '#0.00'
      EditFormat = '0.00'
    end
    object qNotasnota16: TFloatField
      FieldName = 'nota16'
      OnGetText = qNotasNOTA1GetText
      DisplayFormat = '#0.00'
      EditFormat = '0.00'
    end
    object qNotasnota17: TFloatField
      FieldName = 'nota17'
      OnGetText = qNotasNOTA1GetText
      DisplayFormat = '#0.00'
      EditFormat = '0.00'
    end
    object qNotasnota18: TFloatField
      FieldName = 'nota18'
      OnGetText = qNotasNOTA1GetText
      DisplayFormat = '#0.00'
      EditFormat = '0.00'
    end
    object qNotasnota19: TFloatField
      FieldName = 'nota19'
      OnGetText = qNotasNOTA1GetText
      DisplayFormat = '#0.00'
      EditFormat = '0.00'
    end
    object qNotasnota20: TFloatField
      FieldName = 'nota20'
      OnGetText = qNotasNOTA1GetText
      DisplayFormat = '#0.00'
      EditFormat = '0.00'
    end
    object qNotasnota21: TFloatField
      FieldName = 'nota21'
      OnGetText = qNotasNOTA1GetText
      DisplayFormat = '#0.00'
      EditFormat = '0.00'
    end
    object qNotasnota22: TFloatField
      FieldName = 'nota22'
      OnGetText = qNotasNOTA1GetText
      DisplayFormat = '#0.00'
      EditFormat = '0.00'
    end
    object qNotasnota23: TFloatField
      FieldName = 'nota23'
      OnGetText = qNotasNOTA1GetText
      DisplayFormat = '#0.00'
      EditFormat = '0.00'
    end
    object qNotasnota24: TFloatField
      FieldName = 'nota24'
      OnGetText = qNotasNOTA1GetText
      DisplayFormat = '#0.00'
      EditFormat = '0.00'
    end
    object qNotasnota25: TFloatField
      FieldName = 'nota25'
      OnGetText = qNotasNOTA1GetText
      DisplayFormat = '#0.00'
      EditFormat = '0.00'
    end
    object qNotasNOTA_D1: TFloatField
      FieldName = 'NOTA_D1'
      OnGetText = qNotasNOTA1GetText
      DisplayFormat = '#0.00'
      EditFormat = '0.00'
    end
    object qNotasNOTA_D2: TFloatField
      FieldName = 'NOTA_D2'
      OnGetText = qNotasNOTA1GetText
      DisplayFormat = '#0.00'
      EditFormat = '0.00'
    end
    object qNotasNOTA_D3: TFloatField
      FieldName = 'NOTA_D3'
      OnGetText = qNotasNOTA1GetText
      DisplayFormat = '#0.00'
      EditFormat = '0.00'
    end
    object qNotasNOTA_D4: TFloatField
      FieldName = 'NOTA_D4'
      OnGetText = qNotasNOTA1GetText
      DisplayFormat = '#0.00'
      EditFormat = '0.00'
    end
    object qNotasNOTA_D5: TFloatField
      FieldName = 'NOTA_D5'
      OnGetText = qNotasNOTA1GetText
      DisplayFormat = '#0.00'
      EditFormat = '0.00'
    end
    object qNotasNOTA_D6: TFloatField
      FieldName = 'NOTA_D6'
      OnGetText = qNotasNOTA1GetText
      DisplayFormat = '#0.00'
      EditFormat = '0.00'
    end
    object qNotasNOTA_D7: TFloatField
      FieldName = 'NOTA_D7'
      OnGetText = qNotasNOTA1GetText
      DisplayFormat = '#0.00'
      EditFormat = '0.00'
    end
    object qNotasNOTA_D8: TFloatField
      FieldName = 'NOTA_D8'
      OnGetText = qNotasNOTA1GetText
      DisplayFormat = '#0.00'
      EditFormat = '0.00'
    end
    object qNotasNOTA_D9: TFloatField
      FieldName = 'NOTA_D9'
      OnGetText = qNotasNOTA1GetText
      DisplayFormat = '#0.00'
      EditFormat = '0.00'
    end
    object qNotasNOTA_D10: TFloatField
      FieldName = 'NOTA_D10'
      OnGetText = qNotasNOTA1GetText
      DisplayFormat = '#0.00'
      EditFormat = '0.00'
    end
    object qNotasNR_ALUNO: TIntegerField
      FieldName = 'NR_ALUNO'
    end
    object qNotasMEDIA_SEM_AJUSTE: TFloatField
      FieldKind = fkCalculated
      FieldName = 'MEDIA_SEM_AJUSTE'
      DisplayFormat = '0.00'
      Calculated = True
    end
    object qNotasFALTAS: TBytesField
      FieldName = 'FALTAS'
      Size = 6
    end
    object qNotasFREQ1: TBytesField
      FieldName = 'FREQ1'
      Size = 24
    end
    object qNotasFREQ2: TBytesField
      FieldName = 'FREQ2'
      Size = 24
    end
    object qNotasFREQ3: TBytesField
      FieldName = 'FREQ3'
      Size = 24
    end
    object qNotasFREQ4: TBytesField
      FieldName = 'FREQ4'
      Size = 24
    end
    object qNotasFREQ5: TBytesField
      FieldName = 'FREQ5'
      Size = 24
    end
    object qNotasFREQ6: TBytesField
      FieldName = 'FREQ6'
      Size = 24
    end
    object qNotasFREQ7: TBytesField
      FieldName = 'FREQ7'
      Size = 24
    end
    object qNotasFREQ8: TBytesField
      FieldName = 'FREQ8'
      Size = 24
    end
    object qNotasFREQ9: TBytesField
      FieldName = 'FREQ9'
      Size = 24
    end
    object qNotasFREQ10: TBytesField
      FieldName = 'FREQ10'
      Size = 24
    end
    object qNotasFREQ11: TBytesField
      FieldName = 'FREQ11'
      Size = 24
    end
    object qNotasFREQ12: TBytesField
      FieldName = 'FREQ12'
      Size = 24
    end
    object qNotasFREQ13: TBytesField
      FieldName = 'FREQ13'
      Size = 24
    end
    object qNotasFREQ14: TBytesField
      FieldName = 'FREQ14'
      Size = 24
    end
    object qNotasFREQ15: TBytesField
      FieldName = 'FREQ15'
      Size = 24
    end
    object qNotasFREQ16: TBytesField
      FieldName = 'FREQ16'
      Size = 24
    end
    object qNotasFREQ17: TBytesField
      FieldName = 'FREQ17'
      Size = 24
    end
    object qNotasFREQ18: TBytesField
      FieldName = 'FREQ18'
      Size = 24
    end
    object qNotasFREQ19: TBytesField
      FieldName = 'FREQ19'
      Size = 24
    end
    object qNotasFREQ20: TBytesField
      FieldName = 'FREQ20'
      Size = 24
    end
    object qNotasFREQ21: TBytesField
      FieldName = 'FREQ21'
      Size = 24
    end
    object qNotasFREQ22: TBytesField
      FieldName = 'FREQ22'
      Size = 24
    end
    object qNotasFREQ23: TBytesField
      FieldName = 'FREQ23'
      Size = 24
    end
    object qNotasFREQ24: TBytesField
      FieldName = 'FREQ24'
      Size = 24
    end
    object qNotasFREQ25: TBytesField
      FieldName = 'FREQ25'
      Size = 24
    end
    object qNotasFREQ26: TBytesField
      FieldName = 'FREQ26'
      Size = 24
    end
    object qNotasFREQ27: TBytesField
      FieldName = 'FREQ27'
      Size = 24
    end
    object qNotasFREQ28: TBytesField
      FieldName = 'FREQ28'
      Size = 24
    end
    object qNotasFREQ29: TBytesField
      FieldName = 'FREQ29'
      Size = 24
    end
    object qNotasFREQ30: TBytesField
      FieldName = 'FREQ30'
      Size = 24
    end
    object qNotasFREQ31: TBytesField
      FieldName = 'FREQ31'
      Size = 24
    end
    object qNotasFREQ32: TBytesField
      FieldName = 'FREQ32'
      Size = 24
    end
    object qNotasFREQ33: TBytesField
      FieldName = 'FREQ33'
      Size = 24
    end
    object qNotasFREQ34: TBytesField
      FieldName = 'FREQ34'
      Size = 24
    end
    object qNotasFREQ35: TBytesField
      FieldName = 'FREQ35'
      Size = 24
    end
    object qNotasFREQ36: TBytesField
      FieldName = 'FREQ36'
      Size = 24
    end
    object qNotasFREQ37: TBytesField
      FieldName = 'FREQ37'
      Size = 24
    end
    object qNotasFREQ38: TBytesField
      FieldName = 'FREQ38'
      Size = 24
    end
    object qNotasFREQ39: TBytesField
      FieldName = 'FREQ39'
      Size = 24
    end
    object qNotasFREQ40: TBytesField
      FieldName = 'FREQ40'
      Size = 24
    end
    object qNotasFREQ41: TBytesField
      FieldName = 'FREQ41'
      Size = 24
    end
    object qNotasFREQ42: TBytesField
      FieldName = 'FREQ42'
      Size = 24
    end
    object qNotasFREQ43: TBytesField
      FieldName = 'FREQ43'
      Size = 24
    end
    object qNotasFREQ44: TBytesField
      FieldName = 'FREQ44'
      Size = 24
    end
    object qNotasFREQ45: TBytesField
      FieldName = 'FREQ45'
      Size = 24
    end
    object qNotasFREQ46: TBytesField
      FieldName = 'FREQ46'
      Size = 24
    end
    object qNotasFREQ47: TBytesField
      FieldName = 'FREQ47'
      Size = 24
    end
    object qNotasFREQ48: TBytesField
      FieldName = 'FREQ48'
      Size = 24
    end
    object qNotasFREQ49: TBytesField
      FieldName = 'FREQ49'
      Size = 24
    end
    object qNotasFREQ50: TBytesField
      FieldName = 'FREQ50'
      Size = 24
    end
    object qNotasFREQ51: TBytesField
      FieldName = 'FREQ51'
      Size = 24
    end
    object qNotasFREQ52: TBytesField
      FieldName = 'FREQ52'
      Size = 24
    end
    object qNotasFREQ53: TBytesField
      FieldName = 'FREQ53'
      Size = 24
    end
    object qNotasFREQ54: TBytesField
      FieldName = 'FREQ54'
      Size = 24
    end
    object qNotasFREQ55: TBytesField
      FieldName = 'FREQ55'
      Size = 24
    end
    object qNotasFREQ56: TBytesField
      FieldName = 'FREQ56'
      Size = 24
    end
    object qNotasFREQ57: TBytesField
      FieldName = 'FREQ57'
      Size = 24
    end
    object qNotasFREQ58: TBytesField
      FieldName = 'FREQ58'
      Size = 24
    end
    object qNotasFREQ59: TBytesField
      FieldName = 'FREQ59'
      Size = 24
    end
    object qNotasFREQ60: TBytesField
      FieldName = 'FREQ60'
      Size = 24
    end
    object qNotasFREQ61: TBytesField
      FieldName = 'FREQ61'
      Size = 24
    end
    object qNotasFREQ62: TBytesField
      FieldName = 'FREQ62'
      Size = 24
    end
    object qNotasFREQ63: TBytesField
      FieldName = 'FREQ63'
      Size = 24
    end
    object qNotasFREQ64: TBytesField
      FieldName = 'FREQ64'
      Size = 24
    end
    object qNotasFREQ65: TBytesField
      FieldName = 'FREQ65'
      Size = 24
    end
    object qNotasFREQ66: TBytesField
      FieldName = 'FREQ66'
      Size = 24
    end
    object qNotasFREQ67: TBytesField
      FieldName = 'FREQ67'
      Size = 24
    end
    object qNotasFREQ68: TBytesField
      FieldName = 'FREQ68'
      Size = 24
    end
    object qNotasFREQ69: TBytesField
      FieldName = 'FREQ69'
      Size = 24
    end
    object qNotasFREQ70: TBytesField
      FieldName = 'FREQ70'
      Size = 24
    end
    object qNotasFREQ71: TBytesField
      FieldName = 'FREQ71'
      Size = 24
    end
    object qNotasFREQ72: TBytesField
      FieldName = 'FREQ72'
      Size = 24
    end
    object qNotasFREQ73: TBytesField
      FieldName = 'FREQ73'
      Size = 24
    end
    object qNotasFREQ74: TBytesField
      FieldName = 'FREQ74'
      Size = 24
    end
    object qNotasFREQ75: TBytesField
      FieldName = 'FREQ75'
      Size = 24
    end
    object qNotasFREQ76: TBytesField
      FieldName = 'FREQ76'
      Size = 24
    end
    object qNotasFREQ77: TBytesField
      FieldName = 'FREQ77'
      Size = 24
    end
    object qNotasFREQ78: TBytesField
      FieldName = 'FREQ78'
      Size = 24
    end
    object qNotasFREQ79: TBytesField
      FieldName = 'FREQ79'
      Size = 24
    end
    object qNotasFREQ80: TBytesField
      FieldName = 'FREQ80'
      Size = 24
    end
    object qNotasFREQ81: TBytesField
      FieldName = 'FREQ81'
      Size = 24
    end
    object qNotasFREQ82: TBytesField
      FieldName = 'FREQ82'
      Size = 24
    end
    object qNotasFREQ83: TBytesField
      FieldName = 'FREQ83'
      Size = 24
    end
    object qNotasFREQ84: TBytesField
      FieldName = 'FREQ84'
      Size = 24
    end
    object qNotasFREQ85: TBytesField
      FieldName = 'FREQ85'
      Size = 24
    end
    object qNotasFREQ86: TBytesField
      FieldName = 'FREQ86'
      Size = 24
    end
    object qNotasFREQ87: TBytesField
      FieldName = 'FREQ87'
      Size = 24
    end
    object qNotasFREQ88: TBytesField
      FieldName = 'FREQ88'
      Size = 24
    end
    object qNotasFREQ89: TBytesField
      FieldName = 'FREQ89'
      Size = 24
    end
    object qNotasFREQ90: TBytesField
      FieldName = 'FREQ90'
      Size = 24
    end
    object qNotasFREQ91: TBytesField
      FieldName = 'FREQ91'
      Size = 24
    end
    object qNotasFREQ92: TBytesField
      FieldName = 'FREQ92'
      Size = 24
    end
    object qNotasFREQ93: TBytesField
      FieldName = 'FREQ93'
      Size = 24
    end
    object qNotasFREQ94: TBytesField
      FieldName = 'FREQ94'
      Size = 24
    end
    object qNotasFREQ95: TBytesField
      FieldName = 'FREQ95'
      Size = 24
    end
    object qNotasFREQ96: TBytesField
      FieldName = 'FREQ96'
      Size = 24
    end
    object qNotasFREQ97: TBytesField
      FieldName = 'FREQ97'
      Size = 24
    end
    object qNotasFREQ98: TBytesField
      FieldName = 'FREQ98'
      Size = 24
    end
    object qNotasFREQ99: TBytesField
      FieldName = 'FREQ99'
      Size = 24
    end
    object qNotasMEDIA: TFloatField
      FieldName = 'MEDIA'
    end
    object qNotasTotalFaltas: TFloatField
      FieldKind = fkCalculated
      FieldName = 'TotalFaltas'
      Calculated = True
    end
  end
  object dsNotas: TDataSource
    DataSet = qNotas
    Left = 64
    Top = 184
  end
  object qProvas: TUMZQuery
    Connection = DM.db
    OnCalcFields = qProvasCalcFields
    AfterInsert = qProvasAfterInsert
    SQL.Strings = (
      'SELECT'
      '  *,'
      '  avt.ds_chave as ds_chave_tipo'
      'FROM'
      '  DIARIO_PROVAS dp'
      
        '  INNER JOIN avaliacoes_tipos avt ON (avt.cd_avaliacao_tipo = dp' +
        '.cd_avaliacao_tipo)'
      'WHERE'
      '  dp.TURMA = :TURMA AND'
      '  dp.DISCIPLINA = :DISCIPLINA AND'
      '  dp.ANOSEMESTRE = :ANOSEMESTRE AND'
      '  dp.BIMESTRE = :BIMESTRE AND'
      
        '  ((CASE WHEN :CD_GRUPO IS NOT NULL THEN DP.CD_GRUPO = :CD_GRUPO' +
        ' ELSE 1=1 END) OR dp.sn_especial = 1 OR dp.sn_proficiencia = 1)'
      'ORDER BY'
      '  NRO_NOTA')
    Params = <
      item
        DataType = ftString
        Name = 'TURMA'
        ParamType = ptUnknown
        Size = 16
      end
      item
        DataType = ftInteger
        Name = 'DISCIPLINA'
        ParamType = ptUnknown
        Size = 4
      end
      item
        DataType = ftSmallint
        Name = 'ANOSEMESTRE'
        ParamType = ptUnknown
        Size = 2
      end
      item
        DataType = ftSmallint
        Name = 'BIMESTRE'
        ParamType = ptUnknown
        Size = 2
      end
      item
        DataType = ftUnknown
        Name = 'CD_GRUPO'
        ParamType = ptUnknown
      end>
    DataSource = dsTurmas
    Left = 16
    Top = 240
    ParamData = <
      item
        DataType = ftString
        Name = 'TURMA'
        ParamType = ptUnknown
        Size = 16
      end
      item
        DataType = ftInteger
        Name = 'DISCIPLINA'
        ParamType = ptUnknown
        Size = 4
      end
      item
        DataType = ftSmallint
        Name = 'ANOSEMESTRE'
        ParamType = ptUnknown
        Size = 2
      end
      item
        DataType = ftSmallint
        Name = 'BIMESTRE'
        ParamType = ptUnknown
        Size = 2
      end
      item
        DataType = ftUnknown
        Name = 'CD_GRUPO'
        ParamType = ptUnknown
      end>
    object qProvasDISCIPLINA: TIntegerField
      FieldName = 'DISCIPLINA'
    end
    object qProvasTURMA: TStringField
      FieldName = 'TURMA'
      Size = 50
    end
    object qProvasNRO_NOTA: TSmallintField
      FieldName = 'NRO_NOTA'
      DisplayFormat = 'NOTA#'
    end
    object qProvasASSUNTO: TStringField
      Tag = 1
      DisplayWidth = 50
      FieldName = 'ASSUNTO'
      Size = 200
    end
    object qProvasANOSEMESTRE: TSmallintField
      FieldName = 'ANOSEMESTRE'
      Required = True
    end
    object qProvasvl_peso: TFloatField
      Tag = 1
      DisplayLabel = 'PESO'
      FieldName = 'vl_peso'
    end
    object qProvasid_atividade_moodle: TLargeintField
      Tag = 1
      Alignment = taCenter
      DisplayLabel = 'MOODLE'
      DisplayWidth = 8
      FieldName = 'id_atividade_moodle'
      OnGetText = qProvasid_atividade_moodleGetText
      DisplayFormat = 'MOODLE'
    end
    object qProvasDATA: TDateTimeField
      Tag = 1
      DisplayLabel = 'DATA AVALIA'#199#195'O'
      FieldName = 'DATA'
      Origin = 'WMESTRE12.Diario_Provas.DATA'
      DisplayFormat = 'dd/mm/yyyy'
    end
    object qProvasDS_NOTA: TStringField
      Tag = 1
      DisplayLabel = 'NOTA'
      DisplayWidth = 15
      FieldKind = fkCalculated
      FieldName = 'DS_NOTA'
      Size = 255
      Calculated = True
    end
    object qProvassn_especial: TSmallintField
      FieldName = 'sn_especial'
      Origin = 'WMESTRE12.diario_provas.sn_especial'
    end
    object qProvasds_avaliacao: TStringField
      Tag = 1
      DisplayLabel = 'TIPO'
      DisplayWidth = 30
      FieldName = 'ds_avaliacao'
      Size = 255
    end
    object qProvasds_chave_tipo: TStringField
      Tag = 1
      DisplayLabel = 'CHAVE'
      DisplayWidth = 15
      FieldName = 'ds_chave_tipo'
      Size = 50
    end
    object qProvassn_proficiencia: TSmallintField
      FieldName = 'sn_proficiencia'
    end
    object qProvasds_chave: TStringField
      DisplayLabel = 'Chave'
      DisplayWidth = 15
      FieldName = 'ds_chave'
      Size = 50
    end
    object qProvassn_compoe: TSmallintField
      FieldName = 'sn_compoe'
    end
  end
  object dsProvas: TDataSource
    AutoEdit = False
    DataSet = qProvas
    Left = 64
    Top = 240
  end
  object IBSQL1: TUMZQuery
    Connection = DM.db
    SQL.Strings = (
      'Select FORMULA From Diario_Matriculas WHERE'
      'DISCIPLINA = :DISCIPLINA AND'
      'TURMA = :TURMA AND'
      'CodAluno = :CODALUNO')
    Params = <
      item
        DataType = ftUnknown
        Name = 'DISCIPLINA'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'TURMA'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'CODALUNO'
        ParamType = ptUnknown
      end>
    Left = 240
    Top = 16
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'DISCIPLINA'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'TURMA'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'CODALUNO'
        ParamType = ptUnknown
      end>
  end
  object qAulas: TUMZQuery
    Connection = DM.db
    AfterInsert = qAulasAfterInsert
    OnNewRecord = qAulasNewRecord
    SQL.Strings = (
      'SELECT'
      '  *'
      'FROM'
      '  DIARIO_AULAS'
      'WHERE'
      '  DISCIPLINA = :DISCIPLINA AND'
      
        '  TURMA = :TURMA  AND BIMESTRE = :BIMESTRE AND ANOSEMESTRE = :AN' +
        'OSEMESTRE AND'
      
        '  CASE WHEN :CD_GRUPO IS NOT NULL THEN CD_GRUPO = :CD_GRUPO ELSE' +
        ' 1=1 END'
      'ORDER BY'
      '  NRO_AULA')
    Params = <
      item
        DataType = ftInteger
        Name = 'DISCIPLINA'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'TURMA'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'BIMESTRE'
        ParamType = ptUnknown
      end
      item
        DataType = ftSmallint
        Name = 'ANOSEMESTRE'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'CD_GRUPO'
        ParamType = ptUnknown
      end>
    DataSource = dsTurmas
    Left = 16
    Top = 288
    ParamData = <
      item
        DataType = ftInteger
        Name = 'DISCIPLINA'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'TURMA'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'BIMESTRE'
        ParamType = ptUnknown
      end
      item
        DataType = ftSmallint
        Name = 'ANOSEMESTRE'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'CD_GRUPO'
        ParamType = ptUnknown
      end>
    object qAulasTURMA: TStringField
      FieldName = 'TURMA'
      Origin = 'WMESTRE12.Diario_Aulas.TURMA'
      Size = 50
    end
    object qAulasANOSEMESTRE: TSmallintField
      FieldName = 'ANOSEMESTRE'
      Origin = 'WMESTRE12.Diario_Aulas.ANOSEMESTRE'
    end
    object qAulasDISCIPLINA: TIntegerField
      FieldName = 'DISCIPLINA'
      Origin = 'WMESTRE12.Diario_Aulas.DISCIPLINA'
    end
    object qAulasBIMESTRE: TSmallintField
      FieldName = 'BIMESTRE'
      Origin = 'WMESTRE12.Diario_Aulas.BIMESTRE'
    end
    object qAulasNRO_AULA: TSmallintField
      FieldName = 'NRO_AULA'
      Origin = 'WMESTRE12.Diario_Aulas.NRO_AULA'
    end
    object qAulasDATA: TDateTimeField
      FieldName = 'DATA'
      Origin = 'WMESTRE12.Diario_Aulas.DATA'
      DisplayFormat = 'dd/mm/yyyy'
    end
    object qAulasQTD_AULAS: TSmallintField
      FieldName = 'QTD_AULAS'
      Origin = 'WMESTRE12.Diario_Aulas.QTD_AULAS'
    end
    object qAulasCONTEUDO: TMemoField
      FieldName = 'CONTEUDO'
      Origin = 'WMESTRE12.Diario_Aulas.CONTEUDO'
      BlobType = ftMemo
      Size = 1
    end
  end
  object dsAulas: TDataSource
    DataSet = qAulas
    Left = 64
    Top = 288
  end
  object qInsereAula: TUMZQuery
    Connection = DM.db
    SQL.Strings = (
      'select MAX(NRO_AULA) MAXIMO  from DIARIO_AULAS '
      'WHERE DISCIPLINA = :DISCIPLINA AND'
      'TURMA = :TURMA AND ANOSEMESTRE = :ANOSEMESTRE'
      '')
    Params = <
      item
        DataType = ftUnknown
        Name = 'DISCIPLINA'
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
    Left = 304
    Top = 16
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'DISCIPLINA'
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
  object qFrequencia: TUMZQuery
    Connection = DM.db
    OnCalcFields = qFrequenciaCalcFields
    UpdateObject = updFreq
    CachedUpdates = True
    AfterPost = qFrequenciaAfterPost
    SQL.Strings = (
      'select A.NM_PESSOA AS NOME, DM.*, FI.turmamatricula  '
      
        'FROM DIARIO_MATRICULAS DM INNER JOIN PESSOAS A ON (DM.CODALUNO =' +
        ' A.CD_PESSOA)'
      
        'INNER JOIN FICHAINDIVIDUAL FI ON (DM.CODALUNO = FI.CODIGOALUNO A' +
        'ND DM.TURMA = FI.TURMA AND DM.ANOSEMESTRE = FI.ANOSEMESTRE AND D' +
        'M.DISCIPLINA = FI.DISCIPLINA)'
      'WHERE  '
      'DM.DISCIPLINA = :DISCIPLINA AND '
      'DM.TURMA = :TURMA AND '
      'BIMESTRE = :BIMESTRE AND '
      'DM.ANOSEMESTRE = :ANOSEMESTRE'
      'AND (FI.SITUACAO NOT IN (3,4,5,6,7,8,10) OR :MOSTRAR_TODOS = 1) '
      'ORDER BY A.NM_PESSOA'
      '')
    Params = <
      item
        DataType = ftUnknown
        Name = 'DISCIPLINA'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'TURMA'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'BIMESTRE'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'ANOSEMESTRE'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'MOSTRAR_TODOS'
        ParamType = ptUnknown
      end>
    DataSource = dsTurmas
    Left = 160
    Top = 128
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'DISCIPLINA'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'TURMA'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'BIMESTRE'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'ANOSEMESTRE'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'MOSTRAR_TODOS'
        ParamType = ptUnknown
      end>
    object qFrequenciaCODALUNO: TIntegerField
      DisplayLabel = 'Cod. Aluno'
      FieldName = 'CODALUNO'
      Required = True
      DisplayFormat = '#######-#'
    end
    object qFrequenciaDISCIPLINA: TIntegerField
      DisplayLabel = 'Disciplina'
      FieldName = 'DISCIPLINA'
      Required = True
    end
    object qFrequenciaTURMA: TStringField
      DisplayLabel = 'Turma'
      FieldName = 'TURMA'
      Required = True
      Size = 50
    end
    object qFrequenciaNOME: TStringField
      DisplayLabel = 'Nome do Aluno'
      FieldName = 'NOME'
      OnGetText = qFrequenciaNOMEGetText
      Size = 60
    end
    object qFrequenciaANOSEMESTRE: TSmallintField
      FieldName = 'ANOSEMESTRE'
      Required = True
    end
    object qFrequenciaNOTA1: TFloatField
      FieldName = 'NOTA1'
      Precision = 9
    end
    object qFrequenciaNOTA2: TFloatField
      FieldName = 'NOTA2'
      Precision = 9
    end
    object qFrequenciaNOTA3: TFloatField
      FieldName = 'NOTA3'
      Precision = 9
    end
    object qFrequenciaNOTA4: TFloatField
      FieldName = 'NOTA4'
      Precision = 9
    end
    object qFrequenciaNOTA5: TFloatField
      FieldName = 'NOTA5'
      Precision = 9
    end
    object qFrequenciaNOTA6: TFloatField
      FieldName = 'NOTA6'
      Precision = 9
    end
    object qFrequenciaNOTA7: TFloatField
      FieldName = 'NOTA7'
      Precision = 9
    end
    object qFrequenciaNOTA8: TFloatField
      FieldName = 'NOTA8'
      Precision = 9
    end
    object qFrequenciaNOTA9: TFloatField
      FieldName = 'NOTA9'
      Precision = 9
    end
    object qFrequenciaNOTA10: TFloatField
      FieldName = 'NOTA10'
      Precision = 9
    end
    object qFrequenciaSITUACAO: TSmallintField
      FieldName = 'SITUACAO'
    end
    object qFrequenciabimestre: TSmallintField
      FieldName = 'bimestre'
    end
    object qFrequenciaajuste: TFloatField
      FieldName = 'ajuste'
    end
    object qFrequenciaturmamatricula: TStringField
      FieldName = 'turmamatricula'
      Size = 50
    end
    object qFrequenciaFALTAS: TBytesField
      FieldName = 'FALTAS'
      Size = 6
    end
    object qFrequenciaFREQ1: TBytesField
      FieldName = 'FREQ1'
      Size = 24
    end
    object qFrequenciaFREQ2: TBytesField
      FieldName = 'FREQ2'
      Size = 24
    end
    object qFrequenciaFREQ3: TBytesField
      FieldName = 'FREQ3'
      Size = 24
    end
    object qFrequenciaFREQ4: TBytesField
      FieldName = 'FREQ4'
      Size = 24
    end
    object qFrequenciaFREQ5: TBytesField
      FieldName = 'FREQ5'
      Size = 24
    end
    object qFrequenciaFREQ6: TBytesField
      FieldName = 'FREQ6'
      Size = 24
    end
    object qFrequenciaFREQ7: TBytesField
      FieldName = 'FREQ7'
      Size = 24
    end
    object qFrequenciaFREQ8: TBytesField
      FieldName = 'FREQ8'
      Size = 24
    end
    object qFrequenciaFREQ9: TBytesField
      FieldName = 'FREQ9'
      Size = 24
    end
    object qFrequenciaFREQ10: TBytesField
      FieldName = 'FREQ10'
      Size = 24
    end
    object qFrequenciaFREQ11: TBytesField
      FieldName = 'FREQ11'
      Size = 24
    end
    object qFrequenciaFREQ12: TBytesField
      FieldName = 'FREQ12'
      Size = 24
    end
    object qFrequenciaFREQ13: TBytesField
      FieldName = 'FREQ13'
      Size = 24
    end
    object qFrequenciaFREQ14: TBytesField
      FieldName = 'FREQ14'
      Size = 24
    end
    object qFrequenciaFREQ15: TBytesField
      FieldName = 'FREQ15'
      Size = 24
    end
    object qFrequenciaFREQ16: TBytesField
      FieldName = 'FREQ16'
      Size = 24
    end
    object qFrequenciaFREQ17: TBytesField
      FieldName = 'FREQ17'
      Size = 24
    end
    object qFrequenciaFREQ18: TBytesField
      FieldName = 'FREQ18'
      Size = 24
    end
    object qFrequenciaFREQ19: TBytesField
      FieldName = 'FREQ19'
      Size = 24
    end
    object qFrequenciaFREQ20: TBytesField
      FieldName = 'FREQ20'
      Size = 24
    end
    object qFrequenciaFREQ21: TBytesField
      FieldName = 'FREQ21'
      Size = 24
    end
    object qFrequenciaFREQ22: TBytesField
      FieldName = 'FREQ22'
      Size = 24
    end
    object qFrequenciaFREQ23: TBytesField
      FieldName = 'FREQ23'
      Size = 24
    end
    object qFrequenciaFREQ24: TBytesField
      FieldName = 'FREQ24'
      Size = 24
    end
    object qFrequenciaFREQ25: TBytesField
      FieldName = 'FREQ25'
      Size = 24
    end
    object qFrequenciaFREQ26: TBytesField
      FieldName = 'FREQ26'
      Size = 24
    end
    object qFrequenciaFREQ27: TBytesField
      FieldName = 'FREQ27'
      Size = 24
    end
    object qFrequenciaFREQ28: TBytesField
      FieldName = 'FREQ28'
      Size = 24
    end
    object qFrequenciaFREQ29: TBytesField
      FieldName = 'FREQ29'
      Size = 24
    end
    object qFrequenciaFREQ30: TBytesField
      FieldName = 'FREQ30'
      Size = 24
    end
    object qFrequenciaFREQ31: TBytesField
      FieldName = 'FREQ31'
      Size = 24
    end
    object qFrequenciaFREQ32: TBytesField
      FieldName = 'FREQ32'
      Size = 24
    end
    object qFrequenciaFREQ33: TBytesField
      FieldName = 'FREQ33'
      Size = 24
    end
    object qFrequenciaFREQ34: TBytesField
      FieldName = 'FREQ34'
      Size = 24
    end
    object qFrequenciaFREQ35: TBytesField
      FieldName = 'FREQ35'
      Size = 24
    end
    object qFrequenciaFREQ36: TBytesField
      FieldName = 'FREQ36'
      Size = 24
    end
    object qFrequenciaFREQ37: TBytesField
      FieldName = 'FREQ37'
      Size = 24
    end
    object qFrequenciaFREQ38: TBytesField
      FieldName = 'FREQ38'
      Size = 24
    end
    object qFrequenciaFREQ39: TBytesField
      FieldName = 'FREQ39'
      Size = 24
    end
    object qFrequenciaFREQ40: TBytesField
      FieldName = 'FREQ40'
      Size = 24
    end
    object qFrequenciaFREQ41: TBytesField
      FieldName = 'FREQ41'
      Size = 24
    end
    object qFrequenciaFREQ42: TBytesField
      FieldName = 'FREQ42'
      Size = 24
    end
    object qFrequenciaFREQ43: TBytesField
      FieldName = 'FREQ43'
      Size = 24
    end
    object qFrequenciaFREQ44: TBytesField
      FieldName = 'FREQ44'
      Size = 24
    end
    object qFrequenciaFREQ45: TBytesField
      FieldName = 'FREQ45'
      Size = 24
    end
    object qFrequenciaFREQ46: TBytesField
      FieldName = 'FREQ46'
      Size = 24
    end
    object qFrequenciaFREQ47: TBytesField
      FieldName = 'FREQ47'
      Size = 24
    end
    object qFrequenciaFREQ48: TBytesField
      FieldName = 'FREQ48'
      Size = 24
    end
    object qFrequenciaFREQ49: TBytesField
      FieldName = 'FREQ49'
      Size = 24
    end
    object qFrequenciaFREQ50: TBytesField
      FieldName = 'FREQ50'
      Size = 24
    end
    object qFrequenciaMEDIA: TBytesField
      FieldName = 'MEDIA'
      Size = 53
    end
    object qFrequenciaNOTA13: TFloatField
      FieldName = 'NOTA13'
    end
    object qFrequenciaFREQ51: TBytesField
      FieldName = 'FREQ51'
      Size = 24
    end
    object qFrequenciaFREQ52: TBytesField
      FieldName = 'FREQ52'
      Size = 24
    end
    object qFrequenciaFREQ53: TBytesField
      FieldName = 'FREQ53'
      Size = 24
    end
    object qFrequenciaFREQ54: TBytesField
      FieldName = 'FREQ54'
      Size = 24
    end
    object qFrequenciaFREQ55: TBytesField
      FieldName = 'FREQ55'
      Size = 24
    end
    object qFrequenciaFREQ56: TBytesField
      FieldName = 'FREQ56'
      Size = 24
    end
    object qFrequenciaFREQ57: TBytesField
      FieldName = 'FREQ57'
      Size = 24
    end
    object qFrequenciaFREQ58: TBytesField
      FieldName = 'FREQ58'
      Size = 24
    end
    object qFrequenciaFREQ59: TBytesField
      FieldName = 'FREQ59'
      Size = 24
    end
    object qFrequenciaFREQ60: TBytesField
      FieldName = 'FREQ60'
      Size = 24
    end
    object qFrequenciaFREQ61: TBytesField
      FieldName = 'FREQ61'
      Size = 24
    end
    object qFrequenciaFREQ62: TBytesField
      FieldName = 'FREQ62'
      Size = 24
    end
    object qFrequenciaFREQ63: TBytesField
      FieldName = 'FREQ63'
      Size = 24
    end
    object qFrequenciaFREQ64: TBytesField
      FieldName = 'FREQ64'
      Size = 24
    end
    object qFrequenciaFREQ65: TBytesField
      FieldName = 'FREQ65'
      Size = 24
    end
    object qFrequenciaFREQ66: TBytesField
      FieldName = 'FREQ66'
      Size = 24
    end
    object qFrequenciaFREQ67: TBytesField
      FieldName = 'FREQ67'
      Size = 24
    end
    object qFrequenciaFREQ68: TBytesField
      FieldName = 'FREQ68'
      Size = 24
    end
    object qFrequenciaFREQ69: TBytesField
      FieldName = 'FREQ69'
      Size = 24
    end
    object qFrequenciaFREQ70: TBytesField
      FieldName = 'FREQ70'
      Size = 24
    end
    object qFrequenciaFREQ71: TBytesField
      FieldName = 'FREQ71'
      Size = 24
    end
    object qFrequenciaFREQ72: TBytesField
      FieldName = 'FREQ72'
      Size = 24
    end
    object qFrequenciaFREQ73: TBytesField
      FieldName = 'FREQ73'
      Size = 24
    end
    object qFrequenciaFREQ74: TBytesField
      FieldName = 'FREQ74'
      Size = 24
    end
    object qFrequenciaFREQ75: TBytesField
      FieldName = 'FREQ75'
      Size = 24
    end
    object qFrequenciaFREQ76: TBytesField
      FieldName = 'FREQ76'
      Size = 24
    end
    object qFrequenciaFREQ77: TBytesField
      FieldName = 'FREQ77'
      Size = 24
    end
    object qFrequenciaFREQ78: TBytesField
      FieldName = 'FREQ78'
      Size = 24
    end
    object qFrequenciaFREQ79: TBytesField
      FieldName = 'FREQ79'
      Size = 24
    end
    object qFrequenciaFREQ80: TBytesField
      FieldName = 'FREQ80'
      Size = 24
    end
    object qFrequenciaFREQ81: TBytesField
      FieldName = 'FREQ81'
      Size = 24
    end
    object qFrequenciaFREQ82: TBytesField
      FieldName = 'FREQ82'
      Size = 24
    end
    object qFrequenciaFREQ83: TBytesField
      FieldName = 'FREQ83'
      Size = 24
    end
    object qFrequenciaFREQ84: TBytesField
      FieldName = 'FREQ84'
      Size = 24
    end
    object qFrequenciaFREQ85: TBytesField
      FieldName = 'FREQ85'
      Size = 24
    end
    object qFrequenciaFREQ86: TBytesField
      FieldName = 'FREQ86'
      Size = 24
    end
    object qFrequenciaFREQ87: TBytesField
      FieldName = 'FREQ87'
      Size = 24
    end
    object qFrequenciaFREQ88: TBytesField
      FieldName = 'FREQ88'
      Size = 24
    end
    object qFrequenciaFREQ89: TBytesField
      FieldName = 'FREQ89'
      Size = 24
    end
    object qFrequenciaFREQ90: TBytesField
      FieldName = 'FREQ90'
      Size = 24
    end
    object qFrequenciaFREQ91: TBytesField
      FieldName = 'FREQ91'
      Size = 24
    end
    object qFrequenciaFREQ92: TBytesField
      FieldName = 'FREQ92'
      Size = 24
    end
    object qFrequenciaFREQ93: TBytesField
      FieldName = 'FREQ93'
      Size = 24
    end
    object qFrequenciaFREQ94: TBytesField
      FieldName = 'FREQ94'
      Size = 24
    end
    object qFrequenciaFREQ95: TBytesField
      FieldName = 'FREQ95'
      Size = 24
    end
    object qFrequenciaFREQ96: TBytesField
      FieldName = 'FREQ96'
      Size = 24
    end
    object qFrequenciaFREQ97: TBytesField
      FieldName = 'FREQ97'
      Size = 24
    end
    object qFrequenciaFREQ98: TBytesField
      FieldName = 'FREQ98'
      Size = 24
    end
    object qFrequenciaFREQ99: TBytesField
      FieldName = 'FREQ99'
      Size = 24
    end
    object qFrequenciaFREQ100: TBytesField
      FieldName = 'FREQ100'
      Size = 24
    end
  end
  object dsFrequencia: TDataSource
    AutoEdit = False
    DataSet = qFrequencia
    Left = 224
    Top = 128
  end
  object qTotalFaltas: TUMZQuery
    Connection = DM.db
    SQL.Strings = (
      'select COUNT(*) QTD  from DIARIO_FREQUENCIA'
      'WHERE CODALUNO = :CODALUNO AND'
      'DISCIPLINA = :DISCIPLINA AND TURMA = :TURMA'
      'AND FREQUENCIA = :FREQUENCIA')
    Params = <
      item
        DataType = ftUnknown
        Name = 'CODALUNO'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'DISCIPLINA'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'TURMA'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'FREQUENCIA'
        ParamType = ptUnknown
      end>
    Left = 336
    Top = 240
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'CODALUNO'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'DISCIPLINA'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'TURMA'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'FREQUENCIA'
        ParamType = ptUnknown
      end>
  end
  object dsAlunos: TDataSource
    AutoEdit = False
    DataSet = qAlunos
    Left = 376
    Top = 296
  end
  object qAlunos: TUMZQuery
    Connection = DM.db
    UpdateObject = updAlunos
    CachedUpdates = True
    SQL.Strings = (
      'SELECT'
      #9'A.NM_PESSOA NOME,'
      #9'DM.CODALUNO,'
      #9'DM.DISCIPLINA,'
      #9'DM.TURMA,'
      #9'DM.ANOSEMESTRE,'
      
        '  CASE WHEN SUM(CASE WHEN DGP.DT_SAIDA IS NULL THEN 1 ELSE 0 END' +
        ') > 0 THEN S.DS_SITUACAO ELSE '#39'INATIVA'#39' END SITUACAO,'
      #9#39#39' AS OBSERVACAO,'
      #9'M.DATASAIDA AS DATA_SAIDA'
      'FROM'
      #9'DIARIO_MATRICULAS DM'
      #9'INNER JOIN PESSOAS A ON (A.CD_PESSOA = DM.CODALUNO)'
      #9'INNER JOIN FICHAINDIVIDUAL F ON ('
      #9#9'F.CODIGOALUNO = DM.CODALUNO'
      #9#9'AND F.TURMA = DM.TURMA'
      #9#9'AND F.ANOSEMESTRE = DM.ANOSEMESTRE'
      #9#9'AND F.DISCIPLINA = DM.DISCIPLINA'
      #9')'
      '  INNER JOIN SITUACAO S ON (S.CD_SITUACAO = F.SITUACAO)  '
      #9'INNER JOIN MATRICULAS M ON ('
      #9#9'F.CODIGOALUNO = M.CODIGOALUNO'
      #9#9'AND F.TURMAMATRICULA = M.TURMA'
      #9#9'AND F.ANOSEMESTRE = M.ANOSEMESTRE'
      #9')'
      #9'LEFT JOIN DIARIO_GRUPOS_PESSOAS DGP ON ('
      #9#9'DGP.CD_GRUPO = DM.CD_grupo'
      #9#9'AND DGP.cd_pessoa = DM.CODALUNO'
      #9')'
      'WHERE'
      #9'DM.TURMA LIKE :TURMA'
      #9'AND DM.DISCIPLINA = :DISCIPLINA'
      #9'AND BIMESTRE = :BIMESTRE'
      #9'AND DM.ANOSEMESTRE = :ANOSEMESTRE'
      
        #9'AND CASE WHEN :CD_GRUPO IS NOT NULL THEN DGP.CD_GRUPO = :CD_GRU' +
        'PO ELSE 1=1 END'
      'GROUP BY'
      #9'DM.CODALUNO,'
      #9'DM.DISCIPLINA,'
      #9'DM.TURMA,'
      #9'DM.ANOSEMESTRE'
      'ORDER BY'
      #9'A.NM_PESSOA')
    Params = <
      item
        DataType = ftString
        Name = 'TURMA'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'DISCIPLINA'
        ParamType = ptUnknown
      end
      item
        DataType = ftSmallint
        Name = 'BIMESTRE'
        ParamType = ptUnknown
      end
      item
        DataType = ftSmallint
        Name = 'ANOSEMESTRE'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'CD_GRUPO'
        ParamType = ptUnknown
      end>
    DataSource = dsTurmas
    Left = 328
    Top = 296
    ParamData = <
      item
        DataType = ftString
        Name = 'TURMA'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'DISCIPLINA'
        ParamType = ptUnknown
      end
      item
        DataType = ftSmallint
        Name = 'BIMESTRE'
        ParamType = ptUnknown
      end
      item
        DataType = ftSmallint
        Name = 'ANOSEMESTRE'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'CD_GRUPO'
        ParamType = ptUnknown
      end>
    object qAlunosCODALUNO: TIntegerField
      DisplayLabel = 'Cod. Aluno'
      FieldName = 'CODALUNO'
      Required = True
    end
    object qAlunosDISCIPLINA: TIntegerField
      FieldName = 'DISCIPLINA'
      Required = True
    end
    object qAlunosTURMA: TStringField
      FieldName = 'TURMA'
      Required = True
      Size = 50
    end
    object qAlunosANOSEMESTRE: TSmallintField
      FieldName = 'ANOSEMESTRE'
      Required = True
    end
    object qAlunosDATA_SAIDA: TDateField
      DisplayLabel = 'Data da Sa'#237'da'
      FieldName = 'DATA_SAIDA'
      DisplayFormat = 'dd/mm/yy'
      EditMask = '!99/99/00;1;_'
    end
    object qAlunosNOME: TStringField
      DisplayLabel = 'Nome do Aluno'
      FieldName = 'NOME'
      Size = 100
    end
    object qAlunosSITUACAO: TStringField
      FieldName = 'SITUACAO'
      Size = 15
    end
  end
  object qFicha: TUMZQuery
    Connection = DM.db
    AfterCancel = qAulasAfterInsert
    SQL.Strings = (
      
        'select DIARIO_FICHA.*, DIARIO_MATRICULAS.NOME, DIARIO_MATRICULAS' +
        '.FALTAS FALTAS_BIM '
      'from DIARIO_FICHA, DIARIO_MATRICULAS'
      'WHERE'
      '  DIARIO_MATRICULAS.CODALUNO = DIARIO_FICHA.CODALUNO AND '
      
        '  DISCIPLINA = :DISCIPLINA AND TURMA = :TURMA  AND ANOSEMESTRE =' +
        ' :ANOSEMESTRE'
      'ORDER BY DIARIO_MATRICULAS.NOME ')
    Params = <
      item
        DataType = ftSmallint
        Name = 'DISCIPLINA'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'TURMA'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'ANOSEMESTRE'
        ParamType = ptUnknown
      end>
    DataSource = dsTurmas
    Left = 330
    Top = 72
    ParamData = <
      item
        DataType = ftSmallint
        Name = 'DISCIPLINA'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'TURMA'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'ANOSEMESTRE'
        ParamType = ptUnknown
      end>
    object qFichaCODALUNO: TIntegerField
      DisplayLabel = 'Cod. Aluno'
      FieldName = 'CODALUNO'
      Required = True
    end
    object qFichaDISCIPLINA: TIntegerField
      FieldName = 'DISCIPLINA'
      Required = True
    end
    object qFichaTURMA: TStringField
      FieldName = 'TURMA'
      Required = True
      Size = 50
    end
    object qFichaNOTA2: TFloatField
      DisplayLabel = '2'#186' Bim.'
      FieldName = 'NOTA2'
      OnGetText = qFichaNOTA1GetText
      DisplayFormat = '0.0'
      EditFormat = '0.0'
      Precision = 9
    end
    object qFichaNOTA3: TFloatField
      DisplayLabel = '3'#186' Bim.'
      FieldName = 'NOTA3'
      OnGetText = qFichaNOTA1GetText
      DisplayFormat = '0.0'
      EditFormat = '0.0'
      Precision = 9
    end
    object qFichaNOTA4: TFloatField
      DisplayLabel = '4'#186' Bim.'
      FieldName = 'NOTA4'
      OnGetText = qFichaNOTA1GetText
      DisplayFormat = '0.0'
      EditFormat = '0.0'
      Precision = 9
    end
    object qFichaNOTA1: TFloatField
      DisplayLabel = '1'#186' Bim.'
      FieldName = 'NOTA1'
      OnGetText = qFichaNOTA1GetText
      DisplayFormat = '0.0'
      EditFormat = '0.0'
      Precision = 9
    end
    object qFichaFALTAS: TSmallintField
      DisplayLabel = 'Faltas'
      FieldName = 'FALTAS'
      DisplayFormat = '0'
    end
    object qFichaMedia: TFloatField
      DisplayLabel = 'M'#233'dia'
      FieldKind = fkCalculated
      FieldName = 'Media'
      OnGetText = qFichaMediaGetText
      DisplayFormat = '0.00'
      EditFormat = '0.00'
      Calculated = True
    end
    object qFichaNotaExame: TFloatField
      FieldKind = fkCalculated
      FieldName = 'NotaExame'
      OnGetText = qFichaNotaExameGetText
      DisplayFormat = '0.0'
      Calculated = True
    end
    object qFichaNOME: TStringField
      DisplayLabel = 'Nome do Aluno'
      FieldName = 'NOME'
      Size = 100
    end
    object qFichaFALTAS_BIM: TSmallintField
      DisplayLabel = 'Faltas'
      FieldName = 'FALTAS_BIM'
    end
    object qFichaANOSEMESTRE: TSmallintField
      FieldName = 'ANOSEMESTRE'
      Required = True
    end
    object qFichaTotalFaltas: TFloatField
      FieldKind = fkCalculated
      FieldName = 'TotalFaltas'
      Calculated = True
    end
  end
  object dsFicha: TDataSource
    AutoEdit = False
    DataSet = qFicha
    Left = 376
    Top = 72
  end
  object GravaFaltas: TUMZQuery
    Connection = DM.db
    SQL.Strings = (
      'Update DIARIO_MATRICULAS  '
      'Set FALTAS = :FALTAS'
      'WHERE '
      '   CODALUNO = :CODALUNO AND'
      '   DISCIPLINA = :DISCIPLINA AND'
      '   TURMA = :TURMA AND'
      '   ANOSEMESTRE = :ANOSEMESTRE')
    Params = <
      item
        DataType = ftUnknown
        Name = 'FALTAS'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'CODALUNO'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'DISCIPLINA'
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
    Left = 184
    Top = 288
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'FALTAS'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'CODALUNO'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'DISCIPLINA'
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
  object qDarPresenca: TUMZQuery
    Connection = DM.db
    Params = <>
    Left = 264
    Top = 216
  end
  object qRetirarPresenca: TUMZQuery
    Connection = DM.db
    Params = <>
    Left = 368
    Top = 152
  end
  object updAlunos: TZUpdateSQL
    DeleteSQL.Strings = (
      'delete from DIARIO_MATRICULAS'
      'where'
      '  CodAluno = :OLD_CodAluno and'
      '  TURMA = :OLD_TURMA and'
      '  ANOSEMESTRE = :OLD_ANOSEMESTRE and'
      '  DISCIPLINA = :OLD_DISCIPLINA')
    InsertSQL.Strings = (
      'insert into DIARIO_MATRICULAS'
      '  (SITUACAO)'
      'values'
      '  (:SITUACAO)')
    ModifySQL.Strings = (
      'update DIARIO_MATRICULAS'
      'set'
      '  SITUACAO = :SITUACAO'
      'where'
      '  CodAluno = :OLD_CodAluno and'
      '  TURMA = :OLD_TURMA and'
      '  ANOSEMESTRE = :OLD_ANOSEMESTRE and'
      '  DISCIPLINA = :OLD_DISCIPLINA')
    UseSequenceFieldForRefreshSQL = False
    Left = 280
    Top = 296
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'SITUACAO'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'OLD_CodAluno'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'OLD_TURMA'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'OLD_ANOSEMESTRE'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'OLD_DISCIPLINA'
        ParamType = ptUnknown
      end>
  end
  object updNotas: TZUpdateSQL
    DeleteSQL.Strings = (
      'delete from DIARIO_MATRICULAS'
      'where'
      '  codaluno = :OLD_codaluno and'
      '  turma = :OLD_turma and'
      '  anosemestre = :OLD_anosemestre and'
      '  disciplina = :OLD_disciplina and'
      '  bimestre = :OLD_bimestre')
    InsertSQL.Strings = (
      'insert into DIARIO_MATRICULAS'
      
        '  (nota1, nota2, nota3, nota4, nota5, nota6, nota7, nota8, nota9' +
        ', nota10, '
      '   nota_especial, media, ajuste)'
      'values'
      
        '  (:nota1, :nota2, :nota3, :nota4, :nota5, :nota6, :nota7, :nota' +
        '8, :nota9, '
      '   :nota10, :nota_especial, :media, :ajuste)')
    ModifySQL.Strings = (
      'update DIARIO_MATRICULAS'
      'set'
      '  nota1 = :nota1,'
      '  nota2 = :nota2,'
      '  nota3 = :nota3,'
      '  nota4 = :nota4,'
      '  nota5 = :nota5,'
      '  nota6 = :nota6,'
      '  nota7 = :nota7,'
      '  nota8 = :nota8,'
      '  nota9 = :nota9,'
      '  nota10 = :nota10,'
      '  nota11 = :nota11,'
      '  nota12 = :nota12,'
      '  nota13 = :nota13,'
      '  nota14 = :nota14,'
      '  nota15 = :nota15,'
      '  nota16 = :nota16,'
      '  nota17 = :nota17,'
      '  nota18 = :nota18,'
      '  nota19 = :nota19,'
      '  nota20 = :nota20,'
      '  nota21 = :nota21,'
      '  nota22 = :nota22,'
      '  nota23 = :nota23,'
      '  nota24 = :nota24,'
      '  nota25 = :nota25,'
      '  nota_especial = :nota_especial,'
      '  media = :media,'
      '  ajuste = :ajuste'
      'where'
      '  codaluno = :OLD_codaluno and'
      '  turma = :OLD_turma and'
      '  anosemestre = :OLD_anosemestre and'
      '  disciplina = :OLD_disciplina and'
      '  bimestre = :OLD_bimestre')
    UseSequenceFieldForRefreshSQL = False
    Left = 112
    Top = 184
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'nota1'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'nota2'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'nota3'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'nota4'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'nota5'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'nota6'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'nota7'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'nota8'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'nota9'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'nota10'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'nota11'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'nota12'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'nota13'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'nota14'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'nota15'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'nota16'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'nota17'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'nota18'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'nota19'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'nota20'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'nota21'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'nota22'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'nota23'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'nota24'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'nota25'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'nota_especial'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'media'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'ajuste'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'OLD_codaluno'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'OLD_turma'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'OLD_anosemestre'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'OLD_disciplina'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'OLD_bimestre'
        ParamType = ptUnknown
      end>
  end
  object updFreq: TZUpdateSQL
    DeleteSQL.Strings = (
      'delete from DIARIO_MATRICULAS'
      'where'
      '  codaluno = :OLD_codaluno and'
      '  turma = :OLD_turma and'
      '  anosemestre = :OLD_anosemestre and'
      '  disciplina = :OLD_disciplina and'
      '  bimestre = :OLD_bimestre')
    InsertSQL.Strings = (
      'insert into DIARIO_MATRICULAS'
      
        '  (faltas, freq1, freq2, freq3, freq4, freq5, freq6, freq7, freq' +
        '8, freq9, '
      
        '   freq10, freq11, freq12, freq13, freq14, freq15, freq16, freq1' +
        '7, freq18, '
      
        '   freq19, freq20, freq21, freq22, freq23, freq24, freq25, freq2' +
        '6, freq27, '
      
        '   freq28, freq29, freq30, freq31, freq32, freq33, freq34, freq3' +
        '5, freq36, '
      
        '   freq37, freq38, freq39, freq40, freq41, freq42, freq43, freq4' +
        '4, freq45, '
      
        '   freq46, freq47, freq48, freq49, freq50, freq51, freq52, freq5' +
        '3, freq54, '
      
        '   freq55, freq56, freq57, freq58, freq59, freq60, freq61, freq6' +
        '2, freq63, '
      
        '   freq64, freq65, freq66, freq67, freq68, freq69, freq70, freq7' +
        '1, freq72, '
      
        '   freq73, freq74, freq75, freq76, freq77, freq78, freq79, freq8' +
        '0, freq81, '
      
        '   freq82, freq83, freq84, freq85, freq86, freq87, freq88, freq8' +
        '9, freq90, '
      
        '   freq91, freq92, freq93, freq94, freq95, freq96, freq97, freq9' +
        '8, freq99)'
      'values'
      
        '  (:faltas, :freq1, :freq2, :freq3, :freq4, :freq5, :freq6, :fre' +
        'q7, :freq8, '
      
        '   :freq9, :freq10, :freq11, :freq12, :freq13, :freq14, :freq15,' +
        ' :freq16, '
      
        '   :freq17, :freq18, :freq19, :freq20, :freq21, :freq22, :freq23' +
        ', :freq24, '
      
        '   :freq25, :freq26, :freq27, :freq28, :freq29, :freq30, :freq31' +
        ', :freq32, '
      
        '   :freq33, :freq34, :freq35, :freq36, :freq37, :freq38, :freq39' +
        ', :freq40, '
      
        '   :freq41, :freq42, :freq43, :freq44, :freq45, :freq46, :freq47' +
        ', :freq48, '
      
        '   :freq49, :freq50, :freq51, :freq52, :freq53, :freq54, :freq55' +
        ', :freq56, '
      
        '   :freq57, :freq58, :freq59, :freq60, :freq61, :freq62, :freq63' +
        ', :freq64, '
      
        '   :freq65, :freq66, :freq67, :freq68, :freq69, :freq70, :freq71' +
        ', :freq72, '
      
        '   :freq73, :freq74, :freq75, :freq76, :freq77, :freq78, :freq79' +
        ', :freq80, '
      
        '   :freq81, :freq82, :freq83, :freq84, :freq85, :freq86, :freq87' +
        ', :freq88, '
      
        '   :freq89, :freq90, :freq91, :freq92, :freq93, :freq94, :freq95' +
        ', :freq96, '
      '   :freq97, :freq98, :freq99)')
    ModifySQL.Strings = (
      'update DIARIO_MATRICULAS'
      'set'
      '  faltas = :faltas,'
      '  freq1 = :freq1,'
      '  freq2 = :freq2,'
      '  freq3 = :freq3,'
      '  freq4 = :freq4,'
      '  freq5 = :freq5,'
      '  freq6 = :freq6,'
      '  freq7 = :freq7,'
      '  freq8 = :freq8,'
      '  freq9 = :freq9,'
      '  freq10 = :freq10,'
      '  freq11 = :freq11,'
      '  freq12 = :freq12,'
      '  freq13 = :freq13,'
      '  freq14 = :freq14,'
      '  freq15 = :freq15,'
      '  freq16 = :freq16,'
      '  freq17 = :freq17,'
      '  freq18 = :freq18,'
      '  freq19 = :freq19,'
      '  freq20 = :freq20,'
      '  freq21 = :freq21,'
      '  freq22 = :freq22,'
      '  freq23 = :freq23,'
      '  freq24 = :freq24,'
      '  freq25 = :freq25,'
      '  freq26 = :freq26,'
      '  freq27 = :freq27,'
      '  freq28 = :freq28,'
      '  freq29 = :freq29,'
      '  freq30 = :freq30,'
      '  freq31 = :freq31,'
      '  freq32 = :freq32,'
      '  freq33 = :freq33,'
      '  freq34 = :freq34,'
      '  freq35 = :freq35,'
      '  freq36 = :freq36,'
      '  freq37 = :freq37,'
      '  freq38 = :freq38,'
      '  freq39 = :freq39,'
      '  freq40 = :freq40,'
      '  freq41 = :freq41,'
      '  freq42 = :freq42,'
      '  freq43 = :freq43,'
      '  freq44 = :freq44,'
      '  freq45 = :freq45,'
      '  freq46 = :freq46,'
      '  freq47 = :freq47,'
      '  freq48 = :freq48,'
      '  freq49 = :freq49,'
      '  freq50 = :freq50,'
      '  freq51 = :freq51,'
      '  freq52 = :freq52,'
      '  freq53 = :freq53,'
      '  freq54 = :freq54,'
      '  freq55 = :freq55,'
      '  freq56 = :freq56,'
      '  freq57 = :freq57,'
      '  freq58 = :freq58,'
      '  freq59 = :freq59,'
      '  freq60 = :freq60,'
      '  freq61 = :freq61,'
      '  freq62 = :freq62,'
      '  freq63 = :freq63,'
      '  freq64 = :freq64,'
      '  freq65 = :freq65,'
      '  freq66 = :freq66,'
      '  freq67 = :freq67,'
      '  freq68 = :freq68,'
      '  freq69 = :freq69,'
      '  freq70 = :freq70,'
      '  freq71 = :freq71,'
      '  freq72 = :freq72,'
      '  freq73 = :freq73,'
      '  freq74 = :freq74,'
      '  freq75 = :freq75,'
      '  freq76 = :freq76,'
      '  freq77 = :freq77,'
      '  freq78 = :freq78,'
      '  freq79 = :freq79,'
      '  freq80 = :freq80,'
      '  freq81 = :freq81,'
      '  freq82 = :freq82,'
      '  freq83 = :freq83,'
      '  freq84 = :freq84,'
      '  freq85 = :freq85,'
      '  freq86 = :freq86,'
      '  freq87 = :freq87,'
      '  freq88 = :freq88,'
      '  freq89 = :freq89,'
      '  freq90 = :freq90,'
      '  freq91 = :freq91,'
      '  freq92 = :freq92,'
      '  freq93 = :freq93,'
      '  freq94 = :freq94,'
      '  freq95 = :freq95,'
      '  freq96 = :freq96,'
      '  freq97 = :freq97,'
      '  freq98 = :freq98,'
      '  freq99 = :freq99'
      'where'
      '  codaluno = :OLD_codaluno and'
      '  turma = :OLD_turma and'
      '  anosemestre = :OLD_anosemestre and'
      '  disciplina = :OLD_disciplina and'
      '  bimestre = :OLD_bimestre')
    UseSequenceFieldForRefreshSQL = False
    Left = 280
    Top = 128
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'faltas'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'freq1'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'freq2'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'freq3'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'freq4'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'freq5'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'freq6'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'freq7'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'freq8'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'freq9'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'freq10'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'freq11'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'freq12'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'freq13'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'freq14'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'freq15'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'freq16'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'freq17'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'freq18'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'freq19'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'freq20'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'freq21'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'freq22'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'freq23'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'freq24'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'freq25'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'freq26'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'freq27'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'freq28'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'freq29'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'freq30'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'freq31'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'freq32'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'freq33'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'freq34'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'freq35'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'freq36'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'freq37'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'freq38'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'freq39'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'freq40'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'freq41'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'freq42'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'freq43'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'freq44'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'freq45'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'freq46'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'freq47'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'freq48'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'freq49'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'freq50'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'freq51'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'freq52'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'freq53'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'freq54'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'freq55'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'freq56'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'freq57'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'freq58'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'freq59'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'freq60'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'freq61'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'freq62'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'freq63'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'freq64'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'freq65'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'freq66'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'freq67'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'freq68'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'freq69'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'freq70'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'freq71'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'freq72'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'freq73'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'freq74'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'freq75'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'freq76'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'freq77'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'freq78'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'freq79'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'freq80'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'freq81'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'freq82'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'freq83'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'freq84'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'freq85'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'freq86'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'freq87'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'freq88'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'freq89'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'freq90'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'freq91'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'freq92'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'freq93'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'freq94'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'freq95'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'freq96'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'freq97'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'freq98'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'freq99'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'OLD_codaluno'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'OLD_turma'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'OLD_anosemestre'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'OLD_disciplina'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'OLD_bimestre'
        ParamType = ptUnknown
      end>
  end
  object qDescricoes: TUMZQuery
    Connection = DM.db
    UpdateObject = updDescricoes
    CachedUpdates = True
    BeforeInsert = qNotasBeforeInsert
    BeforePost = qNotasBeforePost
    AfterPost = qNotasAfterPost
    SQL.Strings = (
      'SELECT'
      #9'A.NM_PESSOA NOME,'
      
        '  CASE WHEN (F.SITUACAO NOT IN (3, 4, 5, 6)) AND (SUM(CASE WHEN ' +
        'DGP.DT_SAIDA IS NULL THEN 1 ELSE 0 END) > 0) THEN 1 ELSE 0 END A' +
        'TIVO,'
      
        #9'CASE WHEN SUM(CASE WHEN DGP.DT_SAIDA IS NULL THEN 1 ELSE 0 END)' +
        ' > 0 THEN S.DS_SITUACAO ELSE '#39'INATIVA'#39' END SITUACAO,'
      #9'DD.*'
      'FROM'
      #9'DIARIOS_DESCRICOES DD'
      #9'INNER JOIN PESSOAS A ON (A.CD_PESSOA = DD.CD_PESSOA)'
      #9'INNER JOIN FICHAINDIVIDUAL F ON ('
      #9#9'F.CODIGOALUNO = DD.CD_PESSOA'
      #9#9'AND F.TURMA = DD.CD_TURMA'
      #9#9'AND F.ANOSEMESTRE = DD.NR_ANOSEMESTRE'
      #9#9'AND F.DISCIPLINA = DD.NR_DISCIPLINA'
      #9')'
      #9'INNER JOIN SITUACAO S ON (S.CD_SITUACAO = F.SITUACAO)'
      
        #9'LEFT JOIN DIARIO_GRUPOS_PESSOAS DGP ON (DGP.CD_PESSOA = A.CD_PE' +
        'SSOA)'
      'WHERE'
      #9'DD.CD_TURMA = :TURMA'
      #9'AND DD.NR_DISCIPLINA = :DISCIPLINA'
      #9'AND DD.NR_ANOSEMESTRE = :ANOSEMESTRE'
      #9'AND DD.NR_AVALIACAO = :BIMESTRE'
      
        #9'AND CASE WHEN :CD_GRUPO IS NOT NULL THEN DGP.CD_GRUPO = :CD_GRU' +
        'PO ELSE 1=1 END'#9
      'GROUP BY'
      #9'A.CD_PESSOA'#9
      'ORDER BY'
      #9'A.NM_PESSOA'
      '')
    Params = <
      item
        DataType = ftString
        Name = 'TURMA'
        ParamType = ptUnknown
        Size = 16
      end
      item
        DataType = ftInteger
        Name = 'DISCIPLINA'
        ParamType = ptUnknown
        Size = 4
      end
      item
        DataType = ftSmallint
        Name = 'ANOSEMESTRE'
        ParamType = ptUnknown
        Size = 2
      end
      item
        DataType = ftSmallint
        Name = 'BIMESTRE'
        ParamType = ptUnknown
        Size = 2
      end
      item
        DataType = ftUnknown
        Name = 'CD_GRUPO'
        ParamType = ptUnknown
      end>
    DataSource = dsTurmas
    Left = 16
    Top = 344
    ParamData = <
      item
        DataType = ftString
        Name = 'TURMA'
        ParamType = ptUnknown
        Size = 16
      end
      item
        DataType = ftInteger
        Name = 'DISCIPLINA'
        ParamType = ptUnknown
        Size = 4
      end
      item
        DataType = ftSmallint
        Name = 'ANOSEMESTRE'
        ParamType = ptUnknown
        Size = 2
      end
      item
        DataType = ftSmallint
        Name = 'BIMESTRE'
        ParamType = ptUnknown
        Size = 2
      end
      item
        DataType = ftUnknown
        Name = 'CD_GRUPO'
        ParamType = ptUnknown
      end>
    object qDescricoesNOME: TStringField
      FieldName = 'NOME'
      Size = 60
    end
    object qDescricoesnr_anosemestre: TSmallintField
      FieldName = 'nr_anosemestre'
    end
    object qDescricoescd_turma: TStringField
      FieldName = 'cd_turma'
      Size = 50
    end
    object qDescricoesnr_disciplina: TIntegerField
      FieldName = 'nr_disciplina'
    end
    object qDescricoescd_pessoa: TIntegerField
      FieldName = 'cd_pessoa'
    end
    object qDescricoesnr_avaliacao: TSmallintField
      FieldName = 'nr_avaliacao'
    end
    object qDescricoesds_avaliacao: TMemoField
      FieldName = 'ds_avaliacao'
      BlobType = ftMemo
      Size = 1
    end
    object qDescricoesativo: TLargeintField
      FieldName = 'ativo'
    end
    object qDescricoessituacao: TStringField
      FieldName = 'situacao'
      Size = 15
    end
  end
  object dsDescricoes: TDataSource
    DataSet = qDescricoes
    OnDataChange = dsDescricoesDataChange
    Left = 88
    Top = 344
  end
  object updDescricoes: TZUpdateSQL
    DeleteSQL.Strings = (
      'delete from DIARIOS_DESCRICOES'
      'where'
      '  nr_anosemestre = :OLD_nr_anosemestre and'
      '  cd_turma = :OLD_cd_turma and'
      '  nr_disciplina = :OLD_nr_disciplina and'
      '  cd_pessoa = :OLD_cd_pessoa and'
      '  nr_avaliacao = :OLD_nr_avaliacao')
    InsertSQL.Strings = (
      'insert into DIARIOS_DESCRICOES'
      
        '  (nr_anosemestre, cd_turma, nr_disciplina, cd_pessoa, nr_avalia' +
        'cao, ds_avaliacao)'
      'values'
      
        '  (:nr_anosemestre, :cd_turma, :nr_disciplina, :cd_pessoa, :nr_a' +
        'valiacao, '
      '   :ds_avaliacao)')
    ModifySQL.Strings = (
      'update DIARIOS_DESCRICOES'
      'set'
      '  nr_anosemestre = :nr_anosemestre,'
      '  cd_turma = :cd_turma,'
      '  nr_disciplina = :nr_disciplina,'
      '  cd_pessoa = :cd_pessoa,'
      '  nr_avaliacao = :nr_avaliacao,'
      '  ds_avaliacao = :ds_avaliacao'
      'where'
      '  nr_anosemestre = :OLD_nr_anosemestre and'
      '  cd_turma = :OLD_cd_turma and'
      '  nr_disciplina = :OLD_nr_disciplina and'
      '  cd_pessoa = :OLD_cd_pessoa and'
      '  nr_avaliacao = :OLD_nr_avaliacao')
    UseSequenceFieldForRefreshSQL = False
    Left = 160
    Top = 344
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
        Name = 'nr_disciplina'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'cd_pessoa'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'nr_avaliacao'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'ds_avaliacao'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'OLD_nr_anosemestre'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'OLD_cd_turma'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'OLD_nr_disciplina'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'OLD_cd_pessoa'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'OLD_nr_avaliacao'
        ParamType = ptUnknown
      end>
  end
  object qyAux1: TUMZQuery
    Connection = DM.db
    Params = <>
    Left = 40
    Top = 16
  end
  object qyAux2: TUMZQuery
    Connection = DM.db
    Params = <>
    Left = 104
    Top = 16
  end
  object qDiaLog: TUMZQuery
    Connection = DM.db
    Params = <>
    SQLList.Strings = (
      
        'mysql-5=INSERT INTO diario_logs (  cd_professor,  cd_pessoa,  cd' +
        '_acao,  cd_atividade,  dt_log,  descricao,  cd_log_pai )'#13#10'VALUES' +
        ' ( :cd_professor, :cd_pessoa, :cd_acao, :cd_atividade, :dt_log, ' +
        ':descricao, :cd_log_pai )'
      
        'oracle=INSERT INTO diario_logs (  cd_professor,  cd_pessoa,  cd_' +
        'acao,  cd_atividade,  dt_log,  descricao,  cd_log_pai )'#13#10'VALUES ' +
        '( :cd_professor, :cd_pessoa, :cd_acao, :cd_atividade, TO_TIMESTA' +
        'MP(:dt_log, '#39'DD-MM-YYYY'#39'), :descricao, :cd_log_pai )')
    Left = 432
    Top = 240
  end
end
