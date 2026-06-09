unit uASQL;

interface

const
   SQL_VERIFICAR_ETAPA_DE_ALUNO = ' ' +
         'SELECT                              ' +
         '	IF(not isNull(nota_d10), 10,      ' +
         '	IF(not isNull(nota_d9), 9,        ' +
         '	IF(not isNull(nota_d8), 8,        ' +
         '	IF(not isNull(nota_d7), 7,        ' +
         '	IF(not isNull(nota_d6), 6,        ' +
         '	IF(not isNull(nota_d5), 5,        ' +
         '	IF(not isNull(nota_d4), 4,        ' +
         '	IF(not isNull(nota_d3), 3,        ' +
         '	IF(not isNull(nota_d2), 2,        ' +
         '	IF(not isNull(nota_d1), 1, -1)))))))))) AS nr_etapa ' +
         'FROM                                ' +
         '	fichaindividual                   ' +
         'WHERE                               ' +
         '	anosemestre = :nr_anosemestre AND ' +
         '	turma = :cd_turma AND             ' +
         '	codigoaluno = :cd_pessoa          ' +
         ' ';

   SQL_UPDATE_FI_PERIODOS = ' ' +
         'UPDATE                                   ' +
         '  fichaindividual                        ' +
         'SET                                      ' +
         '  db_media_periodo:pPeriodo = :pFormula, ' +
         '  cd_situacao_periodo:pPeriodo = :pFormulaSituacao  ' +
         'WHERE                                    ' +
         '  (                                      ' +
         '     anosemestre = :nr_anosemestre AND   ' +
         '     turma = :cd_turma AND               ' +
         '     codigoaluno = :cd_pessoa            ' +
         '  ) AND (                                ' +
         '     :pCondicoes                         ' +
         '  )                                      ' +
         ' ';



   SQL_CONDICAO_INNER_NP = ' ' + // NECESSÁRIO PARA _NP APENAS !!
         '	INNER JOIN diario_matriculas m ON (m.anosemestre = fi.anosemestre AND m.turma = fi.turma AND m.codaluno = fi.codigoaluno AND m.disciplina = fi.disciplina AND m.bimestre <= :bimestre: ) ';

   SQL_CONDICAO_INNER_NPS = ' ' + // NECESSÁRIO PARA _NPS APENAS
         '		INNER JOIN diario_matriculas m_s ON (m_s.anosemestre = fi.anosemestre AND m_s.turma = fi.turma AND m_s.codaluno = fi.codigoaluno AND m_s.disciplina = fi.disciplina AND m_s.bimestre <= :bimestre: ) ' +
         '			LEFT JOIN diario_provas p_s_1 ON (p_s_1.sn_compoe=1 AND p_s_1.anosemestre = m_s.anosemestre AND p_s_1.turma = m_s.turma AND p_s_1.disciplina = m_s.disciplina AND p_s_1.nro_nota = 1) ' +
         '			LEFT JOIN diario_provas p_s_2 ON (p_s_2.sn_compoe=1 AND p_s_2.anosemestre = m_s.anosemestre AND p_s_2.turma = m_s.turma AND p_s_2.disciplina = m_s.disciplina AND p_s_2.nro_nota = 2) ' +
         '			LEFT JOIN diario_provas p_s_3 ON (p_s_3.sn_compoe=1 AND p_s_3.anosemestre = m_s.anosemestre AND p_s_3.turma = m_s.turma AND p_s_3.disciplina = m_s.disciplina AND p_s_3.nro_nota = 3) ' +
         '			LEFT JOIN diario_provas p_s_4 ON (p_s_4.sn_compoe=1 AND p_s_4.anosemestre = m_s.anosemestre AND p_s_4.turma = m_s.turma AND p_s_4.disciplina = m_s.disciplina AND p_s_4.nro_nota = 4) ' +
         '			LEFT JOIN diario_provas p_s_5 ON (p_s_5.sn_compoe=1 AND p_s_5.anosemestre = m_s.anosemestre AND p_s_5.turma = m_s.turma AND p_s_5.disciplina = m_s.disciplina AND p_s_5.nro_nota = 5) ' +
         '			LEFT JOIN diario_provas p_s_6 ON (p_s_6.sn_compoe=1 AND p_s_6.anosemestre = m_s.anosemestre AND p_s_6.turma = m_s.turma AND p_s_6.disciplina = m_s.disciplina AND p_s_6.nro_nota = 6) ' +
         '			LEFT JOIN diario_provas p_s_7 ON (p_s_7.sn_compoe=1 AND p_s_7.anosemestre = m_s.anosemestre AND p_s_7.turma = m_s.turma AND p_s_7.disciplina = m_s.disciplina AND p_s_7.nro_nota = 7) ' +
         '			LEFT JOIN diario_provas p_s_8 ON (p_s_8.sn_compoe=1 AND p_s_8.anosemestre = m_s.anosemestre AND p_s_8.turma = m_s.turma AND p_s_8.disciplina = m_s.disciplina AND p_s_8.nro_nota = 8) ' +
         '			LEFT JOIN diario_provas p_s_9 ON (p_s_9.sn_compoe=1 AND p_s_9.anosemestre = m_s.anosemestre AND p_s_9.turma = m_s.turma AND p_s_9.disciplina = m_s.disciplina AND p_s_9.nro_nota = 9) ' +
         '			LEFT JOIN diario_provas p_s_10 ON (p_s_10.sn_compoe=1 AND p_s_10.anosemestre = m_s.anosemestre AND p_s_10.turma = m_s.turma AND p_s_10.disciplina = m_s.disciplina AND p_s_10.nro_nota = 10) ' +
         '			LEFT JOIN diario_provas p_s_11 ON (p_s_11.sn_compoe=1 AND p_s_11.anosemestre = m_s.anosemestre AND p_s_11.turma = m_s.turma AND p_s_11.disciplina = m_s.disciplina AND p_s_11.nro_nota = 11) ' +
         '			LEFT JOIN diario_provas p_s_12 ON (p_s_12.sn_compoe=1 AND p_s_12.anosemestre = m_s.anosemestre AND p_s_12.turma = m_s.turma AND p_s_12.disciplina = m_s.disciplina AND p_s_12.nro_nota = 12) ' +
         '			LEFT JOIN diario_provas p_s_13 ON (p_s_13.sn_compoe=1 AND p_s_13.anosemestre = m_s.anosemestre AND p_s_13.turma = m_s.turma AND p_s_13.disciplina = m_s.disciplina AND p_s_13.nro_nota = 13) ' +
         '			LEFT JOIN diario_provas p_s_14 ON (p_s_14.sn_compoe=1 AND p_s_14.anosemestre = m_s.anosemestre AND p_s_14.turma = m_s.turma AND p_s_14.disciplina = m_s.disciplina AND p_s_14.nro_nota = 14) ' +
         '			LEFT JOIN diario_provas p_s_15 ON (p_s_15.sn_compoe=1 AND p_s_15.anosemestre = m_s.anosemestre AND p_s_15.turma = m_s.turma AND p_s_15.disciplina = m_s.disciplina AND p_s_15.nro_nota = 15) ' +
         '			LEFT JOIN diario_provas p_s_16 ON (p_s_16.sn_compoe=1 AND p_s_16.anosemestre = m_s.anosemestre AND p_s_16.turma = m_s.turma AND p_s_16.disciplina = m_s.disciplina AND p_s_16.nro_nota = 16) ' +
         '			LEFT JOIN diario_provas p_s_17 ON (p_s_17.sn_compoe=1 AND p_s_17.anosemestre = m_s.anosemestre AND p_s_17.turma = m_s.turma AND p_s_17.disciplina = m_s.disciplina AND p_s_17.nro_nota = 17) ' +
         '			LEFT JOIN diario_provas p_s_18 ON (p_s_18.sn_compoe=1 AND p_s_18.anosemestre = m_s.anosemestre AND p_s_18.turma = m_s.turma AND p_s_18.disciplina = m_s.disciplina AND p_s_18.nro_nota = 18) ' +
         '			LEFT JOIN diario_provas p_s_19 ON (p_s_19.sn_compoe=1 AND p_s_19.anosemestre = m_s.anosemestre AND p_s_19.turma = m_s.turma AND p_s_19.disciplina = m_s.disciplina AND p_s_19.nro_nota = 19) ' +
         '			LEFT JOIN diario_provas p_s_20 ON (p_s_20.sn_compoe=1 AND p_s_20.anosemestre = m_s.anosemestre AND p_s_20.turma = m_s.turma AND p_s_20.disciplina = m_s.disciplina AND p_s_20.nro_nota = 20) ';

   SQL_CONDICAO_INNER_NPNS = ' ' + // NECESSÁRIO PARA _NPNS APENAS
         '		INNER JOIN diario_matriculas m_ns ON (m_ns.anosemestre = fi.anosemestre AND m_ns.turma = fi.turma AND m_ns.codaluno = fi.codigoaluno AND m_ns.disciplina = fi.disciplina AND m_ns.bimestre <= :bimestre: ) ' +
         '			LEFT JOIN diario_provas p_ns_1 ON (p_ns_1.sn_compoe<>1 AND p_ns_1.anosemestre = m_ns.anosemestre AND p_ns_1.turma = m_ns.turma AND p_ns_1.disciplina = m_ns.disciplina AND p_ns_1.nro_nota = 1) ' +
         '			LEFT JOIN diario_provas p_ns_2 ON (p_ns_2.sn_compoe<>1 AND p_ns_2.anosemestre = m_ns.anosemestre AND p_ns_2.turma = m_ns.turma AND p_ns_2.disciplina = m_ns.disciplina AND p_ns_2.nro_nota = 2) ' +
         '			LEFT JOIN diario_provas p_ns_3 ON (p_ns_3.sn_compoe<>1 AND p_ns_3.anosemestre = m_ns.anosemestre AND p_ns_3.turma = m_ns.turma AND p_ns_3.disciplina = m_ns.disciplina AND p_ns_3.nro_nota = 3) ' +
         '			LEFT JOIN diario_provas p_ns_4 ON (p_ns_4.sn_compoe<>1 AND p_ns_4.anosemestre = m_ns.anosemestre AND p_ns_4.turma = m_ns.turma AND p_ns_4.disciplina = m_ns.disciplina AND p_ns_4.nro_nota = 4) ' +
         '			LEFT JOIN diario_provas p_ns_5 ON (p_ns_5.sn_compoe<>1 AND p_ns_5.anosemestre = m_ns.anosemestre AND p_ns_5.turma = m_ns.turma AND p_ns_5.disciplina = m_ns.disciplina AND p_ns_5.nro_nota = 5) ' +
         '			LEFT JOIN diario_provas p_ns_6 ON (p_ns_6.sn_compoe<>1 AND p_ns_6.anosemestre = m_ns.anosemestre AND p_ns_6.turma = m_ns.turma AND p_ns_6.disciplina = m_ns.disciplina AND p_ns_6.nro_nota = 6) ' +
         '			LEFT JOIN diario_provas p_ns_7 ON (p_ns_7.sn_compoe<>1 AND p_ns_7.anosemestre = m_ns.anosemestre AND p_ns_7.turma = m_ns.turma AND p_ns_7.disciplina = m_ns.disciplina AND p_ns_7.nro_nota = 7) ' +
         '			LEFT JOIN diario_provas p_ns_8 ON (p_ns_8.sn_compoe<>1 AND p_ns_8.anosemestre = m_ns.anosemestre AND p_ns_8.turma = m_ns.turma AND p_ns_8.disciplina = m_ns.disciplina AND p_ns_8.nro_nota = 8) ' +
         '			LEFT JOIN diario_provas p_ns_9 ON (p_ns_9.sn_compoe<>1 AND p_ns_9.anosemestre = m_ns.anosemestre AND p_ns_9.turma = m_ns.turma AND p_ns_9.disciplina = m_ns.disciplina AND p_ns_9.nro_nota = 9) ' +
         '			LEFT JOIN diario_provas p_ns_10 ON (p_ns_10.sn_compoe<>1 AND p_ns_10.anosemestre = m_ns.anosemestre AND p_ns_10.turma = m_ns.turma AND p_ns_10.disciplina = m_ns.disciplina AND p_ns_10.nro_nota = 10) ' +
         '			LEFT JOIN diario_provas p_ns_11 ON (p_ns_11.sn_compoe<>1 AND p_ns_11.anosemestre = m_ns.anosemestre AND p_ns_11.turma = m_ns.turma AND p_ns_11.disciplina = m_ns.disciplina AND p_ns_11.nro_nota = 11) ' +
         '			LEFT JOIN diario_provas p_ns_12 ON (p_ns_12.sn_compoe<>1 AND p_ns_12.anosemestre = m_ns.anosemestre AND p_ns_12.turma = m_ns.turma AND p_ns_12.disciplina = m_ns.disciplina AND p_ns_12.nro_nota = 12) ' +
         '			LEFT JOIN diario_provas p_ns_13 ON (p_ns_13.sn_compoe<>1 AND p_ns_13.anosemestre = m_ns.anosemestre AND p_ns_13.turma = m_ns.turma AND p_ns_13.disciplina = m_ns.disciplina AND p_ns_13.nro_nota = 13) ' +
         '			LEFT JOIN diario_provas p_ns_14 ON (p_ns_14.sn_compoe<>1 AND p_ns_14.anosemestre = m_ns.anosemestre AND p_ns_14.turma = m_ns.turma AND p_ns_14.disciplina = m_ns.disciplina AND p_ns_14.nro_nota = 14) ' +
         '			LEFT JOIN diario_provas p_ns_15 ON (p_ns_15.sn_compoe<>1 AND p_ns_15.anosemestre = m_ns.anosemestre AND p_ns_15.turma = m_ns.turma AND p_ns_15.disciplina = m_ns.disciplina AND p_ns_15.nro_nota = 15) ' +
         '			LEFT JOIN diario_provas p_ns_16 ON (p_ns_16.sn_compoe<>1 AND p_ns_16.anosemestre = m_ns.anosemestre AND p_ns_16.turma = m_ns.turma AND p_ns_16.disciplina = m_ns.disciplina AND p_ns_16.nro_nota = 16) ' +
         '			LEFT JOIN diario_provas p_ns_17 ON (p_ns_17.sn_compoe<>1 AND p_ns_17.anosemestre = m_ns.anosemestre AND p_ns_17.turma = m_ns.turma AND p_ns_17.disciplina = m_ns.disciplina AND p_ns_17.nro_nota = 17) ' +
         '			LEFT JOIN diario_provas p_ns_18 ON (p_ns_18.sn_compoe<>1 AND p_ns_18.anosemestre = m_ns.anosemestre AND p_ns_18.turma = m_ns.turma AND p_ns_18.disciplina = m_ns.disciplina AND p_ns_18.nro_nota = 18) ' +
         '			LEFT JOIN diario_provas p_ns_19 ON (p_ns_19.sn_compoe<>1 AND p_ns_19.anosemestre = m_ns.anosemestre AND p_ns_19.turma = m_ns.turma AND p_ns_19.disciplina = m_ns.disciplina AND p_ns_19.nro_nota = 19) ' +
         '			LEFT JOIN diario_provas p_ns_20 ON (p_ns_20.sn_compoe<>1 AND p_ns_20.anosemestre = m_ns.anosemestre AND p_ns_20.turma = m_ns.turma AND p_ns_20.disciplina = m_ns.disciplina AND p_ns_20.nro_nota = 20) ';



   SQL_CONDICAO_INNER_NP_DM = ' ' + // NECESSÁRIO PARA _NP APENAS !!
         '	INNER JOIN diario_matriculas m ON (m.anosemestre = fi.anosemestre AND m.turma = fi.turma AND m.codaluno = fi.codigoaluno AND m.disciplina = fi.disciplina AND m.bimestre = :nr_bimestre) ';

   SQL_CONDICAO_INNER_NPS_DM = ' ' + // NECESSÁRIO PARA _NPS APENAS
         '		INNER JOIN diario_matriculas m_s ON (m_s.anosemestre = fi.anosemestre AND m_s.turma = fi.turma AND m_s.codaluno = fi.codigoaluno AND m_s.disciplina = fi.disciplina AND m_s.bimestre = :nr_bimestre) ' +
         '			LEFT JOIN diario_provas p_s_1 ON (p_s_1.sn_compoe=1 AND p_s_1.anosemestre = m_s.anosemestre AND p_s_1.turma = m_s.turma AND p_s_1.disciplina = m_s.disciplina AND p_s_1.nro_nota = 1) ' +
         '			LEFT JOIN diario_provas p_s_2 ON (p_s_2.sn_compoe=1 AND p_s_2.anosemestre = m_s.anosemestre AND p_s_2.turma = m_s.turma AND p_s_2.disciplina = m_s.disciplina AND p_s_2.nro_nota = 2) ' +
         '			LEFT JOIN diario_provas p_s_3 ON (p_s_3.sn_compoe=1 AND p_s_3.anosemestre = m_s.anosemestre AND p_s_3.turma = m_s.turma AND p_s_3.disciplina = m_s.disciplina AND p_s_3.nro_nota = 3) ' +
         '			LEFT JOIN diario_provas p_s_4 ON (p_s_4.sn_compoe=1 AND p_s_4.anosemestre = m_s.anosemestre AND p_s_4.turma = m_s.turma AND p_s_4.disciplina = m_s.disciplina AND p_s_4.nro_nota = 4) ' +
         '			LEFT JOIN diario_provas p_s_5 ON (p_s_5.sn_compoe=1 AND p_s_5.anosemestre = m_s.anosemestre AND p_s_5.turma = m_s.turma AND p_s_5.disciplina = m_s.disciplina AND p_s_5.nro_nota = 5) ' +
         '			LEFT JOIN diario_provas p_s_6 ON (p_s_6.sn_compoe=1 AND p_s_6.anosemestre = m_s.anosemestre AND p_s_6.turma = m_s.turma AND p_s_6.disciplina = m_s.disciplina AND p_s_6.nro_nota = 6) ' +
         '			LEFT JOIN diario_provas p_s_7 ON (p_s_7.sn_compoe=1 AND p_s_7.anosemestre = m_s.anosemestre AND p_s_7.turma = m_s.turma AND p_s_7.disciplina = m_s.disciplina AND p_s_7.nro_nota = 7) ' +
         '			LEFT JOIN diario_provas p_s_8 ON (p_s_8.sn_compoe=1 AND p_s_8.anosemestre = m_s.anosemestre AND p_s_8.turma = m_s.turma AND p_s_8.disciplina = m_s.disciplina AND p_s_8.nro_nota = 8) ' +
         '			LEFT JOIN diario_provas p_s_9 ON (p_s_9.sn_compoe=1 AND p_s_9.anosemestre = m_s.anosemestre AND p_s_9.turma = m_s.turma AND p_s_9.disciplina = m_s.disciplina AND p_s_9.nro_nota = 9) ' +
         '			LEFT JOIN diario_provas p_s_10 ON (p_s_10.sn_compoe=1 AND p_s_10.anosemestre = m_s.anosemestre AND p_s_10.turma = m_s.turma AND p_s_10.disciplina = m_s.disciplina AND p_s_10.nro_nota = 10) ' +
         '			LEFT JOIN diario_provas p_s_11 ON (p_s_11.sn_compoe=1 AND p_s_11.anosemestre = m_s.anosemestre AND p_s_11.turma = m_s.turma AND p_s_11.disciplina = m_s.disciplina AND p_s_11.nro_nota = 11) ' +
         '			LEFT JOIN diario_provas p_s_12 ON (p_s_12.sn_compoe=1 AND p_s_12.anosemestre = m_s.anosemestre AND p_s_12.turma = m_s.turma AND p_s_12.disciplina = m_s.disciplina AND p_s_12.nro_nota = 12) ' +
         '			LEFT JOIN diario_provas p_s_13 ON (p_s_13.sn_compoe=1 AND p_s_13.anosemestre = m_s.anosemestre AND p_s_13.turma = m_s.turma AND p_s_13.disciplina = m_s.disciplina AND p_s_13.nro_nota = 13) ' +
         '			LEFT JOIN diario_provas p_s_14 ON (p_s_14.sn_compoe=1 AND p_s_14.anosemestre = m_s.anosemestre AND p_s_14.turma = m_s.turma AND p_s_14.disciplina = m_s.disciplina AND p_s_14.nro_nota = 14) ' +
         '			LEFT JOIN diario_provas p_s_15 ON (p_s_15.sn_compoe=1 AND p_s_15.anosemestre = m_s.anosemestre AND p_s_15.turma = m_s.turma AND p_s_15.disciplina = m_s.disciplina AND p_s_15.nro_nota = 15) ' +
         '			LEFT JOIN diario_provas p_s_16 ON (p_s_16.sn_compoe=1 AND p_s_16.anosemestre = m_s.anosemestre AND p_s_16.turma = m_s.turma AND p_s_16.disciplina = m_s.disciplina AND p_s_16.nro_nota = 16) ' +
         '			LEFT JOIN diario_provas p_s_17 ON (p_s_17.sn_compoe=1 AND p_s_17.anosemestre = m_s.anosemestre AND p_s_17.turma = m_s.turma AND p_s_17.disciplina = m_s.disciplina AND p_s_17.nro_nota = 17) ' +
         '			LEFT JOIN diario_provas p_s_18 ON (p_s_18.sn_compoe=1 AND p_s_18.anosemestre = m_s.anosemestre AND p_s_18.turma = m_s.turma AND p_s_18.disciplina = m_s.disciplina AND p_s_18.nro_nota = 18) ' +
         '			LEFT JOIN diario_provas p_s_19 ON (p_s_19.sn_compoe=1 AND p_s_19.anosemestre = m_s.anosemestre AND p_s_19.turma = m_s.turma AND p_s_19.disciplina = m_s.disciplina AND p_s_19.nro_nota = 19) ' +
         '			LEFT JOIN diario_provas p_s_20 ON (p_s_20.sn_compoe=1 AND p_s_20.anosemestre = m_s.anosemestre AND p_s_20.turma = m_s.turma AND p_s_20.disciplina = m_s.disciplina AND p_s_20.nro_nota = 20) ';

   SQL_CONDICAO_INNER_NPNS_DM = ' ' + // NECESSÁRIO PARA _NPNS APENAS
         '		INNER JOIN diario_matriculas m_ns ON (m_ns.anosemestre = fi.anosemestre AND m_ns.turma = fi.turma AND m_ns.codaluno = fi.codigoaluno AND m_ns.disciplina = fi.disciplina AND m_ns.bimestre = :nr_bimestre) ' +
         '			LEFT JOIN diario_provas p_ns_1 ON (p_ns_1.sn_compoe<>1 AND p_ns_1.anosemestre = m_ns.anosemestre AND p_ns_1.turma = m_ns.turma AND p_ns_1.disciplina = m_ns.disciplina AND p_ns_1.nro_nota = 1) ' +
         '			LEFT JOIN diario_provas p_ns_2 ON (p_ns_2.sn_compoe<>1 AND p_ns_2.anosemestre = m_ns.anosemestre AND p_ns_2.turma = m_ns.turma AND p_ns_2.disciplina = m_ns.disciplina AND p_ns_2.nro_nota = 2) ' +
         '			LEFT JOIN diario_provas p_ns_3 ON (p_ns_3.sn_compoe<>1 AND p_ns_3.anosemestre = m_ns.anosemestre AND p_ns_3.turma = m_ns.turma AND p_ns_3.disciplina = m_ns.disciplina AND p_ns_3.nro_nota = 3) ' +
         '			LEFT JOIN diario_provas p_ns_4 ON (p_ns_4.sn_compoe<>1 AND p_ns_4.anosemestre = m_ns.anosemestre AND p_ns_4.turma = m_ns.turma AND p_ns_4.disciplina = m_ns.disciplina AND p_ns_4.nro_nota = 4) ' +
         '			LEFT JOIN diario_provas p_ns_5 ON (p_ns_5.sn_compoe<>1 AND p_ns_5.anosemestre = m_ns.anosemestre AND p_ns_5.turma = m_ns.turma AND p_ns_5.disciplina = m_ns.disciplina AND p_ns_5.nro_nota = 5) ' +
         '			LEFT JOIN diario_provas p_ns_6 ON (p_ns_6.sn_compoe<>1 AND p_ns_6.anosemestre = m_ns.anosemestre AND p_ns_6.turma = m_ns.turma AND p_ns_6.disciplina = m_ns.disciplina AND p_ns_6.nro_nota = 6) ' +
         '			LEFT JOIN diario_provas p_ns_7 ON (p_ns_7.sn_compoe<>1 AND p_ns_7.anosemestre = m_ns.anosemestre AND p_ns_7.turma = m_ns.turma AND p_ns_7.disciplina = m_ns.disciplina AND p_ns_7.nro_nota = 7) ' +
         '			LEFT JOIN diario_provas p_ns_8 ON (p_ns_8.sn_compoe<>1 AND p_ns_8.anosemestre = m_ns.anosemestre AND p_ns_8.turma = m_ns.turma AND p_ns_8.disciplina = m_ns.disciplina AND p_ns_8.nro_nota = 8) ' +
         '			LEFT JOIN diario_provas p_ns_9 ON (p_ns_9.sn_compoe<>1 AND p_ns_9.anosemestre = m_ns.anosemestre AND p_ns_9.turma = m_ns.turma AND p_ns_9.disciplina = m_ns.disciplina AND p_ns_9.nro_nota = 9) ' +
         '			LEFT JOIN diario_provas p_ns_10 ON (p_ns_10.sn_compoe<>1 AND p_ns_10.anosemestre = m_ns.anosemestre AND p_ns_10.turma = m_ns.turma AND p_ns_10.disciplina = m_ns.disciplina AND p_ns_10.nro_nota = 10) ' +
         '			LEFT JOIN diario_provas p_ns_11 ON (p_ns_11.sn_compoe<>1 AND p_ns_11.anosemestre = m_ns.anosemestre AND p_ns_11.turma = m_ns.turma AND p_ns_11.disciplina = m_ns.disciplina AND p_ns_11.nro_nota = 11) ' +
         '			LEFT JOIN diario_provas p_ns_12 ON (p_ns_12.sn_compoe<>1 AND p_ns_12.anosemestre = m_ns.anosemestre AND p_ns_12.turma = m_ns.turma AND p_ns_12.disciplina = m_ns.disciplina AND p_ns_12.nro_nota = 12) ' +
         '			LEFT JOIN diario_provas p_ns_13 ON (p_ns_13.sn_compoe<>1 AND p_ns_13.anosemestre = m_ns.anosemestre AND p_ns_13.turma = m_ns.turma AND p_ns_13.disciplina = m_ns.disciplina AND p_ns_13.nro_nota = 13) ' +
         '			LEFT JOIN diario_provas p_ns_14 ON (p_ns_14.sn_compoe<>1 AND p_ns_14.anosemestre = m_ns.anosemestre AND p_ns_14.turma = m_ns.turma AND p_ns_14.disciplina = m_ns.disciplina AND p_ns_14.nro_nota = 14) ' +
         '			LEFT JOIN diario_provas p_ns_15 ON (p_ns_15.sn_compoe<>1 AND p_ns_15.anosemestre = m_ns.anosemestre AND p_ns_15.turma = m_ns.turma AND p_ns_15.disciplina = m_ns.disciplina AND p_ns_15.nro_nota = 15) ' +
         '			LEFT JOIN diario_provas p_ns_16 ON (p_ns_16.sn_compoe<>1 AND p_ns_16.anosemestre = m_ns.anosemestre AND p_ns_16.turma = m_ns.turma AND p_ns_16.disciplina = m_ns.disciplina AND p_ns_16.nro_nota = 16) ' +
         '			LEFT JOIN diario_provas p_ns_17 ON (p_ns_17.sn_compoe<>1 AND p_ns_17.anosemestre = m_ns.anosemestre AND p_ns_17.turma = m_ns.turma AND p_ns_17.disciplina = m_ns.disciplina AND p_ns_17.nro_nota = 17) ' +
         '			LEFT JOIN diario_provas p_ns_18 ON (p_ns_18.sn_compoe<>1 AND p_ns_18.anosemestre = m_ns.anosemestre AND p_ns_18.turma = m_ns.turma AND p_ns_18.disciplina = m_ns.disciplina AND p_ns_18.nro_nota = 18) ' +
         '			LEFT JOIN diario_provas p_ns_19 ON (p_ns_19.sn_compoe<>1 AND p_ns_19.anosemestre = m_ns.anosemestre AND p_ns_19.turma = m_ns.turma AND p_ns_19.disciplina = m_ns.disciplina AND p_ns_19.nro_nota = 19) ' +
         '			LEFT JOIN diario_provas p_ns_20 ON (p_ns_20.sn_compoe<>1 AND p_ns_20.anosemestre = m_ns.anosemestre AND p_ns_20.turma = m_ns.turma AND p_ns_20.disciplina = m_ns.disciplina AND p_ns_20.nro_nota = 20) ';



         
   SQL_CONDICAO_MENOR_NP = ' ' + // MENOR_NP
         '	CASE LEAST( ' +
         '							IF(isNull(m.nota1),99999,m.nota1), ' +
         '							IF(isNull(m.nota2),99999,m.nota2), ' +
         '							IF(isNull(m.nota3),99999,m.nota3), ' +
         '							IF(isNull(m.nota4),99999,m.nota4), ' +
         '							IF(isNull(m.nota5),99999,m.nota5), ' +
         '							IF(isNull(m.nota6),99999,m.nota6), ' +
         '							IF(isNull(m.nota7),99999,m.nota7), ' +
         '							IF(isNull(m.nota8),99999,m.nota8), ' +
         '							IF(isNull(m.nota9),99999,m.nota9), ' +
         '							IF(isNull(m.nota10),99999,m.nota10), ' +
         '							IF(isNull(m.nota11),99999,m.nota11), ' +
         '							IF(isNull(m.nota12),99999,m.nota12), ' +
         '							IF(isNull(m.nota13),99999,m.nota13), ' +
         '							IF(isNull(m.nota14),99999,m.nota14), ' +
         '							IF(isNull(m.nota15),99999,m.nota15), ' +
         '							IF(isNull(m.nota16),99999,m.nota16), ' +
         '							IF(isNull(m.nota17),99999,m.nota17), ' +
         '							IF(isNull(m.nota18),99999,m.nota18), ' +
         '							IF(isNull(m.nota19),99999,m.nota19), ' +
         '							IF(isNull(m.nota20),99999,m.nota20) ' +
         '						) ' +
         '		WHEN m.nota1 then m.nota1 ' +
         '		WHEN m.nota2 then m.nota2 ' +
         '		WHEN m.nota3 then m.nota3 ' +
         '		WHEN m.nota4 then m.nota4 ' +
         '		WHEN m.nota5 then m.nota5 ' +
         '		WHEN m.nota6 then m.nota6 ' +
         '		WHEN m.nota7 then m.nota7 ' +
         '		WHEN m.nota8 then m.nota8 ' +
         '		WHEN m.nota9 then m.nota9 ' +
         '		WHEN m.nota10 then m.nota10 ' +
         '		WHEN m.nota11 then m.nota11 ' +
         '		WHEN m.nota12 then m.nota12 ' +
         '		WHEN m.nota13 then m.nota13 ' +
         '		WHEN m.nota14 then m.nota14 ' +
         '		WHEN m.nota15 then m.nota15 ' +
         '		WHEN m.nota16 then m.nota16 ' +
         '		WHEN m.nota17 then m.nota17 ' +
         '		WHEN m.nota18 then m.nota18 ' +
         '		WHEN m.nota19 then m.nota19 ' +
         '		WHEN m.nota20 then m.nota20 ' +
         '		ELSE 99999 ' +
         '	END ';

   SQL_CONDICAO_MAIOR_NP = ' ' + // MAIOR_NP
         '	CASE GREATEST( ' +
         '									IF(isNull(m.nota1),-99999,m.nota1), ' +
         '									IF(isNull(m.nota2),-99999,m.nota2), ' +
         '									IF(isNull(m.nota3),-99999,m.nota3), ' +
         '									IF(isNull(m.nota4),-99999,m.nota4), ' +
         '									IF(isNull(m.nota5),-99999,m.nota5), ' +
         '									IF(isNull(m.nota6),-99999,m.nota6), ' +
         '									IF(isNull(m.nota7),-99999,m.nota7), ' +
         '									IF(isNull(m.nota8),-99999,m.nota8), ' +
         '									IF(isNull(m.nota9),-99999,m.nota9), ' +
         '									IF(isNull(m.nota10),-99999,m.nota10), ' +
         '									IF(isNull(m.nota11),-99999,m.nota11), ' +
         '									IF(isNull(m.nota12),-99999,m.nota12), ' +
         '									IF(isNull(m.nota13),-99999,m.nota13), ' +
         '									IF(isNull(m.nota14),-99999,m.nota14), ' +
         '									IF(isNull(m.nota15),-99999,m.nota15), ' +
         '									IF(isNull(m.nota16),-99999,m.nota16), ' +
         '									IF(isNull(m.nota17),-99999,m.nota17), ' +
         '									IF(isNull(m.nota18),-99999,m.nota18), ' +
         '									IF(isNull(m.nota19),-99999,m.nota19), ' +
         '									IF(isNull(m.nota20),-99999,m.nota20) ' +
         '								) ' +
         '		WHEN m.nota1 then m.nota1 ' +
         '		WHEN m.nota2 then m.nota2 ' +
         '		WHEN m.nota3 then m.nota3 ' +
         '		WHEN m.nota4 then m.nota4 ' +
         '		WHEN m.nota5 then m.nota5 ' +
         '		WHEN m.nota6 then m.nota6 ' +
         '		WHEN m.nota7 then m.nota7 ' +
         '		WHEN m.nota8 then m.nota8 ' +
         '		WHEN m.nota9 then m.nota9 ' +
         '		WHEN m.nota10 then m.nota10 ' +
         '		WHEN m.nota11 then m.nota11 ' +
         '		WHEN m.nota12 then m.nota12 ' +
         '		WHEN m.nota13 then m.nota13 ' +
         '		WHEN m.nota14 then m.nota14 ' +
         '		WHEN m.nota15 then m.nota15 ' +
         '		WHEN m.nota16 then m.nota16 ' +
         '		WHEN m.nota17 then m.nota17 ' +
         '		WHEN m.nota18 then m.nota18 ' +
         '		WHEN m.nota19 then m.nota19 ' +
         '		WHEN m.nota20 then m.nota20 ' +
         '		ELSE -99999 ' +
         '	END ';

   SQL_CONDICAO_MEDIA_NP = ' ' + // MEDIA_NP
         '	( ' +
         '		IF(isNull(m.nota1),0,m.nota1)+ ' +
         '		IF(isNull(m.nota2),0,m.nota2)+ ' +
         '		IF(isNull(m.nota3),0,m.nota3)+ ' +
         '		IF(isNull(m.nota4),0,m.nota4)+ ' +
         '		IF(isNull(m.nota5),0,m.nota5)+ ' +
         '		IF(isNull(m.nota6),0,m.nota6)+ ' +
         '		IF(isNull(m.nota7),0,m.nota7)+ ' +
         '		IF(isNull(m.nota8),0,m.nota8)+ ' +
         '		IF(isNull(m.nota9),0,m.nota9)+ ' +
         '		IF(isNull(m.nota10),0,m.nota10)+ ' +
         '		IF(isNull(m.nota11),0,m.nota11)+ ' +
         '		IF(isNull(m.nota12),0,m.nota12)+ ' +
         '		IF(isNull(m.nota13),0,m.nota13)+ ' +
         '		IF(isNull(m.nota14),0,m.nota14)+ ' +
         '		IF(isNull(m.nota15),0,m.nota15)+ ' +
         '		IF(isNull(m.nota16),0,m.nota16)+ ' +
         '		IF(isNull(m.nota17),0,m.nota17)+ ' +
         '		IF(isNull(m.nota18),0,m.nota18)+ ' +
         '		IF(isNull(m.nota19),0,m.nota19)+ ' +
         '		IF(isNull(m.nota20),0,m.nota20) ' +
         '	)/( ' +
         '		IF(isNull(m.nota1),0,1)+ ' +
         '		IF(isNull(m.nota2),0,1)+ ' +
         '		IF(isNull(m.nota3),0,1)+ ' +
         '		IF(isNull(m.nota4),0,1)+ ' +
         '		IF(isNull(m.nota5),0,1)+ ' +
         '		IF(isNull(m.nota6),0,1)+ ' +
         '		IF(isNull(m.nota7),0,1)+ ' +
         '		IF(isNull(m.nota8),0,1)+ ' +
         '		IF(isNull(m.nota9),0,1)+ ' +
         '		IF(isNull(m.nota10),0,1)+ ' +
         '		IF(isNull(m.nota11),0,1)+ ' +
         '		IF(isNull(m.nota12),0,1)+ ' +
         '		IF(isNull(m.nota13),0,1)+ ' +
         '		IF(isNull(m.nota14),0,1)+ ' +
         '		IF(isNull(m.nota15),0,1)+ ' +
         '		IF(isNull(m.nota16),0,1)+ ' +
         '		IF(isNull(m.nota17),0,1)+ ' +
         '		IF(isNull(m.nota18),0,1)+ ' +
         '		IF(isNull(m.nota19),0,1)+ ' +
         '		IF(isNull(m.nota20),0,1) ' +
         '	) ';



   SQL_CONDICAO_MENOR_NPS = ' ' + // MENOR_NPS
         '	CASE LEAST( ' +
         '							IF(isNull(m_s.nota1) OR isNull(p_s_1.nro_nota),99999,m_s.nota1), ' +
         '							IF(isNull(m_s.nota2) OR isNull(p_s_2.nro_nota),99999,m_s.nota2), ' +
         '							IF(isNull(m_s.nota3) OR isNull(p_s_3.nro_nota),99999,m_s.nota3), ' +
         '							IF(isNull(m_s.nota4) OR isNull(p_s_4.nro_nota),99999,m_s.nota4), ' +
         '							IF(isNull(m_s.nota5) OR isNull(p_s_5.nro_nota),99999,m_s.nota5), ' +
         '							IF(isNull(m_s.nota6) OR isNull(p_s_6.nro_nota),99999,m_s.nota6), ' +
         '							IF(isNull(m_s.nota7) OR isNull(p_s_7.nro_nota),99999,m_s.nota7), ' +
         '							IF(isNull(m_s.nota8) OR isNull(p_s_8.nro_nota),99999,m_s.nota8), ' +
         '							IF(isNull(m_s.nota9) OR isNull(p_s_9.nro_nota),99999,m_s.nota9), ' +
         '							IF(isNull(m_s.nota10) OR isNull(p_s_10.nro_nota),99999,m_s.nota10), ' +
         '							IF(isNull(m_s.nota11) OR isNull(p_s_11.nro_nota),99999,m_s.nota11), ' +
         '							IF(isNull(m_s.nota12) OR isNull(p_s_12.nro_nota),99999,m_s.nota12), ' +
         '							IF(isNull(m_s.nota13) OR isNull(p_s_13.nro_nota),99999,m_s.nota13), ' +
         '							IF(isNull(m_s.nota14) OR isNull(p_s_14.nro_nota),99999,m_s.nota14), ' +
         '							IF(isNull(m_s.nota15) OR isNull(p_s_15.nro_nota),99999,m_s.nota15), ' +
         '							IF(isNull(m_s.nota16) OR isNull(p_s_16.nro_nota),99999,m_s.nota16), ' +
         '							IF(isNull(m_s.nota17) OR isNull(p_s_17.nro_nota),99999,m_s.nota17), ' +
         '							IF(isNull(m_s.nota18) OR isNull(p_s_18.nro_nota),99999,m_s.nota18), ' +
         '							IF(isNull(m_s.nota19) OR isNull(p_s_19.nro_nota),99999,m_s.nota19), ' +
         '							IF(isNull(m_s.nota20) OR isNull(p_s_20.nro_nota),99999,m_s.nota20) ' +
         '						) ' +
         '		WHEN m_s.nota1 then m_s.nota1 ' +
         '		WHEN m_s.nota2 then m_s.nota2 ' +
         '		WHEN m_s.nota3 then m_s.nota3 ' +
         '		WHEN m_s.nota4 then m_s.nota4 ' +
         '		WHEN m_s.nota5 then m_s.nota5 ' +
         '		WHEN m_s.nota6 then m_s.nota6 ' +
         '		WHEN m_s.nota7 then m_s.nota7 ' +
         '		WHEN m_s.nota8 then m_s.nota8 ' +
         '		WHEN m_s.nota9 then m_s.nota9 ' +
         '		WHEN m_s.nota10 then m_s.nota10 ' +
         '		WHEN m_s.nota11 then m_s.nota11 ' +
         '		WHEN m_s.nota12 then m_s.nota12 ' +
         '		WHEN m_s.nota13 then m_s.nota13 ' +
         '		WHEN m_s.nota14 then m_s.nota14 ' +
         '		WHEN m_s.nota15 then m_s.nota15 ' +
         '		WHEN m_s.nota16 then m_s.nota16 ' +
         '		WHEN m_s.nota17 then m_s.nota17 ' +
         '		WHEN m_s.nota18 then m_s.nota18 ' +
         '		WHEN m_s.nota19 then m_s.nota19 ' +
         '		WHEN m_s.nota20 then m_s.nota20 ' +
         '		ELSE 99999 ' +
         '	END ';

   SQL_CONDICAO_MAIOR_NPS = ' ' + // MAIOR_NPS
         '	CASE GREATEST( ' +
         '							IF(isNull(m_s.nota1) OR isNull(p_s_1.nro_nota),-99999,m_s.nota1), ' +
         '							IF(isNull(m_s.nota2) OR isNull(p_s_2.nro_nota),-99999,m_s.nota2), ' +
         '							IF(isNull(m_s.nota3) OR isNull(p_s_3.nro_nota),-99999,m_s.nota3), ' +
         '							IF(isNull(m_s.nota4) OR isNull(p_s_4.nro_nota),-99999,m_s.nota4), ' +
         '							IF(isNull(m_s.nota5) OR isNull(p_s_5.nro_nota),-99999,m_s.nota5), ' +
         '							IF(isNull(m_s.nota6) OR isNull(p_s_6.nro_nota),-99999,m_s.nota6), ' +
         '							IF(isNull(m_s.nota7) OR isNull(p_s_7.nro_nota),-99999,m_s.nota7), ' +
         '							IF(isNull(m_s.nota8) OR isNull(p_s_8.nro_nota),-99999,m_s.nota8), ' +
         '							IF(isNull(m_s.nota9) OR isNull(p_s_9.nro_nota),-99999,m_s.nota9), ' +
         '							IF(isNull(m_s.nota10) OR isNull(p_s_10.nro_nota),-99999,m_s.nota10), ' +
         '							IF(isNull(m_s.nota11) OR isNull(p_s_11.nro_nota),-99999,m_s.nota11), ' +
         '							IF(isNull(m_s.nota12) OR isNull(p_s_12.nro_nota),-99999,m_s.nota12), ' +
         '							IF(isNull(m_s.nota13) OR isNull(p_s_13.nro_nota),-99999,m_s.nota13), ' +
         '							IF(isNull(m_s.nota14) OR isNull(p_s_14.nro_nota),-99999,m_s.nota14), ' +
         '							IF(isNull(m_s.nota15) OR isNull(p_s_15.nro_nota),-99999,m_s.nota15), ' +
         '							IF(isNull(m_s.nota16) OR isNull(p_s_16.nro_nota),-99999,m_s.nota16), ' +
         '							IF(isNull(m_s.nota17) OR isNull(p_s_17.nro_nota),-99999,m_s.nota17), ' +
         '							IF(isNull(m_s.nota18) OR isNull(p_s_18.nro_nota),-99999,m_s.nota18), ' +
         '							IF(isNull(m_s.nota19) OR isNull(p_s_19.nro_nota),-99999,m_s.nota19), ' +
         '							IF(isNull(m_s.nota20) OR isNull(p_s_20.nro_nota),-99999,m_s.nota20) ' +
         '						) ' +
         '		WHEN m_s.nota1 then m_s.nota1 ' +
         '		WHEN m_s.nota2 then m_s.nota2 ' +
         '		WHEN m_s.nota3 then m_s.nota3 ' +
         '		WHEN m_s.nota4 then m_s.nota4 ' +
         '		WHEN m_s.nota5 then m_s.nota5 ' +
         '		WHEN m_s.nota6 then m_s.nota6 ' +
         '		WHEN m_s.nota7 then m_s.nota7 ' +
         '		WHEN m_s.nota8 then m_s.nota8 ' +
         '		WHEN m_s.nota9 then m_s.nota9 ' +
         '		WHEN m_s.nota10 then m_s.nota10 ' +
         '		WHEN m_s.nota11 then m_s.nota11 ' +
         '		WHEN m_s.nota12 then m_s.nota12 ' +
         '		WHEN m_s.nota13 then m_s.nota13 ' +
         '		WHEN m_s.nota14 then m_s.nota14 ' +
         '		WHEN m_s.nota15 then m_s.nota15 ' +
         '		WHEN m_s.nota16 then m_s.nota16 ' +
         '		WHEN m_s.nota17 then m_s.nota17 ' +
         '		WHEN m_s.nota18 then m_s.nota18 ' +
         '		WHEN m_s.nota19 then m_s.nota19 ' +
         '		WHEN m_s.nota20 then m_s.nota20 ' +
         '		ELSE -99999 ' +
         '	END ';

   SQL_CONDICAO_MEDIA_NPS = ' ' + // MEDIA_NPS
         '	( ' +
         '		IF(isNull(m_s.nota1) OR isNull(p_s_1.nro_nota),0,m_s.nota1)+ ' +
         '		IF(isNull(m_s.nota2) OR isNull(p_s_2.nro_nota),0,m_s.nota2)+ ' +
         '		IF(isNull(m_s.nota3) OR isNull(p_s_3.nro_nota),0,m_s.nota3)+ ' +
         '		IF(isNull(m_s.nota4) OR isNull(p_s_4.nro_nota),0,m_s.nota4)+ ' +
         '		IF(isNull(m_s.nota5) OR isNull(p_s_5.nro_nota),0,m_s.nota5)+ ' +
         '		IF(isNull(m_s.nota6) OR isNull(p_s_6.nro_nota),0,m_s.nota6)+ ' +
         '		IF(isNull(m_s.nota7) OR isNull(p_s_7.nro_nota),0,m_s.nota7)+ ' +
         '		IF(isNull(m_s.nota8) OR isNull(p_s_8.nro_nota),0,m_s.nota8)+ ' +
         '		IF(isNull(m_s.nota9) OR isNull(p_s_9.nro_nota),0,m_s.nota9)+ ' +
         '		IF(isNull(m_s.nota10) OR isNull(p_s_10.nro_nota),0,m_s.nota10)+ ' +
         '		IF(isNull(m_s.nota11) OR isNull(p_s_11.nro_nota),0,m_s.nota11)+ ' +
         '		IF(isNull(m_s.nota12) OR isNull(p_s_12.nro_nota),0,m_s.nota12)+ ' +
         '		IF(isNull(m_s.nota13) OR isNull(p_s_13.nro_nota),0,m_s.nota13)+ ' +
         '		IF(isNull(m_s.nota14) OR isNull(p_s_14.nro_nota),0,m_s.nota14)+ ' +
         '		IF(isNull(m_s.nota15) OR isNull(p_s_15.nro_nota),0,m_s.nota15)+ ' +
         '		IF(isNull(m_s.nota16) OR isNull(p_s_16.nro_nota),0,m_s.nota16)+ ' +
         '		IF(isNull(m_s.nota17) OR isNull(p_s_17.nro_nota),0,m_s.nota17)+ ' +
         '		IF(isNull(m_s.nota18) OR isNull(p_s_18.nro_nota),0,m_s.nota18)+ ' +
         '		IF(isNull(m_s.nota19) OR isNull(p_s_19.nro_nota),0,m_s.nota19)+ ' +
         '		IF(isNull(m_s.nota20) OR isNull(p_s_20.nro_nota),0,m_s.nota20) ' +
         '	)/( ' +
         '		IF(isNull(m_s.nota1) OR isNull(p_s_1.nro_nota),0,1)+ ' +
         '		IF(isNull(m_s.nota2) OR isNull(p_s_2.nro_nota),0,1)+ ' +
         '		IF(isNull(m_s.nota3) OR isNull(p_s_3.nro_nota),0,1)+ ' +
         '		IF(isNull(m_s.nota4) OR isNull(p_s_4.nro_nota),0,1)+ ' +
         '		IF(isNull(m_s.nota5) OR isNull(p_s_5.nro_nota),0,1)+ ' +
         '		IF(isNull(m_s.nota6) OR isNull(p_s_6.nro_nota),0,1)+ ' +
         '		IF(isNull(m_s.nota7) OR isNull(p_s_7.nro_nota),0,1)+ ' +
         '		IF(isNull(m_s.nota8) OR isNull(p_s_8.nro_nota),0,1)+ ' +
         '		IF(isNull(m_s.nota9) OR isNull(p_s_9.nro_nota),0,1)+ ' +
         '		IF(isNull(m_s.nota10) OR isNull(p_s_10.nro_nota),0,1)+ ' +
         '		IF(isNull(m_s.nota11) OR isNull(p_s_11.nro_nota),0,1)+ ' +
         '		IF(isNull(m_s.nota12) OR isNull(p_s_12.nro_nota),0,1)+ ' +
         '		IF(isNull(m_s.nota13) OR isNull(p_s_13.nro_nota),0,1)+ ' +
         '		IF(isNull(m_s.nota14) OR isNull(p_s_14.nro_nota),0,1)+ ' +
         '		IF(isNull(m_s.nota15) OR isNull(p_s_15.nro_nota),0,1)+ ' +
         '		IF(isNull(m_s.nota16) OR isNull(p_s_16.nro_nota),0,1)+ ' +
         '		IF(isNull(m_s.nota17) OR isNull(p_s_17.nro_nota),0,1)+ ' +
         '		IF(isNull(m_s.nota18) OR isNull(p_s_18.nro_nota),0,1)+ ' +
         '		IF(isNull(m_s.nota19) OR isNull(p_s_19.nro_nota),0,1)+ ' +
         '		IF(isNull(m_s.nota20) OR isNull(p_s_20.nro_nota),0,1) ' +
         '	) ';


         
   SQL_CONDICAO_MENOR_NPNS = ' ' + // MENOR_NPNS
         '	CASE LEAST( ' +
         '							IF(isNull(m_ns.nota1) OR isNull(p_ns_1.nro_nota),99999,m_ns.nota1), ' +
         '							IF(isNull(m_ns.nota2) OR isNull(p_ns_2.nro_nota),99999,m_ns.nota2), ' +
         '							IF(isNull(m_ns.nota3) OR isNull(p_ns_3.nro_nota),99999,m_ns.nota3), ' +
         '							IF(isNull(m_ns.nota4) OR isNull(p_ns_4.nro_nota),99999,m_ns.nota4), ' +
         '							IF(isNull(m_ns.nota5) OR isNull(p_ns_5.nro_nota),99999,m_ns.nota5), ' +
         '							IF(isNull(m_ns.nota6) OR isNull(p_ns_6.nro_nota),99999,m_ns.nota6), ' +
         '							IF(isNull(m_ns.nota7) OR isNull(p_ns_7.nro_nota),99999,m_ns.nota7), ' +
         '							IF(isNull(m_ns.nota8) OR isNull(p_ns_8.nro_nota),99999,m_ns.nota8), ' +
         '							IF(isNull(m_ns.nota9) OR isNull(p_ns_9.nro_nota),99999,m_ns.nota9), ' +
         '							IF(isNull(m_ns.nota10) OR isNull(p_ns_10.nro_nota),99999,m_ns.nota10), ' +
         '							IF(isNull(m_ns.nota11) OR isNull(p_ns_11.nro_nota),99999,m_ns.nota11), ' +
         '							IF(isNull(m_ns.nota12) OR isNull(p_ns_12.nro_nota),99999,m_ns.nota12), ' +
         '							IF(isNull(m_ns.nota13) OR isNull(p_ns_13.nro_nota),99999,m_ns.nota13), ' +
         '							IF(isNull(m_ns.nota14) OR isNull(p_ns_14.nro_nota),99999,m_ns.nota14), ' +
         '							IF(isNull(m_ns.nota15) OR isNull(p_ns_15.nro_nota),99999,m_ns.nota15), ' +
         '							IF(isNull(m_ns.nota16) OR isNull(p_ns_16.nro_nota),99999,m_ns.nota16), ' +
         '							IF(isNull(m_ns.nota17) OR isNull(p_ns_17.nro_nota),99999,m_ns.nota17), ' +
         '							IF(isNull(m_ns.nota18) OR isNull(p_ns_18.nro_nota),99999,m_ns.nota18), ' +
         '							IF(isNull(m_ns.nota19) OR isNull(p_ns_19.nro_nota),99999,m_ns.nota19), ' +
         '							IF(isNull(m_ns.nota20) OR isNull(p_ns_20.nro_nota),99999,m_ns.nota20) ' +
         '						) ' +
         '		WHEN m_ns.nota1 then m_ns.nota1 ' +
         '		WHEN m_ns.nota2 then m_ns.nota2 ' +
         '		WHEN m_ns.nota3 then m_ns.nota3 ' +
         '		WHEN m_ns.nota4 then m_ns.nota4 ' +
         '		WHEN m_ns.nota5 then m_ns.nota5 ' +
         '		WHEN m_ns.nota6 then m_ns.nota6 ' +
         '		WHEN m_ns.nota7 then m_ns.nota7 ' +
         '		WHEN m_ns.nota8 then m_ns.nota8 ' +
         '		WHEN m_ns.nota9 then m_ns.nota9 ' +
         '		WHEN m_ns.nota10 then m_ns.nota10 ' +
         '		WHEN m_ns.nota11 then m_ns.nota11 ' +
         '		WHEN m_ns.nota12 then m_ns.nota12 ' +
         '		WHEN m_ns.nota13 then m_ns.nota13 ' +
         '		WHEN m_ns.nota14 then m_ns.nota14 ' +
         '		WHEN m_ns.nota15 then m_ns.nota15 ' +
         '		WHEN m_ns.nota16 then m_ns.nota16 ' +
         '		WHEN m_ns.nota17 then m_ns.nota17 ' +
         '		WHEN m_ns.nota18 then m_ns.nota18 ' +
         '		WHEN m_ns.nota19 then m_ns.nota19 ' +
         '		WHEN m_ns.nota20 then m_ns.nota20 ' +
         '		ELSE 99999 ' +
         '	END ';

   SQL_CONDICAO_MAIOR_NPNS = ' ' + // MAIOR_NPNS
         '	CASE GREATEST( ' +
         '							IF(isNull(m_ns.nota1) OR isNull(p_ns_1.nro_nota),-99999,m_ns.nota1), ' +
         '							IF(isNull(m_ns.nota2) OR isNull(p_ns_2.nro_nota),-99999,m_ns.nota2), ' +
         '							IF(isNull(m_ns.nota3) OR isNull(p_ns_3.nro_nota),-99999,m_ns.nota3), ' +
         '							IF(isNull(m_ns.nota4) OR isNull(p_ns_4.nro_nota),-99999,m_ns.nota4), ' +
         '							IF(isNull(m_ns.nota5) OR isNull(p_ns_5.nro_nota),-99999,m_ns.nota5), ' +
         '							IF(isNull(m_ns.nota6) OR isNull(p_ns_6.nro_nota),-99999,m_ns.nota6), ' +
         '							IF(isNull(m_ns.nota7) OR isNull(p_ns_7.nro_nota),-99999,m_ns.nota7), ' +
         '							IF(isNull(m_ns.nota8) OR isNull(p_ns_8.nro_nota),-99999,m_ns.nota8), ' +
         '							IF(isNull(m_ns.nota9) OR isNull(p_ns_9.nro_nota),-99999,m_ns.nota9), ' +
         '							IF(isNull(m_ns.nota10) OR isNull(p_ns_10.nro_nota),-99999,m_ns.nota10), ' +
         '							IF(isNull(m_ns.nota11) OR isNull(p_ns_11.nro_nota),-99999,m_ns.nota11), ' +
         '							IF(isNull(m_ns.nota12) OR isNull(p_ns_12.nro_nota),-99999,m_ns.nota12), ' +
         '							IF(isNull(m_ns.nota13) OR isNull(p_ns_13.nro_nota),-99999,m_ns.nota13), ' +
         '							IF(isNull(m_ns.nota14) OR isNull(p_ns_14.nro_nota),-99999,m_ns.nota14), ' +
         '							IF(isNull(m_ns.nota15) OR isNull(p_ns_15.nro_nota),-99999,m_ns.nota15), ' +
         '							IF(isNull(m_ns.nota16) OR isNull(p_ns_16.nro_nota),-99999,m_ns.nota16), ' +
         '							IF(isNull(m_ns.nota17) OR isNull(p_ns_17.nro_nota),-99999,m_ns.nota17), ' +
         '							IF(isNull(m_ns.nota18) OR isNull(p_ns_18.nro_nota),-99999,m_ns.nota18), ' +
         '							IF(isNull(m_ns.nota19) OR isNull(p_ns_19.nro_nota),-99999,m_ns.nota19), ' +
         '							IF(isNull(m_ns.nota20) OR isNull(p_ns_20.nro_nota),-99999,m_ns.nota20) ' +
         '						) ' +
         '		WHEN m_ns.nota1 then m_ns.nota1 ' +
         '		WHEN m_ns.nota2 then m_ns.nota2 ' +
         '		WHEN m_ns.nota3 then m_ns.nota3 ' +
         '		WHEN m_ns.nota4 then m_ns.nota4 ' +
         '		WHEN m_ns.nota5 then m_ns.nota5 ' +
         '		WHEN m_ns.nota6 then m_ns.nota6 ' +
         '		WHEN m_ns.nota7 then m_ns.nota7 ' +
         '		WHEN m_ns.nota8 then m_ns.nota8 ' +
         '		WHEN m_ns.nota9 then m_ns.nota9 ' +
         '		WHEN m_ns.nota10 then m_ns.nota10 ' +
         '		WHEN m_ns.nota11 then m_ns.nota11 ' +
         '		WHEN m_ns.nota12 then m_ns.nota12 ' +
         '		WHEN m_ns.nota13 then m_ns.nota13 ' +
         '		WHEN m_ns.nota14 then m_ns.nota14 ' +
         '		WHEN m_ns.nota15 then m_ns.nota15 ' +
         '		WHEN m_ns.nota16 then m_ns.nota16 ' +
         '		WHEN m_ns.nota17 then m_ns.nota17 ' +
         '		WHEN m_ns.nota18 then m_ns.nota18 ' +
         '		WHEN m_ns.nota19 then m_ns.nota19 ' +
         '		WHEN m_ns.nota20 then m_ns.nota20 ' +
         '		ELSE -99999 ' +
         '	END ';

   SQL_CONDICAO_MEDIA_NPNS = ' ' + // MEDIA_NPNS
         '	( ' +
         '		IF(isNull(m_ns.nota1) OR isNull(p_ns_1.nro_nota),0,m_ns.nota1)+ ' +
         '		IF(isNull(m_ns.nota2) OR isNull(p_ns_2.nro_nota),0,m_ns.nota2)+ ' +
         '		IF(isNull(m_ns.nota3) OR isNull(p_ns_3.nro_nota),0,m_ns.nota3)+ ' +
         '		IF(isNull(m_ns.nota4) OR isNull(p_ns_4.nro_nota),0,m_ns.nota4)+ ' +
         '		IF(isNull(m_ns.nota5) OR isNull(p_ns_5.nro_nota),0,m_ns.nota5)+ ' +
         '		IF(isNull(m_ns.nota6) OR isNull(p_ns_6.nro_nota),0,m_ns.nota6)+ ' +
         '		IF(isNull(m_ns.nota7) OR isNull(p_ns_7.nro_nota),0,m_ns.nota7)+ ' +
         '		IF(isNull(m_ns.nota8) OR isNull(p_ns_8.nro_nota),0,m_ns.nota8)+ ' +
         '		IF(isNull(m_ns.nota9) OR isNull(p_ns_9.nro_nota),0,m_ns.nota9)+ ' +
         '		IF(isNull(m_ns.nota10) OR isNull(p_ns_10.nro_nota),0,m_ns.nota10)+ ' +
         '		IF(isNull(m_ns.nota11) OR isNull(p_ns_11.nro_nota),0,m_ns.nota11)+ ' +
         '		IF(isNull(m_ns.nota12) OR isNull(p_ns_12.nro_nota),0,m_ns.nota12)+ ' +
         '		IF(isNull(m_ns.nota13) OR isNull(p_ns_13.nro_nota),0,m_ns.nota13)+ ' +
         '		IF(isNull(m_ns.nota14) OR isNull(p_ns_14.nro_nota),0,m_ns.nota14)+ ' +
         '		IF(isNull(m_ns.nota15) OR isNull(p_ns_15.nro_nota),0,m_ns.nota15)+ ' +
         '		IF(isNull(m_ns.nota16) OR isNull(p_ns_16.nro_nota),0,m_ns.nota16)+ ' +
         '		IF(isNull(m_ns.nota17) OR isNull(p_ns_17.nro_nota),0,m_ns.nota17)+ ' +
         '		IF(isNull(m_ns.nota18) OR isNull(p_ns_18.nro_nota),0,m_ns.nota18)+ ' +
         '		IF(isNull(m_ns.nota19) OR isNull(p_ns_19.nro_nota),0,m_ns.nota19)+ ' +
         '		IF(isNull(m_ns.nota20) OR isNull(p_ns_20.nro_nota),0,m_ns.nota20) ' +
         '	)/( ' +
         '		IF(isNull(m_ns.nota1) OR isNull(p_ns_1.nro_nota),0,1)+ ' +
         '		IF(isNull(m_ns.nota2) OR isNull(p_ns_2.nro_nota),0,1)+ ' +
         '		IF(isNull(m_ns.nota3) OR isNull(p_ns_3.nro_nota),0,1)+ ' +
         '		IF(isNull(m_ns.nota4) OR isNull(p_ns_4.nro_nota),0,1)+ ' +
         '		IF(isNull(m_ns.nota5) OR isNull(p_ns_5.nro_nota),0,1)+ ' +
         '		IF(isNull(m_ns.nota6) OR isNull(p_ns_6.nro_nota),0,1)+ ' +
         '		IF(isNull(m_ns.nota7) OR isNull(p_ns_7.nro_nota),0,1)+ ' +
         '		IF(isNull(m_ns.nota8) OR isNull(p_ns_8.nro_nota),0,1)+ ' +
         '		IF(isNull(m_ns.nota9) OR isNull(p_ns_9.nro_nota),0,1)+ ' +
         '		IF(isNull(m_ns.nota10) OR isNull(p_ns_10.nro_nota),0,1)+ ' +
         '		IF(isNull(m_ns.nota11) OR isNull(p_ns_11.nro_nota),0,1)+ ' +
         '		IF(isNull(m_ns.nota12) OR isNull(p_ns_12.nro_nota),0,1)+ ' +
         '		IF(isNull(m_ns.nota13) OR isNull(p_ns_13.nro_nota),0,1)+ ' +
         '		IF(isNull(m_ns.nota14) OR isNull(p_ns_14.nro_nota),0,1)+ ' +
         '		IF(isNull(m_ns.nota15) OR isNull(p_ns_15.nro_nota),0,1)+ ' +
         '		IF(isNull(m_ns.nota16) OR isNull(p_ns_16.nro_nota),0,1)+ ' +
         '		IF(isNull(m_ns.nota17) OR isNull(p_ns_17.nro_nota),0,1)+ ' +
         '		IF(isNull(m_ns.nota18) OR isNull(p_ns_18.nro_nota),0,1)+ ' +
         '		IF(isNull(m_ns.nota19) OR isNull(p_ns_19.nro_nota),0,1)+ ' +
         '		IF(isNull(m_ns.nota20) OR isNull(p_ns_20.nro_nota),0,1) ' +
         '	) ';

      SQL_CALCULAR_MEDIA_CURSO_GETCURSOS = ' ' +
         'SELECT              '+
         '   DISTINCT curso   '+
         'FROM                '+
         '   matriculas       '+
         'WHERE               '+
         '   codigoaluno = :aluno '+
         '   AND anosemestre = :anosem '+
         '   AND turma = :turma  '+
      ' ';


      SQL_CALCULAR_MEDIA_CURSO_CATEGORIAS = ' '+
         'SELECT                                         ' +
         '  f.curso,                                  ' +
         '	IFNULL(dc.ds_chave, "SEM_CATEGORIA") as chave,   ' +
         '	AVG(IFNULL(f.mediafinal, 0)) as media            ' +
         'FROM                                               ' +
         '	calc_media_curso cmc                             ' +
         '	INNER JOIN fichaindividual f ON (cmc.anosemestre = f.anosemestre AND cmc.turma = f.turma AND cmc.codigoaluno = f.codigoaluno AND cmc.curso = f.curso AND  cmc.disciplina = f.disciplina AND cmc.serie = f.serie) ' +
         '	INNER JOIN TURMAS t ON ( t.codigo = f.turma AND f.anosemestre = t.anosemestre ) '+
	      '  INNER JOIN GRADES g ON ( g.cd_grade = t.cd_grade	AND t.curso = g.CD_CURSO )   '+
	      '  INNER JOIN grades_disciplinas gd ON ( gd.CD_GRADE = g.CD_GRADE AND gd.CD_CURSO = f.curso AND gd.CD_DISCIPLINA = f.disciplina ) ' +
         '	LEFT JOIN disciplinas_categorias dc ON (gd.CD_DISCIPLINA_CATEGORIA=dc.cd_categoria) ' +
         'WHERE     ' +
         '	f.curso = :curso  ' +
         '	AND f.codigoaluno = :aluno       ' +
         '	AND f.mediafinal IS NOT NULL     ' +
         'GROUP BY                           ' +
         '	chave                 ' +
      ' ';

      SQL_CALCULAR_MEDIA_CURSO_CREDITOS = ' '+
         'SELECT ' +
         '  f.curso,  ' +
         '  IFNULL(dc.ds_chave, "SEM_CATEGORIA") as chave,  ' +
         '  SUM(IFNULL(IF(gd.nr_creditos_academicos = 12, f.mediafinal * 2, f.mediafinal), 0)) / '+ 
         '  SUM(IFNULL(IF(gd.nr_creditos_academicos = 12, 2, 1), 0)) as media            ' +
         'FROM                                               ' +
         '	calc_media_curso cmc                             ' +
         '	INNER JOIN fichaindividual f ON (cmc.anosemestre = f.anosemestre AND cmc.turma = f.turma AND cmc.codigoaluno = f.codigoaluno AND cmc.curso = f.curso AND  cmc.disciplina = f.disciplina AND cmc.serie = f.serie) ' +
         '	INNER JOIN TURMAS t ON ( t.codigo = f.turma AND f.anosemestre = t.anosemestre ) '+
	      '  INNER JOIN GRADES g ON ( g.cd_grade = t.cd_grade	AND t.curso = g.CD_CURSO ) ' +
	      '  INNER JOIN grades_disciplinas gd ON ( gd.CD_GRADE = g.CD_GRADE AND gd.CD_CURSO = f.curso AND gd.CD_DISCIPLINA = f.disciplina ) ' +
         '	LEFT JOIN disciplinas_categorias dc ON (gd.CD_DISCIPLINA_CATEGORIA=dc.cd_categoria) ' +
         'WHERE     ' +
         '	f.curso = :curso  ' +
         '	AND f.codigoaluno = :aluno       ' +
         '	AND f.mediafinal IS NOT NULL     ' +
         'GROUP BY                           ' +
         '	chave                 ' +
      ' ';


      SQL_CALCULAR_MEDIA_CURSO_ATUALIZAR = ' '+
         'UPDATE matriculas_curso SET nr_media_curso = $media$ WHERE cd_pessoa = :aluno AND cd_curso = :curso '+
      '';

      SQL_CALCULAR_MEDIA_CURSO_TEMP_TABLE_DELETE = ' '+
         ' DELETE FROM calc_media_curso;                      ';
      SQL_CALCULAR_MEDIA_CURSO_TEMP_TABLE_CREATE = ' ' + 
         ' CREATE TEMPORARY TABLE calc_media_curso (           '+
         '  anosemestre smallint(6) NOT NULL default "0",     '+
         '  turma varchar(15) NOT NULL,                       '+
         '  codigoaluno int(11) NOT NULL default "0",         '+
         '  curso varchar(15) NOT NULL,                       '+
         '  disciplina int(11) NOT NULL default "0",          '+
         '  serie smallint(6) NOT NULL default "0"            '+
         ');                                                  ';
      SQL_CALCULAR_MEDIA_CURSO_TEMP_TABLE_ALTER = ' '+
         ' ALTER TABLE calc_media_curso ADD PRIMARY KEY (anosemestre, turma, codigoaluno, curso ,disciplina, serie); '; 

      SQL_CALCULAR_MEDIA_CURSO_LOAD_FI = ' '+
         'INSERT IGNORE INTO calc_media_curso '+
         'SELECT                                                 '+
         '	DISTINCT fi.anosemestre, fi.turma, fi.codigoaluno, fi.curso, fi.disciplina, fi.serie '+
         'FROM                                                   '+
         '  matriculas_curso mc                                  '+
         '  INNER JOIN gradecurricular gc ON (mc.cd_grade = gc.cd_grade) AND (mc.cd_curso = gc.curso) AND (mc.nr_anosem_grade = gc.anosemestre) '+
         '	INNER JOIN fichaindividual fi ON (mc.cd_pessoa = fi.codigoaluno) AND (mc.cd_curso = fi.curso) AND (gc.serie = fi.serie) AND (gc.disciplina = fi.disciplina) '+
         '  INNER JOIN situacao s ON(fi.situacao = s.cd_situacao) '+
         'WHERE                                                  '+
         '	mc.cd_pessoa = :aluno                                '+
         '	and mc.cd_curso = :curso                             '+
         '  and s.cd_situacao_pai in (0,12)                      '+ 
      '';

      SQL_CALCULAR_MEDIA_CURSO_LOAD_FI_EQ = ' '+
         'INSERT IGNORE INTO calc_media_curso '+
         'SELECT                                                          '+
         '   fi_eq.anosemestre, fi_eq.turma, fi_eq.codigoaluno, fi_eq.curso, fi.disciplina, fi_eq.serie '+
         'FROM                                                            '+
         '   disciplinas_equiv_grupos deg                                 '+
         '   INNER JOIN disciplinas_equiv_interna dei ON (deg.cd_grupo1 = dei.cd_grupo)  '+
         '   INNER JOIN disciplinas_equiv_interna dei_eq ON (deg.cd_grupo2 = dei_eq.cd_grupo) '+
         '	 INNER JOIN fichaindividual fi_eq ON (fi_eq.curso = dei_eq.cd_curso AND fi_eq.disciplina = dei_eq.cd_disciplina) '+
         '   INNER JOIN situacao s ON(fi_eq.situacao = s.cd_situacao) '+
         '   LEFT OUTER JOIN fichaindividual fi ON (dei.cd_curso = fi.curso AND dei.cd_disciplina = fi.disciplina AND fi.codigoaluno = :aluno) '+
         'WHERE                                                            '+
         '	fi_eq.codigoaluno = :aluno                                     '+
         '	and fi.curso IS NULL                                           '+
         '	and dei.cd_curso = :curso                                      '+
         '  and s.cd_situacao_pai in (0,12)                                '+
      '';

implementation

end.

