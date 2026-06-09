const
   SSourceName = 'Unimestre Catracas';

   SSQLSelectCatracas = ''
      + 'SELECT '
      + '	c.CD_CATRACA, '
      + '	c.NM_CATRACA, '
      + '	c.DS_IP, '
      + '	c.NR_PORTA, '
      + '	c.DS_MAC_ADDRESS, '
      + '	c.DS_CONFIG, '
      + '	COALESCE(o.DS_CHAVE, m.DS_CHAVE) DS_CHAVE '
      + 'FROM '
      + '	ta_catraca c '
      + '		JOIN ta_catraca_modelo o ON '
      + '			(c.CD_CATRACA_MODELO = o.CD_CATRACA_MODELO) '
      + '		JOIN ta_catraca_marca m ON '
      + '			(o.CD_CATRACA_MARCA = m.CD_CATRACA_MARCA) '
      + 'WHERE '
      + '	c.SN_ATIVO = 1 ';

	SSQLSelectAccessType = ''
		+ 'SELECT '
		+ '	FCD_TA_CATRACA_GET_TIPO_ACESSO(?, ?) response '
		+ 'FROM '
		+ '	DUAL ';

   SSQLRecordAccess = ''
      + 'CALL SPX_TA_CATRACA_REGISTRA_ACESSO(?, ?, ?)';

   SSQLInsertEvent = ''
      + 'INSERT INTO ta_catraca_evento ( '
      + '	CD_CATRACA, '
      + '	CD_CATRACA_EVENTO_TIPO, '
      + '	CD_CATRACA_IDENTIFICACAO, '
      + '	DS_INFO '
      + ') VALUES ( '
      + '	?, '
      + '	(SELECT '
      + '		CD_CATRACA_EVENTO_TIPO '
      + '	FROM '
      + '		ta_catraca_evento_tipo '
      + '	WHERE '
      + '		DS_CHAVE = ?), '
      + '	(SELECT '
      + '		CD_CATRACA_IDENTIFICACAO '
      + '	FROM '
      + '		ta_catraca_identificacao '
      + '	WHERE '
      + '		NR_IDENTIFICACAO = ?), '
      + '	? '
      + ') ';
